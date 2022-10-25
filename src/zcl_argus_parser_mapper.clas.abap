class ZCL_ARGUS_PARSER_MAPPER definition
  public
  final
  create public .

public section.

  methods CONSTRUCTOR .
  methods FEED
    importing
      !IV_XML type PSTRING
      !IV_FILE_SRC type XSTRINGVAL optional
      !IV_MIME_TYPE type PSTRING optional .
  methods GET
    returning
      value(RT_REF) type ZTHR_ARGUS_PARSER .
protected section.
private section.

  data GT_REF type ZTHR_ARGUS_PARSER .
  data GV_CURRENT_REF_ID type PSTRING .

  methods _PARSE_TESSERACT
    importing
      !IV_BODY type PSTRING .
  methods _INIT .
  methods _PARSE_PREFIX
    importing
      !IV_PREFIX type PSTRING
    returning
      value(RV_REF_ID) type PSTRING .
  methods _PARSE_BODY
    importing
      !IV_BODY type PSTRING .
  methods _PREPARE_BODY
    importing
      !IV_BODY type PSTRING
    returning
      value(RV_BODY) type PSTRING .
  methods _GET_NODES
    importing
      !IV_BODY type PSTRING
    returning
      value(RT_NODES) type SRT_WSDL_IXML_NODE_LIST .
  methods _PARSE_PERSONAL
    importing
      !IO_NODE type ref to IF_IXML_NODE .
  methods _PARSE_EXPENSE
    importing
      !IO_NODE type ref to IF_IXML_NODE .
  methods _PARSE_INCOME
    importing
      !IO_NODE type ref to IF_IXML_NODE .
  methods _PARSE_BASE
    importing
      !IO_NODE type ref to IF_IXML_NODE .
  methods _PARSE_ADDRESS
    importing
      !IO_NODE type ref to IF_IXML_NODE .
  methods _PARSE_PASSPORT
    importing
      !IO_NODE type ref to IF_IXML_NODE .
  methods _PARSE_BANK
    importing
      !IO_NODE type ref to IF_IXML_NODE .
  methods _PARSE_OBLIGATORY
    importing
      !IO_NODE type ref to IF_IXML_NODE .
  methods _PARSE_GIFT
    importing
      !IO_NODE type ref to IF_IXML_NODE .
  methods _PARSE_URGENT
    importing
      !IO_NODE type ref to IF_IXML_NODE .
  methods _PARSE_OTHER_STOCK
    importing
      !IO_NODE type ref to IF_IXML_NODE .
  methods _PARSE_STOCK
    importing
      !IO_NODE type ref to IF_IXML_NODE .
  methods _PARSE_TRANSPORT
    importing
      !IO_NODE type ref to IF_IXML_NODE .
  methods _PARSE_BUILD
    importing
      !IO_NODE type ref to IF_IXML_NODE .
ENDCLASS.



CLASS ZCL_ARGUS_PARSER_MAPPER IMPLEMENTATION.


  method CONSTRUCTOR.
  endmethod.


METHOD feed.
  DATA: lt_body TYPE TABLE OF pstring.
  _init( ).
  DATA(lv_prefix) = substring_to( val = iv_xml sub = '</prefix>' ).
  DATA(lv_body) = substring_after( val = iv_xml sub = '</prefix>' ).
  IF lv_body IS NOT INITIAL.
    APPEND lv_body TO lt_body.
  ELSE.
    lv_body = iv_xml.
    DO.
      DATA(lv_ref_uno) = substring_from( val = substring_to( val = lv_body sub = '/Справка>' ) sub = '<Справка' ).
      IF lv_ref_uno IS NOT INITIAL.
        APPEND lv_ref_uno TO lt_body.
        lv_body = replace( val = lv_body sub = lv_ref_uno with = space ).
      ELSE.
        EXIT.
      ENDIF.
    ENDDO.
  ENDIF.
  LOOP AT lt_body ASSIGNING FIELD-SYMBOL(<ls_body>).
*   prefix
    IF lv_prefix IS NOT INITIAL.
      gv_current_ref_id = _parse_prefix( iv_prefix = lv_prefix ).
    ELSE.
      gv_current_ref_id = cl_system_uuid=>create_uuid_c22_static( ).
      INSERT VALUE #( base-passport = gv_current_ref_id ) INTO TABLE gt_ref.
    ENDIF.
    ASSIGN gt_ref[ base-passport = gv_current_ref_id ] TO FIELD-SYMBOL(<ls_ref>).
    IF sy-subrc = 0.
      <ls_ref>-mime_type = iv_mime_type.
      <ls_ref>-file_src = iv_file_src.
    ENDIF.
*   body
    _parse_body(
      iv_body = _prepare_body( <ls_body> )
    ).
  ENDLOOP.
ENDMETHOD.


  method GET.
    rt_ref = gt_ref.
  endmethod.


METHOD _get_nodes.
  DATA(lo_xml) = cl_ixml=>create( ).
  DATA(lo_stream_factory) = lo_xml->create_stream_factory( ).
  DATA(lo_stream) = lo_stream_factory->create_istream_string( string = iv_body ).
  DATA(lo_doc) = lo_xml->create_document( ).
  DATA(lo_parser) = lo_xml->create_parser(
    stream_factory = lo_stream_factory
    istream        = lo_stream
    document       = lo_doc
  ).
  lo_parser->parse( ).
  DATA(lo_element) = lo_doc->get_root_element( ).
  CHECK lo_element IS BOUND.
  INSERT lo_element INTO TABLE rt_nodes.
  LOOP AT rt_nodes ASSIGNING FIELD-SYMBOL(<lo_node>).
    DATA(lo_child) = <lo_node>->get_first_child( ).
    WHILE NOT lo_child IS INITIAL.
      INSERT lo_child INTO TABLE rt_nodes.
      lo_child = lo_child->get_next( ).
    ENDWHILE.
  ENDLOOP.
ENDMETHOD.


  METHOD _init.
    CLEAR gv_current_ref_id.
  ENDMETHOD.


  METHOD _parse_address.
    DEFINE set_it.
      IF lv_n = &1.
        &2 = lv_v.
      ENDIF.
    END-OF-DEFINITION.
    ASSIGN gt_ref[ base-passport = gv_current_ref_id ] TO FIELD-SYMBOL(<ls_ref>).
    DATA(lo_pass) = io_node->get_first_child( ).
    CHECK lo_pass IS BOUND.
    DATA(lo_child) = lo_pass->get_first_child( ).
    WHILE NOT lo_child IS INITIAL.
      DATA(lv_v) = lo_child->get_value( ).
      DATA(lv_n) = lo_child->get_name( ).
      set_it 'Страна' <ls_ref>-registration-country.
      set_it 'Индекс' <ls_ref>-registration-indx.
      set_it 'Регион' <ls_ref>-registration-region.
      set_it 'Город' <ls_ref>-registration-city.
      set_it 'Улица' <ls_ref>-registration-street.
      set_it 'Дом' <ls_ref>-registration-house.
      set_it 'Квартира' <ls_ref>-registration-apt.
      set_it 'Корпус' <ls_ref>-registration-bldng1.
      set_it 'Строение' <ls_ref>-registration-bldng2.
      set_it 'ДополнительнаяИнформация' <ls_ref>-registration-addinfo.
      lo_child = lo_child->get_next( ).
    ENDWHILE.
  ENDMETHOD.


  METHOD _parse_bank.
    DEFINE set_it.
      IF lv_n = &1.
        &2 = lv_v.
      ENDIF.
    END-OF-DEFINITION.
    ASSIGN gt_ref[ base-passport = gv_current_ref_id ] TO FIELD-SYMBOL(<ls_ref>).
    DATA(lo_child) = io_node->get_first_child( ).
    WHILE NOT lo_child IS INITIAL.
      INSERT INITIAL LINE INTO TABLE <ls_ref>-bank ASSIGNING FIELD-SYMBOL(<ls_bank>).
      DATA(lt_nodes) = VALUE srt_wsdl_ixml_node_list( ).
      INSERT lo_child INTO TABLE lt_nodes.
      LOOP AT lt_nodes ASSIGNING FIELD-SYMBOL(<lo_node>).
        DATA(lo_child_second) = <lo_node>->get_first_child( ).
        WHILE NOT lo_child_second IS INITIAL.
          INSERT lo_child_second INTO TABLE lt_nodes.
          lo_child_second = lo_child_second->get_next( ).
        ENDWHILE.
        DATA(lv_v) = <lo_node>->get_value( ).
        DATA(lv_n) = <lo_node>->get_name( ).
        set_it 'ВалютаСчета' <ls_bank>-accur.
        set_it 'ВидСчета' <ls_bank>-actype.
        DATA(lv_date_open) = VALUE pstring( ).
        set_it 'ДатаОткрытияСчета' lv_date_open.
        IF lv_date_open IS NOT INITIAL.
          <ls_bank>-datopen = |{ lv_date_open(4) }{ lv_date_open+5(2) }{ lv_date_open+8(2) }|.
        ENDIF.
        set_it 'КредитнаяОрганизация' <ls_bank>-naboci.
        set_it 'ОстатокНаСчете' <ls_bank>-acbal.
        set_it 'Пояснения' <ls_bank>-note.
        set_it 'СуммаНеПревышаетОбщийДоход' <ls_bank>-warning.
        set_it 'СуммаПоступившихСредств' <ls_bank>-afroa.
        set_it 'НомерВыписки' <ls_bank>-statnum.
        DATA(lv_date_vip) = VALUE pstring( ).
        set_it 'ДатаВыписки' lv_date_vip.
        IF lv_date_vip IS NOT INITIAL.
          <ls_bank>-statdat = |{ lv_date_vip(4) }{ lv_date_vip+5(2) }{ lv_date_vip+8(2) }|.
        ENDIF.
      ENDLOOP.
      lo_child = lo_child->get_next( ).
    ENDWHILE.
    DELETE <ls_ref>-bank WHERE table_line IS INITIAL.
    SORT <ls_ref>-bank.
    " Закоментированно, т.к. есть случаи реально существующих счетов которые воспринимаются за дубликат
