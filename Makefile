# Nom de l'exécutable
# Vous pouvez changer 'my_program' par le nom souhaité pour votre exécutable final
PROGRAM_NAME = bfi

# Dossiers
SRC_DIR = src
INCLUDE_DIR = include
BUILD_DIR = build

# Fichiers sources
SOURCES = $(wildcard $(SRC_DIR)/*.c)

# Fichiers objets
OBJECTS = $(patsubst $(SRC_DIR)/%.c, $(BUILD_DIR)/%.o, $(SOURCES))

# Compilateur
CC = gcc

# Options de compilation pour les fichiers objets
# -Wall: Active tous les avertissements
# -c: Compile et assemble les fichiers source, mais ne les lie pas
# -I$(INCLUDE_DIR): Spécifie le répertoire des fichiers d'inclusion
CFLAGS = -Wall -c -I$(INCLUDE_DIR) -g

# Options de liaison (linking)
# Pas d'options spécifiques ici, mais vous pourriez en ajouter pour des bibliothèques externes (-lm pour math, etc.)
LDFLAGS =

# ---

# Règle par défaut : compile et lie pour créer l'exécutable
all: $(BUILD_DIR) $(PROGRAM_NAME)
	@echo "Compilation et liaison terminées. L'exécutable '$(PROGRAM_NAME)' se trouve dans le répertoire courant."

# Créer le répertoire 'build' s'il n'existe pas
$(BUILD_DIR):
	mkdir -p $(BUILD_DIR)

# Règle pour compiler les fichiers objets
# $<: Le premier prérequis (le fichier .c)
# $@: La cible (le fichier .o)
$(BUILD_DIR)/%.o: $(SRC_DIR)/%.c
	$(CC) $(CFLAGS) -o $@ $<

# Règle pour créer l'exécutable à partir des fichiers objets
# $^: Tous les prérequis (tous les fichiers .o)
$(PROGRAM_NAME): $(OBJECTS)
	$(CC) $(LDFLAGS) -o $@ $^

# Règle pour nettoyer les fichiers générés
clean:
	@echo "Nettoyage des fichiers générés..."
	rm -rf $(BUILD_DIR) $(PROGRAM_NAME)
	@echo "Nettoyage terminé."

.PHONY: all clean
