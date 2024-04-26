CLASS zcl_lista2_atividade11 DEFINITION PUBLIC.

  PUBLIC SECTION.
    METHODS vowel_count
      IMPORTING
        i_string TYPE char12
      RETURNING VALUE(number_of_vowels) TYPE int8.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lista2_atividade11 IMPLEMENTATION.
  METHOD vowel_count.

    DATA vowels TYPE string VALUE 'AEIOUY'.

    DO 12 TIMES.
      DATA(current_index) = sy-index - 1.
      DATA(current_c) = i_string+current_index(1).

      IF current_c CA vowels.
        number_of_vowels = number_of_vowels + 1.
      ENDIF.
    ENDDO.

  ENDMETHOD.
ENDCLASS.
