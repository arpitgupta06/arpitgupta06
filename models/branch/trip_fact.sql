with trips as (
    select
    ride_id,
    RIDEABLE_TYPE,
    date(to_timestamp(started_at)) as trip_date,
    START_STATION_ID as station_id,
    END_STATION_ID,
    MEMBER_CASUAL,
    timestampdiff(second, to_timestamp(started_at), to_timestamp(ended_at)) as trip_duration_seconds
    from {{ source('demo', 'ny_bike') }}
)

select * from trips