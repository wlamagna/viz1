Parseador de datos de 
[Servicio Meteorologico Nacional](https://www.smn.gob.ar/pronostico)
.
El SMN tiene un lugar de donde se pueden obtener 
[Datos Abiertos](https://www.smn.gob.ar/descarga-de-datos)
y justamente de alli pude obtener diversos conjuntos de datos.
En este caso utilice el "Pronostico del Tiempo a 5 dias".


SMN comparte un archivo zip que Ud debe descargar y descomprimir.  Hoy al 4 de Abril 2021 ese
es el procedimiento.

wget "https://ssl.smn.gob.ar/dpd/zipopendata.php?dato=pron5d" -O Pronostico5dias.zip
unzip Pronostico5dias.zip

Ud descarga el archivo, lo descomprime y corre el script compartido, este va a generar
un archivo por lugar de Argentina en el que hay un pronostico.


Aqui estan los [archivos](https://github.com/wlamagna/viz1/tree/master/clima) procesados del pronostico
del clima por hora para todas las provincias de Argentina.
Lamentablemente no voy a tener tiempo para actualizar los archivos todos
los dias, tampoco tiene sentido porque 
he compartido el [script](https://github.com/wlamagna/viz1/blob/master/clima/tocsv.pl)
para que pueda generar su propios archivos.


La idea es usar estos datos en un ObservableHQ, 
[aqui](https://serverlinux.blogspot.com/2021/04/d3-observable-notas-post-meeting-de-d3.html)
algunas notas al respecto.
