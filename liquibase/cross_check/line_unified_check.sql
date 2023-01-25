CREATE OR REPLACE VIEW default.line_unified_check
AS SELECT import_enriched.line AS line,
    import_enriched.line_unified AS line_unified
   FROM default.import_enriched
  WHERE import_enriched.line_unified IS NULL
UNION DISTINCT
 SELECT statistics_enriched.line AS line,
    statistics_enriched.line_unified AS line_unified
   FROM default.statistics_enriched
  WHERE statistics_enriched.line_unified IS NULL
UNION DISTINCT
 SELECT export_enriched.line AS line,
    export_enriched.line_unified AS line_unified
   FROM default.export_enriched
  WHERE export_enriched.line_unified IS NULL;