*    DELETE ADJACENT DUPLICATES FROM <ls_ref>-bank.
  ENDMETHOD.


  METHOD _parse_base.
    DEFINE set_it.
      IF lv_n = &1 AND &2 IS INITIAL.
        &2 = lv_v.
      ENDIF.
    END-OF-DEFINITION.
    ASSIGN gt_ref[ base-passport = gv_current_ref_id ] TO FIELD-SYMBOL(<ls_ref>).
    DATA(lo_child) = io_node->get_first_child( ).
    WHILE NOT lo_child IS INITIAL.
      DATA(lv_v) = lo_child->get_value( ).
      DATA(lv_n) = lo_child->get_name( ).
      set_it 'ДатаОтчета' <ls_ref>-base-ref_report.
      set_it 'ДатаПодписи' <ls_ref>-base-ref_sign.
      set_it 'ДатаУтвержденияДолжности' <ls_ref>-base-ref_approve.
      set_it 'ДостоверностьИПолнотуНастоящихСведенийПодтверждаю' <ls_ref>-base-ref_validated.
      set_it 'НаименованиеКадровогоПодразделения' <ls_ref>-base-ref_hr.
      set_it 'ОснованиеПодачиСправки' <ls_ref>-base-ref_base.
      set_it 'ОтчетныйПериодКонец' <ls_ref>-base-ref_endda.
      set_it 'ОтчетныйПериодНачало' <ls_ref>-base-ref_begda.
      set_it 'ПравовыеОснованияДляПредоставленияСведенийОРасходахОтсутствуют' <ls_ref>-base-ref_legal.
      set_it 'Уточнение' <ls_ref>-base-ref_massg.
      set_it 'ЗаполняетсяНа' <ls_ref>-base-ref_for_whom.
      set_it 'ТипДолжностиЗаявителя' <ls_ref>-base-ref_plans_type.
      set_it 'ПризнакЗаполненияОсновныхДанных' <ls_ref>-base-ref_reason.
      set_it 'МеткаВремени' <ls_ref>-base-ref_timestamp.
      set_it 'СуммарнаяДекларированнаяСтоимостьЦенныхБумаг' <ls_ref>-base-ref_sum_declare.
      lo_child = lo_child->get_next( ).
    ENDWHILE.
  ENDMETHOD.


METHOD _parse_body.
  DATA: lt_nodes TYPE TABLE OF REF TO if_ixml_node.
  ASSIGN gt_ref[ base-passport = gv_current_ref_id ] TO FIELD-SYMBOL(<ls_ref>).
  IF iv_body CP '<Распознавание>*'.
    _parse_tesseract( iv_body ).
    RETURN.
  ENDIF.
  LOOP AT _get_nodes( iv_body ) ASSIGNING FIELD-SYMBOL(<lo_node>).
    CASE <lo_node>->get_name( ).
      WHEN 'aps'.
        DATA(lv_aps) = <lo_node>->get_value( ).
        <ls_ref>-base-ref_begda = |{ lv_aps(4) }0101|.
        <ls_ref>-base-ref_endda = |{ lv_aps(4) }1231|.
      WHEN 'Справка'.
        _parse_base( io_node = <lo_node> ).
      WHEN 'ДокументУдостоверяющийЛичность'.
        _parse_passport( io_node = <lo_node> ).
      WHEN 'Регистрация'.
        _parse_address( io_node = <lo_node> ).
      WHEN 'ЛичныеДанные'.
        _parse_personal( io_node = <lo_node> ).
      WHEN 'Доходы'.
        _parse_income( io_node = <lo_node> ).
      WHEN 'Расходы'.
        _parse_expense( io_node = <lo_node> ).
      WHEN 'Счета'.
        _parse_bank( io_node = <lo_node> ).
      WHEN 'НедвижимоеИмущество'.
        _parse_build( io_node = <lo_node> ).
      WHEN 'ТранспортныеСредства'.
        _parse_transport( io_node = <lo_node> ).
      WHEN 'ЦенныеБумаги'.
        _parse_stock( io_node = <lo_node> ).
      WHEN 'ИныеЦенныеБумаги'.
        _parse_other_stock( io_node = <lo_node> ).
      WHEN 'СрочныеОбязательства'.
        _parse_urgent( io_node = <lo_node> ).
      WHEN 'Подарки'.
        _parse_gift( io_node = <lo_node> ).
      WHEN 'НедвижимоеИмуществоВПользовании'.
        _parse_obligatory( io_node = <lo_node> ).
      WHEN OTHERS.
    ENDCASE.
  ENDLOOP.
