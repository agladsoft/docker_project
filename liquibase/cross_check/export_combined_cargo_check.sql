CREATE OR REPLACE VIEW default.export_combined_cargo_check
AS SELECT
    ecdc.year_parsed_on AS year_parsed_on,
    ecdc.month_parsed_on AS month_parsed_on,
    ecdc.ship_name_unified AS ship_name_unified,
    ecdc.direction AS direction,
    ecdc.is_empty AS is_empty,
    ecdc.line_unified AS line_unified,
    ecdc.container_size AS container_size,
    ecdc.container_number AS container_number,
    ecdc.date AS date,
    count(ecdc.container_number) AS cargo_count,
    sum(ecdc.records_count) AS records_count,
    min(ecdc.teu) AS teu,
    ecdc.terminal AS terminal
   FROM default.export_consignment_duplicates_check ecdc
  GROUP BY ecdc.year_parsed_on, ecdc.month_parsed_on, ecdc.ship_name_unified, ecdc.direction, ecdc.is_empty, ecdc.line_unified, ecdc.container_size, ecdc.container_number, ecdc.date, ecdc.terminal;
