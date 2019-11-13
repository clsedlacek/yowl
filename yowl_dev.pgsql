--
-- PostgreSQL database dump
--

-- Dumped from database version 9.5.10
-- Dumped by pg_dump version 9.5.10

SET statement_timeout = 0;
SET lock_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SET check_function_bodies = false;
SET client_min_messages = warning;
SET row_security = off;

--
-- Name: plpgsql; Type: EXTENSION; Schema: -; Owner: 
--

CREATE EXTENSION IF NOT EXISTS plpgsql WITH SCHEMA pg_catalog;


--
-- Name: EXTENSION plpgsql; Type: COMMENT; Schema: -; Owner: 
--

COMMENT ON EXTENSION plpgsql IS 'PL/pgSQL procedural language';


SET search_path = public, pg_catalog;

SET default_tablespace = '';

SET default_with_oids = false;

--
-- Name: friends; Type: TABLE; Schema: public; Owner: yowl_dev
--

CREATE TABLE friends (
    from_user_id integer NOT NULL,
    to_user_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE friends OWNER TO yowl_dev;

--
-- Name: permissions; Type: TABLE; Schema: public; Owner: yowl_dev
--

CREATE TABLE permissions (
    permission_id integer NOT NULL,
    permission_name text NOT NULL,
    permission_description text
);


ALTER TABLE permissions OWNER TO yowl_dev;

--
-- Name: pose_groups; Type: TABLE; Schema: public; Owner: yowl_dev
--

CREATE TABLE pose_groups (
    group_id integer NOT NULL,
    group_name text NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE pose_groups OWNER TO yowl_dev;

--
-- Name: pose_groups_group_id_seq; Type: SEQUENCE; Schema: public; Owner: yowl_dev
--

CREATE SEQUENCE pose_groups_group_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE pose_groups_group_id_seq OWNER TO yowl_dev;

--
-- Name: pose_groups_group_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yowl_dev
--

ALTER SEQUENCE pose_groups_group_id_seq OWNED BY pose_groups.group_id;


--
-- Name: roles; Type: TABLE; Schema: public; Owner: yowl_dev
--

CREATE TABLE roles (
    role_id integer NOT NULL,
    role_name text NOT NULL,
    role_description text,
    create_at timestamp without time zone DEFAULT now() NOT NULL,
    role_priority integer NOT NULL,
    role_superuser boolean DEFAULT false NOT NULL
);


ALTER TABLE roles OWNER TO yowl_dev;

--
-- Name: roles_permissions; Type: TABLE; Schema: public; Owner: yowl_dev
--

CREATE TABLE roles_permissions (
    role_id integer NOT NULL,
    permission_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE roles_permissions OWNER TO yowl_dev;

--
-- Name: roles_role_id_seq; Type: SEQUENCE; Schema: public; Owner: yowl_dev
--

CREATE SEQUENCE roles_role_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE roles_role_id_seq OWNER TO yowl_dev;

--
-- Name: roles_role_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yowl_dev
--

ALTER SEQUENCE roles_role_id_seq OWNED BY roles.role_id;


--
-- Name: rooms; Type: TABLE; Schema: public; Owner: yowl_dev
--

CREATE TABLE rooms (
    room_id integer NOT NULL,
    room_name text NOT NULL,
    room_image_path text NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    room_max_users integer DEFAULT 12 NOT NULL,
    room_top_perspective numeric(5,2) DEFAULT 100.00 NOT NULL,
    room_bottom_perspective numeric(5,2) DEFAULT 100.00 NOT NULL,
    room_entrance_x numeric(5,2) DEFAULT 10.00 NOT NULL,
    room_entrance_y numeric(5,2) DEFAULT 90.00 NOT NULL,
    room_is_default boolean DEFAULT false NOT NULL,
    room_default_pose_orientation integer DEFAULT 1 NOT NULL
);


ALTER TABLE rooms OWNER TO yowl_dev;

--
-- Name: rooms_permissions; Type: TABLE; Schema: public; Owner: yowl_dev
--

CREATE TABLE rooms_permissions (
    permission_id integer NOT NULL,
    permission_name text NOT NULL,
    permission_description text
);


ALTER TABLE rooms_permissions OWNER TO yowl_dev;

--
-- Name: rooms_roles_permissions; Type: TABLE; Schema: public; Owner: yowl_dev
--

CREATE TABLE rooms_roles_permissions (
    room_id integer NOT NULL,
    role_id integer NOT NULL,
    permission_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE rooms_roles_permissions OWNER TO yowl_dev;

--
-- Name: rooms_room_id_seq; Type: SEQUENCE; Schema: public; Owner: yowl_dev
--

CREATE SEQUENCE rooms_room_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE rooms_room_id_seq OWNER TO yowl_dev;

--
-- Name: rooms_room_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yowl_dev
--

ALTER SEQUENCE rooms_room_id_seq OWNED BY rooms.room_id;


--
-- Name: rooms_users_permissions; Type: TABLE; Schema: public; Owner: yowl_dev
--

CREATE TABLE rooms_users_permissions (
    room_id integer NOT NULL,
    user_id integer NOT NULL,
    permission_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE rooms_users_permissions OWNER TO yowl_dev;

--
-- Name: users_poses; Type: TABLE; Schema: public; Owner: yowl_dev
--

CREATE TABLE users_poses (
    pose_id integer NOT NULL,
    pose_name text NOT NULL,
    pose_image_path_left text NOT NULL,
    pose_image_path_right text NOT NULL,
    user_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE users_poses OWNER TO yowl_dev;

--
-- Name: user_poses_pose_id_seq; Type: SEQUENCE; Schema: public; Owner: yowl_dev
--

CREATE SEQUENCE user_poses_pose_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE user_poses_pose_id_seq OWNER TO yowl_dev;

--
-- Name: user_poses_pose_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yowl_dev
--

ALTER SEQUENCE user_poses_pose_id_seq OWNED BY users_poses.pose_id;


--
-- Name: users; Type: TABLE; Schema: public; Owner: yowl_dev
--

CREATE TABLE users (
    user_id integer NOT NULL,
    user_name text NOT NULL,
    user_birthday date NOT NULL,
    user_email text NOT NULL,
    user_account_activated boolean DEFAULT false NOT NULL,
    user_superuser boolean DEFAULT false NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL,
    user_pw_hash character varying NOT NULL
);


ALTER TABLE users OWNER TO yowl_dev;

--
-- Name: users_permissions; Type: TABLE; Schema: public; Owner: yowl_dev
--

CREATE TABLE users_permissions (
    user_id integer NOT NULL,
    permission_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE users_permissions OWNER TO yowl_dev;

--
-- Name: users_roles; Type: TABLE; Schema: public; Owner: yowl_dev
--

CREATE TABLE users_roles (
    user_id integer NOT NULL,
    role_id integer NOT NULL,
    created_at timestamp without time zone DEFAULT now() NOT NULL
);


ALTER TABLE users_roles OWNER TO yowl_dev;

--
-- Name: users_user_id_seq; Type: SEQUENCE; Schema: public; Owner: yowl_dev
--

CREATE SEQUENCE users_user_id_seq
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


ALTER TABLE users_user_id_seq OWNER TO yowl_dev;

--
-- Name: users_user_id_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: yowl_dev
--

ALTER SEQUENCE users_user_id_seq OWNED BY users.user_id;


--
-- Name: group_id; Type: DEFAULT; Schema: public; Owner: yowl_dev
--

ALTER TABLE ONLY pose_groups ALTER COLUMN group_id SET DEFAULT nextval('pose_groups_group_id_seq'::regclass);


--
-- Name: role_id; Type: DEFAULT; Schema: public; Owner: yowl_dev
--

ALTER TABLE ONLY roles ALTER COLUMN role_id SET DEFAULT nextval('roles_role_id_seq'::regclass);


--
-- Name: room_id; Type: DEFAULT; Schema: public; Owner: yowl_dev
--

ALTER TABLE ONLY rooms ALTER COLUMN room_id SET DEFAULT nextval('rooms_room_id_seq'::regclass);


--
-- Name: user_id; Type: DEFAULT; Schema: public; Owner: yowl_dev
--

ALTER TABLE ONLY users ALTER COLUMN user_id SET DEFAULT nextval('users_user_id_seq'::regclass);


--
-- Name: pose_id; Type: DEFAULT; Schema: public; Owner: yowl_dev
--

ALTER TABLE ONLY users_poses ALTER COLUMN pose_id SET DEFAULT nextval('user_poses_pose_id_seq'::regclass);


--
-- Data for Name: friends; Type: TABLE DATA; Schema: public; Owner: yowl_dev
--

COPY friends (from_user_id, to_user_id, created_at) FROM stdin;
\.


--
-- Data for Name: permissions; Type: TABLE DATA; Schema: public; Owner: yowl_dev
--

COPY permissions (permission_id, permission_name, permission_description) FROM stdin;
\.


--
-- Data for Name: pose_groups; Type: TABLE DATA; Schema: public; Owner: yowl_dev
--

COPY pose_groups (group_id, group_name, user_id, created_at) FROM stdin;
\.


--
-- Name: pose_groups_group_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yowl_dev
--

SELECT pg_catalog.setval('pose_groups_group_id_seq', 1, false);


--
-- Data for Name: roles; Type: TABLE DATA; Schema: public; Owner: yowl_dev
--

COPY roles (role_id, role_name, role_description, create_at, role_priority, role_superuser) FROM stdin;
\.


--
-- Data for Name: roles_permissions; Type: TABLE DATA; Schema: public; Owner: yowl_dev
--

COPY roles_permissions (role_id, permission_id, created_at) FROM stdin;
\.


--
-- Name: roles_role_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yowl_dev
--

SELECT pg_catalog.setval('roles_role_id_seq', 1, false);


--
-- Data for Name: rooms; Type: TABLE DATA; Schema: public; Owner: yowl_dev
--

COPY rooms (room_id, room_name, room_image_path, user_id, created_at, room_max_users, room_top_perspective, room_bottom_perspective, room_entrance_x, room_entrance_y, room_is_default, room_default_pose_orientation) FROM stdin;
\.


--
-- Data for Name: rooms_permissions; Type: TABLE DATA; Schema: public; Owner: yowl_dev
--

COPY rooms_permissions (permission_id, permission_name, permission_description) FROM stdin;
\.


--
-- Data for Name: rooms_roles_permissions; Type: TABLE DATA; Schema: public; Owner: yowl_dev
--

COPY rooms_roles_permissions (room_id, role_id, permission_id, created_at) FROM stdin;
\.


--
-- Name: rooms_room_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yowl_dev
--

SELECT pg_catalog.setval('rooms_room_id_seq', 1, false);


--
-- Data for Name: rooms_users_permissions; Type: TABLE DATA; Schema: public; Owner: yowl_dev
--

COPY rooms_users_permissions (room_id, user_id, permission_id, created_at) FROM stdin;
\.


--
-- Name: user_poses_pose_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yowl_dev
--

SELECT pg_catalog.setval('user_poses_pose_id_seq', 1, false);


--
-- Data for Name: users; Type: TABLE DATA; Schema: public; Owner: yowl_dev
--

COPY users (user_id, user_name, user_birthday, user_email, user_account_activated, user_superuser, created_at, user_pw_hash) FROM stdin;
\.


--
-- Data for Name: users_permissions; Type: TABLE DATA; Schema: public; Owner: yowl_dev
--

COPY users_permissions (user_id, permission_id, created_at) FROM stdin;
\.


--
-- Data for Name: users_poses; Type: TABLE DATA; Schema: public; Owner: yowl_dev
--

COPY users_poses (pose_id, pose_name, pose_image_path_left, pose_image_path_right, user_id, created_at) FROM stdin;
\.


--
-- Data for Name: users_roles; Type: TABLE DATA; Schema: public; Owner: yowl_dev
--

COPY users_roles (user_id, role_id, created_at) FROM stdin;
\.


--
-- Name: users_user_id_seq; Type: SEQUENCE SET; Schema: public; Owner: yowl_dev
--

SELECT pg_catalog.setval('users_user_id_seq', 1, false);


--
-- Name: friends_pkey; Type: CONSTRAINT; Schema: public; Owner: yowl_dev
--

ALTER TABLE ONLY friends
    ADD CONSTRAINT friends_pkey PRIMARY KEY (from_user_id, to_user_id);


--
-- Name: permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: yowl_dev
--

ALTER TABLE ONLY permissions
    ADD CONSTRAINT permissions_pkey PRIMARY KEY (permission_id);


--
-- Name: pose_groups_pkey; Type: CONSTRAINT; Schema: public; Owner: yowl_dev
--

ALTER TABLE ONLY pose_groups
    ADD CONSTRAINT pose_groups_pkey PRIMARY KEY (group_id);


--
-- Name: roles_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: yowl_dev
--

ALTER TABLE ONLY roles_permissions
    ADD CONSTRAINT roles_permissions_pkey PRIMARY KEY (role_id, permission_id);


--
-- Name: roles_pkey; Type: CONSTRAINT; Schema: public; Owner: yowl_dev
--

ALTER TABLE ONLY roles
    ADD CONSTRAINT roles_pkey PRIMARY KEY (role_id);


--
-- Name: room_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: yowl_dev
--

ALTER TABLE ONLY rooms_permissions
    ADD CONSTRAINT room_permissions_pkey PRIMARY KEY (permission_id);


--
-- Name: room_roles_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: yowl_dev
--

ALTER TABLE ONLY rooms_roles_permissions
    ADD CONSTRAINT room_roles_permissions_pkey PRIMARY KEY (room_id, role_id, permission_id);


--
-- Name: room_users_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: yowl_dev
--

ALTER TABLE ONLY rooms_users_permissions
    ADD CONSTRAINT room_users_permissions_pkey PRIMARY KEY (room_id, user_id, permission_id);


--
-- Name: rooms_pkey; Type: CONSTRAINT; Schema: public; Owner: yowl_dev
--

ALTER TABLE ONLY rooms
    ADD CONSTRAINT rooms_pkey PRIMARY KEY (room_id);


--
-- Name: user_poses_pkey; Type: CONSTRAINT; Schema: public; Owner: yowl_dev
--

ALTER TABLE ONLY users_poses
    ADD CONSTRAINT user_poses_pkey PRIMARY KEY (pose_id);


--
-- Name: users_permissions_pkey; Type: CONSTRAINT; Schema: public; Owner: yowl_dev
--

ALTER TABLE ONLY users_permissions
    ADD CONSTRAINT users_permissions_pkey PRIMARY KEY (user_id, permission_id);


--
-- Name: users_pkey; Type: CONSTRAINT; Schema: public; Owner: yowl_dev
--

ALTER TABLE ONLY users
    ADD CONSTRAINT users_pkey PRIMARY KEY (user_id);


--
-- Name: users_roles_pkey; Type: CONSTRAINT; Schema: public; Owner: yowl_dev
--

ALTER TABLE ONLY users_roles
    ADD CONSTRAINT users_roles_pkey PRIMARY KEY (user_id, role_id);


--
-- Name: friends_from_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: yowl_dev
--

ALTER TABLE ONLY friends
    ADD CONSTRAINT friends_from_user_id_fkey FOREIGN KEY (from_user_id) REFERENCES users(user_id);


--
-- Name: friends_to_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: yowl_dev
--

ALTER TABLE ONLY friends
    ADD CONSTRAINT friends_to_user_id_fkey FOREIGN KEY (to_user_id) REFERENCES users(user_id);


--
-- Name: pose_groups_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: yowl_dev
--

ALTER TABLE ONLY pose_groups
    ADD CONSTRAINT pose_groups_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- Name: roles_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: yowl_dev
--

ALTER TABLE ONLY roles_permissions
    ADD CONSTRAINT roles_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES permissions(permission_id);


--
-- Name: roles_permissions_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: yowl_dev
--

ALTER TABLE ONLY roles_permissions
    ADD CONSTRAINT roles_permissions_role_id_fkey FOREIGN KEY (role_id) REFERENCES roles(role_id);


--
-- Name: room_roles_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: yowl_dev
--

ALTER TABLE ONLY rooms_roles_permissions
    ADD CONSTRAINT room_roles_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES rooms_permissions(permission_id);


--
-- Name: room_roles_permissions_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: yowl_dev
--

ALTER TABLE ONLY rooms_roles_permissions
    ADD CONSTRAINT room_roles_permissions_role_id_fkey FOREIGN KEY (role_id) REFERENCES roles(role_id);


--
-- Name: room_roles_permissions_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: yowl_dev
--

ALTER TABLE ONLY rooms_roles_permissions
    ADD CONSTRAINT room_roles_permissions_room_id_fkey FOREIGN KEY (room_id) REFERENCES rooms(room_id);


--
-- Name: room_users_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: yowl_dev
--

ALTER TABLE ONLY rooms_users_permissions
    ADD CONSTRAINT room_users_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES rooms_permissions(permission_id);


--
-- Name: room_users_permissions_room_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: yowl_dev
--

ALTER TABLE ONLY rooms_users_permissions
    ADD CONSTRAINT room_users_permissions_room_id_fkey FOREIGN KEY (room_id) REFERENCES rooms(room_id);


--
-- Name: room_users_permissions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: yowl_dev
--

ALTER TABLE ONLY rooms_users_permissions
    ADD CONSTRAINT room_users_permissions_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- Name: rooms_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: yowl_dev
--

ALTER TABLE ONLY rooms
    ADD CONSTRAINT rooms_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- Name: user_poses_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: yowl_dev
--

ALTER TABLE ONLY users_poses
    ADD CONSTRAINT user_poses_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- Name: users_permissions_permission_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: yowl_dev
--

ALTER TABLE ONLY users_permissions
    ADD CONSTRAINT users_permissions_permission_id_fkey FOREIGN KEY (permission_id) REFERENCES permissions(permission_id);


--
-- Name: users_permissions_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: yowl_dev
--

ALTER TABLE ONLY users_permissions
    ADD CONSTRAINT users_permissions_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- Name: users_roles_role_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: yowl_dev
--

ALTER TABLE ONLY users_roles
    ADD CONSTRAINT users_roles_role_id_fkey FOREIGN KEY (role_id) REFERENCES roles(role_id);


--
-- Name: users_roles_user_id_fkey; Type: FK CONSTRAINT; Schema: public; Owner: yowl_dev
--

ALTER TABLE ONLY users_roles
    ADD CONSTRAINT users_roles_user_id_fkey FOREIGN KEY (user_id) REFERENCES users(user_id);


--
-- Name: public; Type: ACL; Schema: -; Owner: postgres
--

REVOKE ALL ON SCHEMA public FROM PUBLIC;
REVOKE ALL ON SCHEMA public FROM postgres;
GRANT ALL ON SCHEMA public TO postgres;
GRANT ALL ON SCHEMA public TO PUBLIC;


--
-- PostgreSQL database dump complete
--