ENDMETHOD.


  METHOD _parse_build.
    DEFINE set_it.
      IF lv_n = &1.
        &2 = lv_v.
      ENDIF.
    END-OF-DEFINITION.
    DEFINE set_it_long.
      IF lv_n = &1.
        IF &2 IS INITIAL.
          &2 = lv_v.
        ELSE.
          &2 = |{ &2 }, { lv_v }|.
        ENDIF.
      ENDIF.
    END-OF-DEFINITION.
    ASSIGN gt_ref[ base-passport = gv_current_ref_id ] TO FIELD-SYMBOL(<ls_ref>).
    DATA(lo_child) = io_node->get_first_child( ).
    WHILE NOT lo_child IS INITIAL.
      INSERT INITIAL LINE INTO TABLE <ls_ref>-build ASSIGNING FIELD-SYMBOL(<ls_build>).
      DATA(lt_nodes) = VALUE srt_wsdl_ixml_node_list( ).
      INSERT lo_child INTO TABLE lt_nodes.
      DATA(lt_nodes_source) = VALUE srt_wsdl_ixml_node_list( ).
      LOOP AT lt_nodes ASSIGNING FIELD-SYMBOL(<lo_node>).
        DATA(lo_child_second) = <lo_node>->get_first_child( ).
        WHILE NOT lo_child_second IS INITIAL.
          DATA(lv_c_name) = lo_child_second->get_name( ).
          IF lv_c_name <> 'ИныеЛица'.
            INSERT lo_child_second INTO TABLE lt_nodes.
          ELSE.
            INSERT lo_child_second INTO TABLE lt_nodes_source.
          ENDIF.
          lo_child_second = lo_child_second->get_next( ).
        ENDWHILE.
        DATA(lv_v) = <lo_node>->get_value( ).
        DATA(lv_n) = <lo_node>->get_name( ).
        set_it 'ВидИмущества' <ls_build>-protype.
        set_it 'НаименованиеНедвижимогоИмущества' <ls_build>-proname.
        set_it 'ВидНедвижимогоИмущества' <ls_build>-estate.
        set_it 'ВидСобственности' <ls_build>-protype2.
        set_it 'РазмерДоли' <ls_build>-share2.
        set_it 'Площадь' <ls_build>-area.
        set_it 'ВидАктива' <ls_build>-activ_type.
        set_it 'Пояснения' <ls_build>-note.
        set_it 'ОснованиеПриобретенияИИсточникСредств' <ls_build>-basf.
        set_it 'Страна' <ls_build>-land1.
        set_it 'Индекс' <ls_build>-indx.
        set_it 'Регион' <ls_build>-regio.
        set_it 'Район' <ls_build>-district.
        set_it 'Город' <ls_build>-name_city.
        set_it 'Улица' <ls_build>-name_street.
        set_it 'Дом' <ls_build>-name_house.
        set_it 'Квартира' <ls_build>-posta.
        set_it 'Корпус' <ls_build>-name_bldng1.
        set_it 'Строение' <ls_build>-name_bldng2.
        set_it 'ДополнительнаяИнформация' <ls_build>-addinfo.
      ENDLOOP.
      IF <ls_build>-area IS NOT INITIAL. " Округлим площадь до десятых, как в PDF
        <ls_build>-area = round( val = <ls_build>-area  dec = 1 ).
        SHIFT <ls_build>-area LEFT DELETING LEADING space.
      ENDIF.
      LOOP AT lt_nodes_source ASSIGNING <lo_node>.
        lo_child_second = <lo_node>->get_first_child( ).
        WHILE NOT lo_child_second IS INITIAL.
          INSERT lo_child_second INTO TABLE lt_nodes_source.
          lo_child_second = lo_child_second->get_next( ).
        ENDWHILE.
        lv_n = <lo_node>->get_name( ).
        lv_v = <lo_node>->get_value( ).
        set_it_long 'Имя' <ls_build>-share_other.
        set_it_long 'ДатаРождения' <ls_build>-share_other.
        set_it_long 'Наименование' <ls_build>-share_other.
        set_it_long 'Регион' <ls_build>-share_other.
        set_it_long 'Район' <ls_build>-share_other.
        set_it_long 'Город' <ls_build>-share_other.
        set_it_long 'Улица' <ls_build>-share_other.
        set_it_long 'Дом' <ls_build>-share_other.
        set_it_long 'Корпус' <ls_build>-share_other.
        set_it_long 'Строение' <ls_build>-share_other.
        set_it_long 'Строение' <ls_build>-share_other.
        set_it_long 'Квартира' <ls_build>-share_other.
        set_it_long 'ДополнительнаяИнформация' <ls_build>-share_other.
      ENDLOOP.
      lo_child = lo_child->get_next( ).
    ENDWHILE.
    DELETE <ls_ref>-build WHERE table_line IS INITIAL.
    SORT <ls_ref>-build.
    DELETE ADJACENT DUPLICATES FROM <ls_ref>-build.
    DELETE <ls_ref>-build WHERE protype IS INITIAL.
  ENDMETHOD.


  METHOD _parse_expense.
    DEFINE set_it.
      IF lv_n = &1.
        &2 = lv_v.
      ENDIF.
    END-OF-DEFINITION.
    DEFINE set_exists.
      IF lv_n = &1.
        IF &2 IS INITIAL.
          &2 = lv_v.
        ELSE.
          &2 = |{ &2 }, { lv_v }|.
        ENDIF.
      ENDIF.
    END-OF-DEFINITION.
    ASSIGN gt_ref[ base-passport = gv_current_ref_id ] TO FIELD-SYMBOL(<ls_ref>).
    DATA(lo_child) = io_node->get_first_child( ).
    WHILE NOT lo_child IS INITIAL.
      INSERT INITIAL LINE INTO TABLE <ls_ref>-expense ASSIGNING FIELD-SYMBOL(<ls_exp>).
      DATA(lt_nodes) = VALUE srt_wsdl_ixml_node_list( ).
      INSERT lo_child INTO TABLE lt_nodes.
      DATA(lt_nodes_source) = VALUE srt_wsdl_ixml_node_list( ).
      LOOP AT lt_nodes ASSIGNING FIELD-SYMBOL(<lo_node>).
        DATA(lo_child_second) = <lo_node>->get_first_child( ).
        WHILE NOT lo_child_second IS INITIAL.
          DATA(lv_c_name) = lo_child_second->get_name( ).
          IF lv_c_name <> 'ИсточникиСредств'.
            INSERT lo_child_second INTO TABLE lt_nodes.
          ELSE.
            INSERT lo_child_second INTO TABLE lt_nodes_source.
          ENDIF.
          lo_child_second = lo_child_second->get_next( ).
        ENDWHILE.
        DATA(lv_v) = <lo_node>->get_value( ).
        DATA(lv_n) = <lo_node>->get_name( ).
        set_it 'ОснованиеПриобретения' <ls_exp>-basac.
        set_it 'Наименование' <ls_exp>-exp_name.
        set_it 'СуммаСделки' <ls_exp>-tranam.
        set_exists 'ИсточникСредств' <ls_exp>-sfpwa.
