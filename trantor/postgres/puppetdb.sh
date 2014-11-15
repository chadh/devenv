gosu postgres postgres --single <<- EOSQL
    CREATE USER puppetdb WITH PASSWORD 'puppetdb';
    CREATE DATABASE puppetdb OWNER puppetdb;
    GRANT ALL PRIVILEGES ON DATABASE puppetdb TO puppetdb;
EOSQL