class ZCL_ARGUS_XSB definition
  public
  final
  create public .

public section.

  methods CONSTRUCTOR
    importing
      !IV_X type XSTRING .
  methods GET_RAW
    returning
      value(RV_RAW) type PSTRING .
  methods PARSE
    returning
      value(RT_PARSE) type ZTHR_ARGUS_PARSER .
protected section.
private section.

  data GV_X type XSTRING .
  data GV_RAW type PSTRING .
ENDCLASS.



CLASS ZCL_ARGUS_XSB IMPLEMENTATION.


method CONSTRUCTOR.
  gv_x = iv_x.
endmethod.


  METHOD get_raw.
    IF gv_raw IS NOT INITIAL.
      rv_raw = gv_raw.
      RETURN.
    ENDIF.
    cl_bcs_convert=>xstring_to_string(
      EXPORTING
        iv_xstr   = gv_x
        iv_cp     = '4110'
      RECEIVING
        rv_string = DATA(lv_base)
    ).
    DATA(lv_x) = VALUE xstring( ).
    SPLIT lv_base AT '  ' INTO DATA(lv_paragraph) lv_base.
    CALL FUNCTION 'SSFC_BASE64_DECODE'
      EXPORTING
        b64data = lv_base
      IMPORTING
        bindata = lv_x
      EXCEPTIONS
        OTHERS  = 8.
    cl_bcs_convert=>xstring_to_string(
      EXPORTING
        iv_xstr   = lv_x
        iv_cp     = '4105'
      RECEIVING
        rv_string = gv_raw
    ).
    rv_raw = gv_raw.
  ENDMETHOD.


METHOD parse.
  CLEAR rt_parse.
  DATA(lo_argus) = NEW zcl_argus_parser_mapper( ).
  lo_argus->feed( iv_xml = get_raw( ) ).
  DATA(lt_ref) = lo_argus->get( ).
  CHECK lt_ref IS NOT INITIAL.
  rt_parse = lt_ref.
ENDMETHOD.
ENDCLASS.
