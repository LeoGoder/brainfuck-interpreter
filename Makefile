# Nom de l'exécutable
# Le nom de l'exécutable sera ajusté avec l'extension .exe sur Windows
PROGRAM_NAME_BASE = bfi

# Dossiers
SRC_DIR = src
INCLUDE_DIR = include
BUILD_DIR = build

# Détection du système d'exploitation
# Si make est exécuté sur Windows (via MinGW, MSYS2, etc.), la variable OS est souvent définie à Windows_NT
# Pour Linux/macOS, elle ne l'est généralement pas, ou est différente.
ifeq ($(OS),Windows_NT)
    # Configuration pour Windows
    CC = gcc
    # L'exécutable aura l'extension .exe sur Windows
    PROGRAM_NAME = $(PROGRAM_NAME_BASE).exe
    # Supprime le flag -fPIC car il n'est pas toujours nécessaire ou peut causer des problèmes sur Windows pour les exécutables simples
    CFLAGS = -Wall -c -I$(INCLUDE_DIR) -g
    # Options de liaison spécifiques à Windows si nécessaire (ex: -lws2_32 pour les sockets)
    LDFLAGS =
else
    # Configuration par défaut pour Linux / macOS
    CC = gcc
    PROGRAM_NAME = $(PROGRAM_NAME_BASE)
    # -fPIC est utile pour les bibliothèques partagées, inoffensif ici pour les exécutables
    CFLAGS = -Wall -c -fPIC -I$(INCLUDE_DIR)
    LDFLAGS =
endif

# Fichiers sources
SOURCES = $(wildcard $(SRC_DIR)/*.c)

# Fichiers objets
# Les fichiers objets sont toujours des .o, quel que soit le système
OBJECTS = $(patsubst $(SRC_DIR)/%.c, $(BUILD_DIR)/%.o, $(SOURCES))

# ---

# Règle par défaut : compile et lie pour créer l'exécutable
all: $(BUILD_DIR) $(PROGRAM_NAME)
	@echo "Compilation et liaison terminées."
ifeq ($(OS),Windows_NT)
	@echo "L'exécutable '$(PROGRAM_NAME)' se trouve dans le répertoire courant."
else
	@echo "L'exécutable '$(PROGRAM_NAME)' se trouve dans le répertoire courant."
endif

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
ifeq ($(OS),Windows_NT)
	# Assurez-vous de supprimer l'exécutable avec l'extension .exe sur Windows
	rm -f $(PROGRAM_NAME_BASE).exe
else
	# Assurez-vous de supprimer l'exécutable sans extension sur Linux/macOS
	rm -f $(PROGRAM_NAME_BASE)
endif
	@echo "Nettoyage terminé."

.PHONY: all clean
