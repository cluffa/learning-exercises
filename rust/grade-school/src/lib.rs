use std::collections::hash_map;

pub struct School {
    students: hash_map::HashMap<u32, Vec<String>>,
}

impl School {
    pub fn new() -> School {
        School { 
            students: hash_map::HashMap::new(),
        }
    }

    pub fn add(&mut self, grade: u32, student: &str) {
        self.students.entry(grade).or_insert(Vec::<String>::new());
        self.students.get_mut(&grade).unwrap().push(student.to_string());
    }

    pub fn grades(&self) -> Vec<u32> {
        let mut grades = self.students.keys().cloned().collect::<Vec<u32>>();
        grades.sort();
        grades
    }

    // If `grade` returned a reference, `School` would be forced to keep a `Vec<String>`
    // internally to lend out. By returning an owned vector of owned `String`s instead,
    // the internal structure can be completely arbitrary. The tradeoff is that some data
    // must be copied each time `grade` is called.
    pub fn grade(&self, grade: u32) -> Vec<String> {
        let mut students = self.students.get(&grade).unwrap_or(&Vec::<String>::new()).clone();
        students.sort();
        students
    }
}
