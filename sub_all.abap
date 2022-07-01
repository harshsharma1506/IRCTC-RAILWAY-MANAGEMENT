*&---------------------------------------------------------------------*
*&  Include           ZRAILWAY_SAUH1F01
*&---------------------------------------------------------------------*
FORM image .
  DATA: w_lines TYPE i.
  TYPES pict_line(256) TYPE c.
  DATA :
    container TYPE REF TO cl_gui_custom_container,
    editor    TYPE REF TO cl_gui_textedit,
    picture   TYPE REF TO cl_gui_picture,
    pict_tab  TYPE TABLE OF pict_line,
    url(255)  TYPE c.
  DATA: graphic_url(255).
  DATA: BEGIN OF graphic_table OCCURS 0,
          line(255) TYPE x,
        END OF graphic_table.
  DATA: l_graphic_conv TYPE i.
  DATA: l_graphic_offs TYPE i.
  DATA: graphic_size TYPE i.
  DATA: l_graphic_xstr TYPE xstring.
  .
  CALL METHOD cl_gui_cfw=>flush.
  CREATE OBJECT:
  container EXPORTING container_name = 'LOGO',
  picture EXPORTING parent = container.
  CALL METHOD cl_ssf_xsf_utilities=>get_bds_graphic_as_bmp
    EXPORTING
      p_object = 'GRAPHICS'
      p_name   = 'IRCTC'
      p_id     = 'BMAP'
      p_btype  = 'BCOL'
    RECEIVING
      p_bmp    = l_graphic_xstr
*  EXCEPTIONS
*     NOT_FOUND      = 1
*     INTERNAL_ERROR = 2
*     others   = 3
    .
  IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*            WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
  ENDIF.
  graphic_size = xstrlen( l_graphic_xstr ).
  l_graphic_conv = graphic_size.
  l_graphic_offs = 0.
  WHILE l_graphic_conv > 255.
    graphic_table-line = l_graphic_xstr+l_graphic_offs(255).
    APPEND graphic_table.
    l_graphic_offs = l_graphic_offs + 255.
    l_graphic_conv = l_graphic_conv - 255.
  ENDWHILE.
  graphic_table-line = l_graphic_xstr+l_graphic_offs(l_graphic_conv).
  APPEND graphic_table.
  CALL FUNCTION 'DP_CREATE_URL'
    EXPORTING
      type     = 'IMAGE'
      subtype  = 'X-UNKNOWN'
      size     = graphic_size
      lifetime = 'T'
    TABLES
      data     = graphic_table
    CHANGING
      url      = url.
  CALL METHOD picture->load_picture_from_url
    EXPORTING
      url = url.
  CALL METHOD picture->set_display_mode
    EXPORTING
      display_mode = picture->display_mode_fit_center.
ENDFORM.

FORM image1.
  DATA: w_lines TYPE i.
  TYPES pict_line(256) TYPE c.
  DATA :
    container TYPE REF TO cl_gui_custom_container,
    editor    TYPE REF TO cl_gui_textedit,
    picture   TYPE REF TO cl_gui_picture,
    pict_tab  TYPE TABLE OF pict_line,
    url(255)  TYPE c.
  DATA: graphic_url(255).
  DATA: BEGIN OF graphic_table OCCURS 0,
          line(255) TYPE x,
        END OF graphic_table.
  DATA: l_graphic_conv TYPE i.
  DATA: l_graphic_offs TYPE i.
  DATA: graphic_size TYPE i.
  DATA: l_graphic_xstr TYPE xstring.
  .
  CALL METHOD cl_gui_cfw=>flush.
  CREATE OBJECT:
  container EXPORTING container_name = 'LOCOCON',
  picture EXPORTING parent = container.
  CALL METHOD cl_ssf_xsf_utilities=>get_bds_graphic_as_bmp
    EXPORTING
      p_object = 'GRAPHICS'
      p_name   = 'LOCO DRIVER'
      p_id     = 'BMAP'
      p_btype  = 'BCOL'
    RECEIVING
      p_bmp    = l_graphic_xstr
