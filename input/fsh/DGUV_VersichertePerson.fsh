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

* meta 1..1 MS

* meta.profile 1..* MS
* meta.profile contains operProfile 1..1 MS
* meta.profile[operProfile] = "http://fhir.dguv.de/Rechnung/Patient/DGUV-Rechnung-PR-VersichertePerson"

* name ^short = "Name der versicherten Person"
* name 0..1 MS
* name ^slicing.rules = #open

* name contains
    Name 0..* MS and
    Geburtsname 0..0

* name[Name].use MS
* name[Name].use ^definition = "Abgrenzung von offiziellem Namen, Geburtsnamen, Künstlernamen usw. voneinander"

* name[Name].family MS

* name[Name].family.extension 0..3 MS
* name[Name].family.extension contains
    namenszusatz 0..* MS and
    nachname 0..* MS and
    vorsatzwort 0..* MS

* name[Name].family.extension[namenszusatz].value[x] 1..1 MS

* name[Name].family.extension[nachname].value[x] MS
* name[Name].family.extension[nachname].value[x] ^short = "Konkreter Nachname"

* name[Name].family.extension[vorsatzwort].value[x] MS
* name[Name].family.extension[vorsatzwort].value[x] ^short = "Konkretes Vorsatzwort"

* name[Name].given 1..1 MS

* name[Name].prefix MS
* name[Name].prefix.extension MS

* name[Name].prefix.extension contains
    prefix-qualifier 0..* MS

* name[Name].prefix.extension[prefix-qualifier].value[x] MS
* name[Name].prefix.extension[prefix-qualifier].value[x] ^definition = "Konkrete Spezialisierung der Präfixart"

* name[Name].suffix MS

* birthDate MS
* birthDate ^short = "Geburtsdatum des Patienten"

* birthDate.extension 0..1 MS

* birthDate.extension contains
    data_absent_reason 0..1 MS

* birthDate.extension[data_absent_reason] ^definition = "Grund, warum das richtige Geburtsdatum nicht vorliegt"

* birthDate.extension[data_absent_reason].value[x] MS
* birthDate.extension[data_absent_reason].value[x] ^short = "Kürzel des konkreten Grundes für Fehlen des Geburtsdatums"