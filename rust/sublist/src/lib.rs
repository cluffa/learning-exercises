#[derive(Debug, PartialEq, Eq)]
pub enum Comparison {
    Equal,
    Sublist,
    Superlist,
    Unequal,
}

pub fn sublist<T: PartialEq>(_first_list: &[T], _second_list: &[T]) -> Comparison {
    if _first_list == _second_list {
        return Comparison::Equal;
    } else if _first_list.len() == 0 {
        return Comparison::Sublist;
    } else if _second_list.len() == 0 {
        return Comparison::Superlist;
    } else if _first_list.len() == _second_list.len() {
        // lists are same size but not equal
        return Comparison::Unequal;
    } else if _first_list.len() < _second_list.len() {
        // check if first is sublist of second
        if is_sublist(_first_list, _second_list) {
            return Comparison::Sublist;
        }
    } else if _first_list.len() > _second_list.len() {
        // check if second is sublist of first (first is superlist)
        if is_sublist(_second_list, _first_list) {
            return Comparison::Superlist;
        }
    }

    return Comparison::Unequal;
}

pub fn is_sublist<T: PartialEq>(a: &[T], b: &[T]) -> bool {
    // a will always be smaller than b
    assert!(a.len() < b.len());

    // checks if any window of b with specified length matches a
    return b.windows(a.len()).any(|v| v == a);
}