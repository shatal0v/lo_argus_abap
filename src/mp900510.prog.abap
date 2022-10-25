*----------------------------------------------------------------------*
*                                                                      *
*       Data definition for infotype 9005                              *
*                                                                      *
*----------------------------------------------------------------------*
PROGRAM MP900500 MESSAGE-ID RP.

TABLES: P9005.
* the following tables are filled globally:
* T001P, T500P
* they can be made available with a TABLES-statement

FIELD-SYMBOLS: <PNNNN> STRUCTURE P9005
                       DEFAULT P9005.

DATA: PSAVE LIKE P9005.
