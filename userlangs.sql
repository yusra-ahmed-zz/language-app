--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.4
-- Dumped by pg_dump version 9.5.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'LATIN1';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

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
-- Name: languages; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE languages (
    lang_id integer NOT NULL,
    lang_name character varying(50) NOT NULL
);


ALTER TABLE languages OWNER TO vagrant;

--
-- Name: languages_lang_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE languages_lang_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE languages_lang_id_seq OWNER TO vagrant;

--
-- Name: languages_lang_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE languages_lang_id_seq OWNED BY languages.lang_id;


--
-- Name: userlangs; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE userlangs (
    userlang_id integer NOT NULL,
    user_id integer,
    lang_id integer,
    fluent boolean
);


ALTER TABLE userlangs OWNER TO vagrant;

--
-- Name: userlangs_userlang_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE userlangs_userlang_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE userlangs_userlang_id_seq OWNER TO vagrant;

--
-- Name: userlangs_userlang_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE userlangs_userlang_id_seq OWNED BY userlangs.userlang_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: vagrant
--

CREATE TABLE users (
    user_id integer NOT NULL,
    full_name character varying(50) NOT NULL,
    username character varying(30) NOT NULL,
    email character varying(50) NOT NULL,
    password character varying(30) NOT NULL,
    age integer,
    city character varying(30) NOT NULL,
    zipcode character varying(15) NOT NULL,
    user_bio character varying(300)
);


ALTER TABLE users OWNER TO vagrant;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: vagrant
--

CREATE SEQUENCE users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_user_id_seq OWNER TO vagrant;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: vagrant
--

ALTER SEQUENCE users_user_id_seq OWNED BY users.user_id;


--
-- Name: lang_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY languages ALTER COLUMN lang_id SET DEFAULT nextval('languages_lang_id_seq'::regclass);


--
-- Name: userlang_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY userlangs ALTER COLUMN userlang_id SET DEFAULT nextval('userlangs_userlang_id_seq'::regclass);


--
-- Name: user_id; Type: DEFAULT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY users ALTER COLUMN user_id SET DEFAULT nextval('users_user_id_seq'::regclass);


--
-- Data for Name: languages; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY languages (lang_id, lang_name) FROM stdin;
1	English
2	Spanish
3	Chinese
4	French
5	Tagalog
6	Vietnamese
7	Korean
8	German
9	Arabic
10	Russian
11	Punjabi
12	Marathi
13	Bengali
14	Italian
15	Portuguese
16	Hindi
17	Polish
18	Japanese
19	Persian
20	Urdu
21	Gujarati
22	Greek
23	Serbo-Croatian
24	Armenian
25	Hebrew
26	Khmer
27	Hmong
28	Navajo
29	Thai
30	Yiddish
31	Laotian
32	Tamil
33	Nepali
34	American Sign Language
\.


--
-- Name: languages_lang_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('languages_lang_id_seq', 34, true);


--
-- Data for Name: userlangs; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY userlangs (userlang_id, user_id, lang_id, fluent) FROM stdin;
1	2	1	t
2	2	2	t
3	2	3	f
4	20	8	f
5	20	1	t
6	21	1	f
7	21	8	t
8	22	8	f
9	22	9	t
\.


--
-- Name: userlangs_userlang_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('userlangs_userlang_id_seq', 9, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY users (user_id, full_name, username, email, password, age, city, zipcode, user_bio) FROM stdin;
1	Roy Harrison	rharrison0	rharrison0@php.net	Ue7gv66R8	50	Slovenski Javornik		
2	Terry Ward	tward1	tward1@slate.com	jb5GijJWl	31	Lidingö	181 72	
3	Sandra Washington	swashington2	swashington2@virginia.edu	2txawoCg1	53	Gaohe		
4	Henry Larson	hlarson3	hlarson3@paginegialle.it	AK0bnfb	20	Dayeuhluhur		
5	Christopher White	cwhite4	cwhite4@moonfruit.com	FFbFrkv9H9me	58	Mbandaka		
6	Sean Weaver	sweaver5	sweaver5@vistaprint.com	9Xy9YKh	44	Kobylanka		
7	Maria Ray	mray6	mray6@whitehouse.gov	oyzLRi	25	Murree		
8	Sara Hunt	shunt7	shunt7@naver.com	NLWoydbe5RAj	32	Jermenovci		
9	Annie Stone	astone8	astone8@sbwire.com	1NMYSQF1C	58	Dongjin		
10	Sharon Moore	smoore9	smoore9@washingtonpost.com	keNc9haMHCDb	55	Hua Sai		
11	Jerry Little	jlittlea	jlittlea@intel.com	hzWFJb	58	Wakimachi		
12	Jessica Stephens	jstephensb	jstephensb@issuu.com	3ReFDFq	19	San Jerónimo		
13	Antonio Kelly	akellyc	akellyc@photobucket.com	vomarsS	52	Kruty		
14	Larry Gonzalez	lgonzalezd	lgonzalezd@linkedin.com	9qqJOu	60	Cardona		
15	Bruce Kelly	bkellye	bkellye@symantec.com	T3XTFw8h	30	Nässjö	57192	
16	Yusra	yusra	yusra@yusra.com	yusra	29	San-Francisco	94123	\N
17	Yusra	yusra	yusra.ahmed05@gmail.com	yusra	29	San-Francisco	94123	\N
18	Katie Byers	katie	katie@katie.com	katie	29	San-Francisco	94123	\N
19	Chloe	Chloe	chloe@chloe.com	chloe	29	San-Francisco	94123	\N
20	Uzma	uzma	uzma@uzma.com	uzma	29	San-Francisco	94123	\N
21	Zeeshan	zeeshan	zeeshan@zeeshan.com	zeeshan	29	San-Francisco	94123	\N
22	Jene	jene	jene@jene.com	jene	29	San-Francisco	94123	\N
\.


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('users_user_id_seq', 22, true);


--
-- Name: languages_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY languages
    ADD CONSTRAINT languages_pkey PRIMARY KEY (lang_id);


--
-- Name: userlangs_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY userlangs
    ADD CONSTRAINT userlangs_pkey PRIMARY KEY (userlang_id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: userlangs_lang_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY userlangs
    ADD CONSTRAINT userlangs_lang_id_fkey FOREIGN KEY (lang_id) REFERENCES languages(lang_id);


--
-- Name: userlangs_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY userlangs
    ADD CONSTRAINT userlangs_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

