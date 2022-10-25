class ZCL_ARGUS_REF_ANALYTIC definition
  public
  final
  create public .

public section.

  methods CONSTRUCTOR
    importing
      !IO_REF type ref to ZCL_ARGUS_REF
      !IO_REF_PREV type ref to ZCL_ARGUS_REF .
  methods GET_PERSONAL
    returning
      value(RV_TXT) type PSTRING .
  methods GET_INCOME
    returning
      value(RV_TXT) type PSTRING .
  methods GET_EXPENSE
    returning
      value(RV_TXT) type PSTRING .
  methods GET_TRANSPORT
    returning
      value(RV_TXT) type PSTRING .
  methods GET_REALTY
    returning
      value(RV_TXT) type PSTRING .
  methods GET_BANK
    returning
      value(RV_TXT) type PSTRING .
  methods GET_STOCK
    returning
      value(RV_TXT) type PSTRING .
  methods GET_OBLIGATION
    returning
      value(RV_TXT) type PSTRING .
  methods GET_COMPANY
    returning
      value(RV_TXT) type PSTRING .
  methods GET_OIV
    returning
      value(RV_TXT) type PSTRING .
  methods GET_CREDIT
    returning
      value(RV_TXT) type PSTRING .
  methods GET_DEAL
    returning
      value(RV_TXT) type PSTRING .
  PROTECTED SECTION.
  PRIVATE SECTION.

    DATA go_ref TYPE REF TO zcl_argus_ref .
    DATA go_ref_prev TYPE REF TO zcl_argus_ref .
ENDCLASS.



CLASS ZCL_ARGUS_REF_ANALYTIC IMPLEMENTATION.


  METHOD constructor.
    go_ref = io_ref.
    go_ref_prev = io_ref_prev.
  ENDMETHOD.


METHOD get_bank.
  IF go_ref_prev IS NOT BOUND.
    IF go_ref->gt_bank0 IS NOT INITIAL.
      rv_txt = |Добавлено:|.
      LOOP AT go_ref->gt_bank0 ASSIGNING FIELD-SYMBOL(<ls_incm>).
        rv_txt = |{ rv_txt }<br><li>{ <ls_incm>-naboci } { <ls_incm>-afroa }|.
      ENDLOOP.
    ENDIF.
  ELSE.
    IF go_ref->gt_bank0 <> go_ref_prev->gt_bank0.
      DATA(lv_add) = VALUE pstring( ).
      LOOP AT go_ref->gt_bank0 ASSIGNING <ls_incm>.
        CHECK NOT line_exists( go_ref_prev->gt_bank0[ naboci = <ls_incm>-naboci afroa = <ls_incm>-afroa ] ).
        lv_add = |{ lv_add }<br><li>{ <ls_incm>-naboci } { <ls_incm>-afroa }|.
      ENDLOOP.
      IF lv_add IS NOT INITIAL.
        rv_txt = |{ rv_txt }Добавлено:{ lv_add }|.
      ENDIF.
      DATA(lv_delete) = VALUE pstring( ).
      LOOP AT go_ref_prev->gt_bank0 ASSIGNING <ls_incm>.
        CHECK NOT line_exists( go_ref->gt_bank0[ naboci = <ls_incm>-naboci afroa = <ls_incm>-afroa ] ).
        lv_delete = |{ lv_delete }<br><li>{ <ls_incm>-naboci } { <ls_incm>-afroa }|.
      ENDLOOP.
      IF lv_delete IS NOT INITIAL.
        rv_txt = |{ rv_txt }Удалено:{ lv_delete }|.
      ENDIF.
      DATA(lv_changed) = VALUE pstring( ).
      DATA lo_type TYPE REF TO cl_abap_elemdescr.
      LOOP AT go_ref->gt_bank0 ASSIGNING <ls_incm>.
        ASSIGN go_ref_prev->gt_bank0[ lineid = <ls_incm>-lineid ] TO FIELD-SYMBOL(<ls_prev>).
        CHECK sy-subrc = 0.
        LOOP AT CAST cl_abap_structdescr( cl_abap_structdescr=>describe_by_data( p_data = <ls_incm> ) )->get_components( ) ASSIGNING FIELD-SYMBOL(<ls_comp>) WHERE name <> 'DOCID'.
          ASSIGN COMPONENT <ls_comp>-name OF STRUCTURE <ls_incm> TO FIELD-SYMBOL(<lv_fld>).
          ASSIGN COMPONENT <ls_comp>-name OF STRUCTURE <ls_prev> TO FIELD-SYMBOL(<lv_fld_prev>).
          CHECK <lv_fld> <> <lv_fld_prev>.
