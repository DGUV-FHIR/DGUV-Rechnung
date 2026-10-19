Profile: DGUV-Rechnung-PR-VersichertePerson
Parent: DGUV_Basis_PR_VersichertePerson
Id: DGUV-Rechnung-PR-VersichertePerson
Title: "Versicherte Person"
Description: "Dieses Profil beschreibt die versicherte Person im Zusammenhang mit dem stationären Operationsbericht."

* ^url = "http://fhir.dguv.de/Rechnung/Patient/DGUV-Rechnung-PR-VersichertePerson"
* ^version = "0.1"
* ^status = #draft
* ^publisher = "Deutsche Gesetzliche Unfallversicherung e.V. (DGUV)"

* id MS

* meta MS
* meta.profile MS

* name MS
* name ^short = "Name der versicherten Person"

* name[Name] MS
* name[Name].use MS
* name[Name].use ^definition = "Abgrenzung von offiziellem Namen, Geburtsnamen, Künstlernamen usw. voneinander"

* name[Name].family MS

* name[Name].family.extension[namenszusatz] MS
* name[Name].family.extension[namenszusatz].value[x] MS

* name[Name].family.extension[nachname] MS
* name[Name].family.extension[nachname].value[x] MS
* name[Name].family.extension[nachname].value[x] ^short = "Konkreter Nachname"

* name[Name].family.extension[vorsatzwort] MS
* name[Name].family.extension[vorsatzwort].value[x] MS
* name[Name].family.extension[vorsatzwort].value[x] ^short = "Konkretes Vorsatzwort"

* name[Name].given MS

* name[Name].prefix MS

* name[Name].prefix.extension[prefix-qualifier] MS
* name[Name].prefix.extension[prefix-qualifier].value[x] MS
* name[Name].prefix.extension[prefix-qualifier].value[x] ^definition = "Konkrete Spezialisierung der Präfixart"

* name[Name].suffix MS

* birthDate MS
* birthDate ^short = "Geburtsdatum des Patienten"

* birthDate.extension[data_absent_reason] MS
* birthDate.extension[data_absent_reason] ^definition = "Grund, warum das richtige Geburtsdatum nicht vorliegt"

* birthDate.extension[data_absent_reason].value[x] MS
* birthDate.extension[data_absent_reason].value[x] ^short = "Kürzel des konkreten Grundes für Fehlen des Geburtsdatums"