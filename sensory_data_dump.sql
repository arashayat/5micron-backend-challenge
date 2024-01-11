--
-- PostgreSQL database dump
--

-- Dumped from database version 14.10 (Ubuntu 14.10-0ubuntu0.22.04.1)
-- Dumped by pg_dump version 14.10 (Ubuntu 14.10-0ubuntu0.22.04.1)

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
-- Name: sensory_data; Type: TABLE; Schema: public; Owner: fivemicron
--

CREATE TABLE public.sensory_data (
    id integer NOT NULL,
    serial text NOT NULL,
    "swVersion" text NOT NULL,
    temperature real NOT NULL,
    date timestamp with time zone NOT NULL,
    gps point NOT NULL
);


ALTER TABLE public.sensory_data OWNER TO fivemicron;

--
-- Name: sensory_data_id_seq; Type: SEQUENCE; Schema: public; Owner: fivemicron
--

CREATE SEQUENCE public.sensory_data_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sensory_data_id_seq OWNER TO fivemicron;

--
-- Name: sensory_data_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: fivemicron
--

ALTER SEQUENCE public.sensory_data_id_seq OWNED BY public.sensory_data.id;


--
-- Name: sensory_data id; Type: DEFAULT; Schema: public; Owner: fivemicron
--

ALTER TABLE ONLY public.sensory_data ALTER COLUMN id SET DEFAULT nextval('public.sensory_data_id_seq'::regclass);


--
-- Data for Name: sensory_data; Type: TABLE DATA; Schema: public; Owner: fivemicron
--

COPY public.sensory_data (id, serial, "swVersion", temperature, date, gps) FROM stdin;
1	TEM-000001	01-01	28	2023-04-17 12:22:43+02	(52.52,12.04)
4	TEM-997391	15-53	16	2024-01-11 12:15:12+01	(15.25,-24.01)
5	TEM-496572	08-52	31	2024-01-11 12:15:12+01	(53.85,-50.41)
6	TEM-904502	37-27	40	2024-01-11 12:15:12+01	(-11.48,-149.06)
\.


--
-- Name: sensory_data_id_seq; Type: SEQUENCE SET; Schema: public; Owner: fivemicron
--

SELECT pg_catalog.setval('public.sensory_data_id_seq', 6, true);


--
-- Name: sensory_data sensory_data_pkey; Type: CONSTRAINT; Schema: public; Owner: fivemicron
--

ALTER TABLE ONLY public.sensory_data
    ADD CONSTRAINT sensory_data_pkey PRIMARY KEY (id);


--
-- PostgreSQL database dump complete
--

