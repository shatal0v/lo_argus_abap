class ZCL_ARGUS_REF definition
  public
  final
  create public .

public section.

  data GV_REF_ID type ZEHR_ARGUS_DOCID .
  data GS_ADDR0 type ZTHR_ARGUS_ADDR0 read-only .
  data:
    gt_bank0 TYPE TABLE OF zthr_argus_bank0 read-only .
  data GS_BASE0 type ZTHR_ARGUS_BASE0 read-only .
  data:
    gt_bldn0 TYPE TABLE OF zthr_argus_bldn0 read-only .
  data:
    gt_expn0 TYPE TABLE OF zthr_argus_expn0 read-only .
  data:
    gt_gift0 TYPE TABLE OF zthr_argus_gift0 read-only .
  data:
    gt_incm0 TYPE TABLE OF zthr_argus_incm0 read-only .
  data:
    gt_obli0 TYPE TABLE OF zthr_argus_obli0 read-only .
  data:
    gt_osec0 TYPE TABLE OF zthr_argus_osec0 read-only .
  data GS_PERS0 type ZTHR_ARGUS_PERS0 read-only .
  data:
    gt_secu0 TYPE TABLE OF zthr_argus_secu0 read-only .
  data:
    gt_surc0 TYPE TABLE OF zthr_argus_surc0 read-only .
  data:
    gt_tran0 TYPE TABLE OF zthr_argus_tran0 read-only .
  data:
    gt_urge0 TYPE TABLE OF zthr_argus_urge0 read-only .
  data GS_WORK0 type ZTHR_ARGUS_WORK0 read-only .
  constants:
    BEGIN OF gs_status,
                 approved  TYPE c VALUE 'A',
                 rejected  TYPE c VALUE 'R',
                 draft     TYPE c VALUE 'D',
                 error     TYPE c VALUE 'E',
                 undefined TYPE c VALUE '',
               END OF gs_status .

  methods SET_IDFAM
    importing
      !IV_IDFAM type TEXT50 .
  methods CONSTRUCTOR
    importing
      !IV_REF_ID type PSTRING .
  methods DELETE .
  methods APPROVE .
  methods ERRORED .
  methods REJECT .
  methods GET_REL_REF
    returning
      value(RT_REF) type ZTHR_ARGUS_REF .
  methods GET_ALL_REF
    returning
      value(RT_REF) type ZTHR_ARGUS_REF .
  methods GET_PREV_REF
    returning
      value(RO_REF) type ref to ZCL_ARGUS_REF .
  methods HAS_SUB_REF
    exporting
      !ES_RES type ZSHR_ARGUS_SUB_REL
    returning
      value(RV_OK) type FLAG .
  methods GET_APPLICANT
    exporting
      !EV_ENAME type PSTRING
    returning
      value(RV_PERNR) type PERNR_D .
  class-methods FORMAT_CAMEL
    importing
      !IV_TXT type PSTRING
    returning
      value(RV_TXT) type PSTRING .
  methods CHECK
    returning
      value(RV_MSG) type PSTRING .
protected section.
private section.
ENDCLASS.



CLASS ZCL_ARGUS_REF IMPLEMENTATION.


METHOD approve.
  UPDATE zthr_argus_base0 SET status = 'A'
   WHERE docid = gv_ref_id.
ENDMETHOD.


METHOD check.
  CLEAR rv_msg.
  IF gs_pers0-nachn IS INITIAL AND gs_pers0-vorna IS INITIAL AND gs_pers0-midnm IS INITIAL AND gs_pers0-gbdat IS INITIAL .
    rv_msg = 'При сканировании данные сотрудника не найдены'.
    RETURN.
  ENDIF.
  IF gs_pers0-pernr IS INITIAL.
    rv_msg = 'Табельный номер сотрудника не найден'.
    RETURN.
  ENDIF.
  IF gs_pers0-idfam = 'undefined'.
    rv_msg = 'Родственник не найден в профиле сотрудника'.
    RETURN.
  ENDIF.
  DATA(lv_exist) = VALUE flag( ).
  LOOP AT get_all_ref( ) ASSIGNING FIELD-SYMBOL(<lo_exists>).
    CHECK gs_pers0-pernr = <lo_exists>->gs_pers0-pernr.
    CHECK gs_pers0-idfam = <lo_exists>->gs_pers0-idfam.
    CHECK gs_base0-begda = <lo_exists>->gs_base0-begda.
    CHECK gs_base0-stype = <lo_exists>->gs_base0-stype.
    CHECK gs_work0-posit = <lo_exists>->gs_work0-posit.
    lv_exist = abap_true.
    EXIT.
  ENDLOOP.
  IF lv_exist = abap_true.
    rv_msg = 'Справка уже была ранее загружена. Повторная загрузка запрещена'.
  ENDIF.
