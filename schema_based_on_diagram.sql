-- schema_based_on_diagram
CREATE DATABASE clinic;

CREATE TABLE patients(
id INT GENERATED ALWAYS AS IDENTITY,
name VARCHAR,
date_of_birth DATE,
PRIMARY KEY(id)
);

CREATE TABLE medical_histories(
id INT GENERATED ALWAYS AS IDENTITY,
admitted_at TIMESTAMP,
patient_id INT REFERENCES patients(id),
status VARCHAR,
PRIMARY KEY(id)
);

CREATE TABLE treatments(
id INT GENERATED ALWAYS AS IDENTITY,
type VARCHAR,
name VARCHAR,
PRIMARY KEY(id)
);

CREATE TABLE invoices(
id INT GENERATED ALWAYS AS IDENTITY,
total_amount DECIMAL,
generated_at TIMESTAMP,
paid_at TIMESTAMP,
medical_history_id INT REFERENCES medical_histories(id),
PRIMARY KEY(id)
);

CREATE TABLE invoice_items(
id INT GENERATED ALWAYS AS IDENTITY,
unit_price DECIMAL,
quantity INT,
total_price DECIMAL,
invoice_id INT REFERENCES invoices(id),
treatment_id INT REFERENCES treatments(id),
PRIMARY KEY(id)
);

CREATE TABLE medical_histories_treatments(
id INT GENERATED ALWAYS AS IDENTITY,
medical_history_id INT REFERENCES medical_histories(id),
treatment_id INT REFERENCES treatments(id),
PRIMARY KEY(id)
);

-- Add FK indexes for medical_history_id and treatment_id in medical_histories_treatments table
CREATE INDEX idx_medical_histories_treatments_medical_history_id ON medical_histories_treatments(medical_histories_id);
CREATE INDEX idx_medical_histories_treatments_treatment_id ON medical_histories_treatments(treatment_id);

