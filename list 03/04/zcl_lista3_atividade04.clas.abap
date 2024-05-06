CLASS zcl_lista3_atividade04 DEFINITION PUBLIC.

  PUBLIC SECTION.
    TYPES table_type TYPE STANDARD TABLE OF mara WITH KEY matnr.

    METHODS checks_if_pipe_exists
      RETURNING VALUE(return) TYPE abap_bool.

  PROTECTED SECTION.


  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lista3_atividade04 IMPLEMENTATION.

  METHOD checks_if_pipe_exists.
    DATA matkl TYPE matkl.

    SELECT
      FROM mara
      FIELDS matkl
      WHERE matkl = 'pipe'
      INTO @matkl.
    ENDSELECT.

    IF sy-subrc = 0.
      return = abap_true.

    ELSEIF sy-subrc = 4.
      return = abap_false.

    ENDIF.

  ENDMETHOD.

ENDCLASS.
