REPORT ZLOCO_DRIVER.
DATA: IT_LOCO TYPE ZTT_RAILWAY_LOCO,
      WA_LOCO TYPE ZSTR_RAILWAY_LOCO.

DATA: ZFNAME TYPE RS38L_FNAM.
SELECT FIRST_NAME LAST_NAME TRAIN_NO SHIFT_PREF FROM ZRAILWAY_LOCO into TABLE IT_LOCO.
CALL FUNCTION 'SSF_FUNCTION_MODULE_NAME'
  EXPORTING
    formname                 = 'ZALV_FORM1_LOCO'
*   VARIANT                  = ' '
*   DIRECT_CALL              = ' '
 IMPORTING
    FM_NAME                  = ZFNAME
* EXCEPTIONS
*   NO_FORM                  = 1
*   NO_FUNCTION_MODULE       = 2
*   OTHERS                   = 3
          .
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.

CALL FUNCTION ZFNAME
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
    itab                       = IT_LOCO
* EXCEPTIONS
*   FORMATTING_ERROR           = 1
*   INTERNAL_ERROR             = 2
*   SEND_ERROR                 = 3
*   USER_CANCELED              = 4
*   OTHERS                     = 5
          .
IF sy-subrc <> 0.
* Implement suitable error handling here
ENDIF.
