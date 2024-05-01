CLASS zcl_lista_atividade14 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lista_atividade14 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    TYPES: BEGIN OF struct_sbook,
           carrid TYPE s_carr_id,
           connid TYPE s_conn_id,
           fldate TYPE s_date,
           bookid TYPE s_book_id,
           END OF struct_sbook.

    DATA internal_table TYPE TABLE OF struct_sbook.

  ENDMETHOD.
ENDCLASS.
