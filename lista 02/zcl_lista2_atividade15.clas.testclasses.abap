*"* use this source file for your ABAP unit test classes
CLASS test_class DEFINITION FOR TESTING
                 RISK LEVEL HARMLESS
                 DURATION SHORT.

  PUBLIC SECTION.
    TYPES: BEGIN OF struct_type,
            char1 TYPE c LENGTH 1,
            char2 TYPE c LENGTH 1,
            int1 TYPE i,
            int2 TYPE i,
           END OF struct_type.

    METHODS test_method_if_Iodd_Ceven FOR TESTING.
    METHODS test_method_if_Ieven_Codd FOR TESTING.

    METHODS test_method_if_both_even FOR TESTING.
    METHODS test_method_if_both_odd FOR TESTING.

  PRIVATE SECTION.
    DATA class_being_tested TYPE REF TO zcl_lista2_atividade15.
ENDCLASS.


CLASS test_class IMPLEMENTATION.
  METHOD test_method_if_Iodd_Ceven.
    class_being_tested = NEW #( ).

    DATA test_struct TYPE struct_type.
    DATA test_structure_exp TYPE struct_type.

    test_struct-char1 = 'a'.
    test_struct-char2 = 'a'.
    test_struct-int1 = 7.
    test_struct-int2 = 2.

    DATA(test_result) = class_being_tested->receive_struct(
                          i_struct = test_struct
                        ).

    cl_abap_unit_assert=>assert_equals(
          act = test_result
          exp = test_structure_exp ).
  ENDMETHOD.


  METHOD test_method_if_Ieven_Codd.
    class_being_tested = NEW #( ).

    DATA test_struct TYPE struct_type.

    test_struct-char1 = 'a'.
    test_struct-char2 = 'b'.
    test_struct-int1 = 3.
    test_struct-int2 = 3.

    DATA(test_result) = class_being_tested->receive_struct(
                          i_struct = test_struct
                        ).

    cl_abap_unit_assert=>assert_equals(
          act = test_result
          exp = test_struct ).
  ENDMETHOD.


  METHOD test_method_if_both_even.
    class_being_tested = NEW #( ).

    DATA test_struct TYPE struct_type.
    DATA test_structure_exp TYPE struct_type.

    test_struct-char1 = 'a'.
    test_struct-char2 = 'a'.
    test_struct-int1 = 3.
    test_struct-int2 = 3.

    DATA(test_result) = class_being_tested->receive_struct(
                          i_struct = test_struct
                        ).

    test_structure_exp = test_struct.

    CLEAR test_structure_exp-int1.
    CLEAR test_structure_exp-int2.

    cl_abap_unit_assert=>assert_equals(
          act = test_result
          exp = test_structure_exp ).
  ENDMETHOD.


  METHOD test_method_if_both_odd.
    class_being_tested = NEW #( ).

    DATA test_struct TYPE struct_type.
    DATA test_structure_exp TYPE struct_type.

    test_struct-char1 = 'a'.
    test_struct-char2 = 'b'.
    test_struct-int1 = 3.
    test_struct-int2 = 2.

    DATA(test_result) = class_being_tested->receive_struct(
                          i_struct = test_struct
                        ).

    test_structure_exp-int1 = test_struct-int1.
    test_structure_exp-int2 = test_struct-int2.

    cl_abap_unit_assert=>assert_equals(
          act = test_result
          exp = test_structure_exp ).
  ENDMETHOD.
ENDCLASS.
