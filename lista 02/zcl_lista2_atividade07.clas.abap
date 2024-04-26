CLASS zcl_lista2_atividade07 DEFINITION PUBLIC.

  PUBLIC SECTION.
    METHODS vowel_count
      IMPORTING
        i_string TYPE string
      RETURNING VALUE(number_of_vowels) TYPE int8
      RAISING cx_abap_invalid_value.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lista2_atividade07 IMPLEMENTATION.
  METHOD vowel_count.
    IF i_string IS INITIAL.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.

    DATA vowels TYPE string VALUE 'aeiouy'.
    DATA(string_len) = STRLEN( i_string ).

    DO ( string_len - 1 ) TIMES.
      DATA(current_c) = i_string+sy-index(1).

      IF current_c CA vowels.
        number_of_vowels = number_of_vowels + 1.
      ENDIF.
    ENDDO.

  ENDMETHOD.
ENDCLASS.
