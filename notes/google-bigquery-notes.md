# Google BigQuery Notes

- A project has a catalog.
- Catalog have schemas.
- Schemas have tables.
- Tables have columns.
- SELECT queries support ORDER BY.

To get the schemas in the catalog of the current project:

- `SELECT * FROM INFORMATION_SCHEMA.SCHEMATA`
- case of the value after `FROM` is important
- schemas in the Evergreen project are `sheets`, `fieldview`, and `alyce`

To get the tables in a schema:

- `SELECT * FROM {schema-name}.INFORMATION_SCHEMA.TABLES;`

To get the columns in all tables of a schema:

- `SELECT * FROM {schema-name}.INFORMATION_SCHEMA.COLUMNS;`

To get the columns in a particular table:

- `SELECT * FROM {schema-name}.INFORMATION_SCHEMA.COLUMNS where table_name = 'table-name';`
- can optionally include `{catalog-name}.` before `{schema-name}`

To get all rows in a table:

- `select * from {schema-name}.{table-name}`
- ex. `select * from fieldview.operation`

## Evergreen Notes

- Tables in the `sheets` schema are `daily_tracking` and `master_tracking`.

- Columns in the `daily_tracking` table are:
  user_id, field_id, operation, field_name, crop, route_id, projected_a_gdu,
  planned_drone_date, routing_sequence, route_directions, field_directions,
  closest_evergreen_location, pilot, complete, start_time, end_time,
  why_was_it_missed, actual_growth_stage, comments, routing_type,
  location_assigned_to, scout, ingest_dt

- Columns in the `master_tracking` table are:
  user_id, operation, field_id, field_name, to_be_droned, county, longitude,
  latitude, area_acres, synced_w_fv, crop, soil_texture, planting_date,
  residue, seed_zone_moisture, seed_bed_condition, seeding_depth_inches,
  seed_treatments, hybrid, comments, a_gdu, field_owner

- Tables in the `fieldview` schema are `fields_{userid}`, `fips`,
  operation, planting\_{userid}, weather_forecast\_{userid},
  weather\*history\_{userid}.

- Columns in the `fields_{userid}` table are:
  user_id, legacy_field_id, field_uuid, field_name, geoadm_l0,
  geoadm_l1, geoadm_l2, longitude, latitude, field_area_ac

- Columns in the `fips` table are:
  fips_code, geoadm_l0, geoadm_l1, geoadm_l2, state_name, county_name

- Columns in the `operation` table are:
  operation_id, operation_name, operation_owner_id, sharing_type

- Columns in the `planting_{userid}` table are:
  user_id, legacy_field_id, field_uuid, field_name, geoadm_l0, geoadm_l1,
  geoadm_l2, longitude, latitude, field_area_ac, replant, planting_date,
  season, crop_name, product_id, brand, product_name, relative_maturity,
  relative_maturity_units, planted_area_ac, population_seeds_acre

- Columns in the `weather_forecast_{userid}` table are:
  created_date, date, field_id, max_temperature, min_temperature
  precipitation_probability, weather_condition, wind_direction, wind_speed

- Columns in the `weather_history_{userid}` table are:
  date, field_id, grid_center_lat, grid_center_lon, precip, tmax, tmin

- Tables in the `alyce` schema are `field_growth_stage`.

- Columns in the `field_growth_stage` table are:
  user_id, field_id, to_be_droned, crop, planting_date, soil_texture
  residue, seed_zone_moisture, seed_bed_condition, seed_depth
  seed_treatment, planting_month, gdu, V2_gdu, V4_gdu, V7_gdu, V9_gdu
  accum_gdu, current_stage

- Some tables in the Evergreen project are
  partitioned by user id for faster lookup.

- You can query across user ids by using a wildcard in the table name,
  but the entire table expression must be enclosed in backticks
  (ex. `` `fieldview.fields_*` ``).

- The `fieldview.operation` table has the column `operation_owner_id`
  which holds `user_id` values.

- User ids with fields include 42076, 21182, 215565, 357546, 282009, 153208,
  234495, and many more.
