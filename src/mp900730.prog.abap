*----------------------------------------------------------------------*
*                                                                      *
*       Input-modules for infotype 9007                                *
*                                                                      *
*----------------------------------------------------------------------*
*&---------------------------------------------------------------------*
*&      Module  FILE  INPUT
*&---------------------------------------------------------------------*
*       text
*----------------------------------------------------------------------*
MODULE file INPUT.
  CASE sy-ucomm.
    WHEN 'FILE'.
      IF p9007-msrs IS INITIAL.
        MESSAGE 'Файл не найден' TYPE 'W'.
        RETURN.
      ENDIF.
      DATA(lv_folder) = VALUE pstring( ).
      cl_gui_frontend_services=>directory_browse(
        CHANGING
          selected_folder      = lv_folder
        EXCEPTIONS
          OTHERS               = 4
      ).
      IF sy-subrc <> 0.
        MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
                   WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
      ENDIF.
      cl_gui_cfw=>flush( ).
      SELECT SINGLE * FROM zthr_argus_file INTO @DATA(ls_file)
        WHERE file_id = @p9007-msrs.
      IF sy-subrc = 0.
        DATA(lv_file_64) = substring_after( val = ls_file-file_src sub = 'base64,' ).
        DATA(lv_mime_type) = substring_after( val = substring_before( val = ls_file-file_src sub = ';base64,' ) sub = 'data:' ).
        DATA(lv_x) = VALUE xstring( ).
        CALL FUNCTION 'SCMS_BASE64_DECODE_STR'
          EXPORTING
            input  = lv_file_64
          IMPORTING
            output = lv_x
          EXCEPTIONS
            OTHERS = 2.
        DATA: lt_bin TYPE TABLE OF tbl1024.
        cl_bcs_convert=>xstring_to_xtab(
          EXPORTING
            iv_xstring = lv_x
          IMPORTING
            et_xtab    = lt_bin
        ).
        DATA(lv_ext) = VALUE pstring( ).
        CALL FUNCTION 'SMD_RFC_EXTENSION_GET'
          EXPORTING
            i_mimetype  = lv_mime_type
          IMPORTING
            e_extension = lv_ext.
        cl_gui_frontend_services=>gui_download(
          EXPORTING
            bin_filesize              = xstrlen( lv_x )
            filename                  = |{ lv_folder }\\file.{ lv_ext }|
            filetype                  = 'BIN'
          CHANGING
            data_tab                  = lt_bin
          EXCEPTIONS
            OTHERS                    = 24
        ).
        IF sy-subrc <> 0.
          MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
                     WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
        ENDIF.
      ENDIF.
  ENDCASE.
ENDMODULE.
