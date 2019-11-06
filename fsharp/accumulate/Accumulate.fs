module Accumulate

let rec doAccumulate (func: 'a -> 'b) (input: 'a list) (acc: 'b list): 'b list =
  match input with
  | head :: tail -> doAccumulate func tail ((func head) :: acc)
  | [] -> acc

let accumulate (func: 'a -> 'b) (input: 'a list): 'b list =
  doAccumulate func input []
  |> List.rev