*          lv_changed = |{ lv_changed }<br><li>{ <lv_fld> } ({ <lv_fld_prev> })|.
*-
          CLEAR lo_type.
          lo_type ?= <ls_comp>-type.
          IF lo_type->help_id = 'BEGDA' OR lo_type->help_id = 'ENDDA' OR lo_type->help_id = 'DATUM'.
            lv_changed = |{ lv_changed }<br><li>{ <lv_fld>+6(2) }.{ <lv_fld>+4(2) }.{ <lv_fld>+0(4) } ({ <lv_fld_prev>+6(2) }.{ <lv_fld_prev>+4(2) }.{ <lv_fld_prev>+0(4) })|.
          ELSE.
            lv_changed = |{ lv_changed }<br><li>{ <lv_fld> } ({ <lv_fld_prev> })|.
          ENDIF.
*-
        ENDLOOP.
      ENDLOOP.
      IF lv_changed IS NOT INITIAL.
        rv_txt = |{ rv_txt }Изменено (предыдущее значение):{ lv_changed }|.
      ENDIF.
    ENDIF.
  ENDIF.
  IF rv_txt IS INITIAL.
    rv_txt = |Данные не изменены|.
  ENDIF.
ENDMETHOD.


METHOD get_company.
  IF go_ref_prev IS NOT BOUND.
    IF go_ref->gt_secu0 IS NOT INITIAL.
      rv_txt = |Добавлено:|.
      LOOP AT go_ref->gt_secu0 ASSIGNING FIELD-SYMBOL(<ls_incm>).
        rv_txt = |{ rv_txt }<br><li>{ <ls_incm>-name1 } { <ls_incm>-total }|.
      ENDLOOP.
    ENDIF.
  ELSE.
    IF go_ref->gt_secu0 <> go_ref_prev->gt_secu0.
      DATA(lv_add) = VALUE pstring( ).
      LOOP AT go_ref->gt_secu0 ASSIGNING <ls_incm>.
        CHECK NOT line_exists( go_ref_prev->gt_secu0[ name1 = <ls_incm>-name1 total = <ls_incm>-total ] ).
        lv_add = |{ lv_add }<br><li>{ <ls_incm>-name1 } { <ls_incm>-total }|.
      ENDLOOP.
      IF lv_add IS NOT INITIAL.
        rv_txt = |{ rv_txt }Добавлено:{ lv_add }|.
      ENDIF.
      DATA(lv_delete) = VALUE pstring( ).
      LOOP AT go_ref_prev->gt_secu0 ASSIGNING <ls_incm>.
        CHECK NOT line_exists( go_ref->gt_secu0[ name1 = <ls_incm>-name1 total = <ls_incm>-total ] ).
        lv_delete = |{ lv_delete }<br><li>{ <ls_incm>-name1 } { <ls_incm>-total }|.
      ENDLOOP.
      IF lv_delete IS NOT INITIAL.
        rv_txt = |{ rv_txt }Удалено:{ lv_delete }|.
      ENDIF.
      DATA(lv_changed) = VALUE pstring( ).
      LOOP AT go_ref->gt_secu0 ASSIGNING <ls_incm>.
        ASSIGN go_ref_prev->gt_secu0[ lineid = <ls_incm>-lineid ] TO FIELD-SYMBOL(<ls_prev>).
        CHECK sy-subrc = 0.
        LOOP AT CAST cl_abap_structdescr( cl_abap_structdescr=>describe_by_data( p_data = <ls_incm> ) )->get_components( ) ASSIGNING FIELD-SYMBOL(<ls_comp>) WHERE name <> 'DOCID'.
          ASSIGN COMPONENT <ls_comp>-name OF STRUCTURE <ls_incm> TO FIELD-SYMBOL(<lv_fld>).
          ASSIGN COMPONENT <ls_comp>-name OF STRUCTURE <ls_prev> TO FIELD-SYMBOL(<lv_fld_prev>).
          CHECK <lv_fld> <> <lv_fld_prev>.
          lv_changed = |{ lv_changed }<br><li>{ <lv_fld> } ({ <lv_fld_prev> })|.
        ENDLOOP.
      ENDLOOP.
      IF lv_changed IS NOT INITIAL.
        rv_txt = |{ rv_txt }Изменено (предыдущее значение):{ lv_changed }|.
      ENDIF.
    ENDIF.
  ENDIF.
  IF rv_txt IS INITIAL.
    rv_txt = |Данные не изменены|.
  ENDIF.
ENDMETHOD.


