--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Roles
--

CREATE ROLE erkoc;
ALTER ROLE erkoc WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION PASSWORD 'md5c73725bfe3aa09cb4bd428e73922e2a9';






--
-- Database creation
--

CREATE DATABASE "ab2014Calisma" WITH TEMPLATE = template0 OWNER = erkoc;
CREATE DATABASE ems WITH TEMPLATE = template0 OWNER = erkoc;
CREATE DATABASE olayvar WITH TEMPLATE = template0 OWNER = erkoc;
REVOKE ALL ON DATABASE template1 FROM PUBLIC;
REVOKE ALL ON DATABASE template1 FROM erkoc;
GRANT ALL ON DATABASE template1 TO erkoc;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


\connect "ab2014Calisma"

SET default_transaction_read_only = off;

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

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: admin_profiles; Type: TABLE; Schema: public; Owner: erkoc; Tablespace: 
--

CREATE TABLE admin_profiles (
    id integer NOT NULL,
    name character varying(255),
    surname character varying(255),
    gender character varying(255),
    gsm character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    admin_id integer
);


ALTER TABLE public.admin_profiles OWNER TO erkoc;

--
-- Name: admin_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: erkoc
--

CREATE SEQUENCE admin_profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admin_profiles_id_seq OWNER TO erkoc;

--
-- Name: admin_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: erkoc
--

ALTER SEQUENCE admin_profiles_id_seq OWNED BY admin_profiles.id;


--
-- Name: admins; Type: TABLE; Schema: public; Owner: erkoc; Tablespace: 
--

