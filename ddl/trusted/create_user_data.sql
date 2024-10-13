CREATE TABLE transformed.user_data_social_media (
    user_id STRING OPTIONS(description="User ID"),
    user_name STRING OPTIONS(description="Nome do usuário"),
    email STRING OPTIONS(description="E-mail do usuário"),
    date_of_birth DATE OPTIONS(description="Data de nascimento do usuário"),
    gender STRING OPTIONS(description="Gênero do usuário"),
    country STRING OPTIONS(description="País do usuário"),
    uf STRING OPTIONS(description="Estado do usuário"),
    city STRING OPTIONS(description="Cidade do usuário"),
    profile_creation_date TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    platform STRING OPTIONS(description="Plataforma de mídia social"),
    created_at TIMESTAMP OPTIONS(description="Data e hora da extração dos dados")
);