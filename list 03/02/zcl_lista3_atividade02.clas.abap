CLASS zcl_lista3_atividade02 DEFINITION PUBLIC.

  PUBLIC SECTION.
    TYPES: BEGIN OF struct_type,
            matnr TYPE matnr,
            mtart TYPE mtart,
           END OF struct_type.

    TYPES table_of_struct_type TYPE STANDARD TABLE OF struct_type WITH KEY matnr.

    TYPES table_type TYPE STANDARD TABLE OF mara WITH KEY matnr.

    METHODS select_fields
      RETURNING VALUE(r_fields) TYPE table_of_struct_type.
  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lista3_atividade02 IMPLEMENTATION.

  METHOD select_fields.

    SELECT
      FROM mara
      FIELDS matnr, mtart
      INTO TABLE @r_fields.
    "ENDSELECT.

  ENDMETHOD.

ENDCLASS.
