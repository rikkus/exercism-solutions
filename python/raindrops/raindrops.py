def convert(number):
    pling_plang_plong = "".join(
      [
          "Pling" if number % 3 == 0 else "",
          "Plang" if number % 5 == 0 else "",
          "Plong" if number % 7 == 0 else ""
      ]
    )
    return pling_plang_plong if len(pling_plang_plong) > 0 else str(number)
