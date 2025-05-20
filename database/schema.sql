-- ** Database generated with pgModeler (PostgreSQL Database Modeler).
-- ** pgModeler version: 1.2.0-beta1
-- ** PostgreSQL version: 17.0
-- ** Project Site: pgmodeler.io
-- ** Model Author: ---

-- ** Database creation must be performed outside a multi lined SQL file. 
-- ** These commands were put in this file only as a convenience.

-- object: simgame | type: DATABASE --
-- DROP DATABASE IF EXISTS simgame;
CREATE DATABASE simgame;
-- ddl-end --


-- object: sv_game | type: SCHEMA --
-- DROP SCHEMA IF EXISTS sv_game CASCADE;
CREATE SCHEMA sv_game;
-- ddl-end --
ALTER SCHEMA sv_game OWNER TO postgres;
-- ddl-end --

-- object: sv_debts | type: SCHEMA --
-- DROP SCHEMA IF EXISTS sv_debts CASCADE;
CREATE SCHEMA sv_debts;
-- ddl-end --
ALTER SCHEMA sv_debts OWNER TO postgres;
-- ddl-end --

SET search_path TO pg_catalog,public,sv_game,sv_debts;
-- ddl-end --

-- object: sv_game.games | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.games CASCADE;
CREATE TABLE sv_game.games (
	game_id uuid NOT NULL,
	current_date_time timestamptz,
	game_speed_multiplier numeric(3,1) NOT NULL DEFAULT 1.0,
	last_save_time timestamptz,
	game_name varchar(255) NOT NULL,
	CONSTRAINT games_pk PRIMARY KEY (game_id)
);
-- ddl-end --
ALTER TABLE sv_game.games OWNER TO postgres;
-- ddl-end --

-- object: sv_game.players | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.players CASCADE;
CREATE TABLE sv_game.players (
	player_id uuid NOT NULL,
	name varchar(255) NOT NULL,
	gender varchar(50) NOT NULL,
	appearance_data jsonb NOT NULL,
	cash_balance numeric(64,2) NOT NULL DEFAULT 0.00,
	health integer NOT NULL DEFAULT 100,
	happiness integer NOT NULL DEFAULT 100,
	karma integer NOT NULL DEFAULT 500,
	energy integer NOT NULL DEFAULT 100,
	education_level varchar(100) NOT NULL DEFAULT 'None',
	education_score integer NOT NULL DEFAULT 0,
	experience_points integer NOT NULL DEFAULT 0,
	date_of_birth date NOT NULL,
	age integer NOT NULL,
	game_id_games uuid,
	city_id_cities uuid,
	plot_id_plots uuid,
	job_id_jobs uuid,
	CONSTRAINT players_pk PRIMARY KEY (player_id)
);
-- ddl-end --
ALTER TABLE sv_game.players OWNER TO postgres;
-- ddl-end --

-- object: sv_game.banks | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.banks CASCADE;
CREATE TABLE sv_game.banks (
	bank_id uuid NOT NULL,
	name varchar(255) NOT NULL,
	reputation integer NOT NULL DEFAULT 500,
	deposit_interest_rate numeric(5,4) NOT NULL DEFAULT 0.00,
	loan_interest_rate numeric(5,4) NOT NULL DEFAULT 0.00,
	transaction_fee_rate numeric(5,4) NOT NULL DEFAULT 0.00,
	monthly_account_fee numeric(10,2) NOT NULL DEFAULT 0.00,
	stability_index numeric(5,2) NOT NULL DEFAULT 100.00,
	is_player_bank boolean NOT NULL DEFAULT FALSE,
	country_id_countries uuid,
	player_id_players uuid,
	CONSTRAINT banks_pk PRIMARY KEY (bank_id)
);
-- ddl-end --
ALTER TABLE sv_game.banks OWNER TO postgres;
-- ddl-end --

-- object: sv_game.player_bank_accounts | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.player_bank_accounts CASCADE;
CREATE TABLE sv_game.player_bank_accounts (
	account_id uuid NOT NULL,
	account_number varchar(50) NOT NULL,
	account_type varchar(50) NOT NULL,
	balance numeric(32,2) NOT NULL DEFAULT 0.00,
	is_primary boolean NOT NULL DEFAULT FALSE,
	created_date timestamptz NOT NULL,
	last_activity_date timestamptz NOT NULL,
	bank_id_banks uuid,
	player_id_players uuid,
	currency_id_currencies uuid,
	CONSTRAINT player_bank_accounts_pk PRIMARY KEY (account_id)
);
-- ddl-end --
ALTER TABLE sv_game.player_bank_accounts OWNER TO postgres;
-- ddl-end --

-- object: sv_game.countries | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.countries CASCADE;
CREATE TABLE sv_game.countries (
	country_id uuid NOT NULL,
	name varchar(255) NOT NULL,
	base_tax_rate numeric(5,2) NOT NULL,
	business_tax_rate numeric(5,2) NOT NULL,
	import_export_duty numeric(5,2) NOT NULL,
	economic_system varchar(100) NOT NULL,
	law_system varchar(100) NOT NULL,
	stability_index numeric(5,2) NOT NULL,
	crime_rate_modifier numeric(5,2) NOT NULL,
	corruption_level numeric(5,2) NOT NULL,
	growth_potential numeric(5,2) NOT NULL,
	currency_id_currencies uuid,
	CONSTRAINT countries_pk PRIMARY KEY (country_id)
);
-- ddl-end --
ALTER TABLE sv_game.countries OWNER TO postgres;
-- ddl-end --

-- object: sv_game.states | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.states CASCADE;
CREATE TABLE sv_game.states (
	state_id uuid NOT NULL,
	name varchar(255) NOT NULL,
	additional_regional_tax_rate numeric(5,2) NOT NULL DEFAULT 0.00,
	zoning_regulations_data jsonb NOT NULL,
	environmental_regulations_data jsonb NOT NULL,
	country_id_countries uuid,
	CONSTRAINT states_pk PRIMARY KEY (state_id)
);
-- ddl-end --
ALTER TABLE sv_game.states OWNER TO postgres;
-- ddl-end --

-- object: sv_game.cities | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.cities CASCADE;
CREATE TABLE sv_game.cities (
	city_id uuid NOT NULL,
	name varchar(255) NOT NULL,
	population bigint NOT NULL,
	city_type varchar(100) NOT NULL,
	size_modifier numeric(5,2) NOT NULL,
	cost_of_living_index numeric(5,2) NOT NULL,
	local_crime_rate numeric(5,2) NOT NULL,
	unemployment_rate numeric(5,2) NOT NULL,
	procedural_seed varchar(255),
	map_config_data jsonb NOT NULL,
	generated_map_layout jsonb NOT NULL,
	state_id_states uuid,
	CONSTRAINT cities_pk PRIMARY KEY (city_id)
);
-- ddl-end --
ALTER TABLE sv_game.cities OWNER TO postgres;
-- ddl-end --

-- object: sv_game.buildings | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.buildings CASCADE;
CREATE TABLE sv_game.buildings (
	building_id uuid NOT NULL,
	building_type varchar(100) NOT NULL,
	construction_cost numeric(32,2) NOT NULL,
	current_value numeric(32,2) NOT NULL,
	rent_per_month numeric(5,2) NOT NULL,
	capacity integer NOT NULL,
	maintenance_cost_per_month numeric(16,2) NOT NULL,
	condition_percentage integer NOT NULL DEFAULT 100,
	upgrade_level integer NOT NULL DEFAULT 0,
	customization_data jsonb NOT NULL,
	is_player_home boolean NOT NULL DEFAULT FALSE,
	is_company_headquarters boolean NOT NULL DEFAULT FALSE,
	player_id_players uuid,
	company_id_companies uuid,
	npc_id_npcs uuid,
	CONSTRAINT buildings_pk PRIMARY KEY (building_id)
);
-- ddl-end --
ALTER TABLE sv_game.buildings OWNER TO postgres;
-- ddl-end --

-- object: sv_game.plots | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.plots CASCADE;
CREATE TABLE sv_game.plots (
	plot_id uuid NOT NULL,
	coordinates point NOT NULL,
	is_available_for_sale boolean NOT NULL DEFAULT TRUE,
	purchase_price numeric(32,2) NOT NULL,
	current_value numeric(32,2) NOT NULL,
	zoning_type varchar(50) NOT NULL DEFAULT 'Not Zoned',
	is_empty boolean NOT NULL DEFAULT TRUE,
	last_update_time timestamptz NOT NULL,
	city_id_cities uuid,
	building_id_buildings uuid,
	player_id_players uuid,
	company_id_companies uuid,
	npc_id_npcs uuid,
	CONSTRAINT plots_pk PRIMARY KEY (plot_id)
);
-- ddl-end --
ALTER TABLE sv_game.plots OWNER TO postgres;
-- ddl-end --

-- object: sv_game.business_categories | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.business_categories CASCADE;
CREATE TABLE sv_game.business_categories (
	category_id uuid NOT NULL,
	name varchar(255) NOT NULL,
	description text,
	CONSTRAINT business_categories_pk PRIMARY KEY (category_id)
);
-- ddl-end --
ALTER TABLE sv_game.business_categories OWNER TO postgres;
-- ddl-end --

