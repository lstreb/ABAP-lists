CLASS ltc_test_db_contract_creation DEFINITION FOR TESTING
                                    RISK LEVEL HARMLESS
                                    DURATION SHORT.

  PUBLIC SECTION.
    METHODS test_plant_description       FOR TESTING.
    METHODS test_material_description    FOR TESTING.
    METHODS test_mot                     FOR TESTING.
    METHODS test_periodicity_description FOR TESTING.
    METHODS test_header_insert           FOR TESTING.
    METHODS test_item_insert             FOR TESTING.

  PRIVATE SECTION.
    DATA class_db_test TYPE REF TO z_cl_db_contract_creation.

    CLASS-DATA test_environment TYPE REF TO if_osql_test_environment.

    METHODS setup.
    CLASS-METHODS class_setup.
ENDCLASS.

CLASS ltc_test_db_contract_creation IMPLEMENTATION.
  METHOD class_setup.
    test_environment = cl_osql_test_environment=>create(
      i_dependency_list = VALUE #( ( 'T499S' ) ( 'MAKT' ) ( 'T173T' ) ( 'DD07T' ) ( '/dmbe/t_header' ) ( '/dmbe/t_item' ) ) ).
  ENDMETHOD.

  METHOD setup.
    class_db_test = NEW #( ).
  ENDMETHOD.

  METHOD test_plant_description.
    DATA t499s_data TYPE TABLE OF t499s.

    t499s_data = VALUE #(
      ( stand = 'Berlim' werks = 'ZX01' ktext = 'Berlim' )
    ).

    test_environment->insert_test_data( t499s_data ).

    DATA(test_result) = class_db_test->get_plant_description( 'Berlim' ).

    DATA exp_result TYPE z_cl_db_contract_creation=>return_type.
    exp_result = VALUE #(
      location_plant       = 'ZX01'
      location_description = 'Berlim'
    ).

    cl_abap_unit_assert=>assert_equals(
          act = test_result
          exp = exp_result
    ).
  ENDMETHOD.

  METHOD test_material_description.
    DATA makt_data TYPE TABLE OF makt.

    makt_data = VALUE #(
      ( matnr = 'Sugar' maktx = 'Sugar Fine' )
    ).

    test_environment->insert_test_data( makt_data ).

    DATA(test_result) = class_db_test->get_material_description( 'Sugar' ).

    cl_abap_unit_assert=>assert_equals(
          act = test_result
          exp = 'Sugar Fine'
    ).
  ENDMETHOD.

  METHOD test_mot.
    DATA t173t_data TYPE TABLE OF t173t.

    t173t_data = VALUE #(
      ( bezei = 'Sea' vsart = '03')
    ).

    test_environment->insert_test_data( t173t_data ).

    DATA(test_result) = class_db_test->get_mot( 'Sea' ).

    cl_abap_unit_assert=>assert_equals(
          act = test_result
          exp = '03'
    ).
  ENDMETHOD.

  METHOD test_periodicity_description.
    DATA dd07t_data TYPE TABLE OF dd07t.

    dd07t_data = VALUE #(
      ( ddtext = 'per contract' domvalue_l = '1' domname = '/DMBE/D_PERIODICITY' ddlanguage = sy-langu )
    ).

    test_environment->insert_test_data( dd07t_data ).

    DATA(test_result) = class_db_test->get_periodicity_description( '1' ).

    cl_abap_unit_assert=>assert_equals(
          act = test_result
          exp = 'per contract'
    ).
  ENDMETHOD.

  METHOD test_header_insert.
     DATA header_data TYPE z_cl_fill_header=>return_type.

     header_data = VALUE #(
       mandt                   = sy-mandt
       header_uuid             = NEW cl_system_uuid( )->if_system_uuid~create_uuid_x16( )
       material_number         = 'SUGAR'
       material_description    = 'Sugar Fine'
       quantity                = 100
       uom                     = 'kg'
       periodicity             = 1
       periodicity_description = 'per contract'
       effective_date_from     = '20230101'
       effective_date_to       = '20230730'
       origin_plant            = 'ZX01'
       origin_location         = 'Berlim'
       origin_description      = 'Berlim'
       destination_plant       = 'ZX01'
       destination_location    = 'Berlim'
       destination_description = 'Berlim'
       mot                     = '03'
       mot_description         = 'Sea'
     ).

     class_db_test->insert_header( header_data ).

     DATA return TYPE z_cl_fill_header=>return_type.
     SELECT SINGLE
      FROM /dmbe/t_header
      FIELDS *
      INTO @return.

     cl_abap_unit_assert=>assert_equals(
          act = return
          exp = header_data
     ).
  ENDMETHOD.

  METHOD test_item_insert.
    DATA item_data TYPE z_cl_fill_item=>return_type.

     item_data = VALUE #(
      (
       mandt                   = sy-mandt
       header_uuid             = NEW cl_system_uuid( )->if_system_uuid~create_uuid_x16( )
       item_uuid               = NEW cl_system_uuid( )->if_system_uuid~create_uuid_x16( )
       material_number         = 'SUGAR'
       material_description    = 'Sugar Fine'
       quantity                = 100
       uom                     = 'kg'
       periodicity             = 1
       periodicity_description = 'per contract'
       effective_date_from     = '20230101'
       effective_date_to       = '20230730'
       origin_plant            = 'ZX01'
       origin_location         = 'Berlim'
       origin_description      = 'Berlim'
       destination_plant       = 'ZX01'
       destination_location    = 'Berlim'
       destination_description = 'Berlim'
       mot                     = '03'
       mot_description         = 'Sea'
      )
     ).

     class_db_test->insert_item( item_data ).

     DATA return TYPE z_cl_fill_item=>return_type.
     SELECT
      FROM /dmbe/t_item
      FIELDS *
      INTO TABLE @return.

     cl_abap_unit_assert=>assert_equals(
          act = return
          exp = item_data
     ).
  ENDMETHOD.
ENDCLASS.
