CLASS z_cl_fill_item DEFINITION PUBLIC.

  PUBLIC SECTION.
    TYPES return_type TYPE TABLE OF /dmbe/t_item WITH KEY mandt header_uuid item_uuid.

    TYPES: BEGIN OF date_struct,
            date_from TYPE dats,
            date_to   TYPE dats,
           END OF date_struct.

    METHODS constructor
      IMPORTING
        i_db_contract_creation TYPE REF TO z_cl_db_contract_creation OPTIONAL
        i_multiplier           TYPE REF TO z_cl_multiplier           OPTIONAL
        i_system_uuid          TYPE REF TO if_system_uuid            OPTIONAL
        i_calculate_dates      TYPE REF TO z_cl_calc_dates           OPTIONAL.

    METHODS execute
      IMPORTING
        i_header_uuid TYPE /dmbe/t_item-header_uuid
        i_data_struct TYPE z_cl_main=>struct_type
      RETURNING
        VALUE(return) TYPE return_type.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA db_contract_creation TYPE REF TO z_cl_db_contract_creation.
    DATA multiplier           TYPE REF TO z_cl_multiplier.
    DATA cl_calculate_dates   TYPE REF TO z_cl_calc_dates.
    DATA system_uuid          TYPE REF TO if_system_uuid.
ENDCLASS.



CLASS z_cl_fill_item IMPLEMENTATION.

  METHOD constructor.
    me->system_uuid = COND #(
      WHEN i_system_uuid IS BOUND
      THEN i_system_uuid
      ELSE NEW cl_system_uuid( )
    ).

    me->db_contract_creation = COND #(
      WHEN i_db_contract_creation IS BOUND
      THEN i_db_contract_creation
      ELSE NEW #( )
    ).

    me->multiplier = COND #(
      WHEN i_multiplier IS BOUND
      THEN i_multiplier
      ELSE NEW #( )
    ).

    me->cl_calculate_dates = COND #(
      WHEN i_calculate_dates IS BOUND
      THEN i_calculate_dates
      ELSE NEW #( )
    ).
  ENDMETHOD.

  METHOD execute.
    DATA(db_select) = me->db_contract_creation.

    DATA(origin_data)      = db_select->get_plant_description( i_data_struct-origin_loc ).
    DATA(destination_data) = db_select->get_plant_description( i_data_struct-destination_loc ).

    DATA(period_mult) = me->multiplier->execute(
      i_date_from   = i_data_struct-date_from
      i_date_to     = i_data_struct-date_to
      i_periodicity = i_data_struct-period
    ).

    DATA user_dates TYPE date_struct.
    user_dates = VALUE #(
      date_from = i_data_struct-date_from
      date_to   = i_data_struct-date_to
    ).

    DATA dates TYPE date_struct.
    dates = me->cl_calculate_dates->first_calculate_dates(
      i_dates       = user_dates
      i_periodicity = i_data_struct-period
    ).

    DO period_mult TIMES.
      TRY.
        DATA(item_uuid) = me->system_uuid->create_uuid_x16( ).
      CATCH cx_uuid_error.
      ENDTRY.

      APPEND VALUE #(
        header_uuid             = i_header_uuid
        item_uuid               = item_uuid
        material_number         = i_data_struct-material_number
        material_description    = db_select->get_material_description( i_data_struct-material_number )
        quantity                = i_data_struct-quantity
        uom                     = i_data_struct-uom
        periodicity             = i_data_struct-period
        periodicity_description = db_select->get_periodicity_description( i_data_struct-period )
        effective_date_from     = dates-date_from
        effective_date_to       = dates-date_to
        origin_plant            = origin_data-location_plant
        origin_location         = i_data_struct-origin_loc
        origin_description      = origin_data-location_description
        destination_plant       = destination_data-location_plant
        destination_location    = i_data_struct-destination_loc
        destination_description = destination_data-location_description
        mot                     = db_select->get_mot( i_data_struct-mot_description )
        mot_description         = i_data_struct-mot_description
      ) TO return.

      IF period_mult > 1.
        dates = me->cl_calculate_dates->calculate_dates(
          i_dates       = dates
          i_periodicity = i_data_struct-period
        ).
      ENDIF.
    ENDDO.

    me->db_contract_creation->insert_item( return ).
  ENDMETHOD.
ENDCLASS.
