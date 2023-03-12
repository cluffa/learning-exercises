pub fn is_armstrong_number(num: u32) -> bool {
    let digits = num.to_string().chars().map(|c| c.to_digit(10).unwrap()).collect::<Vec<_>>();
    let power = digits.len() as u32;
    
    let mut sum:u32 = 0;
    for i in digits.iter() {
        sum = sum.saturating_add(i.pow(power));
    }

    sum == num
}
