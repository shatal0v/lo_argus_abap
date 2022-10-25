class ZCL_ZHR_ARGUS_DPC_EXT definition
  public
  inheriting from ZCL_ZHR_ARGUS_DPC
  create public .

public section.

  types:
    BEGIN OF ts_pack,
        x        TYPE xstringval,
        mime     TYPE pstring,
        multiple TYPE flag,
      END OF ts_pack .
  types:
    tt_pack TYPE TABLE OF ts_pack .
  types:
    BEGIN OF ts_report,
        doc      TYPE pstring,
        ename    TYPE pstring,
        plans    TYPE pstring,
        oiv      TYPE pstring,
        category TYPE pstring,
        year     TYPE pstring,
        period   TYPE pstring,
        doc_date TYPE pstring,
      END OF ts_report .
  types:
    tt_report TYPE TABLE OF ts_report .
  types:
    BEGIN OF ts_deep.
            INCLUDE TYPE zcl_zhr_argus_mpc_ext=>ts_request.
    TYPES: users TYPE STANDARD TABLE OF zcl_zhr_argus_mpc_ext=>ts_subject WITH DEFAULT KEY,
           END OF ts_deep .
  types:
    users TYPE STANDARD TABLE OF zcl_zhr_argus_mpc_ext=>ts_subject WITH DEFAULT KEY .

  constants GC_REPORT_MEMO type CHAR20 value 'GC_REPORT_MEMO' ##NO_TEXT.
  constants GC_REPORT_MEMO_D11 type CHAR20 value 'GC_REPORT_MEMO_D11' ##NO_TEXT.

  class-methods CLASS_CONSTRUCTOR .

  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~CHANGESET_BEGIN
    redefinition .
  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~CHANGESET_END
    redefinition .
  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~CREATE_DEEP_ENTITY
    redefinition .
  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~CREATE_STREAM
    redefinition .
  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~EXECUTE_ACTION
    redefinition .
  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~GET_ENTITYSET
    redefinition .
  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~GET_EXPANDED_ENTITY
    redefinition .
  methods /IWBEP/IF_MGW_APPL_SRV_RUNTIME~GET_STREAM
    redefinition .
protected section.

  types:
    tt_inspectors  TYPE RANGE OF p0105-pernr .

  methods ADAREASET_GET_ENTITYSET
    redefinition .
  methods ADCITYSET_GET_ENTITYSET
    redefinition .
  methods ADDFAMILYSET_CREATE_ENTITY
    redefinition .
  methods ADDRESSSET_GET_ENTITY
    redefinition .
  methods ADDRESSSET_UPDATE_ENTITY
    redefinition .
  methods ADHOUSESET_GET_ENTITYSET
    redefinition .
  methods ADREGIONSET_GET_ENTITYSET
    redefinition .
  methods ADSTREETSET_GET_ENTITYSET
    redefinition .
  methods ANALYTICDETAILSE_GET_ENTITY
    redefinition .
  methods ANALYTICSET_GET_ENTITY
    redefinition .
  methods ANALYTICSET_GET_ENTITYSET
    redefinition .
  methods CATEGORYSET_GET_ENTITYSET
    redefinition .
  methods CHECKCOMPLETESET_CREATE_ENTITY
    redefinition .
  methods CHECKORDERSET_GET_ENTITYSET
    redefinition .
  methods CHECKPROLONGATES_CREATE_ENTITY
    redefinition .
  methods CHECKSET_CREATE_ENTITY
    redefinition .
  methods CHECKSET_DELETE_ENTITY
    redefinition .
  methods CHECKSET_GET_ENTITY
    redefinition .
  methods CHECKSET_GET_ENTITYSET
    redefinition .
  methods COMMISSIONSET_CREATE_ENTITY
    redefinition .
  methods COMMISSIONSET_DELETE_ENTITY
    redefinition .
  methods COMMISSIONSET_GET_ENTITY
    redefinition .
  methods COMMISSIONSET_GET_ENTITYSET
    redefinition .
  methods COMMISSIONSET_UPDATE_ENTITY
    redefinition .
  methods EDUCATIONSET_CREATE_ENTITY
    redefinition .
  methods EDUCATIONSET_DELETE_ENTITY
    redefinition .
  methods EDUCATIONSET_GET_ENTITY
    redefinition .
  methods EDUCATIONSET_GET_ENTITYSET
    redefinition .
  methods EDUCATIONSET_UPDATE_ENTITY
    redefinition .
  methods EDUTYPESET_GET_ENTITYSET
    redefinition .
  methods ERRORREFSET_GET_ENTITYSET
    redefinition .
  methods FAMSASET_GET_ENTITYSET
    redefinition .
  methods INCOMINGREFSET_GET_ENTITYSET
    redefinition .
  methods INFORMSET_GET_ENTITY
    redefinition .
  methods INFORMSET_GET_ENTITYSET
    redefinition .
  methods JOBSET_GET_ENTITY
    redefinition .
  methods JOBSET_UPDATE_ENTITY
    redefinition .
  methods MAINUSERROLESET_GET_ENTITY
    redefinition .
  methods MATCHSET_GET_ENTITYSET
    redefinition .
  methods MILITARYSET_CREATE_ENTITY
    redefinition .
  methods MILITARYSET_DELETE_ENTITY
    redefinition .
  methods MILITARYSET_GET_ENTITY
    redefinition .
  methods MILITARYSET_GET_ENTITYSET
    redefinition .
  methods MILITARYSET_UPDATE_ENTITY
    redefinition .
  methods OIVSET_GET_ENTITYSET
    redefinition .
  methods ORGADDRSET_GET_ENTITYSET
    redefinition .
  methods PENALTYSET_GET_ENTITYSET
    redefinition .
  methods PERSONALSET_CREATE_ENTITY
    redefinition .
  methods PERSONALSET_GET_ENTITY
    redefinition .
  methods PERSONALSET_UPDATE_ENTITY
    redefinition .
  methods RDECISIONSET_GET_ENTITYSET
    redefinition .
  methods REALTYSET_GET_ENTITY
    redefinition .
  methods REALTYSET_GET_ENTITYSET
    redefinition .
  methods REFBANKSET_DELETE_ENTITY
    redefinition .
  methods REFBANKSET_GET_ENTITYSET
    redefinition .
  methods REFBANKSET_UPDATE_ENTITY
    redefinition .
  methods REFCOMPANYSET_GET_ENTITYSET
    redefinition .
  methods REFCREDITSET_GET_ENTITYSET
    redefinition .
  methods REFDEALSET_DELETE_ENTITY
    redefinition .
  methods REFDEALSET_GET_ENTITYSET
    redefinition .
  methods REFDIGASSETSSET_GET_ENTITYSET
    redefinition .
  methods REFDIGCURRSET_GET_ENTITYSET
    redefinition .
  methods REFEXPENSECOMPAN_DELETE_ENTITY
    redefinition .
  methods REFEXPENSECOMPAN_GET_ENTITYSET
    redefinition .
  methods REFEXPENSEOTHERR_DELETE_ENTITY
    redefinition .
  methods REFEXPENSEOTHERR_GET_ENTITYSET
    redefinition .
  methods REFEXPENSEOTHERR_UPDATE_ENTITY
    redefinition .
  methods REFEXPENSEREALTY_DELETE_ENTITY
    redefinition .
  methods REFEXPENSEREALTY_GET_ENTITYSET
    redefinition .
  methods REFEXPENSEREALTY_UPDATE_ENTITY
    redefinition .
  methods REFEXPENSESET_DELETE_ENTITY
    redefinition .
  methods REFEXPENSESET_GET_ENTITYSET
    redefinition .
  methods REFEXPENSESOURCE_DELETE_ENTITY
    redefinition .
  methods REFEXPENSESOURCE_GET_ENTITYSET
    redefinition .
  methods REFEXPENSESTOCKS_DELETE_ENTITY
    redefinition .
  methods REFEXPENSESTOCKS_GET_ENTITYSET
    redefinition .
  methods REFEXPENSESTOCKS_UPDATE_ENTITY
    redefinition .
  methods REFEXPENSETRANSP_DELETE_ENTITY
    redefinition .
  methods REFEXPENSETRANSP_GET_ENTITYSET
    redefinition .
  methods REFEXPENSETRANSP_UPDATE_ENTITY
    redefinition .
  methods REFFINANCIALSET_DELETE_ENTITY
    redefinition .
  methods REFFINANCIALSET_GET_ENTITYSET
    redefinition .
  methods REFFINANCIALSET_UPDATE_ENTITY
    redefinition .
  methods REFINCOMESET_DELETE_ENTITY
    redefinition .
  methods REFINCOMESET_GET_ENTITYSET
    redefinition .
  methods REFINCOMESET_UPDATE_ENTITY
    redefinition .
  methods REFOBLIGATIONSET_DELETE_ENTITY
    redefinition .
  methods REFOBLIGATIONSET_GET_ENTITYSET
    redefinition .
  methods REFOBLIGATIONSET_UPDATE_ENTITY
    redefinition .
  methods REFOTHERSTOCKSET_DELETE_ENTITY
    redefinition .
  methods REFOTHERSTOCKSET_GET_ENTITYSET
    redefinition .
  methods REFOTHERSTOCKSET_UPDATE_ENTITY
    redefinition .
  methods REFPERSONALSET_DELETE_ENTITY
    redefinition .
  methods REFPERSONALSET_GET_ENTITY
    redefinition .
  methods REFPERSONALSET_UPDATE_ENTITY
    redefinition .
  methods REFREALTYSET_DELETE_ENTITY
    redefinition .
  methods REFREALTYSET_GET_ENTITYSET
    redefinition .
  methods REFREALTYSET_UPDATE_ENTITY
    redefinition .
  methods REFSET_DELETE_ENTITY
    redefinition .
  methods REFSET_GET_ENTITY
    redefinition .
  methods REFSET_GET_ENTITYSET
    redefinition .
  methods REFSTOCKSET_DELETE_ENTITY
    redefinition .
  methods REFSTOCKSET_GET_ENTITYSET
    redefinition .
  methods REFSTOCKSET_UPDATE_ENTITY
    redefinition .
  methods REFTRANSPORTSET_DELETE_ENTITY
    redefinition .
  methods REFTRANSPORTSET_GET_ENTITYSET
    redefinition .
  methods REFTRANSPORTSET_UPDATE_ENTITY
    redefinition .
  methods REFUTILDIGRIGHTS_GET_ENTITYSET
    redefinition .
  methods REJECTREFSET_GET_ENTITYSET
    redefinition .
  methods RELATIVESET_CREATE_ENTITY
    redefinition .
  methods RELATIVESET_DELETE_ENTITY
    redefinition .
  methods RELATIVESET_GET_ENTITY
    redefinition .
  methods RELATIVESET_GET_ENTITYSET
    redefinition .
  methods RELATIVESET_UPDATE_ENTITY
    redefinition .
  methods RELATIVESUBTYSET_GET_ENTITYSET
    redefinition .
  methods REPORTSET_GET_ENTITYSET
    redefinition .
  methods REQUESTSET_CREATE_ENTITY
    redefinition .
  methods REQUESTSET_GET_ENTITY
    redefinition .
  methods REQUESTSET_GET_ENTITYSET
    redefinition .
  methods RISKSET_GET_ENTITYSET
    redefinition .
  methods RPENALTYSET_GET_ENTITYSET
    redefinition .
  methods RTYPESET_CREATE_ENTITY
    redefinition .
  methods RTYPESET_GET_ENTITYSET
    redefinition .
  methods SCANREFSET_GET_ENTITYSET
    redefinition .
  methods SEARCHSET_GET_ENTITYSET
    redefinition .
  methods SEARCHUSERSET_GET_ENTITYSET
    redefinition .
  methods SHORTCHECKSET_GET_ENTITYSET
    redefinition .
  methods SUBJECTSET_GET_ENTITYSET
    redefinition .
  methods SUBREFSET_DELETE_ENTITY
    redefinition .
  methods SUBREFSET_GET_ENTITY
    redefinition .
  methods SUBREFSET_GET_ENTITYSET
    redefinition .
  methods TEMPLATESET_GET_ENTITYSET
    redefinition .
  methods USERALERTSET_GET_ENTITY
    redefinition .
  methods USERSET_CREATE_ENTITY
    redefinition .
  methods USERSET_DELETE_ENTITY
    redefinition .
  methods USERSET_GET_ENTITY
    redefinition .
  methods USERSET_GET_ENTITYSET
    redefinition .
  methods WHERESET_GET_ENTITYSET
    redefinition .
  methods WORKACTIVITYSET_CREATE_ENTITY
    redefinition .
  methods WORKACTIVITYSET_DELETE_ENTITY
    redefinition .
  methods WORKACTIVITYSET_GET_ENTITY
    redefinition .
  methods WORKACTIVITYSET_GET_ENTITYSET
    redefinition .
  methods WORKACTIVITYSET_UPDATE_ENTITY
    redefinition .
private section.

  class-data:
    gr_relative_type TYPE RANGE OF t591s-subty .
  constants:
    BEGIN OF gc_all_oiv,
               oiv1 TYPE char8 VALUE '50000154',
               oiv2 TYPE char8 VALUE '50000501',
             END OF gc_all_oiv .
  constants GC_WERKS_ZZ01 type PERSA value 'ZZ01' ##NO_TEXT.
  constants GC_WERKS_168 type PERSA value '0168' ##NO_TEXT.

  methods _GET_INSPECTORS
    importing
      !IV_ROLE_MS type BOOLE_D
      !IV_ROLE_GD type BOOLE_D
      !IV_ROLE_GGS type BOOLE_D
    returning
      value(RT_INS) type TT_INSPECTORS .
  methods _GET_ROLE_TABLE
    importing
      !IV_ROLE type STRING
      !IV_NEEDREF type BOOLE_D
    returning
      value(RV_TAB) type ZTHR_ARGUS_SEARCH_INFO .
  methods _GET_ROLES
    importing
      !IO_TECH_REQUEST_CONTEXT type ref to /IWBEP/IF_MGW_REQ_ENTITYSET
      !IV_PERNR type PERNR_D optional
    exporting
      !EV_ROLE_MS type BOOLE_D
      !EV_ROLE_GD type BOOLE_D
      !EV_ROLE_GGS type BOOLE_D .
  methods _PROCESSING
    importing
      !IV_SLUG type PSTRING
    returning
      value(RT_REF) type ZTHR_ARGUS_PARSER
    raising
      /IWBEP/CX_MGW_TECH_EXCEPTION .
  methods _GET_REF_UNTIL_DATE
    importing
      !IV_PLANS type HROBJID
      !IV_YEAR type JAHR
    returning
      value(RV_DATE) type DATUM .
  methods _GET_PHOTO
    importing
      !IV_PERNR type PERNR_D
    returning
      value(RV_X) type XSTRING .
  methods _DUPLICATE_ROW
    importing
      !IV_TAG type PSTRING
      !IV_COUNT type INT4
    changing
      !CV_DOCX type PSTRING .
  methods _GET_ANKETA
    importing
      !IV_X type XSTRING
      !IV_PERNR type PERNR_D
    returning
      value(RV_X) type XSTRING .
  methods _GET_CHECK_REPORT
    importing
      !IV_X type XSTRING
      !IV_DOCID type XSTRING
    exporting
      !EV_NACHN type PSTRING
    returning
      value(RV_X) type XSTRING .
  methods _GET_REQUEST_REPORT
    importing
      !IV_DOCID type XSTRING
    exporting
      !EV_TEMPLATE type PSTRING
      !EV_NACHN type PSTRING
    returning
      value(RV_X) type XSTRING .
  methods _GET_INPUT
    importing
      !IT_KEY_TAB type /IWBEP/T_MGW_NAME_VALUE_PAIR optional
      !IT_FILTER_SELECT_OPTIONS type /IWBEP/T_MGW_SELECT_OPTION optional
    exporting
      value(ES_INPUT) type ANY .
  methods _GET_OIV
    importing
      !IV_PERNR type PERNR_D
    exporting
      !EV_OIV type STRING
      !EV_POSITION type STRING .
  methods _GET_NAME_BY_CRITERIA
    importing
      !IV_NAME type PSTRING
    returning
      value(RV_NAME) type PSTRING .
  methods _GET_ANALYTIC_PRINT
    importing
      !IV_X type XSTRING
      !IV_REF_ID type PSTRING optional
      value(IT_REF_ID) type STRINGTAB optional
    returning
      value(RV_X) type XSTRING .
  methods _GET_D12_PRINT
    importing
      !IV_X type XSTRING
      !IV_PARAMETERS type ZCL_ZHR_ARGUS_MPC_EXT=>TS_CHECKORDERPRINT
    returning
      value(RV_X) type XSTRING .
  methods _GET_REF_PRINT
    importing
      !IV_X type XSTRING
      !IV_REF_ID type PSTRING optional
      value(IT_REF_ID) type STRINGTAB optional
    returning
      value(RV_X) type XSTRING .
  methods _GET_REPORT
    importing
      !IV_X type XSTRING
      !IT_PERNR type PERNR_TAB
      !IV_REPORT_ID type PSTRING
    returning
      value(RV_X) type XSTRING .
  methods _GET_REPORT_XLS_EXPENSE
    importing
      !IT_REPORT type ZCL_ZHR_ARGUS_MPC_EXT=>TT_REPORT
      !IV_REPORT_ID type PSTRING
    exporting
      !ET_REPORT type TT_REPORT .
  methods _GET_REPORT_XLS_PART
    importing
      !IT_REPORT type ZCL_ZHR_ARGUS_MPC_EXT=>TT_REPORT
      !IV_REPORT_ID type PSTRING
    exporting
      !ET_REPORT type TT_REPORT .
  methods _GET_REPORT_XLS_NOT
    importing
      !IT_REPORT type ZCL_ZHR_ARGUS_MPC_EXT=>TT_REPORT
      !IV_REPORT_ID type PSTRING
    exporting
      !ET_REPORT type TT_REPORT .
  methods _GET_REPORT_XLS_SUBMIT
    importing
      !IT_REPORT type ZCL_ZHR_ARGUS_MPC_EXT=>TT_REPORT
      !IV_REPORT_ID type PSTRING
    exporting
      !ET_REPORT type TT_REPORT .
  methods _GET_REPORT_XLS_REQUIRED
    importing
      !IT_REPORT type ZCL_ZHR_ARGUS_MPC_EXT=>TT_REPORT
      !IV_REPORT_ID type PSTRING
    exporting
      !ET_REPORT type TT_REPORT .
  methods _GET_REPORT_XLS
    importing
      !IT_REPORT type ZCL_ZHR_ARGUS_MPC_EXT=>TT_REPORT
      !IV_REPORT_ID type PSTRING
    exporting
      !ET_REPORT type TT_REPORT .
  methods _GET_WWW
    importing
      !IV_OBJID type PSTRING
    returning
      value(RV_X) type XSTRING .
  methods _HIRE_NEW_EMPLOYEE
    importing
      !IS_ENTITY type ZCL_ZHR_ARGUS_MPC=>TS_PERSONAL
    returning
      value(RV_PERNR) type PERNR_D
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION .
  methods _INSERT_0006
    importing
      !IV_PERNR type PERNR_D
      !IV_SUBTY type SUBTYP
      !IS_ENTITY type ZCL_ZHR_ARGUS_MPC_EXT=>ADDRESSTYPE
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION .
  methods _INSERT_0290
    importing
      !IV_PERNR type PERNR_D
      !IV_SUBTY type SUBTYP
      !IV_NUMBER type PSTRING
      !IS_0002 type P0002
    raising
      /IWBEP/CX_MGW_BUSI_EXCEPTION .
  methods _SAVE_ADDR_INTERNAL
    importing
      value(IV_ADDR_NUM) type AD_ADDRNUM optional
      !IS_KEY type PAKEY
      !IS_ADDR type ADRC
    returning
      value(RV_ADDR_NUM) type AD_ADDRNUM .
  methods _TO_ADDR_INTERNAL
    importing
      !IS_ADDR type ZCL_ZHR_ARGUS_MPC_EXT=>ADDRESSTYPE
    returning
      value(RS_ADDR) type ADRC .
  methods _IS_IMAGE
    importing
      !IV_MIME type PSTRING
    returning
      value(RV_IS) type FLAG .
  methods _GET_SCAN_BY_SLUG
    importing
      !IV_SLUG type PSTRING
    exporting
      !RT_PACK type TT_PACK .
  methods _SPLIT_CASE
    importing
      !IV_TXT type PSTRING
    returning
      value(RV_TXT) type PSTRING .
ENDCLASS.



CLASS ZCL_ZHR_ARGUS_DPC_EXT IMPLEMENTATION.


  METHOD /iwbep/if_mgw_appl_srv_runtime~changeset_begin.
**TRY.
*CALL METHOD SUPER->/IWBEP/IF_MGW_APPL_SRV_RUNTIME~CHANGESET_BEGIN
*  EXPORTING
*    IT_OPERATION_INFO =
**  CHANGING
**    cv_defer_mode     =
*    .
** CATCH /iwbep/cx_mgw_busi_exception .
** CATCH /iwbep/cx_mgw_tech_exception .
**ENDTRY.
  ENDMETHOD.


  METHOD /iwbep/if_mgw_appl_srv_runtime~changeset_end.
**TRY.
*CALL METHOD SUPER->/IWBEP/IF_MGW_APPL_SRV_RUNTIME~CHANGESET_END
*    .
** CATCH /iwbep/cx_mgw_busi_exception .
** CATCH /iwbep/cx_mgw_tech_exception .
**ENDTRY.
  ENDMETHOD.


  METHOD /iwbep/if_mgw_appl_srv_runtime~create_deep_entity.
    DATA : lt_out_tab TYPE STANDARD TABLE OF ts_deep,
           wa_out_tab LIKE LINE OF lt_out_tab,
           lt_request TYPE STANDARD TABLE OF zcl_zhr_argus_mpc_ext=>ts_request,
           wa_request TYPE zcl_zhr_argus_mpc_ext=>ts_request,
           lt_users   TYPE STANDARD TABLE OF zcl_zhr_argus_mpc_ext=>ts_subject,
           wa_users   TYPE zcl_zhr_argus_mpc_ext=>ts_subject.
    DATA lt_zthr_check_req TYPE TABLE OF zthr_check_req.
    DATA lt_subjects_from_group TYPE TABLE OF hrobjid.
    DATA: lt_file TYPE TABLE OF zthr_check_file,
          ls_file TYPE zthr_check_file.
    TYPES: BEGIN OF ts_group,
             group_req TYPE boole_d,
             group_id  TYPE char32,
           END OF ts_group.
    DATA ls_group TYPE ts_group.
    FIELD-SYMBOLS: <ls_deep> TYPE ts_deep.
    CREATE DATA er_deep_entity TYPE ts_deep.
    ASSIGN er_deep_entity->* TO <ls_deep>.
    CASE iv_entity_set_name.

      WHEN 'RequestSet'.
        DATA: ls_req TYPE zthr_check_req.
        io_data_provider->read_entry_data(
          IMPORTING
            es_data = wa_out_tab
        ).

        SELECT SINGLE group_req group_id FROM zthr_check_req INTO ls_group WHERE docid = wa_out_tab-docid.
        IF sy-subrc = 0.
          wa_out_tab-isgroup = ls_group-group_req.
          wa_out_tab-groupid = ls_group-group_id.
        ENDIF.
        IF wa_out_tab-groupid IS INITIAL."создание
          IF lines( wa_out_tab-users ) > 1."в групповой запрос добавляем чекбокс группы и ид группы
            wa_out_tab-isgroup = abap_true.
            wa_out_tab-groupid = cl_system_uuid=>create_uuid_c32_static( ).
          ENDIF.

          LOOP AT wa_out_tab-users ASSIGNING FIELD-SYMBOL(<ls_usr>).
            IF wa_out_tab-docid IS INITIAL.
              wa_out_tab-docid = cl_system_uuid=>create_uuid_c32_static( ).
            ENDIF.
            ls_req-docid = wa_out_tab-docid.
            ls_req-subject = <ls_usr>-subject.
            IF strlen( wa_out_tab-outdate ) >= 10.
              ls_req-outdate = |{ wa_out_tab-outdate+6(4) }{ wa_out_tab-outdate+3(2) }{ wa_out_tab-outdate+0(2) }|.
            ENDIF.
            ls_req-template = wa_out_tab-template.
            ls_req-where_ = wa_out_tab-where.
            IF strlen( wa_out_tab-answerdate ) >= 10.
              ls_req-answer_date = |{ wa_out_tab-answerdate+6(4) }{ wa_out_tab-answerdate+3(2) }{ wa_out_tab-answerdate+0(2) }|.
            ENDIF.
            ls_req-checkdocid = wa_out_tab-checkdocid.
            ls_req-group_req = wa_out_tab-isgroup.
            ls_req-group_id = wa_out_tab-groupid.
            MODIFY zthr_check_req FROM ls_req.

            IF wa_out_tab-formedrequestsrc IS NOT INITIAL.
              INSERT VALUE #( docid = wa_out_tab-docid type = 8 name = wa_out_tab-formedrequest src = wa_out_tab-formedrequestsrc ) INTO TABLE lt_file.
            ENDIF.
            MODIFY zthr_check_file FROM TABLE lt_file.
            CLEAR wa_out_tab-docid.
          ENDLOOP.

        ELSE."обновление группы
          SELECT * FROM zthr_check_req INTO TABLE lt_zthr_check_req WHERE group_id = wa_out_tab-groupid.
          LOOP AT lt_zthr_check_req ASSIGNING FIELD-SYMBOL(<ls_req>).
            ls_req-docid = <ls_req>-docid.
            ls_req-subject = <ls_req>-subject.
            IF strlen( wa_out_tab-outdate ) >= 10.
              ls_req-outdate = |{ wa_out_tab-outdate+6(4) }{ wa_out_tab-outdate+3(2) }{ wa_out_tab-outdate+0(2) }|.
            ENDIF.
            ls_req-template = wa_out_tab-template.
            ls_req-where_ = wa_out_tab-where.
            IF strlen( wa_out_tab-answerdate ) >= 10.
              ls_req-answer_date = |{ wa_out_tab-answerdate+6(4) }{ wa_out_tab-answerdate+3(2) }{ wa_out_tab-answerdate+0(2) }|.
            ENDIF.
            ls_req-checkdocid = wa_out_tab-checkdocid.
            ls_req-group_req = wa_out_tab-isgroup.
            ls_req-group_id = wa_out_tab-groupid.

            SELECT * FROM zthr_check_file INTO TABLE lt_file WHERE docid = ls_req-docid AND type = 8.
            IF sy-subrc = 0.
              LOOP AT lt_file ASSIGNING FIELD-SYMBOL(<ls_file>).
                <ls_file>-name = wa_out_tab-formedrequest.
                <ls_file>-src = wa_out_tab-formedrequestsrc.
              ENDLOOP.
            ELSE.
              APPEND INITIAL LINE TO lt_file ASSIGNING <ls_file>.
              <ls_file>-docid = ls_req-docid.
              <ls_file>-name = wa_out_tab-formedrequest.
              <ls_file>-src = wa_out_tab-formedrequestsrc.
              <ls_file>-type = 8.
            ENDIF.

            MODIFY zthr_check_file FROM TABLE lt_file.
            MODIFY zthr_check_req FROM ls_req.
          ENDLOOP.
        ENDIF.
        <ls_deep>-docid = ls_req-docid.
    ENDCASE.
  ENDMETHOD.


  METHOD /iwbep/if_mgw_appl_srv_runtime~create_stream.
    CASE iv_entity_name.
      WHEN 'Attachment'.
        DATA: lv_doc_id    TYPE sapb-sapobjid,
              lv_object_id TYPE sapb-sapobjid,
              ls_doc       TYPE toadt.
        DATA(lv_filename) = iv_slug.

      WHEN 'AnalyticPrint'.

        DATA: lt_key            TYPE /iwbep/t_mgw_name_value_pair,
              lt_ref            TYPE TABLE OF pstring,
              ls_stream         TYPE ty_s_media_resource,
              ls_input_analytic TYPE zcl_zhr_argus_mpc_ext=>ts_analytic.


        cl_bcs_convert=>xstring_to_string(
          EXPORTING
            iv_xstr   = is_media_resource-value
            iv_cp     = '4110'
          RECEIVING
            rv_string = DATA(lv_base64_t)
        ).
*        DATA(lv_file_64_t) = substring_after( val = lv_base64_t sub = 'TEXT": ' ).
        APPEND VALUE #(
                name = 'refId'
                value = lv_base64_t ) TO lt_key.

        TRY.
            lt_key[ name = 'pernr' ]-name = 'refId'.
          CATCH cx_sy_itab_line_not_found.
        ENDTRY.
        _get_input(
          EXPORTING
            it_key_tab               = lt_key
          IMPORTING
            es_input                 = ls_input_analytic
        ).
        /ui2/cl_json=>deserialize(
          EXPORTING
            json        = ls_input_analytic-refid
          CHANGING
            data        = lt_ref
        ).
        DELETE lt_ref WHERE table_line IS INITIAL.
        ls_stream-value = _get_analytic_print(
          iv_x = _get_www( iv_objid = 'ZHR_ARGUS_ANALYTIC' )
          it_ref_id = lt_ref
        ).
        ls_stream-mime_type = 'application/vnd.ms-excel'.
        /iwbep/if_mgw_conv_srv_runtime~set_header( is_header = VALUE #(
          name = 'content-disposition'
          value = |attachment; filename={ cl_http_server=>escape_url( 'Аналитика' ) }.xlsx|
        ) ).
        copy_data_to_ref(
                 EXPORTING
                   is_data = ls_stream
                 CHANGING
                   cr_data = er_entity
               ).
*        /iwbep/if_mgw_conv_srv_runtime~set_header( is_header = VALUE #(
*          name = 'Cache-Control'
*          value = 'private'
*        ) ).
      WHEN OTHERS.
        DATA: BEGIN OF ls_mode,
                file TYPE flag,
                scan TYPE flag,
              END OF ls_mode.
        DATA: ls_scan  TYPE zcl_zhr_argus_mpc_ext=>ts_scan,
              ls_aedat TYPE zthr_argus_scan0.
        DATA(lt_hdr) = CAST /iwbep/cl_mgw_request( io_tech_request_context )->get_request_details( )-technical_request-request_header.
        DATA(lv_url) = VALUE pstring( lt_hdr[ name = '~request_uri' ]-value OPTIONAL ).
        SPLIT lv_url AT '?' INTO DATA(lv_prefix) DATA(lv_query).

        IF lv_query CS 'file'.
          ls_mode-file = abap_true.
        ELSEIF lv_query CS 'scan'.
          ls_mode-scan = abap_true.
        ENDIF.
        DATA(ls_media) = is_media_resource.

        cl_bcs_convert=>xstring_to_string(
          EXPORTING
            iv_xstr   = ls_media-value
            iv_cp     = '4110'
          RECEIVING
            rv_string = DATA(lv_base64)
        ).

        DATA(lv_file_64) = substring_after( val = lv_base64 sub = 'base64,' ).
        ls_media-mime_type = substring_after( val = substring_before( val = lv_base64 sub = ';base64,' ) sub = 'data:' ).
        IF ls_mode-scan = abap_true.
          ls_media-mime_type = 'image/png'.
        ENDIF.
        CALL FUNCTION 'SCMS_BASE64_DECODE_STR'
          EXPORTING
            input  = lv_file_64
          IMPORTING
            output = ls_media-value
          EXCEPTIONS
            OTHERS = 2.
        DATA lv_xstr TYPE string.
        lv_xstr = ls_media-value.

*        REPLACE ALL OCCURRENCES OF 'EP' IN lv_file_64 WITH '1'.
*    IF ls_media-mime_type <> 'application/octet-stream'.
*      TRY.
*          DATA(lt_parsed) = NEW zcl_argus_parser( ls_media )->parse( ).
*        CATCH zcx_argus_parser_error.
*      ENDTRY.
*    ELSE.
*      DATA(lv_raw_xsb) = NEW zcl_argus_xsb( iv_x = ls_media-value )->get_raw( ).
*      APPEND lv_raw_xsb TO lt_parsed.
*    ENDIF.
        DATA(lv_id) = CONV text50( |{ iv_slug }-{ cl_system_uuid=>create_uuid_c22_static( ) }| ).
        ls_aedat = VALUE #(
          aedat = sy-datum
          usera = sy-uname
        ).
        EXPORT
*      parse = lt_parsed
          source = ls_media-value
          mime_type = ls_media-mime_type
        TO DATABASE zthr_argus_scan0(sc) ID lv_id FROM ls_aedat.
        ls_scan-scanid = iv_slug.

        copy_data_to_ref(
          EXPORTING
            is_data = ls_scan
          CHANGING
            cr_data = er_entity
        ).
    ENDCASE.
  ENDMETHOD.


  METHOD /iwbep/if_mgw_appl_srv_runtime~execute_action.
    DATA: ls_ref TYPE zcl_zhr_argus_mpc_ext=>ts_ref.
    CASE iv_action_name.
      WHEN 'RefApprove'.
        DATA(lv_ref_id) = it_parameter[ name = 'refId' ]-value.
        NEW zcl_argus_ref( iv_ref_id = lv_ref_id )->approve( ).
        ls_ref-refid = lv_ref_id.
      WHEN 'RefReject'.
        lv_ref_id = it_parameter[ name = 'refId' ]-value.
        NEW zcl_argus_ref( iv_ref_id = lv_ref_id )->reject( )..
        ls_ref-refid = lv_ref_id.
    ENDCASE.
    copy_data_to_ref(
      EXPORTING
        is_data = ls_ref
      CHANGING
        cr_data = er_data
    ).
  ENDMETHOD.


  METHOD /iwbep/if_mgw_appl_srv_runtime~get_entityset.
*   TODO Раскомментировать
*    DATA(lt_hdr) = CAST /iwbep/cl_mgw_request( io_tech_request_context )->get_request_details( )-technical_request-request_header.
*    ASSIGN lt_hdr[ name = 'x-main-user' ] TO FIELD-SYMBOL(<ls_user>).
*    IF sy-subrc = 0.
*      DATA(lo_mss) = zcl_mss_data_assistent=>get_instance( ).
*      DATA(lv_pernr) = lo_mss->get_pernr(
*          iv_usrid  = CONV #( <ls_user>-value )
*      ).
*      DATA(lv_is) = lo_mss->is_argus( iv_pernr = lv_pernr ).
*    ENDIF.
*    IF lv_is = abap_false.
*      MESSAGE e000(zhr_argus) INTO DATA(lv_dummy).
*      RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception
*        EXPORTING
*          textid = VALUE scx_t100key(
*            msgid = sy-msgid
*            msgno = sy-msgno
*          ).
*    ENDIF.
    CALL METHOD super->/iwbep/if_mgw_appl_srv_runtime~get_entityset
      EXPORTING
        iv_entity_name           = iv_entity_name
        iv_entity_set_name       = iv_entity_set_name
        iv_source_name           = iv_source_name
        it_filter_select_options = it_filter_select_options
        it_order                 = it_order
        is_paging                = is_paging
        it_navigation_path       = it_navigation_path
        it_key_tab               = it_key_tab
        iv_filter_string         = iv_filter_string
        iv_search_string         = iv_search_string
        io_tech_request_context  = io_tech_request_context
      IMPORTING
        er_entityset             = er_entityset
        es_response_context      = es_response_context.
  ENDMETHOD.


  METHOD /iwbep/if_mgw_appl_srv_runtime~get_expanded_entity.
    DATA : lt_out_tab TYPE STANDARD TABLE OF ts_deep,
           wa_out_tab LIKE LINE OF lt_out_tab,

           lt_request TYPE STANDARD TABLE OF zcl_zhr_argus_mpc_ext=>ts_request,
           wa_request TYPE zcl_zhr_argus_mpc_ext=>ts_request,

           lt_users   TYPE STANDARD TABLE OF zcl_zhr_argus_mpc_ext=>ts_subject,
           wa_users   TYPE zcl_zhr_argus_mpc_ext=>ts_subject.
    DATA lt_zthr_check_req TYPE TABLE OF zthr_check_req.
    DATA lt_subjects_from_group TYPE TABLE OF hrobjid.

    CASE iv_entity_set_name.

      WHEN 'RequestSet'.
        _get_input(
         EXPORTING
           it_key_tab = it_key_tab
         IMPORTING
           es_input   = wa_out_tab
       ).

        SELECT SINGLE * FROM zthr_check_req INTO @DATA(ls_check) WHERE docid = @wa_out_tab-docid.
        CHECK sy-subrc = 0.
        wa_out_tab-docid = ls_check-docid.
        wa_out_tab-outdate = |{ ls_check-outdate DATE = USER }|.
        wa_out_tab-template = |{ ls_check-template }|.
        wa_out_tab-where = ls_check-where_.
        wa_out_tab-answerdate = |{ ls_check-answer_date DATE = USER }|.
        wa_out_tab-orgaddr = ls_check-orgaddr.
        wa_out_tab-checkdocid = ls_check-checkdocid.
        wa_out_tab-isgroup = ls_check-group_req.

        SELECT SINGLE * FROM zthr_check_file INTO @DATA(ls_file) WHERE docid = @wa_out_tab-docid AND type = 8.
        IF sy-subrc = 0.
          wa_out_tab-formedrequest = ls_file-name.
          wa_out_tab-formedrequestsrc = ls_file-src.
        ENDIF.

        IF ls_check-group_req EQ abap_true.
          SELECT subject FROM zthr_check_req INTO TABLE lt_subjects_from_group WHERE group_id = ls_check-group_id.
          IF sy-subrc = 0.
            DELETE ADJACENT DUPLICATES FROM lt_subjects_from_group.
          ENDIF.
          LOOP AT lt_subjects_from_group INTO DATA(ls_subjects_from_group).
            SELECT SINGLE * FROM pa0001 INTO @DATA(ls_subject) WHERE pernr = @ls_subjects_from_group.
            APPEND INITIAL LINE TO wa_out_tab-users ASSIGNING FIELD-SYMBOL(<ls_usr>).
            <ls_usr>-docid = ls_check-docid.
            <ls_usr>-subject = ls_subjects_from_group.
            <ls_usr>-subjectname = ls_subject-ename.
          ENDLOOP.
        ELSE.
          wa_out_tab-subject = ls_check-subject.
          SELECT SINGLE * FROM pa0001 INTO @ls_subject WHERE pernr = @ls_check-subject.
          wa_out_tab-subjectname = ls_subject-ename.
          zcl_hr_data=>get_name_orgeh( EXPORTING i_pernr = ls_check-subject
                                       IMPORTING e_lname = wa_out_tab-subjectoiv ).
        ENDIF.

        copy_data_to_ref(
         EXPORTING
          is_data = wa_out_tab
         CHANGING
          cr_data = er_entity ).

    ENDCASE.
  ENDMETHOD.


  METHOD /iwbep/if_mgw_appl_srv_runtime~get_stream.
    DATA: ls_input_anketa        TYPE zcl_zhr_argus_mpc_ext=>ts_anketa,
          ls_input_report        TYPE zcl_zhr_argus_mpc_ext=>ts_reportprint,
          ls_input_income        TYPE zcl_zhr_argus_mpc_ext=>ts_incomeprint,
          ls_input_analytic      TYPE zcl_zhr_argus_mpc_ext=>ts_analytic,
          ls_input_ref           TYPE zcl_zhr_argus_mpc_ext=>ts_refprint,
          ls_input_check_print   TYPE zcl_zhr_argus_mpc_ext=>ts_checkprint,
          ls_input_mail          TYPE zcl_zhr_argus_mpc_ext=>ts_checkmailprint,
          ls_input_order         TYPE zcl_zhr_argus_mpc_ext=>ts_checkorder,
          ls_input_orderprint    TYPE zcl_zhr_argus_mpc_ext=>ts_checkorderprint,
          ls_input_request_print TYPE zcl_zhr_argus_mpc_ext=>ts_requestprint,
          lt_pernr               TYPE TABLE OF pernr_d,
          lt_ref                 TYPE TABLE OF pstring,
          ls_input_photo         TYPE zcl_zhr_argus_mpc_ext=>ts_photo,
          ls_stream              TYPE ty_s_media_resource,
          lv_nachn               TYPE pstring.
    FIELD-SYMBOLS: <ls_xstr> TYPE x.
    CASE iv_entity_name.
      WHEN zcl_zhr_argus_mpc_ext=>gc_photo.
        _get_input(
          EXPORTING
            it_key_tab               = it_key_tab
          IMPORTING
            es_input                 = ls_input_photo
        ).
        ls_stream-value = _get_photo( iv_pernr = CONV #( ls_input_photo-pernr ) ).
        ls_stream-mime_type = 'image/jpeg'.
      WHEN zcl_zhr_argus_mpc_ext=>gc_anketa.
        _get_input(
          EXPORTING
            it_key_tab               = it_key_tab
          IMPORTING
            es_input                 = ls_input_anketa
        ).
        ls_stream-value = _get_anketa(
          iv_x = _get_www( iv_objid = 'ZHR_ARGUS_ANKETA' )
          iv_pernr = CONV #( ls_input_anketa-pernr )
        ).
        ls_stream-mime_type = 'application/vnd.openxmlformats-officedocument.wordprocessing'.
        /iwbep/if_mgw_conv_srv_runtime~set_header( is_header = VALUE #(
          name = 'content-disposition'
          value = 'attachment; filename=Anketa.docx'
        ) ).
      WHEN zcl_zhr_argus_mpc_ext=>gc_incomeprint.
        _get_input(
          EXPORTING
            it_key_tab               = it_key_tab
          IMPORTING
            es_input                 = ls_input_income
        ).
        /ui2/cl_json=>deserialize(
          EXPORTING
            json        = ls_input_income-refid
          CHANGING
            data        = lt_ref
        ).
        DELETE lt_ref WHERE table_line IS INITIAL.
        ls_stream-value = _get_ref_print(
          iv_x = _get_www( iv_objid = 'ZHR_ARGUS_REF' )
          it_ref_id = lt_ref
        ).
        ls_stream-mime_type = 'application/vnd.ms-excel'.
        /iwbep/if_mgw_conv_srv_runtime~set_header( is_header = VALUE #(
          name = 'content-disposition'
          value = 'attachment; filename=Ref.xlsx'
        ) ).
      WHEN zcl_zhr_argus_mpc_ext=>gc_analyticprint OR zcl_zhr_argus_mpc_ext=>gc_riskprint.
        DATA(lt_key) = it_key_tab.
        TRY.
            lt_key[ name = 'pernr' ]-name = 'refId'.
          CATCH cx_sy_itab_line_not_found.
        ENDTRY.
        _get_input(
          EXPORTING
            it_key_tab               = lt_key
          IMPORTING
            es_input                 = ls_input_analytic
        ).
        /ui2/cl_json=>deserialize(
          EXPORTING
            json        = ls_input_analytic-refid
          CHANGING
            data        = lt_ref
        ).
        DELETE lt_ref WHERE table_line IS INITIAL.
        ls_stream-value = _get_analytic_print(
          iv_x = _get_www( iv_objid = 'ZHR_ARGUS_ANALYTIC' )
          it_ref_id = lt_ref
        ).
        ls_stream-mime_type = 'application/vnd.ms-excel'.
        /iwbep/if_mgw_conv_srv_runtime~set_header( is_header = VALUE #(
          name = 'content-disposition'
          value = |attachment; filename={ cl_http_server=>escape_url( 'Аналитика' ) }.xlsx|
        ) ).
      WHEN zcl_zhr_argus_mpc_ext=>gc_reportprint.
        _get_input(
          EXPORTING
            it_key_tab = it_key_tab
          IMPORTING
            es_input   = ls_input_report
        ).
        /ui2/cl_json=>deserialize(
          EXPORTING
            json        = ls_input_report-pernr
          CHANGING
            data        = lt_pernr
        ).
        SPLIT ls_input_report-reportid AT '~' INTO DATA(lv_cat) DATA(lv_rep).
        IF lv_rep IS INITIAL.
          lv_rep = ls_input_report-reportid.
        ENDIF.
        DATA(lv_report) = SWITCH pstring( lv_rep
          WHEN 'requiredIncome' THEN 'ZHR_ARGUS_REPORT_REQUIRED'
          WHEN 'submittedIncome' THEN 'ZHR_ARGUS_REPORT_SUBMIT'
          WHEN 'notReportIncome' THEN 'ZHR_ARGUS_REPORT_NOT'
          WHEN 'partiallyReportedIncome' THEN 'ZHR_ARGUS_REPORT_PARTIALLY'
          WHEN 'submittedExpense' THEN 'ZHR_ARGUS_REPORT_EXPENSE'
        ).
        ls_stream-value = _get_report(
          iv_x = _get_www( iv_objid = lv_report )
          it_pernr = lt_pernr
          iv_report_id = ls_input_report-reportid
        ).
        ls_stream-mime_type = 'application/vnd.ms-excel'.
        /iwbep/if_mgw_conv_srv_runtime~set_header( is_header = VALUE #(
          name = 'content-disposition'
          value = 'attachment; filename=Report.xlsx'
        ) ).
      WHEN zcl_zhr_argus_mpc_ext=>gc_refprint.
        _get_input(
          EXPORTING
            it_key_tab = it_key_tab
          IMPORTING
            es_input   = ls_input_ref
        ).
        ls_stream-value = _get_ref_print(
          iv_x = _get_www( iv_objid = 'ZHR_ARGUS_REF' )
          iv_ref_id = ls_input_ref-refid
        ).
        ls_stream-mime_type = 'application/vnd.ms-excel'.
        /iwbep/if_mgw_conv_srv_runtime~set_header( is_header = VALUE #(
          name = 'content-disposition'
          value = 'attachment; filename=Ref.xlsx'
        ) ).
      WHEN zcl_zhr_argus_mpc_ext=>gc_checkprint.
        CLEAR lv_nachn.
        _get_input(
          EXPORTING
            it_key_tab = it_key_tab
          IMPORTING
            es_input   = ls_input_check_print
        ).

        SPLIT ls_input_check_print-docid AT '_' INTO DATA(lv_check_docid) DATA(lv_rep_check).
        ls_stream-value = _get_check_report( EXPORTING
        iv_x = _get_www( iv_objid = |ZHR_ARGUS_CHECK_{ condense( lv_rep_check ) }| )
        iv_docid = CONV #( ls_input_check_print-docid )
        IMPORTING ev_nachn = lv_nachn ).

        ls_stream-mime_type = 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'.
        /iwbep/if_mgw_conv_srv_runtime~set_header( is_header = VALUE #(
          name = 'content-disposition'
          value = |attachment; filename={ cl_http_server=>escape_url( unescaped = |ZHR_ARGUS_CHECK_{ condense( lv_rep_check ) } { lv_nachn }| ) }.docx|
        ) ).
      WHEN zcl_zhr_argus_mpc_ext=>gc_checkmailprint.
        CLEAR lv_nachn.
        _get_input(
          EXPORTING
            it_key_tab = it_key_tab
          IMPORTING
            es_input   = ls_input_mail
        ).
        SPLIT ls_input_mail-docid AT '_' INTO DATA(lv_docid) DATA(lv_rep_mail).
        ls_stream-value = _get_check_report( EXPORTING
        iv_x = _get_www( iv_objid = |ZHR_ARGUS_MAIL_{ condense( lv_rep_mail ) }| )
        iv_docid = CONV #( ls_input_mail-docid )
        IMPORTING ev_nachn = lv_nachn ).
        ls_stream-mime_type = 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'.
        /iwbep/if_mgw_conv_srv_runtime~set_header( is_header = VALUE #(
          name = 'content-disposition'
          value = |attachment; filename={ cl_http_server=>escape_url( unescaped = |ZHR_ARGUS_MAIL_{ condense( lv_rep_mail ) } { lv_nachn }| ) }.docx|
        ) ).
      WHEN zcl_zhr_argus_mpc_ext=>gc_requestprint.
        CLEAR lv_nachn.
        _get_input(
          EXPORTING
            it_key_tab = it_key_tab
          IMPORTING
            es_input   = ls_input_request_print
        ).

        ls_stream-value = _get_request_report( EXPORTING
          iv_docid = CONV #( ls_input_request_print-docid )
          IMPORTING ev_nachn = lv_nachn
                    ev_template = lv_rep_mail ).
        ls_stream-mime_type = 'application/vnd.openxmlformats-officedocument.wordprocessingml.document'.
        /iwbep/if_mgw_conv_srv_runtime~set_header( is_header = VALUE #(
          name = 'content-disposition'
          value = |attachment; filename={ cl_http_server=>escape_url( unescaped = |ZHR_REQUEST_{ condense( lv_rep_mail ) } { lv_nachn }| ) }.docx|
        ) ).
      WHEN zcl_zhr_argus_mpc_ext=>gc_checkorderprint.
        CLEAR lv_nachn.
        DATA lv_filename(250) TYPE c.
        _get_input(
          EXPORTING
            it_key_tab = it_key_tab
          IMPORTING
            es_input   = ls_input_orderprint
        ).


        ls_stream-value = _get_d12_print(
            iv_x = _get_www( iv_objid = 'ZHR_PA_D012_02_ARGUS' )
            iv_parameters = ls_input_orderprint
          ).
        ls_stream-mime_type = 'application/vnd.ms-excel'.
        /iwbep/if_mgw_conv_srv_runtime~set_header( is_header = VALUE #(
          name = 'content-disposition'
          value = 'attachment; filename=ZHR_PA_D012_02_ARGUS.xlsx'
        ) ).
      WHEN zcl_zhr_argus_mpc_ext=>gc_pdfprint.
        DATA: lv_format TYPE string.
        _get_input(
          EXPORTING
            it_key_tab = it_key_tab
          IMPORTING
            es_input   = ls_input_ref
        ).
        SELECT SINGLE * FROM zthr_argus_pdfs INTO @DATA(ls_pdf) WHERE ref_id = @ls_input_ref-refid.
        IF sy-subrc = 0.
          ls_stream-value = ls_pdf-file_src.
          ls_stream-mime_type = ls_pdf-mime_type.
          IF ls_pdf-mime_type = 'application/pdf'.
            lv_format = 'pdf'.
          ELSE.
            lv_format = 'xsb'.
          ENDIF.
          lv_filename = COND #( WHEN ls_pdf-file_name IS INITIAL THEN 'Справка' ELSE ls_pdf-file_name ).
          /iwbep/if_mgw_conv_srv_runtime~set_header( is_header = VALUE #(
            name = 'content-disposition'
            value = |attachment; filename={ cl_http_server=>escape_url( unescaped = |{ lv_filename }| ) }.{ lv_format }|
          ) ).
        ENDIF.
      WHEN OTHERS.
    ENDCASE.
    copy_data_to_ref(
      EXPORTING
        is_data = ls_stream
      CHANGING
        cr_data = er_stream
    ).
    /iwbep/if_mgw_conv_srv_runtime~set_header( is_header = VALUE #(
      name = 'Cache-Control'
      value = 'private'
    ) ).
  ENDMETHOD.


  METHOD adareaset_get_entityset.
    DATA: ls_input LIKE LINE OF et_entityset.
    _get_input(
      EXPORTING
        it_key_tab               = it_key_tab
        it_filter_select_options = it_filter_select_options
      IMPORTING
        es_input                 = ls_input
    ).
    IF ls_input-cityid IS NOT INITIAL.
      SELECT * FROM t7ruab INTO TABLE @DATA(lt_area) UP TO 20 ROWS WHERE crt01 = @ls_input-cityid.
    ELSE.
      SELECT * FROM t7ruab INTO TABLE @lt_area UP TO 20 ROWS.
    ENDIF.
    et_entityset = VALUE #( FOR ls_area IN lt_area (
      areaid = ls_area-crt02
      areatxt = ls_area-ort02
    ) ).
  ENDMETHOD.


  METHOD adcityset_get_entityset.
    DATA: ls_input LIKE LINE OF et_entityset.
    _get_input(
      EXPORTING
        it_key_tab               = it_key_tab
        it_filter_select_options = it_filter_select_options
      IMPORTING
        es_input                 = ls_input
    ).
    DATA(lv_txt) = |%{ ls_input-citytxt }%|.
    IF ls_input-regionid IS NOT INITIAL.
      SELECT * FROM t7ruaa INTO TABLE @DATA(lt_city)
        UP TO 20 ROWS WHERE state = @ls_input-regionid
        AND ort01 LIKE @lv_txt.
    ELSE.
      SELECT * FROM t7ruaa INTO TABLE @lt_city UP TO 20 ROWS
        WHERE ort01 LIKE @lv_txt.
    ENDIF.
    et_entityset = VALUE #( FOR ls_city IN lt_city (
      cityid = ls_city-crt01
      citytxt = ls_city-ort01
    ) ).
  ENDMETHOD.


  METHOD addfamilyset_create_entity.
    DATA: lt_key_tab   TYPE /iwbep/t_mgw_name_value_pair,
          lv_birthdate TYPE datum.

    TRY.
        io_data_provider->read_entry_data(
          IMPORTING
            es_data = er_entity
        ).
      CATCH /iwbep/cx_mgw_tech_exception.
    ENDTRY.

    APPEND INITIAL LINE TO lt_key_tab ASSIGNING FIELD-SYMBOL(<ls_key>).
    <ls_key>-name = 'refId'.
    <ls_key>-value = er_entity-refid.

    refpersonalset_get_entity(
      EXPORTING
      iv_entity_name               = VALUE #( )
      iv_entity_set_name           = VALUE #( )
      iv_source_name               = VALUE #( )
      it_key_tab                   = lt_key_tab
      it_navigation_path           = VALUE #( )    " table of navigation paths
      IMPORTING
      er_entity                    = DATA(ls_personal)
      ).

    lv_birthdate = |{ ls_personal-personal-dateofbirth+6(4) }{ ls_personal-personal-dateofbirth+3(2) }{ ls_personal-personal-dateofbirth(2) }|.
    DATA(ls_0021) = VALUE p0021(
    infty = '0021'
    pernr = er_entity-fio
    begda = sy-datum
    endda = hr_high_date
    famsa = er_entity-typefam
    subty = er_entity-typefam
    fanam = ls_personal-personal-lastname
    favor = ls_personal-personal-firstname
    fnac2 = ls_personal-personal-patronymic
    fgbdt = lv_birthdate
    fgbot = ls_personal-personal-placeofbirth
    finit = |{ ls_personal-personal-firstname(1) }.{ ls_personal-personal-patronymic(1) }.|
    fasex = er_entity-gender
    ).

    DATA(ls_return) = VALUE bapireturn1( ).
    CALL FUNCTION 'HR_EMPLOYEE_ENQUEUE'
      EXPORTING
        number = CONV pernr_d( er_entity-fio ).

    CALL FUNCTION 'HR_INFOTYPE_OPERATION'
      EXPORTING
        infty         = '0021'
        number        = CONV pernr_d( er_entity-fio )
        validityend   = ls_0021-endda
        validitybegin = ls_0021-begda
        record        = ls_0021
        operation     = 'INS'
      IMPORTING
        return        = ls_return.
    IF ls_return-type = 'E'.
      RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception
        EXPORTING
          textid = VALUE #(
            msgid = ls_return-id
            msgno = ls_return-number
            attr1 = ls_return-message_v1
            attr2 = ls_return-message_v2
            attr3 = ls_return-message_v3
            attr4 = ls_return-message_v4
          ).
    ENDIF.
    CALL FUNCTION 'HR_EMPLOYEE_DEQUEUE'
      EXPORTING
        number = CONV pernr_d( er_entity-fio ).
  ENDMETHOD.


  METHOD addressset_get_entity.
    _get_input(
      EXPORTING
        it_key_tab               = it_key_tab
      IMPORTING
        es_input                 = er_entity
    ).
    SET LOCALE LANGUAGE 'R'.
    IF er_entity-pernr <> 'new'.
      SELECT * FROM pa0006 INTO TABLE @DATA(lt_0006) WHERE pernr = @er_entity-pernr.
    ENDIF.
    LOOP AT lt_0006 ASSIGNING FIELD-SYMBOL(<ls_0006>).
      CASE <ls_0006>-subty.
        WHEN 1.
          er_entity-registration = VALUE #(
            country = <ls_0006>-land1
            city = <ls_0006>-ort01
            region = cl_hr_t005u=>read( land1 = <ls_0006>-land1 bland = <ls_0006>-state )-bezei
            street = <ls_0006>-stras
            house = <ls_0006>-hsnmr
            building = <ls_0006>-bldng
            apt = <ls_0006>-posta
            index = <ls_0006>-pstlz
          ).
        WHEN 2.
          er_entity-leaving = VALUE #(
            country = <ls_0006>-land1
            city = <ls_0006>-ort01
            region = cl_hr_t005u=>read( land1 = <ls_0006>-land1 bland = <ls_0006>-state )-bezei
            street = <ls_0006>-stras
            house = <ls_0006>-hsnmr
            building = <ls_0006>-bldng
            apt = <ls_0006>-posta
            index = <ls_0006>-pstlz
          ).
      ENDCASE.
    ENDLOOP.
    IF er_entity-leaving IS INITIAL OR er_entity-leaving = er_entity-registration.
      er_entity-match = abap_true.
    ENDIF.
  ENDMETHOD.


  METHOD addressset_update_entity.
    io_data_provider->read_entry_data(
      IMPORTING
        es_data                      = er_entity
    ).
    SELECT * FROM pa0006 INTO TABLE @DATA(lt_0006) WHERE pernr = @er_entity-pernr.
    IF er_entity-match = abap_true.
      er_entity-leaving = er_entity-registration.
    ENDIF.
* registration
    SELECT * FROM t005u INTO TABLE @DATA(lt_regio).
    IF er_entity-registration IS NOT INITIAL.
      DATA(lv_state) = VALUE pstring( lt_regio[ bezei = er_entity-registration-region ]-bland OPTIONAL ).
      IF lv_state IS INITIAL.
        SPLIT er_entity-registration-region AT space INTO DATA(lv_st_pref) DATA(lv_dummy).
        LOOP AT lt_regio ASSIGNING FIELD-SYMBOL(<ls_regio>) WHERE bezei CS lv_st_pref.
          lv_state = <ls_regio>-bland.
        ENDLOOP.
      ENDIF.
      TRY.
          DATA(ls_0006) = lt_0006[ anssa = '1' ].
          UPDATE pa0006 SET
              land1 = er_entity-registration-country
              ort01 = er_entity-registration-city
              state = lv_state
              stras = er_entity-registration-street
              hsnmr = er_entity-registration-house
              bldng = er_entity-registration-building
              posta = er_entity-registration-apt
              pstlz = er_entity-registration-index
            WHERE pernr = ls_0006-pernr
            AND subty = ls_0006-subty
            AND begda = ls_0006-begda
            AND endda = ls_0006-endda.
        CATCH cx_sy_itab_line_not_found.
          _insert_0006(
              iv_pernr  = CONV #( er_entity-pernr )
              iv_subty  = '1'
              is_entity = er_entity-registration
          ).
      ENDTRY.
    ENDIF.
* living
    IF er_entity-leaving IS NOT INITIAL.
      lv_state = VALUE pstring( lt_regio[ bezei = er_entity-leaving-region ]-bland OPTIONAL ).
      IF lv_state IS INITIAL.
        SPLIT er_entity-leaving-region AT space INTO lv_st_pref lv_dummy.
        LOOP AT lt_regio ASSIGNING <ls_regio> WHERE bezei CS lv_st_pref.
          lv_state = <ls_regio>-bland.
        ENDLOOP.
      ENDIF.
      TRY.
          ls_0006 = lt_0006[ anssa = '2' ].
          UPDATE pa0006 SET
              land1 = er_entity-leaving-country
              ort01 = er_entity-leaving-city
              state = lv_state
              stras = er_entity-leaving-street
              hsnmr = er_entity-leaving-house
              bldng = er_entity-leaving-building
              posta = er_entity-leaving-apt
              pstlz = er_entity-leaving-index
            WHERE pernr = ls_0006-pernr
            AND subty = ls_0006-subty
            AND begda = ls_0006-begda
            AND endda = ls_0006-endda.
        CATCH cx_sy_itab_line_not_found.
          _insert_0006(
              iv_pernr  = CONV #( er_entity-pernr )
              iv_subty  = '2'
              is_entity = er_entity-leaving
          ).
      ENDTRY.
    ENDIF.
  ENDMETHOD.


  METHOD adhouseset_get_entityset.
*  DATA: ls_input LIKE LINE OF et_entityset,
*        lr_city  TYPE RANGE OF t7ruad-crt01,
*        lr_area  TYPE RANGE OF t7ruad-crt02.
*  _get_input(
*    EXPORTING
*      it_key_tab               = it_key_tab
*      it_filter_select_options = it_filter_select_options
*    IMPORTING
*      es_input                 = ls_input
*  ).
*  IF ls_input-cityid IS NOT INITIAL.
*    lr_city = VALUE #( ( sign = 'I' option = 'EQ' low = ls_input-cityid ) ).
*  ENDIF.
*  IF ls_input-areaid IS NOT INITIAL.
*    lr_area = VALUE #( ( sign = 'I' option = 'EQ' low = ls_input-areaid ) ).
*  ENDIF.
*  SELECT * FROM t7ruad INTO TABLE @DATA(lt_street)
*    WHERE crt01 IN @lr_city
*    AND crt02 IN @lr_area.
*  et_entityset = VALUE #( FOR ls_street IN lt_street (
*    streetid = ls_street-crt03
*    streettxt = ls_street-stras
*  ) ).
  ENDMETHOD.


  METHOD adregionset_get_entityset.
    SET LOCALE LANGUAGE 'R'.
    SELECT * FROM t005u INTO TABLE @DATA(lt_005) WHERE spras = @sy-langu.
    et_entityset = VALUE #( FOR ls_005 IN lt_005 (
      regionid = ls_005-bland
      regiontxt = ls_005-bezei
    ) ).
  ENDMETHOD.


  METHOD adstreetset_get_entityset.
    DATA: ls_input LIKE LINE OF et_entityset,
          lr_city  TYPE RANGE OF t7ruad-crt01,
          lr_area  TYPE RANGE OF t7ruad-crt02.
    _get_input(
      EXPORTING
        it_key_tab               = it_key_tab
        it_filter_select_options = it_filter_select_options
      IMPORTING
        es_input                 = ls_input
    ).
    DATA(lv_txt) = |%{ ls_input-streettxt }%|.
    IF ls_input-cityid IS NOT INITIAL.
      lr_city = VALUE #( ( sign = 'I' option = 'EQ' low = ls_input-cityid ) ).
      IF strlen( ls_input-cityid ) > 3.
        lr_city = VALUE #( ( sign = 'I' option = 'EQ' low = ls_input-cityid(3) ) ).
      ENDIF.
    ENDIF.
    IF ls_input-areaid IS NOT INITIAL.
      lr_area = VALUE #( ( sign = 'I' option = 'EQ' low = ls_input-areaid ) ).
    ENDIF.
    SELECT * FROM t7ruad
      INTO TABLE @DATA(lt_street)
      UP TO 20 ROWS
      WHERE crt01 IN @lr_city
      AND crt02 IN @lr_area
      AND stras LIKE @lv_txt.
    et_entityset = VALUE #( FOR ls_street IN lt_street (
      streetid = ls_street-crt03
      streettxt = ls_street-stras
    ) ).
  ENDMETHOD.


METHOD analyticdetailse_get_entity.
  _get_input(
    EXPORTING
      it_key_tab = it_key_tab
    IMPORTING
      es_input   = er_entity
  ).
  DATA(lo_ref) = NEW zcl_argus_ref( iv_ref_id = CONV #( er_entity-refid ) ).
  DATA(lo_prev_ref) = lo_ref->get_prev_ref( ).
  DATA(lo_analytic) = NEW zcl_argus_ref_analytic(
      io_ref      = lo_ref
      io_ref_prev = lo_prev_ref
  ).
  er_entity-indicator = VALUE #(
    personal = lo_analytic->get_personal( )
    income = lo_analytic->get_income( )
    expense = lo_analytic->get_expense( )
    transport = lo_analytic->get_transport( )
    realty = lo_analytic->get_realty( )
    bank = lo_analytic->get_bank( )
    stock = lo_analytic->get_stock( )
    obligation = lo_analytic->get_obligation( )
    company = lo_analytic->get_company( )
    credit = lo_analytic->get_company( )
    deal = lo_analytic->get_deal( )
  ).
ENDMETHOD.


  METHOD analyticset_get_entity.
    _get_input(
      EXPORTING
        it_key_tab               = it_key_tab
      IMPORTING
        es_input                 = er_entity
    ).
  ENDMETHOD.


  METHOD analyticset_get_entityset.
    DATA: lt_ref TYPE TABLE OF zcl_zhr_argus_mpc_ext=>ts_ref.
    DATA: ls_refid   TYPE                   /iwbep/s_mgw_select_option,
          lt_filters TYPE                   /iwbep/t_mgw_select_option.
    DATA:  lv_role_ggs TYPE boole_d,
           lv_role_gd  TYPE boole_d,
           lv_role_ms  TYPE boole_d.

    lt_filters = io_tech_request_context->get_filter( )->get_filter_select_options( ).

    READ TABLE lt_filters WITH TABLE KEY property = 'REFID' INTO ls_refid.
    IF sy-subrc EQ 0.
      READ TABLE ls_refid-select_options INTO DATA(ls_refid_opt) INDEX 1.
    ENDIF.

    _get_roles( EXPORTING io_tech_request_context = io_tech_request_context
                 IMPORTING ev_role_gd = lv_role_gd
                          ev_role_ggs = lv_role_ggs
                           ev_role_ms = lv_role_ms ).
    IF ls_refid_opt IS INITIAL.
*      SELECT * FROM zthr_argus_base0 INTO TABLE @DATA(lt_base) WHERE status = @zcl_argus_ref=>gs_status-approved.
      SELECT base~*   " Сразу Исключим всех членов семьи
      FROM zthr_argus_base0 AS base
      INNER JOIN zthr_argus_pers0 AS pers
         ON pers~docid = base~docid
        AND pers~idfam = '' "IS NULL"INITIAL
      WHERE base~status = @zcl_argus_ref=>gs_status-approved
      INTO TABLE @DATA(lt_base).
      IF 1 = 2.
        SELECT * FROM zthr_argus_base0 INTO TABLE @lt_base WHERE status = @zcl_argus_ref=>gs_status-approved.
      ENDIF.
      LOOP AT lt_base ASSIGNING FIELD-SYMBOL(<ls_base>).
        DATA(lo_ref) = NEW zcl_argus_ref( CONV #( <ls_base>-docid ) ).
        INSERT INITIAL LINE INTO TABLE lt_ref ASSIGNING FIELD-SYMBOL(<ls_ref>).
        <ls_ref>-refid = <ls_base>-docid.
        <ls_ref>-user = VALUE #(
          pernr = lo_ref->gs_pers0-pernr
          name = |{ lo_ref->gs_pers0-nachn } { lo_ref->gs_pers0-vorna } { lo_ref->gs_pers0-midnm }|
          position = lo_ref->gs_work0-posit
          oiv = lo_ref->gs_work0-name1
        ).
        <ls_ref>-year = <ls_base>-begda(4).
        <ls_ref>-ispaper = <ls_base>-spaper.
        <ls_ref>-iselectro = <ls_base>-sdigit.
        <ls_ref>-helpcriterion = <ls_ref>-type = SWITCH #( <ls_base>-stype WHEN 'U' THEN 'Уточняющая' ELSE 'Основная' ).
        <ls_ref>-hassub = lo_ref->has_sub_ref( ).
        <ls_ref>-relcount = VALUE #( ).
      ENDLOOP.
    ELSE.

      SELECT  base~docid,
              base~begda,
              base~spaper,
              base~sdigit,
              base~stype,
              pers~pernr,
              pers~nachn,
              pers~vorna,
              pers~midnm,
              work~posit,
              work~name1
        FROM zthr_argus_pers0 AS pers
        INNER JOIN zthr_argus_base0 AS base
          ON base~docid = pers~docid
        INNER JOIN zthr_argus_work0 AS work
          ON work~docid = pers~docid
        INNER JOIN zthr_argus_pers0 AS pers_pernr
          ON pers_pernr~docid = @ls_refid_opt-low
        INNER JOIN zthr_argus_base0 AS base_begda
          ON base_begda~docid = @ls_refid_opt-low
        WHERE pers~pernr = pers_pernr~pernr
          AND base~begda = base_begda~begda
          AND base~status = 'A'
        INTO TABLE @DATA(lt_all_ref).

      SORT lt_all_ref BY docid.
      DELETE ADJACENT DUPLICATES FROM lt_all_ref.

      LOOP AT lt_all_ref ASSIGNING FIELD-SYMBOL(<ls_all_ref>).
        INSERT INITIAL LINE INTO TABLE lt_ref ASSIGNING <ls_ref>.
        <ls_ref>-refid = <ls_all_ref>-docid.
        <ls_ref>-user = VALUE #(
          pernr = <ls_all_ref>-pernr
          name = |{ <ls_all_ref>-nachn } { <ls_all_ref>-vorna } { <ls_all_ref>-midnm }|
          position = <ls_all_ref>-posit
          oiv = <ls_all_ref>-name1
        ).
        <ls_ref>-year = <ls_all_ref>-begda(4).
        <ls_ref>-ispaper = <ls_all_ref>-spaper.
        <ls_ref>-iselectro = <ls_all_ref>-sdigit.
        <ls_ref>-helpcriterion = <ls_ref>-type = SWITCH #( <ls_all_ref>-stype WHEN 'U' THEN 'Уточняющая' ELSE 'Основная' ).
*        <ls_ref>-hassub = lo_ref->has_sub_ref( ).
        <ls_ref>-relcount = VALUE #( ).
      ENDLOOP.
    ENDIF.
    LOOP AT lt_ref ASSIGNING <ls_ref>.
***
      CALL METHOD zcl_hr_data=>get_plans
        EXPORTING
          i_pernr = CONV pernr_d( <ls_ref>-user-pernr )
          i_begda = sy-datum
        IMPORTING
          e_plans = DATA(lv_plans)
          e_werks = DATA(lv_werks).
      DATA(lv_p1) = VALUE char1( ).
      zcl_hr_data=>get_plans_param(
        EXPORTING
          i_plans  = lv_plans
        IMPORTING
          e_param1 = lv_p1
      ).
*      IF lv_werks NE gc_werks_zz01 AND lv_werks NE gc_werks_168.
      CHECK ( lv_p1 = '1' AND lv_role_gd = abap_true )
         OR ( lv_p1 = '2' AND lv_role_ggs EQ abap_true )
         OR ( ( lv_p1 = '3' OR lv_werks = gc_werks_zz01 OR lv_werks = gc_werks_168 ) AND lv_role_ms = abap_true ).
*           OR ( lv_p1 = '3' AND lv_role_ms = abap_true ).

*      ENDIF.
      INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
      lo_ref = NEW zcl_argus_ref( iv_ref_id = CONV #( <ls_ref>-refid ) ).
      DATA(lo_prev_ref) = lo_ref->get_prev_ref( ).
      <ls_ent>-refid = <ls_ref>-refid.
      <ls_ent>-user = <ls_ref>-user.
      <ls_ent>-year = <ls_ref>-year.
      <ls_ent>-type = <ls_ref>-type.
      lo_ref->get_applicant(
        IMPORTING
          ev_ename = <ls_ent>-applicant
      ).
      IF lo_ref->gs_pers0-idfam IS NOT INITIAL.
        <ls_ent>-relation = cl_hr_t591s=>read( infty = '0021' subty = CONV #( lo_ref->gs_pers0-idfam+16(2) ) )-stext.
      ENDIF.
      IF lo_prev_ref IS NOT BOUND.
        <ls_ent>-indicator = VALUE #(
          personal = VALUE #( plus = abap_true )
          income = COND #( WHEN lo_ref->gt_incm0 IS NOT INITIAL THEN VALUE #( plus = abap_true ) )
          expense = COND #( WHEN lo_ref->gt_expn0 IS NOT INITIAL THEN VALUE #( plus = abap_true ) )
          transport = COND #( WHEN lo_ref->gt_tran0 IS NOT INITIAL THEN VALUE #( plus = abap_true ) )
          realty = COND #( WHEN lo_ref->gt_bldn0 IS NOT INITIAL THEN VALUE #( plus = abap_true ) )
          bank = COND #( WHEN lo_ref->gt_bank0 IS NOT INITIAL THEN VALUE #( plus = abap_true ) )
          stock = COND #( WHEN lo_ref->gt_osec0 IS NOT INITIAL THEN VALUE #( plus = abap_true ) )
          obligation = COND #( WHEN lo_ref->gt_obli0 IS NOT INITIAL THEN VALUE #( plus = abap_true ) )
          company = COND #( WHEN lo_ref->gt_secu0 IS NOT INITIAL THEN VALUE #( plus = abap_true ) )
          credit = COND #( WHEN lo_ref->gt_urge0 IS NOT INITIAL THEN VALUE #( plus = abap_true ) )
          deal = COND #( WHEN lo_ref->gt_gift0 IS NOT INITIAL THEN VALUE #( plus = abap_true ) )
        ).
      ELSE.
        <ls_ent>-indicator = VALUE #(
          personal = COND #(
            WHEN lo_ref->gs_pers0 <> lo_prev_ref->gs_pers0 THEN VALUE #( warning = abap_true )
          )
          income = COND #(
            WHEN lo_ref->gt_incm0 IS NOT INITIAL AND lo_prev_ref->gt_incm0 IS INITIAL THEN VALUE #( plus = abap_true )
            WHEN lo_ref->gt_incm0 IS INITIAL AND lo_prev_ref->gt_incm0 IS NOT INITIAL THEN VALUE #( error = abap_true )
            WHEN lo_ref->gt_incm0 <> lo_prev_ref->gt_incm0 THEN VALUE #( warning = abap_true )
          )
          expense = COND #(
            WHEN lo_ref->gt_expn0 IS NOT INITIAL AND lo_prev_ref->gt_expn0 IS INITIAL THEN VALUE #( plus = abap_true )
            WHEN lo_ref->gt_expn0 IS INITIAL AND lo_prev_ref->gt_expn0 IS NOT INITIAL THEN VALUE #( error = abap_true )
            WHEN lo_ref->gt_expn0 <> lo_prev_ref->gt_expn0 THEN VALUE #( warning = abap_true )
          )
          transport = COND #(
            WHEN lo_ref->gt_tran0 IS NOT INITIAL AND lo_prev_ref->gt_tran0 IS INITIAL THEN VALUE #( plus = abap_true )
            WHEN lo_ref->gt_tran0 IS INITIAL AND lo_prev_ref->gt_tran0 IS NOT INITIAL THEN VALUE #( error = abap_true )
            WHEN lo_ref->gt_tran0 <> lo_prev_ref->gt_tran0 THEN VALUE #( warning = abap_true )
          )
          realty = COND #(
            WHEN lo_ref->gt_bldn0 IS NOT INITIAL AND lo_prev_ref->gt_bldn0 IS INITIAL THEN VALUE #( plus = abap_true )
            WHEN lo_ref->gt_bldn0 IS INITIAL AND lo_prev_ref->gt_bldn0 IS NOT INITIAL THEN VALUE #( error = abap_true )
            WHEN lo_ref->gt_bldn0 <> lo_prev_ref->gt_bldn0 THEN VALUE #( warning = abap_true )
          )
          bank = COND #(
            WHEN lo_ref->gt_bank0 IS NOT INITIAL AND lo_prev_ref->gt_bank0 IS INITIAL THEN VALUE #( plus = abap_true )
            WHEN lo_ref->gt_bank0 IS INITIAL AND lo_prev_ref->gt_bank0 IS NOT INITIAL THEN VALUE #( error = abap_true )
            WHEN lo_ref->gt_bank0 <> lo_prev_ref->gt_bank0 THEN VALUE #( warning = abap_true )
          )
          stock = COND #(
            WHEN lo_ref->gt_osec0 IS NOT INITIAL AND lo_prev_ref->gt_osec0 IS INITIAL THEN VALUE #( plus = abap_true )
            WHEN lo_ref->gt_osec0 IS INITIAL AND lo_prev_ref->gt_osec0 IS NOT INITIAL THEN VALUE #( error = abap_true )
            WHEN lo_ref->gt_osec0 <> lo_prev_ref->gt_osec0 THEN VALUE #( warning = abap_true )
          )
          obligation = COND #(
            WHEN lo_ref->gt_obli0 IS NOT INITIAL AND lo_prev_ref->gt_obli0 IS INITIAL THEN VALUE #( plus = abap_true )
            WHEN lo_ref->gt_obli0 IS INITIAL AND lo_prev_ref->gt_obli0 IS NOT INITIAL THEN VALUE #( error = abap_true )
            WHEN lo_ref->gt_obli0 <> lo_prev_ref->gt_obli0 THEN VALUE #( warning = abap_true )
          )
          company = COND #(
            WHEN lo_ref->gt_secu0 IS NOT INITIAL AND lo_prev_ref->gt_secu0 IS INITIAL THEN VALUE #( plus = abap_true )
            WHEN lo_ref->gt_secu0 IS INITIAL AND lo_prev_ref->gt_secu0 IS NOT INITIAL THEN VALUE #( error = abap_true )
            WHEN lo_ref->gt_secu0 <> lo_prev_ref->gt_secu0 THEN VALUE #( warning = abap_true )
          )
          credit = COND #(
            WHEN lo_ref->gt_urge0 IS NOT INITIAL AND lo_prev_ref->gt_urge0 IS INITIAL THEN VALUE #( plus = abap_true )
            WHEN lo_ref->gt_urge0 IS INITIAL AND lo_prev_ref->gt_urge0 IS NOT INITIAL THEN VALUE #( error = abap_true )
            WHEN lo_ref->gt_urge0 <> lo_prev_ref->gt_urge0 THEN VALUE #( warning = abap_true )
          )
          deal = COND #(
            WHEN lo_ref->gt_gift0 IS NOT INITIAL AND lo_prev_ref->gt_gift0 IS INITIAL THEN VALUE #( plus = abap_true )
            WHEN lo_ref->gt_gift0 IS INITIAL AND lo_prev_ref->gt_gift0 IS NOT INITIAL THEN VALUE #( error = abap_true )
            WHEN lo_ref->gt_gift0 <> lo_prev_ref->gt_gift0 THEN VALUE #( warning = abap_true )
          )
        ).
      ENDIF.
    ENDLOOP.
    SORT et_entityset BY user-pernr year relation. "helpcriterion
    DATA(lt_bf) = et_entityset.
    CLEAR et_entityset.
    LOOP AT lt_bf ASSIGNING <ls_ent>.
      IF ls_refid_opt IS NOT INITIAL.
        CHECK <ls_ent>-relation IS NOT INITIAL. " AND <ls_ent>-user-pernr = ls_refid_opt-low.
      ELSE.
        CHECK NOT line_exists( et_entityset[ user-pernr = <ls_ent>-user-pernr year = <ls_ent>-year ] ).
        CHECK <ls_ent>-relation IS INITIAL.
*        LOOP AT lt_bf INTO DATA(ls_bff) WHERE user-pernr = <ls_ent>-user-pernr AND relation IS NOT INITIAL.
*          <ls_ent>-hassub = abap_true.
*          EXIT.
*        ENDLOOP.
*        SELECT *
*          FROM  zthr_argus_pers0
*          WHERE pernr = @<ls_ent>-user-pernr
*          INTO TABLE @DATA(lt_fam).

        SELECT pers~pernr, base~docid, base~begda, pers~idfam
            FROM zthr_argus_pers0 AS pers
            INNER JOIN zthr_argus_base0 AS base
               ON base~docid = pers~docid
*              AND pers~idfam = '' "IS NULL"INITIAL
            WHERE pers~pernr = @<ls_ent>-user-pernr
              AND base~status = @zcl_argus_ref=>gs_status-approved
            INTO TABLE @DATA(lt_fam).

        LOOP AT lt_fam TRANSPORTING NO FIELDS WHERE idfam IS NOT INITIAL AND begda(4) = <ls_ent>-year.
          <ls_ent>-hassub = abap_true.
          EXIT.
        ENDLOOP.
      ENDIF.

      INSERT <ls_ent> INTO TABLE et_entityset.
    ENDLOOP.
    SORT et_entityset BY user-name year.
  ENDMETHOD.


  METHOD categoryset_get_entityset.
    DATA lt_hrp1000 TYPE TABLE OF hrp1000.

    SELECT * FROM hrp1000 INTO TABLE lt_hrp1000
     WHERE otype = '2K'
      AND plvar = '01'.
    IF sy-subrc = 0.
      LOOP AT lt_hrp1000 INTO DATA(ls_hrp1000).
        APPEND INITIAL LINE TO et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
        <ls_ent>-category = ls_hrp1000-objid.
        <ls_ent>-categorytext = ls_hrp1000-stext.
      ENDLOOP.
    ENDIF.
  ENDMETHOD.


METHOD checkcompleteset_create_entity.
  io_data_provider->read_entry_data(
    IMPORTING
      es_data = er_entity
  ).
  SELECT SINGLE * FROM zthr_check_data INTO @DATA(ls_check) WHERE docid = @er_entity-docid.
  CHECK sy-subrc = 0.
  UPDATE zthr_check_data SET status = 'X' WHERE docid = @er_entity-docid.
ENDMETHOD.


  METHOD checkorderset_get_entityset.
    TYPES: BEGIN OF ts_line,
             f_00 TYPE text255,
             f_01 TYPE text255,
             f_02 TYPE text255,
             f_03 TYPE text255,
             f_04 TYPE text255,
             f_05 TYPE text255,
             f_06 TYPE text255,
             f_07 TYPE text255,
             f_08 TYPE text255,
             f_09 TYPE text255,
             f_10 TYPE text255,
             f_11 TYPE text255,
             f_12 TYPE text255,
             f_13 TYPE text255,
             f_14 TYPE text255,
             f_15 TYPE text255,
             f_16 TYPE text255,
             f_17 TYPE text255,
             f_18 TYPE text255,
             f_19 TYPE text255,
           END OF ts_line.
    DATA: lt_tab TYPE TABLE OF ts_line.
    DATA: lt_filters    TYPE                   /iwbep/t_mgw_select_option,
          ls_filter     TYPE                   /iwbep/s_mgw_select_option,
          ls_begda      TYPE                   /iwbep/s_mgw_select_option,
          ls_endda      TYPE                   /iwbep/s_mgw_select_option,
          lv_check_date TYPE datum.
    DATA: lv_orgeh            TYPE orgeh,
          lv_work             TYPE boole_d,
          lv_cat              TYPE hrobjid,
          so_datum            TYPE RANGE OF datum,
          so_orgeh            TYPE RANGE OF orgeh,
          lv_nachn            TYPE nachn,
          ls_input_orderprint TYPE zcl_zhr_argus_mpc=>tt_checkorder,
          lv_soldate          TYPE datum.

    lt_filters = io_tech_request_context->get_filter( )->get_filter_select_options( ).

    READ TABLE lt_filters WITH TABLE KEY property = 'BEGDA' INTO ls_begda.
    IF sy-subrc EQ 0.
      READ TABLE ls_begda-select_options INTO DATA(ls_begda_opt) INDEX 1.
      READ TABLE lt_filters WITH TABLE KEY property = 'ENDDA' INTO ls_endda.
      IF sy-subrc EQ 0.
        READ TABLE ls_endda-select_options INTO DATA(ls_endda_opt) INDEX 1.
      ENDIF.
    ENDIF.

    READ TABLE lt_filters WITH TABLE KEY property = 'OIV' INTO ls_filter.
    IF sy-subrc EQ 0.
      READ TABLE ls_filter-select_options INTO DATA(ls_oiv) INDEX 1.
      lv_orgeh = ls_oiv-low.
      APPEND INITIAL LINE TO so_orgeh ASSIGNING FIELD-SYMBOL(<ls_orgeh>).
      <ls_orgeh>-sign = 'I'.
      <ls_orgeh>-option = 'EQ'.
      <ls_orgeh>-low = ls_oiv-low.
    ENDIF.
    READ TABLE lt_filters WITH TABLE KEY property = 'SOLUTDATE' INTO ls_filter.
    IF sy-subrc EQ 0.
      READ TABLE ls_filter-select_options INTO DATA(ls_solutdate) INDEX 1.
    ENDIF.
    READ TABLE lt_filters WITH TABLE KEY property = 'RTYPE' INTO ls_filter.
    IF sy-subrc EQ 0.
      READ TABLE ls_filter-select_options INTO DATA(ls_rtype) INDEX 1.
    ENDIF.
    READ TABLE lt_filters WITH TABLE KEY property = 'CATEGORY' INTO ls_filter.
    IF sy-subrc EQ 0.
      READ TABLE ls_filter-select_options INTO DATA(ls_category) INDEX 1.
    ENDIF.
    READ TABLE lt_filters WITH TABLE KEY property = 'PERNR' INTO ls_filter.
    IF sy-subrc EQ 0.
      READ TABLE ls_filter-select_options INTO DATA(ls_pernr) INDEX 1.
      IF sy-subrc = 0.
        SELECT SINGLE nachn FROM pa0002 INTO lv_nachn
          WHERE pernr = ls_pernr-low AND begda LE sy-datum AND endda GE sy-datum.
        IF sy-subrc = 0.
          TRANSLATE lv_nachn TO UPPER CASE.
        ENDIF.
      ENDIF.
    ENDIF.
    READ TABLE lt_filters WITH TABLE KEY property = 'IS_ALL_OIV' TRANSPORTING NO FIELDS.
    IF sy-subrc = 0.
      APPEND INITIAL LINE TO so_orgeh ASSIGNING <ls_orgeh>.
      <ls_orgeh>-sign = 'I'.
      <ls_orgeh>-option = 'EQ'.
      <ls_orgeh>-low = gc_all_oiv-oiv1.

      APPEND INITIAL LINE TO so_orgeh ASSIGNING <ls_orgeh>.
      <ls_orgeh>-sign = 'I'.
      <ls_orgeh>-option = 'EQ'.
      <ls_orgeh>-low = gc_all_oiv-oiv2.
    ENDIF.
    CHECK so_orgeh IS NOT INITIAL.
*    lv_orgeh = ls_oiv-low.
    lv_cat = ls_category-low.
    IF ls_begda-select_options IS NOT INITIAL.
      APPEND INITIAL LINE TO so_datum ASSIGNING FIELD-SYMBOL(<ls_datum>).
      <ls_datum>-sign = 'I'.
      <ls_datum>-option = 'BT'.
      <ls_datum>-low = ls_begda_opt-low.
      IF ls_endda_opt-low IS NOT INITIAL.
        <ls_datum>-high = ls_endda_opt-low.
      ELSE.
        <ls_datum>-high = hr_high_date.
      ENDIF.
    ELSE.
      APPEND INITIAL LINE TO so_datum ASSIGNING <ls_datum>.
      <ls_datum>-sign = 'I'.
      <ls_datum>-option = 'BT'.
      <ls_datum>-low = |{ sy-datum(4) }0101|.
      <ls_datum>-high = |{ sy-datum(4) }1231|.
    ENDIF.

    SUBMIT zhr_pa_d012_01 WITH p_orgeh IN so_orgeh
                          WITH p_per IN so_datum
                          WITH p_portal = abap_true
                          WITH p_nachn = lv_nachn
                          WITH p_2kobj = lv_cat
                          AND RETURN.
    IMPORT mt_tab TO lt_tab FROM MEMORY ID zcl_zhr_argus_dpc_ext=>gc_report_memo.
    FREE MEMORY ID zcl_zhr_argus_dpc_ext=>gc_report_memo.
    CHECK lt_tab IS NOT INITIAL.

    SELECT * FROM zthr_rtypet INTO TABLE @DATA(lt_rtypes).

    LOOP AT lt_tab INTO DATA(ls_tab).
      IF ls_solutdate IS NOT INITIAL.
        lv_soldate = |{ ls_tab-f_09+6(4) }{ ls_tab-f_09+3(2) }{ ls_tab-f_09(2) }|.
        CHECK lv_soldate = ls_solutdate-low.
      ENDIF.
      IF ls_rtype IS NOT INITIAL.
        CHECK ls_rtype-low = ls_tab-f_12+1(2).
      ENDIF.
      INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
      <ls_ent>-date = ls_tab-f_02.
      <ls_ent>-number = ls_tab-f_03.
      <ls_ent>-fio = ls_tab-f_05.
      <ls_ent>-oiv = ls_tab-f_06.
      <ls_ent>-result = ls_tab-f_07.
      <ls_ent>-category = lv_cat.
      <ls_ent>-solutdate = ls_tab-f_09.
      READ TABLE lt_rtypes INTO DATA(ls_rtypet) WITH KEY rtype = ls_tab-f_12+1(2).
      IF sy-subrc = 0.
        <ls_ent>-rtype = ls_rtypet-stext.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.


METHOD checkprolongates_create_entity.
  io_data_provider->read_entry_data(
    IMPORTING
      es_data = er_entity
  ).
  SELECT SINGLE * FROM zthr_check_data INTO @DATA(ls_check) WHERE docid = @er_entity-docid.
  CHECK sy-subrc = 0.
  ls_check-enddate = ls_check-startdate + 90.
  UPDATE zthr_check_data SET enddate = ls_check-enddate WHERE docid = er_entity-docid.
ENDMETHOD.


  METHOD checkset_create_entity.
    DATA: lt_new_data TYPE TABLE OF zthr_check_data,
          lt_file     TYPE TABLE OF zthr_check_file.
    TRY.
        io_data_provider->read_entry_data(
          IMPORTING
            es_data = er_entity
        ).
      CATCH /iwbep/cx_mgw_tech_exception.
    ENDTRY.
    APPEND INITIAL LINE TO lt_new_data ASSIGNING FIELD-SYMBOL(<ls_nd>).
    IF er_entity-docid IS NOT INITIAL.
      DELETE FROM zthr_check_data WHERE docid = @er_entity-docid.
      <ls_nd>-docid = er_entity-docid.
    ELSE.
      er_entity-docid = <ls_nd>-docid = cl_system_uuid=>create_uuid_c32_static( ).
    ENDIF.
    <ls_nd>-controller = er_entity-controller.
    <ls_nd>-subject = er_entity-subject.
    <ls_nd>-rtype = er_entity-rtype.
*    <ls_nd>-orgaddr = er_entity-orgaddr.
    <ls_nd>-existapp = er_entity-existapp.
    <ls_nd>-commission = er_entity-commission.
    <ls_nd>-app = er_entity-app.
    IF strlen( er_entity-appdt2 ) >= 10.
      <ls_nd>-appdt2 = |{ er_entity-appdt2+6(4) }{ er_entity-appdt2+3(2) }{ er_entity-appdt2+0(2) }|.
    ENDIF.
    <ls_nd>-existord = er_entity-existord.
    IF strlen( er_entity-orderdt ) >= 10.
      <ls_nd>-orderdt = |{ er_entity-orderdt+6(4) }{ er_entity-orderdt+3(2) }{ er_entity-orderdt+0(2) }|.
      <ls_nd>-rasnu = er_entity-rasnu.
    ENDIF.
    IF strlen( er_entity-startdate ) >= 10.
      <ls_nd>-startdate = |{ er_entity-startdate+6(4) }{ er_entity-startdate+3(2) }{ er_entity-startdate+0(2) }|.
    ENDIF.
    IF strlen( er_entity-enddate ) >= 10.
      <ls_nd>-enddate = |{ er_entity-enddate+6(4) }{ er_entity-enddate+3(2) }{ er_entity-enddate+0(2) }|.
    ENDIF.
    <ls_nd>-basis = er_entity-basis.
    IF er_entity-status <> 'X'.
      <ls_nd>-status = 'W'.
      IF er_entity-reportfnamesrc IS NOT INITIAL AND er_entity-protocolfnamesrc IS INITIAL.
        <ls_nd>-status = 'R'.
      ENDIF.
      IF er_entity-protocolfnamesrc IS NOT INITIAL AND er_entity-endorderfnamesrc IS INITIAL.
        <ls_nd>-status = 'P'.
      ENDIF.
      IF er_entity-endorderfnamesrc IS NOT INITIAL.
        <ls_nd>-status = 'O'.
      ENDIF.
    ENDIF.
    <ls_nd>-recov = er_entity-recov.
    <ls_nd>-solut = er_entity-solut.
    <ls_nd>-addinfo = er_entity-addinfo.
    <ls_nd>-createdate = sy-datum.
    <ls_nd>-mailsent = er_entity-mailsent.
    INSERT zthr_check_data FROM TABLE lt_new_data.
    COMMIT WORK.
*   files
    IF er_entity-ordersrc IS NOT INITIAL.
      INSERT VALUE #( docid = er_entity-docid type = 1 name = er_entity-order src = er_entity-ordersrc ) INTO TABLE lt_file.
    ENDIF.
    IF er_entity-reportfnamesrc IS NOT INITIAL.
      INSERT VALUE #( docid = er_entity-docid type = 2 name = er_entity-reportfname src = er_entity-reportfnamesrc ) INTO TABLE lt_file.
    ENDIF.
    IF er_entity-protocolfnamesrc IS NOT INITIAL.
      INSERT VALUE #( docid = er_entity-docid type = 3 name = er_entity-protocolfname src = er_entity-protocolfnamesrc ) INTO TABLE lt_file.
    ENDIF.
    IF er_entity-endorderfnamesrc IS NOT INITIAL.
      INSERT VALUE #( docid = er_entity-docid type = 4 name = er_entity-endorderfname src = er_entity-endorderfnamesrc ) INTO TABLE lt_file.
    ENDIF.
    IF er_entity-reportsrc IS NOT INITIAL.
      INSERT VALUE #( docid = er_entity-docid type = 5 name = er_entity-report src = er_entity-reportsrc ) INTO TABLE lt_file.
    ENDIF.
    IF er_entity-colettersrc IS NOT INITIAL.
      INSERT VALUE #( docid = er_entity-docid type = 6 name = er_entity-coletter src = er_entity-colettersrc ) INTO TABLE lt_file.
    ENDIF.
    IF er_entity-sentnotificationsrc IS NOT INITIAL.
      INSERT VALUE #( docid = er_entity-docid type = 7 name = er_entity-sentnotification src = er_entity-sentnotificationsrc ) INTO TABLE lt_file.
    ENDIF.
    IF er_entity-prepreportanalysisinfosrc IS NOT INITIAL.
      INSERT VALUE #( docid = er_entity-docid type = 9 name = er_entity-prepreportanalysisinfo src = er_entity-prepreportanalysisinfosrc ) INTO TABLE lt_file.
    ENDIF.
    MODIFY zthr_check_file FROM TABLE lt_file.

*    >>>Шаталов Б.А. Создание ИТ 9002 после сохранения проверки 19.01.2022
    DATA: lt_9002  TYPE TABLE OF p9002,
          lv_actio TYPE pspar-actio VALUE 'INS'.
    IF <ls_nd>-orderdt IS INITIAL.
      <ls_nd>-orderdt = sy-datum.
    ENDIF.

    CHECK <ls_nd>-recov IS NOT INITIAL AND
          <ls_nd>-solut IS NOT INITIAL.

    CALL METHOD zcl_pa_utils=>read_infty
      EXPORTING
        i_pernr = CONV pernr_d( er_entity-subject )
        i_infty = '9002'
        i_begda = hr_low_date
        i_endda = hr_high_date
      IMPORTING
        e_pnnnn = lt_9002.
    READ TABLE lt_9002 WITH KEY begda = <ls_nd>-orderdt TRANSPORTING NO FIELDS.
    IF sy-subrc = 0.
      lv_actio = 'MOD'.
    ENDIF.
    DATA(ls_9002) = VALUE p9002(
    infty = '9002'
    pernr = er_entity-subject
    begda = <ls_nd>-orderdt
    endda = hr_high_date
    rtype = <ls_nd>-rtype
    rasnu = <ls_nd>-rasnu
    recov = <ls_nd>-recov
    solut = <ls_nd>-solut
  ).

    DATA(ls_return) = VALUE bapireturn1( ).
    CALL FUNCTION 'HR_EMPLOYEE_ENQUEUE'
      EXPORTING
        number = CONV pernr_d( er_entity-subject ).
    CALL FUNCTION 'HR_INFOTYPE_OPERATION'
      EXPORTING
        infty         = '9002'
        number        = CONV pernr_d( er_entity-subject )
        validityend   = ls_9002-endda
        validitybegin = ls_9002-begda
        record        = ls_9002
        operation     = lv_actio
      IMPORTING
        return        = ls_return.
    IF ls_return-type = 'E'.
      RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception
        EXPORTING
          textid = VALUE #(
            msgid = ls_return-id
            msgno = ls_return-number
            attr1 = ls_return-message_v1
            attr2 = ls_return-message_v2
            attr3 = ls_return-message_v3
            attr4 = ls_return-message_v4
          ).
    ENDIF.
    CALL FUNCTION 'HR_EMPLOYEE_DEQUEUE'
      EXPORTING
        number = CONV pernr_d( er_entity-subject ).
  ENDMETHOD.


METHOD checkset_delete_entity.

ENDMETHOD.


METHOD checkset_get_entity.
  _get_input(
    EXPORTING
      it_key_tab = it_key_tab
    IMPORTING
      es_input   = er_entity
  ).
  SELECT SINGLE * FROM zthr_check_data INTO @DATA(ls_check) WHERE docid = @er_entity-docid.
  CHECK sy-subrc = 0.
  er_entity-docid = ls_check-docid.
  er_entity-controller = ls_check-controller.
  SELECT SINGLE ename FROM pa0001 INTO er_entity-controllername WHERE pernr = ls_check-controller AND begda <= sy-datum AND endda >= sy-datum.
  er_entity-subject = ls_check-subject.
  SELECT SINGLE * FROM pa0001 INTO @DATA(ls_subject) WHERE pernr = @ls_check-subject AND begda <= @sy-datum AND endda >= @sy-datum..
  er_entity-subjectname = ls_subject-ename.
  er_entity-subjectplans = zcl_hr_data_utils=>get_name_obj_1000(
      i_objid = ls_subject-plans
      i_otype = cl_hap_pmp_const=>otype_position
  ).

  er_entity-subjectoiv = zcl_hr_data_utils=>get_last_but_one_ogreh_name_o(
                i_otype = cl_hap_pmp_const=>otype_orgunit
                i_objid = ls_subject-orgeh
                ).

  er_entity-startdate = |{ ls_check-startdate DATE = USER }|.
  er_entity-createdate = |{ ls_check-createdate DATE = USER }|.
  er_entity-enddate = |{ ls_check-enddate DATE = USER }|.
  er_entity-rtype = ls_check-rtype.
*  er_entity-orgaddr = ls_check-orgaddr.
  er_entity-existapp = ls_check-existapp.
  er_entity-commission = ls_check-commission.
  er_entity-app = ls_check-app.
  er_entity-appdt2 = |{ ls_check-appdt2 DATE = USER }|.
  er_entity-existord = ls_check-existord.
  er_entity-orderdt = |{ ls_check-orderdt DATE = USER }|.
  er_entity-rasnu = ls_check-rasnu.
  er_entity-basis = ls_check-basis.
  er_entity-status = ls_check-status.
  er_entity-recov = ls_check-recov.
  er_entity-solut = ls_check-solut.
  er_entity-addinfo = ls_check-addinfo.
  er_entity-mailsent = ls_check-mailsent.
* files
  SELECT * FROM zthr_check_file INTO TABLE @DATA(lt_file) WHERE docid = @ls_check-docid.
  LOOP AT lt_file ASSIGNING FIELD-SYMBOL(<ls_file>).
    CASE <ls_file>-type.
      WHEN 1.
        er_entity-order = <ls_file>-name.
        er_entity-ordersrc = <ls_file>-src.
      WHEN 2.
        er_entity-reportfname = <ls_file>-name.
        er_entity-reportfnamesrc = <ls_file>-src.
      WHEN 3.
        er_entity-protocolfname = <ls_file>-name.
        er_entity-protocolfnamesrc = <ls_file>-src.
      WHEN 4.
        er_entity-endorderfname = <ls_file>-name.
        er_entity-endorderfnamesrc = <ls_file>-src.
      WHEN 5.
        er_entity-report = <ls_file>-name.
        er_entity-reportsrc = <ls_file>-src.
      WHEN 6.
        er_entity-coletter = <ls_file>-name.
        er_entity-colettersrc = <ls_file>-src.
      WHEN 7.
        er_entity-sentnotification = <ls_file>-name.
        er_entity-sentnotificationsrc = <ls_file>-src.
      WHEN 9.
        er_entity-prepreportanalysisinfo = <ls_file>-name.
        er_entity-prepreportanalysisinfosrc = <ls_file>-src.
    ENDCASE.
  ENDLOOP.
ENDMETHOD.


METHOD checkset_get_entityset.
ENDMETHOD.


METHOD class_constructor.
  gr_relative_type = zcl_hrpa_tvarvc=>read_range( i_name = 'ZHR_ARGUS_RELATIVE' ).
ENDMETHOD.


  METHOD commissionset_create_entity.
    DATA: ls_9007_db TYPE p9007.
    SET LOCALE LANGUAGE 'R'.
    TRY.
        io_data_provider->read_entry_data(
          IMPORTING
            es_data                      = er_entity
        ).
      CATCH /iwbep/cx_mgw_tech_exception.
    ENDTRY.
    CHECK er_entity-pernr <> 'new'.
    CHECK sy-subrc = 0.
    DATA(lv_orddt_c) = er_entity-date.
    DATA(lv_ordnu) = er_entity-number.
    cl_reca_date=>convert_date_to_internal( EXPORTING id_date_external = lv_orddt_c IMPORTING ed_date_internal = DATA(lv_orddt) ).
    DATA(lt_base_txt) = CAST cl_abap_elemdescr( cl_abap_typedescr=>describe_by_data( p_data = ls_9007_db-massg ) )->get_ddic_fixed_values( ).
    DATA(lt_dec_txt) = CAST cl_abap_elemdescr( cl_abap_typedescr=>describe_by_data( p_data = ls_9007_db-decis ) )->get_ddic_fixed_values( ).
    IF er_entity-todo IS NOT INITIAL.
      DATA(lv_file_id) = cl_system_uuid=>create_uuid_c32_static( ).
      DATA(ls_file) = VALUE zthr_argus_file(
        file_id = lv_file_id
        file_src = er_entity-todo
      ).
      MODIFY zthr_argus_file FROM ls_file.
    ENDIF.
    DATA(ls_9007) = VALUE p9007(
      infty = '9007'
      pernr = er_entity-pernr
      begda = sy-datum
      endda = hr_high_date
      massg = VALUE #( lt_base_txt[ ddtext = er_entity-base ]-low OPTIONAL )
      decis = VALUE #( lt_dec_txt[ ddtext = er_entity-decision ]-low OPTIONAL )
      msrs = lv_file_id
      orddt = lv_orddt
      ordnu = lv_ordnu
      meetng = er_entity-meeting
    ).
    DATA(ls_return) = VALUE bapireturn1( ).
    CALL FUNCTION 'HR_EMPLOYEE_ENQUEUE'
      EXPORTING
        number = CONV pernr_d( er_entity-pernr ).
    CALL FUNCTION 'HR_INFOTYPE_OPERATION'
      EXPORTING
        infty         = '9007'
        number        = CONV pernr_d( er_entity-pernr )
        validityend   = ls_9007-begda
        validitybegin = ls_9007-endda
        record        = ls_9007
        operation     = 'INS'
      IMPORTING
        return        = ls_return.
    IF ls_return-type = 'E'.
      RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception
        EXPORTING
          textid = VALUE #(
            msgid = ls_return-id
            msgno = ls_return-number
            attr1 = ls_return-message_v1
            attr2 = ls_return-message_v2
            attr3 = ls_return-message_v3
            attr4 = ls_return-message_v4
          ).
    ENDIF.
    CALL FUNCTION 'HR_EMPLOYEE_DEQUEUE'
      EXPORTING
        number = CONV pernr_d( er_entity-pernr ).
  ENDMETHOD.


  METHOD commissionset_delete_entity.
    DATA: BEGIN OF ls_seqnr,
            begda TYPE datum,
            endda TYPE datum,
            seqnr TYPE seqnr,
          END OF ls_seqnr.
    DATA: ls_key TYPE zcl_zhr_argus_mpc=>ts_commission.
    _get_input(
      EXPORTING
        it_key_tab = it_key_tab
      IMPORTING
        es_input   = ls_key
    ).
    ls_seqnr = ls_key-seqnr.
    CHECK ls_key-pernr <> 'new'.
    SELECT SINGLE * FROM pa9007 INTO @DATA(ls_9007)
       WHERE pernr = @ls_key-pernr
      AND begda = @ls_seqnr-begda
      AND endda = @ls_seqnr-endda
      AND seqnr = @ls_seqnr-seqnr.
    CHECK sy-subrc = 0.
    DELETE pa9007 FROM ls_9007.
  ENDMETHOD.


  METHOD commissionset_get_entity.
    _get_input(
      EXPORTING
        it_key_tab               = it_key_tab
      IMPORTING
        es_input                 = er_entity
    ).
  ENDMETHOD.


  METHOD commissionset_get_entityset.
    DATA: ls_input LIKE LINE OF et_entityset,
          ls_9007  TYPE p9007.
    _get_input(
      EXPORTING
        it_key_tab               = it_key_tab
        it_filter_select_options = it_filter_select_options
      IMPORTING
        es_input                 = ls_input
    ).
    SET LOCALE LANGUAGE 'R'.
    IF ls_input-pernr <> 'new'.
      SELECT * FROM pa9007 INTO TABLE @DATA(lt_9007) WHERE pernr = @ls_input-pernr.
    ENDIF.
    DATA(lt_base_txt) = CAST cl_abap_elemdescr( cl_abap_typedescr=>describe_by_data( p_data = ls_9007-massg ) )->get_ddic_fixed_values( ).
    DATA(lt_dec_txt) = CAST cl_abap_elemdescr( cl_abap_typedescr=>describe_by_data( p_data = ls_9007-decis ) )->get_ddic_fixed_values( ).
    LOOP AT lt_9007 ASSIGNING FIELD-SYMBOL(<ls_9007>).
      INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
      <ls_ent>-pernr = ls_input-pernr.
      <ls_ent>-seqnr = |{ <ls_9007>-begda }{ <ls_9007>-endda }{ <ls_9007>-seqnr }|.
      <ls_ent>-meeting = <ls_9007>-meetng.
      <ls_ent>-date = |{ <ls_9007>-orddt DATE = USER }|.
      <ls_ent>-number = <ls_9007>-ordnu.
      <ls_ent>-datenumber = |{ <ls_9007>-orddt DATE = USER } { <ls_9007>-ordnu }|.
      <ls_ent>-base = VALUE #( lt_base_txt[ low = <ls_9007>-massg ]-ddtext OPTIONAL ).
      <ls_ent>-decision = VALUE #( lt_dec_txt[ low = <ls_9007>-decis ]-ddtext OPTIONAL ).
      IF <ls_9007>-msrs IS NOT INITIAL.
        SELECT SINGLE * FROM zthr_argus_file INTO @DATA(ls_file) WHERE file_id = @<ls_9007>-msrs.
        IF sy-subrc = 0.
          <ls_ent>-todo = ls_file-file_src.
        ENDIF.
      ENDIF.
      <ls_ent>-action = VALUE #( edit = abap_true delete = abap_true ).
    ENDLOOP.
  ENDMETHOD.


  METHOD commissionset_update_entity.
    DATA: ls_9007_db TYPE p9007.
    SET LOCALE LANGUAGE 'R'.
    DATA: BEGIN OF ls_seqnr,
            begda TYPE datum,
            endda TYPE datum,
            seqnr TYPE seqnr,
          END OF ls_seqnr.
    DATA: ls_key TYPE zcl_zhr_argus_mpc=>ts_education.
    _get_input(
      EXPORTING
        it_key_tab = it_key_tab
      IMPORTING
        es_input   = ls_key
    ).
    TRY.
        io_data_provider->read_entry_data(
          IMPORTING
            es_data = er_entity
        ).
      CATCH /iwbep/cx_mgw_tech_exception.
    ENDTRY.
    er_entity-pernr = ls_key-pernr.
    er_entity-seqnr = ls_key-seqnr.
    ls_seqnr = ls_key-seqnr.
    CHECK ls_key-pernr <> 'new'.
    SELECT SINGLE * FROM pa9007 INTO @DATA(ls_9007)
       WHERE pernr = @er_entity-pernr
      AND begda = @ls_seqnr-begda
      AND endda = @ls_seqnr-endda
      AND seqnr = @ls_seqnr-seqnr.
    CHECK sy-subrc = 0.
    DATA(lv_orddt_c) = er_entity-date.
    DATA(lv_ordnu) = er_entity-number.
    cl_reca_date=>convert_date_to_internal( EXPORTING id_date_external = lv_orddt_c IMPORTING ed_date_internal = DATA(lv_orddt) ).
    DATA(lt_base_txt) = CAST cl_abap_elemdescr( cl_abap_typedescr=>describe_by_data( p_data = ls_9007_db-massg ) )->get_ddic_fixed_values( ).
    DATA(lt_dec_txt) = CAST cl_abap_elemdescr( cl_abap_typedescr=>describe_by_data( p_data = ls_9007_db-decis ) )->get_ddic_fixed_values( ).
    DATA(lv_massg) = VALUE p9007-massg( lt_base_txt[ ddtext = er_entity-base ]-low OPTIONAL ).
    DATA(lv_decis) = VALUE p9007-decis( lt_dec_txt[ ddtext = er_entity-decision ]-low OPTIONAL ).
    IF ls_9007-msrs IS NOT INITIAL.
      DATA(lv_file_id) = ls_9007-msrs.
    ENDIF.
    IF er_entity-todo IS NOT INITIAL.
      IF lv_file_id IS INITIAL.
        lv_file_id = cl_system_uuid=>create_uuid_c32_static( ).
      ENDIF.
      DATA(ls_file) = VALUE zthr_argus_file(
        file_id = lv_file_id
        file_src = er_entity-todo
      ).
      MODIFY zthr_argus_file FROM ls_file.
    ENDIF.
    UPDATE pa9007 SET
      meetng = er_entity-meeting
      massg = lv_massg
      msrs = lv_file_id
      decis = lv_decis
      orddt = lv_orddt
      ordnu = lv_ordnu
    WHERE pernr = ls_9007-pernr
      AND begda = ls_9007-begda
      AND endda = ls_9007-endda
      AND seqnr = ls_9007-seqnr.
  ENDMETHOD.


  METHOD educationset_create_entity.
    TRY.
        io_data_provider->read_entry_data(
          IMPORTING
            es_data                      = er_entity
        ).
      CATCH /iwbep/cx_mgw_tech_exception.
    ENDTRY.
    CHECK er_entity-pernr <> 'new'.
    SELECT * FROM t517t INTO TABLE @DATA(lt_level) WHERE sprsl = @sy-langu.
    DATA(lv_slart) = VALUE #( lt_level[ stext = er_entity-level ]-slart OPTIONAL ).
    cl_reca_date=>convert_date_to_internal( EXPORTING id_date_external = er_entity-begin IMPORTING ed_date_internal = DATA(lv_begda) ).
    cl_reca_date=>convert_date_to_internal( EXPORTING id_date_external = er_entity-end IMPORTING ed_date_internal = DATA(lv_endda) ).
    DATA(ls_0022) = VALUE p0022(
      infty = '0022'
      pernr = er_entity-pernr
      begda = lv_begda
      endda = lv_endda
      zstart = lv_begda
      zend = lv_endda
      insti = er_entity-institute
      subty = lv_slart
      slart = lv_slart
      emark = lv_slart
      zzedcity = er_entity-place
    ).
    DATA(ls_return) = VALUE bapireturn1( ).
    CALL FUNCTION 'HR_EMPLOYEE_ENQUEUE'
      EXPORTING
        number = CONV pernr_d( er_entity-pernr ).
    CALL FUNCTION 'HR_INFOTYPE_OPERATION'
      EXPORTING
        infty         = '0022'
        number        = CONV pernr_d( er_entity-pernr )
        validityend   = ls_0022-begda
        validitybegin = ls_0022-endda
        record        = ls_0022
        operation     = 'INS'
      IMPORTING
        return        = ls_return.
    IF ls_return-type = 'E'.
      RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception
        EXPORTING
          textid = VALUE #(
            msgid = ls_return-id
            msgno = ls_return-number
            attr1 = ls_return-message_v1
            attr2 = ls_return-message_v2
            attr3 = ls_return-message_v3
            attr4 = ls_return-message_v4
          ).
    ENDIF.
    CALL FUNCTION 'HR_EMPLOYEE_DEQUEUE'
      EXPORTING
        number = CONV pernr_d( er_entity-pernr ).
  ENDMETHOD.


  METHOD educationset_delete_entity.
    DATA: BEGIN OF ls_seqnr,
            begda TYPE datum,
            endda TYPE datum,
            seqnr TYPE seqnr,
          END OF ls_seqnr.
    DATA: ls_key TYPE zcl_zhr_argus_mpc=>ts_education.
    _get_input(
      EXPORTING
        it_key_tab = it_key_tab
      IMPORTING
        es_input   = ls_key
    ).
    ls_seqnr = ls_key-seqnr.
    CHECK ls_key-pernr <> 'new'.
    SELECT SINGLE * FROM pa0022 INTO @DATA(ls_0022)
       WHERE pernr = @ls_key-pernr
      AND begda = @ls_seqnr-begda
      AND endda = @ls_seqnr-endda
      AND seqnr = @ls_seqnr-seqnr.
    CHECK sy-subrc = 0.
    DELETE pa0022 FROM ls_0022.
  ENDMETHOD.


  METHOD educationset_get_entity.
    _get_input(
      EXPORTING
        it_key_tab               = it_key_tab
      IMPORTING
        es_input                 = er_entity
    ).
  ENDMETHOD.


  METHOD educationset_get_entityset.
    DATA: ls_input LIKE LINE OF et_entityset.
    _get_input(
      EXPORTING
        it_key_tab               = it_key_tab
        it_filter_select_options = it_filter_select_options
      IMPORTING
        es_input                 = ls_input
    ).
    SET LOCALE LANGUAGE 'R'.
    IF ls_input-pernr <> 'new'.
      SELECT * FROM pa0022 INTO TABLE @DATA(lt_0022) WHERE pernr = @ls_input-pernr AND subty <> 'EL'.
    ENDIF.
    LOOP AT lt_0022 ASSIGNING FIELD-SYMBOL(<ls_0022>).
      INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
      <ls_ent>-pernr = ls_input-pernr.
      <ls_ent>-seqnr = |{ <ls_0022>-begda }{ <ls_0022>-endda }{ <ls_0022>-seqnr }|.
      <ls_ent>-institute = <ls_0022>-insti.
      <ls_ent>-level = cl_hr_t517t=>read(
          sprsl = sy-langu
          slart = <ls_0022>-slart
      )-stext.
      IF <ls_0022>-zstart IS NOT INITIAL.
        <ls_ent>-begin = |{ <ls_0022>-zstart DATE = USER }|.
      ELSE.
        <ls_ent>-begin = |{ <ls_0022>-begda DATE = USER }|.
      ENDIF.
      IF <ls_0022>-zend IS NOT INITIAL.
        <ls_ent>-end = |{ <ls_0022>-zend DATE = USER }|.
      ELSE.
        <ls_ent>-end = |{ <ls_0022>-zzdatdc DATE = USER }|.
      ENDIF.
      <ls_ent>-place = <ls_0022>-zzedcity.
      <ls_ent>-action = VALUE #( edit = abap_true delete = abap_true ).
    ENDLOOP.
  ENDMETHOD.


  METHOD educationset_update_entity.
    DATA: BEGIN OF ls_seqnr,
            begda TYPE datum,
            endda TYPE datum,
            seqnr TYPE seqnr,
          END OF ls_seqnr.
    DATA: ls_key TYPE zcl_zhr_argus_mpc=>ts_education.
    SET LOCALE LANGUAGE 'R'.
    _get_input(
      EXPORTING
        it_key_tab = it_key_tab
      IMPORTING
        es_input   = ls_key
    ).
    TRY.
        io_data_provider->read_entry_data(
          IMPORTING
            es_data = er_entity
        ).
      CATCH /iwbep/cx_mgw_tech_exception.
    ENDTRY.
    er_entity-pernr = ls_key-pernr.
    er_entity-seqnr = ls_key-seqnr.
    ls_seqnr = ls_key-seqnr.
    CHECK er_entity-pernr <> 'new'.
    SELECT SINGLE * FROM pa0022 INTO @DATA(ls_0022)
       WHERE pernr = @er_entity-pernr
      AND begda = @ls_seqnr-begda
      AND endda = @ls_seqnr-endda
      AND seqnr = @ls_seqnr-seqnr.
    CHECK sy-subrc = 0.
    SELECT * FROM t517t INTO TABLE @DATA(lt_level) WHERE sprsl = @sy-langu.
    cl_reca_date=>convert_date_to_internal( EXPORTING id_date_external = er_entity-begin IMPORTING ed_date_internal = DATA(lv_begda) ).
    cl_reca_date=>convert_date_to_internal( EXPORTING id_date_external = er_entity-end IMPORTING ed_date_internal = DATA(lv_endda) ).
    DATA(lv_slart) = VALUE #( lt_level[ stext = er_entity-level ]-slart OPTIONAL ).
    IF ls_seqnr-begda <> lv_begda OR ls_seqnr-endda <> lv_endda OR ls_0022-subty <> lv_slart.
      DELETE pa0022 FROM ls_0022.
      ls_0022-begda = lv_begda.
      ls_0022-endda = lv_endda.
      ls_0022-insti = er_entity-institute.
      ls_0022-subty = lv_slart.
      ls_0022-slart = lv_slart.
      ls_0022-emark = lv_slart.
      ls_0022-zstart = lv_begda.
      ls_0022-zend = lv_endda.
      ls_0022-zzedcity = er_entity-place.
      INSERT pa0022 FROM ls_0022.
    ELSE.
      UPDATE pa0022 SET
        insti = er_entity-institute
        slart = lv_slart
        emark = lv_slart
        zstart = lv_begda
        zend = lv_endda
        zzedcity = er_entity-place
      WHERE pernr = ls_0022-pernr
        AND begda = ls_0022-begda
        AND endda = ls_0022-endda
        AND seqnr = ls_0022-seqnr.
    ENDIF.
  ENDMETHOD.


METHOD edutypeset_get_entityset.
  SET LOCALE LANGUAGE 'R'.
  SELECT * FROM t517t INTO TABLE @DATA(lt_level)
    WHERE sprsl = @sy-langu.
  et_entityset = VALUE #( FOR ls_level IN lt_level ( text = ls_level-stext ) ).
ENDMETHOD.


  METHOD errorrefset_get_entityset.
    DATA: lv_role_gd  TYPE boole_d,
          lv_role_ggs TYPE boole_d,
          lv_role_ms  TYPE boole_d.

    _get_roles( EXPORTING io_tech_request_context = io_tech_request_context
                IMPORTING ev_role_gd = lv_role_gd
                         ev_role_ggs = lv_role_ggs
                          ev_role_ms = lv_role_ms ).

    SELECT * FROM zthr_argus_base0 INTO TABLE @DATA(lt_base)
      WHERE status = @zcl_argus_ref=>gs_status-error.
    LOOP AT lt_base ASSIGNING FIELD-SYMBOL(<ls_base>).
      DATA(lo_ref) = NEW zcl_argus_ref( CONV #( <ls_base>-docid ) ).

      CALL METHOD zcl_hr_data=>get_plans
        EXPORTING
          i_pernr = CONV pernr_d( lo_ref->gs_pers0-pernr )
          i_begda = sy-datum
        IMPORTING
          e_plans = DATA(lv_plans).
      DATA(lv_p1) = VALUE char1( ).
      zcl_hr_data=>get_plans_param(
        EXPORTING
          i_plans  = lv_plans
        IMPORTING
          e_param1 = lv_p1
      ).

      IF lv_p1 IS NOT INITIAL.
        CHECK ( lv_p1 = '1' AND lv_role_gd = abap_true )
           OR ( lv_p1 = '2' AND lv_role_ggs EQ abap_true )
           OR ( lv_p1 = '3' AND lv_role_ms = abap_true ).
      ENDIF.

      INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
      <ls_ent>-refid = <ls_base>-docid.
      <ls_ent>-user = VALUE #(
        pernr = lo_ref->gs_pers0-pernr
        name = |{ lo_ref->gs_pers0-nachn } { lo_ref->gs_pers0-vorna } { lo_ref->gs_pers0-midnm }|
        position = lo_ref->gs_work0-posit
        oiv = lo_ref->gs_work0-name1
      ).
      <ls_ent>-year = <ls_base>-begda(4).
      <ls_ent>-ispaper = <ls_base>-spaper.
      <ls_ent>-iselectro = <ls_base>-sdigit.
      <ls_ent>-helpcriterion = <ls_ent>-type = SWITCH #( <ls_base>-stype WHEN 'U' THEN 'Уточняющая' ELSE 'Основная' ).
      <ls_ent>-hassub = abap_false.
      <ls_ent>-relcount = VALUE #( ).
      <ls_ent>-dateofprint = |{ <ls_base>-ordst DATE = USER }|.
      <ls_ent>-dateofupload = |{ <ls_base>-aedtm DATE = USER }|.
      IF lo_ref->gs_pers0-idfam IS NOT INITIAL.
        <ls_ent>-relation = cl_hr_t591s=>read( infty = '0021' subty = CONV #( lo_ref->gs_pers0-idfam+16(2) ) )-stext.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.


  METHOD famsaset_get_entityset.
    DATA: lt_t591a TYPE TABLE OF t591a,
          lt_t591s TYPE TABLE OF t591s,
          lr_subty TYPE RANGE OF subty.
    APPEND INITIAL LINE TO lr_subty ASSIGNING FIELD-SYMBOL(<ls_subty>).
    <ls_subty>-sign = 'I'.
    <ls_subty>-option = 'BT'.
    <ls_subty>-low = '01'.
    <ls_subty>-high = '94'.

    SELECT * FROM t591a
      INTO TABLE lt_t591a
      WHERE infty = '0021'
        AND subty IN lr_subty.
    CHECK sy-subrc = 0.
    SELECT * FROM t591s
      INTO TABLE lt_t591s
      FOR ALL ENTRIES IN lt_t591a
      WHERE sprsl = 'R'
        AND infty = lt_t591a-infty
        AND subty = lt_t591a-subty.
    CHECK sy-subrc = 0.
    LOOP AT lt_t591s INTO DATA(ls_t591s).
      APPEND INITIAL LINE TO et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
      <ls_ent>-typefam = ls_t591s-subty.
      <ls_ent>-textfam = ls_t591s-stext.
    ENDLOOP.
  ENDMETHOD.


  METHOD incomingrefset_get_entityset.

    DATA:  lv_role_ggs TYPE boole_d,
           lv_role_gd  TYPE boole_d,
           lv_role_ms  TYPE boole_d.

    _get_roles( EXPORTING io_tech_request_context = io_tech_request_context
                 IMPORTING ev_role_gd = lv_role_gd
                          ev_role_ggs = lv_role_ggs
                           ev_role_ms = lv_role_ms ).

    SELECT * FROM zthr_argus_base0 INTO TABLE @DATA(lt_base)
      WHERE sdigit = @abap_true
      AND status = @zcl_argus_ref=>gs_status-draft
      AND portal = @abap_true.
    LOOP AT lt_base ASSIGNING FIELD-SYMBOL(<ls_base>).
      DATA(lo_ref) = NEW zcl_argus_ref( CONV #( <ls_base>-docid ) ).

      CALL METHOD zcl_hr_data=>get_plans
        EXPORTING
          i_pernr = CONV pernr_d( lo_ref->gs_pers0-pernr ) "<ls_base>-user-pernr )
          i_begda = sy-datum
        IMPORTING
          e_plans = DATA(lv_plans).
      DATA(lv_p1) = VALUE char1( ).
      zcl_hr_data=>get_plans_param(
        EXPORTING
          i_plans  = lv_plans
        IMPORTING
          e_param1 = lv_p1
      ).
      IF lv_p1 IS NOT INITIAL.
        CHECK ( lv_p1 = '1' AND lv_role_gd = abap_true )
           OR ( lv_p1 = '2' AND lv_role_ggs EQ abap_true )
           OR ( lv_p1 = '3' AND lv_role_ms = abap_true ).
      ENDIF.

      INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
      <ls_ent>-refid = <ls_base>-docid.
      <ls_ent>-user = VALUE #(
        pernr = lo_ref->gs_pers0-pernr
        name = |{ lo_ref->gs_pers0-nachn } { lo_ref->gs_pers0-vorna } { lo_ref->gs_pers0-midnm }|
        position = lo_ref->gs_work0-posit
        oiv = lo_ref->gs_work0-name1
      ).
      <ls_ent>-year = <ls_base>-begda(4).
      <ls_ent>-ispaper = <ls_base>-spaper.
      <ls_ent>-iselectro = <ls_base>-sdigit.
      <ls_ent>-helpcriterion = <ls_ent>-type = SWITCH #( <ls_base>-stype WHEN 'U' THEN 'Уточняющая' ELSE 'Основная' ).
      <ls_ent>-hassub = abap_false.
      <ls_ent>-relcount = VALUE #( ).
      <ls_ent>-dateofprint = |{ <ls_base>-ordst DATE = USER }|.
      <ls_ent>-dateofupload = |{ <ls_base>-aedtm DATE = USER }|.
      IF lo_ref->gs_pers0-idfam IS NOT INITIAL.
        <ls_ent>-relation = cl_hr_t591s=>read( infty = '0021' subty = CONV #( lo_ref->gs_pers0-idfam+16(2) ) )-stext.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.


METHOD informset_get_entity.
  DATA: lt_pernr TYPE TABLE OF pstring.
  _get_input(
    EXPORTING
      it_key_tab               = it_key_tab
    IMPORTING
      es_input                 = er_entity
  ).
  /ui2/cl_json=>deserialize(
    EXPORTING
      json        = er_entity-pernr
    CHANGING
      data        = lt_pernr
  ).
  CHECK lt_pernr IS NOT INITIAL.
  DATA(lo_search) = NEW zcl_argus_search( ).
  lo_search->add_filter( is_filter = VALUE #( name = 'NEED_REF' value = abap_true ) ).
  DATA(lt_search) = lo_search->search( ).
  DATA(lo_assistent) = zcl_mss_data_assistent=>get_instance( ).
  DATA(lt_mail_to) = VALUE bcsy_smtpa( ).
  LOOP AT lt_search ASSIGNING FIELD-SYMBOL(<ls_search>).
    CHECK line_exists( lt_pernr[ table_line = <ls_search>-pernr ] ).
    DATA(lv_email) = lo_assistent->get_pernr_0105( iv_pernr = <ls_search>-pernr ).
    IF lv_email IS NOT INITIAL.
      APPEND INITIAL LINE TO lt_mail_to ASSIGNING FIELD-SYMBOL(<lt_mail_to>).
      <lt_mail_to> = lv_email.
    ENDIF.
  ENDLOOP.
  IF lt_mail_to IS NOT INITIAL.
    DATA(lv_date) = _get_ref_until_date(
      iv_plans = lt_search[ 1 ]-plans
      iv_year = CONV #( sy-datum(4) - 1 )
    ).
    zcl_send_email=>send_mail(
      EXPORTING
        itd_to          = lt_mail_to
        iv_textname     = 'ZHR_ARGUS_NOTIFY'
        iv_subject      = 'Напоминание о предоставлении справки о доходах'
        itd_mapping     = VALUE #( ( name = '<date>' value = |{ lv_date DATE = USER }| ) )
        iv_immediately  = abap_false
        iv_commit       = abap_true
    ).
  ENDIF.
ENDMETHOD.


METHOD informset_get_entityset.

ENDMETHOD.


  METHOD jobset_get_entity.
    _get_input(
      EXPORTING
        it_key_tab               = it_key_tab
      IMPORTING
        es_input                 = er_entity
    ).
    SET LOCALE LANGUAGE 'R'. "terminal restriction
    IF er_entity-pernr <> 'new'.
      SELECT * FROM pa0001 INTO TABLE @DATA(lt_0001) WHERE pernr = @er_entity-pernr.
    ENDIF.
    SORT lt_0001 BY begda DESCENDING.
    ASSIGN lt_0001[ 1 ] TO FIELD-SYMBOL(<ls_0001>).
    CHECK sy-subrc = 0.
    er_entity-oiv = zcl_hr_data_utils=>get_last_but_one_ogreh_name_o(
       i_otype = cl_hap_pmp_const=>otype_orgunit
       i_objid = <ls_0001>-orgeh
    ).
    SELECT * FROM hrp1000 INTO TABLE @DATA(lt_txt)
      WHERE plvar = @cl_hap_pmp_const=>plvar
      AND ( otype = @cl_hap_pmp_const=>otype_orgunit OR otype = @cl_hap_pmp_const=>otype_position )
      AND ( objid = @<ls_0001>-plans OR objid = @<ls_0001>-orgeh )
      AND langu = @sy-langu
      ORDER BY begda DESCENDING.
    er_entity-position = VALUE #( lt_txt[ otype = cl_hap_pmp_const=>otype_position objid = <ls_0001>-plans ]-stext OPTIONAL ).
*   er_entity-department = VALUE #( lt_txt[ otype = cl_hap_pmp_const=>otype_orgunit objid = <ls_0001>-orgeh ]-stext OPTIONAL ).
    er_entity-department = zcl_hr_data_utils=>get_org_path(
        i_otype = cl_hap_pmp_const=>otype_orgunit
        i_objid = <ls_0001>-orgeh
    ).
  ENDMETHOD.


  METHOD jobset_update_entity.
**TRY.
*CALL METHOD SUPER->JOBSET_UPDATE_ENTITY
*  EXPORTING
*    IV_ENTITY_NAME          =
*    IV_ENTITY_SET_NAME      =
*    IV_SOURCE_NAME          =
*    IT_KEY_TAB              =
**    io_tech_request_context =
*    IT_NAVIGATION_PATH      =
**    io_data_provider        =
**  IMPORTING
**    er_entity               =
*    .
** CATCH /iwbep/cx_mgw_busi_exception .
** CATCH /iwbep/cx_mgw_tech_exception .
**ENDTRY.
  ENDMETHOD.


  METHOD mainuserroleset_get_entity.
    DATA lt_p0105 TYPE TABLE OF p0105.
    _get_input(
  EXPORTING
    it_key_tab = it_key_tab
  IMPORTING
    es_input   = er_entity
).
    IF er_entity-mainuser IS INITIAL.
      DATA(lt_hdr) = CAST /iwbep/cl_mgw_request( io_tech_request_context )->get_request_details( )-technical_request-request_header.
      ASSIGN lt_hdr[ name = 'x-main-user' ] TO FIELD-SYMBOL(<ls_user>).
      IF sy-subrc = 0.
        er_entity-mainuser = <ls_user>-value.
      ENDIF.
    ENDIF.
    DATA(lo_mss) = zcl_mss_data_assistent=>get_instance( ).
    DATA(lv_pernr) = lo_mss->get_pernr(
        iv_usrid  = CONV #( er_entity-mainuser )
    ).
    DATA(lv_is) = lo_mss->is_argus( iv_pernr = lv_pernr ).
    CALL METHOD zcl_hr_data=>read_pa_infty
      EXPORTING
        i_pernr = lv_pernr
        i_infty = '0105'
        i_subty = '0001'
        i_endda = sy-datum
      IMPORTING
        e_pnnnn = lt_p0105.
    READ TABLE lt_p0105 INTO DATA(ls_p0105) INDEX 1.
    IF sy-subrc = 0.
      DATA(lv_sap_usrid) = ls_p0105-usrid.
    ENDIF.
*  проверка полномочий у пользователя SAP
    IF lv_sap_usrid IS NOT INITIAL.
      SELECT * FROM agr_users INTO TABLE @DATA(lt_roles) WHERE uname = @lv_sap_usrid.
      IF sy-subrc = 0.
        READ TABLE lt_roles WITH KEY agr_name = 'ZHR_ARGUS_CONTROL_GGS' TRANSPORTING NO FIELDS.
        IF sy-subrc = 0.
          er_entity-roleggs = abap_true.
        ENDIF.
        READ TABLE lt_roles WITH KEY agr_name = 'ZHR_ARGUS_CONTROL_GD' TRANSPORTING NO FIELDS.
        IF sy-subrc = 0.
          er_entity-rolegd = abap_true.
        ENDIF.
        READ TABLE lt_roles WITH KEY agr_name = 'ZHR_ARGUS_CONTROL_MS' TRANSPORTING NO FIELDS.
        IF sy-subrc = 0.
          er_entity-rolems = abap_true.
        ENDIF.
      ENDIF.
    ENDIF.
  ENDMETHOD.


  METHOD matchset_get_entityset.
    TYPES: BEGIN OF ts_detail,
             pernr TYPE pernr_d,
             name  TYPE pstring,
           END OF ts_detail.
    DATA: ls_search TYPE zshr_argus_search_info,
          ls_input  LIKE LINE OF et_entityset,
          lt_detail TYPE TABLE OF ts_detail,
          lt_comp TYPE TABLE OF DD03P.
    _get_input(
      EXPORTING
        it_key_tab               = it_key_tab
        it_filter_select_options = it_filter_select_options
      IMPORTING
        es_input                 = ls_input
    ).
    CALL FUNCTION 'DDIF_TABL_GET'
      EXPORTING
        name                = 'ZSHR_ARGUS_SEARCH_INFO'
     TABLES
       DD03P_TAB           = lt_comp
     EXCEPTIONS
       OTHERS              = 2.
    DELETE lt_comp WHERE fieldname CS '.INCLUDE'.
    DATA(lo_search) = NEW zcl_argus_search( ).
    DATA(lt_search) = lo_search->search( ).
    ASSIGN lt_search[ pernr = ls_input-pernr ] TO FIELD-SYMBOL(<ls_self>).
    CHECK sy-subrc = 0.
    LOOP AT lt_comp ASSIGNING FIELD-SYMBOL(<ls_comp>) WHERE fieldname <> 'PERNR' AND fieldname NP '*_TXT' AND fieldname NP '*_FA'
        AND fieldname <> 'NEED_REF' AND fieldname <> 'REF_SOURCE' AND fieldname <> 'PHOTO' AND fieldname <> 'PLANS_GGS'.
      DATA(lv_cri) = _get_name_by_criteria( CONV #( <ls_comp>-fieldname ) ).
      ASSIGN COMPONENT <ls_comp>-fieldname OF STRUCTURE <ls_self> TO FIELD-SYMBOL(<lv_fld>).
      CHECK sy-subrc = 0 AND <lv_fld> IS NOT INITIAL AND <lv_fld> CN '0. '.
      CHECK NOT line_exists( et_entityset[ criteria = lv_cri ] ).
      SPLIT <lv_fld> AT '|' INTO TABLE DATA(lt_split).
      INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
      <ls_ent>-criteria = lv_cri.
      DATA(lv_where) = VALUE pstring( ).
      LOOP AT lt_split ASSIGNING FIELD-SYMBOL(<ls_spliit>).
        IF lv_where IS INITIAL.
          lv_where = |{ <ls_comp>-fieldname } CS '{ <ls_spliit> }'|.
        ELSE.
          lv_where = |{ lv_where } OR { <ls_comp>-fieldname } CS '{ <ls_spliit> }'|.
        ENDIF.
      ENDLOOP.
      CLEAR lt_detail.
      LOOP AT lt_search ASSIGNING FIELD-SYMBOL(<ls_search>) WHERE (lv_where).
        CHECK <ls_search>-pernr <> ls_input-pernr.
        <ls_ent>-count = <ls_ent>-count + 1.
        INSERT VALUE #(
          pernr = <ls_search>-pernr
          name = |{ <ls_search>-nachn } { <ls_search>-vorna } { <ls_search>-midnm }|
        ) INTO TABLE lt_detail.
      ENDLOOP.
      <ls_ent>-detail = /ui2/cl_json=>serialize(
        data        = lt_detail
        pretty_name = abap_true
      ).
    ENDLOOP.
    DELETE et_entityset WHERE count = 0.
  ENDMETHOD.


  METHOD militaryset_create_entity.
    TRY.
        io_data_provider->read_entry_data(
          IMPORTING
            es_data                      = er_entity
        ).
      CATCH /iwbep/cx_mgw_tech_exception.
    ENDTRY.
    CHECK er_entity-pernr <> 'new'.
    cl_reca_date=>convert_date_to_internal( EXPORTING id_date_external = er_entity-begin IMPORTING ed_date_internal = DATA(lv_begda) ).
    cl_reca_date=>convert_date_to_internal( EXPORTING id_date_external = er_entity-end IMPORTING ed_date_internal = DATA(lv_endda) ).
    DATA(ls_9005) = VALUE p9005(
      infty = '9005'
      pernr = er_entity-pernr
      begda = lv_begda
      endda = lv_endda
      begin_date = lv_begda
      end_date = lv_endda
      milunit = er_entity-institute
      milcity = er_entity-place
    ).
    DATA(ls_return) = VALUE bapireturn1( ).
    CALL FUNCTION 'HR_EMPLOYEE_ENQUEUE'
      EXPORTING
        number = CONV pernr_d( er_entity-pernr ).
    CALL FUNCTION 'HR_INFOTYPE_OPERATION'
      EXPORTING
        infty         = '9005'
        number        = CONV pernr_d( er_entity-pernr )
        validityend   = ls_9005-begda
        validitybegin = ls_9005-endda
        record        = ls_9005
        operation     = 'INS'
      IMPORTING
        return        = ls_return.
    IF ls_return-type = 'E'.
      RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception
        EXPORTING
          textid = VALUE #(
            msgid = ls_return-id
            msgno = ls_return-number
            attr1 = ls_return-message_v1
            attr2 = ls_return-message_v2
            attr3 = ls_return-message_v3
            attr4 = ls_return-message_v4
          ).
    ENDIF.
    CALL FUNCTION 'HR_EMPLOYEE_DEQUEUE'
      EXPORTING
        number = CONV pernr_d( er_entity-pernr ).
  ENDMETHOD.


  METHOD militaryset_delete_entity.
    DATA: BEGIN OF ls_seqnr,
            begda TYPE datum,
            endda TYPE datum,
            seqnr TYPE seqnr,
          END OF ls_seqnr.
    DATA: ls_key TYPE zcl_zhr_argus_mpc=>ts_military.
    _get_input(
      EXPORTING
        it_key_tab = it_key_tab
      IMPORTING
        es_input   = ls_key
    ).
    ls_seqnr = ls_key-seqnr.
    CHECK ls_key-pernr <> 'new'.
    SELECT SINGLE * FROM pa9005 INTO @DATA(ls_9005)
       WHERE pernr = @ls_key-pernr
      AND begda = @ls_seqnr-begda
      AND endda = @ls_seqnr-endda
      AND seqnr = @ls_seqnr-seqnr.
    CHECK sy-subrc = 0.
    DELETE pa9005 FROM ls_9005.
  ENDMETHOD.


  METHOD militaryset_get_entity.
    _get_input(
      EXPORTING
        it_key_tab               = it_key_tab
      IMPORTING
        es_input                 = er_entity
    ).
  ENDMETHOD.


  METHOD militaryset_get_entityset.
    DATA: ls_input LIKE LINE OF et_entityset.
    _get_input(
      EXPORTING
        it_key_tab               = it_key_tab
        it_filter_select_options = it_filter_select_options
      IMPORTING
        es_input                 = ls_input
    ).
    SET LOCALE LANGUAGE 'R'.
    CHECK ls_input-pernr <> 'new'.
    SELECT * FROM pa9005 INTO TABLE @DATA(lt_9005) WHERE pernr = @ls_input-pernr.
    LOOP AT lt_9005 ASSIGNING FIELD-SYMBOL(<ls_9005>).
      INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
      <ls_ent>-pernr = ls_input-pernr.
      <ls_ent>-seqnr = |{ <ls_9005>-begda }{ <ls_9005>-endda }{ <ls_9005>-seqnr }|.
      <ls_ent>-institute = <ls_9005>-milunit.
      <ls_ent>-begin = |{ <ls_9005>-begin_date DATE = USER }|.
      <ls_ent>-end = |{ <ls_9005>-end_date DATE = USER }|.
      <ls_ent>-place = <ls_9005>-milcity.
      <ls_ent>-action = VALUE #( edit = abap_true delete = abap_true ).
    ENDLOOP.
  ENDMETHOD.


  METHOD militaryset_update_entity.
    DATA: BEGIN OF ls_seqnr,
            begda TYPE datum,
            endda TYPE datum,
            seqnr TYPE seqnr,
          END OF ls_seqnr.
    DATA: ls_key TYPE zcl_zhr_argus_mpc=>ts_military.
    _get_input(
      EXPORTING
        it_key_tab = it_key_tab
      IMPORTING
        es_input   = ls_key
    ).
    TRY.
        io_data_provider->read_entry_data(
          IMPORTING
            es_data = er_entity
        ).
      CATCH /iwbep/cx_mgw_tech_exception.
    ENDTRY.
    er_entity-pernr = ls_key-pernr.
    er_entity-seqnr = ls_key-seqnr.
    ls_seqnr = ls_key-seqnr.
    CHECK er_entity-pernr <> 'new'.
    SELECT SINGLE * FROM pa9005 INTO @DATA(ls_9005)
       WHERE pernr = @er_entity-pernr
      AND begda = @ls_seqnr-begda
      AND endda = @ls_seqnr-endda
      AND seqnr = @ls_seqnr-seqnr.
    CHECK sy-subrc = 0.
    cl_reca_date=>convert_date_to_internal( EXPORTING id_date_external = er_entity-begin IMPORTING ed_date_internal = DATA(lv_begda) ).
    cl_reca_date=>convert_date_to_internal( EXPORTING id_date_external = er_entity-end IMPORTING ed_date_internal = DATA(lv_endda) ).
    IF ls_seqnr-begda <> lv_begda OR ls_seqnr-endda <> lv_endda.
      DELETE pa9005 FROM ls_9005.
      ls_9005-begda = lv_begda.
      ls_9005-endda = lv_endda.
      ls_9005-milunit = er_entity-institute.
      ls_9005-milcity = er_entity-place.
      ls_9005-begin_date = lv_begda.
      ls_9005-end_date = lv_endda.
      INSERT pa9005 FROM ls_9005.
    ELSE.
      UPDATE pa9005 SET
        milunit = er_entity-institute
        milcity = er_entity-place
        begin_date = lv_begda
        end_date = lv_endda
      WHERE pernr = ls_9005-pernr
        AND begda = ls_9005-begda
        AND endda = ls_9005-endda
        AND seqnr = ls_9005-seqnr.
    ENDIF.
  ENDMETHOD.


  METHOD oivset_get_entityset.
    TYPES: BEGIN OF ty_sobid,
             otype TYPE otype,
             objid TYPE hrobjid,
           END OF ty_sobid.
    DATA: lt_p1001   TYPE TABLE OF p1001,
          lv_orgtxt  TYPE string,
          lt_hrp1000 TYPE TABLE OF hrp1000,
          lt_sobid   TYPE TABLE OF ty_sobid,
          lt_pt1002  TYPE TABLE OF pt1002,
          ls_pt1002  TYPE pt1002.

    CALL FUNCTION 'RH_READ_INFTY_1001'
      EXPORTING
        plvar            = '01'
        otype            = 'O'
        objid            = '50000154'
        istat            = '1'
        subty            = 'B002'
      TABLES
        i1001            = lt_p1001
      EXCEPTIONS
        nothing_found    = 1
        wrong_condition  = 2
        wrong_parameters = 3
        OTHERS           = 4.
    IF sy-subrc = 0.
      DELETE lt_p1001 WHERE sclas NE 'O'.

      LOOP AT lt_p1001 INTO DATA(ls_p1001).
        APPEND INITIAL LINE TO lt_sobid ASSIGNING FIELD-SYMBOL(<ls_sobid>).
        <ls_sobid>-otype = ls_p1001-sclas.
        <ls_sobid>-objid = ls_p1001-sobid.
      ENDLOOP.

      SELECT * FROM hrp1000 INTO TABLE lt_hrp1000 FOR ALL ENTRIES IN lt_sobid WHERE objid = lt_sobid-objid AND
                                                                                    otype = lt_sobid-otype AND
                                                                                    plvar = '01'.
      LOOP AT lt_p1001 INTO ls_p1001.
        CLEAR: lt_pt1002, lv_orgtxt.
        CALL FUNCTION 'RH_OBJECT_DESCRIPTION_READ'
          EXPORTING
            plvar         = '01'
            otype         = 'O'
            sttag         = sy-datum
            objid         = CONV hrobjid( ls_p1001-sobid )
            subty         = '0001'
          TABLES
            ptxt1002      = lt_pt1002
          EXCEPTIONS
            nothing_found = 1
            infty_empty   = 2
            undefined     = 3
            OTHERS        = 4.

        LOOP AT lt_pt1002 INTO ls_pt1002.
          IF lv_orgtxt IS NOT INITIAL.
            CONCATENATE lv_orgtxt ls_pt1002 INTO lv_orgtxt SEPARATED BY space.
          ELSE.
            lv_orgtxt = ls_pt1002.
          ENDIF.
        ENDLOOP.

        IF lv_orgtxt IS INITIAL.
          READ TABLE lt_hrp1000 INTO DATA(ls_hrp1000) WITH KEY objid = ls_p1001-sobid.
          IF sy-subrc = 0.
            lv_orgtxt = ls_hrp1000-stext.
          ENDIF.
        ENDIF.
        APPEND INITIAL LINE TO et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
        <ls_ent>-oiv = ls_p1001-sobid.
        <ls_ent>-oivtext = lv_orgtxt.
      ENDLOOP.
    ENDIF.


  ENDMETHOD.


  METHOD orgaddrset_get_entityset.
    SELECT * FROM zthr_addr INTO TABLE @DATA(lt_addr).
    LOOP AT lt_addr ASSIGNING FIELD-SYMBOL(<ls_addr>).
      INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
      <ls_ent>-orgnum = <ls_addr>-org_num.
      <ls_ent>-orgname = <ls_addr>-org_name.
      <ls_ent>-addr = <ls_addr>-addr_text.
    ENDLOOP.
  ENDMETHOD.


  METHOD penaltyset_get_entityset.
    DATA: ls_input LIKE LINE OF et_entityset.
    _get_input(
      EXPORTING
        it_key_tab               = it_key_tab
        it_filter_select_options = it_filter_select_options
      IMPORTING
        es_input                 = ls_input
    ).

    DATA(lo_assistent) = zcl_mss_data_assistent=>get_instance( ).

    CASE ls_input-recov.
*      WHEN 'GSS'.  " Закомментировал Джувага К.В. 29.06.2022
*        lo_assistent->ws_get_structure( EXPORTING  iv_euser       = ls_input-name
*                                                   iv_xss         = ls_input-recov
*                                        IMPORTING  et_struc       = DATA(lt_struc)
*                                        EXCEPTIONS no_pernr       = 1
*                                                   no_sec_lev_ruk = 2
*                                                   pernr_inactive = 3
*                                                   OTHERS         = 99 ).
      WHEN 'MSS'.
        lo_assistent->ws_get_structure( EXPORTING  iv_euser       = ls_input-name
*                                                   iv_xss         = ls_input-xss
                                        IMPORTING  et_struc       = DATA(lt_struc)
                                        EXCEPTIONS no_pernr       = 1
                                                   no_sec_lev_ruk = 2
                                                   pernr_inactive = 3
                                                   OTHERS         = 99 ).
      WHEN 'ESS'.
        DATA(lv_usrid) = ls_input-name. TRANSLATE lv_usrid TO UPPER CASE.
        IF ls_input-name IS NOT INITIAL.
          SELECT SINGLE  pa0105~pernr
                       , pa0000~stat2
                   INTO @DATA(lv_pernr)
                   FROM pa0105
                   LEFT OUTER JOIN pa0000 ON pa0000~pernr = pa0105~pernr
                   WHERE pa0105~subty  = '9001'
                     AND pa0105~begda <= @sy-datum
                     AND pa0105~endda >= @sy-datum
                     AND pa0105~usrid  = @lv_usrid
                     AND pa0000~begda <= @sy-datum
                     AND pa0000~endda >= @sy-datum.

          APPEND VALUE #( object-otype = 'P' object-objid = lv_pernr-pernr ) TO lt_struc.
        ENDIF.
      WHEN OTHERS.
    ENDCASE.

    DELETE lt_struc WHERE object-otype <> 'P'.

    SELECT * FROM zthr_recovt INTO TABLE @DATA(lt_recov) WHERE spras = @sy-langu.
    SELECT * FROM zthr_rtypet INTO TABLE @DATA(lt_rtype) WHERE spras = @sy-langu.
    SELECT * FROM zthr_solutt INTO TABLE @DATA(lt_solut) WHERE spras = @sy-langu.
    SELECT * FROM pa9002 INTO TABLE @DATA(lt_p9002).


*    IF lt_struc IS NOT INITIAL.
    LOOP AT lt_p9002 ASSIGNING FIELD-SYMBOL(<ls_p9002>)."INTO DATA(ls_9002).
      READ TABLE lt_struc TRANSPORTING NO FIELDS WITH KEY object-objid = <ls_p9002>-pernr.
      IF sy-subrc = 0.
        <ls_p9002>-flag1 = abap_false.
      ELSE.
        <ls_p9002>-flag1 = abap_true.
*        DELETE TABLE lt_p9002 FROM ls_9002.
      ENDIF.
    ENDLOOP.
*    ENDIF.
    DELETE lt_p9002 WHERE flag1 = abap_true.

    et_entityset = VALUE #( FOR ls_p9002 IN lt_p9002 (
    pernr = ls_p9002-pernr
    date  = ls_p9002-begda
    recov = ls_p9002-recov
    rtype = ls_p9002-rtype
    rasnu = ls_p9002-rasnu
    solut = ls_p9002-solut
   ) ).
    LOOP AT et_entityset ASSIGNING FIELD-SYMBOL(<ls_entityset>).
      READ TABLE lt_recov WITH KEY recov = <ls_entityset>-recov INTO DATA(lv_recov_text).
      IF sy-subrc = 0.
        <ls_entityset>-recovtext = lv_recov_text-stext.
      ENDIF.
      READ TABLE lt_rtype WITH KEY rtype = <ls_entityset>-rtype INTO DATA(lv_rtype_text).
      IF sy-subrc = 0.
        <ls_entityset>-rtypetext = lv_rtype_text-stext.
      ENDIF.
      READ TABLE lt_solut WITH KEY solut = <ls_entityset>-solut INTO DATA(lv_solut_text).
      IF sy-subrc = 0.
        <ls_entityset>-soluttext = lv_solut_text-stext.
      ENDIF.
      CALL METHOD zcl_hr_data=>get_fio
        EXPORTING
          i_pernr    = CONV pernr_d( <ls_entityset>-pernr )
        IMPORTING
          e_fio_full = <ls_entityset>-name.
    ENDLOOP.
  ENDMETHOD.


  METHOD personalset_create_entity.
    personalset_update_entity(
      EXPORTING
        iv_entity_name               = iv_entity_name
        iv_entity_set_name           = iv_entity_set_name
        iv_source_name               = iv_source_name
        it_key_tab                   = it_key_tab    " table for name value pairs
*      io_tech_request_context      = io_tech_request_context
        it_navigation_path           = VALUE #( )
        io_data_provider             = io_data_provider    " MGW Entry Data Provider
      IMPORTING
        er_entity                    = er_entity
    ).
  ENDMETHOD.


  METHOD personalset_get_entity.
    _get_input(
      EXPORTING
        it_key_tab               = it_key_tab
      IMPORTING
        es_input                 = er_entity
    ).
    IF er_entity-pernr <> 'new'.
      SELECT * FROM pa0002 INTO TABLE @DATA(lt_0002) WHERE pernr = @er_entity-pernr.
      SORT lt_0002 BY begda DESCENDING.
      READ TABLE lt_0002 INTO DATA(ls_0002) INDEX 1.
      SELECT * FROM pa0290 INTO TABLE @DATA(lt_0290) WHERE pernr = @er_entity-pernr.
    ENDIF.
    er_entity-name = |{ ls_0002-nachn } { ls_0002-vorna } { ls_0002-midnm }|.
    er_entity-lastname = ls_0002-nachn.
    er_entity-firstname = ls_0002-vorna.
    er_entity-patronymic = ls_0002-midnm.
    er_entity-namechanged = ls_0002-name2.
    IF er_entity-namechanged <> er_entity-lastname AND er_entity-namechanged IS NOT INITIAL.
      er_entity-isnamechanged = abap_true.
      IF ls_0002-zzdatch IS NOT INITIAL.
        er_entity-namechangeddate = |{ ls_0002-zzdatch DATE = USER }|.
      ELSE.
        SELECT SINGLE * FROM pa0302 INTO @DATA(ls_0302) WHERE massn = 'ZR' AND pernr = @ls_0002-pernr.
        IF sy-subrc <> 0.
          SELECT SINGLE * FROM pa0000 INTO @DATA(ls_0000) WHERE massn = 'ZR' AND pernr = @ls_0002-pernr.
          IF sy-subrc = 0.
            er_entity-namechangeddate = |{ ls_0000-begda DATE = USER }|.
          ENDIF.
        ELSE.
          er_entity-namechangeddate = |{ ls_0302-begda DATE = USER }|.
        ENDIF.
      ENDIF.
    ENDIF.
    er_entity-dateofbirth = |{ ls_0002-gbdat DATE = USER }|.
    er_entity-placeofbirth = ls_0002-gbort.
    LOOP AT lt_0290 ASSIGNING FIELD-SYMBOL(<ls_0290>).
      CASE <ls_0290>-subty.
        WHEN '801'.
          er_entity-inn = <ls_0290>-nomer.
        WHEN '802'.
          er_entity-snils = <ls_0290>-nomer.
      ENDCASE.
    ENDLOOP.
  ENDMETHOD.


  METHOD personalset_update_entity.
    DATA: BEGIN OF ls_seqnr,
            begda TYPE datum,
            endda TYPE datum,
            seqnr TYPE seqnr,
          END OF ls_seqnr.
    DATA: ls_key TYPE zcl_zhr_argus_mpc=>ts_personal.
    _get_input(
      EXPORTING
        it_key_tab = it_key_tab
      IMPORTING
        es_input   = ls_key
    ).
    TRY.
        io_data_provider->read_entry_data(
          IMPORTING
            es_data = er_entity
        ).
      CATCH /iwbep/cx_mgw_tech_exception.
    ENDTRY.
    IF er_entity-pernr = 'new'.
      DATA(lv_pernr) = _hire_new_employee( is_entity = er_entity ).
      er_entity-pernr = lv_pernr.
    ENDIF.
    cl_reca_date=>convert_date_to_internal( EXPORTING id_date_external = er_entity-dateofbirth IMPORTING ed_date_internal = DATA(lv_birth) ).
    IF er_entity-namechangeddate IS NOT INITIAL.
      cl_reca_date=>convert_date_to_internal( EXPORTING id_date_external = er_entity-namechangeddate IMPORTING ed_date_internal = DATA(lv_date_ch) ).
    ENDIF.
    SELECT SINGLE * FROM pa0002 INTO @DATA(ls_0002)
      WHERE pernr = @er_entity-pernr
      AND begda <= @sy-datum
      AND endda >= @sy-datum.
    CHECK sy-subrc = 0.
    UPDATE pa0002 SET
      nachn = er_entity-lastname
      vorna = er_entity-firstname
      midnm = er_entity-patronymic
      gbdat = lv_birth
      gbort = er_entity-placeofbirth
      zzdatch = lv_date_ch
      name2 = er_entity-namechanged
    WHERE pernr = ls_0002-pernr
      AND begda = ls_0002-begda
      AND endda = ls_0002-endda.
    SELECT * FROM pa0290 INTO TABLE @DATA(lt_0290) WHERE pernr = @er_entity-pernr.
* inn
    IF er_entity-inn IS NOT INITIAL.
      TRY.
          DATA(ls_0290) = lt_0290[ subty = '801' ].
          UPDATE pa0290 SET nomer = er_entity-inn
            WHERE pernr = ls_0290-pernr
            AND subty = ls_0290-subty
            AND begda = ls_0290-begda
            AND endda = ls_0290-endda.
        CATCH cx_sy_itab_line_not_found.
          _insert_0290(
              iv_pernr  = CONV #( er_entity-pernr )
              iv_subty  = '801'
              iv_number = er_entity-inn
              is_0002 = CORRESPONDING #( ls_0002 )
          ).
      ENDTRY.
    ENDIF.
* snils
    IF er_entity-snils IS NOT INITIAL.
      FIND REGEX '\d{3}-\d{3}-\d{3}\s\d{2}' IN er_entity-snils.
      IF sy-subrc <> 0.
        MESSAGE e001(zhr_argus) WITH er_entity-snils INTO DATA(lv_dummy).
        RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception
          EXPORTING
            textid = VALUE #(
              msgid = sy-msgid
              msgno = sy-msgno
              attr1 = sy-msgv1
            ).
      ENDIF.
      TRY.
          ls_0290 = lt_0290[ subty = '802' ].
          UPDATE pa0290 SET nomer = er_entity-snils
            WHERE pernr = ls_0290-pernr
            AND subty = ls_0290-subty
            AND begda = ls_0290-begda
            AND endda = ls_0290-endda.
        CATCH cx_sy_itab_line_not_found.
          _insert_0290(
              iv_pernr  = CONV #( er_entity-pernr )
              iv_subty  = '802'
              iv_number = er_entity-snils
              is_0002 = CORRESPONDING #( ls_0002 )
          ).
      ENDTRY.
    ENDIF.
  ENDMETHOD.


METHOD rdecisionset_get_entityset.
  SELECT * FROM zthr_solutt INTO TABLE @DATA(lt_solut) WHERE spras = @sy-langu.
  et_entityset = VALUE #( FOR ls_s IN lt_solut (
    key = ls_s-solut
    text = ls_s-stext
  ) ).
ENDMETHOD.


  METHOD realtyset_get_entity.
    _get_input(
      EXPORTING
        it_key_tab               = it_key_tab
      IMPORTING
        es_input                 = er_entity
    ).
  ENDMETHOD.


  METHOD realtyset_get_entityset.
    DATA: ls_input LIKE LINE OF et_entityset.
    _get_input(
      EXPORTING
        it_key_tab               = it_key_tab
        it_filter_select_options = it_filter_select_options
      IMPORTING
        es_input                 = ls_input
    ).
    CHECK ls_input-pernr <> 'new'.
    SELECT * FROM zthr_argus_pers0 AS pers
      INNER JOIN zthr_argus_base0 AS base
      ON pers~docid = base~docid
      INTO TABLE @DATA(lt_ref)
      WHERE pers~pernr = @ls_input-pernr
      AND base~status = @zcl_argus_ref=>gs_status-approved.
    LOOP AT lt_ref ASSIGNING FIELD-SYMBOL(<ls_ref>).
      DATA(lo_ref) = NEW zcl_argus_ref( iv_ref_id = CONV #( <ls_ref>-base-docid ) ).
      LOOP AT lo_ref->gt_bldn0 ASSIGNING FIELD-SYMBOL(<ls_exp>).
        INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
        <ls_ent>-pernr = ls_input-pernr.
        <ls_ent>-type = <ls_exp>-protype.
        IF <ls_exp>-proname <> <ls_ent>-type AND <ls_exp>-proname IS NOT INITIAL.
          IF <ls_ent>-type IS NOT INITIAL.
            <ls_ent>-type = |{ <ls_ent>-type } ({ <ls_exp>-proname })|.
          ELSE.
            <ls_ent>-type = <ls_exp>-proname.
          ENDIF.
        ENDIF.
        <ls_ent>-property = <ls_exp>-protype2.
        IF <ls_exp>-share2 IS NOT INITIAL.
          <ls_ent>-property = |{ <ls_ent>-property } ({ <ls_exp>-share2 })|.
        ENDIF.
        IF <ls_exp>-share_other IS NOT INITIAL.
          <ls_ent>-property = |{ <ls_ent>-property } ({ <ls_exp>-share_other })|.
        ENDIF.
        <ls_ent>-address = VALUE #(
          country = <ls_exp>-land1
          city = <ls_exp>-name_city
          region = <ls_exp>-regio
          street = <ls_exp>-name_street
          house = <ls_exp>-name_house
          building = <ls_exp>-name_bldng1
          apt = <ls_exp>-posta
          index = <ls_exp>-indx
        ).
        <ls_ent>-use = <ls_exp>-basf.
      ENDLOOP.
    ENDLOOP.
    SORT et_entityset.
    DELETE ADJACENT DUPLICATES FROM et_entityset.
    DELETE et_entityset WHERE address IS INITIAL OR type IS INITIAL.
    LOOP AT et_entityset ASSIGNING <ls_ent>.
      <ls_ent>-seqnr = sy-tabix.
    ENDLOOP.
  ENDMETHOD.


METHOD refbankset_delete_entity.
  DATA: ls_input TYPE zcl_zhr_argus_mpc=>ts_refbank.
  refbankset_get_entityset(
    EXPORTING
      iv_entity_name               = VALUE #( )
      iv_entity_set_name           = VALUE #( )
      iv_source_name               = VALUE #( )
      it_filter_select_options     = VALUE #( )
      is_paging                    = VALUE #( )
      it_key_tab                   = it_key_tab
      it_navigation_path           = VALUE #( )
      it_order                     = VALUE #( )
      iv_filter_string             = VALUE #( )
      iv_search_string             = VALUE #( )
    IMPORTING
      et_entityset                 = DATA(lt_ent)
  ).
  _get_input(
    EXPORTING
      it_key_tab = it_key_tab
    IMPORTING
      es_input   = ls_input
  ).
  TRY.
      DATA(ls_ent) = lt_ent[ seqnr = ls_input-seqnr ].
      DELETE FROM zthr_argus_bank0 WHERE docid = ls_input-refid AND lineid = ls_ent-lineid.
    CATCH cx_sy_itab_line_not_found.
  ENDTRY.
ENDMETHOD.


  METHOD refbankset_get_entityset.
    DATA: ls_input LIKE LINE OF et_entityset.
    _get_input(
      EXPORTING
        it_key_tab               = it_key_tab
        it_filter_select_options = it_filter_select_options
      IMPORTING
        es_input                 = ls_input
    ).
    DATA(lo_ref) = NEW zcl_argus_ref( iv_ref_id = ls_input-refid ).
    LOOP AT lo_ref->gt_bank0 ASSIGNING FIELD-SYMBOL(<ls_exp>).
      DATA(lv_tabix) = sy-tabix.
      INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
      <ls_ent>-refid = ls_input-refid.
      <ls_ent>-seqnr = lv_tabix.
      <ls_ent>-lineid = <ls_exp>-lineid.
      <ls_ent>-name = <ls_exp>-naboci.
      <ls_ent>-currency = <ls_exp>-accur.
      <ls_ent>-date = |{ <ls_exp>-datopen DATE = USER }|.
      TRY.
          <ls_ent>-rest = CONV dec20_2( <ls_exp>-acbal ).
          <ls_ent>-sum = CONV dec20_2( <ls_exp>-afroa ).
        CATCH cx_sy_conversion_no_number.
      ENDTRY.
    ENDLOOP.
  ENDMETHOD.


METHOD refbankset_update_entity.
  DATA: ls_input TYPE zcl_zhr_argus_mpc=>ts_refbank.
  io_data_provider->read_entry_data(
    IMPORTING
      es_data = er_entity
  ).
  cl_reca_date=>convert_date_to_internal( EXPORTING id_date_external = er_entity-date IMPORTING ed_date_internal = DATA(lv_date) ).
  UPDATE zthr_argus_bank0
    SET
      naboci = er_entity-name
      accur = er_entity-currency
      acbal = er_entity-rest
      afroa = er_entity-sum
      datopen = lv_date
    WHERE
      docid = er_entity-refid AND lineid = er_entity-lineid.
ENDMETHOD.


  METHOD refcompanyset_get_entityset.
**TRY.
*CALL METHOD SUPER->REFCOMPANYSET_GET_ENTITYSET
*  EXPORTING
*    IV_ENTITY_NAME           =
*    IV_ENTITY_SET_NAME       =
*    IV_SOURCE_NAME           =
*    IT_FILTER_SELECT_OPTIONS =
*    IS_PAGING                =
*    IT_KEY_TAB               =
*    IT_NAVIGATION_PATH       =
*    IT_ORDER                 =
*    IV_FILTER_STRING         =
*    IV_SEARCH_STRING         =
**    io_tech_request_context  =
**  IMPORTING
**    et_entityset             =
**    es_response_context      =
*    .
** CATCH /iwbep/cx_mgw_busi_exception .
** CATCH /iwbep/cx_mgw_tech_exception .
**ENDTRY.
  ENDMETHOD.


METHOD refcreditset_get_entityset.
ENDMETHOD.


METHOD refdealset_delete_entity.
  DATA: ls_input TYPE zcl_zhr_argus_mpc=>ts_refdeal.
  refdealset_get_entityset(
    EXPORTING
      iv_entity_name               = VALUE #( )
      iv_entity_set_name           = VALUE #( )
      iv_source_name               = VALUE #( )
      it_filter_select_options     = VALUE #( )
      is_paging                    = VALUE #( )
      it_key_tab                   = it_key_tab
      it_navigation_path           = VALUE #( )
      it_order                     = VALUE #( )
      iv_filter_string             = VALUE #( )
      iv_search_string             = VALUE #( )
    IMPORTING
      et_entityset                 = DATA(lt_ent)
  ).
  _get_input(
    EXPORTING
      it_key_tab = it_key_tab
    IMPORTING
      es_input   = ls_input
  ).
  TRY.
      DATA(ls_ent) = lt_ent[ seqnr = ls_input-seqnr ].
      DELETE FROM zthr_argus_gift0 WHERE docid = ls_input-refid AND lineid = ls_ent-lineid.
    CATCH cx_sy_itab_line_not_found.
  ENDTRY.
ENDMETHOD.


  METHOD refdealset_get_entityset.
    DEFINE set_it.
      IF &2 IS NOT INITIAL AND &1 IS INITIAL.
        &1 = &2.
      ENDIF.
    END-OF-DEFINITION.
    DATA: ls_input LIKE LINE OF et_entityset.
    _get_input(
      EXPORTING
        it_key_tab               = it_key_tab
        it_filter_select_options = it_filter_select_options
      IMPORTING
        es_input                 = ls_input
    ).
    DATA(lo_ref) = NEW zcl_argus_ref( iv_ref_id = ls_input-refid ).
    LOOP AT lo_ref->gt_gift0 ASSIGNING FIELD-SYMBOL(<ls_exp>).
      DATA(lv_tabix) = sy-tabix.
      INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
      <ls_ent>-refid = ls_input-refid.
      <ls_ent>-seqnr = lv_tabix.
      <ls_ent>-lineid = <ls_exp>-lineid.
      set_it <ls_ent>-type <ls_exp>-landtype.
      set_it <ls_ent>-type <ls_exp>-protype.
      set_it <ls_ent>-type <ls_exp>-trntype.
      set_it <ls_ent>-type <ls_exp>-orgtype.
      set_it <ls_ent>-type <ls_exp>-sectype.
      <ls_ent>-purchaser = <ls_exp>-acquirer.
      <ls_ent>-base = <ls_exp>-basap.
    ENDLOOP.
  ENDMETHOD.


  method REFDIGASSETSSET_GET_ENTITYSET.
    DATA: ls_input LIKE LINE OF et_entityset.
    _get_input(
      EXPORTING
        it_key_tab               = it_key_tab
        it_filter_select_options = it_filter_select_options
      IMPORTING
        es_input                 = ls_input
    ).
    DATA(lo_ref) = NEW zcl_argus_ref( iv_ref_id = ls_input-refid ).
*    LOOP AT lo_ref->gt_tran0 ASSIGNING FIELD-SYMBOL(<ls_exp>).
*      DATA(lv_tabix) = sy-tabix.
*      INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
*      <ls_ent>-refid = ls_input-refid.
*      <ls_ent>-seqnr = lv_tabix.
*      <ls_ent>-lineid = <ls_exp>-lineid.
*      <ls_ent>-type = <ls_exp>-trntype.
*      <ls_ent>-name = <ls_exp>-estate.
*      <ls_ent>-brand = <ls_exp>-trnbrand.
*      <ls_ent>-model = <ls_exp>-trnmodel.
*      <ls_ent>-year = <ls_exp>-yemanu.
*    ENDLOOP.
  endmethod.


  method REFDIGCURRSET_GET_ENTITYSET.
    DATA: ls_input LIKE LINE OF et_entityset.
    _get_input(
      EXPORTING
        it_key_tab               = it_key_tab
        it_filter_select_options = it_filter_select_options
      IMPORTING
        es_input                 = ls_input
    ).
    DATA(lo_ref) = NEW zcl_argus_ref( iv_ref_id = ls_input-refid ).
*    LOOP AT lo_ref->gt_tran0 ASSIGNING FIELD-SYMBOL(<ls_exp>).
*      DATA(lv_tabix) = sy-tabix.
*      INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
*      <ls_ent>-refid = ls_input-refid.
*      <ls_ent>-seqnr = lv_tabix.
*      <ls_ent>-lineid = <ls_exp>-lineid.
*      <ls_ent>-type = <ls_exp>-trntype.
*      <ls_ent>-name = <ls_exp>-estate.
*      <ls_ent>-brand = <ls_exp>-trnbrand.
*      <ls_ent>-model = <ls_exp>-trnmodel.
*      <ls_ent>-year = <ls_exp>-yemanu.
*    ENDLOOP.
  endmethod.


METHOD refexpensecompan_delete_entity.
  DATA: ls_input TYPE zcl_zhr_argus_mpc=>ts_refexpensecompany.
  refexpensecompan_get_entityset(
    EXPORTING
      iv_entity_name               = VALUE #( )
      iv_entity_set_name           = VALUE #( )
      iv_source_name               = VALUE #( )
      it_filter_select_options     = VALUE #( )
      is_paging                    = VALUE #( )
      it_key_tab                   = it_key_tab
      it_navigation_path           = VALUE #( )
      it_order                     = VALUE #( )
      iv_filter_string             = VALUE #( )
      iv_search_string             = VALUE #( )
    IMPORTING
      et_entityset                 = DATA(lt_ent)
  ).
  _get_input(
    EXPORTING
      it_key_tab = it_key_tab
    IMPORTING
      es_input   = ls_input
  ).
  TRY.
      DATA(ls_ent) = lt_ent[ seqnr = ls_input-seqnr ].
      DELETE FROM zthr_argus_expn0 WHERE docid = ls_input-refid AND lineid = ls_ent-lineid.
    CATCH cx_sy_itab_line_not_found.
  ENDTRY.
ENDMETHOD.


  METHOD refexpensecompan_get_entityset.
    DATA: ls_input LIKE LINE OF et_entityset.
    _get_input(
      EXPORTING
        it_key_tab               = it_key_tab
        it_filter_select_options = it_filter_select_options
      IMPORTING
        es_input                 = ls_input
    ).
    DATA(lo_ref) = NEW zcl_argus_ref( iv_ref_id = ls_input-refid ).
    DATA(lv_tabix) = VALUE i( ).
    LOOP AT lo_ref->gt_expn0 ASSIGNING FIELD-SYMBOL(<ls_exp>) WHERE orgtype IS NOT INITIAL.
      lv_tabix = lv_tabix + 1.
      INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
      <ls_ent>-refid = ls_input-refid.
      <ls_ent>-seqnr = lv_tabix.
      <ls_ent>-lineid = <ls_exp>-lineid.
      <ls_ent>-name = <ls_exp>-orgtype.
      <ls_ent>-place = <ls_exp>-adr_full.
      <ls_ent>-capital = ''.
      <ls_ent>-prozt = ''.
      <ls_ent>-sum = CONV dec20_2( <ls_exp>-tranam ).
      <ls_ent>-base = <ls_exp>-basac.
      <ls_ent>-source = lo_ref->format_camel( iv_txt = <ls_exp>-sfpwa ).
    ENDLOOP.
  ENDMETHOD.


METHOD refexpenseotherr_delete_entity.
  DATA: ls_input TYPE zcl_zhr_argus_mpc=>ts_refexpenseotherrealty.
  refexpenseotherr_get_entityset(
    EXPORTING
      iv_entity_name               = VALUE #( )
      iv_entity_set_name           = VALUE #( )
      iv_source_name               = VALUE #( )
      it_filter_select_options     = VALUE #( )
      is_paging                    = VALUE #( )
      it_key_tab                   = it_key_tab
      it_navigation_path           = VALUE #( )
      it_order                     = VALUE #( )
      iv_filter_string             = VALUE #( )
      iv_search_string             = VALUE #( )
    IMPORTING
      et_entityset                 = DATA(lt_ent)
  ).
  _get_input(
    EXPORTING
      it_key_tab = it_key_tab
    IMPORTING
      es_input   = ls_input
  ).
  TRY.
      DATA(ls_ent) = lt_ent[ seqnr = ls_input-seqnr ].
      DELETE FROM zthr_argus_expn0 WHERE docid = ls_input-refid AND lineid = ls_ent-lineid.
    CATCH cx_sy_itab_line_not_found.
  ENDTRY.
ENDMETHOD.


  METHOD refexpenseotherr_get_entityset.
    DATA: ls_input LIKE LINE OF et_entityset.
    _get_input(
      EXPORTING
        it_key_tab               = it_key_tab
        it_filter_select_options = it_filter_select_options
      IMPORTING
        es_input                 = ls_input
    ).
    DATA(lo_ref) = NEW zcl_argus_ref( iv_ref_id = ls_input-refid ).
    DATA(lv_tabix) = VALUE i( ).
    LOOP AT lo_ref->gt_expn0 ASSIGNING FIELD-SYMBOL(<ls_exp>) WHERE landtype IS NOT INITIAL
        AND exp_type <> 'ЗемельныйУчасток'.
      lv_tabix = lv_tabix + 1.
      INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
      <ls_ent>-refid = ls_input-refid.
      <ls_ent>-seqnr = lv_tabix.
      <ls_ent>-lineid = <ls_exp>-lineid.
      <ls_ent>-realtytype = <ls_exp>-landtype.
      <ls_ent>-property = <ls_exp>-exp_name2.
      <ls_ent>-address = VALUE #(
        country = <ls_exp>-land1
        city = <ls_exp>-name_city
        region = <ls_exp>-regio
        street = <ls_exp>-name_street
        house = <ls_exp>-name_house
        building = <ls_exp>-name_bldng1
        apt = <ls_exp>-posta
        index = <ls_exp>-indx
      ).
*      <ls_exp>-adr_full.
      <ls_ent>-square = <ls_exp>-area.
      <ls_ent>-base = <ls_exp>-basac.
      <ls_ent>-source = lo_ref->format_camel( iv_txt = <ls_exp>-sfpwa ).
      <ls_ent>-sum = CONV dec20_2( <ls_exp>-tranam ).
    ENDLOOP.
  ENDMETHOD.


METHOD refexpenseotherr_update_entity.
  io_data_provider->read_entry_data(
    IMPORTING
      es_data = er_entity
  ).
  UPDATE zthr_argus_expn0
    SET
      landtype = er_entity-realtytype
      exp_name2 = er_entity-property
      area = er_entity-square
      basac = er_entity-base
      tranam = er_entity-sum
      land1 = er_entity-address-country
      name_city = er_entity-address-city
      regio = er_entity-address-region
      name_street = er_entity-address-street
      name_house = er_entity-address-house
      name_bldng1 = er_entity-address-building
      posta = er_entity-address-apt
      indx = er_entity-address-index
      sfpwa = er_entity-source
    WHERE
      docid = er_entity-refid AND lineid = er_entity-lineid.
ENDMETHOD.


METHOD refexpenserealty_delete_entity.
  DATA: ls_input TYPE zcl_zhr_argus_mpc=>ts_refexpenserealty.
  refexpenserealty_get_entityset(
    EXPORTING
      iv_entity_name               = VALUE #( )
      iv_entity_set_name           = VALUE #( )
      iv_source_name               = VALUE #( )
      it_filter_select_options     = VALUE #( )
      is_paging                    = VALUE #( )
      it_key_tab                   = it_key_tab
      it_navigation_path           = VALUE #( )
      it_order                     = VALUE #( )
      iv_filter_string             = VALUE #( )
      iv_search_string             = VALUE #( )
    IMPORTING
      et_entityset                 = DATA(lt_ent)
  ).
  _get_input(
    EXPORTING
      it_key_tab = it_key_tab
    IMPORTING
      es_input   = ls_input
  ).
  TRY.
      DATA(ls_ent) = lt_ent[ seqnr = ls_input-seqnr ].
      DELETE FROM zthr_argus_expn0 WHERE docid = ls_input-refid AND lineid = ls_ent-lineid.
    CATCH cx_sy_itab_line_not_found.
  ENDTRY.
ENDMETHOD.


  METHOD refexpenserealty_get_entityset.
    DATA: ls_input LIKE LINE OF et_entityset,
          lv_p TYPE p DECIMALS 2.
    _get_input(
      EXPORTING
        it_key_tab               = it_key_tab
        it_filter_select_options = it_filter_select_options
      IMPORTING
        es_input                 = ls_input
    ).
    DATA(lo_ref) = NEW zcl_argus_ref( iv_ref_id = ls_input-refid ).
    DATA(lv_tabix) = VALUE i( ).
    LOOP AT lo_ref->gt_expn0 ASSIGNING FIELD-SYMBOL(<ls_exp>) WHERE landtype IS NOT INITIAL
        AND exp_type = 'ЗемельныйУчасток'.
      lv_tabix = lv_tabix + 1.
      INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
      <ls_ent>-refid = ls_input-refid.
      <ls_ent>-seqnr = lv_tabix.
      <ls_ent>-lineid = <ls_exp>-lineid.
      <ls_ent>-realtytype = <ls_exp>-landtype.
      <ls_ent>-property = <ls_exp>-exp_name2.
      <ls_ent>-address = VALUE #(
        country = <ls_exp>-land1
        city = <ls_exp>-name_city
        region = <ls_exp>-regio
        street = <ls_exp>-name_street
        house = <ls_exp>-name_house
        building = <ls_exp>-name_bldng1
        apt = <ls_exp>-posta
        index = <ls_exp>-indx
      ).
      <ls_ent>-square = <ls_exp>-area.
      <ls_ent>-base = <ls_exp>-basac.
      <ls_ent>-source = lo_ref->format_camel( iv_txt = <ls_exp>-sfpwa ).
      <ls_ent>-sum = CONV dec20_2( <ls_exp>-tranam ).
    ENDLOOP.
  ENDMETHOD.


METHOD refexpenserealty_update_entity.
  io_data_provider->read_entry_data(
    IMPORTING
      es_data = er_entity
  ).
  UPDATE zthr_argus_expn0
    SET
      landtype = er_entity-realtytype
      exp_name2 = er_entity-property
      area = er_entity-square
      basac = er_entity-base
      tranam = er_entity-sum
      land1 = er_entity-address-country
      name_city = er_entity-address-city
      regio = er_entity-address-region
      name_street = er_entity-address-street
      name_house = er_entity-address-house
      name_bldng1 = er_entity-address-building
      posta = er_entity-address-apt
      indx = er_entity-address-index
      sfpwa = er_entity-source
    WHERE
      docid = er_entity-refid AND lineid = er_entity-lineid.
ENDMETHOD.


METHOD refexpenseset_delete_entity.
  DATA: ls_input TYPE zcl_zhr_argus_mpc=>ts_refexpense.
  refexpenseset_get_entityset(
    EXPORTING
      iv_entity_name               = VALUE #( )
      iv_entity_set_name           = VALUE #( )
      iv_source_name               = VALUE #( )
      it_filter_select_options     = VALUE #( )
      is_paging                    = VALUE #( )
      it_key_tab                   = it_key_tab
      it_navigation_path           = VALUE #( )
      it_order                     = VALUE #( )
      iv_filter_string             = VALUE #( )
      iv_search_string             = VALUE #( )
    IMPORTING
      et_entityset                 = DATA(lt_ent)
  ).
  _get_input(
    EXPORTING
      it_key_tab = it_key_tab
    IMPORTING
      es_input   = ls_input
  ).
  TRY.
      DATA(ls_ent) = lt_ent[ seqnr = ls_input-seqnr ].
      DELETE FROM zthr_argus_expn0 WHERE docid = ls_input-refid AND lineid = ls_ent-lineid.
    CATCH cx_sy_itab_line_not_found.
  ENDTRY.
ENDMETHOD.


  METHOD refexpenseset_get_entityset.
    DEFINE set_it.
      IF &2 IS NOT INITIAL AND &1 IS INITIAL.
        &1 = &2.
      ENDIF.
    END-OF-DEFINITION.
    DATA: ls_input LIKE LINE OF et_entityset.
    _get_input(
      EXPORTING
        it_key_tab               = it_key_tab
        it_filter_select_options = it_filter_select_options
      IMPORTING
        es_input                 = ls_input
    ).
    DATA(lo_ref) = NEW zcl_argus_ref( iv_ref_id = ls_input-refid ).
    DATA(lv_tabix) = VALUE i( ).
    LOOP AT lo_ref->gt_expn0 ASSIGNING FIELD-SYMBOL(<ls_exp>).
      lv_tabix = lv_tabix + 1.
      INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
      <ls_ent>-refid = ls_input-refid.
      <ls_ent>-seqnr = lv_tabix.
      <ls_ent>-lineid = <ls_exp>-lineid.
      set_it <ls_ent>-expensetype <ls_exp>-landtype.
      set_it <ls_ent>-expensetype <ls_exp>-protype.
      set_it <ls_ent>-expensetype <ls_exp>-trntype.
      set_it <ls_ent>-expensetype <ls_exp>-orgtype.
      set_it <ls_ent>-expensetype <ls_exp>-sectype.
      <ls_ent>-sum = CONV dec20_2( <ls_exp>-total ).
      <ls_ent>-base = <ls_exp>-basac.
      <ls_ent>-source = lo_ref->format_camel( iv_txt = <ls_exp>-sfpwa ).
    ENDLOOP.
  ENDMETHOD.


METHOD refexpensesource_delete_entity.
  DATA: ls_input TYPE zcl_zhr_argus_mpc=>ts_refexpensesource.
  refexpensesource_get_entityset(
    EXPORTING
      iv_entity_name               = VALUE #( )
      iv_entity_set_name           = VALUE #( )
      iv_source_name               = VALUE #( )
      it_filter_select_options     = VALUE #( )
      is_paging                    = VALUE #( )
      it_key_tab                   = it_key_tab
      it_navigation_path           = VALUE #( )
      it_order                     = VALUE #( )
      iv_filter_string             = VALUE #( )
      iv_search_string             = VALUE #( )
    IMPORTING
      et_entityset                 = DATA(lt_ent)
  ).
  _get_input(
    EXPORTING
      it_key_tab = it_key_tab
    IMPORTING
      es_input   = ls_input
  ).
  TRY.
      DATA(ls_ent) = lt_ent[ seqnr = ls_input-seqnr ].
      DELETE FROM zthr_argus_surc0 WHERE docid = ls_input-refid AND lineid = ls_ent-lineid AND slineid = ls_ent-slineid.
    CATCH cx_sy_itab_line_not_found.
  ENDTRY.
ENDMETHOD.


  METHOD refexpensesource_get_entityset.
    DEFINE set_it.
      IF &2 IS NOT INITIAL AND &1 IS INITIAL.
        &1 = &2.
      ENDIF.
    END-OF-DEFINITION.
    DATA: ls_input LIKE LINE OF et_entityset.
    _get_input(
      EXPORTING
        it_key_tab               = it_key_tab
        it_filter_select_options = it_filter_select_options
      IMPORTING
        es_input                 = ls_input
    ).
    DATA(lo_ref) = NEW zcl_argus_ref( iv_ref_id = ls_input-refid ).
    LOOP AT lo_ref->gt_surc0 ASSIGNING FIELD-SYMBOL(<ls_exp>).
      DATA(lv_tabix) = sy-tabix.
      INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
      <ls_ent>-refid = ls_input-refid.
      <ls_ent>-seqnr = lv_tabix.
      <ls_ent>-lineid = <ls_exp>-lineid.
      <ls_ent>-slineid = <ls_exp>-slineid.
      ASSIGN lo_ref->gt_expn0[ lineid = <ls_exp>-lineid ] TO FIELD-SYMBOL(<ls_detail>).
      IF sy-subrc = 0.
        set_it <ls_ent>-expensetype <ls_detail>-landtype.
        set_it <ls_ent>-expensetype <ls_detail>-protype.
        set_it <ls_ent>-expensetype <ls_detail>-trntype.
        set_it <ls_ent>-expensetype <ls_detail>-orgtype.
        set_it <ls_ent>-expensetype <ls_detail>-sectype.
      ELSE.
        <ls_ent>-expensetype = <ls_exp>-protype.
      ENDIF.
      <ls_ent>-sourcetype = <ls_exp>-sofund.
      <ls_ent>-sum = CONV dec20_2( <ls_exp>-wrbtr ).
    ENDLOOP.
  ENDMETHOD.


  METHOD refexpensestocks_delete_entity.
    DATA: ls_input TYPE zcl_zhr_argus_mpc=>ts_refexpensestock.
    refexpensestocks_get_entityset(
      EXPORTING
        iv_entity_name               = VALUE #( )
        iv_entity_set_name           = VALUE #( )
        iv_source_name               = VALUE #( )
        it_filter_select_options     = VALUE #( )
        is_paging                    = VALUE #( )
        it_key_tab                   = it_key_tab
        it_navigation_path           = VALUE #( )
        it_order                     = VALUE #( )
        iv_filter_string             = VALUE #( )
        iv_search_string             = VALUE #( )
      IMPORTING
        et_entityset                 = DATA(lt_ent)
    ).
    _get_input(
      EXPORTING
        it_key_tab = it_key_tab
      IMPORTING
        es_input   = ls_input
    ).
    TRY.
        DATA(ls_ent) = lt_ent[ seqnr = ls_input-seqnr ].
        DELETE FROM zthr_argus_expn0 WHERE docid = ls_input-refid AND lineid = ls_ent-lineid.
      CATCH cx_sy_itab_line_not_found.
    ENDTRY.
  ENDMETHOD.


  METHOD refexpensestocks_get_entityset.
    DATA: ls_input LIKE LINE OF et_entityset.
    _get_input(
      EXPORTING
        it_key_tab               = it_key_tab
        it_filter_select_options = it_filter_select_options
      IMPORTING
        es_input                 = ls_input
    ).
    DATA(lo_ref) = NEW zcl_argus_ref( iv_ref_id = ls_input-refid ).
    DATA(lv_tabix) = VALUE i( ).
    LOOP AT lo_ref->gt_expn0 ASSIGNING FIELD-SYMBOL(<ls_exp>) WHERE sectype IS NOT INITIAL.
      lv_tabix = lv_tabix + 1.
      INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
      <ls_ent>-refid = ls_input-refid.
      <ls_ent>-seqnr = lv_tabix.
      <ls_ent>-lineid = <ls_exp>-lineid.
      <ls_ent>-type = <ls_exp>-sectype.
      <ls_ent>-person = <ls_exp>-issuer.
      <ls_ent>-nominal = <ls_exp>-fvaliab.
      <ls_ent>-count = <ls_exp>-total.
      <ls_ent>-sum = CONV dec20_2( <ls_exp>-tranam ).
      <ls_ent>-base = <ls_exp>-basac.
      <ls_ent>-source = lo_ref->format_camel( iv_txt = <ls_exp>-sfpwa ).
    ENDLOOP.
  ENDMETHOD.


METHOD refexpensestocks_update_entity.
  io_data_provider->read_entry_data(
    IMPORTING
      es_data = er_entity
  ).
  UPDATE zthr_argus_expn0
    SET
      sectype = er_entity-type
      issuer = er_entity-person
      fvaliab = er_entity-nominal
      total = er_entity-count
      tranam = er_entity-sum
      basac = er_entity-base
      sfpwa = er_entity-source
    WHERE
      docid = er_entity-refid AND lineid = er_entity-lineid.
ENDMETHOD.


METHOD refexpensetransp_delete_entity.
  DATA: ls_input TYPE zcl_zhr_argus_mpc=>ts_refexpensetransport.
  refexpensetransp_get_entityset(
    EXPORTING
      iv_entity_name               = VALUE #( )
      iv_entity_set_name           = VALUE #( )
      iv_source_name               = VALUE #( )
      it_filter_select_options     = VALUE #( )
      is_paging                    = VALUE #( )
      it_key_tab                   = it_key_tab
      it_navigation_path           = VALUE #( )
      it_order                     = VALUE #( )
      iv_filter_string             = VALUE #( )
      iv_search_string             = VALUE #( )
    IMPORTING
      et_entityset                 = DATA(lt_ent)
  ).
  _get_input(
    EXPORTING
      it_key_tab = it_key_tab
    IMPORTING
      es_input   = ls_input
  ).
  TRY.
      DATA(ls_ent) = lt_ent[ seqnr = ls_input-seqnr ].
      DELETE FROM zthr_argus_expn0 WHERE docid = ls_input-refid AND lineid = ls_ent-lineid.
    CATCH cx_sy_itab_line_not_found.
  ENDTRY.
ENDMETHOD.


  METHOD refexpensetransp_get_entityset.
    DATA: ls_input LIKE LINE OF et_entityset.
    _get_input(
      EXPORTING
        it_key_tab               = it_key_tab
        it_filter_select_options = it_filter_select_options
      IMPORTING
        es_input                 = ls_input
    ).
    DATA(lo_ref) = NEW zcl_argus_ref( iv_ref_id = ls_input-refid ).
    DATA(lv_tabix) = VALUE i( ).
    LOOP AT lo_ref->gt_expn0 ASSIGNING FIELD-SYMBOL(<ls_exp>) WHERE trntype IS NOT INITIAL.
      lv_tabix = lv_tabix + 1.
      INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
      <ls_ent>-refid = ls_input-refid.
      <ls_ent>-seqnr = lv_tabix.
      <ls_ent>-lineid = <ls_exp>-lineid.
      <ls_ent>-transporttype = |{ <ls_exp>-trntype } { <ls_exp>-trnbrand } { <ls_exp>-trnmodel }|.
      <ls_ent>-place = <ls_exp>-regplace.
      <ls_ent>-sum = CONV dec20_2( <ls_exp>-tranam ).
      <ls_ent>-base = <ls_exp>-basac.
      <ls_ent>-source = lo_ref->format_camel( iv_txt = <ls_exp>-sfpwa ).
    ENDLOOP.
  ENDMETHOD.


METHOD refexpensetransp_update_entity.
  io_data_provider->read_entry_data(
    IMPORTING
      es_data = er_entity
  ).
  UPDATE zthr_argus_expn0
    SET
      regplace = er_entity-place
      tranam = er_entity-sum
      basac = er_entity-base
      sfpwa = er_entity-source
    WHERE
      docid = er_entity-refid AND lineid = er_entity-lineid.
ENDMETHOD.


METHOD reffinancialset_delete_entity.
  DATA: ls_input TYPE zcl_zhr_argus_mpc=>ts_reffinancial.
  reffinancialset_get_entityset(
    EXPORTING
      iv_entity_name               = VALUE #( )
      iv_entity_set_name           = VALUE #( )
      iv_source_name               = VALUE #( )
      it_filter_select_options     = VALUE #( )
      is_paging                    = VALUE #( )
      it_key_tab                   = it_key_tab
      it_navigation_path           = VALUE #( )
      it_order                     = VALUE #( )
      iv_filter_string             = VALUE #( )
      iv_search_string             = VALUE #( )
    IMPORTING
      et_entityset                 = DATA(lt_ent)
  ).
  _get_input(
    EXPORTING
      it_key_tab = it_key_tab
    IMPORTING
      es_input   = ls_input
  ).
  TRY.
      DATA(ls_ent) = lt_ent[ seqnr = ls_input-seqnr ].
      DELETE FROM zthr_argus_urge0 WHERE docid = ls_input-refid AND lineid = ls_ent-lineid.
    CATCH cx_sy_itab_line_not_found.
  ENDTRY.
ENDMETHOD.


METHOD reffinancialset_get_entityset.
  DATA: ls_input LIKE LINE OF et_entityset.
  _get_input(
    EXPORTING
      it_key_tab               = it_key_tab
      it_filter_select_options = it_filter_select_options
    IMPORTING
      es_input                 = ls_input
  ).
  DATA(lo_ref) = NEW zcl_argus_ref( iv_ref_id = ls_input-refid ).
  DATA(lv_tabix) = VALUE i( ).
  LOOP AT lo_ref->gt_urge0 ASSIGNING FIELD-SYMBOL(<ls_exp>).
    lv_tabix = lv_tabix + 1.
    INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
    <ls_ent>-refid = ls_input-refid.
    <ls_ent>-seqnr = lv_tabix.
    <ls_ent>-lineid = <ls_exp>-lineid.
    <ls_ent>-obligationtype = <ls_exp>-content.
    IF <ls_ent>-obligationtype IS INITIAL AND <ls_exp>-obltype IS NOT INITIAL.
      <ls_ent>-obligationtype = <ls_exp>-obltype.
    ENDIF.
    <ls_ent>-creditor = <ls_exp>-spobl.
    <ls_ent>-base = <ls_exp>-basocc.
    <ls_ent>-sum = CONV dec20_2( <ls_exp>-prinam ).
    IF <ls_exp>-alrptd IS NOT INITIAL.
      CONDENSE <ls_ent>-sum NO-GAPS.
      <ls_ent>-sum = |{ <ls_ent>-sum } / { CONV dec20_2( <ls_exp>-alrptd ) }|.
    ENDIF.
    <ls_ent>-condition = <ls_exp>-oblcond.
  ENDLOOP.
ENDMETHOD.


METHOD reffinancialset_update_entity.
  io_data_provider->read_entry_data(
    IMPORTING
      es_data = er_entity
  ).
  UPDATE zthr_argus_urge0
    SET
      content = er_entity-obligationtype
      spobl = er_entity-creditor
      basocc = er_entity-base
      prinam = er_entity-sum
      oblcond = er_entity-condition
    WHERE
      docid = er_entity-refid AND lineid = er_entity-lineid.
ENDMETHOD.


METHOD refincomeset_delete_entity.
  DATA: ls_input TYPE zcl_zhr_argus_mpc=>ts_refincome.
  refincomeset_get_entityset(
    EXPORTING
      iv_entity_name               = VALUE #( )
      iv_entity_set_name           = VALUE #( )
      iv_source_name               = VALUE #( )
      it_filter_select_options     = VALUE #( )
      is_paging                    = VALUE #( )
      it_key_tab                   = it_key_tab
      it_navigation_path           = VALUE #( )
      it_order                     = VALUE #( )
      iv_filter_string             = VALUE #( )
      iv_search_string             = VALUE #( )
    IMPORTING
      et_entityset                 = DATA(lt_ent)
  ).
  _get_input(
    EXPORTING
      it_key_tab = it_key_tab
    IMPORTING
      es_input   = ls_input
  ).
  TRY.
      DATA(ls_ent) = lt_ent[ seqnr = ls_input-seqnr ].
      DELETE FROM zthr_argus_incm0 WHERE docid = ls_input-refid AND lineid = ls_ent-lineid.
    CATCH cx_sy_itab_line_not_found.
  ENDTRY.
ENDMETHOD.


  METHOD refincomeset_get_entityset.
    DATA: ls_input LIKE LINE OF et_entityset.
    DATA: lv_flag_other TYPE flag.
    _get_input(
      EXPORTING
        it_key_tab               = it_key_tab
        it_filter_select_options = it_filter_select_options
      IMPORTING
        es_input                 = ls_input
    ).
    DATA(lo_ref) = NEW zcl_argus_ref( iv_ref_id = ls_input-refid ).
    LOOP AT lo_ref->gt_incm0 ASSIGNING FIELD-SYMBOL(<ls_income>).
      DATA(lv_tabix) = sy-tabix.
      INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
      <ls_ent>-refid = ls_input-refid.
      <ls_ent>-seqnr = lv_tabix.
      <ls_ent>-lineid = <ls_income>-lineid.
      IF <ls_income>-type = 'ИнойДоход'.
        lv_flag_other = abap_true.
      ENDIF.
      <ls_ent>-incometype = zcl_argus_ref=>format_camel( <ls_income>-type ).
      IF <ls_income>-category IS NOT INITIAL.
        IF <ls_ent>-incometype IS NOT INITIAL.
          DATA(lv_it) = <ls_ent>-incometype.
        ENDIF.
        <ls_ent>-incometype = <ls_income>-category.
        IF lv_it IS NOT INITIAL.
          <ls_ent>-incometype = |{ <ls_ent>-incometype } ({ lv_it })|.
        ENDIF.
      ENDIF.
      <ls_ent>-sum = CONV dec20_2( <ls_income>-amount ).
    ENDLOOP.
    IF lv_flag_other = abap_false.
      INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING <ls_ent>.
      <ls_ent>-incometype = 'Иной Доход'.
      <ls_ent>-sum = 0.
      <ls_ent>-seqnr = lv_tabix + 1.
    ENDIF.
  ENDMETHOD.


METHOD refincomeset_update_entity.
  io_data_provider->read_entry_data(
    IMPORTING
      es_data = er_entity
  ).
  UPDATE zthr_argus_incm0
    SET
      amount = er_entity-sum
    WHERE
      docid = er_entity-refid AND lineid = er_entity-lineid.
ENDMETHOD.


METHOD refobligationset_delete_entity.
  DATA: ls_input TYPE zcl_zhr_argus_mpc=>ts_refobligation.
  refobligationset_get_entityset(
    EXPORTING
      iv_entity_name               = VALUE #( )
      iv_entity_set_name           = VALUE #( )
      iv_source_name               = VALUE #( )
      it_filter_select_options     = VALUE #( )
      is_paging                    = VALUE #( )
      it_key_tab                   = it_key_tab
      it_navigation_path           = VALUE #( )
      it_order                     = VALUE #( )
      iv_filter_string             = VALUE #( )
      iv_search_string             = VALUE #( )
    IMPORTING
      et_entityset                 = DATA(lt_ent)
  ).
  _get_input(
    EXPORTING
      it_key_tab = it_key_tab
    IMPORTING
      es_input   = ls_input
  ).
  TRY.
      DATA(ls_ent) = lt_ent[ seqnr = ls_input-seqnr ].
      DELETE FROM zthr_argus_obli0 WHERE docid = ls_input-refid AND lineid = ls_ent-lineid.
    CATCH cx_sy_itab_line_not_found.
  ENDTRY.
ENDMETHOD.


  METHOD refobligationset_get_entityset.
    DATA: ls_input LIKE LINE OF et_entityset.
    _get_input(
      EXPORTING
        it_key_tab               = it_key_tab
        it_filter_select_options = it_filter_select_options
      IMPORTING
        es_input                 = ls_input
    ).
    DATA(lo_ref) = NEW zcl_argus_ref( iv_ref_id = ls_input-refid ).
    LOOP AT lo_ref->gt_obli0 ASSIGNING FIELD-SYMBOL(<ls_exp>).
      DATA(lv_tabix) = sy-tabix.
      INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
      <ls_ent>-refid = ls_input-refid.
      <ls_ent>-seqnr = lv_tabix.
      <ls_ent>-lineid = <ls_exp>-lineid.
      <ls_ent>-realtytype = <ls_exp>-protype.
      <ls_ent>-period = |{ <ls_exp>-begda } - { <ls_exp>-endda }|.
      IF <ls_exp>-indx IS NOT INITIAL.
        <ls_ent>-address = |{ <ls_exp>-indx },|.
      ENDIF.
      IF <ls_exp>-regio IS NOT INITIAL.
        <ls_ent>-address = |{ <ls_ent>-address } { <ls_exp>-regio },|.
      ENDIF.
      IF <ls_exp>-district IS NOT INITIAL.
        <ls_ent>-address = |{ <ls_ent>-address } { <ls_exp>-district },|.
      ENDIF.
      <ls_ent>-address = |{ <ls_ent>-address } { <ls_exp>-name_city } { <ls_exp>-name_street }|. "{ <ls_exp>-name_house }|.
      <ls_ent>-address = COND #( WHEN <ls_exp>-name_house  IS NOT INITIAL THEN |{ <ls_ent>-address } д.{ <ls_exp>-name_house }|     ELSE <ls_ent>-address ).
      <ls_ent>-address = COND #( WHEN <ls_exp>-name_bldng1 IS NOT INITIAL THEN |{ <ls_ent>-address } корп.{ <ls_exp>-name_bldng1 }| ELSE <ls_ent>-address ).
      <ls_ent>-address = COND #( WHEN <ls_exp>-name_bldng2 IS NOT INITIAL THEN |{ <ls_ent>-address } стр.{ <ls_exp>-name_bldng2 }|  ELSE <ls_ent>-address ).
      <ls_ent>-address = COND #( WHEN <ls_exp>-posta       IS NOT INITIAL THEN |{ <ls_ent>-address } кв. { <ls_exp>-posta }|        ELSE <ls_ent>-address ).
      <ls_ent>-address = COND #( WHEN <ls_exp>-addinfo     IS NOT INITIAL THEN |{ <ls_ent>-address } { <ls_exp>-addinfo }|          ELSE <ls_ent>-address ).
*      <ls_ent>-square = <ls_exp>-area.
      IF <ls_exp>-area IS NOT INITIAL. " Округлим площадь до десятых, как в PDF
        <ls_ent>-square = round( val = <ls_exp>-area  dec = 1 ).
        SHIFT <ls_ent>-square LEFT DELETING LEADING space.
      ENDIF.
      <ls_ent>-base = <ls_exp>-basus.
    ENDLOOP.
  ENDMETHOD.


METHOD refobligationset_update_entity.
  io_data_provider->read_entry_data(
    IMPORTING
      es_data = er_entity
  ).
  SPLIT er_entity-period AT ' - ' INTO DATA(lv_begda) DATA(lv_endda).
  UPDATE zthr_argus_obli0
    SET
      protype = er_entity-realtytype
      begda = lv_begda
      endda = lv_endda
      area = er_entity-square
      basus = er_entity-base
    WHERE
      docid = er_entity-refid AND lineid = er_entity-lineid.
ENDMETHOD.


METHOD refotherstockset_delete_entity.
  DATA: ls_input TYPE zcl_zhr_argus_mpc=>ts_refotherstock.
  refotherstockset_get_entityset(
    EXPORTING
      iv_entity_name               = VALUE #( )
      iv_entity_set_name           = VALUE #( )
      iv_source_name               = VALUE #( )
      it_filter_select_options     = VALUE #( )
      is_paging                    = VALUE #( )
      it_key_tab                   = it_key_tab
      it_navigation_path           = VALUE #( )
      it_order                     = VALUE #( )
      iv_filter_string             = VALUE #( )
      iv_search_string             = VALUE #( )
    IMPORTING
      et_entityset                 = DATA(lt_ent)
  ).
  _get_input(
    EXPORTING
      it_key_tab = it_key_tab
    IMPORTING
      es_input   = ls_input
  ).
  TRY.
      DATA(ls_ent) = lt_ent[ seqnr = ls_input-seqnr ].
      DELETE FROM zthr_argus_osec0 WHERE docid = ls_input-refid AND lineid = ls_ent-lineid.
    CATCH cx_sy_itab_line_not_found.
  ENDTRY.
ENDMETHOD.


METHOD refotherstockset_get_entityset.
  DATA: ls_input LIKE LINE OF et_entityset.
  _get_input(
    EXPORTING
      it_key_tab               = it_key_tab
      it_filter_select_options = it_filter_select_options
    IMPORTING
      es_input                 = ls_input
  ).
  DATA(lo_ref) = NEW zcl_argus_ref( iv_ref_id = ls_input-refid ).
  LOOP AT lo_ref->gt_osec0 ASSIGNING FIELD-SYMBOL(<ls_exp>).
    DATA(lv_tabix) = sy-tabix.
    INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
    <ls_ent>-refid = ls_input-refid.
    <ls_ent>-seqnr = lv_tabix.
    <ls_ent>-lineid = <ls_exp>-lineid.
    <ls_ent>-type = <ls_exp>-sectype.
    <ls_ent>-person = <ls_exp>-issuer.
    <ls_ent>-nominal = <ls_exp>-fvaliab.
    <ls_ent>-count = <ls_exp>-total.
    <ls_ent>-sum = CONV dec20_2( <ls_exp>-totcost ).
  ENDLOOP.
ENDMETHOD.


METHOD refotherstockset_update_entity.
  io_data_provider->read_entry_data(
    IMPORTING
      es_data = er_entity
  ).
  UPDATE zthr_argus_osec0
    SET
      sectype = er_entity-type
      issuer = er_entity-person
      fvaliab = er_entity-nominal
      total = er_entity-count
      totcost = er_entity-sum
    WHERE
      docid = er_entity-refid AND lineid = er_entity-lineid.
ENDMETHOD.


  method REFPERSONALSET_DELETE_ENTITY.
**TRY.
*CALL METHOD SUPER->REFPERSONALSET_DELETE_ENTITY
*  EXPORTING
*    IV_ENTITY_NAME          =
*    IV_ENTITY_SET_NAME      =
*    IV_SOURCE_NAME          =
*    IT_KEY_TAB              =
**    io_tech_request_context =
*    IT_NAVIGATION_PATH      =
*    .
** CATCH /iwbep/cx_mgw_busi_exception .
** CATCH /iwbep/cx_mgw_tech_exception .
**ENDTRY.
  endmethod.


  METHOD refpersonalset_get_entity.
    _get_input(
      EXPORTING
        it_key_tab               = it_key_tab
      IMPORTING
        es_input                 = er_entity
    ).
    DATA(lo_ref) = NEW zcl_argus_ref( iv_ref_id = er_entity-refid ).
    er_entity-info = VALUE #(
      organization = lo_ref->gs_base0-wtcis
      begda = |{ lo_ref->gs_base0-begda DATE = USER }|
      endda = |{ lo_ref->gs_base0-endda DATE = USER }|
      date = |{ lo_ref->gs_base0-orddt DATE = USER }|
      type = lo_ref->gs_base0-issfor
    ).
    er_entity-personal = VALUE #(
      name = |{ lo_ref->gs_pers0-nachn } { lo_ref->gs_pers0-vorna } { lo_ref->gs_pers0-midnm }|
      lastname = lo_ref->gs_pers0-nachn
      firstname = lo_ref->gs_pers0-vorna
      patronymic = lo_ref->gs_pers0-midnm
      dateofbirth = |{ lo_ref->gs_pers0-gbdat DATE = USER }|
      snils = lo_ref->gs_pers0-snils
    ).
    er_entity-job = VALUE #(
     position = lo_ref->gs_work0-posit
     department = lo_ref->gs_work0-name1
     candidate = lo_ref->gs_work0-candidate
    ).
    er_entity-passport = VALUE #(
      seria = lo_ref->gs_pers0-seria
      number = lo_ref->gs_pers0-nomer
      issuer = lo_ref->gs_pers0-wpassl
      date = |{ lo_ref->gs_pers0-datbg DATE = USER }|
    ).
    er_entity-addressreg = VALUE #(
      city = lo_ref->gs_addr0-name_city
      region = lo_ref->gs_addr0-regio
*      destrict = lo_ref->gs_addr0-do
      street = lo_ref->gs_addr0-name_street
      house = lo_ref->gs_addr0-name_house
      building = lo_ref->gs_addr0-name_bldng1
      building2 = lo_ref->gs_addr0-name_bldng2
      addinfo = lo_ref->gs_addr0-addinfo
      apt = lo_ref->gs_addr0-posta
    ).
  ENDMETHOD.


METHOD refpersonalset_update_entity.
  DATA: ls_input LIKE er_entity.
  _get_input(
    EXPORTING
      it_key_tab               = it_key_tab
   IMPORTING
      es_input                 = ls_input
  ).
  io_data_provider->read_entry_data(
    IMPORTING
      es_data = er_entity
  ).
  er_entity-refid = ls_input-refid.
  cl_reca_date=>convert_date_to_internal( EXPORTING id_date_external = er_entity-info-begda IMPORTING ed_date_internal = DATA(lv_begda) ).
  cl_reca_date=>convert_date_to_internal( EXPORTING id_date_external = er_entity-info-endda IMPORTING ed_date_internal = DATA(lv_endda) ).
  cl_reca_date=>convert_date_to_internal( EXPORTING id_date_external = er_entity-info-date IMPORTING ed_date_internal = DATA(lv_orddt) ).
  UPDATE zthr_argus_base0
    SET
      wtcis = er_entity-info-organization
      begda = lv_begda
      endda = lv_endda
      orddt = lv_orddt
      issfor = er_entity-info-type
    WHERE
      docid = er_entity-refid.
  UPDATE zthr_argus_work0
    SET
      posit = er_entity-job-position
      name1 = er_entity-job-department
      candidate = er_entity-job-candidate
    WHERE
      docid = er_entity-refid.
  cl_reca_date=>convert_date_to_internal( EXPORTING id_date_external = er_entity-personal-dateofbirth IMPORTING ed_date_internal = DATA(lv_birth) ).
  cl_reca_date=>convert_date_to_internal( EXPORTING id_date_external = er_entity-passport-date IMPORTING ed_date_internal = DATA(lv_pass_date) ).
  UPDATE zthr_argus_pers0
    SET
      nachn = er_entity-personal-lastname
      vorna = er_entity-personal-firstname
      midnm = er_entity-personal-patronymic
      gbdat = lv_birth
      snils = er_entity-personal-snils
      seria = er_entity-passport-seria
      nomer = er_entity-passport-number
      wpassl = er_entity-passport-issuer
      datbg = lv_pass_date
    WHERE
      docid = er_entity-refid.
  UPDATE zthr_argus_addr0
    SET
      name_city = er_entity-addressreg-city
      regio = er_entity-addressreg-region
      name_street = er_entity-addressreg-street
      name_house = er_entity-addressreg-house
      name_bldng1 = er_entity-addressreg-building
      posta = er_entity-addressreg-apt
    WHERE
      docid = er_entity-refid.
ENDMETHOD.


METHOD refrealtyset_delete_entity.
  DATA: ls_input TYPE zcl_zhr_argus_mpc=>ts_refrealty.
  refrealtyset_get_entityset(
    EXPORTING
      iv_entity_name               = VALUE #( )
      iv_entity_set_name           = VALUE #( )
      iv_source_name               = VALUE #( )
      it_filter_select_options     = VALUE #( )
      is_paging                    = VALUE #( )
      it_key_tab                   = it_key_tab
      it_navigation_path           = VALUE #( )
      it_order                     = VALUE #( )
      iv_filter_string             = VALUE #( )
      iv_search_string             = VALUE #( )
    IMPORTING
      et_entityset                 = DATA(lt_ent)
  ).
  _get_input(
    EXPORTING
      it_key_tab = it_key_tab
    IMPORTING
      es_input   = ls_input
  ).
  TRY.
      DATA(ls_ent) = lt_ent[ seqnr = ls_input-seqnr ].
      DELETE FROM zthr_argus_bldn0 WHERE docid = ls_input-refid AND lineid = ls_ent-lineid.
    CATCH cx_sy_itab_line_not_found.
  ENDTRY.
ENDMETHOD.


  METHOD refrealtyset_get_entityset.
    DATA: ls_input LIKE LINE OF et_entityset.
    _get_input(
      EXPORTING
        it_key_tab               = it_key_tab
        it_filter_select_options = it_filter_select_options
      IMPORTING
        es_input                 = ls_input
    ).
    DATA(lo_ref) = NEW zcl_argus_ref( iv_ref_id = ls_input-refid ).
    DATA(lv_tabix) = VALUE seqnr( ).
    LOOP AT lo_ref->gt_bldn0 ASSIGNING FIELD-SYMBOL(<ls_exp>).
      lv_tabix = lv_tabix + 1.
      INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
      <ls_ent>-refid = ls_input-refid.
      <ls_ent>-seqnr = lv_tabix.
      <ls_ent>-lineid = <ls_exp>-lineid.
      <ls_ent>-realtytype = <ls_exp>-protype.
      IF <ls_exp>-proname <> <ls_exp>-protype.
        <ls_ent>-realtytype = |{ <ls_ent>-realtytype } ({ <ls_exp>-proname })|.
      ENDIF.
      <ls_ent>-property = <ls_exp>-protype2.
      IF <ls_exp>-share2 IS NOT INITIAL.
        <ls_ent>-property = |{ <ls_ent>-property } ({ <ls_exp>-share2 })|.
      ENDIF.
      IF <ls_exp>-share_other IS NOT INITIAL.
        <ls_ent>-property = |{ <ls_ent>-property } ({ <ls_exp>-share_other })|.
      ENDIF.
      <ls_ent>-address = VALUE #(
        country = <ls_exp>-land1
        city = <ls_exp>-name_city
        region = <ls_exp>-regio
        district = <ls_exp>-district
        street = <ls_exp>-name_street
        house =     COND #( WHEN <ls_exp>-name_house  IS NOT INITIAL THEN |д.{ <ls_exp>-name_house }| )
        building =  COND #( WHEN <ls_exp>-name_bldng1 IS NOT INITIAL THEN |корп.{ <ls_exp>-name_bldng1 }| )
        building2 = COND #( WHEN <ls_exp>-name_bldng2 IS NOT INITIAL THEN |стр.{ <ls_exp>-name_bldng2 }| )
        addinfo = <ls_exp>-addinfo
        apt = COND #( WHEN <ls_exp>-posta IS NOT INITIAL THEN |кв.{ <ls_exp>-posta }| )
        index = <ls_exp>-indx
      ).
      <ls_ent>-square = <ls_exp>-area.
      <ls_ent>-base = <ls_exp>-basf.
    ENDLOOP.
    DELETE et_entityset WHERE property IS INITIAL.
    LOOP AT et_entityset ASSIGNING <ls_ent>.
      <ls_ent>-seqnr = sy-tabix.
    ENDLOOP.
  ENDMETHOD.


METHOD refrealtyset_update_entity.
  io_data_provider->read_entry_data(
    IMPORTING
      es_data = er_entity
  ).
  UPDATE zthr_argus_bldn0
    SET
      basf = er_entity-base
      area = er_entity-square
      protype = er_entity-realtytype
      land1 = er_entity-address-country
      name_city = er_entity-address-city
      regio = er_entity-address-region
      name_street = er_entity-address-street
      name_house = er_entity-address-house
      name_bldng1 = er_entity-address-building
      posta = er_entity-address-apt
      indx = er_entity-address-index
    WHERE
      docid = er_entity-refid AND lineid = er_entity-lineid.
ENDMETHOD.


  METHOD refset_delete_entity.
    DATA: ls_input TYPE zcl_zhr_argus_mpc_ext=>ts_ref.
    _get_input(
      EXPORTING
        it_key_tab               = it_key_tab
      IMPORTING
        es_input                 = ls_input
    ).
    NEW zcl_argus_ref( CONV #( ls_input-refid ) )->delete( ).
    DELETE FROM zthr_argus_pdfs WHERE ref_id = ls_input-refid.
  ENDMETHOD.


  METHOD refset_get_entity.
    _get_input(
      EXPORTING
        it_key_tab = it_key_tab
      IMPORTING
        es_input   = er_entity
    ).
    refset_get_entityset(
      EXPORTING
        iv_entity_name               = iv_entity_name
        iv_entity_set_name           = iv_entity_set_name
        iv_source_name               = iv_source_name
        it_filter_select_options     = VALUE #( )
        is_paging                    = VALUE #( )
        it_key_tab                   = it_key_tab
        it_navigation_path           = VALUE #( )
        it_order                     = VALUE #( )
        iv_filter_string             = VALUE #( )
        iv_search_string             = VALUE #( )
      IMPORTING
        et_entityset                 = DATA(lt_ent)
    ).
    ASSIGN lt_ent[ refid = er_entity-refid ] TO FIELD-SYMBOL(<ls_ent>).
    CHECK sy-subrc = 0.
    er_entity = <ls_ent>.
  ENDMETHOD.


  METHOD refset_get_entityset.
    DATA: ls_input  LIKE LINE OF et_entityset,
          lr_ref_id TYPE RANGE OF zthr_argus_base0-docid.
    DATA:  lv_role_ggs TYPE boole_d,
           lv_role_gd  TYPE boole_d,
           lv_role_ms  TYPE boole_d.

    _get_roles( EXPORTING io_tech_request_context = io_tech_request_context
                 IMPORTING ev_role_gd = lv_role_gd
                          ev_role_ggs = lv_role_ggs
                           ev_role_ms = lv_role_ms ).
    _get_input(
      EXPORTING
        it_key_tab = it_key_tab
      IMPORTING
        es_input   = ls_input
    ).
    IF ls_input-refid IS NOT INITIAL.
      lr_ref_id = VALUE #( ( sign = 'I' option = 'EQ' low = ls_input-refid ) ).
      SELECT * FROM zthr_argus_base0 INTO TABLE @DATA(lt_base)
        WHERE docid IN @lr_ref_id.
    ELSE.
      SELECT * FROM zthr_argus_base0 INTO TABLE @lt_base
        WHERE status = @zcl_argus_ref=>gs_status-approved.
    ENDIF.

*    SELECT * FROM zthr_argus_pdfs INTO TABLE @DATA(lt_pdf).
    "   Изменим запрос, чтобы сократить время обработки
    SELECT ref_id FROM zthr_argus_pdfs INTO TABLE @DATA(lt_pdf).

    LOOP AT lt_base ASSIGNING FIELD-SYMBOL(<ls_base>).
      DATA(lo_ref) = NEW zcl_argus_ref( CONV #( <ls_base>-docid ) ).
*      CHECK NOT line_exists( et_entityset[ user-pernr = lo_ref->gs_pers0-pernr year = <ls_base>-begda(4) ] ).

      CALL METHOD zcl_hr_data=>get_plans
        EXPORTING
          i_pernr = CONV pernr_d( lo_ref->gs_pers0-pernr )
          i_begda = sy-datum
        IMPORTING
          e_plans = DATA(lv_plans)
          e_werks = DATA(lv_werks).
      DATA(lv_p1) = VALUE char1( ).
      zcl_hr_data=>get_plans_param(
        EXPORTING
          i_plans  = lv_plans
        IMPORTING
          e_param1 = lv_p1
      ).
*     проверка должностей по ролям
*      IF lv_werks NE gc_werks_zz01 AND lv_werks NE gc_werks_168.
      CHECK ( lv_p1 = '1' AND lv_role_gd = abap_true )
         OR ( lv_p1 = '2' AND lv_role_ggs EQ abap_true )
         OR ( ( lv_p1 = '3' OR lv_werks = gc_werks_zz01 OR lv_werks = gc_werks_168 ) AND lv_role_ms = abap_true ).
*           OR ( lv_p1 = '3' AND lv_role_ms = abap_true ).
*      ENDIF.
      INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
      <ls_ent>-refid = <ls_base>-docid.

      READ TABLE lt_pdf  WITH KEY ref_id = ls_input-refid TRANSPORTING NO FIELDS.
      IF sy-subrc = 0.
        <ls_ent>-refexist = abap_true.
      ELSE.
        <ls_ent>-refexist = abap_false.
      ENDIF.

      <ls_ent>-user = VALUE #(
        pernr = lo_ref->gs_pers0-pernr
        name = |{ lo_ref->gs_pers0-nachn } { lo_ref->gs_pers0-vorna } { lo_ref->gs_pers0-midnm }|
        position = lo_ref->gs_work0-posit
        oiv = lo_ref->gs_work0-name1
      ).
      <ls_ent>-year = <ls_base>-begda(4).
      <ls_ent>-ispaper = <ls_base>-spaper.
      <ls_ent>-iselectro = <ls_base>-sdigit.
      <ls_ent>-dateofprint = |{ <ls_base>-ordst DATE = USER }|.
      <ls_ent>-dateofupload = |{ <ls_base>-aedtm DATE = USER }|.
      <ls_ent>-helpcriterion = <ls_ent>-type = SWITCH #( <ls_base>-stype WHEN 'U' THEN 'Уточняющая' ELSE 'Основная' )..
      lo_ref->has_sub_ref(
        IMPORTING
          es_res = DATA(ls_res)
        RECEIVING
          rv_ok  = <ls_ent>-hassub
      ).
      <ls_ent>-relcount = VALUE #(
        wife = ls_res-wife
        wifename = ls_res-wifename
        husband = ls_res-husband
        husbandname = ls_res-husbandname
        child = ls_res-children
        childname = ls_res-childname
      ).
      <ls_ent>-isapproved = boolc( <ls_base>-status = lo_ref->gs_status-approved ).
      <ls_ent>-isrejected = boolc( <ls_base>-status = lo_ref->gs_status-rejected ).
      IF lo_ref->gs_pers0-idfam IS NOT INITIAL.
        <ls_ent>-relation = cl_hr_t591s=>read( infty = '0021' subty = CONV #( lo_ref->gs_pers0-idfam+16(2) ) )-stext.
      ENDIF.
    ENDLOOP.
    SORT et_entityset BY user-pernr year helpcriterion relation.
    DATA(lt_bf) = et_entityset.
    CLEAR et_entityset.
    LOOP AT lt_bf ASSIGNING <ls_ent>.
      CHECK NOT line_exists( et_entityset[ user-pernr = <ls_ent>-user-pernr year = <ls_ent>-year ] ).
      INSERT <ls_ent> INTO TABLE et_entityset.
    ENDLOOP.
    SORT et_entityset BY user-name year.
  ENDMETHOD.


METHOD refstockset_delete_entity.
  DATA: ls_input TYPE zcl_zhr_argus_mpc=>ts_refstock.
  refstockset_get_entityset(
    EXPORTING
      iv_entity_name               = VALUE #( )
      iv_entity_set_name           = VALUE #( )
      iv_source_name               = VALUE #( )
      it_filter_select_options     = VALUE #( )
      is_paging                    = VALUE #( )
      it_key_tab                   = it_key_tab
      it_navigation_path           = VALUE #( )
      it_order                     = VALUE #( )
      iv_filter_string             = VALUE #( )
      iv_search_string             = VALUE #( )
    IMPORTING
      et_entityset                 = DATA(lt_ent)
  ).
  _get_input(
    EXPORTING
      it_key_tab = it_key_tab
    IMPORTING
      es_input   = ls_input
  ).
  TRY.
      DATA(ls_ent) = lt_ent[ seqnr = ls_input-seqnr ].
      DELETE FROM zthr_argus_secu0 WHERE docid = ls_input-refid AND lineid = ls_ent-lineid.
    CATCH cx_sy_itab_line_not_found.
  ENDTRY.
ENDMETHOD.


  METHOD refstockset_get_entityset.
    DATA: ls_input LIKE LINE OF et_entityset.
    _get_input(
      EXPORTING
        it_key_tab               = it_key_tab
        it_filter_select_options = it_filter_select_options
      IMPORTING
        es_input                 = ls_input
    ).
    DATA(lo_ref) = NEW zcl_argus_ref( iv_ref_id = ls_input-refid ).
    LOOP AT lo_ref->gt_secu0 ASSIGNING FIELD-SYMBOL(<ls_exp>).
      DATA(lv_tabix) = sy-tabix.
      INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
      <ls_ent>-refid = ls_input-refid.
      <ls_ent>-seqnr = lv_tabix.
      <ls_ent>-lineid = <ls_exp>-lineid.
      <ls_ent>-name = |{ <ls_exp>-orglform } { <ls_exp>-name1 }|.
      <ls_ent>-capital = <ls_exp>-autcap.
      <ls_ent>-sum = <ls_exp>-total.
      IF <ls_exp>-shnum IS NOT INITIAL.
        <ls_ent>-share = |{ <ls_exp>-shnum } акций по { <ls_exp>-valsh } на сумму { <ls_exp>-total }|.
      ELSEIF <ls_exp>-total IS NOT INITIAL.
        <ls_ent>-share = |{ <ls_exp>-total }|.
      ENDIF.
      <ls_ent>-base = <ls_exp>-baspart.
      <ls_ent>-address = VALUE #(
        country = <ls_exp>-land1
        city = <ls_exp>-name_city
        region = <ls_exp>-regio
        street = <ls_exp>-name_street
*        house = <ls_exp>-name_house
*        building = <ls_exp>-name_bldng1
        house =     COND #( WHEN <ls_exp>-name_house  IS NOT INITIAL THEN |д.{ <ls_exp>-name_house }| )
        building =  COND #( WHEN <ls_exp>-name_bldng1 IS NOT INITIAL THEN |корп.{ <ls_exp>-name_bldng1 }| )
        building2 = COND #( WHEN <ls_exp>-name_bldng2 IS NOT INITIAL THEN |стр.{ <ls_exp>-name_bldng2 }| )
        addinfo = <ls_exp>-addinfo
        apt = <ls_exp>-posta
        index = <ls_exp>-indx
      ).
    ENDLOOP.
  ENDMETHOD.


METHOD refstockset_update_entity.
  io_data_provider->read_entry_data(
    IMPORTING
      es_data = er_entity
  ).
  SPLIT er_entity-name AT space INTO DATA(lv_orgform) DATA(lv_name).
  UPDATE zthr_argus_secu0
    SET
      orglform = lv_orgform
      name1 = lv_name
      autcap = er_entity-capital
      baspart = er_entity-base
      land1 = er_entity-address-country
      name_city = er_entity-address-city
      regio = er_entity-address-region
      name_street = er_entity-address-street
      name_house = er_entity-address-house
      name_bldng1 = er_entity-address-building
      posta = er_entity-address-apt
      indx = er_entity-address-index
    WHERE
      docid = er_entity-refid AND lineid = er_entity-lineid.
ENDMETHOD.


METHOD reftransportset_delete_entity.
  DATA: ls_input TYPE zcl_zhr_argus_mpc=>ts_reftransport.
  reftransportset_get_entityset(
    EXPORTING
      iv_entity_name               = VALUE #( )
      iv_entity_set_name           = VALUE #( )
      iv_source_name               = VALUE #( )
      it_filter_select_options     = VALUE #( )
      is_paging                    = VALUE #( )
      it_key_tab                   = it_key_tab
      it_navigation_path           = VALUE #( )
      it_order                     = VALUE #( )
      iv_filter_string             = VALUE #( )
      iv_search_string             = VALUE #( )
    IMPORTING
      et_entityset                 = DATA(lt_ent)
  ).
  _get_input(
    EXPORTING
      it_key_tab = it_key_tab
    IMPORTING
      es_input   = ls_input
  ).
  TRY.
      DATA(ls_ent) = lt_ent[ seqnr = ls_input-seqnr ].
      DELETE FROM zthr_argus_tran0 WHERE docid = ls_input-refid AND lineid = ls_ent-lineid.
    CATCH cx_sy_itab_line_not_found.
  ENDTRY.
ENDMETHOD.


  METHOD reftransportset_get_entityset.
    DATA: ls_input LIKE LINE OF et_entityset.
    _get_input(
      EXPORTING
        it_key_tab               = it_key_tab
        it_filter_select_options = it_filter_select_options
      IMPORTING
        es_input                 = ls_input
    ).
    DATA(lo_ref) = NEW zcl_argus_ref( iv_ref_id = ls_input-refid ).
    LOOP AT lo_ref->gt_tran0 ASSIGNING FIELD-SYMBOL(<ls_exp>).
      DATA(lv_tabix) = sy-tabix.
      INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
      <ls_ent>-refid = ls_input-refid.
      <ls_ent>-seqnr = lv_tabix.
      <ls_ent>-lineid = <ls_exp>-lineid.
      <ls_ent>-type = <ls_exp>-trntype.
      <ls_ent>-name = <ls_exp>-estate.
      <ls_ent>-brand = <ls_exp>-trnbrand.
      <ls_ent>-model = <ls_exp>-trnmodel.
      <ls_ent>-year = <ls_exp>-yemanu.
      <ls_ent>-propertytype = <ls_exp>-protype.
      IF <ls_exp>-share2 IS NOT INITIAL.
        <ls_ent>-propertytype = |{ <ls_ent>-propertytype } ({ <ls_exp>-share2 })|.
      ENDIF.
      IF <ls_exp>-share_other IS NOT INITIAL.
        <ls_ent>-propertytype = |{ <ls_ent>-propertytype } ({ <ls_exp>-share_other })|.
      ENDIF.
      <ls_ent>-place = <ls_exp>-regplace.
    ENDLOOP.
  ENDMETHOD.


METHOD reftransportset_update_entity.
  io_data_provider->read_entry_data(
    IMPORTING
      es_data = er_entity
  ).
  UPDATE zthr_argus_tran0
    SET
      regplace = er_entity-place
      protype = er_entity-propertytype
      trntype = er_entity-type
      estate = er_entity-name
      trnbrand = er_entity-brand
      trnmodel = er_entity-model
      yemanu = er_entity-year
    WHERE
      docid = er_entity-refid AND lineid = er_entity-lineid.
ENDMETHOD.


  METHOD refutildigrights_get_entityset.
    DATA: ls_input LIKE LINE OF et_entityset.
    _get_input(
      EXPORTING
        it_key_tab               = it_key_tab
        it_filter_select_options = it_filter_select_options
      IMPORTING
        es_input                 = ls_input
    ).
    DATA(lo_ref) = NEW zcl_argus_ref( iv_ref_id = ls_input-refid ).
*    LOOP AT lo_ref->gt_tran0 ASSIGNING FIELD-SYMBOL(<ls_exp>).
*      DATA(lv_tabix) = sy-tabix.
*      INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
*      <ls_ent>-refid = ls_input-refid.
*      <ls_ent>-seqnr = lv_tabix.
*      <ls_ent>-lineid = <ls_exp>-lineid.
*      <ls_ent>-type = <ls_exp>-trntype.
*      <ls_ent>-name = <ls_exp>-estate.
*      <ls_ent>-brand = <ls_exp>-trnbrand.
*      <ls_ent>-model = <ls_exp>-trnmodel.
*      <ls_ent>-year = <ls_exp>-yemanu.
*    ENDLOOP.
  ENDMETHOD.


  METHOD rejectrefset_get_entityset.
    DATA: lv_role_gd  TYPE boole_d,
          lv_role_ggs TYPE boole_d,
          lv_role_ms  TYPE boole_d.

    _get_roles( EXPORTING io_tech_request_context = io_tech_request_context
                IMPORTING ev_role_gd = lv_role_gd
                         ev_role_ggs = lv_role_ggs
                          ev_role_ms = lv_role_ms ).
    SELECT * FROM zthr_argus_base0 INTO TABLE @DATA(lt_base)
      WHERE status = @zcl_argus_ref=>gs_status-rejected.
    LOOP AT lt_base ASSIGNING FIELD-SYMBOL(<ls_base>).
      DATA(lo_ref) = NEW zcl_argus_ref( CONV #( <ls_base>-docid ) ).

      CALL METHOD zcl_hr_data=>get_plans
        EXPORTING
          i_pernr = CONV pernr_d( lo_ref->gs_pers0-pernr )
          i_begda = sy-datum
        IMPORTING
          e_plans = DATA(lv_plans).
      DATA(lv_p1) = VALUE char1( ).
      zcl_hr_data=>get_plans_param(
        EXPORTING
          i_plans  = lv_plans
        IMPORTING
          e_param1 = lv_p1
      ).

      IF lv_p1 IS NOT INITIAL.
        CHECK ( lv_p1 = '1' AND lv_role_gd = abap_true )
           OR ( lv_p1 = '2' AND lv_role_ggs EQ abap_true )
           OR ( lv_p1 = '3' AND lv_role_ms = abap_true ).
      ENDIF.
      INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
      <ls_ent>-refid = <ls_base>-docid.
      <ls_ent>-user = VALUE #(
        pernr = lo_ref->gs_pers0-pernr
        name = |{ lo_ref->gs_pers0-nachn } { lo_ref->gs_pers0-vorna } { lo_ref->gs_pers0-midnm }|
        position = lo_ref->gs_work0-posit
        oiv = lo_ref->gs_work0-name1
      ).
      <ls_ent>-year = <ls_base>-begda(4).
      <ls_ent>-ispaper = <ls_base>-spaper.
      <ls_ent>-iselectro = <ls_base>-sdigit.
      <ls_ent>-helpcriterion = <ls_ent>-type = SWITCH #( <ls_base>-stype WHEN 'U' THEN 'Уточняющая' ELSE 'Основная' ).
      <ls_ent>-hassub = abap_false.
      <ls_ent>-relcount = VALUE #( ).
      <ls_ent>-dateofprint = |{ <ls_base>-ordst DATE = USER }|.
      <ls_ent>-dateofupload = |{ <ls_base>-aedtm DATE = USER }|.
      IF lo_ref->gs_pers0-idfam IS NOT INITIAL.
        <ls_ent>-relation = cl_hr_t591s=>read( infty = '0021' subty = CONV #( lo_ref->gs_pers0-idfam+16(2) ) )-stext.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.


  METHOD relativeset_create_entity.
    TRY.
        io_data_provider->read_entry_data(
          IMPORTING
            es_data = er_entity
        ).
      CATCH /iwbep/cx_mgw_tech_exception.
    ENDTRY.
    SELECT * FROM t591s INTO TABLE @DATA(lt_txt) WHERE infty = '0021'.
    CHECK er_entity-pernr <> 'new'.
    cl_reca_date=>convert_date_to_internal( EXPORTING id_date_external = er_entity-dateofbirth IMPORTING ed_date_internal = DATA(lv_birth) ).
    DATA(ls_0021) = VALUE p0021(
      infty = '0021'
      pernr = er_entity-pernr
      begda = sy-datum
      endda = hr_high_date
      fanam = er_entity-lastname
      favor = er_entity-firstname
      fnac2 = er_entity-patronymic
      fgbdt = lv_birth
      subty = VALUE #( lt_txt[ stext = er_entity-type ]-subty DEFAULT 70 )
      zzformer = er_entity-former
    ).
    IF er_entity-address IS NOT INITIAL.
      ls_0021-zzaddress = _save_addr_internal(
          is_key      = CORRESPONDING #( ls_0021 )
          is_addr     = _to_addr_internal( is_addr = er_entity-address )
      ).
    ENDIF.
    IF er_entity-job IS NOT INITIAL.
      ls_0021-zzwork = _save_addr_internal(
          is_key      = CORRESPONDING #( ls_0021 )
          is_addr     = _to_addr_internal( is_addr = er_entity-job )
      ).
    ENDIF.
    DATA(ls_return) = VALUE bapireturn1( ).
    CALL FUNCTION 'HR_EMPLOYEE_ENQUEUE'
      EXPORTING
        number = CONV pernr_d( er_entity-pernr ).
    CALL FUNCTION 'HR_INFOTYPE_OPERATION'
      EXPORTING
        infty         = '0021'
        number        = CONV pernr_d( er_entity-pernr )
        validityend   = ls_0021-begda
        validitybegin = ls_0021-endda
        record        = ls_0021
        operation     = 'INS'
      IMPORTING
        return        = ls_return.
    IF ls_return-type = 'E'.
      RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception
        EXPORTING
          textid = VALUE #(
            msgid = ls_return-id
            msgno = ls_return-number
            attr1 = ls_return-message_v1
            attr2 = ls_return-message_v2
            attr3 = ls_return-message_v3
            attr4 = ls_return-message_v4
          ).
    ENDIF.
    CALL FUNCTION 'HR_EMPLOYEE_DEQUEUE'
      EXPORTING
        number = CONV pernr_d( er_entity-pernr ).
  ENDMETHOD.


  METHOD relativeset_delete_entity.
    DATA: BEGIN OF ls_seqnr,
            subty TYPE char2,
            begda TYPE datum,
            endda TYPE datum,
            objps TYPE p0021-objps,
            seqnr TYPE seqnr,
          END OF ls_seqnr.
    DATA: ls_key TYPE zcl_zhr_argus_mpc=>ts_relative.
    _get_input(
      EXPORTING
        it_key_tab = it_key_tab
      IMPORTING
        es_input   = ls_key
    ).
    ls_seqnr = ls_key-seqnr.
    CHECK ls_key-pernr <> 'new'.
    SELECT SINGLE * FROM pa0021 INTO @DATA(ls_0021)
       WHERE pernr = @ls_key-pernr
      AND subty = @ls_seqnr-subty
      AND begda = @ls_seqnr-begda
      AND endda = @ls_seqnr-endda
      AND objps = @ls_seqnr-objps
      AND seqnr = @ls_seqnr-seqnr.
    CHECK sy-subrc = 0.
    DELETE pa0021 FROM ls_0021.
    DELETE FROM pa0106 WHERE
      pernr = ls_key-pernr
      AND subty = ls_seqnr-subty
      AND begda = ls_seqnr-begda
      AND endda = ls_seqnr-endda
      AND objps = ls_seqnr-objps
      AND seqnr = ls_seqnr-seqnr.
  ENDMETHOD.


  METHOD relativeset_get_entity.
    _get_input(
      EXPORTING
        it_key_tab = it_key_tab
      IMPORTING
        es_input   = er_entity
    ).
  ENDMETHOD.


  METHOD relativeset_get_entityset.
    DATA: ls_input LIKE LINE OF et_entityset,
          lt_adrc  TYPE TABLE OF adrc.
    _get_input(
      EXPORTING
        it_key_tab               = it_key_tab
        it_filter_select_options = it_filter_select_options
      IMPORTING
        es_input                 = ls_input
    ).
    SET LOCALE LANGUAGE 'R'.
    IF ls_input-pernr <> 'new'.
      SELECT * FROM pa0021 INTO TABLE @DATA(lt_0021) WHERE pernr = @ls_input-pernr.
    ENDIF.
    LOOP AT lt_0021 ASSIGNING FIELD-SYMBOL(<ls_0021>) WHERE subty IN gr_relative_type.
      INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
      <ls_ent>-pernr = ls_input-pernr.
      <ls_ent>-seqnr = |{ <ls_0021>-subty }{ <ls_0021>-begda }{ <ls_0021>-endda }{ <ls_0021>-objps }{ <ls_0021>-seqnr }|.
      <ls_ent>-lastname = <ls_0021>-fanam.
      <ls_ent>-firstname = <ls_0021>-favor.
      <ls_ent>-patronymic = <ls_0021>-fnac2.
      <ls_ent>-dateofbirth = |{ <ls_0021>-fgbdt DATE = USER }|.
      <ls_ent>-type = cl_hr_t591s=>read( infty = '0021' subty = <ls_0021>-subty )-stext.
      <ls_ent>-action = VALUE #( edit = abap_true delete = abap_true ).
      <ls_ent>-former = <ls_0021>-zzformer.
      IF <ls_0021>-zzaddress IS NOT INITIAL.
        CLEAR lt_adrc.
        CALL FUNCTION 'ADDR_SELECT_ADRC_SINGLE'
          EXPORTING
            addrnumber = <ls_0021>-zzaddress
          TABLES
            et_adrc    = lt_adrc
          EXCEPTIONS
            OTHERS     = 0.
        ASSIGN lt_adrc[ 1 ] TO FIELD-SYMBOL(<ls_adrc>).
        IF sy-subrc = 0.
          <ls_ent>-address-companyname = <ls_adrc>-name1.
          <ls_ent>-address-country = <ls_adrc>-country.
          <ls_ent>-address-city = <ls_adrc>-city1.
          <ls_ent>-address-region = cl_hr_t005u=>read( land1 = <ls_adrc>-country bland = <ls_adrc>-region )-bezei.
          <ls_ent>-address-street = <ls_adrc>-street.
          <ls_ent>-address-house = <ls_adrc>-house_num1.
          <ls_ent>-address-building = <ls_adrc>-building.
          <ls_ent>-address-apt = <ls_adrc>-roomnumber.
          <ls_ent>-address-index = <ls_adrc>-post_code1.
        ENDIF.
      ENDIF.
      IF <ls_0021>-zzwork IS NOT INITIAL.
        CLEAR lt_adrc.
        CALL FUNCTION 'ADDR_SELECT_ADRC_SINGLE'
          EXPORTING
            addrnumber = <ls_0021>-zzwork
          TABLES
            et_adrc    = lt_adrc
          EXCEPTIONS
            OTHERS     = 0.
        ASSIGN lt_adrc[ 1 ] TO <ls_adrc>.
        IF sy-subrc = 0.
          <ls_ent>-job-companyname = <ls_adrc>-name1.
          <ls_ent>-job-country = <ls_adrc>-country.
          <ls_ent>-job-city = <ls_adrc>-city1.
          <ls_ent>-job-region = cl_hr_t005u=>read( land1 = <ls_adrc>-country bland = <ls_adrc>-region )-bezei.
          <ls_ent>-job-street = <ls_adrc>-street.
          <ls_ent>-job-house = <ls_adrc>-house_num1.
          <ls_ent>-job-building = <ls_adrc>-building.
          <ls_ent>-job-apt = <ls_adrc>-roomnumber.
          <ls_ent>-job-index = <ls_adrc>-post_code1.
        ENDIF.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.


  METHOD relativeset_update_entity.
    DATA: BEGIN OF ls_seqnr,
            subty TYPE char2,
            begda TYPE datum,
            endda TYPE datum,
            objps TYPE p0021-objps,
            seqnr TYPE seqnr,
          END OF ls_seqnr.
    DATA: ls_key TYPE zcl_zhr_argus_mpc=>ts_relative.
    DATA: lv_objps TYPE string,
          lv_seqnr TYPE string.

    _get_input(
      EXPORTING
        it_key_tab = it_key_tab
      IMPORTING
        es_input   = ls_key
    ).
    TRY.
        io_data_provider->read_entry_data(
          IMPORTING
            es_data = er_entity
        ).
      CATCH /iwbep/cx_mgw_tech_exception.
    ENDTRY.
    er_entity-pernr = ls_key-pernr.
    er_entity-seqnr = ls_key-seqnr.
    ls_seqnr = ls_key-seqnr.
    CHECK ls_key-pernr <> 'new'.
    lv_objps = COND #( WHEN ls_seqnr-objps EQ '00' THEN '' ELSE ls_seqnr-objps ).
    lv_seqnr = COND #( WHEN ls_seqnr-seqnr EQ '0' OR ls_seqnr-seqnr EQ '00' THEN '000' ELSE ls_seqnr-seqnr ).

    SELECT SINGLE * FROM pa0021 INTO @DATA(ls_0021)
       WHERE pernr = @er_entity-pernr
        AND subty = @ls_seqnr-subty
        AND begda = @ls_seqnr-begda
        AND endda = @ls_seqnr-endda
        AND objps = @lv_objps
        AND seqnr = @lv_seqnr.
    CHECK sy-subrc = 0.
    cl_reca_date=>convert_date_to_internal( EXPORTING id_date_external = er_entity-dateofbirth IMPORTING ed_date_internal = DATA(lv_fgbdt) ).
    IF er_entity-address IS NOT INITIAL.
      ls_0021-zzaddress = _save_addr_internal(
          iv_addr_num = ls_0021-zzaddress
          is_key      = CORRESPONDING #( ls_0021 )
          is_addr     = _to_addr_internal( is_addr = er_entity-address )
      ).
    ENDIF.
    IF er_entity-job IS NOT INITIAL.
      ls_0021-zzwork = _save_addr_internal(
          iv_addr_num = ls_0021-zzwork
          is_key      = CORRESPONDING #( ls_0021 )
          is_addr     = _to_addr_internal( is_addr = er_entity-job )
      ).
    ENDIF.
    UPDATE pa0021 SET
      fanam = er_entity-lastname
      favor = er_entity-firstname
      fnac2 = er_entity-patronymic
      fgbdt = lv_fgbdt
      zzformer = er_entity-former
      zzaddress = ls_0021-zzaddress
      zzwork = ls_0021-zzwork
    WHERE pernr = ls_0021-pernr
      AND subty = ls_0021-subty
      AND begda = ls_0021-begda
      AND endda = ls_0021-endda
      AND objps = ls_0021-objps
      AND seqnr = ls_0021-seqnr.
  ENDMETHOD.


 METHOD relativesubtyset_get_entityset.
   SET LOCALE LANGUAGE 'R'.
   SELECT * FROM t591s AS text
     INNER JOIN t591a AS type
     ON type~infty = text~infty
     AND type~subty = text~subty
     INTO TABLE @DATA(lt_level)
     WHERE text~sprsl = @sy-langu
     AND text~infty = '0021'.
   DELETE lt_level WHERE text-subty NOT IN gr_relative_type.
   et_entityset = VALUE #( FOR ls_level IN lt_level ( text = ls_level-text-stext ) ).
 ENDMETHOD.


  METHOD reportset_get_entityset.

    TYPES: BEGIN OF ts_corrupt.
            INCLUDE TYPE p9110.
    TYPES:  plans_subs TYPE flag,
            plans_ggs  TYPE flag,
            plans_head TYPE flag,
            END OF ts_corrupt.

    DATA: ls_input   LIKE LINE OF et_entityset,
          lt_corrupt TYPE TABLE OF ts_corrupt.
    DATA: lv_role_gd  TYPE boole_d,
          lv_role_ggs TYPE boole_d,
          lv_role_ms  TYPE boole_d.

    _get_input(
      EXPORTING
        it_key_tab               = it_key_tab
        it_filter_select_options = it_filter_select_options
      IMPORTING
        es_input                 = ls_input
    ).
    IF ls_input-withvacancy = abap_true OR ls_input-byplans = abap_true.
      SELECT * FROM hrp9110 INTO CORRESPONDING FIELDS OF TABLE @lt_corrupt WHERE corrupt = @abap_true." AND begda <= @ls_input-date AND endda >= @ls_input-date.
      LOOP AT lt_corrupt ASSIGNING FIELD-SYMBOL(<ls_corrupt>).
        DATA(lv_p1) = VALUE char1( ).
        zcl_hr_data=>get_plans_param(
          EXPORTING
            i_plans  = <ls_corrupt>-objid
          IMPORTING
            e_param1 = lv_p1
        ).
        CASE lv_p1.
          WHEN '1'.
            <ls_corrupt>-plans_subs = abap_true.
          WHEN '2'.
            <ls_corrupt>-plans_ggs = abap_true.
          WHEN '3'.
            <ls_corrupt>-plans_head = abap_true.
        ENDCASE.
      ENDLOOP.
    ENDIF.
    DATA(lo_search) = NEW zcl_argus_search( ).
    lo_search->add_filter( is_filter = VALUE #( name = 'NEED_REF' value = abap_true ) ).
    SPLIT ls_input-reportid AT '~' INTO DATA(lv_cat) DATA(lv_report).
    CASE lv_cat.
      WHEN 'governmentCivilServants'.
        lo_search->add_filter( is_filter = VALUE #( name = 'PLANS_GGS' value = abap_true ) ).
        DELETE lt_corrupt WHERE plans_ggs <> abap_true.
      WHEN 'personsHoldingPublicOffice'.
        lo_search->add_filter( is_filter = VALUE #( name = 'PLANS_SUBS' value = abap_true ) ).
        DELETE lt_corrupt WHERE plans_subs <> abap_true.
      WHEN 'headsOfMunicipalities'.
        lo_search->add_filter( is_filter = VALUE #( name = 'PLANS_HEAD' value = abap_true ) ).
        DELETE lt_corrupt WHERE plans_head <> abap_true.
      WHEN 'requiredIncome'. "Обязанных предоставить
        _get_roles( EXPORTING io_tech_request_context = io_tech_request_context
            IMPORTING ev_role_gd = lv_role_gd
                     ev_role_ggs = lv_role_ggs
                      ev_role_ms = lv_role_ms ).
        IF lv_role_gd NE abap_true OR lv_role_ggs NE abap_true OR lv_role_ms NE abap_true.
          IF lv_role_gd EQ abap_true.
            DATA(lt_search_gd) = _get_role_table( EXPORTING iv_role = 'PLANS_SUBS' iv_needref = abap_true ).
          ENDIF.
          IF lv_role_ggs EQ abap_true.
            DATA(lt_search_ggs) = _get_role_table( EXPORTING iv_role = 'PLANS_GGS' iv_needref = abap_true ).
          ENDIF.
          IF lv_role_ms EQ abap_true.
*            DATA(lt_search_ms) = _get_role_table( EXPORTING iv_role = 'PLANS_HEAD' iv_needref = abap_true ).
            " Отберем записи по роли и добавим пользователей с разделом персонала ZZ01 и 0168
            DATA(lt_search) = lo_search->search( ).
            LOOP AT lt_search INTO DATA(ls_search).

              IF ls_search-plans_ggs  IS INITIAL AND
                 ls_search-plans_head IS INITIAL AND
                 ls_search-plans_subs IS INITIAL.

                SELECT SINGLE mandt FROM pa0001 INTO sy-mandt
                    WHERE pernr = ls_search-pernr AND begda <= sy-datum AND endda >= sy-datum
                      AND ( werks = 'ZZ01' OR werks = '0168' ).
                IF sy-subrc <> 0.
                  DELETE TABLE lt_search FROM ls_search.
                ENDIF.
                CONTINUE.
              ENDIF.

              IF NOT ( ( ls_search-plans_head = abap_true AND lv_role_ms = abap_true ) ).
                DELETE TABLE lt_search FROM ls_search.
                CONTINUE.
              ENDIF.

            ENDLOOP.
          ENDIF.
        ELSE.
          DATA(lv_all_roles) = abap_true.
        ENDIF.
    ENDCASE.

    IF lv_cat NE 'requiredIncome' OR lv_all_roles EQ abap_true.
      lt_search = lo_search->search( ).
    ELSE.
      APPEND LINES OF lt_search_gd TO lt_search.
      APPEND LINES OF lt_search_ggs TO lt_search.
*      APPEND LINES OF lt_search_ms TO lt_search.
    ENDIF.
    CASE lv_report.
      WHEN 'requiredIncome'. "Обязанных предоставить
*     по умолчанию
      WHEN 'submittedIncome'. "Предоставившие
        SELECT * FROM zthr_argus_pers0 INTO TABLE @DATA(lt_p).
        LOOP AT lt_search ASSIGNING FIELD-SYMBOL(<ls_search>).
          CHECK NOT line_exists( lt_p[ pernr = <ls_search>-pernr ] ).
          DELETE lt_search.
        ENDLOOP.
      WHEN 'notReportIncome'. "Не предоставившие
        SELECT * FROM zthr_argus_pers0 INTO TABLE @lt_p.
        LOOP AT lt_search ASSIGNING <ls_search>.
          CHECK line_exists( lt_p[ pernr = <ls_search>-pernr ] ).
          DELETE lt_search.
        ENDLOOP.
      WHEN 'partiallyReportedIncome'. "Частично предоставившие
        SELECT * FROM zthr_argus_pers0 INTO TABLE @lt_p.
        LOOP AT lt_search ASSIGNING <ls_search>.
          CHECK NOT line_exists( lt_p[ pernr = <ls_search>-pernr ] ).
          DELETE lt_search.
        ENDLOOP.
      WHEN 'submittedExpense'. "Предоставившие
        SELECT * FROM zthr_argus_pers0 INTO TABLE @lt_p.
        SELECT * FROM zthr_argus_expn0 INTO TABLE @DATA(lt_exp).
        CLEAR lt_search.
*      LOOP AT lt_search ASSIGNING <ls_search>.
*        CHECK NOT line_exists( lt_p[ pernr = <ls_search>-pernr ] ).
*        DELETE lt_search.
*      ENDLOOP.
    ENDCASE.
    LOOP AT lt_search ASSIGNING FIELD-SYMBOL(<ls_ent_in>).
      INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
      <ls_ent>-pernr = <ls_ent_in>-pernr.
      <ls_ent>-user = VALUE #(
        pernr = <ls_ent_in>-pernr
        name = |{ <ls_ent_in>-nachn } { <ls_ent_in>-vorna } { <ls_ent_in>-midnm }|
        plans = <ls_ent_in>-plans
        position = <ls_ent_in>-plans_txt
        oiv = <ls_ent_in>-persa_txt
      ).
      <ls_ent>-photo = <ls_ent_in>-photo.
    ENDLOOP.


    IF ls_input-withvacancy = abap_true.
      LOOP AT lt_corrupt ASSIGNING <ls_corrupt>.
        CHECK NOT line_exists( et_entityset[ user-plans = <ls_corrupt>-objid ] ).
        INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING <ls_ent>.
        <ls_ent>-pernr = <ls_corrupt>-objid.
        <ls_ent>-user = VALUE #(
          pernr = <ls_corrupt>-objid
          name = |Вакансия|
            plans = <ls_corrupt>-objid
*     position = <ls_ent_in>-plans_txt
*     oiv = <ls_ent_in>-persa_txt
        ).
        zcl_hr_data=>get_name_plans(
                 EXPORTING
                   i_plans  = <ls_corrupt>-objid
                 IMPORTING
                   e_sname  = <ls_ent>-user-position
).
        DATA(lv_org_txt) = VALUE stext( ).
        CALL FUNCTION 'HRWPC_PCR_GET_ORGEH_TO_PLANS'
          EXPORTING
            plans      = <ls_corrupt>-objid
            eff_date   = sy-datum
          IMPORTING
*           ORGEH      =
            orgeh_text = lv_org_txt
*           RETURN     =
          .
        <ls_ent>-user-oiv = lv_org_txt.
      ENDLOOP.
    ENDIF.

    IF ls_input-byplans = abap_true.
      CLEAR et_entityset.
      LOOP AT lt_corrupt ASSIGNING <ls_corrupt>.
        CHECK NOT line_exists( et_entityset[ user-plans = <ls_corrupt>-objid ] ).
        INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING <ls_ent>.
        <ls_ent>-pernr = <ls_corrupt>-objid.
        <ls_ent>-user = VALUE #(
          pernr = <ls_corrupt>-objid

            plans = <ls_corrupt>-objid
        position = <ls_corrupt>-objid
*     position = <ls_ent_in>-plans_txt
*     oiv = <ls_ent_in>-persa_txt
        ).
        zcl_hr_data=>get_name_plans(
                 EXPORTING
                   i_plans  = <ls_corrupt>-objid
                 IMPORTING
                   e_sname  = <ls_ent>-user-name
).

        CALL FUNCTION 'HRWPC_PCR_GET_ORGEH_TO_PLANS'
          EXPORTING
            plans      = <ls_corrupt>-objid
            eff_date   = sy-datum
          IMPORTING
*           ORGEH      =
            orgeh_text = lv_org_txt
*           RETURN     =
          .
        <ls_ent>-user-oiv = lv_org_txt.

      ENDLOOP.
    ENDIF.
  ENDMETHOD.


METHOD requestset_create_entity.
  DATA: ls_req TYPE zthr_check_req.
  io_data_provider->read_entry_data(
    IMPORTING
      es_data = er_entity
  ).
  IF er_entity-docid IS INITIAL.
    er_entity-docid = cl_system_uuid=>create_uuid_c32_static( ).
  ENDIF.
  ls_req-docid = er_entity-docid.
  ls_req-subject = er_entity-subject.
  IF strlen( er_entity-outdate ) >= 10.
    ls_req-outdate = |{ er_entity-outdate+6(4) }{ er_entity-outdate+3(2) }{ er_entity-outdate+0(2) }|.
  ENDIF.
  ls_req-template = er_entity-template.
  ls_req-where_ = er_entity-where.
  IF strlen( er_entity-answerdate ) >= 10.
    ls_req-answer_date = |{ er_entity-answerdate+6(4) }{ er_entity-answerdate+3(2) }{ er_entity-answerdate+0(2) }|.
  ENDIF.
  ls_req-orgaddr = er_entity-orgaddr.
  ls_req-checkdocid = er_entity-checkdocid.
  ls_req-group_id = er_entity-groupid.
  MODIFY zthr_check_req FROM ls_req.
ENDMETHOD.


METHOD requestset_get_entity.
  _get_input(
    EXPORTING
      it_key_tab = it_key_tab
    IMPORTING
      es_input   = er_entity
  ).
  SELECT SINGLE * FROM zthr_check_req INTO @DATA(ls_check) WHERE docid = @er_entity-docid.
  CHECK sy-subrc = 0.
  er_entity-docid = ls_check-docid.
  er_entity-subject = ls_check-subject.
  SELECT SINGLE * FROM pa0001 INTO @DATA(ls_subject) WHERE pernr = @ls_check-subject.
  er_entity-subjectname = ls_subject-ename.
  er_entity-outdate = |{ ls_check-outdate DATE = USER }|.
  er_entity-template = |{ ls_check-template }|.
  er_entity-where = ls_check-where_.
  er_entity-answerdate = |{ ls_check-answer_date DATE = USER }|.
  er_entity-orgaddr = ls_check-orgaddr.
  er_entity-checkdocid = ls_check-checkdocid.
  er_entity-isgroup = ls_check-group_req.
ENDMETHOD.


METHOD requestset_get_entityset.
  DATA: lt_check    TYPE TABLE OF zthr_check_req,
        lv_role_ggs TYPE boole_d,
        lv_role_gd  TYPE boole_d,
        lv_role_ms  TYPE boole_d.
  DATA: lt_filters TYPE                   /iwbep/t_mgw_select_option,
        ls_filter  TYPE                   /iwbep/s_mgw_select_option.

  DATA: ls_input  LIKE LINE OF et_entityset.

  _get_input(
        EXPORTING
          it_key_tab               = it_key_tab
          it_filter_select_options = it_filter_select_options
        IMPORTING
          es_input                 = ls_input
      ).

  _get_roles( EXPORTING io_tech_request_context = io_tech_request_context
              IMPORTING ev_role_gd = lv_role_gd
                       ev_role_ggs = lv_role_ggs
                        ev_role_ms = lv_role_ms ).

  CLEAR: lt_check.
  SELECT * FROM zthr_check_req INTO TABLE @DATA(lt_check_temp).
  IF ls_input-checkdocid IS NOT INITIAL.
    DELETE lt_check_temp WHERE checkdocid NE ls_input-checkdocid.
  ENDIF.
  IF sy-subrc = 0.
    LOOP AT lt_check_temp ASSIGNING FIELD-SYMBOL(<ls_check_temp>).
      CALL METHOD zcl_hr_data=>get_plans
        EXPORTING
          i_pernr = <ls_check_temp>-subject
          i_begda = sy-datum
        IMPORTING
          e_plans = DATA(lv_plans).
      DATA(lv_p1) = VALUE char1( ).
      zcl_hr_data=>get_plans_param(
        EXPORTING
          i_plans  = lv_plans
        IMPORTING
          e_param1 = lv_p1
      ).
*     проверка должностей по ролям
      IF lv_p1 IS NOT INITIAL.
        IF lv_p1 = '1' AND lv_role_gd = abap_true.
          APPEND <ls_check_temp> TO lt_check.
        ENDIF.
        IF lv_p1 = '2' AND lv_role_ggs EQ abap_true.
          APPEND <ls_check_temp> TO lt_check.
        ENDIF.
        IF lv_p1 = '3' AND lv_role_ms = abap_true.
          APPEND <ls_check_temp> TO lt_check.
        ENDIF.
      ELSE.
        APPEND <ls_check_temp> TO lt_check.
      ENDIF.
    ENDLOOP.
  ENDIF.

  lt_filters = io_tech_request_context->get_filter( )->get_filter_select_options( ).
  READ TABLE lt_filters WITH TABLE KEY property = 'SUBJECTNAME' INTO ls_filter.
  IF sy-subrc EQ 0.
    LOOP AT ls_filter-select_options INTO DATA(ls_so).
    ENDLOOP.
  ENDIF.

  LOOP AT lt_check ASSIGNING FIELD-SYMBOL(<ls_check>).
    SELECT SINGLE * FROM pa0001 INTO @DATA(ls_subject) WHERE pernr = @<ls_check>-subject AND begda <= @sy-datum AND endda >= @sy-datum.
    IF ls_so-low IS NOT INITIAL.
      CHECK ls_subject-ename = ls_so-low.
    ENDIF.
    INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
    <ls_ent>-docid = <ls_check>-docid.
    <ls_ent>-subject = <ls_check>-subject.
    <ls_ent>-subjectname = ls_subject-ename.
    <ls_ent>-subjectplans = zcl_hr_data_utils=>get_name_obj_1000(
        i_objid = ls_subject-plans
        i_otype = cl_hap_pmp_const=>otype_position
    ).
*    <ls_ent>-subjectoiv = zcl_hr_data_utils=>get_name_obj(
*        i_objid      = ls_subject-orgeh
*        i_otype      = cl_hap_pmp_const=>otype_orgunit
*    ).

    <ls_ent>-subjectoiv = zcl_hr_data_utils=>get_last_but_one_ogreh_name_o(
                    i_otype = cl_hap_pmp_const=>otype_orgunit
                    i_objid = ls_subject-orgeh
                    ).

    IF <ls_ent>-subjectoiv IS INITIAL.
      <ls_ent>-subjectoiv = zcl_hr_data_utils=>get_name_obj_1000(
          i_objid = ls_subject-orgeh
          i_otype = cl_hap_pmp_const=>otype_orgunit
      ).
    ENDIF.
    <ls_ent>-outdate = |{ <ls_check>-outdate DATE = USER }|.
    <ls_ent>-template = |{ <ls_check>-template }|.
    <ls_ent>-where = <ls_check>-where_.
    <ls_ent>-answerdate = |{ <ls_check>-answer_date DATE = USER }|.
    <ls_ent>-orgaddr = <ls_check>-orgaddr.
    <ls_ent>-checkdocid = <ls_check>-checkdocid.
    <ls_ent>-isgroup = <ls_check>-group_req.
  ENDLOOP.
ENDMETHOD.


  METHOD riskset_get_entityset.
    DATA: lt_ref TYPE TABLE OF zcl_zhr_argus_mpc_ext=>ts_ref.
    DATA: ls_refid   TYPE                   /iwbep/s_mgw_select_option,
          lt_filters TYPE                   /iwbep/t_mgw_select_option.
    SET LOCALE LANGUAGE 'R'.

    lt_filters = io_tech_request_context->get_filter( )->get_filter_select_options( ).
    READ TABLE lt_filters WITH TABLE KEY property = 'REFID' INTO ls_refid.
    IF sy-subrc EQ 0.
      READ TABLE ls_refid-select_options INTO DATA(ls_refid_opt) INDEX 1.
    ENDIF.

    IF ls_refid_opt IS INITIAL.
*      SELECT * FROM zthr_argus_base0 INTO TABLE @DATA(lt_base) WHERE status = @zcl_argus_ref=>gs_status-approved.
      SELECT base~*   " Сразу Исключим всех членов семьи
      FROM zthr_argus_base0 AS base
      INNER JOIN zthr_argus_pers0 AS pers
         ON pers~docid = base~docid
        AND pers~idfam = '' "IS NULL"INITIAL
      WHERE base~status = @zcl_argus_ref=>gs_status-approved
      INTO TABLE @DATA(lt_base1).
      IF 1 = 2.
        SELECT * FROM zthr_argus_base0 INTO TABLE @lt_base1 WHERE status = @zcl_argus_ref=>gs_status-approved.
      ENDIF.
      LOOP AT lt_base1 ASSIGNING FIELD-SYMBOL(<ls_base1>).
        DATA(lo_ref1) = NEW zcl_argus_ref( CONV #( <ls_base1>-docid ) ).
        INSERT INITIAL LINE INTO TABLE lt_ref ASSIGNING FIELD-SYMBOL(<ls_ref1>).
        <ls_ref1>-refid = <ls_base1>-docid.
        <ls_ref1>-user = VALUE #(
          pernr = lo_ref1->gs_pers0-pernr
          name = |{ lo_ref1->gs_pers0-nachn } { lo_ref1->gs_pers0-vorna } { lo_ref1->gs_pers0-midnm }|
          position = lo_ref1->gs_work0-posit
          oiv = lo_ref1->gs_work0-name1
        ).
        <ls_ref1>-year = <ls_base1>-begda(4).
        <ls_ref1>-ispaper = <ls_base1>-spaper.
        <ls_ref1>-iselectro = <ls_base1>-sdigit.
        <ls_ref1>-helpcriterion = <ls_ref1>-type = SWITCH #( <ls_base1>-stype WHEN 'U' THEN 'Уточняющая' ELSE 'Основная' ).
        <ls_ref1>-hassub = lo_ref1->has_sub_ref( ).
        <ls_ref1>-relcount = VALUE #( ).
      ENDLOOP.
    ELSE.

      SELECT  base~docid,
              base~begda,
              base~spaper,
              base~sdigit,
              base~stype,
              pers~pernr,
              pers~nachn,
              pers~vorna,
              pers~midnm,
              work~posit,
              work~name1
        FROM zthr_argus_pers0 AS pers
        INNER JOIN zthr_argus_base0 AS base
          ON base~docid = pers~docid
        INNER JOIN zthr_argus_work0 AS work
          ON work~docid = pers~docid
        INNER JOIN zthr_argus_pers0 AS pers_pernr
          ON pers_pernr~docid = @ls_refid_opt-low
        INNER JOIN zthr_argus_base0 AS base_begda
          ON base_begda~docid = @ls_refid_opt-low
        WHERE pers~pernr = pers_pernr~pernr
          AND base~begda = base_begda~begda
          AND base~status = 'A'
        INTO TABLE @DATA(lt_all_ref).

      SORT lt_all_ref BY docid.
      DELETE ADJACENT DUPLICATES FROM lt_all_ref.
      DELETE lt_all_ref WHERE docid = ls_refid_opt-low.

      LOOP AT lt_all_ref ASSIGNING FIELD-SYMBOL(<ls_all_ref>).
        INSERT INITIAL LINE INTO TABLE lt_ref ASSIGNING <ls_ref1>.
        <ls_ref1>-refid = <ls_all_ref>-docid.
        <ls_ref1>-user = VALUE #(
          pernr = <ls_all_ref>-pernr
          name = |{ <ls_all_ref>-nachn } { <ls_all_ref>-vorna } { <ls_all_ref>-midnm }|
          position = <ls_all_ref>-posit
          oiv = <ls_all_ref>-name1
        ).
        <ls_ref1>-year = <ls_all_ref>-begda(4).
        <ls_ref1>-ispaper = <ls_all_ref>-spaper.
        <ls_ref1>-iselectro = <ls_all_ref>-sdigit.
        <ls_ref1>-helpcriterion = <ls_ref1>-type = SWITCH #( <ls_all_ref>-stype WHEN 'U' THEN 'Уточняющая' ELSE 'Основная' ).
*        <ls_ref1>-hassub = lo_ref->has_sub_ref( ).
        <ls_ref1>-relcount = VALUE #( ).
      ENDLOOP.
    ENDIF.

    IF 1 = 2.
      SELECT * FROM zthr_argus_base0 INTO TABLE @DATA(lt_base) WHERE status = @zcl_argus_ref=>gs_status-approved.
      LOOP AT lt_base ASSIGNING FIELD-SYMBOL(<ls_base>).
        DATA(lo_ref) = NEW zcl_argus_ref( CONV #( <ls_base>-docid ) ).
        INSERT INITIAL LINE INTO TABLE lt_ref ASSIGNING FIELD-SYMBOL(<ls_ref>).
        <ls_ref>-refid = <ls_base>-docid.
        <ls_ref>-user = VALUE #(
          pernr = lo_ref->gs_pers0-pernr
          name = |{ lo_ref->gs_pers0-nachn } { lo_ref->gs_pers0-vorna } { lo_ref->gs_pers0-midnm }|
          position = lo_ref->gs_work0-posit
          oiv = lo_ref->gs_work0-name1
        ).
        <ls_ref>-year = <ls_base>-begda(4).
        <ls_ref>-ispaper = <ls_base>-spaper.
        <ls_ref>-iselectro = <ls_base>-sdigit.
        <ls_ref>-helpcriterion = <ls_ref>-type = SWITCH #( <ls_base>-stype WHEN 'U' THEN 'Уточняющая' ELSE 'Основная' ).
        <ls_ref>-hassub = lo_ref->has_sub_ref( ).
        <ls_ref>-relcount = VALUE #( ).
      ENDLOOP.
    ENDIF.
    LOOP AT lt_ref ASSIGNING <ls_ref>.
      lo_ref = NEW zcl_argus_ref( CONV #( <ls_ref>-refid ) ).
      DATA(lo_prev_ref) = lo_ref->get_prev_ref( ).
      INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
      <ls_ent>-refid = <ls_ref>-refid.
      <ls_ent>-user = <ls_ref>-user.
      <ls_ent>-year = <ls_ref>-year.
      <ls_ent>-hassub = <ls_ref>-hassub.
      lo_ref->get_applicant(
        IMPORTING
          ev_ename = <ls_ent>-applicant
      ).
      IF lo_ref->gs_pers0-idfam IS NOT INITIAL.
        <ls_ent>-relation = cl_hr_t591s=>read( infty = '0021' subty = CONV #( lo_ref->gs_pers0-idfam+16(2) ) )-stext.
      ENDIF.
*   no income
      DATA(lv_noincome) = VALUE flag( ).
      LOOP AT lo_ref->gt_surc0 ASSIGNING FIELD-SYMBOL(<ls_surc>).
        LOOP AT lo_ref->gt_incm0 ASSIGNING FIELD-SYMBOL(<ls_incm>) WHERE property_type = <ls_surc>-protype.
        ENDLOOP.
        IF sy-subrc <> 0.
          lv_noincome = abap_true.
        ENDIF.
      ENDLOOP.
*   noexpense
      DATA(lv_noexpense) = VALUE flag( ).
      LOOP AT lo_ref->gt_bldn0 ASSIGNING FIELD-SYMBOL(<ls_bdl>) WHERE activ_type = 'НедвижимоеИмущество'.
        LOOP AT lo_ref->gt_expn0 ASSIGNING FIELD-SYMBOL(<ls_exp>) WHERE name_city = <ls_bdl>-name_city
          AND name_street = <ls_bdl>-name_street
          AND name_house = <ls_bdl>-name_house.
        ENDLOOP.
        IF sy-subrc <> 0.
          lv_noexpense = abap_true.
        ENDIF.
      ENDLOOP.
*   house sale
      DATA(lv_housesale) = VALUE flag( ).
      IF lo_prev_ref IS BOUND.
        LOOP AT lo_prev_ref->gt_bldn0 ASSIGNING FIELD-SYMBOL(<ls_bld>).
          CHECK NOT line_exists( lo_ref->gt_bldn0[
            name_city = <ls_bld>-name_city
            name_street = <ls_bld>-name_street
            name_house = <ls_bld>-name_house
          ] ).
          LOOP AT lo_ref->gt_incm0 ASSIGNING FIELD-SYMBOL(<ls_inc>) WHERE square = <ls_bld>-area.
          ENDLOOP.
          IF sy-subrc <> 0.
            lv_housesale = abap_true.
          ENDIF.
        ENDLOOP.
      ENDIF.
*   credit
      DATA(lv_credit) = VALUE flag( ).
      LOOP AT lo_ref->gt_urge0 ASSIGNING FIELD-SYMBOL(<ls_urg>).
        EXIT.
      ENDLOOP.
      IF sy-subrc = 0.
        lv_credit = abap_true.
      ENDIF.
*   exp more income
      DATA(lv_exp_more_inc) = VALUE flag( ).
      DATA(lv_income_sum) = VALUE pstring( ).
      DATA(lv_exp_sum) = VALUE pstring( ).
      LOOP AT lo_ref->gt_incm0 ASSIGNING FIELD-SYMBOL(<ls_in>).
        lv_income_sum = lv_income_sum + <ls_in>-amount.
      ENDLOOP.
      LOOP AT lo_ref->gt_expn0 ASSIGNING FIELD-SYMBOL(<ls_ex>).
        lv_exp_sum = lv_exp_sum + <ls_ex>-tranam.
      ENDLOOP.
      IF lv_exp_sum > lv_income_sum.
        lv_exp_more_inc = abap_true.
      ENDIF.
      <ls_ent>-risk = VALUE #(
        noincome = lv_noincome
        noexpense = lv_noexpense
        housesale = lv_housesale
        credit = lv_credit
        expensemoreincome = lv_exp_more_inc
      ).
    ENDLOOP.
  ENDMETHOD.


METHOD rpenaltyset_get_entityset.
  SELECT * FROM zthr_recovt INTO TABLE @DATA(lt_solut) WHERE spras = @sy-langu.
  et_entityset = VALUE #( FOR ls_s IN lt_solut (
    key = ls_s-recov
    text = ls_s-stext
  ) ).
ENDMETHOD.


  METHOD rtypeset_create_entity.
    DATA: lv_new_rtype   TYPE zcl_zhr_argus_mpc_ext=>ts_rtype-rtype,
          ls_zthr_rtype  TYPE zthr_rtype,
          ls_zthr_rtypet TYPE zthr_rtypet.

    TRY.
        io_data_provider->read_entry_data(
          IMPORTING
            es_data = er_entity
        ).
      CATCH /iwbep/cx_mgw_tech_exception.
    ENDTRY.

    SELECT MAX( rtype ) FROM zthr_rtypet INTO @DATA(lv_max_rtype) WHERE spras = @sy-langu.
    IF sy-subrc = 0.
      lv_max_rtype = lv_max_rtype + 1.
      CONDENSE lv_max_rtype.
      lv_new_rtype = COND #( WHEN lv_max_rtype < 10 THEN |0{ lv_max_rtype }| ELSE lv_max_rtype ).
    ELSE.
      lv_new_rtype = er_entity-rtype.
    ENDIF.

    ls_zthr_rtype-rtype = ls_zthr_rtypet-rtype = er_entity-rtype = lv_new_rtype.
    ls_zthr_rtypet-stext = er_entity-rtypetext = er_entity-rtypetext.
    ls_zthr_rtypet-spras = 'R'.
    MODIFY zthr_rtypet FROM ls_zthr_rtypet.
    MODIFY zthr_rtype FROM ls_zthr_rtype.
  ENDMETHOD.


  METHOD rtypeset_get_entityset.
    SELECT * FROM zthr_rtypet INTO TABLE @DATA(lt_rtype) WHERE spras = @sy-langu.
    LOOP AT lt_rtype ASSIGNING FIELD-SYMBOL(<ls_rtype>).
      INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
      <ls_ent>-rtype = <ls_rtype>-rtype.
      <ls_ent>-rtypetext = <ls_rtype>-stext.
    ENDLOOP.
  ENDMETHOD.


  METHOD scanrefset_get_entityset.
    DATA: ls_input LIKE LINE OF et_entityset,
          lv_msg   TYPE pstring.
    _get_input(
      EXPORTING
        it_key_tab               = it_key_tab
        it_filter_select_options = it_filter_select_options
      IMPORTING
        es_input                 = ls_input
    ).
    CASE ls_input-save.
      WHEN abap_false.
        CHECK ls_input-scanid IS NOT INITIAL.
        DATA(lt_ref) = _processing(
          iv_slug = ls_input-scanid
        ).
        LOOP AT lt_ref ASSIGNING FIELD-SYMBOL(<ls_ref>).
          DATA(lv_xsb) = COND flag( WHEN <ls_ref>-mime_type = 'application/octet-stream' OR <ls_ref>-mime_type CS 'xsb' THEN abap_true ).
          DATA(lo_ref) = NEW zcl_argus_parser_saver(
            is_parsed = <ls_ref>
            iv_filename = SWITCH #( lv_xsb WHEN abap_true THEN 'scan.xsb' ELSE 'scan.pdf' )
            iv_source = <ls_ref>-file_src
          )->save(
            iv_electro = lv_xsb
            iv_paper = boolc( lv_xsb = abap_false )
          ).
          CHECK lo_ref IS NOT INITIAL.
          INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
          <ls_ent>-user = VALUE #(
            pernr = lo_ref->gs_pers0-pernr
            name = |{ lo_ref->gs_pers0-nachn } { lo_ref->gs_pers0-vorna } { lo_ref->gs_pers0-midnm }|
            position = lo_ref->gs_work0-posit
            oiv = lo_ref->gs_work0-name1
          ).
          <ls_ent>-scanid = ls_input-scanid.
          <ls_ent>-refid = lo_ref->gv_ref_id.
          <ls_ent>-year = lo_ref->gs_base0-begda(4).
          <ls_ent>-status = 'Новая'.
          <ls_ent>-type = SWITCH #( lo_ref->gs_base0-stype WHEN 'U' THEN 'Уточняющая' ELSE 'Основная' ).
*         Check pages
          <ls_ent>-message = lo_ref->check( ).
          IF <ls_ent>-message IS INITIAL.
            SELECT SINGLE low FROM tvarvc INTO @DATA(lv_pages) WHERE name = 'Z_ARGUS_PAGES'.
            IF sy-subrc = 0 AND <ls_ref>-base-pages < lv_pages AND <ls_ref>-base-pages IS NOT INITIAL..
              <ls_ent>-message = |Справка является бракованной, менее { lv_pages } страниц|.
            ENDIF.
          ENDIF.
        ENDLOOP.
      WHEN abap_true.
        CHECK ls_input-refid IS NOT INITIAL.
        ASSIGN it_filter_select_options[ property = 'refId' ] TO FIELD-SYMBOL(<ls_so>).
        CHECK sy-subrc = 0.
        LOOP AT <ls_so>-select_options ASSIGNING FIELD-SYMBOL(<ls_opt>).
          lo_ref = NEW zcl_argus_ref( iv_ref_id = CONV #( <ls_opt>-low ) ).
*         проверяем, был ли добавлен родственник
          SELECT * FROM pa0021 INTO TABLE @DATA(lt_0021) WHERE pernr = @lo_ref->gs_pers0-pernr.
          ASSIGN lt_0021[ fgbdt = lo_ref->gs_pers0-gbdat fanam = lo_ref->gs_pers0-nachn favor = lo_ref->gs_pers0-vorna ] TO FIELD-SYMBOL(<ls_0021>).
          IF sy-subrc = 0.
            lo_ref->set_idfam( |{ <ls_0021>-begda }{ <ls_0021>-endda }{ <ls_0021>-subty }{ <ls_0021>-seqnr }| ).
          ENDIF.
          lv_msg = lo_ref->check( ).
*         Проверка страниц
          IF lv_msg IS INITIAL.
            lt_ref = _processing(
              iv_slug = ls_input-scanid
            ).
            READ TABLE lt_ref ASSIGNING <ls_ref> INDEX 1.
            IF sy-subrc = 0.

              SELECT SINGLE low FROM tvarvc INTO lv_pages WHERE name = 'Z_ARGUS_PAGES'.
              IF sy-subrc = 0 AND <ls_ref>-base-pages < lv_pages AND lv_msg IS INITIAL AND <ls_ref>-base-pages IS NOT INITIAL..
                lv_msg = |Справка является бракованной, менее { lv_pages } страниц|.
                lo_ref->errored( ).
              ENDIF.
            ENDIF.
          ENDIF.

          DATA ls_pdf TYPE zthr_argus_pdfs.
          ls_pdf-ref_id = ls_input-refid.
          ls_pdf-mime_type = <ls_ref>-mime_type.
          ls_pdf-file_name = |{ <ls_ref>-personal-nachn } { <ls_ref>-personal-vorna } { <ls_ref>-personal-midnm } - Справка|.
          ls_pdf-file_src = <ls_ref>-file_src .

          MODIFY zthr_argus_pdfs FROM ls_pdf.

          IF lv_msg IS INITIAL.
            lo_ref->approve( ).
          ENDIF.
          INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING <ls_ent>.
          <ls_ent>-user = VALUE #(
            pernr = lo_ref->gs_pers0-pernr
            name = |{ lo_ref->gs_pers0-nachn } { lo_ref->gs_pers0-vorna } { lo_ref->gs_pers0-midnm }|
            position = lo_ref->gs_work0-posit
            oiv = lo_ref->gs_work0-name1
          ).
          <ls_ent>-scanid = ls_input-scanid.
          <ls_ent>-refid = lo_ref->gv_ref_id.
          <ls_ent>-year = lo_ref->gs_base0-begda(4).
          <ls_ent>-type = SWITCH #( lo_ref->gs_base0-stype WHEN 'U' THEN 'Уточняющая' ELSE 'Основная' ).
          IF lv_msg IS INITIAL.
            <ls_ent>-status = 'Утверждено'.
            <ls_ent>-message = 'Данные успешно сохранены'.
          ELSE.
            <ls_ent>-status = 'Новая'.
            <ls_ent>-message = |Ошибка при сохранении: { lv_msg }|.
          ENDIF.
        ENDLOOP.
    ENDCASE.
  ENDMETHOD.


  METHOD searchset_get_entityset.
    TYPES: BEGIN OF ts_cri,
             free                   TYPE pstring, "Свободный поиск +
             lastname               TYPE pstring, "Фамилия +
             yearofbirth            TYPE pstring, "Год рождения +
             placeofbirth           TYPE pstring, "Место рождения +
             registrationaddress    TYPE pstring, "Адрес регистрации +
             residenceaddress       TYPE pstring, "Адрес проживания +
             realestate             TYPE pstring, "Недвижимое имущество
             fio                    TYPE pstring, "Организация +
             organizationlocation   TYPE pstring, "Местонахождение организации +
             educationalinstitution TYPE pstring, "Образовательное учреждение +
             locationofedu          TYPE pstring, "Местонахождение образовательного учреждения +
             militaryunit           TYPE pstring, "Воинская часть +
             locationofmilitaryunit TYPE pstring, "Местонахождение воинской части +
           END OF ts_cri.
    DATA: ls_input  LIKE LINE OF et_entityset,
          ls_search TYPE zshr_argus_search_info,
          lt_cri    TYPE TABLE OF ts_cri.
    DATA:  lv_role_ggs TYPE boole_d,
           lv_role_gd  TYPE boole_d,
           lv_role_ms  TYPE boole_d.
    DATA:  lv_filter_role_ggs TYPE boole_d,
           lv_filter_role_gd  TYPE boole_d,
           lv_filter_role_ms  TYPE boole_d.
    DATA:  ls_0001    TYPE pa0001.

    _get_input(
      EXPORTING
        it_key_tab               = it_key_tab
        it_filter_select_options = it_filter_select_options
      IMPORTING
        es_input                 = ls_input
    ).
    /ui2/cl_json=>deserialize(
      EXPORTING
        json        = ls_input-seark
        pretty_name = abap_true
      CHANGING
        data        = lt_cri
    ).

    _get_roles( EXPORTING io_tech_request_context = io_tech_request_context
             IMPORTING ev_role_gd  = lv_role_gd
                       ev_role_ggs = lv_role_ggs
                       ev_role_ms  = lv_role_ms ).
    IF ls_input-filterpernr IS NOT INITIAL AND ls_input-inspector IS INITIAL.
*      _get_roles( EXPORTING io_tech_request_context = io_tech_request_context
*                            iv_pernr = CONV pernr_d( ls_input-filterpernr )
*         IMPORTING ev_role_gd  = lv_filter_role_gd
*                   ev_role_ggs = lv_filter_role_ggs
*                   ev_role_ms  = lv_filter_role_ms ).

      SELECT SINGLE * FROM pa0001 INTO ls_0001 WHERE begda <= sy-datum AND endda >= sy-datum AND pernr = ls_input-filterpernr.

      DATA(lv_p1) = VALUE char1( ).
      zcl_hr_data=>get_plans_param(
        EXPORTING
          i_plans  = ls_0001-plans
        IMPORTING
          e_param1 = lv_p1
      ).
      CASE lv_p1.
        WHEN '1'.
          lv_filter_role_gd = abap_true.
        WHEN '2'.
          lv_filter_role_ggs = abap_true.
        WHEN '3'.
          lv_filter_role_ms = abap_true.
      ENDCASE.

      lv_role_gd  = COND #( WHEN lv_role_gd  EQ abap_true AND lv_filter_role_gd  EQ abap_false THEN abap_false ELSE lv_role_gd ).
      lv_role_ggs = COND #( WHEN lv_role_ggs EQ abap_true AND lv_filter_role_ggs EQ abap_false THEN abap_false ELSE lv_role_ggs ).
      lv_role_ms  = COND #( WHEN lv_role_ms  EQ abap_true AND lv_filter_role_ms  EQ abap_false THEN abap_false ELSE lv_role_ms ).
    ENDIF.

    DATA(lt_comp) = CAST cl_abap_structdescr( cl_abap_typedescr=>describe_by_data( ls_search ) )->get_components( ).
    LOOP AT lt_comp ASSIGNING FIELD-SYMBOL(<ls_comp>) WHERE as_include = abap_true.
      INSERT LINES OF CAST cl_abap_structdescr( <ls_comp>-type )->get_components( ) INTO TABLE lt_comp.
      DELETE lt_comp.
    ENDLOOP.
    DELETE lt_cri WHERE table_line IS INITIAL.
    DATA(lt_search) = VALUE zthr_argus_search_info( ).
    DATA(lo_search) = NEW zcl_argus_search( ).
    LOOP AT lt_cri ASSIGNING FIELD-SYMBOL(<ls_cri>).
      IF <ls_cri>-free IS NOT INITIAL.
        lo_search->set_seark( iv_seark = |*{ <ls_cri>-free }*| ).
      ENDIF.
      IF <ls_cri>-lastname IS NOT INITIAL.
        lo_search->add_filter( is_filter = VALUE #( name = 'NACHN' value = |*{ <ls_cri>-lastname }*| ) ).
      ENDIF.
      IF <ls_cri>-yearofbirth IS NOT INITIAL.
        lo_search->add_filter( is_filter = VALUE #( name = 'GBJHR' value = <ls_cri>-yearofbirth ) ).
      ENDIF.
      IF <ls_cri>-placeofbirth IS NOT INITIAL.
        lo_search->add_filter( is_filter = VALUE #( name = 'GBORT' value = |*{ <ls_cri>-placeofbirth }*| ) ).
      ENDIF.
      IF <ls_cri>-registrationaddress IS NOT INITIAL.
*        lo_search->add_filter( is_filter = VALUE #( name = 'PSTLZ' value = |*{ <ls_cri>-registrationaddress }*| ) ).
*        lo_search->add_filter( is_filter = VALUE #( name = 'LAND1' value = |*{ <ls_cri>-registrationaddress }*| ) ).
*        lo_search->add_filter( is_filter = VALUE #( name = 'STATE' value = |*{ <ls_cri>-registrationaddress }*| ) ).
*        lo_search->add_filter( is_filter = VALUE #( name = 'STATE_TXT' value = |*{ <ls_cri>-registrationaddress }*| ) ).
        lo_search->add_filter( is_filter = VALUE #( name = 'ORT01' value = |*{ <ls_cri>-registrationaddress }*| ) ).
*        lo_search->add_filter( is_filter = VALUE #( name = 'ORT02' value = |*{ <ls_cri>-registrationaddress }*| ) ).
*        lo_search->add_filter( is_filter = VALUE #( name = 'STRAS' value = |*{ <ls_cri>-registrationaddress }*| ) ).
*        lo_search->add_filter( is_filter = VALUE #( name = 'HSNMR' value = |*{ <ls_cri>-registrationaddress }*| ) ).
*        lo_search->add_filter( is_filter = VALUE #( name = 'POSTA' value = |*{ <ls_cri>-registrationaddress }*| ) ).
      ENDIF.
      IF <ls_cri>-residenceaddress IS NOT INITIAL.
        lo_search->add_filter( is_filter = VALUE #( name = 'ORT01_FA' value = |*{ <ls_cri>-residenceaddress }*| ) ).
      ENDIF.
      IF <ls_cri>-fio IS NOT INITIAL.
        lo_search->add_filter( is_filter = VALUE #( name = 'JOB_NAME' value = |*{ <ls_cri>-fio }*| ) ).
      ENDIF.
      IF <ls_cri>-organizationlocation IS NOT INITIAL.
        lo_search->add_filter( is_filter = VALUE #( name = 'JOB_CITY' value = |*{ <ls_cri>-organizationlocation }*| ) ).
      ENDIF.
      IF <ls_cri>-educationalinstitution IS NOT INITIAL.
        lo_search->add_filter( is_filter = VALUE #( name = 'INSTI' value = |*{ <ls_cri>-educationalinstitution }*| ) ).
      ENDIF.
      IF <ls_cri>-locationofedu IS NOT INITIAL.
        lo_search->add_filter( is_filter = VALUE #( name = 'DPTMT' value = |*{ <ls_cri>-locationofedu }*| ) ).
      ENDIF.
      IF <ls_cri>-militaryunit IS NOT INITIAL.
        lo_search->add_filter( is_filter = VALUE #( name = 'INSTI_MI' value = |*{ <ls_cri>-militaryunit }*| ) ).
      ENDIF.
      IF <ls_cri>-locationofmilitaryunit IS NOT INITIAL.
        lo_search->add_filter( is_filter = VALUE #( name = 'DPTMT_MI' value = |*{ <ls_cri>-locationofmilitaryunit }*| ) ).
      ENDIF.
      IF <ls_cri>-realestate IS NOT INITIAL.
        lo_search->add_filter( is_filter = VALUE #( name = 'REF_SOURCE' value = |*{ <ls_cri>-realestate }*| ) ).
      ENDIF.
      IF ls_input-exact = abap_false.
        INSERT LINES OF lo_search->search( ) INTO TABLE lt_search.
        lo_search = NEW zcl_argus_search( ).
      ENDIF.
    ENDLOOP.
    IF sy-subrc <> 0.
      RETURN.
    ENDIF.
    IF ls_input-exact = abap_true.
      lt_search = lo_search->search( ).
    ELSE.
      SORT lt_search BY pernr.
      DELETE ADJACENT DUPLICATES FROM lt_search COMPARING pernr.
    ENDIF.
    LOOP AT lt_search ASSIGNING FIELD-SYMBOL(<ls_ent_in>).
      IF <ls_ent_in>-plans_ggs IS NOT INITIAL OR
        <ls_ent_in>-plans_head IS NOT INITIAL OR
        <ls_ent_in>-plans_subs IS NOT INITIAL.
        CHECK ( <ls_ent_in>-plans_subs = abap_true AND lv_role_gd = abap_true )
           OR ( <ls_ent_in>-plans_ggs = abap_true AND lv_role_ggs EQ abap_true )
           OR ( <ls_ent_in>-plans_head = abap_true AND lv_role_ms = abap_true ).
      ENDIF.
      INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
      <ls_ent>-pernr = <ls_ent_in>-pernr.
      <ls_ent>-user = VALUE #(
        pernr = <ls_ent_in>-pernr
        name = |{ <ls_ent_in>-nachn } { <ls_ent_in>-vorna } { <ls_ent_in>-midnm }|
        position = <ls_ent_in>-plans_txt
        oiv = <ls_ent_in>-persa_txt
      ).
      <ls_ent>-birth = |{ <ls_ent_in>-gbdat DATE = USER }|.
      <ls_ent>-photo = <ls_ent_in>-photo.
*   match
      DATA(lt_match) = VALUE zthr_argus_match( ).
      LOOP AT lt_comp ASSIGNING <ls_comp> WHERE name = 'NACHN'
                                            OR name = 'GBORT'
                                            OR name = 'ORT01'
                                            OR name = 'STRAS'
                                            OR name = 'HSNMR'
                                            OR name = 'JOB_NAME'
                                            OR name = 'JOB_ORGEH'
                                            OR name = 'INSTI'
                                            OR name = 'INSTI_MI'
                                            OR name = 'DPTMT_MI'.
        ASSIGN COMPONENT <ls_comp>-name OF STRUCTURE <ls_ent_in> TO FIELD-SYMBOL(<lv_fld>).
        CHECK <lv_fld> IS NOT INITIAL.
        SPLIT <lv_fld> AT '|' INTO DATA(lv_fld) DATA(lv_dummy).
        INSERT VALUE #( field = |{ <ls_comp>-name CASE = LOWER }| value = |{ lv_fld }| ) INTO TABLE lt_match.
      ENDLOOP.
      LOOP AT lt_comp ASSIGNING <ls_comp> WHERE name = 'GBJHR'.
        ASSIGN COMPONENT <ls_comp>-name OF STRUCTURE <ls_ent_in> TO <lv_fld>.
        CHECK <lv_fld> IS NOT INITIAL.
        SPLIT <lv_fld> AT '|' INTO lv_fld lv_dummy.
        INSERT VALUE #( field = |{ <ls_comp>-name CASE = LOWER }| value = |{ lv_fld } год рождения| ) INTO TABLE lt_match.
      ENDLOOP.
      <ls_ent>-match = /ui2/cl_json=>serialize(
        data        = lt_match
        pretty_name = abap_true
      ).
    ENDLOOP.

    IF ls_input-inspector IS NOT INITIAL.
*      DATA: lt_inspectors TYPE tt_inspectors.

      DATA(lt_inspectors) = _get_inspectors( EXPORTING iv_role_gd  = lv_role_gd
                                                       iv_role_ggs = lv_role_ggs
                                                       iv_role_ms  = lv_role_ms ).

      DATA(lt_entityset) = et_entityset.
      CLEAR et_entityset.
      LOOP AT lt_inspectors INTO DATA(ls_inspector).
        READ TABLE lt_entityset INTO DATA(ls_entityset) WITH KEY pernr = ls_inspector-low.
        IF sy-subrc = 0.
          APPEND ls_entityset TO et_entityset.
        ENDIF.
      ENDLOOP.

    ENDIF.


  ENDMETHOD.


  METHOD searchuserset_get_entityset.
    DATA: ls_input LIKE LINE OF et_entityset.
    _get_input(
      EXPORTING
        it_key_tab               = it_key_tab
        it_filter_select_options = it_filter_select_options
      IMPORTING
        es_input                 = ls_input
    ).
    DATA: lv_searchstring TYPE pstring.
    DATA(lv_type) = COND #( WHEN ls_input-searchstring CO '0123456789' THEN 'PERNR' ELSE 'ENAME' ).
    lv_searchstring = |%{ ls_input-searchstring }%|.
    IF lv_type = 'PERNR'.
      SELECT * FROM pa0001 INTO TABLE @DATA(lt_p0001)
        WHERE pernr LIKE @lv_searchstring
          AND begda <= @sy-datum
          AND endda >= @sy-datum.
    ELSE.
      SELECT * FROM pa0001 INTO TABLE lt_p0001
        WHERE ename LIKE lv_searchstring
          AND begda <= sy-datum
          AND endda >= sy-datum.
    ENDIF.

    LOOP AT lt_p0001 ASSIGNING FIELD-SYMBOL(<ls_p0001>).
      APPEND INITIAL LINE TO et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
      <ls_ent>-pernr = <ls_p0001>-pernr.
      <ls_ent>-fio = <ls_p0001>-ename.
    ENDLOOP.

  ENDMETHOD.


  METHOD shortcheckset_get_entityset.

    DATA: lt_check        TYPE TABLE OF zthr_check_data,
          lv_role_ggs     TYPE boole_d,
          lv_role_gd      TYPE boole_d,
          lv_role_ms      TYPE boole_d,
          lt_result_objec TYPE TABLE OF objec.

    _get_roles( EXPORTING io_tech_request_context = io_tech_request_context
                 IMPORTING ev_role_gd = lv_role_gd
                          ev_role_ggs = lv_role_ggs
                           ev_role_ms = lv_role_ms ).

    CLEAR: lt_check.
    SELECT * FROM zthr_check_data INTO TABLE @DATA(lt_check_temp).
    IF sy-subrc = 0.
      LOOP AT lt_check_temp ASSIGNING FIELD-SYMBOL(<ls_check_temp>).
        CALL METHOD zcl_hr_data=>get_plans
          EXPORTING
            i_pernr = <ls_check_temp>-subject
            i_begda = sy-datum
          IMPORTING
            e_plans = DATA(lv_plans)
            e_werks = DATA(lv_werks).
        DATA(lv_p1) = VALUE char1( ).
        zcl_hr_data=>get_plans_param(
          EXPORTING
            i_plans  = lv_plans
          IMPORTING
            e_param1 = lv_p1
        ).
        IF lv_p1 IS NOT INITIAL.
          IF lv_p1 = '1' AND lv_role_gd = abap_true.
            APPEND <ls_check_temp> TO lt_check.
          ENDIF.
          IF lv_p1 = '2' AND lv_role_ggs EQ abap_true.
            APPEND <ls_check_temp> TO lt_check.
          ENDIF.
          IF lv_role_ms = abap_true AND (  lv_p1 = '3'
            OR  lv_werks = gc_werks_zz01 OR lv_werks = gc_werks_168 ).
*                 проверка должностей по ролям
            APPEND <ls_check_temp> TO lt_check.
          ENDIF.
        ELSEIF lv_werks NE gc_werks_zz01 AND lv_werks NE gc_werks_168.
          APPEND <ls_check_temp> TO lt_check.
        ENDIF.
      ENDLOOP.
    ENDIF.

    SELECT * FROM zthr_check_req INTO TABLE @DATA(lt_check_req).

    LOOP AT lt_check ASSIGNING FIELD-SYMBOL(<ls_check>).
      INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
      <ls_ent>-docid = <ls_check>-docid.
      <ls_ent>-controller = <ls_check>-controller.
      SELECT SINGLE ename FROM pa0001 INTO <ls_ent>-controllername WHERE pernr = <ls_check>-controller AND begda <= sy-datum AND endda >= sy-datum.
      <ls_ent>-subject = <ls_check>-subject.
      SELECT SINGLE * FROM pa0001 INTO @DATA(ls_subject) WHERE pernr = @<ls_check>-subject AND begda <= @sy-datum AND endda >= @sy-datum.
      <ls_ent>-subjectname = ls_subject-ename.
      <ls_ent>-subjectplans = zcl_hr_data_utils=>get_name_obj_1000(
        i_objid = ls_subject-plans
        i_otype = cl_hap_pmp_const=>otype_position
    ).

      CLEAR: lt_result_objec.
      CALL FUNCTION 'RH_STRUC_GET'
        EXPORTING
          act_otype      = 'O'
          act_objid      = ls_subject-orgeh
          act_wegid      = 'A002'
          act_plvar      = '01'
          act_begda      = sy-datum
          act_endda      = sy-datum
        TABLES
          result_objec   = lt_result_objec
        EXCEPTIONS
          no_plvar_found = 1
          no_entry_found = 2
          OTHERS         = 3.

* -- Удаляем не орг структуры
      DELETE lt_result_objec WHERE otype NE 'O'.
      DATA(lv_tlines) = lines( lt_result_objec ) - 1.
      READ TABLE lt_result_objec INTO DATA(ls_oiv) INDEX lv_tlines.
      IF sy-subrc = 0.
        CALL METHOD zcl_hr_data=>get_name_orgeh
          EXPORTING
            i_orgeh = ls_oiv-objid
          IMPORTING
            e_lname = <ls_ent>-subjectoiv.
      ENDIF.

      <ls_ent>-enddate = |{ <ls_check>-enddate+6(2) }.{ <ls_check>-enddate+4(2) }.{ <ls_check>-enddate+0(4) }|.
      <ls_ent>-status = <ls_check>-status.
      SELECT SINGLE status_text FROM zthr_check_stat INTO <ls_ent>-statustext
        WHERE status = <ls_check>-status.
      <ls_ent>-createdate = |{ <ls_check>-createdate DATE = USER }|.
      SELECT SINGLE * FROM zthr_rtypet INTO @DATA(ls_rtype) WHERE spras = @sy-langu AND rtype = @<ls_check>-rtype.
      IF sy-subrc = 0.
        <ls_ent>-rtypetext = ls_rtype-stext.
      ENDIF.

      READ TABLE lt_check_req INTO DATA(ls_check_reg) WITH KEY checkdocid = <ls_check>-docid.
      IF sy-subrc = 0.
        <ls_ent>-requestsexists = abap_true.
      ENDIF.

    ENDLOOP.
  ENDMETHOD.


  METHOD subjectset_get_entityset.
    TYPES: BEGIN OF ts_subjects,
             docid   TYPE char32,
             subject TYPE hrobjid,
           END OF ts_subjects.
    DATA lt_subjects_from_group TYPE TABLE OF ts_subjects.
    READ TABLE it_key_tab WITH KEY name = 'docId' INTO DATA(ls_key).
    CHECK sy-subrc = 0.
    SELECT SINGLE * FROM zthr_check_req INTO @DATA(ls_req) WHERE docid = @ls_key-value.
    IF ls_req-group_req = abap_true.
      SELECT docid subject FROM zthr_check_req INTO TABLE lt_subjects_from_group WHERE group_id = ls_req-group_id.
      IF sy-subrc = 0.
        DELETE ADJACENT DUPLICATES FROM lt_subjects_from_group.
      ENDIF.
    ELSE.
      SELECT docid subject FROM zthr_check_req INTO TABLE lt_subjects_from_group WHERE docid = ls_key-value.
    ENDIF.
    LOOP AT lt_subjects_from_group INTO DATA(ls_subjects_from_group).
      SELECT SINGLE * FROM pa0001 INTO @DATA(ls_subject) WHERE pernr = @ls_subjects_from_group-subject.
      APPEND INITIAL LINE TO et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
      <ls_ent>-docid = ls_subjects_from_group-docid.
      <ls_ent>-subject = ls_subjects_from_group-subject.
      <ls_ent>-subjectname = ls_subject-ename.
    ENDLOOP.
  ENDMETHOD.


  METHOD subrefset_delete_entity.
    DATA: ls_input TYPE zcl_zhr_argus_mpc_ext=>ts_subref.
    _get_input(
      EXPORTING
        it_key_tab               = it_key_tab
      IMPORTING
        es_input                 = ls_input
    ).
    NEW zcl_argus_ref( CONV #( ls_input-subrefid ) )->delete( ).
  ENDMETHOD.


  METHOD subrefset_get_entity.
    _get_input(
      EXPORTING
        it_key_tab               = it_key_tab
      IMPORTING
        es_input                 = er_entity
    ).
  ENDMETHOD.


  METHOD subrefset_get_entityset.
    DATA: ls_input LIKE LINE OF et_entityset.
    _get_input(
      EXPORTING
        it_key_tab               = it_key_tab
        it_filter_select_options = it_filter_select_options
      IMPORTING
        es_input                 = ls_input
    ).
    DATA(lo_this_ref) = NEW zcl_argus_ref( iv_ref_id = CONV #( ls_input-refid ) ).
    SELECT * FROM zthr_argus_pers0 AS pers
      INNER JOIN zthr_argus_base0 AS base
      ON base~docid = pers~docid
      WHERE pers~pernr = @lo_this_ref->gs_pers0-pernr
      AND base~status = @zcl_argus_ref=>gs_status-approved
      INTO TABLE @DATA(lt_all_ref).
    DELETE lt_all_ref WHERE base-docid = lo_this_ref->gv_ref_id.
    DELETE lt_all_ref WHERE base-begda(4) <> lo_this_ref->gs_base0-begda(4).
    LOOP AT lt_all_ref ASSIGNING FIELD-SYMBOL(<ls_base>).
      DATA(lo_ref) = NEW zcl_argus_ref( CONV #( <ls_base>-base-docid ) ).
      INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
      <ls_ent>-refid = <ls_base>-base-docid.
      <ls_ent>-user = VALUE #(
        pernr = lo_ref->gs_pers0-pernr
        name = |{ lo_ref->gs_pers0-nachn } { lo_ref->gs_pers0-vorna } { lo_ref->gs_pers0-midnm }|
        position = lo_ref->gs_work0-posit
        oiv = lo_ref->gs_work0-name1
      ).
      <ls_ent>-year = <ls_base>-base-begda(4).
      <ls_ent>-ispaper = <ls_base>-base-spaper.
      <ls_ent>-iselectro = <ls_base>-base-sdigit.
      <ls_ent>-helpcriterion = <ls_ent>-type = SWITCH #( <ls_base>-base-stype WHEN 'U' THEN 'Уточняющая' ELSE 'Основная' ).
      <ls_ent>-relcount = VALUE #( ).
      <ls_ent>-dateofprint = |{ <ls_base>-base-ordst DATE = USER }|.
      <ls_ent>-dateofupload = |{ <ls_base>-base-aedtm DATE = USER }|.
      <ls_ent>-action = VALUE #( read = abap_true delete = abap_true ).
      IF lo_ref->gs_pers0-idfam IS NOT INITIAL.
        <ls_ent>-relation = cl_hr_t591s=>read( infty = '0021' subty = CONV #( lo_ref->gs_pers0-idfam+16(2) ) )-stext.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.


  METHOD templateset_get_entityset.
    DATA: lv_isgroup TYPE boole_d.
    READ TABLE it_filter_select_options INTO DATA(ls_filter_select_options) WITH KEY property = 'IsGroup'.
    IF sy-subrc = 0.
      READ TABLE ls_filter_select_options-select_options INTO DATA(ls_so) INDEX 1.
      IF sy-subrc = 0.
        lv_isgroup = ls_so-low.
      ENDIF.
    ENDIF.

    SELECT * FROM zthr_templ INTO TABLE @DATA(lt_templ).
    IF sy-subrc = 0.
      IF lv_isgroup EQ abap_true."не выводить расходы по группе
        DELETE lt_templ WHERE stext CS 'расход' OR stext CS 'Расход' OR stext CS 'РАСХОД'.
      ENDIF.

      LOOP AT lt_templ INTO DATA(ls_templ).
        APPEND INITIAL LINE TO et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
        <ls_ent>-ttype = ls_templ-template.
        <ls_ent>-ttext = ls_templ-stext.
        CONDENSE <ls_ent>-ttype.
      ENDLOOP.
    ENDIF.
  ENDMETHOD.


METHOD useralertset_get_entity.
  _get_input(
    EXPORTING
      it_key_tab = it_key_tab
    IMPORTING
      es_input   = er_entity
  ).
  DATA(lv_pernr) = CONV pernr_d( er_entity-pernr ).
  SELECT SINGLE * FROM pa0002 INTO @DATA(ls_0002)
    WHERE pernr = @lv_pernr
    AND begda <= @sy-datum
    AND endda >= @sy-datum.
  SELECT * FROM pa0021 INTO TABLE @DATA(lt_0021)
    WHERE pernr = @lv_pernr.
  SELECT * FROM pa0021 INTO TABLE @DATA(lt_other)
    WHERE fgbdt = @ls_0002-gbdat
      AND fanam = @ls_0002-nachn
      AND favor = @ls_0002-vorna.
  IF lt_0021 IS NOT INITIAL.
    SELECT * FROM pa0021 APPENDING TABLE @lt_other
      FOR ALL ENTRIES IN @lt_0021
      WHERE fgbdt = @lt_0021-fgbdt
        AND fanam = @lt_0021-fanam
        AND favor = @lt_0021-favor
        AND pernr <> @lv_pernr.
  ENDIF.
  CHECK lt_other IS NOT INITIAL.
  SELECT * FROM pa0002
    FOR ALL ENTRIES IN @lt_other
    WHERE pernr = @lt_other-pernr
    AND begda <= @sy-datum
    AND endda >= @sy-datum
    INTO TABLE @DATA(lt_other_0002).
  LOOP AT lt_other_0002 ASSIGNING FIELD-SYMBOL(<ls_other_0002>).
    CHECK NOT line_exists( lt_0021[
      fgbdt = <ls_other_0002>-gbdat
      fanam = <ls_other_0002>-nachn
      favor = <ls_other_0002>-vorna
    ] ).
    er_entity-relative-is = abap_true.
    er_entity-relative-detail =
      |Внимание, найден сотрудник { <ls_other_0002>-nachn } { <ls_other_0002>-vorna } { <ls_other_0002>-midnm }, не добавленный в список родственников|.
  ENDLOOP.
ENDMETHOD.


  METHOD userset_create_entity.
**TRY.
*CALL METHOD SUPER->USERSET_CREATE_ENTITY
*  EXPORTING
*    IV_ENTITY_NAME          =
*    IV_ENTITY_SET_NAME      =
*    IV_SOURCE_NAME          =
*    IT_KEY_TAB              =
**    io_tech_request_context =
*    IT_NAVIGATION_PATH      =
**    io_data_provider        =
**  IMPORTING
**    er_entity               =
*    .
** CATCH /iwbep/cx_mgw_busi_exception .
** CATCH /iwbep/cx_mgw_tech_exception .
**ENDTRY.
  ENDMETHOD.


  METHOD userset_delete_entity.
    DATA: ls_input TYPE zcl_zhr_argus_mpc_ext=>ts_user.
    _get_input(
      EXPORTING
        it_key_tab = it_key_tab
      IMPORTING
        es_input   = ls_input
    ).
    DATA(ls_hide) = VALUE zthr_argus_hide(
      pernr = ls_input-pernr
    ).
    MODIFY zthr_argus_hide FROM ls_hide.
  ENDMETHOD.


  METHOD userset_get_entity.
    _get_input(
      EXPORTING
        it_key_tab               = it_key_tab
      IMPORTING
        es_input                 = er_entity
    ).
    DATA(lo_search) = NEW zcl_argus_search( ).
    lo_search->add_filter( is_filter = VALUE #( name = 'PERNR' value = er_entity-pernr ) ).
    DATA(lt_search) = lo_search->search( ).
    LOOP AT lt_search ASSIGNING FIELD-SYMBOL(<ls_ent_in>).
      er_entity-pernr = <ls_ent_in>-pernr.
      er_entity-lastname = <ls_ent_in>-nachn.
      er_entity-firstname = <ls_ent_in>-vorna.
      er_entity-patronymic = <ls_ent_in>-midnm.
      er_entity-name = |{ <ls_ent_in>-nachn } { <ls_ent_in>-vorna } { <ls_ent_in>-midnm }|.
      er_entity-dateofbirth = |{ <ls_ent_in>-gbdat DATE = USER }|.
      er_entity-position = <ls_ent_in>-plans_txt.
      er_entity-oiv = <ls_ent_in>-persa_txt.
      EXIT.
    ENDLOOP.
  ENDMETHOD.


  METHOD userset_get_entityset.
    DATA: ls_input    LIKE LINE OF et_entityset,
          lv_role_gd  TYPE boole_d,
          lv_role_ggs TYPE boole_d,
          lv_role_ms  TYPE boole_d.

    _get_input(
      EXPORTING
        it_key_tab               = it_key_tab
        it_filter_select_options = it_filter_select_options
      IMPORTING
        es_input                 = ls_input
    ).
    DATA(lo_search) = NEW zcl_argus_search( ).
    IF ls_input-category IS INITIAL OR ls_input-category EQ '[object MouseEvent]'.
      _get_roles( EXPORTING io_tech_request_context = io_tech_request_context
           IMPORTING ev_role_gd = lv_role_gd
                    ev_role_ggs = lv_role_ggs
                     ev_role_ms = lv_role_ms ).
      IF lv_role_ggs EQ abap_true.
        DATA(lt_search_ggs) = _get_role_table( EXPORTING iv_role = 'PLANS_GGS' iv_needref = abap_false ).
      ENDIF.
      IF lv_role_gd EQ abap_true.
        DATA(lt_search_gd) = _get_role_table( EXPORTING iv_role = 'PLANS_SUBS' iv_needref = abap_false ).
      ENDIF.
      IF lv_role_ms EQ abap_true.
*        DATA(lt_search_ms) = _get_role_table( EXPORTING iv_role = 'PLANS_HEAD' iv_needref = abap_false ).
        " Отберем записи по роли и добавим пользователей с разделом персонала ZZ01 и 0168
        DATA(lt_search) = lo_search->search( ).
        LOOP AT lt_search INTO DATA(ls_search).

          IF ls_search-plans_ggs  IS INITIAL AND
             ls_search-plans_head IS INITIAL AND
             ls_search-plans_subs IS INITIAL.

            SELECT SINGLE mandt FROM pa0001 INTO sy-mandt
                WHERE pernr = ls_search-pernr AND begda <= sy-datum AND endda >= sy-datum
                  AND ( werks = 'ZZ01' OR werks = '0168' ).
            IF sy-subrc <> 0.
              DELETE TABLE lt_search FROM ls_search.
            ENDIF.
            CONTINUE.
          ENDIF.

          IF NOT ( ( ls_search-plans_head = abap_true AND lv_role_ms = abap_true ) ).
            DELETE TABLE lt_search FROM ls_search.
            CONTINUE.
          ENDIF.

        ENDLOOP.
      ENDIF.
    ENDIF.
    IF ls_input-category IS NOT INITIAL AND ls_input-category NE '[object MouseEvent]'.
      CASE ls_input-category.
        WHEN 'governmentCivilServants'.
          lo_search->add_filter( is_filter = VALUE #( name = 'PLANS_GGS' value = abap_true ) ).
        WHEN 'personsHoldingPublicOffice'.
          lo_search->add_filter( is_filter = VALUE #( name = 'PLANS_SUBS' value = abap_true ) ).
        WHEN 'headsOfMunicipalities'.
          lo_search->add_filter( is_filter = VALUE #( name = 'PLANS_HEAD' value = abap_true ) ).
      ENDCASE.
*      DATA(lt_search) = lo_search->search( ).
      lt_search = lo_search->search( ).
    ELSE.
      APPEND LINES OF lt_search_ggs TO lt_search.
      APPEND LINES OF lt_search_gd TO lt_search.
*      APPEND LINES OF lt_search_ms TO lt_search.
    ENDIF.
    SELECT per~pernr FROM zthr_argus_pers0 AS per
      INNER JOIN zthr_argus_base0 AS base
        ON per~docid = base~docid
       INTO TABLE @DATA(lt_ref) WHERE base~status = @zcl_argus_ref=>gs_status-approved.
    LOOP AT lt_search ASSIGNING FIELD-SYMBOL(<ls_ent_in>) WHERE nachn <> '1' AND nachn <> '11'.
      INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
      <ls_ent>-pernr = <ls_ent_in>-pernr.
      <ls_ent>-lastname = <ls_ent_in>-nachn.
      <ls_ent>-firstname = <ls_ent_in>-vorna.
      <ls_ent>-patronymic = <ls_ent_in>-midnm.
      <ls_ent>-name = |{ <ls_ent_in>-nachn } { <ls_ent_in>-vorna } { <ls_ent_in>-midnm }|.
      <ls_ent>-dateofbirth = |{ <ls_ent_in>-gbdat DATE = USER }|.
      <ls_ent>-position = <ls_ent_in>-plans_txt.
      <ls_ent>-oiv = <ls_ent_in>-persa_txt.
      LOOP AT lt_ref ASSIGNING FIELD-SYMBOL(<ls_ref>) WHERE pernr = <ls_ent_in>-pernr.
        <ls_ent>-numberofreferences = <ls_ent>-numberofreferences + 1.
      ENDLOOP.
      <ls_ent>-photo = <ls_ent_in>-photo.
    ENDLOOP.
* created
    IF ls_input-category IS INITIAL.
      SELECT * FROM zthr_argus_newpe INTO TABLE @DATA(lt_new) WHERE aedtm = @sy-datum.
      LOOP AT lt_new ASSIGNING FIELD-SYMBOL(<ls_new>).
        CHECK NOT line_exists( et_entityset[ pernr = <ls_new>-pernr ] ).
        SELECT SINGLE * FROM pa0002 INTO @DATA(ls_0002) WHERE pernr = @<ls_new>-pernr.
        INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING <ls_ent>.
        <ls_ent>-pernr = <ls_new>-pernr.
        <ls_ent>-lastname = ls_0002-nachn.
        <ls_ent>-firstname = ls_0002-vorna.
        <ls_ent>-patronymic = ls_0002-midnm.
        <ls_ent>-name = |{ ls_0002-nachn } { ls_0002-vorna } { ls_0002-midnm }|.
        <ls_ent>-dateofbirth = |{ ls_0002-gbdat DATE = USER }|.
        LOOP AT lt_ref ASSIGNING <ls_ref> WHERE pernr = <ls_new>-pernr.
          <ls_ent>-numberofreferences = <ls_ent>-numberofreferences + 1.
        ENDLOOP.
      ENDLOOP.
    ENDIF.
* hidden
    SELECT * FROM zthr_argus_hide INTO TABLE @DATA(lt_hide).
    LOOP AT lt_hide ASSIGNING FIELD-SYMBOL(<ls_hide>).
      DELETE et_entityset WHERE pernr = <ls_hide>-pernr.
    ENDLOOP.
  ENDMETHOD.


  METHOD whereset_get_entityset.
    DATA: ls_input LIKE LINE OF et_entityset,
          lv_oiv   TYPE string.
    DATA: lt_result_objec TYPE TABLE OF objec,
          lt_p0001        TYPE TABLE OF p0001,
          lv_pernr        TYPE pernr_d.

    _get_input(
  EXPORTING
    it_key_tab               = it_key_tab
    it_filter_select_options = it_filter_select_options
  IMPORTING
    es_input                 = ls_input
    ).

    CLEAR: lt_p0001, lt_result_objec, lv_oiv.

    IF ls_input-pernr IS NOT INITIAL.
      lv_pernr = CONV pernr_d( ls_input-pernr ).
    ELSEIF ls_input-docid IS NOT INITIAL.

      SELECT SINGLE * FROM zthr_check_req INTO @DATA(ls_req) WHERE docid = @ls_input-docid.
      IF sy-subrc = 0.
        lv_pernr = CONV pernr_d( ls_req-subject ).
      ENDIF.

    ENDIF.

    "Найдем ОИВ сотрудника
    IF lv_pernr IS NOT INITIAL.
      CALL METHOD zcl_hr_data=>read_pa_infty
        EXPORTING
          i_pernr = lv_pernr "CONV pernr_d( ls_req-subject )
          i_infty = '0001'
          i_endda = sy-datum
        IMPORTING
          e_pnnnn = lt_p0001.
      SORT lt_p0001 BY begda DESCENDING.
      READ TABLE lt_p0001 INTO DATA(ls_p0001) INDEX 1.
      CHECK sy-subrc = 0.

      CALL FUNCTION 'RH_STRUC_GET'
        EXPORTING
          act_otype      = 'O'
          act_objid      = ls_p0001-orgeh
          act_wegid      = 'A002'
          act_plvar      = '01'
          act_begda      = sy-datum
          act_endda      = sy-datum
        TABLES
          result_objec   = lt_result_objec
        EXCEPTIONS
          no_plvar_found = 1
          no_entry_found = 2
          OTHERS         = 3.

* -- Удаляем не орг структуры
      DELETE lt_result_objec WHERE otype NE 'O'.
      DATA(lv_tlines) = lines( lt_result_objec ) - 1.
      READ TABLE lt_result_objec INTO DATA(ls_oiv) INDEX lv_tlines.

      IF sy-subrc = 0.
        CALL METHOD zcl_hr_data=>get_name_orgeh
          EXPORTING
            i_orgeh = ls_oiv-objid
          IMPORTING
            e_lname = lv_oiv.

        INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
        <ls_ent>-wheretype = '0000'.
        <ls_ent>-wheretext = lv_oiv.

      ENDIF.

    ENDIF.

    SELECT * FROM zthr_addr INTO TABLE @DATA(lt_addr).
    LOOP AT lt_addr ASSIGNING FIELD-SYMBOL(<ls_addr>).
      INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING <ls_ent>.
      <ls_ent>-wheretype = <ls_addr>-org_num.
      <ls_ent>-wheretext = <ls_addr>-org_name.
*      IF <ls_ent>-wheretext EQ 'на характеристику' AND lv_oiv IS NOT INITIAL.
*        <ls_ent>-wheretext = lv_oiv.
*      ENDIF.
    ENDLOOP.
  ENDMETHOD.


  METHOD workactivityset_create_entity.
    TRY.
        io_data_provider->read_entry_data(
          IMPORTING
            es_data                      = er_entity
        ).
      CATCH /iwbep/cx_mgw_tech_exception.
    ENDTRY.
    CHECK er_entity-pernr <> 'new'.
    cl_reca_date=>convert_date_to_internal( EXPORTING id_date_external = er_entity-begin IMPORTING ed_date_internal = DATA(lv_begda) ).
    cl_reca_date=>convert_date_to_internal( EXPORTING id_date_external = er_entity-end IMPORTING ed_date_internal = DATA(lv_endda) ).
    IF lv_endda IS INITIAL.
      lv_endda = hr_high_date.
    ENDIF.
    IF lv_begda IS INITIAL.
      lv_begda = sy-datum.
    ENDIF.
    DATA(ls_0294) = VALUE p0294(
      infty = '0294'
      pernr = er_entity-pernr
      begda = lv_begda
      endda = lv_endda
      arbgb = er_entity-company
      deprt = er_entity-department
      posit = er_entity-position
      ort01 = er_entity-place
    ).
    DATA(ls_return) = VALUE bapireturn1( ).
    CALL FUNCTION 'HR_EMPLOYEE_ENQUEUE'
      EXPORTING
        number = CONV pernr_d( er_entity-pernr ).
    CALL FUNCTION 'HR_INFOTYPE_OPERATION'
      EXPORTING
        infty         = '0294'
        number        = CONV pernr_d( er_entity-pernr )
        validityend   = ls_0294-begda
        validitybegin = ls_0294-endda
        record        = ls_0294
        operation     = 'INS'
      IMPORTING
        return        = ls_return.
    IF ls_return-type = 'E'.
      RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception
        EXPORTING
          textid = VALUE #(
            msgid = ls_return-id
            msgno = ls_return-number
            attr1 = ls_return-message_v1
            attr2 = ls_return-message_v2
            attr3 = ls_return-message_v3
            attr4 = ls_return-message_v4
          ).
    ENDIF.
    CALL FUNCTION 'HR_EMPLOYEE_DEQUEUE'
      EXPORTING
        number = CONV pernr_d( er_entity-pernr ).
  ENDMETHOD.


  METHOD workactivityset_delete_entity.
    DATA: BEGIN OF ls_seqnr,
            begda TYPE datum,
            endda TYPE datum,
            seqnr TYPE seqnr,
          END OF ls_seqnr.
    DATA: ls_key TYPE zcl_zhr_argus_mpc=>ts_workactivity.
    _get_input(
      EXPORTING
        it_key_tab = it_key_tab
      IMPORTING
        es_input   = ls_key
    ).
    ls_seqnr = ls_key-seqnr.
    CHECK ls_key-pernr <> 'new'.
    SELECT SINGLE * FROM pa0294 INTO @DATA(ls_0294)
       WHERE pernr = @ls_key-pernr
      AND begda = @ls_seqnr-begda
      AND endda = @ls_seqnr-endda
      AND seqnr = @ls_seqnr-seqnr.
    CHECK sy-subrc = 0.
    DELETE pa0294 FROM ls_0294.
  ENDMETHOD.


  METHOD workactivityset_get_entity.
    _get_input(
      EXPORTING
        it_key_tab               = it_key_tab
      IMPORTING
        es_input                 = er_entity
    ).
  ENDMETHOD.


  METHOD workactivityset_get_entityset.
    DATA: ls_input LIKE LINE OF et_entityset.
    _get_input(
      EXPORTING
        it_key_tab               = it_key_tab
        it_filter_select_options = it_filter_select_options
      IMPORTING
        es_input                 = ls_input
    ).
    IF ls_input-pernr <> 'new'.
      SELECT * FROM pa0294 INTO TABLE @DATA(lt_0294) WHERE pernr = @ls_input-pernr.
    ENDIF.
    LOOP AT lt_0294 ASSIGNING FIELD-SYMBOL(<ls_0294>).
      INSERT INITIAL LINE INTO TABLE et_entityset ASSIGNING FIELD-SYMBOL(<ls_ent>).
      <ls_ent>-pernr = ls_input-pernr.
      <ls_ent>-seqnr = |{ <ls_0294>-begda }{ <ls_0294>-endda }{ <ls_0294>-seqnr }|.
      <ls_ent>-company = <ls_0294>-arbgb.
      <ls_ent>-department = <ls_0294>-deprt.
      <ls_ent>-position = <ls_0294>-posit.
      <ls_ent>-begin = |{ <ls_0294>-begda DATE = USER }|.
      <ls_ent>-end = |{ <ls_0294>-endda DATE = USER }|.
      IF <ls_0294>-zzaddresorganization IS NOT INITIAL.
        <ls_ent>-place = <ls_0294>-zzaddresorganization.
      ELSE.
        <ls_ent>-place = <ls_0294>-ort01.
      ENDIF.
      <ls_ent>-action = VALUE #( edit = abap_true delete = abap_true ).
    ENDLOOP.
  ENDMETHOD.


  METHOD workactivityset_update_entity.
    DATA: BEGIN OF ls_seqnr,
            begda TYPE datum,
            endda TYPE datum,
            seqnr TYPE seqnr,
          END OF ls_seqnr.
    DATA: ls_key TYPE zcl_zhr_argus_mpc=>ts_workactivity.
    _get_input(
      EXPORTING
        it_key_tab = it_key_tab
      IMPORTING
        es_input   = ls_key
    ).
    TRY.
        io_data_provider->read_entry_data(
          IMPORTING
            es_data                      = er_entity
        ).
      CATCH /iwbep/cx_mgw_tech_exception.
    ENDTRY.
    er_entity-pernr = ls_key-pernr.
    er_entity-seqnr = ls_key-seqnr.
    ls_seqnr = ls_key-seqnr.
    CHECK er_entity-pernr <> 'new'.
    SELECT SINGLE * FROM pa0294 INTO @DATA(ls_0294)
       WHERE pernr = @er_entity-pernr
      AND begda = @ls_seqnr-begda
      AND endda = @ls_seqnr-endda
      AND seqnr = @ls_seqnr-seqnr.
    CHECK sy-subrc = 0.
    cl_reca_date=>convert_date_to_internal( EXPORTING id_date_external = er_entity-begin IMPORTING ed_date_internal = DATA(lv_begda) ).
    cl_reca_date=>convert_date_to_internal( EXPORTING id_date_external = er_entity-end IMPORTING ed_date_internal = DATA(lv_endda) ).
    IF ls_seqnr-begda <> lv_begda OR ls_seqnr-endda <> lv_endda.
      DELETE pa0294 FROM ls_0294.
      ls_0294-begda = lv_begda.
      ls_0294-endda = lv_endda.
      ls_0294-arbgb = er_entity-company.
      ls_0294-deprt = er_entity-department.
      ls_0294-posit = er_entity-position.
      ls_0294-ort01 = er_entity-place.
      INSERT pa0294 FROM ls_0294.
    ELSE.
      UPDATE pa0294 SET
        arbgb = er_entity-company
        deprt = er_entity-department
        posit = er_entity-position
        ort01 = er_entity-place
      WHERE pernr = ls_0294-pernr
        AND begda = ls_0294-begda
        AND endda = ls_0294-endda
        AND seqnr = ls_0294-seqnr.
    ENDIF.
  ENDMETHOD.


  METHOD _duplicate_row.
    FIND iv_tag IN cv_docx RESULTS DATA(ls_res).
    DATA(lv_off) = ls_res-offset - 1000.
    DATA(lv_find) = cv_docx+lv_off.
    DATA(lv_row) = substring_to( val = substring_from( val = lv_find sub = '<w:tr' ) sub = '</w:tr>' ).
    DO iv_count - 1 TIMES.
      cv_docx = replace( val = cv_docx sub = lv_row with = |{ lv_row }{ lv_row }| ).
    ENDDO.
  ENDMETHOD.


  METHOD _get_analytic_print.
    TYPES: BEGIN OF ts_report,
             doc        TYPE pstring,
             ename      TYPE pstring,
             plans      TYPE pstring,
             oiv        TYPE pstring,
             year       TYPE pstring,
             personal   TYPE pstring,
             income     TYPE pstring,
             expense    TYPE pstring,
             transport  TYPE pstring,
             realty     TYPE pstring,
             bank       TYPE pstring,
             stock      TYPE pstring,
             obligation TYPE pstring,
             company    TYPE pstring,
             credit     TYPE pstring,
             deal       TYPE pstring,
           END OF ts_report.
    TYPES: BEGIN OF ts_map,
             field TYPE pstring,
             col   TYPE pstring,
           END OF ts_map.
    DATA: lt_map TYPE TABLE OF ts_map,
          lt_rep TYPE TABLE OF ts_report.
    DATA: lv_oiv      TYPE string,
          lv_position TYPE string.

    TRY.
        DATA(lo_xlsx) = NEW zcl_excel_reader_2007( )->zif_excel_reader~load(
            i_excel2007 = iv_x
        ).
      CATCH zcx_excel.
        RETURN.
    ENDTRY.
    IF iv_ref_id IS NOT INITIAL.
      APPEND iv_ref_id TO it_ref_id.
    ENDIF.
    LOOP AT it_ref_id ASSIGNING FIELD-SYMBOL(<lv_ref_id>).
      DATA(lo_ref) = NEW zcl_argus_ref( <lv_ref_id> ).
      INSERT INITIAL LINE INTO TABLE lt_rep ASSIGNING FIELD-SYMBOL(<ls_rep>).
      analyticdetailse_get_entity(
        EXPORTING
          iv_entity_name               = VALUE #( )
          iv_entity_set_name           = VALUE #( )
          iv_source_name               = VALUE #( )
          it_key_tab                   = VALUE #( ( name = 'refId' value = <lv_ref_id> ) )
          it_navigation_path           = VALUE #( )
        IMPORTING
          er_entity                    = DATA(ls_detail)
      ).
      <ls_rep> = CORRESPONDING #( ls_detail-indicator ).
      <ls_rep>-doc = <lv_ref_id>.
      <ls_rep>-ename = |{ lo_ref->gs_pers0-nachn } { lo_ref->gs_pers0-vorna } { lo_ref->gs_pers0-midnm }|.
*      <ls_rep>-plans = lo_ref->gs_work0-posit.
      <ls_rep>-year = lo_ref->gs_base0-begda(4).

      _get_oiv( EXPORTING iv_pernr    = lo_ref->gs_pers0-pernr
                IMPORTING ev_oiv      = lv_oiv
                          ev_position = lv_position ).
      <ls_rep>-plans = lv_position.
      <ls_rep>-oiv   = lv_oiv.

      LOOP AT CAST cl_abap_structdescr( cl_abap_typedescr=>describe_by_data( <ls_rep> ) )->get_components( ) ASSIGNING FIELD-SYMBOL(<ls_comp>).
        ASSIGN COMPONENT <ls_comp>-name OF STRUCTURE <ls_rep> TO FIELD-SYMBOL(<lv_fld>).
        CHECK sy-subrc = 0.
        <lv_fld> = replace( val = <lv_fld> sub = '<br>' with = cl_abap_char_utilities=>newline occ = 0 ).
        <lv_fld> = replace( val = <lv_fld> sub = '<li>' with = '-' occ = 0 ).
      ENDLOOP.
    ENDLOOP.
    IF lt_rep IS INITIAL.
      INSERT INITIAL LINE INTO TABLE lt_rep.
    ENDIF.
* excel
    DATA(lo_sheet) = lo_xlsx->get_active_worksheet( ).
    DATA(lv_tag) = lo_sheet->sheet_content[ cell_value = '[doc]' ]-cell_row.
    DO lines( lt_rep ) - 1 TIMES.
      lo_sheet->insert_after( ip_row = lv_tag - 1 ).
    ENDDO.
    DATA(lt_comp) = CAST cl_abap_structdescr( CAST cl_abap_tabledescr( cl_abap_typedescr=>describe_by_data( lt_rep ) )->get_table_line_type( ) )->get_components( ).
    LOOP AT lt_comp ASSIGNING <ls_comp>.
      TRY.
          INSERT VALUE #( field = <ls_comp>-name col = lo_sheet->sheet_content[ cell_value = |[{ to_lower( <ls_comp>-name ) }]| ]-cell_column ) INTO TABLE lt_map.
        CATCH cx_sy_itab_line_not_found.
      ENDTRY.
    ENDLOOP.
    LOOP AT lt_rep ASSIGNING <ls_rep>.
      LOOP AT lt_map ASSIGNING FIELD-SYMBOL(<ls_map>).
        ASSIGN COMPONENT <ls_map>-field OF STRUCTURE <ls_rep> TO <lv_fld>.
        CHECK sy-subrc = 0.
        TRY.
            lo_sheet->sheet_content[ cell_row = lv_tag cell_column = <ls_map>-col ]-cell_value = <lv_fld>.
          CATCH cx_sy_itab_line_not_found.
        ENDTRY.
      ENDLOOP.
      lv_tag = lv_tag + 1.
    ENDLOOP.
    DATA(lv_x) = NEW zcl_excel_writer_2007( )->zif_excel_writer~write_file( io_excel = lo_xlsx ).
    rv_x = lv_x.
  ENDMETHOD.


  METHOD _get_anketa.
    DATA: lv_plans_full TYPE string,
          lt_p0294      TYPE TABLE OF p0294,
          ls_p0294      TYPE p0294.
    TRY.
        DATA(lo_docx) = cl_docx_document=>load_document( iv_data = iv_x ).
        DATA(lo_documentpart) = lo_docx->get_maindocumentpart( ).
      CATCH cx_openxml_format cx_openxml_not_found.
    ENDTRY.
    DATA(lv_doctext) = cl_openxml_helper=>xstring_to_string( lo_documentpart->get_data( ) ).
    DATA(lt_key) = VALUE /iwbep/t_mgw_name_value_pair( ( name = 'PERNR' value = iv_pernr ) ).
    personalset_get_entity(
      EXPORTING
        iv_entity_name               = VALUE #( )
        iv_entity_set_name           = VALUE #( )
        iv_source_name               = VALUE #( )
        it_key_tab                   = lt_key
        it_navigation_path           = VALUE #( )    " table of navigation paths
      IMPORTING
        er_entity                    = DATA(ls_pers)
    ).
    jobset_get_entity(
      EXPORTING
        iv_entity_name               = VALUE #( )
        iv_entity_set_name           = VALUE #( )
        iv_source_name               = VALUE #( )
        it_key_tab                   = lt_key
        it_navigation_path           = VALUE #( )    " table of navigation paths
      IMPORTING
        er_entity                    = DATA(ls_job)
    ).
    addressset_get_entity(
      EXPORTING
        iv_entity_name               = VALUE #( )
        iv_entity_set_name           = VALUE #( )
        iv_source_name               = VALUE #( )
        it_key_tab                   = lt_key
        it_navigation_path           = VALUE #( )    " table of navigation paths
      IMPORTING
        er_entity                    = DATA(ls_addr)
    ).
    lv_doctext = replace( val = lv_doctext sub = '[ename]' with = ls_pers-name occ = 0 ).
    lv_doctext = replace( val = lv_doctext sub = '[oiv]' with = ls_job-oiv occ = 0 ).
    lv_doctext = replace( val = lv_doctext sub = '[orgeh]' with = ls_job-department occ = 0 ).
    CALL METHOD zcl_hr_data=>get_name_plans
      EXPORTING
        i_pernr = iv_pernr
*       i_date  = SY-DATUM
      IMPORTING
        e_lname = lv_plans_full.
    lv_doctext = replace( val = lv_doctext sub = '[plans]' with = lv_plans_full occ = 0 ).
    lv_doctext = replace( val = lv_doctext sub = '[gbdat]' with = ls_pers-dateofbirth occ = 0 ).
    lv_doctext = replace( val = lv_doctext sub = '[gplace]' with = ls_pers-placeofbirth occ = 0 ).
    lv_doctext = replace( val = lv_doctext sub = '[inn]' with = ls_pers-inn occ = 0 ).
    lv_doctext = replace( val = lv_doctext sub = '[snils]' with = ls_pers-snils occ = 0 ).
    lv_doctext = replace( val = lv_doctext sub = '[addr_reg]' with = |{ ls_addr-registration-city } { ls_addr-registration-region } { ls_addr-registration-street } { ls_addr-registration-house } { ls_addr-registration-apt }| occ = 0 ).
    lv_doctext = replace( val = lv_doctext sub = '[addr_fact]' with = |{ ls_addr-leaving-city } { ls_addr-leaving-region } { ls_addr-leaving-street } { ls_addr-leaving-house } { ls_addr-leaving-apt }| occ = 0 ).
* relative
    relativeset_get_entityset(
      EXPORTING
        iv_entity_name               = VALUE #( )
        iv_entity_set_name           = VALUE #( )
        iv_source_name               = VALUE #( )
        it_filter_select_options     = VALUE #( )
        is_paging                    = VALUE #( )
        it_key_tab                   = lt_key
        it_navigation_path           = VALUE #( )
        it_order                     = VALUE #( )
        iv_filter_string             = VALUE #( )
        iv_search_string             = VALUE #( )
      IMPORTING
        et_entityset                 = DATA(lt_rel)
    ).
    IF lt_rel IS INITIAL.
      INSERT INITIAL LINE INTO TABLE lt_rel.
    ENDIF.
    _duplicate_row(
      EXPORTING
        iv_tag   = '[rel_nachn]'
        iv_count = lines( lt_rel )
      CHANGING
        cv_docx  = lv_doctext
    ).
    LOOP AT lt_rel ASSIGNING FIELD-SYMBOL(<ls_rel>).
      lv_doctext = replace( val = lv_doctext sub = '[rel_nachn]' with = <ls_rel>-lastname ).
      lv_doctext = replace( val = lv_doctext sub = '[rel_name]' with = |{ <ls_rel>-firstname } { <ls_rel>-patronymic }| ).
      lv_doctext = replace( val = lv_doctext sub = '[rel_type]' with = <ls_rel>-type ).
      DATA(lv_job) = VALUE pstring( ).
      IF <ls_rel>-job IS NOT INITIAL.
        lv_job = |{ <ls_rel>-job-companyname } { <ls_rel>-job-city } { <ls_rel>-job-street } { <ls_rel>-job-house } { <ls_rel>-job-apt }|.
      ENDIF.
      lv_doctext = replace( val = lv_doctext sub = '[rel_work]' with = lv_job ).
    ENDLOOP.
* comission
    commissionset_get_entityset(
      EXPORTING
        iv_entity_name               = VALUE #( )
        iv_entity_set_name           = VALUE #( )
        iv_source_name               = VALUE #( )
        it_filter_select_options     = VALUE #( )
        is_paging                    = VALUE #( )
        it_key_tab                   = lt_key
        it_navigation_path           = VALUE #( )
        it_order                     = VALUE #( )
        iv_filter_string             = VALUE #( )
        iv_search_string             = VALUE #( )
      IMPORTING
        et_entityset                 = DATA(lt_comi)
    ).
    IF lt_comi IS INITIAL.
      INSERT INITIAL LINE INTO TABLE lt_comi.
    ENDIF.
    _duplicate_row(
      EXPORTING
        iv_tag   = '[com_base]'
        iv_count = lines( lt_comi )
      CHANGING
        cv_docx  = lv_doctext
    ).
    LOOP AT lt_comi ASSIGNING FIELD-SYMBOL(<ls_comi>).
      lv_doctext = replace( val = lv_doctext sub = '[com_base]' with = <ls_comi>-base ).
      lv_doctext = replace( val = lv_doctext sub = '[com_number]' with = <ls_comi>-datenumber ).
      lv_doctext = replace( val = lv_doctext sub = '[com_dec]' with = <ls_comi>-decision ).
      lv_doctext = replace( val = lv_doctext sub = '[com_mer]' with = '' ).
    ENDLOOP.
* realty
    realtyset_get_entityset(
      EXPORTING
        iv_entity_name               = VALUE #( )
        iv_entity_set_name           = VALUE #( )
        iv_source_name               = VALUE #( )
        it_filter_select_options     = VALUE #( )
        is_paging                    = VALUE #( )
        it_key_tab                   = lt_key
        it_navigation_path           = VALUE #( )
        it_order                     = VALUE #( )
        iv_filter_string             = VALUE #( )
        iv_search_string             = VALUE #( )
      IMPORTING
        et_entityset                 = DATA(lt_realty)
    ).
    IF lt_realty IS INITIAL.
      INSERT INITIAL LINE INTO TABLE lt_realty.
    ENDIF.
    _duplicate_row(
      EXPORTING
        iv_tag   = '[realty_type]'
        iv_count = lines( lt_realty )
      CHANGING
        cv_docx  = lv_doctext
    ).
    LOOP AT lt_realty ASSIGNING FIELD-SYMBOL(<ls_realty>).
      lv_doctext = replace( val = lv_doctext sub = '[realty_type]' with = <ls_realty>-property ).
      lv_doctext = replace( val = lv_doctext sub = '[realty_active]' with = <ls_realty>-use ).
      lv_doctext = replace( val = lv_doctext sub = '[realty_addr]' with = |{ <ls_realty>-address-city } { <ls_realty>-address-street } { <ls_realty>-address-house } { <ls_realty>-address-apt }| ).
    ENDLOOP.
* work
    workactivityset_get_entityset(
      EXPORTING
        iv_entity_name               = VALUE #( )
        iv_entity_set_name           = VALUE #( )
        iv_source_name               = VALUE #( )
        it_filter_select_options     = VALUE #( )
        is_paging                    = VALUE #( )
        it_key_tab                   = lt_key
        it_navigation_path           = VALUE #( )
        it_order                     = VALUE #( )
        iv_filter_string             = VALUE #( )
        iv_search_string             = VALUE #( )
      IMPORTING
        et_entityset                 = DATA(lt_work)
    ).
    IF lt_work IS INITIAL.
      INSERT INITIAL LINE INTO TABLE lt_work.
    ENDIF.
    _duplicate_row(
      EXPORTING
        iv_tag   = '[work_date]'
        iv_count = lines( lt_work )
      CHANGING
        cv_docx  = lv_doctext
    ).

    CALL METHOD zcl_hr_data=>read_pa_infty
      EXPORTING
        i_pernr = iv_pernr
        i_infty = '0294'
        i_endda = hr_high_date
      IMPORTING
        e_pnnnn = lt_p0294.

    LOOP AT lt_work ASSIGNING FIELD-SYMBOL(<ls_work>).
      CLEAR ls_p0294.
      IF lt_p0294 IS NOT INITIAL.
        READ TABLE lt_p0294 WITH KEY begda = |{ <ls_work>-begin+6(4) }{ <ls_work>-begin+3(2) }{ <ls_work>-begin(2) }| endda = |{ <ls_work>-end+6(4) }{ <ls_work>-end+3(2) }{ <ls_work>-end(2) }| INTO ls_p0294.
        IF sy-subrc = 0 AND ls_p0294-tls09 EQ abap_true.
          CALL METHOD zcl_hr_data=>get_name_plans
            EXPORTING
              i_pernr = ls_p0294-pernr
              i_date  = ls_p0294-begda
            IMPORTING
              e_lname = <ls_work>-position.

          CALL METHOD zcl_hr_data=>get_name_orgeh_full
            EXPORTING
              i_pernr = ls_p0294-pernr
              i_date  = ls_p0294-begda
*             i_quotes    =
*             i_separator = ' '
*             i_dellvl    =
            IMPORTING
              e_lname = <ls_work>-company.
        ENDIF.
      ENDIF.
      lv_doctext = replace( val = lv_doctext sub = '[work_plans]' with = <ls_work>-position ).
      lv_doctext = replace( val = lv_doctext sub = '[work_org]' with = <ls_work>-company ).
      lv_doctext = replace( val = lv_doctext sub = '[work_date]' with = |{ <ls_work>-begin } - { <ls_work>-end }| ).
    ENDLOOP.
* edu
    educationset_get_entityset(
      EXPORTING
        iv_entity_name               = VALUE #( )
        iv_entity_set_name           = VALUE #( )
        iv_source_name               = VALUE #( )
        it_filter_select_options     = VALUE #( )
        is_paging                    = VALUE #( )
        it_key_tab                   = lt_key
        it_navigation_path           = VALUE #( )
        it_order                     = VALUE #( )
        iv_filter_string             = VALUE #( )
        iv_search_string             = VALUE #( )
      IMPORTING
        et_entityset                 = DATA(lt_edu)
    ).
    IF lt_edu IS INITIAL.
      INSERT INITIAL LINE INTO TABLE lt_edu.
    ENDIF.
    _duplicate_row(
      EXPORTING
        iv_tag   = '[edu_period]'
        iv_count = lines( lt_edu )
      CHANGING
        cv_docx  = lv_doctext
    ).
    LOOP AT lt_edu ASSIGNING FIELD-SYMBOL(<ls_edu>).
      lv_doctext = replace( val = lv_doctext sub = '[edu_period]' with = |{ <ls_edu>-begin } - { <ls_edu>-end }| ).
      lv_doctext = replace( val = lv_doctext sub = '[edu_insti]' with = <ls_edu>-institute ).
      lv_doctext = replace( val = lv_doctext sub = '[edu_place]' with = <ls_edu>-place ).
    ENDLOOP.
* edu
    militaryset_get_entityset(
      EXPORTING
        iv_entity_name               = VALUE #( )
        iv_entity_set_name           = VALUE #( )
        iv_source_name               = VALUE #( )
        it_filter_select_options     = VALUE #( )
        is_paging                    = VALUE #( )
        it_key_tab                   = lt_key
        it_navigation_path           = VALUE #( )
        it_order                     = VALUE #( )
        iv_filter_string             = VALUE #( )
        iv_search_string             = VALUE #( )
      IMPORTING
        et_entityset                 = DATA(lt_mi)
    ).
    IF lt_mi IS INITIAL.
      INSERT INITIAL LINE INTO TABLE lt_mi.
    ENDIF.
    _duplicate_row(
      EXPORTING
        iv_tag   = '[mi_period]'
        iv_count = lines( lt_mi )
      CHANGING
        cv_docx  = lv_doctext
    ).
    LOOP AT lt_mi ASSIGNING FIELD-SYMBOL(<ls_mi>).
      lv_doctext = replace( val = lv_doctext sub = '[mi_period]' with = |{ <ls_mi>-begin } - { <ls_mi>-end }| ).
      lv_doctext = replace( val = lv_doctext sub = '[mi_number]' with = <ls_mi>-institute ).
      lv_doctext = replace( val = lv_doctext sub = '[mi_place]' with = <ls_mi>-place ).
    ENDLOOP.
* out
    lo_documentpart->feed_data( iv_data = cl_openxml_helper=>string_to_xstring( lv_doctext ) ).
    TRY.
        rv_x = lo_docx->get_package_data( ).
      CATCH cx_openxml_format.
        RETURN.
    ENDTRY.
  ENDMETHOD.


  METHOD _get_check_report.
    TRY.
        DATA(lo_docx) = cl_docx_document=>load_document( iv_data = iv_x ).
        DATA(lo_documentpart) = lo_docx->get_maindocumentpart( ).
      CATCH cx_openxml_format cx_openxml_not_found.
    ENDTRY.
    DATA(lv_doctext) = cl_openxml_helper=>xstring_to_string( lo_documentpart->get_data( ) ).
    DATA(lt_key) = VALUE /iwbep/t_mgw_name_value_pair( ( name = 'DOCID' value = iv_docid ) ).

    checkset_get_entity(
      EXPORTING
        iv_entity_name               = VALUE #( )
        iv_entity_set_name           = VALUE #( )
        iv_source_name               = VALUE #( )
        it_key_tab                   = lt_key
        it_navigation_path           = VALUE #( )    " table of navigation paths
      IMPORTING
        er_entity                    = DATA(ls_check)
    ).
    IF ls_check-subjectname IS NOT INITIAL.
      SPLIT ls_check-subjectname AT space INTO TABLE DATA(lt_spl).
      READ TABLE lt_spl INTO DATA(ls_spl) INDEX 1.
      IF sy-subrc = 0.
        ev_nachn = ls_spl.
      ENDIF.
    ENDIF.
    IF ls_check-orderdt IS NOT INITIAL AND ls_check-orderdt NE '00.00.0000'.
      lv_doctext = replace( val = lv_doctext sub = 'ДАТА РАСПОРЯЖЕНИЯ' with = ls_check-orderdt occ = 0 ).
    ELSE.
      lv_doctext = replace( val = lv_doctext sub = 'ДАТА РАСПОРЯЖЕНИЯ' with = '__________' occ = 0 ).
    ENDIF.
    IF ls_check-rasnu IS NOT INITIAL.
      lv_doctext = replace( val = lv_doctext sub = '[№РАСПОРЯЖЕНИЯ]' with = ls_check-rasnu occ = 0 ).
    ELSE.
      lv_doctext = replace( val = lv_doctext sub = '[№РАСПОРЯЖЕНИЯ]' with = '_____________' occ = 0 ).
    ENDIF.
    lv_doctext = replace( val = lv_doctext sub = '[Фамилия Имя Отчество]' with = ls_check-subjectname occ = 0 ).
    lv_doctext = replace( val = lv_doctext sub = '[ФИО]' with = ls_check-subjectname occ = 0 ).

    SPLIT ls_check-subjectname AT space INTO TABLE DATA(lt_fio).
    READ TABLE lt_fio INTO DATA(lv_lastn) INDEX 1.
    READ TABLE lt_fio INTO DATA(lv_firstn) INDEX 2.
    READ TABLE lt_fio INTO DATA(lv_patr) INDEX 3.
    IF lv_lastn IS NOT INITIAL AND lv_firstn IS NOT INITIAL AND lv_patr IS NOT INITIAL.
      lv_doctext = replace( val = lv_doctext sub = '[ИО ФАМИЛИЯ]' with = |{ lv_firstn(1) }.{ lv_patr(1) }. { lv_lastn }| occ = 0 ).
      lv_doctext = replace( val = lv_doctext sub = '[Имя Отчество]' with = |{ lv_firstn } { lv_patr }| occ = 0 ).
    ENDIF.

    lv_doctext = replace( val = lv_doctext sub = '[ШТАТНАЯ ДОЛЖНОСТЬ]' with = ls_check-subjectplans occ = 0 ).
    lv_doctext = replace( val = lv_doctext sub = '[КОМИТЕТ]' with = ls_check-subjectoiv occ = 0 ).
    SELECT SINGLE stext FROM zthr_rtypet WHERE spras = 'R' AND rtype = @ls_check-rtype INTO @DATA(lv_rtype_text).
    IF sy-subrc = 0.
      TRANSLATE lv_rtype_text TO LOWER CASE.
      lv_doctext = replace( val = lv_doctext sub = '[ВИД ПРОВЕРКИ]' with = lv_rtype_text occ = 0 ).
    ENDIF.

    READ TABLE lt_key ASSIGNING FIELD-SYMBOL(<ls_key>) WITH KEY name = 'DOCID'.
    IF sy-subrc = 0.
      <ls_key>-value = ls_check-subject.
      <ls_key>-name = 'PERNR'.
    ENDIF.
    addressset_get_entity(
      EXPORTING
        iv_entity_name               = VALUE #( )
        iv_entity_set_name           = VALUE #( )
        iv_source_name               = VALUE #( )
        it_key_tab                   = lt_key
        it_navigation_path           = VALUE #( )    " table of navigation paths
      IMPORTING
        er_entity                    = DATA(ls_pernr_addr)
        ).
    IF ls_pernr_addr IS NOT INITIAL.
      CONDENSE: ls_pernr_addr-registration-city, ls_pernr_addr-registration-region, ls_pernr_addr-registration-street,ls_pernr_addr-registration-house, ls_pernr_addr-registration-apt.
      lv_doctext = replace( val = lv_doctext sub = '[АДРЕС]' with = |{ ls_pernr_addr-registration-city }, { ls_pernr_addr-registration-region }, { ls_pernr_addr-registration-street }, { ls_pernr_addr-registration-house }, {
ls_pernr_addr-registration-apt }|
occ = 0 ).
    ENDIF.

* out
    lo_documentpart->feed_data( iv_data = cl_openxml_helper=>string_to_xstring( lv_doctext ) ).
    TRY.
        rv_x = lo_docx->get_package_data( ).
      CATCH cx_openxml_format.
        RETURN.
    ENDTRY.
  ENDMETHOD.


  METHOD _get_d12_print.
    TYPES: BEGIN OF ts_line,
             f_00 TYPE text255,
             f_01 TYPE text255,
             f_02 TYPE text255,
             f_03 TYPE text255,
             f_04 TYPE text255,
             f_05 TYPE text255,
             f_06 TYPE text255,
             f_07 TYPE text255,
             f_08 TYPE text255,
             f_09 TYPE text255,
             f_10 TYPE text255,
             f_11 TYPE text255,
             f_12 TYPE text255,
             f_13 TYPE text255,
             f_14 TYPE text255,
             f_15 TYPE text255,
             f_16 TYPE text255,
             f_17 TYPE text255,
             f_18 TYPE text255,
             f_19 TYPE text255,
           END OF ts_line.
    TYPES: BEGIN OF ts_map,
             field TYPE pstring,
             col   TYPE pstring,
           END OF ts_map.
    DATA: lt_map     TYPE TABLE OF ts_map.
    DATA: lt_tab TYPE TABLE OF ts_line.
    DATA: lv_orgeh            TYPE orgeh,
          lv_work             TYPE boole_d,
          lv_cat              TYPE hrobjid,
          so_datum            TYPE RANGE OF datum,
          so_orgeh            TYPE RANGE OF orgeh,
          lv_nachn            TYPE nachn,
          ls_input_orderprint TYPE zcl_zhr_argus_mpc=>tt_checkorder,
          lv_soldate          TYPE string.

    IF iv_parameters-isalloiv = 'true'.
      APPEND INITIAL LINE TO so_orgeh ASSIGNING FIELD-SYMBOL(<ls_orgeh>).
      <ls_orgeh>-sign = 'I'.
      <ls_orgeh>-option = 'EQ'.
      <ls_orgeh>-low = gc_all_oiv-oiv1.

      APPEND INITIAL LINE TO so_orgeh ASSIGNING <ls_orgeh>.
      <ls_orgeh>-sign = 'I'.
      <ls_orgeh>-option = 'EQ'.
      <ls_orgeh>-low = gc_all_oiv-oiv2.

    ELSEIF iv_parameters-oiv IS NOT INITIAL.
      APPEND INITIAL LINE TO so_orgeh ASSIGNING <ls_orgeh>.
      <ls_orgeh>-sign = 'I'.
      <ls_orgeh>-option = 'EQ'.
      <ls_orgeh>-low = iv_parameters-oiv.
    ENDIF.

    CHECK so_orgeh IS NOT INITIAL.
    TRY.
        DATA(lo_xlsx) = NEW zcl_excel_reader_2007( )->zif_excel_reader~load(
            i_excel2007 = iv_x
        ).
      CATCH zcx_excel.
        RETURN.
    ENDTRY.

    lv_orgeh = iv_parameters-oiv.
    lv_cat = iv_parameters-category.
    IF iv_parameters-begda IS NOT INITIAL.
      APPEND INITIAL LINE TO so_datum ASSIGNING FIELD-SYMBOL(<ls_datum>).
      <ls_datum>-sign = 'I'.
      <ls_datum>-option = 'BT'.
      <ls_datum>-low = iv_parameters-begda.
      <ls_datum>-high = COND #( WHEN iv_parameters-endda IS NOT INITIAL THEN iv_parameters-endda ELSE hr_high_date ).
    ELSE.
      APPEND INITIAL LINE TO so_datum ASSIGNING <ls_datum>.
      <ls_datum>-sign = 'I'.
      <ls_datum>-option = 'BT'.
      <ls_datum>-low = |{ sy-datum(4) }0101|.
      <ls_datum>-high = |{ sy-datum(4) }1231|.
    ENDIF.
*   запуск отчета
    SUBMIT zhr_pa_d012_01 WITH p_orgeh IN so_orgeh "= lv_orgeh
                          WITH p_per IN so_datum
                          WITH p_portal = abap_true
                          WITH p_nachn = lv_nachn
                          WITH p_2kobj = lv_cat
                          AND RETURN.
    IMPORT mt_tab TO lt_tab FROM MEMORY ID zcl_zhr_argus_dpc_ext=>gc_report_memo.
    FREE MEMORY ID zcl_zhr_argus_dpc_ext=>gc_report_memo.
    LOOP AT lt_tab ASSIGNING FIELD-SYMBOL(<ls_tab>).
      <ls_tab>-f_12 = <ls_tab>-f_12+1(2).
    ENDLOOP.
    IF iv_parameters-rtype IS NOT INITIAL.
      DELETE lt_tab WHERE f_12 NE iv_parameters-rtype.
    ENDIF.
    IF iv_parameters-solutdate IS NOT INITIAL.
      lv_soldate = |{ iv_parameters-solutdate+6(2) }.{ iv_parameters-solutdate+4(2) }.{ iv_parameters-solutdate(4) }|.
      DELETE lt_tab WHERE f_09 NE lv_soldate.
    ENDIF.
    CHECK lt_tab IS NOT INITIAL.

* excel
* Добавляем таблицу в отчет
    DATA(lo_sheet) = lo_xlsx->get_active_worksheet( ).
    DATA(lv_tag) = lo_sheet->sheet_content[ cell_value = 'f_01' ]-cell_row.
    DO lines( lt_tab ) - 1 TIMES.
      lo_sheet->insert_after( ip_row = lv_tag - 1 ).
    ENDDO.
    DATA(lt_comp) = CAST cl_abap_structdescr( CAST cl_abap_tabledescr( cl_abap_typedescr=>describe_by_data( lt_tab ) )->get_table_line_type( ) )->get_components( ).
    LOOP AT lt_comp ASSIGNING FIELD-SYMBOL(<ls_comp>).
      LOOP AT lo_sheet->sheet_content INTO DATA(ls_cont) WHERE cell_value CS |{ to_lower( <ls_comp>-name ) }|.
        TRY.
            INSERT VALUE #( field = <ls_comp>-name col = ls_cont-cell_column ) INTO TABLE lt_map.
          CATCH cx_sy_itab_line_not_found.
        ENDTRY.
        EXIT.
      ENDLOOP.
    ENDLOOP.
* Удаляем закладки из документа
    LOOP AT lt_comp ASSIGNING <ls_comp>.
      LOOP AT lo_sheet->sheet_content ASSIGNING FIELD-SYMBOL(<ls_cont>) WHERE cell_value CS |{ to_lower( <ls_comp>-name ) }|.
        <ls_cont>-cell_value = ''.
      ENDLOOP.
    ENDLOOP.
* Заполняем таблицу данными
    LOOP AT lt_tab ASSIGNING FIELD-SYMBOL(<ls_rep>).
      LOOP AT lt_map ASSIGNING FIELD-SYMBOL(<ls_map>).
        ASSIGN COMPONENT <ls_map>-field OF STRUCTURE <ls_rep> TO FIELD-SYMBOL(<lv_fld>).
        CHECK sy-subrc = 0.
        TRY.
            DATA(lv_val) = lo_sheet->sheet_content[ cell_row = lv_tag cell_column = <ls_map>-col ]-cell_value.
            CONCATENATE lv_val <lv_fld> INTO lv_val SEPARATED BY space.
            CONDENSE lv_val.
            lo_sheet->sheet_content[ cell_row = lv_tag cell_column = <ls_map>-col ]-cell_value = lv_val.
          CATCH cx_sy_itab_line_not_found.
        ENDTRY.
      ENDLOOP.
      lv_tag = lv_tag + 1.
    ENDLOOP.


    LOOP AT lo_sheet->sheet_content ASSIGNING FIELD-SYMBOL(<ls_shet>) WHERE cell_value CS '[Поле 1]'.
      <ls_shet>-cell_value = replace( val = <ls_shet>-cell_value sub = '[Поле 1]' with = |{ <ls_datum>-low DATE = USER } - { <ls_datum>-high DATE = USER } год| occ = 0 ).
    ENDLOOP.
    DATA(lv_x) = NEW zcl_excel_writer_2007( )->zif_excel_writer~write_file( io_excel = lo_xlsx ).
    rv_x = lv_x.
  ENDMETHOD.


  METHOD _get_input.
    LOOP AT it_key_tab INTO DATA(ls_key).
      TRANSLATE ls_key-name TO UPPER CASE.
      ASSIGN COMPONENT ls_key-name OF STRUCTURE es_input TO FIELD-SYMBOL(<lv_field>).
      CHECK sy-subrc = 0.
      <lv_field> = ls_key-value.
    ENDLOOP.
    IF es_input IS INITIAL.
      LOOP AT it_filter_select_options INTO DATA(ls_filter).
        READ TABLE ls_filter-select_options ASSIGNING FIELD-SYMBOL(<ls_option>) INDEX 1.
        CHECK sy-subrc = 0.
        TRANSLATE ls_filter-property TO UPPER CASE.
        ASSIGN COMPONENT ls_filter-property OF STRUCTURE es_input TO <lv_field>.
        CHECK sy-subrc = 0.
        <lv_field> = <ls_option>-low.
      ENDLOOP.
    ENDIF.
  ENDMETHOD.


  METHOD _get_inspectors.

    CONSTANTS: lc_arg_name_ms  TYPE agr_users-agr_name VALUE 'ZHR_ARGUS_CONTROL_MS',
               lc_arg_name_gd  TYPE agr_users-agr_name VALUE 'ZHR_ARGUS_CONTROL_GD',
               lc_arg_name_ggs TYPE agr_users-agr_name VALUE 'ZHR_ARGUS_CONTROL_GGS'.

    DATA: lt_p0105 TYPE TABLE OF pa0105,
          ls_p0105 LIKE LINE OF lt_p0105,
          ls_ins   LIKE LINE OF rt_ins.


    IF iv_role_ms = abap_true.

      SELECT pa0105~* FROM pa0105
        INNER JOIN agr_users
          ON agr_users~uname = pa0105~usrid
        AND agr_users~agr_name = @lc_arg_name_ms
        INTO TABLE @lt_p0105.

      LOOP AT lt_p0105 INTO ls_p0105.
        ls_ins-sign = 'I'.
        ls_ins-option = 'EQ'.
        ls_ins-low = ls_p0105-pernr.
        APPEND ls_ins TO rt_ins.
      ENDLOOP.

    ENDIF.

    IF iv_role_gd = abap_true.
      CLEAR lt_p0105.

      SELECT pa0105~* FROM pa0105
        INNER JOIN agr_users
          ON agr_users~uname = pa0105~usrid
        AND agr_users~agr_name = @lc_arg_name_gd
        INTO TABLE @lt_p0105.

      LOOP AT lt_p0105 INTO ls_p0105.
        ls_ins-sign = 'I'.
        ls_ins-option = 'EQ'.
        ls_ins-low = ls_p0105-pernr.
        APPEND ls_ins TO rt_ins.
      ENDLOOP.
    ENDIF.

    IF iv_role_ggs = abap_true.
      CLEAR lt_p0105.

      SELECT pa0105~* FROM pa0105
        INNER JOIN agr_users
          ON agr_users~uname = pa0105~usrid
        AND agr_users~agr_name = @lc_arg_name_ggs
        INTO TABLE @lt_p0105.

      LOOP AT lt_p0105 INTO ls_p0105.
        ls_ins-sign = 'I'.
        ls_ins-option = 'EQ'.
        ls_ins-low = ls_p0105-pernr.
        APPEND ls_ins TO rt_ins.
      ENDLOOP.
    ENDIF.

    SORT rt_ins BY low.
    DELETE ADJACENT DUPLICATES FROM rt_ins.

  ENDMETHOD.


  METHOD _get_name_by_criteria.
    rv_name = SWITCH #( iv_name
      WHEN 'NACHN' THEN 'Фамилия'
      WHEN 'VORNA' THEN 'Имя'
      WHEN 'MIDNM' THEN 'Отчество'
      WHEN 'GESCH' THEN 'Пол'
      WHEN 'GBDAT' THEN 'Дата рождения'
      WHEN 'GBJHR' THEN 'Год рождения'
      WHEN 'GBMON' THEN 'Месяц рождения'
      WHEN 'GBTAG' THEN 'День рождения'
      WHEN 'GBLND' THEN 'Страна рождения'
      WHEN 'GBDEP' THEN 'Область, край рождения'
      WHEN 'GBORT' THEN 'Место рождения'
      WHEN 'NATIO' THEN 'Гражданство'
      WHEN 'BUKRS' THEN 'Балансовая единица'
      WHEN 'PERSA' THEN 'Раздел персонала'
      WHEN 'PERSG' THEN 'Группа сотрудников'
      WHEN 'PERSK' THEN 'Категория сотрудников'
      WHEN 'ORGEH' THEN 'Организационная единица'
      WHEN 'PLANS' THEN 'Штатная должность'
      WHEN 'STELL' THEN 'Должность'
      WHEN 'PSTLZ' THEN 'Почтовый индекс'
      WHEN 'PSTLZ' THEN 'Почтовый индекс'
      WHEN 'LAND1' THEN 'Страна'
      WHEN 'STATE' THEN 'Регион'
      WHEN 'ORT01' THEN 'Город'
      WHEN 'ORT02' THEN 'Район города'
      WHEN 'STRAS' THEN 'Улица'
      WHEN 'HSNMR' THEN 'Номер дома'
      WHEN 'POSTA' THEN 'Квартира'
      WHEN 'POSTA' THEN 'Квартира'
      WHEN 'JOB_NAME' THEN 'Работодатель'
      WHEN 'JOB_CITY' THEN 'Город предыдущего места работы'
      WHEN 'JOB_ORGEH' THEN 'Подразделение'
      WHEN 'JOB_PLANS' THEN 'Штатная должность'
      WHEN 'INSTI' THEN 'Образовательное учреждение'
      WHEN 'DPTMT' THEN 'Уровень образования'
      WHEN 'START' THEN 'Дата начала образования'
      WHEN 'END' THEN 'Дата окончания образования'
      WHEN 'END' THEN 'Дата окончания образования'
      WHEN 'INSTI_MI' THEN 'Воинская часть'
      WHEN 'DPTMT_MI' THEN 'Расположение воинской части'
      WHEN 'START_MI' THEN 'Дата начала службы'
      WHEN 'END_MI' THEN 'Дата окончания службы'
      WHEN 'FTYPE' THEN 'Тип родственника'
      WHEN 'FBIRTH' THEN 'Дата рождения родственника'
      WHEN 'FNACHN' THEN 'Фамилия родственника'
      WHEN 'FVORNA' THEN 'Имя родственника'
      WHEN 'FMIDNM' THEN 'Отчество родственника'
      ELSE iv_name
    ).
  ENDMETHOD.


  METHOD _get_oiv.

    SELECT * FROM pa0001 INTO TABLE @DATA(lt_0001) WHERE pernr = @iv_pernr.

    SORT lt_0001 BY begda DESCENDING.
    ASSIGN lt_0001[ 1 ] TO FIELD-SYMBOL(<ls_0001>).
    CHECK sy-subrc = 0.
    ev_oiv = zcl_hr_data_utils=>get_last_but_one_ogreh_name_o(
       i_otype = cl_hap_pmp_const=>otype_orgunit
       i_objid = <ls_0001>-orgeh
    ).

    SELECT * FROM hrp1000 INTO TABLE @DATA(lt_txt)
         WHERE plvar = @cl_hap_pmp_const=>plvar
         AND ( otype = @cl_hap_pmp_const=>otype_orgunit OR otype = @cl_hap_pmp_const=>otype_position )
         AND ( objid = @<ls_0001>-plans OR objid = @<ls_0001>-orgeh )
         AND langu = @sy-langu
         ORDER BY begda DESCENDING.
    ev_position = VALUE #( lt_txt[ otype = cl_hap_pmp_const=>otype_position objid = <ls_0001>-plans ]-stext OPTIONAL ).

  ENDMETHOD.


METHOD _get_photo.
  SELECT SINGLE *
    INTO @DATA(ls_srgbtbrel)
    FROM srgbtbrel
    WHERE instid_a = @iv_pernr
      AND typeid_a = 'BUS1065'.
  CHECK sy-subrc = 0.
  DATA lt_hex TYPE TABLE OF solix.
  CALL FUNCTION 'SO_DOCUMENT_READ_API1'
    EXPORTING
      document_id  = CONV sofolenti1-doc_id( ls_srgbtbrel-instid_b )
    TABLES
      contents_hex = lt_hex
    EXCEPTIONS
      OTHERS       = 4.
  cl_bcs_convert=>solix_to_xstring(
    EXPORTING
      it_solix   = lt_hex
*      iv_size    =
    RECEIVING
      ev_xstring = rv_x
  ).
ENDMETHOD.


  METHOD _get_ref_print.
    TYPES: BEGIN OF ts_merge,
             name      TYPE pstring,
             value     TYPE pstring,
             row_start TYPE i,
             row_end   TYPE i,
             col_start TYPE i,
             col_end   TYPE i,
           END OF ts_merge.
    TYPES: BEGIN OF ts_report,
             year                 TYPE pstring,
             num                  TYPE pstring,
             ename                TYPE pstring,
             plans                TYPE pstring,
             realty_type          TYPE pstring,
             realty_property_type TYPE pstring,
             realty_area          TYPE pstring,
             realty_country       TYPE pstring,
             obli_type            TYPE pstring,
             obli_area            TYPE pstring,
             obli_country         TYPE pstring,
             tr_type              TYPE pstring,
             income               TYPE pstring,
             income_source        TYPE pstring,
           END OF ts_report.
    TYPES: BEGIN OF ts_map,
             field TYPE pstring,
             col   TYPE pstring,
           END OF ts_map.
    DATA: lt_map     TYPE TABLE OF ts_map,
          lt_rep     TYPE TABLE OF ts_report,
          lt_rep_all TYPE TABLE OF ts_report,
          lt_merge   TYPE TABLE OF ts_merge.
    TRY.
        DATA(lo_xlsx) = NEW zcl_excel_reader_2007( )->zif_excel_reader~load(
            i_excel2007 = iv_x
        ).
      CATCH zcx_excel.
        RETURN.
    ENDTRY.
    IF iv_ref_id IS NOT INITIAL.
      APPEND iv_ref_id TO it_ref_id.
    ENDIF.
    DATA(lt_inbound_ref) = it_ref_id.
    LOOP AT lt_inbound_ref ASSIGNING FIELD-SYMBOL(<lv_ref_id>).
      DATA(lv_self_print) = CONV flag( boolc( <lv_ref_id> = iv_ref_id ) ).
      DATA(lv_tabix) = sy-tabix.
      CLEAR lt_rep.
      DATA(lo_ref) = NEW zcl_argus_ref( <lv_ref_id> ).
      LOOP AT lo_ref->get_rel_ref( ) ASSIGNING FIELD-SYMBOL(<ls_rel_ref>).
        CHECK NOT line_exists( lt_inbound_ref[ table_line = <ls_rel_ref>->gs_base0-docid ] ).
        INSERT <ls_rel_ref>->gs_base0-docid INTO lt_inbound_ref INDEX lv_tabix + 1.
      ENDLOOP.
      INSERT INITIAL LINE INTO TABLE lt_rep ASSIGNING FIELD-SYMBOL(<ls_rep>).
      <ls_rep>-num = lv_tabix.
      IF lo_ref->gs_pers0-idfam IS NOT INITIAL AND lv_self_print = abap_false.
        CLEAR <ls_rep>-num.
      ENDIF.
      IF lo_ref->gs_pers0-idfam IS INITIAL OR lv_self_print = abap_true.
        <ls_rep>-ename = |{ lo_ref->gs_pers0-nachn }|.
        IF lo_ref->gs_pers0-vorna IS NOT INITIAL.
          <ls_rep>-ename = |{ <ls_rep>-ename } { lo_ref->gs_pers0-vorna(1) }.|.
        ENDIF.
        IF lo_ref->gs_pers0-midnm IS NOT INITIAL.
          <ls_rep>-ename = |{ <ls_rep>-ename } { lo_ref->gs_pers0-midnm(1) }.|.
        ENDIF.
      ELSE.
        IF strlen( lo_ref->gs_pers0-idfam ) >= 18.
          <ls_rep>-ename = cl_hr_t591s=>read( infty = '0021' subty = CONV #( lo_ref->gs_pers0-idfam+16(2) ) )-stext.
          <ls_rep>-ename = SWITCH #( <ls_rep>-ename
            WHEN 'Муж' THEN 'Супруг'
            WHEN 'Жена' THEN 'Супруга'
            ELSE <ls_rep>-ename
          ).
        ENDIF.
      ENDIF.
      IF lo_ref->gs_pers0-idfam IS INITIAL OR lv_self_print = abap_true.
        <ls_rep>-plans = lo_ref->gs_work0-posit.
      ELSE.
*        <ls_rep>-plans = |'|.
      ENDIF.
      LOOP AT lo_ref->gt_bldn0 ASSIGNING FIELD-SYMBOL(<ls_bldn>).
        IF sy-tabix <> 1.
          INSERT INITIAL LINE INTO TABLE lt_rep ASSIGNING <ls_rep>.
        ENDIF.
        DATA(lv_estate) = _split_case( CONV #( <ls_bldn>-estate ) ).
        <ls_rep>-realty_type = <ls_bldn>-proname.
        IF lv_estate IS NOT INITIAL AND lv_estate <> <ls_rep>-realty_type.
          <ls_rep>-realty_type = |{ lv_estate } - { <ls_rep>-realty_type }|.
        ENDIF.
        <ls_rep>-realty_property_type = <ls_bldn>-protype2.
        <ls_rep>-realty_area = <ls_bldn>-area.
        <ls_rep>-realty_country = |{ <ls_bldn>-land1 }|. " { <ls_bldn>-name_city }|.
      ENDLOOP.
      LOOP AT lo_ref->gt_obli0 ASSIGNING FIELD-SYMBOL(<ls_obli>).
        ASSIGN lt_rep[ sy-tabix ] TO <ls_rep>.
        IF sy-subrc <> 0.
          INSERT INITIAL LINE INTO TABLE lt_rep ASSIGNING <ls_rep>.
        ENDIF.
        DATA(lv_protype) = _split_case( CONV #( <ls_obli>-protype ) )."Шаталов
        <ls_rep>-obli_type = COND #( WHEN ( lv_protype IS INITIAL OR lv_protype EQ <ls_obli>-name ) THEN <ls_obli>-name ELSE |{ lv_protype } - { <ls_obli>-name }| ).
        <ls_rep>-obli_area = <ls_obli>-area.
        <ls_rep>-obli_country = |{ <ls_obli>-land1 }|. " { <ls_obli>-name_city }|.
      ENDLOOP.
      LOOP AT lo_ref->gt_tran0 ASSIGNING FIELD-SYMBOL(<ls_tr>).
        ASSIGN lt_rep[ sy-tabix ] TO <ls_rep>.
        IF sy-subrc <> 0.
          INSERT INITIAL LINE INTO TABLE lt_rep ASSIGNING <ls_rep>.
        ENDIF.
        <ls_rep>-tr_type = |{ <ls_tr>-trntype } { <ls_tr>-trnbrand } { <ls_tr>-trnmodel }|.
      ENDLOOP.
      DATA(lv_in) = VALUE pstring( ).
      LOOP AT lo_ref->gt_incm0 ASSIGNING FIELD-SYMBOL(<ls_inc>).
        lv_in = lv_in + <ls_inc>-amount.
      ENDLOOP.
      ASSIGN lt_rep[ 1 ] TO <ls_rep>.
      <ls_rep>-income = lv_in.
      LOOP AT lo_ref->gt_expn0 ASSIGNING FIELD-SYMBOL(<ls_exp>).
        ASSIGN lt_rep[ sy-tabix ] TO <ls_rep>.
        IF sy-subrc <> 0.
          INSERT INITIAL LINE INTO TABLE lt_rep ASSIGNING <ls_rep>.
        ENDIF.
        <ls_rep>-income_source = <ls_exp>-sfpwa.
      ENDLOOP.
      DELETE lt_rep WHERE table_line IS INITIAL.
      INSERT LINES OF lt_rep INTO TABLE lt_rep_all.
    ENDLOOP.
    IF lt_rep_all IS INITIAL.
      INSERT INITIAL LINE INTO TABLE lt_rep_all.
    ENDIF.
* excel
    DATA(lo_sheet) = lo_xlsx->get_active_worksheet( ).
    DATA(lv_tag) = lo_sheet->sheet_content[ cell_value = '[num]' ]-cell_row.
    DO lines( lt_rep_all ) - 1 TIMES.
      lo_sheet->insert_after( ip_row = lv_tag - 1 ).
    ENDDO.
    DATA(lt_comp) = CAST cl_abap_structdescr( CAST cl_abap_tabledescr( cl_abap_typedescr=>describe_by_data( lt_rep_all ) )->get_table_line_type( ) )->get_components( ).
    LOOP AT lt_comp ASSIGNING FIELD-SYMBOL(<ls_comp>).
      TRY.
          INSERT VALUE #( field = <ls_comp>-name col = lo_sheet->sheet_content[ cell_value = |[{ to_lower( <ls_comp>-name ) }]| ]-cell_column ) INTO TABLE lt_map.
        CATCH cx_sy_itab_line_not_found.
      ENDTRY.
    ENDLOOP.
    LOOP AT lt_rep_all ASSIGNING <ls_rep>.
      LOOP AT lt_map ASSIGNING FIELD-SYMBOL(<ls_map>).
        ASSIGN COMPONENT <ls_map>-field OF STRUCTURE <ls_rep> TO FIELD-SYMBOL(<lv_fld>).
        CHECK sy-subrc = 0.
        TRY.
            lo_sheet->sheet_content[ cell_row = lv_tag cell_column = <ls_map>-col ]-cell_value = <lv_fld>.
          CATCH cx_sy_itab_line_not_found.
        ENDTRY.
        CASE <ls_map>-field.
          WHEN 'NUM'.
            IF <lv_fld> IS NOT INITIAL.
              DATA(lv_prev_num) = CONV pstring( <lv_fld> ).
              INSERT VALUE #(
                name = <ls_map>-field
                value = <lv_fld>
                row_start = lv_tag
                row_end = lv_tag
                col_start = <ls_map>-col
                col_end = <ls_map>-col
              ) INTO TABLE lt_merge.
            ELSE.
              LOOP AT lt_merge ASSIGNING FIELD-SYMBOL(<ls_merge>) WHERE name = <ls_map>-field AND value = lv_prev_num.
              ENDLOOP.
              IF sy-subrc = 0.
                <ls_merge>-row_end = lv_tag.
              ENDIF.
            ENDIF.
          WHEN 'ENAME'.
            IF <lv_fld> IS NOT INITIAL.
              DATA(lv_prev_ename) = CONV pstring( <lv_fld> ).
              INSERT VALUE #(
                name = <ls_map>-field
                value = <lv_fld>
                row_start = lv_tag
                row_end = lv_tag
                col_start = <ls_map>-col
                col_end = <ls_map>-col
              ) INTO TABLE lt_merge.
            ELSE.
              LOOP AT lt_merge ASSIGNING <ls_merge> WHERE name = <ls_map>-field AND value = lv_prev_ename.
              ENDLOOP.
              IF sy-subrc = 0.
                <ls_merge>-row_end = lv_tag.
              ENDIF.
            ENDIF.
*          WHEN 'PLANS'.
*            IF <lv_fld> IS NOT INITIAL.
*              DATA(lv_prev_plans) = CONV pstring( <lv_fld> ).
*              INSERT VALUE #(
*                name = <ls_map>-field
*                value = <lv_fld>
*                row_start = lv_tag
*                row_end = lv_tag
*                col_start = <ls_map>-col
*                col_end = <ls_map>-col
*              ) INTO TABLE lt_merge.
*            ELSE.
*              LOOP AT lt_merge ASSIGNING <ls_merge> WHERE name = <ls_map>-field AND value = lv_prev_plans.
*              ENDLOOP.
*              IF sy-subrc = 0.
*                <ls_merge>-row_end = lv_tag.
*              ENDIF.
*            ENDIF.
        ENDCASE.
      ENDLOOP.
      lv_tag = lv_tag + 1.
    ENDLOOP.
    LOOP AT lt_merge ASSIGNING <ls_merge>.
      lo_sheet->set_merge(
          ip_column_start = <ls_merge>-col_start
          ip_column_end   = <ls_merge>-col_end
          ip_row          = <ls_merge>-row_start
          ip_row_to       = <ls_merge>-row_end
      ).
      IF <ls_merge>-name = 'ENAME'.
        lo_sheet->set_merge(
          ip_column_start = <ls_merge>-col_start + 1
          ip_column_end   = <ls_merge>-col_end + 1
          ip_row          = <ls_merge>-row_start
          ip_row_to       = <ls_merge>-row_end
      ).
      ENDIF.
*      DATA(lo_style) = lo_sheet->excel->add_new_style( ).
*      DATA(lo_b) = NEW zcl_excel_style_border( ).
*      lo_b->border_style = zcl_excel_style_border=>c_border_medium.
*      lo_style->borders->allborders = lo_b.
*      lo_sheet->set_(
*          ip_column_start = 1
*          ip_column_end   = 13
*          ip_row          = <ls_merge>-row_start
*          ip_row_to       = <ls_merge>-row_end
*          ip_style        = lo_style->get_guid( )
*      ).
    ENDLOOP.
    LOOP AT lo_sheet->sheet_content ASSIGNING FIELD-SYMBOL(<ls_shet>) WHERE cell_value CS '[year]'.
      <ls_shet>-cell_value = replace( val = <ls_shet>-cell_value sub = '[year]' with = lo_ref->gs_base0-begda(4) occ = 0 ).
    ENDLOOP.
    DATA(lv_x) = NEW zcl_excel_writer_2007( )->zif_excel_writer~write_file( io_excel = lo_xlsx ).
    rv_x = lv_x.
  ENDMETHOD.


METHOD _get_ref_until_date.
  CLEAR rv_date.
  DATA(lv_empty_year) = VALUE zthr_argus_dates-jyear( ).
  SELECT * FROM zthr_argus_dates INTO TABLE @DATA(lt_dates) WHERE jyear = @iv_year.
  IF sy-subrc <> 0.
    SELECT * FROM zthr_argus_dates INTO TABLE @lt_dates WHERE jyear = @lv_empty_year.
  ENDIF.
  DATA(lv_p1) = VALUE char1( ).
  zcl_hr_data=>get_plans_param(
    EXPORTING
      i_plans  = iv_plans
    IMPORTING
      e_param1 = lv_p1
  ).
  TRY.
      DATA(lv_until) = lt_dates[ category = lv_p1 ]-endda.
      rv_date = |{ iv_year + 1 }{ lv_until+3(2) }{ lv_until(2) }|.
    CATCH cx_sy_itab_line_not_found.
      LOOP AT lt_dates ASSIGNING FIELD-SYMBOL(<ls_dates>) WHERE category IS INITIAL.
        lv_until = <ls_dates>-endda.
        rv_date = |{ iv_year + 1 }{ lv_until+3(2) }{ lv_until(2) }|.
        RETURN.
      ENDLOOP.
  ENDTRY.
ENDMETHOD.


  METHOD _get_report.
    TYPES: BEGIN OF ts_map,
             field TYPE pstring,
             col   TYPE pstring,
           END OF ts_map.
    DATA: lt_map TYPE TABLE OF ts_map,
          lt_rep TYPE TABLE OF ts_report.
    SPLIT iv_report_id AT '~' INTO DATA(lv_cat) DATA(lv_rep).
    IF lv_rep IS INITIAL.
      lv_rep = iv_report_id.
    ENDIF.
    reportset_get_entityset(
      EXPORTING
        iv_entity_name               = VALUE #( )
        iv_entity_set_name           = VALUE #( )
        iv_source_name               = VALUE #( )
        it_filter_select_options     = VALUE #( )
        is_paging                    = VALUE #( )
        it_key_tab                   = VALUE #( ( name = 'REPORTID' value = iv_report_id ) )
        it_navigation_path           = VALUE #( )
        it_order                     = VALUE #( )
        iv_filter_string             = VALUE #( )
        iv_search_string             = VALUE #( )
      IMPORTING
        et_entityset                 = DATA(lt_reps)
    ).
    IF it_pernr IS NOT INITIAL.
      LOOP AT lt_reps ASSIGNING FIELD-SYMBOL(<ls_reps>).
        CHECK NOT line_exists( it_pernr[ table_line = <ls_reps>-pernr ] ).
        DELETE lt_reps.
      ENDLOOP.
    ENDIF.
    _get_report_xls(
      EXPORTING
        it_report = lt_reps
        iv_report_id = lv_rep
      IMPORTING
        et_report = lt_rep
    ).
    IF lt_rep IS INITIAL.
      INSERT INITIAL LINE INTO TABLE lt_rep.
    ENDIF.
    TRY.
        DATA(lo_xlsx) = NEW zcl_excel_reader_2007( )->zif_excel_reader~load(
            i_excel2007 = iv_x
        ).
      CATCH zcx_excel.
        RETURN.
    ENDTRY.
    DATA(lo_sheet) = lo_xlsx->get_active_worksheet( ).
    DATA(lv_tag) = lo_sheet->sheet_content[ cell_value = '[ename]' ]-cell_row.
    DO lines( lt_rep ) - 1 TIMES.
      lo_sheet->insert_after( ip_row = lv_tag - 1 ).
    ENDDO.
    DATA(lt_comp) = CAST cl_abap_structdescr( CAST cl_abap_tabledescr( cl_abap_typedescr=>describe_by_data( lt_rep ) )->get_table_line_type( ) )->get_components( ).
    LOOP AT lt_comp ASSIGNING FIELD-SYMBOL(<ls_comp>).
      TRY.
          INSERT VALUE #( field = <ls_comp>-name col = lo_sheet->sheet_content[ cell_value = |[{ to_lower( <ls_comp>-name ) }]| ]-cell_column ) INTO TABLE lt_map.
        CATCH cx_sy_itab_line_not_found.
      ENDTRY.
    ENDLOOP.
    LOOP AT lt_rep ASSIGNING FIELD-SYMBOL(<ls_rep>).
      LOOP AT lt_map ASSIGNING FIELD-SYMBOL(<ls_map>).
        ASSIGN COMPONENT <ls_map>-field OF STRUCTURE <ls_rep> TO FIELD-SYMBOL(<lv_fld>).
        CHECK sy-subrc = 0.
        TRY.
            lo_sheet->sheet_content[ cell_row = lv_tag cell_column = <ls_map>-col ]-cell_value = <lv_fld>.
          CATCH cx_sy_itab_line_not_found.
        ENDTRY.
      ENDLOOP.
      lv_tag = lv_tag + 1.
    ENDLOOP.
    LOOP AT lo_sheet->sheet_content ASSIGNING FIELD-SYMBOL(<ls_shet>) WHERE cell_value CS '[date]'.
      <ls_shet>-cell_value = replace( val = <ls_shet>-cell_value sub = '[date]' with = |{ sy-datum DATE = USER }| ).
    ENDLOOP.
    DATA(lv_report_type) = SWITCH pstring( lv_cat
      WHEN 'governmentCivilServants' THEN 'государственным гражданским служащим'
      WHEN 'personsHoldingPublicOffice' THEN 'лицам, замещающим государственные должности'
      WHEN 'headsOfMunicipalities' THEN 'главам муниципальных образований и главам администраций'
    ).
    LOOP AT lo_sheet->sheet_content ASSIGNING <ls_shet> WHERE cell_value CS '[report_type]'.
      <ls_shet>-cell_value = replace( val = <ls_shet>-cell_value sub = '[report_type]' with = lv_report_type ).
    ENDLOOP.
    DATA(lv_x) = NEW zcl_excel_writer_2007( )->zif_excel_writer~write_file( io_excel = lo_xlsx ).
    rv_x = lv_x.
  ENDMETHOD.


METHOD _get_report_xls.
  CLEAR et_report.
  CASE iv_report_id.
    WHEN 'requiredIncome'. "Обязанных предоставить
      _get_report_xls_required(
        EXPORTING
          it_report    = it_report
          iv_report_id = iv_report_id
        IMPORTING
          et_report    = et_report
      ).
    WHEN 'submittedIncome'. "Предоставившие
      _get_report_xls_submit(
        EXPORTING
          it_report    = it_report
          iv_report_id = iv_report_id
        IMPORTING
          et_report    = et_report
      ).
    WHEN 'notReportIncome'. "Не предоставившие
      _get_report_xls_not(
        EXPORTING
          it_report    = it_report
          iv_report_id = iv_report_id
        IMPORTING
          et_report    = et_report
      ).
    WHEN 'partiallyReportedIncome'. "Частично предоставившие
      _get_report_xls_part(
        EXPORTING
          it_report    = it_report
          iv_report_id = iv_report_id
        IMPORTING
          et_report    = et_report
      ).
    WHEN 'submittedExpense'. "Предоставившие
      _get_report_xls_expense(
        EXPORTING
          it_report    = it_report
          iv_report_id = iv_report_id
        IMPORTING
          et_report    = et_report
      ).
  ENDCASE.
ENDMETHOD.


METHOD _get_report_xls_expense.
  CLEAR et_report.
  SELECT * FROM t503t INTO TABLE @DATA(lt_503t) WHERE sprsl = 'R'.
  LOOP AT it_report ASSIGNING FIELD-SYMBOL(<ls_reps>).
    INSERT INITIAL LINE INTO TABLE et_report ASSIGNING FIELD-SYMBOL(<ls_rep>).
    SELECT SINGLE * FROM pa0001
      INTO @DATA(ls_0001)
      WHERE pernr = @<ls_reps>-pernr
      AND begda <= @sy-datum
      AND endda >= @sy-datum.
    <ls_rep>-ename = <ls_reps>-user-name.
    <ls_rep>-plans = <ls_reps>-user-position.
    <ls_rep>-oiv = <ls_reps>-user-oiv.
    <ls_rep>-category = VALUE #( lt_503t[ persk = ls_0001-persk ]-ptext OPTIONAL ).
    <ls_rep>-year = sy-datum(4).
    <ls_rep>-period = |{ _get_ref_until_date( iv_plans = ls_0001-plans iv_year = CONV #( <ls_rep>-year ) ) DATE = USER }|.
  ENDLOOP.
ENDMETHOD.


METHOD _GET_REPORT_XLS_NOT.
  CLEAR et_report.
  SELECT * FROM t503t INTO TABLE @DATA(lt_503t) WHERE sprsl = 'R'.
  LOOP AT it_report ASSIGNING FIELD-SYMBOL(<ls_reps>).
    INSERT INITIAL LINE INTO TABLE et_report ASSIGNING FIELD-SYMBOL(<ls_rep>).
    SELECT SINGLE * FROM pa0001
      INTO @DATA(ls_0001)
      WHERE pernr = @<ls_reps>-pernr
      AND begda <= @sy-datum
      AND endda >= @sy-datum.
    <ls_rep>-ename = <ls_reps>-user-name.
    <ls_rep>-plans = <ls_reps>-user-position.
    <ls_rep>-oiv = <ls_reps>-user-oiv.
    <ls_rep>-category = VALUE #( lt_503t[ persk = ls_0001-persk ]-ptext OPTIONAL ).
    <ls_rep>-year = sy-datum(4).
    <ls_rep>-period = sy-datum(4) - 1.
    <ls_rep>-doc_date = |{ _get_ref_until_date( iv_plans = ls_0001-plans iv_year = CONV #( <ls_rep>-year ) ) DATE = USER }|.
  ENDLOOP.
ENDMETHOD.


METHOD _GET_REPORT_XLS_PART.
  CLEAR et_report.
  SELECT * FROM t503t INTO TABLE @DATA(lt_503t) WHERE sprsl = 'R'.
  LOOP AT it_report ASSIGNING FIELD-SYMBOL(<ls_reps>).
    INSERT INITIAL LINE INTO TABLE et_report ASSIGNING FIELD-SYMBOL(<ls_rep>).
    SELECT SINGLE * FROM pa0001
      INTO @DATA(ls_0001)
      WHERE pernr = @<ls_reps>-pernr
      AND begda <= @sy-datum
      AND endda >= @sy-datum.
    <ls_rep>-ename = <ls_reps>-user-name.
    <ls_rep>-plans = <ls_reps>-user-position.
    <ls_rep>-oiv = <ls_reps>-user-oiv.
    <ls_rep>-category = VALUE #( lt_503t[ persk = ls_0001-persk ]-ptext OPTIONAL ).
    <ls_rep>-year = sy-datum(4).
    <ls_rep>-period = |{ _get_ref_until_date( iv_plans = ls_0001-plans iv_year = CONV #( <ls_rep>-year ) ) DATE = USER }|.
  ENDLOOP.
ENDMETHOD.


METHOD _get_report_xls_required.
  CLEAR et_report.
  SELECT * FROM t503t INTO TABLE @DATA(lt_503t) WHERE sprsl = 'R'.
  LOOP AT it_report ASSIGNING FIELD-SYMBOL(<ls_reps>).
    INSERT INITIAL LINE INTO TABLE et_report ASSIGNING FIELD-SYMBOL(<ls_rep>).
    SELECT SINGLE * FROM pa0001
      INTO @DATA(ls_0001)
      WHERE pernr = @<ls_reps>-pernr
      AND begda <= @sy-datum
      AND endda >= @sy-datum.
    <ls_rep>-ename = <ls_reps>-user-name.
    <ls_rep>-plans = <ls_reps>-user-position.
    <ls_rep>-oiv = <ls_reps>-user-oiv.
    <ls_rep>-category = VALUE #( lt_503t[ persk = ls_0001-persk ]-ptext OPTIONAL ).
    <ls_rep>-year = sy-datum(4).
    <ls_rep>-period = |{ _get_ref_until_date( iv_plans = ls_0001-plans iv_year = CONV #( <ls_rep>-year ) ) DATE = USER }|.
  ENDLOOP.
ENDMETHOD.


METHOD _GET_REPORT_XLS_SUBMIT.
  CLEAR et_report.
  SELECT * FROM t503t INTO TABLE @DATA(lt_503t) WHERE sprsl = 'R'.
  LOOP AT it_report ASSIGNING FIELD-SYMBOL(<ls_reps>).
    INSERT INITIAL LINE INTO TABLE et_report ASSIGNING FIELD-SYMBOL(<ls_rep>).
    SELECT SINGLE * FROM pa0001
      INTO @DATA(ls_0001)
      WHERE pernr = @<ls_reps>-pernr
      AND begda <= @sy-datum
      AND endda >= @sy-datum.
    <ls_rep>-ename = <ls_reps>-user-name.
    <ls_rep>-plans = <ls_reps>-user-position.
    <ls_rep>-oiv = <ls_reps>-user-oiv.
    <ls_rep>-category = VALUE #( lt_503t[ persk = ls_0001-persk ]-ptext OPTIONAL ).
    <ls_rep>-year = sy-datum(4).
    <ls_rep>-period = |{ _get_ref_until_date( iv_plans = ls_0001-plans iv_year = CONV #( <ls_rep>-year ) ) DATE = USER }|.
  ENDLOOP.
ENDMETHOD.


  METHOD _get_request_report.
    DATA: lv_x                  TYPE xstring,
          lv_prev_template_text TYPE string,
          lv_teplatename        TYPE string.
    DATA: lv_komitet      TYPE orgeh,
          lv_plans_name   TYPE string,
          lv_lider        TYPE pernr_d,
          lv_fio_full     TYPE string,
          lv_fio_end      TYPE string,
          lv_newrow       TYPE string,
          lv_newrow1      TYPE string,
          lv_newrow2      TYPE string,
          lv_newrow3      TYPE string,
          lv_newrow4      TYPE string,
          lv_newrow5      TYPE string,
          lv_newrow6      TYPE string,
          lv_newrow7      TYPE string,
          lv_newrow8      TYPE string,
          lv_newrow9      TYPE string,
          lv_newrow10     TYPE string,
          lv_newrow11     TYPE string,
          lv_newrow12     TYPE string,
          lv_newrow13     TYPE string,
          lv_xml          TYPE string,
          lv_rows         TYPE string,
          lv_bef          TYPE syst_tabix,
          lv_plans_tag    TYPE string,
          lv_fio_tag      TYPE string,
          lv_komitet_name TYPE string.
    DATA: lv_fioe TYPE string.
    DATA: lt_result TYPE TABLE OF struc.

    FIELD-SYMBOLS: <ls_req> TYPE ts_deep.
    DATA(lt_key) = VALUE /iwbep/t_mgw_name_value_pair( ( name = 'DOCID' value = iv_docid ) ).

    TRY.
        CALL METHOD me->/iwbep/if_mgw_appl_srv_runtime~get_expanded_entity
          EXPORTING
            iv_entity_set_name = 'RequestSet'
            it_key_tab         = lt_key
          IMPORTING
            er_entity          = DATA(ls_req_temp).
      CATCH /iwbep/cx_mgw_busi_exception .
      CATCH /iwbep/cx_mgw_tech_exception .
    ENDTRY.

    ASSIGN ls_req_temp->* TO <ls_req>.
    CHECK sy-subrc = 0.
    lv_newrow = '<w:p w14:paraId="70E3248D" w14:textId="2B2EDD7B" w:rsidR="00D978AA" w:rsidRPr="00B3429F" w:rsidRDefault="00551C14" w:rsidP="006E4B8D">'.
    lv_newrow1 = '<w:pPr><w:tabs><w:tab w:val="left" w:pos="851"/><w:tab w:val="left" w:pos="993"/><w:tab w:val="left" w:pos="1276"/>'.
    lv_newrow2 = '</w:tabs><w:ind w:firstLine="709"/><w:jc w:val="both"/><w:rPr><w:sz w:val="27"/><w:szCs w:val="27"/></w:rPr></w:pPr>'.
    lv_newrow3 = '<w:r w:rsidRPr="006E4B8D"><w:rPr><w:b/><w:sz w:val="28"/><w:szCs w:val="28"/></w:rPr><w:t xml:space="preserve">- </w:t>'.
    lv_newrow4 = '</w:r><w:r w:rsidR="006E4B8D" w:rsidRPr="006E4B8D"><w:rPr><w:b/><w:sz w:val="28"/><w:szCs w:val="28"/></w:rPr><w:t>[ФАМИЛИЯ ИО]</w:t>'.
    lv_newrow5 = '</w:r><w:r w:rsidRPr="006E4B8D"><w:rPr><w:sz w:val="28"/><w:szCs w:val="28"/></w:rPr><w:t xml:space="preserve">, </w:t>'.
    lv_newrow6 = '</w:r><w:r w:rsidR="006E4B8D" w:rsidRPr="006E4B8D"><w:rPr><w:sz w:val="28"/><w:szCs w:val="28"/></w:rPr><w:t>[ШТАТНАЯ ДОЛЖНОСТЬ]</w:t></w:r>'.
    lv_newrow7 = '<w:r w:rsidRPr="006E4B8D"><w:rPr><w:sz w:val="28"/><w:szCs w:val="28"/>'.
    lv_newrow8 = '</w:rPr><w:t xml:space="preserve"> (распоряжение Администрации от </w:t></w:r><w:r w:rsidR="006E4B8D" w:rsidRPr="006E4B8D">'.
    lv_newrow9 = '<w:rPr><w:sz w:val="28"/><w:szCs w:val="28"/><w:u w:val="single"/></w:rPr><w:t xml:space="preserve">__________ </w:t>'.
    lv_newrow10 = '</w:r><w:r w:rsidRPr="006E4B8D"><w:rPr><w:sz w:val="28"/><w:szCs w:val="28"/></w:rPr><w:t xml:space="preserve">№ </w:t>'.
    lv_newrow11 = '</w:r><w:r w:rsidR="006E4B8D" w:rsidRPr="006E4B8D"><w:rPr><w:sz w:val="28"/><w:szCs w:val="28"/><w:u w:val="single"/>'.
    lv_newrow12 = '</w:rPr><w:t>__________</w:t></w:r><w:r w:rsidRPr="006E4B8D"><w:rPr><w:sz w:val="28"/><w:szCs w:val="28"/></w:rPr><w:t>)'.
    lv_newrow13 = '</w:t></w:r><w:r w:rsidR="00B3429F" w:rsidRPr="00B3429F"><w:rPr><w:sz w:val="28"/><w:szCs w:val="28"/></w:rPr></w:r></w:p>'.

    CONCATENATE lv_newrow lv_newrow1 lv_newrow2 lv_newrow3 lv_newrow4 lv_newrow5 lv_newrow6 lv_newrow7 lv_newrow8 lv_newrow9 lv_newrow10 lv_newrow11 lv_newrow12 lv_newrow13 INTO lv_xml.

    READ TABLE lt_key ASSIGNING FIELD-SYMBOL(<ls_key>) WITH KEY name = 'DOCID'.
    IF sy-subrc = 0.
      <ls_key>-value = <ls_req>-checkdocid.
    ENDIF.

    checkset_get_entity(
      EXPORTING
        iv_entity_name               = VALUE #( )
        iv_entity_set_name           = VALUE #( )
        iv_source_name               = VALUE #( )
        it_key_tab                   = lt_key
        it_navigation_path           = VALUE #( )    " table of navigation paths
      IMPORTING
        er_entity                    = DATA(ls_check)
    ).

    ev_template = <ls_req>-template.

    lv_prev_template_text = COND #( WHEN <ls_req>-template < 10 THEN 'ZHR_ARGUS_REQUEST_00' ELSE 'ZHR_ARGUS_REQUEST_0' ).

    IF lines( <ls_req>-users ) > 1.
      ev_nachn = 'Группа'.
      CONCATENATE lv_prev_template_text <ls_req>-template '_G' INTO lv_teplatename.
    ELSE.
      ev_nachn = <ls_req>-subjectname.
      CONCATENATE lv_prev_template_text <ls_req>-template INTO lv_teplatename.
    ENDIF.

    lv_x = _get_www( iv_objid = lv_teplatename ).

    TRY.
        DATA(lo_docx) = cl_docx_document=>load_document( iv_data = lv_x ).
        DATA(lo_documentpart) = lo_docx->get_maindocumentpart( ).
      CATCH cx_openxml_format cx_openxml_not_found.
    ENDTRY.
    DATA(lv_doctext) = cl_openxml_helper=>xstring_to_string( lo_documentpart->get_data( ) ).
    SELECT SINGLE * FROM zthr_addr INTO @DATA(ls_addr) WHERE org_name = @<ls_req>-where.
    CHECK sy-subrc = 0.

    IF lv_teplatename = 'ZHR_ARGUS_REQUEST_047_G' OR lv_teplatename = 'ZHR_ARGUS_REQUEST_053_G'. "заполнение таблицы в ворд
      DO lines( <ls_req>-users ) - 1 TIMES.
        lv_plans_tag = COND #( WHEN lv_bef IS INITIAL THEN |[ШТАТНАЯ ДОЛЖНОСТЬ]| ELSE |[ШТАТНАЯ ДОЛЖНОСТЬ{ lv_bef }]| ).
        lv_fio_tag = COND #( WHEN lv_bef IS INITIAL THEN |[ФАМИЛИЯ ИО]| ELSE |[ФАМИЛИЯ ИО{ lv_bef }]| ).

        lv_xml = replace( val = lv_xml sub = lv_plans_tag with = |[ШТАТНАЯ ДОЛЖНОСТЬ{ sy-index }]| occ = 0 ).
        lv_xml = replace( val = lv_xml sub = lv_fio_tag with = |[ФАМИЛИЯ ИО{ sy-index }]| occ = 0 ).
        lv_bef = sy-index.
        CONCATENATE lv_rows lv_xml INTO lv_rows.
      ENDDO.

      lv_doctext = replace( val = lv_doctext sub = '***' with = lv_rows occ = 0 ).

      CLEAR: lv_bef.
      LOOP AT <ls_req>-users INTO DATA(ls_user).
        lv_plans_tag = COND #( WHEN lv_bef IS INITIAL THEN |[ШТАТНАЯ ДОЛЖНОСТЬ]| ELSE |[ШТАТНАЯ ДОЛЖНОСТЬ{ lv_bef }]| ).
        lv_fio_tag = COND #( WHEN lv_bef IS INITIAL THEN |[ФАМИЛИЯ ИО]| ELSE |[ФАМИЛИЯ ИО{ lv_bef }]| ).

        CALL METHOD zcl_hr_data=>get_fio
          EXPORTING
            i_pernr   = CONV pernr_d( ls_user-subject )
          IMPORTING
            e_fio_end = lv_fioe.

        lv_plans_name = zcl_hr_data_utils=>get_plans_and_ogreh_name(
                        EXPORTING
                          i_pernr       = CONV pernr_d( ls_user-subject )
                          i_flag_levels = '3' ).

        lv_doctext = replace( val = lv_doctext sub = lv_plans_tag with = lv_plans_name occ = 0 ).
        lv_doctext = replace( val = lv_doctext sub = lv_fio_tag with = lv_fioe occ = 0 ).
        lv_bef = lv_bef + 1.
      ENDLOOP.
    ENDIF.

    lv_doctext = replace( val = lv_doctext sub = '[РДОЛЖНОСТЬ]' with = ls_addr-plans_name occ = 0 ).
    lv_doctext = replace( val = lv_doctext sub = '[РФИО]' with = ls_addr-ruk_fio_dat occ = 0 ).
    lv_doctext = replace( val = lv_doctext sub = '[РАДРЕС]' with = ls_addr-addr_text occ = 0 ).
    lv_doctext = replace( val = lv_doctext sub = '[ФИОРУК]' with = ls_addr-head_name occ = 0 ).
    lv_doctext = replace( val = lv_doctext sub = '[ФИО]' with = ls_check-subjectname occ = 0 ).
    lv_doctext = replace( val = lv_doctext sub = '[Фамилия Имя Отчество]' with = ls_check-subjectname occ = 0 ).
    lv_doctext = replace( val = lv_doctext sub = '[ШТАТНАЯ ДОЛЖНОСТЬ]' with = ls_check-subjectplans occ = 0 ).
    lv_doctext = replace( val = lv_doctext sub = '[КОМИТЕТ]' with = ls_check-subjectoiv occ = 0 ).

    IF ls_check-subjectname IS NOT INITIAL.
      SPLIT ls_check-subjectname AT space INTO TABLE DATA(lt_fio).
      READ TABLE lt_fio INTO DATA(lv_lastn) INDEX 1.
      CHECK sy-subrc = 0.
      READ TABLE lt_fio INTO DATA(lv_firstn) INDEX 2.
      CHECK sy-subrc = 0.
      READ TABLE lt_fio INTO DATA(lv_patr) INDEX 3.
      CHECK sy-subrc = 0.
      lv_doctext = replace( val = lv_doctext sub = '[Имя Отчество]' with = |{ lv_firstn } { lv_patr }| occ = 0 ).
      lv_doctext = replace( val = lv_doctext sub = '[ИО ФАМИЛИЯ]' with = |{ lv_firstn(1) }.{ lv_patr(1) }. { lv_lastn }| occ = 0 ).
    ENDIF.

    READ TABLE lt_key ASSIGNING <ls_key> WITH KEY name = 'DOCID'.
    IF sy-subrc = 0.
      <ls_key>-value = ls_check-subject.
      <ls_key>-name = 'PERNR'.
    ENDIF.
    addressset_get_entity(
      EXPORTING
        iv_entity_name               = VALUE #( )
        iv_entity_set_name           = VALUE #( )
        iv_source_name               = VALUE #( )
        it_key_tab                   = lt_key
        it_navigation_path           = VALUE #( )    " table of navigation paths
      IMPORTING
        er_entity                    = DATA(ls_pernr_addr)
        ).
    IF ls_pernr_addr IS NOT INITIAL.
      CONDENSE: ls_pernr_addr-registration-city, ls_pernr_addr-registration-region, ls_pernr_addr-registration-street,ls_pernr_addr-registration-house, ls_pernr_addr-registration-apt.
      lv_doctext = replace( val = lv_doctext sub = '[АДРЕС]' with = |{ ls_pernr_addr-registration-city }, { ls_pernr_addr-registration-region }, { ls_pernr_addr-registration-street }, { ls_pernr_addr-registration-house }, {
ls_pernr_addr-registration-apt }|
occ = 0 ).
    ENDIF.

    IF <ls_req>-subject IS INITIAL.
      <ls_req>-subject = ls_check-subject.
    ENDIF.
    IF <ls_req>-subject IS INITIAL.
      READ TABLE <ls_req>-users INTO DATA(ls_us) INDEX 1.
      IF sy-subrc = 0.
        <ls_req>-subject = ls_us-subject.
      ENDIF.
    ENDIF.
    IF <ls_req>-subject IS NOT INITIAL.
      CALL METHOD zcl_hr_data=>get_komitet
        EXPORTING
          i_pernr   = CONV pernr_d( <ls_req>-subject )
        IMPORTING
          e_komitet = lv_komitet
          e_lname   = lv_komitet_name.
      CLEAR lt_result.
      CALL FUNCTION 'RH_STRUC_GET'
        EXPORTING
          act_otype      = 'O'
          act_objid      = lv_komitet
          act_wegid      = 'ORGA-UP'
          act_plvar      = '01'
        TABLES
          result_struc   = lt_result
        EXCEPTIONS
          no_plvar_found = 1
          no_entry_found = 2
          OTHERS         = 3.
      IF sy-subrc <> 0.
* Implement suitable error handling here
      ENDIF.
      LOOP AT lt_result INTO DATA(ls_result).
        CALL METHOD zcl_hr_data=>get_komitet_lider
          EXPORTING
            i_komitet = CONV orgeh( ls_result-objid )
          IMPORTING
            e_lider   = lv_lider.
        IF lv_lider IS NOT INITIAL.
          EXIT.
        ENDIF.
      ENDLOOP.

      CALL METHOD zcl_hr_data=>get_fio
        EXPORTING
          i_pernr    = lv_lider
        IMPORTING
          e_fio_full = lv_fio_full
          e_fio_end  = lv_fio_end.

      SPLIT lv_fio_full AT space INTO DATA(lv_lastname) DATA(lv_name) DATA(lv_pat).
    ENDIF.
    IF ls_check-subjectoiv IS INITIAL.
      ls_check-subjectoiv = lv_komitet_name.
    ENDIF.
    lv_doctext = replace( val = lv_doctext sub = '[КОМИТЕТРУК]' with = ls_check-subjectoiv occ = 0 ).
    lv_doctext = replace( val = lv_doctext sub = '[Фамилия ИО РУК]' with = lv_fio_end occ = 0 ).
    lv_doctext = replace( val = lv_doctext sub = '[Имя Отчество РУК]' with = |{ lv_name } { lv_pat }| occ = 0 ).

* out
    lo_documentpart->feed_data( iv_data = cl_openxml_helper=>string_to_xstring( lv_doctext ) ).
    TRY.
        rv_x = lo_docx->get_package_data( ).
      CATCH cx_openxml_format.
        RETURN.
    ENDTRY.
  ENDMETHOD.


  METHOD _get_roles.
    IF iv_pernr IS INITIAL.
      CHECK io_tech_request_context IS NOT INITIAL.
      DATA lt_p0105 TYPE TABLE OF p0105.
      DATA(lt_hdr) = CAST /iwbep/cl_mgw_request( io_tech_request_context )->get_request_details( )-technical_request-request_header.
      ASSIGN lt_hdr[ name = 'x-main-user' ] TO FIELD-SYMBOL(<ls_user>).
      IF sy-subrc = 0.
        DATA(lo_mss) = zcl_mss_data_assistent=>get_instance( ).
        DATA(lv_pernr) = lo_mss->get_pernr(
            iv_usrid  = CONV #( <ls_user>-value )
        ).
        DATA(lv_is) = lo_mss->is_argus( iv_pernr = lv_pernr ).
        CALL METHOD zcl_hr_data=>read_pa_infty
          EXPORTING
            i_pernr = lv_pernr
            i_infty = '0105'
            i_subty = '0001'
            i_endda = sy-datum
          IMPORTING
            e_pnnnn = lt_p0105.
        READ TABLE lt_p0105 INTO DATA(ls_p0105) INDEX 1.
        IF sy-subrc = 0.
          DATA(lv_sap_usrid) = ls_p0105-usrid.
        ENDIF.
      ENDIF.
    ELSE.
      CALL METHOD zcl_hr_data=>read_pa_infty
        EXPORTING
          i_pernr = iv_pernr
          i_infty = '0105'
          i_subty = '0001'
          i_endda = sy-datum
        IMPORTING
          e_pnnnn = lt_p0105.
      READ TABLE lt_p0105 INTO ls_p0105 INDEX 1.
      IF sy-subrc = 0.
        lv_sap_usrid = ls_p0105-usrid.
      ENDIF.
    ENDIF.

*  проверка полномочий у пользователя SAP
    IF lv_sap_usrid IS NOT INITIAL.
      SELECT * FROM agr_users INTO TABLE @DATA(lt_roles) WHERE uname = @lv_sap_usrid.
      IF sy-subrc = 0.
        READ TABLE lt_roles WITH KEY agr_name = 'ZHR_ARGUS_CONTROL_GGS' TRANSPORTING NO FIELDS.
        IF sy-subrc = 0.
          ev_role_ggs = abap_true.
        ENDIF.
        READ TABLE lt_roles WITH KEY agr_name = 'ZHR_ARGUS_CONTROL_GD' TRANSPORTING NO FIELDS.
        IF sy-subrc = 0.
          ev_role_gd = abap_true.
        ENDIF.
        READ TABLE lt_roles WITH KEY agr_name = 'ZHR_ARGUS_CONTROL_MS' TRANSPORTING NO FIELDS.
        IF sy-subrc = 0.
          ev_role_ms = abap_true.
        ENDIF.
      ENDIF.
    ELSE.
      ev_role_ms = abap_true.
      ev_role_gd = abap_true.
      ev_role_ggs = abap_true.
    ENDIF.
  ENDMETHOD.


  METHOD _get_role_table.
    DATA(lo_search) = NEW zcl_argus_search( ).
    IF iv_needref EQ abap_true.
      lo_search->add_filter( is_filter = VALUE #( name = 'NEED_REF' value = abap_true ) ).
    ENDIF.
    lo_search->add_filter( is_filter = VALUE #( name = iv_role value = abap_true ) ).
    DATA(lt_search) = lo_search->search( ).
    rv_tab = lt_search.
  ENDMETHOD.


METHOD _get_scan_by_slug.
  DATA: lt_images TYPE TABLE OF xstring.
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
    IF _is_image( iv_mime = lv_mime ).
      INSERT lv_x INTO TABLE lt_images.
    ELSE.
      INSERT VALUE #( x = lv_x mime = lv_mime ) INTO TABLE rt_pack.
    ENDIF.
  ENDLOOP.
* Zip images
  CHECK lt_images IS NOT INITIAL.
  DATA(lo_zip) = NEW cl_abap_zip( ).
  LOOP AT lt_images ASSIGNING FIELD-SYMBOL(<ls_img>).
    DATA(lv_tabix) = sy-tabix.
    lo_zip->add(
        name    = |{ lv_tabix }.png|
        content = <ls_img>
    ).
  ENDLOOP.
  INSERT VALUE #( x = lo_zip->save( ) mime = 'application/zip' multiple = abap_true ) INTO TABLE rt_pack.
ENDMETHOD.


  METHOD _get_www.
    DATA(lv_x) = VALUE xstring( ).
    DATA: lt_mime TYPE TABLE OF w3mime.
    DATA(ls_www) = VALUE wwwdatatab( relid = 'MI' objid = iv_objid ).
    CALL FUNCTION 'WWWDATA_IMPORT'
      EXPORTING
        key    = ls_www
      TABLES
        mime   = lt_mime
      EXCEPTIONS
        OTHERS = 3.
    DATA(lv_filesize_c) = VALUE char100( ).
    DATA(lv_filesize) = VALUE int4( ).
    CALL FUNCTION 'WWWPARAMS_READ'
      EXPORTING
        relid  = ls_www-relid
        objid  = ls_www-objid
        name   = 'filesize'
      IMPORTING
        value  = lv_filesize_c
      EXCEPTIONS
        OTHERS = 2.
    lv_filesize = lv_filesize_c.
    CALL FUNCTION 'SCMS_BINARY_TO_XSTRING'
      EXPORTING
        input_length = lv_filesize
      IMPORTING
        buffer       = lv_x
      TABLES
        binary_tab   = lt_mime
      EXCEPTIONS
        OTHERS       = 0.
    rv_x = lv_x.
  ENDMETHOD.


  METHOD _hire_new_employee.
    FIELD-SYMBOLS: <pnnnn> TYPE any.
    cl_reca_date=>convert_date_to_internal( EXPORTING id_date_external = is_entity-dateofbirth IMPORTING ed_date_internal = DATA(lv_birth) ).
    SELECT SINGLE pernr FROM pa0002
      WHERE nachn = @is_entity-lastname
      AND vorna = @is_entity-firstname
      AND midnm = @is_entity-patronymic
      AND gbdat = @lv_birth
      INTO @DATA(lv_exists).
    IF sy-subrc = 0.
      rv_pernr = lv_exists.
      RETURN.
    ENDIF.
    DATA(lt_return) = VALUE hrpad_return_tab( ).
    DATA(lt_prelp) = VALUE prelp_tab( ).
    DATA(ls_0001) = VALUE p0001(
      infty = '0001'
      begda = sy-datum
      endda = hr_high_date
      werks = 'ZZ01'
      btrtl = 'ZZ01'
      bukrs = '0100'
      abkrs = '99'
      juper = '0100'
      persg = CONV pspar-persg( 'Z' )
      persk = CONV pspar-persk( 'Z1' )
      plans = '99999999'
    ).
    ASSIGN ls_0001 TO <pnnnn>.
    cl_hr_pnnnn_type_cast=>pnnnn_to_prelp(
      EXPORTING
        pnnnn = <pnnnn>
      IMPORTING
        prelp = DATA(ls_prelp)
    ).
    APPEND ls_prelp TO lt_prelp.
    DATA(ls_0002) = VALUE p0002(
      infty = '0002'
      begda = sy-datum
      endda = hr_high_date
      nachn = COND #( WHEN is_entity-lastname IS NOT INITIAL THEN is_entity-lastname ELSE is_entity-name )
      vorna = is_entity-firstname
      midnm = is_entity-patronymic
      gbdat = lv_birth
      GBORT = is_entity-placeofbirth
      gblnd = 'RU'
      natio = 'RU'
      sprsl = 'RU'
    ).
    ASSIGN ls_0002 TO <pnnnn>.
    cl_hr_pnnnn_type_cast=>pnnnn_to_prelp(
      EXPORTING
        pnnnn = <pnnnn>
      IMPORTING
        prelp = ls_prelp
    ).
    APPEND ls_prelp TO lt_prelp.
    DATA(lv_ok) = VALUE boole_d( ).
    DATA(lt_key) = VALUE hrpad_bapipakey_tab( ).
    CALL FUNCTION 'ZHR_ARGUS_HIRE_EMPLOYEE'
      DESTINATION 'NONE'
      EXPORTING
        hiringdate      = sy-datum
        actiontype      = 'Z9'
        reasonforaction = '00'
        pnnnn_tab       = lt_prelp
        nocommit        = abap_false
      IMPORTING
        return_tab      = lt_return
        bapipakey_tab   = lt_key
        is_ok           = lv_ok.
    IF lv_ok = abap_false.
      LOOP AT lt_return ASSIGNING FIELD-SYMBOL(<ls_return>).
        RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception
          EXPORTING
            textid = VALUE #(
              msgid = <ls_return>-id
              msgno = <ls_return>-number
              attr1 = <ls_return>-message_v1
              attr2 = <ls_return>-message_v2
              attr3 = <ls_return>-message_v3
              attr4 = <ls_return>-message_v4
            ).
      ENDLOOP.
    ELSE.
      CHECK lt_key IS NOT INITIAL.
      rv_pernr = lt_key[ 1 ]-employeeno.
      COMMIT WORK AND WAIT.
      DATA(ls_newp) = VALUE zthr_argus_newpe(
          pernr = rv_pernr
          aedtm = sy-datum
      ).
      MODIFY zthr_argus_newpe FROM ls_newp.
    ENDIF.
  ENDMETHOD.


  METHOD _insert_0006.
    SELECT * FROM t005u INTO TABLE @DATA(lt_regio).
    DATA(lv_state) = VALUE pstring( lt_regio[ bezei = is_entity-region ]-bland OPTIONAL ).
    IF lv_state IS INITIAL.
      SPLIT is_entity-region AT space INTO DATA(lv_st_pref) DATA(lv_dummy).
      LOOP AT lt_regio ASSIGNING FIELD-SYMBOL(<ls_regio>) WHERE bezei CS lv_st_pref.
        lv_state = <ls_regio>-bland.
      ENDLOOP.
    ENDIF.
    DATA(ls_0006) = VALUE p0006(
      infty = '0006'
      subty = iv_subty
      pernr = iv_pernr
      begda = sy-datum
      endda = hr_high_date
      anssa = iv_subty
      land1 = is_entity-country
      ort01 = is_entity-city
      state = lv_state
      stras = is_entity-street
      hsnmr = is_entity-house
      bldng = is_entity-building
      posta = is_entity-apt
      pstlz = is_entity-index
    ).
    DATA(ls_return) = VALUE bapireturn1( ).
    CALL FUNCTION 'HR_EMPLOYEE_ENQUEUE'
      EXPORTING
        number = CONV pernr_d( iv_pernr ).
    CALL FUNCTION 'HR_INFOTYPE_OPERATION'
      EXPORTING
        infty         = '0006'
        number        = CONV pernr_d( iv_pernr )
        validityend   = ls_0006-begda
        validitybegin = ls_0006-endda
        record        = ls_0006
        operation     = 'INS'
      IMPORTING
        return        = ls_return.
    IF ls_return-type = 'E'.
      RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception
        EXPORTING
          textid = VALUE #(
            msgid = ls_return-id
            msgno = ls_return-number
            attr1 = ls_return-message_v1
            attr2 = ls_return-message_v2
            attr3 = ls_return-message_v3
            attr4 = ls_return-message_v4
          ).
    ENDIF.
    CALL FUNCTION 'HR_EMPLOYEE_DEQUEUE'
      EXPORTING
        number = CONV pernr_d( iv_pernr ).
  ENDMETHOD.


  METHOD _insert_0290.
    DATA(ls_0290) = VALUE p0290(
      infty = '0290'
      subty = iv_subty
      pernr = iv_pernr
      begda = sy-datum
      endda = hr_high_date
      nomer = iv_number
      nachn = is_0002-nachn
      vorna = is_0002-vorna
      midnm = is_0002-midnm
      gbdat = is_0002-gbdat
      gesch = is_0002-gesch
    ).
    DATA(ls_return) = VALUE bapireturn1( ).
    CALL FUNCTION 'HR_EMPLOYEE_ENQUEUE'
      EXPORTING
        number = CONV pernr_d( iv_pernr ).
    CALL FUNCTION 'HR_INFOTYPE_OPERATION'
      EXPORTING
        infty         = '0290'
        number        = CONV pernr_d( iv_pernr )
        validityend   = ls_0290-begda
        validitybegin = ls_0290-endda
        record        = ls_0290
        operation     = 'INS'
      IMPORTING
        return        = ls_return.
    IF ls_return-type = 'E'.
      RAISE EXCEPTION TYPE /iwbep/cx_mgw_busi_exception
        EXPORTING
          textid = VALUE #(
            msgid = ls_return-id
            msgno = ls_return-number
            attr1 = ls_return-message_v1
            attr2 = ls_return-message_v2
            attr3 = ls_return-message_v3
            attr4 = ls_return-message_v4
          ).
    ENDIF.
    CALL FUNCTION 'HR_EMPLOYEE_DEQUEUE'
      EXPORTING
        number = CONV pernr_d( iv_pernr ).
  ENDMETHOD.


  METHOD _is_image.
    rv_is = boolc(
      iv_mime CS 'jpg' OR
      iv_mime CS 'jpeg' OR
      iv_mime CS 'png' OR
      iv_mime CS 'image' OR
      iv_mime CS 'bmp' OR
      iv_mime CS 'tiff'
    ).
  ENDMETHOD.


  METHOD _processing.
    CLEAR rt_ref.
    DATA(lv_completed) = VALUE flag( ).
    CALL FUNCTION 'ZHR_ARGUS_SCAN_ASYNC_CHECK'
      EXPORTING
        iv_slug      = iv_slug
      IMPORTING
        ev_completed = lv_completed
      EXCEPTIONS
        OTHERS       = 2.
    IF sy-subrc = 0.
      IF lv_completed = abap_false.
        RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
          EXPORTING
            http_status_code = '410'.
      ELSE.
        CALL FUNCTION 'ZHR_ARGUS_SCAN_ASYNC_GET'
          EXPORTING
            iv_slug = iv_slug
          IMPORTING
            et_ref  = rt_ref.
      ENDIF.
    ELSE.
      CALL FUNCTION 'ZHR_ARGUS_SCAN_ASYNC' IN BACKGROUND TASK
        EXPORTING
          iv_slug = iv_slug.
      COMMIT WORK.
      RAISE EXCEPTION TYPE /iwbep/cx_mgw_tech_exception
        EXPORTING
          http_status_code = '410'.
    ENDIF.
  ENDMETHOD.


METHOD _save_addr_internal.
  IF iv_addr_num IS INITIAL.
    DATA(lv_handle) = CONV szad_field-handle( |{ is_key-pernr }{ is_key-subty }{ is_key-begda }{ is_key-endda }{ is_key-seqnr }| ).
    CALL FUNCTION 'ADDR_INSERT'
      EXPORTING
        address_data        = CORRESPONDING addr1_data( is_addr )
        address_group       = 'HR01'
        address_handle      = lv_handle
        check_empty_address = abap_false
        check_address       = abap_false
      EXCEPTIONS
        OTHERS              = 0.
    DATA(ls_ref) =  VALUE addr_ref(
      appl_table = 'ADRC'
      appl_field = 'ADDRNUMBER'
      appl_key = lv_handle
      addr_group = 'HR01'
    ).
    CALL FUNCTION 'ADDR_NUMBER_GET'
      EXPORTING
        address_handle    = lv_handle
        address_reference = ls_ref
      IMPORTING
        address_number    = rv_addr_num
      EXCEPTIONS
        OTHERS            = 0.
    CALL FUNCTION 'ADDR_SINGLE_SAVE'
      EXPORTING
        address_number = rv_addr_num
      EXCEPTIONS
        OTHERS         = 0.
  ELSE.
    rv_addr_num = iv_addr_num.
    SELECT SINGLE * FROM adrc INTO @DATA(ls_adrc) WHERE addrnumber = @iv_addr_num.
    CHECK sy-subrc = 0.
    UPDATE adrc SET
      country = is_addr-country
      city1 = is_addr-city1
      region = is_addr-region
      street = is_addr-street
      house_num1 = is_addr-house_num1
      building = is_addr-building
      roomnumber = is_addr-roomnumber
      post_code1 = is_addr-post_code1
      name1 = is_addr-name1
    WHERE addrnumber = iv_addr_num.
  ENDIF.
ENDMETHOD.


METHOD _split_case.
  CLEAR rv_txt.
  DATA(lv_l) = strlen( iv_txt ).
  DATA(lv_i) = 0.
  WHILE lv_i < lv_l.
    DATA(lv_sy) = iv_txt+lv_i(1).
    IF lv_sy = |{ lv_sy CASE = UPPER }|.
      rv_txt = |{ rv_txt } { lv_sy }|.
    ELSE.
      rv_txt = |{ rv_txt }{ lv_sy }|.
    ENDIF.
    lv_i =  lv_i + 1.
  ENDWHILE.
  rv_txt = condense( rv_txt ).
ENDMETHOD.


METHOD _to_addr_internal.
  SELECT * FROM t005u INTO TABLE @DATA(lt_regio).
  rs_addr-name1 = is_addr-companyname.
  rs_addr-country = is_addr-country.
  rs_addr-city1 = is_addr-city.
  rs_addr-region = VALUE #( lt_regio[ bezei = is_addr-region ]-bland OPTIONAL ).
  rs_addr-street = is_addr-street.
  rs_addr-house_num1 = is_addr-house.
  rs_addr-building = is_addr-building.
  rs_addr-roomnumber = is_addr-apt.
  rs_addr-post_code1 = is_addr-index.
ENDMETHOD.
ENDCLASS.
