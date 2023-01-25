CREATE OR REPLACE VIEW default.import_final
AS SELECT
    ie.import_id AS import_id,
    ie.date AS date,
    ie.year_parsed_on AS year_parsed_on,
    ie.month_parsed_on AS month_parsed_on,
    ie.count AS count,
    ie.container_type AS container_type,
    ie.container_number AS container_number,
    ie.container_size AS container_size,
    ie.teu AS teu,
    ie.goods_name_rus AS goods_name_rus,
    ie.ship_name_unified AS ship_name_unified,
    ie.shipper AS shipper,
    ie.consignee AS consignee,
    ie.line_unified AS line_unified,
    ie.consignment AS consignment,
    ie.terminal AS terminal,
    ie.goods_tnved AS goods_tnved,
    ie.shipper_seaport AS shipper_seaport,
    ie.shipper_country AS shipper_country
   FROM default.import_enriched ie;