*  EXCEPTIONS
*     NOT_FOUND      = 1
*     INTERNAL_ERROR = 2
*     others   = 3
    .
  IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*            WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
  ENDIF.
  graphic_size = xstrlen( l_graphic_xstr ).
  l_graphic_conv = graphic_size.
  l_graphic_offs = 0.
  WHILE l_graphic_conv > 255.
    graphic_table-line = l_graphic_xstr+l_graphic_offs(255).
    APPEND graphic_table.
    l_graphic_offs = l_graphic_offs + 255.
    l_graphic_conv = l_graphic_conv - 255.
  ENDWHILE.
  graphic_table-line = l_graphic_xstr+l_graphic_offs(l_graphic_conv).
  APPEND graphic_table.
  CALL FUNCTION 'DP_CREATE_URL'
    EXPORTING
      type     = 'IMAGE'
      subtype  = 'X-UNKNOWN'
      size     = graphic_size
      lifetime = 'T'
    TABLES
      data     = graphic_table
    CHANGING
      url      = url.
  CALL METHOD picture->load_picture_from_url
    EXPORTING
      url = url.
  CALL METHOD picture->set_display_mode
    EXPORTING
      display_mode = picture->display_mode_fit_center.
ENDFORM.

FORM image2.
  DATA: w_lines TYPE i.
  TYPES pict_line(256) TYPE c.
  DATA :
    container TYPE REF TO cl_gui_custom_container,
    editor    TYPE REF TO cl_gui_textedit,
    picture   TYPE REF TO cl_gui_picture,
    pict_tab  TYPE TABLE OF pict_line,
    url(255)  TYPE c.
  DATA: graphic_url(255).
  DATA: BEGIN OF graphic_table OCCURS 0,
          line(255) TYPE x,
        END OF graphic_table.
  DATA: l_graphic_conv TYPE i.
  DATA: l_graphic_offs TYPE i.
  DATA: graphic_size TYPE i.
  DATA: l_graphic_xstr TYPE xstring.
  .
  CALL METHOD cl_gui_cfw=>flush.
  CREATE OBJECT:
  container EXPORTING container_name = 'TRAINCON',
  picture EXPORTING parent = container.
  CALL METHOD cl_ssf_xsf_utilities=>get_bds_graphic_as_bmp
    EXPORTING
      p_object = 'GRAPHICS'
      p_name   = 'TRAIN CARD'
      p_id     = 'BMAP'
      p_btype  = 'BCOL'
    RECEIVING
      p_bmp    = l_graphic_xstr
*  EXCEPTIONS
*     NOT_FOUND      = 1
*     INTERNAL_ERROR = 2
*     others   = 3
    .
  IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*            WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
  ENDIF.
  graphic_size = xstrlen( l_graphic_xstr ).
  l_graphic_conv = graphic_size.
  l_graphic_offs = 0.
  WHILE l_graphic_conv > 255.
    graphic_table-line = l_graphic_xstr+l_graphic_offs(255).
    APPEND graphic_table.
    l_graphic_offs = l_graphic_offs + 255.
    l_graphic_conv = l_graphic_conv - 255.
  ENDWHILE.
  graphic_table-line = l_graphic_xstr+l_graphic_offs(l_graphic_conv).
  APPEND graphic_table.
  CALL FUNCTION 'DP_CREATE_URL'
    EXPORTING
      type     = 'IMAGE'
      subtype  = 'X-UNKNOWN'
      size     = graphic_size
      lifetime = 'T'
    TABLES
      data     = graphic_table
    CHANGING
      url      = url.
  CALL METHOD picture->load_picture_from_url
    EXPORTING
      url = url.
  CALL METHOD picture->set_display_mode
    EXPORTING
      display_mode = picture->display_mode_fit_center.
ENDFORM.

FORM image3.
  DATA: w_lines TYPE i.
  TYPES pict_line(256) TYPE c.
  DATA :
    container TYPE REF TO cl_gui_custom_container,
    editor    TYPE REF TO cl_gui_textedit,
    picture   TYPE REF TO cl_gui_picture,
    pict_tab  TYPE TABLE OF pict_line,
    url(255)  TYPE c.
  DATA: graphic_url(255).
  DATA: BEGIN OF graphic_table OCCURS 0,
          line(255) TYPE x,
        END OF graphic_table.
  DATA: l_graphic_conv TYPE i.
  DATA: l_graphic_offs TYPE i.
  DATA: graphic_size TYPE i.
  DATA: l_graphic_xstr TYPE xstring.
  .
  CALL METHOD cl_gui_cfw=>flush.
  CREATE OBJECT:
  container EXPORTING container_name = 'SCHEDULECON',
  picture EXPORTING parent = container.
  CALL METHOD cl_ssf_xsf_utilities=>get_bds_graphic_as_bmp
    EXPORTING
      p_object = 'GRAPHICS'
      p_name   = 'PASSENGER'
      p_id     = 'BMAP'
      p_btype  = 'BCOL'
    RECEIVING
      p_bmp    = l_graphic_xstr
