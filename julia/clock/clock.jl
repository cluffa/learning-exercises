# using built in Dates.Time instead of custom Clock
using Dates: Time, Hour, Minute, format, @dateformat_str
Clock(hour, minute) = Time(0) + Hour(hour) + Minute(minute)
Base.sprint(f::Function, t::Time) = sprint(f, format(t, dateformat"HH:MM"))