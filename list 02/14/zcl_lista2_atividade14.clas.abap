CLASS zcl_lista2_atividade14 DEFINITION PUBLIC.

  PUBLIC SECTION.
    TYPES: BEGIN OF struct_type,
            field1 TYPE i,
            field2 TYPE string,
            field3 TYPE c LENGTH 5,
            field4 TYPE d,
            field5 TYPE t,
           END OF struct_type.

    METHODS component_count
      IMPORTING
        struct TYPE struct_type
      RETURNING VALUE(result) TYPE int8.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lista2_atividade14 IMPLEMENTATION.
  METHOD component_count.

    IF struct-field1 IS INITIAL.
      result = result + 1.
    ENDIF.

    IF struct-field2 IS INITIAL.
      result = result + 1.
    ENDIF.

    IF struct-field3 IS INITIAL.
      result = result + 1.
    ENDIF.

    IF struct-field4 IS INITIAL.
      result = result + 1.
    ENDIF.

    IF struct-field5 IS INITIAL.
      result = result + 1.
    ENDIF.

  ENDMETHOD.
ENDCLASS.
