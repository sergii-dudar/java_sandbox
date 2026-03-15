### in case error connecting to linux scocket

```sh
docker compose -f docker/compose/postgres-compose.yaml up -d
```

```sh
sudo usermod -aG docker $USER
newgrp docker
```

```sh
psql -h localhost -p 5432 -U test -d testdb
```

### Connection URL:

```sh
jdbc:postgresql://localhost:5432/testdb?user=test&password=pass

DB postgresql://localhost:5432/testdb?user=test&password=pass
```

```sql
SELECT e.first_name, d.name AS department, e.salary
   FROM employees e JOIN departments d ON e.department_id = d.id;
```
