waitUntil {!isServer && !isNull player && player isEqualTo player};
if (player diarySubjectExists "controls") exitWith {};

player createDiarySubject ["credits","-- Wichtig --"];
player createDiarySubject ["changelog","Change Log"];
//player createDiarySubject ["serverrules","General Rules"];
//player createDiarySubject ["policerules","Police Procedures/Rules"];
player createDiarySubject ["safezones","Safe Zones (No Killing)"];
//player createDiarySubject ["civrules","Civilian Rules"];
player createDiarySubject ["illegalitems","Illegal Activity"];
//player createDiarySubject ["gangrules","Gang Rules"];
//player createDiarySubject ["terrorrules","Terrorism Rules"];
player createDiarySubject ["controls","Controls"];

/*  Example
    player createDiaryRecord ["", //Container
        [
            "", //Subsection
                "
TEXT HERE<br/><br/>
                "
        ]
    ];
*/

    player createDiaryRecord ["credits",
        [
            "Regelwerk",
                "
Alle aktuellen Regeln findest du im Forum(forum.pk-tanoa.ovh) oder auf unserm TS(ts.pk-tanoa.ovh) und<br/>
sind strikt einzuhalten. Bei nicht beachten des Regelwerks kann es zum Spielausschluss kommen. Nicht Wissen<br/>
schützt nicht vor Strafe!<br/><br/>
Solltest du Fragen haben stehen wir gerne auch im Supportbereich auf unserem TS zu Verfügung!<br/><br/><br/>
Geschwindigkeiten:<br/>
Freilandstraßen: 100km/h<br/>
In Städten mit Vorangsraße: 60km/h<br/>
In Städten ohne Vorangsraße: 30km/h<br/><br/>
                "
        ]
    ];

    player createDiaryRecord ["changelog",
        [
            "PK Tanoa Life Changelog",
                "
Die kompletten Changelog findest du in unserem Forum.<br/><br/>

                "
        ]
    ];

    player createDiaryRecord ["safezones",
        [
            "Safe Zones",
                "
In den sogenannten Safezones darf keiner getötet, ausgeraubt, niedergschlagen, oder als Geisel genommen werden.<br/>
Sollte eines der oben angeführten Vorgänge trotzdem passieren, ist das als RDM zu werten.<br/><br/>
Safezones sind:<br/>
- Alle Medic HQs(100m Umkreis)<br/>
- Rebellen Posten(200m Umkreis)<br/>
- Fahrzeugspawns(25m Umkreis)<br/>
- Alle auf der Map grün markierten Kreise<br/>
                "
        ]
    ];

   

    player createDiaryRecord ["serverrules",
        [
            "Regeln",
                "
Die aktuellen Regelen findest du im TeamSpeak oder im Forum.<br/>
                "
        ]
    ];

// Police Section
   

// Controls Section

    player createDiaryRecord ["controls",
        [
            "Steuerung",
                "
Informationen zur Steuerung findest unter Z im Hilfemenu!<br/>

                "
        ]
    ];
