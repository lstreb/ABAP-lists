CLASS zcl_lista_atividade37 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lista_atividade37 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA variable TYPE i.

    DATA other_variable LIKE variable.
    TYPES my_type LIKE variable.
    CONSTANTS constant LIKE variable VALUE 1.

    TYPES: BEGIN OF struct,
           component1 TYPE i,
           component2 TYPE d,
           component3 LIKE variable,
           END OF struct.

    DATA internal_table LIKE TABLE OF variable.

  ENDMETHOD.
ENDCLASS.
