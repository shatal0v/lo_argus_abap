class ZCL_ARGUS_PARSER_SAVER definition
  public
  final
  create public .

public section.

  methods CONSTRUCTOR
    importing
      !IS_PARSED type ZSHR_ARGUS_PARSER
      value(IV_SOURCE) type XSTRING optional
      value(IV_FILENAME) type PSTRING optional .
  methods SAVE
    importing
      value(IV_ELECTRO) type FLAG optional
      value(IV_PAPER) type FLAG default 'X'
      value(IV_PORTAL) type FLAG optional
    returning
      value(RO_REF) type ref to ZCL_ARGUS_REF .
protected section.
PRIVATE SECTION.

  DATA gs_parser TYPE zshr_argus_parser .
  DATA: BEGIN OF gs_source,
          x        TYPE xstring,
          filename TYPE pstring,
        END OF gs_source.
ENDCLASS.



CLASS ZCL_ARGUS_PARSER_SAVER IMPLEMENTATION.


  METHOD constructor.
    gs_parser = is_parsed.
    gs_source-x = iv_source.
    gs_source-filename = iv_filename.
  ENDMETHOD.


METHOD save.
  CHECK gs_parser-base-ref_begda IS NOT INITIAL.
  DATA(lv_num) = VALUE num12( ).
  CALL FUNCTION 'NUMBER_GET_NEXT'
    EXPORTING
      nr_range_nr = '01'
      object      = 'Z_ARGUS'
    IMPORTING
      number      = lv_num
    EXCEPTIONS
      OTHERS      = 8.
  IF sy-subrc <> 0.
    RETURN.
  ENDIF.
  DATA(lv_docid) = CONV text50( CONV int4( lv_num ) ). "cl_system_uuid=>create_uuid_c32_static( ).
* Аргус. Справка. Данные справки
* ZTHR_ARGUS_BASE0
  IF gs_parser-base-ref_timestamp IS INITIAL.
    gs_parser-base-ref_timestamp = gs_parser-base-ref_report.
  ENDIF.
  IF strlen( gs_parser-base-ref_begda ) = 8.
    gs_parser-base-ref_begda = |{ CONV datum( gs_parser-base-ref_begda ) DATE = ISO }|.
  ENDIF.
  IF strlen( gs_parser-base-ref_endda ) = 8.
    gs_parser-base-ref_endda = |{ CONV datum( gs_parser-base-ref_endda ) DATE = ISO }|.
  ENDIF.
  DATA(ls_base0) = VALUE zthr_argus_base0(
    docid = lv_docid
    issfor = gs_parser-base-ref_for_whom
    wtcis = gs_parser-base-ref_hr
    wwcs = gs_parser-base-ref_base
    begda = COND #( WHEN gs_parser-base-ref_begda IS NOT INITIAL THEN |{ gs_parser-base-ref_begda(4) }{ gs_parser-base-ref_begda+5(2) }{ gs_parser-base-ref_begda+8(2) }| )
    endda = COND #( WHEN gs_parser-base-ref_endda IS NOT INITIAL THEN |{ gs_parser-base-ref_endda(4) }{ gs_parser-base-ref_endda+5(2) }{ gs_parser-base-ref_endda+8(2) }| )
    accord = COND #( WHEN gs_parser-base-ref_timestamp IS NOT INITIAL THEN |{ gs_parser-base-ref_timestamp(4) }{ gs_parser-base-ref_timestamp+5(2) }{ gs_parser-base-ref_timestamp+8(2) }| )
    orddt = COND #( WHEN gs_parser-base-ref_report IS NOT INITIAL THEN |{ gs_parser-base-ref_report(4) }{ gs_parser-base-ref_report+5(2) }{ gs_parser-base-ref_report+8(2) }| )
    ordst = COND #( WHEN gs_parser-base-ref_sign IS NOT INITIAL THEN |{ gs_parser-base-ref_sign(4) }{ gs_parser-base-ref_sign+5(2) }{ gs_parser-base-ref_sign+8(2) }| )
    infac = gs_parser-base-ref_validated
    sdigit = iv_electro
    spaper = iv_paper
    stype = COND #( WHEN gs_parser-base-ref_massg = 'Да' THEN 'U' )
    status = 'D'
    aedtm = sy-datum
    portal = iv_portal
  ).
  MODIFY zthr_argus_base0 FROM ls_base0.
