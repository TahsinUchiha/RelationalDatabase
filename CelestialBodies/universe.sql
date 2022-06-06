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

DROP DATABASE universe;
--
-- Name: universe; Type: DATABASE; Schema: -; Owner: freecodecamp
--

CREATE DATABASE universe WITH TEMPLATE = template0 ENCODING = 'UTF8' LC_COLLATE = 'C.UTF-8' LC_CTYPE = 'C.UTF-8';


ALTER DATABASE universe OWNER TO freecodecamp;

\connect universe

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
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(60) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth_lightyears integer,
    has_life boolean,
    is_spherical boolean,
    description text,
    weight_in_solar_mass numeric(16,2),
    galaxy_type_id integer
);


ALTER TABLE public.galaxy OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_galaxy_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_galaxy_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_galaxy_id_seq OWNED BY public.galaxy.galaxy_id;


--
-- Name: galaxy_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy_types (
    galaxy_types_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.galaxy_types OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.galaxy_types_galaxy_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.galaxy_types_galaxy_type_id_seq OWNER TO freecodecamp;

--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.galaxy_types_galaxy_type_id_seq OWNED BY public.galaxy_types.galaxy_types_id;


--
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(60) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth_lightyears integer,
    has_life boolean,
    is_spherical boolean,
    description text,
    weight_in_solar_mass numeric(16,2),
    planet_id integer
);


ALTER TABLE public.moon OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.moon_moon_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.moon_moon_id_seq OWNER TO freecodecamp;

--
-- Name: moon_moon_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.moon_moon_id_seq OWNED BY public.moon.moon_id;


--
-- Name: planet; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet (
    planet_id integer NOT NULL,
    name character varying(60) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth_lightyears integer,
    has_life boolean,
    is_spherical boolean,
    description text,
    weight_in_solar_mass numeric(16,2),
    star_id integer,
    planet_type_id integer
);


ALTER TABLE public.planet OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_planet_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_planet_id_seq OWNER TO freecodecamp;

--
-- Name: planet_planet_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_planet_id_seq OWNED BY public.planet.planet_id;


--
-- Name: planet_types; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.planet_types (
    planet_types_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text
);


ALTER TABLE public.planet_types OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.planet_types_planet_type_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.planet_types_planet_type_id_seq OWNER TO freecodecamp;

--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.planet_types_planet_type_id_seq OWNED BY public.planet_types.planet_types_id;


--
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(60) NOT NULL,
    age_in_millions_of_years integer,
    distance_from_earth_lightyears integer,
    has_life boolean,
    is_spherical boolean,
    description text,
    weight_in_solar_mass numeric(16,2),
    galaxy_id integer
);


ALTER TABLE public.star OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.star_star_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.star_star_id_seq OWNER TO freecodecamp;

