-- Core schema for the SQL-shape test repo.
-- Tables are created in dependency order so foreign keys resolve:
-- projects first, then todos (references projects), then tags.

CREATE TABLE projects (
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    owner_id    UUID NOT NULL REFERENCES auth.users (id) ON DELETE CASCADE,
    name        TEXT NOT NULL,
    color       TEXT DEFAULT '#8b7bff',
    created_at  TIMESTAMPTZ NOT NULL DEFAULT now()
);

CREATE TABLE todos (
    id          UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    project_id  UUID NOT NULL REFERENCES projects (id) ON DELETE CASCADE,
    title       TEXT NOT NULL,
    done        BOOLEAN NOT NULL DEFAULT false,
    due_date    DATE,
    position    INTEGER NOT NULL DEFAULT 0,
    created_at  TIMESTAMPTZ NOT NULL DEFAULT now(),
    CONSTRAINT title_not_blank CHECK (length(trim(title)) > 0)
);

CREATE TABLE tags (
    id     UUID PRIMARY KEY DEFAULT gen_random_uuid(),
    label  TEXT NOT NULL UNIQUE
);
