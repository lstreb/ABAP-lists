CLASS zcl_lista_atividade31 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lista_atividade31 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    CONSTANTS true TYPE c VALUE 'X'.
    CONSTANTS false TYPE c VALUE ''.

    IF false = abap_false.
      out->write( 'é false' ).
    ENDIF.

  ENDMETHOD.
ENDCLASS.
