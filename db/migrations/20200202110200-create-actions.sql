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
  PRIMARY KEY (id)
);

INSERT INTO schema_migrations (migration, migrated_at)
VALUES ('20200202110200-create-actions.sql',
        NOW()::timestamp);