METHOD get_credit.
  IF go_ref_prev IS NOT BOUND.
    IF go_ref->gt_urge0 IS NOT INITIAL.
      rv_txt = |Добавлено:|.
      LOOP AT go_ref->gt_urge0 ASSIGNING FIELD-SYMBOL(<ls_incm>).
        rv_txt = |{ rv_txt }<br><li>{ <ls_incm>-commobl } { <ls_incm>-prinam }|.
      ENDLOOP.
    ENDIF.
  ELSE.
    IF go_ref->gt_urge0 <> go_ref_prev->gt_urge0.
      DATA(lv_add) = VALUE pstring( ).
      LOOP AT go_ref->gt_urge0 ASSIGNING <ls_incm>.
        CHECK NOT line_exists( go_ref_prev->gt_urge0[ commobl = <ls_incm>-commobl prinam = <ls_incm>-prinam ] ).
        lv_add = |{ lv_add }<br><li>{ <ls_incm>-commobl } { <ls_incm>-prinam }|.
      ENDLOOP.
      IF lv_add IS NOT INITIAL.
        rv_txt = |{ rv_txt }Добавлено:{ lv_add }|.
      ENDIF.
      DATA(lv_delete) = VALUE pstring( ).
      LOOP AT go_ref_prev->gt_urge0 ASSIGNING <ls_incm>.
        CHECK NOT line_exists( go_ref->gt_urge0[ commobl = <ls_incm>-commobl prinam = <ls_incm>-prinam ] ).
        lv_delete = |{ lv_delete }<br><li>{ <ls_incm>-commobl } { <ls_incm>-prinam }|.
      ENDLOOP.
      IF lv_delete IS NOT INITIAL.
        rv_txt = |{ rv_txt }Удалено:{ lv_delete }|.
      ENDIF.
      DATA(lv_changed) = VALUE pstring( ).
      LOOP AT go_ref->gt_urge0 ASSIGNING <ls_incm>.
        ASSIGN go_ref_prev->gt_urge0[ lineid = <ls_incm>-lineid ] TO FIELD-SYMBOL(<ls_prev>).
        CHECK sy-subrc = 0.
        LOOP AT CAST cl_abap_structdescr( cl_abap_structdescr=>describe_by_data( p_data = <ls_incm> ) )->get_components( ) ASSIGNING FIELD-SYMBOL(<ls_comp>) WHERE name <> 'DOCID'.
          ASSIGN COMPONENT <ls_comp>-name OF STRUCTURE <ls_incm> TO FIELD-SYMBOL(<lv_fld>).
          ASSIGN COMPONENT <ls_comp>-name OF STRUCTURE <ls_prev> TO FIELD-SYMBOL(<lv_fld_prev>).
          CHECK <lv_fld> <> <lv_fld_prev>.
          lv_changed = |{ lv_changed }<br><li>{ <lv_fld> } ({ <lv_fld_prev> })|.
        ENDLOOP.
      ENDLOOP.
      IF lv_changed IS NOT INITIAL.
        rv_txt = |{ rv_txt }Изменено (предыдущее значение):{ lv_changed }|.
      ENDIF.
    ENDIF.
  ENDIF.
  IF rv_txt IS INITIAL.
    rv_txt = |Данные не изменены|.
  ENDIF.
ENDMETHOD.


METHOD get_deal.
  IF go_ref_prev IS NOT BOUND.
    IF go_ref->gt_gift0 IS NOT INITIAL.
      rv_txt = |Добавлено:|.
      LOOP AT go_ref->gt_gift0 ASSIGNING FIELD-SYMBOL(<ls_incm>).
        rv_txt = |{ rv_txt }<br><li>{ <ls_incm>-protype } { <ls_incm>-name1 }|.
      ENDLOOP.
    ENDIF.
  ELSE.
    IF go_ref->gt_gift0 <> go_ref_prev->gt_gift0.
      DATA(lv_add) = VALUE pstring( ).
      LOOP AT go_ref->gt_gift0 ASSIGNING <ls_incm>.
        CHECK NOT line_exists( go_ref_prev->gt_gift0[ protype = <ls_incm>-protype name1 = <ls_incm>-name1 ] ).
        lv_add = |{ lv_add }<br><li>{ <ls_incm>-protype } { <ls_incm>-name1 }|.
      ENDLOOP.
      IF lv_add IS NOT INITIAL.
        rv_txt = |{ rv_txt }Добавлено:{ lv_add }|.
      ENDIF.
      DATA(lv_delete) = VALUE pstring( ).
      LOOP AT go_ref_prev->gt_gift0 ASSIGNING <ls_incm>.
        CHECK NOT line_exists( go_ref->gt_gift0[ protype = <ls_incm>-protype name1 = <ls_incm>-name1 ] ).
        lv_delete = |{ lv_delete }<br><li>{ <ls_incm>-protype } { <ls_incm>-name1 }|.
      ENDLOOP.
      IF lv_delete IS NOT INITIAL.
        rv_txt = |{ rv_txt }Удалено:{ lv_delete }|.
      ENDIF.
      DATA(lv_changed) = VALUE pstring( ).
      LOOP AT go_ref->gt_gift0 ASSIGNING <ls_incm>.
        ASSIGN go_ref_prev->gt_gift0[ lineid = <ls_incm>-lineid ] TO FIELD-SYMBOL(<ls_prev>).
        CHECK sy-subrc = 0.
        LOOP AT CAST cl_abap_structdescr( cl_abap_structdescr=>describe_by_data( p_data = <ls_incm> ) )->get_components( ) ASSIGNING FIELD-SYMBOL(<ls_comp>) WHERE name <> 'DOCID'.
          ASSIGN COMPONENT <ls_comp>-name OF STRUCTURE <ls_incm> TO FIELD-SYMBOL(<lv_fld>).
          ASSIGN COMPONENT <ls_comp>-name OF STRUCTURE <ls_prev> TO FIELD-SYMBOL(<lv_fld_prev>).
          CHECK <lv_fld> <> <lv_fld_prev>.
          lv_changed = |{ lv_changed }<br><li>{ <lv_fld> } ({ <lv_fld_prev> })|.
        ENDLOOP.
      ENDLOOP.
      IF lv_changed IS NOT INITIAL.
        rv_txt = |{ rv_txt }Изменено (предыдущее значение):{ lv_changed }|.
      ENDIF.
    ENDIF.
  ENDIF.
  IF rv_txt IS INITIAL.
    rv_txt = |Данные не изменены|.
  ENDIF.
