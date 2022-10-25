class ZCL_ARGUS_SEARCH definition
  public
  final
  create public .

public section.

  methods ADD_FILTER
    importing
      !IS_FILTER type /IWBEP/S_MGW_NAME_VALUE_PAIR .
  methods INIT .
  methods SEARCH
    returning
      value(RT_RESULTS) type ZTHR_ARGUS_SEARCH_INFO .
  methods SET_SEARK
    importing
      !IV_SEARK type PSTRING .
protected section.
private section.

  data GT_FILTER type /IWBEP/T_MGW_NAME_VALUE_PAIR .
  data GV_SEARK type PSTRING .
ENDCLASS.



CLASS ZCL_ARGUS_SEARCH IMPLEMENTATION.


  method ADD_FILTER.
    insert is_filter INTO TABLE gt_filter.
  endmethod.


  method INIT.
    clear: gt_filter, gv_seark.
  endmethod.


  METHOD search.
    DATA(lo_search) = NEW cl_esh_if_search_request( ).
    lo_search->add_search_scope(
      EXPORTING
        iv_template_id     = 'ZHR_ARGUS~STANDARD~ZHR_ARGUS_EMP~'
      EXCEPTIONS
        OTHERS             = 3
    ).
    IF sy-subrc <> 0.
      MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
                 WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
    ENDIF.
    lo_search->set_max_number_of_results( 50000 ).
    IF gv_seark IS NOT INITIAL.
      lo_search->set_search_text( iv_text = gv_seark ).
    ENDIF.
    IF gt_filter IS NOT INITIAL.
      LOOP AT gt_filter ASSIGNING FIELD-SYMBOL(<ls_filter>).
        lo_search->add_search_attribute(
            iv_name  = <ls_filter>-name
            iv_value = <ls_filter>-value
        ).
      ENDLOOP.
    ENDIF.
    TRY.
        DATA(lo_search_resp) = lo_search->search( ).
        CHECK lo_search_resp IS BOUND.
        DATA(lo_resp) = CAST cl_esh_if_search_resp_connect( lo_search_resp->get_next_response( ) ).
        lo_resp->get_results_data_raw(
          IMPORTING
            er_raw_data             = DATA(lr_raw)
        ).
        ASSIGN lr_raw->* TO FIELD-SYMBOL(<lt_raw>).
        rt_results = CORRESPONDING #( <lt_raw> ).
      CATCH cx_esh_if_engine.
    ENDTRY.
    SORT rt_results BY nachn vorna midnm.
  ENDMETHOD.


  method SET_SEARK.
    gv_seark = iv_seark.
  endmethod.
ENDCLASS.
