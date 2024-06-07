CLASS z_cl_main DEFINITION PUBLIC.

  PUBLIC SECTION.
    TYPES: BEGIN OF struct_type,
            material_number TYPE matnr,
            quantity        TYPE menge13,
            uom             TYPE msehi,
            period          TYPE n LENGTH 1,
            date_from       TYPE dats,
            date_to         TYPE dats,
            origin_loc      TYPE ktext,
            destination_loc TYPE ktext,
            mot_description TYPE text40,
           END OF struct_type.

    METHODS constructor
      IMPORTING
        i_class_fill_header TYPE REF TO z_cl_fill_header OPTIONAL
        i_class_fill_item   TYPE REF TO z_cl_fill_item   OPTIONAL.

    METHODS execute
      IMPORTING
        i_data_struct TYPE struct_type
      RETURNING
        VALUE(return) TYPE z_cl_fill_item=>return_type.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA class_fill_header TYPE REF TO z_cl_fill_header.
    DATA class_fill_item   TYPE REF TO z_cl_fill_item.

    METHODS date_validation
      IMPORTING
        i_date_from TYPE dats
        i_date_to   TYPE dats
      RETURNING VALUE(return) TYPE abap_bool.
ENDCLASS.



CLASS z_cl_main IMPLEMENTATION.

  METHOD constructor.
    me->class_fill_header = COND #(
      WHEN i_class_fill_header IS BOUND
      THEN i_class_fill_header
      ELSE NEW #( )
    ).

    me->class_fill_item = COND #(
      WHEN i_class_fill_item IS BOUND
      THEN i_class_fill_item
      ELSE NEW #( )
    ).
  ENDMETHOD.

  METHOD execute.
   DATA(date_validation_error) = date_validation(
    i_date_from = i_data_struct-date_from
    i_date_to   = i_data_struct-date_to
   ).

   IF date_validation_error = abap_false.
    DATA(header_data) = NEW z_cl_fill_header( )->execute( i_data_struct ).

    return = NEW z_cl_fill_item( )->execute(
      i_header_uuid = header_data-header_uuid
      i_data_struct = i_data_struct
    ).
   ENDIF.
  ENDMETHOD.

  METHOD date_validation.
    IF i_date_to(4) > i_date_from(4).
      MESSAGE 'DATAS INVALIDAS' TYPE 'S' DISPLAY LIKE 'E'.
      return = abap_true.
    ELSEIF i_date_to(4) = i_date_from(4).

      IF i_date_to+4(2) < i_date_from+4(2).
        MESSAGE 'DATAS INVALIDAS' TYPE 'S' DISPLAY LIKE 'E'.
        return = abap_true.

      ELSEIF i_date_to+4(2) = i_date_from+4(2) AND i_date_to+6(2) < i_date_from+6(2).
        MESSAGE 'DATAS INVALIDAS' TYPE 'S' DISPLAY LIKE 'E'.
        return = abap_true.
      ENDIF.

    ELSE.
      MESSAGE 'SUCESSO' TYPE 'I' DISPLAY LIKE 'S'.
    ENDIF.
  ENDMETHOD.

ENDCLASS.
