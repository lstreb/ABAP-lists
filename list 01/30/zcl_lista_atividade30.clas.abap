CLASS zcl_lista_atividade30 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lista_atividade30 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    CONSTANTS name TYPE string VALUE 'Laura'.
    out->write( name ).

  ENDMETHOD.
ENDCLASS.