-- object: sv_game.companies | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.companies CASCADE;
CREATE TABLE sv_game.companies (
	company_id uuid NOT NULL,
	name varchar(255) NOT NULL,
	cash_balance numeric(32,2) NOT NULL DEFAULT 0.00,
	net_worth numeric(32,2) NOT NULL,
	reputation integer NOT NULL DEFAULT 500,
	market_share numeric(5,2) NOT NULL DEFAULT 0.00,
	growth_rate numeric(5,2) NOT NULL,
	founding_date date NOT NULL,
	is_publicly_traded boolean NOT NULL DEFAULT FALSE,
	production_capacity integer NOT NULL,
	r_and_d_level integer NOT NULL DEFAULT 0,
	marketing_level integer NOT NULL DEFAULT 0,
	category_id_business_categories uuid,
	player_id_players uuid,
	npc_id_npcs uuid,
	CONSTRAINT companies_pk PRIMARY KEY (company_id)
);
-- ddl-end --
ALTER TABLE sv_game.companies OWNER TO postgres;
-- ddl-end --

-- object: sv_game.company_buildings | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.company_buildings CASCADE;
CREATE TABLE sv_game.company_buildings (
	company_building_id uuid NOT NULL,
	role varchar(100) NOT NULL,
	is_active boolean NOT NULL DEFAULT TRUE,
	company_id_companies uuid,
	building_id_buildings uuid,
	CONSTRAINT company_buildings_pk PRIMARY KEY (company_building_id)
);
-- ddl-end --
ALTER TABLE sv_game.company_buildings OWNER TO postgres;
-- ddl-end --

-- object: sv_game.products | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.products CASCADE;
CREATE TABLE sv_game.products (
	product_id uuid NOT NULL,
	name varchar(255) NOT NULL,
	base_production_cost numeric(16,2) NOT NULL,
	current_market_price numeric(16,2) NOT NULL,
	quality integer NOT NULL DEFAULT 50,
	demand numeric(5,2) NOT NULL,
	supply numeric(5,2) NOT NULL,
	production_rate_per_day numeric(16,2) NOT NULL,
	company_id_companies uuid,
	category_id_business_categories uuid,
	CONSTRAINT products_pk PRIMARY KEY (product_id)
);
-- ddl-end --
ALTER TABLE sv_game.products OWNER TO postgres;
-- ddl-end --

-- object: sv_game.company_financial_history | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.company_financial_history CASCADE;
CREATE TABLE sv_game.company_financial_history (
	record_id uuid NOT NULL,
	record_date date NOT NULL,
	revenue numeric(32,2) NOT NULL,
	expenses numeric(32,2) NOT NULL,
	profit numeric(32,2) NOT NULL,
	net_worth_snapshot numeric(32,2) NOT NULL,
	employees_count integer NOT NULL,
	company_id_companies uuid,
	CONSTRAINT company_financial_history_pk PRIMARY KEY (record_id)
);
-- ddl-end --
ALTER TABLE sv_game.company_financial_history OWNER TO postgres;
-- ddl-end --

-- object: sv_game.currencies | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.currencies CASCADE;
CREATE TABLE sv_game.currencies (
	currency_id uuid NOT NULL,
	name varchar(255) NOT NULL,
	symbol varchar(10) NOT NULL,
	iso_code varchar(3) NOT NULL,
	exchange_rate_to_base_currency numeric(16,2) NOT NULL,
	volatility numeric(5,2) NOT NULL,
	CONSTRAINT currencies_pk PRIMARY KEY (currency_id)
);
-- ddl-end --
ALTER TABLE sv_game.currencies OWNER TO postgres;
-- ddl-end --

-- object: sv_game.player_currency_holdings | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.player_currency_holdings CASCADE;
CREATE TABLE sv_game.player_currency_holdings (
	holding_id uuid NOT NULL,
	amount numeric(32,2) NOT NULL DEFAULT 0.00,
	last_updated_time timestamptz NOT NULL,
	currency_id_currencies uuid,
	player_id_players uuid,
	CONSTRAINT player_currency_holdings_pk PRIMARY KEY (holding_id)
);
-- ddl-end --
ALTER TABLE sv_game.player_currency_holdings OWNER TO postgres;
-- ddl-end --

-- object: sv_game.exchange_rate_history | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.exchange_rate_history CASCADE;
CREATE TABLE sv_game.exchange_rate_history (
	history_id uuid NOT NULL,
	exchange_rate numeric(16,4) NOT NULL,
	record_time timestamptz NOT NULL,
	currency_id_currencies uuid,
	CONSTRAINT exchange_rate_history_pk PRIMARY KEY (history_id)
);
-- ddl-end --
ALTER TABLE sv_game.exchange_rate_history OWNER TO postgres;
-- ddl-end --

-- object: sv_game.stock_markets | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.stock_markets CASCADE;
CREATE TABLE sv_game.stock_markets (
	market_id uuid NOT NULL,
	name varchar(255) NOT NULL,
	opening_time time NOT NULL,
	closing_time time NOT NULL,
	CONSTRAINT stock_markets_pk PRIMARY KEY (market_id)
);
-- ddl-end --
ALTER TABLE sv_game.stock_markets OWNER TO postgres;
-- ddl-end --

-- object: sv_game.stocks | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.stocks CASCADE;
CREATE TABLE sv_game.stocks (
	stock_id uuid NOT NULL,
	ticker_symbol varchar(10) NOT NULL,
	current_price numeric(16,2) NOT NULL,
	shares_outstanding bigint NOT NULL,
	volatility numeric(5,2) NOT NULL,
	last_trade_time timestamptz NOT NULL,
	market_id_stock_markets uuid,
	company_id_companies uuid,
	CONSTRAINT stocks_pk PRIMARY KEY (stock_id)
);
-- ddl-end --
ALTER TABLE sv_game.stocks OWNER TO postgres;
-- ddl-end --

-- object: sv_game.stock_price_history | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.stock_price_history CASCADE;
CREATE TABLE sv_game.stock_price_history (
	history_id uuid NOT NULL,
	record_time timestamptz NOT NULL,
	price numeric(16,2) NOT NULL,
	volume bigint NOT NULL,
	stock_id_stocks uuid,
	CONSTRAINT stock_price_history_pk PRIMARY KEY (history_id)
);
-- ddl-end --
ALTER TABLE sv_game.stock_price_history OWNER TO postgres;
-- ddl-end --

-- object: sv_game.player_stock_holdings | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.player_stock_holdings CASCADE;
CREATE TABLE sv_game.player_stock_holdings (
	holding_id uuid NOT NULL,
	shares_owned bigint NOT NULL,
	average_purchase_price numeric(16,2) NOT NULL,
	last_updated_time timestamptz NOT NULL,
	player_id_players uuid,
	stock_id_stocks uuid,
	CONSTRAINT player_stock_holdings_pk PRIMARY KEY (holding_id)
);
-- ddl-end --
ALTER TABLE sv_game.player_stock_holdings OWNER TO postgres;
-- ddl-end --

-- object: sv_game.cryptocurrencies | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.cryptocurrencies CASCADE;
CREATE TABLE sv_game.cryptocurrencies (
	crypto_id uuid NOT NULL,
	name varchar(255) NOT NULL,
	symbol varchar(10) NOT NULL,
	current_price numeric(16,2) NOT NULL,
	volatility numeric(5,2) NOT NULL,
	supply_limit bigint,
	circulating_supply bigint NOT NULL,
	mining_difficulty numeric(16,2) NOT NULL,
	CONSTRAINT cryptocurrencies_pk PRIMARY KEY (crypto_id)
);
-- ddl-end --
ALTER TABLE sv_game.cryptocurrencies OWNER TO postgres;
-- ddl-end --

-- object: sv_game.crypto_price_history | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.crypto_price_history CASCADE;
CREATE TABLE sv_game.crypto_price_history (
	history_id uuid NOT NULL,
	record_time timestamptz NOT NULL,
	price numeric(16,2) NOT NULL,
	crypto_id_cryptocurrencies uuid,
	CONSTRAINT crypto_price_history_pk PRIMARY KEY (history_id)
);
-- ddl-end --
ALTER TABLE sv_game.crypto_price_history OWNER TO postgres;
-- ddl-end --

-- object: sv_game.player_crypto_holdings | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.player_crypto_holdings CASCADE;
CREATE TABLE sv_game.player_crypto_holdings (
	holding_id uuid NOT NULL,
	amount numeric(24,8) NOT NULL,
	average_purchase_price numeric(16,2) NOT NULL,
	last_updated_time timestamptz NOT NULL,
	player_id_players uuid,
	crypto_id_cryptocurrencies uuid,
	CONSTRAINT player_crypto_holdings_pk PRIMARY KEY (holding_id)
);
-- ddl-end --
ALTER TABLE sv_game.player_crypto_holdings OWNER TO postgres;
-- ddl-end --

