*"* use this source file for your ABAP unit test classes
CLASS test_class DEFINITION FOR TESTING
                 RISK LEVEL HARMLESS
                 DURATION SHORT.

  PUBLIC SECTION.
    METHODS test_method FOR TESTING.

  PRIVATE SECTION.
    DATA class_being_tested TYPE REF TO zcl_lista2_atividade14.
ENDCLASS.


CLASS test_class IMPLEMENTATION.
  METHOD test_method.
    class_being_tested = NEW #( ).

    DATA: BEGIN OF test_struct,
            field1 TYPE i VALUE 1,
            field2 TYPE string,
            field3 TYPE c LENGTH 5,
            field4 TYPE d VALUE '20241103',
            field5 TYPE t,
           END OF test_struct.

    DATA(test_result) = class_being_tested->component_count(
                          struct = test_struct
                        ).

    cl_abap_unit_assert=>assert_equals(
          act = test_result
          exp = 3 ).
  ENDMETHOD.
ENDCLASS.
