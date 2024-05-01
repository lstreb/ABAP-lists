CLASS zcl_lista2_atividade16 DEFINITION PUBLIC.

  PUBLIC SECTION.
    METHODS concatenates_lines
      IMPORTING
        internal_table TYPE string_table
      RETURNING VALUE(result) TYPE string.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lista2_atividade16 IMPLEMENTATION.
  METHOD concatenates_lines.
    result = concat_lines_of( table = internal_table sep = ` ` ).
  ENDMETHOD.
ENDCLASS.
