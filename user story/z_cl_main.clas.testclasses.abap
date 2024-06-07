CLASS ltd_fill_header DEFINITION FINAL FOR TESTING INHERITING FROM z_cl_fill_header.
  PUBLIC SECTION.
    METHODS:
      execute REDEFINITION,
      set_header
        IMPORTING
          i_header_table TYPE z_cl_fill_header=>return_type.

  PRIVATE SECTION.
    DATA header_table TYPE z_cl_fill_header=>return_type.
ENDCLASS.

CLASS ltd_fill_header IMPLEMENTATION.

  METHOD execute.
    return = me->header_table.
  ENDMETHOD.

  METHOD set_header.
    me->header_table = i_header_table.
  ENDMETHOD.

ENDCLASS.



CLASS ltd_fill_item DEFINITION FINAL FOR TESTING INHERITING FROM z_cl_fill_item.
  PUBLIC SECTION.
    METHODS:
      execute REDEFINITION,
      set_item
        IMPORTING
          i_item_table TYPE z_cl_fill_item=>return_type.

  PRIVATE SECTION.
    DATA item_table TYPE z_cl_fill_item=>return_type.
ENDCLASS.

CLASS ltd_fill_item IMPLEMENTATION.

  METHOD execute.
    return = me->item_table.
  ENDMETHOD.

  METHOD set_item.
    me->item_table = i_item_table.
  ENDMETHOD.

ENDCLASS.




CLASS ltc_test_item DEFINITION FOR TESTING
                    RISK LEVEL HARMLESS
                    DURATION SHORT.
  PUBLIC SECTION.
    METHODS test_execute_main FOR TESTING.

  PRIVATE SECTION.
    DATA class_main_test   TYPE REF TO z_cl_main.
    DATA class_fill_header TYPE REF TO z_cl_fill_header.
    DATA class_fill_item   TYPE REF TO z_cl_fill_item.

    METHODS setup.
ENDCLASS.

CLASS ltc_test_item IMPLEMENTATION.

  METHOD setup.
    class_fill_header = NEW ltd_fill_header( ).
    class_fill_item   = NEW ltd_fill_item( ).

    class_main_test = NEW #(
      i_class_fill_header = class_fill_header
      i_class_fill_item   = class_fill_item
    ).
  ENDMETHOD.

  METHOD test_execute_main.

  ENDMETHOD.

ENDCLASS.