CREATE TABLE admins (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.admins OWNER TO erkoc;

--
-- Name: admins_id_seq; Type: SEQUENCE; Schema: public; Owner: erkoc
--

CREATE SEQUENCE admins_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.admins_id_seq OWNER TO erkoc;

--
-- Name: admins_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: erkoc
--

ALTER SEQUENCE admins_id_seq OWNED BY admins.id;


--
-- Name: books; Type: TABLE; Schema: public; Owner: erkoc; Tablespace: 
--

CREATE TABLE books (
    id integer NOT NULL,
    title character varying(255),
    isbn integer,
    author character varying(255),
    description text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.books OWNER TO erkoc;

--
-- Name: books_id_seq; Type: SEQUENCE; Schema: public; Owner: erkoc
--

CREATE SEQUENCE books_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.books_id_seq OWNER TO erkoc;

--
-- Name: books_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: erkoc
--

ALTER SEQUENCE books_id_seq OWNED BY books.id;


--
-- Name: comments; Type: TABLE; Schema: public; Owner: erkoc; Tablespace: 
--

CREATE TABLE comments (
    id integer NOT NULL,
    commenter character varying(255),
    body text,
    post_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.comments OWNER TO erkoc;

--
-- Name: comments_id_seq; Type: SEQUENCE; Schema: public; Owner: erkoc
--

CREATE SEQUENCE comments_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.comments_id_seq OWNER TO erkoc;

--
-- Name: comments_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: erkoc
--

ALTER SEQUENCE comments_id_seq OWNED BY comments.id;


--
-- Name: courses; Type: TABLE; Schema: public; Owner: erkoc; Tablespace: 
--

CREATE TABLE courses (
    id integer NOT NULL,
    admin_id integer,
    event_id integer,
    year integer,
    title character varying(255),
    content text,
    capacity integer,
    prerequisite text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.courses OWNER TO erkoc;

--
-- Name: courses_id_seq; Type: SEQUENCE; Schema: public; Owner: erkoc
--

CREATE SEQUENCE courses_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.courses_id_seq OWNER TO erkoc;

--
-- Name: courses_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: erkoc
--

ALTER SEQUENCE courses_id_seq OWNED BY courses.id;


--
-- Name: ders; Type: TABLE; Schema: public; Owner: erkoc; Tablespace: 
--

CREATE TABLE ders (
    id integer NOT NULL,
    kodu integer,
    adi character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.ders OWNER TO erkoc;

--
-- Name: ders_id_seq; Type: SEQUENCE; Schema: public; Owner: erkoc
--

CREATE SEQUENCE ders_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ders_id_seq OWNER TO erkoc;

--
-- Name: ders_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: erkoc
--

ALTER SEQUENCE ders_id_seq OWNED BY ders.id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: erkoc; Tablespace: 
--

CREATE TABLE events (
    id integer NOT NULL,
    name character varying(255),
    city character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    date date
);


ALTER TABLE public.events OWNER TO erkoc;

--
-- Name: events_id_seq; Type: SEQUENCE; Schema: public; Owner: erkoc
--

CREATE SEQUENCE events_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_id_seq OWNER TO erkoc;

--
-- Name: events_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: erkoc
--

ALTER SEQUENCE events_id_seq OWNED BY events.id;


--
-- Name: kitaps; Type: TABLE; Schema: public; Owner: erkoc; Tablespace: 
--

CREATE TABLE kitaps (
    id integer NOT NULL,
    isim character varying(255),
    tur character varying(255),
    yazar character varying(255),
    hakkinda text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.kitaps OWNER TO erkoc;

--
-- Name: kitaps_id_seq; Type: SEQUENCE; Schema: public; Owner: erkoc
--

CREATE SEQUENCE kitaps_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.kitaps_id_seq OWNER TO erkoc;

--
-- Name: kitaps_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: erkoc
--

ALTER SEQUENCE kitaps_id_seq OWNED BY kitaps.id;


--
-- Name: lessons; Type: TABLE; Schema: public; Owner: erkoc; Tablespace: 
--

CREATE TABLE lessons (
    id integer NOT NULL,
    name character varying(255),
    teacher_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.lessons OWNER TO erkoc;

--
-- Name: lessons_id_seq; Type: SEQUENCE; Schema: public; Owner: erkoc
--

CREATE SEQUENCE lessons_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.lessons_id_seq OWNER TO erkoc;

--
-- Name: lessons_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: erkoc
--

ALTER SEQUENCE lessons_id_seq OWNED BY lessons.id;


--
-- Name: lessons_students; Type: TABLE; Schema: public; Owner: erkoc; Tablespace: 
--

CREATE TABLE lessons_students (
    student_id integer,
    lesson_id integer
);


ALTER TABLE public.lessons_students OWNER TO erkoc;

--
-- Name: posts; Type: TABLE; Schema: public; Owner: erkoc; Tablespace: 
--

CREATE TABLE posts (
    id integer NOT NULL,
    title character varying(255),
    text text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.posts OWNER TO erkoc;

--
-- Name: posts_id_seq; Type: SEQUENCE; Schema: public; Owner: erkoc
--

CREATE SEQUENCE posts_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.posts_id_seq OWNER TO erkoc;

--
-- Name: posts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: erkoc
--

ALTER SEQUENCE posts_id_seq OWNED BY posts.id;


--
-- Name: rates; Type: TABLE; Schema: public; Owner: erkoc; Tablespace: 
--

CREATE TABLE rates (
    id integer NOT NULL,
    rateable_id integer,
    rateable_type character varying(255),
    rate integer,
    content text,
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.rates OWNER TO erkoc;

--
-- Name: rates_id_seq; Type: SEQUENCE; Schema: public; Owner: erkoc
--

CREATE SEQUENCE rates_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.rates_id_seq OWNER TO erkoc;

--
-- Name: rates_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: erkoc
--

ALTER SEQUENCE rates_id_seq OWNED BY rates.id;


--
-- Name: requests; Type: TABLE; Schema: public; Owner: erkoc; Tablespace: 
--

CREATE TABLE requests (
    id integer NOT NULL,
    course_id integer,
    user_id integer,
    state character varying(255),
    event_id character varying(255),
    alternative_id integer,
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    is_dormitory boolean
);


ALTER TABLE public.requests OWNER TO erkoc;

--
-- Name: requests_id_seq; Type: SEQUENCE; Schema: public; Owner: erkoc
--

CREATE SEQUENCE requests_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.requests_id_seq OWNER TO erkoc;

--
-- Name: requests_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: erkoc
--

ALTER SEQUENCE requests_id_seq OWNED BY requests.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: erkoc; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying(255) NOT NULL
);


ALTER TABLE public.schema_migrations OWNER TO erkoc;

--
-- Name: students; Type: TABLE; Schema: public; Owner: erkoc; Tablespace: 
--

CREATE TABLE students (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.students OWNER TO erkoc;

--
-- Name: students_id_seq; Type: SEQUENCE; Schema: public; Owner: erkoc
--

CREATE SEQUENCE students_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.students_id_seq OWNER TO erkoc;

--
-- Name: students_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: erkoc
--

ALTER SEQUENCE students_id_seq OWNED BY students.id;


--
-- Name: teachers; Type: TABLE; Schema: public; Owner: erkoc; Tablespace: 
--

CREATE TABLE teachers (
    id integer NOT NULL,
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone
);


ALTER TABLE public.teachers OWNER TO erkoc;

--
-- Name: teachers_id_seq; Type: SEQUENCE; Schema: public; Owner: erkoc
--

CREATE SEQUENCE teachers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.teachers_id_seq OWNER TO erkoc;

--
-- Name: teachers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: erkoc
--

ALTER SEQUENCE teachers_id_seq OWNED BY teachers.id;


--
-- Name: user_profiles; Type: TABLE; Schema: public; Owner: erkoc; Tablespace: 
--

CREATE TABLE user_profiles (
    id integer NOT NULL,
    first_name character varying(255),
    last_name character varying(255),
    tc_no character varying(255),
    gsm character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    user_id integer
);


ALTER TABLE public.user_profiles OWNER TO erkoc;

--
-- Name: user_profiles_id_seq; Type: SEQUENCE; Schema: public; Owner: erkoc
--

CREATE SEQUENCE user_profiles_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.user_profiles_id_seq OWNER TO erkoc;

--
-- Name: user_profiles_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: erkoc
--

ALTER SEQUENCE user_profiles_id_seq OWNED BY user_profiles.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: erkoc; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    email character varying(255) DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying(255) DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying(255),
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip character varying(255),
    last_sign_in_ip character varying(255),
    name character varying(255),
    created_at timestamp without time zone,
    updated_at timestamp without time zone,
    time_zone character varying(255)
);


ALTER TABLE public.users OWNER TO erkoc;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: erkoc
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_id_seq OWNER TO erkoc;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: erkoc
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: erkoc
--

ALTER TABLE ONLY admin_profiles ALTER COLUMN id SET DEFAULT nextval('admin_profiles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: erkoc
--

ALTER TABLE ONLY admins ALTER COLUMN id SET DEFAULT nextval('admins_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: erkoc
--

ALTER TABLE ONLY books ALTER COLUMN id SET DEFAULT nextval('books_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: erkoc
--

ALTER TABLE ONLY comments ALTER COLUMN id SET DEFAULT nextval('comments_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: erkoc
--

ALTER TABLE ONLY courses ALTER COLUMN id SET DEFAULT nextval('courses_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: erkoc
--

ALTER TABLE ONLY ders ALTER COLUMN id SET DEFAULT nextval('ders_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: erkoc
--

ALTER TABLE ONLY events ALTER COLUMN id SET DEFAULT nextval('events_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: erkoc
--

ALTER TABLE ONLY kitaps ALTER COLUMN id SET DEFAULT nextval('kitaps_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: erkoc
--

ALTER TABLE ONLY lessons ALTER COLUMN id SET DEFAULT nextval('lessons_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: erkoc
--

ALTER TABLE ONLY posts ALTER COLUMN id SET DEFAULT nextval('posts_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: erkoc
--

ALTER TABLE ONLY rates ALTER COLUMN id SET DEFAULT nextval('rates_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: erkoc
--

ALTER TABLE ONLY requests ALTER COLUMN id SET DEFAULT nextval('requests_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: erkoc
--

ALTER TABLE ONLY students ALTER COLUMN id SET DEFAULT nextval('students_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: erkoc
--

ALTER TABLE ONLY teachers ALTER COLUMN id SET DEFAULT nextval('teachers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: erkoc
--

ALTER TABLE ONLY user_profiles ALTER COLUMN id SET DEFAULT nextval('user_profiles_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: erkoc
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: admin_profiles; Type: TABLE DATA; Schema: public; Owner: erkoc
--

COPY admin_profiles (id, name, surname, gender, gsm, created_at, updated_at, admin_id) FROM stdin;
\.


--
-- Name: admin_profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: erkoc
--

SELECT pg_catalog.setval('admin_profiles_id_seq', 1, false);


--
-- Data for Name: admins; Type: TABLE DATA; Schema: public; Owner: erkoc
--

COPY admins (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, created_at, updated_at) FROM stdin;
1	erkoc@erkoc.com	$2a$10$TnMI1i9RKbuTSUewWQclr.yKv.r8GJwwgaEyD8pR.93iX8QTTsREq	\N	\N	\N	2	2014-02-21 12:20:50.988663	2014-02-21 12:02:31.745071	127.0.0.1	127.0.0.1	2014-02-21 12:01:43.881955	2014-02-21 12:20:50.98962
\.


--
-- Name: admins_id_seq; Type: SEQUENCE SET; Schema: public; Owner: erkoc
--

SELECT pg_catalog.setval('admins_id_seq', 1, true);


--
-- Data for Name: books; Type: TABLE DATA; Schema: public; Owner: erkoc
--

COPY books (id, title, isbn, author, description, created_at, updated_at) FROM stdin;
\.


--
-- Name: books_id_seq; Type: SEQUENCE SET; Schema: public; Owner: erkoc
--

SELECT pg_catalog.setval('books_id_seq', 1, false);


--
-- Data for Name: comments; Type: TABLE DATA; Schema: public; Owner: erkoc
--

COPY comments (id, commenter, body, post_id, created_at, updated_at) FROM stdin;
1	test kullanicisi 	Bu bir yorum ornegidir.	1	2014-02-08 13:34:59.297998	2014-02-08 13:34:59.297998
\.


--
-- Name: comments_id_seq; Type: SEQUENCE SET; Schema: public; Owner: erkoc
--

SELECT pg_catalog.setval('comments_id_seq', 1, true);


--
-- Data for Name: courses; Type: TABLE DATA; Schema: public; Owner: erkoc
--

COPY courses (id, admin_id, event_id, year, title, content, capacity, prerequisite, created_at, updated_at) FROM stdin;
\.


--
-- Name: courses_id_seq; Type: SEQUENCE SET; Schema: public; Owner: erkoc
--

SELECT pg_catalog.setval('courses_id_seq', 1, false);


--
-- Data for Name: ders; Type: TABLE DATA; Schema: public; Owner: erkoc
--

COPY ders (id, kodu, adi, created_at, updated_at) FROM stdin;
1	362	Networking	2014-02-17 10:08:37.514545	2014-02-17 10:08:37.514545
\.


--
-- Name: ders_id_seq; Type: SEQUENCE SET; Schema: public; Owner: erkoc
--

SELECT pg_catalog.setval('ders_id_seq', 1, true);


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: erkoc
--

COPY events (id, name, city, created_at, updated_at, date) FROM stdin;
\.


--
-- Name: events_id_seq; Type: SEQUENCE SET; Schema: public; Owner: erkoc
--

SELECT pg_catalog.setval('events_id_seq', 1, false);


--
-- Data for Name: kitaps; Type: TABLE DATA; Schema: public; Owner: erkoc
--

COPY kitaps (id, isim, tur, yazar, hakkinda, created_at, updated_at) FROM stdin;
\.


--
-- Name: kitaps_id_seq; Type: SEQUENCE SET; Schema: public; Owner: erkoc
--

SELECT pg_catalog.setval('kitaps_id_seq', 1, false);


--
-- Data for Name: lessons; Type: TABLE DATA; Schema: public; Owner: erkoc
--

COPY lessons (id, name, teacher_id, created_at, updated_at) FROM stdin;
\.


--
-- Name: lessons_id_seq; Type: SEQUENCE SET; Schema: public; Owner: erkoc
--

SELECT pg_catalog.setval('lessons_id_seq', 1, false);


--
-- Data for Name: lessons_students; Type: TABLE DATA; Schema: public; Owner: erkoc
--

COPY lessons_students (student_id, lesson_id) FROM stdin;
\.


--
-- Data for Name: posts; Type: TABLE DATA; Schema: public; Owner: erkoc
--

COPY posts (id, title, text, created_at, updated_at) FROM stdin;
1	Test12	12323	2014-02-08 13:32:36.928339	2014-02-08 13:32:36.928339
2	Networking 	Bugun network dersi var	2014-02-17 10:06:55.740802	2014-02-17 10:06:55.740802
\.


--
-- Name: posts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: erkoc
--

SELECT pg_catalog.setval('posts_id_seq', 2, true);


--
-- Data for Name: rates; Type: TABLE DATA; Schema: public; Owner: erkoc
--

COPY rates (id, rateable_id, rateable_type, rate, content, created_at, updated_at) FROM stdin;
\.


--
-- Name: rates_id_seq; Type: SEQUENCE SET; Schema: public; Owner: erkoc
--

SELECT pg_catalog.setval('rates_id_seq', 1, false);


--
-- Data for Name: requests; Type: TABLE DATA; Schema: public; Owner: erkoc
--

COPY requests (id, course_id, user_id, state, event_id, alternative_id, created_at, updated_at, is_dormitory) FROM stdin;
\.


--
-- Name: requests_id_seq; Type: SEQUENCE SET; Schema: public; Owner: erkoc
--

SELECT pg_catalog.setval('requests_id_seq', 1, false);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: erkoc
--

COPY schema_migrations (version) FROM stdin;
20140202100056
20140202130837
20140202152158
20140202152748
20140203135638
20140203135651
20140203135733
20140203140339
20140203142651
20140204085235
20140204213726
20140217100754
20140203073900
20140203073902
20140203073905
20140203083738
20140203083806
20140203091159
20140203095245
20140203114714
20140203120334
20140203121420
20140203121433
20140203144252
20140204074616
\.


--
-- Data for Name: students; Type: TABLE DATA; Schema: public; Owner: erkoc
--

COPY students (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: students_id_seq; Type: SEQUENCE SET; Schema: public; Owner: erkoc
--

SELECT pg_catalog.setval('students_id_seq', 1, false);


--
-- Data for Name: teachers; Type: TABLE DATA; Schema: public; Owner: erkoc
--

COPY teachers (id, name, created_at, updated_at) FROM stdin;
\.


--
-- Name: teachers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: erkoc
--

SELECT pg_catalog.setval('teachers_id_seq', 1, false);


--
-- Data for Name: user_profiles; Type: TABLE DATA; Schema: public; Owner: erkoc
--

COPY user_profiles (id, first_name, last_name, tc_no, gsm, created_at, updated_at, user_id) FROM stdin;
1	\N	\N	14944238184	\N	2014-02-21 11:46:20.538833	2014-02-21 11:46:20.538833	1
\.


--
-- Name: user_profiles_id_seq; Type: SEQUENCE SET; Schema: public; Owner: erkoc
--

SELECT pg_catalog.setval('user_profiles_id_seq', 1, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: erkoc
--

COPY users (id, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, name, created_at, updated_at, time_zone) FROM stdin;
1	aerkoc01@gmail.com	$2a$10$L1gmdyBJq8aUdg9XRVSQ3.a/AIVtvxbh0MEvv5Xg4ouNsE7Z.jDAO	\N	\N	\N	1	2014-02-21 11:46:20.547495	2014-02-21 11:46:20.547495	127.0.0.1	127.0.0.1	erkoc	2014-02-21 11:46:20.510849	2014-02-21 11:46:20.54928	\N
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: erkoc
--

SELECT pg_catalog.setval('users_id_seq', 1, true);


--
-- Name: admin_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: erkoc; Tablespace: 
--

ALTER TABLE ONLY admin_profiles
    ADD CONSTRAINT admin_profiles_pkey PRIMARY KEY (id);


--
-- Name: admins_pkey; Type: CONSTRAINT; Schema: public; Owner: erkoc; Tablespace: 
--

ALTER TABLE ONLY admins
    ADD CONSTRAINT admins_pkey PRIMARY KEY (id);


--
-- Name: books_pkey; Type: CONSTRAINT; Schema: public; Owner: erkoc; Tablespace: 
--

ALTER TABLE ONLY books
    ADD CONSTRAINT books_pkey PRIMARY KEY (id);


--
-- Name: comments_pkey; Type: CONSTRAINT; Schema: public; Owner: erkoc; Tablespace: 
--

ALTER TABLE ONLY comments
    ADD CONSTRAINT comments_pkey PRIMARY KEY (id);


--
-- Name: courses_pkey; Type: CONSTRAINT; Schema: public; Owner: erkoc; Tablespace: 
--

ALTER TABLE ONLY courses
    ADD CONSTRAINT courses_pkey PRIMARY KEY (id);


--
-- Name: ders_pkey; Type: CONSTRAINT; Schema: public; Owner: erkoc; Tablespace: 
--

ALTER TABLE ONLY ders
    ADD CONSTRAINT ders_pkey PRIMARY KEY (id);


--
-- Name: events_pkey; Type: CONSTRAINT; Schema: public; Owner: erkoc; Tablespace: 
--

ALTER TABLE ONLY events
    ADD CONSTRAINT events_pkey PRIMARY KEY (id);


--
-- Name: kitaps_pkey; Type: CONSTRAINT; Schema: public; Owner: erkoc; Tablespace: 
--

ALTER TABLE ONLY kitaps
    ADD CONSTRAINT kitaps_pkey PRIMARY KEY (id);


--
-- Name: lessons_pkey; Type: CONSTRAINT; Schema: public; Owner: erkoc; Tablespace: 
--

ALTER TABLE ONLY lessons
    ADD CONSTRAINT lessons_pkey PRIMARY KEY (id);


--
-- Name: posts_pkey; Type: CONSTRAINT; Schema: public; Owner: erkoc; Tablespace: 
--

ALTER TABLE ONLY posts
    ADD CONSTRAINT posts_pkey PRIMARY KEY (id);


--
-- Name: rates_pkey; Type: CONSTRAINT; Schema: public; Owner: erkoc; Tablespace: 
--

ALTER TABLE ONLY rates
    ADD CONSTRAINT rates_pkey PRIMARY KEY (id);


--
-- Name: requests_pkey; Type: CONSTRAINT; Schema: public; Owner: erkoc; Tablespace: 
--

ALTER TABLE ONLY requests
    ADD CONSTRAINT requests_pkey PRIMARY KEY (id);


--
-- Name: students_pkey; Type: CONSTRAINT; Schema: public; Owner: erkoc; Tablespace: 
--

ALTER TABLE ONLY students
    ADD CONSTRAINT students_pkey PRIMARY KEY (id);


--
-- Name: teachers_pkey; Type: CONSTRAINT; Schema: public; Owner: erkoc; Tablespace: 
--

ALTER TABLE ONLY teachers
    ADD CONSTRAINT teachers_pkey PRIMARY KEY (id);


--
-- Name: user_profiles_pkey; Type: CONSTRAINT; Schema: public; Owner: erkoc; Tablespace: 
--

ALTER TABLE ONLY user_profiles
    ADD CONSTRAINT user_profiles_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: erkoc; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_admins_on_email; Type: INDEX; Schema: public; Owner: erkoc; Tablespace: 
--

CREATE UNIQUE INDEX index_admins_on_email ON admins USING btree (email);


--
-- Name: index_admins_on_reset_password_token; Type: INDEX; Schema: public; Owner: erkoc; Tablespace: 
--

CREATE UNIQUE INDEX index_admins_on_reset_password_token ON admins USING btree (reset_password_token);


--
-- Name: index_comments_on_post_id; Type: INDEX; Schema: public; Owner: erkoc; Tablespace: 
--

CREATE INDEX index_comments_on_post_id ON comments USING btree (post_id);


--
-- Name: index_lessons_students_on_student_id_and_lesson_id; Type: INDEX; Schema: public; Owner: erkoc; Tablespace: 
--

CREATE UNIQUE INDEX index_lessons_students_on_student_id_and_lesson_id ON lessons_students USING btree (student_id, lesson_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: erkoc; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: erkoc; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: erkoc; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


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

\connect ems

SET default_transaction_read_only = off;

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

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: admin; Type: TABLE; Schema: public; Owner: erkoc; Tablespace: 
--

CREATE TABLE admin (
    adminname character varying(30),
    password character varying(30)
);


ALTER TABLE public.admin OWNER TO erkoc;

--
-- Data for Name: admin; Type: TABLE DATA; Schema: public; Owner: erkoc
--

COPY admin (adminname, password) FROM stdin;
admin	admin
erkoc	1234
\.


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

\connect olayvar

SET default_transaction_read_only = off;

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

\connect postgres

SET default_transaction_read_only = off;

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
-- Name: postgres; Type: COMMENT; Schema: -; Owner: erkoc
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


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

\connect template1

SET default_transaction_read_only = off;

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
-- Name: template1; Type: COMMENT; Schema: -; Owner: erkoc
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


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

--
-- PostgreSQL database cluster dump complete
--

