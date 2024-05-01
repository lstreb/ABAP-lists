CLASS zcl_lista_atividade13 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lista_atividade13 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    TYPES: BEGIN OF struct_sflight,
           carrid TYPE s_carr_id,
           connid TYPE s_conn_id,
           fldate TYPE s_date,
           price TYPE s_price,
           currency TYPE s_currcode,
           planetype TYPE s_planetye ,
           seatsmax TYPE s_seatsmax,
           seatsocc TYPE s_seatsocc,
           END OF struct_sflight.

    TYPES my_table TYPE TABLE OF struct_sflight.

  ENDMETHOD.
ENDCLASS.
