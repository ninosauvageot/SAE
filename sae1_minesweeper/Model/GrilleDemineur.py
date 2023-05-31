# GrilleDemineur.py

from Model.Cellule import *
from Model.Coordonnee import *
from random import shuffle, randint
from itertools import filterfalse


# Méthode gérant la grille du démineur
# La grille d'un démineur est un tableau 2D régulier (rectangulaire)
#
# Il s'agira d'une liste de liste


def type_grille_demineur(grille: list) -> bool:
    """
    Détermine si le paramètre représente une grille d'un démineur.

    :param grille: objet à tester
    :return: `True` s'il peut s'agit d'une grille de démineur, `False` sinon
    """
    if type(grille) != list:
        return False
    # Récupération du nombre de lignes
    nl = len(grille)
    # Il faut que la grille comporte au moins une ligne
    if nl == 0:
        return False
    nc = len(grille[0])
    if nc == 0:
        return False
    return next(filterfalse(lambda line: type(line) == list and len(line) == nc
                            and next(filterfalse(type_cellule, line), True) is True, grille), True) is True
    # Tableau régulier
    # nc = None
    # for line in grille:
    #     if type(line) != list:
    #         return False
    #     if nc is None:
    #         nc = len(line)
    #         # Il faut que la grille comporte au moins une colonne
    #         if nc == 0:
    #             return False
    #     elif nc != len(line):
    #         return False
    #     # Test des cellules de la ligne
    #     if not next(filterfalse(type_cellule, line), True):
    #         return False
    # for cell in line:
    #     if not type_cellule(cell):
    #         return False
    # return True


def construireGrilleDemineur(nb_lignes:int, nb_colonnes:int)->list:
    if not isinstance(nb_lignes, int) or not isinstance(nb_colonnes, int):
        raise TypeError(f'construireGrilleDemineur : Le nombre de lignes {nb_lignes} ou de colonnes {nb_colonnes} n’est pas un entier.')
    if nb_lignes <=0 or nb_colonnes <= 0:
        raise ValueError(f'construireGrilleDemineur : Le nombre de lignes {nb_lignes} ou de colonnes {nb_colonnes} est négatif ou nul.')
    grille = []
    for l in range(nb_lignes):
        ligne = []
        for c in range(nb_colonnes):
            ligne.append(construireCellule())
        grille.append(ligne)
    return grille

def getNbLignesGrilleDemineur(grille:list)->int:
    if not type_grille_demineur(grille):
        raise TypeError(f'getNbLignesGrilleDemineur : Le paramètre n’est pas une grille')
    return len(grille)

def getNbColonnesGrilleDemineur(grille:list)->int:
    if not type_grille_demineur(grille):
        raise TypeError(f'getNbColonnesGrilleDemineur : Le paramètre n’est pas une grille')
    return len(grille[0])

def isCoordonneeCorrecte(grille:list,coord:tuple)->bool:
    if not type_grille_demineur(grille) or not type_coordonnee(coord):
        raise TypeError('isCoordonneeCorrecte : un des paramètres n’est pas du bon type.')
    return 0 <= coord[0] <= len(grille)-1 and 0 <= coord[1] <= len(grille[0])-1

def getCelluleGrilleDemineur(grille:list,coord:tuple)->dict:
    if not type_grille_demineur(grille) or not type_coordonnee(coord):
        raise TypeError('getCelluleGrilleDemineur : un des paramètres n’est pas du bon type')
    if not isCoordonneeCorrecte(grille,coord):
        raise IndexError('getCelluleGrilleDemineur : coordonnée non contenue dans la grille.')
    return grille[coord[0]][coord[1]]

def getContenuGrilleDemineur(grille:list,coord:tuple)->int:
    return getCelluleGrilleDemineur(grille,coord)['Contenu']

def setContenuGrilleDemineur(grille:list,coord:tuple,contenu:int)->None:
    setContenuCellule(getCelluleGrilleDemineur(grille,coord),contenu)
    return None

def isVisibleGrilleDemineur(grille:list,coord:tuple)->bool:
    return getCelluleGrilleDemineur(grille, coord)['Visible']

