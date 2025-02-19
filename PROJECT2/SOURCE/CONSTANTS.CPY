      ******************************************************************
      *    LAB | SECOND PART | DELICIOUSSANDWICH
      ******************************************************************
      *    BREADWICH | SCHOOL MANAGEMENT
      ******************************************************************
      *    ALL CONSTANTS
      ******************************************************************
      *     V0.1 | EM ATUALIZAÇÃO | 25.01.2020
      ******************************************************************
       78  MODULE-NAME         VALUE "SCHOOL MANAGEMENT".
       78  BACK-EXIT           VALUE "F3 - MAIN MENU SCM".
       78  MAIN-MENU-OPTION1   VALUE "1 - REGISTER SCHOOL".
       78  MAIN-MENU-OPTION2   VALUE "2 - VIEW SCHOOL".
       78  MAIN-MENU-OPTION3   VALUE "3 - EDIT SCHOOL".
       78  MAIN-MENU-OPTION4   VALUE "4 - DELETE SCHOOL".
       78  MAIN-MENU-OPTION5   VALUE "5 - EXIT".
       78  MAIN-MENU-CHOICE    VALUE "PLEASE CHOOSE AN OPTION".
       78  MAIN-MENU-ERROR
               VALUE "INVALID OPTION, PLEASE SELECT A VALID OPTION. "-
           "PRESS ANY KEY TO CONTINUE".
       78  LEAVE-MESSAGE       VALUE "LEAVING PROGRAM!".
       78  LEAVE-THANKS        VALUE "THANK YOU!".
       78  ADD-MENU-OPTION1    VALUE "1 - REGISTER SCHOOL MANUALLY".
       78  ADD-MENU-OPTION2    VALUE
                               "2 - REGISTER SCHOOL THROUGH CSV FILE".
       78  ADD-MENU-OPTION3    VALUE "3 - BACK TO MAIN MENU".
       78  ADD-MENU-CHOICE     VALUE "PLEASE CHOOSE AN OPTION".
       78  ADD-MENU-TEXT       VALUE "REGISTER NEW SCHOOL".
       78  ADD-MENU-TEXT1      VALUE "    INTERNAL ID:".
       78  ADD-MENU-TEXT2      VALUE "    EXTERNAL ID:".
       78  ADD-MENU-TEXT3      VALUE "    DESIGNATION:".
       78  ADD-MENU-TEXT4      VALUE "DESIGNATION:".
       78  ADD-MENU-TEXT5      VALUE "DESIGNATION:".
       78  ADD-MENU-TEXT6      VALUE "        ADDRESS:".
       78  ADD-MENU-TEXT7      VALUE "ADDRESS:".
       78  ADD-MENU-TEXT8      VALUE "    POSTAL CODE:".
       78  ADD-MENU-TEXT9      VALUE "           TOWN:".
       78  ADD-MENU-TEXT10 VALUE"DO YOU WANT TO SAVE THIS SCHOOL? (Y)ES/
      -    "(N)O".
       78  VIEW-MENU-OPTION1   VALUE "1 - VIEW SCHOOLS 1 BY 1".
       78  VIEW-MENU-OPTION2   VALUE "2 - VIEW ONE SPECIFIC".
       78  VIEW-MENU-OPTION3   VALUE "3 - BACK TO MAIN MENU".
       78  VIEW-MENU-CHOICE    VALUE "PLEASE CHOOSE AN OPTION".
       78  VIEW-MENU-OPTION5   VALUE"WHICH SCHOOL DO YOU WANT TO VIEW?".
       78  ID-ERROR-TEXT       VALUE "ID DOESN'T EXIST".
       78  ID-ERROR-TEXT1       VALUE "ID ALREADY EXISTS".
       78  VIEW-AGAIN-TEXT VALUE "DO YOU WANT TO VIEW ANOTHER SCHOOL?".
       78  VIEW-NEXT-TEXT      VALUE "PRESS ANY KEY TO GO FORWARD".
       78  VIEW-END-TEXT       VALUE "PRESS ANY KEY TO LEAVE".
       78  DLT-MENU-TEXT1 VALUE"WHICH SCHOOL DO YOU INTEND TO DELETE".
       78  DLT-MENU-TEXT       VALUE "DELETE SCHOOL".
       78  DLT-MENU-TEXT2  VALUE"DO YOU INTEND TO DELETE? (Y)es/(N)o".
       78  DLT-ID-ERROR        VALUE "SCHOOL ID DOESN'T EXIST".
       78  DELETED-TEXT        VALUE "RECORD DELETED".
       78  OPTION-INVALID-TEXT VALUE
           "OPTION NOT VALID PLEASE INSTERT AN OPTION BETWEEN 1 AND 3".
       78  END-OF-LIST-TEXT    VALUE "END OF RECORDS".
       78  LIST-SCREEN-TEXT    VALUE "SCHOOLS".
       78  LIST-SCREEN-TEXT1   VALUE "ID".
       78  LIST-SCREEN-TEXT2   VALUE "DESIGNATION".
       78  LIST-SCREEN-TEXT3   VALUE "TOWN".
       78  LIST-SCREEN-TEXT4   VALUE "ID".
       78  EMPTY-LIST-TEXT     VALUE "NO RECORDS TO BE SHOWN".
       78  NEXT-LIST-TEXT      VALUE "F2 TO SHOW NEXT PAGE".
       78  WHAT-TO-EDIT        VALUE "WHAT TO EDIT".
       78  EDIT1               VALUE "1 - EXTERNAL-ID".
       78  EDIT2               VALUE "2 - DESIGNATION".
       78  EDIT3               VALUE "3 - ADDRESS".
       78  EDIT4               VALUE "4 - POSTAL-CODE".
       78  EDIT5               VALUE "5 - TOWN".
       78  EDIT6               VALUE "8 - LEAVE".
       78  CHOOSE              VALUE "CHOOSE OPTION:".
       78  ALT-MENU-OPTION VALUE"WHICH RECORD DO YOU WANT TO CHANGE:".
       78  ALT-MENU-TEXT       VALUE "CHANGE SCHOOL".
       78  VIEW-MENU-TEXT      VALUE "VIEW SCHOOLS".
       78  INSTRUCTION-EED     VALUE "8 CHARS MAX|AUTO UPPER-CASE".
       78  ERROR-EED           VALUE "EXTERNAL ID ALREADY IN USE".
       78  ERROR-EED1          VALUE "EXTERNAL ID MUST BE FILLED".
       78  INSTRUCTION-DSG     VALUE "150 CHARS MAX|AUTO UPPER-CASE|AUTO
      -    "LINE CHANGE AT LINE END|TAB TO MOVE BETWEEN LINES".
       78  ERROR-DSG VALUE "THE DESIGNATION MUST BE FILLED".
       78  INSTRUCTION-ADR     VALUE "150 CHARS MAX|AUTO UPPER-CASE|AUTO
      -    "LINE CHANGE AT LINE END|TAB TO MOVE BETWEEN LINES".
       78  ERROR-ADR VALUE "THE ADDRESS MUST BE FILLED".
       78  INSTRUCTION-POSTAL-CODE VALUE"BETWEEN 1000000 AND 9999999|AUT
      -    "O MOVE AT END|TAB TO MOVE BETWEEN FIELDS".
       78  ERROR-POSTAL-CODE VALUE "ERROR|BETWEEN 1000000 AND 9999999".
       78  INSTRUCTION-TOWN    VALUE"NO NUMBERS ALLOWED. MUST BE ALPHABE
      -    "TIC".
       78  ERROR-TOWN VALUE "NO NUMBERS ALLOWED. MUST BE ALPHABETIC".
       78  CONFIRM-RECORD VALUE "RECORD SUCCESSFULLY SAVED".
       78  FS-ERROR VALUE "FILE CREATED".
       78  EMPTY-RECORDS
           VALUE "THERE IS NO REGISTERS RECORDED IN THIS FILE".
       78  EMPTY-RECORDS2 VALUE "PRESS ANY KEY TO CONTINUE".
       78  ERROR-ALPHABETIC VALUE "FIRST CHARACTER MUST BE ALPHABETIC".
