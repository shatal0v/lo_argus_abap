FUNCTION zhr_argus_search_emp.
*"----------------------------------------------------------------------
*"*"Локальный интерфейс:
*"  IMPORTING
*"     REFERENCE(I_REQUNR) TYPE  RSREQUNR
*"     REFERENCE(I_ISOURCE) TYPE  RSISOURCE OPTIONAL
*"     REFERENCE(I_MAXSIZE) TYPE  RSMAXSIZE OPTIONAL
*"     REFERENCE(I_INITFLAG) TYPE  RSINITFLG OPTIONAL
*"     REFERENCE(I_READ_ONLY) TYPE  RSINITFLG OPTIONAL
*"     REFERENCE(I_DATAPAKID) TYPE  RSDATAPID OPTIONAL
*"     REFERENCE(I_UPDMODE) TYPE  RSUPDMODE OPTIONAL
*"  TABLES
*"      I_T_SELECT TYPE  RS_T_SELECT OPTIONAL
*"      I_T_FIELDS TYPE  RSDS_T_FIELDSEL OPTIONAL
*"      E_T_DATA TYPE  ZTHR_ARGUS_SEARCH_INFO OPTIONAL
*"----------------------------------------------------------------------
  CONSTANTS: lc_delim TYPE c VALUE '|'.
  DEFINE add_or_set.
    IF &1 IS INITIAL.
      &1 = &2.
    ELSE.
      SPLIT &1 AT lc_delim INTO TABLE lt_split.
      IF not line_exists( lt_split[ table_line = &2 ] ).
        &1 = |{ &1 }{ lc_delim }{ &2 }|.
      ENDIF.
    ENDIF.
  END-OF-DEFINITION.
  DATA: lt_split TYPE stringtab.
  STATICS: st_all     TYPE TABLE OF pernr_d,
           st_left    TYPE TABLE OF pernr_d,
           sv_maxsize TYPE rsmaxsize,
           st_001     TYPE TABLE OF t001,
           st_500p    TYPE TABLE OF t500p,
           st_501t    TYPE TABLE OF t501t,
           st_503t    TYPE TABLE OF t503t,
           st_0001    TYPE TABLE OF pa0001,
           st_0002    TYPE TABLE OF pa0002,
           st_0006    TYPE TABLE OF pa0006,
           st_0021    TYPE TABLE OF pa0021,
           st_0022    TYPE TABLE OF pa0022,
           st_0294    TYPE TABLE OF pa0294,
           st_9005    TYPE TABLE OF pa9005,
           st_1000    TYPE TABLE OF hrp1000,
           st_9110    TYPE TABLE OF hrp9110.
  SET LOCALE LANGUAGE 'R'.
  DATA(lo_cl) = cl_abap_typedescr=>describe_by_name( 'ZCL_ARGUS_REF' ).
  DATA(lo_class) = CAST cl_abap_classdescr( lo_cl ).
  IF i_initflag = abap_true.
    sv_maxsize = i_maxsize.
    SELECT DISTINCT p0~pernr
      FROM pa0002 AS p0
      INTO TABLE @st_all.
    SELECT * FROM t001 INTO TABLE st_001.
    SELECT * FROM t500p INTO TABLE st_500p.
    SELECT * FROM t501t INTO TABLE st_501t WHERE sprsl = sy-langu.
    SELECT * FROM t503t INTO TABLE st_503t WHERE sprsl = sy-langu.
    SELECT * FROM pa0001 INTO TABLE st_0001 ORDER BY begda DESCENDING.
    SELECT * FROM pa0002 INTO TABLE st_0002 ORDER BY begda DESCENDING.
    SELECT * FROM pa0006 INTO TABLE st_0006 ORDER BY begda DESCENDING.
    SELECT * FROM pa0021 INTO TABLE st_0021 ORDER BY begda DESCENDING.
    SELECT * FROM pa0022 INTO TABLE st_0022 ORDER BY begda DESCENDING.
    SELECT * FROM pa0294 INTO TABLE st_0294 ORDER BY begda DESCENDING.
    SELECT * FROM pa9005 INTO TABLE st_9005 ORDER BY begda DESCENDING.
    SELECT * FROM hrp9110 INTO TABLE @st_9110 WHERE begda <= @sy-datum
                                                AND endda >= @sy-datum.
    SELECT * FROM hrp1000 INTO TABLE st_1000
      WHERE plvar = cl_hap_pmp_const=>plvar
      AND otype IN ('O', 'S', 'C')
      AND begda <= sy-datum
      AND endda >= sy-datum
      AND langu = sy-langu.
    RETURN.
  ENDIF.
  CLEAR e_t_data[].
  IF st_left IS INITIAL.
    LOOP AT st_all ASSIGNING FIELD-SYMBOL(<ls_all>).
      IF lines( st_left ) >= sv_maxsize.
        EXIT.
      ENDIF.
      INSERT <ls_all> INTO TABLE st_left.
      DELETE st_all.
    ENDLOOP.
    IF sy-subrc <> 0.
      RAISE no_more_data.
    ENDIF.
  ENDIF.
  LOOP AT st_left ASSIGNING FIELD-SYMBOL(<lv_pernr>).
    INSERT INITIAL LINE INTO TABLE e_t_data ASSIGNING FIELD-SYMBOL(<ls_data>).
    <ls_data>-pernr = <lv_pernr>.
    ASSIGN st_0002[ pernr = <lv_pernr> ] TO FIELD-SYMBOL(<ls_0002>).
    IF sy-subrc = 0.
      <ls_data>-person = CORRESPONDING #( <ls_0002> ).
    ENDIF.
    ASSIGN st_0001[ pernr = <lv_pernr> ] TO FIELD-SYMBOL(<ls_0001>).
    IF sy-subrc = 0.
      <ls_data>-assign = CORRESPONDING #( <ls_0001> ).
      <ls_data>-assign-bukrs_txt = VALUE #( st_001[ bukrs = <ls_0001>-bukrs ]-butxt OPTIONAL ).
      <ls_data>-assign-persa_txt = zcl_hr_data_utils=>get_last_but_one_ogreh_name_o(
        i_otype = cl_hap_pmp_const=>otype_orgunit
        i_objid = <ls_0001>-orgeh
      ).
      IF <ls_data>-assign-persa_txt IS INITIAL.
        <ls_data>-assign-persa_txt = VALUE #( st_500p[ persa = <ls_0001>-werks ]-name1 OPTIONAL ).
      ENDIF.
      <ls_data>-assign-persg_txt = VALUE #( st_501t[ persg = <ls_0001>-persg ]-ptext OPTIONAL ).
      <ls_data>-assign-persk_txt = VALUE #( st_503t[ persk = <ls_0001>-persk ]-ptext OPTIONAL ).
      <ls_data>-assign-orgeh_txt = VALUE #( st_1000[ otype = cl_hap_pmp_const=>otype_orgunit objid = <ls_0001>-orgeh ]-stext OPTIONAL ).
      <ls_data>-assign-plans_txt = VALUE #( st_1000[ otype = cl_hap_pmp_const=>otype_position objid = <ls_0001>-plans ]-stext OPTIONAL ).
      <ls_data>-assign-stell_txt = VALUE #( st_1000[ otype = 'C' objid = <ls_0001>-stell ]-stext OPTIONAL ).
      IF <ls_data>-assign-plans_txt IS INITIAL.
        <ls_data>-assign-plans_txt = <ls_data>-assign-stell_txt.
      ENDIF.
      DATA(lv_p1) = VALUE char1( ).
      zcl_hr_data=>get_plans_param(
        EXPORTING
          i_plans  = <ls_0001>-plans
        IMPORTING
          e_param1 = lv_p1
      ).
      CASE lv_p1.
        WHEN '1'.
          <ls_data>-assign-plans_subs = abap_true.
        WHEN '2'.
          <ls_data>-assign-plans_ggs = abap_true.
        WHEN '3'.
          <ls_data>-assign-plans_head = abap_true.
      ENDCASE.
    ENDIF.
    ASSIGN st_0006[ pernr = <lv_pernr> anssa = '1' ] TO FIELD-SYMBOL(<ls_0006>).
    IF sy-subrc = 0.
      <ls_data>-address_reg = CORRESPONDING #( <ls_0006> ).
    ENDIF.
    ASSIGN st_0006[ pernr = <lv_pernr> anssa = '2' ] TO <ls_0006>.
    IF sy-subrc = 0.
      <ls_data>-address_fact = CORRESPONDING #( <ls_0006> ).
    ENDIF.
    LOOP AT st_0294 ASSIGNING FIELD-SYMBOL(<ls_0294>) WHERE pernr = <lv_pernr>.
      add_or_set <ls_data>-job-job_name <ls_0294>-arbgb.
      add_or_set <ls_data>-job-job_city <ls_0294>-ort01.
      add_or_set <ls_data>-job-job_orgeh <ls_0294>-deprt.
      add_or_set <ls_data>-job-job_plans <ls_0294>-posit.
    ENDLOOP.
    LOOP AT st_0022 ASSIGNING FIELD-SYMBOL(<ls_0022>) WHERE pernr = <lv_pernr> AND subty <> 'EL'.
      add_or_set <ls_data>-edu-insti <ls_0022>-insti.
      add_or_set <ls_data>-edu-dptmt <ls_0022>-dptmt.
      add_or_set <ls_data>-edu-start <ls_0022>-zstart.
      add_or_set <ls_data>-edu-end <ls_0022>-zend.
    ENDLOOP.
    LOOP AT st_9005 ASSIGNING FIELD-SYMBOL(<ls_9005>) WHERE pernr = <lv_pernr>.
      add_or_set <ls_data>-military-insti <ls_9005>-milunit.
      add_or_set <ls_data>-military-dptmt <ls_9005>-milcity.
      add_or_set <ls_data>-military-start <ls_9005>-begin_date.
      add_or_set <ls_data>-military-end <ls_9005>-end_date.
    ENDLOOP.
    LOOP AT st_0021 ASSIGNING FIELD-SYMBOL(<ls_0021>) WHERE pernr = <lv_pernr>.
      add_or_set <ls_data>-family-ftype <ls_0021>-subty.
      add_or_set <ls_data>-family-fbirth <ls_0021>-fgbdt.
      add_or_set <ls_data>-family-fnachn <ls_0021>-fanam.
      add_or_set <ls_data>-family-fvorna <ls_0021>-favor.
      add_or_set <ls_data>-family-fmidnm <ls_0021>-fnac2.
    ENDLOOP.
    IF <ls_0001> IS ASSIGNED.
      <ls_data>-need_ref = VALUE #( st_9110[ objid = <ls_0001>-plans ]-corrupt OPTIONAL ).
    ENDIF.
    SELECT * FROM zthr_argus_pers0 INTO TABLE @DATA(lt_ref) WHERE pernr = @<ls_data>-pernr.
    LOOP AT lt_ref ASSIGNING FIELD-SYMBOL(<ls_ref>).
      DATA(lo_ref) = NEW zcl_argus_ref( iv_ref_id = CONV #( <ls_ref>-docid ) ).
      LOOP AT lo_class->attributes ASSIGNING FIELD-SYMBOL(<ls_att>).
        DATA(lv_fld) = |LO_REF->{ <ls_att>-name }|.
        ASSIGN (lv_fld) TO FIELD-SYMBOL(<lv_fld>).
        CHECK sy-subrc = 0.
        DATA(lv_ref_str) = /ui2/cl_json=>serialize( data = <lv_fld> pretty_name = abap_true ).
        add_or_set <ls_data>-ref_source lv_ref_str.
      ENDLOOP.
    ENDLOOP.
    SELECT SINGLE *
      INTO @DATA(ls_srgbtbrel)
      FROM srgbtbrel
      WHERE instid_a = @<ls_data>-pernr
        AND typeid_a = 'BUS1065'.
    IF sy-subrc = 0.
      <ls_data>-photo = |/api/portal/argus/PhotoSet('{ <ls_data>-pernr }')/$value|.
    ENDIF.
    DELETE st_left.
  ENDLOOP.
ENDFUNCTION.
