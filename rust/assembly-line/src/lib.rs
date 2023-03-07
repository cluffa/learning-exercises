pub fn production_rate_per_hour(speed: u8) -> f64 {
    let rate = match speed {
        0 => 0.0,
        1..=4 => 1.0,
        5..=8 => 0.9,
        9..=10 => 0.77,
        11.. => panic!(),
    };
    return speed as f64 * 221.0 * rate;
}

pub fn working_items_per_minute(speed: u8) -> u32 {
    let prod_rate = production_rate_per_hour(speed);
    return (prod_rate / 60.) as u32;
}
