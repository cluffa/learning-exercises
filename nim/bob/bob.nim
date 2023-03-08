import std/strutils

proc hey*(s: string): string =
  let s = s.strip()
  let
    question = s.endsWith("?")
    yell = s == toUpper(s) and s != toLower(s)

  if s == "":
    return "Fine. Be that way!"
  elif question and yell:
    return "Calm down, I know what I'm doing!"
  elif question:
    return "Sure."
  elif yell:
    return "Whoa, chill out!"
  else:
    return "Whatever."
  