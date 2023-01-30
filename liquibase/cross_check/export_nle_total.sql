CREATE OR REPLACE VIEW default.export_nle_total
AS SELECT
    tmp2.month AS month,
    tmp2.year AS year,
    tmp2.direction AS direction,
    tmp2.is_empty AS is_empty,
    tmp2.is_ref AS is_ref,
    sum(tmp2.teu) AS teu_total
   FROM ( SELECT export_enriched.month,
            export_enriched.year AS year,
            export_enriched.direction AS direction,
            export_enriched.is_empty AS is_empty,
            export_enriched.teu AS teu,
            export_enriched.container_type_unified AS container_type_unified,
                CASE
                    WHEN ilike(upper(export_enriched.container_type_unified), '%REF%') THEN true
                    ELSE false
                END AS is_ref
           FROM default.export_enriched
          WHERE export_enriched.terminal = 'nle') tmp2
  GROUP BY tmp2.month, tmp2.year, tmp2.direction, tmp2.is_empty, tmp2.is_ref;
