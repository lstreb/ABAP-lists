*"* use this source file for your ABAP unit test classes
CLASS test_class DEFINITION FOR TESTING
                 RISK LEVEL HARMLESS
                 DURATION SHORT.

  PUBLIC SECTION.
    METHODS test_method FOR TESTING.
    METHODS test_method_empty FOR TESTING.

  PRIVATE SECTION.
    DATA class_being_tested TYPE REF TO zcl_lista2_atividade07.
ENDCLASS.

CLASS test_class IMPLEMENTATION.
  METHOD test_method.
    class_being_tested = NEW #( ).

    TRY.
    DATA(test_result) = class_being_tested->vowel_count(
                          i_string = 'Laura'
                        ).

    CATCH cx_abap_invalid_value.
      RETURN.
    ENDTRY.

    cl_abap_unit_assert=>assert_equals(
          act = test_result
          exp = 3 ).
  ENDMETHOD.

METHOD test_method_empty.
    class_being_tested = NEW #( ).

    TRY.
    DATA(test_result) = class_being_tested->vowel_count(
                          i_string = ''
                        ).

      cl_abap_unit_assert=>assert_true(
          act              =  '' ).

    CATCH cx_abap_invalid_value.
      cl_abap_unit_assert=>assert_true(
          act              =  'X' ).
    ENDTRY.
  ENDMETHOD.
ENDCLASS.
