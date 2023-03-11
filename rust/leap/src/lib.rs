pub fn is_leap_year(year: u64) -> bool {
    match (year % 4 == 0, year % 100 == 0, year % 400 == 0) {
        (false, _, _) => false,
        (true, true, true) => true,
        (true, true, false) => false,
        (true, false, _) => true,
    }
    
    // year % 400 == 0 || (year % 4 == 0 && year % 100 != 0) 
    
    // (year % 4 == 0) ^ (year % 100 == 0) ^ (year % 400 == 0)
}
