/*  ========================
    1. Exploring hemnet data
    ========================*/

--b)
DESC staging.hemnet_data;

SELECT COUNT(*)
FROM staging.hemnet_data;

--c)
SELECT COUNT(*) AS row_amount
FROM staging.hemnet_data;

--d)
DESC staging.hemnet_data;

--e)
SELECT *
FROM staging.hemnet_data
ORDER BY final_price DESC
LIMIT 5;

--f)
SELECT *
FROM staging.hemnet_data
ORDER BY final_price ASC
LIMIT 5;

--g)
SELECT 
    MIN(final_price) AS minimum_price,
    AVG(final_price) AS mean_price,
    MEDIAN(final_price) AS median_price,
    MAX(final_price) AS maximum_price
FROM staging.hemnet_data;

--h)
SELECT 
    ROUND(MIN(price_per_area)) AS minimum_price_area,
    ROUND(AVG(price_per_area)) AS mean_price_area,
    ROUND(MEDIAN(price_per_area)) AS median_price_area,
    ROUND(MAX(price_per_area)) AS maximum_price_area
FROM staging.hemnet_data;

--i)
SELECT COUNT (DISTINCT SPLIT_PART(commune, ', ', 2)) AS distinct_communes
FROM staging.hemnet_data
ORDER BY distinct_communes ASC;

--j)
SELECT
    COUNT(*) AS total_sales,
    COUNT(*) FILTER (
WHERE
    final_price > 10000000) AS over_ten_milion,
    ROUND(over_ten_milion / total_sales * 100,0) AS percentage_over_ten_milion
FROM 
    staging.hemnet_data;



