pub struct Allergies {
    allergies: Vec<Allergen>
}

#[derive(Debug, PartialEq, Eq, PartialOrd, Ord, Clone, Copy)]
pub enum Allergen {
    Eggs,
    Peanuts,
    Shellfish,
    Strawberries,
    Tomatoes,
    Chocolate,
    Pollen,
    Cats,
}

impl Allergen {
    pub fn names() -> Vec<Allergen> {
        vec![
            Allergen::Eggs,
            Allergen::Peanuts,
            Allergen::Shellfish,
            Allergen::Strawberries,
            Allergen::Tomatoes,
            Allergen::Chocolate,
            Allergen::Pollen,
            Allergen::Cats,
        ]
    }
}

impl Allergies {
    pub fn new(score: u32) -> Self {
        let c = format!("{:b}", score); // Create a binary string
        Allergies {
            allergies: Allergen::names()
                .iter()
                .zip(c.chars().rev())
                .filter(|(_, c)| c == &'1')
                .map(|(a, _)| a.clone())
                .collect()
        }
    }

    pub fn is_allergic_to(&self, allergen: &Allergen) -> bool {
        self.allergies.contains(allergen)
    }

    pub fn allergies(&self) -> Vec<Allergen> {
        self.allergies.clone()
    }
}
