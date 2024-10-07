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

resource "snowflake_table" "workday_transformation_status" {
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