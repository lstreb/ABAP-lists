CLASS z_cl_multiplier DEFINITION PUBLIC.

  PUBLIC SECTION.
    TYPES: BEGIN OF struct_type,
            year_difference  TYPE VTBBEWE-ATAGE,
            month_difference TYPE i,
            day_difference   TYPE i,
           END OF struct_type.

    TYPES num_type TYPE p LENGTH 6 DECIMALS 3.

    METHODS execute
      IMPORTING
        i_date_from   TYPE dats
        i_date_to     TYPE dats
        i_periodicity TYPE n
      RETURNING
        VALUE(return) TYPE i.

  PROTECTED SECTION.

  PRIVATE SECTION.
    METHODS calculate_differences
      IMPORTING
        i_date_from   TYPE dats
        i_date_to     TYPE dats
      RETURNING
        VALUE(return) TYPE struct_type.

    METHODS test_incomplete_period
      IMPORTING
        i_multiplier TYPE num_type
      RETURNING
        VALUE(return) TYPE i.
ENDCLASS.



CLASS z_cl_multiplier IMPLEMENTATION.

  METHOD execute.
    DATA(diferrences) = calculate_differences(
      i_date_from = i_date_from
      i_date_to   = i_date_to
    ).

    CASE i_periodicity.
      WHEN 1.
        return = 1.
      WHEN 2.
        return = 1 + diferrences-day_difference.
      WHEN 3.
        return = test_incomplete_period( ( diferrences-day_difference + 1 ) / 7 ).
      WHEN 4.
        return = diferrences-month_difference.
      WHEN 5.
        return = test_incomplete_period( ( diferrences-month_difference + 1 ) / 3 ).
      WHEN 6.
        return = diferrences-year_difference.
    ENDCASE.
  ENDMETHOD.

  METHOD calculate_differences.
    CALL FUNCTION 'FIMA_DAYS_AND_MONTHS_AND_YEARS'
      EXPORTING
        i_date_from = i_date_from
        i_date_to   = i_date_to
      IMPORTING
        E_DAYS   = return-day_difference
        E_MONTHS = return-month_difference
        E_YEARS  = return-year_difference.
  ENDMETHOD.

  METHOD test_incomplete_period.
    return = CEIL( i_multiplier ).
  ENDMETHOD.
ENDCLASS.
