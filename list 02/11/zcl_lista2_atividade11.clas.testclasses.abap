*"* use this source file for your ABAP unit test classes
CLASS test_class DEFINITION FOR TESTING
                 RISK LEVEL HARMLESS
                 DURATION SHORT.

  PUBLIC SECTION.
    METHODS test_method FOR TESTING.

  PRIVATE SECTION.
    DATA class_being_tested TYPE REF TO zcl_lista2_atividade11.
ENDCLASS.

CLASS test_class IMPLEMENTATION.
  METHOD test_method.
    class_being_tested = NEW #( ).

    DATA(test_result) = class_being_tested->vowel_count(
                          i_string = sy-uname
                        ).

    cl_abap_unit_assert=>assert_equals(
          act = test_result
          exp = 4 ).
  ENDMETHOD.
ENDCLASS.
