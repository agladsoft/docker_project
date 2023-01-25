CREATE OR REPLACE VIEW default.nutep_cross
AS SELECT
    nutep_cross_import.year AS year,
    nutep_cross_import.month AS month,
    nutep_cross_import.ship_name_unified AS ship_name_unified,
    nutep_cross_import.direction AS direction,
    nutep_cross_import.is_empty AS is_empty,
    nutep_cross_import.line_unified AS line_unified,
    nutep_cross_import.container_size AS container_size,
    nutep_cross_import.count_stat AS count_stat,
    nutep_cross_import.teu_stat AS teu_stat,
    nutep_cross_import.count AS count,
    nutep_cross_import.teu AS teu,
    nutep_cross_import.count_delta AS count_delta,
    nutep_cross_import.teu_delta AS teu_delta
   FROM default.nutep_cross_import
UNION ALL
 SELECT
    nutep_cross_export.year AS year,
    nutep_cross_export.month AS month,
    nutep_cross_export.ship_name_unified AS ship_name_unified,
    nutep_cross_export.direction AS direction,
    nutep_cross_export.is_empty AS is_empty,
    nutep_cross_export.line_unified AS line_unified,
    nutep_cross_export.container_size AS container_size,
    nutep_cross_export.count_stat AS count_stat,
    nutep_cross_export.teu_stat AS teu_stat,
    nutep_cross_export.count AS count,
    nutep_cross_export.teu AS teu,
    nutep_cross_export.count_delta AS count_delta,
    nutep_cross_export.teu_delta AS teu_delta
   FROM default.nutep_cross_export;
