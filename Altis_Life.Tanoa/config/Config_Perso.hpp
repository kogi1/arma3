/*
	Konfig für Perso	
*/
class Personalausweis {
	// Körpergröße von-bis in cm # Bodysize from-to in cm
	koerpergroesse[] = {150,220};
	// Geburtsjahre von-bis # year of birth from-to
	// Wird mit dem Missionsdatum gegengerechnet # would be calculate with mission date
	jahre[] = {1950,2015};
	// Körpergewicht in kg von-bis # body weight from-to in kg
	gewicht[] = {55,250};
	// Geschlecht M=Männlich, W=Weiblich # sex 'M'=man, change 'W' to 'F' for female
	geschlecht[] = {"M","W"};
	// Polizeimarke o. Logo (Pfad) # police badge destination
	logoWest = "#(rgb,8,8,3)color(0.07,0.06,0.83,0.5)";
	// Sanitäter-Logo (Pfad) # medical badge destination
	logoIndep = "#(rgb,8,8,3)color(0,0.93,0.05,0.5)";
	// Zivilisten-Logo (Pfad), ja Farben können angegeben werden # civilian badge destination, yes you can use color
	logoCiv = "#(rgb,8,8,3)color(0.49,0.06,0.44,0.5)";
	// Opfor-Logo (Pfad)/Unbekannte Fraktion # opfor badge destination/unkown side
	logoUnkn = "#(ai,64,64,1)Fresnel(0.3,3)";
	// Blutgruppen # bloodtypes
	blutgr[] = {"A","B","AB","0"};
	// Wohnort # living city
	class persoOrt {
		class 39071 {
			id = 1;
			name = "Georgetown";
			plz = 39071;
			str[] = { {"Georgetown-Hauptstraße", 5},{"Hafenstraße",3},{"Meerweg",2} };
		};	
		class 34142 {
			id = 2;
			name = "Tanuka";
			plz = 34142;
			str[] = { {"Tanuka-Hauptstraße",4},{"In den Busch",12},{"Krankenhausweg",12},{"Eisenstraße",9}};
		};	
		class 32892 {
			id = 3;
			name = "La Rochelle";
			plz = 32892;
			str[] = {{"La Rochelle-Hauptstrasse",30},{"Meerweg",12},{"Zum Urwald",6}};
		};	
		class 35557 {
			id = 4;
			name = "Nicolet";
			plz = 35557;
			str[] = {{"Nicolet-Hauptstrasse",13},{"Meerweg",9},{"Tankstellenweg",2}};
		};	
		class 32449 {
			id = 5;
			name = "Galili";
			plz = 32449;
			str[] = {{"Feldweg",3},{"Heroinecke",2}};
		};	
		class 39136 {
			id = 6;
			name = "Vagalala";
			plz = 39136;
			str[] = {{"Hauptstaße",6},{"Vagalala-Straße",9},{"Sommerwaldweg",8}};
		};	
		class 32632 {
			id = 7;
			name = "Ouméré";
			plz = 32632;
			str[] = {{"Hauptstaße",8},{"Schildkrötenweg",5},{"Waldsiedlung",2}};
		};	
		class 34949 {
			id = 8;
			name = "Blue Pearl";
			plz = 34949;
			str[] = {{"Hauptstraße",5},{"Zum Hafen",5},{"Kupferweg",4}};
		};	
		class 31593 {
			id = 9;
			name = "Lijnhaven";
			plz = 31593;
			str[] = {{"Hauptstraße",6},{"Airportstraße",6},{"Einkaufsmeile",6},{"Dealerstraße",6}};
		};	
		class 39895 {
			id = 10;
			name = "Moddergat";
			plz = 39895;
			str[] = {{"Seitenstraße",8},{"Diamantenweg",3},{"Feldpassage",3}};
		};	
		class 38441 {
			id = 11;
			name = "Katkoula";
			plz = 38441;
			str[] = {{"Hafenstraße",5},{"Tankstellenweg",5},{"Seitensiedlung",5}};
		};	
		class 33300 {
			id = 12;
			name = "Balavu";
			plz = 33300;
			str[] = {{"Zulassungsstraße",12},{"Nachrichtenweg",4}};
		};	
		class 30932 {
			id = 13;
			name = "Tuvanaka";
			plz = 30932;
			str[] = {{"Besenweg",5},{"Händlerweg",7},{"Marktweg",3}};
		};	
		class 35682 {
			id = 14;
			name = "Buawa";
			plz = 35682;
			str[] = {{"Waldsiedlung",2},{"Tropenweg",3}};
		};	
		class 30352 {
			id = 15;
			name = "Lakatoro";
			plz = 30352;
			str[] = {{"Gangstraße",10},{"Fiorteweg",3}};
		};	
		class 39159 {
			id = 16;
			name = "Luganville";
			plz = 39159;
			str[] = {{"Hauptstaße",4},{"Meerblickweg",3},{"Freinsiedlung",3}};
		};	
		class 37690 {
			id = 17;
			name = "Vutukoulo";
			plz = 37690;
			str[] = {{"Burgblick",4},{"Treppenweg",25},{"Untertagestraße",9}};
		};	
		class 38212 {
			id = 18;
			name = "Nasua";
			plz = 38212;
			str[] = {{"Scharfer Blick",5},{"Huegelweg",3}};
		};	
		
	};
	// Vorhandene Gesichter # some faces
	class persoBild
	{
		class 1
		{
			id = 1;
			name = "Bayh";
			pfad = "textures\persobilder\Bayh.jpg";
		};
		class 2
		{
			id = 2;
			name = "Burr";
			pfad = "textures\persobilder\Burr.jpg";
		};
		class 3
		{
			id = 3;
			name = "Byrne";
			pfad = "textures\persobilder\Byrne.jpg";
		};
		class 4
		{
			id = 4;
			name = "Campbell";
			pfad = "textures\persobilder\Campbell.jpg";
		};
		class 5
		{
			id = 5;
			name = "Christou";
			pfad = "textures\persobilder\Christou.jpg";
		};
		class 6
		{
			id = 6;
			name = "Coburn";
			pfad = "textures\persobilder\Coburn.jpg";
		};
		class 7
		{
			id = 7;
			name = "Collins";
			pfad = "textures\persobilder\Collins.jpg";
		};
		class 8
		{
			id = 8;
			name = "Dayton";
			pfad = "textures\persobilder\Dayton.jpg";
		};
		class 9
		{
			id = 9;
			name = "Dorgan";
			pfad = "textures\persobilder\Dorgan.jpg";
		};
		class 10
		{
			id = 10;
			name = "Doukas";
			pfad = "textures\persobilder\Doukas.jpg";
		};
		class 11
		{
			id = 11;
			name = "Gikas";
			pfad = "textures\persobilder\Gikas.jpg";
		};
		class 12
		{
			id = 12;
			name = "Halliwell";
			pfad = "textures\persobilder\Halliwell.jpg";
		};
		class 13
		{
			id = 13;
			name = "Hasan";
			pfad = "textures\persobilder\Hasan.jpg";
		};
		class 14
		{
			id = 14;
			name = "Jesus";
			pfad = "textures\persobilder\Jesus.jpg";
		};
		class 15
		{
			id = 15;
			name = "Johnson";
			pfad = "textures\persobilder\Johnson.jpg";
		};
		class 16
		{
			id = 16;
			name = "Kanelloupou";
			pfad = "textures\persobilder\Kanelloupou.jpg";
		};
		class 17
		{
			id = 17;
			name = "Kelly";
			pfad = "textures\persobilder\Kelly.jpg";
		};
		class 18
		{
			id = 18;
			name = "Kirby";
			pfad = "textures\persobilder\Kirby.jpg";
		};
		class 19
		{
			id = 19;
			name = "Martinez";
			pfad = "textures\persobilder\Martinez.jpg";
		};
		class 20
		{
			id = 20;
			name = "O Brien";
			pfad = "textures\persobilder\O_Brien.jpg";
		};
		class 21
		{
			id = 21;
			name = "O Conner";
			pfad = "textures\persobilder\O_Conner.jpg";
		};
		class 22
		{
			id = 22;
			name = "O Sullivan";
			pfad = "textures\persobilder\O_Sullivan.jpg";
		};
		class 23
		{
			id = 23;
			name = "Reed";
			pfad = "textures\persobilder\Reed.jpg";
		};
		class 24
		{
			id = 24;
			name = "Santorum";
			pfad = "textures\persobilder\Santorum.jpg";
		};
		class 25
		{
			id = 25;
			name = "Savalas";
			pfad = "textures\persobilder\Savalas.jpg";
		};
		class 26
		{
			id = 26;
			name = "Smith";
			pfad = "textures\persobilder\Smith.jpg";
		};
		class 27
		{
			id = 27;
			name = "Snowe";
			pfad = "textures\persobilder\Snowe.jpg";
		};
		class 28
		{
			id = 28;
			name = "Walsh";
			pfad = "textures\persobilder\Walsh.jpg";
		};
		class 29
		{
			id = 29;
			name = "Williams";
			pfad = "textures\persobilder\Williams.jpg";
		};
	};
};