ENDMETHOD.


  METHOD constructor.
    FIELD-SYMBOLS: <lv_fld_t> TYPE ANY TABLE.
    gv_ref_id = iv_ref_id.
    DATA(lo_cl) = cl_abap_typedescr=>describe_by_name( 'ZCL_ARGUS_REF' ).
    DATA(lo_class) = CAST cl_abap_classdescr( lo_cl ).
    LOOP AT lo_class->attributes ASSIGNING FIELD-SYMBOL(<ls_att>).
      DATA(lv_name) = |{ <ls_att>-name }|.
      IF lv_name CP 'GS*'.
        lv_name = replace( val = lv_name sub = 'GS_' with = 'ZTHR_ARGUS_' ).
        lv_name = condense( lv_name ).
        ASSIGN (<ls_att>-name) TO FIELD-SYMBOL(<lv_fld>).
        DATA(lv_doc_id) = CONV zehr_argus_docid( gv_ref_id ).
        DATA(lv_dbname) = CONV tabname16( lv_name ).
        TRY.
            SELECT SINGLE * FROM (lv_dbname) INTO <lv_fld> WHERE docid = lv_doc_id.
          CATCH cx_sy_dynamic_osql_semantics.
        ENDTRY.
      ENDIF.
      IF lv_name CP 'GT*'.
        lv_name = replace( val = lv_name sub = 'GT_' with = 'ZTHR_ARGUS_' ).
        lv_name = condense( lv_name ).
        ASSIGN (<ls_att>-name) TO <lv_fld_t>.
        lv_doc_id = CONV zehr_argus_docid( gv_ref_id ).
        lv_dbname = CONV tabname16( lv_name ).
        TRY.
            SELECT * FROM (lv_dbname) INTO TABLE <lv_fld_t> WHERE docid = lv_doc_id.
          CATCH cx_sy_dynamic_osql_semantics.
        ENDTRY.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.


METHOD delete.
  DELETE FROM:
    zthr_argus_addr0 WHERE docid = gv_ref_id,
    zthr_argus_bank0 WHERE docid = gv_ref_id,
    zthr_argus_base0 WHERE docid = gv_ref_id,
    zthr_argus_bldn0 WHERE docid = gv_ref_id,
    zthr_argus_expn0 WHERE docid = gv_ref_id,
    zthr_argus_gift0 WHERE docid = gv_ref_id,
    zthr_argus_incm0 WHERE docid = gv_ref_id,
    zthr_argus_obli0 WHERE docid = gv_ref_id,
    zthr_argus_osec0 WHERE docid = gv_ref_id,
    zthr_argus_pers0 WHERE docid = gv_ref_id,
*   zthr_argus_scan0 WHERE docid = gv_ref_id,
    zthr_argus_secu0 WHERE docid = gv_ref_id,
    zthr_argus_surc0 WHERE docid = gv_ref_id,
    zthr_argus_tran0 WHERE docid = gv_ref_id,
    zthr_argus_urge0 WHERE docid = gv_ref_id,
    zthr_argus_work0 WHERE docid = gv_ref_id.
ENDMETHOD.


METHOD ERRORED.
  UPDATE zthr_argus_base0 SET status = 'E'
   WHERE docid = gv_ref_id.
ENDMETHOD.


METHOD format_camel.
  DO strlen( iv_txt ) TIMES.
    DATA(lv_ind) = sy-index - 1.
    DATA(lv_c) = iv_txt+lv_ind(1).
    FIND REGEX '[а-я]' IN lv_c IGNORING CASE.
    IF sy-subrc = 0 AND lv_c = |{ lv_c CASE = UPPER }|.
      rv_txt = |{ rv_txt } { lv_c }|.
    ELSE.
      rv_txt = |{ rv_txt }{ lv_c }|.
    ENDIF.
  ENDDO.
  rv_txt = condense( rv_txt ).
ENDMETHOD.


