CREATE TABLE raw_extraction.interaction_instagram (
    user_id STRING OPTIONS(description="User ID"),
    source_type STRING OPTIONS(description="Tipo de origem do dado, se comentário, postagem, etc."),
    interaction_type STRING OPTIONS(description="Tipo de interação, se curtida, comentário, etc."),
    interaction_time TIMESTAMP OPTIONS(description="Data e hora da interação"),
    review STRING OPTIONS(description="Texto da interação"),
    created_at TIMESTAMP OPTIONS(description="Data e hora da criação do registro"),
);