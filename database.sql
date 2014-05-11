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
    status status_type DEFAULT '0'::status_type NOT NULL,
    description text,
    p_id integer
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
-- Name: event; Type: TABLE; Schema: public; Owner: erkoc; Tablespace: 
--

CREATE TABLE event (
    e_id integer NOT NULL,
    title character varying(50),
    type character varying(50),
    topic character varying(50),
    location character varying(100),
    date character varying(30),
    logo_id integer,
    description text,
    u_id integer,
    quato integer
);


ALTER TABLE public.event OWNER TO erkoc;

--
-- Name: event_e_id_seq; Type: SEQUENCE; Schema: public; Owner: erkoc
--

CREATE SEQUENCE event_e_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.event_e_id_seq OWNER TO erkoc;

--
-- Name: event_e_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: erkoc
--

ALTER SEQUENCE event_e_id_seq OWNED BY event.e_id;


--
-- Name: logo; Type: TABLE; Schema: public; Owner: erkoc; Tablespace: 
--

CREATE TABLE logo (
    l_id integer NOT NULL,
    path text
);


ALTER TABLE public.logo OWNER TO erkoc;

--
-- Name: logo_l_id_seq; Type: SEQUENCE; Schema: public; Owner: erkoc
--

CREATE SEQUENCE logo_l_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.logo_l_id_seq OWNER TO erkoc;

--
-- Name: logo_l_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: erkoc
--

ALTER SEQUENCE logo_l_id_seq OWNED BY logo.l_id;


--
-- Name: participate; Type: TABLE; Schema: public; Owner: erkoc; Tablespace: 
--

CREATE TABLE participate (
    u_id integer,
    e_id integer
);


ALTER TABLE public.participate OWNER TO erkoc;

--
-- Name: photo; Type: TABLE; Schema: public; Owner: erkoc; Tablespace: 
--

CREATE TABLE photo (
    p_id integer NOT NULL,
    path text
);


ALTER TABLE public.photo OWNER TO erkoc;

--
-- Name: photo_p_id_seq; Type: SEQUENCE; Schema: public; Owner: erkoc
--

CREATE SEQUENCE photo_p_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.photo_p_id_seq OWNER TO erkoc;

--
-- Name: photo_p_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: erkoc
--

ALTER SEQUENCE photo_p_id_seq OWNED BY photo.p_id;


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
-- Name: e_id; Type: DEFAULT; Schema: public; Owner: erkoc
--

ALTER TABLE ONLY event ALTER COLUMN e_id SET DEFAULT nextval('event_e_id_seq'::regclass);


--
-- Name: l_id; Type: DEFAULT; Schema: public; Owner: erkoc
--

ALTER TABLE ONLY logo ALTER COLUMN l_id SET DEFAULT nextval('logo_l_id_seq'::regclass);


--
-- Name: p_id; Type: DEFAULT; Schema: public; Owner: erkoc
--

ALTER TABLE ONLY photo ALTER COLUMN p_id SET DEFAULT nextval('photo_p_id_seq'::regclass);


--
-- Data for Name: User; Type: TABLE DATA; Schema: public; Owner: erkoc
--

COPY "User" (id, username, pass, email, activation, status, description, p_id) FROM stdin;
27	bagcilar	1234	aerkoc01@gmail.com	573a4ab2055d7430f3f509ac539d5475	1	\N	10
18	erkoc	1234	aerkoc01@gmail.com	961a9fdb17512eb287c4b37ac68f10c6	1	asdfjal;sflaksdfsdf	13
24	fth	test	test123@hotmail.com	b4bb16d5537d014d909f21e7e6da96aa	1	test fth account	16
19	root	1234	aerkoc01@gmail.com	0a08938ca06d51d113cf22895038a6c4	1	fasjdfklajslkdfj alksdf saf	6
21	ahmet	1234	aerkoc01@gmail.com	1ae896d1c59c9dc7b7ac1ef075c80fc9	1	fasjdfklajslkdfj alksdf saf	6
20	test	test	aerkoc01@gmail.com	dc7c4689b8cd243070b1476d4bcb0813	1	fasjdfklajslkdfj alksdf saf	6
22	admin	1234	aerkoc01@gmail.com	550dc288b20135ae80e9944779076956	1	fasjdfklajslkdfj alksdf saf	6
23	sontest	1234	aerkoc01@gmail.com	1584377a5e4d0b6c3832a3505a80de4f	0	fasjdfklajslkdfj alksdf saf	6
25	fth12	1234	aerkoc01@gmail.com	f5bcf35580553f2391006b79f0dc555a	1	fasjdfklajslkdfj alksdf saf	6
28	final	1234	ahmeterkoc@st.fatih.edu.tr	c2f6badde76854687a00a0ca746cd1fa	1	Test update	19
26	nafi	1234	aerkoc01@gmail.com	e2a5f5b3a7d78381e743b5eef3fdde16	1	nafi test acount	9
\.


--
-- Name: User_id_seq; Type: SEQUENCE SET; Schema: public; Owner: erkoc
--

SELECT pg_catalog.setval('"User_id_seq"', 28, true);


