*"* use this source file for your ABAP unit test classes
CLASS lcl_test_class DEFINITION FOR TESTING
                     RISK LEVEL HARMLESS
                     DURATION SHORT.

  PUBLIC SECTION.
    METHODS test_method FOR TESTING.

  PRIVATE SECTION.
    DATA class_being_tested TYPE REF TO zcl_lista3_atividade05_a.
ENDCLASS.

CLASS zcl_lista3_atividade05_a DEFINITION LOCAL FRIENDS lcl_test_class.

CLASS lcl_test_class IMPLEMENTATION.
  METHOD test_method.
    class_being_tested = NEW #( ).

    DATA(test_result) = class_being_tested->get_calc(
                          i_num1 = 2
                          i_num2 = 3
                        ).

    cl_abap_unit_assert=>assert_equals(
          act = test_result
          exp = 3 ).
  ENDMETHOD.
ENDCLASS.
