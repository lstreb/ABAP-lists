CLASS zcl_lista3_atividade01 DEFINITION PUBLIC.

  PUBLIC SECTION.
    TYPES table_type TYPE STANDARD TABLE OF mara WITH KEY matnr.

    METHODS select_mara
      RETURNING VALUE(r_table_mara) TYPE table_type.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lista3_atividade01 IMPLEMENTATION.

  METHOD select_mara.

    SELECT
      FROM mara
      FIELDS *
      INTO TABLE @r_table_mara.

  ENDMETHOD.

ENDCLASS.
