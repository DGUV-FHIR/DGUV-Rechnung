//DGUV Rechnung als Invoice

Profile: UVInvoice
Parent: Invoice
Id: uv-invoice
Title: "UV Rechnung"
Description: "Rechnung zur Abrechnung von UV-Leistungen"

* status 1..1 MS
//* status = #issued

//Rechnungsnummer? Muss geprüft werden wie hier Nummer vorgegeben werden. Gefahr, dass sich Rechnungsnummern überschneiden, wenn mehrere Rechnungen für eine UV erstellt werden
* identifier 1..* MS

//Reference auf die Organisation, die die Rechnung ausstellt. Todo: Entsprechendes Profil referenzieren
* issuer 1..1 MS

//* recipient 1..1 MS

//Reference auf den Patienten. Todo: Entsprechendes Profil referenzieren
* subject 1..1 MS

* date 1..1 MS

* lineItem 1..* MS

//Reihenfolge der Rechnungsposition
* lineItem.sequence 1..1 MS

//Reference auf die ChargeItem, das in der Rechnung abgerechnet wird. Todo: Entsprechendes Profil erstellen
* lineItem.chargeItemReference 1..1 MS
* lineItem.chargeItemReference only Reference(UVChargeItem)

//Hier kommen die Preise der einzelnen Rechnungspositionen rein. Eventuell slicen für Gebühr, besondere Kosten, Summe etc. oder als code abbilden.
* lineItem.priceComponent 1..* MS

//Rechnungsbetrag (Netto)
* totalNet 1..1 MS
