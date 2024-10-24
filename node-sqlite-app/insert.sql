CREATE TABLE departements (
    departementId TEXT PRIMARY KEY,
    adressId TEXT,
    FOREIGN KEY (adressId) REFERENCES adress(adressId)
);

CREATE TABLE posts (
    postId TEXT PRIMARY KEY,
    Salary REAL,
    PositionTitle TEXT
);

CREATE TABLE employements (
    postId TEXT,
    startDate DATE,
    endDate DATE,
    FOREIGN KEY (postId) REFERENCES post(postId)
);

CREATE TABLE employees (
    employeId VARCHAR(10) PRIMARY KEY,
    departementId VARCHAR(10),
    adressId VARCHAR(10),
    postId VARCHAR(10),
    firstName VARCHAR(50),
    lastName VARCHAR(50),
    gender CHAR(1),
    phoneNumber VARCHAR(15)
    FOREIGN KEY (departementId) REFERENCES departement(departementId),
    FOREIGN KEY (adressId) REFERENCES adress(adressId),
    FOREIGN KEY (postId) REFERENCES employement(postId)
);

CREATE TABLE adresses (
    adressId TEXT PRIMARY KEY,
    country TEXT,
    city TEXT,
    street1 TEXT,
    street2 TEXT,
    appartement TEXT
);

INSERT INTO adresses (adressId, country, city, street1, street2, appartement)
VALUES
('adr1', 'France', 'Paris', '12 Rue de la Paix', 'Apt 3', '101'),
('adr2', 'France', 'Lyon', '5 Rue de Lyon', 'Apt 2', '202'),
('adr3', 'France', 'Marseille', '7 Boulevard des Belges', 'Apt 1', '103'),
('adr4', 'France', 'Nice', '10 Avenue Jean Médecin', 'Apt 4', '104'),
('adr5', 'France', 'Toulouse', '15 Place du Capitole', 'Apt 5', '105'),
('adr6', 'France', 'Bordeaux', '20 Rue Sainte-Catherine', 'Apt 6', '106'),
('adr7', 'France', 'Lille', '25 Rue de Béthune', 'Apt 7', '107'),
('adr8', 'France', 'Strasbourg', '30 Rue du Vieux-Marché', 'Apt 8', '108'),
('adr9', 'France', 'Nantes', '35 Rue Crébillon', 'Apt 9', '109'),
('adr10', 'France', 'Rennes', '40 Rue Saint-Michel', 'Apt 10', '110'),
('adr11', 'France', 'Grenoble', '45 Rue Félix Poulat', 'Apt 11', '111'),
('adr12', 'France', 'Dijon', '50 Rue de la Liberté', 'Apt 12', '112'),
('adr13', 'France', 'Orléans', '55 Rue Jeanne Arc', 'Apt 13', '113'),
('adr14', 'France', 'Metz', '60 Rue Serpenoise', 'Apt 14', '114'),
('adr15', 'France', 'Rouen', '65 Rue du Gros-Horloge', 'Apt 15', '115'),
('adr16', 'France', 'Tours', '70 Rue Nationale', 'Apt 16', '116'),
('adr17', 'France', 'Nancy', '75 Rue Saint-Dizier', 'Apt 17', '117'),
('adr18', 'France', 'Caen', '80 Rue Saint-Pierre', 'Apt 18', '118'),
('adr19', 'France', 'Poitiers', '85 Rue Gambetta', 'Apt 19', '119'),
('adr20', 'France', 'Angers', '90 Rue Saint-Laud', 'Apt 20', '120');

INSERT INTO departements (departementId, adressId)
VALUES
('dept1', 'adr1'),
('dept2', 'adr2'),
('dept3', 'adr3'),
('dept4', 'adr4'),
('dept5', 'adr5'),
('dept6', 'adr6'),
('dept7', 'adr7'),
('dept8', 'adr8'),
('dept9', 'adr9'),
('dept10', 'adr10'),
('dept11', 'adr11'),
('dept12', 'adr12'),
('dept13', 'adr13'),
('dept14', 'adr14'),
('dept15', 'adr15'),
('dept16', 'adr16'),
('dept17', 'adr17'),
('dept18', 'adr18'),
('dept19', 'adr19'),
('dept20', 'adr20');

INSERT INTO posts (postId, Salary, PositionTitle)
VALUES
('post1', 35000, 'Developer'),
('post2', 45000, 'Project Manager'),
('post3', 30000, 'Support Technician'),
('post4', 50000, 'Team Lead'),
('post5', 60000, 'HR Manager'),
('post6', 55000, 'QA Engineer'),
('post7', 40000, 'Designer'),
('post8', 70000, 'Senior Developer'),
('post9', 32000, 'IT Support'),
('post10', 75000, 'Business Analyst'),
('post11', 42000, 'Marketing Manager'),
('post12', 38000, 'UX/UI Designer'),
('post13', 46000, 'Operations Manager'),
('post14', 52000, 'Database Administrator'),
('post15', 50000, 'DevOps Engineer'),
('post16', 36000, 'Software Tester'),
('post17', 58000, 'Technical Architect'),
('post18', 34000, 'Product Manager'),
('post19', 62000, 'Chief Technology Officer'),
('post20', 41000, 'Sales Manager');

