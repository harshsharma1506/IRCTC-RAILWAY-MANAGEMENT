MODULE user_command_0517 INPUT.
  CASE sy-ucomm.
    WHEN 'LOGIN1'.

      SELECT SINGLE username password FROM zrailway_user INTO ( wa_user-username , wa_user-password ) WHERE username = zrailway_user-username AND password = zrailway_user-password..
      IF zrailway_user-username = ' ' OR zrailway_user-password = ' '.
        MESSAGE 'enter valid input' TYPE 'I'.
      ELSE.
        IF zrailway_user-username = wa_user-username    AND   zrailway_user-password = wa_user-password.
          CALL SCREEN '518'.
        ELSE.
          MESSAGE 'ERROR' TYPE 'I'.
        ENDIF.
      ENDIF.

    WHEN 'CREATE1'.

      wa_user-username = zrailway_user-username.
      wa_user-password = zrailway_user-password.


      INSERT zrailway_user FROM wa_user.
      IF sy-subrc = 0.
        MESSAGE: 'NEW ADMIN CREATED' TYPE 'I'.
      ELSE.
        MESSAGE: 'SOME ERROR OCCURED' TYPE 'I'.
      ENDIF.


    WHEN 'BACK' OR 'EXIT' OR 'CANCEL'.
      LEAVE PROGRAM.
  ENDCASE.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0518  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0518 INPUT.
  CASE sy-ucomm.
    WHEN 'BACK1' OR 'CANCEL1' OR 'EXIT1'.
      LEAVE PROGRAM.

    WHEN 'LOCO1'.
      CALL SCREEN '519'.

    WHEN 'TRAIN1'.
      CALL SCREEN '521'.
    WHEN 'SPEC1'.
      CALL SCREEN '523'.
    WHEN 'MA1'.
      CALL SCREEN '525'.
  ENDCASE.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0519  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0519 INPUT.
  CASE sy-ucomm.
    WHEN 'ADD1'.
      wa_loco-first_name = zrailway_loco-first_name.
      wa_loco-last_name = zrailway_loco-last_name.
      wa_loco-train_no = zrailway_loco-train_no.
      wa_loco-shift_pref = zrailway_loco-shift_pref.

      INSERT zrailway_loco FROM wa_loco.
      IF sy-subrc = 0.
        MESSAGE 'ENTRY MADE' TYPE 'I'.
      ELSE.
        MESSAGE 'ERROR OCCURED' TYPE 'I'.
      ENDIF.



    WHEN 'UPDATE1'.
      wa_loco-first_name = zrailway_loco-first_name.
      wa_loco-last_name = zrailway_loco-last_name.
      wa_loco-train_no = zrailway_loco-train_no.
      wa_loco-shift_pref = zrailway_loco-shift_pref.

      UPDATE zrailway_loco FROM wa_loco.
      IF sy-subrc = 0.
        MESSAGE 'RECORD UPDATED' TYPE 'I'.
      ELSE.
        MESSAGE 'ERROR OCCURED' TYPE 'I'.
      ENDIF.

    WHEN 'SHOW1'.
      SUBMIT zloco_grid VIA SELECTION-SCREEN AND RETURN.

    WHEN 'DISPLAY1'.
      SELECT SINGLE first_name last_name train_no shift_pref
        FROM zrailway_loco
        INTO ( zrailway_loco-first_name , zrailway_loco-last_name , zrailway_loco-train_no , zrailway_loco-shift_pref )
        WHERE first_name = zrailway_loco-first_name.

    WHEN 'BACK1' OR 'EXIT1' OR 'CANCEL1'.
      LEAVE TO SCREEN 518.


  ENDCASE.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0521  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0521 INPUT.
  CASE sy-ucomm.
    WHEN 'CREATE1'.
      wa_train-train_no = zrailway_train-train_no.
      wa_train-train_name = zrailway_train-train_name.
      wa_train-train_route = zrailway_train-train_route.
      wa_train-train_meal = zrailway_train-train_meal.
      wa_train-train_berth = zrailway_train-train_berth.
      wa_train-train_timings = zrailway_train-train_timings.

      INSERT zrailway_train FROM wa_train.
      IF sy-subrc = 0.
        MESSAGE 'ENTRY MADE' TYPE 'I'.
      ELSE.
        MESSAGE 'ERROR' TYPE 'I'.
      ENDIF.

    WHEN 'UPDATE1'.
      wa_train-train_no = zrailway_train-train_no.
      wa_train-train_name = zrailway_train-train_name.
      wa_train-train_route = zrailway_train-train_route.
      wa_train-train_meal = zrailway_train-train_meal.
      wa_train-train_berth = zrailway_train-train_berth.
      wa_train-train_timings = zrailway_train-train_timings.

      UPDATE zrailway_train FROM wa_train.
      IF sy-subrc = 0.
        MESSAGE 'ENTRY MADE' TYPE 'I'.
      ELSE.
        MESSAGE 'ERROR' TYPE 'I'.
      ENDIF.

    WHEN 'DISPLAY1'.
      SELECT SINGLE train_no train_name train_route train_meal train_berth train_timings INTO ( zrailway_train-train_no,zrailway_train-train_name , zrailway_train-train_route , zrailway_train-train_meal , zrailway_train-train_berth ,
zrailway_train-train_timings ) FROM zrailway_train WHERE train_no = zrailway_train-train_no.

    WHEN 'CLEAR1'.
      CLEAR:  zrailway_train-train_no , zrailway_train-train_name , zrailway_train-train_route , zrailway_train-train_meal , zrailway_train-train_berth , zrailway_train-train_timings.
    WHEN 'SHOW1'.
      SUBMIT ztrain_grid VIA SELECTION-SCREEN AND RETURN.

    WHEN 'BACK1' OR 'EXIT1' OR 'CANCEL1'.
      LEAVE TO SCREEN 518.
  ENDCASE.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0523  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0523 INPUT.
  CASE sy-ucomm.
    WHEN 'CREATE1'.
      wa_pass-train_name1 = zrailway_pass-train_name1.
      wa_pass-passenger_id = zrailway_pass-passenger_id.
      wa_pass-passenger_name1 = zrailway_pass-passenger_name1.
      wa_pass-passenger_name2 = zrailway_pass-passenger_name2.
      wa_pass-start_from = zrailway_pass-start_from.
      wa_pass-go_to = zrailway_pass-go_to.
      wa_pass-meal_pref = zrailway_pass-meal_pref.
      wa_pass-gender = zrailway_pass-gender.
      wa_pass-age = zrailway_pass-age.

      INSERT zrailway_pass FROM wa_pass.
      IF sy-subrc = 0.
        MESSAGE 'ENTRY MADE' TYPE 'I'.
      ELSE.
        MESSAGE 'ERROR' TYPE 'I'.
      ENDIF.

    WHEN 'UPDATE1'.
      wa_pass-train_name1 = zrailway_pass-train_name1.
      wa_pass-passenger_id = zrailway_pass-passenger_id.
      wa_pass-passenger_name1 = zrailway_pass-passenger_name1.
      wa_pass-passenger_name2 = zrailway_pass-passenger_name2.
      wa_pass-start_from = zrailway_pass-start_from.
      wa_pass-go_to = zrailway_pass-go_to.
      wa_pass-meal_pref = zrailway_pass-meal_pref.
      wa_pass-gender = zrailway_pass-gender.
      wa_pass-age = zrailway_pass-age.

      UPDATE zrailway_pass FROM wa_pass.
      IF sy-subrc = 0.
        MESSAGE 'ENTRY MADE' TYPE 'I'.
      ELSE.
        MESSAGE 'ERROR' TYPE 'I'.
      ENDIF.



    WHEN 'DISPLAY1'.
      SELECT SINGLE train_name1 passenger_id passenger_name1 passenger_name2 start_from go_to meal_pref gender age
         FROM zrailway_pass INTO ( zrailway_pass-train_name1 , zrailway_pass-passenger_id , zrailway_pass-passenger_name1 , zrailway_pass-passenger_name2
         , zrailway_pass-start_from , zrailway_pass-go_to , zrailway_pass-meal_pref , zrailway_pass-gender , zrailway_pass-age ) WHERE train_name1 = zrailway_pass-train_name1.
    WHEN 'CLEAR1'.
      CLEAR: zrailway_pass-train_name1 , zrailway_pass-passenger_id , zrailway_pass-passenger_name1 , zrailway_pass-passenger_name2 ,
      zrailway_pass-start_from , zrailway_pass-go_to , zrailway_pass-meal_pref , zrailway_pass-gender , zrailway_pass-age.
    WHEN 'PRINT1'.



      CALL FUNCTION 'POPUP_TO_INFORM'
        EXPORTING
          titel = 'seat no.'
          txt1  = 'SEAT NO. IS'
          txt2  = 'xxxx263839'
