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
    name character varying(40) NOT NULL,
    description text,
    age_in_millions_of_years integer,
    galaxy_types character varying(30)
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
    name character varying(40) NOT NULL,
    is_spherical boolean,
    size_in_km character varying(20),
    distance_from_planet_in_km numeric,
    number_of_photos integer,
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
    name character varying(40) NOT NULL,
    planet_type character varying(30),
    description text,
    has_life boolean NOT NULL,
    has_moons boolean NOT NULL,
    star_id integer
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
    name character varying(40) NOT NULL,
    is_spherical boolean,
    star_type character varying(30),
    description text,
    number_of_planets integer,
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
-- Name: systems; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.systems (
    star_id integer,
    planet_id integer,
    name character varying(30),
    systems_id integer NOT NULL,
    distance integer,
    count integer NOT NULL
);


ALTER TABLE public.systems OWNER TO freecodecamp;

--
-- Name: systems_count_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.systems_count_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.systems_count_seq OWNER TO freecodecamp;

--
-- Name: systems_count_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.systems_count_seq OWNED BY public.systems.count;


--
-- Name: systems_systems_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.systems_systems_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.systems_systems_id_seq OWNER TO freecodecamp;

--
-- Name: systems_systems_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.systems_systems_id_seq OWNED BY public.systems.systems_id;


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
-- Name: systems systems_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.systems ALTER COLUMN systems_id SET DEFAULT nextval('public.systems_systems_id_seq'::regclass);


--
-- Name: systems count; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.systems ALTER COLUMN count SET DEFAULT nextval('public.systems_count_seq'::regclass);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 'Our galaxy', 6000, 'spiral');
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 'Our nearest neighbor', 5000, 'spiral');
INSERT INTO public.galaxy VALUES (3, 'AM-0644', 'Contelation Voran', 7000, 'eliptical');
INSERT INTO public.galaxy VALUES (4, 'ARP-299', 'Constelation Major Osa', 4000, 'eliptical');
INSERT INTO public.galaxy VALUES (5, 'Fénix Dwarf', 'Constelation Fenix', 6000, 'spiral');
INSERT INTO public.galaxy VALUES (6, 'Pegasus Dwarf', 'Constelation Pegasus', 7000, 'eliptical');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (1, 'Deimos', true, '8', 23460, 50, 4);
INSERT INTO public.moon VALUES (2, 'Phobos', false, '29', 9270, 45, 2);
INSERT INTO public.moon VALUES (3, 'Adrastea', false, '18', 128980, 29, 3);
INSERT INTO public.moon VALUES (4, 'Amalthea', false, '180', 181300, 10, 6);
INSERT INTO public.moon VALUES (5, 'Aithne', true, '3', 23547000, 35, 2);
INSERT INTO public.moon VALUES (6, 'Arche', true, '3', 23064000, 30, 1);
INSERT INTO public.moon VALUES (7, 'Autonoe', true, '4', 24122000, 20, 3);
INSERT INTO public.moon VALUES (8, 'Callirrhoe', true, '10', 24200000, 50, 5);
INSERT INTO public.moon VALUES (9, 'Carpo', true, '3', 17100000, 100, 1);
INSERT INTO public.moon VALUES (10, 'Euanthe', true, '3', 21017000, 70, 5);
INSERT INTO public.moon VALUES (11, 'Hermippe', true, '4', 21252000, 10, 7);
INSERT INTO public.moon VALUES (12, 'Himalia', true, '170', 11480000, 80, 12);
INSERT INTO public.moon VALUES (13, 'IO', true, '3629', 421600, 90, 13);
INSERT INTO public.moon VALUES (14, 'Kalyke', true, '5.2', 23583000, 60, 5);
INSERT INTO public.moon VALUES (15, 'Magacilte', true, '5.4', 23806000, 45, 10);
INSERT INTO public.moon VALUES (16, 'Pasithee', true, '2', 23029000, 67, 11);
INSERT INTO public.moon VALUES (17, 'Sponde', true, '2', 23808000, 155, 12);
INSERT INTO public.moon VALUES (18, 'Taygete', true, '5', 23360000, 200, 13);
INSERT INTO public.moon VALUES (19, 'Thebe', true, '100', 221900, 300, 7);
INSERT INTO public.moon VALUES (20, 'Themisto', true, '8', 7507000, 33, 3);
INSERT INTO public.moon VALUES (21, 'Thyone', true, '4', 21312000, 76, 5);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Mercury', 'rock', 'first planet', false, false, 3);
INSERT INTO public.planet VALUES (3, 'Earth', 'Rock', 'Where we live', true, true, 5);
INSERT INTO public.planet VALUES (4, 'Mars', 'Rock', 'Red planet', false, false, 3);
INSERT INTO public.planet VALUES (5, 'Jupiter', 'Gas', 'Bigger planet', false, true, 7);
INSERT INTO public.planet VALUES (6, 'Saturn', 'Gas', 'Has rings', false, false, 1);
INSERT INTO public.planet VALUES (2, 'Venus', 'rock', 'Warmer planet', false, false, 2);
INSERT INTO public.planet VALUES (7, 'Uranus', 'Gas', 'Blue planet', false, false, 6);
INSERT INTO public.planet VALUES (8, 'Neptune', 'Gas', 'Last one', false, false, 4);
INSERT INTO public.planet VALUES (9, '1RXS 1609 b', 'Joviano', 'Discovery 2008', false, true, 3);
INSERT INTO public.planet VALUES (10, '2M 0746+20 b', 'Joviano', 'Discovery 2010', false, true, 1);
INSERT INTO public.planet VALUES (11, '4 uma b', 'Joviano', 'Discovery 2007', false, true, 2);
INSERT INTO public.planet VALUES (12, '6 Lyn b', 'Joviano', 'Discovery 2008', false, true, 6);
INSERT INTO public.planet VALUES (13, '7 CMa b', 'Joviano', 'Discovery 2011', false, false, 3);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Acrux', true, 'Double star', 'Constelation Crux', 9, 1);
INSERT INTO public.star VALUES (2, 'Ain', true, 'Single star', 'Constelation Taurus', 3, 2);
INSERT INTO public.star VALUES (3, 'Beid', true, 'Class F', 'Constelation Eridanus', 2, 2);
INSERT INTO public.star VALUES (4, 'Canopus', true, 'F0II', 'Constelation Carina', 5, 4);
INSERT INTO public.star VALUES (5, 'Capella', true, 'G1III', 'Constelation Auriga', 2, 4);
INSERT INTO public.star VALUES (6, 'Dabih', true, 'Double star', 'Constelation Capricornus', 1, 5);
INSERT INTO public.star VALUES (7, 'Elnath', true, 'Dwarf', 'Constelation Taurus', 2, 1);


