CREATE OR REPLACE VIEW default.import_nutep_total
AS SELECT
    ic3.year_parsed_on AS year_parsed_on,
    ic3.month_parsed_on AS month_parsed_on,
    ic3.ship_name_unified AS ship_name_unified,
    ic3.direction AS direction,
    ic3.is_empty AS is_empty,
    ic3.line_unified AS line_unified,
    ic3.container_size AS container_size,
    count(ic3.container_size) AS total_count,
    sum(ic3.cargo_count) AS cargo_count,
    sum(ic3.records_count) AS records_count,
    min(ic3.teu) AS teu,
    count(ic3.container_size) * min(ic3.teu) AS total_teu,
    ic3.terminal AS terminal
   FROM default.import_combined_cargo_check ic3
  WHERE ic3.terminal = 'nutep'
  GROUP BY ic3.year_parsed_on, ic3.month_parsed_on, ic3.ship_name_unified, ic3.direction, ic3.is_empty, ic3.line_unified, ic3.container_size, ic3.terminal;
