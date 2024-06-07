CLASS ltc_test_multiplier DEFINITION FOR TESTING
                          RISK LEVEL HARMLESS
                          DURATION SHORT.

  PUBLIC SECTION.
    METHODS test_execute_1 FOR TESTING.
    METHODS test_execute_2 FOR TESTING.
    METHODS test_execute_3 FOR TESTING.
    METHODS test_execute_4 FOR TESTING.
    METHODS test_execute_5 FOR TESTING.
    METHODS test_execute_6 FOR TESTING.

  PRIVATE SECTION.
    DATA class_multiplier TYPE REF TO z_cl_multiplier.

    METHODS setup.
ENDCLASS.

CLASS ltc_test_multiplier IMPLEMENTATION.
  METHOD setup.
    class_multiplier = NEW #( ).
  ENDMETHOD.

  "per contract
  METHOD test_execute_1.
    DATA(test_result) = class_multiplier->execute(
      i_date_from   = '20180101'
      i_date_to     = '20180131'
      i_periodicity = 1
    ).

    cl_abap_unit_assert=>assert_equals(
      act = test_result
      exp = 1
    ).
  ENDMETHOD.

  "per day
  METHOD test_execute_2.
    DATA(test_result) = class_multiplier->execute(
      i_date_from   = '20180101'
      i_date_to     = '20180131'
      i_periodicity = 2
    ).

    cl_abap_unit_assert=>assert_equals(
      act = test_result
      exp = 31
    ).
  ENDMETHOD.

  "per calendar 7 days
  METHOD test_execute_3.
    DATA(test_result) = class_multiplier->execute(
      i_date_from   = '20180101'
      i_date_to     = '20180108'
      i_periodicity = 3
    ).

    cl_abap_unit_assert=>assert_equals(
      act = test_result
      exp = 2
    ).
  ENDMETHOD.

  "per calendar month
  METHOD test_execute_4.
    DATA(test_result) = class_multiplier->execute(
      i_date_from   = '20180101'
      i_date_to     = '20181230'
      i_periodicity = 4
    ).

    cl_abap_unit_assert=>assert_equals(
      act = test_result
      exp = 12
    ).
  ENDMETHOD.

  "per calendar 3 months
  METHOD test_execute_5.
    DATA(test_result) = class_multiplier->execute(
      i_date_from   = '20180101'
      i_date_to     = '20180701'
      i_periodicity = 5
    ).

    cl_abap_unit_assert=>assert_equals(
      act = test_result
      exp = 3
    ).
  ENDMETHOD.

  "per calendar year
  METHOD test_execute_6.
    DATA(test_result) = class_multiplier->execute(
      i_date_from   = '20180101'
      i_date_to     = '20191230'
      i_periodicity = 6
    ).

    cl_abap_unit_assert=>assert_equals(
      act = test_result
      exp = 2
    ).
  ENDMETHOD.
ENDCLASS.
