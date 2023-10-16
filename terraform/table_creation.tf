resource "snowflake_table" "ingest_ivyfotoexport" {
  database            = var.landing
  schema              = "RAINTREE"
  name                = "IVYFOTOEXPORT"
  change_tracking     = true

  column {
    name = "score"
    type = "VARCHAR"
  }

  column {
    name = "goal"
    type = "VARCHAR"
  }

  column {
    name = "latest"
    type = "VARCHAR"
  }

  column {
    name = "tab"
    type = "VARCHAR"
  }

  column {
    name = "assessment_section"
    type = "VARCHAR"
  }

  column {
    name = "patient"
    type = "VARCHAR"
  }

  column {
    name = "caseindex"
    type = "VARCHAR"
  }

  column {
    name = "fotoindex"
    type = "VARCHAR"
  }

  column {
    name = "episodeid"
    type = "VARCHAR"
  }

  column {
    name = "reportid"
    type = "VARCHAR"
  }

  column {
    name = "surveystarted"
    type = "VARCHAR"
  }

  column {
    name = "surveycompleted"
    type = "VARCHAR"
  }

  column {
    name = "reporttype"
    type = "VARCHAR"
  }

  column {
    name = "mcii"
    type = "VARCHAR"
  }

  column {
    name = "mdc"
    type = "VARCHAR"
  }

  column {
    name = "episodeduration"
    type = "VARCHAR"
  }

  column {
    name = "physicalfschange"
    type = "VARCHAR"
  }

  column {
    name = "riskadjfoto"
    type = "VARCHAR"
  }

  column {
    name = "visitsperepisode"
    type = "VARCHAR"
  }

  column {
    name = "dischargefsscore"
    type = "VARCHAR"
  }

  column {
    name = "avgsatisfaction"
    type = "VARCHAR"
  }
}

