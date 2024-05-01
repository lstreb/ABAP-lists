*"* use this source file for your ABAP unit test classes
CLASS test_class DEFINITION FOR TESTING
                 RISK LEVEL HARMLESS
                 DURATION SHORT.

  PUBLIC SECTION.
    METHODS test_method FOR TESTING.

  PRIVATE SECTION.
    DATA class_being_tested TYPE REF TO zcl_lista2_atividade08.
    METHODS setup.
ENDCLASS.

CLASS test_class IMPLEMENTATION.
  METHOD setup.
    class_being_tested = NEW #( ).
  ENDMETHOD.

  METHOD test_method.

    DATA(test_result) = class_being_tested->concatenate_words(
                          i_word1 = 'Laura'
                          i_word2 = 'Streb'
                        ).

    cl_abap_unit_assert=>assert_equals(
          act = test_result
          exp = 'Laura Streb' ).
  ENDMETHOD.
ENDCLASS.
