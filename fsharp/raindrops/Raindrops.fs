module Raindrops
open System

let convert (n: int): string =
  let l = [
    (if n % 3 = 0 then "Pling" else "");
    (if n % 5 = 0 then "Plang" else "");
    (if n % 7 = 0 then "Plong" else "")
  ]
  let s = String.Join("", l)

  if s.Length = 0 then n.ToString() else s