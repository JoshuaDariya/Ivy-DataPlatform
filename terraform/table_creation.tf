resource "snowflake_table" "ingest_ivyfotoexport_stage" {
  database            = var.landing
  schema              = "RAINTREE"
  name                = "Z_IVYFOTOEXPORT"
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
  name                = "Z_IVYCASEDATAEXPORT"
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
    name = "PrefferedPhone"
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
    name = "PrefferedPhone"
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
  name                = "IVY_LOCATIONS_REPORT"
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
  name                = "Z_IVY_LOCATIONS_REPORT"
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
 