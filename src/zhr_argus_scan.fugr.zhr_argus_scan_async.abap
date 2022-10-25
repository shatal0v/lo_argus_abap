FUNCTION zhr_argus_scan_async .
*"----------------------------------------------------------------------
*"*"Локальный интерфейс:
*"  IMPORTING
*"     VALUE(IV_SLUG) TYPE  PSTRING OPTIONAL
*"----------------------------------------------------------------------
  TYPES: BEGIN OF ts_pack,
           x        TYPE xstringval,
           mime     TYPE pstring,
           multiple TYPE flag,
         END OF ts_pack.
  TYPES tt_pack TYPE TABLE OF ts_pack.
  DATA: lt_images TYPE TABLE OF xstring,
        lt_pack   TYPE tt_pack,
        lt_ref    TYPE zthr_argus_parser.
  GET TIME STAMP FIELD DATA(lv_time).
  DATA(ls_proc) = VALUE zthr_argus_proc(
    slug = iv_slug
    created_at = lv_time
  ).
  INSERT zthr_argus_proc FROM ls_proc.
  COMMIT WORK.
* Get files
  DATA(lv_id) = CONV text50( |{ iv_slug }-%| ).
  SELECT DISTINCT srtfd FROM zthr_argus_scan0 WHERE srtfd LIKE @lv_id INTO TABLE @DATA(lt_docs).
* Pack files by type
  LOOP AT lt_docs ASSIGNING FIELD-SYMBOL(<ls_docs>).
    DATA(lv_mime) = VALUE pstring( ).
    DATA(lv_x) = VALUE xstring( ).
    IMPORT
      source = lv_x
      mime_type = lv_mime
      FROM DATABASE zthr_argus_scan0(sc) ID <ls_docs>-srtfd.
    DATA(lv_is_image) = boolc(
      lv_mime CS 'jpg' OR
      lv_mime CS 'jpeg' OR
      lv_mime CS 'png' OR
      lv_mime CS 'image' OR
      lv_mime CS 'bmp' OR
      lv_mime CS 'tiff'
    ).
    IF lv_is_image = abap_true.
      INSERT lv_x INTO TABLE lt_images.
    ELSE.
      INSERT VALUE #( x = lv_x mime = lv_mime ) INTO TABLE lt_pack.
    ENDIF.
  ENDLOOP.
* Zip images
  IF lt_images IS NOT INITIAL.
    DATA(lo_zip) = NEW cl_abap_zip( ).
    LOOP AT lt_images ASSIGNING FIELD-SYMBOL(<ls_img>).
      DATA(lv_tabix) = sy-tabix.
      lo_zip->add(
          name    = |{ lv_tabix }.png|
          content = <ls_img>
      ).
    ENDLOOP.
    INSERT VALUE #( x = lo_zip->save( ) mime = 'application/zip' multiple = abap_true ) INTO TABLE lt_pack.
  ENDIF.
* Parse
  LOOP AT lt_pack ASSIGNING FIELD-SYMBOL(<ls_pack>).
    DATA(lo_argus) = NEW zcl_argus_parser_mapper( ).
    DATA(lt_parse) = VALUE string_t( ).
    IF <ls_pack>-mime = 'application/octet-stream' OR <ls_pack>-mime CS 'xsb'.
      DATA(lv_raw_xsb) = NEW zcl_argus_xsb( iv_x = <ls_pack>-x )->get_raw( ).
      APPEND lv_raw_xsb TO lt_parse.
    ELSE.
      TRY.
          lt_parse = NEW zcl_argus_parser( VALUE #( value = <ls_pack>-x mime_type = <ls_pack>-mime ) )->parse( ).
        CATCH zcx_argus_parser_error.
      ENDTRY.
    ENDIF.
    LOOP AT lt_parse ASSIGNING FIELD-SYMBOL(<ls_parse>).
      lo_argus->feed(
        iv_xml = <ls_parse>
        iv_file_src = <ls_pack>-x
        iv_mime_type = <ls_pack>-mime
      ).
    ENDLOOP.
    INSERT LINES OF lo_argus->get( ) INTO TABLE lt_ref.
  ENDLOOP.
  DATA(lv_id_ref) = CONV zthr_argus_procr-srtfd( iv_slug ).
  EXPORT ref = lt_ref TO DATABASE zthr_argus_procr(rf) ID lv_id_ref.
* log out
  GET TIME STAMP FIELD DATA(lv_time_upd).
  ls_proc-completed = abap_true.
  ls_proc-updated_at = lv_time_upd.
  UPDATE zthr_argus_proc
     SET completed = ls_proc-completed
         updated_at = ls_proc-updated_at
  WHERE slug = iv_slug.
ENDFUNCTION.
