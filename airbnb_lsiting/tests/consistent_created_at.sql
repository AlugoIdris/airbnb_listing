WITH reviews as (
    SELECT
    *
FROM
    {{ ref('fct_reviews') }}
),

listings as (
    SELECT
    *
FROM
    {{ ref('dim_listings_cleansed') }}
)

SELECT
    *
FROM
    reviews r join listings l on r.listing_id = l.listing_id
WHERE review_date < created_at
LIMIT 10