def setVisibleGrilleDemineur(grille:list,coord:tuple,visible:bool)->None:
    setVisibleCellule(getCelluleGrilleDemineur(grille, coord), visible)
    return None

def contientMineGrilleDemineur(grille:list,coord:tuple)->bool:
    return contientMineCellule(getCelluleGrilleDemineur(grille,coord))


def getCoordonneeVoisinsGrilleDemineur(grille:list, coord:tuple)->list:
    x = coord[0]
    y = coord[1]
    liste_voisins = []
    if not type_grille_demineur(grille) or not type_coordonnee(coord):
        raise TypeError('getCoordonneeVoisinsGrilleDemineur : un des paramètres n’est pas du bon type')
    if not isCoordonneeCorrecte(grille,coord):
        raise IndexError('getCoordonneeVoisinsGrilleDemineur :  la coordonnée n’est pas dans la grille.')
    for i in range(x-1, x+2):
        for j in range(y-1, y+2):
            if (i, j) != coord and 0<=i<=getNbLignesGrilleDemineur(grille)-1 and 0<=j<=getNbColonnesGrilleDemineur(grille)-1:
                liste_voisins.append(construireCoordonnee(i, j))
    return liste_voisins

def placerMinesGrilleDemineur(grille:list,nb:int,coord:tuple)->None:

    if nb < 0 or nb > len(grille) * len(grille[0]) - 1:
        raise ValueError("placerMinesGrilleDemineur : Nombre de bombes à placer incorrect")
    if not isCoordonneeCorrecte(grille,coord):
        raise IndexError("placerMinesGrilleDemineur : la coordonnée n’est pas dans la grille.")
    exeptions=[coord]
    compteur = 0
    while compteur < nb:
        i = randint(0, len(grille) - 1)
        j = randint(0, len(grille[0]) - 1)
        if (i, j) not in exeptions:
            setContenuGrilleDemineur(grille, (i,j), const.ID_MINE)
            exeptions.append((i,j))
            compteur+=1
    compterMinesVoisinesGrilleDemineur(grille)
    return None

def compterMinesVoisinesGrilleDemineur(grille:list)->None:
    for i in range(len(grille)):
        for j in range(len(grille[0])):
            if getContenuGrilleDemineur(grille,(i,j))!= const.ID_MINE:
                compteurmine = 0
                voisinage=getCoordonneeVoisinsGrilleDemineur(grille, (i, j))
                for k in voisinage:
                    if getContenuGrilleDemineur(grille,k)==const.ID_MINE:
                        compteurmine+=1
                setContenuGrilleDemineur(grille,(i,j),compteurmine)

    return None

def getNbMinesGrilleDemineur(grille:list)->int:
    if not type_grille_demineur(grille):
        raise ValueError ('getNbMinesGrilleDemineur : le paramètre n’est pas une grille')
    compteurmine = 0
    for i in range(len(grille)):
        for j in range(len(grille[0])):
            if getContenuGrilleDemineur(grille,(i,j))== const.ID_MINE:
                compteurmine+=1
    return compteurmine

def getAnnotationGrilleDemineur(grille: list, coord: tuple) -> str:
    return getAnnotationCellule(getCelluleGrilleDemineur(grille, coord))

def getMinesRestantesGrilleDemineur(grille: list) -> int:
    nb = 0
    for i in range(getNbLignesGrilleDemineur(grille)):
        for j in range(getNbColonnesGrilleDemineur(grille)):
            if getAnnotationGrilleDemineur(grille, (i, j)) == const.FLAG:
                nb += 1
    return getNbMinesGrilleDemineur(grille) - nb

