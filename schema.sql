-- Create tables for the patent data pipeline

DROP TABLE IF EXISTS patents;
CREATE TABLE patents (
    patent_id TEXT PRIMARY KEY,
    title TEXT,
    abstract TEXT,
    filing_date TEXT,
    year INTEGER
);

DROP TABLE IF EXISTS inventors;
CREATE TABLE inventors (
    inventor_id TEXT PRIMARY KEY,
    name TEXT,
    country TEXT
);

DROP TABLE IF EXISTS companies;
CREATE TABLE companies (
    company_id TEXT PRIMARY KEY,
    name TEXT
);

DROP TABLE IF EXISTS relationships;
CREATE TABLE relationships (
    patent_id TEXT,
    inventor_id TEXT,
    company_id TEXT,
    FOREIGN KEY (patent_id) REFERENCES patents(patent_id),
    FOREIGN KEY (inventor_id) REFERENCES inventors(inventor_id),
    FOREIGN KEY (company_id) REFERENCES companies(company_id)
);