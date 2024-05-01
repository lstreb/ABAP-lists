*"* use this source file for your ABAP unit test classes
CLASS test_class DEFINITION FOR TESTING
                 RISK LEVEL HARMLESS
                 DURATION SHORT.

  PUBLIC SECTION.
    TYPES: BEGIN OF struct_type,
            time1_user TYPE t,
            time2_brazil TYPE t,
            time3_uk TYPE t,
            time4_japan TYPE t,
            time5_chile TYPE t,
            time6_egypt TYPE t,
           END OF struct_type.

    METHODS test_method FOR TESTING.

  PRIVATE SECTION.
    DATA class_being_tested TYPE REF TO zcl_lista2_atividade10.
ENDCLASS.


CLASS test_class IMPLEMENTATION.
  METHOD test_method.
    class_being_tested = NEW #( ).

    DATA test_structure_exp TYPE struct_type.

    DATA(test_result) = class_being_tested->calculate_time_zones(
                          i_time = sy-timlo
                        ).

    test_structure_exp-time1_user = sy-timlo.
    test_structure_exp-time2_brazil = sy-timlo - 18000.
    test_structure_exp-time3_uk = sy-timlo - 3600.
    test_structure_exp-time4_japan = sy-timlo + 25200.
    test_structure_exp-time5_chile = sy-timlo - 21600.
    test_structure_exp-time6_egypt = sy-timlo.

    cl_abap_unit_assert=>assert_equals(
          act = test_result
          exp = test_structure_exp ).
  ENDMETHOD.
ENDCLASS.
