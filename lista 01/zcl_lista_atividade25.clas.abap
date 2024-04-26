CLASS zcl_lista_atividade25 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lista_atividade25 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    TYPES: BEGIN OF struct,
           sbook TYPE sbook,
           telephone TYPE scustom-telephone,
           END OF struct.

  ENDMETHOD.
ENDCLASS.