--
-- Data for Name: event; Type: TABLE DATA; Schema: public; Owner: erkoc
--

COPY event (e_id, title, type, topic, location, date, logo_id, description, u_id, quato) FROM stdin;
2	dfasdfkljsakldf 	Seminar or Talk		Mersin adana	1212-12-12T00:12	1	asdfasdfsdf sdf as	18	50
7	kardo nabersin ??	Meeting		Ocak	2014-05-09T00:12	1	son updateler 	18	49
3	nabersind	Dinner or Gala		Mersin istnaubl	2222-12-04T00:12	1	bu son yazi olacak sekilde 	18	49
5	Wordpress Kurulumu update olacak	Meeting		Mersin	111111-11-11T23:11	1	 update test yazisi	21	100
6	Wordpress Kurulumu update olacak	Meeting		Mersin	111111-11-11T23:11	1	 update test yazisi	25	100
4	Wordpress Kurulumu update olacak	Meeting		Mersin	111111-11-11T23:11	1	 update test yazisi	18	100
9	Wordpress Kurulumu update olacak	Meeting		Mersin	111111-11-11T23:11	1	 update test yazisi	22	100
10	Wordpress Kurulumu update olacak	Meeting		Mersin	111111-11-11T23:11	1	 update test yazisi	22	100
11	Wordpress Kurulumu update olacak	Meeting		Mersin	111111-11-11T23:11	1	 update test yazisi	18	100
13	Wordpress Kurulumu update olacak	Meeting		Mersin	111111-11-11T23:11	1	 update test yazisi	18	100
14	Wordpress Kurulumu update olacak	Meeting		Mersin	111111-11-11T23:11	1	 update test yazisi	18	100
16	Wordpress Kurulumu update olacak	Meeting		Mersin	111111-11-11T23:11	1	 update test yazisi	18	100
17	Wordpress Kurulumu update olacak	Meeting		Mersin	111111-11-11T23:11	1	 update test yazisi	18	100
18	Wordpress Kurulumu update olacak	Meeting		Mersin	111111-11-11T23:11	1	 update test yazisi	18	100
19	Wordpress Kurulumu update olacak	Meeting		Mersin	111111-11-11T23:11	1	 update test yazisi	18	100
20	Wordpress Kurulumu update olacak	Meeting		Mersin	111111-11-11T23:11	1	 update test yazisi	18	100
21	Wordpress Kurulumu update olacak	Meeting		Mersin	111111-11-11T23:11	1	 update test yazisi	18	100
22	Wordpress Kurulumu update olacak	Meeting		Mersin	111111-11-11T23:11	1	 update test yazisi	18	100
23	Wordpress Kurulumu update olacak	Meeting		Mersin	111111-11-11T23:11	1	 update test yazisi	18	100
24	Wordpress Kurulumu update olacak	Meeting		Mersin	111111-11-11T23:11	1	 update test yazisi	18	100
25	Wordpress Kurulumu update olacak	Meeting		Mersin	111111-11-11T23:11	1	 update test yazisi	18	100
26	Wordpress Kurulumu update olacak	Meeting		Mersin	111111-11-11T23:11	1	 update test yazisi	18	100
27	Wordpress Kurulumu update olacak	Meeting		Mersin	111111-11-11T23:11	1	 update test yazisi	18	100
28	Wordpress Kurulumu update olacak	Meeting		Mersin	111111-11-11T23:11	1	 update test yazisi	18	100
29	Wordpress Kurulumu update olacak	Meeting		Mersin	111111-11-11T23:11	1	 update test yazisi	18	100
30	Wordpress Kurulumu update olacak	Meeting		Mersin	111111-11-11T23:11	1	 update test yazisi	18	100
31	Wordpress Kurulumu update olacak	Meeting		Mersin	111111-11-11T23:11	1	 update test yazisi	18	100
32	Wordpress Kurulumu update olacak	Meeting		Mersin	111111-11-11T23:11	1	 update test yazisi	18	100
33	Wordpress Kurulumu update olacak	Meeting		Mersin	111111-11-11T23:11	10	 update test yazisi	18	100
34	Wordpress Kurulumu update olacak	Meeting		Mersin	111111-11-11T23:11	12	 update test yazisi	18	100
35	Wordpress Kurulumu update olacak	Meeting		Mersin	111111-11-11T23:11	13	 update test yazisi	18	100
12	Wordpress Kurulumu update olacak	Meeting		Mersin	111111-11-11T23:11	1	 update test yazisi	18	100
36	Wordpress Kurulumu update olacak	Meeting		Mersin	111111-11-11T23:11	14	 update test yazisi	18	100
15	Wordpress Kurulumu update olacak	Meeting		Mersin	111111-11-11T23:11	1	 update test yazisi	18	100
8	son update 123	Meeting		Mersin adana	2014-04-30T00:12	1	son update artik	18	49
37	bu bir test event	Meeting	Fashion &amp; Beauty	adana	2014-05-08T00:12	15	cok guzel olacak	24	148
38	Duzenleme Final	Dinner or Gala	Business &amp; Professional	Huzurevleri	2014-05-14T03:15	16		28	15
\.


