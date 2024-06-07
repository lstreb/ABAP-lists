CLASS z_cl_calc_dates DEFINITION PUBLIC.

  PUBLIC SECTION.
    TYPES: BEGIN OF date_struct,
            date_from TYPE dats,
            date_to   TYPE dats,
           END OF date_struct.

    TYPES table_of_dates TYPE TABLE OF date_struct WITH EMPTY KEY.

    METHODS execute
      IMPORTING
        i_dates_struct TYPE date_struct
        i_periodicity  TYPE n
      RETURNING
        VALUE(return) TYPE table_of_dates.

    METHODS first_calculate_dates
      IMPORTING
        i_dates       TYPE date_struct
        i_periodicity TYPE n
      RETURNING
        VALUE(return) TYPE date_struct.

    METHODS calculate_dates
      IMPORTING
        i_dates       TYPE date_struct
        i_periodicity TYPE n
      RETURNING
        VALUE(return) TYPE date_struct.

    METHODS constructor
      IMPORTING
        i_multiplier TYPE REF TO z_cl_multiplier OPTIONAL.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA multiplier TYPE REF TO z_cl_multiplier.

    METHODS date_to_calc
      IMPORTING
        i_periodicity TYPE n
        i_dates       TYPE date_struct
      RETURNING
        VALUE(return) TYPE dats.

    METHODS is_leap_year
      IMPORTING
        i_year TYPE n
      RETURNING
        VALUE(return) TYPE abap_bool.

    METHODS days_in_month
      IMPORTING
        i_date TYPE dats
      RETURNING
        VALUE(return) TYPE i.

    METHODS date_validations
      IMPORTING
        i_dates TYPE dats
      RETURNING
        VALUE(return) TYPE dats.
ENDCLASS.



CLASS z_cl_calc_dates IMPLEMENTATION.

  METHOD constructor.
    me->multiplier = COND #(
      WHEN i_multiplier IS BOUND
      THEN i_multiplier
      ELSE NEW #( )
    ).
  ENDMETHOD.

  METHOD execute.
    DATA(period_mult) = me->multiplier->execute(
      i_date_from   = i_dates_struct-date_from
      i_date_to     = i_dates_struct-date_to
      i_periodicity = i_periodicity
    ).

    DATA(dates) = first_calculate_dates(
      i_dates       = i_dates_struct
      i_periodicity = i_periodicity
    ).
    APPEND dates TO return.

    IF period_mult > 1.
      DO period_mult - 1 TIMES.

        dates = calculate_dates(
          i_dates       = dates
          i_periodicity = i_periodicity
        ).
        APPEND dates TO return.

      ENDDO.
    ENDIF.
  ENDMETHOD.

  METHOD first_calculate_dates.
    return = i_dates.

    CASE i_periodicity.
      WHEN 2.
        return-date_to = i_dates-date_from.

      WHEN 3.
        return-date_to = date_to_calc(
          i_dates       = return
          i_periodicity = 3
        ).

      WHEN 4.
        return-date_to(4) = return-date_from(4).
        return-date_to = date_to_calc(
          i_dates       = return
          i_periodicity = 4
        ).

      WHEN 5.
        return-date_to(4) = return-date_from(4).
        return-date_to+4(2) = i_dates-date_from+4(2) + 2.
        return-date_to = date_validations( return-date_to ).
        return-date_to+6(2) = days_in_month( return-date_to ).

      WHEN 6.
        return-date_to = date_to_calc(
          i_dates       = return
          i_periodicity = 6
        ).
    ENDCASE.

    return-date_to = date_validations( return-date_to ).
    return-date_from = date_validations( return-date_from ).
  ENDMETHOD.

  METHOD calculate_dates.
    DATA return_date_from TYPE dats.
    return = i_dates.

    CASE i_periodicity.
      WHEN 2.
        return-date_to+6(2) += 1.
        return-date_from = return-date_to.

      WHEN 3.
        return-date_from+6(2) += 7.
        return-date_to = date_to_calc(
          i_dates       = return
          i_periodicity = 3
        ).

      WHEN 4.
        return-date_from+4(2) += 1.
        return-date_to = date_to_calc(
          i_dates       = return
          i_periodicity = 4
        ).

      WHEN 5.
        return-date_to(4)   = return-date_from(4).
        return-date_from+4(2) += 3.
        return-date_to+4(2) = return-date_from+4(2) + 2.
        return-date_to+6(2) = days_in_month( return-date_to ).

      WHEN 6.
        return-date_from(4) += 1.
        return-date_to = date_to_calc(
          i_dates       = return
          i_periodicity = 6
        ).
    ENDCASE.

    return-date_to = date_validations( return-date_to ).
    return-date_from = date_validations( return-date_from ).
  ENDMETHOD.

  METHOD date_to_calc.
    return = i_dates-date_to.

    CASE i_periodicity.
      WHEN 3.
        return+6(2) = i_dates-date_from+6(2) + 6.

        IF return+4(2) > i_dates-date_from+4(2) OR return(4) > i_dates-date_from(4).
          return+4(2) -= 1.
        ENDIF.

      WHEN 4.
        return+4(2) = i_dates-date_from+4(2).
        return+6(2) = days_in_month( return ).

      WHEN 6.
        return(4) = i_dates-date_from(4).
        return+4(2) = i_dates-date_from+4(2) + 11.
        return+6(2) = days_in_month( return ).
    ENDCASE.
  ENDMETHOD.

  METHOD days_in_month.
    CASE i_date+4(2).
      WHEN 4 OR 6 OR 9 OR 11.
        return = 30.

      WHEN 2.
        IF is_leap_year( i_date(4) ).
          return = 29.
        ELSE.
          return = 28.
        ENDIF.

      WHEN OTHERS.
        return = 31.
    ENDCASE.
  ENDMETHOD.

  METHOD is_leap_year.
    IF i_year MOD 4 <> 0.
      return = abap_false.
    ELSEIF i_year MOD 100 = 0 AND i_year MOD 400 <> 0.
      return = abap_false.
    ELSE.
      return = abap_true.
    ENDIF.
  ENDMETHOD.

  METHOD date_validations.
    return = i_dates.

    IF return+6(2) > days_in_month( i_dates ).
      return+6(2) -= days_in_month( i_dates ).
      return+4(2) += 1.
    ENDIF.

    IF return+4(2) > 12.
        return+4(2) -= 12.
        return(4) += 1.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
