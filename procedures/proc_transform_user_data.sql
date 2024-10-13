CREATE OR REPLACE PROCEDURE `sp.proc_transform_user_data`()
BEGIN

EXECUTE IMMEDIATE """

    CREATE OR REPLACE TEMP TABLE tmp_user_data AS
    SELECT 
        user_id
        , INITCAP(user_name) AS user_name
        , email
        , date_of_birth
        , gender
        , INITCAP(country) AS country
        , UPPER(uf) AS uf
        , INITCAP(city) AS city
        , profile_creation_date
    FROM raw_extraction.user_data_extraction_tiktok
    WHERE created_at = (SELECT MAX(created_at) FROM raw_extraction.user_data_extraction_tiktok)

    UNION ALL
    SELECT 
        user_id
        , INITCAP(user_name) AS user_name
        , email
        , date_of_birth
        , gender
        , INITCAP(country) AS country
        , UPPER(uf) AS uf
        , INITCAP(city) AS city
        , profile_creation_date
     FROM raw_extraction.user_data_extraction_instagram
    WHERE created_at = (SELECT MAX(created_at) FROM raw_extraction.user_data_extraction_instagram)

    UNION ALL
    SELECT 
        user_id
        , INITCAP(user_name) AS user_name
        , email
        , date_of_birth
        , gender
        , INITCAP(country) AS country
        , UPPER(uf) AS uf
        , INITCAP(city) AS city
        , profile_creation_date
    FROM raw_extraction.user_data_extraction_facebook
    WHERE created_at = (SELECT MAX(created_at) FROM raw_extraction.user_data_extraction_facebook);
    """;

EXECUTE IMMEDIATE """
    INSERT INTO transformed.user_data
    SELECT * FROM tmp_user_data;
    """;

END;


