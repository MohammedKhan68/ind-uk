tmp_stations <- tempfile(fileext = ".geojson")

download.file("https://api.energyandcleanair.org/stations?country=GB,US,TR,PH,IN,TH&format=geojson" ,
               tmp_stations)

library(sf)

my_stations <- read_sf(tmp_stations)

India_Stations <- my_stations[my_stations$country_id=="IN",]

Count_India_Stations <- nrow(India_Stations)

India_Stations_backup <- India_Stations

India_Stations <- India_Stations[, -c(1:9)]

# 2, 4, 5, 6, 7, 8, 10

India_Stations <- India_Stations[, -c(2, 4:8, 10)]

st_crs(India_Stations)


# create a temp file with extension .geojson
# download the file in the above temp file
# use library sf and then read_sf the temp file in a new variable

tmp_countries <- tempfile(fileext = ".geojson")
download.file("https://r2.datahub.io/clvyjaryy0000la0cxieg4o8o/main/raw/data/countries.geojson", 
              tmp_countries)

library(sf)
my_countries <- read_sf(tmp_countries)

my_countries

India <- my_countries[my_countries$ADMIN=="India",4]

Area <- round(as.numeric(st_area(India) / 1000000),2)

Area_in_sqkm <- paste("Area is in Sqkm: ", Area)  

Area_in_sqkm

India_Stations

ggplot() +
  geom_sf(data=India, color='Black', fill='lightyellow', lwd = 1.5) +
  
  geom_sf(data=India_Stations, color='blue', size=2) +
  
  coord_sf(xlim = c(65,102)) +

    labs(
    title = "Air Quality Monitoring Stations in India",
    x = "Longitude",
    y = "Latitude") +
  theme(plot.title = element_text(hjust=0.5, face="bold") , 
        axis.title.x = element_text(face="bold"),
        axis.title.y = element_text(face='bold')
        ) +
  annotate("text", x= 92, y = 35, label = "Count of Stations = 554", color="darkblue", size=5, linewidth=1.5) +
  annotate("text", x= 92, y = 33, label = Area_in_sqkm, color="darkblue", size=5, linewidth=1.5 )+
  annotate("text", x= 92, y = 31, label = St_1000, color="darkblue", size=5, linewidth=1.5 )



St_1000 <- paste("No. of Stations per 1000 SqKm: ", round((Count_India_Stations*1000)/Area,2)) 









