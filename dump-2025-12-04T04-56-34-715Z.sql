--
-- PostgreSQL database dump
--

-- Dumped from database version 17.4
-- Dumped by pg_dump version 17.4

SET statement_timeout = 0;
SET lock_timeout = 0;
SET idle_in_transaction_session_timeout = 0;
SET transaction_timeout = 0;
SET client_encoding = 'UTF8';
SET standard_conforming_strings = on;
SELECT pg_catalog.set_config('search_path', '', false);
SET check_function_bodies = false;
SET xmloption = content;
SET client_min_messages = warning;
SET row_security = off;

ALTER TABLE IF EXISTS ONLY public.recover_password DROP CONSTRAINT IF EXISTS recover_password_cod_usuario_fkey;
ALTER TABLE IF EXISTS ONLY conciliacion.usuario DROP CONSTRAINT IF EXISTS usuario_cod_rol_fkey;
ALTER TABLE IF EXISTS ONLY conciliacion.transaccion DROP CONSTRAINT IF EXISTS transaccion_cod_periodo_fkey;
ALTER TABLE IF EXISTS ONLY conciliacion.revision DROP CONSTRAINT IF EXISTS revision_cod_usuario_fkey;
ALTER TABLE IF EXISTS ONLY conciliacion.revision DROP CONSTRAINT IF EXISTS revision_cod_rol_fkey;
ALTER TABLE IF EXISTS ONLY conciliacion.periodo DROP CONSTRAINT IF EXISTS periodo_cod_estado_fkey;
ALTER TABLE IF EXISTS ONLY conciliacion.conciliacion DROP CONSTRAINT IF EXISTS conciliacion_cod_transaccion_fkey;
ALTER TABLE IF EXISTS ONLY conciliacion.conciliacion DROP CONSTRAINT IF EXISTS conciliacion_cod_transaccion_banco_fkey;
ALTER TABLE IF EXISTS ONLY conciliacion.conciliacion DROP CONSTRAINT IF EXISTS conciliacion_cod_revision_fkey;
ALTER TABLE IF EXISTS ONLY conciliacion.conciliacion DROP CONSTRAINT IF EXISTS conciliacion_cod_revision_automatizada_fkey;
ALTER TABLE IF EXISTS ONLY conciliacion.conciliacion DROP CONSTRAINT IF EXISTS conciliacion_cod_periodo_fkey;
ALTER TABLE IF EXISTS ONLY conciliacion.conciliacion DROP CONSTRAINT IF EXISTS conciliacion_cod_estado_fkey;
ALTER TABLE IF EXISTS ONLY conciliacion.caducidad DROP CONSTRAINT IF EXISTS caducidad_cod_usuario_fkey;
ALTER TABLE IF EXISTS ONLY conciliacion.banco DROP CONSTRAINT IF EXISTS banco_cod_periodo_fkey;
DROP INDEX IF EXISTS auditoria.idx_error_nivel;
DROP INDEX IF EXISTS auditoria.idx_error_modulo;
DROP INDEX IF EXISTS auditoria.idx_error_fecha;
ALTER TABLE IF EXISTS ONLY public.recover_password DROP CONSTRAINT IF EXISTS recover_password_pkey;
ALTER TABLE IF EXISTS ONLY conciliacion.usuario DROP CONSTRAINT IF EXISTS usuario_pkey;
ALTER TABLE IF EXISTS ONLY conciliacion.transaccion DROP CONSTRAINT IF EXISTS transaccion_pkey;
ALTER TABLE IF EXISTS ONLY conciliacion.rol DROP CONSTRAINT IF EXISTS rol_pkey;
ALTER TABLE IF EXISTS ONLY conciliacion.rol DROP CONSTRAINT IF EXISTS rol_nombre_rol_key;
ALTER TABLE IF EXISTS ONLY conciliacion.revision DROP CONSTRAINT IF EXISTS revision_pkey;
ALTER TABLE IF EXISTS ONLY conciliacion.revision_automatizada DROP CONSTRAINT IF EXISTS revision_automatizada_pkey;
ALTER TABLE IF EXISTS ONLY conciliacion.periodo DROP CONSTRAINT IF EXISTS periodo_pkey;
ALTER TABLE IF EXISTS ONLY conciliacion.estado DROP CONSTRAINT IF EXISTS estado_pkey;
ALTER TABLE IF EXISTS ONLY conciliacion.configuracion_token DROP CONSTRAINT IF EXISTS configuracion_token_pkey;
ALTER TABLE IF EXISTS ONLY conciliacion.conciliacion DROP CONSTRAINT IF EXISTS conciliacion_pkey;
ALTER TABLE IF EXISTS ONLY conciliacion.caducidad DROP CONSTRAINT IF EXISTS caducidad_pkey;
ALTER TABLE IF EXISTS ONLY conciliacion.banco DROP CONSTRAINT IF EXISTS banco_pkey;
ALTER TABLE IF EXISTS ONLY auditoria.tb_error DROP CONSTRAINT IF EXISTS tb_error_pkey;
ALTER TABLE IF EXISTS ONLY auditoria.tb_auditoria DROP CONSTRAINT IF EXISTS tb_auditoria_pkey;
ALTER TABLE IF EXISTS public.recover_password ALTER COLUMN cod_recover DROP DEFAULT;
ALTER TABLE IF EXISTS conciliacion.usuario ALTER COLUMN cod_usuario DROP DEFAULT;
ALTER TABLE IF EXISTS conciliacion.transaccion ALTER COLUMN cod_transaccion DROP DEFAULT;
ALTER TABLE IF EXISTS conciliacion.rol ALTER COLUMN cod_rol DROP DEFAULT;
ALTER TABLE IF EXISTS conciliacion.revision_automatizada ALTER COLUMN cod_revision_automatizada DROP DEFAULT;
ALTER TABLE IF EXISTS conciliacion.revision ALTER COLUMN cod_revision DROP DEFAULT;
ALTER TABLE IF EXISTS conciliacion.periodo ALTER COLUMN cod_periodo DROP DEFAULT;
ALTER TABLE IF EXISTS conciliacion.estado ALTER COLUMN cod_estado DROP DEFAULT;
ALTER TABLE IF EXISTS conciliacion.configuracion_token ALTER COLUMN cod_token DROP DEFAULT;
ALTER TABLE IF EXISTS conciliacion.conciliacion ALTER COLUMN cod_comparacion DROP DEFAULT;
ALTER TABLE IF EXISTS conciliacion.caducidad ALTER COLUMN cod_caducidad DROP DEFAULT;
ALTER TABLE IF EXISTS conciliacion.banco ALTER COLUMN cod_transaccion_banco DROP DEFAULT;
ALTER TABLE IF EXISTS auditoria.tb_error ALTER COLUMN id_error DROP DEFAULT;
ALTER TABLE IF EXISTS auditoria.tb_auditoria ALTER COLUMN id_auditoria DROP DEFAULT;
DROP SEQUENCE IF EXISTS public.recover_password_cod_recover_seq;
DROP TABLE IF EXISTS public.recover_password;
DROP SEQUENCE IF EXISTS conciliacion.usuario_cod_usuario_seq;
DROP TABLE IF EXISTS conciliacion.usuario;
DROP SEQUENCE IF EXISTS conciliacion.transaccion_cod_transaccion_seq;
DROP TABLE IF EXISTS conciliacion.transaccion;
DROP SEQUENCE IF EXISTS conciliacion.rol_cod_rol_seq;
DROP TABLE IF EXISTS conciliacion.rol;
DROP SEQUENCE IF EXISTS conciliacion.revision_cod_revision_seq;
DROP SEQUENCE IF EXISTS conciliacion.revision_automatizada_cod_revision_automatizada_seq;
DROP TABLE IF EXISTS conciliacion.revision_automatizada;
DROP TABLE IF EXISTS conciliacion.revision;
DROP SEQUENCE IF EXISTS conciliacion.periodo_cod_periodo_seq;
DROP TABLE IF EXISTS conciliacion.periodo;
DROP SEQUENCE IF EXISTS conciliacion.estado_cod_estado_seq;
DROP TABLE IF EXISTS conciliacion.estado;
DROP SEQUENCE IF EXISTS conciliacion.configuracion_token_cod_token_seq;
DROP TABLE IF EXISTS conciliacion.configuracion_token;
DROP SEQUENCE IF EXISTS conciliacion.conciliacion_cod_comparacion_seq;
DROP TABLE IF EXISTS conciliacion.conciliacion;
DROP SEQUENCE IF EXISTS conciliacion.caducidad_cod_caducidad_seq;
DROP TABLE IF EXISTS conciliacion.caducidad;
DROP SEQUENCE IF EXISTS conciliacion.banco_cod_transaccion_banco_seq;
DROP TABLE IF EXISTS conciliacion.banco;
DROP SEQUENCE IF EXISTS auditoria.tb_error_id_error_seq;
DROP TABLE IF EXISTS auditoria.tb_error;
DROP SEQUENCE IF EXISTS auditoria.tb_auditoria_id_auditoria_seq;
DROP TABLE IF EXISTS auditoria.tb_auditoria;
DROP TYPE IF EXISTS auditoria.enum_tb_error_nivel;
DROP SCHEMA IF EXISTS sistema;
DROP SCHEMA IF EXISTS conciliacion;
DROP SCHEMA IF EXISTS auditoria;
--
-- Name: auditoria; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA auditoria;


