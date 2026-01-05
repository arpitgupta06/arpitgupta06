with cte as (
    select
    date(to_timestamp(started_at)) as started_at,
    hour(to_timestamp(started_at)) as hour_started_at,
    dayofweek(to_timestamp(started_at)) days_started_at
    from {{ source('demo', 'ny_bike') }}
)

select * from cte