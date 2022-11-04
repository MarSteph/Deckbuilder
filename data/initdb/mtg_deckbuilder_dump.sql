--
-- PostgreSQL database dump
--

-- Dumped from database version 14.1
-- Dumped by pg_dump version 14.1

-- Started on 2022-10-08 13:40:59 UTC

\connect mtg_deckbuilder

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
-- TOC entry 211 (class 1259 OID 18812)
-- Name: accounts; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.accounts (
    id integer NOT NULL,
    username text NOT NULL,
    password text NOT NULL,
    email text NOT NULL
);


ALTER TABLE public.accounts OWNER TO postgres;

--
-- TOC entry 210 (class 1259 OID 18811)
-- Name: accounts_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.accounts_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.accounts_id_seq OWNER TO postgres;

--
-- TOC entry 3383 (class 0 OID 0)
-- Dependencies: 210
-- Name: accounts_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.accounts_id_seq OWNED BY public.accounts.id;


--
-- TOC entry 209 (class 1259 OID 18806)
-- Name: alembic_version; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.alembic_version (
    version_num character varying(32) NOT NULL
);


ALTER TABLE public.alembic_version OWNER TO postgres;

--
-- TOC entry 217 (class 1259 OID 18853)
-- Name: cards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.cards (
    id integer NOT NULL,
    name text NOT NULL,
    rarity text NOT NULL,
    type text NOT NULL,
    color_identity text NOT NULL,
    cmc integer NOT NULL,
    set_id integer NOT NULL
);


ALTER TABLE public.cards OWNER TO postgres;

--
-- TOC entry 216 (class 1259 OID 18852)
-- Name: cards_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.cards_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.cards_id_seq OWNER TO postgres;

--
-- TOC entry 3384 (class 0 OID 0)
-- Dependencies: 216
-- Name: cards_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.cards_id_seq OWNED BY public.cards.id;


--
-- TOC entry 215 (class 1259 OID 18839)
-- Name: decks; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.decks (
    id integer NOT NULL,
    name text NOT NULL,
    size integer NOT NULL,
    player_id integer NOT NULL
);


ALTER TABLE public.decks OWNER TO postgres;

--
-- TOC entry 218 (class 1259 OID 18863)
-- Name: decks_cards; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.decks_cards (
    deck_id integer NOT NULL,
    card_id integer NOT NULL
);


ALTER TABLE public.decks_cards OWNER TO postgres;

--
-- TOC entry 214 (class 1259 OID 18838)
-- Name: decks_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.decks_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.decks_id_seq OWNER TO postgres;

--
-- TOC entry 3385 (class 0 OID 0)
-- Dependencies: 214
-- Name: decks_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.decks_id_seq OWNED BY public.decks.id;


--
-- TOC entry 213 (class 1259 OID 18825)
-- Name: players; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.players (
    id integer NOT NULL,
    name text NOT NULL,
    account_id integer NOT NULL
);


ALTER TABLE public.players OWNER TO postgres;

--
-- TOC entry 212 (class 1259 OID 18824)
-- Name: players_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.players_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_id_seq OWNER TO postgres;

--
-- TOC entry 3386 (class 0 OID 0)
-- Dependencies: 212
-- Name: players_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.players_id_seq OWNED BY public.players.id;


--
-- TOC entry 220 (class 1259 OID 18879)
-- Name: sets; Type: TABLE; Schema: public; Owner: postgres
--

CREATE TABLE public.sets (
    id integer NOT NULL,
    name text NOT NULL
);


ALTER TABLE public.sets OWNER TO postgres;

--
-- TOC entry 219 (class 1259 OID 18878)
-- Name: sets_id_seq; Type: SEQUENCE; Schema: public; Owner: postgres
--

CREATE SEQUENCE public.sets_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.sets_id_seq OWNER TO postgres;

--
-- TOC entry 3387 (class 0 OID 0)
-- Dependencies: 219
-- Name: sets_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: postgres
--

ALTER SEQUENCE public.sets_id_seq OWNED BY public.sets.id;


--
-- TOC entry 3194 (class 2604 OID 18815)
-- Name: accounts id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts ALTER COLUMN id SET DEFAULT nextval('public.accounts_id_seq'::regclass);


--
-- TOC entry 3197 (class 2604 OID 18856)
-- Name: cards id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cards ALTER COLUMN id SET DEFAULT nextval('public.cards_id_seq'::regclass);


