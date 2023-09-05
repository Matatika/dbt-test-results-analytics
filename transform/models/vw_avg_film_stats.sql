{{ config(materialized='table') }}

with imdb_top_20 as (
    select * from {{ source ('imdb_source', 'imdb_top_20_films') }}
),
averages as (
    select
        count(*) "count_films"
        , avg(imdb_rating) "avg_rating"
        , avg(release_year) "avg_release_year"
    from imdb_top_20
)
select * from averages