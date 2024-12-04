CREATE SEQUENCE IF NOT EXISTS evaluacioncredito_id_eva_seq;

CREATE TABLE IF NOT EXISTS EvaluacionCredito (
  id_eva bigint NOT NULL PRIMARY KEY DEFAULT nextval('evaluacioncredito_id_eva_seq'),
  rut_eva character varying,
  nombre_eva character varying,
  telefono_eva character varying,
  correo_eva character varying,
  monto_eva integer,
  plazo_eva integer,
  valorCuota_eva integer,
  tasa_eva character varying,
  fecha_venc_eva date,
  fecha_simulacion_eva timestamp,
  fecha_resolucion_eva timestamp with time zone,
  estado_eva character varying,
  resultado_eva character varying,
  observacion_eva character varying,
  archivo character varying
);

CREATE SEQUENCE IF NOT EXISTS usuario_idusuario_soc_seq;

CREATE TABLE IF NOT EXISTS Usuario (
  idusuario_soc bigint NOT NULL PRIMARY KEY DEFAULT nextval('usuario_idusuario_soc_seq'),
  nombre_soc character varying,
  apellido_soc character varying,
  rut_soc character varying,
  correo_soc character varying,
  usuario_soc character varying,
  clave_soc character varying,
  perfil_soc character varying
);

CREATE TABLE IF NOT EXISTS auth_user (
  id bigint NOT NULL PRIMARY KEY,
  password character varying,
  last_login character varying,
  is_superuser boolean,
  username character varying,
  first_name character varying,
  last_name character varying,
  email character varying,
  is_staff boolean,
  is_active boolean,
  date_joined timestamp with time zone
);

CREATE SEQUENCE IF NOT EXISTS convenio_idinstitucion_seq;

CREATE TABLE IF NOT EXISTS Convenio (
  idinstitucion bigint NOT NULL PRIMARY KEY DEFAULT nextval('convenio_idinstitucion_seq'),
  rut_institucion character varying,
  nombre_isntitucion character varying
);

ALTER TABLE Usuario ADD CONSTRAINT Usuario_rut_soc_fk FOREIGN KEY (rut_soc) REFERENCES EvaluacionCredito (rut_eva);
ALTER TABLE Usuario ADD CONSTRAINT Usuario_idusuario_soc_fk FOREIGN KEY (idusuario_soc) REFERENCES auth_user (id);
ALTER TABLE EvaluacionCredito ADD CONSTRAINT EvaluacionCredito_id_eva_fk FOREIGN KEY (id_eva) REFERENCES Convenio (idinstitucion);