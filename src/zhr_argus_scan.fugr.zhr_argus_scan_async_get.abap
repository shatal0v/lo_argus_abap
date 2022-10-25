FUNCTION zhr_argus_scan_async_get.
*"----------------------------------------------------------------------
*"*"Локальный интерфейс:
*"  IMPORTING
*"     REFERENCE(IV_SLUG) TYPE  PSTRING
*"  EXPORTING
*"     REFERENCE(ET_REF) TYPE  ZTHR_ARGUS_PARSER
*"  EXCEPTIONS
*"      NOT_FOUND
*"----------------------------------------------------------------------
  DATA(lv_id) = CONV zthr_argus_procr-srtfd( iv_slug ).
  IMPORT ref = et_ref FROM DATABASE zthr_argus_procr(rf) ID lv_id.
  IF sy-subrc <> 0.
    RAISE not_found.
  ENDIF.
ENDFUNCTION.
