CLASS zcl_lista_atividade06 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lista_atividade06 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

   TYPES: BEGIN OF struct,
            character_type TYPE c LENGTH 10,
            integer_type TYPE i,
            number_type TYPE p LENGTH 7 DECIMALS 0,
            date_type TYPE d,
            time_type TYPE t,
          END OF struct.

  ENDMETHOD.
ENDCLASS.
