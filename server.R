############### Server #########################

server <- function(input, output, session) {
  
  Sys.sleep(7)
  
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
                   , lat2 = 37.9256633 ) %>%
      
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
  }) #end of renderLeaflet
  
  # observe({
  #   leafletProxy("mymap") %>%
  #     
  #     addPolygons(data= WREN_trans, color = "darkslategray", smoothFactor = 0.0, weight = 3, opacity = 0.3, group = "Wrentit", layerId = WREN_ID, highlightOptions = highlightOptions(weight = 2, color = 'black')) %>%
  #     addPolygons(data= SOSP_trans, color = "firebrick", smoothFactor = 0.0, weight = 3, opacity = 0.5, group = "Song Sparrow", layerId = SOSP_ID, highlightOptions = highlightOptions(weight = 2, color = 'black'))%>%
  #     addPolygons(data= WIWA_trans, color = "yellow", smoothFactor = 0.0, weight = 3, opacity = 0.3, group = "Wilson's Warbler", layerId = WIWA_ID, highlightOptions = highlightOptions(weight = 2, color = 'black')) %>%
  #     addPolygons(data= SPTO_trans, color ="orangered", weight = 3, opacity = 0.3, group = "Spotted Towhee", layerId = SPTO_ID, highlightOptions = highlightOptions(weight = 2, color = 'black')) %>%
  #     addPolygons(data= CASJ_trans, color = "midnightblue", smoothFactor = 0.0, weight = 3, opacity = 0.6, group = "California Scrub Jay", layerId = CASJ_ID, highlightOptions = highlightOptions(weight = 2, color = 'black')) %>%
  #     addPolygons(data= SWTH_trans, color = "darkviolet", smoothFactor = 0.0, weight = 3, opacity = 0.3, group = "Swainson's Thrush", layerId = SWTH_ID, highlightOptions = highlightOptions(weight = 2, color = 'black'))%>%
  #     addPolygons(data= NWCS_trans, color = "white", smoothFactor = 0.0, weight = 3, opacity = 0.3, group = "Nuttall's White-Crowned Sparrow", layerId = NWCS_ID, highlightOptions = highlightOptions(weight = 2, color = 'black'))%>%
  #     
  #     
  #     ####### Add nest markers ############
  #   
  #   #Wrentit
  #   addMarkers(data= Wrennest_trans, icon = wrennesticon, 
  #              popup = ~leafpop::popupTable(Wrennest_trans,
  #                                           zcol = c("Male", "Female", "Eggs", "Results"),
  #                                           row.numbers = FALSE, feature.id = FALSE), group = "Wrentit") %>%
  #     
  #     addMarkers(data= SOSPnest_trans, icon = sospnesticon, 
  #                popup = ~leafpop::popupTable(SOSPnest_trans,
  #                                             zcol = c("Male", "Female", "Eggs", "Results"),
  #                                             row.numbers = FALSE, feature.id = FALSE), group = "Song Sparrow") %>%
  #     addMarkers(data= WIWAnest_trans, icon = wiwanesticon, 
  #                popup = ~leafpop::popupTable(WIWAnest_trans,
  #                                             zcol = c("Male", "Female", "Eggs", "Results"),
  #                                             row.numbers = FALSE, feature.id = FALSE), group = "Wilson's Warbler") %>%
  #     addMarkers(data= CASJnest_trans, icon = casjnesticon, 
  #                popup = ~leafpop::popupTable(CASJnest_trans,
  #                                             zcol = c("Male", "Female", "Eggs", "Results"),
  #                                             row.numbers = FALSE, feature.id = FALSE), group = "California Scrub Jay") %>%
  #     addMarkers(data= SWTHnest_trans, icon = swthnesticon, 
  #                popup = ~leafpop::popupTable(Wrennest_trans,
  #                                             zcol = c("Male", "Female", "Eggs", "Results"),
  #                                             row.numbers = FALSE, feature.id = FALSE), group = "Swainson's Thrush") %>%
  #     addMarkers(data= SPTOnest_trans, icon = sptonesticon, 
  #                popup = ~leafpop::popupTable(SPTOnest_trans,
  #                                             zcol = c("Male", "Female", "Eggs", "Results"),
  #                                             row.numbers = FALSE, feature.id = FALSE), group = "Spotted Towhee") %>%
  #     
  #     
  #     
  #     addLayersControl(
  #       overlayGroups = c("Wrentit", "Song Sparrow", "Wilson's Warbler", "Spotted Towhee", "California Scrub Jay", "Swainson's Thrush", "Nuttall's White-Crowned Sparrow"),
  #       options = layersControlOptions(collapsed = TRUE)
  #     ) %>%
  #     
  #     hideGroup(c("Wrentit", "Song Sparrow", "Wilson's Warbler", "Spotted Towhee", "California Scrub Jay", "Swainson's Thrush", "Nuttall's White-Crowned Sparrow")) %>%
  #     
  #     addMiniMap() 
  #   
  # })
  
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

