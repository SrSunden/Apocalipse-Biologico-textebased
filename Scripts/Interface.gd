extends CanvasLayer

var horario = "8:00"
var fadiga = 200

func ready():
	update_hud()
	
func update_hud():
	$Hora.text = str(horario)
	$Fome.text = "Fome: " % str(Player.fome)
	$Sede.text = str(Player.sede)
	
	$Vida.text = str(Player.saude)
	$fadiga.text = str(fadiga)
