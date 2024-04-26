*"* use this source file for your ABAP unit test classes
CLASS test_class DEFINITION FOR TESTING
                 RISK LEVEL HARMLESS
                 DURATION SHORT.

  PUBLIC SECTION.
    METHODS test_method FOR TESTING.

  PRIVATE SECTION.
    DATA class_being_tested TYPE REF TO zcl_lista2_atividade17.
ENDCLASS.


CLASS test_class IMPLEMENTATION.
  METHOD test_method.
    class_being_tested = NEW #( ).

    TYPES: BEGIN OF struct_type,
            field1 TYPE i,
            field2 TYPE i,
            field3 TYPE i,
            field4 TYPE i,
            field5 TYPE i,
          END OF struct_type.

    DATA test_struct TYPE struct_type.

    DATA(test_result) = class_being_tested->receive_struct(
                          struct = test_struct
                        ).

    DATA test_structure_exp TYPE struct_type.
    test_structure_exp-field1 = 1.
    test_structure_exp-field2 = 2.
    test_structure_exp-field3 = 3.

    cl_abap_unit_assert=>assert_equals(
          act = test_result
          exp = test_structure_exp ).
  ENDMETHOD.
ENDCLASS.
