module TwoFer

let twoFer (input : string option) : string =
    sprintf "One for %s, one for me." (match input with
                                       | None -> "you"
                                       | Some name -> name)
