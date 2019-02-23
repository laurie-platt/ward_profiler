## Electoral wards ##

# load necessary packages
library(sf)
library(tidyverse)


## Sheffield City Region ---------------------------------

# Source: http://geoportal.statistics.gov.uk/datasets/ward-to-local-authority-district-december-2017-lookup-in-the-united-kingdom
lookup <- read_csv("https://opendata.arcgis.com/datasets/046394602a6b415e9fe4039083ef300e_0.csv") %>%
  filter(grepl('Sheffield|Rotherham|Barnsley|Doncaster|Bassetlaw|Chesterfield|North East Derbyshire|Derbyshire Dales|Bolsover', LAD17NM)) %>%
  pull(WD17CD)

# Full resolution
# Source: http://geoportal.statistics.gov.uk/datasets/wards-december-2017-full-clipped-boundaries-in-great-britain
st_read("https://opendata.arcgis.com/datasets/07194e4507ae491488471c84b23a90f2_0.geojson") %>%
  filter(wd17cd %in% lookup) %>%
  select(area_code = wd17cd, area_name = wd17nm, lat, lon = long) %>%
  st_as_sf(crs = 4326, coords = c("long", "lat")) %>%
  st_write("scr_ward_full_resolution.geojson", driver = "GeoJSON")

# Generalised
# Source: http://geoportal.statistics.gov.uk/datasets/wards-december-2017-generalised-clipped-boundaries-in-great-britain
st_read("https://opendata.arcgis.com/datasets/07194e4507ae491488471c84b23a90f2_2.geojson") %>%
  filter(wd17cd %in% lookup) %>%
  select(area_code = wd17cd, area_name = wd17nm, lat, lon = long) %>%
  st_as_sf(crs = 4326, coords = c("long", "lat")) %>%
  st_write("scr_ward_generalised.geojson", driver = "GeoJSON")

# Super Generalised
# Source: http://geoportal.statistics.gov.uk/datasets/wards-december-2017-super-generalised-clipped-boundaries-in-great-britain
st_read("https://opendata.arcgis.com/datasets/07194e4507ae491488471c84b23a90f2_3.geojson") %>%
  filter(wd17cd %in% lookup) %>%
  select(area_code = wd17cd, area_name = wd17nm, lat, lon = long) %>%
  st_as_sf(crs = 4326, coords = c("long", "lat")) %>%
  st_write("scr_ward_super_generalised.geojson", driver = "GeoJSON")

## Sheffield ---------------------------------

# Source: http://geoportal.statistics.gov.uk/datasets/ward-to-local-authority-district-december-2017-lookup-in-the-united-kingdom
# lookup <- read_csv("spatial/Ward_to_Local_Authority_District_December_2017_Lookup_in_the_United_Kingdom.csv") %>% 
lookup <- read_csv("https://opendata.arcgis.com/datasets/046394602a6b415e9fe4039083ef300e_0.csv") %>%  #Unsupported proxy 'https://10.248.8.12:8083/proxy.pac', libcurl is built without the HTTPS-proxy support.
  filter(LAD17NM == "Sheffield") %>%
  pull(WD17CD)

# Full resolution
# Source: http://geoportal.statistics.gov.uk/datasets/wards-december-2017-full-clipped-boundaries-in-great-britain
st_read("https://opendata.arcgis.com/datasets/07194e4507ae491488471c84b23a90f2_0.geojson") %>%
  filter(wd17cd %in% lookup) %>%
  select(area_code = wd17cd, area_name = wd17nm, lat, lon = long) %>%
  st_as_sf(crs = 4326, coords = c("long", "lat")) %>%
  st_write("sheffield_ward_full_resolution.geojson", driver = "GeoJSON")

# Generalised
# Source: http://geoportal.statistics.gov.uk/datasets/wards-december-2017-generalised-clipped-boundaries-in-great-britain
st_read("https://opendata.arcgis.com/datasets/07194e4507ae491488471c84b23a90f2_2.geojson") %>%
  filter(wd17cd %in% lookup) %>%
  select(area_code = wd17cd, area_name = wd17nm, lat, lon = long) %>%
  st_as_sf(crs = 4326, coords = c("long", "lat")) %>%
  st_write("sheffield_ward_generalised.geojson", driver = "GeoJSON")

# Super Generalised
# Source: http://geoportal.statistics.gov.uk/datasets/wards-december-2017-super-generalised-clipped-boundaries-in-great-britain
# st_read("spatial/Wards_December_2017_Super_Generalised_Clipped_Boundaries_in_Great_Britain.geojson") %>%
st_read("https://opendata.arcgis.com/datasets/07194e4507ae491488471c84b23a90f2_3.geojson") %>%
  filter(wd17cd %in% lookup) %>%
  select(area_code = wd17cd, area_name = wd17nm, lat, lon = long) %>%
  st_as_sf(crs = 4326, coords = c("long", "lat")) %>%
  st_write("sheffield_ward_super_generalised.geojson", driver = "GeoJSON")