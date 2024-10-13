CREATE TABLE transformed.interaction (
    user_id STRING OPTIONS(description="User ID"),
    source_type STRING OPTIONS(description="Tipo de origem do dado, se comentário, postagem, etc."),
    interaction_type STRING OPTIONS(description="Tipo de interação, se curtida, comentário, etc."),
    interaction_time TIMESTAMP OPTIONS(description="Data e hora da interação"),
    review STRING OPTIONS(description="Texto da interação"),
    platform STRING OPTIONS(description="Plataforma de origem da interação, se Facebook, Instagram, TikTok, etc."),
    total_interactions INT64 OPTIONS(description="Total de interações do usuário"),
    created_at TIMESTAMP
);