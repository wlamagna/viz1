library("shiny");
ui <- fluidPage(
	fluidRow(
	column(3,
		selectInput("variable", "Industria:",
                c("Todos" = "all",
                  "Argentinos" = "argentina",
                  "Alemanes" = "alemana",
                  "Españoles" = "españa",
                  "EEUU" = "estados unidos"))
	),
	column(3,
		selectInput("var2", "Tipo:",
		c("Todos" = "all",
                  "FIJO" = "FIJO",
                  "PORTATIL" = "PORTATIL"))
	)
	),
	plotOutput("data")
)

server <- function( input, output) {
	output$data <- renderPlot({
		initial_date = as.Date("01/01/2013", "%d/%m/%Y");
		target_date = as.Date("01/05/2018", "%d/%m/%Y");
		sat <- read.csv(file="data.csv", sep=",", header=TRUE);
		sat$start <- as.Date(sat$desde, "%d/%m/%Y");
		sat$end <- as.Date(sat$hasta, "%d/%m/%Y");

		diferencia_dias = as.double(target_date - initial_date);
		# Resumen de satelites por dia
		resumen1_fechas <- seq(initial_date, target_date, by=1);
		resumen1_datos <- c(0:diferencia_dias) * 0;
		contador <- 0;
		while (diferencia_dias > contador) {
			if (( input$variable == "all") & ( input$var2 == "all")) {
        			tmp_start = as.double((initial_date+contador) - sat$start);
        			tmp_end = as.double((initial_date+contador) - sat$end);
			} else if ( input$variable == "all") {
	 			tmp_start = as.double((initial_date+contador) - sat$start[ sat$TIPO == input$var2 ] );
				tmp_end = as.double((initial_date+contador) - sat$end[ sat$TIPO == input$var2 ] );
			} else if ( input$var2 == "all") {
	 			tmp_start = as.double((initial_date+contador) - sat$start[ (sat$INDUSTRIA == input$variable) ] );
				tmp_end = as.double((initial_date+contador) - sat$end[ (sat$INDUSTRIA == input$variable) ] );
			} else {
	 			tmp_start = as.double((initial_date+contador) - sat$start[ (sat$INDUSTRIA == input$variable) & (sat$TIPO == input$var2) ] );
				tmp_end = as.double((initial_date+contador) - sat$end[ (sat$INDUSTRIA == input$variable) & (sat$TIPO == input$var2) ] );
			}	
        		temp <- ((tmp_start >= 0 ) & (tmp_end <= 0));
        		cuantos_sat <- length(temp[ temp == TRUE ]);
        		resumen1_datos[contador] <- cuantos_sat;
        		contador <- contador + 1;
		}
		tlab <- seq(initial_date, target_date, by="month")
		lab <- format(tlab,format="%Y-%b")
		plot(resumen1_fechas, resumen1_datos, t="l", xaxt="n", xlab="", ylab="Cinemometros habilitados")
		axis(1, at=tlab, labels=FALSE)
		text(x=tlab, y=par()$usr[3]-0.05*(par()$usr[4]-par()$usr[3]),
		labels=lab, srt=45, adj=1, xpd=TRUE, cex=.8)
	})
}

shinyApp(ui = ui, server = server)