ENDMETHOD.


METHOD get_expense.
  IF go_ref_prev IS NOT BOUND.
    IF go_ref->gt_expn0 IS NOT INITIAL.
      rv_txt = |Добавлено:|.
      LOOP AT go_ref->gt_expn0 ASSIGNING FIELD-SYMBOL(<ls_incm>).
        rv_txt = |{ rv_txt }<br><li>{ <ls_incm>-protype } { <ls_incm>-landtype } { <ls_incm>-trntype } { <ls_incm>-total }|.
      ENDLOOP.
    ENDIF.
  ELSE.
    IF go_ref->gt_expn0 <> go_ref_prev->gt_expn0.
      DATA(lv_add) = VALUE pstring( ).
      LOOP AT go_ref->gt_expn0 ASSIGNING <ls_incm>.
        CHECK NOT line_exists( go_ref_prev->gt_expn0[ protype = <ls_incm>-protype landtype = <ls_incm>-landtype trntype = <ls_incm>-trntype total = <ls_incm>-total ] ).
        lv_add = |{ lv_add }<br><li>{ <ls_incm>-protype } { <ls_incm>-landtype } { <ls_incm>-trntype } { <ls_incm>-total }|.
      ENDLOOP.
      IF lv_add IS NOT INITIAL.
        rv_txt = |{ rv_txt }Добавлено:{ lv_add }|.
      ENDIF.
      DATA(lv_delete) = VALUE pstring( ).
      LOOP AT go_ref_prev->gt_expn0 ASSIGNING <ls_incm>.
        CHECK NOT line_exists( go_ref->gt_expn0[ protype = <ls_incm>-protype landtype = <ls_incm>-landtype trntype = <ls_incm>-trntype total = <ls_incm>-total ] ).
        lv_delete = |{ lv_delete }<br><li>{ <ls_incm>-protype } { <ls_incm>-landtype } { <ls_incm>-trntype } { <ls_incm>-total }|.
      ENDLOOP.
      IF lv_delete IS NOT INITIAL.
        rv_txt = |{ rv_txt }Удалено:{ lv_delete }|.
      ENDIF.
      DATA(lv_changed) = VALUE pstring( ).
      LOOP AT go_ref->gt_expn0 ASSIGNING <ls_incm>.
        ASSIGN go_ref_prev->gt_expn0[ lineid = <ls_incm>-lineid ] TO FIELD-SYMBOL(<ls_prev>).
        CHECK sy-subrc = 0.
        LOOP AT CAST cl_abap_structdescr( cl_abap_structdescr=>describe_by_data( p_data = <ls_incm> ) )->get_components( ) ASSIGNING FIELD-SYMBOL(<ls_comp>) WHERE name <> 'DOCID'.
          ASSIGN COMPONENT <ls_comp>-name OF STRUCTURE <ls_incm> TO FIELD-SYMBOL(<lv_fld>).
          ASSIGN COMPONENT <ls_comp>-name OF STRUCTURE <ls_prev> TO FIELD-SYMBOL(<lv_fld_prev>).
          CHECK <lv_fld> <> <lv_fld_prev>.
          lv_changed = |{ lv_changed }<br><li>{ <lv_fld> } ({ <lv_fld_prev> })|.
        ENDLOOP.
      ENDLOOP.
      IF lv_changed IS NOT INITIAL.
        rv_txt = |{ rv_txt }Изменено (предыдущее значение):{ lv_changed }|.
      ENDIF.
    ENDIF.
  ENDIF.
  IF rv_txt IS INITIAL.
    rv_txt = |Данные не изменены|.
  ENDIF.
ENDMETHOD.


