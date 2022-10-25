*&---------------------------------------------------------------------*
*&  Include           ZHR_ARGUS_CORRUPT_LCL
*&---------------------------------------------------------------------*
CLASS lcl DEFINITION.
  PUBLIC SECTION.
    CLASS-METHODS: get RETURNING VALUE(ro) TYPE REF TO lcl.
    METHODS: report.
  PRIVATE SECTION.
    TYPES: BEGIN OF ts_data,
             plans     TYPE hrobjid,
             plans_txt TYPE pstring,
             orgeh     TYPE hrobjid,
             orgeh_txt TYPE pstring,
             oiv_id    TYPE hrobjid,
             oiv       TYPE pstring,
             pernr     TYPE pernr_d,
             ename     TYPE pstring,
             doom      TYPE pstring,
           END OF ts_data.
    TYPES: BEGIN OF ts_pl,
             seqnr    TYPE seqnr,
             num      TYPE int4,
             plans_id TYPE hrobjid,
             plans    TYPE pstring,
             count    TYPE int4,
             ename    TYPE pstring,
             doom     TYPE pstring,
           END OF ts_pl.
    TYPES: tt_pl TYPE TABLE OF ts_pl WITH DEFAULT KEY.
    TYPES: BEGIN OF ts_o,
             seqnr   TYPE seqnr,
             org     TYPE hrobjid,
             org_txt TYPE pstring,
             pl      TYPE tt_pl,
           END OF ts_o.
    TYPES: tt_o TYPE TABLE OF ts_o WITH DEFAULT KEY.
    TYPES: BEGIN OF ts_out,
             seqnr  TYPE seqnr,
             oiv    TYPE pstring,
             oiv_id TYPE hrobjid,
             o      TYPE tt_o,
           END OF ts_out.
    TYPES: tt_out TYPE TABLE OF ts_out.
    CLASS-DATA: mo_ref TYPE REF TO lcl.
    DATA: mt_out TYPE TABLE OF ts_data.
    CONSTANTS: mc_template    TYPE pstring VALUE 'ZHR_ARGUS_CORRUPT',
               mc_template_no TYPE pstring VALUE 'ZHR_ARGUS_CORRUPT_NO'.
    METHODS:
      _prepare_xlsx IMPORTING io_xlsx TYPE REF TO zcl_excel,
      _prepare_data EXPORTING VALUE(et_out) TYPE tt_out
                              ev_total      TYPE int4,
      _get_data,
      _print.
