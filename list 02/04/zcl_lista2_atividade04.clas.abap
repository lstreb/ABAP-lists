CLASS zcl_lista2_atividade04 DEFINITION PUBLIC.

  PUBLIC SECTION.
    METHODS multiplication
      IMPORTING
        i_num1 TYPE i
        i_num2 TYPE i
      RETURNING VALUE(result) TYPE int8.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lista2_atividade04 IMPLEMENTATION.
  METHOD multiplication.
    result = i_num1 * i_num2.
  ENDMETHOD.
ENDCLASS.