*  EXCEPTIONS
*     NOT_FOUND      = 1
*     INTERNAL_ERROR = 2
*     others   = 3
    .
  IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*            WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
  ENDIF.
  graphic_size = xstrlen( l_graphic_xstr ).
  l_graphic_conv = graphic_size.
  l_graphic_offs = 0.
  WHILE l_graphic_conv > 255.
    graphic_table-line = l_graphic_xstr+l_graphic_offs(255).
    APPEND graphic_table.
    l_graphic_offs = l_graphic_offs + 255.
    l_graphic_conv = l_graphic_conv - 255.
  ENDWHILE.
  graphic_table-line = l_graphic_xstr+l_graphic_offs(l_graphic_conv).
  APPEND graphic_table.
  CALL FUNCTION 'DP_CREATE_URL'
    EXPORTING
      type     = 'IMAGE'
      subtype  = 'X-UNKNOWN'
      size     = graphic_size
      lifetime = 'T'
    TABLES
      data     = graphic_table
    CHANGING
      url      = url.
  CALL METHOD picture->load_picture_from_url
    EXPORTING
      url = url.
  CALL METHOD picture->set_display_mode
    EXPORTING
      display_mode = picture->display_mode_fit_center.
ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  REFRESH_ALV_TICKET'
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM refresh_alv_ticket.
  DATA: cont     TYPE REF TO cl_gui_custom_container,
        grid     TYPE REF TO cl_gui_alv_grid,
        it_final TYPE STANDARD TABLE OF zrailway_pass.
  SELECT * FROM zrailway_pass INTO TABLE it_final.
  CREATE OBJECT cont
    EXPORTING
*     parent         =
      container_name = 'ALV_CON'
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

  CREATE OBJECT grid
    EXPORTING
*     i_shellstyle      = 0
*     i_lifetime        =
      i_parent = cont
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

  CALL METHOD grid->set_table_for_first_display
    EXPORTING
*     i_buffer_active  =
*     i_bypassing_buffer            =
*     i_consistency_check           =
      i_structure_name = 'ZRAILWAY_PASS'
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
      it_outtab        = it_final
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




ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  TICKET_ISSUE
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM ticket_issue.
  DATA: it_final TYPE ztt_railway_pass,
        wa_final TYPE zstr_railway_pass.
  DATA: zfname TYPE rs38l_fnam.
  SELECT train_name1 passenger_id passenger_name1 passenger_name2 start_from go_to meal_pref gender age
   FROM zrailway_pass INTO CORRESPONDING FIELDS OF TABLE it_final  WHERE passenger_id = zrailway_pass-passenger_id.

  CALL FUNCTION 'SSF_FUNCTION_MODULE_NAME'
    EXPORTING
      formname = 'ZPASS_FORM1'
*     VARIANT  = ' '
*     DIRECT_CALL              = ' '
    IMPORTING
      fm_name  = zfname
* EXCEPTIONS
*     NO_FORM  = 1
*     NO_FUNCTION_MODULE       = 2
*     OTHERS   = 3
    .
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.
  CALL FUNCTION zfname
* EXPORTING
*   ARCHIVE_INDEX              =
*   ARCHIVE_INDEX_TAB          =
*   ARCHIVE_PARAMETERS         =
*   CONTROL_PARAMETERS         =
*   MAIL_APPL_OBJ              =
*   MAIL_RECIPIENT             =
*   MAIL_SENDER                =
*   OUTPUT_OPTIONS             =
*   USER_SETTINGS              = 'X'
* IMPORTING
*   DOCUMENT_OUTPUT_INFO       =
*   JOB_OUTPUT_INFO            =
*   JOB_OUTPUT_OPTIONS         =
    TABLES
      itab = it_final
