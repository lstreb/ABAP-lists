CLASS zcl_lista2_atividade06 DEFINITION PUBLIC.

  PUBLIC SECTION.
    METHODS division
      IMPORTING
        i_num1 TYPE i
        i_num2 TYPE i
      RETURNING VALUE(result) TYPE float
      RAISING cx_abap_invalid_value.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lista2_atividade06 IMPLEMENTATION.
  METHOD division.
    IF i_num2 IS INITIAL.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.

    result = i_num1 / i_num2.
  ENDMETHOD.
ENDCLASS.
