CREATE OR REPLACE VIEW default.import_nw_enriched
AS SELECT
    import_nw.import_nw_id AS import_nw_id,
    import_nw.year AS year,
    import_nw.month AS month,
    import_nw.period AS period,
    import_nw.line AS line,
    import_nw.shipper_name AS shipper_name,
    import_nw.expeditor AS expeditor,
    import_nw.goods_name AS goods_name,
    import_nw.container_type AS container_type,
    import_nw.container_size AS container_size,
    import_nw.container_count AS container_count,
    import_nw.terminal AS terminal,
    'import' AS direction,
    import_nw.teu AS teu,
    import_nw.container_number AS container_number,
    import_nw.tnved AS tnved,
    import_nw.shipper_country AS shipper_country,
    import_nw.consignment AS consignment,
    import_nw.park_type AS park_type,
    import_nw.goods_weight_netto AS goods_weight_netto,
    import_nw.tnved_group_id AS tnved_group_id,
    rt.goods_name AS tnved_group_name,
    ri.company_inn AS consignee_inn,
    import_nw.consignee_name AS consignee_name,
    ri.company_name_unified AS consignee_name_unified,
    import_nw.departure_port AS seaport,
    rg.seaport_unified AS seaport_unified,
    rg.country AS country,
    rg.region AS region,
    rgeo.lat_port AS lat_port,
    rgeo.long_port AS long_port
   FROM default.import_nw
     LEFT JOIN default.reference_tnved2_actual rt ON import_nw.tnved_group_id = rt.group_tnved
     LEFT JOIN default.reference_inn ri ON import_nw.consignee_name = ri.company_name
     LEFT JOIN default.reference_region rg ON import_nw.departure_port = rg.seaport
     LEFT JOIN default.reference_geo rgeo ON import_nw.departure_port = rgeo.seaport;
