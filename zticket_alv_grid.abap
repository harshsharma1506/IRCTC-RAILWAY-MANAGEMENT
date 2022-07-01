REPORT ZTRAIN_GRID.
DATA: CON TYPE REF TO CL_GUI_CUSTOM_CONTAINER,
      GRID TYPE REF TO CL_GUI_ALV_GRID,
      IT_TRAIN TYPE STANDARD TABLE OF ZRAILWAY_TRAIN.
SELECT * FROM ZRAILWAY_TRAIN INTO TABLE IT_TRAIN.
call screen 522.
*&---------------------------------------------------------------------*
*&      Module  STATUS_0522  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE status_0522 OUTPUT.
   SET PF-STATUS 'ZSTATUS_522'.
   SET TITLEBAR 'ZTITLE_522'.
   CREATE OBJECT con
     EXPORTING
*       parent                      =
       container_name              = 'ALV_CON'
*       style                       =
*       lifetime                    = lifetime_default
*       repid                       =
*       dynnr                       =
*       no_autodef_progid_dynnr     =
*     EXCEPTIONS
*       cntl_error                  = 1
*       cntl_system_error           = 2
*       create_error                = 3
*       lifetime_error              = 4
*       lifetime_dynpro_dynpro_link = 5
*       others                      = 6
       .
   IF sy-subrc <> 0.
*    MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*               WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
   ENDIF.

   CREATE OBJECT grid
     EXPORTING
*       i_shellstyle      = 0
*       i_lifetime        =
       i_parent          = CON
*       i_appl_events     = space
*       i_parentdbg       =
*       i_applogparent    =
*       i_graphicsparent  =
*       i_name            =
*       i_fcat_complete   = SPACE
*     EXCEPTIONS
*       error_cntl_create = 1
*       error_cntl_init   = 2
*       error_cntl_link   = 3
*       error_dp_create   = 4
*       others            = 5
       .
   IF sy-subrc <> 0.
*    MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*               WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
   ENDIF.

   CALL METHOD grid->set_table_for_first_display
     EXPORTING
*       i_buffer_active               =
*       i_bypassing_buffer            =
*       i_consistency_check           =
       i_structure_name              = 'ZRAILWAY_TRAIN'
*       is_variant                    =
*       i_save                        =
*       i_default                     = 'X'
*       is_layout                     =
*       is_print                      =
*       it_special_groups             =
*       it_toolbar_excluding          =
*       it_hyperlink                  =
*       it_alv_graphics               =
*       it_except_qinfo               =
*       ir_salv_adapter               =
     CHANGING
       it_outtab                     = IT_TRAIN
*       it_fieldcatalog               =
*       it_sort                       =
*       it_filter                     =
*     EXCEPTIONS
*       invalid_parameter_combination = 1
*       program_error                 = 2
*       too_many_lines                = 3
*       others                        = 4
           .
   IF sy-subrc <> 0.
*    Implement suitable error handling here
   ENDIF.



ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0522  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0522 INPUT.
  CASE SY-UCOMM.
    when 'PRINT1'.
      SUBMIT ZTRAIN_DRIVER VIA SELECTION-SCREEN AND RETURN.
    WHEN 'BACK1' OR 'CANCEL1' OR 'EXIT1'.
      LEAVE PROGRAM.
          ENDCASE.

ENDMODULE.
