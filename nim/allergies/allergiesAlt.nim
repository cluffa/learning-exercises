# credit to logart on exercism for this solution
type
  Allergen* = enum
    Eggs, Peanuts, Shellfish, Strawberries, Tomatoes, Chocolate, Pollen, Cats

proc allergies*(score: int): set[Allergen] =
  # score is casted onto a set of Allergen where each bit represents an allergen
  cast[set[Allergen]](score)

proc isAllergicTo*(score: int, allergen: Allergen): bool =
  allergies(score).contains(allergen)