#! a. Crear el torneo con fechas de inicio y final.
db.periodoTorneo.insert({"Fecha Inicial":"05/12/2021","Fecha Final":"05/05/2022"})

#! b. Inscribir, modificar y eliminar equipos.
db.equipos.insert({"Nombre":"Equipo Prueba Soccer","Ciudad":"Barranquilla","Año":2001})

db.equipos.update({_id:ObjectId("61d7add6272dcce41b4ba6cd")}, {$set:{"Ciudad":"Pereira"}})

db.equipos.deleteOne({"_id": ObjectId("61d7add6272dcce41b4ba6cd")})

#! c.Inscribir, modificar y eliminar deportistas a los equipos.
db.deportistas.insert({"Nombres": "Pedro",
                       "Apellidos": "Gomez Salazar",
                       "Edad": 20,
                       "Cedula": 1004105789,
                       "Celular": 3007854422,
                       "Equipo": "Rangers Sa",
                       "Ranking": 7.8,
                       "Nacionalidad": "Colombiano",
                       "Ciudad": "Bogotá" })

db.deportistas.update({"_id": ObjectId("61d7214433c9f0547630c55c")},{
                       $set: {
                                "Nombres": "Coco",
                                "Apellidos": "Indumi Salazar"
                            }
                       })

db.deportistas.deleteOne({"_id": ObjectId("61d7214433c9f0547630c55c")})

#! d.Crear, modificar  y eliminar encuentros deportivos.
db.encuentros.insert({"Fecha": "22/12/2020",
                       "Hora": "8:00 am",
                       "Lugar": "Sala Deportiva del Sisi",
                       "Equipo Local": "Dinamit Out",
                       "Equipo Visitante": "Rangers Sa",
                       "Estado": "Jugando",
                       "Resultado Final": "Victoria",
                       "Arbitros": [
                           "Jose Torres Paz",
                           "Daniel Andres Parra Perez"
                       ]})

db.encuentros.update({"_id": ObjectId("61d725fb33c9f0547630c55f")},{
                       $set: {
                                "Estado": "Terminado",
                                "Resultado Final": "Perdido"
                            }
                       })

db.encuentros.deleteOne({"_id": ObjectId("61d725fb33c9f0547630c55f")})


#! e.Registrar resultados de eventos deportivos.
db.tablaPosiciones.insert({"Posición": 3,
                           "Equipo": "Dinamit Out",
                           "Partidos Jugados": 3,
                           "Victorias": 2,
                           "Empates": 0,
                           "Derrotas": 1,
                           "Puntos": 2})

#! f.Reportar el ranking de los deportistas con mejor rendimiento
db.deportistas.find({"Ranking": { $gte: 8 }}, {"_id": 0, "Nombres": 1, "Apellidos": 1, "Ranking": 1}).sort({"Ranking": -1})
