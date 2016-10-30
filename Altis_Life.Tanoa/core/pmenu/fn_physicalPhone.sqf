/*
File: fn_physicalPhone.sqf
Author: Timo
Description:
With no radio cant use Cellphone
*/
if("ItemRadio" in assignedItems player) then {
createDialog "Life_my_smartphone"; // "Life_cell_phone" or /** Life_my_smartphone **\ if you use the SQL Based Smartphone   By Silex
} else {
hint parseText format ["<t size=1.30' font='puristaMedium' align='center' color='#0D82DF'>No CellPhone</t><br/><br/>
<t size='0.90 'font='puristaLight' align='left'>Du musst ein Telefon(Radio) besitzen um Nachrichten zu senden. Besorge dir eines im General Store</t><br/&gt"];
};