CREATE OR REPLACE VIEW default.import_enriched
AS SELECT 
    import.import_id AS import_id,
    import.ship AS ship_name,
    rs.ship_name_unified AS ship_name_unified,
    'import' AS direction,
        CASE
            WHEN re.is_empty_unified = import.goods_name_rus THEN true
            ELSE false
        END AS is_empty,
    import.date AS date,
    import.terminal AS terminal,
    import.container_number AS container_number,
        CASE
            WHEN import.container_size = 45 THEN 40
            WHEN import.container_size = 22 THEN 20
            ELSE import.container_size
        END AS container_size,
    import.container_type AS container_type,
    rct.container_type_unified AS container_type_unified,
    import.goods_name_rus AS goods_name_rus,
    import.consignment AS consignment,
    import.shipper AS shipper,
    import.line AS line,
    rl.line_unified AS line_unified,
    import.count AS count,
    import.teu AS teu,
    import.voyage AS voyage,
    import.shipper_country AS shipper_country,
    import.goods_weight AS goods_weight,
    import.package_number AS package_number,
    import.city AS city,
    import.shipper_seaport AS shipper_seaport,
    import.year AS year,
    import.month AS month,
    import.goods_tnved AS goods_tnved,
    import.parsed_on AS parsed_on,
    import.year_parsed_on AS year_parsed_on,
    import.month_parsed_on AS month_parsed_on,
    import.consignee AS consignee,
    import.original_file_name AS original_file_name,
    import.original_file_parsed_on AS original_file_parsed_on,
    ri.company_inn AS consignee_inn,
    ri.company_name_unified AS consignee_name_unified,
    import.shipper_seaport AS seaport,
    rg.seaport_unified AS seaport_unified,
    rg.country AS country,
    rg.region AS region,
    rt.goods_name AS tnved_group_name,
    rgeo.lat_port AS lat_port,
    rgeo.long_port AS long_port
   FROM default.import
     LEFT JOIN default.reference_inn AS ri ON import.consignee = ri.company_name
     LEFT JOIN default.reference_is_empty AS re ON import.goods_name_rus = re.is_empty
     LEFT JOIN default.reference_lines AS rl ON import.line = rl.line
     LEFT JOIN default.reference_ship AS rs ON import.ship = rs.ship_name
     LEFT JOIN default.reference_container_type AS rct ON import.container_type = rct.container_type
     LEFT JOIN default.reference_region AS rg ON import.shipper_seaport = rg.seaport
     LEFT JOIN default.reference_tnved2_actual AS rt ON import.goods_tnved = rt.group_tnved
     LEFT JOIN default.reference_geo AS rgeo ON import.shipper_seaport = rgeo.seaport;