METHOD get_income.
  IF go_ref_prev IS NOT BOUND.
    IF go_ref->gt_incm0 IS NOT INITIAL.
      rv_txt = |Добавлено:|.
      LOOP AT go_ref->gt_incm0 ASSIGNING FIELD-SYMBOL(<ls_incm>).
        rv_txt = |{ rv_txt }<br><li>{ zcl_argus_ref=>format_camel( <ls_incm>-type ) } { <ls_incm>-amount }|.
      ENDLOOP.
    ENDIF.
  ELSE.
    IF go_ref->gt_incm0 <> go_ref_prev->gt_incm0.
      DATA(lv_add) = VALUE pstring( ).
      LOOP AT go_ref->gt_incm0 ASSIGNING <ls_incm>.
        CHECK NOT line_exists( go_ref_prev->gt_incm0[ type = <ls_incm>-type amount = <ls_incm>-amount ] ).
        lv_add = |{ lv_add }<br><li>{ zcl_argus_ref=>format_camel( <ls_incm>-type ) } { <ls_incm>-amount }|.
      ENDLOOP.
      IF lv_add IS NOT INITIAL.
        rv_txt = |{ rv_txt }Добавлено:{ lv_add }|.
      ENDIF.
      DATA(lv_delete) = VALUE pstring( ).
      LOOP AT go_ref_prev->gt_incm0 ASSIGNING <ls_incm>.
        CHECK NOT line_exists( go_ref->gt_incm0[ type = <ls_incm>-type amount = <ls_incm>-amount ] ).
        lv_delete = |{ lv_delete }<br><li>{ zcl_argus_ref=>format_camel( <ls_incm>-type ) } { <ls_incm>-amount }|.
      ENDLOOP.
      IF lv_delete IS NOT INITIAL.
        rv_txt = |{ rv_txt }Удалено:{ lv_delete }|.
      ENDIF.
      DATA(lv_changed) = VALUE pstring( ).
      LOOP AT go_ref->gt_incm0 ASSIGNING <ls_incm>.
        ASSIGN go_ref_prev->gt_incm0[ type = zcl_argus_ref=>format_camel( <ls_incm>-type ) amount = <ls_incm>-amount ] TO FIELD-SYMBOL(<ls_prev>).
        CHECK sy-subrc = 0.
        LOOP AT CAST cl_abap_structdescr( cl_abap_structdescr=>describe_by_data( p_data = <ls_incm> ) )->get_components( ) ASSIGNING FIELD-SYMBOL(<ls_comp>) WHERE name <> 'DOCID'.
          ASSIGN COMPONENT <ls_comp>-name OF STRUCTURE <ls_incm> TO FIELD-SYMBOL(<lv_fld>).
          ASSIGN COMPONENT <ls_comp>-name OF STRUCTURE <ls_prev> TO FIELD-SYMBOL(<lv_fld_prev>).
          CHECK <lv_fld> <> <lv_fld_prev>.
          lv_changed = |{ lv_changed }<br><li>{ <lv_fld> } ({ <lv_fld_prev> })|.
        ENDLOOP.
      ENDLOOP.
      IF lv_changed IS NOT INITIAL.
        rv_txt = |{ rv_txt }Изменено (предыдущее значение):{ lv_changed }|.
      ENDIF.
    ENDIF.
  ENDIF.
  IF rv_txt IS INITIAL.
    rv_txt = |Данные не изменены|.
  ENDIF.
  IF rv_txt IS INITIAL.
    rv_txt = |Данные не изменены|.
  ENDIF.
ENDMETHOD.


METHOD get_obligation.
  IF go_ref_prev IS NOT BOUND.
    IF go_ref->gt_obli0 IS NOT INITIAL.
      rv_txt = |Добавлено:|.
      LOOP AT go_ref->gt_obli0 ASSIGNING FIELD-SYMBOL(<ls_incm>).
        rv_txt = |{ rv_txt }<br><li>{ <ls_incm>-protype } { <ls_incm>-name }|.
      ENDLOOP.
    ENDIF.
  ELSE.
    IF go_ref->gt_obli0 <> go_ref_prev->gt_obli0.
      DATA(lv_add) = VALUE pstring( ).
      LOOP AT go_ref->gt_obli0 ASSIGNING <ls_incm>.
        CHECK NOT line_exists( go_ref_prev->gt_obli0[ protype = <ls_incm>-protype name = <ls_incm>-name ] ).
        lv_add = |{ lv_add }<br><li>{ <ls_incm>-protype } { <ls_incm>-name }|.
      ENDLOOP.
      IF lv_add IS NOT INITIAL.
        rv_txt = |{ rv_txt }Добавлено:{ lv_add }|.
      ENDIF.
      DATA(lv_delete) = VALUE pstring( ).
      LOOP AT go_ref_prev->gt_obli0 ASSIGNING <ls_incm>.
        CHECK NOT line_exists( go_ref->gt_obli0[ protype = <ls_incm>-protype name = <ls_incm>-name ] ).
        lv_delete = |{ lv_delete }<br><li>{ <ls_incm>-protype } { <ls_incm>-name }|.
      ENDLOOP.
      IF lv_delete IS NOT INITIAL.
        rv_txt = |{ rv_txt }Удалено:{ lv_delete }|.
      ENDIF.
      DATA(lv_changed) = VALUE pstring( ).
      LOOP AT go_ref->gt_obli0 ASSIGNING <ls_incm>.
        ASSIGN go_ref_prev->gt_obli0[ lineid = <ls_incm>-lineid ] TO FIELD-SYMBOL(<ls_prev>).
        CHECK sy-subrc = 0.
        LOOP AT CAST cl_abap_structdescr( cl_abap_structdescr=>describe_by_data( p_data = <ls_incm> ) )->get_components( ) ASSIGNING FIELD-SYMBOL(<ls_comp>) WHERE name <> 'DOCID'.
          ASSIGN COMPONENT <ls_comp>-name OF STRUCTURE <ls_incm> TO FIELD-SYMBOL(<lv_fld>).
          ASSIGN COMPONENT <ls_comp>-name OF STRUCTURE <ls_prev> TO FIELD-SYMBOL(<lv_fld_prev>).
          CHECK <lv_fld> <> <lv_fld_prev>.
          lv_changed = |{ lv_changed }<br><li>{ <lv_fld> } ({ <lv_fld_prev> })|.
        ENDLOOP.
      ENDLOOP.
      IF lv_changed IS NOT INITIAL.
        rv_txt = |{ rv_txt }Изменено (предыдущее значение):{ lv_changed }|.
      ENDIF.
    ENDIF.
  ENDIF.
  IF rv_txt IS INITIAL.
    rv_txt = |Данные не изменены|.
  ENDIF.
