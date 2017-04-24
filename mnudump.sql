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
-- Name: countries; Type: TABLE; Schema: public; Owner: dev; Tablespace: 
--

CREATE TABLE countries (
    id integer NOT NULL,
    name character varying NOT NULL,
    flag_image character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    regional_group integer
);


ALTER TABLE countries OWNER TO dev;

--
-- Name: countries_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE countries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE countries_id_seq OWNER TO dev;

--
-- Name: countries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE countries_id_seq OWNED BY countries.id;


--
-- Name: dashboards; Type: TABLE; Schema: public; Owner: dev; Tablespace: 
--

CREATE TABLE dashboards (
    id integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE dashboards OWNER TO dev;

--
-- Name: dashboards_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE dashboards_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE dashboards_id_seq OWNER TO dev;

--
-- Name: dashboards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE dashboards_id_seq OWNED BY dashboards.id;


--
-- Name: delegations; Type: TABLE; Schema: public; Owner: dev; Tablespace: 
--

CREATE TABLE delegations (
    id integer NOT NULL,
    year integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    country_id integer
);


ALTER TABLE delegations OWNER TO dev;

--
-- Name: delegations_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE delegations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE delegations_id_seq OWNER TO dev;

--
-- Name: delegations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE delegations_id_seq OWNED BY delegations.id;


--
-- Name: ex_partakers; Type: TABLE; Schema: public; Owner: dev; Tablespace: 
--

CREATE TABLE ex_partakers (
    id integer NOT NULL,
    partaker_type integer NOT NULL,
    first_name character varying NOT NULL,
    last_name character varying NOT NULL,
    email character varying,
    phone_number character varying,
    school_name character varying NOT NULL,
    city_name character varying DEFAULT 'Bragado'::character varying NOT NULL,
    country_name character varying,
    year integer NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    role character varying,
    dni character varying
);


ALTER TABLE ex_partakers OWNER TO dev;

--
-- Name: ex_partakers_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE ex_partakers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE ex_partakers_id_seq OWNER TO dev;

--
-- Name: ex_partakers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE ex_partakers_id_seq OWNED BY ex_partakers.id;


--
-- Name: inscriptions; Type: TABLE; Schema: public; Owner: dev; Tablespace: 
--

CREATE TABLE inscriptions (
    id integer NOT NULL,
    name character varying,
    phone_number character varying,
    fax_number character varying,
    email character varying,
    location_id integer,
    people_id integer,
    medical_data_id integer,
    professor_id integer,
    school_id integer,
    rol integer,
    partaker_type integer,
    participated boolean DEFAULT false,
    type character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE inscriptions OWNER TO dev;

--
-- Name: inscriptions_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE inscriptions_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE inscriptions_id_seq OWNER TO dev;

--
-- Name: inscriptions_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE inscriptions_id_seq OWNED BY inscriptions.id;


--
-- Name: locations; Type: TABLE; Schema: public; Owner: dev; Tablespace: 
--

CREATE TABLE locations (
    id integer NOT NULL,
    locatable_id integer,
    locatable_type character varying,
    province character varying,
    city character varying,
    street_name character varying,
    street_number character varying,
    zip_code character varying,
    details text,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE locations OWNER TO dev;

--
-- Name: locations_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE locations_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE locations_id_seq OWNER TO dev;

--
-- Name: locations_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE locations_id_seq OWNED BY locations.id;


--
-- Name: medical_data; Type: TABLE; Schema: public; Owner: dev; Tablespace: 
--

CREATE TABLE medical_data (
    id integer NOT NULL,
    medicable_id integer,
    medicable_type character varying,
    has_chronic_desease boolean DEFAULT false,
    chronic_desease_detail character varying,
    take_medication boolean DEFAULT false,
    medication_detail character varying,
    has_medical_background boolean DEFAULT false,
    medical_background_detail character varying,
    has_allergy boolean DEFAULT false,
    allergy_detail character varying,
    has_specific_diet boolean DEFAULT false,
    specific_diet_detail character varying,
    is_vegetarian boolean DEFAULT false,
    doctor_name character varying,
    doctor_phone_number character varying,
    urgency_clinic character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE medical_data OWNER TO dev;

--
-- Name: medical_data_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE medical_data_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE medical_data_id_seq OWNER TO dev;

--
-- Name: medical_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE medical_data_id_seq OWNED BY medical_data.id;


--
-- Name: partakers; Type: TABLE; Schema: public; Owner: dev; Tablespace: 
--

CREATE TABLE partakers (
    id integer NOT NULL,
    people_id integer,
    medical_data_id integer,
    professor_id integer,
    school_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    rol integer,
    type character varying,
    year integer,
    participated boolean DEFAULT false,
    delegation_id integer
);


ALTER TABLE partakers OWNER TO dev;

--
-- Name: partakers_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE partakers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE partakers_id_seq OWNER TO dev;

--
-- Name: partakers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE partakers_id_seq OWNED BY partakers.id;


--
-- Name: people; Type: TABLE; Schema: public; Owner: dev; Tablespace: 
--

CREATE TABLE people (
    id integer NOT NULL,
    personable_id integer,
    personable_type character varying,
    first_name character varying,
    last_name character varying,
    dni character varying,
    birthdate date,
    age integer,
    location_id integer,
    phone_number character varying,
    email character varying,
    blood_type character varying,
    rh_factor character varying,
    medical_insurance character varying,
    medical_insurance_affiliate_number character varying,
    medical_insurance_phone_number character varying,
    emergency_person character varying,
    emergency_person_relationship character varying,
    emergency_person_phone_number character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE people OWNER TO dev;

--
-- Name: people_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE people_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE people_id_seq OWNER TO dev;

--
-- Name: people_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE people_id_seq OWNED BY people.id;


--
-- Name: professors; Type: TABLE; Schema: public; Owner: dev; Tablespace: 
--

CREATE TABLE professors (
    id integer NOT NULL,
    people_id integer,
    medical_data_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE professors OWNER TO dev;

--
-- Name: professors_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE professors_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE professors_id_seq OWNER TO dev;

--
-- Name: professors_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE professors_id_seq OWNED BY professors.id;


--
-- Name: queries; Type: TABLE; Schema: public; Owner: dev; Tablespace: 
--

CREATE TABLE queries (
    id integer NOT NULL,
    name character varying NOT NULL,
    email character varying NOT NULL,
    phone_number character varying,
    message text NOT NULL,
    already_read boolean DEFAULT false,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE queries OWNER TO dev;

--
-- Name: queries_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE queries_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE queries_id_seq OWNER TO dev;

--
-- Name: queries_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE queries_id_seq OWNED BY queries.id;


--
-- Name: schema_migrations; Type: TABLE; Schema: public; Owner: dev; Tablespace: 
--

CREATE TABLE schema_migrations (
    version character varying NOT NULL
);


ALTER TABLE schema_migrations OWNER TO dev;

--
-- Name: schools; Type: TABLE; Schema: public; Owner: dev; Tablespace: 
--

CREATE TABLE schools (
    id integer NOT NULL,
    name character varying NOT NULL,
    phone_number character varying,
    fax_number character varying,
    email character varying,
    location_id integer,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE schools OWNER TO dev;

--
-- Name: schools_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE schools_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE schools_id_seq OWNER TO dev;

--
-- Name: schools_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE schools_id_seq OWNED BY schools.id;


--
-- Name: statistics; Type: TABLE; Schema: public; Owner: dev; Tablespace: 
--

CREATE TABLE statistics (
    id integer NOT NULL,
    delegations integer DEFAULT 0 NOT NULL,
    partakers integer DEFAULT 0 NOT NULL,
    delegates integer DEFAULT 0 NOT NULL,
    authorities integer DEFAULT 0 NOT NULL,
    year integer DEFAULT 2012 NOT NULL,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL
);


ALTER TABLE statistics OWNER TO dev;

--
-- Name: statistics_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE statistics_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE statistics_id_seq OWNER TO dev;

--
-- Name: statistics_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE statistics_id_seq OWNED BY statistics.id;


--
-- Name: trainers; Type: TABLE; Schema: public; Owner: dev; Tablespace: 
--

CREATE TABLE trainers (
    id integer NOT NULL,
    user_id integer,
    rol character varying,
    facebook_url character varying,
    twitter_url character varying,
    instagram_url character varying,
    principal_image character varying,
    secondary_image character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    index_number integer DEFAULT 0,
    principal_image_name character varying DEFAULT ''::character varying
);


ALTER TABLE trainers OWNER TO dev;

--
-- Name: trainers_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE trainers_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE trainers_id_seq OWNER TO dev;

--
-- Name: trainers_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE trainers_id_seq OWNED BY trainers.id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: dev; Tablespace: 
--

CREATE TABLE users (
    id integer NOT NULL,
    first_name character varying,
    last_name character varying,
    created_at timestamp without time zone NOT NULL,
    updated_at timestamp without time zone NOT NULL,
    email character varying DEFAULT ''::character varying NOT NULL,
    encrypted_password character varying DEFAULT ''::character varying NOT NULL,
    reset_password_token character varying,
    reset_password_sent_at timestamp without time zone,
    remember_created_at timestamp without time zone,
    sign_in_count integer DEFAULT 0 NOT NULL,
    current_sign_in_at timestamp without time zone,
    last_sign_in_at timestamp without time zone,
    current_sign_in_ip inet,
    last_sign_in_ip inet,
    phone_number character varying DEFAULT ''::character varying,
    dni character varying DEFAULT ''::character varying
);


ALTER TABLE users OWNER TO dev;

--
-- Name: users_id_seq; Type: SEQUENCE; Schema: public; Owner: dev
--

CREATE SEQUENCE users_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_id_seq OWNER TO dev;

--
-- Name: users_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: dev
--

ALTER SEQUENCE users_id_seq OWNED BY users.id;


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY countries ALTER COLUMN id SET DEFAULT nextval('countries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY dashboards ALTER COLUMN id SET DEFAULT nextval('dashboards_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY delegations ALTER COLUMN id SET DEFAULT nextval('delegations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY ex_partakers ALTER COLUMN id SET DEFAULT nextval('ex_partakers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY inscriptions ALTER COLUMN id SET DEFAULT nextval('inscriptions_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY locations ALTER COLUMN id SET DEFAULT nextval('locations_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY medical_data ALTER COLUMN id SET DEFAULT nextval('medical_data_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY partakers ALTER COLUMN id SET DEFAULT nextval('partakers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY people ALTER COLUMN id SET DEFAULT nextval('people_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY professors ALTER COLUMN id SET DEFAULT nextval('professors_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY queries ALTER COLUMN id SET DEFAULT nextval('queries_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY schools ALTER COLUMN id SET DEFAULT nextval('schools_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY statistics ALTER COLUMN id SET DEFAULT nextval('statistics_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY trainers ALTER COLUMN id SET DEFAULT nextval('trainers_id_seq'::regclass);


--
-- Name: id; Type: DEFAULT; Schema: public; Owner: dev
--

ALTER TABLE ONLY users ALTER COLUMN id SET DEFAULT nextval('users_id_seq'::regclass);


--
-- Data for Name: countries; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY countries (id, name, flag_image, created_at, updated_at, regional_group) FROM stdin;
82	Palestina	\N	2016-08-20 01:08:52.350353	2016-08-20 01:08:52.350353	1
1	China	\N	2016-05-23 21:26:25.337895	2016-06-09 16:47:20.443248	1
83	Belgica	\N	2016-08-20 02:53:36.955144	2016-08-20 02:53:36.955144	0
84	Reino Unido	\N	2016-08-20 03:18:22.700702	2016-08-20 03:18:22.700702	0
85	Eslovenia	\N	2016-08-20 03:33:32.824603	2016-08-20 03:33:32.824603	0
86	Emiratos Arabes Unidos	\N	2016-08-27 18:41:33.553297	2016-08-27 18:41:33.553297	1
3	Federacion Rusa	\N	2016-05-23 21:27:03.758002	2016-06-09 16:50:22.615282	1
2	EEUU	\N	2016-05-23 21:26:41.817618	2016-06-09 16:50:33.169427	0
4	Francia	\N	2016-05-23 21:27:28.916458	2016-06-09 16:50:46.095437	0
5	Reino Unido	\N	2016-05-23 21:27:56.032807	2016-06-09 16:50:57.649582	0
6	Venezuela	\N	2016-06-02 19:25:12.346028	2016-06-09 16:51:09.929549	3
8	Argentina	\N	2016-06-02 19:25:45.302709	2016-06-09 16:51:52.099757	3
11	Grecia	\N	2016-06-04 15:55:42.559299	2016-06-09 16:52:35.494362	0
12	Arabia Saudita	\N	2016-06-06 20:28:59.103149	2016-06-09 16:53:09.219816	1
7	Pakistán	\N	2016-06-02 19:25:34.387817	2016-06-09 16:53:34.661153	1
10	Cuba	\N	2016-06-04 13:58:35.219547	2016-06-09 16:53:59.802728	3
9	Ucrania	\N	2016-06-02 19:25:56.132178	2016-06-09 16:54:12.909618	0
13	Corea Del Sur	\N	2016-06-21 17:41:18.882983	2016-06-21 17:41:18.882983	1
14	Uruguay	\N	2016-06-21 17:48:49.413583	2016-06-21 17:48:49.413583	3
15	Francia	\N	2016-06-21 18:04:02.162135	2016-06-21 18:04:02.162135	0
16	Andorra	\N	2016-06-21 18:53:04.159364	2016-06-21 18:53:04.159364	0
17	Irán	\N	2016-06-21 18:53:20.081756	2016-06-21 18:53:20.081756	1
18	Angola	\N	2016-06-21 19:30:39.212617	2016-06-21 19:30:39.212617	2
19	Nigeria	\N	2016-06-21 19:42:55.42891	2016-06-21 19:42:55.42891	2
20	Brasil	\N	2016-06-21 20:55:14.489449	2016-06-21 20:55:14.489449	3
21	Alemania	\N	2016-06-21 21:34:27.025491	2016-06-21 21:34:27.025491	0
22	Jordania	\N	2016-06-22 17:47:13.696037	2016-06-22 17:47:13.696037	1
23	Acnur	\N	2016-06-22 17:49:01.239013	2016-06-22 17:49:01.239013	\N
24	Argentina	\N	2016-06-22 18:08:58.787825	2016-06-22 18:08:58.787825	3
25	Guatemala	\N	2016-06-22 18:17:37.032972	2016-06-22 18:17:37.032972	3
26	Ucrania	\N	2016-06-22 18:32:16.993948	2016-06-22 18:32:16.993948	0
27	Israel	\N	2016-06-22 20:51:20.908518	2016-06-22 20:51:20.908518	1
28	Republica Centroafricana	\N	2016-06-22 21:12:27.007219	2016-06-22 21:12:27.007219	2
29	Egipto	\N	2016-06-22 21:29:11.963915	2016-06-22 21:29:11.963915	2
30	Corea del Norte	\N	2016-06-23 17:13:39.162062	2016-06-23 17:13:39.162062	1
31	Nicaragua	\N	2016-06-23 17:35:24.62914	2016-06-23 17:35:24.62914	3
32	Honduras	\N	2016-06-23 18:13:59.753714	2016-06-23 18:13:59.753714	3
33	Filipinas	\N	2016-06-23 18:15:50.71352	2016-06-23 18:15:50.71352	3
34	Afganistan	\N	2016-06-23 18:33:44.74719	2016-06-23 18:33:44.74719	1
35	Panamá	\N	2016-06-23 18:37:54.403262	2016-06-23 18:37:54.403262	3
36	Paraguay	\N	2016-06-23 18:46:03.48502	2016-06-23 18:46:03.48502	3
37	Venezuela	\N	2016-06-23 19:05:13.542501	2016-06-23 19:05:13.542501	3
38	Libia	\N	2016-06-23 19:22:14.268089	2016-06-23 19:22:14.268089	2
39	Ecuador	\N	2016-06-23 19:42:14.452751	2016-06-23 19:42:14.452751	3
40	Costa Rica	\N	2016-06-25 14:18:06.979625	2016-06-25 14:18:06.979625	3
41	Portugal	\N	2016-06-25 14:39:49.274747	2016-06-25 14:39:49.274747	0
44	Sudán Del Sur	\N	2016-06-25 15:25:25.251599	2016-06-25 15:25:25.251599	2
45	Senegal	\N	2016-06-28 18:21:01.657556	2016-06-28 18:21:01.657556	2
46	Banco Mundial	\N	2016-06-28 18:34:42.408574	2016-06-28 18:34:42.408574	\N
47	República Dominicana	\N	2016-06-28 18:50:18.04632	2016-06-28 18:50:18.04632	3
48	Siria	\N	2016-06-28 19:19:28.08775	2016-06-28 19:19:28.08775	1
49	República de la India	\N	2016-06-28 19:41:12.663683	2016-06-28 19:41:12.663683	1
50	República de Sudán	\N	2016-06-29 20:26:31.437162	2016-06-29 20:26:31.437162	2
52	Bolivia	\N	2016-06-29 20:36:14.89322	2016-06-29 20:36:14.89322	3
53	Colombia	\N	2016-06-30 18:08:53.117537	2016-06-30 18:08:53.117537	3
54	Mexico	\N	2016-06-30 18:28:40.85855	2016-06-30 18:28:40.85855	3
55	Yemen	\N	2016-06-30 18:47:44.003631	2016-06-30 18:47:44.003631	2
56	Luxemburgo	\N	2016-06-30 18:59:31.461161	2016-06-30 18:59:31.461161	0
57	Acnudh	\N	2016-06-30 19:41:35.732173	2016-06-30 19:41:35.732173	\N
58	Japón	\N	2016-06-30 20:45:40.764215	2016-06-30 20:45:40.764215	1
59	Somalía	\N	2016-06-30 21:34:00.396009	2016-06-30 21:34:00.396009	2
60	España	\N	2016-06-30 21:52:55.971817	2016-06-30 21:52:55.971817	0
61	Lituania	\N	2016-08-13 05:19:43.633502	2016-08-13 05:19:43.633502	0
62	Nueva Zelanda	\N	2016-08-13 05:35:34.342489	2016-08-13 05:35:34.342489	1
63	Malasia	\N	2016-08-13 05:47:42.819327	2016-08-13 05:47:42.819327	1
64	Etiopia	\N	2016-08-13 06:00:43.85001	2016-08-13 06:00:43.85001	2
65	Argelia	\N	2016-08-13 06:11:44.241684	2016-08-13 06:11:44.241684	2
66	Republica Del Congo	\N	2016-08-13 06:22:04.539393	2016-08-13 06:22:04.539393	2
67	Peru	\N	2016-08-13 14:03:39.826058	2016-08-13 14:03:39.826058	3
68	Sudafrica	\N	2016-08-13 14:53:43.655036	2016-08-13 14:54:44.576018	2
69	El Salvador	\N	2016-08-13 15:06:10.706767	2016-08-13 15:06:10.706767	3
70	Kenia	\N	2016-08-18 00:37:28.932318	2016-08-18 00:37:28.932318	2
71	República Democrática del Congo	\N	2016-08-19 01:02:57.334009	2016-08-19 01:02:57.334009	2
72	Turquía	\N	2016-08-19 01:20:00.605981	2016-08-19 01:20:00.605981	1
73	Líbano	\N	2016-08-19 01:37:44.24252	2016-08-19 01:37:44.24252	1
74	Chad	\N	2016-08-19 01:54:14.110749	2016-08-19 01:54:14.110749	2
75	Ghana	\N	2016-08-19 17:29:18.748258	2016-08-19 17:29:18.748258	2
76	Uzbekistán	\N	2016-08-19 20:07:35.463433	2016-08-19 20:07:35.463433	1
77	Irlanda	\N	2016-08-19 20:24:52.44477	2016-08-19 20:24:52.44477	0
78	Vietnam	\N	2016-08-19 20:58:48.740457	2016-08-19 20:58:48.740457	1
79	Italia	\N	2016-08-20 00:11:24.489402	2016-08-20 00:11:24.489402	0
80	Ruanda	\N	2016-08-20 00:28:32.510108	2016-08-20 00:28:32.510108	2
81	República de Chile	\N	2016-08-20 00:49:36.017062	2016-08-20 00:49:36.017062	3
\.


--
-- Name: countries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('countries_id_seq', 86, true);


--
-- Data for Name: dashboards; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY dashboards (id, created_at, updated_at) FROM stdin;
\.


--
-- Name: dashboards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('dashboards_id_seq', 1, false);


--
-- Data for Name: delegations; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY delegations (id, year, created_at, updated_at, country_id) FROM stdin;
4	2016	2016-06-02 19:34:30.585292	2016-06-02 19:34:30.585292	7
5	2016	2016-06-02 19:37:07.068719	2016-06-02 19:37:07.068719	8
7	2016	2016-06-04 14:26:34.081667	2016-06-04 14:26:34.081667	10
8	2016	2016-06-04 15:34:04.785174	2016-06-04 15:34:04.785174	1
9	2016	2016-06-04 15:51:13.90666	2016-06-04 15:51:13.90666	2
11	2016	2016-06-06 20:28:40.577408	2016-06-06 20:28:40.577408	11
12	2016	2016-06-06 20:34:58.042026	2016-06-06 20:34:58.042026	12
13	2016	2016-06-21 17:53:35.521009	2016-06-21 17:53:35.521009	13
14	2016	2016-06-21 18:22:11.726332	2016-06-21 18:22:11.726332	14
15	2016	2016-06-21 18:40:35.801502	2016-06-21 18:40:35.801502	15
16	2016	2016-06-21 19:10:48.233011	2016-06-21 19:10:48.233011	17
17	2016	2016-06-21 19:53:41.172549	2016-06-21 19:53:41.172549	19
18	2016	2016-06-21 20:51:54.174907	2016-06-21 20:51:54.174907	18
19	2016	2016-06-21 21:12:56.220556	2016-06-21 21:12:56.220556	20
20	2016	2016-06-21 21:32:47.060988	2016-06-21 21:32:47.060988	16
21	2016	2016-06-21 21:44:55.821879	2016-06-21 21:44:55.821879	21
22	2016	2016-06-22 17:56:30.72404	2016-06-22 17:56:30.72404	23
25	2016	2016-06-22 18:35:46.466245	2016-06-22 18:35:46.466245	25
26	2016	2016-06-22 18:44:06.955743	2016-06-22 18:44:06.955743	22
27	2016	2016-06-22 18:48:12.045663	2016-06-22 18:48:12.045663	26
28	2016	2016-06-22 21:04:51.603932	2016-06-22 21:04:51.603932	27
29	2016	2016-06-22 21:23:54.934829	2016-06-22 21:23:54.934829	28
30	2016	2016-06-22 21:47:34.037276	2016-06-22 21:47:34.037276	29
31	2016	2016-06-23 17:21:24.560904	2016-06-23 17:21:24.560904	30
32	2016	2016-06-23 17:56:03.331764	2016-06-23 17:56:03.331764	31
33	2016	2016-06-23 18:11:57.843095	2016-06-23 18:11:57.843095	3
34	2016	2016-06-23 18:23:40.088954	2016-06-23 18:23:40.088954	33
35	2016	2016-06-23 18:28:32.124015	2016-06-23 18:28:32.124015	32
36	2016	2016-06-23 18:40:42.044403	2016-06-23 18:40:42.044403	34
37	2016	2016-06-23 19:03:55.692782	2016-06-23 19:03:55.692782	35
38	2016	2016-06-23 19:05:09.485356	2016-06-23 19:05:09.485356	36
39	2016	2016-06-23 19:34:32.671036	2016-06-23 19:34:32.671036	38
40	2016	2016-06-23 19:59:58.439788	2016-06-23 19:59:58.439788	39
41	2016	2016-06-23 20:01:36.938596	2016-06-23 20:01:36.938596	6
42	2016	2016-06-25 14:39:22.345217	2016-06-25 14:39:22.345217	40
43	2016	2016-06-25 15:00:35.876201	2016-06-25 15:00:35.876201	41
45	2016	2016-06-25 15:35:48.937469	2016-06-25 15:35:48.937469	44
46	2016	2016-06-28 18:32:44.863484	2016-06-28 18:32:44.863484	45
47	2016	2016-06-28 18:41:49.908045	2016-06-28 18:41:49.908045	46
48	2016	2016-06-28 19:03:32.066336	2016-06-28 19:03:32.066336	47
49	2016	2016-06-28 19:27:12.982838	2016-06-28 19:27:12.982838	48
50	2016	2016-06-28 19:49:48.616086	2016-06-28 19:49:48.616086	49
51	2016	2016-06-29 20:27:26.766684	2016-06-29 20:27:26.766684	50
52	2016	2016-06-29 20:43:01.871885	2016-06-29 20:43:01.871885	52
53	2016	2016-06-30 18:27:16.483166	2016-06-30 18:27:16.483166	53
54	2016	2016-06-30 18:45:47.951427	2016-06-30 18:45:47.951427	54
55	2016	2016-06-30 18:58:01.569818	2016-06-30 18:58:01.569818	55
56	2016	2016-06-30 19:16:41.826564	2016-06-30 19:16:41.826564	56
57	2016	2016-06-30 19:44:37.519268	2016-06-30 19:44:37.519268	57
58	2016	2016-06-30 21:07:07.098297	2016-06-30 21:07:07.098297	58
59	2016	2016-06-30 21:50:35.203486	2016-06-30 21:50:35.203486	59
60	2016	2016-06-30 22:26:29.4438	2016-06-30 22:26:29.4438	60
61	2016	2016-08-13 05:30:50.655537	2016-08-13 05:30:50.655537	61
62	2016	2016-08-13 05:46:33.361893	2016-08-13 05:46:33.361893	62
63	2016	2016-08-13 05:58:17.190556	2016-08-13 05:58:17.190556	63
64	2016	2016-08-13 06:09:36.640703	2016-08-13 06:09:36.640703	64
65	2016	2016-08-13 06:21:11.794965	2016-08-13 06:21:11.794965	65
66	2016	2016-08-13 06:29:43.402196	2016-08-13 06:29:43.402196	66
67	2016	2016-08-13 14:52:41.943567	2016-08-13 14:52:41.943567	67
68	2016	2016-08-13 15:05:18.715145	2016-08-13 15:05:18.715145	68
69	2016	2016-08-13 15:09:41.837918	2016-08-13 15:09:41.837918	69
70	2016	2016-08-18 00:43:44.35661	2016-08-18 00:43:44.35661	70
71	2016	2016-08-19 01:19:05.315148	2016-08-19 01:19:05.315148	71
72	2016	2016-08-19 01:35:45.732797	2016-08-19 01:35:45.732797	72
73	2016	2016-08-19 01:50:34.385534	2016-08-19 01:50:34.385534	73
74	2016	2016-08-19 02:10:40.489611	2016-08-19 02:10:40.489611	74
75	2016	2016-08-19 17:31:23.491787	2016-08-19 17:31:23.491787	75
76	2016	2016-08-19 20:23:01.144409	2016-08-19 20:23:01.144409	76
77	2016	2016-08-19 20:57:26.157051	2016-08-19 20:57:26.157051	77
78	2016	2016-08-19 21:12:46.372664	2016-08-19 21:12:46.372664	78
79	2016	2016-08-20 00:22:37.287635	2016-08-20 00:22:37.287635	79
80	2016	2016-08-20 00:45:12.146035	2016-08-20 00:45:12.146035	80
82	2016	2016-08-20 01:07:37.825136	2016-08-20 01:07:37.825136	81
83	2016	2016-08-20 01:13:33.245896	2016-08-20 01:13:33.245896	82
84	2016	2016-08-20 03:16:54.863453	2016-08-20 03:16:54.863453	83
85	2016	2016-08-20 03:31:59.878213	2016-08-20 03:31:59.878213	84
86	2016	2016-08-20 03:39:45.607348	2016-08-20 03:39:45.607348	85
87	2016	2016-08-27 18:59:35.631922	2016-08-27 18:59:35.631922	86
\.


--
-- Name: delegations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('delegations_id_seq', 87, true);


--
-- Data for Name: ex_partakers; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY ex_partakers (id, partaker_type, first_name, last_name, email, phone_number, school_name, city_name, country_name, year, created_at, updated_at, role, dni) FROM stdin;
224	0	Milagros Aylen	Pellegrino	\N	2342-512428	Normal		Estados Unidos	2014	2017-02-22 23:02:16.005367	2017-02-22 23:02:16.005367	\N	\N
225	0	Sharon Ariadna	Safie	\N	2342-512152	Normal		Estados Unidos	2014	2017-02-22 23:02:16.013829	2017-02-22 23:02:16.013829	\N	\N
226	0	Aldana Mariel	Bertagna	\N	2342-482936	Normal		Estados Unidos	2014	2017-02-22 23:02:16.01961	2017-02-22 23:02:16.01961	\N	\N
227	0	Ernesto Alejandro	Araya Paez	\N	2342-454667	Normal		Estados Unidos	2014	2017-02-22 23:02:16.026051	2017-02-22 23:02:16.026051	\N	\N
228	0	Bettina	Alessandrini	\N	2342-402511	Normal		Estados Unidos	2014	2017-02-22 23:02:16.032892	2017-02-22 23:02:16.032892	\N	\N
229	0	Felicitas	Bruno	\N	2342-408038	Normal		Sudán del Sur	2014	2017-02-22 23:02:16.039671	2017-02-22 23:02:16.039671	\N	\N
230	0	Sofia	Scuticchio Orlandini	\N	2342-405291	Normal		Sudán del Sur	2014	2017-02-22 23:02:16.046295	2017-02-22 23:02:16.046295	\N	\N
231	0	María Amparo	Hernández	\N	2342-408133	Normal		Sudán del Sur	2014	2017-02-22 23:02:16.051799	2017-02-22 23:02:16.051799	\N	\N
232	0	Iara Magalí	Bonahora Pinedo	\N	2342-425124	San José		Federacion Rusa	2014	2017-02-22 23:02:16.057793	2017-02-22 23:02:16.057793	\N	\N
233	0	Camila	Labaqui	\N	2346-480465	San José		Federacion Rusa	2014	2017-02-22 23:02:16.064974	2017-02-22 23:02:16.064974	\N	\N
234	0	Juan Eduardo	Neri Artano	\N	2342-407195	San José		Federacion Rusa	2014	2017-02-22 23:02:16.070881	2017-02-22 23:02:16.070881	\N	\N
235	0	Leo	Beltran	\N	2342-534645	San José		Federacion Rusa	2014	2017-02-22 23:02:16.077014	2017-02-22 23:02:16.077014	\N	\N
236	0	Yair Adán	Bonahora	\N	2342-425124	San José		Federacion Rusa	2014	2017-02-22 23:02:16.083246	2017-02-22 23:02:16.083246	\N	\N
237	0	Mateo	Barros Conde	\N	011-1557002304	San Jose		Palestina	2014	2017-02-22 23:02:16.089382	2017-02-22 23:02:16.089382	\N	\N
238	0	Francisco	Marini	\N	2342-508154	San Jose		Palestina	2014	2017-02-22 23:02:16.095014	2017-02-22 23:02:16.095014	\N	\N
239	0	Harol Hernan	Marquina	\N	2342-450070	San Jose		Palestina	2014	2017-02-22 23:02:16.10452	2017-02-22 23:02:16.10452	\N	\N
240	0	Tatiana	Duberti Giordano	\N	2342-459932	San Jose		Colombia	2014	2017-02-22 23:02:16.11052	2017-02-22 23:02:16.11052	\N	\N
241	0	Julian	Barenghi	\N	2342-447114	San Jose		Colombia	2014	2017-02-22 23:02:16.117833	2017-02-22 23:02:16.117833	\N	\N
242	0	Magali 	Kloster	\N	02323-15-677309	San Jose		Colombia	2014	2017-02-22 23:02:16.124751	2017-02-22 23:02:16.124751	\N	\N
243	0	Maria Sol	Salgado	\N	2346-559628	San Jose		Colombia	2014	2017-02-22 23:02:16.130316	2017-02-22 23:02:16.130316	\N	\N
244	0	Delfina	Massalin	\N	2342-447315	San Jose		Colombia	2014	2017-02-22 23:02:16.136846	2017-02-22 23:02:16.136846	\N	\N
245	0	Josefina 	Rizzo	\N	2342-412022	Normal		Nigeria	2014	2017-02-22 23:02:16.142387	2017-02-22 23:02:16.142387	\N	\N
246	0	Julia	Spelanzon	\N	2342-409965	Normal		Nigeria	2014	2017-02-22 23:02:16.148567	2017-02-22 23:02:16.148567	\N	\N
247	0	Tomas 	Diaz	\N	2342-530738	Normal		Nigeria	2014	2017-02-22 23:02:16.155673	2017-02-22 23:02:16.155673	\N	\N
248	0	Abril	Dangelo	\N	2342-510124	Normal		Nigeria	2014	2017-02-22 23:02:16.161619	2017-02-22 23:02:16.161619	\N	\N
249	0	Belén	Cardus	\N	\N	Normal		Nigeria	2014	2017-02-22 23:02:16.167256	2017-02-22 23:02:16.167256	\N	\N
250	0	Lucia	Buzzeo	\N	2342-467919	Normal		Chile	2014	2017-02-22 23:02:16.175169	2017-02-22 23:02:16.175169	\N	\N
251	0	Maria Luz	Scotti	\N	2342-410015	Normal		Chile	2014	2017-02-22 23:02:16.183244	2017-02-22 23:02:16.183244	\N	\N
252	0	Maria Clara	Macchion	\N	2342-501100	Normal		Chile	2014	2017-02-22 23:02:16.191063	2017-02-22 23:02:16.191063	\N	\N
253	0	Marianela	Guerrieri	\N	2342-532452	Normal		Chile	2014	2017-02-22 23:02:16.198202	2017-02-22 23:02:16.198202	\N	\N
254	0	Maria Ibis	Perez del Olmo	\N	2342-459864	Normal		Chile	2014	2017-02-22 23:02:16.205388	2017-02-22 23:02:16.205388	\N	\N
255	0	Lucia Mercedes	Moreno Acevedo	\N	2342-485809	Normal		Chile	2014	2017-02-22 23:02:16.211733	2017-02-22 23:02:16.211733	\N	\N
256	0	Bernardo	Farias	\N	2342-405013	Normal		Chile	2014	2017-02-22 23:02:16.218688	2017-02-22 23:02:16.218688	\N	\N
257	0	Selene	Percudani	\N	2342-515520	Normal		República Popular Democrática de Corea	2014	2017-02-22 23:02:16.225143	2017-02-22 23:02:16.225143	\N	\N
258	0	Sofia Ailen	Poeta	\N	2342-455440	Normal		República Popular Democrática de Corea	2014	2017-02-22 23:02:16.231747	2017-02-22 23:02:16.231747	\N	\N
259	0	Maria Luz	Perez del Olmo	\N	2342-459864	Normal		República Popular Democrática de Corea	2014	2017-02-22 23:02:16.237983	2017-02-22 23:02:16.237983	\N	\N
266	0	Damian Nicolas	Riva	\N	02342-427584	Normal		Japón	2014	2017-02-22 23:02:16.285784	2017-02-22 23:02:16.285784	\N	\N
267	0	Juan Bautista	Nieto	\N	02342-421134	Normal		Japón	2014	2017-02-22 23:02:16.293148	2017-02-22 23:02:16.293148	\N	\N
268	0	Brenda	Bussi	\N	2342-458159	Normal		Japón	2014	2017-02-22 23:02:16.299435	2017-02-22 23:02:16.299435	\N	\N
269	0	Lucas	Abelardo	\N	431501.0	Normal		Panamá	2014	2017-02-22 23:02:16.30891	2017-02-22 23:02:16.30891	\N	\N
270	0	Santiago	Petit	\N	2342-451051	Normal		Panamá	2014	2017-02-22 23:02:16.316643	2017-02-22 23:02:16.316643	\N	\N
271	0	Ignacio	Aznar	\N	2342-483176	Normal		Panamá	2014	2017-02-22 23:02:16.324047	2017-02-22 23:02:16.324047	\N	\N
272	0	Giuliano	Carestia	\N	2342-515031	Normal		Panamá	2014	2017-02-22 23:02:16.331187	2017-02-22 23:02:16.331187	\N	\N
273	0	Jazmin	Cassani	\N	2342-413146/2342-461961	Normal		Panamá	2014	2017-02-22 23:02:16.339703	2017-02-22 23:02:16.339703	\N	\N
274	0	Alessandro	Bondoni	\N	2342-464599	Normal		Chad	2014	2017-02-22 23:02:16.346904	2017-02-22 23:02:16.346904	\N	\N
275	0	Agustin	Gutierrez 	\N	2342-505566	Normal		Chad	2014	2017-02-22 23:02:16.355439	2017-02-22 23:02:16.355439	\N	\N
276	0	Dolores	Farias	\N	426960/2342-405013	Normal		Chad	2014	2017-02-22 23:02:16.362634	2017-02-22 23:02:16.362634	\N	\N
277	0	Florencia	Pujol	\N	2346-567473	Normal		Chad	2014	2017-02-22 23:02:16.369518	2017-02-22 23:02:16.369518	\N	\N
278	0	Lucia	Amigo	\N	\N	Normal		Chad	2014	2017-02-22 23:02:16.377671	2017-02-22 23:02:16.377671	\N	\N
279	0	Azul	Ghezzi	\N	2342-401616	Normal		Lituania	2014	2017-02-22 23:02:16.384409	2017-02-22 23:02:16.384409	\N	\N
280	0	Dolores	Santamarina	\N	2342-514193	Normal		Lituania	2014	2017-02-22 23:02:16.391318	2017-02-22 23:02:16.391318	\N	\N
281	0	Maria Florencia	Destefano	\N	2342-531488	Normal		Lituania	2014	2017-02-22 23:02:16.398217	2017-02-22 23:02:16.398217	\N	\N
282	0	Juan Julian	Gualdoni	\N	2342-532243	Normal		Lituania	2014	2017-02-22 23:02:16.403866	2017-02-22 23:02:16.403866	\N	\N
283	0	Gonzalo	Pereyra	\N	\N	Normal		Lituania	2014	2017-02-22 23:02:16.614375	2017-02-22 23:02:16.614375	\N	\N
284	0	Valentina Jazmín	Iannino	\N	2342-515171	Normal		Italia	2014	2017-02-22 23:02:16.621234	2017-02-22 23:02:16.621234	\N	\N
285	0	Violera	Lodeiro	\N	2342-414601	Normal		Italia	2014	2017-02-22 23:02:16.627903	2017-02-22 23:02:16.627903	\N	\N
286	0	Maria Sofia	Alvarez	\N	2342-531431	Normal		Italia	2014	2017-02-22 23:02:16.633467	2017-02-22 23:02:16.633467	\N	\N
290	0	Valentina 	Balbi	\N	2342-450383	Agrotecnico		Israel	2014	2017-02-22 23:02:16.659911	2017-02-22 23:02:16.659911	\N	\N
291	0	Catalina	Meneses	\N	2342-534945	Agrotecnico		Israel	2014	2017-02-22 23:02:16.665405	2017-02-22 23:02:16.665405	\N	\N
292	0	Alan Joel	Montiel	\N	2342-509328	Agrotecnico		Israel	2014	2017-02-22 23:02:16.671013	2017-02-22 23:02:16.671013	\N	\N
293	0	Alenjandro Agustin	Tagliaferro	\N	2342-534524	Agrotecnico		México	2014	2017-02-22 23:02:16.6775	2017-02-22 23:02:16.6775	\N	\N
294	0	Luciana Maria Macarena	Delaite	\N	2342-413868	Agrotecnico		México	2014	2017-02-22 23:02:16.684074	2017-02-22 23:02:16.684074	\N	\N
295	0	Tomas Rafael	Caro	\N	2342-509888	Agrotecnico		México	2014	2017-02-22 23:02:16.69093	2017-02-22 23:02:16.69093	\N	\N
296	0	Juan Cruz	Astudillo	\N	2342-507723	Agrotecnico		México	2014	2017-02-22 23:02:16.697789	2017-02-22 23:02:16.697789	\N	\N
297	0	Mariana Rocio	Romero	\N	427819.0	Agrotecnico		México	2014	2017-02-22 23:02:16.703882	2017-02-22 23:02:16.703882	\N	\N
298	0	Noelia	Cerri	\N	2342-445011	Normal		Jordania	2014	2017-02-22 23:02:16.71052	2017-02-22 23:02:16.71052	\N	\N
299	0	Ana Clara	Romeo	\N	2342-453177	Normal		Jordania	2014	2017-02-22 23:02:16.717124	2017-02-22 23:02:16.717124	\N	\N
300	0	Clara Mariana 	De Renzis	\N	2342-403062	Normal		Jordania	2014	2017-02-22 23:02:16.723506	2017-02-22 23:02:16.723506	\N	\N
301	0	Gala	Luisetto	\N	2342-403066	Normal		Jordania	2014	2017-02-22 23:02:16.729909	2017-02-22 23:02:16.729909	\N	\N
302	0	Mariana 	Polizzi	\N	2342-454475	Normal		Jordania	2014	2017-02-22 23:02:16.735987	2017-02-22 23:02:16.735987	\N	\N
303	0	Agustina	Loriente	\N	2342-404027	Normal		Países Bajos	2014	2017-02-22 23:02:16.742342	2017-02-22 23:02:16.742342	\N	\N
304	0	Joaquin	Vives	\N	2342-466111	Normal		Países Bajos	2014	2017-02-22 23:02:16.748086	2017-02-22 23:02:16.748086	\N	\N
305	0	Tomas	Celerier	\N	2342-425218	Normal		Países Bajos	2014	2017-02-22 23:02:16.753634	2017-02-22 23:02:16.753634	\N	\N
306	0	Simon	Di Giorgio	\N	2342-447618	Agrotecnico		Portugal	2014	2017-02-22 23:02:16.759071	2017-02-22 23:02:16.759071	\N	\N
307	0	Maria Felicitas	Rizzo	\N	2342-400025	Agrotecnico		Portugal	2014	2017-02-22 23:02:16.764691	2017-02-22 23:02:16.764691	\N	\N
308	0	Constante	Bersi	\N	2342-451640	Agrotecnico		Portugal	2014	2017-02-22 23:02:16.77045	2017-02-22 23:02:16.77045	\N	\N
309	0	Fermin 	Conde	\N	2342-405316	Agrotecnico		Portugal	2014	2017-02-22 23:02:16.776585	2017-02-22 23:02:16.776585	\N	\N
310	0	Valentin Leonardo	Lorenzo	\N	2342-454040	Agrotecnico		Portugal	2014	2017-02-22 23:02:16.78255	2017-02-22 23:02:16.78255	\N	\N
311	0	Maria Milagros	Castaño Expósito	\N	2342-463712	Agrotecnico		Ecuador	2014	2017-02-22 23:02:16.788532	2017-02-22 23:02:16.788532	\N	\N
312	0	Julieta	Graziano	\N	2342-465165	Agrotecnico		Ecuador	2014	2017-02-22 23:02:16.794398	2017-02-22 23:02:16.794398	\N	\N
313	0	Lucia 	Pedrosa	\N	2342-400700	Agrotecnico		Ecuador	2014	2017-02-22 23:02:16.800453	2017-02-22 23:02:16.800453	\N	\N
314	0	Juliana	Yañez	\N	2342-403736	Agrotecnico		Ecuador	2014	2017-02-22 23:02:16.806206	2017-02-22 23:02:16.806206	\N	\N
315	0	Florencia	Herbalejo	\N	2342-504320	Agrotecnico		Ecuador	2014	2017-02-22 23:02:16.812226	2017-02-22 23:02:16.812226	\N	\N
316	0	Franco 	Fenoglio	\N	2342-466175	Agrotecnico		Argentina	2014	2017-02-22 23:02:16.819434	2017-02-22 23:02:16.819434	\N	\N
317	0	Bautista 	Molfeso	\N	2342-468130	Agrotecnico		Argentina	2014	2017-02-22 23:02:16.825648	2017-02-22 23:02:16.825648	\N	\N
318	0	Fermin 	Colombo	\N	2342-458582	Agrotecnico		Argentina	2014	2017-02-22 23:02:16.83275	2017-02-22 23:02:16.83275	\N	\N
319	0	Hernan Nahuel	Lastra	\N	2342-426184	Agrotecnico		Argentina	2014	2017-02-22 23:02:16.839437	2017-02-22 23:02:16.839437	\N	\N
320	0	Franco 	Saldaña	\N	2342-425011	Agrotecnico		Argentina	2014	2017-02-22 23:02:16.845099	2017-02-22 23:02:16.845099	\N	\N
321	0	Diego	Medina	\N	2342-506127	Agrotecnico		Argentina	2014	2017-02-22 23:02:16.851688	2017-02-22 23:02:16.851688	\N	\N
322	0	Agustin Ignacio	Ferri	\N	2342-468925	Agrotecnico		Argentina	2014	2017-02-22 23:02:16.857831	2017-02-22 23:02:16.857831	\N	\N
323	0	Juana 	Mendizabal	\N	2342-409092	Agrotecnico		Venezuela 	2014	2017-02-22 23:02:16.863552	2017-02-22 23:02:16.863552	\N	\N
324	0	Candela 	Chacón	\N	2342-409733	Agrotecnico		Venezuela 	2014	2017-02-22 23:02:16.869087	2017-02-22 23:02:16.869087	\N	\N
325	0	Catalina	Massa	\N	2342-409197	Agrotecnico		Venezuela 	2014	2017-02-22 23:02:16.874618	2017-02-22 23:02:16.874618	\N	\N
326	0	Enzo Agustin	Coppolla	\N	2342-483159	Agrotecnico		Venezuela 	2014	2017-02-22 23:02:16.88078	2017-02-22 23:02:16.88078	\N	\N
327	0	Laureana 	Zubizarreta	\N	2342-452416	Agrotecnico		Venezuela 	2014	2017-02-22 23:02:16.886855	2017-02-22 23:02:16.886855	\N	\N
328	0	Ignacio 	Dominguez	\N	2342-426304	Agrotecnico		Reino Unido	2014	2017-02-22 23:02:16.892579	2017-02-22 23:02:16.892579	\N	\N
329	0	Juan Cruz	Galvaliche	\N	2342-531066	Agrotecnico		Reino Unido	2014	2017-02-22 23:02:16.898332	2017-02-22 23:02:16.898332	\N	\N
330	0	Martin	Echeverria	\N	2342-470505	Agrotecnico		Reino Unido	2014	2017-02-22 23:02:16.905844	2017-02-22 23:02:16.905844	\N	\N
331	0	Guido 	Molfeso	\N	2342-468130	Agrotecnico		Reino Unido	2014	2017-02-22 23:02:16.911083	2017-02-22 23:02:16.911083	\N	\N
332	0	Joaquin	De Moura	\N	2342-401192	Agrotecnico		Reino Unido	2014	2017-02-22 23:02:16.916362	2017-02-22 23:02:16.916362	\N	\N
333	0	Juan Agustin	Yañez	\N	2342-422853	Agrotecnico		República de Corea	2014	2017-02-22 23:02:16.922082	2017-02-22 23:02:16.922082	\N	\N
334	0	Camila 	Silva	\N	2342-421384	Agrotecnico		República de Corea	2014	2017-02-22 23:02:16.928	2017-02-22 23:02:16.928	\N	\N
335	0	Milena	Antonov Panaiotov	\N	2342-445885	Agrotecnico		República de Corea	2014	2017-02-22 23:02:16.934199	2017-02-22 23:02:16.934199	\N	\N
336	0	Maria Lucrecia	Barni	\N	2342-464195	Agrotecnico		República de Corea	2014	2017-02-22 23:02:16.940725	2017-02-22 23:02:16.940725	\N	\N
337	0	Emiliano Aldo	Bruno	\N	2342-410417	Agrotecnico		República de Corea	2014	2017-02-22 23:02:16.947318	2017-02-22 23:02:16.947318	\N	\N
338	0	Federico Aaron	Valerga	\N	2342-402121	Agrotecnico		Ruanda	2014	2017-02-22 23:02:16.953602	2017-02-22 23:02:16.953602	\N	\N
339	0	Agustin 	Grumenida Martinez	\N	2342-407717	Agrotecnico		Ruanda	2014	2017-02-22 23:02:16.960222	2017-02-22 23:02:16.960222	\N	\N
340	0	Sebastian Ignacio Lorenzo	Leal	\N	2342-469875	Agrotecnico		Ruanda	2014	2017-02-22 23:02:16.966813	2017-02-22 23:02:16.966813	\N	\N
341	0	Agustin 	Amichetti	\N	2342-480950	Agrotecnico		Ruanda	2014	2017-02-22 23:02:16.973655	2017-02-22 23:02:16.973655	\N	\N
342	0	Matias	San Roque	\N	2342-411457	Agrotecnico		Ruanda	2014	2017-02-22 23:02:16.979647	2017-02-22 23:02:16.979647	\N	\N
343	0	Fermin 	Figuerón 	\N	2346-681696	Agrotecnico		China	2014	2017-02-22 23:02:16.986083	2017-02-22 23:02:16.986083	\N	\N
344	0	Maria Florencia	Barbieri	\N	2342-406141	Agrotecnico		China	2014	2017-02-22 23:02:16.992488	2017-02-22 23:02:16.992488	\N	\N
345	0	Micaela 	Carrano	\N	2342-408685	Agrotecnico		China	2014	2017-02-22 23:02:17.001968	2017-02-22 23:02:17.001968	\N	\N
346	0	Sebastían 	Boca	\N	\N	Normal		China	2014	2017-02-22 23:02:17.008577	2017-02-22 23:02:17.008577	\N	\N
347	0	Tatiana	Bielsa	\N	2342-449806	Normal		China	2014	2017-02-22 23:02:17.014529	2017-02-22 23:02:17.014529	\N	\N
348	0	Paulo 	Carballo	\N	2342-457373	Normal		Brasil	2014	2017-02-22 23:02:17.020867	2017-02-22 23:02:17.020867	\N	\N
349	0	Merlina	Sueyro	\N	2342-467432	Normal		Brasil	2014	2017-02-22 23:02:17.026755	2017-02-22 23:02:17.026755	\N	\N
350	0	Mariana 	Gatti	\N	2342-424344	Normal		Brasil	2014	2017-02-22 23:02:17.032965	2017-02-22 23:02:17.032965	\N	\N
351	0	Santiago	Ladaga	\N	2342-430554	Normal		Brasil	2014	2017-02-22 23:02:17.038614	2017-02-22 23:02:17.038614	\N	\N
352	0	Maria Luz 	Ithurrart	\N	2342-455781	Normal		Brasil	2014	2017-02-22 23:02:17.045724	2017-02-22 23:02:17.045724	\N	\N
353	0	Maria Fernanda	Struffolino	\N	2342-427823	Normal		Perú	2014	2017-02-22 23:02:17.052942	2017-02-22 23:02:17.052942	\N	\N
354	0	Gimena	Vazquez	\N	\N	Normal		Perú	2014	2017-02-22 23:02:17.059628	2017-02-22 23:02:17.059628	\N	\N
355	0	Ornella	Golfetto	\N	2342-463795	Normal		Perú	2014	2017-02-22 23:02:17.065823	2017-02-22 23:02:17.065823	\N	\N
356	0	Narela Lucia	Biancato	\N	2342-456101	Normal		Perú	2014	2017-02-22 23:02:17.071535	2017-02-22 23:02:17.071535	\N	\N
357	0	Camila	Guidi	\N	2342-427411	Normal		Perú	2014	2017-02-22 23:02:17.078425	2017-02-22 23:02:17.078425	\N	\N
363	0	Oriana	Raffo	\N	2342-504649	San Jose		Egipto	2014	2017-02-22 23:02:17.119646	2017-02-22 23:02:17.119646	\N	\N
364	0	Maria Eugenia	Sarranz Ibáñez	\N	2342-461292	San Jose		Egipto	2014	2017-02-22 23:02:17.132587	2017-02-22 23:02:17.132587	\N	\N
365	0	Julieta Anahí	Uranga	\N	2342-411883	San Jose		Egipto	2014	2017-02-22 23:02:17.138391	2017-02-22 23:02:17.138391	\N	\N
366	0	Juan Martin	Hernandez	\N	2342-423201	Normal		Paraguay	2014	2017-02-22 23:02:17.144736	2017-02-22 23:02:17.144736	\N	\N
367	0	Francisco 	Fernandez	\N	2342-408174	Normal		Paraguay	2014	2017-02-22 23:02:17.151025	2017-02-22 23:02:17.151025	\N	\N
368	0	Luciano Manuel	Fernandez	\N	2342-403438	Normal		Paraguay	2014	2017-02-22 23:02:17.156484	2017-02-22 23:02:17.156484	\N	\N
369	0	Martin 	Duhalde	\N	2342-465986	Normal		Paraguay	2014	2017-02-22 23:02:17.161915	2017-02-22 23:02:17.161915	\N	\N
370	0	Lorenzo	Diaz Videla	\N	2342-450266	Normal		Paraguay	2014	2017-02-22 23:02:17.167138	2017-02-22 23:02:17.167138	\N	\N
371	0	Valentin	Laborde	\N	2342-466821	Normal		Arabia Saudita	2014	2017-02-22 23:02:17.172461	2017-02-22 23:02:17.172461	\N	\N
372	0	Fermin	Guillot	\N	2342-404828	Normal		Arabia Saudita	2014	2017-02-22 23:02:17.17772	2017-02-22 23:02:17.17772	\N	\N
373	0	Joaquin	Exposito	\N	2342-515805	Normal		Arabia Saudita	2014	2017-02-22 23:02:17.183042	2017-02-22 23:02:17.183042	\N	\N
374	0	Enzo Gabriel	Fernandez	\N	2342-511483	Normal		España	2014	2017-02-22 23:02:17.188433	2017-02-22 23:02:17.188433	\N	\N
657	1	Valentin	Garcia	\N	2342-460285	Normal		\N	2014	2017-02-22 23:02:44.646365	2017-02-22 23:02:44.646365	\N	\N
375	0	Valentina	Vidarte Araoz	\N	2342-446948	Normal		España	2014	2017-02-22 23:02:17.194252	2017-02-22 23:02:17.194252	\N	\N
376	0	Delfina	Posadas Morales	\N	2342-426191	Normal		España	2014	2017-02-22 23:02:17.200734	2017-02-22 23:02:17.200734	\N	\N
377	0	Joaquín	Gauna	\N	2342-465750	Normal		España	2014	2017-02-22 23:02:17.206901	2017-02-22 23:02:17.206901	\N	\N
378	0	Agustina	Irioni	\N	2342-458124	Normal		España	2014	2017-02-22 23:02:17.214009	2017-02-22 23:02:17.214009	\N	\N
379	0	Paloma	Heredia Latorre	\N	2342-409054	Normal		Alemania	2014	2017-02-22 23:02:17.220392	2017-02-22 23:02:17.220392	\N	\N
380	0	Camila	Corral Morossino	\N	2342-411438	Normal		Alemania	2014	2017-02-22 23:02:17.227374	2017-02-22 23:02:17.227374	\N	\N
381	0	Julian	Aristi	\N	2346-458785	Normal		Alemania	2014	2017-02-22 23:02:17.23431	2017-02-22 23:02:17.23431	\N	\N
382	0	Juan Ignacio	Deniz	\N	2342-461309	Normal		Bolivia	2014	2017-02-22 23:02:17.241044	2017-02-22 23:02:17.241044	\N	\N
383	0	Ignacio	Caprissi	\N	2342-457121	Normal		Bolivia	2014	2017-02-22 23:02:17.248	2017-02-22 23:02:17.248	\N	\N
384	0	Lucia	Casado	\N	2954-540399	Normal		Bolivia	2014	2017-02-22 23:02:17.255447	2017-02-22 23:02:17.255447	\N	\N
385	0	Joaquin 	De Risio	\N	2342-484429	Normal		Bolivia	2014	2017-02-22 23:02:17.262666	2017-02-22 23:02:17.262666	\N	\N
386	0	Facundo	Loriente	\N	2342-406612	Normal		Bolivia	2014	2017-02-22 23:02:17.269664	2017-02-22 23:02:17.269664	\N	\N
387	0	Ignacio	Barcus	\N	2342-409472	Normal		Nicaragua	2014	2017-02-22 23:02:17.277825	2017-02-22 23:02:17.277825	\N	\N
388	0	Gonzalo Nicolas	Aliano	\N	\N	Normal		Nicaragua	2014	2017-02-22 23:02:17.283976	2017-02-22 23:02:17.283976	\N	\N
389	0	Federico	Astuni	\N	\N	Normal		Nicaragua	2014	2017-02-22 23:02:17.289978	2017-02-22 23:02:17.289978	\N	\N
390	0	Valentin 	Menendez	\N	2342-458483	Normal		Nicaragua	2014	2017-02-22 23:02:17.295404	2017-02-22 23:02:17.295404	\N	\N
391	0	Julieta	Bonora	\N	\N	Normal		Nicaragua	2014	2017-02-22 23:02:17.301289	2017-02-22 23:02:17.301289	\N	\N
392	0	Lourdes	Ciotti	\N	2342-461817	Normal		República Arabe Siria	2014	2017-02-22 23:02:17.310627	2017-02-22 23:02:17.310627	\N	\N
393	0	Juan Martin	Comas	\N	2346-656588	Normal		República Arabe Siria	2014	2017-02-22 23:02:17.318403	2017-02-22 23:02:17.318403	\N	\N
394	0	Maria Martina	Aime	\N	2342-513647	Normal		República Arabe Siria	2014	2017-02-22 23:02:17.325442	2017-02-22 23:02:17.325442	\N	\N
395	0	Milagros Maitena	Sáez	\N	2342-421926	Agrotécnico		Ucrania	2014	2017-02-22 23:02:17.333233	2017-02-22 23:02:17.333233	\N	\N
396	0	Alejo	Tancredi	\N	2342-445546	Agrotécnico		Ucrania	2014	2017-02-22 23:02:17.342035	2017-02-22 23:02:17.342035	\N	\N
397	0	Franco	Barbaglia	\N	2342-430657	Agrotécnico		Ucrania	2014	2017-02-22 23:02:17.347629	2017-02-22 23:02:17.347629	\N	\N
401	0	Aldana 	Altieri	\N	2342-504773	Normal		Tailandia	2014	2017-02-22 23:02:17.37286	2017-02-22 23:02:17.37286	\N	\N
402	0	Ana Laura	Grona	\N	2342-467029	Normal		Tailandia	2014	2017-02-22 23:02:17.379546	2017-02-22 23:02:17.379546	\N	\N
403	0	Candela	Lemos	\N	2342-461602	Normal		Tailandia	2014	2017-02-22 23:02:17.386417	2017-02-22 23:02:17.386417	\N	\N
407	0	Gaspar	Roldán	\N	\N			República Democrática del Congo	2014	2017-02-22 23:02:17.411999	2017-02-22 23:02:17.411999	\N	\N
408	0	Candela Natali	Biana Morossini	\N	2342-480476	Normal		República Democrática del Congo	2014	2017-02-22 23:02:17.41775	2017-02-22 23:02:17.41775	\N	\N
409	0	Axel Leonel	Mendez Molina	\N	2342-405174	Normal		República Democrática del Congo	2014	2017-02-22 23:02:17.423384	2017-02-22 23:02:17.423384	\N	\N
410	0	Gianluca	Belando	\N	2342-487958	Normal		Sudáfrica	2014	2017-02-22 23:02:17.429415	2017-02-22 23:02:17.429415	\N	\N
411	0	Camila	Fernandez	\N	2342-513017	Normal		Sudáfrica	2014	2017-02-22 23:02:17.435932	2017-02-22 23:02:17.435932	\N	\N
412	0	Maria Belen	Bondoni	\N	\N	Normal		Sudáfrica	2014	2017-02-22 23:02:17.445358	2017-02-22 23:02:17.445358	\N	\N
413	0	Malena	Cittadini	\N	2342-453906	Normal		Camerún	2014	2017-02-22 23:02:17.451317	2017-02-22 23:02:17.451317	\N	\N
414	0	Celina	Pildain	\N	2342-510745	Normal		Camerún	2014	2017-02-22 23:02:17.457097	2017-02-22 23:02:17.457097	\N	\N
415	0	Diego Armando	Yaffaldano	\N	2342-430353	Normal		Camerún	2014	2017-02-22 23:02:17.463207	2017-02-22 23:02:17.463207	\N	\N
419	0	Matias Ezequiel	Carpignano Orellano	\N	2342-460613	Nacional		Francia	2014	2017-02-22 23:02:17.485296	2017-02-22 23:02:17.485296	\N	\N
420	0	Patricia Noemí	Sanchez	\N	2342-534088	Nacional		Francia	2014	2017-02-22 23:02:17.490565	2017-02-22 23:02:17.490565	\N	\N
421	0	Alan Isaias	Marino Frutos	\N	2342-401672	Nacional		Francia	2014	2017-02-22 23:02:17.4964	2017-02-22 23:02:17.4964	\N	\N
422	0	Brenda Camila	Fernandez	\N	2342-506907	Nacional		Francia	2014	2017-02-22 23:02:17.503149	2017-02-22 23:02:17.503149	\N	\N
423	0	Irina Nazarena Itati	Sosa	\N	2342-534673	Nacional		Francia	2014	2017-02-22 23:02:17.510127	2017-02-22 23:02:17.510127	\N	\N
424	0	Conrado Agustin	Lopez Costa	\N	0221-155379917	Inchausti		Costa de Marfil	2014	2017-02-22 23:02:17.518398	2017-02-22 23:02:17.518398	\N	\N
425	0	Matias Adrian	Vallarino	\N	2346-681406	Inchausti		Costa de Marfil	2014	2017-02-22 23:02:17.523865	2017-02-22 23:02:17.523865	\N	\N
426	0	Mariano	Enrico	\N	2345-427327	Inchausti		Costa de Marfil	2014	2017-02-22 23:02:17.529206	2017-02-22 23:02:17.529206	\N	\N
427	0	Belen	Gelsomino	\N	\N	Normal		Luxemburgo	2014	2017-02-22 23:02:17.534547	2017-02-22 23:02:17.534547	\N	\N
428	0	Carola	Castro	\N	\N	Normal		Luxemburgo	2014	2017-02-22 23:02:17.539946	2017-02-22 23:02:17.539946	\N	\N
429	0	Stefania	Parra	\N	\N	Normal		Luxemburgo	2014	2017-02-22 23:02:17.548782	2017-02-22 23:02:17.548782	\N	\N
430	0	Rita	Martignone	\N	\N	Normal		Luxemburgo	2014	2017-02-22 23:02:17.554328	2017-02-22 23:02:17.554328	\N	\N
431	0	Micaela	Molfeso	\N	\N	Normal		Luxemburgo	2014	2017-02-22 23:02:17.560142	2017-02-22 23:02:17.560142	\N	\N
432	0	Antonella 	Lance	\N	\N	25.0		Marruecos	2014	2017-02-22 23:02:17.566103	2017-02-22 23:02:17.566103	\N	\N
433	0	Belen 	Gentile	\N	\N	25.0		Marruecos	2014	2017-02-22 23:02:17.571722	2017-02-22 23:02:17.571722	\N	\N
434	0	Rocio 	Cabrera	\N	\N	25.0		Marruecos	2014	2017-02-22 23:02:17.57767	2017-02-22 23:02:17.57767	\N	\N
435	0	Magalí	Lorenzo	\N	\N	25.0		India	2014	2017-02-22 23:02:17.58339	2017-02-22 23:02:17.58339	\N	\N
436	0	Giana	Scarponi	\N	\N	25.0		India	2014	2017-02-22 23:02:17.593621	2017-02-22 23:02:17.593621	\N	\N
437	0	Matias	Huerga	\N	\N	25.0		India	2014	2017-02-22 23:02:17.600266	2017-02-22 23:02:17.600266	\N	\N
438	0	Paulina	Contreras	\N	\N	Alberti		Angola	2014	2017-02-22 23:02:17.605894	2017-02-22 23:02:17.605894	\N	\N
439	0	Paula 	Alonso	\N	\N	Alberti		Angola	2014	2017-02-22 23:02:17.612655	2017-02-22 23:02:17.612655	\N	\N
440	0	Luca Joel	Matucheski	\N	\N	Alberti		Angola	2014	2017-02-22 23:02:17.619203	2017-02-22 23:02:17.619203	\N	\N
441	0	Gonzalo 	Kenny Novillo	\N	\N	Alberti		El Salvador	2014	2017-02-22 23:02:17.625242	2017-02-22 23:02:17.625242	\N	\N
442	0	Maria Paz	Curti Chavero	\N	\N	Alberti		El Salvador	2014	2017-02-22 23:02:17.630718	2017-02-22 23:02:17.630718	\N	\N
443	0	Jazmin 	Mosca	\N	\N	Alberti		El Salvador	2014	2017-02-22 23:02:17.636559	2017-02-22 23:02:17.636559	\N	\N
444	0	Esmeralda	Carretoni	\N	\N	Alberti		El Salvador	2014	2017-02-22 23:02:17.641924	2017-02-22 23:02:17.641924	\N	\N
445	0	Ivan	Meledy	\N	\N	Alberti		El Salvador	2014	2017-02-22 23:02:17.647362	2017-02-22 23:02:17.647362	\N	\N
446	0	Julieta	Bonora	\N	2342-482084	Escuela Normal	Bragado	  Republica Popular de China	2015	2017-02-22 23:02:32.107215	2017-02-22 23:02:32.107215	\N	\N
447	0	Lorenzo 	Diaz Videla	\N	2342-471184	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.119396	2017-02-22 23:02:32.119396	\N	\N
448	0	Ivan	Palacios	\N	423561.0	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.13579	2017-02-22 23:02:32.13579	\N	\N
449	0	Sofia Antonella	Talfumera	\N	2342-470283	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.142533	2017-02-22 23:02:32.142533	\N	\N
450	0	Luciano Manuel	Fernadez	\N	2342-403438	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.163501	2017-02-22 23:02:32.163501	\N	\N
451	0	Lucas 	Moraglio 	\N	2342-413376	Escuela Normal	Bragado	Corea del Sur	2015	2017-02-22 23:02:32.173133	2017-02-22 23:02:32.173133	\N	\N
452	0	Joaquin	De Risio	\N	2342-484429	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.18161	2017-02-22 23:02:32.18161	\N	\N
453	0	Lucía	Casado	\N	2954540399.0	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.202215	2017-02-22 23:02:32.202215	\N	\N
454	0	Dolores	Menendez	\N	2342-458443	Escuela Normal	Bragado	Panama	2015	2017-02-22 23:02:32.210266	2017-02-22 23:02:32.210266	\N	\N
455	0	Maria Martina	Aime	\N	2342-513647	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.217017	2017-02-22 23:02:32.217017	\N	\N
456	0	Paloma	Latorre Heredia	\N	2342-409054	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.223305	2017-02-22 23:02:32.223305	\N	\N
457	0	Lucila	Roldan Ottaviano	\N	2342-401884	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.229563	2017-02-22 23:02:32.229563	\N	\N
458	0	Lourdes	Gastaldo	\N	2342-400167	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.2355	2017-02-22 23:02:32.2355	\N	\N
459	0	Clara Mariana	De Renzis	\N	2342-403062	Escuela Normal	Bragado	 ESPAÑA (REINO DE ESPAÑA)	2015	2017-02-22 23:02:32.241237	2017-02-22 23:02:32.241237	\N	\N
460	0	Ana Clara	Romeo	\N	2342-452035	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.248665	2017-02-22 23:02:32.248665	\N	\N
461	0	Luisetto	Gala	\N	2342-540366	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.257934	2017-02-22 23:02:32.257934	\N	\N
462	0	Mariana	Polizzi	\N	2342-454475	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.266507	2017-02-22 23:02:32.266507	\N	\N
463	0	Pedro Damián 	Troyano	\N	2342 - 455222	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.273903	2017-02-22 23:02:32.273903	\N	\N
464	0	Mariano	Mederos	\N	2342-410505	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.285532	2017-02-22 23:02:32.285532	\N	\N
465	0	Manuel	Gomez Ros	\N	2342-480536	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.294633	2017-02-22 23:02:32.294633	\N	\N
466	0	Maria Luz 	Scotti 	\N	2342-454116	Escuela Normal	Bragado 	          VENEZUELA	2015	2017-02-22 23:02:32.301054	2017-02-22 23:02:32.301054	\N	\N
467	0	Felicitas	Recalde	\N	2342-421296	Escuela Normal	Bragado 	\N	2015	2017-02-22 23:02:32.307181	2017-02-22 23:02:32.307181	\N	\N
468	0	Ernesto Alejandro	Araya Paez	\N	2342-511637	Escuela Normal	Bragado 	\N	2015	2017-02-22 23:02:32.315881	2017-02-22 23:02:32.315881	\N	\N
469	0	Enzo 	Bonansea	\N	2342-426461	Escuela Normal	Bragado 	\N	2015	2017-02-22 23:02:32.327029	2017-02-22 23:02:32.327029	\N	\N
470	0	Amparo	Hernandez	\N	2342-456108	Escuela Normal	Bragado 	\N	2015	2017-02-22 23:02:32.334793	2017-02-22 23:02:32.334793	\N	\N
471	0	Florencia	Pujol	\N	2342-414945	Escuela Normal	Bragado 	\N	2015	2017-02-22 23:02:32.342665	2017-02-22 23:02:32.342665	\N	\N
472	0	Alessandro	Bondoni	\N	\N	Escuela Normal	Bragado 	\N	2015	2017-02-22 23:02:32.350934	2017-02-22 23:02:32.350934	\N	\N
473	0	Fermin	Guillot	\N	2342-404828	Escuela Normal	Bragado 	  Nueva Zelanda 	2015	2017-02-22 23:02:32.360534	2017-02-22 23:02:32.360534	\N	\N
474	0	Valentina	Iannino	\N	2342-515171	Escuela Normal	Bragado 	\N	2015	2017-02-22 23:02:32.372117	2017-02-22 23:02:32.372117	\N	\N
475	0	Juan Ignacio	Deniz	\N	2342-505014	Escuela Normal	Bragado 	\N	2015	2017-02-22 23:02:32.387399	2017-02-22 23:02:32.387399	\N	\N
476	0	Antonella	Gastaldi	\N	2342-414945	Escuela Normal	Bragado 	\N	2015	2017-02-22 23:02:32.399258	2017-02-22 23:02:32.399258	\N	\N
477	0	Vicente	Molina	\N	2342-505619	Escuela Normal	Bragado 	\N	2015	2017-02-22 23:02:32.406078	2017-02-22 23:02:32.406078	\N	\N
478	0	Juan Martin	Comas 	\N	2342-514229	Escuela Normal	Bragado 	Ecuador	2015	2017-02-22 23:02:32.4123	2017-02-22 23:02:32.4123	\N	\N
479	0	Brenda	Bussi	\N	2342-458159	Escuela Normal	Bragado 	\N	2015	2017-02-22 23:02:32.41888	2017-02-22 23:02:32.41888	\N	\N
480	0	Victoria Pilar	Barbero 	\N	\N	Escuela Normal	Bragado 	\N	2015	2017-02-22 23:02:32.425518	2017-02-22 23:02:32.425518	\N	\N
481	0	Maria Luz 	Perez Del Olmo	\N	\N	Escuela Normal	Bragado 	\N	2015	2017-02-22 23:02:32.432095	2017-02-22 23:02:32.432095	\N	\N
482	0	Santiago	Solda	\N	011-57552995	Escuela Normal	Bragado 	\N	2015	2017-02-22 23:02:32.437762	2017-02-22 23:02:32.437762	\N	\N
483	0	Tomas	Laborde	\N	2342-505014	Escuela Normal	Bragado	Mexico	2015	2017-02-22 23:02:32.443891	2017-02-22 23:02:32.443891	\N	\N
484	0	Raul Carlos	Mendizabal	\N	2342-409092	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.450428	2017-02-22 23:02:32.450428	\N	\N
485	0	Ramiro	Degenhardt	\N	2342-505619	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.457138	2017-02-22 23:02:32.457138	\N	\N
486	0	Mauricio 	Icardi	\N	2342-426114/421296	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.465161	2017-02-22 23:02:32.465161	\N	\N
487	0	Facundo	Hernandez	\N	2342-455851	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.470744	2017-02-22 23:02:32.470744	\N	\N
488	0	Pedro	Starna	\N	2342-421366	Escuela Normal	Bragado	Cuba	2015	2017-02-22 23:02:32.477112	2017-02-22 23:02:32.477112	\N	\N
489	0	Valentina	Bracco	\N	2342-491446	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.483442	2017-02-22 23:02:32.483442	\N	\N
490	0	Valentina	Vives 	\N	2342-425201	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.491431	2017-02-22 23:02:32.491431	\N	\N
491	0	Camila	Solda	\N	011-57552995	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.499166	2017-02-22 23:02:32.499166	\N	\N
492	0	Amparo	Argonz	\N	\N	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.506192	2017-02-22 23:02:32.506192	\N	\N
493	0	Valentina	Aburruza	\N	\N	Escuela Normal	Bragado	Irak	2015	2017-02-22 23:02:32.515984	2017-02-22 23:02:32.515984	\N	\N
494	0	Malena	Cittadini	\N	\N	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.523259	2017-02-22 23:02:32.523259	\N	\N
495	0	Delfina	Malfato	\N	2342-462708/487794	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.530325	2017-02-22 23:02:32.530325	\N	\N
496	0	Julieta	Decibe	\N	2342-544148	Escuela Normal	Bragado	Alemania	2015	2017-02-22 23:02:32.537031	2017-02-22 23:02:32.537031	\N	\N
497	0	Vivian Andrea	Abelardo 	\N	2342-483246	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.543251	2017-02-22 23:02:32.543251	\N	\N
498	0	Martina	Lopumo	\N	2342-401201	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.550218	2017-02-22 23:02:32.550218	\N	\N
499	0	Diego Armando	Yaffaldano	\N	2342-545917	Escuela Normal	Bragado	Israel	2015	2017-02-22 23:02:32.557419	2017-02-22 23:02:32.557419	\N	\N
500	0	Manuel	Cuesso	\N	2342-4311818	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.562909	2017-02-22 23:02:32.562909	\N	\N
501	0	Juan Cruz	Posadas Morales	\N	2342-414086	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.568591	2017-02-22 23:02:32.568591	\N	\N
502	0	Florencia Lara	Belen	\N	2342-509302	Agrotecnico	Bragado	HOnduras	2015	2017-02-22 23:02:32.574289	2017-02-22 23:02:32.574289	\N	\N
503	0	Juan Ignacio	Miceli	\N	011-64417127	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.580856	2017-02-22 23:02:32.580856	\N	\N
504	0	Lucía	Beraza 	\N	2342-458657	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.586741	2017-02-22 23:02:32.586741	\N	\N
505	0	Micaela	Tagliaferro	\N	2342-401064	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.592797	2017-02-22 23:02:32.592797	\N	\N
506	0	Luna Bianca 	Brumer	\N	2342-407497	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.598381	2017-02-22 23:02:32.598381	\N	\N
507	0	Jose Francisco	Morales Gomez	\N	2342-483882	La Limpia	Bragado	Marruecos	2015	2017-02-22 23:02:32.605178	2017-02-22 23:02:32.605178	\N	\N
508	0	Mateo	Moragas 	\N	\N	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.610985	2017-02-22 23:02:32.610985	\N	\N
509	0	Axel Leonel	Mendez Molina	\N	0342-467506(Santa Fe)	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.616788	2017-02-22 23:02:32.616788	\N	\N
510	0	Victoria	Bordon	\N	2342-510516	Escuela Normal	Bragado	Sudafrica	2015	2017-02-22 23:02:32.622876	2017-02-22 23:02:32.622876	\N	\N
511	0	Josefina	Arbeletche	\N	2342-424450/427067	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.63335	2017-02-22 23:02:32.63335	\N	\N
512	0	Daniela Sofia	Martinez Molina 	\N	2342-486627	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.6417	2017-02-22 23:02:32.6417	\N	\N
513	0	Lautaro	Benitez	\N	2342-401091	San Jose	Bragado	Peru	2015	2017-02-22 23:02:32.649263	2017-02-22 23:02:32.649263	\N	\N
514	0	Tatiana	Duberti Giordano	\N	2342-505014	San Jose	Bragado	\N	2015	2017-02-22 23:02:32.655309	2017-02-22 23:02:32.655309	\N	\N
515	0	Candelaria	Romero	\N	2342-465774	San Jose	Bragado	\N	2015	2017-02-22 23:02:32.661048	2017-02-22 23:02:32.661048	\N	\N
516	0	Eugenia	Sarranz Ibañez	\N	2342-461292	San Jose	Bragado	\N	2015	2017-02-22 23:02:32.670253	2017-02-22 23:02:32.670253	\N	\N
517	0	Julieta	Uranga 	\N	2342-411893	San Jose	Bragado	\N	2015	2017-02-22 23:02:32.675548	2017-02-22 23:02:32.675548	\N	\N
518	0	Gaspar 	Castillo 	\N	2346-687030	San Jose	Bragado	Malasia	2015	2017-02-22 23:02:32.680713	2017-02-22 23:02:32.680713	\N	\N
519	0	Yair Adan	Bonahora	\N	2342-425124	San Jose	Bragado	\N	2015	2017-02-22 23:02:32.685991	2017-02-22 23:02:32.685991	\N	\N
520	0	Irina	Alfonso	\N	2346-551320	San Jose	Bragado	\N	2015	2017-02-22 23:02:32.69162	2017-02-22 23:02:32.69162	\N	\N
521	0	Isabel	Laborde	\N	2342-533841	San Jose	Bragado	\N	2015	2017-02-22 23:02:32.697109	2017-02-22 23:02:32.697109	\N	\N
522	0	Maite Salome	Moral 	\N	2342-406420	San Jose	Bragado	\N	2015	2017-02-22 23:02:32.702888	2017-02-22 23:02:32.702888	\N	\N
523	0	Milagros	Ruggeri	\N	\N	San Jose	Bragado	Egipto	2015	2017-02-22 23:02:32.708143	2017-02-22 23:02:32.708143	\N	\N
524	0	Milagros	Romero	\N	\N	San Jose	Bragado	\N	2015	2017-02-22 23:02:32.713555	2017-02-22 23:02:32.713555	\N	\N
525	0	Delfina 	Sanes	\N	\N	San Jose	Bragado	\N	2015	2017-02-22 23:02:32.719126	2017-02-22 23:02:32.719126	\N	\N
526	0	Camila	Aragones	\N	2342-513597	San Jose	Bragado	           Corea del Norte	2015	2017-02-22 23:02:32.726049	2017-02-22 23:02:32.726049	\N	\N
527	0	Belen Agustina	Mira	\N	2342-413595	San Jose	Bragado	\N	2015	2017-02-22 23:02:32.732649	2017-02-22 23:02:32.732649	\N	\N
528	0	Paula	Baéz 	\N	2342-487540/487847	San Jose	Bragado	\N	2015	2017-02-22 23:02:32.73934	2017-02-22 23:02:32.73934	\N	\N
529	0	Juan Manuel	Anso	\N	2342-462698	Escuela Normal	Bragado	Republica Democr. del congo	2015	2017-02-22 23:02:32.745333	2017-02-22 23:02:32.745333	\N	\N
530	0	María Angela	Lousa 	\N	2342-505374	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.750916	2017-02-22 23:02:32.750916	\N	\N
531	0	María Belen	Bondoni	\N	2342-514426	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.756856	2017-02-22 23:02:32.756856	\N	\N
532	0	Bruno	Perafán	\N	2342-505748	Escuela Normal	Bragado	Francia	2015	2017-02-22 23:02:32.764462	2017-02-22 23:02:32.764462	\N	\N
533	0	Agustina	Carreras	\N	2342-400385	Comercio	Bragado	\N	2015	2017-02-22 23:02:32.773664	2017-02-22 23:02:32.773664	\N	\N
534	0	Lara	Mardegan 	\N	2342-466792	Comercio	Bragado	\N	2015	2017-02-22 23:02:32.779463	2017-02-22 23:02:32.779463	\N	\N
535	0	Lisandro José	León	\N	2342-480594	Comercio	Bragado	\N	2015	2017-02-22 23:02:32.784862	2017-02-22 23:02:32.784862	\N	\N
536	0	Ana Virginia	Heredia de la nieve	\N	2342-414050	Comercio	Bragado	\N	2015	2017-02-22 23:02:32.790301	2017-02-22 23:02:32.790301	\N	\N
537	0	Sofia	Islas	\N	2342-408317	Agrotecnico	Bragado	Paraguay	2015	2017-02-22 23:02:32.796563	2017-02-22 23:02:32.796563	\N	\N
538	0	Tomás Agustín	Prado	\N	2342-555964	Agrotecnico	Bragado	\N	2015	2017-02-22 23:02:32.803484	2017-02-22 23:02:32.803484	\N	\N
539	0	Agustina	Bertolotti	\N	2284-576675	Agrotecnico	Bragado	\N	2015	2017-02-22 23:02:32.810321	2017-02-22 23:02:32.810321	\N	\N
540	0	Leandro Daniel	Bocca	\N	2342-459266/ 427043	Agrotecnico	Bragado	\N	2015	2017-02-22 23:02:32.816969	2017-02-22 23:02:32.816969	\N	\N
541	0	Agustina Giselle	Valfin	\N	2342- 423938	Agrotecnico	Bragado	\N	2015	2017-02-22 23:02:32.824463	2017-02-22 23:02:32.824463	\N	\N
542	0	Ignacio	Caprissi	\N	2342-457921	Escuela Normal	Bragado	Andorra	2015	2017-02-22 23:02:32.831064	2017-02-22 23:02:32.831064	\N	\N
543	0	Tomás	Cornaglia	\N	2342-400464	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.837293	2017-02-22 23:02:32.837293	\N	\N
544	0	Sofía Ayelen	Poeta	\N	2346-414771	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.842664	2017-02-22 23:02:32.842664	\N	\N
545	0	Juan Martín	Hernandez	\N	2342-423201	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.848001	2017-02-22 23:02:32.848001	\N	\N
546	0	Camila	Luna	\N	2342-482377	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.85353	2017-02-22 23:02:32.85353	\N	\N
547	0	Agustín Alejandro	Bergonce	\N	2342-481737	Agrotecnico	Bragado	Brasil	2015	2017-02-22 23:02:32.858885	2017-02-22 23:02:32.858885	\N	\N
548	0	Valentín Leonardo	Lorenzo	\N	2342-454040	Agrotecnico	Bragado	\N	2015	2017-02-22 23:02:32.864596	2017-02-22 23:02:32.864596	\N	\N
549	0	Alex Facundo 	Islas	\N	2342-507723	Agrotecnico	Bragado	\N	2015	2017-02-22 23:02:32.870666	2017-02-22 23:02:32.870666	\N	\N
550	0	Franco	Saldaña Nigro	\N	2342-406886	Agrotecnico	Bragado	\N	2015	2017-02-22 23:02:32.878128	2017-02-22 23:02:32.878128	\N	\N
551	0	Agustin Ignacio	Ferri	\N	2342-425297	Agrotecnico	Bragado	\N	2015	2017-02-22 23:02:32.884747	2017-02-22 23:02:32.884747	\N	\N
552	0	Fermín	Colombo 	\N	2342-423043	Agrotecnico	Bragado	Chile	2015	2017-02-22 23:02:32.893702	2017-02-22 23:02:32.893702	\N	\N
553	0	Ariana	Gonzalez	\N	2342-467370	Agrotecnico	Bragado	\N	2015	2017-02-22 23:02:32.900275	2017-02-22 23:02:32.900275	\N	\N
554	0	Julieta	Ben Portinaro	\N	2342-470535	Agrotecnico	Bragado	\N	2015	2017-02-22 23:02:32.907341	2017-02-22 23:02:32.907341	\N	\N
555	0	Constante	Bersi	\N	2342-451640	Agrotecnico	Bragado	\N	2015	2017-02-22 23:02:32.915816	2017-02-22 23:02:32.915816	\N	\N
556	0	 Juana	Mendizabal	\N	2342-409092	Agrotecnico	Bragado	\N	2015	2017-02-22 23:02:32.924546	2017-02-22 23:02:32.924546	\N	\N
557	0	Laureana	Zubizarreta	\N	2342-403658	Agrotecnico	Bragado	\N	2015	2017-02-22 23:02:32.932097	2017-02-22 23:02:32.932097	\N	\N
558	0	Delfina	Figueras Bielsa	\N	2342-486774	Agrotecnico	Bragado	\N	2015	2017-02-22 23:02:32.940227	2017-02-22 23:02:32.940227	\N	\N
559	0	Maria Carola	Castro	\N	2325-565098	Escuela Normal	Bragado	Angola	2015	2017-02-22 23:02:32.948574	2017-02-22 23:02:32.948574	\N	\N
560	0	Azul	Ghezzi	\N	2342-425996	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.956616	2017-02-22 23:02:32.956616	\N	\N
561	0	Belén 	Gelsomino	\N	2342-423396	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.963626	2017-02-22 23:02:32.963626	\N	\N
562	0	Jean Carlos	Martinez Molina	\N	2342-486627	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.969019	2017-02-22 23:02:32.969019	\N	\N
563	0	Tatiana	Fernandez	\N	2342-469612	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.975174	2017-02-22 23:02:32.975174	\N	\N
564	0	Cristian Nicolás	Maldonado	\N	2342-485724	Escuela Normal	Bragado	 Chad	2015	2017-02-22 23:02:32.98176	2017-02-22 23:02:32.98176	\N	\N
565	0	Milagros Ayelen	Pellegrino 	\N	2342-512428	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:32.988137	2017-02-22 23:02:32.988137	\N	\N
566	0	Candela	Chacon	\N	2342-459504	Agrotecnico	Bragado	\N	2015	2017-02-22 23:02:32.994541	2017-02-22 23:02:32.994541	\N	\N
567	0	Alan José	Montiel	\N	2342-401165	Agrotecnico	Bragado	\N	2015	2017-02-22 23:02:33.001012	2017-02-22 23:02:33.001012	\N	\N
568	0	Milagros 	Cause	\N	2342-407652	Agrotecnico	Bragado	\N	2015	2017-02-22 23:02:33.008783	2017-02-22 23:02:33.008783	\N	\N
569	0	Juan Agustín	Yañez	\N	2342-403736	Agrotecnico	Bragado	Estados Unidos de America	2015	2017-02-22 23:02:33.016886	2017-02-22 23:02:33.016886	\N	\N
570	0	Milena	Antonov Panaioton	\N	2342-2342-445885	Agrotecnico	Bragado	\N	2015	2017-02-22 23:02:33.026109	2017-02-22 23:02:33.026109	\N	\N
571	0	Camila	Silva	\N	2342-406878	Agrotecnico	Bragado	\N	2015	2017-02-22 23:02:33.033924	2017-02-22 23:02:33.033924	\N	\N
572	0	Emiliano	Bruno	\N	2342-410417	Agrotecnico	Bragado	\N	2015	2017-02-22 23:02:33.03969	2017-02-22 23:02:33.03969	\N	\N
573	0	Maria Lucrecia	Barni	\N	2342-425825	Agrotecnico	Bragado	\N	2015	2017-02-22 23:02:33.045426	2017-02-22 23:02:33.045426	\N	\N
574	0	Martin	Perez	\N	2342-465498	Agrotecnico	Bragado	Nicaragua	2015	2017-02-22 23:02:33.050899	2017-02-22 23:02:33.050899	\N	\N
575	0	Valentina	Toscano	\N	2342-451058	Agrotecnico	Bragado	\N	2015	2017-02-22 23:02:33.056873	2017-02-22 23:02:33.056873	\N	\N
576	0	Maria  del Pilar	Vaccarezza	\N	2342-467950	Agrotecnico	Bragado	\N	2015	2017-02-22 23:02:33.062788	2017-02-22 23:02:33.062788	\N	\N
577	0	Jeremias Isaac	Lizareff	\N	2342-413191	Agrotecnico	Bragado	\N	2015	2017-02-22 23:02:33.068851	2017-02-22 23:02:33.068851	\N	\N
578	0	Lidia Eugenia	Barni	\N	2342-423185	Agrotecnico	Bragado	\N	2015	2017-02-22 23:02:33.074912	2017-02-22 23:02:33.074912	\N	\N
579	0	Camila	Corral Morossini	\N	2342-411438	Escuela Normal	Bragado	Costa rica	2015	2017-02-22 23:02:33.084995	2017-02-22 23:02:33.084995	\N	\N
580	0	Julian	Aristi	\N	2342-458785	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:33.099889	2017-02-22 23:02:33.099889	\N	\N
581	0	Joaquín	Vives	\N	2342-466111	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:33.107436	2017-02-22 23:02:33.107436	\N	\N
582	0	Laureano	Cid	\N	\N	Industrial	Bragado	\N	2015	2017-02-22 23:02:33.114806	2017-02-22 23:02:33.114806	\N	\N
583	0	Lara	Celayeta 	\N	2342-407519	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:33.122261	2017-02-22 23:02:33.122261	\N	\N
584	0	Tomas	Celerier	\N	2342-499960	Escuela Normal	Bragado 	Guatemala	2015	2017-02-22 23:02:33.129824	2017-02-22 23:02:33.129824	\N	\N
585	0	Pilar	Bondoni	\N	2342-504381	Escuela Normal	Bragado 	\N	2015	2017-02-22 23:02:33.137927	2017-02-22 23:02:33.137927	\N	\N
586	0	Celina	Pildain	\N	2342-510745	Escuela Normal	Bragado 	\N	2015	2017-02-22 23:02:33.147419	2017-02-22 23:02:33.147419	\N	\N
587	0	Agustina	Loriente	\N	2342-404027	Escuela Normal	Bragado 	\N	2015	2017-02-22 23:02:33.156303	2017-02-22 23:02:33.156303	\N	\N
588	0	Valentino	Milocco	\N	2342-406135	Escuela Normal	Bragado 	\N	2015	2017-02-22 23:02:33.165033	2017-02-22 23:02:33.165033	\N	\N
589	0	Tomás Rafael	Caro	\N	2342-509888	Agrotecnico	Bragado	Lituania	2015	2017-02-22 23:02:33.173377	2017-02-22 23:02:33.173377	\N	\N
590	0	Santiago	Suarez Arribalzaga	\N	2342-462992	Agrotecnico	Bragado	\N	2015	2017-02-22 23:02:33.18301	2017-02-22 23:02:33.18301	\N	\N
591	0	Fermín	Conde 	\N	2342-405316	Agrotecnico	Bragado	\N	2015	2017-02-22 23:02:33.190939	2017-02-22 23:02:33.190939	\N	\N
592	0	Diego Armando	Medina García	\N	2342-506127	Agrotecnico	Bragado	\N	2015	2017-02-22 23:02:33.198063	2017-02-22 23:02:33.198063	\N	\N
593	0	Bautista	Molfeso	\N	2342-452101	Agrotecnico	Bragado	\N	2015	2017-02-22 23:02:33.207397	2017-02-22 23:02:33.207397	\N	\N
594	0	Lucio	Manganiello	\N	2342-499248	Escuela Normal	Bragado	Siria	2015	2017-02-22 23:02:33.215573	2017-02-22 23:02:33.215573	\N	\N
595	0	Lucas	Albizu	\N	2342-404418	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:33.222064	2017-02-22 23:02:33.222064	\N	\N
596	0	Juan Ignacio	Avena	\N	2342-656894	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:33.229347	2017-02-22 23:02:33.229347	\N	\N
597	0	Hernán Nahuel	Lastra	\N	2342-408843	Agrotecnico	Bragado	Greenpeace	2015	2017-02-22 23:02:33.23688	2017-02-22 23:02:33.23688	\N	\N
598	0	Franco	Fenoglio	\N	2342-466175	Agrotecnico	Bragado	\N	2015	2017-02-22 23:02:33.244902	2017-02-22 23:02:33.244902	\N	\N
599	0	Amparo	Perez	\N	2342-456353	Escuela Normal	Bragado	Grecia	2015	2017-02-22 23:02:33.253573	2017-02-22 23:02:33.253573	\N	\N
600	0	Celestina	Contreras	\N	2342-467624	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:33.262355	2017-02-22 23:02:33.262355	\N	\N
601	0	Catalina	Ortiz	\N	2342-404901	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:33.270019	2017-02-22 23:02:33.270019	\N	\N
602	0	Maria Victoria	Alietti	\N	2342-408672	Escuela Normal	Bragado	Afganistan	2015	2017-02-22 23:02:33.278542	2017-02-22 23:02:33.278542	\N	\N
603	0	Tatiana	Quarleri	\N	2342-402127	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:33.286529	2017-02-22 23:02:33.286529	\N	\N
604	0	Victoria	Savalio	\N	2342-482830	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:33.293953	2017-02-22 23:02:33.293953	\N	\N
605	0	Tomas	Bevacqua	\N	2342-467851	Escuela Normal	Bragado	Somalia	2015	2017-02-22 23:02:33.30163	2017-02-22 23:02:33.30163	\N	\N
606	0	Francisco 	Hidalgo	\N	2346-588868	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:33.31225	2017-02-22 23:02:33.31225	\N	\N
607	0	Valentin	Laborde	\N	2342-534029	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:33.325389	2017-02-22 23:02:33.325389	\N	\N
608	0	Milagros	Saez 	\N	2342-510586	Escuela Normal	Bragado	Ruanda	2015	2017-02-22 23:02:33.336302	2017-02-22 23:02:33.336302	\N	\N
609	0	Evelyn	Bonnin	\N	2342-471630	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:33.346022	2017-02-22 23:02:33.346022	\N	\N
610	0	Trinidad	Peralta	\N	\N	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:33.356548	2017-02-22 23:02:33.356548	\N	\N
611	0	Leo	Beltran	\N	2342-534645	San Jose	Bragado	Reino Unido	2015	2017-02-22 23:02:33.365179	2017-02-22 23:02:33.365179	\N	\N
612	0	Harold	Marquina Cvezo	\N	11-36119942	San Jose	Bragado	\N	2015	2017-02-22 23:02:33.374264	2017-02-22 23:02:33.374264	\N	\N
613	0	Juan	Neri	\N	2342-407195	San Jose	Bragado	\N	2015	2017-02-22 23:02:33.383057	2017-02-22 23:02:33.383057	\N	\N
614	0	JOaquin	Beccar	\N	2342-403785	San Jose	Bragado	\N	2015	2017-02-22 23:02:33.391352	2017-02-22 23:02:33.391352	\N	\N
615	0	Francisco	Marini	\N	2342-508154	San Jose	Bragado	\N	2015	2017-02-22 23:02:33.401535	2017-02-22 23:02:33.401535	\N	\N
616	0	Florencia	Ibarguren	\N	2342-484393	Comercial	Bragado	Sudan	2015	2017-02-22 23:02:33.410321	2017-02-22 23:02:33.410321	\N	\N
617	0	Magalí Belen 	Petteta	\N	2227-623037	Comercial	Bragado	\N	2015	2017-02-22 23:02:33.419417	2017-02-22 23:02:33.419417	\N	\N
618	0	Martín	Piazza	\N	2342-426798	Comercial	Bragado	\N	2015	2017-02-22 23:02:33.429842	2017-02-22 23:02:33.429842	\N	\N
619	0	Juan Rodrigo	Pereyra	\N	2342-463042	Tecnica	Bragado	Portugal	2015	2017-02-22 23:02:33.43927	2017-02-22 23:02:33.43927	\N	\N
620	0	Ignacio	Coria	\N	2342-465018	Tecnica	Bragado	\N	2015	2017-02-22 23:02:33.448891	2017-02-22 23:02:33.448891	\N	\N
621	0	Diana	Matarozzi	\N	2342-480369	Tecnica	Bragado	\N	2015	2017-02-22 23:02:33.458881	2017-02-22 23:02:33.458881	\N	\N
622	0	Leonardo David	Rodriguez	\N	2342-556049	Tecnica	Bragado	\N	2015	2017-02-22 23:02:33.468795	2017-02-22 23:02:33.468795	\N	\N
623	0	Enzo	Garay	\N	2342-422648	Tecnica	Bragado	\N	2015	2017-02-22 23:02:33.475792	2017-02-22 23:02:33.475792	\N	\N
624	0	Josefina	Bouissou	\N	2392-639985	Los Maldanos	Trenque Lauquen	\N	2015	2017-02-22 23:02:33.483394	2017-02-22 23:02:33.483394	\N	\N
625	0	Guido	Carena 	\N	2392-519547	Los Maldanos	Trenque Lauquen	\N	2015	2017-02-22 23:02:33.490675	2017-02-22 23:02:33.490675	\N	\N
626	0	Simon	Elias COt	\N	\N	alberti		BOLIVIA	2015	2017-02-22 23:02:33.498397	2017-02-22 23:02:33.498397	\N	\N
627	0	Manuel	Robies	\N	\N	alberti		\N	2015	2017-02-22 23:02:33.507365	2017-02-22 23:02:33.507365	\N	\N
628	0	Sofia	Bergamini	\N	\N	alberti		\N	2015	2017-02-22 23:02:33.514147	2017-02-22 23:02:33.514147	\N	\N
629	0	Maria del Rosario	Ponce	\N	\N	alberti		\N	2015	2017-02-22 23:02:33.522336	2017-02-22 23:02:33.522336	\N	\N
630	0	Maria Itati	GUidozzolo	\N	\N	alberti		\N	2015	2017-02-22 23:02:33.530435	2017-02-22 23:02:33.530435	\N	\N
631	0	Melisa	Rizzo	\N	2342-554078	Nacional	Bragado	ARGENTINA	2015	2017-02-22 23:02:33.537591	2017-02-22 23:02:33.537591	\N	\N
632	0	Valentina	Iglesias	\N	\N	Nacional	Bragado	\N	2015	2017-02-22 23:02:33.546045	2017-02-22 23:02:33.546045	\N	\N
633	0	Fernando	Gomez	\N	2342-446377	Nacional	Bragado	\N	2015	2017-02-22 23:02:33.554131	2017-02-22 23:02:33.554131	\N	\N
634	0	Alan 	Marino Frutos	\N	2342-485163	Nacional	Bragado	\N	2015	2017-02-22 23:02:33.563018	2017-02-22 23:02:33.563018	\N	\N
635	0	Irina	Sosa	\N	2342-534673	Nacional	Bragado	\N	2015	2017-02-22 23:02:33.570911	2017-02-22 23:02:33.570911	\N	\N
636	0	Antonella	Coronel	\N	2342-464237	Nacional	bragado	Federacion Rusa	2015	2017-02-22 23:02:33.581301	2017-02-22 23:02:33.581301	\N	\N
637	0	Patricia	Sanchez	\N	2342-546802	Nacional	bragado	\N	2015	2017-02-22 23:02:33.58905	2017-02-22 23:02:33.58905	\N	\N
638	0	Matias	Carpignano	\N	2342-460613	Nacional	bragado	\N	2015	2017-02-22 23:02:33.596201	2017-02-22 23:02:33.596201	\N	\N
639	0	Candela Natalia	Biana Morossini	\N	2342-480476	Nacional	bragado	\N	2015	2017-02-22 23:02:33.603595	2017-02-22 23:02:33.603595	\N	\N
640	0	kevin osmar	demicheli	\N	2342-556276	Nacional	bragado	\N	2015	2017-02-22 23:02:33.613793	2017-02-22 23:02:33.613793	\N	\N
641	0	Camila	Vera	\N	2346-569353	Agrotecnico	Bragado	Colombia	2015	2017-02-22 23:02:33.626001	2017-02-22 23:02:33.626001	\N	\N
642	0	Guadalupe	Goncalves	\N	2342-455673	Agrotecnico	Bragado	\N	2015	2017-02-22 23:02:33.634454	2017-02-22 23:02:33.634454	\N	\N
643	0	Maria Belen	Mendez	\N	2342-468470	Agrotecnico	Bragado	\N	2015	2017-02-22 23:02:33.64294	2017-02-22 23:02:33.64294	\N	\N
644	0	Ciro	Belardinelli	\N	2342-505623	Agrotecnico	Bragado	\N	2015	2017-02-22 23:02:33.65097	2017-02-22 23:02:33.65097	\N	\N
645	0	Francisco	Macario Mitchell	\N	2342-485992	Agrotecnico	Bragado	\N	2015	2017-02-22 23:02:33.659543	2017-02-22 23:02:33.659543	\N	\N
646	0	enzo	coppola	\N	2342-483959	Agrotecnico	Bragado	yemen	2015	2017-02-22 23:02:33.667532	2017-02-22 23:02:33.667532	\N	\N
647	0	nicolas	gimenez	\N	2342-403810	Agrotecnico	Bragado	\N	2015	2017-02-22 23:02:33.674242	2017-02-22 23:02:33.674242	\N	\N
648	0	franco	Petegoli	\N	2342-507384	Agrotecnico	Bragado	\N	2015	2017-02-22 23:02:33.681142	2017-02-22 23:02:33.681142	\N	\N
649	0	Victor	Troilo 	\N	2317-555488		25.0	japon	2015	2017-02-22 23:02:33.687763	2017-02-22 23:02:33.687763	\N	\N
650	0	Sebastian	Vicente	\N	2314-491128		25.0	\N	2015	2017-02-22 23:02:33.694944	2017-02-22 23:02:33.694944	\N	\N
651	0	Juan Pablo	Acosta	\N	2345-527289		25.0	\N	2015	2017-02-22 23:02:33.706244	2017-02-22 23:02:33.706244	\N	\N
652	0	Julian	Besada	\N	2342-400713		Inchausti	jordania	2015	2017-02-22 23:02:33.729919	2017-02-22 23:02:33.729919	\N	\N
653	0	Conrado	Lopez Costa	\N	221-5379917		Inchausti	\N	2015	2017-02-22 23:02:33.748663	2017-02-22 23:02:33.748663	\N	\N
654	0	Tomas	Rebottaro	\N	2317-418806		Inchausti	\N	2015	2017-02-22 23:02:33.764503	2017-02-22 23:02:33.764503	\N	\N
655	0	Ramiro Gustavo	Ongaro	\N	2317-452480		Inchausti	\N	2015	2017-02-22 23:02:33.772605	2017-02-22 23:02:33.772605	\N	\N
656	0	Mariano	Enrico	\N	2345-427327		Inchausti	\N	2015	2017-02-22 23:02:33.780244	2017-02-22 23:02:33.780244	\N	\N
658	1	Constanza	Taberner	\N	2342-448320	Nacional		\N	2014	2017-02-22 23:02:44.679735	2017-02-22 23:02:44.679735	\N	\N
659	1	Diego Ezequiel	Torres	\N	2342-454769	San Jose		\N	2014	2017-02-22 23:02:44.71461	2017-02-22 23:02:44.71461	\N	\N
660	1	Nataly	Delettieres	\N	2342-406976	San Jose		\N	2014	2017-02-22 23:02:44.751748	2017-02-22 23:02:44.751748	\N	\N
661	1	María Luz	Rosales	\N	2342-404573	San Jose		\N	2014	2017-02-22 23:02:44.769992	2017-02-22 23:02:44.769992	\N	\N
662	1	Melina	Alessandrini	\N	2342-402511	Normal		\N	2014	2017-02-22 23:02:44.798873	2017-02-22 23:02:44.798873	\N	\N
663	1	Florencia	Pollini	\N	2342-404903	Normal		\N	2014	2017-02-22 23:02:44.835861	2017-02-22 23:02:44.835861	\N	\N
664	1	Martina	Lopez Galante	\N	2342-407793	Normal		\N	2014	2017-02-22 23:02:44.87051	2017-02-22 23:02:44.87051	\N	\N
665	1	Pedro	Aresti	\N	2342-403878	E.E.S N°7		\N	2014	2017-02-22 23:02:44.907845	2017-02-22 23:02:44.907845	\N	\N
666	1	Federico	Oscos	\N	2342-511140	Normal		\N	2014	2017-02-22 23:02:44.935665	2017-02-22 23:02:44.935665	\N	\N
667	1	Maria Guadalupe	Coronel	\N	2342-980695	Normal		\N	2014	2017-02-22 23:02:44.955205	2017-02-22 23:02:44.955205	\N	\N
668	1	Gonzalo	Hervalejo	\N	2342-455316	Normal		\N	2014	2017-02-22 23:02:44.967739	2017-02-22 23:02:44.967739	\N	\N
669	1	Maira	Albornoz	\N	2342-404857	San Jose		\N	2014	2017-02-22 23:02:45.005055	2017-02-22 23:02:45.005055	\N	\N
670	1	Maitena	Barros	\N	2342-465572	Normal		\N	2014	2017-02-22 23:02:45.022478	2017-02-22 23:02:45.022478	\N	\N
671	1	Francisca 	Belamendia	\N	2342-455038	Normal		\N	2014	2017-02-22 23:02:45.046263	2017-02-22 23:02:45.046263	\N	\N
672	1	Ornella	Balbis	\N	2342-460282	Normal		\N	2014	2017-02-22 23:02:45.083836	2017-02-22 23:02:45.083836	\N	\N
673	1	Consuelo	Tugores	\N	2342-5484710	Normal		\N	2014	2017-02-22 23:02:45.095555	2017-02-22 23:02:45.095555	\N	\N
674	1	Rosario	Pinzetta Martinez	\N	2342-403110	Normal		\N	2014	2017-02-22 23:02:45.131777	2017-02-22 23:02:45.131777	\N	\N
675	1	Lorenzo	Burga	\N	02342-423169	Normal		\N	2014	2017-02-22 23:02:45.167564	2017-02-22 23:02:45.167564	\N	\N
676	1	Angeles	Delgado	\N	02342-424148	Normal		\N	2014	2017-02-22 23:02:45.198191	2017-02-22 23:02:45.198191	\N	\N
677	1	Micaela	Indulski	\N	02342-15464067	Normal		\N	2014	2017-02-22 23:02:45.218984	2017-02-22 23:02:45.218984	\N	\N
678	1	Emilia	Aime	\N	2342-445083	Normal		\N	2014	2017-02-22 23:02:45.235315	2017-02-22 23:02:45.235315	\N	\N
679	1	Delfina	Balda	\N	2342-530976	Normal		\N	2014	2017-02-22 23:02:45.255683	2017-02-22 23:02:45.255683	\N	\N
680	1	Agustina	Foieri	\N	2342-512032	Normal		\N	2014	2017-02-22 23:02:45.263157	2017-02-22 23:02:45.263157	\N	\N
681	1	Juan Martin	Schachner	\N	2342-530726	Normal		\N	2014	2017-02-22 23:02:45.273658	2017-02-22 23:02:45.273658	\N	\N
682	1	Maria Milagros	Carrizo	\N	2342-485564	Normal		\N	2014	2017-02-22 23:02:45.28581	2017-02-22 23:02:45.28581	\N	\N
683	1	Camila Milagros	Girotti	\N	2342-505797	Normal		\N	2014	2017-02-22 23:02:45.296735	2017-02-22 23:02:45.296735	\N	\N
684	1	Delfina	Bifaretti	\N	2342-447966	Normal		\N	2014	2017-02-22 23:02:45.313136	2017-02-22 23:02:45.313136	\N	\N
685	1	Olivia	Guayta	\N	\N	Normal		\N	2014	2017-02-22 23:02:45.337547	2017-02-22 23:02:45.337547	\N	\N
686	1	Juan Diego 	Tenorio	\N	2346-557965	Normal		\N	2014	2017-02-22 23:02:45.358295	2017-02-22 23:02:45.358295	\N	\N
687	1	Maria Florencia	Avena	\N	2342-530578	Normal		\N	2014	2017-02-22 23:02:45.385424	2017-02-22 23:02:45.385424	\N	\N
688	1	Mailen 	Coronado	\N	2342-406757	Normal		\N	2014	2017-02-22 23:02:45.412125	2017-02-22 23:02:45.412125	\N	\N
689	1	Daiana Josefina	Peracc Iberna	\N	2342-465084	Normal		\N	2014	2017-02-22 23:02:45.447555	2017-02-22 23:02:45.447555	\N	\N
690	1	Maria Sol	Kunkel	\N	2342-445167	Normal		\N	2014	2017-02-22 23:02:45.47086	2017-02-22 23:02:45.47086	\N	\N
691	1	Dolores	Merchán 	\N	2342-423727	Normal		\N	2014	2017-02-22 23:02:45.495561	2017-02-22 23:02:45.495561	\N	\N
692	1	Lucia	Deboni	\N	2342-467965	Normal		\N	2014	2017-02-22 23:02:45.515498	2017-02-22 23:02:45.515498	\N	\N
693	1	Martina	Medica	\N	2342-464556	Normal		\N	2014	2017-02-22 23:02:45.527622	2017-02-22 23:02:45.527622	\N	\N
694	1	Josefina	Rosiano	\N	2342-453203	Normal		\N	2014	2017-02-22 23:02:45.55732	2017-02-22 23:02:45.55732	\N	\N
695	1	Camila Ayelen	Andino	\N	2342-466776	Normal		\N	2014	2017-02-22 23:02:45.575356	2017-02-22 23:02:45.575356	\N	\N
696	1	Lucia	Lamazon	\N	2342-510629	Normal		\N	2014	2017-02-22 23:02:45.583832	2017-02-22 23:02:45.583832	\N	\N
697	1	Catalina 	Lepiscopo	\N	2346-682346	Normal		\N	2014	2017-02-22 23:02:45.59764	2017-02-22 23:02:45.59764	\N	\N
698	1	Macarena	Vitale	\N	2342-406169	Normal		\N	2014	2017-02-22 23:02:45.615791	2017-02-22 23:02:45.615791	\N	\N
699	1	Renzo	Civello	\N	2342-504613	Normal		\N	2014	2017-02-22 23:02:45.630939	2017-02-22 23:02:45.630939	\N	\N
700	1	Francisco Serafin	Cicala	\N	2342-407301	Normal		\N	2014	2017-02-22 23:02:45.645331	2017-02-22 23:02:45.645331	\N	\N
701	1	Mariana	Malvigne	\N	425823 / 431449	Normal		\N	2014	2017-02-22 23:02:45.663723	2017-02-22 23:02:45.663723	\N	\N
702	1	Manuela	Meglia	\N	2342-446060	Agrotecnico		\N	2014	2017-02-22 23:02:45.678297	2017-02-22 23:02:45.678297	\N	\N
703	1	María Luz	Alietti	\N	2342-404405	Agrotecnico		\N	2014	2017-02-22 23:02:45.699337	2017-02-22 23:02:45.699337	\N	\N
704	1	Micaela Ayelen	Rysary	\N	2342-512172	Agrotecnico		\N	2014	2017-02-22 23:02:45.726577	2017-02-22 23:02:45.726577	\N	\N
705	1	Valentin	Delega	\N	2342-423158	Agrotecnico		\N	2014	2017-02-22 23:02:45.744307	2017-02-22 23:02:45.744307	\N	\N
706	1	Camila	Escobedo	\N	2342-407344	Agrotecnico		\N	2014	2017-02-22 23:02:45.767765	2017-02-22 23:02:45.767765	\N	\N
707	1	Luciana	Di Sario	\N	2342-424363	Agrotecnico		\N	2014	2017-02-22 23:02:45.793686	2017-02-22 23:02:45.793686	\N	\N
708	1	Imanol	Miró	\N	2342-530927	Agrotecnico		\N	2014	2017-02-22 23:02:45.811749	2017-02-22 23:02:45.811749	\N	\N
709	1	Julieta	Cause	\N	2342-407652	Agrotecnico		\N	2014	2017-02-22 23:02:45.827947	2017-02-22 23:02:45.827947	\N	\N
710	1	Rodrigo	Ladaga	\N	2346-654790	Agrotecnico		\N	2014	2017-02-22 23:02:45.837771	2017-02-22 23:02:45.837771	\N	\N
711	1	Sabrina	Sandes Benalal	\N	2342-474193	Agrotecnico		\N	2014	2017-02-22 23:02:45.848852	2017-02-22 23:02:45.848852	\N	\N
712	1	Lucía Del Carmen	Tenorio	\N	2342-413718	Agrotecnico		\N	2014	2017-02-22 23:02:45.871599	2017-02-22 23:02:45.871599	\N	\N
713	1	Federico	Petek	\N	2342-414621	Agrotecnico		\N	2014	2017-02-22 23:02:45.883421	2017-02-22 23:02:45.883421	\N	\N
714	1	Agustina Anabel	Bruno	\N	2342-482266	Agrotecnico		\N	2014	2017-02-22 23:02:45.907701	2017-02-22 23:02:45.907701	\N	\N
715	1	Florencia	Arce	\N	2342-449141	Agrotecnico		\N	2014	2017-02-22 23:02:45.931745	2017-02-22 23:02:45.931745	\N	\N
716	1	Yamila Inés	De Rosa	\N	2342-530124	Agrotecnico		\N	2014	2017-02-22 23:02:45.959571	2017-02-22 23:02:45.959571	\N	\N
717	1	Lucia	Aresti	\N	2342-516769	Normal		\N	2014	2017-02-22 23:02:45.989494	2017-02-22 23:02:45.989494	\N	\N
718	1	Maria Victoria	Del Bue	\N	2342-409030	Normal		\N	2014	2017-02-22 23:02:46.00152	2017-02-22 23:02:46.00152	\N	\N
719	1	Gaston Ariel	Di Silvestro	\N	2342-465953	Normal		\N	2014	2017-02-22 23:02:46.015692	2017-02-22 23:02:46.015692	\N	\N
720	1	Maximiliano	Biancato	\N	2342-456101	UBA		\N	2014	2017-02-22 23:02:46.025614	2017-02-22 23:02:46.025614	\N	\N
721	1	Renzo 	Manganiello	\N	2342-495284	UNLP		\N	2014	2017-02-22 23:02:46.035633	2017-02-22 23:02:46.035633	\N	\N
722	1	Nicole	Rodriguez	\N	2342-511275	Nacional		\N	2014	2017-02-22 23:02:46.052849	2017-02-22 23:02:46.052849	\N	\N
723	1	Agustina 	Rodriguez	\N	2342-449235	Nacional		\N	2014	2017-02-22 23:02:46.061094	2017-02-22 23:02:46.061094	\N	\N
724	1	Georgina	Saavedra	\N	2342-513083	Nacional		\N	2014	2017-02-22 23:02:46.069126	2017-02-22 23:02:46.069126	\N	\N
725	1	Alexis Agustin	Vezzoso	\N	2342-400037	Nacional		\N	2014	2017-02-22 23:02:46.07766	2017-02-22 23:02:46.07766	\N	\N
726	1	Victoria	Bordón	\N	2342-510516	Nacional		\N	2014	2017-02-22 23:02:46.085698	2017-02-22 23:02:46.085698	\N	\N
727	1	Manuel	Rodriguez Brizi	\N	\N	Normal		\N	2014	2017-02-22 23:02:46.098686	2017-02-22 23:02:46.098686	\N	\N
728	1	Franco	Bernadinelli	\N	\N	Normal		\N	2014	2017-02-22 23:02:46.115531	2017-02-22 23:02:46.115531	\N	\N
729	1	Daniel 	Cassi	\N	\N	Normal		\N	2014	2017-02-22 23:02:46.127714	2017-02-22 23:02:46.127714	\N	\N
730	1	Ailen Agustina	Lucchelli	\N	2342-457422	Agrotecnico		\N	2014	2017-02-22 23:02:46.145711	2017-02-22 23:02:46.145711	\N	\N
731	1	Sofia	Pellegrino	\N	2342-468217 / 427488	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:52.64598	2017-02-22 23:02:52.64598	\N	\N
732	1	María Milagros	Castaño	\N	2342-463712	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:52.654401	2017-02-22 23:02:52.654401	\N	\N
733	1	Guadalupe	Llanos	\N	2342-506232	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:52.660629	2017-02-22 23:02:52.660629	\N	\N
734	1	Dolores	Molina	\N	2342-403824	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:52.666457	2017-02-22 23:02:52.666457	\N	\N
735	1	Lucia	De Boni	\N	2342-467965	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:52.673059	2017-02-22 23:02:52.673059	\N	\N
736	1	Ina	Quintana	\N	2342-458282 / 423125	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:52.679715	2017-02-22 23:02:52.679715	\N	\N
737	1	Lucía	Barrales	\N	2342-509179	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:52.685959	2017-02-22 23:02:52.685959	\N	\N
738	1	Constanza	Negruzzi	\N	2342-454643	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:52.691416	2017-02-22 23:02:52.691416	\N	\N
739	1	Dolores	Farías	\N	2342-405013	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:52.697925	2017-02-22 23:02:52.697925	\N	\N
740	1	Valentina	Búa	\N	2342-501119	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:52.708901	2017-02-22 23:02:52.708901	\N	\N
741	1	Agustina	Barni	\N	2342-426071	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:52.716979	2017-02-22 23:02:52.716979	\N	\N
742	1	Noelia	Cerri	\N	2342-445011	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:52.723317	2017-02-22 23:02:52.723317	\N	\N
743	1	Agustina	Gotta	\N	2342-457777	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:52.730666	2017-02-22 23:02:52.730666	\N	\N
744	1	Lucia	Amigo	\N	2342-482426 / 425995	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:52.737313	2017-02-22 23:02:52.737313	\N	\N
745	1	Luciana	Lopez	\N	2342-509758 / 426050	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:52.743938	2017-02-22 23:02:52.743938	\N	\N
746	1	Francisca	Belamendia	\N	2342-455038	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:52.75053	2017-02-22 23:02:52.75053	\N	\N
747	1	Josefina	Peralta	\N	2342-409036	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:52.756905	2017-02-22 23:02:52.756905	\N	\N
748	1	Dolores	Santamarina	\N	2342-463590	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:52.763789	2017-02-22 23:02:52.763789	\N	\N
749	1	Josefina	Rizzo	\N	2342-412022	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:52.770252	2017-02-22 23:02:52.770252	\N	\N
750	1	Camila Ayelen	Andino	\N	2342-424409	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:52.776696	2017-02-22 23:02:52.776696	\N	\N
751	1	Trinidad	Juarez 	\N	2342-414945	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:52.784656	2017-02-22 23:02:52.784656	\N	\N
752	1	Maria Sofia	Alvarez	\N	2346-551276	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:52.791315	2017-02-22 23:02:52.791315	\N	\N
753	1	Maria Sol	De Moura	\N	2342-425415/546520	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:52.798925	2017-02-22 23:02:52.798925	\N	\N
754	1	Mercedes Isabel	Ponce	\N	2342-407427	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:52.805929	2017-02-22 23:02:52.805929	\N	\N
755	1	Lucio	Bagattin 	\N	2342-430309	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:52.812774	2017-02-22 23:02:52.812774	\N	\N
756	1	Rosario	Pinzetta Martinez	\N	2346-551845 	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:52.820154	2017-02-22 23:02:52.820154	\N	\N
757	1	Maria Belen	Cardus	\N	2346-558812	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:52.829497	2017-02-22 23:02:52.829497	\N	\N
758	1	Camila	Senise 	\N	2342-481694	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:52.844963	2017-02-22 23:02:52.844963	\N	\N
759	1	Maria Emilia	Terruzzi	\N	2342-505619	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:52.858233	2017-02-22 23:02:52.858233	\N	\N
760	1	Agustina	Bianco	\N	2342-404318	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:52.865765	2017-02-22 23:02:52.865765	\N	\N
761	1	Martina	Lozzia	\N	2342-505787	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:52.874428	2017-02-22 23:02:52.874428	\N	\N
762	1	Guadalupe	Fernandez	\N	2342-457303	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:52.883874	2017-02-22 23:02:52.883874	\N	\N
763	1	M. Milagros	Carrizo 	\N	2342-530357	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:52.890705	2017-02-22 23:02:52.890705	\N	\N
764	1	Manuel	Rodriguez Brizi	\N	2342-450796	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:52.89948	2017-02-22 23:02:52.89948	\N	\N
765	1	Santiago	Sartori Almada	\N	2342-455407	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:52.906483	2017-02-22 23:02:52.906483	\N	\N
766	1	Catalina	Vives	\N	2342-505603	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:52.913578	2017-02-22 23:02:52.913578	\N	\N
767	1	Camila Belen	Medina	\N	2342-410367	San Jose	Bragado	\N	2015	2017-02-22 23:02:52.920781	2017-02-22 23:02:52.920781	\N	\N
768	1	Oriana	Raffo	\N	2342-504649	San Jose	Bragado	\N	2015	2017-02-22 23:02:52.927867	2017-02-22 23:02:52.927867	\N	\N
769	1	Magali	Kloster 	\N	2323-677340	San Jose	Bragado	\N	2015	2017-02-22 23:02:52.938758	2017-02-22 23:02:52.938758	\N	\N
770	1	Delfina	Massalin	\N	\N	San Jose	Bragado	\N	2015	2017-02-22 23:02:52.95014	2017-02-22 23:02:52.95014	\N	\N
771	1	Renata	Blanco	\N	2342-460345	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:52.964798	2017-02-22 23:02:52.964798	\N	\N
772	1	Lucina	De Pablo	\N	2342-412644	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:52.979707	2017-02-22 23:02:52.979707	\N	\N
773	1	Martín	Duhalde	\N	2342-465786	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:52.995687	2017-02-22 23:02:52.995687	\N	\N
774	1	Mateo	Barros Conde	\N	11-57002304	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:53.00858	2017-02-22 23:02:53.00858	\N	\N
775	1	Valentina	Vidarte Araoz	\N	2342-548124	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:53.018993	2017-02-22 23:02:53.018993	\N	\N
776	1	Roxana	Cricca	\N	2342-422503	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:53.036305	2017-02-22 23:02:53.036305	\N	\N
777	1	Micaela	Molfeso	\N	2342-426265	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:53.045654	2017-02-22 23:02:53.045654	\N	\N
778	1	Estefania	Parra	\N	2342-506651	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:53.063631	2017-02-22 23:02:53.063631	\N	\N
779	1	Josefina	Peracca	\N	2342-463528	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:53.072867	2017-02-22 23:02:53.072867	\N	\N
780	1	Felicitas	Bruno	\N	2342-461925	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:53.081253	2017-02-22 23:02:53.081253	\N	\N
781	1	Renata	Genovese	\N	2342-485542	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:53.090945	2017-02-22 23:02:53.090945	\N	\N
782	1	Juliana	Yañez	\N	2342-403736	Agrotecnico	Bragado	\N	2015	2017-02-22 23:02:53.09845	2017-02-22 23:02:53.09845	\N	\N
783	1	Luciana	Di Sario	\N	2342-424363	Agrotecnico	Bragado	\N	2015	2017-02-22 23:02:53.1074	2017-02-22 23:02:53.1074	\N	\N
784	1	Regina	Rusconi	\N	2342-483747	San Jose	Bragado	\N	2015	2017-02-22 23:02:53.115698	2017-02-22 23:02:53.115698	\N	\N
785	1	Milagros	Bernabei	\N	2342-512753	San Jose	Bragado	\N	2015	2017-02-22 23:02:53.124367	2017-02-22 23:02:53.124367	\N	\N
786	1	Milagros	Disanti	\N	2342-456145	San Jose	Bragado	\N	2015	2017-02-22 23:02:53.133232	2017-02-22 23:02:53.133232	\N	\N
787	1	Guillermina	Fabalo	\N	2342-409088	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:53.13991	2017-02-22 23:02:53.13991	\N	\N
788	1	Facundo	Loriente	\N	2342-406612	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:53.146982	2017-02-22 23:02:53.146982	\N	\N
789	1	Catalina	Cavigiolo	\N	2342-459518	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:53.152939	2017-02-22 23:02:53.152939	\N	\N
790	1	María Belén	Lizarralde	\N	2342-445828	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:53.158739	2017-02-22 23:02:53.158739	\N	\N
791	1	Lucas	Insúa	\N	2342-509607	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:53.164555	2017-02-22 23:02:53.164555	\N	\N
792	1	María Florencia	Avena	\N	2346-650894	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:53.170847	2017-02-22 23:02:53.170847	\N	\N
793	1	Joaquín	Gauna	\N	2342-465750	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:53.176644	2017-02-22 23:02:53.176644	\N	\N
794	1	Clemente	Garat	\N	2342-533481	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:53.187826	2017-02-22 23:02:53.187826	\N	\N
795	1	Ana Clara	Marziali	\N	2342-482671	San Jose	Bragado	\N	2015	2017-02-22 23:02:53.194691	2017-02-22 23:02:53.194691	\N	\N
796	1	Sofia	Scuticchio 	\N	2342-405291	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:53.203592	2017-02-22 23:02:53.203592	\N	\N
797	1	Augusto	Caputo	\N	421311.0	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:53.21948	2017-02-22 23:02:53.21948	\N	\N
798	1			\N	\N			\N	2015	2017-02-22 23:02:53.227004	2017-02-22 23:02:53.227004	\N	\N
799	1	Consuelo	Tugores	\N	2342-484710	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:53.236011	2017-02-22 23:02:53.236011	\N	\N
800	1	Felicitas	Rizzo	\N	2342-400025	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:53.248817	2017-02-22 23:02:53.248817	\N	\N
801	1	Manuela	Meglia	\N	2342-446060	Escuela Normal	Bragado	\N	2015	2017-02-22 23:02:53.259473	2017-02-22 23:02:53.259473	\N	\N
802	1	Alexis Agustin	Vezzoso	\N	\N	Nacional	Bragado	\N	2015	2017-02-22 23:02:53.269539	2017-02-22 23:02:53.269539	\N	\N
803	0	Itati	Guidozzolo			Colegio Santísima Virgen Niña	Alberti, Buenos Aires	\N	2016	2017-02-22 23:25:17.527389	2017-02-22 23:25:17.527389	segib	
804	0	Sofia	Bergamini			Colegio Santísima Virgen Niña	Alberti, Buenos Aires	\N	2016	2017-02-22 23:25:17.549664	2017-02-22 23:25:17.549664	cs	
805	0	Agustina	Sequeira			Colegio Santísima Virgen Niña	Alberti, Buenos Aires	\N	2016	2017-02-22 23:25:17.570096	2017-02-22 23:25:17.570096	sti	
806	0	Santiago	De Pietro			Colegio Santísima Virgen Niña	Alberti, Buenos Aires	\N	2016	2017-02-22 23:25:17.592035	2017-02-22 23:25:17.592035	ag	
807	0	Juan Cruz	Elliff			Colegio Santísima Virgen Niña	Alberti, Buenos Aires	\N	2016	2017-02-22 23:25:17.609723	2017-02-22 23:25:17.609723	segib	
808	0	Justina	Bardengo			Colegio Santísima Virgen Niña	Alberti, Buenos Aires	\N	2016	2017-02-22 23:25:17.627365	2017-02-22 23:25:17.627365	cs	
809	0	Rosario	Zunino			Colegio Santísima Virgen Niña	Alberti, Buenos Aires	\N	2016	2017-02-22 23:25:17.650016	2017-02-22 23:25:17.650016	ag	
810	0	Delfina	Sequeira			Colegio Santísima Virgen Niña	Alberti, Buenos Aires	Pakistán	2016	2017-02-22 23:25:17.69008	2017-02-22 23:25:17.69008	ag	
811	0	Mateo	Kenny			Colegio Santísima Virgen Niña	Alberti, Buenos Aires	Pakistán	2016	2017-02-22 23:25:17.71566	2017-02-22 23:25:17.71566	sti	
812	0	Matias	Klein			Colegio Santísima Virgen Niña	Alberti, Buenos Aires	Pakistán	2016	2017-02-22 23:25:17.739728	2017-02-22 23:25:17.739728	ag	
813	0	Violeta	Mussi			Colegio Santísima Virgen Niña	Alberti, Buenos Aires	Argentina	2016	2017-02-22 23:25:17.764735	2017-02-22 23:25:17.764735	segib	
814	0	Josefina	Klein			Escuela Normal	Bragado, Buenos Aires	Argentina	2016	2017-02-22 23:25:17.790728	2017-02-22 23:25:17.790728	segib	
815	0	Agustin	Castillo			Colegio Santísima Virgen Niña	Alberti, Buenos Aires	Argentina	2016	2017-02-22 23:25:17.813594	2017-02-22 23:25:17.813594	sti	
816	0	Manuel	Robles			Colegio Santísima Virgen Niña	Alberti, Buenos Aires	Argentina	2016	2017-02-22 23:25:17.836532	2017-02-22 23:25:17.836532	ag	
817	0	Felipe	Rodeiro			Colegio Santísima Virgen Niña	Alberti, Buenos Aires	Argentina	2016	2017-02-22 23:25:17.860408	2017-02-22 23:25:17.860408	ag	
818	0	Eugenia	Russo			Colegio Santísima Virgen Niña	Alberti, Buenos Aires	\N	2016	2017-02-22 23:25:17.878375	2017-02-22 23:25:17.878375	ag	
819	0	Felicitas	Sosa			Colegio Santísima Virgen Niña	Alberti, Buenos Aires	\N	2016	2017-02-22 23:25:17.899146	2017-02-22 23:25:17.899146	ag	
820	0	Paulina	Cabañez			Colegio Santísima Virgen Niña	Alberti, Buenos Aires	\N	2016	2017-02-22 23:25:17.921042	2017-02-22 23:25:17.921042	sti	
821	0	Gabriel	Carretoni			Colegio Santísima Virgen Niña	Alberti, Buenos Aires	\N	2016	2017-02-22 23:25:17.945288	2017-02-22 23:25:17.945288	cs	
822	0	Nicolás	Guelfi			Colegio Santísima Virgen Niña	Alberti, Buenos Aires	\N	2016	2017-02-22 23:25:17.968144	2017-02-22 23:25:17.968144	cs	
823	0	Maria del Pilar	Vaccarezza	pilarvaccarezza@hotmail.com	2342405106	Instituto Privado Agrotècnico	Bragado, Buenos Aires	Cuba	2016	2017-02-22 23:25:17.993363	2017-02-22 23:25:17.993363	segib	41999764
824	0	Gonzalo Jose	Rysary	gonzalo-rysary@outlook.es	2342431480	Instituto Privado Agrotècnico	Bragado, Buenos Aires	Cuba	2016	2017-02-22 23:25:18.023847	2017-02-22 23:25:18.023847	segib	43592855
825	0	Ariana Abigail	Gonzalez	ari-gonzalez10@hotmail.com	2342467370	Instituto Privado Agrotècnico	Bragado, Buenos Aires	Cuba	2016	2017-02-22 23:25:18.059065	2017-02-22 23:25:18.059065	sti	42568353
826	0	Ramiro	Simionato	ramii_simionato@hotmail.com	2342423974	Instituto Privado Agrotècnico	Bragado, Buenos Aires	Cuba	2016	2017-02-22 23:25:18.086525	2017-02-22 23:25:18.086525	ag	42963342
827	0	Lidia	Barni	lidibar6@hotmail.com	2342423185	Instituto Privado Agrotècnico	Bragado, Buenos Aires	Cuba	2016	2017-02-22 23:25:18.115437	2017-02-22 23:25:18.115437	ag	43399144
828	1	Lucia	De Boni	lu_deboni@hotmail.com	2342532125	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:18.135834	2017-02-22 23:25:18.135834	\N	41740271
829	1	Mariana	Polizzi	mari_polizzi@hotmail.com	2342548759	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:18.159634	2017-02-22 23:25:18.159634	\N	41293584
830	1	Juan Ignacio	Deniz	thefontand2002@yahoo.cd	234215461309	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:18.185384	2017-02-22 23:25:18.185384	\N	41258612
831	0	Julian Eduardo	Gatica	juliangatica01@gmail.com	2346635592	Escuela Normal	Bragado, Buenos Aires	China	2016	2017-02-22 23:25:18.215518	2017-02-22 23:25:18.215518	sti	43803424
832	0	Camila 	Corral Morossini	camicorral@hotmail.com	2342431771	Escuela Normal	Bragado, Buenos Aires	China	2016	2017-02-22 23:25:18.241997	2017-02-22 23:25:18.241997	cs	42225069
833	0	Florencia	Salgado	marianita.1977@hotmail.com	234215406511	Instituto Privado Agrotècnico	Bragado, Buenos Aires	China	2016	2017-02-22 23:25:18.267305	2017-02-22 23:25:18.267305	ag	42135034
834	0	Delfina	Figueras Bielsa	delfinafigueras@hotmail.com	2342486774	Instituto Privado Agrotècnico	Bragado, Buenos Aires	China	2016	2017-02-22 23:25:18.289915	2017-02-22 23:25:18.289915	cs	42252647
835	0	Julieta	Ben Portinaro	julietabenportinaro@gmail.com	421669	Instituto Privado Agrotècnico	Bragado, Buenos Aires	China	2016	2017-02-22 23:25:18.310669	2017-02-22 23:25:18.310669	ag	42568802
836	0	Paloma 	Latorre Heredia	palomalatorreh@hotmail.com		Escuela Normal	Bragado, Buenos Aires	EEUU	2016	2017-02-22 23:25:18.331639	2017-02-22 23:25:18.331639	ag	42135107
837	0	Agustina	Loriente	agusloriente@hotmail,com	234215403566	Escuela Normal	Bragado, Buenos Aires	EEUU	2016	2017-02-22 23:25:18.35171	2017-02-22 23:25:18.35171	cs	42058023
838	0	Aaron 	Prado	pradoaaron@gmail.com	2342480209	Escuela Normal	Bragado, Buenos Aires	EEUU	2016	2017-02-22 23:25:18.371804	2017-02-22 23:25:18.371804	sti	41999724
839	0	Juana	Mendizabal	juanamendizabal@outlook.com	430266	Instituto Privado Agrotècnico	Bragado, Buenos Aires	EEUU	2016	2017-02-22 23:25:18.393727	2017-02-22 23:25:18.393727	cs	42302492
840	0	Juan Andres	Bagattin	jbagattin@fibertel.com.ar	2342426882	Instituto Privado Agrotècnico	Bragado, Buenos Aires	EEUU	2016	2017-02-22 23:25:18.417121	2017-02-22 23:25:18.417121	ag	42568777
841	0	Karen Beatriz	Salto	karen_salto@live.com.ar	234215472769	Escuela de Educacion Secundaria Nº6	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:18.435688	2017-02-22 23:25:18.435688	ag	41293543
842	0	Gustavo Isaias	Gomez	gusty1g-ms10@outlook.com	2342481500	Escuela de Educacion Secundaria Nº6	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:18.454472	2017-02-22 23:25:18.454472	sti	42839127
843	0	Juliana Abigail	Pampin	abigail-pampin1999@hotmail.com	2342556440	Escuela de Educacion Secundaria Nº6	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:18.47477	2017-02-22 23:25:18.47477	ag	42135008
844	0						, 	\N	2016	2017-02-22 23:25:18.490056	2017-02-22 23:25:18.490056	\N	
845	0	Karean Beatriz	Salto	karen_15_salto@live.com.ar	234215472769	Escuela de Educacion Secundaria Nº6	Bragado, Buenos Aires	Grecia	2016	2017-02-22 23:25:18.518226	2017-02-22 23:25:18.518226	ag	41293543
846	0	Gustavo Isaias	Gomez	gusty16-ms10@outlook.com	2342481500	Escuela de Educacion Secundaria Nº6	Bragado, Buenos Aires	Grecia	2016	2017-02-22 23:25:18.542698	2017-02-22 23:25:18.542698	ag	42839127
847	0	Juliana Abigail	Pampin	abigail-pampin1999@hotmail.com	2342556440	Escuela de Educacion Secundaria Nº6	Bragado, Buenos Aires	Grecia	2016	2017-02-22 23:25:18.562571	2017-02-22 23:25:18.562571	sti	42135008
848	0	Milagros Sol	Grandi	grandisooloog@gmail.com	2342511036	Escuela de Educacion Secundaria Nº6	Bragado, Buenos Aires	Arabia Saudita	2016	2017-02-22 23:25:18.586897	2017-02-22 23:25:18.586897	ag	46684704
849	0	Lourdes Sofia	Lupo	sofialupo98@hotmail.com	423520	Escuela de Educacion Secundaria Nº6	Bragado, Buenos Aires	Arabia Saudita	2016	2017-02-22 23:25:18.60958	2017-02-22 23:25:18.60958	sti	41461732
850	0	Larisa Denise	Lupo		423520	Escuela de Educacion Secundaria Nº6	Bragado, Buenos Aires	Arabia Saudita	2016	2017-02-22 23:25:18.63201	2017-02-22 23:25:18.63201	ag	43968780
851	1	Maria Felicitas	Rizzo	felicitas_rizzo@hotmail.com	2342405214	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:18.650328	2017-02-22 23:25:18.650328	\N	41293516
852	1	Felicitas	Bruno	brunofelicitas@outlook.com	2342554184	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:18.668047	2017-02-22 23:25:18.668047	\N	41666756
853	1	Catalina 	Cavigiolo	catalina-cavigiolo@hotmail.com	2342404149	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:18.697027	2017-02-22 23:25:18.697027	\N	41461842
854	1	Noelia	Cerri	noecerri@hotmail.com	234215547008	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:18.715376	2017-02-22 23:25:18.715376	\N	41293513
855	1	Tomas 	Cornaglia	tomascornaglia@hotmail.com	421491	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:18.733751	2017-02-22 23:25:18.733751	\N	40844272
856	1	Diego Armando	Moreno	diegomorenojrr@gmail,com	426984	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:18.752196	2017-02-22 23:25:18.752196	\N	41461790
857	1	Sofía 	Talfumera	sofiatal_mar@hotmail.com	1150063482	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:18.76916	2017-02-22 23:25:18.76916	\N	41537143
858	0	Maria Delfina	Gonzalez	mdelfig@hotmail.com	2342534329	Escuela Normal	Bragado, Buenos Aires	Corea Del Sur	2016	2017-02-22 23:25:18.791269	2017-02-22 23:25:18.791269	ag	43799295
859	0	Abril Agustina	Vola		2342425306	Escuela Normal	Bragado, Buenos Aires	Corea Del Sur	2016	2017-02-22 23:25:18.811268	2017-02-22 23:25:18.811268	ag	44112011
860	0	Julieta	Caprissi	silvialasa@live.com.ar	2342459274	Escuela Normal	Bragado, Buenos Aires	Corea Del Sur	2016	2017-02-22 23:25:18.831456	2017-02-22 23:25:18.831456	sti	43922683
861	1	Julieta	Bonora	julietabonora@outlook.com	234215406549	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:18.847983	2017-02-22 23:25:18.847983	\N	41293666
862	1	Maria Belen	Lizarralde		2342422511	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:18.863435	2017-02-22 23:25:18.863435	\N	41891121
863	0	Alejo	Petek	alejo.petek@gmail.com	2342430124	Escuela Normal	Bragado, Buenos Aires	Uruguay	2016	2017-02-22 23:25:18.882464	2017-02-22 23:25:18.882464	\N	42254753
864	0	Josefina	Agostinelli	josefina.agostinelli@gmail.com	424469	Escuela Normal	Bragado, Buenos Aires	Uruguay	2016	2017-02-22 23:25:18.905027	2017-02-22 23:25:18.905027	\N	42057928
865	0	Rocío 	Quarleri	rochiquarleri@hotmail.com	2342461377	Escuela Normal	Bragado, Buenos Aires	Uruguay	2016	2017-02-22 23:25:18.927445	2017-02-22 23:25:18.927445	\N	42057058
866	0	Tomás	Smith	smithtomas@hotmail.com	2342555640	Escuela Normal	Bragado, Buenos Aires	Uruguay	2016	2017-02-22 23:25:18.94809	2017-02-22 23:25:18.94809	segib	42146042
867	0	Juan Martín	Comas	comasm2@gmail.com	234215446148	Escuela Normal	Bragado, Buenos Aires	Uruguay	2016	2017-02-22 23:25:18.969248	2017-02-22 23:25:18.969248	segib	41891175
868	0	Juan Ignacio	Avena	juanavena@hotmail.com.ar	234215460218	Escuela Normal	Bragado, Buenos Aires	Uruguay	2016	2017-02-22 23:25:18.989037	2017-02-22 23:25:18.989037	sti	43463037
869	0	Santiago	Soldá	marcelahelfe_15@hotmail.com	450001	Escuela Normal	Bragado, Buenos Aires	Uruguay	2016	2017-02-22 23:25:19.009386	2017-02-22 23:25:19.009386	\N	42057906
870	0	Francisco	Marini	franmarini11@gmail.com	2342545663	Colegio Monseñor Espinosa de San Jose	Bragado, Buenos Aires	Francia	2016	2017-02-22 23:25:19.030114	2017-02-22 23:25:19.030114	ag	41461894
871	0	Agustina 	Minetto	agus.bucledorado@hotmail.com	234215480407	Colegio Monseñor Espinosa de San Jose	Bragado, Buenos Aires	Francia	2016	2017-02-22 23:25:19.053073	2017-02-22 23:25:19.053073	sti	42839108
872	0	Leo	Beltrán	leobeltran@outlook.es	234215534556	Colegio Monseñor Espinosa de San Jose	Bragado, Buenos Aires	Francia	2016	2017-02-22 23:25:19.075192	2017-02-22 23:25:19.075192	cs	41891117
873	0	Federico Yoel	Madeo Dorsch	fede.made.12@gmail.com	2342414055	Colegio Monseñor Espinosa de San Jose	Bragado, Buenos Aires	Francia	2016	2017-02-22 23:25:19.096577	2017-02-22 23:25:19.096577	cs	41757505
874	0	Juan Eduardo	Neri Artano	juaanneri@gmail.com	2342405779	Colegio Monseñor Espinosa de San Jose	Bragado, Buenos Aires	Francia	2016	2017-02-22 23:25:19.118601	2017-02-22 23:25:19.118601	ag	41646787
875	1	Harold	Marquina	haroldmarquina@gmail.com	234215450070	Colegio Monseñor Espinosa de San Jose	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:19.134658	2017-02-22 23:25:19.134658	\N	94033165
876	1	Milagros 	Disanti	milidisanti10@gmail.com	2345560331	Colegio Monseñor Espinosa de San Jose	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:19.150792	2017-02-22 23:25:19.150792	\N	42857395
877	0	Josefina	Macías	gabrielmacias2467@gmail.com	426077	Colegio Monseñor Espinosa de San Jose	Bragado, Buenos Aires	Irán	2016	2017-02-22 23:25:19.170655	2017-02-22 23:25:19.170655	ag	43094341
878	0	Melina	Aliano	melinaaliano@yahoo.com.ar	2342401636	Colegio Monseñor Espinosa de San Jose	Bragado, Buenos Aires	Irán	2016	2017-02-22 23:25:19.19314	2017-02-22 23:25:19.19314	ag	43399132
879	0	Joaquín 	Vicente	mleticia1@hotmail.com	234215504732	Colegio Monseñor Espinosa de San Jose	Bragado, Buenos Aires	Irán	2016	2017-02-22 23:25:19.214755	2017-02-22 23:25:19.214755	sti	43256348
880	0	Francisco	Deramo	deramofrancisco@gmail.com	2342412141	Colegio Monseñor Espinosa de San Jose	Bragado, Buenos Aires	Nigeria	2016	2017-02-22 23:25:19.240929	2017-02-22 23:25:19.240929	sti	44044812
881	0	Carolina Adriana	Sola	caarosola@gmail.com	2342533124	Colegio Monseñor Espinosa de San Jose	Bragado, Buenos Aires	Nigeria	2016	2017-02-22 23:25:19.26213	2017-02-22 23:25:19.26213	ag	43968737
882	0	Micaela	Poggi		2342 15403930	Colegio Monseñor Espinosa de San Jose	Bragado, Buenos Aires	Nigeria	2016	2017-02-22 23:25:19.28277	2017-02-22 23:25:19.28277	ag	44112077
883	1	Daiana Josefina	Peracca	josefinaperacca15@hotmail.com	427228	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:19.297916	2017-02-22 23:25:19.297916	\N	41293641
884	1	María Pia	Dinápoli Citrángolo		2342422718	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:19.314434	2017-02-22 23:25:19.314434	\N	41891107
885	1	Milagros	Ahumada	milagros_ahumada@hotmail.com		Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:19.329858	2017-02-22 23:25:19.329858	\N	41357390
886	1	Dolores	Molina	doloresmolina_barni@hotmail.com	2342480931	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:19.346587	2017-02-22 23:25:19.346587	\N	41461813
887	1	Pilar	Bondoni	pilarbondoni9@gmail.com	2342504448	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:19.368168	2017-02-22 23:25:19.368168	\N	42102602
888	0	Malena	Pardo Ortiz	malepardo6@hotmail.com	2342430733	Colegio Monseñor Espinosa de San Jose	Bragado, Buenos Aires	Angola	2016	2017-02-22 23:25:19.395525	2017-02-22 23:25:19.395525	ag	43720372
889	0	Candelaria	Romero	candelariaaa.romero@gmail.com	234215456700	Colegio Monseñor Espinosa de San Jose	Bragado, Buenos Aires	Angola	2016	2017-02-22 23:25:19.417824	2017-02-22 23:25:19.417824	\N	41461751
890	0	Yair	Bonahora	yairbonahora_02@hotmail.com	2342425124	Colegio Monseñor Espinosa de San Jose	Bragado, Buenos Aires	Angola	2016	2017-02-22 23:25:19.440324	2017-02-22 23:25:19.440324	\N	42568807
891	0	Agustina	Mira	agustinamira@gmail.com	234215413595	Colegio Monseñor Espinosa de San Jose	Bragado, Buenos Aires	Angola	2016	2017-02-22 23:25:19.464454	2017-02-22 23:25:19.464454	\N	41968736
892	0	Camila	Aragones	NT66266@hotmail.com	02342 427990	Colegio Monseñor Espinosa de San Jose	Bragado, Buenos Aires	Angola	2016	2017-02-22 23:25:19.489047	2017-02-22 23:25:19.489047	\N	41461900
893	0	Francisco	Macias	franmaciaspabaron@gmail.com	2342 422087	Colegio Monseñor Espinosa de San Jose	Bragado, Buenos Aires	Brasil	2016	2017-02-22 23:25:19.512512	2017-02-22 23:25:19.512512	segib	42839125
894	0	Valentin	Alonso	alonso.valentin@hotmail.com	2342 400809	Colegio Monseñor Espinosa de San Jose	Bragado, Buenos Aires	Brasil	2016	2017-02-22 23:25:19.533952	2017-02-22 23:25:19.533952	ag	43094353
895	0	Delfina Agustina	Sanes	marulu78@hotmail.com	02342 15445084	Colegio Monseñor Espinosa de San Jose	Bragado, Buenos Aires	Brasil	2016	2017-02-22 23:25:19.554039	2017-02-22 23:25:19.554039	segib	43256317
896	0	Milagros	Ruggiero	milita_ruggiero@hotmail.com	2342 534477	Colegio Monseñor Espinosa de San Jose	Bragado, Buenos Aires	Brasil	2016	2017-02-22 23:25:19.574587	2017-02-22 23:25:19.574587	\N	43463006
897	0	Juan Carlos	Audagno		2342 421191	Colegio Monseñor Espinosa de San Jose	Bragado, Buenos Aires	Brasil	2016	2017-02-22 23:25:19.597318	2017-02-22 23:25:19.597318	\N	42568804
898	0	Valentin Adrian	Cabrera		2342 409430	Colegio Monseñor Espinosa de San Jose	Bragado, Buenos Aires	Andorra	2016	2017-02-22 23:25:19.623518	2017-02-22 23:25:19.623518	\N	42839141
899	0	Albertina	Etchart	etchartalbertina@hotmail.com	2342 426145	Colegio Monseñor Espinosa de San Jose	Bragado, Buenos Aires	Andorra	2016	2017-02-22 23:25:19.646896	2017-02-22 23:25:19.646896	\N	43803499
900	0	Gaspar	Castillo	gasparesleyenda@live.com.ar	02342 422313	Colegio Monseñor Espinosa de San Jose	Bragado, Buenos Aires	Andorra	2016	2017-02-22 23:25:19.668279	2017-02-22 23:25:19.668279	\N	42058021
901	0	Ivana	Mrozek	ivana.mrozek@hotmail.com	2342515310	Colegio Monseñor Espinosa de San Jose	Bragado, Buenos Aires	Andorra	2016	2017-02-22 23:25:19.689544	2017-02-22 23:25:19.689544	\N	44130101
902	0	Sofia Ayelen	Cordoba	sofia.cordoba@live.com.ar	2342 466646	Colegio Monseñor Espinosa de San Jose	Bragado, Buenos Aires	Andorra	2016	2017-02-22 23:25:19.712339	2017-02-22 23:25:19.712339	\N	43803408
903	0	Rosario Antonella	Catoretti		02342 482475	Colegio Monseñor Espinosa de San Jose	Bragado, Buenos Aires	Alemania	2016	2017-02-22 23:25:19.733421	2017-02-22 23:25:19.733421	\N	42568895
904	0	Paula	Baez		02342 15501102	Colegio Monseñor Espinosa de San Jose	Bragado, Buenos Aires	Alemania	2016	2017-02-22 23:25:19.754831	2017-02-22 23:25:19.754831	sti	43094343
905	0	Milagros Solange 	Salgado		421047	Colegio Monseñor Espinosa de San Jose	Bragado, Buenos Aires	Alemania	2016	2017-02-22 23:25:19.776866	2017-02-22 23:25:19.776866	ag	42828245
906	1	Lucia Anahi	Casado	luciaacasado1@gmail.com	2342511401	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:19.793927	2017-02-22 23:25:19.793927	\N	40611174
907	1	Gala 	Luisetto	galaluisetto@gmail.com	2342421634	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:19.812025	2017-02-22 23:25:19.812025	\N	41461747
908	1	Guadalupe	Llanos	guadalupellanos17@hotmail.com	0234215499996	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:19.829061	2017-02-22 23:25:19.829061	\N	41293626
909	1	Catalina 	Vives	catalinavives@yahoo.com.ar	2342458236	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:19.847433	2017-02-22 23:25:19.847433	\N	41293562
910	1	Manuel	Gomez Ros	manuel.gomezros99@gmail.com	2342506204	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:19.866068	2017-02-22 23:25:19.866068	\N	41740228
911	0	Maria Felicitas	Recalde	mfelicitasrecalde@gmail.com	2342 462644	Escuela Normal	Bragado, Buenos Aires	Acnur	2016	2017-02-22 23:25:19.891178	2017-02-22 23:25:19.891178	\N	43094362
912	1	Facundo	Loriente	facundo_loriente@hotmail.com	423997	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:19.911144	2017-02-22 23:25:19.911144	\N	41740278
913	1	Catalina	Massa	catalinamassa45@gmail.com	2342 510116	Instituto Privado Agrotècnico	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:19.931294	2017-02-22 23:25:19.931294	\N	42135164
914	0	Pablo Valentín	Sagardoy			Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:19.951987	2017-02-22 23:25:19.951987	\N	44112052
915	0	Sofía 	García	sofi_09irala@hotmail.com	234215532775	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:19.972003	2017-02-22 23:25:19.972003	\N	42631529
916	0	Esperanza Rocío	Gimenez	esperanzagimenez20@gmail.com	2342489068	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:19.990363	2017-02-22 23:25:19.990363	\N	43968744
917	0						, 	\N	2016	2017-02-22 23:25:20.004212	2017-02-22 23:25:20.004212	\N	
918	1	Amparo	Hernández	ampa_herna@hotmail.com	2342423201	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:20.021228	2017-02-22 23:25:20.021228	\N	41461852
919	0	Felipe	Rodeiro		02346 471848	Colegio Santísima Virgen Niña	Alberti, Buenos Aires	\N	2016	2017-02-22 23:25:20.041775	2017-02-22 23:25:20.041775	ag	43030938
920	0	Agustin	Castillo	agusbautisanti@yahoo.com.ar	02346 471888	Colegio Santísima Virgen Niña	Alberti, Buenos Aires	\N	2016	2017-02-22 23:25:20.060719	2017-02-22 23:25:20.060719	sti	42147004
921	0	Josefina	Klein	chochi-18@hotmail.com	2346 563285	Colegio Santísima Virgen Niña	Alberti, Buenos Aires	\N	2016	2017-02-22 23:25:20.081268	2017-02-22 23:25:20.081268	segib	41999685
922	0	Violeta	Mussi	violetabertolot99@hotmail.com	221 6120276	Colegio Santísima Virgen Niña	Alberti, Buenos Aires	\N	2016	2017-02-22 23:25:20.108411	2017-02-22 23:25:20.108411	segib	42095212
923	0	Manuel	Robles	fdrdaniel@yahoo.com.ar	02346 470770	Colegio Santísima Virgen Niña	Alberti, Buenos Aires	\N	2016	2017-02-22 23:25:20.127816	2017-02-22 23:25:20.127816	ag	42957803
924	0	Vicente	Molina	bragado@intagro.com	2342426055	Escuela Normal	Bragado, Buenos Aires	Guatemala	2016	2017-02-22 23:25:20.15068	2017-02-22 23:25:20.15068	\N	42963343
925	0	Tatiana	Quarleri	tatiquarleri@hotmail.com	2342423547	Escuela Normal	Bragado, Buenos Aires	Guatemala	2016	2017-02-22 23:25:20.171746	2017-02-22 23:25:20.171746	\N	43463002
926	0	Lara Marian	Sotelo			Escuela Normal	Bragado, Buenos Aires	Guatemala	2016	2017-02-22 23:25:20.194216	2017-02-22 23:25:20.194216	\N	43968752
927	0	Pedro	Buzzeo	pedrobuzzeo@gmail.com	2342405945	Escuela Normal	Bragado, Buenos Aires	Guatemala	2016	2017-02-22 23:25:20.214847	2017-02-22 23:25:20.214847	sti	43801405
928	0	Lucas	Albizu	luqui.albizu@hotmail.com	2342427418	Escuela Normal	Bragado, Buenos Aires	Guatemala	2016	2017-02-22 23:25:20.238684	2017-02-22 23:25:20.238684	\N	42839156
929	0	Esperanza Rocío	Gimenez	esperanzagimenez20@gmail.com	2342489068	Escuela Normal	Bragado, Buenos Aires	Jordania	2016	2017-02-22 23:25:20.26154	2017-02-22 23:25:20.26154	\N	43968744
930	0	Pablo Valentín 	Sagardoy			Escuela Normal	Bragado, Buenos Aires	Jordania	2016	2017-02-22 23:25:20.283698	2017-02-22 23:25:20.283698	\N	44112052
931	0	Sofía 	García	sofi_09irala@hotmail.com	234215532775	Escuela Normal	Bragado, Buenos Aires	Jordania	2016	2017-02-22 23:25:20.304741	2017-02-22 23:25:20.304741	\N	42631529
932	0	Nicolas Ignacio	Guelfi		02346 414713	Colegio Santísima Virgen Niña	Alberti, Buenos Aires	Ucrania	2016	2017-02-22 23:25:20.32532	2017-02-22 23:25:20.32532	cs	41999684
933	0	Maria Eugenia	Russo	eugeniarusso1999@gmail.com	02346411052	Colegio Santísima Virgen Niña	Alberti, Buenos Aires	Ucrania	2016	2017-02-22 23:25:20.345082	2017-02-22 23:25:20.345082	ag	41999641
934	0	Felicitas	Sosa	luchiboveri@hotmail.com	2346517261	Colegio Santísima Virgen Niña	Alberti, Buenos Aires	Ucrania	2016	2017-02-22 23:25:20.364089	2017-02-22 23:25:20.364089	ag	41999662
935	0	Gabriel	Carretoni		02346 15542675	Colegio Santísima Virgen Niña	Alberti, Buenos Aires	Ucrania	2016	2017-02-22 23:25:20.384038	2017-02-22 23:25:20.384038	cs	41999604
936	0	Paulina	Cabañez	mariapaulina11@hotmail.com.ar	0266 4582083	Colegio Santísima Virgen Niña	Alberti, Buenos Aires	Ucrania	2016	2017-02-22 23:25:20.402757	2017-02-22 23:25:20.402757	sti	42278804
937	1	Camila Irupe	Cardoso	irupe-c@hotmail.com	427478	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:20.41831	2017-02-22 23:25:20.41831	\N	41461840
938	1	Francisco	Aime	franciscoaime_85B@hotmail.com	0342 431573	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:20.433979	2017-02-22 23:25:20.433979	\N	41857380
939	0	Maria Luz	Scotti	marialuz_scotti@hotmail.com	02342 410032	Escuela Normal	Bragado, Buenos Aires	Israel	2016	2017-02-22 23:25:20.454873	2017-02-22 23:25:20.454873	ag	41293575
940	0	Antonella	Gastaldi	gastaldiantonella@hotmail.com	02342 15547221	Escuela Normal	Bragado, Buenos Aires	Israel	2016	2017-02-22 23:25:20.480336	2017-02-22 23:25:20.480336	sti	41461734
941	0	Camila	Senise	camilasenise@hotmail.com	02342 15590941	Escuela Normal	Bragado, Buenos Aires	Israel	2016	2017-02-22 23:25:20.50408	2017-02-22 23:25:20.50408	ag	41293625
942	1	Azul	Ghezzi	azughezzi@hotmail.com	02342 425996	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:20.522772	2017-02-22 23:25:20.522772	\N	41834984
943	0	Maira	Marin	maimarin214@gmail.com	02342 15400206	Escuela Normal	Bragado, Buenos Aires	Republica Centroafricana	2016	2017-02-22 23:25:20.545926	2017-02-22 23:25:20.545926	\N	42568735
944	0	Angeles	Peralta		02342 509904	Escuela Normal	Bragado, Buenos Aires	Republica Centroafricana	2016	2017-02-22 23:25:20.57058	2017-02-22 23:25:20.57058	\N	42058026
945	0	Valentina	Aburruza		02342 412292	Escuela Normal	Bragado, Buenos Aires	Republica Centroafricana	2016	2017-02-22 23:25:20.590273	2017-02-22 23:25:20.590273	\N	42644127
946	0	Clara Mariana	De Renzis	claritaderenzi5@live.com.ar	02342 426054	Escuela Normal	Bragado, Buenos Aires	Egipto	2016	2017-02-22 23:25:20.610576	2017-02-22 23:25:20.610576	ag	41293603
947	0	Martina	Piovano	viviamaya9@gmail.com	02342424540	Escuela Normal	Bragado, Buenos Aires	Egipto	2016	2017-02-22 23:25:20.630484	2017-02-22 23:25:20.630484	sti	43914954
948	0	Felipe	Rizzo	felorizzo2001@gmail.com	02342411965	Escuela Normal	Bragado, Buenos Aires	Egipto	2016	2017-02-22 23:25:20.649981	2017-02-22 23:25:20.649981	cs	43403067
949	0	Ana Clara	Romeo	clarita_romeo@hotmail.com	02342 421373	Escuela Normal	Bragado, Buenos Aires	Egipto	2016	2017-02-22 23:25:20.670041	2017-02-22 23:25:20.670041	\N	41293639
950	0	Pedro Damian	Troyano	nataliatroyano@hotmail.com	02342 455222	Escuela Normal	Bragado, Buenos Aires	Egipto	2016	2017-02-22 23:25:20.689585	2017-02-22 23:25:20.689585	\N	41293524
951	0	Alejo	Tancredi		2342 545648	Instituto Privado Agrotècnico	Bragado, Buenos Aires	Corea del Norte	2016	2017-02-22 23:25:20.710565	2017-02-22 23:25:20.710565	sti	42568789
952	0	Jeremias	Lazareff		2342 15413119	Instituto Privado Agrotècnico	Bragado, Buenos Aires	Corea del Norte	2016	2017-02-22 23:25:20.733517	2017-02-22 23:25:20.733517	ag	42952329
953	1	Agustina 	Gotta	agus_gotta100699@hotmail.com	421306	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:20.748985	2017-02-22 23:25:20.748985	\N	41891153
954	1	Sofia	Pellegrino		234215462028	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:20.765272	2017-02-22 23:25:20.765272	\N	41641737
955	1	Ignacio 	Caprissi	ncaprissi@gmail.com	2342458680	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:20.782336	2017-02-22 23:25:20.782336	\N	41586969
956	1	Francisco	Fernández	fran.fer94@hotmail.com	2342421529	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:20.797051	2017-02-22 23:25:20.797051	\N	41808385
957	1	Luciana Belen	Lopez	luciana_l15@hotmail.com	02342 426050	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:20.812302	2017-02-22 23:25:20.812302	\N	41293623
958	0	Valentina Ianina	Gallotti	silvinamatiasovich@hotmail.com	2342427802	Escuela Normal	Bragado, Buenos Aires	Nicaragua	2016	2017-02-22 23:25:20.832665	2017-02-22 23:25:20.832665	ag	42237921
959	0	María Valentina	Gobet	valegobet@live.com.ar	234215410568	Escuela Normal	Bragado, Buenos Aires	Nicaragua	2016	2017-02-22 23:25:20.851924	2017-02-22 23:25:20.851924	segib	42058062
960	0	Victoria Pilar 	Barbero	victoriabarbero99@gmail.com	2342531141	Escuela Normal	Bragado, Buenos Aires	Nicaragua	2016	2017-02-22 23:25:20.870834	2017-02-22 23:25:20.870834	ag	40810284
961	0	Ana Virginia	Heredia de la Nieve	dlanieve@hotmail.com	427612	Escuela Normal	Bragado, Buenos Aires	Nicaragua	2016	2017-02-22 23:25:20.890553	2017-02-22 23:25:20.890553	sti	95245596
962	0	María Martina	Aime	martu_aime@hotmail.com	2342534341	Escuela Normal	Bragado, Buenos Aires	Nicaragua	2016	2017-02-22 23:25:20.911937	2017-02-22 23:25:20.911937	segib	42147458
963	1	Fermin	Colombo	fermin_colombo@hotmail.com	02342 512905	Instituto Privado Agrotècnico	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:20.927154	2017-02-22 23:25:20.927154	\N	41740263
964	1	Mariano	Mederos	marianomederos98@hotmail.com	02342 548788	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:20.942632	2017-02-22 23:25:20.942632	\N	41293576
965	1	Fermin	Guillot	ferminguillot@hotmail.com	2342 426027	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:20.965954	2017-02-22 23:25:20.965954	\N	41461702
966	0	María Luz	Pérez del Olmo	luliiperezdelolmo@gmail.com	2342508913	Escuela Normal	Bragado, Buenos Aires	Federacion Rusa	2016	2017-02-22 23:25:20.990028	2017-02-22 23:25:20.990028	\N	42568832
967	0	Lourdes 	Gastaldo	lulifly@hotmail.com	2342530393	Escuela Normal	Bragado, Buenos Aires	Federacion Rusa	2016	2017-02-22 23:25:21.011401	2017-02-22 23:25:21.011401	\N	42568739
968	0	Catalina	Juarez	caturri-01@hotmail.com	2342513897	Escuela Normal	Bragado, Buenos Aires	Federacion Rusa	2016	2017-02-22 23:25:21.034044	2017-02-22 23:25:21.034044	\N	43803401
969	0	Clara Irene	Comas	clari0232@gmail.com	2342513652	Escuela Normal	Bragado, Buenos Aires	Federacion Rusa	2016	2017-02-22 23:25:21.055301	2017-02-22 23:25:21.055301	\N	43968748
970	0	Brenda	Bussi	brendabussi@gmail.com	15405251	Escuela Normal	Bragado, Buenos Aires	Federacion Rusa	2016	2017-02-22 23:25:21.076072	2017-02-22 23:25:21.076072	\N	42568848
971	0	Camila	Barros 	camilabarros@hotmail.com	02342 451131	Escuela Normal	Bragado, Buenos Aires	Paraguay	2016	2017-02-22 23:25:21.096666	2017-02-22 23:25:21.096666	\N	40794937
972	0	Maria Agustina	Lozano	aguslozano.14@hotmail.com	02342 424773	Escuela Normal	Bragado, Buenos Aires	Paraguay	2016	2017-02-22 23:25:21.117822	2017-02-22 23:25:21.117822	sti	43094338
973	0	Violeta	Gonzalez	luu38v@gmail.com		Escuela Normal	Bragado, Buenos Aires	Paraguay	2016	2017-02-22 23:25:21.13889	2017-02-22 23:25:21.13889	\N	43256324
974	0	Daniela Sofia	Martinez Molina	daniela1113marie@gmail.com	02342 15486627	Escuela Normal	Bragado, Buenos Aires	Paraguay	2016	2017-02-22 23:25:21.160409	2017-02-22 23:25:21.160409	\N	94972186
975	0	Lucia	Beraza	lube-1998@hotmail.com	02342 506795	Escuela Normal	Bragado, Buenos Aires	Paraguay	2016	2017-02-22 23:25:21.181323	2017-02-22 23:25:21.181323	\N	42461746
976	0	Thiago	Ghibaudo Farias	marielaf71@hotmail.com	02342 15482889	Instituto Privado Agrotècnico	Bragado, Buenos Aires	Ecuador	2016	2017-02-22 23:25:21.203261	2017-02-22 23:25:21.203261	segib	43463063
977	0	Franco Nahuel	Buzzada	francolola4@gmail.com	02342 15456523	Instituto Privado Agrotècnico	Bragado, Buenos Aires	Ecuador	2016	2017-02-22 23:25:21.225023	2017-02-22 23:25:21.225023	segib	43669369
978	0	Ariel Nazareno	Lombardo		02342 15404247	Instituto Privado Agrotècnico	Bragado, Buenos Aires	Ecuador	2016	2017-02-22 23:25:21.245148	2017-02-22 23:25:21.245148	sti	45307463
979	0	Nicolas	Solimeo	claudiabarraza@hotmail.es	422515	Instituto Privado Agrotècnico	Bragado, Buenos Aires	Ecuador	2016	2017-02-22 23:25:21.265175	2017-02-22 23:25:21.265175	ag	43669331
980	0	Lucas	Simionato	lucas_simio@hotmail.com	02342 423974	Instituto Privado Agrotècnico	Bragado, Buenos Aires	Ecuador	2016	2017-02-22 23:25:21.286395	2017-02-22 23:25:21.286395	ag	44112063
981	0	Maria Agustina 	Salazar		234215507099	Escuela Normal	Bragado, Buenos Aires	Filipinas	2016	2017-02-22 23:25:21.305549	2017-02-22 23:25:21.305549	\N	43669327
982	0	Milagros	Saez	miluchiis_styles@hotmail.com	2342 484897	Escuela Normal	Bragado, Buenos Aires	Filipinas	2016	2017-02-22 23:25:21.326557	2017-02-22 23:25:21.326557	\N	42135049
983	0	Zahira Magali	Gonzales	zahiragonzalez07@hotmail.com	2342480057	Escuela Normal	Bragado, Buenos Aires	Filipinas	2016	2017-02-22 23:25:21.347285	2017-02-22 23:25:21.347285	ag	44112067
984	0	Mariana	Alonso	alonsomariana02@gmail.com	2342 15484791	Escuela Normal	Bragado, Buenos Aires	Honduras	2016	2017-02-22 23:25:21.368253	2017-02-22 23:25:21.368253	segib	43255053
985	0	Macarena	Islas 	laurarrusso@hotmail.com	02342 423208	Escuela Normal	Bragado, Buenos Aires	Honduras	2016	2017-02-22 23:25:21.387338	2017-02-22 23:25:21.387338	segib	43463075
986	0	Amparo	Perez	amparo-perez13@hotmail.com	02342 464303	Escuela Normal	Bragado, Buenos Aires	Honduras	2016	2017-02-22 23:25:21.406992	2017-02-22 23:25:21.406992	ag	42839149
987	0	Catalina	Ortiz Corniglia	danielacorniglia@hotmail.com	0234215499015	Escuela Normal	Bragado, Buenos Aires	Honduras	2016	2017-02-22 23:25:21.437951	2017-02-22 23:25:21.437951	ag	43256387
988	0	Renata	Palermo	renatapalermo_02@hotmail.com	02342 427739	Escuela Normal	Bragado, Buenos Aires	Honduras	2016	2017-02-22 23:25:21.45984	2017-02-22 23:25:21.45984	sti	43803432
989	1	Laureana	Zubizarreta	laureanaz_99@hotmail.com	02342 403858	Instituto Privado Agrotècnico	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:21.476283	2017-02-22 23:25:21.476283	\N	42057986
990	0	Maalen	Farias		02342 425547	Escuela Normal	Bragado, Buenos Aires	Afganistan	2016	2017-02-22 23:25:21.495914	2017-02-22 23:25:21.495914	\N	43799287
991	0	Oriana	Fraccaro Mendez	oriana_fm@live.com.ar	02342 407262	Escuela Normal	Bragado, Buenos Aires	Afganistan	2016	2017-02-22 23:25:21.516471	2017-02-22 23:25:21.516471	\N	43968720
992	0	Valentina	Botta			Escuela Normal	Bragado, Buenos Aires	Afganistan	2016	2017-02-22 23:25:21.539883	2017-02-22 23:25:21.539883	\N	43803409
993	0	Micaela	Tagliaferro	micaelatagliaferro@gmail.com	02342 422786	Escuela Normal	Bragado, Buenos Aires	Libia	2016	2017-02-22 23:25:21.561567	2017-02-22 23:25:21.561567	\N	41461880
994	0	Milagros Ayelen 	Pellgrino		2342 410644	Escuela Normal	Bragado, Buenos Aires	Libia	2016	2017-02-22 23:25:21.582791	2017-02-22 23:25:21.582791	\N	41461878
995	0	Ignacio	Soldavilla	ignacio_soldavilla_01@hotmail.com	2342 405642	Escuela Normal	Bragado, Buenos Aires	Libia	2016	2017-02-22 23:25:21.605433	2017-02-22 23:25:21.605433	\N	43669341
996	0	Agustina	Sequeira		234615410388	Colegio Santísima Virgen Niña	Alberti, Buenos Aires	Venezuela	2016	2017-02-22 23:25:21.627047	2017-02-22 23:25:21.627047	sti	41999747
997	0	Itati	Guidozzolo	itaguidozzolo@gmail.com	2346543364	Colegio Santísima Virgen Niña	Alberti, Buenos Aires	Venezuela	2016	2017-02-22 23:25:21.647765	2017-02-22 23:25:21.647765	segib	41999799
998	0	Justina	Bardengo	justinabardengo@gmail.com	234615554005	Colegio Santísima Virgen Niña	Alberti, Buenos Aires	Venezuela	2016	2017-02-22 23:25:21.683441	2017-02-22 23:25:21.683441	cs	41999742
999	0	María del Rosario	Ponce Zunino	rosariozunino89@gmail.com	15459507	Colegio Santísima Virgen Niña	Alberti, Buenos Aires	Venezuela	2016	2017-02-22 23:25:21.704528	2017-02-22 23:25:21.704528	ag	42820361
1000	0	Sofía	Bergamini	sofi-b-00@hotmail.com	2346569599	Colegio Santísima Virgen Niña	Alberti, Buenos Aires	Venezuela	2016	2017-02-22 23:25:21.725382	2017-02-22 23:25:21.725382	cs	41999796
1001	0	Juan Cruz	Elliff	elliffjuan3@gmail.com	234615681884	Colegio Santísima Virgen Niña	Alberti, Buenos Aires	Venezuela	2016	2017-02-22 23:25:21.746452	2017-02-22 23:25:21.746452	segib	43030610
1002	0	Santiago	De Pietro	santiagodepietro@hotmail.com	2346472189	Colegio Santísima Virgen Niña	Alberti, Buenos Aires	Venezuela	2016	2017-02-22 23:25:21.766395	2017-02-22 23:25:21.766395	ag	41999777
1003	0	Valentina	Toscano	toscanovalentina1@gmail.com	426172	Instituto Privado Agrotècnico	Bragado, Buenos Aires	Panamá	2016	2017-02-22 23:25:21.78694	2017-02-22 23:25:21.78694	segib	42568885
1004	0	Milagros	Cause	causemilagros@gmail.com	2342530823	Instituto Privado Agrotècnico	Bragado, Buenos Aires	Panamá	2016	2017-02-22 23:25:21.807744	2017-02-22 23:25:21.807744	ag	43256336
1005	0	Alejo Ezequiel	Naro		234215412873	Instituto Privado Agrotècnico	Bragado, Buenos Aires	Panamá	2016	2017-02-22 23:25:21.828576	2017-02-22 23:25:21.828576	ag	42963338
1006	0	Rocío Mailen	Berzoni	roo-berzoni@hotmail.com	15445075	Instituto Privado Agrotècnico	Bragado, Buenos Aires	Panamá	2016	2017-02-22 23:25:21.848976	2017-02-22 23:25:21.848976	segib	42963317
1007	0	Juliana Liliana	Contartese		2342430405	Instituto Privado Agrotècnico	Bragado, Buenos Aires	Panamá	2016	2017-02-22 23:25:21.871393	2017-02-22 23:25:21.871393	sti	43109638
1008	0	Gonzalo Agustín	Candela	gonzaygiane@hotmail.com.ar	2342485152	Instituto Privado Agrotècnico	Bragado, Buenos Aires	Costa Rica	2016	2017-02-22 23:25:21.893123	2017-02-22 23:25:21.893123	segib	42135092
1009	0	Enzo Agustín	Coppolva		2342483159	Instituto Privado Agrotècnico	Bragado, Buenos Aires	Costa Rica	2016	2017-02-22 23:25:21.914363	2017-02-22 23:25:21.914363	segib	42135173
1010	0	María 	Razzari	maruca.100@hotmail.com	2342430477	Escuela Normal	Bragado, Buenos Aires	Portugal	2016	2017-02-22 23:25:21.935232	2017-02-22 23:25:21.935232	\N	43803443
1011	0	Mauricio	Icardi	mauricioicardi25@gmail.com	2342422443	Escuela Normal	Bragado, Buenos Aires	Portugal	2016	2017-02-22 23:25:21.959267	2017-02-22 23:25:21.959267	\N	43094306
1012	0	Valentina	Vives	valentinavivess@gmail.com	2342508309	Escuela Normal	Bragado, Buenos Aires	Portugal	2016	2017-02-22 23:25:21.981816	2017-02-22 23:25:21.981816	\N	42963374
1013	0	Amparo	Argonz	amparoargonzz@gmail.com	2342468796	Escuela Normal	Bragado, Buenos Aires	Portugal	2016	2017-02-22 23:25:22.004487	2017-02-22 23:25:22.004487	\N	43094375
1014	0	Gonzalo	Decibe	gonza7decibe@gmail.com	2342422791	Escuela Normal	Bragado, Buenos Aires	Portugal	2016	2017-02-22 23:25:22.026965	2017-02-22 23:25:22.026965	segib	42952657
1015	0	Raúl Carlos	Mendizabal	andre_devi@hotmail.com	2342406295	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:22.048319	2017-02-22 23:25:22.048319	ag	42933172
1016	0	Valentina	Bracco	valen-bracco@hotmail.com	2342433072	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:22.068784	2017-02-22 23:25:22.068784	ag	43045462
1017	0	Candela 	García		2342431597	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:22.091902	2017-02-22 23:25:22.091902	sti	42568889
1018	0	Genaro	Minetto	genarominetto@hotmail.com		Escuela Normal	Bragado, Buenos Aires	Sudán Del Sur	2016	2017-02-22 23:25:22.117129	2017-02-22 23:25:22.117129	ag	42963388
1019	0	Juan Cruz	Posadas Morales		2342426191	Escuela Normal	Bragado, Buenos Aires	Sudán Del Sur	2016	2017-02-22 23:25:22.138248	2017-02-22 23:25:22.138248	ag	42058086
1020	0	Damian Nicolás	Riva	damianriva@live.com.ar	2342499353	Escuela Normal	Bragado, Buenos Aires	Sudán Del Sur	2016	2017-02-22 23:25:22.158678	2017-02-22 23:25:22.158678	sti	42568736
1021	0						, 	Sudán Del Sur	2016	2017-02-22 23:25:22.17609	2017-02-22 23:25:22.17609	\N	
1022	1	Valentina Jazmín	Iannino	valentinainannino1221@hotmail.com	2342412834	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:22.193362	2017-02-22 23:25:22.193362	\N	41293646
1023	0	Sofía Ailen	Poeta	sofipoeta-13@hotmail.com	2342481189	Escuela Normal	Bragado, Buenos Aires	Senegal	2016	2017-02-22 23:25:22.214507	2017-02-22 23:25:22.214507	\N	42135200
1024	0	Ernesto Alessandro	Araya Paez	ernest-2006@outlook.com	02342 428003	Escuela Normal	Bragado, Buenos Aires	Senegal	2016	2017-02-22 23:25:22.239237	2017-02-22 23:25:22.239237	\N	41229058
1025	0	Brenda 	Beccaglia	brenda_beccaglia@hotmail.com	2342451646	Escuela Normal	Bragado, Buenos Aires	Senegal	2016	2017-02-22 23:25:22.267498	2017-02-22 23:25:22.267498	\N	43799210
1026	0	Lourdes 	Ciotti	lciotti99@gmail.com	2342480795	Escuela Normal	Bragado, Buenos Aires	Senegal	2016	2017-02-22 23:25:22.301481	2017-02-22 23:25:22.301481	cs	42057944
1027	0	Lisandro José	León	lisandrojoseleon@gmail.com	2342480594	Escuela Normal	Bragado, Buenos Aires	Senegal	2016	2017-02-22 23:25:22.323238	2017-02-22 23:25:22.323238	ag	42057922
1028	0	Lucas 	Moraglio	lucas24@live.com.ar	2342451565	Escuela Normal	Bragado, Buenos Aires	Banco Mundial	2016	2017-02-22 23:25:22.345217	2017-02-22 23:25:22.345217	\N	42057956
1029	0	Joaquin	De Rissio	joaquin_derissio@hotmail.com	2342484429	Escuela Normal	Bragado, Buenos Aires	Banco Mundial	2016	2017-02-22 23:25:22.366235	2017-02-22 23:25:22.366235	\N	41823866
1030	1	Josefina 	Corigliano	jopecorigliano@hotmail.com	2342512976	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:22.381889	2017-02-22 23:25:22.381889	\N	41461727
1031	0	Martina	Lopumo	marti.lopumo-23@hotmail.com	2342430724	Escuela Normal	Bragado, Buenos Aires	República Dominicana	2016	2017-02-22 23:25:22.402095	2017-02-22 23:25:22.402095	\N	42839152
1032	0	Josefina	Arbeletche		2342427067	Escuela Normal	Bragado, Buenos Aires	República Dominicana	2016	2017-02-22 23:25:22.422277	2017-02-22 23:25:22.422277	\N	
1033	0	Bautista Matias	Mendizabal	lauruizdiaz@yahoo.com.ar	2342430261	Escuela Normal	Bragado, Buenos Aires	República Dominicana	2016	2017-02-22 23:25:22.44217	2017-02-22 23:25:22.44217	\N	43173722
1034	0	Julieta	Decibe	julietadecibe@gmail.com	2342508245	Escuela Normal	Bragado, Buenos Aires	República Dominicana	2016	2017-02-22 23:25:22.465056	2017-02-22 23:25:22.465056	\N	42963371
1035	0	Francisco	Pergolezi		2342545265	Escuela Normal	Bragado, Buenos Aires	República Dominicana	2016	2017-02-22 23:25:22.485449	2017-02-22 23:25:22.485449	\N	42963321
1036	1	Lorenzo	Grizutti	loolo.grizutti@hotmail.com	2342423534	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:22.501313	2017-02-22 23:25:22.501313	\N	41740232
1037	1	Celina 	Pildain	celina_pildain@hotmail.com	2342545199	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:22.518476	2017-02-22 23:25:22.518476	\N	42058037
1038	0	Franco	Saldaña Nigro	francosaldana45@gmail.com	2342426154	Instituto Privado Agrotècnico	Bragado, Buenos Aires	Siria	2016	2017-02-22 23:25:22.540107	2017-02-22 23:25:22.540107	ag	41293684
1039	0	Geraldine	Alegre		2342412251	Instituto Privado Agrotècnico	Bragado, Buenos Aires	Siria	2016	2017-02-22 23:25:22.561291	2017-02-22 23:25:22.561291	ag	40454457
1040	0	Rocio Abigail	Rodriguez	rochi_bailarina@hotmail.es	2342510907	Instituto Privado Agrotècnico	Bragado, Buenos Aires	Siria	2016	2017-02-22 23:25:22.58919	2017-02-22 23:25:22.58919	sti	41740282
1041	0						, 	Siria	2016	2017-02-22 23:25:22.609801	2017-02-22 23:25:22.609801	\N	
1042	1	Martin	Duhalde	martibduhalde7@gmail.com	2342516266	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:22.633158	2017-02-22 23:25:22.633158	\N	41293617
1043	1	Mateo	Barros Conde	mateobarrosconde@hotmail.com	2342548117	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:22.655878	2017-02-22 23:25:22.655878	\N	41558984
1044	1	Lucia	Pedrosa	lucitapedrosa@hotmail.com	2342509706	Instituto Privado Agrotècnico	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:22.70059	2017-02-22 23:25:22.70059	\N	42491533
1045	0	Alan Yoel	Montiel	alan7argentino@hotmail.com	2342404038	Instituto Privado Agrotècnico	Bragado, Buenos Aires	República de la India	2016	2017-02-22 23:25:22.727454	2017-02-22 23:25:22.727454	ag	41740220
1046	0	Milagros Itatí	Cid	milagros_40_87@hotmail.com	2342431536	Instituto Privado Agrotècnico	Bragado, Buenos Aires	República de la India	2016	2017-02-22 23:25:22.753477	2017-02-22 23:25:22.753477	ag	41891195
1047	0	Martin	Perez	tinchoperez2008@hotmail.com	2346602743	Instituto Privado Agrotècnico	Bragado, Buenos Aires	República de la India	2016	2017-02-22 23:25:22.776709	2017-02-22 23:25:22.776709	sti	43094310
1048	1	Bettina	Alessandrini	bettialessan_8_02@hotmail.com	2346509664	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:22.798206	2017-02-22 23:25:22.798206	\N	41891139
1049	0	Valentin	Laborde	vale.racing@hotmail.com	2342466821	Escuela Normal	Bragado, Buenos Aires	República de Sudán	2016	2017-02-22 23:25:22.863958	2017-02-22 23:25:22.863958	ag	41857375
1050	0	Franco Valentino	Rodriguez	franrodriguez_12_@outlook.com	234615587324	Escuela Normal	Bragado, Buenos Aires	República de Sudán	2016	2017-02-22 23:25:22.934642	2017-02-22 23:25:22.934642	ag	41740201
1051	0	Tomás Francisco	Bevacqua	alessandrook@live.com	2342481024	Escuela Normal	Bragado, Buenos Aires	República de Sudán	2016	2017-02-22 23:25:22.96678	2017-02-22 23:25:22.96678	sti	41857381
1052	0	Tomas Agustin	Prado		430530	Instituto Privado Agrotècnico	Bragado, Buenos Aires	Bolivia	2016	2017-02-22 23:25:23.010667	2017-02-22 23:25:23.010667	segib	42568857
1053	0	Jeremias Isaac 	Lazareff		234215413191	Instituto Privado Agrotècnico	Bragado, Buenos Aires	Bolivia	2016	2017-02-22 23:25:23.039542	2017-02-22 23:25:23.039542	ag	42952329
1054	0	Brenda	Morel		2342426255	Instituto Privado Agrotècnico	Bragado, Buenos Aires	Bolivia	2016	2017-02-22 23:25:23.075453	2017-02-22 23:25:23.075453	ag	43803426
1055	1	Juliana	Yañez	juliana_labrujita@hotmail.com	02342508927	Instituto Privado Agrotècnico	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:23.097594	2017-02-22 23:25:23.097594	\N	42058015
1056	1	Lucas Tomas	Insua	lucas_insua@hotmail.com	2342471678	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:23.115628	2017-02-22 23:25:23.115628	\N	41461774
1057	1	Luna Bianca	Brumer	luunalopez@hotmail.com	02342424577	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:23.134366	2017-02-22 23:25:23.134366	\N	41834586
1058	1	Florencia	Pujol	fpujolt@gmail.com	0234215461252		, 	\N	2016	2017-02-22 23:25:23.146878	2017-02-22 23:25:23.146878	\N	40454423
1059	1	Sofia	Scuticchio Orlandini	sofiso@hotmail.com	02342 505069	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:23.165948	2017-02-22 23:25:23.165948	\N	42135013
1060	0	Valentino	Milocco	valenmilocco@gmail.com	2342423620	Escuela Normal	Bragado, Buenos Aires	Colombia	2016	2017-02-22 23:25:23.195186	2017-02-22 23:25:23.195186	segib	42149924
1061	0	Juan Francisco	Garruba	franciscogarrubba@gmail.com	02342 421230	Escuela Normal	Bragado, Buenos Aires	Colombia	2016	2017-02-22 23:25:23.224196	2017-02-22 23:25:23.224196	\N	42058044
1062	0	Juan Manuel	Anso	juannanso@live.com	02342427772	Escuela Normal	Bragado, Buenos Aires	Colombia	2016	2017-02-22 23:25:23.247421	2017-02-22 23:25:23.247421	\N	42135047
1063	0	Jeremias	Arribalzaga	jerefutbol@gmail.com	02342 423007	Escuela Normal	Bragado, Buenos Aires	Colombia	2016	2017-02-22 23:25:23.271806	2017-02-22 23:25:23.271806	\N	42660372
1064	0	Genaro	Cavenaghi	genaro1999@hotmail.com	02342 485052	Escuela Normal	Bragado, Buenos Aires	Colombia	2016	2017-02-22 23:25:23.297754	2017-02-22 23:25:23.297754	\N	42014489
1065	0	Damian Nicolas	Riva	damianriva@live.com.ar	2342 499353	Escuela Normal	Bragado, Buenos Aires	Mexico	2016	2017-02-22 23:25:23.328938	2017-02-22 23:25:23.328938	\N	42568736
1066	0	Carolina	Echeto	carolinaecheto@hotmail.com	02342 15481856	Escuela Normal	Bragado, Buenos Aires	Mexico	2016	2017-02-22 23:25:23.352663	2017-02-22 23:25:23.352663	\N	43463092
1067	0	Tomas	Celerier	tomascelerier@hotmail.com	02342 15510050	Escuela Normal	Bragado, Buenos Aires	Mexico	2016	2017-02-22 23:25:23.378124	2017-02-22 23:25:23.378124	\N	42658548
1068	0	Julian	Aristi	julianaristiboca@hotmail.com	02342 15413910	Escuela Normal	Bragado, Buenos Aires	Mexico	2016	2017-02-22 23:25:23.410214	2017-02-22 23:25:23.410214	\N	42135065
1069	0	Joaquin 	Vives	joaquinvives19@hotmail.com	2342 480388	Escuela Normal	Bragado, Buenos Aires	Mexico	2016	2017-02-22 23:25:23.435258	2017-02-22 23:25:23.435258	\N	42135023
1070	0	Rodrigo Alejandro	Mansfield		02342 426079	Escuela Normal	Bragado, Buenos Aires	Yemen	2016	2017-02-22 23:25:23.465177	2017-02-22 23:25:23.465177	sti	43399135
1071	0	Belen	Bondoni	bondonibelen@gmail.com	02342 514426	Escuela Normal	Bragado, Buenos Aires	Yemen	2016	2017-02-22 23:25:23.487395	2017-02-22 23:25:23.487395	\N	42057480
1072	0	Lourdes	Fernandez		02342 427464	Escuela Normal	Bragado, Buenos Aires	Yemen	2016	2017-02-22 23:25:23.510669	2017-02-22 23:25:23.510669	\N	41461758
1073	0	Facundo	Rios	faqrios@gmail.com	02342 15410389	Escuela Normal	Bragado, Buenos Aires	Luxemburgo	2016	2017-02-22 23:25:23.536303	2017-02-22 23:25:23.536303	ag	42135012
1074	0	Juan Mateo 	Moragas	mateo_moragas_100@hotmai.com	2342 426418	Escuela Normal	Bragado, Buenos Aires	Luxemburgo	2016	2017-02-22 23:25:23.566293	2017-02-22 23:25:23.566293	sti	42058018
1075	0	Axel Leonel	Mendez Molina	aleonelmendez@gmail.com	02342 426835	Escuela Normal	Bragado, Buenos Aires	Luxemburgo	2016	2017-02-22 23:25:23.596934	2017-02-22 23:25:23.596934	ag	42568776
1076	0	Lorenzo	Diaz Videla	lorenzodiazvidela@gmail.com	02342 499464	Escuela Normal	Bragado, Buenos Aires	Acnudh	2016	2017-02-22 23:25:23.637184	2017-02-22 23:25:23.637184	\N	41891177
1077	0	Anarella	Lancelotte	Analancelotte@gmail.com	2342 515471	Escuela Normal	Bragado, Buenos Aires	Acnur	2016	2017-02-22 23:25:23.677232	2017-02-22 23:25:23.677232	\N	43799282
1078	0	Valentino Leonardo	Lorenzo	lorenzovcai@gmail.com	2342531350	Instituto Privado Agrotècnico	Bragado, Buenos Aires	Japón	2016	2017-02-22 23:25:23.717603	2017-02-22 23:25:23.717603	cs	41576615
1079	0	Francisco	Maccario Mitchel	mariayanina@live.com.ar	2342485992	Instituto Privado Agrotècnico	Bragado, Buenos Aires	Japón	2016	2017-02-22 23:25:23.757618	2017-02-22 23:25:23.757618	ag	41173200
1080	0	Agustin Alejandro	Bergonce	agusbergonce10@hotmail.com	2342481737	Instituto Privado Agrotècnico	Bragado, Buenos Aires	Japón	2016	2017-02-22 23:25:23.784018	2017-02-22 23:25:23.784018	sti	42963327
1081	0	Alejandro	Naruair Pomes	alenaruairz24@hotmail.com	2342423663	Instituto Privado Agrotècnico	Bragado, Buenos Aires	Japón	2016	2017-02-22 23:25:23.80862	2017-02-22 23:25:23.80862	ag	42839196
1082	0	Alex Facundo Nicolás	Islas		234215468821	Instituto Privado Agrotècnico	Bragado, Buenos Aires	Japón	2016	2017-02-22 23:25:23.832763	2017-02-22 23:25:23.832763	cs	41857364
1083	1	Jean Carlos	Martinez Molina	jeancmolina@outlook.com	234215518334		, 	\N	2016	2017-02-22 23:25:23.845623	2017-02-22 23:25:23.845623	\N	94872188
1084	0	Pedro	Starna	pedrostarna@hotmail.com	234225472084	Escuela Normal	Bragado, Buenos Aires	Costa Rica	2016	2017-02-22 23:25:23.871928	2017-02-22 23:25:23.871928	sti	43094382
1085	0	Victoria	Alietti	vickyalietti@hotmail.com	2342408672	Escuela Normal	Bragado, Buenos Aires	Costa Rica	2016	2017-02-22 23:25:23.89698	2017-02-22 23:25:23.89698	segib	42963377
1086	0	Camila 	Soldá	camisolda@hotmail.com	2342406123	Escuela Normal	Bragado, Buenos Aires	Costa Rica	2016	2017-02-22 23:25:23.926131	2017-02-22 23:25:23.926131	segib	42963368
1087	1	María Sofía 	Álvarez		2342531431	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:23.948678	2017-02-22 23:25:23.948678	\N	41740300
1088	0	Carla Belén	Baiocco	carbaiocco@gmail.com	234215514510	E.E.S.N°5	Comodoro Py, Bragado, Buenos Aires	Somalía	2016	2017-02-22 23:25:23.980339	2017-02-22 23:25:23.980339	sti	41891128
1089	0	Milena Magali	Fernandez		2342516655	E.E.S.N°5	Comodoro Py, Bragado, Buenos Aires	Somalía	2016	2017-02-22 23:25:24.018505	2017-02-22 23:25:24.018505	\N	41891200
1090	0	Cinthia Roxana	Seregüere		2342495169	E.E.S.N°5	Comodoro Py, Bragado, Buenos Aires	Somalía	2016	2017-02-22 23:25:24.044083	2017-02-22 23:25:24.044083	\N	42963324
1091	0						, 	Somalía	2016	2017-02-22 23:25:24.066295	2017-02-22 23:25:24.066295	\N	
1092	0	Luciano Manuel	Fernandez	loleman4@hotmail.com	2342424261	Escuela Normal	Bragado, Buenos Aires	Acnudh	2016	2017-02-22 23:25:24.097645	2017-02-22 23:25:24.097645	\N	41740261
1093	0	Martina	Calandro		2342402726	Instituto Privado Agrotècnico	Bragado, Buenos Aires	España	2016	2017-02-22 23:25:24.131894	2017-02-22 23:25:24.131894	ag	42997746
1094	0	Lucia	Comas		02342 15405875	Instituto Privado Agrotècnico	Bragado, Buenos Aires	España	2016	2017-02-22 23:25:24.155495	2017-02-22 23:25:24.155495	sti	43094349
1095	0	Guadalupe	Goncalvez Cagliani	guadi8@hotmail.com	2342421115	Instituto Privado Agrotècnico	Bragado, Buenos Aires	España	2016	2017-02-22 23:25:24.18061	2017-02-22 23:25:24.18061	cs	43399155
1096	0	Santiago	Suarez Arribalzaga	liaarribalzaga@hotmail.com	234215463000	Instituto Privado Agrotècnico	Bragado, Buenos Aires	España	2016	2017-02-22 23:25:24.204937	2017-02-22 23:25:24.204937	cs	43399174
1097	0	Maria Belen	Mendez	belen56@live.com.ar	2342430773	Instituto Privado Agrotècnico	Bragado, Buenos Aires	España	2016	2017-02-22 23:25:24.23074	2017-02-22 23:25:24.23074	segib	42963312
1098	0	Maria Trinidad	Garcia	trini200110@hotmail.com	2342425677	Instituto Privado Agrotècnico	Bragado, Buenos Aires	España	2016	2017-02-22 23:25:24.256538	2017-02-22 23:25:24.256538	ag	43399184
1099	0	Catalina	Catuti	catalinacatuti93@gmail.com	234215483251	Instituto Privado Agrotècnico	Bragado, Buenos Aires	España	2016	2017-02-22 23:25:24.298267	2017-02-22 23:25:24.298267	segib	43094368
1100	1	Renata	Genovese	renigen152000@gmail.com	011 1536205583		, 	\N	2016	2017-02-22 23:25:24.312893	2017-02-22 23:25:24.312893	\N	42648055
1101	1	Maria Milagros	Castaño Exposito	mmilagros1999@gmail.com	02342548785	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:24.330965	2017-02-22 23:25:24.330965	\N	42057955
1102	1	Laureano Agustin	Cid	Agus_yo_sanlo@hotmail.com	431536	E.E.S Tècnica	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:24.349485	2017-02-22 23:25:24.349485	\N	40454454
1103	1	Ina	Quintana	inaquintanalaborde@gmail.com	2342480067	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:24.367413	2017-02-22 23:25:24.367413	\N	41646047
1104	0	Guillermo Gaspar	Acuña		234215516671	E.E.S Tècnica	Bragado, Buenos Aires	Lituania	2016	2017-02-22 23:25:24.398752	2017-02-22 23:25:24.398752	\N	43732118
1105	0	Emanuel Alejandro	Martinez		02342422343	E.E.S Tècnica	Bragado, Buenos Aires	Lituania	2016	2017-02-22 23:25:24.426334	2017-02-22 23:25:24.426334	\N	43799277
1106	0	Lucas Adrian 	Rodriguez	rochi_bailarina@hotmail.es	234215468695	Instituto Privado Agrotècnico	Bragado, Buenos Aires	Lituania	2016	2017-02-22 23:25:24.480701	2017-02-22 23:25:24.480701	\N	43463049
1107	0	Magali Belen	Petetta	Maga_188@hotmail.com	2342451036	E.E.S Nº 3	Bragado, Buenos Aires	Nueva Zelanda	2016	2017-02-22 23:25:24.510255	2017-02-22 23:25:24.510255	\N	42057970
1108	0	Juan	Calle	juancalle_13@live.com	02342 423595	E.E.S Nº 3	Bragado, Buenos Aires	Nueva Zelanda	2016	2017-02-22 23:25:24.547435	2017-02-22 23:25:24.547435	\N	42135003
1109	0	Jorgelina Lujan	Roldan		0234215409802	E.E.S Nº 3	Bragado, Buenos Aires	Nueva Zelanda	2016	2017-02-22 23:25:24.58317	2017-02-22 23:25:24.58317	\N	43968781
1110	0	Diana Alanis	Matarozzi	DianeeTequiere@gmail.com	02342 15514450	E.E.S Nº 3	Bragado, Buenos Aires	Nueva Zelanda	2016	2017-02-22 23:25:24.611082	2017-02-22 23:25:24.611082	\N	43399186
1111	0	Diego Gabriel 	Duva		02342 15460427	E.E.S Nº 3	Bragado, Buenos Aires	Nueva Zelanda	2016	2017-02-22 23:25:24.636703	2017-02-22 23:25:24.636703	\N	45040553
1112	0	Agustin	Bello		2342 402994	E.E.S Tècnica	Bragado, Buenos Aires	Malasia	2016	2017-02-22 23:25:24.65912	2017-02-22 23:25:24.65912	\N	44112001
1113	0	Daniel Ezequiel	Romero		2342 15465117	E.E.S Tècnica	Bragado, Buenos Aires	Malasia	2016	2017-02-22 23:25:24.68777	2017-02-22 23:25:24.68777	\N	41857396
1114	0	Leonardo David	Rodriguez	Leonardorodriguez@hotmail.com		E.E.S Tècnica	Bragado, Buenos Aires	Malasia	2016	2017-02-22 23:25:24.713861	2017-02-22 23:25:24.713861	\N	41745069
1115	0	Agustin	Leunda	alejandranoemi90@hotmail.com	2342 532590	E.E.S Tècnica	Bragado, Buenos Aires	Malasia	2016	2017-02-22 23:25:24.735491	2017-02-22 23:25:24.735491	\N	43669352
1116	0	Facundo Andres	Cortes Doffo		02342 15414485	E.E.S Tècnica	Bragado, Buenos Aires	Malasia	2016	2017-02-22 23:25:24.765385	2017-02-22 23:25:24.765385	\N	42135069
1117	0	Bianca Guadalupe	Grande	geg3970@hotmail.com	02352 404599	E.E.S.Nº1 "Bandera Argentina"	Irala, Buenos Aires	Etiopia	2016	2017-02-22 23:25:24.791553	2017-02-22 23:25:24.791553	\N	42054147
1118	0	Rodrigo Raul	Garcia		02352 15480607	E.E.S.Nº1 "Bandera Argentina"	Irala, Buenos Aires	Etiopia	2016	2017-02-22 23:25:24.816392	2017-02-22 23:25:24.816392	\N	41922782
1119	0	Milena Elisabet	Gonzalez		02352 493025	E.E.S.Nº1 "Bandera Argentina"	Irala, Buenos Aires	Etiopia	2016	2017-02-22 23:25:24.839772	2017-02-22 23:25:24.839772	\N	
1120	0	Ian Ezequiel	Zapacosta	zapacostagastonoyo@hoo.com.ar	02342 15461642	Instituto Privado Agrotècnico	Bragado, Buenos Aires	Argelia	2016	2017-02-22 23:25:24.862999	2017-02-22 23:25:24.862999	sti	43871835
1121	0	Simon 	Palacios		02342 15512012	Instituto Privado Agrotècnico	Bragado, Buenos Aires	Argelia	2016	2017-02-22 23:25:24.886494	2017-02-22 23:25:24.886494	ag	43799231
1122	0	Joaquin	Aragones	Nt6626@hotmail.com	02342 427990	Instituto Privado Agrotècnico	Bragado, Buenos Aires	Argelia	2016	2017-02-22 23:25:24.909733	2017-02-22 23:25:24.909733	ag	43669359
1123	0						, 	Argelia	2016	2017-02-22 23:25:24.925255	2017-02-22 23:25:24.925255	\N	
1124	0	Daniela Jazmin	Barcus	Dvbbragado@hotmail.com	02342 425813	Escuela Normal	Bragado, Buenos Aires	Republica Del Congo	2016	2017-02-22 23:25:24.948599	2017-02-22 23:25:24.948599	ag	43968777
1125	0	Cihntia Magali	Buzzada	Cin.buzzada.16@gmail.com	02342 427530	Escuela Normal	Bragado, Buenos Aires	Republica Del Congo	2016	2017-02-22 23:25:24.97202	2017-02-22 23:25:24.97202	ag	42568900
1126	0	Lucia	Aristi Signorio	Lu-aristi.10@gmail.com	02342 422696	Escuela Normal	Bragado, Buenos Aires	Republica Del Congo	2016	2017-02-22 23:25:24.993642	2017-02-22 23:25:24.993642	sti	43799236
1127	1	Augusto Franco Bernardo	Caputo Ortega	Augustocortega@outlook.com	02342 421311	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:25.019708	2017-02-22 23:25:25.019708	\N	43256383
1128	1	Dolores 	Menendez	lolamenendezz@gmail.com	02342 15507573	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:25.040174	2017-02-22 23:25:25.040174	\N	42568829
1129	1	Lucila	Roldan	Lupy_roldan@hotmail.com	02342 15499207	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:25.057159	2017-02-22 23:25:25.057159	\N	42135197
1130	1	Maria Florencia	Avena	floravena15@hotmail.com	02342 453900	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:25.080355	2017-02-22 23:25:25.080355	\N	41293621
1131	0	Diego Armando	Yaffaldano	diego.y@hotmail.com.ar	2342409592	Escuela Normal	Bragado, Buenos Aires	Peru	2016	2017-02-22 23:25:25.105809	2017-02-22 23:25:25.105809	\N	42135082
1132	0	Nicolas Enrique Martín	Gimenez		2342405846	Instituto Privado Agrotècnico	Bragado, Buenos Aires	Peru	2016	2017-02-22 23:25:25.133303	2017-02-22 23:25:25.133303	\N	42135056
1133	0	Celeste	Nycole	nicky.marquez.712@hotmail.com	2342483065	Instituto Privado Agrotècnico	Bragado, Buenos Aires	Peru	2016	2017-02-22 23:25:25.161401	2017-02-22 23:25:25.161401	ag	44112086
1134	0	Franco Esteban	Petegoli	francopetegoli@hotmail.com	2342403810	Instituto Privado Agrotècnico	Bragado, Buenos Aires	Peru	2016	2017-02-22 23:25:25.184727	2017-02-22 23:25:25.184727	sti	42568842
1135	0	Martina	Yannone	martinayannone@live.com.ar	2342531065	Instituto Privado Agrotècnico	Bragado, Buenos Aires	Peru	2016	2017-02-22 23:25:25.20985	2017-02-22 23:25:25.20985	segib	44264328
1136	0	Delfina	Boschiero		424992	Instituto Privado Agrotècnico	Bragado, Buenos Aires	Sudafrica	2016	2017-02-22 23:25:25.231791	2017-02-22 23:25:25.231791	sti	43799241
1137	0	Rebeca 	Pereira		2342508335	Instituto Privado Agrotècnico	Bragado, Buenos Aires	Sudafrica	2016	2017-02-22 23:25:25.255443	2017-02-22 23:25:25.255443	ag	43463025
1138	0	Camila	Gutierrez		2342557281	Instituto Privado Agrotècnico	Bragado, Buenos Aires	Sudafrica	2016	2017-02-22 23:25:25.279397	2017-02-22 23:25:25.279397	ag	44264320
1139	0	Francisco Ariel	Hidalgo		2346588868	E.E.S Nº 3	Bragado, Buenos Aires	El Salvador	2016	2017-02-22 23:25:25.303536	2017-02-22 23:25:25.303536	segib	41293671
1140	0	Sofia Raquel	Lopez	sofia_capa_21@hotmail.com	2342425638	E.E.S Nº 3	Bragado, Buenos Aires	El Salvador	2016	2017-02-22 23:25:25.329802	2017-02-22 23:25:25.329802	ag	42839177
1141	0	Abril Stefanía	Zanassi	abrilzanassi@hotmail.com	4422052	E.E.S. Nuestra Señora de la Misericordia	San Nicolás, Buenos Aires	Kenia	2016	2017-02-22 23:25:25.351263	2017-02-22 23:25:25.351263	sti	43179798
1142	0	Rosario María	Lenci Di Giacinti	rosariolenci01@gmail.com	4454794	E.E.S. Nuestra Señora de la Misericordia	San Nicolás, Buenos Aires	Kenia	2016	2017-02-22 23:25:25.37743	2017-02-22 23:25:25.37743	ag	43258728
1143	0	María de los Ángeles	Ponteprino	angieponteprino01@hotmail.com	4456573	E.E.S. Nuestra Señora de la Misericordia	San Nicolás, Buenos Aires	Kenia	2016	2017-02-22 23:25:25.411568	2017-02-22 23:25:25.411568	ag	43258736
1144	0	Camila	Bracco	cami_love_97@live.com	3364435832	E.E.S. Nuestra Señora de la Misericordia	San Nicolás, Buenos Aires	República Democrática del Congo	2016	2017-02-22 23:25:25.459558	2017-02-22 23:25:25.459558	\N	42676335
1145	0	Rocío Pilar	Andriola	met-2-08-00@hotmail.com	336450981	E.E.S. Nuestra Señora de la Misericordia	San Nicolás, Buenos Aires	República Democrática del Congo	2016	2017-02-22 23:25:25.488117	2017-02-22 23:25:25.488117	ag	42780071
1146	0	Stéfano	Berdini	stefanoberdini@yahoo.com.ar	4423901	E.E.S. Nuestra Señora de la Misericordia	San Nicolás, Buenos Aires	República Democrática del Congo	2016	2017-02-22 23:25:25.526947	2017-02-22 23:25:25.526947	sti	42323795
1147	0	Dante	Vanola	dantev_1000@hotmail.com	4430138	E.E.S. Nuestra Señora de la Misericordia	San Nicolás, Buenos Aires	Turquía	2016	2017-02-22 23:25:25.551312	2017-02-22 23:25:25.551312	ag	41567869
1148	0	Julia Inés	Sidor	juli.sidor@hotmail.com	03364445275	E.E.S. Nuestra Señora de la Misericordia	San Nicolás, Buenos Aires	Turquía	2016	2017-02-22 23:25:25.583598	2017-02-22 23:25:25.583598	ag	41312398
1149	0	Sebastián	Lopez	sebastian.lopez.98@hotmail.com	4435106	E.E.S. Nuestra Señora de la Misericordia	San Nicolás, Buenos Aires	Turquía	2016	2017-02-22 23:25:25.606981	2017-02-22 23:25:25.606981	sti	41238057
1150	0	Franco Andrés	De Giacomo	francodegiacomo@gmail.com	3364452602	E.E.S. Nuestra Señora de la Misericordia	San Nicolás, Buenos Aires	Líbano	2016	2017-02-22 23:25:25.637881	2017-02-22 23:25:25.637881	ag	42531116
1151	0	Mateo	Bcandalesi Weiss	mategenio@live.com	3364430557	E.E.S. Nuestra Señora de la Misericordia	San Nicolás, Buenos Aires	Líbano	2016	2017-02-22 23:25:25.665687	2017-02-22 23:25:25.665687	sti	42574541
1152	0						, 	Líbano	2016	2017-02-22 23:25:25.684496	2017-02-22 23:25:25.684496	\N	
1153	0	Fausto	Cesaretti	faustoc@outlook.es	3364210418	E.E.S. Nuestra Señora de la Misericordia	San Nicolás, Buenos Aires	Chad	2016	2017-02-22 23:25:25.721409	2017-02-22 23:25:25.721409	ag	42840148
1154	0	Aitana 	Perez	aitanaperez@hotmail.com	3364433951	E.E.S. Nuestra Señora de la Misericordia	San Nicolás, Buenos Aires	Chad	2016	2017-02-22 23:25:25.755741	2017-02-22 23:25:25.755741	ag	43313335
1155	0	Agustín	Catalín Malín	aguscatamalin@gmail.com	3364562813	E.E.S. Nuestra Señora de la Misericordia	San Nicolás, Buenos Aires	Chad	2016	2017-02-22 23:25:25.803587	2017-02-22 23:25:25.803587	sti	42840189
1156	0	Matías	Rodriguez Mera		02392-15494683	Fundación Colegio Los Médanos	Trenque Lauquen , Buenos Aires	Ghana	2016	2017-02-22 23:25:25.859588	2017-02-22 23:25:25.859588	ag	43056522
1157	0	Bernarda	Bilbao	bilbaober@gmail.com	02392-15407359	Fundación Colegio Los Médanos	Trenque Lauquen , Buenos Aires	Ghana	2016	2017-02-22 23:25:25.915576	2017-02-22 23:25:25.915576	sti	43196669
1158	0	Santiago	Mayorga	rocky1163@hotmail.com	2392433267	Fundación Colegio Los Médanos	Trenque Lauquen , Buenos Aires	Ghana	2016	2017-02-22 23:25:25.962605	2017-02-22 23:25:25.962605	ag	42824561
1159	0	Amparo	Moralejo	ampimoralejo@gmail.com	15445252	Fundación Colegio Los Médanos	Trenque Lauquen , Buenos Aires	Uzbekistán	2016	2017-02-22 23:25:25.98529	2017-02-22 23:25:25.98529	ag	42901612
1160	0	Marcos	Cardini Zar	ballestermariajo@gmail.com	02392620947	Fundación Colegio Los Médanos	Trenque Lauquen , Buenos Aires	Uzbekistán	2016	2017-02-22 23:25:26.010294	2017-02-22 23:25:26.010294	ag	43031041
1161	0	Sofía	Cardini Zar	ballestermariajo@gmail.com	02392-620947	Fundación Colegio Los Médanos	Trenque Lauquen , Buenos Aires	Uzbekistán	2016	2017-02-22 23:25:26.038898	2017-02-22 23:25:26.038898	sti	43031042
1162	1	Julieta	Graziano	juligrazii@gmail.com	2342 464180	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:26.061634	2017-02-22 23:25:26.061634	\N	42135096
1163	0						, 	Corea del Norte	2016	2017-02-22 23:25:26.093991	2017-02-22 23:25:26.093991	\N	
1164	0	Bernarda	Roca Espain	berocaespain@gmail.com	2392410477	Fundación Colegio Los Médanos	Trenque Lauquen , Buenos Aires	Irlanda	2016	2017-02-22 23:25:26.139705	2017-02-22 23:25:26.139705	ag	42342130
1165	0	Josefina	Bouissou	josebouissou@gmail.com	2392579281	Fundación Colegio Los Médanos	Trenque Lauquen , Buenos Aires	Irlanda	2016	2017-02-22 23:25:26.16688	2017-02-22 23:25:26.16688	sti	41896008
1166	0						, 	Irlanda	2016	2017-02-22 23:25:26.188056	2017-02-22 23:25:26.188056	\N	
1167	0	Delfina	Garat	delfinagarat14@gmail.com.ar	239258	Fundación Colegio Los Médanos	Trenque Lauquen , Buenos Aires	Vietnam	2016	2017-02-22 23:25:26.219495	2017-02-22 23:25:26.219495	ag	43022462
1168	0	Francisco	Ustarroz	fran_ustarroz19@hotmail.com.ar	02392-15606914	Fundación Colegio Los Médanos	Trenque Lauquen , Buenos Aires	Vietnam	2016	2017-02-22 23:25:26.24877	2017-02-22 23:25:26.24877	ag	42901559
1169	0	Sofía	Cuerda		412830	Fundación Colegio Los Médanos	Trenque Lauquen , Buenos Aires	Vietnam	2016	2017-02-22 23:25:26.282612	2017-02-22 23:25:26.282612	sti	41901651
1170	0	Santiago Ezequiel	Gomez		2342464253	E.S.B.N°2 Martín Sastre	Bragado, Buenos Aires	Italia	2016	2017-02-22 23:25:26.310821	2017-02-22 23:25:26.310821	sti	43803414
1171	0	Brenda Yasmín 	Bergonce	vaneb_83@live.com.ar	2342544675	E.S.B.N°2 Martín Sastre	Bragado, Buenos Aires	Italia	2016	2017-02-22 23:25:26.341845	2017-02-22 23:25:26.341845	ag	43592876
1172	0	María Magdalena	Bracco	maria-gavino@hotmail.com	423758	E.S.B.N°2 Martín Sastre	Bragado, Buenos Aires	Italia	2016	2017-02-22 23:25:26.365458	2017-02-22 23:25:26.365458	ag	42839115
1173	0	Raúl Carlos	Mendizabal	andre_devi@hotmail.com	2342406295	Escuela Normal	Bragado, Buenos Aires	Ruanda	2016	2017-02-22 23:25:26.398563	2017-02-22 23:25:26.398563	ag	42933172
1174	0	Valentina	Bracco	valen_bracco@hotmail.com	433072	Escuela Normal	Bragado, Buenos Aires	Ruanda	2016	2017-02-22 23:25:26.422471	2017-02-22 23:25:26.422471	ag	43045462
1175	0	Candela	García		431597	Escuela Normal	Bragado, Buenos Aires	Ruanda	2016	2017-02-22 23:25:26.447649	2017-02-22 23:25:26.447649	sti	42568889
1176	0	Candela Natalia	Biana Morossini	candebiamo@hotmail.com	423928	E.S.B.N°2 Martín Sastre	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:26.476405	2017-02-22 23:25:26.476405	sti	42135036
1177	0	Huilem	Signorelli	huiileem02@gmail.com	2342499506	E.S.B.N°2 Martín Sastre	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:26.496304	2017-02-22 23:25:26.496304	ag	41857394
1178	0	Lucia Agustina	Llublican	agustinallublican@yahoo.com.ar	2342533674	E.S.B.N°2 Martín Sastre	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:26.514034	2017-02-22 23:25:26.514034	segib	43256316
1179	0	Mauricio Fabián	Mazzeo		515861	E.S.B.N°2 Martín Sastre	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:26.532217	2017-02-22 23:25:26.532217	ag	41891139
1180	0	Alan Isaías	Marino Frutos		1126540500	E.S.B.N°2 Martín Sastre	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:26.552049	2017-02-22 23:25:26.552049	segib	94944625
1181	0	Candela Natalia	Biana Morossini	candebiamo@hotmail.com	423928	E.S.B.N°2 Martín Sastre	Bragado, Buenos Aires	República de Chile	2016	2017-02-22 23:25:26.573728	2017-02-22 23:25:26.573728	sti	42135036
1182	0	Huilem	Signorelli	huiileem02@gmail.com	2342499506	E.S.B.N°2 Martín Sastre	Bragado, Buenos Aires	República de Chile	2016	2017-02-22 23:25:26.596975	2017-02-22 23:25:26.596975	ag	41857394
1183	0	Mauricio Fabián	Mazzeo		515861	E.S.B.N°2 Martín Sastre	Bragado, Buenos Aires	República de Chile	2016	2017-02-22 23:25:26.622897	2017-02-22 23:25:26.622897	ag	41891139
1184	0	Alan Isaías	Marino Frutos		1126540500	E.S.B.N°2 Martín Sastre	Bragado, Buenos Aires	República de Chile	2016	2017-02-22 23:25:26.643589	2017-02-22 23:25:26.643589	segib	94944625
1185	0	Camila Mariel	Rouera		2342532917	Instituto Privado Agrotècnico	Bragado, Buenos Aires	Palestina	2016	2017-02-22 23:25:26.669177	2017-02-22 23:25:26.669177	sti	43656519
1186	0	Brisa Ayelen	Vila		2342451329	Instituto Privado Agrotècnico	Bragado, Buenos Aires	Palestina	2016	2017-02-22 23:25:26.689797	2017-02-22 23:25:26.689797	ag	44112055
1187	0	Fiamma	Velazquez	mariaestherh960@hotmail.com	2342 423999	E.S.B.N°2 Martín Sastre	Bragado, Buenos Aires	Belgica	2016	2017-02-22 23:25:26.711443	2017-02-22 23:25:26.711443	sti	42963322
1188	0	Candela Katherine	Ponce		422649	E.S.B.N°2 Martín Sastre	Bragado, Buenos Aires	Belgica	2016	2017-02-22 23:25:26.73568	2017-02-22 23:25:26.73568	ag	42112026
1189	0	Antonella	Coronel		427153	E.S.B.N°2 Martín Sastre	Bragado, Buenos Aires	Belgica	2016	2017-02-22 23:25:26.760325	2017-02-22 23:25:26.760325	ag	42057971
1190	0						, 	Belgica	2016	2017-02-22 23:25:26.778611	2017-02-22 23:25:26.778611	\N	
1191	0	Fernando 	Gomez	feerchuu@gmail.com	2342 531907	E.S.B.N°2 Martín Sastre	Bragado, Buenos Aires	Reino Unido	2016	2017-02-22 23:25:26.798849	2017-02-22 23:25:26.798849	sti	39801929
1192	0	Patricia Noemi	Sanchez Baldazzi	sanchez.patr1ci4@gmail.com	2342 407828	Esc de Educ Sec N°2 "Marcos Sastre"	Bragado, Buenos Aires	Reino Unido	2016	2017-02-22 23:25:26.827459	2017-02-22 23:25:26.827459	ag	41857385
1193	0	Micaela Ayelen 	Milano		2342 454792	Esc de Educ Sec N°2 "Marcos Sastre"	Bragado, Buenos Aires	Reino Unido	2016	2017-02-22 23:25:26.864798	2017-02-22 23:25:26.864798	ag	43399175
1194	0	Matias Ezequiel	Carpignano Orellano	maticarpignano@gmail.com	02342 424387	Esc de Educ Sec N°2 "Marcos Sastre"	Bragado, Buenos Aires	Reino Unido	2016	2017-02-22 23:25:26.891433	2017-02-22 23:25:26.891433	cs	40193317
1195	0	Sergio Agustin	Moreno	chufo_70@hotmail.com	02342 555089	E.S.B.N°2 Martín Sastre	Bragado, Buenos Aires	Reino Unido	2016	2017-02-22 23:25:26.937245	2017-02-22 23:25:26.937245	cs	38852022
1196	0	Estefania Araceli	Martinez		2342 15406093		, 	Eslovenia	2016	2017-02-22 23:25:26.962186	2017-02-22 23:25:26.962186	\N	42071071
1197	0	Jose Francisco	Morales Gomez	josegomez_1998@hotmail.com	02342 15408014		, 	Eslovenia	2016	2017-02-22 23:25:26.978567	2017-02-22 23:25:26.978567	\N	41461799
1198	0	Camila Soledad	Zaldarriaga	solezalda1984@hotmail.com.ar	02342 510550	E.E.S Nº 3	Bragado, Buenos Aires	El Salvador	2016	2017-02-22 23:25:27.001524	2017-02-22 23:25:27.001524	sti	43592854
1199	0	Aldana Nair	Fenoy	colofenoy@gmail.com	02342 401543	E.E.S Nº 3	Bragado, Buenos Aires	El Salvador	2016	2017-02-22 23:25:27.025761	2017-02-22 23:25:27.025761	ag	42839171
1200	0	Camila Trinidad	Zamudio		2342 15400818	E.E.S Nº 3	Bragado, Buenos Aires	El Salvador	2016	2017-02-22 23:25:27.049824	2017-02-22 23:25:27.049824	segib	42963360
1201	1	Consuelo 	Tugores 	contugores2@gmail.com	2342484710	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:27.066978	2017-02-22 23:25:27.066978	\N	41461736
1202	1	Josefina 	Rolt	josefinarottchas@gmail.com	2342407260	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:27.086956	2017-02-22 23:25:27.086956	\N	41218280
1203	1	Tatiana	Fernandez	tatianagotta@gmail.com	2342512622	Escuela Normal	Bragado, Buenos Aires	\N	2016	2017-02-22 23:25:27.107171	2017-02-22 23:25:27.107171	\N	41740256
1204	0						, 	Costa Rica	2016	2017-02-22 23:25:27.124361	2017-02-22 23:25:27.124361	\N	
1205	0	Juan Martin	Hernandez		23423201	Escuela Normal	Bragado, Buenos Aires	Bolivia	2016	2017-02-22 23:25:27.14743	2017-02-22 23:25:27.14743	\N	41461853
1206	0						, 	Bolivia	2016	2017-02-22 23:25:27.16655	2017-02-22 23:25:27.16655	\N	
1207	0	Nicolás Agustín	Ramos		2342461064	E.S.B.N°2 Martín Sastre	Bragado, Buenos Aires	República de Chile	2016	2017-02-22 23:25:27.190002	2017-02-22 23:25:27.190002	segib	41293629
1208	0	Guillermina	Fernandez		2342 512382	Instituto Comercial Obrien	Obrien, Buenos Aires	Emiratos Arabes Unidos	2016	2017-02-22 23:25:27.215439	2017-02-22 23:25:27.215439	\N	42 631 522
1209	0	Ignacio	Citate	ccitate@gmail.com	2342 406724	Instituto Comercial Obrien	Obrien, Buenos Aires	Emiratos Arabes Unidos	2016	2017-02-22 23:25:27.246925	2017-02-22 23:25:27.246925	\N	42 631 512
1210	0	Milagros Natally	Peralta Gaynor	carolinaandreaperalta@hotmail.com	02342 532519	Instituto Comercial Obrien	Obrien, Buenos Aires	Emiratos Arabes Unidos	2016	2017-02-22 23:25:27.276787	2017-02-22 23:25:27.276787	\N	41427094
\.


--
-- Name: ex_partakers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('ex_partakers_id_seq', 1210, true);


--
-- Data for Name: inscriptions; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY inscriptions (id, name, phone_number, fax_number, email, location_id, people_id, medical_data_id, professor_id, school_id, rol, partaker_type, participated, type, created_at, updated_at) FROM stdin;
\.


--
-- Name: inscriptions_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('inscriptions_id_seq', 1, false);


--
-- Data for Name: locations; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY locations (id, locatable_id, locatable_type, province, city, street_name, street_number, zip_code, details, created_at, updated_at) FROM stdin;
1	1	School	Buenos Aires	Bragado	Nuñez	429	6640		2016-04-19 04:33:18.750667	2016-04-19 04:33:18.750667
2	2	School	La Pampa	noel wanadero	wana	2131	6640	hola	2016-04-26 02:46:23.555576	2016-04-26 02:46:23.555576
5	5	School	Buenos Aires	Irala	Avellaneda y Pellegrini		6743		2016-06-04 14:54:23.571006	2016-06-04 14:54:23.571006
6	6	School	Buenos Aires	Bragado	La limpia - Zona rural		6645		2016-06-04 14:56:58.35782	2016-06-04 14:56:58.35782
7	7	School	Buenos Aires	Bragado	J. B. Alberdi 	728	6640		2016-06-04 14:59:03.314006	2016-06-04 14:59:03.314006
4	4	School	Buenos Aires	Bragado	Elizondo	2455	6640		2016-06-04 14:07:30.264823	2016-06-04 15:00:46.443384
8	8	School	Buenos Aires	Bragado	Belgrano 	1714	6640		2016-06-21 18:07:34.96714	2016-06-21 19:56:19.062226
9	9	School	Buenos Aires	Bragado	Catamarca 	250	6640		2016-06-25 14:15:21.880813	2016-06-25 14:15:21.880813
10	10	School	Buenos Aires	Bragado	Santa Marìa 	507	6640		2016-06-25 14:16:40.604042	2016-06-25 14:16:40.604042
3	3	School	Buenos Aires	Alberti	Alem	88	6634		2016-06-02 19:20:27.639443	2016-06-25 15:22:15.067424
11	11	School	Buenos Aires	Comodoro Py, Bragado	Barale	s/n	6641		2016-06-30 19:54:09.418071	2016-06-30 19:54:09.418071
12	12	School	Buenos Aires	San Nicolás	Nación 	66	2900	Delagaciones de 3 delegados: 5 \r\nDelagaciones de 5 delegados en CS: 1\r\nDelagiones de 5 delegados en SEGIB: 1\r\nDelegacion de 7 delegados: 1	2016-08-18 00:37:01.598949	2016-08-18 00:37:01.598949
13	13	School	Buenos Aires	Trenque Lauquen 					2016-08-19 17:33:56.703555	2016-08-19 17:33:56.703555
14	14	School	Buenos Aires	Bragado					2016-08-20 00:12:34.219801	2016-08-20 00:12:34.219801
15	15	School	Buenos Aires	Bragado	Belgrano 	1200	6640		2016-08-20 02:42:56.638596	2016-08-20 02:42:56.638596
16	16	School	Buenos Aires	Bragado	Bigorria y Juana Azurdy		6640		2016-08-20 02:44:27.95274	2016-08-20 02:44:27.95274
17	17	School	Buenos Aires	Obrien			6646		2016-08-27 18:48:25.366766	2016-08-27 18:48:25.366766
\.


--
-- Name: locations_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('locations_id_seq', 17, true);


--
-- Data for Name: medical_data; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY medical_data (id, medicable_id, medicable_type, has_chronic_desease, chronic_desease_detail, take_medication, medication_detail, has_medical_background, medical_background_detail, has_allergy, allergy_detail, has_specific_diet, specific_diet_detail, is_vegetarian, doctor_name, doctor_phone_number, urgency_clinic, created_at, updated_at) FROM stdin;
4	2	Professor	f		f		f		f		f		f				2016-06-02 19:21:31.591686	2016-06-02 19:21:31.591686
6	4	Professor	f		f		f		f		f		f				2016-06-02 19:23:22.256973	2016-06-02 19:23:22.256973
7	5	Professor	f		f		f		f		f		f				2016-06-02 19:24:51.822777	2016-06-02 19:24:51.822777
8	3	Partaker	f		f		f		f		f		f				2016-06-02 19:31:09.785157	2016-06-02 19:31:09.785157
9	4	Partaker	f		f		f		f		f		f				2016-06-02 19:31:09.797843	2016-06-02 19:31:09.797843
10	5	Partaker	f		f		f		f		f		f				2016-06-02 19:31:09.807191	2016-06-02 19:31:09.807191
11	6	Partaker	f		f		f		f		f		f				2016-06-02 19:31:09.816955	2016-06-02 19:31:09.816955
12	7	Partaker	f		f		f		f		f		f				2016-06-02 19:31:09.826691	2016-06-02 19:31:09.826691
13	8	Partaker	f		f		f		f		f		f				2016-06-02 19:31:09.835999	2016-06-02 19:31:09.835999
14	9	Partaker	f		f		f		f		f		f				2016-06-02 19:31:09.844983	2016-06-02 19:31:09.844983
16	11	Partaker	f		f		f		f		f		f				2016-06-02 19:34:30.61431	2016-06-02 19:34:30.61431
17	12	Partaker	f		f		f		f		f		f				2016-06-02 19:34:30.625633	2016-06-02 19:34:30.625633
19	14	Partaker	f		f		f		f		f		f				2016-06-02 19:37:07.105079	2016-06-02 19:37:07.105079
20	15	Partaker	f		f		f		f		f		f				2016-06-02 19:37:07.116665	2016-06-02 19:37:07.116665
21	16	Partaker	f		f		f		f		f		f				2016-06-02 19:37:07.133757	2016-06-02 19:37:07.133757
22	17	Partaker	f		f		f		f		f		f				2016-06-02 19:37:07.147132	2016-06-02 19:37:07.147132
23	18	Partaker	f		f		f		f		f		f				2016-06-02 19:40:49.223428	2016-06-02 19:40:49.223428
24	19	Partaker	f		f		f		f		f		f				2016-06-02 19:40:49.233917	2016-06-02 19:40:49.233917
25	20	Partaker	f		f		f		f		f		f				2016-06-02 19:40:49.244277	2016-06-02 19:40:49.244277
26	21	Partaker	f		f		f		f		f		f				2016-06-02 19:40:49.255334	2016-06-02 19:40:49.255334
27	22	Partaker	f		f		f		f		f		f				2016-06-02 19:40:49.265209	2016-06-02 19:40:49.265209
28	6	Professor	f		f		f		f		f		f			Hospital	2016-06-04 13:52:25.315692	2016-06-04 13:52:25.315692
29	7	Professor	f		f		f		f		f		f	Urricelqui		Hospital Municipal San Luis	2016-06-04 14:05:51.983002	2016-06-04 14:05:51.983002
30	23	Partaker	f		f		f		f		f		f	Alejandro Duberti		Sanatorio Circulo Medico Bragado	2016-06-04 14:26:34.097027	2016-06-04 14:26:34.097027
31	24	Partaker	f		f		f		f		f		f			Hospital	2016-06-04 14:26:34.111166	2016-06-04 14:26:34.111166
32	25	Partaker	f		f		f		f		f		f			Clinica Oeste	2016-06-04 14:26:34.125213	2016-06-04 14:26:34.125213
33	26	Partaker	f		f		f		f		f		f	Maria Rosa Mafasanti	234215414945	Hospital San Luis o Sanatorio Circulo Medico	2016-06-04 14:26:34.139662	2016-06-04 14:26:34.139662
34	27	Partaker	f		f		f		t	Cambios de temperatura	f		f	Lucia Alvarez	422409	Nuñez y Remedios de Escalada	2016-06-04 14:26:34.161325	2016-06-04 14:26:34.161325
35	8	Professor	f		f		f		f		f		f	Albizzatti Jorge	234615687111		2016-06-04 14:31:35.384961	2016-06-04 14:31:35.384961
36	9	Professor	f		f		f		f		f		f	Duberti Alejandro	424615	Hospital Municipal San Luis	2016-06-04 14:36:04.998697	2016-06-04 14:36:04.998697
37	10	Professor	f		t	Levotiroxina 25mg - acido folico	t	Operacion de apendice	f		f		f	Rafael Garcia Finger	2342423199	Sanatorio Bragado	2016-06-04 14:41:32.431589	2016-06-04 14:41:32.431589
38	11	Professor	f		f		f		f		f		f	Duberti Alejandro		Sanatorio Circulo Medico Bragado	2016-06-04 14:49:19.473966	2016-06-04 14:49:19.473966
39	12	Professor	f		f		f		f		f		f				2016-06-04 15:02:49.188809	2016-06-04 15:02:49.188809
40	28	Partaker	f		f		f		f		f		f	Gerardo Jauregui Lorda	492045	Hospital	2016-06-04 15:07:58.388098	2016-06-04 15:07:58.388098
41	13	Professor	f		f		f		f		f		f				2016-06-04 15:09:10.752095	2016-06-04 15:09:10.752095
42	29	Partaker	f		f		f		t	Acido mefenamico	f		f	Osvaldo Lobov	234215455902	Sanatorio Circulo Medico	2016-06-04 15:13:18.278422	2016-06-04 15:13:18.278422
43	30	Partaker	f		f		f		f		f		f	Alejandro Duberti	234215505014	Sanatorio Circulo Medico	2016-06-04 15:16:55.422384	2016-06-04 15:16:55.422384
44	31	Partaker	f		f		f		f		f		f	Campagnolo Walter	2342555727	Sanatorio Bragado	2016-06-04 15:34:04.825075	2016-06-04 15:34:04.825075
45	32	Partaker	f		f		f		f		f		f	Lucia Alvarez	2342512659	Hospital Municipal San Luis	2016-06-04 15:34:04.86901	2016-06-04 15:34:04.86901
46	33	Partaker	f		f		f		f		f		f	Laura Ruiz Diaz	234215409092	Sanatorio Bragado	2016-06-04 15:34:04.888517	2016-06-04 15:34:04.888517
47	34	Partaker	f		f		f		f		f		f	Lucia Alvarez	234215512654	Hospital San Luis	2016-06-04 15:34:04.900387	2016-06-04 15:34:04.900387
48	35	Partaker	f		f		f		t	Intolerante a la lactosa	t	No puede ingerir lacteos	f	Lucia Alvarez	234215512654	Hospital San Luis	2016-06-04 15:34:04.912953	2016-06-04 15:34:04.912953
49	36	Partaker	f		f		f		f		f		f	Arturo Gianzanti	2342405531	Sanatorio Centro Medico	2016-06-04 15:51:13.920783	2016-06-04 15:51:13.920783
50	37	Partaker	f		f		f		t	Pipirona (novalgina)	f		f	Lucia Alvarez	234215512654	Hospital San Luis	2016-06-04 15:51:13.933885	2016-06-04 15:51:13.933885
51	38	Partaker	f		f		f		f		f		f	Genaro Manganielo 	2342412162	Sanatorio Bragado	2016-06-04 15:51:13.949299	2016-06-04 15:51:13.949299
52	39	Partaker	f		f		t	Operacion de amigdalas	f		f	Si jamon y pollo	t	Laura Ruiz Diaz	234215409092	Sanatorio Bragado	2016-06-04 15:51:13.964656	2016-06-04 15:51:13.964656
53	40	Partaker	f		f		f		f		f		f	Lucia Alvarez	2342424409	Sanatorio Circulo Medico	2016-06-04 15:51:13.97924	2016-06-04 15:51:13.97924
54	41	Partaker	f		f		f		f		f		f	María del Carmen Holgado	426461	Sanatorio Bragado	2016-06-06 20:17:54.143423	2016-06-06 20:17:54.143423
55	42	Partaker	f		f		f		f		f		f	Anibal Rizzo	425838	Guardia Hospital	2016-06-06 20:17:54.157791	2016-06-06 20:17:54.157791
56	43	Partaker	f		f		f		f		f		f	Maria del Carmen Holgado	426461	Hospital Municipal	2016-06-06 20:17:54.17037	2016-06-06 20:17:54.17037
57	44	Partaker	f		f		f		f		f		f				2016-06-06 20:17:54.185908	2016-06-06 20:17:54.185908
58	45	Partaker	f		f		f		f		f		f	Maria del Carmen Holgado	426461	Sanatorio Bragado	2016-06-06 20:28:40.612968	2016-06-06 20:28:40.612968
59	46	Partaker	f		f		f		f		f		f	Anibal Rizzo	425838	Guardia Hospital	2016-06-06 20:28:40.629818	2016-06-06 20:28:40.629818
60	47	Partaker	f		f		f		f		f		f	Maria del Carmen Holgado	426461	Hospital	2016-06-06 20:28:40.648535	2016-06-06 20:28:40.648535
61	48	Partaker	f		f		f		f		f		f			Sanatorio Circulo Medico	2016-06-06 20:34:58.051087	2016-06-06 20:34:58.051087
62	49	Partaker	f		f		f		f		f		f	Anibal Rizzo	425838	Sanatorio	2016-06-06 20:34:58.0601	2016-06-06 20:34:58.0601
63	50	Partaker	f		f		f		f		f		f	Anibal Rizzo	425838	Sanatorio 	2016-06-06 20:37:27.68696	2016-06-06 20:37:27.68696
64	51	Partaker	f		f		f		f		f		f	Laura Ruiz Diaz	427917	Hospital Municipal	2016-06-06 20:41:01.935437	2016-06-06 20:41:01.935437
65	52	Partaker	f		f		f		f		f		f	Osvaldo Lobov		Sanatorio Bragado	2016-06-06 20:43:45.12082	2016-06-06 20:43:45.12082
66	53	Partaker	f		f		f		f		f		f			Hospital	2016-06-06 20:45:23.21345	2016-06-06 20:45:23.21345
67	54	Partaker	f		f		f		f		f		f	Maria Emilia del Carmen		Hospital Municipal San Luis	2016-06-06 20:50:05.365711	2016-06-06 20:50:05.365711
68	55	Partaker	f		f		f		f		f		f	Jorge A. Duhalde	2342465989	Sanatorio Bragado	2016-06-06 20:52:44.193505	2016-06-06 20:52:44.193505
69	56	Partaker	f		f		f		f		f		f	Maria Rosa Mafasanti	234215414945	Sanatorio Circulo Medico	2016-06-06 20:58:23.55573	2016-06-06 20:58:23.55573
70	57	Partaker	f		f		f		f		f		f	Maria Rosa Mafasanti	234215414945	Sanatorio Circulo Medico	2016-06-21 17:45:18.40081	2016-06-21 17:45:18.40081
71	58	Partaker	f		f		f		f		f		f			Sanatorio del circulo medico	2016-06-21 17:53:35.544459	2016-06-21 17:53:35.544459
72	59	Partaker	f		f		f		f		f		f			Hospital	2016-06-21 17:53:35.556817	2016-06-21 17:53:35.556817
73	60	Partaker	f		f		f		f		f		f	Lasa Silvia	2342457921	Hospital San Luis	2016-06-21 17:53:35.571355	2016-06-21 17:53:35.571355
75	62	Partaker	f		t	Acemuk goo	f		f		f		f	Arturo Gianzanti	430111	Sanatorio circulo medico	2016-06-21 18:03:13.176698	2016-06-21 18:03:13.176698
77	63	Partaker	f		f		f		f		f		f	Maria Emilia Martinez			2016-06-21 18:22:11.754048	2016-06-21 18:22:11.754048
78	64	Partaker	f		f		f		f		f		f	Lucía Álvarez			2016-06-21 18:22:11.775006	2016-06-21 18:22:11.775006
79	65	Partaker	f		f		f		f		f		f	María Rosa Maffasanti	2342414945	Hospital Municipal San Luis	2016-06-21 18:22:11.788483	2016-06-21 18:22:11.788483
80	66	Partaker	f		f		f		f		f		f	Osvaldo Lobov			2016-06-21 18:22:11.802667	2016-06-21 18:22:11.802667
81	67	Partaker	f		f		f		f		f		f	Alejandro Duberti		Hospital Municipal San Luis	2016-06-21 18:22:11.829768	2016-06-21 18:22:11.829768
18	13	Partaker	f		f		f		f		t		t				2016-06-02 19:37:07.087074	2016-08-13 15:45:06.869046
15	10	Partaker	f		f		f		f		f		f				2016-06-02 19:34:30.602579	2016-08-13 15:38:41.55767
82	68	Partaker	f		f		f		f		f		f	Osvaldo Lobov		Sanatorio Círculo Médico	2016-06-21 18:22:11.844747	2016-06-21 18:22:11.844747
152	136	Partaker	f		f		f		f		f		f			Hospital Alberti	2016-06-22 18:48:12.111797	2016-06-22 18:48:12.111797
83	69	Partaker	f		f		f		f		f		f	Marcelo Pérez de Rosa	01157552995	Hospital San Luis	2016-06-21 18:22:11.871248	2016-06-21 18:22:11.871248
84	70	Partaker	f		f		t	Amigdalas	f		f		f	Cristian Zukervar	2342505174	Hospital Municipal San Luis	2016-06-21 18:40:35.827133	2016-06-21 18:40:35.827133
85	71	Partaker	f		f		f		t	Rinitis alérgica	f		f	Gustavo Echave	234215413172	Sanatorio Círculo Médico	2016-06-21 18:40:35.85662	2016-06-21 18:40:35.85662
86	72	Partaker	f		f		f		f		f		f	Fernando Maidana	234215514363	Hospital Municipal San Luis	2016-06-21 18:40:35.878436	2016-06-21 18:40:35.878436
87	73	Partaker	f		f		f		f		f		f				2016-06-21 18:40:35.900653	2016-06-21 18:40:35.900653
88	74	Partaker	f		f		f		f		f		f	Pablo Fescina		Sanatorio Circulo Médico	2016-06-21 18:40:35.921916	2016-06-21 18:40:35.921916
90	76	Partaker	f		t	Dostinex Cabergolina - tiroides	f		t	Cambios climáticos	f		f	Josefina Barrera	2342454198	Sanatorio Circulo Medico	2016-06-21 18:47:39.864878	2016-06-21 18:47:39.864878
76	14	Professor	f		f		t	Mama	f		f		f	Lucía Álvarez	2342512654	Sanatorio del Círculo Médico	2016-06-21 18:05:00.037027	2016-06-21 20:01:40.507697
99	83	Partaker	f		f		f		f		f		f	Lucía Álvarez	2342512654	Sanatorio Circulo Medico	2016-06-21 20:13:13.175487	2016-06-21 20:13:13.175487
101	85	Partaker	f		f		f		f		f		f	Bárbara Ruprech		Hospital Municipal San Luis	2016-06-21 20:18:35.654583	2016-06-21 20:18:35.654583
89	75	Partaker	f		f		f		f		f		f	Maria Rosa Mafasanti	2342414945	Sanatorio Circulo Medico	2016-06-21 18:44:10.454491	2016-06-21 18:44:10.454491
91	77	Partaker	f		f		f		f		f		f				2016-06-21 19:10:48.264314	2016-06-21 19:10:48.264314
92	78	Partaker	f		f		f		f		f		f	Ruprech Bárbara	424409	Hospital San Luiis	2016-06-21 19:10:48.288853	2016-06-21 19:10:48.288853
93	79	Partaker	f		f		f		f		f		f	Gonzalez Ana Belén	15515752	Clinica Privada Oeste	2016-06-21 19:10:48.337167	2016-06-21 19:10:48.337167
94	80	Partaker	f		f		f		f		f		f	Bárbara Ruprech	234215505619		2016-06-21 19:53:41.18692	2016-06-21 19:53:41.18692
95	81	Partaker	f		f		f		f		f		f	Bárbara Ruprech	234215505619	Sanatorio Círculo Medico	2016-06-21 19:53:41.197485	2016-06-21 19:53:41.197485
97	15	Professor	t	Litiasis renal	f		t	2 cesáreas 	t	Penicilina	f		f	Laura Ruiz Diaz	234215409092	Sanatorio del Círculo Médico	2016-06-21 20:05:46.59267	2016-06-21 20:05:46.59267
98	16	Professor	f		f		f		f		f		f				2016-06-21 20:08:55.229824	2016-06-21 20:08:55.229824
100	84	Partaker	f		f		f		f		f		f	Rafael García			2016-06-21 20:15:42.780895	2016-06-21 20:15:42.780895
102	86	Partaker	f		f		f		f		f		f	Laura Ruiz Diaz	2342409092	Hospital Municipal San Luis	2016-06-21 20:21:36.901355	2016-06-21 20:21:36.901355
103	87	Partaker	f		f		f		f		f		f	Osvaldo Lobov	2342455902	Hospital Municipal San Luis	2016-06-21 20:23:44.003213	2016-06-21 20:23:44.003213
104	88	Partaker	f		f		f		f		f		f	Lucia Alvarez	2342424409	Circulo Medico	2016-06-21 20:51:54.192913	2016-06-21 20:51:54.192913
105	89	Partaker	t	Rinitis y Glaucoma	f		t	Operacion ocular por glaucoma	t	Acaros y gramineas	f		f	Maria Rosa Maffasanti	234215414945	Sanatorio Del Circulo Medico	2016-06-21 20:51:54.207768	2016-06-21 20:51:54.207768
106	90	Partaker	f		f		f		f		f		f	Juan Garatti	2342 421366	Sanatorio Bragado	2016-06-21 20:51:54.229939	2016-06-21 20:51:54.229939
107	91	Partaker	t	Bronco espasmos cronico	t	Seretide 125	f		t	Dipirona y penicilina	f		f	Belen Gonzales	2342 15516634	Hospital San Luis	2016-06-21 20:51:54.245108	2016-06-21 20:51:54.245108
108	92	Partaker	f		f		f		f		t	No harinas	f	Maria Holgado	011 40497711	Hospital San Luis	2016-06-21 20:51:54.268088	2016-06-21 20:51:54.268088
109	93	Partaker	f		f		f		f		f		f	Jorge Macias	2342 512020	Sanatorio Bragado	2016-06-21 21:12:56.236354	2016-06-21 21:12:56.236354
110	94	Partaker	f		f		f		f		f		f	Garatti Juan Alberto	2342 470307	Hospital	2016-06-21 21:12:56.251241	2016-06-21 21:12:56.251241
112	96	Partaker	f		f		f		f		f		f	Mabel Lasa	2342 457922	Hospital	2016-06-21 21:12:56.280422	2016-06-21 21:12:56.280422
113	97	Partaker	f		f		t	Garganta	t	Picaduras	f		f	Maidana Fernando	2342 425211 	Sanatorio Bragado	2016-06-21 21:12:56.297613	2016-06-21 21:12:56.297613
114	98	Partaker	f		f		f		f		f		f	Daniel Urricelqui		Hospital Municipal	2016-06-21 21:32:47.070233	2016-06-21 21:32:47.070233
115	99	Partaker	f		f		f		f		f		f	Maria Maffasanti	02342 15414945	Hospital	2016-06-21 21:32:47.079191	2016-06-21 21:32:47.079191
116	100	Partaker	f		f		f		f		f		f	Duberti Alesandro	02342 424615	Sanatorio Del Circulo Medico	2016-06-21 21:32:47.089097	2016-06-21 21:32:47.089097
117	101	Partaker	f		f		f		f		f		f	Osvaldo Lobov	426114	Sanatorio Bragado	2016-06-21 21:32:47.098405	2016-06-21 21:32:47.098405
118	102	Partaker	f		f		f		f		f		f	Vanesa Carbonell	0341 156510518	Hospital Municipal San Luis	2016-06-21 21:32:47.107965	2016-06-21 21:32:47.107965
119	103	Partaker	f		f		f		f		f		f	Maria Maffasantti	02342 414945	Sanatorio Circulo Medico	2016-06-21 21:44:55.835104	2016-06-21 21:44:55.835104
120	104	Partaker	f		f		f		f		f		f	Luis Rizzo- Ruiz Diaz Laura	427917	Sanatorio Bragado	2016-06-21 21:44:55.84691	2016-06-21 21:44:55.84691
122	106	Partaker	f		f		f		f		f		f	Maffasanti Maria Rosa		Sanatorio	2016-06-22 17:36:00.481987	2016-06-22 17:37:27.394569
123	107	Partaker	f		f		f		f		t		t	María Rosa Maffasanti		Hospital Municipal San Luis	2016-06-22 17:37:47.614571	2016-06-22 17:37:47.614571
124	108	Partaker	f		f		f		f		f		f	Alejandro Duberti		Sanatorio 	2016-06-22 17:41:59.23533	2016-06-22 17:41:59.23533
125	109	Partaker	f		f		f		f		f		f	Mario Fescina	234215551845	Sanatorio Circulo Medico	2016-06-22 17:44:02.592241	2016-06-22 17:44:02.592241
127	111	Partaker	f		f		f		f		f		f				2016-06-22 17:56:30.733631	2016-06-22 17:56:30.733631
128	112	Partaker	f		f		t	Apendicitis	f		f		f	Osvaldo Lobov	2342455902	Sanatorio Bragado	2016-06-22 18:02:03.814744	2016-06-22 18:02:03.814744
129	113	Partaker	f		t	Levotiroxina	f		t	Abejas	f		f	Barrera Josefina		Hospital San Luis	2016-06-22 18:08:13.62926	2016-06-22 18:08:13.62926
130	114	Partaker	f		f		t	Estrabismo	f		f		f	Cristian Zukervar	2342505174	Hospital Municipal San Luis	2016-06-22 18:08:20.67012	2016-06-22 18:08:20.67012
131	115	Partaker	f		f		f		f		f		f	Maria Rosa Maffasanti	2342414945	Sanatorio Círculo Médico	2016-06-22 18:08:20.691362	2016-06-22 18:08:20.691362
132	116	Partaker	f		f		f		f		f		f	Fernando Maidana	2342425201	Sanatorio Círculo Médico	2016-06-22 18:08:20.748955	2016-06-22 18:08:20.748955
133	117	Partaker	f		f		f		f		f		f				2016-06-22 18:08:20.769561	2016-06-22 18:08:20.769561
134	118	Partaker	f		f		f		f		f		f	Inés Catalogna	01154987444	Hospital Municipal San Luis	2016-06-22 18:16:15.514296	2016-06-22 18:16:15.514296
135	119	Partaker	f		f		f		f		f		f	Jorge Gaute		Hospital	2016-06-22 18:30:42.937926	2016-06-22 18:30:42.937926
136	120	Partaker	f		f		f		f		f		f	Roberto Cassentini	02346 15563507	Hospital Municipal Alberti	2016-06-22 18:30:42.943948	2016-06-22 18:30:42.943948
137	121	Partaker	f		f		f		f		f		f	Marcelo Sarco	02346 471363	Hospital Municipal 	2016-06-22 18:30:42.950409	2016-06-22 18:30:42.950409
138	122	Partaker	f		f		f		f		f		f	Joaquin Vaccarezza			2016-06-22 18:30:42.9563	2016-06-22 18:30:42.9563
139	123	Partaker	f		t	T4	f		f		f		f	Jorge Gaute	02346 470800	Clinica Alberti	2016-06-22 18:30:42.98193	2016-06-22 18:30:42.98193
140	124	Partaker	f		f		f		f		f		f	Bárbara Ruprech	2342215505619	Sanatorio del Círculo Médico	2016-06-22 18:35:46.479075	2016-06-22 18:35:46.479075
141	125	Partaker	f		f		f		f		f		t	María Maffasanti	2342414945	Hospital Municipal San Luis	2016-06-22 18:35:46.497629	2016-06-22 18:35:46.497629
142	126	Partaker	f		f		f		f		f		f	San Jurjo	Consultorios OSECAC	Sanatorio Círculo Médico	2016-06-22 18:35:46.522903	2016-06-22 18:35:46.522903
143	127	Partaker	f		f		f		f		f		f	Juan Garatti		Sanatorio Círculo Médico	2016-06-22 18:35:46.550842	2016-06-22 18:35:46.550842
144	128	Partaker	f		f		f		f		f		f	Osvaldo Lobov	455902	Sanatorio del Círculo Médico	2016-06-22 18:35:46.567015	2016-06-22 18:35:46.567015
145	129	Partaker	f		f		f		f		f		f	Maidana Fernando	2342425201	Sanatorio del Círculo Médico	2016-06-22 18:44:06.973577	2016-06-22 18:44:06.973577
146	130	Partaker	f		f		t	Estrabismo	f		f		f	Zukervar Cristian	2342505174	Nuñez 238 - Hospital Municipal San Luis	2016-06-22 18:44:07.002225	2016-06-22 18:44:07.002225
148	132	Partaker	f		f		f		f		f		f	Jorge Gante		Hospital Alberti	2016-06-22 18:48:12.0547	2016-06-22 18:48:12.0547
149	133	Partaker	f		f		f		f		f		f	Paola Consolo	02346 568015		2016-06-22 18:48:12.063127	2016-06-22 18:48:12.063127
150	134	Partaker	f		f		f		f		f		f	Herminio Zatti	470293	Hospital 	2016-06-22 18:48:12.073678	2016-06-22 18:48:12.073678
151	135	Partaker	f		f		f		f		f		f	Zatti Herminio	02346 470142	Hospital Municipal Alberti	2016-06-22 18:48:12.085	2016-06-22 18:48:12.085
153	137	Partaker	f		f		f		f		f		f	Gerardo López	2342454116	Hospital Municipal San Luis	2016-06-22 18:49:50.362493	2016-06-22 18:49:50.362493
154	138	Partaker	f		f		f		t	Cambios de tiempo	f		f	Pablo Fescina	02342 425201	Sanatorio Circulo Medico	2016-06-22 18:51:36.732536	2016-06-22 18:51:36.732536
155	139	Partaker	f		f		f		t	Avispas	f		f	Monica Pusso	02342 471521	Sanatorio Bragado	2016-06-22 21:04:51.618296	2016-06-22 21:04:51.618296
156	140	Partaker	f		f		t	Operacion de angioma en la lengua	f		f		f	Maffasanti Maria Rosa 	02342 414945	Sanatorio Circulo Medico	2016-06-22 21:04:51.63188	2016-06-22 21:04:51.63188
157	141	Partaker	f		f		f		f		f		f	Lucia Alvarez	424409	Hospital	2016-06-22 21:04:51.668826	2016-06-22 21:04:51.668826
126	110	Partaker	f		f		f		f		t		t	Gerardo Jauregui Lorda		Sanatorio Bragado	2016-06-22 17:47:07.662079	2016-08-13 15:28:31.486626
96	82	Partaker	f		f		f		f		f		f	Holgado Maria	2342 425018	Hospital Municipal San Luis	2016-06-21 19:53:41.208862	2016-08-19 20:37:33.989099
121	105	Partaker	t	Diabetes	t	Insulina	f		t	Acaros	f		f	Jose Luis Rizzo	Clinica Privada Oeste	Clinica Privada Oeste	2016-06-21 21:44:55.856069	2016-08-19 20:42:23.286541
158	142	Partaker	f		f		f		f		f		f	Fescina Eduardo	02342 422805	Sanatorio Circulo Medico	2016-06-22 21:10:53.672957	2016-06-22 21:10:53.672957
159	143	Partaker	f		f		f		f		f		f	Carlos Casadey	02342 2426114	Sanatorio Bragado	2016-06-22 21:23:54.966619	2016-06-22 21:23:54.966619
160	144	Partaker	f		f		f		f		f		f	Barbara Ruprecht	02342 424409	Hospital	2016-06-22 21:23:55.009589	2016-06-22 21:23:55.009589
161	145	Partaker	f		f		f		f		f		f	Maria Julio Dorrego	02342 414628		2016-06-22 21:23:55.035753	2016-06-22 21:23:55.035753
162	146	Partaker	f		f		f		f		f		f	De Arenaza Gerardo	02342 405391	Hospital	2016-06-22 21:47:34.057679	2016-06-22 21:47:34.057679
163	147	Partaker	f		f		f		f		f		f	Barbara Ruprech		Hospital San Luis	2016-06-22 21:47:34.077637	2016-06-22 21:47:34.077637
164	148	Partaker	f		f		f		f		f		f	Juan Cairatti		Sanatorio Circulo Medico	2016-06-22 21:47:34.089497	2016-06-22 21:47:34.089497
165	149	Partaker	t	Rinosinusitis cronica no alergica	t	claritromicina 500	t	Operacion polipos nasales( sinusitis)	f		f		f	Maria Rosa Maffasanti	02342 15414945	Hospital Municipal	2016-06-22 21:47:34.107815	2016-06-22 21:47:34.107815
166	150	Partaker	f		f		f		f		f		f	Alejandro Duberti		Hospital Municipal/ Sanatorio Circulo Medico	2016-06-22 21:47:34.121773	2016-06-22 21:47:34.121773
169	153	Partaker	f		f		f		t	Polen de las plantas	f		f			Hospital Municipal San Luis	2016-06-23 17:21:24.601189	2016-06-23 17:21:24.601189
170	154	Partaker	t	Broncoespasmo	f		f		t	Broncoespasmo eventual	f		f	Juan Cairatti	2342422098	Sanatorio Circulo Medico	2016-06-23 17:25:25.970461	2016-06-23 17:25:25.970461
171	155	Partaker	f		f		f		f		f		f			Hospital Municipal San Luis	2016-06-23 17:27:12.570081	2016-06-23 17:27:12.570081
172	156	Partaker	f		f		t	Dos operaciones, hace un año, neumotórax 	f		f		f	Mabel Lasa	2342457922	Hospital Municipal San Luis	2016-06-23 17:30:36.150038	2016-06-23 17:30:36.150038
173	157	Partaker	f		f		f		t	Pelos de gato	f		f	Juan Garatti	2342470307	Hospital Municipal San Luis	2016-06-23 17:33:26.896502	2016-06-23 17:33:26.896502
174	158	Partaker	f		f		f		f		f		f			Sanatorio Bragado	2016-06-23 17:49:50.712571	2016-06-23 17:49:50.712571
175	17	Professor	f		f		f		f		f		f				2016-06-23 17:51:29.574652	2016-06-23 17:51:29.574652
177	160	Partaker	f		f		f		t	Algunas comidas, insectos	f		f	Lucía Álvarez	2342512654	Hospital Municipal San Luis	2016-06-23 17:56:03.3424	2016-06-23 17:56:03.3424
178	161	Partaker	f		f		f		f		f		f	Daniel Urricelqui	2342424630	Sanatorio del Círculo Médico	2016-06-23 17:56:03.35219	2016-06-23 17:56:03.35219
179	162	Partaker	f		f		f		f		f		f			Hospital Municipal San Luis	2016-06-23 17:56:03.363813	2016-06-23 17:56:03.363813
180	163	Partaker	f		f		f		f		f		f	Caruso José	236154619959	Hospital Municipal San Luis	2016-06-23 17:56:03.372971	2016-06-23 17:56:03.372971
181	164	Partaker	f		f		f		f		f		f	Juan Garatti	234215470307	Hospital Municipal San Luis	2016-06-23 17:56:03.382212	2016-06-23 17:56:03.382212
183	166	Partaker	f		f		f		t	Amoxicicilina	f		f	Marcelo Solimeo 		Hospital San Luis	2016-06-23 18:00:52.767624	2016-06-23 18:00:52.767624
184	167	Partaker	t	Disritmia cerebral	t	Levecom XR 750	t	Convulsion (una sola vez)	f		f		f	Arturo Gianzanti	02342 15405531	Sanatorio Circulo Medico	2016-06-23 18:05:08.934721	2016-06-23 18:05:08.934721
186	169	Partaker	f		t	Frenaler	f		t	Renitis	f		f	Olgado Maria	2342 423017	Circulo Medico Bragado	2016-06-23 18:10:56.850854	2016-06-23 18:10:56.850854
187	170	Partaker	f		f		f		f		f		f	Lucía Álvarez		Hospital Municipal San Luis	2016-06-23 18:11:57.856666	2016-06-23 18:11:57.856666
188	171	Partaker	f		t	Vacuna antialérgica	t	Adenoides	t	Rinitis alérgica	f		f	María Rosa Maffassanti	2342414945	Hospital Municipal San Luis	2016-06-23 18:11:57.868617	2016-06-23 18:11:57.868617
189	172	Partaker	f		f		f		f		f		f	María Rosa Maffassanti	2342414945	Hospital Municipal San Luis	2016-06-23 18:11:57.884093	2016-06-23 18:11:57.884093
190	173	Partaker	f		f		f		f		f		f	Alejandro Duberti		Hospital San Luis	2016-06-23 18:11:57.893483	2016-06-23 18:11:57.893483
191	174	Partaker	f		f		f		f		f		f			Hospital Municipal San Luis	2016-06-23 18:11:57.9027	2016-06-23 18:11:57.9027
192	175	Partaker	f		f		f		f		f		f	María Rosa Maffassanti	2342414945	Hospital Municipal San Luis	2016-06-23 18:23:40.10244	2016-06-23 18:23:40.10244
193	176	Partaker	f		f		f		f		f		f	Maria Rosa Maffassanti	2342414945	Hospital Municipal San Luis	2016-06-23 18:23:40.112502	2016-06-23 18:23:40.112502
194	177	Partaker	f		f		f		f		f		f			Clínica Oeste	2016-06-23 18:23:40.123723	2016-06-23 18:23:40.123723
195	178	Partaker	f		f		f		t	Ibuprofeno	f		f	Medici Mara	02346 572149	Sanatorio Bragado	2016-06-23 18:28:32.133229	2016-06-23 18:28:32.133229
196	179	Partaker	f		f		f		f		f		f	Jose Luis Rizzo	02342 430741	Clinica Privada Oeste	2016-06-23 18:28:32.144362	2016-06-23 18:28:32.144362
197	180	Partaker	f		f		f		f		f		f	Maria Rosa Maffasanti		Sanatorio Circulo Medico	2016-06-23 18:28:32.153822	2016-06-23 18:28:32.153822
198	181	Partaker	f		f		t	Amigdalas	f		f		f	Solimeo Marcelo	02342 15514348	Sanatorio Circulo Medico	2016-06-23 18:28:32.162816	2016-06-23 18:28:32.162816
199	182	Partaker	f		f		f		f		f		f	Maria Rosa Maffasanti	02342 15414945	Hospital	2016-06-23 18:28:32.176284	2016-06-23 18:28:32.176284
200	183	Partaker	f		t	Cabergolina	f		f		f		f			Hospital Municipal San Luis	2016-06-23 18:31:22.425192	2016-06-23 18:31:53.075245
201	184	Partaker	f		f		f		f		f		f	Maria Rosa Maffasanti	02342 15414945	Hospital	2016-06-23 18:40:42.061539	2016-06-23 18:40:42.061539
202	185	Partaker	f		f		f		f		f		f	Barbara Ruprecht	02342 424409	Hospital	2016-06-23 18:40:42.073325	2016-06-23 18:40:42.073325
203	186	Partaker	f		f		f		f		f		f	Juan Alberto Garatti	02342 15470307	Hospital	2016-06-23 18:40:42.08359	2016-06-23 18:40:42.08359
204	187	Partaker	f		f		f		f		f		f	Osvaldo Lovob	234215455902	Sanatorio del Círculo Médico	2016-06-23 19:03:55.706912	2016-06-23 19:03:55.706912
205	188	Partaker	f		f		f		f		f		f	Mabel Lasa		Hospital Municipal San Luis	2016-06-23 19:03:55.716758	2016-06-23 19:03:55.716758
206	189	Partaker	f		f		f		f		f		f	Marcelo Solimeo	Consultorios externos	Sanatorio Bragado	2016-06-23 19:03:55.728697	2016-06-23 19:03:55.728697
207	190	Partaker	f		f		f		f		f		f				2016-06-23 19:03:55.738282	2016-06-23 19:03:55.738282
208	191	Partaker	f		f		f		t	Picadura de hormiga	f		f	Mabel Lasa	2342430572	Hospital Municipal San Luis	2016-06-23 19:03:55.748069	2016-06-23 19:03:55.748069
209	192	Partaker	f		f		f		f		f		f	Jaureguilorda Gerardo		Sanatorio Bragado	2016-06-23 19:05:09.495926	2016-06-23 19:05:09.495926
210	193	Partaker	f		f		f		f		f		f			Hospital San Luis	2016-06-23 19:05:09.507176	2016-06-23 19:05:09.507176
212	195	Partaker	f		f		f		f		f		f	Emma Elizalde		Hospital Bragado	2016-06-23 19:05:09.528617	2016-06-23 19:05:09.528617
213	196	Partaker	f		f		f		t	Metales	f		f	Ana Belen Gonzalez		Hospital Bragado	2016-06-23 19:05:09.541039	2016-06-23 19:05:09.541039
214	197	Partaker	f		f		f		f		f		f	Lucia Alvarez		Sanatorio Bragado	2016-06-23 19:34:32.68465	2016-06-23 19:34:32.68465
216	199	Partaker	f		f		f		f		f		f	Marcelo Solimeo		Sanatorio Bragado	2016-06-23 19:34:32.718214	2016-06-23 19:34:32.718214
217	200	Partaker	t	Broncoespasmo	f		t	Operacion de Tibia y Perone	f		f		f	Pablo Fescina		Sanatorio Bragado	2016-06-23 19:59:58.451321	2016-06-23 19:59:58.451321
218	201	Partaker	f		f		f		f		f		f				2016-06-23 19:59:58.465743	2016-06-23 19:59:58.465743
219	202	Partaker	f		f		f		f		f		f				2016-06-23 19:59:58.474861	2016-06-23 19:59:58.474861
220	203	Partaker	f		f		f		f		f		f	Solimeo Marcelo	02342 1551434	Hospital San Luis	2016-06-23 19:59:58.484906	2016-06-23 19:59:58.484906
221	204	Partaker	f		f		f		f		f		f	Maria Rosa Maffasanti	02342 15414945	Hospital Bragado	2016-06-23 19:59:58.49636	2016-06-23 19:59:58.49636
222	205	Partaker	f		f		f		f		f		t	María Elena Bellusci	234615553160	Hospital Municipal San Luis	2016-06-23 20:01:36.952878	2016-06-23 20:01:36.952878
167	151	Partaker	f		f		f		f		f		f				2016-06-23 17:21:24.576599	2016-08-19 20:56:20.023132
168	152	Partaker	f		f		f		f		f		f	Daniel Jaureguilorda		Hospital Municipal San Luis	2016-06-23 17:21:24.590483	2016-08-19 21:01:06.367255
215	198	Partaker	f		f		f		f		f		f	Veronica Torres Romero	02342 491446	Sanatorio Circulo Medico	2016-06-23 19:34:32.700788	2016-08-19 21:19:50.483326
223	206	Partaker	f		f		f		f		f		f	Joaquin Vaccarezza		Hospital Municipal San Luis	2016-06-23 20:01:36.969829	2016-06-23 20:01:36.969829
224	207	Partaker	f		f		f		f		f		f	Jorge Gaute	2346411786	Centro Médico Alberti	2016-06-23 20:01:36.984605	2016-06-23 20:01:36.984605
225	208	Partaker	f		f		f		f		f		f				2016-06-23 20:01:36.996082	2016-06-23 20:01:36.996082
226	209	Partaker	f		f		f		f		f		f	José María Manterola	471653	Hospital Municipal Alberti	2016-06-23 20:01:37.00855	2016-06-23 20:01:37.00855
227	210	Partaker	f		f		f		f		f		f	Dr. Gaute	234615411786		2016-06-23 20:01:37.021121	2016-06-23 20:01:37.021121
228	211	Partaker	f		f		f		f		f		f	Jorge Gaute	234615411786	Hospital	2016-06-23 20:01:37.034743	2016-06-23 20:01:37.034743
232	215	Partaker	f		f		f		f		f		f	Insua Hugo Horacio	2342427093	Sanatorio del Círculo médico	2016-06-25 14:39:22.375609	2016-06-25 14:39:22.375609
233	216	Partaker	f		f		t	Apendicitis	f		f		f	José Rizzo		Clínica privada Oeste	2016-06-25 14:39:22.38313	2016-06-25 14:39:22.38313
234	217	Partaker	f		f		f		t	Ácaros-Insectos	f		f	María Holgado	01140497711	Hospital Municipal San Luis	2016-06-25 15:00:35.886956	2016-06-25 15:00:35.886956
235	218	Partaker	f		f		f		f		f		f	Osvaldo Lovob	2342455902	Hospital Municipal San Luis	2016-06-25 15:00:35.901129	2016-06-25 15:00:35.901129
236	219	Partaker	f		f		f		f		f		f			Hospital Municipal San Luis	2016-06-25 15:00:35.911314	2016-06-25 15:00:35.911314
237	220	Partaker	f		f		f		f		f		f	Patricia Pucheta		Hospital Municipal San Luis	2016-06-25 15:00:35.926468	2016-06-25 15:00:35.926468
238	221	Partaker	f		f		f		f		f		f	Belén González	2342421899	Hospital Municipal San Luis	2016-06-25 15:00:35.946531	2016-06-25 15:00:35.946531
239	222	Partaker	f		f		t	hernia inguinal - amigdalas y adenoides	f		f		f	Álvarez Lucía	2342512654	Hospital Municipal San Luis	2016-06-25 15:20:07.365281	2016-06-25 15:20:07.365281
240	223	Partaker	f		f		f		f		f		t	Torres Romero Verónica	2342491446	Clínica Privada Oeste	2016-06-25 15:20:07.407739	2016-06-25 15:20:07.407739
241	224	Partaker	f		f		f		f		f		f				2016-06-25 15:20:07.4246	2016-06-25 15:20:07.4246
242	225	Partaker	f		f		f		f		f		f	Insua Hugo Horacio	2342427093	Hospital Municipal San Luis	2016-06-25 15:35:48.945372	2016-06-25 15:35:48.945372
243	226	Partaker	f		f		t	Operacón codo brazo izquierdo	f		f		f	María Rosa Maffasanti	2342414945	Hospital Municipal San Luis	2016-06-25 15:35:48.9532	2016-06-25 15:35:48.9532
244	227	Partaker	f		f		f		f		f		f	Duberti Alejandro Ezequiel	2342505014	Hospital Municipal San Luis	2016-06-25 15:35:48.962483	2016-06-25 15:35:48.962483
245	228	Partaker	f		f		f		f		f		f				2016-06-25 15:35:48.972567	2016-06-25 15:35:48.972567
246	229	Partaker	f		f		f		t	Bactrim Forte	f		f	Daniel Jauregui Lorda		Hospital Municipal San Luis	2016-06-25 15:41:20.553542	2016-06-25 15:41:20.553542
247	230	Partaker	f		f		f		t	insectos	f		f				2016-06-28 18:32:44.880202	2016-06-28 18:32:44.880202
248	231	Partaker	f		f		f		f		f		f			Hospital Municipal San Luis	2016-06-28 18:32:44.895048	2016-06-28 18:32:44.895048
249	232	Partaker	f		f		f		f		f		f			Hospital Municipal San Luis	2016-06-28 18:32:44.907475	2016-06-28 18:32:44.907475
250	233	Partaker	f		f		f		f		f		f				2016-06-28 18:32:44.920631	2016-06-28 18:32:44.920631
251	234	Partaker	f		f		f		f		f		f	Fernando Maidana		Sanatorio del Círculo Médico	2016-06-28 18:32:44.93045	2016-06-28 18:32:44.93045
252	235	Partaker	f		f		f		f		f		f			Hospital Municipal San Luis	2016-06-28 18:41:49.927703	2016-06-28 18:41:49.927703
253	236	Partaker	f		f		f		f		f		f	Blaiota Paula	425201	Sanatorio Bragado	2016-06-28 18:41:49.94381	2016-06-28 18:41:49.94381
254	237	Partaker	f		f		f		f		f		f	Laura Ruiz Diaz	2342409092	Sanatorio u Hospital	2016-06-28 18:45:29.811392	2016-06-28 18:45:29.811392
255	238	Partaker	f		f		f		f		f		f	Juan Cairatti	424244	Sanatorio Bragado	2016-06-28 19:03:32.080943	2016-06-28 19:03:32.080943
256	239	Partaker	f		f		f		f		f		f	Maria Rosa Maffasanti			2016-06-28 19:03:32.094744	2016-06-28 19:03:32.094744
257	240	Partaker	f		f		f		f		f		f	Pablo Fescina	425201	Sanatorio Bragado	2016-06-28 19:03:32.104415	2016-06-28 19:03:32.104415
258	241	Partaker	f		f		f		f		f		f	María Rosa Maffasanti	2342414945	Clinica Privada Oeste	2016-06-28 19:03:32.11512	2016-06-28 19:03:32.11512
259	242	Partaker	f		f		f		f		f		f				2016-06-28 19:03:32.156239	2016-06-28 19:03:32.156239
260	243	Partaker	f		t	Vitamina E	f		f		f		f	Maidana Fernando	425201	Sanatorio Circulo Medico	2016-06-28 19:09:51.753789	2016-06-28 19:09:51.753789
261	244	Partaker	f		f		f		f		f		f			Sanatorio Circulo Medico	2016-06-28 19:13:54.144265	2016-06-28 19:13:54.144265
262	245	Partaker	f		f		f		f		f		f	Silvia Herrera	423515	Hospital Municipal	2016-06-28 19:27:12.989739	2016-06-28 19:27:12.989739
263	246	Partaker	f		f		f		f		f		f			Hospital San Luis	2016-06-28 19:27:12.9963	2016-06-28 19:27:12.9963
264	247	Partaker	f		f		f		t	Picadura de barigüi	f		f	Urricelqui Daniel	2342424630	Sanatorio del Circulo Medico	2016-06-28 19:27:13.003124	2016-06-28 19:27:13.003124
265	248	Partaker	f		f		f		f		f		f				2016-06-28 19:27:13.012373	2016-06-28 19:27:13.012373
266	249	Partaker	f		f		f		f		f		f	Juan Garatti	421366	Hospital Municipal San Luis	2016-06-28 19:33:39.803189	2016-06-28 19:33:39.803189
267	250	Partaker	f		f		f		f		f		f	Ivan Boiko	0111569140439	Sanatorio Bragado	2016-06-28 19:36:52.616616	2016-06-28 19:36:52.616616
268	251	Partaker	f		f		f		f		f		f	Maria Rosa Mafasanti	414945	Sanatorio Circulo Medico	2016-06-28 19:38:50.636976	2016-06-28 19:38:50.636976
269	252	Partaker	f		f		f		f		f		f			Hospital Municipal San Luis	2016-06-28 19:49:48.629895	2016-06-28 19:49:48.629895
270	253	Partaker	f		f		f		f		f		f			Hospital Municipal San Luis	2016-06-28 19:49:48.638005	2016-06-28 19:49:48.638005
271	254	Partaker	f		f		f		f		f		f	Maria Rosa Maffasanti	404945	Hospital	2016-06-28 19:49:48.648131	2016-06-28 19:49:48.648131
272	255	Partaker	f		f		f		f		f		f				2016-06-28 20:18:35.393791	2016-06-28 20:18:35.393791
273	256	Partaker	f		f		f		f		f		f				2016-06-29 20:35:04.998048	2016-06-29 20:35:04.998048
274	257	Partaker	f		f		f		t	Dipirona. Alergias bronquiales	f		f	Osvaldo Lovob	2342425211	Sanatorio del Circulo Medico	2016-06-29 20:35:05.013751	2016-06-29 20:35:05.013751
275	258	Partaker	f		f		f		f		f		f				2016-06-29 20:35:05.061205	2016-06-29 20:35:05.061205
276	259	Partaker	f		f		f		f		f		f	Daniel Jauregui Lorda	2342421877	Hospital	2016-06-29 20:43:01.902335	2016-06-29 20:43:01.902335
277	260	Partaker	f		f		f		f		f		f			Sanatorio Bragado	2016-06-29 20:43:01.935622	2016-06-29 20:43:01.935622
278	261	Partaker	f		f		f		f		f		f	Veronica Torres		Clinica Privada Oeste	2016-06-29 20:43:01.959676	2016-06-29 20:43:01.959676
279	262	Partaker	f		f		f		f		f		f	Barbara Ruprech		Sanatorio Bragado	2016-06-30 17:32:50.307506	2016-06-30 17:32:50.307506
280	263	Partaker	f		f		f		f		f		f	Holgado Maria Del Carmen	Barrera 261	Sanatorio Bragado	2016-06-30 17:38:09.012568	2016-06-30 17:38:09.012568
281	264	Partaker	f		f		f		f		f		f	Maffasanti Maria Rosa	02342 414946	Sanatorio Bragado	2016-06-30 17:41:14.030689	2016-06-30 17:41:14.030689
282	265	Partaker	f		f		f		f	Amoxilina	f		f	Maffasanti Maria Rosa	0234215414945	Hospital Municipal	2016-06-30 18:04:10.968207	2016-06-30 18:04:10.968207
283	266	Partaker	f		f		f		f		f		f	Juan Garatti	234215470307	Sanatorio Bragado	2016-06-30 18:07:45.26464	2016-06-30 18:07:45.26464
284	267	Partaker	f		f		f		f		f		f	Urricelqui Daniel		Sanatorio Bragado	2016-06-30 18:27:16.494816	2016-06-30 18:27:16.494816
285	268	Partaker	f		f		t	Operacion de garganta	f		f		f				2016-06-30 18:27:16.505415	2016-06-30 18:27:16.505415
286	269	Partaker	f		f		t	Operado de hernia y de neumonia pleural	f		f		f	Duberti	424615	Hospital San Luis	2016-06-30 18:27:16.51428	2016-06-30 18:27:16.51428
287	270	Partaker	f		f		f		f		f		f	Juan Garatti	421366	Sanatorio Bragado	2016-06-30 18:27:16.525083	2016-06-30 18:27:16.525083
288	271	Partaker	f		f		f		f		f		f	Cristian Zukerbar	02342 15505174	Sanatorio Bragado	2016-06-30 18:27:16.536463	2016-06-30 18:27:16.536463
290	273	Partaker	f		f		f		f		f		f	Marcelo Solimeo	2342 15426114	Sanatorio Bragado	2016-06-30 18:45:47.971833	2016-06-30 18:45:47.971833
291	274	Partaker	f		f		f		f		f		f	Daniel Urricelqui		Hospital Bragado	2016-06-30 18:45:47.982333	2016-06-30 18:45:47.982333
297	280	Partaker	f		f		f		f		f		f			Sanatorio Circulo Medico	2016-06-30 19:16:41.839875	2016-06-30 19:16:41.839875
231	214	Partaker	f		f		f		f		f		f	Juan Garatti		Hospital o Sanatorio Bragado	2016-06-25 14:39:22.369596	2016-08-26 22:35:13.411016
230	213	Partaker	f		f		f		f		f		f	Lobov Osbaldo		Sanatorio Bragado	2016-06-25 14:39:22.363217	2016-08-26 22:41:45.23797
229	212	Partaker	f		f		f		f		f		f	Marcelo Perez de Rosa		Sanatorio Bragado	2016-06-25 14:39:22.35514	2016-08-26 22:49:02.055381
292	275	Partaker	f		f		f		f		f		f	Juan Garatti	2342 470307	Hospital Bragado	2016-06-30 18:45:47.990997	2016-06-30 18:45:47.990997
293	276	Partaker	f		f		f		f		f		f	Juan Garatti		Sanatorio Bragado	2016-06-30 18:45:47.999871	2016-06-30 18:45:47.999871
294	277	Partaker	f		f		t	Hipoplasia en el nervio optico izquierdo	f		f		f	Olgado Maria	02342 425018	Hospital Municipal	2016-06-30 18:58:01.580484	2016-06-30 18:58:01.580484
295	278	Partaker	f		f		f		f		f		f			Hospital Bragado	2016-06-30 18:58:01.592949	2016-06-30 18:58:01.592949
296	279	Partaker	f		f		f		f		f		f			Hospital San Luis	2016-06-30 18:58:01.602264	2016-06-30 18:58:01.602264
147	131	Partaker	f		f		f		f		f		f	María Rosa Mafassanti	2342414945	Sanatorio Circulo Medico	2016-06-22 18:44:07.02486	2016-06-30 19:42:29.216339
298	281	Partaker	f		f		f		f		f		f			Hospital San Luis	2016-06-30 19:16:41.855502	2016-06-30 19:16:41.855502
299	282	Partaker	t	Asma Bronquial	t	Seretide	f		t	Acaros, pelo de perro y polen de Fresnos	f		f	Eduardo Fescina	02342 15409349	Hospital San Luis	2016-06-30 19:16:41.869995	2016-06-30 19:16:41.869995
300	283	Partaker	f		f		f		f		f		f				2016-06-30 19:44:37.531013	2016-06-30 19:44:37.531013
302	285	Partaker	f		f		f		f		f		f			Hospital San Luis	2016-06-30 21:07:07.107182	2016-06-30 21:07:07.107182
303	286	Partaker	f		f		f		f		f		f	Alejandro Duberti		Hospital Municipal San Luis	2016-06-30 21:07:07.113873	2016-06-30 21:07:07.113873
304	287	Partaker	f		f		f		f		f		f	Maria Rosa Maffasanti	2342414945	Las Acacias 506	2016-06-30 21:07:07.120433	2016-06-30 21:07:07.120433
305	288	Partaker	f		f		f		f		f		f	Fernando Maidana		Hospital Municipal San Luis	2016-06-30 21:07:07.127135	2016-06-30 21:07:07.127135
306	289	Partaker	f		f		t	Tobillo, peroné, ligamento lateral interno	f		f		f	Maria Rosa Mafasanti	414945	Sanatorio Bragado	2016-06-30 21:07:07.133969	2016-06-30 21:07:07.133969
307	290	Partaker	f		f		f		f		f		f				2016-06-30 21:11:43.314424	2016-06-30 21:11:43.314424
309	292	Partaker	f		f		f		f		f		f	José Norberto Losinno	2342430070	Sanatorio Circulo Medico	2016-06-30 21:32:48.99218	2016-06-30 21:32:48.99218
310	293	Partaker	f		f		f		f		f		f	Nievas Eduardo Alberto	2342495070	Hospital San Luis	2016-06-30 21:50:35.210162	2016-06-30 21:50:35.210162
311	294	Partaker	f		f		f		f		f		f	Nievas Eduardo Alberto	2342495070	Hospital San Luis	2016-06-30 21:50:35.216097	2016-06-30 21:50:35.216097
312	295	Partaker	f		f		f		f		f		f	Duberti Alejandro	234215505014	Hospital San Luis	2016-06-30 21:50:35.222135	2016-06-30 21:50:35.222135
313	296	Partaker	f		f		f		f		f		f				2016-06-30 21:50:35.231528	2016-06-30 21:50:35.231528
314	297	Partaker	f		f		f		f		f		f				2016-06-30 22:26:29.452551	2016-06-30 22:26:29.452551
316	299	Partaker	f		f		f		f		f		f				2016-06-30 22:26:29.467816	2016-06-30 22:26:29.467816
317	300	Partaker	f		f		f		f		f		f	Mario Corte		Hospital San Luis	2016-06-30 22:26:29.473904	2016-06-30 22:26:29.473904
318	301	Partaker	f		f		f		t	Polen	f		f	Bárbara Rupretch		Sanatorio Bragado	2016-06-30 22:26:29.47991	2016-06-30 22:26:29.47991
319	302	Partaker	f		f		f		f		f		f			Hospital Municipal San Luis	2016-06-30 22:26:29.485978	2016-06-30 22:26:29.485978
320	303	Partaker	f		f		f		f		f		f	Osvaldo Lovob		Sanatorio Bragado	2016-06-30 22:26:29.492401	2016-06-30 22:26:29.492401
321	304	Partaker	f		f		f		f		f		f	Osvaldo Lovob	426124	Hospital San Luis	2016-06-30 22:29:53.976693	2016-06-30 22:29:53.976693
324	307	Partaker	f		f		f		f		f		f			Hospital Municipal	2016-07-08 12:38:34.52138	2016-07-08 12:38:34.52138
325	308	Partaker	f		f		f		f		f		f			Hospital San Luis	2016-08-13 05:11:07.326903	2016-08-13 05:11:07.326903
326	309	Partaker	f		f		f		f		f		f				2016-08-13 05:14:53.311224	2016-08-13 05:14:53.311224
327	310	Partaker	f		f		f		f		f		f	Laura Ruiz Diaz	2342409092	Sanatorio Circulo Medico	2016-08-13 05:17:48.102726	2016-08-13 05:17:48.102726
329	312	Partaker	f		f		f		f		f		f	Osvaldo Lobov	Sanatorio Circulo Medico	Sanatorio Circulo Medico	2016-08-13 05:30:50.665404	2016-08-13 05:30:50.665404
330	313	Partaker	f		f		f		f		f		f	Maximiliano Gabriel	2364643573	Sanatorio Bragado	2016-08-13 05:30:50.671638	2016-08-13 05:30:50.671638
331	314	Partaker	f		f		t	Amigdalas y adenoides	f		f		f	Urricelqui Daniel	2342 424630	Sanatorio Circulo Medico Bragado	2016-08-13 05:30:50.677959	2016-08-13 05:30:50.677959
333	316	Partaker	f		f		f		f		f		f	Alesandro Duberti			2016-08-13 05:46:33.375086	2016-08-13 05:46:33.375086
334	317	Partaker	f		f		t	Ladio Leporino Paladar blando y duro sin campanilla	f		f		f				2016-08-13 05:46:33.38084	2016-08-13 05:46:33.38084
335	318	Partaker	f		f		f		f		f		f	Romiti Roxana	236 456341	Hospital San Luis	2016-08-13 05:46:33.386881	2016-08-13 05:46:33.386881
336	319	Partaker	f		f		f		f		f		f			Sanatorio Bragado	2016-08-13 05:46:33.392642	2016-08-13 05:46:33.392642
337	320	Partaker	f		f		f		f		f		f	Maidana Fernando	2342 425201	Sanatorio Bragado	2016-08-13 05:58:17.197313	2016-08-13 05:58:17.197313
338	321	Partaker	f		f		f		f		f		f	Gonzales Ana Belen	15515753	Hospital San Luis	2016-08-13 05:58:17.204165	2016-08-13 05:58:17.204165
339	322	Partaker	f		f		f		f		f		f	Gonzales Ana Belen	2342 515753	Hospital 	2016-08-13 05:58:17.210387	2016-08-13 05:58:17.210387
340	323	Partaker	f		f		f		f		f		f	Gonzales Ana Belen	15515753	Hospital	2016-08-13 05:58:17.216658	2016-08-13 05:58:17.216658
341	324	Partaker	f		f		f		f		f		f			Hospital San Luis 	2016-08-13 05:58:17.222995	2016-08-13 05:58:17.222995
342	325	Partaker	f		f		f		f		f		f	Fabian Molina	2352 406470	Clinica Pequeña Familia	2016-08-13 06:09:36.654253	2016-08-13 06:09:36.654253
343	326	Partaker	f		f		f		f		f		f	Cabral Felix Daniel	02342 492031	Hospital San Luis	2016-08-13 06:09:36.663608	2016-08-13 06:09:36.663608
344	327	Partaker	f		f		f		f		f		f	Oscar Bergamini	0236 154682886	Imel Junin	2016-08-13 06:09:36.672539	2016-08-13 06:09:36.672539
345	328	Partaker	f		f		f		t	Antitermicos	f		f	Maria Rosa Maffasanti		Hospital San Luis	2016-08-13 06:21:11.804588	2016-08-13 06:21:11.804588
346	329	Partaker	f		f		f		f		f		f	Vanesa Carbonell	02341 156510518	Hospital San Luis 	2016-08-13 06:21:11.814716	2016-08-13 06:21:11.814716
347	330	Partaker	f		f		t	Operacion de oidos	f		f		f			Hospital San Luis	2016-08-13 06:21:11.822793	2016-08-13 06:21:11.822793
348	331	Partaker	f		f		f		f		f		f				2016-08-13 06:21:11.832791	2016-08-13 06:21:11.832791
349	332	Partaker	f		f		f		f		f		f			Hospital San Luis	2016-08-13 06:29:43.407952	2016-08-13 06:29:43.407952
350	333	Partaker	f		f		f		f		f		f	Lucia Alvarez	2342 512654	Hospital San Luis	2016-08-13 06:29:43.4138	2016-08-13 06:29:43.4138
351	334	Partaker	f		f		f		f		f		f	Maria Rosa Maffasanti	02342 15414945	Hospital San Luis	2016-08-13 06:29:43.419454	2016-08-13 06:29:43.419454
353	336	Partaker	f		f		f		t	Insectos,Polen,Polvillo	f		f	Rizzo Jose Luzs	430309	Clinica Privada Oeste	2016-08-13 06:40:40.279038	2016-08-13 06:40:40.279038
354	337	Partaker	f		f		f		f		f		f	Mabel Lasa		Hospital San Luis	2016-08-13 06:43:26.768864	2016-08-13 06:43:26.768864
355	338	Partaker	f		f		f		f		f		f	Finger Maria A	02346 557774	Hospital San Luis	2016-08-13 06:46:05.233865	2016-08-13 06:46:05.233865
356	339	Partaker	f		f		f		f		f		f	Lobov Osvaldo		Sanatorio Circulo Medico	2016-08-13 06:48:58.261361	2016-08-13 06:48:58.261361
357	340	Partaker	f		f		f		f		f		t	Cairatti Juan	2342533956	Sanatorio Bragado	2016-08-13 14:52:41.959767	2016-08-13 14:52:41.959767
358	341	Partaker	f		f		f		f		f		f			Hospital San Luis	2016-08-13 14:52:41.971713	2016-08-13 14:52:41.971713
359	342	Partaker	f		f		f		f		f		f	Belen Gonzales	2342516634	Hospital San Luis	2016-08-13 14:52:41.986136	2016-08-13 14:52:41.986136
360	343	Partaker	f		f		f		f		f		f	María Rosa Mafasanti	2342414945	Hospital San Luis	2016-08-13 14:52:41.995347	2016-08-13 14:52:41.995347
361	344	Partaker	f		f		t	Injerto de ligamentos en rodilla izquierda	t	Acaros y platano	f		f	Barbara Ruprech	2342505619	Sanatorio del Circulo Medico	2016-08-13 14:52:42.004503	2016-08-13 14:52:42.004503
362	345	Partaker	f		f		f		f		f		f	Mabel Lasa	422060	Sanatorio Circulo Medico	2016-08-13 15:05:18.738172	2016-08-13 15:05:18.738172
363	346	Partaker	f		f		f		f		f		f	Hugo Horacio Insua	2342427093	Sanatorio Bragado	2016-08-13 15:05:18.752963	2016-08-13 15:05:18.752963
364	347	Partaker	f		f		f		f		f		f	María Maffassanti		Sanatorio Circulo Médico	2016-08-13 15:05:18.763904	2016-08-13 15:05:18.763904
365	348	Partaker	f		f		f		f		f		f			Hospital San Luis	2016-08-13 15:09:41.849259	2016-08-13 15:15:52.940454
366	349	Partaker	f		f		f		f		f		f			Sanatorio Circulo Médico	2016-08-13 15:15:52.965071	2016-08-13 15:15:52.965071
332	315	Partaker	f		f		f		f		f		t	Guardia		Hospital San Luis	2016-08-13 05:46:33.368785	2016-08-13 15:17:45.020681
74	61	Partaker	f		f		f		f		t		t	Lasa Silvia	2342421436	Hospital San Luis	2016-06-21 17:59:34.320479	2016-08-13 15:22:05.714508
211	194	Partaker	f		f		t	Operacion de amigdalas	f		t	Solo pastas	t	Maria Rosa Maffasanti		Hospital Bragado	2016-06-23 19:05:09.517088	2016-08-13 15:47:40.778846
315	298	Partaker	f		f		f		f		f		f	Jose Luis Rizzo	2342 15405875	Clinica Privada Oeste	2016-06-30 22:26:29.461116	2016-08-19 20:06:00.186821
352	335	Partaker	f		f		t	Operacion de garganta	f		f		f	Catalogna Maria Ines	01154987444	Hospital Municipal y Sanatorio Bragado	2016-08-13 06:36:31.186832	2016-08-26 22:58:36.659537
111	95	Partaker	f		f		f		f		t	No come milanesas	f	Garatti Juan	02342 421366	Hospital San Luis	2016-06-21 21:12:56.262933	2016-08-13 15:50:07.076497
369	350	Partaker	f		f		f		f		f		f	Angelina Brazesco	03364430370	Hospital-Sanatorio	2016-08-18 00:43:44.367934	2016-08-18 00:43:44.367934
370	351	Partaker	f		f		t	Escoliosis (operada)	f		f		f	Gaston Crucianelli	0336-1542611339	Hospital	2016-08-18 00:43:44.378342	2016-08-18 21:55:40.035192
371	352	Partaker	f		f		f		f		f		f	Daniela Mutti	4416783	Hospital	2016-08-18 21:55:40.04483	2016-08-18 22:24:55.972546
372	353	Partaker	f		f		t	Operación de apéndice	t	Picaduras de insectos	f		f	Jorge Dinoto	03344424853	Hospital más cercano	2016-08-19 01:19:05.33219	2016-08-19 01:19:05.33219
373	354	Partaker	f		f		t	Adenoides (10 años)	f		f		f	María Angelina Brazzesco	03364430370	Hospital	2016-08-19 01:19:05.34829	2016-08-19 01:19:05.34829
374	355	Partaker	f		f		f		f		f		f	Fernando Alonso	033615421117	Hospital más cercano	2016-08-19 01:19:05.360738	2016-08-19 01:19:05.360738
375	356	Partaker	t	Hipertensión	t	Lotrial-Losacor	f		f		t	Sin sal (hipertenso)	f	Luis Stávila		Hospital más cercano	2016-08-19 01:35:45.742825	2016-08-19 01:35:45.742825
376	357	Partaker	t	Estenosis esofágica	t	Lanzopral MD	t	Dilatación del esófago	f		t	Solo bebe agua con las comidas	f	Florencia Fernandez	3364445275	Hospital más cercano	2016-08-19 01:35:45.754799	2016-08-19 01:35:45.754799
377	358	Partaker	t	Hiperlaxitud	f		t	Recesión intestinal con colostomia, luego retransitación y adenoides 	t	Cambios climáticos	f	Debe tomar mucho líquido	f	Gustavo S. Smilaski	3364430023	Hospital más cercano	2016-08-19 01:35:45.766386	2016-08-19 01:35:45.766386
378	359	Partaker	t	Hipotiroidismo	t	Levotiroxina	f		t	Estacional, al cambio climatico y al polvillo	f		f	Lautancio Sergio	4430023	Hospital más cercano	2016-08-19 01:50:34.395679	2016-08-19 01:50:34.395679
379	360	Partaker	f		f		f		f		f		f	Campanella Alejandrina		Hospital más cercano	2016-08-19 01:50:34.407266	2016-08-19 01:50:34.407266
380	361	Partaker	f		f		f		f		f		f				2016-08-19 01:50:34.423134	2016-08-19 01:50:34.423134
381	362	Partaker	f		f		f		f		f		f	Graciela Shutte	3364545906	Hospital más cercano	2016-08-19 02:10:40.499758	2016-08-19 02:10:40.499758
382	363	Partaker	f		f		f		t	Dipirona - Picaduras de insectos	f		f	Alejandrina Campanella	3364424385		2016-08-19 02:10:40.509309	2016-08-19 02:10:40.509309
383	364	Partaker	f		f		f		f		f		f	Mirtha Rezet		Hospital	2016-08-19 02:10:40.5205	2016-08-19 02:10:40.5205
368	19	Professor	t	Irritación bronquial (consecuencia del TEP)	t	Sintron	t	Tronboenbolismo pulmonar (noviembre 2015)	t	Paracetamol/ berenjenas	f		f	Claudia Traveset	0336154628589	Centro médico más cercano	2016-08-18 00:39:07.910417	2016-08-19 17:23:37.938635
367	18	Professor	t	Hipotiroidismo	t	Levotiroxina	t	Histeroctomía parcial	f		f		f	Javier Zandoli	03364429612	Sanatorio	2016-08-18 00:38:35.480046	2016-08-19 17:28:02.150875
384	20	Professor	f		f		f		f		f		f				2016-08-19 17:31:01.653872	2016-08-19 17:31:01.653872
301	284	Partaker	f		f		f		f		f		f	Lucia Alvarez		Sanatorio Bragado	2016-06-30 20:44:22.927988	2016-08-19 17:38:55.962547
385	365	Partaker	f		f		f		f		f		f	Mario Swing			2016-08-19 17:43:12.563173	2016-08-19 17:43:12.563173
386	366	Partaker	f		f		f		f		f		f	Paola Pujol	0239215584019	Bs As	2016-08-19 17:43:12.572011	2016-08-19 17:43:12.572011
387	367	Partaker	f		f		f		f		f		f	Mario Schwindt		Hospital o Sanatorio	2016-08-19 17:43:12.580901	2016-08-19 17:43:12.580901
388	368	Partaker	f		f		f		f		f		f	Hugo Ressita	2392430284	Hospital	2016-08-19 20:23:01.157716	2016-08-19 20:23:01.157716
389	369	Partaker	f		f		f		f		f		f			Hospital más cercano	2016-08-19 20:23:01.168867	2016-08-19 20:23:01.168867
390	370	Partaker	f		f		f		f		f		f			Hospital más cercano	2016-08-19 20:23:01.179181	2016-08-19 20:23:01.179181
391	371	Partaker	f		f		f		f		f		f	Maria Angela Finger	431175	Sanatorio Bragado	2016-08-19 20:33:32.815841	2016-08-19 20:33:32.815841
392	372	Partaker	f		f		t	Extracción del frontal	f		f		f	Carlos Yarza	2392410745	Hospital	2016-08-19 20:57:26.165575	2016-08-19 20:57:26.165575
393	373	Partaker	f		f		f		f		f		f	Fernando Dalto	0239215493060	Hospital	2016-08-19 20:57:26.172894	2016-08-19 20:57:26.172894
394	374	Partaker	f		f		f		f		f		f				2016-08-19 20:57:26.180694	2016-08-19 20:57:26.180694
395	375	Partaker	f		f		f		f		f		f			Hospital	2016-08-19 21:12:46.379069	2016-08-19 21:12:46.379069
396	376	Partaker	f		f		f		f		f		f	Abel Dalbene	239215530840		2016-08-19 21:12:46.385851	2016-08-19 21:12:46.385851
397	377	Partaker	f		f		f		f		f		f	Paula Pujol			2016-08-19 21:12:46.392759	2016-08-19 21:12:46.392759
289	272	Partaker	f		f		f		f		f		f	Duberti Alejandro Ezequiel	2342 505014	Sanatorio Bragado	2016-06-30 18:45:47.96252	2016-08-19 21:56:02.210741
398	21	Professor	f		f		f		f		f		f				2016-08-20 00:13:03.589936	2016-08-20 00:13:03.589936
399	378	Partaker	f		f		f		f		f		f			Hospital	2016-08-20 00:22:37.304003	2016-08-20 00:22:37.304003
400	379	Partaker	f		f		f		f		f		f			Hospital San Luis	2016-08-20 00:22:37.313704	2016-08-20 00:22:37.313704
401	380	Partaker	f		f		f		f		f		t			Hospital	2016-08-20 00:22:37.324736	2016-08-20 00:22:37.324736
402	381	Partaker	f		f		t	Hernia inguinal/Amigdalas y adenoides	f		f		f	Alvarez Lucia	2342512654	Hospital San Luis	2016-08-20 00:45:12.156091	2016-08-20 00:45:12.156091
403	382	Partaker	f		f		f		f		f		t	Torres Romero Veronica	2342491446	Clinica Privada Oeste	2016-08-20 00:45:12.167482	2016-08-20 00:45:12.167482
404	383	Partaker	f		f		f		f		f		f			Hospital	2016-08-20 00:45:12.177234	2016-08-20 00:45:12.177234
405	22	Professor	f		f		f		f		f		f				2016-08-20 00:51:02.829004	2016-08-20 00:51:02.829004
406	384	Partaker	f		f		f		f		f		f				2016-08-20 01:06:41.871472	2016-08-20 01:06:41.871472
407	385	Partaker	f		f		f		f		f		f			Hospital San Luis	2016-08-20 01:06:41.882419	2016-08-20 01:06:41.882419
408	386	Partaker	f		f		f		t	Hormigas	f		f			Hospital San Luis	2016-08-20 01:06:41.891328	2016-08-20 01:06:41.891328
409	387	Partaker	f		f		f		f		f		f			Hospital San Luis	2016-08-20 01:06:41.901959	2016-08-20 01:06:41.901959
410	388	Partaker	f		f		f		f		f		f				2016-08-20 01:06:41.911069	2016-08-20 01:06:41.911069
411	389	Partaker	f		f		f		f		f		f				2016-08-20 01:07:37.84471	2016-08-20 01:07:37.84471
412	390	Partaker	f		f		f		f		f		f			Hospital San Luis	2016-08-20 01:07:37.857207	2016-08-20 01:07:37.857207
413	391	Partaker	f		f		f		t	Hormigas	f		f			Hospital San Luis	2016-08-20 01:07:37.869537	2016-08-20 01:07:37.869537
414	392	Partaker	f		f		f		f		f		f			Hospital San Luis	2016-08-20 01:07:37.883141	2016-08-20 01:07:37.883141
415	393	Partaker	f		f		f		f		f		f				2016-08-20 01:07:37.895762	2016-08-20 01:07:37.895762
416	394	Partaker	f		f		f		f		f		f				2016-08-20 01:13:33.256644	2016-08-20 01:13:33.256644
417	395	Partaker	f		f		f		f		f		f			Hospital San Luis	2016-08-20 01:13:33.26905	2016-08-20 01:13:33.26905
418	23	Professor	f		f		f		f		f		f				2016-08-20 02:46:48.159187	2016-08-20 02:46:48.159187
419	396	Partaker	f		f		t	Nariz, Garganta	f		f		f	Garatti Juan	2342 421366	Circulo Medico Bragado	2016-08-20 03:16:54.874101	2016-08-20 03:16:54.874101
420	397	Partaker	f		f		f		f		f		f	Maria Rosa Maffasanti	15414945	Sanatorio Bragado	2016-08-20 03:16:54.882946	2016-08-20 03:16:54.882946
421	398	Partaker	f		f		f		f		f		f				2016-08-20 03:16:54.890236	2016-08-20 03:16:54.890236
422	399	Partaker	f		f		f		f		f		f				2016-08-20 03:16:54.898022	2016-08-20 03:16:54.898022
423	400	Partaker	f		f		f		f		f		f			Sanatorio Bragado	2016-08-20 03:31:59.887127	2016-08-20 03:31:59.887127
424	401	Partaker	f		f		f		f		f		f				2016-08-20 03:31:59.894349	2016-08-20 03:31:59.894349
425	402	Partaker	f		f		f		f		f		f				2016-08-20 03:31:59.902464	2016-08-20 03:31:59.902464
426	403	Partaker	t	Asma	t	Singulaia 10mg. Frevia 80/4,5 	f		t	Picaduras de insectos	f		f	Eduardo Fescina 	02342 422805	Laprida N°56 	2016-08-20 03:31:59.90922	2016-08-20 03:31:59.90922
427	404	Partaker	t	Bronquitis Obstrutiva	t	Buolesonide (PAF) y salbutamol (PAF)	f		f		f		f	Elizallde Ema			2016-08-20 03:31:59.917667	2016-08-20 03:31:59.917667
428	405	Partaker	f		f		f		f		f		f				2016-08-20 03:39:45.617731	2016-08-20 03:39:45.617731
429	406	Partaker	f		f		f		f		f		f	Maria Holgado		Hospital San Luis	2016-08-20 03:39:45.628419	2016-08-20 03:39:45.628419
430	407	Partaker	f		f		f		f		f		f	Gonzales Ana Belen	15515750	Hospital San Luis	2016-08-20 03:48:19.496558	2016-08-20 03:48:19.496558
431	408	Partaker	t	Dirritmia Cerebral	t	Carbamacepina 200mg	f		f		f		f			Hospital San Luis	2016-08-20 03:48:19.521402	2016-08-20 03:48:19.521402
432	409	Partaker	f		f		f		f		f		f	Ruprech Barbara	2342 15505619	Hospital San Luis	2016-08-20 03:48:19.541735	2016-08-20 03:48:19.541735
433	410	Partaker	f		f		f		f		f		f	Emma Elizalde	2342407427	Hospital San Luis	2016-08-26 22:10:49.623092	2016-08-26 22:10:49.623092
435	412	Partaker	f		f		f		f		f		f	Maria Mac Adden 			2016-08-26 22:19:23.682527	2016-08-26 22:19:23.682527
438	415	Partaker	f		f		f		f		f		f				2016-08-26 22:58:36.669928	2016-08-26 22:58:36.669928
436	413	Partaker	f		f		f		f		f		f	Laura Ruiz Diaz 	2342409092	Sanatorio de Bragado	2016-08-26 22:26:35.986177	2016-08-26 22:26:35.986177
437	414	Partaker	f		f		f		f		f		f				2016-08-26 22:49:02.071628	2016-08-26 22:49:02.071628
439	24	Professor	f		f		f		f		f		f				2016-08-27 18:40:40.450587	2016-08-27 18:40:40.450587
440	416	Partaker	f		f		f		f		f		f	Gerez Ricardo Angel	2342 498296	Hospital Municipal	2016-08-27 18:59:35.644042	2016-08-27 18:59:35.644042
441	417	Partaker	f		f		f		f		f		f	Zalloco Angel	02364685993	Sanatorio	2016-08-27 18:59:35.651537	2016-08-27 18:59:35.651537
442	418	Partaker	f		f		f		t	Asma Bronquil Cronico	f		f				2016-08-27 18:59:35.657513	2016-08-27 18:59:35.657513
\.


--
-- Name: medical_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('medical_data_id_seq', 442, true);


--
-- Data for Name: partakers; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY partakers (id, people_id, medical_data_id, professor_id, school_id, created_at, updated_at, rol, type, year, participated, delegation_id) FROM stdin;
3	\N	\N	2	3	2016-06-02 19:31:09.775343	2016-06-02 19:31:09.775343	2	Delegate	2016	f	3
4	\N	\N	2	3	2016-06-02 19:31:09.790597	2016-06-02 19:31:09.790597	1	Delegate	2016	f	3
5	\N	\N	2	3	2016-06-02 19:31:09.801333	2016-06-02 19:31:09.801333	3	Delegate	2016	f	3
6	\N	\N	2	3	2016-06-02 19:31:09.810781	2016-06-02 19:31:09.810781	0	Delegate	2016	f	3
7	\N	\N	2	3	2016-06-02 19:31:09.820248	2016-06-02 19:31:09.820248	2	Delegate	2016	f	3
8	\N	\N	2	3	2016-06-02 19:31:09.830016	2016-06-02 19:31:09.830016	1	Delegate	2016	f	3
9	\N	\N	2	3	2016-06-02 19:31:09.839218	2016-06-02 19:31:09.839218	0	Delegate	2016	f	3
10	\N	\N	2	3	2016-06-02 19:34:30.592366	2016-06-02 19:34:30.592366	0	Delegate	2016	f	4
11	\N	\N	2	3	2016-06-02 19:34:30.607869	2016-06-02 19:34:30.607869	3	Delegate	2016	f	4
12	\N	\N	2	3	2016-06-02 19:34:30.618043	2016-06-02 19:34:30.618043	0	Delegate	2016	f	4
13	\N	\N	2	3	2016-06-02 19:37:07.074548	2016-06-02 19:37:07.074548	2	Delegate	2016	f	5
14	\N	\N	2	1	2016-06-02 19:37:07.095486	2016-06-02 19:37:07.095486	2	Delegate	2016	f	5
15	\N	\N	2	3	2016-06-02 19:37:07.109423	2016-06-02 19:37:07.109423	3	Delegate	2016	f	5
16	\N	\N	2	3	2016-06-02 19:37:07.122196	2016-06-02 19:37:07.122196	0	Delegate	2016	f	5
17	\N	\N	2	3	2016-06-02 19:37:07.139054	2016-06-02 19:37:07.139054	0	Delegate	2016	f	5
18	\N	\N	2	3	2016-06-02 19:40:49.215385	2016-06-02 19:40:49.215385	0	Delegate	2016	f	6
19	\N	\N	2	3	2016-06-02 19:40:49.226841	2016-06-02 19:40:49.226841	0	Delegate	2016	f	6
20	\N	\N	2	3	2016-06-02 19:40:49.237857	2016-06-02 19:40:49.237857	3	Delegate	2016	f	6
21	\N	\N	2	3	2016-06-02 19:40:49.248161	2016-06-02 19:40:49.248161	1	Delegate	2016	f	6
22	\N	\N	2	3	2016-06-02 19:40:49.258699	2016-06-02 19:40:49.258699	1	Delegate	2016	f	6
23	\N	\N	7	4	2016-06-04 14:26:34.087418	2016-06-04 14:26:34.087418	2	Delegate	2016	t	7
24	\N	\N	7	4	2016-06-04 14:26:34.101345	2016-06-04 14:26:34.101345	2	Delegate	2016	f	7
25	\N	\N	7	4	2016-06-04 14:26:34.116124	2016-06-04 14:26:34.116124	3	Delegate	2016	f	7
26	\N	\N	7	4	2016-06-04 14:26:34.130282	2016-06-04 14:26:34.130282	0	Delegate	2016	f	7
27	\N	\N	7	4	2016-06-04 14:26:34.144857	2016-06-04 14:26:34.144857	0	Delegate	2016	f	7
28	\N	\N	12	1	2016-06-04 15:07:58.377328	2016-06-04 15:07:58.377328	\N	Authority	2016	f	\N
29	\N	\N	13	1	2016-06-04 15:13:18.268999	2016-06-04 15:13:18.268999	\N	Authority	2016	f	\N
30	\N	\N	12	1	2016-06-04 15:16:55.415859	2016-06-04 15:16:55.415859	\N	Authority	2016	f	\N
31	\N	\N	12	1	2016-06-04 15:34:04.789902	2016-06-04 15:34:04.789902	3	Delegate	2016	f	8
32	\N	\N	11	1	2016-06-04 15:34:04.84477	2016-06-04 15:34:04.84477	1	Delegate	2016	t	8
33	\N	\N	11	4	2016-06-04 15:34:04.878096	2016-06-04 15:34:04.878096	0	Delegate	2016	f	8
34	\N	\N	11	4	2016-06-04 15:34:04.892668	2016-06-04 15:34:04.892668	1	Delegate	2016	t	8
35	\N	\N	11	4	2016-06-04 15:34:04.904872	2016-06-04 15:34:04.904872	0	Delegate	2016	t	8
36	\N	\N	13	1	2016-06-04 15:51:13.912012	2016-06-04 15:51:13.912012	0	Delegate	2016	f	9
37	\N	\N	12	1	2016-06-04 15:51:13.925017	2016-06-04 15:51:13.925017	1	Delegate	2016	f	9
38	\N	\N	12	1	2016-06-04 15:51:13.940982	2016-06-04 15:51:13.940982	3	Delegate	2016	f	9
39	\N	\N	11	4	2016-06-04 15:51:13.953637	2016-06-04 15:51:13.953637	1	Delegate	2016	t	9
40	\N	\N	11	4	2016-06-04 15:51:13.970712	2016-06-04 15:51:13.970712	0	Delegate	2016	f	9
41	\N	\N	9	7	2016-06-06 20:17:54.131111	2016-06-06 20:17:54.131111	0	Delegate	2016	f	10
42	\N	\N	9	7	2016-06-06 20:17:54.150068	2016-06-06 20:17:54.150068	3	Delegate	2016	f	10
43	\N	\N	9	7	2016-06-06 20:17:54.162175	2016-06-06 20:17:54.162175	0	Delegate	2016	f	10
44	\N	\N	\N	\N	2016-06-06 20:17:54.175136	2016-06-06 20:17:54.175136	\N	Delegate	2016	f	10
45	\N	\N	9	7	2016-06-06 20:28:40.588853	2016-06-06 20:28:40.588853	0	Delegate	2016	f	11
46	\N	\N	9	7	2016-06-06 20:28:40.620646	2016-06-06 20:28:40.620646	0	Delegate	2016	f	11
47	\N	\N	9	7	2016-06-06 20:28:40.640408	2016-06-06 20:28:40.640408	3	Delegate	2016	f	11
48	\N	\N	9	7	2016-06-06 20:34:58.044999	2016-06-06 20:34:58.044999	0	Delegate	2016	f	12
49	\N	\N	9	7	2016-06-06 20:34:58.054264	2016-06-06 20:34:58.054264	3	Delegate	2016	f	12
50	\N	\N	9	7	2016-06-06 20:37:27.659896	2016-06-06 20:37:27.659896	0	Delegate	2016	f	12
51	\N	\N	13	1	2016-06-06 20:41:01.923708	2016-06-06 20:41:01.923708	\N	Authority	2016	f	\N
52	\N	\N	13	1	2016-06-06 20:43:45.10951	2016-06-06 20:43:45.10951	\N	Authority	2016	f	\N
53	\N	\N	12	1	2016-06-06 20:45:23.198651	2016-06-06 20:45:23.198651	\N	Authority	2016	f	\N
54	\N	\N	12	1	2016-06-06 20:50:05.353097	2016-06-06 20:50:05.353097	\N	Authority	2016	f	\N
55	\N	\N	12	1	2016-06-06 20:52:44.185201	2016-06-06 20:52:44.185201	\N	Authority	2016	f	\N
56	\N	\N	13	1	2016-06-06 20:58:23.497634	2016-06-06 20:58:23.497634	\N	Authority	2016	f	\N
57	\N	\N	12	1	2016-06-21 17:45:18.387957	2016-06-21 17:45:18.387957	\N	Authority	2016	f	\N
58	\N	\N	12	1	2016-06-21 17:53:35.529737	2016-06-21 17:53:35.529737	0	Delegate	2016	f	13
59	\N	\N	12	1	2016-06-21 17:53:35.550202	2016-06-21 17:53:35.550202	0	Delegate	2016	f	13
60	\N	\N	12	1	2016-06-21 17:53:35.562751	2016-06-21 17:53:35.562751	3	Delegate	2016	f	13
61	\N	\N	13	1	2016-06-21 17:59:34.311466	2016-06-21 17:59:34.311466	\N	Authority	2016	f	\N
62	\N	\N	12	1	2016-06-21 18:03:13.160047	2016-06-21 18:03:13.160047	\N	Authority	2016	f	\N
63	\N	\N	13	1	2016-06-21 18:22:11.730136	2016-06-21 18:22:11.730136	\N	Delegate	2016	f	14
64	\N	\N	13	1	2016-06-21 18:22:11.761282	2016-06-21 18:22:11.761282	\N	Delegate	2016	f	14
65	\N	\N	13	1	2016-06-21 18:22:11.779374	2016-06-21 18:22:11.779374	\N	Delegate	2016	f	14
66	\N	\N	13	1	2016-06-21 18:22:11.792571	2016-06-21 18:22:11.792571	2	Delegate	2016	f	14
67	\N	\N	13	1	2016-06-21 18:22:11.810565	2016-06-21 18:22:11.810565	2	Delegate	2016	t	14
68	\N	\N	13	1	2016-06-21 18:22:11.834755	2016-06-21 18:22:11.834755	3	Delegate	2016	t	14
69	\N	\N	13	1	2016-06-21 18:22:11.852917	2016-06-21 18:22:11.852917	\N	Delegate	2016	t	14
70	\N	\N	14	8	2016-06-21 18:40:35.808256	2016-06-21 18:40:35.808256	0	Delegate	2016	t	15
71	\N	\N	14	8	2016-06-21 18:40:35.841229	2016-06-21 18:40:35.841229	3	Delegate	2016	f	15
72	\N	\N	14	8	2016-06-21 18:40:35.865265	2016-06-21 18:40:35.865265	1	Delegate	2016	t	15
73	\N	\N	14	8	2016-06-21 18:40:35.885823	2016-06-21 18:40:35.885823	1	Delegate	2016	f	15
74	\N	\N	14	8	2016-06-21 18:40:35.907474	2016-06-21 18:40:35.907474	0	Delegate	2016	t	15
75	\N	\N	14	8	2016-06-21 18:44:10.446486	2016-06-21 18:44:10.446486	\N	Authority	2016	f	\N
76	\N	\N	14	8	2016-06-21 18:47:39.854756	2016-06-21 18:47:39.854756	\N	Authority	2016	f	\N
77	\N	\N	14	8	2016-06-21 19:10:48.244434	2016-06-21 19:10:48.244434	0	Delegate	2016	f	16
78	\N	\N	14	8	2016-06-21 19:10:48.271035	2016-06-21 19:10:48.271035	0	Delegate	2016	f	16
79	\N	\N	14	8	2016-06-21 19:10:48.29744	2016-06-21 19:10:48.29744	3	Delegate	2016	f	16
80	\N	\N	14	8	2016-06-21 19:53:41.176127	2016-06-21 19:53:41.176127	3	Delegate	2016	f	17
81	\N	\N	14	8	2016-06-21 19:53:41.190973	2016-06-21 19:53:41.190973	0	Delegate	2016	f	17
82	\N	\N	14	8	2016-06-21 19:53:41.200742	2016-06-21 19:53:41.200742	0	Delegate	2016	f	17
83	\N	\N	12	1	2016-06-21 20:13:13.168484	2016-06-21 20:13:13.168484	\N	Authority	2016	f	\N
84	\N	\N	12	1	2016-06-21 20:15:42.774374	2016-06-21 20:15:42.774374	\N	Authority	2016	f	\N
85	\N	\N	12	1	2016-06-21 20:18:35.637515	2016-06-21 20:18:35.637515	\N	Authority	2016	f	\N
86	\N	\N	13	1	2016-06-21 20:21:36.892255	2016-06-21 20:21:36.892255	\N	Authority	2016	f	\N
87	\N	\N	12	1	2016-06-21 20:23:43.99144	2016-06-21 20:23:43.99144	\N	Authority	2016	f	\N
88	\N	\N	14	8	2016-06-21 20:51:54.180638	2016-06-21 20:51:54.180638	0	Delegate	2016	f	18
89	\N	\N	14	8	2016-06-21 20:51:54.198618	2016-06-21 20:51:54.198618	\N	Delegate	2016	f	18
90	\N	\N	14	8	2016-06-21 20:51:54.214216	2016-06-21 20:51:54.214216	\N	Delegate	2016	t	18
91	\N	\N	14	8	2016-06-21 20:51:54.23454	2016-06-21 20:51:54.23454	\N	Delegate	2016	f	18
92	\N	\N	14	8	2016-06-21 20:51:54.260578	2016-06-21 20:51:54.260578	\N	Delegate	2016	f	18
93	\N	\N	14	8	2016-06-21 21:12:56.226576	2016-06-21 21:12:56.226576	2	Delegate	2016	f	19
94	\N	\N	14	8	2016-06-21 21:12:56.240311	2016-06-21 21:12:56.240311	0	Delegate	2016	f	19
95	\N	\N	14	8	2016-06-21 21:12:56.255977	2016-06-21 21:12:56.255977	2	Delegate	2016	f	19
96	\N	\N	14	8	2016-06-21 21:12:56.266789	2016-06-21 21:12:56.266789	\N	Delegate	2016	f	19
97	\N	\N	14	8	2016-06-21 21:12:56.287706	2016-06-21 21:12:56.287706	\N	Delegate	2016	f	19
98	\N	\N	14	8	2016-06-21 21:32:47.064238	2016-06-21 21:32:47.064238	\N	Delegate	2016	f	20
99	\N	\N	14	8	2016-06-21 21:32:47.073347	2016-06-21 21:32:47.073347	\N	Delegate	2016	f	20
100	\N	\N	14	8	2016-06-21 21:32:47.082501	2016-06-21 21:32:47.082501	\N	Delegate	2016	f	20
101	\N	\N	14	8	2016-06-21 21:32:47.092305	2016-06-21 21:32:47.092305	\N	Delegate	2016	f	20
102	\N	\N	14	8	2016-06-21 21:32:47.101629	2016-06-21 21:32:47.101629	\N	Delegate	2016	f	20
103	\N	\N	14	8	2016-06-21 21:44:55.827137	2016-06-21 21:44:55.827137	\N	Delegate	2016	f	21
104	\N	\N	14	8	2016-06-21 21:44:55.838518	2016-06-21 21:44:55.838518	3	Delegate	2016	f	21
105	\N	\N	14	8	2016-06-21 21:44:55.850216	2016-06-21 21:44:55.850216	0	Delegate	2016	f	21
106	\N	\N	12	1	2016-06-22 17:36:00.474682	2016-06-22 17:36:00.474682	\N	Authority	2016	f	\N
107	\N	\N	13	1	2016-06-22 17:37:47.608494	2016-06-22 17:37:47.608494	\N	Authority	2016	f	\N
108	\N	\N	13	1	2016-06-22 17:41:59.229706	2016-06-22 17:41:59.229706	\N	Authority	2016	f	\N
109	\N	\N	13	1	2016-06-22 17:44:02.585464	2016-06-22 17:44:02.585464	\N	Authority	2016	f	\N
110	\N	\N	12	1	2016-06-22 17:47:07.657283	2016-06-22 17:47:07.657283	\N	Authority	2016	f	\N
111	\N	\N	13	1	2016-06-22 17:56:30.728137	2016-06-22 17:56:30.728137	\N	Delegate	2016	t	22
112	\N	\N	12	1	2016-06-22 18:02:03.809875	2016-06-22 18:02:03.809875	\N	Authority	2016	f	\N
113	\N	\N	11	4	2016-06-22 18:08:13.621811	2016-06-22 18:08:13.621811	\N	Authority	2016	f	\N
114	\N	\N	12	1	2016-06-22 18:08:20.661785	2016-06-22 18:08:20.661785	\N	Delegate	2016	f	23
115	\N	\N	13	1	2016-06-22 18:08:20.680335	2016-06-22 18:08:20.680335	\N	Delegate	2016	f	23
116	\N	\N	13	1	2016-06-22 18:08:20.694978	2016-06-22 18:08:20.694978	\N	Delegate	2016	f	23
117	\N	\N	\N	\N	2016-06-22 18:08:20.761273	2016-06-22 18:08:20.761273	\N	Delegate	2016	f	23
118	\N	\N	13	1	2016-06-22 18:16:15.507616	2016-06-22 18:16:15.507616	\N	Authority	2016	f	\N
119	\N	\N	2	3	2016-06-22 18:30:42.932785	2016-06-22 18:30:42.932785	0	Delegate	2016	f	24
120	\N	\N	8	3	2016-06-22 18:30:42.9402	2016-06-22 18:30:42.9402	3	Delegate	2016	f	24
121	\N	\N	8	3	2016-06-22 18:30:42.946094	2016-06-22 18:30:42.946094	2	Delegate	2016	f	24
122	\N	\N	8	3	2016-06-22 18:30:42.952475	2016-06-22 18:30:42.952475	2	Delegate	2016	f	24
123	\N	\N	2	3	2016-06-22 18:30:42.977497	2016-06-22 18:30:42.977497	0	Delegate	2016	f	24
124	\N	\N	13	1	2016-06-22 18:35:46.469944	2016-06-22 18:35:46.469944	\N	Delegate	2016	f	25
125	\N	\N	12	1	2016-06-22 18:35:46.487083	2016-06-22 18:35:46.487083	\N	Delegate	2016	f	25
126	\N	\N	13	1	2016-06-22 18:35:46.507097	2016-06-22 18:35:46.507097	\N	Delegate	2016	f	25
127	\N	\N	13	1	2016-06-22 18:35:46.531072	2016-06-22 18:35:46.531072	3	Delegate	2016	f	25
128	\N	\N	12	1	2016-06-22 18:35:46.555071	2016-06-22 18:35:46.555071	\N	Delegate	2016	f	25
129	\N	\N	13	1	2016-06-22 18:44:06.965205	2016-06-22 18:44:06.965205	\N	Delegate	2016	f	26
130	\N	\N	13	1	2016-06-22 18:44:06.981197	2016-06-22 18:44:06.981197	\N	Delegate	2016	f	26
131	\N	\N	12	1	2016-06-22 18:44:07.009653	2016-06-22 18:44:07.009653	\N	Delegate	2016	f	26
132	\N	\N	2	3	2016-06-22 18:48:12.048003	2016-06-22 18:48:12.048003	1	Delegate	2016	f	27
133	\N	\N	2	3	2016-06-22 18:48:12.057646	2016-06-22 18:48:12.057646	0	Delegate	2016	f	27
134	\N	\N	8	3	2016-06-22 18:48:12.065266	2016-06-22 18:48:12.065266	0	Delegate	2016	f	27
135	\N	\N	2	3	2016-06-22 18:48:12.079223	2016-06-22 18:48:12.079223	1	Delegate	2016	f	27
136	\N	\N	2	3	2016-06-22 18:48:12.089805	2016-06-22 18:48:12.089805	3	Delegate	2016	f	27
137	\N	\N	13	1	2016-06-22 18:49:50.358356	2016-06-22 18:49:50.358356	\N	Authority	2016	f	\N
138	\N	\N	12	1	2016-06-22 18:51:36.724366	2016-06-22 18:51:36.724366	\N	Authority	2016	f	\N
139	\N	\N	13	1	2016-06-22 21:04:51.60907	2016-06-22 21:04:51.60907	0	Delegate	2016	f	28
140	\N	\N	12	1	2016-06-22 21:04:51.623277	2016-06-22 21:04:51.623277	3	Delegate	2016	f	28
141	\N	\N	12	1	2016-06-22 21:04:51.641669	2016-06-22 21:04:51.641669	0	Delegate	2016	f	28
142	\N	\N	13	1	2016-06-22 21:10:53.658242	2016-06-22 21:10:53.658242	\N	Authority	2016	f	\N
143	\N	\N	13	1	2016-06-22 21:23:54.946195	2016-06-22 21:23:54.946195	\N	Delegate	2016	f	29
144	\N	\N	12	1	2016-06-22 21:23:54.985639	2016-06-22 21:23:54.985639	\N	Delegate	2016	f	29
145	\N	\N	13	1	2016-06-22 21:23:55.014587	2016-06-22 21:23:55.014587	\N	Delegate	2016	f	29
146	\N	\N	12	1	2016-06-22 21:47:34.044721	2016-06-22 21:47:34.044721	0	Delegate	2016	t	30
147	\N	\N	13	1	2016-06-22 21:47:34.070654	2016-06-22 21:47:34.070654	3	Delegate	2016	f	30
148	\N	\N	12	1	2016-06-22 21:47:34.081719	2016-06-22 21:47:34.081719	1	Delegate	2016	f	30
149	\N	\N	12	1	2016-06-22 21:47:34.095857	2016-06-22 21:47:34.095857	\N	Delegate	2016	t	30
150	\N	\N	12	1	2016-06-22 21:47:34.113641	2016-06-22 21:47:34.113641	\N	Delegate	2016	t	30
152	\N	\N	7	4	2016-06-23 17:21:24.58307	2016-06-23 17:21:24.58307	3	Delegate	2016	f	31
153	\N	\N	7	4	2016-06-23 17:21:24.594248	2016-06-23 17:21:24.594248	0	Delegate	2016	f	31
154	\N	\N	12	1	2016-06-23 17:25:25.961943	2016-06-23 17:25:25.961943	\N	Authority	2016	f	\N
155	\N	\N	12	1	2016-06-23 17:27:12.558984	2016-06-23 17:27:12.558984	\N	Authority	2016	f	\N
156	\N	\N	13	1	2016-06-23 17:30:36.143268	2016-06-23 17:30:36.143268	\N	Authority	2016	f	\N
157	\N	\N	12	1	2016-06-23 17:33:26.88985	2016-06-23 17:33:26.88985	\N	Authority	2016	f	\N
158	\N	\N	12	1	2016-06-23 17:49:50.702306	2016-06-23 17:49:50.702306	\N	Authority	2016	f	\N
160	\N	\N	13	1	2016-06-23 17:56:03.335969	2016-06-23 17:56:03.335969	0	Delegate	2016	f	32
161	\N	\N	13	1	2016-06-23 17:56:03.345739	2016-06-23 17:56:03.345739	2	Delegate	2016	f	32
162	\N	\N	12	1	2016-06-23 17:56:03.356102	2016-06-23 17:56:03.356102	0	Delegate	2016	t	32
163	\N	\N	13	1	2016-06-23 17:56:03.367028	2016-06-23 17:56:03.367028	3	Delegate	2016	t	32
164	\N	\N	13	1	2016-06-23 17:56:03.376178	2016-06-23 17:56:03.376178	2	Delegate	2016	t	32
166	\N	\N	11	4	2016-06-23 18:00:52.761256	2016-06-23 18:00:52.761256	\N	Authority	2016	f	\N
167	\N	\N	13	1	2016-06-23 18:05:08.925758	2016-06-23 18:05:08.925758	\N	Authority	2016	f	\N
169	\N	\N	13	1	2016-06-23 18:10:56.84444	2016-06-23 18:10:56.84444	\N	Authority	2016	f	\N
170	\N	\N	13	1	2016-06-23 18:11:57.84697	2016-06-23 18:11:57.84697	\N	Delegate	2016	t	33
171	\N	\N	12	1	2016-06-23 18:11:57.860987	2016-06-23 18:11:57.860987	\N	Delegate	2016	t	33
172	\N	\N	12	1	2016-06-23 18:11:57.874722	2016-06-23 18:11:57.874722	\N	Delegate	2016	f	33
173	\N	\N	12	1	2016-06-23 18:11:57.887288	2016-06-23 18:11:57.887288	\N	Delegate	2016	f	33
174	\N	\N	12	1	2016-06-23 18:11:57.896724	2016-06-23 18:11:57.896724	\N	Delegate	2016	t	33
192	\N	\N	12	1	2016-06-23 19:05:09.489223	2016-06-23 19:05:09.489223	\N	Delegate	2016	f	38
193	\N	\N	12	1	2016-06-23 19:05:09.500038	2016-06-23 19:05:09.500038	3	Delegate	2016	f	38
194	\N	\N	12	1	2016-06-23 19:05:09.510461	2016-06-23 19:05:09.510461	\N	Delegate	2016	f	38
195	\N	\N	12	1	2016-06-23 19:05:09.522182	2016-06-23 19:05:09.522182	\N	Delegate	2016	f	38
196	\N	\N	12	1	2016-06-23 19:05:09.532926	2016-06-23 19:05:09.532926	\N	Delegate	2016	f	38
200	\N	\N	11	4	2016-06-23 19:59:58.443777	2016-06-23 19:59:58.443777	2	Delegate	2016	f	40
201	\N	\N	11	4	2016-06-23 19:59:58.457033	2016-06-23 19:59:58.457033	2	Delegate	2016	f	40
202	\N	\N	11	4	2016-06-23 19:59:58.468963	2016-06-23 19:59:58.468963	3	Delegate	2016	f	40
203	\N	\N	11	4	2016-06-23 19:59:58.478264	2016-06-23 19:59:58.478264	0	Delegate	2016	f	40
204	\N	\N	11	4	2016-06-23 19:59:58.489076	2016-06-23 19:59:58.489076	0	Delegate	2016	f	40
175	\N	\N	12	1	2016-06-23 18:23:40.093898	2016-06-23 18:23:40.093898	\N	Delegate	2016	f	34
176	\N	\N	12	1	2016-06-23 18:23:40.106077	2016-06-23 18:23:40.106077	\N	Delegate	2016	f	34
177	\N	\N	13	1	2016-06-23 18:23:40.115993	2016-06-23 18:23:40.115993	0	Delegate	2016	f	34
178	\N	\N	12	1	2016-06-23 18:28:32.127124	2016-06-23 18:28:32.127124	2	Delegate	2016	f	35
179	\N	\N	12	1	2016-06-23 18:28:32.138354	2016-06-23 18:28:32.138354	2	Delegate	2016	f	35
180	\N	\N	12	1	2016-06-23 18:28:32.147686	2016-06-23 18:28:32.147686	0	Delegate	2016	f	35
181	\N	\N	12	1	2016-06-23 18:28:32.156907	2016-06-23 18:28:32.156907	0	Delegate	2016	f	35
182	\N	\N	13	1	2016-06-23 18:28:32.167671	2016-06-23 18:28:32.167671	3	Delegate	2016	t	35
183	\N	\N	11	4	2016-06-23 18:31:22.414655	2016-06-23 18:31:22.414655	\N	Authority	2016	f	\N
184	\N	\N	12	1	2016-06-23 18:40:42.052428	2016-06-23 18:40:42.052428	\N	Delegate	2016	f	36
185	\N	\N	12	1	2016-06-23 18:40:42.066912	2016-06-23 18:40:42.066912	\N	Delegate	2016	f	36
186	\N	\N	12	1	2016-06-23 18:40:42.076896	2016-06-23 18:40:42.076896	\N	Delegate	2016	f	36
197	\N	\N	13	1	2016-06-23 19:34:32.676826	2016-06-23 19:34:32.676826	\N	Delegate	2016	f	39
198	\N	\N	13	1	2016-06-23 19:34:32.688891	2016-06-23 19:34:32.688891	\N	Delegate	2016	f	39
199	\N	\N	12	1	2016-06-23 19:34:32.70753	2016-06-23 19:34:32.70753	\N	Delegate	2016	f	39
205	\N	\N	5	3	2016-06-23 20:01:36.942454	2016-06-23 20:01:36.942454	3	Delegate	2016	f	41
206	\N	\N	2	3	2016-06-23 20:01:36.960614	2016-06-23 20:01:36.960614	2	Delegate	2016	f	41
207	\N	\N	2	3	2016-06-23 20:01:36.975104	2016-06-23 20:01:36.975104	1	Delegate	2016	f	41
208	\N	\N	2	3	2016-06-23 20:01:36.988678	2016-06-23 20:01:36.988678	0	Delegate	2016	f	41
209	\N	\N	2	3	2016-06-23 20:01:37.000688	2016-06-23 20:01:37.000688	1	Delegate	2016	f	41
210	\N	\N	2	3	2016-06-23 20:01:37.011984	2016-06-23 20:01:37.011984	2	Delegate	2016	f	41
211	\N	\N	2	3	2016-06-23 20:01:37.026511	2016-06-23 20:01:37.026511	0	Delegate	2016	f	41
187	\N	\N	7	4	2016-06-23 19:03:55.698503	2016-06-23 19:03:55.698503	2	Delegate	2016	f	37
188	\N	\N	7	4	2016-06-23 19:03:55.710276	2016-06-23 19:03:55.710276	0	Delegate	2016	f	37
189	\N	\N	7	4	2016-06-23 19:03:55.720251	2016-06-23 19:03:55.720251	0	Delegate	2016	f	37
190	\N	\N	7	4	2016-06-23 19:03:55.732124	2016-06-23 19:03:55.732124	2	Delegate	2016	f	37
191	\N	\N	7	4	2016-06-23 19:03:55.741414	2016-06-23 19:03:55.741414	3	Delegate	2016	f	37
215	\N	\N	11	4	2016-06-25 14:39:22.371786	2016-06-25 14:39:22.371786	2	Delegate	2016	f	42
216	\N	\N	11	4	2016-06-25 14:39:22.378351	2016-06-25 14:39:22.378351	2	Delegate	2016	f	42
217	\N	\N	12	1	2016-06-25 15:00:35.879784	2016-06-25 15:00:35.879784	\N	Delegate	2016	f	43
218	\N	\N	13	1	2016-06-25 15:00:35.891473	2016-06-25 15:00:35.891473	\N	Delegate	2016	f	43
219	\N	\N	13	1	2016-06-25 15:00:35.90428	2016-06-25 15:00:35.90428	\N	Delegate	2016	f	43
220	\N	\N	13	1	2016-06-25 15:00:35.917102	2016-06-25 15:00:35.917102	\N	Delegate	2016	f	43
221	\N	\N	13	1	2016-06-25 15:00:35.931855	2016-06-25 15:00:35.931855	2	Delegate	2016	f	43
222	\N	\N	12	1	2016-06-25 15:20:07.333198	2016-06-25 15:20:07.333198	0	Delegate	2016	f	44
223	\N	\N	12	1	2016-06-25 15:20:07.38275	2016-06-25 15:20:07.38275	0	Delegate	2016	f	44
224	\N	\N	12	1	2016-06-25 15:20:07.419828	2016-06-25 15:20:07.419828	3	Delegate	2016	f	44
225	\N	\N	12	1	2016-06-25 15:35:48.94058	2016-06-25 15:35:48.94058	0	Delegate	2016	f	45
226	\N	\N	12	1	2016-06-25 15:35:48.947937	2016-06-25 15:35:48.947937	0	Delegate	2016	f	45
227	\N	\N	12	1	2016-06-25 15:35:48.957017	2016-06-25 15:35:48.957017	3	Delegate	2016	f	45
228	\N	\N	\N	\N	2016-06-25 15:35:48.965712	2016-06-25 15:35:48.965712	\N	Delegate	2016	f	45
229	\N	\N	12	1	2016-06-25 15:41:20.545225	2016-06-25 15:41:20.545225	\N	Authority	2016	f	\N
230	\N	\N	12	1	2016-06-28 18:32:44.869581	2016-06-28 18:32:44.869581	\N	Delegate	2016	f	46
231	\N	\N	12	1	2016-06-28 18:32:44.889573	2016-06-28 18:32:44.889573	\N	Delegate	2016	f	46
232	\N	\N	12	1	2016-06-28 18:32:44.899863	2016-06-28 18:32:44.899863	\N	Delegate	2016	f	46
233	\N	\N	12	1	2016-06-28 18:32:44.910923	2016-06-28 18:32:44.910923	1	Delegate	2016	f	46
234	\N	\N	12	1	2016-06-28 18:32:44.924021	2016-06-28 18:32:44.924021	0	Delegate	2016	f	46
235	\N	\N	12	1	2016-06-28 18:41:49.911799	2016-06-28 18:41:49.911799	\N	Delegate	2016	f	47
236	\N	\N	12	1	2016-06-28 18:41:49.93443	2016-06-28 18:41:49.93443	\N	Delegate	2016	f	47
237	\N	\N	12	1	2016-06-28 18:45:29.805417	2016-06-28 18:45:29.805417	\N	Authority	2016	f	\N
238	\N	\N	13	1	2016-06-28 19:03:32.074595	2016-06-28 19:03:32.074595	\N	Delegate	2016	f	48
239	\N	\N	13	1	2016-06-28 19:03:32.087119	2016-06-28 19:03:32.087119	\N	Delegate	2016	f	48
240	\N	\N	13	1	2016-06-28 19:03:32.098158	2016-06-28 19:03:32.098158	\N	Delegate	2016	f	48
241	\N	\N	13	1	2016-06-28 19:03:32.107898	2016-06-28 19:03:32.107898	\N	Delegate	2016	f	48
242	\N	\N	12	1	2016-06-28 19:03:32.118724	2016-06-28 19:03:32.118724	\N	Delegate	2016	f	48
243	\N	\N	12	1	2016-06-28 19:09:51.740451	2016-06-28 19:09:51.740451	\N	Authority	2016	f	\N
244	\N	\N	12	1	2016-06-28 19:13:54.138204	2016-06-28 19:13:54.138204	\N	Authority	2016	f	\N
245	\N	\N	11	4	2016-06-28 19:27:12.984888	2016-06-28 19:27:12.984888	0	Delegate	2016	f	49
246	\N	\N	11	4	2016-06-28 19:27:12.992143	2016-06-28 19:27:12.992143	0	Delegate	2016	f	49
247	\N	\N	11	4	2016-06-28 19:27:12.998709	2016-06-28 19:27:12.998709	3	Delegate	2016	f	49
248	\N	\N	\N	\N	2016-06-28 19:27:13.005665	2016-06-28 19:27:13.005665	\N	Delegate	2016	f	49
249	\N	\N	12	1	2016-06-28 19:33:39.7965	2016-06-28 19:33:39.7965	\N	Authority	2016	f	\N
250	\N	\N	12	1	2016-06-28 19:36:52.611072	2016-06-28 19:36:52.611072	\N	Authority	2016	f	\N
251	\N	\N	11	4	2016-06-28 19:38:50.630806	2016-06-28 19:38:50.630806	\N	Authority	2016	f	\N
252	\N	\N	11	4	2016-06-28 19:49:48.621271	2016-06-28 19:49:48.621271	0	Delegate	2016	f	50
253	\N	\N	11	4	2016-06-28 19:49:48.632811	2016-06-28 19:49:48.632811	0	Delegate	2016	f	50
254	\N	\N	7	4	2016-06-28 19:49:48.641381	2016-06-28 19:49:48.641381	3	Delegate	2016	f	50
255	\N	\N	13	1	2016-06-28 20:18:35.38405	2016-06-28 20:18:35.38405	\N	Authority	2016	f	\N
256	\N	\N	12	1	2016-06-29 20:35:04.95564	2016-06-29 20:35:04.95564	0	Delegate	2016	f	51
257	\N	\N	13	1	2016-06-29 20:35:05.004319	2016-06-29 20:35:05.004319	0	Delegate	2016	f	51
258	\N	\N	12	1	2016-06-29 20:35:05.029817	2016-06-29 20:35:05.029817	3	Delegate	2016	f	51
259	\N	\N	11	4	2016-06-29 20:43:01.882204	2016-06-29 20:43:01.882204	2	Delegate	2016	f	52
260	\N	\N	11	4	2016-06-29 20:43:01.910481	2016-06-29 20:43:01.910481	0	Delegate	2016	f	52
261	\N	\N	11	4	2016-06-29 20:43:01.942633	2016-06-29 20:43:01.942633	0	Delegate	2016	f	52
262	\N	\N	11	4	2016-06-30 17:32:50.277502	2016-06-30 17:32:50.277502	\N	Authority	2016	f	\N
263	\N	\N	13	1	2016-06-30 17:38:09.005459	2016-06-30 17:38:09.005459	\N	Authority	2016	f	\N
264	\N	\N	13	1	2016-06-30 17:41:14.022844	2016-06-30 17:41:14.022844	\N	Authority	2016	f	\N
265	\N	\N	\N	\N	2016-06-30 18:04:10.9608	2016-06-30 18:04:10.9608	\N	Authority	2016	f	\N
266	\N	\N	17	1	2016-06-30 18:07:45.25863	2016-06-30 18:07:45.25863	\N	Authority	2016	f	\N
267	\N	\N	12	1	2016-06-30 18:27:16.487556	2016-06-30 18:27:16.487556	2	Delegate	2016	t	53
268	\N	\N	12	1	2016-06-30 18:27:16.498641	2016-06-30 18:27:16.498641	\N	Delegate	2016	f	53
269	\N	\N	12	1	2016-06-30 18:27:16.509092	2016-06-30 18:27:16.509092	\N	Delegate	2016	f	53
270	\N	\N	12	1	2016-06-30 18:27:16.517395	2016-06-30 18:27:16.517395	\N	Delegate	2016	f	53
271	\N	\N	12	1	2016-06-30 18:27:16.52835	2016-06-30 18:27:16.52835	\N	Delegate	2016	f	53
272	\N	\N	12	1	2016-06-30 18:45:47.955415	2016-06-30 18:45:47.955415	\N	Delegate	2016	f	54
273	\N	\N	12	1	2016-06-30 18:45:47.966015	2016-06-30 18:45:47.966015	\N	Delegate	2016	f	54
274	\N	\N	12	1	2016-06-30 18:45:47.975293	2016-06-30 18:45:47.975293	\N	Delegate	2016	t	54
275	\N	\N	13	1	2016-06-30 18:45:47.985258	2016-06-30 18:45:47.985258	\N	Delegate	2016	f	54
276	\N	\N	12	1	2016-06-30 18:45:47.994256	2016-06-30 18:45:47.994256	\N	Delegate	2016	t	54
277	\N	\N	17	1	2016-06-30 18:58:01.572892	2016-06-30 18:58:01.572892	3	Delegate	2016	f	55
278	\N	\N	12	1	2016-06-30 18:58:01.586887	2016-06-30 18:58:01.586887	\N	Delegate	2016	f	55
279	\N	\N	12	1	2016-06-30 18:58:01.596825	2016-06-30 18:58:01.596825	\N	Delegate	2016	f	55
280	\N	\N	\N	1	2016-06-30 19:16:41.830975	2016-06-30 19:16:41.830975	0	Delegate	2016	f	56
281	\N	\N	12	1	2016-06-30 19:16:41.848354	2016-06-30 19:16:41.848354	3	Delegate	2016	f	56
282	\N	\N	12	1	2016-06-30 19:16:41.859365	2016-06-30 19:16:41.859365	0	Delegate	2016	f	56
283	\N	\N	13	1	2016-06-30 19:44:37.522701	2016-06-30 19:44:37.522701	\N	Delegate	2016	t	57
284	\N	\N	12	1	2016-06-30 20:44:22.919333	2016-06-30 20:44:22.919333	\N	Delegate	2016	f	22
285	\N	\N	11	4	2016-06-30 21:07:07.101279	2016-06-30 21:07:07.101279	1	Delegate	2016	f	58
286	\N	\N	11	4	2016-06-30 21:07:07.109732	2016-06-30 21:07:07.109732	0	Delegate	2016	f	58
287	\N	\N	7	4	2016-06-30 21:07:07.116043	2016-06-30 21:07:07.116043	3	Delegate	2016	f	58
288	\N	\N	11	4	2016-06-30 21:07:07.122843	2016-06-30 21:07:07.122843	0	Delegate	2016	f	58
289	\N	\N	11	4	2016-06-30 21:07:07.129481	2016-06-30 21:07:07.129481	1	Delegate	2016	f	58
290	\N	\N	\N	\N	2016-06-30 21:11:43.308153	2016-06-30 21:11:43.308153	\N	Authority	2016	f	\N
214	\N	\N	13	1	2016-06-25 14:39:22.365606	2016-08-26 22:35:13.399686	3	Delegate	2016	f	42
213	\N	\N	13	1	2016-06-25 14:39:22.358466	2016-08-26 22:41:45.230376	2	Delegate	2016	f	42
212	\N	\N	13	1	2016-06-25 14:39:22.34884	2016-08-26 22:49:02.045157	2	Delegate	2016	f	42
292	\N	\N	12	1	2016-06-30 21:32:48.985109	2016-06-30 21:32:48.985109	\N	Authority	2016	f	\N
293	\N	\N	11	11	2016-06-30 21:50:35.2055	2016-06-30 21:50:35.2055	3	Delegate	2016	f	59
294	\N	\N	11	11	2016-06-30 21:50:35.212374	2016-06-30 21:50:35.212374	\N	Delegate	2016	f	59
295	\N	\N	11	11	2016-06-30 21:50:35.218194	2016-06-30 21:50:35.218194	\N	Delegate	2016	f	59
296	\N	\N	\N	\N	2016-06-30 21:50:35.224547	2016-06-30 21:50:35.224547	\N	Delegate	2016	f	59
304	\N	\N	12	1	2016-06-30 22:29:53.971854	2016-06-30 22:29:53.971854	\N	Delegate	2016	t	57
297	\N	\N	11	4	2016-06-30 22:26:29.447155	2016-06-30 22:26:29.447155	0	Delegate	2016	f	60
298	\N	\N	11	4	2016-06-30 22:26:29.455674	2016-06-30 22:26:29.455674	3	Delegate	2016	f	60
299	\N	\N	11	4	2016-06-30 22:26:29.463631	2016-06-30 22:26:29.463631	1	Delegate	2016	f	60
300	\N	\N	11	4	2016-06-30 22:26:29.470085	2016-06-30 22:26:29.470085	1	Delegate	2016	f	60
301	\N	\N	11	4	2016-06-30 22:26:29.475973	2016-06-30 22:26:29.475973	2	Delegate	2016	f	60
302	\N	\N	11	4	2016-06-30 22:26:29.482065	2016-06-30 22:26:29.482065	0	Delegate	2016	f	60
303	\N	\N	11	4	2016-06-30 22:26:29.488237	2016-06-30 22:26:29.488237	2	Delegate	2016	f	60
307	\N	\N	\N	\N	2016-07-08 12:38:34.508763	2016-07-08 12:38:34.508763	\N	Authority	2016	f	\N
308	\N	\N	13	1	2016-08-13 05:11:07.318136	2016-08-13 05:11:07.318136	\N	Authority	2016	f	\N
309	\N	\N	7	9	2016-08-13 05:14:53.303362	2016-08-13 05:14:53.303362	\N	Authority	2016	f	\N
310	\N	\N	13	1	2016-08-13 05:17:48.098654	2016-08-13 05:17:48.098654	\N	Authority	2016	f	\N
312	\N	\N	7	9	2016-08-13 05:30:50.660668	2016-08-13 05:30:50.660668	\N	Delegate	2016	f	61
313	\N	\N	7	9	2016-08-13 05:30:50.667621	2016-08-13 05:30:50.667621	\N	Delegate	2016	f	61
314	\N	\N	11	4	2016-08-13 05:30:50.673776	2016-08-13 05:30:50.673776	\N	Delegate	2016	f	61
315	\N	\N	7	10	2016-08-13 05:46:33.364484	2016-08-13 05:46:33.364484	\N	Delegate	2016	f	62
316	\N	\N	7	10	2016-08-13 05:46:33.371107	2016-08-13 05:46:33.371107	\N	Delegate	2016	f	62
317	\N	\N	7	10	2016-08-13 05:46:33.377206	2016-08-13 05:46:33.377206	\N	Delegate	2016	f	62
318	\N	\N	7	10	2016-08-13 05:46:33.382968	2016-08-13 05:46:33.382968	\N	Delegate	2016	f	62
319	\N	\N	7	10	2016-08-13 05:46:33.388969	2016-08-13 05:46:33.388969	\N	Delegate	2016	f	62
320	\N	\N	7	9	2016-08-13 05:58:17.192853	2016-08-13 05:58:17.192853	\N	Delegate	2016	f	63
321	\N	\N	7	9	2016-08-13 05:58:17.200092	2016-08-13 05:58:17.200092	\N	Delegate	2016	f	63
322	\N	\N	7	9	2016-08-13 05:58:17.20653	2016-08-13 05:58:17.20653	\N	Delegate	2016	f	63
323	\N	\N	7	9	2016-08-13 05:58:17.212855	2016-08-13 05:58:17.212855	\N	Delegate	2016	f	63
324	\N	\N	7	9	2016-08-13 05:58:17.218948	2016-08-13 05:58:17.218948	\N	Delegate	2016	f	63
325	\N	\N	\N	5	2016-08-13 06:09:36.643542	2016-08-13 06:09:36.643542	\N	Delegate	2016	f	64
326	\N	\N	\N	5	2016-08-13 06:09:36.657636	2016-08-13 06:09:36.657636	\N	Delegate	2016	f	64
327	\N	\N	\N	5	2016-08-13 06:09:36.666639	2016-08-13 06:09:36.666639	\N	Delegate	2016	f	64
328	\N	\N	11	4	2016-08-13 06:21:11.798583	2016-08-13 06:21:11.798583	3	Delegate	2016	f	65
329	\N	\N	11	4	2016-08-13 06:21:11.808467	2016-08-13 06:21:11.808467	0	Delegate	2016	f	65
330	\N	\N	11	4	2016-08-13 06:21:11.817718	2016-08-13 06:21:11.817718	0	Delegate	2016	f	65
331	\N	\N	\N	\N	2016-08-13 06:21:11.826893	2016-08-13 06:21:11.826893	\N	Delegate	2016	f	65
332	\N	\N	13	1	2016-08-13 06:29:43.404144	2016-08-13 06:29:43.404144	0	Delegate	2016	f	66
333	\N	\N	13	1	2016-08-13 06:29:43.410097	2016-08-13 06:29:43.410097	0	Delegate	2016	f	66
334	\N	\N	12	1	2016-08-13 06:29:43.415871	2016-08-13 06:29:43.415871	3	Delegate	2016	f	66
336	\N	\N	13	1	2016-08-13 06:40:40.274882	2016-08-13 06:40:40.274882	\N	Authority	2016	f	\N
337	\N	\N	13	1	2016-08-13 06:43:26.76438	2016-08-13 06:43:26.76438	\N	Authority	2016	f	\N
338	\N	\N	13	1	2016-08-13 06:46:05.229293	2016-08-13 06:46:05.229293	\N	Authority	2016	f	\N
339	\N	\N	12	1	2016-08-13 06:48:58.256725	2016-08-13 06:48:58.256725	\N	Authority	2016	f	\N
340	\N	\N	12	1	2016-08-13 14:52:41.948829	2016-08-13 14:52:41.948829	\N	Delegate	2016	f	67
341	\N	\N	11	4	2016-08-13 14:52:41.965518	2016-08-13 14:52:41.965518	\N	Delegate	2016	f	67
342	\N	\N	11	4	2016-08-13 14:52:41.976571	2016-08-13 14:52:41.976571	0	Delegate	2016	f	67
343	\N	\N	11	4	2016-08-13 14:52:41.989441	2016-08-13 14:52:41.989441	3	Delegate	2016	f	67
344	\N	\N	11	4	2016-08-13 14:52:41.998523	2016-08-13 14:52:41.998523	2	Delegate	2016	f	67
345	\N	\N	11	4	2016-08-13 15:05:18.721242	2016-08-13 15:05:18.721242	3	Delegate	2016	f	68
346	\N	\N	12	4	2016-08-13 15:05:18.745752	2016-08-13 15:05:18.745752	0	Delegate	2016	f	68
347	\N	\N	11	4	2016-08-13 15:05:18.756631	2016-08-13 15:05:18.756631	0	Delegate	2016	f	68
348	\N	\N	7	10	2016-08-13 15:09:41.841177	2016-08-13 15:09:41.841177	2	Delegate	2016	f	69
349	\N	\N	7	10	2016-08-13 15:15:52.954657	2016-08-13 15:15:52.954657	0	Delegate	2016	f	69
350	\N	\N	18	12	2016-08-18 00:43:44.360365	2016-08-18 00:43:44.360365	3	Delegate	2016	f	70
352	\N	\N	18	12	2016-08-18 21:55:40.038538	2016-08-18 22:24:55.965138	0	Delegate	2016	f	70
351	\N	\N	19	12	2016-08-18 00:43:44.372263	2016-08-18 22:26:20.804438	0	Delegate	2016	f	70
353	\N	\N	18	12	2016-08-19 01:19:05.321079	2016-08-19 01:19:05.321079	\N	Delegate	2016	f	71
354	\N	\N	19	12	2016-08-19 01:19:05.33774	2016-08-19 01:19:05.33774	0	Delegate	2016	f	71
355	\N	\N	18	12	2016-08-19 01:19:05.353778	2016-08-19 01:19:05.353778	3	Delegate	2016	f	71
356	\N	\N	19	12	2016-08-19 01:35:45.73614	2016-08-19 01:35:45.73614	0	Delegate	2016	f	72
357	\N	\N	19	12	2016-08-19 01:35:45.748374	2016-08-19 01:35:45.748374	0	Delegate	2016	f	72
358	\N	\N	19	12	2016-08-19 01:35:45.760113	2016-08-19 01:35:45.760113	3	Delegate	2016	f	72
359	\N	\N	19	12	2016-08-19 01:50:34.388705	2016-08-19 01:50:34.388705	0	Delegate	2016	f	73
360	\N	\N	18	12	2016-08-19 01:50:34.40106	2016-08-19 01:50:34.40106	3	Delegate	2016	f	73
361	\N	\N	\N	\N	2016-08-19 01:50:34.410865	2016-08-19 01:50:34.410865	\N	Delegate	2016	f	73
362	\N	\N	19	12	2016-08-19 02:10:40.493019	2016-08-19 02:10:40.493019	0	Delegate	2016	f	74
363	\N	\N	18	12	2016-08-19 02:10:40.503169	2016-08-19 02:10:40.503169	0	Delegate	2016	f	74
364	\N	\N	19	12	2016-08-19 02:10:40.514547	2016-08-19 02:10:40.514547	3	Delegate	2016	f	74
365	\N	\N	20	13	2016-08-19 17:43:12.55577	2016-08-19 17:43:12.55577	0	Delegate	2016	f	75
366	\N	\N	20	13	2016-08-19 17:43:12.566096	2016-08-19 17:43:12.566096	3	Delegate	2016	f	75
367	\N	\N	20	13	2016-08-19 17:43:12.574828	2016-08-19 17:43:12.574828	0	Delegate	2016	f	75
368	\N	\N	20	13	2016-08-19 20:23:01.148765	2016-08-19 20:23:01.148765	0	Delegate	2016	f	76
369	\N	\N	20	13	2016-08-19 20:23:01.162531	2016-08-19 20:23:01.162531	0	Delegate	2016	f	76
370	\N	\N	20	13	2016-08-19 20:23:01.173917	2016-08-19 20:23:01.173917	3	Delegate	2016	f	76
371	\N	\N	13	1	2016-08-19 20:33:32.808826	2016-08-19 20:33:32.808826	\N	Authority	2016	f	\N
151	\N	\N	\N	\N	2016-06-23 17:21:24.566173	2016-08-19 20:56:20.014875	\N	Delegate	2016	f	31
372	\N	\N	20	13	2016-08-19 20:57:26.159867	2016-08-19 20:57:26.159867	0	Delegate	2016	f	77
373	\N	\N	20	13	2016-08-19 20:57:26.169042	2016-08-19 20:57:26.169042	3	Delegate	2016	f	77
374	\N	\N	\N	\N	2016-08-19 20:57:26.175529	2016-08-19 20:57:26.175529	\N	Delegate	2016	f	77
375	\N	\N	20	13	2016-08-19 21:12:46.374811	2016-08-19 21:12:46.374811	0	Delegate	2016	f	78
376	\N	\N	20	13	2016-08-19 21:12:46.381374	2016-08-19 21:12:46.381374	0	Delegate	2016	f	78
377	\N	\N	20	13	2016-08-19 21:12:46.38879	2016-08-19 21:12:46.38879	3	Delegate	2016	f	78
378	\N	\N	21	14	2016-08-20 00:22:37.293757	2016-08-20 00:22:37.293757	3	Delegate	2016	f	79
379	\N	\N	21	14	2016-08-20 00:22:37.307454	2016-08-20 00:22:37.307454	0	Delegate	2016	f	79
380	\N	\N	21	14	2016-08-20 00:22:37.317044	2016-08-20 00:22:37.317044	0	Delegate	2016	f	79
381	\N	\N	12	1	2016-08-20 00:45:12.149221	2016-08-20 00:45:12.149221	0	Delegate	2016	f	80
382	\N	\N	13	1	2016-08-20 00:45:12.161451	2016-08-20 00:45:12.161451	0	Delegate	2016	f	80
383	\N	\N	12	1	2016-08-20 00:45:12.170719	2016-08-20 00:45:12.170719	3	Delegate	2016	f	80
384	\N	\N	22	14	2016-08-20 01:06:41.861312	2016-08-20 01:06:41.861312	3	Delegate	2016	f	81
385	\N	\N	22	14	2016-08-20 01:06:41.876519	2016-08-20 01:06:41.876519	0	Delegate	2016	f	81
386	\N	\N	22	14	2016-08-20 01:06:41.885452	2016-08-20 01:06:41.885452	2	Delegate	2016	f	81
387	\N	\N	22	14	2016-08-20 01:06:41.896185	2016-08-20 01:06:41.896185	0	Delegate	2016	f	81
388	\N	\N	21	14	2016-08-20 01:06:41.905049	2016-08-20 01:06:41.905049	2	Delegate	2016	f	81
389	\N	\N	22	14	2016-08-20 01:07:37.833028	2016-08-20 01:07:37.833028	3	Delegate	2016	f	82
390	\N	\N	22	14	2016-08-20 01:07:37.850573	2016-08-20 01:07:37.850573	0	Delegate	2016	f	82
392	\N	\N	22	14	2016-08-20 01:07:37.875281	2016-08-20 01:07:37.875281	0	Delegate	2016	f	82
393	\N	\N	21	14	2016-08-20 01:07:37.887723	2016-08-20 01:07:37.887723	2	Delegate	2016	f	82
394	\N	\N	11	4	2016-08-20 01:13:33.249155	2016-08-20 01:13:33.249155	3	Delegate	2016	f	83
395	\N	\N	11	4	2016-08-20 01:13:33.261004	2016-08-20 01:13:33.261004	0	Delegate	2016	f	83
396	\N	\N	21	14	2016-08-20 03:16:54.867161	2016-08-20 03:16:54.867161	3	Delegate	2016	f	84
397	\N	\N	21	14	2016-08-20 03:16:54.878792	2016-08-20 03:16:54.878792	0	Delegate	2016	f	84
398	\N	\N	21	14	2016-08-20 03:16:54.886123	2016-08-20 03:16:54.886123	0	Delegate	2016	f	84
399	\N	\N	\N	\N	2016-08-20 03:16:54.892459	2016-08-20 03:16:54.892459	\N	Delegate	2016	f	84
400	\N	\N	21	14	2016-08-20 03:31:59.881562	2016-08-20 03:31:59.881562	3	Delegate	2016	f	85
401	\N	\N	21	15	2016-08-20 03:31:59.889796	2016-08-20 03:31:59.889796	0	Delegate	2016	f	85
402	\N	\N	21	15	2016-08-20 03:31:59.897052	2016-08-20 03:31:59.897052	0	Delegate	2016	f	85
403	\N	\N	21	15	2016-08-20 03:31:59.904953	2016-08-20 03:31:59.904953	1	Delegate	2016	f	85
404	\N	\N	21	14	2016-08-20 03:31:59.912732	2016-08-20 03:31:59.912732	1	Delegate	2016	f	85
405	\N	\N	6	\N	2016-08-20 03:39:45.610142	2016-08-20 03:39:45.610142	\N	Delegate	2016	f	86
406	\N	\N	\N	\N	2016-08-20 03:39:45.623014	2016-08-20 03:39:45.623014	\N	Delegate	2016	f	86
407	\N	\N	7	10	2016-08-20 03:48:19.282034	2016-08-20 03:48:19.282034	3	Delegate	2016	f	69
408	\N	\N	7	10	2016-08-20 03:48:19.507036	2016-08-20 03:48:19.507036	0	Delegate	2016	f	69
409	\N	\N	7	10	2016-08-20 03:48:19.531162	2016-08-20 03:48:19.531162	2	Delegate	2016	f	69
410	\N	\N	12	1	2016-08-26 22:10:49.613347	2016-08-26 22:10:49.613347	\N	Authority	2016	f	\N
412	\N	\N	12	1	2016-08-26 22:19:23.67515	2016-08-26 22:19:23.67515	\N	Authority	2016	f	\N
413	\N	\N	13	1	2016-08-26 22:26:35.979687	2016-08-26 22:26:35.979687	\N	Authority	2016	f	\N
414	\N	\N	\N	\N	2016-08-26 22:49:02.061499	2016-08-26 22:49:02.061499	\N	Delegate	2016	f	42
335	\N	\N	12	1	2016-08-13 06:36:31.182218	2016-08-26 22:58:36.651588	\N	Delegate	2016	f	52
415	\N	\N	\N	\N	2016-08-26 22:58:36.662599	2016-08-26 22:58:36.662599	\N	Delegate	2016	f	52
391	\N	\N	21	14	2016-08-20 01:07:37.86137	2016-08-26 23:10:12.204107	2	Delegate	2016	f	82
416	\N	\N	24	17	2016-08-27 18:59:35.637048	2016-08-27 18:59:35.637048	\N	Delegate	2016	f	87
417	\N	\N	24	17	2016-08-27 18:59:35.647527	2016-08-27 18:59:35.647527	\N	Delegate	2016	f	87
418	\N	\N	24	17	2016-08-27 18:59:35.653754	2016-08-27 18:59:35.653754	\N	Delegate	2016	f	87
\.


--
-- Name: partakers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('partakers_id_seq', 418, true);


--
-- Data for Name: people; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY people (id, personable_id, personable_type, first_name, last_name, dni, birthdate, age, location_id, phone_number, email, blood_type, rh_factor, medical_insurance, medical_insurance_affiliate_number, medical_insurance_phone_number, emergency_person, emergency_person_relationship, emergency_person_phone_number, created_at, updated_at) FROM stdin;
4	2	Professor	María José	Beraza		\N	\N	\N		mjberaza@hotmail.com									2016-06-02 19:21:31.584887	2016-06-02 19:22:17.314857
6	4	Professor	Daniela	Bibini		\N	\N	\N											2016-06-02 19:23:22.251475	2016-06-02 19:23:22.251475
7	5	Professor	Carlos	Fernandez		\N	\N	\N											2016-06-02 19:24:51.818138	2016-06-02 19:24:51.818138
8	3	Partaker	Itati	Guidozzolo		\N	\N	\N											2016-06-02 19:31:09.780054	2016-06-02 19:31:09.780054
9	4	Partaker	Sofia	Bergamini		\N	\N	\N											2016-06-02 19:31:09.793471	2016-06-02 19:31:09.793471
10	5	Partaker	Agustina	Sequeira		\N	\N	\N											2016-06-02 19:31:09.804019	2016-06-02 19:31:09.804019
11	6	Partaker	Santiago	De Pietro		\N	\N	\N											2016-06-02 19:31:09.813729	2016-06-02 19:31:09.813729
12	7	Partaker	Juan Cruz	Elliff		\N	\N	\N											2016-06-02 19:31:09.823223	2016-06-02 19:31:09.823223
13	8	Partaker	Justina	Bardengo		\N	\N	\N											2016-06-02 19:31:09.832742	2016-06-02 19:31:09.832742
14	9	Partaker	Rosario	Zunino		\N	\N	\N											2016-06-02 19:31:09.841884	2016-06-02 19:31:09.841884
15	10	Partaker	Delfina	Sequeira		\N	\N	\N											2016-06-02 19:34:30.59702	2016-06-02 19:34:30.59702
16	11	Partaker	Mateo	Kenny		\N	\N	\N											2016-06-02 19:34:30.610924	2016-06-02 19:34:30.610924
17	12	Partaker	Matias	Klein		\N	\N	\N											2016-06-02 19:34:30.621176	2016-06-02 19:34:30.621176
18	13	Partaker	Violeta	Mussi		\N	\N	\N											2016-06-02 19:37:07.078375	2016-06-02 19:37:07.078375
19	14	Partaker	Josefina	Klein		\N	\N	\N											2016-06-02 19:37:07.0998	2016-06-02 19:37:07.0998
20	15	Partaker	Agustin	Castillo		\N	\N	\N											2016-06-02 19:37:07.112647	2016-06-02 19:37:07.112647
21	16	Partaker	Manuel	Robles		\N	\N	\N											2016-06-02 19:37:07.127002	2016-06-02 19:37:07.127002
22	17	Partaker	Felipe	Rodeiro		\N	\N	\N											2016-06-02 19:37:07.142962	2016-06-02 19:37:07.142962
23	18	Partaker	Eugenia	Russo		\N	\N	\N											2016-06-02 19:40:49.220116	2016-06-02 19:40:49.220116
24	19	Partaker	Felicitas	Sosa		\N	\N	\N											2016-06-02 19:40:49.229728	2016-06-02 19:40:49.229728
25	20	Partaker	Paulina	Cabañez		\N	\N	\N											2016-06-02 19:40:49.240642	2016-06-02 19:40:49.240642
26	21	Partaker	Gabriel	Carretoni		\N	\N	\N											2016-06-02 19:40:49.251137	2016-06-02 19:40:49.251137
27	22	Partaker	Nicolás	Guelfi		\N	\N	\N											2016-06-02 19:40:49.26144	2016-06-02 19:40:49.26144
28	6	Professor	Laura Rosangela	Lacarra	29930640	1982-10-30	33	\N	0234215402165	lauralacarra@gmail.com	A	+	Ioma			Marco Felix	marido	0234215405864	2016-06-04 13:52:25.305617	2016-06-04 13:52:25.305617
29	7	Professor	Gisela	Macagno	28601555	1981-01-18	36	\N	2342400917	giselamacagno@hotmail.com	0	+	Ioma	2286015554/00		Mabel Rodriguez	Madre	2342408029	2016-06-04 14:05:51.974025	2016-06-04 14:05:51.974025
30	23	Partaker	Maria del Pilar	Vaccarezza	41999764	2000-10-10	15	\N	2342405106	pilarvaccarezza@hotmail.com	B	+	Jeràrquicas Salud	78832/02	2342508069	Ana Vaccarezza	Madre	2342508069	2016-06-04 14:26:34.092856	2016-06-04 14:26:34.092856
31	24	Partaker	Gonzalo Jose	Rysary	43592855	2001-02-14	15	\N	2342431480	gonzalo-rysary@outlook.es	A	+				Jose Rysary	Padre	2342512172	2016-06-04 14:26:34.10657	2016-06-04 14:26:34.10657
32	25	Partaker	Ariana Abigail	Gonzalez	42568353	2000-07-06	15	\N	2342467370	ari-gonzalez10@hotmail.com	0	+	La pequeña familia	1001502/11	2342467370		Abuela	2342544426	2016-06-04 14:26:34.120302	2016-06-04 14:26:34.120302
33	26	Partaker	Ramiro	Simionato	42963342	2000-10-27	15	\N	2342423974	ramii_simionato@hotmail.com	A	+	Ioma	2200125716/02	234215485420	Betina Suarez	Madre	2342406352	2016-06-04 14:26:34.134515	2016-06-04 14:26:34.134515
34	27	Partaker	Lidia	Barni	43399144	2001-04-16	15	\N	2342423185	lidibar6@hotmail.com	B	+	Osde				Madre	2342464195	2016-06-04 14:26:34.149081	2016-06-04 14:26:34.149081
35	8	Professor	Daniela	Albizzatti	31703099	1985-07-17	30	\N	111532016941	danielaalbizzatti@hotmail.com	B	+	Osde	61626014701		Latorre Martin	Pareja	0111567259829	2016-06-04 14:31:35.381548	2016-06-04 14:31:35.381548
36	9	Professor	Debora Edith	Lillardo	29240425	1982-07-07	33	\N	2342504943	deboral@hotmail.com.ar	A	+	Ioma	2292404256/00		Alfaro Martin	Esposa	234215504944	2016-06-04 14:36:04.993718	2016-06-04 14:36:04.993718
37	10	Professor	Maria Elsa	Stoppini	28239676	1980-07-28	35	\N	234215548037	mariastoppini@hotmail.com	A	+	Ioma	2282396767/00					2016-06-04 14:41:32.42825	2016-06-04 14:41:32.42825
38	11	Professor	Jorge Martin	Alfaro	23786247	1974-01-02	42	\N	234215504944	martinalfaro@yahoo.com.ar	B	+	Ioma	23786247		Lilliardo Debora	Esposa	234215504943	2016-06-04 14:49:19.468619	2016-06-04 14:49:19.468619
39	12	Professor	Guillermina	De Villa		\N	\N	\N											2016-06-04 15:02:49.183129	2016-06-04 15:02:49.183129
40	28	Partaker	Lucia	De Boni	41740271	\N	17	\N	2342532125	lu_deboni@hotmail.com			Pami	3118932		Isabel Acosta	Madre	2342467965	2016-06-04 15:07:58.382401	2016-06-04 15:07:58.382401
41	13	Professor	Cecilia	Sburlatti		\N	\N	\N											2016-06-04 15:09:10.745973	2016-06-04 15:09:10.745973
42	29	Partaker	Mariana	Polizzi	41293584	1998-08-22	17	\N	2342548759	mari_polizzi@hotmail.com	0	+	Ioma	8616619946/03	2342422390	Silvia Noemi Luis	Madre	2342454475	2016-06-04 15:13:18.274282	2016-06-04 15:13:18.274282
43	30	Partaker	Juan Ignacio	Deniz	41258612	1998-10-09	17	\N	234215461309	thefontand2002@yahoo.cd	A	+	Ioma	2207670222/02		Fontana Laura	Madre	234215461309	2016-06-04 15:16:55.419033	2016-06-04 15:16:55.419033
44	31	Partaker	Julian Eduardo	Gatica	43803424	2002-01-04	14	\N	2346635592	juliangatica01@gmail.com	0	+	Ioma	2163010902/02	234615635592	Maria Guillermina Marchetto	Madre	234615454534	2016-06-04 15:34:04.796851	2016-06-04 15:34:04.796851
45	32	Partaker	Camila 	Corral Morossini	42225069	1999-11-01	16	\N	2342431771	camicorral@hotmail.com	A	+	Osde			Sebastian Corral	Padre	2342411438	2016-06-04 15:34:04.856919	2016-06-04 15:34:04.856919
46	33	Partaker	Florencia	Salgado	42135034	2000-01-06	16	\N	234215406511	marianita.1977@hotmail.com	0	+				Salgado Walter	Padre	234215404507	2016-06-04 15:34:04.883803	2016-06-04 15:34:04.883803
47	34	Partaker	Delfina	Figueras Bielsa	42252647	1999-12-11	16	\N	2342486774	delfinafigueras@hotmail.com	A	-	Osde	35212667203		Silvia Ines Estrugamou	Madre	2342486774	2016-06-04 15:34:04.896343	2016-06-04 15:34:04.896343
48	35	Partaker	Julieta	Ben Portinaro	42568802	2000-06-07	16	\N	421669	julietabenportinaro@gmail.com	A	+	Ioma	2204911520/03	234215472294	Laura Andrea Portinaro	Madre	234215470535	2016-06-04 15:34:04.908268	2016-06-04 15:34:04.908268
49	36	Partaker	Paloma 	Latorre Heredia	42135107	2000-02-21	16	\N		palomalatorreh@hotmail.com	0	+	Ioma	9616043288/04		Monica Heredia	Madre	2342409054	2016-06-04 15:51:13.916662	2016-06-04 15:51:13.916662
50	37	Partaker	Agustina	Loriente	42058023	1999-10-08	16	\N	234215403566	agusloriente@hotmail,com	A	+	Ioma	2255228172/02		Julio Valeria	Madre	234215404027	2016-06-04 15:51:13.928275	2016-06-04 15:51:13.928275
51	38	Partaker	Aaron 	Prado	41999724	2000-06-15	15	\N	2342480209	pradoaaron@gmail.com			Osde			Ana Karina Dondena	Madre	234215404657	2016-06-04 15:51:13.945123	2016-06-04 15:51:13.945123
52	39	Partaker	Juana	Mendizabal	42302492	2000-01-21	16	\N	430266	juanamendizabal@outlook.com	A	+	Osde			Laura Ruiz Diaz	Madre	2342409092	2016-06-04 15:51:13.959367	2016-06-04 15:51:13.959367
53	40	Partaker	Juan Andres	Bagattin	42568777	2000-05-17	16	\N	2342426882	jbagattin@fibertel.com.ar	AB	+	Osde	352088371/04	2342430676	Cesanelli Marcela	Madre	234215401085	2016-06-04 15:51:13.974482	2016-06-04 15:51:13.974482
54	41	Partaker	Karen Beatriz	Salto	41293543	1998-07-23	17	\N	234215472769	karen_salto@live.com.ar	A	+	Ioma	2244236922/04		Verónica Andrea Salto	Hermana	234215515607	2016-06-06 20:17:54.136489	2016-06-06 20:17:54.136489
55	42	Partaker	Gustavo Isaias	Gomez	42839127	2000-06-18	15	\N	2342481500	gusty1g-ms10@outlook.com	0	+	NBI Hospital Municipal				Madre	2342530884	2016-06-06 20:17:54.153499	2016-06-06 20:17:54.153499
56	43	Partaker	Juliana Abigail	Pampin	42135008	1999-12-10	16	\N	2342556440	abigail-pampin1999@hotmail.com	B	+	NBI Hospital Municipal				Madre	2342556440	2016-06-06 20:17:54.165706	2016-06-06 20:17:54.165706
57	44	Partaker				\N	\N	\N											2016-06-06 20:17:54.180232	2016-06-06 20:17:54.180232
58	45	Partaker	Karean Beatriz	Salto	41293543	1998-07-23	17	\N	234215472769	karen_15_salto@live.com.ar	A	+	Ioma	2244236922/04		Veronica Andrea Salto	Hermana	234215515607	2016-06-06 20:28:40.599382	2016-06-06 20:28:40.599382
59	46	Partaker	Gustavo Isaias	Gomez	42839127	2000-06-18	15	\N	2342481500	gusty16-ms10@outlook.com	0	+	NBI				Madre	2342530884	2016-06-06 20:28:40.625007	2016-06-06 20:28:40.625007
60	47	Partaker	Juliana Abigail	Pampin	42135008	1999-12-10	16	\N	2342556440	abigail-pampin1999@hotmail.com	B	+	NBI Hospital					2342556440	2016-06-06 20:28:40.644094	2016-06-06 20:28:40.644094
66	53	Partaker	Catalina 	Cavigiolo	41461842	1999-01-02	17	\N	2342404149	catalina-cavigiolo@hotmail.com	B	+					Madre		2016-06-06 20:45:23.207639	2016-06-06 20:45:23.207639
68	55	Partaker	Tomas 	Cornaglia	40844272	1998-10-23	17	\N	421491	tomascornaglia@hotmail.com	0	+	Osde	352163209/04		Marta Alejandra Suarez	Madre	2342400464	2016-06-06 20:52:44.189067	2016-06-06 20:52:44.189067
61	48	Partaker	Milagros Sol	Grandi	46684704	2000-02-28	16	\N	2342511036	grandisooloog@gmail.com	A	+	OSAMI	20000898/0		Yesica Grandi	Hermana	2342460874	2016-06-06 20:34:58.047781	2016-06-06 20:34:58.047781
62	49	Partaker	Lourdes Sofia	Lupo	41461732	1998-11-02	17	\N	423520	sofialupo98@hotmail.com			Ioma	1233731589/02		Ricci Silvana Soledad	Madre	423520	2016-06-06 20:34:58.057062	2016-06-06 20:34:58.057062
63	50	Partaker	Larisa Denise	Lupo	43968780	2002-04-08	14	\N	423520				Ioma	1233731589/03		Ricci Silvana Soledad	Madre	423520	2016-06-06 20:37:27.67423	2016-06-06 20:37:27.67423
64	51	Partaker	Maria Felicitas	Rizzo	41293516	1998-07-07	17	\N	2342405214	felicitas_rizzo@hotmail.com	AB	+	Ioma	2221713750/04	422390	Marisa Sanchez	Madre	2342400025	2016-06-06 20:41:01.930337	2016-06-06 20:41:01.930337
65	52	Partaker	Felicitas	Bruno	41666756	1998-11-24	17	\N	2342554184	brunofelicitas@outlook.com			Ioma			Elsa Ualdini	Madre	2342461925	2016-06-06 20:43:45.115467	2016-06-06 20:43:45.115467
67	54	Partaker	Noelia	Cerri	41293513	1998-07-04	17	\N	234215547008	noecerri@hotmail.com	0	+				Claudio Rodolfo Cerri	Padre	234215445011	2016-06-06 20:50:05.356946	2016-06-06 20:50:05.356946
69	56	Partaker	Diego Armando	Moreno	41461790	1998-12-09	17	\N	426984	diegomorenojrr@gmail,com	A	+	Osde	621805318/03	08108887788	Mariela Tocci	Madre	2342426984	2016-06-06 20:58:23.508508	2016-06-06 20:58:23.508508
70	57	Partaker	Sofía 	Talfumera	41537143	0098-10-30	17	\N	1150063482	sofiatal_mar@hotmail.com	0	+	IOMA	2197766373		Nélida Noemí Marano	Madre	2342470283	2016-06-21 17:45:18.394257	2016-06-21 17:45:18.394257
71	58	Partaker	Maria Delfina	Gonzalez	43799295	2001-11-23	14	\N	2342534329	mdelfig@hotmail.com	A	+	IOMA	2247964299/02	23422454015	Mariana Diez	Madre	2342454015	2016-06-21 17:53:35.53562	2016-06-21 17:53:35.53562
72	59	Partaker	Abril Agustina	Vola	44112011	2002-04-28	14	\N	2342425306		0	+	IOMA	33005901080002		Natalia Aliano	Padre	15404534	2016-06-21 17:53:35.553581	2016-06-21 17:53:35.553581
73	60	Partaker	Julieta	Caprissi	43922683	2002-05-03	14	\N	2342459274	silvialasa@live.com.ar	0	+	OSDE	35217662904	2342457924	Mabel Lasa	Tia	2342457922	2016-06-21 17:53:35.566481	2016-06-21 17:53:35.566481
74	61	Partaker	Julieta	Bonora	41293666	1998-10-10	17	\N	234215406549	julietabonora@outlook.com	0	-	OSFATyF	16/14233/3-03	2342422967	Nancy Marcela Fernandez	Madre	234215545755	2016-06-21 17:59:34.316577	2016-06-21 17:59:34.316577
75	62	Partaker	Maria Belen	Lizarralde	41891121	1999-06-04	16	\N	2342422511		0	+	IOMA	2144171406/04		Portinaro Patricia	Madre	2342445828	2016-06-21 18:03:13.166093	2016-06-21 18:03:13.166093
77	63	Partaker	Alejo	Petek	42254753	1999-12-06	16	\N	2342430124	alejo.petek@gmail.com	0	+	IOMA	2162995673/04		Claudia Papiccio	Madre	2342414683	2016-06-21 18:22:11.739553	2016-06-21 18:22:11.739553
78	64	Partaker	Josefina	Agostinelli	42057928	0099-08-11	16	\N	424469	josefina.agostinelli@gmail.com	0	+	Swiss Medical	800006 0328388 030037	0800 777 7800		Madre	234215451095	2016-06-21 18:22:11.766764	2016-06-21 18:22:11.766764
79	65	Partaker	Rocío 	Quarleri	42057058	0099-11-01	16	\N	2342461377	rochiquarleri@hotmail.com	0	+	IOMA	116579651103		Rosa Tottotella	Madre	2342430607	2016-06-21 18:22:11.783194	2016-06-21 18:22:11.783194
80	66	Partaker	Tomás	Smith	42146042	\N	16	\N	2342555640	smithtomas@hotmail.com	0	+	IOMA	2178642406/03	2342426415	Marisa Belardo	Madre	2342480800	2016-06-21 18:22:11.795729	2016-06-21 18:22:11.795729
81	67	Partaker	Juan Martín	Comas	41891175	0099-07-08	16	\N	234215446148	comasm2@gmail.com	0	+	IOMA	2231137003/03	2342514229	Eliana Zucherelli	Madre	2342446148	2016-06-21 18:22:11.822327	2016-06-21 18:22:11.822327
82	68	Partaker	Juan Ignacio	Avena	43463037	0001-06-07	14	\N	234215460218	juanavena@hotmail.com.ar	A	+	OSECAC	43463037		Alicia Bruno	Madre	234215405691	2016-06-21 18:22:11.83879	2016-06-21 18:22:11.83879
83	69	Partaker	Santiago	Soldá	42057906	0099-07-27	16	\N	450001	marcelahelfe_15@hotmail.com	AB	+	IOMA	2210091755/04		Marcela Helfer	Madre	234215459828	2016-06-21 18:22:11.864941	2016-06-21 18:22:11.864941
84	70	Partaker	Francisco	Marini	41461894	1999-02-21	17	\N	2342545663	franmarini11@gmail.com	A	+	IOMA	2249471450/02		Maria Luz Conde	Madre	2342508154	2016-06-21 18:40:35.81956	2016-06-21 18:40:35.81956
85	71	Partaker	Agustina 	Minetto	42839108	2000-08-18	15	\N	234215480407	agus.bucledorado@hotmail.com	0	+	IOMA	4221713027/02		Maria Laura Echave	Madre	431100	2016-06-21 18:40:35.850569	2016-06-21 18:40:35.850569
86	72	Partaker	Leo	Beltrán	41891117	0099-03-24	17	\N	234215534556	leobeltran@outlook.es	0	+	AMEBPBA	3516792		María Antonia Morel 	Madre	234215534645	2016-06-21 18:40:35.871784	2016-06-21 18:40:35.871784
87	73	Partaker	Federico Yoel	Madeo Dorsch	41757505	0099-02-17	17	\N	2342414055	fede.made.12@gmail.com	0	+	OSECAC	30589473643	2342430951	Mirtha Adriana Dorsch	Madre	01161880828	2016-06-21 18:40:35.891922	2016-06-21 18:40:35.891922
88	74	Partaker	Juan Eduardo	Neri Artano	41646787	0098-11-21	17	\N	2342405779	juaanneri@gmail.com	0	+	OSDE	617343470/03		María Eugenia Mora	Madre	2342407195	2016-06-21 18:40:35.916128	2016-06-21 18:40:35.916128
89	75	Partaker	Harold	Marquina	94033165	0098-12-02	17	\N	234215450070	haroldmarquina@gmail.com	0	+	OSDE	61439564903	08108887788	Soledad Cuzco	Madre	234215450070	2016-06-21 18:44:10.450494	2016-06-21 18:44:10.450494
90	76	Partaker	Milagros 	Disanti	42857395	0099-05-09	17	\N	2345560331	milidisanti10@gmail.com	A	+	OSECAC	41857395			Padre	2342483569	2016-06-21 18:47:39.860069	2016-06-21 18:47:39.860069
91	77	Partaker	Josefina	Macías	43094341	2001-01-05	15	\N	426077	gabrielmacias2467@gmail.com	A	+	OSDE	619904355/03	2342421870	Gabriel H. Macías	Padre	234615686653	2016-06-21 19:10:48.256185	2016-06-21 19:10:48.256185
92	78	Partaker	Melina	Aliano	43399132	0001-04-27	15	\N	2342401636	melinaaliano@yahoo.com.ar	A	+	OSECAC	43399132		Juanes Ana Graciela	Madre	2342401636	2016-06-21 19:10:48.278855	2016-06-21 19:10:48.278855
93	79	Partaker	Joaquín 	Vicente	43256348	0001-03-11	15	\N	234215504732	mleticia1@hotmail.com	0	+	MEDIFE	300911674-0381	08003330075		Madre	2342504732	2016-06-21 19:10:48.320291	2016-06-21 19:10:48.320291
94	80	Partaker	Francisco	Deramo	44044812	2002-03-02	14	\N	2342412141	deramofrancisco@gmail.com						Mariela Degue	Madre	2342412141	2016-06-21 19:53:41.179851	2016-06-21 19:53:41.179851
95	81	Partaker	Carolina Adriana	Sola	43968737	0002-02-26	14	\N	2342533124	caarosola@gmail.com	0	-	SAMI	0020150002	2342430406	Ricardo Daniel Sola	Padre	2342411324	2016-06-21 19:53:41.194186	2016-06-21 19:53:41.194186
76	14	Professor	Laura	Portinaro	20491152	0068-11-24	47	\N	234215470535	lportinaro@gmail.com	B	+	IOMA	2204911520/00		Luisa Erro de Portinaro	Madre	422957	2016-06-21 18:05:00.030794	2016-06-21 20:01:40.502094
97	15	Professor	María Marta	Orfali Fabre	24521047	0075-04-21	41	\N	0111521620977	mmorfali@gmail.com	0	+	OSDE	621561249/02	08108887788	Ramón Baretta	Esposo	234215406341	2016-06-21 20:05:46.589109	2016-06-21 20:05:46.589109
98	16	Professor	Maximiliano Guillermo	Pecorelli	27385162	0079-06-29	36	\N	2342407367	maxipecorelli@gmail.com	0	+	IOMA	1273851621/00		Jimena Ogna	Concubina	2342505404	2016-06-21 20:08:55.224698	2016-06-21 20:08:55.224698
99	83	Partaker	Daiana Josefina	Peracca	41293641	0098-09-21	17	\N	427228	josefinaperacca15@hotmail.com	B	+	IOMA	122568336002		Silvina Beatriz Iberna	Madre	427228	2016-06-21 20:13:13.17183	2016-06-21 20:13:13.17183
100	84	Partaker	María Pia	Dinápoli Citrángolo	41891107	0099-05-07	17	\N	2342422718							Viviana Citrángolo			2016-06-21 20:15:42.777471	2016-06-21 20:15:42.777471
101	85	Partaker	Milagros	Ahumada	41357390	0099-05-06	17	\N		milagros_ahumada@hotmail.com	0	+	OSPIPA	2465285302		Estela Romero	Madre 	2342512357	2016-06-21 20:18:35.640718	2016-06-21 20:18:35.640718
102	86	Partaker	Dolores	Molina	41461813	0099-01-13	17	\N	2342480931	doloresmolina_barni@hotmail.com	0	+	OSDE	35205373005		Betina Barni	Madre	2342403824	2016-06-21 20:21:36.898134	2016-06-21 20:21:36.898134
103	87	Partaker	Pilar	Bondoni	42102602	\N	16	\N	2342504448	pilarbondoni9@gmail.com	B	+	OSDE	60708460904		Silvana De Pietro	Madre	2342504381	2016-06-21 20:23:43.997332	2016-06-21 20:23:43.997332
104	88	Partaker	Malena	Pardo Ortiz	43720372	2001-12-06	14	\N	2342430733	malepardo6@hotmail.com	0	+	OSDE	609174974004		Maria Lucia Ortiz	Madre	234215483943	2016-06-21 20:51:54.186066	2016-06-21 20:51:54.186066
105	89	Partaker	Candelaria	Romero	41461751	1998-11-24	17	\N	234215456700	candelariaaa.romero@gmail.com	0	+	IOMA	B180858468/03		Sandra Rosana Carballo	Madre	234215465774	2016-06-21 20:51:54.20382	2016-06-21 20:51:54.20382
106	90	Partaker	Yair	Bonahora	42568807	2000-06-07	15	\N	2342425124	yairbonahora_02@hotmail.com	0	+				Sandra Pinedo	Madre	15460454	2016-06-21 20:51:54.220891	2016-06-21 20:51:54.220891
107	91	Partaker	Agustina	Mira	41968736	1999-05-26	16	\N	234215413595	agustinamira@gmail.com	0	+	PAMI	150544227108	08002227264	Carina Ines Mira	Madre	234215413595	2016-06-21 20:51:54.238095	2016-06-21 20:51:54.238095
108	92	Partaker	Camila	Aragones	41461900	1999-02-22	17	\N	02342 427990	NT66266@hotmail.com	0	+	OSECAC			Nancy Terruzzi	Madre	2342 427990	2016-06-21 20:51:54.26391	2016-06-21 20:51:54.26391
109	93	Partaker	Francisco	Macias	42839125	2000-08-20	15	\N	2342 422087	franmaciaspabaron@gmail.com			OSDE	35210838	2342 422087	Maria Laura Pabaron	Madre	2342 512111	2016-06-21 21:12:56.229692	2016-06-21 21:12:56.229692
110	94	Partaker	Valentin	Alonso	43094353	2000-12-20	15	\N	2342 400809	alonso.valentin@hotmail.com			IOMA	A273852046/00	2342 400809	Gaston Alonso	Padre	2342 400809	2016-06-21 21:12:56.245909	2016-06-21 21:12:56.245909
111	95	Partaker	Delfina Agustina	Sanes	43256317	2001-02-24	15	\N	02342 15445084	marulu78@hotmail.com	A	+	IOMA	22865952702		Mendez Marta	Madre	2342 15445084	2016-06-21 21:12:56.259126	2016-06-21 21:12:56.259126
112	96	Partaker	Milagros	Ruggiero	43463006	2001-06-16	14	\N	2342 534477	milita_ruggiero@hotmail.com	A	-	OSECAC	43463006		Spositto Graciela	Madre	02346 15414996	2016-06-21 21:12:56.273401	2016-06-21 21:12:56.273401
113	97	Partaker	Juan Carlos	Audagno	42568804	2000-06-02	15	\N	2342 421191		A	+	IOMA	2215739744/02		Lego Mariela	Madre	15404010	2016-06-21 21:12:56.291805	2016-06-21 21:12:56.291805
114	98	Partaker	Valentin Adrian	Cabrera	42839141	2000-05-03	16	\N	2342 409430		0	+					Madre	2342 409430	2016-06-21 21:32:47.06701	2016-06-21 21:32:47.06701
115	99	Partaker	Albertina	Etchart	43803499	2002-02-18	14	\N	2342 426145	etchartalbertina@hotmail.com	B	-	IOMA	2218267233/02	02342 450595	Marina Montiel	Madre	02342 450595	2016-06-21 21:32:47.076068	2016-06-21 21:32:47.076068
116	100	Partaker	Gaspar	Castillo	42058021	1999-10-12	16	\N	02342 422313	gasparesleyenda@live.com.ar	B	+	IOMA	1163152694/03		Susana Etchehun	Madre	02346 15687030	2016-06-21 21:32:47.085406	2016-06-21 21:32:47.085406
117	101	Partaker	Ivana	Mrozek	44130101	2002-05-05	14	\N	2342515310	ivana.mrozek@hotmail.com		+					Madre	2342515310	2016-06-21 21:32:47.095293	2016-06-21 21:32:47.095293
118	102	Partaker	Sofia Ayelen	Cordoba	43803408	2001-12-22	14	\N	2342 466646	sofia.cordoba@live.com.ar	A	+	IOMA	9816619888003	2342 427577	Calo Armanda	Madre	2342 466646	2016-06-21 21:32:47.104299	2016-06-21 21:32:47.104299
119	103	Partaker	Rosario Antonella	Catoretti	42568895	2000-08-08	15	\N	02342 482475		0	+	OSECAC	42568895	02342 407649	Soledad Decibe	Madre	2342 4076 49	2016-06-21 21:44:55.831841	2016-06-21 21:44:55.831841
120	104	Partaker	Paula	Baez	43094343	2001-01-12	15	\N	02342 15501102		A	+	IOMA	1204652433/02	425660		Padre	2342 15487540	2016-06-21 21:44:55.843358	2016-06-21 21:44:55.843358
122	106	Partaker	Lucia Anahi	Casado	40611174	1997-12-18	18	\N	2342511401	luciaacasado1@gmail.com	A	+	OSSAMI	20001535/02	08003333169	Maria Alejandra Roberts Kinder	Madre	2954540399	2016-06-22 17:36:00.478504	2016-06-22 17:37:27.391192
123	107	Partaker	Gala 	Luisetto	41461747	0098-11-19	17	\N	2342421634	galaluisetto@gmail.com	B	+	IOMA	216709956904		Moira Gannon	Madre	2342403066	2016-06-22 17:37:47.611351	2016-06-22 17:37:47.611351
124	108	Partaker	Guadalupe	Llanos	41293626	1998-08-25	17	\N	0234215499996	guadalupellanos17@hotmail.com			IOMA			Fernando Llanos	Padre	2342506232	2016-06-22 17:41:59.232418	2016-06-22 17:41:59.232418
125	109	Partaker	Catalina 	Vives	41293562	0098-07-31	17	\N	2342458236	catalinavives@yahoo.com.ar	B	+	OSSEG	21444919/06-48		Maria Fernanda Gerardi	Madre	2342505603	2016-06-22 17:44:02.58883	2016-06-22 17:44:02.58883
126	110	Partaker	Manuel	Gomez Ros	41740228	1999-02-22	17	\N	2342506204	manuel.gomezros99@gmail.com	0	+	SAMI	86700/0	2342 425201	Marcela Ros	Madre	2342480536	2016-06-22 17:47:07.659559	2016-06-22 17:47:07.659559
127	111	Partaker	Maria Felicitas	Recalde	43094362	2001-01-27	15	\N	2342 462644	mfelicitasrecalde@gmail.com	0	+	IOMA	1120374028/04		Roberto Recalde	Padre	234215505397	2016-06-22 17:56:30.730569	2016-06-22 17:56:30.730569
128	112	Partaker	Facundo	Loriente	41740278	1999-03-29	17	\N	423997	facundo_loriente@hotmail.com	0	+	AMEPBA	32046/3/03	15406612	Marina Lucchelli	Madre	2342406612	2016-06-22 18:02:03.812466	2016-06-22 18:02:03.812466
129	113	Partaker	Catalina	Massa	42135164	2000-03-14	16	\N	2342 510116	catalinamassa45@gmail.com	A	+	IOMA	A16579294603	15409197	Veronica Franza	Madre	2342 409197	2016-06-22 18:08:13.624774	2016-06-22 18:08:13.624774
130	114	Partaker	Pablo Valentín	Sagardoy	44112052	2001-11-26	14	\N			A	+	IOMA	2318605953/03		Romina Patricia Wilhelm	Madre	2342458228	2016-06-22 18:08:20.66636	2016-06-22 18:08:20.66636
131	115	Partaker	Sofía 	García	42631529	0001-02-03	15	\N	234215532775	sofi_09irala@hotmail.com	0	+	IOMA	9816579240/08		Patricia Susana Lázaro	Madre	2342431016	2016-06-22 18:08:20.687198	2016-06-22 18:08:20.687198
132	116	Partaker	Esperanza Rocío	Gimenez	43968744	0002-03-15	14	\N	2342489068	esperanzagimenez20@gmail.com	0	+	Unión Personal	00082163 11 0		Gimenez Alberto Manuel	Padre	2342482909	2016-06-22 18:08:20.729049	2016-06-22 18:08:20.729049
133	117	Partaker				\N	\N	\N											2016-06-22 18:08:20.765331	2016-06-22 18:08:20.765331
134	118	Partaker	Amparo	Hernández	41461852	0099-01-02	17	\N	2342423201	ampa_herna@hotmail.com	0	+	IOMA	116301321402		María Luz Albizu	Madre	2342456108	2016-06-22 18:16:15.511334	2016-06-22 18:16:15.511334
135	119	Partaker	Felipe	Rodeiro	43030938	2000-10-30	15	\N	02346 471848		A	+	IOMA	21772193803	2346413654	Silvia Boveri 	Madre	2346503992	2016-06-22 18:30:42.935404	2016-06-22 18:30:42.935404
136	120	Partaker	Agustin	Castillo	42147004	1999-09-20	16	\N	02346 471888	agusbautisanti@yahoo.com.ar	0	+	IOMA	1229839466/02	02346 472023	Adrian Castillo	Padre	02346 15569623	2016-06-22 18:30:42.941852	2016-06-22 18:30:42.941852
137	121	Partaker	Josefina	Klein	41999685	\N	16	\N	2346 563285	chochi-18@hotmail.com	A	+	SWISS MEDICAL	80006069589604/023	08007777800	Adriana Orisso	Madre	0234615556780	2016-06-22 18:30:42.947658	2016-06-22 18:30:42.947658
138	122	Partaker	Violeta	Mussi	42095212	1999-09-07	16	\N	221 6120276	violetabertolot99@hotmail.com			IOMA	2241599679/02		Mercedes Lizarralde	Madre	221 3516189	2016-06-22 18:30:42.954153	2016-06-22 18:30:42.954153
139	123	Partaker	Manuel	Robles	42957803	2001-01-23	15	\N	02346 470770	fdrdaniel@yahoo.com.ar	0	-	OSECAC	42957803	02346 15517201	Robles Daniel	Padre	02346 15517201	2016-06-22 18:30:42.979565	2016-06-22 18:30:42.979565
140	124	Partaker	Vicente	Molina	42963343	2000-09-26	15	\N	2342426055	bragado@intagro.com	A	+	OSDE	35211640503		Sergio Molina	Padre	234615481214	2016-06-22 18:35:46.473102	2016-06-22 18:35:46.473102
141	125	Partaker	Tatiana	Quarleri	43463002	0001-06-02	14	\N	2342423547	tatiquarleri@hotmail.com	0	+	IOMA	116579451104		Rosana Tortorella	Madre	2342402127	2016-06-22 18:35:46.490458	2016-06-22 18:35:46.490458
142	126	Partaker	Lara Marian	Sotelo	43968752	0002-03-21	14	\N					OSECAC				Madre	234215404240	2016-06-22 18:35:46.514234	2016-06-22 18:35:46.514234
143	127	Partaker	Pedro	Buzzeo	43801405	0001-10-25	14	\N	2342405945	pedrobuzzeo@gmail.com	0	+	Swiss Medical	7134318030060	08007777800	Susana Gastambide	Madre	2342467999	2016-06-22 18:35:46.542363	2016-06-22 18:35:46.542363
144	128	Partaker	Lucas	Albizu	42839156	\N	15	\N	2342427418	luqui.albizu@hotmail.com	0	+	DAS	43558/12	2342463268	Luciana Tuguores	Madre	2342404418	2016-06-22 18:35:46.56232	2016-06-22 18:35:46.56232
148	132	Partaker	Nicolas Ignacio	Guelfi	41999684	2000-03-15	16	\N	02346 414713							Lidia Carretoni	Madre		2016-06-22 18:48:12.050242	2016-06-22 18:48:12.050242
149	133	Partaker	Maria Eugenia	Russo	41999641	1999-10-18	16	\N	02346411052	eugeniarusso1999@gmail.com	0	+	IOMA	9941999641/00		Marta Rodiño	Abuela	02346 656233	2016-06-22 18:48:12.060098	2016-06-22 18:48:12.060098
150	134	Partaker	Felicitas	Sosa	41999662	1999-12-28	16	\N	2346517261	luchiboveri@hotmail.com	A	+	IOMA	229345901902	2346303037	Boveri Maria Lujan	Madre	2346 517261	2016-06-22 18:48:12.06765	2016-06-22 18:48:12.06765
151	135	Partaker	Gabriel	Carretoni	41999604	1999-06-30	16	\N	02346 15542675		A	+	IOMA	2217864567/01		Silvia Garcia	Madre	02346 15542675	2016-06-22 18:48:12.081545	2016-06-22 18:48:12.081545
152	136	Partaker	Paulina	Cabañez	42278804	1999-12-25	16	\N	0266 4582083	mariapaulina11@hotmail.com.ar	A	+				Eva Cabañez	Madre	0266 664775501	2016-06-22 18:48:12.108618	2016-06-22 18:48:12.108618
154	138	Partaker	Francisco	Aime	41857380	1999-05-08	17	\N	0342 431573	franciscoaime_85B@hotmail.com	A	-	IOMA	2146007251/03		Gigliotti Ana	Madre	02342 15445083	2016-06-22 18:51:36.727803	2016-06-22 18:51:36.727803
145	129	Partaker	Esperanza Rocío	Gimenez	43968744	2002-03-15	14	\N	2342489068	esperanzagimenez20@gmail.com	0	+	Unión Personal	00082163 11 0		Giménez Alberto Manuel	Padre	2342482909	2016-06-22 18:44:06.969961	2016-06-22 18:44:06.969961
146	130	Partaker	Pablo Valentín 	Sagardoy	44112052	0001-11-26	14	\N			A	+	IOMA	2318605953/03		Romina Patricia Wilhem	Madre	2342458228	2016-06-22 18:44:06.997706	2016-06-22 18:44:06.997706
153	137	Partaker	Camila Irupe	Cardoso	41461840	0099-01-18	17	\N	427478	irupe-c@hotmail.com	0	+	IOMA	226301435/02			Abuelos	2342402746	2016-06-22 18:49:50.360364	2016-06-22 18:49:50.360364
155	139	Partaker	Maria Luz	Scotti	41293575	1998-08-08	17	\N	02342 410032	marialuz_scotti@hotmail.com	0	+	MEDICUS	107932267001		Maria Cecilia Petegoli	Madre	02342 410015	2016-06-22 21:04:51.613193	2016-06-22 21:04:51.613193
156	140	Partaker	Antonella	Gastaldi	41461734	1998-11-16	17	\N	02342 15547221	gastaldiantonella@hotmail.com			OSDE 	61 139226 6 03	0810 888 7788	Vanegas Edith Rosa	Abuela	427406	2016-06-22 21:04:51.626359	2016-06-22 21:04:51.626359
157	141	Partaker	Camila	Senise	41293625	1998-09-07	17	\N	02342 15590941	camilasenise@hotmail.com	B	+	IOMA	2229341977/02		Lorena Bastoni	Madre	02342 15400327	2016-06-22 21:04:51.652905	2016-06-22 21:04:51.652905
158	142	Partaker	Azul	Ghezzi	41834984	1999-04-01	17	\N	02342 425996	azughezzi@hotmail.com	0	+	SWISS MEDICAL	7438395030004		Patricia Aizpuru	Madre	02342 425996	2016-06-22 21:10:53.667548	2016-06-22 21:10:53.667548
159	143	Partaker	Maira	Marin	42568735	2000-04-28	16	\N	02342 15400206	maimarin214@gmail.com	A	+	OSPJN	28816/32	01143789150	Fernando Pedro Marin	Padre	02342 15400352	2016-06-22 21:23:54.95766	2016-06-22 21:23:54.95766
160	144	Partaker	Angeles	Peralta	42058026	1999-10-19	16	\N	02342 509904		A	+	IOMA	2138641474/03		Nora Aliano	Madre	02342 460507	2016-06-22 21:23:54.993763	2016-06-22 21:23:54.993763
161	145	Partaker	Valentina	Aburruza	42644127	2000-05-16	16	\N	02342 412292		A	+	OSDE			Maria Julia Dorrego	Madre	02342 414628	2016-06-22 21:23:55.030356	2016-06-22 21:23:55.030356
162	146	Partaker	Clara Mariana	De Renzis	41293603	1998-08-31	17	\N	02342 426054	claritaderenzi5@live.com.ar	A	+	SWISS MEDICAL	0508483031002	0800 777 7800	Carla Bollini	Madre	02342 15403062	2016-06-22 21:47:34.049239	2016-06-22 21:47:34.049239
163	147	Partaker	Martina	Piovano	43914954	2001-12-21	14	\N	02342424540	viviamaya9@gmail.com	A	+	IOMA	002234318		Viviana Amaya	Madre	0111558227843	2016-06-22 21:47:34.074087	2016-06-22 21:47:34.074087
164	148	Partaker	Felipe	Rizzo	43403067	2001-07-18	14	\N	02342411965	felorizzo2001@gmail.com	0	+	OSDE	35203402304		Maria Silvina Loriente	Madre	02342 412022	2016-06-22 21:47:34.084935	2016-06-22 21:47:34.084935
165	149	Partaker	Ana Clara	Romeo	41293639	1998-09-09	17	\N	02342 421373	clarita_romeo@hotmail.com	A	+	IOMA	2200328869/03	02342 422390	Adriana Silvina Sanchez	Madre	02342 15452035	2016-06-22 21:47:34.102563	2016-06-22 21:47:34.102563
166	150	Partaker	Pedro Damian	Troyano	41293524	1998-08-27	17	\N	02342 455222	nataliatroyano@hotmail.com	A	+	PAMI	1507522437205		Natalia Troyano	Tutora	02342 15455222	2016-06-22 21:47:34.117731	2016-06-22 21:47:34.117731
170	154	Partaker	Agustina 	Gotta	41891153	0099-06-01	17	\N	421306	agus_gotta100699@hotmail.com			Banco Provincia	33531/2/3		Cintia Cusín	Madre	2342457777	2016-06-23 17:25:25.966914	2016-06-23 17:25:25.966914
171	155	Partaker	Sofia	Pellegrino	41641737	0098-10-10	17	\N	234215462028		B	+				Marcela Viñales	Madre	234215468217	2016-06-23 17:27:12.5648	2016-06-23 17:27:12.5648
172	156	Partaker	Ignacio 	Caprissi	41586969	0098-10-07	17	\N	2342458680	ncaprissi@gmail.com	0	-	OSDE	35217662903		Silvia Laura Lasa	Madre	2342457921	2016-06-23 17:30:36.146579	2016-06-23 17:30:36.146579
173	157	Partaker	Francisco	Fernández	41808385	0099-04-09	17	\N	2342421529	fran.fer94@hotmail.com	A	+	IOMA	2169264086/02		Eldo Fernández	Padre	2342510941	2016-06-23 17:33:26.892974	2016-06-23 17:33:26.892974
174	158	Partaker	Luciana Belen	Lopez	41293623	1998-09-09	17	\N	02342 426050	luciana_l15@hotmail.com	0	+	IOMA FEBOS	8613864195/04		Alicia Esther Perotti	Madre	02342 15509758	2016-06-23 17:49:50.708554	2016-06-23 17:49:50.708554
175	17	Professor	Rossana 	Fraccaro		\N	\N	\N											2016-06-23 17:51:29.568168	2016-06-23 17:51:29.568168
177	160	Partaker	Valentina Ianina	Gallotti	42237921	1999-10-23	16	\N	2342427802	silvinamatiasovich@hotmail.com	0	+	Unión Personal	00886256029		Silvina Matiasovich	Madre	0111561709863	2016-06-23 17:56:03.33899	2016-06-23 17:56:03.33899
178	161	Partaker	María Valentina	Gobet	42058062	0099-11-09	16	\N	234215410568	valegobet@live.com.ar	0	+	IOMA	224048013/02		María Soledad Urricelqui	Madre	234215410592	2016-06-23 17:56:03.348485	2016-06-23 17:56:03.348485
179	162	Partaker	Victoria Pilar 	Barbero	40810284	0099-07-06	16	\N	2342531141	victoriabarbero99@gmail.com	B	+	Banco Provincia	19890/002		Juan Barbero	Padre	2342425345	2016-06-23 17:56:03.360642	2016-06-23 17:56:03.360642
180	163	Partaker	Ana Virginia	Heredia de la Nieve	95245596	0099-08-02	16	\N	427612	dlanieve@hotmail.com	0	+				Reyna de la Nieve	Madre	234215452758	2016-06-23 17:56:03.369828	2016-06-23 17:56:03.369828
181	164	Partaker	María Martina	Aime	42147458	0099-09-02	16	\N	2342534341	martu_aime@hotmail.com	A	+	Swiss Medical	800006-0467223-03-0008		Maria José Lucerna	Madre	2342513647	2016-06-23 17:56:03.378975	2016-06-23 17:56:03.378975
183	166	Partaker	Fermin	Colombo	41740263	1999-03-10	17	\N	02342 512905	fermin_colombo@hotmail.com	0	+				Hugo Colombo	Padre	02342 512222	2016-06-23 18:00:52.764456	2016-06-23 18:00:52.764456
184	167	Partaker	Mariano	Mederos	41293576	1998-08-04	17	\N	02342 548788	marianomederos98@hotmail.com	0	+	OSDE	35212032103	02342 410505	Zulma Basilio	Madre	02342 410505	2016-06-23 18:05:08.930088	2016-06-23 18:05:08.930088
186	169	Partaker	Fermin	Guillot	41461702	1998-10-31	17	\N	2342 426027	ferminguillot@hotmail.com	A	-	IOMA	2203770713/02		Bengochea Silvina	Madre	2342 404828	2016-06-23 18:10:56.847539	2016-06-23 18:10:56.847539
187	170	Partaker	María Luz	Pérez del Olmo	42568832	2000-06-15	16	\N	2342508913	luliiperezdelolmo@gmail.com	0	+	IOMA	2215739313/04	2342425392	Marcela del Olmo	Madre	2342459864	2016-06-23 18:11:57.852268	2016-06-23 18:11:57.852268
188	171	Partaker	Lourdes 	Gastaldo	42568739	2000-04-24	16	\N	2342530393	lulifly@hotmail.com	0	+	IOMA	2241819047/2	2342427555	Ana Méndez	Madre	2342400167	2016-06-23 18:11:57.864543	2016-06-23 18:11:57.864543
189	172	Partaker	Catalina	Juarez	43803401	2001-12-22	14	\N	2342513897	caturri-01@hotmail.com	A	+	FATSA	27-24947209-04	427400	Sergio Fabián Juarez	Padre	2342455215	2016-06-23 18:11:57.880096	2016-06-23 18:11:57.880096
190	173	Partaker	Clara Irene	Comas	43968748	2002-03-25	14	\N	2342513652	clari0232@gmail.com	0	+	IOMA	2231137000/4		Eliana Zucharelli	Madre	2342446148	2016-06-23 18:11:57.890086	2016-06-23 18:11:57.890086
167	151	Partaker				\N	15	\N			0	+							2016-06-23 17:21:24.570975	2016-08-19 20:56:20.019228
394	374	Partaker				\N	\N	\N											2016-08-19 20:57:26.177791	2016-08-19 20:57:26.177791
169	153	Partaker	Jeremias	Lazareff	42952329	2000-11-10	15	\N	2342 15413119		B	+	SWISS MEDICAL	800006 0375757		Ana Paula Menendez	Madre	2342 15413191	2016-06-23 17:21:24.597282	2016-08-19 20:58:29.495843
168	152	Partaker	Alejo	Tancredi	42568789	2000-05-25	16	\N	2342 545648				IOMA	2552335341/02		Burgeño Eliana	Madre	2342 44545648	2016-06-23 17:21:24.586916	2016-08-19 21:01:06.357233
395	375	Partaker	Delfina	Garat	43022462	2000-10-20	15	\N	239258	delfinagarat14@gmail.com.ar	A	+	OSDE	60764424805	431040	Lucia Madero	Madre	2392449446	2016-08-19 21:12:46.376753	2016-08-19 21:12:46.376753
191	174	Partaker	Brenda	Bussi	42568848	2000-03-09	16	\N	15405251	brendabussi@gmail.com	0	+				Lorena Gerardi	Madre		2016-06-23 18:11:57.899499	2016-06-23 18:11:57.899499
209	192	Partaker	Camila	Barros 	40794937	1997-05-05	19	\N	02342 451131	camilabarros@hotmail.com			PAMI			Nora Indini 	Madre	02342 414249	2016-06-23 19:05:09.492176	2016-06-23 19:05:09.492176
210	193	Partaker	Maria Agustina	Lozano	43094338	2000-12-23	15	\N	02342 424773	aguslozano.14@hotmail.com						Tabares Romina Soledad	Madre	424773	2016-06-23 19:05:09.503286	2016-06-23 19:05:09.503286
211	194	Partaker	Violeta	Gonzalez	43256324	2001-03-06	15	\N		luu38v@gmail.com			IOMA			Maria Lujan Gonzalez	Madre	2342 515942	2016-06-23 19:05:09.513867	2016-06-23 19:05:09.513867
212	195	Partaker	Daniela Sofia	Martinez Molina	94972186	2000-11-11	15	\N	02342 15486627	daniela1113marie@gmail.com	A	+	IOMA	2949721800/03	02342 15486627	Sandra Molina	Madre	02342 15486627	2016-06-23 19:05:09.525118	2016-06-23 19:05:09.525118
213	196	Partaker	Lucia	Beraza	42461746	1998-11-21	17	\N	02342 506795	lube-1998@hotmail.com	A	-	IOMA	1106687948107		Fernanda Reyes	Madre	02342 452657	2016-06-23 19:05:09.536583	2016-06-23 19:05:09.536583
217	200	Partaker	Thiago	Ghibaudo Farias	43463063	2001-07-20	14	\N	02342 15482889	marielaf71@hotmail.com	0	+	IOMA	2215738851/02		Mariela Farias	Madre	02342 15544850	2016-06-23 19:59:58.447273	2016-06-23 19:59:58.447273
218	201	Partaker	Franco Nahuel	Buzzada	43669369	\N	14	\N	02342 15456523	francolola4@gmail.com	A	+				Claudia Soledad Rizzo	Madre	02342 15507920	2016-06-23 19:59:58.460621	2016-06-23 19:59:58.460621
219	202	Partaker	Ariel Nazareno	Lombardo	45307463	2001-07-22	14	\N	02342 15404247							Lombardo Favio	Padre	02342 15404247	2016-06-23 19:59:58.471727	2016-06-23 19:59:58.471727
220	203	Partaker	Nicolas	Solimeo	43669331	2001-09-24	14	\N	422515	claudiabarraza@hotmail.es	0	+	IOMA	1180858560/03		Solimeo Marcelo	Padre	02342 15514348	2016-06-23 19:59:58.481165	2016-06-23 19:59:58.481165
221	204	Partaker	Lucas	Simionato	44112063	2002-05-21	14	\N	02342 423974	lucas_simio@hotmail.com			IOMA	2200125716/03	02342 15455353	Betina Suarez	Madre	02342 15406352	2016-06-23 19:59:58.492241	2016-06-23 19:59:58.492241
192	175	Partaker	Maria Agustina 	Salazar	43669327	2001-10-02	14	\N	234215507099				PAMI	040/02447200	2342400645	María Beatriz Berzoni	Madre	234215507099	2016-06-23 18:23:40.09888	2016-06-23 18:23:40.09888
194	177	Partaker	Zahira Magali	Gonzales	44112067	2002-05-13	14	\N	2342480057	zahiragonzalez07@hotmail.com	0	+	La pequeña familia	1001502/03			Madre	2342544526	2016-06-23 18:23:40.120475	2016-06-23 18:23:40.120475
195	178	Partaker	Mariana	Alonso	43255053	2001-02-17	15	\N	2342 15484791	alonsomariana02@gmail.com			OSECAC	43255053	02342 489791	Saires Erica	Madre	02342 483534	2016-06-23 18:28:32.129995	2016-06-23 18:28:32.129995
196	179	Partaker	Macarena	Islas 	43463075	2001-08-05	14	\N	02342 423208	laurarrusso@hotmail.com	0	+	OSSIMRA	00000885892112	0810 666 6413	Laura Raquel Russo	Madre	02342 15514041	2016-06-23 18:28:32.141013	2016-06-23 18:28:32.141013
197	180	Partaker	Amparo	Perez	42839149	2000-09-06	15	\N	02342 464303	amparo-perez13@hotmail.com	A	+	SWISS MEDICAL	80000604675000020003		Piñero Maria Alejandra	Madre	02342 456353	2016-06-23 18:28:32.150593	2016-06-23 18:28:32.150593
198	181	Partaker	Catalina	Ortiz Corniglia	43256387	2001-03-16	15	\N	0234215499015	danielacorniglia@hotmail.com	0	+	IOMA	222171684102		Daniela Corniglia	Madre	02342 15404901	2016-06-23 18:28:32.159592	2016-06-23 18:28:32.159592
199	182	Partaker	Renata	Palermo	43803432	2002-01-10	14	\N	02342 427739	renatapalermo_02@hotmail.com						Estela Gonzalez	Madre	02342 466444	2016-06-23 18:28:32.172262	2016-06-23 18:28:32.172262
200	183	Partaker	Laureana	Zubizarreta	42057986	1999-09-25	16	\N	02342 403858	laureanaz_99@hotmail.com	A	+	SWISS MEDICAL	8000060480965030003		Sandra Delettieres	Madre	02342 403858	2016-06-23 18:31:22.419901	2016-06-23 18:31:22.419901
201	184	Partaker	Maalen	Farias	43799287	2001-11-27	14	\N	02342 425547		0	+	JERARQUICO	2124303	08005554844	Daniel Alberto Farias	Padre	02342 15412885	2016-06-23 18:40:42.05752	2016-06-23 18:40:42.05752
202	185	Partaker	Oriana	Fraccaro Mendez	43968720	2002-02-20	14	\N	02342 407262	oriana_fm@live.com.ar	0	-	IOMA	224674429/03		Alejandra Mendez	Madre	02342408176	2016-06-23 18:40:42.07	2016-06-23 18:40:42.07
203	186	Partaker	Valentina	Botta	43803409	2001-10-25	14	\N					OSPEPBA						2016-06-23 18:40:42.079967	2016-06-23 18:40:42.079967
214	197	Partaker	Micaela	Tagliaferro	41461880	1999-02-08	17	\N	02342 422786	micaelatagliaferro@gmail.com	A	+				Rosana Tagliaferro	Hermana	02342 404760	2016-06-23 19:34:32.680377	2016-06-23 19:34:32.680377
216	199	Partaker	Ignacio	Soldavilla	43669341	2001-10-14	14	\N	2342 405642	ignacio_soldavilla_01@hotmail.com	0	+	SAMI	00178700/0	02342 425201	Hugo Soldavilla	Padre	02342 405014	2016-06-23 19:34:32.711561	2016-06-23 19:34:32.711561
222	205	Partaker	Agustina	Sequeira	41999747	2000-08-23	15	\N	234615410388		0	+	IOMA	2258213779/02	2346471239	Nora Analía Tiadini	Madre	234615410390	2016-06-23 20:01:36.947976	2016-06-23 20:01:36.947976
223	206	Partaker	Itati	Guidozzolo	41999799	0001-01-09	15	\N	2346543364	itaguidozzolo@gmail.com	0	+	IOMA	A17721937103		Julio Guidozzolo	Padre	2346556936	2016-06-23 20:01:36.965205	2016-06-23 20:01:36.965205
224	207	Partaker	Justina	Bardengo	41999742	\N	15	\N	234615554005	justinabardengo@gmail.com	A	+	OSDE	31 725237 7 03	08108887788	Fernando Bardengo		234615566341	2016-06-23 20:01:36.978854	2016-06-23 20:01:36.978854
225	208	Partaker	María del Rosario	Ponce Zunino	42820361	\N	15	\N	15459507	rosariozunino89@gmail.com			IOMA	2168071113/03			Madre	15459507	2016-06-23 20:01:36.992446	2016-06-23 20:01:36.992446
226	209	Partaker	Sofía	Bergamini	41999796	\N	15	\N	2346569599	sofi-b-00@hotmail.com	A	+	OSDE	6113634874	08108887788	María del Cármen Chicapalma	Madre	2346416250	2016-06-23 20:01:37.004428	2016-06-23 20:01:37.004428
227	210	Partaker	Juan Cruz	Elliff	43030610	\N	15	\N	234615681884	elliffjuan3@gmail.com	B	+	Swiss Medical	8000060953789031019	08007777800	Maria Laura Defelipe	Madre	234615681884	2016-06-23 20:01:37.016341	2016-06-23 20:01:37.016341
228	211	Partaker	Santiago	De Pietro	41999777	\N	15	\N	2346472189	santiagodepietro@hotmail.com	A	+	IOMA	2180846814-02		Sandra Bancora	Madre	234615503251	2016-06-23 20:01:37.0302	2016-06-23 20:01:37.0302
193	176	Partaker	Milagros	Saez	42135049	2000-01-04	16	\N	2342 484897	miluchiis_styles@hotmail.com			IOMA	B180859535/02		Noelia Rumi	Madre	426822	2016-06-23 18:23:40.108889	2016-08-19 21:06:25.988913
215	198	Partaker	Milagros Ayelen 	Pellgrino	41461878	1999-01-22	17	\N	2342 410644		A	-	La pequeña Familia	200631002	2342 410644	Carolina Soledad Bertazzo	Madre	2342 410644	2016-06-23 19:34:32.692777	2016-08-19 21:19:50.474304
204	187	Partaker	Valentina	Toscano	42568885	2000-07-20	15	\N	426172	toscanovalentina1@gmail.com	0	+	IOMA	2201432657/03		Sandra Bazán	Madre	234215451058	2016-06-23 19:03:55.703373	2016-06-23 19:03:55.703373
205	188	Partaker	Milagros	Cause	43256336	0001-02-14	15	\N	2342530823	causemilagros@gmail.com	0	+	OSECAC	43256336		María José Teijeiro	Madre	2342407652	2016-06-23 19:03:55.713073	2016-06-23 19:03:55.713073
206	189	Partaker	Alejo Ezequiel	Naro	42963338	\N	15	\N	234215412873		A	+	OSDE	61 851160 0 03		María Cecilia Carrera	Madre	234215452941	2016-06-23 19:03:55.723297	2016-06-23 19:03:55.723297
207	190	Partaker	Rocío Mailen	Berzoni	42963317	\N	15	\N	15445075	roo-berzoni@hotmail.com	A	-	OSECAC	42963317			Madre	15445075	2016-06-23 19:03:55.734976	2016-06-23 19:03:55.734976
208	191	Partaker	Juliana Liliana	Contartese	43109638	\N	15	\N	2342430405		0	+	IOMA	2136014009/03		Luz Mendez	Madre	234215410510	2016-06-23 19:03:55.744184	2016-06-23 19:03:55.744184
232	215	Partaker	Gonzalo Agustín	Candela	42135092	0099-12-22	16	\N	2342485152	gonzaygiane@hotmail.com.ar			OSECAC	42135092	2342423439		Madre	2342485152	2016-06-25 14:39:22.373498	2016-06-25 14:39:22.373498
233	216	Partaker	Enzo Agustín	Coppolva	42135173	\N	16	\N	2342483159		AB	+	IOMA	J146006552/03	2342446515		Madre	2342483159	2016-06-25 14:39:22.380122	2016-06-25 14:39:22.380122
234	217	Partaker	María 	Razzari	43803443	2002-01-22	14	\N	2342430477	maruca.100@hotmail.com	0	+	IOMA	9716579415/04		Claudia González	Madre	2342509700	2016-06-25 15:00:35.883213	2016-06-25 15:00:35.883213
235	218	Partaker	Mauricio	Icardi	43094306	\N	15	\N	2342422443	mauricioicardi25@gmail.com	0	+	PAMI	150294772002		Sergio Icardi	Padre	2342449243	2016-06-25 15:00:35.894112	2016-06-25 15:00:35.894112
236	219	Partaker	Valentina	Vives	42963374	\N	15	\N	2342508309	valentinavivess@gmail.com	A	+	OSDE	35213490004		Mariana Chacon	Madre	2342456113	2016-06-25 15:00:35.907046	2016-06-25 15:00:35.907046
237	220	Partaker	Amparo	Argonz	43094375	0001-01-09	15	\N	2342468796	amparoargonzz@gmail.com			La Pequeña Familia	7633/02	2364443440	Carina Biondini 	Madre	2342468796	2016-06-25 15:00:35.921249	2016-06-25 15:00:35.921249
238	221	Partaker	Gonzalo	Decibe	42952657	\N	15	\N	2342422791	gonza7decibe@gmail.com	A	+	OSDE	19212128003		Morelli M. Laura	Madre	2342453979	2016-06-25 15:00:35.938546	2016-06-25 15:00:35.938546
239	222	Partaker	Raúl Carlos	Mendizabal	42933172	2000-10-07	15	\N	2342406295	andre_devi@hotmail.com	B	+	OSDE	35207913503		De Villa M. Andrea	Madre	2342406295	2016-06-25 15:20:07.336843	2016-06-25 15:20:07.336843
240	223	Partaker	Valentina	Bracco	43045462	\N	15	\N	2342433072	valen-bracco@hotmail.com	B	+	Federada Salud	4978203	03414208800	Marta Ascuaga	Madre	2342480498	2016-06-25 15:20:07.395854	2016-06-25 15:20:07.395854
241	224	Partaker	Candela 	García	42568889	\N	15	\N	2342431597		0	+	OSECAC			Gomez M. Verónica	Madre	2342504308	2016-06-25 15:20:07.421727	2016-06-25 15:20:07.421727
242	225	Partaker	Genaro	Minetto	42963388	1999-11-22	16	\N		genarominetto@hotmail.com						Javier Minetto	Padre	2342402631	2016-06-25 15:35:48.942811	2016-06-25 15:35:48.942811
243	226	Partaker	Juan Cruz	Posadas Morales	42058086	0099-11-16	16	\N	2342426191		A	+	IOMA	A100948962/04		Marta Morales De Posadas	Madre	2342414088	2016-06-25 15:35:48.950342	2016-06-25 15:35:48.950342
244	227	Partaker	Damian Nicolás	Riva	42568736	\N	16	\N	2342499353	damianriva@live.com.ar	0	+	OSSAMI	83500/2					2016-06-25 15:35:48.959404	2016-06-25 15:35:48.959404
245	228	Partaker				\N	\N	\N											2016-06-25 15:35:48.968735	2016-06-25 15:35:48.968735
246	229	Partaker	Valentina Jazmín	Iannino	41293646	0098-09-24	17	\N	2342412834	valentinainannino1221@hotmail.com						Paola Paez	Madre	2342515171	2016-06-25 15:41:20.549352	2016-06-25 15:41:20.549352
247	230	Partaker	Sofía Ailen	Poeta	42135200	2000-04-03	16	\N	2342481189	sofipoeta-13@hotmail.com									2016-06-28 18:32:44.874004	2016-06-28 18:32:44.874004
249	232	Partaker	Brenda 	Beccaglia	43799210	0001-11-05	14	\N	2342451646	brenda_beccaglia@hotmail.com	A	+	OSSAMI	20001372/02		Elina Cassani	Madre	2342414570	2016-06-28 18:32:44.903059	2016-06-28 18:32:44.903059
250	233	Partaker	Lourdes 	Ciotti	42057944	0099-08-09	16	\N	2342480795	lciotti99@gmail.com	A	+	AMEBPBA	3157944		Mariana Borsani	Madre	2342458546	2016-06-28 18:32:44.916667	2016-06-28 18:32:44.916667
251	234	Partaker	Lisandro José	León	42057922	0099-07-26	16	\N	2342480594	lisandrojoseleon@gmail.com	0	+	IOMA	224423640903		Palmares María Fernanda	Madre	2342480594	2016-06-28 18:32:44.927015	2016-06-28 18:32:44.927015
252	235	Partaker	Lucas 	Moraglio	42057956	1999-06-21	17	\N	2342451565	lucas24@live.com.ar						Juan Franco Moraglio	Padre		2016-06-28 18:41:49.91924	2016-06-28 18:41:49.91924
253	236	Partaker	Joaquin	De Rissio	41823866	0099-04-09	17	\N	2342484429	joaquin_derissio@hotmail.com	A	+	OSDE	00959734-4-3	08106661111	Domine Ana Cecilia	Madre	2342444829	2016-06-28 18:41:49.938734	2016-06-28 18:41:49.938734
254	237	Partaker	Josefina 	Corigliano	41461727	0098-11-12	17	\N	2342512976	jopecorigliano@hotmail.com			IOMA	223373243500	2342422390	Lorena Figueron	Madre	2342445525	2016-06-28 18:45:29.808894	2016-06-28 18:45:29.808894
255	238	Partaker	Martina	Lopumo	42839152	2000-09-15	15	\N	2342430724	marti.lopumo-23@hotmail.com	A	+	OSDE	35202770-4-05	08105556733	Griselda Monía	Madre	2342405706	2016-06-28 19:03:32.0776	2016-06-28 19:03:32.0776
256	239	Partaker	Josefina	Arbeletche		0001-06-02	15	\N	2342427067		0	+	IOMA	21603015/04		Andrea Perez	Madre	2342427062	2016-06-28 19:03:32.08989	2016-06-28 19:03:32.08989
257	240	Partaker	Bautista Matias	Mendizabal	43173722	0001-03-16	15	\N	2342430261	lauruizdiaz@yahoo.com.ar	A	-	OSDE	35215335104		Laura Ruiz Diaz	Madre	2342409092	2016-06-28 19:03:32.1009	2016-06-28 19:03:32.1009
258	241	Partaker	Julieta	Decibe	42963371	\N	15	\N	2342508245	julietadecibe@gmail.com	A	+	IOMA	218085735503		Maria Fernanda Pisano	Madre	2342544148	2016-06-28 19:03:32.111121	2016-06-28 19:03:32.111121
259	242	Partaker	Francisco	Pergolezi	42963321	\N	15	\N	2342545265				OSECAC				Madre	2342458631	2016-06-28 19:03:32.121465	2016-06-28 19:03:32.121465
260	243	Partaker	Lorenzo	Grizutti	41740232	0099-03-11	17	\N	2342423534	loolo.grizutti@hotmail.com	B	-	IOMA	2214448896/03	2342408304		Madre	2342531647	2016-06-28 19:09:51.750017	2016-06-28 19:09:51.750017
261	244	Partaker	Celina 	Pildain	42058037	0099-10-20	16	\N	2342545199	celina_pildain@hotmail.com	0	+	IOMA	21452169680/03		Monica Garcia	Madre	2342510745	2016-06-28 19:13:54.140957	2016-06-28 19:13:54.140957
262	245	Partaker	Franco	Saldaña Nigro	41293684	1998-10-15	17	\N	2342426154	francosaldana45@gmail.com			OSSAMI	20000114/0	2342430268	Graciela Elsa Nigro	Madre	2342436154	2016-06-28 19:27:12.986871	2016-06-28 19:27:12.986871
263	246	Partaker	Geraldine	Alegre	40454457	0097-07-12	18	\N	2342412251							Sierra Claudia	Madre	2342570674	2016-06-28 19:27:12.994045	2016-06-28 19:27:12.994045
264	247	Partaker	Rocio Abigail	Rodriguez	41740282	0099-03-31	17	\N	2342510907	rochi_bailarina@hotmail.es	A	+	OSDE	62152885-3-04		Del Rio Maria Rosa 	Madre	2342468695	2016-06-28 19:27:13.000615	2016-06-28 19:27:13.000615
265	248	Partaker				\N	\N	\N											2016-06-28 19:27:13.008494	2016-06-28 19:27:13.008494
268	251	Partaker	Lucia	Pedrosa	42491533	\N	16	\N	2342509706	lucitapedrosa@hotmail.com	0	+	ASIMRA			Silvia Graziano	Madre	2342400700	2016-06-28 19:38:50.633639	2016-06-28 19:38:50.633639
231	214	Partaker	Pedro	Starna	43094382	0003-02-01	15	\N	234225472084	pedrostarna@hotmail.com	AB	-	OSDE	352110636602	433082	Clarisa Bielsa	Madre	2342449815	2016-06-25 14:39:22.367478	2016-08-26 22:35:13.406111
230	213	Partaker	Victoria	Alietti	42963377	2000-11-11	15	\N	2342408672	vickyalietti@hotmail.com	0	+	IOMA	216579320503		Domantueno Zulema Luján	Madre	2342408672	2016-06-25 14:39:22.360605	2016-08-26 22:41:45.233872
229	212	Partaker	Camila 	Soldá	42963368	\N	15	\N	2342406123	camisolda@hotmail.com	0	-	IOMA	2210091753/05	430001	Marcela Helfer	Madre	2342459828	2016-06-25 14:39:22.351674	2016-08-26 22:49:02.050846
266	249	Partaker	Martin	Duhalde	41293617	0098-08-18	17	\N	2342516266	martibduhalde7@gmail.com	A	+	OSDE	35213492605	08108887788	Climente Estela	Madre	2342465986	2016-06-28 19:33:39.79962	2016-06-28 19:33:39.79962
269	252	Partaker	Alan Yoel	Montiel	41740220	1998-12-27	17	\N	2342404038	alan7argentino@hotmail.com	A	+				Maldonado Vanesa Anai	Madre	2342509328	2016-06-28 19:49:48.625788	2016-06-28 19:49:48.625788
270	253	Partaker	Milagros Itatí	Cid	41891195	0099-07-16	16	\N	2342431536	milagros_40_87@hotmail.com	B	+	OSFATLIF	16-16492-3/03		Bonzas Sandra Evangelina	Madre	2342431536	2016-06-28 19:49:48.63505	2016-06-28 19:49:48.63505
271	254	Partaker	Martin	Perez	43094310	\N	15	\N	2346602743	tinchoperez2008@hotmail.com	0	-	IOMA	2207122640/04		Verónica Tucci	Madre	2342465498	2016-06-28 19:49:48.643896	2016-06-28 19:49:48.643896
267	250	Partaker	Mateo	Barros Conde	41558984	0098-09-16	17	\N	2342548117	mateobarrosconde@hotmail.com	A	+	OSDE	61702419604	08108887788	Cecilia Papavero	Madre	111562003894	2016-06-28 19:36:52.613553	2016-06-28 19:36:52.613553
272	255	Partaker	Bettina	Alessandrini	41891139	0099-06-02	17	\N	2346509664	bettialessan_8_02@hotmail.com	A	+	IOMA	A175235648/03			Madre	2342402511	2016-06-28 20:18:35.389328	2016-06-28 20:18:35.389328
273	256	Partaker	Valentin	Laborde	41857375	1999-05-05	17	\N	2342466821	vale.racing@hotmail.com	A	+	Swiss Medical	8000060174944		Ortiz Maria Cecilia	Madre	234215510033	2016-06-29 20:35:04.978293	2016-06-29 20:35:04.978293
274	257	Partaker	Franco Valentino	Rodriguez	41740201	0099-02-19	17	\N	234615587324	franrodriguez_12_@outlook.com	B	+	IOMA	224947263702		Paola Gunilla	Madre	234215484850	2016-06-29 20:35:05.007299	2016-06-29 20:35:05.007299
275	258	Partaker	Tomás Francisco	Bevacqua	41857381	0099-04-21	17	\N	2342481024	alessandrook@live.com	B	+	IOMA	221573901004		Nesse Ines Alicia	Abuela	2342531193	2016-06-29 20:35:05.039406	2016-06-29 20:35:05.039406
276	259	Partaker	Tomas Agustin	Prado	42568857	2000-07-03	15	\N	430530		0	+	IOMA	9528234680/02		Melina Isabel Jauregui Lorda	Abuela	234215555964	2016-06-29 20:43:01.888659	2016-06-29 20:43:01.888659
277	260	Partaker	Jeremias Isaac 	Lazareff	42952329	\N	15	\N	234215413191		B	+	Swiss Medical	800006-0375757		Ana Paula Menendez	Madre	234215413191	2016-06-29 20:43:01.924912	2016-06-29 20:43:01.924912
279	262	Partaker	Juliana	Yañez	42058015	1999-10-04	16	\N	02342508927	juliana_labrujita@hotmail.com	B	+	OSDE	35200534404		Juan Carlos Yañez	Padre	2342403736	2016-06-30 17:32:50.295866	2016-06-30 17:32:50.295866
280	263	Partaker	Lucas Tomas	Insua	41461774	1998-11-24	17	\N	2342471678	lucas_insua@hotmail.com	0	+	OSECAC	41461774		Viviana Marisa Mendez	Madre	2342509607	2016-06-30 17:38:09.008531	2016-06-30 17:38:09.008531
281	264	Partaker	Luna Bianca	Brumer	41834586	1999-04-23	17	\N	02342424577	luunalopez@hotmail.com	0	+	DAS	36694/20		Maia Lopez	Madre	02342407497	2016-06-30 17:41:14.026375	2016-06-30 17:41:14.026375
282	265	Partaker	Florencia	Pujol	40454423	1997-07-08	18	\N	0234215461252	fpujolt@gmail.com			PAMI	086902	02342425701	Pujol Gustavo	Padre	0234615558606	2016-06-30 18:04:10.964797	2016-06-30 18:04:10.964797
283	266	Partaker	Sofia	Scuticchio Orlandini	42135013	1999-04-05	17	\N	02342 505069	sofiso@hotmail.com	0	-	CASA DE ABOGADOS	18549352	2342405291	Sabina Suarez	Madre	02342405291	2016-06-30 18:07:45.260931	2016-06-30 18:07:45.260931
284	267	Partaker	Valentino	Milocco	42149924	1999-09-11	16	\N	2342423620	valenmilocco@gmail.com	0	+	OSDE	62183459803	02342 423620	Adalberto Milocco	Padre	02342 404062	2016-06-30 18:27:16.491069	2016-06-30 18:27:16.491069
285	268	Partaker	Juan Francisco	Garruba	42058044	1999-10-31	16	\N	02342 421230	franciscogarrubba@gmail.com	0	+	IOMA	218604689003		Braile Juana	Madre	0234215508129	2016-06-30 18:27:16.502132	2016-06-30 18:27:16.502132
286	269	Partaker	Juan Manuel	Anso	42135047	1999-01-08	16	\N	02342427772	juannanso@live.com	0	-	OSDE	35207654303		Porte Daniela	Madre	2342 505932	2016-06-30 18:27:16.511333	2016-06-30 18:27:16.511333
287	270	Partaker	Jeremias	Arribalzaga	42660372	2000-05-30	16	\N	02342 423007	jerefutbol@gmail.com	A	+	SWISS MEDICAL	800006 03007950310499	02342 15513766	Ivana Alarcon	Madre	02342 15409746	2016-06-30 18:27:16.521319	2016-06-30 18:27:16.521319
288	271	Partaker	Genaro	Cavenaghi	42014489	1999-07-07	16	\N	02342 485052	genaro1999@hotmail.com	A	+	SAMI			Bernardo Cavenaghi	Padre	02342 485033	2016-06-30 18:27:16.531627	2016-06-30 18:27:16.531627
290	273	Partaker	Carolina	Echeto	43463092	2001-07-31	14	\N	02342 15481856	carolinaecheto@hotmail.com	0	+	SANIDAO	2720377044303	2342 15406261	Maria Elena Tessoro	Madre	2342 15406261	2016-06-30 18:45:47.96851	2016-06-30 18:45:47.96851
291	274	Partaker	Tomas	Celerier	42658548	2000-06-13	15	\N	02342 15510050	tomascelerier@hotmail.com	A	+	SWISS MEDICAL	800006 034902705		Bracco Ana Laura	Madre	02342 15499960	2016-06-30 18:45:47.978551	2016-06-30 18:45:47.978551
292	275	Partaker	Julian	Aristi	42135065	2000-01-14	16	\N	02342 15413910	julianaristiboca@hotmail.com	0	+	IOMA	2175235216/02	2342 572678	Font Liliana	Madre	2342 572678	2016-06-30 18:45:47.987538	2016-06-30 18:45:47.987538
293	276	Partaker	Joaquin 	Vives	42135023	1999-12-08	16	\N	2342 480388	joaquinvives19@hotmail.com	0	+	OSDE	35217184803	08108887788	Cesario Martin Vives	Padre	2342466171	2016-06-30 18:45:47.996673	2016-06-30 18:45:47.996673
294	277	Partaker	Rodrigo Alejandro	Mansfield	43399135	2001-04-12	15	\N	02342 426079		A	+	OSECAC	43399135	02342 15406248	Maria Celeste Martinez	Madre	02342 15406248	2016-06-30 18:58:01.576881	2016-06-30 18:58:01.576881
295	278	Partaker	Belen	Bondoni	42057480	1999-09-19	16	\N	02342 514426	bondonibelen@gmail.com	0	+				Marisol Saias	Madre	2342 414563	2016-06-30 18:58:01.589351	2016-06-30 18:58:01.589351
296	279	Partaker	Lourdes	Fernandez	41461758	1998-11-30	17	\N	02342 427464							Pittaluga Nancy	Madre	02342 516937	2016-06-30 18:58:01.599711	2016-06-30 18:58:01.599711
297	280	Partaker	Facundo	Rios	42135012	1999-12-13	16	\N	02342 15410389	faqrios@gmail.com	A	+	IOMA	982259984403	2342 15410389	Lozzia Silvana	Madre	2342 15410389	2016-06-30 19:16:41.835511	2016-06-30 19:16:41.835511
298	281	Partaker	Juan Mateo 	Moragas	42058018	1999-10-14	16	\N	2342 426418	mateo_moragas_100@hotmai.com	0	+				Teruya Andrea	Madre	2342 413202	2016-06-30 19:16:41.852225	2016-06-30 19:16:41.852225
299	282	Partaker	Axel Leonel	Mendez Molina	42568776	2000-05-15	16	\N	02342 426835	aleonelmendez@gmail.com	0	+	TV SALUD	43359/02		Marcelo Fabian Mendez	Padre	02342 15405174	2016-06-30 19:16:41.862348	2016-06-30 19:16:41.862348
147	131	Partaker	Sofía 	García	42631529	0001-02-03	15	\N	234215532775	sofi_09irala@hotmail.com	0	+	IOMA	9816579240/08	234215	Patricia Susana Lazaro	Madre	234215532775	2016-06-22 18:44:07.013519	2016-06-30 19:42:29.186639
300	283	Partaker	Lorenzo	Diaz Videla	41891177	\N	16	\N	02342 499464	lorenzodiazvidela@gmail.com	B	+				Fernanda Martelli	Madre	2342 471184	2016-06-30 19:44:37.527069	2016-06-30 19:44:37.527069
302	285	Partaker	Valentino Leonardo	Lorenzo	41576615	1999-03-24	17	\N	2342531350	lorenzovcai@gmail.com	A	+				Lorenzo Gabriel	Padre	2342454040	2016-06-30 21:07:07.103894	2016-06-30 21:07:07.103894
303	286	Partaker	Francisco	Maccario Mitchel	41173200	0001-03-15	15	\N	2342485992	mariayanina@live.com.ar	0	+	IOMA	2246526281/02	2342427295	Juan Ignacio Maccario	Padre	234215465395	2016-06-30 21:07:07.111531	2016-06-30 21:07:07.111531
304	287	Partaker	Agustin Alejandro	Bergonce	42963327	\N	15	\N	2342481737	agusbergonce10@hotmail.com	A	+	OSECAC			Sergio Bergonce	Padre	234215401737	2016-06-30 21:07:07.11821	2016-06-30 21:07:07.11821
305	288	Partaker	Alejandro	Naruair Pomes	42839196	\N	15	\N	2342423663	alenaruairz24@hotmail.com	A	+	OSDE	61018129604		Norma Pomes	Madre	234215485655	2016-06-30 21:07:07.124658	2016-06-30 21:07:07.124658
306	289	Partaker	Alex Facundo Nicolás	Islas	41857364	0099-04-29	17	\N	234215468821				IOMA	1262220775/02		Marina Lorena Aragones	Madre	234215507723	2016-06-30 21:07:07.131342	2016-06-30 21:07:07.131342
307	290	Partaker	Jean Carlos	Martinez Molina	94872188	0098-01-02	18	\N	234215518334	jeancmolina@outlook.com	A	+	IOMA	2949721800/2		Sandra Molina Torres	Madre	234215486627	2016-06-30 21:11:43.311659	2016-06-30 21:11:43.311659
309	292	Partaker	María Sofía 	Álvarez	41740300	0099-04-16	17	\N	2342531431				OSSIMRA	02680-1		Sandra Malvigne	Madre	2342531431	2016-06-30 21:32:48.988225	2016-06-30 21:32:48.988225
301	284	Partaker	Anarella	Lancelotte	43799282	2001-03-30	15	\N	2342 515471	Analancelotte@gmail.com			IOMA				Padre	2342 511996	2016-06-30 20:44:22.923535	2016-08-19 17:38:55.958618
289	272	Partaker	Damian Nicolas	Riva	42568736	2000-04-24	16	\N	2342 499353	damianriva@live.com.ar	0	+	OSAMI	83500/2					2016-06-30 18:45:47.958899	2016-08-19 21:56:02.206219
310	293	Partaker	Carla Belén	Baiocco	41891128	1999-06-11	17	\N	234215514510	carbaiocco@gmail.com	0	+	IOMA	117523821606		Stella Maris Veliz	Madre	234215447863	2016-06-30 21:50:35.207671	2016-06-30 21:50:35.207671
311	294	Partaker	Milena Magali	Fernandez	41891200	0099-07-10	16	\N	2342516655		0	+	Carnet del hospital			Nancy Echeto	Madre	2342466159	2016-06-30 21:50:35.214071	2016-06-30 21:50:35.214071
312	295	Partaker	Cinthia Roxana	Seregüere	42963324	\N	16	\N	2342495169		0	+	PAMI	150707398064/03		Maria Esther Arrieta	Madre	2342495169	2016-06-30 21:50:35.219937	2016-06-30 21:50:35.219937
313	296	Partaker				\N	\N	\N											2016-06-30 21:50:35.228124	2016-06-30 21:50:35.228124
314	297	Partaker	Martina	Calandro	42997746	2001-04-13	15	\N	2342402726		B	+	SAMI	2000/501/2		Irrazabal Carlos Alberto	Abuelo		2016-06-30 22:26:29.449914	2016-06-30 22:26:29.449914
316	299	Partaker	Guadalupe	Goncalvez Cagliani	43399155	0001-05-08	15	\N	2342421115	guadi8@hotmail.com	0	+	OSECAC	43399155		Claudia Cagliani	Madre	234215455673	2016-06-30 22:26:29.465763	2016-06-30 22:26:29.465763
317	300	Partaker	Santiago	Suarez Arribalzaga	43399174	0001-05-02	15	\N	234215463000	liaarribalzaga@hotmail.com	A	+	IOMA	2226300872-02		Arribalzaga Oscar	Abuelo	2342430711	2016-06-30 22:26:29.471792	2016-06-30 22:26:29.471792
318	301	Partaker	Maria Belen	Mendez	42963312	\N	15	\N	2342430773	belen56@live.com.ar	A	+	IOMA				Madre	2342468470	2016-06-30 22:26:29.477792	2016-06-30 22:26:29.477792
319	302	Partaker	Maria Trinidad	Garcia	43399184	0001-05-20	15	\N	2342425677	trini200110@hotmail.com	A	+	OSAMI	20001237-03		Ursula Podstawa	Madre	2342453457	2016-06-30 22:26:29.483827	2016-06-30 22:26:29.483827
320	303	Partaker	Catalina	Catuti	43094368	0001-02-04	15	\N	234215483251	catalinacatuti93@gmail.com	0	+	IOMA	216301094800		Molina Viviana	Madre	2342483251	2016-06-30 22:26:29.490111	2016-06-30 22:26:29.490111
321	304	Partaker	Luciano Manuel	Fernandez	41740261	0099-03-17	17	\N	2342424261	loleman4@hotmail.com	A	+	OSECAC	20160433907	2342423439	Ana Maria Muruaga	Madre	2342403438	2016-06-30 22:29:53.974457	2016-06-30 22:29:53.974457
324	307	Partaker	Renata	Genovese	42648055	2000-06-15	16	\N	011 1536205583	renigen152000@gmail.com	A	+	UPCN	00776496040		Maria Teresa Fernandez	Madre	02342 15485542	2016-07-08 12:38:34.515712	2016-07-08 12:38:34.515712
325	308	Partaker	Maria Milagros	Castaño Exposito	42057955	1999-09-08	16	\N	02342548785	mmilagros1999@gmail.com	B	+	IOMA	2233732628/02		Ana Delia Exposito	Madre	02342463712	2016-08-13 05:11:07.322561	2016-08-13 05:11:07.322561
326	309	Partaker	Laureano Agustin	Cid	40454454	1997-07-24	18	\N	431536	Agus_yo_sanlo@hotmail.com	B	+	OSFATLYF	1616492-3/02		Guillermo Javier Cid	Padre	2342 466244	2016-08-13 05:14:53.307107	2016-08-13 05:14:53.307107
327	310	Partaker	Ina	Quintana	41646047	1999-01-06	17	\N	2342480067	inaquintanalaborde@gmail.com	0	+	IOMA	2178642671/03	2342958282		Abuela	2342402513	2016-08-13 05:17:48.100612	2016-08-13 05:17:48.100612
329	312	Partaker	Guillermo Gaspar	Acuña	43732118	2001-10-16	14	\N	234215516671				IOMA	2277765413/00		Guillermo Acuña	Padre	15516671	2016-08-13 05:30:50.663138	2016-08-13 05:30:50.663138
330	313	Partaker	Emanuel Alejandro	Martinez	43799277	2001-12-10	14	\N	02342422343		A	-	IOMA	2207514250/05		Silvia Cid	Madre	234215483715	2016-08-13 05:30:50.669302	2016-08-13 05:30:50.669302
331	314	Partaker	Lucas Adrian 	Rodriguez	43463049	2001-07-12	14	\N	234215468695	rochi_bailarina@hotmail.es	A	+	OSDE	62152885303		Del Rio Maria Rosa	Madre	2342 15468695	2016-08-13 05:30:50.675463	2016-08-13 05:30:50.675463
332	315	Partaker	Magali Belen	Petetta	42057970	1999-09-08	16	\N	2342451036	Maga_188@hotmail.com	0	-					Madre	2227 623037	2016-08-13 05:46:33.366421	2016-08-13 05:46:33.366421
333	316	Partaker	Juan	Calle	42135003	1999-12-09	16	\N	02342 423595	juancalle_13@live.com	A	+	PAMI			Alba Iris Peracca	Tia	2342 15481107	2016-08-13 05:46:33.373005	2016-08-13 05:46:33.373005
334	317	Partaker	Jorgelina Lujan	Roldan	43968781	2001-10-21	14	\N	0234215409802							Roldan Miriam	Madre	02342 409802	2016-08-13 05:46:33.378814	2016-08-13 05:46:33.378814
335	318	Partaker	Diana Alanis	Matarozzi	43399186	2001-05-27	15	\N	02342 15514450	DianeeTequiere@gmail.com	A	+	IOMA	1268531448/02		Del Rio Cintia	Madre	2342 15480369	2016-08-13 05:46:33.384575	2016-08-13 05:46:33.384575
336	319	Partaker	Diego Gabriel 	Duva	45040553	2003-06-13	13	\N	02342 15460427				OSECAC	45040553			Madre	2342 15460427	2016-08-13 05:46:33.390664	2016-08-13 05:46:33.390664
337	320	Partaker	Agustin	Bello	44112001	2002-04-18	14	\N	2342 402994		0	-	IOMA	2165793461/02		Claudia Eliana Sbergamo	Madre	2342 402994	2016-08-13 05:58:17.194846	2016-08-13 05:58:17.194846
338	321	Partaker	Daniel Ezequiel	Romero	41857396	1998-04-02	18	\N	2342 15465117		0	+							2016-08-13 05:58:17.201795	2016-08-13 05:58:17.201795
339	322	Partaker	Leonardo David	Rodriguez	41745069	1998-12-03	17	\N		Leonardorodriguez@hotmail.com	A	+				Regina Rodriguez	Madre	2342 556049	2016-08-13 05:58:17.208251	2016-08-13 05:58:17.208251
340	323	Partaker	Agustin	Leunda	43669352	2001-10-10	14	\N	2342 532590	alejandranoemi90@hotmail.com	0	+	IOMA	2165794749/02		Alejandra Iglesias	Madre	2342 532590	2016-08-13 05:58:17.21452	2016-08-13 05:58:17.21452
341	324	Partaker	Facundo Andres	Cortes Doffo	42135069	2000-02-02	16	\N	02342 15414485		A	+	IOMA	1170130227/03		Cortes Pablo	Padre	02342 15507607	2016-08-13 05:58:17.220717	2016-08-13 05:58:17.220717
342	325	Partaker	Bianca Guadalupe	Grande	42054147	1999-09-01	16	\N	02352 404599	geg3970@hotmail.com	AB	-	IOMA	A21715569902		German Grande	Padre	02352 404599	2016-08-13 06:09:36.651291	2016-08-13 06:09:36.651291
343	326	Partaker	Rodrigo Raul	Garcia	41922782	1999-09-09	16	\N	02352 15480607							Evangelina Laghi	Madre	02352 480607	2016-08-13 06:09:36.660029	2016-08-13 06:09:36.660029
344	327	Partaker	Milena Elisabet	Gonzalez		2000-03-05	16	\N	02352 493025		B	+	IOMA	121959601004					2016-08-13 06:09:36.66938	2016-08-13 06:09:36.66938
345	328	Partaker	Ian Ezequiel	Zapacosta	43871835	2002-01-19	14	\N	02342 15461642	zapacostagastonoyo@hoo.com.ar			Prevencion Salud	5433002017		Gaston	Padre	02342 15461642	2016-08-13 06:21:11.801541	2016-08-13 06:21:11.801541
346	329	Partaker	Simon 	Palacios	43799231	2001-10-24	14	\N	02342 15512012		0	-	OSECAC	43799231		Martina Gerardi	Madre	02342 15465194	2016-08-13 06:21:11.811189	2016-08-13 06:21:11.811189
347	330	Partaker	Joaquin	Aragones	43669359	2001-09-26	14	\N	02342 427990	Nt6626@hotmail.com	0	+	OSECCAC				Madre	2342 427990	2016-08-13 06:21:11.819936	2016-08-13 06:21:11.819936
348	331	Partaker				\N	\N	\N											2016-08-13 06:21:11.829458	2016-08-13 06:21:11.829458
349	332	Partaker	Daniela Jazmin	Barcus	43968777	2002-03-18	14	\N	02342 425813	Dvbbragado@hotmail.com	0	+					Madre	02342 15532049	2016-08-13 06:29:43.405855	2016-08-13 06:29:43.405855
350	333	Partaker	Cihntia Magali	Buzzada	42568900	2000-08-09	15	\N	02342 427530	Cin.buzzada.16@gmail.com	AB	+	OSSIMRA	00001192542012		Alejandra Brito	Madre	02342 530140	2016-08-13 06:29:43.411711	2016-08-13 06:29:43.411711
351	334	Partaker	Lucia	Aristi Signorio	43799236	2001-11-19	14	\N	02342 422696	Lu-aristi.10@gmail.com	0	+	IOMA	B180859535/02		Signorio Alicia Teresita	Madre	02342 15405562	2016-08-13 06:29:43.417474	2016-08-13 06:29:43.417474
278	261	Partaker	Brenda	Morel	43803426	\N	14	\N	2342426255				IOMA	221716714/02		Soledad Fernandez	Madre	2342402502	2016-06-29 20:43:01.947203	2016-08-13 06:36:31.178861
352	335	Partaker	Juan Martin	Hernandez	41461853	1999-01-02	17	\N	23423201		A	+	IOMA			María Luz Albizu	Madre	2342423201	2016-08-13 06:36:31.184694	2016-08-26 22:58:36.65559
353	336	Partaker	Augusto Franco Bernardo	Caputo Ortega	43256383	2000-05-11	16	\N	02342 421311	Augustocortega@outlook.com	AB	+	PAMI	150833155605/40		Caputo Roque Bautista	Abuelo	02342 421311	2016-08-13 06:40:40.276805	2016-08-13 06:40:40.276805
355	338	Partaker	Lucila	Roldan	42135197	2000-04-10	16	\N	02342 15499207	Lupy_roldan@hotmail.com	B	+	IOMA	9816619908/04	02342 15401884	Roldan Fabio	Padre	02342 15516530	2016-08-13 06:46:05.231444	2016-08-13 06:46:05.231444
354	337	Partaker	Dolores 	Menendez	42568829	2000-06-22	16	\N	02342 15507573	lolamenendezz@gmail.com	A	+	Jerarquicos Salud	38030 03	02342 4504805	Javier Menendez	Padre	15458483	2016-08-13 06:43:26.766531	2016-08-13 06:43:26.766531
356	339	Partaker	Maria Florencia	Avena	41293621	1998-08-29	17	\N	02342 453900	floravena15@hotmail.com	A	+	OSECCAC	41293621		Bruno Alicia Edith	Madre	02342 405691	2016-08-13 06:48:58.259097	2016-08-13 06:48:58.259097
357	340	Partaker	Diego Armando	Yaffaldano	42135082	\N	16	\N	2342409592	diego.y@hotmail.com.ar	0	+	OSCHOCA	82503611	2342430302	Valeria Acosta	Madre	2342545917	2016-08-13 14:52:41.954011	2016-08-13 14:52:41.954011
358	341	Partaker	Nicolas Enrique Martín	Gimenez	42135056	\N	16	\N	2342405846		0	+					Madre	2342507384	2016-08-13 14:52:41.968492	2016-08-13 14:52:41.968492
359	342	Partaker	Celeste	Nycole	44112086	0013-06-02	13	\N	2342483065	nicky.marquez.712@hotmail.com	A	+	OSUTHGRA	20165793340/05	2342483065		Madre	2342483065	2016-08-13 14:52:41.981135	2016-08-13 14:52:41.981135
360	343	Partaker	Franco Esteban	Petegoli	42568842	\N	16	\N	2342403810	francopetegoli@hotmail.com	A	+	IOMA	1160432089/03	423597		Madre	2342403810	2016-08-13 14:52:41.992182	2016-08-13 14:52:41.992182
361	344	Partaker	Martina	Yannone	44264328	0023-06-02	13	\N	2342531065	martinayannone@live.com.ar	A	+	IOMA	2309821202/02	427295	Mariana CERUTTI	Madre	2342489047	2016-08-13 14:52:42.00133	2016-08-13 14:52:42.00133
362	345	Partaker	Delfina	Boschiero	43799241	0026-11-01	14	\N	424992		A	+	IOMA	1163012880/3	424992	Cecilia Martinelli	Madre		2016-08-13 15:05:18.727174	2016-08-13 15:05:18.727174
363	346	Partaker	Rebeca 	Pereira	43463025	0002-07-01	14	\N	2342508335		A	+	Choferes de camiones	129174/2	427209	Celia Perez	Madre	2346417783	2016-08-13 15:05:18.749255	2016-08-13 15:05:18.749255
364	347	Partaker	Camila	Gutierrez	44264320	0020-06-02	13	\N	2342557281				IOMA	124652802203		Adriana Elisabet Griego	Madre	2342414542	2016-08-13 15:05:18.759908	2016-08-13 15:05:18.759908
365	348	Partaker	Francisco Ariel	Hidalgo	41293671	\N	17	\N	2346588868										2016-08-13 15:09:41.844142	2016-08-13 15:15:52.933371
366	349	Partaker	Sofia Raquel	Lopez	42839177	\N	15	\N	2342425638	sofia_capa_21@hotmail.com	0	+	IOMA	1130553848	2342413098	Monica Laconca	Madre	2342468664	2016-08-13 15:15:52.960516	2016-08-13 15:15:52.960516
369	350	Partaker	Abril Stefanía	Zanassi	43179798	2001-07-14	15	\N	4422052	abrilzanassi@hotmail.com	0	+	OSAC	203559/01		Cristina Perez	madre	3364518034	2016-08-18 00:43:44.363992	2016-08-18 00:43:44.363992
370	351	Partaker	María de los Ángeles	Ponteprino	43258736	\N	15	\N	4456573	angieponteprino01@hotmail.com	A	+	IOMA	2215257563/02	L	Luján Sánchez	Madre	336-154383960	2016-08-18 00:43:44.375619	2016-08-18 21:55:40.031792
371	352	Partaker	Rosario María	Lenci Di Giacinti	43258728	0001-07-03	15	\N	4454794	rosariolenci01@gmail.com	A	+	MEDIFÉ	3-01131618/328	08003330075	Olga Di Giacinti	Madre	154256561	2016-08-18 21:55:40.041635	2016-08-18 22:24:55.968379
372	353	Partaker	Camila	Bracco	42676335	2000-05-29	16	\N	3364435832	cami_love_97@live.com	A	+	Swiss Medical	800006 0259663	0800 777 7800	Delma Beatriz Camaño	Tía materna	3364451308	2016-08-19 01:19:05.326465	2016-08-19 01:19:05.326465
373	354	Partaker	Rocío Pilar	Andriola	42780071	\N	15	\N	336450981	met-2-08-00@hotmail.com	0	+	Mutual Asindar	9269/02	03400474837	Marcelo Andriola	Padre	3364300420	2016-08-19 01:19:05.342591	2016-08-19 01:19:05.342591
374	355	Partaker	Stéfano	Berdini	42323795	0099-12-28	16	\N	4423901	stefanoberdini@yahoo.com.ar	0	-	OSDE	33 206840 06			Madre	0336154211117	2016-08-19 01:19:05.356871	2016-08-19 01:19:05.356871
375	356	Partaker	Dante	Vanola	41567869	1999-01-11	17	\N	4430138	dantev_1000@hotmail.com	0	+	OSDE	60445687404		Alfredo Vanola	Padre	3364021061	2016-08-19 01:35:45.739288	2016-08-19 01:35:45.739288
376	357	Partaker	Julia Inés	Sidor	41312398	0098-09-22	17	\N	03364445275	juli.sidor@hotmail.com	A	+	OSAP	20947/02	03364425632	Natalia Victoria Berg	Madre	3364321884	2016-08-19 01:35:45.751485	2016-08-19 01:35:45.751485
377	358	Partaker	Sebastián	Lopez	41238057	0098-08-06	18	\N	4435106	sebastian.lopez.98@hotmail.com	A	+	OSAP		3364425632	Silvina Marques - Miguel Lopez	Madre - Padre	154574806	2016-08-19 01:35:45.763023	2016-08-19 01:35:45.763023
378	359	Partaker	Franco Andrés	De Giacomo	42531116	2000-02-24	16	\N	3364452602	francodegiacomo@gmail.com	B	+	Swiss Medical	8000060065840030011	011-43441500	Olga Nervis de Lopez	Abuela	154200455	2016-08-19 01:50:34.391846	2016-08-19 01:50:34.391846
379	360	Partaker	Mateo	Bcandalesi Weiss	42574541	\N	16	\N	3364430557	mategenio@live.com	0	+	IOMA	2145457132/02		Clínica San Nicolás	Tía	4430557	2016-08-19 01:50:34.403953	2016-08-19 01:50:34.403953
380	361	Partaker				\N	\N	\N											2016-08-19 01:50:34.416084	2016-08-19 01:50:34.416084
381	362	Partaker	Fausto	Cesaretti	42840148	2000-10-17	15	\N	3364210418	faustoc@outlook.es	0	+	OSDE	61082011603	08108887788	Ivana Miras	Madre	3364686666	2016-08-19 02:10:40.49627	2016-08-19 02:10:40.49627
382	363	Partaker	Aitana 	Perez	43313335	0001-06-12	15	\N	3364433951	aitanaperez@hotmail.com	0	-	OSDE	61285558805	08108887788	Antonio Perez	Padre	3364416214	2016-08-19 02:10:40.506087	2016-08-19 02:10:40.506087
383	364	Partaker	Agustín	Catalín Malín	42840189	\N	15	\N	3364562813	aguscatamalin@gmail.com	A	+	OSAP	019200/05			Madre	3364308004	2016-08-19 02:10:40.517353	2016-08-19 02:10:40.517353
388	368	Partaker	Amparo	Moralejo	42901612	2000-09-22	15	\N	15445252	ampimoralejo@gmail.com	A	+	OSDE	B1275482503			Padres	15512241/15522029	2016-08-19 20:23:01.15267	2016-08-19 20:23:01.15267
368	19	Professor	Silvina	Marques	18361496	0067-06-17	49	\N	0336-4435106	msps@atnet.com.ar	A	+	OSAP	37622/01		Miguel Ángel López		03364435106	2016-08-18 00:39:07.906855	2016-08-19 17:23:37.916183
367	18	Professor	Georgina María Agustina	Bangert	26512217	0078-03-02	38	\N	03364422163	georgina_bangert@yahoo.com.ar	0	+	OSDE	61209362902	03364435705	Miriam Donda	Madre	03364435008	2016-08-18 00:38:35.475993	2016-08-19 17:28:02.14452
384	20	Professor	Cecilia	Gomez Carrillo		\N	\N	\N											2016-08-19 17:31:01.646503	2016-08-19 17:31:01.646503
385	365	Partaker	Matías	Rodriguez Mera	43056522	2000-12-06	15	\N	02392-15494683		A	-	OSDE	362003295/04		Alberto Rodriguez Mera	Padre	2392-611178	2016-08-19 17:43:12.559274	2016-08-19 17:43:12.559274
386	366	Partaker	Bernarda	Bilbao	43196669	0001-03-09	15	\N	02392-15407359	bilbaober@gmail.com	0	+	OSDE	3620110203	02392430900	Viviana Savy	Madre	02392-15618596	2016-08-19 17:43:12.568809	2016-08-19 17:43:12.568809
387	367	Partaker	Santiago	Mayorga	42824561	\N	15	\N	2392433267	rocky1163@hotmail.com	A	+	OSDE	36204761604		Carlos Mayorga	Padre	2392423263	2016-08-19 17:43:12.577043	2016-08-19 17:43:12.577043
315	298	Partaker	Lucia	Comas	43094349	2001-01-05	15	\N	02342 15405875		A	-	IOMA	2147766630/03		Lizarraga Maria Lujan	Madre	02342 15405875	2016-06-30 22:26:29.457324	2016-08-19 20:06:00.183634
389	369	Partaker	Marcos	Cardini Zar	43031041	\N	15	\N	02392620947	ballestermariajo@gmail.com	0	+	Swiss Medical	80000602490560		Maria Jose Ballester	Madre	0239215620947	2016-08-19 20:23:01.164963	2016-08-19 20:23:01.164963
390	370	Partaker	Sofía	Cardini Zar	43031042	\N	15	\N	02392-620947	ballestermariajo@gmail.com	0	+	Swiss Medical	8000060249056		Maria Jose Ballester	Madre	0239215620947	2016-08-19 20:23:01.176586	2016-08-19 20:23:01.176586
391	371	Partaker	Julieta	Graziano	42135096	2000-01-31	16	\N	2342 464180	juligrazii@gmail.com		+	OSECAC	42135096	425018	Caviglia Monica	Madre	2342 465165	2016-08-19 20:33:32.81238	2016-08-19 20:33:32.81238
96	82	Partaker	Micaela	Poggi	44112077	2002-05-31	14	\N	2342 15403930			+				Poggi Carlos	Padre	2342 15407825	2016-06-21 19:53:41.204141	2016-08-19 20:37:33.985666
121	105	Partaker	Milagros Solange 	Salgado	42828245	2000-06-11	16	\N	421047		B	+							2016-06-21 21:44:55.852883	2016-08-19 20:42:23.282034
392	372	Partaker	Bernarda	Roca Espain	42342130	2000-02-10	16	\N	2392410477	berocaespain@gmail.com	A	+	IOMA	20665034/02		Magdalena Espain	Madre	239215606911	2016-08-19 20:57:26.162332	2016-08-19 20:57:26.162332
393	373	Partaker	Josefina	Bouissou	41896008	0099-04-06	17	\N	2392579281	josebouissou@gmail.com	A	+	OSDE	36201873004	08105556733	Nora A. Gil	Madre	239215639985	2016-08-19 20:57:26.170849	2016-08-19 20:57:26.170849
396	376	Partaker	Francisco	Ustarroz	42901559	\N	15	\N	02392-15606914	fran_ustarroz19@hotmail.com.ar	0	+	IOMA	1238741701/03			Madrre/padre	239215443957/58	2016-08-19 21:12:46.383129	2016-08-19 21:12:46.383129
397	377	Partaker	Sofía	Cuerda	41901651	\N	15	\N	412830								2392440440		2016-08-19 21:12:46.390561	2016-08-19 21:12:46.390561
248	231	Partaker	Ernesto Alessandro	Araya Paez	41229058	1998-09-08	17	\N	02342 428003	ernest-2006@outlook.com	0	+				Gladis Ortencia Paez	Madre	2342 15485810	2016-06-28 18:32:44.892065	2016-08-19 21:27:44.535913
398	21	Professor	Amanda 	Bustos		\N	\N	\N											2016-08-20 00:13:03.58452	2016-08-20 00:13:03.58452
399	378	Partaker	Santiago Ezequiel	Gomez	43803414	2001-12-03	14	\N	2342464253							Osmar Alfredo Gomez	Padre	2342464253	2016-08-20 00:22:37.298822	2016-08-20 00:22:37.298822
400	379	Partaker	Brenda Yasmín 	Bergonce	43592876	0001-03-10	15	\N	2342544675	vaneb_83@live.com.ar	A	+				Bergonce Vanesa	Madre	2342506334	2016-08-20 00:22:37.310261	2016-08-20 00:22:37.310261
401	380	Partaker	María Magdalena	Bracco	42839115	\N	15	\N	423758	maria-gavino@hotmail.com	0	+	IOMA	2200637631/03		Gaviño Maria Irma	Madre	2342509938	2016-08-20 00:22:37.319867	2016-08-20 00:22:37.319867
402	381	Partaker	Raúl Carlos	Mendizabal	42933172	2000-10-07	15	\N	2342406295	andre_devi@hotmail.com	B	+	OSDE	35207913503		Maria Andrea De Villa	Madre	2342406295	2016-08-20 00:45:12.152473	2016-08-20 00:45:12.152473
403	382	Partaker	Valentina	Bracco	43045462	\N	15	\N	433072	valen_bracco@hotmail.com	B	+	Federada Salud	49782 03	0341 4208800	Marta Ascuaga	Madre	234215480498	2016-08-20 00:45:12.164241	2016-08-20 00:45:12.164241
404	383	Partaker	Candela	García	42568889	\N	15	\N	431597		0	+	OSECAC			María Gomez Veronica	Madre	15504308	2016-08-20 00:45:12.173631	2016-08-20 00:45:12.173631
405	22	Professor	Ester 	Bustos		\N	\N	\N											2016-08-20 00:51:02.824856	2016-08-20 00:51:02.824856
406	384	Partaker	Candela Natalia	Biana Morossini	42135036	2000-01-05	16	\N	423928	candebiamo@hotmail.com	A	+	IOMA	2237863560/02		Gabriela Morossini	Madre	2342480476	2016-08-20 01:06:41.866158	2016-08-20 01:06:41.866158
407	385	Partaker	Huilem	Signorelli	41857394	0099-05-02	17	\N	2342499506	huiileem02@gmail.com			IOMA			Mabel Nancy Signorelli	Madre		2016-08-20 01:06:41.879151	2016-08-20 01:06:41.879151
408	386	Partaker	Lucia Agustina	Llublican	43256316	0001-01-14	15	\N	2342533674	agustinallublican@yahoo.com.ar	B	+	Carnet Hopital	45557		Mirta Vendramini	Madre	2342412951	2016-08-20 01:06:41.888221	2016-08-20 01:06:41.888221
409	387	Partaker	Mauricio Fabián	Mazzeo	41891139	0099-04-22	17	\N	515861							Stella Perafán	Madre	515861	2016-08-20 01:06:41.898872	2016-08-20 01:06:41.898872
410	388	Partaker	Alan Isaías	Marino Frutos	94944625	0097-12-20	18	\N	1126540500							Marino Sergio Raul	Padre	234215401672	2016-08-20 01:06:41.907935	2016-08-20 01:06:41.907935
411	389	Partaker	Candela Natalia	Biana Morossini	42135036	2000-01-05	16	\N	423928	candebiamo@hotmail.com	A	+	IOMA	2237863560/02		Gabriela Morossini	Madre	2342480476	2016-08-20 01:07:37.839193	2016-08-20 01:07:37.839193
412	390	Partaker	Huilem	Signorelli	41857394	0099-05-02	17	\N	2342499506	huiileem02@gmail.com			IOMA			Mabel Nancy Signorelli	Madre		2016-08-20 01:07:37.853756	2016-08-20 01:07:37.853756
414	392	Partaker	Mauricio Fabián	Mazzeo	41891139	0099-04-22	17	\N	515861							Stella Perafán	Madre	515861	2016-08-20 01:07:37.878675	2016-08-20 01:07:37.878675
416	394	Partaker	Camila Mariel	Rouera	43656519	2001-08-21	14	\N	2342532917				Policia Federal	615050/1			Padre	2345448234	2016-08-20 01:13:33.252213	2016-08-20 01:13:33.252213
417	395	Partaker	Brisa Ayelen	Vila	44112055	0002-05-07	14	\N	2342451329		B	+	Carnet Hospital San Luis			Yamila Vila	Madre	14451329	2016-08-20 01:13:33.264688	2016-08-20 01:13:33.264688
418	23	Professor	Amanda Ester 	Bustos	18085927	1965-12-31	50	\N	02342 459957	estercitabustos@hotmail.com	0	+	IOMA	2180859278/00		Ludeña Jose	Esposo	02342 545494	2016-08-20 02:46:48.152182	2016-08-20 02:46:48.152182
419	396	Partaker	Fiamma	Velazquez	42963322	2000-09-22	15	\N	2342 423999	mariaestherh960@hotmail.com	0	+	IOMA	21386405805		Rodriguez Maria Esther	Madre	2342 432999	2016-08-20 03:16:54.870061	2016-08-20 03:16:54.870061
420	397	Partaker	Candela Katherine	Ponce	42112026	2000-02-27	16	\N	422649		A	+	OSFATLYF	1616375003		Marisol Lujan de Ponce	Madre	422649	2016-08-20 03:16:54.880687	2016-08-20 03:16:54.880687
421	398	Partaker	Antonella	Coronel	42057971	1999-07-10	16	\N	427153		0	+	IOMA				Padre	15513695	2016-08-20 03:16:54.887983	2016-08-20 03:16:54.887983
422	399	Partaker				\N	\N	\N											2016-08-20 03:16:54.894957	2016-08-20 03:16:54.894957
423	400	Partaker	Fernando 	Gomez	39801929	1996-07-22	19	\N	2342 531907	feerchuu@gmail.com						Alfredo Gomez	Padre	2342 464253	2016-08-20 03:31:59.884558	2016-08-20 03:31:59.884558
424	401	Partaker	Patricia Noemi	Sanchez Baldazzi	41857385	1999-05-02	17	\N	2342 407828	sanchez.patr1ci4@gmail.com						Maria Sanchez	Madre	2342 534088	2016-08-20 03:31:59.891908	2016-08-20 03:31:59.891908
425	402	Partaker	Micaela Ayelen 	Milano	43399175	\N	15	\N	2342 454792							Stella Milano	Madre	2342 470480	2016-08-20 03:31:59.899016	2016-08-20 03:31:59.899016
426	403	Partaker	Matias Ezequiel	Carpignano Orellano	40193317	1997-02-25	19	\N	02342 424387	maticarpignano@gmail.com	0	+	IOMA	221826820/02		Andrea Orellano	Madre	02342 424387	2016-08-20 03:31:59.90689	2016-08-20 03:31:59.90689
427	404	Partaker	Sergio Agustin	Moreno	38852022	1996-04-25	20	\N	02342 555089	chufo_70@hotmail.com						Marano Adriana	Madre	2342 505928	2016-08-20 03:31:59.914624	2016-08-20 03:31:59.914624
428	405	Partaker	Estefania Araceli	Martinez	42071071	1999-10-25	16	\N	2342 15406093				OSECAC			Facundo Martinez	Padre		2016-08-20 03:39:45.614413	2016-08-20 03:39:45.614413
429	406	Partaker	Jose Francisco	Morales Gomez	41461799	1998-06-06	17	\N	02342 15408014	josegomez_1998@hotmail.com	0		IOMA			Amancay Gomez Granda	Madre	2342 483882	2016-08-20 03:39:45.626098	2016-08-20 03:39:45.626098
430	407	Partaker	Camila Soledad	Zaldarriaga	43592854	2001-08-07	14	\N	02342 510550	solezalda1984@hotmail.com.ar		+				Soledad Zaldarriaga	Madre	2342 510550	2016-08-20 03:48:19.488865	2016-08-20 03:48:19.488865
431	408	Partaker	Aldana Nair	Fenoy	42839171	2000-09-19	15	\N	02342 401543	colofenoy@gmail.com	B	+				Russo Maria Alejandra	Madre	2342 401543	2016-08-20 03:48:19.515151	2016-08-20 03:48:19.515151
432	409	Partaker	Camila Trinidad	Zamudio	42963360	2000-11-06	15	\N	2342 15400818				OSSAMI	20001082/0	2342 430268	Lorenzo Marina	Madre	234215400818	2016-08-20 03:48:19.53478	2016-08-20 03:48:19.53478
433	410	Partaker	Consuelo 	Tugores 	41461736	1998-11-05	17	\N	2342484710	contugores2@gmail.com	0	+	OSDE 	61860977503	05108887788	Máquez Mariana	Madre	2342484710	2016-08-26 22:10:49.618565	2016-08-26 22:10:49.618565
435	412	Partaker	Josefina 	Rolt	41218280	1998-11-16	17	\N	2342407260	josefinarottchas@gmail.com	0	+	SAMI 	00186300/0		Josefina Chas	Madre	2342516261	2016-08-26 22:19:23.679129	2016-08-26 22:19:23.679129
436	413	Partaker	Tatiana	Fernandez	41740256	1999-03-12	17	\N	2342512622	tatianagotta@gmail.com	B	+	OSDE	61890330403	423384	Silvana Caviglia	Madre	2342530487	2016-08-26 22:26:35.982859	2016-08-26 22:26:35.982859
437	414	Partaker				\N	\N	\N											2016-08-26 22:49:02.067868	2016-08-26 22:49:02.067868
438	415	Partaker				\N	\N	\N											2016-08-26 22:58:36.665938	2016-08-26 22:58:36.665938
415	393	Partaker	Alan Isaías	Marino Frutos	94944625	\N	18	\N	1126540500							Marino Sergio Raul	Padre	234215401672	2016-08-20 01:07:37.891881	2016-08-26 23:10:12.199797
413	391	Partaker	Nicolás Agustín	Ramos	41293629	\N	17	\N	2342461064		A	+					Madre	2342464764	2016-08-20 01:07:37.865038	2016-08-26 23:10:12.207305
439	24	Professor	Leonardo Hugo	Citate	27385300	\N	\N	\N	02342 414018										2016-08-27 18:40:40.446366	2016-08-27 18:40:40.446366
440	416	Partaker	Guillermina	Fernandez	42 631 522	2001-01-12	15	\N	2342 512382							Magdalena Esther Cardoso	Madre	498181	2016-08-27 18:59:35.640342	2016-08-27 18:59:35.640342
441	417	Partaker	Ignacio	Citate	42 631 512	2000-10-29	15	\N	2342 406724	ccitate@gmail.com	B	+	Famyl	1053202	02364 431585		Madre	02342 458426	2016-08-27 18:59:35.649359	2016-08-27 18:59:35.649359
442	418	Partaker	Milagros Natally	Peralta Gaynor	41427094	1999-12-20	16	\N	02342 532519	carolinaandreaperalta@hotmail.com						Ariel Ugrote	Padrastro	02342 406702	2016-08-27 18:59:35.655446	2016-08-27 18:59:35.655446
\.


--
-- Name: people_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('people_id_seq', 442, true);


--
-- Data for Name: professors; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY professors (id, people_id, medical_data_id, created_at, updated_at) FROM stdin;
2	\N	\N	2016-06-02 19:21:31.565939	2016-06-02 19:21:31.565939
4	\N	\N	2016-06-02 19:23:22.24639	2016-06-02 19:23:22.24639
5	\N	\N	2016-06-02 19:24:51.814818	2016-06-02 19:24:51.814818
6	\N	\N	2016-06-04 13:52:25.298665	2016-06-04 13:52:25.298665
7	\N	\N	2016-06-04 14:05:51.966022	2016-06-04 14:05:51.966022
8	\N	\N	2016-06-04 14:31:35.378573	2016-06-04 14:31:35.378573
9	\N	\N	2016-06-04 14:36:04.99001	2016-06-04 14:36:04.99001
10	\N	\N	2016-06-04 14:41:32.425206	2016-06-04 14:41:32.425206
11	\N	\N	2016-06-04 14:49:19.463084	2016-06-04 14:49:19.463084
12	\N	\N	2016-06-04 15:02:49.179457	2016-06-04 15:02:49.179457
13	\N	\N	2016-06-04 15:09:10.742377	2016-06-04 15:09:10.742377
14	\N	\N	2016-06-21 18:05:00.024136	2016-06-21 18:05:00.024136
15	\N	\N	2016-06-21 20:05:46.585952	2016-06-21 20:05:46.585952
16	\N	\N	2016-06-21 20:08:55.219809	2016-06-21 20:08:55.219809
17	\N	\N	2016-06-23 17:51:29.560439	2016-06-23 17:51:29.560439
18	\N	\N	2016-08-18 00:38:35.472156	2016-08-18 00:38:35.472156
19	\N	\N	2016-08-18 00:39:07.903545	2016-08-18 00:39:07.903545
20	\N	\N	2016-08-19 17:31:01.642078	2016-08-19 17:31:01.642078
21	\N	\N	2016-08-20 00:13:03.577075	2016-08-20 00:13:03.577075
22	\N	\N	2016-08-20 00:51:02.821388	2016-08-20 00:51:02.821388
23	\N	\N	2016-08-20 02:46:48.146186	2016-08-20 02:46:48.146186
24	\N	\N	2016-08-27 18:40:40.442851	2016-08-27 18:40:40.442851
\.


--
-- Name: professors_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('professors_id_seq', 24, true);


--
-- Data for Name: queries; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY queries (id, name, email, phone_number, message, already_read, created_at, updated_at) FROM stdin;
9	gato	asda@sdasda.com	ADASDa	sdkfnalskhdasgdlkjasfhoahdjñasmgbajsdñasf	t	2016-07-12 20:56:38.751695	2016-07-12 20:57:39.799946
10	Nombre	De prueba	123123123	asdasdasda	f	2017-04-24 00:15:41.044105	2017-04-24 00:15:41.044105
\.


--
-- Name: queries_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('queries_id_seq', 10, true);


--
-- Data for Name: schema_migrations; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY schema_migrations (version) FROM stdin;
20160416175020
20160416175900
20160416201438
20160416204838
20160419045416
20160419051016
20160419051721
20160420191033
20160420195648
20160422212218
20160425140054
20160425142907
20160426225520
20160428203427
20160429122909
20160501210135
20160510193649
20160513013954
20160517025822
20160523204954
20160523210910
20160530214638
20160609150725
20160609160838
20160616230132
20170221155545
20170221163812
20170301204134
\.


--
-- Data for Name: schools; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY schools (id, name, phone_number, fax_number, email, location_id, created_at, updated_at) FROM stdin;
1	Escuela Normal	2342425626	\N	escuelanormal@hotmail.com	\N	2016-04-19 04:33:18.747539	2016-04-19 04:33:18.747539
2	Normal	43520342134	\N	Normal@gmial.com	\N	2016-04-26 02:46:23.55137	2016-04-26 02:46:23.55137
5	E.E.S.Nº1 "Bandera Argentina"	2352493016	\N	escuelasecundaria1irala@gmail.com	\N	2016-06-04 14:54:23.565583	2016-06-04 14:54:23.565583
6	Centro Educativo para la Produccion Total Nº26	2342510444	\N	ceptn26lalimpia@yahoo.com	\N	2016-06-04 14:56:58.355026	2016-06-04 14:56:58.355026
7	Escuela de Educacion Secundaria Nº6	431353	\N	es6bragado@yahoo.com.ar	\N	2016-06-04 14:59:03.311119	2016-06-04 14:59:03.311119
4	Instituto Privado Agrotècnico	2342430106	\N	agrobra@hotmail.com	\N	2016-06-04 14:07:30.259889	2016-06-04 15:00:46.437447
8	Colegio Monseñor Espinosa de San Jose	430129	\N		\N	2016-06-21 18:07:34.952147	2016-06-21 19:56:19.056191
9	E.E.S Tècnica	2342422243	\N		\N	2016-06-25 14:15:21.873612	2016-06-25 14:15:21.873612
10	E.E.S Nº 3	2342422349	\N	ees3_comerciobragado@yahoo.com.ar	\N	2016-06-25 14:16:40.600708	2016-06-25 14:16:40.600708
3	Colegio Santísima Virgen Niña	470182	\N		\N	2016-06-02 19:20:27.634458	2016-06-25 15:22:15.04095
11	E.E.S.N°5	2342495120	\N	eemn5comodoropy@yahoo.com.ar	\N	2016-06-30 19:54:09.409302	2016-06-30 19:54:09.409302
12	E.E.S. Nuestra Señora de la Misericordia	0336-4422293	\N	miser-cordi@hotmail.com	\N	2016-08-18 00:37:01.595993	2016-08-18 00:37:01.595993
13	Fundación Colegio Los Médanos		\N		\N	2016-08-19 17:33:56.700489	2016-08-19 17:33:56.700489
14	E.S.B.N°2 Martín Sastre		\N		\N	2016-08-20 00:12:34.214215	2016-08-20 00:12:34.214215
15	Esc de Educ Sec N°2 "Marcos Sastre"	422158	\N	Secundaria2_bragado@yahoo.com	\N	2016-08-20 02:42:56.633703	2016-08-20 02:42:56.633703
16	Esc Secundaria N°9 	426031	\N	secundaria_9@hotmail.com	\N	2016-08-20 02:44:27.950787	2016-08-20 02:44:27.950787
17	Instituto Comercial Obrien		\N		\N	2016-08-27 18:48:25.360593	2016-08-27 18:48:25.360593
\.


--
-- Name: schools_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('schools_id_seq', 17, true);


--
-- Data for Name: statistics; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY statistics (id, delegations, partakers, delegates, authorities, year, created_at, updated_at) FROM stdin;
1	0	0	0	0	2013	2017-02-22 19:17:29.728683	2017-02-22 19:17:29.728683
5	0	0	0	0	2017	2017-02-22 19:17:29.807291	2017-02-22 19:17:29.807291
2	48	273	199	74	2014	2017-02-22 19:17:29.749848	2017-02-22 23:42:24.523278
3	49	283	211	72	2015	2017-02-22 19:17:29.768143	2017-02-22 23:42:42.216739
4	79	408	342	66	2016	2017-02-22 19:17:29.787326	2017-02-22 23:42:59.589256
\.


--
-- Name: statistics_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('statistics_id_seq', 5, true);


--
-- Data for Name: trainers; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY trainers (id, user_id, rol, facebook_url, twitter_url, instagram_url, principal_image, secondary_image, created_at, updated_at, index_number, principal_image_name) FROM stdin;
11	12	Capacitador CS	https://www.facebook.com/iara.bonahora?fref=ts	https://twitter.com/IaraBonahora	https://www.instagram.com/iarabonahora/	Iara_Bonahora.jpg	\N	2016-05-05 15:20:28.107126	2016-05-13 01:57:41.962917	14	iara.jpg
10	11	Capacitador CS	https://www.facebook.com/vale.delega?fref=ts	https://twitter.com/ValentinDelega	https://www.instagram.com/delegavalen/	Valentin_Delega.jpeg	\N	2016-05-05 15:18:23.557074	2016-05-13 01:57:58.242376	15	valentin_delega.jpg
24	25	Capacitadora Aut	https://www.facebook.com/melii.alessandrini?fref=ts	https://twitter.com/MeeliiiA	https://www.instagram.com/melialessandrini/	12742242_10203817597839443_2344281764281007957_n.jpg	\N	2016-05-05 16:35:33.462679	2016-05-13 01:58:13.18183	24	meli.jpg
7	8	Coordinador General	https://www.facebook.com/tomo.moreno?fref=ts	https://twitter.com/tomasmoreno_	https://www.instagram.com/tomasmoren_/	Tomo.jpg	\N	2016-05-05 15:07:38.476304	2016-05-13 01:58:29.554583	3	tomo_moreno.jpg
18	19	Capacitadora Aut TL	https://www.facebook.com/sofi.santamarina?fref=ts	https://twitter.com/SofiaSantamari8	https://www.instagram.com/santamarinasofi/	1533924_445541642214692_1802466165_n.jpg	\N	2016-05-05 16:12:55.513644	2016-05-13 01:58:52.385315	4	sofia_santamarina.jpg
1	2	Capacitador STI TL	https://www.facebook.com/chano.zignego	https://twitter.com/ChanoZignego	https://www.instagram.com/chanozignego/	Chano__2_.jpg	12074605_10207839105599730_5517238221712414737_n.jpg	2016-05-02 00:30:26.813796	2016-05-13 02:00:44.11704	5	esteban_zignego.jpg
16	17	Capacitador AG	https://www.facebook.com/juaan.galvaliche?fref=ts	https://twitter.com/JuanGalva	https://www.instagram.com/juan.galva/	Juan_Galva.jpg	\N	2016-05-05 16:07:06.26709	2016-05-13 02:01:22.43703	11	galva.jpg
12	13	Capacitador AG	https://www.facebook.com/camila.silva.547?fref=ts	https://twitter.com/camisilv	https://www.instagram.com/camilasilvab/	Cami_Silva.jpg	\N	2016-05-05 15:21:51.798121	2016-05-13 02:01:41.482028	12	camila_silva.jpg
20	21	Capacitador SATI	https://www.facebook.com/florencia.barbieri.9?fref=ts	https://twitter.com/florbarbieri	https://www.instagram.com/florbarbieri/	Flor_Barbieri.jpg	\N	2016-05-05 16:21:12.562404	2016-05-13 02:01:57.741354	16	flor_barbieri.jpg
21	22	Capacitador SATI	https://www.facebook.com/alee.bondoni?fref=ts	https://twitter.com/aleebondoni	https://www.instagram.com/ale.bondoni/	bondoni.jpg	\N	2016-05-05 16:28:36.195756	2016-05-13 02:03:11.314336	17	ale_bondoni.jpg
17	18	Capacitador SEGIB	https://www.facebook.com/maitena.barros?fref=ts	https://twitter.com/maitenaba	https://www.instagram.com/i.am.m.ai/	Maitena_Barros__1_.jpg	\N	2016-05-05 16:09:34.321554	2016-05-13 02:03:26.754592	18	maitena_barros.jpg
23	24	Capacitador SEGIB	https://www.facebook.com/fermin.figueron?fref=ts	https://twitter.com/FerminFigueron	https://www.instagram.com/ferminfigueron/	12027637_617116451764632_6339755397133981638_n.jpg	\N	2016-05-05 16:33:00.392473	2016-05-13 02:03:40.577859	19	fermin_figue.jpg
13	14	Jefe de Prensa	https://www.facebook.com/vlallana9?fref=ts	https://twitter.com/vlallana9	https://www.instagram.com/valentinlallana/	Valentin_Lallana.jpg	\N	2016-05-05 15:24:54.056242	2016-05-13 02:03:52.435731	2	lashi.jpg
3	4	Jefe de Coordinación	https://www.facebook.com/AgusMacc	https://twitter.com/agusmacc	https://www.instagram.com/agusmacc/	10314739_10153295036509170_1218294393648029512_n.jpg	\N	2016-05-05 04:05:22.927039	2016-05-13 02:04:12.061878	1	agustina_macchione.jpg
14	15	Capacitadora Aut	https://www.facebook.com/federico.petek.9?fref=ts	https://twitter.com/FedericoPetek	https://www.instagram.com/federicopetek/	Fede_Petek.jpg	\N	2016-05-05 15:27:08.090284	2016-05-13 02:04:31.43666	20	fede_petek.jpg
9	10	Capacitadora Aut	https://www.facebook.com/josefina.rizzo.3?fref=ts	https://twitter.com/JosefinaRizzo	https://www.instagram.com/josefina.rizzo/	Jose_Rizo.jpg	\N	2016-05-05 15:16:09.394638	2016-05-13 02:04:48.543267	21	josefina_rizzo.jpg
8	9	Capacitadora Aut	https://www.facebook.com/Lolu.Farias?fref=ts	https://twitter.com/LoolaFarias	https://www.instagram.com/lolifarias/	Lola_Far_as.jpg	\N	2016-05-05 15:11:20.579792	2016-05-13 02:05:07.467121	22	lola_farias.jpg
15	16	Capacitadora Aut	https://www.facebook.com/julian.gualdoni?ref=ts&fref=ts&qsefr=1	https://twitter.com/JuliGualdoni	https://www.instagram.com/juligualdoni/	Juli_Gualdoni.JPG	\N	2016-05-05 16:05:31.396855	2016-05-13 02:05:27.051214	23	juli_gualdoni.JPG
5	6	Capacitador AG	https://www.facebook.com/facundo.soldavila?fref=ts	https://twitter.com/FacuSoldavila	https://www.instagram.com/facusoldavila/	Facu_Soldavila.jpg	tincho_con_arjona.jpg	2016-05-05 15:03:07.472366	2017-04-24 02:47:55.648572	9	faca_soldavilla.jpg
2	3	Capacitador CS	https://www.facebook.com/chiqui.zignego?fref=ts	https://twitter.com/ChiquiZignego	https://www.instagram.com/chiquizignego/	13023224_10209342246621945_476448018_n.jpg	13023224_10209342246621945_476448018_n.jpg	2016-05-02 00:31:40.153481	2017-04-24 02:44:30.373622	13	sebastian_zignego.jpg
19	20	Capacitador AG TL	https://www.facebook.com/perezdelolmo?fref=ts	https://twitter.com/nickhlaus	https://www.instagram.com/nicolasperezdelolmo/	Sosa_Pablo.jpg	\N	2016-05-05 16:17:19.12548	2017-04-24 02:44:30.439164	6	nico_perez.jpg
6	7	Capacitador SEGIB TL	https://www.facebook.com/vicente.macchione?fref=ts	https://twitter.com/VicenMacchione	https://www.instagram.com/vmacchione/	Sosa_Pablo.jpg	Del_Pozo_Sergio.jpg	2016-05-05 15:05:12.99818	2017-04-24 02:47:05.761102	7	vicente.jpg
4	5	Capacitador de CS TL	https://www.facebook.com/marianoicardi?fref=ts	https://twitter.com/MarianitoIcardi	https://www.instagram.com/marianoicardi/	Beltran_Hector.jpg	imageedit_22_8924149751.png	2016-05-05 04:13:39.264002	2017-04-24 02:47:23.277838	8	mariano_icardi.jpg
22	23	Capacitador AG	https://www.facebook.com/lulimoreeno?fref=ts	https://twitter.com/lulimoreeno	https://www.instagram.com/lulimoreeno/	imageedit_22_8924149751.png	marker-b.png	2016-05-05 16:30:24.036928	2017-04-24 02:56:27.155125	10	luli_moreno.JPG
\.


--
-- Name: trainers_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('trainers_id_seq', 25, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: dev
--

COPY users (id, first_name, last_name, created_at, updated_at, email, encrypted_password, reset_password_token, reset_password_sent_at, remember_created_at, sign_in_count, current_sign_in_at, last_sign_in_at, current_sign_in_ip, last_sign_in_ip, phone_number, dni) FROM stdin;
6	Facundo	Soldavila	2016-05-05 15:03:07.46781	2016-06-24 01:08:21.875432	facundo-soldavila@hotmail.com	$2a$10$Ea97eZxmG4oX7Mbqm7XP4.h.Qqw6T/Ks.6gVnWGFpL3Vyhz/kWZJy	\N	\N	\N	0	\N	\N	\N	\N		
7	Vicente	Macchione	2016-05-05 15:05:12.992215	2016-06-24 01:08:21.968881	vicente.macchione1@gmail.com	$2a$10$ac7V8qDfx0iiLsasEDaSwuP/SPrgpDmsf0HEX5gnn2Jw9/V04xNHa	\N	\N	\N	0	\N	\N	\N	\N		
8	Tomas	Moreno	2016-05-05 15:07:38.450601	2016-06-24 01:08:22.197735	tomasmorenoacevedo@gmail.com	$2a$10$dEgfukrdt85F46sGHSU/6OcpEwUb68BfuuxAqGe5KkOkROASLWxNa	\N	\N	\N	0	\N	\N	\N	\N		
9	Lola	Farias	2016-05-05 15:11:20.562054	2016-06-24 01:08:22.594018	loli.farias@hotmail.com	$2a$10$v3fI1nLXteCk9o1Q75kSxeVdgy326sTDQoWTG.k3QBMfqSbMXLXUy	\N	\N	\N	0	\N	\N	\N	\N		
10	Josefina	Rizzo	2016-05-05 15:16:09.391436	2016-06-24 01:08:22.681417	josefina_rizzo1997@hotmail.com	$2a$10$Ipm8Ojl5CZLeKX/FFovOneAYBWHQrni2PQ2c0taUrm5mZRXep5i9i	\N	\N	\N	0	\N	\N	\N	\N		
11	Valentin	Delega	2016-05-05 15:18:23.54908	2016-06-24 01:08:22.848872	valentindelega@gmail.com	$2a$10$sCC9Luq8lntQHJDVoYkRUe7NZn1a/0auhYH9SymEIjzOC.ibcVgoC	\N	\N	\N	0	\N	\N	\N	\N		
12	Iara	Bonahora	2016-05-05 15:20:28.10329	2016-06-24 01:08:22.938646	iarabonahora@gmail.com	$2a$10$rjNSOzqGYh803t35I9qgbu.hCbSuLQ5Y2Omce3ujbon/DaV41Am2K	\N	\N	\N	0	\N	\N	\N	\N		
13	Camila	Silva	2016-05-05 15:21:51.789195	2016-06-24 01:08:23.02805	camisilva5@yahoo.com	$2a$10$5QkhoLsPUatWGd.aTb8gO.uQV3cDi9V2YUF/MZw0gP72hPbuDmUMi	\N	\N	\N	0	\N	\N	\N	\N		
15	Federico	Petek	2016-05-05 15:27:08.085861	2016-06-24 01:08:23.117339	federico.petek@gmail.com	$2a$10$eIoEf4ydQt6mcJA0.ntGQu3frlJftRGsZx1lOf776TjLxnRBY71M.	\N	\N	\N	0	\N	\N	\N	\N		
2	Esteban	Zignego	2016-05-02 00:30:26.779057	2016-06-24 01:08:21.779946	esteban.zignego@gmail.com	$2a$10$.5tXs4uV8pCoymnSETuzC.I1SxSfqYH6T.9rMKRTixq/ZsICPSwQq	\N	\N	\N	0	\N	\N	\N	\N		
14	Valentin	Lallana	2016-05-05 15:24:54.040141	2016-06-24 01:08:23.221217	v.lallana9@gmail.com	$2a$10$FXP1WiD3erUEeXVo6I5JXO8apQQBaez2GBc0DptFiUD15hFoRw4e6	\N	\N	\N	1	2016-05-05 15:58:02.665947	2016-05-05 15:58:02.665947	190.188.215.40	190.188.215.40		
16	Julian 	Gualdoni	2016-05-05 16:05:31.392545	2016-06-24 01:08:23.357349	juliangualdoni@hotmail.com	$2a$10$Eqh52nMtuxWzKg/TfUkTd.kCm1370RR/sA2lGQgc9fNGGeDkVjz4W	\N	\N	\N	0	\N	\N	\N	\N		
17	Juan Cruz	Galvaliche	2016-05-05 16:07:06.261364	2016-06-24 01:08:23.454762	galva_09_32@hotmail.com	$2a$10$2z52kU19WFsBW5GKrpljdOexBoLKa0xeeaaSsSv72pJUsBrxwQ/6S	\N	\N	\N	0	\N	\N	\N	\N		
18	Maitena	Barros	2016-05-05 16:09:34.290808	2016-06-24 01:08:23.54929	barrosbarros904@gmail.com	$2a$10$BU34l1vxE.qpRmzfo9qXgePTM0A0MlLFh9NavtG0CYyfHi..RQCdq	\N	\N	\N	0	\N	\N	\N	\N		
19	Sofia	Santamarina	2016-05-05 16:12:55.509228	2016-06-24 01:08:23.661818	sofia.bragado@hotmail.com	$2a$10$kbqzztQlFIOd1qweJXRTMOtjFy0/vL8ynKK2KTywDAgPKG2n8AvWm	\N	\N	\N	0	\N	\N	\N	\N		
20	Nicolas	Perez del Olmo	2016-05-05 16:17:19.120833	2016-06-24 01:08:23.761874	nicolasperez93@hotmail.com	$2a$10$1HQNy/ikhXCC8ECNs4P12uiGAplJgmeMXnyAd68vZVrkMAa1CijoC	\N	\N	\N	0	\N	\N	\N	\N		
21	Florencia	Barbieri	2016-05-05 16:21:12.559223	2016-06-24 01:08:23.881327	florencia2535@hotmail.com	$2a$10$bC1EpZ0EkXxvnopiAIqkbeomF9V8cXNCoG2fEW11znzdnWn1AtBim	\N	\N	\N	0	\N	\N	\N	\N		
22	Ale	Bondoni	2016-05-05 16:28:36.190301	2016-06-24 01:08:23.985527	aleeb-16@hotmail.com	$2a$10$vX3nhnEiZwzEkXHw66broOQlIZakcqMlE6KdY9E8wrtrnw6jLvwky	\N	\N	\N	0	\N	\N	\N	\N		
23	Lucia	Moreno	2016-05-05 16:30:24.033865	2016-06-24 01:08:24.261528	luciamorenoacevedo@gmail.com	$2a$10$YLk80EfCskTzxCHfwlB8zulzDVCQj9KH4TFLlhWxKyu8RhSJlrODe	\N	\N	\N	0	\N	\N	\N	\N		
24	Fermin	Figueron	2016-05-05 16:33:00.385399	2016-06-24 01:08:24.53513	ferminfigueron@gmail.com	$2a$10$HlYsnwgEhPnyaMQ80J6PX.AhGoKmMNI7/Kxl4VnusPoFkwh2nNF9S	\N	\N	\N	0	\N	\N	\N	\N		
25	Melina	Alessandrini	2016-05-05 16:35:33.432535	2016-06-24 01:08:24.714353	melina_24_09@hotmail.com	$2a$10$aVYB8LMUvD6xNQLIxKZqpOYV59Crmob6cKa5pEnLH7CfWmPqKGRry	\N	\N	\N	0	\N	\N	\N	\N		
26	Florencia	Barbieri	2016-05-11 20:38:27.66219	2016-06-24 01:08:24.833705	florencia2535@hotmail.comm	$2a$10$OKceLldPJa8Cy4uOUquNXe2FBaiH1MACbcSdiNvoIkoK2B3D6FHwC	\N	\N	\N	0	\N	\N	\N	\N		
5	Mariano	Icardi	2016-05-05 04:13:39.258049	2016-06-24 01:08:25.373054	marianoicardi@hotmail.com	$2a$10$5hRVnLIxQl9z8Vr72ULnK.W21IiYTBlG24ScRDp/H0FTzhPy6eEWW	\N	\N	\N	5	2016-06-24 01:06:58.329076	2016-05-11 19:28:22.183002	181.29.35.53	181.29.12.80		
3	Sebastian	Zignego	2016-05-02 00:31:40.148748	2016-06-24 01:11:32.613807	zignegoc@hotmail.com	$2a$10$wLqm8BlWaZhEbP9Nte3tNu4B51mH5j9anHEeyCykqIQHeG1e2mGCm	\N	\N	\N	2	2016-06-24 01:11:32.611533	2016-06-24 01:05:51.298587	181.29.35.53	181.29.35.53		
4	Agustina	Macchione	2016-05-05 04:05:22.916996	2016-07-11 22:48:27.496018	agustina.macchione@gmail.com	$2a$10$XmHPQgRdyYl2iJya0D42o.jUhQfgB8./AjUh2iAyAXEFJUxhgkbqm	\N	\N	\N	18	2016-07-11 22:48:27.487418	2016-07-11 22:48:26.259284	201.213.152.236	201.213.152.236		
1	MNU	Admin	2016-04-19 03:50:42.793299	2017-04-20 14:59:17.10193	mnubragado@admin.com	$2a$10$rU13hPISzAMaFSID6Gh8EOThS7EHUMRZSW8NFgTD/zxjuYQz91qN6	\N	\N	2016-11-01 17:09:53.132556	52	2017-04-20 14:59:17.100739	2017-03-14 03:29:19.209607	127.0.0.1	190.194.203.7		
\.


--
-- Name: users_id_seq; Type: SEQUENCE SET; Schema: public; Owner: dev
--

SELECT pg_catalog.setval('users_id_seq', 26, true);


--
-- Name: countries_pkey; Type: CONSTRAINT; Schema: public; Owner: dev; Tablespace: 
--

ALTER TABLE ONLY countries
    ADD CONSTRAINT countries_pkey PRIMARY KEY (id);


--
-- Name: dashboards_pkey; Type: CONSTRAINT; Schema: public; Owner: dev; Tablespace: 
--

ALTER TABLE ONLY dashboards
    ADD CONSTRAINT dashboards_pkey PRIMARY KEY (id);


--
-- Name: delegations_pkey; Type: CONSTRAINT; Schema: public; Owner: dev; Tablespace: 
--

ALTER TABLE ONLY delegations
    ADD CONSTRAINT delegations_pkey PRIMARY KEY (id);


--
-- Name: ex_partakers_pkey; Type: CONSTRAINT; Schema: public; Owner: dev; Tablespace: 
--

ALTER TABLE ONLY ex_partakers
    ADD CONSTRAINT ex_partakers_pkey PRIMARY KEY (id);


--
-- Name: inscriptions_pkey; Type: CONSTRAINT; Schema: public; Owner: dev; Tablespace: 
--

ALTER TABLE ONLY inscriptions
    ADD CONSTRAINT inscriptions_pkey PRIMARY KEY (id);


--
-- Name: locations_pkey; Type: CONSTRAINT; Schema: public; Owner: dev; Tablespace: 
--

ALTER TABLE ONLY locations
    ADD CONSTRAINT locations_pkey PRIMARY KEY (id);


--
-- Name: medical_data_pkey; Type: CONSTRAINT; Schema: public; Owner: dev; Tablespace: 
--

ALTER TABLE ONLY medical_data
    ADD CONSTRAINT medical_data_pkey PRIMARY KEY (id);


--
-- Name: partakers_pkey; Type: CONSTRAINT; Schema: public; Owner: dev; Tablespace: 
--

ALTER TABLE ONLY partakers
    ADD CONSTRAINT partakers_pkey PRIMARY KEY (id);


--
-- Name: people_pkey; Type: CONSTRAINT; Schema: public; Owner: dev; Tablespace: 
--

ALTER TABLE ONLY people
    ADD CONSTRAINT people_pkey PRIMARY KEY (id);


--
-- Name: professors_pkey; Type: CONSTRAINT; Schema: public; Owner: dev; Tablespace: 
--

ALTER TABLE ONLY professors
    ADD CONSTRAINT professors_pkey PRIMARY KEY (id);


--
-- Name: queries_pkey; Type: CONSTRAINT; Schema: public; Owner: dev; Tablespace: 
--

ALTER TABLE ONLY queries
    ADD CONSTRAINT queries_pkey PRIMARY KEY (id);


--
-- Name: schools_pkey; Type: CONSTRAINT; Schema: public; Owner: dev; Tablespace: 
--

ALTER TABLE ONLY schools
    ADD CONSTRAINT schools_pkey PRIMARY KEY (id);


--
-- Name: statistics_pkey; Type: CONSTRAINT; Schema: public; Owner: dev; Tablespace: 
--

ALTER TABLE ONLY statistics
    ADD CONSTRAINT statistics_pkey PRIMARY KEY (id);


--
-- Name: trainers_pkey; Type: CONSTRAINT; Schema: public; Owner: dev; Tablespace: 
--

ALTER TABLE ONLY trainers
    ADD CONSTRAINT trainers_pkey PRIMARY KEY (id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: dev; Tablespace: 
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (id);


--
-- Name: index_delegations_on_country_id; Type: INDEX; Schema: public; Owner: dev; Tablespace: 
--

CREATE INDEX index_delegations_on_country_id ON delegations USING btree (country_id);


--
-- Name: index_inscriptions_on_location_id; Type: INDEX; Schema: public; Owner: dev; Tablespace: 
--

CREATE INDEX index_inscriptions_on_location_id ON inscriptions USING btree (location_id);


--
-- Name: index_inscriptions_on_medical_data_id; Type: INDEX; Schema: public; Owner: dev; Tablespace: 
--

CREATE INDEX index_inscriptions_on_medical_data_id ON inscriptions USING btree (medical_data_id);


--
-- Name: index_inscriptions_on_people_id; Type: INDEX; Schema: public; Owner: dev; Tablespace: 
--

CREATE INDEX index_inscriptions_on_people_id ON inscriptions USING btree (people_id);


--
-- Name: index_inscriptions_on_professor_id; Type: INDEX; Schema: public; Owner: dev; Tablespace: 
--

CREATE INDEX index_inscriptions_on_professor_id ON inscriptions USING btree (professor_id);


--
-- Name: index_inscriptions_on_school_id; Type: INDEX; Schema: public; Owner: dev; Tablespace: 
--

CREATE INDEX index_inscriptions_on_school_id ON inscriptions USING btree (school_id);


--
-- Name: index_locations_on_locatable_type_and_locatable_id; Type: INDEX; Schema: public; Owner: dev; Tablespace: 
--

CREATE INDEX index_locations_on_locatable_type_and_locatable_id ON locations USING btree (locatable_type, locatable_id);


--
-- Name: index_medical_data_on_medicable_type_and_medicable_id; Type: INDEX; Schema: public; Owner: dev; Tablespace: 
--

CREATE INDEX index_medical_data_on_medicable_type_and_medicable_id ON medical_data USING btree (medicable_type, medicable_id);


--
-- Name: index_partakers_on_delegation_id; Type: INDEX; Schema: public; Owner: dev; Tablespace: 
--

CREATE INDEX index_partakers_on_delegation_id ON partakers USING btree (delegation_id);


--
-- Name: index_partakers_on_medical_data_id; Type: INDEX; Schema: public; Owner: dev; Tablespace: 
--

CREATE INDEX index_partakers_on_medical_data_id ON partakers USING btree (medical_data_id);


--
-- Name: index_partakers_on_people_id; Type: INDEX; Schema: public; Owner: dev; Tablespace: 
--

CREATE INDEX index_partakers_on_people_id ON partakers USING btree (people_id);


--
-- Name: index_partakers_on_professor_id; Type: INDEX; Schema: public; Owner: dev; Tablespace: 
--

CREATE INDEX index_partakers_on_professor_id ON partakers USING btree (professor_id);


--
-- Name: index_partakers_on_school_id; Type: INDEX; Schema: public; Owner: dev; Tablespace: 
--

CREATE INDEX index_partakers_on_school_id ON partakers USING btree (school_id);


--
-- Name: index_people_on_location_id; Type: INDEX; Schema: public; Owner: dev; Tablespace: 
--

CREATE INDEX index_people_on_location_id ON people USING btree (location_id);


--
-- Name: index_people_on_personable_type_and_personable_id; Type: INDEX; Schema: public; Owner: dev; Tablespace: 
--

CREATE INDEX index_people_on_personable_type_and_personable_id ON people USING btree (personable_type, personable_id);


--
-- Name: index_professors_on_medical_data_id; Type: INDEX; Schema: public; Owner: dev; Tablespace: 
--

CREATE INDEX index_professors_on_medical_data_id ON professors USING btree (medical_data_id);


--
-- Name: index_professors_on_people_id; Type: INDEX; Schema: public; Owner: dev; Tablespace: 
--

CREATE INDEX index_professors_on_people_id ON professors USING btree (people_id);


--
-- Name: index_schools_on_location_id; Type: INDEX; Schema: public; Owner: dev; Tablespace: 
--

CREATE INDEX index_schools_on_location_id ON schools USING btree (location_id);


--
-- Name: index_users_on_email; Type: INDEX; Schema: public; Owner: dev; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_email ON users USING btree (email);


--
-- Name: index_users_on_reset_password_token; Type: INDEX; Schema: public; Owner: dev; Tablespace: 
--

CREATE UNIQUE INDEX index_users_on_reset_password_token ON users USING btree (reset_password_token);


--
-- Name: unique_schema_migrations; Type: INDEX; Schema: public; Owner: dev; Tablespace: 
--

CREATE UNIQUE INDEX unique_schema_migrations ON schema_migrations USING btree (version);


--
-- Name: fk_rails_6e95eb6fec; Type: FK CONSTRAINT; Schema: public; Owner: dev
--

ALTER TABLE ONLY delegations
    ADD CONSTRAINT fk_rails_6e95eb6fec FOREIGN KEY (country_id) REFERENCES countries(id);


--
-- PostgreSQL database dump complete
--

