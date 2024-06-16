@WillNess Thanks for your alternative solution. 1.1 Googling "streams of decimal digits" recommends one post about c++ https://stackoverflow.com/a/13186757/21294350 saying we need to multiply 10^k and then floor -> divide by 10^k for precision k. But "multiply 10^k" may cause overflow. I think it is wrong. 1.2. https://stackoverflow.com/a/34095030/21294350 uses `std::setprecision`.

2. For scheme, https://stackoverflow.com/a/5208049/21294350 may work. I didn't dig into it because learning SICP is not to learn Scheme. The link has many syntaxes absent from SICP up to chapter 1, so I will follow the instructor solution by using Taylor Series.

@WillNess Thanks for your patience. In a summary, 1. "{23%10} ÷ {20%10} = {12%10}" is solved by "23/20.0" -> 1.15 and then round to 1.2 -> "12%10". Is the calculation process as you expect?

2. you means we should use https://stackoverflow.com/a/13186757/21294350 method. "You'd have to implement exponentiation of these ratios yourself, by repeated squaring, say, *rounding* after each squaring." and "Each squaring is simply done with the underlying *unlimited integers*": Here 1e-100 must need precision *at least 100 decimal bits*. Then at last we will encounter Shawn's format where the big exponentiation needs *too much time* which is impractical.

Then how do we solve the problem using "streams of decimal digits" (could you give the process for the above example)? (Hope my understanding of what you says is right.)

I failed to move this discussion to chat. As https://meta.stackoverflow.com/questions/388670/why-does-it-always-say-moving-discussion-to-chat-failed#comment722895_388670 says it seems only dev can solve the problem. @WillNess I can understand your point 2. For 3, I think you may mean *10^{b} instead of quotient using %b. "I'll see if I can find a related answer if mine.": "the big exponentiation needs too much time" is where I doubts about the feasibility of this method. Can keeping "squaring" up to 1e100 can be solved in one practical short time using "streams of decimal digits"?

@WillNess Thanks for your link. I understand now. But "underlying unlimited integers" seems to not hold in Scheme (the reason is probably due to the bit limit same as the floating number). I will post the scheme code translated from your pseudocode in one answer since the code is a bit long.

@WillNess Thanks. 1. Anyway I understood your basic ideas although in practice this method is much more complex than the solution given by the instructor. 2. Probably you upvoted this answer. IMHO this method is a bit deviated of what the exercise expects to teach so I don't plan to post one new question. Do you think it is  appropriate for me to delete this answer and merge the answers and comments into the question?

@WillNess I found in SICP footnote saying chapter 3 will cover "stream processing". I will revisit this QA after reading that part.
# reading order recommendation with other books
- better read *pure* "Computer Architecture" (So not csapp) before SICP if having learnt other programming languages like C.
  Also read maths before SICP although not needed to be as deep as mcs.pdf.
