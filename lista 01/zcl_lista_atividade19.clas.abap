CLASS zcl_lista_atividade19 DEFINITION
  PUBLIC
  FINAL
  CREATE PUBLIC .

  PUBLIC SECTION.

    INTERFACES if_oo_adt_classrun .
  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lista_atividade19 IMPLEMENTATION.
  METHOD if_oo_adt_classrun~main.

    DATA christmas_date TYPE d VALUE '20241224'.
    out->write( |{ christmas_date DATE = USER }| ).

  ENDMETHOD.
ENDCLASS.
