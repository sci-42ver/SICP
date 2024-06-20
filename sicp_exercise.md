I mainly follow the wiki.
Then I read this repo codes.

I have read repo solution 1.1~20,25,28 (This line is kept to avoid forgetting to check this repo solution). repo solution may be better like 1.7.

# notice
- I didn't prove those theorems which are not proved before when learning DMIA and mcs since I am not reading SICP to learn maths. (SkipMath)
# racket notes
- [cond](https://docs.racket-lang.org/reference/if.html#%28form._%28%28lib._racket%2Fprivate%2Fletstx-scheme..rkt%29._cond%29%29) uses `[]`
# exercises
## chapter 1
- [Ben Bitdiddle](https://academickids.com/encyclopedia/index.php/Ben_Bitdiddle)
- [x] 1.1, 1.2, 1.4 trivial
- [x] 1.3
  ```scheme
  (cond ((and (<= x y) (<= x z)) (squareSum y z)))
  ```
  - schemewiki has solutions using `min`, etc.
- [x] 1.5
  - "applicative-order" endless loop due to expanding `(p)`.
    "normal-order" -> `(if (= 0 0) 0 (p)))` -> `0`.
    detailed see schemewiki
  - Also see https://stackoverflow.com/a/61307130/21294350.
- [ ] 1.6 I don't know why "Aborting!: maximum recursion depth exceeded"
  - wiki
    - the key
      > an interpreter follows *applicative substitution*
      so
      > it only evaluates one of its parameters- not both.
      > it never stops calling itself *due to the third parameter* passed to it in sqrt-iter.
      ~~i.e. it will always expanding the 3rd without ending.~~
      > such that any expressions within the consequent or alternate portions are evaluated regardless of the predicate
      > the iteration procedure is *called without return*
      Also see emmp
      > That includes sqrt-iter which is extended to new-if which *again* leads to the evaluation of all the sub-expressions including *sqrt-iter* etc.
      which is same as jhenderson.
    - See R5RS [Conditionals](https://groups.csail.mit.edu/mac/ftpdir/scheme-reports/r5rs-html/r5rs_6.html#SEC30)
      and [lambda](https://groups.csail.mit.edu/mac/ftpdir/scheme-reports/r5rs-html/r5rs_6.html#SEC29)
      > by binding the variables in the formal argument list to fresh locations
    - jsdalton is same as the main part.
    - book link https://web.archive.org/web/20160603160145/https://mitpress.mit.edu/sicp/full-text/sicp/book/node85.html from 2018 https://web.archive.org/web/20180101000000*/http://mitpress.mit.edu/sicp/full-text/sicp/book/node85.html (I don't read it when learning chapter 1 since they are from chapter 4)
      Also see 1.1.5 for one brief intro.
    - dft
      - without reading his 2nd comment, here `if` is nested in `lambda` so `(/ 1 0)` is evaluated.
        This corresponds to
        > The reason the above example generates an error is because (1 / 0), the second parameter to try, is evaluated before the try is even called.
        And `try` has the same problem as `new-if` indeed.
      - > The applicative vs. normal explanation made sense until I saw the try example above.
        Does him read the 1st version book? See emmp who read the book more carefully.
    - andersc
      - > And I guess for a certain interpreter, maybe it should use a consistent way for all processes?
        As [how_special_form_is_special] says, "special form" is just exception as expected.
    - See uninja's commment which is what I thought after reading dpchrist's comment for how dpchrist's comment is different from the exercise.
    - srachamim's comment is trivial
      See student's comment for where trevoriannguyen is wrong about understanding others' comments although his thoughts are right:
      > Indeed, the new-if procedure *body (which contains the cond special form) is never even applied* to the resulting 3 arguments as the 3rd argument never stops evaluating itself!
    - cypherpunkswritecode says right about if but a bit wrong about `cond`
      See R5RS
      > A 'cond' expression is evaluated by evaluating the <test> expressions of successive <clause>s in order *until one of them evaluates to a true* value (see section see section Booleans). When a <test> evaluates to a true value, *then the remaining <expression>s in its <clause> are evaluated in order*, and the result(s) of the last <expression> in the <clause> is(are) returned as the result(s) of the entire 'cond' expression.
      means same as ["Conditional expressions are evaluated as follows. ..."](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/full-text/book/book-Z-H-10.html#call_footnote_Temp_24)
- [x] 1.7
  - wiki
    - TODO
      - > a relative tolerance of 0.001 times the difference between one guess and the next
        Here should be "a relative tolerance of 0.001" by [definition](https://www.mathworks.com/matlabcentral/answers/26743-absolute-and-relative-tolerance-definitions#answer_34847)
      - > This is not the case at all — the original programme checks that the *guess squared* is within 0.001 of the *radicand*, whereas the algorithm described by "random person" checks that the *new guess* is within 0.001 of the *former guess*.
        ~~Weird in the archive link, it "checks that the *new guess* is within 0.001 of the *former guess*" same as this [oldest archive](https://web.archive.org/web/20111211154013/http://community.schemewiki.org/?sicp-ex-1.7)~~
        Maybe he wants to mean
        > because, 0.001 being by definition *smaller than the thousandth of any number larger than 1*, the *lower tolerance* forces the algorithm to continue refining the guess. It is indeed, however, *inferior for very small numbers* because 0.001 is by definition a larger tolerance than the thousandth of any number smaller than 1.
      - Maggyero
        - TODO 
          - after numerical analysis [1](https://math.stackexchange.com/a/3526215/1059606)
            the proof of the 1st formula, "can be written as", Sterbenz lemma, why $\delta$ disappears after Sterbenz lemma, something which we can easily verify.
          - I skipped the proof of the 1st formula
            then the key is
            > 4×10−3 which is larger than the (absolute) tolerance which we are currently using.
            Then "relative error" becomes $\frac{1}{2}\tau$ which is `epsilon` in the code.
            We choose the number maybe due to $|\epsilon|\le u$.
            - [$\lesssim$](https://math.stackexchange.com/q/1793395/1059606)
          why 3/2 and 9/4
        - `(< (abs (- (square guess) x)) (if (= x 0) min-float (* tolerance x)))`
          `min-float` instead of `0` because `<`.
        - notice `(* tolerance guess)` corresponds to the difference with `guess`
          while `(* tolerance x)` is with `x`.
        - [`min-float`](https://en.wikipedia.org/wiki/Double-precision_floating-point_format#Exponent_encoding)
    - Here root should be `sqrt` by [R5RS](https://groups.csail.mit.edu/mac/ftpdir/scheme-reports/r5rs-html/r5rs_8)
    - notice those solutions using `abs (- (square guess) x)` in comparison is wrong when that condition can't be met by the precision.
    - Owen
      > because of the *limitation of bits*, the "improved guess" will simply be *equal* to "old guess" at some point, results in (- y^2 x) *never changes* and hence never reach inside the tolerance range. ... This situation applied to the small number case as well --- if *the threshold is to be set extremely small*.
      i.e. 0.001 is no use at all.
      > should never care about a specific precision value (or percentage) at all
      > simply reference to GWB's solution, which I believe is the *best solution*, *guaranteeing to stop* and at the same time, with the *best accuracy*.
    - Thomas
      > I should've read the whole discussion before posting — my mistake!
    - berkentekin is same as solution 1, 2.
    - Maggyero
      QUESTION is same as the problem
      kw: scale, relative error, scaled to the radicand/guess
- [ ] 1.8
  I didn't notice the special case of $x=-2$
  - if we solve $y=x^3\Rightarrow f(y)=y-x^3$
    then $y-\frac{y-x^3}{1}=x^3$ ~~says nothing useful.~~ implies directly calculating $x^3$.
  - Newton's method [may not work](https://scholarworks.utep.edu/cgi/viewcontent.cgi?article=2421&context=cs_techrep#:~:text=Interestingly%2C%20the%20simplest%20example%20on,the%20Newton's%20method%20works%20perfectly.&text=desired%20extension.,%E2%88%92F(%E2%88%92x).) at least when $x_2=x_0$ and ad infinitum.
    This also relates with the init guess. See the code 1_8.scm from wiki.
  - wiki
    - See the 2nd solution
      >  ;; Fix: take absolute cuberoot and return with sign 
      which ensures positive -> no weird zero.
      And it directly takes improve instead of `1.0 0.0`
    - the 3rd solution is similar to the original solution in the book for `sqrt`.
    - the 4th is similar to the 2nd.
    - > This solution makes use of the fact that (in LISP) procedures are also data.
      the 5th
      i.e. use func as the param, e.g. `sqrt-improve`.
    - Chan's `if (< x 0)` is said in the 2nd solution
      and `good-enough?` is just same as the 5th.
      - > But I just made this procedure with low precision. I think you can fix this
        one solution is to change from `0.001` to one smaller number.
- [x] 1.9
  - trivially the first is recursive while the second is iterative.
- [ ] 1.10
  This definition is same as DMIA 5.4 exercise 50-57 and mcs p227.
  but not same as [wikipedia](https://en.wikipedia.org/wiki/Ackermann_function#Definition:_as_m-ary_function), [GeeksforGeeks](https://www.geeksforgeeks.org/ackermann-function/#), [wolfram](https://mathworld.wolfram.com/AckermannFunction.html)
  - `(A 0 n)=(* 2 n)`
  - `(A 1 n)=(* 2 (A 1 (- n 1)))` -> $2^n$ by DMIA 5.4 exercise 52 since `(A 1 1)=2`.
  - similarly [$2\uparrow\uparrow n$](https://en.wikipedia.org/wiki/Knuth%27s_up-arrow_notation) i.e. `F(4,n)` in Buck's definition.
  - Based on the above, they are similar to [Buck's definition](https://en.wikipedia.org/wiki/Ackermann_function#History) where the recursive definition is similar to [Hyperoperation](https://en.wikipedia.org/wiki/Hyperoperation) but with ending at y=1 instead of y=2 here.
  - See wiki the above lacks considering $n=0$
- [x] 1.11
  - wiki
    - TODO
      meaning of
      > n >= 3 and not n >= 3.0 it is *sufficient*
      > As it is decimal values evaluate to the next whole value. ie *3.2 -> 4*
    - > Here is another iterative version that the original poster called "a little bit different".
      - TODO
        `(+ b a) (+ c (* 2 a)) (* 3 a))`
      - I skipped
        > To see where those calculations come from, consider this example of how (f 5) calculates 25.
        since it can be proved more formally.
      - > Heres another iterative solution, counting up
        (with no relation with the adjacent `(f-iter n a b c)`) is similar to `(f-iter 2 1 0 3)`.
- [x] 1.12 trivial by the footnote definition.
  - wiki
    - the 2nd ~~manipulates with the wrong input cases~~
      assumes all unfilled case zero which make `(= col row)` be contained in `(+ (pascal-triangle (- row 1) (- col 1)) ...`.
    - > I find this one *easier to grok*, it allows only values though:
      almost same as the 2nd but more readable.
    - > Not having to worry about zero values makes it clearer to me:
      same as the 1st
    - > If you don't consider out of bounds cases
      Just change the col and row definition. The basic idea is same as the 1st.
    - > ; Left-aligned triangale with start at row=0 and col=0 
      This weirdly changes the triangle angle although it is feasible.
    - `pas-n` counts from top to below and from left to right.
    - "Wikipedia formula" just index from 0 due to $\binom{0}{0}$ and the rest is same as the 2nd.
      - > Here's one with binomial coefficient and tail recursion:
        This is based on the binomial equation with the index starting from 1.
- [x] 1.13
  - trivial using linear recurrence or as the hint says using induction.
  - ~~"the closest integer" doesn't hold for `Fib(1)`.~~
    We can use $|\varphi|<0.5$ to directly prove "the closest integer".
    Also see [this][evernote_proof_1_13]
  - [diff between $\models$ and $\vdash$ (See Examples)](https://en.wikipedia.org/wiki/List_of_logic_symbols#Basic_logic_symbols)
    They may not be same but [be same for First-order logic](https://math.stackexchange.com/a/148181/1059606)
  - [sicp-solutions](https://sicp-solutions.net/post/sicp-solution-exercise-1-13/)
    - It directly inserts into the definition and due to the unique solution property, it is proved.
    - Also see [evernote_proof_1_13] which assumes $a^n\ldots$ (although not intuitive if not using linear recurrence) and the rest is similar.
  - wiki is more formal. But the basic idea is same.
    But it
    1. uses the property of "the golden ratio".
    2. cares about "base case" (in [evernote_proof_1_13] but not in sicp-solutions).
    3. ...
- [ ] 1.14
  - wiki
    - https://web.archive.org/web/20220330050258/https://www.ysagade.nl/2015/04/12/sicp-change-growth/
      Read it in https://stackedit.io/app#
      > The analysis below is wrong
      i.e. qu1j0t3's comment.
      - Space complexity similar to the binary tree.
        > contains successive recursive calls with the amount decreased by 1.
        In this case, we first decrease "kinds-of-coins", then decrease "amount" by at least step 1 (in 11 cents, the step is 5).
        So complexity is $O(1)+\lceil n/k\lceil<O(1)+n/k+1=O(1)+n/k\overbrace{=}^{\text{check the dominating term}}O(n)$
      - > the green node is a terminal node that yields $1$ (corresponding to the first condition in the code for cc)
        i.e. $(0,1)$
      - Time complexity
        It assumes each node has time $O(1)$ then count the node number.
        - > $\lfloor {\frac {n} {5} } \rfloor \left( 2n + 2 \right) + 2 = \Theta\left(n^2\right)$
          $O(n^2)$ is got by lifting all terms to $n^2$ and floor to $\frac{n}{5}$
          $\Omega(n^2)$ is got by keeping only the $n^2$ term ~~(if there are negative terms then when $n\to\infin$ we can let it be )~~ $\lfloor {\frac {n} {5} } \rfloor\cdot 2n>(\frac {n} {5}-1)\cdot 2n>\frac {n} {10}\cdot 2n,\text{when }n>10$.
      - > grows *exponentially* with *the number of allowed denominations* of coins, and *polynomially* with the *amount to be changed* when the number of denominations is fixed
    - TODO 
      - 3|1 meaning
    - > since the 2nd branch is O(a), and the first branch is called O(n) times.
      i.e. `(cc (- amount (first-denomination kinds-of-coins)) ...` and `(cc amount (- kinds-of-coins 1)) `.
    - samphilipd's comment shows "stack" summarises the space complexity.
    - gollum0's comment is the summary of ysagade's answer.
    - Another wonderful explanation
      basic idea is similar to ysagade's but it doesn't differentiate between the space complexity and the time complexity.
    - voom4000
      - > both processes try to build a sum \sum_{i=1}^n k_i d_i by incrementing indices k_i
        this seems to be wrong due to 2 branches.
      - It cares about "the number of tuples" without strictly following the process of the tree.
        So it can only give one upper bound -> $O(\ldots)$.
  - repo
    - > (Note that we are not really concerned with the orders of growth as the number of kinds of coins grows, only the amount to be changed.)
      although we can as ysagade does.
    - > At any point in the computation we only need to keep track of the nodes above the current node.
      This seems to said in one wiki link.
    - It is very similar to ysagade although not that rigorous.
- [x] 1.15
  - [derivation of the formula](https://qr.ae/psq8oy)
  - `12.15/3**5=0.05`
  - depth: $\lceil \log_3 10a\rceil+1$ when considering the root.
    so space: $\Theta(\log a)$
    time: Here I assume `(p x)` has $\Theta(1)$ time complexity.
    Then we have $\Theta(\log a)\cdot \Theta(1)=\Theta(\log a)$ time complexity.
  - The above is same as wiki.
- [x] 1.16
  - wiki Solution 2 also holds $ab^n$ is constant.
    - Here `(= counter 1)` is needed since $\frac{1}{2}-1$ and $\frac{1-1}{2}-1$ both are not positive integers.
  - repo uses racket implementation where the basic idea is same.
  - ~~TODO~~ why we needs "associative multiplication".
    Because floating may not hold this property in computer See p244 in the reference book.
- [ ] 1.17
  - wiki
    - `12 * 2 + 6` corresponds to `(+ a b)` at the last step.
      Here `n` is not tracked.
    - the 1st method is trivially not iterative since `(* ...` is not at the top level of the recursive call.
  - repo trivial
- [x] 1.18 (See 1.17 code)
  - wiki 
    one `(- b 1)` the other `(- (halve c) 0.5)`
- [x] 1.19
  $$
  T= \begin{matrix}
  p+q&q\\
  q  &p
  \end{matrix}
  $$
  ```python
  from sympy import *
  init_printing(use_unicode=True)
  p,q,m=symbols('p q m')
  M=Matrix([[p+q,q],[q,p]])
  M*M
  Out[2]: 
  ⎡  2          2                  ⎤
  ⎢ q  + (p + q)    p⋅q + q⋅(p + q)⎥
  ⎢                                ⎥
  ⎢                      2    2    ⎥
  ⎣p⋅q + q⋅(p + q)      p  + q     ⎦
  ```
  - wiki
    Here $T^2$ has the *same form* as $T$, so the function can work.
    TODO here I didn't give one linear algebra proof of that.
    - kw of Jordan Chavez:
      Tpq(Txy(a, b))
      T is commutative
      the identity values (i.e. identity matrix)
      We had an accumulator for the "odd" factors -> accumulator goes from 1 to 12 where exp goes from 7 to 6.
    - > b <- (bp + aq) = (0p + 1q) = q   <--- this is the final value fib(n)
      to `(= n 0) q-acc`
      > Each time you replace Tpq with Tp'q', you get to halve the number of times you apply it
      to `(even? n) ...`
      `else` just apply the transformation.
- [ ] 1.20
  - ~~the tree is~~ ~~many nested `if` and keeping `remainder`.~~
    `if` expand and then most of time executes smaller `gcd`.
  - applicative-order -> 4
    ```bash
    1 ]=> (gcd 206 40)
    [Entering #[compound-procedure 12 gcd]
        Args: 206
              40]
    [Entering #[compound-procedure 12 gcd]
        Args: 40
              6]
    [Entering #[compound-procedure 12 gcd]
        Args: 6
              4]
    [Entering #[compound-procedure 12 gcd]
        Args: 4
              2]
    [Entering #[compound-procedure 12 gcd]
        Args: 2
              0]
    ```
  - normal-order (wrong)
    each time it will calculate in `if` and then again in `a` of `gcd(a,b)` except for the last time `b=0`.
    So `2*4-1=7`.
  - wiki
    - Notice
      > 14 when evaluating the condition and 4 in the final reduction phase.
      So we don't care `remainder` in `(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))`. We will expand it and only count the `remainder` in `if` since it will again expand to `gcd ...`.
    ~~How does the expansion know ending if it doesn't calculate `(remainder 206 40)`?~~
    ~~Here although we calculate `(remainder 206 40)` but we doesn't insert the result into the corresponding `gcd`. So we have `(gcd (remainder 206 40) (remainder 40 (remainder 206 40)))`.~~
    - Then it will have the form
      ```
      if 0
        gcd 0 1
      if 1
        gcd 1 2
      if 2
        gcd 2 3 
      ...
      if 4 (Here b=0)
        a
      ```
      so we need $1+4+\ldots+(3*3-2)+4=2*(1+7)+4=20$
      - The above is *wrong*
        we should have `gcd 2 1+2+1=4`.
        So we have
        ```
        if 0
          gcd 0 1
        if 1
          gcd 1 0+1+1=2
        if 2
          gcd 2 1+2+1=4
        if 4
          gcd 4 2+4+1=7
        if 7 (Here b=0)
          4
          gcd 7 4+7+1 ; doesn't execute
        ```
        ~~Then we need `1+4+8+15+11` "remainder operations".~~ (wrong) see [repo reference link][repo_reference_1_20]
        Here we have $a_{n+1}=a_n+a_{n-1}+1,a_0=0,a_1=1$ (interestingly this is same as [the process to calculate the complexity of `Fib`](https://stackoverflow.com/questions/360748/computational-complexity-of-fibonacci-sequence/360773#comment138625034_360773))
    - > The correct count should be 1 while the formula gives 2.
      ~~this is wrong. "The correct count should be" $1+1+0=2$.~~
      ```
      if 0
        gcd 0 1
      if 1
        0
      ```
      > b(1)+b(2)+...+b(n)+b(n-1)
      ~~This is wrong because it only considers the above `if` and the ending `4`.~~
      *true* based on [repo_reference_1_20]
      - Then
        > R(n) = SUM(i from 1 to n - 1, fib(i)) + fib(n - 2) - 1
        ~~is also wrong because `fib(n)<=b(n)` then the above is less than `b(1)+b(2)+...+b(n)+b(n-1)`.~~
        - If it is true based on
          > The above formulas are wrong. The truly correct one should be:
          Then `f(n-2)=f(n)+f(n-1)-n+f(n)-1` where `f(1)=1` based on p48.
          Then `0=f(n)+2f(n-1)-n-1`
          ```python
          fib_seq=[0, 1, 1, 2, 3, 5, 8, 13, 21, 34, 55, 89, 144, 233]
          for i in range(2,len(fib_seq)):
            print(fib_seq[i]+2*fib_seq[i-1]-i-1) # not all 0
          ```
    - > num_b(k) = fib(k+1) - 1
      ~~This doesn't hold since $2\neq 2-1$.~~
      ```
      num_b fib
      0     0
      1     1
      2     1
            2
      ```
      - The above index is wrong. [See](https://math.stackexchange.com/q/4934605/1059606)
    - > R(n) = SUM(i from 1 to n, num_b(i)) + num_a(n)
      ~~still wrong. Here `4+7+1` in `num_b(n)` doesn't count enough for `a` in `gcd(a,b)`.~~
      True based on [repo_reference_1_20]
    - > The correct formula above can also be written as
      This is based on [`sum(Fib...)`](https://www.cuemath.com/numbers/fibonacci-sequence/)
      Then `f(n+3)-1-n+f(n)-1-1=f(n+2)+f(n+1)-n-3+f(n)=2f(n+2)-n-3`.
    - We ca derive the formula for `num_b` and `fib`.
      ```python
      from sympy import *;init_printing(); from sympy import Function, rsolve; from sympy.abc import n; y = Function('y'); f = y(n+2)-y(n + 1)-y(n)-1;print(latex(rsolve(f, y(n), {y(0):0, y(1):1})))
      from sympy import *;init_printing(); from sympy import Function, rsolve; from sympy.abc import n; y = Function('y'); f = y(n+2)-y(n + 1)-y(n);print(latex(rsolve(f, y(n), {y(0):0, y(1):1})))
      ```
- [ ] 1.25
  - correct
  - yes.
  - see wiki for time consideration although it is intuitive. So not "fast prime tester".
- [ ] 1.28
  - See mcs where it uses one newer and better AKS test.
  - > have discovered a ``nontrivial square root of 1 modulo n,'' that is, a number not equal to 1 or n - 1 whose square is equal to 1 modulo n. It is possible to prove that if such a nontrivial square root of 1 exists, then n is not prime.
    See [this](https://en.wikipedia.org/wiki/Miller%E2%80%93Rabin_primality_test#Strong_probable_primes)
    > the only *square roots* of 1 modulo n are 1 and −1.
  ```scheme
  ((even? exp)
    (remainder (square (expmod base (/ exp 2) m))
              m))
  ; change to
  ((even? exp)
    (if (= (remainder (square (expmod base (/ exp 2) m))
              m) 1)
        #f))
  ```
  - Ignore the above codes
  - https://web.archive.org/web/20191231030706/http://wiki.drewhess.com/wiki/SICP_exercise_1.28 from wiki
    - kw
      > Note that the text states that one of the proofs *only applies to odd* numbers, so the prime test checks for even numbers (excepting 2, which is prime) before employing the Miller-Rabin test.
      *non-trival* square root
    - > Similar to ...
      means it also uses "nested functions".
  - Another solution in GNU Guile:
    - This is same as "Another solution that avoids nested functions" iterating all numbers in $[1,n-1]$ but with guile implementation.
    - tiendo1011 means the *book* is wrong instead of the code.
      [See (I only read up to "Correct claim")](https://stackoverflow.com/a/59834347/21294350)
      which means "at least half" $a<n$, we have n is not [a strong probable prime](https://en.wikipedia.org/wiki/Miller%E2%80%93Rabin_primality_test#Strong_probable_primes) to base a.
  - tiendo1011
    - [`values`](https://groups.csail.mit.edu/mac/ftpdir/scheme-reports/r5rs-html/r5rs_8.html#IDX369)
      - > A common use of `call-with-current-continuation' is for structured, *non-local exits* from loops or procedure bodies
        > Whenever a Scheme expression is evaluated there is a continuation wanting the result of the expression. The continuation represents *an entire (default) future for the computation*.

[repo_reference_1_20]:https://mngu2382.github.io/sicp/chapter1/01-exercise06.html