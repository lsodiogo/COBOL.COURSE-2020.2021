   ******************************************************************
      *    LAB | SECOND PART | DELICIOUSSANDWICH
      ******************************************************************
      *    BREADWICH | INGREDIENTS MANAGEMENT
      ******************************************************************
      *    INGREDIENTS MODULE - REMOVE INGREDIENTS
      ******************************************************************
      *    V1 | EM ATUALIZAÇÃO | 03.01.2020
      ******************************************************************
       IDENTIFICATION DIVISION.
       PROGRAM-ID. REMOVE-INGREDS.
       ENVIRONMENT DIVISION.
       CONFIGURATION SECTION.
       SPECIAL-NAMES.
       CRT STATUS IS KEYSTATUS.
       REPOSITORY.
       FUNCTION ALL INTRINSIC.
       INPUT-OUTPUT SECTION.
       FILE-CONTROL.
               SELECT FXINGRED ASSIGN TO "FXINGREDS"
                   ORGANIZATION IS INDEXED
                   ACCESS MODE IS DYNAMIC
                   RECORD KEY IS INGREDS-ID
                   FILE STATUS INGRED-STATUS.

                   SELECT FXINGREDDEL ASSIGN TO "FXINGREDIENTSDEL"
                   ORGANIZATION IS INDEXED
                   ACCESS MODE IS DYNAMIC
                   RECORD KEY IS DEL-INGREDS-ID
                   FILE STATUS DEL-INGRED-STATUS.

       DATA DIVISION.
       FILE SECTION.
       FD FXINGRED.
           COPY FD-INGREDSFX.

       FD FXINGREDDEL.
           COPY DEL-INGREDS.

        WORKING-STORAGE SECTION.
           COPY CONSTANTS-INGREDS.
           COPY WS-INGREDSFX.

       01  DELETE-INGREDIENT               PIC X(002).
           88 DELETE-INGRED-VALID          VALUE "Y" "y" "N" "n" "S"
                                                   "s".
       77  DUMMY                           PIC X(001).
       77  INGRED-STATUS                   PIC 9(002).
       77  DEL-INGRED-STATUS               PIC 9(002).
       77  KEYSTATUS                       PIC 9(004).
       77  FXKEY-STATUS                    PIC 9(002).
       01  GET-VALID-ID                    PIC 9(003).
           88 VALID-ID                     VALUE 1 THRU 999.
       01  INGREDEXIST                     PIC X(002).
           88 INGREDEXIST-YES              VALUE "Y".
       77 ILIN                             PIC 9(002).
       77 ICOL                             PIC 9(002).
       77 EOF                              PIC X(001).
       77 TRUE-YES                         PIC X(001).
       77 COUNTPAGE                        PIC 9(002).
       77 PAGINA                           PIC 9(003).
       78 MAX-ING                          VALUE 999.
       01 TABLE-INGREDS OCCURS 1 TO MAX-ING TIMES
           DEPENDING ON NUMBER-ING
           INDEXED BY ING-INDEX.
           05 TABLEINGREDS-ID              PIC 9(003).
           05 TABLEINGREDS-NAME            PIC X(030).
           05 TABLEINGREDS-DESCRIPTION     PIC X(050).
           05 TABLEINGREDS-UNIT-SUPPLIER   PIC X(003).
           05 TABLEINGREDS-UNIT-SANDWICH   PIC X(003).
           05 TABLETRESHOLD                PIC 9(003).
           05 TABLEINGREDS-IS-ACTIVE       PIC 9(001).
       77 NUMBER-ING                       PIC 9(003) VALUE 999.

       SCREEN SECTION.
      ******************************************************************
       01  CLEAR-SCREEN.
           03 BLANK SCREEN.
      ******************************************************************
       01  MAIN-SCREEN
           BACKGROUND-COLOR 7 FOREGROUND-COLOR 0.
           05 VALUE ALL " " PIC X(120) LINE 02 COL 01.
           05 VALUE ALL " " PIC X(120) LINE 03 COL 01.
           05 VALUE ALL " " PIC X(120) LINE 04 COL 01.
           05 VALUE MODULE-NAME-REMOVE LINE 03 COL 50.
           05 VALUE ALL " " PIC X(95) LINE 24 COL 01.
           05 VALUE ALL " " PIC X(95) LINE 25 COL 01.
           05 VALUE ALL " " PIC X(95) LINE 26 COL 01.
           05 VALUE ALL " " PIC X(23) LINE 24 COL 98.
           05 VALUE ALL " " PIC X(23) LINE 25 COL 98.
           05 VALUE ALL " " PIC X(23) LINE 26 COL 98.
           05 VALUE BACK-EXIT LINE 25 COL 99 FOREGROUND-COLOR 5.
      ******************************************************************
       01 VIEW-INGREDIENT.
           05 VALUE ALL " " PIC X(080) LINE 7 COL 08
              BACKGROUND-COLOR 7.
           05 VALUE ALL " " PIC X(080) LINE 22 COL 08
              BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 08 COL 08 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 09 COL 08 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 10 COL 08 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 11 COL 08 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 12 COL 08 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 13 COL 08 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 14 COL 08 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 15 COL 08 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 16 COL 08 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 17 COL 08 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 18 COL 08 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 19 COL 08 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 20 COL 08 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 21 COL 08 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 08 COL 86 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 09 COL 86 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 10 COL 86 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 11 COL 86 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 12 COL 86 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 13 COL 86 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 14 COL 86 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 15 COL 86 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 16 COL 86 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 17 COL 86 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 18 COL 86 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 19 COL 86 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 20 COL 86 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 21 COL 86 BACKGROUND-COLOR 7.
           05 VALUE SCREEN-INGREDS-ID LINE 09 COL 19.
           05 REG-INGRED-ID PIC 9(003) LINE 09 COL PLUS 1
                   FROM WSINGREDS-ID.
           05 VALUE MANUALLY-ADD-NAME LINE 12 COL 21.
           05 REG-INGRED-NAME PIC X(030) LINE 12 COL PLUS 1
                   FROM WSINGREDS-NAME REQUIRED.
           05 VALUE MANUALLY-ADD-DESCRIPTION LINE 14 COL 21.
           05 REG-INGRED-DESCRIPTION PIC X(050) LINE 14 COL PLUS 1
                   FROM WSINGREDS-DESCRIPTION REQUIRED AUTO.
           05 VALUE MANUALLY-ADD-UN-SUPP LINE 16 COL 11.
           05 REG-UNIT-SUPPLIER PIC X(003) LINE 16 COL PLUS 1
               FROM WSINGREDS-UNIT-SUPPLIER AUTO REQUIRED.
           05 VALUE MANUALLY-ADD-UN-SAND LINE 18 COL 11.
           05 REG-UNIT-SANDWICH PIC X(003) LINE 18 COL PLUS 1
               FROM WSINGREDS-UNIT-SANDWICH AUTO REQUIRED.
           05 VALUE MANUALLY-ADD-TRESHOLD LINE 20 COL 11.
           05 REG-TRESHOLD PIC X(003) LINE 20 COL PLUS 1
               FROM WSTRESHOLD AUTO REQUIRED.
           05 REG-UNIT-SUPPLIER1 PIC X(003) LINE 20 COL PLUS 2
               FROM WSINGREDS-UNIT-SUPPLIER.
      ******************************************************************
       01 LIST-FRAME.
           05 VALUE ALL " " PIC X(082) LINE 7 COL 07
              BACKGROUND-COLOR 7.
           05 VALUE ALL " " PIC X(082) LINE 22 COL 07
              BACKGROUND-COLOR 7.
           05 VALUE LIST-FRAME1 LINE 08 COL 11 FOREGROUND-COLOR 5.
           05 VALUE LIST-FRAME2 LINE 08 COL PLUS 4 FOREGROUND-COLOR 5.
           05 VALUE LIST-FRAME1 LINE 08 COL 51 FOREGROUND-COLOR 5.
           05 VALUE LIST-FRAME2 LINE 08 COL PLUS 4 FOREGROUND-COLOR 5.
           05 VALUE "  " LINE 07 COL 07 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 08 COL 07 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 09 COL 07 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 10 COL 07 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 11 COL 07 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 12 COL 07 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 13 COL 07 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 14 COL 07 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 15 COL 07 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 16 COL 07 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 17 COL 07 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 18 COL 07 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 19 COL 07 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 20 COL 07 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 21 COL 07 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 07 COL 47 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 08 COL 47 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 09 COL 47 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 10 COL 47 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 11 COL 47 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 12 COL 47 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 13 COL 47 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 14 COL 47 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 15 COL 47 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 16 COL 47 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 17 COL 47 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 18 COL 47 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 19 COL 47 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 20 COL 47 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 21 COL 47 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 07 COL 87 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 08 COL 87 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 09 COL 87 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 10 COL 87 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 11 COL 87 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 12 COL 87 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 13 COL 87 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 14 COL 87 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 15 COL 87 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 16 COL 87 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 17 COL 87 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 18 COL 87 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 19 COL 87 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 20 COL 87 BACKGROUND-COLOR 7.
           05 VALUE "  " LINE 21 COL 87 BACKGROUND-COLOR 7.
      ******************************************************************
       01 ERROR-ZONE
           BACKGROUND-COLOR 7 FOREGROUND-COLOR 0.
           05 VALUE ALL " " PIC X(095) LINE 24 COL 01.
           05 VALUE ALL " " PIC X(095) LINE 25 COL 01.
           05 VALUE ALL " " PIC X(095) LINE 26 COL 01.
           05 ERROR-TEXT LINE 25 COL 03 PIC X(085)
               FOREGROUND-COLOR 4 BACKGROUND-COLOR 7.
           05 SCREEN-DUMMY1 LINE 26 COL 95 PIC X TO DUMMY AUTO.
      ******************************************************************
       01 INSTRUCTIONS-ZONE
           BACKGROUND-COLOR 7 FOREGROUND-COLOR 0.
           05 VALUE ALL " " PIC X(095) LINE 24 COL 01.
           05 VALUE ALL " " PIC X(095) LINE 25 COL 01.
           05 VALUE ALL " " PIC X(095) LINE 26 COL 01.
           05 INSTRUCTIONS-TEXT LINE 25 COL 03 PIC X(085)
               FOREGROUND-COLOR 4 BACKGROUND-COLOR 7.
      ******************************************************************
       01 GET-INGREDID
           BACKGROUND-COLOR 7 FOREGROUND-COLOR 0.
           05 VALUE ALL " " PIC X(095) LINE 24 COL 01.
           05 VALUE ALL " " PIC X(095) LINE 25 COL 01.
           05 VALUE ALL " " PIC X(095) LINE 26 COL 01.
           05 VALUE MESSAGE-GET-INGREDID LINE 25 COL 15
               FOREGROUND-COLOR 4 BACKGROUND-COLOR 7.
           05 NEW-INGREDID LINE 25 COL PLUS 1 PIC 9(003)
               FOREGROUND-COLOR 4 BACKGROUND-COLOR 7 TO GET-VALID-ID
               BLANK WHEN ZERO.
           05 MESSAGE-LIST-PAGE LINE 25 COL 56 PIC X(030).
      ******************************************************************
       01 INGREDIENT-LIST1.
           05 LIST-INGRED-ID1 PIC 9(003) LINE ILIN COL ICOL
               FROM TABLEINGREDS-ID (ING-INDEX).
           05 VALUE "|" LINE ILIN COL PLUS 1.
           05 LIST-INGRED-NAME1 PIC X(030) LINE ILIN COL PLUS 1
               FROM TABLEINGREDS-NAME (ING-INDEX).
      ******************************************************************
       01 INGREDIENT-LIST.
           05 LIST-INGRED-ID PIC 9(003) LINE ILIN COL ICOL
               FROM INGREDS-ID.
           05 VALUE "|" LINE ILIN COL PLUS 1.
           05 LIST-INGREDIENT-NAME PIC X(030) LINE ILIN COL PLUS 1
               FROM INGREDS-NAME.
      ******************************************************************
       01 DELETE-INGREDIENT-SCREEN
           BACKGROUND-COLOR 7 FOREGROUND-COLOR 0.
           05 VALUE ALL " " PIC X(095) LINE 24 COL 01.
           05 VALUE ALL " " PIC X(095) LINE 25 COL 01.
           05 VALUE ALL " " PIC X(095) LINE 26 COL 01.
           05 VALUE DELETE-INGRED LINE 25 COL 10
               FOREGROUND-COLOR 4 BACKGROUND-COLOR 7.
           05 DEL-INGRED LINE 25 COL PLUS 1 PIC X(002)
           TO DELETE-INGREDIENT AUTO.
      ******************************************************************
       01  EMPTY-LIST-SCREEN
           BACKGROUND-COLOR 7 FOREGROUND-COLOR 0.
           05 VALUE ALL " " PIC X(050) LINE 09 COL 35.
           05 VALUE ALL " " PIC X(050) LINE 10 COL 35.
           05 VALUE ALL " " PIC X(050) LINE 11 COL 35.
           05 VALUE ALL " " PIC X(050) LINE 12 COL 35.
           05 VALUE ALL " " PIC X(050) LINE 13 COL 35.
           05 VALUE ALL " " PIC X(050) LINE 14 COL 35.
           05 VALUE ALL " " PIC X(050) LINE 15 COL 35.
           05 VALUE ALL " " PIC X(050) LINE 16 COL 35.
           05 VALUE ALL " " PIC X(050) LINE 17 COL 35.
           05 VALUE ALL " " PIC X(050) LINE 18 COL 35.
           05 VALUE EMPTY-RECORDS      LINE 12 COL 38.
           05 VALUE EMPTY-RECORDS2     LINE 15 COL 47.
           05 LINE 01 COL 01 PIC X TO DUMMY AUTO.
      ******************************************************************
       PROCEDURE DIVISION.
       MAIN-PROCEDURE.
           PERFORM 050-FILL-TABLES
      *     PERFORM 110-CHECK-IF-DEL-FILE-EXISTS
           MOVE SPACE TO INGREDEXIST
           PERFORM UNTIL INGREDEXIST-YES
               PERFORM 100-INGREDIENT-LIST
               IF KEYSTATUS = 1003
                   EXIT PROGRAM
               END-IF
               PERFORM 105-CHECK-IF-INGREDID-EXISTS
               IF KEYSTATUS = 1003
                   EXIT PROGRAM
               END-IF
           END-PERFORM
           PERFORM 120-DELETE-INGREDIENT
           IF KEYSTATUS = 1003
               EXIT PROGRAM
           END-IF
           EXIT PROGRAM.

       050-FILL-TABLES SECTION.
           SET ING-INDEX TO 1
           OPEN INPUT FXINGRED
           PERFORM UNTIL EOFINGREDS
               READ FXINGRED NEXT RECORD
                   AT END
                       SET EOFINGREDS TO TRUE
                       MOVE ING-INDEX TO NUMBER-ING
                   NOT AT END
                       PERFORM 055-LOAD-TABLE
               END-READ
           END-PERFORM
           CLOSE FXINGRED
       EXIT SECTION.

       055-LOAD-TABLE SECTION.
           MOVE INGREDS-DETAILS TO TABLE-INGREDS (ING-INDEX)
           SET ING-INDEX UP BY 1
       EXIT SECTION.

       100-INGREDIENT-LIST SECTION.
           DISPLAY CLEAR-SCREEN
           DISPLAY MAIN-SCREEN
           DISPLAY LIST-FRAME
           MOVE ZEROES TO NEW-INGREDID
           MOVE SPACES TO TRUE-YES
           SET ING-INDEX TO 1
           MOVE 09 TO ILIN
           MOVE 11 TO ICOL
           MOVE 1 TO COUNTPAGE
           MOVE 24 TO PAGINA
           PERFORM UNTIL ING-INDEX >= NUMBER-ING
               DISPLAY INGREDIENT-LIST1
               ADD 1 TO ILIN
               ADD 1 TO PAGINA
               SET ING-INDEX UP BY 1
               IF ILIN = 21 AND ICOL = 11 THEN
                   MOVE 09 TO ILIN
                   MOVE 51 TO ICOL
               ELSE
                   IF ILIN = 21 AND ICOL = 51 THEN
                       MOVE NEXT-PAGE TO MESSAGE-LIST-PAGE
                       ACCEPT GET-INGREDID
                       IF KEYSTATUS = 1003 THEN
                           EXIT SECTION
                       END-IF
                       IF KEYSTATUS =1001 AND COUNTPAGE > 1
                           DISPLAY CLEAR-SCREEN
                           DISPLAY MAIN-SCREEN
                           DISPLAY LIST-FRAME
                           MOVE 09 TO ILIN
                           MOVE 11 TO ICOL
                           SET ING-INDEX DOWN BY PAGINA
                           SUBTRACT 1 FROM COUNTPAGE
                           MOVE 24 TO PAGINA
                       ELSE
                           IF KEYSTATUS = 1002 THEN
                               DISPLAY CLEAR-SCREEN
                               DISPLAY MAIN-SCREEN
                               DISPLAY LIST-FRAME
                               MOVE 09 TO ILIN
                               MOVE 11 TO ICOL
                               ADD 1 TO COUNTPAGE
                               MOVE 24 TO PAGINA
                           ELSE
                               EXIT SECTION
                           END-IF
                       END-IF
                   END-IF
               END-IF
               IF ING-INDEX >= NUMBER-ING
                   ACCEPT GET-INGREDID
                   IF KEYSTATUS = 1003 THEN
                       EXIT SECTION
                   END-IF
                   IF KEYSTATUS =1001 AND COUNTPAGE > 1
                       DISPLAY CLEAR-SCREEN
                       DISPLAY MAIN-SCREEN
                       DISPLAY LIST-FRAME
                       MOVE 09 TO ILIN
                       MOVE 11 TO ICOL
                       SET ING-INDEX DOWN BY PAGINA
                       SUBTRACT 1 FROM COUNTPAGE
                       MOVE 24 TO PAGINA
                   END-IF
               END-IF
           END-PERFORM
      *>     ACCEPT GET-INGREDID
      *>     IF KEYSTATUS = 1003 THEN
      *>         EXIT SECTION
      *>     END-IF
       EXIT SECTION.

       105-CHECK-IF-INGREDID-EXISTS SECTION.
           SET ING-INDEX TO 1
           PERFORM UNTIL ING-INDEX >= NUMBER-ING
               IF GET-VALID-ID = TABLEINGREDS-ID (ING-INDEX)
                   MOVE "Y" TO INGREDEXIST
                   MOVE TABLE-INGREDS (ING-INDEX) TO WSINGREDS-DETAILS
                   MOVE NUMBER-ING TO ING-INDEX
               END-IF
               SET ING-INDEX UP BY 1
           END-PERFORM
           IF INGREDEXIST <> "Y" THEN
               MOVE ERROR-INGREDID-NO TO ERROR-TEXT
               ACCEPT ERROR-ZONE
               IF KEYSTATUS = 1003 THEN
                   CLOSE FXINGRED
                   EXIT SECTION
               END-IF
           END-IF
       EXIT SECTION.

      * 110-CHECK-IF-DEL-FILE-EXISTS SECTION.
      *     OPEN I-O FXINGRED
      *     IF DEL-INGRED-STATUS = "35" THEN
      *         OPEN OUTPUT FXINGRED
      *         CLOSE FXINGRED
      *     ELSE
      *         CLOSE FXINGRED
      *     END-IF
      * EXIT SECTION.

       120-DELETE-INGREDIENT SECTION.
           OPEN I-O FXINGRED
           DISPLAY CLEAR-SCREEN
           DISPLAY MAIN-SCREEN
           DISPLAY VIEW-INGREDIENT
           PERFORM WITH TEST AFTER UNTIL DELETE-INGRED-VALID
               MOVE SPACE TO DEL-INGRED
               ACCEPT DELETE-INGREDIENT-SCREEN
               IF KEYSTATUS = 1003
                   CLOSE FXINGRED
                   EXIT SECTION
               END-IF
               IF NOT DELETE-INGRED-VALID THEN
                   MOVE VIEW-INGREDS-MENU-ERROR TO ERROR-TEXT
                   ACCEPT ERROR-ZONE
                   IF KEYSTATUS = 1003
                       CLOSE FXINGRED
                       EXIT SECTION
                   END-IF
               END-IF
           END-PERFORM
           IF DELETE-INGREDIENT = "Y" OR "y" OR "S" OR "s" THEN
      *         MOVE WSINGREDS-DETAILS TO DEL-INGREDS-DETAILS
               MOVE WSINGREDS-DETAILS TO INGREDS-DETAILS
      *         MOVE ZERO TO DEL-INGREDS-IS-ACTIVE
      *         WRITE DEL-INGREDS-DETAILS
      *         END-WRITE
               DELETE FXINGRED
               END-DELETE
               MOVE DELETE-YES TO ERROR-TEXT
               ACCEPT ERROR-ZONE
               IF KEYSTATUS = 1003
                   CLOSE FXINGRED
                   EXIT SECTION
               END-IF
           ELSE
               MOVE DELETE-NO TO ERROR-TEXT
               ACCEPT ERROR-ZONE
               IF KEYSTATUS = 1003
                   CLOSE FXINGRED
                   EXIT SECTION
               END-IF
           END-IF
           CLOSE FXINGRED
       EXIT SECTION.
