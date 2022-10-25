*---------------------------------------------------------------------*
*    view related data declarations
*   generation date: 01.12.2020 at 00:12:16
*   view maintenance generator version: #001407#
*---------------------------------------------------------------------*
*...processing: ZVHR_ARGUS_DATES................................*
TABLES: ZVHR_ARGUS_DATES, *ZVHR_ARGUS_DATES. "view work areas
CONTROLS: TCTRL_ZVHR_ARGUS_DATES
TYPE TABLEVIEW USING SCREEN '0001'.
DATA: BEGIN OF STATUS_ZVHR_ARGUS_DATES. "state vector
          INCLUDE STRUCTURE VIMSTATUS.
DATA: END OF STATUS_ZVHR_ARGUS_DATES.
* Table for entries selected to show on screen
DATA: BEGIN OF ZVHR_ARGUS_DATES_EXTRACT OCCURS 0010.
INCLUDE STRUCTURE ZVHR_ARGUS_DATES.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF ZVHR_ARGUS_DATES_EXTRACT.
* Table for all entries loaded from database
DATA: BEGIN OF ZVHR_ARGUS_DATES_TOTAL OCCURS 0010.
INCLUDE STRUCTURE ZVHR_ARGUS_DATES.
          INCLUDE STRUCTURE VIMFLAGTAB.
DATA: END OF ZVHR_ARGUS_DATES_TOTAL.

*.........table declarations:.................................*
TABLES: ZTHR_ARGUS_DATES               .