-- object: sv_game.investment_opportunities | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.investment_opportunities CASCADE;
CREATE TABLE sv_game.investment_opportunities (
	opportunity_id uuid NOT NULL,
	name varchar(255) NOT NULL,
	description text NOT NULL,
	risk_level numeric(5,2) NOT NULL,
	expected_return_min numeric(5,2) NOT NULL,
	expected_return_max numeric(5,2) NOT NULL,
	duration_days integer NOT NULL,
	min_investment numeric(32,2) NOT NULL,
	max_investment numeric(32,2) NOT NULL,
	is_active boolean NOT NULL DEFAULT TRUE,
	start_date date NOT NULL,
	end_date date NOT NULL,
	CONSTRAINT investment_opportunities_pk PRIMARY KEY (opportunity_id)
);
-- ddl-end --
ALTER TABLE sv_game.investment_opportunities OWNER TO postgres;
-- ddl-end --

-- object: sv_game.player_investments | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.player_investments CASCADE;
CREATE TABLE sv_game.player_investments (
	player_investment_id uuid NOT NULL,
	amount_invested numeric(32,2) NOT NULL,
	investment_date timestamptz NOT NULL,
	expected_return_amount numeric(32,2) NOT NULL,
	actual_return_amount numeric(32,2) NOT NULL,
	status varchar(50) NOT NULL,
	completion_date timestamptz NOT NULL,
	opportunity_id_investment_opportunities uuid,
	player_id_players uuid,
	CONSTRAINT player_investments_pk PRIMARY KEY (player_investment_id)
);
-- ddl-end --
ALTER TABLE sv_game.player_investments OWNER TO postgres;
-- ddl-end --

-- object: sv_game.transactions | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.transactions CASCADE;
CREATE TABLE sv_game.transactions (
	transaction_id uuid NOT NULL,
	type varchar(100) NOT NULL,
	amount numeric(32,2) NOT NULL,
	description text NOT NULL,
	transaction_date timestamptz NOT NULL,
	related_entity_id uuid,
	related_entity_type varchar(255),
	player_id_players uuid,
	company_id_companies uuid,
	currency_id_currencies uuid,
	account_id_player_bank_accounts uuid,
	CONSTRAINT transactions_pk PRIMARY KEY (transaction_id)
);
-- ddl-end --
ALTER TABLE sv_game.transactions OWNER TO postgres;
-- ddl-end --

-- object: sv_game.bank_account_transactions | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.bank_account_transactions CASCADE;
CREATE TABLE sv_game.bank_account_transactions (
	bank_transaction_id uuid NOT NULL,
	transaction_type varchar(100) NOT NULL,
	amount numeric(32,2) NOT NULL,
	description text NOT NULL,
	transaction_date timestamptz NOT NULL,
	account_id_player_bank_accounts uuid,
	CONSTRAINT bank_account_transactions_pk PRIMARY KEY (bank_transaction_id)
);
-- ddl-end --
ALTER TABLE sv_game.bank_account_transactions OWNER TO postgres;
-- ddl-end --

-- object: sv_game.job_categories | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.job_categories CASCADE;
CREATE TABLE sv_game.job_categories (
	category_id uuid NOT NULL,
	name varchar(255) NOT NULL,
	CONSTRAINT job_categories_pk PRIMARY KEY (category_id)
);
-- ddl-end --
ALTER TABLE sv_game.job_categories OWNER TO postgres;
-- ddl-end --

-- object: sv_game.jobs | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.jobs CASCADE;
CREATE TABLE sv_game.jobs (
	job_id uuid NOT NULL,
	title varchar(255) NOT NULL,
	base_salary_per_day numeric(16,2) NOT NULL,
	required_education_level varchar(100) NOT NULL,
	required_education_score integer NOT NULL,
	required_intelligence integer NOT NULL,
	required_charisma integer NOT NULL,
	required_strength integer NOT NULL,
	xp_per_day integer NOT NULL,
	is_available boolean NOT NULL DEFAULT TRUE,
	category_id_job_categories uuid,
	company_id_companies uuid,
	CONSTRAINT jobs_pk PRIMARY KEY (job_id)
);
-- ddl-end --
ALTER TABLE sv_game.jobs OWNER TO postgres;
-- ddl-end --

-- object: sv_game.career_paths | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.career_paths CASCADE;
CREATE TABLE sv_game.career_paths (
	path_id uuid NOT NULL,
	name varchar(255) NOT NULL,
	description text NOT NULL,
	related_attribute varchar(50) NOT NULL,
	CONSTRAINT career_paths_pk PRIMARY KEY (path_id)
);
-- ddl-end --
ALTER TABLE sv_game.career_paths OWNER TO postgres;
-- ddl-end --

-- object: sv_game.player_career_progress | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.player_career_progress CASCADE;
CREATE TABLE sv_game.player_career_progress (
	progress_id uuid NOT NULL,
	level integer NOT NULL DEFAULT 1,
	xp_in_path integer NOT NULL DEFAULT 0,
	last_level_up_date timestamptz NOT NULL,
	path_id_career_paths uuid,
	player_id_players uuid,
	CONSTRAINT player_career_progress_pk PRIMARY KEY (progress_id)
);
-- ddl-end --
ALTER TABLE sv_game.player_career_progress OWNER TO postgres;
-- ddl-end --

-- object: sv_game.education_institutions | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.education_institutions CASCADE;
CREATE TABLE sv_game.education_institutions (
	institution_id uuid NOT NULL,
	name varchar(255) NOT NULL,
	type varchar(100) NOT NULL,
	CONSTRAINT education_institutions_pk PRIMARY KEY (institution_id)
);
-- ddl-end --
ALTER TABLE sv_game.education_institutions OWNER TO postgres;
-- ddl-end --

-- object: sv_game.courses | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.courses CASCADE;
CREATE TABLE sv_game.courses (
	course_id uuid NOT NULL,
	name varchar(255) NOT NULL,
	description text NOT NULL,
	cost numeric(16,2) NOT NULL,
	duration_days integer NOT NULL,
	related_attribute varchar(50) NOT NULL,
	institution_id_education_institutions uuid,
	skill_id_skills uuid,
	CONSTRAINT courses_pk PRIMARY KEY (course_id)
);
-- ddl-end --
ALTER TABLE sv_game.courses OWNER TO postgres;
-- ddl-end --

-- object: sv_game.skills | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.skills CASCADE;
CREATE TABLE sv_game.skills (
	skill_id uuid NOT NULL,
	name varchar(255) NOT NULL,
	description text NOT NULL,
	related_attribute varchar(50) NOT NULL,
	CONSTRAINT skills_pk PRIMARY KEY (skill_id)
);
-- ddl-end --
ALTER TABLE sv_game.skills OWNER TO postgres;
-- ddl-end --

-- object: sv_game.player_skills | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.player_skills CASCADE;
CREATE TABLE sv_game.player_skills (
	player_skill_id uuid NOT NULL,
	level integer NOT NULL DEFAULT 0,
	xp integer NOT NULL DEFAULT 0,
	last_updated_time timestamptz NOT NULL,
	skill_id_skills uuid,
	player_id_players uuid,
	CONSTRAINT player_skills_pk PRIMARY KEY (player_skill_id)
);
-- ddl-end --
ALTER TABLE sv_game.player_skills OWNER TO postgres;
-- ddl-end --

-- object: sv_game.bets | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.bets CASCADE;
CREATE TABLE sv_game.bets (
	bet_id uuid NOT NULL,
	type varchar(100) NOT NULL,
	amount_bet numeric(16,2) NOT NULL,
	outcome_amount numeric(16,2) NOT NULL,
	bet_date timestamptz NOT NULL,
	details jsonb NOT NULL,
	player_id_players uuid,
	debt_id_debts uuid,
	cockfight_id_cockfights uuid,
	CONSTRAINT bets_pk PRIMARY KEY (bet_id)
);
-- ddl-end --
ALTER TABLE sv_game.bets OWNER TO postgres;
-- ddl-end --

-- object: sv_game.player_attributes | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.player_attributes CASCADE;
CREATE TABLE sv_game.player_attributes (
	attribute_id uuid NOT NULL,
	strength integer NOT NULL DEFAULT 1,
	intelligence integer NOT NULL DEFAULT 1,
	charisma integer NOT NULL DEFAULT 1,
	luck integer NOT NULL DEFAULT 1,
	last_updated_time timestamptz NOT NULL,
	player_id_players uuid,
	CONSTRAINT player_attributes_pk PRIMARY KEY (attribute_id)
);
-- ddl-end --
ALTER TABLE sv_game.player_attributes OWNER TO postgres;
-- ddl-end --

-- object: sv_game.player_status_effects | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.player_status_effects CASCADE;
CREATE TABLE sv_game.player_status_effects (
	effect_id uuid NOT NULL,
	type varchar(100) NOT NULL,
	start_time timestamptz NOT NULL,
	end_time timestamptz,
	modifier_data jsonb NOT NULL,
	player_id_players uuid,
	CONSTRAINT player_status_effects_pk PRIMARY KEY (effect_id)
);
-- ddl-end --
ALTER TABLE sv_game.player_status_effects OWNER TO postgres;
-- ddl-end --

-- object: sv_game.items | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.items CASCADE;
CREATE TABLE sv_game.items (
	item_id uuid NOT NULL,
	name varchar(255) NOT NULL,
	description text NOT NULL,
	type varchar(100) NOT NULL,
	value numeric(16,2) NOT NULL,
	effect_data jsonb NOT NULL,
	CONSTRAINT items_pk PRIMARY KEY (item_id)
);
-- ddl-end --
ALTER TABLE sv_game.items OWNER TO postgres;
-- ddl-end --

