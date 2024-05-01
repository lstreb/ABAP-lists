CLASS zcl_lista_atividade17 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lista_atividade17 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA variable TYPE i VALUE 42.
    out->write( variable ).

  ENDMETHOD.
ENDCLASS.
