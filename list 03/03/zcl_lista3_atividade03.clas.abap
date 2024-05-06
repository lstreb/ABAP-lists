CLASS zcl_lista3_atividade03 DEFINITION PUBLIC.

  PUBLIC SECTION.
    TYPES: BEGIN OF struct,
            bname TYPE xubname,
           END OF struct.

    TYPES r_type_usr04 TYPE STANDARD TABLE OF usr04 WITH EMPTY KEY.

    TYPES r_type TYPE STANDARD TABLE OF struct WITH EMPTY KEY.

    METHODS get_usernames
      RETURNING VALUE(return) TYPE r_type.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lista3_atividade03 IMPLEMENTATION.

  METHOD get_usernames.
    SELECT
      FROM USR04
      FIELDS bname
      INTO TABLE @return.
  ENDMETHOD.

ENDCLASS.
