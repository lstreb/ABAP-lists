CLASS zcl_lista_atividade36 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lista_atividade36 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    TYPES my_type TYPE d.

    TYPES type2 TYPE my_type.
    DATA variable TYPE my_type.
    CONSTANTS constant TYPE my_type VALUE `20031124`.

    TYPES: BEGIN OF struct,
           component1 TYPE my_type,
           component2 TYPE my_type,
           component3 TYPE my_type,
           END OF struct.

    DATA internal_table TYPE TABLE OF my_type.

  ENDMETHOD.
ENDCLASS.
