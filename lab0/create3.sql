--
-- PostgreSQL database dump
--

-- Dumped from database version 12.12
-- Dumped by pg_dump version 12.12

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: entering; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE entering WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'Russian_Russia.1251' LC_CTYPE = 'Russian_Russia.1251';


ALTER DATABASE entering OWNER TO postgres;

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: category; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.category (
    id integer NOT NULL,
    name text
);


ALTER TABLE public.category OWNER TO postgres;

--
-- Name: client; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.client (
    id integer NOT NULL,
    name text NOT NULL,
    email text NOT NULL,
    phone text NOT NULL
);


ALTER TABLE public.client OWNER TO postgres;

--
-- Name: distributor; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.distributor (
    id integer NOT NULL,
    name text
);


ALTER TABLE public.distributor OWNER TO postgres;

--
-- Name: item; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.item (
    id integer NOT NULL,
    name text,
    category_id integer
);


ALTER TABLE public.item OWNER TO postgres;

--
-- Name: main_table; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.main_table (
    id integer NOT NULL,
    shop_id integer NOT NULL,
    client_id integer NOT NULL,
    item_id integer NOT NULL,
    distr_id integer NOT NULL,
    amount integer NOT NULL,
    price numeric NOT NULL,
    purchase_date date NOT NULL
);


ALTER TABLE public.main_table OWNER TO postgres;

--
-- Name: shop; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.shop (
    id integer NOT NULL,
    name text NOT NULL,
    address text NOT NULL
);


ALTER TABLE public.shop OWNER TO postgres;

--
-- Data for Name: category; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: client; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: distributor; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: item; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: main_table; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Data for Name: shop; Type: TABLE DATA; Schema: public; Owner: postgres
--



--
-- Name: category category_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.category
    ADD CONSTRAINT category_pk PRIMARY KEY (id);


--
-- Name: client client_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.client
    ADD CONSTRAINT client_pk PRIMARY KEY (id);


--
-- Name: distributor distributor_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.distributor
    ADD CONSTRAINT distributor_pk PRIMARY KEY (id);


--
-- Name: item item_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT item_pk PRIMARY KEY (id);


--
-- Name: main_table main_table_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_table
    ADD CONSTRAINT main_table_pk PRIMARY KEY (id);


--
-- Name: shop shop_pk; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.shop
    ADD CONSTRAINT shop_pk PRIMARY KEY (id);


--
-- Name: item item_category_null_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.item
    ADD CONSTRAINT item_category_null_fk FOREIGN KEY (category_id) REFERENCES public.category(id);


--
-- Name: main_table main_table_client_null_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_table
    ADD CONSTRAINT main_table_client_null_fk FOREIGN KEY (client_id) REFERENCES public.client(id);


--
-- Name: main_table main_table_distributor_null_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_table
    ADD CONSTRAINT main_table_distributor_null_fk FOREIGN KEY (distr_id) REFERENCES public.distributor(id);


--
-- Name: main_table main_table_item_null_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_table
    ADD CONSTRAINT main_table_item_null_fk FOREIGN KEY (item_id) REFERENCES public.item(id);


--
-- Name: main_table main_table_shop_null_fk; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.main_table
    ADD CONSTRAINT main_table_shop_null_fk FOREIGN KEY (shop_id) REFERENCES public.shop(id);


--
-- PostgreSQL database dump complete
--

