       IDENTIFICATION DIVISION.
       PROGRAM-ID. LOWERUPPER.
       DATA DIVISION.
       FILE SECTION.
       WORKING-STORAGE SECTION.
       01  MINUSCULO   PIC X(26) VALUE "abcdefghijklmnopqrstuvwxyz".
       01  MAIUSCULO   PIC X(26) VALUE "ABCDEFGHIJKLMNOPQRSTUVWXYZ".
       LINKAGE SECTION.
       01 TEXTO                        PIC X(150).

       PROCEDURE DIVISION USING TEXTO.
       MAIN-PROCEDURE-START.

           INSPECT TEXTO CONVERTING MINUSCULO TO MAIUSCULO

           EXIT PROGRAM.