* EXCEPTIONS
*     FORMATTING_ERROR           = 1
*     INTERNAL_ERROR             = 2
*     SEND_ERROR                 = 3
*     USER_CANCELED              = 4
*     OTHERS                     = 5
    .
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.


ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  IMAGE4
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM image4.
  DATA: w_lines TYPE i.
  TYPES pict_line(256) TYPE c.
  DATA :
    container TYPE REF TO cl_gui_custom_container,
    editor    TYPE REF TO cl_gui_textedit,
    picture   TYPE REF TO cl_gui_picture,
    pict_tab  TYPE TABLE OF pict_line,
    url(255)  TYPE c.
  DATA: graphic_url(255).
  DATA: BEGIN OF graphic_table OCCURS 0,
          line(255) TYPE x,
        END OF graphic_table.
  DATA: l_graphic_conv TYPE i.
  DATA: l_graphic_offs TYPE i.
  DATA: graphic_size TYPE i.
  DATA: l_graphic_xstr TYPE xstring.
  .
  CALL METHOD cl_gui_cfw=>flush.
  CREATE OBJECT:
  container EXPORTING container_name = 'COMPLAIN_CON',
  picture EXPORTING parent = container.
  CALL METHOD cl_ssf_xsf_utilities=>get_bds_graphic_as_bmp
    EXPORTING
      p_object = 'GRAPHICS'
      p_name   = 'cus'
      p_id     = 'BMAP'
      p_btype  = 'BCOL'
    RECEIVING
      p_bmp    = l_graphic_xstr
*  EXCEPTIONS
*     NOT_FOUND      = 1
*     INTERNAL_ERROR = 2
*     others   = 3
    .
  IF sy-subrc <> 0.
* MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*            WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
  ENDIF.
  graphic_size = xstrlen( l_graphic_xstr ).
  l_graphic_conv = graphic_size.
  l_graphic_offs = 0.
  WHILE l_graphic_conv > 255.
    graphic_table-line = l_graphic_xstr+l_graphic_offs(255).
    APPEND graphic_table.
    l_graphic_offs = l_graphic_offs + 255.
    l_graphic_conv = l_graphic_conv - 255.
  ENDWHILE.
  graphic_table-line = l_graphic_xstr+l_graphic_offs(l_graphic_conv).
  APPEND graphic_table.
  CALL FUNCTION 'DP_CREATE_URL'
    EXPORTING
      type     = 'IMAGE'
      subtype  = 'X-UNKNOWN'
      size     = graphic_size
      lifetime = 'T'
    TABLES
      data     = graphic_table
    CHANGING
      url      = url.
  CALL METHOD picture->load_picture_from_url
    EXPORTING
      url = url.
  CALL METHOD picture->set_display_mode
    EXPORTING
      display_mode = picture->display_mode_fit_center.

ENDFORM.
*&---------------------------------------------------------------------*
*&      Form  FORM_LAST
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
*  -->  p1        text
*  <--  p2        text
*----------------------------------------------------------------------*
FORM form_last.
  DATA: it_note TYPE ztt_railway_note,
        wa_note TYPE zstr_railway_comp.
  DATA: zfname1 TYPE rs38l_fnam.

  SELECT note FROM zrailway_note INTO CORRESPONDING FIELDS OF TABLE it_note WHERE date_d = zrailway_note-date_d.
  CALL FUNCTION 'SSF_FUNCTION_MODULE_NAME'
    EXPORTING
      formname = 'ZNOTE_FORM'
*     VARIANT  = ' '
*     DIRECT_CALL              = ' '
    IMPORTING
      fm_name  = zfname1
*   EXCEPTIONS
*     NO_FORM  = 1
*     NO_FUNCTION_MODULE       = 2
*     OTHERS   = 3
    .
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.
  CALL FUNCTION zfname1
*   EXPORTING
*     ARCHIVE_INDEX              =
*     ARCHIVE_INDEX_TAB          =
*     ARCHIVE_PARAMETERS         =
*     CONTROL_PARAMETERS         =
*     MAIL_APPL_OBJ              =
*     MAIL_RECIPIENT             =
*     MAIL_SENDER                =
*     OUTPUT_OPTIONS             =
*     USER_SETTINGS              = 'X'
*   IMPORTING
*     DOCUMENT_OUTPUT_INFO       =
*     JOB_OUTPUT_INFO            =
*     JOB_OUTPUT_OPTIONS         =
    TABLES
      itab = it_note
*   EXCEPTIONS
*     FORMATTING_ERROR           = 1
*     INTERNAL_ERROR             = 2
*     SEND_ERROR                 = 3
*     USER_CANCELED              = 4
*     OTHERS                     = 5
    .
  IF sy-subrc <> 0.
* Implement suitable error handling here
  ENDIF.


ENDFORM.
