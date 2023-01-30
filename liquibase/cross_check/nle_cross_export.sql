CREATE OR REPLACE VIEW default.nle_cross_export
AS SELECT
    ms.year AS year,
    ms.month AS month,
    ms.direction AS direction,
    ms.is_ref AS is_ref,
    ms.is_empty AS is_empty,
    ms.teu AS teu_morservice,
    ems.teu_total AS teu,
    ms.teu - ems.teu_total AS teu_delta
   FROM default.reference_morservice ms
     LEFT JOIN default.export_nle_total ems ON ms.year = ems.year AND ms.month = ems.month AND ms.direction = ems.direction AND ms.is_empty = ems.is_empty AND ms.is_ref = ems.is_ref
  WHERE ms.direction = 'export';