--
-- Name: star_star_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.star_star_id_seq OWNED BY public.star.star_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: galaxy_types galaxy_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types ALTER COLUMN galaxy_types_id SET DEFAULT nextval('public.galaxy_types_galaxy_type_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: planet_types planet_types_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types ALTER COLUMN planet_types_id SET DEFAULT nextval('public.planet_types_planet_type_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600, 27000, true, true, 'Our home galaxy', 2000000000000.00, 1);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10010, 2537000, NULL, false, 'Our neighbouring galaxy', 800000000000.00, 2);
INSERT INTO public.galaxy VALUES (3, 'Messier 82', 13300, 12100000, NULL, false, 'A starburst galaxy in the constellation Ursa Major', NULL, 3);
INSERT INTO public.galaxy VALUES (4, 'Antennae Galaxies', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Backward Galaxy', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Black Eye Galaxy', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (7, 'Antennae Galaxies', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (8, 'Backward Galaxy', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (9, 'Black Eye Galaxy', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (10, 'Bode''s Galaxy', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (11, 'Butterfly Galaxies', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.galaxy VALUES (12, 'Cartwheel Galaxy', NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: galaxy_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy_types VALUES (1, 'Spiral', 'The first type of galaxies⁠—spiral galaxies⁠—can be recognized by their wide, flat disks of rotating gas and dust. ');
INSERT INTO public.galaxy_types VALUES (2, 'Elliptical', 'Elliptical galaxies are given their name because of their oblong shape and lack of overall structure. Some are nearly spherical, while others are shaped more like a cigar.');
INSERT INTO public.galaxy_types VALUES (3, 'Peculiar', 'Peculiar Galaxies are formed as a result of galactic collisions');
INSERT INTO public.galaxy_types VALUES (4, 'Irregular', 'Galaxies that do not fall under the other 3 categories, either small, dwarf galaxies that lack any distinguishable shape');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', 4530, 0, false, true, 'Our home moon', 0.00, 1);
INSERT INTO public.moon VALUES (2, 'Europa', 4530, 0, NULL, true, 'One of Jupiter''s moon', NULL, 3);
INSERT INTO public.moon VALUES (3, 'Callisto', 4530, 0, NULL, true, 'One of Jupiter''s moon', NULL, 3);
INSERT INTO public.moon VALUES (4, 'Deimos', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (5, 'Phobos', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (6, 'Amalthea', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (7, 'Ganymede', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (8, 'Io', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (9, 'Dione', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (10, 'Enceladus', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (11, 'Hyperion', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (12, 'Iapetus', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (13, 'Mimas', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (14, 'Phoebe', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (15, 'Rhea', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (16, 'Tethys', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (17, 'Titan', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (18, 'Ariel', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (19, 'Miranda', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (20, 'Oberon', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (21, 'Titania', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (22, 'Umbriel', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (23, 'Nereid', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (24, 'Triton', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.moon VALUES (25, 'Charon', NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 4603, 0, true, true, 'Our home planet', 0.00, 1, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 4603, 0, NULL, true, 'Our neighbouring red planet', NULL, 1, 1);
INSERT INTO public.planet VALUES (3, 'Jupiter', 4603, 0, NULL, true, 'Our biggest planet in the solar system', NULL, 1, 4);
INSERT INTO public.planet VALUES (4, 'Mercury', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (5, 'Venus', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (7, 'Jupiter', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (8, 'Uranus', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (9, 'Neptune', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (10, 'CoRoT-7b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (11, 'HD 209458b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (12, 'HIP 13044b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (13, 'Kepler-186f', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.planet VALUES (14, 'Kepler-452b', NULL, NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- Data for Name: planet_types; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet_types VALUES (1, 'Terrestrial planets', 'Terrestrial planets are Earth sized and smaller, composed of rock, silicate, water or carbon.');
INSERT INTO public.planet_types VALUES (2, 'Super-Earths', 'Super-Earths are typically terrestrial planets that may or may not have atmospheres. They are more massive than Earth, but lighter than Neptune.');
INSERT INTO public.planet_types VALUES (3, 'Neptunian planets', 'Neptunian planets are similar in size to Neptune or Uranus in our solar system. They likely have a mixture of interior compositions, but all will have hydrogen and helium-dominated outer atmospheres and rocky cores.');
INSERT INTO public.planet_types VALUES (4, 'Gas giants', 'Gas giants are planets the size of Saturn or Jupiter, the largest planet in our solar system, or much, much larger.');


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', 4603, 0, true, true, 'Our home star', 1.00, 1);
INSERT INTO public.star VALUES (2, 'Proxima Centauri', 4853, 4, NULL, true, 'Our neighbouring star', 0.12, 1);
INSERT INTO public.star VALUES (3, 'Barnard''s Star', 10001, 6, NULL, true, 'Our neighbouring star', 0.13, 1);
INSERT INTO public.star VALUES (4, 'α Centauri A', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (5, 'α Centauri B', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (6, 'Wolf 359', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (7, 'Lalande 21185', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (8, 'Sirius A', NULL, NULL, NULL, NULL, NULL, NULL, NULL);
INSERT INTO public.star VALUES (9, 'Sirius B', NULL, NULL, NULL, NULL, NULL, NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 12, true);


--
-- Name: galaxy_types_galaxy_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_types_galaxy_type_id_seq', 4, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 25, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: planet_types_planet_type_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_types_planet_type_id_seq', 4, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 9, true);


--
-- Name: galaxy galaxy_galaxy_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_galaxy_id_key UNIQUE (galaxy_id);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


--
-- Name: galaxy_types galaxy_types_galaxy_types_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_galaxy_types_id_key UNIQUE (galaxy_types_id);


--
-- Name: galaxy_types galaxy_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy_types
    ADD CONSTRAINT galaxy_types_pkey PRIMARY KEY (galaxy_types_id);


--
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_pkey PRIMARY KEY (planet_id);


--
-- Name: planet planet_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_planet_id_key UNIQUE (planet_id);


--
-- Name: planet_types planet_types_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_pkey PRIMARY KEY (planet_types_id);


--
-- Name: planet_types planet_types_planet_types_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet_types
    ADD CONSTRAINT planet_types_planet_types_id_key UNIQUE (planet_types_id);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: star star_star_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_star_id_key UNIQUE (star_id);


--
-- Name: moon moon_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: planet planet_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- Name: star star_galaxy_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_galaxy_id_fkey FOREIGN KEY (galaxy_id) REFERENCES public.galaxy(galaxy_id);


--
-- PostgreSQL database dump complete
--


