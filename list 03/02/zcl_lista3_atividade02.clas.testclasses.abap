*"* use this source file for your ABAP unit test classes
CLASS test_class DEFINITION FOR TESTING
                 RISK LEVEL HARMLESS
                 DURATION SHORT.

  PUBLIC SECTION.
    METHODS test_method FOR TESTING.

  PRIVATE SECTION.
    DATA class_being_tested TYPE REF TO zcl_lista3_atividade02.
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
    DATA mara_data TYPE zcl_lista3_atividade02=>table_type.

    mara_data = VALUE #(
      ( matnr = 'A' ersda = '20240429' mtart = 'A' )
      ( matnr = 'B' ersda = '20240428' mtart = 'B' )
    ).

    test_environment->insert_test_data( mara_data ).

    DATA(test_result) = class_being_tested->select_fields( ).

    DATA exp_table TYPE zcl_lista3_atividade02=>table_of_struct_type.

    exp_table = VALUE #(
      ( matnr = 'A' mtart = 'A' )
      ( matnr = 'B' mtart = 'B' )
    ).

    cl_abap_unit_assert=>assert_equals(
          act = test_result
          exp = exp_table ).
  ENDMETHOD.
ENDCLASS.
