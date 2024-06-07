CLASS ltd_db_contract_creation DEFINITION FINAL FOR TESTING INHERITING FROM z_cl_db_contract_creation.
  PUBLIC SECTION.
    METHODS:
      get_material_description REDEFINITION,
      set_material_description
        IMPORTING
          i_material_description TYPE text40,

      get_periodicity_description REDEFINITION,
      set_periodicity_description
        IMPORTING
          i_periodicity_description TYPE text40,

      get_plant_description REDEFINITION,
      set_plant_description
        IMPORTING
          i_plant_description TYPE z_cl_db_contract_creation=>return_type,

      get_mot REDEFINITION,
      set_mot
        IMPORTING
          i_mot TYPE vktra,

      insert_item REDEFINITION,
      get_inserted_item
        RETURNING
          VALUE(return) TYPE z_cl_fill_item=>return_type.

  PRIVATE SECTION.
    DATA:
      material_description    TYPE text40,
      periodicity_description TYPE text40,
      plant_description       TYPE z_cl_db_contract_creation=>return_type,
      mot                     TYPE vktra,
      inserted_item           TYPE z_cl_fill_item=>return_type.

ENDCLASS.

CLASS ltd_db_contract_creation IMPLEMENTATION.
  METHOD get_material_description.
    return = me->material_description.
  ENDMETHOD.

  METHOD get_periodicity_description.
    return = me->periodicity_description.
  ENDMETHOD.

  METHOD get_plant_description.
    return = me->plant_description.
  ENDMETHOD.

  METHOD get_mot.
    return = me->mot.
  ENDMETHOD.

  METHOD set_material_description.
    me->material_description = i_material_description.
  ENDMETHOD.

  METHOD set_periodicity_description.
    me->periodicity_description = i_periodicity_description.
  ENDMETHOD.

  METHOD set_plant_description.
    me->plant_description = i_plant_description.
  ENDMETHOD.

  METHOD set_mot.
    me->mot = i_mot.
  ENDMETHOD.

  METHOD insert_item.
    me->inserted_item = i_item_table.
  ENDMETHOD.

  METHOD get_inserted_item.
    return = me->inserted_item.
  ENDMETHOD.
ENDCLASS.



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



CLASS ltd_system_uuid DEFINITION FINAL FOR TESTING.
  PUBLIC SECTION.
    INTERFACES: if_system_uuid PARTIALLY IMPLEMENTED.

    METHODS:
      set_uuid_x16
        IMPORTING
          i_uuid_x16 TYPE SYSUUID_X16.

  PRIVATE SECTION.
    DATA uuid_x16 TYPE SYSUUID_X16.
ENDCLASS.

CLASS ltd_system_uuid IMPLEMENTATION.
  METHOD if_system_uuid~create_uuid_x16.
    UUID = me->uuid_x16.
  ENDMETHOD.

  METHOD set_uuid_x16.
    me->uuid_x16 = i_uuid_x16.
  ENDMETHOD.
ENDCLASS.



CLASS ltd_calc_dates DEFINITION FINAL FOR TESTING INHERITING FROM z_cl_calc_dates.
  PUBLIC SECTION.
    METHODS:
      calculate_dates REDEFINITION,
      set_calculated_dates
        IMPORTING
          i_calculated_dates TYPE z_cl_calc_dates=>date_struct,

      first_calculate_dates REDEFINITION,
      set_first_calculated_dates
        IMPORTING
          i_first_calculated_dates TYPE z_cl_calc_dates=>date_struct.

  PRIVATE SECTION.
    DATA:
      calculated_dates TYPE z_cl_calc_dates=>date_struct,
      first_calculated_dates TYPE z_cl_calc_dates=>date_struct.
ENDCLASS.

CLASS ltd_calc_dates IMPLEMENTATION.
  METHOD calculate_dates.
    return = me->calculated_dates.
  ENDMETHOD.

  METHOD set_calculated_dates.
    me->calculated_dates = i_calculated_dates.
  ENDMETHOD.

  METHOD first_calculate_dates.
    return = me->first_calculated_dates.
  ENDMETHOD.

  METHOD set_first_calculated_dates.
    me->first_calculated_dates = i_first_calculated_dates.
  ENDMETHOD.
ENDCLASS.



