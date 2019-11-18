#Sardina pilchardus
ggplot(data = filter(pesca, especie == "Sardina pilchardus", is.na(zona) == FALSE), mapping = aes(x = año, y = log_peso, color = zona)) +
  geom_point() +
  geom_smooth(se = FALSE) +
  labs(title = expression(italic("Sardina pilchardus")),
       x = "Año",
       y = "log Peso vivo(toneladas)",
       color = "Zona de pesca",
       caption = "Basado en estadísticas del gobierno de España")+
  theme(plot.title = element_text(hjust = 0.5))

#Sparus aurata
ggplot(data = filter(pesca, especie == "Sparus aurata", is.na(zona) == FALSE), mapping = aes(x = año, y = log_peso, color = zona)) +
  geom_point() +
  geom_smooth(se = FALSE) +
  labs(title = expression(italic("Sparus aurata")),
       x = "Año",
       y = "log Peso vivo(toneladas)",
       color = "Zona de pesca",
       caption = "Basado en estadísticas del gobierno de España") +
  theme(plot.title = element_text(hjust = 0.5))

#S. pilchardus + S. aurata
ggplot(data = filter(pesca, especie =="Sparus aurata" | especie == "Sardina pilchardus", is.na(zona) == FALSE), mapping = aes(x = año, y = log_peso, color = zona)) +
  geom_point() +
  geom_smooth(se = FALSE) +
  facet_wrap(~especie) +
  labs(title = "Capturas por año y zona",
       x = "Año",
       y = "log Peso vivo (toneladas)",
       caption = "Basado en estadísticas del gobierno de España") +
  theme(plot.title = element_text(hjust = 0.5))
