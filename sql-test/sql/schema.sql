CREATE EXTENSION IF NOT EXISTS "uuid-ossp";
CREATE EXTENSION IF NOT EXISTS "citext"

CREATE TABLE order_items (
    "order_id" bigserial PRIMARY KEY NOT NULL,
    "customer_id" bigserial NOT NULL,
    "item_id" integer NOT NULL,
    "order_created_date" timestamp default NULL,
    "promo_code" character varying(255) NOT NULL,
    "price" double precision
);
