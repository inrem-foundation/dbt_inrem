FROM ghcr.io/dbt-labs/dbt-bigquery:latest

WORKDIR /usr/app

# Copy dbt project into container
COPY . /usr/app

# Tell dbt where profiles.yml will live
ENV DBT_PROFILES_DIR=/root/.dbt

# Keep container alive for interactive use
CMD ["bash"]
