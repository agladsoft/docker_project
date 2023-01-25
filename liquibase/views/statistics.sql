CREATE OR REPLACE VIEW default.statistics
AS SELECT
    statistics.month AS month,
    statistics.year AS year,
    statistics.ship_name AS ship_name,
    statistics.direction AS direction,
        CASE
            WHEN statistics.is_empty = 1 THEN true
            ELSE false
        END AS is_empty,
    statistics.line AS line,
    statistics.container_size AS container_size,
    statistics.count AS count,
    statistics.teu AS teu,
    statistics.date_arrive AS date_arrive,
    statistics.date_leave AS date_leave,
    statistics.id AS id
FROM marketing_db.statistics;
