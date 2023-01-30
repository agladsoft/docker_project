CREATE OR REPLACE VIEW default.reference_is_empty
AS SELECT
    reference_is_empty.is_empty AS is_empty,
    reference_is_empty.is_empty AS is_empty_unified
FROM marketing_db.reference_is_empty;
