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
    type = "INT"
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
    type = "INT"
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
    type = "INT"
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
    type = "INT"
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
    type = "INT"
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
    type = "INT"
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
    type = "INT"
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
    type = "INT"
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
 
resource "snowflake_table" "ingest_rbi_ledger" {
database            = var.landing
  schema              = "RAINTREE"
  name                = "RBI_LEDGER"
  change_tracking     = true

  column {
    name = "id"
    type = "VARCHAR"
  }

  column {
    name = "Pn"
    type = "VARCHAR"
  }

  column {
    name = "PostingDate"
    type = "VARCHAR"
  }

  column {
    name = "OriginalDate"
    type = "VARCHAR"
  }

  column {
    name = "AddDate"
    type = "VARCHAR"
  }

  column {
    name = "Entry"
    type = "VARCHAR"
  }

  column {
    name = "LedgerItemID"
    type = "VARCHAR"
  }

  column {
    name = "ApplyToChargeID"
    type = "VARCHAR"
  }

  column {
    name = "ApplyToPayAdjID"
    type = "VARCHAR"
  }

  column {
    name = "ChgCode"
    type = "VARCHAR"
  }

  column {
    name = "ChgRVS"
    type = "VARCHAR"
  }

  column {
    name = "ChgMod1"
    type = "VARCHAR"
  }

  column {
    name = "ChgMod2"
    type = "VARCHAR"
  }

  column {
    name = "ChgMod3"
    type = "VARCHAR"
  }

  column {
    name = "ChgMod4"
    type = "VARCHAR"
  }

  column {
    name = "ChgMod5"
    type = "VARCHAR"
  }

  column {
    name = "ChgMod6"
    type = "VARCHAR"
  }

  column {
    name = "ChgPos"
    type = "VARCHAR"
  }

  column {
    name = "PayCode"
    type = "VARCHAR"
  }

  column {
    name = "AdjCode"
    type = "VARCHAR"
  }

  column {
    name = "TranCode"
    type = "VARCHAR"
  }

  column {
    name = "CreditAmount"
    type = "VARCHAR"
  }

  column {
    name = "DebitAmount"
    type = "VARCHAR"
  }

  column {
    name = "Dos"
    type = "VARCHAR"
  }

  column {
    name = "InsuranceID"
    type = "VARCHAR"
  }

  column {
    name = "InsuranceResp"
    type = "VARCHAR"
  }

  column {
    name = "InsuranceCode"
    type = "VARCHAR"
  }

    column {
    name = "InsuranceFC"
    type = "VARCHAR"
  }

  column {
    name = "PrimaryInsuranceID"
    type = "VARCHAR"
  }

  column {
    name = "PrimaryInsuranceResp"
    type = "VARCHAR"
  }

  column {
    name = "PrimaryInsuranceCode"
    type = "VARCHAR"
  }

  column {
    name = "PrimaryInsuranceFC"
    type = "VARCHAR"
  }

  column {
    name = "Clinic"
    type = "VARCHAR"
  }

  column {
    name = "Location"
    type = "VARCHAR"
  }

  column {
    name = "RendDoc"
    type = "VARCHAR"
  }

  
  column {
    name = "BillDoc"
    type = "VARCHAR"
  }

  column {
    name = "Referral"
    type = "VARCHAR"
  }

  column {
    name = "Units"
    type = "VARCHAR"
  }

  column {
    name = "TicketIndex"
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
    name = "User"
    type = "VARCHAR"
  }

  column {
    name = "TotalRVU"
    type = "VARCHAR"
  }

  column {
    name = "Diag1"
    type = "VARCHAR"
  }

  column {
    name = "Diag2"
    type = "VARCHAR"
  }

  column {
    name = "Diag3"
    type = "VARCHAR"
  }

  column {
    name = "Diag4"
    type = "VARCHAR"
  }

  column {
    name = "ApType"
    type = "VARCHAR"
  }

  column {
    name = "CopayTransfer"
    type = "VARCHAR"
  }

  column {
    name = "VirtualAdjChgPost"
    type = "VARCHAR"
  }

  column {
    name = "VirtualAdjPayPost"
    type = "VARCHAR"
  }

  column {
    name = "VirtualPayment"
    type = "VARCHAR"
  }

  column {
    name = "NewPatCount"
    type = "VARCHAR"
  }

  column {
    name = "VirtualCharge"
    type = "VARCHAR"
  }

  column {
    name = "VisitByDosCaseDoc"
    type = "VARCHAR"
  }

  column {
    name = "VisitByCode"
    type = "VARCHAR"
  }

  column {
    name = "PayAdjCount"
    type = "VARCHAR"
  }

  column {
    name = "UnBilled"
    type = "VARCHAR"
  }

  column {
    name = "Category"
    type = "VARCHAR"
  }

  column {
    name = "ChargeDate"
    type = "VARCHAR"
  }

  column {
    name = "ReversedCharge"
    type = "VARCHAR"
  }

  column {
    name = "ReasonCode"
    type = "VARCHAR"
  }

  column {
    name = "BillStatus"
    type = "VARCHAR"
  }

  column {
    name = "DataBaseName"
    type = "VARCHAR"
  }

  column {
    name = "FirstPassPayment"
    type = "VARCHAR"
  }

  column {
    name = "FirstPassDenial"
    type = "VARCHAR"
  }

  column {
    name = "ChargeAgePostDate"
    type = "VARCHAR"
  }

  column {
    name = "EmrOwner"
    type = "VARCHAR"
  }

  column {
    name = "DepositDate"
    type = "VARCHAR"
  }

  column {
    name = "DepositLocation"
    type = "VARCHAR"
  }

  column {
    name = "PayCheckNum"
    type = "VARCHAR"
  }

  column {
    name = "PayBankRef"
    type = "VARCHAR"
  }

  column {
    name = "OrigTicketGuid"
    type = "VARCHAR"
  }
}

