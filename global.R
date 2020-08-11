#INSTALL PACKAGES

# install.packages("shinydashboard")
# install.packages("shinycssloaders")
# install.packages("leaflet.extras")
# install.packages("shinyjs")
# install.packages("shinycustomloader")
# install.packages("shinyWidgets")
# install.packages("shinyanimate")
# install.packages('rsconnect')
#install.packages("extrafont")


#setwd("D:/PALOMARIN_CAPSTONE/studyspecies_watercolor/attachments")

####SET UP ##################


#installing Leaflet for R 
# install.packages("leaflet")
# install.packages("dplyr")
# install.packages("leaflet.providers")

library(dplyr)
library(leaflet)
library(leaflet.providers)


#Adding shapefiles
# install.packages("raster")
# install.packages("rgdal")


library(rgdal)
library(raster)
library(extrafont)
font_import(paths = c("../shinyapp/www"))
fonts()

#SET FONTS
dir.create('~/.fonts')
file.copy("www/got.ttf", "~/.fonts")
system('fc-cache -f ~/.fonts')



dir.create('~/.fonts')
file.copy("../shinyapp/www/med.ttf", "~/.fonts")
system('fc-cache -f ~/.fonts')

##########     ADDING TERRITORIES      #####################################

#WREN
WREN <- readOGR(dsn = "../shinyapp/data/territories",
                layer = "wrentit_territories_first",
                verbose = FALSE)

WREN_trans <- spTransform(WREN, CRS("+proj=longlat +datum=WGS84 +no_defs"))

#SPTO
SPTO <- readOGR(dsn = "../shinyapp/data/territories",
                layer = "spotted_towhee",
                verbose = FALSE)
SPTO_trans <- spTransform(SPTO, CRS("+proj=longlat +datum=WGS84 +no_defs"))

#WIWA

WIWA <- readOGR(dsn = "../shinyapp/data/territories",
                layer = "WIWA_territories",
                verbose = FALSE)
WIWA_trans <- spTransform(WIWA, CRS("+proj=longlat +datum=WGS84 +no_defs"))

#SOSP
SOSP <- readOGR(dsn = "../shinyapp/data/territories",
                layer = "SOSP_territories",
                verbose = FALSE)
SOSP_trans <- spTransform(SOSP, CRS("+proj=longlat +datum=WGS84 +no_defs"))

#CASJ
CASJ <- readOGR(dsn = "../shinyapp/data/territories",
                layer = "casj_terr",
                verbose = FALSE)
CASJ_trans <- spTransform(CASJ, CRS("+proj=longlat +datum=WGS84 +no_defs"))


#SWTH
SWTH <- readOGR(dsn = "../shinyapp/data/territories",
                layer = "SWTH_terr",
                verbose = FALSE)
SWTH_trans <- spTransform(SWTH, CRS("+proj=longlat +datum=WGS84 +no_defs"))

#NWCS
NWCS <- readOGR(dsn = "../shinyapp/data/territories",
                layer = "NWCS",
                verbose = FALSE)
NWCS_trans <- spTransform(NWCS, CRS("+proj=longlat +datum=WGS84 +no_defs"))

############     ADD NEST        ######################################################################

#WREN


Wrennest <- readOGR(dsn = "../shinyapp/data/nests",
                    layer = "wren_nest",
                    verbose = FALSE)
Wrennest_trans <- spTransform(Wrennest, CRS("+proj=longlat +datum=WGS84 +no_defs"))

wrennesticon <- makeIcon(iconUrl = "../shinyapp/www/wrennest_icon.png", iconWidth = 38, iconHeight = 38) 



#SOSP

SOSPnest <- readOGR(dsn = "../shinyapp/data/nests",
                    layer = "song_nest",
                    verbose = FALSE)
SOSPnest_trans <- spTransform(SOSPnest, CRS("+proj=longlat +datum=WGS84 +no_defs"))
sospnesticon <- makeIcon(iconUrl = "../shinyapp/www/sospnest_icon.png", iconWidth = 38, iconHeight = 38) 


#WIWA

WIWAnest <- readOGR(dsn = "../shinyapp/data/nests",
                    layer = "wiwa_nest",
                    verbose = FALSE)
WIWAnest_trans <- spTransform(WIWAnest, CRS("+proj=longlat +datum=WGS84 +no_defs"))
wiwanesticon <- makeIcon(iconUrl = "../shinyapp/www/wiwanest_icon.png", iconWidth = 38, iconHeight = 38) 


#SPTO

SPTOnest <- readOGR(dsn = "../shinyapp/data/nests",
                    layer = "spto_nest",
                    verbose = FALSE)
SPTOnest_trans <- spTransform(SPTOnest, CRS("+proj=longlat +datum=WGS84 +no_defs"))
sptonesticon <- makeIcon(iconUrl = "../shinyapp/www/sptonest_icon.png", iconWidth = 38, iconHeight = 38) 

#CASJ

CASJnest <- readOGR(dsn = "../shinyapp/data/nests",
                    layer = "casj_nest",
                    verbose = FALSE)
CASJnest_trans <- spTransform(CASJnest, CRS("+proj=longlat +datum=WGS84 +no_defs"))
casjnesticon <- makeIcon(iconUrl = "../shinyapp/www/casjnest_icon.png", iconWidth = 38, iconHeight = 38) 