--
-- Data for Name: systems; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.systems VALUES (1, 1, 'Taurus', 1, 1000, 1);
INSERT INTO public.systems VALUES (1, 2, 'Taurus', 2, 2000, 2);
INSERT INTO public.systems VALUES (1, 10, 'Taurus', 3, 2020, 3);
INSERT INTO public.systems VALUES (2, 3, 'Capricurnus', 4, 1020, 4);
INSERT INTO public.systems VALUES (2, 4, 'Capricurnus', 5, 3000, 5);
INSERT INTO public.systems VALUES (2, 5, 'Capricurnus', 6, 4000, 6);
INSERT INTO public.systems VALUES (2, 11, 'Capricurnus', 7, 6000, 7);
INSERT INTO public.systems VALUES (2, 12, 'Capricurnus', 8, 2390, 8);
INSERT INTO public.systems VALUES (3, 6, 'Sagitarus', 9, 2000, 9);
INSERT INTO public.systems VALUES (3, 13, 'Sagitarus', 10, 1290, 10);
INSERT INTO public.systems VALUES (4, 7, 'Cancer', 11, 4020, 11);
INSERT INTO public.systems VALUES (5, 8, 'Virgo', 12, 6000, 12);
INSERT INTO public.systems VALUES (6, 9, 'Acuarius', 13, 7000, 13);


--
-- Name: galaxy_galaxy_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.galaxy_galaxy_id_seq', 6, true);


--
-- Name: moon_moon_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.moon_moon_id_seq', 21, true);


--
-- Name: planet_planet_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.planet_planet_id_seq', 13, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 8, true);


--
-- Name: systems_count_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.systems_count_seq', 13, true);


--
-- Name: systems_systems_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.systems_systems_id_seq', 13, true);


--
-- Name: galaxy galaxy_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_name_key UNIQUE (name);


--
-- Name: galaxy galaxy_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.galaxy
    ADD CONSTRAINT galaxy_pkey PRIMARY KEY (galaxy_id);


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
-- Name: star star_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_name_key UNIQUE (name);


--
-- Name: star star_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.star
    ADD CONSTRAINT star_pkey PRIMARY KEY (star_id);


--
-- Name: systems systems_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.systems
    ADD CONSTRAINT systems_pkey PRIMARY KEY (systems_id);


--
-- Name: systems systems_planet_id_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.systems
    ADD CONSTRAINT systems_planet_id_key UNIQUE (planet_id);


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
-- Name: systems systems_planet_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.systems
    ADD CONSTRAINT systems_planet_id_fkey FOREIGN KEY (planet_id) REFERENCES public.planet(planet_id);


--
-- Name: systems systems_star_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.systems
    ADD CONSTRAINT systems_star_id_fkey FOREIGN KEY (star_id) REFERENCES public.star(star_id);


--
-- PostgreSQL database dump complete
--