CLASS ltc_test_item DEFINITION FOR TESTING
                    RISK LEVEL HARMLESS
                    DURATION SHORT.
  PUBLIC SECTION.
    METHODS test_fill_item_p1 FOR TESTING.
    METHODS test_fill_item_p2 FOR TESTING.

  PRIVATE SECTION.
    DATA class_item_test      TYPE REF TO z_cl_fill_item.
    DATA db_contract_creation TYPE REF TO ltd_db_contract_creation.
    DATA class_multiplier     TYPE REF TO ltd_multiplier.
    DATA class_calc_dates     TYPE REF TO ltd_calc_dates.
    DATA class_item_uuid      TYPE REF TO ltd_system_uuid.

    DATA data_struct TYPE z_cl_main=>struct_type.

      METHODS:
        given_user_data
          IMPORTING
            i_user_data TYPE z_cl_main=>struct_type
          RETURNING
            VALUE(return) TYPE z_cl_main=>struct_type,

        given_material_description
          IMPORTING
            i_material_description TYPE text40,

        given_periodicity_description
          IMPORTING
            i_periodicity_description TYPE text40,

        given_plant_and_description
          IMPORTING
            i_location_plant_and_des TYPE z_cl_db_contract_creation=>return_type,

        given_mot
          IMPORTING
            i_mot TYPE vktra,

        given_multiplier
          IMPORTING
            i_multiplier TYPE i,

        given_first_calculated_dates
          IMPORTING
            i_dates TYPE z_cl_calc_dates=>date_struct,

        given_calculated_dates
          IMPORTING
            i_dates TYPE z_cl_calc_dates=>date_struct,

        when_execute_fill_item
          IMPORTING
            i_user_data TYPE z_cl_main=>struct_type
          RETURNING
            VALUE(return) TYPE z_cl_fill_item=>return_type,

        then_fill_item_is
          IMPORTING
            i_item_table TYPE z_cl_fill_item=>return_type
          RETURNING
            VALUE(return) TYPE z_cl_fill_item=>return_type,

        setup.
ENDCLASS.

