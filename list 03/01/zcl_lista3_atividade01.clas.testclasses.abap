*"* use this source file for your ABAP unit test classes
CLASS test_class DEFINITION FOR TESTING
                 RISK LEVEL HARMLESS
                 DURATION SHORT.

  PUBLIC SECTION.
    METHODS test_method FOR TESTING.

  PRIVATE SECTION.
    DATA class_being_tested TYPE REF TO zcl_lista3_atividade01.
    CLASS-DATA test_environment TYPE REF TO if_osql_test_environment.

    METHODS setup.
    CLASS-METHODS class_setup.
ENDCLASS.

CLASS test_class IMPLEMENTATION.
  METHOD class_setup.
    test_environment = cl_osql_test_environment=>create(
      i_dependency_list = VALUE #( ( 'MARA' ) ) ).
  ENDMETHOD.

  METHOD setup.
    class_being_tested = NEW #( ).
  ENDMETHOD.

  METHOD test_method.
    DATA mara_data TYPE zcl_lista3_atividade01=>table_type.

    mara_data = VALUE #(
      ( matnr = 'A' ersda = '20240429' )
      ( matnr = 'B' ersda = '20240428' )
    ).

    test_environment->insert_test_data( mara_data ).

    DATA(test_result) = class_being_tested->select_mara( ).

    DATA mara_data_exp TYPE zcl_lista3_atividade01=>table_type.

    mara_data_exp = VALUE #(
      ( mandt = '001' matnr = 'A' ersda = '20240429' )
      ( mandt = '001' matnr = 'B' ersda = '20240428' )
    ).

    cl_abap_unit_assert=>assert_equals(
          act = test_result
          exp = mara_data_exp ).
  ENDMETHOD.
ENDCLASS.
