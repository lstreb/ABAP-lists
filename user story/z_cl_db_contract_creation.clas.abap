CLASS z_cl_db_contract_creation DEFINITION PUBLIC.

  PUBLIC SECTION.
    TYPES: BEGIN OF return_type,
            location_plant       TYPE werks,
            location_description TYPE text40,
           END OF return_type.

    METHODS get_plant_description
      IMPORTING
        i_data TYPE ktext
      RETURNING
        VALUE(return) TYPE return_type.

    METHODS get_material_description
      IMPORTING
        i_material_number TYPE matnr
      RETURNING
        VALUE(return) TYPE text40.

    METHODS get_mot
      IMPORTING
        i_mot_description TYPE text40
      RETURNING
        VALUE(return) TYPE vktra.

    METHODS get_periodicity_description
      IMPORTING
        i_periodicity TYPE n
      RETURNING
        VALUE(return) TYPE text40.

    METHODS insert_header
      IMPORTING
        i_header_table TYPE z_cl_fill_header=>return_type.

    METHODS insert_item
      IMPORTING
        i_item_table TYPE z_cl_fill_item=>return_type.

  PROTECTED SECTION.
  PRIVATE SECTION.
ENDCLASS.



CLASS z_cl_db_contract_creation IMPLEMENTATION.

  METHOD get_plant_description.
    SELECT SINGLE
      FROM t499s
      FIELDS werks, ktext
      WHERE stand = @i_data
      INTO @data(data).
      return-location_plant = data-werks.
      return-location_description = data-ktext.
  ENDMETHOD.

  METHOD get_material_description.
    SELECT SINGLE
      FROM makt
      FIELDS maktx
      WHERE matnr = @i_material_number
      INTO @return.
  ENDMETHOD.

  METHOD get_mot.
    SELECT SINGLE
      FROM t173t
      FIELDS vsart
      WHERE bezei = @i_mot_description
      INTO @return.
  ENDMETHOD.

  METHOD get_periodicity_description.
    SELECT SINGLE
      FROM dd07t
      FIELDS ddtext
      WHERE domvalue_l = @i_periodicity
        AND domname    = '/DMBE/D_PERIODICITY'
        AND ddlanguage = @sy-langu
      INTO @return.
  ENDMETHOD.

  METHOD insert_header.
    INSERT INTO /dmbe/t_header VALUES i_header_table.
    COMMIT WORK.
  ENDMETHOD.

  METHOD insert_item.
    INSERT /dmbe/t_item FROM TABLE i_item_table.
    COMMIT WORK.
  ENDMETHOD.

ENDCLASS.
