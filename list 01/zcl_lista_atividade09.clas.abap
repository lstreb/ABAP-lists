CLASS zcl_lista_atividade09 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lista_atividade09 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    TYPES: BEGIN OF struct_sbook,
           carrid TYPE s_carr_id,
           connid TYPE s_conn_id,
           fldate TYPE s_date,
           bookid TYPE s_book_id,
           customid TYPE s_customer,
           END OF struct_sbook.

  ENDMETHOD.
ENDCLASS.
