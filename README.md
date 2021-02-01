# csi2532_playground
csi2532 playground
Firas Jribi 300084463

## lab002

```bash
# psql -c "DROP DATABASE university"
psql -c "CREATE DATABASE university"
psql university -f ./db/schema.sql
psql university -f ./db/seed.sql
psql university -f ./db/test.sql
```
