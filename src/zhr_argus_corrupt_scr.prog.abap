*&---------------------------------------------------------------------*
*&  Include           ZHR_ARGUS_CORRUPT_SCR
*&---------------------------------------------------------------------*
SELECTION-SCREEN: BEGIN OF BLOCK b02 WITH FRAME TITLE text-b02.
PARAMETERS: p_emp AS CHECKBOX.
SELECTION-SCREEN: END OF BLOCK b02.
SELECTION-SCREEN: BEGIN OF BLOCK b03 WITH FRAME TITLE text-b03.
PARAMETERS: p_path TYPE pstring OBLIGATORY.
SELECTION-SCREEN: END OF BLOCK b03.
PARAMETERS: p_dogr TYPE persg DEFAULT 3 NO-DISPLAY.
