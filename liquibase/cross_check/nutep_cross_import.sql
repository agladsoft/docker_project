CREATE OR REPLACE VIEW default.nutep_cross_import
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
    it.total_count AS count,
    it.total_teu AS teu,
    st.total_count - it.total_count AS count_delta,
    st.total_teu - it.total_teu AS teu_delta
   FROM default.statistics_total st
     FULL JOIN default.import_nutep_total it ON st.year = it.year_parsed_on AND st.month = it.month_parsed_on AND st.ship_name_unified = it.ship_name_unified AND st.direction = it.direction AND st.is_empty = it.is_empty AND st.line_unified = it.line_unified AND st.container_size = it.container_size
  WHERE st.direction = 'import';