*         TXT3  = ' '
*         TXT4  = ' '
        .

      PERFORM ticket_issue.



    WHEN 'BACK1' OR 'CANCEL1' OR 'EXIT1'.
      CALL SCREEN '518'.
  ENDCASE.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0524  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0524 INPUT.
  CASE sy-ucomm.
    WHEN 'REFRESH1'.
      DATA: cont     TYPE REF TO cl_gui_custom_container,
            grid     TYPE REF TO cl_gui_alv_grid,
            it_final TYPE STANDARD TABLE OF zrailway_pass.
      SELECT * FROM zrailway_pass INTO TABLE it_final.
      CREATE OBJECT cont
        EXPORTING
*         parent         =
          container_name = 'ALV_CON'
*         style          =
*         lifetime       = lifetime_default
*         repid          =
*         dynnr          =
*         no_autodef_progid_dynnr     =
*    EXCEPTIONS
*         cntl_error     = 1
*         cntl_system_error           = 2
*         create_error   = 3
*         lifetime_error = 4
*         lifetime_dynpro_dynpro_link = 5
*         others         = 6
        .
      IF sy-subrc <> 0.
*   MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*              WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
      ENDIF.

      CREATE OBJECT grid
        EXPORTING
*         i_shellstyle      = 0
*         i_lifetime        =
          i_parent = cont
