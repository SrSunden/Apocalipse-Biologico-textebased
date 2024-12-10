extends Node

var hora: int = 12 #Definido para começar 12h, sujeito a alteração
var minuto: int = 0

signal tempo_atualizado(hora, minuto)

func avancar_tempo(minutos:int):
	minuto += minutos
	while minuto >= 60:
		minuto -= 60
		hora += 1
	if hora >= 24:
		hora -= 24
	emit_signal("tempo_atualizado", hora, minuto)
