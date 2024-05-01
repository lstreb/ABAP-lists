CLASS zcl_lista2_atividade17 DEFINITION PUBLIC.

  PUBLIC SECTION.
  TYPES: BEGIN OF struct_type,
            field1 TYPE i,
            field2 TYPE i,
            field3 TYPE i,
            field4 TYPE i,
            field5 TYPE i,
           END OF struct_type.

    METHODS receive_struct
      IMPORTING
        struct TYPE struct_type
      RETURNING VALUE(result) TYPE struct_type.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_lista2_atividade17 IMPLEMENTATION.
  METHOD receive_struct.
    result = struct.

    result-field1 = 1.
    result-field2 = 2.
    result-field3 = 3.
  ENDMETHOD.
ENDCLASS.
