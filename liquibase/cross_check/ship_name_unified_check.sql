CREATE OR REPLACE VIEW default.ship_name_unified_check
AS SELECT import_enriched.ship_name AS ship_name,
    import_enriched.ship_name_unified AS ship_name_unified
   FROM default.import_enriched
  WHERE import_enriched.ship_name_unified IS NULL
UNION DISTINCT
 SELECT statistics_enriched.ship_name AS ship_name,
    statistics_enriched.ship_name_unified AS ship_name_unified
   FROM default.statistics_enriched
  WHERE statistics_enriched.ship_name_unified IS NULL
UNION DISTINCT
 SELECT export_enriched.ship_name AS ship_name,
    export_enriched.ship_name_unified AS ship_name_unified
   FROM default.export_enriched
  WHERE export_enriched.ship_name_unified IS NULL;
