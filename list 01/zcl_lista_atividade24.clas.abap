CLASS zcl_lista_atividade24 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lista_atividade24 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    TYPES: BEGIN OF struct_sflight,
           carrid TYPE sflight-carrid,
           connid TYPE sflight-connid,
           fldate TYPE sflight-fldate,
           price TYPE sflight-price,
           currency TYPE sflight-currency,
           planetype TYPE sflight-planetype,
           seatsmax TYPE sflight-seatsmax,
           seatsocc TYPE sflight-seatsocc,
           END OF struct_sflight.

  ENDMETHOD.
ENDCLASS.
