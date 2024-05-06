CLASS zcl_lista3_atividade05_b DEFINITION PUBLIC.

  PUBLIC SECTION.
    METHODS constructor
      IMPORTING
        i_lista3_atividade05_a TYPE REF TO zcl_lista3_atividade05_a OPTIONAL.

    METHODS class
      RETURNING VALUE(return) TYPE i.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA lista3_atividade05_a TYPE REF TO zcl_lista3_atividade05_a.
ENDCLASS.



CLASS zcl_lista3_atividade05_b IMPLEMENTATION.

  METHOD constructor.
    me->lista3_atividade05_a = COND #(
      WHEN i_lista3_atividade05_a IS BOUND
      THEN i_lista3_atividade05_a
      ELSE NEW #( )
    ).
  ENDMETHOD.

  METHOD class.
    DATA calc_result TYPE i.

    calc_result = me->lista3_atividade05_a->get_calc(
      i_num1 = 2
      i_num2 = 3
    ).

    IF calc_result IS NOT INITIAL.
      return = 1.
    ENDIF.

  ENDMETHOD.

ENDCLASS.
