CREATE TABLE departments (
    id   SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL
);

CREATE TABLE employees (
    id            SERIAL PRIMARY KEY,
    first_name    VARCHAR(50) NOT NULL,
    last_name     VARCHAR(50) NOT NULL,
    email         VARCHAR(100) UNIQUE NOT NULL,
    department_id INT REFERENCES departments(id),
    salary        NUMERIC(10, 2),
    hired_at      DATE DEFAULT CURRENT_DATE
);

CREATE TABLE projects (
    id          SERIAL PRIMARY KEY,
    title       VARCHAR(200) NOT NULL,
    description TEXT,
    started_at  DATE DEFAULT CURRENT_DATE,
    active      BOOLEAN DEFAULT TRUE
);

CREATE TABLE employee_projects (
    employee_id INT REFERENCES employees(id),
    project_id  INT REFERENCES projects(id),
    role        VARCHAR(50),
    PRIMARY KEY (employee_id, project_id)
);

-- Seed data
INSERT INTO departments (name) VALUES ('Engineering'), ('Marketing'), ('Sales'), ('HR');

INSERT INTO employees (first_name, last_name, email, department_id, salary, hired_at) VALUES
    ('Alice',  'Smith',   'alice@example.com',   1, 95000.00, '2023-01-15'),
    ('Bob',    'Johnson', 'bob@example.com',     1, 88000.00, '2023-03-20'),
    ('Carol',  'Williams','carol@example.com',   2, 72000.00, '2022-11-01'),
    ('Dave',   'Brown',   'dave@example.com',    3, 67000.00, '2024-02-10'),
    ('Eve',    'Davis',   'eve@example.com',     4, 78000.00, '2021-07-05');

INSERT INTO projects (title, description, started_at, active) VALUES
    ('Website Redesign', 'Overhaul the company website',        '2024-01-10', TRUE),
    ('Mobile App',       'Build a cross-platform mobile app',   '2024-06-01', TRUE),
    ('CRM Migration',    'Migrate CRM to new platform',         '2023-09-15', FALSE);

INSERT INTO employee_projects (employee_id, project_id, role) VALUES
    (1, 1, 'Lead'),
    (2, 1, 'Developer'),
    (1, 2, 'Architect'),
    (3, 1, 'Designer'),
    (4, 3, 'Coordinator');
