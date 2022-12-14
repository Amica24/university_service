--
-- PostgreSQL database cluster dump
--

SET default_transaction_read_only = off;

SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;

--
-- Drop databases (except postgres and template1)
--





--
-- Drop roles
--

DROP ROLE postgres;


--
-- Roles
--

CREATE ROLE postgres;
ALTER ROLE postgres WITH SUPERUSER INHERIT CREATEROLE CREATEDB LOGIN REPLICATION BYPASSRLS PASSWORD 'md53175bce1d3201d16594cebf9d7eb3f9d';






--
-- Databases
--

--
-- Database "template1" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.0
-- Dumped by pg_dump version 13.0

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

UPDATE pg_catalog.pg_database SET datistemplate = false WHERE datname = 'template1';
DROP DATABASE template1;
--
-- Name: template1; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE template1 WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE template1 OWNER TO postgres;

\connect template1

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
-- Name: DATABASE template1; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE template1 IS 'default template for new databases';


--
-- Name: template1; Type: DATABASE PROPERTIES; Schema: -; Owner: postgres
--

ALTER DATABASE template1 IS_TEMPLATE = true;


\connect template1

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
-- Name: DATABASE template1; Type: ACL; Schema: -; Owner: postgres
--

REVOKE CONNECT,TEMPORARY ON DATABASE template1 FROM PUBLIC;
GRANT CONNECT ON DATABASE template1 TO PUBLIC;


--
-- PostgreSQL database dump complete
--

--
-- Database "postgres" dump
--

--
-- PostgreSQL database dump
--

-- Dumped from database version 13.0
-- Dumped by pg_dump version 13.0

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

DROP DATABASE postgres;
--
-- Name: postgres; Type: DATABASE; Schema: -; Owner: postgres
--

CREATE DATABASE postgres WITH TEMPLATE = template0 ENCODING = 'UTF8' LOCALE = 'en_US.utf8';


ALTER DATABASE postgres OWNER TO postgres;

\connect postgres

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
-- Name: DATABASE postgres; Type: COMMENT; Schema: -; Owner: postgres
--

COMMENT ON DATABASE postgres IS 'default administrative connection database';


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: auth_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group (
    id integer NOT NULL,
    name character varying(150) NOT NULL
);


ALTER TABLE public.auth_group OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_id_seq OWNER TO postgres;

--
-- Name: auth_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_id_seq OWNED BY public.auth_group.id;


