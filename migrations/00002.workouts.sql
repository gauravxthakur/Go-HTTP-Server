-- +goose Up
-- +goose StatementBegin

CREATE TABLE IF NOT EXISTS workouts{
    id BIGSERIAL PRIMARY KEY,
    -- user_id
    description TEXT,
    duration_minutes INTEGER NOT NULL,
    calories_burned INTEGER,
    create_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP
}

-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE workouts;
-- +goose StatementEnd
