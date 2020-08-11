#INSTALL PACKAGES

# install.packages("shinydashboard")
# install.packages("shinycssloaders")
# install.packages("leaflet.extras")
# install.packages("shinyjs")
# install.packages("shinycustomloader")
# install.packages("shinyWidgets")
# install.packages("shinyanimate")
# install.packages('rsconnect')


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

################# UI ###########################

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
  text-align: center;
  color: #FFFFFF;
}
"

  ui <-  tagList( useShinyjs(), #call to use shinyjs
                  # Loading message
                  div(
                    id = "loading-content",
                    img(src="casj_loader2.gif", height= "100%", width="100%")
                  ),
                  
                  #bulk of code
                  
                  hidden(
                    div(
                      id = "app-content",
                  navbarPage(theme= "bootsketch.css", title = 'Palomarin Grid Wars', windowTitle = 'Territory Maps',
                  selected = 'Interactive Map',
                  
                  #withAnim(), #Call to use shinyAnimate
                  # some extra CSS
                  tags$head(tags$link(rel = 'stylesheet', type = 'text/css',
                                      href = 'custom.css'),
                  tags$style(HTML(".leaflet-container{ background:rgba(255,0,0,0.0);}"),
                             type = "text/css", 
                             "#map {height: calc(100vh - 80px) !important;}", 
                                '.navbar {background-color: #4d0000 ; font-size: 15px;}',
                               '.navbar-default .navbar-brand{color: white; font-family: "Game of Thrones"; font-size: 40px; background-color: #4d0000;}',
                               '.tab-panel{ background-color: maroon; color: white}',
                             "#dropdownButton {
                              background-color: #393D3F !important;}")),
                                                    
                  tags$style('.leaflet-control-layers-expanded{ background-color: seashell; font-size: 13px; font-family: "Goudy Old Style";}'),
          
                  tabPanel(title = 'Interactive Map', style= 'height: 0px',
                           div(class = 'outer',
                               withLoader(leafletOutput('mymap', width = '100%', height = '600px'), type = "image", loader = "sunloader.gif", proxy.height = "1000px"),

                                #div(id = 'spinner', 
                                 #  div() %>% withSpinner(type = 8, proxy.height = '400px', color = '#333d47')),
                               tags$style(type= "text/css", ".container-fluid {padding-left:0px;
                                 padding-right:0px; padding-bottom: 0px;}"),
                               tags$style(type = "text/css", ".navbar {margin-bottom: .5px;}"),
                               tags$style(type = "text/css", ".container-fluid .navbar-header 
                            .navbar-brand {margin-left: 0px;}")),
                  setBackgroundImage(src = "background_map.jpg")),
                  
                  div(style = "position:absolute;right:5em;", actionButton("home", label = "Home", style = "simple", color = "default", size = "md"),
                  div(style = "position:absolute;top: 500px; bottom: 10px; right: 650px;",
                  dropdownButton(
                    tags$h3("About"),
                    fluidRow(column(width = 12, 
                                    align= "left",
                                    img(src="prbo_logo.png", height = "70%", width= "70%"))),
                    tags$p("This map was created using data from Point Blue Conservation. The territories reflect current 2020 data. The study plots are divided up into 'Grids', this map reflects the Grid 2 dataset. Maps, drawings, and application was created by Oliver Nguyen (2020 Spring/Summer PRBO intern) using Rshiny and Leaflet."),
                    label = "",
                    up = TRUE,
                    icon = icon("info"),
                    status = "primary",
                    circle = TRUE,
                    width = 300)),

                  ##################CONDITIONAL PANELS ##########################
                  
                  #WRENTITS
                  
                    hidden(div(id = "conditionalPanel",
                        fluidRow(
                          absolutePanel(id = "cond_panel", 
                                        class = "panel panel-default", 
                                        fixed = TRUE,
                                        draggable = TRUE, 
                                        top = 50, 
                                        left = 10, 
                                        right = "auto", 
                                        bottom = 10,
                                        width = 450, 
                                        height = "auto",
                                        style = "overflow-y:scroll;
                                                 background-color: seashell;
                                                 opacity: 0.85;
                                                 padding: 20px 20px 20px 20px;
                                                 margin: auto;
                                                 border-radius: 5pt;
                                                 box-shadow: 0pt 0pt 6pt 0px rgba(61,59,61,0.48);
                                                 padding-bottom: 2mm;
                                                 padding-top: 1mm;",
                                      
                                        fluidRow(column(width = 12, 
                                               align= "center",
                                               img(src="wren2.png", height = "100%", width= "100%"))
                                                       ),
                                        fluidRow(
                                          column(width = 12, 
                                                 align = "center",
                                                 tags$h2(strong("The Wrentits", style = 'color: maroon; font-family: "Goudy Medieval";')))
                                                      
                                                      ),
                                        fluidRow(
                                          column(width = 12,
                                                 align = "center",
                                                 tags$p("Chamaea fasciata"),
                                                 style = "font-style: italic")
                                        ),
                                        fluidRow(
                                          column(width = 12, 
                                                 align = "left",
                                                 tags$p("These guys are the absolute worst. They'll break your heart and steal it at the same time. Difficult to find and nest search for, it's amazing how far these guys can travel in coastal scrub despite barely being able to fly. They're practically small mammals with ornamental wings. They have interesting 'bouncing-ball songs', and both the females and males sing. They've got a lot of personality, sometimes are kind of dumb, but they've got a lot of heart. They often nest in coyote brush and poison oak, sometimes in Douglas Firs, their eggs are a light blue color, and their nests are usually a neat cup, similar to mugs in size. Wrentit pairs often like taking dew baths in Douglas Firs together, these really are charming birds."))
                                        ),
                                        
                                        fluidRow(
                                          column(width = 12, 
                                                 align= "center",
                                                 img(src="coat_wren.png", height = "60%", width= "60%"))
                                          
                                        ),
                                        
                                        fluidRow(
                                          column(width = 12,
                                                 align = "center",
                                                 tags$p("Wrentit Coat of Arms"),
                                                 style = "font-style: italic; font-size: 13px;")
                                        ),
                                        
                                        fluidRow(column(width = 12, 
                                                        align= "left",
                                                        tags$h3("Arbitrary Stats", style = 'color: maroon; font-family:"Yu Mincho Light;'),
                                                        img(src="redline2.png", height = "100%", width= "100%", style= 'padding-bottom: 15px;')) 
                                                        ),
                                        fluidRow(
                                          column(width = 12, 
                                                 align = "left",
                                                 tags$p(strong("Hit Points:"),"12", style  = 'color: maroon; font-size: 15px;'))
                                        ),
                                        fluidRow(
                                          column(width = 12, 
                                                 align = "left",
                                                 tags$p(strong("Attack Points:"),"3", style  = 'color: maroon; font-size: 15px;'))
                                        ),
                                        
                                        fluidRow(
                                          column(width = 12, 
                                                 align = "left",
                                                 tags$p(strong("Defense Points:"),"1", style  = 'color: maroon; font-size: 15px;'))
                                        ),
                                        fluidRow(
                                          column(width = 12, 
                                                 align = "left",
                                                 tags$p(strong("Speed:"),"10", style  = 'color: maroon; font-size: 15px;'))
                                        ),
                                        
                                        fluidRow(
                                          column(width = 12, 
                                                 align = "left",
                                                 tags$p(strong("Special Skills:"),"+2 Agility", style  = 'color: maroon; font-size: 15px;'))
                                        )
                          )
                          )
                        )
                        ), #End of conditional panel 1
                          
                    # radioGroupButtons("Species",
                    #                      choices = c("Wrentit", "Spotted Towhee", "Wilson's Warbler"),
                    #                     selected = "Wrentit", direction = "vertical"),

                  hidden(div(id = "conditionalPanel2",
                             fluidRow(
                               absolutePanel(id = "cond_panel", 
                                             class = "panel panel-default", 
                                             fixed = TRUE,
                                             draggable = TRUE, 
                                             top = 50, 
                                             left = 10, 
                                             right = "auto", 
                                             bottom = 10,
                                             width = 450, 
                                             height = "auto",
                                             style = "overflow-y:scroll;
                                                 background-color: seashell;
                                                 opacity: 0.85;
                                                 padding: 20px 20px 20px 20px;
                                                 margin: auto;
                                                 border-radius: 5pt;
                                                 box-shadow: 0pt 0pt 6pt 0px rgba(61,59,61,0.48);
                                                 padding-bottom: 2mm;
                                                 padding-top: 1mm;",
                                            
                                             fluidRow(column(width = 12, 
                                                             align= "center",
                                                             img(src="sosp2.png", height = "100%", width= "100%"))
                                             ),
                                             fluidRow(
                                               column(width = 12, 
                                                      align = "center",
                                                      tags$h2("The Song Sparrows", style = 'color: maroon; font-family: "Goudy Medieval";'))
                                               
                                             ),
                                             fluidRow(
                                               column(width = 12,
                                                      align = "center",
                                                      tags$p("Melospiza melodia"),
                                                      style = "font-style: italic")
                                             ),
                                             fluidRow(
                                               column(width = 12, 
                                                      align = "left",
                                                      tags$p("Song Sparrows are a bunch of psychos. They're also incredibly sneaky and will use a network of blackberry bramble to disappear into the 5th plane only to be never seen again. They tend to nest in blackberry thorns around here, mostly in the Black Forest. Some vagrant couples can be seen in the scrubs like in the Panhandle. They're always up to something, but they'll never tell you what. "))
                                             ),
                                             
                                             fluidRow(
                                               column(width = 12, 
                                                      align= "center",
                                                      img(src="coat_sosp.png", height = "60%", width= "60%"))
                                               
                                             ),
                                             
                                             fluidRow(
                                               column(width = 12,
                                                      align = "center",
                                                      tags$p("Song Sparrow Coat of Arms"),
                                                      style = "font-style: italic; font-size: 13px;")
                                             ),
                                             
                                             fluidRow(column(width = 12, 
                                                             align= "left",
                                                             tags$h3("Arbitrary Stats", style = 'color: maroon; font-family:"Yu Mincho Light;'),
                                                             img(src="redline2.png", height = "100%", width= "100%", style= 'padding-bottom: 15px;')) 
                                             ),
                                             fluidRow(
                                               column(width = 12, 
                                                      align = "left",
                                                      tags$p(strong("Hit Points:"),"20", style  = 'color: maroon; font-size: 15px;'))
                                             ),
                                             fluidRow(
                                               column(width = 12, 
                                                      align = "left",
                                                      tags$p(strong("Attack Points:"),"10", style  = 'color: maroon; font-size: 15px;'))
                                             ),
                                             
                                             fluidRow(
                                               column(width = 12, 
                                                      align = "left",
                                                      tags$p(strong("Defense Points:"),"10", style  = 'color: maroon; font-size: 15px;'))
                                             ),
                                             fluidRow(
                                               column(width = 12, 
                                                      align = "left",
                                                      tags$p(strong("Speed:"),"2", style  = 'color: maroon; font-size: 15px;'))
                                             ),
                                             
                                             fluidRow(
                                               column(width = 12, 
                                                      align = "left",
                                                      tags$p(strong("Special Skills:"),"+3 Sneak", style  = 'color: maroon; font-size: 15px;'))
                                             )
                               )
                             )
                  )
                 
                  ), #end of conditionalpanel2
                  
                  hidden(div(id = "conditionalPanel3",
                             fluidRow(
                               absolutePanel(id = "cond_panel",
                                             class = "panel panel-default",
                                             fixed = TRUE,
                                             draggable = TRUE,
                                             top = 50,
                                             left = 10,
                                             right = "auto",
                                             bottom = 10,
                                             width = 450,
                                             height = "auto",
                                             style = "overflow-y:scroll;
                                                 background-color: seashell;
                                                 opacity: 0.85;
                                                 padding: 20px 20px 20px 20px;
                                                 margin: auto;
                                                 border-radius: 5pt;
                                                 box-shadow: 0pt 0pt 6pt 0px rgba(61,59,61,0.48);
                                                 padding-bottom: 2mm;
                                                 padding-top: 1mm;",
                                            
                                             fluidRow(column(width = 12,
                                                             align= "center",
                                                             img(src="wiwa2.png", height = "100%", width= "100%"))
                                             ),
                                             fluidRow(
                                               column(width = 12,
                                                      align = "center",
                                                      tags$h2("The Wilson's Warblers", style = 'color: maroon; font-family: "Goudy Medieval";'))

                                             ),
                                             fluidRow(
                                               column(width = 12,
                                                      align = "center",
                                                      tags$p("Cardellina pusilla"),
                                                      style = "font-style: italic")
                                             ),
                                             fluidRow(
                                               column(width = 12,
                                                      align = "left",
                                                      tags$p("These round yellow little things are the greatest things to happen on this planet. They are very nervous anxious little birds, dashing around and never stopping for one second to pause and contemplate. Both the males and females have black caps, but the males have a more illustrious dark cap. They are a migratory bird, wintering in Central America and travelling further up north for the summer and spring. Their nests are often found in blackberry bushes, and they build like there's no tomorrow. The female will travel back and forth constantly to build her shoddy nests (they really are messy, it's usually a huge clump of material and then they make a tiny cup in the middle). Wilson's Warblers are sculptors by nature.  "))
                                             ),
                                             
                                             fluidRow(
                                               column(width = 12, 
                                                      align= "center",
                                                      img(src="coat_wiwa.png", height = "60%", width= "60%"))
                                               
                                             ),
                                             
                                             fluidRow(
                                               column(width = 12,
                                                      align = "center",
                                                      tags$p("Wilson's Warbler Coat of Arms"),
                                                      style = "font-style: italic; font-size: 13px;")
                                             ),
                                             
                                             fluidRow(column(width = 12, 
                                                             align= "left",
                                                             tags$h3("Arbitrary Stats", style = 'color: maroon; font-family:"Yu Mincho Light;'),
                                                             img(src="redline2.png", height = "100%", width= "100%", style= 'padding-bottom: 15px;')) 
                                             ),
                                             fluidRow(
                                               column(width = 12, 
                                                      align = "left",
                                                      tags$p(strong("Hit Points:"),"5", style  = 'color: maroon; font-size: 15px;'))
                                             ),
                                             fluidRow(
                                               column(width = 12, 
                                                      align = "left",
                                                      tags$p(strong("Attack Points:"),"5", style  = 'color: maroon; font-size: 15px;'))
                                             ),
                                             
                                             fluidRow(
                                               column(width = 12, 
                                                      align = "left",
                                                      tags$p(strong("Defense Points:"),"13", style  = 'color: maroon; font-size: 15px;'))
                                             ),
                                             fluidRow(
                                               column(width = 12, 
                                                      align = "left",
                                                      tags$p(strong("Speed:"),"30", style  = 'color: maroon; font-size: 15px;'))
                                             ),
                                             
                                             fluidRow(
                                               column(width = 12, 
                                                      align = "left",
                                                      tags$p(strong("Special Skills:"),"+5 Charm", style  = 'color: maroon; font-size: 15px;'))
                                             )
                               )
                             )
                  )
                   ), #end of conditional panel 3
                  
                  hidden(div(id = "conditionalPanel4",
                             fluidRow(
                               absolutePanel(id = "cond_panel",
                                             class = "panel panel-default",
                                             fixed = TRUE,
                                             draggable = TRUE,
                                             top = 50,
                                             left = 10,
                                             right = "auto",
                                             bottom = 10,
                                             width = 450,
                                             height = "auto",
                                             style = "overflow-y:scroll;
                                                 background-color: seashell;
                                                 opacity: 0.85;
                                                 padding: 20px 20px 20px 20px;
                                                 margin: auto;
                                                 border-radius: 5pt;
                                                 box-shadow: 0pt 0pt 6pt 0px rgba(61,59,61,0.48);
                                                 padding-bottom: 2mm;
                                                 padding-top: 1mm;",
                                             
                                             fluidRow(column(width = 12,
                                                             align= "center",
                                                             img(src="spto2.png", height = "100%", width= "100%"))
                                             ),
                                             fluidRow(
                                               column(width = 12,
                                                      align = "center",
                                                      tags$h2("The Spotted Towhees", style = 'color: maroon; font-family: "Goudy Medieval";'))
                                               
                                             ),
                                             fluidRow(
                                               column(width = 12,
                                                      align = "center",
                                                      tags$p("Pipilo maculatus"),
                                                      style = "font-style: italic")
                                             ),
                                             fluidRow(
                                               column(width = 12,
                                                      align = "left",
                                                      tags$p("They are the physical form of stress. Very dashing birds, but very high-strung. They tend to nest in the ground or near the ground. They will scream at you if you come near their nest and will not stop.  Spotted Towhees tend to be very loud and conspicuous when foraging, often kicking around dry leaves, and are not very considerate of the people around them when they do so. Their babies are also very stressy and will throw themselves to the ground when given the chance when you're trying to band them. "))
                                             ),
                                             
                                             fluidRow(
                                               column(width = 12, 
                                                      align= "center",
                                                      img(src="coat_spto.png", height = "60%", width= "60%"))
                                               
                                             ),
                                             
                                             fluidRow(
                                               column(width = 12,
                                                      align = "center",
                                                      tags$p("Spotted Towhee Coat of Arms"),
                                                      style = "font-style: italic; font-size: 13px;")
                                             ),
                                             
                                             fluidRow(column(width = 12, 
                                                             align= "left",
                                                             tags$h3("Arbitrary Stats", style = 'color: maroon; font-family:"Yu Mincho Light;'),
                                                             img(src="redline2.png", height = "100%", width= "100%", style= 'padding-bottom: 15px;')) 
                                             ),
                                             fluidRow(
                                               column(width = 12, 
                                                      align = "left",
                                                      tags$p(strong("Hit Points:"),"20", style  = 'color: maroon; font-size: 15px;'))
                                             ),
                                             fluidRow(
                                               column(width = 12, 
                                                      align = "left",
                                                      tags$p(strong("Attack Points:"),"10", style  = 'color: maroon; font-size: 15px;'))
                                             ),
                                             
                                             fluidRow(
                                               column(width = 12, 
                                                      align = "left",
                                                      tags$p(strong("Defense Points:"),"20", style  = 'color: maroon; font-size: 15px;'))
                                             ),
                                             fluidRow(
                                               column(width = 12, 
                                                      align = "left",
                                                      tags$p(strong("Speed:"),"9", style  = 'color: maroon; font-size: 15px;'))
                                             ),
                                             
                                             fluidRow(
                                               column(width = 12, 
                                                      align = "left",
                                                      tags$p(strong("Special Skills:"),"+3 Intimidation", style  = 'color: maroon; font-size: 15px;'))
                                             )
                               )
                             )
                  )
                  ), #end of conditional panel 4
                
                  hidden(div(id = "conditionalPanel5",
                             fluidRow(
                               absolutePanel(id = "cond_panel",
                                             class = "panel panel-default",
                                             fixed = TRUE,
                                             draggable = TRUE,
                                             top = 50,
                                             left = 10,
                                             right = "auto",
                                             bottom = 10,
                                             width = 450,
                                             height = "auto",
                                             style = "overflow-y:scroll;
                                                 background-color: seashell;
                                                 opacity: 0.85;
                                                 padding: 20px 20px 20px 20px;
                                                 margin: auto;
                                                 border-radius: 5pt;
                                                 box-shadow: 0pt 0pt 6pt 0px rgba(61,59,61,0.48);
                                                 padding-bottom: 2mm;
                                                 padding-top: 1mm;",
                                            
                                             fluidRow(column(width = 12,
                                                             align= "center",
                                                             img(src="casj2.png", height = "100%", width= "100%"))
                                             ),
                                             fluidRow(
                                               column(width = 12,
                                                      align = "center",
                                                      tags$h2("The California Scrub Jays", style = 'color: maroon; font-family: "Goudy Medieval";'))

                                             ),
                                             fluidRow(
                                               column(width = 12,
                                                      align = "center",
                                                      tags$p("Aphelocoma californica"),
                                                      style = "font-style: italic")
                                             ),
                                             fluidRow(
                                               column(width = 12,
                                                      align = "left",
                                                      tags$p("They are always watching you. Always. Scrub jays have huge territories, so they're always swooping around, setting off various Wrentit alarms. They're very tricky intelligent birds, always up to no good. Their nests can vary, depending on the available substrates-some can nest low in coyote brush while others can nest high up in Douglas Firs. Their nests roughly put together with larger sticks, and their fledglings are often very loud and noisy a little while after they've left the nest. They are big bullies and they know it. "))
                                            ),
                                            
                                            fluidRow(
                                              column(width = 12, 
                                                     align= "center",
                                                     img(src="coat_casj.png", height = "60%", width= "60%"))
                                              
                                            ),
                                            
                                            fluidRow(
                                              column(width = 12,
                                                     align = "center",
                                                     tags$p("California Scrub Jay Coat of Arms"),
                                                     style = "font-style: italic; font-size: 13px;")
                                            ),
                                            
                                            fluidRow(column(width = 12, 
                                                            align= "left",
                                                            tags$h3("Arbitrary Stats", style = 'color: maroon; font-family:"Yu Mincho Light;'),
                                                            img(src="redline2.png", height = "100%", width= "100%", style= 'padding-bottom: 15px;')) 
                                            ),
                                            fluidRow(
                                              column(width = 12, 
                                                     align = "left",
                                                     tags$p(strong("Hit Points:"),"70", style  = 'color: maroon; font-size: 15px;'))
                                            ),
                                            fluidRow(
                                              column(width = 12, 
                                                     align = "left",
                                                     tags$p(strong("Attack Points:"),"30", style  = 'color: maroon; font-size: 15px;'))
                                            ),
                                            
                                            fluidRow(
                                              column(width = 12, 
                                                     align = "left",
                                                     tags$p(strong("Defense Points:"),"50", style  = 'color: maroon; font-size: 15px;'))
                                            ),
                                            fluidRow(
                                              column(width = 12, 
                                                     align = "left",
                                                     tags$p(strong("Speed:"),"40", style  = 'color: maroon; font-size: 15px;'))
                                            ),
                                            
                                            fluidRow(
                                              column(width = 12, 
                                                     align = "left",
                                                     tags$p(strong("Special Skills:"),"+10 Intelligence", style  = 'color: maroon; font-size: 15px;'))
                                            )
                                          )
                                        )
                                       )
                                     ), #end of conditional panel 5
                  
                  hidden(div(id = "conditionalPanel6",
                             fluidRow(
                               absolutePanel(id = "cond_panel",
                                             class = "panel panel-default",
                                             fixed = TRUE,
                                             draggable = TRUE,
                                             top = 50,
                                             left = 10,
                                             right = "auto",
                                             bottom = 10,
                                             width = 450,
                                             height = "auto",
                                             style = "overflow-y:scroll;
                                                 background-color: seashell;
                                                 opacity: 0.85;
                                                 padding: 20px 20px 20px 20px;
                                                 margin: auto;
                                                 border-radius: 5pt;
                                                 box-shadow: 0pt 0pt 6pt 0px rgba(61,59,61,0.48);
                                                 padding-bottom: 2mm;
                                                 padding-top: 1mm;",
                                             
                                             fluidRow(column(width = 12,
                                                             align= "center",
                                                             img(src="swth2_2.png", height = "100%", width= "100%"))
                                             ),
                                             fluidRow(
                                               column(width = 12,
                                                      align = "center",
                                                      tags$h2("The Swainson's Thrushes", style = 'color: maroon; font-family: "Goudy Medieval";'))
                                               
                                             ),
                                             fluidRow(
                                               column(width = 12,
                                                      align = "center",
                                                      tags$p("Catharus ustulatus"),
                                                      style = "font-style: italic")
                                             ),
                                             fluidRow(
                                               column(width = 12,
                                                      align = "left",
                                                      tags$p("An ethereal forest being, truly a wonderous creature. They overlook this nation with great curiosity and infinite wisdom. They love blackberries and will reach far and wide on their territories just to obtain such delectable fruits. They have an upwards spiraling song that will reverberate through the forest and calm even the most brutish of souls. They have speckled blue eggs, a little different from their Hermit Thrush cousin's smooth creamy blue eggs. They are fickle birds and will refuse to be laid eyes on by any mere mortal."))
                                             ),
                                             
                                             fluidRow(
                                               column(width = 12, 
                                                      align= "center",
                                                      img(src="coat_swth.png", height = "60%", width= "60%"))
                                               
                                             ),
                                             
                                             fluidRow(
                                               column(width = 12,
                                                      align = "center",
                                                      tags$p("Swainson's Thrush Coat of Arms"),
                                                      style = "font-style: italic; font-size: 13px;")
                                             ),
                                             
                                             fluidRow(column(width = 12, 
                                                             align= "left",
                                                             tags$h3("Arbitrary Stats", style = 'color: maroon; font-family:"Yu Mincho Light;'),
                                                             img(src="redline2.png", height = "100%", width= "100%", style= 'padding-bottom: 15px;')) 
                                             ),
                                             fluidRow(
                                               column(width = 12, 
                                                      align = "left",
                                                      tags$p(strong("Hit Points:"),"40", style  = 'color: maroon; font-size: 15px;'))
                                             ),
                                             fluidRow(
                                               column(width = 12, 
                                                      align = "left",
                                                      tags$p(strong("Attack Points:"),"2", style  = 'color: maroon; font-size: 15px;'))
                                             ),
                                             
                                             fluidRow(
                                               column(width = 12, 
                                                      align = "left",
                                                      tags$p(strong("Defense Points:"),"3", style  = 'color: maroon; font-size: 15px;'))
                                             ),
                                             fluidRow(
                                               column(width = 12, 
                                                      align = "left",
                                                      tags$p(strong("Speed:"),"15", style  = 'color: maroon; font-size: 15px;'))
                                             ),
                                             
                                             fluidRow(
                                               column(width = 12, 
                                                      align = "left",
                                                      tags$p(strong("Special Skills:"),"+10 Illusion Spells", style  = 'color: maroon; font-size: 15px;'))
                                             )
                               )
                             )
                  )
                  ),
                  
                  div(id = "conditionalPanel7",
                             fluidRow(
                               absolutePanel(id = "cond_panel",
                                             class = "panel panel-default",
                                             fixed = TRUE,
                                             draggable = TRUE,
                                             top = 50,
                                             left = 10,
                                             right = "auto",
                                             bottom = 10,
                                             width = 450,
                                             height = "auto",
                                             style = "overflow-y:scroll;
                                                 background-color: seashell;
                                                 opacity: 0.85;
                                                 padding: 20px 20px 20px 20px;
                                                 margin: auto;
                                                 border-radius: 5pt;
                                                 box-shadow: 0pt 0pt 6pt 0px rgba(61,59,61,0.48);
                                                 padding-bottom: 2mm;
                                                 padding-top: 1mm;",
                                             fluidRow(column(width = 12,
                                                             align = "center",
                                                             tags$h1("Welcome to Palo", style = 'font-family: "Goudy Medieval"; Georgia, Serif')
                                             )
                                             ),
                                             fluidRow(column(width = 12,
                                                             align= "center",
                                                             img(src="fieldstation_sketch5.png", height = "100%", width= "100%"))
                                             ),
                                             
                                             fluidRow(
                                               column(width = 12,
                                                      align = "left",
                                                      tags$p("Here in these lands lies separate sovereign nations, some that are powerful, some that are corrupt, and some that are benign. To understand more about the denizens of Palomarin and their politics, some of the finest researchers have set up a remote station situated at the corner of these lands called 'The Field Station'. This is an interactive application of their data, detailing the boundaries of seven different main species studied here at the Field Station and nests that have been found."))
                                             ),
                                             fluidRow(
                                               column(width = 12,
                                                      align = "left",
                                                      tags$p("To begin, simply click on the drop-down legend to the right, and click to see the species of choice. This map shows the different territories established by individual pairs to rule over their small feudal lands. Click on the nests to see the identities of these birds (i.e. their color band combination), the number of eggs they have laid, and the fate of their future heirs. "))
                                             )
                                             
                               )
                             )
                  ),
                  
                  hidden(div(id = "conditionalPanel8",
                             fluidRow(
                               absolutePanel(id = "cond_panel",
                                             class = "panel panel-default",
                                             fixed = TRUE,
                                             draggable = TRUE,
                                             top = 50,
                                             left = 10,
                                             right = "auto",
                                             bottom = 10,
                                             width = 450,
                                             height = "auto",
                                             style = "overflow-y:scroll;
                                                 background-color: seashell;
                                                 opacity: 0.85;
                                                 padding: 20px 20px 20px 20px;
                                                 margin: auto;
                                                 border-radius: 5pt;
                                                 box-shadow: 0pt 0pt 6pt 0px rgba(61,59,61,0.48);
                                                 padding-bottom: 2mm;
                                                 padding-top: 1mm;",
                                             
                                             fluidRow(column(width = 12,
                                                             align= "center",
                                                             img(src="nwcsp2.png", height = "100%", width= "100%"))
                                             ),
                                             fluidRow(
                                               column(width = 12,
                                                      align = "center",
                                                      tags$h2("Nuttall's White-Crowned Sparrows", style = 'color: maroon; font-family: "Goudy Medieval";'))
                                               
                                             ),
                                             fluidRow(
                                               column(width = 12,
                                                      align = "center",
                                                      tags$p("Zonotrichia leucophrys nuttalli"),
                                                      style = "font-style: italic")
                                             ),
                                             fluidRow(
                                               column(width = 12,
                                                      align = "left",
                                                      tags$p("Ah, the mysterious White-Crowned Sparrow. As of now, there's very few of them at Palomarin now that there's less open grasslands-in fact, there has only been one recorded territory for this year so far. Now that the Douglas Firs have swallowed up most of the drier grassier vegetation, most have moved further east towards the cow pastures. Highly sought after in these parts, these birds have striking white and black caps and will often build their nest from dried grass."))
                                             ),
                                             
                                             fluidRow(
                                               column(width = 12, 
                                                      align= "center",
                                                      img(src="coat_nwcs.png", height = "60%", width= "60%"))
                                               
                                             ),
                                             
                                             fluidRow(
                                               column(width = 12,
                                                      align = "center",
                                                      tags$p("Nuttall's White-Crowned Sparrow Coat of Arms"),
                                                      style = "font-style: italic; font-size: 13px;")
                                             ),
                                             
                                             fluidRow(column(width = 12, 
                                                             align= "left",
                                                             tags$h3("Arbitrary Stats", style = 'color: maroon; font-family:"Yu Mincho Light;'),
                                                             img(src="redline2.png", height = "100%", width= "100%", style= 'padding-bottom: 15px;')) 
                                             ),
                                             fluidRow(
                                               column(width = 12, 
                                                      align = "left",
                                                      tags$p(strong("Hit Points:"),"10", style  = 'color: maroon; font-size: 15px;'))
                                             ),
                                             fluidRow(
                                               column(width = 12, 
                                                      align = "left",
                                                      tags$p(strong("Attack Points:"),"10", style  = 'color: maroon; font-size: 15px;'))
                                             ),
                                             
                                             fluidRow(
                                               column(width = 12, 
                                                      align = "left",
                                                      tags$p(strong("Defense Points:"),"2", style  = 'color: maroon; font-size: 15px;'))
                                             ),
                                             fluidRow(
                                               column(width = 12, 
                                                      align = "left",
                                                      tags$p(strong("Speed:"),"20", style  = 'color: maroon; font-size: 15px;'))
                                             ),
                                             
                                             fluidRow(
                                               column(width = 12, 
                                                      align = "left",
                                                      tags$p(strong("Special Skills:"),"+10 Dark Magic", style  = 'color: maroon; font-size: 15px;'))
                                             )
                               )
                             )
                  )
                  )
                  )
                  
                  
                                   )
                  )
                  )
                  )#end of UI
                  
                   
                               
                             
                  
                  
  
  
                           
              # end of Navbar 
  
  ############### Server #########################
  
  server <- function(input, output, session) {
    
    Sys.sleep(10)
    
    # Hide the loading message when the rest of the server function has executed
    hide(id = "loading-content", anim = TRUE, animType = "fade")    
    show("app-content")
    
    rv <- reactiveValues()
    rv$myDf <- NULL
    rv$cond <- NULL
    
    #### Initialize Map ########3
    
    
    output$mymap <- renderLeaflet({
      leaflet(options = leafletOptions(minZoom = 15)) %>%
        addTiles(urlTemplate = "https://nerdgear.github.io/palofinal/{z}/{x}/{y}.png", 
                 options = tileOptions(tms = TRUE)) %>%
        setView( lng = -122.7453873
                 , lat = 37.9303226
                 , zoom = 16 )%>%
        setMaxBounds(lng1 = -122.7559776
                      , lat1 = 37.9354896
                      , lng2 = -122.7333712
                      , lat2 = 37.9256633 )
    }) #end of renderLeaflet
    

    observe({
      leafletProxy("mymap") %>%
        
        addPolygons(data= WREN_trans, color = "darkslategray", smoothFactor = 0.0, weight = 3, opacity = 0.3, group = "Wrentit", layerId = WREN_ID, highlightOptions = highlightOptions(weight = 2, color = 'black')) %>%
        addPolygons(data= SOSP_trans, color = "firebrick", smoothFactor = 0.0, weight = 3, opacity = 0.5, group = "Song Sparrow", layerId = SOSP_ID, highlightOptions = highlightOptions(weight = 2, color = 'black'))%>%
        addPolygons(data= WIWA_trans, color = "yellow", smoothFactor = 0.0, weight = 3, opacity = 0.3, group = "Wilson's Warbler", layerId = WIWA_ID, highlightOptions = highlightOptions(weight = 2, color = 'black')) %>%
        addPolygons(data= SPTO_trans, color ="orangered", weight = 3, opacity = 0.3, group = "Spotted Towhee", layerId = SPTO_ID, highlightOptions = highlightOptions(weight = 2, color = 'black')) %>%
        addPolygons(data= CASJ_trans, color = "midnightblue", smoothFactor = 0.0, weight = 3, opacity = 0.6, group = "California Scrub Jay", layerId = CASJ_ID, highlightOptions = highlightOptions(weight = 2, color = 'black')) %>%
        addPolygons(data= SWTH_trans, color = "darkviolet", smoothFactor = 0.0, weight = 3, opacity = 0.3, group = "Swainson's Thrush", layerId = SWTH_ID, highlightOptions = highlightOptions(weight = 2, color = 'black'))%>%
        addPolygons(data= NWCS_trans, color = "white", smoothFactor = 0.0, weight = 3, opacity = 0.3, group = "Nuttall's White-Crowned Sparrow", layerId = NWCS_ID, highlightOptions = highlightOptions(weight = 2, color = 'black'))%>%
        
        
        ####### Add nest markers ############
        
        #Wrentit
        addMarkers(data= Wrennest_trans, icon = wrennesticon, 
                   popup = ~leafpop::popupTable(Wrennest_trans,
                  zcol = c("Male", "Female", "Eggs", "Results"),
                   row.numbers = FALSE, feature.id = FALSE), group = "Wrentit") %>%
        
        addMarkers(data= SOSPnest_trans, icon = sospnesticon, 
                   popup = ~leafpop::popupTable(SOSPnest_trans,
                                                zcol = c("Male", "Female", "Eggs", "Results"),
                                                row.numbers = FALSE, feature.id = FALSE), group = "Song Sparrow") %>%
        addMarkers(data= WIWAnest_trans, icon = wiwanesticon, 
                   popup = ~leafpop::popupTable(WIWAnest_trans,
                                                zcol = c("Male", "Female", "Eggs", "Results"),
                                                row.numbers = FALSE, feature.id = FALSE), group = "Wilson's Warbler") %>%
        addMarkers(data= CASJnest_trans, icon = casjnesticon, 
                   popup = ~leafpop::popupTable(CASJnest_trans,
                                                zcol = c("Male", "Female", "Eggs", "Results"),
                                                row.numbers = FALSE, feature.id = FALSE), group = "California Scrub Jay") %>%
        addMarkers(data= SWTHnest_trans, icon = swthnesticon, 
                   popup = ~leafpop::popupTable(Wrennest_trans,
                                                zcol = c("Male", "Female", "Eggs", "Results"),
                                                row.numbers = FALSE, feature.id = FALSE), group = "Swainson's Thrush") %>%
        addMarkers(data= SPTOnest_trans, icon = sptonesticon, 
                   popup = ~leafpop::popupTable(SPTOnest_trans,
                                                zcol = c("Male", "Female", "Eggs", "Results"),
                                                row.numbers = FALSE, feature.id = FALSE), group = "Spotted Towhee") %>%
        
        
        addLayersControl(
          overlayGroups = c("Wrentit", "Song Sparrow", "Wilson's Warbler", "Spotted Towhee", "California Scrub Jay", "Swainson's Thrush", "Nuttall's White-Crowned Sparrow"),
          options = layersControlOptions(collapsed = TRUE)
        ) %>%
        
          hideGroup(c("Wrentit", "Song Sparrow", "Wilson's Warbler", "Spotted Towhee", "California Scrub Jay", "Swainson's Thrush", "Nuttall's White-Crowned Sparrow")) %>%
    
      
        addMiniMap() 
        })
    
  observeEvent(input$mymap_shape_click, {
    p <- input$mymap_shape_click
    print(p$id)
  })

  #Default welcome panel
  observeEvent(input$mymap_shape_click, {
    p <- input$mymap_shape_click
    if(p$id == "WREN1" || p$id == "WREN2" || p$id == "WREN3" || p$id == "WREN4" || p$id == "WREN5" || p$id == "WREN6" || p$id == "WREN7" || p$id == "WREN8"|| p$id == "WREN9"|| p$id == "WREN10" || p$id == "WREN11"|| p$id == "WREN12"|| p$id == "WREN13" || 
       p$id == "SONG1" || p$id == "SONG2" || p$id == "SONG3" || p$id == "SONG4" || p$id == "SONG5" || p$id == "SONG6" || p$id == "SONG7" ||
       p$id == "WIWA1" || p$id == "WIWA2" || p$id == "WIWA3" || p$id == "WIWA4" || p$id == "WIWA5" || p$id == "WIWA6" || p$id == "WIWA7" || p$id == "WIWA8" || p$id == "WIWA9" || p$id == "WIWA10" || p$id == "WIWA11" || p$id == "WIWA12" || p$id == "WIWA13" || p$id == "WIWA14" || p$id == "WIWA15" || p$id == "WIWA16" || p$id == "WIWA17" ||p$id == "WIWA18" ||
       p$id == "SPTO1" ||p$id == "SPTO2" ||p$id == "SPTO3" ||p$id == "SPTO4" ||p$id == "SPTO5" ||p$id == "SPTO6" ||p$id == "SPTO7" ||p$id == "SPTO8" ||
       p$id == "CASJ1" || p$id == "CASJ2" ||p$id == "CASJ3" ||p$id == "CASJ4" ||p$id == "CASJ5" || p$id == "CASJ6" ||
       p$id == "SWTH1" || p$id == "SWTH2" ||p$id == "SWTH3" ||p$id == "SWTH4" ||p$id == "SWTH5" || p$id == "SWTH6" ||
       p$id == "NWCS1"){
      freezeReactiveValue(input, 'map_click')
      shinyjs::hide(id = "conditionalPanel7")
      print(p$id)} else {
        shinyjs::show(id = "conditionalPanel7")
      }
  })
  
  
  observeEvent(input$mymap_shape_click, {
    p <- input$mymap_shape_click
    if(p$id == "WREN1" || p$id == "WREN2" || p$id == "WREN3" || p$id == "WREN4" || p$id == "WREN5" || p$id == "WREN6" || p$id == "WREN7" || p$id == "WREN8"|| p$id == "WREN9"|| p$id == "WREN10" || p$id == "WREN11"|| p$id == "WREN12"|| p$id == "WREN13"){
      freezeReactiveValue(input, 'map_click')
      shinyjs::show(id = "conditionalPanel")
      print(p$id)} else {
        shinyjs::hide(id = "conditionalPanel")
   }
  })
    
  observeEvent(input$mymap_shape_click, {
    p <- input$mymap_shape_click
    if(p$id == "SONG1" || p$id == "SONG2" || p$id == "SONG3" || p$id == "SONG4" || p$id == "SONG5" || p$id == "SONG6" || p$id == "SONG7"){
      freezeReactiveValue(input, 'map_click')
      shinyjs::show(id = "conditionalPanel2")
      print(p$id)} else {
        shinyjs::hide(id = "conditionalPanel2")
      }
  })
  
  observeEvent(input$mymap_shape_click, {
    p <- input$mymap_shape_click
    if(p$id == "WIWA1" || p$id == "WIWA2" || p$id == "WIWA3" || p$id == "WIWA4" || p$id == "WIWA5" || p$id == "WIWA6" || p$id == "WIWA7" || p$id == "WIWA8" || p$id == "WIWA9" || p$id == "WIWA10" || p$id == "WIWA11" || p$id == "WIWA12" || p$id == "WIWA13" || p$id == "WIWA14" || p$id == "WIWA15" || p$id == "WIWA16" || p$id == "WIWA17" || p$id == "WIWA18"){
      freezeReactiveValue(input, 'map_click')
      shinyjs::show(id = "conditionalPanel3")
      print(p$id)} else {
        shinyjs::hide(id = "conditionalPanel3")
      }
  })
  
  observeEvent(input$mymap_shape_click, {
    p <- input$mymap_shape_click
    if(p$id == "SPTO1" ||p$id == "SPTO2" ||p$id == "SPTO3" ||p$id == "SPTO4" ||p$id == "SPTO5" ||p$id == "SPTO6" ||p$id == "SPTO7" ||p$id == "SPTO8"){
      freezeReactiveValue(input, 'map_click')
      shinyjs::show(id = "conditionalPanel4")
      print(p$id)} else {
        shinyjs::hide(id = "conditionalPanel4")
      }
  })
  
  observeEvent(input$mymap_shape_click, {
    p <- input$mymap_shape_click
    if(p$id == "CASJ1" || p$id == "CASJ2" ||p$id == "CASJ3" ||p$id == "CASJ4" ||p$id == "CASJ5" || p$id == "CASJ6"){
      freezeReactiveValue(input, 'map_click')
      shinyjs::show(id = "conditionalPanel5")
      print(p$id)} else {
        shinyjs::hide(id = "conditionalPanel5")
      }
  })
  
  observeEvent(input$mymap_shape_click, {
    p <- input$mymap_shape_click
    if(p$id == "SWTH1" || p$id == "SWTH2" ||p$id == "SWTH3" ||p$id == "SWTH4" ||p$id == "SWTH5" || p$id == "SWTH6"){
      freezeReactiveValue(input, 'map_click')
      shinyjs::show(id = "conditionalPanel6")
      print(p$id)} else {
        shinyjs::hide(id = "conditionalPanel6")
      }
  })
  
  observeEvent(input$mymap_shape_click, {
    p <- input$mymap_shape_click
    if(p$id == "NWCS1"){
      freezeReactiveValue(input, 'map_click')
      shinyjs::show(id = "conditionalPanel8")
      print(p$id)} else {
        shinyjs::hide(id = "conditionalPanel8")
      }
  })
  
  observeEvent(input$home, {
    shinyjs::show(id = "conditionalPanel7")
    shinyjs::hide(id = "conditionalPanel")
    shinyjs::hide(id = "conditionalPanel2")
    shinyjs::hide(id = "conditionalPanel3")
    shinyjs::hide(id = "conditionalPanel4")
    shinyjs::hide(id = "conditionalPanel5")
    shinyjs::hide(id = "conditionalPanel6")
    shinyjs::hide(id = "conditionalPanel8")
  })
  
  
    } #e. of server
  
shinyApp(ui, server)
  
  

  