*        set_it 'КС' <ls_exp>-ks.
        set_it 'ВидИмущества' <ls_exp>-exp_type.
        set_it 'НаименованиеНедвижимогоИмущества' <ls_exp>-landname.
        set_it 'ВидНедвижимогоИмущества' <ls_exp>-landtype.
        set_it 'МестонахождениеИмущества' <ls_exp>-adr_full.
        set_it 'Площадь' <ls_exp>-area.
        set_it 'НаименованиеИмущества' <ls_exp>-exp_name2.
        set_it 'ВидАктива' <ls_exp>-activ_type.
        set_it 'Пояснения' <ls_exp>-note.
        set_it 'ВидТранспортногоСредства' <ls_exp>-trntype.
        set_it 'МодельТранспортногоСредства' <ls_exp>-trnbrand.
        set_it 'МаркаТранспортногоСредства' <ls_exp>-trnmodel.
        set_it 'ГодВыпуска' <ls_exp>-yemanu.
        set_it 'МестоРегистрации' <ls_exp>-regplace.
        set_it 'ВидЦеннойБумаги' <ls_exp>-sectype.
        set_it 'ВидЦеннойБумаги' <ls_exp>-shtype.
        set_it 'НоминальнаяВеличинаОбязательства' <ls_exp>-fvaliab.
        set_it 'ОбщееКоличество' <ls_exp>-total.
        set_it 'Эмитент' <ls_exp>-issuer.
        set_it 'Страна' <ls_exp>-land1.
        set_it 'Индекс' <ls_exp>-indx.
        set_it 'Регион' <ls_exp>-regio.
        set_it 'Город' <ls_exp>-name_city.
        set_it 'Улица' <ls_exp>-name_street.
        set_it 'Дом' <ls_exp>-name_house.
        set_it 'Квартира' <ls_exp>-posta.
      ENDLOOP.
      LOOP AT lt_nodes_source ASSIGNING <lo_node>.
        DATA(lv_tabix) = sy-tabix.
        lo_child_second = <lo_node>->get_first_child( ).
        WHILE NOT lo_child_second IS INITIAL.
          lv_tabix = lv_tabix + 1.
          INSERT lo_child_second INTO lt_nodes_source INDEX lv_tabix.
          lo_child_second = lo_child_second->get_next( ).
        ENDWHILE.
      ENDLOOP.
      LOOP AT lt_nodes_source ASSIGNING <lo_node>.
        lv_n = <lo_node>->get_name( ).
        lv_v = <lo_node>->get_value( ).
        IF lv_n = 'ИсточникСредств'.
          INSERT INITIAL LINE INTO TABLE <ls_exp>-source_t ASSIGNING FIELD-SYMBOL(<ls_source_t>).
        ENDIF.
        CHECK <ls_source_t> IS ASSIGNED.
        set_it 'ВидДохода' <ls_source_t>-protype.
        set_it 'КатегорияДохода' <ls_source_t>-sofund.
        set_it 'СведениеОДоходе' <ls_source_t>-sofund.
        IF <ls_source_t>-sofund IS INITIAL.
          set_it 'Источник' <ls_source_t>-sofund.
        ENDIF.
        set_it 'СуммаСредств' <ls_source_t>-wrbtr.
      ENDLOOP.
      lo_child = lo_child->get_next( ).
    ENDWHILE.
    DELETE <ls_ref>-expense WHERE table_line IS INITIAL.
    SORT <ls_ref>-expense.
    DELETE ADJACENT DUPLICATES FROM <ls_ref>-expense.
    LOOP AT <ls_ref>-expense ASSIGNING <ls_exp>.
      DELETE <ls_exp>-source_t WHERE table_line IS INITIAL.
      SORT <ls_exp>-source_t.
      DELETE ADJACENT DUPLICATES FROM <ls_exp>-source_t.
      IF <ls_exp>-sfpwa IS INITIAL AND <ls_exp>-source_t IS NOT INITIAL.
        LOOP AT <ls_exp>-source_t ASSIGNING FIELD-SYMBOL(<ls_src>).
          <ls_exp>-sfpwa = |{ <ls_exp>-sfpwa }, { <ls_src>-sofund }|.
        ENDLOOP.
        SHIFT <ls_exp>-sfpwa LEFT DELETING LEADING ', '.
      ENDIF.
    ENDLOOP.
  ENDMETHOD.


  METHOD _parse_gift.
    DEFINE set_it.
      IF lv_n = &1.
        &2 = lv_v.
      ENDIF.
    END-OF-DEFINITION.
    ASSIGN gt_ref[ base-passport = gv_current_ref_id ] TO FIELD-SYMBOL(<ls_ref>).
    DATA(lo_child) = io_node->get_first_child( ).
    WHILE NOT lo_child IS INITIAL.
      INSERT INITIAL LINE INTO TABLE <ls_ref>-gift ASSIGNING FIELD-SYMBOL(<ls_exp>).
      DATA(lt_nodes) = VALUE srt_wsdl_ixml_node_list( ).
      INSERT lo_child INTO TABLE lt_nodes.
      LOOP AT lt_nodes ASSIGNING FIELD-SYMBOL(<lo_node>).
        DATA(lo_child_second) = <lo_node>->get_first_child( ).
        WHILE NOT lo_child_second IS INITIAL.
          INSERT lo_child_second INTO TABLE lt_nodes.
          lo_child_second = lo_child_second->get_next( ).
        ENDWHILE.
        DATA(lv_v) = <lo_node>->get_value( ).
        DATA(lv_n) = <lo_node>->get_name( ).
        set_it 'ОснованиеОтчуждения' <ls_exp>-basap.
        set_it 'Приобретатель' <ls_exp>-acquirer.
        set_it 'Наименование' <ls_exp>-name1.
        set_it 'ВидИмущества' <ls_exp>-gift_type.
        set_it 'НаименованиеНедвижимогоИмущества' <ls_exp>-landname.
        set_it 'ВидНедвижимогоИмущества' <ls_exp>-landtype.
        set_it 'МестонахождениеИмущества' <ls_exp>-adr_full.
        set_it 'Площадь' <ls_exp>-area.
*        set_it 'ВидАктива' <ls_exp>-activ_type.
        set_it 'Пояснения' <ls_exp>-note.
        set_it 'ВидТранспортногоСредства' <ls_exp>-trntype.
        set_it 'МодельТранспортногоСредства' <ls_exp>-trnbrand.
        set_it 'МаркаТранспортногоСредства' <ls_exp>-trnmodel.
        set_it 'ГодВыпуска' <ls_exp>-yemanu.
        set_it 'МестоРегистрации' <ls_exp>-regplace.
        set_it 'ВидЦеннойБумаги' <ls_exp>-sectype.
        set_it 'ВидЦеннойБумаги' <ls_exp>-shtype.
        set_it 'НоминальнаяВеличинаОбязательства' <ls_exp>-fvaliab.
        set_it 'ОбщееКоличество' <ls_exp>-total.
        set_it 'Эмитент' <ls_exp>-issuer.
        set_it 'Страна' <ls_exp>-land1.
        set_it 'Индекс' <ls_exp>-indx.
        set_it 'Регион' <ls_exp>-regio.
        set_it 'Город' <ls_exp>-name_city.
        set_it 'Улица' <ls_exp>-name_street.
        set_it 'Дом' <ls_exp>-name_house.
        set_it 'Квартира' <ls_exp>-posta.
      ENDLOOP.
      lo_child = lo_child->get_next( ).
    ENDWHILE.
    DELETE <ls_ref>-gift WHERE table_line IS INITIAL.
    SORT <ls_ref>-gift.
    DELETE ADJACENT DUPLICATES FROM <ls_ref>-gift.
  ENDMETHOD.


  METHOD _parse_income.
    DEFINE set_it.
      IF lv_n = &1.
        &2 = lv_v.
      ENDIF.
    END-OF-DEFINITION.
    ASSIGN gt_ref[ base-passport = gv_current_ref_id ] TO FIELD-SYMBOL(<ls_ref>).
    DATA(lo_child) = io_node->get_first_child( ).
    WHILE NOT lo_child IS INITIAL.
      INSERT INITIAL LINE INTO TABLE <ls_ref>-income ASSIGNING FIELD-SYMBOL(<ls_income>).
      DATA(lt_nodes) = VALUE srt_wsdl_ixml_node_list( ).
      INSERT lo_child INTO TABLE lt_nodes.
      LOOP AT lt_nodes ASSIGNING FIELD-SYMBOL(<lo_node>).
        DATA(lo_child_second) = <lo_node>->get_first_child( ).
        WHILE NOT lo_child_second IS INITIAL.
          INSERT lo_child_second INTO TABLE lt_nodes.
          lo_child_second = lo_child_second->get_next( ).
        ENDWHILE.
        DATA(lv_v) = <lo_node>->get_value( ).
        DATA(lv_n) = <lo_node>->get_name( ).
        set_it 'ВеличинаДохода' <ls_income>-amount.
        set_it 'ВидДохода' <ls_income>-type.
        set_it 'ВидИногоДохода' <ls_income>-type_other.
        set_it 'КатегорияДохода' <ls_income>-category.
        set_it 'Пояснения' <ls_income>-reason.
*        set_it 'КС' <ls_income>-ks.
        set_it 'Площадь' <ls_income>-square.
        set_it 'СведениеОДоходе' <ls_income>-detail.
        set_it 'ВидСобственности' <ls_income>-property_type.
        set_it 'РазмерДоли' <ls_income>-property_share.
        set_it 'МодельТранспортногоСредства' <ls_income>-tr_model.
        set_it 'МаркаТранспортногоСредства' <ls_income>-tr_marka.
        set_it 'ГодВыпуска' <ls_income>-tr_year.
        set_it 'ВидТранспортногоСредства' <ls_income>-tr_type.
      ENDLOOP.
      lo_child = lo_child->get_next( ).
    ENDWHILE.
    DELETE <ls_ref>-income WHERE table_line IS INITIAL.
    SORT <ls_ref>-income.
    DELETE ADJACENT DUPLICATES FROM <ls_ref>-income.
  ENDMETHOD.


  METHOD _parse_obligatory.
    DEFINE set_it.
      IF lv_n = &1.
        &2 = lv_v.
      ENDIF.
    END-OF-DEFINITION.
    TYPES:
      BEGIN OF lts_obligatory,
        fio    TYPE string,
        dbirth TYPE string,
      END OF lts_obligatory.
    DATA ls_obligatory TYPE lts_obligatory.
    ASSIGN gt_ref[ base-passport = gv_current_ref_id ] TO FIELD-SYMBOL(<ls_ref>).
    DATA(lo_child) = io_node->get_first_child( ).
    WHILE NOT lo_child IS INITIAL.
      INSERT INITIAL LINE INTO TABLE <ls_ref>-obligation ASSIGNING FIELD-SYMBOL(<ls_build>).
      DATA(lt_nodes) = VALUE srt_wsdl_ixml_node_list( ).
      INSERT lo_child INTO TABLE lt_nodes.
      LOOP AT lt_nodes ASSIGNING FIELD-SYMBOL(<lo_node>).
        DATA(lo_child_second) = <lo_node>->get_first_child( ).
        WHILE NOT lo_child_second IS INITIAL.
          INSERT lo_child_second INTO TABLE lt_nodes.
          lo_child_second = lo_child_second->get_next( ).
        ENDWHILE.
        DATA(lv_v) = <lo_node>->get_value( ).
        DATA(lv_n) = <lo_node>->get_name( ).
        set_it 'ВидПользования' <ls_build>-usetype.
        set_it 'ВидНедвижимогоИмущества' <ls_build>-protype.
        set_it 'НаименованиеНедвижимогоИмущества' <ls_build>-name.
        set_it 'Начало' <ls_build>-begda.
        set_it 'Конец' <ls_build>-endda.
        set_it 'Площадь' <ls_build>-area.