resource "snowflake_table" "ingest_ivycasedataexport" {
  database            = var.landing
  schema              = "RAINTREE"
  name                = "IVYCASEDATAEXPORT"
  change_tracking     = true


  column {
    name = "CaseIndex"
    type = "VARCHAR"
  }

  column {
    name = "PatientNumber"
    type = "VARCHAR"
  }

  column {
    name = "CaseCode"
    type = "VARCHAR"
  }

  column {
    name = "CaseTemplateCode"
    type = "VARCHAR"
  }

  column {
    name = "DefaultLocation"
    type = "VARCHAR"
  }

  column {
    name = "CaseStatus"
    type = "VARCHAR"
  }

  column {
    name = "CaseCreateDate"
    type = "VARCHAR"
  }

  column {
    name = "StartDate"
    type = "VARCHAR"
  }

  column {
    name = "EndDate"
    type = "VARCHAR"
  }

  column {
    name = "FirstKeptAppointDate"
    type = "VARCHAR"
  }

  column {
    name = "FirstEvaluationDate"
    type = "VARCHAR"
  }

  column {
    name = "LatestVisitDate"
    type = "VARCHAR"
  }

  column {
    name = "NextVisitDate"
    type = "VARCHAR"
  }

  column {
    name = "DischargeDate"
    type = "VARCHAR"
  }

  column {
    name = "DischargeReasonCode"
    type = "VARCHAR"
  }

  column {
    name = "DischargeReasonDescription"
    type = "VARCHAR"
  }

  column {
    name = "CaseTypeCode"
    type = "VARCHAR"
  }

  column {
    name = "CaseTypeDescription"
    type = "VARCHAR"
  }

  column {
    name = "CaseReasonCode"
    type = "VARCHAR"
  }

  column {
    name = "CaseReasonDescription"
    type = "VARCHAR"
  }

  column {
    name = "CaseSpeciality"
    type = "VARCHAR"
  }

  column {
    name = "CaseStatusDescription"
    type = "VARCHAR"
  }

  column {
    name = "MarketingRefCatCode"
    type = "VARCHAR"
  }

  column {
    name = "MarketingRefCatDesc"
    type = "VARCHAR"
  }

  column {
    name = "EvalProviderCode"
    type = "VARCHAR"
  }

  column {
    name = "KeyProviderCode"
    type = "VARCHAR"
  }

  column {
    name = "TreatingProviderCode"
    type = "VARCHAR"
  }

  column {
    name = "SuperProviderCode"
    type = "VARCHAR"
  }

  column {
    name = "DischargeProviderCode"
    type = "VARCHAR"
  }

  column {
    name = "ReferringProviderCode"
    type = "VARCHAR"
  }

  column {
    name = "ReferringProviderGrpCode"
    type = "VARCHAR"
  }

  column {
    name = "ReferringProviderGrpDesc"
    type = "VARCHAR"
  }

  column {
    name = "PrimaryInsCode"
    type = "VARCHAR"
  }

  column {
    name = "PrimaryFinancialClass"
    type = "VARCHAR"
  }

  column {
    name = "SecondaryInsCode"
    type = "VARCHAR"
  }

  column {
    name = "SecondaryFinancialClass"
    type = "VARCHAR"
  }

  column {
    name = "PrimaryDiagCode"
    type = "VARCHAR"
  }

  column {
    name = "DiagCode2"
    type = "VARCHAR"
  }

  column {
    name = "DiagCode3"
    type = "VARCHAR"
  }

  column {
    name = "DiagCode4"
    type = "VARCHAR"
  }

  column {
    name = "DiagCode5"
    type = "VARCHAR"
  }

  column {
    name = "DiagCode6"
    type = "VARCHAR"
  }

  column {
    name = "DiagCode7"
    type = "VARCHAR"
  }

  column {
    name = "DiagCode8"
    type = "VARCHAR"
  }

  column {
    name = "DiagCode9"
    type = "VARCHAR"
  }

  column {
    name = "DiagCode10"
    type = "VARCHAR"
  }

  column {
    name = "DiagCode11"
    type = "VARCHAR"
  }

  column {
    name = "DiagCode12"
    type = "VARCHAR"
  }

  column {
    name = "RequiresDateOfInjury"
    type = "VARCHAR"
  }

  column {
    name = "DateOfInjury"
    type = "VARCHAR"
  }

  column {
    name = "DateOfSurgery"
    type = "VARCHAR"
  }

  column {
    name = "HasSurgery"
    type = "VARCHAR"
  }

  column {
    name = "ActiveSmoker"
    type = "VARCHAR"
  }

  column {
    name = "ChronicPainOrInjury"
    type = "VARCHAR"
  }

  column {
    name = "Depression"
    type = "VARCHAR"
  }

  column {
    name = "EquipmentUsed"
    type = "VARCHAR"
  }

  column {
    name = "LivingAlone"
    type = "VARCHAR"
  }

  column {
    name = "Osteoarthritis"
    type = "VARCHAR"
  }

  column {
    name = "Osteoporosis"
    type = "VARCHAR"
  }

  column {
    name = "MedicalHistoryDate"
    type = "VARCHAR"
  }

  column {
    name = "MedicalHistoryType"
    type = "VARCHAR"
  }

  column {
    name = "PlanOfCareTotalVisits"
    type = "VARCHAR"
  }

  column {
    name = "PlanOfCareUsedVisits"
    type = "VARCHAR"
  }

  column {
    name = "PlanOfCareRemainingVisits"
    type = "VARCHAR"
  }

  column {
    name = "PlanOfCareVisitsNotSched"
    type = "VARCHAR"
  }

  column {
    name = "PlanOfCareStartDate"
    type = "VARCHAR"
  }

  column {
    name = "PlanOfCareEndDate"
    type = "VARCHAR"
  }

  column {
    name = "AuthorizedTotalVisits"
    type = "VARCHAR"
  }

  column {
    name = "AuthorizedVisitsUsed"
    type = "VARCHAR"
  }

  column {
    name = "AuthorizedVisitsRem"
    type = "VARCHAR"
  }

  column {
    name = "TotalTreatingProviders"
    type = "VARCHAR"
  }

  column {
    name = "KeyProviderVisits"
    type = "VARCHAR"
  }

  column {
    name = "TotalRealVisits"
    type = "VARCHAR"
  }

  column {
    name = "TotalScheduledVisits"
    type = "VARCHAR"
  }

  column {
    name = "ODGBenchmark"
    type = "VARCHAR"
  }

  column {
    name = "OccurredRate"
    type = "VARCHAR"
  }

  column {
    name = "UniqueWeekVisits"
    type = "VARCHAR"
  }

  column {
    name = "CoPayRequired"
    type = "VARCHAR"
  }

  column {
    name = "CoInsuranceRequired"
    type = "VARCHAR"
  }

  column {
    name = "SelfPayRequired"
    type = "VARCHAR"
  }

  column {
    name = "InsuranceChargesBilled"
    type = "VARCHAR"
  }

  column {
    name = "InsuranceChargesExpected"
    type = "VARCHAR"
  }

  column {
    name = "InsurancePaidToChgs"
    type = "VARCHAR"
  }

  column {
    name = "InsuranceAdjustedByBilled"
    type = "VARCHAR"
  }

  column {
    name = "InsuranceAdjustedByExpected"
    type = "VARCHAR"
  }

  column {
    name = "PatientChargesBilled"
    type = "VARCHAR"
  }

  column {
    name = "PatientChargesExpected"
    type = "VARCHAR"
  }

  column {
    name = "PatientPaidToChgs"
    type = "VARCHAR"
  }

  column {
    name = "PatientAdjustedByBilled"
    type = "VARCHAR"
  }

  column {
    name = "PatientAdjustedByExpecteded"
    type = "VARCHAR"
  }

  column {
    name = "CaseLedgerBalance"
    type = "VARCHAR"
  }

  column {
    name = "InsuranceBalance"
    type = "VARCHAR"
  }

  column {
    name = "PatientBalance"
    type = "VARCHAR"
  }

  column {
    name = "UnitsTotal"
    type = "VARCHAR"
  }

  column {
    name = "UnitsWOXCodesTotal"
    type = "VARCHAR"
  }

  column {
    name = "CoreUnitsTotal"
    type = "VARCHAR"
  }

  column {
    name = "CoreUnitsWOXCodesTotal"
    type = "VARCHAR"
  }
}

