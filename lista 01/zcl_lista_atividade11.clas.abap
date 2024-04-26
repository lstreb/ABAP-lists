CLASS zcl_lista_atividade11 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_lista_atividade11 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    TYPES: BEGIN OF struct,
           int1 TYPE i,
           END OF struct.

    TYPES table_numbers TYPE TABLE OF struct.

  ENDMETHOD.
ENDCLASS.