-- ┌────────────────────────┬─────────────┬─────────┬─────────┬─────────┬─────────┐
-- │      column_name       │ column_type │  null   │   key   │ default │  extra  │
-- │        varchar         │   varchar   │ varchar │ varchar │ varchar │ varchar │
-- ├────────────────────────┼─────────────┼─────────┼─────────┼─────────┼─────────┤
-- │ column00               │ DOUBLE      │ YES     │ NULL    │ NULL    │ NULL    │
-- │ address                │ VARCHAR     │ YES     │ NULL    │ NULL    │ NULL    │
-- │ asked_price            │ DOUBLE      │ YES     │ NULL    │ NULL    │ NULL    │
-- │ coordinate             │ VARCHAR     │ YES     │ NULL    │ NULL    │ NULL    │
-- │ final_price            │ BIGINT      │ YES     │ NULL    │ NULL    │ NULL    │
-- │ pourcentage_difference │ DOUBLE      │ YES     │ NULL    │ NULL    │ NULL    │
-- │ land_area              │ DOUBLE      │ YES     │ NULL    │ NULL    │ NULL    │
-- │ area                   │ DOUBLE      │ YES     │ NULL    │ NULL    │ NULL    │
-- │ commune                │ VARCHAR     │ YES     │ NULL    │ NULL    │ NULL    │
-- │ price_per_area         │ DOUBLE      │ YES     │ NULL    │ NULL    │ NULL    │
-- │ rooms                  │ DOUBLE      │ YES     │ NULL    │ NULL    │ NULL    │
-- │ sale_date              │ VARCHAR     │ YES     │ NULL    │ NULL    │ NULL    │
-- │ supplemental_area      │ DOUBLE      │ YES     │ NULL    │ NULL    │ NULL    │
-- ├────────────────────────┴─────────────┴─────────┴─────────┴─────────┴─────────┤
-- │ 13 rows                                                            6 columns │
-- └──────────────────────────────────────────────────────────────────────────────┘
-- ┌──────────────┐
-- │ count_star() │
-- │    int64     │
-- ├──────────────┤
-- │     500      │
-- └──────────────┘
-- ┌────────────┐
-- │ row_amount │
-- │   int64    │
-- ├────────────┤
-- │    500     │
-- └────────────┘
-- ┌────────────────────────┬─────────────┬─────────┬─────────┬─────────┬─────────┐
-- │      column_name       │ column_type │  null   │   key   │ default │  extra  │
-- │        varchar         │   varchar   │ varchar │ varchar │ varchar │ varchar │
-- ├────────────────────────┼─────────────┼─────────┼─────────┼─────────┼─────────┤
-- │ column00               │ DOUBLE      │ YES     │ NULL    │ NULL    │ NULL    │
-- │ address                │ VARCHAR     │ YES     │ NULL    │ NULL    │ NULL    │
-- │ asked_price            │ DOUBLE      │ YES     │ NULL    │ NULL    │ NULL    │
-- │ coordinate             │ VARCHAR     │ YES     │ NULL    │ NULL    │ NULL    │
-- │ final_price            │ BIGINT      │ YES     │ NULL    │ NULL    │ NULL    │
-- │ pourcentage_difference │ DOUBLE      │ YES     │ NULL    │ NULL    │ NULL    │
-- │ land_area              │ DOUBLE      │ YES     │ NULL    │ NULL    │ NULL    │
-- │ area                   │ DOUBLE      │ YES     │ NULL    │ NULL    │ NULL    │
-- │ commune                │ VARCHAR     │ YES     │ NULL    │ NULL    │ NULL    │
-- │ price_per_area         │ DOUBLE      │ YES     │ NULL    │ NULL    │ NULL    │
-- │ rooms                  │ DOUBLE      │ YES     │ NULL    │ NULL    │ NULL    │
-- │ sale_date              │ VARCHAR     │ YES     │ NULL    │ NULL    │ NULL    │
-- │ supplemental_area      │ DOUBLE      │ YES     │ NULL    │ NULL    │ NULL    │
-- ├────────────────────────┴─────────────┴─────────┴─────────┴─────────┴─────────┤
-- │ 13 rows                                                            6 columns │
-- └──────────────────────────────────────────────────────────────────────────────┘
-- ┌──────────┬──────────────────────┬─────────────┬──────────────────────┬───┬────────────────┬────────┬─────────────────┬───────────────────┐
-- │ column00 │       address        │ asked_price │      coordinate      │ . │ price_per_area │ rooms  │    sale_date    │ supplemental_area │
-- │  double  │       varchar        │   double    │       varchar        │   │     double     │ double │     varchar     │      double       │
-- ├──────────┼──────────────────────┼─────────────┼──────────────────────┼───┼────────────────┼────────┼─────────────────┼───────────────────┤
-- │      9.8 │ Sångmöstigen 3       │  29900000.0 │ [59.32189, 17.94161] │ . │       129583.0 │    9.0 │ Såld 2022-03-27 │             111.0 │
-- │      2.6 │ Vikavägen 15         │  28500000.0 │ [59.32079, 17.9391.  │ . │       118410.0 │    8.0 │ Såld 2022-04-17 │              20.0 │
-- │     25.4 │ Gustaf Lundbergs v.  │  20500000.0 │ [59.33912277858042.  │ . │       131980.0 │   11.0 │ Såld 2022-05-10 │              96.0 │
-- │     23.6 │ Bardabacken 17       │  26000000.0 │ [59.32154, 17.9376.  │ . │       113537.0 │   NULL │ Såld 2022-04-09 │             149.0 │
-- │     24.3 │ Ferievägen 65        │  28000000.0 │ [59.33391840148430.  │ . │        66667.0 │   11.0 │ Såld 2022-05-19 │              24.0 │
-- ├──────────┴──────────────────────┴─────────────┴──────────────────────┴───┴────────────────┴────────┴─────────────────┴───────────────────┤
-- │ 5 rows                                                                                                              13 columns (8 shown) │
-- └──────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
-- ┌──────────┬─────────────────────┬─────────────┬──────────────────────┬───┬────────────────┬────────┬─────────────────┬───────────────────┐
-- │ column00 │       address       │ asked_price │      coordinate      │ . │ price_per_area │ rooms  │    sale_date    │ supplemental_area │
-- │  double  │       varchar       │   double    │       varchar        │   │     double     │ double │     varchar     │      double       │
-- ├──────────┼─────────────────────┼─────────────┼──────────────────────┼───┼────────────────┼────────┼─────────────────┼───────────────────┤
-- │     16.9 │ Småbrukarvägen 46C  │   1475000.0 │ [59.3704400502, 17.  │ . │        70952.0 │    2.0 │ Såld 2022-03-10 │              12.0 │
-- │     19.4 │ Rymdvägen 13        │   3695000.0 │ [59.3821869, 17.83.  │ . │        38043.0 │    4.0 │ Såld 2022-05-11 │               0.0 │
-- │     19.9 │ Själlandsgatan 85   │   3595000.0 │ [59.39785178704126.  │ . │        55263.0 │    3.0 │ Såld 2022-03-09 │               0.0 │
-- │     37.2 │ Lammholmsbacken 66  │   4495000.0 │ [59.2705269, 17.89.  │ . │        41964.0 │    5.0 │ Såld 2022-05-27 │              19.0 │
-- │     26.3 │ Lammholmsbacken 115 │   4490000.0 │ [59.2685051, 17.89.  │ . │        42478.0 │    5.0 │ Såld 2022-05-18 │              19.0 │
-- ├──────────┴─────────────────────┴─────────────┴──────────────────────┴───┴────────────────┴────────┴─────────────────┴───────────────────┤
-- │ 5 rows                                                                                                             13 columns (8 shown) │
-- └─────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────────┘
-- ┌────────────────┬─────────────────┬────────────────┬─────────────────┐
-- │ minimum_price  │   mean_price    │  median_price  │  maximum_price  │
-- │     int64      │     double      │     double     │      int64      │
-- ├────────────────┼─────────────────┼────────────────┼─────────────────┤
-- │    1490000     │   10047154.0    │   8852500.0    │    31100000     │
-- │ (1.49 million) │ (10.05 million) │ (8.85 million) │ (31.10 million) │
-- └────────────────┴─────────────────┴────────────────┴─────────────────┘
-- ┌────────────────────┬─────────────────┬───────────────────┬────────────────────┐
-- │ minimum_price_area │ mean_price_area │ median_price_area │ maximum_price_area │
-- │       double       │     double      │      double       │       double       │
-- ├────────────────────┼─────────────────┼───────────────────┼────────────────────┤
-- │      20617.0       │     79120.0     │      71635.0      │      187500.0      │
-- └────────────────────┴─────────────────┴───────────────────┴────────────────────┘
-- ┌───────────────────┐
-- │ distinct_communes │
-- │       int64       │
-- ├───────────────────┤
-- │        12         │
-- └───────────────────┘
-- ┌─────────────┬─────────────────┬────────────────────────────┐
-- │ total_sales │ over_ten_milion │ percentage_over_ten_milion │
-- │    int64    │      int64      │           double           │
-- ├─────────────┼─────────────────┼────────────────────────────┤
-- │     500     │       173       │            35.0            │
-- └─────────────┴─────────────────┴────────────────────────────┘