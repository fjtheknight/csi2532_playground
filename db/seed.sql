INSERT INTO actions
  (name, entity_type, entity_id, data, inserted_at, updated_at)
VALUES
  ('action_added', 'apple', 'green', '{"num": 10}', NOW(), NOW());

INSERT INTO clients(name, token) 
	VALUES 
		('Big Co.', 'd7d85f7eac7360d725b44d327445473e'), 
		('Small Co.', '9f8983a8494c8a003e064374ffb77cb6');