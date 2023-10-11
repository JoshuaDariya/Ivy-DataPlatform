resource "snowflake_table" "ingest_ivyfotoexport" {
  database            = var.landing
  schema              = "RAINTREE"
  name                = "IVYFOTOEXPORT"
  change_tracking     = true

  column {
    name = "score"
    type = "STRING"
  }

  column {
    name = "goal"
    type = "STRING"
  }

  column {
    name = "latest"
    type = "STRING"
  }

  column {
    name = "tab"
    type = "STRING"
  }

  column {
    name = "assessment_section"
    type = "STRING"
  }

  column {
    name = "patient"
    type = "STRING"
  }

  column {
    name = "caseindex"
    type = "STRING"
  }

  column {
    name = "fotoindex"
    type = "STRING"
  }

  column {
    name = "episodeid"
    type = "STRING"
  }

  column {
    name = "reportid"
    type = "STRING"
  }

  column {
    name = "surveystarted"
    type = "STRING"
  }

  column {
    name = "surveycompleted"
    type = "STRING"
  }

  column {
    name = "reporttype"
    type = "STRING"
  }

  column {
    name = "mcii"
    type = "STRING"
  }

  column {
    name = "mdc"
    type = "STRING"
  }

  column {
    name = "episodeduration"
    type = "STRING"
  }

  column {
    name = "physicalfschange"
    type = "STRING"
  }

  column {
    name = "riskadjfoto"
    type = "STRING"
  }

  column {
    name = "visitsperepisode"
    type = "STRING"
  }

  column {
    name = "dischargefsscore"
    type = "STRING"
  }

  column {
    name = "avgsatisfaction"
    type = "STRING"
  }
}
