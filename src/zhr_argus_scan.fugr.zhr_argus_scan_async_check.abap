FUNCTION zhr_argus_scan_async_check.
*"----------------------------------------------------------------------
*"*"Локальный интерфейс:
*"  IMPORTING
*"     REFERENCE(IV_SLUG) TYPE  PSTRING
*"  EXPORTING
*"     REFERENCE(EV_COMPLETED) TYPE  FLAG
*"  EXCEPTIONS
*"      NOT_FOUND
*"----------------------------------------------------------------------
  SELECT SINGLE completed
    FROM zthr_argus_proc
    INTO @ev_completed
    WHERE slug = @iv_slug.
  IF sy-subrc <> 0.
    RAISE not_found.
  ENDIF.
ENDFUNCTION.
