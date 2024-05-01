CLASS zcl_lista2_atividade10 DEFINITION PUBLIC.

  PUBLIC SECTION.
    TYPES: BEGIN OF struct_type,
            time1_user TYPE t,
            time2_brazil TYPE t,
            time3_uk TYPE t,
            time4_japan TYPE t,
            time5_chile TYPE t,
            time6_egypt TYPE t,
           END OF struct_type.

    INTERFACES if_oo_adt_classrun.

    METHODS calculate_time_zones
      IMPORTING
        i_time TYPE t
      RETURNING VALUE(r_time_zones) TYPE struct_type.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lista2_atividade10 IMPLEMENTATION.
  METHOD calculate_time_zones.
    GET TIME STAMP FIELD DATA(ts).

    SELECT SINGLE tzonesys
           FROM ttzcu
           INTO @DATA(tzone).

    r_time_zones-time1_user = i_time.

    CONVERT TIME STAMP ts TIME ZONE 'BRAZIL'
          INTO TIME r_time_zones-time2_brazil.

    CONVERT TIME STAMP ts TIME ZONE 'UK'
          INTO TIME r_time_zones-time3_uk.

    CONVERT TIME STAMP ts TIME ZONE 'JAPAN'
          INTO TIME r_time_zones-time4_japan.

    CONVERT TIME STAMP ts TIME ZONE 'CHILE'
          INTO TIME r_time_zones-time5_chile.

    CONVERT TIME STAMP ts TIME ZONE 'EGYPT'
          INTO TIME r_time_zones-time6_egypt.
  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.
    out->write( calculate_time_zones(
                   i_time = sy-timlo ) ).
  ENDMETHOD.
ENDCLASS.
