*----------------------------------------------------------------------*
*                                                                      *
*       Data definition for infotype 9007                              *
*                                                                      *
*----------------------------------------------------------------------*
PROGRAM MP900700 MESSAGE-ID RP.

TABLES: P9007.
* the following tables are filled globally:
* T001P, T500P
* they can be made available with a TABLES-statement

FIELD-SYMBOLS: <PNNNN> STRUCTURE P9007
                       DEFAULT P9007.

DATA: PSAVE LIKE P9007.
