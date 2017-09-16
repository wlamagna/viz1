library("ggplot2")
datos<-read.csv(file="encuesta_sysarmy_2017.csv",sep=",",header=TRUE)
datos[ datos$Trabajo.de %in% c( "Data Analyst" ,"Data Engineer" ,"Data Integration" ,"Data Management" ,"Data Science", "Data scientist ", "Data mining Analyst", "data science", "Data Science","Big Data", "Data scientist","Data scientist","Data Scientist","Data scientist"), "Trabajo.de" ] <- c("Data Science");
datos[ datos$Trabajo.de %in% c("DEVOPS", "SysAdmin Coordinator" ,"SysAdmin/DevOps/Developer" , "Administrador Windows server, storage , backups", "Admin/soporte", "SysAdmin, DevOps, Developer, Architect" ,"SysAdmin / Storage / Backup", "SysAdmin Coordinator","SysAdmin/DevOps/Developer","SysAdmin, DevOps, Developer, Architect","SysAdmin Networking","SysAdmin+Networking+HelpDesk+DBA","SysAdmin / Storage / Backup" , "IT Analyst (networking, dba, helpdesk I &II)"), "Trabajo.de" ] <- "SysAdmin / DevOps";
datos[ datos$Trabajo.de %in% c("Security ","Security Specialist","seguridad", "Analista Seguridad Sap", "Analista de Seguridad", "Seguridad" ,"Seguridad " ,"seguridad informatica" ,"Seguridad informática" ,"Seguridad informática " ,"Seguridad Informática" ,"Seguridad It" ,"seguridad privada " ,"Seguritty" ,"Seguryty", "Consultor en ciberseguridad"), "Trabajo.de" ] <- c("Seguridad informática");
datos[ datos$Trabajo.de %in% c("Tech Producer" ,"Tech Support" ,"tecnico" ,"Tecnico" ,"Tecnico " ,"técnico" ,"Técnico" ,"Técnico ","soporte" ,"Soporte" ,"Soporte " ,"Soporte a antivirus" ,"Soporte de Aplicaciones" ,"Soporte On Site" ,"soporte tecnico" ,"Soporte tecnico" ,"Soporte Tecnico" ,"soporte técnico" ,"Soporte técnico" ,"Soporte Técnico "), "Trabajo.de" ] <- c("Técnico");
datos[ datos$Trabajo.de %in% c( "team leader", "Team leader", "Team Leader", "tech lead" , "Lider tecnico", "Lider Tecnico", "Lider técnico", "líder técnico", "Líder Técnico", "Líder Técnico", "Tech lead" ,"Tech Lead" ,"Teach Lead", "Tech Lead " ,"Tech LEader" ,"technical lead" ,"Technical Lead" ,"Technical leader" ,"Technical Leader" ,"technical lider","Lider consultoria SAP" ,"Líder de desarrollo" ,"Líder de equipo de developers" ,"Líder de Proyecto" ,"Lider de proyectos" ,"Líder de proyectos BI y analytics" ,"Líder IT" ,"Lider operaciones" ,"Lider tecnico" ,"Lider Tecnico" ,"Lider técnico" ,"líder técnico" ,"Líder Técnico" ,"Líder Técnico "), "Trabajo.de" ] <- c("Technical Lead");
datos[ datos$Trabajo.de %in% c("functional analyst", "Functional analyst", "Functional Analyst", "Analista funcional", "Analista funcional ", "Analista Funcional", "Analista funcional sap"), "Trabajo.de" ] <- c("Functional Analyst");
datos[ datos$Trabajo.de %in% c( "Soporte en ambiente productivo", "Soporte infraestructura", "Soporte IT", "Soporte IT en sitio, Backup, Networking, HelpDesk, Designer (soy un comodin en la empresa...)", "Soporte IT/Telecomunicaciones", "Soporte local", "Soporte Tecnico", "IT soporte", "It support", "It Support", "IT Support", "soporte tecnico" ,"Soporte tecnico" ,"Soporte Tecnico" ,"soporte técnico" ,"Soporte técnico" ,"Soporte Técnico" ,"soporte tecnico 3ª nivel" ), "Trabajo.de" ] <- c("Soporte Tecnico");
datos[ datos$Trabajo.de %in% c( "BI", "BI Analyst", "BI Consultant ", "Analista BI", "Business Analys", "Business analyst", "Business Analyst", "Business Analyst", "Business Intelligence", "Business Intelligence Consultant", "Bussines Intelligence", "Consultor BI"), "Trabajo.de" ] <- c("Bussines Intelligence");
datos[ datos$Trabajo.de %in% c( "It manager ", "It Manager ", "IT Manager", "gerente ", "Gerente", "Gerente ", "Gerente de tecnología ", "Management ", "MANAGEMENT", "manager", "Manager", "MANAGER ", "Manager IT", "Gerencia", "gerente", "gerente", "Gerente", "Gerente", "gerente de IT", "Gerente de IT", "Gerente de Operaciones", "Gerente de Sistemas", "Gerente de Soluciones de Valor Agregado", "Gerente de tecnología"), "Trabajo.de" ] <- c("Gerente");
datos[ datos$Trabajo.de %in% c("HelpDesk", "Help desk. Networking.storage backup. Sysadmin. Soluciones de infraestructura. Adecuaciones de licenciamiento. Desarrollo de ambientes mixtos de software. Outsourcing", "helpdesk+networking+sysadmin", "HelpDesk, Networking, SysAdmin", "Helpdesk sysadmin backup networking "), "Trabajo.de" ] <- c("HelpDesk");
datos[ datos$Trabajo.de %in% c("Scrum master", "Scrum master ", "ScrumMaster", "Scrum Master", "Scrum Master / Agile Coach" ), "Trabajo.de" ] <- c("ScrumMaster");
datos[ datos$Trabajo.de %in% c( "Developer" ,"Developer and DBA" ,"Developer, Coach, Manager, etc" ,"Developer full stack" ,"Developer / Helpdesk" ,"Developer, networking, implemento soluciones informáticas" ,"Developer Sql y DBA" ,"Development and Production Team Lead", "Development Manager"), "Trabajo.de" ] <- c("Developer");
datos[ datos$Trabajo.de %in% c( "Sap", "Sap assistance", "SAP BASIS", "SAP Consulting", "SAP Security"), "Trabajo.de" ] <- c("Sap");
datos[ datos$Trabajo.de %in% c( "Administrativa", "administrativo ", "Administrativo", "Administrativo ", "Adminsitrativo", "Adminidtrativo", "Administración ", "Administración Pública", "administrador" ), "Trabajo.de" ] <- c("Adminsitrativo");
datos [ datos$Trabajo.de %in% c( "Analisis/Desarrollo" ,"Analist" ,"analista" ,"Analista" ,"ANALISTA" ,"Analista BI" ,"Analista Contable" ,"Analista Database" ,"Analista de bd" ,"Analista de Infraestructura " ,"Analista de Producto" ,"Analista de sistemas " ,"Analista de tecnología " ,"Analista / Diseñadora" ,"Analista en procesos" ,"Analista en sistemas" ,"Analista infra + supervisor de soporte" ,"Analista PMO" ,"Analista programador" ,"Analista Seguridad Sap" ,"Analista Senior" ,"Analista sr" ,"analista tecnico" ,"Analista Técnico" ,"Analista Tecnico Funcional" ,"Analista técnico funcional" ,"analyst" ,"Analyst" ,"Analyst Process" ,"Analyts"), "Trabajo.de" ] <- c("Analista");
levels(datos$Años.de.experiencia) <- c(levels(datos$Años.de.experiencia),"1<");
datos[ datos$Años.de.experiencia == "Menos de un año", "Años.de.experiencia" ] <- "1<";
datos <- datos [ !datos$Salario.mensual..en.tu.moneda.local. > 4000000, ];
datos <- datos [ !datos$Salario.mensual..en.tu.moneda.local. < 100, ];
datos <- droplevels(datos);

