*"* use this source file for your ABAP unit test classes
CLASS test_class DEFINITION FOR TESTING
                 RISK LEVEL HARMLESS
                 DURATION SHORT.

  PUBLIC SECTION.
    METHODS test_method FOR TESTING.

  PRIVATE SECTION.
    DATA class_being_tested TYPE REF TO zcl_lista3_atividade06_concat.

    METHODS setup.

ENDCLASS.

CLASS test_class IMPLEMENTATION.
  METHOD setup.
    class_being_tested = NEW #( ).
  ENDMETHOD.

  METHOD test_method.
    DATA username_list TYPE zcl_lista3_atividade06_select=>r_type.

    username_list = VALUE #(
      ( bname = 'Laura' )
      ( bname = 'Streb' )
    ).

    DATA(test_result) = class_being_tested->concatenate( username_list ).

    cl_abap_unit_assert=>assert_equals(
          act = test_result
          exp = 'Laura Streb' ).
  ENDMETHOD.
ENDCLASS.
