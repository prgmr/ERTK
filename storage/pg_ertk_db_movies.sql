-- Adminer 4.6.3 PostgreSQL dump

CREATE DATABASE ertk;

\connect "ertk";

DROP TABLE IF EXISTS "themes";
DROP SEQUENCE IF EXISTS themes_id_seq;
CREATE SEQUENCE themes_id_seq INCREMENT 1 MINVALUE 1 MAXVALUE 9223372036854775807 START 1 CACHE 1;

CREATE TABLE "public"."themes" (
    "id" integer DEFAULT nextval('themes_id_seq') NOT NULL,
    "title" text,
    "url" text,
    CONSTRAINT "themes_pkey" PRIMARY KEY ("id")
) WITH (oids = false);

INSERT INTO "themes" ("id", "title", "url") VALUES
(1,	'Mamma Mia! 2',	'Сбежать на райский греческий остров, чтобы гулять по улочкам очаровательного города, наслаждаться местной кухней, танцевать до утра, кататься на яхте и влюбиться без памяти — что может быть лучше? Звучит, как идеальный план на лето… да и на всю жизнь тоже.'),
(2,	'Шпион, который меня кинул',	'Одри и Морган, лучшие подруги из Лос-Анджелеса, неожиданно оказываются в эпицентре международного заговора, когда бывший Одри заявляется к ней с толпой идущих по следу кровожадных убийц.');

-- 2018-08-26 14:40:35.858534+00

