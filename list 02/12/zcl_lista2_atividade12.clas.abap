CLASS zcl_lista2_atividade12 DEFINITION PUBLIC.

  PUBLIC SECTION.

    METHODS finds_length
      IMPORTING
        i_string TYPE string
        RETURNING VALUE(character_count) TYPE string
        RAISING cx_abap_invalid_value.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lista2_atividade12 IMPLEMENTATION.
  METHOD finds_length.
    character_count = STRLEN( i_string ).

    IF character_count > 2.
      RAISE EXCEPTION TYPE cx_abap_invalid_value.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
