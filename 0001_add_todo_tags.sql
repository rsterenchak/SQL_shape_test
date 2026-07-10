-- Join table linking todos to tags (many-to-many).
-- Lives in a separate file to exercise the outline's per-file grouping.

CREATE TABLE todo_tags (
    todo_id  UUID NOT NULL REFERENCES todos (id) ON DELETE CASCADE,
    tag_id   UUID NOT NULL REFERENCES tags (id) ON DELETE CASCADE,
    PRIMARY KEY (todo_id, tag_id)
);
