Profile: UVChargeItem
Parent: ChargeItem
Id: uv-charge-item
Title: "UV Rechnungsposition"
Description: "Eine Rechnungsposition einer UV-Rechnung"

* extension contains UVChargeItemType named positionType 1..1 MS

* status 1..1 MS
* status = #billable

* code 1..1

// -----------------------------------------------------
// Slicing auf ChargeItem.code.coding
// -----------------------------------------------------

* code.coding ^slicing.discriminator.type = #value
* code.coding ^slicing.discriminator.path = "system"
* code.coding ^slicing.rules = #open

* code.coding contains
    GOAE 0..1 and
    IndividualProof 0..1 and
    OtherCost 0..1

// -----------------------------------------------------
// GOÄ
// -----------------------------------------------------

* code.coding[GOAE].system 1..1
* code.coding[GOAE].system = "https://fhir.dguv.de/CodeSystem/uv-goae" (exactly)

* code.coding[GOAE].code 1..1
* code.coding[GOAE].display MS

// -----------------------------------------------------
// Einzelnachweis
// -----------------------------------------------------

* code.coding[IndividualProof].system 1..1
* code.coding[IndividualProof].system = "https://fhir.dguv.de/CodeSystem/uv-cost-line-type" (exactly)

* code.coding[IndividualProof].code 1..1
* code.coding[IndividualProof].code = #individual-proof

// -----------------------------------------------------
// Sonstige Kosten
// -----------------------------------------------------

* code.coding[OtherCost].system 1..1
* code.coding[OtherCost].system = "https://fhir.dguv.de/CodeSystem/uv-cost-line-type" (exactly)

* code.coding[OtherCost].code 1..1
* code.coding[OtherCost].code = #other-cost

* subject 1..1 MS

* occurrence[x] only dateTime
* occurrenceDateTime 1..1 MS

* performer 0..* MS

* quantity 0..1 MS

* reason 0..* MS

* note 0..* MS





//für die Constraints laut KI

// * obeys uv-ci-goae-1
// * obeys uv-ci-proof-1
// * obeys uv-ci-proof-2
// * obeys uv-ci-other-1
// * obeys uv-ci-other-2

// Invariant: uv-ci-goae-1
// Description: "GOÄ Positionen müssen eine GOÄ-Ziffer besitzen"
// Severity: #error
// Expression: "extension.where(url='http://example.org/fhir/StructureDefinition/uv-chargeitem-type').value.code='goae' implies code.coding.exists()"

// Invariant: uv-ci-proof-1
// Description: "Einzelnachweis benötigt eine Begründung"
// Severity: #error
// Expression: "extension.where(url='http://example.org/fhir/StructureDefinition/uv-chargeitem-type').value.code='individual-proof' implies reason.exists()"

// Invariant: uv-ci-proof-2
// Description: "Einzelnachweis darf keine GOÄ-Ziffer enthalten"
// Severity: #error
// Expression: "extension.where(url='http://example.org/fhir/StructureDefinition/uv-chargeitem-type').value.code='individual-proof' implies code.coding.empty()"

// Invariant: uv-ci-other-1
// Description: "Sonstige Position benötigt eine Begründung"
// Severity: #error
// Expression: "extension.where(url='http://example.org/fhir/StructureDefinition/uv-chargeitem-type').value.code='other' implies reason.exists()"

// Invariant: uv-ci-other-2
// Description: "Sonstige Position darf keine GOÄ-Ziffer enthalten"
// Severity: #error
// Expression: "extension.where(url='http://example.org/fhir/StructureDefinition/uv-chargeitem-type').value.code='other' implies code.coding.empty()"