resource "snowflake_table" "ingest_z_rbi_ledger" {
database            = var.landing
  schema              = "RAINTREE"
  name                = "Z_RBI_LEDGER"
  change_tracking     = true

  column {
    name = "id"
    type = "VARCHAR"
  }

  column {
    name = "Pn"
    type = "VARCHAR"
  }

  column {
    name = "PostingDate"
    type = "VARCHAR"
  }

  column {
    name = "OriginalDate"
    type = "VARCHAR"
  }

  column {
    name = "AddDate"
    type = "VARCHAR"
  }

  column {
    name = "Entry"
    type = "VARCHAR"
  }

  column {
    name = "LedgerItemID"
    type = "VARCHAR"
  }

  column {
    name = "ApplyToChargeID"
    type = "VARCHAR"
  }

  column {
    name = "ApplyToPayAdjID"
    type = "VARCHAR"
  }

  column {
    name = "ChgCode"
    type = "VARCHAR"
  }

  column {
    name = "ChgRVS"
    type = "VARCHAR"
  }

  column {
    name = "ChgMod1"
    type = "VARCHAR"
  }

  column {
    name = "ChgMod2"
    type = "VARCHAR"
  }

  column {
    name = "ChgMod3"
    type = "VARCHAR"
  }

  column {
    name = "ChgMod4"
    type = "VARCHAR"
  }

  column {
    name = "ChgMod5"
    type = "VARCHAR"
  }

  column {
    name = "ChgMod6"
    type = "VARCHAR"
  }

  column {
    name = "ChgPos"
    type = "VARCHAR"
  }

  column {
    name = "PayCode"
    type = "VARCHAR"
  }

  column {
    name = "AdjCode"
    type = "VARCHAR"
  }

  column {
    name = "TranCode"
    type = "VARCHAR"
  }

  column {
    name = "CreditAmount"
    type = "VARCHAR"
  }

  column {
    name = "DebitAmount"
    type = "VARCHAR"
  }

  column {
    name = "Dos"
    type = "VARCHAR"
  }

  column {
    name = "InsuranceID"
    type = "VARCHAR"
  }

  column {
    name = "InsuranceResp"
    type = "VARCHAR"
  }

  column {
    name = "InsuranceCode"
    type = "VARCHAR"
  }

    column {
    name = "InsuranceFC"
    type = "VARCHAR"
  }

  column {
    name = "PrimaryInsuranceID"
    type = "VARCHAR"
  }

  column {
    name = "PrimaryInsuranceResp"
    type = "VARCHAR"
  }

  column {
    name = "PrimaryInsuranceCode"
    type = "VARCHAR"
  }

  column {
    name = "PrimaryInsuranceFC"
    type = "VARCHAR"
  }

  column {
    name = "Clinic"
    type = "VARCHAR"
  }

  column {
    name = "Location"
    type = "VARCHAR"
  }

  column {
    name = "RendDoc"
    type = "VARCHAR"
  }

  
  column {
    name = "BillDoc"
    type = "VARCHAR"
  }

  column {
    name = "Referral"
    type = "VARCHAR"
  }

  column {
    name = "Units"
    type = "VARCHAR"
  }

  column {
    name = "TicketIndex"
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
    name = "User"
    type = "VARCHAR"
  }

  column {
    name = "TotalRVU"
    type = "VARCHAR"
  }

  column {
    name = "Diag1"
    type = "VARCHAR"
  }

  column {
    name = "Diag2"
    type = "VARCHAR"
  }

  column {
    name = "Diag3"
    type = "VARCHAR"
  }

  column {
    name = "Diag4"
    type = "VARCHAR"
  }

  column {
    name = "ApType"
    type = "VARCHAR"
  }

  column {
    name = "CopayTransfer"
    type = "VARCHAR"
  }

  column {
    name = "VirtualAdjChgPost"
    type = "VARCHAR"
  }

  column {
    name = "VirtualAdjPayPost"
    type = "VARCHAR"
  }

  column {
    name = "VirtualPayment"
    type = "VARCHAR"
  }

  column {
    name = "NewPatCount"
    type = "VARCHAR"
  }

  column {
    name = "VirtualCharge"
    type = "VARCHAR"
  }

  column {
    name = "VisitByDosCaseDoc"
    type = "VARCHAR"
  }

  column {
    name = "VisitByCode"
    type = "VARCHAR"
  }

  column {
    name = "PayAdjCount"
    type = "VARCHAR"
  }

  column {
    name = "UnBilled"
    type = "VARCHAR"
  }

  column {
    name = "Category"
    type = "VARCHAR"
  }

  column {
    name = "ChargeDate"
    type = "VARCHAR"
  }

  column {
    name = "ReversedCharge"
    type = "VARCHAR"
  }

  column {
    name = "ReasonCode"
    type = "VARCHAR"
  }

  column {
    name = "BillStatus"
    type = "VARCHAR"
  }

  column {
    name = "DataBaseName"
    type = "VARCHAR"
  }

  column {
    name = "FirstPassPayment"
    type = "VARCHAR"
  }

  column {
    name = "FirstPassDenial"
    type = "VARCHAR"
  }

  column {
    name = "ChargeAgePostDate"
    type = "VARCHAR"
  }

  column {
    name = "EmrOwner"
    type = "VARCHAR"
  }

  column {
    name = "DepositDate"
    type = "VARCHAR"
  }

  column {
    name = "DepositLocation"
    type = "VARCHAR"
  }

  column {
    name = "PayCheckNum"
    type = "VARCHAR"
  }

  column {
    name = "PayBankRef"
    type = "VARCHAR"
  }

  column {
    name = "OrigTicketGuid"
    type = "VARCHAR"
  }
}

resource "snowflake_table" "ingest_rbi_insur" {
database            = var.landing
  schema              = "RAINTREE"
  name                = "RBI_INSUR"
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
    name = "bc"
    type = "VARCHAR"
  }

  column {
    name = "guid"
    type = "VARCHAR"
  }

  column {
    name = "code"
    type = "VARCHAR"
  }

  column {
    name = "casecode"
    type = "VARCHAR"
  }

  column {
    name = "iname"
    type = "VARCHAR"
  }

  column {
    name = "fc"
    type = "VARCHAR"
  }

  column {
    name = "fdate"
    type = "VARCHAR"
  }

  column {
    name = "edate"
    type = "VARCHAR"
  }

  column {
    name = "rel"
    type = "VARCHAR"
  }

  column {
    name = "copay"
    type = "VARCHAR"
  }

  column {
    name = "copayTypes"
    type = "VARCHAR"
  }

  column {
    name = "suppress"
    type = "VARCHAR"
  }

  column {
    name = "deduct"
    type = "VARCHAR"
  }

  column {
    name = "deductMet"
    type = "VARCHAR"
  }

  column {
    name = "deductRem"
    type = "VARCHAR"
  }

  column {
    name = "deductdate"
    type = "VARCHAR"
  }

  column {
    name = "deductrefreshdate"
    type = "VARCHAR"
  }

  column {
    name = "deductismet"
    type = "VARCHAR"
  }

  column {
    name = "amountsVerifiedDate"
    type = "VARCHAR"
  }

  column {
    name = "authreq"
    type = "VARCHAR"
  }

  column {
    name = "ovrauthreq"
    type = "VARCHAR"
  }

  column {
    name = "supreasoncb"
    type = "VARCHAR"
  }

  column {
    name = "maxOutPockRem"
    type = "VARCHAR"
  }

  column {
    name = "ccasof"
    type = "VARCHAR"
  }

  column {
    name = "ecode"
    type = "VARCHAR"
  }

  column {
    name = "ename"
    type = "VARCHAR"
  }

  column {
    name = "eaddr1"
    type = "VARCHAR"
  }

  column {
    name = "eaddr2"
    type = "VARCHAR"
  }

  column {
    name = "ecity"
    type = "VARCHAR"
  }

  column {
    name = "estate"
    type = "VARCHAR"
  }

  column {
    name = "ezip"
    type = "VARCHAR"
  }

  column {
    name = "ephone"
    type = "VARCHAR"
  }

  column {
    name = "ecell"
    type = "VARCHAR"
  }

  column {
    name = "efax"
    type = "VARCHAR"
  }

  column {
    name = "eemail"
    type = "VARCHAR"
  }

  column {
    name = "ssid"
    type = "VARCHAR"
  }

  column {
    name = "group"
    type = "VARCHAR"
  }

  column {
    name = "refreq"
    type = "VARCHAR"
  }
}