*        set_it 'ВидАктива' <ls_build>-activ_type.
        set_it 'Пояснения' <ls_build>-note.
        set_it 'ОснованиеПользования' <ls_build>-basus.
        set_it 'Страна' <ls_build>-land1.
        set_it 'Индекс' <ls_build>-indx.
        set_it 'Регион' <ls_build>-regio.
        set_it 'Район' <ls_build>-district.
        set_it 'Город' <ls_build>-name_city.
        set_it 'Улица' <ls_build>-name_street.
        set_it 'Дом' <ls_build>-name_house.
        set_it 'Квартира' <ls_build>-posta.
        set_it 'Корпус' <ls_build>-name_bldng1.
        set_it 'Строение' <ls_build>-name_bldng2.
        set_it 'ДополнительнаяИнформация' <ls_build>-addinfo.

        set_it 'ФИО' ls_obligatory-fio.
        set_it 'ДатаРождения' ls_obligatory-dbirth.
      ENDLOOP.
      IF <ls_build> IS NOT INITIAL.
        IF <ls_build>-area IS NOT INITIAL. " Округлим площадь до десятых, как в PDF
          <ls_build>-area = round( val = <ls_build>-area  dec = 1 ).
          SHIFT <ls_build>-area LEFT DELETING LEADING space.
        ENDIF.
        IF ls_obligatory-fio IS NOT INITIAL.
          <ls_build>-basus = |{ <ls_build>-basus } { ls_obligatory-fio }|.
        ENDIF.
        IF ls_obligatory-dbirth IS NOT INITIAL. " В нашем примере данное поле заполняется по схеме ГГГГ-ММ-ДД
          <ls_build>-basus = |{ <ls_build>-basus } { ls_obligatory-dbirth+8(2) }.{ ls_obligatory-dbirth+5(2) }.{ ls_obligatory-dbirth+0(4) }|.
        ENDIF.
      ENDIF.
      lo_child = lo_child->get_next( ).
    ENDWHILE.
    DELETE <ls_ref>-obligation WHERE table_line IS INITIAL.
    SORT <ls_ref>-obligation.
    DELETE ADJACENT DUPLICATES FROM <ls_ref>-obligation.
  ENDMETHOD.


  METHOD _parse_other_stock.
    DEFINE set_it.
      IF lv_n = &1.
        &2 = lv_v.
      ENDIF.
    END-OF-DEFINITION.
    ASSIGN gt_ref[ base-passport = gv_current_ref_id ] TO FIELD-SYMBOL(<ls_ref>).
    DATA(lo_child) = io_node->get_first_child( ).
    WHILE NOT lo_child IS INITIAL.
      INSERT INITIAL LINE INTO TABLE <ls_ref>-valueable ASSIGNING FIELD-SYMBOL(<ls_value>).
      DATA(lt_nodes) = VALUE srt_wsdl_ixml_node_list( ).
      INSERT lo_child INTO TABLE lt_nodes.
      LOOP AT lt_nodes ASSIGNING FIELD-SYMBOL(<lo_node>).
        DATA(lo_child_second) = <lo_node>->get_first_child( ).
        WHILE NOT lo_child_second IS INITIAL.
          INSERT lo_child_second INTO TABLE lt_nodes.
          lo_child_second = lo_child_second->get_next( ).
        ENDWHILE.
        DATA(lv_v) = <lo_node>->get_value( ).
        DATA(lv_n) = <lo_node>->get_name( ).
        set_it 'ВидЦеннойБумаги' <ls_value>-sectype.
        set_it 'НоминальнаяВеличинаОбязательства' <ls_value>-fvaliab.
        set_it 'Эмитент' <ls_value>-issuer.
        set_it 'ОбщееКоличество' <ls_value>-total.
        set_it 'ОбщаяСтоимость' <ls_value>-totcost.
        set_it 'ВидАктива' <ls_value>-activ_type.
      ENDLOOP.
      lo_child = lo_child->get_next( ).
    ENDWHILE.
    DELETE <ls_ref>-valueable WHERE table_line IS INITIAL.
    SORT <ls_ref>-valueable.
    DELETE ADJACENT DUPLICATES FROM <ls_ref>-valueable.
  ENDMETHOD.


  METHOD _parse_passport.
    ASSIGN gt_ref[ base-passport = gv_current_ref_id ] TO FIELD-SYMBOL(<ls_ref>).
    DATA(lo_pass) = io_node->get_first_child( ).
    CHECK lo_pass IS BOUND.
    IF <ls_ref>-personal-nachn IS INITIAL.
      ASSIGN <ls_ref>-personal TO FIELD-SYMBOL(<ls_personal>).
    ELSE.
      ASSIGN <ls_ref>-applicant TO <ls_personal>.
    ENDIF.
    DATA(lo_child) = lo_pass->get_first_child( ).
    WHILE NOT lo_child IS INITIAL.
      DATA(lv_v) = lo_child->get_value( ).
      CASE lo_child->get_name( ).
        WHEN 'Тип'.
          <ls_personal>-doc_type = lv_v.
        WHEN 'ОрганВыдавшийДокумент'.
          <ls_personal>-issuer = lv_v.
        WHEN 'Серия'.
          <ls_personal>-seria = lv_v.
        WHEN 'Номер'.
          <ls_personal>-number = lv_v.
        WHEN 'Фамилия'.
          <ls_personal>-nachn = lv_v.
        WHEN 'Имя'.
          <ls_personal>-vorna = lv_v.
        WHEN 'Отчество'.
          <ls_personal>-midnm = lv_v.
        WHEN 'ОтчествоОтсутствует'.
          <ls_personal>-nomidnm = lv_v.
        WHEN 'ДатаВыдачи'.
          <ls_personal>-date_of_issue = lv_v.
        WHEN 'ДатаРождения'.
          <ls_personal>-date_of_birth = lv_v.
        WHEN 'Пол'.
          <ls_personal>-sex = lv_v.
      ENDCASE.
      lo_child = lo_child->get_next( ).
    ENDWHILE.
  ENDMETHOD.


  METHOD _parse_personal.
    DEFINE set_it.
      IF lv_n = &1.
        &2 = lv_v.
      ENDIF.
    END-OF-DEFINITION.
    ASSIGN gt_ref[ base-passport = gv_current_ref_id ] TO FIELD-SYMBOL(<ls_ref>).
    CHECK <ls_ref>-personal-job_plans IS INITIAL.
    DATA(lt_nodes) = VALUE srt_wsdl_ixml_node_list( ).
    INSERT io_node INTO TABLE lt_nodes.
    LOOP AT lt_nodes ASSIGNING FIELD-SYMBOL(<lo_node>).
      DATA(lo_child) = <lo_node>->get_first_child( ).
      WHILE NOT lo_child IS INITIAL.
        INSERT lo_child INTO TABLE lt_nodes.
        lo_child = lo_child->get_next( ).
      ENDWHILE.
    ENDLOOP.
    LOOP AT lt_nodes INTO lo_child.
      DATA(lv_v) = lo_child->get_value( ).
      DATA(lv_n) = lo_child->get_name( ).
      set_it 'СНИЛС' <ls_ref>-personal-snils.
      IF <ls_ref>-personal-job_plans IS INITIAL.
        set_it 'Должность' <ls_ref>-personal-job_plans.
      ENDIF.
      IF <ls_ref>-personal-job_plans IS INITIAL.
        set_it 'РодЗанятий' <ls_ref>-personal-job_plans.
      ENDIF.
      set_it 'ДолжностьПретендуемая' <ls_ref>-personal-job_candidate.
      set_it 'Имеется' <ls_ref>-personal-job_has.
      set_it 'НазваниеОрганизации' <ls_ref>-personal-job_orgeh.
    ENDLOOP.
  ENDMETHOD.


