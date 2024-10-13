CREATE OR REPLACE PROCEDURE `sp.proc_transform_interaction`()
BEGIN

EXECUTE IMMEDIATE """

    CREATE OR REPLACE TEMP TABLE tmp_interaction AS
    SELECT 
        user_id
        , source_type
        , interaction_type
        , interaction_time
        , review
        , total_interactions
        , created_at
    FROM raw_extraction.interaction_tiktok i
    LEFT JOIN (SELECT count(*) AS total_interactions, user_id 
                FROM raw_extraction.interaction_tiktok WHERE created_at = (SELECT MAX(created_at) FROM raw_extraction.interaction_tiktok)
                GROUP BY user_id) AS total_interactions
    ON i.user_id = total_interactions.user_id
    WHERE created_at = (SELECT MAX(created_at) FROM raw_extraction.interaction_tiktok)

    UNION ALL
    SELECT 
        user_id
        , source_type
        , interaction_type
        , interaction_time
        , review
        , total_interactions
        , created_at
    FROM raw_extraction.interaction_instagram i
    LEFT JOIN (SELECT count(*) AS total_interactions, user_id 
                FROM raw_extraction.interaction_instagram WHERE created_at = (SELECT MAX(created_at) FROM raw_extraction.interaction_instagram)
                GROUP BY user_id) AS total_interactions
    ON i.user_id = total_interactions.user_id
    WHERE created_at = (SELECT MAX(created_at) FROM raw_extraction.interaction_instagram)

    UNION ALL
    SELECT 
        user_id
        , source_type
        , interaction_type
        , interaction_time
        , review
        , total_interactions
        , created_at
    FROM raw_extraction.interaction_facebook i
    LEFT JOIN (SELECT count(*) AS total_interactions, user_id 
                FROM raw_extraction.interaction_facebook WHERE created_at = (SELECT MAX(created_at) FROM raw_extraction.interaction_facebook)
                GROUP BY user_id) AS total_interactions
    ON i.user_id = total_interactions.user_id
    WHERE created_at = (SELECT MAX(created_at) FROM raw_extraction.interaction_facebook)
    """;

EXECUTE IMMEDIATE """
    INSERT INTO transformed.interaction
    SELECT * FROM tmp_interaction;
    """;

END;