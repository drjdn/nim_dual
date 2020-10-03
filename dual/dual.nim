## This module implements dual numbers.

import math

type
  Dual*[T: SomeFloat] = object
    re*, dre*: T
  # Special cases for double and single floating point
  Dual64* = Dual[float64]
  Dual32* = Dual[float32]

proc dual*[T: SomeFloat](re: T, dre: T = 1.0): Dual[T] =
  ## Create a dual number.
  result.re = re
  result.dre = dre

proc dual32*(re: float32, dre: float32 = 1.0): Dual[float32] =
  ## Create dual number (32 bit IEEE single precision float).
  result.re = re
  result.dre = dre

proc dual64*(re: float64, dre: float64 = 1.0): Dual[float64] =
  ## Create a dual number (64 bit IEEE double precision float).
  result.re = re
  result.dre = dre

proc inv*[T](x: Dual[T]): Dual[T] =
  ## Reciprocal of dual number ``x``.
  result.re= 1.0 / x.re
  result.dre = -x.dre / (x.re*x.re)
  
proc `==` *[T](x, y: Dual[T]): bool =
  ## Compare two dual numbers ``x`` and ``y`` for equality.
  result = x.re == y.re and x.dre == y.dre

proc `+` *[T](x: T, y: Dual[T]): Dual[T] =
  ## Add a real number ``x`` to a dual number ``y``.
  result.re = x + y.re
  result.dre = y.dre

proc `+` *[T](x: Dual[T], y: T): Dual[T] =
  ## Add a dual number ``x`` to a real number ``y``.
  result.re = x.re + y
  result.dre = x.dre

proc `+` *[T](x, y: Dual[T]): Dual[T] =
  ## Add two dual numbers.
  result.re = x.re + y.re
  result.dre = x.dre + y.dre

proc `-` *[T](x: Dual[T]): Dual[T] =
  ## Unary minus for dual number.
  result.re = -x.re
  result.dre = -x.dre

proc `-` *[T](x: T, y: Dual[T]): Dual[T] =
  ## Subtract a dual number ``y`` from a real number ``x``.
  x + (-y)

proc `-` *[T](x: Dual[T], y: T): Dual[T] =
  ## Subtract a real number ``y`` from a dual number ``x``.
  result.re = x.re - y
  result.dre = x.dre

proc `-` *[T](x, y: Dual[T]): Dual[T] =
  ## Subtract two dual numbers.
  result.re = x.re - y.re
  result.dre = x.dre - y.dre

proc `/` *[T](x: Dual[T], y: T): Dual[T] =
  ## Divide dual number ``x`` by real number ``y``.
  result.re = x.re / y
  result.dre = x.dre

proc `/` *[T](x: T, y: Dual[T]): Dual[T] =
  ## Divide real number ``x`` by dual number ``y``.
  result = x * inv(y)

proc `/` *[T](x, y: Dual[T]): Dual[T] =
  ## Divide dual number ``x`` by dual number ``y``.
  result.re =  x.re / y.re
  result.dre = (x.dre * y.re - x.re * y.dre) / (y.re * y.re)

proc `*` *[T](x: T, y: Dual[T]): Dual[T] =
  ## Multiply a real number ``x`` and a dual number ``y``.
  result.re = x * y.re
  result.dre = x * y.dre

proc `*` *[T](x: Dual[T], y: T): Dual[T] =
  ## Multiply a dual number ``x`` with a real number ``y``.
  result.re = x.re * y
  result.dre = x.dre * y

proc `*` *[T](x, y: Dual[T]): Dual[T] =
  ## Multiply ``x`` with ``y`` (dual numbers).
  result.re = x.re * y.re
  result.dre = x.dre * y.re + x.re * y.dre

proc `+=` *[T](x: var Dual[T], y: Dual[T]) =
  ## Add ``y`` to ``x`` (dual numbers).
  x.re += y.re
  x.dre += y.dre

proc `-=` *[T](x: var Dual[T], y: Dual[T]) =
  ## Subtract ``y`` from ``x`` (dual numbers).
  x.re -= y.re
  x.dre -= y.dre

proc `*=` *[T](x: var Dual[T], y: Dual[T]) =
  ## Multiply ``y`` to ``x`` (dual numbers).
  x.re = x.re * y.re
  x.dre = x.dre * y.re + x.re * y.dre

proc `/=` *[T](x: var Dual[T], y: Dual[T]) =
  ## Divide ``x`` by ``y`` in place (dual numbers).
  x = x / y

proc `$` *(x: Dual): string =
  ## Returns ``x``'s string representation as ``"(re, im)"``.
  result = "(" & $x.re & ", " & $x.dre & ")"

proc pow*[T](x: Dual[T], y: T): Dual[T] =
  ## Dual number ``x`` raised to the power ``y``.
  result.re = pow(x.re, y)
  result.dre = x.dre * y * pow(x.re, y-1)

proc pow*[T](x, y: Dual[T]): Dual[T] =
  ## Dual number ``x`` raised to the power ``y``.
  result.re = pow(x.re, y.re)
  result.dre = x.dre * y.re * pow(x.re, y.re-1)

proc sqrt*[T](x: Dual[T]): Dual[T] =
  ## Square root for a dual number ``x``.
  result = pow(x, 0.5)
  