--
-- Name: conciliacion; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA conciliacion;


--
-- Name: sistema; Type: SCHEMA; Schema: -; Owner: -
--

CREATE SCHEMA sistema;


--
-- Name: enum_tb_error_nivel; Type: TYPE; Schema: auditoria; Owner: -
--

CREATE TYPE auditoria.enum_tb_error_nivel AS ENUM (
    'INFO',
    'WARNING',
    'ERROR',
    'CRITICAL'
);


SET default_tablespace = '';

SET default_table_access_method = heap;

--
-- Name: tb_auditoria; Type: TABLE; Schema: auditoria; Owner: -
--

CREATE TABLE auditoria.tb_auditoria (
    id_auditoria integer NOT NULL,
    fecha timestamp with time zone,
    accion character varying(255) NOT NULL,
    descripcion text,
    id_usuario integer,
    usuario_nombre character varying(255),
    tabla character varying(255),
    llave text
);


--
-- Name: tb_auditoria_id_auditoria_seq; Type: SEQUENCE; Schema: auditoria; Owner: -
--

CREATE SEQUENCE auditoria.tb_auditoria_id_auditoria_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tb_auditoria_id_auditoria_seq; Type: SEQUENCE OWNED BY; Schema: auditoria; Owner: -
--

ALTER SEQUENCE auditoria.tb_auditoria_id_auditoria_seq OWNED BY auditoria.tb_auditoria.id_auditoria;


--
-- Name: tb_error; Type: TABLE; Schema: auditoria; Owner: -
--

CREATE TABLE auditoria.tb_error (
    id_error integer NOT NULL,
    fecha timestamp with time zone,
    modulo character varying(100),
    nivel auditoria.enum_tb_error_nivel DEFAULT 'ERROR'::auditoria.enum_tb_error_nivel,
    mensaje text,
    detalle text,
    ip_cliente character varying(45),
    id_usuario integer,
    usuario_nombre character varying(100),
    ruta character varying(500),
    metodo_http character varying(10)
);


--
-- Name: tb_error_id_error_seq; Type: SEQUENCE; Schema: auditoria; Owner: -
--

CREATE SEQUENCE auditoria.tb_error_id_error_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: tb_error_id_error_seq; Type: SEQUENCE OWNED BY; Schema: auditoria; Owner: -
--

ALTER SEQUENCE auditoria.tb_error_id_error_seq OWNED BY auditoria.tb_error.id_error;


--
-- Name: banco; Type: TABLE; Schema: conciliacion; Owner: -
--

