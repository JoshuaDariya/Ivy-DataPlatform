resource "snowflake_table" "testing" {
  database            = var.landing
  schema              = "RAINTREE"
  name                = "testing"
  change_tracking     = true

  column {
    name = "testing"
    type = "VARCHAR"
  }
}


resource "snowflake_table" "ingest_ivyfotoexport_stage" {
  database            = var.landing
  schema              = "RAINTREE"
  name                = "Z_IVY_FOTO_EXPORT"
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
    name = "id"
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

resource "snowflake_table" "ingest_ivyfotoexport" {
  database            = var.landing
  schema              = "RAINTREE"
  name                = "IVY_FOTO_EXPORT"
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
    name = "id"
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


resource "snowflake_table" "ingest_ivycasedataexport_stage" {
  database            = var.landing
  schema              = "RAINTREE"
  name                = "Z_IVY_CASE_DATA_EXPORT"
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


resource "snowflake_table" "ingest_ivycasedataexport" {
  database            = var.landing
  schema              = "RAINTREE"
  name                = "IVY_CASE_DATA_EXPORT"
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
    type = "NUMBER(38,0)"
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
    type = "NUMBER(38,0)"
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

resource "snowflake_table" "ingest_z_rbi_aptype" {
database            = var.landing
  schema              = "RAINTREE"
  name                = "Z_RBI_APTYPE"
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

resource "snowflake_table" "ingest_rbi_tablec_custom" {
database            = var.landing
  schema              = "RAINTREE"
  name                = "RBI_TABLEC_CUSTOM"
  change_tracking     = true

  column {
    name = "id"
    type = "NUMBER(38,0)"
  }

  column {
    name = "mcode"
    type = "VARCHAR"
  }

  column {
    name = "code"
    type = "VARCHAR"
  }

  column {
    name = "desc1"
    type = "VARCHAR"
  }

  column {
    name = "desc2"
    type = "VARCHAR"
  }

  column {
    name = "desc3"
    type = "VARCHAR"
  }

  column {
    name = "desc4"
    type = "VARCHAR"
  }

  column {
    name = "filter"
    type = "VARCHAR"
  }

  column {
    name = "effectivefrom"
    type = "VARCHAR"
  }

  column {
    name = "effectiveto"
    type = "VARCHAR"
  }

  column {
    name = "_modifiedby"
    type = "VARCHAR"
  }

  column {
    name = "_modified"
    type = "VARCHAR"
  }
  
}

resource "snowflake_table" "ingest_z_rbi_tablec_custom" {
database            = var.landing
  schema              = "RAINTREE"
  name                = "Z_RBI_TABLEC_CUSTOM"
  change_tracking     = true

  column {
    name = "id"
    type = "NUMBER(38,0)"
  }

  column {
    name = "mcode"
    type = "VARCHAR"
  }

  column {
    name = "code"
    type = "VARCHAR"
  }

  column {
    name = "desc1"
    type = "VARCHAR"
  }

  column {
    name = "desc2"
    type = "VARCHAR"
  }

  column {
    name = "desc3"
    type = "VARCHAR"
  }

  column {
    name = "desc4"
    type = "VARCHAR"
  }

  column {
    name = "filter"
    type = "VARCHAR"
  }

  column {
    name = "effectivefrom"
    type = "VARCHAR"
  }

  column {
    name = "effectiveto"
    type = "VARCHAR"
  }

  column {
    name = "_modifiedby"
    type = "VARCHAR"
  }

  column {
    name = "_modified"
    type = "VARCHAR"
  }
}

resource "snowflake_table" "ingest_rbi_referral" {
database            = var.landing
  schema              = "RAINTREE"
  name                = "RBI_REFERRAL"
  change_tracking     = true

  column {
    name = "_id"
    type = "NUMBER(38,0)"
  }

  column {
    name = "ReferralCode"
    type = "VARCHAR"
  }

  column {
    name = "ReferralFirst"
    type = "VARCHAR"
  }

  column {
    name = "ReferralLast"
    type = "VARCHAR"
  }

  column {
    name = "Referralmi"
    type = "VARCHAR"
  }

  column {
    name = "ReferralCredentials"
    type = "VARCHAR"
  }

  column {
    name = "ReferralSpecial"
    type = "VARCHAR"
  }

  column {
    name = "ReferralGroup"
    type = "VARCHAR"
  }

  column {
    name = "ReferralOrg"
    type = "VARCHAR"
  }

  column {
    name = "ReferralAddr"
    type = "VARCHAR"
  }

  column {
    name = "ReferralAddr2"
    type = "VARCHAR"
  }

  column {
    name = "ReferralCity"
    type = "VARCHAR"
  }

  column {
    name = "ReferralState"
    type = "VARCHAR"
  }

  column {
    name = "ReferralZip"
    type = "VARCHAR"
  }

  column {
    name = "Referralphone1"
    type = "VARCHAR"
  }

  column {
    name = "Referralphone2"
    type = "VARCHAR"
  }

  column {
    name = "Referralphone3"
    type = "VARCHAR"
  }

  column {
    name = "ReferralContact"
    type = "VARCHAR"
  }

  column {
    name = "Referralemail"
    type = "VARCHAR"
  }

  column {
    name = "Referralpassword"
    type = "VARCHAR"
  }

  column {
    name = "lic1"
    type = "VARCHAR"
  }

  column {
    name = "lic2"
    type = "VARCHAR"
  }

  column {
    name = "lic3"
    type = "VARCHAR"
  }

  column {
    name = "lic4"
    type = "VARCHAR"
  }

  column {
    name = "taxcode"
    type = "VARCHAR"
  }

  column {
    name = "taxid"
    type = "VARCHAR"
  }

  column {
    name = "ReferralName"
    type = "VARCHAR"
  }
}

resource "snowflake_table" "ingest_z_rbi_referral" {
database            = var.landing
  schema              = "RAINTREE"
  name                = "Z_RBI_REFERRAL"
  change_tracking     = true

  column {
    name = "_id"
    type = "NUMBER(38,0)"
  }

  column {
    name = "ReferralCode"
    type = "VARCHAR"
  }

  column {
    name = "ReferralFirst"
    type = "VARCHAR"
  }

  column {
    name = "ReferralLast"
    type = "VARCHAR"
  }

  column {
    name = "Referralmi"
    type = "VARCHAR"
  }

  column {
    name = "ReferralCredentials"
    type = "VARCHAR"
  }

  column {
    name = "ReferralSpecial"
    type = "VARCHAR"
  }

  column {
    name = "ReferralGroup"
    type = "VARCHAR"
  }

  column {
    name = "ReferralOrg"
    type = "VARCHAR"
  }

  column {
    name = "ReferralAddr"
    type = "VARCHAR"
  }

  column {
    name = "ReferralAddr2"
    type = "VARCHAR"
  }

  column {
    name = "ReferralCity"
    type = "VARCHAR"
  }

  column {
    name = "ReferralState"
    type = "VARCHAR"
  }

  column {
    name = "ReferralZip"
    type = "VARCHAR"
  }

  column {
    name = "Referralphone1"
    type = "VARCHAR"
  }

  column {
    name = "Referralphone2"
    type = "VARCHAR"
  }

  column {
    name = "Referralphone3"
    type = "VARCHAR"
  }

  column {
    name = "ReferralContact"
    type = "VARCHAR"
  }

  column {
    name = "Referralemail"
    type = "VARCHAR"
  }

  column {
    name = "Referralpassword"
    type = "VARCHAR"
  }

  column {
    name = "lic1"
    type = "VARCHAR"
  }

  column {
    name = "lic2"
    type = "VARCHAR"
  }

  column {
    name = "lic3"
    type = "VARCHAR"
  }

  column {
    name = "lic4"
    type = "VARCHAR"
  }

  column {
    name = "taxcode"
    type = "VARCHAR"
  }

  column {
    name = "taxid"
    type = "VARCHAR"
  }

  column {
    name = "ReferralName"
    type = "VARCHAR"
  }
}

resource "snowflake_table" "ingest_rbi_scheduler" {
database            = var.landing
  schema              = "RAINTREE"
  name                = "RBI_SCHEDULER"
  change_tracking     = true

  column {
    name = "id"
    type = "NUMBER(38,0)"
  }

  column {
    name = "AppointGuid"
    type = "VARCHAR"
  }

  column {
    name = "CreateDate"
    type = "VARCHAR"
  }

  column {
    name = "CreateDateTime"
    type = "VARCHAR"
  }

  column {
    name = "ActionUser"
    type = "VARCHAR"
  }

  column {
    name = "ActionDateTime"
    type = "VARCHAR"
  }

  column {
    name = "AppointmentDate"
    type = "VARCHAR"
  }

  column {
    name = "RescheduleAppointmentDate"
    type = "VARCHAR"
  }

  column {
    name = "AppointmentTime"
    type = "VARCHAR"
  }

  column {
    name = "AppointmentDateTime"
    type = "VARCHAR"
  }

  column {
    name = "AppointmentType"
    type = "VARCHAR"
  }

  column {
    name = "Pn"
    type = "VARCHAR"
  }

  column {
    name = "PatientName"
    type = "VARCHAR"
  }

  column {
    name = "ProviderCode"
    type = "VARCHAR"
  }

  column {
    name = "Owner"
    type = "VARCHAR"
  }

  column {
    name = "LocationCode"
    type = "VARCHAR"
  }

  column {
    name = "ReferralCode"
    type = "VARCHAR"
  }

  column {
    name = "AppStatus"
    type = "VARCHAR"
  }

  column {
    name = "CheckIn"
    type = "VARCHAR"
  }

  column {
    name = "CheckOut"
    type = "VARCHAR"
  }

  column {
    name = "CancelReason"
    type = "VARCHAR"
  }

  column {
    name = "CancelComment"
    type = "VARCHAR"
  }

  column {
    name = "CaseIndex"
    type = "VARCHAR"
  }

  column {
    name = "CaseCode"
    type = "VARCHAR"
  }

  column {
    name = "CasePrefix"
    type = "VARCHAR"
  }

  column {
    name = "Minutes"
    type = "VARCHAR"
  }

  column {
    name = "LastMinuteReSchedule"
    type = "VARCHAR"
  }

  column {
    name = "LastMinuteCancel"
    type = "VARCHAR"
  }

  column {
    name = "NewPatientAppoint"
    type = "VARCHAR"
  }

  column {
    name = "HistoryRecord"
    type = "VARCHAR"
  }

  column {
    name = "TicketIndex"
    type = "VARCHAR"
  }

  column {
    name = "isSigned"
    type = "VARCHAR"
  }

  column {
    name = "requiresCosign"
    type = "VARCHAR"
  }

  column {
    name = "appointmentComment"
    type = "VARCHAR"
  }

  column {
    name = "signDate"
    type = "VARCHAR"
  }

  
  column {
    name = "CreatedBy"
    type = "VARCHAR"
  }

  column {
    name = "noteDesc"
    type = "VARCHAR"
  }

  column {
    name = "paidIcon"
    type = "VARCHAR"
  }

  column {
    name = "icon"
    type = "VARCHAR"
  }
}

resource "snowflake_table" "ingest_z_rbi_scheduler" {
database            = var.landing
  schema              = "RAINTREE"
  name                = "Z_RBI_SCHEDULER"
  change_tracking     = true

  column {
    name = "id"
    type = "NUMBER(38,0)"
  }

  column {
    name = "AppointGuid"
    type = "VARCHAR"
  }

  column {
    name = "CreateDate"
    type = "VARCHAR"
  }

  column {
    name = "CreateDateTime"
    type = "VARCHAR"
  }

  column {
    name = "ActionUser"
    type = "VARCHAR"
  }

  column {
    name = "ActionDateTime"
    type = "VARCHAR"
  }

  column {
    name = "AppointmentDate"
    type = "VARCHAR"
  }

  column {
    name = "RescheduleAppointmentDate"
    type = "VARCHAR"
  }

  column {
    name = "AppointmentTime"
    type = "VARCHAR"
  }

  column {
    name = "AppointmentDateTime"
    type = "VARCHAR"
  }

  column {
    name = "AppointmentType"
    type = "VARCHAR"
  }

  column {
    name = "Pn"
    type = "VARCHAR"
  }

  column {
    name = "PatientName"
    type = "VARCHAR"
  }

  column {
    name = "ProviderCode"
    type = "VARCHAR"
  }

  column {
    name = "Owner"
    type = "VARCHAR"
  }

  column {
    name = "LocationCode"
    type = "VARCHAR"
  }

  column {
    name = "ReferralCode"
    type = "VARCHAR"
  }

  column {
    name = "AppStatus"
    type = "VARCHAR"
  }

  column {
    name = "CheckIn"
    type = "VARCHAR"
  }

  column {
    name = "CheckOut"
    type = "VARCHAR"
  }

  column {
    name = "CancelReason"
    type = "VARCHAR"
  }

  column {
    name = "CancelComment"
    type = "VARCHAR"
  }

  column {
    name = "CaseIndex"
    type = "VARCHAR"
  }

  column {
    name = "CaseCode"
    type = "VARCHAR"
  }

  column {
    name = "CasePrefix"
    type = "VARCHAR"
  }

  column {
    name = "Minutes"
    type = "VARCHAR"
  }

  column {
    name = "LastMinuteReSchedule"
    type = "VARCHAR"
  }

    column {
    name = "LastMinuteCancel"
    type = "VARCHAR"
  }

  column {
    name = "NewPatientAppoint"
    type = "VARCHAR"
  }

  column {
    name = "HistoryRecord"
    type = "VARCHAR"
  }

  column {
    name = "TicketIndex"
    type = "VARCHAR"
  }

  column {
    name = "isSigned"
    type = "VARCHAR"
  }

  column {
    name = "requiresCosign"
    type = "VARCHAR"
  }

  column {
    name = "appointmentComment"
    type = "VARCHAR"
  }

  column {
    name = "signDate"
    type = "VARCHAR"
  }

  
  column {
    name = "CreatedBy"
    type = "VARCHAR"
  }

  column {
    name = "noteDesc"
    type = "VARCHAR"
  }

  column {
    name = "paidIcon"
    type = "VARCHAR"
  }

  column {
    name = "icon"
    type = "VARCHAR"
  }
}

resource "snowflake_table" "ingest_rbi_patient" {
database            = var.landing
  schema              = "RAINTREE"
  name                = "RBI_PATIENT"
  change_tracking     = true

  column {
    name = "id"
    type = "VARCHAR"
  }

  column {
    name = "PatientName"
    type = "VARCHAR"
  }

  column {
    name = "PatientFirst"
    type = "VARCHAR"
  }

  column {
    name = "PatientMiddle"
    type = "VARCHAR"
  }

  column {
    name = "PatientLast"
    type = "VARCHAR"
  }

  column {
    name = "PatientDate"
    type = "VARCHAR"
  }

  column {
    name = "PatientPn"
    type = "VARCHAR"
  }

  column {
    name = "PatientCity"
    type = "VARCHAR"
  }

  column {
    name = "PatientState"
    type = "VARCHAR"
  }

  column {
    name = "PatientZip"
    type = "VARCHAR"
  }

  column {
    name = "PatientDob"
    type = "VARCHAR"
  }

  column {
    name = "PatientSex"
    type = "VARCHAR"
  }

  column {
    name = "PatientFC"
    type = "VARCHAR"
  }

  column {
    name = "PatientPrcode"
    type = "VARCHAR"
  }

  column {
    name = "PatientRefs"
    type = "VARCHAR"
  }

  column {
    name = "PatientTphys"
    type = "VARCHAR"
  }

  column {
    name = "PatientStatus"
    type = "VARCHAR"
  }

  column {
    name = "PatientLoc"
    type = "VARCHAR"
  }

  column {
    name = "PatientEemp"
    type = "VARCHAR"
  }

  column {
    name = "PatientOccupation"
    type = "VARCHAR"
  }

  column {
    name = "PatientMonthc"
    type = "VARCHAR"
  }

  column {
    name = "ProviderOneID"
    type = "VARCHAR"
  }

  column {
    name = "PatientHasSSN"
    type = "VARCHAR"
  }

  column {
    name = "PatientHasAddress"
    type = "VARCHAR"
  }

  column {
    name = "PatientHasFirstN"
    type = "VARCHAR"
  }

  column {
    name = "PatientHasLastN"
    type = "VARCHAR"
  }

  column {
    name = "PatientHasPhoneH"
    type = "VARCHAR"
  }

  column {
    name = "PatientHasPhoneW"
    type = "VARCHAR"
  }

  column {
    name = "PatientHasPhoneC"
    type = "VARCHAR"
  }

  column {
    name = "PreferredPhone"
    type = "VARCHAR"
  }

  column {
    name = "PatientHasEmail"
    type = "VARCHAR"
  }

  column {
    name = "PatientHasPsw"
    type = "VARCHAR"
  }

  column {
    name = "PatientHasPO"
    type = "VARCHAR"
  }
}

resource "snowflake_table" "ingest_rbi_patient_stage" {
database            = var.landing
  schema              = "RAINTREE"
  name                = "Z_RBI_PATIENT"
  change_tracking     = true

  column {
    name = "id"
    type = "VARCHAR"
  }

  column {
    name = "PatientName"
    type = "VARCHAR"
  }

  column {
    name = "PatientFirst"
    type = "VARCHAR"
  }

  column {
    name = "PatientMiddle"
    type = "VARCHAR"
  }

  column {
    name = "PatientLast"
    type = "VARCHAR"
  }

  column {
    name = "PatientDate"
    type = "VARCHAR"
  }

  column {
    name = "PatientPn"
    type = "VARCHAR"
  }

  column {
    name = "PatientCity"
    type = "VARCHAR"
  }

  column {
    name = "PatientState"
    type = "VARCHAR"
  }

  column {
    name = "PatientZip"
    type = "VARCHAR"
  }

  column {
    name = "PatientDob"
    type = "VARCHAR"
  }

  column {
    name = "PatientSex"
    type = "VARCHAR"
  }

  column {
    name = "PatientFC"
    type = "VARCHAR"
  }

  column {
    name = "PatientPrcode"
    type = "VARCHAR"
  }

  column {
    name = "PatientRefs"
    type = "VARCHAR"
  }

  column {
    name = "PatientTphys"
    type = "VARCHAR"
  }

  column {
    name = "PatientStatus"
    type = "VARCHAR"
  }

  column {
    name = "PatientLoc"
    type = "VARCHAR"
  }

  column {
    name = "PatientEemp"
    type = "VARCHAR"
  }

  column {
    name = "PatientOccupation"
    type = "VARCHAR"
  }

  column {
    name = "PatientMonthc"
    type = "VARCHAR"
  }

  column {
    name = "ProviderOneID"
    type = "VARCHAR"
  }

  column {
    name = "PatientHasSSN"
    type = "VARCHAR"
  }

  column {
    name = "PatientHasAddress"
    type = "VARCHAR"
  }

  column {
    name = "PatientHasFirstN"
    type = "VARCHAR"
  }

  column {
    name = "PatientHasLastN"
    type = "VARCHAR"
  }

  column {
    name = "PatientHasPhoneH"
    type = "VARCHAR"
  }

  column {
    name = "PatientHasPhoneW"
    type = "VARCHAR"
  }

  column {
    name = "PatientHasPhoneC"
    type = "VARCHAR"
  }

  column {
    name = "PreferredPhone"
    type = "VARCHAR"
  }

  column {
    name = "PatientHasEmail"
    type = "VARCHAR"
  }

  column {
    name = "PatientHasPsw"
    type = "VARCHAR"
  }

  column {
    name = "PatientHasPO"
    type = "VARCHAR"
  }
}

resource "snowflake_table" "ingest_rbi_provider" {
database            = var.landing
  schema              = "RAINTREE"
  name                = "RBI_PROVIDER"
  change_tracking     = true

  column {
    name = "_id"
    type = "NUMBER(38,0)"
  }

  column {
    name = "ProviderCode"
    type = "VARCHAR"
  }

  column {
    name = "ProviderFirst"
    type = "VARCHAR"
  }

  column {
    name = "ProviderLast"
    type = "VARCHAR"
  }

  column {
    name = "mi"
    type = "VARCHAR"
  }

  column {
    name = "ProviderCredentials"
    type = "VARCHAR"
  }

  column {
    name = "ProviderAddr"
    type = "VARCHAR"
  }

  column {
    name = "ProviderCity"
    type = "VARCHAR"
  }

  column {
    name = "ProviderState"
    type = "VARCHAR"
  }

  column {
    name = "ProviderZip"
    type = "VARCHAR"
  }

  column {
    name = "ProviderPhone"
    type = "VARCHAR"
  }

  column {
    name = "ProviderCell"
    type = "VARCHAR"
  }

  column {
    name = "ProviderFax"
    type = "VARCHAR"
  }

  column {
    name = "ProviderEmail"
    type = "VARCHAR"
  }

  column {
    name = "Providerlic1"
    type = "VARCHAR"
  }

  column {
    name = "Providerlic2"
    type = "VARCHAR"
  }

  column {
    name = "Providerlic3"
    type = "VARCHAR"
  }

  column {
    name = "Providerlic4"
    type = "VARCHAR"
  }

  column {
    name = "ProviderTaxid"
    type = "VARCHAR"
  }

  column {
    name = "ProviderGuid"
    type = "VARCHAR"
  }

  column {
    name = "ProviderTxnmycode"
    type = "VARCHAR"
  }

  column {
    name = "ProviderGtxnmycode"
    type = "VARCHAR"
  }

  column {
    name = "ProviderCategory"
    type = "VARCHAR"
  }

  column {
    name = "ProviderName"
    type = "VARCHAR"
  }

  column {
    name = "SupressBillingUntil"
    type = "DATE"
  }

  column {
    name = "EffectiveTo"
    type = "DATE"
  }
}

resource "snowflake_table" "ingest_rbi_provider_stage" {
database            = var.landing
  schema              = "RAINTREE"
  name                = "Z_RBI_PROVIDER"
  change_tracking     = true

  column {
    name = "_id"
    type = "NUMBER(38,0)"
  }

  column {
    name = "ProviderCode"
    type = "VARCHAR"
  }

  column {
    name = "ProviderFirst"
    type = "VARCHAR"
  }

  column {
    name = "ProviderLast"
    type = "VARCHAR"
  }

  column {
    name = "mi"
    type = "VARCHAR"
  }

  column {
    name = "ProviderCredentials"
    type = "VARCHAR"
  }

  column {
    name = "ProviderAddr"
    type = "VARCHAR"
  }

  column {
    name = "ProviderCity"
    type = "VARCHAR"
  }

  column {
    name = "ProviderState"
    type = "VARCHAR"
  }

  column {
    name = "ProviderZip"
    type = "VARCHAR"
  }

  column {
    name = "ProviderPhone"
    type = "VARCHAR"
  }

  column {
    name = "ProviderCell"
    type = "VARCHAR"
  }

  column {
    name = "ProviderFax"
    type = "VARCHAR"
  }

  column {
    name = "ProviderEmail"
    type = "VARCHAR"
  }

  column {
    name = "Providerlic1"
    type = "VARCHAR"
  }

  column {
    name = "Providerlic2"
    type = "VARCHAR"
  }

  column {
    name = "Providerlic3"
    type = "VARCHAR"
  }

  column {
    name = "Providerlic4"
    type = "VARCHAR"
  }

  column {
    name = "ProviderTaxid"
    type = "VARCHAR"
  }

  column {
    name = "ProviderGuid"
    type = "VARCHAR"
  }

  column {
    name = "ProviderTxnmycode"
    type = "VARCHAR"
  }

  column {
    name = "ProviderGtxnmycode"
    type = "VARCHAR"
  }

  column {
    name = "ProviderCategory"
    type = "VARCHAR"
  }

  column {
    name = "ProviderName"
    type = "VARCHAR"
  }

  column {
    name = "SupressBillingUntil"
    type = "DATE"
  }

  column {
    name = "EffectiveTo"
    type = "DATE"
  }
}

resource "snowflake_table" "ingest_ivy_locations_report_export" {
database            = var.landing
  schema              = "RAINTREE"
  name                = "IVY_LOCATIONS_REPORT_EXPORT"
  change_tracking     = true

  column {
    name = "LocationCode"
    type = "VARCHAR"
  }

  column {
    name = "LocationName"
    type = "VARCHAR"
  }

  column {
    name = "AccountingCode"
    type = "VARCHAR"
  }

  column {
    name = "AccountingName"
    type = "VARCHAR"
  }

  column {
    name = "DepartmentCode"
    type = "VARCHAR"
  }

  column {
    name = "LocationAddress"
    type = "VARCHAR"
  }

  column {
    name = "LocationCity"
    type = "VARCHAR"
  }

  column {
    name = "LocationState"
    type = "VARCHAR"
  }

  column {
    name = "LocationZip"
    type = "VARCHAR"
  }

  column {
    name = "LocationTerritory"
    type = "VARCHAR"
  }

  column {
    name = "LocationRegion"
    type = "VARCHAR"
  }

  column {
    name = "LocationArea"
    type = "VARCHAR"
  }

  column {
    name = "LocationTaxID"
    type = "VARCHAR"
  }

  column {
    name = "LocationNPI"
    type = "VARCHAR"
  }

  column {
    name = "goLiveDate"
    type = "VARCHAR"
  }

  column {
    name = "effectiveto"
    type = "VARCHAR"
  }

  column {
    name = "LocationBillingName"
    type = "VARCHAR"
  }

  column {
    name = "LocationStatementName"
    type = "VARCHAR"
  }

  column {
    name = "GreatPlainsID"
    type = "VARCHAR"
  }
}

resource "snowflake_table" "ingest_z_ivy_locations_report_export" {
database            = var.landing
  schema              = "RAINTREE"
  name                = "Z_IVY_LOCATIONS_REPORT_EXPORT"
  change_tracking     = true

  column {
    name = "LocationCode"
    type = "VARCHAR"
  }

  column {
    name = "LocationName"
    type = "VARCHAR"
  }

  column {
    name = "AccountingCode"
    type = "VARCHAR"
  }

  column {
    name = "AccountingName"
    type = "VARCHAR"
  }

  column {
    name = "DepartmentCode"
    type = "VARCHAR"
  }

  column {
    name = "LocationAddress"
    type = "VARCHAR"
  }

  column {
    name = "LocationCity"
    type = "VARCHAR"
  }

  column {
    name = "LocationState"
    type = "VARCHAR"
  }

  column {
    name = "LocationZip"
    type = "VARCHAR"
  }

  column {
    name = "LocationTerritory"
    type = "VARCHAR"
  }

  column {
    name = "LocationRegion"
    type = "VARCHAR"
  }

  column {
    name = "LocationArea"
    type = "VARCHAR"
  }

  column {
    name = "LocationTaxID"
    type = "VARCHAR"
  }

  column {
    name = "LocationNPI"
    type = "VARCHAR"
  }

  column {
    name = "goLiveDate"
    type = "VARCHAR"
  }

  column {
    name = "effectiveto"
    type = "VARCHAR"
  }

  column {
    name = "LocationBillingName"
    type = "VARCHAR"
  }

  column {
    name = "LocationStatementName"
    type = "VARCHAR"
  }

  column {
    name = "GreatPlainsID"
    type = "VARCHAR"
  }
}

resource "snowflake_table" "ingest_active_schedules" {
database            = var.landing
  schema              = "RAINTREE"
  name                = "ACTIVE_SCHEDULES"
  change_tracking     = true

  column {
    name = "_id"
    type = "NUMBER(38,0)"
  }

  column {
    name = "_Date"
    type = "VARCHAR"
  }

  column {
    name = "_Start"
    type = "VARCHAR"
  }

  column {
    name = "Len"
    type = "VARCHAR"
  }

  column {
    name = "TimeUnit"
    type = "VARCHAR"
  }

  column {
    name = "DoubleBook"
    type = "VARCHAR"
  }

  column {
    name = "Doc"
    type = "VARCHAR"
  }

  column {
    name = "Loc"
    type = "VARCHAR"
  }

  column {
    name = "_Type"
    type = "VARCHAR"
  }

  column {
    name = "Typed"
    type = "VARCHAR"
  }

  column {
    name = "Defdoc"
    type = "VARCHAR"
  }

  column {
    name = "Defloc"
    type = "VARCHAR"
  }

  column {
    name = "Com"
    type = "VARCHAR"
  }

  column {
    name = "Wsid"
    type = "VARCHAR"
  }

  column {
    name = "Lastmodiftime"
    type = "VARCHAR"
  }

  column {
    name = "Lastmodifuser"
    type = "VARCHAR"
  }
}

resource "snowflake_table" "ingest_z_active_schedules" {
database            = var.landing
  schema              = "RAINTREE"
  name                = "Z_ACTIVE_SCHEDULES"
  change_tracking     = true

  column {
    name = "_id"
    type = "NUMBER(38,0)"
  }

  column {
    name = "_Date"
    type = "VARCHAR"
  }

  column {
    name = "_Start"
    type = "VARCHAR"
  }

  column {
    name = "Len"
    type = "VARCHAR"
  }

  column {
    name = "TimeUnit"
    type = "VARCHAR"
  }

  column {
    name = "DoubleBook"
    type = "VARCHAR"
  }

  column {
    name = "Doc"
    type = "VARCHAR"
  }

  column {
    name = "Loc"
    type = "VARCHAR"
  }

  column {
    name = "_Type"
    type = "VARCHAR"
  }

  column {
    name = "Typed"
    type = "VARCHAR"
  }

  column {
    name = "Defdoc"
    type = "VARCHAR"
  }

  column {
    name = "Defloc"
    type = "VARCHAR"
  }

  column {
    name = "Com"
    type = "VARCHAR"
  }

  column {
    name = "Wsid"
    type = "VARCHAR"
  }

  column {
    name = "Lastmodiftime"
    type = "VARCHAR"
  }

  column {
    name = "Lastmodifuser"
    type = "VARCHAR"
  }
}

resource "snowflake_table" "ingest_rbi_visit_insur" {
database            = var.landing
  schema              = "RAINTREE"
  name                = "RBI_VISIT_INSUR"
  change_tracking     = true

  column {
    name = "id"
    type = "VARCHAR"
  }

  column {
    name = "pn"
    type = "VARCHAR"
  }

  column {
    name = "ticket_index"
    type = "VARCHAR"
  }

  column {
    name = "dos"
    type = "VARCHAR"
  }

  column {
    name = "insurance_code"
    type = "VARCHAR"
  }
}

resource "snowflake_table" "ingest_z_rbi_visit_insur" {
database            = var.landing
  schema              = "RAINTREE"
  name                = "Z_RBI_VISIT_INSUR"
  change_tracking     = true

  column {
    name = "id"
    type = "VARCHAR"
  }

  column {
    name = "pn"
    type = "VARCHAR"
  }

  column {
    name = "ticket_index"
    type = "VARCHAR"
  }

  column {
    name = "dos"
    type = "VARCHAR"
  }

  column {
    name = "insurance_code"
    type = "VARCHAR"
  }
}

resource "snowflake_table" "ingest_rbi_visit" {
database            = var.landing
  schema              = "RAINTREE"
  name                = "RBI_VISIT"
  change_tracking     = true

  column {
    name = "id"
    type = "VARCHAR"
  }

  column {
    name = "pn"
    type = "VARCHAR"
  }

  column {
    name = "casecode"
    type = "VARCHAR"
  }

  column {
    name = "discipline"
    type = "VARCHAR"
  }

  column {
    name = "ticketindex"
    type = "VARCHAR"
  }

  column {
    name = "caseindex"
    type = "VARCHAR"
  }

  column {
    name = "DOS"
    type = "VARCHAR"
  }

  column {
    name = "noteOpenDateTime"
    type = "VARCHAR"
  }

  column {
    name = "intime"
    type = "VARCHAR"
  }

  column {
    name = "outtime"
    type = "VARCHAR"
  }

  column {
    name = "diag1"
    type = "VARCHAR"
  }

  column {
    name = "diag2"
    type = "VARCHAR"
  }

  column {
    name = "diag3"
    type = "VARCHAR"
  }

  column {
    name = "diag4"
    type = "VARCHAR"
  }

  column {
    name = "diag5"
    type = "VARCHAR"
  }

  column {
    name = "diag6"
    type = "VARCHAR"
  }

  column {
    name = "diag7"
    type = "VARCHAR"
  }

  column {
    name = "diag8"
    type = "VARCHAR"
  }

  column {
    name = "diag9"
    type = "VARCHAR"
  }

  column {
    name = "diag10"
    type = "VARCHAR"
  }

  column {
    name = "diag11"
    type = "VARCHAR"
  }

  column {
    name = "diag12"
    type = "VARCHAR"
  }

  column {
    name = "primaryIns"
    type = "VARCHAR"
  }

  column {
    name = "primaryInsGuid"
    type = "VARCHAR"
  }

  column {
    name = "primaryFC"
    type = "VARCHAR"
  }

  column {
    name = "secIns"
    type = "VARCHAR"
  }

  column {
    name = "secInsGuid"
    type = "VARCHAR"
  }

  column {
    name = "secFC"
    type = "VARCHAR"
  }

  column {
    name = "location"
    type = "VARCHAR"
  }

  column {
    name = "provider"
    type = "VARCHAR"
  }

  column {
    name = "billingprovider"
    type = "VARCHAR"
  }

  column {
    name = "referral"
    type = "VARCHAR"
  }

  column {
    name = "owner"
    type = "VARCHAR"
  }

  column {
    name = "cosigner"
    type = "VARCHAR"
  }

  column {
    name = "minutes"
    type = "VARCHAR"
  }
  
  column {
    name = "nonbillmins"
    type = "VARCHAR"
  }

  column {
    name = "billablemins"
    type = "VARCHAR"
  }

  column {
    name = "untimed"
    type = "VARCHAR"
  }

  column {
    name = "units"
    type = "VARCHAR"
  }

  column {
    name = "appStatus"
    type = "VARCHAR"
  }

  column {
    name = "appointmentType"
    type = "VARCHAR"
  }
  
  column {
    name = "billedCharges"
    type = "VARCHAR"
  }

  column {
    name = "expectedCharges"
    type = "VARCHAR"
  }

  column {
    name = "noserviceticket"
    type = "VARCHAR"
  }

  column {
    name = "notetype"
    type = "VARCHAR"
  }

  column {
    name = "novisit"
    type = "VARCHAR"
  }

  column {
    name = "postingdate"
    type = "VARCHAR"
  }

  column {
    name = "isSigned"
    type = "VARCHAR"
  }

  column {
    name = "isAmendment"
    type = "VARCHAR"
  }

  column {
    name = "billingreview"
    type = "VARCHAR"
  }

  column {
    name = "copayMissingReason"
    type = "VARCHAR"
  }

  column {
    name = "copayMissingComment"
    type = "VARCHAR"
  }

  column {
    name = "currentSurgeryDate"
    type = "VARCHAR"
  }

  column {
    name = "currentSurgeryDetails"
    type = "VARCHAR"
  }

  column {
    name = "authguid"
    type = "VARCHAR"
  }

  column {
    name = "signDate"
    type = "VARCHAR"
  }

  column {
    name = "originalsigndate"
    type = "VARCHAR"
  }

  column {
    name = "cosignrequired"
    type = "VARCHAR"
  }

  column {
    name = "used"
    type = "VARCHAR"
  }

  column {
    name = "icopay"
    type = "VARCHAR"
  }

  column {
    name = "skippedProcedureReason"
    type = "VARCHAR"
  }

  column {
    name = "FotoNotReq"
    type = "VARCHAR"
  }

  column {
    name = "limberCreated"
    type = "VARCHAR"
  }

  column {
    name = "noLimReason"
    type = "VARCHAR"
  }

  column {
    name = "templ"
    type = "VARCHAR"
  }
}

resource "snowflake_table" "ingest_z_rbi_visit" {
database            = var.landing
  schema              = "RAINTREE"
  name                = "Z_RBI_VISIT"
  change_tracking     = true

  column {
    name = "id"
    type = "VARCHAR"
  }

  column {
    name = "pn"
    type = "VARCHAR"
  }

  column {
    name = "casecode"
    type = "VARCHAR"
  }

  column {
    name = "discipline"
    type = "VARCHAR"
  }

  column {
    name = "ticketindex"
    type = "VARCHAR"
  }

  column {
    name = "caseindex"
    type = "VARCHAR"
  }

  column {
    name = "DOS"
    type = "VARCHAR"
  }

  column {
    name = "noteOpenDateTime"
    type = "VARCHAR"
  }

  column {
    name = "intime"
    type = "VARCHAR"
  }

  column {
    name = "outtime"
    type = "VARCHAR"
  }

  column {
    name = "diag1"
    type = "VARCHAR"
  }

  column {
    name = "diag2"
    type = "VARCHAR"
  }

  column {
    name = "diag3"
    type = "VARCHAR"
  }

  column {
    name = "diag4"
    type = "VARCHAR"
  }

  column {
    name = "diag5"
    type = "VARCHAR"
  }

  column {
    name = "diag6"
    type = "VARCHAR"
  }

  column {
    name = "diag7"
    type = "VARCHAR"
  }

  column {
    name = "diag8"
    type = "VARCHAR"
  }

  column {
    name = "diag9"
    type = "VARCHAR"
  }

  column {
    name = "diag10"
    type = "VARCHAR"
  }

  column {
    name = "diag11"
    type = "VARCHAR"
  }

  column {
    name = "diag12"
    type = "VARCHAR"
  }

  column {
    name = "primaryIns"
    type = "VARCHAR"
  }

  column {
    name = "primaryInsGuid"
    type = "VARCHAR"
  }

  column {
    name = "primaryFC"
    type = "VARCHAR"
  }

  column {
    name = "secIns"
    type = "VARCHAR"
  }

  column {
    name = "secInsGuid"
    type = "VARCHAR"
  }

  column {
    name = "secFC"
    type = "VARCHAR"
  }

  column {
    name = "location"
    type = "VARCHAR"
  }

  column {
    name = "provider"
    type = "VARCHAR"
  }

  column {
    name = "billingprovider"
    type = "VARCHAR"
  }

  column {
    name = "referral"
    type = "VARCHAR"
  }

  column {
    name = "owner"
    type = "VARCHAR"
  }

  column {
    name = "cosigner"
    type = "VARCHAR"
  }

  column {
    name = "minutes"
    type = "VARCHAR"
  }
  
  column {
    name = "nonbillmins"
    type = "VARCHAR"
  }

  column {
    name = "billablemins"
    type = "VARCHAR"
  }

  column {
    name = "untimed"
    type = "VARCHAR"
  }

  column {
    name = "units"
    type = "VARCHAR"
  }

  column {
    name = "appStatus"
    type = "VARCHAR"
  }

  column {
    name = "appointmentType"
    type = "VARCHAR"
  }
  
  column {
    name = "billedCharges"
    type = "VARCHAR"
  }

  column {
    name = "expectedCharges"
    type = "VARCHAR"
  }

  column {
    name = "noserviceticket"
    type = "VARCHAR"
  }

  column {
    name = "notetype"
    type = "VARCHAR"
  }

  column {
    name = "novisit"
    type = "VARCHAR"
  }

  column {
    name = "postingdate"
    type = "VARCHAR"
  }

  column {
    name = "isSigned"
    type = "VARCHAR"
  }

  column {
    name = "isAmendment"
    type = "VARCHAR"
  }

  column {
    name = "billingreview"
    type = "VARCHAR"
  }

  column {
    name = "copayMissingReason"
    type = "VARCHAR"
  }

  column {
    name = "copayMissingComment"
    type = "VARCHAR"
  }

  column {
    name = "currentSurgeryDate"
    type = "VARCHAR"
  }

  column {
    name = "currentSurgeryDetails"
    type = "VARCHAR"
  }

  column {
    name = "authguid"
    type = "VARCHAR"
  }

  column {
    name = "signDate"
    type = "VARCHAR"
  }

  column {
    name = "originalsigndate"
    type = "VARCHAR"
  }

  column {
    name = "cosignrequired"
    type = "VARCHAR"
  }

  column {
    name = "used"
    type = "VARCHAR"
  }

  column {
    name = "icopay"
    type = "VARCHAR"
  }

  column {
    name = "skippedProcedureReason"
    type = "VARCHAR"
  }

  column {
    name = "FotoNotReq"
    type = "VARCHAR"
  }

  column {
    name = "limberCreated"
    type = "VARCHAR"
  }

  column {
    name = "noLimReason"
    type = "VARCHAR"
  }

  column {
    name = "templ"
    type = "VARCHAR"
  }
}


resource "snowflake_table" "ingest_demo_demo" {
database            = var.landing
  schema              = "RAINTREE"
  name                = "DEMO_DEMO"
  change_tracking     = true

  column {
    name = "_id"
    type = "NUMBER(38,0)"
  }

  column {
    name = "_pn"
    type = "VARCHAR"
  }

  column {
    name = "_seq"
    type = "VARCHAR"
  }

  column {
    name = "_code"
    type = "VARCHAR"
  }

  column {
    name = "_desc1"
    type = "VARCHAR"
  }

  column {
    name = "_desc2"
    type = "VARCHAR"
  }

  column {
    name = "_desc3"
    type = "VARCHAR"
  }

  column {
    name = "_desc4"
    type = "VARCHAR"
  }

  column {
    name = "_desc"
    type = "VARCHAR"
  }

  column {
    name = "_myvariabledata"
    type = "VARCHAR"
  }

  column {
    name = "email"
    type = "VARCHAR"
  }

  column {
    name = "v_standard_"
    type = "VARCHAR"
  }

  column {
    name = "_lastmodified_"
    type = "VARCHAR"
  }

  column {
    name = "_timestamp_"
    type = "VARCHAR"
  }

  column {
    name = "cd_title_"
    type = "VARCHAR"
  }

  column {
    name = "cd_best1_"
    type = "VARCHAR"
  }

    column {
    name = "cd_estat_"
    type = "VARCHAR"
  }

  column {
    name = "cd_mstat_"
    type = "VARCHAR"
  }

  column {
    name = "cd_best3_"
    type = "VARCHAR"
  }

  column {
    name = "cd_sstat_"
    type = "VARCHAR"
  }

  column {
    name = "cd_best2_"
    type = "VARCHAR"
  }

  column {
    name = "addr"
    type = "VARCHAR"
  }

  column {
    name = "aliasview"
    type = "VARCHAR"
  }

  column {
    name = "best1"
    type = "VARCHAR"
  }

  column {
    name = "best2"
    type = "VARCHAR"
  }

  column {
    name = "best3"
    type = "VARCHAR"
  }

  column {
    name = "cd_f_best1_"
    type = "VARCHAR"
  }

  column {
    name = "cd_m_best1_"
    type = "VARCHAR"
  }

  column {
    name = "city"
    type = "VARCHAR"
  }

  column {
    name = "dln"
    type = "VARCHAR"
  }

  column {
    name = "dob_"
    type = "VARCHAR"
  }

  column {
    name = "eemp"
    type = "VARCHAR"
  }

  column {
    name = "estat"
    type = "VARCHAR"
  }

  column {
    name = "fc"
    type = "VARCHAR"
  }

  column {
    name = "first_"
    type = "VARCHAR"
  }

  column {
    name = "household"
    type = "VARCHAR"
  }

  column {
    name = "im1"
    type = "VARCHAR"
  }

  column {
    name = "im2"
    type = "VARCHAR"
  }

  column {
    name = "im3"
    type = "VARCHAR"
  }

  column {
    name = "last_"
    type = "VARCHAR"
  }

  column {
    name = "leg"
    type = "VARCHAR"
  }

  column {
    name = "livsit"
    type = "VARCHAR"
  }

  column {
    name = "loc"
    type = "VARCHAR"
  }

  column {
    name = "mi"
    type = "VARCHAR"
  }

  column {
    name = "monthc"
    type = "VARCHAR"
  }

    column {
    name = "mstat"
    type = "VARCHAR"
  }

  column {
    name = "number"
    type = "VARCHAR"
  }

  column {
    name = "occ"
    type = "VARCHAR"
  }

  column {
    name = "ok1"
    type = "VARCHAR"
  }

  column {
    name = "ok2"
    type = "VARCHAR"
  }

  column {
    name = "ok3"
    type = "VARCHAR"
  }

  column {
    name = "othlivsit"
    type = "VARCHAR"
  }

  column {
    name = "password"
    type = "VARCHAR"
  }

  column {
    name = "phaddr"
    type = "VARCHAR"
  }

  column {
    name = "phcity"
    type = "VARCHAR"
  }

  column {
    name = "phone1"
    type = "VARCHAR"
  }

  column {
    name = "phone2"
    type = "VARCHAR"
  }

  column {
    name = "phone3"
    type = "VARCHAR"
  }

  column {
    name = "phstate"
    type = "VARCHAR"
  }

  column {
    name = "phzip"
    type = "VARCHAR"
  }

  column {
    name = "pm1"
    type = "VARCHAR"
  }

  column {
    name = "pm2"
    type = "VARCHAR"
  }

  column {
    name = "pm3"
    type = "VARCHAR"
  }

  column {
    name = "pn_"
    type = "VARCHAR"
  }

  column {
    name = "prcode"
    type = "VARCHAR"
  }

  column {
    name = "recday"
    type = "VARCHAR"
  }

  column {
    name = "recser"
    type = "VARCHAR"
  }

  column {
    name = "refs"
    type = "VARCHAR"
  }

  column {
    name = "semp"
    type = "VARCHAR"
  }

  column {
    name = "sex"
    type = "VARCHAR"
  }

  column {
    name = "socc"
    type = "VARCHAR"
  }

  column {
    name = "sstat"
    type = "VARCHAR"
  }

  column {
    name = "ss_"
    type = "VARCHAR"
  }

  column {
    name = "state"
    type = "VARCHAR"
  }

  column {
    name = "status"
    type = "VARCHAR"
  }

    column {
    name = "title"
    type = "VARCHAR"
  }

  column {
    name = "tob"
    type = "VARCHAR"
  }

  column {
    name = "tphys"
    type = "VARCHAR"
  }

  column {
    name = "zip"
    type = "VARCHAR"
  }

  column {
    name = "_cdate_"
    type = "VARCHAR"
  }

  column {
    name = "_ctimeampm"
    type = "VARCHAR"
  }

  column {
    name = "_culfname"
    type = "VARCHAR"
  }

  column {
    name = "_cuserid"
    type = "VARCHAR"
  }

  column {
    name = "_mdate_"
    type = "VARCHAR"
  }

  column {
    name = "_mtimeampm"
    type = "VARCHAR"
  }

  column {
    name = "_mulfname"
    type = "VARCHAR"
  }

  column {
    name = "_muserid"
    type = "VARCHAR"
  }

  column {
    name = "accessmode"
    type = "VARCHAR"
  }

  column {
    name = "aclhistory"
    type = "VARCHAR"
  }

  column {
    name = "aclview"
    type = "VARCHAR"
  }

  column {
    name = "contlinkfather"
    type = "VARCHAR"
  }

  column {
    name = "contlinkguardian"
    type = "VARCHAR"
  }

  column {
    name = "contlinkmother"
    type = "VARCHAR"
  }

  column {
    name = "contlinkprimaryphysician"
    type = "VARCHAR"
  }

  column {
    name = "contlinkprimaryreferral"
    type = "VARCHAR"
  }

  column {
    name = "country"
    type = "VARCHAR"
  }

  column {
    name = "databasename"
    type = "VARCHAR"
  }

  column {
    name = "date"
    type = "VARCHAR"
  }

  column {
    name = "imgpatient"
    type = "VARCHAR"
  }

  column {
    name = "intneeded"
    type = "VARCHAR"
  }

  column {
    name = "language"
    type = "VARCHAR"
  }

  column {
    name = "lbcontacts"
    type = "VARCHAR"
  }

  column {
    name = "leadid"
    type = "VARCHAR"
  }

  column {
    name = "patpic"
    type = "VARCHAR"
  }

  column {
    name = "patreminder"
    type = "VARCHAR"
  }

  column {
    name = "phcounty"
    type = "VARCHAR"
  }

  column {
    name = "statuscode"
    type = "VARCHAR"
  }

  column {
    name = "viewcases"
    type = "VARCHAR"
  }

  column {
    name = "viewroles"
    type = "VARCHAR"
  }

  column {
    name = "addr2"
    type = "VARCHAR"
  }

  column {
    name = "cd_preflang_"
    type = "VARCHAR"
  }

  column {
    name = "ethn"
    type = "VARCHAR"
  }

  column {
    name = "languintneeded"
    type = "VARCHAR"
  }

  column {
    name = "phaddr2"
    type = "VARCHAR"
  }

  column {
    name = "preflang"
    type = "VARCHAR"
  }

  column {
    name = "primaryrace"
    type = "VARCHAR"
  }

  column {
    name = "contlinkmarkref"
    type = "VARCHAR"
  }

  column {
    name = "mrefs"
    type = "VARCHAR"
  }

  column {
    name = "mrefscat"
    type = "VARCHAR"
  }

  column {
    name = "contlinkpreferredhospital"
    type = "VARCHAR"
  }

  column {
    name = "contlinkpreferredpharmacy"
    type = "VARCHAR"
  }

  column {
    name = "lbpforms"
    type = "VARCHAR"
  }

  column {
    name = "consentrecieved"
    type = "VARCHAR"
  }

  column {
    name = "deceased"
    type = "VARCHAR"
  }

  column {
    name = "military"
    type = "VARCHAR"
  }

  column {
    name = "nonbariatric"
    type = "VARCHAR"
  }

  column {
    name = "selfpay"
    type = "VARCHAR"
  }

  column {
    name = "statusdate"
    type = "VARCHAR"
  }

  column {
    name = "aremail"
    type = "VARCHAR"
  }

  column {
    name = "artext"
    type = "VARCHAR"
  }

  column {
    name = "lwcompr"
    type = "VARCHAR"
  }

  column {
    name = "contlinkcasemanager"
    type = "VARCHAR"
  }

  column {
    name = "dmail"
    type = "VARCHAR"
  }

  column {
    name = "ethnadd1"
    type = "VARCHAR"
  }

  column {
    name = "genderidentity"
    type = "VARCHAR"
  }

  column {
    name = "payordiscmoopused"
    type = "VARCHAR"
  }

  column {
    name = "raceadd1"
    type = "VARCHAR"
  }

  column {
    name = "raceadd2"
    type = "VARCHAR"
  }

  column {
    name = "sexorient"
    type = "VARCHAR"
  }

  column {
    name = "colstat"
    type = "VARCHAR"
  }

  column {
    name = "best4"
    type = "VARCHAR"
  }

  column {
    name = "cd_best4_"
    type = "VARCHAR"
  }

  column {
    name = "ok4"
    type = "VARCHAR"
  }

  column {
    name = "phone4"
    type = "VARCHAR"
  }

  column {
    name = "femp"
    type = "VARCHAR"
  }

  column {
    name = "focc"
    type = "VARCHAR"
  }

  column {
    name = "memp"
    type = "VARCHAR"
  }

  column {
    name = "mocc"
    type = "VARCHAR"
  }

  column {
    name = "contlinkspouse"
    type = "VARCHAR"
  }

  column {
    name = "ethncode"
    type = "VARCHAR"
  }

  column {
    name = "ethngroupcode"
    type = "VARCHAR"
  }

  column {
    name = "ethnicity"
    type = "VARCHAR"
  }

  column {
    name = "prefpronoun"
    type = "VARCHAR"
  }

  column {
    name = "race"
    type = "VARCHAR"
  }

  column {
    name = "racecode"
    type = "VARCHAR"
  }

  column {
    name = "racegroupcode"
    type = "VARCHAR"
  }

  column {
    name = "race_00000"
    type = "VARCHAR"
  }

  column {
    name = "immpublicitydate"
    type = "VARCHAR"
  }

  column {
    name = "immregstatusdate"
    type = "VARCHAR"
  }

  column {
    name = "arphone"
    type = "VARCHAR"
  }

  column {
    name = "firstpn_"
    type = "VARCHAR"
  }

  column {
    name = "preferredname"
    type = "VARCHAR"
  }
}

resource "snowflake_table" "ingest_z_demo_demo" {
database            = var.landing
  schema              = "RAINTREE"
  name                = "Z_DEMO_DEMO"
  change_tracking     = true

  column {
    name = "_id"
    type = "NUMBER(38,0)"
  }

  column {
    name = "_pn"
    type = "VARCHAR"
  }

  column {
    name = "_seq"
    type = "VARCHAR"
  }

  column {
    name = "_code"
    type = "VARCHAR"
  }

  column {
    name = "_desc1"
    type = "VARCHAR"
  }

  column {
    name = "_desc2"
    type = "VARCHAR"
  }

  column {
    name = "_desc3"
    type = "VARCHAR"
  }

  column {
    name = "_desc4"
    type = "VARCHAR"
  }

  column {
    name = "_desc"
    type = "VARCHAR"
  }

  column {
    name = "_myvariabledata"
    type = "VARCHAR"
  }

  column {
    name = "email"
    type = "VARCHAR"
  }

  column {
    name = "v_standard_"
    type = "VARCHAR"
  }

  column {
    name = "_lastmodified_"
    type = "VARCHAR"
  }

  column {
    name = "_timestamp_"
    type = "VARCHAR"
  }

  column {
    name = "cd_title_"
    type = "VARCHAR"
  }

  column {
    name = "cd_best1_"
    type = "VARCHAR"
  }

    column {
    name = "cd_estat_"
    type = "VARCHAR"
  }

  column {
    name = "cd_mstat_"
    type = "VARCHAR"
  }

  column {
    name = "cd_best3_"
    type = "VARCHAR"
  }

  column {
    name = "cd_sstat_"
    type = "VARCHAR"
  }

  column {
    name = "cd_best2_"
    type = "VARCHAR"
  }

  column {
    name = "addr"
    type = "VARCHAR"
  }

  column {
    name = "aliasview"
    type = "VARCHAR"
  }

  column {
    name = "best1"
    type = "VARCHAR"
  }

  column {
    name = "best2"
    type = "VARCHAR"
  }

  column {
    name = "best3"
    type = "VARCHAR"
  }

  column {
    name = "cd_f_best1_"
    type = "VARCHAR"
  }

  column {
    name = "cd_m_best1_"
    type = "VARCHAR"
  }

  column {
    name = "city"
    type = "VARCHAR"
  }

  column {
    name = "dln"
    type = "VARCHAR"
  }

  column {
    name = "dob_"
    type = "VARCHAR"
  }

  column {
    name = "eemp"
    type = "VARCHAR"
  }

  column {
    name = "estat"
    type = "VARCHAR"
  }

  column {
    name = "fc"
    type = "VARCHAR"
  }

  column {
    name = "first_"
    type = "VARCHAR"
  }

  column {
    name = "household"
    type = "VARCHAR"
  }

  column {
    name = "im1"
    type = "VARCHAR"
  }

  column {
    name = "im2"
    type = "VARCHAR"
  }

  column {
    name = "im3"
    type = "VARCHAR"
  }

  column {
    name = "last_"
    type = "VARCHAR"
  }

  column {
    name = "leg"
    type = "VARCHAR"
  }

  column {
    name = "livsit"
    type = "VARCHAR"
  }

  column {
    name = "loc"
    type = "VARCHAR"
  }

  column {
    name = "mi"
    type = "VARCHAR"
  }

  column {
    name = "monthc"
    type = "VARCHAR"
  }

    column {
    name = "mstat"
    type = "VARCHAR"
  }

  column {
    name = "number"
    type = "VARCHAR"
  }

  column {
    name = "occ"
    type = "VARCHAR"
  }

  column {
    name = "ok1"
    type = "VARCHAR"
  }

  column {
    name = "ok2"
    type = "VARCHAR"
  }

  column {
    name = "ok3"
    type = "VARCHAR"
  }

  column {
    name = "othlivsit"
    type = "VARCHAR"
  }

  column {
    name = "password"
    type = "VARCHAR"
  }

  column {
    name = "phaddr"
    type = "VARCHAR"
  }

  column {
    name = "phcity"
    type = "VARCHAR"
  }

  column {
    name = "phone1"
    type = "VARCHAR"
  }

  column {
    name = "phone2"
    type = "VARCHAR"
  }

  column {
    name = "phone3"
    type = "VARCHAR"
  }

  column {
    name = "phstate"
    type = "VARCHAR"
  }

  column {
    name = "phzip"
    type = "VARCHAR"
  }

  column {
    name = "pm1"
    type = "VARCHAR"
  }

  column {
    name = "pm2"
    type = "VARCHAR"
  }

  column {
    name = "pm3"
    type = "VARCHAR"
  }

  column {
    name = "pn_"
    type = "VARCHAR"
  }

  column {
    name = "prcode"
    type = "VARCHAR"
  }

  column {
    name = "recday"
    type = "VARCHAR"
  }

  column {
    name = "recser"
    type = "VARCHAR"
  }

  column {
    name = "refs"
    type = "VARCHAR"
  }

  column {
    name = "semp"
    type = "VARCHAR"
  }

  column {
    name = "sex"
    type = "VARCHAR"
  }

  column {
    name = "socc"
    type = "VARCHAR"
  }

  column {
    name = "sstat"
    type = "VARCHAR"
  }

  column {
    name = "ss_"
    type = "VARCHAR"
  }

  column {
    name = "state"
    type = "VARCHAR"
  }

  column {
    name = "status"
    type = "VARCHAR"
  }

    column {
    name = "title"
    type = "VARCHAR"
  }

  column {
    name = "tob"
    type = "VARCHAR"
  }

  column {
    name = "tphys"
    type = "VARCHAR"
  }

  column {
    name = "zip"
    type = "VARCHAR"
  }

  column {
    name = "_cdate_"
    type = "VARCHAR"
  }

  column {
    name = "_ctimeampm"
    type = "VARCHAR"
  }

  column {
    name = "_culfname"
    type = "VARCHAR"
  }

  column {
    name = "_cuserid"
    type = "VARCHAR"
  }

  column {
    name = "_mdate_"
    type = "VARCHAR"
  }

  column {
    name = "_mtimeampm"
    type = "VARCHAR"
  }

  column {
    name = "_mulfname"
    type = "VARCHAR"
  }

  column {
    name = "_muserid"
    type = "VARCHAR"
  }

  column {
    name = "accessmode"
    type = "VARCHAR"
  }

  column {
    name = "aclhistory"
    type = "VARCHAR"
  }

  column {
    name = "aclview"
    type = "VARCHAR"
  }

  column {
    name = "contlinkfather"
    type = "VARCHAR"
  }

  column {
    name = "contlinkguardian"
    type = "VARCHAR"
  }

  column {
    name = "contlinkmother"
    type = "VARCHAR"
  }

  column {
    name = "contlinkprimaryphysician"
    type = "VARCHAR"
  }

  column {
    name = "contlinkprimaryreferral"
    type = "VARCHAR"
  }

  column {
    name = "country"
    type = "VARCHAR"
  }

  column {
    name = "databasename"
    type = "VARCHAR"
  }

  column {
    name = "date"
    type = "VARCHAR"
  }

  column {
    name = "imgpatient"
    type = "VARCHAR"
  }

  column {
    name = "intneeded"
    type = "VARCHAR"
  }

  column {
    name = "language"
    type = "VARCHAR"
  }

  column {
    name = "lbcontacts"
    type = "VARCHAR"
  }

  column {
    name = "leadid"
    type = "VARCHAR"
  }

  column {
    name = "patpic"
    type = "VARCHAR"
  }

  column {
    name = "patreminder"
    type = "VARCHAR"
  }

  column {
    name = "phcounty"
    type = "VARCHAR"
  }

  column {
    name = "statuscode"
    type = "VARCHAR"
  }

  column {
    name = "viewcases"
    type = "VARCHAR"
  }

  column {
    name = "viewroles"
    type = "VARCHAR"
  }

  column {
    name = "addr2"
    type = "VARCHAR"
  }

  column {
    name = "cd_preflang_"
    type = "VARCHAR"
  }

  column {
    name = "ethn"
    type = "VARCHAR"
  }

  column {
    name = "languintneeded"
    type = "VARCHAR"
  }

  column {
    name = "phaddr2"
    type = "VARCHAR"
  }

  column {
    name = "preflang"
    type = "VARCHAR"
  }

  column {
    name = "primaryrace"
    type = "VARCHAR"
  }

  column {
    name = "contlinkmarkref"
    type = "VARCHAR"
  }

  column {
    name = "mrefs"
    type = "VARCHAR"
  }

  column {
    name = "mrefscat"
    type = "VARCHAR"
  }

  column {
    name = "contlinkpreferredhospital"
    type = "VARCHAR"
  }

  column {
    name = "contlinkpreferredpharmacy"
    type = "VARCHAR"
  }

  column {
    name = "lbpforms"
    type = "VARCHAR"
  }

  column {
    name = "consentrecieved"
    type = "VARCHAR"
  }

  column {
    name = "deceased"
    type = "VARCHAR"
  }

  column {
    name = "military"
    type = "VARCHAR"
  }

  column {
    name = "nonbariatric"
    type = "VARCHAR"
  }

  column {
    name = "selfpay"
    type = "VARCHAR"
  }

  column {
    name = "statusdate"
    type = "VARCHAR"
  }

  column {
    name = "aremail"
    type = "VARCHAR"
  }

  column {
    name = "artext"
    type = "VARCHAR"
  }

  column {
    name = "lwcompr"
    type = "VARCHAR"
  }

  column {
    name = "contlinkcasemanager"
    type = "VARCHAR"
  }

  column {
    name = "dmail"
    type = "VARCHAR"
  }

  column {
    name = "ethnadd1"
    type = "VARCHAR"
  }

  column {
    name = "genderidentity"
    type = "VARCHAR"
  }

  column {
    name = "payordiscmoopused"
    type = "VARCHAR"
  }

  column {
    name = "raceadd1"
    type = "VARCHAR"
  }

  column {
    name = "raceadd2"
    type = "VARCHAR"
  }

  column {
    name = "sexorient"
    type = "VARCHAR"
  }

  column {
    name = "colstat"
    type = "VARCHAR"
  }

  column {
    name = "best4"
    type = "VARCHAR"
  }

  column {
    name = "cd_best4_"
    type = "VARCHAR"
  }

  column {
    name = "ok4"
    type = "VARCHAR"
  }

  column {
    name = "phone4"
    type = "VARCHAR"
  }

  column {
    name = "femp"
    type = "VARCHAR"
  }

  column {
    name = "focc"
    type = "VARCHAR"
  }

  column {
    name = "memp"
    type = "VARCHAR"
  }

  column {
    name = "mocc"
    type = "VARCHAR"
  }

  column {
    name = "contlinkspouse"
    type = "VARCHAR"
  }

  column {
    name = "ethncode"
    type = "VARCHAR"
  }

  column {
    name = "ethngroupcode"
    type = "VARCHAR"
  }

  column {
    name = "ethnicity"
    type = "VARCHAR"
  }

  column {
    name = "prefpronoun"
    type = "VARCHAR"
  }

  column {
    name = "race"
    type = "VARCHAR"
  }

  column {
    name = "racecode"
    type = "VARCHAR"
  }

  column {
    name = "racegroupcode"
    type = "VARCHAR"
  }

  column {
    name = "race_00000"
    type = "VARCHAR"
  }

  column {
    name = "immpublicitydate"
    type = "VARCHAR"
  }

  column {
    name = "immregstatusdate"
    type = "VARCHAR"
  }

  column {
    name = "arphone"
    type = "VARCHAR"
  }

  column {
    name = "firstpn_"
    type = "VARCHAR"
  }

  column {
    name = "preferredname"
    type = "VARCHAR"
  }
}

resource "snowflake_table" "objective_tracking_poc" {
  database            = var.landing
  schema              = "OBJECTIVES_TRACKING"
  name                = "OBJ_TRACKING_KPIS"
  change_tracking     = true

  column {
    name = "date"
    type = "DATE"
  }
  column {
    name = "kpi_name"
    type = "VARCHAR"
  }
  column {
    name = "clinic_id"
    type = "NUMBER(38,0)"
  }
  column {
    name = "granularity"
    type = "VARCHAR"
  }
  column {
    name = "target_value"
    type = "VARCHAR"
  }
  column {
    name = "business_level"
    type = "VARCHAR"
  }
}

resource "snowflake_table" "ingest_visit_ltnot" {
database            = var.landing
  schema              = "RAINTREE"
  name                = "VISIT_LTNOT"
  change_tracking     = true

  column {
    name = "id"
    type = "NUMBER(38,0)"
  }

  column {
    name = "_pn"
    type = "VARCHAR"
  }

  column {
    name = "emrpn"
    type = "VARCHAR"
  }

  column {
    name = "emrprog"
    type = "VARCHAR"
  }

  column {
    name = "emrdate"
    type = "VARCHAR"
  }

  column {
    name = "exemptpedicat"
    type = "VARCHAR"
  }

  column {
    name = "exemptpedicatreason"
    type = "VARCHAR"
  }

  column {
    name = "nonbillable"
    type = "VARCHAR"
  }

  column {
    name = "noserviceticket"
    type = "VARCHAR"
  }

  column {
    name = "novisit"
    type = "VARCHAR"
  }

  column {
    name = "notetype"
    type = "VARCHAR"  
  }

  column {
    name = "notetypecode"
    type = "VARCHAR"
  }
}

resource "snowflake_table" "ingest_z_visit_ltnot" {
database            = var.landing
  schema              = "RAINTREE"
  name                = "Z_VISIT_LTNOT"
  change_tracking     = true

  column {
    name = "id"
    type = "NUMBER(38,0)"
  }

  column {
    name = "_pn"
    type = "VARCHAR"
  }

  column {
    name = "emrpn"
    type = "VARCHAR"
  }

  column {
    name = "emrprog"
    type = "VARCHAR"
  }

  column {
    name = "emrdate"
    type = "VARCHAR"
  }

  column {
    name = "exemptpedicat"
    type = "VARCHAR"
  }

  column {
    name = "exemptpedicatreason"
    type = "VARCHAR"
  }

  column {
    name = "nonbillable"
    type = "VARCHAR"
  }

  column {
    name = "noserviceticket"
    type = "VARCHAR"
  }

  column {
    name = "novisit"
    type = "VARCHAR"
  }

  column {
    name = "notetype"
    type = "VARCHAR"  
  }

  column {
    name = "notetypecode"
    type = "VARCHAR"
  }
}

resource "snowflake_table" "ingest_rbi_emr_custom" {
database            = var.landing
  schema              = "RAINTREE"
  name                = "RBI_EMR_CUSTOM"
  change_tracking     = true

  column {
    name = "id"
    type = "NUMBER(38,0)"
  }
  column {
    name = "owner"
    type = "VARCHAR"
  }
  column {
    name = "createdate"
    type = "VARCHAR"
  }
  column {
    name = "createtime"
    type = "VARCHAR"
  }
  column {
    name = "modifdate"
    type = "VARCHAR"
  }
  column {
    name = "modiftime"
    type = "VARCHAR"
  }
  column {
    name = "encdate"
    type = "VARCHAR"
  }
  column {
    name = "enctime"
    type = "VARCHAR"
  }
  column {
    name = "pat"
    type = "VARCHAR"
  }
  column {
    name = "patname"
    type = "VARCHAR"
  }
  column {
    name = "doc"
    type = "VARCHAR"
  }
  column {
    name = "loc"
    type = "VARCHAR"
  }
  column {
    name = "prog"
    type = "VARCHAR"
  }
  column {
    name = "templ"
    type = "VARCHAR"
  }
  column {
    name = "desc_"
    type = "VARCHAR"
  }
  column {
    name = "cat"
    type = "VARCHAR"
  }
  column {
    name = "groups_"
    type = "VARCHAR"
  }
  column {
    name = "link"
    type = "VARCHAR"
  }
  column {
    name = "soscript"
    type = "VARCHAR"
  }
  column {
    name = "guid"
    type = "VARCHAR"
  }
  column {
    name = "parentguid"
    type = "VARCHAR"
  }
  column {
    name = "noteflags"
    type = "VARCHAR"
  }
  column {
    name = "amended"
    type = "VARCHAR"
  }
  column {
    name = "closedate"
    type = "VARCHAR"
  }
  column {
    name = "closetime"
    type = "VARCHAR"
  }
  column {
    name = "closedby"
    type = "VARCHAR"
  }
  column {
    name = "modeflags"
    type = "VARCHAR"
  }
  column {
    name = "usefile"
    type = "VARCHAR"
  }
  column {
    name = "createdby"
    type = "VARCHAR"
  }
  column {
    name = "modifiedby"
    type = "VARCHAR"
  }
  column {
    name = "package"
    type = "VARCHAR"
  }
  column {
    name = "originator"
    type = "VARCHAR"
  }
  column {
    name = "reviewedtimestamp"
    type = "VARCHAR"
  }
  column {
    name = "reviewedby"
    type = "VARCHAR"
  }
  column {
    name = "customflags"
    type = "VARCHAR"
  }
  column {
    name = "_timestamp"
    type = "VARCHAR"
  }
}

resource "snowflake_table" "ingest_z_rbi_emr_custom" {
database            = var.landing
  schema              = "RAINTREE"
  name                = "Z_RBI_EMR_CUSTOM"
  change_tracking     = true

  column {
    name = "id"
    type = "NUMBER(38,0)"
  }
  column {
    name = "owner"
    type = "VARCHAR"
  }
  column {
    name = "createdate"
    type = "VARCHAR"
  }
  column {
    name = "createtime"
    type = "VARCHAR"
  }
  column {
    name = "modifdate"
    type = "VARCHAR"
  }
  column {
    name = "modiftime"
    type = "VARCHAR"
  }
  column {
    name = "encdate"
    type = "VARCHAR"
  }
  column {
    name = "enctime"
    type = "VARCHAR"
  }
  column {
    name = "pat"
    type = "VARCHAR"
  }
  column {
    name = "patname"
    type = "VARCHAR"
  }
  column {
    name = "doc"
    type = "VARCHAR"
  }
  column {
    name = "loc"
    type = "VARCHAR"
  }
  column {
    name = "prog"
    type = "VARCHAR"
  }
  column {
    name = "templ"
    type = "VARCHAR"
  }
  column {
    name = "desc_"
    type = "VARCHAR"
  }
  column {
    name = "cat"
    type = "VARCHAR"
  }
  column {
    name = "groups_"
    type = "VARCHAR"
  }
  column {
    name = "link"
    type = "VARCHAR"
  }
  column {
    name = "soscript"
    type = "VARCHAR"
  }
  column {
    name = "guid"
    type = "VARCHAR"
  }
  column {
    name = "parentguid"
    type = "VARCHAR"
  }
  column {
    name = "noteflags"
    type = "VARCHAR"
  }
  column {
    name = "amended"
    type = "VARCHAR"
  }
  column {
    name = "closedate"
    type = "VARCHAR"
  }
  column {
    name = "closetime"
    type = "VARCHAR"
  }
  column {
    name = "closedby"
    type = "VARCHAR"
  }
  column {
    name = "modeflags"
    type = "VARCHAR"
  }
  column {
    name = "usefile"
    type = "VARCHAR"
  }
  column {
    name = "createdby"
    type = "VARCHAR"
  }
  column {
    name = "modifiedby"
    type = "VARCHAR"
  }
  column {
    name = "package"
    type = "VARCHAR"
  }
  column {
    name = "originator"
    type = "VARCHAR"
  }
  column {
    name = "reviewedtimestamp"
    type = "VARCHAR"
  }
  column {
    name = "reviewedby"
    type = "VARCHAR"
  }
  column {
    name = "customflags"
    type = "VARCHAR"
  }
  column {
    name = "_timestamp"
    type = "VARCHAR"
  }
}

resource "snowflake_table" "ingest_tests_t1148" {
database            = var.landing
  schema              = "RAINTREE"
  name                = "TESTS_T1148"
  change_tracking     = true

column {
  name = "_id"
  type = "NUMBER(38,0)"
}
column {
  name = "_pn"
  type = "VARCHAR"
}
column {
  name = "emrdate"
  type = "VARCHAR"
}
column {
  name = "graph"
  type = "VARCHAR"
}
column {
  name = "scaled1"
  type = "VARCHAR"
}
column {
  name = "scaled2"
  type = "VARCHAR"
}
column {
  name = "scaled3"
  type = "VARCHAR"
}
column {
  name = "scaled4"
  type = "VARCHAR"
}
column {
  name = "template"
  type = "VARCHAR"
}
column {
  name = "_timestamp_"
  type = "VARCHAR"
}
column {
  name = "_myvariabledata"
  type = "VARCHAR"
}
column {
  name = "ap1"
  type = "VARCHAR"
}
column {
  name = "ap2"
  type = "VARCHAR"
}
column {
  name = "ap3"
  type = "VARCHAR"
}
column {
  name = "ap4"
  type = "VARCHAR"
}
column {
  name = "assessmentstatus"
  type = "VARCHAR"
}
column {
  name = "fit1"
  type = "VARCHAR"
}
column {
  name = "fit2"
  type = "VARCHAR"
}
column {
  name = "fit3"
  type = "VARCHAR"
}
column {
  name = "fit4"
  type = "VARCHAR"
}
column {
  name = "items1"
  type = "VARCHAR"
}
column {
  name = "items2"
  type = "VARCHAR"
}
column {
  name = "items3"
  type = "VARCHAR"
}
column {
  name = "items4"
  type = "VARCHAR"
}
column {
  name = "se1"
  type = "VARCHAR"
}
column {
  name = "se2"
  type = "VARCHAR"
}
column {
  name = "se3"
  type = "VARCHAR"
}
column {
  name = "se4"
  type = "VARCHAR"
}
column {
  name = "ts1"
  type = "VARCHAR"
}
column {
  name = "ts2"
  type = "VARCHAR"
}
column {
  name = "ts3"
  type = "VARCHAR"
}
column {
  name = "ts4"
  type = "VARCHAR"
}
column {
  name = "type1"
  type = "VARCHAR"
}
column {
  name = "type2"
  type = "VARCHAR"
}
column {
  name = "type3"
  type = "VARCHAR"
}
column {
  name = "type4"
  type = "VARCHAR"
}
}

resource "snowflake_table" "ingest_z_tests_t1148" {
database            = var.landing
  schema              = "RAINTREE"
  name                = "Z_TESTS_T1148"
  change_tracking     = true

column {
  name = "_id"
  type = "NUMBER(38,0)"
}
column {
  name = "_pn"
  type = "VARCHAR"
}
column {
  name = "emrdate"
  type = "VARCHAR"
}
column {
  name = "graph"
  type = "VARCHAR"
}
column {
  name = "scaled1"
  type = "VARCHAR"
}
column {
  name = "scaled2"
  type = "VARCHAR"
}
column {
  name = "scaled3"
  type = "VARCHAR"
}
column {
  name = "scaled4"
  type = "VARCHAR"
}
column {
  name = "template"
  type = "VARCHAR"
}
column {
  name = "_timestamp_"
  type = "VARCHAR"
}
column {
  name = "_myvariabledata"
  type = "VARCHAR"
}
column {
  name = "ap1"
  type = "VARCHAR"
}
column {
  name = "ap2"
  type = "VARCHAR"
}
column {
  name = "ap3"
  type = "VARCHAR"
}
column {
  name = "ap4"
  type = "VARCHAR"
}
column {
  name = "assessmentstatus"
  type = "VARCHAR"
}
column {
  name = "fit1"
  type = "VARCHAR"
}
column {
  name = "fit2"
  type = "VARCHAR"
}
column {
  name = "fit3"
  type = "VARCHAR"
}
column {
  name = "fit4"
  type = "VARCHAR"
}
column {
  name = "items1"
  type = "VARCHAR"
}
column {
  name = "items2"
  type = "VARCHAR"
}
column {
  name = "items3"
  type = "VARCHAR"
}
column {
  name = "items4"
  type = "VARCHAR"
}
column {
  name = "se1"
  type = "VARCHAR"
}
column {
  name = "se2"
  type = "VARCHAR"
}
column {
  name = "se3"
  type = "VARCHAR"
}
column {
  name = "se4"
  type = "VARCHAR"
}
column {
  name = "ts1"
  type = "VARCHAR"
}
column {
  name = "ts2"
  type = "VARCHAR"
}
column {
  name = "ts3"
  type = "VARCHAR"
}
column {
  name = "ts4"
  type = "VARCHAR"
}
column {
  name = "type1"
  type = "VARCHAR"
}
column {
  name = "type2"
  type = "VARCHAR"
}
column {
  name = "type3"
  type = "VARCHAR"
}
column {
  name = "type4"
  type = "VARCHAR"
}
}

resource "snowflake_table" "ingest_raintree_load_message" {
  database            = var.landing
  schema              = "RAINTREE"
  name                = "RAINTREE_LOAD_TRACKING"
  change_tracking     = true

  column {
    name = "MESSAGE_DATETIME"
    type = "TIMESTAMP_NTZ(9)"
  }

  column {
    name = "STATUS"
    type = "VARCHAR"
  }
}

resource "snowflake_table" "raintree_transformation_status" {
  database            = var.landing
  schema              = "RAINTREE"
  name                = "RAINTREE_TRANSFORMATION_STATUS"
  change_tracking     = true

  column {
    name = "STATUS"
    type = "VARCHAR"
  }
  
  column {
    name = "STATUS_DATE"
    type = "DATE"
  }

}

resource "snowflake_table" "raintree_transformation_status" {
  database            = var.landing
  schema              = "WORKDAY_WORKDAY"
  name                = "WORKDAY_TRANSFORMATION_STATUS"
  change_tracking     = true

  column {
    name = "STATUS"
    type = "VARCHAR"
  }
  
  column {
    name = "STATUS_DATE"
    type = "DATE"
  }

}