CREATE OR REPLACE VIEW default.nle_cross
AS SELECT
    nle_cross_export.year AS year,
    nle_cross_export.month AS month,
    nle_cross_export.direction AS direction,
    nle_cross_export.is_ref AS is_ref,
    nle_cross_export.is_empty AS is_empty,
    nle_cross_export.teu_morservice AS teu_morservice,
    nle_cross_export.teu AS teu,
    nle_cross_export.teu_delta AS teu_delta
   FROM default.nle_cross_export
UNION ALL
 SELECT
    nle_cross_import.year AS year,
    nle_cross_import.month AS month,
    nle_cross_import.direction AS direction,
    nle_cross_import.is_ref AS is_ref,
    nle_cross_import.is_empty AS is_empty,
    nle_cross_import.teu_morservice AS teu_morservice,
    nle_cross_import.teu AS teu,
    nle_cross_import.teu_delta AS teu_delta
   FROM default.nle_cross_import;
