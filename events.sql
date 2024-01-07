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
-- Name: customers; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.customers (
    customer_id integer NOT NULL,
    first_name character(75) NOT NULL,
    last_name character(175) NOT NULL,
    email character(325) NOT NULL,
    presenter_id integer
);


ALTER TABLE public.customers OWNER TO postgres;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.customers_customer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.customers_customer_id_seq OWNER TO postgres;

--
-- Name: customers_customer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.customers_customer_id_seq OWNED BY public.customers.customer_id;


--
-- Name: events; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.events (
    event_id integer NOT NULL,
    title character(128) NOT NULL,
    description text,
    date timestamp without time zone NOT NULL,
    price numeric,
    presenter_id integer NOT NULL
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
    name character(75) NOT NULL,
    email character(325) NOT NULL,
    customer_id integer
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
    title character(150) NOT NULL
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
    ticket_order_id integer NOT NULL,
    total_price numeric DEFAULT 0.00 NOT NULL,
    ticket_qty integer NOT NULL,
    event_id integer NOT NULL,
    customer_id integer
);


ALTER TABLE public.ticket_orders OWNER TO postgres;

--
-- Name: ticket_order_ticket_order_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.ticket_order_ticket_order_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.ticket_order_ticket_order_id_seq OWNER TO postgres;

--
-- Name: ticket_order_ticket_order_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.ticket_order_ticket_order_id_seq OWNED BY public.ticket_orders.ticket_order_id;


--
-- Name: customers customer_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers ALTER COLUMN customer_id SET DEFAULT nextval('public.customers_customer_id_seq'::regclass);


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
-- Name: ticket_orders ticket_order_id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket_orders ALTER COLUMN ticket_order_id SET DEFAULT nextval('public.ticket_order_ticket_order_id_seq'::regclass);


--
-- Data for Name: customers; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.customers (customer_id, first_name, last_name, email, presenter_id) FROM stdin;
\.


--
-- Data for Name: events; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events (event_id, title, description, date, price, presenter_id) FROM stdin;
\.


--
-- Data for Name: events_tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.events_tags (event_id, tag_id) FROM stdin;
\.


--
-- Data for Name: presenters; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.presenters (presenter_id, name, email, customer_id) FROM stdin;
\.


--
-- Data for Name: tags; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.tags (tag_id, title) FROM stdin;
\.


--
-- Data for Name: ticket_orders; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.ticket_orders (ticket_order_id, total_price, ticket_qty, event_id, customer_id) FROM stdin;
\.


--
-- Name: customers_customer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.customers_customer_id_seq', 1, false);


--
-- Name: events_event_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.events_event_id_seq', 1, false);


--
-- Name: presenters_presenter_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.presenters_presenter_id_seq', 1, false);


--
-- Name: tags_tag_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.tags_tag_id_seq', 1, false);


--
-- Name: ticket_order_ticket_order_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.ticket_order_ticket_order_id_seq', 1, false);


--
-- Name: customers customers_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_email_key UNIQUE (email);


--
-- Name: customers customers_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT customers_pkey PRIMARY KEY (customer_id);


--
-- Name: events events_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_pkey PRIMARY KEY (event_id);


--
-- Name: events events_presenter_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT events_presenter_id_key UNIQUE (presenter_id);


--
-- Name: events_tags events_tags_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events_tags
    ADD CONSTRAINT events_tags_pkey PRIMARY KEY (event_id, tag_id);


--
-- Name: presenters presenters_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presenters
    ADD CONSTRAINT presenters_email_key UNIQUE (email);


--
-- Name: presenters presenters_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presenters
    ADD CONSTRAINT presenters_name_key UNIQUE (name);


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
-- Name: tags tags_title_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.tags
    ADD CONSTRAINT tags_title_key UNIQUE (title);


--
-- Name: ticket_orders ticket_order_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket_orders
    ADD CONSTRAINT ticket_order_pkey PRIMARY KEY (ticket_order_id);


--
-- Name: customers fk_customers_presenters; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.customers
    ADD CONSTRAINT fk_customers_presenters FOREIGN KEY (presenter_id) REFERENCES public.presenters(presenter_id);


--
-- Name: events fk_events_presenters; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events
    ADD CONSTRAINT fk_events_presenters FOREIGN KEY (presenter_id) REFERENCES public.presenters(presenter_id);


--
-- Name: events_tags fk_events_tags_events; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events_tags
    ADD CONSTRAINT fk_events_tags_events FOREIGN KEY (event_id) REFERENCES public.events(event_id);


--
-- Name: events_tags fk_events_tags_tags; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.events_tags
    ADD CONSTRAINT fk_events_tags_tags FOREIGN KEY (tag_id) REFERENCES public.tags(tag_id);


--
-- Name: presenters fk_presenters_customers; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.presenters
    ADD CONSTRAINT fk_presenters_customers FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);


--
-- Name: ticket_orders fk_ticket_orders_customers; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket_orders
    ADD CONSTRAINT fk_ticket_orders_customers FOREIGN KEY (customer_id) REFERENCES public.customers(customer_id);


--
-- Name: ticket_orders fk_ticket_orders_events; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.ticket_orders
    ADD CONSTRAINT fk_ticket_orders_events FOREIGN KEY (event_id) REFERENCES public.events(event_id);


--
-- PostgreSQL database dump complete
--