* Аргус. Справка. Персональные данные
* ZTHR_ARGUS_PERS0
  DATA(lv_gbdat) = COND #( WHEN gs_parser-personal-date_of_birth IS NOT INITIAL THEN CONV datum( |{ gs_parser-personal-date_of_birth(4) }{ gs_parser-personal-date_of_birth+5(2) }{ gs_parser-personal-date_of_birth+8(2) }| ) ).
  IF gs_parser-applicant IS INITIAL.
    SELECT SINGLE pernr FROM pa0002 INTO @DATA(lv_pernr)
      WHERE nachn = @gs_parser-personal-nachn
      AND vorna = @gs_parser-personal-vorna
      AND midnm = @gs_parser-personal-midnm
      AND gbdat = @lv_gbdat.
  ELSE.
    DATA(lv_gbdat_app) = CONV datum( |{ gs_parser-applicant-date_of_birth(4) }{ gs_parser-applicant-date_of_birth+5(2) }{ gs_parser-applicant-date_of_birth+8(2) }| ).
    SELECT SINGLE pernr FROM pa0002 INTO @lv_pernr
      WHERE nachn = @gs_parser-applicant-nachn
      AND vorna = @gs_parser-applicant-vorna
      AND midnm = @gs_parser-applicant-midnm
      AND gbdat = @lv_gbdat_app.
    SELECT * FROM pa0021 INTO TABLE @DATA(lt_0021) WHERE pernr = @lv_pernr.
    ASSIGN lt_0021[ fgbdt = lv_gbdat fanam = gs_parser-personal-nachn favor = gs_parser-personal-vorna ] TO FIELD-SYMBOL(<ls_0021>).
    IF sy-subrc = 0.
      DATA(lv_idfam) = |{ <ls_0021>-begda }{ <ls_0021>-endda }{ <ls_0021>-subty }{ <ls_0021>-seqnr }|.
    ELSE.
      lv_idfam = 'undefined'.
    ENDIF.
  ENDIF.
  DATA(ls_pers0) = VALUE zthr_argus_pers0(
    docid = lv_docid
    pernr = lv_pernr
    idfam = lv_idfam
    nachn = gs_parser-personal-nachn
    vorna = gs_parser-personal-vorna
    midnm = gs_parser-personal-midnm
    gbdat = lv_gbdat
    gender = gs_parser-personal-sex
    snils = gs_parser-personal-snils
    doctype = gs_parser-personal-doc_type
    seria = gs_parser-personal-seria
    nomer = gs_parser-personal-number
*    datbg = COND #( WHEN gs_parser-personal-date_of_issue IS NOT INITIAL THEN |{ gs_parser-personal-date_of_issue(4) }{ gs_parser-personal-date_of_issue+5(2) }{ gs_parser-personal-date_of_issue+8(2) }| )
    datbg = |{ gs_parser-personal-date_of_issue(4) }{ gs_parser-personal-date_of_issue+5(2) }{ gs_parser-personal-date_of_issue+8(2) }|
    wpassl = gs_parser-personal-issuer
*    ISSCOUNTRY = gs_parser-personal-
*    TEXT1 =
  ).
  MODIFY zthr_argus_pers0 FROM ls_pers0.
* Аргус. Справка. Место работы
* ZTHR_ARGUS_WORK0
  DATA(ls_work0) = VALUE zthr_argus_work0(
    docid = lv_docid
    name1 = gs_parser-personal-job_orgeh
    posit = gs_parser-personal-job_plans
    occup = gs_parser-personal-job_has
    candidate = gs_parser-personal-job_candidate
  ).
  MODIFY zthr_argus_work0 FROM ls_work0.
* Аргус. Справка. Данные регистрации
* ZTHR_ARGUS_ADDR0
  DATA(ls_addr0) = VALUE zthr_argus_addr0(
    docid       = lv_docid
    land1       = gs_parser-registration-country
    indx        = gs_parser-registration-indx
    regio       = gs_parser-registration-region
*    name_np     =
    name_city   = gs_parser-registration-city
    name_street = gs_parser-registration-street
    name_house  = gs_parser-registration-house
    name_bldng1 = gs_parser-registration-bldng1
    name_bldng2 = gs_parser-registration-bldng2
    posta       = gs_parser-registration-apt
    addinfo     = gs_parser-registration-addinfo
  ).
  MODIFY zthr_argus_addr0 FROM ls_addr0.
* Аргус. Справка. Сведения о доходах
* ZTHR_ARGUS_INCM0
  DELETE FROM zthr_argus_incm0 WHERE docid = lv_docid.
  DATA: lt_incm0 TYPE TABLE OF zthr_argus_incm0.
  LOOP AT gs_parser-income ASSIGNING FIELD-SYMBOL(<ls_income>).
    DATA(lv_tabix) = sy-tabix.
    INSERT INITIAL LINE INTO TABLE lt_incm0 ASSIGNING FIELD-SYMBOL(<ls_incm0>).
    <ls_incm0> = CORRESPONDING #( <ls_income> ).
    <ls_incm0>-docid = lv_docid.
    <ls_incm0>-lineid = lv_tabix.
  ENDLOOP.
  MODIFY zthr_argus_incm0 FROM TABLE lt_incm0.
