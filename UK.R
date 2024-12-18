my_countries[my_countries$ADMIN=="United Kingdom",] #ID is GB

united_kingdom_stations <- my_stations[my_stations$country_id=="GB",]

Count_united_kingdom <- paste("Count of Stations =", nrow(united_kingdom_stations))
Area_UK <- paste("Area in SqKm :", round(as.numeric(st_area(united_kingdom) / 1000000), 2) )

united_kingdom <- my_countries[my_countries$ADMIN=="United Kingdom",4] 

ggplot() +
  geom_sf(data=united_kingdom, color='black', lwd=1.5) +
  geom_sf(data=united_kingdom_stations, color='blue', size = 2) +
  coord_sf(xlim = c(-20,6))+
  labs(
    title = "Air Quality Monitoring Stations in United Kingdom",
    x = "Longitude",
    y = "Latitude") +
  theme(plot.title = element_text(hjust=0.5, face="bold") , 
        axis.title.x = element_text(face="bold"),
        axis.title.y = element_text(face='bold')
  ) +
  annotate("text", x= -11, y = 62, label = Count_united_kingdom, color="darkblue", size=5, linewidth=1.5) +
  annotate("text", x= -11, y = 61, label = Area_UK, color="darkblue", size=5, linewidth=1.5 )+
  annotate("text", x= -11, y = 60, label = st_1000_uk, color="darkblue", size=5, linewidth=1.5 )
  

UK_Area <- round(as.numeric(st_area(united_kingdom) / 1000000), 2)
UK_count_stations <- nrow(united_kingdom_stations)

st_1000_uk <- paste("No. of Stations per 1000 SqKm:",round((UK_count_stations*1000)/(UK_Area),2)) 



