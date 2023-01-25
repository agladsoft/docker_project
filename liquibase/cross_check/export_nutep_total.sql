CREATE OR REPLACE VIEW default.export_nutep_total
AS SELECT
    ec3.year_parsed_on AS year_parsed_on,
    ec3.month_parsed_on AS month_parsed_on,
    ec3.ship_name_unified AS ship_name_unified,
    ec3.direction AS direction,
    ec3.is_empty AS is_empty,
    ec3.line_unified AS line_unified,
    ec3.container_size AS container_size,
    count(ec3.container_size) AS total_count,
    sum(ec3.cargo_count) AS cargo_count,
    sum(ec3.records_count) AS records_count,
    min(ec3.teu) AS teu,
    count(ec3.container_size) * min(ec3.teu) AS total_teu,
    ec3.terminal AS terminal
   FROM default.export_combined_cargo_check ec3
  WHERE ec3.terminal = 'nutep'
  GROUP BY ec3.year_parsed_on, ec3.month_parsed_on, ec3.ship_name_unified, ec3.direction, ec3.is_empty, ec3.line_unified, ec3.container_size, ec3.terminal;
