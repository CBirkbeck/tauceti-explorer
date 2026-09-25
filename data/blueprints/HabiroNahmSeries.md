# Nahm series, asymptotics and Habiro integrality

Blueprint for the roadmap `HabiroNahmSeries`, job `BP-HabiroNahmSeries` (issue #1011).
Packet: `research/blueprint/packets/HabiroNahmSeries.json`. Suggested Lean file:
`research/blueprint/suggested/HabiroNahmSeries.lean`. Handoff:
`research/blueprint/handoff/BP-HabiroNahmSeries.md`.

**Every layer in scope is decomposed from its sources.** The packet has 74 nodes
(10 definitions, 11 constructions, 23 theorems, 14 lemmas, 3 comparisons, 13 applications),
143 API items, 84 unit tests and 25 planets; it cites 46 declarations of the pinned libraries, records 10 gaps,
makes 24 requests to other roadmaps and makes 5 structural proposals. No layer is closed: closure means
Lean, and nothing here is claimed to be formalised.

Pinned baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

## Sources

Three sources, all downloaded and hashed in this session, and all read as LaTeX e-print source rather than as
extracted PDF text, so that every statement and every numbered environment is read exactly as the authors wrote
it. The numbering in the locators was recomputed from the theorem counters of each source and agrees with the
numbering the family's plan document records.

- **`cgz`** — Frank Calegari, Stavros Garoufalidis and Don Zagier, *Bloch groups, algebraic K-theory, units, and Nahm's conjecture*.
  arXiv:1712.04887v3, 6 April 2021, 43 pages; theorem numbering is by section, computed from the LaTeX source file qDilog.45.tex.
  <https://arxiv.org/abs/1712.04887v3>.
  PDF SHA-256 `024317c20a1d8b66234e608af46941093a675b6399ef480dfedd52a31dcd7bf5`.
- **`gswz`** — Stavros Garoufalidis, Peter Scholze, Campbell Wheeler and Don Zagier, *The Habiro ring of a number field*.
  arXiv:2412.04241v2, 27 August 2025, 73 pages; the main theorems are numbered 1 to 12 by a separate counter and the other environments by section.
  <https://arxiv.org/abs/2412.04241v2>.
  PDF SHA-256 `308d1dd1c42bd979e5d5c31d9d95215a1808f604031b49c0ce2a1eb767273de9`.
- **`gz`** — Stavros Garoufalidis and Don Zagier, with an appendix by Sander Zwegers, *Asymptotics of Nahm sums at roots of unity*.
  arXiv:1812.07690v1, 18 December 2018, 17 pages; published in the Ramanujan Journal. Numbering is by section.
  <https://arxiv.org/abs/1812.07690v1>.
  PDF SHA-256 `c8e810047d40b52ffc139553e8c9833853675f139070f3d1d4cf365267ae5b66`.

**What was read.** CGZ Section 1.3 and the whole of its Section 7; the whole of GSWZ Sections 1.6, 1.7, 2, 3
and 4; the whole of Garoufalidis–Zagier except its appendix. **What was not read**, and is recorded as a gap
with the next source action: CGZ Sections 2–6 (the construction of the unit and the Chern class, which is
`HabiroNumberFields:HB.1`'s job), GSWZ Sections 1.1–1.5 and 5 (the Habiro ring and its modules, which is
`HB.6` and `HB.7`'s job), the appendix of Garoufalidis–Zagier (the Kashaev–Mangazeev–Stroganov identity,
`HB.2`'s job), and four cited works that were not obtained: Zagier's dilogarithm survey, Vlasenko–Zwegers,
Hutchinson, and Kontsevich–Soibelman with Efimov.

Excerpts are verbatim quotations. Those over the protocol's 400-character limit are elided at a word boundary
and the elision is marked with an ellipsis; 26 of the 200-odd excerpts are elided this way.

## What the pinned libraries already have, and is therefore not planned

The reviewed library audit **AUDIT-14** covers all seven layers. It records `HB.5a` as *partly built* and the
other six as *not built*. Reading the pinned declaration index confirms it. There are no finite q-Pochhammer
symbols — q-factorials, q-binomials and the q-Pochhammer symbol are an explicit TODO in
`Mathlib/RingTheory/Polynomial/Pochhammer.lean`. There are no Nahm sums, no Bloch group, no five-term relation,
no Steinberg symbol, no K₃; no dilogarithm beyond `Li₁` on the unit disc and the single value ζ(2) = π²/6; no
cyclic or quantum dilogarithm; no Euler–Maclaurin formula with remainder (only the trapezoid-rule error bound),
no Poisson summation, no Laplace or saddle-point asymptotics; no multivariable formal logarithm and no
plethystic exponential; no Habiro ring, no Habiro-type module and no completion along the family `(q;q)_n`; no
p-adic dilogarithm and no p-adic regulator; and no meromorphic modular functions with Laurent expansions at
cusps.

What the libraries *do* have is cited and never re-planned:

- `eulerFunction` with `eulerFunction_eq_tprod` and the pentagonal expansion, `Multipliable` and `tprod` —
  the infinite Pochhammer symbol at `x = q` and the multipliability that makes it defined.
- `Polynomial.bernoulli` and `bernoulli` — the generating series that produces the all-orders expansion of the
  logarithm of the Pochhammer symbol at a root of unity.
- `StrictConvexOn` with `StrictConvexOn.eq_of_isMinOn`, `IsCompact.exists_isMinOn`, `Matrix.PosDef` and
  `Matrix.PosDef.det_pos` — every ingredient of the existence and uniqueness of the distinguished Nahm solution,
  and the positivity that makes the square root of the Hessian a positive real with no branch choice.
- `integral_gaussian` and Tau Ceti's `multivariateGaussianPDFReal` with its determinant normalisation — the
  constant that formal Gaussian integration must not double count.
- `Subgroup.IsArithmetic` with `Subgroup.isArithmetic_iff_finiteIndex`, `IsCusp`, `isCusp_SL2Z_iff`,
  `OnePoint.exists_mem_SL2`, `CuspOrbits`, `Subgroup.strictWidthInfty`, Tau Ceti's
  `cuspTranslationOrbitWidth`, `Function.Periodic.qParam` and `Function.Periodic.cuspFunction` — almost all of
  `HB.5a`, which is why that layer is the smallest in the packet.
- `Polynomial.cyclotomic`, `LaurentPolynomial`, `ArithmeticFunction.moebius`, `MvPowerSeries`,
  `PowerSeries.log` — the combinatorial carriers of admissibility and of its level-m variant.

The Bloch-group and polylogarithm inputs are **imported by node identifier** from the reviewed packets
`K3BlochGroups.json` and `Polylogarithms.json`: the pre-Bloch group, the five-term relation, the boundary into
the antisymmetric tensor quotient, the CGZ-convention Bloch group with its two-primary discrepancy against
Suslin's, Suslin's exact sequence, the five-term certificates, the classical polylogarithm, the Bloch–Wigner
function with its five-term relation, and the weight-two regulator. None of it is re-planned here; this is the
PROTOCOL §15 rule applied to the two roadmaps that already own this material.

## Layers

---

## HB.3. Nahm equations and their Bloch classes

**Coverage: source_decomposed.** 8 nodes.

Eight nodes. The two kinds of Nahm datum are kept apart as the stage text demands, with the analytic record carrying positive definiteness and the formal record carrying integrality and no coercion from the first to the second. The equations, the existence and uniqueness of the distinguished solution, the algebraicity of its coordinates and the number field it generates, the Bloch class with the explicit vanishing of its boundary by the symmetry of A, the general non-degenerate class of GSWZ Theorem 5 with its ring R[delta^{-1/2}], the embeddings and the regulator evaluations, and the equivalence between torsion and vanishing in the Bloch group of the algebraic numbers are all decomposed from CGZ Section 7.1 and GSWZ Section 1.7, both read in full. Neither source proves the existence and uniqueness of the distinguished solution, and the proof outline given here is the standard convexity argument, reconstructed in this packet: the potential is strictly concave with Hessian minus A-tilde, and coercivity plus the boundary behaviour of its gradient put the maximum in the interior. The gap recording Zagier's survey says what to check it against. The two-torsion warning of the stage text is met by importing the Bloch-group conventions of K3BlochGroups V.3 rather than choosing one.

**Planets (3):** *Nahm's equations*, *The distinguished Nahm solution*, *Nahm's Bloch class*.

### `nahm-data`

*definition* — **The two kinds of Nahm data**

**Statement.** Two separate bundled input records. An ANALYTIC Nahm datum is a triple (A, B, C) with A a symmetric positive definite r x r matrix over the rationals, B a rational column vector and C a rational number; a denominator of the datum is a positive integer d with d Q(n) integral for all integer vectors n, where Q(n) = (1/2) n^t A n + B n + C. A FORMAL Nahm datum is a single symmetric matrix A with integer entries and no positivity assumption. The analytic datum is the input of the convergent q-hypergeometric sum and of the root-of-unity asymptotics; the formal datum is the input of the multivariable admissible series of GSWZ. Neither record is a special case of the other: positivity is never imposed on a formal identity, and integrality is never imposed on a convergence theorem.

**Hypotheses and conventions.**

- A is symmetric; for an analytic datum A is positive definite with rational entries; for a formal datum A has integer entries.
- r = N is the rank, written r in the CGZ source and N in the GSWZ source; this packet writes N everywhere and records the source's letter in each locator.
- A strong denominator D of Q is a positive integer such that the value of Q(k) modulo 1 depends only on k modulo D; D = 2d works for any denominator d.

**Proof outline.**

1. Define the analytic record as a structure carrying A, B, C and the proof that A is symmetric and positive definite.
2. Define the formal record as a structure carrying an integral symmetric A.
3. Define denominator and strong denominator predicates on the analytic record and prove that 2d is a strong denominator whenever d is a denominator.
4. Define the coercion from an integral positive definite A to an analytic datum with B = 0 and C = 0, and prove that it is injective; do NOT define a coercion the other way.

**API.**

| name | role | statement |
| --- | --- | --- |
| `NahmDatum` | structure | The analytic Nahm datum: A symmetric positive definite over the rationals, B a rational vector, C a rational number. |
| `NahmDatum.posDef` | projection | The positive definiteness of A carried by an analytic datum. |
| `FormalNahmDatum` | structure | The formal Nahm datum: a symmetric integral matrix A. |
| `NahmDatum.IsDenominator` | data | The predicate that d is a denominator of the quadratic function of the datum. |
| `NahmDatum.IsStrongDenominator` | data | The predicate that D is a strong denominator. |
| `NahmDatum.isStrongDenominator_two_mul` | characterisation | Twice a denominator is a strong denominator. |
| `FormalNahmDatum.toNahmDatum` | coercion | A positive definite formal datum gives an analytic datum with B = 0 and C = 0. |
| `NahmDatum.ext` | extensionality | Two analytic data with the same A, B and C are equal. |

**Where and how it is used.**

- *HB.4 and HB.5.* The convergent sum, the radial asymptotics and the modularity implication all quantify over an analytic datum, and the positive definiteness is used for the existence of the distinguished solution and for the convergence of the Gaussian integral.
- *HB.8 and HB.9.* The admissible series F_A, the finite-support theorem and the module membership quantify over a formal datum; GSWZ Theorem 5 adds a non-degeneracy hypothesis on a chosen solution instead of positivity.
- *HB.10.* The worked examples are given by explicit matrices; the knot matrices of GSWZ Remark 4.2 are formal data that are not positive definite.

**Unit tests.**

- `rogers_ramanujan_is_analytic` — A = (2), B = 0, C = -1/60 satisfies the analytic predicate.
- `knot_matrix_not_posdef` — A = (1 1; 1 1) is symmetric and integral but not positive definite, so it is a formal and not an analytic datum.
- `half_integral_not_formal` — A = (3/2 1/2; 1/2 3/2) is an analytic datum whose entries are not integers.
- `strong_denominator_two` — For A = (2), B = 0, C = 0 the integer 1 is a denominator and 2 is a strong denominator.

**Acceptance.**

- The rank one records A = (2), B = 0, C = -1/60 and A = (2), B = 1, C = 11/60 are analytic data (the two Rogers-Ramanujan cases).
- A = (1 1; 1 1) is a formal datum and is not positive definite, so it is not an analytic datum; the 4_1 knot matrix of GSWZ Remark 4.2 is exactly this matrix.
- A = (3/2 1/2; 1/2 3/2) is an analytic datum with non-integral entries, so it is not a formal datum; it is the Vlasenko-Zwegers matrix of CGZ Section 7.1.

**Prerequisites.** `mathlib:Matrix.PosDef`, `mathlib:Matrix.PosDef.transpose`, `mathlib:MvPolynomial`

**Sources.**

- `cgz`, Section 7.1, after equation (eq.FABC), printed p. 35 — “where A=(a_ij) is a symmetric positive definite r x r matrix with rational entries, B in Q^r a column vector, and C in Q a scalar, and asked for which triples (A,B,C) the function f_{A,B,C}(tau)=f_{A,B,C}(e^{2 pi i tau}) is modular.” *(The analytic record, verbatim.)*
- `gswz`, Section 1.6, before equation (FAdef) — “A main theorem of [KS, Sec. 6.1, Thm. 9] (see also Efimov) is that q-hypergeometric Nahm sums ... defined from a symmetric, integral N x N matrix A, are always admissible series.” *(The formal record, verbatim; note the absence of any positivity hypothesis.)*
- `gz`, Section 3, before Theorem 3.1 — “We call a positive integer D a strong denominator of Q if the value of Q(k) modulo 1 for k in Z^N depends only on the residue class of k modulo D. (For instance, one can take D=2d where d is any common denominator of Q.)” *(The strong denominator, verbatim.)*

### `nahm-equations`

*definition* — **Nahm's equations** · planet **Nahm's equations**

**Statement.** For a symmetric matrix A = (a_ij) of size N, Nahm's equations are the system 1 - X_i = product over j of X_j^{a_ij}, for i = 1, ..., N, in the unknowns X = (X_1, ..., X_N). The system is written symbolically as 1 - X = X^A. Over the reals with X in (0,1)^N the powers are the real powers of positive reals and the equations make sense for rational A; over a field, and for integral A, they are a system of N polynomial equations after clearing denominators, and define a zero-dimensional scheme for generic A. The t-deformed system of GSWZ is a separate object and is defined in HB.8.

**Hypotheses and conventions.**

- A is symmetric of size N; the entries are rational for the real form of the equations and integral for the scheme form.
- For the real form the unknowns are constrained to the open cube (0,1)^N, where 1 - X_i > 0 and X_i > 0, so that every real power is defined and positive.
- For the scheme form over a field the equations are read as z_i^{a_ij} with a_ij integers, cleared of negative exponents by multiplying by the relevant monomial; the locus z_i = 0 and z_i = 1 is excluded.

**Proof outline.**

1. Define the real form as a predicate on a point of the open cube, using real powers.
2. Define the scheme form as the vanishing of an explicit finite family of Laurent polynomials, stated over any commutative ring in which the coordinates are units and 1 - z_i is a unit.
3. Prove that the two agree on a real point of the open cube when A is integral.
4. Prove that the system is invariant under no permutation in general, but is equivariant for a permutation that preserves A.

**API.**

| name | role | statement |
| --- | --- | --- |
| `NahmEq` | data | The predicate that a point of the open cube satisfies Nahm's equations for A. |
| `NahmEq.pos` | projection | Every coordinate of a solution is strictly between zero and one, by definition of the carrier. |
| `NahmEqScheme` | data | The ideal cutting out Nahm's equations for an integral A over a commutative ring. |
| `NahmEq.iff_scheme` | characterisation | For integral A a point of the open cube satisfies the real form exactly when it satisfies the scheme form. |
| `NahmEq.congr` | compatibility | The predicate depends only on A and the point. |
| `NahmEq.map` | functoriality | A ring homomorphism carries a solution of the scheme form to a solution of the scheme form. |

**Where and how it is used.**

- *The distinguished solution.* The existence and uniqueness theorem is stated for the real form on the open cube.
- *HB.3's Bloch class.* The Bloch class is attached to any solution of the scheme form over a number field, and the boundary computation uses only the equations and the symmetry of A.
- *HB.4.* The critical point of the asymptotic expansion is the distinguished solution, and the identity D_zeta(zeta^k theta) = ... uses the equations to rewrite the product of powers.

**Unit tests.**

- `golden_ratio` — For A = (2) the point X = (sqrt 5 - 1)/2 satisfies the equations and lies in (0,1).
- `eight_five_five_four` — For A = (8 5; 5 4) the numerical point (0.88483..., 0.78939...) satisfies the equations to the stated precision.
- `boundary_rejected` — The point X = 1 does not satisfy the equations for any A, because 1 - X_i = 0 while the right-hand side is 1.
- `symmetry_not_needed` — The predicate is defined for an arbitrary square A, and symmetry is used only later; the equations for a non-symmetric A are still a legitimate system.

**Acceptance.**

- For N = 1 and A = (2) the equation is 1 - X = X^2, whose solution in (0,1) is the golden-ratio number (sqrt 5 - 1)/2.
- For A = (8 5; 5 4) the equations are 1 - z_1 = z_1^8 z_2^5 and 1 - z_2 = z_1^5 z_2^4, which is GSWZ equation (z1z28554).
- A point with some X_i equal to 0 or 1 does not satisfy the equations, and the predicate rejects it.

**Prerequisites.** `HabiroNahmSeries:HB.3/nahm-data`, `mathlib:Real.rpow`, `mathlib:MvPolynomial`

**Sources.**

- `cgz`, Section 7.1, observation (i), equation (NahmEq), printed p. 35 — “Let X=(X_1,...,X_r) in C^r be a solution of Nahm's equations 1 - X_i = product_{j=1}^r X_j^{a_ij} (1 <= j <= r) (or symbolically 1-X=X^A), and let F be the field they generate over Q, which will typically be a number field since (NahmEq) is a system of r equations in r unknowns and generically defines a 0-dimensional variety.” *(The equations and the field they generate, verbatim.)*
- `gswz`, Section 1.7, equation (zjt=0) — “1-z_j = (-1)^{A_{j,j}} product_{i=1}^N z_j^{A_{i,j}}, j = 1,...,N.” *(GSWZ's sign convention for the same equations, with the (-1)^{A_jj} factor that the CGZ normalisation does not carry; the printed inner variable is z_j where the product must run over z_i, an erratum recorded in the gaps.)*

### `distinguished-solution`

*theorem* — **Existence and uniqueness of the distinguished solution** · planet **The distinguished Nahm solution**

**Statement.** Let A be a symmetric positive definite N x N matrix with rational entries. Then Nahm's equations have exactly one solution X^A = (X_1, ..., X_N) with 0 < X_i < 1 for every i. It is called the distinguished solution and is the unique critical point on the open cube of the strictly concave potential W(u) = -(1/2) u^t A u - sum_i Li_2(e^{u_i}) in the coordinates u_i = log X_i.

**Hypotheses and conventions.**

- A is symmetric positive definite with rational (or real) entries.
- The potential is taken in the logarithmic coordinates u = log X, so that the domain is the open orthant u in (-infinity, 0)^N.
- Li_2 denotes the real dilogarithm on [0,1], which is continuous at 1 with value pi^2/6; the identity used is (d/du) Li_2(e^u) = -log(1 - e^u).

**Proof outline.**

1. Change coordinates to u_i = log X_i, so that the cube (0,1)^N becomes the orthant u_i < 0 and Nahm's equations become log(1 - e^{u_i}) = (A u)_i.
2. Check that the gradient of W is grad W(u)_i = -(A u)_i + log(1 - e^{u_i}), so that the critical points of W on the orthant are exactly the solutions of Nahm's equations in the cube.
3. Compute the Hessian of W: it is -A - diag(e^{u}/(1 - e^{u})) = -(A + diag(X/(1-X))), which is negative definite because A is positive definite and each X_i/(1-X_i) is positive. Hence W is strictly concave on the orthant, and has at most one critical point.
4. Extend W continuously to the closed orthant u_i <= 0, using that Li_2 is continuous at 1. As the norm of u tends to infinity inside the orthant, u^t A u tends to infinity by positive definiteness while the dilogarithm term stays bounded, so W tends to minus infinity; hence W attains its maximum on the closed orthant.
5. Exclude the boundary: if u_i = 0 then the i-th partial derivative of W is -(A u)_i + log(1 - e^{u_i}), whose second term tends to minus infinity as u_i increases to 0, so W strictly increases as u_i decreases from 0. Therefore the maximum is attained in the open orthant and is a critical point.
6. Conclude existence and uniqueness, and record that the negative definite Hessian at the solution is exactly minus the matrix A-tilde = A + diag(z/(1-z)) that reappears as the Hessian of the asymptotic expansion in HB.4 and as the discriminant in HB.8.

**Acceptance.**

- For A = (2) the solution is the real root of X^2 + X - 1 in (0,1).
- For A = (8 5; 5 4) the solution is (0.88483..., 0.78939...), which is the real embedding of the quartic field of GSWZ Section 4.3.
- The uniqueness fails without positivity: for a formal datum the equations have several solutions and none is distinguished. GSWZ Section 4.3 lists eight solutions for A = (8 5; 5 4) in two Galois orbits, of which exactly one lies in the cube.

**Prerequisites.** `HabiroNahmSeries:HB.3/nahm-equations`, `mathlib:StrictConvexOn`, `mathlib:StrictConvexOn.eq_of_isMinOn`, `mathlib:IsCompact.exists_isMinOn`, `mathlib:Matrix.PosDef`, `mathlib:Real.log`, `Polylogarithms:P.1/classical-polylogarithm`

**Sources.**

- `cgz`, Section 7.1, observation (ii), printed p. 36 — “The first observation is that if A is a positive definite symmetric matrix, then there is a distinguished solution of the Nahm equations, namely the unique solution X^A=(X_1^A,...,X_r^A) with 0<X_i^A<1 for all i. We denote by xi_A the corresponding element [X^A] of the Bloch group.” *(The statement, verbatim; the source asserts it without proof, and the proof outline above is the standard convexity argument.)*
- `gz`, Section 2, before equation (eq.nahm) — “Fix a positive definite N x N matrix A with rational entries and let (z_1,...,z_N) denote the unique solution in (0,1)^N of Nahm's equation.” *(The same assertion, again used without proof.)*
- `gswz`, Section 4.3, after equation (z1eqn) — “Since A is positive definite equation (z1z28554) has a unique solution in (0,1)^2, given to a few decimals by (0.88483...,0.78939...), belonging to the real embedding of the quartic number field F of type (2,1) and discriminant -5^2 . 19 defined by (z1eqn).” *(The worked instance of the theorem.)*

### `algebraicity-and-the-nahm-field`

*theorem* — **Algebraicity of the solution and the field it generates**

**Statement.** Let A be symmetric with rational entries and let X be an isolated solution of Nahm's equations over the complex numbers with all coordinates different from 0 and 1. Then every coordinate of X is an algebraic number, and the field F = Q(X_1, ..., X_N) they generate is a number field. The solution is called non-degenerate when the Jacobian of the system at X is invertible, equivalently when the quantity delta = product_j z_j^{-A_jj} det(diag(1 - z) A + diag(z)) is non-zero; the distinguished solution of a positive definite A is always non-degenerate, because that determinant is the determinant of the positive definite matrix A + diag(z/(1-z)) times a non-zero monomial.

**Hypotheses and conventions.**

- A is symmetric with rational entries; the equations are cleared to a polynomial system over Q by choosing a common denominator.
- Isolated means that the point is a zero-dimensional component of the vanishing scheme; over a field of characteristic zero this is what makes the coordinates algebraic.
- The Jacobian is computed with respect to the logarithmic coordinates, where the system is linear in log z plus the term log(1 - z_i); this is the source of the matrix diag(1-z)A + diag(z).

**Proof outline.**

1. Clear denominators to obtain a polynomial system over the rationals whose solution set contains X.
2. Use that an isolated point of a zero-dimensional component of a variety defined over Q has algebraic coordinates: the coordinate ring of the component is a finite-dimensional Q-algebra, so every coordinate is integral over Q.
3. Deduce that F is a number field and compute its degree in examples by taking the minimal polynomial of one coordinate and expressing the others as polynomials in it, as GSWZ do in Section 4.3.
4. Differentiate the logarithmic form of the equations to obtain the Jacobian matrix diag(1 - z) A + diag(z) up to the monomial factor, and identify its determinant with the discriminant delta.
5. For a positive definite A and the distinguished solution, factor the Jacobian as diag(1-z) times (A + diag(z/(1-z))) and conclude non-degeneracy from positive definiteness.

**Acceptance.**

- For A = (3) and the formal equation 1 - z = -t z^3 specialised at t = 1, the solution generates the cubic field of discriminant -23, with z^3 - z + 1 = 0; this is GSWZ Example 4.1.
- For A = (8 5; 5 4) the distinguished solution generates the quartic field with z_1^4 + z_1^3 + 3 z_1^2 - 3 z_1 - 1 = 0, and z_2 is the displayed polynomial in z_1 divided by 5.
- A degenerate solution has delta = 0 and is excluded by the hypotheses of GSWZ Theorem 5; the theorem is false as stated without it, since the ring R[delta^{-1/2}] is then the zero ring.

**Prerequisites.** `HabiroNahmSeries:HB.3/nahm-equations`, `HabiroNahmSeries:HB.3/distinguished-solution`, `mathlib:IsAlgebraic`, `mathlib:NumberField`, `mathlib:Matrix.det`, `mathlib:Matrix.PosDef.det_pos`, `mathlib:MvPolynomial.aeval`

**Sources.**

- `gswz`, Section 1.7, equations (Sdef) and (taulambda) — “delta(t) := product_{j=1}^N z_j(t)^{-A_jj} det(diag(1-z(t)) A + diag(z(t))) is the discriminant of the t-deformed Nahm equations, so that (after inverting 2) S is an etale Z[t]-algebra.” *(The discriminant and the etale statement; specialising t = 1 gives the form used here.)*
- `gswz`, Section 1.7, before Theorem 5 — “Below, we will fix an irreducible component of the equations (zjt=0) that is non-degenerate, i.e., an isolated solution z with delta not equal to 0.” *(The definition of non-degeneracy, verbatim.)*
- `gz`, Section 2, equation (eq.Atilde) — “A-tilde = A + diag(z/(1-z)) where diag(z/(1-z)) denotes the diagonal matrix with diagonal elements z_i/(1-z_i).” *(The same matrix, in the asymptotic normalisation of HB.4.)*

### `bloch-class-of-a-solution`

*construction* — **The Bloch class of a solution and the vanishing of its boundary** · planet **Nahm's Bloch class**

**Statement.** Let A be symmetric and let X be a solution of Nahm's equations over a field F with all coordinates different from 0 and 1. The element [X] = [X_1] + ... + [X_N] of the free abelian group on F lies in the kernel of the boundary map d(x) = (x) wedge (1 - x), because d([X]) = sum_i (X_i) wedge (1 - X_i) = sum_{i,j} a_ij (X_i) wedge (X_j) = 0 by the symmetry of A. It therefore defines an element xi_A of the Bloch group of F. When A is integral the computation is an identity in the antisymmetric square as it stands; when A is only rational the identity holds after tensoring with the rationals, and the integral class is obtained by clearing denominators, that is by taking the class of the multiple by a common denominator of A.

**Hypotheses and conventions.**

- A is symmetric; F is a field containing the coordinates; every X_i is different from 0 and 1.
- The target of the boundary is the antisymmetric tensor quotient of the multiplicative group in the convention of K3BlochGroups V.3, not the exterior square; the two differ by two-torsion and the difference is exactly what the stage text warns about.
- The convention for the Bloch group is the one of CGZ, in which 3[0] = 0, [X] + [1/X] = 0 and [X] + [1 - X] = [0]; this is a quotient of Suslin's group by a subgroup of exponent two.

**Proof outline.**

1. Form the element [X] of the free abelian group on the projective line over F.
2. Compute the boundary: for each i use Nahm's equation to replace 1 - X_i by the product of the X_j^{a_ij}, so that (X_i) wedge (1 - X_i) = sum_j a_ij (X_i) wedge (X_j).
3. Sum over i and pair the terms (i,j) and (j,i): their coefficients are a_ij and a_ji, which are equal, and the two wedge products are negatives of each other in the antisymmetric quotient, so the sum vanishes.
4. Record the caveat: in the true exterior square the identity x wedge x = 0 holds by definition, but in the antisymmetric quotient only x wedge y + y wedge x = 0 is imposed, so the diagonal terms a_ii (X_i) wedge (X_i) contribute two-torsion; K3BlochGroups V.3 quantifies the discrepancy, and the integral class must be taken in the convention fixed there.
5. For rational A, multiply by a common denominator of A before running the computation, and record that the resulting class is well defined only up to the torsion that the clearing introduces.
6. Identify the class with the element xi_A of the Bloch group of F, and record its image under the maps of Polylogarithms P.2 for later use.

**API.**

| name | role | statement |
| --- | --- | --- |
| `nahmBlochClass` | data | The element xi_A of the Bloch group of F attached to a solution X. |
| `nahmBlochClass_boundary` | characterisation | The boundary of the underlying element of the free abelian group vanishes. |
| `nahmBlochClass_eq_sum` | simp | The class is the sum over i of the classes of the coordinates. |
| `nahmBlochClass_map` | functoriality | A field embedding carries the class of a solution to the class of its image. |
| `nahmBlochClass_clearDenominators` | compatibility | For rational A, the class of the denominator-cleared solution and its relation to the rational class. |
| `nahmBlochClass_congr` | compatibility | Two solutions with the same coordinates give the same class. |

**Where and how it is used.**

- *HB.5, Nahm's conjecture.* The conclusion of the proved implication is that this class is torsion; its statement is impossible without the construction.
- *HB.9, module membership.* GSWZ Theorem 5 indexes the Habiro module by exactly this class, for an arbitrary non-degenerate solution.
- *HB.4, the asymptotics.* The leading exponential of the radial expansion is the Rogers dilogarithm of this class, and the unit attached to it by HB.1 is what appears in the expansion.

**Unit tests.**

- `boundary_vanishes` — For A = (2) and X the solution of 1 - X = X^2, the boundary of [X] vanishes in the antisymmetric quotient.
- `torsion_example` — For A = (8 5; 5 4) the class is annihilated by 60 in the Bloch group of the quartic field of discriminant -5^2 . 19.
- `nontorsion_example` — For the second Galois orbit of the same equations, over the quartic field defined by z_1^4 - z_1^3 + 3 z_1^2 - 3 z_1 + 1, the class is not torsion.
- `diagonal_two_torsion` — For a diagonal A with odd diagonal entry the diagonal contribution is a two-torsion element, which is zero in the exterior square and need not be zero in the antisymmetric quotient.

**Acceptance.**

- For the distinguished solution of a positive definite A the class is the element xi_A of CGZ and of Nahm's conjecture.
- For A = (8 5; 5 4) the class xi = [z_1] + [z_2] in the Bloch group of the quartic field of discriminant -5^2 . 19 is 60-torsion (GSWZ Section 4.3); for the other quartic field it is not torsion.
- For the diagonal matrix A with a single entry a_11 odd, the diagonal term contributes a non-trivial two-torsion class in the antisymmetric quotient, so the boundary vanishes only in the exterior square; this is the non-example the stage text asks to keep visible.

**Prerequisites.** `HabiroNahmSeries:HB.3/nahm-equations`, `K3BlochGroups:V.3/cgz-bloch-group`, `K3BlochGroups:V.3/bloch-boundary`, `K3BlochGroups:V.3/antisymmetric-tensor-quotient`, `K3BlochGroups:V.3/exterior-kernel-discrepancy`, `K3BlochGroups:V.3/cgz-convention-comparison`, `HabiroNumberFields:HB.1`

**Sources.**

- `cgz`, Section 7.1, observation (i), printed p. 35 — “Then the element [X]=[X_1]+...[X_r] of Z[F] belongs to the kernel of the map (defd), because d([X]) = sum_i (X_i) wedge (1-X_i) = sum_{i,j} a_ij (X_i) wedge (X_j) = 0 by virtue of the symmetry of A. (This calculation makes sense as it stands if A has integer entries; if the entries are only rational, we have to tensor everything with Q.)” *(The whole construction and the rational caveat, verbatim.)*
- `gswz`, Section 1.7, after equation (zjt=0) — “Such data gives rise to an element xi = sum_{j=1}^N [z_j] in B(K) in the Bloch group of the number field K generated by z.” *(The same class for an arbitrary non-degenerate solution, which is the setting of GSWZ Theorem 5.)*

### `general-nondegenerate-class`

*construction* — **The class of an arbitrary non-degenerate solution, and the ring it generates**

**Statement.** For a formal Nahm datum A and a non-degenerate solution z of the (undeformed) equations 1 - z_j = (-1)^{A_jj} product_i z_i^{A_ij}, set K = Q(z), R = O_K[1/Delta] with Delta divisible by 2, by 3 and by the discriminant of K, and let xi = sum_j [z_j] in B(K). Adjoin a square root of the discriminant delta to form R[delta^{-1/2}], and record the Galois involution sending the square root to its negative. This is the data that indexes the Habiro module of HB.9; the sign (-1)^{A_jj} of the GSWZ normalisation differs from the CGZ normalisation of the analytic Nahm equations, and the two must not be conflated.

**Hypotheses and conventions.**

- A is a formal Nahm datum; z is a non-degenerate solution, so delta is non-zero.
- Delta is divisible by 2 and 3 and by the discriminant of K; GSWZ fix this convention in Remark 1.8 and consider only primes p > 3.
- The square root of delta is adjoined as a formal square root; the ring R[delta^{-1/2}] carries the involution fixing R and negating the square root.

**Proof outline.**

1. Take the field K generated by the coordinates of z and its ring of integers, and invert Delta.
2. Form the class xi in the Bloch group of K by the construction of the previous node, with the GSWZ sign convention.
3. Adjoin the inverse square root of delta and record the involution; note that Theorem 5's element lies in the minus-one eigenspace of that involution, as GSWZ Remark 1.9 states.
4. Record which statements are sensitive to the sign convention: the equations themselves, the definition of delta, and the specialisation t = 1 of the t-deformed equations of HB.8.

**API.**

| name | role | statement |
| --- | --- | --- |
| `nahmRing` | data | The ring R = O_K[1/Delta] attached to a non-degenerate solution. |
| `nahmRing.deltaInv` | data | The ring R[delta^{-1/2}] with a chosen square root of the discriminant inverted. |
| `nahmRing.involution` | structure | The involution of R[delta^{-1/2}] over R negating the square root. |
| `nahmRing.involution_sq` | simp | The involution is an involution. |
| `nahmRing.class` | data | The Bloch class xi attached to the solution. |
| `nahmRing.delta_isUnit` | characterisation | The discriminant is a unit in R[delta^{-1/2}]. |

**Where and how it is used.**

- *HB.9.* GSWZ Theorem 5 states that the series lies in the module over exactly this ring, restricted to roots of unity of order prime to Delta.
- *HB.10.* The worked examples compute this ring: Z[z, 1/23] for the cubic field and O_F[1/(5 . 19)] for the quartic one.
- *HB.8.* The specialisation t = 1 of the ring S of the t-deformed equations is this ring.

**Unit tests.**

- `cubic_ring` — For A = (3) the ring is Z[z, 1/23] with z^3 - z + 1 = 0.
- `quartic_ring` — For A = (8 5; 5 4) the ring is O_F[1/(5 . 19)] for the quartic field F of discriminant -5^2 . 19.
- `involution_nontrivial` — The involution is not the identity when delta is not a square in R.
- `delta_unit` — The discriminant is invertible in R[delta^{-1/2}], and its square root squares to it.

**Acceptance.**

- For A = (3) the equation 1 - z = -z^3 gives the cubic field of discriminant -23 and R = Z[z, 1/23].
- For A = (8 5; 5 4) the two Galois orbits give two quartic fields, of which one carries a torsion class and the other does not.
- Dropping the square root of delta changes the ring and the theorem: GSWZ state Theorem 5 in R[delta^{-1/2}] and say that omitting the localisation changes the statement.

**Prerequisites.** `HabiroNahmSeries:HB.3/bloch-class-of-a-solution`, `HabiroNahmSeries:HB.3/algebraicity-and-the-nahm-field`, `mathlib:NumberField`, `HabiroNumberFields:HB.6`

**Sources.**

- `gswz`, Section 1.7, the t = 1 specialisation — “R[delta^{-1/2}] = Z[z^{pm 1}, delta^{-1/2}]/(1 - z - (-1)^A z^A), where we again use shorthand in the definition of R[delta^{-1/2}] with z=(z_1,...,z_N) and the relations given by the Nahm equations.” *(The ring, verbatim.)*
- `gswz`, Remark 1.8 — “Therefore, throughout the paper we will only consider primes p>3 and always assume that 2,3 | Delta unless otherwise stated.” *(The convention on Delta and on the excluded primes.)*
- `gswz`, Remark 1.9 — “Moreover, under the action of the Galois automorphism of R[delta^{-1/2}] sending sqrt(delta) to -sqrt(delta), the element Phi_{A,z} lives in the -1-eigenspace.” *(The eigenspace statement that the involution is needed for.)*

### `embeddings-and-regulator-evaluations`

*construction* — **Embeddings of the solution field and the regulator evaluations**

**Statement.** For the field F generated by a solution, construct all complex embeddings and the evaluations D(sigma X) = sum_i D(sigma X_i) of the Bloch-Wigner dilogarithm, and the real number L(xi_A) = sum_i L(X_i) built from the Rogers dilogarithm in the CGZ normalisation, where L(x) = pi^2/6 - Li_2(x) - (1/2) log(x) log(1 - x) for 0 < x < 1, extended to the projective line over the reals with values in the reals modulo (pi^2/2) Z. The class xi_A is torsion exactly when D(sigma X) vanishes for every embedding sigma, and in that case L(xi_A) is a rational multiple of pi^2.

**Hypotheses and conventions.**

- F is the number field generated by a solution; sigma runs over the complex embeddings of F.
- The Rogers dilogarithm is taken in the CGZ normalisation, which is pi^2/6 minus the standard one; with that normalisation L descends to the Bloch group with values in the reals modulo (pi^2/2) Z rather than modulo (pi^2/6) Z.
- The Bloch-Wigner function and its five-term relation are imported from Polylogarithms P.1 and are not redefined.

**Proof outline.**

1. Enumerate the complex embeddings of F, which Mathlib provides together with the count.
2. Evaluate the imported Bloch-Wigner function at the images of the coordinates and sum; this descends to the Bloch group by the imported five-term relation.
3. Define the Rogers dilogarithm by the three-case formula of CGZ and prove that it is continuous at 0, 1 and infinity with the stated values, so that it descends to the Bloch group of the reals in the CGZ convention.
4. Prove that the class is torsion exactly when all the Bloch-Wigner evaluations vanish, using that the regulator map of Polylogarithms P.2 has finite kernel (Borel).
5. Prove that if the class is torsion then L(xi_A) lies in the rational multiples of pi^2, since L kills torsion modulo the stated lattice.

**API.**

| name | role | statement |
| --- | --- | --- |
| `rogersDilog` | data | The Rogers dilogarithm in the CGZ normalisation, as a function on the projective line over the reals with values modulo (pi^2/2) Z. |
| `rogersDilog_five_term` | characterisation | The Rogers dilogarithm kills the five-term relations, so it descends to the Bloch group of the reals. |
| `rogersDilog_zero_one_infty` | simp | Its values at 0, 1 and infinity are pi^2/6, 0 and -pi^2/6. |
| `nahmRegulator` | data | The tuple of Bloch-Wigner evaluations of the class at all complex embeddings. |
| `nahmRegulator_eq_zero_iff_torsion` | characterisation | The class is torsion exactly when every evaluation vanishes. |
| `rogersDilog_rational_of_torsion` | compatibility | If the class is torsion then L of the class is a rational multiple of pi squared. |

**Where and how it is used.**

- *HB.5.* The proof of Nahm's conjecture uses the rationality of L(xi_A)/(4 pi^2) under modularity, and concludes with the torsion criterion.
- *HB.4.* The exponential prefactor of the radial asymptotics is exp(L(xi_A)/(n h)), so the regulator is what controls the growth.
- *HB.10.* The worked examples certify torsion by exhibiting the vanishing of the evaluations, or by a five-term certificate of K3BlochGroups V.6.

**Unit tests.**

- `rogers_at_golden` — For A = (2) the value of L at the distinguished solution is pi^2/10 modulo the lattice.
- `rogers_normalisation` — L(1) = 0 and L(0) = pi^2/6 in this normalisation, which differs from the standard one by pi^2/6.
- `regulator_vanishes_torsion` — For A = (8 5; 5 4) every Bloch-Wigner evaluation of the class vanishes.
- `regulator_nonzero_nontorsion` — For the second quartic orbit of the same matrix some evaluation is non-zero.

**Acceptance.**

- For A = (2), L(xi_A) = pi^2/10 up to the lattice, which is the Rogers dilogarithm identity behind the first Rogers-Ramanujan case.
- For A = (8 5; 5 4) the class is torsion, so all Bloch-Wigner evaluations vanish and L(xi)/pi^2 is rational; GSWZ record the value pi^2/15 in the exponential prefactor of the asymptotics.
- For the second quartic field of the same matrix the evaluations do not all vanish, so the class is not torsion.

**Prerequisites.** `HabiroNahmSeries:HB.3/bloch-class-of-a-solution`, `Polylogarithms:P.1/bloch-wigner-dilogarithm`, `Polylogarithms:P.1/bloch-wigner-five-term`, `Polylogarithms:P.2/bloch-wigner-descent`, `Polylogarithms:P.2/weight-two-regulator`, `mathlib:NumberField.Embeddings.card`, `mathlib:NumberField.InfinitePlace`

**Sources.**

- `cgz`, Section 7.1, equation (normalization), printed p. 37 — “L(x) = pi^2/6 - Li_2(x) - (1/2) log(x) log(1-x) if 0<x<1; -L(1/x) if x>1; pi^2/6 - L(1-x) if x<0, and extended by continuity to a function P^1(R) -> R/(pi^2/2)Z by sending the three points 0, 1 and infinity to pi^2/6, 0, and -pi^2/6.” *(The Rogers dilogarithm in the normalisation this packet uses, verbatim.)*
- `cgz`, Section 7.1, observation (i), printed p. 36 — “This is equivalent to the vanishing of the numbers D(sigma X)=sum D(sigma X_i) for all embeddings sigma: F -> C, where D(x) is the Bloch-Wigner dilogarithm function, and this condition can be either tested numerically to any precision or else verified rigorously by writing a multiple of [X] as a linear combination of 5-term relations.” *(The torsion criterion and the two ways of certifying it, verbatim.)*
- `cgz`, Section 7.1, observation (ii), printed p. 36 — “Then since X^A is real, we obtain a further characteristic property when this element is torsion, namely that the real number L(xi_A)=sum L(X_i), where L(x) is the Rogers dilogarithm function as defined below, is a rational multiple of pi^2.” *(The rationality consequence, verbatim.)*

### `torsion-in-the-algebraic-closure`

*lemma* — **Torsion, and what vanishing in the Bloch group of the algebraic numbers means**

**Statement.** The Bloch groups of the algebraic numbers and of the complex numbers are uniquely divisible, hence torsion free. Therefore the image of xi_A in the Bloch group of the algebraic numbers vanishes exactly when xi_A is torsion in the Bloch group of the field F it is defined over. The two formulations of Nahm's conjecture, vanishing in the Bloch group of the algebraic numbers and torsion in the Bloch group of the smallest field containing the coordinates, are equivalent for this reason and for no other.

**Hypotheses and conventions.**

- F is the number field generated by the solution; the map is the one induced by an embedding into the algebraic numbers.
- Unique divisibility of the Bloch group of an algebraically closed field of characteristic zero is Suslin's theorem, imported and not proved here.
- The Bloch group of F is finitely generated, which is what makes torsion a meaningful finiteness statement.

**Proof outline.**

1. Import the unique divisibility of the Bloch group of an algebraically closed field of characteristic zero.
2. Deduce that it is torsion free, so that the image of a torsion element vanishes.
3. Conversely, if the image vanishes, conclude that the element is torsion because the kernel of the map from the Bloch group of a number field to that of the algebraic numbers is torsion.
4. Record that the equivalence is a statement about the target, not about the class: the class itself is in general a non-zero torsion element of the Bloch group of F.

**Acceptance.**

- For A = (8 5; 5 4) the class is 60-torsion in the Bloch group of the quartic field and zero in the Bloch group of the algebraic numbers.
- The statement is false for a general field: a torsion element of the Bloch group of a finite field need not vanish, since that group is finite cyclic.
- The equivalence is not an equality: the order of the torsion element is data that vanishing in the algebraic numbers destroys, and the order is exactly what HB.9's corollary uses.

**Prerequisites.** `HabiroNahmSeries:HB.3/bloch-class-of-a-solution`, `K3BlochGroups:V.5/k3-number-field`, `K3BlochGroups:V.5/bloch-group-finite-field`, `K3BlochGroups:V.4/suslin-exact-sequence`

**Sources.**

- `cgz`, Section 1.3, after Theorem 1.8, printed p. 6 — “We remark that the vanishing condition can be (and often is) stated by saying that xi_A is a torsion element in the Bloch group of the smallest real (but in general not totally real) number field containing all the X_i, but when we take the image of this Bloch group in the Bloch group of Qbar or C, then the torsion vanishes, because B(Qbar) and B(C) are uniquely divisible and so in ...” *(The equivalence and its reason, verbatim.)*

---

## HB.4. Root-of-unity asymptotics

**Coverage: source_decomposed.** 13 nodes.

Thirteen nodes, decomposed from Garoufalidis-Zagier in full and from CGZ Section 7.1 and 7.2 in full. The q-Pochhammer symbols with their functional identities and their two logarithmic expansions; the analytic Nahm sum with its Puiseux and its upper half-plane forms and the q^C normalisation pinned; the cyclic quantum dilogarithm imported from HabiroNumberFields HB.2 with exactly the three identities this layer uses; the radial asymptotics of the Pochhammer symbol with the Bernoulli-polynomial remainder; the summand asymptotics with the critical point, the constant Lambda and the Hessian A-tilde; the formal Gaussian integration operator; the congruence splitting and the quadratic Gauss sum; Theorem 3.1 in full, with the twelfth root of unity, the algebraic constant and the field statement; the Poisson-summation estimates with the two competing ranges of the window parameter, which is where the uniform remainder bounds for each finite truncation live; the simplified form of CGZ Theorem 7.1; the unit corollary under its own non-vanishing hypothesis, with the identically-zero case separated as the stage text demands; the Andrews-Gordon acceptance computation; and the coefficient-against-radial asymptotics of Garoufalidis-Zagier Theorem 6.1, which is not a stage target but is a theorem about Nahm sums in a source read here and is planned so that a later layer does not confuse the two asymptotics.

**Planets (5):** *q-Pochhammer symbol*, *Nahm sum*, *Pochhammer asymptotics at roots of unity*, *Formal Gaussian integration*, *Radial asymptotics of Nahm sums*.

### `q-pochhammer-symbols`

*definition* — **The q-Pochhammer symbols, finite and infinite** · planet **q-Pochhammer symbol**

**Statement.** Define the finite symbol (x;q)_n = product_{j=0}^{n-1} (1 - q^j x) for a natural number n, the quantum factorial (q;q)_n = (1-q)(1-q^2)...(1-q^n), and the infinite symbol (x;q)_infinity = product_{n >= 0} (1 - q^n x), which is multipliable and holomorphic in x for |q| < 1. Record the shift identity (x;q)_{n+1} = (1 - q^n x)(x;q)_n, the identity (1-x)(qx;q)_infinity = (x;q)_infinity, the inversion (x;q^{-1})_infinity = 1/(qx;q)_infinity, the reflection (q^{-1};q^{-1})_n = (-1)^n q^{-n(n+1)/2} (q;q)_n, and the two logarithmic expansions log (x;q)_infinity = -sum_{l>=1} x^l/(l(1-q^l)) and its Bernoulli form at q = 1 + x.

**Hypotheses and conventions.**

- |q| < 1 for the analytic statements; the formal statements hold in the ring of formal power series in x over the rational function field in q.
- The empty product convention gives (x;q)_0 = 1.
- The infinite symbol at q = zeta_m + x is expanded through the identity log (t;q)_infinity = sum_{j=0}^{m-1} log (q^j t; q^m)_infinity, which is what reduces the root-of-unity expansion to the expansion at 1.

**Proof outline.**

1. Define the finite symbol by recursion on n and prove the shift identity by definition.
2. Define the infinite symbol as the product over n of (1 - q^n x) and prove that it is multipliable for |q| < 1 from the summability of the norms.
3. Prove the two displayed functional identities by comparing the factors, or by the uniqueness of the solution of the first-order q-difference equation they satisfy.
4. Prove the logarithmic expansion by expanding each log(1 - q^n x) and summing the geometric series in n.
5. Prove the Bernoulli form by grouping the summation index by residue class modulo m and using the generating series of the Bernoulli polynomials.

**API.**

| name | role | statement |
| --- | --- | --- |
| `qPochhammer` | data | The finite symbol (x;q)_n. |
| `qPochhammer_succ` | simp | The shift identity (x;q)_{n+1} = (1 - q^n x) (x;q)_n. |
| `qFactorial` | data | The quantum factorial (q;q)_n. |
| `qPochhammerInf` | data | The infinite symbol (x;q)_infinity for \|q\| < 1. |
| `qPochhammerInf_multipliable` | characterisation | The defining product is multipliable for \|q\| < 1. |
| `qPochhammerInf_shift` | characterisation | The identity (1-x)(qx;q)_infinity = (x;q)_infinity. |
| `qPochhammerInf_inv` | characterisation | The inversion identity relating q and q inverse. |
| `log_qPochhammerInf` | characterisation | The logarithmic expansion with the 1/(l(1-q^l)) coefficients. |
| `qPochhammerInf_eq_eulerFunction` | compatibility | At x = q the infinite symbol is the pinned Euler function. |

**Where and how it is used.**

- *The Nahm sum.* The denominator of the summand is a product of quantum factorials, so every statement about the sum is a statement about these symbols.
- *HB.4 asymptotics.* The whole asymptotic analysis is carried out by writing 1/(q)_n as a ratio of infinite symbols and expanding the logarithm of the infinite symbol at a root of unity.
- *HB.8.* The product expansion of an admissible series is a product of infinite symbols raised to integer powers, and the ratio and symmetrisation identities are proved from the two functional identities above.

**Unit tests.**

- `pochhammer_zero` — (x;q)_0 = 1 and (q;q)_0 = 1.
- `pochhammer_one` — (x;q)_1 = 1 - x.
- `euler_function_agreement` — For |q| < 1 the value of (q;q)_infinity agrees with the pinned Euler function.
- `reflection` — (q^{-1};q^{-1})_n = (-1)^n q^{-n(n+1)/2} (q;q)_n, which is the identity behind F_A(t,q) = F_{I-A}(t,q^{-1}).

**Acceptance.**

- (x;q)_1 = 1 - x and (q;q)_1 = 1 - q.
- (q;q)_infinity is the Euler function, which Mathlib has as a multipliable holomorphic function on the unit disc; the finite symbols are the explicit TODO of Mathlib's Pochhammer file.
- At q = 1 the finite symbol (q;q)_n vanishes, so the Nahm sum's summand is defined only for |q| < 1 and its root-of-unity behaviour is an asymptotic statement, never an evaluation.

**Prerequisites.** `mathlib:Multipliable`, `mathlib:tprod`, `mathlib:eulerFunction`, `mathlib:PowerSeries`, `mathlib:Polynomial.bernoulli`, `HabiroCyclotomicCompletions:HC.1`

**Sources.**

- `gswz`, Section 1.6, after equation (defgamma) — “Here, as usual (x;q)_n = product_{j=0}^{n-1}(1-q^j x) and (x;q)_infinity^{-1} = sum_{k=0}^{infinity} x^k/(q;q)_k.” *(The two definitions and Euler identity, verbatim.)*
- `gswz`, Section 2.1, equations (logpoc) and (logpoc2) — “log (t;q)_infinity = -sum_{l >= 1} t^l/(l(1-q^l)) and log (t;q)_infinity = sum_{k >= 0} (B_k/k!) Li_{2-k}(t) log(1+x)^{k-1}” *(The two complementary expansions of the logarithm, verbatim.)*
- `gswz`, Section 2.2, the two elementary identities — “(1-t)(q t;q)_infinity = (t;q)_infinity, (t;q^{-1})_infinity = 1/(q t;q)_infinity” *(The shift and inversion identities, verbatim.)*

### `analytic-nahm-sum`

*definition* — **The analytic Nahm sum and its normalisation** · planet **Nahm sum**

**Statement.** For an analytic Nahm datum (A,B,C) put f_{A,B,C}(q) = q^C sum over n in the non-negative integer vectors of q^{(1/2) n^t A n + B n} divided by (q)_{n_1} ... (q)_{n_N}. This is a formal Puiseux series with integer coefficients in q^{1/d} for any denominator d of the datum, and it converges in the punctured unit disc, defining a holomorphic function of tau in the upper half-plane through f(tau) = f_{A,B,C}(e^{2 pi i tau}) with the convention (e^{2 pi i tau})^lambda = e^{2 pi i tau lambda}. The factor q^C is part of the data and is never absorbed silently: it shifts the leading exponent of every expansion and, in the modular cases, it is exactly what makes the function modular.

**Hypotheses and conventions.**

- (A,B,C) is an analytic Nahm datum; d is a denominator and the Puiseux variable is q^{1/d}.
- Convergence is for 0 < |q| < 1 and follows from the positive definiteness of A, which makes the exponent grow quadratically while the denominators grow at a controlled rate.
- The value at a root of unity is not defined: the denominators vanish. Every statement at a root of unity in this layer is an asymptotic statement along the radial approach q = zeta e^{-h/n} with h decreasing to 0.

**Proof outline.**

1. Define the summand as a function of a non-negative integer vector with values in the Puiseux series ring.
2. Prove that the family is summable coefficientwise, because for each power of q only finitely many n contribute, which uses the positive definiteness of A.
3. Prove absolute convergence for 0 < |q| < 1 and holomorphy in the disc.
4. Define the upper half-plane form and fix the branch convention for the fractional powers.
5. Record the special case C = 0 and the identity f_{A,B,C}(tau) = e(C tau) f_{A,B,0}(tau), which is why the asymptotic theorems may assume C = 0.

**API.**

| name | role | statement |
| --- | --- | --- |
| `nahmSum` | data | The Puiseux series f_{A,B,C}(q). |
| `nahmSum_coeff` | projection | The coefficient of a given rational power of q, a finite sum over the lattice points on a quadric. |
| `nahmSum_summable` | characterisation | Coefficientwise summability, from the positive definiteness of A. |
| `nahmSum_analytic` | characterisation | Absolute convergence and holomorphy on the punctured unit disc. |
| `nahmSum_shift_C` | simp | f_{A,B,C} = e(C tau) f_{A,B,0} in the upper half-plane form. |
| `nahmSum_upperHalfPlane` | coercion | The holomorphic function on the upper half-plane attached to the series. |
| `nahmSum_congr` | compatibility | The series depends only on the datum. |

**Where and how it is used.**

- *HB.4 asymptotics.* Theorem 7.1 of CGZ is an asymptotic statement about exactly this function along a radial approach to a root of unity.
- *HB.5.* Modularity is a property of the upper half-plane form, so the convention fixing the fractional powers is part of the statement of the theorem.
- *HB.8 and HB.10.* The specialisation t = (-1)^{diag A} q^{b} of the multivariable series F_A is a Nahm sum, which is how the formal theory bears on the analytic one.

**Unit tests.**

- `rogers_ramanujan_series` — For A = (2), B = 0, C = 0 the first coefficients of the sum are 1, 1, 1, 2, 2, 3, ... after the Rogers-Ramanujan product expansion.
- `empty_sum` — The coefficient of q^C is 1, coming from n = 0.
- `convergence_radius` — The series converges for every q with 0 < |q| < 1 and diverges at |q| = 1 when N is at least one.
- `C_shift` — Changing C by an integer multiplies the series by an integral power of q and changes no coefficient pattern.

**Acceptance.**

- For A = (2), B = 0, C = -1/60 the sum is q^{-1/60} times the first Rogers-Ramanujan series, which is modular.
- Only seven rank one triples are modular: (2,0,-1/60), (2,1,11/60), (1,0,-1/48), (1, plus or minus 1/2, 1/24), (1/2,0,-1/40) and (1/2,1/2,1/40); CGZ record that this list is complete.
- The sum with A = 0 is not defined by this construction: without positive definiteness the coefficientwise summability fails, which is why the formal series of HB.8 is a different object.

**Prerequisites.** `HabiroNahmSeries:HB.3/nahm-data`, `HabiroNahmSeries:HB.4/q-pochhammer-symbols`, `mathlib:PowerSeries`, `mathlib:UpperHalfPlane`

**Sources.**

- `cgz`, Section 7.1, equation (eq.FABC), printed p. 35 — “f_{A,B,C}(q) := q^C f_{A,B}(q) := q^C sum_{m in Z_{>=0}^r} q^{(1/2) m^t A m + Bm}/((q)_{m_1} ... (q)_{m_r}), where A=(a_ij) is a symmetric positive definite r x r matrix with rational entries.” *(The definition, verbatim.)*
- `gz`, Section 1, equation (eq.FABC) — “F_Q(q) = F_{A,B,C}(q) = sum_{n in Z_{>=0}^N} q^{Q(n)}/((q)_{n_1} ... (q)_{n_N}) in Z((q^{1/d})), where Q(n) = (1/2) n^t A n + Bn + C and d is any denominator of Q.” *(The Puiseux series statement with the denominator, verbatim.)*
- `cgz`, Section 7.1, the list of modular cases, printed p. 35 — “apart from the two Rogers-Ramanujan cases (A,B,C)=(2,0,-1/60) or (2,1,11/60), only five further cases (1,0,-1/48), (1,+-1/2,1/24), (1/2,0,-1/40) and (1/2,1/2,1/40) were known for which f_{A,B,C} is modular, and it was later proved that these are in fact the only ones.” *(The complete rank one list, verbatim.)*

### `cyclic-dilogarithm-interface`

*comparison* — **The cyclic quantum dilogarithm, imported, and the identities this layer uses**

**Statement.** The cyclic quantum dilogarithm D_zeta(x) = product_{t=1}^{m-1} (1 - zeta^t x)^t, for zeta a primitive m-th root of unity, and its m-th root taken with the principal branch of each factor, are owned by HabiroNumberFields HB.2 and are imported here. This layer uses exactly three of its properties: the quasi-periodicity D_zeta(zeta x)/D_zeta(x) = (1-x)^m/(1-x^m); the evaluation D_zeta(zeta^k theta) = (theta;zeta)_k^m D_zeta(theta)/(1-z)^k when theta^m = z, which uses Nahm's equation to rewrite the denominator; and the value D_zeta(1) with D_zeta(1)^{24m} = m^{12m}. Nothing about the cyclic dilogarithm is proved here.

**Hypotheses and conventions.**

- zeta is a primitive m-th root of unity; x is in the open unit disc for the branch statement.
- The m-th root is defined by taking the principal branch of the logarithm of each factor, which is what makes the evaluation identity an identity and not an identity up to a root of unity.
- The third property is proved in HB.8 directly from the product of the (1 - zeta^l), not through the multiplier system of the Dedekind eta function as GSWZ do.

**Proof outline.**

1. Import the definition and the two identities from HabiroNumberFields HB.2 by name.
2. Record the branch convention explicitly and check it against the use in the asymptotic formula, where D_zeta(theta)^{-1/m} appears as a factor.
3. State the evaluation identity in the form in which the asymptotics uses it, and record that its proof uses Nahm's equation, so it is not a formal identity about the cyclic dilogarithm alone.

**Acceptance.**

- For m = 1 the cyclic dilogarithm is the empty product 1 and every identity is trivial.
- For m = 2 and zeta = -1 the function is 1 + x, and the quasi-periodicity reads (1-x)/(1+x) = (1-x)^2/(1-x^2), which holds.
- The identity D_zeta(zeta^k theta) = (theta;zeta)_k^m D_zeta(theta)/(1-z)^k is false without the Nahm equation in its second form: the rewriting of (1-z)^k as a product of powers of the theta_j uses it.

**Prerequisites.** `HabiroNahmSeries:HB.3/nahm-equations`, `HabiroNumberFields:HB.2`, `HabiroNumberFields:HB.1`

**Sources.**

- `gz`, Section 2, equation (eq.Dmz) — “the cyclic quantum dilogarithm function D_zeta(x) = product_{t=1}^{m-1}(1-zeta^t x)^t in Q(zeta)[x] where zeta is a primitive mth root of unity. The function that we will actually use is D_zeta(x)^{1/m} when |x|<1, where the mth root is defined by using the principal part of the logarithm of each factor.” *(The definition and the branch convention, verbatim.)*
- `gz`, Section 4.2, equation (eq.Dzz) — “D_zeta(zeta^{k_i} theta_i) = (theta_i;zeta)_{k_i}^m D_zeta(theta_i)/(1-z_i)^{k_i} = (theta_i;zeta)_{k_i}^m D_zeta(theta_i)/product_j theta_j^{m (A k)_i}, where the first equality follows from the fact that D_zeta(zeta x)/D_zeta(x)=(1-x)^m/(1-x^m) and the second equality follows from the fact that z is a solution to Nahm's equation.” *(The two identities and the explicit dependence on Nahm equation, verbatim.)*

### `pochhammer-radial-asymptotics`

*theorem* — **Radial asymptotics of the infinite Pochhammer symbol at a root of unity** · planet **Pochhammer asymptotics at roots of unity**

**Statement.** Let |w| < 1, let q = zeta e^{-epsilon/m} with zeta a primitive m-th root of unity, let nu be a complex number with nu epsilon tending to 0, and set z = w^m. Then log (q w e^{-nu epsilon/m}; q)_infinity equals minus Li_2(z)/(m epsilon) minus (nu/m - 1/2) log(1 - z) minus (epsilon nu^2/(2m)) z/(1-z) minus (1/m) log D_zeta(w) minus log(1 - w) plus a remainder psi_{w,zeta}(nu,epsilon) which has an explicit all-orders asymptotic expansion in the Bernoulli polynomials and the polylogarithms of non-positive index, namely minus the sum over r at least 2 and t from 1 to m of (B_r(1 - (t+nu)/m) - delta_{r,2} nu^2/m^2) Li_{2-r}(zeta^t w) epsilon^{r-1}/r!, in which the coefficient of nu^n is O(epsilon^{2n/3}).

**Hypotheses and conventions.**

- |w| < 1 and zeta is a primitive m-th root of unity; epsilon decreases to 0 through positive reals.
- The asymptotic expansion is in the strong sense: for every K the difference between the function and the truncation at order K is O(epsilon^K) as epsilon decreases to 0.
- The polylogarithms of non-positive index are rational functions with poles only at 1, so every coefficient is an algebraic function of w and zeta.

**Proof outline.**

1. Expand minus the logarithm as a double sum over k at least 1 and n at least 1 of (q^n w e^{-nu epsilon/m})^k/k.
2. Sum over n in the residue class t modulo m to obtain, for each k, the factor e^{-k(nu+t)epsilon/m}/(1 - e^{-k epsilon}).
3. Expand that factor by the generating series of the Bernoulli polynomials, which gives the sum over r of B_r(1 - (t+nu)/m) (k epsilon)^{r-1}/r!.
4. Exchange the order of summation and recognise the sum over k as Li_{2-r}(zeta^t w).
5. Extract the terms r = 0, 1, 2 using the distribution property sum_{t=1}^m Li_r(zeta^t w) = m^{1-r} Li_r(w^m): the r = 0 term gives Li_2(z)/(m epsilon), the r = 1 term gives the logarithmic terms and the cyclic dilogarithm, and the r = 2 term gives the epsilon nu^2 term.
6. Bound the remaining terms and check the stated order in nu, which is what makes the expansion usable after the substitution nu = x epsilon^{-1/2}.

**Acceptance.**

- For m = 1 and nu = 0 the statement reduces to the classical expansion of log (q w; q)_infinity at q tending to 1 with the Bernoulli numbers.
- Taking w = q and nu = 0 recovers the modular asymptotics of the Euler function, log 1/(q;q)_infinity = pi^2/(6 epsilon) - (1/2) log(2 pi/epsilon) - epsilon/24 + O(epsilon^K).
- The expansion is not valid without the coprimality and branch conventions: if the m-th root of D_zeta is taken with another branch, the constant term changes by a root of unity.

**Prerequisites.** `HabiroNahmSeries:HB.4/q-pochhammer-symbols`, `HabiroNahmSeries:HB.4/cyclic-dilogarithm-interface`, `Polylogarithms:P.1/classical-polylogarithm`, `Polylogarithms:P.1/distribution-and-inversion`, `mathlib:Polynomial.bernoulli`, `mathlib:bernoulli`

**Sources.**

- `gz`, Lemma 2.1 and equations (eq.l1), (eq.psi) — “log(q w e^{-nu epsilon/m};q)_infinity = -(1/(m epsilon)) Li_2(z) - (nu/m - 1/2) log(1-z) - (epsilon nu^2/(2m)) z/(1-z) - (1/m) log D_zeta(w) - log(1-w) + psi_{w,zeta}(nu,epsilon), where z = w^m.” *(The statement, verbatim.)*
- `gz`, Proof of Lemma 2.1, Section 4.1 — “sum by n = t mod m; definition of B_r(x); definition of Li_{2-r}(z); using the distribution property sum_{t=1}^m Li_r(zeta^t w) = m^{1-r} Li_r(w^m) for the polylogarithm, we see that the r=0 and r=1 terms are given by ...” *(The four steps of the proof, verbatim from the displayed derivation.)*
- `gz`, Section 4.2, equation (eq.etae) — “log(1/(q;q)_infinity) = pi^2/(6 epsilon) - (1/2) log(2 pi/epsilon) - epsilon/24 + O(epsilon^K) for all K > 0” *(The Euler-function case, used as the denominator of the summand.)*

### `summand-asymptotics`

*theorem* — **The summand of a Nahm sum near its peak**

**Statement.** Fix a residue class k modulo m and write n_i = epsilon^{-1} log(1/z_i) + epsilon^{-1/2} x_i, where z is the distinguished solution and q = zeta e^{-epsilon/m}. Then the summand of the Nahm sum, normalised by e^{-epsilon Q(n)/m}, equals (epsilon/(2 pi))^{N/2} e^{Lambda/(m epsilon)} times an explicit product of algebraic prefactors in theta_i = z_i^{1/m}, the cyclic dilogarithms D_zeta(theta_i)^{-1/m} and the finite symbols (theta_i;zeta)_{k_i}, times the Gaussian factor e^{-x^t A-tilde x/m} and the remainder terms psi. Here Lambda = -sum_j L(z_j) is built from the Rogers dilogarithm and A-tilde = A + diag(z/(1-z)) is the Hessian; A-tilde is positive definite, so the Gaussian factor is genuinely peaked, and the peak is at the distinguished solution.

**Hypotheses and conventions.**

- A is an analytic Nahm datum; z is its distinguished solution; zeta is a primitive m-th root of unity with m coprime to a denominator of the datum.
- The expansion of the psi factors is valid when |x_i| is at most epsilon^{lambda - 1/6} for some positive lambda, and then the coefficient of x^n is O(epsilon^n).
- The Rogers dilogarithm here is normalised by L(z) = Li_2(z) + (1/2) log z log(1-z) - pi^2/6, which is the Garoufalidis-Zagier normalisation and differs from the CGZ one used in HB.3 by a constant; both are recorded and neither is silently substituted for the other.

**Proof outline.**

1. Write 1/(q)_{n_i} as the ratio of (q w_i e^{-nu_i epsilon/m}; q)_infinity to (q;q)_infinity with w_i = zeta^{k_i} theta_i and nu_i = x_i epsilon^{-1/2}.
2. Expand the numerator by the Pochhammer asymptotics and the denominator by the Euler function expansion.
3. Expand the quadratic exponent Q(n) at n = epsilon^{-1} log(1/z) + epsilon^{-1/2} x, obtaining a term in epsilon^{-2}, a term in epsilon^{-3/2}, a Gaussian term and lower-order terms.
4. Use Nahm's equation to cancel the epsilon^{-3/2} term against the linear term of the Pochhammer expansion; this is exactly where the equations enter, and it is why no other point is a peak.
5. Convert the resulting epsilon^{-1} term into the Rogers dilogarithm, obtaining Lambda.
6. Collect the algebraic prefactors using the evaluation identity for D_zeta(zeta^k theta), and identify the quadratic form of the Gaussian as A-tilde.

**Acceptance.**

- For N = 1 and m = 1 the statement is the classical saddle-point form of the summand at q tending to 1.
- The Hessian A-tilde is positive definite because A is and z lies in the cube, so its determinant is positive and its square root is a positive real; this is what makes c(Q) well defined without a branch choice.
- Without Nahm's equation the epsilon^{-3/2} term does not cancel and there is no peak: the assertion is about the distinguished solution and not about an arbitrary point.

**Prerequisites.** `HabiroNahmSeries:HB.3/distinguished-solution`, `HabiroNahmSeries:HB.3/embeddings-and-regulator-evaluations`, `HabiroNahmSeries:HB.4/pochhammer-radial-asymptotics`, `HabiroNahmSeries:HB.4/analytic-nahm-sum`, `mathlib:Matrix.PosDef.det_pos`

**Sources.**

- `gz`, Proposition 2.2, equation (eq.p1) — “Consider natural numbers n_i satisfying n_i = k_i mod m and write n_i = (1/epsilon) log(1/z_i) + (1/sqrt(epsilon)) x_i where z is the distinguished solution of Nahm's equation and q = zeta e^{-epsilon/m}. Then e^{-epsilon Q(n)/m}/prod_i (q)_{n_i} = (epsilon/(2 pi))^{N/2} e^{Lambda/(m epsilon)} prod_i theta_i^{B_i}(1-z_i)^{1/2-1/m} prod_i D_zeta(theta_i)^{-1/m} prod_i ...” *(The statement, verbatim.)*
- `gz`, Section 4.2, the expansion of the quadratic form — “Using the fact that z satisfies Nahm's equation, it follows that -(epsilon/m) Q(n) = -(1/(2 m epsilon)) log z . log(1-z) + (1/m) B^t log z - (epsilon/m) C - (1/(2m)) x^t A x + (1/(m sqrt(epsilon))) x^t log(1-z) + (1/m) sqrt(epsilon) B^t x. The first term in the first line of the above equation converts the dilogarithm by the Rogers dilogarithm. The middle term of the last line cancels ...” *(The cancellation that makes the distinguished solution the peak, verbatim.)*
- `gz`, Section 2, equations (alph) and (eq.rogers) — “Lambda = -sum_{j=1}^N L(z), where L(z) is the Rogers dilogarithm function (shifted by a constant to make L(1)=0), defined for 0<z<1 by L(z) = Li_2(z) + (1/2) log(z) log(1-z) - pi^2/6.” *(The Garoufalidis-Zagier normalisation of the Rogers dilogarithm, which differs from the CGZ one of HB.3.)*

### `formal-gaussian-integration`

*construction* — **Formal Gaussian integration** · planet **Formal Gaussian integration**

**Statement.** For a symmetric invertible matrix Lambda over a Q-algebra, define the formal Gaussian integral of a function f(x,h) in the completed ring of series in x with h-adic control by applying the exponential of (h/2) times the inverse-Lambda Laplacian and evaluating at x = 0. Equivalently, in one variable, the integral of sum_j c_j x^j is sum_l (2l-1)!! c_{2l} Lambda^{-l}. This formally computes the ratio of the Gaussian integral of f against the Gaussian weight to the Gaussian integral of the weight, and is defined without any measure theory. The construction is meaningful exactly when the valuations of the coefficients tend to infinity, which is why the source's domain is the ring of series in w, w^3 h^{-1} and h.

**Hypotheses and conventions.**

- Lambda is symmetric and invertible over a Q-algebra; the rationals must be present because of the factorials.
- The argument f lies in the completed ring R[[w, w^3 h^{-1}, h]], the exact domain in which the odd-order terms are controlled; the cube in w^3 h^{-1} is what makes the expansion converge formally.
- This is the formal, all-orders object; no analytic Gaussian integral is claimed, and the comparison with the analytic integral is an asymptotic statement proved separately in the Poisson-summation node.

**Proof outline.**

1. Define the Laplacian with respect to Lambda as the second-order differential operator with coefficients the entries of the inverse of Lambda.
2. Define the bracket as the exponential of (h/2) times that operator, applied termwise and evaluated at w = 0; check that the exponential is well defined on the stated domain because each coefficient receives only finitely many contributions.
3. Prove the one-variable closed formula with the double factorials, by computing the action on a monomial.
4. Prove linearity, the behaviour under a linear change of variables, and the translation rule used in the source's periodicity argument, namely that translating w by h changes the integrand in the way that the shift of the congruence class does.
5. Record the normalisation against the analytic integral, so that the prefactor (2 pi)^{-N/2} det^{-1/2} of the Gaussian density never appears twice.

**API.**

| name | role | statement |
| --- | --- | --- |
| `formalGaussian` | data | The bracket attached to a symmetric invertible Lambda. |
| `formalGaussian_const` | simp | The bracket of a constant is that constant. |
| `formalGaussian_odd` | simp | The bracket of an odd monomial vanishes. |
| `formalGaussian_sq` | characterisation | The bracket of a quadratic monomial is the corresponding entry of h times the inverse of Lambda. |
| `formalGaussian_linear` | functoriality | Linearity in the integrand. |
| `formalGaussian_changeOfVariables` | compatibility | Behaviour under an invertible linear change of the integration variable. |
| `formalGaussian_translate` | compatibility | The translation rule used for the periodicity of the congruence-class terms. |

**Where and how it is used.**

- *HB.4, the asymptotic expansion.* The all-orders coefficient of the radial expansion is a formal Gaussian integral of the psi-remainders against the Hessian A-tilde.
- *HB.8, the FGI collection.* The collection Phi^FGI_{A,m} of GSWZ is defined as a sum of formal Gaussian integrals, one for each congruence class.
- *HB.9.* The Frobenius congruence is proved term by term on these integrals, so their algebraic nature, not their analytic meaning, is what is used.

**Unit tests.**

- `second_moment` — With Lambda = 1 in one variable the bracket of x^2 is h.
- `fourth_moment` — With Lambda = 1 the bracket of x^4 is 3 h^2.
- `odd_vanishes` — The bracket of x^3 is zero.
- `diagonal_factorises` — For a diagonal Lambda the bracket of a product of functions of separate variables is the product of the brackets.

**Acceptance.**

- In one variable with Lambda = 1 the integral of x^2 is 1 and of x^4 is 3, matching the moments of the standard Gaussian.
- The integral of an odd monomial is zero.
- The integral of a constant is the constant, so the bracket is a normalised expectation and not a measure.

**Prerequisites.** `mathlib:PowerSeries`, `mathlib:MvPowerSeries`, `mathlib:Matrix.det`, `mathlib:integral_gaussian`, `tauceti:TauCeti.multivariateGaussianPDFReal`

**Sources.**

- `gswz`, Section 2.5, equation (eq:bracket) — “For a Q-algebra R, formal Gaussian integration is a map from R[[w,w^3 h^{-1},h]] to R[[h]], defined by applying exp((h/2) sum_{i,j} (Lambda^{-1})_{i,j} d/dw_i d/dw_j) to f(w,h) and evaluating at w = 0.” *(The definition, verbatim.)*
- `gz`, Section 3, equations (eq.FGI) and (eq.FGI2) — “I_A[f] = (integral e^{-x^t A x/2} f(x) dx)/(integral e^{-x^t A x/2} dx) ~ sum_n (1/(2^n n!)) (Delta_A^n f)(0). In particular, for 1x1 matrices A, I_A[sum_j c_j x^j] ~ sum_l (2l-1)!! c_{2l} A^{-l}.” *(The same operator with the analytic motivation and the one-variable closed formula, verbatim.)*

### `gauss-sum-and-congruence-splitting`

*construction* — **Splitting by congruence classes, and the quadratic Gauss sum**

**Statement.** Split the Nahm sum over the residue classes of n modulo m and modulo a strong denominator D, and define the quadratic Gauss sum G(Q,alpha) = D^{-N} sum over k in (Z/DZ)^N of e(alpha-bar Q(k)), where alpha is a rational with denominator m prime to D and alpha-bar is its reduction modulo D. The sum is independent of the choice of strong denominator. The asymptotic expansion of the whole Nahm sum is the Gauss sum times the sum over the m-classes of zeta^{Q(k)-bar} times the class asymptotics, which is where the arithmetic of the exponent and the analysis of the summand separate.

**Hypotheses and conventions.**

- Q is the quadratic function of an analytic Nahm datum; D is a strong denominator; alpha is a rational number whose denominator m is prime to D; zeta = e(alpha).
- The splitting is over the pairs of residue classes modulo m and modulo D, and the Chinese remainder theorem is what makes the two independent.
- The claim that the D-classes all have the same asymptotics is a theorem, proved by Poisson summation, and not a definition.

**Proof outline.**

1. Define the Gauss sum by the displayed finite sum and prove that it does not depend on the strong denominator, by summing over a refinement.
2. Split the series into the sums over pairs of congruence classes, and record the value of zeta^{Q(n)} on such a class through the Chinese remainder theorem.
3. Record the resulting identity for the upper half-plane form of the Nahm sum, which expresses it as the Gauss sum times the sum over m-classes.
4. Prove elementary properties of the Gauss sum: its absolute value, its behaviour under alpha to alpha + 1, and its value at alpha = 0.

**API.**

| name | role | statement |
| --- | --- | --- |
| `gaussSum` | data | The normalised quadratic Gauss sum G(Q,alpha). |
| `gaussSum_independent` | characterisation | Independence of the choice of strong denominator. |
| `gaussSum_int` | simp | The value at an integral alpha is 1. |
| `gaussSum_add_one` | compatibility | The behaviour under alpha to alpha + 1. |
| `nahmSum_split` | characterisation | The decomposition of the Nahm sum into its congruence-class pieces. |
| `nahmSum_split_finite` | projection | The splitting is a finite sum of series. |

**Where and how it is used.**

- *HB.4, the asymptotic expansion.* The constant of the expansion is the product of the Gauss sum, the twelfth root of unity chi^N and the algebraic factor c(Q).
- *HB.8.* The same congruence splitting, at the level of formal series, defines the level m admissible series F_{A,m,k} and the FGI collection.
- *HB.10.* The quadratic Gauss sum example of GSWZ Section 4.7 is a check of the convention fixed here.

**Unit tests.**

- `trivial_alpha` — G(Q,0) = 1.
- `rank_one_quadratic` — For A = (2), B = 0 and alpha = 1/5 the Gauss sum is the normalised quadratic Gauss sum modulo 5.
- `independence` — Computing G(Q,alpha) with D and with 2D gives the same value.
- `splitting_recovers` — Summing the congruence pieces over all classes recovers the original series coefficientwise.

**Acceptance.**

- For N = 1, A = (2), B = 0 and alpha = 1/m with m odd, the Gauss sum is the classical normalised quadratic Gauss sum.
- At alpha an integer the Gauss sum is 1.
- The Gauss sum is not the whole constant of the asymptotics: the factor chi^N/m^{N/2} and c(Q) are separate, and conflating them is the classic source of sign errors.

**Prerequisites.** `HabiroNahmSeries:HB.3/nahm-data`, `HabiroNahmSeries:HB.4/analytic-nahm-sum`, `mathlib:Polynomial.cyclotomic`

**Sources.**

- `gz`, Section 3, equation (eq.Gab) — “G(Q,alpha) = (1/D^N) sum_{k in (Z/DZ)^N} e(alpha-bar Q(k)), where alpha in Q is prime to D and alpha-bar denotes the reduction of alpha modulo D and D is any strong denominator of Q. The sum on the right is clearly independent of the choice of D.” *(The definition and the independence, verbatim.)*
- `gz`, Section 4.3, equations (eq.Fcong) and (eq.fQzcomb) — “F_Q(q) = sum_{k in (Z/mZ)^N, k' in (Z/DZ)^N} F_Q^{[k,k']}(q) ... f_Q(alpha + i epsilon/(2 pi m)) ~ G(Q,alpha) sum_{k in (Z/mZ)^N} zeta^{Q(k)-bar} f_{Q,zeta}^{[k]}(epsilon).” *(The splitting and the resulting formula, verbatim.)*

### `radial-asymptotic-expansion`

*theorem* — **The all-orders radial asymptotic expansion of a Nahm sum at a root of unity** · planet **Radial asymptotics of Nahm sums**

**Statement.** Let Q(x) = (1/2) x^t A x + B x come from an analytic Nahm datum, let alpha be a rational whose denominator m is odd and prime to a denominator of Q, and let zeta = e(alpha). Then, as epsilon decreases to 0, e^{-Lambda/(m epsilon)} f_Q(alpha + i epsilon/(2 pi m)) is asymptotic to chi^N m^{-N/2} c(Q) G(Q,alpha) S_{Q,zeta}(epsilon), where chi = e(binom(m-1,2) alpha/12) is a twelfth root of zeta, c(Q) = det(A-tilde)^{-1/2} product_i theta_i^{B_i} (1-z_i)^{1/2 - 1/m}, G(Q,alpha) is the Gauss sum, and S_{Q,zeta}(epsilon) is the explicit power series given by the cyclic dilogarithms, the finite symbols and the formal Gaussian integrals of the congruence classes. Moreover S_{Q,zeta}(epsilon)^m lies in F_m[[epsilon]], where F is generated by the d-th roots of the coordinates of the distinguished solution and F_m adjoins zeta.

**Hypotheses and conventions.**

- The denominator m of alpha is odd and prime to a denominator of Q; without the coprimality the exponent q^{Q(n)} is not single-valued and the statement is empty.
- The asymptotic relation is in the strong sense of the source: for every K the difference from the truncation is O(epsilon^K).
- The square root of det(A-tilde) is the positive one, which exists because A-tilde is positive definite; no branch choice is needed.
- Only the case C = 0 is stated, because f_{A,B,C}(tau) = e(C tau) f_{A,B,0}(tau) reduces the general case to it.

**Proof outline.**

1. Split the sum by congruence classes and pull out the Gauss sum.
2. For each m-class, substitute the summand asymptotics, so that the class sum becomes a lattice sum of a Gaussian times the psi-remainders.
3. Truncate the lattice sum to the region |x| < epsilon^{lambda + 1/2}, which is legitimate for lambda < -1/2 (Claim 1).
4. Expand the psi-remainders to order K, which is legitimate for lambda > -2/3 (Claim 2); the two ranges overlap, which is what makes the argument work.
5. Replace the truncated lattice sum by the Gaussian integral (Claim 3), using that the asymptotics of a sum over a shifted lattice is independent of the shift; this is the Poisson summation step.
6. Assemble the constant: the (epsilon/2 pi)^{N/2} of the summand, the m^{-N/2} of the lattice spacing and the Gaussian normalisation combine to the displayed constant, and the algebraic prefactors combine to c(Q) and to the cyclic dilogarithm factors of S.
7. Prove the field statement: each factor of S is an algebraic number in F_m after raising to the m-th power, because the m-th roots theta_i generate F and the finite symbols and the Gaussian integrals have coefficients in F_m.

**Acceptance.**

- For m = 1 the statement is the expansion of a Nahm sum at q tending to 1 given by Zagier, with leading term e^{Lambda/epsilon} times an algebraic constant.
- For the Andrews-Gordon Nahm sums the expansion can be computed from the product formula and modularity, and the comparison is the proof of CGZ Theorem 7.4.
- The expansion coefficients are not in F_m but only after raising to the m-th power; the m-th root ambiguity is exactly the unit of CGZ Theorem 1.2 and is not removable.

**Prerequisites.** `HabiroNahmSeries:HB.4/summand-asymptotics`, `HabiroNahmSeries:HB.4/formal-gaussian-integration`, `HabiroNahmSeries:HB.4/gauss-sum-and-congruence-splitting`, `HabiroNahmSeries:HB.4/cyclic-dilogarithm-interface`, `HabiroNahmSeries:HB.4/poisson-summation-and-remainders`

**Sources.**

- `gz`, Theorem 3.1, equations (eq.FGIII), (eq.CAB), (eq.SQz), (eq.PS) — “e^{-Lambda/(m epsilon)} f_Q(alpha + i epsilon/(2 pi m)) ~ (chi^N/m^{N/2}) c(Q) G(Q,alpha) S_{Q,zeta}(epsilon) as epsilon decreases to 0, where chi = e(binom(m-1,2) alpha/12), c(Q) = det(A-tilde)^{-1/2} prod_i theta_i^{B_i} (1-z_i)^{1/2-1/m}, and S_{Q,zeta}(epsilon)^m is in F_m[[epsilon]].” *(The theorem, verbatim, with all four displayed ingredients.)*
- `cgz`, Section 7.1, before Theorem 7.1, printed p. 37 — “The full asymptotic expansion of f_{A,B,C}(zeta e^{-h/n}) as h tends to 0 from above was calculated in [GZ:asymptotics] using the Euler-Maclaurin formula, generalizing an earlier result in [Zagier] for the case n=1. We do not give the complete formula here, but only the simplified form as needed for the applications we will give.” *(CGZ quote the Garoufalidis-Zagier theorem in simplified form; this node is the full form and the next node is the simplified one.)*

### `poisson-summation-and-remainders`

*lemma* — **Poisson summation, the truncation window and the uniform remainder bounds**

**Statement.** Three estimates make the expansion an all-orders asymptotic statement rather than a formal manipulation. First, for lambda < -1/2 the lattice sum may be truncated to |x_i| < epsilon^{lambda + 1/2} with an error that is O(epsilon^K) for every K. Second, for lambda > -2/3 and every K the integrand may be replaced by its expansion to order K with an error o(epsilon^{K(3 lambda + 2)}). Third, for a polynomial P and lambda < -1/2 the truncated lattice sum of P against the Gaussian is asymptotic to (m epsilon)^{-N/2} times the corresponding Gaussian integral, and in particular is independent of the shift of the lattice. The ranges of lambda in the first two overlap, which is what makes the argument close. In addition, the sum over the residue classes modulo a strong denominator D has the same asymptotics for every class.

**Hypotheses and conventions.**

- The estimates are for the lattice sums arising from a fixed m-congruence class of a Nahm sum with positive definite A, and epsilon decreases to 0 through positive reals.
- The window parameter lambda is a real number, and the two constraints must be satisfied simultaneously; the source remarks that it is fortunate that the allowable range is non-empty.
- All three claims are proved by the Poisson summation formula; the source refers to the detailed treatment of Vlasenko and Zwegers for the analytic details.

**Proof outline.**

1. Apply Poisson summation to the shifted lattice sum, which turns the sum over the lattice into a sum over the dual lattice of Fourier transforms of a Gaussian times a polynomial.
2. Bound the non-zero dual-lattice terms: each carries a factor exponentially small in 1/epsilon, which gives the independence of the shift and the third claim.
3. For the first claim bound the tail of the Gaussian outside the window, which is exponentially small once lambda < -1/2.
4. For the second claim use the order statement of the summand asymptotics, in which the coefficient of x^n is O(epsilon^n), so truncating at order K costs o(epsilon^{K(3 lambda + 2)}).
5. For the equality of the D-class asymptotics apply the same argument to each class and compare the results.
6. Record that no interchange of limit and infinite sum is performed anywhere: every step is a finite truncation with an explicit remainder, which is what the layer's requirement of uniform bounds for each finite truncation means.

**Acceptance.**

- For N = 1 and the Gaussian without remainder the third claim is the classical statement that a Riemann sum of a Gaussian over a shifted lattice of spacing sqrt epsilon is the integral up to exponentially small terms.
- The window constraints are sharp in the sense that the source needs both, and a proof that used only one would not establish the theorem.
- Poisson summation is absent from both pinned libraries, so this node is a genuine analytic obligation and not an import; the gaps record it.

**Prerequisites.** `HabiroNahmSeries:HB.4/summand-asymptotics`, `HabiroNahmSeries:HB.4/formal-gaussian-integration`, `mathlib:Asymptotics.IsBigO`, `mathlib:integral_gaussian`, `mathlib:trapezoidal_error`

**Sources.**

- `gz`, Section 4.3, Claims 1 to 4 — “Claim 2: When lambda < -1/2 ... Claim 3: When lambda > -2/3 and K in N ... Claim 4: If P is a polynomial and when lambda < -1/2 then the shifted lattice sum is asymptotic to (m epsilon)^{-N/2} times the Gaussian integral. Note that there is a competition of the range of lambda in claims 2 and 3, and it is fortunate that the allowable range is nonempty. All three claims follow from an ...” *(The three claims, their constraints and the remark on the competing ranges, verbatim.)*
- `cgz`, Theorem 7.1, equation (eq.nahmEM), printed p. 38 — “f_{A,B}(zeta e^{-h/n}) = mu omega e^{L(xi_A)/(n h)} (Phi_zeta(h) + O(h^K)) for all K>0 as h tends to 0 from above” *(The form of the conclusion that the uniform remainder bounds are needed for: an equality with an O(h^K) for every K, not an asymptotic equality.)*

### `simplified-form-and-the-unit`

*theorem* — **The simplified form of the expansion and its unit**

**Statement.** In the form CGZ use, for A and B as above and n a positive integer coprime to the denominators of A and B, and for every primitive n-th root of unity zeta, one has f_{A,B}(zeta e^{-h/n}) = mu omega e^{L(xi_A)/(n h)} (Phi_zeta(h) + O(h^K)) for every K as h decreases to 0, where omega^2 lies in F, mu = e(r(n-1)(n-2)/(24 n)), and Phi_zeta(h) = Phi_{A,B,zeta}(h) is an explicit power series with Phi_zeta(h)^n in F_n[[h]] and P_zeta(xi_A)^{1/n} D_zeta(1)^{r/n} Phi_zeta(h) in F_n[[h]]. If moreover Phi_zeta(0)^n is non-zero, its image in F_n^* modulo n-th powers lies in the chi^{-1}-eigenspace.

**Hypotheses and conventions.**

- n is coprime to the denominators of A and B; F is the field generated by the distinguished solution and F_n adjoins a primitive n-th root of unity.
- P_zeta is the map of CGZ Section 2.2 attached to an element of the Bloch group, owned by HabiroNumberFields HB.1 and imported here.
- The theorem does NOT assert that Phi_zeta is not identically zero, and the source says so explicitly; that is a separate hypothesis wherever it is used.

**Proof outline.**

1. Specialise the all-orders expansion to the radial parameter of CGZ, matching h with epsilon and the root of unity with zeta.
2. Collect the twelfth root of unity and the Gauss sum into mu and omega, and record which of the two carries the arithmetic.
3. Identify the exponential rate: the Rogers dilogarithm in the CGZ normalisation gives L(xi_A), which is the regulator of HB.3.
4. Deduce the two integrality statements for Phi_zeta from the field statement of the full expansion and from the definition of the map P_zeta.
5. Deduce the eigenspace statement from the equivariance of P_zeta, recorded in HB.1.

**Acceptance.**

- For n = 1 the statement is the expansion at q tending to 1, and Phi_1(0) is an algebraic number whose square lies in F.
- For the Andrews-Gordon family the constant term can be computed independently, which is the content of CGZ Theorem 7.4.
- Phi_zeta can vanish identically, for instance when f_{A,B,C} is modular and the expansion is taken at a cusp not equivalent to 0; the source records this as the reason for writing the expansion with an explicit error term.

**Prerequisites.** `HabiroNahmSeries:HB.4/radial-asymptotic-expansion`, `HabiroNahmSeries:HB.3/embeddings-and-regulator-evaluations`, `HabiroNumberFields:HB.1`, `HabiroNumberFields:HB.2`

**Sources.**

- `cgz`, Theorem 7.1, printed p. 38 — “Then for every primitive nth root of unity zeta, we have f_{A,B}(zeta e^{-h/n}) = mu omega e^{L(xi_A)/(n h)} (Phi_zeta(h) + O(h^K)) for all K>0 as h tends to 0 from above, where omega^2 in F^*, mu = e(r(n-1)(n-2)/(24 n)), and Phi_zeta(h) is an explicit power series satisfying the two properties Phi_zeta(h)^n in F_n[[h]] and P_zeta(xi_A)^{1/n} D_zeta(1)^{r/n} Phi_zeta(h) in F_n[[h]]. ...” *(The theorem, verbatim.)*
- `cgz`, Remark 7.3, printed p. 39 — “In the theorem, we do not assert that the power series Phi cannot vanish identically (which is why we wrote an equality sign and Phi(h)+O(h^K) in (eq.nahmEM) rather than writing an asymptotic equality sign and putting simply Phi(h) on the right), and indeed this often happens, for instance, when f_{A,B,C} is modular and we are expanding at a cusp not equivalent to 0.” *(The non-vanishing caveat, verbatim; this is the hypothesis the layer text insists must be separate.)*

### `unit-corollary-and-nonvanishing`

*theorem* — **The unit corollary, under its own non-vanishing hypothesis**

**Statement.** If Phi_zeta(0) is non-zero, then the product of the power series Phi_zeta(h) with the n-th root of any unit representing R_zeta(xi_A) lies in F_n[[h]]. The proof is two lines from the previous theorem: the constant term times the n-th root of the unit lies in F_n, and the ratio Phi_zeta(h)/Phi_zeta(0) is a power series with constant term 1 whose n-th power lies in F_n[[h]], hence lies in F_n[[h]] itself. The corollary is vacuous when Phi vanishes identically, and any statement that divides by Phi_zeta(0) carries the non-vanishing hypothesis explicitly.

**Hypotheses and conventions.**

- The hypothesis is the non-vanishing of the constant term, not of the series.
- R_zeta is the S-unit attached to an element of the Bloch group by CGZ Theorem 1.2, owned by HabiroNumberFields HB.1 and imported.
- The step from the n-th power to the series itself uses that a power series with constant term 1 has a unique n-th root with constant term 1 in a Q-algebra.

**Proof outline.**

1. Apply the previous theorem's two integrality statements at h = 0.
2. Use the effectivity remark of CGZ Section 2.3 to see that the constant term times the n-th root of a representative unit lies in F_n.
3. Divide by the constant term, which is legitimate exactly under the hypothesis, and apply the uniqueness of n-th roots of series with constant term 1.
4. Combine the two conclusions.

**Acceptance.**

- For n = 1 the statement is that Phi_1(h) itself lies in F[[h]] once its constant term is non-zero.
- When Phi vanishes identically the conclusion is true but empty; the source says the corollary is vacuous in that case.
- Without the non-vanishing hypothesis the division is not allowed, and the argument produces nothing: this is the precise sense in which HB.4's stage text forbids dividing by Phi(0).

**Prerequisites.** `HabiroNahmSeries:HB.4/simplified-form-and-the-unit`, `HabiroNumberFields:HB.1`

**Sources.**

- `cgz`, Corollary 7.2 and its proof, printed p. 38 — “If Phi_zeta(0) is not 0, then the product of the power series Phi_zeta(h) with epsilon^{1/n} for any unit epsilon representing R_zeta(xi_A) belongs to F_n[[h]]. Proof: ... Since Phi_zeta(h)/Phi_zeta(0) is a power series with constant term 1, it follows that Phi_zeta(h)/Phi_zeta(0) is in F_n[[h]].” *(The corollary and its whole proof, verbatim.)*

### `acceptance-andrews-gordon`

*application* — **Acceptance: the Andrews-Gordon computation of the unit at a root of unity**

**Statement.** For odd n, let eta_zeta be the n-torsion element of the Bloch group of the maximal real subfield of the n-th cyclotomic field defined in CGZ Section 1.2, where zeta is a primitive n-th root of unity. Then R_zeta(eta_zeta) = zeta^2. The proof is an application of the radial asymptotics to a specific family: the Andrews-Gordon Nahm sums f_n = f_{A_n,0} with A_n = (2 min(i,j)) of size (n-3)/2, which have a product expansion and are therefore modular up to a power of q, so that their asymptotics at a root of unity can be computed twice, once by modularity and once by the expansion of this layer, and the comparison yields the value of the unit.

**Hypotheses and conventions.**

- n is odd and at least 3; for n = 3 the Nahm sum is the empty, zero-dimensional one and is taken to be 1.
- A_n = (2 min(i,j)) for i, j at most r = (n-3)/2; this matrix is symmetric positive definite and integral.
- The Andrews-Gordon identity is quoted from the literature and is not proved here.

**Proof outline.**

1. Form the matrix A_n and check that it is symmetric positive definite.
2. Quote the Andrews-Gordon product expansion of f_n as the product over k not congruent to 0 or plus or minus 1 modulo n of 1/(1-q^k).
3. Deduce that q^c f_n is modular for a suitable rational c, being the quotient of a theta series by the Dedekind eta function.
4. Compute the asymptotics at zeta from the modularity, and compute them from the expansion of this layer.
5. Compare and read off R_zeta(eta_zeta) = zeta^2.

**Acceptance.**

- For n = 5 the Nahm sum is the first Rogers-Ramanujan series and the identity is the classical one.
- For n = 3 both sides are trivial and the statement is the base case.
- The computation is a check of the normalisation of the radial expansion: a sign or a twelfth root of unity misplaced in chi or mu would change the answer, so the acceptance case has teeth.

**Prerequisites.** `HabiroNahmSeries:HB.4/unit-corollary-and-nonvanishing`, `HabiroNahmSeries:HB.4/radial-asymptotic-expansion`, `HabiroNumberFields:HB.1`, `QSeriesPartitionsAndMockModularForms:QM.1`

**Sources.**

- `cgz`, Theorem 7.4 and its proof, printed pp. 39 to 40 — “Let n be odd and eta_zeta be the n-torsion element in B(Q(zeta)^+) defined by (eq.etaz), where zeta is a primitive nth root of unity. Then R_zeta(eta_zeta) = zeta^2. Proof: Set A_n = (2 min(i,j)) for 1 <= i,j <= r, where r = (n-3)/2 ... By a famous identity of Andrews and Gordon, which reduces to the first Ramanujan-Rogers identity when n=5, we have the product expansion ... and this is ...” *(The theorem and the structure of its proof, verbatim.)*

### `coefficient-versus-radial-asymptotics`

*theorem* — **Coefficient asymptotics from radial asymptotics**

**Statement.** Let G(q) = sum_n c(n) q^n be analytic in the open unit disc with a radial expansion at q = 1 of the form G(e^{-z}) asymptotic to e^{C^2/(4z)} sum over alpha of A_alpha z^alpha, where C is a positive real and the exponents alpha tend to infinity, and assume the technical decay hypothesis that for every N there is theta_N with theta_N = o(N) such that the modulus of G(e^{-h + i theta}) is less than h^N e^{C^2/(4h)} for small positive h and |theta| larger than theta_N. Then the coefficients satisfy c(n) asymptotic to (1/2) sqrt(C/(2 pi)) n^{-3/4} e^{C sqrt n} times an explicit double sum over l and alpha involving the double factorials, binomial coefficients and the A_alpha. For a Nahm sum the exponents alpha are natural numbers and the hypotheses hold.

**Hypotheses and conventions.**

- G is analytic in the open unit disc; C is a positive real; the exponents alpha form a sequence tending to infinity, and in the Nahm case lie in finitely many arithmetic progressions with rational offsets.
- The decay hypothesis is the circle-method input: the function is small away from a shrinking arc around q = 1.
- This theorem is not among the stage's stated targets; it is included because it is a theorem about Nahm sums in a source this layer reads, and because it separates the radial and coefficient asymptotics that a later layer might otherwise confuse.

**Proof outline.**

1. Apply Cauchy's formula on a circle of radius e^{-h} with h chosen as the saddle point of the leading exponential.
2. Split the integral into the arc around q = 1 and its complement, and bound the complement by the decay hypothesis.
3. On the main arc substitute the radial expansion and evaluate the resulting Gaussian-type integrals term by term.
4. Collect the resulting double sum and check the constant.

**Acceptance.**

- For the generating function of partitions the theorem recovers the leading term of the Hardy-Ramanujan asymptotic.
- For a Nahm sum with C determined by the Rogers dilogarithm of the Bloch class, the coefficient growth is e^{C sqrt n} with C^2/4 the exponential rate.
- The theorem is not a statement about a single coefficient but about the whole asymptotic series, and it converts one all-orders expansion into another.

**Prerequisites.** `HabiroNahmSeries:HB.4/radial-asymptotic-expansion`, `HabiroNahmSeries:HB.4/analytic-nahm-sum`, `QSeriesPartitionsAndMockModularForms:QM.2`

**Sources.**

- `gz`, Theorem 6.1, equations (eq.an), (eq.radG), (eq.circle) — “Consider a function G(q) = sum_n c(n) q^n analytic in the open complex unit disk |q|<1 and with an asymptotic expansion at q=1 G(e^{-z}) ~ e^{C^2/(4z)} sum_alpha A_alpha z^alpha ... Assume further that for every N>0, there exists theta_N>0 such that theta_N=o(N) and |G(e^{-h+i theta})| < h^N e^{C^2/(4h)} for h>0 (and small) and |theta| > |theta_N|. Under the above assumptions, we have ...” *(The theorem with its hypotheses, verbatim.)*

---

## HB.5a. Finite-index modular functions at cusps

**Coverage: source_decomposed.** 7 nodes.

Seven nodes. The layer is the minimal analytic supplier and is built from three things: the pinned libraries, which the reviewed audit records as carrying arithmetic subgroups with the equivalence to finite index, the cusps as the rational projective line, scaling matrices, the finiteness of the orbit set, the width at infinity and Tau Ceti's width at every cusp, and the local parameter with its norm identity; the use CGZ makes of it in the proof of Theorem 7.5, which is a single transport identity; and Garoufalidis-Zagier Section 7, which defines the valuation of a modular function at a rational point through a scaling matrix and proves its independence of the choice. What the layer adds and the libraries do not have is the weight-zero meromorphic modular function with a Laurent expansion of finite principal part at every cusp, and the radial growth theorem with its rational exponential rate. The final node states the four facts HB.5 consumes and nothing else, so that the boundary of the layer is visible. No congruence hypothesis and no algebraic model of a modular curve appear anywhere; a gap records that no textbook treatment of the cusp theory was obtained, the statements resting on the pinned libraries and on the two papers' own use.

**Planets (4):** *Cusps and scaling matrices*, *Cusp width*, *Modular function of a finite-index group*, *Radial growth at a cusp*.

### `finite-index-subgroups`

*definition* — **Finite-index subgroups of the modular group, with no congruence assumption**

**Statement.** A modular group for this layer is a subgroup Gamma of SL(2,Z) of finite index. It is NOT assumed to be a congruence subgroup, and no algebraic model of a modular curve is used anywhere in the layer. Record the pinned facts: Mathlib's arithmetic subgroups of GL(2,R) are those commensurable with SL(2,Z), and for a subgroup of SL(2,Z) being arithmetic is equivalent to having finite index, so the generality this layer needs is already the pinned default; the congruence condition is a separate predicate that no statement below uses.

**Hypotheses and conventions.**

- Gamma is a subgroup of SL(2,Z) of finite index; the index is written [SL(2,Z) : Gamma].
- Whether minus the identity belongs to Gamma is recorded as data, because the cusp width depends on it.
- The congruence subgroups Gamma(M) are used only as a source of finite-index subgroups with prescribed congruence behaviour, in the intersection argument of HB.5.

**Proof outline.**

1. Define the carrier as a subgroup of SL(2,Z) with the finite-index hypothesis.
2. Import Mathlib's arithmeticity predicate and the equivalence with finite index, and record that the layer's carrier is that predicate restricted to subgroups of SL(2,Z).
3. Record the two-sided action on the upper half-plane and the elementary transformations, imported from the modular-forms development and not rebuilt.
4. Prove that the intersection of Gamma with a congruence subgroup is again of finite index, which is the operation HB.5 performs.

**API.**

| name | role | statement |
| --- | --- | --- |
| `ModularSubgroup` | structure | A subgroup of SL(2,Z) of finite index. |
| `ModularSubgroup.finiteIndex` | projection | The finite-index hypothesis. |
| `ModularSubgroup.isArithmetic` | compatibility | Agreement with Mathlib's arithmeticity predicate. |
| `ModularSubgroup.inter` | constructor | The intersection of two finite-index subgroups. |
| `ModularSubgroup.inter_finiteIndex` | characterisation | The intersection again has finite index. |
| `ModularSubgroup.negOne` | data | Whether minus the identity belongs to the subgroup. |

**Where and how it is used.**

- *HB.5.* The hypothesis of CGZ Theorem 7.5 is modularity for such a subgroup, and the proof intersects it with Gamma(M) to control the denominators d of its elements.
- *The cusp width.* The width is defined by the orbit of the translation subgroup on the cosets, so finiteness of the index is what makes it a positive integer.
- *HB.5a growth.* The radial growth statement is proved for an invariant function of such a subgroup, with no further hypothesis.

**Unit tests.**

- `full_group` — SL(2,Z) itself is a legitimate input with index 1.
- `principal_congruence` — Gamma(M) is a legitimate input, and its index is the standard one.
- `intersection_index` — The intersection of Gamma with Gamma(M) has index at most the product of the two indices.
- `no_congruence_used` — No statement of this layer refers to a congruence predicate; the tests are stated for an arbitrary finite-index subgroup.

**Acceptance.**

- Gamma = SL(2,Z) has index 1 and is a congruence subgroup.
- Gamma(M) has finite index and is a congruence subgroup; its intersection with any finite-index Gamma is of finite index.
- A non-congruence subgroup of finite index exists and is a legitimate input: nothing in the layer distinguishes it, and CGZ Remark 7.6 records that the non-congruence generality is deliberate.

**Prerequisites.** `mathlib:Subgroup.IsArithmetic`, `mathlib:Subgroup.isArithmetic_iff_finiteIndex`, `mathlib:UpperHalfPlane`, `mathlib:SlashAction`

**Sources.**

- `cgz`, Section 7.1, the abuse of terminology, printed p. 35 — “(Here and from now on we will allow ourselves the abuse of terminology of saying that a function f(q) is modular if the function f(tau)=f(e^{2 pi i tau}) is invariant under the action of some subgroup of finite index of SL(2,Z).)” *(The generality that the whole layer exists to support, verbatim.)*
- `cgz`, Remark 7.6, printed p. 41 — “The proof of the theorem would have been marginally shorter if we had assumed that f_{A,B,C} was a modular function on a congruence subgroup, rather than just a subgroup of finite index of SL(2,Z). We did not make this assumption since it was not needed, but should mention that f_{A,B,C}, if modular at all, is expected automatically to be modular for a congruence subgroup, because it has ...” *(The source explains why it avoids the congruence hypothesis and what is expected instead; the expectation is a conjecture and is not used.)*

### `cusps-and-scaling-matrices`

*construction* — **Rational cusps and scaling matrices** · planet **Cusps and scaling matrices**

**Statement.** The cusps of a finite-index subgroup Gamma are the points of the projective line over the rationals inside the boundary of the upper half-plane, and Gamma has finitely many orbits on them. For every cusp c there is a scaling matrix, that is an element g of SL(2,Z) with g . infinity = c; transport of a statement at c to a statement at infinity is conjugation by g. Record from the pinned libraries: the cusps of an arithmetic subgroup are exactly the rational points together with infinity, every cusp is g . infinity for some g in SL(2,Z), and the orbit set is finite.

**Hypotheses and conventions.**

- Gamma has finite index in SL(2,Z); c is a cusp, that is a point of the projective line over the rationals.
- A scaling matrix is not unique: two differ by an element of the stabiliser of infinity, that is by a translation and a sign.
- Everything is stated for the action of SL(2,Z) on the projective line over the rationals; no modular curve is constructed.

**Proof outline.**

1. Import the pinned cusp predicate and the characterisation of the cusps of an arithmetic subgroup as the rational projective line.
2. Import the existence of a scaling matrix and define the transport of a function by the slash action of that matrix.
3. Prove that the transport is independent of the choice of scaling matrix up to the translation action, and record exactly what is not independent, namely the choice of local parameter before the width is fixed.
4. Import the finiteness of the orbit set and define the finite set of cusp orbits.

**API.**

| name | role | statement |
| --- | --- | --- |
| `cuspSet` | data | The set of cusps of a finite-index subgroup, the rational projective line. |
| `scalingMatrix` | constructor | A choice of g in SL(2,Z) with g . infinity = c. |
| `scalingMatrix_spec` | characterisation | The defining property of a scaling matrix. |
| `scalingMatrix_unique_up_to_stabiliser` | characterisation | Two scaling matrices for the same cusp differ by an element of the stabiliser of infinity. |
| `cuspOrbits_finite` | characterisation | The set of Gamma-orbits of cusps is finite. |
| `transport` | functoriality | Transport of an invariant function to the cusp infinity by the slash action of a scaling matrix. |

**Where and how it is used.**

- *The local parameter.* The Laurent expansion at a cusp is by definition the expansion at infinity of the transported function.
- *The width.* The width is computed in terms of a scaling matrix, and the independence statement is what makes the width an invariant of the cusp.
- *HB.5.* The proof reads the asymptotics of a modular function at the cusp b/d produced by an element of Gamma.

**Unit tests.**

- `infinity_identity` — The identity is a scaling matrix for the cusp infinity.
- `zero_S` — S = (0 -1; 1 0) is a scaling matrix for the cusp 0.
- `rational_cusp` — For coprime b and d the matrix with first column (b,d) is a scaling matrix for b/d.
- `finitely_many_orbits` — For Gamma(2) the number of cusp orbits is three.

**Acceptance.**

- The cusp infinity has the identity as a scaling matrix.
- The cusp 0 has the matrix S = (0 -1; 1 0) as a scaling matrix, since S . infinity = 0.
- A cusp b/d in lowest terms has a scaling matrix whose first column is (b, d), which is the matrix that appears in the proof of CGZ Theorem 7.5.

**Prerequisites.** `HabiroNahmSeries:HB.5a/finite-index-subgroups`, `mathlib:IsCusp`, `mathlib:isCusp_SL2Z_iff`, `mathlib:OnePoint.exists_mem_SL2`, `mathlib:CuspOrbits`

**Sources.**

- `cgz`, Proof of Theorem 7.5, printed p. 40 — “Now assume that f is modular with respect to a finite index subgroup Gamma of SL(2,Z). Then for h tending to 0 from above, hbar = h/(2 pi), and any gamma = (a b; c d) in Gamma, taking epsilon = dh/(1-i c hbar), we find f_{A,B,C}(e^{-epsilon}) = f(i epsilon/(2 pi)) = f((a i epsilon/2 pi + b)/(c i epsilon/2 pi + d)) = f((b+i hbar)/d) = f_{A,B,C}(zeta e^{-h/d}), where zeta = e(b/d).” *(The only use the Nahm application makes of this construction: the element gamma of Gamma supplies the cusp b/d and the scaling data, and the radial parameter is transported accordingly.)*

### `cusp-width`

*definition* — **The width of a cusp** · planet **Cusp width**

**Statement.** The width of a cusp c of Gamma is the least positive integer w such that the conjugate by a scaling matrix of the translation by w belongs to Gamma, equivalently the size of the orbit of the coset of the scaling matrix under the translation subgroup acting on the coset space. The width is independent of the choice of scaling matrix. Two conventions must be kept apart: when minus the identity belongs to Gamma the orbit width is the classical width, and otherwise it is either the classical width or twice it; the sum of the widths over the orbits is the index. Tau Ceti carries the orbit-based width at every cusp and Mathlib carries the strict width at infinity, and both are cited rather than rebuilt.

**Hypotheses and conventions.**

- Gamma has finite index; c is a cusp with a chosen scaling matrix g.
- The translation subgroup is generated by T = (1 1; 0 1).
- The two conventions differ exactly by the factor of two described above; every statement below says which one it uses.

**Proof outline.**

1. Define the width by the least-element characterisation and prove that the set of admissible w is a non-empty subsemigroup of the positive integers, using finiteness of the index.
2. Prove independence of the choice of scaling matrix.
3. Prove the comparison between the orbit convention and the classical convention in the two cases of whether minus the identity belongs to Gamma.
4. Import Tau Ceti's orbit width and Mathlib's strict width at infinity and prove that they agree with this definition in their respective settings.
5. Prove that the sum of the widths over a set of orbit representatives is the index.

**API.**

| name | role | statement |
| --- | --- | --- |
| `cuspWidth` | data | The width of a cusp of Gamma. |
| `cuspWidth_pos` | characterisation | The width is a positive integer. |
| `cuspWidth_spec` | characterisation | The conjugated translation by the width belongs to Gamma, and no smaller positive integer works. |
| `cuspWidth_independent` | characterisation | Independence of the choice of scaling matrix. |
| `cuspWidth_eq_tauceti` | compatibility | Agreement with Tau Ceti's orbit width. |
| `cuspWidth_infty_eq_mathlib` | compatibility | Agreement with Mathlib's strict width at infinity. |
| `sum_cuspWidth_eq_index` | characterisation | The widths sum to the index over a set of orbit representatives. |

**Where and how it is used.**

- *The local parameter.* The local parameter at a cusp is the exponential of 2 pi i z divided by the width, so the width is part of the definition of the expansion.
- *The growth theorem.* The exponential rate of growth along a radial approach is the leading Laurent exponent divided by the width, so a wrong width changes the rate.
- *HB.5.* The denominators d of the elements of Gamma are controlled by shrinking Gamma, which changes the widths in a controlled way.

**Unit tests.**

- `full_group_width_one` — Every cusp of SL(2,Z) has width 1.
- `principal_width` — Every cusp of Gamma(M) has width M.
- `gamma0p` — For Gamma_0(p) the widths at infinity and at 0 are 1 and p.
- `widths_sum_to_index` — For Gamma_0(p) the widths sum to p + 1, the index.

**Acceptance.**

- For Gamma = SL(2,Z) every cusp has width 1.
- For Gamma(M) every cusp has width M.
- For Gamma_0(p) the cusp infinity has width 1 and the cusp 0 has width p, and the two widths sum to the index p + 1.

**Prerequisites.** `HabiroNahmSeries:HB.5a/cusps-and-scaling-matrices`, `mathlib:Subgroup.strictWidthInfty`, `tauceti:TauCeti.ModularForm.cuspTranslationOrbitWidth`

**Sources.**

- `cgz`, Proof of Theorem 7.5, printed p. 40 — “We can also assume that d is prime to M for any fixed integer M, since by intersecting Gamma with the full congruence subgroup Gamma(M), we may assume that Gamma is contained in Gamma(M).” *(The use the application makes of the width data: the denominators d that occur can be forced to avoid any finite set of primes by shrinking Gamma, which is a statement about the cusps of the shrunken group.)*

### `modular-function-of-finite-index`

*definition* — **Weight-zero meromorphic modular functions** · planet **Modular function of a finite-index group**

**Statement.** A modular function for Gamma is a meromorphic function on the upper half-plane, invariant under the weight-zero action of Gamma, which is meromorphic at every cusp: for each cusp with its scaling matrix and width, the transported function has a Laurent expansion in the local parameter with finite principal part. No holomorphy is assumed on the upper half-plane or at the cusps, and no algebraic model of the quotient is used. Mathlib has weight-zero slash-invariant forms with no analytic condition and proves that weight-zero holomorphic modular forms are constant; the meromorphic notion with Laurent expansions at cusps is what this layer adds.

**Hypotheses and conventions.**

- Gamma is of finite index; the function is meromorphic on the upper half-plane in the sense of the pinned meromorphy predicate.
- The invariance is under the weight-zero slash action, which is composition with the Moebius action.
- Finite principal part means that only finitely many negative powers of the local parameter occur; this is the condition that fails for a function with an essential singularity at a cusp.

**Proof outline.**

1. Define invariance by the weight-zero slash action, importing the pinned slash action.
2. Define meromorphy at a cusp by transporting with a scaling matrix and requiring a Laurent expansion in the local parameter with finite principal part.
3. Prove that meromorphy at a cusp is independent of the choice of scaling matrix, using the independence of the width.
4. Prove that the modular functions form a field, and that the constants are modular functions.
5. Record what the pinned libraries supply: weight-zero slash-invariant forms as Gamma-invariant functions with no analytic condition, q-expansions of holomorphic bounded periodic functions, and the order of a meromorphic germ.

**API.**

| name | role | statement |
| --- | --- | --- |
| `ModularFunction` | structure | A weight-zero Gamma-invariant meromorphic function, meromorphic at every cusp. |
| `ModularFunction.invariant` | projection | The invariance under the slash action. |
| `ModularFunction.meromorphicAtCusp` | projection | Meromorphy at each cusp, with finite principal part. |
| `ModularFunction.const` | constructor | The constant functions are modular functions. |
| `ModularFunction.field` | instance | The modular functions form a field. |
| `ModularFunction.meromorphicAtCusp_independent` | characterisation | Meromorphy at a cusp does not depend on the scaling matrix chosen. |
| `ModularFunction.ext` | extensionality | Two modular functions agreeing as functions are equal. |

**Where and how it is used.**

- *HB.5.* The hypothesis of Nahm's conjecture is that the Nahm sum is a modular function in exactly this sense.
- *The growth theorem.* The radial growth rate is read off the Laurent expansion of such a function at the relevant cusp.
- *HB.10.* The Rogers-Ramanujan and Andrews-Gordon examples are modular functions after multiplication by a rational power of q, which is recorded with the power made explicit.

**Unit tests.**

- `constants` — Every constant is a modular function for every Gamma.
- `j_function` — The j-function is a modular function for SL(2,Z) with a pole of order one at the cusp in the local parameter.
- `weight_zero_holomorphic_constant` — A holomorphic modular function with no pole at any cusp is constant, which is the pinned weight-zero statement.
- `essential_singularity_excluded` — A function whose transported expansion has infinitely many negative powers is not a modular function.

**Acceptance.**

- Every constant is a modular function.
- The classical j-function is a modular function for SL(2,Z) with a simple pole at the cusp.
- A holomorphic weight-zero modular form for Gamma is constant, so the meromorphic notion is strictly larger and is the one the Nahm application needs, since a Nahm sum has a pole-like growth at the cusps.

**Prerequisites.** `HabiroNahmSeries:HB.5a/cusp-width`, `HabiroNahmSeries:HB.5a/cusps-and-scaling-matrices`, `mathlib:SlashInvariantForm`, `mathlib:MeromorphicAt`, `mathlib:Function.Periodic.cuspFunction`, `mathlib:Function.Periodic.qParam`

**Sources.**

- `cgz`, Section 7.3, before Theorem 7.5, printed p. 40 — “Finally, when we say that F_{A,B,C} is modular, we mean that the function f(tau)=f_{A,B,C}(e(tau)) is invariant with respect to a subgroup of finite index of SL(2,Z).” *(The exact notion the application uses: invariance of the upper half-plane form under a finite-index subgroup, with the analytic behaviour at the cusps supplied by this layer.)*
- `cgz`, Remark 7.7, printed p. 41 — “Conversely, we could have stated Theorem 7.5 in an apparently more general form by writing modular form instead of modular function. We did not do this since it is easy to see that if a Nahm sum is modular at all, it is actually a modular function, because if it were a modular form of non-zero rational weight k, there would be an extra factor h^{-k} in the right-hand side of (eq.nc2).” *(Why weight zero is the right generality for the application, verbatim.)*

### `local-parameter-and-laurent-expansion`

*theorem* — **The local parameter at a cusp and the Laurent expansion**

**Statement.** Let c be a cusp of Gamma of width w with scaling matrix g. The local parameter is q_c(z) = exp(2 pi i z / w), whose absolute value is exp(-2 pi Im(z)/w); the transported function f slashed by g is invariant under translation by w, hence is a function of q_c, and meromorphy at the cusp says exactly that this function extends meromorphically to the punctured disc with a finite principal part. Consequently f slashed by g has a Laurent expansion sum over n at least n_0 of a_n q_c^n with a_{n_0} non-zero, unless the transported function is identically zero, which is a case that must be separated.

**Hypotheses and conventions.**

- c is a cusp of Gamma with width w and scaling matrix g; f is a modular function for Gamma.
- The local parameter map sends the upper half-plane onto the punctured unit disc, and Mathlib carries it with the norm identity.
- The leading exponent n_0 is an integer, possibly negative; it is the order of the germ at the cusp.

**Proof outline.**

1. Prove that f slashed by g is invariant under translation by w, from the definition of the width.
2. Factor it through the local parameter, using the pinned cusp-function construction for periodic functions.
3. Prove that the resulting function on the punctured disc is meromorphic at 0 exactly when f is meromorphic at c, and that its order is independent of the choice of scaling matrix.
4. Define the Laurent coefficients and the leading exponent, and prove that the leading coefficient is non-zero when the function is not identically zero.
5. Separate the identically zero case explicitly, and record that the order of the zero germ is the top element of the extended integers in the pinned convention.

**Acceptance.**

- For the j-function at the cusp of SL(2,Z), the width is 1 and the expansion is 1/q + 744 + ..., with leading exponent minus one.
- For a holomorphic modular function the leading exponent is non-negative at every cusp.
- The zero function has no leading exponent, and every statement that selects the first non-zero coefficient must exclude it; this is the separation the layer text requires.

**Prerequisites.** `HabiroNahmSeries:HB.5a/modular-function-of-finite-index`, `mathlib:Function.Periodic.qParam`, `mathlib:Function.Periodic.cuspFunction`, `mathlib:MeromorphicAt`

**Sources.**

- `cgz`, Proof of Theorem 7.5, printed p. 40 — “f_{A,B,C}(e^{-epsilon}) = f(i epsilon/(2 pi)) = f((a i epsilon/2 pi + b)/(c i epsilon/2 pi + d)) = f((b+i hbar)/d) = f_{A,B,C}(zeta e^{-h/d}), where zeta = e(b/d)” *(The transport of the radial parameter to the cusp b/d, which is the only computation with the local parameter that the application performs.)*

### `radial-growth-at-a-cusp`

*theorem* — **Radial growth of a modular function at a cusp** · planet **Radial growth at a cusp**

**Statement.** Let f be a modular function for Gamma, not identically zero, and let c = b/d be a cusp with width w and leading Laurent exponent n_0 at c. Then along the radial approach z = c + i y with y decreasing to 0, the transported function satisfies f(z) = a_{n_0} exp(-2 pi i n_0 c / w) exp(2 pi n_0 / (w y)) (1 + O(exp(-2 pi/(w y)))). In particular the exponential rate is 2 pi n_0/w, a rational multiple of pi determined by the integer leading exponent and the rational cusp data, and there is no other possible rate: a modular function grows like exp(constant/y) with the constant in (2 pi/w) Z, and never like exp(c/y) with an irrational multiple.

**Hypotheses and conventions.**

- f is a modular function for Gamma and is not identically zero; c is a cusp with width w; n_0 is the leading exponent of the Laurent expansion at c.
- The radial approach is the one used in HB.4, namely q tending to the root of unity along the ray, with the normalisation q = e(z) and z = c + i y.
- When n_0 is zero the statement says that f tends to its constant term with an exponentially small error, which is the case used for a cusp where the Nahm sum has no exponential growth.

**Proof outline.**

1. Transport to infinity by a scaling matrix and use the Laurent expansion in the local parameter.
2. Estimate the tail: the terms of index n > n_0 contribute a factor bounded by a constant times the modulus of the local parameter, which is exp(-2 pi y'/w) for the transported variable, giving the stated relative error.
3. Translate the estimate back through the scaling matrix, which changes the radial parameter by the rational cusp data and no more.
4. Read off the exponential rate and record that it lies in the stated rational lattice; this is the statement the Nahm application needs, since it forces the rationality of the exponent in the comparison of two asymptotic expansions.
5. Record the excluded case: if f vanishes identically there is no leading coefficient and the statement is vacuous.

**Acceptance.**

- For the j-function at the cusp of SL(2,Z) the growth is exp(2 pi/y), the rate coming from n_0 = -1 and w = 1.
- For a holomorphic modular function with a_0 non-zero the limit along the radial approach is a_0.
- A function with growth exp(c/y) for an irrational multiple c of pi is not a modular function for any finite-index subgroup; this is the non-example that makes the layer's statement have content in the Nahm application, where the rate is the Rogers dilogarithm of the Bloch class.

**Prerequisites.** `HabiroNahmSeries:HB.5a/local-parameter-and-laurent-expansion`, `mathlib:Asymptotics.IsBigO`

**Sources.**

- `cgz`, Proof of Theorem 7.5, printed p. 40 — “Notice that in this case the number lambda = L(xi_A)/(4 pi^2) must be rational, since the modularity of f(tau)=f_{A,B,C}(e(tau)) implies that the function f(-1/tau) is invariant under some power of T.” *(The exact consequence the application draws from the growth of a modular function at a cusp: the exponential rate, which is the Rogers dilogarithm of the Bloch class, is forced to be a rational multiple of pi squared.)*
- `cgz`, Proof of Theorem 7.5, equation (eq.nc2), printed p. 40 — “Moreover, if f_{A,B,C} is assumed to be modular, the error term O(epsilon) can be replaced by O(e^{-c/epsilon}) with some c > 0.” *(The exponentially small error term, which is the second half of what the growth theorem provides.)*

### `supplier-interface`

*application* — **What HB.5 consumes from this layer, and nothing more**

**Statement.** The Nahm application uses exactly four facts from this layer, and the layer exists to supply them. First, for an element gamma = (a b; c d) of Gamma and the radial parameter epsilon = d h/(1 - i c h-bar), the invariance gives f_{A,B,C}(e^{-epsilon}) = f_{A,B,C}(zeta e^{-h/d}) with zeta = e(b/d), so a radial approach to 1 becomes a radial approach to a root of unity of order dividing d. Second, the exponential rate of a modular function along a radial approach is a rational multiple of pi squared, which forces lambda = L(xi_A)/(4 pi^2) to be rational. Third, the error term in the expansion at a cusp is exponentially small, not merely O(epsilon). Fourth, Gamma may be shrunk by intersecting with Gamma(M), so that the denominators d avoid any fixed finite set of primes. No other property of modular functions is used, and in particular no congruence hypothesis, no algebraic model and no Fourier coefficient arithmetic.

**Hypotheses and conventions.**

- Gamma is a finite-index subgroup and f is a modular function for it in the sense of this layer.
- h decreases to 0 through positive reals and h-bar = h/(2 pi); the identity for epsilon is an identity of complex numbers, not an asymptotic statement.
- The fourth item changes Gamma and therefore changes the set of available gamma, which is why the conclusion of HB.5 is about an unbounded family of denominators and not about one.

**Proof outline.**

1. Prove the transport identity by direct computation with the Moebius action, as in the source.
2. Prove the rationality of the rate from the growth theorem, applied to the function and to its transform under S.
3. Prove the exponentially small error from the Laurent expansion with finite principal part.
4. Prove the shrinking statement from the finite-index stability of intersections, and record that the denominators of the cusps of the shrunken group avoid the chosen modulus.
5. State the four facts as a single interface record, so that HB.5's proof depends on this node and not on the internal definitions of the layer.

**Acceptance.**

- For Gamma = SL(2,Z) and gamma = T the transport identity is trivial and no new root of unity appears; the content is for gamma with c non-zero.
- Shrinking Gamma to Gamma intersected with Gamma(M) forces every denominator d occurring to be prime to M, which is exactly the arithmetic hypothesis of HB.4's expansion.
- The interface does not include any statement about Fourier coefficients, since CGZ Remark 7.6 records that the coefficient arithmetic is a conjecture and is not used.

**Prerequisites.** `HabiroNahmSeries:HB.5a/radial-growth-at-a-cusp`, `HabiroNahmSeries:HB.5a/finite-index-subgroups`, `HabiroNahmSeries:HB.5a/cusp-width`

**Sources.**

- `cgz`, Proof of Theorem 7.5, printed p. 40 — “Now assume that f is modular with respect to a finite index subgroup Gamma of SL(2,Z). Then for h tending to 0 from above, hbar = h/(2 pi), and any gamma=(a b; c d) in Gamma, taking epsilon = dh/(1-i c hbar), we find f_{A,B,C}(e^{-epsilon}) = ... = f_{A,B,C}(zeta e^{-h/d}), where zeta = e(b/d)” *(The first fact, verbatim.)*
- `cgz`, Proof of Theorem 7.5, printed pp. 40 to 41 — “We can also assume that d is prime to M for any fixed integer M, since by intersecting Gamma with the full congruence subgroup Gamma(M), we may assume that Gamma is contained in Gamma(M). This shows that there are infinitely many integers n and primitive nth roots of unity zeta for which Phi_zeta(0)^r in Theorem 7.1 is a non-zero element of F_n.” *(The fourth fact and the conclusion it produces, verbatim.)*

---

## HB.5. The proved implication in Nahm's conjecture

**Coverage: source_decomposed.** 8 nodes.

Eight nodes, decomposed from CGZ Section 7.3 read in full together with Section 7.1's three properties and Garoufalidis-Zagier Section 7. The three properties of Nahm's conjecture and the two conjectural implications are separated from the one theorem, with both counterexample matrices recorded as data; the expansion at q tending to 1 and its improvement under modularity; the comparison of the two expansions at the cusp produced by an element of the group, which yields the non-vanishing of the constant term and a fixed power in the cyclotomic field; the finitely generated abelian group lemma, which the source states in one sentence and which is isolated here; the theorem itself; the finiteness of the excluded primes and the arithmetic hypotheses on the admissible orders; the valuation bound at every cusp of Garoufalidis-Zagier Proposition 7.1; and an explicit record of the four things that are not proved. The injectivity statement of CGZ Theorem 1.2, which the proof invokes, is imported from HabiroNumberFields HB.1 and is not proved here.

**Planets (2):** *Nahm's conjecture*, *Modularity implies Bloch torsion*.

### `nahm-conjecture-statement`

*definition* — **Nahm's conjecture: the three properties and the two implications** · planet **Nahm's conjecture**

**Statement.** For a symmetric positive definite rational matrix A define three properties. (a) The class [X] vanishes in the Bloch group of the complex numbers for EVERY solution X of Nahm's equations. (b) The special class xi_A attached to the distinguished solution vanishes. (c) The function f_{A,B,C} is modular for SOME rational vector B and rational number C. Trivially (a) implies (b). Nahm's conjecture is the pair of implications (a) implies (c) and (c) implies (b). Both stronger forms are false: (b) alone does not imply (c), by Zagier's matrix (8 5; 5 4), and (c) does not require (a), by the Vlasenko-Zwegers matrix (3/2 1/2; 1/2 3/2). Only (c) implies (b) is a theorem, and it is the endpoint of this layer.

**Hypotheses and conventions.**

- A is symmetric positive definite with rational entries; B ranges over rational vectors and C over rational numbers.
- Vanishing in the Bloch group of the complex numbers is equivalent to being torsion in the Bloch group of the field generated by the solution, by the unique divisibility statement of HB.3.
- Modular means invariant under a subgroup of finite index of SL(2,Z), in the sense of HB.5a, and never means modular for a congruence subgroup.

**Proof outline.**

1. Define the three properties as predicates on the matrix A.
2. Prove the trivial implication from (a) to (b).
3. Record, as data and not as theorems, the two counterexamples that rule out the stronger forms, with their matrices and the reason each fails.
4. State the two conjectural implications as named conjectures, clearly separated from the theorem of this layer.
5. Record the motivation, namely that both (b) and (c) force L(xi_A)/pi^2 to be rational, which is the shared consequence that made the conjecture plausible.

**API.**

| name | role | statement |
| --- | --- | --- |
| `NahmProperty.a` | data | The property that every solution has vanishing class. |
| `NahmProperty.b` | data | The property that the distinguished solution has vanishing class. |
| `NahmProperty.c` | data | The property that some f_{A,B,C} is modular. |
| `NahmProperty.a_imp_b` | characterisation | Property (a) implies property (b). |
| `NahmConjecture.aImpC` | data | The conjectural implication from (a) to (c), stated and not proved. |
| `NahmConjecture.cImpB` | data | The implication from (c) to (b), which is the theorem of this layer. |
| `NahmProperty.b_not_imp_c` | example | Zagier's counterexample matrix, recorded as data. |
| `NahmProperty.c_not_imp_a` | example | The Vlasenko-Zwegers counterexample matrix, recorded as data. |

**Where and how it is used.**

- *HB.5.* The theorem of this layer is exactly the implication (c) implies (b).
- *HB.10.* The worked example with A = (8 5; 5 4) is the matrix that separates (b) from (c), and its Bloch class is the 60-torsion element.
- *The atlas.* This is the statement the roadmap exists to reach, and keeping the three properties separate is what prevents a later layer from claiming more than was proved.

**Unit tests.**

- `rogers_ramanujan_all_three` — For A = (2) all three properties hold.
- `zagier_matrix_b_not_c` — For A = (8 5; 5 4) property (b) holds and property (c) fails.
- `vlasenko_zwegers_c_not_a` — For A = (3/2 1/2; 1/2 3/2) property (c) holds and property (a) fails.
- `a_implies_b` — Property (a) implies property (b) for every A, with no hypothesis beyond positive definiteness.

**Acceptance.**

- For A = (2) all three properties hold: the Rogers-Ramanujan sums are modular and the Bloch class is torsion.
- For A = (8 5; 5 4) property (b) holds and property (c) fails, so (b) does not imply (c).
- For A = (3/2 1/2; 1/2 3/2) property (c) holds and property (a) fails, so (c) does not imply (a).

**Prerequisites.** `HabiroNahmSeries:HB.3/bloch-class-of-a-solution`, `HabiroNahmSeries:HB.3/torsion-in-the-algebraic-closure`, `HabiroNahmSeries:HB.4/analytic-nahm-sum`, `HabiroNahmSeries:HB.5a/modular-function-of-finite-index`

**Sources.**

- `cgz`, Section 7.1, the three properties, printed pp. 36 to 37 — “(a) The class [X] in B(C) vanishes for all solutions X of the Nahm equations. (b) The special class xi_A in B(C) associated to the solution X^A vanishes. (c) The function f_{A,B,C}(q) is modular for some B in Q^r and C in Q. Trivially (a) implies (b). Nahm's conjecture says that (a) implies (c) and (c) implies (b).” *(The three properties and the conjecture, verbatim.)*
- `cgz`, Section 7.1, the two counterexamples, printed p. 37 — “(The possible stronger hypothesis that (b) alone might already imply (c) was eliminated in [Zagier] using the 2x2 matrix A=(8 5; 5 4), and the other possible stronger assertion that (c) might require (a) was shown to be false by Vlasenko and Zwegers with the counterexample A=(3/2 1/2; 1/2 3/2).)” *(Both counterexamples with their matrices, verbatim.)*
- `cgz`, Section 1.3, printed p. 5 — “This relation conjecturally goes in both directions, but with the implication from the vanishing of the Bloch elements to the modularity of certain Nahm sums not yet having a sufficiently precise formulation to be studied. The conjectural implication from modularity to vanishing of Bloch elements, on the other hand, had a completely precise formulation.” *(Why only one direction is stated precisely, verbatim.)*

### `expansion-at-one`

*lemma* — **The expansion of a Nahm sum at q tending to one, and its improvement under modularity**

**Statement.** Every Nahm sum has an expansion near q = 1 of the form f_{A,B,C}(e^{-epsilon}) = e^{L(xi_A)/epsilon} (K + O(epsilon)) as epsilon decreases to 0, where K is a non-zero algebraic number some power of which lies in the field F generated by the distinguished solution. If moreover f_{A,B,C} is modular, the error term O(epsilon) may be replaced by O(e^{-c/epsilon}) for some positive c, and the number lambda = L(xi_A)/(4 pi^2) is rational.

**Hypotheses and conventions.**

- A is an analytic Nahm datum; F is the field of the distinguished solution; L is the Rogers dilogarithm in the CGZ normalisation of HB.3.
- The first statement is unconditional and is the m = 1 case of the radial expansion of HB.4; the constant K is the one computed by Zagier and is non-zero.
- The improvement of the error term and the rationality of lambda both use modularity, through the growth statement of HB.5a.

**Proof outline.**

1. Specialise the radial expansion of HB.4 to m = 1, so that the Gauss sum is 1, the twelfth root of unity is 1 and the constant is c(Q) times the constant term of the Gaussian series; this gives the first statement with K the resulting algebraic number.
2. Record that K is non-zero and that a bounded power of it lies in F, which is the part of the statement the later comparison needs.
3. Under modularity, apply the growth statement of HB.5a to f and to its transform under S: the transported function has a Laurent expansion with finite principal part, so the error is exponentially small and the rate is 2 pi n_0/w, forcing L(xi_A)/(4 pi^2) to be rational.
4. Record that both improvements are consequences of modularity and are used only in the modular branch of the argument.

**Acceptance.**

- For A = (2), B = 0, C = -1/60 the expansion is the classical Rogers-Ramanujan asymptotic with rate pi^2/(15 epsilon) up to the normalisation.
- For a non-modular A the rate need not be a rational multiple of pi^2, and the conclusion of the layer's theorem is then unavailable; this is the content of the implication.
- The constant K is not in F in general but only a bounded power of it is; the argument of the next node is written so that this suffices.

**Prerequisites.** `HabiroNahmSeries:HB.4/radial-asymptotic-expansion`, `HabiroNahmSeries:HB.4/simplified-form-and-the-unit`, `HabiroNahmSeries:HB.5a/radial-growth-at-a-cusp`, `HabiroNahmSeries:HB.3/embeddings-and-regulator-evaluations`

**Sources.**

- `cgz`, Proof of Theorem 7.5, equation (eq.nc2), printed p. 40 — “On p. 56 of [Zagier], it is shown that any Nahm sum has an expansion near q=1 of the form f_{A,B,C}(e^{-epsilon}) = e^{L(xi_A)/epsilon}(K + O(epsilon)) as epsilon tends to 0, where K (given explicitly in eq. (29) of [Zagier]) is a non-zero algebraic number some power of which belongs to F=F_A. Moreover, if f_{A,B,C} is assumed to be modular, the error term O(epsilon) can be replaced by ...” *(Both statements, verbatim; the reference to Zagier eq. (29) is recorded as a gap, since that source was not read.)*

### `comparison-of-expansions`

*theorem* — **Comparing the two expansions at a cusp**

**Statement.** Assume f_{A,B,C} is modular for a finite-index subgroup Gamma, and let gamma = (a b; c d) be an element of Gamma. Taking epsilon = d h/(1 - i c h-bar) with h-bar = h/(2 pi), the invariance gives f_{A,B,C}(e^{-epsilon}) = f_{A,B,C}(zeta e^{-h/d}) with zeta = e(b/d). Comparing the expansion at 1 with the radial expansion at zeta, both of which are available, yields mu e^{L(xi_A)/(h d)} Phi_zeta(h) = e^{L(xi_A)/(h d)} (K e(lambda c/d) + O(h)), hence Phi_zeta(0) = mu^{-1} K e(lambda c/d). In particular Phi_zeta(0) is non-zero, and a fixed power of it, with exponent independent of d, lies in F_n for n = d.

**Hypotheses and conventions.**

- f_{A,B,C} is modular for Gamma; gamma is an element of Gamma with lower row (c,d); n = d is the order of the root of unity produced.
- lambda = L(xi_A)/(4 pi^2) is rational, by the previous node.
- The exponent r of the power of Phi_zeta(0) that lies in F_n is bounded independently of d, because bounded powers of mu and of K lie in F_n.

**Proof outline.**

1. Apply the transport identity of HB.5a to rewrite the radial approach to 1 as a radial approach to zeta with parameter h/d.
2. Substitute the expansion at 1, improved by modularity, on the left, and the radial expansion of HB.4 at the root of unity zeta of order d on the right.
3. Cancel the exponential factors, which match because both are e^{L(xi_A)/(h d)} once the rationality of lambda is used to account for the phase e(lambda c/d).
4. Read off the constant terms and conclude the displayed formula for Phi_zeta(0).
5. Deduce non-vanishing, since mu, K and the phase are all non-zero, and deduce that a fixed power lies in F_n from the corresponding statements for mu and K.

**Acceptance.**

- For gamma = T the element gives c = 0 and d = 1, the identity is trivial and the conclusion is the statement at q = 1.
- For Gamma = SL(2,Z) and gamma = S the conclusion concerns the cusp 0, and d = 1 again.
- The conclusion fails without modularity: for a general Nahm sum there is no reason for Phi_zeta(0) to be non-zero, and CGZ Remark 7.3 records that it often vanishes.

**Prerequisites.** `HabiroNahmSeries:HB.5/expansion-at-one`, `HabiroNahmSeries:HB.5a/supplier-interface`, `HabiroNahmSeries:HB.4/simplified-form-and-the-unit`

**Sources.**

- `cgz`, Proof of Theorem 7.5, printed p. 40 — “and now comparing the asymptotic formulas (eq.nc2) and (eq.nahmEM) (with n=d), we find mu e^{L(xi_A)/hd} Phi(h) = e^{L(xi_A)/hd}(K e(lambda c/d) + O(h)) or Phi_zeta(0)=mu^{-1} K e(lambda c/d), with lambda in Q as above. This implies in particular that Phi_zeta(0) is not 0, and now, using that some bounded power of both mu and K belong to F_n, we deduce that Phi(0)^r belongs to F_n for ...” *(The comparison and both conclusions, verbatim.)*

### `torsion-from-unbounded-orders`

*lemma* — **An element of a finitely generated abelian group with unboundedly many divisibilities is torsion**

**Statement.** Let G be a finitely generated abelian group and let x be an element of G such that x lies in nG for infinitely many positive integers n. Then x is torsion. Equivalently, if the image of x in G/nG vanishes for an unbounded set of n, then the free part of x vanishes. The proof is the structure theorem: write G as the sum of a free part of finite rank and a finite torsion part, and observe that a non-zero element of the free part has a non-zero coordinate, which is divisible by only finitely many n.

**Hypotheses and conventions.**

- G is a finitely generated abelian group; the set of n for which x lies in nG is unbounded.
- The conclusion is that x is torsion, not that x vanishes; in the Bloch group of a number field the torsion is in general non-zero.
- Only divisibility by an unbounded family is needed, not by all n.

**Proof outline.**

1. Apply the structure theorem to write G as the direct sum of a free abelian group of finite rank and a finite group.
2. Project x to the free part and suppose the projection is non-zero, so some coordinate is a non-zero integer.
3. For each admissible n that coordinate is divisible by n, so its absolute value is at least n unless it vanishes; taking n larger than the absolute value gives a contradiction.
4. Conclude that the projection vanishes, so x lies in the finite torsion part.
5. Record the pinned ingredients: the structure theorem, the freeness of finitely generated torsion-free modules over a principal ideal domain, and the elementary divisibility bound.

**Acceptance.**

- In the integers, an element divisible by unboundedly many n is zero.
- In a finite group every element is torsion and the hypothesis is automatic.
- The hypothesis cannot be weakened to divisibility by a bounded set of n: 1 in the integers is divisible by 1, and is not torsion.

**Prerequisites.** `K3BlochGroups:V.5/k3-number-field`

**Sources.**

- `cgz`, Proof of Theorem 7.5, printed p. 41 — “Now Corollary 7.2 implies that the rth power of R_zeta(xi_A) has trivial image in F_n^*/F_n^{*n} for infinitely many n, and in view of the injectivity statement in Theorem 1.2 this proves that xi_A is a torsion element in the finitely generated group B(F).” *(The step of the proof that this lemma isolates, verbatim; the source states it in one sentence and the lemma makes the group-theoretic content explicit.)*

### `modularity-implies-torsion`

*theorem* — **Modularity implies that the Bloch class is torsion** · planet **Modularity implies Bloch torsion**

**Statement.** Let A be a symmetric positive definite rational matrix, B a rational vector and C a rational number, and let xi_A be the Bloch class of the distinguished solution in the Bloch group of the field F it generates. If f_{A,B,C} is a modular function, that is if its upper half-plane form is invariant under a subgroup of finite index of SL(2,Z), then xi_A is a torsion element of B(F). Equivalently, xi_A vanishes in the Bloch group of the algebraic numbers. This is the implication (c) implies (b) of Nahm's conjecture, and it is the only implication that is proved.

**Hypotheses and conventions.**

- A is an analytic Nahm datum with positive definite A; modularity is for a finite-index, not necessarily congruence, subgroup.
- The conclusion is torsion in B(F), where F is generated by the distinguished solution; it is not a statement about all solutions.
- The proof uses the injectivity statement of CGZ Theorem 1.2 for the unit map R_zeta, which is owned by HabiroNumberFields HB.1 and is imported here.

**Proof outline.**

1. Fix a finite-index subgroup Gamma for which the function is invariant, and shrink it by intersecting with Gamma(M) so that the denominators d avoid any fixed modulus.
2. For each element gamma of Gamma apply the comparison of expansions: Phi_zeta(0) is non-zero, and a fixed power of it lies in F_n for n = d.
3. Apply the unit corollary of HB.4 at each such n: the r-th power of R_zeta(xi_A) has trivial image in F_n modulo n-th powers.
4. Observe that the set of n obtained is unbounded, because Gamma contains elements with arbitrarily large lower-right entry once the group is of finite index and the congruence condition has been arranged.
5. Apply the injectivity statement of CGZ Theorem 1.2: the vanishing of the image of the unit for unboundedly many n forces the class to lie in n B(F) for those n.
6. Apply the finitely generated abelian group lemma to conclude that xi_A is torsion.

**Acceptance.**

- For A = (2) with the Rogers-Ramanujan data the conclusion is that xi_A is torsion, which is true and can be checked independently by the five-term certificates of K3BlochGroups V.6.
- For A = (8 5; 5 4) the theorem says nothing, because that Nahm sum is not modular; the class is nonetheless torsion, which is why the converse cannot be read off.
- The theorem does not assert the converse for a general A, and it does not turn the torsion of the class into a modularity test; both are recorded as non-conclusions.

**Prerequisites.** `HabiroNahmSeries:HB.5/comparison-of-expansions`, `HabiroNahmSeries:HB.5/torsion-from-unbounded-orders`, `HabiroNahmSeries:HB.4/unit-corollary-and-nonvanishing`, `HabiroNahmSeries:HB.3/bloch-class-of-a-solution`, `HabiroNahmSeries:HB.5a/supplier-interface`, `HabiroNumberFields:HB.1`

**Sources.**

- `cgz`, Theorem 7.5, printed p. 40 — “If f_{A,B,C}(tau) is a modular function, then xi_A in B(F_A) is a torsion element.” *(The theorem, verbatim.)*
- `cgz`, Theorem 1.8, printed p. 6 — “If the function f_{A,B,C}(tau) is modular for some A, B and C as above, then xi_A vanishes in the Bloch group of Qbar.” *(The introductory formulation, which the layer text asks be stated as well; it is equivalent to the above by the unique divisibility of the Bloch group of the algebraic numbers.)*

### `excluded-primes-and-hypotheses`

*lemma* — **The finitely many excluded primes, and the arithmetic hypotheses of the orders used**

**Statement.** Two finiteness statements make the argument legitimate. First, the radial expansion of HB.4 requires the order n of the root of unity to be odd and coprime to a denominator of the datum, so the orders that may be used are exactly those prime to a fixed integer; shrinking Gamma by intersecting with Gamma(M) for a suitable M arranges that every denominator d arising from an element of Gamma satisfies this. Second, the unit map and its injectivity statement exclude only the primes dividing a fixed exceptional integer coming from the Chern class comparison, which is a finite set. Hence the family of admissible orders is still unbounded, which is what the torsion argument needs.

**Hypotheses and conventions.**

- The datum has a fixed denominator; M is chosen to be twice that denominator times the exceptional integer.
- The exceptional integer is the one attached to the field F by the comparison between the Chern class and the unit map, and is owned by HabiroNumberFields HB.1.
- Unboundedness of the admissible family is a statement about the finite-index subgroup Gamma intersected with Gamma(M), and holds because that group is still of finite index.

**Proof outline.**

1. Fix the denominator of the datum and the exceptional integer of the field, and set M to be their product times 2.
2. Intersect Gamma with Gamma(M) and record that the result still has finite index.
3. Prove that every element of the intersection has lower-right entry congruent to 1 modulo M, hence coprime to M, so that its denominator is admissible.
4. Prove that the set of such denominators is unbounded, since the subgroup contains elements with arbitrarily large entries.
5. Record the two finite sets explicitly: the primes dividing the denominator of the datum, and the primes dividing the exceptional integer.

**Acceptance.**

- For an integral A and B with 2B congruent to the diagonal of A modulo 2, the denominator is 1 and only the exceptional integer matters.
- For A with denominator 2 the even orders are excluded, and the odd ones remain unbounded.
- If the excluded set were infinite the argument would fail; the lemma is exactly the statement that it is not.

**Prerequisites.** `HabiroNahmSeries:HB.5/modularity-implies-torsion`, `HabiroNahmSeries:HB.5a/cusp-width`, `HabiroNumberFields:HB.1`

**Sources.**

- `cgz`, Proof of Theorem 7.5, printed pp. 40 to 41 — “We can also assume that d is prime to M for any fixed integer M, since by intersecting Gamma with the full congruence subgroup Gamma(M), we may assume that Gamma is contained in Gamma(M). This shows that there are infinitely many integers n and primitive nth roots of unity zeta for which Phi_zeta(0)^r in Theorem 7.1 is a non-zero element of F_n.” *(The argument, verbatim.)*
- `cgz`, Theorem 7.1, the hypothesis, printed p. 37 — “Let n be a positive integer coprime to the denominator of A and B.” *(The arithmetic hypothesis on the admissible orders, verbatim.)*

### `boundaries-of-the-implication`

*application* — **What this layer does not prove**

**Statement.** Four statements are explicitly not proved and must not be inferred. First, the converse implication from the vanishing of the Bloch class to modularity is not proved for general A, and CGZ record that it does not even have a sufficiently precise formulation. Second, the torsion of the class is not a modularity test: A = (8 5; 5 4) has a torsion class and is not modular. Third, the theorem is for modular FUNCTIONS of weight zero; the apparently more general modular-form statement reduces to it, and the reduction, not an independent proof, is what covers it. Fourth, the generality of a finite-index subgroup is part of the theorem, and replacing it by a congruence subgroup would prove a weaker statement; the expectation that a modular Nahm sum is automatically modular for a congruence subgroup rests on an unbounded-denominator conjecture and is not used anywhere.

**Hypotheses and conventions.**

- The four items are statements about the theorem, and each is recorded with the place in the source that says so.
- The second item uses the counterexample of the conjecture node and no new mathematics.
- The third item uses the reduction recorded in CGZ Remark 7.7.

**Proof outline.**

1. State each of the four non-conclusions and attach to each the source passage that records it.
2. For the second, exhibit the counterexample matrix and its torsion class, which HB.10 computes.
3. For the third, record the reduction: a modular form of non-zero rational weight k would contribute an extra factor h^{-k} to the expansion at 1, which is impossible, so a modular Nahm sum is a modular function.
4. For the fourth, record that no step of the proof uses a congruence hypothesis, which is verifiable by inspecting the prerequisites of each node of the proof.

**Acceptance.**

- The implication proved is (c) implies (b) and nothing more.
- A future layer that wants the converse must state it as a conjecture with its own source, not as a consequence of this one.
- A statement of the form the Bloch class is torsion therefore the Nahm sum is modular is false as stated, by the counterexample.

**Prerequisites.** `HabiroNahmSeries:HB.5/modularity-implies-torsion`, `HabiroNahmSeries:HB.5/nahm-conjecture-statement`

**Sources.**

- `cgz`, Remark 7.7, printed p. 41 — “Conversely, we could have stated Theorem 7.5 in an apparently more general form by writing modular form instead of modular function. We did not do this since it is easy to see that if a Nahm sum is modular at all, it is actually a modular function, because if it were a modular form of non-zero rational weight k, there would be an extra factor h^{-k} in the right-hand side of (eq.nc2).” *(The third item, verbatim.)*
- `cgz`, Section 1.3, printed p. 5 — “This relation conjecturally goes in both directions, but with the implication from the vanishing of the Bloch elements to the modularity of certain Nahm sums not yet having a sufficiently precise formulation to be studied.” *(The first item, verbatim.)*

### `valuation-bound-at-every-cusp`

*theorem* — **The valuation of a modular Nahm sum at every cusp is bounded below by the regulator**

**Statement.** Suppose the Nahm sum f_Q is modular, and for a rational point P of the projective line define its valuation v_P(f_Q) as the smallest exponent of q in the Fourier expansion of f_Q transported to infinity by an element of SL(2,Z) sending infinity to P; this is independent of the choice. Put C_0(A) = -Lambda(xi_A)/(2 pi)^2 with the Garoufalidis-Zagier normalisation of the Rogers dilogarithm. Then v_P(f_Q) is at least C_0(A) for every rational P, with equality at P = 0. In particular, at P = infinity the valuation is the minimum of Q over the non-negative integer vectors, so that minimum is at least C_0(A); and when the quadratic part is non-negative on that set, which holds for every modular triple of rank at most three in the literature, the valuation at infinity is C itself, so C is at least C_0(A).

**Hypotheses and conventions.**

- f_Q is modular for a finite-index subgroup; P is a rational point or infinity; the valuation is defined through any element of SL(2,Z) carrying infinity to P.
- C_0(A) is a rational multiple of pi squared divided by (2 pi)^2, hence rational, by the modularity; this is the same rationality used in the main proof.
- The observed equality C = C_0(A) exactly when B vanishes is an empirical statement of the source and is recorded as such, not as a theorem.

**Proof outline.**

1. Fix P = a/c in lowest terms and an element of SL(2,Z) with lower row (c,d); parametrise the radial approach by tau = (i/epsilon - d)/c.
2. Compute the transported value and expand it by the Fourier expansion at the cusp, obtaining an asymptotic with exponential rate the valuation.
3. Compute the same quantity by the radial expansion of HB.4 at the root of unity of order c, obtaining an exponential rate C_0(A) with a constant that may vanish.
4. Compare: since the second constant may vanish, the comparison gives an inequality in general.
5. At P = 0 the constant of the radial expansion is non-zero, by the non-vanishing at q = 1, so the comparison gives equality.
6. Specialise to P = infinity and identify the valuation with the minimum of Q, and record the consequence for C under the extra positivity hypothesis.

**Acceptance.**

- For the two Rogers-Ramanujan triples the inequality is an equality at infinity and C is the recorded rational number.
- The inequality can be strict at a cusp where the expansion vanishes identically, which is exactly the phenomenon of CGZ Remark 7.3.
- The converse of the observed equality criterion is false: the source records modular triples with non-integral A for which C equals C_0(A), so integrality and evenness of A is sufficient and not necessary.

**Prerequisites.** `HabiroNahmSeries:HB.5/comparison-of-expansions`, `HabiroNahmSeries:HB.5a/radial-growth-at-a-cusp`, `HabiroNahmSeries:HB.4/radial-asymptotic-expansion`, `HabiroNahmSeries:HB.3/embeddings-and-regulator-evaluations`

**Sources.**

- `gz`, Proposition 7.1, equation (eq.VC), with its proof — “If f_Q(tau) is modular, then for every P in P^1(Q) we have v_P(F_Q) >= C_0(A) with equality when P=0. ... A comparison between (eq.fas1) and (eq.fas2) implies inequality (eq.VC). When P=0, i.e., zeta=1, Theorem 3.1 asserts that C'' is not 0. In that case, (eq.fas1) and (eq.fas2) imply equality in (eq.VC).” *(The proposition and its proof, verbatim.)*
- `gz`, Section 7, after Proposition 7.1, equation (eq.CC0) — “As a special case of the proposition, for P=infinity it follows that v_infinity(f_Q) = min_{n in Z^N_{>=0}} (Q(n)) >= C_0(A) whenever f_Q is modular. If in addition (1/2) n^t A n + n^t B >= 0 for all n, then v_infinity(f_{A,B,C})=C and we deduce that C >= C_0(A). Moreover, in all cases observed, the equality C=C_0(A) holds if and only if the vector B is zero, and this value occurs ...” *(The consequence at infinity and the empirical criterion, verbatim.)*
- `gz`, Section 7, the definition of a modular function — “First, by modular function we will always mean a function invariant under a subgroup of finite index of SL(2,Z). (We do not have to assume that this subgroup is a congruence subgroup ... although in the case of Nahm sums, which always have an expansion in rational powers of q with integral coefficients, a well-known conjecture implies that if they are modular at all then they are in fact ...” *(The same generality as CGZ, stated independently in the second source.)*

---

## HB.8. Admissibility and integrality: GSWZ Theorem 6

**Coverage: source_decomposed.** 17 nodes.

Seventeen nodes, decomposed from GSWZ Sections 1.6, 1.7 and 2 read in full. Admissible series by their logarithmic coefficients with the integrality of the Laurent polynomials as the content; the product expansion with the Donaldson-Thomas exponents and the equivalence with finite support; the expansion at a root of unity with the potential, the discriminant and the constants, and the three recognition statements; the Dwork quotient; the series F_A with its q-difference system and its reflection; the t-deformed equations with the ring S, its level m variants and the discriminant, and with the source's index slip corrected; the potential-pole lemma; Theorem 6 with its Riccati-and-contradiction proof, which is the elementary route and does not import a general Donaldson-Thomas integrality theorem; level m admissible series with the Moebius product identity; Theorem 7 and the level m Dwork lemma; the formal Gaussian collection with the regularised Pochhammer factors, the periodicity and the equi-peakedness; the coefficient lemma with the cyclic-dilogarithm identity proved directly rather than through the Dedekind eta multiplier system; the q-difference system for the Gaussian side; the identification Theorem 8 with Theorem 3 and the equality of the three series; the WKB route to algebraicity; the corollary that the potential determines the matrix; and the rank one acceptance case with its tables.

**Planets (6):** *Admissible series*, *The series F_A*, *Finite support of the DT exponents*, *Level m admissible series*, *Formal Gaussian integration series*, *Admissible equals Gaussian*.

### `admissible-series`

*definition* — **Admissible series** · planet **Admissible series**

**Statement.** For a positive integer N and variables t = (t_1,...,t_N), an admissible series is a power series F(t,q) over the rational function field in q with F(t,q) = 1 + O(t) whose logarithm has the form log F(t,q) = minus the sum over non-zero n in the non-negative integer vectors and over l at least 1 of L_n(q^l) t^{l n}/(l (1 - q^l)), where each L_n(q) is a LAURENT POLYNOMIAL with integer coefficients. The integrality of the L_n is the whole content: the displayed shape with L_n merely a rational function imposes nothing.

**Hypotheses and conventions.**

- N is a positive integer; the coefficient ring is the field of rational functions in q over the rationals, and t^{ln} means the product of the t_i^{l n_i}.
- The condition F = 1 + O(t) makes the logarithm defined as a formal power series in t.
- The Laurent polynomials L_n(q) are uniquely determined by F, by inverting the displayed relation degree by degree in t.

**Proof outline.**

1. Define the logarithm of a power series with constant term 1 over a Q-algebra.
2. Prove that for any such F there exist unique rational functions L_n(q) satisfying the displayed identity, by induction on the total degree in t.
3. Define admissibility as the assertion that every L_n is a Laurent polynomial with integer coefficients.
4. Prove that the admissible series form a group under multiplication, since the L_n add.
5. Prove the involution property: F(t,q) is admissible exactly when F(t,q^{-1}) is admissible.

**API.**

| name | role | statement |
| --- | --- | --- |
| `Admissible` | data | The predicate that a power series is admissible. |
| `Admissible.L` | projection | The Laurent polynomials L_n attached to an admissible series. |
| `Admissible.L_unique` | characterisation | The L_n are uniquely determined by the series. |
| `Admissible.mul` | constructor | The product of admissible series is admissible, with L adding. |
| `Admissible.inv` | constructor | The inverse of an admissible series is admissible. |
| `Admissible.qInv` | characterisation | Admissibility is preserved by inverting q. |
| `Admissible.pochhammer` | example | The infinite Pochhammer symbol is admissible. |

**Where and how it is used.**

- *The product expansion.* Admissibility is equivalent to the existence of the integral product expansion with finite support, which is the form in which Kontsevich and Soibelman state it.
- *HB.8, the finite-support theorem.* The theorem asserts that the q-hypergeometric series F_A is admissible in exactly this sense.
- *HB.9.* The Frobenius congruence is proved for admissible and for level m admissible series, and the integrality of the L_n is what drives it.

**Unit tests.**

- `pochhammer_admissible` — The infinite Pochhammer symbol is admissible with L_1 = 1.
- `product_admissible` — The product of two admissible series is admissible.
- `qinv_admissible` — If F is admissible then so is F with q inverted.
- `rational_L_not_admissible` — A series with L_1(q) = 1/(1-q) satisfies the displayed shape but is not admissible.

**Acceptance.**

- The series (t;q)_infinity is admissible with L_1(q) = 1 and L_n = 0 for n > 1, by the logarithmic expansion of the infinite Pochhammer symbol.
- The product of two admissible series is admissible, and every integral power of an admissible series is admissible.
- A series whose L_1(q) is 1/(1-q) is not admissible, although the displayed shape can be satisfied with that rational function; this is the non-example that shows integrality is the content.

**Prerequisites.** `HabiroNahmSeries:HB.4/q-pochhammer-symbols`, `mathlib:PowerSeries`, `mathlib:MvPowerSeries`, `mathlib:PowerSeries.log`, `mathlib:LaurentPolynomial`, `HabiroCyclotomicCompletions:HC.1`

**Sources.**

- `gswz`, Definition 1.7 — “For N in Z_{>0} and t=(t_1,...,t_N), an admissible series is a power series F(t,q) in Q(q)[[t]] satisfying F(t,q)=1+O(t) and log F(t,q) = -sum_{0 != n in (Z_{>=0})^N} sum_{l >= 1} L_n(q^l) t_1^{l n_1} ... t_N^{l n_N}/(l(1-q^l)), where L_n(q) in Z[q^{pm 1}].” *(The definition, verbatim.)*
- `gswz`, Section 2.2, equation (Fqqi) — “F(t,q) is admissible if and only if F(t,q^{-1}) is admissible.” *(The involution, verbatim.)*

### `product-expansion-and-dt-exponents`

*theorem* — **The product expansion and the Donaldson-Thomas exponents**

**Statement.** Every power series F(t,q) over the Laurent series field in q with F(0,q) = 1 has a unique expansion as a product over non-zero n and over integers i of (q^i t^n; q)_infinity^{c_{n,i}} with integer exponents c_{n,i}, where for each n the exponents vanish for all sufficiently negative i. The series is admissible exactly when, for each fixed n, only finitely many c_{n,i} are non-zero, and in that case L_n(q) = sum_i c_{n,i} q^i. The exponents are the generalised Donaldson-Thomas invariants.

**Hypotheses and conventions.**

- F lies in the Laurent series ring in q over the integers, tensored with power series in t, and F(0,q) = 1.
- The support condition for sufficiently negative i is automatic; the finiteness on the positive side is what admissibility adds.
- The equivalence uses the logarithmic expansion of the infinite Pochhammer symbol and nothing else.

**Proof outline.**

1. Prove existence and uniqueness of the c_{n,i} by induction on the total degree of the monomial q^i t^n, dividing out one Pochhammer factor at a time.
2. Take the logarithm of the product and apply the expansion log (t;q)_infinity = minus the sum over l of t^l/(l(1-q^l)) to each factor.
3. Compare with the definition of admissibility to obtain L_n(q) = sum_i c_{n,i} q^i as an identity of rational functions.
4. Conclude that L_n is a Laurent polynomial exactly when the sum is finite.
5. Record the corresponding product formulas for the ratio G(t,q) = F(qt,q)/F(t,q) and the symmetrisation F(t,q)F(t,q^{-1}), both of which are integral, with the exponents made explicit.

**Acceptance.**

- For the infinite Pochhammer symbol itself the only non-zero exponent is c_{1,0} = 1.
- For the rank one series of A = (3) the exponents are non-zero exactly for 3n+1 at most i at most n^2+n+1, with the exception c_{1,3} = 1, and they are non-negative.
- A series with c_{n,i} non-zero for infinitely many i for some n has a well-defined product expansion and is not admissible; this is the boundary the theorem draws.

**Prerequisites.** `HabiroNahmSeries:HB.8/admissible-series`, `HabiroNahmSeries:HB.4/q-pochhammer-symbols`, `mathlib:ArithmeticFunction.moebius`, `QSeriesPartitionsAndMockModularForms:QM.0`

**Sources.**

- `gswz`, Section 1.6, after Definition 1.7, equation (defgamma) — “An equivalent way to describe admissible series is via their factorisation into Pochhammer symbols. In particular, a series F(t,q) is admissible if and only if the unique integers c_{n,i} (generalised Donaldson-Thomas invariants), defined by the equality F(t,q) = prod_{0 != n} prod_{i in Z} (q^i t^n;q)_infinity^{c_{n,i}}, vanish for all but finitely many i for each fixed n. ... The ...” *(The theorem, verbatim.)*
- `gswz`, Section 2.2, equations (GSdef) and (GS2) — “G(t,q) = F(qt,q)/F(t,q), F^sym(t,q) = F(t,q) F(t,q^{-1}) are integral i.e., both lie in Z[q^{pm 1}][[t]].” *(The two integral consequences of the product expansion, verbatim.)*

### `expansion-at-roots-of-unity`

*construction* — **Expanding an admissible series at a root of unity: the potential, the discriminant and the constants**

**Statement.** For an admissible series F and each positive integer m, set Phi_m(t,x) = F(t^{1/m}, zeta_m + x). Then Phi_m lies in exp(V(t)/(m^2 log(1 + x/zeta_m))) times delta(t)^{-1/2} times U_m(t) times (1 + x t^{1/m} times power series), where V(t) = sum_n L_n(1) Li_2(t^n) is the potential, delta(t) is the exponential of an explicit combination of L_n(1) and L_n'(1) against Li_1, and U_m(t) is the explicit constant recorded in the source. The rescaling of t by an m-th root is forced: the residue of the logarithm at zeta_m is V(t^m)/m^2, so without it the expansion is not a power series in t.

**Hypotheses and conventions.**

- F is admissible with Laurent polynomials L_n; m is a positive integer and zeta_m a primitive m-th root of unity; x is the local coordinate q = zeta_m + x.
- V, delta and U_m are power series in t over the rationals, with V(0) = 0, delta(0) = 1 and U_m(0) = 1.
- The statement is an identity of formal Laurent series in x with coefficients power series in t^{1/m} over the m-th cyclotomic field.

**Proof outline.**

1. Compute the residue at q = zeta_m of the logarithm of F: only the terms with l divisible by m contribute, and their residue is minus L_n(1) zeta_m/l^2, whose sum is V(t^m)/m^2.
2. Record that this forces the rescaling t to t^{1/m}, which is the reason the collection is indexed by the m-th roots.
3. Compute the constant term of the x-expansion by separating the terms with m dividing l from the rest, obtaining the delta and U_m contributions respectively; the first uses the expansion of L_n(q^l)/(l(1 - q^l)) to order x^0 and the second the value of L_n at the non-trivial m-th roots of unity.
4. Assemble the three contributions into the displayed form.
5. Prove the recognition statements: V determines the L_n(1); V, delta and all the U_m together determine F; and a single Phi_m determines F.

**API.**

| name | role | statement |
| --- | --- | --- |
| `admissibleExpansion` | data | The collection Phi_m of expansions of an admissible series at the roots of unity. |
| `potential` | data | The potential V(t) of an admissible series. |
| `discriminantSeries` | data | The series delta(t). |
| `constantSeries` | data | The series U_m(t) for each m. |
| `admissibleExpansion_shape` | characterisation | The displayed shape of the expansion. |
| `potential_determines_values` | characterisation | V determines the values L_n(1) and conversely. |
| `expansion_determines_series` | characterisation | A single Phi_m determines F. |

**Where and how it is used.**

- *HB.8, the identification theorem.* The theorem is the statement that this collection agrees with the one produced by formal Gaussian integration, and the recognition statements are how the comparison is organised.
- *HB.9.* The Habiro-module membership is a statement about exactly this collection specialised at t = 1.
- *HB.8, the finite-support theorem.* The proof compares the residue at a root of unity computed in two ways, which is possible only because of this construction.

**Unit tests.**

- `pochhammer_potential` — For the infinite Pochhammer symbol the potential is Li_2(t).
- `constant_term_one` — Phi_m(0,x) = 1 for every m.
- `recognition` — Two admissible series with the same Phi_1 are equal.
- `rescaling_needed` — Without the rescaling of t the coefficient of x^{-1} is V(t^m)/m^2, which is not the potential of the series.

**Acceptance.**

- For F the infinite Pochhammer symbol, V(t) = Li_2(t) and the expansion is the classical one.
- The recognition statement is sharp: V alone does not determine F, since it sees only the values L_n(1).
- The rescaling cannot be dropped: without it the coefficient of x^{-1} is V(t^m)/m^2 as a series in t and the identification with the FGI series fails.

**Prerequisites.** `HabiroNahmSeries:HB.8/admissible-series`, `HabiroNahmSeries:HB.8/product-expansion-and-dt-exponents`, `Polylogarithms:P.1/classical-polylogarithm`, `HabiroCyclotomicCompletions:HC.2`

**Sources.**

- `gswz`, Lemma 2.3, equation (Phiexp) — “Phi_m(t,x) is in exp(V(t)/(m^2 log(1+x/zeta_m))) delta(t)^{-1/2} U_m(t) (1 + x t^{1/m} Q[zeta_m][[t^{1/m}]][[x]]), Phi_m(0,x) = 1.” *(The statement, verbatim.)*
- `gswz`, Proof of Lemma 2.3 — “This explains the need for the rescaling t to t^{1/m} in order to match with equation (Phiexp). The remaining terms of (logF) can be expanded into power series in t^{1/m} with coefficients in Q[zeta_m].” *(The reason for the rescaling, verbatim.)*
- `gswz`, Corollary 2.4 — “(a) V^{(1)}=V^{(2)} if and only if L_n^{(1)}(1)=L_n^{(2)}(1) for all n. (b) F^{(1)}=F^{(2)} if and only if V, delta and U_m agree for all m. (c) F^{(1)}=F^{(2)} if and only if Phi^{(1)}_m = Phi^{(2)}_m for some (and hence for every) m.” *(The three recognition statements, verbatim.)*

### `dwork-quotient-admissible`

*lemma* — **The Dwork-type quotient of an admissible series is p-integral**

**Statement.** If F is admissible then for every prime p and every positive integer m not divisible by p, the difference log F(t^{p/m}, q^p) - p log F(t^{1/m}, q), expanded at q = zeta_m + x, lies in (p/x) times the p-local power series ring in t^{1/m} and x over the m-th cyclotomic integers. The proof is one line from the definition: the logarithm of F(t^p,q^p)/F(t,q)^p is p times the sub-sum of the defining series over the l prime to p, and every term of that sub-sum is p-integral after expansion at a root of unity of order prime to p.

**Hypotheses and conventions.**

- F is admissible; p is a prime and m is prime to p; the expansion is at q = zeta_m + x.
- The conclusion has a single power of x in the denominator, coming from the residue term; this is the strong integrality the source emphasises.
- The statement is about the logarithm, not about F itself, and is the exact shape of the gluing condition of the Habiro modules.

**Proof outline.**

1. Subtract p times the defining series from the series with t and q raised to the power p, and observe that the terms with l divisible by p cancel.
2. Record the resulting identity: the difference is p times the sum over l prime to p of L_n(q^l) t^{ln}/(l(1-q^l)).
3. Expand at q = zeta_m + x with m prime to p; each term has at most a simple pole in x and p-integral coefficients.
4. Conclude the stated membership.

**Acceptance.**

- For the infinite Pochhammer symbol this is the classical Dwork congruence for its logarithm.
- The hypothesis that m is prime to p cannot be dropped: at a root of unity of order divisible by p the terms with l divisible by p also contribute a pole.
- The conclusion fails for a non-admissible series with the same shape but rational L_n, since the coefficients are then not p-integral.

**Prerequisites.** `HabiroNahmSeries:HB.8/admissible-series`, `HabiroNahmSeries:HB.8/expansion-at-roots-of-unity`

**Sources.**

- `gswz`, Lemma 2.5, equation (dphiA1) — “If F(t,q) is admissible, then for all primes p and positive integers m not divisible by p we have log(F(t^{p/m},q^p)) - p log(F(t^{1/m},q)) in (p/x) Z_{(p)}[t^{1/m},zeta_m][[t,x]], q = zeta_m + x.” *(The statement, verbatim.)*
- `gswz`, Section 2.2, equation (admis.dwork) — “log(F(t^p,q^p)/F(t,q)^p) = p sum_{0 != n} sum_{l>0, (p,l)=1} L_n(q^l) t^{ln}/(l(1-q^l)). Expanding near q=zeta_m+x as in (Phidef) with (m,p)=1, we see that the left-hand side, even after division by p, is p-integral. (This strong integrality property will be important.)” *(The whole proof, verbatim.)*

### `series-F-A`

*construction* — **The q-hypergeometric series F_A and its q-difference system** · planet **The series F_A**

**Statement.** For a symmetric integral N by N matrix A define F_A(t,q) as the sum over non-negative integer vectors n of (-1)^{diag(A).n} q^{(n^t A n + diag(A).n)/2} t^n divided by the product of the (q;q)_{n_j}. It satisfies the linear q-difference system F_A(t,q) - F_A(sigma_j t, q) = (-1)^{A_jj} t_j q^{A_jj} F_A(prod_i sigma_i^{A_ij} t, q) for j = 1,...,N, where sigma_j multiplies t_j by q, and this system together with F_A(0,q) = 1 determines F_A uniquely. It also satisfies the reflection F_A(t,q) = F_{I-A}(t,q^{-1}).

**Hypotheses and conventions.**

- A is symmetric with integer entries; no positivity is assumed, and the series is a formal object in the Laurent series field in q.
- The sign (-1)^{diag(A).n} and the half-integral exponent are part of the normalisation; the exponent is an integer because n^t A n + diag(A).n is even for integral symmetric A.
- The congruence variants F_{A,m,k}, obtained by restricting n to a class modulo m, are defined in the level m node and are not the same series.

**Proof outline.**

1. Define the summand and prove that the exponent is an integer.
2. Prove the q-difference system from the Pochhammer recursion (q;q)_{n+1} = (1 - q^{n+1})(q;q)_n.
3. Prove that the system with the initial condition has a unique solution in the formal power series ring, by extracting the coefficient of each monomial in t.
4. Prove the reflection identity from the elementary identity (q^{-1};q^{-1})_n = (-1)^n q^{-n(n+1)/2} (q;q)_n.
5. Record the ratio G_j(t,q) = F_A(sigma_j t, q)/F_A(t,q) and the Riccati system it satisfies, which is what the finite-support proof uses.

**API.**

| name | role | statement |
| --- | --- | --- |
| `seriesFA` | data | The series F_A(t,q) attached to a formal Nahm datum. |
| `seriesFA_zero` | simp | F_A(0,q) = 1. |
| `seriesFA_qdiff` | characterisation | The q-difference system. |
| `seriesFA_unique` | universal-property | The system with the initial condition determines the series. |
| `seriesFA_reflect` | characterisation | The reflection F_A(t,q) = F_{I-A}(t,q^{-1}). |
| `seriesFA_ratio` | data | The ratios G_j(t,q) and the Riccati system they satisfy. |
| `seriesFA_ratio_integral` | characterisation | The ratios have Laurent polynomial coefficients. |

**Where and how it is used.**

- *HB.8, the finite-support theorem.* The theorem is about exactly this series, and its proof runs through the Riccati system for the ratios.
- *HB.9.* The Frobenius congruence and the module membership are statements about the congruence variants of this series.
- *HB.10.* The worked examples compute this series for explicit small matrices.

**Unit tests.**

- `rank_one_three` — For A = (3) the series is the displayed sum and satisfies F(t,q) - F(qt,q) + q^3 t F(q^3 t,q) = 0.
- `zero_matrix` — For A = 0 the series is the reciprocal of the infinite Pochhammer symbol in t.
- `constant_term` — The coefficient of t^0 is 1.
- `reflection` — For A = (3) the reflection identity gives F_{(3)}(t,q) = F_{(-2)}(t,q^{-1}).

**Acceptance.**

- For N = 1 and A = (3) the series is the sum over k of (-1)^k q^{3k(k+1)/2} t^k/(q;q)_k, and the q-difference equation is F(t,q) - F(qt,q) + q^3 t F(q^3 t,q) = 0.
- For A the zero matrix the series is the reciprocal of the infinite Pochhammer symbol in t, by Euler's identity.
- The specialisation t = (-1)^{diag A} q^b turns F_A into the Nahm sum with linear term b, which is how the formal theory bears on HB.4.

**Prerequisites.** `HabiroNahmSeries:HB.3/nahm-data`, `HabiroNahmSeries:HB.4/q-pochhammer-symbols`, `HabiroNahmSeries:HB.8/admissible-series`, `mathlib:MvPowerSeries`, `HabiroCyclotomicCompletions:HC.1`

**Sources.**

- `gswz`, Section 1.6, equation (FAdef) — “F_A(t,q) = sum_{n in Z^N_{>=0}} (-1)^{diag(A).n} q^{(n^t A n + diag(A).n)/2} t_1^{n_1} ... t_N^{n_N}/((q;q)_{n_1} ... (q;q)_{n_N})” *(The definition, verbatim.)*
- `gswz`, Section 1.7, equation (PhiAshift) — “F_A(t,q) - F_A(sigma_j t,q) = (-1)^{A_{j,j}} t_j q^{A_{j,j}} F_A(prod_{i=1}^N sigma_i^{A_{i,j}} t, q), j=1,...,N, where sigma_j t shifts t_j to q t_j and keeps t_{j'} for j' != j fixed.” *(The q-difference system, verbatim.)*
- `gswz`, Section 2.3, equation (FAqqi) — “F_A(t,q) = F_{I-A}(t,q^{-1}), which follows easily from the sum definition of F_A(t,q), equation (FAdef) and the elementary fact that (q^{-1};q^{-1})_n = (-1)^n q^{-n(n+1)/2}(q;q)_n.” *(The reflection identity with its proof, verbatim.)*

### `t-deformed-nahm-equations`

*construction* — **The t-deformed Nahm equations, the ring S and the discriminant**

**Statement.** Setting q = 1 and replacing the shift operators by unknowns z_j(t) turns the q-difference system into the t-deformed Nahm equations 1 - z_j(t) = (-1)^{A_jj} t_j product_i z_i(t)^{A_ij} with z(0) = 1. They have a unique solution in formal power series with integer coefficients, given by an explicit hypergeometric series; in rank one, with 1 - z = t(-z)^A, the solution is the sum over k of (-1)^{(A+1)k} binom(Ak,k) t^k/((A-1)k+1). They define the ring S obtained from the Laurent polynomial ring in t, z and the inverse square root of the discriminant delta(t) = product_j z_j(t)^{-A_jj} det(diag(1-z(t)) A + diag(z(t))) by the equations, which after inverting 2 is an etale algebra over the polynomial ring in t; and its level m variants S^{(m)}, which adjoin a primitive m-th root of unity and m-th roots of the t.

**Hypotheses and conventions.**

- A is a formal Nahm datum; the equations are read in the ring of formal power series in t with the sign convention of GSWZ.
- The printed form of the equations in the source has an index slip, writing z_j in the product where the exponent A_ij requires z_i; the corrected form is the one used everywhere here, and the slip is recorded in the gaps.
- delta(0) = 1, so the inverse square root makes sense as a power series after adjoining a formal square root.

**Proof outline.**

1. Solve the equations degree by degree in t, obtaining a unique power series solution with z(0) = 1, and prove that its coefficients are integers.
2. Record the closed hypergeometric form in rank one and its consequences for z^s and for log z, quoting Rodriguez Villegas.
3. Define delta(t) by the displayed determinant and prove delta(0) = 1.
4. Define S by generators and relations, and prove that after inverting 2 it is an etale algebra over the polynomial ring in t, using that delta is the Jacobian determinant of the system.
5. Define S^{(m)} and record the Galois action sending an m-th root of z_j to its multiple by zeta_m, which is the action that all the invariance statements of this layer use.
6. Record the specialisation t = 1, which is the ring R[delta^{-1/2}] of HB.3 and the coefficient ring of GSWZ Theorem 5.

**API.**

| name | role | statement |
| --- | --- | --- |
| `tNahmSolution` | data | The unique power series solution z(t) with z(0) = 1. |
| `tNahmSolution_integral` | characterisation | Its coefficients are integers. |
| `tNahmSolution_spec` | characterisation | It satisfies the t-deformed equations. |
| `discriminant` | data | The discriminant delta(t). |
| `discriminant_zero` | simp | delta(0) = 1. |
| `ringS` | data | The ring S and its level m variants. |
| `ringS_etale` | characterisation | After inverting 2 the ring S is etale over the polynomial ring in t. |
| `ringS_galois` | structure | The Galois action multiplying the m-th roots of z by roots of unity. |
| `ringS_specialise` | functoriality | The specialisation t = 1 onto the ring of HB.3. |

**Where and how it is used.**

- *HB.8, the FGI collection.* The coefficients of the formal Gaussian integrals lie in S^{(m)}, which is the point of introducing the ring.
- *HB.9.* The Frobenius congruence is an assertion about membership in a module over the p-completion of S^{(m)}.
- *HB.3.* Specialising t = 1 recovers the Nahm equations and the ring R[delta^{-1/2}] over which the Bloch class is defined.

**Unit tests.**

- `rank_one_three_solution` — For A = (3) the first coefficients of z(t) are 1, 1, 3, 12, 55, 273.
- `zero_matrix_solution` — For A = 0 the solution is z_j = 1 - t_j and delta = 1.
- `discriminant_series` — For A = (3) the first coefficients of delta(t) are 1, -5, -3, -10, -42.
- `specialisation_at_one` — Specialising t = 1 in the equations gives the Nahm equations in the GSWZ sign convention.

**Acceptance.**

- For A = (3) the equation is 1 - z = -t z^3, with z(t) = 1 + t + 3t^2 + 12t^3 + 55t^4 + ... and delta(t) = -2t - t/(1-z(t)) = 1 - 5t - 3t^2 - 10t^3 - ...
- For A = 0 the equation is 1 - z_j = t_j, so z_j = 1 - t_j and delta = 1.
- The solution z(t) is an algebraic function with three singularities, at t = 0, at infinity and at (-1)^A (A-1)^{A-1}/A^A in rank one; it is not a rational function, so the ring S is a genuine extension.

**Prerequisites.** `HabiroNahmSeries:HB.8/series-F-A`, `HabiroNahmSeries:HB.3/nahm-equations`, `HabiroNahmSeries:HB.3/algebraicity-and-the-nahm-field`, `mathlib:PowerSeries`, `mathlib:Matrix.det`, `mathlib:Polynomial.cyclotomic`

**Sources.**

- `gswz`, Section 1.7, equations (zjt), (Sdef), (taulambda), (RA) — “1-z_j(t) = (-1)^{A_{j,j}} t_j prod_{i=1}^N z_j(t)^{A_{i,j}}, j=1,...,N, z_j(0)=1. These equations in turn define the ring S = Z[t^{pm 1}, z^{pm 1}(t), delta(t)^{-1/2}]/(1-z(t)-(-1)^A t z(t)^A) ... delta(t) := prod_j z_j(t)^{-A_jj} det(diag(1-z(t)) A + diag(z(t))) is the discriminant of the t-deformed Nahm equations, so that (after inverting 2) S is an etale Z[t]-algebra. ... S^{(m)} = ...” *(The equations, the two rings and the discriminant, verbatim; the inner index of the product is the recorded erratum.)*
- `gswz`, Section 2.3, equations (zA) and (zAs) — “in the rank one case when A in Z, the unique solution of the equation 1-z=t(-z)^A in Z[[t]] with z(0)=1 is given by the hypergeometric series z(t) = sum_k (-1)^{(A+1)k} binom(Ak,k) t^k/((A-1)k+1) (as follows from Lagrange inversion)” *(The closed form in rank one, verbatim.)*

### `potential-pole-lemma`

*lemma* — **The potential controls the pole of the logarithm at every root of unity**

**Statement.** For every symmetric integral A there is a power series V_A(t) over the rationals such that for every positive integer m, log F_A(t, zeta_m + x) equals zeta_m V_A(t^m)/(m^2 x) plus a term of order zero in x. The same holds for the congruence variants F_{A,m,k} with the same V_A. The proof is deferred to the identification theorem, from which both follow by the explicit formula for the formal Gaussian integrals; alternatively it follows from the q-difference equations by the WKB algorithm.

**Hypotheses and conventions.**

- A is a formal Nahm datum; the expansion is at q = zeta_m + x for each m; the potential is a single series independent of m and of the congruence class.
- V_A is effectively computable and is given in closed form by the critical value of the exponent of the Gaussian integral.
- The lemma is stated before the identification theorem and proved after it; the order of the exposition is the source's own.

**Proof outline.**

1. State the lemma and record its two proofs, through the identification theorem and through the WKB algorithm.
2. Record the closed formula V_A(t) = minus the sum over j of Li_2(1 - z_j(t)) minus half the sum over i,j of A_ij log z_i(t) log z_j(t), which is the critical value of the exponent.
3. In rank one, record the explicit hypergeometric series for V, namely the sum over k of (-1)^{(A+1)k} binom(Ak,k) t^k/(A k^2).
4. Record that the same V works for every congruence class, which is what the level m version needs.

**Acceptance.**

- For A = (3) the potential is t + 5t^2/4 + 28t^3/9 + 165t^4/16 + ...
- The potential determines the matrix A, which is the content of a separate corollary.
- The lemma is false with V replaced by a series depending on m: the whole point is that a single series governs all the roots of unity, which is what makes the collection a section of a Habiro module.

**Prerequisites.** `HabiroNahmSeries:HB.8/series-F-A`, `HabiroNahmSeries:HB.8/t-deformed-nahm-equations`, `Polylogarithms:P.1/classical-polylogarithm`

**Sources.**

- `gswz`, Lemma 2.6 — “For every integral symmetric N x N matrix A, there exists a series V(t)=V_A(t) in Q[[t]] such that for all m in Z_{>0} we have log(F_A(t,zeta_m+x)) = zeta_m V(t^m)/(m^2 x) + O(x^0).” *(The statement, verbatim.)*
- `gswz`, Section 2.3, after Lemma 2.6, equation (Vt) in rank one — “V_A(t) = -Li_2(1-z(t)) - (A/2) log(z(t))^2 = sum_k (-1)^{(A+1)k} binom(Ak,k) t^k/(A k^2)” *(The closed formula and the hypergeometric expansion in rank one, verbatim.)*
- `gswz`, Lemma 2.9 — “Let A be a symmetric integral N x N matrix and V(t)=V_A(t) as in Lemma 2.6. Then for all m>0 and all k in {0,...,m-1}^N, we have log(F_{A,m,k}(t,zeta_m+x)) = zeta_m V(t^m)/(m^2 x) + O(x^0).” *(The congruence version, verbatim.)*

### `finite-support-theorem`

*theorem* — **Finite support of the Donaldson-Thomas exponents of a q-hypergeometric series** · planet **Finite support of the DT exponents**

**Statement.** For every symmetric integral matrix A, the unique integers c_{n,i} in the product expansion of F_A have finite support: for each fixed non-zero n, all but finitely many c_{n,i} vanish. Equivalently F_A is admissible. This is GSWZ Theorem 6, which they attribute to Kontsevich-Soibelman and Efimov and reprove elementarily; the proof given here is the elementary one, through the Riccati system for the ratios and the potential lemma, and does not import a general Donaldson-Thomas integrality theorem.

**Hypotheses and conventions.**

- A is symmetric with integer entries.
- The product expansion and the exponents exist for any series with constant term 1, by the expansion theorem; the content is the finiteness, not the existence.
- The proof is by induction on the total degree in t, and the inductive step is a contradiction argument using the potential lemma.

**Proof outline.**

1. Record that every F with F(0,q) = 1 has a unique product expansion whose exponents vanish for sufficiently negative i.
2. For N = 1, form the ratio G(t,q) = F(qt,q)/F(t,q) and derive the Riccati equation 1 - G(t,q) = (-q)^A t times the product of the G(q^j t,q) for j from 0 to A-1 from the linear q-difference equation.
3. Prove by induction on the powers of t that G has Laurent polynomial coefficients, hence that L_n(q) lies in (1-q)/(1-q^n) times the Laurent polynomials.
4. Suppose L_N is not a Laurent polynomial; then it has a pole at some zeta_a with a dividing N and a > 1, with non-zero residue, and the coefficient of x^{-1} in log F(t, zeta_a + x) acquires an extra term besides the one predicted by the potential lemma.
5. This contradicts the potential lemma, which says the residue is exactly zeta_a V(t^a)/a^2; conclude that L_N is a Laurent polynomial.
6. For general N, repeat with the ratios G_j and the corresponding system of Riccati equations, obtaining L_n in the intersection over i of (1-q)/(1-q^{n_i}) times the Laurent polynomials, and run the same contradiction.

**Acceptance.**

- For A = (3) the exponents are non-zero exactly for 3n+1 at most i at most n^2+n+1, with the exception c_{1,3} = 1, and the theorem asserts the finiteness of that range for each n.
- The exponents grow fast: c_{20,142} = 44549701024, so finiteness is not boundedness.
- Mere integrality of the exponents, or uniqueness of an unrestricted product expansion, does not prove the theorem; both hold for series that are not admissible.

**Prerequisites.** `HabiroNahmSeries:HB.8/series-F-A`, `HabiroNahmSeries:HB.8/product-expansion-and-dt-exponents`, `HabiroNahmSeries:HB.8/potential-pole-lemma`, `HabiroNahmSeries:HB.8/admissible-series`, `mathlib:Polynomial.cyclotomic`

**Sources.**

- `gswz`, Theorem 6 — “Suppose that A is an integral symmetric N x N matrix. Then the unique c_{n,i} in Z such that F_A(t,q) = prod_{0 != n} prod_{i in Z} (q^i t^n;q)_infinity^{c_{n,i}} have finite support, i.e. for fixed n all but finitely many i satisfy c_{n,i}=0.” *(The theorem, verbatim.)*
- `gswz`, Proof of Theorem 6 — “If L_N(q) does not belong to Z[q^{pm 1}], it must have a pole at zeta_a for some a|N and a>1 with residue alpha != 0. Notice that for ab=N this would imply that the coefficient of x^{-1} in log(F(t,zeta_a+x)) would be equal to ... This contradicts Lemma 2.6 and completes the proof for N=1.” *(The contradiction step, verbatim.)*
- `gswz`, Section 4.2, equation (DTvalues) — “The DT invariant of (logF) c_{n,i} is non-zero only for 3n+1 <= i <= n^2+n+1 (and exceptionally, for c_{1,3}=1) and satisfy the positivity c_{n,i} in N. ... Despite appearances in low degrees, the DT invariants grow fast exponentially. For example, c_{20,142} = 44549701024.” *(The rank one instance and the growth, verbatim.)*

### `level-m-admissible-series`

*definition* — **Level m admissible series** · planet **Level m admissible series**

**Statement.** Fix a positive integer m. Every series F(t,q) with F = 1 + O(t) over the Laurent series field in q with m inverted can be written uniquely as the exponential of minus the sum over n at least 1 and over l prime to m of L_n(q^l) t^{nl}/(l (1 - q^{m l})), with L_n a Laurent series with m inverted. The series is level m admissible when each L_n lies in the ring obtained from the Laurent polynomials with m inverted by inverting the cyclotomic polynomials Phi_d with d not congruent to 0 modulo m, and moreover L_n(zeta_m) is integral away from m. Level 1 admissible is ordinary admissible.

**Hypotheses and conventions.**

- m is a positive integer; the coefficient ring has m inverted throughout.
- The existence and uniqueness of the L_n is proved first and is what makes the definition possible; it uses that the exponential of the elementary building block is a product of Pochhammer symbols raised to Moebius-weighted fractional powers.
- The two conditions on L_n are separate: membership in the localised ring, and integrality of the value at zeta_m.

**Proof outline.**

1. Prove existence and uniqueness of the L_n over the rationals by induction on the powers of t.
2. Prove that the L_n lie in the Laurent series with m inverted, using the inclusion-exclusion identity that expresses the elementary building block as a product over the divisors d of m of Pochhammer symbols raised to the power mu(d)/d.
3. Define level m admissibility by the two displayed conditions.
4. Prove that level 1 admissibility is ordinary admissibility.
5. Record the polar part at a root of unity of order divisible by m: the residue is V(t)/m^2 with V the sum over n and over l prime to m of L_n(zeta_m^l) t^{nl}/(m l^2).

**API.**

| name | role | statement |
| --- | --- | --- |
| `LevelAdmissible` | data | The predicate of level m admissibility. |
| `LevelAdmissible.L` | projection | The Laurent series L_n of a level m decomposition. |
| `LevelAdmissible.L_unique` | characterisation | Uniqueness of the decomposition. |
| `LevelAdmissible.one` | compatibility | Level 1 admissibility is ordinary admissibility. |
| `LevelAdmissible.moebiusProduct` | characterisation | The building block as a Moebius-weighted product of Pochhammer symbols. |
| `LevelAdmissible.residue` | characterisation | The residue of the logarithm at a root of unity of order divisible by m. |

**Where and how it is used.**

- *HB.8, the congruence sums.* The theorem of the next node is that the congruence sums F_{A,m,k} are level m admissible, which is what carries the integrality into the congruence decomposition.
- *HB.9.* The Frobenius congruence of GSWZ Theorem 4 is stated for the congruence sums and is proved from level m admissibility.
- *HB.8, the identification.* The identification theorem is proved class by class, so the level m notion is what the two sides are compared in.

**Unit tests.**

- `level_one` — A level 1 admissible series is admissible.
- `moebius_m_two` — For m = 2 the building block is the ratio of two Pochhammer symbols with the Moebius weights 1 and -1/2.
- `pochhammer_level_m` — The Pochhammer symbol in t with q replaced by q^m is level m admissible.
- `value_condition_independent` — A series satisfying the membership condition and failing the value condition at zeta_m is not level m admissible.

**Acceptance.**

- A level 1 admissible series is an admissible series in the sense of Kontsevich and Soibelman.
- The Moebius product identity is the key step and can be checked for m = 2 directly.
- The two conditions are independent: a series may satisfy the membership condition and fail the integrality of L_n(zeta_m), and such a series is not level m admissible.

**Prerequisites.** `HabiroNahmSeries:HB.8/admissible-series`, `mathlib:ArithmeticFunction.moebius`, `mathlib:Polynomial.cyclotomic`, `mathlib:LaurentPolynomial`, `HabiroCyclotomicCompletions:HC.1`

**Sources.**

- `gswz`, Lemma 2.7 and Definition 2.8 — “Every F(t,q) in 1 + t Z[1/m]((q))[[t]] can be written uniquely in the form F(t,q) = exp(-sum_n sum_{(l,m)=1} L_n(q^l) t^{nl}/(l(1-q^{ml}))) with L_n(q) in Z[1/m]((q)), and conversely. ... A series F(t,q) is called level m admissible if, for the unique L_n(q), we have L_n(q) in Z[1/m, q^{pm 1}, Phi_d(q)^{-1} | d not congruent to 0 mod m] and L_n(zeta_m) in Z[1/m], where Phi_d denotes the ...” *(The lemma and the definition, verbatim.)*
- `gswz`, Proof of Lemma 2.7 — “we find that exp(-sum_{(l,m)=1} q^{kl} t^{nl}/(l(1-q^{ml}))) = prod_{d|m} (q^{dk} t^{dn}; q^{dm})_infinity^{mu(d)/d} in 1 + t Z[1/m]((q))[[t]], where mu is the Moebius function.” *(The Moebius product identity that proves the integrality, verbatim.)*

### `congruence-sums-are-level-m-admissible`

*theorem* — **The congruence sums of a q-hypergeometric series are level m admissible**

**Statement.** Fix a symmetric integral A, a positive integer m and a residue class k in {0,...,m-1}^N, and let F_{A,m,k}(t,q) be the sum defining F_A restricted to the n congruent to k modulo m, normalised as in GSWZ equation (FAmdef). Then F_{A,m,k}(t^{1/m},q) is level m admissible. Moreover the Dwork-type quotient of a level m admissible series is p-integral in the same strong sense as for admissible series: for all primes p and positive m' with mm' prime to p, log F(t^{p/m'},q^p) - p log F(t^{1/m'},q) lies in (p/x) times the p-local coefficient ring at q = zeta_{mm'} + x.

**Hypotheses and conventions.**

- A is symmetric integral; m is a positive integer; k is a residue class; the normalisation of F_{A,m,k} subtracts the value of the exponent at k, which is what makes the series have constant term 1.
- The proof is given in detail for N = 1 and the general case is asserted to be identical with heavier notation; this packet records that the general case is not written out in the source.
- The Dwork statement needs mm' prime to p, not merely m prime to p.

**Proof outline.**

1. Introduce the normalised series H_{A,m,k} and derive from the q-difference system a linear q-difference equation of order m with q-binomial coefficients.
2. Form the ratio G_{A,m,k}(t,q) = H(qt,q)/H(t,q) and derive the corresponding non-linear equation.
3. Extract an integral recursion for the coefficients a_n(q) of the ratio, multiplied by the explicit factor minus (q^{nm+1-m};q)_{m-1}, and observe that this factor never contains a cyclotomic polynomial Phi_d with d divisible by m.
4. Conclude by induction that the ratio has coefficients in the localised ring, hence that the L_n do.
5. Rule out a pole of L_{n_0} at a root of unity of order am by comparing the residue with the one predicted by the potential lemma, exactly as in the finite-support proof.
6. For the Dwork statement, subtract p times the logarithm from the logarithm with t and q raised to the p-th power, observe that the terms with l divisible by p cancel, and expand at the root of unity.

**Acceptance.**

- For m = 1 and k = 0 the statement is the admissibility of F_A, which is the finite-support theorem.
- For A = 0 the congruence sums are explicit products and the statement can be checked directly.
- The factor minus (q^{nm+1-m};q)_{m-1} is where the level m condition comes from: the cyclotomic polynomials it contains are exactly the Phi_d with d not divisible by m.

**Prerequisites.** `HabiroNahmSeries:HB.8/level-m-admissible-series`, `HabiroNahmSeries:HB.8/series-F-A`, `HabiroNahmSeries:HB.8/potential-pole-lemma`, `HabiroNahmSeries:HB.8/dwork-quotient-admissible`

**Sources.**

- `gswz`, Theorem 7 — “Fix an integral symmetric N x N matrix A, a positive integer m and a residue class k in {0,...,m-1}^N. Then the series F_{A,m,k}(t^{1/m},q) in 1 + t Z[1/m]((q))[[t]] is m-admissible.” *(The theorem, verbatim.)*
- `gswz`, Proof of Theorem 7 — “It follows that -(q^{nm+1-m};q)_{m-1} a_n(q) in Z[q^{pm 1},a_1(q),...,a_{n-1}(q)]. Notice that -(q^{mn+1-m};q)_{m-1} never contains Phi_d(q) with d congruent to 0 mod m as a factor and therefore, by induction, we see that G_{A,m,k}(t,q) is in q^k + t^m Z[q^{pm1},Phi_d(q): d not congruent to 0 mod m][[t^m]].” *(The heart of the proof, verbatim.)*
- `gswz`, Lemma 2.10 — “Fix an m-admissible series F(t,q). For all primes p and positive integers m' with (mm',p)=1, we have log(F(t^{p/m'},q^p)) - p log(F(t^{1/m'},q)) in (p/x) Z_{(p)}[t^{1/mm'},zeta_{mm'}][[t,x]], q=zeta_{mm'}+x.” *(The Dwork statement for level m series, verbatim.)*
- `gswz`, Proof of Theorem 7, first sentence — “We will give the details of the proof when N=1, while for N>1 we use similar methods to the proof of Theorem 6 of Section 2.3.” *(The source writes out only the rank one case; recorded here and in the gaps.)*

### `fgi-collection`

*construction* — **The collection of power series produced by formal Gaussian integration** · planet **Formal Gaussian integration series**

**Statement.** For a symmetric integral A and each m, define Phi^FGI_{A,m}(t,x) as the sum over the residue classes k modulo m of the formal Gaussian integrals I_{A,m,k}(t^{1/m},x), where each I_{A,m,k} is the explicit expression of GSWZ equation (Ikdef): a prefactor built from the exponential of V(t^m)/(m^2 log(1+x/zeta_m)), the square root of m^N det(-Lambda(t^m)) times the product of the 1 - z_j^{1/m}, and products of the quantities (1 - zeta_m^{k+l} z^{1/m})/(1 - zeta_m^{l+k}) raised to explicit rational powers, times the formal Gaussian integral, against the matrix Lambda(t) = -A - diag(z(t)/(1 - z(t))), of the product of the regularised Pochhammer factors psi. The integrals are m-periodic in k, so the sum makes sense, and the exponential prefactor is independent of k, so the Gaussians are equi-peaked.

**Hypotheses and conventions.**

- A is symmetric integral; z(t) is the t-deformed solution; m is a positive integer and k a residue class modulo m.
- The psi factors are the infinite Pochhammer symbols with four explicit terms removed, so that they lie in 1 + x times the completed ring in which the formal Gaussian integration is defined.
- The m-periodicity in k is a theorem, proved by a change of variables in the Gaussian integration, and is what makes the sum over the classes well defined.

**Proof outline.**

1. Define the regularised factors psi_{k,z,zeta}(w,x) by removing from the logarithm of the infinite Pochhammer symbol its polar term, its linear term, its quadratic term and the explicit sum of logarithms, as in GSWZ equation (Psikdef).
2. Check that the result lies in 1 + x times the ring of series in w, w^3/x and x, which is the domain of the formal Gaussian integration.
3. Define Lambda(t) and check that its determinant is the discriminant up to the explicit monomial in z.
4. Define I_{A,m,k} by the displayed formula and prove its m-periodicity in k by the change of variables w to w + h together with the Galois action multiplying z^{1/m} by zeta_m.
5. Define the collection as the sum over the classes and record that the exponential prefactor is independent of k.
6. Define the refined objects CS_{A,m,k} of GSWZ equation (FGIcong), which are the pieces in which the integrality improves, and record the relation CS_{A,1,0}(t,zeta_{m'}+x) = Phi^FGI_A(t^{m'}, zeta_{m'}+x).

**API.**

| name | role | statement |
| --- | --- | --- |
| `fgiFactor` | data | The regularised Pochhammer factor psi. |
| `fgiFactor_mem` | characterisation | It lies in the domain of the formal Gaussian integration. |
| `fgiIntegral` | data | The integral I_{A,m,k}. |
| `fgiIntegral_periodic` | characterisation | The m-periodicity in k. |
| `fgiCollection` | data | The collection Phi^FGI_{A,m}. |
| `fgiCollection_prefactor` | characterisation | The exponential prefactor is independent of k. |
| `fgiRefined` | data | The refined pieces CS_{A,m,k} and their relation to the collection. |

**Where and how it is used.**

- *HB.8, the identification theorem.* The theorem says that this collection is the expansion of the admissible series F_A, which is the bridge between the two halves of the layer.
- *HB.9.* The Frobenius congruence is proved on the refined pieces CS_{A,m,k}, so their definition is part of the statement.
- *HB.10.* The explicit computations of the asymptotic series of knots are computations of these integrals.

**Unit tests.**

- `m_one` — For m = 1 the collection is a single formal Gaussian integral.
- `periodicity` — I_{A,m,k} and I_{A,m,k+m e_j} agree.
- `critical_point` — The critical point of the exponent is the t-deformed solution.
- `refined_relation` — CS_{A,1,0}(t, zeta_{m}+x) equals the collection evaluated at t^{m}.

**Acceptance.**

- For m = 1 the sum has one term and the collection is the classical perturbative series of Chern-Simons theory attached to A.
- The critical point of the exponent is the t-deformed solution z(t), by construction; the equations (zjt) are exactly the critical point equations.
- Without the m-periodicity the sum over k would depend on the choice of representatives, so the periodicity is not a formality.

**Prerequisites.** `HabiroNahmSeries:HB.4/formal-gaussian-integration`, `HabiroNahmSeries:HB.8/t-deformed-nahm-equations`, `HabiroNahmSeries:HB.4/q-pochhammer-symbols`, `HabiroNahmSeries:HB.4/cyclic-dilogarithm-interface`, `HabiroCyclotomicCompletions:HC.2`

**Sources.**

- `gswz`, Definition 2.11, equations (PhiFGIdef) and (Ikdef) — “We let Phi^FGI_{A,m}(t,x) = sum_{k in (Z/mZ)^N} I_{A,m,k}(t^{1/m},x), where I_{A,m,k}(t,x) is given by a formal Gaussian integral ... with Lambda(t) = -A - diag(z(t)/(1-z(t))).” *(The definition, verbatim.)*
- `gswz`, Section 2.5, after Definition 2.11 — “An important and non-trivial property is that I_{A,m,k}(t,x) is m-periodic in k, so that equation (PhiFGIdef) makes sense. This follows from the definition of I_{A,m,k}(t,x) and a simple change of coordinates in the Gaussian integration as done in [AarhusII] or [GSW]. Note that the exponential prefactor of all I_{A,m,k}(t,x) is independent of k. Said differently, these formal Gaussian ...” *(The periodicity and the equi-peakedness, verbatim; the source cites two references for the periodicity, which this packet records as an obligation.)*
- `gswz`, Section 2.5, equation (eq:Vgen) and after — “The integral is dominated by the leading term given by the exponential of h^{-1} times the function (1/2) w^t A w + sum_j -Li_2(1-e^{m w_j})/m^2 + (w_j/m) log((-1)^A t_j^m/(1-e^{m w_j})), whose critical points are exactly 1/m times the logarithm of z, where z=z(t) is the unique solution to the equations (zjt).” *(The critical point identification, verbatim.)*

### `fgi-coefficients-in-S`

*lemma* — **The coefficients of the Gaussian collection lie in the ring S**

**Statement.** For every positive integer m, the logarithm of Phi^FGI_{A,m}(t,x) lies in V^FGI(t)/(m^2 log(1+x/zeta_m)) minus half the logarithm of delta^FGI(t) plus the logarithm of U^FGI_m(t) plus x times the rationalised ring S^{(m)}, and moreover delta^FGI lies in S and m^{Nm} (U^FGI_m)^{2m} lies in S^{(m)}. The proof of the last inclusion uses the identity D_{zeta_m}(1)^{24m} = m^{12m}, which GSWZ deduce from the multiplier system of the Dedekind eta function and which is proved here directly: D_{zeta_m}(1)^m is the product over l from 1 to m-1 of (1 - zeta_m^l)^l, and pairing l with m - l together with the product formula for the (1 - zeta_m^l) gives its square as m^m times a sixth root of unity, whence the twenty-fourth power is m^{12m}.

**Hypotheses and conventions.**

- A is symmetric integral; m is a positive integer; the ring S^{(m)} is the one of the t-deformed equations, and the subscript Q denotes the rationalised ring.
- The a priori ring of the coefficients is larger, containing the m-th roots of z; descending to S^{(m)} is the content.
- The direct proof of the cyclic-dilogarithm identity replaces an appeal to the Dedekind eta multiplier system, which is not available in either library.

**Proof outline.**

1. Compute the a priori ring of the coefficients from the explicit formula for the integrals.
2. Introduce the endomorphism gamma_j multiplying the m-th root of z_j by zeta_m and prove that it permutes the integrals I_{A,m,k} cyclically in k, by the change of variables w to w + h.
3. Conclude that the sum over the classes is invariant under every gamma_j, hence lies in S^{(m)}.
4. For the constant U^FGI_m, bound the denominator by m^{-2N} and then remove the factor of m using the cyclic-dilogarithm identity.
5. Prove that identity directly: write P for the product over l of (1 - zeta_m^l)^l; pairing l with m - l gives P^2 = m^m times (-1)^{m(m-1)/2} zeta_m^{-m(m^2-1)/6}, a sixth root of unity times m^m, so P^{24} = m^{12m}.

**Acceptance.**

- For m = 1 the identity is trivial and the statement is that the coefficients lie in S.
- For m = 2 and zeta = -1 the product P is 1 - (-1) = 2 raised to the first power, and P^{24} = 2^{24} = m^{12m} = 2^{24}, which checks the identity.
- The factor m^{Nm} cannot be removed: the constants U^FGI_m are not in S^{(m)} on the nose, and the Delta-integrality of their specialisations at t = 1 is a corollary of the main theorem, not an elementary fact.

**Prerequisites.** `HabiroNahmSeries:HB.8/fgi-collection`, `HabiroNahmSeries:HB.8/t-deformed-nahm-equations`, `HabiroNahmSeries:HB.4/cyclic-dilogarithm-interface`, `mathlib:Polynomial.cyclotomic`

**Sources.**

- `gswz`, Lemma 2.12 — “For every positive integer m we have log Phi^FGI_{A,m}(t,x) in V^FGI(t)/(m^2 log(1+x/zeta_m)) - (1/2) log delta^FGI(t) + log U_m^FGI(t) + x S^{(m)}_Q[[x]] and delta^FGI(t) in S and m^{N m} U_m^FGI(t)^{2m} in S^{(m)}.” *(The statement, verbatim.)*
- `gswz`, Proof of Lemma 2.12 — “The endomorphism gamma_j that sends z_j(t)^{1/m} to zeta_m z_j(t)^{1/m} and fixes S^{(m)} satisfies gamma_j I_{A,m,k}(t,x) = I_{A,m,k+delta_j}(t,x). ... To see that a factor of m cancels we use D_{zeta_m}(1)^{24m} = m^{12m}, which follows from properties of the multiplier system of the Dedekind eta-function.” *(The Galois argument and the appeal to the eta multiplier system, verbatim; the direct proof replaces the appeal.)*
- `gswz`, Corollary after the proof of Proposition 1.5 — “For m prime to Delta, the constants U_m^FGI(1) from equation (Umtdef) are Delta-integral.” *(The corollary that the factor m cannot be removed by elementary means; it is deduced from the main theorem.)*

### `q-difference-for-the-gaussian-collection`

*lemma* — **The Gaussian collection satisfies the same q-difference system**

**Statement.** For each m and each residue class k, the normalised refined piece t^k CS_{A,m,k}(t,q) satisfies the same order-m linear q-difference system, with q-binomial coefficients, that the congruence sum t^k F_{A,m,k}(t,q) satisfies. The proof is a change of variables in the Gaussian integration: the integrals I_{A,mm',l} satisfy the same first-order relations in l that the series satisfy in the congruence class, and the q-binomial identity then assembles them into the order-m equation.

**Hypotheses and conventions.**

- A is symmetric integral; m and m' are positive integers and l runs over the classes modulo mm'.
- The q-binomial coefficients are taken with q inverted, matching the source's convention.
- This lemma is what makes the identification theorem a uniqueness statement rather than a computation.

**Proof outline.**

1. Prove the first-order relation for the integrals I_{A,mm',l} by the change of variables used for the periodicity.
2. Apply the q-binomial identity for the alternating sum of shifted copies, obtaining the order-m equation for the refined pieces.
3. Record the resulting system for t^k CS_{A,m,k} and check that it coincides term by term with the system for t^k F_{A,m,k}.

**Acceptance.**

- For m = 1 the system is the first-order q-difference system of F_A itself.
- For A = 0 both sides can be computed explicitly and the systems agree.
- The lemma is where the two halves of the layer meet: the admissible side and the Gaussian side are solutions of the same equation.

**Prerequisites.** `HabiroNahmSeries:HB.8/fgi-collection`, `HabiroNahmSeries:HB.8/series-F-A`, `HabiroNahmSeries:HB.4/formal-gaussian-integration`

**Sources.**

- `gswz`, Lemma 2.15, equation (PhiFGIAshift) — “For a positive integer m and residue class k in {0,...,m-1}^N, the function t^k CS_{A,m,k}(t,q) defined in equation (FGIcong) satisfies the q-difference equations ... where sigma_j t := (t_1,...,q t_j,..., t_N).” *(The statement, verbatim.)*
- `gswz`, Proof of Lemma 2.15, equation (SAshift) — “From the definition of I_{A,m,k}(t,x) and a simple change of coordinates in the Gaussian integration as done in [AarhusII] or [GSW], it is easy to see for l in (Z/mm'Z)^N that I_{A,l}(t,x) satisfies I_{A,mm',l}(t,x) - I_{A,mm',l}(sigma_j t,x) = (-1)^{A_{j,j}} t_j q^{A_{j,j}} I_{A,mm',l-delta_j}(prod_i sigma_i^{A_{i,j}} t, x)” *(The first-order relation for the integrals, verbatim.)*

### `identification-theorem`

*theorem* — **The admissible expansion and the Gaussian collection agree** · planet **Admissible equals Gaussian**

**Statement.** For every symmetric integral A, every positive integer m and every residue class k, the congruence sum F_{A,m,k}(t^{1/m},q) equals the refined Gaussian piece CS_{A,m,k}(t,q) as elements of the Laurent series ring in x with power series coefficients in t, for q = zeta_{mm'} + x and any m'. Summing over the classes gives Phi_A(t,q) = Phi^FGI_A(t,q), which is GSWZ Theorem 3. Consequently the potential, the discriminant and the constants computed from the admissible side agree with those computed from the Gaussian side, and the potential lemma and its level m version follow.

**Hypotheses and conventions.**

- A is symmetric integral; both sides are defined and lie in the same ring, which is itself part of the assertion and is proved from the determinant estimate.
- The proof is written out for a one by one matrix and asserted to be identical in general; this packet records that.
- The theorem is about formal objects: no convergence is claimed for either side.

**Proof outline.**

1. Record that the order-m linear q-difference equation with the initial condition has a unique solution in the stated ring, by extracting the coefficients of the powers of t and solving the resulting recursion.
2. Check that the congruence sum is a solution, which is a direct computation with the Pochhammer recursion.
3. Check that the refined Gaussian piece is a solution, which is the previous lemma.
4. Check that the Gaussian piece lies in the stated ring, using that the determinant of the inverse of Lambda is O(t) and dominates the pole coming from the polylogarithms of non-positive index.
5. Conclude equality by uniqueness, and sum over the classes.
6. Deduce the equality of the potentials, the discriminants and the constants, and hence prove the potential lemma and its level m version.

**Acceptance.**

- For A = 0 both sides are explicit and the identity can be checked directly.
- For A = (3) the first coefficients of both sides agree, and the source records them explicitly.
- The identification fails if either side is rescaled differently: the t to t^{1/m} rescaling on the admissible side and the t^{1/m} argument of the integrals on the Gaussian side must match, which is what fixes the normalisation.

**Prerequisites.** `HabiroNahmSeries:HB.8/q-difference-for-the-gaussian-collection`, `HabiroNahmSeries:HB.8/congruence-sums-are-level-m-admissible`, `HabiroNahmSeries:HB.8/expansion-at-roots-of-unity`, `HabiroNahmSeries:HB.8/fgi-coefficients-in-S`, `HabiroNahmSeries:HB.8/potential-pole-lemma`

**Sources.**

- `gswz`, Theorem 8, equation (eq.thm1.again) — “For every symmetric matrix A with integer entries, positive integer m and residue class k in {0,...,m-1}^N, we have F_{A,m,k}(t^{1/m},q) = CS_{A,m,k}(t,q), q = zeta_{mm'}+x, for any positive integer m'.” *(The refined form, verbatim.)*
- `gswz`, Theorem 3, equation (eq.thm1) — “For every symmetric matrix A with integer entries we have Phi_A(t,q) = Phi_A^FGI(t,q).” *(The form stated in the introduction, verbatim.)*
- `gswz`, Section 2.7, equation (eq.equal) — “A consequence of Theorem 8 is that the power series defined in equations (Vdef), (eq:Vt.m), (tautdef), and (Umdef) for the admissible series and those defined in equations (Vt), (dt), and (Umtdef) for the FGI series coincide: delta = delta^FGI, V = V^FGI, U_m = U_m^FGI.” *(The consequence, verbatim.)*
- `gswz`, Proof of Theorem 8 — “We discuss in detail the case where A is a 1 x 1 matrix ... The proof in the general case is identical using equation (PhiFGIAshift), and is omitted.” *(The source writes out only the rank one case.)*

### `wkb-algebraicity`

*theorem* — **Algebraicity of the expansion coefficients by the WKB method**

**Statement.** There is a second, independent route to the algebraicity of the coefficients, which does not use formal Gaussian integration: the WKB method applied to the linear q-difference system. In rank one, writing the solution as the exponential of a sum of c_k(t) h^k and studying the ratio G(t;h) = F(e^h t;h)/F(t;h) written as z(t) times the exponential of a sum of b_k(t) h^k, one proves that b_1 = A(A-1)X^2/2 and that b_k lies in X Delta Q[X] for k at least 2, where X = (t/z) dz/dt and Delta = X(AX+1)((A-1)X+1); integrating then gives c_k in X Q[X] for k at least 1. Hence every coefficient of the expansion is an algebraic function of t.

**Hypotheses and conventions.**

- A is a one by one integral matrix in the written-out case; the general case is asserted by the source to be analogous and is not written out.
- X is the logarithmic derivative variable, an algebraic function of t, and Delta is the displayed cubic in X; the operator t d/dt equals Delta d/dX.
- The method is a genuine alternative to the Gaussian route: it proves the algebraicity without constructing the Gaussian integrals.

**Proof outline.**

1. Introduce X and prove the change of variables t d/dt = Delta d/dX and the resulting membership of the iterated logarithmic derivatives of z in X Q[X].
2. Write the ansatz for F and derive the functional equation for the ratio G from the q-difference equation.
3. Compute b_1 explicitly and prove the two auxiliary memberships that start the induction.
4. Run the induction on k, showing that the relation for b_K has the form X^{-1} b_K in Delta Q[X], whence b_K lies in X Delta Q[X].
5. Integrate: c_k is obtained from b_{k+1} by integrating against dt/t = dX/Delta, and the division by Delta is exactly what the membership of b_{k+1} in X Delta Q[X] permits.
6. Record that the residue obstruction to integrating is what the argument overcomes, and that this is the delicate point the source signals.

**Acceptance.**

- For A = (3) the first coefficients of the expansion are the displayed polynomials in z and t divided by powers of delta.
- The general coefficient of x^k in the expansion divided by the exponential prefactor and multiplied by delta^{1/2 + 3k} lies in Q[t,z], which the source records for A = (3).
- Without the vanishing-residue argument, integrating a general b_{k+1} would produce logarithms, hence non-algebraic coefficients; the theorem is that this does not happen.

**Prerequisites.** `HabiroNahmSeries:HB.8/series-F-A`, `HabiroNahmSeries:HB.8/t-deformed-nahm-equations`, `HabiroNahmSeries:HB.8/identification-theorem`

**Sources.**

- `gswz`, Section 2.6, opening — “In this section we outline an independent proof of Lemma 2.12 of Section 2.5 using instead of formal Gaussian integration, the unique solution to the system of linear q-difference equations (PhiAshift). This is essentially the WKB method for linear q-difference equations, which writes the first derivative of a new function as a differential polynomial of known functions. In general ...” *(The method and the difficulty it overcomes, verbatim.)*
- `gswz`, Lemma 2.16 and Corollary 2.17 — “The coefficients b_k(t) defined by equation (eq:bkdef) exists and satisfy the properties: b_1(t) = A(A-1)X^2/2, and for k>1, b_k(t) in X Delta Q[X]. ... The coefficients c_k(t) in the function F(t;h) exists and for k in Z_{>0}, c_k(t) in X Q[X].” *(The two statements, verbatim.)*

### `potential-determines-the-matrix`

*lemma* — **The potential determines the matrix, hence the series**

**Statement.** If F_A is the q-hypergeometric series of a symmetric integral A and V = V_A is its potential, then V determines A and hence F_A. The proof is two identities: t_j times the partial derivative of V with respect to t_j is log z_j(t), so V determines the t-deformed solution; and the Hessian of V is minus A minus the diagonal matrix of z/(1-z), so V determines A.

**Hypotheses and conventions.**

- A is symmetric integral and V is the potential of the previous nodes.
- The second identity is stated in the source with the derivatives taken with respect to the z variables, which is how the Hessian of V as a function of log t is computed.
- The conclusion is an injectivity statement for the map from matrices to potentials, not a reconstruction algorithm.

**Proof outline.**

1. Differentiate the closed formula for V and use the t-deformed equations to obtain t_j partial_j V = log z_j.
2. Conclude that V determines every z_j as a power series in t.
3. Differentiate again to obtain the Hessian and read off A from it, since the diagonal correction is determined by z.
4. Conclude that V determines A and hence F_A.

**Acceptance.**

- For A = (3) the potential begins t + 5t^2/4 + 28t^3/9 and no other integral symmetric matrix has this potential.
- The map from matrices to potentials is injective but far from surjective: most power series are not potentials.
- The statement is about F_A and not about admissible series in general: two different admissible series can have the same potential, since the potential only sees the values L_n(1).

**Prerequisites.** `HabiroNahmSeries:HB.8/potential-pole-lemma`, `HabiroNahmSeries:HB.8/t-deformed-nahm-equations`, `HabiroNahmSeries:HB.8/identification-theorem`

**Sources.**

- `gswz`, Corollary 2.18 and its proof, equations (eq.V2F) and (Vhes) — “If F_A(t,q) is the series (FAdef) and V=V_A(t) is the associated potential, then V determines A and hence F_A. Proof: We have t_j partial_{t_j} V(t) = log z_j(t), j=1,...,N. Hence V determines z_j for j=1,...,N, and consequently the Hessian partial^2 V/(partial z_i partial z_j) = -A - diag(z(t)/(1-z(t))). The result follows.” *(The corollary and its whole proof, verbatim.)*

### `acceptance-rank-one`

*application* — **Acceptance: the rank one series, its exponents and the product identity**

**Statement.** The rank one case A = (3) is the layer's acceptance case, and every convention of the layer is checked against it. The series F(t,q) = sum_k (-1)^k q^{3k(k+1)/2} t^k/(q;q)_k satisfies F(t,q) - F(qt,q) + q^3 t F(q^3 t,q) = 0; its Donaldson-Thomas exponents are non-negative and supported in 3n+1 at most i at most n^2+n+1, with the exception c_{1,3} = 1; the deformed solution of 1 - z = -t z^3 is 1 + t + 3t^2 + 12t^3 + 55t^4 + ...; the discriminant is 1 - 5t - 3t^2 - 10t^3 - ...; the potential is t + 5t^2/4 + 28t^3/9 + 165t^4/16 + ...; and the ratio G satisfies the Riccati equation 1 - G(t,q) + q^3 t G(t,q)G(qt,q)G(q^2t,q) = 0, with the coefficient of x^k in G(t,1+x) lying in delta^{-3k} Z[t^{pm 1},z]. The product identity z(t) = product over n of (1-t^n)^{-n sum_i c_{n,i}} holds and proves that the exponent of 1 - t^n in that product is divisible by n.

**Hypotheses and conventions.**

- A = (3) is a one by one integral matrix, not positive definite as an analytic datum would require after the sign change; it is the formal datum of the layer.
- All the displayed series are those of GSWZ Section 4.2, and the packet reproduces them so that a formalisation can check against them.
- The product identity is an application of the Kontsevich-Soibelman theorem and is a check of the exponents, not a new theorem.

**Proof outline.**

1. Compute the first exponents c_{n,i} from the product expansion and compare with the table of the source.
2. Compute z(t), delta(t) and V(t) to the displayed order from their defining equations.
3. Verify the Riccati equation for the ratio and the stated denominators of its coefficients.
4. Verify the product identity for z(t) and deduce the divisibility of the exponent by n.
5. Verify the first coefficients of the expansion of Phi_1(t,x), which the source displays to order x^2.

**Acceptance.**

- The exponents for n at most 6 are the table of GSWZ equation (DTvalues), beginning c_{2,*} = 1 and c_{3,*} = 1, 1, 0, 1.
- The value c_{20,142} = 44549701024 is a stress test of any implementation of the expansion.
- The coefficient of x in Phi_1(t,x) divided by the prefactor is the displayed polynomial divided by 24 delta^3, which checks the universal denominators.

**Prerequisites.** `HabiroNahmSeries:HB.8/finite-support-theorem`, `HabiroNahmSeries:HB.8/identification-theorem`, `HabiroNahmSeries:HB.8/t-deformed-nahm-equations`, `HabiroNahmSeries:HB.8/product-expansion-and-dt-exponents`

**Sources.**

- `gswz`, Section 4.2, equations (Fexdef), (Frec), (DTvalues), (z3), (zfew3), (V3), (delta3), (Grec), (gexp) — “F(t,q) = sum_k (-1)^k q^{3k(k+1)/2} t^k/(q;q)_k satisfies F(t,q) - F(qt,q) + q^3 t F(q^3t,q) = 0. The DT invariant c_{n,i} is non-zero only for 3n+1 <= i <= n^2+n+1 (and exceptionally, for c_{1,3}=1) ... z(t) = 1 + t + 3t^2 + 12t^3 + 55t^4 + ... delta(t) = -2t - t/(1-z(t)) = 1 - 5t - 3t^2 - 10t^3 - ... V(t) = t + 5t^2/4 + 28t^3/9 + ... 1-G(t,q)+q^3 t G(t,q)G(qt,q)G(q^2t,q) = 0 ... z(t) = ...” *(The whole worked example, verbatim.)*

---

## HB.9. Frobenius congruences and module membership

**Coverage: source_decomposed.** 12 nodes.

Twelve nodes, decomposed from GSWZ Section 3 read in full. The integrality of the p-th version of the polylogarithm and the Dwork difference of the Pochhammer symbol; the Dwork difference of the potential and of the constants; Theorem 4 with its two ingredients and the ring-intersection step that removes the inverted p; the imported interface to the Habiro ring and its modules; the identification of the constant term with the unit of the Bloch class, which is where CGZ Theorem 1.6 and Hutchinson enter; the gluing by uniqueness of the solutions of an auxiliary q-difference system; Theorem 5 itself; the corollaries, including the integrality of the 4_1 sum, the symmetrisation, the torsion powers and the characterisation of Bloch-torsion; the descendants; the p-adic regulator input with Theorem 9; the verification of each defining condition of the modules through Dwork's lemma and the explicit local sections of Section 3.2, which is what the stage text asks be done instead of inferring membership from a few coefficients; and an explicit record of which hypotheses are load-bearing.

**Planets (3):** *Frobenius congruence*, *Habiro module membership*, *Bloch-torsion characterisation*.

### `p-adic-polylogarithm-integrality`

*lemma* — **Integrality of the p-th version of the polylogarithm and the Dwork difference of the Pochhammer symbol**

**Statement.** Write Li_n^{(p)}(t) = Li_n(t) - p^{-n} Li_n(t^p), the sum of t^k/k^n over the k prime to p. Then Li_n^{(p)}(t) lies in the p-adic completion of the ring obtained from the integers by adjoining t and the inverse of 1 - t. Consequently, for every prime p, the difference log (t^p;q^p)_infinity - p log (t;q)_infinity lies in p/x times that completed ring with x adjoined, for q = 1 + x; and for a root of unity zeta different from 1 whose order is not a power of p, the corresponding function of x is meromorphic on the unit disc with a simple pole at 0 and residue p Li_2^{(p)}(zeta).

**Hypotheses and conventions.**

- p is a prime; n is an integer; t is a formal variable and the completion is p-adic.
- Coleman proves a stronger convergence statement; the source deliberately proves only this weaker form, with an elementary argument, and this packet follows the source.
- The second statement is the specialisation t to zeta of the first, which is legitimate because the map respects the Frobenius endomorphism t to t^p.

**Proof outline.**

1. Prove that 1/(r + pk) is a p-adic integer for r between 1 and p-1, and deduce the congruence between the n-th powers of 1/(r+pk) and 1/(r+p(k+p^N)) modulo p^N.
2. Split the sum over the integers prime to p into congruence classes modulo p^N and sum the resulting geometric series, obtaining a representative in the ring with 1/(1 - t^{p^N}) adjoined.
3. Observe that 1/(1 - t^{p^N}) lies in the completed ring, which finishes the integrality.
4. For the Pochhammer difference, use the explicit formula for the logarithm, apply the integrality just proved and the elementary intersection identity relating the completed ring, its rationalisation and the p-local power series.
5. Specialise t to zeta through the map compatible with the Frobenius to obtain the residue statement.

**Acceptance.**

- For n = 1 the statement is the classical integrality of the logarithm of the Artin-Hasse type.
- The residue statement is what supplies the p-adic dilogarithm of a root of unity, which is the arithmetic input of the whole section.
- The hypothesis that the order of zeta is not a power of p is needed: for zeta of p-power order the residue calculation is different.

**Prerequisites.** `HabiroNahmSeries:HB.4/q-pochhammer-symbols`, `Polylogarithms:P.1/classical-polylogarithm`, `PadicHodgeRegulators:D.1`, `ColemanIntegration:L2`, `mathlib:PadicInt`, `mathlib:IsAdicComplete`

**Sources.**

- `gswz`, Lemma 2.1, equation (eq.LIP) — “For every integer n and prime number p we have Li_n^{(p)}(t) in Z[t,1/(1-t)]^wedge_p.” *(The statement, verbatim.)*
- `gswz`, Proposition 2.2, equations (logpocf) and (eq.cor.logpoc) — “(a) For every prime p we have log(t^p;q^p)_infinity - p log(t;q)_infinity in (p/x) Z[t,1/(1-t)]^wedge_p[[x]], q=1+x. (b) Fix a root of unity zeta in C_p different from 1 of order not a power of p. The function log(zeta^p;q^p)_infinity - p log(zeta;q)_infinity in p Li_2^{(p)}(zeta)/x + p Z_{(p)}[zeta][[x]], q=1+x, is meromorphic on the disc |x|<1 with a simple pole at x=0 and the residue as given.” *(Both parts, verbatim.)*
- `gswz`, Section 2.1, before Lemma 2.1 — “In [Coleman, Prop.6.2] Coleman proves (working with the variable 1/t) that Li_n^{(p)}(t) in Z_{(p)}[[t]] is convergent for |t/(1-t)| < p^{1/(p-1)} ... In the present paper, we will only use a weaker statement with an elementary proof.” *(The source deliberately uses the weaker statement, which this packet therefore plans.)*

### `dwork-difference-for-the-gaussian-data`

*lemma* — **The Dwork difference of the potential and of the constants**

**Statement.** For all primes p and positive integers m prime to p, the difference log CS_{A,m,k}(t^p,q^p) - p log CS_{A,m,k}(t,q) lies in x^{-1} times the p-completed ring S^{(m)} with 1/p and the m-th roots of z adjoined. The proof reduces to two statements: that V(t^p)/p - p V(t) lies in p times the p-completion of S, and that the analogous difference for delta^{-1} U_{m,k}^2 lies in p times the p-completion of S^{(m)} with the m-th roots of z adjoined. Both are proved by writing the Frobenius of z as z^p times the exponential of p times an element of the completed ring and expanding the polylogarithms, using the integrality of the p-th version of the polylogarithm at 1 - z.

**Hypotheses and conventions.**

- A is symmetric integral; m is prime to p; the expansion is at q = zeta_m + x.
- The identity Li_n(z e^x) = sum_k x^k Li_{n-k}(z)/k! and the fact that Li_n(z) is a rational function with poles only at 1 for n at most 0 are the elementary inputs.
- The element eta with Frobenius of z equal to z^p times the exponential of p eta exists because z is a unit in the completed ring.

**Proof outline.**

1. Write the difference of the potentials using the closed formula for V and the t-deformed equations.
2. Introduce eta by the displayed relation and expand the dilogarithm of the Frobenius, using the expansion of Li_n at a multiplicative perturbation.
3. Recognise the resulting terms as p times elements of the completed ring, using the integrality of Li_n^{(p)} at 1 - z.
4. Repeat the argument for the constants, using that delta^{-m} U_{m,k}^{2m} is a p-unit, so its Frobenius differs from its p-th power by the exponential of p times an element of the ring.
5. Assemble the two statements into the conclusion for the refined pieces, and record the remark that when U^FGI_m is a p-unit the statement lifts to the whole collection.

**Acceptance.**

- For A = 0 the potential is explicit and the statement can be checked by hand.
- The hypothesis m prime to p cannot be dropped, exactly as in the admissible case.
- The conclusion has 1/p adjoined; removing it is the content of the next node and is not automatic.

**Prerequisites.** `HabiroNahmSeries:HB.8/fgi-collection`, `HabiroNahmSeries:HB.8/fgi-coefficients-in-S`, `HabiroNahmSeries:HB.9/p-adic-polylogarithm-integrality`, `HabiroNahmSeries:HB.8/t-deformed-nahm-equations`

**Sources.**

- `gswz`, Lemma 2.13, equation (dphiA2) — “For all primes p and positive integers m with (m,p)=1, we have log(CS_{A,m,k}(t^p,q^p)) - p log(CS_{A,m,k}(t,q)) in x^{-1} S^{(m)}_p[1/p, z^{1/m}][[x]], q = zeta_m + x.” *(The statement, verbatim.)*
- `gswz`, Proof of Lemma 2.13, equations (eq:V.dwork), (pe0), (pe1), (pe2), (pe3) — “Since z is a unit, there exists eta = eta(z) in S^{(1)}_p such that fr(z) = z^p e^{p eta}. ... which follows from Li_n(z e^x) = sum_k x^k Li_{n-k}(z)/k!, and Li_n(z) in Z[z,(1-z)^{-1}] for n <= 0. ... Combining (pe1), (pe2) and (pe3) with Li_n^{(p)}(1-z) in S^{(1)}_p, we deduce that the right hand side of equation (pe0) is also an element of S^{(1)}_p.” *(The whole proof, verbatim.)*
- `gswz`, Remark after Lemma 2.13 — “If U_m^FGI(t) is a p-unit then we can lift the statement of equation (dphiA2) to log(Phi^FGI_A(t^p,q^p)) - p log(Phi^FGI_A(t,q)) in x^{-1} S^{(m)}_p[1/p][[x]], q = zeta_m + x.” *(The lifting remark, verbatim.)*

### `frobenius-congruence`

*theorem* — **The Frobenius congruence for the congruence sums** · planet **Frobenius congruence**

**Statement.** Fix a symmetric integral A, a positive integer m and a residue class k in {0,...,m-1}^N. Then for every prime p with m prime to p, log F_{A,m,k}(t^{p/m}, q^p) - p log F_{A,m,k}(t^{1/m}, q) lies in (p/x) times the p-completion of S^{(m)} with the m-th roots of z adjoined, in the power series ring in x, where q = zeta_m + x. This is GSWZ Theorem 4. It combines two facts that are separately weaker: the level m admissible Dwork lemma, which gives p-integrality but in the wrong ring, and the Gaussian Dwork lemma, which gives membership in the right ring but with 1/p adjoined; the intersection of the two is the statement, and proving that the intersection is the smaller ring is the last step.

**Hypotheses and conventions.**

- A is symmetric integral; m is prime to p; the fractional powers of t are taken through the m-th root of the variable.
- The two ingredients are the level m admissibility of the congruence sums and the Dwork difference for the Gaussian data; both need the identification theorem to be about the same object.
- The last step is an inclusion of rings, proved by representing elements as polynomials in the m-th root of t of degree less than m with coefficients polynomial in the m-th roots of z, in t and in the inverse of the discriminant.

**Proof outline.**

1. Use the identification theorem to regard the congruence sum and the refined Gaussian piece as the same object.
2. Apply the level m Dwork lemma to obtain p-integrality with coefficients in the cyclotomic power series ring.
3. Apply the Gaussian Dwork lemma to obtain membership in the completed ring with 1/p adjoined.
4. Prove the inclusion of the intersection of the two rings in the completed ring without 1/p: represent an element by a polynomial of degree less than m in the m-th root of t; use that z^{1/m} and the inverse discriminant are integral power series in t with constant term 1; replace every occurrence of t by z through the functional equation; conclude that the element is a unit times a polynomial in 1 - z with p-integral coefficients.
5. Combine the three steps to obtain the theorem.

**Acceptance.**

- For m = 1 the statement is the Dwork congruence for the admissible series F_A itself.
- For A = 0 both sides are explicit and the congruence can be checked.
- Neither ingredient alone gives the theorem: the level m lemma gives the wrong ring and the Gaussian lemma has 1/p adjoined, so the intersection step is not cosmetic.

**Prerequisites.** `HabiroNahmSeries:HB.8/congruence-sums-are-level-m-admissible`, `HabiroNahmSeries:HB.9/dwork-difference-for-the-gaussian-data`, `HabiroNahmSeries:HB.8/identification-theorem`, `HabiroNahmSeries:HB.8/dwork-quotient-admissible`

**Sources.**

- `gswz`, Theorem 4, equation (dphiA) — “Fix a symmetric matrix A with integer entries, a positive integer m and an m-congruence class k in {0,...,m-1}^N. Then, for every prime p with (m,p)=1, we have log(F_{A,m,k}(t^{p/m},q^p)) - p log(F_{A,m,k}(t^{1/m},q)) in (p/x) S^{(m)}[z(t)^{1/m}]^wedge_p [[x]], q = zeta_m + x.” *(The theorem, verbatim.)*
- `gswz`, Proof of Theorem 4, equation (eq:int.vs.comp) — “Theorem 8 together with Lemmas 2.10 and 2.13 imply the coefficients of x in equation (dphiA) are in Z[t^{1/m},zeta_m][[t]] cap S^{(m)}_p[1/p,z^{1/m}]. To complete the proof we will show that Z[t^{1/m},zeta_m][[t]] cap S^{(m)}_p[1/p,z^{1/m}] is contained in S^{(m)}_p[z^{1/m}].” *(The structure of the proof and the inclusion of rings, verbatim.)*

### `habiro-module-interface`

*comparison* — **The Habiro ring, its K-three-indexed modules and the restriction to good orders, imported**

**Statement.** The Habiro ring H_R of a number field, the modules H_{R,xi} indexed by an element xi of the third K-group, the unit epsilon_m(xi) attached to a root of unity of order m, and the restriction of a collection to the roots of unity of order prime to Delta are constructed by HabiroNumberFields HB.6 and HB.7 and are imported here. This layer uses exactly four properties: the defining gluing condition for a section of the module, the multiplicativity of epsilon_m against the additivity of the p-adic regulator, the statement that the module with xi zero is the ring, and the fact that the constant term of a section at an m-th root of unity lies in the ring with epsilon_m^{1/m} adjoined.

**Hypotheses and conventions.**

- R is the ring O_K[1/Delta] of a number field with Delta divisible by 2, by 3 and by the discriminant; only primes p > 3 are considered.
- A section of the module is a collection of power series indexed by the roots of unity, one in the local coordinate at each, satisfying the gluing condition.
- The restriction bar-Delta means the sub-collection indexed by the roots of unity of order prime to Delta; GSWZ Theorem 5 is stated for the restricted object and not for the whole one.

**Proof outline.**

1. Import the four properties by name from HabiroNumberFields HB.6 and HB.7 and record which node of this layer uses which.
2. Record that the gluing condition is the one written with the exponent gamma, and that its multiplicativity in xi is what makes the corollaries of this layer work.
3. Record that nothing about the modules is proved here.

**Acceptance.**

- With xi = 0 the module is the ring itself, which is the first property used by the corollaries.
- The constant term property is what makes the integrality corollary of this layer non-trivial.
- The restriction is not a formality: GSWZ record that the unrestricted statement is probably true and follows if the comparison of CGZ holds for every m, which is not known.

**Prerequisites.** `HabiroNahmSeries:HB.3/general-nondegenerate-class`, `HabiroNumberFields:HB.6`, `HabiroNumberFields:HB.7`, `HabiroNumberFields:HB.1`, `HabiroRings:HR.2`

**Sources.**

- `gswz`, Section 1.7, before Theorem 5 — “we define H_{R,xi}|_Delta to denote the set of collections of series indexed by roots of unity of order prime to Delta that satisfy (gluef) for all positive integers m and primes p such that (pm,Delta)=1. When xi=0, we have H_{R,0}|_Delta = H_R|_Delta.” *(The restricted module, verbatim.)*
- `gswz`, Remark 1.9 — “A stronger statement of the above theorem is probably true in H_{R[delta^{-1/2}],xi} without including Delta, and in fact follows if Theorem [CGZ, Thm 1.6] holds for any m in Z.” *(What the restriction costs, verbatim.)*

### `constant-term-is-the-unit`

*lemma* — **The constant term of the collection at a root of unity is the unit of the Bloch class**

**Statement.** For m prime to Delta, the constant term of the expansion Phi_{A,z,m}(x) at the m-th root of unity is epsilon_m(xi)^{1/m} times an element of the field K with the m-th roots of unity adjoined, where xi is the Bloch class of the non-degenerate solution z. This is the point at which the analytic and the arithmetic halves of the whole roadmap meet, and it is not proved here: it follows from CGZ Theorem 1.6 together with its equation (14) and from Hutchinson's comparison between the finite Chern class and the cyclic quantum dilogarithm, both of which are owned by HabiroNumberFields HB.1 and HB.2.

**Hypotheses and conventions.**

- m is prime to Delta, where Delta includes 2, 3 and the finitely many further primes attached to the field K.
- epsilon_m is the unit attached to an element of the Bloch group by the finite Chern class, in the normalisation of HB.1.
- The m-th root of the unit is ambiguous a priori; the equivariance recorded in HB.1 is what removes the ambiguity in the gluing condition.

**Proof outline.**

1. Identify the constant term of the expansion with the constant U_m of the collection, by the expansion lemma of HB.8.
2. Import the comparison between the cyclic quantum dilogarithm and the finite Chern class from HB.1 and HB.2.
3. Import CGZ Theorem 1.6 and its equation (14), which identify the unit produced by the cyclic dilogarithm with the one produced by the Chern class up to the excluded primes.
4. Combine to identify the constant term as the unit times an element of the cyclotomic extension.
5. Record that the identification is exactly what the restriction to orders prime to Delta buys, and that the unrestricted statement is open.

**Acceptance.**

- For xi = 0 the unit is trivial and the constant term lies in the cyclotomic extension, which is the statement needed for the ring rather than the module.
- For the 60-torsion example the unit is a 60-th root of unity times a unit, and the constant term is correspondingly constrained.
- Without the comparison the constant term is an algebraic number with no arithmetic meaning; the whole content is that it is the unit of the Bloch class.

**Prerequisites.** `HabiroNahmSeries:HB.8/expansion-at-roots-of-unity`, `HabiroNahmSeries:HB.9/habiro-module-interface`, `HabiroNahmSeries:HB.3/general-nondegenerate-class`, `HabiroNumberFields:HB.1`, `HabiroNumberFields:HB.2`

**Sources.**

- `gswz`, Proof of Theorem 5, first paragraph — “Firstly, we show that the constant term of Phi_{A,z,m}(x) is epsilon_m(xi)^{1/m} times an element of K[zeta_m]. For m prime to Delta (where Delta includes the primes 2 and 3 and finitely many other primes that depend only on the number field K), this follows from Theorem 1.6 and equation (14) of [CGZ] combined with Hutchinson.” *(The statement and its two imported ingredients, verbatim.)*

### `gluing-by-uniqueness-of-q-difference-solutions`

*lemma* — **The gluing condition, by uniqueness of the solutions of an auxiliary q-difference system**

**Statement.** The gluing condition for the collection attached to A is proved by a uniqueness argument. For a positive integer gamma, consider the products of gamma shifted copies of the series at q^gamma with one copy at q^{-1}, indexed by an integer vector and an integer; they satisfy a system of gamma plus two q-difference equations, which has a unique power series solution of the form 1 + O(t). Since both the collection and its Frobenius twist satisfy the same system, they agree; re-expanding at a root of unity of order divisible by p and specialising t = 1 then gives the gluing condition. The argument is written out for a one by one matrix and asserted to be analogous in general.

**Hypotheses and conventions.**

- A is symmetric integral; gamma is a positive integer; the series are the ones defined from F_A by shifting t by powers of q.
- The uniqueness is in the ring of power series in t whose coefficients are series in the local coordinate; it is proved by extracting coefficients.
- Specialisation at t = 1 is legitimate because the equalities are equalities of power series with coefficients in the ring S^{(m)}, which admits the specialisation.

**Proof outline.**

1. Define the auxiliary family by the displayed products.
2. Derive the gamma plus two equations it satisfies from the q-difference system of F_A.
3. Prove that the system has a unique solution of the stated form: the first two families of equations show that the coefficient of each power of t is constant in the indices modulo lower-order terms, and the last equation then determines that coefficient from the lower ones.
4. Prove that the auxiliary family lies in the p-completed ring S^{(m)} for every p prime to Delta and m prime to gamma, using the explicit Gaussian formulas, the identification theorem, the Frobenius congruence and the invariance under the Galois action on the m-th roots of z.
5. Deduce that the family lies in S^{(m)} itself, and that the equality persists after p-completion, re-expansion and the Frobenius, hence after specialising t = 1.
6. Conclude that the specialised collection satisfies the gluing condition.

**Acceptance.**

- For gamma = 1 the condition is the symmetrisation statement, which is the first corollary of the theorem.
- For A = 0 the auxiliary family is explicit and the uniqueness can be checked directly.
- The uniqueness argument replaces an explicit computation of the gluing, which is not available; this is why the layer's statement is about a q-holonomic module and not about a single series.

**Prerequisites.** `HabiroNahmSeries:HB.8/series-F-A`, `HabiroNahmSeries:HB.9/frobenius-congruence`, `HabiroNahmSeries:HB.8/identification-theorem`, `HabiroNahmSeries:HB.9/habiro-module-interface`

**Sources.**

- `gswz`, Proof of Theorem 5, second paragraph and equation (eq:qdiff.proofs) — “Secondly, we will prove that for a system of q-difference equations associated to the combination in equation (eq:gluing) there is a unique solution in formal power series in t. We will explicitly describe the case when N=1. ... These equations have a unique solution for power series in t of the form 1+O(t). This follows from the fact that the first two equations imply that the ...” *(The argument, verbatim.)*
- `gswz`, Proof of Theorem 5, third paragraph — “From the explicit formulas of equation (PhiFGIdef) and equation (Ikdef), Theorem 8, Theorem 4, and Galois invariance under z^{1/m} to zeta_m z^{1/m}; we see that psi^{(gamma)}_{A,mu,nu}(t^{1/m},zeta_m+x) is in S_p^{(m)}[[x]], for all primes p prime to Delta and m prime to gamma. Therefore, psi^{(gamma)}_{A,mu,nu}(t^{1/m},zeta_m+x) is in S^{(m)}[[x]].” *(The descent from the p-completions to the ring, verbatim.)*

### `module-membership`

*theorem* — **The Gaussian series of a non-degenerate Nahm solution lies in the Habiro module** · planet **Habiro module membership**

**Statement.** Fix a symmetric integral matrix A and a non-degenerate solution z of the Nahm equations with associated Bloch class xi. Then the collection Phi_{A,z}, obtained from the collection of A by specialising t = 1 and removing the principal part of the logarithm, lies in the module H_{R[delta^{-1/2}],xi} restricted to the roots of unity of order prime to Delta. This is GSWZ Theorem 5. All four hypotheses are load-bearing: non-degeneracy, the adjunction of the inverse square root of the discriminant, the restriction to orders prime to Delta, and the indexing of the module by the Bloch class of the chosen solution.

**Hypotheses and conventions.**

- A is symmetric integral; z is a non-degenerate solution; xi is its Bloch class; R is O_K[1/Delta] with Delta divisible by 2, by 3 and by the discriminant of K.
- The specialisation t = 1 is the ring homomorphism from S to R[delta^{-1/2}] of HB.3, and is compatible with the Frobenius on the p-completions.
- Removing the principal part means dividing by the exponential of the polar term, which is what makes the remaining collection a section rather than a formal Laurent object.

**Proof outline.**

1. Prove that the constant term at each admissible root of unity is the unit of the Bloch class times an element of the cyclotomic extension, by the constant-term lemma.
2. Prove that the collection satisfies the gluing condition, by the uniqueness lemma.
3. For each fixed m and each prime p prime to m, apply the Frobenius congruence to each refined piece specialised at t = 1, which is the defining local condition of the module restricted to the disc around the m-th root of unity.
4. Sum the refined pieces over the congruence classes, using the explicit relation between the collection and the pieces, to obtain the local condition for the whole collection.
5. Descend along the Galois action multiplying the m-th roots of z by roots of unity, using the invariance recorded in the coefficient lemma, to obtain a section over the ring without the m-th roots adjoined.
6. Vary over all m prime to Delta and combine with the gluing condition to conclude membership in the restricted module.

**Acceptance.**

- For xi torsion of order r, the r-th power of the collection lies in the Habiro ring itself, which is the corollary of the next node.
- For the cubic example of HB.10 the collection is the explicit series whose first coefficients the source computes.
- Dropping the non-degeneracy makes the ring R[delta^{-1/2}] the zero ring, so the statement becomes vacuous rather than false; dropping the restriction to orders prime to Delta makes it open.

**Prerequisites.** `HabiroNahmSeries:HB.9/constant-term-is-the-unit`, `HabiroNahmSeries:HB.9/gluing-by-uniqueness-of-q-difference-solutions`, `HabiroNahmSeries:HB.9/frobenius-congruence`, `HabiroNahmSeries:HB.9/habiro-module-interface`, `HabiroNahmSeries:HB.8/fgi-coefficients-in-S`, `HabiroNahmSeries:HB.3/general-nondegenerate-class`

**Sources.**

- `gswz`, Theorem 5, equation (eq.thm2) — “Fix a symmetric matrix A with integer entries and a non-degenerate solution z of the Nahm equations with associated xi. Then we have Phi_{A,z}(q) in H_{R[delta^{-1/2}],xi}|_Delta.” *(The theorem, verbatim.)*
- `gswz`, Proof of Theorem 5, last paragraph — “Varying over all m prime to Delta and combining this with the previous result that equation (eq:gluing) is satisfied, we conclude that Phi_{A,z}(q) in H_{R[delta^{-1/2}],xi}|_Delta.” *(The conclusion of the proof, verbatim.)*

### `symmetrisation-and-torsion-corollaries`

*theorem* — **Symmetrisation, torsion powers and the resulting characterisation** · planet **Bloch-torsion characterisation**

**Statement.** Three consequences. First, the constant term of the expansion at an m-th root of unity of order prime to Delta lies in R with the root of unity adjoined; for the matrix of the 4_1 knot this is the integrality of an explicit finite sum, which seems hard to prove directly. Second, the product of the collection with its image under q to q^{-1} lies in the Habiro ring, and if r xi vanishes in the third K-group then the r-th power of the collection lies in the Habiro ring of the ring with the inverse square root of the discriminant. Third, an orbit of the Nahm equations is Bloch-torsion exactly when the 2r-th power of the collection lies in the Habiro ring, where r is the order of the torsion element; the forward direction is the second statement and the converse follows from the fact that the vanishing of the Bloch-Wigner dilogarithms at all complex embeddings forces torsion, or from the triviality of the unit for all but finitely many m.

**Hypotheses and conventions.**

- A is symmetric integral and z is a non-degenerate solution with Bloch class xi.
- The second statement's part (b) uses Suslin's surjection from the third K-group onto the Bloch group and the Kashaev-Mangazeev-Stroganov identity as used by CGZ, both imported.
- The first statement is stated for m prime to Delta and is a consequence of the module membership together with the constant-term property of the modules.

**Proof outline.**

1. Deduce the first statement from the module membership and the constant-term property of a section.
2. Prove the symmetrisation statement directly from the gluing condition at gamma = 1, which is the case the uniqueness lemma establishes without the restriction.
3. For part (b), write xi as a sum of five-term relations using Suslin's surjection, and apply the Kashaev-Mangazeev-Stroganov identity as CGZ do, to show that the constant term lies in the ring S^{(m)}; this removes the restriction to orders prime to Delta.
4. For the characterisation, combine part (b) with the converse, using the regulator criterion of HB.3 or the triviality of the unit for almost all m.

**Acceptance.**

- For the 4_1 matrix the first statement asserts that an explicit sum over the residues modulo m, divided by the square root of m, is an algebraic integer in the 6m-th cyclotomic field for m prime to 6.
- For the 60-torsion example the second statement gives that the 60-th power of the collection lies in the Habiro ring of the quartic field with 5 and 19 inverted, conjecturally, and provably after inverting 6.
- The characterisation is an if and only if and is the strongest statement of the layer; it is not a decision procedure, since computing the order r is a separate problem.

**Prerequisites.** `HabiroNahmSeries:HB.9/module-membership`, `HabiroNahmSeries:HB.3/embeddings-and-regulator-evaluations`, `HabiroNahmSeries:HB.3/torsion-in-the-algebraic-closure`, `K3BlochGroups:V.4/suslin-exact-sequence`, `K3BlochGroups:V.6/five-term-certificate`, `HabiroNumberFields:HB.1`

**Sources.**

- `gswz`, Corollary 1.10 and equation (cherry41) — “The constant term of the expansion of Phi_{A,z}(q) at m-th roots of unity zeta_m of order prime to Delta is in R[zeta_m]. ... This is by no means an obvious fact. In the case of the series associated to the 4_1 knot, it asserts the integrality of the following sum: (1/sqrt m) sum_{k in Z/mZ} (zeta_m th;zeta_m)_k (zeta_m^{-1} th^{-1};zeta_m^{-1})_k in Z[zeta_{6m}], th^m = zeta_6, for (m,6)=1.” *(The first statement and its explicit instance, verbatim.)*
- `gswz`, Corollary 1.11 — “(a) We have Phi_{A,z}(q) Phi_{A,z}(q^{-1}) in H_R. (b) If r xi = 0 in K_3(K) for some positive integer r, then Phi_{A,z}(q)^r in H_{R[delta^{-1/2}]}.” *(The two parts, verbatim.)*
- `gswz`, Section 1.7, after Corollary 1.11 — “Let us say that an orbit of the Nahm equation is Bloch-torsion if the associated element of the Bloch group is torsion. Then an orbit is Bloch-torsion if and only if the series Phi_{A,z}(q)^{2r} in H_R, where r is the order of the torsion element of the Bloch group. One direction is given in the above corollary. The converse direction follows from the fact that the vanishing of the ...” *(The characterisation and both directions, verbatim.)*

### `descendants-by-specialisation`

*construction* — **Descendants: specialising the deformation parameter at a power of q**

**Statement.** Specialising t = q^nu, that is t_j = q^{nu_j} for an integer vector nu, defines a collection Phi_{A,z,nu} which again lies in the module over the ring with the inverse square root of the discriminant, restricted to the orders prime to Delta. The proof is the same as for the specialisation t = 1 and is omitted by the source. These are the descendants, and they multiply the supply of explicit elements of the Habiro modules: for a fixed A and z one obtains a family indexed by the integer vectors nu, whose span is expected to be large inside the module.

**Hypotheses and conventions.**

- A is symmetric integral; z is a non-degenerate solution; nu is an integer vector.
- The specialisation is a ring homomorphism on the relevant coefficient rings, compatible with the Frobenius, which is what makes the proof identical.
- The source omits the proof; this packet records that as an omission rather than reproving it.

**Proof outline.**

1. Define the specialisation homomorphism at t = q^nu and check its compatibility with the Frobenius on the p-completions.
2. Apply the proof of the module membership verbatim, with the specialisation replaced.
3. Record the resulting family and the expectation that the descendants span a large part of the module, which the source states as an expectation and not as a theorem.

**API.**

| name | role | statement |
| --- | --- | --- |
| `descendant` | data | The collection Phi_{A,z,nu} for an integer vector nu. |
| `descendant_zero` | simp | The descendant at nu = 0 is the original collection. |
| `descendant_mem` | characterisation | Every descendant lies in the restricted module. |
| `descendant_family` | data | The family of descendants indexed by the integer vectors. |
| `descendant_holonomic_rank` | characterisation | The number of independent descendants is bounded by the holonomic rank of the q-holonomic module of the Nahm sum. |

**Where and how it is used.**

- *HB.10.* The explicit examples compute descendants and check their integrality, which is the acceptance evidence of this layer.
- *HabiroRings HR.6.* The descendants are the supply of explicit elements that the coefficient interface is meant to export.
- *HB.9.* The characterisation of Bloch-torsion is stated for the collection and extends to every descendant.

**Unit tests.**

- `nu_zero` — The descendant at nu = 0 is the collection itself.
- `quartic_descendants` — For the 60-torsion example the descendants for eight values of nu exhibit the same Delta-integrality.
- `membership` — Every descendant lies in the restricted module over the ring with the inverse square root of the discriminant.
- `rank_bound` — For the 60-torsion example the holonomic rank is 8, so eight descendants suffice.

**Acceptance.**

- For nu = 0 the descendant is the collection itself.
- For the 60-torsion example the source computes the descendants for the eight values of nu that span the q-holonomic module, and finds the same integrality.
- The number of independent descendants is governed by the holonomic rank of the q-holonomic module of the Nahm sum, which is 8 in that example.

**Prerequisites.** `HabiroNahmSeries:HB.9/module-membership`, `HabiroNahmSeries:HB.8/series-F-A`

**Sources.**

- `gswz`, Remark 3.11 — “In fact, the specialisation t=q^nu for nu in Z^N (i.e., t_j=q^{nu_j} for integers nu_j) defines an element Phi_{A,z,nu}(q) in H_{R[1/sqrt delta],xi}|_Delta. The proof is identical to the proof of Theorem 5 and is omitted.” *(The statement and the omitted proof, verbatim.)*
- `gswz`, Section 1.7, after Corollary 1.11 — “Keeping in mind that the Habiro ring H_R of a number field K is a rank r module over H_{Z[1/Delta]}, where r=[K:Q], the above constructions presumably give a spanning set for H_R at the generic point of H.” *(The expectation about the span, verbatim, recorded as an expectation.)*

### `p-adic-regulator-input`

*application* — **The p-adic dilogarithm and the local K-theory input**

**Statement.** The arithmetic side of the layer rests on three imported statements about the p-adic regulator, all proved in GSWZ Section 3.1 and owned jointly with PadicHodgeRegulators and HabiroNumberFields. First, if z is a unit of the p-completed ring with |z - 1| at least 1 then D_p(z) lies in p^2 times that ring, where D_p is Coleman's p-adic dilogarithm corrected by half the product of the logarithms. Second, the span over the p-adic integers of the values p^{-2} D_p(zeta) at the roots of unity of the unramified extension of degree s is the whole ring of integers of that extension; the proof is a counting argument with the finite polylogarithm of Kontsevich. Third, for p > 3 the map D_p is an isomorphism from the p-adic K-theory of the local field onto p^2 times its ring of integers, and that K-group is generated by the classes of roots of unity.

**Hypotheses and conventions.**

- p is a prime greater than 3, unramified in K; the Iwasawa branch of the logarithm is used, and the source records that the primes considered never require evaluation in the residue discs where the choice matters.
- The third statement uses the identification of the p-adic K-group with a Galois cohomology group, quoted from Weibel's book, and the freeness of that module.
- None of the three is proved here; they are the interface between this layer and the p-adic regulator roadmaps.

**Proof outline.**

1. Import the three statements by name with their hypotheses.
2. Record which node of this layer uses which: the first is used in bounding the constant terms, the second in identifying the span, and the third in the definition of the modules of HB.7.
3. Record the finite polylogarithm of Kontsevich and the congruence identifying the reduction of the p-adic dilogarithm with it, since that congruence is the computational form of the second statement.

**Acceptance.**

- For s = 1 the second statement says that the values at the p-th roots of unity span the p-adic integers.
- The third statement fails for p = 2 and p = 3, which is one of the reasons Delta is divisible by 6.
- The first statement is an integrality bound and not an identity; the factor p^2 is exactly what makes the normalisation p^{-2} D_p natural.

**Prerequisites.** `HabiroNahmSeries:HB.9/p-adic-polylogarithm-integrality`, `PadicHodgeRegulators:D.3`, `PadicHodgeRegulators:D.4`, `ColemanIntegration:L2`, `HabiroNumberFields:HB.7`, `K3BlochGroups:V.6/regulator-agreement-padic`

**Sources.**

- `gswz`, Lemma 3.1 — “If z in R^wedge_p and |z|_p = 1 and |z-1|_p >= 1 then D_p(z) in p^2 R^wedge_p.” *(The first statement, verbatim.)*
- `gswz`, Proposition 3.3, equation (eq.xiz) — “For every positive integer s, we have Span_{Z_p}{p^{-2} D_p(zeta) : zeta in mu(Q_{p^s})} = Z_{p^s}.” *(The second statement, verbatim.)*
- `gswz`, Theorem 9 — “Assume p>3. We have a Z_p-linear isomorphism D_p from K_3(K_p;Z_p) to p^2 O_{K_p}, and K_3(K_p;Z_p) is generated as a Z_p-module by the classes of the roots of unity.” *(The third statement, verbatim.)*
- `gswz`, Section 3.1, the finite polylogarithm — “Although the p-adic polylogarithm Li_n is a transcendental function for n>0, its modulo p reduction can be described by a rational function, the finite polylogarithm function introduced by Kontsevich: li_{n,p}(z) = sum_{k=1}^{p-1} z^k/k^n.” *(The finite polylogarithm, verbatim.)*

### `hypotheses-that-cannot-be-dropped`

*application* — **Which hypotheses of the membership theorem are load-bearing**

**Statement.** Four hypotheses of GSWZ Theorem 5 change the statement if dropped, and each is recorded here with what goes wrong. Non-degeneracy: without it the discriminant vanishes, the ring with its inverse square root is the zero ring, and the Frobenius congruence has no content. The square root of the discriminant: the source states the theorem over R[delta^{-1/2}] and records that the element lies in the minus-one eigenspace of the involution, so the extension is not cosmetic. The restriction to orders prime to Delta: GSWZ say the unrestricted statement is probably true and follows if the comparison theorem of CGZ holds for every m, which is not known. The indexing by the Bloch class: the module depends on xi, and the theorem is false with xi replaced by zero unless the class is torsion, which is the content of the corollary.

**Hypotheses and conventions.**

- The four items are statements about Theorem 5 and each is supported by a passage of the source.
- The third item is an explicit open problem, not an omission of this packet.
- The fourth item is what makes the theorem a statement about K-theory and not merely about integrality.

**Proof outline.**

1. State each hypothesis and the failure that dropping it produces.
2. For the first, record that the ring becomes zero, so that no formalisation can state the conclusion.
3. For the second, record the eigenspace statement of Remark 1.9.
4. For the third, record the source's own assessment and the theorem it would follow from.
5. For the fourth, record the corollary that the torsion case is exactly when the module can be replaced by the ring.

**Acceptance.**

- A degenerate solution gives a vacuous statement, not a false one.
- For a torsion class of order r, the r-th power of the collection lies in the ring, which is the only case in which the index may be dropped.
- A statement of the form the series lies in the Habiro ring, without the module index and without the torsion hypothesis, is false.

**Prerequisites.** `HabiroNahmSeries:HB.9/module-membership`, `HabiroNahmSeries:HB.9/symmetrisation-and-torsion-corollaries`, `HabiroNahmSeries:HB.3/algebraicity-and-the-nahm-field`

**Sources.**

- `gswz`, Remark 1.9 — “A stronger statement of the above theorem is probably true in H_{R[delta^{-1/2}],xi} without including Delta, and in fact follows if Theorem [CGZ, Thm 1.6] holds for any m in Z. Moreover, under the action of the Galois automorphism of R[delta^{-1/2}] sending sqrt(delta) to -sqrt(delta), the element Phi_{A,z} lives in the -1-eigenspace. All the results of this section can be strengthen to ...” *(Three of the four items, verbatim, together with the statement that rational A can be handled at the cost of a larger Delta.)*

### `verifying-the-defining-conditions`

*comparison* — **How the defining conditions of the K-three-indexed modules are verified**

**Statement.** The modules of HabiroNumberFields HB.7 are defined by two conditions on a collection of power series: an integrality and gluing condition relating the Frobenius twist of the collection to its p-th power, and a condition relating the constant terms to the unit of the class. GSWZ Section 3.2 supplies the tools that verify them and constructs explicit local sections. The tools are: a variant of Dwork's lemma, saying that a series with constant term one and coefficients in the field is integral exactly when the Frobenius-twisted ratio is congruent to one modulo p times the variable; a corollary applying it to the exponential of a collection satisfying the displayed congruence; a lemma producing, for each m prime to p, a unique p-adic exponent correcting the collection so that the sigma-gluing holds for every p-adic unit sigma; and the resulting uniqueness of the lift of an invertible section to all roots of unity. The explicit local sections are built from the infinite Pochhammer symbol alone, with constant term the unit.

**Hypotheses and conventions.**

- p is a prime greater than 3, unramified; S is a p-complete torsion-free ring; m is prime to p.
- Everything in this node is imported from HabiroNumberFields HB.7 and is recorded here only because HB.9's stage text asks that each defining condition be verified rather than that membership be inferred from a few coefficients.
- The local sections are indexed by a presentation of the class as a p-adic combination of classes of roots of unity, which exists by the local K-theory theorem.

**Proof outline.**

1. Record Dwork's lemma in the form of the source, with the two-sided criterion and the extra condition on the linear coefficient.
2. Record the corollary for the exponential of a collection, and note that it is the step where the vanishing of the p-adic regulator would give integrality directly.
3. Record the correction lemma producing the unique p-adic exponents, and the abstract cocycle computation that pins them down.
4. Record the uniqueness of the lift of an invertible section to all roots of unity.
5. Record the explicit local section built from the infinite Pochhammer symbol, whose constant term is the unit and is therefore visibly non-vanishing, together with the theorem that it is a section.
6. For each of the defining conditions, name the node of this packet that establishes it for the Nahm collection: the Frobenius congruence for the integrality and gluing, and the constant-term lemma for the unit condition.

**Acceptance.**

- For the trivial class the explicit local section is the constant collection one, and the conditions are trivially satisfied.
- The correction by the p-adic exponent is not a formality: without it the gluing fails by a root of unity of p-power order.
- The remark that the logarithm of the extended section is meromorphic with simple poles of residue determined by the p-adic regulator is what connects the module to the regulator, and is recorded as the interface with PadicHodgeRegulators.

**Prerequisites.** `HabiroNahmSeries:HB.9/habiro-module-interface`, `HabiroNahmSeries:HB.9/frobenius-congruence`, `HabiroNahmSeries:HB.9/constant-term-is-the-unit`, `HabiroNahmSeries:HB.9/p-adic-regulator-input`, `HabiroNumberFields:HB.7`, `mathlib:IsAdicComplete`

**Sources.**

- `gswz`, Lemma 3.4, Dwork's lemma — “Fix a prime p and a positive integer m with (m,p)=1 and f(x) in 1 + x S[1/p,zeta_m][[x]]. Then f(x) in 1 + x S[zeta_m][[x]] if and only if fr(f)((zeta_m+x)^p - zeta_m^p)/f(x)^p in 1 + p x S[zeta_m][[x]], and f(x) in 1 + x S[zeta_m] + O(x^2), where fr is the Frobenius of S with fr(zeta_m)=zeta_m^p and fr(x)=x.” *(The tool, verbatim.)*
- `gswz`, Corollary 3.5 — “Then f(q):=exp(g(q)) is well-defined and assuming f(zeta_m+x) in (1+pS[zeta_m]) + x S[zeta_m] + O(x^2), it satisfies f(q) in prod_{m, (m,p)=1} S[zeta_m][[q-zeta_m]].” *(The corollary applying it to an exponential, verbatim.)*
- `gswz`, Definition 3.9 and Theorem 10 — “Psi_{[zeta],p,m}(x) = exp(-Li_2(zeta)/(m^2 log q)) epsilon_m([zeta])^{1/m} (q^{m/2} zeta;q^m)_infinity^{1/m}, q = zeta_m + x ... For all hat-xi and unramified p>3, Psi_{hat xi} is an L_p(hat xi)-section.” *(The explicit local sections and the theorem that they are sections, verbatim.)*
- `gswz`, Remark 3.8 — “Taking the logarithm of this extension of an invertible section to all roots of unity (with some mild assumptions) can be shown to give a meromorphic function with simple poles at roots of unity with residues given by m^{-2} D_p(xi) and its images under powers of p^{-2} fr.” *(The interface with the p-adic regulator, verbatim, with the source’s own hedge about mild assumptions.)*

---

## HB.10. Explicit examples and boundaries

**Coverage: source_decomposed.** 9 nodes.

Nine nodes, decomposed from GSWZ Section 4 read in full and from Garoufalidis-Zagier Section 5. The symmetrisation as a residue with Theorem 11; the descendants of Theorem 12; the rational example over the cubic field of discriminant -23, with the three independent computations of the same element; the genuinely nonabelian example with the 60-torsion class over the quartic field, its Delta-integrality data and the non-example given by the second Galois orbit; the knot matrices with the Neumann-Zagier dictionary and an explicit statement of the four assertions that do NOT follow, which is what the stage text asks for; the pair of the 5_2 and the pretzel knots over the cubic field with the denominators of their product; the p-adic computations by Hensel lifting; the two modularity examples of Section 4.7, which are the abelian easy cases; and the export interface with its non-consequences. The rank one product identity that the stage text asks for as a check of the conventions is the acceptance node of HB.8 and is referenced from here.

**Planets (2):** *Symmetrisation as a residue*, *Descendants in the Habiro ring*.

### `symmetrisation-and-residue-formula`

*theorem* — **Symmetrisation as a residue, and its integrality** · planet **Symmetrisation as a residue**

**Statement.** For a symmetric integral matrix A consider the auxiliary sum J_A(t,w,q) over the non-negative integer vectors of (-q^{1/2})^{n^t A n} q^{diag(A).n/2} w^{An} t^n divided by (qw;q)_n. Expanded at q = zeta_m + x it lies in an explicit localisation of the Laurent polynomial ring in w over the m-th cyclotomic integers, with denominators only the 1 - t_i^m P_i(w^m), where P_i(z) = (-1)^{A_ii} (1 - z_i)^{-1} product_j z_j^{A_ij}. Define Psi_{A,m}(t,x) as the sum of the residues of t^{-1/m} J_A(t^{1/m},w,zeta_m+x) dw/w over the w with w^m = z, where z runs over the solutions of t_i P_i(z) = 1. Then Psi_A(t,q) equals the symmetrisation Phi_A(t,q) Phi_A(t,q^{-1}), and in particular that symmetrisation has integral coefficients in the m-th cyclotomic integers.

**Hypotheses and conventions.**

- A is symmetric integral; m is a positive integer; the residues are taken over all w with w^m = z for each solution z of the displayed equations.
- The equations t_i P_i(z) = 1 are the t-deformed Nahm equations in the multiplicative form used by the residue formula.
- Integrality here means membership in the m-th cyclotomic integers with the variables adjoined, with no denominators.

**Proof outline.**

1. Expand J_A at a root of unity and establish the displayed membership, by observing that each coefficient of a power of x is a sum of derivatives of geometric series in t.
2. Define Psi by the residue formula and compute its value at x = 0, which is a manifestly integral finite sum divided by the discriminant.
3. Prove that the two families Phi_{A,mu,nu} and Psi_{A,mu,nu}, indexed by two integer vectors, satisfy the same system of q-difference equations; for Psi this uses two identities for J_A which are proved by shifting the summation index.
4. Prove that the system determines its solution from the value at the origin, by the same coefficient-extraction argument used in HB.8.
5. Check that both families take the value 1 at t = 0; for Psi this uses that the residues of the higher powers of the denominators contribute at least one factor of t.
6. Conclude the identity, and read off the integrality of the symmetrisation.

**Acceptance.**

- At x = 0 the formula gives a finite sum over the m-th roots and the residue classes, divided by the discriminant, which is visibly an algebraic integer up to the discriminant.
- For the cubic example the first coefficients of Psi are computed explicitly in the source and are recorded in the next node.
- The theorem is the practical source of elements of the Habiro ring: unlike the definition, the residue formula is a finite computation at each order.

**Prerequisites.** `HabiroNahmSeries:HB.8/identification-theorem`, `HabiroNahmSeries:HB.8/t-deformed-nahm-equations`, `HabiroNahmSeries:HB.9/module-membership`, `HabiroNahmSeries:HB.8/series-F-A`

**Sources.**

- `gswz`, Section 4.1, equations (Jwdef), (ABge), (psitmdef), (tpz) — “J_A(t,w,zeta_m+x) in Z[zeta_m][t,w_i^{pm 1},(1-t_i^m P_i(w^m))^{-1} | i=1,...,N][[x]], where P_i(z) = (-1)^{A_ii}(1-z_i)^{-1} prod_j z_j^{A_ij}. We define the collection Psi_A(t,q) by Psi_{A,m}(t,x) = Res_{w^m=z} t^{-1/m} J_A(t^{1/m},w,zeta_m+x) dw/w, where the residue is taken over all w^m=z and z satisfies the equations t_i P_i(z)=1.” *(The construction, verbatim.)*
- `gswz`, Theorem 11, equation (phipsi) — “For every positive integer m and Phi_A of Theorem 3, we have Psi_A(t,q) = Phi_A(t,q) Phi_A(t,q^{-1}) in Z[zeta_m][[x]][[t^{1/m}]], q = zeta_m + x.” *(The theorem, verbatim.)*

### `descendant-elements-of-the-habiro-ring`

*theorem* — **Descendants give elements of the Habiro ring of a number field** · planet **Descendants in the Habiro ring**

**Statement.** Specialise t = 1 and assume that the equations t_i P_i(z) = 1 define a reduced zero-dimensional scheme over the rationals; fix one solution z, which generates a number field K, and write Psi_{A,mu,nu,z} for the corresponding collection. Then Psi_{A,mu,nu,z} lies in the Habiro ring H_R for all integer vectors mu and nu. This follows by combining the identification theorem, the symmetrisation theorem and the module membership: the symmetrisation is indexed by the zero class, so it lands in the ring and not merely in a module.

**Hypotheses and conventions.**

- A is symmetric integral; the specialised equations define a reduced zero-dimensional scheme; z is one of its points and K the field it generates.
- The reducedness is a genuine hypothesis: it is what makes the residue a sum over simple poles.
- Some cases of this theorem were first proved in the thesis of Ferdinand Wagner, which the source records and which this packet has not read.

**Proof outline.**

1. Specialise the residue formula at t = 1 and check that the reducedness makes the residues simple.
2. Apply the symmetrisation theorem to identify the specialised residue with the symmetrised collection.
3. Apply the module membership with the class xi and with its negative, so that the product is indexed by the zero class and therefore lies in the ring.
4. Record the two-parameter family indexed by mu and nu, which is the descendant family of HB.9 in the symmetrised form.

**Acceptance.**

- For the cubic field of discriminant -23 the theorem produces the explicit element computed in the next node.
- For a non-reduced specialisation the residue formula is not the symmetrisation and the conclusion is unavailable.
- The theorem produces elements of the Habiro ring of a number field, which are otherwise hard to write down: the source stresses that the polynomial ring over the ring of integers is not a subring of the Habiro ring of a number field.

**Prerequisites.** `HabiroNahmSeries:HB.10/symmetrisation-and-residue-formula`, `HabiroNahmSeries:HB.9/module-membership`, `HabiroNahmSeries:HB.9/descendants-by-specialisation`, `HabiroNumberFields:HB.6`

**Sources.**

- `gswz`, Section 4.1, before Theorem 12 — “To get elements of the Habiro ring of a number field, we specialise to t=1 and assume that the equations (tpz) define a reduced zero-dimensional scheme over Q. Fix a solution z of these equations and denote the corresponding collection of power series by Psi_{A,mu,nu,z}(q). A solution z generates a number field K. Combining Theorem 3, Theorem 11 and Theorem 5, we obtain that ...” *(The setting and the deduction, verbatim.)*
- `gswz`, Theorem 12 — “For all mu, nu in Z^N, we have Psi_{A,mu,nu,z}(q) in H_R.” *(The theorem, verbatim.)*
- `gswz`, Section 4.1, after Theorem 12 — “Some cases of the above theorem were first proven in the thesis of Ferdinand Wagner.” *(The attribution, verbatim; that thesis was not read for this packet.)*

### `cubic-example`

*application* — **The worked rational example: the cubic field of discriminant minus twenty-three**

**Statement.** For the rank one matrix A = (3) the auxiliary sum is J(t,w,q) = sum_k (-1)^k q^{3k(k+1)/2} w^{3k} t^k/(qw;q)_k. Expanding at q = 1 + x gives an explicit rational function of w and t at each order, whose first three terms the source displays, and the residue formula gives Psi_1(t,x) with the displayed first coefficients. Specialising t = 1 produces the element of the Habiro ring of R = Z[z,1/23], where z^3 - z + 1 = 0 generates the cubic field of discriminant -23, with expansion (2z^2 + 3z - 9)/23 + ((-6477 z^2 - 5311 z + 4318)/23^4) x^2 + O(x^3), and the discriminant is delta = -2t - t/(1-z) = -t z^2 - t z + (-3t+1).

**Hypotheses and conventions.**

- A = (3); the equation is 1 - z = -t z^3, specialised to 1 - z = -z^3, that is z^3 - z + 1 = 0.
- The field is the cubic field of discriminant -23 and the ring is Z[z,1/23].
- The coefficient of x^1 vanishes in the specialised expansion, which is a consequence of the symmetrisation.

**Proof outline.**

1. Expand J at q = 1 + x and record the first three coefficients as rational functions of t and w.
2. Compute the residues at the w with w^m = z to obtain Psi_1(t,x).
3. Specialise t = 1 and simplify using the minimal polynomial of z.
4. Check the discriminant formula and compare the result with the two other computations of the same element that the source performs, through the symmetrised values and through the admissible series.

**Acceptance.**

- The constant term (2z^2 + 3z - 9)/23 is an element of Z[z,1/23] and not of the ring of integers, which is why the discriminant must be inverted.
- The vanishing of the coefficient of x is a check of the symmetrisation.
- The three computations of the same element, by the residue formula, by the symmetrised values and by the admissible series, agree; this is the strongest arithmetic acceptance test in the source.

**Prerequisites.** `HabiroNahmSeries:HB.10/descendant-elements-of-the-habiro-ring`, `HabiroNahmSeries:HB.8/acceptance-rank-one`, `HabiroNahmSeries:HB.3/algebraicity-and-the-nahm-field`

**Sources.**

- `gswz`, Example 4.1 — “Specialising to t=1 we find the expansion Psi_1(x) = (2z^2 + 3z - 9)/23 + ((-6477 z^2 - 5311 z + 4318)/23^4) x^2 + O(x^3) of the element of the Habiro ring R = Z[z,1/23], where z^3-z+1=0 generates the cubic field of discriminant -23. Using delta = -2t - t/(1-z) = -t z^2 - t z + (-3t+1) one can compare these equations to equation (fsymvals3) and equation (eq:ex.fsym.admis1).” *(The worked example, verbatim, including the three-way comparison.)*

### `nonabelian-quartic-example`

*application* — **The genuine nonabelian example: a 60-torsion Bloch class over a quartic field**

**Statement.** For A = (8 5; 5 4), symmetric positive definite, the Nahm equations 1 - z_1 = z_1^8 z_2^5 and 1 - z_2 = z_1^5 z_2^4 have eight solutions in two Galois orbits over two quartic fields, one given by z_1^4 + z_1^3 + 3 z_1^2 - 3 z_1 - 1 = 0 with z_2 = (-9 z_1^3 - 6 z_1^2 - 25 z_1 + 37)/5, the other by z_1^4 - z_1^3 + 3 z_1^2 - 3 z_1 + 1 = 0 with z_2 = z_1^3 + 3 z_1. The distinguished solution is (0.88483..., 0.78939...) in the real embedding of the first field, which has signature (2,1) and discriminant -5^2 times 19; its Bloch class is 60-torsion, and the corresponding series raised to the sixtieth power lies in the Habiro ring of the ring of integers with 5 and 19 inverted, conjecturally, and provably after inverting 6. The class attached to the second quartic field is not torsion and its series exhibits no integrality.

**Hypotheses and conventions.**

- A is symmetric positive definite with integer entries; the two quartic fields are the ones displayed; the distinguished solution lies in the first.
- The 60-torsion is a computation in the Bloch group, verified by the numerical vanishing of the Bloch-Wigner evaluations and certifiable by five-term certificates.
- The Habiro membership of the sixtieth power is stated by the source as conjectural in general and provable after inverting 6; this packet records that status and does not claim more.

**Proof outline.**

1. Solve the equations and identify the two Galois orbits and the two quartic fields.
2. Locate the distinguished solution numerically and identify the real embedding it lies in.
3. Compute the Bloch class and its order, by the regulator criterion and by a five-term certificate.
4. Compute the asymptotic series numerically to high order, accelerate, and recognise the coefficients as algebraic numbers; the source displays delta and the first three coefficients.
5. Check the denominators: to order 27 the denominator is 2^77 times 3^40 times 5^34 times 19^52, so the series is Delta-integral; after raising to the sixtieth power the denominator improves to 5^33 times 19^54.
6. Repeat for the eight descendants that span the q-holonomic module, and for the second quartic field, where no such integrality appears.

**Acceptance.**

- The exponential prefactor of the asymptotics is the exponential of pi^2/(15 log(1+x)), which exhibits L(xi)/pi^2 as the rational number 1/15 and is a check of the torsion.
- The improvement of the denominator on raising to the sixtieth power is the numerical signature of the torsion order.
- The second quartic field is the non-example: same matrix, same equations, non-torsion class, no integrality.

**Prerequisites.** `HabiroNahmSeries:HB.3/distinguished-solution`, `HabiroNahmSeries:HB.3/bloch-class-of-a-solution`, `HabiroNahmSeries:HB.9/symmetrisation-and-torsion-corollaries`, `HabiroNahmSeries:HB.9/descendants-by-specialisation`, `HabiroNahmSeries:HB.5/nahm-conjecture-statement`, `K3BlochGroups:V.6/bloch-element-constructor`

**Sources.**

- `gswz`, Section 4.3 — “The Nahm equations for z=(z_1,z_2) 1-z_1 = z_1^8 z_2^5, 1-z_2 = z_1^5 z_2^4 have eight solutions in two Galois orbits defined over two quartic fields ... Since A is positive definite equation (z1z28554) has a unique solution in (0,1)^2, given to a few decimals by (0.88483...,0.78939...), belonging to the real embedding of the quartic number field F of type (2,1) and discriminant -5^2 . 19 ...” *(The example with its status, verbatim.)*
- `gswz`, Section 4.3, the denominators — “We computed the series Phi_1(x) up to O(x)^{28} ... However, the denominator is actually 2^{77} . 3^{40} . 5^{34} . 19^{52}, so the series is Delta-integral. Moreover, if we take the 60-th power of Phi_{0,1}(x), we find that the denominator improves to 5^{33} . 19^{54}, where the remaining primes 5 and 19 are the prime factors of the discriminant -5^4 . 19 of the number field.” *(The numerical evidence, verbatim; note that the discriminant is printed as -5^2 . 19 earlier in the same section and as -5^4 . 19 here, a discrepancy recorded in the gaps.)*
- `gswz`, Section 4.3, the second orbit — “Incidentally, the element corresponding to the second quartic field E is not a torsion element of B(E), and its corresponding series, computed from the asymptotics of F_0(e(-1/tau)) when tau approaches infinity near the real line, does not exhibit any Delta-integrality properties.” *(The non-example, verbatim.)*

### `knot-matrices-and-the-topological-boundary`

*application* — **The knot matrices, and the boundary between a formal series and a topological invariant**

**Statement.** Three formal Nahm data reproduce the perturbative series of the three simplest hyperbolic knots: A = (1 1; 1 1) for the figure-eight knot, A = (2 1 1; 1 1 0; 1 0 1) for the knot 5_2, and A = (1 0 1; 0 1 2; 1 2 4) for the (-2,3,7) pretzel knot. More generally, from a triangulation with Neumann-Zagier matrices (A|B) such that B inverse times A is integral, one takes A_Nahm = I - B^{-1}A. What the theorems of this roadmap give for these data is membership of an explicit series in an explicit Habiro module. They do NOT give that the series is a topological invariant of the knot, that it is independent of the triangulation, that it computes a Chern-Simons quantity, or that the knot invariant is quantum modular; each of those is a separate theorem with its own source, and none is planned here.

**Hypotheses and conventions.**

- The three matrices are those recorded by the source; the general recipe requires the integrality of B inverse times A, which may fail for a given triangulation.
- The corresponding solutions of the Nahm equations come from solutions of the gluing equations of the triangulation, which is where the geometry enters.
- The boundary statement is the one the layer's own text insists on and is recorded as a node so that no later work can elide it.

**Proof outline.**

1. Record the three matrices and check that each is symmetric and integral.
2. Record the recipe from a Neumann-Zagier datum, with its integrality condition.
3. Apply the membership theorem to obtain the module statement for each of the three.
4. State explicitly the four assertions that are NOT obtained, and for each name the kind of theorem that would be needed: invariance under the Pachner moves for triangulation independence, a comparison with the state integral for the Chern-Simons identification, and a quantum-modularity theorem for the asymptotic statement.
5. Record that ArithmeticQuantumTopology is the consumer of these series and must prove those statements itself.

**Acceptance.**

- The figure-eight matrix is not positive definite, so it is a formal and not an analytic datum; the corresponding solution comes from the geometry and not from the cube.
- The integrality condition on the Neumann-Zagier datum can fail, in which case the recipe gives nothing and a different quad type must be chosen.
- Membership in a Habiro module is compatible with the series being a topological invariant and does not prove it; the two statements have different content.

**Prerequisites.** `HabiroNahmSeries:HB.9/module-membership`, `HabiroNahmSeries:HB.3/general-nondegenerate-class`, `ArithmeticQuantumTopology:QT.5`, `ArithmeticQuantumTopology:QT.7`

**Sources.**

- `gswz`, Remark 4.2, equation (3knots) — “Use the matrices A_{4_1} = (1 1; 1 1), A_{5_2} = (2 1 1; 1 1 0; 1 0 1), A_{(-2,3,7)} = (1 0 1; 0 1 2; 1 2 4) in Theorem 5 to compute the asymptotic series Phi^{(K)}(h) of the three simplest hyperbolic knots. To get the asymptotic series of [DG] for any knot, one can use a triangulation of it from SnapPy, choose quad types with Neumann-Zagier matrices (A|B) satisfying that B^{-1}A is ...” *(The three matrices and the general recipe, verbatim.)*
- `gswz`, Section 1.8, the relation with perturbative Chern-Simons theory — “Theorem 5 involves a symmetric matrix with integer entries and a non-degenerate solution z of the Nahm equations. As such, it looks removed from perturbative Chern-Simons theory with complex gauge group. In this subsection, we briefly explain the relation between Theorem 5 and perturbative complex Chern-Simons theory.” *(The source itself separates the theorem from the physical interpretation; this node keeps that separation.)*

### `p-adic-computations-example`

*application* — **The p-adic computations and the Frobenius by Hensel lifting**

**Statement.** The p-adic side of the examples is computed by Hensel lifting: if xi generates K with minimal polynomial P and p is unramified, then lifting the factorisation of P modulo p lifts the Frobenius of the residue field to an automorphism of the p-completion of R, and the lifting is constructive. The source uses this to compute the Frobenius endomorphism explicitly and to check the gluing conditions numerically, and gives a worked example illustrating the isomorphism between the p-adic K-theory of a local field and p^2 times its ring of integers.

**Hypotheses and conventions.**

- p is unramified in K and greater than 3; R is O_K[1/Delta].
- The Hensel lifting is the standard constructive one, by induction on the p-adic precision.
- The worked example is Example 4.3 of the source, which illustrates Theorem 9.

**Proof outline.**

1. Record the Hensel lifting argument and its constructive form.
2. Record the computation of the Frobenius as the lift of the p-power map.
3. Record the worked example and what it checks, namely the isomorphism given by the p-adic dilogarithm and the generation of the K-group by the classes of roots of unity.
4. Record that these computations are numerical verifications and not proofs of the theorems; the source says every result of the paper has been numerically verified.

**Acceptance.**

- For K the cubic field of discriminant -23 and a small unramified p, the Frobenius is computed by lifting the factorisation of z^3 - z + 1.
- The verification is of the gluing condition at a specific p and m, not of the theorem.
- A numerical verification at finitely many primes is not a proof; this node records the distinction.

**Prerequisites.** `HabiroNahmSeries:HB.9/p-adic-regulator-input`, `HabiroNahmSeries:HB.10/cubic-example`, `HabiroNumberFields:HB.6`

**Sources.**

- `gswz`, Section 4.4 — “Hensel's lemma states that if a polynomial factors into irreducible polynomials over Z/pZ, then this factorisation lifts to a unique factorisation over Z/p^nZ. Therefore, if xi is a generator of the field K with minimal polynomial P(x) and p is an unramified prime, applying Hensel's lemma to P(x) lifts the Frobenius automorphism R/pR to R_p^wedge isomorphic to R tensor Z_p, where R = ...” *(The method, verbatim.)*
- `gswz`, Section 4.5, opening — “Every result presented in the paper has been numerically verified. We will describe a select few of the computations that were carried out for two examples associated to the knots for 4_1 and 5_2.” *(The status of the computations, verbatim.)*

### `modularity-examples-and-their-lesson`

*application* — **Modular examples: a quadratic Gauss sum and the symmetrised Rogers-Ramanujan function**

**Statement.** Two examples show what modularity contributes. The quadratic Gauss sum gives the collection F_m = (sum over k modulo m of zeta_m^{k^2})(sum over k of zeta_m^{-k^2})/m, which equals 1 for m congruent to 1 or 3 modulo 4, 0 for m congruent to 2 and 2 for m divisible by 4, and is an almost trivial element of the Habiro ring with 2 inverted; the variant with a fourth root of unity gives a slightly less trivial element over the ring with i and 1/2. The Rogers-Ramanujan example is genuinely arithmetic: the function J(z,q), a one-variable deformation, has the property that its expansion at zeta_m lies in an explicit localisation, and the residues over the m-th roots of the golden-ratio unit give constants F_m(u) in the field generated by the square root of 5 and the m-th roots of unity, whose first values the source lists.

**Hypotheses and conventions.**

- The examples are those of GSWZ Section 4.7; the Rogers-Ramanujan field is the real quadratic field of the golden ratio, whose Galois group over the rationals is abelian.
- Both examples produce elements of Habiro rings of small fields, which are the easiest non-trivial instances of the whole theory.
- The lesson recorded is that modularity produces special elements associated to torsion classes in the third K-group, and that an abelian field is the easy case.

**Proof outline.**

1. Compute the Gauss sum collection and check the four cases modulo 4.
2. Record the variant with the fourth root of unity and the ring it lives over.
3. Record the deformation J(z,q) of the Rogers-Ramanujan function and the localisation in which its expansion lies.
4. Compute the residues over the m-th roots of the golden-ratio unit and record the first values, which are constants in the field generated by the square root of 5.
5. Record the lesson: these are the abelian examples, and the quartic example of the previous node is the point of the theory, being genuinely nonabelian.

**Acceptance.**

- The Gauss sum element is almost trivial, taking only the values 0, 1 and 2.
- The Rogers-Ramanujan constants F_1 and F_2 are minus one half minus or plus the square root of 5 over 10.
- These examples cannot replace the nonabelian one: the layer text asks for a genuine nonabelian number-field example, and the abelian cases do not exhibit the phenomena that the Frobenius gluing is designed for.

**Prerequisites.** `HabiroNahmSeries:HB.10/descendant-elements-of-the-habiro-ring`, `HabiroNahmSeries:HB.10/nonabelian-quartic-example`, `HabiroNumberFields:HB.6`

**Sources.**

- `gswz`, Section 4.7, Example 4.4 — “F_m(x) = (1/m)(sum_{k in Z/mZ} zeta_m^{k^2})(sum_{k in Z/mZ} zeta_m^{-k^2}) = (1/2)(1+zeta_4^m)(1+zeta_4^{-m}), which is 1 if m is 1 mod 4, 0 if m is 2 mod 4, 1 if m is 3 mod 4 and 2 if m is 0 mod 4. We see that this gives an almost trivial element of the Habiro ring H_{Z[1/2]}.” *(The first example, verbatim.)*
- `gswz`, Section 4.7, Example 4.5 — “The Rogers-Ramanujan function has an associated field Q(sqrt 5), which has an abelian Galois group over Q. Consider J(z,q) = sum_k q^{k(k+1)} z^{2k}/(qz;q)_k in H_{Q(z)} ... We define for xi^2+xi-1=0 F_m(u) = sum_{th^m = xi} Res_{z=th} J(z,zeta_m(1-u)) dz/z. Each F_m(u) in Q(sqrt 5, zeta_m) is constant, the first five values being F_1(u) = -1/2 - sqrt5/10, F_2(u) = -1/2 + sqrt5/10, ...” *(The second example, verbatim.)*
- `gswz`, Section 4.7, opening — “Modular forms at roots of unity give rise to special elements associated to torsion classes in K_3.” *(The lesson, verbatim.)*

### `export-interfaces-and-non-consequences`

*application* — **What this roadmap exports, and what does not follow from it**

**Statement.** The objects this roadmap produces and exports are: the coefficient rings S, S^{(m)} and their specialisations; the collections attached to a formal Nahm datum and a non-degenerate solution, with their descendants; the Frobenius congruence; the Bloch class and its order; and the explicit identities checked in the examples. They are consumed by HabiroRings HR.6, which is the coefficient and cohomology interface, and by HabiroCohomologyFoundations HQ.5 to HQ.8. What does NOT follow, and must be proved by its owner with its own foundations, is: the q-Hodge complex, the crystalline, A-inf and prismatic comparisons, and any Fargues-Fontaine geometry; and in particular membership of a series in a K-three-indexed Habiro module does not by itself produce a cohomology class on an arbitrary scheme.

**Hypotheses and conventions.**

- The exports are through actual comparison maps, not through an assertion that two objects are the same.
- The consumers named are those of the roadmap text; each is a separate roadmap with its own sources.
- The non-consequences are the ones the roadmap text lists, and each is recorded so that a later worker does not import it as a corollary.

**Proof outline.**

1. List the exported objects and, for each, the node of this packet that constructs it.
2. List the consumers and the interface each needs.
3. State the non-consequences and, for each, name the roadmap that owns the missing foundation.
4. Record that no comparison map to a cohomology theory is constructed in this packet, so that the export is an obligation on the consumer and not a claim of this roadmap.

**Acceptance.**

- The coefficient ring S is exported and is used by the relative Habiro ring of HabiroRings HR.5.
- The Frobenius congruence is exported as the arithmetic gluing statement that the modules of HB.7 are defined by.
- A statement of the form the Nahm series gives a class in q-de Rham cohomology is not a consequence of anything in this packet.

**Prerequisites.** `HabiroNahmSeries:HB.9/module-membership`, `HabiroNahmSeries:HB.9/descendants-by-specialisation`, `HabiroNahmSeries:HB.8/t-deformed-nahm-equations`, `HabiroRings:HR.6`, `HabiroCohomologyFoundations:HQ.5`, `HabiroCohomologyFoundations:HQ.8`

**Sources.**

- `gswz`, Section 1.9, future extensions — “This link suggests that some Donaldson-Thomas invariants have arithmetic meaning and that some elements of the Habiro ring of a number field have enumerative meaning.” *(The source's own statement of what the link suggests; a suggestion is not a theorem, and this node keeps the distinction.)*
- `gswz`, Section 1.1, prologue — “This indicates that our newly introduced rings, their modules and their elements carry non-trivial information about number fields, and at the same time are useful in other areas of mathematics and mathematical physics.” *(The scope of the claims the source makes, verbatim.)*

### `knot-series-pair-example`

*application* — **The pair of the knot 5_2 and the (-2,3,7)-pretzel knot over the cubic field of discriminant minus twenty-three**

**Statement.** The knots 5_2 and the (-2,3,7)-pretzel knot have the same cubic trace field, generated by a root of alpha^3 - alpha^2 + 1 = 0, and are scissors congruent, so their Bloch classes agree modulo 6-torsion; nevertheless no relation between their series was found. Their series can be computed in three ways: from the Kashaev invariant numerically, from the associated q-series numerically, or exactly by formal Gaussian integration, the last of which produces four hundred coefficients. The product of the series of 5_2 with the series of the pretzel knot evaluated at minus x/(1+x), that is with q inverted, has denominators only at 2 and 23, the denominator of the coefficient of x^400 being 2^1997 times 23^581, and its constant term is the product of the inverse square roots of the two delta invariants, namely 1 over the square root of 2 times (2 alpha^2 - 2 alpha + 3). The two series are nevertheless genuinely different: the coefficients of the 5_2 series see only the cubic field, while those of the pretzel knot see in addition the real cyclotomic field of discriminant 49, so even the ranks of the two etale algebras differ.

**Hypotheses and conventions.**

- The trace field is the cubic field of discriminant -23; alpha satisfies alpha^3 - alpha^2 + 1 = 0.
- The 5_2 Gaussian integral is the displayed one-dimensional integral with delta = 3 alpha - 2, and the first coefficients are the ones the source lists.
- The computations are numerical or exact-arithmetic verifications, not proofs; the source says every result of the paper has been numerically verified.

**Proof outline.**

1. Record the two knots, their common trace field and their scissors congruence, and the consequence for their Bloch classes modulo 6-torsion.
2. Record the three computational routes and the reduction of the state integrals to one dimension.
3. Record the product series with its denominators and its constant term, which is the strongest integrality observation in the source.
4. Record the difference between the two series through the etale algebras their coefficients generate.
5. Record the explicit Gaussian integral for 5_2 and the first coefficients, so that an implementation can be checked against them.

**Acceptance.**

- The denominator 2^1997 times 23^581 of the four-hundredth coefficient of the product is a strong integrality test.
- The constant term of the product is the product of the two inverse square roots of the discriminants, which checks the normalisation of the square root in the module statement.
- The two knots give different series despite equal Bloch classes, which is the non-example showing that the class does not determine the series.

**Prerequisites.** `HabiroNahmSeries:HB.10/knot-matrices-and-the-topological-boundary`, `HabiroNahmSeries:HB.9/module-membership`, `HabiroNahmSeries:HB.10/cubic-example`, `HabiroNahmSeries:HB.9/symmetrisation-and-torsion-corollaries`

**Sources.**

- `gswz`, Section 4.6 — “In this section we give a pair of elements of the same module over the Habiro ring of the cubic field K of discriminant -23 that come from the asymptotic series associated to a pair of hyperbolic knots, namely the 5_2 and the (-2,3,7)-pretzel knot. ... Recall that this pair of knots has common trace field K generated by a solution to the cubic equation xi^3-xi^2+1=0. In fact, these knots ...” *(The setting, verbatim.)*
- `gswz`, Section 4.6, the product and its denominators — “the product Phi^{(5_2)}_1(x) Phi^{(-2,3,7)}_1(-x/(1+x)) has denominators given by powers of 2 and 23, e.g. the denominator of x^{400} is 2^{1997} . 23^{581}. Here alpha satisfies alpha^3-alpha^2+1=0. The constant term is the product of the square roots of the delta-invariant of the two knots c = 1/sqrt(2)(2 alpha^2 - 2 alpha + 3).” *(The computation, verbatim.)*
- `gswz`, Section 4.6, the difference between the two series — “Despite the above similarity, the series are quite different from each other: for instance the coefficients of the series of 5_2 see only the cubic trace field of discriminant -23, whereas those of (-2,3,7) see in addition the abelian field Q(2 cos(2 pi/7)) of discriminant 49. Thus, even the rank of the etale algebras is different.” *(The non-example, verbatim.)*
- `gz`, Section 5, equations (eq.NZ), (eq.ABchi), (eq.NZ2nahm) — “The map T that appears in (eq.NZNdata) converts the NZ equation to a Nahm equation. Assuming that B is nonsingular, we can formally convert (eq.NZ) into 1 - z_i = e(B.e_i) prod_j z_j^{A_ij} where A = I - B^{-1}A, B = (1/2)(-B^{-1} eta + (1,...,1)^t) ... T(A,B,eta,f) maps to (A,B,C) where C=f.” *(The dictionary from a Neumann-Zagier datum to a Nahm datum, verbatim, which is how a knot produces the matrices of the previous node.)*

---

## Dependencies on other roadmaps

| supplier | what is needed |
| --- | --- |
| `HabiroNumberFields:HB.1` | The integral Bloch-group conventions of CGZ and the finite Chern classes: the map P_zeta and the S-unit R_zeta(xi) attached to an element of the Bloch group and an n-th root of unity, CGZ Theorem 1.2 with its INJECTIVITY statement, the identification with the abstract Chern class of CGZ Theorems 1.5 and 1.6 with its equation (14), the chi^{-1}-equivariance, and the exceptional integer that excludes finitely many primes. HB.5's theorem is false without the injectivity statement and HB.9's constant-term lemma is exactly Theorem 1.6. |
| `HabiroNumberFields:HB.2` | The cyclic quantum dilogarithm D_zeta(x) = product (1 - zeta^t x)^t with its m-th root branch, the quasi-periodicity D_zeta(zeta x)/D_zeta(x) = (1-x)^m/(1-x^m), the five-term identity of Kashaev-Mangazeev-Stroganov as used by CGZ, and the asymptotics of the Pochhammer symbol at roots of unity that GSWZ Section 2.1 develops. HB.4 uses three identities, HB.8 uses the value at 1, and HB.9's corollary uses the five-term identity. |
| `HabiroNumberFields:HB.6` | The Habiro ring H_R of a number field, its restrictions to roots of unity of order prime to a modulus, and the p-completed description. HB.9 states membership in a module over this ring and HB.10 produces explicit elements of it. |
| `HabiroNumberFields:HB.7` | The K_3-indexed modules H_{R,xi} with their two defining conditions, the unit epsilon_m(xi), the freeness of the local modules and the constant-term property of a section. GSWZ Theorem 5 is a membership statement in exactly this object, and HB.9's final node verifies each defining condition. |
| `HabiroCyclotomicCompletions:HC.1` | The elementary q-analogue toolkit over Z[q^{pm 1}]-algebras: the q-integers, q-factorials and q-binomial coefficients with their recursions, the finite and infinite Pochhammer symbols with their shift identities, the q-binomial theorem and Euler's identities, and the logarithmic expansion of the infinite Pochhammer symbol. HB.4 and HB.8 use all of it; Mathlib records the finite q-symbols as an explicit TODO. |
| `HabiroCyclotomicCompletions:HC.2` | The expansions and coefficient algorithms at roots of unity: the local coordinate q = zeta_m + x, the relation h = log(1 + x/zeta_m), and the algorithms that compute the coefficients of an expansion. HB.8's collections are indexed by exactly these coordinates. |
| `HabiroRings:HR.2` | Habiro-complete modules and the derived detection of completeness, which is the module-theoretic frame in which the collections of HB.9 are sections. |
| `HabiroRings:HR.6` | The coefficient and cohomology interface: the target of the export of the coefficient rings, the collections, the Frobenius action and the K_3 index that HB.10's final node records as an obligation. |
| `HabiroCohomologyFoundations:HQ.5` | The existence classes for number fields in Habiro cohomology, the consumer of the elements this roadmap constructs; HB.10 records that membership in a K_3-indexed module does not by itself produce a cohomology class. |
| `HabiroCohomologyFoundations:HQ.8` | The crystalline, A_inf and prismatic comparison atlas, which HB.10's final node names as NOT a consequence of the q-series construction. |
| `Polylogarithms:P.1` | The dilogarithm and the Bloch-Wigner function with the five-term relation and the distribution and inversion relations. This packet imports the nodes of P.1 by identifier; the request records the dependency for the link map. |
| `Polylogarithms:P.2` | The embedding-wise weight-two regulator on the Bloch group of a number field, which HB.3 uses for the torsion criterion. Imported by node identifier. |
| `K3BlochGroups:V.3` | The pre-Bloch group, the five-term relation, the boundary into the antisymmetric tensor quotient, the CGZ-convention Bloch group and the two-primary discrepancy between the antisymmetric and the exterior targets. HB.3's boundary computation is stated in exactly these conventions and imports them by node identifier. |
| `K3BlochGroups:V.4` | Suslin's exact sequence and the surjection from the third K-group onto the Bloch group, which HB.9's corollary uses to write a torsion class as a sum of five-term relations. |
| `K3BlochGroups:V.6` | Five-term certificates and the constructors for explicit Bloch elements with vanishing boundary, which HB.10's examples use to certify that the class of the quartic example is 60-torsion. |
| `PadicHodgeRegulators:D.1` | p-adic analytic functions with their normalisations, in particular Coleman's dilogarithm with a chosen branch of the logarithm, which is the D_p of GSWZ Section 3.1. |
| `PadicHodgeRegulators:D.3` | The unramified p greater than 3 theorem for the p-adic regulator, which is the setting of GSWZ Theorem 9 identifying the p-adic K-theory of a local field with p^2 times its ring of integers. |
| `PadicHodgeRegulators:D.4` | Arithmetic localisation and the Frobenius, the frame in which the gluing conditions of the Habiro modules and the Frobenius congruence of HB.9 are stated. |
| `ColemanIntegration:L2` | Coleman's polylogarithms, in particular the analytic continuation along Frobenius that defines Li_2 on the p-adic numbers, and the finite polylogarithm of Kontsevich with the congruence relating it to the reduction of the p-adic dilogarithm. |
| `QSeriesPartitionsAndMockModularForms:QM.0` | Formal q-series and partitions: coefficientwise finiteness of infinite products in formal power series rings, which is the existence half of HB.8's product expansion. |
| `QSeriesPartitionsAndMockModularForms:QM.1` | Theta and eta functions and their transformation behaviour, used in HB.4's Andrews-Gordon acceptance case to see that the product is modular up to a power of q. |
| `QSeriesPartitionsAndMockModularForms:QM.2` | Partition asymptotics and exact formulas, the classical setting of the coefficient asymptotics that HB.4's final node relates to the radial asymptotics. |
| `ArithmeticQuantumTopology:QT.5` | Ideal triangulations, gluing equations, combinatorial flattenings and the extended Bloch element of a hyperbolic three-manifold, which is where the Neumann-Zagier data of HB.10's knot node come from. |
| `ArithmeticQuantumTopology:QT.7` | The quantum-modularity and example ledger that separates proved statements from conjectural ones. HB.10 records that membership of a series in a Habiro module proves neither topological invariance nor quantum modularity, and QT.7 is the owner of those statements. |

## Gaps

### Zagier's dilogarithm survey was not obtained, and three statements rest on it

*Needed by: `HabiroNahmSeries:HB.3`, `HabiroNahmSeries:HB.5`.*

CGZ cite D. Zagier, The dilogarithm function, for three things this packet uses: the existence and uniqueness of the distinguished solution of Nahm's equations, which both sources assert without proof; the expansion of a Nahm sum at q tending to 1 with the explicit non-zero algebraic constant K of its equation (29); and the improvement of the error term to an exponentially small one under modularity, its equation (28). The survey is a chapter of a book and was not obtained. This packet supplies its own proof outline for the existence and uniqueness, by strict concavity and coercivity of the potential, and records K and the error improvement as imported statements. NEXT SOURCE ACTION: obtain the survey, check the convexity argument against page 56 and the two displayed equations, and record the exact form of K.

### CGZ Sections 2 to 6 were not read, and the injectivity statement the main theorem uses comes from there

*Needed by: `HabiroNahmSeries:HB.5`, `HabiroNahmSeries:HB.9`.*

The proof of CGZ Theorem 7.5 ends by invoking the injectivity statement of its Theorem 1.2, and GSWZ's constant-term identification invokes its Theorems 1.5 and 1.6 with equation (14). Those results are constructed in Sections 2 to 6 of CGZ, which build the maps P_zeta and R_zeta, the Chern class, the reduction to finite fields and the connecting homomorphism, and which were not read for this packet. They are the content of HabiroNumberFields HB.1 and are requested from it. NEXT SOURCE ACTION: read CGZ Sections 2 and 3 for the construction of the maps and the injectivity, and Section 5 for the comparison of the two maps; that is the HB.1 blueprint job, not this one.

### The general rank of three of GSWZ's theorems is not written out in the source

*Needed by: `HabiroNahmSeries:HB.8`, `HabiroNahmSeries:HB.9`.*

GSWZ prove Theorem 7 and Theorem 8 in detail only for a one by one matrix, saying that the general case uses similar methods and is omitted, and the gluing step in the proof of Theorem 5 is likewise written for N = 1. Theorem 6 is written for N = 1 and then sketched for general N. This packet states all of them in general and records the proof outlines in general, but the general-rank arguments are not in the source and are not reconstructed here. NEXT SOURCE ACTION: write out the general-rank proofs, which is a mathematical task rather than a reading task; the multivariable Riccati system (eq:riccati) and the q-difference system (PhiFGIAshift) are the objects to work with.

### The periodicity of the Gaussian integrals is cited to two unread sources

*Needed by: `HabiroNahmSeries:HB.8`.*

The m-periodicity in the congruence class of the formal Gaussian integrals I_{A,m,k}, which is what makes the collection well defined, is proved in GSWZ by citing a change of coordinates carried out in the Aarhus integral papers and in Garoufalidis-Storzer-Wheeler; neither was obtained. The proof of Lemma 2.12 contains the essential computation, the endomorphism multiplying an m-th root of z by a root of unity permuting the integrals cyclically, and this packet records that as the proof outline. NEXT SOURCE ACTION: obtain the two cited papers and check the change of coordinates, or write it out from the definition of the bracket.

### The Poisson-summation estimates are referred to a source that was not obtained

*Needed by: `HabiroNahmSeries:HB.4`.*

Claims 1 to 4 of Garoufalidis-Zagier Section 4.3, which are the analytic heart of the all-orders expansion, are said to follow from an application of the Poisson summation formula explained in detail on pages 623 to 625 of Vlasenko-Zwegers; that paper was not obtained. Moreover the Poisson summation formula itself is absent from both pinned libraries, and the only Euler-Maclaurin statement they carry is the trapezoid-rule error bound. This is the single largest analytic obligation of the roadmap. NEXT SOURCE ACTION: obtain Vlasenko-Zwegers, Nahm's conjecture: asymptotic computations and counterexamples, and read pages 623 to 625; and record Poisson summation as a library target.

### The original admissibility theorem of Kontsevich-Soibelman and Efimov was not read

*Needed by: `HabiroNahmSeries:HB.8`.*

GSWZ attribute the admissibility of the q-hypergeometric series to Kontsevich-Soibelman, Section 6.1, Theorem 9, and to Efimov's paper on the cohomological Hall algebra of a symmetric quiver, and then give an elementary proof which this packet follows. Neither original was obtained, and the plan document records that the Efimov paper in the campaign library is a different one, on the rigidity of localizing motives. NEXT SOURCE ACTION: obtain Efimov, Cohomological Hall algebra of a symmetric quiver, Compositio Mathematica 148 (2012), and the Kontsevich-Soibelman paper, if the general Donaldson-Thomas route is ever wanted; the elementary route needs neither.

### Hutchinson's comparison, an input of the constant-term identification, was not read

*Needed by: `HabiroNahmSeries:HB.9`.*

The identification of the constant term of the collection at an m-th root of unity with the unit of the Bloch class is deduced by GSWZ from CGZ Theorem 1.6 and its equation (14) combined with Hutchinson's paper on the Chern class for K_3 and the cyclic quantum dilogarithm, which was not obtained. It is the content of HabiroNumberFields HB.2 and is requested from it. NEXT SOURCE ACTION: obtain Hutchinson, arXiv:2104.14413v4, whose hash the plan document records, and read the comparison; that is part of the HB.2 job.

### No textbook treatment of the cusp theory of finite-index subgroups was obtained

*Needed by: `HabiroNahmSeries:HB.5a`.*

HB.5a's statements about cusps, widths, scaling matrices, local parameters and Laurent expansions rest on the pinned libraries, whose relevant declarations the reviewed audit lists, and on the use the two papers make of them, in particular the definition of the valuation at a rational point in Garoufalidis-Zagier Section 7 with its independence of the scaling matrix. No textbook was obtained, so the standard facts are not quoted from a primary source. NEXT SOURCE ACTION: obtain a standard treatment, for instance Diamond and Shurman or Shimura, and check the width conventions against it, especially the factor of two when minus the identity is absent, which Tau Ceti's declaration records and which is the easiest place to make an error.

### Two printed slips in GSWZ, recorded here for an errata job

*Needed by: `HabiroNahmSeries:HB.8`, `HabiroNahmSeries:HB.10`.*

First, the t-deformed Nahm equations (zjt) are printed with the inner variable z_j where the exponent A_{i,j} requires z_i; the corrected form is used throughout this packet and is the one that matches the ring S and the discriminant. Second, in Section 4.3 the discriminant of the quartic field is printed as minus 5 squared times 19 when the field is introduced and as minus 5 to the fourth times 19 when the denominators of the series are discussed; the two cannot both be right. Neither slip affects any statement of this packet, since both objects are used through their defining properties. NEXT SOURCE ACTION: a kind:errata job should record both against arXiv:2412.04241v2, and the second should be settled by computing the discriminant of z_1^4 + z_1^3 + 3 z_1^2 - 3 z_1 - 1.

### Wagner's thesis, which first proved some cases of GSWZ Theorem 12, was not read

*Needed by: `HabiroNahmSeries:HB.10`.*

GSWZ record that some cases of the descendant theorem were first proved in the thesis of Ferdinand Wagner. The thesis is in the campaign library according to the plan document, which records its hash, but it was not read for this packet, so the attribution is recorded and the relation between the two proofs is not established. NEXT SOURCE ACTION: read the relevant chapter of the thesis and record which cases it covers and by what method.

## Structural proposals

### 1. The detailed source behind HB.4 is not in the family's plan document

*kind: `note-external-source`.* HB.4's stage text says that the all-orders radial expansion is to be formalised using the detailed proof of Garoufalidis-Zagier. That paper is Asymptotics of Nahm sums at roots of unity, arXiv:1812.07690v1, and it is not listed among the references of research/blueprint/plans/HABIRO.md, which records CGZ and Hutchinson but not it. It is the only source that proves the expansion: CGZ quote it in simplified form and prove nothing about it. Proposal: add it to the family's source register with the PDF hash c8e810047d40b52ffc139553e8c9833853675f139070f3d1d4cf365267ae5b66 and the e-print hash 1a76d25bc5f75e16b1a11a411fb6d09e71b4f367d66e05ab0f7fc0539cc73785, and record that Sections 2 to 4 of it are HB.4's primary source.

### 2. HB.8 carries two developments with different prerequisites and should be divided

*kind: `split-layer`.* HB.8 as written covers the whole of GSWZ Section 2, which this packet decomposes into seventeen nodes. Its two halves are independent. The first is combinatorial and arithmetic: admissible series, the product expansion with the Donaldson-Thomas exponents, the level m variants, and Theorems 6 and 7; it needs only the q-analogue toolkit of HabiroCyclotomicCompletions HC.1. The second is analytic and algebraic: formal Gaussian integration, the t-deformed equations and the ring S, the identification Theorem 8 and the WKB route; it needs HB.2's cyclic dilogarithm and the ring theory of the t-deformed equations. They meet only at the identification theorem. Proposal: divide HB.8 into HB.8:admissibility, carrying the first half with Theorems 6 and 7 as its endpoints, and HB.8:gaussian, carrying the second half with Theorems 3 and 8, and make the identification theorem the interface. A reader of the current layer cannot see which of the two halves a given target belongs to.

### 3. HB.5a's text should name the two facts the libraries do not have

*kind: `narrow-layer-text`.* The reviewed audit records HB.5a as partly built and lists what the pinned libraries carry: arithmetic subgroups with the equivalence to finite index, the cusps as the rational projective line, scaling matrices, the finiteness of the cusp orbits, the width at infinity in Mathlib and the width at every cusp in Tau Ceti, the local parameter with its norm identity, and the orders of meromorphic germs. Only two things are missing: weight-zero meromorphic modular functions with Laurent expansions of finite principal part at every cusp, and the radial growth theorem with its rational exponential rate. As written the stage text asks for all of it, which makes the layer look larger than it is and invites a worker to re-plan what the libraries already have. Proposal: narrow the text to the two missing facts, cite the pinned declarations for the rest, and keep the insistence on the non-congruence generality, which is the part of the text that carries real information.

### 4. HB.4's cyclic-dilogarithm target belongs to HB.2 and should say so

*kind: `note-duplicate-boundary`.* HB.4's stage text asks for the field of definition of the expansion coefficients AND their cyclic-dilogarithm transformation law. The reviewed audit records the cyclic quantum dilogarithm, its change under an n-th-root choice, its five-term and distribution identities and its comparison with the finite Chern class as HB.2's targets, and the plan document assigns the asymptotics of Pochhammer symbols at roots of unity to HB.2 as well. This packet imports all of it by request and plans none of it, keeping only the three identities the expansion uses. Proposal: rewrite HB.4's sentence to say that the cyclic dilogarithm and its transformation law are imported from HabiroNumberFields HB.2 and that HB.4 owns the field of definition of the coefficients, which is the statement S^m in F_m[[epsilon]] of the source.

### 5. The acceptance cases of this roadmap are now concrete and should be recorded as such

*kind: `note-acceptance`.* The roadmap's acceptance line asks to prove finite i-support for each nonzero multi-index, to check a nonabelian number-field example, and to retain only the established modularity-implies-torsion implication. All three are now nodes: the finite-support theorem of HB.8, the 60-torsion quartic example of HB.10 with its Delta-integrality data and its non-example second orbit, and the theorem of HB.5 together with the node recording the four non-conclusions. Proposal: record in the roadmap document which node discharges each acceptance item, so that a reviewer can check them without reading the whole packet.

## The roadmap's acceptance line, and which node discharges it

The roadmap asks to *prove finite i-support for each nonzero multi-index, check a nonabelian number-field
example and retain only the established modularity-implies-torsion implication*.

- **Finite support.** `HB.8/finite-support-theorem` (GSWZ Theorem 6), proved by the elementary Riccati route,
  with `HB.8/acceptance-rank-one` carrying the rank-one tables and the product identity that check the
  conventions.
- **A nonabelian example.** `HB.10/nonabelian-quartic-example`: `A = (8 5; 5 4)`, the quartic field of
  discriminant `−5²·19`, the 60-torsion class, the denominators of the series to order 27 and their improvement
  on raising to the sixtieth power, and the second Galois orbit as the non-example. The abelian examples of
  `HB.10/modularity-examples-and-their-lesson` are recorded as the easy cases and do not replace it.
- **Only the proved implication.** `HB.5/modularity-implies-torsion` is the theorem;
  `HB.5/nahm-conjecture-statement` keeps the three properties and the two conjectural implications apart, with
  both counterexample matrices as data, and `HB.5/boundaries-of-the-implication` states the four things that do
  not follow.

## What is not claimed

Nothing in this packet is claimed to be formalised. Every `implementationStatus` is `unchecked`, the suggested
Lean file proves everything by `sorry`, and it was not compiled: the Mathlib build on this machine is a shared
cache that must not be rebuilt and this working tree has no elaborated dependency modules. Nothing that a
source only sketches is claimed as proved: the general-rank cases of GSWZ Theorems 6, 7 and 8, the periodicity
of the Gaussian integrals, the Poisson-summation estimates and the existence of the distinguished solution are
each recorded as gaps with the exact next source action. The words “optional”, “deferred” and “later” do not
appear in this document or in the packet.
