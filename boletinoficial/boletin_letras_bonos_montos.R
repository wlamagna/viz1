datos <- read.csv(file="boletin_letras_bonos_montos.csv", header=TRUE)
datos$cuando <- as.Date(as.character(datos$fechas), "%Y%m%d");
initial_date = min(datos$cuando);
target_date = max(datos$cuando);
datos$cantidad = as.numeric(datos$monto);
tlab <- seq(initial_date, target_date, by="month")
lab <- format(tlab,format="%Y-%b")
short.date = strftime(datos$cuando, "%Y");

datostat <- aggregate(datos$cantidad ~ short.date, FUN=sum);
names(datostat) <- c("cuando","cantidad");
datostat$cuando <- as.Date(as.character(datostat$cuando), "%Y");
initial_date = min(datostat$cuando);
target_date = max(datostat$cuando);
tlab <- seq(initial_date, target_date, by="year")
lab <- format(tlab,format="%Y")
plot(datostat$cuando, datostat$cantidad, main="Monto agrupado de Letras y Bonos en el Boletin Oficial", t="l", xaxt="n", xlab="", ylab="U$D")
axis(1, at=tlab, labels=FALSE)
text(x=tlab, y=par()$usr[3]-0.05*(par()$usr[4]-par()$usr[3]),
labels=lab, srt=45, adj=1, xpd=TRUE, cex=.8)
initial_date = min(datostat$cuando);
target_date = max(datostat$cuando);
tlab <- seq(initial_date, target_date, by="year")
lab <- format(tlab,format="%Y")

text(x=tlab, y=par()$usr[3]-0.05*(par()$usr[4]-par()$usr[3]),
labels=lab, srt=45, adj=1, xpd=TRUE, cex=.8)
