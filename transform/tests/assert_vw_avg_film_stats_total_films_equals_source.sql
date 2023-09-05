-- Assert that the num_of_films in vw_avg_film_stats equals the count from the source

select
    sum(count_films)
from {{ ref('vw_avg_film_stats') }}
having sum(count_films) != (select count(*) from {{ source ('imdb_source', 'imdb_top_20_films') }})