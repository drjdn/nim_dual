.. container:: document
   :name: documentId

   .. container::

      .. container:: row

         .. container:: three columns

            .. container::

               Group by: Section Type

            -  `Types <#7>`__

               -  `Dual <#Dual>`__
               -  `Dual64 <#Dual64>`__
               -  `Dual32 <#Dual32>`__

            -  `Procs <#12>`__

               -  `dualDual <#dual%2CT%2CT>`__
               -  `dual32Dual <#dual32%2Cfloat32%2Cfloat32>`__
               -  `dual64Dual <#dual64%2Cfloat64%2Cfloat64>`__
               -  `invDual <#inv%2CDual%5BT%5D>`__
               -  `\`==\`Dual <#%3D%3D%2CDual%5BT%5D%2CDual%5BT%5D>`__
               -  `\`+\`Dual <#%2B%2CT%2CDual%5BT%5D>`__
               -  `\`+\`Dual <#%2B%2CDual%5BT%5D%2CT>`__
               -  `\`+\`Dual <#%2B%2CDual%5BT%5D%2CDual%5BT%5D>`__
               -  `\`-\`Dual <#-%2CDual%5BT%5D>`__
               -  `\`-\`Dual <#-%2CT%2CDual%5BT%5D>`__
               -  `\`-\`Dual <#-%2CDual%5BT%5D%2CT>`__
               -  `\`-\`Dual <#-%2CDual%5BT%5D%2CDual%5BT%5D>`__
               -  `\`/\`Dual <#%2F%2CDual%5BT%5D%2CT>`__
               -  `\`/\`Dual <#%2F%2CT%2CDual%5BT%5D>`__
               -  `\`/\`Dual <#%2F%2CDual%5BT%5D%2CDual%5BT%5D>`__
               -  `\`*\`Dual <#%2A%2CT%2CDual%5BT%5D>`__
               -  `\`*\`Dual <#%2A%2CDual%5BT%5D%2CT>`__
               -  `\`*\`Dual <#%2A%2CDual%5BT%5D%2CDual%5BT%5D>`__
               -  `\`+=\`Dual <#%2B%3D%2CDual%5BT%5D%2CDual%5BT%5D>`__
               -  `\`-=\`Dual <#-%3D%2CDual%5BT%5D%2CDual%5BT%5D>`__
               -  `\`*=\`Dual <#%2A%3D%2CDual%5BT%5D%2CDual%5BT%5D>`__
               -  `\`/=\`Dual <#%2F%3D%2CDual%5BT%5D%2CDual%5BT%5D>`__
               -  `\`$\`Dual <#%24%2CDual>`__
               -  `powDual <#pow%2CDual%5BT%5D%2CT>`__
               -  `powDual <#pow%2CDual%5BT%5D%2CDual%5BT%5D>`__
               -  `sqrtDual <#sqrt%2CDual%5BT%5D>`__
               -  `expDual <#exp%2CDual%5BT%5D>`__
               -  `lnDual <#ln%2CDual%5BT%5D>`__
               -  `sinDual <#sin%2CDual%5BT%5D>`__
               -  `cosDual <#cos%2CDual%5BT%5D>`__
               -  `tanDual <#tan%2CDual%5BT%5D>`__
               -  `arcsinDual <#arcsin%2CDual%5BT%5D>`__
               -  `arccosDual <#arccos%2CDual%5BT%5D>`__
               -  `arctanDual <#arctan%2CDual%5BT%5D>`__
               -  `sinhDual <#sinh%2CDual%5BT%5D>`__
               -  `coshDual <#cosh%2CDual%5BT%5D>`__
               -  `tanhDual <#tanh%2CDual%5BT%5D>`__
               -  `rootDual <#root%2CDual%5BT%5D%2Cproc%28Dual%5BT%5D%29>`__

         .. container:: nine columns
            :name: content

            .. container::
               :name: tocRoot

            This module implements dual numbers.

            .. container:: section
               :name: 7

               .. rubric:: `Types <#7>`__
                  :name: types

               ::

                  Dual[T] = object
                    re*, dre*: T

               ::

                  Dual64 = Dual[float64]

               ::

                  Dual32 = Dual[float32]

            .. container:: section
               :name: 12

               .. rubric:: `Procs <#12>`__
                  :name: procs

               ::

                  proc dual[T: SomeFloat](re: T; dre: T = 1.0): Dual[T]

               Create a dual number.
               ::

                  proc dual32(re: float32; dre: float32 = 1.0): Dual[float32] {...}{.raises: [], tags: [].}

               Create dual number (32 bit IEEE single precision float).
               ::

                  proc dual64(re: float64; dre: float64 = 1.0): Dual[float64] {...}{.raises: [], tags: [].}

               Create a dual number (64 bit IEEE double precision
               float).
               ::

                  proc inv[T](x: Dual[T]): Dual[T]

               Reciprocal of dual number ``x``.
               ::

                  proc `==`[T](x, y: Dual[T]): bool

               Compare two dual numbers ``x`` and ``y`` for equality.
               ::

                  proc `+`[T](x: T; y: Dual[T]): Dual[T]

               Add a real number ``x`` to a dual number ``y``.
               ::

                  proc `+`[T](x: Dual[T]; y: T): Dual[T]

               Add a dual number ``x`` to a real number ``y``.
               ::

                  proc `+`[T](x, y: Dual[T]): Dual[T]

               Add two dual numbers.
               ::

                  proc `-`[T](x: Dual[T]): Dual[T]

               Unary minus for dual number.
               ::

                  proc `-`[T](x: T; y: Dual[T]): Dual[T]

               Subtract a dual number ``y`` from a real number ``x``.
               ::

                  proc `-`[T](x: Dual[T]; y: T): Dual[T]

               Subtract a real number ``y`` from a dual number ``x``.
               ::

                  proc `-`[T](x, y: Dual[T]): Dual[T]

               Subtract two dual numbers.
               ::

                  proc `/`[T](x: Dual[T]; y: T): Dual[T]

               Divide dual number ``x`` by real number ``y``.
               ::

                  proc `/`[T](x: T; y: Dual[T]): Dual[T]

               Divide real number ``x`` by dual number ``y``.
               ::

                  proc `/`[T](x, y: Dual[T]): Dual[T]

               Divide dual number ``x`` by dual number ``y``.
               ::

                  proc `*`[T](x: T; y: Dual[T]): Dual[T]

               Multiply a real number ``x`` and a dual number ``y``.
               ::

                  proc `*`[T](x: Dual[T]; y: T): Dual[T]

               Multiply a dual number ``x`` with a real number ``y``.
               ::

                  proc `*`[T](x, y: Dual[T]): Dual[T]

               Multiply ``x`` with ``y`` (dual numbers).
               ::

                  proc `+=`[T](x: var Dual[T]; y: Dual[T])

               Add ``y`` to ``x`` (dual numbers).
               ::

                  proc `-=`[T](x: var Dual[T]; y: Dual[T])

               Subtract ``y`` from ``x`` (dual numbers).
               ::

                  proc `*=`[T](x: var Dual[T]; y: Dual[T])

               Multiply ``y`` to ``x`` (dual numbers).
               ::

                  proc `/=`[T](x: var Dual[T]; y: Dual[T])

               Divide ``x`` by ``y`` in place (dual numbers).
               ::

                  proc `$`(x: Dual): string

               Returns ``x``'s string representation as ``"(re, im)"``.
               ::

                  proc pow[T](x: Dual[T]; y: T): Dual[T]

               Dual number ``x`` raised to the power ``y``.
               ::

                  proc pow[T](x, y: Dual[T]): Dual[T]

               Dual number ``x`` raised to the power ``y``.
               ::

                  proc sqrt[T](x: Dual[T]): Dual[T]

               Square root for a dual number ``x``.
               ::

                  proc exp[T](x: Dual[T]): Dual[T]

               ``e`` raised to the power ``x``.
               ::

                  proc ln[T](x: Dual[T]): Dual[T]

               Natural log of ``x``.
               ::

                  proc sin[T](x: Dual[T]): Dual[T]

               Sine of ``x``.
               ::

                  proc cos[T](x: Dual[T]): Dual[T]

               Cosine of ``x``.
               ::

                  proc tan[T](x: Dual[T]): Dual[T]

               Tangent of ``x``.
               ::

                  proc arcsin[T](x: Dual[T]): Dual[T]

               Inverse sine of ``x``.
               ::

                  proc arccos[T](x: Dual[T]): Dual[T]

               Inverse cosine of ``x``.
               ::

                  proc arctan[T](x: Dual[T]): Dual[T]

               Inverse tangent of ``x``.
               ::

                  proc sinh[T](x: Dual[T]): Dual[T]

               Hyperbolic sine of ``x``.
               ::

                  proc cosh[T](x: Dual[T]): Dual[T]

               Hyperbolic cosine of ``x``.
               ::

                  proc tanh[T](x: Dual[T]): Dual[T]

               Hyperbolic tangent of ``x``.
               ::

                  proc root[T](init: Dual[T]; fn: proc (x: Dual[T]): Dual[T]): T

               Find the root of ``fn`` initialized at ``init`` via
               Newton's method.

      .. container:: row

         .. container:: twelve-columns footer

            Made with Nim. Generated: 2020-10-03 18:37:03 UTC
