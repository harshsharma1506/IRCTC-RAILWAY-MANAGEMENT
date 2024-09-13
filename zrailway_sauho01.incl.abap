*&---------------------------------------------------------------------*
*&  Include           ZRAILWAY_SAUH1O01
*&---------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  STATUS_0517  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE status_0517 OUTPUT.
  SET PF-STATUS 'GUI_SAUH1'.
  SET TITLEBAR 'TITLEBAR_SAUH1'.
  PERFORM image.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  STATUS_0518  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE status_0518 OUTPUT.
  SET PF-STATUS 'GUI_BUTTONS'.
  SET TITLEBAR 'TITLEBAR_SAUH2'.
  PERFORM image.
  PERFORM image1.
  PERFORM image2.
  PERFORM image3.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  STATUS_0519  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE status_0519 OUTPUT.
  SET PF-STATUS 'GUI_519'.
  SET TITLEBAR 'TITLE_519'.
  PERFORM image1.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  STATUS_0521  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE status_0521 OUTPUT.
  SET PF-STATUS 'STATUS_521'.
  SET TITLEBAR 'TITLE_521'.
  PERFORM image2.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  STATUS_0523  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE status_0523 OUTPUT.
  SET PF-STATUS 'GUI_523'.
  SET TITLEBAR 'TITLE_523'.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  STATUS_0524  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE status_0524 OUTPUT.
*  SET PF-STATUS 'xxxxxxxx'.
*  SET TITLEBAR 'xxx'.
  PERFORM refresh_alv_ticket.



ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  STATUS_0525  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE status_0525 OUTPUT.
  SET PF-STATUS 'GUI_525'.
  SET TITLEBAR 'TITLE_525'.
  PERFORM image4.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  STATUS_0526  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE status_0526 OUTPUT.
*  SET PF-STATUS 'xxxxxxxx'.
*  SET TITLEBAR 'xxx'.
  DATA: contain    TYPE REF TO cl_gui_custom_container,
        grid_1    TYPE REF TO cl_gui_alv_grid,
        it_final_1 TYPE STANDARD TABLE OF zrailway_comp.
  SELECT * FROM ZRAILWAY_COMP INTO TABLE IT_FINAL_1.
  CREATE OBJECT contain
    EXPORTING
*     parent         =
      container_name = 'ALV_CONT'
*     style          =
*     lifetime       = lifetime_default
*     repid          =
*     dynnr          =
*     no_autodef_progid_dynnr     =
*    EXCEPTIONS
*     cntl_error     = 1
*     cntl_system_error           = 2
*     create_error   = 3
*     lifetime_error = 4
*     lifetime_dynpro_dynpro_link = 5
*     others         = 6
    .
  IF sy-subrc <> 0.
*   MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*              WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
  ENDIF.

  CREATE OBJECT grid_1
    EXPORTING
*     i_shellstyle      = 0
*     i_lifetime        =
      i_parent = contain
*     i_appl_events     = space
*     i_parentdbg       =
*     i_applogparent    =
*     i_graphicsparent  =
*     i_name   =
*     i_fcat_complete   = SPACE
*    EXCEPTIONS
*     error_cntl_create = 1
*     error_cntl_init   = 2
*     error_cntl_link   = 3
*     error_dp_create   = 4
*     others   = 5
    .
  IF sy-subrc <> 0.
*   MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*              WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
  ENDIF.

  CALL METHOD grid_1->set_table_for_first_display
    EXPORTING
*     i_buffer_active  =
*     i_bypassing_buffer            =
*     i_consistency_check           =
      i_structure_name = 'ZRAILWAY_COMP'
*     is_variant       =
*     i_save           =
*     i_default        = 'X'
*     is_layout        =
*     is_print         =
*     it_special_groups             =
*     it_toolbar_excluding          =
*     it_hyperlink     =
*     it_alv_graphics  =
*     it_except_qinfo  =
*     ir_salv_adapter  =
    CHANGING
      it_outtab        = it_final_1
*     it_fieldcatalog  =
*     it_sort          =
*     it_filter        =
*    EXCEPTIONS
*     invalid_parameter_combination = 1
*     program_error    = 2
*     too_many_lines   = 3
*     others           = 4
    .
  IF sy-subrc <> 0.
*   Implement suitable error handling here
  ENDIF.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  STATUS_0527  OUTPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE status_0527 OUTPUT.
  SET PF-STATUS  'GUI_527'.
  SET TITLEBAR 'T_527'.
  CASE SY-UCOMM.
  WHEN 'CANCEL'.
    call SCREEN '525'.
    ENDCASE.
ENDMODULE.
