# Model/Cellule.py
#

from Model.Constantes import *

#
# Modélisation d'une cellule de la grille d'un démineur
#


def type_cellule(cell: dict) -> bool:
    """
    Détermine si le paramètre est une cellule correcte ou non

    :param cell: objet dont on veut tester le type cellule
    :return: True si c'est une cellule, False sinon
    """
    return type(cell) == dict and const.CONTENU in cell and const.VISIBLE in cell \
        and type(cell[const.VISIBLE] == bool) and type(cell[const.CONTENU]) == int \
        and (0 <= cell[const.CONTENU] <= 8 or cell[const.CONTENU] == const.ID_MINE)

def isContenuCorrect(val:int)->bool:
    return isinstance(val, int) and 0 <= val <= 8 or val == const.ID_MINE

def construireCellule(val:int=0,visible:bool=False)-> dict:
    if val != const.ID_MINE and 0 > val or 8 < val:
        raise ValueError(f'construireCellule : le contenu {val} n’est pas correct')
    if not isinstance(visible, bool):
        raise TypeError(f'construireCellule : le second paramètre {type(visible)} n’est pas un booléen')
    dic = {}
    dic['Contenu'] = val
    dic['Visible'] = visible
    dic[const.ANNOTATION] = None
    return dic

def getContenuCellule(cellule:dict)->int:
    if not type_cellule(cellule):
        raise TypeError('getContenuCellule : Le paramètre n’est pas une cellule.')
    return cellule['Contenu']

def isVisibleCellule(cellule:dict)->bool:
    if not type_cellule(cellule):
        raise TypeError('isVisibleCellule : Le paramètre n’est pas une cellule.')
    return cellule['Visible']

def setContenuCellule(cellule:dict,c:int)->None:
    if not type_cellule(cellule):
        raise TypeError('setContenuCellule : Le premier paramètre n’est pas une cellule.')
    if not isinstance(c, int) or isinstance(c, bool):
        raise TypeError('setContenuCellule : Le second paramètre n’est pas un entier.')
    if c != const.ID_MINE and 0 > c or 8 < c:
        raise ValueError(f'setContenuCellule : la valeur du contenu {c} n’est pas correcte.')
    cellule['Contenu']=c
    return None

def setVisibleCellule(cellule:dict,v:bool)->None:
    if not type_cellule(cellule):
        raise TypeError('setVisibleCellule : Le premier paramètre n’est pas une cellule.')
    if not isinstance(v, bool):
        raise TypeError('setVisibleCellule : Le second paramètre n’est pas un entier.')
    cellule['Visible']=v
    return None

def contientMineCellule(cellule:dict)->bool:
    if not type_cellule(cellule):
        raise TypeError('contientMineCellule : Le paramètre n’est pas une cellule.')
    result = False
    if cellule['Contenu'] == const.ID_MINE:
        result = True
    return result

def isAnnotationCorrecte(annotation:str)->bool:
    return annotation in (None, const.FLAG, const.DOUTE)

def getAnnotationCellule(cellule:dict)->str:
    if not type_cellule(cellule):
        raise TypeError(f'getAnnotationCellule : le paramètre {cellule} n’est pas une cellule ')
    if const.ANNOTATION not in cellule.keys():
        res = None
    else:
        res = cellule[const.ANNOTATION]
    return res

def changeAnnotationCellule(cellule: dict) -> None:
    if not type_cellule(cellule):
        raise TypeError('changeAnnotationCellule : le paramètre n’est pas une cellule')
    annotations = (None, const.FLAG, const.DOUTE)
    cellule[const.ANNOTATION] = annotations[(annotations.index(getAnnotationCellule(cellule))+1)%3]
    return None

def reinitialiserCellule(cellule: dict) -> None:
    cellule['Visible'] = False
    cellule['Contenu'] = 0
    cellule[const.ANNOTATION] = None
    return None

