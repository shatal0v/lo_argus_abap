FUNCTION zhr_argus_hire_employee.
*"----------------------------------------------------------------------
*"*"Локальный интерфейс:
*"  IMPORTING
*"     VALUE(EMPLOYEENUMBER) TYPE  PERNR_D OPTIONAL
*"     VALUE(REFERENCEPERNR) TYPE  PERNR_D OPTIONAL
*"     VALUE(HIRINGDATE) TYPE  BEGDA OPTIONAL
*"     VALUE(ACTIONTYPE) TYPE  MASSN OPTIONAL
*"     VALUE(REASONFORACTION) TYPE  MASSG OPTIONAL
*"     VALUE(PNNNN_TAB) TYPE  PRELP_TAB OPTIONAL
*"     VALUE(PREF_TAB) TYPE  PREF_TAB OPTIONAL
*"     VALUE(NOCOMMIT) TYPE  FLAG DEFAULT 'X'
*"  EXPORTING
*"     VALUE(RETURN_TAB) TYPE  HRPAD_RETURN_TAB
*"     VALUE(BAPIPAKEY_TAB) TYPE  HRPAD_BAPIPAKEY_TAB
*"     VALUE(IS_OK) TYPE  BOOLE_D
*"----------------------------------------------------------------------
  CALL FUNCTION 'HR_PAD_HIRE_EMPLOYEE'
    EXPORTING
      employeenumber  = employeenumber
      referencepernr  = referencepernr
      hiringdate      = hiringdate
      actiontype      = actiontype
      reasonforaction = reasonforaction
      pnnnn_tab       = pnnnn_tab
      pref_tab        = pref_tab
      nocommit        = nocommit
    IMPORTING
      return_tab      = return_tab
      bapipakey_tab   = bapipakey_tab
      is_ok           = is_ok.
ENDFUNCTION.
