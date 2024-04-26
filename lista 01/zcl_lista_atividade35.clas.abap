CLASS zcl_lista_atividade35 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lista_atividade35 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    CONSTANTS first_constant TYPE i VALUE 0.
    CONSTANTS second_constant LIKE first_constant VALUE 1.

    out->write( first_constant ).
    out->write( second_constant ).

  ENDMETHOD.
ENDCLASS.
