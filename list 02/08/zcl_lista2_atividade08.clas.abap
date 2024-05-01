CLASS zcl_lista2_atividade08 DEFINITION PUBLIC.

  PUBLIC SECTION.
    INTERFACES if_oo_adt_classrun.

    METHODS concatenate_words
      IMPORTING
        i_word1 TYPE c
        i_word2 TYPE c
      RETURNING VALUE(result) TYPE string.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lista2_atividade08 IMPLEMENTATION.
  METHOD concatenate_words.
    CONCATENATE i_word1 i_word2 INTO result SEPARATED BY ' '.
  ENDMETHOD.

  METHOD if_oo_adt_classrun~main.
   out->write( concatenate_words(
                  i_word1 = 'Hello,'
                  i_word2 = 'World' ) ).
  ENDMETHOD.
ENDCLASS.