CREATE TABLE conciliacion.banco (
    cod_transaccion_banco integer NOT NULL,
    cod_periodo integer NOT NULL,
    nro_cuenta character varying(255) NOT NULL,
    descripcion character varying(255) NOT NULL,
    debe double precision NOT NULL,
    haber double precision NOT NULL,
    saldo double precision NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: banco_cod_transaccion_banco_seq; Type: SEQUENCE; Schema: conciliacion; Owner: -
--

CREATE SEQUENCE conciliacion.banco_cod_transaccion_banco_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: banco_cod_transaccion_banco_seq; Type: SEQUENCE OWNED BY; Schema: conciliacion; Owner: -
--

ALTER SEQUENCE conciliacion.banco_cod_transaccion_banco_seq OWNED BY conciliacion.banco.cod_transaccion_banco;


--
-- Name: caducidad; Type: TABLE; Schema: conciliacion; Owner: -
--

CREATE TABLE conciliacion.caducidad (
    cod_caducidad integer NOT NULL,
    cod_usuario integer NOT NULL,
    fecha_expiracion date NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: caducidad_cod_caducidad_seq; Type: SEQUENCE; Schema: conciliacion; Owner: -
--

CREATE SEQUENCE conciliacion.caducidad_cod_caducidad_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: caducidad_cod_caducidad_seq; Type: SEQUENCE OWNED BY; Schema: conciliacion; Owner: -
--

ALTER SEQUENCE conciliacion.caducidad_cod_caducidad_seq OWNED BY conciliacion.caducidad.cod_caducidad;


--
-- Name: conciliacion; Type: TABLE; Schema: conciliacion; Owner: -
--

CREATE TABLE conciliacion.conciliacion (
    cod_comparacion integer NOT NULL,
    cod_periodo integer NOT NULL,
    cod_transaccion integer,
    cod_transaccion_banco integer,
    cod_revision_automatizada integer NOT NULL,
    cod_revision integer,
    cod_estado integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: conciliacion_cod_comparacion_seq; Type: SEQUENCE; Schema: conciliacion; Owner: -
--

CREATE SEQUENCE conciliacion.conciliacion_cod_comparacion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: conciliacion_cod_comparacion_seq; Type: SEQUENCE OWNED BY; Schema: conciliacion; Owner: -
--

ALTER SEQUENCE conciliacion.conciliacion_cod_comparacion_seq OWNED BY conciliacion.conciliacion.cod_comparacion;


--
-- Name: configuracion_token; Type: TABLE; Schema: conciliacion; Owner: -
--

CREATE TABLE conciliacion.configuracion_token (
    cod_token integer NOT NULL,
    "expiresIn" character varying(50) NOT NULL,
    "updatedAt" timestamp with time zone,
    "createdAt" timestamp with time zone NOT NULL
);


--
-- Name: configuracion_token_cod_token_seq; Type: SEQUENCE; Schema: conciliacion; Owner: -
--

CREATE SEQUENCE conciliacion.configuracion_token_cod_token_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: configuracion_token_cod_token_seq; Type: SEQUENCE OWNED BY; Schema: conciliacion; Owner: -
--

ALTER SEQUENCE conciliacion.configuracion_token_cod_token_seq OWNED BY conciliacion.configuracion_token.cod_token;


--
-- Name: estado; Type: TABLE; Schema: conciliacion; Owner: -
--

CREATE TABLE conciliacion.estado (
    cod_estado integer NOT NULL,
    estado boolean NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: estado_cod_estado_seq; Type: SEQUENCE; Schema: conciliacion; Owner: -
--

CREATE SEQUENCE conciliacion.estado_cod_estado_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: estado_cod_estado_seq; Type: SEQUENCE OWNED BY; Schema: conciliacion; Owner: -
--

ALTER SEQUENCE conciliacion.estado_cod_estado_seq OWNED BY conciliacion.estado.cod_estado;


--
-- Name: periodo; Type: TABLE; Schema: conciliacion; Owner: -
--

CREATE TABLE conciliacion.periodo (
    cod_periodo integer NOT NULL,
    cod_estado integer NOT NULL,
    nombre_periodo character varying(255) NOT NULL,
    fecha_inicio date NOT NULL,
    fecha_fin date NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: periodo_cod_periodo_seq; Type: SEQUENCE; Schema: conciliacion; Owner: -
--

CREATE SEQUENCE conciliacion.periodo_cod_periodo_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: periodo_cod_periodo_seq; Type: SEQUENCE OWNED BY; Schema: conciliacion; Owner: -
--

ALTER SEQUENCE conciliacion.periodo_cod_periodo_seq OWNED BY conciliacion.periodo.cod_periodo;


--
-- Name: revision; Type: TABLE; Schema: conciliacion; Owner: -
--

CREATE TABLE conciliacion.revision (
    cod_revision integer NOT NULL,
    accion boolean NOT NULL,
    cod_usuario integer NOT NULL,
    cod_rol integer NOT NULL,
    observacion character varying(255),
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: revision_automatizada; Type: TABLE; Schema: conciliacion; Owner: -
--

CREATE TABLE conciliacion.revision_automatizada (
    cod_revision_automatizada integer NOT NULL,
    coincide boolean NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: COLUMN revision_automatizada.coincide; Type: COMMENT; Schema: conciliacion; Owner: -
--

COMMENT ON COLUMN conciliacion.revision_automatizada.coincide IS 'Indica si la transacción coincide con el banco (true/false)';


--
-- Name: revision_automatizada_cod_revision_automatizada_seq; Type: SEQUENCE; Schema: conciliacion; Owner: -
--

CREATE SEQUENCE conciliacion.revision_automatizada_cod_revision_automatizada_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: revision_automatizada_cod_revision_automatizada_seq; Type: SEQUENCE OWNED BY; Schema: conciliacion; Owner: -
--

ALTER SEQUENCE conciliacion.revision_automatizada_cod_revision_automatizada_seq OWNED BY conciliacion.revision_automatizada.cod_revision_automatizada;


--
-- Name: revision_cod_revision_seq; Type: SEQUENCE; Schema: conciliacion; Owner: -
--

CREATE SEQUENCE conciliacion.revision_cod_revision_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: revision_cod_revision_seq; Type: SEQUENCE OWNED BY; Schema: conciliacion; Owner: -
--

ALTER SEQUENCE conciliacion.revision_cod_revision_seq OWNED BY conciliacion.revision.cod_revision;


--
-- Name: rol; Type: TABLE; Schema: conciliacion; Owner: -
--

CREATE TABLE conciliacion.rol (
    cod_rol integer NOT NULL,
    nombre_rol character varying(255) NOT NULL
);


--
-- Name: rol_cod_rol_seq; Type: SEQUENCE; Schema: conciliacion; Owner: -
--

CREATE SEQUENCE conciliacion.rol_cod_rol_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: rol_cod_rol_seq; Type: SEQUENCE OWNED BY; Schema: conciliacion; Owner: -
--

ALTER SEQUENCE conciliacion.rol_cod_rol_seq OWNED BY conciliacion.rol.cod_rol;


--
-- Name: transaccion; Type: TABLE; Schema: conciliacion; Owner: -
--

CREATE TABLE conciliacion.transaccion (
    cod_transaccion integer NOT NULL,
    cod_periodo integer NOT NULL,
    nro_cuenta character varying(255) NOT NULL,
    descripcion character varying(255) NOT NULL,
    debe double precision NOT NULL,
    haber double precision NOT NULL,
    saldo double precision NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: transaccion_cod_transaccion_seq; Type: SEQUENCE; Schema: conciliacion; Owner: -
--

CREATE SEQUENCE conciliacion.transaccion_cod_transaccion_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: transaccion_cod_transaccion_seq; Type: SEQUENCE OWNED BY; Schema: conciliacion; Owner: -
--

ALTER SEQUENCE conciliacion.transaccion_cod_transaccion_seq OWNED BY conciliacion.transaccion.cod_transaccion;


--
-- Name: usuario; Type: TABLE; Schema: conciliacion; Owner: -
--

CREATE TABLE conciliacion.usuario (
    cod_usuario integer NOT NULL,
    cod_rol integer NOT NULL,
    nombres character varying(255) NOT NULL,
    apellidos character varying(255) NOT NULL,
    email character varying(255) NOT NULL,
    password character varying(255) NOT NULL,
    login_attempts integer DEFAULT 0,
    is_locked boolean DEFAULT false,
    lock_time timestamp with time zone,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: usuario_cod_usuario_seq; Type: SEQUENCE; Schema: conciliacion; Owner: -
--

CREATE SEQUENCE conciliacion.usuario_cod_usuario_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: usuario_cod_usuario_seq; Type: SEQUENCE OWNED BY; Schema: conciliacion; Owner: -
--

ALTER SEQUENCE conciliacion.usuario_cod_usuario_seq OWNED BY conciliacion.usuario.cod_usuario;


--
-- Name: recover_password; Type: TABLE; Schema: public; Owner: -
--

CREATE TABLE public.recover_password (
    cod_recover integer NOT NULL,
    code character varying(255) NOT NULL,
    "expiresAt" timestamp with time zone NOT NULL,
    cod_usuario integer NOT NULL,
    "createdAt" timestamp with time zone NOT NULL,
    "updatedAt" timestamp with time zone NOT NULL
);


--
-- Name: recover_password_cod_recover_seq; Type: SEQUENCE; Schema: public; Owner: -
--

CREATE SEQUENCE public.recover_password_cod_recover_seq
    AS integer
    START WITH 1
    INCREMENT BY 1
    NO MINVALUE
    NO MAXVALUE
    CACHE 1;


--
-- Name: recover_password_cod_recover_seq; Type: SEQUENCE OWNED BY; Schema: public; Owner: -
--

ALTER SEQUENCE public.recover_password_cod_recover_seq OWNED BY public.recover_password.cod_recover;


--
-- Name: tb_auditoria id_auditoria; Type: DEFAULT; Schema: auditoria; Owner: -
--

ALTER TABLE ONLY auditoria.tb_auditoria ALTER COLUMN id_auditoria SET DEFAULT nextval('auditoria.tb_auditoria_id_auditoria_seq'::regclass);


--
-- Name: tb_error id_error; Type: DEFAULT; Schema: auditoria; Owner: -
--

ALTER TABLE ONLY auditoria.tb_error ALTER COLUMN id_error SET DEFAULT nextval('auditoria.tb_error_id_error_seq'::regclass);


--
-- Name: banco cod_transaccion_banco; Type: DEFAULT; Schema: conciliacion; Owner: -
--

ALTER TABLE ONLY conciliacion.banco ALTER COLUMN cod_transaccion_banco SET DEFAULT nextval('conciliacion.banco_cod_transaccion_banco_seq'::regclass);


--
-- Name: caducidad cod_caducidad; Type: DEFAULT; Schema: conciliacion; Owner: -
--

ALTER TABLE ONLY conciliacion.caducidad ALTER COLUMN cod_caducidad SET DEFAULT nextval('conciliacion.caducidad_cod_caducidad_seq'::regclass);


--
-- Name: conciliacion cod_comparacion; Type: DEFAULT; Schema: conciliacion; Owner: -
--

ALTER TABLE ONLY conciliacion.conciliacion ALTER COLUMN cod_comparacion SET DEFAULT nextval('conciliacion.conciliacion_cod_comparacion_seq'::regclass);


--
-- Name: configuracion_token cod_token; Type: DEFAULT; Schema: conciliacion; Owner: -
--

ALTER TABLE ONLY conciliacion.configuracion_token ALTER COLUMN cod_token SET DEFAULT nextval('conciliacion.configuracion_token_cod_token_seq'::regclass);


--
-- Name: estado cod_estado; Type: DEFAULT; Schema: conciliacion; Owner: -
--

ALTER TABLE ONLY conciliacion.estado ALTER COLUMN cod_estado SET DEFAULT nextval('conciliacion.estado_cod_estado_seq'::regclass);


--
-- Name: periodo cod_periodo; Type: DEFAULT; Schema: conciliacion; Owner: -
--

ALTER TABLE ONLY conciliacion.periodo ALTER COLUMN cod_periodo SET DEFAULT nextval('conciliacion.periodo_cod_periodo_seq'::regclass);


--
-- Name: revision cod_revision; Type: DEFAULT; Schema: conciliacion; Owner: -
--

ALTER TABLE ONLY conciliacion.revision ALTER COLUMN cod_revision SET DEFAULT nextval('conciliacion.revision_cod_revision_seq'::regclass);


--
-- Name: revision_automatizada cod_revision_automatizada; Type: DEFAULT; Schema: conciliacion; Owner: -
--

ALTER TABLE ONLY conciliacion.revision_automatizada ALTER COLUMN cod_revision_automatizada SET DEFAULT nextval('conciliacion.revision_automatizada_cod_revision_automatizada_seq'::regclass);


--
-- Name: rol cod_rol; Type: DEFAULT; Schema: conciliacion; Owner: -
--

ALTER TABLE ONLY conciliacion.rol ALTER COLUMN cod_rol SET DEFAULT nextval('conciliacion.rol_cod_rol_seq'::regclass);


--
-- Name: transaccion cod_transaccion; Type: DEFAULT; Schema: conciliacion; Owner: -
--

ALTER TABLE ONLY conciliacion.transaccion ALTER COLUMN cod_transaccion SET DEFAULT nextval('conciliacion.transaccion_cod_transaccion_seq'::regclass);


--
-- Name: usuario cod_usuario; Type: DEFAULT; Schema: conciliacion; Owner: -
--

ALTER TABLE ONLY conciliacion.usuario ALTER COLUMN cod_usuario SET DEFAULT nextval('conciliacion.usuario_cod_usuario_seq'::regclass);


--
-- Name: recover_password cod_recover; Type: DEFAULT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recover_password ALTER COLUMN cod_recover SET DEFAULT nextval('public.recover_password_cod_recover_seq'::regclass);


--
-- Data for Name: tb_auditoria; Type: TABLE DATA; Schema: auditoria; Owner: -
--

COPY auditoria.tb_auditoria (id_auditoria, fecha, accion, descripcion, id_usuario, usuario_nombre, tabla, llave) FROM stdin;
\.


--
-- Data for Name: tb_error; Type: TABLE DATA; Schema: auditoria; Owner: -
--

COPY auditoria.tb_error (id_error, fecha, modulo, nivel, mensaje, detalle, ip_cliente, id_usuario, usuario_nombre, ruta, metodo_http) FROM stdin;
1	2025-12-03 23:47:08.505-05	Sistema	INFO	Servidor iniciado	{"nodeVersion":"v22.14.0"}	\N	\N	\N	\N	\N
2	2025-12-03 23:51:26.712-05	Database	ERROR	ya existe el esquema «auditoria»	{"stack":"Error\\n    at Query.run (C:\\\\Users\\\\Usuario\\\\Documents\\\\SEGURIDAD\\\\Sistema conciliación bancaria\\\\Proyecto\\\\backend\\\\node_modules\\\\sequelize\\\\lib\\\\dialects\\\\postgres\\\\query.js:50:25)\\n    at C:\\\\Users\\\\Usuario\\\\Documents\\\\SEGURIDAD\\\\Sistema conciliación bancaria\\\\Proyecto\\\\backend\\\\node_modules\\\\sequelize\\\\lib\\\\sequelize.js:315:28\\n    at process.processTicksAndRejections (node:internal/process/task_queues:105:5)\\n    at async sequelize.query (file:///C:/Users/Usuario/Documents/SEGURIDAD/Sistema%20conciliaci%C3%B3n%20bancaria/Proyecto/backend/middlewares/queryMonitor.js:61:36)\\n    at async PostgresQueryInterface.createSchema (C:\\\\Users\\\\Usuario\\\\Documents\\\\SEGURIDAD\\\\Sistema conciliación bancaria\\\\Proyecto\\\\backend\\\\node_modules\\\\sequelize\\\\lib\\\\dialects\\\\abstract\\\\query-interface.js:44:12)\\n    at async Sequelize.createSchema (C:\\\\Users\\\\Usuario\\\\Documents\\\\SEGURIDAD\\\\Sistema conciliación bancaria\\\\Proyecto\\\\backend\\\\node_modules\\\\sequelize\\\\lib\\\\sequelize.js:342:12)\\n    at async ensureSchemas (file:///C:/Users/Usuario/Documents/SEGURIDAD/Sistema%20conciliaci%C3%B3n%20bancaria/Proyecto/backend/database/ensureSchemas.js:5:5)\\n    at async main (file:///C:/Users/Usuario/Documents/SEGURIDAD/Sistema%20conciliaci%C3%B3n%20bancaria/Proyecto/backend/index.js:13:9)"}	\N	\N	\N	\N	\N
3	2025-12-03 23:51:26.929-05	Sistema	INFO	Servidor iniciado	{"nodeVersion":"v22.14.0"}	\N	\N	\N	\N	\N
4	2025-12-03 23:55:09.357-05	Database	WARNING	Query lento (1071ms)	{"query":"SELECT 1+1 AS result","tiempo_ms":1071}	\N	\N	\N	\N	\N
5	2025-12-03 23:55:09.401-05	Database	ERROR	ya existe el esquema «auditoria»	{"stack":"Error\\n    at Query.run (C:\\\\Users\\\\Usuario\\\\Documents\\\\SEGURIDAD\\\\Sistema conciliación bancaria\\\\Proyecto\\\\backend\\\\node_modules\\\\sequelize\\\\lib\\\\dialects\\\\postgres\\\\query.js:50:25)\\n    at C:\\\\Users\\\\Usuario\\\\Documents\\\\SEGURIDAD\\\\Sistema conciliación bancaria\\\\Proyecto\\\\backend\\\\node_modules\\\\sequelize\\\\lib\\\\sequelize.js:315:28\\n    at process.processTicksAndRejections (node:internal/process/task_queues:105:5)\\n    at async sequelize.query (file:///C:/Users/Usuario/Documents/SEGURIDAD/Sistema%20conciliaci%C3%B3n%20bancaria/Proyecto/backend/middlewares/queryMonitor.js:61:36)\\n    at async PostgresQueryInterface.createSchema (C:\\\\Users\\\\Usuario\\\\Documents\\\\SEGURIDAD\\\\Sistema conciliación bancaria\\\\Proyecto\\\\backend\\\\node_modules\\\\sequelize\\\\lib\\\\dialects\\\\abstract\\\\query-interface.js:44:12)\\n    at async Sequelize.createSchema (C:\\\\Users\\\\Usuario\\\\Documents\\\\SEGURIDAD\\\\Sistema conciliación bancaria\\\\Proyecto\\\\backend\\\\node_modules\\\\sequelize\\\\lib\\\\sequelize.js:342:12)\\n    at async ensureSchemas (file:///C:/Users/Usuario/Documents/SEGURIDAD/Sistema%20conciliaci%C3%B3n%20bancaria/Proyecto/backend/database/ensureSchemas.js:5:5)\\n    at async main (file:///C:/Users/Usuario/Documents/SEGURIDAD/Sistema%20conciliaci%C3%B3n%20bancaria/Proyecto/backend/index.js:13:9)"}	\N	\N	\N	\N	\N
6	2025-12-03 23:55:09.53-05	Sistema	INFO	Servidor iniciado	{"nodeVersion":"v22.14.0"}	\N	\N	\N	\N	\N
7	2025-12-03 23:55:39.161-05	Database	ERROR	ya existe el esquema «auditoria»	{"stack":"Error\\n    at Query.run (C:\\\\Users\\\\Usuario\\\\Documents\\\\SEGURIDAD\\\\Sistema conciliación bancaria\\\\Proyecto\\\\backend\\\\node_modules\\\\sequelize\\\\lib\\\\dialects\\\\postgres\\\\query.js:50:25)\\n    at C:\\\\Users\\\\Usuario\\\\Documents\\\\SEGURIDAD\\\\Sistema conciliación bancaria\\\\Proyecto\\\\backend\\\\node_modules\\\\sequelize\\\\lib\\\\sequelize.js:315:28\\n    at process.processTicksAndRejections (node:internal/process/task_queues:105:5)\\n    at async sequelize.query (file:///C:/Users/Usuario/Documents/SEGURIDAD/Sistema%20conciliaci%C3%B3n%20bancaria/Proyecto/backend/middlewares/queryMonitor.js:61:36)\\n    at async PostgresQueryInterface.createSchema (C:\\\\Users\\\\Usuario\\\\Documents\\\\SEGURIDAD\\\\Sistema conciliación bancaria\\\\Proyecto\\\\backend\\\\node_modules\\\\sequelize\\\\lib\\\\dialects\\\\abstract\\\\query-interface.js:44:12)\\n    at async Sequelize.createSchema (C:\\\\Users\\\\Usuario\\\\Documents\\\\SEGURIDAD\\\\Sistema conciliación bancaria\\\\Proyecto\\\\backend\\\\node_modules\\\\sequelize\\\\lib\\\\sequelize.js:342:12)\\n    at async ensureSchemas (file:///C:/Users/Usuario/Documents/SEGURIDAD/Sistema%20conciliaci%C3%B3n%20bancaria/Proyecto/backend/database/ensureSchemas.js:5:5)\\n    at async main (file:///C:/Users/Usuario/Documents/SEGURIDAD/Sistema%20conciliaci%C3%B3n%20bancaria/Proyecto/backend/index.js:13:9)"}	\N	\N	\N	\N	\N
8	2025-12-03 23:55:39.381-05	Sistema	INFO	Servidor iniciado	{"nodeVersion":"v22.14.0"}	\N	\N	\N	\N	\N
\.


--
-- Data for Name: banco; Type: TABLE DATA; Schema: conciliacion; Owner: -
--

COPY conciliacion.banco (cod_transaccion_banco, cod_periodo, nro_cuenta, descripcion, debe, haber, saldo, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: caducidad; Type: TABLE DATA; Schema: conciliacion; Owner: -
--

COPY conciliacion.caducidad (cod_caducidad, cod_usuario, fecha_expiracion, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: conciliacion; Type: TABLE DATA; Schema: conciliacion; Owner: -
--

COPY conciliacion.conciliacion (cod_comparacion, cod_periodo, cod_transaccion, cod_transaccion_banco, cod_revision_automatizada, cod_revision, cod_estado, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: configuracion_token; Type: TABLE DATA; Schema: conciliacion; Owner: -
--

COPY conciliacion.configuracion_token (cod_token, "expiresIn", "updatedAt", "createdAt") FROM stdin;
1	2h	2025-12-03 23:47:08.444-05	2025-12-03 23:47:08.444-05
\.


--
-- Data for Name: estado; Type: TABLE DATA; Schema: conciliacion; Owner: -
--

COPY conciliacion.estado (cod_estado, estado, "createdAt", "updatedAt") FROM stdin;
1	t	2025-12-03 23:47:08.991-05	2025-12-03 23:47:08.991-05
2	f	2025-12-03 23:47:08.991-05	2025-12-03 23:47:08.991-05
\.


--
-- Data for Name: periodo; Type: TABLE DATA; Schema: conciliacion; Owner: -
--

COPY conciliacion.periodo (cod_periodo, cod_estado, nombre_periodo, fecha_inicio, fecha_fin, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: revision; Type: TABLE DATA; Schema: conciliacion; Owner: -
--

COPY conciliacion.revision (cod_revision, accion, cod_usuario, cod_rol, observacion, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: revision_automatizada; Type: TABLE DATA; Schema: conciliacion; Owner: -
--

COPY conciliacion.revision_automatizada (cod_revision_automatizada, coincide, "createdAt", "updatedAt") FROM stdin;
1	t	2025-12-03 23:47:09.09-05	2025-12-03 23:47:09.09-05
2	f	2025-12-03 23:47:09.09-05	2025-12-03 23:47:09.09-05
\.


--
-- Data for Name: rol; Type: TABLE DATA; Schema: conciliacion; Owner: -
--

COPY conciliacion.rol (cod_rol, nombre_rol) FROM stdin;
1	Superusuario
2	Administrador
3	Gerente
4	Auditor
5	Jefe contable
6	Contador
\.


--
-- Data for Name: transaccion; Type: TABLE DATA; Schema: conciliacion; Owner: -
--

COPY conciliacion.transaccion (cod_transaccion, cod_periodo, nro_cuenta, descripcion, debe, haber, saldo, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Data for Name: usuario; Type: TABLE DATA; Schema: conciliacion; Owner: -
--

COPY conciliacion.usuario (cod_usuario, cod_rol, nombres, apellidos, email, password, login_attempts, is_locked, lock_time, "createdAt", "updatedAt") FROM stdin;
1	1	Administrador	Sistema	admin@gmail.com	$2b$10$Jj2Za91gYvKIllOY6QM.JuDxJLKz57vJ7TroGQfJxy0fMhASDlbkS	0	f	\N	2025-12-03 23:47:08.816-05	2025-12-03 23:47:08.816-05
\.


--
-- Data for Name: recover_password; Type: TABLE DATA; Schema: public; Owner: -
--

COPY public.recover_password (cod_recover, code, "expiresAt", cod_usuario, "createdAt", "updatedAt") FROM stdin;
\.


--
-- Name: tb_auditoria_id_auditoria_seq; Type: SEQUENCE SET; Schema: auditoria; Owner: -
--

SELECT pg_catalog.setval('auditoria.tb_auditoria_id_auditoria_seq', 1, false);


--
-- Name: tb_error_id_error_seq; Type: SEQUENCE SET; Schema: auditoria; Owner: -
--

SELECT pg_catalog.setval('auditoria.tb_error_id_error_seq', 8, true);


--
-- Name: banco_cod_transaccion_banco_seq; Type: SEQUENCE SET; Schema: conciliacion; Owner: -
--

SELECT pg_catalog.setval('conciliacion.banco_cod_transaccion_banco_seq', 1, false);


--
-- Name: caducidad_cod_caducidad_seq; Type: SEQUENCE SET; Schema: conciliacion; Owner: -
--

SELECT pg_catalog.setval('conciliacion.caducidad_cod_caducidad_seq', 1, false);


--
-- Name: conciliacion_cod_comparacion_seq; Type: SEQUENCE SET; Schema: conciliacion; Owner: -
--

SELECT pg_catalog.setval('conciliacion.conciliacion_cod_comparacion_seq', 1, false);


--
-- Name: configuracion_token_cod_token_seq; Type: SEQUENCE SET; Schema: conciliacion; Owner: -
--

SELECT pg_catalog.setval('conciliacion.configuracion_token_cod_token_seq', 1, true);


--
-- Name: estado_cod_estado_seq; Type: SEQUENCE SET; Schema: conciliacion; Owner: -
--

SELECT pg_catalog.setval('conciliacion.estado_cod_estado_seq', 2, true);


--
-- Name: periodo_cod_periodo_seq; Type: SEQUENCE SET; Schema: conciliacion; Owner: -
--

SELECT pg_catalog.setval('conciliacion.periodo_cod_periodo_seq', 1, false);


--
-- Name: revision_automatizada_cod_revision_automatizada_seq; Type: SEQUENCE SET; Schema: conciliacion; Owner: -
--

SELECT pg_catalog.setval('conciliacion.revision_automatizada_cod_revision_automatizada_seq', 2, true);


--
-- Name: revision_cod_revision_seq; Type: SEQUENCE SET; Schema: conciliacion; Owner: -
--

SELECT pg_catalog.setval('conciliacion.revision_cod_revision_seq', 1, false);


--
-- Name: rol_cod_rol_seq; Type: SEQUENCE SET; Schema: conciliacion; Owner: -
--

SELECT pg_catalog.setval('conciliacion.rol_cod_rol_seq', 6, true);


--
-- Name: transaccion_cod_transaccion_seq; Type: SEQUENCE SET; Schema: conciliacion; Owner: -
--

SELECT pg_catalog.setval('conciliacion.transaccion_cod_transaccion_seq', 1, false);


--
-- Name: usuario_cod_usuario_seq; Type: SEQUENCE SET; Schema: conciliacion; Owner: -
--

SELECT pg_catalog.setval('conciliacion.usuario_cod_usuario_seq', 1, true);


--
-- Name: recover_password_cod_recover_seq; Type: SEQUENCE SET; Schema: public; Owner: -
--

SELECT pg_catalog.setval('public.recover_password_cod_recover_seq', 1, false);


--
-- Name: tb_auditoria tb_auditoria_pkey; Type: CONSTRAINT; Schema: auditoria; Owner: -
--

ALTER TABLE ONLY auditoria.tb_auditoria
    ADD CONSTRAINT tb_auditoria_pkey PRIMARY KEY (id_auditoria);


--
-- Name: tb_error tb_error_pkey; Type: CONSTRAINT; Schema: auditoria; Owner: -
--

ALTER TABLE ONLY auditoria.tb_error
    ADD CONSTRAINT tb_error_pkey PRIMARY KEY (id_error);


--
-- Name: banco banco_pkey; Type: CONSTRAINT; Schema: conciliacion; Owner: -
--

ALTER TABLE ONLY conciliacion.banco
    ADD CONSTRAINT banco_pkey PRIMARY KEY (cod_transaccion_banco);


--
-- Name: caducidad caducidad_pkey; Type: CONSTRAINT; Schema: conciliacion; Owner: -
--

ALTER TABLE ONLY conciliacion.caducidad
    ADD CONSTRAINT caducidad_pkey PRIMARY KEY (cod_caducidad);


--
-- Name: conciliacion conciliacion_pkey; Type: CONSTRAINT; Schema: conciliacion; Owner: -
--

ALTER TABLE ONLY conciliacion.conciliacion
    ADD CONSTRAINT conciliacion_pkey PRIMARY KEY (cod_comparacion);


--
-- Name: configuracion_token configuracion_token_pkey; Type: CONSTRAINT; Schema: conciliacion; Owner: -
--

ALTER TABLE ONLY conciliacion.configuracion_token
    ADD CONSTRAINT configuracion_token_pkey PRIMARY KEY (cod_token);


--
-- Name: estado estado_pkey; Type: CONSTRAINT; Schema: conciliacion; Owner: -
--

ALTER TABLE ONLY conciliacion.estado
    ADD CONSTRAINT estado_pkey PRIMARY KEY (cod_estado);


--
-- Name: periodo periodo_pkey; Type: CONSTRAINT; Schema: conciliacion; Owner: -
--

ALTER TABLE ONLY conciliacion.periodo
    ADD CONSTRAINT periodo_pkey PRIMARY KEY (cod_periodo);


--
-- Name: revision_automatizada revision_automatizada_pkey; Type: CONSTRAINT; Schema: conciliacion; Owner: -
--

ALTER TABLE ONLY conciliacion.revision_automatizada
    ADD CONSTRAINT revision_automatizada_pkey PRIMARY KEY (cod_revision_automatizada);


--
-- Name: revision revision_pkey; Type: CONSTRAINT; Schema: conciliacion; Owner: -
--

ALTER TABLE ONLY conciliacion.revision
    ADD CONSTRAINT revision_pkey PRIMARY KEY (cod_revision);


--
-- Name: rol rol_nombre_rol_key; Type: CONSTRAINT; Schema: conciliacion; Owner: -
--

ALTER TABLE ONLY conciliacion.rol
    ADD CONSTRAINT rol_nombre_rol_key UNIQUE (nombre_rol);


--
-- Name: rol rol_pkey; Type: CONSTRAINT; Schema: conciliacion; Owner: -
--

ALTER TABLE ONLY conciliacion.rol
    ADD CONSTRAINT rol_pkey PRIMARY KEY (cod_rol);


--
-- Name: transaccion transaccion_pkey; Type: CONSTRAINT; Schema: conciliacion; Owner: -
--

ALTER TABLE ONLY conciliacion.transaccion
    ADD CONSTRAINT transaccion_pkey PRIMARY KEY (cod_transaccion);


--
-- Name: usuario usuario_pkey; Type: CONSTRAINT; Schema: conciliacion; Owner: -
--

ALTER TABLE ONLY conciliacion.usuario
    ADD CONSTRAINT usuario_pkey PRIMARY KEY (cod_usuario);


--
-- Name: recover_password recover_password_pkey; Type: CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recover_password
    ADD CONSTRAINT recover_password_pkey PRIMARY KEY (cod_recover);


--
-- Name: idx_error_fecha; Type: INDEX; Schema: auditoria; Owner: -
--

CREATE INDEX idx_error_fecha ON auditoria.tb_error USING btree (fecha);


--
-- Name: idx_error_modulo; Type: INDEX; Schema: auditoria; Owner: -
--

CREATE INDEX idx_error_modulo ON auditoria.tb_error USING btree (modulo);


--
-- Name: idx_error_nivel; Type: INDEX; Schema: auditoria; Owner: -
--

CREATE INDEX idx_error_nivel ON auditoria.tb_error USING btree (nivel);


--
-- Name: banco banco_cod_periodo_fkey; Type: FK CONSTRAINT; Schema: conciliacion; Owner: -
--

ALTER TABLE ONLY conciliacion.banco
    ADD CONSTRAINT banco_cod_periodo_fkey FOREIGN KEY (cod_periodo) REFERENCES conciliacion.periodo(cod_periodo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: caducidad caducidad_cod_usuario_fkey; Type: FK CONSTRAINT; Schema: conciliacion; Owner: -
--

ALTER TABLE ONLY conciliacion.caducidad
    ADD CONSTRAINT caducidad_cod_usuario_fkey FOREIGN KEY (cod_usuario) REFERENCES conciliacion.usuario(cod_usuario) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: conciliacion conciliacion_cod_estado_fkey; Type: FK CONSTRAINT; Schema: conciliacion; Owner: -
--

ALTER TABLE ONLY conciliacion.conciliacion
    ADD CONSTRAINT conciliacion_cod_estado_fkey FOREIGN KEY (cod_estado) REFERENCES conciliacion.estado(cod_estado) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: conciliacion conciliacion_cod_periodo_fkey; Type: FK CONSTRAINT; Schema: conciliacion; Owner: -
--

ALTER TABLE ONLY conciliacion.conciliacion
    ADD CONSTRAINT conciliacion_cod_periodo_fkey FOREIGN KEY (cod_periodo) REFERENCES conciliacion.periodo(cod_periodo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: conciliacion conciliacion_cod_revision_automatizada_fkey; Type: FK CONSTRAINT; Schema: conciliacion; Owner: -
--

ALTER TABLE ONLY conciliacion.conciliacion
    ADD CONSTRAINT conciliacion_cod_revision_automatizada_fkey FOREIGN KEY (cod_revision_automatizada) REFERENCES conciliacion.revision_automatizada(cod_revision_automatizada) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: conciliacion conciliacion_cod_revision_fkey; Type: FK CONSTRAINT; Schema: conciliacion; Owner: -
--

ALTER TABLE ONLY conciliacion.conciliacion
    ADD CONSTRAINT conciliacion_cod_revision_fkey FOREIGN KEY (cod_revision) REFERENCES conciliacion.revision(cod_revision) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: conciliacion conciliacion_cod_transaccion_banco_fkey; Type: FK CONSTRAINT; Schema: conciliacion; Owner: -
--

ALTER TABLE ONLY conciliacion.conciliacion
    ADD CONSTRAINT conciliacion_cod_transaccion_banco_fkey FOREIGN KEY (cod_transaccion_banco) REFERENCES conciliacion.banco(cod_transaccion_banco) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: conciliacion conciliacion_cod_transaccion_fkey; Type: FK CONSTRAINT; Schema: conciliacion; Owner: -
--

ALTER TABLE ONLY conciliacion.conciliacion
    ADD CONSTRAINT conciliacion_cod_transaccion_fkey FOREIGN KEY (cod_transaccion) REFERENCES conciliacion.transaccion(cod_transaccion) ON UPDATE CASCADE ON DELETE SET NULL;


--
-- Name: periodo periodo_cod_estado_fkey; Type: FK CONSTRAINT; Schema: conciliacion; Owner: -
--

ALTER TABLE ONLY conciliacion.periodo
    ADD CONSTRAINT periodo_cod_estado_fkey FOREIGN KEY (cod_estado) REFERENCES conciliacion.estado(cod_estado) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: revision revision_cod_rol_fkey; Type: FK CONSTRAINT; Schema: conciliacion; Owner: -
--

ALTER TABLE ONLY conciliacion.revision
    ADD CONSTRAINT revision_cod_rol_fkey FOREIGN KEY (cod_rol) REFERENCES conciliacion.rol(cod_rol);


--
-- Name: revision revision_cod_usuario_fkey; Type: FK CONSTRAINT; Schema: conciliacion; Owner: -
--

ALTER TABLE ONLY conciliacion.revision
    ADD CONSTRAINT revision_cod_usuario_fkey FOREIGN KEY (cod_usuario) REFERENCES conciliacion.usuario(cod_usuario);


--
-- Name: transaccion transaccion_cod_periodo_fkey; Type: FK CONSTRAINT; Schema: conciliacion; Owner: -
--

ALTER TABLE ONLY conciliacion.transaccion
    ADD CONSTRAINT transaccion_cod_periodo_fkey FOREIGN KEY (cod_periodo) REFERENCES conciliacion.periodo(cod_periodo) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- Name: usuario usuario_cod_rol_fkey; Type: FK CONSTRAINT; Schema: conciliacion; Owner: -
--

ALTER TABLE ONLY conciliacion.usuario
    ADD CONSTRAINT usuario_cod_rol_fkey FOREIGN KEY (cod_rol) REFERENCES conciliacion.rol(cod_rol) ON UPDATE CASCADE;


--
-- Name: recover_password recover_password_cod_usuario_fkey; Type: FK CONSTRAINT; Schema: public; Owner: -
--

ALTER TABLE ONLY public.recover_password
    ADD CONSTRAINT recover_password_cod_usuario_fkey FOREIGN KEY (cod_usuario) REFERENCES conciliacion.usuario(cod_usuario) ON UPDATE CASCADE ON DELETE CASCADE;


--
-- PostgreSQL database dump complete
--