METHOD _parse_prefix.
  TYPES: BEGIN OF ts_prefix,
           passport            TYPE pstring,
           isspecific          TYPE pstring,
           otherdocnumber      TYPE pstring,
           pages               TYPE pstring,
           pagesinsection      TYPE pstring,
           pagenumberinsection TYPE pstring,
           time                TYPE pstring,
         END OF ts_prefix.
  DATA: ls_prefix TYPE ts_prefix.
  DATA(lo_xml) = cl_ixml=>create( ).
  DATA(lo_stream_factory) = lo_xml->create_stream_factory( ).
  DATA(lo_stream) = lo_stream_factory->create_istream_string( string = iv_prefix ).
  DATA(lo_doc) = lo_xml->create_document( ).
  DATA(lo_parser) = lo_xml->create_parser(
    stream_factory = lo_stream_factory
    istream        = lo_stream
    document       = lo_doc
  ).
  lo_parser->parse( ).
  DATA(lo_element) = lo_doc->get_root_element( ).
  DATA(lo_child) = lo_element->get_first_child( ).
  WHILE NOT lo_child IS INITIAL.
    DATA(lv_name) = lo_child->get_name( ).
    DATA(lv_val) = lo_child->get_value( ).
    lv_name = |{ lv_name CASE = UPPER }|.
    ASSIGN COMPONENT lv_name OF STRUCTURE ls_prefix TO FIELD-SYMBOL(<ls_fld>).
    CHECK sy-subrc = 0.
    <ls_fld> = lv_val.
    lo_child = lo_child->get_next( ).
  ENDWHILE.
  ASSIGN gt_ref[ base-passport = ls_prefix-passport ] TO FIELD-SYMBOL(<ls_pass>).
  IF sy-subrc <> 0.
    INSERT INITIAL LINE INTO TABLE gt_ref ASSIGNING <ls_pass>.
  ENDIF.
  <ls_pass>-base-passport = ls_prefix-passport.
  <ls_pass>-base-isspecific = ls_prefix-isspecific.
  <ls_pass>-base-otherdocnumber = ls_prefix-otherdocnumber.
  <ls_pass>-base-pages = ls_prefix-pages.
  <ls_pass>-base-pagesinsection = ls_prefix-pagesinsection.
  <ls_pass>-base-pagenumberinsection = ls_prefix-pagenumberinsection.
  <ls_pass>-base-time = ls_prefix-time.
  rv_ref_id = ls_prefix-passport.
ENDMETHOD.


  METHOD _parse_stock.
    DEFINE set_it.
      IF lv_n = &1.
        &2 = lv_v.
      ENDIF.
    END-OF-DEFINITION.
    ASSIGN gt_ref[ base-passport = gv_current_ref_id ] TO FIELD-SYMBOL(<ls_ref>).
    DATA(lo_child) = io_node->get_first_child( ).
    WHILE NOT lo_child IS INITIAL.
      INSERT INITIAL LINE INTO TABLE <ls_ref>-securities ASSIGNING FIELD-SYMBOL(<ls_value>).
      DATA(lt_nodes) = VALUE srt_wsdl_ixml_node_list( ).
      INSERT lo_child INTO TABLE lt_nodes.
      LOOP AT lt_nodes ASSIGNING FIELD-SYMBOL(<lo_node>).
        DATA(lo_child_second) = <lo_node>->get_first_child( ).
        WHILE NOT lo_child_second IS INITIAL.
          INSERT lo_child_second INTO TABLE lt_nodes.
          lo_child_second = lo_child_second->get_next( ).
        ENDWHILE.
        DATA(lv_v) = <lo_node>->get_value( ).
        DATA(lv_n) = <lo_node>->get_name( ).
        set_it 'ВидАкции' <ls_value>-shtype.
        set_it 'КоличествоАкций' <ls_value>-shnum.
        set_it 'НоминальнаяСтоимостьАкции' <ls_value>-valsh.
        set_it 'ОбщаяСтоимость' <ls_value>-total.
        set_it 'ОснованиеУчастия' <ls_value>-baspart.
        set_it 'Имя' <ls_value>-name1.
        set_it 'Наименование' <ls_value>-name1.
*        set_it 'ВидАктива' <ls_value>-.
        set_it 'УставнойКапитал' <ls_value>-autcap.
        set_it 'ОрганизационноПравоваяФорма' <ls_value>-orglform.
        set_it 'Страна' <ls_value>-land1.
        set_it 'Индекс' <ls_value>-indx.
        set_it 'Регион' <ls_value>-regio.
        set_it 'Город' <ls_value>-name_city.
        set_it 'Улица' <ls_value>-name_street.
        set_it 'Дом' <ls_value>-name_house.
        set_it 'Квартира' <ls_value>-posta.
      ENDLOOP.
      lo_child = lo_child->get_next( ).
    ENDWHILE.
    DELETE <ls_ref>-securities WHERE table_line IS INITIAL.
    SORT <ls_ref>-securities.
    DELETE ADJACENT DUPLICATES FROM <ls_ref>-securities.
  ENDMETHOD.


METHOD _parse_tesseract.
  CONSTANTS: BEGIN OF ls_block,
               build     TYPE pstring VALUE 'Земельные участки:',
               other     TYPE pstring VALUE 'Иное недвижимое имущество:',
               transport TYPE pstring VALUE 'Транспортные средства:',
               paper     TYPE pstring VALUE 'Ценные бумаги:',
             END OF ls_block.
  TYPES: BEGIN OF ts_deal,
           num      TYPE pstring,
           gift_num TYPE pstring,
           type     TYPE pstring,
           dummy    TYPE pstring,
           acquirer TYPE pstring,
           base     TYPE pstring,
         END OF ts_deal.
  TYPES: BEGIN OF ts_content,
           content TYPE pstring,
           h       TYPE i,
         END OF ts_content.
  DATA: lt_tabs TYPE TABLE OF i,
        lt_ov   TYPE TABLE OF ts_content,
        lt_deal TYPE TABLE OF ts_deal.
  FIELD-SYMBOLS: <ls_deal> TYPE ts_deal.
