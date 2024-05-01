CLASS zcl_lista_atividade39 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lista_atividade39 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    TYPES: BEGIN OF struct,
           component1 TYPE zcl_lista_atividade38=>struct_ex38,
           component2 TYPE zcl_lista_atividade38=>struct_ex38,
           component3 TYPE zcl_lista_atividade38=>struct_ex38,
           component4 TYPE zcl_lista_atividade38=>struct_ex38,
           component5 TYPE zcl_lista_atividade38=>struct_ex38,
           END OF struct.
  ENDMETHOD.
ENDCLASS.
