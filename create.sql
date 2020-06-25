CREATE TABLE suicide (
    suicide_id             INTEGER NOT NULL,
    human_id          INTEGER NOT NULL,
    i_state         VARCHAR(100),
    s_year        INTEGER NOT NULL
);

ALTER TABLE suicide ADD CONSTRAINT suicide_pk PRIMARY KEY ( suicide_id );

CREATE TABLE cause (
    cause_name  VARCHAR2(100)
);

ALTER TABLE cause ADD CONSTRAINT cause_pk PRIMARY KEY ( cause_name );

CREATE TABLE human (
    human_id INTEGER NOT NULL,
    gender VARCHAR2(100) NOT NULL,
    age INTEGER NOT NULL
);

ALTER TABLE human ADD CONSTRAINT human_pk PRIMARY KEY (human_id);

CREATE TABLE relation_suicide_cause (
    suiced_suiced_id   INTEGER NOT NULL,
    cause_cause_name  VARCHAR(100) NOT NULL
);

ALTER TABLE relation_suicide_cause ADD CONSTRAINT relation_suicede_cause_pk PRIMARY KEY ( suiced_suiced_id,
cause_cause_name );

CREATE TABLE relation_suicide_human (
    suiced_suiced_id  INTEGER NOT NULL,
    human_human_id    INTEGER NOT NULL
);

ALTER TABLE relation_suicide_human ADD CONSTRAINT relation_suiced_human_pk PRIMARY KEY ( suicide_suiced_id,
human_human_id );

ALTER TABLE relation_suicide_cause
    ADD CONSTRAINT relation_1_suiced_fk FOREIGN KEY ( suiced_suiced_id )
        REFERENCES suicide ( suicide_id );

ALTER TABLE relation_suiced_cause
    ADD CONSTRAINT relation_1_cause_fk FOREIGN KEY ( cause_cause_name)
        REFERENCES cause ( cause_name );

ALTER TABLE relation_suicide_human
    ADD CONSTRAINT relation_2_suiced_fk FOREIGN KEY ( suicied_suiced_id )
        REFERENCES suicide ( suicide_id );

ALTER TABLE relation_suicide_human
    ADD CONSTRAINT relation_2_human_fk FOREIGN KEY ( human_human_id )
        REFERENCES human ( human_id );
        
commit;

