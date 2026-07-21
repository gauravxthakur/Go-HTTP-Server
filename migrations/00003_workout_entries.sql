-- +goose Up
-- +goose StatementBegin

CREATE TABLE IF NOT EXISTS workouts(
    id BIGSERIAL PRIMARY KEY,
    -- user_id
    description TEXT,
    duration_minutes INTEGER NOT NULL,
    calories_burned INTEGER,
    sets INTEGER NOT NULL,
    reps INTEGER,
    duration_seconds INTEGER,
    weight DECIMAL(5,2),
    notes TEXT,
    order_index INTEGER NOT NULL,
    create_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP WITH TIME ZONE DEFAULT CURRENT_TIMESTAMP,
    CONSTRAINT valid_workout_entry CHECK(
        (reps IS NOT NULL OR duration_seconds IS NOT NULL) AND
        (reps IS NULL OR duration_seconds IS NULL)
    )
)

-- +goose StatementEnd

-- +goose Down
-- +goose StatementBegin
DROP TABLE workout_entries;
-- +goose StatementEnd
