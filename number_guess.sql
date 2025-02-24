--
-- PostgreSQL database dump
--

-- Dumped from database version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)
-- Dumped by pg_dump version 12.17 (Ubuntu 12.17-1.pgdg22.04+1)

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
-- Name: games; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.games (
    game_id integer NOT NULL,
    number_guesses integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.games OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.games_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.games_game_id_seq OWNER TO freecodecamp;

--
-- Name: games_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.games_game_id_seq OWNED BY public.games.game_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.users (
    user_id integer NOT NULL,
    username character varying(22) NOT NULL
);


ALTER TABLE public.users OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.users_user_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.users_user_id_seq OWNER TO freecodecamp;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.users_user_id_seq OWNED BY public.users.user_id;


--
-- Name: games game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games ALTER COLUMN game_id SET DEFAULT nextval('public.games_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: games; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.games VALUES (1, 280, 14);
INSERT INTO public.games VALUES (2, 873, 14);
INSERT INTO public.games VALUES (3, 463, 15);
INSERT INTO public.games VALUES (4, 262, 15);
INSERT INTO public.games VALUES (5, 560, 14);
INSERT INTO public.games VALUES (6, 549, 14);
INSERT INTO public.games VALUES (7, 838, 14);
INSERT INTO public.games VALUES (8, 582, 16);
INSERT INTO public.games VALUES (9, 675, 16);
INSERT INTO public.games VALUES (10, 373, 17);
INSERT INTO public.games VALUES (11, 799, 17);
INSERT INTO public.games VALUES (12, 940, 16);
INSERT INTO public.games VALUES (13, 548, 16);
INSERT INTO public.games VALUES (14, 996, 16);
INSERT INTO public.games VALUES (15, 532, 18);
INSERT INTO public.games VALUES (16, 686, 18);
INSERT INTO public.games VALUES (17, 388, 19);
INSERT INTO public.games VALUES (18, 262, 19);
INSERT INTO public.games VALUES (19, 418, 18);
INSERT INTO public.games VALUES (20, 771, 18);
INSERT INTO public.games VALUES (21, 672, 18);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (1, 'mirko');
INSERT INTO public.users VALUES (2, 'user_1740433612544');
INSERT INTO public.users VALUES (3, 'user_1740433612543');
INSERT INTO public.users VALUES (4, 'user_1740433682162');
INSERT INTO public.users VALUES (5, 'user_1740433682161');
INSERT INTO public.users VALUES (6, 'user_1740433959241');
INSERT INTO public.users VALUES (7, 'user_1740433959240');
INSERT INTO public.users VALUES (8, 'user_1740434189627');
INSERT INTO public.users VALUES (9, 'user_1740434189626');
INSERT INTO public.users VALUES (10, 'user_1740434232251');
INSERT INTO public.users VALUES (11, 'user_1740434232250');
INSERT INTO public.users VALUES (12, 'user_1740434258708');
INSERT INTO public.users VALUES (13, 'user_1740434258707');
INSERT INTO public.users VALUES (14, 'user_1740434571582');
INSERT INTO public.users VALUES (15, 'user_1740434571581');
INSERT INTO public.users VALUES (16, 'user_1740434669929');
INSERT INTO public.users VALUES (17, 'user_1740434669928');
INSERT INTO public.users VALUES (18, 'user_1740434698384');
INSERT INTO public.users VALUES (19, 'user_1740434698383');


--
-- Name: games_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.games_game_id_seq', 21, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 19, true);


--
-- Name: games games_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_pkey PRIMARY KEY (game_id);


--
-- Name: users users_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: games games_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.games
    ADD CONSTRAINT games_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--

