*"* use this source file for your ABAP unit test classes
CLASS test_class DEFINITION FOR TESTING
                 RISK LEVEL HARMLESS
                 DURATION SHORT.

  PUBLIC SECTION.
    METHODS test_method FOR TESTING.

  PRIVATE SECTION.
    DATA class_being_tested TYPE REF TO zcl_lista2_atividade01.
ENDCLASS.

CLASS zcl_lista2_atividade01 DEFINITION LOCAL FRIENDS test_class.

CLASS test_class IMPLEMENTATION.
  METHOD test_method.
    class_being_tested = NEW #( ).

    DATA(test_result) = class_being_tested->calculate(
                          i_num1 = 2
                          i_num2 = 3
                          i_num3 = 5
                        ).

    DATA table_content TYPE string_table.
    APPEND |--------------------------| TO table_content.
    APPEND |Número 1: 2| TO table_content.
    APPEND |Número 2: 3| TO table_content.
    APPEND |Número 3: 5| TO table_content.
    APPEND |2 + 3 * 5 = 17| TO table_content.
    APPEND |--------------------------| TO table_content.

    cl_abap_unit_assert=>assert_equals(
          act = test_result
          exp = table_content ).
  ENDMETHOD.
ENDCLASS.
