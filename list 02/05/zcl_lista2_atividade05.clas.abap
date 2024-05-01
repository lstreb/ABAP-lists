CLASS zcl_lista2_atividade05 DEFINITION PUBLIC.

  PUBLIC SECTION.
    METHODS power
      IMPORTING
        i_num1 TYPE i
        i_num2 TYPE i
      RETURNING VALUE(result) TYPE int8.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lista2_atividade05 IMPLEMENTATION.
  METHOD power.
    result = ipow( base = i_num1 exp = i_num2 ).
  ENDMETHOD.
ENDCLASS.
