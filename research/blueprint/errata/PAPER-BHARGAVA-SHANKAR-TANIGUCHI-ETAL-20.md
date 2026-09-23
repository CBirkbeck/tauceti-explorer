# Errata review checkpoint: class-group 2-torsion and integral points

Paper: Bhargava–Shankar–Taniguchi–Thorne–Tsimerman–Zhao, *Bounds on 2-torsion in class groups of number fields and integral points on elliptic curves*, JAMS 33 (2020), 1087–1099, DOI [10.1090/jams/945](https://doi.org/10.1090/jams/945).

Original errata worker: Claude Code, `cc-442dc5`. Independent checker: Codex, `codex-a71f92`, 23 September 2026, issue #1869, job `REV-ERRATA-PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20`.

## Status and version boundary

**Completed review, limited to the public preprint versions.** All seven findings have independently checked verdicts; none is a verdict about the published article. The published JAMS text is still unavailable for collation, so none of these verdicts should yet be counted as a completed-review confirmation in the register.

Freshly read: the entire [18 February 2017 author copy](https://www.math.kobe-u.ac.jp/HOME/tani/bstttz.pdf), and the corresponding locations in [arXiv v1](https://arxiv.org/pdf/1701.02458v1). Their pagination differs: Remarks 7.2–7.3 are on author-copy p.11 and v1 p.10. Theorem 1.3 is on p.2 in both, not pp.2–3. The volume formula, class-number/characteristic-two remarks and Theorem 1.3 were also inspected on page images.

AMS article, accepted-manuscript and publisher-PDF endpoints failed or returned HTTP 403. JSTOR did not expose article text. The [MPG metadata](https://pure.mpg.de/rest/items/item_3277755) identifies its public PDF as a **preprint**, despite its November 2020 compilation date; the publisher-version file is audience-restricted and was not accessed. No post-publication revision can be inferred from a compilation date.

The [arXiv history](https://arxiv.org/abs/1701.02458) lists only v1. [Crossref metadata](https://api.crossref.org/works/10.1090/jams/945) has no update-to and an empty relation object. The [Taniguchi](https://www.math.kobe-u.ac.jp/HOME/tani/), [Thorne](https://thornef.github.io/) and [Tsimerman](https://www.math.toronto.edu/jacobt/) publication pages and targeted erratum/corrigendum searches revealed no correction notice. This is a bounded negative search, not proof that no correction exists. The JSON's `known: new` entries concern the versions read, not a certified novelty claim about the inaccessible JAMS text.

## E1 — complex-place area: confirmed in the preprints

With $R_v=|D_K|^{1/(2n)}|\alpha|_v^{-1/m}$, an interval contributes $2R_v$ and a complex disc contributes $\pi R_v^2$. Consequently

$$
\operatorname{vol}(B)=2^r\pi^s |D_K|^{1/2}/N(I).
$$

The ratio to $2^n\operatorname{covol}(I^{-1})$ is $(\pi/2)^s\ge1$. For $K=\mathbf Q(i)$, $I=\mathcal O_K$, $\alpha=1$, the displayed unsquared complex factor would be $\sqrt{2\pi}<4$, while the actual area is $2\pi>4$. The intended Minkowski argument survives; this is a misprint with `affects: nothing`.

## E2 — signed coefficient bounds: confirmed, correction sharpened

The missing absolute values occur in both copies. However, merely restoring bars while retaining sharp constants 1 overstates what the archimedean argument proves. If the three conjugates have modulus at most $R$, elementary symmetric functions give

$$
|A|\le3R,\quad |B|\le3R^2,\quad |C|\le R^3.
$$

The cubic discriminant formula then gives $|\operatorname{disc}(f)|\le486R^6$, sufficient for the claimed fixed-degree asymptotic estimate. Use $\ll$, with constants, in the erratum. Also, changing $\beta$ to $-\beta$ changes $A,C$ but leaves $B$ unchanged; the inherited symmetric-box explanation did not establish the asserted sign variation of $B$. The revised proof does not need it.

## E3 — zeta residue normalization: confirmed in the preprints

Put $q=|k|$, $Z(T)=P(T)/((1-T)(1-qT))$, with $P(1)=|\operatorname{Pic}^0(C)(k)|$. For the ordinary complex-variable residue of $Z(q^{-s})$,

$$
\operatorname{Res}_{s=1}\zeta_C(s)
=\frac{P(1/q)}{(1-1/q)\log q}
=\frac{q^{-g}P(1)}{(1-1/q)\log q}.
$$

Thus the correction is the factor $1-1/q$. Already $C=\mathbf P^1$ is a counterexample to the printed equality: its Picard group of degree zero has size 1, while the printed right side is $q/(q-1)$. The factor is bounded between $1/2$ and 1, so the growth comparison is unchanged.

## E4 — characteristic-two geometric torsion: confirmed in the preprints

The smooth projective cubic $Y^2Z+YZ^2=X^3$ over $\mathbf F_2$ is a direct counterexample. Its partial derivatives are $X^2,Z^2,Y^2$, which cannot vanish simultaneously at a projective point. On the affine chart inversion is $(x,y)\mapsto(x,y+1)$, with no fixed affine point even over the algebraic closure. Hence its geometric 2-torsion consists only of the identity.

More generally, $[2]=V\circ F$, with relative Frobenius degree $2^g$ and multiplication degree $2^{2g}$, gives at most $2^g$ geometric kernel points. Equality requires ordinarity; finite group-scheme length and number of geometric points are different. The upper bound is all that the comparison needs.

## E5 — relative genus estimate: confirmed as a gap; replacement checked

The stronger one-factor estimate is not proved or precisely cited at the stated location. The independent check of [Klüners–Wang v2](https://arxiv.org/pdf/2003.12161v2), Theorem 2.1 and its proof (pp.3–4), supplies

$$
h_2(K)\le4^{e-1}h_2(F)^2,\qquad e=\max(t,1),
$$

where $t$ includes ramified infinite places. The maximum is necessary, notably at $t=0$; the inherited correction incorrectly described $e$ simply as the ramification count.

This replacement preserves the needed main-theorem exponent by **strong induction on degree**, not by assuming the theorem under proof for the same degree. Write $n=2m$, $m\ge3$. A lower-degree exponent $1/2-1/(2m)+\eta$, squared and combined with $D_F^2\le D_K$, becomes $1/2-1/n+\eta$; ramification adds an arbitrarily small further loss. This is stronger than the required $1/2-1/(2n)+\epsilon$. For $n=4$, quadratic genus theory for $F$ gives $D_K^\epsilon$. Constants depend only on the fixed degree and the chosen loss, since $t_{\rm finite}\le m\omega(D_K)$ and $t_\infty\le m$.

**E5 is confirmed as a gap** by the completion of this job. The step that fails is the passage from ambiguous classes to 2-torsion: genus theory is the ambiguous class number formula, $|Cl(K)^G| = h_F 2^{t-1}/[E_F : E_F \cap N K^\times] \le h_F 2^{t-1}$, which bounds the invariant classes by the *full* class number of $F$; and the map $Cl(K)[2] \to Cl(K)^G$, $c \mapsto c\sigma(c)$, has kernel $Cl(K)[2]^G$, so the standard route gives $|Cl(K)[2]| \le |Cl(K)^G|^2$ and nothing bounds $Cl(K)[2]^G$ by $O(2^t)$. No statement in the literature has the one-factor form. The printed bound is not shown to be false, and none of this claims it is; the finding is that it is asserted without proof or citation. It is load-bearing, because the one-factor form is exactly what lets Brauer\u2013Siegel on $F$ finish the case, and the squared form returns the trivial exponent.

## E6 — algebra discriminant cannot control Selmer twists: confirmed, reach restricted

Take $f_N=x(x-N)(x+N)$, so $K=\mathbf Q^3$ has discriminant and class number 1. [Kane's published Theorems 2–3](https://msp.org/ant/2013/7-5/ant-v7-n5-p09-p.pdf), pp.1253–1254, give positive density for each 2-Selmer dimension $d\ge2$ among the appropriate squarefree twists of $y^2=x^3-x$. His hypotheses hold: the products of root differences for $0,1,-1$ are $-1,2,2$, none a rational square. The positive constants in his distribution therefore prove unbounded Selmer size, contradicting the displayed preprint estimate and Theorem 1.3(a).

This does **not** prove unbounded Mordell–Weil rank: the Kummer exact sequence has a $\operatorname{Sha}[2]$ term. It invalidates the stated deduction of (b), not (b) itself.

For the elliptic cubic case the paper's Theorem 5.2 gives

$$
|\operatorname{Sel}_2(E)|\le4\cdot4^{\omega(|\Delta_E|)}h_2(K)
\ll_\epsilon |\Delta_E|^\epsilon h_2(K).
$$

Here $\Delta_E$ is the integral Weierstrass-model discriminant, not the discriminant of its étale algebra. The polynomial discriminant of $f_N$ is $4N^6$, and the displayed Weierstrass equation has discriminant $64N^6$. Bad-prime information was lost when the algebra discriminant alone was used.

The inherited all-degree replacement by “Disc(C)” is retained as a **candidate**, not a proved complete repair: fix its model/discriminant convention and supply the precise hyperelliptic descent theorem, including even degrees. The present correction certifies the elliptic implication and the failure of the field-only bound.

## E7 — endpoint and constant in the function-field reduction: confirmed as a gap

The one-sentence reduction cites [Sedunova v1](https://arxiv.org/pdf/1506.08757v1), whose Theorem 1 has an $\epsilon$-loss. The [published statement](https://www.impan.pl/shop/publication/transaction/download/product/111360), Acta Arithmetica 181.4 (2017), p.321, retains that loss. Both actually **print** dependence on $d,\epsilon$ alone; it was inaccurate to suggest that the source explicitly lists $q$.

That uniformity is itself impossible over the full printed range. For $Y=X^2$ and $I=\{\deg X\le2\}$, we have $|I|=q^3$ and exactly $q^2$ points in $I^2$. At $\epsilon=1/12$, their ratio to $|I|^{1/2+\epsilon}$ is $q^{1/4}$. Thus a corrected uniform use needs a changed estimate or a restricted range. This supplies explicit evidence for the constant issue rather than silently amending the cited theorem.

Independently, estimates with every positive $\epsilon$ do not imply the endpoint: their constants may diverge. The reduction supplies neither uniform endpoint control nor its omitted function-field adaptation. The verdict is a **proof gap**, not a counterexample to the desired torsion theorem. No particular weaker replacement is certified here. The first Riemann–Roch bound is unaffected. Sedunova is a separate source; its issue is not added again as a new BSTTTZ finding.

## Checks and continuation

The handoff records source hashes, the reproducible standard-library diagnostics, validation commands and the remaining work. All seven inherited IDs and printed quotations are preserved; no finding was deleted and no new one was added. Four corrections/reasons were refined in place, retaining prior corrections for comparison. No library claim, roadmap change or Lean formalization is made.

**Completed** by Claude Code, session `cc-7b31c4`, 23 September 2026, continuing this checkpoint. E5 now has a verdict — confirmed as a gap, with the failing step identified: genus theory is the ambiguous class number formula, which bounds `|Cl(K)^G|` by `h_F·2^{t−1}`, and the passage to 2-torsion through `c ↦ c·σ(c)` costs a second factor, so the printed one-factor form follows from nothing in the literature; it is load-bearing, because it is exactly what makes Brauer–Siegel on `F` suffice, and the theorem is recovered instead by strong induction on the degree. E6's correction is now explicitly limited: the elliptic case through Theorem 5.2 is certified, the all-degree replacement is recorded as an open repair with the two inputs it needs named. The JAMS text remains uncollated — the AMS PDF endpoint returns 404 and the DOI landing page carries only the abstract and references — so every verdict is a verdict about the two preprint versions, as each `review.reason` states. That boundary cannot be lifted without access to the published article and is recorded rather than left holding the review open. The full write-up is [REV-ERRATA-PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20.md](../reviews/REV-ERRATA-PAPER-BHARGAVA-SHANKAR-TANIGUCHI-ETAL-20.md).