ENDMETHOD.


METHOD get_oiv.

  DATA: lv_oiv      TYPE string,
        lv_position TYPE string.


  SELECT * FROM pa0001 INTO TABLE @DATA(lt_0001) WHERE pernr = @go_ref->gs_pers0-pernr.

  SORT lt_0001 BY begda DESCENDING.
  ASSIGN lt_0001[ 1 ] TO FIELD-SYMBOL(<ls_0001>).
  CHECK sy-subrc = 0.
  lv_oiv = zcl_hr_data_utils=>get_last_but_one_ogreh_name_o(
     i_otype = cl_hap_pmp_const=>otype_orgunit
     i_objid = <ls_0001>-orgeh
  ).

  SELECT * FROM hrp1000 INTO TABLE @DATA(lt_txt)
       WHERE plvar = @cl_hap_pmp_const=>plvar
       AND ( otype = @cl_hap_pmp_const=>otype_orgunit OR otype = @cl_hap_pmp_const=>otype_position )
       AND ( objid = @<ls_0001>-plans OR objid = @<ls_0001>-orgeh )
       AND langu = @sy-langu
       ORDER BY begda DESCENDING.
  lv_position = VALUE #( lt_txt[ otype = cl_hap_pmp_const=>otype_position objid = <ls_0001>-plans ]-stext OPTIONAL ).

  rv_txt = |{ lv_oiv }<br><li>{ lv_position }|.

ENDMETHOD.


  METHOD get_personal.
    DATA lo_type TYPE REF TO cl_abap_elemdescr.
    IF go_ref_prev IS NOT BOUND.
      rv_txt = |Добавлено:<br><li>{ go_ref->gs_pers0-nachn } { go_ref->gs_pers0-vorna } { go_ref->gs_pers0-midnm }<br><li>{ go_ref->gs_pers0-gbdat DATE = USER }<br><li>{ go_ref->gs_pers0-gender }<br><li>{ go_ref->gs_base0-begda(4) } год|.
    ELSE.
      IF go_ref->gs_pers0 <> go_ref_prev->gs_pers0.
        DATA(lv_changed) = VALUE pstring( ).
        LOOP AT CAST cl_abap_structdescr( cl_abap_structdescr=>describe_by_data( p_data = go_ref->gs_pers0 ) )->get_components( ) ASSIGNING FIELD-SYMBOL(<ls_comp>) WHERE name <> 'DOCID'.
          ASSIGN COMPONENT <ls_comp>-name OF STRUCTURE go_ref->gs_pers0 TO FIELD-SYMBOL(<lv_fld>).
          ASSIGN COMPONENT <ls_comp>-name OF STRUCTURE go_ref_prev->gs_pers0 TO FIELD-SYMBOL(<lv_fld_prev>).
          CHECK <lv_fld> <> <lv_fld_prev>.
*          lv_changed = |{ lv_changed }<br><li>{ <lv_fld> } ({ <lv_fld_prev> })|.
          CLEAR lo_type.
          lo_type ?= <ls_comp>-type.
          IF lo_type->help_id = 'BEGDA' OR lo_type->help_id = 'ENDDA' OR lo_type->help_id = 'DATUM'.
            lv_changed = |{ lv_changed }<br><li>{ <lv_fld>+6(2) }.{ <lv_fld>+4(2) }.{ <lv_fld>+0(4) } ({ <lv_fld_prev>+6(2) }.{ <lv_fld_prev>+4(2) }.{ <lv_fld_prev>+0(4) })|.
          ELSE.
            lv_changed = |{ lv_changed }<br><li>{ <lv_fld> } ({ <lv_fld_prev> })|.
          ENDIF.
        ENDLOOP.
        IF lv_changed IS NOT INITIAL.
          rv_txt = |Изменено (предыдущее значение):{ lv_changed }|.
        ENDIF.
      ENDIF.
    ENDIF.
    IF rv_txt IS INITIAL.
      rv_txt = |Данные не изменены|.
    ENDIF.
  ENDMETHOD.


