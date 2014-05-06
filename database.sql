--
-- PostgreSQL database dump
--

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

--
-- Name: status_type; Type: TYPE; Schema: public; Owner: erkoc
--

CREATE TYPE status_type AS ENUM (
    '0',
    '1'
);


ALTER TYPE public.status_type OWNER TO erkoc;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: User; Type: TABLE; Schema: public; Owner: erkoc; Tablespace: 
--

CREATE TABLE "User" (
    id integer NOT NULL,
    username character varying(50) NOT NULL,
    pass character varying(50) NOT NULL,
    email character varying(60) NOT NULL,
    activation character varying(300) NOT NULL,
    status status_type DEFAULT '0'::status_type NOT NULL
);


ALTER TABLE public."User" OWNER TO erkoc;

--
-- Name: User_id_seq; Type: SEQUENCE; Schema: public; Owner: erkoc
--

CREATE SEQUENCE "User_id_seq"
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public."User_id_seq" OWNER TO erkoc;

--
-- Name: User_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: erkoc
--

ALTER SEQUENCE "User_id_seq" OWNED BY "User".id;


--
-- Name: admin; Type: TABLE; Schema: public; Owner: erkoc; Tablespace: 
--

CREATE TABLE admin (
    id integer,
    adminname character varying,
    password character varying
);


ALTER TABLE public.admin OWNER TO erkoc;

--
-- Name: member; Type: TABLE; Schema: public; Owner: erkoc; Tablespace: 
--

CREATE TABLE member (
    "userName" character varying,
    password character varying,
    "eMail" character varying,
    "userID" integer
);


ALTER TABLE public.member OWNER TO erkoc;

--
-- Name: user_id; Type: SEQUENCE; Schema: public; Owner: erkoc
--

CREATE SEQUENCE user_id
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_id OWNER TO erkoc;

--
-- Name: id; Type: DEFAULT; Schema: public; Owner: erkoc
--

ALTER TABLE ONLY "User" ALTER COLUMN id SET DEFAULT nextval('"User_id_seq"'::regclass);


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: erkoc
--

COPY "User" (id, username, pass, email, activation, status) FROM stdin;
18	erkoc	1234	aerkoc01@gmail.com	961a9fdb17512eb287c4b37ac68f10c6	1
19	root	1234	aerkoc01@gmail.com	0a08938ca06d51d113cf22895038a6c4	1
21	ahmet	1234	aerkoc01@gmail.com	1ae896d1c59c9dc7b7ac1ef075c80fc9	1
20	test	test	aerkoc01@gmail.com	dc7c4689b8cd243070b1476d4bcb0813	1
22	admin	1234	aerkoc01@gmail.com	550dc288b20135ae80e9944779076956	1
\.


--
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: public; Owner: erkoc
--

SELECT pg_catalog.setval('"User_id_seq"', 22, true);


--
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: erkoc
--

COPY admin (id, adminname, password) FROM stdin;
1	test	sifre
\.


--
-- Data for Name: member; Type: TABLE DATA; Schema: public; Owner: erkoc
--

COPY member ("userName", password, "eMail", "userID") FROM stdin;
root	root	root@root.com	0
\.


--
-- Name: user_id; Type: SEQUENCE SET; Schema: public; Owner: erkoc
--

SELECT pg_catalog.setval('user_id', 99999, true);


--
-- Name: User_activation_key; Type: CONSTRAINT; Schema: public; Owner: erkoc; Tablespace: 
--

ALTER TABLE ONLY "User"
    ADD CONSTRAINT "User_activation_key" UNIQUE (activation);


--
-- Name: User_pkey; Type: CONSTRAINT; Schema: public; Owner: erkoc; Tablespace: 
--

ALTER TABLE ONLY "User"
    ADD CONSTRAINT "User_pkey" PRIMARY KEY (id);


--
-- Name: public; Type: ACL; Schema: -; Owner: erkoc
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM erkoc;
GRANT ALL ON SCHEMA public TO erkoc;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

