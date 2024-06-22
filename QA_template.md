I am reading SICP. I first read CS 61AS Unit 0 as the preparation. Then I read SICP book and related lecture notes (I will also read SDF as MIT 6.5151 (6.905) requires).

CS 61AS [says in 0.1][1]
> Why is and a special form? Because it evaluates its arguments and *stops as soon as it can*, returning false *as soon as any argument evaluates to false*.

Solve one conditional recurrence relation

---

Recently when learning SICP, 
$$
D(n)=
    \begin{cases}
      2D(n/2)+1,n\text{ is even}\\
      D(n-1)+1,\text{otherwise}
    \end{cases}\\
D(0)=0
$$