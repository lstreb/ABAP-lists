CLASS ltd_multiplier DEFINITION FINAL FOR TESTING INHERITING FROM z_cl_multiplier.
  PUBLIC SECTION.
    METHODS:
      execute REDEFINITION,
      set_multiplier
        IMPORTING
          i_multiplier TYPE i.

  PRIVATE SECTION.
    DATA multiplier TYPE i.
ENDCLASS.

CLASS ltd_multiplier IMPLEMENTATION.
  METHOD execute.
    return = me->multiplier.
  ENDMETHOD.

  METHOD set_multiplier.
    me->multiplier = i_multiplier.
  ENDMETHOD.
ENDCLASS.



CLASS ltc_test DEFINITION FOR TESTING
                    RISK LEVEL HARMLESS
                    DURATION SHORT.

  PUBLIC SECTION.
    METHODS test_p1 FOR TESTING.
    METHODS test_p2 FOR TESTING.
    METHODS test_p3 FOR TESTING.
    METHODS test_p4 FOR TESTING.
    METHODS test_p5 FOR TESTING.
    METHODS test_p6 FOR TESTING.

    METHODS test_change_month_p1 FOR TESTING.
    METHODS test_change_month_p2 FOR TESTING.
    METHODS test_change_month_p3 FOR TESTING.

    METHODS test_change_year_p1 FOR TESTING.
    METHODS test_change_year_p2 FOR TESTING.
    METHODS test_change_year_p3 FOR TESTING.
    METHODS test_change_year_p4 FOR TESTING.
    METHODS test_change_year_p5 FOR TESTING.

  PRIVATE SECTION.
    DATA class_test       TYPE REF TO z_cl_calc_dates.
    DATA class_multiplier TYPE REF TO ltd_multiplier.

    METHODS setup.
ENDCLASS.

