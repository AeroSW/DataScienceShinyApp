# server.R
source("helpers.R")
counties<-readRDS("data/counties.rds")
library(maps)
library(mapproj)
shinyServer(
	function(input, output) {
		output$map <- renderPlot({
			pop <- input$var
			counties_col <- ''
			if(pop == 'Percent White'){
				counties_col <- 'white'
			}
			else if(pop == 'Percent Black'){
				counties_col <- 'black'
			}
			else if(pop == 'Percent Hispanic'){
				counties_col <- 'hispanic'
			}
			else if(pop == 'Percent Asian'){
				counties_col <- 'asian'
			}
		#	print(counties_col)
		#	counties$act <- counties$total.pop * (counties[[counties_col]] / 100)
		#	View(counties)
		#	index <-which(colnames(counties) == pop)
		#	print(index)
			mi <- input$range[1]
		#	min.p <- 
			ma <- input$range[2]
		#	print(mi)
		#	print(ma)
		#	percent_map(index, "dark green", pop, x=mi, y=ma)
			percent_map(counties[[counties_col]], "dark green", pop, min=mi, max=ma)
		})
	}
)