resource "snowflake_table" "ingest_z_rbi_insur" {
database            = var.landing
  schema              = "RAINTREE"
  name                = "Z_RBI_INSUR"
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
    name = "bc"
    type = "VARCHAR"
  }

  column {
    name = "guid"
    type = "VARCHAR"
  }

  column {
    name = "code"
    type = "VARCHAR"
  }

  column {
    name = "casecode"
    type = "VARCHAR"
  }

  column {
    name = "iname"
    type = "VARCHAR"
  }

  column {
    name = "fc"
    type = "VARCHAR"
  }

  column {
    name = "fdate"
    type = "VARCHAR"
  }

  column {
    name = "edate"
    type = "VARCHAR"
  }

  column {
    name = "rel"
    type = "VARCHAR"
  }

  column {
    name = "copay"
    type = "VARCHAR"
  }

  column {
    name = "copayTypes"
    type = "VARCHAR"
  }

  column {
    name = "suppress"
    type = "VARCHAR"
  }

  column {
    name = "deduct"
    type = "VARCHAR"
  }

  column {
    name = "deductMet"
    type = "VARCHAR"
  }

  column {
    name = "deductRem"
    type = "VARCHAR"
  }

  column {
    name = "deductdate"
    type = "VARCHAR"
  }

  column {
    name = "deductrefreshdate"
    type = "VARCHAR"
  }

  column {
    name = "deductismet"
    type = "VARCHAR"
  }

  column {
    name = "amountsVerifiedDate"
    type = "VARCHAR"
  }

  column {
    name = "authreq"
    type = "VARCHAR"
  }

  column {
    name = "ovrauthreq"
    type = "VARCHAR"
  }

  column {
    name = "supreasoncb"
    type = "VARCHAR"
  }

  column {
    name = "maxOutPockRem"
    type = "VARCHAR"
  }

  column {
    name = "ccasof"
    type = "VARCHAR"
  }

  column {
    name = "ecode"
    type = "VARCHAR"
  }

  column {
    name = "ename"
    type = "VARCHAR"
  }

  column {
    name = "eaddr1"
    type = "VARCHAR"
  }

  column {
    name = "eaddr2"
    type = "VARCHAR"
  }

  column {
    name = "ecity"
    type = "VARCHAR"
  }

  column {
    name = "estate"
    type = "VARCHAR"
  }

  column {
    name = "ezip"
    type = "VARCHAR"
  }

  column {
    name = "ephone"
    type = "VARCHAR"
  }

  column {
    name = "ecell"
    type = "VARCHAR"
  }

  column {
    name = "efax"
    type = "VARCHAR"
  }

  column {
    name = "eemail"
    type = "VARCHAR"
  }

  column {
    name = "ssid"
    type = "VARCHAR"
  }

  column {
    name = "group"
    type = "VARCHAR"
  }

  column {
    name = "refreq"
    type = "VARCHAR"
  }
}

resource "snowflake_table" "ingest_rbi_charge" {
database            = var.landing
  schema              = "RAINTREE"
  name                = "RBI_CHARGE"
  change_tracking     = true

  column {
    name = "_id"
    type = "VARCHAR"
  }

  column {
    name = "guid"
    type = "VARCHAR"
  }

  column {
    name = "aiguid"
    type = "VARCHAR"
  }

  column {
    name = "code"
    type = "VARCHAR"
  }

  column {
    name = "prcode"
    type = "VARCHAR"
  }

  column {
    name = "loc"
    type = "VARCHAR"
  }

  column {
    name = "doc"
    type = "VARCHAR"
  }

  column {
    name = "fc"
    type = "VARCHAR"
  }

  column {
    name = "ins"
    type = "VARCHAR"
  }

  column {
    name = "cslip"
    type = "VARCHAR"
  }

  column {
    name = "rvs"
    type = "VARCHAR"
  }

  column {
    name = "desc"
    type = "VARCHAR"
  }

  column {
    name = "revcode"
    type = "VARCHAR"
  }

  column {
    name = "code1"
    type = "VARCHAR"
  }

  column {
    name = "code2"
    type = "VARCHAR"
  }

  column {
    name = "place"
    type = "VARCHAR"
  }

  column {
    name = "bcharge"
    type = "VARCHAR"
  }

  column {
    name = "tos"
    type = "VARCHAR"
  }

  column {
    name = "charge"
    type = "VARCHAR"
  }

  column {
    name = "bu"
    type = "VARCHAR"
  }

  column {
    name = "rvu"
    type = "VARCHAR"
  }

  column {
    name = "link"
    type = "VARCHAR"
  }

  column {
    name = "med"
    type = "VARCHAR"
  }

  column {
    name = "ccategory"
    type = "VARCHAR"
  }

  column {
    name = "effdate"
    type = "VARCHAR"
  }

  column {
    name = "modified"
    type = "VARCHAR"
  }
}

resource "snowflake_table" "ingest_z_rbi_charge" {
database            = var.landing
  schema              = "RAINTREE"
  name                = "Z_RBI_CHARGE"
  change_tracking     = true

  column {
    name = "_id"
    type = "VARCHAR"
  }

  column {
    name = "guid"
    type = "VARCHAR"
  }

  column {
    name = "aiguid"
    type = "VARCHAR"
  }

  column {
    name = "code"
    type = "VARCHAR"
  }

  column {
    name = "prcode"
    type = "VARCHAR"
  }

  column {
    name = "loc"
    type = "VARCHAR"
  }

  column {
    name = "doc"
    type = "VARCHAR"
  }

  column {
    name = "fc"
    type = "VARCHAR"
  }

  column {
    name = "ins"
    type = "VARCHAR"
  }

  column {
    name = "cslip"
    type = "VARCHAR"
  }

  column {
    name = "rvs"
    type = "VARCHAR"
  }

  column {
    name = "desc"
    type = "VARCHAR"
  }

  column {
    name = "revcode"
    type = "VARCHAR"
  }

  column {
    name = "code1"
    type = "VARCHAR"
  }

  column {
    name = "code2"
    type = "VARCHAR"
  }

  column {
    name = "place"
    type = "VARCHAR"
  }

  column {
    name = "bcharge"
    type = "VARCHAR"
  }

  column {
    name = "tos"
    type = "VARCHAR"
  }

  column {
    name = "charge"
    type = "VARCHAR"
  }

  column {
    name = "bu"
    type = "VARCHAR"
  }

  column {
    name = "rvu"
    type = "VARCHAR"
  }

  column {
    name = "link"
    type = "VARCHAR"
  }

  column {
    name = "med"
    type = "VARCHAR"
  }

  column {
    name = "ccategory"
    type = "VARCHAR"
  }

  column {
    name = "effdate"
    type = "VARCHAR"
  }

  column {
    name = "modified"
    type = "VARCHAR"
  }
}

