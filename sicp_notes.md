# projects recommended by [course_note] to be done.
> Examples include an event-driven object-oriented simulation game, a conversational program that uses rules and pattern matching, symbolic algebra of polynomials and rational functions, interpreters for various languages, and a compiler with register optimization.
I skipped [Problem Sets](https://github.com/abrantesasf/sicp-abrantes-study-guide?tab=readme-ov-file), Exam and Quizzes because IMHO those numerous exercises in the book is enough.
- see [this](https://github.com/junqi-xie-learning/SICP-Projects?tab=readme-ov-file) (Here [one fork](https://github.com/junqi-xie-learning/SICP-Projects/forks) may be itself)
- TODO add the corresponding solutions for the new [IAP](https://elo.mit.edu/iap/) [course](https://web.mit.edu/6.001/6.037/)

---

# Foreword
- [predicate calculus](https://github.com/sci-42ver/Discrete_Mathematics_and_Algorithm/blob/f515bc30a45a6a97c8a92641296a717d980441a0/Discrete_Mathematics_and_Its_Applications/mcs.md?plain=1#L764)
- > composed of . . .
  i.e. again "physical switching element ..." because MOS is one type of switching element.
- > It would be difficult to find two languages that are *the communicating coin of two more different cultures* than those gathered around these two languages.
  From [this](https://ell.stackexchange.com/a/133661), "those gathered around" (i.e. "the communicating coin" of Lisp and Pascal) may mean their shared components in Algol60.
- > e discretionary exportable functionality entrusted to the individual Lisp programmer is more than an order of magnitude greater than that to be found within Pascal enterprises
  i.e. Lisp can [generate languages](https://www.reddit.com/r/learnprogramming/comments/vluzqf/comment/idxrcoe/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button)
## TODO (Foreword may need some background knowledge)
- read after finishing the book
  > Lisp changes. ...
  and other green underlined words
# Preface to the First Edition (I read this first)
- > not just a way of geing a computer to perform oper-ations but rather that it is a novel formal medium for expressing ideas about methodology
  it means not ... but rather ... .
- > the foundations of computing,
  at least ["data structures and formalisms"](https://cics.unt.edu/node/41)
- > have very few ways of forming compound expressions,
  by multiplication principle, the component number is small.
- > All of the formal properties can be covered in an hour, like the rules of chess.
  This is also said in [ucb_sicp_review] (Also see Discrete_Mathematics_and_Algorithm repo).
## TODO
- check "Our goal ..." after reading the book.
- > we can use higher-order functions to capture common paerns of usage, ...
- > the relationship of Church's lambda calculus to the structure of programming languages
  [1](https://news.ycombinator.com/item?id=40056166) [2](https://users.cs.utah.edu/~mflatt/past-courses/cs7520/public_html/s06/notes.pdf)
# Preface to the Second Edition
- http://mitpress.mit.edu/sicp is [invalid now](https://web.archive.org/web/20230916001533/http://mitpress.mit.edu/9780262510875/structure-and-interpretation-of-computer-programs/#tab-5)
# [A note on our course at MIT][course_note]
- > to separate specification from implementation
  similar to [ucb_sicp_review]
  > a diversity of major programming paradigms: data abstraction, rule-based systems, object-oriented programming, functional programming, logic programming, and constructing embedded interpreters.
  > Students are encouraged to regard themselves as *language designers and implementors* rather than only language users.
  > 6.001 differs from typical introductory computer science subjects in using Scheme (a block-structured dialect of Lisp) *rather than Pascal* as its programming vehicle.
  > they consider *top-down hierarchical design*, so often emphasized as a central theme in computer programming subjects, to be a *minor and relatively simplistic* strategy
  > introducing two different techniques for maintaining modularity: object-oriented programming with encapsulated local state; and functional programming with *delayed evaluation*.
  > is recommended for other majors where *computation pays a major role* ... taken by over 500 students each year -- *half to two-thirds* of all MIT undergraduates ... more than three-quarters have had *previous programming experience*, although hardly any at the level of sophistication of 6.001.
  > MIT students regard 6.001 as an *extremely challenging*, but highly successful subject
  > There are also regular *weekly tutorials*, where students meet in groups of three with a graduate TA to *review* homework and other course material.
- TODO
  > shifting modes of linguistic description
  > *Beyond that, there is a central concern* with the technology of implementing languages and linguistic support for programming paradigms.
  > It discusses substitution semantics, the evolution of processes, orders of growth, and the use of higher-order procedures. ... symbol manipulation, including data abstraction and generic operations.
  > It presents a full interpreter for Scheme, and, for comparison, an interpreter for a logic programming language similar to pure Prolog.
- [RTL](https://web.archive.org/web/20240414035412/https://ars.els-cdn.com/content/image/3-s2.0-B9780750689748000053-gr20.jpg) -> [Register Transfer](https://www.geeksforgeeks.org/register-transfer-language-rtl/#)
  It is one ["design abstraction" method](https://en.wikipedia.org/wiki/Register-transfer_level)
- So we need to do [*projects* (See Grades)](https://ocw.mit.edu/courses/6-001-structure-and-interpretation-of-computer-programs-spring-2005/pages/syllabus/)
  > but the *crucial learning* done by students is through *substantial weekly programming assignments*. These focus on reading and modifying significant systems, rather than writing small programs from scratch.
- [new book site](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/index.html) where "excerpts from the book" may mean "Full text!"
  > This includes excerpts from the book, a collection of sample assignments, and information on where to obtain implementations of Scheme.

[ucb_sicp_review]:https://people.eecs.berkeley.edu/~bh/sicp.html

[course_note]:https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/course.html