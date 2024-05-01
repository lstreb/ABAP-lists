CLASS zcl_lista2_atividade01 DEFINITION PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun .

    METHODS calculate
      IMPORTING
        i_num1 TYPE i
        i_num2 TYPE i
        i_num3 TYPE i
      RETURNING VALUE(r_output) TYPE string_table.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA result TYPE i.
ENDCLASS.



CLASS zcl_lista2_atividade01 IMPLEMENTATION.

  METHOD calculate.
    result = i_num1 + i_num2 * i_num3.
    APPEND |--------------------------| TO r_output.
    APPEND |Número 1: { i_num1 }| TO r_output.
    APPEND |Número 2: { i_num2 }| TO r_output.
    APPEND |Número 3: { i_num3 }| TO r_output.
    APPEND |{ i_num1 } + { i_num2 } * { i_num3 } = { result }| TO r_output.
    APPEND |--------------------------| TO r_output.
  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.
    out->write(
      data = calculate(
        i_num1 = 2
        i_num2 = 3
        i_num3 = 5
      )
      name = ' '
    ).
  ENDMETHOD.
ENDCLASS.
