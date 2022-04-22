--
-- PostgreSQL database dump
--

-- Dumped from database version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)
-- Dumped by pg_dump version 12.9 (Ubuntu 12.9-2.pgdg20.04+1)

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

DROP DATABASE number_guess;
--
-- Name: number_guess; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE number_guess WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE number_guess OWNER TO freecodecamp;

\connect number_guess

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
-- Name: players; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.players (
    player_id integer NOT NULL,
    name character varying(30) NOT NULL,
    games_played integer DEFAULT 0 NOT NULL,
    best_game integer
);


ALTER TABLE public.players OWNER TO freecodecamp;

--
-- Name: players_player_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.players_player_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.players_player_id_seq OWNER TO freecodecamp;

--
-- Name: players_player_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.players_player_id_seq OWNED BY public.players.player_id;


--
-- Name: players player_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players ALTER COLUMN player_id SET DEFAULT nextval('public.players_player_id_seq'::regclass);


--
-- Data for Name: players; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.players VALUES (55, 'user_1650657859971', 1, 766);
INSERT INTO public.players VALUES (38, 'user_1650656825021', 2, 282);
INSERT INTO public.players VALUES (37, 'user_1650656825022', 5, 284);
INSERT INTO public.players VALUES (54, 'user_1650657859972', 4, 173);
INSERT INTO public.players VALUES (40, 'user_1650656863449', 2, 102);
INSERT INTO public.players VALUES (39, 'user_1650656863450', 5, 4);
INSERT INTO public.players VALUES (57, 'user_1650658044372', 2, 812);
INSERT INTO public.players VALUES (56, 'user_1650658044373', 5, 222);
INSERT INTO public.players VALUES (42, 'user_1650656917516', 2, 353);
INSERT INTO public.players VALUES (41, 'user_1650656917517', 5, 25);
INSERT INTO public.players VALUES (59, 'user_1650658133019', 2, 84);
INSERT INTO public.players VALUES (58, 'user_1650658133020', 5, 15);
INSERT INTO public.players VALUES (45, 'user_1650657479038', 2, 843);
INSERT INTO public.players VALUES (44, 'user_1650657479039', 5, 312);
INSERT INTO public.players VALUES (61, 'user_1650658237727', 2, 276);
INSERT INTO public.players VALUES (47, 'user_1650657497373', 2, 159);
INSERT INTO public.players VALUES (46, 'user_1650657497374', 5, 21);
INSERT INTO public.players VALUES (60, 'user_1650658237728', 5, 156);
INSERT INTO public.players VALUES (49, 'user_1650657608897', 2, 56);
INSERT INTO public.players VALUES (48, 'user_1650657608898', 5, 68);
INSERT INTO public.players VALUES (63, 'user_1650658251942', 2, 609);
INSERT INTO public.players VALUES (62, 'user_1650658251943', 5, 43);
INSERT INTO public.players VALUES (51, 'user_1650657639638', 2, 749);
INSERT INTO public.players VALUES (50, 'user_1650657639639', 5, 79);
INSERT INTO public.players VALUES (53, 'user_1650657680006', 2, 573);
INSERT INTO public.players VALUES (52, 'user_1650657680007', 5, 60);


--
-- Name: players_player_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.players_player_id_seq', 63, true);


--
-- Name: players players_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.players
    ADD CONSTRAINT players_pkey PRIMARY KEY (player_id);


--
-- PostgreSQL database dump complete
--


