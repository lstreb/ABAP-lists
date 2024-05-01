*"* use this source file for your ABAP unit test classes
CLASS test_class DEFINITION FOR TESTING
                 RISK LEVEL HARMLESS
                 DURATION SHORT.

  PUBLIC SECTION.
    METHODS test_method FOR TESTING.

  PRIVATE SECTION.
    DATA class_being_tested TYPE REF TO zcl_lista2_atividade16.
ENDCLASS.


CLASS test_class IMPLEMENTATION.
  METHOD test_method.
    class_being_tested = NEW #( ).

    DATA table_content TYPE string_table.
    APPEND |Hello,| TO table_content.
    APPEND |World| TO table_content.

    DATA(test_result) = class_being_tested->concatenates_lines(
                          internal_table = table_content
                        ).

    cl_abap_unit_assert=>assert_equals(
          act = test_result
          exp = 'Hello, World' ).
  ENDMETHOD.
ENDCLASS.