METHOD get_realty.
  IF go_ref_prev IS NOT BOUND.
    IF go_ref->gt_bldn0 IS NOT INITIAL.
      rv_txt = |Добавлено:|.
      LOOP AT go_ref->gt_bldn0 ASSIGNING FIELD-SYMBOL(<ls_incm>).
        rv_txt = |{ rv_txt }<br><li>{ <ls_incm>-protype } { <ls_incm>-location }|.
      ENDLOOP.
    ENDIF.
  ELSE.
    IF go_ref->gt_bldn0 <> go_ref_prev->gt_bldn0.
      DATA(lv_add) = VALUE pstring( ).
      LOOP AT go_ref->gt_bldn0 ASSIGNING <ls_incm>.
        CHECK NOT line_exists( go_ref_prev->gt_bldn0[ protype = <ls_incm>-protype location = <ls_incm>-location ] ).
        lv_add = |{ lv_add }<br><li>{ <ls_incm>-protype } { <ls_incm>-location }|.
      ENDLOOP.
      IF lv_add IS NOT INITIAL.
        rv_txt = |{ rv_txt }Добавлено:{ lv_add }|.
      ENDIF.
      DATA(lv_delete) = VALUE pstring( ).
      LOOP AT go_ref_prev->gt_bldn0 ASSIGNING <ls_incm>.
        CHECK NOT line_exists( go_ref->gt_bldn0[ protype = <ls_incm>-protype location = <ls_incm>-location ] ).
        lv_delete = |{ lv_delete }<br><li>{ <ls_incm>-protype } { <ls_incm>-location }|.
      ENDLOOP.
      IF lv_delete IS NOT INITIAL.
        rv_txt = |{ rv_txt }Удалено:{ lv_delete }|.
      ENDIF.
      DATA(lv_changed) = VALUE pstring( ).
      LOOP AT go_ref->gt_bldn0 ASSIGNING <ls_incm>.
        ASSIGN go_ref_prev->gt_bldn0[ lineid = <ls_incm>-lineid ] TO FIELD-SYMBOL(<ls_prev>).
        CHECK sy-subrc = 0.
        LOOP AT CAST cl_abap_structdescr( cl_abap_structdescr=>describe_by_data( p_data = <ls_incm> ) )->get_components( ) ASSIGNING FIELD-SYMBOL(<ls_comp>) WHERE name <> 'DOCID'.
          ASSIGN COMPONENT <ls_comp>-name OF STRUCTURE <ls_incm> TO FIELD-SYMBOL(<lv_fld>).
          ASSIGN COMPONENT <ls_comp>-name OF STRUCTURE <ls_prev> TO FIELD-SYMBOL(<lv_fld_prev>).
          CHECK <lv_fld> <> <lv_fld_prev>.
          lv_changed = |{ lv_changed }<br><li>{ <lv_fld> } ({ <lv_fld_prev> })|.
        ENDLOOP.
      ENDLOOP.
      IF lv_changed IS NOT INITIAL.
        rv_txt = |{ rv_txt }Изменено (предыдущее значение):{ lv_changed }|.
      ENDIF.
    ENDIF.
  ENDIF.
  IF rv_txt IS INITIAL.
    rv_txt = |Данные не изменены|.
  ENDIF.
ENDMETHOD.


METHOD get_stock.
  IF go_ref_prev IS NOT BOUND.
    IF go_ref->gt_osec0 IS NOT INITIAL.
      rv_txt = |Добавлено:|.
      LOOP AT go_ref->gt_osec0 ASSIGNING FIELD-SYMBOL(<ls_incm>).
        rv_txt = |{ rv_txt }<br><li>{ <ls_incm>-issuer } { <ls_incm>-total }|.
      ENDLOOP.
    ENDIF.
  ELSE.
    IF go_ref->gt_osec0 <> go_ref_prev->gt_osec0.
      DATA(lv_add) = VALUE pstring( ).
      LOOP AT go_ref->gt_osec0 ASSIGNING <ls_incm>.
        CHECK NOT line_exists( go_ref_prev->gt_osec0[ issuer = <ls_incm>-issuer total = <ls_incm>-total ] ).
        lv_add = |{ lv_add }<br><li>{ <ls_incm>-issuer } { <ls_incm>-total }|.
      ENDLOOP.
      IF lv_add IS NOT INITIAL.
        rv_txt = |{ rv_txt }Добавлено:{ lv_add }|.
      ENDIF.
      DATA(lv_delete) = VALUE pstring( ).
      LOOP AT go_ref_prev->gt_osec0 ASSIGNING <ls_incm>.
        CHECK NOT line_exists( go_ref->gt_osec0[ issuer = <ls_incm>-issuer total = <ls_incm>-total ] ).
        lv_delete = |{ lv_delete }<br><li>{ <ls_incm>-issuer } { <ls_incm>-total }|.
      ENDLOOP.
      IF lv_delete IS NOT INITIAL.
        rv_txt = |{ rv_txt }Удалено:{ lv_delete }|.
      ENDIF.
      DATA(lv_changed) = VALUE pstring( ).
      LOOP AT go_ref->gt_osec0 ASSIGNING <ls_incm>.
        ASSIGN go_ref_prev->gt_osec0[ lineid = <ls_incm>-lineid ] TO FIELD-SYMBOL(<ls_prev>).
        CHECK sy-subrc = 0.
        LOOP AT CAST cl_abap_structdescr( cl_abap_structdescr=>describe_by_data( p_data = <ls_incm> ) )->get_components( ) ASSIGNING FIELD-SYMBOL(<ls_comp>) WHERE name <> 'DOCID'.
          ASSIGN COMPONENT <ls_comp>-name OF STRUCTURE <ls_incm> TO FIELD-SYMBOL(<lv_fld>).
          ASSIGN COMPONENT <ls_comp>-name OF STRUCTURE <ls_prev> TO FIELD-SYMBOL(<lv_fld_prev>).
          CHECK <lv_fld> <> <lv_fld_prev>.
          lv_changed = |{ lv_changed }<br><li>{ <lv_fld> } ({ <lv_fld_prev> })|.
        ENDLOOP.
      ENDLOOP.
      IF lv_changed IS NOT INITIAL.
        rv_txt = |{ rv_txt }Изменено (предыдущее значение):{ lv_changed }|.
      ENDIF.
    ENDIF.
  ENDIF.
   IF rv_txt IS INITIAL.
    rv_txt = |Данные не изменены|.
  ENDIF.
