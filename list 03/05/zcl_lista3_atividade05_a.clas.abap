CLASS zcl_lista3_atividade05_a DEFINITION PUBLIC.

  PUBLIC SECTION.
    METHODS get_calc
      IMPORTING
        i_num1 TYPE i
        i_num2 TYPE i
      RETURNING VALUE(return) TYPE int8.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lista3_atividade05_a IMPLEMENTATION.

  METHOD get_calc.
    return = return * i_num1 + i_num2.
  ENDMETHOD.

ENDCLASS.
