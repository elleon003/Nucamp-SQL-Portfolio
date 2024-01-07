--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

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
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- Name: events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events (
    event_id integer NOT NULL,
    title character varying(128) NOT NULL,
    description text,
    date timestamp without time zone NOT NULL,
    price double precision,
    presenter_id integer NOT NULL,
    start_time time without time zone,
    end_time time without time zone
);


ALTER TABLE public.events OWNER TO postgres;

--
-- Name: events_event_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.events_event_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.events_event_id_seq OWNER TO postgres;

--
-- Name: events_event_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.events_event_id_seq OWNED BY public.events.event_id;


--
-- Name: events_tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events_tags (
    event_id integer NOT NULL,
    tag_id integer NOT NULL
);


ALTER TABLE public.events_tags OWNER TO postgres;

--
-- Name: presenters; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.presenters (
    presenter_id integer NOT NULL,
    name character varying(128) NOT NULL,
    email character varying(128) NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.presenters OWNER TO postgres;

--
-- Name: presenters_presenter_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.presenters_presenter_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.presenters_presenter_id_seq OWNER TO postgres;

--
-- Name: presenters_presenter_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.presenters_presenter_id_seq OWNED BY public.presenters.presenter_id;


--
-- Name: tags; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.tags (
    tag_id integer NOT NULL,
    title character varying(120) NOT NULL
);


ALTER TABLE public.tags OWNER TO postgres;

--
-- Name: tags_tag_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.tags_tag_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.tags_tag_id_seq OWNER TO postgres;

--
-- Name: tags_tag_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.tags_tag_id_seq OWNED BY public.tags.tag_id;


--
-- Name: ticket_orders; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.ticket_orders (
    order_id integer NOT NULL,
    total double precision NOT NULL,
    date_reserved timestamp without time zone NOT NULL,
    event_id integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.ticket_orders OWNER TO postgres;

--
-- Name: ticket_orders_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ticket_orders_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ticket_orders_order_id_seq OWNER TO postgres;

--
-- Name: ticket_orders_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ticket_orders_order_id_seq OWNED BY public.ticket_orders.order_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    first_name character varying(128) NOT NULL,
    last_name character varying(128) NOT NULL,
    email character varying(128) NOT NULL
);


ALTER TABLE public.users OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO postgres;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: events event_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events ALTER COLUMN event_id SET DEFAULT nextval('public.events_event_id_seq'::regclass);


--
-- Name: presenters presenter_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presenters ALTER COLUMN presenter_id SET DEFAULT nextval('public.presenters_presenter_id_seq'::regclass);


--
-- Name: tags tag_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags ALTER COLUMN tag_id SET DEFAULT nextval('public.tags_tag_id_seq'::regclass);


--
-- Name: ticket_orders order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket_orders ALTER COLUMN order_id SET DEFAULT nextval('public.ticket_orders_order_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
8b8958195f81
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events (event_id, title, description, date, price, presenter_id, start_time, end_time) FROM stdin;
1	Mean Season, The	Unsp traum displ spondylolysis of fifth cervcal vert, init	2024-05-09 00:00:00	79.85	2	19:41:00	23:03:00
2	Love at Large	Postproc seroma of skin, subcu fol a dermatologic procedure	2024-07-20 00:00:00	24.5	4	00:43:00	20:10:00
3	Forgiveness of Blood, The (Falja e gjakut)	Spontaneous rupture of flexor tendons, lower leg	2024-07-21 00:00:00	92.1	3	02:16:00	08:31:00
4	Perfect Crime, The (Crimen Ferpecto) (Ferpect Crime)	Nondisp fx of greater tuberosity of unsp humerus, init	2024-01-17 00:00:00	85.67	4	00:45:00	06:26:00
5	Prowl	Sltr-haris Type IV physeal fx unspecified metatarsal, init	2024-01-17 00:00:00	69.17	2	04:41:00	02:25:00
6	Out in the Dark	Other specified injury of superior vena cava, sequela	2024-01-10 00:00:00	42.05	4	16:40:00	21:54:00
7	Greatest Love, The (Europa '51)	Abrasion of right ring finger	2024-05-06 00:00:00	48.54	2	04:24:00	09:03:00
8	Björk at the Royal Opera House	Nondisp oblique fx shaft of humer, unsp arm, 7thK	2024-05-27 00:00:00	73.61	4	08:29:00	23:40:00
9	Steamboat Bill, Jr.	Other specified disorders of synovium, right hand	2024-05-07 00:00:00	23.6	2	04:31:00	15:07:00
10	Otaku	Fx unspecified part of body of right mandible, sequela	2024-05-23 00:00:00	71.24	1	09:01:00	22:28:00
11	Rocks (Rad, Das)	Unsp injury of musc/fasc/tend at wrs/hnd lv, left hand	2024-06-14 00:00:00	26.71	4	17:07:00	02:41:00
12	Jade	Inferior dislocation of left humerus, subsequent encounter	2024-03-17 00:00:00	66.37	3	08:40:00	07:08:00
13	Crocodile Dundee in Los Angeles	Passenger on bus injured in clsn w unsp mv nontraf, init	2024-07-22 00:00:00	40.89	4	17:39:00	16:26:00
14	Merchants of Doubt	Laceration w/o foreign body of unsp part of head, init	2024-04-06 00:00:00	75.19	3	07:00:00	15:33:00
15	Children of the Corn 666: Isaac's Return	Sedative, hypnotic or anxiolytic-related use, unspecified	2024-04-09 00:00:00	93.82	5	07:05:00	00:52:00
16	Hold Back the Dawn	Ped w convey injured in collision w pedl cyc in traf, subs	2024-07-27 00:00:00	70.59	1	03:15:00	10:35:00
17	Scandal (Shubun)	Oth specific arthropathies, NEC, right shoulder	2024-06-02 00:00:00	49.34	1	17:30:00	09:01:00
18	Scooby-Doo! Camp Scare	Drug/chem diab with prolif diab rtnop with trctn dtch macula	2024-01-25 00:00:00	75.9	5	00:47:00	12:05:00
19	Vivre sa vie: Film en douze tableaux (My Life to Live)	Drusen (degenerative) of macula, unspecified eye	2024-05-22 00:00:00	97.27	4	12:20:00	18:00:00
20	Port of Shadows (Quai des brumes)	Ototoxic hearing loss, bilateral	2024-05-26 00:00:00	60.83	1	19:57:00	08:35:00
21	Who Am I? (Wo shi shei)	Hypotension	2024-03-10 00:00:00	14.2	5	18:08:00	01:06:00
22	Merlin	Disp fx of lateral epicondyl of unsp humer, 7thK	2024-02-23 00:00:00	47.76	1	16:18:00	06:42:00
23	Carne de gallina (Chicken Skin)	Stiffness of hand, not elsewhere classified	2024-06-01 00:00:00	35.49	2	06:55:00	05:02:00
24	Exorcism of Emily Rose, The	Other specified osteochondropathies, right ankle and foot	2024-04-01 00:00:00	48.85	1	21:04:00	22:22:00
25	Stockholm, Pennsylvania	Other superficial bite of abdominal wall	2024-07-18 00:00:00	28.7	4	06:23:00	20:25:00
\.


--
-- Data for Name: events_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events_tags (event_id, tag_id) FROM stdin;
6	8
6	7
3	4
2	1
13	9
19	7
14	1
10	1
20	6
4	8
\.


--
-- Data for Name: presenters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.presenters (presenter_id, name, email, user_id) FROM stdin;
1	Cremin, Dare and Kulas	enorker0@va.gov	1
2	Sanford, Greenholt and Robel	dmacturlough1@infoseek.co.jp	1
3	Thiel and Sons	aheake2@abc.net.au	8
4	Carroll-Bechtelar	cjime3@irs.gov	7
5	Bogisich, Maggio and Moore	bredler4@is.gd	6
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tags (tag_id, title) FROM stdin;
1	Opela
2	Bytecard
3	Voltsillam
4	Asoka
5	Lotstring
6	Zoolab
7	Matsoft
8	Flexidy
9	Tampflex
10	Overhold
\.


--
-- Data for Name: ticket_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ticket_orders (order_id, total, date_reserved, event_id, user_id) FROM stdin;
\.


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.users (user_id, first_name, last_name, email) FROM stdin;
1	Hercules	Findon	hfindon0@aol.com
2	Tilly	Cavozzi	tcavozzi1@ning.com
3	Elnore	Fogarty	efogarty2@cpanel.net
4	Carmelia	Riding	criding3@un.org
5	Paule	Squibbs	psquibbs4@zdnet.com
6	Der	Kopke	dkopke5@globo.com
7	Fabien	Henryson	fhenryson6@moonfruit.com
8	Jasun	Clemenzi	jclemenzi7@cpanel.net
9	Richard	Lynch	rlynch8@jiathis.com
10	Wright	O'Shavlan	woshavlan9@geocities.com
\.


--
-- Name: events_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.events_event_id_seq', 25, true);


--
-- Name: presenters_presenter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.presenters_presenter_id_seq', 5, true);


--
-- Name: tags_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tags_tag_id_seq', 10, true);


--
-- Name: ticket_orders_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ticket_orders_order_id_seq', 1, false);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.users_user_id_seq', 10, true);


--
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (event_id);


--
-- Name: events_tags events_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events_tags
    ADD CONSTRAINT events_tags_pkey PRIMARY KEY (event_id, tag_id);


--
-- Name: presenters presenters_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presenters
    ADD CONSTRAINT presenters_pkey PRIMARY KEY (presenter_id);


--
-- Name: tags tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_pkey PRIMARY KEY (tag_id);


--
-- Name: ticket_orders ticket_orders_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket_orders
    ADD CONSTRAINT ticket_orders_pkey PRIMARY KEY (order_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: events events_presenter_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_presenter_id_fkey FOREIGN KEY (presenter_id) REFERENCES public.presenters(presenter_id);


--
-- Name: events_tags events_tags_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events_tags
    ADD CONSTRAINT events_tags_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.events(event_id);


--
-- Name: events_tags events_tags_tag_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events_tags
    ADD CONSTRAINT events_tags_tag_id_fkey FOREIGN KEY (tag_id) REFERENCES public.tags(tag_id);


--
-- Name: presenters presenters_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presenters
    ADD CONSTRAINT presenters_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- Name: ticket_orders ticket_orders_event_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket_orders
    ADD CONSTRAINT ticket_orders_event_id_fkey FOREIGN KEY (event_id) REFERENCES public.events(event_id);


--
-- Name: ticket_orders ticket_orders_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket_orders
    ADD CONSTRAINT ticket_orders_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

