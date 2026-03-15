### in case error connecting to linux scocket

```sh
docker compose -f docker/compose/redis-compose.yaml up -d
```

```sh
sudo usermod -aG docker $USER
newgrp docker
```

### Connection URL:

```sh
redis://:pass@localhost:6379/0
```

```sql
SELECT e.first_name, d.name AS department, e.salary
   FROM employees e JOIN departments d ON e.department_id = d.id;
```
