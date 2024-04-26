CLASS zcl_lista_atividade32 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lista_atividade32 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    CONSTANTS pi_decimals TYPE p LENGTH 7 DECIMALS 5 VALUE '3.14159'.
    out->write( pi_decimals ).

  ENDMETHOD.
ENDCLASS.
