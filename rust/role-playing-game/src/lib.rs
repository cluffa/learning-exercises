pub struct Player {
    pub health: u32,
    pub mana: Option<u32>,
    pub level: u32,
}

impl Player {
    pub fn revive(&self) -> Option<Player> {
        if self.health == 0 {
            Some(Player {
                health: 100,
                mana: self.mana.map(|mana| if self.level >= 10 { mana + 100 } else { mana }),
                level: self.level,
            })
        } else {
            None
        }
    }

    pub fn cast_spell(&mut self, mana_cost: u32) -> u32 {
        if self.mana.is_none() {
            self.health = self.health.saturating_sub(mana_cost);
            0
        } else if self.mana < Some(mana_cost) {
            0
        } else {
            self.mana = Some(self.mana.unwrap().saturating_sub(mana_cost));
            mana_cost * 2
        }
    }
}
