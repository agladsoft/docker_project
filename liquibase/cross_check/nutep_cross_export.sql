CREATE OR REPLACE VIEW default.nutep_cross_export
AS SELECT
    st.year AS year,
    st.month AS month,
    st.ship_name_unified AS ship_name_unified,
    st.direction AS direction,
    st.is_empty AS is_empty,
    st.line_unified AS line_unified,
    st.container_size AS container_size,
    st.total_count AS count_stat,
    st.total_teu AS teu_stat,
    et.total_count AS count,
    et.total_teu AS teu,
    st.total_count - et.total_count AS count_delta,
    st.total_teu - et.total_teu AS teu_delta
   FROM default.statistics_total st
     FULL JOIN default.export_nutep_total et ON st.year = et.year_parsed_on AND st.month = et.month_parsed_on AND st.ship_name_unified = et.ship_name_unified AND st.direction = et.direction AND st.is_empty = et.is_empty AND st.line_unified = et.line_unified AND st.container_size = et.container_size
  WHERE st.direction = 'export';
