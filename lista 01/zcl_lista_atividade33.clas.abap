CLASS zcl_lista_atividade33 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lista_atividade33 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    CONSTANTS: BEGIN OF struct,
               number1 TYPE i VALUE 0,
               number2 TYPE i VALUE 0,
               number3 TYPE i VALUE 0,
               END OF struct.

  ENDMETHOD.
ENDCLASS.
