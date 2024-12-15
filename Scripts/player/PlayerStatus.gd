extends Node

var fome = 100
var sede = 100
var saude = 100

func reduzir_fome(valor):
	fome -= valor
	if fome < 0:
		fome = 0
	verificar_estado()

func reduzir_sede (valor):
	fome -= valor
	if fome < 0:
		fome= 0
	verificar_estado()

func reduzir_saude (valor):
	saude -= valor
	if saude < 0:
		saude= 0
	verificar_estado()
	

#Nota
#Por mim, criaria uma pasta só com varios scripts para cada função:
#Redução, Adição, verificação.
#Mas vou seguir a regra do "Menos é mais" por enquanto.

func verificar_estado():
	if fome == 0 or sede == 0:
		saude -= 5
	if saude < 0:
		saude = 0

#Mais facil do que eu me lembrava
#Depois de revisar isso, percebi que era mais facil do que me lembrava, 
func restaurar (status, valor):
	
	match status:
		"fome":
			fome += valor
			if fome > 100:
				fome = 100
				
		"sede":
			sede += valor
			if sede > 100:
				fome = 100
				
		"saude":
			saude += valor
			if saude > 100:
				saude = 100
