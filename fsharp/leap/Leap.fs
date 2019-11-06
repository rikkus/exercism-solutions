module Leap

let isEvenlyDivisibleBy dividend divisor = dividend % divisor = 0

let leapYear (year : int) : bool =
    isEvenlyDivisibleBy year 400
    || isEvenlyDivisibleBy year 4 && not (isEvenlyDivisibleBy year 100)