datos$Años.de.experiencia <- factor(datos$Años.de.experiencia, levels = c("1<","1","2","3","4","5","6","7","8","9","10+"))

#Limpiandolosdatos:
w=table(datos$Trabajo.de);
test=as.data.frame(w);
options(scipen = 999)
selected <- test[test$Freq > 1,"Var1"]

devops <- datos[ datos$Trabajo.de == "SysAdmin / DevOps", ]
#devops <- datos[ datos$X.Bruto.o.neto. == "Bruto", ]
devops <- datos[ datos$X.Bruto.o.neto. == "Neto", ]
devops <- devops [ !devops$Salario.mensual..en.tu.moneda.local. > 65000, ];
devops <- devops [ !devops$Salario.mensual..en.tu.moneda.local. < 10, ];
devops <- droplevels(devops);

devops1 <- aggregate(devops$Salario.mensual..en.tu.moneda.local. ~ devops$Años.de.experiencia, FUN=mean);
u <- as.numeric(unlist(c(devops1[2])));
v <- as.character(unlist(devops1[1]));
#
ggplot(data=devops1, aes(x=v, y=u)) + scale_y_continuous(breaks=seq(0,45000,3000)) +
geom_bar(fill = "dark blue", stat = "identity") + 
ggtitle("Sueldo mensual (neto) de SysAdmin / DevOps en Republica Argentina - 2017") +
scale_x_discrete(limits=v) + xlab("Años.de.experiencia") + ylab("Salario.mensual")


u <- as.numeric(devops$Salario.mensual..en.tu.moneda.local.)
v <- devops$Años.de.experiencia
ggplot(devops, aes(x=v, y=u)) + 
scale_y_continuous(breaks=seq(0,66000,3000)) +
ggtitle("Sueldo mensual neto de SysAdmin / DevOps en Republica Argentina - 2017") +
xlab("Años.de.experiencia") + 
ylab("Salario.mensual") +
geom_boxplot()
