import strutils

proc strnatcmp0*(x, y: string, fold_case: bool): int =
  var
    xi: int = 0
    yi: int = 0
  var
    cx: char
    cy: char
  var dx: string = ""
  var dy: string = ""
  while true:
    ##  skip over leading spaces or zeros
    cx = x[xi]
    cy = y[yi]
    while isSpaceAscii(x[xi]):
      inc(xi)
      if not isdigit(x[xi]):
        cx = x[xi]
    while xi < x.len and isdigit(x[xi]):
      dx &= x[xi]
      inc(xi)
    while isSpaceAscii(y[yi]):
      inc(yi)
      if not isdigit(y[yi]):
        cy = y[yi]
    while yi < y.len and isdigit(y[yi]):
      dy &= y[yi]
      inc(yi)
    if dy != "" and dx != "":
      #echo x, " ", y
      #echo dx, " ", dy
      result = cmp(parseInt(dx), parseInt(dy))
      #echo result
      if result != 0:
        return result
      else:
        result = cmp(dx, dy)
        if result != 0:
          return result
      dx = ""
      dy = ""
    if xi >= x.len and yi >= y.len:
      ##  The strings compare the same. Perhaps the caller will want to call strcmp to break the tie.
      return 0
    if fold_case:
      cx = toUpperAscii(cx)
      cy = toUpperAscii(cy)
    result = cmp(cx, cy)
    if result != 0:
      return result
    inc(xi)
    inc(yi)

proc strnatcmp*(x, y: string): int =
  #echo x, " ", y
  return strnatcmp0(x, y, false)
