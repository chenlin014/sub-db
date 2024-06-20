CREATE TABLE IF NOT EXISTS "schema_migrations" (version varchar(128) primary key);
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
-- Dbmate schema migrations
INSERT INTO "schema_migrations" (version) VALUES
  ('20240620175024');
