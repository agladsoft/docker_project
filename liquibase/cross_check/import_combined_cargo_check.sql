CREATE OR REPLACE VIEW default.import_combined_cargo_check
AS SELECT
    icdc.year_parsed_on AS year_parsed_on,
    icdc.month_parsed_on AS month_parsed_on,
    icdc.ship_name_unified AS ship_name_unified,
    icdc.direction AS direction,
    icdc.is_empty AS is_empty,
    icdc.line_unified AS line_unified,
    icdc.container_size AS container_size,
    icdc.container_number AS container_number,
    icdc.date AS date,
    count(icdc.container_number) AS cargo_count,
    sum(icdc.records_count) AS records_count,
    min(icdc.teu) AS teu,
    icdc.terminal AS terminal
   FROM default.import_consignment_duplicates_check icdc
  GROUP BY icdc.year_parsed_on, icdc.month_parsed_on, icdc.ship_name_unified, icdc.direction, icdc.is_empty, icdc.line_unified, icdc.container_size, icdc.container_number, icdc.date, icdc.terminal;
