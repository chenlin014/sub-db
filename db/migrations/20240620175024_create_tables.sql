-- migrate:up
CREATE TABLE sources (
	source_id INTEGER PRIMARY KEY,
	name TEXT NOT NULL
);

CREATE TABLE lines (
	line_id INTEGER PRIMARY KEY,
	source_id INTEGER,
	start_time VARCHAR(255),
	end_time VARCHAR(255),
	text TEXT NOT NULL,
	FOREIGN KEY(source_id) REFERENCES sources(source_id)
);

-- migrate:down
DROP TABLE lines;
DROP TABLE sources;
