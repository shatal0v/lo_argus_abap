*&---------------------------------------------------------------------*
*&  Include           ZHR_ARGUS_CORRUPT_EVT
*&---------------------------------------------------------------------*
INITIALIZATION.
  cl_gui_frontend_services=>get_desktop_directory(
    CHANGING
      desktop_directory    = p_path
    EXCEPTIONS
      OTHERS               = 4
  ).
  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
               WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.
  cl_gui_cfw=>flush(
    EXCEPTIONS
      OTHERS            = 0
  ).

AT SELECTION-SCREEN ON VALUE-REQUEST FOR p_path.
  cl_gui_frontend_services=>directory_browse(
    CHANGING
      selected_folder      = p_path
    EXCEPTIONS
      OTHERS               = 4
  ).
  IF sy-subrc <> 0.
    MESSAGE ID sy-msgid TYPE sy-msgty NUMBER sy-msgno
               WITH sy-msgv1 sy-msgv2 sy-msgv3 sy-msgv4.
  ENDIF.
  cl_gui_cfw=>flush(
    EXCEPTIONS
      OTHERS            = 0
  ).

START-OF-SELECTION.

END-OF-SELECTION.
  lcl=>get( )->report( ).
