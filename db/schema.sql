CREATE SEQUENCE actions_id_seq
  START WITH 1
  INCREMENT BY 1
  NO MINVALUE
  NO MAXVALUE
  CACHE 1;

CREATE TABLE actions (
  id integer NOT NULL DEFAULT nextval('actions_id_seq'::regclass),
  name varchar(255),
  entity_type varchar(255),
  entity_id varchar(255),
  data jsonb,
  inserted_at timestamp DEFAULT NOW(),
  updated_at timestamp DEFAULT NOW(),
  created_by varchar(100),
  PRIMARY KEY (id)
);

CREATE TABLE schema_migrations (
  migration varchar(255),
  migrated_at timestamp DEFAULT NOW(),
  PRIMARY KEY (migration)
);

-- Ensure all migrations are added
INSERT INTO schema_migrations
  (migration)
VALUES
  ('20200202110100-create-migrations.sql'),
  ('20200202110200-create-actions.sql');


CREATE TABLE clients (
  name text,
  token text DEFAULT md5(random()::text),
  data jsonb,
  PRIMARY KEY(name)
);