* Аргус. Справка. Сведения о расходах
* ZTHR_ARGUS_EXPN0
* Аргус. Справка. Источники дохода
* ZTHR_ARGUS_SURC0
  DELETE FROM zthr_argus_expn0 WHERE docid = lv_docid.
  DELETE FROM zthr_argus_surc0 WHERE docid = lv_docid.
  DATA: lt_expn0 TYPE TABLE OF zthr_argus_expn0.
  DATA: lt_surc0 TYPE TABLE OF zthr_argus_surc0.
  LOOP AT gs_parser-expense ASSIGNING FIELD-SYMBOL(<ls_expense>).
    lv_tabix = sy-tabix.
    INSERT INITIAL LINE INTO TABLE lt_expn0 ASSIGNING FIELD-SYMBOL(<ls_exp0>).
    <ls_exp0> = CORRESPONDING #( <ls_expense> ).
    <ls_exp0>-docid = lv_docid.
    <ls_exp0>-lineid = lv_tabix.
    LOOP AT <ls_expense>-source_t ASSIGNING FIELD-SYMBOL(<ls_source>).
      DATA(lv_tabix_src) = sy-tabix.
      INSERT INITIAL LINE INTO TABLE lt_surc0 ASSIGNING FIELD-SYMBOL(<ls_surc0>).
      <ls_surc0> = CORRESPONDING #( <ls_source> ).
      <ls_surc0>-docid = lv_docid.
      <ls_surc0>-lineid = lv_tabix.
      <ls_surc0>-slineid = lv_tabix_src.
    ENDLOOP.
  ENDLOOP.
  MODIFY zthr_argus_expn0 FROM TABLE lt_expn0.
  MODIFY zthr_argus_surc0 FROM TABLE lt_surc0.
* Аргус. Справка. Банк
* ZTHR_ARGUS_BANK0
  DELETE FROM zthr_argus_bank0 WHERE docid = lv_docid.
  DATA: lt_bank0 TYPE TABLE OF zthr_argus_bank0.
  LOOP AT gs_parser-bank ASSIGNING FIELD-SYMBOL(<ls_bank>).
    lv_tabix = sy-tabix.
    INSERT INITIAL LINE INTO TABLE lt_bank0 ASSIGNING FIELD-SYMBOL(<ls_bank0>).
    <ls_bank0> = CORRESPONDING #( <ls_bank> ).
    <ls_bank0>-docid = lv_docid.
    <ls_bank0>-lineid = lv_tabix.
  ENDLOOP.
  MODIFY zthr_argus_bank0 FROM TABLE lt_bank0.
* Аргус. Справка. Недвижимость
* ZTHR_ARGUS_BLDN0
  DELETE FROM zthr_argus_bldn0 WHERE docid = lv_docid.
  DATA: lt_bldn0 TYPE TABLE OF zthr_argus_bldn0.
  LOOP AT gs_parser-build ASSIGNING FIELD-SYMBOL(<ls_build>).
    lv_tabix = sy-tabix.
    INSERT INITIAL LINE INTO TABLE lt_bldn0 ASSIGNING FIELD-SYMBOL(<ls_bldn0>).
    <ls_bldn0> = CORRESPONDING #( <ls_build> ).
    <ls_bldn0>-docid = lv_docid.
    <ls_bldn0>-lineid = lv_tabix.
  ENDLOOP.
  MODIFY zthr_argus_bldn0 FROM TABLE lt_bldn0.
* Аргус. Справка. Безвоздмездные сделки
* ZTHR_ARGUS_GIFT0
  DELETE FROM zthr_argus_gift0 WHERE docid = lv_docid.
  DATA: lt_gift0 TYPE TABLE OF zthr_argus_gift0.
  LOOP AT gs_parser-gift ASSIGNING FIELD-SYMBOL(<ls_gift>).
    lv_tabix = sy-tabix.
    INSERT INITIAL LINE INTO TABLE lt_gift0 ASSIGNING FIELD-SYMBOL(<ls_gift0>).
    <ls_gift0> = CORRESPONDING #( <ls_gift> ).
    <ls_gift0>-docid = lv_docid.
    <ls_gift0>-lineid = lv_tabix.
  ENDLOOP.
  MODIFY zthr_argus_gift0 FROM TABLE lt_gift0.
