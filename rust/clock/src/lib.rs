use std::fmt;

const HOURS_PER_DAY : i32 = 24;
const MINUTES_PER_HOUR : i32 = 60;
const MINUTES_PER_DAY : i32 = MINUTES_PER_HOUR * HOURS_PER_DAY;

#[derive(Debug,PartialEq)]
pub struct Clock {
    minutes: i32
}

impl fmt::Display for Clock {
    fn fmt(&self, f: &mut fmt::Formatter<'_>) -> fmt::Result {
        write!(f, "{:02}:{:02}", (self.minutes / MINUTES_PER_HOUR) % HOURS_PER_DAY, self.minutes % MINUTES_PER_HOUR)
    }
}

impl Clock {

    fn fix_minutes(minutes: i32) -> i32 {
        if minutes >= 0 {
            return minutes % MINUTES_PER_DAY
        } else {
            return MINUTES_PER_DAY - (minutes % MINUTES_PER_DAY).abs()
        }
    }

    pub fn new_from_minutes(minutes: i32) -> Self {
        return Clock { minutes : Clock::fix_minutes(minutes) };
    }

    pub fn new(hours: i32, minutes: i32) -> Self {
        return Clock::new_from_minutes(hours * MINUTES_PER_HOUR + minutes);
    }

    pub fn add_minutes(&self, minutes: i32) -> Self {
        return Clock::new_from_minutes(self.minutes + minutes);
    }
}
