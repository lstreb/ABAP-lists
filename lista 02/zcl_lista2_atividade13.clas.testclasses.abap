*"* use this source file for your ABAP unit test classes
CLASS test_class DEFINITION FOR TESTING
                 RISK LEVEL HARMLESS
                 DURATION SHORT.

  PUBLIC SECTION.
    METHODS test_method FOR TESTING.

  PRIVATE SECTION.
    DATA class_being_tested TYPE REF TO zcl_lista2_atividade13.
ENDCLASS.


CLASS test_class IMPLEMENTATION.
  METHOD test_method.
    class_being_tested = NEW #( ).

    DATA table_content TYPE string_table.
    APPEND 8 TO table_content.
    APPEND 16 TO table_content.
    APPEND 24 TO table_content.
    APPEND 32 TO table_content.
    APPEND 40 TO table_content.

    DATA(test_result) = class_being_tested->count_range(
                          min_number = 8
                          max_number = 40
                        ).

    cl_abap_unit_assert=>assert_equals(
          act = test_result
          exp = table_content ).
  ENDMETHOD.
ENDCLASS.
