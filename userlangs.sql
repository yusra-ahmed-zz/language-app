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
    password character varying(250) NOT NULL,
    age integer,
    city character varying(30) NOT NULL,
    zipcode character varying(15) NOT NULL,
    user_bio character varying(500),
    profile_photo character varying(500)
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
1	1	2	f
2	1	1	t
3	2	1	f
4	2	2	t
5	3	2	f
6	3	1	t
7	4	1	f
8	4	2	t
9	5	2	f
10	5	1	t
11	6	1	f
12	6	2	t
13	7	2	f
14	7	1	t
15	8	1	f
16	8	2	t
17	9	2	f
18	9	1	t
21	11	9	f
22	11	1	t
23	12	1	f
24	12	9	t
25	13	9	f
26	13	1	t
27	14	1	f
28	14	9	t
29	15	9	f
30	15	1	t
31	16	1	f
32	16	9	t
33	17	9	f
34	17	1	t
35	18	1	f
36	18	9	t
37	19	9	f
38	19	1	t
39	20	1	f
40	20	9	t
43	22	1	f
44	22	2	t
45	23	2	f
46	23	1	t
47	24	2	f
48	24	1	t
53	27	2	f
54	27	1	t
55	28	9	f
56	28	1	t
57	29	2	f
58	29	1	t
\.


--
-- Name: userlangs_userlang_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('userlangs_userlang_id_seq', 58, true);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: vagrant
--

