CLASS zcl_lista_atividade16 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lista_atividade16 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA variable TYPE n LENGTH 4 VALUE 1234.
    out->write( variable ).

  ENDMETHOD.
ENDCLASS.
