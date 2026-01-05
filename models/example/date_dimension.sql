with cte as (
    select
    date(to_timestamp(started_at)) as started_at,
    hour(to_timestamp(started_at)) as hour_started_at,
    dayname(to_timestamp(started_at)) days_started_at,
    case
        when dayname(to_timestamp(started_at)) in ('Sat', 'Sun')
        then 'Weekend'
        else 'Businessday'
    end as day_type
    from {{ source('demo', 'ny_bike') }}
)

select * from cte
