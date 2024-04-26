CLASS zcl_lista_atividade15 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lista_atividade15 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA variable TYPE c LENGTH 10 VALUE 'Hello ABAP'.
    out->write( variable ).

  ENDMETHOD.
ENDCLASS.
