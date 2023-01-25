CREATE OR REPLACE VIEW default.export_nw_enriched
AS SELECT
    export_nw.export_nw_id AS export_nw_id,
    export_nw.year AS year,
    export_nw.month AS month,
    export_nw.period AS period,
    export_nw.line AS line,
    export_nw.consignee_name AS consignee_name,
    export_nw.expeditor AS expeditor,
    export_nw.goods_name AS goods_name,
    export_nw.container_type AS container_type,
    export_nw.container_size AS container_size,
    export_nw.container_count AS container_count,
    export_nw.terminal AS terminal,
    'export' AS direction,
    export_nw.teu AS teu,
    export_nw.container_number AS container_number,
    export_nw.declaration_number_gtd AS declaration_number_gtd,
    export_nw.tnved AS tnved,
    export_nw.shipper_country AS shipper_country,
    export_nw.consignment AS consignment,
    export_nw.park_type AS park_type,
    export_nw.goods_weight_netto AS goods_weight_netto,
    export_nw.tnved_group_id AS tnved_group_id,
    rt.goods_name AS tnved_group_name,
    ri.company_inn AS shipper_inn,
    export_nw.shipper_name AS shipper_name,
    ri.company_name_unified AS shipper_name_unified,
    export_nw.destination_port AS seaport,
    rg.seaport_unified AS seaport_unified,
    rg.country AS country,
    rg.region AS region,
    rgeo.lat_port AS lat_port,
    rgeo.long_port AS long_port
   FROM default.export_nw
     LEFT JOIN default.reference_tnved2_actual rt ON export_nw.tnved_group_id = rt.group_tnved
     LEFT JOIN default.reference_inn ri ON export_nw.shipper_name = ri.company_name
     LEFT JOIN default.reference_region rg ON export_nw.destination_port = rg.seaport
     LEFT JOIN default.reference_geo rgeo ON export_nw.destination_port = rgeo.seaport;