-- object: sv_game.player_inventory | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.player_inventory CASCADE;
CREATE TABLE sv_game.player_inventory (
	inventory_id uuid NOT NULL,
	quantity integer NOT NULL DEFAULT 1,
	equipped boolean NOT NULL DEFAULT FALSE,
	item_id_items uuid,
	player_id_players uuid,
	CONSTRAINT player_inventory_pk PRIMARY KEY (inventory_id)
);
-- ddl-end --
ALTER TABLE sv_game.player_inventory OWNER TO postgres;
-- ddl-end --

-- object: sv_game.news_events | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.news_events CASCADE;
CREATE TABLE sv_game.news_events (
	event_id uuid NOT NULL,
	title varchar(255) NOT NULL,
	description text NOT NULL,
	event_type varchar(100) NOT NULL,
	impact_data jsonb NOT NULL,
	event_date timestamptz NOT NULL,
	is_global boolean NOT NULL DEFAULT FALSE,
	game_id_games uuid,
	country_id_countries uuid,
	city_id_cities uuid,
	CONSTRAINT news_events_pk PRIMARY KEY (event_id)
);
-- ddl-end --
ALTER TABLE sv_game.news_events OWNER TO postgres;
-- ddl-end --

-- object: games_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.players DROP CONSTRAINT IF EXISTS games_fk CASCADE;
ALTER TABLE sv_game.players ADD CONSTRAINT games_fk FOREIGN KEY (game_id_games)
REFERENCES sv_game.games (game_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: cities_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.players DROP CONSTRAINT IF EXISTS cities_fk CASCADE;
ALTER TABLE sv_game.players ADD CONSTRAINT cities_fk FOREIGN KEY (city_id_cities)
REFERENCES sv_game.cities (city_id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: plots_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.players DROP CONSTRAINT IF EXISTS plots_fk CASCADE;
ALTER TABLE sv_game.players ADD CONSTRAINT plots_fk FOREIGN KEY (plot_id_plots)
REFERENCES sv_game.plots (plot_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: jobs_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.players DROP CONSTRAINT IF EXISTS jobs_fk CASCADE;
ALTER TABLE sv_game.players ADD CONSTRAINT jobs_fk FOREIGN KEY (job_id_jobs)
REFERENCES sv_game.jobs (job_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: countries_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.states DROP CONSTRAINT IF EXISTS countries_fk CASCADE;
ALTER TABLE sv_game.states ADD CONSTRAINT countries_fk FOREIGN KEY (country_id_countries)
REFERENCES sv_game.countries (country_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: states_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.cities DROP CONSTRAINT IF EXISTS states_fk CASCADE;
ALTER TABLE sv_game.cities ADD CONSTRAINT states_fk FOREIGN KEY (state_id_states)
REFERENCES sv_game.states (state_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: cities_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.plots DROP CONSTRAINT IF EXISTS cities_fk CASCADE;
ALTER TABLE sv_game.plots ADD CONSTRAINT cities_fk FOREIGN KEY (city_id_cities)
REFERENCES sv_game.cities (city_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: buildings_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.plots DROP CONSTRAINT IF EXISTS buildings_fk CASCADE;
ALTER TABLE sv_game.plots ADD CONSTRAINT buildings_fk FOREIGN KEY (building_id_buildings)
REFERENCES sv_game.buildings (building_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: plots_uq | type: CONSTRAINT --
-- ALTER TABLE sv_game.plots DROP CONSTRAINT IF EXISTS plots_uq CASCADE;
ALTER TABLE sv_game.plots ADD CONSTRAINT plots_uq UNIQUE (building_id_buildings);
-- ddl-end --

-- object: players_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.plots DROP CONSTRAINT IF EXISTS players_fk CASCADE;
ALTER TABLE sv_game.plots ADD CONSTRAINT players_fk FOREIGN KEY (player_id_players)
REFERENCES sv_game.players (player_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: companies_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.plots DROP CONSTRAINT IF EXISTS companies_fk CASCADE;
ALTER TABLE sv_game.plots ADD CONSTRAINT companies_fk FOREIGN KEY (company_id_companies)
REFERENCES sv_game.companies (company_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: players_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.buildings DROP CONSTRAINT IF EXISTS players_fk CASCADE;
ALTER TABLE sv_game.buildings ADD CONSTRAINT players_fk FOREIGN KEY (player_id_players)
REFERENCES sv_game.players (player_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: companies_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.buildings DROP CONSTRAINT IF EXISTS companies_fk CASCADE;
ALTER TABLE sv_game.buildings ADD CONSTRAINT companies_fk FOREIGN KEY (company_id_companies)
REFERENCES sv_game.companies (company_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: sv_game.company_hqs | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.company_hqs CASCADE;
CREATE TABLE sv_game.company_hqs (
	company_hq_id uuid NOT NULL,
	company_id_companies uuid,
	building_id_buildings uuid,
	CONSTRAINT company_hqs_pk PRIMARY KEY (company_hq_id)
);
-- ddl-end --
ALTER TABLE sv_game.company_hqs OWNER TO postgres;
-- ddl-end --

-- object: companies_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.company_hqs DROP CONSTRAINT IF EXISTS companies_fk CASCADE;
ALTER TABLE sv_game.company_hqs ADD CONSTRAINT companies_fk FOREIGN KEY (company_id_companies)
REFERENCES sv_game.companies (company_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: company_hqs_uq | type: CONSTRAINT --
-- ALTER TABLE sv_game.company_hqs DROP CONSTRAINT IF EXISTS company_hqs_uq CASCADE;
ALTER TABLE sv_game.company_hqs ADD CONSTRAINT company_hqs_uq UNIQUE (company_id_companies);
-- ddl-end --

-- object: buildings_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.company_hqs DROP CONSTRAINT IF EXISTS buildings_fk CASCADE;
ALTER TABLE sv_game.company_hqs ADD CONSTRAINT buildings_fk FOREIGN KEY (building_id_buildings)
REFERENCES sv_game.buildings (building_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: company_hqs_uq1 | type: CONSTRAINT --
-- ALTER TABLE sv_game.company_hqs DROP CONSTRAINT IF EXISTS company_hqs_uq1 CASCADE;
ALTER TABLE sv_game.company_hqs ADD CONSTRAINT company_hqs_uq1 UNIQUE (building_id_buildings);
-- ddl-end --

-- object: companies_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.company_buildings DROP CONSTRAINT IF EXISTS companies_fk CASCADE;
ALTER TABLE sv_game.company_buildings ADD CONSTRAINT companies_fk FOREIGN KEY (company_id_companies)
REFERENCES sv_game.companies (company_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: buildings_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.company_buildings DROP CONSTRAINT IF EXISTS buildings_fk CASCADE;
ALTER TABLE sv_game.company_buildings ADD CONSTRAINT buildings_fk FOREIGN KEY (building_id_buildings)
REFERENCES sv_game.buildings (building_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: business_categories_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.companies DROP CONSTRAINT IF EXISTS business_categories_fk CASCADE;
ALTER TABLE sv_game.companies ADD CONSTRAINT business_categories_fk FOREIGN KEY (category_id_business_categories)
REFERENCES sv_game.business_categories (category_id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: companies_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.products DROP CONSTRAINT IF EXISTS companies_fk CASCADE;
ALTER TABLE sv_game.products ADD CONSTRAINT companies_fk FOREIGN KEY (company_id_companies)
REFERENCES sv_game.companies (company_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: business_categories_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.products DROP CONSTRAINT IF EXISTS business_categories_fk CASCADE;
ALTER TABLE sv_game.products ADD CONSTRAINT business_categories_fk FOREIGN KEY (category_id_business_categories)
REFERENCES sv_game.business_categories (category_id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: companies_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.company_financial_history DROP CONSTRAINT IF EXISTS companies_fk CASCADE;
ALTER TABLE sv_game.company_financial_history ADD CONSTRAINT companies_fk FOREIGN KEY (company_id_companies)
REFERENCES sv_game.companies (company_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: currencies_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.countries DROP CONSTRAINT IF EXISTS currencies_fk CASCADE;
ALTER TABLE sv_game.countries ADD CONSTRAINT currencies_fk FOREIGN KEY (currency_id_currencies)
REFERENCES sv_game.currencies (currency_id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: currencies_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.player_currency_holdings DROP CONSTRAINT IF EXISTS currencies_fk CASCADE;
ALTER TABLE sv_game.player_currency_holdings ADD CONSTRAINT currencies_fk FOREIGN KEY (currency_id_currencies)
REFERENCES sv_game.currencies (currency_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: players_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.player_currency_holdings DROP CONSTRAINT IF EXISTS players_fk CASCADE;
ALTER TABLE sv_game.player_currency_holdings ADD CONSTRAINT players_fk FOREIGN KEY (player_id_players)
REFERENCES sv_game.players (player_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: currencies_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.exchange_rate_history DROP CONSTRAINT IF EXISTS currencies_fk CASCADE;
ALTER TABLE sv_game.exchange_rate_history ADD CONSTRAINT currencies_fk FOREIGN KEY (currency_id_currencies)
REFERENCES sv_game.currencies (currency_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: stock_markets_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.stocks DROP CONSTRAINT IF EXISTS stock_markets_fk CASCADE;
ALTER TABLE sv_game.stocks ADD CONSTRAINT stock_markets_fk FOREIGN KEY (market_id_stock_markets)
REFERENCES sv_game.stock_markets (market_id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: stocks_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.stock_price_history DROP CONSTRAINT IF EXISTS stocks_fk CASCADE;
ALTER TABLE sv_game.stock_price_history ADD CONSTRAINT stocks_fk FOREIGN KEY (stock_id_stocks)
REFERENCES sv_game.stocks (stock_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: players_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.player_stock_holdings DROP CONSTRAINT IF EXISTS players_fk CASCADE;
ALTER TABLE sv_game.player_stock_holdings ADD CONSTRAINT players_fk FOREIGN KEY (player_id_players)
REFERENCES sv_game.players (player_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: stocks_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.player_stock_holdings DROP CONSTRAINT IF EXISTS stocks_fk CASCADE;
ALTER TABLE sv_game.player_stock_holdings ADD CONSTRAINT stocks_fk FOREIGN KEY (stock_id_stocks)
REFERENCES sv_game.stocks (stock_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: cryptocurrencies_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.crypto_price_history DROP CONSTRAINT IF EXISTS cryptocurrencies_fk CASCADE;
ALTER TABLE sv_game.crypto_price_history ADD CONSTRAINT cryptocurrencies_fk FOREIGN KEY (crypto_id_cryptocurrencies)
REFERENCES sv_game.cryptocurrencies (crypto_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: players_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.player_crypto_holdings DROP CONSTRAINT IF EXISTS players_fk CASCADE;
ALTER TABLE sv_game.player_crypto_holdings ADD CONSTRAINT players_fk FOREIGN KEY (player_id_players)
REFERENCES sv_game.players (player_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: cryptocurrencies_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.player_crypto_holdings DROP CONSTRAINT IF EXISTS cryptocurrencies_fk CASCADE;
ALTER TABLE sv_game.player_crypto_holdings ADD CONSTRAINT cryptocurrencies_fk FOREIGN KEY (crypto_id_cryptocurrencies)
REFERENCES sv_game.cryptocurrencies (crypto_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: investment_opportunities_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.player_investments DROP CONSTRAINT IF EXISTS investment_opportunities_fk CASCADE;
ALTER TABLE sv_game.player_investments ADD CONSTRAINT investment_opportunities_fk FOREIGN KEY (opportunity_id_investment_opportunities)
REFERENCES sv_game.investment_opportunities (opportunity_id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: players_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.player_investments DROP CONSTRAINT IF EXISTS players_fk CASCADE;
ALTER TABLE sv_game.player_investments ADD CONSTRAINT players_fk FOREIGN KEY (player_id_players)
REFERENCES sv_game.players (player_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: players_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.transactions DROP CONSTRAINT IF EXISTS players_fk CASCADE;
ALTER TABLE sv_game.transactions ADD CONSTRAINT players_fk FOREIGN KEY (player_id_players)
REFERENCES sv_game.players (player_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: companies_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.transactions DROP CONSTRAINT IF EXISTS companies_fk CASCADE;
ALTER TABLE sv_game.transactions ADD CONSTRAINT companies_fk FOREIGN KEY (company_id_companies)
REFERENCES sv_game.companies (company_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: currencies_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.transactions DROP CONSTRAINT IF EXISTS currencies_fk CASCADE;
ALTER TABLE sv_game.transactions ADD CONSTRAINT currencies_fk FOREIGN KEY (currency_id_currencies)
REFERENCES sv_game.currencies (currency_id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: job_categories_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.jobs DROP CONSTRAINT IF EXISTS job_categories_fk CASCADE;
ALTER TABLE sv_game.jobs ADD CONSTRAINT job_categories_fk FOREIGN KEY (category_id_job_categories)
REFERENCES sv_game.job_categories (category_id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: companies_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.jobs DROP CONSTRAINT IF EXISTS companies_fk CASCADE;
ALTER TABLE sv_game.jobs ADD CONSTRAINT companies_fk FOREIGN KEY (company_id_companies)
REFERENCES sv_game.companies (company_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: career_paths_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.player_career_progress DROP CONSTRAINT IF EXISTS career_paths_fk CASCADE;
ALTER TABLE sv_game.player_career_progress ADD CONSTRAINT career_paths_fk FOREIGN KEY (path_id_career_paths)
REFERENCES sv_game.career_paths (path_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: players_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.player_career_progress DROP CONSTRAINT IF EXISTS players_fk CASCADE;
ALTER TABLE sv_game.player_career_progress ADD CONSTRAINT players_fk FOREIGN KEY (player_id_players)
REFERENCES sv_game.players (player_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: education_institutions_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.courses DROP CONSTRAINT IF EXISTS education_institutions_fk CASCADE;
ALTER TABLE sv_game.courses ADD CONSTRAINT education_institutions_fk FOREIGN KEY (institution_id_education_institutions)
REFERENCES sv_game.education_institutions (institution_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: skills_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.courses DROP CONSTRAINT IF EXISTS skills_fk CASCADE;
ALTER TABLE sv_game.courses ADD CONSTRAINT skills_fk FOREIGN KEY (skill_id_skills)
REFERENCES sv_game.skills (skill_id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: skills_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.player_skills DROP CONSTRAINT IF EXISTS skills_fk CASCADE;
ALTER TABLE sv_game.player_skills ADD CONSTRAINT skills_fk FOREIGN KEY (skill_id_skills)
REFERENCES sv_game.skills (skill_id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: players_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.player_skills DROP CONSTRAINT IF EXISTS players_fk CASCADE;
ALTER TABLE sv_game.player_skills ADD CONSTRAINT players_fk FOREIGN KEY (player_id_players)
REFERENCES sv_game.players (player_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: players_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.bets DROP CONSTRAINT IF EXISTS players_fk CASCADE;
ALTER TABLE sv_game.bets ADD CONSTRAINT players_fk FOREIGN KEY (player_id_players)
REFERENCES sv_game.players (player_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: players_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.player_status_effects DROP CONSTRAINT IF EXISTS players_fk CASCADE;
ALTER TABLE sv_game.player_status_effects ADD CONSTRAINT players_fk FOREIGN KEY (player_id_players)
REFERENCES sv_game.players (player_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: items_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.player_inventory DROP CONSTRAINT IF EXISTS items_fk CASCADE;
ALTER TABLE sv_game.player_inventory ADD CONSTRAINT items_fk FOREIGN KEY (item_id_items)
REFERENCES sv_game.items (item_id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: players_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.player_inventory DROP CONSTRAINT IF EXISTS players_fk CASCADE;
ALTER TABLE sv_game.player_inventory ADD CONSTRAINT players_fk FOREIGN KEY (player_id_players)
REFERENCES sv_game.players (player_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: games_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.news_events DROP CONSTRAINT IF EXISTS games_fk CASCADE;
ALTER TABLE sv_game.news_events ADD CONSTRAINT games_fk FOREIGN KEY (game_id_games)
REFERENCES sv_game.games (game_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: countries_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.news_events DROP CONSTRAINT IF EXISTS countries_fk CASCADE;
ALTER TABLE sv_game.news_events ADD CONSTRAINT countries_fk FOREIGN KEY (country_id_countries)
REFERENCES sv_game.countries (country_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: cities_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.news_events DROP CONSTRAINT IF EXISTS cities_fk CASCADE;
ALTER TABLE sv_game.news_events ADD CONSTRAINT cities_fk FOREIGN KEY (city_id_cities)
REFERENCES sv_game.cities (city_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: countries_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.banks DROP CONSTRAINT IF EXISTS countries_fk CASCADE;
ALTER TABLE sv_game.banks ADD CONSTRAINT countries_fk FOREIGN KEY (country_id_countries)
REFERENCES sv_game.countries (country_id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: banks_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.player_bank_accounts DROP CONSTRAINT IF EXISTS banks_fk CASCADE;
ALTER TABLE sv_game.player_bank_accounts ADD CONSTRAINT banks_fk FOREIGN KEY (bank_id_banks)
REFERENCES sv_game.banks (bank_id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: players_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.player_bank_accounts DROP CONSTRAINT IF EXISTS players_fk CASCADE;
ALTER TABLE sv_game.player_bank_accounts ADD CONSTRAINT players_fk FOREIGN KEY (player_id_players)
REFERENCES sv_game.players (player_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: currencies_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.player_bank_accounts DROP CONSTRAINT IF EXISTS currencies_fk CASCADE;
ALTER TABLE sv_game.player_bank_accounts ADD CONSTRAINT currencies_fk FOREIGN KEY (currency_id_currencies)
REFERENCES sv_game.currencies (currency_id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: player_bank_accounts_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.transactions DROP CONSTRAINT IF EXISTS player_bank_accounts_fk CASCADE;
ALTER TABLE sv_game.transactions ADD CONSTRAINT player_bank_accounts_fk FOREIGN KEY (account_id_player_bank_accounts)
REFERENCES sv_game.player_bank_accounts (account_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: player_bank_accounts_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.bank_account_transactions DROP CONSTRAINT IF EXISTS player_bank_accounts_fk CASCADE;
ALTER TABLE sv_game.bank_account_transactions ADD CONSTRAINT player_bank_accounts_fk FOREIGN KEY (account_id_player_bank_accounts)
REFERENCES sv_game.player_bank_accounts (account_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: sv_game.npcs | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.npcs CASCADE;
CREATE TABLE sv_game.npcs (
	npc_id uuid NOT NULL,
	name varchar(255) NOT NULL,
	gender varchar(50) NOT NULL,
	appearance_data jsonb,
	occupation varchar(100),
	job_title varchar(255),
	intelligence integer NOT NULL,
	charisma integer NOT NULL,
	strength integer NOT NULL,
	luck integer NOT NULL,
	personality_traits jsonb,
	financial_status varchar(50) NOT NULL,
	is_essential boolean NOT NULL DEFAULT FALSE,
	status varchar(50) NOT NULL DEFAULT 'Available',
	karma integer NOT NULL DEFAULT 500,
	notes text,
	game_id_games uuid,
	city_id_cities uuid,
	plot_id_plots uuid,
	CONSTRAINT npcs_pk PRIMARY KEY (npc_id)
);
-- ddl-end --
ALTER TABLE sv_game.npcs OWNER TO postgres;
-- ddl-end --

-- object: games_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.npcs DROP CONSTRAINT IF EXISTS games_fk CASCADE;
ALTER TABLE sv_game.npcs ADD CONSTRAINT games_fk FOREIGN KEY (game_id_games)
REFERENCES sv_game.games (game_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: cities_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.npcs DROP CONSTRAINT IF EXISTS cities_fk CASCADE;
ALTER TABLE sv_game.npcs ADD CONSTRAINT cities_fk FOREIGN KEY (city_id_cities)
REFERENCES sv_game.cities (city_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: plots_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.npcs DROP CONSTRAINT IF EXISTS plots_fk CASCADE;
ALTER TABLE sv_game.npcs ADD CONSTRAINT plots_fk FOREIGN KEY (plot_id_plots)
REFERENCES sv_game.plots (plot_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: players_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.companies DROP CONSTRAINT IF EXISTS players_fk CASCADE;
ALTER TABLE sv_game.companies ADD CONSTRAINT players_fk FOREIGN KEY (player_id_players)
REFERENCES sv_game.players (player_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: players_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.banks DROP CONSTRAINT IF EXISTS players_fk CASCADE;
ALTER TABLE sv_game.banks ADD CONSTRAINT players_fk FOREIGN KEY (player_id_players)
REFERENCES sv_game.players (player_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: sv_game.npc_stock_holdings | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.npc_stock_holdings CASCADE;
CREATE TABLE sv_game.npc_stock_holdings (
	holding_id uuid NOT NULL,
	shares_owned bigint NOT NULL,
	average_purchase_price numeric(16,2) NOT NULL,
	last_updated_time timestamptz NOT NULL,
	stock_id_stocks uuid,
	npc_id_npcs uuid,
	CONSTRAINT npc_stock_holdings_pk PRIMARY KEY (holding_id)
);
-- ddl-end --
ALTER TABLE sv_game.npc_stock_holdings OWNER TO postgres;
-- ddl-end --

-- object: stocks_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.npc_stock_holdings DROP CONSTRAINT IF EXISTS stocks_fk CASCADE;
ALTER TABLE sv_game.npc_stock_holdings ADD CONSTRAINT stocks_fk FOREIGN KEY (stock_id_stocks)
REFERENCES sv_game.stocks (stock_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: npcs_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.npc_stock_holdings DROP CONSTRAINT IF EXISTS npcs_fk CASCADE;
ALTER TABLE sv_game.npc_stock_holdings ADD CONSTRAINT npcs_fk FOREIGN KEY (npc_id_npcs)
REFERENCES sv_game.npcs (npc_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: npcs_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.plots DROP CONSTRAINT IF EXISTS npcs_fk CASCADE;
ALTER TABLE sv_game.plots ADD CONSTRAINT npcs_fk FOREIGN KEY (npc_id_npcs)
REFERENCES sv_game.npcs (npc_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: npcs_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.buildings DROP CONSTRAINT IF EXISTS npcs_fk CASCADE;
ALTER TABLE sv_game.buildings ADD CONSTRAINT npcs_fk FOREIGN KEY (npc_id_npcs)
REFERENCES sv_game.npcs (npc_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: npcs_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.companies DROP CONSTRAINT IF EXISTS npcs_fk CASCADE;
ALTER TABLE sv_game.companies ADD CONSTRAINT npcs_fk FOREIGN KEY (npc_id_npcs)
REFERENCES sv_game.npcs (npc_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: sv_game.player_npc_relationships | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.player_npc_relationships CASCADE;
CREATE TABLE sv_game.player_npc_relationships (
	relationship_id uuid NOT NULL,
	relationship_type varchar(50) NOT NULL DEFAULT 'Neutral',
	level integer NOT NULL DEFAULT 0,
	last_interaction_date timestamptz,
	npc_id_npcs uuid,
	player_id_players uuid,
	CONSTRAINT player_npc_relationships_pk PRIMARY KEY (relationship_id)
);
-- ddl-end --
ALTER TABLE sv_game.player_npc_relationships OWNER TO postgres;
-- ddl-end --

-- object: npcs_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.player_npc_relationships DROP CONSTRAINT IF EXISTS npcs_fk CASCADE;
ALTER TABLE sv_game.player_npc_relationships ADD CONSTRAINT npcs_fk FOREIGN KEY (npc_id_npcs)
REFERENCES sv_game.npcs (npc_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: players_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.player_npc_relationships DROP CONSTRAINT IF EXISTS players_fk CASCADE;
ALTER TABLE sv_game.player_npc_relationships ADD CONSTRAINT players_fk FOREIGN KEY (player_id_players)
REFERENCES sv_game.players (player_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: sv_game.nfts | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.nfts CASCADE;
CREATE TABLE sv_game.nfts (
	nft_id uuid NOT NULL,
	contract_address varchar(255),
	token_id varchar(255),
	name varchar(255) NOT NULL,
	description text,
	image_path varchar(255),
	generation_params jsonb,
	creation_date timestamptz NOT NULL,
	initial_value numeric(32,2) NOT NULL,
	current_value numeric(32,2) NOT NULL,
	game_id_games uuid,
	player_id_players uuid,
	npc_id_npcs uuid,
	CONSTRAINT nfts_pk PRIMARY KEY (nft_id)
);
-- ddl-end --
ALTER TABLE sv_game.nfts OWNER TO postgres;
-- ddl-end --

-- object: sv_game.player_nft_holdings | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.player_nft_holdings CASCADE;
CREATE TABLE sv_game.player_nft_holdings (
	holding_id uuid NOT NULL,
	acquisition_date timestamptz NOT NULL,
	acquisition_price numeric(32,2) NOT NULL,
	is_listed_for_sale boolean NOT NULL DEFAULT FALSE,
	listing_price numeric(32,2),
	nft_id_nfts uuid,
	player_id_players uuid,
	CONSTRAINT player_nft_holdings_pk PRIMARY KEY (holding_id)
);
-- ddl-end --
ALTER TABLE sv_game.player_nft_holdings OWNER TO postgres;
-- ddl-end --

-- object: games_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.nfts DROP CONSTRAINT IF EXISTS games_fk CASCADE;
ALTER TABLE sv_game.nfts ADD CONSTRAINT games_fk FOREIGN KEY (game_id_games)
REFERENCES sv_game.games (game_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: nfts_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.player_nft_holdings DROP CONSTRAINT IF EXISTS nfts_fk CASCADE;
ALTER TABLE sv_game.player_nft_holdings ADD CONSTRAINT nfts_fk FOREIGN KEY (nft_id_nfts)
REFERENCES sv_game.nfts (nft_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: player_nft_holdings_uq | type: CONSTRAINT --
-- ALTER TABLE sv_game.player_nft_holdings DROP CONSTRAINT IF EXISTS player_nft_holdings_uq CASCADE;
ALTER TABLE sv_game.player_nft_holdings ADD CONSTRAINT player_nft_holdings_uq UNIQUE (nft_id_nfts);
-- ddl-end --

-- object: players_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.player_nft_holdings DROP CONSTRAINT IF EXISTS players_fk CASCADE;
ALTER TABLE sv_game.player_nft_holdings ADD CONSTRAINT players_fk FOREIGN KEY (player_id_players)
REFERENCES sv_game.players (player_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: players_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.nfts DROP CONSTRAINT IF EXISTS players_fk CASCADE;
ALTER TABLE sv_game.nfts ADD CONSTRAINT players_fk FOREIGN KEY (player_id_players)
REFERENCES sv_game.players (player_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: npcs_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.nfts DROP CONSTRAINT IF EXISTS npcs_fk CASCADE;
ALTER TABLE sv_game.nfts ADD CONSTRAINT npcs_fk FOREIGN KEY (npc_id_npcs)
REFERENCES sv_game.npcs (npc_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: sv_game.debts | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.debts CASCADE;
CREATE TABLE sv_game.debts (
	debt_id uuid NOT NULL,
	debt_type varchar(50) NOT NULL DEFAULT 'Loan',
	original_value numeric(32,2) NOT NULL,
	current_debt numeric(32,2),
	interest_rate numeric(5,4) NOT NULL,
	start_date timestamptz NOT NULL,
	end_date timestamptz NOT NULL,
	payment_frequency varchar(50) NOT NULL,
	next_payment_date timestamptz,
	minimum_next_payment_amount numeric(32,2),
	status varchar(50) NOT NULL DEFAULT 'Active',
	game_id_games uuid,
	player_id_players uuid,
	player_id_players1 uuid,
	player_id_players2 uuid,
	company_id_companies uuid,
	company_id_companies1 uuid,
	company_id_companies2 uuid,
	npc_id_npcs uuid,
	npc_id_npcs1 uuid,
	bank_id_banks uuid,
	bank_id_banks1 uuid,
	CONSTRAINT debts_pk PRIMARY KEY (debt_id)
);
-- ddl-end --
ALTER TABLE sv_game.debts OWNER TO postgres;
-- ddl-end --

-- object: sv_game.debt_collateral | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.debt_collateral CASCADE;
CREATE TABLE sv_game.debt_collateral (
	debt_collateral_id uuid NOT NULL,
	collateral_type varchar(50) NOT NULL,
	collateral_entity_id uuid NOT NULL,
	collateral_value_at_loan_time numeric(32,2) NOT NULL,
	is_currently_held boolean NOT NULL,
	debt_id_debts uuid,
	CONSTRAINT debt_collateral_pk PRIMARY KEY (debt_collateral_id)
);
-- ddl-end --
ALTER TABLE sv_game.debt_collateral OWNER TO postgres;
-- ddl-end --

-- object: games_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.debts DROP CONSTRAINT IF EXISTS games_fk CASCADE;
ALTER TABLE sv_game.debts ADD CONSTRAINT games_fk FOREIGN KEY (game_id_games)
REFERENCES sv_game.games (game_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: players_fk_lender_player | type: CONSTRAINT --
-- ALTER TABLE sv_game.debts DROP CONSTRAINT IF EXISTS players_fk_lender_player CASCADE;
ALTER TABLE sv_game.debts ADD CONSTRAINT players_fk_lender_player FOREIGN KEY (player_id_players)
REFERENCES sv_game.players (player_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: players_fk_borrower_player | type: CONSTRAINT --
-- ALTER TABLE sv_game.debts DROP CONSTRAINT IF EXISTS players_fk_borrower_player CASCADE;
ALTER TABLE sv_game.debts ADD CONSTRAINT players_fk_borrower_player FOREIGN KEY (player_id_players1)
REFERENCES sv_game.players (player_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: players_fk_player_current_owner | type: CONSTRAINT --
-- ALTER TABLE sv_game.debts DROP CONSTRAINT IF EXISTS players_fk_player_current_owner CASCADE;
ALTER TABLE sv_game.debts ADD CONSTRAINT players_fk_player_current_owner FOREIGN KEY (player_id_players2)
REFERENCES sv_game.players (player_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: debts_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.debt_collateral DROP CONSTRAINT IF EXISTS debts_fk CASCADE;
ALTER TABLE sv_game.debt_collateral ADD CONSTRAINT debts_fk FOREIGN KEY (debt_id_debts)
REFERENCES sv_game.debts (debt_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: companies_fk_lender_company | type: CONSTRAINT --
-- ALTER TABLE sv_game.debts DROP CONSTRAINT IF EXISTS companies_fk_lender_company CASCADE;
ALTER TABLE sv_game.debts ADD CONSTRAINT companies_fk_lender_company FOREIGN KEY (company_id_companies)
REFERENCES sv_game.companies (company_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: companies_fk_borrower_company | type: CONSTRAINT --
-- ALTER TABLE sv_game.debts DROP CONSTRAINT IF EXISTS companies_fk_borrower_company CASCADE;
ALTER TABLE sv_game.debts ADD CONSTRAINT companies_fk_borrower_company FOREIGN KEY (company_id_companies1)
REFERENCES sv_game.companies (company_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: companies_fk_company_current_owner | type: CONSTRAINT --
-- ALTER TABLE sv_game.debts DROP CONSTRAINT IF EXISTS companies_fk_company_current_owner CASCADE;
ALTER TABLE sv_game.debts ADD CONSTRAINT companies_fk_company_current_owner FOREIGN KEY (company_id_companies2)
REFERENCES sv_game.companies (company_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: npcs_fk_lender_npc | type: CONSTRAINT --
-- ALTER TABLE sv_game.debts DROP CONSTRAINT IF EXISTS npcs_fk_lender_npc CASCADE;
ALTER TABLE sv_game.debts ADD CONSTRAINT npcs_fk_lender_npc FOREIGN KEY (npc_id_npcs)
REFERENCES sv_game.npcs (npc_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: npcs_fk_npc_current_owner | type: CONSTRAINT --
-- ALTER TABLE sv_game.debts DROP CONSTRAINT IF EXISTS npcs_fk_npc_current_owner CASCADE;
ALTER TABLE sv_game.debts ADD CONSTRAINT npcs_fk_npc_current_owner FOREIGN KEY (npc_id_npcs1)
REFERENCES sv_game.npcs (npc_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: banks_fk_lender_bank | type: CONSTRAINT --
-- ALTER TABLE sv_game.debts DROP CONSTRAINT IF EXISTS banks_fk_lender_bank CASCADE;
ALTER TABLE sv_game.debts ADD CONSTRAINT banks_fk_lender_bank FOREIGN KEY (bank_id_banks)
REFERENCES sv_game.banks (bank_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: banks_fk_bank_current_owner | type: CONSTRAINT --
-- ALTER TABLE sv_game.debts DROP CONSTRAINT IF EXISTS banks_fk_bank_current_owner CASCADE;
ALTER TABLE sv_game.debts ADD CONSTRAINT banks_fk_bank_current_owner FOREIGN KEY (bank_id_banks1)
REFERENCES sv_game.banks (bank_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: debts_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.bets DROP CONSTRAINT IF EXISTS debts_fk CASCADE;
ALTER TABLE sv_game.bets ADD CONSTRAINT debts_fk FOREIGN KEY (debt_id_debts)
REFERENCES sv_game.debts (debt_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: sv_game.roosters | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.roosters CASCADE;
CREATE TABLE sv_game.roosters (
	rooster_id uuid NOT NULL,
	name varchar(255) NOT NULL,
	age_days integer NOT NULL,
	strength integer NOT NULL,
	speed integer NOT NULL,
	aggression integer NOT NULL,
	health integer NOT NULL DEFAULT 100,
	status varchar(50) NOT NULL DEFAULT 'Available',
	win_count integer NOT NULL DEFAULT 0,
	loss_count integer NOT NULL DEFAULT 0,
	draw_count integer NOT NULL DEFAULT 0,
	kill_count integer NOT NULL DEFAULT 0,
	is_deceased boolean NOT NULL DEFAULT FALSE,
	game_id_games uuid,
	player_id_players uuid,
	npc_id_npcs uuid,
	plot_id_plots uuid,
	CONSTRAINT roosters_pk PRIMARY KEY (rooster_id)
);
-- ddl-end --
ALTER TABLE sv_game.roosters OWNER TO postgres;
-- ddl-end --

-- object: sv_game.cockfights | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.cockfights CASCADE;
CREATE TABLE sv_game.cockfights (
	cockfight_id uuid NOT NULL,
	date_time timestamptz NOT NULL,
	outcome varchar(50),
	loser_died boolean,
	status varchar(50) NOT NULL DEFAULT 'Scheduled',
	game_id_games uuid,
	building_id_buildings uuid,
	rooster_id_roosters uuid,
	rooster_id_roosters1 uuid,
	CONSTRAINT cockfights_pk PRIMARY KEY (cockfight_id)
);
-- ddl-end --
ALTER TABLE sv_game.cockfights OWNER TO postgres;
-- ddl-end --

-- object: games_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.roosters DROP CONSTRAINT IF EXISTS games_fk CASCADE;
ALTER TABLE sv_game.roosters ADD CONSTRAINT games_fk FOREIGN KEY (game_id_games)
REFERENCES sv_game.games (game_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: players_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.roosters DROP CONSTRAINT IF EXISTS players_fk CASCADE;
ALTER TABLE sv_game.roosters ADD CONSTRAINT players_fk FOREIGN KEY (player_id_players)
REFERENCES sv_game.players (player_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: npcs_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.roosters DROP CONSTRAINT IF EXISTS npcs_fk CASCADE;
ALTER TABLE sv_game.roosters ADD CONSTRAINT npcs_fk FOREIGN KEY (npc_id_npcs)
REFERENCES sv_game.npcs (npc_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: plots_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.roosters DROP CONSTRAINT IF EXISTS plots_fk CASCADE;
ALTER TABLE sv_game.roosters ADD CONSTRAINT plots_fk FOREIGN KEY (plot_id_plots)
REFERENCES sv_game.plots (plot_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: cockfights_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.bets DROP CONSTRAINT IF EXISTS cockfights_fk CASCADE;
ALTER TABLE sv_game.bets ADD CONSTRAINT cockfights_fk FOREIGN KEY (cockfight_id_cockfights)
REFERENCES sv_game.cockfights (cockfight_id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: games_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.cockfights DROP CONSTRAINT IF EXISTS games_fk CASCADE;
ALTER TABLE sv_game.cockfights ADD CONSTRAINT games_fk FOREIGN KEY (game_id_games)
REFERENCES sv_game.games (game_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: buildings_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.cockfights DROP CONSTRAINT IF EXISTS buildings_fk CASCADE;
ALTER TABLE sv_game.cockfights ADD CONSTRAINT buildings_fk FOREIGN KEY (building_id_buildings)
REFERENCES sv_game.buildings (building_id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: roosters_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.cockfights DROP CONSTRAINT IF EXISTS roosters_fk CASCADE;
ALTER TABLE sv_game.cockfights ADD CONSTRAINT roosters_fk FOREIGN KEY (rooster_id_roosters)
REFERENCES sv_game.roosters (rooster_id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: roosters_fk1 | type: CONSTRAINT --
-- ALTER TABLE sv_game.cockfights DROP CONSTRAINT IF EXISTS roosters_fk1 CASCADE;
ALTER TABLE sv_game.cockfights ADD CONSTRAINT roosters_fk1 FOREIGN KEY (rooster_id_roosters1)
REFERENCES sv_game.roosters (rooster_id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: sv_game.vehicletypes | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.vehicletypes CASCADE;
CREATE TABLE sv_game.vehicletypes (
	vehicletype_id uuid NOT NULL,
	name varchar(255) NOT NULL,
	maker varchar(255) NOT NULL,
	type varchar(50) NOT NULL,
	base_price numeric(32,2) NOT NULL,
	passenger_capacity integer NOT NULL DEFAULT 1,
	cargo_capacity integer NOT NULL DEFAULT 0,
	speed_modifier numeric(5,2) NOT NULL DEFAULT 1.0,
	work_efficiency_modifier numeric(5,2) NOT NULL DEFAULT 0.0,
	garage_size_needed varchar(50) NOT NULL DEFAULT 'Small',
	game_id_games uuid,
	CONSTRAINT vehicletypes_pk PRIMARY KEY (vehicletype_id)
);
-- ddl-end --
ALTER TABLE sv_game.vehicletypes OWNER TO postgres;
-- ddl-end --

-- object: sv_game.vehicles | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.vehicles CASCADE;
CREATE TABLE sv_game.vehicles (
	vehicle_id uuid NOT NULL,
	purchase_price numeric(32,2) NOT NULL,
	current_value numeric(32,2) NOT NULL,
	condition_percentage integer NOT NULL DEFAULT 100,
	mileage integer NOT NULL DEFAULT 0,
	status varchar(50) NOT NULL DEFAULT 'Parked',
	garage_id_garages uuid,
	game_id_games uuid,
	vehicletype_id_vehicletypes uuid,
	player_id_players uuid,
	company_id_companies uuid,
	plot_id_plots uuid,
	CONSTRAINT vehicles_pk PRIMARY KEY (vehicle_id)
);
-- ddl-end --
ALTER TABLE sv_game.vehicles OWNER TO postgres;
-- ddl-end --

-- object: sv_game.garages | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.garages CASCADE;
CREATE TABLE sv_game.garages (
	garage_id uuid NOT NULL,
	total_slots integer NOT NULL,
	available_slots integer NOT NULL,
	slot_size_type varchar(50) NOT NULL,
	game_id_games uuid,
	building_id_buildings uuid,
	CONSTRAINT garages_pk PRIMARY KEY (garage_id)
);
-- ddl-end --
ALTER TABLE sv_game.garages OWNER TO postgres;
-- ddl-end --

-- object: sv_game.garage_parking | type: TABLE --
-- DROP TABLE IF EXISTS sv_game.garage_parking CASCADE;
CREATE TABLE sv_game.garage_parking (
	garage_parking_id uuid NOT NULL,
	parking_spot_number varchar(50),
	garage_id_garages uuid,
	vehicle_id_vehicles uuid,
	CONSTRAINT garage_parking_pk PRIMARY KEY (garage_parking_id)
);
-- ddl-end --
ALTER TABLE sv_game.garage_parking OWNER TO postgres;
-- ddl-end --

-- object: garages_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.garage_parking DROP CONSTRAINT IF EXISTS garages_fk CASCADE;
ALTER TABLE sv_game.garage_parking ADD CONSTRAINT garages_fk FOREIGN KEY (garage_id_garages)
REFERENCES sv_game.garages (garage_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: garages_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.vehicles DROP CONSTRAINT IF EXISTS garages_fk CASCADE;
ALTER TABLE sv_game.vehicles ADD CONSTRAINT garages_fk FOREIGN KEY (garage_id_garages)
REFERENCES sv_game.garages (garage_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: games_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.vehicletypes DROP CONSTRAINT IF EXISTS games_fk CASCADE;
ALTER TABLE sv_game.vehicletypes ADD CONSTRAINT games_fk FOREIGN KEY (game_id_games)
REFERENCES sv_game.games (game_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: games_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.vehicles DROP CONSTRAINT IF EXISTS games_fk CASCADE;
ALTER TABLE sv_game.vehicles ADD CONSTRAINT games_fk FOREIGN KEY (game_id_games)
REFERENCES sv_game.games (game_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: vehicletypes_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.vehicles DROP CONSTRAINT IF EXISTS vehicletypes_fk CASCADE;
ALTER TABLE sv_game.vehicles ADD CONSTRAINT vehicletypes_fk FOREIGN KEY (vehicletype_id_vehicletypes)
REFERENCES sv_game.vehicletypes (vehicletype_id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: players_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.vehicles DROP CONSTRAINT IF EXISTS players_fk CASCADE;
ALTER TABLE sv_game.vehicles ADD CONSTRAINT players_fk FOREIGN KEY (player_id_players)
REFERENCES sv_game.players (player_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: companies_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.vehicles DROP CONSTRAINT IF EXISTS companies_fk CASCADE;
ALTER TABLE sv_game.vehicles ADD CONSTRAINT companies_fk FOREIGN KEY (company_id_companies)
REFERENCES sv_game.companies (company_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: plots_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.vehicles DROP CONSTRAINT IF EXISTS plots_fk CASCADE;
ALTER TABLE sv_game.vehicles ADD CONSTRAINT plots_fk FOREIGN KEY (plot_id_plots)
REFERENCES sv_game.plots (plot_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: games_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.garages DROP CONSTRAINT IF EXISTS games_fk CASCADE;
ALTER TABLE sv_game.garages ADD CONSTRAINT games_fk FOREIGN KEY (game_id_games)
REFERENCES sv_game.games (game_id) MATCH FULL
ON DELETE CASCADE ON UPDATE CASCADE;
-- ddl-end --

-- object: buildings_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.garages DROP CONSTRAINT IF EXISTS buildings_fk CASCADE;
ALTER TABLE sv_game.garages ADD CONSTRAINT buildings_fk FOREIGN KEY (building_id_buildings)
REFERENCES sv_game.buildings (building_id) MATCH FULL
ON DELETE RESTRICT ON UPDATE CASCADE;
-- ddl-end --

-- object: garages_uq | type: CONSTRAINT --
-- ALTER TABLE sv_game.garages DROP CONSTRAINT IF EXISTS garages_uq CASCADE;
ALTER TABLE sv_game.garages ADD CONSTRAINT garages_uq UNIQUE (building_id_buildings);
-- ddl-end --

-- object: vehicles_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.garage_parking DROP CONSTRAINT IF EXISTS vehicles_fk CASCADE;
ALTER TABLE sv_game.garage_parking ADD CONSTRAINT vehicles_fk FOREIGN KEY (vehicle_id_vehicles)
REFERENCES sv_game.vehicles (vehicle_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: garage_parking_uq | type: CONSTRAINT --
-- ALTER TABLE sv_game.garage_parking DROP CONSTRAINT IF EXISTS garage_parking_uq CASCADE;
ALTER TABLE sv_game.garage_parking ADD CONSTRAINT garage_parking_uq UNIQUE (vehicle_id_vehicles);
-- ddl-end --

-- object: players_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.player_attributes DROP CONSTRAINT IF EXISTS players_fk CASCADE;
ALTER TABLE sv_game.player_attributes ADD CONSTRAINT players_fk FOREIGN KEY (player_id_players)
REFERENCES sv_game.players (player_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: player_attributes_uq | type: CONSTRAINT --
-- ALTER TABLE sv_game.player_attributes DROP CONSTRAINT IF EXISTS player_attributes_uq CASCADE;
ALTER TABLE sv_game.player_attributes ADD CONSTRAINT player_attributes_uq UNIQUE (player_id_players);
-- ddl-end --

-- object: companies_fk | type: CONSTRAINT --
-- ALTER TABLE sv_game.stocks DROP CONSTRAINT IF EXISTS companies_fk CASCADE;
ALTER TABLE sv_game.stocks ADD CONSTRAINT companies_fk FOREIGN KEY (company_id_companies)
REFERENCES sv_game.companies (company_id) MATCH FULL
ON DELETE SET NULL ON UPDATE CASCADE;
-- ddl-end --

-- object: stocks_uq | type: CONSTRAINT --
-- ALTER TABLE sv_game.stocks DROP CONSTRAINT IF EXISTS stocks_uq CASCADE;
ALTER TABLE sv_game.stocks ADD CONSTRAINT stocks_uq UNIQUE (company_id_companies);
-- ddl-end --


