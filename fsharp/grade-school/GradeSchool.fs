module GradeSchool

type School = Map<int, string list>

let empty: School = Map.empty<int, string list>

let roster (school: School): string list =
  school
  |> Map.toSeq
  |> Seq.sortBy (fun (grade, _) -> grade)
  |> Seq.map (fun (_, students) -> students |> Seq.sort)
  |> Seq.concat
  |> Seq.toList

let grade (number: int) (school: School): string list =
  match school.TryFind(number) with
  | Some(students) -> students |> Seq.sort |> Seq.toList
  | None -> []

let add (student: string) (grade_number: int) (school: School): School =
  school
  |> Map.add grade_number (grade grade_number school @ [student])

