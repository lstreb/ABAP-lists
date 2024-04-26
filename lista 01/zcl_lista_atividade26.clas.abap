CLASS zcl_lista_atividade26 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lista_atividade26 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    TYPES: BEGIN OF struct_sbook,
           carrid TYPE sbook-carrid,
           connid TYPE sbook-connid,
           fldate TYPE sbook-fldate,
           bookid TYPE sbook-bookid,
           customid TYPE sbook-customid,
           END OF struct_sbook.

    DATA internal_table TYPE TABLE OF struct_sbook.

  ENDMETHOD.
ENDCLASS.
