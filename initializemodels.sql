-- migrate:up

create extension if not exists "uuid-ossp";

create schema if not exists museum_data;

create table if not exists museum_data.guide
(
	id uuid primary key default uuid_generate_v4(),
	first_name text not null,
	last_name text not null,
	birthday date not null,
);

create table if not exists museum_data.museum
(
	id uuid primary key default uuid_generate_v4(),
	title text not null,
	adress text not null,
    rating float,
	unique(title)
);

create table if not exists museum_data.exhibit
(
	id uuid primary key default uuid_generate_v4(),
    museum_id references museum_data.museum,
	title text not null,
	info text,
	era date,
	unique(title, info)
);

create table if not exists museum_data.museum_to_guide
(
	museum_id uuid references museum_data.museum,
	exhibit_id uuid references museum_data.exhibit,
	primary key (museum_id, exhibit_id)
);

-- migrate:down