# projects recommended by [course_note] to be done.
> Examples include an event-driven object-oriented simulation game, a conversational program that uses rules and pattern matching, symbolic algebra of polynomials and rational functions, interpreters for various languages, and a compiler with register optimization.
I skipped [Problem Sets](https://github.com/abrantesasf/sicp-abrantes-study-guide?tab=readme-ov-file), Exam, homework and Quizzes because IMHO those numerous exercises in the book is enough and most of courses pay more attention for projects when grading. Also 
- see [this](https://github.com/junqi-xie-learning/SICP-Projects?tab=readme-ov-file) (Here [one fork](https://github.com/junqi-xie-learning/SICP-Projects/forks) may be itself)
- I will only does skipping
  1. [sample projects](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/psets/index.html)
  2. 6.037 IAP
  3. 6.001 fall 2007
- TODO add the corresponding solutions for ~~the new [IAP](https://elo.mit.edu/iap/) [course 6.037](https://web.mit.edu/6.001/6.037/)~~ the 
# ~~6.001,037~~ courses (6.9550 Structure and Interpretation of Computer Programs newer without one website) (better read [6.945](http://computationalculture.net/a-matter-of-interpretation-a-review-of-structure-and-interpretation-of-computer-programs-javascript-edition/) whose [project uses sicp as the reference][AI_preq_sicp])
[6.001 fall 2007](https://web.archive.org/web/20160306110531/http://sicp.csail.mit.edu/Fall-2007/) which seems to be the last 6.001 course based on sicp as [this][mit_End_of_an_Era_comment] and 6.037 reference imply. (But 6.037 uses 6.001 spring 2007 ~~which~~ ~~may be preferable~~ because fall 2007 lecture notes aren't public)
## 6.001 spring 2007
Also see [this TA's site](https://people.csail.mit.edu/dalleyg/6.001/SP2007/) besides sicp.csail.mit.edu.
- > You can use the lecture based "text book" by going to the tutor
  I can't access tutor since I am not one MIT student.
- TODO see Some minor "bugs" in Project 4
- trivially I can't use [6.001 Lab – 34-501](https://groups.csail.mit.edu/mac/classes/6.001/FT98/lab-use.html), [outer door combination 94210, inner door combination 04862*](https://people.csail.mit.edu/dalleyg/6.001/SP2007/solutions01.pdf)
### lecture
- lecture corresponding chapter see 6.037 description.
- > These online lectures will generally cover the same material, but are *NOT guaranteed to be identical to the material covered in the live* lectures, and in some cases there may *not be a corresponding online version of the live* lecture.
- As [this](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/syllabus.html) shows, both book and lectures have contents that the other doesn't have. So we need to read them all.
### [comparison](https://stackoverflow.com/a/10251655/21294350) between MIT Scheme and DrScheme
### [recitation](https://people.csail.mit.edu/dalleyg/6.001/SP2007/) (not include the 1st recitation by Eric Grimson)
## [6.001 fall 2007](https://web.archive.org/web/20160306110531/http://sicp.csail.mit.edu/Fall-2007/)
### The following are mainly from https://web.archive.org/web/20160415073756/http://sicp.csail.mit.edu/Fall-2007/generalinfo_ft07.htm
https://web.archive.org/web/20070501000000*/http://sicp.csail.mit.edu/SchemeImplementations/index.html is not archived.
https://web.archive.org/web/20160629180214/http://sicp.csail.mit.edu/Fall-2007/SchemeImplementations/ is skipped since I don't use DrScheme.
#### lecture
- where is link in [calendar](https://web.archive.org/web/20080908062550/http://sicp.csail.mit.edu/Fall-2007/calendar.txt)?
- partial lecture is [not archived](https://web.archive.org/web/20080908062839/http://sicp.csail.mit.edu/Fall-2007/lectures/)
- [This](https://github.com/abrantesasf/sicp-abrantes-study-guide?tab=readme-ov-file) only has [2005 "lecture notes"](https://ocw.mit.edu/courses/6-001-structure-and-interpretation-of-computer-programs-spring-2005/pages/lecture-notes/), [96~98 notes](https://groups.csail.mit.edu/mac/classes/6.001/).
It seems to only have video lectures
> we have engaged in a major educational experiment in which the lectures were replaced with online lectures, to which students were *expected to listen*, either in the 6.001 lab, or on their own computer. ... but that material will *not be identical to the live* lectures.
#### recitations
~~I~~ ~~don't have time to find that difference and also the lecture is old.~~ ~~will only do the~~ [recitations](https://people.csail.mit.edu/jastr/6001/fall07/) which is based on the video lecture.
Better read this if possible because this course is [taught by Gerald Jay Sussman](https://web.archive.org/web/20160415061035/http://sicp.csail.mit.edu/Fall-2007/staff.txt).
> Lectures are the primary vehicle for introducing and motivating new material, some of which is *not in the book*. It is essential that you *listen to the lectures* (whether live – which we prefer – or online), as the *recitations will assume you have already heard the material*, and will *build upon it*. ... Recitations *expand* upon the material currently being introduced in lecture, as well as introducing supplementary material that is *not directly covered in lecture*. ... your attendance at recitation is *essential to good performance* in this class.
#### problem set
I can't find by "6.001 fall 2007 Problem set site:mit.edu" which may be implied by
> Problem sets are released, typically on a weekly basis, onto the 6.001 *online tutor* system
#### tutorial
skipped due to
> to obtain *individual help*, to *review homework* assignments, and to have your *progress in the subject* checked
#### Assignments (i.e. [project](https://web.archive.org/web/20160415060551/http://sicp.csail.mit.edu/Fall-2007/projects/index.html)/~~Problem set~~)
> *failing to prepare ahead* for programming assignments generally ensures that the assignments will *take much longer* than necessary
#### collaboration (this is similar to one description I read before)
> For example, your partner has a bug on one part, and you are able to point out where the bug is and how to fix it.
inappropriate
> this is inappropriate collaboration because you were *not both involved in all aspects* of the work
#### Workload
> In addition, please be aware that prolonged computer usage combined with *poor posture or improper typing habits* can result in conditions such as *repetitive strain injury*.
#### bible (See the bold text)
#### grades
- homework
  > This applies to the weekly problem sets and to the programming projects.
  tutorials (skipped due to the following)
  > You may be asked to explain or to *expand upon your written homework solutions* in order to demonstrate your mastery of the material.
#### tutor
They are for tutorial's.
> If you are unable to attend a tutorial, you should contact your tutor in advance to make alternate arrangements for that week.

To join this it seems that we must be one mit student and [request a form (this is from the chemistry department)](https://chemistry.mit.edu/academic-programs/undergraduate-programs/tutoring/). This is also implied in spring 2007 6.001 lec01 p2.
### Complete Announcements
- not archived
  > GROWL! For those of you who did not show up in lecture on Tuesday, 2 October 2007, the essential handout you missed is here.
  > Code for the lecture given on Tuesday, 2 October 2007, has been placed here
  > GROWL! For those of you who did not show up in lecture on Tuesday, 6 November 2007, the essential handout you missed is here.
## 6.037 (notice [IAP may be not reliable](https://www.wisdomandwonder.com/link/2110/why-mit-switched-from-scheme-to-python#comment-365) and the instructor website [seems to not exist](https://web.archive.org/web/20120121084033/http://web.mit.edu/alexmv) different from [Gerald Jay Sussman](https://groups.csail.mit.edu/mac/users/gjs/gjs.html))
TODO who is the instructor Mike Phillips, is [him](https://en.wikipedia.org/wiki/Mike_Phillips_(speech_recognition))?
- See R5RS although sicp books uses R4RS as the reference.
  The newest is [R7RS](https://standards.scheme.org/official/r7rs.pdf) from [this](https://standards.scheme.org/) although racket seems to [not support](https://web.archive.org/web/20231208093804/http://community.schemewiki.org/?scheme-faq-standards#implementations) and has [one unofficial implementation](https://github.com/lexi-lambda/racket-r7rs)
  - R7RS [official](https://r7rs.org/) [errata](https://github.com/johnwcowan/r7rs-work/blob/master/R7RSSmallErrata.md) / [this](https://small.r7rs.org/wiki/R7RSSmallErrata/)
  - IEEE is [old](https://standards.scheme.org/formal/) also [see](https://conservatory.scheme.org/schemers/Documents/Standards/)
    > In colloquial use, “Scheme standard” usually refers to the latter.
  - scheme [doc](https://docs.scheme.org/) 
    - [cookbook](https://cookbook.scheme.org/)
    - [man](https://man.scheme.org/)
  - If using Racket, then [R5RS may be better](https://stackoverflow.com/a/3358638)
### comparison
- > which Spring 2007 6.001 lectures we've drawn the material from, in case you *want to delve deeper, get a second opinion*, read ahead, etc.
  > we are mostly *tracking the 6.001 lectures*
  > Since this course is a *heavily condensed* version of 6.001
- newer 6.037 uses Racket but [6.001 uses DrScheme](https://web.archive.org/web/20161201164940/http://sicp.csail.mit.edu/Spring-2007/dont_panic_ft06.html#SEC1). [See](https://stackoverflow.com/questions/13003850/little-schemer-and-racket)
### [DON'T PANIC](https://web.archive.org/web/20161201164940/http://sicp.csail.mit.edu/Spring-2007/dont_panic_ft06.html#SEC6)
- > the basic things that occur when you use the computer to write and evaluate code written in Scheme.
  - Flow of Control (trivial without saying much about more basic things like assembly)
    window manager -> the application (DrScheme window: one text editor 1. with "definitions window" and "interaction window" 2. can "Save Interactions as Text" 3. clicking on the Run tab similar to *python*) -> 
    > each subprogram is typically a definition
- Skip "Editing Your Code"
- TODO
  > Did I remember to evaluate all the changes that I made?
  > It's a good idea to *comment the transcript* after each problem, while the details are still in your mind.
  > How Can I Reach a *"Steady State?"*
  Debugger
- Debugging
  - > Only experience can help you become a master debugger. However, good discipline in trying to debug code can be very valuable experience.
    > Another handy tool provided by DrScheme is a syntax checker.
  - This should *not be used arbitrarily* because that will cause mess by my history experience.
    > If the debugger doesn't give you the needed information, sometimes it is useful to put a *display* or display expression into your code to gather information.
  - > It is often *easier to avoid bugs* than to find them so use a *clear* design *instead of clever or tricky* code
## 6.5151 (6.905)
1. I *can't find the pdf lecture* by "mit 6.5151 lecture filetype:pdf".
2. It seems to have no homework by '6.5151 "homework"' (with only Red Tape pdf), similarly for Exam by 'mit 6.5151 "exam"' and Quizzes by "mit 6.5151 Quiz".
   It only has *problem set / assignment*.
- [old ~~project~~ assignment implementation 2009](https://buffer.rajpatil.dev/%2F20240410114903-mit_ocw_6_945_aiasp.html) and [2019](https://github.com/bmitc/mit-6.945-project) (weird still [can't find its fork](https://github.com/bmitc/mit-6.945-project/forks?include=active&page=1&period=&sort_by=stargazer_counts))
  TODO [project](https://groups.csail.mit.edu/mac/users/gjs/6.945/final-project.pdf) needs team and is a bit general about "symbolic-manipulation software".
- I only find one 2009 [video lectues](https://archive.org/details/adventures-in-advanced-symbolic-programming)
  - https://news.ycombinator.com/item?id=23599794
    > but the entire class is centered around psets
  - [This](https://github.com/prakhar1989/awesome-courses?tab=readme-ov-file) is [not archived](https://web.archive.org/web/20240513002054/https://camo.githubusercontent.com/afb2fd943e89b86299f1e2c61e629fe0e5a3b8ecde5221e683445077b0754101/68747470733a2f2f6173736574732d63646e2e6769746875622e636f6d2f696d616765732f69636f6e732f656d6f6a692f756e69636f64652f31663464642e706e67)
    but it seems to be still [the video](https://docs.github.com/en/authentication/keeping-your-account-and-data-secure/about-anonymized-urls)
- [AI_preq_sicp]
  > if you want to do Sussman's more recent books like SDF you're going to have to use the latest mit-scheme anyway
- pset / PS09 -> assignment.
### [overview](https://groups.csail.mit.edu/mac/users/gjs/6.945/overview.pdf)
- >  Substantial *weekly programming assignments and a final project* are an *integral* part of the subject.
### [red-tape](https://groups.csail.mit.edu/mac/users/gjs/6.945/red-tape.pdf)
- Assignments
- project
  > If you don’t come up with a great IDEA yourself, we have *some ideas that you might pursue*. You will be expected to write elegant code that can be *easily read and understood* by us. You must supply a clear *English explanation* of how your software works, and a set of *test cases* *illustrating and testing* its operation. You will present a brief summary and demo in class near the end of the term.
- homework may mean assignment
  > by a combination of classroom participation, homework, and project work
- Collaborative work
  > *involve themselves in all aspects* of the work. ... you should indicate the names of any collaborators for *each part* of the assignment
### sdf solutions
- partial
  [this having the most solutions](https://github.com/compclub/exercises/blob/main/chapter-2-dsl/rmoehn/README.md) uses Clojure
  [this](https://github.com/compclub/projects) uses Rust...
  [This](https://github.com/chebert/software-design-for-flexibility) I can't find the relation with the exercises
  [This](https://github.com/nbardiuk/software-design-for-flexibility) too less
  [This](https://github.com/mbillingr/sdf) and [this](https://github.com/jeffhhk/SoftwareDesignForFlexibility) has no solutions
- See [this with annotations](https://docs.google.com/document/d/1oyk2EHiTfSe1t0Wbr-HJtfVVvLvulonckpOWaD5KD3E/edit) from [this](https://docs.google.com/document/d/1daYgzQX6Wuxy-iEA9jqpu8b50a_Zbd0FxvKswxAV478/edit)
  [summary](https://docs.google.com/document/d/1vs9ep6A9VLvtn6QLMalYgxQSMXvfPdZA0vdVT6POoJs/edit#)
  - I [can't join its slack](https://compositional-cb63110.slack.com/) room and this course has finished
# course besides 6.001,037 in mit
- teachyourselfcs recommends [cs61a 2011](https://teachyourselfcs.com/#programming) which is [the last course](https://www.reddit.com/r/berkeley/comments/hl9rxt/comment/fwxonlz/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button) to teach with scheme (See [this](https://github.com/theurere/berkeley_cs61a_spring-2011_archive/tree/master) for all resources [unavailable directly](https://web.archive.org/web/20110306121705/http://wla.berkeley.edu/~cs61a/sp11/lectures/) from university)
  See also [CS61AS](https://www.reddit.com/r/berkeley/comments/hl9rxt/comment/fwxpxo4/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button) [mainly based on labs](https://www.reddit.com/r/berkeley/comments/38my8j/comment/cry702u/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button) which is also said in its page
  - [comparison said by Brian Harvey](https://web.archive.org/web/20160304013558/https://www.cs.berkeley.edu/~bh/61a.html) from [this](https://www.reddit.com/r/berkeley/comments/38my8j/differences_between_cs_61a_and_cs_61as/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button)
    > Nevertheless, I *prefer* my own proposal for how to preserve 61A after my retirement: a self-paced version, CS 61AS, using SICP.
    > But also, I wish *I'd invented the self-paced structure* of the course years ago, before the issue of changing 61A came up. We've always had a pretty *high 61A dropout rate* because students can't keep up. It turns out, from our 61AS experience, that many of those students are perfectly capable of learning the ideas *if they're given more time*
    - > If you take the extra 5th unit, it will be called CS 98. (Despite what Brian wrote, the "H61AS" course description never actually happened.)
      may [mean (crawled by google)](https://inst.eecs.berkeley.edu/~cs61as/su12/)
      > Credit for Unit 5 will be assigned through a CS 98 course
      [CS 98](https://www2.eecs.berkeley.edu/Courses/CS98/)
    - maybe "problems" mean "high 61A dropout rate"
      > There is a plan afoot to *eliminate some of these problems* by recasting 61AS as a two-semester course
    - course design
      > Their solution was giving a unit of 61A credit for Unit 0, so students could take either Units 0-3 or Units 1-4.
      So we decide
      > for a constant four units (namely, Chapters 1-4 of SICP) ... Unit 0 will be offered as a separate one-unit CS 3S.
    - TODO
      I didn't find corresponding chapter description in [schedule](https://docs.google.com/spreadsheets/d/11If2HTqhRgMOAwqs4dWVV4ceRDJlj3orRnMkYJmMBBc/edit?pref=2&pli=1#gid=0)
      > And I can't give anyone a fifth unit of 61AS, even an optional one, for Chapter 5.
    - OP [decides to choose CS61A](https://www.reddit.com/r/berkeley/comments/38my8j/comment/crzsn72/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button) because
      > My concern was not that CS61A going fast but slow. If it's going fast enough, I don't think there is much need for taking 61AS.
      learn both
      > I think one option I'm considering now is to self-study SICP in summer and take CS61A in fall.
      - TODO
        DeNero doesn't teach these 2 courses.
        > Also there is DeNero factor for 61A, I know.
## 2011 [hw, project etc. solution](https://github.com/zackads/sicp/tree/main)
TODO ""CS61AS" lab solution github" seems to not have CS61AS solutions. I will try that.
[video with Transcript to help search](https://www.youtube.com/watch?v=JAFUtlTrTHA&list=PL-4wJVBe4rQVeITP7acgaX86ukMKtOS3C)
A&S means "Abelson & Sussman" book.
interestingly inst.eecs.berkeley.edu [doesn't need one account before](https://web.archive.org/web/20120120151042/https://inst.eecs.berkeley.edu/~cs61a/su11/) and can be indexed by google.
- [cs61a 2011](http://wla.berkeley.edu/~cs61a/sp11/)
  [useful](http://wla.berkeley.edu/~cs61a/reader/vol2.html)
  - Weiner Lecture Archives seems to [*only* contain videos](https://web.archive.org/web/20120104033822/http://wla.berkeley.edu/main.php?course=cs61a) without others.
  - solutions [aren *unavailable*](https://web.archive.org/web/20111001000000*/https://inst.eecs.berkeley.edu/~cs61a/sp11/solutions)
    - maybe [this](http://wla.berkeley.edu/~cs61a/su11/solutions/) from https://github.com/fgalassi/cs61a-sp11?tab=readme-ov-file
  - https://web.archive.org/web/20110306121705/http://wla.berkeley.edu/~cs61a/sp11/lectures doesn't contain subdir's.
  - Simply Scheme by "Brian Harvey and Matthew Wright" online is like [the prerequisite of sicp](https://people.eecs.berkeley.edu/~bh/ssch26/preview.html) although as mit course says it is *not necessary*.
    > The *next step* is to read Structure and Interpretation of Computer Programs
  - Discussion group is piazzza which only university students can access.
  - STk seems to be one derivative of Scheme which can be ignored.
- [Course Reader, Volume 2](http://wla.berkeley.edu/~cs61a/reader/vol2.html)
  - [online lectures](https://web.archive.org/web/20120104011702/http://wla.berkeley.edu/main.php?course=cs61a) only have videos
- See [lecture notes](http://wla.berkeley.edu/~cs61a/reader/notes.pdf) for project schedule time and corresponding book Section.
- [readers](https://me.berkeley.edu/readers/)
- [OBSOLETE Homework, projects, lab](http://wla.berkeley.edu/~cs61a/reader/vol1.html)
- Course information (I only read bold text and the first sentence in each paragraph to get the main idea.)
  - recommends "You should try to complete the *reading assignment* for each week *before the lecture*.".
    - Although for mit OCW, it may [be not that case](https://qr.ae/psxpwo) written by one MIT student.
      > I will rarely read the textbook unless some combination of the following is true: (1) I am very confused or lack the requisite background, (2) I am specifically told to do so by the professor, (3) the textbook is *highly recommended* by people I know who *took the class* before, (4) I have *time* on my hands.
      > When I’m not taking the corresponding class in person, I take a similar approach to reading the book, but *only after I’ve watched the lectures and read through the notes*. ... I’d resort to notes from *other professors* (sometimes not from MIT) before I’ll read the book.
      for exam
      > , reading the textbook first would *help immensely*, but it’s *not as efficient* because I’ll learn a lot more about *what the professor thinks is important* by reading/watching material directly produced by him or her.
    - It [depends on the student habits](https://www.reddit.com/r/mit/comments/11d9ap0/comment/ja7d7a5/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button).
      > If a class requires readings before the lecture, it's usually *redundant* to the lecture and annoying (khm 6.031 khm)
      > I have a friend who enjoys reading textbooks at the end of the day to better understand and *digest the material from lectures*. Most of my friends and I do readings (mostly class notes *because usually there is no textbook*) while doing *psets/labs* if there are concepts we forgot/didn't understand/need a deeper understanding of for the assignment.
  - help
    > Your *first and most important* resource for help in learning the material in this course is your *fellow students* ... You are responsible for helping each other learn.
    self-study in campus
    > Instead, come see a faculty member to discuss *sponsorship of a non-class account* for independent study
  - Homework and Programming Assignments
    > The purpose of the homework is for you to learn the course, not to prove that you already know it
  - https://web.archive.org/web/20080514204601/http://www.swiss.ai.mit.edu/projects/scheme/index.html -> https://groups.csail.mit.edu/mac/projects/scheme/
    Etc. doesn't have much valuable.
    Answers to frequently asked questions (last updated in 1997). is skipped.
    Programming Language Research is skipped due to it is too detailed.
  - book
    > We have listed an optional text for the course, Simply Scheme, by Harvey and Wright. It *really is optional*! Don’t just buy it because you see it on the shelf.
  - think better than writing mere notes.
    > What this means is that you should be able to *devote your effort during lecture to thinking*, rather than to frantic scribbling.
### TODO
- Course information handout
  - > Unlike the homework and projects, the *tests* in this course (except for the parts specifically designated as group parts) must be your own, individual work
- why bh links to [Marxism](https://web.archive.org/web/20170225101107/https://www.anu.edu.au/polsci/marx/marx.html)??????
### comparison between scheme and python
- [1](https://news.ycombinator.com/item?id=9844181)
  >  You almost certainly *missed out on things* that you could very well *never see again*, or even know the existence of (at least for a very long time)
  kw: metaprogramming, macros, 
  > This is something you can't even dream of doing in most (all?) languages that *aren't dialects of LISP*.
  - [2](https://news.ycombinator.com/item?id=9843053)
    > The first 1/3 of CS61A in scheme had *no mutation*. That is almost impossible in Python to do, and is not the way the language is used in industry
    Python is to help the majority of struggling students
    > but perhaps fail to grasp some of the more complex concepts ... 80% of the material hasn't changed but you've gained the above benefits
    > If you understood the intricacies of what *was* taught in CS61A, you will find it very easy to *generalize* those concepts to *new languages* - and new concepts.
So I skip [this python lesson 6.100](https://introcomp.mit.edu/spring24/information)
### lab
recommended since the course general information shows (more detailed see 1.md)
> Laboratory exercises are short, relatively simple exercises designed to *introduce a new topic*.

[lab solutions](https://people.eecs.berkeley.edu/~bh/61a-pages/)
- Also [see](https://github.com/nirvanarsc/CS-61A/blob/master/mt1/mt1.scm) (TODO mt -> meeting?)
### update [Course Reader vol 1](https://people.eecs.berkeley.edu/~bh/61a-pages/)
## cs61as
The latest should be CS "61AS" spring 2016 since 'CS "61AS" fall 2016' has nothing.
I only check labs without checking Homework, Quizzes and Retakes
- Syllabus
  - uses Racket
  - > Lessons also link to external readings drawn from *SICP and old CS 61A lecture notes*'
  - "Units" shows the corresponding book chapters.
- Suggested Schedule & All Deadlines don't give project corresponding chapters
  So by Syllabus and textbook, maybe project x corresponds to chapter x.
- FAQ doesn't have much about what to be learnt.
- the following needs university student account
  - Discussion Worksheets and Solutions
- Webcasts fails now.
- Legacy Resources -> Lecture Notes may point to cs61a
- [Environment Diagram Drawer](https://cs61a.org/assets/pdfs/reverse-ed.pdf)
### reading
- > Lessons also link to external readings drawn from SICP and old CS 61A lecture notes. It is highly recommended that you complete *these readings before starting the lesson* material.
# How to learn
## project
- "lab exercises, computer examples" may [be important](https://academia.stackexchange.com/a/151857)
## book vs lecture
- better [not drop the textbook with only lectures left](https://www.physicsforums.com/threads/which-is-more-effective-for-learning-textbook-or-lecture-notes.467145/post-3105007) after *considering time*
  Also [see](https://www.physicsforums.com/threads/which-is-more-effective-for-learning-textbook-or-lecture-notes.467145/post-3105014)
  > The only thing I feel professors are good for is *answering questions* which are *not fully answered* in the textbook.
  - Also see [this](https://www.reddit.com/r/math/comments/13jq1b8/comment/jkgkcee/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button) which means *book & exercises* is better with its following comments. (Also see [this](https://www.reddit.com/r/math/comments/13jq1b8/comment/jkgozm5/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button) which recommends the book and Roneitis's comment)
- [~~This lecture~~](https://news.ycombinator.com/item?id=19887732) means live lectures
## video
- what video [actually needs to do](https://academia.stackexchange.com/a/52758)
  > The advantage of the human teacher is that I *can ask questions*, but of course a video teacher cannot answer. There are cases, of course, where a video is superior to a printed book: a video can *show action* that a book can only describe or perhaps show still photos. So if you want to learn how to *perform some physical action*, like how to play golf or replace a transmission filter or whatever, a video might be able to show you in ways that *a book could not.*
- video lectures should [not be dependent more than the book](https://qr.ae/psJ39d). 
  Also [see](https://www.reddit.com/r/learnprogramming/comments/8tn6pv/comment/e18s63p/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button)
  - [this](https://qr.ae/psJBAi) and [this](https://www.reddit.com/r/PhysicsStudents/comments/oll49b/comment/h5g0fel/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button) says video is *only as one companion* but not the main part.
## summary
- [detailed][academia_se_tips]
  1. not drop one part artificially.
  2. better read the *lecture before* the book to get the *main idea*
  3. spend "~90% of their time working problems". (Although ~90 may be too high for actual course learning.)
- choose [the favorable method](https://mitili.mit.edu/news/compared-reading-how-much-does-video-improve-learning-outcomes) to learn
  > Likewise, those who *preferred to read and did read* scored nearly 10 percent *higher* on the post assessment than participants in the video group who would have preferred to read.
# Emacs
- [reference card](https://www.gnu.org/software/emacs/refcards/pdf/refcard.pdf)
- [brief intro to run scheme](https://languageagnostic.blogspot.com/2011/05/mit-scheme-in-emacs.html?m=1) from [this](https://www.reddit.com/r/scheme/comments/grnz6o/comment/fs248nv/?utm_source=share&utm_medium=web3x&utm_name=web3xcss&utm_term=1&utm_content=share_button)
# (misc)
## How to write emails to TA, etc
- see [comics](https://advising.yalecollege.yale.edu/how-write-email-your-instructor) or [example](https://www.purdue.edu/advisors/students/professor.php)
  - 1
    - a clear subject line
    - *Do your part in solving* what you need to solve.
    - Be aware of concerns about entitlement. (i.e. respectful)
    - *shaping* your words in light of *whom you are writing to* and why.
      > share information regarding an event the professor *might want to know* about or pass on an article from your news feed that is *relevant to the course*
  - 2
    - correct grammar and spelling
- [more general](https://sparkmailapp.com/formal-email-template)
- [should I add period at the end in the brackets](https://proofed.com/writing-tips/punctuate-brackets/#:~:text=However%2C%20we%20have%20a%20few,case%20the%20period%20goes%20inside.)
  > I ate the whole cake. (And now I am full.)
## grading curve
- https://www.bestcolleges.com/blog/curved-grading/#:~:text=What%20Is%20Grading%20on%20a%20Curve%3F,A%20grades%20and%20failing%20grades.
  > they can grade on a curve. That means *modifying each student's grade* to *raise the average*.
# MIT-scheme miscs
- [exit message meaning](https://github.com/search?q=repo%3Abarak%2Fmit-scheme%20term_halt_messages&type=code) https://github.com/barak/mit-scheme/blob/56e1a12439628e4424b8c3ce2a3118449db509ab/src/microcode/term.c#L111C5-L111C30
# html book searching tips
- select by the specific emphasized text
  [XPath](https://scrapfly.io/blog/how-to-select-elements-by-text-in-xpath/) ([no corresponding CSS selector](https://stackoverflow.com/a/4561376/21294350))
- following-sibling
  [XPath -> selector](https://devhints.io/xpath#using-axes)
# scheme style
- [1](https://web.archive.org/web/20240117063034/http://community.schemewiki.org/?scheme-style)
  - preface says about the indentation.
  - Rule 1: not "Don't put closing (or opening) parens on a line of their own", i.e. one line with only one paren.
    > Notice how the closing parens are all on a line of their own, *indented so to mark* where the expression will continue. Remember, it's *an exception - use this rarely*.
  - For the rest I only read their titles.
- [naming](https://web.archive.org/web/20231129221311/http://community.schemewiki.org/?variable-naming-convention)
  - TODO
    *Name
- [comment convention](https://web.archive.org/web/20220526005605/http://community.schemewiki.org/?comment-style)
- I skipped "Scheme Tips from Dartmouth" since format is not that important but needs to be consistent when cooperation.

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
- [new book site](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/index.html) same as the [old one](https://web.archive.org/web/20160306140516/https://mitpress.mit.edu/sicp/) from [this](https://web.archive.org/web/20160303050117/http://groups.csail.mit.edu/mac/classes/6.001/abelson-sussman-lectures/) where "excerpts from the book" may mean "Full text!"
  > This includes excerpts from the book, a collection of sample assignments, and information on where to obtain implementations of Scheme.
# Acknowledgments
- > Our subject is a *clear intellectual descendant* of ``6.231,'' a wonderful subject on programming linguistics and the lambda calculus taught at MIT in the *late 1960s* by Jack Wozencraft and Arthur Evans, Jr.
  6.231 uses [one different language](https://www.cl.cam.ac.uk/~mr10/PAL.html).
  [new Lambda Calculus course](https://ocw.mit.edu/courses/6-820-fundamentals-of-program-analysis-fall-2015/pages/syllabus/)
  1960s seems to be [too old to be archived](https://ocw.mit.edu/about/) (Also see [wikipedia](https://en.wikipedia.org/wiki/MIT_OpenCourseWare))
## [scheme official](https://www.scheme.org/) migrated from [Schemers.org](http://www.schemers.org/) (I seems to search R4RS and met this website)
- what is [newsgroup](https://www.wikihow.com/Access-Newsgroups) Also [see](https://comp.lang.scheme.narkive.com/)
- [faqs.org](http://www.faqs.org/faqs/by-newsgroup/comp/comp.lang.scheme.html)
- https://chat.scheme.org/ seems to be same as https://community.scheme.org/
- https://books.scheme.org/ doesn't give one order
  - Not use [commercial EdScheme](https://gustavus.edu/academics/departments/mathematics-computer-science-and-statistics/max/concabs/schemes/edscheme/win/) related with book Concrete Abstractions by Mike Eisenberg.
### [community.schemewiki](https://web.archive.org/web/20240228152042/http://community.schemewiki.org) (notice the following link may be not latest for the schemewiki link, they are just for reference.)
- [code](https://web.archive.org/web/20240228135155/http://community.schemewiki.org/?category-code)
- [learning scheme](https://web.archive.org/web/20230730151321/http://community.schemewiki.org/?category-learning-scheme) although sicp doesn't intend to teach that.
- [manual](https://web.archive.org/web/20230923095649/http://community.schemewiki.org/?category-manuals)
- [different faq's](https://web.archive.org/web/20220117101744/http://community.schemewiki.org/?category-scheme-faq)
  - scheme-faq-general
    - > *Development time and maintenance effort* are often much *more important than execution speed* and memory resources
      TODO
      > The design of Scheme makes it quite hard to perform certain common types of optimisations. For instance, one cannot normally inline calls to primitives (such as + and car) because Scheme allows the re-binding of their names to different functions
    - [debugger](https://web.archive.org/web/20231208093804/http://community.schemewiki.org/?scheme-faq-standards#debuggers)
      > it also imposes some limitations, e.g. the debugger *cannot catch runtime errors* and some tail-recursive calls may *become non-tail-recursive*. PSD is therefore *no substitute for a native debugger* but an extension for Schemes with no debugger at all.
  - TODO [scheme-faq-programming](https://web.archive.org/web/20230923102638/http://community.schemewiki.org/?scheme-faq-programming) and https://web.archive.org/web/20231122105715/http://community.schemewiki.org/?scheme-faq-misc
    also other scheme-faq-...
### https://conservatory.scheme.org/schemers/
- https://conservatory.scheme.org/schemers/Education/
  The TeachScheme! Project (now https://programbydesign.org/) is targeted for "middle-school, high-school and university levels"
- TODO 
  - check program
  - [Functional Programming FAQ](https://web.archive.org/web/20090524191417/http://www.cs.nott.ac.uk/~gmh//faq.html)
- old	[Schemers Inc. page](https://web.archive.org/web/20051229151833/http://www.schemers.com/)

---

# How Do I learn SICP
- I read
  - lectures (I skipped Recitation because they are only review with no new knowledge to teach) first as [academia_se_tips] point 2 shows.
    - 6.037 (not read "With slide transitions" which is for lecture ppt instead of self-study)
    - 6.001 2007
  - read the book
  - use video when unable to understand
- For SICP book, I didn't revisit the book back for something like
  > who explained it in terms of the “message-passing” model of computation that we *shall discuss in Chapter 3*
# CS 61AS chapter 0
## 0.1
- https://web.archive.org/web/20150601000000*/http://start.cs61as.org/ doesn't work
- > Computer scientists are like engineers: we build cool stuff, and we solve problems.
  the links are interesting.
- > your browser has to determine which server to contact, ask that server to give it the webpage you're looking for, download the webpage, interpret the webpage, and display it on your screen.
  DNS -> communication -> network transfer -> interpreter -> GUI
- `(+)` just adds nothing -> 0.
- kw
  > This so-called "textbook" consists of 17 lessons, *most of which are based on the classic text* Structure and Interpretation of Computer Programs, which gives this course its name.
  programming languages
  > That's because in the grand scheme of things, *programming languages don't matter*. They only matter because, for any given problem, one language might let us solve the problem *in fewer lines* of code over another, or one language might let us solve the problem *more efficiently*, and so on.
  > As you learn more computer science, we'll *incrementally show you more of the language*.
  Interpreters
  > Interpreters: We go into how an interpreter works, and we'll even write our own. We'll also consider a few other interpreters and see *what they all have in common*.
  CS 61A
  > CS 61A is the sister course to CS 61AS. It is offered in the traditional *lecture-lab-discussion* format,
  > CS 61AS is a lab-centric class—there are no lectures. Students learn by working *through guided readings and participating in discussions*.
- [detailed comparison](https://docs.google.com/document/d/1htUkJJHXnXnDVMLq4avHsCbIAWFfki_hxuLumtYz6Os/edit)
  > In CS 61A, we are interested in teaching you about programming, *not about how to use one particular programming language*. ... Mastery of a particular programming language is a very useful *side effect* of studying these general techniques.
  Comparison of Courses
  > A bit of Python (build a Python interpreter)
  - What if I've never programmed before? -> Unit 0
  - Do I have to go to lab/discussion?
    > You are highly encouraged, but *not required to attend discussions*.
    > In CS 10 and CS 61AS, lab is the only place in order to *take quizzes*.
  - [L&S](https://guide.berkeley.edu/courses/l_s/) [Breadths](https://lsadvising.berkeley.edu/seven-course-breadth#:~:text=An%20exception%20to%20this%20limitation,wish%20for%20Seven%2DCourse%20Breadth.) may be targetted more at Letters
    > introducing them to *a multitude of perspectives and approaches to research and scholarship*.
  - Why does 61AS use Scheme/Racket when 61A uses Python?
    This is almost same as the preface about syntax.
    Also same as about "Python" as "The End of an Era" says.
    > It should be said that both 61A and 61AS staff consider Python and Scheme to be good programming languages to learn (hence they *show up in both* courses),
  - TODO 
    my facebook account is always banned due to the IP problem.
    "Berkeley Facebook group"
  - General Info of CS 61AS
    - > You learn by working through short readings and guided labs and participating in discussions
      "short readings and guided labs" is almost same as MIT 6.5151 (6.905).
    - > 61AS Uses SICP, which is The Best Computer Science Book. This is the book that the *61A lecture notes are based off of*.
      Here probably mean the new 61A using Python as indicated by the above "detailed comparison".
    - This is probably for [CS 61AS 2015](https://www.alicialuengo.com/Resume.pdf)
### Homework
- > Why is and a special form? Because it evaluates its arguments and stops as soon as it can, returning false as soon as any argument evaluates to false.
  ~~TODO can `cond` implement `and` correctly?~~
  Same reasons as `if` in Exercise 1.6 where applicative-order causes the evaluation order to be wrong.
  See summary in 0.2
  > quote is different from most other procedures in that it *does not evaluate its argument*. Functions that exhibit this type of behavior are special forms.
  And https://berkeley-cs61as.github.io/textbook/special-forms.html#sub2
- [`[,bt for context]`](https://github.com/racket/xrepl/issues/6#issuecomment-271360651)
- > Why did the Walrus cross the Serengeti?
  https://www.expertafrica.com/tanzania/info/serengeti-wildebeest-migration
  > They migrate throughout the year, constantly seeking fresh grazing and, it's now thought, better quality water.
- 0.1-Exercise 4 is same as book exercise 1.6.
- Recommended Readings is 
  CS61a 2011 notes and the book
- TODO
  - scheme require file diff load in `racket -t` vs `-f`.
- `sudo racket -tm grader.rkt -- hw0-1-tests.rkt hw0-1.rkt` to run all tests.
## 0.2
- > "the greatest single programming language ever designed" -- Alan Kay
  See https://qr.ae/psmZZR. At least "operators" differ.
  This also implies Scheme can define other lanugages.
- Readings are from "Simply Scheme: Introducing Computer Science".
- `'61AS` in newer Racket at least has the value.
- Use `(require (planet dyoo/simply-scheme))` to use `butlast`.
- See "The Empty Sentence" and "The Empty Word".
- [`.` usage](https://groups.csail.mit.edu/mac/ftpdir/scheme-reports/r5rs-html/r5rs_6.html#SEC29)
  - Also see [`define`](https://groups.csail.mit.edu/mac/ftpdir/scheme-reports/r5rs-html/r5rs_7.html#IDX135)
    > the value of the definition is completely evaluated before being assigned to its variable.
    [same](https://groups.csail.mit.edu/mac/ftpdir/scheme-reports/r5rs-html/r5rs_7.html#SEC45) as [`set!`](https://groups.csail.mit.edu/mac/ftpdir/scheme-reports/r5rs-html/r5rs_6.html#IDX77)
    > If <variable> is not bound, however, then the definition will bind <variable> to a new location before performing the assignment
    i.e. it will init while `set!` won't.
    - [letrec](https://groups.csail.mit.edu/mac/ftpdir/scheme-reports/r5rs-html/r5rs_6.html#IDX93)
      > the <init>s are evaluated in the resulting environment (in *some unspecified order*)
      implies
      > it must be possible to evaluate each <expression> of every internal definition in a <body> *without assigning or referring to* the value of any <variable> *being defined*.
    - > An important property of procedure definitions is that the body of the procedure is not evaluated until the procedure is called.
      I didn't fine it in the R5RS doc.
      This is reasonable because the `body` may contain argument.
      ```scheme
      (define (foo sent word)
        (word sent word)) ; Here word will be local. If pass in `'a`, then it is not one procedure.
      ```
- TODO
  > The period and comma also have special meaning, so you cannot use those, either.
- https://berkeley-cs61as.github.io/textbook/special-forms.html#sub2
  - Test Your Understanding
    `(and #f (/ 1 0) #t)`
    `(or #t #f (/ 1 0))`
  - > *Simple code is smart code*, and will make complex programs much more readable and maneuverable.
## 0.3
- > One of its arguments must be a number that tracks the stage of computation for the current recursive call.
  this is not necessary always because we can [use *global* variables](https://stackoverflow.com/q/51682848/21294350).
- > Back in Lesson 0-2, we stated an important property of defining procedures, where the procedure body is not evaluated when it is definted. This is the technical reason why recursion can work.
  So when define `(factorial n)`, `(factorial (- n 1))` doesn't need to be valid.
  > Thus, define is a special form that does not evaluate its arguments and keeps the procedure body from being evaluated. The body is only evaluated when you call the procedure outside of the definition.
  i.e. "not evaluate"d when `define` but "evaluate"d when invoked.
- > Which of these expressions cause an error in Racket? Select all that apply.
  Notice
  https://groups.csail.mit.edu/mac/ftpdir/scheme-reports/r5rs-html/r5rs_6.html#SEC29
  > When the procedure is *later called* with some actual arguments, the environment in which the lambda expression was evaluated will be extended by binding the variables in the formal argument list to fresh locations, the corresponding *actual argument values will be stored* in those locations, and the expressions in *the body of the lambda expression will be evaluated sequentially* in the extended environment.
  https://groups.csail.mit.edu/mac/ftpdir/scheme-reports/r5rs-html/r5rs_6.html#SEC31 (See the above `set!`)
  > <Expression> is *evaluated*, and the resulting value is stored in the location to which <variable> is bound.
- > Think about what happens if the word contains no vowels.
  The endless loop.
- > we have to decide whether or not to keep the first available element in the return value. When we do keep an element, we keep the element itself, not some function of the element.
  i.e. no need to call "some function of the element" recursively.
  IMHO here obviously we need to manipulate with "the element", so not "the element itself".
- Comparing "The "Accumulate" Pattern" with "The "Every" Pattern",
  the former has "a single result" while the latter will have a list like "a sentence".
- `(pigl wd)` doesn't iterate all elements although it follows "the accumulate pattern".
# CS 61A Unix_Shell_Programming
- `tr -d '.,;:"![]()' < summary` is enough.
- `tr ’[A-Z]’ ’[a-z]’ < oneword > lowcase` See `info tr`.
- [`[=e=]` (See macOS tr)](https://www.davekb.com/browse_computer_tips:linux_tr_equiv_chars:txt)
- Also see `info join` example
# chapter 1
Since I was to learn programming, so for paragraphs not intensively with programming knowledge I only read their first sentence.
## 6.037 (dropped for future reading except this one already read)
- [web.mit.edu/alexmv/6.037/](https://web.archive.org/web/20200113183359/http://web.mit.edu/alexmv/6.037/)
- [Graduate P/D/F](https://registrar.mit.edu/classes-grades-evaluations/grades/grading-policies/graduate-pdf-option) is *not one standard* option
- TODO
  - [TR](https://kb.mit.edu/confluence/display/glossary/TR) meaning in "TR, 7-9PM"
- Newton's method (i.e. approximation based on derivative) -> Heron's method [proof](https://math.stackexchange.com/a/1733394/1059606)
  notice here we can't use $f(x)=\sqrt{x}-\sqrt{2},x\mapsto x-\frac{\sqrt{x}-\sqrt{2}}{\frac{1}{2\sqrt{x}}}=2\sqrt{2x}-x$ where the mapped result contains $\sqrt{2}$ which is what ~~since~~ we want to calculate~~$\sqrt{2}$~~.
- [shire album book series](https://www.somethingunderthebed.com/CURTAIN/SHIRE_ALBUM.html)
  - TODO does the author have one website (search by "Calculating Machines and Computers Geoffrey Tweedale page")?
- TODO what is silicon well, Higgs field?
- TTODO which means it must be understood for further study.
  - `#<procedure:+>`
- I installed mit-scheme using aur which is [updated](https://groups.csail.mit.edu/mac/users/gjs/6.945/dont-panic/#org1107e7f)
- > Why can’t "if" be implemented as a regular lambda procedure?
  because lambda is [*sequential*](https://www.gnu.org/software/mit-scheme/documentation/stable/mit-scheme-ref/Lambda-Expressions.html)
  > the exprs in the body of the lambda expression are evaluated sequentially in it
  - `expr expr` in the above link may be no use. But `define` [may use that](https://stackoverflow.com/a/47166401/21294350).
  - I don't find "regular lambda" in [the video transcript](https://ocw.mit.edu/courses/6-001-structure-and-interpretation-of-computer-programs-spring-2005/resources/1b-procedures-and-processes-substitution-model/)
  - Also see exercise 1.6 where even `cond` can't implement it *with the `define` syntactic sugar for `lambda`*.
- > How do we know it works?
  It only shows one big iteration step where 2 in `(lambda (a b) (/ (+ a b) 2)) 1.0 2` should be ` (/ x guess)`.
- > But, it only solves a smaller version of the problem
  may mean the false `(fact 0)`. p53 is same as Figure 1.3.
- > Better idea: count up, doing one multiplication at a time
  compared with "recursive algorithms", the latter only manipulates with the stack without doing the arithmetic.
- > output value
  may be "output*s* value".
- > express in tabular form
  See p57.
## 6.001 sp07
IMHO 6.037 is the condensed (as its main page says) of 6.001 lectures by removing many figures.
*Seriously* 6.037 drops "Proving that our code works" in lec 3 which is important although this will be learned in the future.
### 1
- TODO
  - > Could just store tons of “what is” information
- kw:
  - robustness and [flexibility](https://www.geeksforgeeks.org/flexibility-vs-security-in-system-design/) which may be probably said in COD.
- [higher order procedure](https://people.eecs.berkeley.edu/~bh/ssch8/higher.html#:~:text=A%20function%20that%20takes%20another,%E2%80%94a%20higher%2Dorder%20procedure.)
- > Use a language to describe processes
  See [this (I only read the context of "process")](https://cs.stackexchange.com/a/142870/161388)
  >  figure the most *important elements to formalize* and how they interact with each other
- > This creates a loop in our system, can create a complex thing, name it, treat it as primitive
  then one complex thing based on that new primitive ... primitive ...
### rec2 (naming follows 6.001 fall 2007)
- > Names may be made of any collection of characters that doesn’t start with a number.
  [See](https://www.scheme.com/tspl2d/intro.html)
  > Identifiers normally cannot start with any character that may start a number, i.e., a digit, plus sign ( + ), minus sign ( - ), or decimal point ( . ).
### 2
- Rumplestiltskin effect just means [naming](https://en.wikipedia.org/wiki/Rumpelstiltskin#Rumpelstiltskin_principle).
- > Next lecture, we will see a formal way of tracing evolution of evaluation process
  in lec 3 p4 it is not that formal but just listing all stages.
  induction is more formal.
### 3 Procedures, recursion
- > E.g. keep trying, but bring sandwiches and a cot
  This may mean it will take a long time.
  Also see [similar words with the different meaning (3 Hots & A Cot)](https://www.urbandictionary.com/define.php?term=3%20hots%20and%20a%20cot)
### rec3 recursion
1. [ ] count1 from n to 0 and count2 from 0 to n.
  - `0` is not displayed by `our-display`.
```bash
1 ]=> (count1 4)
4321
;Value: 0 # here is output by the last (= x 0) 0

1 ]=> (count2 4)    
1234
;Value: 4 # here is output by the last (our-display 4)
```
2. [x] is solved by the lec
3. [ ] use $\lim_{n\to \infty^+}(1+\frac{1}{n})^n$?
  Then $n=1e^{input}$ where `input=-100`, etc.
  - See [this QA](https://stackoverflow.com/q/78597962/21294350)
    We should better read the book first before the recitation since
    1. floating precision problem is said in exercise 1.7.
    2. Shawn's comment is implied in [one footnote](https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/full-text/book/book-Z-H-10.html#footnote_Temp_35).
1. [x] see code
2. [ ] I originally planned to use base case for `n=1,2`.
  The solution is more elegant to use implicitly the 0th number being 0 although in the actual series that doesn't exist.
1. [ ] See https://www.mathsisfun.com/numbers/golden-ratio.html. See the approximation formula said in mcs p1005.
## book reading
### 1.1
- > an integration of the motion of the Solar System
  [See](https://en.wikipedia.org/wiki/Stability_of_the_Solar_System)
- > A second advantage of prefix notation is that it extends in a straight-forward way to allow combinations to be nested
  i.e. enforced parentheses which has much less ambiguity.
- > paraphrasing Oscar Wilde
  [See](https://www.edge.org/response-detail/10765#:~:text=What%20is%20value%3F,and%20the%20value%20of%20nothing%22.)
- > operators are themselves compound expressions
  [See](https://stackoverflow.com/q/57091377/21294350)
- > Syntactic sugar causes cancer of the semicolon
  [See](https://stackoverflow.com/questions/547710/why-is-syntactic-sugar-sometimes-considered-a-bad-thing#comment138572595_547760)
  https://eli.thegreenplace.net/2009/02/16/abstract-vs-concrete-syntax-trees
  > The pointer is now clearly below the array
  i.e. [array of pointers](https://stackoverflow.com/q/6130712/21294350) as expected.
- > e problem arises from the possibility of confusion between the names used for the formal parameters of a procedure and the (possibly identical) names used in the expressions to which the procedure may be applied
  i.e. local compared with global
```scheme
(define (f x) (* x x))
(define x 10)
(f (+ x x))
```
- TODO
  - > Indeed, there is a *long history* of erroneous definitions of substitution in the literature of logic and programming semantics.
  - > prove for procedure applications that can be modeled using substitution (includ-ing all the procedures in the first two chapters of this book) and that yield legitimate values, normal-order and applicative-order evaluation *produce the same value*.
  - https://softwareengineering.stackexchange.com/a/186255
    > because normal-order evaluation becomes much more complicated to deal with when we leave the realm of procedures that can be modeled by substitution.
    notice "special form" may be [neither of applicative or normal][how_special_form_is_special].
- [clause](https://www.merriam-webster.com/dictionary/clause) different from that in logic.
- [so-called very high-level languages](https://en.wikipedia.org/wiki/Declarative_programming) which seems to be learned in COD.
- [antilogarithm](https://mathworld.wolfram.com/Antilogarithm.html) is just exp
- > Such a name is called a bound variable, and we say that the procedure definition binds its formal parameters.
  i.e. its value [has range](https://en.wikipedia.org/wiki/Free_variables_and_bound_variables)
  > if the value of that variable symbol has been bound to a specific value or range of values in the domain of discourse or universe.
- [consistent_renaming]
  - [capture-avoiding substitution](https://stackoverflow.com/a/11332661/21294350)
    i.e. as the book says
    > It would have changed from free to bound
  - An5Drama's question
    2: here $z$ won't exist in $t,e,y$, so it is safe to replace (i.e. "a *fresh* name"). More detailed about "free" see the book.
- [lexical scoping](https://www.shecodes.io/athena/9740-what-is-lexical-scoping-and-how-does-it-work-in-javascript#:~:text=Lexical%20scoping%20is%20a%20way,interact%20with%20examples%20in%20JavaScript.) just means child scope can use all variables defined in the parent scope but not vice versa.
- > the simplest name-packaging problem
  i.e. to [package the function](https://stackoverflow.com/a/20520767/21294350).
  > better structuring a procedure, not for efficiency
  - Also see [this with one ASCII figure](https://veliugurguney.com/blog/post/sicp_7_-_sections_1.1.6_1.1.7_1.1.8)
### 1.2 (Here I read it first to check why CS 61A Week 2 chooses Section 1.3)
- footnote 30 is trivial if having learnt computer architecture.
- tail-recursive
  - [naming source](https://stackoverflow.com/a/33930/21294350)
    > In tail recursion, you perform your calculations first, and then you execute the recursive call,
    Also see comment [1](https://stackoverflow.com/questions/33923/what-is-tail-recursion#comment18950582_37010) which is same as book
    > In this case there is some additional “hidden” information, maintained by the interpreter and *not contained in the program variables*, which indicates “where the process is” in negotiating the chain of deferred operations
    - TODO what does [this](https://stackoverflow.com/questions/33923/what-is-tail-recursion#comment30739771_37010) mean since with `else` removed then the call disappears.
      > It would have been more clearly a tail call, if the "else:" were omitted. Wouldn't change the behavior, but would place the tail call as an independent statement
      [tail call](https://stackoverflow.com/questions/12045299/what-is-difference-between-tail-calls-and-tail-recursion#comment16081995_12045299)
### TODO
- > should note the remarks on “tail recursion” in Section 1.2.1.
### exercises
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
- [ ] 1.9
  - 
## cs61a (read the *related reading* before reading the lecture as the above advises)
### 1.1
- [recursion equation](https://www.geeksforgeeks.org/recursion-in-lisp/)
- [quote diff list](https://stackoverflow.com/a/34984553/21294350) (I only read "A rule of thumb").
- the codes (e.g. 1.1/plural.scm) are pseudocode.
  - `bl` may probably mean butlast.
- >  the clauses aren’t invocations.
  i.e. not procedures.
- > BASIC doesn’t scale up
  maybe [due to](https://qr.ae/psm2OD)
  > More modern versions of BASIC are a lot more powerful, but they’ve lost sight of the original intent of the language. It *wasn’t even a structured language originally*.
- plumbing diagrams See COD FIGURE A.6.2.
- `se ` means [sentence](https://people.eecs.berkeley.edu/~bh/ssch5/words.html)
- map is [more general than function](https://en.wikipedia.org/wiki/Map_(mathematics)#:~:text=Maps%20as%20functions,-Main%20article%3A%20Function&text=In%20many%20branches%20of%20mathematics,%22%20in%20linear%20algebra%2C%20etc.)
- NOTICE 
  - `(zero (random 10))` differs for "Applicative order" and "Normal order".
    > Because it’s not a function
    i.e. `(random 10)` will output different values each time.
  - > But later in the semester we’ll see that sometimes normal order is more efficient.
    TODO
# TODO about the earlier chapters after reading later chapters
- > by incorporating a limited form of normal-order evaluation
# TODO after lambda calculus
- [consistent_renaming] An5Drama's question 3.

TODO read Lecture 5,6 & 6.001 in perspective & The Magic Lecture in 6.037 which don't have corresponding chapters in the book. Also read [~~Lectures without corresponding sections~~](https://ocw.mit.edu/courses/6-001-structure-and-interpretation-of-computer-programs-spring-2005/pages/readings/) ([6.001 2007](https://web.archive.org/web/20161201165314/http://sicp.csail.mit.edu/Spring-2007/calendar.html) is almost same as 2005 and they are both taught by [Prof. Eric Grimson](https://orgchart.mit.edu/leadership/vice-president-open-learning-interim-and-chancellor-academic-advancement/biography)).

[ucb_sicp_review]:https://people.eecs.berkeley.edu/~bh/sicp.html

[course_note]:https://mitp-content-server.mit.edu/books/content/sectbyfn/books_pres_0/6515/sicp.zip/course.html

[academia_se_tips]:https://academia.stackexchange.com/a/163476

[AI_preq_sicp]:https://functionalcs.github.io/curriculum/sicp.html

[mit_End_of_an_Era_comment]:https://mitadmissions.org/blogs/entry/the_end_of_an_era_1/#comment-31965

[how_special_form_is_special]:https://softwareengineering.stackexchange.com/a/137437

[consistent_renaming]:https://cs.stackexchange.com/a/97700/161388