def gagneGrilleDemineur(grille: list) -> bool:
    cpt = 0
    nbFlag = 0
    minesDecouvertes = False
    for i in range(getNbLignesGrilleDemineur(grille)):
        for j in range(getNbColonnesGrilleDemineur(grille)):
            if not contientMineGrilleDemineur(grille, (i, j)) and isVisibleGrilleDemineur(grille, (i, j)):
                cpt += 1
            if contientMineGrilleDemineur(grille, (i, j)) and isVisibleGrilleDemineur(grille, (i, j)):
                minesDecouvertes = True
            if contientMineGrilleDemineur(grille, (i, j)) and getAnnotationGrilleDemineur(grille, (i, j)) == const.FLAG:
                nbFlag += 1
    return getNbLignesGrilleDemineur(grille) * getNbColonnesGrilleDemineur(grille) - getNbMinesGrilleDemineur(
        grille) == cpt and not minesDecouvertes and getNbMinesGrilleDemineur(grille) == nbFlag
def perduGrilleDemineur(grille: list) -> bool:
    perdu = False
    for i in range(getNbLignesGrilleDemineur(grille)):
        for j in range(getNbColonnesGrilleDemineur(grille)):
            if contientMineGrilleDemineur(grille, (i, j)) and isVisibleGrilleDemineur(grille, (i, j)):
                perdu = True
    return perdu

def reinitialiserGrilleDemineur(grille: list) -> None:
    for i in range(getNbLignesGrilleDemineur(grille)):
        for j in range(getNbColonnesGrilleDemineur(grille)):
            reinitialiserCellule(getCelluleGrilleDemineur(grille, (i, j)))
    return None

def decouvrirGrilleDemineur(grille: list, coord: tuple) -> set:
    ensemble = set()
    pile = [coord]
    while pile:
        current = pile.pop()
        ensemble.add(current)
        if getContenuGrilleDemineur(grille, current) == 0:
            voisins = getCoordonneeVoisinsGrilleDemineur(grille, current)
            for v in voisins:
                if not contientMineGrilleDemineur(grille, v) and v not in ensemble:
                    pile.append(v)
                    ensemble.add(v)
    for elt in ensemble:
        setVisibleGrilleDemineur(grille, elt, True)
    return ensemble

def simplifierGrilleDemineur(grille: list, coord: tuple) -> set:
    ensemble = set()
    pile = [coord]
    while pile:
        current = pile.pop()
        if isVisibleGrilleDemineur(grille, current):
            voisins = getCoordonneeVoisinsGrilleDemineur(grille, current)
            nbFlagParmisVoisins = 0
            for v in voisins:
                if getAnnotationGrilleDemineur(grille, v) == const.FLAG:
                    nbFlagParmisVoisins += 1
            if nbFlagParmisVoisins == getContenuGrilleDemineur(grille, current):
                for v in voisins:
                    if v not in ensemble and not contientMineGrilleDemineur(grille, v):
                        setVisibleGrilleDemineur(grille, v, True)
                        ensemble.add(v)
                        pile.append(v)
    return ensemble

def ajouterFlagsGrilleDemineur(grille: list, coord: tuple) -> set:
    ensemble = set()
    voisins = getCoordonneeVoisinsGrilleDemineur(grille, coord)
    nbNonVisibleParmisVoisins= 0
    voisinsNonVisibles = []
    for v in voisins:
        if not isVisibleGrilleDemineur(grille, v):
            nbNonVisibleParmisVoisins += 1
            voisinsNonVisibles.append(v)
    if getContenuGrilleDemineur(grille, coord) == nbNonVisibleParmisVoisins:
        for v in voisinsNonVisibles:
            getCelluleGrilleDemineur(grille, v)[const.ANNOTATION] = const.FLAG
            ensemble.add(v)
    return ensemble


def simplifierToutGrilleDemineur(grille: list):
    renduesVisibles = set()
    drapeauxPlaces = set()
    modif = True
    while modif:
        for ligne in range(getNbLignesGrilleDemineur(grille)):
            for colonne in range(getNbColonnesGrilleDemineur(grille)):
                if isVisibleGrilleDemineur(grille, (ligne, colonne)):
                    a = ajouterFlagsGrilleDemineur(grille, (ligne, colonne))
                    s = simplifierGrilleDemineur(grille, (ligne, colonne))
                    renduesVisibles = renduesVisibles.union(s)
                    drapeauxPlaces = drapeauxPlaces.union(a)
                    if len(a) == 0 and len(s) == 0:
                        modif=False
    return (renduesVisibles, drapeauxPlaces)