ENDCLASS.
CLASS lcl IMPLEMENTATION.
  METHOD get.
    IF mo_ref IS NOT BOUND.
      mo_ref = NEW #( ).
    ENDIF.
    ro = mo_ref.
  ENDMETHOD.
  METHOD report.
    _get_data( ).
    _print( ).
  ENDMETHOD.
  METHOD _get_data.
    DATA: lt_holder TYPE TABLE OF hrpe_prozt.
    SELECT objid FROM hrp9110                           "#EC CI_NOFIRST
      INTO TABLE @DATA(lt_9110)
      WHERE begda <= @pn-endda
      AND endda >= @pn-begda
      AND corrupt = @abap_true.
    LOOP AT lt_9110 ASSIGNING FIELD-SYMBOL(<ls_9110>).
      INSERT INITIAL LINE INTO TABLE mt_out ASSIGNING FIELD-SYMBOL(<ls_out>).
      <ls_out>-plans = <ls_9110>-objid.
      <ls_out>-plans_txt = zcl_hr_data_utils=>get_name_obj(
          i_objid      = <ls_out>-plans
          i_otype      = cl_hrtmc_const=>otype_position
          i_begda      = pn-endda
      ).
      IF <ls_out>-plans_txt IS INITIAL.
        <ls_out>-plans_txt = zcl_hr_data_utils=>get_name_obj_1000(
            i_objid      = <ls_out>-plans
            i_otype      = cl_hrtmc_const=>otype_position
            i_begda      = pn-endda
        ).
      ENDIF.
      DATA(lv_stext) = VALUE stext( ).
      CALL FUNCTION 'HRWPC_PCR_GET_ORGEH_TO_PLANS'
        EXPORTING
          plans      = <ls_9110>-objid
          eff_date   = pn-endda
        IMPORTING
          orgeh      = <ls_out>-orgeh
          orgeh_text = lv_stext.
      IF <ls_out>-orgeh NOT IN pnpobjid[].
        DELETE mt_out WHERE plans = <ls_9110>-objid.
        CONTINUE.
      ENDIF.
      <ls_out>-orgeh_txt = zcl_hr_data_utils=>get_name_obj(
          i_objid      = <ls_out>-orgeh
          i_otype      = cl_hrtmc_const=>otype_orgunit
          i_begda      = pn-endda
      ).
      IF <ls_out>-orgeh_txt IS INITIAL.
        <ls_out>-orgeh_txt = lv_stext.
      ENDIF.
      zcl_hr_data_utils=>get_last_but_one_ogreh_name_o(
        EXPORTING
          i_otype = cl_hap_pmp_const=>otype_orgunit
          i_objid = <ls_out>-orgeh
        IMPORTING
          e_objid = <ls_out>-oiv_id
        RECEIVING
          r_text  = <ls_out>-oiv
      ).
      DATA(lt_obj) = VALUE hrobject_t( (
        plvar = cl_hap_pmp_const=>plvar
        otype = cl_hap_pmp_const=>otype_position
        objid = <ls_out>-plans
      ) ).
      CLEAR lt_holder.
      CALL FUNCTION 'RHPH_POSITIONS_HOLDER_READ'
        EXPORTING
          begda      = pn-endda
          endda      = pn-endda
          with_stext = abap_true
        TABLES
          objects    = lt_obj
          pos_holder = lt_holder
        EXCEPTIONS
          OTHERS     = 0.
      SORT lt_holder BY prozt DESCENDING.
      <ls_out>-pernr = VALUE #( lt_holder[ 1 ]-tobid OPTIONAL ).
      <ls_out>-ename = VALUE #( lt_holder[ 1 ]-ttext OPTIONAL ).
      IF lines( lt_holder ) > 1.
        DATA(lt_pernr_doom) = VALUE pernr_tab( FOR ls_hold IN lt_holder ( CONV #( ls_hold-tobid ) ) ).
        SELECT * FROM pa0001 INTO TABLE @DATA(lt_0001)
          FOR ALL ENTRIES IN @lt_pernr_doom
          WHERE pernr = @lt_pernr_doom-table_line
          AND begda <= @pn-endda
          AND endda >= @pn-begda.
        LOOP AT lt_holder ASSIGNING FIELD-SYMBOL(<ls_hold>) FROM 2 WHERE prozt = 0.
          CHECK line_exists( lt_0001[ pernr = <ls_hold>-tobid persg = p_dogr ] ).
          <ls_out>-doom = |{ <ls_out>-doom }{ cl_abap_char_utilities=>newline }{ <ls_hold>-ttext } { text-doo }|.
        ENDLOOP.
        SHIFT <ls_out>-doom LEFT DELETING LEADING cl_abap_char_utilities=>newline.
      ENDIF.
    ENDLOOP.
    DELETE mt_out WHERE orgeh IS INITIAL.
    SORT mt_out.
    DELETE ADJACENT DUPLICATES FROM mt_out.
  ENDMETHOD.
  METHOD _prepare_data.
    DELETE mt_out WHERE oiv IS INITIAL.
    LOOP AT mt_out ASSIGNING FIELD-SYMBOL(<ls_out>).
      ASSIGN et_out[ oiv = <ls_out>-oiv ] TO FIELD-SYMBOL(<ls_oiv>).
      IF sy-subrc <> 0.
        INSERT VALUE #( oiv = <ls_out>-oiv oiv_id = <ls_out>-oiv_id ) INTO TABLE et_out ASSIGNING <ls_oiv>.
      ENDIF.
      ASSIGN <ls_oiv>-o[ org = <ls_out>-orgeh ] TO FIELD-SYMBOL(<ls_org>).
      IF sy-subrc <> 0.
        INSERT VALUE #( org = <ls_out>-orgeh org_txt = <ls_out>-orgeh_txt ) INTO TABLE <ls_oiv>-o ASSIGNING <ls_org>.
      ENDIF.
      IF p_emp = abap_true.
        INSERT VALUE #( plans_id = <ls_out>-plans plans = <ls_out>-plans_txt count = 1 ename = <ls_out>-ename doom = <ls_out>-doom ) INTO TABLE <ls_org>-pl.
      ELSE.
        ASSIGN <ls_org>-pl[ plans = <ls_out>-plans_txt ] TO FIELD-SYMBOL(<ls_ex>).
        IF sy-subrc = 0.
          <ls_ex>-count = <ls_ex>-count + 1.
        ELSE.
          INSERT VALUE #( plans_id = <ls_out>-plans plans = <ls_out>-plans_txt count = 1 ) INTO TABLE <ls_org>-pl.
        ENDIF.
      ENDIF.
    ENDLOOP.
*   sort
    DATA(lt_root) = VALUE hrrootob_t( ).
    CALL FUNCTION 'RH_STRUC_HELP_ROOTS_GET'
      EXPORTING
        search_plvar = cl_hap_pmp_const=>plvar
        search_otype = cl_hap_pmp_const=>otype_orgunit
      TABLES
        roots        = lt_root
      EXCEPTIONS
        OTHERS       = 0.
    DATA(lt_struc) = VALUE struc_t( ).
    CALL FUNCTION 'RH_STRUC_GET_MULTIPLE_ROOTS'
      EXPORTING
        act_wegid       = 'O-O-S-P'
        act_plvar       = cl_hap_pmp_const=>plvar
        act_begda       = pn-endda
        act_endda       = pn-endda
        act_tflag       = abap_false
        act_vflag       = abap_false
        authority_check = abap_false
      TABLES
        root_objects    = lt_root
        result_struc    = lt_struc
      EXCEPTIONS
        OTHERS          = 0.
    LOOP AT et_out ASSIGNING <ls_oiv>.
      <ls_oiv>-seqnr = VALUE #( lt_struc[ objid = <ls_oiv>-oiv_id ]-seqnr OPTIONAL ).
      LOOP AT <ls_oiv>-o ASSIGNING <ls_org>.
        <ls_org>-seqnr = VALUE #( lt_struc[ objid = <ls_org>-org ]-seqnr OPTIONAL ).
        LOOP AT <ls_org>-pl ASSIGNING FIELD-SYMBOL(<ls_pl>).
          <ls_pl>-seqnr = VALUE #( lt_struc[ objid = <ls_pl>-plans_id ]-seqnr OPTIONAL ).
        ENDLOOP.
      ENDLOOP.
    ENDLOOP.
*   num
    DATA(lv_total_num) = VALUE int4( ).
    lv_total_num = 1.
    SORT et_out BY seqnr.
    LOOP AT et_out ASSIGNING <ls_oiv>.
      SORT <ls_oiv>-o BY seqnr.
      LOOP AT <ls_oiv>-o ASSIGNING <ls_org>.
        SORT <ls_org>-pl BY seqnr.
        LOOP AT <ls_org>-pl ASSIGNING <ls_pl>.
          <ls_pl>-num = lv_total_num.
          lv_total_num = lv_total_num + 1.
          ev_total = ev_total + <ls_pl>-count.
        ENDLOOP.
      ENDLOOP.
    ENDLOOP.
  ENDMETHOD.
  METHOD _print.
    DATA: lt_x_out TYPE TABLE OF tbl1024,
          lt_mime  TYPE TABLE OF w3mime.
    TRY.
        CALL FUNCTION 'WWWDATA_IMPORT'
          EXPORTING
            key    = VALUE wwwdatatab( relid = 'MI' objid = SWITCH #( p_emp WHEN abap_false THEN mc_template_no ELSE mc_template ) )
          TABLES
            mime   = lt_mime
          EXCEPTIONS
            OTHERS = 0.
        DATA(lv_x_template) = cl_bcs_convert=>xtab_to_xstring( it_xtab = lt_mime ).
        DATA(lo_xlsx) = NEW zcl_excel_reader_2007( )->zif_excel_reader~load(
          EXPORTING
            i_excel2007            = lv_x_template
        ).
        _prepare_xlsx( io_xlsx = lo_xlsx ).
        DATA(lv_x_out) = NEW zcl_excel_writer_2007( )->zif_excel_writer~write_file( io_excel = lo_xlsx ).
        cl_bcs_convert=>xstring_to_xtab(
          EXPORTING
            iv_xstring = lv_x_out
          IMPORTING
            et_xtab    = lt_x_out
        ).
        DATA(lv_filename) = |{ p_path }\\{ text-rep }_{ sy-datum }{ sy-timlo }.xlsx|.
        cl_gui_frontend_services=>gui_download(
          EXPORTING
            bin_filesize              = xstrlen( lv_x_out )
            filename                  = lv_filename
            filetype                  = 'BIN'
          CHANGING
            data_tab                  = lt_x_out
          EXCEPTIONS
            OTHERS                    = 24
        ).
        IF sy-subrc <> 0.
          MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
                     WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
        ENDIF.
        cl_gui_frontend_services=>execute(
          EXPORTING
            document               = |"{ lv_filename }"|
          EXCEPTIONS
            OTHERS                 = 10
        ).
        IF sy-subrc <> 0.
          MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
                     WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
        ENDIF.
      CATCH zcx_excel cx_bcs.
    ENDTRY.
  ENDMETHOD.
  METHOD _prepare_xlsx.
    _prepare_data(
      IMPORTING
        et_out = DATA(lt_out)
        ev_total = DATA(lv_total)
    ).
    DATA(lo_worksheet) = io_xlsx->get_active_worksheet( ).
    TRY.
        DATA(lv_block_row) = lo_worksheet->sheet_content[ cell_value = '[oiv]' ]-cell_row.
        DATA(lt_block_row) = VALUE zexcel_t_cell_data( FOR ls_con IN lo_worksheet->sheet_content WHERE ( cell_row = lv_block_row ) ( ls_con ) ).
      CATCH cx_sy_itab_line_not_found.
        RETURN.
    ENDTRY.
    TRY.
        DATA(lv_main_row) = lo_worksheet->sheet_content[ cell_value = '[num]' ]-cell_row.
        DATA(lt_main_row) = VALUE zexcel_t_cell_data( FOR ls_cont IN lo_worksheet->sheet_content WHERE ( cell_row = lv_main_row ) ( ls_cont ) ).
      CATCH cx_sy_itab_line_not_found.
        RETURN.
    ENDTRY.
    DATA(lv_tabix) = VALUE int4( ).
    LOOP AT lt_out ASSIGNING FIELD-SYMBOL(<ls_to_out>).
*     Block OIV
      LOOP AT lt_block_row ASSIGNING FIELD-SYMBOL(<ls_content>).
        TRY.
            lo_worksheet->set_cell(
                ip_column    = <ls_content>-cell_column
                ip_row       = lv_block_row + lv_tabix
                ip_value     = <ls_content>-cell_value
                ip_formula   = <ls_content>-cell_formula
                ip_style     = <ls_content>-cell_style
                ip_data_type = <ls_content>-data_type
            ).
            IF strlen( <ls_to_out>-oiv ) > 80.
              lo_worksheet->get_row( ip_row = lv_block_row + lv_tabix )->set_row_height( ip_row_height = 35 ).
            ENDIF.
          CATCH zcx_excel.
        ENDTRY.
      ENDLOOP.
      IF sy-subrc = 0.
        TRY.
            lo_worksheet->set_merge(
                ip_column_start = lt_block_row[ 1 ]-cell_column
                ip_column_end   = lt_block_row[ lines( lt_block_row ) ]-cell_column
                ip_row          = lv_block_row + lv_tabix
                ip_row_to       = lv_block_row + lv_tabix
            ).
          CATCH zcx_excel.
        ENDTRY.
      ENDIF.
      lv_tabix = lv_tabix + 1.
      LOOP AT CAST cl_abap_structdescr( cl_abap_typedescr=>describe_by_data( <ls_to_out> ) )->get_components( ) ASSIGNING FIELD-SYMBOL(<ls_comp>).
        ASSIGN COMPONENT <ls_comp>-name OF STRUCTURE <ls_to_out> TO FIELD-SYMBOL(<lv_fld>).
        IF sy-subrc = 0.
          LOOP AT lo_worksheet->sheet_content ASSIGNING FIELD-SYMBOL(<ls_sheet>) WHERE cell_value = |[{ <ls_comp>-name CASE = LOWER }]|.
            <ls_sheet>-cell_value = <lv_fld>.
          ENDLOOP.
        ENDIF.
      ENDLOOP.
      LOOP AT <ls_to_out>-o ASSIGNING FIELD-SYMBOL(<ls_org>).
        IF <ls_org>-org <> <ls_to_out>-oiv_id.
*         Org unit
          LOOP AT lt_main_row ASSIGNING <ls_content>.
            TRY.
                DATA(lv_org_value) = COND pstring( WHEN <ls_content>-cell_value = '[plans]' THEN <ls_org>-org_txt ).
                lo_worksheet->set_cell(
                    ip_column    = <ls_content>-cell_column
                    ip_row       = lv_block_row + lv_tabix
                    ip_value     = lv_org_value
                    ip_formula   = <ls_content>-cell_formula
                    ip_style     = <ls_content>-cell_style
                    ip_data_type = <ls_content>-data_type
                ).
                IF lv_org_value IS NOT INITIAL.
                  lo_worksheet->change_cell_style(
                      ip_column    = <ls_content>-cell_column
                      ip_row       = lv_block_row + lv_tabix
                      ip_font_bold                   = abap_true
                  ).
                ENDIF.
              CATCH zcx_excel.
            ENDTRY.
          ENDLOOP.
          lv_tabix = lv_tabix + 1.
        ENDIF.
        LOOP AT <ls_org>-pl ASSIGNING FIELD-SYMBOL(<ls_pl>).
*         Positions
          LOOP AT lt_main_row ASSIGNING <ls_content>.
            TRY.
                lo_worksheet->set_cell(
                    ip_column    = <ls_content>-cell_column
                    ip_row       = lv_block_row + lv_tabix
                    ip_value     = <ls_content>-cell_value
                    ip_formula   = <ls_content>-cell_formula
                    ip_style     = <ls_content>-cell_style
                    ip_data_type = <ls_content>-data_type
                ).
                IF <ls_content>-cell_value = '[plans]'.
                  lo_worksheet->change_cell_style(
                      ip_column    = <ls_content>-cell_column
                      ip_row       = lv_block_row + lv_tabix
                      ip_alignment_horizontal = 'left'
                  ).
                ENDIF.
              CATCH zcx_excel.
            ENDTRY.
          ENDLOOP.
          lv_tabix = lv_tabix + 1.
          LOOP AT CAST cl_abap_structdescr( cl_abap_typedescr=>describe_by_data( <ls_pl> ) )->get_components( ) ASSIGNING <ls_comp>.
            ASSIGN COMPONENT <ls_comp>-name OF STRUCTURE <ls_pl> TO <lv_fld>.
            IF sy-subrc = 0.
              LOOP AT lo_worksheet->sheet_content ASSIGNING <ls_sheet> WHERE cell_value = |[{ <ls_comp>-name CASE = LOWER }]|.
                <ls_sheet>-cell_value = <lv_fld>.
              ENDLOOP.
            ENDIF.
          ENDLOOP.
        ENDLOOP.
      ENDLOOP.
    ENDLOOP.
*   Total
    LOOP AT lt_main_row ASSIGNING <ls_content>.
      TRY.
          DATA(lv_value) = COND pstring(
            WHEN <ls_content>-cell_value = '[plans]' THEN 'Итого:'(tot)
            WHEN <ls_content>-cell_value = '[count]' THEN lv_total
          ).
          lo_worksheet->set_cell(
              ip_column    = <ls_content>-cell_column
              ip_row       = lv_block_row + lv_tabix
              ip_value     = lv_value
              ip_formula   = <ls_content>-cell_formula
              ip_style     = <ls_content>-cell_style
              ip_data_type = <ls_content>-data_type
          ).
          IF lv_value IS NOT INITIAL.
            lo_worksheet->change_cell_style(
                ip_column    = <ls_content>-cell_column
                ip_row       = lv_block_row + lv_tabix
                ip_font_bold = abap_true
                ip_alignment_horizontal = SWITCH #( <ls_content>-cell_value WHEN '[plans]' THEN 'left' ELSE 'center' )
            ).
          ENDIF.
        CATCH zcx_excel.
      ENDTRY.
    ENDLOOP.
  ENDMETHOD.
ENDCLASS.