* Fix last page error (Gifts)
  DATA(lt_block_const) = VALUE string_t(
    ( ls_block-build )
    ( ls_block-other )
    ( ls_block-transport )
    ( ls_block-paper )
  ).
  SPLIT iv_body AT '<Page' INTO TABLE DATA(lt_pages).
  IF lines( lt_pages ) > 1.
    DELETE lt_pages INDEX 1.
  ENDIF.
  LOOP AT lt_pages ASSIGNING FIELD-SYMBOL(<ls_page>).
    <ls_page> = |<Page{ <ls_page> }|.
    CHECK <ls_page> CP '*отчужденных*в*результате*безвозмездной*сделки*'.
    CHECK <ls_page> NP '*(продолжение)*'.
    DATA(lv_page) = <ls_page>.
    SPLIT lv_page AT '"|' INTO TABLE DATA(lt_split).
    LOOP AT lt_split ASSIGNING FIELD-SYMBOL(<lv_split>).
      FIND ALL OCCURRENCES OF REGEX 'HPOS="(\d+)"' IN <lv_split> SUBMATCHES DATA(lv_res).
      DATA(lv_i) = CONV i( lv_res ).
      LOOP AT lt_tabs ASSIGNING FIELD-SYMBOL(<lv_tabs>) WHERE table_line BETWEEN lv_i - 10 AND lv_i + 10.
        EXIT.
      ENDLOOP.
      IF sy-subrc <> 0.
        APPEND lv_res TO lt_tabs.
      ENDIF.
    ENDLOOP.
    SORT lt_tabs.
    DATA(lt_content) = VALUE match_result_tab( ).
    FIND ALL OCCURRENCES OF REGEX 'CONTENT="([^"]*)' IN lv_page RESULTS lt_content.
    CLEAR lt_ov.
    LOOP AT lt_content ASSIGNING FIELD-SYMBOL(<ls_content>).
      LOOP AT <ls_content>-submatches ASSIGNING FIELD-SYMBOL(<ls_subs>).
        FIND ALL OCCURRENCES OF REGEX 'HPOS="(\d+)"' IN lv_page(<ls_subs>-offset) SUBMATCHES DATA(lv_h).
        INSERT VALUE #(
          content = lv_page+<ls_subs>-offset(<ls_subs>-length)
          h = lv_h
        ) INTO TABLE lt_ov.
      ENDLOOP.
    ENDLOOP.
    DATA(lv_all_ov) = VALUE pstring( ).
    LOOP AT lt_ov ASSIGNING FIELD-SYMBOL(<ls_ov>).
      lv_all_ov = |{ lv_all_ov } { <ls_ov>-content }|.
    ENDLOOP.
    DATA(lt_block) = VALUE string_t( ( lv_all_ov ) ).
    LOOP AT lt_block_const ASSIGNING FIELD-SYMBOL(<ls_const>).
      LOOP AT lt_block ASSIGNING FIELD-SYMBOL(<lv_to_split>).
        SPLIT <lv_to_split> AT <ls_const> INTO TABLE DATA(lt_splitted).
        <lv_to_split> = lt_splitted[ 1 ].
        DELETE lt_splitted INDEX 1.
        IF lines( lt_splitted ) >= 1.
          DATA(lv_to_all) = lt_splitted[ 1 ].
          lv_to_all = |{ <ls_const> }{ lv_to_all }|.
          INSERT lv_to_all INTO TABLE lt_block.
          EXIT.
        ENDIF.
      ENDLOOP.
    ENDLOOP.
    LOOP AT lt_block_const ASSIGNING <ls_const>.
      UNASSIGN <ls_deal>.
      LOOP AT lt_block ASSIGNING FIELD-SYMBOL(<lv_block>) WHERE table_line CP |{ <ls_const> }*|.
        FIND FIRST OCCURRENCE OF REGEX '(\d)\)' IN <lv_block> SUBMATCHES DATA(lv_gift_submatch).
        CHECK sy-subrc = 0.
        DATA(lv_tabix) = VALUE i( ).
        DATA(lv_column) = VALUE i( ).
        LOOP AT lt_ov ASSIGNING <ls_ov>.
          IF <ls_ov>-content CS 'Указываются'.
            EXIT.
          ENDIF.
          TRANSLATE <ls_ov>-content USING '| '.
          <ls_ov>-content = condense( <ls_ov>-content ).
          lv_tabix = lv_tabix + 1.
          FIND FIRST OCCURRENCE OF REGEX '(\d)\)' IN <ls_ov>-content SUBMATCHES lv_gift_submatch RESULTS DATA(ls_res).
          IF sy-subrc = 0 AND ls_res-offset = 0.
            IF <ls_deal> IS ASSIGNED AND <ls_deal>-gift_num < lv_gift_submatch.
              INSERT VALUE #( num = <ls_const> gift_num = lv_gift_submatch ) INTO TABLE lt_deal ASSIGNING <ls_deal>.
            ELSE.
              IF <ls_deal> IS ASSIGNED AND lv_tabix > 1..
                EXIT.
              ELSE.
                INSERT VALUE #( num = <ls_const> gift_num = lv_gift_submatch ) INTO TABLE lt_deal ASSIGNING <ls_deal>.
              ENDIF.
            ENDIF.
          ENDIF.
          IF <ls_deal> IS ASSIGNED.
            LOOP AT lt_tabs ASSIGNING FIELD-SYMBOL(<ls_tab>) WHERE table_line >= <ls_ov>-h.
              lv_column = sy-tabix.
              EXIT.
            ENDLOOP.
            CHECK lv_column >= 3.
            ASSIGN COMPONENT lv_column OF STRUCTURE <ls_deal> TO FIELD-SYMBOL(<lv_to>).
            IF sy-subrc = 0.
              IF <ls_ov>-content IS NOT INITIAL.
                <lv_to> = |{ <lv_to> } { <ls_ov>-content }|.
                <lv_to> = condense( <lv_to> ).
              ENDIF.
            ENDIF.
          ENDIF.
          DELETE lt_ov.
        ENDLOOP.
      ENDLOOP.
    ENDLOOP.
  ENDLOOP.
* check if already exists last deal
  CHECK lt_deal IS NOT INITIAL.
  ASSIGN lt_deal[ lines( lt_deal ) ] TO <ls_deal>.
  CHECK sy-subrc = 0.
  ASSIGN gt_ref[ base-passport = gv_current_ref_id ] TO FIELD-SYMBOL(<ls_ref>).
  CHECK lines( lt_deal ) > lines( <ls_ref>-gift ).
  DATA(lv_block) = <ls_deal>-num.
  TRANSLATE lv_block USING ': '.
  IF strlen( <ls_deal>-type ) > 2 AND <ls_deal>-type+1(1) = ')'.
    <ls_deal>-type = condense( <ls_deal>-type+2 ).
  ENDIF.
  IF <ls_deal>-dummy IS NOT INITIAL.
    <ls_deal>-base = <ls_deal>-acquirer.
    <ls_deal>-acquirer = <ls_deal>-dummy.
    CLEAR <ls_deal>-dummy.
  ENDIF.
  REPLACE 'Легковой автомобиль' IN <ls_deal>-type WITH 'ЛегковойАвтомобиль'.
  SPLIT <ls_deal>-type AT space INTO DATA(lv_gtype) DATA(lv_note).
  TRANSLATE lv_gtype USING ': '.
  CHECK NOT
    (
      line_exists( <ls_ref>-gift[ landtype = lv_gtype acquirer = <ls_deal>-acquirer basap = <ls_deal>-base note = lv_note ] ) OR
      line_exists( <ls_ref>-gift[ trntype = lv_gtype acquirer = <ls_deal>-acquirer basap = <ls_deal>-base note = lv_note ] )
    ).
  IF <ls_deal>-base IS NOT INITIAL.
    INSERT VALUE #(
      acquirer = <ls_deal>-acquirer
      basap = <ls_deal>-base
      gift_type = condense( lv_block )
      note = lv_note
      landname = COND #( WHEN <ls_deal>-num <> ls_block-transport THEN lv_gtype )
      landtype = COND #( WHEN <ls_deal>-num <> ls_block-transport THEN lv_gtype )
      trntype = COND #( WHEN <ls_deal>-num = ls_block-transport THEN lv_gtype )
    ) INTO TABLE <ls_ref>-gift.
  ENDIF.
