CLASS zcl_lista2_atividade13 DEFINITION PUBLIC.

  PUBLIC SECTION.
    METHODS count_range
      IMPORTING
        min_number TYPE i
        max_number TYPE i
      RETURNING VALUE(multiples) TYPE string_table.
  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lista2_atividade13 IMPLEMENTATION.
  METHOD count_range.

    DATA count TYPE i VALUE 0.
    DATA remain TYPE i.

    count = min_number.

    DO.
      IF count > max_number. EXIT. ENDIF.

      remain = count MOD 8.
      IF remain = 0.
        APPEND count TO multiples.
      ENDIF.

      count = count + 1.
    ENDDO.

  ENDMETHOD.
ENDCLASS.