COPY users (user_id, full_name, username, email, password, age, city, zipcode, user_bio, profile_photo) FROM stdin;
1	Julia Holmes	jholmes0	jholmes0@xing.com	Tzwedj8IaC3	33	San Francisco	94123	Proin interdum mauris non ligula pellentesque ultrices. Phasellus id sapien in sapien iaculis congue. Vivamus metus arcu, adipiscing molestie, hendrerit at, vulputate vitae, nisl.\n\nAenean lectus. Pellentesque eget nunc. Donec quis orci eget orci vehicula condimentum.	http://media.istockphoto.com/photos/smiling-selfie-picture-id517224488?s=235x235
2	Brian Meyer	bmeyer1	bmeyer1@digg.com	SpxCKLF3dMk7	22	San Francisco	94123	Pellentesque at nulla. Suspendisse potenti. Cras in purus eu magna vulputate luctus.\n\nCum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus. Vivamus vestibulum sagittis sapien. Cum sociis natoque penatibus et magnis dis parturient montes, nascetur ridiculus mus.	http://media.istockphoto.com/photos/family-boat-ride-picture-id528634560?s=235x235
3	Maria Hunter	mhunter2	mhunter2@livejournal.com	8yuagH	73	San Francisco	94123	Duis consequat dui nec nisi volutpat eleifend. Donec ut dolor. Morbi vel lectus in quam fringilla rhoncus.\n\nMauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.	http://media.istockphoto.com/photos/family-selfie-in-the-nature-picture-id498919490?s=235x235
4	Anna Torres	atorres3	atorres3@ezinearticles.com	uRjgCO	77	San Francisco	94123	In quis justo. Maecenas rhoncus aliquam lacus. Morbi quis tortor id nulla ultrices aliquet.	http://media.istockphoto.com/photos/french-bulldog-taking-a-selfie-picture-id499374414?s=235x235
5	Bobby Stone	bstone4	bstone4@baidu.com	ok3uo8acryr	50	San Francisco	94123	Maecenas leo odio, condimentum id, luctus nec, molestie sed, justo. Pellentesque viverra pede ac diam. Cras pellentesque volutpat dui.\n\nMaecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.	http://media.istockphoto.com/photos/girl-holding-instant-selfie-picture-id491117556?s=235x235
6	Jason Diaz	jdiaz5	jdiaz5@ucla.edu	XvCDZCmwXoHY	49	San Francisco	94123	Mauris enim leo, rhoncus sed, vestibulum sit amet, cursus id, turpis. Integer aliquet, massa id lobortis convallis, tortor risus dapibus augue, vel accumsan tellus nisi eu orci. Mauris lacinia sapien quis libero.	http://media.istockphoto.com/photos/dog-portrait-picture-id474746577?s=235x235
7	Terry Hart	thart6	thart6@yellowbook.com	eHVmmu3KH	52	San Francisco	94123	Donec diam neque, vestibulum eget, vulputate ut, ultrices vel, augue. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Donec pharetra, magna vestibulum aliquet ultrices, erat tortor sollicitudin mi, sit amet lobortis sapien sapien non mi. Integer ac neque.	http://media.istockphoto.com/photos/outdoor-summer-portrait-of-young-woman-in-sunny-day-jeans-picture-id498338380?s=235x235
8	Brandon Rogers	brogers7	brogers7@si.edu	xU1fxtwj	65	San Francisco	94123	Vestibulum ac est lacinia nisi venenatis tristique. Fusce congue, diam id ornare imperdiet, sapien urna pretium nisl, ut volutpat sapien arcu sed augue. Aliquam erat volutpat.\n\nIn congue. Etiam justo. Etiam pretium iaculis justo.	http://media.istockphoto.com/photos/parisian-selfie-picture-id478130948?s=235x235
9	Jimmy Ward	jward8	jward8@unblog.fr	FfKqpdFkL	56	San Francisco	94123	Morbi porttitor lorem id ligula. Suspendisse ornare consequat lectus. In est risus, auctor sed, tristique in, tempus sit amet, sem.\n\nFusce consequat. Nulla nisl. Nunc nisl.	http://media.istockphoto.com/photos/five-friends-fool-around-taking-silly-selfie-picture-id498444603?s=235x235
11	Larry Willis	lwillisa	lwillisa@blogger.com	NKxZvw0YQ4	78	San Francisco	94123	Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.\n\nCras non velit nec nisi vulputate nonummy. Maecenas tincidunt lacus at velit. Vivamus vel nulla eget eros elementum pellentesque.	http://media.istockphoto.com/photos/cat-sleeping-by-a-window-picture-id174178471?s=235x235
12	Ann Rivera	ariverab	ariverab@nhs.uk	0fBdc8qaUD	36	San Francisco	94123	Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.	http://media.istockphoto.com/photos/flying-multicolored-balloons-picture-id504611320?s=235x235
13	Mary Mills	mmillsc	mmillsc@amazonaws.com	YqIrPzo	29	San Francisco	94123	Maecenas tristique, est et tempus semper, est quam pharetra magna, ac consequat metus sapien ut nunc. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia Curae; Mauris viverra diam vitae quam. Suspendisse potenti.	http://media.istockphoto.com/photos/freedom-traveler-woman-picture-id585797228?s=235x235
14	Richard Davis	rdavisd	rdavisd@skyrock.com	XfvxeIefj	65	San Francisco	94123	Morbi non lectus. Aliquam sit amet diam in magna bibendum imperdiet. Nullam orci pede, venenatis non, sodales sed, tincidunt eu, felis.\n\nFusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.	http://media.istockphoto.com/photos/cat-taking-a-selfie-picture-id500280363?s=235x235
15	Sandra Simmons	ssimmonse	ssimmonse@hp.com	N55SfxpjsStw	62	San Francisco	94123	Nullam porttitor lacus at turpis. Donec posuere metus vitae ipsum. Aliquam non mauris.	http://media.istockphoto.com/photos/selfie-dogs-picture-id488938505?s=235x235
16	Emily Hicks	ehicksf	ehicksf@dot.gov	yrUfqdOag	42	San Francisco	94123	Fusce posuere felis sed lacus. Morbi sem mauris, laoreet ut, rhoncus aliquet, pulvinar sed, nisl. Nunc rhoncus dui vel sem.	http://media.istockphoto.com/photos/young-woman-holding-a-coffee-picture-id187993228?s=235x235
17	Jennifer Robertson	jrobertsong	jrobertsong@hostgator.com	3rvtnDjKJY3O	61	San Francisco	94123	Integer tincidunt ante vel ipsum. Praesent blandit lacinia erat. Vestibulum sed magna at nunc commodo placerat.	http://media.istockphoto.com/photos/summer-travel-picture-id513420881?s=235x235
18	Jonathan Wells	jwellsh	jwellsh@tinyurl.com	OpYlxppslS	29	San Francisco	94123	Nulla ut erat id mauris vulputate elementum. Nullam varius. Nulla facilisi.	http://media.istockphoto.com/photos/snaap-a-self-portrait-of-the-good-times-picture-id161312818?s=235x235
19	Betty Henderson	bhendersoni	bhendersoni@tamu.edu	yNX3T15skuz	61	San Francisco	94123	Praesent id massa id nisl venenatis lacinia. Aenean sit amet justo. Morbi ut odio.	http://media.istockphoto.com/photos/chinese-woman-self-photographing-in-london-picture-id469868393?s=235x235
20	Shirley Reid	sreidj	sreidj@vimeo.com	gVI5O6JdeQH	66	San Francisco	94123	Duis bibendum, felis sed interdum venenatis, turpis enim blandit mi, in porttitor pede justo eu massa. Donec dapibus. Duis at velit eu est congue elementum.	http://media.istockphoto.com/photos/smiling-friends-on-a-beach-picture-id457208271?s=235x235
23	Chloe Condon	Chloe	misschloecondon@gmail.com	$2b$12$31BsLbCvdQSiGOy.oipzWeEgmeSj5olkAyLeSi1fSKBXxcAf2Ho9K	27	San Francisco	94123	I'm sassy!	https://scontent.fsnc1-2.fna.fbcdn.net/v/t1.0-9/14705884_10209578401751310_4417489286811714992_n.jpg?oh=297a43e839555d84a0f4657e09339beb&oe=58C9EE5D
28	Yusra Ahmed	Yusra	yusra.ahmed05@gmail.com	$2b$12$pXI9oGjtXAwfoKPoZjEUcusjdXwwPfHCQ0wX/w9uFWKaSw7kTU.OK	29	San Francisco	94123	Paleo humblebrag small batch tacos, williamsburg dreamcatcher cray. Skateboard pabst lo-fi tattooed kale chips. 90's DIY hell of blue bottle. Venmo fixie brooklyn, taxidermy next level tacos small batch vaporware. Wolf austin brooklyn pickled, chia etsy humblebrag mixtape echo park. 	https://scontent.fsnc1-2.fna.fbcdn.net/v/t1.0-9/14102375_10108113865964500_2117126349999426860_n.jpg?oh=a9c9be2e975ce9da8c4e9986454a36c6&oe=58BEF505
27	Ally McKnight	Ally	ally@ally.com	$2b$12$xN.TQg8nvwqpWE5j8DDElOyRE/vl1RvblFOr5bfJf5wwnZGvpWVQq	42	San Francisco	94123	I want actual words	
29	Sample	Sample	sample@sample.com	$2b$12$zrohvXwGGEWc7Pj9xVTgheHfaMcMN6n2KW4qo0QkQDk8ffYA.X/pG	3	San Francisco	94123		
22	David Guaraglia	David	david@david.com	$2b$12$K.xNrvNF.NeuOw.nMF44Oe6zYkKjmxiex3llLsSAhJ7n2ULjWYn..	29	San Francisco	94123	Vinyl williamsburg vegan, green juice fam la croix unicorn kickstarter quinoa coloring book tattooed tousled ethical letterpress artisan. IPhone asymmetrical quinoa, pop-up cornhole listicle dreamcatcher hashtag godard meh photo booth mlkshk vape. Kitsch pickled succulents keffiyeh. Twee aesthetic tote bag fam forage, chicharrones la croix squid. Copper mug narwhal mixtape kitsch, meh chambray cred yuccie YOLO portland mustache hell of blue bottle keytar.	https://s21.postimg.org/amwxg7kh3/467118_3426325975361_733792994_o.jpg
24	Tiffany Hakseth	Tiffany	tiffany@tiffany.com	$2b$12$Fj6DTeWMnoRL5L76S6Snku2oLRX2FjyoJXbd8NIJIfdI.GqNYfHXm	29	San Francisco	94123	Paleo humblebrag small batch tacos, williamsburg dreamcatcher cray. Skateboard pabst lo-fi tattooed kale chips. 90's DIY hell of blue bottle. Venmo fixie brooklyn, taxidermy next level tacos small batch vaporware. Wolf austin brooklyn pickled, chia etsy humblebrag mixtape echo park. Direct trade lumbersexual kinfolk, live-edge activated charcoal put a bird on it chillwave street art.	https://scontent.fsnc1-2.fna.fbcdn.net/v/t1.0-9/14963382_949260743144_7203462464835566674_n.jpg?oh=de7cd0ad4913af7d33c417952e149bf8&oe=58C91C47
\.


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: vagrant
--

SELECT pg_catalog.setval('users_user_id_seq', 29, true);


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
-- Name: users_email_key; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_email_key UNIQUE (email);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users_username_key; Type: CONSTRAINT; Schema: public; Owner: vagrant
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_username_key UNIQUE (username);


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

