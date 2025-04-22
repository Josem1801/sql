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
-- Name: astronomer; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.astronomer (
    astronomer_id integer NOT NULL,
    name character varying(100) NOT NULL,
    birth_year integer,
    nationality character varying(50),
    is_active boolean
);


ALTER TABLE public.astronomer OWNER TO freecodecamp;

--
-- Name: astronomer_astronomer_id_seq; Type: SEQUENCE; Schema: public; Owner: freecodecamp
--

CREATE SEQUENCE public.astronomer_astronomer_id_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE public.astronomer_astronomer_id_seq OWNER TO freecodecamp;

--
-- Name: astronomer_astronomer_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: freecodecamp
--

ALTER SEQUENCE public.astronomer_astronomer_id_seq OWNED BY public.astronomer.astronomer_id;


--
-- Name: galaxy; Type: TABLE; Schema: public; Owner: freecodecamp
--

CREATE TABLE public.galaxy (
    galaxy_id integer NOT NULL,
    name character varying(30) NOT NULL,
    age_in_millions_of_year integer NOT NULL,
    has_black_hole boolean,
    type character varying(30)
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
    is_spherical boolean NOT NULL,
    radius_km numeric(10,2) NOT NULL,
    discovered_year integer NOT NULL,
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
    description text NOT NULL,
    has_life boolean,
    distance_from_earth_in_ua numeric(10,2),
    age_million_years integer,
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
    name character varying(30) NOT NULL,
    galaxy_id integer,
    luminosity numeric(10,3) NOT NULL,
    is_variable boolean
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
-- Name: astronomer astronomer_id; Type: DEFAULT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomer ALTER COLUMN astronomer_id SET DEFAULT nextval('public.astronomer_astronomer_id_seq'::regclass);


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
-- Data for Name: astronomer; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.astronomer VALUES (1, 'Galileo Galilei', 1564, 'Italian', false);
INSERT INTO public.astronomer VALUES (2, 'Carl Sagan', 1934, 'American', false);
INSERT INTO public.astronomer VALUES (3, 'Edwin Hubble', 1889, 'American', false);
INSERT INTO public.astronomer VALUES (4, 'Vera Rubin', 1928, 'American', false);
INSERT INTO public.astronomer VALUES (5, 'Stephen Hawking', 1942, 'British', false);
INSERT INTO public.astronomer VALUES (6, 'William Herschel', 1738, 'German-British', false);
INSERT INTO public.astronomer VALUES (7, 'Caroline Herschel', 1750, 'German', false);
INSERT INTO public.astronomer VALUES (8, 'Annie Jump Cannon', 1863, 'American', false);
INSERT INTO public.astronomer VALUES (9, 'Neil deGrasse Tyson', 1958, 'American', true);
INSERT INTO public.astronomer VALUES (10, 'Andrea Ghez', 1965, 'American', true);


--
-- Data for Name: galaxy; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.galaxy VALUES (1, 'Milky Way', 13600, NULL, NULL);
INSERT INTO public.galaxy VALUES (2, 'Andromeda', 10000, NULL, NULL);
INSERT INTO public.galaxy VALUES (3, 'Messier 87', 13200, NULL, NULL);
INSERT INTO public.galaxy VALUES (4, 'Triangulum', 12000, false, 'Spiral');
INSERT INTO public.galaxy VALUES (5, 'Sombrero', 12700, true, 'Spiral');
INSERT INTO public.galaxy VALUES (6, 'Whirlpool', 10000, true, 'Spiral');


--
-- Data for Name: moon; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.moon VALUES (2, 'Phobos', false, 11.10, 1877, 2);
INSERT INTO public.moon VALUES (3, 'Deimos', false, 6.20, 1877, 2);
INSERT INTO public.moon VALUES (5, 'Ganymede', true, 2634.10, 1610, 7);
INSERT INTO public.moon VALUES (6, 'Callisto', true, 2410.30, 1610, 7);
INSERT INTO public.moon VALUES (7, 'Io', true, 1821.60, 1610, 7);
INSERT INTO public.moon VALUES (8, 'Titan', true, 2574.70, 1655, 8);
INSERT INTO public.moon VALUES (12, 'Rhea', true, 763.80, 1672, 8);
INSERT INTO public.moon VALUES (13, 'Dione', true, 561.40, 1684, 8);
INSERT INTO public.moon VALUES (14, 'Tethys', true, 531.10, 1684, 8);
INSERT INTO public.moon VALUES (19, 'Iapetus', true, 734.50, 1671, 8);
INSERT INTO public.moon VALUES (10, 'Triton', true, 1353.40, 1846, 10);
INSERT INTO public.moon VALUES (11, 'Charon', true, 606.00, 1978, 13);
INSERT INTO public.moon VALUES (16, 'Oberon', true, 761.40, 1787, 9);
INSERT INTO public.moon VALUES (17, 'Ariel', true, 578.90, 1851, 9);
INSERT INTO public.moon VALUES (18, 'Umbriel', true, 584.70, 1851, 9);
INSERT INTO public.moon VALUES (9, 'Enceladus', true, 252.10, 1789, 8);
INSERT INTO public.moon VALUES (15, 'Miranda', true, 235.80, 1948, 9);
INSERT INTO public.moon VALUES (20, 'Hyperion', false, 135.00, 1848, 8);
INSERT INTO public.moon VALUES (1, 'Moon', true, 1737.10, -2000, 1);
INSERT INTO public.moon VALUES (4, 'Europa', true, 1560.80, 1610, 1);


--
-- Data for Name: planet; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.planet VALUES (1, 'Earth', 'Our home planet, the only known one with life.', true, 0.00, 4500, 1);
INSERT INTO public.planet VALUES (2, 'Mars', 'Known as the Red Planet. Scientists are studying its potential to support life.', false, 1.52, 4600, 1);
INSERT INTO public.planet VALUES (3, 'Kepler-452b', 'An exoplanet located in the habitable zone of its star.', NULL, 1400.00, 6000, 2);
INSERT INTO public.planet VALUES (5, 'Venus', 'A rocky planet with a dense atmosphere and extreme surface temperatures.', false, 0.72, 4500, 3);
INSERT INTO public.planet VALUES (6, 'Mercury', 'The smallest planet and closest to the Sun, with no atmosphere.', false, 0.39, 4500, 3);
INSERT INTO public.planet VALUES (7, 'Jupiter', 'The largest planet in the Solar System, a gas giant with many moons.', false, 5.20, 4600, 4);
INSERT INTO public.planet VALUES (8, 'Saturn', 'Famous for its prominent ring system, composed mostly of ice particles.', false, 9.58, 4500, 4);
INSERT INTO public.planet VALUES (9, 'Uranus', 'An ice giant with a tilted rotation, giving it unique seasons.', false, 19.22, 4500, 5);
INSERT INTO public.planet VALUES (10, 'Neptune', 'A cold, blue planet with strong winds and dark storms.', false, 30.07, 4500, 5);
INSERT INTO public.planet VALUES (11, 'Kepler-22b', 'An exoplanet in the habitable zone, potentially Earth-like.', NULL, 600.00, 6000, 6);
INSERT INTO public.planet VALUES (12, 'Gliese 581g', 'A possibly rocky exoplanet that sparked debate about habitability.', NULL, 20.30, 7000, 6);
INSERT INTO public.planet VALUES (13, 'Proxima b', 'An exoplanet orbiting Proxima Centauri, Earth-sized and nearby.', false, 0.05, 4800, 1);
INSERT INTO public.planet VALUES (14, 'HD 209458 b', 'A gas giant known as Osiris, famous for being the first observed transiting planet.', false, 150.00, 5000, 1);


--
-- Data for Name: star; Type: TABLE DATA; Schema: public; Owner: freecodecamp
--

INSERT INTO public.star VALUES (1, 'Betelgeuse', 4, 126000.000, true);
INSERT INTO public.star VALUES (2, 'Sirius A', 5, 25.400, false);
INSERT INTO public.star VALUES (3, 'Vega', 6, 40.120, false);
INSERT INTO public.star VALUES (4, 'Rigel', 4, 120000.000, true);
INSERT INTO public.star VALUES (5, 'Altair', 5, 10.600, false);
INSERT INTO public.star VALUES (6, 'Polaris', 6, 2200.000, true);


--
-- Name: astronomer_astronomer_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.astronomer_astronomer_id_seq', 10, true);


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

SELECT pg_catalog.setval('public.planet_planet_id_seq', 14, true);


--
-- Name: star_star_id_seq; Type: SEQUENCE SET; Schema: public; Owner: freecodecamp
--

SELECT pg_catalog.setval('public.star_star_id_seq', 6, true);


--
-- Name: astronomer astronomer_name_key; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomer
    ADD CONSTRAINT astronomer_name_key UNIQUE (name);


--
-- Name: astronomer astronomer_pkey; Type: CONSTRAINT; Schema: public; Owner: freecodecamp
--

ALTER TABLE ONLY public.astronomer
    ADD CONSTRAINT astronomer_pkey PRIMARY KEY (astronomer_id);


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

