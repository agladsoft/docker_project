CREATE OR REPLACE VIEW default.statistics_total
AS SELECT
    statistics_enriched.year AS year,
    statistics_enriched.month AS month,
    statistics_enriched.ship_name_unified AS ship_name_unified,
    statistics_enriched.direction AS direction,
    statistics_enriched.is_empty AS is_empty,
    statistics_enriched.line_unified AS line_unified,
    statistics_enriched.container_size AS container_size,
    sum(statistics_enriched.count) AS total_count,
    sum(statistics_enriched.teu) AS total_teu
   FROM default.statistics_enriched
  GROUP BY statistics_enriched.year, statistics_enriched.month, statistics_enriched.ship_name_unified, statistics_enriched.direction, statistics_enriched.is_empty, statistics_enriched.line_unified, statistics_enriched.container_size;