resource "snowflake_table" "ingest_rbi_insurance_stage" {
  database            = var.landing
  schema              = "RAINTREE"
  name                = "Z_RBI_INSURANCE"
  change_tracking     = true

  column {
    name = "_id"
    type = "INT"
  }

  column {
    name = "InsuranceCode"
    type = "VARCHAR"
  }

  column {
    name = "InsuranceName"
    type = "VARCHAR"
  }

  column {
    name = "InsuranceAddr1"
    type = "VARCHAR"
  }

  column {
    name = "InsuranceAddr2"
    type = "VARCHAR"
  }

  column {
    name = "InsuranceCity"
    type = "VARCHAR"
  }

  column {
    name = "InsuranceState"
    type = "VARCHAR"
  }

  column {
    name = "InsuranceZip"
    type = "VARCHAR"
  }

  column {
    name = "InsurancePhone"
    type = "VARCHAR"
  }

  column {
    name = "InsuranceFax"
    type = "VARCHAR"
  }

  column {
    name = "InsuranceCell"
    type = "VARCHAR"
  }

  column {
    name = "InsurancePayorid"
    type = "VARCHAR"
  }

  column {
    name = "InsuranceFC"
    type = "VARCHAR"
  }

  column {
    name = "InsuranceCategory"
    type = "VARCHAR"
  }

  column {
    name = "InsuranceCategoryDescription"
    type = "VARCHAR"
  }
}

resource "snowflake_table" "ingest_rbi_insurance" {
  database            = var.landing
  schema              = "RAINTREE"
  name                = "RBI_INSURANCE"
  change_tracking     = true

  column {
    name = "_id"
    type = "INT"
  }

  column {
    name = "InsuranceCode"
    type = "VARCHAR"
  }

  column {
    name = "InsuranceName"
    type = "VARCHAR"
  }

  column {
    name = "InsuranceAddr1"
    type = "VARCHAR"
  }

  column {
    name = "InsuranceAddr2"
    type = "VARCHAR"
  }

  column {
    name = "InsuranceCity"
    type = "VARCHAR"
  }

  column {
    name = "InsuranceState"
    type = "VARCHAR"
  }

  column {
    name = "InsuranceZip"
    type = "VARCHAR"
  }

  column {
    name = "InsurancePhone"
    type = "VARCHAR"
  }

  column {
    name = "InsuranceFax"
    type = "VARCHAR"
  }

  column {
    name = "InsuranceCell"
    type = "VARCHAR"
  }

  column {
    name = "InsurancePayorid"
    type = "VARCHAR"
  }

  column {
    name = "InsuranceFC"
    type = "VARCHAR"
  }

  column {
    name = "InsuranceCategory"
    type = "VARCHAR"
  }

  column {
    name = "InsuranceCategoryDescription"
    type = "VARCHAR"
  }
}

resource "snowflake_table" "ingest_rbi_aptype" {
database            = var.landing
  schema              = "RAINTREE"
  name                = "RBI_APTYPE"
  change_tracking     = true

  column {
    name = "code"
    type = "VARCHAR"
  }

  column {
    name = "desc_"
    type = "VARCHAR"
  }

  column {
    name = "visit_type"
    type = "VARCHAR"
  }

  column {
    name = "slot"
    type = "VARCHAR"
  }

  column {
    name = "limit_"
    type = "VARCHAR"
  }

  column {
    name = "databasename"
    type = "VARCHAR"
  }
}
