
    create table sv_game.bank_account_transactions (
        amount numeric(32,2) not null,
        transaction_date timestamp(6) with time zone not null,
        account_id_player_bank_accounts uuid,
        bank_transaction_id uuid not null,
        transaction_type varchar(100) not null,
        description text not null,
        primary key (bank_transaction_id)
    );

    create table sv_game.banks (
        deposit_interest_rate numeric(5,4) default 0.00 not null,
        is_player_bank boolean default false not null,
        loan_interest_rate numeric(5,4) default 0.00 not null,
        monthly_account_fee numeric(10,2) default 0.00 not null,
        reputation integer default 500 not null,
        stability_index numeric(5,2) default 100.00 not null,
        transaction_fee_rate numeric(5,4) default 0.00 not null,
        bank_id uuid not null,
        country_id_countries uuid,
        player_id_players uuid,
        name varchar(255) not null,
        primary key (bank_id)
    );

    create table sv_game.bets (
        amount_bet numeric(16,2) not null,
        outcome_amount numeric(16,2) not null,
        bet_date timestamp(6) with time zone not null,
        bet_id uuid not null,
        cockfight_id_cockfights uuid,
        debt_id_debts uuid,
        player_id_players uuid,
        type varchar(100) not null,
        details jsonb not null,
        primary key (bet_id)
    );

    create table sv_game.buildings (
        capacity integer not null,
        condition_percentage integer default 100 not null,
        construction_cost numeric(32,2) not null,
        current_value numeric(32,2) not null,
        is_company_headquarters boolean default false not null,
        is_player_home boolean default false not null,
        maintenance_cost_per_month numeric(16,2) not null,
        rent_per_month numeric(5,2) not null,
        upgrade_level integer default 0 not null,
        building_id uuid not null,
        company_id_companies uuid,
        npc_id_npcs uuid,
        player_id_players uuid,
        building_type varchar(100) not null,
        customization_data jsonb not null,
        primary key (building_id)
    );

    create table sv_game.business_categories (
        category_id uuid not null,
        name varchar(255) not null,
        description text,
        primary key (category_id)
    );

    create table sv_game.career_paths (
        path_id uuid not null,
        related_attribute varchar(50) not null,
        name varchar(255) not null,
        description text not null,
        primary key (path_id)
    );

    create table sv_game.cities (
        cost_of_living_index numeric(5,2) not null,
        local_crime_rate numeric(5,2) not null,
        size_modifier numeric(5,2) not null,
        unemployment_rate numeric(5,2) not null,
        population bigint not null,
        city_id uuid not null,
        state_id_states uuid,
        city_type varchar(100) not null,
        name varchar(255) not null,
        procedural_seed varchar(255),
        generated_map_layout jsonb not null,
        map_config_data jsonb not null,
        primary key (city_id)
    );

    create table sv_game.cockfights (
        loser_died boolean,
        date_time timestamp(6) with time zone not null,
        building_id_buildings uuid,
        cockfight_id uuid not null,
        game_id_games uuid,
        rooster_id_roosters uuid,
        rooster_id_roosters1 uuid,
        outcome varchar(50),
        status varchar(50) default 'Scheduled' not null,
        primary key (cockfight_id)
    );

    create table sv_game.companies (
        cash_balance numeric(32,2) default 0.00 not null,
        founding_date date not null,
        growth_rate numeric(5,2) not null,
        is_publicly_traded boolean default false not null,
        market_share numeric(5,2) default 0.00 not null,
        marketing_level integer default 0 not null,
        net_worth numeric(32,2) not null,
        production_capacity integer not null,
        r_and_d_level integer default 0 not null,
        reputation integer default 500 not null,
        category_id_business_categories uuid,
        company_id uuid not null,
        npc_id_npcs uuid,
        player_id_players uuid,
        name varchar(255) not null,
        primary key (company_id)
    );

    create table sv_game.company_buildings (
        is_active boolean default true not null,
        building_id_buildings uuid,
        company_building_id uuid not null,
        company_id_companies uuid,
        role varchar(100) not null,
        primary key (company_building_id)
    );

    create table sv_game.company_financial_history (
        employees_count integer not null,
        expenses numeric(32,2) not null,
        net_worth_snapshot numeric(32,2) not null,
        profit numeric(32,2) not null,
        record_date date not null,
        revenue numeric(32,2) not null,
        company_id_companies uuid,
        record_id uuid not null,
        primary key (record_id)
    );

    create table sv_game.company_hqs (
        building_id_buildings uuid unique,
        company_hq_id uuid not null,
        company_id_companies uuid unique,
        primary key (company_hq_id)
    );

    create table sv_game.countries (
        base_tax_rate numeric(5,2) not null,
        business_tax_rate numeric(5,2) not null,
        corruption_level numeric(5,2) not null,
        crime_rate_modifier numeric(5,2) not null,
        growth_potential numeric(5,2) not null,
        import_export_duty numeric(5,2) not null,
        stability_index numeric(5,2) not null,
        country_id uuid not null,
        currency_id_currencies uuid,
        economic_system varchar(100) not null,
        law_system varchar(100) not null,
        name varchar(255) not null,
        primary key (country_id)
    );

    create table sv_game.courses (
        cost numeric(16,2) not null,
        duration_days integer not null,
        course_id uuid not null,
        institution_id_education_institutions uuid,
        skill_id_skills uuid,
        related_attribute varchar(50) not null,
        name varchar(255) not null,
        description text not null,
        primary key (course_id)
    );

    create table sv_game.crypto_price_history (
        price numeric(16,2) not null,
        record_time timestamp(6) with time zone not null,
        crypto_id_cryptocurrencies uuid,
        history_id uuid not null,
        primary key (history_id)
    );

    create table sv_game.cryptocurrencies (
        current_price numeric(16,2) not null,
        mining_difficulty numeric(16,2) not null,
        volatility numeric(5,2) not null,
        circulating_supply bigint not null,
        supply_limit bigint,
        symbol varchar(10) not null,
        crypto_id uuid not null,
        name varchar(255) not null,
        primary key (crypto_id)
    );

    create table sv_game.currencies (
        exchange_rate_to_base_currency numeric(16,2) not null,
        iso_code varchar(3) not null,
        volatility numeric(5,2) not null,
        symbol varchar(10) not null,
        currency_id uuid not null,
        name varchar(255) not null,
        primary key (currency_id)
    );

    create table sv_game.debt_collateral (
        collateral_value_at_loan_time numeric(32,2) not null,
        is_currently_held boolean not null,
        collateral_entity_id uuid not null,
        debt_collateral_id uuid not null,
        debt_id_debts uuid,
        collateral_type varchar(50) not null,
        primary key (debt_collateral_id)
    );

    create table sv_game.debts (
        current_debt numeric(32,2),
        interest_rate numeric(5,4) not null,
        minimum_next_payment_amount numeric(32,2),
        original_value numeric(32,2) not null,
        end_date timestamp(6) with time zone not null,
        next_payment_date timestamp(6) with time zone,
        start_date timestamp(6) with time zone not null,
        bank_id_banks uuid,
        bank_id_banks1 uuid,
        company_id_companies uuid,
        company_id_companies1 uuid,
        company_id_companies2 uuid,
        debt_id uuid not null,
        game_id_games uuid,
        npc_id_npcs uuid,
        npc_id_npcs1 uuid,
        player_id_players uuid,
        player_id_players1 uuid,
        player_id_players2 uuid,
        debt_type varchar(50) default 'Loan' not null,
        payment_frequency varchar(50) not null,
        status varchar(50) default 'Active' not null,
        primary key (debt_id)
    );

    create table sv_game.education_institutions (
        institution_id uuid not null,
        type varchar(100) not null,
        name varchar(255) not null,
        primary key (institution_id)
    );

    create table sv_game.exchange_rate_history (
        exchange_rate numeric(16,4) not null,
        record_time timestamp(6) with time zone not null,
        currency_id_currencies uuid,
        history_id uuid not null,
        primary key (history_id)
    );

    create table sv_game.games (
        game_speed_multiplier numeric(3,1) default 1.0 not null,
        current_date_time timestamp(6) with time zone,
        last_save_time timestamp(6) with time zone,
        game_id uuid not null,
        game_name varchar(255) not null,
        primary key (game_id)
    );

    create table sv_game.garage_parking (
        garage_id_garages uuid,
        garage_parking_id uuid not null,
        vehicle_id_vehicles uuid unique,
        parking_spot_number varchar(50),
        primary key (garage_parking_id)
    );

    create table sv_game.garages (
        available_slots integer not null,
        total_slots integer not null,
        building_id_buildings uuid unique,
        game_id_games uuid,
        garage_id uuid not null,
        slot_size_type varchar(50) not null,
        primary key (garage_id)
    );

    create table sv_game.investment_opportunities (
        duration_days integer not null,
        end_date date not null,
        expected_return_max numeric(5,2) not null,
        expected_return_min numeric(5,2) not null,
        is_active boolean default true not null,
        max_investment numeric(32,2) not null,
        min_investment numeric(32,2) not null,
        risk_level numeric(5,2) not null,
        start_date date not null,
        opportunity_id uuid not null,
        name varchar(255) not null,
        description text not null,
        primary key (opportunity_id)
    );

    create table sv_game.items (
        value numeric(16,2) not null,
        item_id uuid not null,
        type varchar(100) not null,
        name varchar(255) not null,
        description text not null,
        effect_data jsonb not null,
        primary key (item_id)
    );

    create table sv_game.job_categories (
        category_id uuid not null,
        name varchar(255) not null,
        primary key (category_id)
    );

    create table sv_game.jobs (
        base_salary_per_day numeric(16,2) not null,
        is_available boolean default true not null,
        required_charisma integer not null,
        required_education_score integer not null,
        required_intelligence integer not null,
        required_strength integer not null,
        xp_per_day integer not null,
        category_id_job_categories uuid,
        company_id_companies uuid,
        job_id uuid not null,
        required_education_level varchar(100) not null,
        title varchar(255) not null,
        primary key (job_id)
    );

    create table sv_game.news_events (
        is_global boolean default false not null,
        event_date timestamp(6) with time zone not null,
        city_id_cities uuid,
        country_id_countries uuid,
        event_id uuid not null,
        game_id_games uuid,
        event_type varchar(100) not null,
        title varchar(255) not null,
        description text not null,
        impact_data jsonb not null,
        primary key (event_id)
    );

    create table sv_game.nfts (
        current_value numeric(32,2) not null,
        initial_value numeric(32,2) not null,
        creation_date timestamp(6) with time zone not null,
        game_id_games uuid,
        nft_id uuid not null,
        npc_id_npcs uuid,
        player_id_players uuid,
        contract_address varchar(255),
        image_path varchar(255),
        name varchar(255) not null,
        token_id varchar(255),
        description text,
        generation_params jsonb,
        primary key (nft_id)
    );

    create table sv_game.npc_stock_holdings (
        average_purchase_price numeric(16,2) not null,
        last_updated_time timestamp(6) with time zone not null,
        shares_owned bigint not null,
        holding_id uuid not null,
        npc_id_npcs uuid,
        stock_id_stocks uuid,
        primary key (holding_id)
    );

    create table sv_game.npcs (
        charisma integer not null,
        intelligence integer not null,
        is_essential boolean default false not null,
        karma integer default 500 not null,
        luck integer not null,
        strength integer not null,
        city_id_cities uuid,
        game_id_games uuid,
        npc_id uuid not null,
        plot_id_plots uuid,
        financial_status varchar(50) not null,
        gender varchar(50) not null,
        status varchar(50) default 'Available' not null,
        occupation varchar(100),
        job_title varchar(255),
        name varchar(255) not null,
        appearance_data jsonb,
        notes text,
        personality_traits jsonb,
        primary key (npc_id)
    );

    create table sv_game.player_attributes (
        charisma integer default 1 not null,
        intelligence integer default 1 not null,
        luck integer default 1 not null,
        strength integer default 1 not null,
        last_updated_time timestamp(6) with time zone not null,
        attribute_id uuid not null,
        player_id_players uuid unique,
        primary key (attribute_id)
    );

    create table sv_game.player_bank_accounts (
        balance numeric(32,2) default 0.00 not null,
        is_primary boolean default false not null,
        created_date timestamp(6) with time zone not null,
        last_activity_date timestamp(6) with time zone not null,
        account_id uuid not null,
        bank_id_banks uuid,
        currency_id_currencies uuid,
        player_id_players uuid,
        account_number varchar(50) not null,
        account_type varchar(50) not null,
        primary key (account_id)
    );

    create table sv_game.player_career_progress (
        level integer default 1 not null,
        xp_in_path integer default 0 not null,
        last_level_up_date timestamp(6) with time zone not null,
        path_id_career_paths uuid,
        player_id_players uuid,
        progress_id uuid not null,
        primary key (progress_id)
    );

    create table sv_game.player_crypto_holdings (
        amount numeric(24,8) not null,
        average_purchase_price numeric(16,2) not null,
        last_updated_time timestamp(6) with time zone not null,
        crypto_id_cryptocurrencies uuid,
        holding_id uuid not null,
        player_id_players uuid,
        primary key (holding_id)
    );

    create table sv_game.player_currency_holdings (
        amount numeric(32,2) default 0.00 not null,
        last_updated_time timestamp(6) with time zone not null,
        currency_id_currencies uuid,
        holding_id uuid not null,
        player_id_players uuid,
        primary key (holding_id)
    );

    create table sv_game.player_inventory (
        equipped boolean default false not null,
        quantity integer default 1 not null,
        inventory_id uuid not null,
        item_id_items uuid,
        player_id_players uuid,
        primary key (inventory_id)
    );

    create table sv_game.player_investments (
        actual_return_amount numeric(32,2) not null,
        amount_invested numeric(32,2) not null,
        expected_return_amount numeric(32,2) not null,
        completion_date timestamp(6) with time zone not null,
        investment_date timestamp(6) with time zone not null,
        opportunity_id_investment_opportunities uuid,
        player_id_players uuid,
        player_investment_id uuid not null,
        status varchar(50) not null,
        primary key (player_investment_id)
    );

    create table sv_game.player_nft_holdings (
        acquisition_price numeric(32,2) not null,
        is_listed_for_sale boolean default false not null,
        listing_price numeric(32,2),
        acquisition_date timestamp(6) with time zone not null,
        holding_id uuid not null,
        nft_id_nfts uuid unique,
        player_id_players uuid,
        primary key (holding_id)
    );

    create table sv_game.player_npc_relationships (
        level integer default 0 not null,
        last_interaction_date timestamp(6) with time zone,
        npc_id_npcs uuid,
        player_id_players uuid,
        relationship_id uuid not null,
        relationship_type varchar(50) default 'Neutral' not null,
        primary key (relationship_id)
    );

    create table sv_game.player_skills (
        level integer default 0 not null,
        xp integer default 0 not null,
        last_updated_time timestamp(6) with time zone not null,
        player_id_players uuid,
        player_skill_id uuid not null,
        skill_id_skills uuid,
        primary key (player_skill_id)
    );

    create table sv_game.player_status_effects (
        end_time timestamp(6) with time zone,
        start_time timestamp(6) with time zone not null,
        effect_id uuid not null,
        player_id_players uuid,
        type varchar(100) not null,
        modifier_data jsonb not null,
        primary key (effect_id)
    );

    create table sv_game.player_stock_holdings (
        average_purchase_price numeric(16,2) not null,
        last_updated_time timestamp(6) with time zone not null,
        shares_owned bigint not null,
        holding_id uuid not null,
        player_id_players uuid,
        stock_id_stocks uuid,
        primary key (holding_id)
    );

    create table sv_game.players (
        age integer not null,
        cash_balance numeric(64,2) default 0.00 not null,
        date_of_birth date not null,
        education_score integer default 0 not null,
        energy integer default 100 not null,
        experience_points integer default 0 not null,
        happiness integer default 100 not null,
        health integer default 100 not null,
        karma integer default 500 not null,
        city_id_cities uuid,
        game_id_games uuid,
        job_id_jobs uuid,
        player_id uuid not null,
        plot_id_plots uuid,
        gender varchar(50) not null,
        education_level varchar(100) default 'None' not null,
        name varchar(255) not null,
        appearance_data jsonb not null,
        primary key (player_id)
    );

    create table sv_game.plots (
        current_value numeric(32,2) not null,
        is_available_for_sale boolean default true not null,
        is_empty boolean default true not null,
        purchase_price numeric(32,2) not null,
        last_update_time timestamp(6) with time zone not null,
        building_id_buildings uuid unique,
        city_id_cities uuid,
        company_id_companies uuid,
        npc_id_npcs uuid,
        player_id_players uuid,
        plot_id uuid not null,
        zoning_type varchar(50) default 'Not Zoned' not null,
        primary key (plot_id)
    );

    create table sv_game.products (
        base_production_cost numeric(16,2) not null,
        current_market_price numeric(16,2) not null,
        demand numeric(5,2) not null,
        production_rate_per_day numeric(16,2) not null,
        quality integer default 50 not null,
        supply numeric(5,2) not null,
        category_id_business_categories uuid,
        company_id_companies uuid,
        product_id uuid not null,
        name varchar(255) not null,
        primary key (product_id)
    );

    create table sv_game.roosters (
        age_days integer not null,
        aggression integer not null,
        draw_count integer default 0 not null,
        health integer default 100 not null,
        is_deceased boolean default false not null,
        kill_count integer default 0 not null,
        loss_count integer default 0 not null,
        speed integer not null,
        strength integer not null,
        win_count integer default 0 not null,
        game_id_games uuid,
        npc_id_npcs uuid,
        player_id_players uuid,
        plot_id_plots uuid,
        rooster_id uuid not null,
        status varchar(50) default 'Available' not null,
        name varchar(255) not null,
        primary key (rooster_id)
    );

    create table sv_game.skills (
        skill_id uuid not null,
        related_attribute varchar(50) not null,
        name varchar(255) not null,
        description text not null,
        primary key (skill_id)
    );

    create table sv_game.states (
        additional_regional_tax_rate numeric(5,2) default 0.00 not null,
        country_id_countries uuid,
        state_id uuid not null,
        name varchar(255) not null,
        environmental_regulations_data jsonb not null,
        zoning_regulations_data jsonb not null,
        primary key (state_id)
    );

    create table sv_game.stock_markets (
        closing_time time(6) not null,
        opening_time time(6) not null,
        market_id uuid not null,
        name varchar(255) not null,
        primary key (market_id)
    );

    create table sv_game.stock_price_history (
        price numeric(16,2) not null,
        record_time timestamp(6) with time zone not null,
        volume bigint not null,
        history_id uuid not null,
        stock_id_stocks uuid,
        primary key (history_id)
    );

    create table sv_game.stocks (
        current_price numeric(16,2) not null,
        volatility numeric(5,2) not null,
        last_trade_time timestamp(6) with time zone not null,
        shares_outstanding bigint not null,
        ticker_symbol varchar(10) not null,
        company_id_companies uuid unique,
        market_id_stock_markets uuid,
        stock_id uuid not null,
        primary key (stock_id)
    );

    create table sv_game.transactions (
        amount numeric(32,2) not null,
        transaction_date timestamp(6) with time zone not null,
        account_id_player_bank_accounts uuid,
        company_id_companies uuid,
        currency_id_currencies uuid,
        player_id_players uuid,
        related_entity_id uuid,
        transaction_id uuid not null,
        type varchar(100) not null,
        related_entity_type varchar(255),
        description text not null,
        primary key (transaction_id)
    );

    create table sv_game.vehicles (
        condition_percentage integer default 100 not null,
        current_value numeric(32,2) not null,
        mileage integer default 0 not null,
        purchase_price numeric(32,2) not null,
        company_id_companies uuid,
        game_id_games uuid,
        garage_id_garages uuid,
        player_id_players uuid,
        plot_id_plots uuid,
        vehicle_id uuid not null,
        vehicletype_id_vehicletypes uuid,
        status varchar(50) default 'Parked' not null,
        primary key (vehicle_id)
    );

    create table sv_game.vehicletypes (
        base_price numeric(32,2) not null,
        cargo_capacity integer default 0 not null,
        passenger_capacity integer default 1 not null,
        speed_modifier numeric(5,2) default 1.0 not null,
        work_efficiency_modifier numeric(5,2) default 0.0 not null,
        game_id_games uuid,
        vehicletype_id uuid not null,
        garage_size_needed varchar(50) default 'Small' not null,
        type varchar(50) not null,
        maker varchar(255) not null,
        name varchar(255) not null,
        primary key (vehicletype_id)
    );

    create table banks_current_owner_debts (
        bank_bank_id uuid not null,
        current_owner_debts_debt_id uuid not null unique,
        primary key (bank_bank_id, current_owner_debts_debt_id)
    );

    create table banks_lender_debts (
        bank_bank_id uuid not null,
        lender_debts_debt_id uuid not null unique,
        primary key (bank_bank_id, lender_debts_debt_id)
    );

    create table companies_borrower_debts (
        borrower_debts_debt_id uuid not null unique,
        company_company_id uuid not null,
        primary key (borrower_debts_debt_id, company_company_id)
    );

    create table companies_current_owner_debts (
        company_company_id uuid not null,
        current_owner_debts_debt_id uuid not null unique,
        primary key (company_company_id, current_owner_debts_debt_id)
    );

    create table companies_lender_debts (
        company_company_id uuid not null,
        lender_debts_debt_id uuid not null unique,
        primary key (company_company_id, lender_debts_debt_id)
    );

    create table npcs_current_owner_debts (
        current_owner_debts_debt_id uuid not null unique,
        npc_npc_id uuid not null,
        primary key (current_owner_debts_debt_id, npc_npc_id)
    );

    create table npcs_lender_debts (
        lender_debts_debt_id uuid not null unique,
        npc_npc_id uuid not null,
        primary key (lender_debts_debt_id, npc_npc_id)
    );

    create table players_borrower_debts (
        borrower_debts_debt_id uuid not null unique,
        player_player_id uuid not null,
        primary key (borrower_debts_debt_id, player_player_id)
    );

    create table players_current_owner_debts (
        current_owner_debts_debt_id uuid not null unique,
        player_player_id uuid not null,
        primary key (current_owner_debts_debt_id, player_player_id)
    );

    create table players_lender_debts (
        lender_debts_debt_id uuid not null unique,
        player_player_id uuid not null,
        primary key (lender_debts_debt_id, player_player_id)
    );

    alter table if exists sv_game.bank_account_transactions 
       add constraint FKjb01eotg0k9dmgrwbf5iy0jp5 
       foreign key (account_id_player_bank_accounts) 
       references sv_game.player_bank_accounts 
       on delete cascade;

    alter table if exists sv_game.banks 
       add constraint FK3c1y8dbh15dbkyke4o37mlqcv 
       foreign key (country_id_countries) 
       references sv_game.countries 
       on delete restrict;

    alter table if exists sv_game.banks 
       add constraint FKc3eo422rdf1dmx32h9gsj3n9i 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.bets 
       add constraint FKmwmk5kpqo18s5eivjy1y2a2g1 
       foreign key (cockfight_id_cockfights) 
       references sv_game.cockfights 
       on delete restrict;

    alter table if exists sv_game.bets 
       add constraint FKmgc4gldko9471s6a46yrd4q33 
       foreign key (debt_id_debts) 
       references sv_game.debts 
       on delete cascade;

    alter table if exists sv_game.bets 
       add constraint FKqalc1cmkrs4ms5x6sdtieigdi 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.buildings 
       add constraint FK6ll35noytqm9m9p4mu77tkq3j 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.buildings 
       add constraint FKrspuqr0x2ikm7x0fmvk8yop5e 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.buildings 
       add constraint FKd2elcads83w6kq1yfqegen4yf 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.cities 
       add constraint FK7cf2lydp0qt74d04iwlvmxxpt 
       foreign key (state_id_states) 
       references sv_game.states 
       on delete cascade;

    alter table if exists sv_game.cockfights 
       add constraint FKqlq17pa8t1g7kqnm4r2txdrlw 
       foreign key (building_id_buildings) 
       references sv_game.buildings 
       on delete restrict;

    alter table if exists sv_game.cockfights 
       add constraint FKobfyo1i2fkht9mfnox83bxfom 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.cockfights 
       add constraint FK11gfxu9p38ija1rs705yo9a6y 
       foreign key (rooster_id_roosters) 
       references sv_game.roosters 
       on delete restrict;

    alter table if exists sv_game.cockfights 
       add constraint FK8dx625xuqx70ier5vphpfsifk 
       foreign key (rooster_id_roosters1) 
       references sv_game.roosters 
       on delete restrict;

    alter table if exists sv_game.companies 
       add constraint FKf8lqctukbufq6y5yfnb2o0sb1 
       foreign key (category_id_business_categories) 
       references sv_game.business_categories 
       on delete restrict;

    alter table if exists sv_game.companies 
       add constraint FKs63xtgd7stvh7cemu0iurkhva 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.companies 
       add constraint FKeuj8jtfhs3gy4yukrs1i7ul65 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.company_buildings 
       add constraint FK22y5dr2scnykbr9vv308dgqi2 
       foreign key (building_id_buildings) 
       references sv_game.buildings 
       on delete cascade;

    alter table if exists sv_game.company_buildings 
       add constraint FK13b0p1nd0c4g0o4wa7s2fo4x9 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete cascade;

    alter table if exists sv_game.company_financial_history 
       add constraint FKrce6cputcnj7lnw0ytw6dwfa9 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete cascade;

    alter table if exists sv_game.company_hqs 
       add constraint FKni4c39t7b7wgqhdjejb2vfj10 
       foreign key (building_id_buildings) 
       references sv_game.buildings 
       on delete set null;

    alter table if exists sv_game.company_hqs 
       add constraint FKcc0jfjqq0u3tosilyltd7upoq 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.countries 
       add constraint FK7tf3wkw44cu78c19dsdaoh0mb 
       foreign key (currency_id_currencies) 
       references sv_game.currencies 
       on delete restrict;

    alter table if exists sv_game.courses 
       add constraint FK976vogbjiefw4m97q946y5ltp 
       foreign key (institution_id_education_institutions) 
       references sv_game.education_institutions 
       on delete cascade;

    alter table if exists sv_game.courses 
       add constraint FKrd630g3rc3gmatet898ru74hg 
       foreign key (skill_id_skills) 
       references sv_game.skills 
       on delete restrict;

    alter table if exists sv_game.crypto_price_history 
       add constraint FKnw12acv2fmbw5rwgf9ehepjir 
       foreign key (crypto_id_cryptocurrencies) 
       references sv_game.cryptocurrencies 
       on delete cascade;

    alter table if exists sv_game.debt_collateral 
       add constraint FKk704y8qkd803plv4wtbdww0h5 
       foreign key (debt_id_debts) 
       references sv_game.debts 
       on delete cascade;

    alter table if exists sv_game.debts 
       add constraint FKcs88dspsf64utcuhhyemnyx11 
       foreign key (company_id_companies1) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKrthvkrkw4hxhn283xq75lxa5x 
       foreign key (player_id_players1) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKgfo6uvpv3bvysi11bl23p2hiq 
       foreign key (bank_id_banks1) 
       references sv_game.banks 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FK2uktynyetgrdsx83ubyt4qs29 
       foreign key (company_id_companies2) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKc65tcl210hwoghxdvo5g9my8m 
       foreign key (npc_id_npcs1) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FK2frdiq4ofdqmhwnu2vied6p9v 
       foreign key (player_id_players2) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKopljj9ssuoc30ry1a7mwq1kra 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.debts 
       add constraint FKqxtbljltmmksn95m4qjoev936 
       foreign key (bank_id_banks) 
       references sv_game.banks 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKd5c064dh0pa2wht549cb9sd8u 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FK12gou4btbw1bs6wfp7jiutdqx 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKb6rey8v4j2prnbl1nsiwloli5 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.exchange_rate_history 
       add constraint FKjx5bsqpdoigsamd3d7rtorofd 
       foreign key (currency_id_currencies) 
       references sv_game.currencies 
       on delete cascade;

    alter table if exists sv_game.garage_parking 
       add constraint FKtp8df3jelgglta093po3o44nn 
       foreign key (garage_id_garages) 
       references sv_game.garages 
       on delete cascade;

    alter table if exists sv_game.garage_parking 
       add constraint FKd3imjk7gr7jf9mis3gdrm438j 
       foreign key (vehicle_id_vehicles) 
       references sv_game.vehicles 
       on delete set null;

    alter table if exists sv_game.garages 
       add constraint FKdpljwwasu6nxisevhdt2alkp6 
       foreign key (building_id_buildings) 
       references sv_game.buildings 
       on delete restrict;

    alter table if exists sv_game.garages 
       add constraint FKbl3ic5nuwjylw8crmy9ydmk7v 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.jobs 
       add constraint FK1b5sy0anbsi2untb9lwjmefcj 
       foreign key (category_id_job_categories) 
       references sv_game.job_categories 
       on delete restrict;

    alter table if exists sv_game.jobs 
       add constraint FKtecafloh6bl6wtowcfmjwlckl 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.news_events 
       add constraint FK7h9th81fdohmdt8rs7pf3tu2r 
       foreign key (city_id_cities) 
       references sv_game.cities 
       on delete set null;

    alter table if exists sv_game.news_events 
       add constraint FKm56xkkxru1jivb7vhdy35e7x4 
       foreign key (country_id_countries) 
       references sv_game.countries 
       on delete set null;

    alter table if exists sv_game.news_events 
       add constraint FKjj6beencj0sqs3bn7y9tmabyq 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.nfts 
       add constraint FKtpukh60cc0h0eqs8vpi8nxo9s 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.nfts 
       add constraint FK1tqeke9ns7xa0mqs29ppssigb 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete cascade;

    alter table if exists sv_game.nfts 
       add constraint FK2mpuegmp460fd9qqoglb8q7vc 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.npc_stock_holdings 
       add constraint FKd5odir83mlchi5plscr7t8s19 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete cascade;

    alter table if exists sv_game.npc_stock_holdings 
       add constraint FKspi63pcny7jqwr4os93golkop 
       foreign key (stock_id_stocks) 
       references sv_game.stocks 
       on delete cascade;

    alter table if exists sv_game.npcs 
       add constraint FKob89bub3loftatblwp6hqyui4 
       foreign key (city_id_cities) 
       references sv_game.cities 
       on delete set null;

    alter table if exists sv_game.npcs 
       add constraint FKjkoydn7ifemb0brvb9o8p61lo 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.npcs 
       add constraint FKrnmw574r861xh4rxxfi8m14b3 
       foreign key (plot_id_plots) 
       references sv_game.plots 
       on delete set null;

    alter table if exists sv_game.player_attributes 
       add constraint FK1pns89q1q82l8mr7w7vuhfof1 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.player_bank_accounts 
       add constraint FK110v4ggqr56h57tag7lyux8w9 
       foreign key (bank_id_banks) 
       references sv_game.banks 
       on delete restrict;

    alter table if exists sv_game.player_bank_accounts 
       add constraint FKrhpqwwqmsfhusgetbdwuxere2 
       foreign key (currency_id_currencies) 
       references sv_game.currencies 
       on delete restrict;

    alter table if exists sv_game.player_bank_accounts 
       add constraint FKolper7hdyxikhd5eoxkv50h7e 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_career_progress 
       add constraint FKwbnqi0uaslfy2cnc9ow11nav 
       foreign key (path_id_career_paths) 
       references sv_game.career_paths 
       on delete set null;

    alter table if exists sv_game.player_career_progress 
       add constraint FKafqn3bknvum59gahu9225p54x 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_crypto_holdings 
       add constraint FKj1t8wbs2fo2rbhg27ou7p1l6q 
       foreign key (crypto_id_cryptocurrencies) 
       references sv_game.cryptocurrencies 
       on delete cascade;

    alter table if exists sv_game.player_crypto_holdings 
       add constraint FK9qvwu9r65htxk35s0tqkrpf4 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_currency_holdings 
       add constraint FKsr1urdyeby8djplio1204s20 
       foreign key (currency_id_currencies) 
       references sv_game.currencies 
       on delete cascade;

    alter table if exists sv_game.player_currency_holdings 
       add constraint FKw8pw51tibm4mbo9899pmr3fl 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_inventory 
       add constraint FKelb21uoil2s5g0n9qijm2q301 
       foreign key (item_id_items) 
       references sv_game.items 
       on delete restrict;

    alter table if exists sv_game.player_inventory 
       add constraint FKb166j4iorux4nh11xqnce6bvn 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_investments 
       add constraint FK4ndaalb0y85xw4amc5l5cic7i 
       foreign key (opportunity_id_investment_opportunities) 
       references sv_game.investment_opportunities 
       on delete restrict;

    alter table if exists sv_game.player_investments 
       add constraint FKt1sl52kbhbu107vj3vfpx3fxh 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_nft_holdings 
       add constraint FKlsuf0wnqhthndqwnslig9cqce 
       foreign key (nft_id_nfts) 
       references sv_game.nfts 
       on delete cascade;

    alter table if exists sv_game.player_nft_holdings 
       add constraint FK4sqd1orv42g0odi0dx6a0y6e4 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_npc_relationships 
       add constraint FKj1eec75g3eg4bolul2v3wxonr 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete cascade;

    alter table if exists sv_game.player_npc_relationships 
       add constraint FKi7vaw7tbd21wb25d1vd6gglp3 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_skills 
       add constraint FKhydbgbkdkll86f7dadbnns67p 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_skills 
       add constraint FK3v1ionoiwfqkqhpn78or43x4m 
       foreign key (skill_id_skills) 
       references sv_game.skills 
       on delete restrict;

    alter table if exists sv_game.player_status_effects 
       add constraint FKhs2w2fejcmmwpvd9h16fwqid5 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_stock_holdings 
       add constraint FK19vns04swoyp8vmclk4yfjuyr 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_stock_holdings 
       add constraint FKaioj2l1vrdiqalgfeujallpaa 
       foreign key (stock_id_stocks) 
       references sv_game.stocks 
       on delete cascade;

    alter table if exists sv_game.players 
       add constraint FK470a3pox856ynx6amiaxk7r2w 
       foreign key (city_id_cities) 
       references sv_game.cities 
       on delete restrict;

    alter table if exists sv_game.players 
       add constraint FKglekn1d8fmwrx3f4he2rrswdp 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.players 
       add constraint FKeo3cccb1rw2iai7ede56vk1e6 
       foreign key (job_id_jobs) 
       references sv_game.jobs 
       on delete set null;

    alter table if exists sv_game.players 
       add constraint FK8i0fmgdxpjlhjbsx3lm3tvefr 
       foreign key (plot_id_plots) 
       references sv_game.plots 
       on delete set null;

    alter table if exists sv_game.plots 
       add constraint FKtg1jw8x0cvje2x12qfq95a4w4 
       foreign key (building_id_buildings) 
       references sv_game.buildings 
       on delete set null;

    alter table if exists sv_game.plots 
       add constraint FKgq36msv8mstmgn41r41n5j7n4 
       foreign key (city_id_cities) 
       references sv_game.cities 
       on delete cascade;

    alter table if exists sv_game.plots 
       add constraint FKiip7oclybvedms00hp7odm2e4 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.plots 
       add constraint FKgs1p2fdahvh2arnw8b5i3rbjn 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.plots 
       add constraint FK4ic6ga8g4rr8oi2mx78oie4pb 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.products 
       add constraint FKgri9ydog2re8fd4mqoglhgxq3 
       foreign key (category_id_business_categories) 
       references sv_game.business_categories 
       on delete restrict;

    alter table if exists sv_game.products 
       add constraint FKo9d40w63d95ken7unvgl29777 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete cascade;

    alter table if exists sv_game.roosters 
       add constraint FKe1oo71xedprthp152yuh1ph5a 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.roosters 
       add constraint FK2r0quvhcf37cpjo61g20d888y 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.roosters 
       add constraint FKojlu0jctyx8lm6do0g0adh98w 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.roosters 
       add constraint FK7nwv4qeee2q66302evkg87vvq 
       foreign key (plot_id_plots) 
       references sv_game.plots 
       on delete set null;

    alter table if exists sv_game.states 
       add constraint FKsr3xajspbtb3ax0kv3awl0m36 
       foreign key (country_id_countries) 
       references sv_game.countries 
       on delete cascade;

    alter table if exists sv_game.stock_price_history 
       add constraint FKcktx49vdf2r4l97680q5n0r14 
       foreign key (stock_id_stocks) 
       references sv_game.stocks 
       on delete cascade;

    alter table if exists sv_game.stocks 
       add constraint FKld8wa553b25iqu9d85v30q3yo 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.stocks 
       add constraint FKmntcivtb5ydv9w935kececlnk 
       foreign key (market_id_stock_markets) 
       references sv_game.stock_markets 
       on delete restrict;

    alter table if exists sv_game.transactions 
       add constraint FKg9s9tn0iu7p6w5dpwnhhev7v5 
       foreign key (account_id_player_bank_accounts) 
       references sv_game.player_bank_accounts 
       on delete set null;

    alter table if exists sv_game.transactions 
       add constraint FK6sidjgxmloqpsceecsegxmbla 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete cascade;

    alter table if exists sv_game.transactions 
       add constraint FKc8hqlprwvvxj2l74pn0mmolxb 
       foreign key (currency_id_currencies) 
       references sv_game.currencies 
       on delete restrict;

    alter table if exists sv_game.transactions 
       add constraint FK5kxpgv6hdu17lvouy94gqgolg 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.vehicles 
       add constraint FKk06nrxm8sp2wjn2uaf80algvb 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.vehicles 
       add constraint FKl5f2o3u0e5plo4vfw3f4at1bd 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.vehicles 
       add constraint FKrak56p5u7ey4gude78exdqns9 
       foreign key (garage_id_garages) 
       references sv_game.garages 
       on delete set null;

    alter table if exists sv_game.vehicles 
       add constraint FKpdm8v9iqaj0enw5d13tn8takq 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.vehicles 
       add constraint FKb6glpoql8vkpdujp5255ft1la 
       foreign key (plot_id_plots) 
       references sv_game.plots 
       on delete set null;

    alter table if exists sv_game.vehicles 
       add constraint FK9ki55d9lcd53tbrn3p359knec 
       foreign key (vehicletype_id_vehicletypes) 
       references sv_game.vehicletypes 
       on delete restrict;

    alter table if exists sv_game.vehicletypes 
       add constraint FKc5oah51n6hensi8afvm3s0fiu 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists banks_current_owner_debts 
       add constraint FK37lmb9vcyljhpu09sy0xyqhsu 
       foreign key (current_owner_debts_debt_id) 
       references sv_game.debts;

    alter table if exists banks_current_owner_debts 
       add constraint FKcgmup11310ufo013lsr3rlftj 
       foreign key (bank_bank_id) 
       references sv_game.banks;

    alter table if exists banks_lender_debts 
       add constraint FK4k8vvsbl8qjnawfthmqrpyku1 
       foreign key (lender_debts_debt_id) 
       references sv_game.debts;

    alter table if exists banks_lender_debts 
       add constraint FKag301ygledx68bxsbq3xi7vlm 
       foreign key (bank_bank_id) 
       references sv_game.banks;

    alter table if exists companies_borrower_debts 
       add constraint FKel91o1cywtlg07ytv1xgmrrs0 
       foreign key (borrower_debts_debt_id) 
       references sv_game.debts;

    alter table if exists companies_borrower_debts 
       add constraint FKf6mx11foobfp2ojk9fcxrkx3f 
       foreign key (company_company_id) 
       references sv_game.companies;

    alter table if exists companies_current_owner_debts 
       add constraint FKawd0h3atl3r6f7iqg16r1fjw6 
       foreign key (current_owner_debts_debt_id) 
       references sv_game.debts;

    alter table if exists companies_current_owner_debts 
       add constraint FKk5bgw06sfwdjm02ah8b8na23p 
       foreign key (company_company_id) 
       references sv_game.companies;

    alter table if exists companies_lender_debts 
       add constraint FK2pmvyknp7jt61i82f8wx6lrwa 
       foreign key (lender_debts_debt_id) 
       references sv_game.debts;

    alter table if exists companies_lender_debts 
       add constraint FKtiyiqmp9hgjeke02wuhdb4uvo 
       foreign key (company_company_id) 
       references sv_game.companies;

    alter table if exists npcs_current_owner_debts 
       add constraint FKhbmkv3686p02vys523213c5xl 
       foreign key (current_owner_debts_debt_id) 
       references sv_game.debts;

    alter table if exists npcs_current_owner_debts 
       add constraint FK67vacw4x9b7xruhyv83w4n6tb 
       foreign key (npc_npc_id) 
       references sv_game.npcs;

    alter table if exists npcs_lender_debts 
       add constraint FK5fe23xglul0y1fx5d3s7i9yin 
       foreign key (lender_debts_debt_id) 
       references sv_game.debts;

    alter table if exists npcs_lender_debts 
       add constraint FKba84g1xkqkfwnxgsg2buh3hwd 
       foreign key (npc_npc_id) 
       references sv_game.npcs;

    alter table if exists players_borrower_debts 
       add constraint FKquopy2rg1uo2l1ae1n6ffiu0v 
       foreign key (borrower_debts_debt_id) 
       references sv_game.debts;

    alter table if exists players_borrower_debts 
       add constraint FK8ke87wbo8oqf4pxqmfovug2f2 
       foreign key (player_player_id) 
       references sv_game.players;

    alter table if exists players_current_owner_debts 
       add constraint FKn1h1o93c3r8f101mf53o6ylfy 
       foreign key (current_owner_debts_debt_id) 
       references sv_game.debts;

    alter table if exists players_current_owner_debts 
       add constraint FKdvljaamut8swalyq49qy53q0x 
       foreign key (player_player_id) 
       references sv_game.players;

    alter table if exists players_lender_debts 
       add constraint FKg5xjq5knal99mk24g7wog1dxc 
       foreign key (lender_debts_debt_id) 
       references sv_game.debts;

    alter table if exists players_lender_debts 
       add constraint FK9jb0i0t91w5eodrek9gx2gm58 
       foreign key (player_player_id) 
       references sv_game.players;

    create table sv_game.bank_account_transactions (
        amount numeric(32,2) not null,
        transaction_date timestamp(6) with time zone not null,
        account_id_player_bank_accounts uuid,
        bank_transaction_id uuid not null,
        transaction_type varchar(100) not null,
        description text not null,
        primary key (bank_transaction_id)
    );

    create table sv_game.banks (
        deposit_interest_rate numeric(5,4) default 0.00 not null,
        is_player_bank boolean default false not null,
        loan_interest_rate numeric(5,4) default 0.00 not null,
        monthly_account_fee numeric(10,2) default 0.00 not null,
        reputation integer default 500 not null,
        stability_index numeric(5,2) default 100.00 not null,
        transaction_fee_rate numeric(5,4) default 0.00 not null,
        bank_id uuid not null,
        country_id_countries uuid,
        player_id_players uuid,
        name varchar(255) not null,
        primary key (bank_id)
    );

    create table sv_game.bets (
        amount_bet numeric(16,2) not null,
        outcome_amount numeric(16,2) not null,
        bet_date timestamp(6) with time zone not null,
        bet_id uuid not null,
        cockfight_id_cockfights uuid,
        debt_id_debts uuid,
        player_id_players uuid,
        type varchar(100) not null,
        details jsonb not null,
        primary key (bet_id)
    );

    create table sv_game.buildings (
        capacity integer not null,
        condition_percentage integer default 100 not null,
        construction_cost numeric(32,2) not null,
        current_value numeric(32,2) not null,
        is_company_headquarters boolean default false not null,
        is_player_home boolean default false not null,
        maintenance_cost_per_month numeric(16,2) not null,
        rent_per_month numeric(5,2) not null,
        upgrade_level integer default 0 not null,
        building_id uuid not null,
        company_id_companies uuid,
        npc_id_npcs uuid,
        player_id_players uuid,
        building_type varchar(100) not null,
        customization_data jsonb not null,
        primary key (building_id)
    );

    create table sv_game.business_categories (
        category_id uuid not null,
        name varchar(255) not null,
        description text,
        primary key (category_id)
    );

    create table sv_game.career_paths (
        path_id uuid not null,
        related_attribute varchar(50) not null,
        name varchar(255) not null,
        description text not null,
        primary key (path_id)
    );

    create table sv_game.cities (
        cost_of_living_index numeric(5,2) not null,
        local_crime_rate numeric(5,2) not null,
        size_modifier numeric(5,2) not null,
        unemployment_rate numeric(5,2) not null,
        population bigint not null,
        city_id uuid not null,
        state_id_states uuid,
        city_type varchar(100) not null,
        name varchar(255) not null,
        procedural_seed varchar(255),
        generated_map_layout jsonb not null,
        map_config_data jsonb not null,
        primary key (city_id)
    );

    create table sv_game.cockfights (
        loser_died boolean,
        date_time timestamp(6) with time zone not null,
        building_id_buildings uuid,
        cockfight_id uuid not null,
        game_id_games uuid,
        rooster_id_roosters uuid,
        rooster_id_roosters1 uuid,
        outcome varchar(50),
        status varchar(50) default 'Scheduled' not null,
        primary key (cockfight_id)
    );

    create table sv_game.companies (
        cash_balance numeric(32,2) default 0.00 not null,
        founding_date date not null,
        growth_rate numeric(5,2) not null,
        is_publicly_traded boolean default false not null,
        market_share numeric(5,2) default 0.00 not null,
        marketing_level integer default 0 not null,
        net_worth numeric(32,2) not null,
        production_capacity integer not null,
        r_and_d_level integer default 0 not null,
        reputation integer default 500 not null,
        category_id_business_categories uuid,
        company_id uuid not null,
        npc_id_npcs uuid,
        player_id_players uuid,
        name varchar(255) not null,
        primary key (company_id)
    );

    create table sv_game.company_buildings (
        is_active boolean default true not null,
        building_id_buildings uuid,
        company_building_id uuid not null,
        company_id_companies uuid,
        role varchar(100) not null,
        primary key (company_building_id)
    );

    create table sv_game.company_financial_history (
        employees_count integer not null,
        expenses numeric(32,2) not null,
        net_worth_snapshot numeric(32,2) not null,
        profit numeric(32,2) not null,
        record_date date not null,
        revenue numeric(32,2) not null,
        company_id_companies uuid,
        record_id uuid not null,
        primary key (record_id)
    );

    create table sv_game.company_hqs (
        building_id_buildings uuid unique,
        company_hq_id uuid not null,
        company_id_companies uuid unique,
        primary key (company_hq_id)
    );

    create table sv_game.countries (
        base_tax_rate numeric(5,2) not null,
        business_tax_rate numeric(5,2) not null,
        corruption_level numeric(5,2) not null,
        crime_rate_modifier numeric(5,2) not null,
        growth_potential numeric(5,2) not null,
        import_export_duty numeric(5,2) not null,
        stability_index numeric(5,2) not null,
        country_id uuid not null,
        currency_id_currencies uuid,
        economic_system varchar(100) not null,
        law_system varchar(100) not null,
        name varchar(255) not null,
        primary key (country_id)
    );

    create table sv_game.courses (
        cost numeric(16,2) not null,
        duration_days integer not null,
        course_id uuid not null,
        institution_id_education_institutions uuid,
        skill_id_skills uuid,
        related_attribute varchar(50) not null,
        name varchar(255) not null,
        description text not null,
        primary key (course_id)
    );

    create table sv_game.crypto_price_history (
        price numeric(16,2) not null,
        record_time timestamp(6) with time zone not null,
        crypto_id_cryptocurrencies uuid,
        history_id uuid not null,
        primary key (history_id)
    );

    create table sv_game.cryptocurrencies (
        current_price numeric(16,2) not null,
        mining_difficulty numeric(16,2) not null,
        volatility numeric(5,2) not null,
        circulating_supply bigint not null,
        supply_limit bigint,
        symbol varchar(10) not null,
        crypto_id uuid not null,
        name varchar(255) not null,
        primary key (crypto_id)
    );

    create table sv_game.currencies (
        exchange_rate_to_base_currency numeric(16,2) not null,
        iso_code varchar(3) not null,
        volatility numeric(5,2) not null,
        symbol varchar(10) not null,
        currency_id uuid not null,
        name varchar(255) not null,
        primary key (currency_id)
    );

    create table sv_game.debt_collateral (
        collateral_value_at_loan_time numeric(32,2) not null,
        is_currently_held boolean not null,
        collateral_entity_id uuid not null,
        debt_collateral_id uuid not null,
        debt_id_debts uuid,
        collateral_type varchar(50) not null,
        primary key (debt_collateral_id)
    );

    create table sv_game.debts (
        current_debt numeric(32,2),
        interest_rate numeric(5,4) not null,
        minimum_next_payment_amount numeric(32,2),
        original_value numeric(32,2) not null,
        end_date timestamp(6) with time zone not null,
        next_payment_date timestamp(6) with time zone,
        start_date timestamp(6) with time zone not null,
        bank_id_banks uuid,
        bank_id_banks1 uuid,
        company_id_companies uuid,
        company_id_companies1 uuid,
        company_id_companies2 uuid,
        debt_id uuid not null,
        game_id_games uuid,
        npc_id_npcs uuid,
        npc_id_npcs1 uuid,
        player_id_players uuid,
        player_id_players1 uuid,
        player_id_players2 uuid,
        debt_type varchar(50) default 'Loan' not null,
        payment_frequency varchar(50) not null,
        status varchar(50) default 'Active' not null,
        primary key (debt_id)
    );

    create table sv_game.education_institutions (
        institution_id uuid not null,
        type varchar(100) not null,
        name varchar(255) not null,
        primary key (institution_id)
    );

    create table sv_game.exchange_rate_history (
        exchange_rate numeric(16,4) not null,
        record_time timestamp(6) with time zone not null,
        currency_id_currencies uuid,
        history_id uuid not null,
        primary key (history_id)
    );

    create table sv_game.games (
        game_speed_multiplier numeric(3,1) default 1.0 not null,
        current_date_time timestamp(6) with time zone,
        last_save_time timestamp(6) with time zone,
        game_id uuid not null,
        game_name varchar(255) not null,
        primary key (game_id)
    );

    create table sv_game.garage_parking (
        garage_id_garages uuid,
        garage_parking_id uuid not null,
        vehicle_id_vehicles uuid unique,
        parking_spot_number varchar(50),
        primary key (garage_parking_id)
    );

    create table sv_game.garages (
        available_slots integer not null,
        total_slots integer not null,
        building_id_buildings uuid unique,
        game_id_games uuid,
        garage_id uuid not null,
        slot_size_type varchar(50) not null,
        primary key (garage_id)
    );

    create table sv_game.investment_opportunities (
        duration_days integer not null,
        end_date date not null,
        expected_return_max numeric(5,2) not null,
        expected_return_min numeric(5,2) not null,
        is_active boolean default true not null,
        max_investment numeric(32,2) not null,
        min_investment numeric(32,2) not null,
        risk_level numeric(5,2) not null,
        start_date date not null,
        opportunity_id uuid not null,
        name varchar(255) not null,
        description text not null,
        primary key (opportunity_id)
    );

    create table sv_game.items (
        value numeric(16,2) not null,
        item_id uuid not null,
        type varchar(100) not null,
        name varchar(255) not null,
        description text not null,
        effect_data jsonb not null,
        primary key (item_id)
    );

    create table sv_game.job_categories (
        category_id uuid not null,
        name varchar(255) not null,
        primary key (category_id)
    );

    create table sv_game.jobs (
        base_salary_per_day numeric(16,2) not null,
        is_available boolean default true not null,
        required_charisma integer not null,
        required_education_score integer not null,
        required_intelligence integer not null,
        required_strength integer not null,
        xp_per_day integer not null,
        category_id_job_categories uuid,
        company_id_companies uuid,
        job_id uuid not null,
        required_education_level varchar(100) not null,
        title varchar(255) not null,
        primary key (job_id)
    );

    create table sv_game.news_events (
        is_global boolean default false not null,
        event_date timestamp(6) with time zone not null,
        city_id_cities uuid,
        country_id_countries uuid,
        event_id uuid not null,
        game_id_games uuid,
        event_type varchar(100) not null,
        title varchar(255) not null,
        description text not null,
        impact_data jsonb not null,
        primary key (event_id)
    );

    create table sv_game.nfts (
        current_value numeric(32,2) not null,
        initial_value numeric(32,2) not null,
        creation_date timestamp(6) with time zone not null,
        game_id_games uuid,
        nft_id uuid not null,
        npc_id_npcs uuid,
        player_id_players uuid,
        contract_address varchar(255),
        image_path varchar(255),
        name varchar(255) not null,
        token_id varchar(255),
        description text,
        generation_params jsonb,
        primary key (nft_id)
    );

    create table sv_game.npc_stock_holdings (
        average_purchase_price numeric(16,2) not null,
        last_updated_time timestamp(6) with time zone not null,
        shares_owned bigint not null,
        holding_id uuid not null,
        npc_id_npcs uuid,
        stock_id_stocks uuid,
        primary key (holding_id)
    );

    create table sv_game.npcs (
        charisma integer not null,
        intelligence integer not null,
        is_essential boolean default false not null,
        karma integer default 500 not null,
        luck integer not null,
        strength integer not null,
        city_id_cities uuid,
        game_id_games uuid,
        npc_id uuid not null,
        plot_id_plots uuid,
        financial_status varchar(50) not null,
        gender varchar(50) not null,
        status varchar(50) default 'Available' not null,
        occupation varchar(100),
        job_title varchar(255),
        name varchar(255) not null,
        appearance_data jsonb,
        notes text,
        personality_traits jsonb,
        primary key (npc_id)
    );

    create table sv_game.player_attributes (
        charisma integer default 1 not null,
        intelligence integer default 1 not null,
        luck integer default 1 not null,
        strength integer default 1 not null,
        last_updated_time timestamp(6) with time zone not null,
        attribute_id uuid not null,
        player_id_players uuid unique,
        primary key (attribute_id)
    );

    create table sv_game.player_bank_accounts (
        balance numeric(32,2) default 0.00 not null,
        is_primary boolean default false not null,
        created_date timestamp(6) with time zone not null,
        last_activity_date timestamp(6) with time zone not null,
        account_id uuid not null,
        bank_id_banks uuid,
        currency_id_currencies uuid,
        player_id_players uuid,
        account_number varchar(50) not null,
        account_type varchar(50) not null,
        primary key (account_id)
    );

    create table sv_game.player_career_progress (
        level integer default 1 not null,
        xp_in_path integer default 0 not null,
        last_level_up_date timestamp(6) with time zone not null,
        path_id_career_paths uuid,
        player_id_players uuid,
        progress_id uuid not null,
        primary key (progress_id)
    );

    create table sv_game.player_crypto_holdings (
        amount numeric(24,8) not null,
        average_purchase_price numeric(16,2) not null,
        last_updated_time timestamp(6) with time zone not null,
        crypto_id_cryptocurrencies uuid,
        holding_id uuid not null,
        player_id_players uuid,
        primary key (holding_id)
    );

    create table sv_game.player_currency_holdings (
        amount numeric(32,2) default 0.00 not null,
        last_updated_time timestamp(6) with time zone not null,
        currency_id_currencies uuid,
        holding_id uuid not null,
        player_id_players uuid,
        primary key (holding_id)
    );

    create table sv_game.player_inventory (
        equipped boolean default false not null,
        quantity integer default 1 not null,
        inventory_id uuid not null,
        item_id_items uuid,
        player_id_players uuid,
        primary key (inventory_id)
    );

    create table sv_game.player_investments (
        actual_return_amount numeric(32,2) not null,
        amount_invested numeric(32,2) not null,
        expected_return_amount numeric(32,2) not null,
        completion_date timestamp(6) with time zone not null,
        investment_date timestamp(6) with time zone not null,
        opportunity_id_investment_opportunities uuid,
        player_id_players uuid,
        player_investment_id uuid not null,
        status varchar(50) not null,
        primary key (player_investment_id)
    );

    create table sv_game.player_nft_holdings (
        acquisition_price numeric(32,2) not null,
        is_listed_for_sale boolean default false not null,
        listing_price numeric(32,2),
        acquisition_date timestamp(6) with time zone not null,
        holding_id uuid not null,
        nft_id_nfts uuid unique,
        player_id_players uuid,
        primary key (holding_id)
    );

    create table sv_game.player_npc_relationships (
        level integer default 0 not null,
        last_interaction_date timestamp(6) with time zone,
        npc_id_npcs uuid,
        player_id_players uuid,
        relationship_id uuid not null,
        relationship_type varchar(50) default 'Neutral' not null,
        primary key (relationship_id)
    );

    create table sv_game.player_skills (
        level integer default 0 not null,
        xp integer default 0 not null,
        last_updated_time timestamp(6) with time zone not null,
        player_id_players uuid,
        player_skill_id uuid not null,
        skill_id_skills uuid,
        primary key (player_skill_id)
    );

    create table sv_game.player_status_effects (
        end_time timestamp(6) with time zone,
        start_time timestamp(6) with time zone not null,
        effect_id uuid not null,
        player_id_players uuid,
        type varchar(100) not null,
        modifier_data jsonb not null,
        primary key (effect_id)
    );

    create table sv_game.player_stock_holdings (
        average_purchase_price numeric(16,2) not null,
        last_updated_time timestamp(6) with time zone not null,
        shares_owned bigint not null,
        holding_id uuid not null,
        player_id_players uuid,
        stock_id_stocks uuid,
        primary key (holding_id)
    );

    create table sv_game.players (
        age integer not null,
        cash_balance numeric(64,2) default 0.00 not null,
        date_of_birth date not null,
        education_score integer default 0 not null,
        energy integer default 100 not null,
        experience_points integer default 0 not null,
        happiness integer default 100 not null,
        health integer default 100 not null,
        karma integer default 500 not null,
        city_id_cities uuid,
        game_id_games uuid,
        job_id_jobs uuid,
        player_id uuid not null,
        plot_id_plots uuid,
        gender varchar(50) not null,
        education_level varchar(100) default 'None' not null,
        name varchar(255) not null,
        appearance_data jsonb not null,
        primary key (player_id)
    );

    create table sv_game.plots (
        current_value numeric(32,2) not null,
        is_available_for_sale boolean default true not null,
        is_empty boolean default true not null,
        purchase_price numeric(32,2) not null,
        last_update_time timestamp(6) with time zone not null,
        building_id_buildings uuid unique,
        city_id_cities uuid,
        company_id_companies uuid,
        npc_id_npcs uuid,
        player_id_players uuid,
        plot_id uuid not null,
        zoning_type varchar(50) default 'Not Zoned' not null,
        primary key (plot_id)
    );

    create table sv_game.products (
        base_production_cost numeric(16,2) not null,
        current_market_price numeric(16,2) not null,
        demand numeric(5,2) not null,
        production_rate_per_day numeric(16,2) not null,
        quality integer default 50 not null,
        supply numeric(5,2) not null,
        category_id_business_categories uuid,
        company_id_companies uuid,
        product_id uuid not null,
        name varchar(255) not null,
        primary key (product_id)
    );

    create table sv_game.roosters (
        age_days integer not null,
        aggression integer not null,
        draw_count integer default 0 not null,
        health integer default 100 not null,
        is_deceased boolean default false not null,
        kill_count integer default 0 not null,
        loss_count integer default 0 not null,
        speed integer not null,
        strength integer not null,
        win_count integer default 0 not null,
        game_id_games uuid,
        npc_id_npcs uuid,
        player_id_players uuid,
        plot_id_plots uuid,
        rooster_id uuid not null,
        status varchar(50) default 'Available' not null,
        name varchar(255) not null,
        primary key (rooster_id)
    );

    create table sv_game.skills (
        skill_id uuid not null,
        related_attribute varchar(50) not null,
        name varchar(255) not null,
        description text not null,
        primary key (skill_id)
    );

    create table sv_game.states (
        additional_regional_tax_rate numeric(5,2) default 0.00 not null,
        country_id_countries uuid,
        state_id uuid not null,
        name varchar(255) not null,
        environmental_regulations_data jsonb not null,
        zoning_regulations_data jsonb not null,
        primary key (state_id)
    );

    create table sv_game.stock_markets (
        closing_time time(6) not null,
        opening_time time(6) not null,
        market_id uuid not null,
        name varchar(255) not null,
        primary key (market_id)
    );

    create table sv_game.stock_price_history (
        price numeric(16,2) not null,
        record_time timestamp(6) with time zone not null,
        volume bigint not null,
        history_id uuid not null,
        stock_id_stocks uuid,
        primary key (history_id)
    );

    create table sv_game.stocks (
        current_price numeric(16,2) not null,
        volatility numeric(5,2) not null,
        last_trade_time timestamp(6) with time zone not null,
        shares_outstanding bigint not null,
        ticker_symbol varchar(10) not null,
        company_id_companies uuid unique,
        market_id_stock_markets uuid,
        stock_id uuid not null,
        primary key (stock_id)
    );

    create table sv_game.transactions (
        amount numeric(32,2) not null,
        transaction_date timestamp(6) with time zone not null,
        account_id_player_bank_accounts uuid,
        company_id_companies uuid,
        currency_id_currencies uuid,
        player_id_players uuid,
        related_entity_id uuid,
        transaction_id uuid not null,
        type varchar(100) not null,
        related_entity_type varchar(255),
        description text not null,
        primary key (transaction_id)
    );

    create table sv_game.vehicles (
        condition_percentage integer default 100 not null,
        current_value numeric(32,2) not null,
        mileage integer default 0 not null,
        purchase_price numeric(32,2) not null,
        company_id_companies uuid,
        game_id_games uuid,
        garage_id_garages uuid,
        player_id_players uuid,
        plot_id_plots uuid,
        vehicle_id uuid not null,
        vehicletype_id_vehicletypes uuid,
        status varchar(50) default 'Parked' not null,
        primary key (vehicle_id)
    );

    create table sv_game.vehicletypes (
        base_price numeric(32,2) not null,
        cargo_capacity integer default 0 not null,
        passenger_capacity integer default 1 not null,
        speed_modifier numeric(5,2) default 1.0 not null,
        work_efficiency_modifier numeric(5,2) default 0.0 not null,
        game_id_games uuid,
        vehicletype_id uuid not null,
        garage_size_needed varchar(50) default 'Small' not null,
        type varchar(50) not null,
        maker varchar(255) not null,
        name varchar(255) not null,
        primary key (vehicletype_id)
    );

    create table banks_current_owner_debts (
        bank_bank_id uuid not null,
        current_owner_debts_debt_id uuid not null unique,
        primary key (bank_bank_id, current_owner_debts_debt_id)
    );

    create table banks_lender_debts (
        bank_bank_id uuid not null,
        lender_debts_debt_id uuid not null unique,
        primary key (bank_bank_id, lender_debts_debt_id)
    );

    create table companies_borrower_debts (
        borrower_debts_debt_id uuid not null unique,
        company_company_id uuid not null,
        primary key (borrower_debts_debt_id, company_company_id)
    );

    create table companies_current_owner_debts (
        company_company_id uuid not null,
        current_owner_debts_debt_id uuid not null unique,
        primary key (company_company_id, current_owner_debts_debt_id)
    );

    create table companies_lender_debts (
        company_company_id uuid not null,
        lender_debts_debt_id uuid not null unique,
        primary key (company_company_id, lender_debts_debt_id)
    );

    create table npcs_current_owner_debts (
        current_owner_debts_debt_id uuid not null unique,
        npc_npc_id uuid not null,
        primary key (current_owner_debts_debt_id, npc_npc_id)
    );

    create table npcs_lender_debts (
        lender_debts_debt_id uuid not null unique,
        npc_npc_id uuid not null,
        primary key (lender_debts_debt_id, npc_npc_id)
    );

    create table players_borrower_debts (
        borrower_debts_debt_id uuid not null unique,
        player_player_id uuid not null,
        primary key (borrower_debts_debt_id, player_player_id)
    );

    create table players_current_owner_debts (
        current_owner_debts_debt_id uuid not null unique,
        player_player_id uuid not null,
        primary key (current_owner_debts_debt_id, player_player_id)
    );

    create table players_lender_debts (
        lender_debts_debt_id uuid not null unique,
        player_player_id uuid not null,
        primary key (lender_debts_debt_id, player_player_id)
    );

    alter table if exists sv_game.bank_account_transactions 
       add constraint FKjb01eotg0k9dmgrwbf5iy0jp5 
       foreign key (account_id_player_bank_accounts) 
       references sv_game.player_bank_accounts 
       on delete cascade;

    alter table if exists sv_game.banks 
       add constraint FK3c1y8dbh15dbkyke4o37mlqcv 
       foreign key (country_id_countries) 
       references sv_game.countries 
       on delete restrict;

    alter table if exists sv_game.banks 
       add constraint FKc3eo422rdf1dmx32h9gsj3n9i 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.bets 
       add constraint FKmwmk5kpqo18s5eivjy1y2a2g1 
       foreign key (cockfight_id_cockfights) 
       references sv_game.cockfights 
       on delete restrict;

    alter table if exists sv_game.bets 
       add constraint FKmgc4gldko9471s6a46yrd4q33 
       foreign key (debt_id_debts) 
       references sv_game.debts 
       on delete cascade;

    alter table if exists sv_game.bets 
       add constraint FKqalc1cmkrs4ms5x6sdtieigdi 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.buildings 
       add constraint FK6ll35noytqm9m9p4mu77tkq3j 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.buildings 
       add constraint FKrspuqr0x2ikm7x0fmvk8yop5e 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.buildings 
       add constraint FKd2elcads83w6kq1yfqegen4yf 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.cities 
       add constraint FK7cf2lydp0qt74d04iwlvmxxpt 
       foreign key (state_id_states) 
       references sv_game.states 
       on delete cascade;

    alter table if exists sv_game.cockfights 
       add constraint FKqlq17pa8t1g7kqnm4r2txdrlw 
       foreign key (building_id_buildings) 
       references sv_game.buildings 
       on delete restrict;

    alter table if exists sv_game.cockfights 
       add constraint FKobfyo1i2fkht9mfnox83bxfom 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.cockfights 
       add constraint FK11gfxu9p38ija1rs705yo9a6y 
       foreign key (rooster_id_roosters) 
       references sv_game.roosters 
       on delete restrict;

    alter table if exists sv_game.cockfights 
       add constraint FK8dx625xuqx70ier5vphpfsifk 
       foreign key (rooster_id_roosters1) 
       references sv_game.roosters 
       on delete restrict;

    alter table if exists sv_game.companies 
       add constraint FKf8lqctukbufq6y5yfnb2o0sb1 
       foreign key (category_id_business_categories) 
       references sv_game.business_categories 
       on delete restrict;

    alter table if exists sv_game.companies 
       add constraint FKs63xtgd7stvh7cemu0iurkhva 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.companies 
       add constraint FKeuj8jtfhs3gy4yukrs1i7ul65 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.company_buildings 
       add constraint FK22y5dr2scnykbr9vv308dgqi2 
       foreign key (building_id_buildings) 
       references sv_game.buildings 
       on delete cascade;

    alter table if exists sv_game.company_buildings 
       add constraint FK13b0p1nd0c4g0o4wa7s2fo4x9 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete cascade;

    alter table if exists sv_game.company_financial_history 
       add constraint FKrce6cputcnj7lnw0ytw6dwfa9 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete cascade;

    alter table if exists sv_game.company_hqs 
       add constraint FKni4c39t7b7wgqhdjejb2vfj10 
       foreign key (building_id_buildings) 
       references sv_game.buildings 
       on delete set null;

    alter table if exists sv_game.company_hqs 
       add constraint FKcc0jfjqq0u3tosilyltd7upoq 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.countries 
       add constraint FK7tf3wkw44cu78c19dsdaoh0mb 
       foreign key (currency_id_currencies) 
       references sv_game.currencies 
       on delete restrict;

    alter table if exists sv_game.courses 
       add constraint FK976vogbjiefw4m97q946y5ltp 
       foreign key (institution_id_education_institutions) 
       references sv_game.education_institutions 
       on delete cascade;

    alter table if exists sv_game.courses 
       add constraint FKrd630g3rc3gmatet898ru74hg 
       foreign key (skill_id_skills) 
       references sv_game.skills 
       on delete restrict;

    alter table if exists sv_game.crypto_price_history 
       add constraint FKnw12acv2fmbw5rwgf9ehepjir 
       foreign key (crypto_id_cryptocurrencies) 
       references sv_game.cryptocurrencies 
       on delete cascade;

    alter table if exists sv_game.debt_collateral 
       add constraint FKk704y8qkd803plv4wtbdww0h5 
       foreign key (debt_id_debts) 
       references sv_game.debts 
       on delete cascade;

    alter table if exists sv_game.debts 
       add constraint FKcs88dspsf64utcuhhyemnyx11 
       foreign key (company_id_companies1) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKrthvkrkw4hxhn283xq75lxa5x 
       foreign key (player_id_players1) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKgfo6uvpv3bvysi11bl23p2hiq 
       foreign key (bank_id_banks1) 
       references sv_game.banks 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FK2uktynyetgrdsx83ubyt4qs29 
       foreign key (company_id_companies2) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKc65tcl210hwoghxdvo5g9my8m 
       foreign key (npc_id_npcs1) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FK2frdiq4ofdqmhwnu2vied6p9v 
       foreign key (player_id_players2) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKopljj9ssuoc30ry1a7mwq1kra 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.debts 
       add constraint FKqxtbljltmmksn95m4qjoev936 
       foreign key (bank_id_banks) 
       references sv_game.banks 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKd5c064dh0pa2wht549cb9sd8u 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FK12gou4btbw1bs6wfp7jiutdqx 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKb6rey8v4j2prnbl1nsiwloli5 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.exchange_rate_history 
       add constraint FKjx5bsqpdoigsamd3d7rtorofd 
       foreign key (currency_id_currencies) 
       references sv_game.currencies 
       on delete cascade;

    alter table if exists sv_game.garage_parking 
       add constraint FKtp8df3jelgglta093po3o44nn 
       foreign key (garage_id_garages) 
       references sv_game.garages 
       on delete cascade;

    alter table if exists sv_game.garage_parking 
       add constraint FKd3imjk7gr7jf9mis3gdrm438j 
       foreign key (vehicle_id_vehicles) 
       references sv_game.vehicles 
       on delete set null;

    alter table if exists sv_game.garages 
       add constraint FKdpljwwasu6nxisevhdt2alkp6 
       foreign key (building_id_buildings) 
       references sv_game.buildings 
       on delete restrict;

    alter table if exists sv_game.garages 
       add constraint FKbl3ic5nuwjylw8crmy9ydmk7v 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.jobs 
       add constraint FK1b5sy0anbsi2untb9lwjmefcj 
       foreign key (category_id_job_categories) 
       references sv_game.job_categories 
       on delete restrict;

    alter table if exists sv_game.jobs 
       add constraint FKtecafloh6bl6wtowcfmjwlckl 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.news_events 
       add constraint FK7h9th81fdohmdt8rs7pf3tu2r 
       foreign key (city_id_cities) 
       references sv_game.cities 
       on delete set null;

    alter table if exists sv_game.news_events 
       add constraint FKm56xkkxru1jivb7vhdy35e7x4 
       foreign key (country_id_countries) 
       references sv_game.countries 
       on delete set null;

    alter table if exists sv_game.news_events 
       add constraint FKjj6beencj0sqs3bn7y9tmabyq 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.nfts 
       add constraint FKtpukh60cc0h0eqs8vpi8nxo9s 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.nfts 
       add constraint FK1tqeke9ns7xa0mqs29ppssigb 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete cascade;

    alter table if exists sv_game.nfts 
       add constraint FK2mpuegmp460fd9qqoglb8q7vc 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.npc_stock_holdings 
       add constraint FKd5odir83mlchi5plscr7t8s19 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete cascade;

    alter table if exists sv_game.npc_stock_holdings 
       add constraint FKspi63pcny7jqwr4os93golkop 
       foreign key (stock_id_stocks) 
       references sv_game.stocks 
       on delete cascade;

    alter table if exists sv_game.npcs 
       add constraint FKob89bub3loftatblwp6hqyui4 
       foreign key (city_id_cities) 
       references sv_game.cities 
       on delete set null;

    alter table if exists sv_game.npcs 
       add constraint FKjkoydn7ifemb0brvb9o8p61lo 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.npcs 
       add constraint FKrnmw574r861xh4rxxfi8m14b3 
       foreign key (plot_id_plots) 
       references sv_game.plots 
       on delete set null;

    alter table if exists sv_game.player_attributes 
       add constraint FK1pns89q1q82l8mr7w7vuhfof1 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.player_bank_accounts 
       add constraint FK110v4ggqr56h57tag7lyux8w9 
       foreign key (bank_id_banks) 
       references sv_game.banks 
       on delete restrict;

    alter table if exists sv_game.player_bank_accounts 
       add constraint FKrhpqwwqmsfhusgetbdwuxere2 
       foreign key (currency_id_currencies) 
       references sv_game.currencies 
       on delete restrict;

    alter table if exists sv_game.player_bank_accounts 
       add constraint FKolper7hdyxikhd5eoxkv50h7e 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_career_progress 
       add constraint FKwbnqi0uaslfy2cnc9ow11nav 
       foreign key (path_id_career_paths) 
       references sv_game.career_paths 
       on delete set null;

    alter table if exists sv_game.player_career_progress 
       add constraint FKafqn3bknvum59gahu9225p54x 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_crypto_holdings 
       add constraint FKj1t8wbs2fo2rbhg27ou7p1l6q 
       foreign key (crypto_id_cryptocurrencies) 
       references sv_game.cryptocurrencies 
       on delete cascade;

    alter table if exists sv_game.player_crypto_holdings 
       add constraint FK9qvwu9r65htxk35s0tqkrpf4 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_currency_holdings 
       add constraint FKsr1urdyeby8djplio1204s20 
       foreign key (currency_id_currencies) 
       references sv_game.currencies 
       on delete cascade;

    alter table if exists sv_game.player_currency_holdings 
       add constraint FKw8pw51tibm4mbo9899pmr3fl 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_inventory 
       add constraint FKelb21uoil2s5g0n9qijm2q301 
       foreign key (item_id_items) 
       references sv_game.items 
       on delete restrict;

    alter table if exists sv_game.player_inventory 
       add constraint FKb166j4iorux4nh11xqnce6bvn 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_investments 
       add constraint FK4ndaalb0y85xw4amc5l5cic7i 
       foreign key (opportunity_id_investment_opportunities) 
       references sv_game.investment_opportunities 
       on delete restrict;

    alter table if exists sv_game.player_investments 
       add constraint FKt1sl52kbhbu107vj3vfpx3fxh 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_nft_holdings 
       add constraint FKlsuf0wnqhthndqwnslig9cqce 
       foreign key (nft_id_nfts) 
       references sv_game.nfts 
       on delete cascade;

    alter table if exists sv_game.player_nft_holdings 
       add constraint FK4sqd1orv42g0odi0dx6a0y6e4 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_npc_relationships 
       add constraint FKj1eec75g3eg4bolul2v3wxonr 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete cascade;

    alter table if exists sv_game.player_npc_relationships 
       add constraint FKi7vaw7tbd21wb25d1vd6gglp3 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_skills 
       add constraint FKhydbgbkdkll86f7dadbnns67p 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_skills 
       add constraint FK3v1ionoiwfqkqhpn78or43x4m 
       foreign key (skill_id_skills) 
       references sv_game.skills 
       on delete restrict;

    alter table if exists sv_game.player_status_effects 
       add constraint FKhs2w2fejcmmwpvd9h16fwqid5 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_stock_holdings 
       add constraint FK19vns04swoyp8vmclk4yfjuyr 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_stock_holdings 
       add constraint FKaioj2l1vrdiqalgfeujallpaa 
       foreign key (stock_id_stocks) 
       references sv_game.stocks 
       on delete cascade;

    alter table if exists sv_game.players 
       add constraint FK470a3pox856ynx6amiaxk7r2w 
       foreign key (city_id_cities) 
       references sv_game.cities 
       on delete restrict;

    alter table if exists sv_game.players 
       add constraint FKglekn1d8fmwrx3f4he2rrswdp 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.players 
       add constraint FKeo3cccb1rw2iai7ede56vk1e6 
       foreign key (job_id_jobs) 
       references sv_game.jobs 
       on delete set null;

    alter table if exists sv_game.players 
       add constraint FK8i0fmgdxpjlhjbsx3lm3tvefr 
       foreign key (plot_id_plots) 
       references sv_game.plots 
       on delete set null;

    alter table if exists sv_game.plots 
       add constraint FKtg1jw8x0cvje2x12qfq95a4w4 
       foreign key (building_id_buildings) 
       references sv_game.buildings 
       on delete set null;

    alter table if exists sv_game.plots 
       add constraint FKgq36msv8mstmgn41r41n5j7n4 
       foreign key (city_id_cities) 
       references sv_game.cities 
       on delete cascade;

    alter table if exists sv_game.plots 
       add constraint FKiip7oclybvedms00hp7odm2e4 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.plots 
       add constraint FKgs1p2fdahvh2arnw8b5i3rbjn 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.plots 
       add constraint FK4ic6ga8g4rr8oi2mx78oie4pb 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.products 
       add constraint FKgri9ydog2re8fd4mqoglhgxq3 
       foreign key (category_id_business_categories) 
       references sv_game.business_categories 
       on delete restrict;

    alter table if exists sv_game.products 
       add constraint FKo9d40w63d95ken7unvgl29777 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete cascade;

    alter table if exists sv_game.roosters 
       add constraint FKe1oo71xedprthp152yuh1ph5a 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.roosters 
       add constraint FK2r0quvhcf37cpjo61g20d888y 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.roosters 
       add constraint FKojlu0jctyx8lm6do0g0adh98w 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.roosters 
       add constraint FK7nwv4qeee2q66302evkg87vvq 
       foreign key (plot_id_plots) 
       references sv_game.plots 
       on delete set null;

    alter table if exists sv_game.states 
       add constraint FKsr3xajspbtb3ax0kv3awl0m36 
       foreign key (country_id_countries) 
       references sv_game.countries 
       on delete cascade;

    alter table if exists sv_game.stock_price_history 
       add constraint FKcktx49vdf2r4l97680q5n0r14 
       foreign key (stock_id_stocks) 
       references sv_game.stocks 
       on delete cascade;

    alter table if exists sv_game.stocks 
       add constraint FKld8wa553b25iqu9d85v30q3yo 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.stocks 
       add constraint FKmntcivtb5ydv9w935kececlnk 
       foreign key (market_id_stock_markets) 
       references sv_game.stock_markets 
       on delete restrict;

    alter table if exists sv_game.transactions 
       add constraint FKg9s9tn0iu7p6w5dpwnhhev7v5 
       foreign key (account_id_player_bank_accounts) 
       references sv_game.player_bank_accounts 
       on delete set null;

    alter table if exists sv_game.transactions 
       add constraint FK6sidjgxmloqpsceecsegxmbla 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete cascade;

    alter table if exists sv_game.transactions 
       add constraint FKc8hqlprwvvxj2l74pn0mmolxb 
       foreign key (currency_id_currencies) 
       references sv_game.currencies 
       on delete restrict;

    alter table if exists sv_game.transactions 
       add constraint FK5kxpgv6hdu17lvouy94gqgolg 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.vehicles 
       add constraint FKk06nrxm8sp2wjn2uaf80algvb 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.vehicles 
       add constraint FKl5f2o3u0e5plo4vfw3f4at1bd 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.vehicles 
       add constraint FKrak56p5u7ey4gude78exdqns9 
       foreign key (garage_id_garages) 
       references sv_game.garages 
       on delete set null;

    alter table if exists sv_game.vehicles 
       add constraint FKpdm8v9iqaj0enw5d13tn8takq 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.vehicles 
       add constraint FKb6glpoql8vkpdujp5255ft1la 
       foreign key (plot_id_plots) 
       references sv_game.plots 
       on delete set null;

    alter table if exists sv_game.vehicles 
       add constraint FK9ki55d9lcd53tbrn3p359knec 
       foreign key (vehicletype_id_vehicletypes) 
       references sv_game.vehicletypes 
       on delete restrict;

    alter table if exists sv_game.vehicletypes 
       add constraint FKc5oah51n6hensi8afvm3s0fiu 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists banks_current_owner_debts 
       add constraint FK37lmb9vcyljhpu09sy0xyqhsu 
       foreign key (current_owner_debts_debt_id) 
       references sv_game.debts;

    alter table if exists banks_current_owner_debts 
       add constraint FKcgmup11310ufo013lsr3rlftj 
       foreign key (bank_bank_id) 
       references sv_game.banks;

    alter table if exists banks_lender_debts 
       add constraint FK4k8vvsbl8qjnawfthmqrpyku1 
       foreign key (lender_debts_debt_id) 
       references sv_game.debts;

    alter table if exists banks_lender_debts 
       add constraint FKag301ygledx68bxsbq3xi7vlm 
       foreign key (bank_bank_id) 
       references sv_game.banks;

    alter table if exists companies_borrower_debts 
       add constraint FKel91o1cywtlg07ytv1xgmrrs0 
       foreign key (borrower_debts_debt_id) 
       references sv_game.debts;

    alter table if exists companies_borrower_debts 
       add constraint FKf6mx11foobfp2ojk9fcxrkx3f 
       foreign key (company_company_id) 
       references sv_game.companies;

    alter table if exists companies_current_owner_debts 
       add constraint FKawd0h3atl3r6f7iqg16r1fjw6 
       foreign key (current_owner_debts_debt_id) 
       references sv_game.debts;

    alter table if exists companies_current_owner_debts 
       add constraint FKk5bgw06sfwdjm02ah8b8na23p 
       foreign key (company_company_id) 
       references sv_game.companies;

    alter table if exists companies_lender_debts 
       add constraint FK2pmvyknp7jt61i82f8wx6lrwa 
       foreign key (lender_debts_debt_id) 
       references sv_game.debts;

    alter table if exists companies_lender_debts 
       add constraint FKtiyiqmp9hgjeke02wuhdb4uvo 
       foreign key (company_company_id) 
       references sv_game.companies;

    alter table if exists npcs_current_owner_debts 
       add constraint FKhbmkv3686p02vys523213c5xl 
       foreign key (current_owner_debts_debt_id) 
       references sv_game.debts;

    alter table if exists npcs_current_owner_debts 
       add constraint FK67vacw4x9b7xruhyv83w4n6tb 
       foreign key (npc_npc_id) 
       references sv_game.npcs;

    alter table if exists npcs_lender_debts 
       add constraint FK5fe23xglul0y1fx5d3s7i9yin 
       foreign key (lender_debts_debt_id) 
       references sv_game.debts;

    alter table if exists npcs_lender_debts 
       add constraint FKba84g1xkqkfwnxgsg2buh3hwd 
       foreign key (npc_npc_id) 
       references sv_game.npcs;

    alter table if exists players_borrower_debts 
       add constraint FKquopy2rg1uo2l1ae1n6ffiu0v 
       foreign key (borrower_debts_debt_id) 
       references sv_game.debts;

    alter table if exists players_borrower_debts 
       add constraint FK8ke87wbo8oqf4pxqmfovug2f2 
       foreign key (player_player_id) 
       references sv_game.players;

    alter table if exists players_current_owner_debts 
       add constraint FKn1h1o93c3r8f101mf53o6ylfy 
       foreign key (current_owner_debts_debt_id) 
       references sv_game.debts;

    alter table if exists players_current_owner_debts 
       add constraint FKdvljaamut8swalyq49qy53q0x 
       foreign key (player_player_id) 
       references sv_game.players;

    alter table if exists players_lender_debts 
       add constraint FKg5xjq5knal99mk24g7wog1dxc 
       foreign key (lender_debts_debt_id) 
       references sv_game.debts;

    alter table if exists players_lender_debts 
       add constraint FK9jb0i0t91w5eodrek9gx2gm58 
       foreign key (player_player_id) 
       references sv_game.players;

    create table sv_game.bank_account_transactions (
        amount numeric(32,2) not null,
        transaction_date timestamp(6) with time zone not null,
        account_id_player_bank_accounts uuid,
        bank_transaction_id uuid not null,
        transaction_type varchar(100) not null,
        description text not null,
        primary key (bank_transaction_id)
    );

    create table sv_game.banks (
        deposit_interest_rate numeric(5,4) default 0.00 not null,
        is_player_bank boolean default false not null,
        loan_interest_rate numeric(5,4) default 0.00 not null,
        monthly_account_fee numeric(10,2) default 0.00 not null,
        reputation integer default 500 not null,
        stability_index numeric(5,2) default 100.00 not null,
        transaction_fee_rate numeric(5,4) default 0.00 not null,
        bank_id uuid not null,
        country_id_countries uuid,
        player_id_players uuid,
        name varchar(255) not null,
        primary key (bank_id)
    );

    create table sv_game.bets (
        amount_bet numeric(16,2) not null,
        outcome_amount numeric(16,2) not null,
        bet_date timestamp(6) with time zone not null,
        bet_id uuid not null,
        cockfight_id_cockfights uuid,
        debt_id_debts uuid,
        player_id_players uuid,
        type varchar(100) not null,
        details jsonb not null,
        primary key (bet_id)
    );

    create table sv_game.buildings (
        capacity integer not null,
        condition_percentage integer default 100 not null,
        construction_cost numeric(32,2) not null,
        current_value numeric(32,2) not null,
        is_company_headquarters boolean default false not null,
        is_player_home boolean default false not null,
        maintenance_cost_per_month numeric(16,2) not null,
        rent_per_month numeric(5,2) not null,
        upgrade_level integer default 0 not null,
        building_id uuid not null,
        company_id_companies uuid,
        npc_id_npcs uuid,
        player_id_players uuid,
        building_type varchar(100) not null,
        customization_data jsonb not null,
        primary key (building_id)
    );

    create table sv_game.business_categories (
        category_id uuid not null,
        name varchar(255) not null,
        description text,
        primary key (category_id)
    );

    create table sv_game.career_paths (
        path_id uuid not null,
        related_attribute varchar(50) not null,
        name varchar(255) not null,
        description text not null,
        primary key (path_id)
    );

    create table sv_game.cities (
        cost_of_living_index numeric(5,2) not null,
        local_crime_rate numeric(5,2) not null,
        size_modifier numeric(5,2) not null,
        unemployment_rate numeric(5,2) not null,
        population bigint not null,
        city_id uuid not null,
        state_id_states uuid,
        city_type varchar(100) not null,
        name varchar(255) not null,
        procedural_seed varchar(255),
        generated_map_layout jsonb not null,
        map_config_data jsonb not null,
        primary key (city_id)
    );

    create table sv_game.cockfights (
        loser_died boolean,
        date_time timestamp(6) with time zone not null,
        building_id_buildings uuid,
        cockfight_id uuid not null,
        game_id_games uuid,
        rooster_id_roosters uuid,
        rooster_id_roosters1 uuid,
        outcome varchar(50),
        status varchar(50) default 'Scheduled' not null,
        primary key (cockfight_id)
    );

    create table sv_game.companies (
        cash_balance numeric(32,2) default 0.00 not null,
        founding_date date not null,
        growth_rate numeric(5,2) not null,
        is_publicly_traded boolean default false not null,
        market_share numeric(5,2) default 0.00 not null,
        marketing_level integer default 0 not null,
        net_worth numeric(32,2) not null,
        production_capacity integer not null,
        r_and_d_level integer default 0 not null,
        reputation integer default 500 not null,
        category_id_business_categories uuid,
        company_id uuid not null,
        npc_id_npcs uuid,
        player_id_players uuid,
        name varchar(255) not null,
        primary key (company_id)
    );

    create table sv_game.company_buildings (
        is_active boolean default true not null,
        building_id_buildings uuid,
        company_building_id uuid not null,
        company_id_companies uuid,
        role varchar(100) not null,
        primary key (company_building_id)
    );

    create table sv_game.company_financial_history (
        employees_count integer not null,
        expenses numeric(32,2) not null,
        net_worth_snapshot numeric(32,2) not null,
        profit numeric(32,2) not null,
        record_date date not null,
        revenue numeric(32,2) not null,
        company_id_companies uuid,
        record_id uuid not null,
        primary key (record_id)
    );

    create table sv_game.company_hqs (
        building_id_buildings uuid unique,
        company_hq_id uuid not null,
        company_id_companies uuid unique,
        primary key (company_hq_id)
    );

    create table sv_game.countries (
        base_tax_rate numeric(5,2) not null,
        business_tax_rate numeric(5,2) not null,
        corruption_level numeric(5,2) not null,
        crime_rate_modifier numeric(5,2) not null,
        growth_potential numeric(5,2) not null,
        import_export_duty numeric(5,2) not null,
        stability_index numeric(5,2) not null,
        country_id uuid not null,
        currency_id_currencies uuid,
        economic_system varchar(100) not null,
        law_system varchar(100) not null,
        name varchar(255) not null,
        primary key (country_id)
    );

    create table sv_game.courses (
        cost numeric(16,2) not null,
        duration_days integer not null,
        course_id uuid not null,
        institution_id_education_institutions uuid,
        skill_id_skills uuid,
        related_attribute varchar(50) not null,
        name varchar(255) not null,
        description text not null,
        primary key (course_id)
    );

    create table sv_game.crypto_price_history (
        price numeric(16,2) not null,
        record_time timestamp(6) with time zone not null,
        crypto_id_cryptocurrencies uuid,
        history_id uuid not null,
        primary key (history_id)
    );

    create table sv_game.cryptocurrencies (
        current_price numeric(16,2) not null,
        mining_difficulty numeric(16,2) not null,
        volatility numeric(5,2) not null,
        circulating_supply bigint not null,
        supply_limit bigint,
        symbol varchar(10) not null,
        crypto_id uuid not null,
        name varchar(255) not null,
        primary key (crypto_id)
    );

    create table sv_game.currencies (
        exchange_rate_to_base_currency numeric(16,2) not null,
        iso_code varchar(3) not null,
        volatility numeric(5,2) not null,
        symbol varchar(10) not null,
        currency_id uuid not null,
        name varchar(255) not null,
        primary key (currency_id)
    );

    create table sv_game.debt_collateral (
        collateral_value_at_loan_time numeric(32,2) not null,
        is_currently_held boolean not null,
        collateral_entity_id uuid not null,
        debt_collateral_id uuid not null,
        debt_id_debts uuid,
        collateral_type varchar(50) not null,
        primary key (debt_collateral_id)
    );

    create table sv_game.debts (
        current_debt numeric(32,2),
        interest_rate numeric(5,4) not null,
        minimum_next_payment_amount numeric(32,2),
        original_value numeric(32,2) not null,
        end_date timestamp(6) with time zone not null,
        next_payment_date timestamp(6) with time zone,
        start_date timestamp(6) with time zone not null,
        bank_id_banks uuid,
        bank_id_banks1 uuid,
        company_id_companies uuid,
        company_id_companies1 uuid,
        company_id_companies2 uuid,
        debt_id uuid not null,
        game_id_games uuid,
        npc_id_npcs uuid,
        npc_id_npcs1 uuid,
        player_id_players uuid,
        player_id_players1 uuid,
        player_id_players2 uuid,
        debt_type varchar(50) default 'Loan' not null,
        payment_frequency varchar(50) not null,
        status varchar(50) default 'Active' not null,
        primary key (debt_id)
    );

    create table sv_game.education_institutions (
        institution_id uuid not null,
        type varchar(100) not null,
        name varchar(255) not null,
        primary key (institution_id)
    );

    create table sv_game.exchange_rate_history (
        exchange_rate numeric(16,4) not null,
        record_time timestamp(6) with time zone not null,
        currency_id_currencies uuid,
        history_id uuid not null,
        primary key (history_id)
    );

    create table sv_game.games (
        game_speed_multiplier numeric(3,1) default 1.0 not null,
        current_date_time timestamp(6) with time zone,
        last_save_time timestamp(6) with time zone,
        game_id uuid not null,
        game_name varchar(255) not null,
        primary key (game_id)
    );

    create table sv_game.garage_parking (
        garage_id_garages uuid,
        garage_parking_id uuid not null,
        vehicle_id_vehicles uuid unique,
        parking_spot_number varchar(50),
        primary key (garage_parking_id)
    );

    create table sv_game.garages (
        available_slots integer not null,
        total_slots integer not null,
        building_id_buildings uuid unique,
        game_id_games uuid,
        garage_id uuid not null,
        slot_size_type varchar(50) not null,
        primary key (garage_id)
    );

    create table sv_game.investment_opportunities (
        duration_days integer not null,
        end_date date not null,
        expected_return_max numeric(5,2) not null,
        expected_return_min numeric(5,2) not null,
        is_active boolean default true not null,
        max_investment numeric(32,2) not null,
        min_investment numeric(32,2) not null,
        risk_level numeric(5,2) not null,
        start_date date not null,
        opportunity_id uuid not null,
        name varchar(255) not null,
        description text not null,
        primary key (opportunity_id)
    );

    create table sv_game.items (
        value numeric(16,2) not null,
        item_id uuid not null,
        type varchar(100) not null,
        name varchar(255) not null,
        description text not null,
        effect_data jsonb not null,
        primary key (item_id)
    );

    create table sv_game.job_categories (
        category_id uuid not null,
        name varchar(255) not null,
        primary key (category_id)
    );

    create table sv_game.jobs (
        base_salary_per_day numeric(16,2) not null,
        is_available boolean default true not null,
        required_charisma integer not null,
        required_education_score integer not null,
        required_intelligence integer not null,
        required_strength integer not null,
        xp_per_day integer not null,
        category_id_job_categories uuid,
        company_id_companies uuid,
        job_id uuid not null,
        required_education_level varchar(100) not null,
        title varchar(255) not null,
        primary key (job_id)
    );

    create table sv_game.news_events (
        is_global boolean default false not null,
        event_date timestamp(6) with time zone not null,
        city_id_cities uuid,
        country_id_countries uuid,
        event_id uuid not null,
        game_id_games uuid,
        event_type varchar(100) not null,
        title varchar(255) not null,
        description text not null,
        impact_data jsonb not null,
        primary key (event_id)
    );

    create table sv_game.nfts (
        current_value numeric(32,2) not null,
        initial_value numeric(32,2) not null,
        creation_date timestamp(6) with time zone not null,
        game_id_games uuid,
        nft_id uuid not null,
        npc_id_npcs uuid,
        player_id_players uuid,
        contract_address varchar(255),
        image_path varchar(255),
        name varchar(255) not null,
        token_id varchar(255),
        description text,
        generation_params jsonb,
        primary key (nft_id)
    );

    create table sv_game.npc_stock_holdings (
        average_purchase_price numeric(16,2) not null,
        last_updated_time timestamp(6) with time zone not null,
        shares_owned bigint not null,
        holding_id uuid not null,
        npc_id_npcs uuid,
        stock_id_stocks uuid,
        primary key (holding_id)
    );

    create table sv_game.npcs (
        charisma integer not null,
        intelligence integer not null,
        is_essential boolean default false not null,
        karma integer default 500 not null,
        luck integer not null,
        strength integer not null,
        city_id_cities uuid,
        game_id_games uuid,
        npc_id uuid not null,
        plot_id_plots uuid,
        financial_status varchar(50) not null,
        gender varchar(50) not null,
        status varchar(50) default 'Available' not null,
        occupation varchar(100),
        job_title varchar(255),
        name varchar(255) not null,
        appearance_data jsonb,
        notes text,
        personality_traits jsonb,
        primary key (npc_id)
    );

    create table sv_game.player_attributes (
        charisma integer default 1 not null,
        intelligence integer default 1 not null,
        luck integer default 1 not null,
        strength integer default 1 not null,
        last_updated_time timestamp(6) with time zone not null,
        attribute_id uuid not null,
        player_id_players uuid unique,
        primary key (attribute_id)
    );

    create table sv_game.player_bank_accounts (
        balance numeric(32,2) default 0.00 not null,
        is_primary boolean default false not null,
        created_date timestamp(6) with time zone not null,
        last_activity_date timestamp(6) with time zone not null,
        account_id uuid not null,
        bank_id_banks uuid,
        currency_id_currencies uuid,
        player_id_players uuid,
        account_number varchar(50) not null,
        account_type varchar(50) not null,
        primary key (account_id)
    );

    create table sv_game.player_career_progress (
        level integer default 1 not null,
        xp_in_path integer default 0 not null,
        last_level_up_date timestamp(6) with time zone not null,
        path_id_career_paths uuid,
        player_id_players uuid,
        progress_id uuid not null,
        primary key (progress_id)
    );

    create table sv_game.player_crypto_holdings (
        amount numeric(24,8) not null,
        average_purchase_price numeric(16,2) not null,
        last_updated_time timestamp(6) with time zone not null,
        crypto_id_cryptocurrencies uuid,
        holding_id uuid not null,
        player_id_players uuid,
        primary key (holding_id)
    );

    create table sv_game.player_currency_holdings (
        amount numeric(32,2) default 0.00 not null,
        last_updated_time timestamp(6) with time zone not null,
        currency_id_currencies uuid,
        holding_id uuid not null,
        player_id_players uuid,
        primary key (holding_id)
    );

    create table sv_game.player_inventory (
        equipped boolean default false not null,
        quantity integer default 1 not null,
        inventory_id uuid not null,
        item_id_items uuid,
        player_id_players uuid,
        primary key (inventory_id)
    );

    create table sv_game.player_investments (
        actual_return_amount numeric(32,2) not null,
        amount_invested numeric(32,2) not null,
        expected_return_amount numeric(32,2) not null,
        completion_date timestamp(6) with time zone not null,
        investment_date timestamp(6) with time zone not null,
        opportunity_id_investment_opportunities uuid,
        player_id_players uuid,
        player_investment_id uuid not null,
        status varchar(50) not null,
        primary key (player_investment_id)
    );

    create table sv_game.player_nft_holdings (
        acquisition_price numeric(32,2) not null,
        is_listed_for_sale boolean default false not null,
        listing_price numeric(32,2),
        acquisition_date timestamp(6) with time zone not null,
        holding_id uuid not null,
        nft_id_nfts uuid unique,
        player_id_players uuid,
        primary key (holding_id)
    );

    create table sv_game.player_npc_relationships (
        level integer default 0 not null,
        last_interaction_date timestamp(6) with time zone,
        npc_id_npcs uuid,
        player_id_players uuid,
        relationship_id uuid not null,
        relationship_type varchar(50) default 'Neutral' not null,
        primary key (relationship_id)
    );

    create table sv_game.player_skills (
        level integer default 0 not null,
        xp integer default 0 not null,
        last_updated_time timestamp(6) with time zone not null,
        player_id_players uuid,
        player_skill_id uuid not null,
        skill_id_skills uuid,
        primary key (player_skill_id)
    );

    create table sv_game.player_status_effects (
        end_time timestamp(6) with time zone,
        start_time timestamp(6) with time zone not null,
        effect_id uuid not null,
        player_id_players uuid,
        type varchar(100) not null,
        modifier_data jsonb not null,
        primary key (effect_id)
    );

    create table sv_game.player_stock_holdings (
        average_purchase_price numeric(16,2) not null,
        last_updated_time timestamp(6) with time zone not null,
        shares_owned bigint not null,
        holding_id uuid not null,
        player_id_players uuid,
        stock_id_stocks uuid,
        primary key (holding_id)
    );

    create table sv_game.players (
        age integer not null,
        cash_balance numeric(64,2) default 0.00 not null,
        date_of_birth date not null,
        education_score integer default 0 not null,
        energy integer default 100 not null,
        experience_points integer default 0 not null,
        happiness integer default 100 not null,
        health integer default 100 not null,
        karma integer default 500 not null,
        city_id_cities uuid,
        game_id_games uuid,
        job_id_jobs uuid,
        player_id uuid not null,
        plot_id_plots uuid,
        gender varchar(50) not null,
        education_level varchar(100) default 'None' not null,
        name varchar(255) not null,
        appearance_data jsonb not null,
        primary key (player_id)
    );

    create table sv_game.plots (
        current_value numeric(32,2) not null,
        is_available_for_sale boolean default true not null,
        is_empty boolean default true not null,
        purchase_price numeric(32,2) not null,
        last_update_time timestamp(6) with time zone not null,
        building_id_buildings uuid unique,
        city_id_cities uuid,
        company_id_companies uuid,
        npc_id_npcs uuid,
        player_id_players uuid,
        plot_id uuid not null,
        zoning_type varchar(50) default 'Not Zoned' not null,
        primary key (plot_id)
    );

    create table sv_game.products (
        base_production_cost numeric(16,2) not null,
        current_market_price numeric(16,2) not null,
        demand numeric(5,2) not null,
        production_rate_per_day numeric(16,2) not null,
        quality integer default 50 not null,
        supply numeric(5,2) not null,
        category_id_business_categories uuid,
        company_id_companies uuid,
        product_id uuid not null,
        name varchar(255) not null,
        primary key (product_id)
    );

    create table sv_game.roosters (
        age_days integer not null,
        aggression integer not null,
        draw_count integer default 0 not null,
        health integer default 100 not null,
        is_deceased boolean default false not null,
        kill_count integer default 0 not null,
        loss_count integer default 0 not null,
        speed integer not null,
        strength integer not null,
        win_count integer default 0 not null,
        game_id_games uuid,
        npc_id_npcs uuid,
        player_id_players uuid,
        plot_id_plots uuid,
        rooster_id uuid not null,
        status varchar(50) default 'Available' not null,
        name varchar(255) not null,
        primary key (rooster_id)
    );

    create table sv_game.skills (
        skill_id uuid not null,
        related_attribute varchar(50) not null,
        name varchar(255) not null,
        description text not null,
        primary key (skill_id)
    );

    create table sv_game.states (
        additional_regional_tax_rate numeric(5,2) default 0.00 not null,
        country_id_countries uuid,
        state_id uuid not null,
        name varchar(255) not null,
        environmental_regulations_data jsonb not null,
        zoning_regulations_data jsonb not null,
        primary key (state_id)
    );

    create table sv_game.stock_markets (
        closing_time time(6) not null,
        opening_time time(6) not null,
        market_id uuid not null,
        name varchar(255) not null,
        primary key (market_id)
    );

    create table sv_game.stock_price_history (
        price numeric(16,2) not null,
        record_time timestamp(6) with time zone not null,
        volume bigint not null,
        history_id uuid not null,
        stock_id_stocks uuid,
        primary key (history_id)
    );

    create table sv_game.stocks (
        current_price numeric(16,2) not null,
        volatility numeric(5,2) not null,
        last_trade_time timestamp(6) with time zone not null,
        shares_outstanding bigint not null,
        ticker_symbol varchar(10) not null,
        company_id_companies uuid unique,
        market_id_stock_markets uuid,
        stock_id uuid not null,
        primary key (stock_id)
    );

    create table sv_game.transactions (
        amount numeric(32,2) not null,
        transaction_date timestamp(6) with time zone not null,
        account_id_player_bank_accounts uuid,
        company_id_companies uuid,
        currency_id_currencies uuid,
        player_id_players uuid,
        related_entity_id uuid,
        transaction_id uuid not null,
        type varchar(100) not null,
        related_entity_type varchar(255),
        description text not null,
        primary key (transaction_id)
    );

    create table sv_game.vehicles (
        condition_percentage integer default 100 not null,
        current_value numeric(32,2) not null,
        mileage integer default 0 not null,
        purchase_price numeric(32,2) not null,
        company_id_companies uuid,
        game_id_games uuid,
        garage_id_garages uuid,
        player_id_players uuid,
        plot_id_plots uuid,
        vehicle_id uuid not null,
        vehicletype_id_vehicletypes uuid,
        status varchar(50) default 'Parked' not null,
        primary key (vehicle_id)
    );

    create table sv_game.vehicletypes (
        base_price numeric(32,2) not null,
        cargo_capacity integer default 0 not null,
        passenger_capacity integer default 1 not null,
        speed_modifier numeric(5,2) default 1.0 not null,
        work_efficiency_modifier numeric(5,2) default 0.0 not null,
        game_id_games uuid,
        vehicletype_id uuid not null,
        garage_size_needed varchar(50) default 'Small' not null,
        type varchar(50) not null,
        maker varchar(255) not null,
        name varchar(255) not null,
        primary key (vehicletype_id)
    );

    create table banks_current_owner_debts (
        bank_bank_id uuid not null,
        current_owner_debts_debt_id uuid not null unique,
        primary key (bank_bank_id, current_owner_debts_debt_id)
    );

    create table banks_lender_debts (
        bank_bank_id uuid not null,
        lender_debts_debt_id uuid not null unique,
        primary key (bank_bank_id, lender_debts_debt_id)
    );

    create table companies_borrower_debts (
        borrower_debts_debt_id uuid not null unique,
        company_company_id uuid not null,
        primary key (borrower_debts_debt_id, company_company_id)
    );

    create table companies_current_owner_debts (
        company_company_id uuid not null,
        current_owner_debts_debt_id uuid not null unique,
        primary key (company_company_id, current_owner_debts_debt_id)
    );

    create table companies_lender_debts (
        company_company_id uuid not null,
        lender_debts_debt_id uuid not null unique,
        primary key (company_company_id, lender_debts_debt_id)
    );

    create table npcs_current_owner_debts (
        current_owner_debts_debt_id uuid not null unique,
        npc_npc_id uuid not null,
        primary key (current_owner_debts_debt_id, npc_npc_id)
    );

    create table npcs_lender_debts (
        lender_debts_debt_id uuid not null unique,
        npc_npc_id uuid not null,
        primary key (lender_debts_debt_id, npc_npc_id)
    );

    create table players_borrower_debts (
        borrower_debts_debt_id uuid not null unique,
        player_player_id uuid not null,
        primary key (borrower_debts_debt_id, player_player_id)
    );

    create table players_current_owner_debts (
        current_owner_debts_debt_id uuid not null unique,
        player_player_id uuid not null,
        primary key (current_owner_debts_debt_id, player_player_id)
    );

    create table players_lender_debts (
        lender_debts_debt_id uuid not null unique,
        player_player_id uuid not null,
        primary key (lender_debts_debt_id, player_player_id)
    );

    alter table if exists sv_game.bank_account_transactions 
       add constraint FKjb01eotg0k9dmgrwbf5iy0jp5 
       foreign key (account_id_player_bank_accounts) 
       references sv_game.player_bank_accounts 
       on delete cascade;

    alter table if exists sv_game.banks 
       add constraint FK3c1y8dbh15dbkyke4o37mlqcv 
       foreign key (country_id_countries) 
       references sv_game.countries 
       on delete restrict;

    alter table if exists sv_game.banks 
       add constraint FKc3eo422rdf1dmx32h9gsj3n9i 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.bets 
       add constraint FKmwmk5kpqo18s5eivjy1y2a2g1 
       foreign key (cockfight_id_cockfights) 
       references sv_game.cockfights 
       on delete restrict;

    alter table if exists sv_game.bets 
       add constraint FKmgc4gldko9471s6a46yrd4q33 
       foreign key (debt_id_debts) 
       references sv_game.debts 
       on delete cascade;

    alter table if exists sv_game.bets 
       add constraint FKqalc1cmkrs4ms5x6sdtieigdi 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.buildings 
       add constraint FK6ll35noytqm9m9p4mu77tkq3j 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.buildings 
       add constraint FKrspuqr0x2ikm7x0fmvk8yop5e 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.buildings 
       add constraint FKd2elcads83w6kq1yfqegen4yf 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.cities 
       add constraint FK7cf2lydp0qt74d04iwlvmxxpt 
       foreign key (state_id_states) 
       references sv_game.states 
       on delete cascade;

    alter table if exists sv_game.cockfights 
       add constraint FKqlq17pa8t1g7kqnm4r2txdrlw 
       foreign key (building_id_buildings) 
       references sv_game.buildings 
       on delete restrict;

    alter table if exists sv_game.cockfights 
       add constraint FKobfyo1i2fkht9mfnox83bxfom 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.cockfights 
       add constraint FK11gfxu9p38ija1rs705yo9a6y 
       foreign key (rooster_id_roosters) 
       references sv_game.roosters 
       on delete restrict;

    alter table if exists sv_game.cockfights 
       add constraint FK8dx625xuqx70ier5vphpfsifk 
       foreign key (rooster_id_roosters1) 
       references sv_game.roosters 
       on delete restrict;

    alter table if exists sv_game.companies 
       add constraint FKf8lqctukbufq6y5yfnb2o0sb1 
       foreign key (category_id_business_categories) 
       references sv_game.business_categories 
       on delete restrict;

    alter table if exists sv_game.companies 
       add constraint FKs63xtgd7stvh7cemu0iurkhva 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.companies 
       add constraint FKeuj8jtfhs3gy4yukrs1i7ul65 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.company_buildings 
       add constraint FK22y5dr2scnykbr9vv308dgqi2 
       foreign key (building_id_buildings) 
       references sv_game.buildings 
       on delete cascade;

    alter table if exists sv_game.company_buildings 
       add constraint FK13b0p1nd0c4g0o4wa7s2fo4x9 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete cascade;

    alter table if exists sv_game.company_financial_history 
       add constraint FKrce6cputcnj7lnw0ytw6dwfa9 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete cascade;

    alter table if exists sv_game.company_hqs 
       add constraint FKni4c39t7b7wgqhdjejb2vfj10 
       foreign key (building_id_buildings) 
       references sv_game.buildings 
       on delete set null;

    alter table if exists sv_game.company_hqs 
       add constraint FKcc0jfjqq0u3tosilyltd7upoq 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.countries 
       add constraint FK7tf3wkw44cu78c19dsdaoh0mb 
       foreign key (currency_id_currencies) 
       references sv_game.currencies 
       on delete restrict;

    alter table if exists sv_game.courses 
       add constraint FK976vogbjiefw4m97q946y5ltp 
       foreign key (institution_id_education_institutions) 
       references sv_game.education_institutions 
       on delete cascade;

    alter table if exists sv_game.courses 
       add constraint FKrd630g3rc3gmatet898ru74hg 
       foreign key (skill_id_skills) 
       references sv_game.skills 
       on delete restrict;

    alter table if exists sv_game.crypto_price_history 
       add constraint FKnw12acv2fmbw5rwgf9ehepjir 
       foreign key (crypto_id_cryptocurrencies) 
       references sv_game.cryptocurrencies 
       on delete cascade;

    alter table if exists sv_game.debt_collateral 
       add constraint FKk704y8qkd803plv4wtbdww0h5 
       foreign key (debt_id_debts) 
       references sv_game.debts 
       on delete cascade;

    alter table if exists sv_game.debts 
       add constraint FKcs88dspsf64utcuhhyemnyx11 
       foreign key (company_id_companies1) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKrthvkrkw4hxhn283xq75lxa5x 
       foreign key (player_id_players1) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKgfo6uvpv3bvysi11bl23p2hiq 
       foreign key (bank_id_banks1) 
       references sv_game.banks 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FK2uktynyetgrdsx83ubyt4qs29 
       foreign key (company_id_companies2) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKc65tcl210hwoghxdvo5g9my8m 
       foreign key (npc_id_npcs1) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FK2frdiq4ofdqmhwnu2vied6p9v 
       foreign key (player_id_players2) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKopljj9ssuoc30ry1a7mwq1kra 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.debts 
       add constraint FKqxtbljltmmksn95m4qjoev936 
       foreign key (bank_id_banks) 
       references sv_game.banks 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKd5c064dh0pa2wht549cb9sd8u 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FK12gou4btbw1bs6wfp7jiutdqx 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKb6rey8v4j2prnbl1nsiwloli5 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.exchange_rate_history 
       add constraint FKjx5bsqpdoigsamd3d7rtorofd 
       foreign key (currency_id_currencies) 
       references sv_game.currencies 
       on delete cascade;

    alter table if exists sv_game.garage_parking 
       add constraint FKtp8df3jelgglta093po3o44nn 
       foreign key (garage_id_garages) 
       references sv_game.garages 
       on delete cascade;

    alter table if exists sv_game.garage_parking 
       add constraint FKd3imjk7gr7jf9mis3gdrm438j 
       foreign key (vehicle_id_vehicles) 
       references sv_game.vehicles 
       on delete set null;

    alter table if exists sv_game.garages 
       add constraint FKdpljwwasu6nxisevhdt2alkp6 
       foreign key (building_id_buildings) 
       references sv_game.buildings 
       on delete restrict;

    alter table if exists sv_game.garages 
       add constraint FKbl3ic5nuwjylw8crmy9ydmk7v 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.jobs 
       add constraint FK1b5sy0anbsi2untb9lwjmefcj 
       foreign key (category_id_job_categories) 
       references sv_game.job_categories 
       on delete restrict;

    alter table if exists sv_game.jobs 
       add constraint FKtecafloh6bl6wtowcfmjwlckl 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.news_events 
       add constraint FK7h9th81fdohmdt8rs7pf3tu2r 
       foreign key (city_id_cities) 
       references sv_game.cities 
       on delete set null;

    alter table if exists sv_game.news_events 
       add constraint FKm56xkkxru1jivb7vhdy35e7x4 
       foreign key (country_id_countries) 
       references sv_game.countries 
       on delete set null;

    alter table if exists sv_game.news_events 
       add constraint FKjj6beencj0sqs3bn7y9tmabyq 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.nfts 
       add constraint FKtpukh60cc0h0eqs8vpi8nxo9s 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.nfts 
       add constraint FK1tqeke9ns7xa0mqs29ppssigb 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete cascade;

    alter table if exists sv_game.nfts 
       add constraint FK2mpuegmp460fd9qqoglb8q7vc 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.npc_stock_holdings 
       add constraint FKd5odir83mlchi5plscr7t8s19 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete cascade;

    alter table if exists sv_game.npc_stock_holdings 
       add constraint FKspi63pcny7jqwr4os93golkop 
       foreign key (stock_id_stocks) 
       references sv_game.stocks 
       on delete cascade;

    alter table if exists sv_game.npcs 
       add constraint FKob89bub3loftatblwp6hqyui4 
       foreign key (city_id_cities) 
       references sv_game.cities 
       on delete set null;

    alter table if exists sv_game.npcs 
       add constraint FKjkoydn7ifemb0brvb9o8p61lo 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.npcs 
       add constraint FKrnmw574r861xh4rxxfi8m14b3 
       foreign key (plot_id_plots) 
       references sv_game.plots 
       on delete set null;

    alter table if exists sv_game.player_attributes 
       add constraint FK1pns89q1q82l8mr7w7vuhfof1 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.player_bank_accounts 
       add constraint FK110v4ggqr56h57tag7lyux8w9 
       foreign key (bank_id_banks) 
       references sv_game.banks 
       on delete restrict;

    alter table if exists sv_game.player_bank_accounts 
       add constraint FKrhpqwwqmsfhusgetbdwuxere2 
       foreign key (currency_id_currencies) 
       references sv_game.currencies 
       on delete restrict;

    alter table if exists sv_game.player_bank_accounts 
       add constraint FKolper7hdyxikhd5eoxkv50h7e 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_career_progress 
       add constraint FKwbnqi0uaslfy2cnc9ow11nav 
       foreign key (path_id_career_paths) 
       references sv_game.career_paths 
       on delete set null;

    alter table if exists sv_game.player_career_progress 
       add constraint FKafqn3bknvum59gahu9225p54x 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_crypto_holdings 
       add constraint FKj1t8wbs2fo2rbhg27ou7p1l6q 
       foreign key (crypto_id_cryptocurrencies) 
       references sv_game.cryptocurrencies 
       on delete cascade;

    alter table if exists sv_game.player_crypto_holdings 
       add constraint FK9qvwu9r65htxk35s0tqkrpf4 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_currency_holdings 
       add constraint FKsr1urdyeby8djplio1204s20 
       foreign key (currency_id_currencies) 
       references sv_game.currencies 
       on delete cascade;

    alter table if exists sv_game.player_currency_holdings 
       add constraint FKw8pw51tibm4mbo9899pmr3fl 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_inventory 
       add constraint FKelb21uoil2s5g0n9qijm2q301 
       foreign key (item_id_items) 
       references sv_game.items 
       on delete restrict;

    alter table if exists sv_game.player_inventory 
       add constraint FKb166j4iorux4nh11xqnce6bvn 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_investments 
       add constraint FK4ndaalb0y85xw4amc5l5cic7i 
       foreign key (opportunity_id_investment_opportunities) 
       references sv_game.investment_opportunities 
       on delete restrict;

    alter table if exists sv_game.player_investments 
       add constraint FKt1sl52kbhbu107vj3vfpx3fxh 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_nft_holdings 
       add constraint FKlsuf0wnqhthndqwnslig9cqce 
       foreign key (nft_id_nfts) 
       references sv_game.nfts 
       on delete cascade;

    alter table if exists sv_game.player_nft_holdings 
       add constraint FK4sqd1orv42g0odi0dx6a0y6e4 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_npc_relationships 
       add constraint FKj1eec75g3eg4bolul2v3wxonr 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete cascade;

    alter table if exists sv_game.player_npc_relationships 
       add constraint FKi7vaw7tbd21wb25d1vd6gglp3 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_skills 
       add constraint FKhydbgbkdkll86f7dadbnns67p 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_skills 
       add constraint FK3v1ionoiwfqkqhpn78or43x4m 
       foreign key (skill_id_skills) 
       references sv_game.skills 
       on delete restrict;

    alter table if exists sv_game.player_status_effects 
       add constraint FKhs2w2fejcmmwpvd9h16fwqid5 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_stock_holdings 
       add constraint FK19vns04swoyp8vmclk4yfjuyr 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_stock_holdings 
       add constraint FKaioj2l1vrdiqalgfeujallpaa 
       foreign key (stock_id_stocks) 
       references sv_game.stocks 
       on delete cascade;

    alter table if exists sv_game.players 
       add constraint FK470a3pox856ynx6amiaxk7r2w 
       foreign key (city_id_cities) 
       references sv_game.cities 
       on delete restrict;

    alter table if exists sv_game.players 
       add constraint FKglekn1d8fmwrx3f4he2rrswdp 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.players 
       add constraint FKeo3cccb1rw2iai7ede56vk1e6 
       foreign key (job_id_jobs) 
       references sv_game.jobs 
       on delete set null;

    alter table if exists sv_game.players 
       add constraint FK8i0fmgdxpjlhjbsx3lm3tvefr 
       foreign key (plot_id_plots) 
       references sv_game.plots 
       on delete set null;

    alter table if exists sv_game.plots 
       add constraint FKtg1jw8x0cvje2x12qfq95a4w4 
       foreign key (building_id_buildings) 
       references sv_game.buildings 
       on delete set null;

    alter table if exists sv_game.plots 
       add constraint FKgq36msv8mstmgn41r41n5j7n4 
       foreign key (city_id_cities) 
       references sv_game.cities 
       on delete cascade;

    alter table if exists sv_game.plots 
       add constraint FKiip7oclybvedms00hp7odm2e4 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.plots 
       add constraint FKgs1p2fdahvh2arnw8b5i3rbjn 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.plots 
       add constraint FK4ic6ga8g4rr8oi2mx78oie4pb 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.products 
       add constraint FKgri9ydog2re8fd4mqoglhgxq3 
       foreign key (category_id_business_categories) 
       references sv_game.business_categories 
       on delete restrict;

    alter table if exists sv_game.products 
       add constraint FKo9d40w63d95ken7unvgl29777 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete cascade;

    alter table if exists sv_game.roosters 
       add constraint FKe1oo71xedprthp152yuh1ph5a 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.roosters 
       add constraint FK2r0quvhcf37cpjo61g20d888y 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.roosters 
       add constraint FKojlu0jctyx8lm6do0g0adh98w 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.roosters 
       add constraint FK7nwv4qeee2q66302evkg87vvq 
       foreign key (plot_id_plots) 
       references sv_game.plots 
       on delete set null;

    alter table if exists sv_game.states 
       add constraint FKsr3xajspbtb3ax0kv3awl0m36 
       foreign key (country_id_countries) 
       references sv_game.countries 
       on delete cascade;

    alter table if exists sv_game.stock_price_history 
       add constraint FKcktx49vdf2r4l97680q5n0r14 
       foreign key (stock_id_stocks) 
       references sv_game.stocks 
       on delete cascade;

    alter table if exists sv_game.stocks 
       add constraint FKld8wa553b25iqu9d85v30q3yo 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.stocks 
       add constraint FKmntcivtb5ydv9w935kececlnk 
       foreign key (market_id_stock_markets) 
       references sv_game.stock_markets 
       on delete restrict;

    alter table if exists sv_game.transactions 
       add constraint FKg9s9tn0iu7p6w5dpwnhhev7v5 
       foreign key (account_id_player_bank_accounts) 
       references sv_game.player_bank_accounts 
       on delete set null;

    alter table if exists sv_game.transactions 
       add constraint FK6sidjgxmloqpsceecsegxmbla 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete cascade;

    alter table if exists sv_game.transactions 
       add constraint FKc8hqlprwvvxj2l74pn0mmolxb 
       foreign key (currency_id_currencies) 
       references sv_game.currencies 
       on delete restrict;

    alter table if exists sv_game.transactions 
       add constraint FK5kxpgv6hdu17lvouy94gqgolg 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.vehicles 
       add constraint FKk06nrxm8sp2wjn2uaf80algvb 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.vehicles 
       add constraint FKl5f2o3u0e5plo4vfw3f4at1bd 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.vehicles 
       add constraint FKrak56p5u7ey4gude78exdqns9 
       foreign key (garage_id_garages) 
       references sv_game.garages 
       on delete set null;

    alter table if exists sv_game.vehicles 
       add constraint FKpdm8v9iqaj0enw5d13tn8takq 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.vehicles 
       add constraint FKb6glpoql8vkpdujp5255ft1la 
       foreign key (plot_id_plots) 
       references sv_game.plots 
       on delete set null;

    alter table if exists sv_game.vehicles 
       add constraint FK9ki55d9lcd53tbrn3p359knec 
       foreign key (vehicletype_id_vehicletypes) 
       references sv_game.vehicletypes 
       on delete restrict;

    alter table if exists sv_game.vehicletypes 
       add constraint FKc5oah51n6hensi8afvm3s0fiu 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists banks_current_owner_debts 
       add constraint FK37lmb9vcyljhpu09sy0xyqhsu 
       foreign key (current_owner_debts_debt_id) 
       references sv_game.debts;

    alter table if exists banks_current_owner_debts 
       add constraint FKcgmup11310ufo013lsr3rlftj 
       foreign key (bank_bank_id) 
       references sv_game.banks;

    alter table if exists banks_lender_debts 
       add constraint FK4k8vvsbl8qjnawfthmqrpyku1 
       foreign key (lender_debts_debt_id) 
       references sv_game.debts;

    alter table if exists banks_lender_debts 
       add constraint FKag301ygledx68bxsbq3xi7vlm 
       foreign key (bank_bank_id) 
       references sv_game.banks;

    alter table if exists companies_borrower_debts 
       add constraint FKel91o1cywtlg07ytv1xgmrrs0 
       foreign key (borrower_debts_debt_id) 
       references sv_game.debts;

    alter table if exists companies_borrower_debts 
       add constraint FKf6mx11foobfp2ojk9fcxrkx3f 
       foreign key (company_company_id) 
       references sv_game.companies;

    alter table if exists companies_current_owner_debts 
       add constraint FKawd0h3atl3r6f7iqg16r1fjw6 
       foreign key (current_owner_debts_debt_id) 
       references sv_game.debts;

    alter table if exists companies_current_owner_debts 
       add constraint FKk5bgw06sfwdjm02ah8b8na23p 
       foreign key (company_company_id) 
       references sv_game.companies;

    alter table if exists companies_lender_debts 
       add constraint FK2pmvyknp7jt61i82f8wx6lrwa 
       foreign key (lender_debts_debt_id) 
       references sv_game.debts;

    alter table if exists companies_lender_debts 
       add constraint FKtiyiqmp9hgjeke02wuhdb4uvo 
       foreign key (company_company_id) 
       references sv_game.companies;

    alter table if exists npcs_current_owner_debts 
       add constraint FKhbmkv3686p02vys523213c5xl 
       foreign key (current_owner_debts_debt_id) 
       references sv_game.debts;

    alter table if exists npcs_current_owner_debts 
       add constraint FK67vacw4x9b7xruhyv83w4n6tb 
       foreign key (npc_npc_id) 
       references sv_game.npcs;

    alter table if exists npcs_lender_debts 
       add constraint FK5fe23xglul0y1fx5d3s7i9yin 
       foreign key (lender_debts_debt_id) 
       references sv_game.debts;

    alter table if exists npcs_lender_debts 
       add constraint FKba84g1xkqkfwnxgsg2buh3hwd 
       foreign key (npc_npc_id) 
       references sv_game.npcs;

    alter table if exists players_borrower_debts 
       add constraint FKquopy2rg1uo2l1ae1n6ffiu0v 
       foreign key (borrower_debts_debt_id) 
       references sv_game.debts;

    alter table if exists players_borrower_debts 
       add constraint FK8ke87wbo8oqf4pxqmfovug2f2 
       foreign key (player_player_id) 
       references sv_game.players;

    alter table if exists players_current_owner_debts 
       add constraint FKn1h1o93c3r8f101mf53o6ylfy 
       foreign key (current_owner_debts_debt_id) 
       references sv_game.debts;

    alter table if exists players_current_owner_debts 
       add constraint FKdvljaamut8swalyq49qy53q0x 
       foreign key (player_player_id) 
       references sv_game.players;

    alter table if exists players_lender_debts 
       add constraint FKg5xjq5knal99mk24g7wog1dxc 
       foreign key (lender_debts_debt_id) 
       references sv_game.debts;

    alter table if exists players_lender_debts 
       add constraint FK9jb0i0t91w5eodrek9gx2gm58 
       foreign key (player_player_id) 
       references sv_game.players;

    create table sv_game.bank_account_transactions (
        amount numeric(32,2) not null,
        transaction_date timestamp(6) with time zone not null,
        account_id_player_bank_accounts uuid,
        bank_transaction_id uuid not null,
        transaction_type varchar(100) not null,
        description text not null,
        primary key (bank_transaction_id)
    );

    create table sv_game.banks (
        deposit_interest_rate numeric(5,4) default 0.00 not null,
        is_player_bank boolean default false not null,
        loan_interest_rate numeric(5,4) default 0.00 not null,
        monthly_account_fee numeric(10,2) default 0.00 not null,
        reputation integer default 500 not null,
        stability_index numeric(5,2) default 100.00 not null,
        transaction_fee_rate numeric(5,4) default 0.00 not null,
        bank_id uuid not null,
        country_id_countries uuid,
        player_id_players uuid,
        name varchar(255) not null,
        primary key (bank_id)
    );

    create table sv_game.bets (
        amount_bet numeric(16,2) not null,
        outcome_amount numeric(16,2) not null,
        bet_date timestamp(6) with time zone not null,
        bet_id uuid not null,
        cockfight_id_cockfights uuid,
        debt_id_debts uuid,
        player_id_players uuid,
        type varchar(100) not null,
        details jsonb not null,
        primary key (bet_id)
    );

    create table sv_game.buildings (
        capacity integer not null,
        condition_percentage integer default 100 not null,
        construction_cost numeric(32,2) not null,
        current_value numeric(32,2) not null,
        is_company_headquarters boolean default false not null,
        is_player_home boolean default false not null,
        maintenance_cost_per_month numeric(16,2) not null,
        rent_per_month numeric(5,2) not null,
        upgrade_level integer default 0 not null,
        building_id uuid not null,
        company_id_companies uuid,
        npc_id_npcs uuid,
        player_id_players uuid,
        building_type varchar(100) not null,
        customization_data jsonb not null,
        primary key (building_id)
    );

    create table sv_game.business_categories (
        category_id uuid not null,
        name varchar(255) not null,
        description text,
        primary key (category_id)
    );

    create table sv_game.career_paths (
        path_id uuid not null,
        related_attribute varchar(50) not null,
        name varchar(255) not null,
        description text not null,
        primary key (path_id)
    );

    create table sv_game.cities (
        cost_of_living_index numeric(5,2) not null,
        local_crime_rate numeric(5,2) not null,
        size_modifier numeric(5,2) not null,
        unemployment_rate numeric(5,2) not null,
        population bigint not null,
        city_id uuid not null,
        state_id_states uuid,
        city_type varchar(100) not null,
        name varchar(255) not null,
        procedural_seed varchar(255),
        generated_map_layout jsonb not null,
        map_config_data jsonb not null,
        primary key (city_id)
    );

    create table sv_game.cockfights (
        loser_died boolean,
        date_time timestamp(6) with time zone not null,
        building_id_buildings uuid,
        cockfight_id uuid not null,
        game_id_games uuid,
        rooster_id_roosters uuid,
        rooster_id_roosters1 uuid,
        outcome varchar(50),
        status varchar(50) default 'Scheduled' not null,
        primary key (cockfight_id)
    );

    create table sv_game.companies (
        cash_balance numeric(32,2) default 0.00 not null,
        founding_date date not null,
        growth_rate numeric(5,2) not null,
        is_publicly_traded boolean default false not null,
        market_share numeric(5,2) default 0.00 not null,
        marketing_level integer default 0 not null,
        net_worth numeric(32,2) not null,
        production_capacity integer not null,
        r_and_d_level integer default 0 not null,
        reputation integer default 500 not null,
        category_id_business_categories uuid,
        company_id uuid not null,
        npc_id_npcs uuid,
        player_id_players uuid,
        name varchar(255) not null,
        primary key (company_id)
    );

    create table sv_game.company_buildings (
        is_active boolean default true not null,
        building_id_buildings uuid,
        company_building_id uuid not null,
        company_id_companies uuid,
        role varchar(100) not null,
        primary key (company_building_id)
    );

    create table sv_game.company_financial_history (
        employees_count integer not null,
        expenses numeric(32,2) not null,
        net_worth_snapshot numeric(32,2) not null,
        profit numeric(32,2) not null,
        record_date date not null,
        revenue numeric(32,2) not null,
        company_id_companies uuid,
        record_id uuid not null,
        primary key (record_id)
    );

    create table sv_game.company_hqs (
        building_id_buildings uuid unique,
        company_hq_id uuid not null,
        company_id_companies uuid unique,
        primary key (company_hq_id)
    );

    create table sv_game.countries (
        base_tax_rate numeric(5,2) not null,
        business_tax_rate numeric(5,2) not null,
        corruption_level numeric(5,2) not null,
        crime_rate_modifier numeric(5,2) not null,
        growth_potential numeric(5,2) not null,
        import_export_duty numeric(5,2) not null,
        stability_index numeric(5,2) not null,
        country_id uuid not null,
        currency_id_currencies uuid,
        economic_system varchar(100) not null,
        law_system varchar(100) not null,
        name varchar(255) not null,
        primary key (country_id)
    );

    create table sv_game.courses (
        cost numeric(16,2) not null,
        duration_days integer not null,
        course_id uuid not null,
        institution_id_education_institutions uuid,
        skill_id_skills uuid,
        related_attribute varchar(50) not null,
        name varchar(255) not null,
        description text not null,
        primary key (course_id)
    );

    create table sv_game.crypto_price_history (
        price numeric(16,2) not null,
        record_time timestamp(6) with time zone not null,
        crypto_id_cryptocurrencies uuid,
        history_id uuid not null,
        primary key (history_id)
    );

    create table sv_game.cryptocurrencies (
        current_price numeric(16,2) not null,
        mining_difficulty numeric(16,2) not null,
        volatility numeric(5,2) not null,
        circulating_supply bigint not null,
        supply_limit bigint,
        symbol varchar(10) not null,
        crypto_id uuid not null,
        name varchar(255) not null,
        primary key (crypto_id)
    );

    create table sv_game.currencies (
        exchange_rate_to_base_currency numeric(16,2) not null,
        iso_code varchar(3) not null,
        volatility numeric(5,2) not null,
        symbol varchar(10) not null,
        currency_id uuid not null,
        name varchar(255) not null,
        primary key (currency_id)
    );

    create table sv_game.debt_collateral (
        collateral_value_at_loan_time numeric(32,2) not null,
        is_currently_held boolean not null,
        collateral_entity_id uuid not null,
        debt_collateral_id uuid not null,
        debt_id_debts uuid,
        collateral_type varchar(50) not null,
        primary key (debt_collateral_id)
    );

    create table sv_game.debts (
        current_debt numeric(32,2),
        interest_rate numeric(5,4) not null,
        minimum_next_payment_amount numeric(32,2),
        original_value numeric(32,2) not null,
        end_date timestamp(6) with time zone not null,
        next_payment_date timestamp(6) with time zone,
        start_date timestamp(6) with time zone not null,
        bank_id_banks uuid,
        bank_id_banks1 uuid,
        company_id_companies uuid,
        company_id_companies1 uuid,
        company_id_companies2 uuid,
        debt_id uuid not null,
        game_id_games uuid,
        npc_id_npcs uuid,
        npc_id_npcs1 uuid,
        player_id_players uuid,
        player_id_players1 uuid,
        player_id_players2 uuid,
        debt_type varchar(50) default 'Loan' not null,
        payment_frequency varchar(50) not null,
        status varchar(50) default 'Active' not null,
        primary key (debt_id)
    );

    create table sv_game.education_institutions (
        institution_id uuid not null,
        type varchar(100) not null,
        name varchar(255) not null,
        primary key (institution_id)
    );

    create table sv_game.exchange_rate_history (
        exchange_rate numeric(16,4) not null,
        record_time timestamp(6) with time zone not null,
        currency_id_currencies uuid,
        history_id uuid not null,
        primary key (history_id)
    );

    create table sv_game.games (
        game_speed_multiplier numeric(3,1) default 1.0 not null,
        current_date_time timestamp(6) with time zone,
        last_save_time timestamp(6) with time zone,
        game_id uuid not null,
        game_name varchar(255) not null,
        primary key (game_id)
    );

    create table sv_game.garage_parking (
        garage_id_garages uuid,
        garage_parking_id uuid not null,
        vehicle_id_vehicles uuid unique,
        parking_spot_number varchar(50),
        primary key (garage_parking_id)
    );

    create table sv_game.garages (
        available_slots integer not null,
        total_slots integer not null,
        building_id_buildings uuid unique,
        game_id_games uuid,
        garage_id uuid not null,
        slot_size_type varchar(50) not null,
        primary key (garage_id)
    );

    create table sv_game.investment_opportunities (
        duration_days integer not null,
        end_date date not null,
        expected_return_max numeric(5,2) not null,
        expected_return_min numeric(5,2) not null,
        is_active boolean default true not null,
        max_investment numeric(32,2) not null,
        min_investment numeric(32,2) not null,
        risk_level numeric(5,2) not null,
        start_date date not null,
        opportunity_id uuid not null,
        name varchar(255) not null,
        description text not null,
        primary key (opportunity_id)
    );

    create table sv_game.items (
        value numeric(16,2) not null,
        item_id uuid not null,
        type varchar(100) not null,
        name varchar(255) not null,
        description text not null,
        effect_data jsonb not null,
        primary key (item_id)
    );

    create table sv_game.job_categories (
        category_id uuid not null,
        name varchar(255) not null,
        primary key (category_id)
    );

    create table sv_game.jobs (
        base_salary_per_day numeric(16,2) not null,
        is_available boolean default true not null,
        required_charisma integer not null,
        required_education_score integer not null,
        required_intelligence integer not null,
        required_strength integer not null,
        xp_per_day integer not null,
        category_id_job_categories uuid,
        company_id_companies uuid,
        job_id uuid not null,
        required_education_level varchar(100) not null,
        title varchar(255) not null,
        primary key (job_id)
    );

    create table sv_game.news_events (
        is_global boolean default false not null,
        event_date timestamp(6) with time zone not null,
        city_id_cities uuid,
        country_id_countries uuid,
        event_id uuid not null,
        game_id_games uuid,
        event_type varchar(100) not null,
        title varchar(255) not null,
        description text not null,
        impact_data jsonb not null,
        primary key (event_id)
    );

    create table sv_game.nfts (
        current_value numeric(32,2) not null,
        initial_value numeric(32,2) not null,
        creation_date timestamp(6) with time zone not null,
        game_id_games uuid,
        nft_id uuid not null,
        npc_id_npcs uuid,
        player_id_players uuid,
        contract_address varchar(255),
        image_path varchar(255),
        name varchar(255) not null,
        token_id varchar(255),
        description text,
        generation_params jsonb,
        primary key (nft_id)
    );

    create table sv_game.npc_stock_holdings (
        average_purchase_price numeric(16,2) not null,
        last_updated_time timestamp(6) with time zone not null,
        shares_owned bigint not null,
        holding_id uuid not null,
        npc_id_npcs uuid,
        stock_id_stocks uuid,
        primary key (holding_id)
    );

    create table sv_game.npcs (
        charisma integer not null,
        intelligence integer not null,
        is_essential boolean default false not null,
        karma integer default 500 not null,
        luck integer not null,
        strength integer not null,
        city_id_cities uuid,
        game_id_games uuid,
        npc_id uuid not null,
        plot_id_plots uuid,
        financial_status varchar(50) not null,
        gender varchar(50) not null,
        status varchar(50) default 'Available' not null,
        occupation varchar(100),
        job_title varchar(255),
        name varchar(255) not null,
        appearance_data jsonb,
        notes text,
        personality_traits jsonb,
        primary key (npc_id)
    );

    create table sv_game.player_attributes (
        charisma integer default 1 not null,
        intelligence integer default 1 not null,
        luck integer default 1 not null,
        strength integer default 1 not null,
        last_updated_time timestamp(6) with time zone not null,
        attribute_id uuid not null,
        player_id_players uuid unique,
        primary key (attribute_id)
    );

    create table sv_game.player_bank_accounts (
        balance numeric(32,2) default 0.00 not null,
        is_primary boolean default false not null,
        created_date timestamp(6) with time zone not null,
        last_activity_date timestamp(6) with time zone not null,
        account_id uuid not null,
        bank_id_banks uuid,
        currency_id_currencies uuid,
        player_id_players uuid,
        account_number varchar(50) not null,
        account_type varchar(50) not null,
        primary key (account_id)
    );

    create table sv_game.player_career_progress (
        level integer default 1 not null,
        xp_in_path integer default 0 not null,
        last_level_up_date timestamp(6) with time zone not null,
        path_id_career_paths uuid,
        player_id_players uuid,
        progress_id uuid not null,
        primary key (progress_id)
    );

    create table sv_game.player_crypto_holdings (
        amount numeric(24,8) not null,
        average_purchase_price numeric(16,2) not null,
        last_updated_time timestamp(6) with time zone not null,
        crypto_id_cryptocurrencies uuid,
        holding_id uuid not null,
        player_id_players uuid,
        primary key (holding_id)
    );

    create table sv_game.player_currency_holdings (
        amount numeric(32,2) default 0.00 not null,
        last_updated_time timestamp(6) with time zone not null,
        currency_id_currencies uuid,
        holding_id uuid not null,
        player_id_players uuid,
        primary key (holding_id)
    );

    create table sv_game.player_inventory (
        equipped boolean default false not null,
        quantity integer default 1 not null,
        inventory_id uuid not null,
        item_id_items uuid,
        player_id_players uuid,
        primary key (inventory_id)
    );

    create table sv_game.player_investments (
        actual_return_amount numeric(32,2) not null,
        amount_invested numeric(32,2) not null,
        expected_return_amount numeric(32,2) not null,
        completion_date timestamp(6) with time zone not null,
        investment_date timestamp(6) with time zone not null,
        opportunity_id_investment_opportunities uuid,
        player_id_players uuid,
        player_investment_id uuid not null,
        status varchar(50) not null,
        primary key (player_investment_id)
    );

    create table sv_game.player_nft_holdings (
        acquisition_price numeric(32,2) not null,
        is_listed_for_sale boolean default false not null,
        listing_price numeric(32,2),
        acquisition_date timestamp(6) with time zone not null,
        holding_id uuid not null,
        nft_id_nfts uuid unique,
        player_id_players uuid,
        primary key (holding_id)
    );

    create table sv_game.player_npc_relationships (
        level integer default 0 not null,
        last_interaction_date timestamp(6) with time zone,
        npc_id_npcs uuid,
        player_id_players uuid,
        relationship_id uuid not null,
        relationship_type varchar(50) default 'Neutral' not null,
        primary key (relationship_id)
    );

    create table sv_game.player_skills (
        level integer default 0 not null,
        xp integer default 0 not null,
        last_updated_time timestamp(6) with time zone not null,
        player_id_players uuid,
        player_skill_id uuid not null,
        skill_id_skills uuid,
        primary key (player_skill_id)
    );

    create table sv_game.player_status_effects (
        end_time timestamp(6) with time zone,
        start_time timestamp(6) with time zone not null,
        effect_id uuid not null,
        player_id_players uuid,
        type varchar(100) not null,
        modifier_data jsonb not null,
        primary key (effect_id)
    );

    create table sv_game.player_stock_holdings (
        average_purchase_price numeric(16,2) not null,
        last_updated_time timestamp(6) with time zone not null,
        shares_owned bigint not null,
        holding_id uuid not null,
        player_id_players uuid,
        stock_id_stocks uuid,
        primary key (holding_id)
    );

    create table sv_game.players (
        age integer not null,
        cash_balance numeric(64,2) default 0.00 not null,
        date_of_birth date not null,
        education_score integer default 0 not null,
        energy integer default 100 not null,
        experience_points integer default 0 not null,
        happiness integer default 100 not null,
        health integer default 100 not null,
        karma integer default 500 not null,
        city_id_cities uuid,
        game_id_games uuid,
        job_id_jobs uuid,
        player_id uuid not null,
        plot_id_plots uuid,
        gender varchar(50) not null,
        education_level varchar(100) default 'None' not null,
        name varchar(255) not null,
        appearance_data jsonb not null,
        primary key (player_id)
    );

    create table sv_game.plots (
        current_value numeric(32,2) not null,
        is_available_for_sale boolean default true not null,
        is_empty boolean default true not null,
        purchase_price numeric(32,2) not null,
        last_update_time timestamp(6) with time zone not null,
        building_id_buildings uuid unique,
        city_id_cities uuid,
        company_id_companies uuid,
        npc_id_npcs uuid,
        player_id_players uuid,
        plot_id uuid not null,
        zoning_type varchar(50) default 'Not Zoned' not null,
        primary key (plot_id)
    );

    create table sv_game.products (
        base_production_cost numeric(16,2) not null,
        current_market_price numeric(16,2) not null,
        demand numeric(5,2) not null,
        production_rate_per_day numeric(16,2) not null,
        quality integer default 50 not null,
        supply numeric(5,2) not null,
        category_id_business_categories uuid,
        company_id_companies uuid,
        product_id uuid not null,
        name varchar(255) not null,
        primary key (product_id)
    );

    create table sv_game.roosters (
        age_days integer not null,
        aggression integer not null,
        draw_count integer default 0 not null,
        health integer default 100 not null,
        is_deceased boolean default false not null,
        kill_count integer default 0 not null,
        loss_count integer default 0 not null,
        speed integer not null,
        strength integer not null,
        win_count integer default 0 not null,
        game_id_games uuid,
        npc_id_npcs uuid,
        player_id_players uuid,
        plot_id_plots uuid,
        rooster_id uuid not null,
        status varchar(50) default 'Available' not null,
        name varchar(255) not null,
        primary key (rooster_id)
    );

    create table sv_game.skills (
        skill_id uuid not null,
        related_attribute varchar(50) not null,
        name varchar(255) not null,
        description text not null,
        primary key (skill_id)
    );

    create table sv_game.states (
        additional_regional_tax_rate numeric(5,2) default 0.00 not null,
        country_id_countries uuid,
        state_id uuid not null,
        name varchar(255) not null,
        environmental_regulations_data jsonb not null,
        zoning_regulations_data jsonb not null,
        primary key (state_id)
    );

    create table sv_game.stock_markets (
        closing_time time(6) not null,
        opening_time time(6) not null,
        market_id uuid not null,
        name varchar(255) not null,
        primary key (market_id)
    );

    create table sv_game.stock_price_history (
        price numeric(16,2) not null,
        record_time timestamp(6) with time zone not null,
        volume bigint not null,
        history_id uuid not null,
        stock_id_stocks uuid,
        primary key (history_id)
    );

    create table sv_game.stocks (
        current_price numeric(16,2) not null,
        volatility numeric(5,2) not null,
        last_trade_time timestamp(6) with time zone not null,
        shares_outstanding bigint not null,
        ticker_symbol varchar(10) not null,
        company_id_companies uuid unique,
        market_id_stock_markets uuid,
        stock_id uuid not null,
        primary key (stock_id)
    );

    create table sv_game.transactions (
        amount numeric(32,2) not null,
        transaction_date timestamp(6) with time zone not null,
        account_id_player_bank_accounts uuid,
        company_id_companies uuid,
        currency_id_currencies uuid,
        player_id_players uuid,
        related_entity_id uuid,
        transaction_id uuid not null,
        type varchar(100) not null,
        related_entity_type varchar(255),
        description text not null,
        primary key (transaction_id)
    );

    create table sv_game.vehicles (
        condition_percentage integer default 100 not null,
        current_value numeric(32,2) not null,
        mileage integer default 0 not null,
        purchase_price numeric(32,2) not null,
        company_id_companies uuid,
        game_id_games uuid,
        garage_id_garages uuid,
        player_id_players uuid,
        plot_id_plots uuid,
        vehicle_id uuid not null,
        vehicletype_id_vehicletypes uuid,
        status varchar(50) default 'Parked' not null,
        primary key (vehicle_id)
    );

    create table sv_game.vehicletypes (
        base_price numeric(32,2) not null,
        cargo_capacity integer default 0 not null,
        passenger_capacity integer default 1 not null,
        speed_modifier numeric(5,2) default 1.0 not null,
        work_efficiency_modifier numeric(5,2) default 0.0 not null,
        game_id_games uuid,
        vehicletype_id uuid not null,
        garage_size_needed varchar(50) default 'Small' not null,
        type varchar(50) not null,
        maker varchar(255) not null,
        name varchar(255) not null,
        primary key (vehicletype_id)
    );

    create table banks_current_owner_debts (
        bank_bank_id uuid not null,
        current_owner_debts_debt_id uuid not null unique,
        primary key (bank_bank_id, current_owner_debts_debt_id)
    );

    create table banks_lender_debts (
        bank_bank_id uuid not null,
        lender_debts_debt_id uuid not null unique,
        primary key (bank_bank_id, lender_debts_debt_id)
    );

    create table companies_borrower_debts (
        borrower_debts_debt_id uuid not null unique,
        company_company_id uuid not null,
        primary key (borrower_debts_debt_id, company_company_id)
    );

    create table companies_current_owner_debts (
        company_company_id uuid not null,
        current_owner_debts_debt_id uuid not null unique,
        primary key (company_company_id, current_owner_debts_debt_id)
    );

    create table companies_lender_debts (
        company_company_id uuid not null,
        lender_debts_debt_id uuid not null unique,
        primary key (company_company_id, lender_debts_debt_id)
    );

    create table npcs_current_owner_debts (
        current_owner_debts_debt_id uuid not null unique,
        npc_npc_id uuid not null,
        primary key (current_owner_debts_debt_id, npc_npc_id)
    );

    create table npcs_lender_debts (
        lender_debts_debt_id uuid not null unique,
        npc_npc_id uuid not null,
        primary key (lender_debts_debt_id, npc_npc_id)
    );

    create table players_borrower_debts (
        borrower_debts_debt_id uuid not null unique,
        player_player_id uuid not null,
        primary key (borrower_debts_debt_id, player_player_id)
    );

    create table players_current_owner_debts (
        current_owner_debts_debt_id uuid not null unique,
        player_player_id uuid not null,
        primary key (current_owner_debts_debt_id, player_player_id)
    );

    create table players_lender_debts (
        lender_debts_debt_id uuid not null unique,
        player_player_id uuid not null,
        primary key (lender_debts_debt_id, player_player_id)
    );

    alter table if exists sv_game.bank_account_transactions 
       add constraint FKjb01eotg0k9dmgrwbf5iy0jp5 
       foreign key (account_id_player_bank_accounts) 
       references sv_game.player_bank_accounts 
       on delete cascade;

    alter table if exists sv_game.banks 
       add constraint FK3c1y8dbh15dbkyke4o37mlqcv 
       foreign key (country_id_countries) 
       references sv_game.countries 
       on delete restrict;

    alter table if exists sv_game.banks 
       add constraint FKc3eo422rdf1dmx32h9gsj3n9i 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.bets 
       add constraint FKmwmk5kpqo18s5eivjy1y2a2g1 
       foreign key (cockfight_id_cockfights) 
       references sv_game.cockfights 
       on delete restrict;

    alter table if exists sv_game.bets 
       add constraint FKmgc4gldko9471s6a46yrd4q33 
       foreign key (debt_id_debts) 
       references sv_game.debts 
       on delete cascade;

    alter table if exists sv_game.bets 
       add constraint FKqalc1cmkrs4ms5x6sdtieigdi 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.buildings 
       add constraint FK6ll35noytqm9m9p4mu77tkq3j 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.buildings 
       add constraint FKrspuqr0x2ikm7x0fmvk8yop5e 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.buildings 
       add constraint FKd2elcads83w6kq1yfqegen4yf 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.cities 
       add constraint FK7cf2lydp0qt74d04iwlvmxxpt 
       foreign key (state_id_states) 
       references sv_game.states 
       on delete cascade;

    alter table if exists sv_game.cockfights 
       add constraint FKqlq17pa8t1g7kqnm4r2txdrlw 
       foreign key (building_id_buildings) 
       references sv_game.buildings 
       on delete restrict;

    alter table if exists sv_game.cockfights 
       add constraint FKobfyo1i2fkht9mfnox83bxfom 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.cockfights 
       add constraint FK11gfxu9p38ija1rs705yo9a6y 
       foreign key (rooster_id_roosters) 
       references sv_game.roosters 
       on delete restrict;

    alter table if exists sv_game.cockfights 
       add constraint FK8dx625xuqx70ier5vphpfsifk 
       foreign key (rooster_id_roosters1) 
       references sv_game.roosters 
       on delete restrict;

    alter table if exists sv_game.companies 
       add constraint FKf8lqctukbufq6y5yfnb2o0sb1 
       foreign key (category_id_business_categories) 
       references sv_game.business_categories 
       on delete restrict;

    alter table if exists sv_game.companies 
       add constraint FKs63xtgd7stvh7cemu0iurkhva 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.companies 
       add constraint FKeuj8jtfhs3gy4yukrs1i7ul65 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.company_buildings 
       add constraint FK22y5dr2scnykbr9vv308dgqi2 
       foreign key (building_id_buildings) 
       references sv_game.buildings 
       on delete cascade;

    alter table if exists sv_game.company_buildings 
       add constraint FK13b0p1nd0c4g0o4wa7s2fo4x9 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete cascade;

    alter table if exists sv_game.company_financial_history 
       add constraint FKrce6cputcnj7lnw0ytw6dwfa9 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete cascade;

    alter table if exists sv_game.company_hqs 
       add constraint FKni4c39t7b7wgqhdjejb2vfj10 
       foreign key (building_id_buildings) 
       references sv_game.buildings 
       on delete set null;

    alter table if exists sv_game.company_hqs 
       add constraint FKcc0jfjqq0u3tosilyltd7upoq 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.countries 
       add constraint FK7tf3wkw44cu78c19dsdaoh0mb 
       foreign key (currency_id_currencies) 
       references sv_game.currencies 
       on delete restrict;

    alter table if exists sv_game.courses 
       add constraint FK976vogbjiefw4m97q946y5ltp 
       foreign key (institution_id_education_institutions) 
       references sv_game.education_institutions 
       on delete cascade;

    alter table if exists sv_game.courses 
       add constraint FKrd630g3rc3gmatet898ru74hg 
       foreign key (skill_id_skills) 
       references sv_game.skills 
       on delete restrict;

    alter table if exists sv_game.crypto_price_history 
       add constraint FKnw12acv2fmbw5rwgf9ehepjir 
       foreign key (crypto_id_cryptocurrencies) 
       references sv_game.cryptocurrencies 
       on delete cascade;

    alter table if exists sv_game.debt_collateral 
       add constraint FKk704y8qkd803plv4wtbdww0h5 
       foreign key (debt_id_debts) 
       references sv_game.debts 
       on delete cascade;

    alter table if exists sv_game.debts 
       add constraint FKcs88dspsf64utcuhhyemnyx11 
       foreign key (company_id_companies1) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKrthvkrkw4hxhn283xq75lxa5x 
       foreign key (player_id_players1) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKgfo6uvpv3bvysi11bl23p2hiq 
       foreign key (bank_id_banks1) 
       references sv_game.banks 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FK2uktynyetgrdsx83ubyt4qs29 
       foreign key (company_id_companies2) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKc65tcl210hwoghxdvo5g9my8m 
       foreign key (npc_id_npcs1) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FK2frdiq4ofdqmhwnu2vied6p9v 
       foreign key (player_id_players2) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKopljj9ssuoc30ry1a7mwq1kra 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.debts 
       add constraint FKqxtbljltmmksn95m4qjoev936 
       foreign key (bank_id_banks) 
       references sv_game.banks 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKd5c064dh0pa2wht549cb9sd8u 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FK12gou4btbw1bs6wfp7jiutdqx 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKb6rey8v4j2prnbl1nsiwloli5 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.exchange_rate_history 
       add constraint FKjx5bsqpdoigsamd3d7rtorofd 
       foreign key (currency_id_currencies) 
       references sv_game.currencies 
       on delete cascade;

    alter table if exists sv_game.garage_parking 
       add constraint FKtp8df3jelgglta093po3o44nn 
       foreign key (garage_id_garages) 
       references sv_game.garages 
       on delete cascade;

    alter table if exists sv_game.garage_parking 
       add constraint FKd3imjk7gr7jf9mis3gdrm438j 
       foreign key (vehicle_id_vehicles) 
       references sv_game.vehicles 
       on delete set null;

    alter table if exists sv_game.garages 
       add constraint FKdpljwwasu6nxisevhdt2alkp6 
       foreign key (building_id_buildings) 
       references sv_game.buildings 
       on delete restrict;

    alter table if exists sv_game.garages 
       add constraint FKbl3ic5nuwjylw8crmy9ydmk7v 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.jobs 
       add constraint FK1b5sy0anbsi2untb9lwjmefcj 
       foreign key (category_id_job_categories) 
       references sv_game.job_categories 
       on delete restrict;

    alter table if exists sv_game.jobs 
       add constraint FKtecafloh6bl6wtowcfmjwlckl 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.news_events 
       add constraint FK7h9th81fdohmdt8rs7pf3tu2r 
       foreign key (city_id_cities) 
       references sv_game.cities 
       on delete set null;

    alter table if exists sv_game.news_events 
       add constraint FKm56xkkxru1jivb7vhdy35e7x4 
       foreign key (country_id_countries) 
       references sv_game.countries 
       on delete set null;

    alter table if exists sv_game.news_events 
       add constraint FKjj6beencj0sqs3bn7y9tmabyq 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.nfts 
       add constraint FKtpukh60cc0h0eqs8vpi8nxo9s 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.nfts 
       add constraint FK1tqeke9ns7xa0mqs29ppssigb 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete cascade;

    alter table if exists sv_game.nfts 
       add constraint FK2mpuegmp460fd9qqoglb8q7vc 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.npc_stock_holdings 
       add constraint FKd5odir83mlchi5plscr7t8s19 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete cascade;

    alter table if exists sv_game.npc_stock_holdings 
       add constraint FKspi63pcny7jqwr4os93golkop 
       foreign key (stock_id_stocks) 
       references sv_game.stocks 
       on delete cascade;

    alter table if exists sv_game.npcs 
       add constraint FKob89bub3loftatblwp6hqyui4 
       foreign key (city_id_cities) 
       references sv_game.cities 
       on delete set null;

    alter table if exists sv_game.npcs 
       add constraint FKjkoydn7ifemb0brvb9o8p61lo 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.npcs 
       add constraint FKrnmw574r861xh4rxxfi8m14b3 
       foreign key (plot_id_plots) 
       references sv_game.plots 
       on delete set null;

    alter table if exists sv_game.player_attributes 
       add constraint FK1pns89q1q82l8mr7w7vuhfof1 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.player_bank_accounts 
       add constraint FK110v4ggqr56h57tag7lyux8w9 
       foreign key (bank_id_banks) 
       references sv_game.banks 
       on delete restrict;

    alter table if exists sv_game.player_bank_accounts 
       add constraint FKrhpqwwqmsfhusgetbdwuxere2 
       foreign key (currency_id_currencies) 
       references sv_game.currencies 
       on delete restrict;

    alter table if exists sv_game.player_bank_accounts 
       add constraint FKolper7hdyxikhd5eoxkv50h7e 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_career_progress 
       add constraint FKwbnqi0uaslfy2cnc9ow11nav 
       foreign key (path_id_career_paths) 
       references sv_game.career_paths 
       on delete set null;

    alter table if exists sv_game.player_career_progress 
       add constraint FKafqn3bknvum59gahu9225p54x 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_crypto_holdings 
       add constraint FKj1t8wbs2fo2rbhg27ou7p1l6q 
       foreign key (crypto_id_cryptocurrencies) 
       references sv_game.cryptocurrencies 
       on delete cascade;

    alter table if exists sv_game.player_crypto_holdings 
       add constraint FK9qvwu9r65htxk35s0tqkrpf4 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_currency_holdings 
       add constraint FKsr1urdyeby8djplio1204s20 
       foreign key (currency_id_currencies) 
       references sv_game.currencies 
       on delete cascade;

    alter table if exists sv_game.player_currency_holdings 
       add constraint FKw8pw51tibm4mbo9899pmr3fl 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_inventory 
       add constraint FKelb21uoil2s5g0n9qijm2q301 
       foreign key (item_id_items) 
       references sv_game.items 
       on delete restrict;

    alter table if exists sv_game.player_inventory 
       add constraint FKb166j4iorux4nh11xqnce6bvn 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_investments 
       add constraint FK4ndaalb0y85xw4amc5l5cic7i 
       foreign key (opportunity_id_investment_opportunities) 
       references sv_game.investment_opportunities 
       on delete restrict;

    alter table if exists sv_game.player_investments 
       add constraint FKt1sl52kbhbu107vj3vfpx3fxh 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_nft_holdings 
       add constraint FKlsuf0wnqhthndqwnslig9cqce 
       foreign key (nft_id_nfts) 
       references sv_game.nfts 
       on delete cascade;

    alter table if exists sv_game.player_nft_holdings 
       add constraint FK4sqd1orv42g0odi0dx6a0y6e4 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_npc_relationships 
       add constraint FKj1eec75g3eg4bolul2v3wxonr 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete cascade;

    alter table if exists sv_game.player_npc_relationships 
       add constraint FKi7vaw7tbd21wb25d1vd6gglp3 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_skills 
       add constraint FKhydbgbkdkll86f7dadbnns67p 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_skills 
       add constraint FK3v1ionoiwfqkqhpn78or43x4m 
       foreign key (skill_id_skills) 
       references sv_game.skills 
       on delete restrict;

    alter table if exists sv_game.player_status_effects 
       add constraint FKhs2w2fejcmmwpvd9h16fwqid5 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_stock_holdings 
       add constraint FK19vns04swoyp8vmclk4yfjuyr 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_stock_holdings 
       add constraint FKaioj2l1vrdiqalgfeujallpaa 
       foreign key (stock_id_stocks) 
       references sv_game.stocks 
       on delete cascade;

    alter table if exists sv_game.players 
       add constraint FK470a3pox856ynx6amiaxk7r2w 
       foreign key (city_id_cities) 
       references sv_game.cities 
       on delete restrict;

    alter table if exists sv_game.players 
       add constraint FKglekn1d8fmwrx3f4he2rrswdp 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.players 
       add constraint FKeo3cccb1rw2iai7ede56vk1e6 
       foreign key (job_id_jobs) 
       references sv_game.jobs 
       on delete set null;

    alter table if exists sv_game.players 
       add constraint FK8i0fmgdxpjlhjbsx3lm3tvefr 
       foreign key (plot_id_plots) 
       references sv_game.plots 
       on delete set null;

    alter table if exists sv_game.plots 
       add constraint FKtg1jw8x0cvje2x12qfq95a4w4 
       foreign key (building_id_buildings) 
       references sv_game.buildings 
       on delete set null;

    alter table if exists sv_game.plots 
       add constraint FKgq36msv8mstmgn41r41n5j7n4 
       foreign key (city_id_cities) 
       references sv_game.cities 
       on delete cascade;

    alter table if exists sv_game.plots 
       add constraint FKiip7oclybvedms00hp7odm2e4 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.plots 
       add constraint FKgs1p2fdahvh2arnw8b5i3rbjn 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.plots 
       add constraint FK4ic6ga8g4rr8oi2mx78oie4pb 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.products 
       add constraint FKgri9ydog2re8fd4mqoglhgxq3 
       foreign key (category_id_business_categories) 
       references sv_game.business_categories 
       on delete restrict;

    alter table if exists sv_game.products 
       add constraint FKo9d40w63d95ken7unvgl29777 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete cascade;

    alter table if exists sv_game.roosters 
       add constraint FKe1oo71xedprthp152yuh1ph5a 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.roosters 
       add constraint FK2r0quvhcf37cpjo61g20d888y 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.roosters 
       add constraint FKojlu0jctyx8lm6do0g0adh98w 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.roosters 
       add constraint FK7nwv4qeee2q66302evkg87vvq 
       foreign key (plot_id_plots) 
       references sv_game.plots 
       on delete set null;

    alter table if exists sv_game.states 
       add constraint FKsr3xajspbtb3ax0kv3awl0m36 
       foreign key (country_id_countries) 
       references sv_game.countries 
       on delete cascade;

    alter table if exists sv_game.stock_price_history 
       add constraint FKcktx49vdf2r4l97680q5n0r14 
       foreign key (stock_id_stocks) 
       references sv_game.stocks 
       on delete cascade;

    alter table if exists sv_game.stocks 
       add constraint FKld8wa553b25iqu9d85v30q3yo 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.stocks 
       add constraint FKmntcivtb5ydv9w935kececlnk 
       foreign key (market_id_stock_markets) 
       references sv_game.stock_markets 
       on delete restrict;

    alter table if exists sv_game.transactions 
       add constraint FKg9s9tn0iu7p6w5dpwnhhev7v5 
       foreign key (account_id_player_bank_accounts) 
       references sv_game.player_bank_accounts 
       on delete set null;

    alter table if exists sv_game.transactions 
       add constraint FK6sidjgxmloqpsceecsegxmbla 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete cascade;

    alter table if exists sv_game.transactions 
       add constraint FKc8hqlprwvvxj2l74pn0mmolxb 
       foreign key (currency_id_currencies) 
       references sv_game.currencies 
       on delete restrict;

    alter table if exists sv_game.transactions 
       add constraint FK5kxpgv6hdu17lvouy94gqgolg 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.vehicles 
       add constraint FKk06nrxm8sp2wjn2uaf80algvb 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.vehicles 
       add constraint FKl5f2o3u0e5plo4vfw3f4at1bd 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.vehicles 
       add constraint FKrak56p5u7ey4gude78exdqns9 
       foreign key (garage_id_garages) 
       references sv_game.garages 
       on delete set null;

    alter table if exists sv_game.vehicles 
       add constraint FKpdm8v9iqaj0enw5d13tn8takq 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.vehicles 
       add constraint FKb6glpoql8vkpdujp5255ft1la 
       foreign key (plot_id_plots) 
       references sv_game.plots 
       on delete set null;

    alter table if exists sv_game.vehicles 
       add constraint FK9ki55d9lcd53tbrn3p359knec 
       foreign key (vehicletype_id_vehicletypes) 
       references sv_game.vehicletypes 
       on delete restrict;

    alter table if exists sv_game.vehicletypes 
       add constraint FKc5oah51n6hensi8afvm3s0fiu 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists banks_current_owner_debts 
       add constraint FK37lmb9vcyljhpu09sy0xyqhsu 
       foreign key (current_owner_debts_debt_id) 
       references sv_game.debts;

    alter table if exists banks_current_owner_debts 
       add constraint FKcgmup11310ufo013lsr3rlftj 
       foreign key (bank_bank_id) 
       references sv_game.banks;

    alter table if exists banks_lender_debts 
       add constraint FK4k8vvsbl8qjnawfthmqrpyku1 
       foreign key (lender_debts_debt_id) 
       references sv_game.debts;

    alter table if exists banks_lender_debts 
       add constraint FKag301ygledx68bxsbq3xi7vlm 
       foreign key (bank_bank_id) 
       references sv_game.banks;

    alter table if exists companies_borrower_debts 
       add constraint FKel91o1cywtlg07ytv1xgmrrs0 
       foreign key (borrower_debts_debt_id) 
       references sv_game.debts;

    alter table if exists companies_borrower_debts 
       add constraint FKf6mx11foobfp2ojk9fcxrkx3f 
       foreign key (company_company_id) 
       references sv_game.companies;

    alter table if exists companies_current_owner_debts 
       add constraint FKawd0h3atl3r6f7iqg16r1fjw6 
       foreign key (current_owner_debts_debt_id) 
       references sv_game.debts;

    alter table if exists companies_current_owner_debts 
       add constraint FKk5bgw06sfwdjm02ah8b8na23p 
       foreign key (company_company_id) 
       references sv_game.companies;

    alter table if exists companies_lender_debts 
       add constraint FK2pmvyknp7jt61i82f8wx6lrwa 
       foreign key (lender_debts_debt_id) 
       references sv_game.debts;

    alter table if exists companies_lender_debts 
       add constraint FKtiyiqmp9hgjeke02wuhdb4uvo 
       foreign key (company_company_id) 
       references sv_game.companies;

    alter table if exists npcs_current_owner_debts 
       add constraint FKhbmkv3686p02vys523213c5xl 
       foreign key (current_owner_debts_debt_id) 
       references sv_game.debts;

    alter table if exists npcs_current_owner_debts 
       add constraint FK67vacw4x9b7xruhyv83w4n6tb 
       foreign key (npc_npc_id) 
       references sv_game.npcs;

    alter table if exists npcs_lender_debts 
       add constraint FK5fe23xglul0y1fx5d3s7i9yin 
       foreign key (lender_debts_debt_id) 
       references sv_game.debts;

    alter table if exists npcs_lender_debts 
       add constraint FKba84g1xkqkfwnxgsg2buh3hwd 
       foreign key (npc_npc_id) 
       references sv_game.npcs;

    alter table if exists players_borrower_debts 
       add constraint FKquopy2rg1uo2l1ae1n6ffiu0v 
       foreign key (borrower_debts_debt_id) 
       references sv_game.debts;

    alter table if exists players_borrower_debts 
       add constraint FK8ke87wbo8oqf4pxqmfovug2f2 
       foreign key (player_player_id) 
       references sv_game.players;

    alter table if exists players_current_owner_debts 
       add constraint FKn1h1o93c3r8f101mf53o6ylfy 
       foreign key (current_owner_debts_debt_id) 
       references sv_game.debts;

    alter table if exists players_current_owner_debts 
       add constraint FKdvljaamut8swalyq49qy53q0x 
       foreign key (player_player_id) 
       references sv_game.players;

    alter table if exists players_lender_debts 
       add constraint FKg5xjq5knal99mk24g7wog1dxc 
       foreign key (lender_debts_debt_id) 
       references sv_game.debts;

    alter table if exists players_lender_debts 
       add constraint FK9jb0i0t91w5eodrek9gx2gm58 
       foreign key (player_player_id) 
       references sv_game.players;

    create table sv_game.bank_account_transactions (
        amount numeric(32,2) not null,
        transaction_date timestamp(6) with time zone not null,
        account_id_player_bank_accounts uuid,
        bank_transaction_id uuid not null,
        transaction_type varchar(100) not null,
        description text not null,
        primary key (bank_transaction_id)
    );

    create table sv_game.banks (
        deposit_interest_rate numeric(5,4) default 0.00 not null,
        is_player_bank boolean default false not null,
        loan_interest_rate numeric(5,4) default 0.00 not null,
        monthly_account_fee numeric(10,2) default 0.00 not null,
        reputation integer default 500 not null,
        stability_index numeric(5,2) default 100.00 not null,
        transaction_fee_rate numeric(5,4) default 0.00 not null,
        bank_id uuid not null,
        country_id_countries uuid,
        player_id_players uuid,
        name varchar(255) not null,
        primary key (bank_id)
    );

    create table sv_game.bets (
        amount_bet numeric(16,2) not null,
        outcome_amount numeric(16,2) not null,
        bet_date timestamp(6) with time zone not null,
        bet_id uuid not null,
        cockfight_id_cockfights uuid,
        debt_id_debts uuid,
        player_id_players uuid,
        type varchar(100) not null,
        details jsonb not null,
        primary key (bet_id)
    );

    create table sv_game.buildings (
        capacity integer not null,
        condition_percentage integer default 100 not null,
        construction_cost numeric(32,2) not null,
        current_value numeric(32,2) not null,
        is_company_headquarters boolean default false not null,
        is_player_home boolean default false not null,
        maintenance_cost_per_month numeric(16,2) not null,
        rent_per_month numeric(5,2) not null,
        upgrade_level integer default 0 not null,
        building_id uuid not null,
        company_id_companies uuid,
        npc_id_npcs uuid,
        player_id_players uuid,
        building_type varchar(100) not null,
        customization_data jsonb not null,
        primary key (building_id)
    );

    create table sv_game.business_categories (
        category_id uuid not null,
        name varchar(255) not null,
        description text,
        primary key (category_id)
    );

    create table sv_game.career_paths (
        path_id uuid not null,
        related_attribute varchar(50) not null,
        name varchar(255) not null,
        description text not null,
        primary key (path_id)
    );

    create table sv_game.cities (
        cost_of_living_index numeric(5,2) not null,
        local_crime_rate numeric(5,2) not null,
        size_modifier numeric(5,2) not null,
        unemployment_rate numeric(5,2) not null,
        population bigint not null,
        city_id uuid not null,
        state_id_states uuid,
        city_type varchar(100) not null,
        name varchar(255) not null,
        procedural_seed varchar(255),
        generated_map_layout jsonb not null,
        map_config_data jsonb not null,
        primary key (city_id)
    );

    create table sv_game.cockfights (
        loser_died boolean,
        date_time timestamp(6) with time zone not null,
        building_id_buildings uuid,
        cockfight_id uuid not null,
        game_id_games uuid,
        rooster_id_roosters uuid,
        rooster_id_roosters1 uuid,
        outcome varchar(50),
        status varchar(50) default 'Scheduled' not null,
        primary key (cockfight_id)
    );

    create table sv_game.companies (
        cash_balance numeric(32,2) default 0.00 not null,
        founding_date date not null,
        growth_rate numeric(5,2) not null,
        is_publicly_traded boolean default false not null,
        market_share numeric(5,2) default 0.00 not null,
        marketing_level integer default 0 not null,
        net_worth numeric(32,2) not null,
        production_capacity integer not null,
        r_and_d_level integer default 0 not null,
        reputation integer default 500 not null,
        category_id_business_categories uuid,
        company_id uuid not null,
        npc_id_npcs uuid,
        player_id_players uuid,
        name varchar(255) not null,
        primary key (company_id)
    );

    create table sv_game.company_buildings (
        is_active boolean default true not null,
        building_id_buildings uuid,
        company_building_id uuid not null,
        company_id_companies uuid,
        role varchar(100) not null,
        primary key (company_building_id)
    );

    create table sv_game.company_financial_history (
        employees_count integer not null,
        expenses numeric(32,2) not null,
        net_worth_snapshot numeric(32,2) not null,
        profit numeric(32,2) not null,
        record_date date not null,
        revenue numeric(32,2) not null,
        company_id_companies uuid,
        record_id uuid not null,
        primary key (record_id)
    );

    create table sv_game.company_hqs (
        building_id_buildings uuid unique,
        company_hq_id uuid not null,
        company_id_companies uuid unique,
        primary key (company_hq_id)
    );

    create table sv_game.countries (
        base_tax_rate numeric(5,2) not null,
        business_tax_rate numeric(5,2) not null,
        corruption_level numeric(5,2) not null,
        crime_rate_modifier numeric(5,2) not null,
        growth_potential numeric(5,2) not null,
        import_export_duty numeric(5,2) not null,
        stability_index numeric(5,2) not null,
        country_id uuid not null,
        currency_id_currencies uuid,
        economic_system varchar(100) not null,
        law_system varchar(100) not null,
        name varchar(255) not null,
        primary key (country_id)
    );

    create table sv_game.courses (
        cost numeric(16,2) not null,
        duration_days integer not null,
        course_id uuid not null,
        institution_id_education_institutions uuid,
        skill_id_skills uuid,
        related_attribute varchar(50) not null,
        name varchar(255) not null,
        description text not null,
        primary key (course_id)
    );

    create table sv_game.crypto_price_history (
        price numeric(16,2) not null,
        record_time timestamp(6) with time zone not null,
        crypto_id_cryptocurrencies uuid,
        history_id uuid not null,
        primary key (history_id)
    );

    create table sv_game.cryptocurrencies (
        current_price numeric(16,2) not null,
        mining_difficulty numeric(16,2) not null,
        volatility numeric(5,2) not null,
        circulating_supply bigint not null,
        supply_limit bigint,
        symbol varchar(10) not null,
        crypto_id uuid not null,
        name varchar(255) not null,
        primary key (crypto_id)
    );

    create table sv_game.currencies (
        exchange_rate_to_base_currency numeric(16,2) not null,
        iso_code varchar(3) not null,
        volatility numeric(5,2) not null,
        symbol varchar(10) not null,
        currency_id uuid not null,
        name varchar(255) not null,
        primary key (currency_id)
    );

    create table sv_game.debt_collateral (
        collateral_value_at_loan_time numeric(32,2) not null,
        is_currently_held boolean not null,
        collateral_entity_id uuid not null,
        debt_collateral_id uuid not null,
        debt_id_debts uuid,
        collateral_type varchar(50) not null,
        primary key (debt_collateral_id)
    );

    create table sv_game.debts (
        current_debt numeric(32,2),
        interest_rate numeric(5,4) not null,
        minimum_next_payment_amount numeric(32,2),
        original_value numeric(32,2) not null,
        end_date timestamp(6) with time zone not null,
        next_payment_date timestamp(6) with time zone,
        start_date timestamp(6) with time zone not null,
        bank_id_banks uuid,
        bank_id_banks1 uuid,
        company_id_companies uuid,
        company_id_companies1 uuid,
        company_id_companies2 uuid,
        debt_id uuid not null,
        game_id_games uuid,
        npc_id_npcs uuid,
        npc_id_npcs1 uuid,
        player_id_players uuid,
        player_id_players1 uuid,
        player_id_players2 uuid,
        debt_type varchar(50) default 'Loan' not null,
        payment_frequency varchar(50) not null,
        status varchar(50) default 'Active' not null,
        primary key (debt_id)
    );

    create table sv_game.education_institutions (
        institution_id uuid not null,
        type varchar(100) not null,
        name varchar(255) not null,
        primary key (institution_id)
    );

    create table sv_game.exchange_rate_history (
        exchange_rate numeric(16,4) not null,
        record_time timestamp(6) with time zone not null,
        currency_id_currencies uuid,
        history_id uuid not null,
        primary key (history_id)
    );

    create table sv_game.games (
        game_speed_multiplier numeric(3,1) default 1.0 not null,
        current_date_time timestamp(6) with time zone,
        last_save_time timestamp(6) with time zone,
        game_id uuid not null,
        game_name varchar(255) not null,
        primary key (game_id)
    );

    create table sv_game.garage_parking (
        garage_id_garages uuid,
        garage_parking_id uuid not null,
        vehicle_id_vehicles uuid unique,
        parking_spot_number varchar(50),
        primary key (garage_parking_id)
    );

    create table sv_game.garages (
        available_slots integer not null,
        total_slots integer not null,
        building_id_buildings uuid unique,
        game_id_games uuid,
        garage_id uuid not null,
        slot_size_type varchar(50) not null,
        primary key (garage_id)
    );

    create table sv_game.investment_opportunities (
        duration_days integer not null,
        end_date date not null,
        expected_return_max numeric(5,2) not null,
        expected_return_min numeric(5,2) not null,
        is_active boolean default true not null,
        max_investment numeric(32,2) not null,
        min_investment numeric(32,2) not null,
        risk_level numeric(5,2) not null,
        start_date date not null,
        opportunity_id uuid not null,
        name varchar(255) not null,
        description text not null,
        primary key (opportunity_id)
    );

    create table sv_game.items (
        value numeric(16,2) not null,
        item_id uuid not null,
        type varchar(100) not null,
        name varchar(255) not null,
        description text not null,
        effect_data jsonb not null,
        primary key (item_id)
    );

    create table sv_game.job_categories (
        category_id uuid not null,
        name varchar(255) not null,
        primary key (category_id)
    );

    create table sv_game.jobs (
        base_salary_per_day numeric(16,2) not null,
        is_available boolean default true not null,
        required_charisma integer not null,
        required_education_score integer not null,
        required_intelligence integer not null,
        required_strength integer not null,
        xp_per_day integer not null,
        category_id_job_categories uuid,
        company_id_companies uuid,
        job_id uuid not null,
        required_education_level varchar(100) not null,
        title varchar(255) not null,
        primary key (job_id)
    );

    create table sv_game.news_events (
        is_global boolean default false not null,
        event_date timestamp(6) with time zone not null,
        city_id_cities uuid,
        country_id_countries uuid,
        event_id uuid not null,
        game_id_games uuid,
        event_type varchar(100) not null,
        title varchar(255) not null,
        description text not null,
        impact_data jsonb not null,
        primary key (event_id)
    );

    create table sv_game.nfts (
        current_value numeric(32,2) not null,
        initial_value numeric(32,2) not null,
        creation_date timestamp(6) with time zone not null,
        game_id_games uuid,
        nft_id uuid not null,
        npc_id_npcs uuid,
        player_id_players uuid,
        contract_address varchar(255),
        image_path varchar(255),
        name varchar(255) not null,
        token_id varchar(255),
        description text,
        generation_params jsonb,
        primary key (nft_id)
    );

    create table sv_game.npc_stock_holdings (
        average_purchase_price numeric(16,2) not null,
        last_updated_time timestamp(6) with time zone not null,
        shares_owned bigint not null,
        holding_id uuid not null,
        npc_id_npcs uuid,
        stock_id_stocks uuid,
        primary key (holding_id)
    );

    create table sv_game.npcs (
        charisma integer not null,
        intelligence integer not null,
        is_essential boolean default false not null,
        karma integer default 500 not null,
        luck integer not null,
        strength integer not null,
        city_id_cities uuid,
        game_id_games uuid,
        npc_id uuid not null,
        plot_id_plots uuid,
        financial_status varchar(50) not null,
        gender varchar(50) not null,
        status varchar(50) default 'Available' not null,
        occupation varchar(100),
        job_title varchar(255),
        name varchar(255) not null,
        appearance_data jsonb,
        notes text,
        personality_traits jsonb,
        primary key (npc_id)
    );

    create table sv_game.player_attributes (
        charisma integer default 1 not null,
        intelligence integer default 1 not null,
        luck integer default 1 not null,
        strength integer default 1 not null,
        last_updated_time timestamp(6) with time zone not null,
        attribute_id uuid not null,
        player_id_players uuid unique,
        primary key (attribute_id)
    );

    create table sv_game.player_bank_accounts (
        balance numeric(32,2) default 0.00 not null,
        is_primary boolean default false not null,
        created_date timestamp(6) with time zone not null,
        last_activity_date timestamp(6) with time zone not null,
        account_id uuid not null,
        bank_id_banks uuid,
        currency_id_currencies uuid,
        player_id_players uuid,
        account_number varchar(50) not null,
        account_type varchar(50) not null,
        primary key (account_id)
    );

    create table sv_game.player_career_progress (
        level integer default 1 not null,
        xp_in_path integer default 0 not null,
        last_level_up_date timestamp(6) with time zone not null,
        path_id_career_paths uuid,
        player_id_players uuid,
        progress_id uuid not null,
        primary key (progress_id)
    );

    create table sv_game.player_crypto_holdings (
        amount numeric(24,8) not null,
        average_purchase_price numeric(16,2) not null,
        last_updated_time timestamp(6) with time zone not null,
        crypto_id_cryptocurrencies uuid,
        holding_id uuid not null,
        player_id_players uuid,
        primary key (holding_id)
    );

    create table sv_game.player_currency_holdings (
        amount numeric(32,2) default 0.00 not null,
        last_updated_time timestamp(6) with time zone not null,
        currency_id_currencies uuid,
        holding_id uuid not null,
        player_id_players uuid,
        primary key (holding_id)
    );

    create table sv_game.player_inventory (
        equipped boolean default false not null,
        quantity integer default 1 not null,
        inventory_id uuid not null,
        item_id_items uuid,
        player_id_players uuid,
        primary key (inventory_id)
    );

    create table sv_game.player_investments (
        actual_return_amount numeric(32,2) not null,
        amount_invested numeric(32,2) not null,
        expected_return_amount numeric(32,2) not null,
        completion_date timestamp(6) with time zone not null,
        investment_date timestamp(6) with time zone not null,
        opportunity_id_investment_opportunities uuid,
        player_id_players uuid,
        player_investment_id uuid not null,
        status varchar(50) not null,
        primary key (player_investment_id)
    );

    create table sv_game.player_nft_holdings (
        acquisition_price numeric(32,2) not null,
        is_listed_for_sale boolean default false not null,
        listing_price numeric(32,2),
        acquisition_date timestamp(6) with time zone not null,
        holding_id uuid not null,
        nft_id_nfts uuid unique,
        player_id_players uuid,
        primary key (holding_id)
    );

    create table sv_game.player_npc_relationships (
        level integer default 0 not null,
        last_interaction_date timestamp(6) with time zone,
        npc_id_npcs uuid,
        player_id_players uuid,
        relationship_id uuid not null,
        relationship_type varchar(50) default 'Neutral' not null,
        primary key (relationship_id)
    );

    create table sv_game.player_skills (
        level integer default 0 not null,
        xp integer default 0 not null,
        last_updated_time timestamp(6) with time zone not null,
        player_id_players uuid,
        player_skill_id uuid not null,
        skill_id_skills uuid,
        primary key (player_skill_id)
    );

    create table sv_game.player_status_effects (
        end_time timestamp(6) with time zone,
        start_time timestamp(6) with time zone not null,
        effect_id uuid not null,
        player_id_players uuid,
        type varchar(100) not null,
        modifier_data jsonb not null,
        primary key (effect_id)
    );

    create table sv_game.player_stock_holdings (
        average_purchase_price numeric(16,2) not null,
        last_updated_time timestamp(6) with time zone not null,
        shares_owned bigint not null,
        holding_id uuid not null,
        player_id_players uuid,
        stock_id_stocks uuid,
        primary key (holding_id)
    );

    create table sv_game.players (
        age integer not null,
        cash_balance numeric(64,2) default 0.00 not null,
        date_of_birth date not null,
        education_score integer default 0 not null,
        energy integer default 100 not null,
        experience_points integer default 0 not null,
        happiness integer default 100 not null,
        health integer default 100 not null,
        karma integer default 500 not null,
        city_id_cities uuid,
        game_id_games uuid,
        job_id_jobs uuid,
        player_id uuid not null,
        plot_id_plots uuid,
        gender varchar(50) not null,
        education_level varchar(100) default 'None' not null,
        name varchar(255) not null,
        appearance_data jsonb not null,
        primary key (player_id)
    );

    create table sv_game.plots (
        current_value numeric(32,2) not null,
        is_available_for_sale boolean default true not null,
        is_empty boolean default true not null,
        purchase_price numeric(32,2) not null,
        last_update_time timestamp(6) with time zone not null,
        building_id_buildings uuid unique,
        city_id_cities uuid,
        company_id_companies uuid,
        npc_id_npcs uuid,
        player_id_players uuid,
        plot_id uuid not null,
        zoning_type varchar(50) default 'Not Zoned' not null,
        primary key (plot_id)
    );

    create table sv_game.products (
        base_production_cost numeric(16,2) not null,
        current_market_price numeric(16,2) not null,
        demand numeric(5,2) not null,
        production_rate_per_day numeric(16,2) not null,
        quality integer default 50 not null,
        supply numeric(5,2) not null,
        category_id_business_categories uuid,
        company_id_companies uuid,
        product_id uuid not null,
        name varchar(255) not null,
        primary key (product_id)
    );

    create table sv_game.roosters (
        age_days integer not null,
        aggression integer not null,
        draw_count integer default 0 not null,
        health integer default 100 not null,
        is_deceased boolean default false not null,
        kill_count integer default 0 not null,
        loss_count integer default 0 not null,
        speed integer not null,
        strength integer not null,
        win_count integer default 0 not null,
        game_id_games uuid,
        npc_id_npcs uuid,
        player_id_players uuid,
        plot_id_plots uuid,
        rooster_id uuid not null,
        status varchar(50) default 'Available' not null,
        name varchar(255) not null,
        primary key (rooster_id)
    );

    create table sv_game.skills (
        skill_id uuid not null,
        related_attribute varchar(50) not null,
        name varchar(255) not null,
        description text not null,
        primary key (skill_id)
    );

    create table sv_game.states (
        additional_regional_tax_rate numeric(5,2) default 0.00 not null,
        country_id_countries uuid,
        state_id uuid not null,
        name varchar(255) not null,
        environmental_regulations_data jsonb not null,
        zoning_regulations_data jsonb not null,
        primary key (state_id)
    );

    create table sv_game.stock_markets (
        closing_time time(6) not null,
        opening_time time(6) not null,
        market_id uuid not null,
        name varchar(255) not null,
        primary key (market_id)
    );

    create table sv_game.stock_price_history (
        price numeric(16,2) not null,
        record_time timestamp(6) with time zone not null,
        volume bigint not null,
        history_id uuid not null,
        stock_id_stocks uuid,
        primary key (history_id)
    );

    create table sv_game.stocks (
        current_price numeric(16,2) not null,
        volatility numeric(5,2) not null,
        last_trade_time timestamp(6) with time zone not null,
        shares_outstanding bigint not null,
        ticker_symbol varchar(10) not null,
        company_id_companies uuid unique,
        market_id_stock_markets uuid,
        stock_id uuid not null,
        primary key (stock_id)
    );

    create table sv_game.transactions (
        amount numeric(32,2) not null,
        transaction_date timestamp(6) with time zone not null,
        account_id_player_bank_accounts uuid,
        company_id_companies uuid,
        currency_id_currencies uuid,
        player_id_players uuid,
        related_entity_id uuid,
        transaction_id uuid not null,
        type varchar(100) not null,
        related_entity_type varchar(255),
        description text not null,
        primary key (transaction_id)
    );

    create table sv_game.vehicles (
        condition_percentage integer default 100 not null,
        current_value numeric(32,2) not null,
        mileage integer default 0 not null,
        purchase_price numeric(32,2) not null,
        company_id_companies uuid,
        game_id_games uuid,
        garage_id_garages uuid,
        player_id_players uuid,
        plot_id_plots uuid,
        vehicle_id uuid not null,
        vehicletype_id_vehicletypes uuid,
        status varchar(50) default 'Parked' not null,
        primary key (vehicle_id)
    );

    create table sv_game.vehicletypes (
        base_price numeric(32,2) not null,
        cargo_capacity integer default 0 not null,
        passenger_capacity integer default 1 not null,
        speed_modifier numeric(5,2) default 1.0 not null,
        work_efficiency_modifier numeric(5,2) default 0.0 not null,
        game_id_games uuid,
        vehicletype_id uuid not null,
        garage_size_needed varchar(50) default 'Small' not null,
        type varchar(50) not null,
        maker varchar(255) not null,
        name varchar(255) not null,
        primary key (vehicletype_id)
    );

    create table banks_current_owner_debts (
        bank_bank_id uuid not null,
        current_owner_debts_debt_id uuid not null unique,
        primary key (bank_bank_id, current_owner_debts_debt_id)
    );

    create table banks_lender_debts (
        bank_bank_id uuid not null,
        lender_debts_debt_id uuid not null unique,
        primary key (bank_bank_id, lender_debts_debt_id)
    );

    create table companies_borrower_debts (
        borrower_debts_debt_id uuid not null unique,
        company_company_id uuid not null,
        primary key (borrower_debts_debt_id, company_company_id)
    );

    create table companies_current_owner_debts (
        company_company_id uuid not null,
        current_owner_debts_debt_id uuid not null unique,
        primary key (company_company_id, current_owner_debts_debt_id)
    );

    create table companies_lender_debts (
        company_company_id uuid not null,
        lender_debts_debt_id uuid not null unique,
        primary key (company_company_id, lender_debts_debt_id)
    );

    create table npcs_current_owner_debts (
        current_owner_debts_debt_id uuid not null unique,
        npc_npc_id uuid not null,
        primary key (current_owner_debts_debt_id, npc_npc_id)
    );

    create table npcs_lender_debts (
        lender_debts_debt_id uuid not null unique,
        npc_npc_id uuid not null,
        primary key (lender_debts_debt_id, npc_npc_id)
    );

    create table players_borrower_debts (
        borrower_debts_debt_id uuid not null unique,
        player_player_id uuid not null,
        primary key (borrower_debts_debt_id, player_player_id)
    );

    create table players_current_owner_debts (
        current_owner_debts_debt_id uuid not null unique,
        player_player_id uuid not null,
        primary key (current_owner_debts_debt_id, player_player_id)
    );

    create table players_lender_debts (
        lender_debts_debt_id uuid not null unique,
        player_player_id uuid not null,
        primary key (lender_debts_debt_id, player_player_id)
    );

    alter table if exists sv_game.bank_account_transactions 
       add constraint FKjb01eotg0k9dmgrwbf5iy0jp5 
       foreign key (account_id_player_bank_accounts) 
       references sv_game.player_bank_accounts 
       on delete cascade;

    alter table if exists sv_game.banks 
       add constraint FK3c1y8dbh15dbkyke4o37mlqcv 
       foreign key (country_id_countries) 
       references sv_game.countries 
       on delete restrict;

    alter table if exists sv_game.banks 
       add constraint FKc3eo422rdf1dmx32h9gsj3n9i 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.bets 
       add constraint FKmwmk5kpqo18s5eivjy1y2a2g1 
       foreign key (cockfight_id_cockfights) 
       references sv_game.cockfights 
       on delete restrict;

    alter table if exists sv_game.bets 
       add constraint FKmgc4gldko9471s6a46yrd4q33 
       foreign key (debt_id_debts) 
       references sv_game.debts 
       on delete cascade;

    alter table if exists sv_game.bets 
       add constraint FKqalc1cmkrs4ms5x6sdtieigdi 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.buildings 
       add constraint FK6ll35noytqm9m9p4mu77tkq3j 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.buildings 
       add constraint FKrspuqr0x2ikm7x0fmvk8yop5e 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.buildings 
       add constraint FKd2elcads83w6kq1yfqegen4yf 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.cities 
       add constraint FK7cf2lydp0qt74d04iwlvmxxpt 
       foreign key (state_id_states) 
       references sv_game.states 
       on delete cascade;

    alter table if exists sv_game.cockfights 
       add constraint FKqlq17pa8t1g7kqnm4r2txdrlw 
       foreign key (building_id_buildings) 
       references sv_game.buildings 
       on delete restrict;

    alter table if exists sv_game.cockfights 
       add constraint FKobfyo1i2fkht9mfnox83bxfom 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.cockfights 
       add constraint FK11gfxu9p38ija1rs705yo9a6y 
       foreign key (rooster_id_roosters) 
       references sv_game.roosters 
       on delete restrict;

    alter table if exists sv_game.cockfights 
       add constraint FK8dx625xuqx70ier5vphpfsifk 
       foreign key (rooster_id_roosters1) 
       references sv_game.roosters 
       on delete restrict;

    alter table if exists sv_game.companies 
       add constraint FKf8lqctukbufq6y5yfnb2o0sb1 
       foreign key (category_id_business_categories) 
       references sv_game.business_categories 
       on delete restrict;

    alter table if exists sv_game.companies 
       add constraint FKs63xtgd7stvh7cemu0iurkhva 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.companies 
       add constraint FKeuj8jtfhs3gy4yukrs1i7ul65 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.company_buildings 
       add constraint FK22y5dr2scnykbr9vv308dgqi2 
       foreign key (building_id_buildings) 
       references sv_game.buildings 
       on delete cascade;

    alter table if exists sv_game.company_buildings 
       add constraint FK13b0p1nd0c4g0o4wa7s2fo4x9 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete cascade;

    alter table if exists sv_game.company_financial_history 
       add constraint FKrce6cputcnj7lnw0ytw6dwfa9 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete cascade;

    alter table if exists sv_game.company_hqs 
       add constraint FKni4c39t7b7wgqhdjejb2vfj10 
       foreign key (building_id_buildings) 
       references sv_game.buildings 
       on delete set null;

    alter table if exists sv_game.company_hqs 
       add constraint FKcc0jfjqq0u3tosilyltd7upoq 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.countries 
       add constraint FK7tf3wkw44cu78c19dsdaoh0mb 
       foreign key (currency_id_currencies) 
       references sv_game.currencies 
       on delete restrict;

    alter table if exists sv_game.courses 
       add constraint FK976vogbjiefw4m97q946y5ltp 
       foreign key (institution_id_education_institutions) 
       references sv_game.education_institutions 
       on delete cascade;

    alter table if exists sv_game.courses 
       add constraint FKrd630g3rc3gmatet898ru74hg 
       foreign key (skill_id_skills) 
       references sv_game.skills 
       on delete restrict;

    alter table if exists sv_game.crypto_price_history 
       add constraint FKnw12acv2fmbw5rwgf9ehepjir 
       foreign key (crypto_id_cryptocurrencies) 
       references sv_game.cryptocurrencies 
       on delete cascade;

    alter table if exists sv_game.debt_collateral 
       add constraint FKk704y8qkd803plv4wtbdww0h5 
       foreign key (debt_id_debts) 
       references sv_game.debts 
       on delete cascade;

    alter table if exists sv_game.debts 
       add constraint FKcs88dspsf64utcuhhyemnyx11 
       foreign key (company_id_companies1) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKrthvkrkw4hxhn283xq75lxa5x 
       foreign key (player_id_players1) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKgfo6uvpv3bvysi11bl23p2hiq 
       foreign key (bank_id_banks1) 
       references sv_game.banks 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FK2uktynyetgrdsx83ubyt4qs29 
       foreign key (company_id_companies2) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKc65tcl210hwoghxdvo5g9my8m 
       foreign key (npc_id_npcs1) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FK2frdiq4ofdqmhwnu2vied6p9v 
       foreign key (player_id_players2) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKopljj9ssuoc30ry1a7mwq1kra 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.debts 
       add constraint FKqxtbljltmmksn95m4qjoev936 
       foreign key (bank_id_banks) 
       references sv_game.banks 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKd5c064dh0pa2wht549cb9sd8u 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FK12gou4btbw1bs6wfp7jiutdqx 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKb6rey8v4j2prnbl1nsiwloli5 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.exchange_rate_history 
       add constraint FKjx5bsqpdoigsamd3d7rtorofd 
       foreign key (currency_id_currencies) 
       references sv_game.currencies 
       on delete cascade;

    alter table if exists sv_game.garage_parking 
       add constraint FKtp8df3jelgglta093po3o44nn 
       foreign key (garage_id_garages) 
       references sv_game.garages 
       on delete cascade;

    alter table if exists sv_game.garage_parking 
       add constraint FKd3imjk7gr7jf9mis3gdrm438j 
       foreign key (vehicle_id_vehicles) 
       references sv_game.vehicles 
       on delete set null;

    alter table if exists sv_game.garages 
       add constraint FKdpljwwasu6nxisevhdt2alkp6 
       foreign key (building_id_buildings) 
       references sv_game.buildings 
       on delete restrict;

    alter table if exists sv_game.garages 
       add constraint FKbl3ic5nuwjylw8crmy9ydmk7v 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.jobs 
       add constraint FK1b5sy0anbsi2untb9lwjmefcj 
       foreign key (category_id_job_categories) 
       references sv_game.job_categories 
       on delete restrict;

    alter table if exists sv_game.jobs 
       add constraint FKtecafloh6bl6wtowcfmjwlckl 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.news_events 
       add constraint FK7h9th81fdohmdt8rs7pf3tu2r 
       foreign key (city_id_cities) 
       references sv_game.cities 
       on delete set null;

    alter table if exists sv_game.news_events 
       add constraint FKm56xkkxru1jivb7vhdy35e7x4 
       foreign key (country_id_countries) 
       references sv_game.countries 
       on delete set null;

    alter table if exists sv_game.news_events 
       add constraint FKjj6beencj0sqs3bn7y9tmabyq 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.nfts 
       add constraint FKtpukh60cc0h0eqs8vpi8nxo9s 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.nfts 
       add constraint FK1tqeke9ns7xa0mqs29ppssigb 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete cascade;

    alter table if exists sv_game.nfts 
       add constraint FK2mpuegmp460fd9qqoglb8q7vc 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.npc_stock_holdings 
       add constraint FKd5odir83mlchi5plscr7t8s19 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete cascade;

    alter table if exists sv_game.npc_stock_holdings 
       add constraint FKspi63pcny7jqwr4os93golkop 
       foreign key (stock_id_stocks) 
       references sv_game.stocks 
       on delete cascade;

    alter table if exists sv_game.npcs 
       add constraint FKob89bub3loftatblwp6hqyui4 
       foreign key (city_id_cities) 
       references sv_game.cities 
       on delete set null;

    alter table if exists sv_game.npcs 
       add constraint FKjkoydn7ifemb0brvb9o8p61lo 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.npcs 
       add constraint FKrnmw574r861xh4rxxfi8m14b3 
       foreign key (plot_id_plots) 
       references sv_game.plots 
       on delete set null;

    alter table if exists sv_game.player_attributes 
       add constraint FK1pns89q1q82l8mr7w7vuhfof1 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.player_bank_accounts 
       add constraint FK110v4ggqr56h57tag7lyux8w9 
       foreign key (bank_id_banks) 
       references sv_game.banks 
       on delete restrict;

    alter table if exists sv_game.player_bank_accounts 
       add constraint FKrhpqwwqmsfhusgetbdwuxere2 
       foreign key (currency_id_currencies) 
       references sv_game.currencies 
       on delete restrict;

    alter table if exists sv_game.player_bank_accounts 
       add constraint FKolper7hdyxikhd5eoxkv50h7e 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_career_progress 
       add constraint FKwbnqi0uaslfy2cnc9ow11nav 
       foreign key (path_id_career_paths) 
       references sv_game.career_paths 
       on delete set null;

    alter table if exists sv_game.player_career_progress 
       add constraint FKafqn3bknvum59gahu9225p54x 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_crypto_holdings 
       add constraint FKj1t8wbs2fo2rbhg27ou7p1l6q 
       foreign key (crypto_id_cryptocurrencies) 
       references sv_game.cryptocurrencies 
       on delete cascade;

    alter table if exists sv_game.player_crypto_holdings 
       add constraint FK9qvwu9r65htxk35s0tqkrpf4 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_currency_holdings 
       add constraint FKsr1urdyeby8djplio1204s20 
       foreign key (currency_id_currencies) 
       references sv_game.currencies 
       on delete cascade;

    alter table if exists sv_game.player_currency_holdings 
       add constraint FKw8pw51tibm4mbo9899pmr3fl 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_inventory 
       add constraint FKelb21uoil2s5g0n9qijm2q301 
       foreign key (item_id_items) 
       references sv_game.items 
       on delete restrict;

    alter table if exists sv_game.player_inventory 
       add constraint FKb166j4iorux4nh11xqnce6bvn 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_investments 
       add constraint FK4ndaalb0y85xw4amc5l5cic7i 
       foreign key (opportunity_id_investment_opportunities) 
       references sv_game.investment_opportunities 
       on delete restrict;

    alter table if exists sv_game.player_investments 
       add constraint FKt1sl52kbhbu107vj3vfpx3fxh 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_nft_holdings 
       add constraint FKlsuf0wnqhthndqwnslig9cqce 
       foreign key (nft_id_nfts) 
       references sv_game.nfts 
       on delete cascade;

    alter table if exists sv_game.player_nft_holdings 
       add constraint FK4sqd1orv42g0odi0dx6a0y6e4 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_npc_relationships 
       add constraint FKj1eec75g3eg4bolul2v3wxonr 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete cascade;

    alter table if exists sv_game.player_npc_relationships 
       add constraint FKi7vaw7tbd21wb25d1vd6gglp3 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_skills 
       add constraint FKhydbgbkdkll86f7dadbnns67p 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_skills 
       add constraint FK3v1ionoiwfqkqhpn78or43x4m 
       foreign key (skill_id_skills) 
       references sv_game.skills 
       on delete restrict;

    alter table if exists sv_game.player_status_effects 
       add constraint FKhs2w2fejcmmwpvd9h16fwqid5 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_stock_holdings 
       add constraint FK19vns04swoyp8vmclk4yfjuyr 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_stock_holdings 
       add constraint FKaioj2l1vrdiqalgfeujallpaa 
       foreign key (stock_id_stocks) 
       references sv_game.stocks 
       on delete cascade;

    alter table if exists sv_game.players 
       add constraint FK470a3pox856ynx6amiaxk7r2w 
       foreign key (city_id_cities) 
       references sv_game.cities 
       on delete restrict;

    alter table if exists sv_game.players 
       add constraint FKglekn1d8fmwrx3f4he2rrswdp 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.players 
       add constraint FKeo3cccb1rw2iai7ede56vk1e6 
       foreign key (job_id_jobs) 
       references sv_game.jobs 
       on delete set null;

    alter table if exists sv_game.players 
       add constraint FK8i0fmgdxpjlhjbsx3lm3tvefr 
       foreign key (plot_id_plots) 
       references sv_game.plots 
       on delete set null;

    alter table if exists sv_game.plots 
       add constraint FKtg1jw8x0cvje2x12qfq95a4w4 
       foreign key (building_id_buildings) 
       references sv_game.buildings 
       on delete set null;

    alter table if exists sv_game.plots 
       add constraint FKgq36msv8mstmgn41r41n5j7n4 
       foreign key (city_id_cities) 
       references sv_game.cities 
       on delete cascade;

    alter table if exists sv_game.plots 
       add constraint FKiip7oclybvedms00hp7odm2e4 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.plots 
       add constraint FKgs1p2fdahvh2arnw8b5i3rbjn 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.plots 
       add constraint FK4ic6ga8g4rr8oi2mx78oie4pb 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.products 
       add constraint FKgri9ydog2re8fd4mqoglhgxq3 
       foreign key (category_id_business_categories) 
       references sv_game.business_categories 
       on delete restrict;

    alter table if exists sv_game.products 
       add constraint FKo9d40w63d95ken7unvgl29777 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete cascade;

    alter table if exists sv_game.roosters 
       add constraint FKe1oo71xedprthp152yuh1ph5a 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.roosters 
       add constraint FK2r0quvhcf37cpjo61g20d888y 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.roosters 
       add constraint FKojlu0jctyx8lm6do0g0adh98w 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.roosters 
       add constraint FK7nwv4qeee2q66302evkg87vvq 
       foreign key (plot_id_plots) 
       references sv_game.plots 
       on delete set null;

    alter table if exists sv_game.states 
       add constraint FKsr3xajspbtb3ax0kv3awl0m36 
       foreign key (country_id_countries) 
       references sv_game.countries 
       on delete cascade;

    alter table if exists sv_game.stock_price_history 
       add constraint FKcktx49vdf2r4l97680q5n0r14 
       foreign key (stock_id_stocks) 
       references sv_game.stocks 
       on delete cascade;

    alter table if exists sv_game.stocks 
       add constraint FKld8wa553b25iqu9d85v30q3yo 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.stocks 
       add constraint FKmntcivtb5ydv9w935kececlnk 
       foreign key (market_id_stock_markets) 
       references sv_game.stock_markets 
       on delete restrict;

    alter table if exists sv_game.transactions 
       add constraint FKg9s9tn0iu7p6w5dpwnhhev7v5 
       foreign key (account_id_player_bank_accounts) 
       references sv_game.player_bank_accounts 
       on delete set null;

    alter table if exists sv_game.transactions 
       add constraint FK6sidjgxmloqpsceecsegxmbla 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete cascade;

    alter table if exists sv_game.transactions 
       add constraint FKc8hqlprwvvxj2l74pn0mmolxb 
       foreign key (currency_id_currencies) 
       references sv_game.currencies 
       on delete restrict;

    alter table if exists sv_game.transactions 
       add constraint FK5kxpgv6hdu17lvouy94gqgolg 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.vehicles 
       add constraint FKk06nrxm8sp2wjn2uaf80algvb 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.vehicles 
       add constraint FKl5f2o3u0e5plo4vfw3f4at1bd 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.vehicles 
       add constraint FKrak56p5u7ey4gude78exdqns9 
       foreign key (garage_id_garages) 
       references sv_game.garages 
       on delete set null;

    alter table if exists sv_game.vehicles 
       add constraint FKpdm8v9iqaj0enw5d13tn8takq 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.vehicles 
       add constraint FKb6glpoql8vkpdujp5255ft1la 
       foreign key (plot_id_plots) 
       references sv_game.plots 
       on delete set null;

    alter table if exists sv_game.vehicles 
       add constraint FK9ki55d9lcd53tbrn3p359knec 
       foreign key (vehicletype_id_vehicletypes) 
       references sv_game.vehicletypes 
       on delete restrict;

    alter table if exists sv_game.vehicletypes 
       add constraint FKc5oah51n6hensi8afvm3s0fiu 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists banks_current_owner_debts 
       add constraint FK37lmb9vcyljhpu09sy0xyqhsu 
       foreign key (current_owner_debts_debt_id) 
       references sv_game.debts;

    alter table if exists banks_current_owner_debts 
       add constraint FKcgmup11310ufo013lsr3rlftj 
       foreign key (bank_bank_id) 
       references sv_game.banks;

    alter table if exists banks_lender_debts 
       add constraint FK4k8vvsbl8qjnawfthmqrpyku1 
       foreign key (lender_debts_debt_id) 
       references sv_game.debts;

    alter table if exists banks_lender_debts 
       add constraint FKag301ygledx68bxsbq3xi7vlm 
       foreign key (bank_bank_id) 
       references sv_game.banks;

    alter table if exists companies_borrower_debts 
       add constraint FKel91o1cywtlg07ytv1xgmrrs0 
       foreign key (borrower_debts_debt_id) 
       references sv_game.debts;

    alter table if exists companies_borrower_debts 
       add constraint FKf6mx11foobfp2ojk9fcxrkx3f 
       foreign key (company_company_id) 
       references sv_game.companies;

    alter table if exists companies_current_owner_debts 
       add constraint FKawd0h3atl3r6f7iqg16r1fjw6 
       foreign key (current_owner_debts_debt_id) 
       references sv_game.debts;

    alter table if exists companies_current_owner_debts 
       add constraint FKk5bgw06sfwdjm02ah8b8na23p 
       foreign key (company_company_id) 
       references sv_game.companies;

    alter table if exists companies_lender_debts 
       add constraint FK2pmvyknp7jt61i82f8wx6lrwa 
       foreign key (lender_debts_debt_id) 
       references sv_game.debts;

    alter table if exists companies_lender_debts 
       add constraint FKtiyiqmp9hgjeke02wuhdb4uvo 
       foreign key (company_company_id) 
       references sv_game.companies;

    alter table if exists npcs_current_owner_debts 
       add constraint FKhbmkv3686p02vys523213c5xl 
       foreign key (current_owner_debts_debt_id) 
       references sv_game.debts;

    alter table if exists npcs_current_owner_debts 
       add constraint FK67vacw4x9b7xruhyv83w4n6tb 
       foreign key (npc_npc_id) 
       references sv_game.npcs;

    alter table if exists npcs_lender_debts 
       add constraint FK5fe23xglul0y1fx5d3s7i9yin 
       foreign key (lender_debts_debt_id) 
       references sv_game.debts;

    alter table if exists npcs_lender_debts 
       add constraint FKba84g1xkqkfwnxgsg2buh3hwd 
       foreign key (npc_npc_id) 
       references sv_game.npcs;

    alter table if exists players_borrower_debts 
       add constraint FKquopy2rg1uo2l1ae1n6ffiu0v 
       foreign key (borrower_debts_debt_id) 
       references sv_game.debts;

    alter table if exists players_borrower_debts 
       add constraint FK8ke87wbo8oqf4pxqmfovug2f2 
       foreign key (player_player_id) 
       references sv_game.players;

    alter table if exists players_current_owner_debts 
       add constraint FKn1h1o93c3r8f101mf53o6ylfy 
       foreign key (current_owner_debts_debt_id) 
       references sv_game.debts;

    alter table if exists players_current_owner_debts 
       add constraint FKdvljaamut8swalyq49qy53q0x 
       foreign key (player_player_id) 
       references sv_game.players;

    alter table if exists players_lender_debts 
       add constraint FKg5xjq5knal99mk24g7wog1dxc 
       foreign key (lender_debts_debt_id) 
       references sv_game.debts;

    alter table if exists players_lender_debts 
       add constraint FK9jb0i0t91w5eodrek9gx2gm58 
       foreign key (player_player_id) 
       references sv_game.players;

    create table sv_game.bank_account_transactions (
        amount numeric(32,2) not null,
        transaction_date timestamp(6) with time zone not null,
        account_id_player_bank_accounts uuid,
        bank_transaction_id uuid not null,
        transaction_type varchar(100) not null,
        description text not null,
        primary key (bank_transaction_id)
    );

    create table sv_game.banks (
        deposit_interest_rate numeric(5,4) default 0.00 not null,
        is_player_bank boolean default false not null,
        loan_interest_rate numeric(5,4) default 0.00 not null,
        monthly_account_fee numeric(10,2) default 0.00 not null,
        reputation integer default 500 not null,
        stability_index numeric(5,2) default 100.00 not null,
        transaction_fee_rate numeric(5,4) default 0.00 not null,
        bank_id uuid not null,
        country_id_countries uuid,
        player_id_players uuid,
        name varchar(255) not null,
        primary key (bank_id)
    );

    create table sv_game.bets (
        amount_bet numeric(16,2) not null,
        outcome_amount numeric(16,2) not null,
        bet_date timestamp(6) with time zone not null,
        bet_id uuid not null,
        cockfight_id_cockfights uuid,
        debt_id_debts uuid,
        player_id_players uuid,
        type varchar(100) not null,
        details jsonb not null,
        primary key (bet_id)
    );

    create table sv_game.buildings (
        capacity integer not null,
        condition_percentage integer default 100 not null,
        construction_cost numeric(32,2) not null,
        current_value numeric(32,2) not null,
        is_company_headquarters boolean default false not null,
        is_player_home boolean default false not null,
        maintenance_cost_per_month numeric(16,2) not null,
        rent_per_month numeric(5,2) not null,
        upgrade_level integer default 0 not null,
        building_id uuid not null,
        company_id_companies uuid,
        npc_id_npcs uuid,
        player_id_players uuid,
        building_type varchar(100) not null,
        customization_data jsonb not null,
        primary key (building_id)
    );

    create table sv_game.business_categories (
        category_id uuid not null,
        name varchar(255) not null,
        description text,
        primary key (category_id)
    );

    create table sv_game.career_paths (
        path_id uuid not null,
        related_attribute varchar(50) not null,
        name varchar(255) not null,
        description text not null,
        primary key (path_id)
    );

    create table sv_game.cities (
        cost_of_living_index numeric(5,2) not null,
        local_crime_rate numeric(5,2) not null,
        size_modifier numeric(5,2) not null,
        unemployment_rate numeric(5,2) not null,
        population bigint not null,
        city_id uuid not null,
        state_id_states uuid,
        city_type varchar(100) not null,
        name varchar(255) not null,
        procedural_seed varchar(255),
        generated_map_layout jsonb not null,
        map_config_data jsonb not null,
        primary key (city_id)
    );

    create table sv_game.cockfights (
        loser_died boolean,
        date_time timestamp(6) with time zone not null,
        building_id_buildings uuid,
        cockfight_id uuid not null,
        game_id_games uuid,
        rooster_id_roosters uuid,
        rooster_id_roosters1 uuid,
        outcome varchar(50),
        status varchar(50) default 'Scheduled' not null,
        primary key (cockfight_id)
    );

    create table sv_game.companies (
        cash_balance numeric(32,2) default 0.00 not null,
        founding_date date not null,
        growth_rate numeric(5,2) not null,
        is_publicly_traded boolean default false not null,
        market_share numeric(5,2) default 0.00 not null,
        marketing_level integer default 0 not null,
        net_worth numeric(32,2) not null,
        production_capacity integer not null,
        r_and_d_level integer default 0 not null,
        reputation integer default 500 not null,
        category_id_business_categories uuid,
        company_id uuid not null,
        npc_id_npcs uuid,
        player_id_players uuid,
        name varchar(255) not null,
        primary key (company_id)
    );

    create table sv_game.company_buildings (
        is_active boolean default true not null,
        building_id_buildings uuid,
        company_building_id uuid not null,
        company_id_companies uuid,
        role varchar(100) not null,
        primary key (company_building_id)
    );

    create table sv_game.company_financial_history (
        employees_count integer not null,
        expenses numeric(32,2) not null,
        net_worth_snapshot numeric(32,2) not null,
        profit numeric(32,2) not null,
        record_date date not null,
        revenue numeric(32,2) not null,
        company_id_companies uuid,
        record_id uuid not null,
        primary key (record_id)
    );

    create table sv_game.company_hqs (
        building_id_buildings uuid unique,
        company_hq_id uuid not null,
        company_id_companies uuid unique,
        primary key (company_hq_id)
    );

    create table sv_game.countries (
        base_tax_rate numeric(5,2) not null,
        business_tax_rate numeric(5,2) not null,
        corruption_level numeric(5,2) not null,
        crime_rate_modifier numeric(5,2) not null,
        growth_potential numeric(5,2) not null,
        import_export_duty numeric(5,2) not null,
        stability_index numeric(5,2) not null,
        country_id uuid not null,
        currency_id_currencies uuid,
        economic_system varchar(100) not null,
        law_system varchar(100) not null,
        name varchar(255) not null,
        primary key (country_id)
    );

    create table sv_game.courses (
        cost numeric(16,2) not null,
        duration_days integer not null,
        course_id uuid not null,
        institution_id_education_institutions uuid,
        skill_id_skills uuid,
        related_attribute varchar(50) not null,
        name varchar(255) not null,
        description text not null,
        primary key (course_id)
    );

    create table sv_game.crypto_price_history (
        price numeric(16,2) not null,
        record_time timestamp(6) with time zone not null,
        crypto_id_cryptocurrencies uuid,
        history_id uuid not null,
        primary key (history_id)
    );

    create table sv_game.cryptocurrencies (
        current_price numeric(16,2) not null,
        mining_difficulty numeric(16,2) not null,
        volatility numeric(5,2) not null,
        circulating_supply bigint not null,
        supply_limit bigint,
        symbol varchar(10) not null,
        crypto_id uuid not null,
        name varchar(255) not null,
        primary key (crypto_id)
    );

    create table sv_game.currencies (
        exchange_rate_to_base_currency numeric(16,2) not null,
        iso_code varchar(3) not null,
        volatility numeric(5,2) not null,
        symbol varchar(10) not null,
        currency_id uuid not null,
        name varchar(255) not null,
        primary key (currency_id)
    );

    create table sv_game.debt_collateral (
        collateral_value_at_loan_time numeric(32,2) not null,
        is_currently_held boolean not null,
        collateral_entity_id uuid not null,
        debt_collateral_id uuid not null,
        debt_id_debts uuid,
        collateral_type varchar(50) not null,
        primary key (debt_collateral_id)
    );

    create table sv_game.debts (
        current_debt numeric(32,2),
        interest_rate numeric(5,4) not null,
        minimum_next_payment_amount numeric(32,2),
        original_value numeric(32,2) not null,
        end_date timestamp(6) with time zone not null,
        next_payment_date timestamp(6) with time zone,
        start_date timestamp(6) with time zone not null,
        bank_id_banks uuid,
        bank_id_banks1 uuid,
        company_id_companies uuid,
        company_id_companies1 uuid,
        company_id_companies2 uuid,
        debt_id uuid not null,
        game_id_games uuid,
        npc_id_npcs uuid,
        npc_id_npcs1 uuid,
        player_id_players uuid,
        player_id_players1 uuid,
        player_id_players2 uuid,
        debt_type varchar(50) default 'Loan' not null,
        payment_frequency varchar(50) not null,
        status varchar(50) default 'Active' not null,
        primary key (debt_id)
    );

    create table sv_game.education_institutions (
        institution_id uuid not null,
        type varchar(100) not null,
        name varchar(255) not null,
        primary key (institution_id)
    );

    create table sv_game.exchange_rate_history (
        exchange_rate numeric(16,4) not null,
        record_time timestamp(6) with time zone not null,
        currency_id_currencies uuid,
        history_id uuid not null,
        primary key (history_id)
    );

    create table sv_game.games (
        game_speed_multiplier numeric(3,1) default 1.0 not null,
        current_date_time timestamp(6) with time zone,
        last_save_time timestamp(6) with time zone,
        game_id uuid not null,
        game_name varchar(255) not null,
        primary key (game_id)
    );

    create table sv_game.garage_parking (
        garage_id_garages uuid,
        garage_parking_id uuid not null,
        vehicle_id_vehicles uuid unique,
        parking_spot_number varchar(50),
        primary key (garage_parking_id)
    );

    create table sv_game.garages (
        available_slots integer not null,
        total_slots integer not null,
        building_id_buildings uuid unique,
        game_id_games uuid,
        garage_id uuid not null,
        slot_size_type varchar(50) not null,
        primary key (garage_id)
    );

    create table sv_game.investment_opportunities (
        duration_days integer not null,
        end_date date not null,
        expected_return_max numeric(5,2) not null,
        expected_return_min numeric(5,2) not null,
        is_active boolean default true not null,
        max_investment numeric(32,2) not null,
        min_investment numeric(32,2) not null,
        risk_level numeric(5,2) not null,
        start_date date not null,
        opportunity_id uuid not null,
        name varchar(255) not null,
        description text not null,
        primary key (opportunity_id)
    );

    create table sv_game.items (
        value numeric(16,2) not null,
        item_id uuid not null,
        type varchar(100) not null,
        name varchar(255) not null,
        description text not null,
        effect_data jsonb not null,
        primary key (item_id)
    );

    create table sv_game.job_categories (
        category_id uuid not null,
        name varchar(255) not null,
        primary key (category_id)
    );

    create table sv_game.jobs (
        base_salary_per_day numeric(16,2) not null,
        is_available boolean default true not null,
        required_charisma integer not null,
        required_education_score integer not null,
        required_intelligence integer not null,
        required_strength integer not null,
        xp_per_day integer not null,
        category_id_job_categories uuid,
        company_id_companies uuid,
        job_id uuid not null,
        required_education_level varchar(100) not null,
        title varchar(255) not null,
        primary key (job_id)
    );

    create table sv_game.news_events (
        is_global boolean default false not null,
        event_date timestamp(6) with time zone not null,
        city_id_cities uuid,
        country_id_countries uuid,
        event_id uuid not null,
        game_id_games uuid,
        event_type varchar(100) not null,
        title varchar(255) not null,
        description text not null,
        impact_data jsonb not null,
        primary key (event_id)
    );

    create table sv_game.nfts (
        current_value numeric(32,2) not null,
        initial_value numeric(32,2) not null,
        creation_date timestamp(6) with time zone not null,
        game_id_games uuid,
        nft_id uuid not null,
        npc_id_npcs uuid,
        player_id_players uuid,
        contract_address varchar(255),
        image_path varchar(255),
        name varchar(255) not null,
        token_id varchar(255),
        description text,
        generation_params jsonb,
        primary key (nft_id)
    );

    create table sv_game.npc_stock_holdings (
        average_purchase_price numeric(16,2) not null,
        last_updated_time timestamp(6) with time zone not null,
        shares_owned bigint not null,
        holding_id uuid not null,
        npc_id_npcs uuid,
        stock_id_stocks uuid,
        primary key (holding_id)
    );

    create table sv_game.npcs (
        charisma integer not null,
        intelligence integer not null,
        is_essential boolean default false not null,
        karma integer default 500 not null,
        luck integer not null,
        strength integer not null,
        city_id_cities uuid,
        game_id_games uuid,
        npc_id uuid not null,
        plot_id_plots uuid,
        financial_status varchar(50) not null,
        gender varchar(50) not null,
        status varchar(50) default 'Available' not null,
        occupation varchar(100),
        job_title varchar(255),
        name varchar(255) not null,
        appearance_data jsonb,
        notes text,
        personality_traits jsonb,
        primary key (npc_id)
    );

    create table sv_game.player_attributes (
        charisma integer default 1 not null,
        intelligence integer default 1 not null,
        luck integer default 1 not null,
        strength integer default 1 not null,
        last_updated_time timestamp(6) with time zone not null,
        attribute_id uuid not null,
        player_id_players uuid unique,
        primary key (attribute_id)
    );

    create table sv_game.player_bank_accounts (
        balance numeric(32,2) default 0.00 not null,
        is_primary boolean default false not null,
        created_date timestamp(6) with time zone not null,
        last_activity_date timestamp(6) with time zone not null,
        account_id uuid not null,
        bank_id_banks uuid,
        currency_id_currencies uuid,
        player_id_players uuid,
        account_number varchar(50) not null,
        account_type varchar(50) not null,
        primary key (account_id)
    );

    create table sv_game.player_career_progress (
        level integer default 1 not null,
        xp_in_path integer default 0 not null,
        last_level_up_date timestamp(6) with time zone not null,
        path_id_career_paths uuid,
        player_id_players uuid,
        progress_id uuid not null,
        primary key (progress_id)
    );

    create table sv_game.player_crypto_holdings (
        amount numeric(24,8) not null,
        average_purchase_price numeric(16,2) not null,
        last_updated_time timestamp(6) with time zone not null,
        crypto_id_cryptocurrencies uuid,
        holding_id uuid not null,
        player_id_players uuid,
        primary key (holding_id)
    );

    create table sv_game.player_currency_holdings (
        amount numeric(32,2) default 0.00 not null,
        last_updated_time timestamp(6) with time zone not null,
        currency_id_currencies uuid,
        holding_id uuid not null,
        player_id_players uuid,
        primary key (holding_id)
    );

    create table sv_game.player_inventory (
        equipped boolean default false not null,
        quantity integer default 1 not null,
        inventory_id uuid not null,
        item_id_items uuid,
        player_id_players uuid,
        primary key (inventory_id)
    );

    create table sv_game.player_investments (
        actual_return_amount numeric(32,2) not null,
        amount_invested numeric(32,2) not null,
        expected_return_amount numeric(32,2) not null,
        completion_date timestamp(6) with time zone not null,
        investment_date timestamp(6) with time zone not null,
        opportunity_id_investment_opportunities uuid,
        player_id_players uuid,
        player_investment_id uuid not null,
        status varchar(50) not null,
        primary key (player_investment_id)
    );

    create table sv_game.player_nft_holdings (
        acquisition_price numeric(32,2) not null,
        is_listed_for_sale boolean default false not null,
        listing_price numeric(32,2),
        acquisition_date timestamp(6) with time zone not null,
        holding_id uuid not null,
        nft_id_nfts uuid unique,
        player_id_players uuid,
        primary key (holding_id)
    );

    create table sv_game.player_npc_relationships (
        level integer default 0 not null,
        last_interaction_date timestamp(6) with time zone,
        npc_id_npcs uuid,
        player_id_players uuid,
        relationship_id uuid not null,
        relationship_type varchar(50) default 'Neutral' not null,
        primary key (relationship_id)
    );

    create table sv_game.player_skills (
        level integer default 0 not null,
        xp integer default 0 not null,
        last_updated_time timestamp(6) with time zone not null,
        player_id_players uuid,
        player_skill_id uuid not null,
        skill_id_skills uuid,
        primary key (player_skill_id)
    );

    create table sv_game.player_status_effects (
        end_time timestamp(6) with time zone,
        start_time timestamp(6) with time zone not null,
        effect_id uuid not null,
        player_id_players uuid,
        type varchar(100) not null,
        modifier_data jsonb not null,
        primary key (effect_id)
    );

    create table sv_game.player_stock_holdings (
        average_purchase_price numeric(16,2) not null,
        last_updated_time timestamp(6) with time zone not null,
        shares_owned bigint not null,
        holding_id uuid not null,
        player_id_players uuid,
        stock_id_stocks uuid,
        primary key (holding_id)
    );

    create table sv_game.players (
        age integer not null,
        cash_balance numeric(64,2) default 0.00 not null,
        date_of_birth date not null,
        education_score integer default 0 not null,
        energy integer default 100 not null,
        experience_points integer default 0 not null,
        happiness integer default 100 not null,
        health integer default 100 not null,
        karma integer default 500 not null,
        city_id_cities uuid,
        game_id_games uuid,
        job_id_jobs uuid,
        player_id uuid not null,
        plot_id_plots uuid,
        gender varchar(50) not null,
        education_level varchar(100) default 'None' not null,
        name varchar(255) not null,
        appearance_data jsonb not null,
        primary key (player_id)
    );

    create table sv_game.plots (
        current_value numeric(32,2) not null,
        is_available_for_sale boolean default true not null,
        is_empty boolean default true not null,
        purchase_price numeric(32,2) not null,
        last_update_time timestamp(6) with time zone not null,
        building_id_buildings uuid unique,
        city_id_cities uuid,
        company_id_companies uuid,
        npc_id_npcs uuid,
        player_id_players uuid,
        plot_id uuid not null,
        zoning_type varchar(50) default 'Not Zoned' not null,
        primary key (plot_id)
    );

    create table sv_game.products (
        base_production_cost numeric(16,2) not null,
        current_market_price numeric(16,2) not null,
        demand numeric(5,2) not null,
        production_rate_per_day numeric(16,2) not null,
        quality integer default 50 not null,
        supply numeric(5,2) not null,
        category_id_business_categories uuid,
        company_id_companies uuid,
        product_id uuid not null,
        name varchar(255) not null,
        primary key (product_id)
    );

    create table sv_game.roosters (
        age_days integer not null,
        aggression integer not null,
        draw_count integer default 0 not null,
        health integer default 100 not null,
        is_deceased boolean default false not null,
        kill_count integer default 0 not null,
        loss_count integer default 0 not null,
        speed integer not null,
        strength integer not null,
        win_count integer default 0 not null,
        game_id_games uuid,
        npc_id_npcs uuid,
        player_id_players uuid,
        plot_id_plots uuid,
        rooster_id uuid not null,
        status varchar(50) default 'Available' not null,
        name varchar(255) not null,
        primary key (rooster_id)
    );

    create table sv_game.skills (
        skill_id uuid not null,
        related_attribute varchar(50) not null,
        name varchar(255) not null,
        description text not null,
        primary key (skill_id)
    );

    create table sv_game.states (
        additional_regional_tax_rate numeric(5,2) default 0.00 not null,
        country_id_countries uuid,
        state_id uuid not null,
        name varchar(255) not null,
        environmental_regulations_data jsonb not null,
        zoning_regulations_data jsonb not null,
        primary key (state_id)
    );

    create table sv_game.stock_markets (
        closing_time time(6) not null,
        opening_time time(6) not null,
        market_id uuid not null,
        name varchar(255) not null,
        primary key (market_id)
    );

    create table sv_game.stock_price_history (
        price numeric(16,2) not null,
        record_time timestamp(6) with time zone not null,
        volume bigint not null,
        history_id uuid not null,
        stock_id_stocks uuid,
        primary key (history_id)
    );

    create table sv_game.stocks (
        current_price numeric(16,2) not null,
        volatility numeric(5,2) not null,
        last_trade_time timestamp(6) with time zone not null,
        shares_outstanding bigint not null,
        ticker_symbol varchar(10) not null,
        company_id_companies uuid unique,
        market_id_stock_markets uuid,
        stock_id uuid not null,
        primary key (stock_id)
    );

    create table sv_game.transactions (
        amount numeric(32,2) not null,
        transaction_date timestamp(6) with time zone not null,
        account_id_player_bank_accounts uuid,
        company_id_companies uuid,
        currency_id_currencies uuid,
        player_id_players uuid,
        related_entity_id uuid,
        transaction_id uuid not null,
        type varchar(100) not null,
        related_entity_type varchar(255),
        description text not null,
        primary key (transaction_id)
    );

    create table sv_game.vehicles (
        condition_percentage integer default 100 not null,
        current_value numeric(32,2) not null,
        mileage integer default 0 not null,
        purchase_price numeric(32,2) not null,
        company_id_companies uuid,
        game_id_games uuid,
        garage_id_garages uuid,
        player_id_players uuid,
        plot_id_plots uuid,
        vehicle_id uuid not null,
        vehicletype_id_vehicletypes uuid,
        status varchar(50) default 'Parked' not null,
        primary key (vehicle_id)
    );

    create table sv_game.vehicletypes (
        base_price numeric(32,2) not null,
        cargo_capacity integer default 0 not null,
        passenger_capacity integer default 1 not null,
        speed_modifier numeric(5,2) default 1.0 not null,
        work_efficiency_modifier numeric(5,2) default 0.0 not null,
        game_id_games uuid,
        vehicletype_id uuid not null,
        garage_size_needed varchar(50) default 'Small' not null,
        type varchar(50) not null,
        maker varchar(255) not null,
        name varchar(255) not null,
        primary key (vehicletype_id)
    );

    create table banks_current_owner_debts (
        bank_bank_id uuid not null,
        current_owner_debts_debt_id uuid not null unique,
        primary key (bank_bank_id, current_owner_debts_debt_id)
    );

    create table banks_lender_debts (
        bank_bank_id uuid not null,
        lender_debts_debt_id uuid not null unique,
        primary key (bank_bank_id, lender_debts_debt_id)
    );

    create table companies_borrower_debts (
        borrower_debts_debt_id uuid not null unique,
        company_company_id uuid not null,
        primary key (borrower_debts_debt_id, company_company_id)
    );

    create table companies_current_owner_debts (
        company_company_id uuid not null,
        current_owner_debts_debt_id uuid not null unique,
        primary key (company_company_id, current_owner_debts_debt_id)
    );

    create table companies_lender_debts (
        company_company_id uuid not null,
        lender_debts_debt_id uuid not null unique,
        primary key (company_company_id, lender_debts_debt_id)
    );

    create table npcs_current_owner_debts (
        current_owner_debts_debt_id uuid not null unique,
        npc_npc_id uuid not null,
        primary key (current_owner_debts_debt_id, npc_npc_id)
    );

    create table npcs_lender_debts (
        lender_debts_debt_id uuid not null unique,
        npc_npc_id uuid not null,
        primary key (lender_debts_debt_id, npc_npc_id)
    );

    create table players_borrower_debts (
        borrower_debts_debt_id uuid not null unique,
        player_player_id uuid not null,
        primary key (borrower_debts_debt_id, player_player_id)
    );

    create table players_current_owner_debts (
        current_owner_debts_debt_id uuid not null unique,
        player_player_id uuid not null,
        primary key (current_owner_debts_debt_id, player_player_id)
    );

    create table players_lender_debts (
        lender_debts_debt_id uuid not null unique,
        player_player_id uuid not null,
        primary key (lender_debts_debt_id, player_player_id)
    );

    alter table if exists sv_game.bank_account_transactions 
       add constraint FKjb01eotg0k9dmgrwbf5iy0jp5 
       foreign key (account_id_player_bank_accounts) 
       references sv_game.player_bank_accounts 
       on delete cascade;

    alter table if exists sv_game.banks 
       add constraint FK3c1y8dbh15dbkyke4o37mlqcv 
       foreign key (country_id_countries) 
       references sv_game.countries 
       on delete restrict;

    alter table if exists sv_game.banks 
       add constraint FKc3eo422rdf1dmx32h9gsj3n9i 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.bets 
       add constraint FKmwmk5kpqo18s5eivjy1y2a2g1 
       foreign key (cockfight_id_cockfights) 
       references sv_game.cockfights 
       on delete restrict;

    alter table if exists sv_game.bets 
       add constraint FKmgc4gldko9471s6a46yrd4q33 
       foreign key (debt_id_debts) 
       references sv_game.debts 
       on delete cascade;

    alter table if exists sv_game.bets 
       add constraint FKqalc1cmkrs4ms5x6sdtieigdi 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.buildings 
       add constraint FK6ll35noytqm9m9p4mu77tkq3j 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.buildings 
       add constraint FKrspuqr0x2ikm7x0fmvk8yop5e 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.buildings 
       add constraint FKd2elcads83w6kq1yfqegen4yf 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.cities 
       add constraint FK7cf2lydp0qt74d04iwlvmxxpt 
       foreign key (state_id_states) 
       references sv_game.states 
       on delete cascade;

    alter table if exists sv_game.cockfights 
       add constraint FKqlq17pa8t1g7kqnm4r2txdrlw 
       foreign key (building_id_buildings) 
       references sv_game.buildings 
       on delete restrict;

    alter table if exists sv_game.cockfights 
       add constraint FKobfyo1i2fkht9mfnox83bxfom 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.cockfights 
       add constraint FK11gfxu9p38ija1rs705yo9a6y 
       foreign key (rooster_id_roosters) 
       references sv_game.roosters 
       on delete restrict;

    alter table if exists sv_game.cockfights 
       add constraint FK8dx625xuqx70ier5vphpfsifk 
       foreign key (rooster_id_roosters1) 
       references sv_game.roosters 
       on delete restrict;

    alter table if exists sv_game.companies 
       add constraint FKf8lqctukbufq6y5yfnb2o0sb1 
       foreign key (category_id_business_categories) 
       references sv_game.business_categories 
       on delete restrict;

    alter table if exists sv_game.companies 
       add constraint FKs63xtgd7stvh7cemu0iurkhva 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.companies 
       add constraint FKeuj8jtfhs3gy4yukrs1i7ul65 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.company_buildings 
       add constraint FK22y5dr2scnykbr9vv308dgqi2 
       foreign key (building_id_buildings) 
       references sv_game.buildings 
       on delete cascade;

    alter table if exists sv_game.company_buildings 
       add constraint FK13b0p1nd0c4g0o4wa7s2fo4x9 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete cascade;

    alter table if exists sv_game.company_financial_history 
       add constraint FKrce6cputcnj7lnw0ytw6dwfa9 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete cascade;

    alter table if exists sv_game.company_hqs 
       add constraint FKni4c39t7b7wgqhdjejb2vfj10 
       foreign key (building_id_buildings) 
       references sv_game.buildings 
       on delete set null;

    alter table if exists sv_game.company_hqs 
       add constraint FKcc0jfjqq0u3tosilyltd7upoq 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.countries 
       add constraint FK7tf3wkw44cu78c19dsdaoh0mb 
       foreign key (currency_id_currencies) 
       references sv_game.currencies 
       on delete restrict;

    alter table if exists sv_game.courses 
       add constraint FK976vogbjiefw4m97q946y5ltp 
       foreign key (institution_id_education_institutions) 
       references sv_game.education_institutions 
       on delete cascade;

    alter table if exists sv_game.courses 
       add constraint FKrd630g3rc3gmatet898ru74hg 
       foreign key (skill_id_skills) 
       references sv_game.skills 
       on delete restrict;

    alter table if exists sv_game.crypto_price_history 
       add constraint FKnw12acv2fmbw5rwgf9ehepjir 
       foreign key (crypto_id_cryptocurrencies) 
       references sv_game.cryptocurrencies 
       on delete cascade;

    alter table if exists sv_game.debt_collateral 
       add constraint FKk704y8qkd803plv4wtbdww0h5 
       foreign key (debt_id_debts) 
       references sv_game.debts 
       on delete cascade;

    alter table if exists sv_game.debts 
       add constraint FKcs88dspsf64utcuhhyemnyx11 
       foreign key (company_id_companies1) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKrthvkrkw4hxhn283xq75lxa5x 
       foreign key (player_id_players1) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKgfo6uvpv3bvysi11bl23p2hiq 
       foreign key (bank_id_banks1) 
       references sv_game.banks 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FK2uktynyetgrdsx83ubyt4qs29 
       foreign key (company_id_companies2) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKc65tcl210hwoghxdvo5g9my8m 
       foreign key (npc_id_npcs1) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FK2frdiq4ofdqmhwnu2vied6p9v 
       foreign key (player_id_players2) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKopljj9ssuoc30ry1a7mwq1kra 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.debts 
       add constraint FKqxtbljltmmksn95m4qjoev936 
       foreign key (bank_id_banks) 
       references sv_game.banks 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKd5c064dh0pa2wht549cb9sd8u 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FK12gou4btbw1bs6wfp7jiutdqx 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKb6rey8v4j2prnbl1nsiwloli5 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.exchange_rate_history 
       add constraint FKjx5bsqpdoigsamd3d7rtorofd 
       foreign key (currency_id_currencies) 
       references sv_game.currencies 
       on delete cascade;

    alter table if exists sv_game.garage_parking 
       add constraint FKtp8df3jelgglta093po3o44nn 
       foreign key (garage_id_garages) 
       references sv_game.garages 
       on delete cascade;

    alter table if exists sv_game.garage_parking 
       add constraint FKd3imjk7gr7jf9mis3gdrm438j 
       foreign key (vehicle_id_vehicles) 
       references sv_game.vehicles 
       on delete set null;

    alter table if exists sv_game.garages 
       add constraint FKdpljwwasu6nxisevhdt2alkp6 
       foreign key (building_id_buildings) 
       references sv_game.buildings 
       on delete restrict;

    alter table if exists sv_game.garages 
       add constraint FKbl3ic5nuwjylw8crmy9ydmk7v 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.jobs 
       add constraint FK1b5sy0anbsi2untb9lwjmefcj 
       foreign key (category_id_job_categories) 
       references sv_game.job_categories 
       on delete restrict;

    alter table if exists sv_game.jobs 
       add constraint FKtecafloh6bl6wtowcfmjwlckl 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.news_events 
       add constraint FK7h9th81fdohmdt8rs7pf3tu2r 
       foreign key (city_id_cities) 
       references sv_game.cities 
       on delete set null;

    alter table if exists sv_game.news_events 
       add constraint FKm56xkkxru1jivb7vhdy35e7x4 
       foreign key (country_id_countries) 
       references sv_game.countries 
       on delete set null;

    alter table if exists sv_game.news_events 
       add constraint FKjj6beencj0sqs3bn7y9tmabyq 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.nfts 
       add constraint FKtpukh60cc0h0eqs8vpi8nxo9s 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.nfts 
       add constraint FK1tqeke9ns7xa0mqs29ppssigb 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete cascade;

    alter table if exists sv_game.nfts 
       add constraint FK2mpuegmp460fd9qqoglb8q7vc 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.npc_stock_holdings 
       add constraint FKd5odir83mlchi5plscr7t8s19 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete cascade;

    alter table if exists sv_game.npc_stock_holdings 
       add constraint FKspi63pcny7jqwr4os93golkop 
       foreign key (stock_id_stocks) 
       references sv_game.stocks 
       on delete cascade;

    alter table if exists sv_game.npcs 
       add constraint FKob89bub3loftatblwp6hqyui4 
       foreign key (city_id_cities) 
       references sv_game.cities 
       on delete set null;

    alter table if exists sv_game.npcs 
       add constraint FKjkoydn7ifemb0brvb9o8p61lo 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.npcs 
       add constraint FKrnmw574r861xh4rxxfi8m14b3 
       foreign key (plot_id_plots) 
       references sv_game.plots 
       on delete set null;

    alter table if exists sv_game.player_attributes 
       add constraint FK1pns89q1q82l8mr7w7vuhfof1 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.player_bank_accounts 
       add constraint FK110v4ggqr56h57tag7lyux8w9 
       foreign key (bank_id_banks) 
       references sv_game.banks 
       on delete restrict;

    alter table if exists sv_game.player_bank_accounts 
       add constraint FKrhpqwwqmsfhusgetbdwuxere2 
       foreign key (currency_id_currencies) 
       references sv_game.currencies 
       on delete restrict;

    alter table if exists sv_game.player_bank_accounts 
       add constraint FKolper7hdyxikhd5eoxkv50h7e 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_career_progress 
       add constraint FKwbnqi0uaslfy2cnc9ow11nav 
       foreign key (path_id_career_paths) 
       references sv_game.career_paths 
       on delete set null;

    alter table if exists sv_game.player_career_progress 
       add constraint FKafqn3bknvum59gahu9225p54x 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_crypto_holdings 
       add constraint FKj1t8wbs2fo2rbhg27ou7p1l6q 
       foreign key (crypto_id_cryptocurrencies) 
       references sv_game.cryptocurrencies 
       on delete cascade;

    alter table if exists sv_game.player_crypto_holdings 
       add constraint FK9qvwu9r65htxk35s0tqkrpf4 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_currency_holdings 
       add constraint FKsr1urdyeby8djplio1204s20 
       foreign key (currency_id_currencies) 
       references sv_game.currencies 
       on delete cascade;

    alter table if exists sv_game.player_currency_holdings 
       add constraint FKw8pw51tibm4mbo9899pmr3fl 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_inventory 
       add constraint FKelb21uoil2s5g0n9qijm2q301 
       foreign key (item_id_items) 
       references sv_game.items 
       on delete restrict;

    alter table if exists sv_game.player_inventory 
       add constraint FKb166j4iorux4nh11xqnce6bvn 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_investments 
       add constraint FK4ndaalb0y85xw4amc5l5cic7i 
       foreign key (opportunity_id_investment_opportunities) 
       references sv_game.investment_opportunities 
       on delete restrict;

    alter table if exists sv_game.player_investments 
       add constraint FKt1sl52kbhbu107vj3vfpx3fxh 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_nft_holdings 
       add constraint FKlsuf0wnqhthndqwnslig9cqce 
       foreign key (nft_id_nfts) 
       references sv_game.nfts 
       on delete cascade;

    alter table if exists sv_game.player_nft_holdings 
       add constraint FK4sqd1orv42g0odi0dx6a0y6e4 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_npc_relationships 
       add constraint FKj1eec75g3eg4bolul2v3wxonr 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete cascade;

    alter table if exists sv_game.player_npc_relationships 
       add constraint FKi7vaw7tbd21wb25d1vd6gglp3 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_skills 
       add constraint FKhydbgbkdkll86f7dadbnns67p 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_skills 
       add constraint FK3v1ionoiwfqkqhpn78or43x4m 
       foreign key (skill_id_skills) 
       references sv_game.skills 
       on delete restrict;

    alter table if exists sv_game.player_status_effects 
       add constraint FKhs2w2fejcmmwpvd9h16fwqid5 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_stock_holdings 
       add constraint FK19vns04swoyp8vmclk4yfjuyr 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_stock_holdings 
       add constraint FKaioj2l1vrdiqalgfeujallpaa 
       foreign key (stock_id_stocks) 
       references sv_game.stocks 
       on delete cascade;

    alter table if exists sv_game.players 
       add constraint FK470a3pox856ynx6amiaxk7r2w 
       foreign key (city_id_cities) 
       references sv_game.cities 
       on delete restrict;

    alter table if exists sv_game.players 
       add constraint FKglekn1d8fmwrx3f4he2rrswdp 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.players 
       add constraint FKeo3cccb1rw2iai7ede56vk1e6 
       foreign key (job_id_jobs) 
       references sv_game.jobs 
       on delete set null;

    alter table if exists sv_game.players 
       add constraint FK8i0fmgdxpjlhjbsx3lm3tvefr 
       foreign key (plot_id_plots) 
       references sv_game.plots 
       on delete set null;

    alter table if exists sv_game.plots 
       add constraint FKtg1jw8x0cvje2x12qfq95a4w4 
       foreign key (building_id_buildings) 
       references sv_game.buildings 
       on delete set null;

    alter table if exists sv_game.plots 
       add constraint FKgq36msv8mstmgn41r41n5j7n4 
       foreign key (city_id_cities) 
       references sv_game.cities 
       on delete cascade;

    alter table if exists sv_game.plots 
       add constraint FKiip7oclybvedms00hp7odm2e4 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.plots 
       add constraint FKgs1p2fdahvh2arnw8b5i3rbjn 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.plots 
       add constraint FK4ic6ga8g4rr8oi2mx78oie4pb 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.products 
       add constraint FKgri9ydog2re8fd4mqoglhgxq3 
       foreign key (category_id_business_categories) 
       references sv_game.business_categories 
       on delete restrict;

    alter table if exists sv_game.products 
       add constraint FKo9d40w63d95ken7unvgl29777 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete cascade;

    alter table if exists sv_game.roosters 
       add constraint FKe1oo71xedprthp152yuh1ph5a 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.roosters 
       add constraint FK2r0quvhcf37cpjo61g20d888y 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.roosters 
       add constraint FKojlu0jctyx8lm6do0g0adh98w 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.roosters 
       add constraint FK7nwv4qeee2q66302evkg87vvq 
       foreign key (plot_id_plots) 
       references sv_game.plots 
       on delete set null;

    alter table if exists sv_game.states 
       add constraint FKsr3xajspbtb3ax0kv3awl0m36 
       foreign key (country_id_countries) 
       references sv_game.countries 
       on delete cascade;

    alter table if exists sv_game.stock_price_history 
       add constraint FKcktx49vdf2r4l97680q5n0r14 
       foreign key (stock_id_stocks) 
       references sv_game.stocks 
       on delete cascade;

    alter table if exists sv_game.stocks 
       add constraint FKld8wa553b25iqu9d85v30q3yo 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.stocks 
       add constraint FKmntcivtb5ydv9w935kececlnk 
       foreign key (market_id_stock_markets) 
       references sv_game.stock_markets 
       on delete restrict;

    alter table if exists sv_game.transactions 
       add constraint FKg9s9tn0iu7p6w5dpwnhhev7v5 
       foreign key (account_id_player_bank_accounts) 
       references sv_game.player_bank_accounts 
       on delete set null;

    alter table if exists sv_game.transactions 
       add constraint FK6sidjgxmloqpsceecsegxmbla 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete cascade;

    alter table if exists sv_game.transactions 
       add constraint FKc8hqlprwvvxj2l74pn0mmolxb 
       foreign key (currency_id_currencies) 
       references sv_game.currencies 
       on delete restrict;

    alter table if exists sv_game.transactions 
       add constraint FK5kxpgv6hdu17lvouy94gqgolg 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.vehicles 
       add constraint FKk06nrxm8sp2wjn2uaf80algvb 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.vehicles 
       add constraint FKl5f2o3u0e5plo4vfw3f4at1bd 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.vehicles 
       add constraint FKrak56p5u7ey4gude78exdqns9 
       foreign key (garage_id_garages) 
       references sv_game.garages 
       on delete set null;

    alter table if exists sv_game.vehicles 
       add constraint FKpdm8v9iqaj0enw5d13tn8takq 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.vehicles 
       add constraint FKb6glpoql8vkpdujp5255ft1la 
       foreign key (plot_id_plots) 
       references sv_game.plots 
       on delete set null;

    alter table if exists sv_game.vehicles 
       add constraint FK9ki55d9lcd53tbrn3p359knec 
       foreign key (vehicletype_id_vehicletypes) 
       references sv_game.vehicletypes 
       on delete restrict;

    alter table if exists sv_game.vehicletypes 
       add constraint FKc5oah51n6hensi8afvm3s0fiu 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists banks_current_owner_debts 
       add constraint FK37lmb9vcyljhpu09sy0xyqhsu 
       foreign key (current_owner_debts_debt_id) 
       references sv_game.debts;

    alter table if exists banks_current_owner_debts 
       add constraint FKcgmup11310ufo013lsr3rlftj 
       foreign key (bank_bank_id) 
       references sv_game.banks;

    alter table if exists banks_lender_debts 
       add constraint FK4k8vvsbl8qjnawfthmqrpyku1 
       foreign key (lender_debts_debt_id) 
       references sv_game.debts;

    alter table if exists banks_lender_debts 
       add constraint FKag301ygledx68bxsbq3xi7vlm 
       foreign key (bank_bank_id) 
       references sv_game.banks;

    alter table if exists companies_borrower_debts 
       add constraint FKel91o1cywtlg07ytv1xgmrrs0 
       foreign key (borrower_debts_debt_id) 
       references sv_game.debts;

    alter table if exists companies_borrower_debts 
       add constraint FKf6mx11foobfp2ojk9fcxrkx3f 
       foreign key (company_company_id) 
       references sv_game.companies;

    alter table if exists companies_current_owner_debts 
       add constraint FKawd0h3atl3r6f7iqg16r1fjw6 
       foreign key (current_owner_debts_debt_id) 
       references sv_game.debts;

    alter table if exists companies_current_owner_debts 
       add constraint FKk5bgw06sfwdjm02ah8b8na23p 
       foreign key (company_company_id) 
       references sv_game.companies;

    alter table if exists companies_lender_debts 
       add constraint FK2pmvyknp7jt61i82f8wx6lrwa 
       foreign key (lender_debts_debt_id) 
       references sv_game.debts;

    alter table if exists companies_lender_debts 
       add constraint FKtiyiqmp9hgjeke02wuhdb4uvo 
       foreign key (company_company_id) 
       references sv_game.companies;

    alter table if exists npcs_current_owner_debts 
       add constraint FKhbmkv3686p02vys523213c5xl 
       foreign key (current_owner_debts_debt_id) 
       references sv_game.debts;

    alter table if exists npcs_current_owner_debts 
       add constraint FK67vacw4x9b7xruhyv83w4n6tb 
       foreign key (npc_npc_id) 
       references sv_game.npcs;

    alter table if exists npcs_lender_debts 
       add constraint FK5fe23xglul0y1fx5d3s7i9yin 
       foreign key (lender_debts_debt_id) 
       references sv_game.debts;

    alter table if exists npcs_lender_debts 
       add constraint FKba84g1xkqkfwnxgsg2buh3hwd 
       foreign key (npc_npc_id) 
       references sv_game.npcs;

    alter table if exists players_borrower_debts 
       add constraint FKquopy2rg1uo2l1ae1n6ffiu0v 
       foreign key (borrower_debts_debt_id) 
       references sv_game.debts;

    alter table if exists players_borrower_debts 
       add constraint FK8ke87wbo8oqf4pxqmfovug2f2 
       foreign key (player_player_id) 
       references sv_game.players;

    alter table if exists players_current_owner_debts 
       add constraint FKn1h1o93c3r8f101mf53o6ylfy 
       foreign key (current_owner_debts_debt_id) 
       references sv_game.debts;

    alter table if exists players_current_owner_debts 
       add constraint FKdvljaamut8swalyq49qy53q0x 
       foreign key (player_player_id) 
       references sv_game.players;

    alter table if exists players_lender_debts 
       add constraint FKg5xjq5knal99mk24g7wog1dxc 
       foreign key (lender_debts_debt_id) 
       references sv_game.debts;

    alter table if exists players_lender_debts 
       add constraint FK9jb0i0t91w5eodrek9gx2gm58 
       foreign key (player_player_id) 
       references sv_game.players;

    create table sv_game.bank_account_transactions (
        amount numeric(32,2) not null,
        transaction_date timestamp(6) with time zone not null,
        account_id_player_bank_accounts uuid,
        bank_transaction_id uuid not null,
        transaction_type varchar(100) not null,
        description text not null,
        primary key (bank_transaction_id)
    );

    create table sv_game.banks (
        deposit_interest_rate numeric(5,4) default 0.00 not null,
        is_player_bank boolean default false not null,
        loan_interest_rate numeric(5,4) default 0.00 not null,
        monthly_account_fee numeric(10,2) default 0.00 not null,
        reputation integer default 500 not null,
        stability_index numeric(5,2) default 100.00 not null,
        transaction_fee_rate numeric(5,4) default 0.00 not null,
        bank_id uuid not null,
        country_id_countries uuid,
        player_id_players uuid,
        name varchar(255) not null,
        primary key (bank_id)
    );

    create table sv_game.bets (
        amount_bet numeric(16,2) not null,
        outcome_amount numeric(16,2) not null,
        bet_date timestamp(6) with time zone not null,
        bet_id uuid not null,
        cockfight_id_cockfights uuid,
        debt_id_debts uuid,
        player_id_players uuid,
        type varchar(100) not null,
        details jsonb not null,
        primary key (bet_id)
    );

    create table sv_game.buildings (
        capacity integer not null,
        condition_percentage integer default 100 not null,
        construction_cost numeric(32,2) not null,
        current_value numeric(32,2) not null,
        is_company_headquarters boolean default false not null,
        is_player_home boolean default false not null,
        maintenance_cost_per_month numeric(16,2) not null,
        rent_per_month numeric(5,2) not null,
        upgrade_level integer default 0 not null,
        building_id uuid not null,
        company_id_companies uuid,
        npc_id_npcs uuid,
        player_id_players uuid,
        building_type varchar(100) not null,
        customization_data jsonb not null,
        primary key (building_id)
    );

    create table sv_game.business_categories (
        category_id uuid not null,
        name varchar(255) not null,
        description text,
        primary key (category_id)
    );

    create table sv_game.career_paths (
        path_id uuid not null,
        related_attribute varchar(50) not null,
        name varchar(255) not null,
        description text not null,
        primary key (path_id)
    );

    create table sv_game.cities (
        cost_of_living_index numeric(5,2) not null,
        local_crime_rate numeric(5,2) not null,
        size_modifier numeric(5,2) not null,
        unemployment_rate numeric(5,2) not null,
        population bigint not null,
        city_id uuid not null,
        state_id_states uuid,
        city_type varchar(100) not null,
        name varchar(255) not null,
        procedural_seed varchar(255),
        generated_map_layout jsonb not null,
        map_config_data jsonb not null,
        primary key (city_id)
    );

    create table sv_game.cockfights (
        loser_died boolean,
        date_time timestamp(6) with time zone not null,
        building_id_buildings uuid,
        cockfight_id uuid not null,
        game_id_games uuid,
        rooster_id_roosters uuid,
        rooster_id_roosters1 uuid,
        outcome varchar(50),
        status varchar(50) default 'Scheduled' not null,
        primary key (cockfight_id)
    );

    create table sv_game.companies (
        cash_balance numeric(32,2) default 0.00 not null,
        founding_date date not null,
        growth_rate numeric(5,2) not null,
        is_publicly_traded boolean default false not null,
        market_share numeric(5,2) default 0.00 not null,
        marketing_level integer default 0 not null,
        net_worth numeric(32,2) not null,
        production_capacity integer not null,
        r_and_d_level integer default 0 not null,
        reputation integer default 500 not null,
        category_id_business_categories uuid,
        company_id uuid not null,
        npc_id_npcs uuid,
        player_id_players uuid,
        name varchar(255) not null,
        primary key (company_id)
    );

    create table sv_game.company_buildings (
        is_active boolean default true not null,
        building_id_buildings uuid,
        company_building_id uuid not null,
        company_id_companies uuid,
        role varchar(100) not null,
        primary key (company_building_id)
    );

    create table sv_game.company_financial_history (
        employees_count integer not null,
        expenses numeric(32,2) not null,
        net_worth_snapshot numeric(32,2) not null,
        profit numeric(32,2) not null,
        record_date date not null,
        revenue numeric(32,2) not null,
        company_id_companies uuid,
        record_id uuid not null,
        primary key (record_id)
    );

    create table sv_game.company_hqs (
        building_id_buildings uuid unique,
        company_hq_id uuid not null,
        company_id_companies uuid unique,
        primary key (company_hq_id)
    );

    create table sv_game.countries (
        base_tax_rate numeric(5,2) not null,
        business_tax_rate numeric(5,2) not null,
        corruption_level numeric(5,2) not null,
        crime_rate_modifier numeric(5,2) not null,
        growth_potential numeric(5,2) not null,
        import_export_duty numeric(5,2) not null,
        stability_index numeric(5,2) not null,
        country_id uuid not null,
        currency_id_currencies uuid,
        economic_system varchar(100) not null,
        law_system varchar(100) not null,
        name varchar(255) not null,
        primary key (country_id)
    );

    create table sv_game.courses (
        cost numeric(16,2) not null,
        duration_days integer not null,
        course_id uuid not null,
        institution_id_education_institutions uuid,
        skill_id_skills uuid,
        related_attribute varchar(50) not null,
        name varchar(255) not null,
        description text not null,
        primary key (course_id)
    );

    create table sv_game.crypto_price_history (
        price numeric(16,2) not null,
        record_time timestamp(6) with time zone not null,
        crypto_id_cryptocurrencies uuid,
        history_id uuid not null,
        primary key (history_id)
    );

    create table sv_game.cryptocurrencies (
        current_price numeric(16,2) not null,
        mining_difficulty numeric(16,2) not null,
        volatility numeric(5,2) not null,
        circulating_supply bigint not null,
        supply_limit bigint,
        symbol varchar(10) not null,
        crypto_id uuid not null,
        name varchar(255) not null,
        primary key (crypto_id)
    );

    create table sv_game.currencies (
        exchange_rate_to_base_currency numeric(16,2) not null,
        iso_code varchar(3) not null,
        volatility numeric(5,2) not null,
        symbol varchar(10) not null,
        currency_id uuid not null,
        name varchar(255) not null,
        primary key (currency_id)
    );

    create table sv_game.debt_collateral (
        collateral_value_at_loan_time numeric(32,2) not null,
        is_currently_held boolean not null,
        collateral_entity_id uuid not null,
        debt_collateral_id uuid not null,
        debt_id_debts uuid,
        collateral_type varchar(50) not null,
        primary key (debt_collateral_id)
    );

    create table sv_game.debts (
        current_debt numeric(32,2),
        interest_rate numeric(5,4) not null,
        minimum_next_payment_amount numeric(32,2),
        original_value numeric(32,2) not null,
        end_date timestamp(6) with time zone not null,
        next_payment_date timestamp(6) with time zone,
        start_date timestamp(6) with time zone not null,
        bank_id_banks uuid,
        bank_id_banks1 uuid,
        company_id_companies uuid,
        company_id_companies1 uuid,
        company_id_companies2 uuid,
        debt_id uuid not null,
        game_id_games uuid,
        npc_id_npcs uuid,
        npc_id_npcs1 uuid,
        player_id_players uuid,
        player_id_players1 uuid,
        player_id_players2 uuid,
        debt_type varchar(50) default 'Loan' not null,
        payment_frequency varchar(50) not null,
        status varchar(50) default 'Active' not null,
        primary key (debt_id)
    );

    create table sv_game.education_institutions (
        institution_id uuid not null,
        type varchar(100) not null,
        name varchar(255) not null,
        primary key (institution_id)
    );

    create table sv_game.exchange_rate_history (
        exchange_rate numeric(16,4) not null,
        record_time timestamp(6) with time zone not null,
        currency_id_currencies uuid,
        history_id uuid not null,
        primary key (history_id)
    );

    create table sv_game.games (
        game_speed_multiplier numeric(3,1) default 1.0 not null,
        current_date_time timestamp(6) with time zone,
        last_save_time timestamp(6) with time zone,
        game_id uuid not null,
        game_name varchar(255) not null,
        primary key (game_id)
    );

    create table sv_game.garage_parking (
        garage_id_garages uuid,
        garage_parking_id uuid not null,
        vehicle_id_vehicles uuid unique,
        parking_spot_number varchar(50),
        primary key (garage_parking_id)
    );

    create table sv_game.garages (
        available_slots integer not null,
        total_slots integer not null,
        building_id_buildings uuid unique,
        game_id_games uuid,
        garage_id uuid not null,
        slot_size_type varchar(50) not null,
        primary key (garage_id)
    );

    create table sv_game.investment_opportunities (
        duration_days integer not null,
        end_date date not null,
        expected_return_max numeric(5,2) not null,
        expected_return_min numeric(5,2) not null,
        is_active boolean default true not null,
        max_investment numeric(32,2) not null,
        min_investment numeric(32,2) not null,
        risk_level numeric(5,2) not null,
        start_date date not null,
        opportunity_id uuid not null,
        name varchar(255) not null,
        description text not null,
        primary key (opportunity_id)
    );

    create table sv_game.items (
        value numeric(16,2) not null,
        item_id uuid not null,
        type varchar(100) not null,
        name varchar(255) not null,
        description text not null,
        effect_data jsonb not null,
        primary key (item_id)
    );

    create table sv_game.job_categories (
        category_id uuid not null,
        name varchar(255) not null,
        primary key (category_id)
    );

    create table sv_game.jobs (
        base_salary_per_day numeric(16,2) not null,
        is_available boolean default true not null,
        required_charisma integer not null,
        required_education_score integer not null,
        required_intelligence integer not null,
        required_strength integer not null,
        xp_per_day integer not null,
        category_id_job_categories uuid,
        company_id_companies uuid,
        job_id uuid not null,
        required_education_level varchar(100) not null,
        title varchar(255) not null,
        primary key (job_id)
    );

    create table sv_game.news_events (
        is_global boolean default false not null,
        event_date timestamp(6) with time zone not null,
        city_id_cities uuid,
        country_id_countries uuid,
        event_id uuid not null,
        game_id_games uuid,
        event_type varchar(100) not null,
        title varchar(255) not null,
        description text not null,
        impact_data jsonb not null,
        primary key (event_id)
    );

    create table sv_game.nfts (
        current_value numeric(32,2) not null,
        initial_value numeric(32,2) not null,
        creation_date timestamp(6) with time zone not null,
        game_id_games uuid,
        nft_id uuid not null,
        npc_id_npcs uuid,
        player_id_players uuid,
        contract_address varchar(255),
        image_path varchar(255),
        name varchar(255) not null,
        token_id varchar(255),
        description text,
        generation_params jsonb,
        primary key (nft_id)
    );

    create table sv_game.npc_stock_holdings (
        average_purchase_price numeric(16,2) not null,
        last_updated_time timestamp(6) with time zone not null,
        shares_owned bigint not null,
        holding_id uuid not null,
        npc_id_npcs uuid,
        stock_id_stocks uuid,
        primary key (holding_id)
    );

    create table sv_game.npcs (
        charisma integer not null,
        intelligence integer not null,
        is_essential boolean default false not null,
        karma integer default 500 not null,
        luck integer not null,
        strength integer not null,
        city_id_cities uuid,
        game_id_games uuid,
        npc_id uuid not null,
        plot_id_plots uuid,
        financial_status varchar(50) not null,
        gender varchar(50) not null,
        status varchar(50) default 'Available' not null,
        occupation varchar(100),
        job_title varchar(255),
        name varchar(255) not null,
        appearance_data jsonb,
        notes text,
        personality_traits jsonb,
        primary key (npc_id)
    );

    create table sv_game.player_attributes (
        charisma integer default 1 not null,
        intelligence integer default 1 not null,
        luck integer default 1 not null,
        strength integer default 1 not null,
        last_updated_time timestamp(6) with time zone not null,
        attribute_id uuid not null,
        player_id_players uuid unique,
        primary key (attribute_id)
    );

    create table sv_game.player_bank_accounts (
        balance numeric(32,2) default 0.00 not null,
        is_primary boolean default false not null,
        created_date timestamp(6) with time zone not null,
        last_activity_date timestamp(6) with time zone not null,
        account_id uuid not null,
        bank_id_banks uuid,
        currency_id_currencies uuid,
        player_id_players uuid,
        account_number varchar(50) not null,
        account_type varchar(50) not null,
        primary key (account_id)
    );

    create table sv_game.player_career_progress (
        level integer default 1 not null,
        xp_in_path integer default 0 not null,
        last_level_up_date timestamp(6) with time zone not null,
        path_id_career_paths uuid,
        player_id_players uuid,
        progress_id uuid not null,
        primary key (progress_id)
    );

    create table sv_game.player_crypto_holdings (
        amount numeric(24,8) not null,
        average_purchase_price numeric(16,2) not null,
        last_updated_time timestamp(6) with time zone not null,
        crypto_id_cryptocurrencies uuid,
        holding_id uuid not null,
        player_id_players uuid,
        primary key (holding_id)
    );

    create table sv_game.player_currency_holdings (
        amount numeric(32,2) default 0.00 not null,
        last_updated_time timestamp(6) with time zone not null,
        currency_id_currencies uuid,
        holding_id uuid not null,
        player_id_players uuid,
        primary key (holding_id)
    );

    create table sv_game.player_inventory (
        equipped boolean default false not null,
        quantity integer default 1 not null,
        inventory_id uuid not null,
        item_id_items uuid,
        player_id_players uuid,
        primary key (inventory_id)
    );

    create table sv_game.player_investments (
        actual_return_amount numeric(32,2) not null,
        amount_invested numeric(32,2) not null,
        expected_return_amount numeric(32,2) not null,
        completion_date timestamp(6) with time zone not null,
        investment_date timestamp(6) with time zone not null,
        opportunity_id_investment_opportunities uuid,
        player_id_players uuid,
        player_investment_id uuid not null,
        status varchar(50) not null,
        primary key (player_investment_id)
    );

    create table sv_game.player_nft_holdings (
        acquisition_price numeric(32,2) not null,
        is_listed_for_sale boolean default false not null,
        listing_price numeric(32,2),
        acquisition_date timestamp(6) with time zone not null,
        holding_id uuid not null,
        nft_id_nfts uuid unique,
        player_id_players uuid,
        primary key (holding_id)
    );

    create table sv_game.player_npc_relationships (
        level integer default 0 not null,
        last_interaction_date timestamp(6) with time zone,
        npc_id_npcs uuid,
        player_id_players uuid,
        relationship_id uuid not null,
        relationship_type varchar(50) default 'Neutral' not null,
        primary key (relationship_id)
    );

    create table sv_game.player_skills (
        level integer default 0 not null,
        xp integer default 0 not null,
        last_updated_time timestamp(6) with time zone not null,
        player_id_players uuid,
        player_skill_id uuid not null,
        skill_id_skills uuid,
        primary key (player_skill_id)
    );

    create table sv_game.player_status_effects (
        end_time timestamp(6) with time zone,
        start_time timestamp(6) with time zone not null,
        effect_id uuid not null,
        player_id_players uuid,
        type varchar(100) not null,
        modifier_data jsonb not null,
        primary key (effect_id)
    );

    create table sv_game.player_stock_holdings (
        average_purchase_price numeric(16,2) not null,
        last_updated_time timestamp(6) with time zone not null,
        shares_owned bigint not null,
        holding_id uuid not null,
        player_id_players uuid,
        stock_id_stocks uuid,
        primary key (holding_id)
    );

    create table sv_game.players (
        age integer not null,
        cash_balance numeric(64,2) default 0.00 not null,
        date_of_birth date not null,
        education_score integer default 0 not null,
        energy integer default 100 not null,
        experience_points integer default 0 not null,
        happiness integer default 100 not null,
        health integer default 100 not null,
        karma integer default 500 not null,
        city_id_cities uuid,
        game_id_games uuid,
        job_id_jobs uuid,
        player_id uuid not null,
        plot_id_plots uuid,
        gender varchar(50) not null,
        education_level varchar(100) default 'None' not null,
        name varchar(255) not null,
        appearance_data jsonb not null,
        primary key (player_id)
    );

    create table sv_game.plots (
        current_value numeric(32,2) not null,
        is_available_for_sale boolean default true not null,
        is_empty boolean default true not null,
        purchase_price numeric(32,2) not null,
        last_update_time timestamp(6) with time zone not null,
        building_id_buildings uuid unique,
        city_id_cities uuid,
        company_id_companies uuid,
        npc_id_npcs uuid,
        player_id_players uuid,
        plot_id uuid not null,
        zoning_type varchar(50) default 'Not Zoned' not null,
        primary key (plot_id)
    );

    create table sv_game.products (
        base_production_cost numeric(16,2) not null,
        current_market_price numeric(16,2) not null,
        demand numeric(5,2) not null,
        production_rate_per_day numeric(16,2) not null,
        quality integer default 50 not null,
        supply numeric(5,2) not null,
        category_id_business_categories uuid,
        company_id_companies uuid,
        product_id uuid not null,
        name varchar(255) not null,
        primary key (product_id)
    );

    create table sv_game.roosters (
        age_days integer not null,
        aggression integer not null,
        draw_count integer default 0 not null,
        health integer default 100 not null,
        is_deceased boolean default false not null,
        kill_count integer default 0 not null,
        loss_count integer default 0 not null,
        speed integer not null,
        strength integer not null,
        win_count integer default 0 not null,
        game_id_games uuid,
        npc_id_npcs uuid,
        player_id_players uuid,
        plot_id_plots uuid,
        rooster_id uuid not null,
        status varchar(50) default 'Available' not null,
        name varchar(255) not null,
        primary key (rooster_id)
    );

    create table sv_game.skills (
        skill_id uuid not null,
        related_attribute varchar(50) not null,
        name varchar(255) not null,
        description text not null,
        primary key (skill_id)
    );

    create table sv_game.states (
        additional_regional_tax_rate numeric(5,2) default 0.00 not null,
        country_id_countries uuid,
        state_id uuid not null,
        name varchar(255) not null,
        environmental_regulations_data jsonb not null,
        zoning_regulations_data jsonb not null,
        primary key (state_id)
    );

    create table sv_game.stock_markets (
        closing_time time(6) not null,
        opening_time time(6) not null,
        market_id uuid not null,
        name varchar(255) not null,
        primary key (market_id)
    );

    create table sv_game.stock_price_history (
        price numeric(16,2) not null,
        record_time timestamp(6) with time zone not null,
        volume bigint not null,
        history_id uuid not null,
        stock_id_stocks uuid,
        primary key (history_id)
    );

    create table sv_game.stocks (
        current_price numeric(16,2) not null,
        volatility numeric(5,2) not null,
        last_trade_time timestamp(6) with time zone not null,
        shares_outstanding bigint not null,
        ticker_symbol varchar(10) not null,
        company_id_companies uuid unique,
        market_id_stock_markets uuid,
        stock_id uuid not null,
        primary key (stock_id)
    );

    create table sv_game.transactions (
        amount numeric(32,2) not null,
        transaction_date timestamp(6) with time zone not null,
        account_id_player_bank_accounts uuid,
        company_id_companies uuid,
        currency_id_currencies uuid,
        player_id_players uuid,
        related_entity_id uuid,
        transaction_id uuid not null,
        type varchar(100) not null,
        related_entity_type varchar(255),
        description text not null,
        primary key (transaction_id)
    );

    create table sv_game.vehicles (
        condition_percentage integer default 100 not null,
        current_value numeric(32,2) not null,
        mileage integer default 0 not null,
        purchase_price numeric(32,2) not null,
        company_id_companies uuid,
        game_id_games uuid,
        garage_id_garages uuid,
        player_id_players uuid,
        plot_id_plots uuid,
        vehicle_id uuid not null,
        vehicletype_id_vehicletypes uuid,
        status varchar(50) default 'Parked' not null,
        primary key (vehicle_id)
    );

    create table sv_game.vehicletypes (
        base_price numeric(32,2) not null,
        cargo_capacity integer default 0 not null,
        passenger_capacity integer default 1 not null,
        speed_modifier numeric(5,2) default 1.0 not null,
        work_efficiency_modifier numeric(5,2) default 0.0 not null,
        game_id_games uuid,
        vehicletype_id uuid not null,
        garage_size_needed varchar(50) default 'Small' not null,
        type varchar(50) not null,
        maker varchar(255) not null,
        name varchar(255) not null,
        primary key (vehicletype_id)
    );

    create table banks_current_owner_debts (
        bank_bank_id uuid not null,
        current_owner_debts_debt_id uuid not null unique,
        primary key (bank_bank_id, current_owner_debts_debt_id)
    );

    create table banks_lender_debts (
        bank_bank_id uuid not null,
        lender_debts_debt_id uuid not null unique,
        primary key (bank_bank_id, lender_debts_debt_id)
    );

    create table companies_borrower_debts (
        borrower_debts_debt_id uuid not null unique,
        company_company_id uuid not null,
        primary key (borrower_debts_debt_id, company_company_id)
    );

    create table companies_current_owner_debts (
        company_company_id uuid not null,
        current_owner_debts_debt_id uuid not null unique,
        primary key (company_company_id, current_owner_debts_debt_id)
    );

    create table companies_lender_debts (
        company_company_id uuid not null,
        lender_debts_debt_id uuid not null unique,
        primary key (company_company_id, lender_debts_debt_id)
    );

    create table npcs_current_owner_debts (
        current_owner_debts_debt_id uuid not null unique,
        npc_npc_id uuid not null,
        primary key (current_owner_debts_debt_id, npc_npc_id)
    );

    create table npcs_lender_debts (
        lender_debts_debt_id uuid not null unique,
        npc_npc_id uuid not null,
        primary key (lender_debts_debt_id, npc_npc_id)
    );

    create table players_borrower_debts (
        borrower_debts_debt_id uuid not null unique,
        player_player_id uuid not null,
        primary key (borrower_debts_debt_id, player_player_id)
    );

    create table players_current_owner_debts (
        current_owner_debts_debt_id uuid not null unique,
        player_player_id uuid not null,
        primary key (current_owner_debts_debt_id, player_player_id)
    );

    create table players_lender_debts (
        lender_debts_debt_id uuid not null unique,
        player_player_id uuid not null,
        primary key (lender_debts_debt_id, player_player_id)
    );

    alter table if exists sv_game.bank_account_transactions 
       add constraint FKjb01eotg0k9dmgrwbf5iy0jp5 
       foreign key (account_id_player_bank_accounts) 
       references sv_game.player_bank_accounts 
       on delete cascade;

    alter table if exists sv_game.banks 
       add constraint FK3c1y8dbh15dbkyke4o37mlqcv 
       foreign key (country_id_countries) 
       references sv_game.countries 
       on delete restrict;

    alter table if exists sv_game.banks 
       add constraint FKc3eo422rdf1dmx32h9gsj3n9i 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.bets 
       add constraint FKmwmk5kpqo18s5eivjy1y2a2g1 
       foreign key (cockfight_id_cockfights) 
       references sv_game.cockfights 
       on delete restrict;

    alter table if exists sv_game.bets 
       add constraint FKmgc4gldko9471s6a46yrd4q33 
       foreign key (debt_id_debts) 
       references sv_game.debts 
       on delete cascade;

    alter table if exists sv_game.bets 
       add constraint FKqalc1cmkrs4ms5x6sdtieigdi 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.buildings 
       add constraint FK6ll35noytqm9m9p4mu77tkq3j 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.buildings 
       add constraint FKrspuqr0x2ikm7x0fmvk8yop5e 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.buildings 
       add constraint FKd2elcads83w6kq1yfqegen4yf 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.cities 
       add constraint FK7cf2lydp0qt74d04iwlvmxxpt 
       foreign key (state_id_states) 
       references sv_game.states 
       on delete cascade;

    alter table if exists sv_game.cockfights 
       add constraint FKqlq17pa8t1g7kqnm4r2txdrlw 
       foreign key (building_id_buildings) 
       references sv_game.buildings 
       on delete restrict;

    alter table if exists sv_game.cockfights 
       add constraint FKobfyo1i2fkht9mfnox83bxfom 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.cockfights 
       add constraint FK11gfxu9p38ija1rs705yo9a6y 
       foreign key (rooster_id_roosters) 
       references sv_game.roosters 
       on delete restrict;

    alter table if exists sv_game.cockfights 
       add constraint FK8dx625xuqx70ier5vphpfsifk 
       foreign key (rooster_id_roosters1) 
       references sv_game.roosters 
       on delete restrict;

    alter table if exists sv_game.companies 
       add constraint FKf8lqctukbufq6y5yfnb2o0sb1 
       foreign key (category_id_business_categories) 
       references sv_game.business_categories 
       on delete restrict;

    alter table if exists sv_game.companies 
       add constraint FKs63xtgd7stvh7cemu0iurkhva 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.companies 
       add constraint FKeuj8jtfhs3gy4yukrs1i7ul65 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.company_buildings 
       add constraint FK22y5dr2scnykbr9vv308dgqi2 
       foreign key (building_id_buildings) 
       references sv_game.buildings 
       on delete cascade;

    alter table if exists sv_game.company_buildings 
       add constraint FK13b0p1nd0c4g0o4wa7s2fo4x9 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete cascade;

    alter table if exists sv_game.company_financial_history 
       add constraint FKrce6cputcnj7lnw0ytw6dwfa9 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete cascade;

    alter table if exists sv_game.company_hqs 
       add constraint FKni4c39t7b7wgqhdjejb2vfj10 
       foreign key (building_id_buildings) 
       references sv_game.buildings 
       on delete set null;

    alter table if exists sv_game.company_hqs 
       add constraint FKcc0jfjqq0u3tosilyltd7upoq 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.countries 
       add constraint FK7tf3wkw44cu78c19dsdaoh0mb 
       foreign key (currency_id_currencies) 
       references sv_game.currencies 
       on delete restrict;

    alter table if exists sv_game.courses 
       add constraint FK976vogbjiefw4m97q946y5ltp 
       foreign key (institution_id_education_institutions) 
       references sv_game.education_institutions 
       on delete cascade;

    alter table if exists sv_game.courses 
       add constraint FKrd630g3rc3gmatet898ru74hg 
       foreign key (skill_id_skills) 
       references sv_game.skills 
       on delete restrict;

    alter table if exists sv_game.crypto_price_history 
       add constraint FKnw12acv2fmbw5rwgf9ehepjir 
       foreign key (crypto_id_cryptocurrencies) 
       references sv_game.cryptocurrencies 
       on delete cascade;

    alter table if exists sv_game.debt_collateral 
       add constraint FKk704y8qkd803plv4wtbdww0h5 
       foreign key (debt_id_debts) 
       references sv_game.debts 
       on delete cascade;

    alter table if exists sv_game.debts 
       add constraint FKcs88dspsf64utcuhhyemnyx11 
       foreign key (company_id_companies1) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKrthvkrkw4hxhn283xq75lxa5x 
       foreign key (player_id_players1) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKgfo6uvpv3bvysi11bl23p2hiq 
       foreign key (bank_id_banks1) 
       references sv_game.banks 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FK2uktynyetgrdsx83ubyt4qs29 
       foreign key (company_id_companies2) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKc65tcl210hwoghxdvo5g9my8m 
       foreign key (npc_id_npcs1) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FK2frdiq4ofdqmhwnu2vied6p9v 
       foreign key (player_id_players2) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKopljj9ssuoc30ry1a7mwq1kra 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.debts 
       add constraint FKqxtbljltmmksn95m4qjoev936 
       foreign key (bank_id_banks) 
       references sv_game.banks 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKd5c064dh0pa2wht549cb9sd8u 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FK12gou4btbw1bs6wfp7jiutdqx 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKb6rey8v4j2prnbl1nsiwloli5 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.exchange_rate_history 
       add constraint FKjx5bsqpdoigsamd3d7rtorofd 
       foreign key (currency_id_currencies) 
       references sv_game.currencies 
       on delete cascade;

    alter table if exists sv_game.garage_parking 
       add constraint FKtp8df3jelgglta093po3o44nn 
       foreign key (garage_id_garages) 
       references sv_game.garages 
       on delete cascade;

    alter table if exists sv_game.garage_parking 
       add constraint FKd3imjk7gr7jf9mis3gdrm438j 
       foreign key (vehicle_id_vehicles) 
       references sv_game.vehicles 
       on delete set null;

    alter table if exists sv_game.garages 
       add constraint FKdpljwwasu6nxisevhdt2alkp6 
       foreign key (building_id_buildings) 
       references sv_game.buildings 
       on delete restrict;

    alter table if exists sv_game.garages 
       add constraint FKbl3ic5nuwjylw8crmy9ydmk7v 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.jobs 
       add constraint FK1b5sy0anbsi2untb9lwjmefcj 
       foreign key (category_id_job_categories) 
       references sv_game.job_categories 
       on delete restrict;

    alter table if exists sv_game.jobs 
       add constraint FKtecafloh6bl6wtowcfmjwlckl 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.news_events 
       add constraint FK7h9th81fdohmdt8rs7pf3tu2r 
       foreign key (city_id_cities) 
       references sv_game.cities 
       on delete set null;

    alter table if exists sv_game.news_events 
       add constraint FKm56xkkxru1jivb7vhdy35e7x4 
       foreign key (country_id_countries) 
       references sv_game.countries 
       on delete set null;

    alter table if exists sv_game.news_events 
       add constraint FKjj6beencj0sqs3bn7y9tmabyq 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.nfts 
       add constraint FKtpukh60cc0h0eqs8vpi8nxo9s 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.nfts 
       add constraint FK1tqeke9ns7xa0mqs29ppssigb 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete cascade;

    alter table if exists sv_game.nfts 
       add constraint FK2mpuegmp460fd9qqoglb8q7vc 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.npc_stock_holdings 
       add constraint FKd5odir83mlchi5plscr7t8s19 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete cascade;

    alter table if exists sv_game.npc_stock_holdings 
       add constraint FKspi63pcny7jqwr4os93golkop 
       foreign key (stock_id_stocks) 
       references sv_game.stocks 
       on delete cascade;

    alter table if exists sv_game.npcs 
       add constraint FKob89bub3loftatblwp6hqyui4 
       foreign key (city_id_cities) 
       references sv_game.cities 
       on delete set null;

    alter table if exists sv_game.npcs 
       add constraint FKjkoydn7ifemb0brvb9o8p61lo 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.npcs 
       add constraint FKrnmw574r861xh4rxxfi8m14b3 
       foreign key (plot_id_plots) 
       references sv_game.plots 
       on delete set null;

    alter table if exists sv_game.player_attributes 
       add constraint FK1pns89q1q82l8mr7w7vuhfof1 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.player_bank_accounts 
       add constraint FK110v4ggqr56h57tag7lyux8w9 
       foreign key (bank_id_banks) 
       references sv_game.banks 
       on delete restrict;

    alter table if exists sv_game.player_bank_accounts 
       add constraint FKrhpqwwqmsfhusgetbdwuxere2 
       foreign key (currency_id_currencies) 
       references sv_game.currencies 
       on delete restrict;

    alter table if exists sv_game.player_bank_accounts 
       add constraint FKolper7hdyxikhd5eoxkv50h7e 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_career_progress 
       add constraint FKwbnqi0uaslfy2cnc9ow11nav 
       foreign key (path_id_career_paths) 
       references sv_game.career_paths 
       on delete set null;

    alter table if exists sv_game.player_career_progress 
       add constraint FKafqn3bknvum59gahu9225p54x 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_crypto_holdings 
       add constraint FKj1t8wbs2fo2rbhg27ou7p1l6q 
       foreign key (crypto_id_cryptocurrencies) 
       references sv_game.cryptocurrencies 
       on delete cascade;

    alter table if exists sv_game.player_crypto_holdings 
       add constraint FK9qvwu9r65htxk35s0tqkrpf4 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_currency_holdings 
       add constraint FKsr1urdyeby8djplio1204s20 
       foreign key (currency_id_currencies) 
       references sv_game.currencies 
       on delete cascade;

    alter table if exists sv_game.player_currency_holdings 
       add constraint FKw8pw51tibm4mbo9899pmr3fl 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_inventory 
       add constraint FKelb21uoil2s5g0n9qijm2q301 
       foreign key (item_id_items) 
       references sv_game.items 
       on delete restrict;

    alter table if exists sv_game.player_inventory 
       add constraint FKb166j4iorux4nh11xqnce6bvn 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_investments 
       add constraint FK4ndaalb0y85xw4amc5l5cic7i 
       foreign key (opportunity_id_investment_opportunities) 
       references sv_game.investment_opportunities 
       on delete restrict;

    alter table if exists sv_game.player_investments 
       add constraint FKt1sl52kbhbu107vj3vfpx3fxh 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_nft_holdings 
       add constraint FKlsuf0wnqhthndqwnslig9cqce 
       foreign key (nft_id_nfts) 
       references sv_game.nfts 
       on delete cascade;

    alter table if exists sv_game.player_nft_holdings 
       add constraint FK4sqd1orv42g0odi0dx6a0y6e4 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_npc_relationships 
       add constraint FKj1eec75g3eg4bolul2v3wxonr 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete cascade;

    alter table if exists sv_game.player_npc_relationships 
       add constraint FKi7vaw7tbd21wb25d1vd6gglp3 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_skills 
       add constraint FKhydbgbkdkll86f7dadbnns67p 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_skills 
       add constraint FK3v1ionoiwfqkqhpn78or43x4m 
       foreign key (skill_id_skills) 
       references sv_game.skills 
       on delete restrict;

    alter table if exists sv_game.player_status_effects 
       add constraint FKhs2w2fejcmmwpvd9h16fwqid5 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_stock_holdings 
       add constraint FK19vns04swoyp8vmclk4yfjuyr 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_stock_holdings 
       add constraint FKaioj2l1vrdiqalgfeujallpaa 
       foreign key (stock_id_stocks) 
       references sv_game.stocks 
       on delete cascade;

    alter table if exists sv_game.players 
       add constraint FK470a3pox856ynx6amiaxk7r2w 
       foreign key (city_id_cities) 
       references sv_game.cities 
       on delete restrict;

    alter table if exists sv_game.players 
       add constraint FKglekn1d8fmwrx3f4he2rrswdp 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.players 
       add constraint FKeo3cccb1rw2iai7ede56vk1e6 
       foreign key (job_id_jobs) 
       references sv_game.jobs 
       on delete set null;

    alter table if exists sv_game.players 
       add constraint FK8i0fmgdxpjlhjbsx3lm3tvefr 
       foreign key (plot_id_plots) 
       references sv_game.plots 
       on delete set null;

    alter table if exists sv_game.plots 
       add constraint FKtg1jw8x0cvje2x12qfq95a4w4 
       foreign key (building_id_buildings) 
       references sv_game.buildings 
       on delete set null;

    alter table if exists sv_game.plots 
       add constraint FKgq36msv8mstmgn41r41n5j7n4 
       foreign key (city_id_cities) 
       references sv_game.cities 
       on delete cascade;

    alter table if exists sv_game.plots 
       add constraint FKiip7oclybvedms00hp7odm2e4 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.plots 
       add constraint FKgs1p2fdahvh2arnw8b5i3rbjn 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.plots 
       add constraint FK4ic6ga8g4rr8oi2mx78oie4pb 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.products 
       add constraint FKgri9ydog2re8fd4mqoglhgxq3 
       foreign key (category_id_business_categories) 
       references sv_game.business_categories 
       on delete restrict;

    alter table if exists sv_game.products 
       add constraint FKo9d40w63d95ken7unvgl29777 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete cascade;

    alter table if exists sv_game.roosters 
       add constraint FKe1oo71xedprthp152yuh1ph5a 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.roosters 
       add constraint FK2r0quvhcf37cpjo61g20d888y 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.roosters 
       add constraint FKojlu0jctyx8lm6do0g0adh98w 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.roosters 
       add constraint FK7nwv4qeee2q66302evkg87vvq 
       foreign key (plot_id_plots) 
       references sv_game.plots 
       on delete set null;

    alter table if exists sv_game.states 
       add constraint FKsr3xajspbtb3ax0kv3awl0m36 
       foreign key (country_id_countries) 
       references sv_game.countries 
       on delete cascade;

    alter table if exists sv_game.stock_price_history 
       add constraint FKcktx49vdf2r4l97680q5n0r14 
       foreign key (stock_id_stocks) 
       references sv_game.stocks 
       on delete cascade;

    alter table if exists sv_game.stocks 
       add constraint FKld8wa553b25iqu9d85v30q3yo 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.stocks 
       add constraint FKmntcivtb5ydv9w935kececlnk 
       foreign key (market_id_stock_markets) 
       references sv_game.stock_markets 
       on delete restrict;

    alter table if exists sv_game.transactions 
       add constraint FKg9s9tn0iu7p6w5dpwnhhev7v5 
       foreign key (account_id_player_bank_accounts) 
       references sv_game.player_bank_accounts 
       on delete set null;

    alter table if exists sv_game.transactions 
       add constraint FK6sidjgxmloqpsceecsegxmbla 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete cascade;

    alter table if exists sv_game.transactions 
       add constraint FKc8hqlprwvvxj2l74pn0mmolxb 
       foreign key (currency_id_currencies) 
       references sv_game.currencies 
       on delete restrict;

    alter table if exists sv_game.transactions 
       add constraint FK5kxpgv6hdu17lvouy94gqgolg 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.vehicles 
       add constraint FKk06nrxm8sp2wjn2uaf80algvb 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.vehicles 
       add constraint FKl5f2o3u0e5plo4vfw3f4at1bd 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.vehicles 
       add constraint FKrak56p5u7ey4gude78exdqns9 
       foreign key (garage_id_garages) 
       references sv_game.garages 
       on delete set null;

    alter table if exists sv_game.vehicles 
       add constraint FKpdm8v9iqaj0enw5d13tn8takq 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.vehicles 
       add constraint FKb6glpoql8vkpdujp5255ft1la 
       foreign key (plot_id_plots) 
       references sv_game.plots 
       on delete set null;

    alter table if exists sv_game.vehicles 
       add constraint FK9ki55d9lcd53tbrn3p359knec 
       foreign key (vehicletype_id_vehicletypes) 
       references sv_game.vehicletypes 
       on delete restrict;

    alter table if exists sv_game.vehicletypes 
       add constraint FKc5oah51n6hensi8afvm3s0fiu 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists banks_current_owner_debts 
       add constraint FK37lmb9vcyljhpu09sy0xyqhsu 
       foreign key (current_owner_debts_debt_id) 
       references sv_game.debts;

    alter table if exists banks_current_owner_debts 
       add constraint FKcgmup11310ufo013lsr3rlftj 
       foreign key (bank_bank_id) 
       references sv_game.banks;

    alter table if exists banks_lender_debts 
       add constraint FK4k8vvsbl8qjnawfthmqrpyku1 
       foreign key (lender_debts_debt_id) 
       references sv_game.debts;

    alter table if exists banks_lender_debts 
       add constraint FKag301ygledx68bxsbq3xi7vlm 
       foreign key (bank_bank_id) 
       references sv_game.banks;

    alter table if exists companies_borrower_debts 
       add constraint FKel91o1cywtlg07ytv1xgmrrs0 
       foreign key (borrower_debts_debt_id) 
       references sv_game.debts;

    alter table if exists companies_borrower_debts 
       add constraint FKf6mx11foobfp2ojk9fcxrkx3f 
       foreign key (company_company_id) 
       references sv_game.companies;

    alter table if exists companies_current_owner_debts 
       add constraint FKawd0h3atl3r6f7iqg16r1fjw6 
       foreign key (current_owner_debts_debt_id) 
       references sv_game.debts;

    alter table if exists companies_current_owner_debts 
       add constraint FKk5bgw06sfwdjm02ah8b8na23p 
       foreign key (company_company_id) 
       references sv_game.companies;

    alter table if exists companies_lender_debts 
       add constraint FK2pmvyknp7jt61i82f8wx6lrwa 
       foreign key (lender_debts_debt_id) 
       references sv_game.debts;

    alter table if exists companies_lender_debts 
       add constraint FKtiyiqmp9hgjeke02wuhdb4uvo 
       foreign key (company_company_id) 
       references sv_game.companies;

    alter table if exists npcs_current_owner_debts 
       add constraint FKhbmkv3686p02vys523213c5xl 
       foreign key (current_owner_debts_debt_id) 
       references sv_game.debts;

    alter table if exists npcs_current_owner_debts 
       add constraint FK67vacw4x9b7xruhyv83w4n6tb 
       foreign key (npc_npc_id) 
       references sv_game.npcs;

    alter table if exists npcs_lender_debts 
       add constraint FK5fe23xglul0y1fx5d3s7i9yin 
       foreign key (lender_debts_debt_id) 
       references sv_game.debts;

    alter table if exists npcs_lender_debts 
       add constraint FKba84g1xkqkfwnxgsg2buh3hwd 
       foreign key (npc_npc_id) 
       references sv_game.npcs;

    alter table if exists players_borrower_debts 
       add constraint FKquopy2rg1uo2l1ae1n6ffiu0v 
       foreign key (borrower_debts_debt_id) 
       references sv_game.debts;

    alter table if exists players_borrower_debts 
       add constraint FK8ke87wbo8oqf4pxqmfovug2f2 
       foreign key (player_player_id) 
       references sv_game.players;

    alter table if exists players_current_owner_debts 
       add constraint FKn1h1o93c3r8f101mf53o6ylfy 
       foreign key (current_owner_debts_debt_id) 
       references sv_game.debts;

    alter table if exists players_current_owner_debts 
       add constraint FKdvljaamut8swalyq49qy53q0x 
       foreign key (player_player_id) 
       references sv_game.players;

    alter table if exists players_lender_debts 
       add constraint FKg5xjq5knal99mk24g7wog1dxc 
       foreign key (lender_debts_debt_id) 
       references sv_game.debts;

    alter table if exists players_lender_debts 
       add constraint FK9jb0i0t91w5eodrek9gx2gm58 
       foreign key (player_player_id) 
       references sv_game.players;

    create table sv_game.bank_account_transactions (
        amount numeric(32,2) not null,
        transaction_date timestamp(6) with time zone not null,
        account_id_player_bank_accounts uuid,
        bank_transaction_id uuid not null,
        transaction_type varchar(100) not null,
        description text not null,
        primary key (bank_transaction_id)
    );

    create table sv_game.banks (
        deposit_interest_rate numeric(5,4) default 0.00 not null,
        is_player_bank boolean default false not null,
        loan_interest_rate numeric(5,4) default 0.00 not null,
        monthly_account_fee numeric(10,2) default 0.00 not null,
        reputation integer default 500 not null,
        stability_index numeric(5,2) default 100.00 not null,
        transaction_fee_rate numeric(5,4) default 0.00 not null,
        bank_id uuid not null,
        country_id_countries uuid,
        player_id_players uuid,
        name varchar(255) not null,
        primary key (bank_id)
    );

    create table sv_game.bets (
        amount_bet numeric(16,2) not null,
        outcome_amount numeric(16,2) not null,
        bet_date timestamp(6) with time zone not null,
        bet_id uuid not null,
        cockfight_id_cockfights uuid,
        debt_id_debts uuid,
        player_id_players uuid,
        type varchar(100) not null,
        details jsonb not null,
        primary key (bet_id)
    );

    create table sv_game.buildings (
        capacity integer not null,
        condition_percentage integer default 100 not null,
        construction_cost numeric(32,2) not null,
        current_value numeric(32,2) not null,
        is_company_headquarters boolean default false not null,
        is_player_home boolean default false not null,
        maintenance_cost_per_month numeric(16,2) not null,
        rent_per_month numeric(5,2) not null,
        upgrade_level integer default 0 not null,
        building_id uuid not null,
        company_id_companies uuid,
        npc_id_npcs uuid,
        player_id_players uuid,
        building_type varchar(100) not null,
        customization_data jsonb not null,
        primary key (building_id)
    );

    create table sv_game.business_categories (
        category_id uuid not null,
        name varchar(255) not null,
        description text,
        primary key (category_id)
    );

    create table sv_game.career_paths (
        path_id uuid not null,
        related_attribute varchar(50) not null,
        name varchar(255) not null,
        description text not null,
        primary key (path_id)
    );

    create table sv_game.cities (
        cost_of_living_index numeric(5,2) not null,
        local_crime_rate numeric(5,2) not null,
        size_modifier numeric(5,2) not null,
        unemployment_rate numeric(5,2) not null,
        population bigint not null,
        city_id uuid not null,
        state_id_states uuid,
        city_type varchar(100) not null,
        name varchar(255) not null,
        procedural_seed varchar(255),
        generated_map_layout jsonb not null,
        map_config_data jsonb not null,
        primary key (city_id)
    );

    create table sv_game.cockfights (
        loser_died boolean,
        date_time timestamp(6) with time zone not null,
        building_id_buildings uuid,
        cockfight_id uuid not null,
        game_id_games uuid,
        rooster_id_roosters uuid,
        rooster_id_roosters1 uuid,
        outcome varchar(50),
        status varchar(50) default 'Scheduled' not null,
        primary key (cockfight_id)
    );

    create table sv_game.companies (
        cash_balance numeric(32,2) default 0.00 not null,
        founding_date date not null,
        growth_rate numeric(5,2) not null,
        is_publicly_traded boolean default false not null,
        market_share numeric(5,2) default 0.00 not null,
        marketing_level integer default 0 not null,
        net_worth numeric(32,2) not null,
        production_capacity integer not null,
        r_and_d_level integer default 0 not null,
        reputation integer default 500 not null,
        category_id_business_categories uuid,
        company_id uuid not null,
        npc_id_npcs uuid,
        player_id_players uuid,
        name varchar(255) not null,
        primary key (company_id)
    );

    create table sv_game.company_buildings (
        is_active boolean default true not null,
        building_id_buildings uuid,
        company_building_id uuid not null,
        company_id_companies uuid,
        role varchar(100) not null,
        primary key (company_building_id)
    );

    create table sv_game.company_financial_history (
        employees_count integer not null,
        expenses numeric(32,2) not null,
        net_worth_snapshot numeric(32,2) not null,
        profit numeric(32,2) not null,
        record_date date not null,
        revenue numeric(32,2) not null,
        company_id_companies uuid,
        record_id uuid not null,
        primary key (record_id)
    );

    create table sv_game.company_hqs (
        building_id_buildings uuid unique,
        company_hq_id uuid not null,
        company_id_companies uuid unique,
        primary key (company_hq_id)
    );

    create table sv_game.countries (
        base_tax_rate numeric(5,2) not null,
        business_tax_rate numeric(5,2) not null,
        corruption_level numeric(5,2) not null,
        crime_rate_modifier numeric(5,2) not null,
        growth_potential numeric(5,2) not null,
        import_export_duty numeric(5,2) not null,
        stability_index numeric(5,2) not null,
        country_id uuid not null,
        currency_id_currencies uuid,
        economic_system varchar(100) not null,
        law_system varchar(100) not null,
        name varchar(255) not null,
        primary key (country_id)
    );

    create table sv_game.courses (
        cost numeric(16,2) not null,
        duration_days integer not null,
        course_id uuid not null,
        institution_id_education_institutions uuid,
        skill_id_skills uuid,
        related_attribute varchar(50) not null,
        name varchar(255) not null,
        description text not null,
        primary key (course_id)
    );

    create table sv_game.crypto_price_history (
        price numeric(16,2) not null,
        record_time timestamp(6) with time zone not null,
        crypto_id_cryptocurrencies uuid,
        history_id uuid not null,
        primary key (history_id)
    );

    create table sv_game.cryptocurrencies (
        current_price numeric(16,2) not null,
        mining_difficulty numeric(16,2) not null,
        volatility numeric(5,2) not null,
        circulating_supply bigint not null,
        supply_limit bigint,
        symbol varchar(10) not null,
        crypto_id uuid not null,
        name varchar(255) not null,
        primary key (crypto_id)
    );

    create table sv_game.currencies (
        exchange_rate_to_base_currency numeric(16,2) not null,
        iso_code varchar(3) not null,
        volatility numeric(5,2) not null,
        symbol varchar(10) not null,
        currency_id uuid not null,
        name varchar(255) not null,
        primary key (currency_id)
    );

    create table sv_game.debt_collateral (
        collateral_value_at_loan_time numeric(32,2) not null,
        is_currently_held boolean not null,
        collateral_entity_id uuid not null,
        debt_collateral_id uuid not null,
        debt_id_debts uuid,
        collateral_type varchar(50) not null,
        primary key (debt_collateral_id)
    );

    create table sv_game.debts (
        current_debt numeric(32,2),
        interest_rate numeric(5,4) not null,
        minimum_next_payment_amount numeric(32,2),
        original_value numeric(32,2) not null,
        end_date timestamp(6) with time zone not null,
        next_payment_date timestamp(6) with time zone,
        start_date timestamp(6) with time zone not null,
        bank_id_banks uuid,
        bank_id_banks1 uuid,
        company_id_companies uuid,
        company_id_companies1 uuid,
        company_id_companies2 uuid,
        debt_id uuid not null,
        game_id_games uuid,
        npc_id_npcs uuid,
        npc_id_npcs1 uuid,
        player_id_players uuid,
        player_id_players1 uuid,
        player_id_players2 uuid,
        debt_type varchar(50) default 'Loan' not null,
        payment_frequency varchar(50) not null,
        status varchar(50) default 'Active' not null,
        primary key (debt_id)
    );

    create table sv_game.education_institutions (
        institution_id uuid not null,
        type varchar(100) not null,
        name varchar(255) not null,
        primary key (institution_id)
    );

    create table sv_game.exchange_rate_history (
        exchange_rate numeric(16,4) not null,
        record_time timestamp(6) with time zone not null,
        currency_id_currencies uuid,
        history_id uuid not null,
        primary key (history_id)
    );

    create table sv_game.games (
        game_speed_multiplier numeric(3,1) default 1.0 not null,
        current_date_time timestamp(6) with time zone,
        last_save_time timestamp(6) with time zone,
        game_id uuid not null,
        game_name varchar(255) not null,
        primary key (game_id)
    );

    create table sv_game.garage_parking (
        garage_id_garages uuid,
        garage_parking_id uuid not null,
        vehicle_id_vehicles uuid unique,
        parking_spot_number varchar(50),
        primary key (garage_parking_id)
    );

    create table sv_game.garages (
        available_slots integer not null,
        total_slots integer not null,
        building_id_buildings uuid unique,
        game_id_games uuid,
        garage_id uuid not null,
        slot_size_type varchar(50) not null,
        primary key (garage_id)
    );

    create table sv_game.investment_opportunities (
        duration_days integer not null,
        end_date date not null,
        expected_return_max numeric(5,2) not null,
        expected_return_min numeric(5,2) not null,
        is_active boolean default true not null,
        max_investment numeric(32,2) not null,
        min_investment numeric(32,2) not null,
        risk_level numeric(5,2) not null,
        start_date date not null,
        opportunity_id uuid not null,
        name varchar(255) not null,
        description text not null,
        primary key (opportunity_id)
    );

    create table sv_game.items (
        value numeric(16,2) not null,
        item_id uuid not null,
        type varchar(100) not null,
        name varchar(255) not null,
        description text not null,
        effect_data jsonb not null,
        primary key (item_id)
    );

    create table sv_game.job_categories (
        category_id uuid not null,
        name varchar(255) not null,
        primary key (category_id)
    );

    create table sv_game.jobs (
        base_salary_per_day numeric(16,2) not null,
        is_available boolean default true not null,
        required_charisma integer not null,
        required_education_score integer not null,
        required_intelligence integer not null,
        required_strength integer not null,
        xp_per_day integer not null,
        category_id_job_categories uuid,
        company_id_companies uuid,
        job_id uuid not null,
        required_education_level varchar(100) not null,
        title varchar(255) not null,
        primary key (job_id)
    );

    create table sv_game.news_events (
        is_global boolean default false not null,
        event_date timestamp(6) with time zone not null,
        city_id_cities uuid,
        country_id_countries uuid,
        event_id uuid not null,
        game_id_games uuid,
        event_type varchar(100) not null,
        title varchar(255) not null,
        description text not null,
        impact_data jsonb not null,
        primary key (event_id)
    );

    create table sv_game.nfts (
        current_value numeric(32,2) not null,
        initial_value numeric(32,2) not null,
        creation_date timestamp(6) with time zone not null,
        game_id_games uuid,
        nft_id uuid not null,
        npc_id_npcs uuid,
        player_id_players uuid,
        contract_address varchar(255),
        image_path varchar(255),
        name varchar(255) not null,
        token_id varchar(255),
        description text,
        generation_params jsonb,
        primary key (nft_id)
    );

    create table sv_game.npc_stock_holdings (
        average_purchase_price numeric(16,2) not null,
        last_updated_time timestamp(6) with time zone not null,
        shares_owned bigint not null,
        holding_id uuid not null,
        npc_id_npcs uuid,
        stock_id_stocks uuid,
        primary key (holding_id)
    );

    create table sv_game.npcs (
        charisma integer not null,
        intelligence integer not null,
        is_essential boolean default false not null,
        karma integer default 500 not null,
        luck integer not null,
        strength integer not null,
        city_id_cities uuid,
        game_id_games uuid,
        npc_id uuid not null,
        plot_id_plots uuid,
        financial_status varchar(50) not null,
        gender varchar(50) not null,
        status varchar(50) default 'Available' not null,
        occupation varchar(100),
        job_title varchar(255),
        name varchar(255) not null,
        appearance_data jsonb,
        notes text,
        personality_traits jsonb,
        primary key (npc_id)
    );

    create table sv_game.player_attributes (
        charisma integer default 1 not null,
        intelligence integer default 1 not null,
        luck integer default 1 not null,
        strength integer default 1 not null,
        last_updated_time timestamp(6) with time zone not null,
        attribute_id uuid not null,
        player_id_players uuid unique,
        primary key (attribute_id)
    );

    create table sv_game.player_bank_accounts (
        balance numeric(32,2) default 0.00 not null,
        is_primary boolean default false not null,
        created_date timestamp(6) with time zone not null,
        last_activity_date timestamp(6) with time zone not null,
        account_id uuid not null,
        bank_id_banks uuid,
        currency_id_currencies uuid,
        player_id_players uuid,
        account_number varchar(50) not null,
        account_type varchar(50) not null,
        primary key (account_id)
    );

    create table sv_game.player_career_progress (
        level integer default 1 not null,
        xp_in_path integer default 0 not null,
        last_level_up_date timestamp(6) with time zone not null,
        path_id_career_paths uuid,
        player_id_players uuid,
        progress_id uuid not null,
        primary key (progress_id)
    );

    create table sv_game.player_crypto_holdings (
        amount numeric(24,8) not null,
        average_purchase_price numeric(16,2) not null,
        last_updated_time timestamp(6) with time zone not null,
        crypto_id_cryptocurrencies uuid,
        holding_id uuid not null,
        player_id_players uuid,
        primary key (holding_id)
    );

    create table sv_game.player_currency_holdings (
        amount numeric(32,2) default 0.00 not null,
        last_updated_time timestamp(6) with time zone not null,
        currency_id_currencies uuid,
        holding_id uuid not null,
        player_id_players uuid,
        primary key (holding_id)
    );

    create table sv_game.player_inventory (
        equipped boolean default false not null,
        quantity integer default 1 not null,
        inventory_id uuid not null,
        item_id_items uuid,
        player_id_players uuid,
        primary key (inventory_id)
    );

    create table sv_game.player_investments (
        actual_return_amount numeric(32,2) not null,
        amount_invested numeric(32,2) not null,
        expected_return_amount numeric(32,2) not null,
        completion_date timestamp(6) with time zone not null,
        investment_date timestamp(6) with time zone not null,
        opportunity_id_investment_opportunities uuid,
        player_id_players uuid,
        player_investment_id uuid not null,
        status varchar(50) not null,
        primary key (player_investment_id)
    );

    create table sv_game.player_nft_holdings (
        acquisition_price numeric(32,2) not null,
        is_listed_for_sale boolean default false not null,
        listing_price numeric(32,2),
        acquisition_date timestamp(6) with time zone not null,
        holding_id uuid not null,
        nft_id_nfts uuid unique,
        player_id_players uuid,
        primary key (holding_id)
    );

    create table sv_game.player_npc_relationships (
        level integer default 0 not null,
        last_interaction_date timestamp(6) with time zone,
        npc_id_npcs uuid,
        player_id_players uuid,
        relationship_id uuid not null,
        relationship_type varchar(50) default 'Neutral' not null,
        primary key (relationship_id)
    );

    create table sv_game.player_skills (
        level integer default 0 not null,
        xp integer default 0 not null,
        last_updated_time timestamp(6) with time zone not null,
        player_id_players uuid,
        player_skill_id uuid not null,
        skill_id_skills uuid,
        primary key (player_skill_id)
    );

    create table sv_game.player_status_effects (
        end_time timestamp(6) with time zone,
        start_time timestamp(6) with time zone not null,
        effect_id uuid not null,
        player_id_players uuid,
        type varchar(100) not null,
        modifier_data jsonb not null,
        primary key (effect_id)
    );

    create table sv_game.player_stock_holdings (
        average_purchase_price numeric(16,2) not null,
        last_updated_time timestamp(6) with time zone not null,
        shares_owned bigint not null,
        holding_id uuid not null,
        player_id_players uuid,
        stock_id_stocks uuid,
        primary key (holding_id)
    );

    create table sv_game.players (
        age integer not null,
        cash_balance numeric(64,2) default 0.00 not null,
        date_of_birth date not null,
        education_score integer default 0 not null,
        energy integer default 100 not null,
        experience_points integer default 0 not null,
        happiness integer default 100 not null,
        health integer default 100 not null,
        karma integer default 500 not null,
        city_id_cities uuid,
        game_id_games uuid,
        job_id_jobs uuid,
        player_id uuid not null,
        plot_id_plots uuid,
        gender varchar(50) not null,
        education_level varchar(100) default 'None' not null,
        name varchar(255) not null,
        appearance_data jsonb not null,
        primary key (player_id)
    );

    create table sv_game.plots (
        current_value numeric(32,2) not null,
        is_available_for_sale boolean default true not null,
        is_empty boolean default true not null,
        purchase_price numeric(32,2) not null,
        last_update_time timestamp(6) with time zone not null,
        building_id_buildings uuid unique,
        city_id_cities uuid,
        company_id_companies uuid,
        npc_id_npcs uuid,
        player_id_players uuid,
        plot_id uuid not null,
        zoning_type varchar(50) default 'Not Zoned' not null,
        primary key (plot_id)
    );

    create table sv_game.products (
        base_production_cost numeric(16,2) not null,
        current_market_price numeric(16,2) not null,
        demand numeric(5,2) not null,
        production_rate_per_day numeric(16,2) not null,
        quality integer default 50 not null,
        supply numeric(5,2) not null,
        category_id_business_categories uuid,
        company_id_companies uuid,
        product_id uuid not null,
        name varchar(255) not null,
        primary key (product_id)
    );

    create table sv_game.roosters (
        age_days integer not null,
        aggression integer not null,
        draw_count integer default 0 not null,
        health integer default 100 not null,
        is_deceased boolean default false not null,
        kill_count integer default 0 not null,
        loss_count integer default 0 not null,
        speed integer not null,
        strength integer not null,
        win_count integer default 0 not null,
        game_id_games uuid,
        npc_id_npcs uuid,
        player_id_players uuid,
        plot_id_plots uuid,
        rooster_id uuid not null,
        status varchar(50) default 'Available' not null,
        name varchar(255) not null,
        primary key (rooster_id)
    );

    create table sv_game.skills (
        skill_id uuid not null,
        related_attribute varchar(50) not null,
        name varchar(255) not null,
        description text not null,
        primary key (skill_id)
    );

    create table sv_game.states (
        additional_regional_tax_rate numeric(5,2) default 0.00 not null,
        country_id_countries uuid,
        state_id uuid not null,
        name varchar(255) not null,
        environmental_regulations_data jsonb not null,
        zoning_regulations_data jsonb not null,
        primary key (state_id)
    );

    create table sv_game.stock_markets (
        closing_time time(6) not null,
        opening_time time(6) not null,
        market_id uuid not null,
        name varchar(255) not null,
        primary key (market_id)
    );

    create table sv_game.stock_price_history (
        price numeric(16,2) not null,
        record_time timestamp(6) with time zone not null,
        volume bigint not null,
        history_id uuid not null,
        stock_id_stocks uuid,
        primary key (history_id)
    );

    create table sv_game.stocks (
        current_price numeric(16,2) not null,
        volatility numeric(5,2) not null,
        last_trade_time timestamp(6) with time zone not null,
        shares_outstanding bigint not null,
        ticker_symbol varchar(10) not null,
        company_id_companies uuid unique,
        market_id_stock_markets uuid,
        stock_id uuid not null,
        primary key (stock_id)
    );

    create table sv_game.transactions (
        amount numeric(32,2) not null,
        transaction_date timestamp(6) with time zone not null,
        account_id_player_bank_accounts uuid,
        company_id_companies uuid,
        currency_id_currencies uuid,
        player_id_players uuid,
        related_entity_id uuid,
        transaction_id uuid not null,
        type varchar(100) not null,
        related_entity_type varchar(255),
        description text not null,
        primary key (transaction_id)
    );

    create table sv_game.vehicles (
        condition_percentage integer default 100 not null,
        current_value numeric(32,2) not null,
        mileage integer default 0 not null,
        purchase_price numeric(32,2) not null,
        company_id_companies uuid,
        game_id_games uuid,
        garage_id_garages uuid,
        player_id_players uuid,
        plot_id_plots uuid,
        vehicle_id uuid not null,
        vehicletype_id_vehicletypes uuid,
        status varchar(50) default 'Parked' not null,
        primary key (vehicle_id)
    );

    create table sv_game.vehicletypes (
        base_price numeric(32,2) not null,
        cargo_capacity integer default 0 not null,
        passenger_capacity integer default 1 not null,
        speed_modifier numeric(5,2) default 1.0 not null,
        work_efficiency_modifier numeric(5,2) default 0.0 not null,
        game_id_games uuid,
        vehicletype_id uuid not null,
        garage_size_needed varchar(50) default 'Small' not null,
        type varchar(50) not null,
        maker varchar(255) not null,
        name varchar(255) not null,
        primary key (vehicletype_id)
    );

    create table banks_current_owner_debts (
        bank_bank_id uuid not null,
        current_owner_debts_debt_id uuid not null unique,
        primary key (bank_bank_id, current_owner_debts_debt_id)
    );

    create table banks_lender_debts (
        bank_bank_id uuid not null,
        lender_debts_debt_id uuid not null unique,
        primary key (bank_bank_id, lender_debts_debt_id)
    );

    create table companies_borrower_debts (
        borrower_debts_debt_id uuid not null unique,
        company_company_id uuid not null,
        primary key (borrower_debts_debt_id, company_company_id)
    );

    create table companies_current_owner_debts (
        company_company_id uuid not null,
        current_owner_debts_debt_id uuid not null unique,
        primary key (company_company_id, current_owner_debts_debt_id)
    );

    create table companies_lender_debts (
        company_company_id uuid not null,
        lender_debts_debt_id uuid not null unique,
        primary key (company_company_id, lender_debts_debt_id)
    );

    create table npcs_current_owner_debts (
        current_owner_debts_debt_id uuid not null unique,
        npc_npc_id uuid not null,
        primary key (current_owner_debts_debt_id, npc_npc_id)
    );

    create table npcs_lender_debts (
        lender_debts_debt_id uuid not null unique,
        npc_npc_id uuid not null,
        primary key (lender_debts_debt_id, npc_npc_id)
    );

    create table players_borrower_debts (
        borrower_debts_debt_id uuid not null unique,
        player_player_id uuid not null,
        primary key (borrower_debts_debt_id, player_player_id)
    );

    create table players_current_owner_debts (
        current_owner_debts_debt_id uuid not null unique,
        player_player_id uuid not null,
        primary key (current_owner_debts_debt_id, player_player_id)
    );

    create table players_lender_debts (
        lender_debts_debt_id uuid not null unique,
        player_player_id uuid not null,
        primary key (lender_debts_debt_id, player_player_id)
    );

    alter table if exists sv_game.bank_account_transactions 
       add constraint FKjb01eotg0k9dmgrwbf5iy0jp5 
       foreign key (account_id_player_bank_accounts) 
       references sv_game.player_bank_accounts 
       on delete cascade;

    alter table if exists sv_game.banks 
       add constraint FK3c1y8dbh15dbkyke4o37mlqcv 
       foreign key (country_id_countries) 
       references sv_game.countries 
       on delete restrict;

    alter table if exists sv_game.banks 
       add constraint FKc3eo422rdf1dmx32h9gsj3n9i 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.bets 
       add constraint FKmwmk5kpqo18s5eivjy1y2a2g1 
       foreign key (cockfight_id_cockfights) 
       references sv_game.cockfights 
       on delete restrict;

    alter table if exists sv_game.bets 
       add constraint FKmgc4gldko9471s6a46yrd4q33 
       foreign key (debt_id_debts) 
       references sv_game.debts 
       on delete cascade;

    alter table if exists sv_game.bets 
       add constraint FKqalc1cmkrs4ms5x6sdtieigdi 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.buildings 
       add constraint FK6ll35noytqm9m9p4mu77tkq3j 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.buildings 
       add constraint FKrspuqr0x2ikm7x0fmvk8yop5e 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.buildings 
       add constraint FKd2elcads83w6kq1yfqegen4yf 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.cities 
       add constraint FK7cf2lydp0qt74d04iwlvmxxpt 
       foreign key (state_id_states) 
       references sv_game.states 
       on delete cascade;

    alter table if exists sv_game.cockfights 
       add constraint FKqlq17pa8t1g7kqnm4r2txdrlw 
       foreign key (building_id_buildings) 
       references sv_game.buildings 
       on delete restrict;

    alter table if exists sv_game.cockfights 
       add constraint FKobfyo1i2fkht9mfnox83bxfom 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.cockfights 
       add constraint FK11gfxu9p38ija1rs705yo9a6y 
       foreign key (rooster_id_roosters) 
       references sv_game.roosters 
       on delete restrict;

    alter table if exists sv_game.cockfights 
       add constraint FK8dx625xuqx70ier5vphpfsifk 
       foreign key (rooster_id_roosters1) 
       references sv_game.roosters 
       on delete restrict;

    alter table if exists sv_game.companies 
       add constraint FKf8lqctukbufq6y5yfnb2o0sb1 
       foreign key (category_id_business_categories) 
       references sv_game.business_categories 
       on delete restrict;

    alter table if exists sv_game.companies 
       add constraint FKs63xtgd7stvh7cemu0iurkhva 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.companies 
       add constraint FKeuj8jtfhs3gy4yukrs1i7ul65 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.company_buildings 
       add constraint FK22y5dr2scnykbr9vv308dgqi2 
       foreign key (building_id_buildings) 
       references sv_game.buildings 
       on delete cascade;

    alter table if exists sv_game.company_buildings 
       add constraint FK13b0p1nd0c4g0o4wa7s2fo4x9 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete cascade;

    alter table if exists sv_game.company_financial_history 
       add constraint FKrce6cputcnj7lnw0ytw6dwfa9 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete cascade;

    alter table if exists sv_game.company_hqs 
       add constraint FKni4c39t7b7wgqhdjejb2vfj10 
       foreign key (building_id_buildings) 
       references sv_game.buildings 
       on delete set null;

    alter table if exists sv_game.company_hqs 
       add constraint FKcc0jfjqq0u3tosilyltd7upoq 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.countries 
       add constraint FK7tf3wkw44cu78c19dsdaoh0mb 
       foreign key (currency_id_currencies) 
       references sv_game.currencies 
       on delete restrict;

    alter table if exists sv_game.courses 
       add constraint FK976vogbjiefw4m97q946y5ltp 
       foreign key (institution_id_education_institutions) 
       references sv_game.education_institutions 
       on delete cascade;

    alter table if exists sv_game.courses 
       add constraint FKrd630g3rc3gmatet898ru74hg 
       foreign key (skill_id_skills) 
       references sv_game.skills 
       on delete restrict;

    alter table if exists sv_game.crypto_price_history 
       add constraint FKnw12acv2fmbw5rwgf9ehepjir 
       foreign key (crypto_id_cryptocurrencies) 
       references sv_game.cryptocurrencies 
       on delete cascade;

    alter table if exists sv_game.debt_collateral 
       add constraint FKk704y8qkd803plv4wtbdww0h5 
       foreign key (debt_id_debts) 
       references sv_game.debts 
       on delete cascade;

    alter table if exists sv_game.debts 
       add constraint FKcs88dspsf64utcuhhyemnyx11 
       foreign key (company_id_companies1) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKrthvkrkw4hxhn283xq75lxa5x 
       foreign key (player_id_players1) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKgfo6uvpv3bvysi11bl23p2hiq 
       foreign key (bank_id_banks1) 
       references sv_game.banks 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FK2uktynyetgrdsx83ubyt4qs29 
       foreign key (company_id_companies2) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKc65tcl210hwoghxdvo5g9my8m 
       foreign key (npc_id_npcs1) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FK2frdiq4ofdqmhwnu2vied6p9v 
       foreign key (player_id_players2) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKopljj9ssuoc30ry1a7mwq1kra 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.debts 
       add constraint FKqxtbljltmmksn95m4qjoev936 
       foreign key (bank_id_banks) 
       references sv_game.banks 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKd5c064dh0pa2wht549cb9sd8u 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FK12gou4btbw1bs6wfp7jiutdqx 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKb6rey8v4j2prnbl1nsiwloli5 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.exchange_rate_history 
       add constraint FKjx5bsqpdoigsamd3d7rtorofd 
       foreign key (currency_id_currencies) 
       references sv_game.currencies 
       on delete cascade;

    alter table if exists sv_game.garage_parking 
       add constraint FKtp8df3jelgglta093po3o44nn 
       foreign key (garage_id_garages) 
       references sv_game.garages 
       on delete cascade;

    alter table if exists sv_game.garage_parking 
       add constraint FKd3imjk7gr7jf9mis3gdrm438j 
       foreign key (vehicle_id_vehicles) 
       references sv_game.vehicles 
       on delete set null;

    alter table if exists sv_game.garages 
       add constraint FKdpljwwasu6nxisevhdt2alkp6 
       foreign key (building_id_buildings) 
       references sv_game.buildings 
       on delete restrict;

    alter table if exists sv_game.garages 
       add constraint FKbl3ic5nuwjylw8crmy9ydmk7v 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.jobs 
       add constraint FK1b5sy0anbsi2untb9lwjmefcj 
       foreign key (category_id_job_categories) 
       references sv_game.job_categories 
       on delete restrict;

    alter table if exists sv_game.jobs 
       add constraint FKtecafloh6bl6wtowcfmjwlckl 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.news_events 
       add constraint FK7h9th81fdohmdt8rs7pf3tu2r 
       foreign key (city_id_cities) 
       references sv_game.cities 
       on delete set null;

    alter table if exists sv_game.news_events 
       add constraint FKm56xkkxru1jivb7vhdy35e7x4 
       foreign key (country_id_countries) 
       references sv_game.countries 
       on delete set null;

    alter table if exists sv_game.news_events 
       add constraint FKjj6beencj0sqs3bn7y9tmabyq 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.nfts 
       add constraint FKtpukh60cc0h0eqs8vpi8nxo9s 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.nfts 
       add constraint FK1tqeke9ns7xa0mqs29ppssigb 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete cascade;

    alter table if exists sv_game.nfts 
       add constraint FK2mpuegmp460fd9qqoglb8q7vc 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.npc_stock_holdings 
       add constraint FKd5odir83mlchi5plscr7t8s19 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete cascade;

    alter table if exists sv_game.npc_stock_holdings 
       add constraint FKspi63pcny7jqwr4os93golkop 
       foreign key (stock_id_stocks) 
       references sv_game.stocks 
       on delete cascade;

    alter table if exists sv_game.npcs 
       add constraint FKob89bub3loftatblwp6hqyui4 
       foreign key (city_id_cities) 
       references sv_game.cities 
       on delete set null;

    alter table if exists sv_game.npcs 
       add constraint FKjkoydn7ifemb0brvb9o8p61lo 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.npcs 
       add constraint FKrnmw574r861xh4rxxfi8m14b3 
       foreign key (plot_id_plots) 
       references sv_game.plots 
       on delete set null;

    alter table if exists sv_game.player_attributes 
       add constraint FK1pns89q1q82l8mr7w7vuhfof1 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.player_bank_accounts 
       add constraint FK110v4ggqr56h57tag7lyux8w9 
       foreign key (bank_id_banks) 
       references sv_game.banks 
       on delete restrict;

    alter table if exists sv_game.player_bank_accounts 
       add constraint FKrhpqwwqmsfhusgetbdwuxere2 
       foreign key (currency_id_currencies) 
       references sv_game.currencies 
       on delete restrict;

    alter table if exists sv_game.player_bank_accounts 
       add constraint FKolper7hdyxikhd5eoxkv50h7e 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_career_progress 
       add constraint FKwbnqi0uaslfy2cnc9ow11nav 
       foreign key (path_id_career_paths) 
       references sv_game.career_paths 
       on delete set null;

    alter table if exists sv_game.player_career_progress 
       add constraint FKafqn3bknvum59gahu9225p54x 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_crypto_holdings 
       add constraint FKj1t8wbs2fo2rbhg27ou7p1l6q 
       foreign key (crypto_id_cryptocurrencies) 
       references sv_game.cryptocurrencies 
       on delete cascade;

    alter table if exists sv_game.player_crypto_holdings 
       add constraint FK9qvwu9r65htxk35s0tqkrpf4 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_currency_holdings 
       add constraint FKsr1urdyeby8djplio1204s20 
       foreign key (currency_id_currencies) 
       references sv_game.currencies 
       on delete cascade;

    alter table if exists sv_game.player_currency_holdings 
       add constraint FKw8pw51tibm4mbo9899pmr3fl 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_inventory 
       add constraint FKelb21uoil2s5g0n9qijm2q301 
       foreign key (item_id_items) 
       references sv_game.items 
       on delete restrict;

    alter table if exists sv_game.player_inventory 
       add constraint FKb166j4iorux4nh11xqnce6bvn 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_investments 
       add constraint FK4ndaalb0y85xw4amc5l5cic7i 
       foreign key (opportunity_id_investment_opportunities) 
       references sv_game.investment_opportunities 
       on delete restrict;

    alter table if exists sv_game.player_investments 
       add constraint FKt1sl52kbhbu107vj3vfpx3fxh 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_nft_holdings 
       add constraint FKlsuf0wnqhthndqwnslig9cqce 
       foreign key (nft_id_nfts) 
       references sv_game.nfts 
       on delete cascade;

    alter table if exists sv_game.player_nft_holdings 
       add constraint FK4sqd1orv42g0odi0dx6a0y6e4 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_npc_relationships 
       add constraint FKj1eec75g3eg4bolul2v3wxonr 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete cascade;

    alter table if exists sv_game.player_npc_relationships 
       add constraint FKi7vaw7tbd21wb25d1vd6gglp3 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_skills 
       add constraint FKhydbgbkdkll86f7dadbnns67p 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_skills 
       add constraint FK3v1ionoiwfqkqhpn78or43x4m 
       foreign key (skill_id_skills) 
       references sv_game.skills 
       on delete restrict;

    alter table if exists sv_game.player_status_effects 
       add constraint FKhs2w2fejcmmwpvd9h16fwqid5 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_stock_holdings 
       add constraint FK19vns04swoyp8vmclk4yfjuyr 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_stock_holdings 
       add constraint FKaioj2l1vrdiqalgfeujallpaa 
       foreign key (stock_id_stocks) 
       references sv_game.stocks 
       on delete cascade;

    alter table if exists sv_game.players 
       add constraint FK470a3pox856ynx6amiaxk7r2w 
       foreign key (city_id_cities) 
       references sv_game.cities 
       on delete restrict;

    alter table if exists sv_game.players 
       add constraint FKglekn1d8fmwrx3f4he2rrswdp 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.players 
       add constraint FKeo3cccb1rw2iai7ede56vk1e6 
       foreign key (job_id_jobs) 
       references sv_game.jobs 
       on delete set null;

    alter table if exists sv_game.players 
       add constraint FK8i0fmgdxpjlhjbsx3lm3tvefr 
       foreign key (plot_id_plots) 
       references sv_game.plots 
       on delete set null;

    alter table if exists sv_game.plots 
       add constraint FKtg1jw8x0cvje2x12qfq95a4w4 
       foreign key (building_id_buildings) 
       references sv_game.buildings 
       on delete set null;

    alter table if exists sv_game.plots 
       add constraint FKgq36msv8mstmgn41r41n5j7n4 
       foreign key (city_id_cities) 
       references sv_game.cities 
       on delete cascade;

    alter table if exists sv_game.plots 
       add constraint FKiip7oclybvedms00hp7odm2e4 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.plots 
       add constraint FKgs1p2fdahvh2arnw8b5i3rbjn 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.plots 
       add constraint FK4ic6ga8g4rr8oi2mx78oie4pb 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.products 
       add constraint FKgri9ydog2re8fd4mqoglhgxq3 
       foreign key (category_id_business_categories) 
       references sv_game.business_categories 
       on delete restrict;

    alter table if exists sv_game.products 
       add constraint FKo9d40w63d95ken7unvgl29777 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete cascade;

    alter table if exists sv_game.roosters 
       add constraint FKe1oo71xedprthp152yuh1ph5a 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.roosters 
       add constraint FK2r0quvhcf37cpjo61g20d888y 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.roosters 
       add constraint FKojlu0jctyx8lm6do0g0adh98w 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.roosters 
       add constraint FK7nwv4qeee2q66302evkg87vvq 
       foreign key (plot_id_plots) 
       references sv_game.plots 
       on delete set null;

    alter table if exists sv_game.states 
       add constraint FKsr3xajspbtb3ax0kv3awl0m36 
       foreign key (country_id_countries) 
       references sv_game.countries 
       on delete cascade;

    alter table if exists sv_game.stock_price_history 
       add constraint FKcktx49vdf2r4l97680q5n0r14 
       foreign key (stock_id_stocks) 
       references sv_game.stocks 
       on delete cascade;

    alter table if exists sv_game.stocks 
       add constraint FKld8wa553b25iqu9d85v30q3yo 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.stocks 
       add constraint FKmntcivtb5ydv9w935kececlnk 
       foreign key (market_id_stock_markets) 
       references sv_game.stock_markets 
       on delete restrict;

    alter table if exists sv_game.transactions 
       add constraint FKg9s9tn0iu7p6w5dpwnhhev7v5 
       foreign key (account_id_player_bank_accounts) 
       references sv_game.player_bank_accounts 
       on delete set null;

    alter table if exists sv_game.transactions 
       add constraint FK6sidjgxmloqpsceecsegxmbla 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete cascade;

    alter table if exists sv_game.transactions 
       add constraint FKc8hqlprwvvxj2l74pn0mmolxb 
       foreign key (currency_id_currencies) 
       references sv_game.currencies 
       on delete restrict;

    alter table if exists sv_game.transactions 
       add constraint FK5kxpgv6hdu17lvouy94gqgolg 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.vehicles 
       add constraint FKk06nrxm8sp2wjn2uaf80algvb 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.vehicles 
       add constraint FKl5f2o3u0e5plo4vfw3f4at1bd 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.vehicles 
       add constraint FKrak56p5u7ey4gude78exdqns9 
       foreign key (garage_id_garages) 
       references sv_game.garages 
       on delete set null;

    alter table if exists sv_game.vehicles 
       add constraint FKpdm8v9iqaj0enw5d13tn8takq 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.vehicles 
       add constraint FKb6glpoql8vkpdujp5255ft1la 
       foreign key (plot_id_plots) 
       references sv_game.plots 
       on delete set null;

    alter table if exists sv_game.vehicles 
       add constraint FK9ki55d9lcd53tbrn3p359knec 
       foreign key (vehicletype_id_vehicletypes) 
       references sv_game.vehicletypes 
       on delete restrict;

    alter table if exists sv_game.vehicletypes 
       add constraint FKc5oah51n6hensi8afvm3s0fiu 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists banks_current_owner_debts 
       add constraint FK37lmb9vcyljhpu09sy0xyqhsu 
       foreign key (current_owner_debts_debt_id) 
       references sv_game.debts;

    alter table if exists banks_current_owner_debts 
       add constraint FKcgmup11310ufo013lsr3rlftj 
       foreign key (bank_bank_id) 
       references sv_game.banks;

    alter table if exists banks_lender_debts 
       add constraint FK4k8vvsbl8qjnawfthmqrpyku1 
       foreign key (lender_debts_debt_id) 
       references sv_game.debts;

    alter table if exists banks_lender_debts 
       add constraint FKag301ygledx68bxsbq3xi7vlm 
       foreign key (bank_bank_id) 
       references sv_game.banks;

    alter table if exists companies_borrower_debts 
       add constraint FKel91o1cywtlg07ytv1xgmrrs0 
       foreign key (borrower_debts_debt_id) 
       references sv_game.debts;

    alter table if exists companies_borrower_debts 
       add constraint FKf6mx11foobfp2ojk9fcxrkx3f 
       foreign key (company_company_id) 
       references sv_game.companies;

    alter table if exists companies_current_owner_debts 
       add constraint FKawd0h3atl3r6f7iqg16r1fjw6 
       foreign key (current_owner_debts_debt_id) 
       references sv_game.debts;

    alter table if exists companies_current_owner_debts 
       add constraint FKk5bgw06sfwdjm02ah8b8na23p 
       foreign key (company_company_id) 
       references sv_game.companies;

    alter table if exists companies_lender_debts 
       add constraint FK2pmvyknp7jt61i82f8wx6lrwa 
       foreign key (lender_debts_debt_id) 
       references sv_game.debts;

    alter table if exists companies_lender_debts 
       add constraint FKtiyiqmp9hgjeke02wuhdb4uvo 
       foreign key (company_company_id) 
       references sv_game.companies;

    alter table if exists npcs_current_owner_debts 
       add constraint FKhbmkv3686p02vys523213c5xl 
       foreign key (current_owner_debts_debt_id) 
       references sv_game.debts;

    alter table if exists npcs_current_owner_debts 
       add constraint FK67vacw4x9b7xruhyv83w4n6tb 
       foreign key (npc_npc_id) 
       references sv_game.npcs;

    alter table if exists npcs_lender_debts 
       add constraint FK5fe23xglul0y1fx5d3s7i9yin 
       foreign key (lender_debts_debt_id) 
       references sv_game.debts;

    alter table if exists npcs_lender_debts 
       add constraint FKba84g1xkqkfwnxgsg2buh3hwd 
       foreign key (npc_npc_id) 
       references sv_game.npcs;

    alter table if exists players_borrower_debts 
       add constraint FKquopy2rg1uo2l1ae1n6ffiu0v 
       foreign key (borrower_debts_debt_id) 
       references sv_game.debts;

    alter table if exists players_borrower_debts 
       add constraint FK8ke87wbo8oqf4pxqmfovug2f2 
       foreign key (player_player_id) 
       references sv_game.players;

    alter table if exists players_current_owner_debts 
       add constraint FKn1h1o93c3r8f101mf53o6ylfy 
       foreign key (current_owner_debts_debt_id) 
       references sv_game.debts;

    alter table if exists players_current_owner_debts 
       add constraint FKdvljaamut8swalyq49qy53q0x 
       foreign key (player_player_id) 
       references sv_game.players;

    alter table if exists players_lender_debts 
       add constraint FKg5xjq5knal99mk24g7wog1dxc 
       foreign key (lender_debts_debt_id) 
       references sv_game.debts;

    alter table if exists players_lender_debts 
       add constraint FK9jb0i0t91w5eodrek9gx2gm58 
       foreign key (player_player_id) 
       references sv_game.players;

    create table sv_game.bank_account_transactions (
        amount numeric(32,2) not null,
        transaction_date timestamp(6) with time zone not null,
        account_id_player_bank_accounts uuid,
        bank_transaction_id uuid not null,
        transaction_type varchar(100) not null,
        description text not null,
        primary key (bank_transaction_id)
    );

    create table sv_game.banks (
        deposit_interest_rate numeric(5,4) default 0.00 not null,
        is_player_bank boolean default false not null,
        loan_interest_rate numeric(5,4) default 0.00 not null,
        monthly_account_fee numeric(10,2) default 0.00 not null,
        reputation integer default 500 not null,
        stability_index numeric(5,2) default 100.00 not null,
        transaction_fee_rate numeric(5,4) default 0.00 not null,
        bank_id uuid not null,
        country_id_countries uuid,
        player_id_players uuid,
        name varchar(255) not null,
        primary key (bank_id)
    );

    create table sv_game.bets (
        amount_bet numeric(16,2) not null,
        outcome_amount numeric(16,2) not null,
        bet_date timestamp(6) with time zone not null,
        bet_id uuid not null,
        cockfight_id_cockfights uuid,
        debt_id_debts uuid,
        player_id_players uuid,
        type varchar(100) not null,
        details jsonb not null,
        primary key (bet_id)
    );

    create table sv_game.buildings (
        capacity integer not null,
        condition_percentage integer default 100 not null,
        construction_cost numeric(32,2) not null,
        current_value numeric(32,2) not null,
        is_company_headquarters boolean default false not null,
        is_player_home boolean default false not null,
        maintenance_cost_per_month numeric(16,2) not null,
        rent_per_month numeric(5,2) not null,
        upgrade_level integer default 0 not null,
        building_id uuid not null,
        company_id_companies uuid,
        npc_id_npcs uuid,
        player_id_players uuid,
        building_type varchar(100) not null,
        customization_data jsonb not null,
        primary key (building_id)
    );

    create table sv_game.business_categories (
        category_id uuid not null,
        name varchar(255) not null,
        description text,
        primary key (category_id)
    );

    create table sv_game.career_paths (
        path_id uuid not null,
        related_attribute varchar(50) not null,
        name varchar(255) not null,
        description text not null,
        primary key (path_id)
    );

    create table sv_game.cities (
        cost_of_living_index numeric(5,2) not null,
        local_crime_rate numeric(5,2) not null,
        size_modifier numeric(5,2) not null,
        unemployment_rate numeric(5,2) not null,
        population bigint not null,
        city_id uuid not null,
        state_id_states uuid,
        city_type varchar(100) not null,
        name varchar(255) not null,
        procedural_seed varchar(255),
        generated_map_layout jsonb not null,
        map_config_data jsonb not null,
        primary key (city_id)
    );

    create table sv_game.cockfights (
        loser_died boolean,
        date_time timestamp(6) with time zone not null,
        building_id_buildings uuid,
        cockfight_id uuid not null,
        game_id_games uuid,
        rooster_id_roosters uuid,
        rooster_id_roosters1 uuid,
        outcome varchar(50),
        status varchar(50) default 'Scheduled' not null,
        primary key (cockfight_id)
    );

    create table sv_game.companies (
        cash_balance numeric(32,2) default 0.00 not null,
        founding_date date not null,
        growth_rate numeric(5,2) not null,
        is_publicly_traded boolean default false not null,
        market_share numeric(5,2) default 0.00 not null,
        marketing_level integer default 0 not null,
        net_worth numeric(32,2) not null,
        production_capacity integer not null,
        r_and_d_level integer default 0 not null,
        reputation integer default 500 not null,
        category_id_business_categories uuid,
        company_id uuid not null,
        npc_id_npcs uuid,
        player_id_players uuid,
        name varchar(255) not null,
        primary key (company_id)
    );

    create table sv_game.company_buildings (
        is_active boolean default true not null,
        building_id_buildings uuid,
        company_building_id uuid not null,
        company_id_companies uuid,
        role varchar(100) not null,
        primary key (company_building_id)
    );

    create table sv_game.company_financial_history (
        employees_count integer not null,
        expenses numeric(32,2) not null,
        net_worth_snapshot numeric(32,2) not null,
        profit numeric(32,2) not null,
        record_date date not null,
        revenue numeric(32,2) not null,
        company_id_companies uuid,
        record_id uuid not null,
        primary key (record_id)
    );

    create table sv_game.company_hqs (
        building_id_buildings uuid unique,
        company_hq_id uuid not null,
        company_id_companies uuid unique,
        primary key (company_hq_id)
    );

    create table sv_game.countries (
        base_tax_rate numeric(5,2) not null,
        business_tax_rate numeric(5,2) not null,
        corruption_level numeric(5,2) not null,
        crime_rate_modifier numeric(5,2) not null,
        growth_potential numeric(5,2) not null,
        import_export_duty numeric(5,2) not null,
        stability_index numeric(5,2) not null,
        country_id uuid not null,
        currency_id_currencies uuid,
        economic_system varchar(100) not null,
        law_system varchar(100) not null,
        name varchar(255) not null,
        primary key (country_id)
    );

    create table sv_game.courses (
        cost numeric(16,2) not null,
        duration_days integer not null,
        course_id uuid not null,
        institution_id_education_institutions uuid,
        skill_id_skills uuid,
        related_attribute varchar(50) not null,
        name varchar(255) not null,
        description text not null,
        primary key (course_id)
    );

    create table sv_game.crypto_price_history (
        price numeric(16,2) not null,
        record_time timestamp(6) with time zone not null,
        crypto_id_cryptocurrencies uuid,
        history_id uuid not null,
        primary key (history_id)
    );

    create table sv_game.cryptocurrencies (
        current_price numeric(16,2) not null,
        mining_difficulty numeric(16,2) not null,
        volatility numeric(5,2) not null,
        circulating_supply bigint not null,
        supply_limit bigint,
        symbol varchar(10) not null,
        crypto_id uuid not null,
        name varchar(255) not null,
        primary key (crypto_id)
    );

    create table sv_game.currencies (
        exchange_rate_to_base_currency numeric(16,2) not null,
        iso_code varchar(3) not null,
        volatility numeric(5,2) not null,
        symbol varchar(10) not null,
        currency_id uuid not null,
        name varchar(255) not null,
        primary key (currency_id)
    );

    create table sv_game.debt_collateral (
        collateral_value_at_loan_time numeric(32,2) not null,
        is_currently_held boolean not null,
        collateral_entity_id uuid not null,
        debt_collateral_id uuid not null,
        debt_id_debts uuid,
        collateral_type varchar(50) not null,
        primary key (debt_collateral_id)
    );

    create table sv_game.debts (
        current_debt numeric(32,2),
        interest_rate numeric(5,4) not null,
        minimum_next_payment_amount numeric(32,2),
        original_value numeric(32,2) not null,
        end_date timestamp(6) with time zone not null,
        next_payment_date timestamp(6) with time zone,
        start_date timestamp(6) with time zone not null,
        bank_id_banks uuid,
        bank_id_banks1 uuid,
        company_id_companies uuid,
        company_id_companies1 uuid,
        company_id_companies2 uuid,
        debt_id uuid not null,
        game_id_games uuid,
        npc_id_npcs uuid,
        npc_id_npcs1 uuid,
        player_id_players uuid,
        player_id_players1 uuid,
        player_id_players2 uuid,
        debt_type varchar(50) default 'Loan' not null,
        payment_frequency varchar(50) not null,
        status varchar(50) default 'Active' not null,
        primary key (debt_id)
    );

    create table sv_game.education_institutions (
        institution_id uuid not null,
        type varchar(100) not null,
        name varchar(255) not null,
        primary key (institution_id)
    );

    create table sv_game.exchange_rate_history (
        exchange_rate numeric(16,4) not null,
        record_time timestamp(6) with time zone not null,
        currency_id_currencies uuid,
        history_id uuid not null,
        primary key (history_id)
    );

    create table sv_game.games (
        game_speed_multiplier numeric(3,1) default 1.0 not null,
        current_date_time timestamp(6) with time zone,
        last_save_time timestamp(6) with time zone,
        game_id uuid not null,
        game_name varchar(255) not null,
        primary key (game_id)
    );

    create table sv_game.garage_parking (
        garage_id_garages uuid,
        garage_parking_id uuid not null,
        vehicle_id_vehicles uuid unique,
        parking_spot_number varchar(50),
        primary key (garage_parking_id)
    );

    create table sv_game.garages (
        available_slots integer not null,
        total_slots integer not null,
        building_id_buildings uuid unique,
        game_id_games uuid,
        garage_id uuid not null,
        slot_size_type varchar(50) not null,
        primary key (garage_id)
    );

    create table sv_game.investment_opportunities (
        duration_days integer not null,
        end_date date not null,
        expected_return_max numeric(5,2) not null,
        expected_return_min numeric(5,2) not null,
        is_active boolean default true not null,
        max_investment numeric(32,2) not null,
        min_investment numeric(32,2) not null,
        risk_level numeric(5,2) not null,
        start_date date not null,
        opportunity_id uuid not null,
        name varchar(255) not null,
        description text not null,
        primary key (opportunity_id)
    );

    create table sv_game.items (
        value numeric(16,2) not null,
        item_id uuid not null,
        type varchar(100) not null,
        name varchar(255) not null,
        description text not null,
        effect_data jsonb not null,
        primary key (item_id)
    );

    create table sv_game.job_categories (
        category_id uuid not null,
        name varchar(255) not null,
        primary key (category_id)
    );

    create table sv_game.jobs (
        base_salary_per_day numeric(16,2) not null,
        is_available boolean default true not null,
        required_charisma integer not null,
        required_education_score integer not null,
        required_intelligence integer not null,
        required_strength integer not null,
        xp_per_day integer not null,
        category_id_job_categories uuid,
        company_id_companies uuid,
        job_id uuid not null,
        required_education_level varchar(100) not null,
        title varchar(255) not null,
        primary key (job_id)
    );

    create table sv_game.news_events (
        is_global boolean default false not null,
        event_date timestamp(6) with time zone not null,
        city_id_cities uuid,
        country_id_countries uuid,
        event_id uuid not null,
        game_id_games uuid,
        event_type varchar(100) not null,
        title varchar(255) not null,
        description text not null,
        impact_data jsonb not null,
        primary key (event_id)
    );

    create table sv_game.nfts (
        current_value numeric(32,2) not null,
        initial_value numeric(32,2) not null,
        creation_date timestamp(6) with time zone not null,
        game_id_games uuid,
        nft_id uuid not null,
        npc_id_npcs uuid,
        player_id_players uuid,
        contract_address varchar(255),
        image_path varchar(255),
        name varchar(255) not null,
        token_id varchar(255),
        description text,
        generation_params jsonb,
        primary key (nft_id)
    );

    create table sv_game.npc_stock_holdings (
        average_purchase_price numeric(16,2) not null,
        last_updated_time timestamp(6) with time zone not null,
        shares_owned bigint not null,
        holding_id uuid not null,
        npc_id_npcs uuid,
        stock_id_stocks uuid,
        primary key (holding_id)
    );

    create table sv_game.npcs (
        charisma integer not null,
        intelligence integer not null,
        is_essential boolean default false not null,
        karma integer default 500 not null,
        luck integer not null,
        strength integer not null,
        city_id_cities uuid,
        game_id_games uuid,
        npc_id uuid not null,
        plot_id_plots uuid,
        financial_status varchar(50) not null,
        gender varchar(50) not null,
        status varchar(50) default 'Available' not null,
        occupation varchar(100),
        job_title varchar(255),
        name varchar(255) not null,
        appearance_data jsonb,
        notes text,
        personality_traits jsonb,
        primary key (npc_id)
    );

    create table sv_game.player_attributes (
        charisma integer default 1 not null,
        intelligence integer default 1 not null,
        luck integer default 1 not null,
        strength integer default 1 not null,
        last_updated_time timestamp(6) with time zone not null,
        attribute_id uuid not null,
        player_id_players uuid unique,
        primary key (attribute_id)
    );

    create table sv_game.player_bank_accounts (
        balance numeric(32,2) default 0.00 not null,
        is_primary boolean default false not null,
        created_date timestamp(6) with time zone not null,
        last_activity_date timestamp(6) with time zone not null,
        account_id uuid not null,
        bank_id_banks uuid,
        currency_id_currencies uuid,
        player_id_players uuid,
        account_number varchar(50) not null,
        account_type varchar(50) not null,
        primary key (account_id)
    );

    create table sv_game.player_career_progress (
        level integer default 1 not null,
        xp_in_path integer default 0 not null,
        last_level_up_date timestamp(6) with time zone not null,
        path_id_career_paths uuid,
        player_id_players uuid,
        progress_id uuid not null,
        primary key (progress_id)
    );

    create table sv_game.player_crypto_holdings (
        amount numeric(24,8) not null,
        average_purchase_price numeric(16,2) not null,
        last_updated_time timestamp(6) with time zone not null,
        crypto_id_cryptocurrencies uuid,
        holding_id uuid not null,
        player_id_players uuid,
        primary key (holding_id)
    );

    create table sv_game.player_currency_holdings (
        amount numeric(32,2) default 0.00 not null,
        last_updated_time timestamp(6) with time zone not null,
        currency_id_currencies uuid,
        holding_id uuid not null,
        player_id_players uuid,
        primary key (holding_id)
    );

    create table sv_game.player_inventory (
        equipped boolean default false not null,
        quantity integer default 1 not null,
        inventory_id uuid not null,
        item_id_items uuid,
        player_id_players uuid,
        primary key (inventory_id)
    );

    create table sv_game.player_investments (
        actual_return_amount numeric(32,2) not null,
        amount_invested numeric(32,2) not null,
        expected_return_amount numeric(32,2) not null,
        completion_date timestamp(6) with time zone not null,
        investment_date timestamp(6) with time zone not null,
        opportunity_id_investment_opportunities uuid,
        player_id_players uuid,
        player_investment_id uuid not null,
        status varchar(50) not null,
        primary key (player_investment_id)
    );

    create table sv_game.player_nft_holdings (
        acquisition_price numeric(32,2) not null,
        is_listed_for_sale boolean default false not null,
        listing_price numeric(32,2),
        acquisition_date timestamp(6) with time zone not null,
        holding_id uuid not null,
        nft_id_nfts uuid unique,
        player_id_players uuid,
        primary key (holding_id)
    );

    create table sv_game.player_npc_relationships (
        level integer default 0 not null,
        last_interaction_date timestamp(6) with time zone,
        npc_id_npcs uuid,
        player_id_players uuid,
        relationship_id uuid not null,
        relationship_type varchar(50) default 'Neutral' not null,
        primary key (relationship_id)
    );

    create table sv_game.player_skills (
        level integer default 0 not null,
        xp integer default 0 not null,
        last_updated_time timestamp(6) with time zone not null,
        player_id_players uuid,
        player_skill_id uuid not null,
        skill_id_skills uuid,
        primary key (player_skill_id)
    );

    create table sv_game.player_status_effects (
        end_time timestamp(6) with time zone,
        start_time timestamp(6) with time zone not null,
        effect_id uuid not null,
        player_id_players uuid,
        type varchar(100) not null,
        modifier_data jsonb not null,
        primary key (effect_id)
    );

    create table sv_game.player_stock_holdings (
        average_purchase_price numeric(16,2) not null,
        last_updated_time timestamp(6) with time zone not null,
        shares_owned bigint not null,
        holding_id uuid not null,
        player_id_players uuid,
        stock_id_stocks uuid,
        primary key (holding_id)
    );

    create table sv_game.players (
        age integer not null,
        cash_balance numeric(64,2) default 0.00 not null,
        date_of_birth date not null,
        education_score integer default 0 not null,
        energy integer default 100 not null,
        experience_points integer default 0 not null,
        happiness integer default 100 not null,
        health integer default 100 not null,
        karma integer default 500 not null,
        city_id_cities uuid,
        game_id_games uuid,
        job_id_jobs uuid,
        player_id uuid not null,
        plot_id_plots uuid,
        gender varchar(50) not null,
        education_level varchar(100) default 'None' not null,
        name varchar(255) not null,
        appearance_data jsonb not null,
        primary key (player_id)
    );

    create table sv_game.plots (
        current_value numeric(32,2) not null,
        is_available_for_sale boolean default true not null,
        is_empty boolean default true not null,
        purchase_price numeric(32,2) not null,
        last_update_time timestamp(6) with time zone not null,
        building_id_buildings uuid unique,
        city_id_cities uuid,
        company_id_companies uuid,
        npc_id_npcs uuid,
        player_id_players uuid,
        plot_id uuid not null,
        zoning_type varchar(50) default 'Not Zoned' not null,
        primary key (plot_id)
    );

    create table sv_game.products (
        base_production_cost numeric(16,2) not null,
        current_market_price numeric(16,2) not null,
        demand numeric(5,2) not null,
        production_rate_per_day numeric(16,2) not null,
        quality integer default 50 not null,
        supply numeric(5,2) not null,
        category_id_business_categories uuid,
        company_id_companies uuid,
        product_id uuid not null,
        name varchar(255) not null,
        primary key (product_id)
    );

    create table sv_game.roosters (
        age_days integer not null,
        aggression integer not null,
        draw_count integer default 0 not null,
        health integer default 100 not null,
        is_deceased boolean default false not null,
        kill_count integer default 0 not null,
        loss_count integer default 0 not null,
        speed integer not null,
        strength integer not null,
        win_count integer default 0 not null,
        game_id_games uuid,
        npc_id_npcs uuid,
        player_id_players uuid,
        plot_id_plots uuid,
        rooster_id uuid not null,
        status varchar(50) default 'Available' not null,
        name varchar(255) not null,
        primary key (rooster_id)
    );

    create table sv_game.skills (
        skill_id uuid not null,
        related_attribute varchar(50) not null,
        name varchar(255) not null,
        description text not null,
        primary key (skill_id)
    );

    create table sv_game.states (
        additional_regional_tax_rate numeric(5,2) default 0.00 not null,
        country_id_countries uuid,
        state_id uuid not null,
        name varchar(255) not null,
        environmental_regulations_data jsonb not null,
        zoning_regulations_data jsonb not null,
        primary key (state_id)
    );

    create table sv_game.stock_markets (
        closing_time time(6) not null,
        opening_time time(6) not null,
        market_id uuid not null,
        name varchar(255) not null,
        primary key (market_id)
    );

    create table sv_game.stock_price_history (
        price numeric(16,2) not null,
        record_time timestamp(6) with time zone not null,
        volume bigint not null,
        history_id uuid not null,
        stock_id_stocks uuid,
        primary key (history_id)
    );

    create table sv_game.stocks (
        current_price numeric(16,2) not null,
        volatility numeric(5,2) not null,
        last_trade_time timestamp(6) with time zone not null,
        shares_outstanding bigint not null,
        ticker_symbol varchar(10) not null,
        company_id_companies uuid unique,
        market_id_stock_markets uuid,
        stock_id uuid not null,
        primary key (stock_id)
    );

    create table sv_game.transactions (
        amount numeric(32,2) not null,
        transaction_date timestamp(6) with time zone not null,
        account_id_player_bank_accounts uuid,
        company_id_companies uuid,
        currency_id_currencies uuid,
        player_id_players uuid,
        related_entity_id uuid,
        transaction_id uuid not null,
        type varchar(100) not null,
        related_entity_type varchar(255),
        description text not null,
        primary key (transaction_id)
    );

    create table sv_game.vehicles (
        condition_percentage integer default 100 not null,
        current_value numeric(32,2) not null,
        mileage integer default 0 not null,
        purchase_price numeric(32,2) not null,
        company_id_companies uuid,
        game_id_games uuid,
        garage_id_garages uuid,
        player_id_players uuid,
        plot_id_plots uuid,
        vehicle_id uuid not null,
        vehicletype_id_vehicletypes uuid,
        status varchar(50) default 'Parked' not null,
        primary key (vehicle_id)
    );

    create table sv_game.vehicletypes (
        base_price numeric(32,2) not null,
        cargo_capacity integer default 0 not null,
        passenger_capacity integer default 1 not null,
        speed_modifier numeric(5,2) default 1.0 not null,
        work_efficiency_modifier numeric(5,2) default 0.0 not null,
        game_id_games uuid,
        vehicletype_id uuid not null,
        garage_size_needed varchar(50) default 'Small' not null,
        type varchar(50) not null,
        maker varchar(255) not null,
        name varchar(255) not null,
        primary key (vehicletype_id)
    );

    create table banks_current_owner_debts (
        bank_bank_id uuid not null,
        current_owner_debts_debt_id uuid not null unique,
        primary key (bank_bank_id, current_owner_debts_debt_id)
    );

    create table banks_lender_debts (
        bank_bank_id uuid not null,
        lender_debts_debt_id uuid not null unique,
        primary key (bank_bank_id, lender_debts_debt_id)
    );

    create table companies_borrower_debts (
        borrower_debts_debt_id uuid not null unique,
        company_company_id uuid not null,
        primary key (borrower_debts_debt_id, company_company_id)
    );

    create table companies_current_owner_debts (
        company_company_id uuid not null,
        current_owner_debts_debt_id uuid not null unique,
        primary key (company_company_id, current_owner_debts_debt_id)
    );

    create table companies_lender_debts (
        company_company_id uuid not null,
        lender_debts_debt_id uuid not null unique,
        primary key (company_company_id, lender_debts_debt_id)
    );

    create table npcs_current_owner_debts (
        current_owner_debts_debt_id uuid not null unique,
        npc_npc_id uuid not null,
        primary key (current_owner_debts_debt_id, npc_npc_id)
    );

    create table npcs_lender_debts (
        lender_debts_debt_id uuid not null unique,
        npc_npc_id uuid not null,
        primary key (lender_debts_debt_id, npc_npc_id)
    );

    create table players_borrower_debts (
        borrower_debts_debt_id uuid not null unique,
        player_player_id uuid not null,
        primary key (borrower_debts_debt_id, player_player_id)
    );

    create table players_current_owner_debts (
        current_owner_debts_debt_id uuid not null unique,
        player_player_id uuid not null,
        primary key (current_owner_debts_debt_id, player_player_id)
    );

    create table players_lender_debts (
        lender_debts_debt_id uuid not null unique,
        player_player_id uuid not null,
        primary key (lender_debts_debt_id, player_player_id)
    );

    alter table if exists sv_game.bank_account_transactions 
       add constraint FKjb01eotg0k9dmgrwbf5iy0jp5 
       foreign key (account_id_player_bank_accounts) 
       references sv_game.player_bank_accounts 
       on delete cascade;

    alter table if exists sv_game.banks 
       add constraint FK3c1y8dbh15dbkyke4o37mlqcv 
       foreign key (country_id_countries) 
       references sv_game.countries 
       on delete restrict;

    alter table if exists sv_game.banks 
       add constraint FKc3eo422rdf1dmx32h9gsj3n9i 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.bets 
       add constraint FKmwmk5kpqo18s5eivjy1y2a2g1 
       foreign key (cockfight_id_cockfights) 
       references sv_game.cockfights 
       on delete restrict;

    alter table if exists sv_game.bets 
       add constraint FKmgc4gldko9471s6a46yrd4q33 
       foreign key (debt_id_debts) 
       references sv_game.debts 
       on delete cascade;

    alter table if exists sv_game.bets 
       add constraint FKqalc1cmkrs4ms5x6sdtieigdi 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.buildings 
       add constraint FK6ll35noytqm9m9p4mu77tkq3j 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.buildings 
       add constraint FKrspuqr0x2ikm7x0fmvk8yop5e 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.buildings 
       add constraint FKd2elcads83w6kq1yfqegen4yf 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.cities 
       add constraint FK7cf2lydp0qt74d04iwlvmxxpt 
       foreign key (state_id_states) 
       references sv_game.states 
       on delete cascade;

    alter table if exists sv_game.cockfights 
       add constraint FKqlq17pa8t1g7kqnm4r2txdrlw 
       foreign key (building_id_buildings) 
       references sv_game.buildings 
       on delete restrict;

    alter table if exists sv_game.cockfights 
       add constraint FKobfyo1i2fkht9mfnox83bxfom 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.cockfights 
       add constraint FK11gfxu9p38ija1rs705yo9a6y 
       foreign key (rooster_id_roosters) 
       references sv_game.roosters 
       on delete restrict;

    alter table if exists sv_game.cockfights 
       add constraint FK8dx625xuqx70ier5vphpfsifk 
       foreign key (rooster_id_roosters1) 
       references sv_game.roosters 
       on delete restrict;

    alter table if exists sv_game.companies 
       add constraint FKf8lqctukbufq6y5yfnb2o0sb1 
       foreign key (category_id_business_categories) 
       references sv_game.business_categories 
       on delete restrict;

    alter table if exists sv_game.companies 
       add constraint FKs63xtgd7stvh7cemu0iurkhva 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.companies 
       add constraint FKeuj8jtfhs3gy4yukrs1i7ul65 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.company_buildings 
       add constraint FK22y5dr2scnykbr9vv308dgqi2 
       foreign key (building_id_buildings) 
       references sv_game.buildings 
       on delete cascade;

    alter table if exists sv_game.company_buildings 
       add constraint FK13b0p1nd0c4g0o4wa7s2fo4x9 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete cascade;

    alter table if exists sv_game.company_financial_history 
       add constraint FKrce6cputcnj7lnw0ytw6dwfa9 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete cascade;

    alter table if exists sv_game.company_hqs 
       add constraint FKni4c39t7b7wgqhdjejb2vfj10 
       foreign key (building_id_buildings) 
       references sv_game.buildings 
       on delete set null;

    alter table if exists sv_game.company_hqs 
       add constraint FKcc0jfjqq0u3tosilyltd7upoq 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.countries 
       add constraint FK7tf3wkw44cu78c19dsdaoh0mb 
       foreign key (currency_id_currencies) 
       references sv_game.currencies 
       on delete restrict;

    alter table if exists sv_game.courses 
       add constraint FK976vogbjiefw4m97q946y5ltp 
       foreign key (institution_id_education_institutions) 
       references sv_game.education_institutions 
       on delete cascade;

    alter table if exists sv_game.courses 
       add constraint FKrd630g3rc3gmatet898ru74hg 
       foreign key (skill_id_skills) 
       references sv_game.skills 
       on delete restrict;

    alter table if exists sv_game.crypto_price_history 
       add constraint FKnw12acv2fmbw5rwgf9ehepjir 
       foreign key (crypto_id_cryptocurrencies) 
       references sv_game.cryptocurrencies 
       on delete cascade;

    alter table if exists sv_game.debt_collateral 
       add constraint FKk704y8qkd803plv4wtbdww0h5 
       foreign key (debt_id_debts) 
       references sv_game.debts 
       on delete cascade;

    alter table if exists sv_game.debts 
       add constraint FKcs88dspsf64utcuhhyemnyx11 
       foreign key (company_id_companies1) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKrthvkrkw4hxhn283xq75lxa5x 
       foreign key (player_id_players1) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKgfo6uvpv3bvysi11bl23p2hiq 
       foreign key (bank_id_banks1) 
       references sv_game.banks 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FK2uktynyetgrdsx83ubyt4qs29 
       foreign key (company_id_companies2) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKc65tcl210hwoghxdvo5g9my8m 
       foreign key (npc_id_npcs1) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FK2frdiq4ofdqmhwnu2vied6p9v 
       foreign key (player_id_players2) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKopljj9ssuoc30ry1a7mwq1kra 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.debts 
       add constraint FKqxtbljltmmksn95m4qjoev936 
       foreign key (bank_id_banks) 
       references sv_game.banks 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKd5c064dh0pa2wht549cb9sd8u 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FK12gou4btbw1bs6wfp7jiutdqx 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.debts 
       add constraint FKb6rey8v4j2prnbl1nsiwloli5 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.exchange_rate_history 
       add constraint FKjx5bsqpdoigsamd3d7rtorofd 
       foreign key (currency_id_currencies) 
       references sv_game.currencies 
       on delete cascade;

    alter table if exists sv_game.garage_parking 
       add constraint FKtp8df3jelgglta093po3o44nn 
       foreign key (garage_id_garages) 
       references sv_game.garages 
       on delete cascade;

    alter table if exists sv_game.garage_parking 
       add constraint FKd3imjk7gr7jf9mis3gdrm438j 
       foreign key (vehicle_id_vehicles) 
       references sv_game.vehicles 
       on delete set null;

    alter table if exists sv_game.garages 
       add constraint FKdpljwwasu6nxisevhdt2alkp6 
       foreign key (building_id_buildings) 
       references sv_game.buildings 
       on delete restrict;

    alter table if exists sv_game.garages 
       add constraint FKbl3ic5nuwjylw8crmy9ydmk7v 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.jobs 
       add constraint FK1b5sy0anbsi2untb9lwjmefcj 
       foreign key (category_id_job_categories) 
       references sv_game.job_categories 
       on delete restrict;

    alter table if exists sv_game.jobs 
       add constraint FKtecafloh6bl6wtowcfmjwlckl 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.news_events 
       add constraint FK7h9th81fdohmdt8rs7pf3tu2r 
       foreign key (city_id_cities) 
       references sv_game.cities 
       on delete set null;

    alter table if exists sv_game.news_events 
       add constraint FKm56xkkxru1jivb7vhdy35e7x4 
       foreign key (country_id_countries) 
       references sv_game.countries 
       on delete set null;

    alter table if exists sv_game.news_events 
       add constraint FKjj6beencj0sqs3bn7y9tmabyq 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.nfts 
       add constraint FKtpukh60cc0h0eqs8vpi8nxo9s 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.nfts 
       add constraint FK1tqeke9ns7xa0mqs29ppssigb 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete cascade;

    alter table if exists sv_game.nfts 
       add constraint FK2mpuegmp460fd9qqoglb8q7vc 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.npc_stock_holdings 
       add constraint FKd5odir83mlchi5plscr7t8s19 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete cascade;

    alter table if exists sv_game.npc_stock_holdings 
       add constraint FKspi63pcny7jqwr4os93golkop 
       foreign key (stock_id_stocks) 
       references sv_game.stocks 
       on delete cascade;

    alter table if exists sv_game.npcs 
       add constraint FKob89bub3loftatblwp6hqyui4 
       foreign key (city_id_cities) 
       references sv_game.cities 
       on delete set null;

    alter table if exists sv_game.npcs 
       add constraint FKjkoydn7ifemb0brvb9o8p61lo 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.npcs 
       add constraint FKrnmw574r861xh4rxxfi8m14b3 
       foreign key (plot_id_plots) 
       references sv_game.plots 
       on delete set null;

    alter table if exists sv_game.player_attributes 
       add constraint FK1pns89q1q82l8mr7w7vuhfof1 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.player_bank_accounts 
       add constraint FK110v4ggqr56h57tag7lyux8w9 
       foreign key (bank_id_banks) 
       references sv_game.banks 
       on delete restrict;

    alter table if exists sv_game.player_bank_accounts 
       add constraint FKrhpqwwqmsfhusgetbdwuxere2 
       foreign key (currency_id_currencies) 
       references sv_game.currencies 
       on delete restrict;

    alter table if exists sv_game.player_bank_accounts 
       add constraint FKolper7hdyxikhd5eoxkv50h7e 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_career_progress 
       add constraint FKwbnqi0uaslfy2cnc9ow11nav 
       foreign key (path_id_career_paths) 
       references sv_game.career_paths 
       on delete set null;

    alter table if exists sv_game.player_career_progress 
       add constraint FKafqn3bknvum59gahu9225p54x 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_crypto_holdings 
       add constraint FKj1t8wbs2fo2rbhg27ou7p1l6q 
       foreign key (crypto_id_cryptocurrencies) 
       references sv_game.cryptocurrencies 
       on delete cascade;

    alter table if exists sv_game.player_crypto_holdings 
       add constraint FK9qvwu9r65htxk35s0tqkrpf4 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_currency_holdings 
       add constraint FKsr1urdyeby8djplio1204s20 
       foreign key (currency_id_currencies) 
       references sv_game.currencies 
       on delete cascade;

    alter table if exists sv_game.player_currency_holdings 
       add constraint FKw8pw51tibm4mbo9899pmr3fl 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_inventory 
       add constraint FKelb21uoil2s5g0n9qijm2q301 
       foreign key (item_id_items) 
       references sv_game.items 
       on delete restrict;

    alter table if exists sv_game.player_inventory 
       add constraint FKb166j4iorux4nh11xqnce6bvn 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_investments 
       add constraint FK4ndaalb0y85xw4amc5l5cic7i 
       foreign key (opportunity_id_investment_opportunities) 
       references sv_game.investment_opportunities 
       on delete restrict;

    alter table if exists sv_game.player_investments 
       add constraint FKt1sl52kbhbu107vj3vfpx3fxh 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_nft_holdings 
       add constraint FKlsuf0wnqhthndqwnslig9cqce 
       foreign key (nft_id_nfts) 
       references sv_game.nfts 
       on delete cascade;

    alter table if exists sv_game.player_nft_holdings 
       add constraint FK4sqd1orv42g0odi0dx6a0y6e4 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_npc_relationships 
       add constraint FKj1eec75g3eg4bolul2v3wxonr 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete cascade;

    alter table if exists sv_game.player_npc_relationships 
       add constraint FKi7vaw7tbd21wb25d1vd6gglp3 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_skills 
       add constraint FKhydbgbkdkll86f7dadbnns67p 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_skills 
       add constraint FK3v1ionoiwfqkqhpn78or43x4m 
       foreign key (skill_id_skills) 
       references sv_game.skills 
       on delete restrict;

    alter table if exists sv_game.player_status_effects 
       add constraint FKhs2w2fejcmmwpvd9h16fwqid5 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_stock_holdings 
       add constraint FK19vns04swoyp8vmclk4yfjuyr 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete cascade;

    alter table if exists sv_game.player_stock_holdings 
       add constraint FKaioj2l1vrdiqalgfeujallpaa 
       foreign key (stock_id_stocks) 
       references sv_game.stocks 
       on delete cascade;

    alter table if exists sv_game.players 
       add constraint FK470a3pox856ynx6amiaxk7r2w 
       foreign key (city_id_cities) 
       references sv_game.cities 
       on delete restrict;

    alter table if exists sv_game.players 
       add constraint FKglekn1d8fmwrx3f4he2rrswdp 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.players 
       add constraint FKeo3cccb1rw2iai7ede56vk1e6 
       foreign key (job_id_jobs) 
       references sv_game.jobs 
       on delete set null;

    alter table if exists sv_game.players 
       add constraint FK8i0fmgdxpjlhjbsx3lm3tvefr 
       foreign key (plot_id_plots) 
       references sv_game.plots 
       on delete set null;

    alter table if exists sv_game.plots 
       add constraint FKtg1jw8x0cvje2x12qfq95a4w4 
       foreign key (building_id_buildings) 
       references sv_game.buildings 
       on delete set null;

    alter table if exists sv_game.plots 
       add constraint FKgq36msv8mstmgn41r41n5j7n4 
       foreign key (city_id_cities) 
       references sv_game.cities 
       on delete cascade;

    alter table if exists sv_game.plots 
       add constraint FKiip7oclybvedms00hp7odm2e4 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.plots 
       add constraint FKgs1p2fdahvh2arnw8b5i3rbjn 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.plots 
       add constraint FK4ic6ga8g4rr8oi2mx78oie4pb 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.products 
       add constraint FKgri9ydog2re8fd4mqoglhgxq3 
       foreign key (category_id_business_categories) 
       references sv_game.business_categories 
       on delete restrict;

    alter table if exists sv_game.products 
       add constraint FKo9d40w63d95ken7unvgl29777 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete cascade;

    alter table if exists sv_game.roosters 
       add constraint FKe1oo71xedprthp152yuh1ph5a 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.roosters 
       add constraint FK2r0quvhcf37cpjo61g20d888y 
       foreign key (npc_id_npcs) 
       references sv_game.npcs 
       on delete set null;

    alter table if exists sv_game.roosters 
       add constraint FKojlu0jctyx8lm6do0g0adh98w 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.roosters 
       add constraint FK7nwv4qeee2q66302evkg87vvq 
       foreign key (plot_id_plots) 
       references sv_game.plots 
       on delete set null;

    alter table if exists sv_game.states 
       add constraint FKsr3xajspbtb3ax0kv3awl0m36 
       foreign key (country_id_countries) 
       references sv_game.countries 
       on delete cascade;

    alter table if exists sv_game.stock_price_history 
       add constraint FKcktx49vdf2r4l97680q5n0r14 
       foreign key (stock_id_stocks) 
       references sv_game.stocks 
       on delete cascade;

    alter table if exists sv_game.stocks 
       add constraint FKld8wa553b25iqu9d85v30q3yo 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.stocks 
       add constraint FKmntcivtb5ydv9w935kececlnk 
       foreign key (market_id_stock_markets) 
       references sv_game.stock_markets 
       on delete restrict;

    alter table if exists sv_game.transactions 
       add constraint FKg9s9tn0iu7p6w5dpwnhhev7v5 
       foreign key (account_id_player_bank_accounts) 
       references sv_game.player_bank_accounts 
       on delete set null;

    alter table if exists sv_game.transactions 
       add constraint FK6sidjgxmloqpsceecsegxmbla 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete cascade;

    alter table if exists sv_game.transactions 
       add constraint FKc8hqlprwvvxj2l74pn0mmolxb 
       foreign key (currency_id_currencies) 
       references sv_game.currencies 
       on delete restrict;

    alter table if exists sv_game.transactions 
       add constraint FK5kxpgv6hdu17lvouy94gqgolg 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.vehicles 
       add constraint FKk06nrxm8sp2wjn2uaf80algvb 
       foreign key (company_id_companies) 
       references sv_game.companies 
       on delete set null;

    alter table if exists sv_game.vehicles 
       add constraint FKl5f2o3u0e5plo4vfw3f4at1bd 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists sv_game.vehicles 
       add constraint FKrak56p5u7ey4gude78exdqns9 
       foreign key (garage_id_garages) 
       references sv_game.garages 
       on delete set null;

    alter table if exists sv_game.vehicles 
       add constraint FKpdm8v9iqaj0enw5d13tn8takq 
       foreign key (player_id_players) 
       references sv_game.players 
       on delete set null;

    alter table if exists sv_game.vehicles 
       add constraint FKb6glpoql8vkpdujp5255ft1la 
       foreign key (plot_id_plots) 
       references sv_game.plots 
       on delete set null;

    alter table if exists sv_game.vehicles 
       add constraint FK9ki55d9lcd53tbrn3p359knec 
       foreign key (vehicletype_id_vehicletypes) 
       references sv_game.vehicletypes 
       on delete restrict;

    alter table if exists sv_game.vehicletypes 
       add constraint FKc5oah51n6hensi8afvm3s0fiu 
       foreign key (game_id_games) 
       references sv_game.games 
       on delete cascade;

    alter table if exists banks_current_owner_debts 
       add constraint FK37lmb9vcyljhpu09sy0xyqhsu 
       foreign key (current_owner_debts_debt_id) 
       references sv_game.debts;

    alter table if exists banks_current_owner_debts 
       add constraint FKcgmup11310ufo013lsr3rlftj 
       foreign key (bank_bank_id) 
       references sv_game.banks;

    alter table if exists banks_lender_debts 
       add constraint FK4k8vvsbl8qjnawfthmqrpyku1 
       foreign key (lender_debts_debt_id) 
       references sv_game.debts;

    alter table if exists banks_lender_debts 
       add constraint FKag301ygledx68bxsbq3xi7vlm 
       foreign key (bank_bank_id) 
       references sv_game.banks;

    alter table if exists companies_borrower_debts 
       add constraint FKel91o1cywtlg07ytv1xgmrrs0 
       foreign key (borrower_debts_debt_id) 
       references sv_game.debts;

    alter table if exists companies_borrower_debts 
       add constraint FKf6mx11foobfp2ojk9fcxrkx3f 
       foreign key (company_company_id) 
       references sv_game.companies;

    alter table if exists companies_current_owner_debts 
       add constraint FKawd0h3atl3r6f7iqg16r1fjw6 
       foreign key (current_owner_debts_debt_id) 
       references sv_game.debts;

    alter table if exists companies_current_owner_debts 
       add constraint FKk5bgw06sfwdjm02ah8b8na23p 
       foreign key (company_company_id) 
       references sv_game.companies;

    alter table if exists companies_lender_debts 
       add constraint FK2pmvyknp7jt61i82f8wx6lrwa 
       foreign key (lender_debts_debt_id) 
       references sv_game.debts;

    alter table if exists companies_lender_debts 
       add constraint FKtiyiqmp9hgjeke02wuhdb4uvo 
       foreign key (company_company_id) 
       references sv_game.companies;

    alter table if exists npcs_current_owner_debts 
       add constraint FKhbmkv3686p02vys523213c5xl 
       foreign key (current_owner_debts_debt_id) 
       references sv_game.debts;

    alter table if exists npcs_current_owner_debts 
       add constraint FK67vacw4x9b7xruhyv83w4n6tb 
       foreign key (npc_npc_id) 
       references sv_game.npcs;

    alter table if exists npcs_lender_debts 
       add constraint FK5fe23xglul0y1fx5d3s7i9yin 
       foreign key (lender_debts_debt_id) 
       references sv_game.debts;

    alter table if exists npcs_lender_debts 
       add constraint FKba84g1xkqkfwnxgsg2buh3hwd 
       foreign key (npc_npc_id) 
       references sv_game.npcs;

    alter table if exists players_borrower_debts 
       add constraint FKquopy2rg1uo2l1ae1n6ffiu0v 
       foreign key (borrower_debts_debt_id) 
       references sv_game.debts;

    alter table if exists players_borrower_debts 
       add constraint FK8ke87wbo8oqf4pxqmfovug2f2 
       foreign key (player_player_id) 
       references sv_game.players;

    alter table if exists players_current_owner_debts 
       add constraint FKn1h1o93c3r8f101mf53o6ylfy 
       foreign key (current_owner_debts_debt_id) 
       references sv_game.debts;

    alter table if exists players_current_owner_debts 
       add constraint FKdvljaamut8swalyq49qy53q0x 
       foreign key (player_player_id) 
       references sv_game.players;

    alter table if exists players_lender_debts 
       add constraint FKg5xjq5knal99mk24g7wog1dxc 
       foreign key (lender_debts_debt_id) 
       references sv_game.debts;

    alter table if exists players_lender_debts 
       add constraint FK9jb0i0t91w5eodrek9gx2gm58 
       foreign key (player_player_id) 
       references sv_game.players;