#SWTH

SWTHnest <- readOGR(dsn = "../shinyapp/data/nests",
                    layer = "swth_nest",
                    verbose = FALSE)
SWTHnest_trans <- spTransform(SWTHnest, CRS("+proj=longlat +datum=WGS84 +no_defs"))
swthnesticon <- makeIcon(iconUrl = "../shinyapp/www/swthnest_icon.png", iconWidth = 38, iconHeight = 38) 


############### Create multi element character string for layerID ############################

WREN_ID <- c("WREN1", "WREN2", "WREN3", "WREN4", "WREN5", "WREN5", "WREN6", "WREN7", "WREN8", "WREN9", "WREN10", "WREN11", "WREN12", "WREN13")
SOSP_ID <- c("SONG1", "SONG2", "SONG3", "SONG4", "SONG5", "SONG6", "SONG7")
WIWA_ID <- c("WIWA1", "WIWA2","WIWA3","WIWA4","WIWA5","WIWA6","WIWA7","WIWA8","WIWA10","WIWA11","WIWA12","WIWA13","WIWA14", "WIWA15", "WIWA16","WIWA17", "WIWA18")
SPTO_ID <- c("SPTO1", "SPTO2", "SPTO3", "SPTO4", "SPTO5", "SPTO6", "SPTO7")
CASJ_ID <- c("CASJ1", "CASJ2","CASJ3")
SWTH_ID <- c("SWTH1", "SWTH2","SWTH3","SWTH4","SWTH5")
NWCS_ID <- c("NWCS1")


#FONTS:
#dir.create('~/.fonts')
#file.copy("D:/PALOMARIN_CAPSTONE/App-1/www/Game of Thrones.ttf", "~/.fonts")
#system('fc-cache -f ~/.fonts')
#Download TTF file, and then run it as "family" and type in name of file (as seen in Microsoft Word)




#Add Loading screen
appCSS <- "
#loading-content {
  position: absolute;
  background: #f3f1ea;
  opacity: 0.9;
  z-index: 100;
  left: 0;
  right: 0;
  height: 100%;
  width: 100%;
  text-align: center;
  color: #FFFFFF;
}
"



######## CREATING BASEMAP and EXTRA CODE#######################




# #Create Basemap
# library(leaflet)
# library(rgdal)
# #install.packages("mapview")
# #install.packages("leafem")
# library(mapview)
# 
# setwd("D:/PALOMARIN_CAPSTONE/studyspecies_watercolor/attachments")
# 
# 
# 
# leaflet(options = leafletOptions(minZoom = 11)) %>%
#   addTiles(urlTemplate = "https://nerdgear.github.io/palofinal/{z}/{x}/{y}.png", 
#            options = tileOptions(tms = TRUE)) %>%
#   addPolygons(data= wrenttit_transform, color = "red", smoothFactor = 0.0, weight = 2, opacity = 0.3, group = "WREN") %>%
#   addPolygons(data= SPTO_trans, color ="blue", weight = 2, opacity = 0.3, group = "SPTO") %>%
#   
#   #Add Nests
#   addCircleMarkers(data= Wrennest_trans, fillColor = "red", color = NA, radius = NA, fillOpacity = 1, popup = ~nestID) %>%
#   addLayersControl(
#     overlayGroups = c("WREN", "SPTO"),
#     options = layersControlOptions(collapsed = FALSE)
#   ) %>%
#   addMiniMap()   %>%
#   
#   setView( lng = -122.7381676
#                    , lat = 37.9304105
#                    , zoom = 16 ) %>%
#             
#   setMaxBounds(lng1 = -122.7464716
#                , lat1 = 37.9351598
#                , lng2 = -122.7339140
#                , lat2 = 37.9260153 ) %>%
#   leafem::addLogo("casj.png", src = "local",position = "bottomright", alpha = 0.3)
# 
# 
# #narrowing map using boundaries
# #install.packages("geonames")
# 
# 
# #practice
# library(shiny)
# library(leaflet)
# library(RColorBrewer)
# 
# library(shiny)
# library(leaflet)
# 
# r_colors <- rgb(t(col2rgb(colors()) / 255))
# names(r_colors) <- colors()
# 
# ui <- fluidPage(
#   leafletOutput("mymap"),
#   p(),
#   actionButton("recalc", "New points")
# )
# 
# server <- function(input, output, session) {
#   
#   points <- eventReactive(input$recalc, {
#     cbind(rnorm(40) * 2 + 13, rnorm(40) + 48)
#   }, ignoreNULL = FALSE)
#   
#   output$mymap <- renderLeaflet({
#     leaflet() %>%
#       addProviderTiles(providers$Stamen.TonerLite,
#                        options = providerTileOptions(noWrap = TRUE)
#       ) %>%
#       addMarkers(data = points())
#   })
# }
# 
# shinyApp(ui, server)
# 
# casj <- img(src = "casj.png", height = 72, width = 72)
# 
# 
# 

#LIBRARIES 
library(shiny)
library(leaflet)
library(shinydashboard)
library(leaflet.extras)
library(shinycssloaders)
library(shinythemes)
library(shinyjs)
library(shinycustomloader)
library(shinyWidgets)
library(rsconnect)
