CLASS zcl_lista2_atividade03 DEFINITION PUBLIC.

  PUBLIC SECTION.
    METHODS subtraction
      IMPORTING
        i_num1 TYPE i
        i_num2 TYPE i
      RETURNING VALUE(result) TYPE int8.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lista2_atividade03 IMPLEMENTATION.
  METHOD subtraction.
    result = i_num1 - i_num2.
  ENDMETHOD.
ENDCLASS.