CLASS ltc_test IMPLEMENTATION.
  METHOD setup.
    class_multiplier = NEW #( ).

    class_test = NEW #(
      i_multiplier = class_multiplier
    ).
  ENDMETHOD.

  METHOD test_p1.
    class_multiplier->set_multiplier( 1 ).

    DATA(act_table) = class_test->execute(
      i_dates_struct = VALUE #(
        date_from = '20230101'
        date_to   = '20231231'
      )
      i_periodicity = 1
    ).

    DATA exp_table TYPE z_cl_calc_dates=>table_of_dates.
    exp_table = VALUE #( (
        date_from = '20230101'
        date_to   = '20231231'
      )
    ).

    cl_abap_unit_assert=>assert_equals(
      act = act_table
      exp = exp_table
    ).
  ENDMETHOD.

  METHOD test_p2.
    class_multiplier->set_multiplier( 5 ).

    DATA(act_table) = class_test->execute(
      i_dates_struct = VALUE #(
        date_from = '20230101'
        date_to   = '20230105'
      )
      i_periodicity = 2
    ).

    DATA exp_table TYPE z_cl_calc_dates=>table_of_dates.
    exp_table = VALUE #( (
        date_from = '20230101'
        date_to   = '20230101'
      ) (
        date_from = '20230102'
        date_to   = '20230102'
      ) (
        date_from = '20230103'
        date_to   = '20230103'
      ) (
        date_from = '20230104'
        date_to   = '20230104'
      ) (
        date_from = '20230105'
        date_to   = '20230105'
      ) ).

    cl_abap_unit_assert=>assert_equals(
      act = act_table
      exp = exp_table
    ).
  ENDMETHOD.

  METHOD test_p3.
    class_multiplier->set_multiplier( 2 ).

    DATA(act_table) = class_test->execute(
      i_dates_struct = VALUE #(
        date_from = '20230101'
        date_to   = '20230108'
      )
      i_periodicity = 3
    ).

    DATA exp_table TYPE z_cl_calc_dates=>table_of_dates.
    exp_table = VALUE #( (
        date_from = '20230101'
        date_to   = '20230107'
      ) (
        date_from = '20230108'
        date_to   = '20230114'
      ) ).

      cl_abap_unit_assert=>assert_equals(
      act = act_table
      exp = exp_table
    ).
  ENDMETHOD.

  METHOD test_p4.
    class_multiplier->set_multiplier( 12 ).

    DATA(act_table) = class_test->execute(
      i_dates_struct = VALUE #(
        date_from = '20230101'
        date_to   = '20231230'
      )
      i_periodicity = 4
    ).

    DATA exp_table TYPE z_cl_calc_dates=>table_of_dates.
    exp_table = VALUE #( (
        date_from = '20230101'
        date_to   = '20230131'
      ) (
        date_from = '20230201'
        date_to   = '20230228'
      ) (
        date_from = '20230301'
        date_to   = '20230331'
      ) (
        date_from = '20230401'
        date_to   = '20230430'
      ) (
        date_from = '20230501'
        date_to   = '20230531'
      ) (
        date_from = '20230601'
        date_to   = '20230630'
      ) (
        date_from = '20230701'
        date_to   = '20230731'
      ) (
        date_from = '20230801'
        date_to   = '20230831'
      ) (
        date_from = '20230901'
        date_to   = '20230930'
      ) (
        date_from = '20231001'
        date_to   = '20231031'
      ) (
        date_from = '20231101'
        date_to   = '20231130'
      ) (
        date_from = '20231201'
        date_to   = '20231231'
      ) ).

      cl_abap_unit_assert=>assert_equals(
        act = act_table
        exp = exp_table
      ).
  ENDMETHOD.

  METHOD test_p5.
    class_multiplier->set_multiplier( 3 ).

    DATA(act_table) = class_test->execute(
      i_dates_struct = VALUE #(
        date_from = '20230101'
        date_to   = '20230701'
      )
      i_periodicity = 5
    ).

    DATA exp_table TYPE z_cl_calc_dates=>table_of_dates.
    exp_table = VALUE #( (
        date_from = '20230101'
        date_to   = '20230331'
      ) (
        date_from = '20230401'
        date_to   = '20230630'
      ) (
        date_from = '20230701'
        date_to   = '20230930'
      ) ).

    cl_abap_unit_assert=>assert_equals(
        act = act_table
        exp = exp_table
      ).
  ENDMETHOD.

  METHOD test_p6.
    class_multiplier->set_multiplier( 2 ).

    DATA(act_table) = class_test->execute(
      i_dates_struct = VALUE #(
        date_from = '20230101'
        date_to   = '20241230'
      )
      i_periodicity = 6
    ).

    DATA exp_table TYPE z_cl_calc_dates=>table_of_dates.
    exp_table = VALUE #( (
        date_from = '20230101'
        date_to   = '20231231'
      ) (
        date_from = '20240101'
        date_to   = '20241231'
      ) ).

      cl_abap_unit_assert=>assert_equals(
      act = act_table
      exp = exp_table
    ).
  ENDMETHOD.

  METHOD test_change_month_p1.
    class_multiplier->set_multiplier( 1 ).

    DATA(act_table) = class_test->execute(
      i_dates_struct = VALUE #(
        date_from = '20230130'
        date_to   = '20230203'
      )
      i_periodicity = 1
    ).

    DATA exp_table TYPE z_cl_calc_dates=>table_of_dates.
    exp_table = VALUE #( (
        date_from = '20230130'
        date_to   = '20230203'
      ) ).

    cl_abap_unit_assert=>assert_equals(
      act = act_table
      exp = exp_table
    ).
  ENDMETHOD.

  METHOD test_change_month_p2.
    class_multiplier->set_multiplier( 5 ).

    DATA(act_table) = class_test->execute(
      i_dates_struct = VALUE #(
        date_from = '20230130'
        date_to   = '20230203'
      )
      i_periodicity = 2
    ).

    DATA exp_table TYPE z_cl_calc_dates=>table_of_dates.
    exp_table = VALUE #( (
        date_from = '20230130'
        date_to   = '20230130'
      ) (
        date_from = '20230131'
        date_to   = '20230131'
      ) (
        date_from = '20230201'
        date_to   = '20230201'
      ) (
        date_from = '20230202'
        date_to   = '20230202'
      ) (
        date_from = '20230203'
        date_to   = '20230203'
      ) ).

    cl_abap_unit_assert=>assert_equals(
      act = act_table
      exp = exp_table
    ).
  ENDMETHOD.

  METHOD test_change_month_p3.
    class_multiplier->set_multiplier( 2 ).

    DATA(act_table) = class_test->execute(
      i_dates_struct = VALUE #(
        date_from = '20230130'
        date_to   = '20230206'
      )
      i_periodicity = 3
    ).

    DATA exp_table TYPE z_cl_calc_dates=>table_of_dates.
    exp_table = VALUE #( (
        date_from = '20230130'
        date_to   = '20230205'
      ) (
        date_from = '20230206'
        date_to   = '20230212'
      ) ).

      cl_abap_unit_assert=>assert_equals(
      act = act_table
      exp = exp_table
    ).
  ENDMETHOD.

  METHOD test_change_year_p1.
    class_multiplier->set_multiplier( 1 ).

    DATA(act_table) = class_test->execute(
      i_dates_struct = VALUE #(
        date_from = '20230130'
        date_to   = '20240203'
      )
      i_periodicity = 1
    ).

    DATA exp_table TYPE z_cl_calc_dates=>table_of_dates.
    exp_table = VALUE #( (
        date_from = '20230130'
        date_to   = '20240203'
      ) ).

    cl_abap_unit_assert=>assert_equals(
      act = act_table
      exp = exp_table
    ).
  ENDMETHOD.

  METHOD test_change_year_p2.
    class_multiplier->set_multiplier( 5 ).

    DATA(act_table) = class_test->execute(
      i_dates_struct = VALUE #(
        date_from = '20231230'
        date_to   = '20240103'
      )
      i_periodicity = 2
    ).

    DATA exp_table TYPE z_cl_calc_dates=>table_of_dates.
    exp_table = VALUE #( (
        date_from = '20231230'
        date_to   = '20231230'
      ) (
        date_from = '20231231'
        date_to   = '20231231'
      ) (
        date_from = '20240101'
        date_to   = '20240101'
      ) (
        date_from = '20240102'
        date_to   = '20240102'
      ) (
        date_from = '20240103'
        date_to   = '20240103'
      ) ).

    cl_abap_unit_assert=>assert_equals(
      act = act_table
      exp = exp_table
    ).
  ENDMETHOD.

  METHOD test_change_year_p3.
    class_multiplier->set_multiplier( 2 ).

    DATA(act_table) = class_test->execute(
      i_dates_struct = VALUE #(
        date_from = '20231230'
        date_to   = '20240106'
      )
      i_periodicity = 3
    ).

    DATA exp_table TYPE z_cl_calc_dates=>table_of_dates.
    exp_table = VALUE #( (
        date_from = '20231230'
        date_to   = '20240105'
      ) (
        date_from = '20240106'
        date_to   = '20240112'
      ) ).

      cl_abap_unit_assert=>assert_equals(
      act = act_table
      exp = exp_table
    ).
  ENDMETHOD.

  METHOD test_change_year_p4.
    class_multiplier->set_multiplier( 2 ).

    DATA(act_table) = class_test->execute(
      i_dates_struct = VALUE #(
        date_from = '20231201'
        date_to   = '20240131'
      )
      i_periodicity = 4
    ).

    DATA exp_table TYPE z_cl_calc_dates=>table_of_dates.
    exp_table = VALUE #( (
        date_from = '20231201'
        date_to   = '20231231'
      ) (
        date_from = '20240101'
        date_to   = '20240131'
      ) ).

      cl_abap_unit_assert=>assert_equals(
      act = act_table
      exp = exp_table
    ).
  ENDMETHOD.

  METHOD test_change_year_p5.
    class_multiplier->set_multiplier( 2 ).

    DATA(act_table) = class_test->execute(
      i_dates_struct = VALUE #(
        date_from = '20231201'
        date_to   = '20240501'
      )
      i_periodicity = 5
    ).

    DATA exp_table TYPE z_cl_calc_dates=>table_of_dates.
    exp_table = VALUE #( (
        date_from = '20231201'
        date_to   = '20240229'
      ) (
        date_from = '20240301'
        date_to   = '20240531'
      ) ).

      cl_abap_unit_assert=>assert_equals(
      act = act_table
      exp = exp_table
    ).
  ENDMETHOD.
ENDCLASS.