--
-- TOC entry 3196 (class 2604 OID 18842)
-- Name: decks id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.decks ALTER COLUMN id SET DEFAULT nextval('public.decks_id_seq'::regclass);


--
-- TOC entry 3195 (class 2604 OID 18828)
-- Name: players id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players ALTER COLUMN id SET DEFAULT nextval('public.players_id_seq'::regclass);


--
-- TOC entry 3198 (class 2604 OID 18882)
-- Name: sets id; Type: DEFAULT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sets ALTER COLUMN id SET DEFAULT nextval('public.sets_id_seq'::regclass);


--
-- TOC entry 3368 (class 0 OID 18812)
-- Dependencies: 211
-- Data for Name: accounts; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.accounts (id, username, password, email) FROM stdin;
1	bob123	1346	bob@example.com
3	tom796	my_password	tom@example.com
2	dylan54	e9f3300ae85c11c8346443f55e969d8e29d0958b7dba1b52cb63655b2d7726a402ab787b4e93a815db68b74e93c9494787b38c354edb2ea3551b3350f2f848f4	dylan@example.com
5	tim93	5d1e95f1865bcb8b60ca5c520844d964ec80c1fcc6d1d377e8da4dd3c3cbb0936e4682f924b9293bd28b0294f4185a2e9ad4f2a07f0d7997292db575be9d7a1e	tim@example.com
\.


--
-- TOC entry 3366 (class 0 OID 18806)
-- Dependencies: 209
-- Data for Name: alembic_version; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.alembic_version (version_num) FROM stdin;
b4e0392dba31
\.