METHOD get_all_ref.
  CLEAR rt_ref.
  SELECT * FROM zthr_argus_pers0 AS pers
    INNER JOIN zthr_argus_base0 AS base
    ON base~docid = pers~docid
    WHERE pers~pernr = @gs_pers0-pernr
    AND pers~idfam = @gs_pers0-idfam
    AND base~status = @zcl_argus_ref=>gs_status-approved
    AND base~docid <> @gs_base0-docid
    INTO TABLE @DATA(lt_all_ref).
  SORT lt_all_ref BY base-begda DESCENDING.
  LOOP AT lt_all_ref ASSIGNING FIELD-SYMBOL(<ls_ref>).
    DATA(lo_ref) = NEW zcl_argus_ref( iv_ref_id = CONV #( <ls_ref>-base-docid ) ).
    INSERT lo_ref INTO TABLE rt_ref.
  ENDLOOP.
ENDMETHOD.


METHOD get_applicant.
  rv_pernr = gs_pers0-pernr.
  SELECT SINGLE * FROM pa0002 INTO @DATA(ls_0002)
    WHERE pernr = @rv_pernr
    AND begda <= @sy-datum
    AND endda >= @sy-datum.
  ev_ename = |{ ls_0002-nachn } { ls_0002-vorna } { ls_0002-midnm }|.
ENDMETHOD.


METHOD get_prev_ref.
  SELECT * FROM zthr_argus_pers0 AS pers
    INNER JOIN zthr_argus_base0 AS base
    ON base~docid = pers~docid
    WHERE pers~pernr = @gs_pers0-pernr
    AND pers~idfam = @gs_pers0-idfam
    AND base~status = @zcl_argus_ref=>gs_status-approved
    INTO TABLE @DATA(lt_all_ref).
  SORT lt_all_ref BY base-begda DESCENDING.
  DATA(lv_next) = line_index( lt_all_ref[ base-docid = gv_ref_id ] ).
  CHECK lv_next > 0.
  lv_next = lv_next + 1.
  ASSIGN lt_all_ref[ lv_next ] TO FIELD-SYMBOL(<ls_next>).
  CHECK sy-subrc = 0.
  ro_ref = NEW #( iv_ref_id = CONV #( <ls_next>-base-docid ) ).
ENDMETHOD.


METHOD get_rel_ref.
  CLEAR rt_ref.
  CHECK gs_pers0-idfam IS INITIAL AND gs_pers0-pernr IS NOT INITIAL.
  SELECT * FROM zthr_argus_pers0 AS pers
    INNER JOIN zthr_argus_base0 AS base
    ON base~docid = pers~docid
    WHERE pers~pernr = @gs_pers0-pernr
    AND base~status = @zcl_argus_ref=>gs_status-approved
    AND base~docid <> @gs_base0-docid
    INTO TABLE @DATA(lt_all_ref).
  SORT lt_all_ref BY base-begda DESCENDING.
  DELETE lt_all_ref WHERE base-begda(4) <> gs_base0-begda(4).
  LOOP AT lt_all_ref ASSIGNING FIELD-SYMBOL(<ls_ref>) WHERE pers-idfam IS NOT INITIAL.
    DATA(lo_ref) = NEW zcl_argus_ref( iv_ref_id = CONV #( <ls_ref>-base-docid ) ).
    INSERT lo_ref INTO TABLE rt_ref.
  ENDLOOP.
ENDMETHOD.


METHOD has_sub_ref.
  CLEAR es_res.
  SELECT * FROM zthr_argus_pers0 AS pers
    INNER JOIN zthr_argus_base0 AS base
    ON base~docid = pers~docid
    WHERE pers~pernr = @gs_pers0-pernr
    AND base~status = @zcl_argus_ref=>gs_status-approved
    INTO TABLE @DATA(lt_all_ref).
  DELETE lt_all_ref WHERE base-docid = gv_ref_id.
  DELETE lt_all_ref WHERE base-begda(4) <> gs_base0-begda(4).
  rv_ok = boolc( lines( lt_all_ref ) > 0 ).
  LOOP AT lt_all_ref ASSIGNING FIELD-SYMBOL(<ls_ref>) WHERE pers-idfam IS NOT INITIAL.
    CHECK strlen( <ls_ref>-pers-idfam ) >= 18.
    CASE <ls_ref>-pers-idfam+16(2).
      WHEN '01'.
        es_res-husband = 1.
        es_res-husbandname = |{ <ls_ref>-pers-nachn } { <ls_ref>-pers-vorna } { <ls_ref>-pers-midnm }|.
      WHEN '02'.
        es_res-wife = 1.
        es_res-wifename = |{ <ls_ref>-pers-nachn } { <ls_ref>-pers-vorna } { <ls_ref>-pers-midnm }|.
      WHEN OTHERS.
        es_res-children = es_res-children + 1.
        es_res-childname = |{ <ls_ref>-pers-nachn } { <ls_ref>-pers-vorna } { <ls_ref>-pers-midnm }|.
    ENDCASE.
  ENDLOOP.
ENDMETHOD.


METHOD reject.
  UPDATE zthr_argus_base0 SET status = 'R'
     WHERE docid = gv_ref_id.
ENDMETHOD.


  METHOD set_idfam.
    gs_pers0-idfam = iv_idfam.
    UPDATE zthr_argus_pers0 SET idfam = gs_pers0-idfam
     WHERE docid = gv_ref_id.
  ENDMETHOD.
ENDCLASS.