*         i_appl_events     = space
*         i_parentdbg       =
*         i_applogparent    =
*         i_graphicsparent  =
*         i_name   =
*         i_fcat_complete   = SPACE
*    EXCEPTIONS
*         error_cntl_create = 1
*         error_cntl_init   = 2
*         error_cntl_link   = 3
*         error_dp_create   = 4
*         others   = 5
        .
      IF sy-subrc <> 0.
*   MESSAGE ID SY-MSGID TYPE SY-MSGTY NUMBER SY-MSGNO
*              WITH SY-MSGV1 SY-MSGV2 SY-MSGV3 SY-MSGV4.
      ENDIF.

      CALL METHOD grid->set_table_for_first_display
        EXPORTING
*         i_buffer_active  =
*         i_bypassing_buffer            =
*         i_consistency_check           =
          i_structure_name = 'ZRAILWAY_PASS'
*         is_variant       =
*         i_save           =
*         i_default        = 'X'
*         is_layout        =
*         is_print         =
*         it_special_groups             =
*         it_toolbar_excluding          =
*         it_hyperlink     =
*         it_alv_graphics  =
*         it_except_qinfo  =
*         ir_salv_adapter  =
        CHANGING
          it_outtab        = it_final
*         it_fieldcatalog  =
*         it_sort          =
*         it_filter        =
*    EXCEPTIONS
*         invalid_parameter_combination = 1
*         program_error    = 2
*         too_many_lines   = 3
*         others           = 4
        .
      IF sy-subrc <> 0.
*   Implement suitable error handling here
      ENDIF.

      CALL METHOD grid->refresh_table_display
*   EXPORTING
*      is_stable      = ZRAILWAY_PASS
*      i_soft_refresh =
*    EXCEPTIONS
*      finished       = 1
*      others         = 2
        .
      IF sy-subrc <> 0.
*   Implement suitable error handling here
      ENDIF.

  ENDCASE.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0525  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0525 INPUT.
  CASE sy-ucomm.
    WHEN 'BACK1' OR 'EXIT1' OR 'CANCEL1'.
      CALL SCREEN '518'.
    WHEN 'PUB1'.
      CALL SCREEN '527' STARTING AT 10 08
                        ENDING AT 70 15.
    WHEN 'RAISE1'.
      CALL TRANSACTION 'SBWP'.
  ENDCASE.

ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0527  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0527 INPUT.
  CASE sy-ucomm.
    WHEN 'PUB1'.
      DATA: wa_note TYPE zrailway_note.
      wa_note-date_d = zrailway_note-date_d.
      wa_note-note = zrailway_note-note.
      INSERT zrailway_note FROM wa_note.
      IF sy-subrc = 0.

        PERFORM form_last.
      ELSE.
        MESSAGE 'SERVER DOWN' TYPE 'I'.
      ENDIF.
    ENDCASE.
ENDMODULE.
*&---------------------------------------------------------------------*
*&      Module  USER_COMMAND_0526  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE user_command_0526 INPUT.

ENDMODULE.
