CREATE TABLE category (
    id integer NOT NULL,
    name text
);

ALTER TABLE category OWNER TO postgres;

CREATE SEQUENCE category_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE category_id_seq OWNER TO postgres;
ALTER SEQUENCE category_id_seq OWNED BY category.id;
ALTER TABLE ONLY category ALTER COLUMN id SET DEFAULT nextval('category_id_seq'::regclass);
ALTER TABLE ONLY category
    ADD CONSTRAINT category_pk PRIMARY KEY (id);

CREATE TABLE client (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    phone text NOT NULL
);

ALTER TABLE client OWNER TO postgres;

CREATE SEQUENCE client_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE client_id_seq OWNER TO postgres;
ALTER SEQUENCE client_id_seq OWNED BY client.id;
ALTER TABLE ONLY client ALTER COLUMN id SET DEFAULT nextval('client_id_seq'::regclass);
ALTER TABLE ONLY client
    ADD CONSTRAINT client_pk PRIMARY KEY (id);

CREATE TABLE distributor (
    id integer NOT NULL,
    name text
);

ALTER TABLE distributor OWNER TO postgres;

CREATE SEQUENCE distributor_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE distributor_id_seq OWNER TO postgres;
ALTER SEQUENCE distributor_id_seq OWNED BY distributor.id;
ALTER TABLE ONLY distributor ALTER COLUMN id SET DEFAULT nextval('distributor_id_seq'::regclass);
ALTER TABLE ONLY distributor
    ADD CONSTRAINT distributor_pk PRIMARY KEY (id);

CREATE TABLE item (
    id integer NOT NULL,
    name text,
    category_id integer
);

ALTER TABLE item OWNER TO postgres;
ALTER TABLE ONLY item
    ADD CONSTRAINT item_pk PRIMARY KEY (id);
ALTER TABLE ONLY item
    ADD CONSTRAINT item_category_null_fk FOREIGN KEY (category_id) REFERENCES category(id);


CREATE TABLE main_table (
    shop_id integer NOT NULL,
    client_id integer NOT NULL,
    item_id integer NOT NULL,
    distr_id integer NOT NULL,
    amount integer NOT NULL,
    price numeric NOT NULL,
    purchase_date date NOT NULL
);

CREATE TABLE shop (
    id integer NOT NULL,
    name text NOT NULL,
    address text NOT NULL
);

ALTER TABLE shop OWNER TO postgres;

CREATE SEQUENCE shop_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;

ALTER TABLE shop_id_seq OWNER TO postgres;

ALTER SEQUENCE shop_id_seq OWNED BY shop.id;
ALTER TABLE ONLY shop ALTER COLUMN id SET DEFAULT nextval('shop_id_seq'::regclass);
ALTER TABLE ONLY shop
    ADD CONSTRAINT shop_pk PRIMARY KEY (id);

ALTER TABLE main_table OWNER TO postgres;
ALTER TABLE ONLY main_table
    ADD CONSTRAINT main_table_pk PRIMARY KEY (shop_id, client_id, distr_id, item_id, purchase_date);
ALTER TABLE ONLY main_table
    ADD CONSTRAINT main_table_client_null_fk FOREIGN KEY (client_id) REFERENCES client(id);
ALTER TABLE ONLY main_table
    ADD CONSTRAINT main_table_distributor_null_fk FOREIGN KEY (distr_id) REFERENCES distributor(id);
ALTER TABLE ONLY main_table
    ADD CONSTRAINT main_table_item_null_fk FOREIGN KEY (item_id) REFERENCES item(id);
ALTER TABLE ONLY main_table
    ADD CONSTRAINT main_table_shop_null_fk FOREIGN KEY (shop_id) REFERENCES shop(id);
