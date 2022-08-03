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
-- Name: scoreboard; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.scoreboard (
    game_id integer NOT NULL,
    score integer NOT NULL,
    user_id integer NOT NULL
);


ALTER TABLE public.scoreboard OWNER TO freecodecamp;

--
-- Name: scoreboard_game_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.scoreboard_game_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.scoreboard_game_id_seq OWNER TO freecodecamp;

--
-- Name: scoreboard_game_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.scoreboard_game_id_seq OWNED BY public.scoreboard.game_id;


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
-- Name: scoreboard game_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.scoreboard ALTER COLUMN game_id SET DEFAULT nextval('public.scoreboard_game_id_seq'::regclass);


--
-- Name: users user_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users ALTER COLUMN user_id SET DEFAULT nextval('public.users_user_id_seq'::regclass);


--
-- Data for Name: scoreboard; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.scoreboard VALUES (91, 9, 52);
INSERT INTO public.scoreboard VALUES (92, 10, 52);
INSERT INTO public.scoreboard VALUES (93, 12, 52);
INSERT INTO public.scoreboard VALUES (94, 636, 54);
INSERT INTO public.scoreboard VALUES (95, 870, 54);
INSERT INTO public.scoreboard VALUES (96, 267, 55);
INSERT INTO public.scoreboard VALUES (97, 733, 55);
INSERT INTO public.scoreboard VALUES (98, 986, 54);
INSERT INTO public.scoreboard VALUES (99, 874, 54);
INSERT INTO public.scoreboard VALUES (100, 891, 54);
INSERT INTO public.scoreboard VALUES (101, 1, 56);
INSERT INTO public.scoreboard VALUES (102, 1, 56);
INSERT INTO public.scoreboard VALUES (103, 1, 57);
INSERT INTO public.scoreboard VALUES (104, 3, 58);
INSERT INTO public.scoreboard VALUES (105, 4, 58);
INSERT INTO public.scoreboard VALUES (106, 2, 59);
INSERT INTO public.scoreboard VALUES (107, 3, 59);
INSERT INTO public.scoreboard VALUES (108, 7, 58);
INSERT INTO public.scoreboard VALUES (109, 5, 58);
INSERT INTO public.scoreboard VALUES (110, 4, 58);
INSERT INTO public.scoreboard VALUES (111, 26, 60);
INSERT INTO public.scoreboard VALUES (112, 805, 60);
INSERT INTO public.scoreboard VALUES (113, 361, 61);
INSERT INTO public.scoreboard VALUES (114, 712, 61);
INSERT INTO public.scoreboard VALUES (115, 573, 60);
INSERT INTO public.scoreboard VALUES (116, 718, 60);
INSERT INTO public.scoreboard VALUES (117, 727, 60);
INSERT INTO public.scoreboard VALUES (118, 280, 62);
INSERT INTO public.scoreboard VALUES (119, 461, 62);
INSERT INTO public.scoreboard VALUES (120, 992, 63);
INSERT INTO public.scoreboard VALUES (121, 293, 63);
INSERT INTO public.scoreboard VALUES (122, 339, 62);
INSERT INTO public.scoreboard VALUES (123, 246, 62);
INSERT INTO public.scoreboard VALUES (124, 342, 62);
INSERT INTO public.scoreboard VALUES (125, 530, 64);
INSERT INTO public.scoreboard VALUES (126, 271, 64);
INSERT INTO public.scoreboard VALUES (127, 441, 65);
INSERT INTO public.scoreboard VALUES (128, 792, 65);
INSERT INTO public.scoreboard VALUES (129, 90, 64);
INSERT INTO public.scoreboard VALUES (130, 742, 64);
INSERT INTO public.scoreboard VALUES (131, 523, 64);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.users VALUES (52, 'hello');
INSERT INTO public.users VALUES (54, 'user_1659559686146');
INSERT INTO public.users VALUES (55, 'user_1659559686145');
INSERT INTO public.users VALUES (56, 'jhosenpai');
INSERT INTO public.users VALUES (57, '2');
INSERT INTO public.users VALUES (58, 'user_1659560139692');
INSERT INTO public.users VALUES (59, 'user_1659560139691');
INSERT INTO public.users VALUES (60, 'user_1659560211253');
INSERT INTO public.users VALUES (61, 'user_1659560211252');
INSERT INTO public.users VALUES (62, 'user_1659560235205');
INSERT INTO public.users VALUES (63, 'user_1659560235204');
INSERT INTO public.users VALUES (64, 'user_1659560246023');
INSERT INTO public.users VALUES (65, 'user_1659560246022');


--
-- Name: scoreboard_game_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.scoreboard_game_id_seq', 131, true);


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.users_user_id_seq', 65, true);


--
-- Name: users users_user_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_user_id_key UNIQUE (user_id);


--
-- Name: users users_username_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.users
    ADD CONSTRAINT users_username_key UNIQUE (username);


--
-- Name: scoreboard scoreboard_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.scoreboard
    ADD CONSTRAINT scoreboard_user_id_fkey FOREIGN KEY (user_id) REFERENCES public.users(user_id);


--
-- PostgreSQL database dump complete
--


