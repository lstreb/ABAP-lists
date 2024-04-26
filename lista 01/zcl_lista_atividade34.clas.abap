CLASS zcl_lista_atividade34 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lista_atividade34 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    CONSTANTS: BEGIN OF struct,
               number1 TYPE i VALUE 0,
               date1 TYPE d VALUE '20031124',
               string1 TYPE string VALUE 'Laura',
               character1 TYPE c VALUE 'L',
               time1 TYPE t VALUE '103000',
               END OF struct.

  ENDMETHOD.
ENDCLASS.