proc exp*[T](x: Dual[T]): Dual[T] =
  ## ``e`` raised to the power ``x``.
  var
    ex = exp(x.re)
  result.re = ex
  result.dre = x.dre * ex

proc ln*[T](x: Dual[T]): Dual[T] =
  ## Natural log of ``x``.
  result.re = ln(x.re)
  result.dre = x.dre / x.re

proc sin*[T](x: Dual[T]): Dual[T] =
  ## Sine of ``x``.
  result.re = sin(x.re)
  result.dre = x.dre * cos(x.re)

proc cos*[T](x: Dual[T]): Dual[T] =
  ## Cosine of ``x``.
  result.re = cos(x.re)
  result.dre = -x.dre * sin(x.re)

proc tan*[T](x: Dual[T]): Dual[T] =
  ## Tangent of ``x``.
  result = sin(x) / cos(x)

proc arcsin*[T](x: Dual[T]): Dual[T] =
  ## Inverse sine of ``x``.
  result.re = arcsin(x.re)
  result.dre = x.dre / sqrt(1.0 - x.re * x.re)

proc arccos*[T](x: Dual[T]): Dual[T] =
  ## Inverse cosine of ``x``.
  result.re = arccos(x.re)
  result.dre = -x.dre / sqrt(1.0 - x.re * x.re)

proc arctan*[T](x: Dual[T]): Dual[T] =
  ## Inverse tangent of ``x``.
  result.re = arctan(x.re)
  result.dre = x.dre / (1.0 + x.re * x.re)

proc sinh*[T](x: Dual[T]): Dual[T] =
  ## Hyperbolic sine of ``x``.
  result.re = sinh(x.re)
  result.dre = x.dre * cosh(x.re)

proc cosh*[T](x: Dual[T]): Dual[T] =
  ## Hyperbolic cosine of ``x``.
  result.re = cosh(x.re)
  result.dre = x.dre * sinh(x.re)

proc tanh*[T](x: Dual[T]): Dual[T] =
  ## Hyperbolic tangent of ``x``.
  var
    tanhx = tanh(x.re)
  result.re = tanhx
  result.dre = x.dre * (1.0 - tanhx *tanhx)

proc root*[T](init: Dual[T], fn: proc(x: Dual[T]): Dual[T]): T =
  ## Find the root of ``fn`` initialized at ``init`` via Newton's method.
  var
    eps: T
    x0, x1, fn1: Dual[T]
    typ: type(T)
  x0 = init
  if typ is float64:
    eps = 1e-8
  elif typ is float32:
    eps = 1e-4
  else:
    echo "Dual numbers only support single and double floating point!"
    return 0
  while true:
    fn1 = fn(x0)
    x1 = x0 - fn1.re / fn1.dre
    if abs(fn1.re) < eps:
      return x1.re
    x0 = x1


when isMainModule:
  proc `=~`[T](x, y: Dual[T]): bool =
    result = abs(x.re-y.re) < 1e-6 and abs(x.dre-y.dre) < 1e-6

  proc `=~`[T](x, y: T): bool =
    result = abs(x-y) < 1e-6
    
  var
    x: Dual64 = dual(1.75)
    z: Dual64 = dual(0.0, 0.0)    
    a: Dual64 = dual(1.0, 2.0)
    b: Dual64 = dual(-1.0, -2.0)
    f1d: Dual64 = (sin(x)*exp(x)-x)/pow(x,2.0)
    f1f: float64 = (sin(x.re)*exp(x.re)-x.re)/pow(x.re,2.0)
    df1f: float64 = ((cos(x.re)*exp(x.re)+sin(x.re)*exp(x.re)-1.0)*pow(x.re,2.0)-
                     2.0*x.re*(sin(x.re)*exp(x.re)-x.re))/pow(x.re,4.0)

  doAssert(a == a)
  doAssert((a-a) == z)
  doAssert((a+b) == z)
  doAssert((a+b) == dual(0.0, 0.0))
  doAssert((a*b) == dual(-1.0, -4.0))
  doAssert((a/b) == dual(-1.0, 0.0))
  doAssert((a/1.0) == dual(1.0, 2.0))
  doAssert((2.0/a) == dual(2.0, -4.0))
  doAssert(sqrt(x) =~ dual(sqrt(x.re), 0.5 * pow(x.re,-0.5)))  
  doAssert(exp(a) =~ dual(exp(1.0), 2.0 * exp(1.0)))
  doAssert(ln(a) =~ dual(ln(1.0), 2.0 / 1.0))
  doAssert(sin(a) =~ dual(sin(1.0), 2.0 * cos(1.0)))
  doAssert(cos(a) =~ dual(cos(1.0), -2.0 * sin(1.0)))
  doAssert(tan(x) =~ dual(tan(x.re), 1.0 / (cos(x.re) * cos(x.re))))  
  doAssert(ln(x) =~ dual(ln(x.re), 1.0 / x.re))  
  doAssert(pow(x,3.0) =~ dual(pow(x.re,3.0), 3.0 * pow(x.re, 2.0)))
  doAssert(pow(x,x) =~ dual(pow(x.re,x.re), x.re * pow(x.re, x.re-1)))        
  doAssert(f1d =~ dual(f1f, df1f))
  doAssert(root(dual(3.0), sin) =~ PI)
  echo "Tests successfully completed."