--
-- Name: event_e_id_seq; Type: SEQUENCE SET; Schema: public; Owner: erkoc
--

SELECT pg_catalog.setval('event_e_id_seq', 38, true);


--
-- Data for Name: logo; Type: TABLE DATA; Schema: public; Owner: erkoc
--

COPY logo (l_id, path) FROM stdin;
1	foto1
2	dosya.jpg
3	/usr/local/var/www/eventmanagementsystem/logo/dosya.jpg
4	/usr/local/var/www/eventmanagementsystem/logo/
5	/usr/local/var/www/eventmanagementsystem/logo/ScreenShot2014-05-10at18.26.48.png
6	/usr/local/var/www/eventmanagementsystem/logo/ScreenShot2014-05-10at19.25.23.png
7	/usr/local/var/www/eventmanagementsystem/logo/ScreenShot2014-05-10at19.25.23.png
8	/usr/local/var/www/eventmanagementsystem/logo/ScreenShot2014-05-10at19.29.34.png
9	/usr/local/var/www/eventmanagementsystem/logo/ScreenShot2014-05-10at19.32.44.png
10	/usr/local/var/www/eventmanagementsystem/logo/ScreenShot2014-05-10at19.32.44.png
11	ScreenShot2014-05-10at20.20.24.png
12	ScreenShot2014-05-10at20.20.24.png
13	ScreenShot2014-05-10at20.27.07.png
14	dosya.jpg
15	10338853_10202977604293969_1046454239_n.jpg
16	ScreenShot2014-05-11at22.03.20.png
\.


--
-- Name: logo_l_id_seq; Type: SEQUENCE SET; Schema: public; Owner: erkoc
--

SELECT pg_catalog.setval('logo_l_id_seq', 16, true);


--
-- Data for Name: participate; Type: TABLE DATA; Schema: public; Owner: erkoc
--

COPY participate (u_id, e_id) FROM stdin;
18	7
21	4
22	9
18	11
18	12
18	15
18	8
18	7
18	3
18	37
18	8
28	37
\.


--
-- Data for Name: photo; Type: TABLE DATA; Schema: public; Owner: erkoc
--

COPY photo (p_id, path) FROM stdin;
1	ScreenShot2014-05-11at01.16.21.png
2	ScreenShot2014-05-11at01.16.21.png
3	ScreenShot2014-05-10at18.26.48.png
4	ScreenShot2014-05-10at19.32.44.png
5	ScreenShot2014-05-10at20.27.05.png
6	ScreenShot2014-05-11at01.54.56.png
7	ScreenShot2014-05-10at19.29.34.png
8	ScreenShot2014-05-10at19.29.34.png
9	ScreenShot2014-05-11at03.17.051.png
10	default.jpeg
11	ScreenShot2014-05-11at06.08.21.png
12	
13	ScreenShot2014-05-11at01.54.56.png
14	
15	dosya.jpg
16	ScreenShot2014-05-11at03.17.051.png
17	ScreenShot2014-05-11at22.04.27.png
18	
19	ScreenShot2014-05-11at22.04.27.png
\.


--
-- Name: photo_p_id_seq; Type: SEQUENCE SET; Schema: public; Owner: erkoc
--

SELECT pg_catalog.setval('photo_p_id_seq', 19, true);


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
-- Name: event_pkey; Type: CONSTRAINT; Schema: public; Owner: erkoc; Tablespace: 
--

ALTER TABLE ONLY event
    ADD CONSTRAINT event_pkey PRIMARY KEY (e_id);


--
-- Name: logo_pkey; Type: CONSTRAINT; Schema: public; Owner: erkoc; Tablespace: 
--

ALTER TABLE ONLY logo
    ADD CONSTRAINT logo_pkey PRIMARY KEY (l_id);


--
-- Name: photo_pkey; Type: CONSTRAINT; Schema: public; Owner: erkoc; Tablespace: 
--

ALTER TABLE ONLY photo
    ADD CONSTRAINT photo_pkey PRIMARY KEY (p_id);


--
-- Name: User_p_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: erkoc
--

ALTER TABLE ONLY "User"
    ADD CONSTRAINT "User_p_id_fkey" FOREIGN KEY (p_id) REFERENCES photo(p_id);


--
-- Name: event_logo_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: erkoc
--

ALTER TABLE ONLY event
    ADD CONSTRAINT event_logo_id_fkey FOREIGN KEY (logo_id) REFERENCES logo(l_id);


--
-- Name: event_u_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: erkoc
--

ALTER TABLE ONLY event
    ADD CONSTRAINT event_u_id_fkey FOREIGN KEY (u_id) REFERENCES "User"(id);


--
-- Name: participate_e_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: erkoc
--

ALTER TABLE ONLY participate
    ADD CONSTRAINT participate_e_id_fkey FOREIGN KEY (e_id) REFERENCES event(e_id);


--
-- Name: participate_u_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: erkoc
--

ALTER TABLE ONLY participate
    ADD CONSTRAINT participate_u_id_fkey FOREIGN KEY (u_id) REFERENCES "User"(id);


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

