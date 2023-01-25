CREATE OR REPLACE VIEW default.export_vsk_enriched
AS SELECT
    export_vsk.export_vsk_id AS export_vsk_id,
    export_vsk.year AS year,
    export_vsk.month AS month,
    export_vsk.shipment_date AS shipment_date,
    export_vsk.terminal AS terminal,
    'export' AS direction,
    export_vsk.line AS line,
    export_vsk.expeditor AS shipping_agent,
    export_vsk.container_number AS container_number,
    export_vsk.destination_port AS destination_port,
    export_vsk.goods_name AS goods_name,
    export_vsk.teu AS teu,
    export_vsk.container_size AS container_size,
    export_vsk.container_type AS container_type,
    export_vsk.shipper_country AS shipper_country,
    export_vsk.shipper_region AS shipper_region,
    export_vsk.gtd_number AS gtd_number,
    export_vsk.park_type AS park_type,
    export_vsk.tnved AS tnved,
    export_vsk.ship_name AS ship_name,
    export_vsk.consignee_name AS consignee_name,
    export_vsk.booking AS booking,
    export_vsk.tnved_group_id AS tnved_group_id,
    rt.goods_name AS tnved_group_name,
    ri.company_inn AS shipper_inn,
    export_vsk.shipper_name AS shipper_name,
    ri.company_name_unified AS shipper_name_unified,
    export_vsk.destination_port AS seaport,
    rg.seaport_unified AS seaport_unified,
    rg.country AS country,
    rg.region AS region,
    rgeo.lat_port AS lat_port,
    rgeo.long_port AS long_port
   FROM default.export_vsk
     LEFT JOIN default.reference_tnved2_actual rt ON export_vsk.tnved_group_id = rt.group_tnved
     LEFT JOIN default.reference_inn ri ON export_vsk.shipper_name = ri.company_name
     LEFT JOIN default.reference_region rg ON export_vsk.destination_port = rg.seaport
     LEFT JOIN default.reference_geo rgeo ON export_vsk.destination_port = rgeo.seaport;
