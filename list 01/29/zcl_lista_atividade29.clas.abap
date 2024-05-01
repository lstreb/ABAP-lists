CLASS zcl_lista_atividade29 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lista_atividade29 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    TYPES: BEGIN OF struct,
           scarr TYPE scarr,
           telephone TYPE scustom-telephone,
           END OF struct.

    DATA internal_table TYPE TABLE OF struct.

  ENDMETHOD.
ENDCLASS.
