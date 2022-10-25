*&---------------------------------------------------------------------*
*& Report  ZHR_ARGUS_SYNC_XSB
*&
*&---------------------------------------------------------------------*
*&
*&
*&---------------------------------------------------------------------*
REPORT zhr_argus_sync_xsb.
DATA: gv_pernr TYPE pernr_d,
      gv_year  TYPE jahr.
SELECTION-SCREEN: BEGIN OF BLOCK b01 WITH FRAME TITLE text-b01.
SELECT-OPTIONS: s_pernr FOR gv_pernr NO INTERVALS,
                s_zyear FOR gv_year NO INTERVALS.
SELECTION-SCREEN: END OF BLOCK b01.

CLASS lcl DEFINITION.
  PUBLIC SECTION.
    CLASS-METHODS:
      go.
ENDCLASS.
CLASS lcl IMPLEMENTATION.
  METHOD go.
    SELECT * FROM zthr_ess_sveddf
      WHERE pernr IN @s_pernr
      AND zyear IN @s_zyear
      INTO TABLE @DATA(lt_sved).
    LOOP AT lt_sved ASSIGNING FIELD-SYMBOL(<ls_sved>).
      LOOP AT NEW zcl_argus_xsb( iv_x = <ls_sved>-filedata )->parse( ) INTO DATA(ls_parse).
        CHECK ls_parse-base-ref_begda IS NOT INITIAL.
        NEW zcl_argus_parser_saver(
          is_parsed = ls_parse
          iv_source = <ls_sved>-filedata
          iv_filename = |{ <ls_sved>-pernr }_Сведения_о_доходах_{ <ls_sved>-zyear }.xsb|
        )->save(
          iv_electro = abap_true
          iv_paper = abap_false
        ).
      ENDLOOP.
    ENDLOOP.
    MESSAGE |Синхронизировано { lines( lt_sved ) } файлов| TYPE 'S'.
  ENDMETHOD.
ENDCLASS.

START-OF-SELECTION.
  lcl=>go( ).
