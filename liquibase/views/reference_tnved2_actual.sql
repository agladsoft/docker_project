CREATE OR REPLACE VIEW default.reference_tnved2_actual
AS SELECT
    reference_tnved2.section_tnved AS section_tnved,
    reference_tnved2.group_tnved AS group_tnved,
    reference_tnved2.goods_name AS goods_name,
    reference_tnved2.notation AS notation,
    reference_tnved2.start_date_group AS start_date_group,
    reference_tnved2.expire_date_group AS expire_date_group
   FROM default.reference_tnved2
  WHERE reference_tnved2.expire_date_group IS NULL;
