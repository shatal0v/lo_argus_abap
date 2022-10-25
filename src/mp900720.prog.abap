*----------------------------------------------------------------------*
*                                                                      *
*       Output-modules for infotype 9007                               *
*                                                                      *
*----------------------------------------------------------------------*
*----------------------------------------------------------------------*
*       MODULE  P9007 OUTPUT                                           *
*----------------------------------------------------------------------*
*       Default values, Texts                                          *
*----------------------------------------------------------------------*
MODULE P9007 OUTPUT.
  IF PSYST-NSELC EQ YES.
* read text fields etc.; do this whenever the screen is show for the
*  first time:
*   PERFORM RExxxx.
    IF PSYST-IINIT = YES AND PSYST-IOPER = INSERT.
* generate default values; do this the very first time on insert only:
*     PERFORM GET_DEFAULT.
    ENDIF.
  ENDIF.
  LOOP AT SCREEN.
    CHECK screen-name = 'FILE'.
    screen-active = 1.
    screen-input = 1.
    MODIFY SCREEN.
  ENDLOOP.
ENDMODULE.
*----------------------------------------------------------------------*
*       MODULE  P9007L OUTPUT                                          *
*----------------------------------------------------------------------*
*       read texts for listscreen
*----------------------------------------------------------------------*
MODULE P9007L OUTPUT.
* PERFORM RExxxx.
ENDMODULE.