CLASS ltc_test_item IMPLEMENTATION.
  METHOD setup.
    db_contract_creation = NEW #( ).
    class_multiplier     = NEW #( ).
    class_calc_dates     = NEW #( ).
    class_item_uuid      = NEW #( ).

    class_item_test = NEW #(
      i_db_contract_creation = db_contract_creation
      i_multiplier           = class_multiplier
      i_system_uuid          = class_item_uuid
      i_calculate_dates      = class_calc_dates
    ).
  ENDMETHOD.

  METHOD given_user_data.
    return = i_user_data.
  ENDMETHOD.

  METHOD given_material_description.
    db_contract_creation->set_material_description( i_material_description ).
  ENDMETHOD.

  METHOD given_periodicity_description.
    db_contract_creation->set_periodicity_description( i_periodicity_description ).
  ENDMETHOD.

  METHOD given_plant_and_description.
    db_contract_creation->set_plant_description( i_location_plant_and_des ).
  ENDMETHOD.

  METHOD given_mot.
    db_contract_creation->set_mot( i_mot ).
  ENDMETHOD.

  METHOD given_multiplier.
    class_multiplier->set_multiplier( i_multiplier ).
  ENDMETHOD.

  METHOD given_first_calculated_dates.
    class_calc_dates->set_first_calculated_dates( i_dates ).
  ENDMETHOD.

  METHOD given_calculated_dates.
    class_calc_dates->set_calculated_dates( i_dates ).
  ENDMETHOD.

  METHOD when_execute_fill_item.
    return = class_item_test->execute(
      i_data_struct = i_user_data
      i_header_uuid = '123'
    ).
  ENDMETHOD.

  METHOD then_fill_item_is.
    return = i_item_table.
  ENDMETHOD.

  METHOD test_fill_item_p1.
    DATA(user_data) = given_user_data( VALUE #(
      material_number = 'PUMPFAN'
      quantity        = 1000
      uom             = 'kg'
      period          = 1
      date_from       = '20180101'
      date_to         = '20181201'
      origin_loc      = 'BRISBANE'
      destination_loc = 'BRISBANE'
      mot_description = 'Sea'
    ) ).

    given_material_description( 'Water  Pump fan 3"' ).
    given_periodicity_description( 'per contract' ).
    given_plant_and_description( VALUE #(
        location_plant       = '1000'
        location_description = 'Plant 1000, Location Brisbane'
      ) ).
    given_mot( '04' ).
    given_multiplier( 1 ).
    given_first_calculated_dates( VALUE #(
      date_from = '20180101'
      date_to   = '20181201'
    ) ).

    class_item_uuid->set_uuid_x16( '1' ).

    DATA(act_return) = when_execute_fill_item( user_data ).

    DATA exp_return TYPE z_cl_fill_item=>return_type.
    exp_return = VALUE #( (
        header_uuid             = '123'
        item_uuid               = '1'
        material_number         = 'PUMPFAN'
        material_description    = 'Water  Pump fan 3"'
        quantity                = 1000
        uom                     = 'kg'
        periodicity             = 1
        periodicity_description = 'per contract'
        effective_date_from     = '20180101'
        effective_date_to       = '20181201'
        origin_plant            = '1000'
        origin_location         = 'BRISBANE'
        origin_description      = 'Plant 1000, Location Brisbane'
        destination_plant       = '1000'
        destination_location    = 'BRISBANE'
        destination_description = 'Plant 1000, Location Brisbane'
        mot                     = '04'
        mot_description         = 'Sea'
      ) ).

    cl_abap_unit_assert=>assert_equals(
      act = act_return
      exp = exp_return
    ).

    cl_abap_unit_assert=>assert_equals(
      act = db_contract_creation->get_inserted_item( )
      exp = exp_return
    ).
  ENDMETHOD.

  METHOD test_fill_item_p2.
    DATA(user_data) = given_user_data( VALUE #(
      material_number = 'PUMPFAN'
      quantity        = 1000
      uom             = 'kg'
      period          = 2
      date_from       = '20180101'
      date_to         = '20180102'
      origin_loc      = 'BRISBANE'
      destination_loc = 'BRISBANE'
      mot_description = 'Sea'
    ) ).

    given_material_description( 'Water  Pump fan 3"' ).
    given_periodicity_description( 'per day' ).
    given_plant_and_description( VALUE #(
        location_plant       = '1000'
        location_description = 'Plant 1000, Location Brisbane'
      ) ).
    given_mot( '04' ).
    given_multiplier( 2 ).
    given_first_calculated_dates( VALUE #(
      date_from = '20180101'
      date_to   = '20180101'
    ) ).
    given_calculated_dates( VALUE #(
      date_from = '20180102'
      date_to   = '20180102'
    ) ).

    class_item_uuid->set_uuid_x16( '1' ).

    DATA(act_return) = when_execute_fill_item( user_data ).

    DATA exp_return TYPE z_cl_fill_item=>return_type.
    exp_return = VALUE #( (
        header_uuid             = '123'
        item_uuid               = '1'
        material_number         = 'PUMPFAN'
        material_description    = 'Water  Pump fan 3"'
        quantity                = 1000
        uom                     = 'kg'
        periodicity             = 2
        periodicity_description = 'per day'
        effective_date_from     = '20180101'
        effective_date_to       = '20180101'
        origin_plant            = '1000'
        origin_location         = 'BRISBANE'
        origin_description      = 'Plant 1000, Location Brisbane'
        destination_plant       = '1000'
        destination_location    = 'BRISBANE'
        destination_description = 'Plant 1000, Location Brisbane'
        mot                     = '04'
        mot_description         = 'Sea'
      ) (
        header_uuid             = '123'
        item_uuid               = '1'
        material_number         = 'PUMPFAN'
        material_description    = 'Water  Pump fan 3"'
        quantity                = 1000
        uom                     = 'kg'
        periodicity             = 2
        periodicity_description = 'per day'
        effective_date_from     = '20180102'
        effective_date_to       = '20180102'
        origin_plant            = '1000'
        origin_location         = 'BRISBANE'
        origin_description      = 'Plant 1000, Location Brisbane'
        destination_plant       = '1000'
        destination_location    = 'BRISBANE'
        destination_description = 'Plant 1000, Location Brisbane'
        mot                     = '04'
        mot_description         = 'Sea'
      ) ).

      cl_abap_unit_assert=>assert_equals(
      act = act_return
      exp = exp_return
    ).

    cl_abap_unit_assert=>assert_equals(
      act = db_contract_creation->get_inserted_item( )
      exp = exp_return
    ).
  ENDMETHOD.
ENDCLASS.
