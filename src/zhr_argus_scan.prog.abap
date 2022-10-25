*&---------------------------------------------------------------------*
*& Report  ZHR_ARGUS_SCAN
*& Проверка сканирования
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT zhr_argus_scan.
DATA: lv_id TYPE zthr_argus_scan0-srtfd.
SELECTION-SCREEN: BEGIN OF BLOCK b01 WITH FRAME TITLE text-b01.
SELECT-OPTIONS: s_scan FOR lv_id NO INTERVALS OBLIGATORY.
PARAMETERS: p_pack AS CHECKBOX.
SELECTION-SCREEN: END OF BLOCK b01.
SELECTION-SCREEN: BEGIN OF BLOCK b02 WITH FRAME TITLE text-b02.
PARAMETERS: p_path TYPE pstring OBLIGATORY.
SELECTION-SCREEN: END OF BLOCK b02.

AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_path.
  cl_gui_frontend_services=>directory_browse(
    CHANGING
      selected_folder      = p_path
    EXCEPTIONS
      OTHERS               = 4
  ).
  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
               WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.

CLASS lcl DEFINITION.
  PUBLIC SECTION.
    TYPES: BEGIN OF ts_pack,
             x    TYPE xstring,
             mime TYPE pstring,
           END OF ts_pack.
    CLASS-METHODS: go.
ENDCLASS.
CLASS lcl IMPLEMENTATION.
  METHOD go.
    DATA: lt_pack TYPE TABLE OF ts_pack.
    IF p_pack = abap_false.
      LOOP AT s_scan ASSIGNING FIELD-SYMBOL(<ls_scan>).
        DATA(lv_x) = VALUE xstring( ).
        DATA(lv_mime) = VALUE pstring( ).
        IMPORT
          source = lv_x
          mime_type = lv_mime
          FROM DATABASE zthr_argus_scan0(sc) ID <ls_scan>-low.
        IF sy-subrc = 0.
          INSERT VALUE #( x = lv_x mime = lv_mime ) INTO TABLE lt_pack.
        ENDIF.
      ENDLOOP.
    ELSE.
      LOOP AT s_scan ASSIGNING <ls_scan>.
        SPLIT <ls_scan>-low AT '-' INTO lv_id DATA(lv_dummy).
        lv_id = CONV text50( |{ lv_id }-%| ).
        SELECT DISTINCT srtfd FROM zthr_argus_scan0 WHERE srtfd LIKE @lv_id INTO TABLE @DATA(lt_docs).
        LOOP AT lt_docs ASSIGNING FIELD-SYMBOL(<ls_doc>).
          lv_x = VALUE xstring( ).
          lv_mime = VALUE pstring( ).
          IMPORT
            source = lv_x
            mime_type = lv_mime
            FROM DATABASE zthr_argus_scan0(sc) ID <ls_doc>-srtfd.
          IF sy-subrc = 0.
            INSERT VALUE #( x = lv_x mime = lv_mime ) INTO TABLE lt_pack.
          ENDIF.
        ENDLOOP.
      ENDLOOP.
    ENDIF.
    LOOP AT lt_pack ASSIGNING FIELD-SYMBOL(<ls_pack>).
      DATA(lv_i) = sy-tabix.
      DATA(lt_bin) = VALUE rmps_t_1024( ).
      cl_bcs_convert=>xstring_to_xtab(
        EXPORTING
          iv_xstring = <ls_pack>-x
        IMPORTING
          et_xtab    = lt_bin
      ).
      SPLIT <ls_pack>-mime AT '/' INTO DATA(lv_pref) DATA(lv_ext).
      cl_gui_frontend_services=>gui_download(
        EXPORTING
          bin_filesize              = xstrlen( <ls_pack>-x )
          filename                  = |{ p_path }\\{ lv_i }.{ lv_ext }|
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
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
  lcl=>go( ).
