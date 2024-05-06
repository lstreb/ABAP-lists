*"* use this source file for your ABAP unit test classes
CLASS test_class DEFINITION FOR TESTING
                 RISK LEVEL HARMLESS
                 DURATION SHORT.

  PUBLIC SECTION.
    METHODS test_method FOR TESTING.

  PRIVATE SECTION.
    DATA class_being_tested TYPE REF TO zcl_lista3_atividade03.
    CLASS-DATA test_environment TYPE REF TO if_osql_test_environment.

    METHODS setup.
    CLASS-METHODS class_setup.
ENDCLASS.

CLASS test_class IMPLEMENTATION.
  METHOD class_setup.
    test_environment = cl_osql_test_environment=>create(
      i_dependency_list = VALUE #( ( 'USR04' ) ) ).
  ENDMETHOD.

  METHOD setup.
    class_being_tested = NEW #( ).
  ENDMETHOD.

  METHOD test_method.
    DATA usr04_data TYPE zcl_lista3_atividade03=>r_type_usr04.

    usr04_data = VALUE #(
      ( bname = 'A' )
      ( bname = 'B' )
    ).

    test_environment->insert_test_data( usr04_data ).

    DATA(test_result) = class_being_tested->get_usernames( ).

    DATA usr04_data_exp TYPE zcl_lista3_atividade03=>r_type.

    usr04_data_exp = VALUE #(
      ( bname = 'A' )
      ( bname = 'B' )
    ).

    cl_abap_unit_assert=>assert_equals(
          act = test_result
          exp = usr04_data_exp ).
  ENDMETHOD.
ENDCLASS.
