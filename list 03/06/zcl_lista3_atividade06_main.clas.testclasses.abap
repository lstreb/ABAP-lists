*"* use this source file for your ABAP unit test classes
CLASS ltd_db_select DEFINITION FINAL FOR TESTING INHERITING FROM zcl_lista3_atividade06_select.
  PUBLIC SECTION.
    METHODS:
      get_usernames REDEFINITION,
      set_usernames
        IMPORTING
          i_usernames TYPE zcl_lista3_atividade06_select=>r_type.

  PRIVATE SECTION.
    DATA usernames TYPE zcl_lista3_atividade06_select=>r_type.
ENDCLASS.

CLASS ltd_db_select IMPLEMENTATION.
  METHOD get_usernames.
    return = me->usernames.
  ENDMETHOD.

  METHOD set_usernames.
    me->usernames = i_usernames.
  ENDMETHOD.
ENDCLASS.

CLASS ltd_db_concat DEFINITION FINAL FOR TESTING INHERITING FROM zcl_lista3_atividade06_concat.
  PUBLIC SECTION.
    METHODS:
      concatenate REDEFINITION,
      set_concat
        IMPORTING
          i_string TYPE string.

    METHODS get_username_list
      RETURNING VALUE(return) TYPE zcl_lista3_atividade06_select=>r_type.

  PRIVATE SECTION.
    DATA string_concat TYPE string.
    DATA usernames_list TYPE zcl_lista3_atividade06_select=>r_type.
ENDCLASS.

CLASS ltd_db_concat IMPLEMENTATION.
  METHOD get_username_list.
    return = usernames_list.
  ENDMETHOD.

  METHOD concatenate.
    usernames_list = i_username_list.
    return = me->string_concat.
  ENDMETHOD.

  METHOD set_concat.
    me->string_concat = i_string.
  ENDMETHOD.
ENDCLASS.

CLASS test_class DEFINITION FOR TESTING
                 RISK LEVEL HARMLESS
                 DURATION SHORT.

  PUBLIC SECTION.
    METHODS test_method FOR TESTING.
    METHODS test_method_concat_set FOR TESTING.

  PRIVATE SECTION.
    DATA class_being_tested TYPE REF TO zcl_lista3_atividade06_main.
    DATA db_select TYPE REF TO ltd_db_select.
    DATA db_concat TYPE REF TO ltd_db_concat.
    METHODS setup.
ENDCLASS.

CLASS test_class IMPLEMENTATION.
  METHOD setup.
    db_select = NEW ltd_db_select( ).
    db_concat = NEW ltd_db_concat( ).

    class_being_tested = NEW #(
      i_lista3_atividade06_select = db_select
      i_lista3_atividade06_concat = db_concat
    ).
  ENDMETHOD.

  METHOD test_method.
    db_concat->set_concat( 'Laura Streb' ).

    DATA(test_result) = class_being_tested->counts_vowels( ).

    cl_abap_unit_assert=>assert_equals(
          act = test_result
          exp = 4 ).
  ENDMETHOD.

  METHOD test_method_concat_set.
    db_select->set_usernames( VALUE #(
      ( bname = 'Laura' )
      ( bname = 'Streb' )
    ) ).

    DATA(test_result) = class_being_tested->counts_vowels( ).

    DATA(username_list) = db_concat->get_username_list( ).

    DATA(username_list_exp) = VALUE zcl_lista3_atividade06_select=>r_type(
      ( bname = 'Laura' )
      ( bname = 'Streb' )
    ).

    cl_abap_unit_assert=>assert_equals(
          act = username_list
          exp = username_list_exp ).

  ENDMETHOD.
ENDCLASS.