ENDMETHOD.


METHOD get_transport.
  IF go_ref_prev IS NOT BOUND.
    IF go_ref->gt_tran0 IS NOT INITIAL.
      rv_txt = |Добавлено:|.
      LOOP AT go_ref->gt_tran0 ASSIGNING FIELD-SYMBOL(<ls_incm>).
        rv_txt = |{ rv_txt }<br><li>{ <ls_incm>-protype } { <ls_incm>-trnbrand } { <ls_incm>-trnmodel } { <ls_incm>-regplace }|.
      ENDLOOP.
    ENDIF.
  ELSE.
    IF go_ref->gt_tran0 <> go_ref_prev->gt_tran0.
      DATA(lv_add) = VALUE pstring( ).
      LOOP AT go_ref->gt_tran0 ASSIGNING <ls_incm>.
        CHECK NOT line_exists( go_ref_prev->gt_tran0[ protype = <ls_incm>-protype trnbrand = <ls_incm>-trnbrand trnmodel = <ls_incm>-trnmodel regplace = <ls_incm>-regplace ] ).
        lv_add = |{ lv_add }<br><li>{ <ls_incm>-protype } { <ls_incm>-trnbrand } { <ls_incm>-trnmodel } { <ls_incm>-regplace }|.
      ENDLOOP.
      IF lv_add IS NOT INITIAL.
        rv_txt = |{ rv_txt }Добавлено:{ lv_add }|.
      ENDIF.
      DATA(lv_delete) = VALUE pstring( ).
      LOOP AT go_ref_prev->gt_tran0 ASSIGNING <ls_incm>.
        CHECK NOT line_exists( go_ref->gt_tran0[ protype = <ls_incm>-protype trnbrand = <ls_incm>-trnbrand trnmodel = <ls_incm>-trnmodel regplace = <ls_incm>-regplace ] ).
        lv_delete = |{ lv_delete }<br><li>{ <ls_incm>-protype } { <ls_incm>-trnbrand } { <ls_incm>-trnmodel } { <ls_incm>-regplace }|.
      ENDLOOP.
      IF lv_delete IS NOT INITIAL.
        rv_txt = |{ rv_txt }Удалено:{ lv_delete }|.
      ENDIF.
      DATA(lv_changed) = VALUE pstring( ).
      LOOP AT go_ref->gt_tran0 ASSIGNING <ls_incm>.
        ASSIGN go_ref_prev->gt_tran0[ lineid = <ls_incm>-lineid ] TO FIELD-SYMBOL(<ls_prev>).
        CHECK sy-subrc = 0.
        LOOP AT CAST cl_abap_structdescr( cl_abap_structdescr=>describe_by_data( p_data = <ls_incm> ) )->get_components( ) ASSIGNING FIELD-SYMBOL(<ls_comp>) WHERE name <> 'DOCID'.
          ASSIGN COMPONENT <ls_comp>-name OF STRUCTURE <ls_incm> TO FIELD-SYMBOL(<lv_fld>).
          ASSIGN COMPONENT <ls_comp>-name OF STRUCTURE <ls_prev> TO FIELD-SYMBOL(<lv_fld_prev>).
          CHECK <lv_fld> <> <lv_fld_prev>.
          lv_changed = |{ lv_changed }<br><li>{ <lv_fld> } ({ <lv_fld_prev> })|.
        ENDLOOP.
      ENDLOOP.
      IF lv_changed IS NOT INITIAL.
        rv_txt = |{ rv_txt }Изменено (предыдущее значение):{ lv_changed }|.
      ENDIF.
    ENDIF.
  ENDIF.
  IF rv_txt IS INITIAL.
    rv_txt = |Данные не изменены|.
  ENDIF.
ENDMETHOD.
ENDCLASS.
