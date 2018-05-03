--		Copyright 2006 by Daniel R. Grayson

document {
     Key => "lists and sequences",
     "In this section we give an overview of the use of lists of all types, including:",
     UL {
	  SPAN {"basic lists (of class ", TO "BasicList", ")," },
	  SPAN {"visible lists (of class ", TO "VisibleList", ")," },
	  SPAN {"lists (of class ", TO "List", ")," },
	  SPAN {"sequences (of class ", TO "Sequence", "), and" },
	  SPAN {"arrays (of class ", TO "Array", ")." },
	  SPAN {"mutable lists (of class ", TO "MutableList", ")." },
	  },
     SUBSECTION "lists",
     "A list is a handy way to store a series of things.  We create one
     by separating the elements of the series by commas and surrounding 
     the series with braces.",
     EXAMPLE "x = {a,b,c,d,e}",
     "We retrieve the length of a list with the operator ", TO "#", " or with the function ", TT "length", ".",
     EXAMPLE {"#x","length x"},
     "We use the expression ", TT "x#n", " to obtain the n-th element of ", TT "x", ".  The elements are numbered consecutively starting with ", TT "0", ".
     Alternatively, they are numbered consecutively ending with ", TT "-1", ".",
     EXAMPLE {"x#2","x#-2"},
     "The functions ", TO "first", " and ", TO "last", " retrieve the first and last elements of a list.",
     EXAMPLE lines ///
          first x
	  last x
     ///,
     PARA {
	  "Omitting an element of a list causes the symbol ", TO "null", " to 
	  be inserted in its place."
	  },
     EXAMPLE lines (///
      	  g = {3,4,,5}
       	  peek g
     ///),
     PARA {
	  "Lists can be used as vectors, provided their elements are the sorts of
	  things that can be added and mutliplied."},
     EXAMPLE "10000*{3,4,5} + {1,2,3}",
     "If the elements of a list are themselves lists, we say that we have
     a nested list.",
     EXAMPLE {
	  "y = {{a,b,c},{d,{e,f}}}",
	  "#y"
	  },
     "One level of nesting may be eliminated with ", TO "flatten", ".",
     EXAMPLE "flatten y",
     "A table is a list whose elements are lists all of the same length.  
     The inner lists are regarded as rows when the table is displayed as a
     two-dimensional array with ", TO "MatrixExpression", ".",
     EXAMPLE lines ///
	  z = {{a,1},{b,2},{c,3}}
	  isTable z
      	  MatrixExpression z
     ///,
     SUBSECTION "sequences",
     "Sequence are like lists, except that parentheses are used instead of braces to create them and to print them.  Sequences
     are implemented in a more efficient way than lists, since a sequence is created every time a function is called with more than one argument.  
     Another difference is that new types of list can be created by the user, but not new types of sequence.",
     EXAMPLE lines ///
          x = (a,b,c,d,e)
	  #x
	  x#2
     ///,
     "It is a bit harder to create a sequence of length 1, since no comma
     would be involved, and parentheses are also used for simple grouping
     of algebraic expressions.",
     EXAMPLE lines ///
          ()
	  (a)
	  (a,b)
     ///,
     "Most of the functions that apply to lists also work with sequences.  We
     give just one example.",
     EXAMPLE "append(x,f)",
     "The functions ", TO "toList", " and ", TO "toSequence", " are provided
     for converting between lists to sequences.",
     EXAMPLE {
	  "toList x",
	  "toSequence oo",
	  },
     "Other functions for dealing especially with sequences
     include ", TO "sequence", " and ", TO "deepSplice", ".",
     SUBSECTION "arrays",
     "An array is like a list, except that brackets are used instead of
     braces when entering or displaying an array, and arrays can't be used
     as vectors.  Their main use is notational: for example, they appear
     in the construction of polynomial rings.",
     EXAMPLE {
	  "v = [a,b,c]",
	  "v#2",
	  "ZZ[a,b,c]"
	  },
     SUBSECTION "visible lists",
     "Lists, sequences, and arrays are the three examples of what we call visible lists, which constitute the class ", TO "VisibleList", ".  Many functions
     are defined to act uniformly on visible lists.",
     EXAMPLE lines ( ///
     	  {a,b,c}
     	  class oo
     	  parent oo
     /// ),
     SUBSECTION "basic lists",
     "There is a type of list more general than a visible list, which we call a basic list.  Basic lists can be used for representing new datatypes
     in a more secure way, since the many functions that act on lists and sequences do not act on basic lists.",
     EXAMPLE lines ( ///
     	  {a,b,c}
     	  class oo
     	  parent oo
     	  parent oo
     /// ),
     "We can make a basic list with the ", TO "new", " operator.",
     EXAMPLE "new BasicList from {a,b,c}",
     "Similarly, we can make a new type of basic list, called ", TT "Container", ", say.",
     EXAMPLE "Container = new Type of BasicList",
     "We can make a new list of type Container.",
     EXAMPLE "t = new Container from {a,b}",
     "Some functions work on basic lists.",
     EXAMPLE "join(t,t)",
     "We can make a new method for the operator ", TT "++", ", say, that will join two such lists.",
     EXAMPLE lines ///
	 Container ++ Container := join;
	 t ++ t
     ///,
     SUBSECTION "mutable lists",
     "The elements of a basic list cannot normally be replaced by others.  However, there is a certain type of
     basic list, called a mutable list (of class ", TO "MutableList", "), whose elements can be changed.  Because
     the elements of a mutable list can be changed, circular structures can be created that would cause a print
     routine to go into an infinite loop.  We avoid such infinite loops by not printing out the contents of mutable 
     lists.  Instead, one uses ", TO "peek", " to display the elements in a controlled way.",
     EXAMPLE lines ///
	  s = new MutableList from {a,b,c}
      	  peek s
      	  s#2 = 1234;
	  s
      	  peek s
     ///,
     "Because the contents of mutable lists are not printed, they can be used as containers for big things that one
     normally doesn't want printed.  For this purpose we have a special type of mutable list called a bag (of class ", TO "Bag", "),
     that displays, when printed, a little information about its contents.",
     EXAMPLE lines ///
     	  Bag {100!}
	  peek oo
     ///,     
     SUBSECTION "summary",
     "We can see the hierarchy of types mentioned above using ", TO "showStructure", ".",
     EXAMPLE lines ///
        showStructure(List,Sequence,Array,Container,MutableList,Bag,BasicList)
     ///,
     Subnodes => {
	  TO "ranges and repetitions",
     	  "basic access methods",
	  TO (symbol #, BasicList),
	  TO (symbol #, BasicList, ZZ),
	  TO (symbol #?, BasicList, ZZ),
	  TO (symbol _, VisibleList, ZZ),
	  TO (symbol _, VisibleList, List),
	  TO first,
	  TO last,
	  "Conversions",
	  TO toList,
	  TO toSequence,
	  TO sequence,
	  TO unsequence,
     	  "manipulating lists and sequences",
	  TO append,
	  TO between,
	  TO delete,
	  TO drop,
	  TO flatten,
	  TO fold,
	  TO join,
	  TO (symbol|,List,List),
	  TO mingle,
	  TO pack,
	  TO prepend,
	  TO reverse,
	  TO rsort,
	  TO sort,
	  TO subtable,
	  TO table,
	  TO take,
	  TO unique,
     	  "applying functions to elements of lists",
	  TO (apply,BasicList,Function),
	  TO (scan,BasicList,Function),
     	  "testing elements of lists",
	  TO (all,BasicList,Function),
	  TO (any,BasicList,Function),
     	  "finding things in lists",
	  TO (position,VisibleList,Function),
	  TO (positions,VisibleList,Function),
	  TO (select,BasicList,Function),
	  TO (select,ZZ,BasicList,Function),
	  "more information",
	  TO VisibleList,
	  TO BasicList
	  }
     }

document {
     Key => "ranges and repetitions",
     PARA {
	  "In this section we discuss the use of ranges and repetitions."
	  },
     SUBSECTION "ranges",
     "The operator ", TO "..", " can be used to create sequences of numbers,
     sequences of subscripted variables, or sequences of those particular 
     symbols that are known to ", TO "vars", ", and so on.",
     EXAMPLE lines ///
	  1 .. 5, y_1 .. y_5, a .. e
     ///,
     SUBSECTION "repetitions",
     "The operator ", TO (symbol :, ZZ, Thing), " is used to create sequences by replicating something a certain number of times.",
     EXAMPLE "12:a",
     "Replicating something once results in a sequence of length 1, which cannot be entered by simply typing parentheses.",
     EXAMPLE { "1:a", "(a)" },
     SUBSECTION "ranges and repetitions in lists",
     "Notice what happens when we try to construct a list using ", TO "..", " or ", TO ":", ".",
     EXAMPLE {
	  "z = {3 .. 6, 9, 3:12}",
	  },
     "The result above is a list of length 3 some of whose elements are sequences.
     This may be a problem if the user intended to produce the list 
     ", TT "{3, 4, 5, 6, 9, 12, 12, 12}", ".  The function ", TO "splice", " can
     be used to flatten out one level of nesting - think of it as removing those
     pairs of parentheses that are one level inward.",
     EXAMPLE "splice z",
     "The difference between ", TO "splice", " and ", TO "flatten", " is, essentially, that
     ", TO "flatten", " removes braces one level inward.",
     EXAMPLE lines ///
         flatten {a,{b,c}}
         splice {a,(b,c)}
     ///,
     "The function ", TO "toList", " converts sequences to lists.",
     EXAMPLE lines ///
          1..6
          toList(1..6)
     ///,
     "Many operators and functions will splice lists presented to them.  For example, when
     creating a polynomial ring, the array of variables and the list of degrees are spliced for you.",
     EXAMPLE lines ///
         QQ[a..c,x_1..x_4, Degrees => { 3:1, 4:2 }]
	 degrees oo
     ///
     }

document {
     Key => BasicList,
     Headline => "the class of all basic lists",
     PARA {"For an overview of lists and sequences, see ", TO "lists and sequences", "."},
     "A basic list is a sequence of expressions indexed by a seequence of consecutive integers of the form
     ", TT "0", ", ", TT "1", ", ..., ", TT "N-1", ".  The number ", TT "N", " is called the length of the list.",
     PARA{},
     "There are various types of basic lists, depending on the application, and they are displayed in different ways.
     The types first encountered are those of type ", TO "VisibleList", ", but new types are easy to introduce.
     In the following example we introduce a new type of basic list called ", TT "L", ".",
     EXAMPLE {
	  "L = new Type of BasicList",
	  "x = new L from {a,b,c,d}",
	  "join(x,x)"
	  }
     }

document {
     Key => VisibleList,
     Headline => "the class of all visible lists",
     "There are three types of lists that can be entered directly from
     the keyboard, as follows.",
     EXAMPLE {
	  "{a,b,c}",
	  "[a,b,c]",
	  "(a,b,c)",
	  },
     "We introduce the class of visible lists as a convenience for
     referring to lists of these types.",
     Subnodes => {
	  TO List,
	  TO Sequence,
	  TO Array
	  }
     }

document {
     Key => List,
     Headline => "the class of all lists -- {...}",
     "Lists in Macaulay2 consist of elements of any type, enclosed in braces, and separated by commas.",
     EXAMPLE "L = {a,1,b,2}",
     "The length of a list has two notations, the version with the ",  TT "#", " is faster when writing programs.",
     EXAMPLE "#L, length L",
     "The first entry of the list has index 0.  Indexing is performed using ", TO symbol#, ".",
     EXAMPLE "L#2",
     PARA{
	  "Lists in Macaulay2 are immutable. See ", TO MutableList, " for making and using lists that you may modify."
	  },
     PARA {
	  "To convert lists to and from other types of ", TO "BasicList", ", in addition to ", TO "toList", ", one may use ", TO "new", "."
	  },
     EXAMPLE lines ///
     new Array from {a,b,c}
     new List from [a,b,c]
     ///,
     PARA {"For an overview of lists and sequences, see ", TO "lists and sequences", "."},
     }

document {
     Key => Array,
     Headline => "the class of all arrays -- [...]",
     PARA {
	  "An array can be created by enclosing elements of any type in brackets."
	  },
     EXAMPLE lines ///
     x = [a,b,c]
     # x
     x#1
     ///,
     PARA {
	  "To convert arrays to and from other types of ", TO "BasicList", ", one may use ", TO "new", "."
	  },
     EXAMPLE lines ///
     new Array from {a,b,c}
     new Sequence from [a,b,c]
     ///,
     PARA {"For an overview of lists and sequences, see ", TO "lists and sequences", "."}
     }

document {
     Key => Sequence,
     Headline => "the class of all sequences -- (...)",
     PARA {
	  "A sequence is an ordered collection of things enclosed by parentheses
	  and separated by commas.  Use ", TO "#", " to get the length of a
	  sequence of to get one of the elements."
	  },
     EXAMPLE {
	  "v = (a,b,c)",
	  "#v",
	  "v#2"
	  },
     PARA {
	  "To convert sequences to and from other types of ", TO "BasicList", ", in addition to ", TO "toSequence", ", one may use ", TO "new", "."
	  },
     EXAMPLE lines ///
     new Array from (a,b,c)
     new Sequence from [a,b,c]
     ///,
     PARA {"For an overview of lists and sequences, see ", TO "lists and sequences", "."},
     }

document {
     Key => (symbol :, ZZ, Thing),
     Headline => "repeat an item",
     TT "n : x", " repetition ", TT "n", " times of ", TT "x", " in a sequence",
     PARA{},
     "If ", TT "n", " is an integer and ", TT "x", " is anything, return a
     sequence consisting of ", TT "x", " repeated ", TT "n", " times.  A negative 
     value for ", TT "n", " will silently be treated as zero.",
     PARA{},
     "Warning: such sequences do not get automatically spliced into lists
     containing them.",
     PARA{},
     EXAMPLE { "{5:a,10:b}", "splice {5:a,10:b}" },
     SeeAlso => {splice, (symbol..,ZZ,ZZ), "ranges and repetitions"}
     }

document {
     Key => {toSequence,(toSequence, BasicList)},
     Headline => "convert to sequence",
     TT "toSequence x", " -- yields the elements of a list ", TT "x", " as a sequence.",
     PARA{},
     "If ", TT "x", " is a sequence, then ", TT "x", " is returned.",
     PARA{},
     EXAMPLE {
	  "toSequence {1,2,3}"
	  },
     }

undocumented (deepSplice,BasicList)
document {
     Key => deepSplice,
     Headline => "remove subsequences",
     TT "deepSplice v", " -- yields a new list v where any members of v 
     which are sequences are replaced by their elements, and so on.",
     PARA{},
     "Works also for sequences, and leaves other expressions unchanged.
     Copying the list v is always done when v is mutable.",
     EXAMPLE "deepSplice { (a,b,(c,d,(e,f))), g, h }",
     SeeAlso => "splice"
     }

document {
     Key => {splice,(splice, BasicList)},
     Headline => "remove subsequences",
     TT "splice v", " -- yields a new list v where any members of v that are sequences
     are replaced by their elements.",
     PARA{},
     "Works also for sequences, and leaves other expressions unchanged.
     Copying the list v is always done when v is mutable.
     Certain functions always splice their arguments or their argument
     lists for the sake of convenience.",
     EXAMPLE {
	  "splice ((a,b),c,(d,(e,f)))",
      	  "splice [(a,b),c,(d,(e,f))]",
	  },
     SeeAlso => "deepSplice"
     }

document {
     Key => MutableList,
     Headline => "the class of all mutable lists",
     PARA {"For an overview of lists and sequences, see ", TO "lists and sequences", "."},
     PARA{},
     "Normally the entries in a mutable list are not printed, to prevent
     infinite loops in the printing routines.  To print them out, use 
     ", TO "peek", ".",
     EXAMPLE {
	  "s = new MutableList from {a,b,c};",
      	  "s#2 = 1234;",
	  "s",
      	  "peek s",
	  },
     SeeAlso => {"BasicList"}
     }

doc///
 Key
  accumulate
  (accumulate, Function, Thing, VisibleList)
  (accumulate, Function, VisibleList)
  (accumulate, VisibleList, Thing, Function)
  (accumulate, VisibleList, Function)
 Headline
  apply a binary operator repeatedly
 Usage
  accumulate(f, x, L)
  accumulate(f, L)
  accumulate(L, x, f)
  accumulate(L, f)
 Inputs
  f:Function
  x:Thing
  L:VisibleList
 Outputs
  M:List
 Description
  Text
   Suppose {\tt L=\{x0, x1, ..., xn\}}. Then for any binary operator {\tt f}, 
   {\tt accumulate(f, L)} returns the list {\tt \{f(x0, x1), f(f(x0, x1), x2), ...\} }. 
   In other words, the binary operator is applied
   to the first two elements of {\tt L}, then to that result along with the next unused element of
   {\tt L}, and so forth.
  Example
   accumulate(plus, {0,1,2,3,4,5})
   accumulate(concatenate, {a,b,c,d,e})
   accumulate((i,j) -> i|j|i, {"a","b","c","d","e"})
  Text
   If {\tt accumulate(f, x, L)} is called, the element {\tt x} is used as the first argument of the
   binary function {\tt f}. In other words, {\tt accumulate(f, \{x0, x1, \ldots, xn\})} is 
   equivalent to {\tt accumulate(f, x0, \{x1, \ldots, xn\})}.
  Example
   accumulate(plus, 0, {1,2,3,4,5})
   accumulate((x, y) -> x^y, 2, {3,2,1,2})
  Text
   The function {\tt accumulate(\{x_0, x_1, \ldots, x_n\}, f)} returns the
   list {\tt \{..., f(x_{n-2}, f(x_{n-1}, x_n)), f(x_{n-1}, x_n) \} }. That is, {\tt f} is applied
   to the last two elements of the list, and the result placed at the end of the output. Then 
   the accumulation proceeds backwards through the list. The optional argument {\tt x} in
   {\tt accumulate(L, x, f)} is used as the second argument in the first evaluation of
   {\tt f}. So {\tt accumulate(\{x_0, x_1, \ldots, x_{n-1}\}, x_n, f)} is equivalent
   to {\tt accumulate(\{x_0, x_1, \ldots, x_n\}, f)}.
  Example
   accumulate({a,b,c,d,e}, concatenate)
   accumulate({a,b,c,d}, e, concatenate)  
   accumulate({2,3,2,1}, 2, (x, y) -> x^y)
  Text
   The difference between {\tt fold} and @TO accumulate@ is that {\tt fold} returns the
   final result of all the nested evaluations of {\tt f}, while {\tt accumulate} lists 
   all the intermediate values as well.
  Example
   fold({2,3,2,1}, 2, (x,y) -> x^y)
 SeeAlso
  apply
  fold
  "lists and sequences"
///

doc///
 Key
  commonest
  (commonest, VisibleList)
  (commonest, Set)
  (commonest, Tally)
 Headline
  the most common elements of a list or tally
 Usage
  commonest A
 Inputs
  A:VisibleList
 Outputs
  L:List
   a list of the elements of {\tt A} with the most repetitions
 Description
  Text
   If a single element is the most common, a list of length one is the output.
  Example
   commonest {a,a,a,a,b,b,b,c,c,d,e}
  Text
   In the case of a tie, all commonest elements are returned.
  Example
   A = {a,a,a,a,b,b,b,b,c,c,c,c,d,e}; commonest A
  Text
   {\tt commonest} works on @TO Tally@s and @TO Set@s as well.
  Example
   T = tally A
   commonest T
   S = set A
   commonest S
  Text
   (Since every element of a set is unique, it is unclear why one would need {\tt commonest(Set)}.)
 SeeAlso
  number
  same
  set
  tally
  unique
  "lists and sequences"
///

doc ///
 Key
  drop
  (drop, BasicList, ZZ)
  (drop, BasicList, List)
 Headline
  Drop some elements from a list or sequence.
 Usage
  drop(L, i)
  drop(L, {j,k})
 Inputs
  L: BasicList
  i: ZZ
  j: ZZ
  k: ZZ
 Outputs
  L2: BasicList
   the list or sequence obtained by dropping the first {\tt i} elements of {\tt L},
   (if {\tt i} positive), or the last {\tt i} elements of {\tt L} (if {\tt i} negative), or, if given the
   pair {\tt j,k}, the list or sequence obtained by dropping the elements of {\tt L} with indices {\tt j} through {\tt k}
 Description
  Example
   drop({a,b,c,d,e,f,g}, 3)
   drop({a,b,c,d,e,f,g}, -3)
   drop({a,b,c,d,e,f,g}, {1,3})
   drop({a,b,c,d,e,f,g}, {2,2})    
  Text
   The pair {\tt \{j,k\}} must be given with both entries non-negative, and $j\le k$. Otherwise the original list is returned.
  Example
   drop({a,b,c,d,e,f,g}, {3,1})
   drop({a,b,c,d,e,f,g}, {4,-1})
 SeeAlso
  take
  delete
  position
  positions
  select
  "lists and sequences"
///

doc///
 Key
  first
 Headline
  first element of a list
 Usage
  first L
 Inputs
  L:
   a list or sequence
 Outputs
  f:
   the first element of {\tt L}
 Description
  Example
   first {a,b,c,d,e}
   first gens(QQ[x,y,z])
 SeeAlso
  last
  take
  select
  position
  "lists and sequences"
///

doc///
 Key
  fold
  (fold, Function, Thing, VisibleList)
  (fold, Function, VisibleList)
  (fold, VisibleList, Thing, Function)
  (fold, VisibleList, Function)
 Headline
  apply a binary operator repeatedly
 Usage
  fold(f, x, L)
  fold(f, L)
  fold(L, x, f)
  fold(L, f)
 Inputs
  f:Function
  x:Thing
  L:VisibleList
 Outputs
  M:List
 Description
  Text
   Suppose {\tt L=\{x0, x1, ..., xn\}}. Then for any binary operator {\tt f}, 
   {\tt fold(f, L)} computes {\tt f(...f(f(x0, x1), x2), ...)}. 
   In other words, the binary operator is applied
   to the first two elements of {\tt L}, then to that result along with the next unused element of
   {\tt L}, and so forth.
  Example
   fold(plus, {0,1,2,3,4,5})
   fold(identity, {a,b,c,d,e})
   fold((i,j) -> i|j|i, {"a","b","c","d","e"})
  Text
   If {\tt fold(f, x, L)} is called, the element {\tt x} is used as the first argument of the
   binary function {\tt f}. In other words, {\tt fold(f, \{x0, x1, \ldots, xn\})} is 
   equivalent to {\tt fold(f, x0, \{x1, \ldots, xn\})}.
  Example
   fold(plus, 0, {1,2,3,4,5})
   fold((x, y) -> x^y, 2, {3,2,1,2})
  Text
   The function {\tt fold(\{x_0, x_1, \ldots, x_n\}, f)} returns 
   {\tt f...f(f(x_{n-2}, f(x_{n-1}, x_n)))}. That is, {\tt f} is applied
   to the last two elements of the list first, then the repeated calls to
   {\tt f} proceed backwards through the list. The optional argument {\tt x} in
   {\tt fold(L, x, f)} is used as the second argument in the first evaluation of
   {\tt f}. So {\tt fold(\{x_0, x_1, \ldots, x_{n-1}\}, x_n, f)} is equivalent
   to {\tt fold(\{x_0, x_1, \ldots, x_n\}, f)}.
  Example
   fold({a,b,c,d,e}, identity)
   fold({a,b,c,d}, e, identity)  
   fold({2,3,2,1}, 2, (x, y) -> x^y)
  Text
   The difference between @TO fold@ and {\tt accumulate} is that {\tt fold} returns the
   final result of all the nested evaluations of {\tt f}, while {\tt accumulate} lists 
   all the intermediate values as well.
  Example
   accumulate({2,3,2,1}, 2, (x, y) -> x^y)
 SeeAlso
  apply
  accumulate
  "lists and sequences"
///

doc///
 Key
  last
 Headline
  last element of a list
 Usage
  last L
 Inputs
  L:
   a list or sequence
 Outputs
  l:
   the last element of {\tt L}
 Description
  Example
   last {a,b,c,d,e}
   last gens(QQ[x,y,z])
 SeeAlso
  first
  take
  select
  position
  "lists and sequences"
///

doc///
 Key
  max
  (max, VisibleList)
 Headline
  yields the maximum element in a list or sequence
 Usage
  max X
 Inputs
  X: VisibleList
 Outputs
  m: Thing
 Description
  Example
   X = for i from 1 to 10 list random(100)
   max X
  Text
   If {\tt L} contains elements in a polynomial ring, the @TO MonomialOrder@
   of the ring is used for comparisons.
  Example
   R1 = QQ[x, y, z, MonomialOrder => Lex];
   max {x*y^2, x*y^2 + z^2, y^4, y*z^5}
   R2 = QQ[x, y, z, MonomialOrder => GRevLex];
   max (x*y^2, x*y^2 + z^2, y^4, y*z^5)
  Text
   More generally, the order of the elements is determined using the @TO "?"@ operator.
 
   If {\tt X} is a list of lists, {\tt max} acts on the outermost level.
  Example    
   max {{3, 1, 2}, {2, 9, 6}, {3, 7, 5}}
   max flatten {{3, 1, 2}, {2, 9, 6}, {3, 7, 5}}
 SeeAlso 
  maxPosition
  min
  sort
  "?"
///
   
doc///
 Key 
  maxPosition
  (maxPosition, BasicList)
 Headline
  position of the largest element
 Usage
  maxPosition L
 Inputs
  L:BasicList
 Outputs
  i:ZZ
   the index of the largest element in the list {\tt L}
 Description
  Text
   If the largest element occurs more than once, the index of its first occurrence is used.
  Example
   maxPosition {1, 6, 4, 2, 6}
  Text
   If {\tt L} contains elements in a polynomial ring, the @TO MonomialOrder@
   of the ring is used for comparisons.
  Example
   R1 = QQ[x, y, z, MonomialOrder => Lex];
   maxPosition {x*y^2, x*y^2 + z^2, y^4, y*z^5}
   R2 = QQ[x, y, z, MonomialOrder => GRevLex];
   maxPosition (x*y^2, x*y^2 + z^2, y^4, y*z^5)
  Text
   More generally, the order of the elements is determined using the @TO "?"@ operator.
 SeeAlso 
  minPosition
  max
  min
  sort
  position
  positions
  "?"
///

doc///
 Key
  min
  (min, VisibleList)
 Headline
  yields the minimum element in a list or sequence
 Usage
  min X
 Inputs
  X: VisibleList
 Outputs
  m: Thing
 Description
  Example
   X = for i from 1 to 10 list random(100)
   min X
  Text
   If {\tt L} contains elements in a polynomial ring, the @TO MonomialOrder@
   of the ring is used for comparisons.
  Example
   R1 = QQ[x, y, z, MonomialOrder => Lex];
   min {x*y^2, x*y^2 + z^2, y^4, y*z^5}
   R2 = QQ[x, y, z, MonomialOrder => GRevLex];
   min (x*y^2, x*y^2 + z^2, y^4, y*z^5)
  Text
   More generally, the order of the elements is determined using the @TO "?"@ operator.
 
   If {\tt X} is a list of lists, {\tt min} acts on the outermost level.
  Example    
   min {{3, 1, 2}, {2, 9, 6}, {3, 7, 5}}
   min flatten {{3, 1, 2}, {2, 9, 6}, {3, 7, 5}}
 SeeAlso 
  minPosition
  max
  sort
  "?"
///

doc///
 Key
  mingle
  (mingle, BasicList)
 Headline
  mingle elements of several lists
 Usage
  mingle(L)
 Inputs
  L:BasicList
   a list of lists {\tt L=\{L1, L2, ..., Ln\}}
 Outputs
  M:List
   a new list mingling the elements of all lists in {\tt L}
 Description
  Text
   The output list {\tt M} takes the first element of each {\tt Li, i=1,...,n}, followed by
   the second element of {\tt Li, i=1,...,n}, and so forth.  
  Example
   mingle {{a1, a2, a3}, {b1, b2, b3}, {c1, c2, c3}}
  Text
   The lists can have different lengths. After a list is exhausted, it
   will be silently ignored.
  Example
   mingle {{a1, a2, a3, a4}, {b1, b2}, {c1}}
  Text
   To transpose a nested list (thinking of it as a matrix), try
   using {\tt mingle} with @TO pack@.
  Example
   pack(3, mingle ((a1, a2, a3), (b1, b2, b3), (c1, c2, c3)))
  Text
   Notice from the previous example that {\tt mingle} accepts sequences and
   other types of @TO BasicList@s as input, but the output will always be a 
   @TO List@. 
  Text
   Further examples:
  Example
   concatenate mingle( {"a","b","c"} , {",",","} )
   netList pack(3, mingle( (0..5), apply(6, i -> i^2), apply(6, i -> i^3)))
 SeeAlso
  pack
  sort
  apply
  "lists and sequences"
///

doc///
 Key 
  minPosition
  (minPosition, BasicList)
 Headline
  position of the smallest element
 Usage
  minPosition L
 Inputs
  L:BasicList
 Outputs
  i:ZZ
   the index of the smallest element in the list {\tt L}
 Description
  Text
   If the smallest element occurs more than once, the index of its first occurrence is used.
  Example
   minPosition {2, 1, 6, 4, 1}
  Text
   If {\tt L} contains elements in a polynomial ring, the @TO MonomialOrder@
   of the ring is used for comparisons.
  Example
   R1 = QQ[x, y, z, MonomialOrder => Lex];
   minPosition {x*y^2, x*y^2 + z^2, y^4, y*z^5}
   R2 = QQ[x, y, z, MonomialOrder => GRevLex];
   minPosition (x*y^2, x*y^2 + z^2, y^4, y*z^5)
  Text
   More generally, the order of the elements is determined using the @TO "?"@ operator.
 SeeAlso 
  maxPosition
  max
  min
  sort
  position
  positions
  "?"
///

doc///
 Key
  number
 Headline
  count how many elements of a list satisfy a condition
 Usage
  number(A, f)
 Inputs
  A:
   a list or sequence
  f:
   a boolean function
 Outputs
  c:
   an integer, the number of elements of {\tt A} that satisfy {\tt f}
 Description
  Example
   number(0..100, isPrime)
   number(0..100, odd)
   number(0..100, i -> i==17)
  Text
   To find the first or last index of an element satisfying the condition, see @TO position@. 
   For all indices that match the condition, see @TO positions@. To return the 
   elements, rather than their indices, see @TO select@. 
  Example
   position((10,20,43,105,6), odd)  
   positions((10,20,43,105,6), odd)
   select((10,20,43,105,6), odd)
 SeeAlso
  all
  any
  commonest
  position
  positions
  same
  select
  tally
  "lists and sequences"
///


doc///
 Key
  pack
  (pack, BasicList, ZZ)
  (pack, ZZ, BasicList)
 Headline
  pack elements of a list into several shorter lists
 Usage
  pack(A, n)
  pack(n, A)
 Inputs
  A: BasicList
  n: ZZ
   how many elements of {\tt A} to put in each new list
 Outputs
  L: List
   a list of lists, with the elements of {\tt A} taken {\tt n} at a time.
 Description
  Text
   The commands {\tt pack(A, n)} and {\tt pack(n, A)} produce identical results.
  Example
   pack(a..l, 3)
   pack(3, a..l)
  Text
   If {\tt n} doesn't divide the length of {\tt A}, the last list will have fewer
   than {\tt n} elements.
  Example
   pack(a..m, 3)
  Text
   {\tt pack} and @TO mingle@ can be used together to take a transpose of lists
  Example
   pack(2, mingle(a..m, 0..12))
 SeeAlso
  mingle
  sort
  take
  "lists and sequences"
///
 

doc///
 Key
  position
  (position, VisibleList, Function)
  (position, VisibleList, VisibleList, Function)
  [position, Reverse]
 Headline
  the first element of a list satisfying a condition
 Usage
  position(A, f)
  position(A, B, f)
  position(A, f, Reverse => true)
 Inputs
  A: VisibleList
  B: VisibleList
  f: Function
 Outputs
  p: ZZ
   the first index to satisfy the boolean function {\tt f}
 Description
  Text
   {\tt position(A, f)} returns the smallest index {\tt i} such that {\tt f(A#i)} 
   is true. If no element satisfies the condition, @TO null@ is returned.
  Example
   position((10,20,43,105,6,93), odd)
   position((10,20,43,105,6,93), i -> i<0)
  Text
   Use {\tt position(A, B, f)} to return the smallest index {\tt i} such that {\tt f(A#i, B#i)}
   is true.
  Example
   position((10,20,43,105,6,93),(18,82,12,7,35,92), (a,b) -> a>b)
  Text
   The {\tt Reverse} option will return the largest index instead.
  Example
   position((10,20,43,105,6,93), odd, Reverse => true)  
   position((10,20,43,105,6,93),(18,82,12,7,35,92), (a,b) -> a>b, Reverse => true)
  Text
   To find all indices of elements satisfying the condition, see @TO positions@. To return the 
   elements, rather than their indices, see @TO select@. The function @TO number@ counts the
   number of elements satisfying the condition.
  Example
   positions((10,20,43,105,6,93), odd)
   select((10,20,43,105,6,93), odd)
   number((10,20,43,105,6,93), odd)
 SeeAlso
  minPosition
  maxPosition
  number
  positions
  select
  take
  "lists and sequences"
///

doc///
 Key
  positions
  (positions, VisibleList, Function)
 Headline
  which elements of a list satisfy a condition
 Usage
  positions(A, f)
 Inputs
  A: VisibleList
  f: Function
 Outputs
  p: List
   the list of indices {\tt i} such that {\tt f(A#i)} is true
 Description
  Text
   The indices are listed in ascending order. If no element satisfies the condition, an empty list is returned.
  Example
   positions((10,20,43,105,6,93), odd)
   positions((10,20,43,105,6,93), i -> i<0)
   positions(100..110, isPrime)
  Text
   To find the first or last index of an element satisfying the condition, see @TO position@. To return the 
   elements, rather than their indices, see @TO select@. The function @TO number@ counts the
   number of elements satisfying the condition.
  Example
   position((10,20,43,105,6), odd)  
   position((10,20,43,105,6), odd, Reverse => true)
   select((10,20,43,105,6), odd)
   number((10,20,43,105,6), odd)
 SeeAlso
  minPosition
  maxPosition
  number
  position
  select
  take
  "lists and sequences"
///

doc///
 Key
  reverse
  (reverse, BasicList)
 Headline
  reverse a list or sequence
 Usage
  reverse(L)
 Inputs
  L:BasicList
 Outputs
  R:BasicList
   a BasicList containing the elements of {\tt L} in reverse order
 Description
  Text
   The output list will be the same type as the input.
  Example
   reverse {5, 7, 2, 8}
   reverse (5, 7, 2, 8)
 SeeAlso
  sort
///

doc///
 Key
  same
 Headline
  whether everything in a list is the same
 Usage
  same L
 Inputs
  L:
   a list
 Outputs
  b:
   a Boolean
 Description
  Example
   same {1, 1, 1, 1}
   same {1, 2, 1, 1}
  Text
   The comparison is done with "===", which is quick, but not always intuitive. Here is a 
   simple example of what can go wrong:
  Example
   R = QQ[x,y,z]; 
   L = {gcd{x,y}, x/x, 1}
   same L
  Text
   We can see the problem by asking {\tt Macaulay2} to display the class of each element of {\tt L}.
  Example
   apply(L, class)
  Text
   The first {\tt 1} is an element of the ring {\tt R}, the second {\tt 1} is an
   element of the fraction field of {\tt R}, and the third {\tt 1} is an integer. Thus
   {\tt Macaulay2} thinks of these three elements as being pairwise unequal.
 SeeAlso
  commonest
  number
  set
  unique
  "lists and sequences"
///
   
doc///
 Key
  subsets
  (subsets, ZZ)
  (subsets, ZZ, ZZ)
  (subsets, List)
  (subsets, List, ZZ)
  (subsets, Sequence, ZZ)
  (subsets, Set)
  (subsets, Set, ZZ)
 Headline
  produce the subsets of a set or list
 Usage
  subsets(A)
  subsets(A, n)
 Inputs
  A: List
   , sequence, set or integer
  n: ZZ
   optional input to specify subsets of a particular size
 Outputs
  L: List
   of subsets (of size {\tt n} if given)
 Description
  Text
   If {\tt A} is an integer, {\tt subsets(A)} lists the subsets of {\tt \{0, 1, ..., A-1\}}.
  Example
   subsets(3)
   subsets(5, 3) 
  Text
   {\tt A} can be a list, sequence, or set. The elements need not be of the same type.
  Example
   subsets({"apple", "banana", {1,2,3}, 7.1}, 3)
  Text
   If a list contains repetitions, so will the subsets of that list. 
   Since a @TO Set@ has no repetitions, neither do its subsets. Also, 
   the subsets of a set will again be sets (while the subsets of a list are lists).
  Example
   subsets({"apple", "apple", "banana"})
   subsets(set{"apple", "apple", "banana"})
  Text
   The subsets of a Sequence are lists, not sequences. Also, a subset size {\bf must} be 
   specified when calling {\tt subsets} on a sequence.
 SeeAlso
  partitions
  set
  "lists and sequences"
///
   
doc ///
 Key
  take
  (take, BasicList, ZZ)
  (take, BasicList, List)
 Headline
  Take some elements from a list or sequence.
 Usage
  take(L, i)
  take(L, {j,k})
 Inputs
  L: BasicList
  i: ZZ
  j: ZZ
  k: ZZ
 Outputs
  L2: BasicList
   the list or sequence containing the first {\tt i} elements of {\tt L},
   (if {\tt i} positive), or the last {\tt i} elements of {\tt L} (if {\tt i} negative), or, if given the
   pair {\tt j,k}, the list or sequence containing the elements of {\tt L} with indices {\tt j} through {\tt k}
 Description
  Example
   take({a,b,c,d,e,f,g}, 3)
   take({a,b,c,d,e,f,g}, -3)
   take({a,b,c,d,e,f,g}, {1,3})
   take({a,b,c,d,e,f,g}, {2,2})    
  Text
   The pair {\tt \{j,k\}} must be given with both entries non-negative, and $j\le k$. Otherwise an empty list is returned.
  Example
   take({a,b,c,d,e,f,g}, {3,1})
   take({a,b,c,d,e,f,g}, {4,-1})
 SeeAlso
  drop
  select
  position
  positions
  "lists and sequences"
///

doc///
 Key
  unique
  (unique, List)
  (unique, Sequence)
 Headline
  eliminate duplicates from a list
 Usage
  unique(L)
 Inputs
  L:List
   or sequence
 Outputs
  M:List
   the elements of {\tt L} without duplicates
 Description
  Text
   The output list maintains the order of elements in {\tt L}.
  Example
   unique {3,2,1,3,2,4,a,3,2,3,-2,1,2,4}
  Text
   Another way to list the unique elements of {\tt L} is by creating a
   set from {\tt L} and then listing its elements. This may be slightly
   faster than {\tt unique}, but forgets the ordering of {\tt L}.
  Example
   toList set {3,2,1,3,2,4,a,3,2,3,-2,1,2,4}
  Text
   To count occurrences of each element, use @TO tally@. To create
   a sorted list, see @TO sort@. For an overview of lists and sequences,
   see @TO"lists and sequences"@.
 SeeAlso 
  same
  sort
  set
  tally
  "lists and sequences"
///



--------------to be rewritten----------
document {
     Key => demark,
     Headline => "insert a string between elements of a list of strings",
     TT "demark(s,x)", " -- given a list of strings ", TT "x", " and
     a string ", TT "s", " provides the string obtained by concatenating
     the elements of ", TT "x", " with a copy of ", TT "x", " inserted
     between each successive pair.",
     PARA{},
     EXAMPLE "demark(\"+\",{\"a\",\"b\",\"c\"})"
     }

document {
     Key => join,
     Headline => "join lists",
     TT "join(u,v,...)", " -- joins the elements of the lists or
     sequences u, v, ... into a single list.",
     PARA{},
     "The class of the result is the same as the class of the first argument.
     If there is just one argument, and it's mutable, a copy is returned.",
     EXAMPLE "join({1,2,3},{a,b,c},{7,8,9})",
     PARA{},
     "The operator ", TO (symbol |, List, List), " can be used as a synonym."
     }

document {
     Key => delete,
     Headline => "delete elements of a list",
     TT "delete(x,v)", " -- removes any occurrences of the expression ", TT "x", "
     from the list ", TT "v", ".",
     PARA{},
     "Equality is determined with ", TO "===", ", which is quick.",
     EXAMPLE {
	  "delete(c,{a,b,c,d,e,a,b,c,d,e})",
	  },
     SeeAlso => "member"
     }

document {
     Key => scan,
     Headline => "apply a function to each element",
     SeeAlso => { "mapping over lists"}
     }

document {
     Key => (scan,BasicList,Function),
     Headline => "apply a function to each element of a list",
     TT "scan(v,f)", " -- applies the function ", TT "f", " to each element of the 
     list ", TT "v", ".  The function values are discarded.",
     EXAMPLE "scan({a,4,\"George\",2^100}, print)"
     }

document {
     Key => (scan,ZZ,Function),
     Headline => "apply a function to 0 .. n-1",
     TT "scan(n,f)", " -- applies the function ", TT "f", " to each integer
     in the range ", TT "0 .. n-1", " discarding the results.",
     PARA{},
     "This is equivalent to ", TT "scan(0 .. n-1, f)", ".",
     EXAMPLE {
	  "scan(3,print)",
	  "v = {a,b,c}",
	  "scan(#v, i -> print(i,v#i))"
	  }
     }

document {
     Key => {(isSorted,VisibleList), isSorted},
     Headline => "whether a list is sorted",
     Usage => "isSorted x",
     Inputs => { "x" },
     Outputs => { Boolean => {"whether the elements of the list ", TT "x", " are in increasing order"}},
     SourceCode => (isSorted,VisibleList),
     EXAMPLE lines ///
     isSorted {1,2,2,3}
     isSorted {1,2,3,2}
     ///
     }     

document {
     Key => {(switch,ZZ,ZZ,VisibleList), switch},
     Headline => "copy a list, switching two elements",
     Usage => "switch(i,j,x)",
     Inputs => {"i","j","x"},
     Outputs => {{"a copy of the list ", TT "x", " in which the elements at positions ", TT "i", " and ", TT "j", " have
	       been interchanged.  A negative value of ", TT "i", " or ", TT "j", " is taken relative to the end of the list."
	       }},
     EXAMPLE lines ///
     switch(3,9,0..10)
     switch(0,-1,0..10)
     ///
     }

document {
     Key => {(insert,ZZ,Thing,VisibleList), insert},
     Headline => "copy a list, inserting an element",
     Usage => "insert(i,t,x)",
     Inputs => {"i","t","x"},
     Outputs => {{"a copy of the list ", TT "x", " in which ", TT "t", " has been inserted
	       into position ", TT "i", " of the result.  A negative value of ", TT "i", " 
	       is taken relative to the end of the list."
	       }},
     EXAMPLE lines ///
     insert(4,t,0..10)
     insert(0,t,0..10)
     insert(11,t,0..10)
     insert(-1,t,0..10)
     ///
     }

--------------------------


TEST ///
    --accumulate
     assert( accumulate(toList,a,{b,c,d}) == {{a, b}, {{a, b}, c}, {{{a, b}, c}, d}} )
     assert( accumulate({a,b,c},d,toList) == {{a, {b, {c, d}}}, {b, {c, d}}, {c, d}} )
     assert( accumulate(toList,{a,b,c,d}) == {{a, b}, {{a, b}, c}, {{{a, b}, c}, d}} )
     assert( accumulate({a,b,c,d},toList) == {{a, {b, {c, d}}}, {b, {c, d}}, {c, d}} )
    --fold
     assert( fold(toList, a, {b,c,d}) === {{{a, b}, c}, d} )
     assert( fold({a,b,c}, d, toList) === {a, {b, {c, d}}} )
     assert( fold(toList, {a,b,c,d}) === {{{a, b}, c}, d} )
     assert( fold({a,b,c,d}, toList) === {a, {b, {c, d}}} )
    --max
     assert(max{4,5,6} === 6)
     assert(max(4,5,6) === 6)
    --min
     assert(min{4,5,6} === 4)
     assert(min(4,5,6) === 4)    
    --position
     assert( 3 === position({a,b,c,d,e,f},i->i===d ) )
    --subsets
     assert( subsets(4,2) === {{0,1},{0,2},{1,2},{0,3},{1,3},{2,3}} )
     assert( subsets({a,b,c,d},2) === {{a,b},{a,c},{b,c},{a,d},{b,d},{c,d}} )
     assert( 
      set subsets(set {a,b,c,d},2) === 
      set apply({{a,b},{a,c},{b,c},{a,d},{b,d},{c,d}},set) )

///

-- Local Variables:
-- compile-command: "make -C $M2BUILDDIR/Macaulay2/m2 "
-- End:
