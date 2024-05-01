CLASS zcl_lista_atividade40 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lista_atividade40 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA false TYPE abap_bool VALUE ''.
    DATA true TYPE abap_bool VALUE 'X'.

    IF true = abap_true.
      out->write( 'é true' ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
