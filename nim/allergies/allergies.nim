import std/tables

type
  Allergen* = enum
    Eggs, Peanuts, Shellfish, Strawberries, Tomatoes, Chocolate, Pollen, Cats

const values = {
  1: Eggs,
  2: Peanuts,
  4: Shellfish,
  8: Strawberries,
  16: Tomatoes,
  32: Chocolate,
  64: Pollen,
  128: Cats
}.toTable

proc largestScore*(score: int): int =
  var
    current = 1

  while current <= score:
    current = current * 2

  return int(current/2)

proc allergies*(score: int): set[Allergen] =
  var
    largest = largestScore(score)
    result: set[Allergen]
    score = score
  
  while largest > 0:
    if score >= largest:
      score = score - largest
      if largest <= 128:
        result.incl(values[largest])
    largest = largest div 2
    
  return result

proc isAllergicTo*(score: int, allergen: Allergen): bool =
  return allergen in allergies(score)
