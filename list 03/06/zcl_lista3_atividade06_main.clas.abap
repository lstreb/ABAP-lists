CLASS zcl_lista3_atividade06_main DEFINITION PUBLIC.

  PUBLIC SECTION.
    METHODS counts_vowels
      RETURNING VALUE(return) TYPE int8.

    METHODS constructor
      IMPORTING
        i_lista3_atividade06_select TYPE REF TO zcl_lista3_atividade06_select OPTIONAL
        i_lista3_atividade06_concat TYPE REF TO zcl_lista3_atividade06_concat OPTIONAL.

  PROTECTED SECTION.

  PRIVATE SECTION.
    DATA lista3_atividade06_select TYPE REF TO zcl_lista3_atividade06_select.
    DATA lista3_atividade06_concat TYPE REF TO zcl_lista3_atividade06_concat.
ENDCLASS.



CLASS zcl_lista3_atividade06_main IMPLEMENTATION.

  METHOD constructor.
    me->lista3_atividade06_select = COND #(
      WHEN i_lista3_atividade06_select IS BOUND
      THEN i_lista3_atividade06_select
      ELSE NEW #( )
    ).

    me->lista3_atividade06_concat = COND #(
      WHEN i_lista3_atividade06_concat IS BOUND
      THEN i_lista3_atividade06_concat
      ELSE NEW #( )
    ).
  ENDMETHOD.

  METHOD counts_vowels.
    DATA(return_names) = me->lista3_atividade06_select->get_usernames( ).
    DATA(return_string_names) = me->lista3_atividade06_concat->concatenate( return_names ).

    CONSTANTS vowels TYPE string VALUE 'aeiouy'.
    DATA(string_len) = STRLEN( return_string_names ).

    DO ( string_len - 1 ) TIMES.
      DATA(current_c) = return_string_names+sy-index(1).

      IF current_c CA vowels.
        return = return + 1.
      ENDIF.
    ENDDO.
  ENDMETHOD.

ENDCLASS.
