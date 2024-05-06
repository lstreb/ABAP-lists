*"* use this source file for your ABAP unit test classes
CLASS /dmbe/tcm_test_class DEFINITION FOR TESTING
                 RISK LEVEL HARMLESS
                 DURATION SHORT.

  PUBLIC SECTION.
    METHODS test_method_exist FOR TESTING.

  PRIVATE SECTION.
    DATA class_being_tested TYPE REF TO zcl_lista3_atividade04.
    CLASS-DATA test_environment TYPE REF TO if_osql_test_environment.

    METHODS setup.
    CLASS-METHODS class_setup.
ENDCLASS.

CLASS /dmbe/tcm_test_class IMPLEMENTATION.

  METHOD class_setup.
    test_environment = cl_osql_test_environment=>create(
      i_dependency_list = VALUE #( ( 'MARA' ) ) ).
  ENDMETHOD.

  METHOD setup.
    class_being_tested = NEW #( ).
  ENDMETHOD.

  METHOD test_method_exist.
    DATA mara_data TYPE zcl_lista3_atividade04=>table_type.

    mara_data = VALUE #(
      ( matnr = 'A' ersda = '20240429' mtart = 'A' matkl = 'pipe' )
      ( matnr = 'B' ersda = '20240428' mtart = 'B' matkl = 'pipe' )
    ).

    test_environment->insert_test_data( mara_data ).

    DATA(test_result) = class_being_tested->checks_if_pipe_exists( ).

    cl_abap_unit_assert=>assert_true(
          act = test_result
    ).
  ENDMETHOD.
ENDCLASS.
