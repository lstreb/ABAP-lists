CLASS z_cl_fill_header DEFINITION PUBLIC.

  PUBLIC SECTION.
    TYPES return_type TYPE /dmbe/t_header.

    METHODS constructor
      IMPORTING
        i_db_contract_creation TYPE REF TO z_cl_db_contract_creation OPTIONAL
        i_multiplier           TYPE REF TO z_cl_multiplier           OPTIONAL
        i_system_uuid          TYPE REF TO if_system_uuid            OPTIONAL.

    METHODS execute
      IMPORTING
        i_data_struct TYPE z_cl_main=>struct_type
      RETURNING VALUE(return) TYPE return_type.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA db_contract_creation TYPE REF TO z_cl_db_contract_creation.
    DATA multiplier           TYPE REF TO z_cl_multiplier.
    DATA system_uuid          TYPE REF TO if_system_uuid.

    METHODS calculate_quantity
      IMPORTING
        i_date_from   TYPE dats
        i_date_to     TYPE dats
        i_quantity    TYPE menge13
        i_periodicity TYPE n
      RETURNING VALUE(return) TYPE i.
ENDCLASS.



CLASS z_cl_fill_header IMPLEMENTATION.

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
  ENDMETHOD.

  METHOD execute.
    DATA(db_select) = me->db_contract_creation.

    DATA(origin_data)      = db_select->get_plant_description( i_data_struct-origin_loc ).
    DATA(destination_data) = db_select->get_plant_description( i_data_struct-destination_loc ).

    DATA(final_quantity) = calculate_quantity(
      i_date_from   = i_data_struct-date_from
      i_date_to     = i_data_struct-date_to
      i_quantity    = i_data_struct-quantity
      i_periodicity = i_data_struct-period
    ).

    TRY.
      DATA(header_uuid) = me->system_uuid->create_uuid_x16( ).
    CATCH cx_uuid_error.
    ENDTRY.

    return = VALUE #(
      header_uuid             = header_uuid
      material_number         = i_data_struct-material_number
      material_description    = db_select->get_material_description( i_data_struct-material_number )
      quantity                = final_quantity
      uom                     = i_data_struct-uom
      periodicity             = i_data_struct-period
      periodicity_description = db_select->get_periodicity_description( i_data_struct-period )
      effective_date_from     = i_data_struct-date_from
      effective_date_to       = i_data_struct-date_to
      origin_plant            = origin_data-location_plant
      origin_location         = i_data_struct-origin_loc
      origin_description      = origin_data-location_description
      destination_plant       = destination_data-location_plant
      destination_location    = i_data_struct-destination_loc
      destination_description = destination_data-location_description
      mot                     = db_select->get_mot( i_data_struct-mot_description )
      mot_description         = i_data_struct-mot_description
    ).

    db_select->insert_header( return ).
  ENDMETHOD.

  METHOD calculate_quantity.
    DATA(period_mult) = me->multiplier->execute(
      i_date_from   = i_date_from
      i_date_to     = i_date_to
      i_periodicity = i_periodicity
    ).

    return = i_quantity * period_mult.
  ENDMETHOD.

ENDCLASS.
