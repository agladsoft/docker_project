CREATE OR REPLACE VIEW default.nle_cross_import
AS SELECT
    ms.year AS year,
    ms.month AS month,
    ms.direction AS direction,
    ms.is_ref AS is_ref,
    ms.is_empty AS is_empty,
    ms.teu AS teu_morservice,
    ims.teu_total AS teu,
    ms.teu - ims.teu_total AS teu_delta
   FROM default.reference_morservice ms
     LEFT JOIN default.import_nle_total ims ON ms.year = ims.year AND ms.month = ims.month AND ms.direction = ims.direction AND ms.is_empty = ims.is_empty AND ms.is_ref = ims.is_ref
  WHERE ms.direction = 'import';
