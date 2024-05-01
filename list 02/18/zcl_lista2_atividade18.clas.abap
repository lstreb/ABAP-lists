CLASS zcl_lista2_atividade18 DEFINITION PUBLIC.

  PUBLIC SECTION.
    TYPES: BEGIN OF struct_type,
            field1 TYPE i,
            field2 TYPE i,
            field3 TYPE i,
            field4 TYPE i,
            field5 TYPE i,
           END OF struct_type.

    TYPES table_type TYPE STANDARD TABLE OF struct_type WITH EMPTY KEY.

    METHODS receive_table
      IMPORTING
        internal_table TYPE table_type
      RETURNING VALUE(result) TYPE table_type.

  PROTECTED SECTION.

  PRIVATE SECTION.
ENDCLASS.



CLASS zcl_lista2_atividade18 IMPLEMENTATION.
  METHOD receive_table.
    result = internal_table.

    APPEND INITIAL LINE TO result.

    result[ 1 ]-field1 = 1.
    result[ 1 ]-field2 = 2.
    result[ 1 ]-field3 = 3.
  ENDMETHOD.
ENDCLASS.
