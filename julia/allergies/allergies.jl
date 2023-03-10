const ALLERGIES = ["eggs", "peanuts", "shellfish", "strawberries", "tomatoes", "chocolate", "pollen", "cats"]

function allergic_to(score, allergen)
    allergen in allergy_list(score)
end

function allergy_list(score)
    binary = score |> bitstring |> reverse |> collect .== '1'
    Set(ALLERGIES[binary[1:8]])
end
