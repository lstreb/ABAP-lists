CLASS zcl_lista2_atividade15 DEFINITION PUBLIC.

  PUBLIC SECTION.
    TYPES: BEGIN OF struct_type,
            char1 TYPE c LENGTH 1,
            char2 TYPE c LENGTH 1,
            int1 TYPE i,
            int2 TYPE i,
           END OF struct_type.

    METHODS receive_struct
      IMPORTING i_struct TYPE struct_type
      RETURNING VALUE(r_struct) TYPE struct_type.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lista2_atividade15 IMPLEMENTATION.
  METHOD receive_struct.
    r_struct = i_struct.

    DATA sum TYPE i.
    DATA vowel TYPE string VALUE 'aeiouy'.

    sum = i_struct-int1 + i_struct-int2.

    IF ( sum MOD 2 ) > 0.
      CLEAR r_struct-char1.
      CLEAR r_struct-char2.
    ENDIF.

    IF i_struct-char1 CA vowel AND i_struct-char2 CA vowel.
      CLEAR r_struct-int1.
      CLEAR r_struct-int2.
    ENDIF.
  ENDMETHOD.
ENDCLASS.