--
-- Name: auth_group_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_group_permissions (
    id bigint NOT NULL,
    group_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_group_permissions OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_group_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_group_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_group_permissions_id_seq OWNED BY public.auth_group_permissions.id;


--
-- Name: auth_permission; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_permission (
    id integer NOT NULL,
    name character varying(255) NOT NULL,
    content_type_id integer NOT NULL,
    codename character varying(100) NOT NULL
);


ALTER TABLE public.auth_permission OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_permission_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_permission_id_seq OWNER TO postgres;

--
-- Name: auth_permission_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_permission_id_seq OWNED BY public.auth_permission.id;


--
-- Name: auth_user; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user (
    id integer NOT NULL,
    password character varying(128) NOT NULL,
    last_login timestamp with time zone,
    is_superuser boolean NOT NULL,
    username character varying(150) NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    is_staff boolean NOT NULL,
    is_active boolean NOT NULL,
    date_joined timestamp with time zone NOT NULL
);


ALTER TABLE public.auth_user OWNER TO postgres;

--
-- Name: auth_user_groups; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_groups (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    group_id integer NOT NULL
);


ALTER TABLE public.auth_user_groups OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_groups_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_groups_id_seq OWNER TO postgres;

--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_groups_id_seq OWNED BY public.auth_user_groups.id;


--
-- Name: auth_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_id_seq OWNER TO postgres;

--
-- Name: auth_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_id_seq OWNED BY public.auth_user.id;


--
-- Name: auth_user_user_permissions; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.auth_user_user_permissions (
    id bigint NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL
);


ALTER TABLE public.auth_user_user_permissions OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.auth_user_user_permissions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.auth_user_user_permissions_id_seq OWNER TO postgres;

--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.auth_user_user_permissions_id_seq OWNED BY public.auth_user_user_permissions.id;


--
-- Name: django_admin_log; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_admin_log (
    id integer NOT NULL,
    action_time timestamp with time zone NOT NULL,
    object_id text,
    object_repr character varying(200) NOT NULL,
    action_flag smallint NOT NULL,
    change_message text NOT NULL,
    content_type_id integer,
    user_id integer NOT NULL,
    CONSTRAINT django_admin_log_action_flag_check CHECK ((action_flag >= 0))
);


ALTER TABLE public.django_admin_log OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_admin_log_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_admin_log_id_seq OWNER TO postgres;

--
-- Name: django_admin_log_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_admin_log_id_seq OWNED BY public.django_admin_log.id;


--
-- Name: django_content_type; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_content_type (
    id integer NOT NULL,
    app_label character varying(100) NOT NULL,
    model character varying(100) NOT NULL
);


ALTER TABLE public.django_content_type OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_content_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_content_type_id_seq OWNER TO postgres;

--
-- Name: django_content_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_content_type_id_seq OWNED BY public.django_content_type.id;


--
-- Name: django_migrations; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_migrations (
    id bigint NOT NULL,
    app character varying(255) NOT NULL,
    name character varying(255) NOT NULL,
    applied timestamp with time zone NOT NULL
);


ALTER TABLE public.django_migrations OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.django_migrations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.django_migrations_id_seq OWNER TO postgres;

--
-- Name: django_migrations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.django_migrations_id_seq OWNED BY public.django_migrations.id;


--
-- Name: django_session; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.django_session (
    session_key character varying(40) NOT NULL,
    session_data text NOT NULL,
    expire_date timestamp with time zone NOT NULL
);


ALTER TABLE public.django_session OWNER TO postgres;

--
-- Name: reports_academicdiscipline; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reports_academicdiscipline (
    id bigint NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.reports_academicdiscipline OWNER TO postgres;

--
-- Name: reports_academicdiscipline_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reports_academicdiscipline_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reports_academicdiscipline_id_seq OWNER TO postgres;

--
-- Name: reports_academicdiscipline_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reports_academicdiscipline_id_seq OWNED BY public.reports_academicdiscipline.id;


--
-- Name: reports_fielddiscipline; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reports_fielddiscipline (
    id bigint NOT NULL,
    academic_discipline_id bigint NOT NULL,
    field_of_study_id bigint NOT NULL
);


ALTER TABLE public.reports_fielddiscipline OWNER TO postgres;

--
-- Name: reports_fielddiscipline_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reports_fielddiscipline_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reports_fielddiscipline_id_seq OWNER TO postgres;

--
-- Name: reports_fielddiscipline_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reports_fielddiscipline_id_seq OWNED BY public.reports_fielddiscipline.id;


--
-- Name: reports_fieldofstudy; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reports_fieldofstudy (
    id bigint NOT NULL,
    name text NOT NULL,
    handler_id integer NOT NULL
);


ALTER TABLE public.reports_fieldofstudy OWNER TO postgres;

--
-- Name: reports_fieldofstudy_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reports_fieldofstudy_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reports_fieldofstudy_id_seq OWNER TO postgres;

--
-- Name: reports_fieldofstudy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reports_fieldofstudy_id_seq OWNED BY public.reports_fieldofstudy.id;


--
-- Name: reports_group; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reports_group (
    id bigint NOT NULL,
    number text NOT NULL
);


ALTER TABLE public.reports_group OWNER TO postgres;

--
-- Name: reports_group_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reports_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reports_group_id_seq OWNER TO postgres;

--
-- Name: reports_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reports_group_id_seq OWNED BY public.reports_group.id;


--
-- Name: reports_student; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.reports_student (
    id bigint NOT NULL,
    first_name character varying(150) NOT NULL,
    last_name character varying(150) NOT NULL,
    email character varying(254) NOT NULL,
    sex character varying(10) NOT NULL,
    field_of_study_id bigint NOT NULL,
    group_id bigint NOT NULL
);


ALTER TABLE public.reports_student OWNER TO postgres;

--
-- Name: reports_student_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.reports_student_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.reports_student_id_seq OWNER TO postgres;

--
-- Name: reports_student_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.reports_student_id_seq OWNED BY public.reports_student.id;


--
-- Name: auth_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group ALTER COLUMN id SET DEFAULT nextval('public.auth_group_id_seq'::regclass);


--
-- Name: auth_group_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_group_permissions_id_seq'::regclass);


--
-- Name: auth_permission id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission ALTER COLUMN id SET DEFAULT nextval('public.auth_permission_id_seq'::regclass);


--
-- Name: auth_user id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user ALTER COLUMN id SET DEFAULT nextval('public.auth_user_id_seq'::regclass);


--
-- Name: auth_user_groups id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups ALTER COLUMN id SET DEFAULT nextval('public.auth_user_groups_id_seq'::regclass);


--
-- Name: auth_user_user_permissions id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions ALTER COLUMN id SET DEFAULT nextval('public.auth_user_user_permissions_id_seq'::regclass);


--
-- Name: django_admin_log id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log ALTER COLUMN id SET DEFAULT nextval('public.django_admin_log_id_seq'::regclass);


--
-- Name: django_content_type id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type ALTER COLUMN id SET DEFAULT nextval('public.django_content_type_id_seq'::regclass);


--
-- Name: django_migrations id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations ALTER COLUMN id SET DEFAULT nextval('public.django_migrations_id_seq'::regclass);


--
-- Name: reports_academicdiscipline id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports_academicdiscipline ALTER COLUMN id SET DEFAULT nextval('public.reports_academicdiscipline_id_seq'::regclass);


--
-- Name: reports_fielddiscipline id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports_fielddiscipline ALTER COLUMN id SET DEFAULT nextval('public.reports_fielddiscipline_id_seq'::regclass);


--
-- Name: reports_fieldofstudy id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports_fieldofstudy ALTER COLUMN id SET DEFAULT nextval('public.reports_fieldofstudy_id_seq'::regclass);


--
-- Name: reports_group id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports_group ALTER COLUMN id SET DEFAULT nextval('public.reports_group_id_seq'::regclass);


--
-- Name: reports_student id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports_student ALTER COLUMN id SET DEFAULT nextval('public.reports_student_id_seq'::regclass);


--
-- Data for Name: auth_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group (id, name) FROM stdin;
\.


--
-- Data for Name: auth_group_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_group_permissions (id, group_id, permission_id) FROM stdin;
\.


--
-- Data for Name: auth_permission; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_permission (id, name, content_type_id, codename) FROM stdin;
1	Can add log entry	1	add_logentry
2	Can change log entry	1	change_logentry
3	Can delete log entry	1	delete_logentry
4	Can view log entry	1	view_logentry
5	Can add permission	2	add_permission
6	Can change permission	2	change_permission
7	Can delete permission	2	delete_permission
8	Can view permission	2	view_permission
9	Can add group	3	add_group
10	Can change group	3	change_group
11	Can delete group	3	delete_group
12	Can view group	3	view_group
13	Can add user	4	add_user
14	Can change user	4	change_user
15	Can delete user	4	delete_user
16	Can view user	4	view_user
17	Can add content type	5	add_contenttype
18	Can change content type	5	change_contenttype
19	Can delete content type	5	delete_contenttype
20	Can view content type	5	view_contenttype
21	Can add session	6	add_session
22	Can change session	6	change_session
23	Can delete session	6	delete_session
24	Can view session	6	view_session
25	Can add academic discipline	7	add_academicdiscipline
26	Can change academic discipline	7	change_academicdiscipline
27	Can delete academic discipline	7	delete_academicdiscipline
28	Can view academic discipline	7	view_academicdiscipline
29	Can add ???????????????????? ?????????????????????? ????????????????????	8	add_fielddiscipline
30	Can change ???????????????????? ?????????????????????? ????????????????????	8	change_fielddiscipline
31	Can delete ???????????????????? ?????????????????????? ????????????????????	8	delete_fielddiscipline
32	Can view ???????????????????? ?????????????????????? ????????????????????	8	view_fielddiscipline
33	Can add field of study	9	add_fieldofstudy
34	Can change field of study	9	change_fieldofstudy
35	Can delete field of study	9	delete_fieldofstudy
36	Can view field of study	9	view_fieldofstudy
37	Can add group	10	add_group
38	Can change group	10	change_group
39	Can delete group	10	delete_group
40	Can view group	10	view_group
41	Can add student	11	add_student
42	Can change student	11	change_student
43	Can delete student	11	delete_student
44	Can view student	11	view_student
\.


--
-- Data for Name: auth_user; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user (id, password, last_login, is_superuser, username, first_name, last_name, email, is_staff, is_active, date_joined) FROM stdin;
1	pbkdf2_sha256$260000$30uCjYNxcvUWoLcl6uhPR0$qWDgiJowugoLYuAGhLRBII9O8ewa1mlx6IOh9ctFBE8=	2022-11-10 19:08:40.845952+00	t	admin			admin@ya.ru	t	t	2022-11-10 19:08:27.445353+00
9	pbkdf2_sha256$260000$cRW6jZDrwIysjfw0Z4Tgrz$NC0m3G3p8XWNYBvmpiFsF9vBK87c+qOG/2ZS3nrl+0o=	\N	f	physics_handler	??????????	????????????	isaac@gmail.com	f	t	2022-11-11 15:22:45+00
10	pbkdf2_sha256$260000$SuHI9haJLDT5Ib2vy2E1Uq$9JRELafAOSM+/kpgHNnaM3qT0OV/yrcViU2FY3UoxB0=	\N	f	chemistry_handler	????????????	????????????????	antione@gmail.fr	f	t	2022-11-11 15:29:53+00
11	pbkdf2_sha256$260000$1EIOxxIAv0IToPdiqJ4wuD$7iaB3jBZvDpGjeB4ABEWblGFM6ZcYIUUrjsDbJo4nVM=	\N	f	writers_handler	????????????????	??????????????	vladimir@yandex.ru	f	t	2022-11-11 15:35:48+00
\.


--
-- Data for Name: auth_user_groups; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_groups (id, user_id, group_id) FROM stdin;
\.


--
-- Data for Name: auth_user_user_permissions; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.auth_user_user_permissions (id, user_id, permission_id) FROM stdin;
\.


--
-- Data for Name: django_admin_log; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_admin_log (id, action_time, object_id, object_repr, action_flag, change_message, content_type_id, user_id) FROM stdin;
1	2022-11-11 15:08:26.047898+00	2	Einstein	1	[{"added": {}}]	4	1
2	2022-11-11 15:09:20.997334+00	2	Einstein	2	[{"changed": {"fields": ["First name", "Last name", "Email address"]}}]	4	1
3	2022-11-11 15:09:48.334429+00	3	maxwell	1	[{"added": {}}]	4	1
4	2022-11-11 15:10:16.779304+00	3	maxwell	2	[{"changed": {"fields": ["First name", "Last name", "Email address"]}}]	4	1
5	2022-11-11 15:10:46.445371+00	4	tesla	1	[{"added": {}}]	4	1
6	2022-11-11 15:11:16.641643+00	4	tesla	2	[{"changed": {"fields": ["First name", "Last name", "Email address"]}}]	4	1
7	2022-11-11 15:11:50.304898+00	5	paster	1	[{"added": {}}]	4	1
8	2022-11-11 15:12:13.450516+00	5	paster	2	[{"changed": {"fields": ["First name", "Last name", "Email address"]}}]	4	1
9	2022-11-11 15:12:41.276289+00	6	darvin	1	[{"added": {}}]	4	1
10	2022-11-11 15:13:02.01271+00	6	darvin	2	[{"changed": {"fields": ["First name", "Last name", "Email address"]}}]	4	1
11	2022-11-11 15:13:36.074799+00	7	curie	1	[{"added": {}}]	4	1
12	2022-11-11 15:14:00.263118+00	7	curie	2	[{"changed": {"fields": ["First name", "Last name", "Email address"]}}]	4	1
13	2022-11-11 15:15:10.834743+00	8	lermontov	1	[{"added": {}}]	4	1
14	2022-11-11 15:15:52.259239+00	8	lermontov	2	[{"changed": {"fields": ["First name", "Last name", "Email address"]}}]	4	1
15	2022-11-11 15:16:22.669748+00	1	X-450005	1	[{"added": {}}]	10	1
16	2022-11-11 15:16:48.184901+00	2	??-470008	1	[{"added": {}}]	10	1
17	2022-11-11 15:17:05.829723+00	3	??-450006	1	[{"added": {}}]	10	1
18	2022-11-11 15:17:28.22559+00	7	??????????????????	1	[{"added": {}}]	7	1
19	2022-11-11 15:18:43.484012+00	8	????????????????	1	[{"added": {}}]	7	1
20	2022-11-11 15:22:45.580862+00	9	physics_handler	1	[{"added": {}}]	4	1
21	2022-11-11 15:24:05.132808+00	9	physics_handler	2	[{"changed": {"fields": ["First name", "Last name", "Email address"]}}]	4	1
22	2022-11-11 15:25:04.634794+00	1	?????????????????????????????? ?? ???????????????????? ????????????	1	[{"added": {}}, {"added": {"name": "\\u0414\\u0438\\u0441\\u0446\\u0438\\u043f\\u043b\\u0438\\u043d\\u0430 \\u043d\\u0430\\u043f\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f \\u043f\\u043e\\u0434\\u0433\\u043e\\u0442\\u043e\\u0432\\u043a\\u0438", "object": "\\u0424\\u0443\\u043d\\u0434\\u0430\\u043c\\u0435\\u043d\\u0442\\u0430\\u043b\\u044c\\u043d\\u0430\\u044f \\u0438 \\u043f\\u0440\\u0438\\u043a\\u043b\\u0430\\u0434\\u043d\\u0430\\u044f \\u0444\\u0438\\u0437\\u0438\\u043a\\u0430 \\u0424\\u0438\\u0437\\u0438\\u043a\\u0430"}}, {"added": {"name": "\\u0414\\u0438\\u0441\\u0446\\u0438\\u043f\\u043b\\u0438\\u043d\\u0430 \\u043d\\u0430\\u043f\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f \\u043f\\u043e\\u0434\\u0433\\u043e\\u0442\\u043e\\u0432\\u043a\\u0438", "object": "\\u0424\\u0443\\u043d\\u0434\\u0430\\u043c\\u0435\\u043d\\u0442\\u0430\\u043b\\u044c\\u043d\\u0430\\u044f \\u0438 \\u043f\\u0440\\u0438\\u043a\\u043b\\u0430\\u0434\\u043d\\u0430\\u044f \\u0444\\u0438\\u0437\\u0438\\u043a\\u0430 \\u041c\\u0430\\u0442\\u0435\\u043c\\u0430\\u0442\\u0438\\u043a\\u0430"}}, {"added": {"name": "\\u0414\\u0438\\u0441\\u0446\\u0438\\u043f\\u043b\\u0438\\u043d\\u0430 \\u043d\\u0430\\u043f\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f \\u043f\\u043e\\u0434\\u0433\\u043e\\u0442\\u043e\\u0432\\u043a\\u0438", "object": "\\u0424\\u0443\\u043d\\u0434\\u0430\\u043c\\u0435\\u043d\\u0442\\u0430\\u043b\\u044c\\u043d\\u0430\\u044f \\u0438 \\u043f\\u0440\\u0438\\u043a\\u043b\\u0430\\u0434\\u043d\\u0430\\u044f \\u0444\\u0438\\u0437\\u0438\\u043a\\u0430 \\u041c\\u0435\\u0445\\u0430\\u043d\\u0438\\u043a\\u0430"}}]	9	1
23	2022-11-11 15:29:53.744883+00	10	biochemistry_handler	1	[{"added": {}}]	4	1
24	2022-11-11 15:32:36.689729+00	10	chemistry_handler	2	[{"changed": {"fields": ["Username", "First name", "Last name", "Email address"]}}]	4	1
25	2022-11-11 15:33:05.966692+00	2	?????????????????????????????? ?? ???????????????????? ??????????	1	[{"added": {}}, {"added": {"name": "\\u0414\\u0438\\u0441\\u0446\\u0438\\u043f\\u043b\\u0438\\u043d\\u0430 \\u043d\\u0430\\u043f\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f \\u043f\\u043e\\u0434\\u0433\\u043e\\u0442\\u043e\\u0432\\u043a\\u0438", "object": "\\u0424\\u0443\\u043d\\u0434\\u0430\\u043c\\u0435\\u043d\\u0442\\u0430\\u043b\\u044c\\u043d\\u0430\\u044f \\u0438 \\u043f\\u0440\\u0438\\u043a\\u043b\\u0430\\u0434\\u043d\\u0430\\u044f \\u0445\\u0438\\u043c\\u0438\\u044f \\u0411\\u0438\\u043e\\u043b\\u043e\\u0433\\u0438\\u044f"}}, {"added": {"name": "\\u0414\\u0438\\u0441\\u0446\\u0438\\u043f\\u043b\\u0438\\u043d\\u0430 \\u043d\\u0430\\u043f\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f \\u043f\\u043e\\u0434\\u0433\\u043e\\u0442\\u043e\\u0432\\u043a\\u0438", "object": "\\u0424\\u0443\\u043d\\u0434\\u0430\\u043c\\u0435\\u043d\\u0442\\u0430\\u043b\\u044c\\u043d\\u0430\\u044f \\u0438 \\u043f\\u0440\\u0438\\u043a\\u043b\\u0430\\u0434\\u043d\\u0430\\u044f \\u0445\\u0438\\u043c\\u0438\\u044f \\u0425\\u0438\\u043c\\u0438\\u044f"}}, {"added": {"name": "\\u0414\\u0438\\u0441\\u0446\\u0438\\u043f\\u043b\\u0438\\u043d\\u0430 \\u043d\\u0430\\u043f\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f \\u043f\\u043e\\u0434\\u0433\\u043e\\u0442\\u043e\\u0432\\u043a\\u0438", "object": "\\u0424\\u0443\\u043d\\u0434\\u0430\\u043c\\u0435\\u043d\\u0442\\u0430\\u043b\\u044c\\u043d\\u0430\\u044f \\u0438 \\u043f\\u0440\\u0438\\u043a\\u043b\\u0430\\u0434\\u043d\\u0430\\u044f \\u0445\\u0438\\u043c\\u0438\\u044f \\u0424\\u0438\\u0437\\u0438\\u043a\\u0430"}}]	9	1
26	2022-11-11 15:35:48.82143+00	11	writers_handler	1	[{"added": {}}]	4	1
27	2022-11-11 15:36:19.979805+00	11	writers_handler	2	[{"changed": {"fields": ["First name", "Last name", "Email address"]}}]	4	1
28	2022-11-11 15:37:28.612122+00	3	????????????????????	1	[{"added": {}}, {"added": {"name": "\\u0414\\u0438\\u0441\\u0446\\u0438\\u043f\\u043b\\u0438\\u043d\\u0430 \\u043d\\u0430\\u043f\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f \\u043f\\u043e\\u0434\\u0433\\u043e\\u0442\\u043e\\u0432\\u043a\\u0438", "object": "\\u0424\\u0438\\u043e\\u043b\\u043e\\u043b\\u043e\\u0433\\u0438\\u044f \\u0420\\u0443\\u0441\\u0441\\u043a\\u0438\\u0439 \\u044f\\u0437\\u044b\\u043a"}}, {"added": {"name": "\\u0414\\u0438\\u0441\\u0446\\u0438\\u043f\\u043b\\u0438\\u043d\\u0430 \\u043d\\u0430\\u043f\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f \\u043f\\u043e\\u0434\\u0433\\u043e\\u0442\\u043e\\u0432\\u043a\\u0438", "object": "\\u0424\\u0438\\u043e\\u043b\\u043e\\u043b\\u043e\\u0433\\u0438\\u044f \\u041b\\u0438\\u0442\\u0435\\u0440\\u0430\\u0442\\u0443\\u0440\\u0430"}}, {"added": {"name": "\\u0414\\u0438\\u0441\\u0446\\u0438\\u043f\\u043b\\u0438\\u043d\\u0430 \\u043d\\u0430\\u043f\\u0440\\u0430\\u0432\\u043b\\u0435\\u043d\\u0438\\u044f \\u043f\\u043e\\u0434\\u0433\\u043e\\u0442\\u043e\\u0432\\u043a\\u0438", "object": "\\u0424\\u0438\\u043e\\u043b\\u043e\\u043b\\u043e\\u0433\\u0438\\u044f \\u0424\\u0438\\u043b\\u043e\\u0441\\u043e\\u0444\\u0438\\u044f"}}]	9	1
29	2022-11-11 15:38:05.939803+00	9	????????????????????	3		7	1
30	2022-11-11 15:42:40.631964+00	1	???????????? ??????????	1	[{"added": {}}]	11	1
31	2022-11-11 15:43:14.250076+00	2	???????????? ????????????????	1	[{"added": {}}]	11	1
32	2022-11-11 15:43:48.124353+00	3	?????????????? ??????????????	1	[{"added": {}}]	11	1
33	2022-11-11 15:44:22.056156+00	4	?????? ????????????	1	[{"added": {}}]	11	1
34	2022-11-11 15:44:57.492227+00	5	?????????? ????????	1	[{"added": {}}]	11	1
35	2022-11-11 15:46:11.43202+00	6	???????????????? ??????????????????	1	[{"added": {}}]	11	1
36	2022-11-11 15:46:58.78023+00	7	???????????? ??????????????????	1	[{"added": {}}]	11	1
37	2022-11-11 15:48:04.194676+00	8	?????????????????? ??????????????????	1	[{"added": {}}]	11	1
38	2022-11-11 15:48:44.138105+00	9	?????????? ??????????	1	[{"added": {}}]	11	1
39	2022-11-11 15:49:00.72686+00	2	Einstein	3		4	1
40	2022-11-11 15:49:00.734964+00	7	curie	3		4	1
41	2022-11-11 15:49:00.736951+00	6	darvin	3		4	1
42	2022-11-11 15:49:00.738851+00	8	lermontov	3		4	1
43	2022-11-11 15:49:00.740556+00	3	maxwell	3		4	1
44	2022-11-11 15:49:00.742226+00	5	paster	3		4	1
45	2022-11-11 15:49:00.744785+00	4	tesla	3		4	1
\.


--
-- Data for Name: django_content_type; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_content_type (id, app_label, model) FROM stdin;
1	admin	logentry
2	auth	permission
3	auth	group
4	auth	user
5	contenttypes	contenttype
6	sessions	session
7	reports	academicdiscipline
8	reports	fielddiscipline
9	reports	fieldofstudy
10	reports	group
11	reports	student
\.


--
-- Data for Name: django_migrations; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_migrations (id, app, name, applied) FROM stdin;
1	contenttypes	0001_initial	2022-11-10 19:06:01.737335+00
2	auth	0001_initial	2022-11-10 19:06:01.85032+00
3	admin	0001_initial	2022-11-10 19:06:01.887935+00
4	admin	0002_logentry_remove_auto_add	2022-11-10 19:06:01.897509+00
5	admin	0003_logentry_add_action_flag_choices	2022-11-10 19:06:01.909988+00
6	contenttypes	0002_remove_content_type_name	2022-11-10 19:06:01.939929+00
7	auth	0002_alter_permission_name_max_length	2022-11-10 19:06:01.957987+00
8	auth	0003_alter_user_email_max_length	2022-11-10 19:06:01.969906+00
9	auth	0004_alter_user_username_opts	2022-11-10 19:06:01.982959+00
10	auth	0005_alter_user_last_login_null	2022-11-10 19:06:02.004475+00
11	auth	0006_require_contenttypes_0002	2022-11-10 19:06:02.00779+00
12	auth	0007_alter_validators_add_error_messages	2022-11-10 19:06:02.06022+00
13	auth	0008_alter_user_username_max_length	2022-11-10 19:06:02.077617+00
14	auth	0009_alter_user_last_name_max_length	2022-11-10 19:06:02.089692+00
15	auth	0010_alter_group_name_max_length	2022-11-10 19:06:02.106089+00
16	auth	0011_update_proxy_permissions	2022-11-10 19:06:02.121875+00
17	auth	0012_alter_user_first_name_max_length	2022-11-10 19:06:02.140268+00
18	reports	0001_initial	2022-11-10 19:06:02.262351+00
19	sessions	0001_initial	2022-11-10 19:06:02.277321+00
\.


--
-- Data for Name: django_session; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.django_session (session_key, session_data, expire_date) FROM stdin;
y3maqx6iyibxqwomocjqwvwmw2xe7zw6	.eJxVjDsOwjAQBe_iGln-LPaGkp4zRGvvggPIluKkQtwdIqWA9s3Me6mR1qWMa5d5nFidlFWH3y1RfkjdAN-p3prOrS7zlPSm6J12fWksz_Pu_h0U6uVbDy5KFDDmmBIixuSdsyBoiClyAqQwOIuQbUZzNc6DBxSDQMF7CazeH8GJNt8:1otCum:2Bpl-eZ6QkY-Hk907Hj0qgzB03IIhV4j8hJbTP8vnO0	2022-11-24 19:08:40.848742+00
\.


--
-- Data for Name: reports_academicdiscipline; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reports_academicdiscipline (id, name) FROM stdin;
1	????????????????
2	????????????
3	??????????
4	????????????????????
5	?????????????? ????????
6	????????????????????
7	??????????????????
8	????????????????
\.


--
-- Data for Name: reports_fielddiscipline; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reports_fielddiscipline (id, academic_discipline_id, field_of_study_id) FROM stdin;
1	2	1
2	4	1
3	8	1
4	1	2
5	3	2
6	2	2
7	5	3
8	6	3
9	7	3
\.


--
-- Data for Name: reports_fieldofstudy; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reports_fieldofstudy (id, name, handler_id) FROM stdin;
1	?????????????????????????????? ?? ???????????????????? ????????????	9
2	?????????????????????????????? ?? ???????????????????? ??????????	10
3	????????????????????	11
\.


--
-- Data for Name: reports_group; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reports_group (id, number) FROM stdin;
1	X-450005
2	??-470008
3	??-450006
\.


--
-- Data for Name: reports_student; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.reports_student (id, first_name, last_name, email, sex, field_of_study_id, group_id) FROM stdin;
1	????????????	??????????	tesla@gmail.com	??	1	2
2	????????????	????????????????	maxwell@gmail.com	??	1	2
3	??????????????	??????????????	einstain@gmail.de	??	1	2
4	??????	????????????	paster@gmail.com	??	2	1
5	??????????	????????	curie@gmail.com	??	2	1
6	????????????????	??????????????????	mendeleev@yandex.ru	??	2	1
7	????????????	??????????????????	lermontov@yandex.ru	??	3	3
8	??????????????????	??????????????????	griboedov@yandex.ru	??	3	3
9	??????????	??????????	chechov@yandex.ru	??	3	3
\.


--
-- Name: auth_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_id_seq', 1, false);


--
-- Name: auth_group_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_group_permissions_id_seq', 1, false);


--
-- Name: auth_permission_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_permission_id_seq', 44, true);


--
-- Name: auth_user_groups_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_groups_id_seq', 1, false);


--
-- Name: auth_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_id_seq', 11, true);


--
-- Name: auth_user_user_permissions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.auth_user_user_permissions_id_seq', 1, false);


--
-- Name: django_admin_log_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_admin_log_id_seq', 45, true);


--
-- Name: django_content_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_content_type_id_seq', 11, true);


--
-- Name: django_migrations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.django_migrations_id_seq', 19, true);


--
-- Name: reports_academicdiscipline_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reports_academicdiscipline_id_seq', 9, true);


--
-- Name: reports_fielddiscipline_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reports_fielddiscipline_id_seq', 9, true);


--
-- Name: reports_fieldofstudy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reports_fieldofstudy_id_seq', 3, true);


--
-- Name: reports_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reports_group_id_seq', 3, true);


--
-- Name: reports_student_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.reports_student_id_seq', 9, true);


--
-- Name: auth_group auth_group_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_name_key UNIQUE (name);


--
-- Name: auth_group_permissions auth_group_permissions_group_id_permission_id_0cd325b0_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_permission_id_0cd325b0_uniq UNIQUE (group_id, permission_id);


--
-- Name: auth_group_permissions auth_group_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_group auth_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group
    ADD CONSTRAINT auth_group_pkey PRIMARY KEY (id);


--
-- Name: auth_permission auth_permission_content_type_id_codename_01ab375a_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_codename_01ab375a_uniq UNIQUE (content_type_id, codename);


--
-- Name: auth_permission auth_permission_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_pkey PRIMARY KEY (id);


--
-- Name: auth_user_groups auth_user_groups_user_id_group_id_94350c0c_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_group_id_94350c0c_uniq UNIQUE (user_id, group_id);


--
-- Name: auth_user auth_user_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_pkey PRIMARY KEY (id);


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_permission_id_14a6b632_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_permission_id_14a6b632_uniq UNIQUE (user_id, permission_id);


--
-- Name: auth_user auth_user_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user
    ADD CONSTRAINT auth_user_username_key UNIQUE (username);


--
-- Name: django_admin_log django_admin_log_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_pkey PRIMARY KEY (id);


--
-- Name: django_content_type django_content_type_app_label_model_76bd3d3b_uniq; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_app_label_model_76bd3d3b_uniq UNIQUE (app_label, model);


--
-- Name: django_content_type django_content_type_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_content_type
    ADD CONSTRAINT django_content_type_pkey PRIMARY KEY (id);


--
-- Name: django_migrations django_migrations_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_migrations
    ADD CONSTRAINT django_migrations_pkey PRIMARY KEY (id);


--
-- Name: django_session django_session_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_session
    ADD CONSTRAINT django_session_pkey PRIMARY KEY (session_key);


--
-- Name: reports_academicdiscipline reports_academicdiscipline_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports_academicdiscipline
    ADD CONSTRAINT reports_academicdiscipline_pkey PRIMARY KEY (id);


--
-- Name: reports_fielddiscipline reports_fielddiscipline_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports_fielddiscipline
    ADD CONSTRAINT reports_fielddiscipline_pkey PRIMARY KEY (id);


--
-- Name: reports_fieldofstudy reports_fieldofstudy_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports_fieldofstudy
    ADD CONSTRAINT reports_fieldofstudy_pkey PRIMARY KEY (id);


--
-- Name: reports_group reports_group_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports_group
    ADD CONSTRAINT reports_group_pkey PRIMARY KEY (id);


--
-- Name: reports_student reports_student_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports_student
    ADD CONSTRAINT reports_student_email_key UNIQUE (email);


--
-- Name: reports_student reports_student_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports_student
    ADD CONSTRAINT reports_student_pkey PRIMARY KEY (id);


--
-- Name: reports_fielddiscipline unique_student_discipline; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports_fielddiscipline
    ADD CONSTRAINT unique_student_discipline UNIQUE (field_of_study_id, academic_discipline_id);


--
-- Name: auth_group_name_a6ea08ec_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_name_a6ea08ec_like ON public.auth_group USING btree (name varchar_pattern_ops);


--
-- Name: auth_group_permissions_group_id_b120cbf9; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_group_id_b120cbf9 ON public.auth_group_permissions USING btree (group_id);


--
-- Name: auth_group_permissions_permission_id_84c5c92e; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_group_permissions_permission_id_84c5c92e ON public.auth_group_permissions USING btree (permission_id);


--
-- Name: auth_permission_content_type_id_2f476e4b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_permission_content_type_id_2f476e4b ON public.auth_permission USING btree (content_type_id);


--
-- Name: auth_user_groups_group_id_97559544; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_group_id_97559544 ON public.auth_user_groups USING btree (group_id);


--
-- Name: auth_user_groups_user_id_6a12ed8b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_groups_user_id_6a12ed8b ON public.auth_user_groups USING btree (user_id);


--
-- Name: auth_user_user_permissions_permission_id_1fbb5f2c; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_permission_id_1fbb5f2c ON public.auth_user_user_permissions USING btree (permission_id);


--
-- Name: auth_user_user_permissions_user_id_a95ead1b; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_user_permissions_user_id_a95ead1b ON public.auth_user_user_permissions USING btree (user_id);


--
-- Name: auth_user_username_6821ab7c_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX auth_user_username_6821ab7c_like ON public.auth_user USING btree (username varchar_pattern_ops);


--
-- Name: django_admin_log_content_type_id_c4bce8eb; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_content_type_id_c4bce8eb ON public.django_admin_log USING btree (content_type_id);


--
-- Name: django_admin_log_user_id_c564eba6; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_admin_log_user_id_c564eba6 ON public.django_admin_log USING btree (user_id);


--
-- Name: django_session_expire_date_a5c62663; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_expire_date_a5c62663 ON public.django_session USING btree (expire_date);


--
-- Name: django_session_session_key_c0390e0f_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX django_session_session_key_c0390e0f_like ON public.django_session USING btree (session_key varchar_pattern_ops);


--
-- Name: reports_fielddiscipline_academic_discipline_id_12cdbbfe; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reports_fielddiscipline_academic_discipline_id_12cdbbfe ON public.reports_fielddiscipline USING btree (academic_discipline_id);


--
-- Name: reports_fielddiscipline_field_of_study_id_b1540a9f; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reports_fielddiscipline_field_of_study_id_b1540a9f ON public.reports_fielddiscipline USING btree (field_of_study_id);


--
-- Name: reports_fieldofstudy_handler_id_b84229bf; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reports_fieldofstudy_handler_id_b84229bf ON public.reports_fieldofstudy USING btree (handler_id);


--
-- Name: reports_student_email_58160092_like; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reports_student_email_58160092_like ON public.reports_student USING btree (email varchar_pattern_ops);


--
-- Name: reports_student_field_of_study_id_0133abdd; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reports_student_field_of_study_id_0133abdd ON public.reports_student USING btree (field_of_study_id);


--
-- Name: reports_student_group_id_559c17a7; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX reports_student_group_id_559c17a7 ON public.reports_student USING btree (group_id);


--
-- Name: auth_group_permissions auth_group_permissio_permission_id_84c5c92e_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissio_permission_id_84c5c92e_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_group_permissions auth_group_permissions_group_id_b120cbf9_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_group_permissions
    ADD CONSTRAINT auth_group_permissions_group_id_b120cbf9_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_permission auth_permission_content_type_id_2f476e4b_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_permission
    ADD CONSTRAINT auth_permission_content_type_id_2f476e4b_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_group_id_97559544_fk_auth_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_group_id_97559544_fk_auth_group_id FOREIGN KEY (group_id) REFERENCES public.auth_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_groups auth_user_groups_user_id_6a12ed8b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_groups
    ADD CONSTRAINT auth_user_groups_user_id_6a12ed8b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permi_permission_id_1fbb5f2c_fk_auth_perm FOREIGN KEY (permission_id) REFERENCES public.auth_permission(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: auth_user_user_permissions auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.auth_user_user_permissions
    ADD CONSTRAINT auth_user_user_permissions_user_id_a95ead1b_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_content_type_id_c4bce8eb_fk_django_co; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_content_type_id_c4bce8eb_fk_django_co FOREIGN KEY (content_type_id) REFERENCES public.django_content_type(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: django_admin_log django_admin_log_user_id_c564eba6_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.django_admin_log
    ADD CONSTRAINT django_admin_log_user_id_c564eba6_fk_auth_user_id FOREIGN KEY (user_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reports_fielddiscipline reports_fielddiscipl_academic_discipline__12cdbbfe_fk_reports_a; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports_fielddiscipline
    ADD CONSTRAINT reports_fielddiscipl_academic_discipline__12cdbbfe_fk_reports_a FOREIGN KEY (academic_discipline_id) REFERENCES public.reports_academicdiscipline(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reports_fielddiscipline reports_fielddiscipl_field_of_study_id_b1540a9f_fk_reports_f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports_fielddiscipline
    ADD CONSTRAINT reports_fielddiscipl_field_of_study_id_b1540a9f_fk_reports_f FOREIGN KEY (field_of_study_id) REFERENCES public.reports_fieldofstudy(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reports_fieldofstudy reports_fieldofstudy_handler_id_b84229bf_fk_auth_user_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports_fieldofstudy
    ADD CONSTRAINT reports_fieldofstudy_handler_id_b84229bf_fk_auth_user_id FOREIGN KEY (handler_id) REFERENCES public.auth_user(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reports_student reports_student_field_of_study_id_0133abdd_fk_reports_f; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports_student
    ADD CONSTRAINT reports_student_field_of_study_id_0133abdd_fk_reports_f FOREIGN KEY (field_of_study_id) REFERENCES public.reports_fieldofstudy(id) DEFERRABLE INITIALLY DEFERRED;


--
-- Name: reports_student reports_student_group_id_559c17a7_fk_reports_group_id; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.reports_student
    ADD CONSTRAINT reports_student_group_id_559c17a7_fk_reports_group_id FOREIGN KEY (group_id) REFERENCES public.reports_group(id) DEFERRABLE INITIALLY DEFERRED;


--
-- PostgreSQL database dump complete
--

--
-- PostgreSQL database cluster dump complete
--

