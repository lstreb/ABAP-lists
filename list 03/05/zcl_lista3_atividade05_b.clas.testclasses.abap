*"* use this source file for your ABAP unit test classes
CLASS ltd_db_calc DEFINITION FINAL FOR TESTING INHERITING FROM zcl_lista3_atividade05_a.
  PUBLIC SECTION.
    METHODS:
      get_calc REDEFINITION,
      set_calc
        IMPORTING
          i_calc_result TYPE i.

  PRIVATE SECTION.
    DATA calc_result TYPE i.
ENDCLASS.

CLASS ltd_db_calc IMPLEMENTATION.
  METHOD get_calc.
    return = me->calc_result.
  ENDMETHOD.

  METHOD set_calc.
    me->calc_result = i_calc_result.
  ENDMETHOD.

ENDCLASS.

CLASS test_class DEFINITION FOR TESTING
                 RISK LEVEL HARMLESS
                 DURATION SHORT.

  PUBLIC SECTION.
    METHODS test_method FOR TESTING.

  PRIVATE SECTION.
    DATA class_being_tested TYPE REF TO zcl_lista3_atividade05_b.
    DATA db_calc TYPE REF TO ltd_db_calc.

    METHODS setup.
ENDCLASS.

CLASS test_class IMPLEMENTATION.
  METHOD setup.
    db_calc = NEW ltd_db_calc( ).

    class_being_tested = NEW #(
      i_lista3_atividade05_a = db_calc
    ).
  ENDMETHOD.

  METHOD test_method.
    db_calc->set_calc(
      i_calc_result = 3
    ).

    DATA(test_result) = class_being_tested->class( ).

    cl_abap_unit_assert=>assert_equals(
          act = test_result
          exp = 1 ).
  ENDMETHOD.
ENDCLASS.
