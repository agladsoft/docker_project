CREATE OR REPLACE VIEW default.import_nle_total
AS SELECT
    tmp2.month AS month,
    tmp2.year AS year,
    tmp2.direction AS direction,
    tmp2.is_empty AS is_empty,
    tmp2.is_ref AS is_ref,
    sum(tmp2.teu) AS teu_total
   FROM ( SELECT import_enriched.month,
            import_enriched.year AS year,
            import_enriched.direction AS direction,
            import_enriched.is_empty AS is_empty,
            import_enriched.teu AS teu,
            import_enriched.container_type_unified AS container_type_unified,
                CASE
                    WHEN ilike(upper(import_enriched.container_type_unified), '%REF%') THEN true
                    ELSE false
                END AS is_ref
           FROM default.import_enriched
          WHERE import_enriched.terminal = 'nle') tmp2
  GROUP BY tmp2.month, tmp2.year, tmp2.direction, tmp2.is_empty, tmp2.is_ref;