--
-- TOC entry 3374 (class 0 OID 18853)
-- Dependencies: 217
-- Data for Name: cards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.cards (id, name, rarity, type, color_identity, cmc, set_id) FROM stdin;
3	Banishing Slash	Uncommon	Sorcery	White	2	3
4	Eiganjo Exemplar	Common	Enchantment Creature	White	2	3
5	Selfless Samurai	Uncommon	Creature	White	2	3
6	Infernal Grasp	Uncommon	Instant	Black	2	2
7	Life of Toshiro Umezawa	Uncommon	Enchantment - Saga	Black	2	3
8	Akki Ronin	Common	Creature	Red	2	3
9	Imperial Subduer	Common	Creature	White	3	3
10	Nezumi Bladeblesser	Common	Creature	Black	3	3
11	Risona, Asari Commander	Rare	Creature	Red-White	3	3
12	Isshin, Two Heavens as One	Rare	Creature	Red-White-Black	3	3
13	Seven-Tail Mentor	Common	Creature	White	4	3
14	The Wandering Emperor	Mythic	Planeswalker	White	4	3
15	Raiyuu, Storm`s Edge	Rare	Creature	Red-White	4	3
16	Sunblade Samurai	Common	Enchantment Creature	White	5	3
17	The Shattered States Era	Common	Enchantment - Saga	Red	5	3
18	Asari Captain	Uncommon	Creature	Red-White	5	3
19	Imperial Oath	Common	Sorcery	White	6	3
20	Vanquish the Horde	Rare	Sorcery	White	8	2
21	Eiganjo Uprising	Rare	Sorcery	Red-White	2	3
22	Plains	Common	Basic Land	White	0	3
23	Swamp	Common	Basic Land	Black	0	3
24	Mountain	Common	Basic Land	Red	0	3
25	Scoured Barrens	Common	Land	White-Black	0	3
26	Shattered Sanctum	Rare	Land	White-Black	0	5
27	Bloodfell Caves	Common	Land	Black-Red	0	3
28	Haunted Ridge	Rare	Land	Black-Red	0	2
1	Reinforced Ronin	Uncommon	Artifact Creature	Red	1	3
32	Reinforced Ronin	Uncommon	Artifact Creature	Red	1	3
2	Ancestral Katana	Common	Artifact - Equipment	White	2	3
35	Ancestral Katana	Common	Artifact - Equipment	White	2	3
36	Ancestral Katana	Common	Artifact - Equipment	White	2	3
37	Banishing Slash	Uncommon	Sorcery	White	2	3
38	Eiganjo Exemplar	Common	Enchantment Creature	White	2	3
39	Selfless Samurai	Uncommon	Creature	White	2	3
40	Infernal Grasp	Uncommon	Instant	Black	2	2
41	Akki Ronin	Common	Creature	Red	2	3
42	Imperial Subduer	Common	Creature	White	3	3
43	Nezumi Bladeblesser	Common	Creature	Black	3	3
44	Seven-Tail Mentor	Common	Creature	White	4	3
45	Sunblade Samurai	Common	Enchantment Creature	White	5	3
46	Sunblade Samurai	Common	Enchantment Creature	White	5	3
47	Asari Captain	Uncommon	Creature	Red-White	5	3
48	Asari Captain	Uncommon	Creature	Red-White	5	3
49	Plains	Common	Basic Land	White	0	3
50	Plains	Common	Basic Land	White	0	3
51	Plains	Common	Basic Land	White	0	3
52	Plains	Common	Basic Land	White	0	3
53	Plains	Common	Basic Land	White	0	3
54	Plains	Common	Basic Land	White	0	3
55	Plains	Common	Basic Land	White	0	3
56	Plains	Common	Basic Land	White	0	3
57	Mountain	Common	Basic Land	Red	0	3
58	Mountain	Common	Basic Land	Red	0	3
59	Mountain	Common	Basic Land	Red	0	3
60	Mountain	Common	Basic Land	Red	0	3
61	Mountain	Common	Basic Land	Red	0	3
62	Mountain	Common	Basic Land	Red	0	3
63	Scoured Barrens	Common	Land	White-Black	0	3
64	Scoured Barrens	Common	Land	White-Black	0	3
65	Bloodfell Caves	Common	Land	Black-Red	0	3
\.


--
-- TOC entry 3372 (class 0 OID 18839)
-- Dependencies: 215
-- Data for Name: decks; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.decks (id, name, size, player_id) FROM stdin;
1	Samurai	60	1
2	Samurai	60	2
3	Samurai	60	3
\.


--
-- TOC entry 3375 (class 0 OID 18863)
-- Dependencies: 218
-- Data for Name: decks_cards; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.decks_cards (deck_id, card_id) FROM stdin;
1	1
1	2
1	3
1	4
1	5
1	6
1	7
1	8
1	9
1	10
1	11
1	12
1	13
1	14
1	15
1	16
1	17
1	18
1	19
1	20
1	21
1	22
1	23
1	24
1	25
1	26
1	27
1	28
2	1
2	2
2	3
2	4
2	5
2	6
2	7
2	8
2	9
2	10
2	11
2	12
2	13
2	14
2	15
2	16
2	17
2	18
2	19
2	20
2	21
2	22
2	23
2	24
2	25
2	26
2	27
2	28
3	1
3	2
3	3
3	4
3	5
3	6
3	7
3	8
3	9
3	10
3	11
3	12
3	13
3	14
3	15
3	16
3	17
3	18
3	19
3	20
3	21
3	22
3	23
3	24
3	25
3	26
3	27
3	28
1	32
1	35
1	36
1	37
1	38
1	39
1	40
1	41
1	42
1	43
1	44
1	45
1	46
1	47
1	48
1	49
1	50
1	51
1	52
1	53
1	54
1	55
1	56
1	57
1	58
1	59
1	60
1	61
1	62
1	63
1	64
1	65
2	32
2	35
2	36
2	37
2	38
2	39
2	40
2	41
2	42
2	43
2	44
2	45
2	46
2	47
2	48
2	49
2	50
2	51
2	52
2	53
2	54
2	55
2	56
2	57
2	58
2	59
2	60
2	61
2	62
2	63
2	64
2	65
3	32
3	35
3	36
3	37
3	38
3	39
3	40
3	41
3	42
3	43
3	44
3	45
3	46
3	47
3	48
3	49
3	50
3	51
3	52
3	53
3	54
3	55
3	56
3	57
3	58
3	59
3	60
3	61
3	62
3	63
3	64
3	65
\.


--
-- TOC entry 3370 (class 0 OID 18825)
-- Dependencies: 213
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.players (id, name, account_id) FROM stdin;
1	Bob	1
3	Tom	3
2	Dylan	2
\.


--
-- TOC entry 3377 (class 0 OID 18879)
-- Dependencies: 220
-- Data for Name: sets; Type: TABLE DATA; Schema: public; Owner: postgres
--

COPY public.sets (id, name) FROM stdin;
1	Dominaria United
2	Innistrad: Midnight Hunt
4	Streets of New Capenna
5	Innistrad: Crimson Vow
3	Kamigawa: Neon Dynasty
\.


--
-- TOC entry 3388 (class 0 OID 0)
-- Dependencies: 210
-- Name: accounts_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.accounts_id_seq', 5, true);


--
-- TOC entry 3389 (class 0 OID 0)
-- Dependencies: 216
-- Name: cards_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.cards_id_seq', 65, true);


--
-- TOC entry 3390 (class 0 OID 0)
-- Dependencies: 214
-- Name: decks_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.decks_id_seq', 4, true);


--
-- TOC entry 3391 (class 0 OID 0)
-- Dependencies: 212
-- Name: players_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.players_id_seq', 6, true);


--
-- TOC entry 3392 (class 0 OID 0)
-- Dependencies: 219
-- Name: sets_id_seq; Type: SEQUENCE SET; Schema: public; Owner: postgres
--

SELECT pg_catalog.setval('public.sets_id_seq', 6, true);


--
-- TOC entry 3202 (class 2606 OID 18821)
-- Name: accounts accounts_email_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_email_key UNIQUE (email);


--
-- TOC entry 3204 (class 2606 OID 18819)
-- Name: accounts accounts_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_pkey PRIMARY KEY (id);


--
-- TOC entry 3206 (class 2606 OID 18823)
-- Name: accounts accounts_username_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.accounts
    ADD CONSTRAINT accounts_username_key UNIQUE (username);


--
-- TOC entry 3200 (class 2606 OID 18810)
-- Name: alembic_version alembic_version_pkc; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.alembic_version
    ADD CONSTRAINT alembic_version_pkc PRIMARY KEY (version_num);


--
-- TOC entry 3214 (class 2606 OID 18860)
-- Name: cards cards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT cards_pkey PRIMARY KEY (id);


--
-- TOC entry 3217 (class 2606 OID 18867)
-- Name: decks_cards decks_cards_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.decks_cards
    ADD CONSTRAINT decks_cards_pkey PRIMARY KEY (deck_id, card_id);


--
-- TOC entry 3212 (class 2606 OID 18846)
-- Name: decks decks_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.decks
    ADD CONSTRAINT decks_pkey PRIMARY KEY (id);


--
-- TOC entry 3208 (class 2606 OID 19010)
-- Name: players players_account_id_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_account_id_key UNIQUE (account_id);


--
-- TOC entry 3210 (class 2606 OID 18832)
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (id);


--
-- TOC entry 3219 (class 2606 OID 18888)
-- Name: sets sets_name_key; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sets
    ADD CONSTRAINT sets_name_key UNIQUE (name);


--
-- TOC entry 3221 (class 2606 OID 18886)
-- Name: sets sets_pkey; Type: CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.sets
    ADD CONSTRAINT sets_pkey PRIMARY KEY (id);


--
-- TOC entry 3215 (class 1259 OID 19011)
-- Name: mtg_deckbuilder_hash_index; Type: INDEX; Schema: public; Owner: postgres
--

CREATE INDEX mtg_deckbuilder_hash_index ON public.cards USING hash (type);


--
-- TOC entry 3224 (class 2606 OID 18889)
-- Name: cards cards_set_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.cards
    ADD CONSTRAINT cards_set_id_fkey FOREIGN KEY (set_id) REFERENCES public.sets(id);


--
-- TOC entry 3225 (class 2606 OID 18868)
-- Name: decks_cards decks_cards_card_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.decks_cards
    ADD CONSTRAINT decks_cards_card_id_fkey FOREIGN KEY (card_id) REFERENCES public.cards(id);


--
-- TOC entry 3226 (class 2606 OID 18873)
-- Name: decks_cards decks_cards_deck_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.decks_cards
    ADD CONSTRAINT decks_cards_deck_id_fkey FOREIGN KEY (deck_id) REFERENCES public.decks(id);


--
-- TOC entry 3223 (class 2606 OID 18847)
-- Name: decks decks_player_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.decks
    ADD CONSTRAINT decks_player_id_fkey FOREIGN KEY (player_id) REFERENCES public.players(id);


--
-- TOC entry 3222 (class 2606 OID 18833)
-- Name: players players_account_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: postgres
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_account_id_fkey FOREIGN KEY (account_id) REFERENCES public.accounts(id);


-- Completed on 2022-10-08 13:40:59 UTC

--
-- PostgreSQL database dump complete
--

