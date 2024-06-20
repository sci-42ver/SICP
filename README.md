# Structure and Interpretation of Computer Programs(SICP)

Exercise solutions of the *[Wizard Book](https://mitpress.mit.edu/sites/default/files/sicp/index.html)*.

Install [Racket](https://racket-lang.org):

```
$ brew install --cask racket
```

## Chapters

1. Building Abstractions with Procedures

    - 1.1 [The Elements of Programming](./1_Building_Abstractions_with_Procedures/1.1_The_Elements_of_Programming)

    - 1.2 [Procedures and the Processes They Generate](./1_Building_Abstractions_with_Procedures/1.2_Procedures_and_the_Processes_They_Generate)

    - 1.3 [Formulating Abstractions with Higher-Order Procedures](./1_Building_Abstractions_with_Procedures/1.3_Formulating_Abstractions_with_Higher-Order_Procedures)

2. Building Abstractions with Data

    - 2.1 [Introduction to Data Abstraction](./2_Building_Abstractions_with_Data/2.1_Introduction_to_Data_Abstraction)

    - 2.2 [Hierarchical Data and the Closure Property](./2_Building_Abstractions_with_Data/2.2_Hierarchical_Data_and_the_Closure_Property)

    - 2.3 [Symbolic Data](./2_Building_Abstractions_with_Data/2.3_Symbolic_Data)

    - 2.4 [Multiple Representations for Abstract Data](./2_Building_Abstractions_with_Data/2.4_Multiple_Representations_for_Abstract_Data)

    - 2.5 [Systems with Generic Operations](./2_Building_Abstractions_with_Data/2.5_Systems_with_Generic_Operations)

3. Modularity, Objects, and State

    - 3.1 [Assignment and Local State](./3_Modularity_Objects_and_State/3.1_Assignment_and_Local_State)

    - 3.2 [The Environment Model of Evaluation](./3_Modularity_Objects_and_State/3.2_The_Environment_Model_of_Evaluation)

    - 3.3 [Modeling with Mutable Data](./3_Modularity_Objects_and_State/3.3_Modeling_with_Mutable_Data)

    - 3.4 [Concurrency: Time Is of the Essence](./3_Modularity_Objects_and_State/3.4_Concurrency_Time_Is_of_the_Essence)

    - 3.5 [Streams](./3_Modularity_Objects_and_State/3.5_Streams)

4. Metalinguistic Abstraction

    - 4.1 [The Metacircular Evaluator](./4_Metalinguistic_Abstraction/4.1_The_Metacircular_Evaluator)

    - 4.2 [Variations on a Scheme — Lazy Evaluation](./4_Metalinguistic_Abstraction/4.2_Variations_on_a_Scheme_Lazy_Evaluation)

    - 4.3 [Variations on a Scheme — Nondeterministic Computing](./4_Metalinguistic_Abstraction/4.3_Variations_on_a_Scheme_Nondeterministic_Computing)

    - 4.4 [Logic Programming](./4_Metalinguistic_Abstraction/4.4_Logic_Programming)

5. Computing with Register Machines

    - 5.1 [Designing Register Machines](./5_Computing_with_Register_Machines/5.1_Designing_Register_Machines)

    - 5.2 [A Register-Machine Simulator](./5_Computing_with_Register_Machines/5.2_A_Register-Machine_Simulator)

    - 5.3 [Storage Allocation and Garbage Collection](./5_Computing_with_Register_Machines/5.3_Storage_Allocation_and_Garbage_Collection)

    - 5.4 [The Explicit-Control Evaluator](./5_Computing_with_Register_Machines/5.4_The_Explicit-Control_Evaluator)

    - 5.5 [Compilation](./5_Computing_with_Register_Machines/5.5_Compilation)

## License

This work is licensed under the GPLv3 or any later version.

---

Currently only I forked this repo.

[booklist](https://billthelizard.blogspot.com/2008/12/books-programmers-dont-really-read.html)
better read it [with the adequate maths background](https://tekkie.wordpress.com/2018/04/03/a-word-of-advice-before-you-get-into-sicp/)

why I still learn sicp in 2024. See [this](https://github.com/sci-42ver/Discrete_Mathematics_and_Algorithm/tree/master/CRLS#why-it-is-still-useful-also-see-why-it-is-discontinued) especially cemerick.
I will use [official wiki](https://web.archive.org/web/20240228152042/http://community.schemewiki.org/?sicp-solutions) as the main part. Notice [Racket](https://gitlab.com/utkarsh181/sicp)/[PLTScheme](https://tekkie.wordpress.com/2011/07/26/just-a-quick-note-about-sicp-mutable-pairs-and-pltscheme/) doesn't have *mutable pairs*.
> The dev. team made this decision, because in their view it made Scheme more of a pure functional language

I choose R5RS as Racket is based on it and 6.5151 (6.905) Red Tape Memo recommends it.

# what I skipped
- https://web.archive.org/web/20150318225436/http://schemecookbook.org/ since I don't plan to learn scheme *specially*
# lacking exercise solutions
- 5.51~52
# book
- sicp from [this 2019 course material although "The End of an Era" says 6.001 is obsolete since 2008](https://web.mit.edu/6.001/6.037/sicp.pdf) ([newer 2.andresraba6.6](https://sarabander.github.io/sicp/) [without](https://github.com/sarabander/sicp-pdf/tree/master) the corresponding pdf). Also see [this](https://www.cliki.net/SICP) and [this](https://news.ycombinator.com/item?id=13918465) for other forms.
  [*official*](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/full-text/book/book-Z-H-5.html) ([archive](https://web.archive.org/web/20170710220837/https://mitpress.mit.edu/sicp/full-text/book/book-Z-H-1.html))
  - [interactive](https://xuanji.appspot.com/isicp/1-1-elements.html)
# prerequisite
- [no prerequisite](https://github.com/ossu/computer-science/issues/1081) is needed although [tekkie](https://tekkie.wordpress.com/2018/04/03/a-word-of-advice-before-you-get-into-sicp/) says more advanced maths is needed.
  Also see [history Course Catalogue](https://dome.mit.edu/handle/1721.3/187889), i.e. history_mit_Course_Catalogue.pdf.
- newer course needs [programming experience](https://web.mit.edu/6.001/6.037/) like [6.145 A Brief Introduction to Programming in Python](https://hz.mit.edu/catsoop/6.145) or [6.178 about Java](https://ocw.mit.edu/ans7870/6/6.005/s16/getting-started/java.html) ([6.005](https://web.mit.edu/6.005/www/archive/))
# [errata](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/errata.html)
- So we better read the HTML version to avoid ambiguity.
  > is is the second edition  book, from Unofficial Texinfo Format.
  > e freely-distributed official -and- format was first con-verted personally to Unofficial Texinfo Format () version 1
  > Also, it’s quite possible that *some errors of ambiguity were introduced* during the conversion
  - older computer seems to read the book using Emacs due to its performance.
    > You are probably reading it in an Info hypertext browser, such as the Info mode of Emacs. You might alternatively be reading it TEX-formaed on your screen or printer, though that would be silly.
# other solutions
- ~~almost full~~ (all skipped since they lack exercise solutions existing in this repo)
  - detailed
    - [1](https://www.inchmeal.io/sicp/ch-1/notes.html) no 1.14, etc.
    - [2](https://zv.github.io/sicp-chapter-4) no 4.78, etc.
  - [3](https://mk12.github.io/sicp/exercise/5/4.html) no Exercise 5.23⁠
  - [4](https://github.com/jlollis/sicp-solutions/tree/master/Chapter%201%20Exercises) only has 5.01 for chapter 5.
  - ~~[**not archived**](https://web.archive.org/web/20120126125952/http://sicp.org.ua/sicp/Chapter5) from https://github.com/fgalassi/cs61a-sp11?tab=readme-ov-file~~
  - https://web.archive.org/web/20131112031244/http://eli.thegreenplace.net/2008/04/18/sicp-section-55/ skips after 5.43.
  - from wiki
    - https://github.com/rparnas/sicp-ex/blob/master/exercises/5.50.ss lacking 5.50
      Without useful links
    - https://github.com/abdulapopoola/SICPBook/tree/master/Chapter%205/5.5 same as the above
      Without useful links
    - https://github.com/postboy/sicp-homework/tree/master I don't understand its dir naming.
      links to one non-English *general* blog
    - https://github.com/ivanjovanovic/sicp/tree/master/5.5 lacking much
      - https://github.com/Pluies/SICP/blob/master/Chapter%201.scm not readable with one chapter one file and lacking something like 1.45.
      - https://web.archive.org/web/20150926220244/https://wqzhang.wordpress.com/sicp-solutions/ from 2017 link
        lacks chapter 5.
        - http://gregsexton.org/2012/11/26/sicp-in-clojure.html skipped due to language
        - http://hackerretreat.com/start-sicp-trek/ not archived
        - https://voom4000.wordpress.com/2015/08/10/sicp-solutions/ skipped (See below)
        - https://web.archive.org/web/20120122082510/http://www.einverne.info/sicp-solutions.html
          - https://web.archive.org/web/20121216011814/http://karetta.jp/book-cover/YetAnotherSICPAnswerBook up to chapter 3
          - https://web.archive.org/web/20120126125952/http://sicp.org.ua/sicp/Chapter5 (See above)
          - https://web.archive.org/web/20111105110411/http://weimalearnstoprogram.blogspot.com/ up to chapter 3 
        - https://web.archive.org/web/20101023223956/http://www.zerobeat.in/2010/03/14/sicp-study/ -> https://github.com/vu3rdd/sicp/blob/master/README no chapter 5
          - [trackback](https://yaro.blog/newsletters/what-is-a-trackback-and-how-can-it-increase-your-blog-traffic/) similar to reference.
          - https://web.archive.org/web/20100501084331/http://wiki.drewhess.com/wiki/Category:SICP_solutions -> https://github.com/dhess/sicp-solutions/tree/master up to chapter 3
      - https://web.archive.org/web/20140819201738/http://eli.thegreenplace.net/category/programming/lisp/sicp/ 2014 link
- from wiki https://github.com/cxphoe/SICP-solutions almost same as this repo lacking 5.51~52
- maybe full
  - [1](https://lockywolf.wordpress.com/2021/02/08/solving-sicp/#org64d8b79) -> https://gitlab.com/Lockywolf/chibi-sicp
    It has [exercise 5.52 code in the doc](https://gitlab.com/search?search=compile-and-dont&nav_source=navbar&project_id=14144079&search_code=true&repository_ref=master)
- maybe full with many language implementations
  - [1](https://www.reddit.com/r/lisp/comments/qqwfh2/sicps_solution_in_racket_and_guile/) seems to lacking 5.51,52 and 5.40, etc., which are contained in this repo.
- only chapter 1
  - [1](https://sicp-solution.readthedocs.io/en/latest/chp1/1.2.html#exercise-1-24)
  - [2](https://git.sr.ht/~acsqdotme/sicp/tree)
  - [only 1.1](https://lucidmanager.org/productivity/page/4/)
  - [with maths](https://discuss.criticalfallibilism.com/t/justin-does-sicp/96/33)
  - [3](https://sicp-solutions.readthedocs.io/en/latest/)
- chapter 1,2
  - [1](https://notabug.org/ZelphirKaltstahl/old-racket-sicp-solutions)
  - [2](https://kendyck.com/page/2/)
  - [3](https://voom4000.wordpress.com/2015/08/10/sicp-solutions/)
  - [with many links](https://billthelizard.blogspot.com/2009/10/sicp-challenge.html)
  - [4](https://notes.abrocadabro.com/learning/courses/sicp/)
  - [5](https://github.com/alex4814/sicp-solution)
  - https://web.archive.org/web/20160312023725/https://kendyck.com/solutions-to-sicp/ from the 1st in https://web.archive.org/web/20181015000000*/https://kendyck.com/solutions-to-sicp/
- chapter 1,2,3
  - [1](https://quirksand.nfshost.com/topics/sicp.html)
- chapter 1,2,3,4
  - [1](https://github.com/qiao/sicp-solutions/tree/master/chapter4)
  - [2](https://wizardbook.wordpress.com/solutions-index/)
  - [3](https://adrianstoll.com/post/sicp-structure-and-interpretation-of-computer-programs-solutions/)
- only partially
  - [1](https://tekkie.wordpress.com/?s=sicp&submit=Search)
# How to learn
- [see](https://github.com/abrantesasf/sicp-abrantes-study-guide?tab=readme-ov-file)
  - I skipped
    https://web.archive.org/web/20221024062249/https://code-and-cocktails.herokuapp.com/blog/2014/07/06/what-i-have-re-learned-from-sicp/
  - The most of links are covered in this doc and the related doc in DMIA_CRLS repo.
# TODO
- [programming assignments](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/psets/index.html) from [the official page](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/index.html)
- ~~[community-wiki](http://community.schemewiki.org/?sicp-ex-1.18)~~
- how to make vim maybe [directly running the code](https://www.neilvandyke.org/sicp-texi/) in the texinfo/info ("the Info hypertext format that can be viewed in Emacs").