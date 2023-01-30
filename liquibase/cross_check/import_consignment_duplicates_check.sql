CREATE OR REPLACE VIEW default.import_consignment_duplicates_check
AS SELECT
    ie.year_parsed_on AS year_parsed_on,
    ie.month_parsed_on AS month_parsed_on,
    ie.ship_name_unified AS ship_name_unified,
    ie.direction AS direction,
    ie.is_empty AS is_empty,
    ie.line_unified AS line_unified,
    ie.container_size AS container_size,
    ie.container_number AS container_number,
    ie.date AS date,
    ie.consignment AS consignment,
    count(ie.consignment) AS records_count,
    min(ie.teu) AS teu,
    ie.terminal AS terminal
   FROM default.import_enriched ie
  GROUP BY ie.year_parsed_on, ie.month_parsed_on, ie.ship_name_unified, ie.direction, ie.is_empty, ie.line_unified, ie.container_size, ie.container_number, ie.date, ie.consignment, ie.terminal;
