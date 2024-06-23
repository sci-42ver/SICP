I am reading SICP. I first read CS 61AS Unit 0 as the preparation. Then I read SICP book and related lecture notes (I will also read SDF as MIT 6.5151 (6.905) requires).

CS 61AS [says in 0.1][1]
> Why is and a special form? Because it evaluates its arguments and *stops as soon as it can*, returning false *as soon as any argument evaluates to false*.

Thanks. With more info, I understood your method. More detailedly, following "the substitution method", 
$$
\begin{align*}
  D(n)&=2(2(\ldots(2D(1)+1+\delta_{(n>>\lfloor\log n-1\rfloor)\equiv_2 1})+\ldots)\\
      &=2^{\lfloor\log n\rfloor}D(1)+\overbrace{2^{\lfloor\log n\rfloor}-1}^{\text{accumulate 1 in }D(n)}+\overbrace{n-2^{\lfloor\log n\rfloor}}^{\text{accumulate }\delta}\\
      &=2^{\lfloor\log n\rfloor}-1+n.
\end{align*}
$$