CREATE OR REPLACE VIEW default.export_consignment_duplicates_check
AS SELECT
    ee.year_parsed_on AS year_parsed_on,
    ee.month_parsed_on AS month_parsed_on,
    ee.ship_name_unified AS ship_name_unified,
    ee.direction AS direction,
    ee.is_empty AS is_empty,
    ee.line_unified AS line_unified,
    ee.container_size AS container_size,
    ee.container_number AS container_number,
    ee.date AS date,
    ee.consignment AS consignment,
    count(ee.consignment) AS records_count,
    min(ee.teu) AS teu,
    ee.terminal AS terminal
   FROM default.export_enriched ee
  GROUP BY ee.year_parsed_on, ee.month_parsed_on, ee.ship_name_unified, ee.direction, ee.is_empty, ee.line_unified, ee.container_size, ee.container_number, ee.date, ee.consignment, ee.terminal;
