# Mistakes in Hacon–Witaszek, *On the relative minimal model program for fourfolds in positive and mixed characteristic*

Original errata job `ERRATA-PAPER-HACON-WITASZEK-23`: Claude Code, `cc-7b31c4`.
Independent review `REV-ERRATA-PAPER-HACON-WITASZEK-23`: Codex, `codex-7e92bd`, 23 September 2026.

**All eleven findings are confirmed, with corrections to the scope and explanation of several repairs.**
There are seven misprints, three errors in auxiliary statements and one proof gap. The findings do not
provide a counterexample to a main theorem. In particular, repairing the effective boundary construction
in E7 is not a claim to have completed the subsequent lifted-flop proof.

The machine-readable findings and individual verdicts are in [the JSON file](PAPER-HACON-WITASZEK-23.json).
The [independent review](../reviews/REV-ERRATA-PAPER-HACON-WITASZEK-23.md) records coverage and validation.

## Sources and correction search

The version of record is *Forum of Mathematics, Pi* **11** (2023), e10, pp.1–35,
[DOI 10.1017/fmp.2023.6](https://doi.org/10.1017/fmp.2023.6).
The reviewer read its preserved public PDF, SHA-256
`d7ba34ecde6764ca39071e14e79854e3c8e8db0750343c0dcc1729b84eda328b`,
independently at every finding, including rendered images of pp.5, 12, 13, 17, 20, 29 and 33.
These are the public Cambridge bytes acquired by an earlier extraction worker, not a new publisher download.
The original errata worker could not retrieve this PDF; this review resolves that verification limitation.

A fresh download of [arXiv v2](https://arxiv.org/pdf/2009.02631v2), 16 August 2021, has 38 pages and SHA-256
`161c63089dadc8f9aecd3da1753563fe8f7f9fc2b2722952307cd19bacda7c66`.
E1–E9 occur there too. E10–E11 belong to the published point-count argument, absent from v2.
The preprint numbers some results differently: published Theorem 4.3 is v2 Theorem 4.2;
published Lemma 6.6 and Corollary 6.7 are v2 Lemma 6.4 and Corollary 6.5;
published Theorem 6.1(2b) is v2 Theorem 1.3(2b).

On 23 September 2026 the [arXiv history](https://arxiv.org/abs/2009.02631) still listed only v1 and v2.
Fresh [Crossref DOI metadata](https://api.crossref.org/works/10.1017/fmp.2023.6) had no update fields or
correction relation. The Cambridge search record, [Witaszek’s publication list](https://sites.math.northwestern.edu/lro1793/publications.html),
and bounded title/DOI searches with “erratum” and “correction” yielded no matching correction. A direct
Cambridge HTML read failed. Thus `known: new` means **no correction located in these checks**, not that
an exhaustive search proved none exists. Historical search records remain in the JSON.

## E1 — the adjunction index (confirmed error; a stated result)

Published Lemma 2.2, p.5; v2 p.6. The integer must be the local Cartier index of `K_X+S`, not of `K_X`.

Take `k=F_7`, `X=Spec k[x,y,z]/(xy−z²)` and the ruling `S=V(x,z)`. The canonical divisor is Cartier
because the surface is a hypersurface. Its crepant resolution has charts
`(x,y,z)=(u,uv²,uv)` and `(st²,s,st)`, with one exceptional curve `E²=−2`.
The strict transform `S′` meets `E` once, so `f*S=S′+E/2`. This snc pullback also proves that `(X,S)` is plt.
The different is `P/2` at the vertex. Moreover, `div(x)=2S` while the ideal `(x,z)` needs two generators
there, so `S` is not Cartier. The canonical index is 1, but the log index and the ruling’s index are 2.

For the general plt surface chain, let `d` be its intersection determinant. The surface adjunction
calculation gives different coefficient `1−1/d`; the determinant also kills the local divisor classes.
The denominator of the pullback coefficient forces `d` to divide the Cartier index of `K_X+S`, while
the determinant bound gives the reverse divisibility. This explains the corrected index and both roles
it plays. See Kollár’s [public surface notes](https://web.math.princeton.edu/~kollar/book/chap2.pdf),
§§75–76 and 85–87, pp.35 and 41–42; their numbering is not the 2013 book’s numbering.
The downstream use in Lemma 4.2 is the standardness of the different’s coefficients.

## E2 — finiteness needs fixed boundary coefficients (confirmed error; a stated result)

Published Lemma 2.16, p.13; v2 pp.14–15. On the same `A₁` surface use `B=bC`, where `C=V(x,z)` and
`0<b<1/2` is rational. The one-curve minimal resolution is also a log resolution of this pair and

`K_{S′}+bC′+(b/2)E=f*(K_S+bC)`.

Its exceptional discrepancy is `−b/2`, or log discrepancy `1−b/2`. The snc model is uniformly `1/2`-lc.
Taking `b=1/n`, `n≥3`, produces infinitely many values with one exceptional value per resolution.
If “discrepancies on the resolution” includes the strict boundary, use the uniform bound `m=2` instead.
Either convention disproves the printed finiteness assertion.

The useful repair fixes a finite coefficient set `I⊂[0,1)` and bounds the number of distinct exceptional
log discrepancies **on the minimal resolution**. The paper’s statement says “minimal log resolution”,
but its proof works with the minimal resolution of the surface singularity. The correction now says
explicitly which version it supplies; it does not assert finiteness on all higher models.

Here is the missing finiteness step. Write `T=f^{-1}_*B`, `C_i²=−r_i c_i`, and let `a_i` be the exceptional
log discrepancies. Minimality makes the relative canonical divisor nef; negativity then gives
`0≤1−a_i`. Adjunction yields

`0≤T.C_i=2r_i+a_i C_i²−Σ_{j≠i}(1−a_j)C_j.C_i<2r_i≤8`.

If coefficients belong to finite `I`, each `T.C_i` is a sum of nonnegative integer multiples of its
positive elements. The bound 8 permits only finitely many such sums. Zero coefficients do not matter.
This repairs the otherwise false inference that bounded real right-hand sides take finitely many values.

The remaining compression uses the surface graph facts invoked by the source: bounded integral
intersection data, at most three legs, convex discrepancy sequences, and the equality case corrected in
E8. A convex sequence with at most `m` distinct values has boundedly many nonconstant positions and at
most one constant interval. Retain its ends and remove interior equations; in the constant interior
those equations are identities. The equality case controls the `r_i` there as well. This leaves a
bounded-size system with entries and constants in finite sets. Negative definiteness gives a unique
solution for each system. These classification facts remain inputs, rather than results established
by the finite diagnostics below.

Along a fixed flip sequence the boundary coefficients form a fixed finite set; minimal-resolution
exceptional discrepancies are nonpositive and lie among the finitely many such places used in
Proposition 2.15. Thus the corrected minimal-resolution statement has the scope needed by that argument.

## E3 and E8 — two signs in the surface proof (both confirmed misprints; nothing)

Published p.13; v2 p.15. From `−a_i r_i c_i≥−2r_i` with `a_i,r_i>0`, obtain
`c_i≤2/a_i≤2/ε`. The printed minus sign on `c_i` makes the supposed upper bound vacuous (E3).

The equality case must have `c_2=2`, equivalently `C_2²=−2r_2` (E8).
The printed negative value would give positive self-intersection. More explicitly, with zero strict
boundary intersection and both neighbouring intersections equal to `r_2`, adjunction reads
`c_2 a_2=a_1+a_3`. Equality in convexity and `a_2>0` force `c_2=2`.

## E4 and E5 — the difficulty’s index and domains (both confirmed misprints; nothing)

Published p.12; v2 p.13. The first sum must run over `b_i≥0` (E4).
[Alexeev–Hacon–Kawamata, arXiv v2](https://arxiv.org/pdf/math/0605137v2), Definition 2.3, p.5, indexes it by
`a(B_i)≤0`, and its convention is `a(B_i)=−b_i`. For `b≤0`, every argument `k(1−b)` is at least 1, so
`W(b)=0`. The printed index deletes the intended boundary term: for instance,
`W⁺_{3/4}(1/2)=1/2`, which can make a nonzero contribution to the corrected first sum.

Keep the summed weights `W` on `(-∞,1)`, but define the weights `w` on all real arguments using their
piecewise formulas (E5). Already `b=0` evaluates `w(1)`, outside the printed domain. The extension to
`(-1,∞)` would also suffice for the ordinary discrepancies used in this paper. AHK pp.4–5 distinguish
`w:(0,∞)` from `W:(-∞,1)`; the larger domain needed here is not literally AHK’s declared domain.

## E6 — local deformation does not imply a global conclusion (confirmed error; stated results)

Published Lemma 6.6, pp.28–29, and the Q-factoriality clause of Corollary 6.7(1), p.29;
v2 Lemma 6.4 and Corollary 6.5, p.31.

Let `R=Z_p`, `p>5`, and delete only the closed special vertex from
`Spec R[x,y,z,w]/(xy−zw)`, obtaining `T`. This scheme is integral, flat, normal and excellent.
Its special fibre is the punctured threefold node, hence smooth, terminal, `S₃` and Q-factorial.
The remaining generic vertex `Z` is closed in `T` and disjoint from the special fibre.
The divisor `D=V(x,z)` is Cartier away from `Z`, does not contain the special fibre, and restricts to a
Cartier divisor there. These verify the hypotheses, including the codimension condition on `Z∩X`.

On the generic fibre the small resolution in `N×P¹` has equations `xt=zs`, `wt=ys` and charts

- `z=ux`, `y=uw`, with coordinates `(x,w,u)`;
- `x=vz`, `w=vy`, with coordinates `(z,y,v)` and `v=1/u`.

The strict transform of `D` has equations `x` and `z`. Since `z=ux`, its divisor line bundle restricts
to `O_{P¹}(−1)` on the exceptional fibre. There is no exceptional divisor. If a positive multiple `mD`
were Cartier at the node, its pullback would both equal this strict-transform multiple and restrict
trivially to that fibre. The degree `−m` contradiction proves that no such multiple exists.

The corrected deformation lemma concludes Q-Cartierness **near the special fibre**. This matches
[de Fernex–Hacon, arXiv v3](https://arxiv.org/pdf/0901.0389v3), Proposition 3.1 and its proof, p.5.
That source is over the complex numbers; this review uses its explicit local scope and the direct
counterexample, not a claim that its characteristic-zero statement alone proves the mixed-characteristic theorem.

Properness over the DVR repairs globalization, conditional on the local theorem. For a fixed divisor,
the complement of its Q-Cartier locus is closed. Its image is closed under a proper map and misses the
closed point of `Spec R`, so must be empty. Apply this separately to every divisor for Q-factoriality.
The lifts in Theorem 6.1 are projective and already have the required properness. The counterexample
specifically disproves the unrestricted divisor and Q-factorial conclusions; it is not evidence against
other clauses or against the projective lifting theorem.

## E7 — numerical surjectivity is not a prescribed line-bundle lift (confirmed gap; the proof)

Published Theorem 6.1(2b), proof p.33; v2 Theorem 1.3(2b), proof p.35.
The definition on published p.26 is `N¹=Pic⊗Q/≡`. Hence the stated hypothesis supplies rational numerical
representatives, not literal restrictions of prescribed Cartier divisors. The preceding proof of (2a)
on p.31 uses numerical equivalence correctly.

One can repair the effective perturbation as follows. Choose Q-Cartier representatives `ℋ,𝒜` with
`ℋ|_X≡H`, `𝒜|_X≡A`. Here `H` is the pullback of an ample divisor under a birational contraction,
so it is nef and big. Proper flat specialization gives nefness on the generic fibre and preserves the
positive top intersection, hence generic bigness. For large `m`, a divisible multiple `L` of `mℋ+𝒜`
has a nonzero generic section. The finite torsion-free `R`-module `H⁰(𝒳,L)` is nonzero; choose a primitive
section. The kernel of restriction to the special fibre is `πH⁰(𝒳,L)`, so this section is not identically
zero there. Its divisor, divided by the chosen multiple, gives an effective `𝒟` omitting `X` and satisfying
`𝒟|_X≡mH+A`. In particular its intersection with the specified ray is negative. With the standing
resolution hypothesis, a sufficiently small coefficient gives the desired plt/terminal perturbations.

This construction needs neither completeness nor `H²(X,O_X)=0`. It corrects the unsupported exact-lift
claim. Identifying the special fibre of the perturbed total-space step with the prescribed flop, and
preserving numerical surjectivity afterwards, still requires the corresponding boundary version of the
lifted-step argument. The review does not treat the construction alone as a proof of those further steps
or as a counterexample to Theorem 6.1(2b).

## E9 — smallness at codimension one (confirmed misprint; nothing)

Published Theorem 4.3, proof p.17; v2 Theorem 4.2, proof p.19.
Replace the claimed codimension-two isomorphism with isomorphism at codimension-one points, or off
subsets of codimension at least two. This is what a small birational map supplies and exactly what
Lemma 2.7, published p.7, requires. The corrected property suffices for the cited application.

## E10 and E11 — the resolution and degree zero in the trace formula (both confirmed misprints; nothing)

Published proof of Corollary 1.3, pp.19–20. These passages are absent from v2.
After comparing the point counts of `X` and its smooth proper resolution `Y`, the trace display counts
`Y(F_q)`. Its cohomology must therefore be `H^i_crys(Y/K)` (E10).

The slope bound is for `i>0` (E11). Degree zero has eigenvalue 1 and slope 0 and supplies the residual
contribution 1 modulo `q`. This restriction is explicit in [Esnault’s published Theorem 1.1](https://page.mi.fu-berlin.de/esnault/preprints/helene/62-chowgroup.pdf),
p.188. The adjacent trace formula uses the `q`-power Frobenius. For a simple check, `P¹` has point count
`1+q`: discarding the degree-zero contribution would change the congruence.

## Validation and limits

The errata checker, intake validation of the three deliverables, and whitespace check pass.
Scratch diagnostics verified both A₁ chart identities, the pullback coefficient `1/2`, 200 distinct
rational examples satisfying the `1/2`-lc inequalities, both node-resolution charts and their transition,
the difficulty-weight sample, and four degree-zero point-count examples. These are checks of the
explicit computations, not substitutes for the general classification or MMP arguments.

All original finding IDs are retained. No additional finding was validated. The paper extraction and
generated register were not edited. No Lean artifact is required or compiled; no formalization is claimed.
