CLASS zcl_lista3_atividade06_concat DEFINITION PUBLIC.

  PUBLIC SECTION.
    METHODS concatenate
      IMPORTING
        i_username_list TYPE zcl_lista3_atividade06_select=>r_type
      RETURNING VALUE(return) TYPE string.

  PROTECTED SECTION.

  PRIVATE SECTION.

ENDCLASS.



CLASS zcl_lista3_atividade06_concat IMPLEMENTATION.

  METHOD concatenate.
    CONCATENATE LINES OF i_username_list INTO return SEPARATED BY ' '.
  ENDMETHOD.

ENDCLASS.