INSERT INTO employements (postId, startDate, endDate)
VALUES
('post1', '2022-01-01', '2023-12-31'),
('post2', '2021-05-15', '2023-06-30'),
('post3', '2020-09-01', '2022-09-01'),
('post4', '2019-04-10', '2023-11-30'),
('post5', '2018-12-01', '2023-12-31'),
('post6', '2020-07-01', '2023-05-30'),
('post7', '2021-11-15', '2023-10-30'),
('post8', '2020-01-01', '2023-12-31'),
('post9', '2022-03-01', '2023-03-01'),
('post10', '2019-08-15', '2023-08-15'),
('post11', '2021-06-01', '2023-12-31'),
('post12', '2021-09-10', '2023-09-10'),
('post13', '2020-02-01', '2023-12-31'),
('post14', '2019-03-15', '2023-11-30'),
('post15', '2021-07-01', '2023-12-31'),
('post16', '2022-08-01', '2023-12-31'),
('post17', '2020-04-01', '2023-04-01'),
('post18', '2022-10-01', '2023-12-31'),
('post19', '2019-11-01', '2023-11-30'),
('post20', '2021-12-01', '2023-12-31');

INSERT INTO employees (employeId, departementId, adressId, postId)
VALUES
('emp1', 'dept1', 'adr1', 'post1'),
('emp2', 'dept2', 'adr2', 'post2'),
('emp3', 'dept3', 'adr3', 'post3'),
('emp4', 'dept4', 'adr4', 'post4'),
('emp5', 'dept5', 'adr5', 'post5'),
('emp6', 'dept6', 'adr6', 'post6'),
('emp7', 'dept7', 'adr7', 'post7'),
('emp8', 'dept8', 'adr8', 'post8'),
('emp9', 'dept9', 'adr9', 'post9'),
('emp10', 'dept10', 'adr10', 'post10'),
('emp11', 'dept11', 'adr11', 'post11'),
('emp12', 'dept12', 'adr12', 'post12'),
('emp13', 'dept13', 'adr13', 'post13'),
('emp14', 'dept14', 'adr14', 'post14'),
('emp15', 'dept15', 'adr15', 'post15'),
('emp16', 'dept16', 'adr16', 'post16'),
('emp17', 'dept17', 'adr17', 'post17'),
('emp18', 'dept18', 'adr18', 'post18'),
('emp19', 'dept19', 'adr19', 'post19'),
('emp20', 'dept20', 'adr20', 'post20');

ALTER TABLE employees ADD COLUMN name TEXT;
ALTER TABLE employees ADD COLUMN gender TEXT;
ALTER TABLE employees ADD COLUMN phoneNumber TEXT;

INSERT INTO employees (employeId, departementId, adressId, postId, firstName, lastName, gender, phoneNumber)
VALUES
('emp1', 'dept1', 'adr1', 'post1', 'Alice', 'Dupont', 'F', '0601020301'),
('emp2', 'dept2', 'adr2', 'post2', 'Bob', 'Martin', 'M', '0601020302'),
('emp3', 'dept3', 'adr3', 'post3', 'Claire', 'Durand', 'F', '0601020303'),
('emp4', 'dept4', 'adr4', 'post4', 'David', 'Bernard', 'M', '0601020304'),
('emp5', 'dept5', 'adr5', 'post5', 'Elise', 'Fabre', 'F', '0601020305'),
('emp6', 'dept6', 'adr6', 'post6', 'François', 'Petit', 'M', '0601020306'),
('emp7', 'dept7', 'adr7', 'post7', 'Gabrielle', 'Simon', 'F', '0601020307'),
('emp8', 'dept8', 'adr8', 'post8', 'Hugo', 'Lefevre', 'M', '0601020308'),
('emp9', 'dept9', 'adr9', 'post9', 'Isabelle', 'Rousseau', 'F', '0601020309'),
('emp10', 'dept10', 'adr10', 'post10', 'Jacques', 'Moreau', 'M', '0601020310'),
('emp11', 'dept11', 'adr11', 'post11', 'Karine', 'Leroy', 'F', '0601020311'),
('emp12', 'dept12', 'adr12', 'post12', 'Louis', 'Girard', 'M', '0601020312'),
('emp13', 'dept13', 'adr13', 'post13', 'Marie', 'Rolland', 'F', '0601020313'),
('emp14', 'dept14', 'adr14', 'post14', 'Nicolas', 'Lucas', 'M', '0601020314'),
('emp15', 'dept15', 'adr15', 'post15', 'Océane', 'Gauthier', 'F', '0601020315'),
('emp16', 'dept16', 'adr16', 'post16', 'Pierre', 'Lambert', 'M', '0601020316'),
('emp17', 'dept17', 'adr17', 'post17', 'Quentin', 'Chevalier', 'M', '0601020317'),
('emp18', 'dept18', 'adr18', 'post18', 'Roxane', 'Moulin', 'F', '0601020318'),
('emp19', 'dept19', 'adr19', 'post19', 'Stéphane', 'Lefort', 'M', '0601020319'),
('emp20', 'dept20', 'adr20', 'post20', 'Valérie', 'Michel', 'F', '0601020320');
