--  create Postgres table for lgtc_nwod_data CSV files
CREATE TABLE organisation_expenditure_v2
(
        nwod_id_uri_code                char(20),
        nwod_id                         int NOT NULL,
        org_short_name                  character varying,
        beneficiary_name                character varying,
        payment_date                    date,
        amount                          numeric(20,2),
        clean_name                      character varying,
        naked_name                      character varying,
        company_name                    character varying,
        company_number                  character varying,
        charity_number                  character varying,
		sicc_int						int,
		match_method					char(3)
);
create unique index on organisation_expenditure_v2(nwod_id_uri_code,nwod_id);