* Аргус. Справка. Обязательства имущественного характера
* ZTHR_ARGUS_OBLI0
  DELETE FROM zthr_argus_obli0 WHERE docid = lv_docid.
  DATA: lt_obli0 TYPE TABLE OF zthr_argus_obli0.
  LOOP AT gs_parser-obligation ASSIGNING FIELD-SYMBOL(<ls_obligation>).
    lv_tabix = sy-tabix.
    INSERT INITIAL LINE INTO TABLE lt_obli0 ASSIGNING FIELD-SYMBOL(<ls_obli0>).
    <ls_obli0> = CORRESPONDING #( <ls_obligation> ).
    <ls_obli0>-docid = lv_docid.
    <ls_obli0>-lineid = lv_tabix.
  ENDLOOP.
  MODIFY zthr_argus_obli0 FROM TABLE lt_obli0.
* Аргус. Справка. Ценные бумаги
* ZTHR_ARGUS_OSEC0
  DELETE FROM zthr_argus_osec0 WHERE docid = lv_docid.
  DATA: lt_osec0 TYPE TABLE OF zthr_argus_osec0.
  LOOP AT gs_parser-valueable ASSIGNING FIELD-SYMBOL(<ls_value>).
    lv_tabix = sy-tabix.
    INSERT INITIAL LINE INTO TABLE lt_osec0 ASSIGNING FIELD-SYMBOL(<ls_osec0>).
    <ls_osec0> = CORRESPONDING #( <ls_value> ).
    <ls_osec0>-docid = lv_docid.
    <ls_osec0>-lineid = lv_tabix.
  ENDLOOP.
  MODIFY zthr_argus_osec0 FROM TABLE lt_osec0.
* Аргус. Справка. Акции и доли
* ZTHR_ARGUS_SECU0
  DELETE FROM zthr_argus_secu0 WHERE docid = lv_docid.
  DATA: lt_secu0 TYPE TABLE OF zthr_argus_secu0.
  LOOP AT gs_parser-securities ASSIGNING FIELD-SYMBOL(<ls_secu>).
    lv_tabix = sy-tabix.
    INSERT INITIAL LINE INTO TABLE lt_secu0 ASSIGNING FIELD-SYMBOL(<ls_secu0>).
    <ls_secu0> = CORRESPONDING #( <ls_secu> ).
    <ls_secu0>-docid = lv_docid.
    <ls_secu0>-lineid = lv_tabix.
  ENDLOOP.
  MODIFY zthr_argus_secu0 FROM TABLE lt_secu0.
* Аргус. Справка. Транспорт
* ZTHR_ARGUS_TRAN0
  DELETE FROM zthr_argus_tran0 WHERE docid = lv_docid.
  DATA: lt_tran0 TYPE TABLE OF zthr_argus_tran0.
  LOOP AT gs_parser-transport ASSIGNING FIELD-SYMBOL(<ls_trans>).
    lv_tabix = sy-tabix.
    INSERT INITIAL LINE INTO TABLE lt_tran0 ASSIGNING FIELD-SYMBOL(<ls_tran0>).
    <ls_tran0> = CORRESPONDING #( <ls_trans> ).
    <ls_tran0>-docid = lv_docid.
    <ls_tran0>-lineid = lv_tabix.
  ENDLOOP.
  MODIFY zthr_argus_tran0 FROM TABLE lt_tran0.
* Аргус. Справка. Срочные обязательства финансового характера
* ZTHR_ARGUS_URGE0
  DELETE FROM zthr_argus_urge0 WHERE docid = lv_docid.
  DATA: lt_urge0 TYPE TABLE OF zthr_argus_urge0.
  LOOP AT gs_parser-urgent ASSIGNING FIELD-SYMBOL(<ls_urgent>).
    lv_tabix = sy-tabix.
    INSERT INITIAL LINE INTO TABLE lt_urge0 ASSIGNING FIELD-SYMBOL(<ls_urge0>).
    <ls_urge0> = CORRESPONDING #( <ls_urgent> ).
    <ls_urge0>-docid = lv_docid.
    <ls_urge0>-lineid = lv_tabix.
  ENDLOOP.
  MODIFY zthr_argus_urge0 FROM TABLE lt_urge0.
* Источник справки
  DATA(ls_aedat) = VALUE zthr_argus_scan0(
    aedat = sy-datum
    usera = sy-uname
  ).
  IF gs_source IS NOT INITIAL.
    EXPORT
      filename = gs_source-filename
      source = gs_source-x
    TO DATABASE zthr_argus_scan0(pr) ID lv_docid FROM ls_aedat.
  ENDIF.
  ro_ref = NEW #( iv_ref_id = CONV #( lv_docid ) ).
ENDMETHOD.
ENDCLASS.
