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
          i_mot TYPE vktra.

  PRIVATE SECTION.
    DATA:
      material_description    TYPE text40,
      periodicity_description TYPE text40,
      plant_description       TYPE z_cl_db_contract_creation=>return_type,
      mot                     TYPE vktra.
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



CLASS ltc_test_header DEFINITION FOR TESTING
                      RISK LEVEL HARMLESS
                      DURATION SHORT.

  PUBLIC SECTION.
    METHODS test_execute    FOR TESTING.

  PRIVATE SECTION.
    DATA:
      class_header_test    TYPE REF TO z_cl_fill_header,
      db_contract_creation TYPE REF TO ltd_db_contract_creation,
      class_multiplier     TYPE REF TO ltd_multiplier,
      class_header_uuid    TYPE REF TO ltd_system_uuid.

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

      when_execute_fill_header
        IMPORTING
          i_user_data TYPE z_cl_main=>struct_type
        RETURNING
          VALUE(return) TYPE /dmbe/t_header,

      then_fill_header_is
        IMPORTING
          i_header_table TYPE /dmbe/t_header
        RETURNING
          VALUE(return) TYPE /dmbe/t_header.

    METHODS setup.
ENDCLASS.

CLASS ltc_test_header IMPLEMENTATION.

  METHOD setup.
    db_contract_creation = NEW #( ).
    class_multiplier     = NEW #( ).
    class_header_uuid    = NEW #( ).

    class_header_test = NEW #(
      i_db_contract_creation = db_contract_creation
      i_multiplier           = class_multiplier
      i_system_uuid          = class_header_uuid
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

  METHOD when_execute_fill_header.
    return = class_header_test->execute( i_user_data ).
  ENDMETHOD.

  METHOD then_fill_header_is.
    return = i_header_table.
  ENDMETHOD.

  METHOD test_execute.
    DATA(user_data) = given_user_data( VALUE #(
      material_number = 'PUMPFAN'
      quantity        = 1000
      uom             = 'kg'
      period          = 2
      date_from       = '20180101'
      date_to         = '20180131'
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
    given_multiplier( 31 ).

    class_header_uuid->set_uuid_x16( '123' ).

    DATA(act_return) = when_execute_fill_header( user_data ).
    DATA(exp_return) = then_fill_header_is( VALUE #(
      header_uuid             = '123'
      material_number         = 'PUMPFAN'
      material_description    = 'Water  Pump fan 3"'
      quantity                = 31000
      uom                     = 'kg'
      periodicity             = 2
      periodicity_description = 'per day'
      effective_date_from     = '20180101'
      effective_date_to       = '20180131'
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
  ENDMETHOD.

ENDCLASS.