ENDMETHOD.


  METHOD _parse_transport.
    DEFINE set_it.
      IF lv_n = &1.
        &2 = lv_v.
      ENDIF.
    END-OF-DEFINITION.
    ASSIGN gt_ref[ base-passport = gv_current_ref_id ] TO FIELD-SYMBOL(<ls_ref>).
    DATA(lo_child) = io_node->get_first_child( ).
    WHILE NOT lo_child IS INITIAL.
      INSERT INITIAL LINE INTO TABLE <ls_ref>-transport ASSIGNING FIELD-SYMBOL(<ls_transport>).
      DATA(lt_nodes) = VALUE srt_wsdl_ixml_node_list( ).
      INSERT lo_child INTO TABLE lt_nodes.
      DATA(lt_nodes_source) = VALUE srt_wsdl_ixml_node_list( ).
      LOOP AT lt_nodes ASSIGNING FIELD-SYMBOL(<lo_node>).
        DATA(lo_child_second) = <lo_node>->get_first_child( ).
        WHILE NOT lo_child_second IS INITIAL.
          DATA(lv_c_name) = lo_child_second->get_name( ).
          IF lv_c_name <> 'ИныеЛица'.
            INSERT lo_child_second INTO TABLE lt_nodes.
          ELSE.
            INSERT lo_child_second INTO TABLE lt_nodes_source.
          ENDIF.
          lo_child_second = lo_child_second->get_next( ).
        ENDWHILE.
        DATA(lv_v) = <lo_node>->get_value( ).
        DATA(lv_n) = <lo_node>->get_name( ).
        set_it 'ВидТранспортногоСредства' <ls_transport>-trntype.
        set_it 'ВидСобственности' <ls_transport>-protype.
        set_it 'РазмерДоли' <ls_transport>-share2.
        set_it 'МодельТранспортногоСредства' <ls_transport>-trnmodel.
        set_it 'МаркаТранспортногоСредства' <ls_transport>-trnbrand.
        set_it 'ГодВыпуска' <ls_transport>-yemanu.
        set_it 'ВидИмущества' <ls_transport>-estate.
        set_it 'МестоРегистрации' <ls_transport>-regplace.
        set_it 'ВидАктива' <ls_transport>-activ_type.
      ENDLOOP.
      LOOP AT lt_nodes_source ASSIGNING <lo_node>.
        lo_child_second = <lo_node>->get_first_child( ).
        WHILE NOT lo_child_second IS INITIAL.
          INSERT lo_child_second INTO TABLE lt_nodes_source.
          lo_child_second = lo_child_second->get_next( ).
        ENDWHILE.
        lv_n = <lo_node>->get_name( ).
        lv_v = <lo_node>->get_value( ).
        set_it_long 'Имя' <ls_transport>-share_other.
        set_it_long 'ДатаРождения' <ls_transport>-share_other.
        set_it_long 'Наименование' <ls_transport>-share_other.
        set_it_long 'Регион' <ls_transport>-share_other.
        set_it_long 'Район' <ls_transport>-share_other.
        set_it_long 'Город' <ls_transport>-share_other.
        set_it_long 'Улица' <ls_transport>-share_other.
        set_it_long 'Дом' <ls_transport>-share_other.
        set_it_long 'Корпус' <ls_transport>-share_other.
        set_it_long 'Строение' <ls_transport>-share_other.
        set_it_long 'Строение' <ls_transport>-share_other.
        set_it_long 'Квартира' <ls_transport>-share_other.
        set_it_long 'ДополнительнаяИнформация' <ls_transport>-share_other.
      ENDLOOP.
      lo_child = lo_child->get_next( ).
    ENDWHILE.
    DELETE <ls_ref>-transport WHERE table_line IS INITIAL.
    SORT <ls_ref>-transport.
    DELETE ADJACENT DUPLICATES FROM <ls_ref>-transport.
  ENDMETHOD.


  METHOD _parse_urgent.
    DEFINE set_it.
      IF lv_n = &1.
        &2 = lv_v.
      ENDIF.
    END-OF-DEFINITION.
    TYPES:
      BEGIN OF lts_reftransport,
        kord    TYPE string,
        yrface  TYPE string,
        indx    TYPE string,
        city    TYPE string,
        strit   TYPE string,
        hause   TYPE string,
        addinfo TYPE string,
        inn     TYPE string,
        ogrn    TYPE string,
      END OF lts_reftransport.
    ASSIGN gt_ref[ base-passport = gv_current_ref_id ] TO FIELD-SYMBOL(<ls_ref>).
    DATA(lo_child) = io_node->get_first_child( ).
    DATA ls_reftran TYPE lts_reftransport.
    WHILE NOT lo_child IS INITIAL.
      INSERT INITIAL LINE INTO TABLE <ls_ref>-urgent ASSIGNING FIELD-SYMBOL(<ls_value>).
      DATA(lt_nodes) = VALUE srt_wsdl_ixml_node_list( ).
      INSERT lo_child INTO TABLE lt_nodes.
      LOOP AT lt_nodes ASSIGNING FIELD-SYMBOL(<lo_node>).
        DATA(lo_child_second) = <lo_node>->get_first_child( ).
        WHILE NOT lo_child_second IS INITIAL.
          INSERT lo_child_second INTO TABLE lt_nodes.
          lo_child_second = lo_child_second->get_next( ).
        ENDWHILE.
        DATA(lv_v) = <lo_node>->get_value( ).
        DATA(lv_n) = <lo_node>->get_name( ).
        set_it 'КредиторИлиДолжник' <ls_value>-is_creditor.
        set_it 'СодержаниеОбязательства' <ls_value>-content.
        set_it 'ВидОбязательства' <ls_value>-obltype.
        set_it 'ПоясненияОбязательства' <ls_value>-commobl.
        set_it 'ВтораяСторонаОбязательства' <ls_value>-spobl.
        set_it 'ОснованиеВозникновения' <ls_value>-basocc.
        set_it 'СуммаОбязательства' <ls_value>-prinam.
        set_it 'РазмерОбязательства' <ls_value>-alrptd.
        set_it 'УсловиеОбязательства' <ls_value>-oblcond.

        set_it 'КредиторИлиДолжник' ls_reftran-kord.
        set_it 'ЮрЛицо' ls_reftran-yrface.
        set_it 'Индекс' ls_reftran-indx.
        set_it 'Город' ls_reftran-city.
        set_it 'Улица' ls_reftran-strit.
        set_it 'Дом' ls_reftran-hause.
        set_it 'ДополнительнаяИнформация' ls_reftran-addinfo.
        set_it 'ИНН' ls_reftran-inn.
        set_it 'ОГРН' ls_reftran-ogrn.
*        set_it 'КС' <ls_value>-ks.
      ENDLOOP.
      IF <ls_value> IS NOT INITIAL.
        IF <ls_value>-spobl IS INITIAL OR <ls_value>-spobl = ls_reftran-kord.
          <ls_value>-spobl = |{ ls_reftran-kord }: { ls_reftran-yrface },|.
          IF ls_reftran-inn IS NOT INITIAL.
            <ls_value>-spobl = |{ <ls_value>-spobl } ИНН: { ls_reftran-inn },|.
          ENDIF.
          IF ls_reftran-ogrn IS NOT INITIAL.
            <ls_value>-spobl = |{ <ls_value>-spobl } ОГРН: { ls_reftran-ogrn },|.
          ENDIF.
          <ls_value>-spobl = |{ <ls_value>-spobl } адрес: { ls_reftran-indx }, { ls_reftran-strit }|.
          IF ls_reftran-hause IS NOT INITIAL.
            <ls_value>-spobl = |{ <ls_value>-spobl }, д. { ls_reftran-hause }|.
          ENDIF.
          IF ls_reftran-addinfo IS NOT INITIAL.
            <ls_value>-spobl = |{ <ls_value>-spobl }, { ls_reftran-addinfo }|.
          ENDIF.
        ENDIF.
      ENDIF.
      lo_child = lo_child->get_next( ).
    ENDWHILE.
    DELETE <ls_ref>-urgent WHERE table_line IS INITIAL.
    SORT <ls_ref>-urgent.
    DELETE ADJACENT DUPLICATES FROM <ls_ref>-urgent.
  ENDMETHOD.


METHOD _prepare_body.
  CONSTANTS: lc_attr_reg TYPE pstring VALUE '<Атрибут Имя="(\w*)"[^>]*>'.
  rv_body = iv_body.
  DO.
    DATA(lv_total_offset) = VALUE int4( ).
    DO.
      FIND FIRST OCCURRENCE OF REGEX lc_attr_reg IN rv_body+lv_total_offset SUBMATCHES DATA(lv_attribute) MATCH OFFSET DATA(lv_off_attr).
      IF sy-subrc <> 0.
        EXIT.
      ENDIF.
      lv_off_attr = lv_total_offset = lv_total_offset + lv_off_attr.
      lv_total_offset = lv_total_offset + 1.
      FIND FIRST OCCURRENCE OF '</Атрибут>' IN rv_body+lv_total_offset MATCH OFFSET DATA(lv_off_close).
      FIND FIRST OCCURRENCE OF REGEX lc_attr_reg IN rv_body+lv_total_offset MATCH OFFSET DATA(lv_off_next_attr).
      IF sy-subrc = 0.
        CHECK lv_off_close < lv_off_next_attr.
      ENDIF.
      rv_body = |{ rv_body(lv_off_attr) }{ replace( val = rv_body+lv_off_attr regex = lc_attr_reg with = |<{ lv_attribute }>| ) }|.
      rv_body = |{ rv_body(lv_off_attr) }{ replace( val = rv_body+lv_off_attr sub = '</Атрибут>' with = |</{ lv_attribute }>| ) }|.
    ENDDO.
    FIND FIRST OCCURRENCE OF REGEX lc_attr_reg IN rv_body.
    IF sy-subrc <> 0.
      EXIT.
    ENDIF.
  ENDDO.
ENDMETHOD.
ENDCLASS.
