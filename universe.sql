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
    name character varying(30) NOT NULL,
    description text,
    distance_in_mil_light_years integer,
    discovered_year integer
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
-- Name: moon; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.moon (
    moon_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    visited boolean,
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
    name character varying(30) NOT NULL,
    moon_qnt integer,
    age_in_millions_of_years integer,
    description text,
    has_life boolean,
    visited boolean,
    star_id integer,
    radius_in_km numeric(10,3)
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
-- Name: star; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.star (
    star_id integer NOT NULL,
    name character varying(30) NOT NULL,
    description text,
    galaxy_id integer,
    magnitude integer
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
-- Name: telescope; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.telescope (
    name character varying(50) NOT NULL,
    telescope_id integer NOT NULL,
    launch_year integer,
    active boolean,
    type character varying(25)
);


ALTER TABLE public.telescope OWNER TO freecodecamp;

--
-- Name: telescopes_telescope_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.telescopes_telescope_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.telescopes_telescope_id_seq OWNER TO freecodecamp;

--
-- Name: telescopes_telescope_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.telescopes_telescope_id_seq OWNED BY public.telescope.telescope_id;


--
-- Name: galaxy galaxy_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy ALTER COLUMN galaxy_id SET DEFAULT nextval('public.galaxy_galaxy_id_seq'::regclass);


--
-- Name: moon moon_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon ALTER COLUMN moon_id SET DEFAULT nextval('public.moon_moon_id_seq'::regclass);


--
-- Name: planet planet_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet ALTER COLUMN planet_id SET DEFAULT nextval('public.planet_planet_id_seq'::regclass);


--
-- Name: star star_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star ALTER COLUMN star_id SET DEFAULT nextval('public.star_star_id_seq'::regclass);


--
-- Name: telescope telescope_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.telescope ALTER COLUMN telescope_id SET DEFAULT nextval('public.telescopes_telescope_id_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'The galaxy that contains our Solar System', NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'The nearest major galaxy to the Milky Way', NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Eye of God', 'A spiral galaxy about 60 million light-years away from Earth', NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Bear Paw', 'A blue dwarf galaxy.', NULL, NULL);
INSERT INTO public.galaxy VALUES (5, 'Antennae', 'A pair of galaxies colliding', NULL, NULL);
INSERT INTO public.galaxy VALUES (6, 'Black Eye', 'A spiral galaxy about 17 million light-years away from Earth', NULL, NULL);


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Moon', NULL, true, 1);
INSERT INTO public.moon VALUES (2, 'Metis', NULL, NULL, 5);
INSERT INTO public.moon VALUES (3, 'Adrastea', NULL, NULL, 5);
INSERT INTO public.moon VALUES (4, 'Amalthea', NULL, NULL, 5);
INSERT INTO public.moon VALUES (5, 'Thebe', NULL, NULL, 5);
INSERT INTO public.moon VALUES (6, 'Io', NULL, NULL, 5);
INSERT INTO public.moon VALUES (7, 'Europa', NULL, NULL, 5);
INSERT INTO public.moon VALUES (8, 'Ganymede', NULL, NULL, 5);
INSERT INTO public.moon VALUES (9, 'Callisto', NULL, NULL, 5);
INSERT INTO public.moon VALUES (10, 'Themisto', NULL, NULL, 5);
INSERT INTO public.moon VALUES (11, 'Leda', NULL, NULL, 5);
INSERT INTO public.moon VALUES (12, 'Ersa', NULL, NULL, 5);
INSERT INTO public.moon VALUES (13, 'Himalia', NULL, NULL, 5);
INSERT INTO public.moon VALUES (14, 'Pandia', NULL, NULL, 5);
INSERT INTO public.moon VALUES (15, 'Lysithea', NULL, NULL, 5);
INSERT INTO public.moon VALUES (16, 'Elara', NULL, NULL, 5);
INSERT INTO public.moon VALUES (17, 'Dia', NULL, NULL, 5);
INSERT INTO public.moon VALUES (18, 'Carpo', NULL, NULL, 5);
INSERT INTO public.moon VALUES (19, 'Valetudo', NULL, NULL, 5);
INSERT INTO public.moon VALUES (20, 'Euporie', NULL, NULL, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 1, 4543, NULL, true, true, 1, NULL);
INSERT INTO public.planet VALUES (2, 'Mercury', NULL, NULL, NULL, false, false, 1, NULL);
INSERT INTO public.planet VALUES (3, 'Venus', NULL, NULL, NULL, false, false, 1, NULL);
INSERT INTO public.planet VALUES (4, 'Mars', NULL, NULL, NULL, false, false, 1, NULL);
INSERT INTO public.planet VALUES (5, 'Jupiter', NULL, NULL, NULL, false, false, 1, NULL);
INSERT INTO public.planet VALUES (6, 'Saturn', NULL, NULL, NULL, false, false, 1, NULL);
INSERT INTO public.planet VALUES (7, 'Uranus', NULL, NULL, NULL, false, false, 1, NULL);
INSERT INTO public.planet VALUES (8, 'Neptune', NULL, NULL, NULL, false, false, 1, NULL);
INSERT INTO public.planet VALUES (9, 'Kepler-90g', NULL, NULL, NULL, NULL, NULL, 7, NULL);
INSERT INTO public.planet VALUES (10, 'Kepler-90h', NULL, NULL, NULL, NULL, NULL, 7, NULL);
INSERT INTO public.planet VALUES (11, 'Kepler-90f', NULL, NULL, NULL, NULL, NULL, 7, NULL);
INSERT INTO public.planet VALUES (12, 'Kepler-90e', NULL, NULL, NULL, NULL, NULL, 7, NULL);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Sun', NULL, 1, NULL);
INSERT INTO public.star VALUES (2, 'Spica', NULL, 1, NULL);
INSERT INTO public.star VALUES (3, 'Aldebaran', NULL, 1, NULL);
INSERT INTO public.star VALUES (4, 'Canopus', NULL, 1, NULL);
INSERT INTO public.star VALUES (5, 'Sirius', NULL, 1, NULL);
INSERT INTO public.star VALUES (6, 'Acrux', NULL, 1, NULL);
INSERT INTO public.star VALUES (7, 'Kepler-90', NULL, 1, NULL);


--
-- Data for Name: telescope; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.telescope VALUES ('James Webb Space Telescope', 1, 2021, NULL, NULL);
INSERT INTO public.telescope VALUES ('Hubble Space Telescope', 2, 1990, NULL, NULL);
INSERT INTO public.telescope VALUES ('Kepler', 3, 2009, NULL, NULL);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 20, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 12, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 7, true);


--
-- Name: telescopes_telescope_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.telescopes_telescope_id_seq', 3, true);


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
-- Name: moon moon_moon_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_moon_id_key UNIQUE (moon_id);


--
-- Name: moon moon_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_name_key UNIQUE (name);


--
-- Name: moon moon_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.moon
    ADD CONSTRAINT moon_pkey PRIMARY KEY (moon_id);


--
-- Name: planet planet_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.planet
    ADD CONSTRAINT planet_name_key UNIQUE (name);


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
-- Name: telescope telescopes_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.telescope
    ADD CONSTRAINT telescopes_name_key UNIQUE (name);


--
-- Name: telescope telescopes_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.telescope
    ADD CONSTRAINT telescopes_pkey PRIMARY KEY (telescope_id);


--
-- Name: telescope telescopes_telescope_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.telescope
    ADD CONSTRAINT telescopes_telescope_id_key UNIQUE (telescope_id);


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

