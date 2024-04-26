CLASS zcl_lista_atividade38 DEFINITION
  PUBLIC

  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.
    TYPES my_c TYPE c LENGTH 1.
    TYPES my_p TYPE p LENGTH 10 DECIMALS 2.

    TYPES: BEGIN OF component1,
           field1 TYPE i,
           field2 TYPE i,
           field3 TYPE i,
           field4 TYPE i,
           field5 TYPE i,
           END OF component1.

    TYPES: BEGIN OF component2,
           field1 TYPE string,
           field2 TYPE string,
           field3 TYPE string,
           field4 TYPE string,
           field5 TYPE string,
           END OF component2.

    TYPES: BEGIN OF component3,
           field1 TYPE d,
           field2 TYPE d,
           field3 TYPE d,
           field4 TYPE d,
           field5 TYPE d,
           END OF component3.

    TYPES: BEGIN OF component4,
           field1 TYPE my_c,
           field2 TYPE my_c,
           field3 TYPE my_c,
           field4 TYPE my_c,
           field5 TYPE my_c,
           END OF component4.

    TYPES: BEGIN OF component5,
           field1 TYPE my_p,
           field2 TYPE my_p,
           field3 TYPE my_p,
           field4 TYPE my_p,
           field5 TYPE my_p,
           END OF component5.

    TYPES: BEGIN OF struct_ex38,
           component1 TYPE component1,
           component2 TYPE component2,
           component3 TYPE component3,
           component4 TYPE component4,
           component5 TYPE component5,
           END OF struct_ex38.

    DATA internal_table TYPE TABLE OF struct_ex38.
    DATA struct_internal_table TYPE struct_ex38.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lista_atividade38 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

  internal_table = VALUE #(
    ( component1 = VALUE #( field1 = 7 )  component2 = VALUE #( field2 = 'test' ) )
    (  )
    ( component3 = VALUE #( field4 = '20031124' ) )
  ).

  APPEND VALUE #(
   component1 = VALUE #( field1 = 9 )
  ) TO internal_table.

  struct_internal_table-component1-field1 = 4.
  APPEND struct_internal_table to internal_table.

  READ TABLE internal_table INTO DATA(structure) INDEX 1.

  IF sy-subrc = 0.
    out->write( structure-component1-field1 ).
  ENDIF.

  ENDMETHOD.
ENDCLASS.