resource "snowflake_table" "ingest_rbi_chgat" {
database            = var.landing
  schema              = "RAINTREE"
  name                = "RBI_CHGAT"
  change_tracking     = true

  column {
    name = "code"
    type = "VARCHAR"
  }

  column {
    name = "desc"
    type = "VARCHAR"
  }
}

resource "snowflake_table" "ingest_z_rbi_chgat" {
database            = var.landing
  schema              = "RAINTREE"
  name                = "Z_RBI_CHGAT"
  change_tracking     = true

  column {
    name = "code"
    type = "VARCHAR"
  }

  column {
    name = "desc"
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

resource "snowflake_table" "ingest_payor_payor" {
database            = var.landing
  schema              = "RAINTREE"
  name                = "PAYOR_PAYOR"
  change_tracking     = true

  column {
    name = "_id"
    type = "VARCHAR"
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
    name = "_lastmodified_"
    type = "VARCHAR"
  }

  column {
    name = "ablewrk"
    type = "VARCHAR"
  }

  column {
    name = "addr"
    type = "VARCHAR"
  }

  column {
    name = "ass"
    type = "VARCHAR"
  }

  column {
    name = "astate"
    type = "VARCHAR"
  }

  column {
    name = "auth"
    type = "VARCHAR"
  }

  column {
    name = "authreq"
    type = "VARCHAR"
  }

  column {
    name = "bc"
    type = "VARCHAR"
  }

  column {
    name = "cd_rel_"
    type = "VARCHAR"
  }

  column {
    name = "city"
    type = "VARCHAR"
  }

  column {
    name = "code"
    type = "VARCHAR"
  }

  column {
    name = "com1"
    type = "VARCHAR"
  }

  column {
    name = "com2"
    type = "VARCHAR"
  }

  column {
    name = "com3"
    type = "VARCHAR"
  }

  column {
    name = "conde"
    type = "VARCHAR"
  }

  column {
    name = "copay1"
    type = "VARCHAR"
  }

  column {
    name = "dfc"
    type = "VARCHAR"
  }

  column {
    name = "dob"
    type = "VARCHAR"
  }

    column {
    name = "doi"
    type = "VARCHAR"
  }

  column {
    name = "ecode"
    type = "VARCHAR"
  }

  column {
    name = "edate"
    type = "VARCHAR"
  }

  column {
    name = "emerg"
    type = "VARCHAR"
  }

  column {
    name = "empid"
    type = "VARCHAR"
  }

  column {
    name = "fdate"
    type = "VARCHAR"
  }

  column {
    name = "group_"
    type = "VARCHAR"
  }

  column {
    name = "hospf"
    type = "VARCHAR"
  }

  
  column {
    name = "hospt"
    type = "VARCHAR"
  }

  column {
    name = "iname"
    type = "VARCHAR"
  }

  column {
    name = "lab"
    type = "VARCHAR"
  }

  column {
    name = "labch"
    type = "VARCHAR"
  }

  column {
    name = "medi1"
    type = "VARCHAR"
  }

  column {
    name = "medi2"
    type = "VARCHAR"
  }

  
  column {
    name = "oins"
    type = "VARCHAR"
  }

  column {
    name = "otherf"
    type = "VARCHAR"
  }

  column {
    name = "otherfn"
    type = "VARCHAR"
  }

  column {
    name = "partialdisf"
    type = "VARCHAR"
  }

  column {
    name = "partialdist"
    type = "VARCHAR"
  }

  column {
    name = "pcp"
    type = "VARCHAR"
  }

  column {
    name = "pcpreq"
    type = "VARCHAR"
  }

  column {
    name = "phone"
    type = "VARCHAR"
  }

  column {
    name = "pn"
    type = "VARCHAR"
  }

  column {
    name = "prcode"
    type = "VARCHAR"
  }

  column {
    name = "refs"
    type = "VARCHAR"
  }

  column {
    name = "refsn"
    type = "VARCHAR"
  }

  column {
    name = "rel"
    type = "VARCHAR"
  }

  column {
    name = "reld"
    type = "VARCHAR"
  }

  column {
    name = "reltod"
    type = "VARCHAR"
  }

  column {
    name = "sex"
    type = "VARCHAR"
  }

  column {
    name = "sign"
    type = "VARCHAR"
  }

  column {
    name = "sims"
    type = "VARCHAR"
  }

  column {
    name = "spoketo"
    type = "VARCHAR"
  }

  column {
    name = "ssid"
    type = "VARCHAR"
  }

  column {
    name = "state"
    type = "VARCHAR"
  }

  column {
    name = "supid"
    type = "VARCHAR"
  }

  column {
    name = "supress"
    type = "VARCHAR"
  }

  column {
    name = "zip"
    type = "VARCHAR"
  }

  column {
    name = "totaldisf"
    type = "VARCHAR"
  }

  column {
    name = "totaldist"
    type = "VARCHAR"
  }

  column {
    name = "v_standard_"
    type = "VARCHAR"
  }

  column {
    name = "vby"
    type = "VARCHAR"
  }

  column {
    name = "vdate"
    type = "VARCHAR"
  }

  column {
    name = "_myvariabledata"
    type = "VARCHAR"
  }

  column {
    name = "last"
    type = "VARCHAR"
  }

  column {
    name = "next"
    type = "VARCHAR"
  }

  column {
    name = "plan"
    type = "VARCHAR"
  }

  column {
    name = "cauto"
    type = "VARCHAR"
  }

  column {
    name = "relto"
    type = "VARCHAR"
  }

  column {
    name = "benyrdollar"
    type = "VARCHAR"
  }

  column {
    name = "benyrvisits"
    type = "VARCHAR"
  }

  column {
    name = "_cdate"
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
    name = "_mdate"
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
    name = "_timestamp_"
    type = "VARCHAR"
  }

  column {
    name = "autodeduct"
    type = "VARCHAR"
  }

  column {
    name = "cd_disctype_"
    type = "VARCHAR"
  }

  column {
    name = "chgcatcopy1"
    type = "VARCHAR"
  }

  column {
    name = "chgcatcopy2"
    type = "VARCHAR"
  }

  
  column {
    name = "chgcatcopy3"
    type = "VARCHAR"
  }

  column {
    name = "chgcatcopy4"
    type = "VARCHAR"
  }

  column {
    name = "chgcatcopy5"
    type = "VARCHAR"
  }

  column {
    name = "chgcatcopy6"
    type = "VARCHAR"
  }

  column {
    name = "chgcatcopay1"
    type = "VARCHAR"
  }

  column {
    name = "chgcatcopay2"
    type = "VARCHAR"
  }

  
  column {
    name = "chgcatcopay3"
    type = "VARCHAR"
  }

  column {
    name = "chgcatcopay4"
    type = "VARCHAR"
  }

  column {
    name = "chgcatcopay5"
    type = "VARCHAR"
  }

  column {
    name = "chgcatcopay6"
    type = "VARCHAR"
  }

  column {
    name = "chkcopayoverrideins"
    type = "VARCHAR"
  }

  column {
    name = "country"
    type = "VARCHAR"
  }

  column {
    name = "cptcopayamt1"
    type = "VARCHAR"
  }

  column {
    name = "cptcopayamt2"
    type = "VARCHAR"
  }

  column {
    name = "cptcopayamt3"
    type = "VARCHAR"
  }

  column {
    name = "cptcopayamt4"
    type = "VARCHAR"
  }

  column {
    name = "cptcopayamt5"
    type = "VARCHAR"
  }

  column {
    name = "cptcopayamt6"
    type = "VARCHAR"
  }

  column {
    name = "cptcopaychg1"
    type = "VARCHAR"
  }

  column {
    name = "cptcopaychg2"
    type = "VARCHAR"
  }

  column {
    name = "cptcopaychg3"
    type = "VARCHAR"
  }

  column {
    name = "cptcopaychg4"
    type = "VARCHAR"
  }

  column {
    name = "cptcopaychg5"
    type = "VARCHAR"
  }

  column {
    name = "cptcopaychg6"
    type = "VARCHAR"
  }

  column {
    name = "deductmet"
    type = "VARCHAR"
  }

  column {
    name = "deductrefreshdate"
    type = "VARCHAR"
  }

  column {
    name = "deductrem"
    type = "VARCHAR"
  }

  column {
    name = "image_back"
    type = "VARCHAR"
  }

  column {
    name = "image_front"
    type = "VARCHAR"
  }

  column {
    name = "image_verif"
    type = "VARCHAR"
  }

  column {
    name = "instypecode"
    type = "VARCHAR"
  }

  column {
    name = "maxoutpock"
    type = "VARCHAR"
  }

  column {
    name = "maxoutpockrem"
    type = "VARCHAR"
  }

  column {
    name = "maxoutpockused"
    type = "VARCHAR"
  }

  column {
    name = "outsidededuct"
    type = "VARCHAR"
  }

  column {
    name = "outsidedeductasof"
    type = "VARCHAR"
  }

  column {
    name = "pocfrom"
    type = "VARCHAR"
  }

  column {
    name = "pocto"
    type = "VARCHAR"
  }

  column {
    name = "prog"
    type = "VARCHAR"
  }

  column {
    name = "rejdate"
    type = "VARCHAR"
  }

  column {
    name = "visitcopayamt1"
    type = "VARCHAR"
  }

  column {
    name = "visitcopayamt2"
    type = "VARCHAR"
  }

  column {
    name = "visitcopayamt3"
    type = "VARCHAR"
  }

  column {
    name = "visitcopayamt4"
    type = "VARCHAR"
  }

  column {
    name = "visitcopayamt5"
    type = "VARCHAR"
  }

  column {
    name = "visitcopayamt6"
    type = "VARCHAR"
  }

  column {
    name = "visitcopayfrom1"
    type = "VARCHAR"
  }

  column {
    name = "visitcopayfrom2"
    type = "VARCHAR"
  }

  column {
    name = "visitcopayfrom3"
    type = "VARCHAR"
  }

  column {
    name = "visitcopayfrom4"
    type = "VARCHAR"
  }

  column {
    name = "visitcopayfrom5"
    type = "VARCHAR"
  }

  column {
    name = "visitcopayfrom6"
    type = "VARCHAR"
  }

  column {
    name = "visitcopayto1"
    type = "VARCHAR"
  }

  column {
    name = "visitcopayto2"
    type = "VARCHAR"
  }

  column {
    name = "visitcopayto3"
    type = "VARCHAR"
  }

  column {
    name = "visitcopayto4"
    type = "VARCHAR"
  }

  column {
    name = "visitcopayto5"
    type = "VARCHAR"
  }

  column {
    name = "visitcopayto6"
    type = "VARCHAR"
  }

  column {
    name = "yearlydeduct"
    type = "VARCHAR"
  }

  column {
    name = "cd_country_"
    type = "VARCHAR"
  }

  column {
    name = "cd_instypecode_"
    type = "VARCHAR"
  }

  column {
    name = "benyrvisitsrem"
    type = "VARCHAR"
  }

  column {
    name = "benyrvisitsused"
    type = "VARCHAR"
  }

  column {
    name = "lastresortresp"
    type = "VARCHAR"
  }

  column {
    name = "patmaxoutpocket"
    type = "VARCHAR"
  }

  column {
    name = "sfirst"
    type = "VARCHAR"
  }

  column {
    name = "slast"
    type = "VARCHAR"
  }

  column {
    name = "smi"
    type = "VARCHAR"
  }

  column {
    name = "maxoutpockusedout"
    type = "VARCHAR"
  }

  column {
    name = "benefitrefreshdate"
    type = "VARCHAR"
  }

  column {
    name = "benoverideins"
    type = "VARCHAR"
  }

  column {
    name = "benyrdollarrem"
    type = "VARCHAR"
  }

  column {
    name = "benyrdollarused"
    type = "VARCHAR"
  }

  column {
    name = "benyrdollarusedoutside"
    type = "VARCHAR"
  }

  column {
    name = "benyrvisitsusedoutside"
    type = "VARCHAR"
  }

  column {
    name = "outsidebenefitasof"
    type = "VARCHAR"
  }

  column {
    name = "sname"
    type = "VARCHAR"
  }

  column {
    name = "chgcatcopay10"
    type = "VARCHAR"
  }

  column {
    name = "chgcatcopay11"
    type = "VARCHAR"
  }

  column {
    name = "chgcatcopay12"
    type = "VARCHAR"
  }

  column {
    name = "chgcatcopay7"
    type = "VARCHAR"
  }

  column {
    name = "chgcatcopay8"
    type = "VARCHAR"
  }

  column {
    name = "chgcatcopay9"
    type = "VARCHAR"
  }

  column {
    name = "chgcatcopayamt10"
    type = "VARCHAR"
  }

  column {
    name = "chgcatcopayamt11"
    type = "VARCHAR"
  }

  column {
    name = "chgcatcopayamt12"
    type = "VARCHAR"
  }

  column {
    name = "chgcatcopayamt7"
    type = "VARCHAR"
  }

  column {
    name = "chgcatcopayamt8"
    type = "VARCHAR"
  }

  column {
    name = "chgcatcopayamt9"
    type = "VARCHAR"
  }

  column {
    name = "cptcopayamt10"
    type = "VARCHAR"
  }

  column {
    name = "cptcopayamt11"
    type = "VARCHAR"
  }

  column {
    name = "cptcopayamt12"
    type = "VARCHAR"
  }

  column {
    name = "cptcopayamt7"
    type = "VARCHAR"
  }

  column {
    name = "cptcopayamt8"
    type = "VARCHAR"
  }

  column {
    name = "cptcopayamt9"
    type = "VARCHAR"
  }

  column {
    name = "cptcopaychg10"
    type = "VARCHAR"
  }

  column {
    name = "cptcopaychg11"
    type = "VARCHAR"
  }

  column {
    name = "cptcopaychg12"
    type = "VARCHAR"
  }

  column {
    name = "cptcopaychg7"
    type = "VARCHAR"
  }

  column {
    name = "cptcopaychg8"
    type = "VARCHAR"
  }

  column {
    name = "cptcopaychg9"
    type = "VARCHAR"
  }

  column {
    name = "ovrauthreq"
    type = "VARCHAR"
  }

  column {
    name = "deducincludecopay"
    type = "VARCHAR"
  }

  column {
    name = "cd_disctype_2_"
    type = "VARCHAR"
  }

  column {
    name = "cd_disctype1_"
    type = "VARCHAR"
  }

  column {
    name = "cd_disctype2_"
    type = "VARCHAR"
  }

  column {
    name = "copaytypes"
    type = "VARCHAR"
  }

  column {
    name = "disccode1"
    type = "VARCHAR"
  }

  column {
    name = "disccode2"
    type = "VARCHAR"
  }

  column {
    name = "discper1"
    type = "VARCHAR"
  }

  column {
    name = "discper2"
    type = "VARCHAR"
  }

  column {
    name = "disctype1"
    type = "VARCHAR"
  }

  column {
    name = "disctype2"
    type = "VARCHAR"
  }

  column {
    name = "lstpatppac"
    type = "VARCHAR"
  }

  column {
    name = "moopexclchgcat"
    type = "VARCHAR"
  }

  column {
    name = "supreasoncb"
    type = "VARCHAR"
  }

  column {
    name = "moopexclchgcat2"
    type = "VARCHAR"
  }

  column {
    name = "moopexclchgcat3"
    type = "VARCHAR"
  }

  column {
    name = "moopexclchgcat4"
    type = "VARCHAR"
  }

  column {
    name = "moopexclchgcat5"
    type = "VARCHAR"
  }

  column {
    name = "moopexclchgcat6"
    type = "VARCHAR"
  }

  column {
    name = "billingreq"
    type = "VARCHAR"
  }

  column {
    name = "chkreviewoverrideins"
    type = "VARCHAR"
  }

  column {
    name = "reviewbeforebilling"
    type = "VARCHAR"
  }

  column {
    name = "reviewbeforebillingresp"
    type = "VARCHAR"
  }

  column {
    name = "reviewexcludecopay"
    type = "VARCHAR"
  }

  column {
    name = "reviewontran"
    type = "VARCHAR"
  }

  column {
    name = "reviewontranto"
    type = "VARCHAR"
  }

  column {
    name = "ccasof"
    type = "VARCHAR"
  }

  column {
    name = "cclimit"
    type = "VARCHAR"
  }

  column {
    name = "cclimitperiod"
    type = "VARCHAR"
  }

  column {
    name = "deductismet"
    type = "VARCHAR"
  }

  column {
    name = "reqpaymentusetransfer"
    type = "VARCHAR"
  }

  column {
    name = "maxoutpockperiod"
    type = "VARCHAR"
  }

  column {
    name = "patmaxoutpocketadj"
    type = "VARCHAR"
  }

  column {
    name = "payplanlimit"
    type = "VARCHAR"
  }

  column {
    name = "payplantype"
    type = "VARCHAR"
  }
}

resource "snowflake_table" "ingest_z_payor_payor" {
database            = var.landing
  schema              = "RAINTREE"
  name                = "Z_PAYOR_PAYOR"
  change_tracking     = true

  column {
    name = "_id"
    type = "VARCHAR"
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
    name = "_lastmodified_"
    type = "VARCHAR"
  }

  column {
    name = "ablewrk"
    type = "VARCHAR"
  }

  column {
    name = "addr"
    type = "VARCHAR"
  }

  column {
    name = "ass"
    type = "VARCHAR"
  }

  column {
    name = "astate"
    type = "VARCHAR"
  }

  column {
    name = "auth"
    type = "VARCHAR"
  }

  column {
    name = "authreq"
    type = "VARCHAR"
  }

  column {
    name = "bc"
    type = "VARCHAR"
  }

  column {
    name = "cd_rel_"
    type = "VARCHAR"
  }

  column {
    name = "city"
    type = "VARCHAR"
  }

  column {
    name = "code"
    type = "VARCHAR"
  }

  column {
    name = "com1"
    type = "VARCHAR"
  }

  column {
    name = "com2"
    type = "VARCHAR"
  }

  column {
    name = "com3"
    type = "VARCHAR"
  }

  column {
    name = "conde"
    type = "VARCHAR"
  }

  column {
    name = "copay1"
    type = "VARCHAR"
  }

  column {
    name = "dfc"
    type = "VARCHAR"
  }

  column {
    name = "dob"
    type = "VARCHAR"
  }

    column {
    name = "doi"
    type = "VARCHAR"
  }

  column {
    name = "ecode"
    type = "VARCHAR"
  }

  column {
    name = "edate"
    type = "VARCHAR"
  }

  column {
    name = "emerg"
    type = "VARCHAR"
  }

  column {
    name = "empid"
    type = "VARCHAR"
  }

  column {
    name = "fdate"
    type = "VARCHAR"
  }

  column {
    name = "group_"
    type = "VARCHAR"
  }

  column {
    name = "hospf"
    type = "VARCHAR"
  }

  
  column {
    name = "hospt"
    type = "VARCHAR"
  }

  column {
    name = "iname"
    type = "VARCHAR"
  }

  column {
    name = "lab"
    type = "VARCHAR"
  }

  column {
    name = "labch"
    type = "VARCHAR"
  }

  column {
    name = "medi1"
    type = "VARCHAR"
  }

  column {
    name = "medi2"
    type = "VARCHAR"
  }

  
  column {
    name = "oins"
    type = "VARCHAR"
  }

  column {
    name = "otherf"
    type = "VARCHAR"
  }

  column {
    name = "otherfn"
    type = "VARCHAR"
  }

  column {
    name = "partialdisf"
    type = "VARCHAR"
  }

  column {
    name = "partialdist"
    type = "VARCHAR"
  }

  column {
    name = "pcp"
    type = "VARCHAR"
  }

  column {
    name = "pcpreq"
    type = "VARCHAR"
  }

  column {
    name = "phone"
    type = "VARCHAR"
  }

  column {
    name = "pn"
    type = "VARCHAR"
  }

  column {
    name = "prcode"
    type = "VARCHAR"
  }

  column {
    name = "refs"
    type = "VARCHAR"
  }

  column {
    name = "refsn"
    type = "VARCHAR"
  }

  column {
    name = "rel"
    type = "VARCHAR"
  }

  column {
    name = "reld"
    type = "VARCHAR"
  }

  column {
    name = "reltod"
    type = "VARCHAR"
  }

  column {
    name = "sex"
    type = "VARCHAR"
  }

  column {
    name = "sign"
    type = "VARCHAR"
  }

  column {
    name = "sims"
    type = "VARCHAR"
  }

  column {
    name = "spoketo"
    type = "VARCHAR"
  }

  column {
    name = "ssid"
    type = "VARCHAR"
  }

  column {
    name = "state"
    type = "VARCHAR"
  }

  column {
    name = "supid"
    type = "VARCHAR"
  }

  column {
    name = "supress"
    type = "VARCHAR"
  }

  column {
    name = "zip"
    type = "VARCHAR"
  }

  column {
    name = "totaldisf"
    type = "VARCHAR"
  }

  column {
    name = "totaldist"
    type = "VARCHAR"
  }

  column {
    name = "v_standard_"
    type = "VARCHAR"
  }

  column {
    name = "vby"
    type = "VARCHAR"
  }

  column {
    name = "vdate"
    type = "VARCHAR"
  }

  column {
    name = "_myvariabledata"
    type = "VARCHAR"
  }

  column {
    name = "last"
    type = "VARCHAR"
  }

  column {
    name = "next"
    type = "VARCHAR"
  }

  column {
    name = "plan"
    type = "VARCHAR"
  }

  column {
    name = "cauto"
    type = "VARCHAR"
  }

  column {
    name = "relto"
    type = "VARCHAR"
  }

  column {
    name = "benyrdollar"
    type = "VARCHAR"
  }

  column {
    name = "benyrvisits"
    type = "VARCHAR"
  }

  column {
    name = "_cdate"
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
    name = "_mdate"
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
    name = "_timestamp_"
    type = "VARCHAR"
  }

  column {
    name = "autodeduct"
    type = "VARCHAR"
  }

  column {
    name = "cd_disctype_"
    type = "VARCHAR"
  }

  column {
    name = "chgcatcopy1"
    type = "VARCHAR"
  }

  column {
    name = "chgcatcopy2"
    type = "VARCHAR"
  }

  
  column {
    name = "chgcatcopy3"
    type = "VARCHAR"
  }

  column {
    name = "chgcatcopy4"
    type = "VARCHAR"
  }

  column {
    name = "chgcatcopy5"
    type = "VARCHAR"
  }

  column {
    name = "chgcatcopy6"
    type = "VARCHAR"
  }

  column {
    name = "chgcatcopay1"
    type = "VARCHAR"
  }

  column {
    name = "chgcatcopay2"
    type = "VARCHAR"
  }

  
  column {
    name = "chgcatcopay3"
    type = "VARCHAR"
  }

  column {
    name = "chgcatcopay4"
    type = "VARCHAR"
  }

  column {
    name = "chgcatcopay5"
    type = "VARCHAR"
  }

  column {
    name = "chgcatcopay6"
    type = "VARCHAR"
  }

  column {
    name = "chkcopayoverrideins"
    type = "VARCHAR"
  }

  column {
    name = "country"
    type = "VARCHAR"
  }

  column {
    name = "cptcopayamt1"
    type = "VARCHAR"
  }

  column {
    name = "cptcopayamt2"
    type = "VARCHAR"
  }

  column {
    name = "cptcopayamt3"
    type = "VARCHAR"
  }

  column {
    name = "cptcopayamt4"
    type = "VARCHAR"
  }

  column {
    name = "cptcopayamt5"
    type = "VARCHAR"
  }

  column {
    name = "cptcopayamt6"
    type = "VARCHAR"
  }

  column {
    name = "cptcopaychg1"
    type = "VARCHAR"
  }

  column {
    name = "cptcopaychg2"
    type = "VARCHAR"
  }

  column {
    name = "cptcopaychg3"
    type = "VARCHAR"
  }

  column {
    name = "cptcopaychg4"
    type = "VARCHAR"
  }

  column {
    name = "cptcopaychg5"
    type = "VARCHAR"
  }

  column {
    name = "cptcopaychg6"
    type = "VARCHAR"
  }

  column {
    name = "deductmet"
    type = "VARCHAR"
  }

  column {
    name = "deductrefreshdate"
    type = "VARCHAR"
  }

  column {
    name = "deductrem"
    type = "VARCHAR"
  }

  column {
    name = "image_back"
    type = "VARCHAR"
  }

  column {
    name = "image_front"
    type = "VARCHAR"
  }

  column {
    name = "image_verif"
    type = "VARCHAR"
  }

  column {
    name = "instypecode"
    type = "VARCHAR"
  }

  column {
    name = "maxoutpock"
    type = "VARCHAR"
  }

  column {
    name = "maxoutpockrem"
    type = "VARCHAR"
  }

  column {
    name = "maxoutpockused"
    type = "VARCHAR"
  }

  column {
    name = "outsidededuct"
    type = "VARCHAR"
  }

  column {
    name = "outsidedeductasof"
    type = "VARCHAR"
  }

  column {
    name = "pocfrom"
    type = "VARCHAR"
  }

  column {
    name = "pocto"
    type = "VARCHAR"
  }

  column {
    name = "prog"
    type = "VARCHAR"
  }

  column {
    name = "rejdate"
    type = "VARCHAR"
  }

  column {
    name = "visitcopayamt1"
    type = "VARCHAR"
  }

  column {
    name = "visitcopayamt2"
    type = "VARCHAR"
  }

  column {
    name = "visitcopayamt3"
    type = "VARCHAR"
  }

  column {
    name = "visitcopayamt4"
    type = "VARCHAR"
  }

  column {
    name = "visitcopayamt5"
    type = "VARCHAR"
  }

  column {
    name = "visitcopayamt6"
    type = "VARCHAR"
  }

  column {
    name = "visitcopayfrom1"
    type = "VARCHAR"
  }

  column {
    name = "visitcopayfrom2"
    type = "VARCHAR"
  }

  column {
    name = "visitcopayfrom3"
    type = "VARCHAR"
  }

  column {
    name = "visitcopayfrom4"
    type = "VARCHAR"
  }

  column {
    name = "visitcopayfrom5"
    type = "VARCHAR"
  }

  column {
    name = "visitcopayfrom6"
    type = "VARCHAR"
  }

  column {
    name = "visitcopayto1"
    type = "VARCHAR"
  }

  column {
    name = "visitcopayto2"
    type = "VARCHAR"
  }

  column {
    name = "visitcopayto3"
    type = "VARCHAR"
  }

  column {
    name = "visitcopayto4"
    type = "VARCHAR"
  }

  column {
    name = "visitcopayto5"
    type = "VARCHAR"
  }

  column {
    name = "visitcopayto6"
    type = "VARCHAR"
  }

  column {
    name = "yearlydeduct"
    type = "VARCHAR"
  }

  column {
    name = "cd_country_"
    type = "VARCHAR"
  }

  column {
    name = "cd_instypecode_"
    type = "VARCHAR"
  }

  column {
    name = "benyrvisitsrem"
    type = "VARCHAR"
  }

  column {
    name = "benyrvisitsused"
    type = "VARCHAR"
  }

  column {
    name = "lastresortresp"
    type = "VARCHAR"
  }

  column {
    name = "patmaxoutpocket"
    type = "VARCHAR"
  }

  column {
    name = "sfirst"
    type = "VARCHAR"
  }

  column {
    name = "slast"
    type = "VARCHAR"
  }

  column {
    name = "smi"
    type = "VARCHAR"
  }

  column {
    name = "maxoutpockusedout"
    type = "VARCHAR"
  }

  column {
    name = "benefitrefreshdate"
    type = "VARCHAR"
  }

  column {
    name = "benoverideins"
    type = "VARCHAR"
  }

  column {
    name = "benyrdollarrem"
    type = "VARCHAR"
  }

  column {
    name = "benyrdollarused"
    type = "VARCHAR"
  }

  column {
    name = "benyrdollarusedoutside"
    type = "VARCHAR"
  }

  column {
    name = "benyrvisitsusedoutside"
    type = "VARCHAR"
  }

  column {
    name = "outsidebenefitasof"
    type = "VARCHAR"
  }

  column {
    name = "sname"
    type = "VARCHAR"
  }

  column {
    name = "chgcatcopay10"
    type = "VARCHAR"
  }

  column {
    name = "chgcatcopay11"
    type = "VARCHAR"
  }

  column {
    name = "chgcatcopay12"
    type = "VARCHAR"
  }

  column {
    name = "chgcatcopay7"
    type = "VARCHAR"
  }

  column {
    name = "chgcatcopay8"
    type = "VARCHAR"
  }

  column {
    name = "chgcatcopay9"
    type = "VARCHAR"
  }

  column {
    name = "chgcatcopayamt10"
    type = "VARCHAR"
  }

  column {
    name = "chgcatcopayamt11"
    type = "VARCHAR"
  }

  column {
    name = "chgcatcopayamt12"
    type = "VARCHAR"
  }

  column {
    name = "chgcatcopayamt7"
    type = "VARCHAR"
  }

  column {
    name = "chgcatcopayamt8"
    type = "VARCHAR"
  }

  column {
    name = "chgcatcopayamt9"
    type = "VARCHAR"
  }

  column {
    name = "cptcopayamt10"
    type = "VARCHAR"
  }

  column {
    name = "cptcopayamt11"
    type = "VARCHAR"
  }

  column {
    name = "cptcopayamt12"
    type = "VARCHAR"
  }

  column {
    name = "cptcopayamt7"
    type = "VARCHAR"
  }

  column {
    name = "cptcopayamt8"
    type = "VARCHAR"
  }

  column {
    name = "cptcopayamt9"
    type = "VARCHAR"
  }

  column {
    name = "cptcopaychg10"
    type = "VARCHAR"
  }

  column {
    name = "cptcopaychg11"
    type = "VARCHAR"
  }

  column {
    name = "cptcopaychg12"
    type = "VARCHAR"
  }

  column {
    name = "cptcopaychg7"
    type = "VARCHAR"
  }

  column {
    name = "cptcopaychg8"
    type = "VARCHAR"
  }

  column {
    name = "cptcopaychg9"
    type = "VARCHAR"
  }

  column {
    name = "ovrauthreq"
    type = "VARCHAR"
  }

  column {
    name = "deducincludecopay"
    type = "VARCHAR"
  }

  column {
    name = "cd_disctype_2_"
    type = "VARCHAR"
  }

  column {
    name = "cd_disctype1_"
    type = "VARCHAR"
  }

  column {
    name = "cd_disctype2_"
    type = "VARCHAR"
  }

  column {
    name = "copaytypes"
    type = "VARCHAR"
  }

  column {
    name = "disccode1"
    type = "VARCHAR"
  }

  column {
    name = "disccode2"
    type = "VARCHAR"
  }

  column {
    name = "discper1"
    type = "VARCHAR"
  }

  column {
    name = "discper2"
    type = "VARCHAR"
  }

  column {
    name = "disctype1"
    type = "VARCHAR"
  }

  column {
    name = "disctype2"
    type = "VARCHAR"
  }

  column {
    name = "lstpatppac"
    type = "VARCHAR"
  }

  column {
    name = "moopexclchgcat"
    type = "VARCHAR"
  }

  column {
    name = "supreasoncb"
    type = "VARCHAR"
  }

  column {
    name = "moopexclchgcat2"
    type = "VARCHAR"
  }

  column {
    name = "moopexclchgcat3"
    type = "VARCHAR"
  }

  column {
    name = "moopexclchgcat4"
    type = "VARCHAR"
  }

  column {
    name = "moopexclchgcat5"
    type = "VARCHAR"
  }

  column {
    name = "moopexclchgcat6"
    type = "VARCHAR"
  }

  column {
    name = "billingreq"
    type = "VARCHAR"
  }

  column {
    name = "chkreviewoverrideins"
    type = "VARCHAR"
  }

  column {
    name = "reviewbeforebilling"
    type = "VARCHAR"
  }

  column {
    name = "reviewbeforebillingresp"
    type = "VARCHAR"
  }

  column {
    name = "reviewexcludecopay"
    type = "VARCHAR"
  }

  column {
    name = "reviewontran"
    type = "VARCHAR"
  }

  column {
    name = "reviewontranto"
    type = "VARCHAR"
  }

  column {
    name = "ccasof"
    type = "VARCHAR"
  }

  column {
    name = "cclimit"
    type = "VARCHAR"
  }

  column {
    name = "cclimitperiod"
    type = "VARCHAR"
  }

  column {
    name = "deductismet"
    type = "VARCHAR"
  }

  column {
    name = "reqpaymentusetransfer"
    type = "VARCHAR"
  }

  column {
    name = "maxoutpockperiod"
    type = "VARCHAR"
  }

  column {
    name = "patmaxoutpocketadj"
    type = "VARCHAR"
  }

  column {
    name = "payplanlimit"
    type = "VARCHAR"
  }

  column {
    name = "payplantype"
    type = "VARCHAR"
  }
}