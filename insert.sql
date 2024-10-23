CREATE TABLE departement (
    departementId TEXT PRIMARY KEY,
    adressId TEXT,
    FOREIGN KEY (adressId) REFERENCES adress(adressId)
);

CREATE TABLE post (
    postId TEXT PRIMARY KEY,
    Salary REAL,
    PositionTitle TEXT
);

CREATE TABLE employement (
    postId TEXT,
    startDate DATE,
    endDate DATE,
    FOREIGN KEY (postId) REFERENCES post(postId)
);

CREATE TABLE employes (
    employeId TEXT PRIMARY KEY,
    departementId TEXT,
    adressId TEXT,
    postId TEXT,
    FOREIGN KEY (departementId) REFERENCES departement(departementId),
    FOREIGN KEY (adressId) REFERENCES adress(adressId),
    FOREIGN KEY (postId) REFERENCES employement(postId)
);

CREATE TABLE adress (
    adressId TEXT PRIMARY KEY,
    country TEXT,
    city TEXT,
    street1 TEXT,
    street2 TEXT,
    appartement TEXT
);