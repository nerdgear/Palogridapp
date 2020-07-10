################# UI ###########################



ui <-  tagList( useShinyjs(), #call to use shinyjs, 
                inlineCSS(appCSS),
                # Loading message
                div(
                  id = "loading-content",
                  img(src="casj_loader2.gif", height= "70%", width="50%")
                ),
                
                #bulk of code
                
                hidden(
                  div(
                    id = "app-content",
                    navbarPage(theme= "bootsketch.css", title = 'Palomarin Grid Wars', windowTitle = 'Territory Maps',
                               selected = 'Interactive Map',
                               
                               tags$head( tags$meta(name = "viewport", content = "width=1600"),uiOutput("body")),
      
                               #withAnim(), #Call to use shinyAnimate
                               # some extra CSS
                               tags$head(tags$link(rel = 'stylesheet', type = 'text/css',
                                                   href = 'custom.css'),
                                         tags$style(HTML(".leaflet-container{ background:rgba(255,0,0,0.0);}"),
                                                    type = "text/css",
                                                    '.navbar {background-color: #4d0000 ; font-size: 15px;}',
                                                    '.navbar-default .navbar-brand{color: white; font-family: "Game of Thrones"; font-size: 40px; background-color: #4d0000;}',
                                                    '.tab-panel{ background-color: maroon; color: white}',
                                                    "#dropdownButton {
                              background-color: #393D3F !important;}")),
                               
                               tags$style('.leaflet-control-layers-expanded{ background-color: seashell; font-size: 13px; font-family: "Goudy Old Style";}'),
                               tags$style(type= "text/css", "#map {height: calc(100vh - 80px) !important;}"),
                               tabPanel(title = 'Interactive Map', style= 'height: 0px',
                                        div(class = 'outer',
                                            (leafletOutput('mymap', width = '100%', height = "95vh")), 
                                            
                                            #div(id = 'spinner', 
                                            #  div() %>% withSpinner(type = 8, proxy.height = '400px', color = '#333d47')),
                                            tags$style(type= "text/css", ".container-fluid {padding-left:0px;
                                 padding-right:0px; padding-bottom: 0px;}"),
                                            tags$style(type = "text/css", ".navbar {margin-bottom: .5px;}"),
                                            tags$style(type = "text/css", ".container-fluid .navbar-header 
                            .navbar-brand {margin-left: 0px;}")),
                                        setBackgroundImage(src = "background_map.jpg")),
                               
                               div(style = "position:absolute;right:5em;", actionButton("home", label = "Home", style = "simple", color = "default", size = "md"),
                                   div(style = "position:absolute;top:35em; right:47em",
                                       dropdownButton(
                                         tags$h3("About"),
                                         fluidRow(column(width = 12, 
                                                         align= "left",
                                                         img(src="prbo_logo.png", height = "70%", width= "70%"))),
                                         tags$p("This map was created using data from Point Blue Conservation. The territories reflect current 2020 data. The study plots are divided up into 'Grids', this map reflects the Grid 2 dataset. Maps, drawings, and application was created by Oliver Nguyen (2020 Spring/Summer PRBO intern) using Rshiny and Leaflet. The code for this app can be found",
                                         tags$a(href="https://github.com/nerdgear/Palogridapp", 
                                                "here.")),
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


