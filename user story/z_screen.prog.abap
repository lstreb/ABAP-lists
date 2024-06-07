*&---------------------------------------------------------------------*
*& Report z_screen
*&---------------------------------------------------------------------*
*&
*&---------------------------------------------------------------------*
REPORT z_screen.

PARAMETERS material TYPE matnr      OBLIGATORY.
PARAMETERS quantity TYPE menge13    OBLIGATORY.
PARAMETERS uom      TYPE msehi      OBLIGATORY.
PARAMETERS period   TYPE n LENGTH 1 OBLIGATORY.
PARAMETERS datefrom TYPE dats       OBLIGATORY.
PARAMETERS dateto   TYPE dats       OBLIGATORY.
PARAMETERS origin   TYPE ktext      OBLIGATORY.
PARAMETERS destin   TYPE ktext      OBLIGATORY.
PARAMETERS mot      TYPE text40     OBLIGATORY.

START-OF-SELECTION.
  DATA item_table TYPE z_cl_fill_item=>return_type.

  item_table = NEW z_cl_main(  )->execute( VALUE #(
    material_number = material
    quantity        = quantity
    uom             = uom
    period          = period
    date_from       = datefrom
    date_to         = dateto
    origin_loc      = origin
    destination_loc = destin
    mot_description = mot
  ) ).

  cl_salv_table=>factory(
  IMPORTING
    r_salv_table = DATA(lo_alv)
  CHANGING
    t_table = item_table ).

  lo_alv->get_columns( )->set_optimize( abap_true ).
  lo_alv->display( ).
