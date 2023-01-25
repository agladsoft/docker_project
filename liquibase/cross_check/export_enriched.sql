CREATE OR REPLACE VIEW default.export_enriched
AS SELECT
    export.export_id AS export_id,
    export.ship AS ship_name,
    rs.ship_name_unified AS ship_name_unified,
    'export' AS direction,
    export.goods_name_rus AS goods_name_rus,
    re.is_empty AS goods_is_empty,
        CASE
            WHEN re.is_empty = export.goods_name_rus THEN true
            ELSE false
        END AS is_empty,
    export.date AS date,
    export.terminal AS terminal,
    export.container_number AS container_number,
        CASE
            WHEN export.container_size = 45 THEN 40
            WHEN export.container_size = 22 THEN 20
            ELSE export.container_size
        END AS container_size,
    export.container_type AS container_type,
    rct.container_type_unified AS container_type_unified,
    export.consignment AS consignment,
    export.shipper AS shipper,
    export.line AS line,
    rl.line_unified AS line_unified,
    export.count AS count,
    export.teu AS teu,
    export.voyage AS voyage,
    export.unload_country AS unload_country,
    export.city AS city,
    export.unload_seaport AS unload_seaport,
    export.year AS year,
    export.month AS month,
    export.goods_tnved AS goods_tnved,
    export.parsed_on AS parsed_on,
    export.year_parsed_on AS year_parsed_on,
    export.month_parsed_on AS month_parsed_on,
    export.consignee AS consignee,
    export.original_file_name AS original_file_name,
    export.original_file_parsed_on AS original_file_parsed_on,
    ri.company_inn AS shipper_inn,
    ri.company_name_unified AS shipper_name_unified,
    rg.seaport_unified AS seaport_unified,
    rg.country AS country,
    rg.region AS region,
    rt.goods_name AS tnved_group_name,
    rgeo.lat_port AS lat_port,
    rgeo.long_port AS long_port
   FROM default.export
     LEFT JOIN default.reference_inn ri ON export.shipper = ri.company_name
     LEFT JOIN default.reference_is_empty re ON export.goods_name_rus = re.is_empty
     LEFT JOIN default.reference_lines rl ON export.line = rl.line
     LEFT JOIN default.reference_ship rs ON export.ship = rs.ship_name
     LEFT JOIN default.reference_container_type rct ON export.container_type = rct.container_type
     LEFT JOIN default.reference_region rg ON export.unload_seaport = rg.seaport
     LEFT JOIN default.reference_tnved2_actual rt ON export.goods_tnved = rt.group_tnved
     LEFT JOIN default.reference_geo rgeo ON export.unload_seaport = rgeo.seaport;
