CLASS zcl_lista_atividade18 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lista_atividade18 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA variable TYPE i VALUE '12.72'.
    out->write( variable ).

  ENDMETHOD.
ENDCLASS.
