class ZCL_ARGUS_PARSER definition
  public
  final
  create public .

public section.

  methods CONSTRUCTOR
    importing
      !IS_MEDIA type /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MEDIA_RESOURCE .
  methods PARSE
    returning
      value(RT_PARSED) type STRINGTAB
    raising
      ZCX_ARGUS_PARSER_ERROR .
protected section.
private section.

  data GS_MEDIA type /IWBEP/IF_MGW_APPL_SRV_RUNTIME=>TY_S_MEDIA_RESOURCE .
ENDCLASS.



CLASS ZCL_ARGUS_PARSER IMPLEMENTATION.


  METHOD constructor.
    gs_media = is_media.
  ENDMETHOD.


METHOD parse.
  CLEAR rt_parsed.
  GET TIME STAMP FIELD DATA(lv_time).
  DATA(lv_cmd) = VALUE pstring( ).
  DATA(lv_cmd_output) = VALUE pstring( ).
  DATA(lv_format) = SWITCH pstring( gs_media-mime_type
    WHEN 'application/pdf' THEN 'pdf'
    WHEN 'application/zip' THEN 'zip'
    ELSE 'png'
  ).
  DATA(lv_input) = |argus_parser_cmd_{ lv_time }.{ lv_format }|.
  DATA(lv_output) = |argus_parser_cmd_{ lv_time }.txt|.
  CALL FUNCTION 'FILE_GET_NAME_USING_PATH'
    EXPORTING
      logical_path        = 'TMP'
      file_name           = lv_input
    IMPORTING
      file_name_with_path = lv_cmd
    EXCEPTIONS
      OTHERS              = 5.
  IF sy-subrc <> 0.
    RAISE EXCEPTION TYPE zcx_argus_parser_error.
  ENDIF.
  CALL FUNCTION 'FILE_GET_NAME_USING_PATH'
    EXPORTING
      logical_path        = 'TMP'
      file_name           = lv_output
    IMPORTING
      file_name_with_path = lv_cmd_output
    EXCEPTIONS
      OTHERS              = 5.
  IF sy-subrc <> 0.
    RAISE EXCEPTION TYPE zcx_argus_parser_error.
  ENDIF.
  OPEN DATASET lv_cmd FOR OUTPUT IN BINARY MODE.
  TRANSFER gs_media-value TO lv_cmd.
  CLOSE DATASET lv_cmd.
  DATA(lv_status) = VALUE extcmdexex-status( ).
  DATA(lv_exit_code) = VALUE extcmdexex-exitcode( ).
  DATA(lt_console) = VALUE dba_exec_protocol( ).
  CALL FUNCTION 'SXPG_COMMAND_EXECUTE_LONG'
    EXPORTING
      commandname   = 'ZARGUS_PARSER'
      long_params   = CONV char1024( |{ lv_cmd } { lv_cmd_output }| )
    IMPORTING
      status        = lv_status
      exitcode      = lv_exit_code
    TABLES
      exec_protocol = lt_console
    EXCEPTIONS
      OTHERS        = 15.
  IF sy-subrc <> 0 OR lv_status = 'E'.
  ELSE.
    DATA(lv_parsed) = VALUE pstring( ).
    OPEN DATASET lv_cmd_output FOR INPUT IN TEXT MODE ENCODING DEFAULT.
    DO.
      DATA(ls_string) = VALUE string( ).
      READ DATASET lv_cmd_output INTO ls_string.
      IF sy-subrc EQ 0.
        APPEND ls_string TO rt_parsed.
      ELSE.
        EXIT.
      ENDIF.
    ENDDO.
    CLOSE DATASET lv_cmd_output.
  ENDIF.
  DELETE DATASET lv_cmd.
  DELETE DATASET lv_cmd_output.
ENDMETHOD.
ENDCLASS.
