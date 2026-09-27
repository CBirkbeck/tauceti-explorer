# Handoff: BP-DiophantineApproximationAndTranscendence

## Current checkpoint — 27 September 2026, Codex `codex-a71f92`

Issue #1027. Claim comment 5851793788 won by bot reply 5851794692; the whole issue
was reread after the win. Continues PR #3124 and the handoff-only proof supplement
from PR #3129. **Status remains partial.** All four deliverables are synchronized.

### What this continuation adds

Ten lemma nodes, seven in DT.1 and three in DT.2, integrate the verified
algebraic/grid portion of Evertse's Lemma 26 and the nonzero-block conversion:

- Block-linear monomial support, finite Hasse chain identity and nonzero-jet extraction.
- Residual block degrees of a nonzero Hasse derivative and the degree bound after substitution.
- Zero-block degree detection and simultaneous independence of zero-degree blocks.
- The strict weighted-order budget, nonzero grid-block replacement and the conditional grid witness.

A1 of the supplement is the existing Hasse composition node, so it was not
duplicated. The index witness inequality is a direct consequence of the
existing infimum definition and is not a new node. No definitions, carriers,
planets or cross-roadmap requests were added. Existing weighted-homogeneous
polynomials and polynomial substitution are reused.

The conditional witness assumes an actual nonzero restricted derivative of
weighted order < mε. It gives a nonzero jet at nonzero grid blocks with weight
< (2−1/N)mε < 2mε. Lemma 24's height-to-nonzero-restriction argument and sharp
Roth/Faltings remain gaps. The proof does not replace the needed restriction
by the weaker and insufficient assumption F≠0.

The 353 inherited nodes are retained. Of their objects, 352 are unchanged;
only the parent `nonvanishing-on-grids` has updated proof steps, an added
prerequisite and a source locator. Its statement, hypotheses, acceptance
criteria and suggested signature are unchanged. All inherited source issues
and all four requests are retained without edits.

### Audit, sources and ownership

The six integrated reviewed DT audit rows and the accepted REV-AUDIT-07 report
were read before planning. The existing packet, reader and suggested file
were initially byte-identical to this session's fully read PR #3124 copy;
the whole new #3129 handoff was read. RS-03, its accepted review, the campaign
and atlas extract, integrated decomposition, matching link files, and the
GlobalNumberFields and Completed/EffectiveBounds style documents were
byte-compared to those already read inputs and were unchanged.

The pinned library audit searched Mathlib and Tau Ceti for Hasse derivatives,
block-linear substitutions and multihomogeneous support. The inherited
DT.1 derivative, composition, Taylor and weighted-index APIs are reused.
Fifteen additional baseline citations have statements read at the pinned
Mathlib commit: weighted homogeneity and its variable/scalar/sum/power/product
lemmas; finite Finsupp intervals; polynomial monomial evaluation, composed
evaluation and support expansion; degree bounds; evaluation vanishing and
congruence; nonzero independent vectors; and finite product reindexing.
No corresponding multivariate Hasse chain API was found in pinned Tau Ceti.
RS-03's ownership and the retired-foundations exclusion are unchanged.

Primary source: J.-H. Evertse, *An improvement of the quantitative Subspace
theorem*, Compositio Math. 101 (1996), 225–311. Lemma 26 at author-preprint p. 68
was reread and the published pp. 295–296 were checked visually. The reader's
explicit coefficients and nonzero-block argument are labelled elementary
supporting derivations, not separately named printed statements.

- Author copy: https://pub.math.leidenuniv.nl/~evertsejh/95-subspace.pdf
  SHA-256 `ac82a38059a5d0d9fd23a40a3896fb58d8525b14ef44c42199df9582bd9a0fb4`.
- Published: https://www.numdam.org/item/CM_1996__101_3_225_0.pdf
  SHA-256 `49e5d3f8160660828d10f2b5dcad4d7f22ffa2052623b954abbbb6fe7bc98177`.

Source issues E215/E216 remain unchanged, including the non-strict
index-to-witness inequality. No new source-error claim or independent-review
verdict was added. The earlier supplement's locator wording is only a lead;
the integrated nodes use the verified phrase “g is a linear combination.”

### Inventory and verification

- 363 nodes: 39 definitions, 5 constructions, 186 lemmas, 128 theorems and 5 applications.
- 341 API items and 209 tests across all nodes. The checker counts 326 API items
  and 184 tests on definitions/constructions; the ten new lemmas have ten APIs
  and twenty discriminating regression examples.
- 36 inherited planets, 393 baseline declarations, 33 sources, 68 source issues,
  21 gaps and four requests. DT.2 and the packet remain partial. The inherited
  closed DT.1 status and all unrelated coverage records are preserved.
- The entire suggested file elaborated at Lean 4.34.0-rc2 against Mathlib
  `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
  `f790474821cf4256814db967cb154e7af3d0c369`: exit 0, exactly 761 expected
  placeholder warnings (731 inherited, 30 new), no other warnings/errors.
  All 8,482 reached Mathlib source files were byte-checked against the pin;
  no Tau Ceti imports were needed.
- Separate scratch Lean checks proved four general supporting lemmas
  (zero block support, residual degree detection, simultaneous independence,
  and strict real weight budget) and eight concrete examples, with zero
  placeholders, warnings or errors. These are diagnostic proof probes,
  not published implementation claims.
- Exact sparse rational-polynomial regressions with seed 1027 passed:
  2,048 whole-polynomial chain identities, 10,228 coefficient-support checks,
  259 nonzero extractions, 108 residual-degree checks, 212 substituted-degree
  bounds, 8,658 simultaneous replacements, 4,480 weight budgets and thirteen
  boundary assertions. Cases include zero maps, cancellation, derivative
  orders beyond degree, empty variables and integer budgets below one.
  These finite checks do not prove the general statements.
- Packet checker with the pinned declaration index: zero errors and warnings.
  Intake file checks: four files, zero problems.
- Preservation and fresh-main guard passed: all 52 guarded inputs were unchanged
  from the claimed snapshot, 352 inherited node objects were exactly preserved,
  and the one updated parent retains its statement. Archive comparison confirms
  exactly the four authorized tracked files changed. Scratch proofs, downloaded
  sources, extracted text and build artifacts remain local.

### Exact next work

Start with Evertse 1996 §7, Lemma 24, author-preprint pp. 64–67. Decompose its
hyperplane-height-to-binary-direction estimate, successive lowest-degree
coefficient extraction preserving low-index vanishing, and restoration of
binary multihomogeneity before sharp Roth. Feed its actual nonzero restriction
to `conditional-nonzero-block-grid-jet`; do not re-plan the ten supporting
lemmas now present. The sharp Roth/Faltings proof in Evertse 1995 remains a
separate source task. Other EF, absolute Minkowski/Davenport, ESS, norm-form,
logarithmic-form and DT.4/DT.5 gaps and the four supplier requests remain
exactly in the packet's worklist.

The historical supplement and checkpoint below are retained for provenance.
Their inventory, access limitations and “resume” instructions describe their
own earlier state, not the synchronized deliverables of this continuation.


## Historical proof supplement — 27 September 2026

Issue #1027 · ChatGPT session `gpt-20260927-b8d41e` · continues PR #3124.

**Status: partial; proof supplement, not packet closure.** The supplement below supplies the explicit block-linear Hasse chain rule, the derivative-weight estimate, and the nonzero-block replacement argument requested by the previous handoff. It starts from the nonzero restriction delivered by Evertse's Lemma 24; it does not prove that lemma's height argument or sharp Roth.

The packet, reader and suggested Lean file are unchanged. Their inherited inventory remains 353 nodes, 21 gaps and four requests; no nodes, APIs, tests or planets were added to those files. The oversized packet was not recoverable through the available file reader, so it was not replaced with an incomplete reconstruction. The new argument is preserved here for integration rather than misrepresented as a validated packet edit.

Exact rational-polynomial regression checks passed: 456 chain-rule identities, 179 nonzero-jet extractions, 453 block-replacement cases, 2,940 weight-budget cases and 11 boundary/nonexample checks. These are finite checks, not formal proofs. No Lean compilation, full packet validator or fresh full-library audit was run in this continuation. Historical verification below belongs to the previous worker.

Resume by integrating the eight individually stated claims below into the existing DT.2 chain, checking the pinned library and existing node names first, then updating the reader and suggested signatures together. Keep all statuses unchecked and the Lemma 24 gap open. No ownership boundary or planet name changes are proposed.

## Proof supplement: a grid witness with every block nonzero

### Scope, notation and source relationship

This fills items 2–4 of the preceding handoff's next steps, conditional on item 1. It does not assert a new general foundation or a Lean declaration already present at the baseline. The labels A1–A8 below are local proof labels, not reserved node IDs or proposed final Lean names. Integration must reuse existing DT.1 Hasse/index declarations rather than introduce competing definitions.

Primary source: J.-H. Evertse, *An improvement of the quantitative subspace theorem*, author preprint [95-subspace.pdf](https://pub.math.leidenuniv.nl/~evertsejh/95-subspace.pdf), section 7, printed pp. 63–68. Lemma 25 and the definition of a grid are on p. 67; Lemma 26 and its proof are on p. 68. A short source locator for the chain-rule step is the phrase “can be expressed as a linear combination”. The explicit coefficients, support bookkeeping and simultaneous nonzero-block replacement below expand the argument; they are not quoted source statements. The index inequality uses the correction already recorded as E216, not a new source-issue claim.

Let K be a field of characteristic zero, m >= 1 and N >= 2 integers, and r = N - 1. Let d_h be positive integers for 1 <= h <= m. Write X_(h,l), 1 <= l <= N, for the variables in block h and Y_(h,a), 1 <= a <= r, for its parameter variables. Work in the corresponding finite polynomial rings over K. For a multiindex u in the X variables, put

    |u_h| = sum_l u_(h,l),       w_d(u) = sum_h |u_h| / d_h.

All weight comparisons are in the rationals embedded in the reals. Hasse differentiation D^u is specified by

    P(X + Z) = sum_u (D^u P)(X) Z^u.

This is notation for the existing divided-derivative object, not a second definition to publish. The monomial formula is

    D^u(X^a) = (product_(h,l) binom(a_(h,l),u_(h,l))) X^(a-u)

when u <= a coordinatewise, and zero otherwise. Every sum below is finite. Whenever a finite set of multiindices is used, it can be represented by products of finite antidiagonals, not an unbounded sum over natural-number functions.

Take block-linear maps A_h : K^r -> K^N and write

    (AY)_(h,l) = sum_a A_(h,l,a) Y_(h,a).

No injectivity or nonzero-entry condition on A is needed for A1–A4. For the grid application, the columns of A_h will be a basis of a dimension-r subspace V_h. For a real B >= 1 define

    Gamma_h = {A_h z : z in Z^r, |z_a| <= B for all a}.

Integers in this expression are mapped to K. Absolute-value bounds concern the original integers, not a chosen absolute value on K.

### A1. Iteration of Hasse derivatives

**Statement.** For every polynomial P and X-multiindices i,e,

    D^e(D^i P) = b(i,e) D^(i+e) P,
    b(i,e) = product_(h,l) binom(i_(h,l)+e_(h,l), i_(h,l)).

**Proof.** It suffices by coefficient linearity to consider X^a. If any coordinate of i+e exceeds a, both sides vanish. Otherwise, in each coordinate the required coefficient identity is

    binom(a,i) binom(a-i,e) = binom(i+e,i) binom(a,i+e).

Both sides count the same division into disjoint subsets of sizes i,e,a-i-e (or follow directly from factorials). Multiply these identities over the finite variable set. This proof also works over any commutative semiring by natural-number casting; no division in K is used.

**Dependency/integration note.** Reuse an existing iteration lemma if the DT.1 Hasse API already provides it. The indispensable binomial factor must not be dropped. For P = X^2, D^1 D^1 P = 2 whereas D^2 P = 1 over Q.

### A2. Coefficient support for a block-linear monomial substitution

**Statement.** For an X-multiindex e and Y-multiindex k, define the scalar

    c_(e,k)(A) = [T^k] product_(h,l) (sum_a A_(h,l,a) T_(h,a))^e_(h,l).

If c_(e,k)(A) is nonzero, then

    sum_a k_(h,a) = |e_h|             for every h.

For fixed k, the set E(k) of e satisfying these equalities is finite.

**Proof.** Each factor with first index h is homogeneous of degree e_(h,l) in T_h and of degree zero in other blocks. Every monomial obtained by expanding the product therefore has block-h degree sum_l e_(h,l). Collecting terms can remove monomials but cannot create a different block degree. A nonzero coefficient consequently has the asserted degrees. Finiteness follows because every coordinate e_(h,l) lies between zero and sum_a k_(h,a); equivalently E(k) is a product of finite weak-composition sets. This reasoning includes zero matrix rows: they can kill coefficients, never create unsupported ones.

### A3. Exact block-linear chain rule and nonzero extraction

**Statement.** For every polynomial F, X-multiindex i, Y-multiindex k and y in K^(m*r),

    (D_Y^k ((D_X^i F)(AY)))(y)
      = sum_(e in E(k)) c_(e,k)(A) b(i,e) (D_X^(i+e) F)(Ay).

If the left side is nonzero, there exists e in E(k) such that

    (D_X^(i+e) F)(Ay) != 0.

**Proof.** Put H = D_X^i F. In the polynomial identity defining Hasse derivatives replace X by Ay and Z by AT. Since A is linear, A(y+T)=Ay+AT, so

    H(A(y+T)) = sum_e (D_X^e H)(Ay) (AT)^e.

Take the coefficient of T^k. The coefficient on the left is D_Y^k(H composed with A)(y). On the right it is the displayed c_(e,k)(A), and A2 removes every e outside E(k). Apply A1 to D_X^e H. If all displayed derivative values were zero, every summand would be zero, contradicting the nonzero left side. Thus one derivative value is nonzero. Cancellation is harmless: the inference is from a nonzero sum to some nonzero summand, not its converse. No coefficient is assumed nonzero in advance.

The same argument proves the identity as polynomials in y. Ordinary mixed derivatives of order k equal (product k_(h,a)!) times the corresponding Hasse derivative. Hence a nonzero ordinary derivative yields the required nonzero Hasse derivative. In characteristic zero the factorial factor is nonzero; the forward nonvanishing implication itself also follows just from a nonzero product. Lemma 25's characteristic-zero hypothesis remains part of the grid input.

### A4. The weighted derivative budget

**Statement.** Let epsilon > 0. Suppose w_d(i) < m*epsilon, e belongs to E(k), and

    k_(h,a) <= d_h*epsilon/N          for every h,a.

Then j=i+e satisfies

    w_d(j) = w_d(i) + sum_h (sum_a k_(h,a))/d_h
           <= w_d(i) + m*(N-1)*epsilon/N
           < (2 - 1/N)*m*epsilon
           < 2*m*epsilon.

**Proof.** Sum the coordinate identity j=i+e in each block and divide by d_h>0. A2 identifies |e_h| with sum_a k_(h,a). Sum the r=N-1 coordinate bounds and then sum over h. The first strict inequality uses the strict hypothesis on w_d(i); the last uses m*epsilon/N>0. There is no rounding assumption: k is an integer and its given real upper bound can be used directly. In particular, small bounds forcing k_(h,a)=0 cause no exception.

### A5. Multihomogeneous derivatives have the residual block degrees

**Statement.** Suppose F is multihomogeneous of block degrees d. If D^j F is a nonzero polynomial, then |j_h| <= d_h for every h, and D^j F is multihomogeneous of block degrees

    delta_h = d_h - |j_h|.

Consequently (D^i F)(AY), when nonzero, has degree at most d_h in each individual parameter variable Y_(h,a).

**Proof.** A monomial X^a of F has sum_l a_(h,l)=d_h. A nonzero term of D^j F must come from a>=j coordinatewise; its block degree is sum_l(a_(h,l)-j_(h,l))=d_h-|j_h|. Such a term exists because D^j F is nonzero. No two distinct original exponents become the same exponent after subtracting a fixed j, although vanishing coefficients can remove terms. Thus every surviving term has the stated degree. Under block-linear substitution, a monomial of residual degree delta_h stays homogeneous of that block degree or becomes zero. Each individual Y_(h,a) exponent is at most delta_h<=d_h.

**Empty/zero case.** Do not deduce |j_h|<=d_h from the zero derivative; derivatives beyond the degree are zero. In all later uses a nonzero evaluated jet implies the required nonzero polynomial.

### A6. A zero block with a nonzero value has residual degree zero

**Statement.** Let H be multihomogeneous of degrees delta, x a block vector, and H(x)!=0. If x_h is the zero vector, then delta_h=0. For any block with delta_h=0, H is independent of all coordinates in that block: replacing that block by any vector preserves H at every evaluation point.

**Proof.** If delta_h>0, every monomial in H contains a positive exponent in some variable of block h. Every such monomial vanishes when that block is zero, hence H(x)=0, a contradiction. Thus delta_h=0. Every monomial of H then has a sum of nonnegative integer block exponents equal to zero, so each exponent in that block is zero. Evaluation of each monomial, and hence of their sum, is independent of that block. This is an identity of polynomials, not merely independence at the particular witness x.

**Necessary hypothesis.** Independence cannot be inferred without homogeneity: 1+X is nonzero at 0 but zero at -1.

### A7. Simultaneous replacement by nonzero grid vectors

**Statement.** Suppose the columns a_(h,1),...,a_(h,r) of A_h form a basis of V_h, B>=1, F is multihomogeneous, x_h belongs to Gamma_h for all h, and (D^j F)(x)!=0. There are x'_h in Gamma_h, each x'_h!=0, such that

    (D^j F)(x') = (D^j F)(x).

One may take x'_h=x_h when x_h!=0 and x'_h=a_(h,1) otherwise.

**Proof.** Since N>=2, r>=1, so the first basis vector exists. It is nonzero by linear independence and belongs to the grid via the integer coefficient vector (1,0,...,0), since B>=1. By A5 the nonzero polynomial H=D^j F has residual degrees delta. For each initially zero block, A6 proves delta_h=0 and global independence of that block. Every monomial of H therefore ignores every block being replaced, so all replacements preserve its value simultaneously. Each unchanged block was already nonzero; each changed block is a nonzero basis vector. Membership in the grid holds separately for each block.

No height, norm, or coordinatewise-nonvanishing assertion is used. In particular, “nonzero vector” does not mean “every coordinate nonzero”; standard basis vectors are valid replacements.

### A8. Conditional nonzero-block grid witness theorem

**Statement.** Let K,m,N,r,d be as above, 0<epsilon<=1, F a multihomogeneous polynomial of block degrees d, and A_h the chosen bases of dimension-r subspaces V_h. Set B=N/epsilon and define Gamma_h using these bases. Suppose there exists an X-multiindex i such that

    w_d(i) < m*epsilon
    and (D^i F)(A_1Y_1,...,A_mY_m) is a nonzero polynomial.

Assume the rectangular integer-grid jet lemma already planned in DT.2: for a nonzero polynomial with individual variable degrees <=d_h and B>0, it supplies integer y_(h,a) with |y_(h,a)|<=B and integers k_(h,a)>=0 with k_(h,a)<=d_h/B, whose mixed derivative at y is nonzero. Then there exist j and x'_h in Gamma_h with every x'_h!=0 such that

    (D^j F)(x') != 0,       w_d(j) < (2 - 1/N)*m*epsilon.

In particular the normalized index of F at x' is <2*m*epsilon, under the strict-threshold convention described below.

**Proof.** The assumed restriction is the polynomial G. A5 supplies its individual degree bounds. Apply the rectangular grid lemma with B=N/epsilon; it is positive. Convert its nonzero ordinary jet to a nonzero Hasse jet if necessary. A3 gives e in E(k) with (D^(i+e)F)(Ay)!=0. Put j=i+e and x=Ay. The bound k_(h,a)<=d_h/B equals d_h*epsilon/N, so A4 bounds w_d(j). The integer coefficient bounds put every x_h in its grid. Finally B=N/epsilon>=1, so A7 supplies x' with all blocks nonzero while preserving this same nonzero jet and its same weight. No repeat application of the grid lemma is needed after replacement.

The input here is exactly the polynomial nonzero-restriction conclusion needed from Evertse's Lemma 24. In the characteristic-zero field K, nonzero as a function on the product of the V_h is equivalent to a nonzero composed polynomial: the basis parametrization is surjective and K is infinite. For the direction used in the source proof, a single point at which the restriction is nonzero already proves that G is not the zero polynomial. Do not replace the actual Lemma 24 proof by assuming the original F has a nonzero value on those subspaces.

### Index convention and a sharp boundary test

For nonzero F and a point x, its normalized index is the minimum w_d(u) over nonzero evaluated Hasse derivatives D^uF(x). The set is nonempty because translation X -> x+X is an invertible polynomial substitution; the translated nonzero polynomial has a nonzero coefficient. It is finite after restricting to derivative orders bounded by the coordinate degrees of F. Equivalently, all derivatives of weight strictly below a threshold sigma vanish exactly when sigma is at most that minimum. This explains the strict-threshold convention without assuming the false closed-threshold maximum exists.

A witness D^jF(x)!=0 gives

    index_(x,d)(F) <= w_d(j),

not a strict inequality. Combine this weak inequality with the strictly smaller budget in A8. For F=X^2, x=0 and d=2, both the index and the weight of the first nonzero derivative j=2 equal 1. The false inequality index<w_d(j) would read 1<1.

### Integration checklist and dependency graph

The proof graph is A1+A2 -> A3; A2 -> A4; the monomial formula -> A5; block-homogeneous support -> A6; A5+A6 -> A7; the existing grid lemma+A3+A4+A5+A7 -> A8; the existing index witness inequality then gives the parent theorem's conclusion. A1, A2, A5 and the index inequality may already be present in the inherited APIs: identify and reuse them before creating any node. A3's polynomial identity and its nonzero-extraction consequence should be separate declarations if both become library-facing.

For every truly missing declaration, record a precise statement, the above proof steps, the exact baseline/local prerequisites, and source p. 68 or an explicit “elementary supporting lemma” attribution. Keep `implementationStatus: unchecked`. No new definition or construction carrier is required; these are lemmas about existing polynomials, derivatives, weights and grids. Do not mark the whole `nonvanishing-on-grids` node closed until Lemma 24 and its sharp-Roth input are actually decomposed without gaps.

Required examples for suggested signatures include: the binomial factor for X^2; a zero matrix in A3 (identity still valid); a parameter derivative of order zero; a parameter degree bound below one forcing k=0; all blocks initially zero but the full multidegree derivative constant; one zero and one nonzero block; standard basis vectors with zero coordinates; the nonhomogeneous 1+X counterexample; and equality at the index boundary. These are prospective integration tests, not new tests counted in the unchanged packet inventory.

### Checks performed in this continuation

A standard-library Python scratch calculation used sparse multivariate polynomials with `fractions.Fraction` coefficients; Hasse derivatives used the monomial binomial formula, and composition multiplied explicit block-linear polynomials. Deterministic seed: 1027. It checked the entire polynomial equality of A3, not just a single evaluation. Parameters: m in {1,2}, N in {2,3}, three polynomial/matrix trials for each pair, alternating block degrees 1 and 2, rational matrix entries with denominators 1 or 2, including a zero block map. Derivative orders included zero, coordinate orders 1 and 2 and a mixed parameter order. For nonzero sampled left sides it checked existence of a nonzero original jet and equality of the extra block weights. Replacement checks ranged over supported derivative orders and every subset of zero blocks.

Results: 456 exact polynomial identities; 179 nonzero extractions; 453 nonzero-value replacement cases. A separate exact-rational loop over m=1,...,4, N=2,...,6, epsilon=num/den in (0,1] with num,den=1,...,6, and d=1,...,7 checked 2,940 weight bounds. Eleven additional tests covered the equality boundary, missing-binomial-factor counterexample, nonhomogeneous replacement failure, nonzero-vector versus nonzero-coordinate distinction, and positive/zero residual degrees. Finite checks do not establish the general results; the proofs above are the mathematical argument. The scratch program was not installed as a repository test, and no Lean proof or formalization claim is made.

### Access and validation limitations

The large packet fetch returned no content; the raw-file fetch and blob retrieval did not produce a usable full packet. This continuation therefore changes only this handoff and preserves the existing packet, reader and suggested Lean file byte-for-byte. No inherited declaration coverage, source-issue inventory, independent review, or global closure was re-certified. The next editor needs full-file access for synchronized integration and the repository's packet validator. This is an access/integration boundary, not a claim that A1–A8 require additional mathematical hypotheses beyond those stated.

## Historical checkpoint — 26 September 2026

The following is the previous handoff, retained as historical context. Its counts and verification statements are reports by that worker, not checks rerun in the current session. Its “Where to resume” items 2–4 now have the proof supplement above; item 1 and packet integration remain open.

Issue #1027 · Codex session `codex-a71f92` · 26 September 2026.
Continues the checkpoint from PR #2769 by Claude Code `cc-2aeb03`.

### This checkpoint

The packet remains `partial`, scope DT.0–DT.5, part null. All 348 inherited node IDs
are retained; 346 inherited node objects are unchanged. Five new DT.2 lemma nodes
decompose Evertse 1996, Lemma 25:

1. `grid-floor-capacity`: the corrected degree/multiplicity budget, including B < 1.
2. `univariate-integer-grid-jet`: root multiplicity over a characteristic-zero integral domain.
3. `partial-specialization-jet`: compatibility of Hasse jets with evaluation of the first variable.
4. `nonzero-partial-grid-specialization`: preserve nonzeroness and residual coordinate degrees.
5. `rectangular-integer-grid-jet`: induction on variables, including zero variables.

No definition or carrier is introduced. The chain consumes DT.1's Hasse derivatives and
pinned Mathlib root-count, floor and polynomial-equivalence APIs. The parent
`nonvanishing-on-grids` now imports the grid lemma and identifies exactly the unfinished
hyperplane and nonzero-block steps.

A source-fit correction changes `sharp-roths-lemma` to use the already planned `height2`
for both the polynomial coefficient vector and the points. Evertse 1996 §1 p. 2 defines
Euclidean, not maximum, norms at infinite places. Packet, reader and Lean signature now
agree. This correction does not close the sharp-Roth/Faltings proof gap.

Source findings E215 (degree of the multiplicity product) and E216 (strict threshold in
the index definition) are recorded with preprint and published locators, checksums,
counterexamples and a bounded search for existing corrections. Both formulas were checked
visually in both versions. No independent-review verdict is claimed.

### Inventory and checks

- 353 nodes: 39 definitions, 5 constructions, 176 lemmas, 128 theorems, 5 applications.
- 331 API items and 189 tests across all nodes. The validator reports 326 API items and
  184 tests because its counters cover definitions/constructions only.
- 36 inherited planets, unchanged; 378 baseline declarations, 33 sources, 68 source issues,
  21 gaps, 4 requests and 11 restructure proposals.
- Full packet validator with the pinned declaration index: 0 errors, 0 warnings.
- Four-file intake validation: passed.
- Full suggested Lean file: elaborates against pinned Mathlib
  `082e2d37e8b0463410cdb532e111cd43d5a66174`; 731 warnings, all declarations using
  `sorry`, and no errors. The helper checked all 8,482 reached Mathlib source files against
  the pin before using cached objects. No Tau Ceti module is imported.
- Separate scratch Lean checks prove the general floor-capacity inequality and the cubic
  value-only counterexample with no `sorry` and no warnings. They are checks, not published
  implementations.
- Exact integer/rational checks passed: 55,760 floor-capacity cases, 2,292 rectangular-grid
  witnesses, 2,286 nonzero partial specializations and 7,620 jet-specialization identities.
  Value-only and positive-characteristic counterexamples passed. These finite checks are
  not proofs of the general planned lemmas.
- Every new API and test has its named signature/example in the suggested file. All nodes
  remain `implementationStatus: unchecked`.
- Read the six reviewed AUDIT-07 rows before planning; respected the accepted RS-03
  ownership boundary; no new absolute-height foundation or numerical enumeration work.
  Read the roadmap, applicable links, and EffectiveBounds/GlobalNumberFields style models.

### Where to resume

Start with the narrowed grid gap in DT.2. The public author preprint
[95-subspace.pdf](https://pub.math.leidenuniv.nl/~evertsejh/95-subspace.pdf), §7 pp. 63–68,
contains the full proof, including the reduction credited to Schmidt.

1. **Lemma 24, pp. 64–67:** normalize an annihilating hyperplane covector; bound its H₂
   by the product of binary coordinate heights; select a large-height binary direction.
   Extract successive lowest powers in the remaining variables, preserving the vanishing
   of low-weight jets and coefficient-height bounds. Restore the binary multihomogeneous
   degrees by monomial multiplication, then apply sharp Roth.
2. **Lemma 26, p. 68:** compose a nonzero restricted derivative with hyperplane basis
   coordinates. Apply `rectangular-integer-grid-jet` with B = N/ε and per-coordinate
   degrees r_h. Decompose the linear-substitution chain rule and prove the extra weighted
   derivative order is at most m(N−1)ε/N, yielding a total strictly below 2mε.
3. **Nonzero blocks:** EF Proposition 12.1 excludes the zero vector in each block;
   Lemma 26's displayed grid does not. Formalize the multihomogeneity argument: a
   derivative nonzero at a zero block has residual block degree zero and is independent
   of that block, so replacing zero by a basis vector preserves its value and stays in
   the grid. Do not silently infer nonzero coordinates from a nonzero jet.
4. **Index boundaries:** use vanishing for weights strictly below the threshold.
   A nonzero jet gives index ≤ its weight, not a strict inequality. Keep the final
   strict bound separate.

The original 21 gaps remain in number; one is narrowed. DT.2 and the whole roadmap are
not closed. The existing DT.1 closure and DT.3 qualitative decomposition are inherited,
not newly reverified in full here. Other remaining inputs are the absolute Minkowski and
Davenport arguments, sharp Roth/Faltings, Bombieri–Vaaler, the EF internal lemmas,
ESS §§6–12, Schmidt's norm-form proof, explicit logarithmic-form proofs, equation-specific
DT.4 proofs, and the listed DT.5 inputs. Four cross-roadmap requests remain unchanged.

The inherited absolute-height API gap remains subject to RS-03's single-owner boundary:
consume existing/planned upstream height APIs rather than create a second foundation.
DT.3 owns logarithmic-form bounds, DT.4 their equation-specific conversion, and ED.2 the
certified numerical evaluation and exhaustive enumeration.

### Earlier checkpoint context

The earlier work supplied the complete DT.1 Liouville/Thue/Roth chain, the DT.0 height and
approximation comparisons, the DT.3 qualitative transcendence arguments, and the DT.4/DT.5
statement inventory. Its source reading and unresolved requests are retained in the packet.
This continuation does not claim to have reread all 33 sources or independently checked
every inherited proof outline. The present source reading covers Evertse 1996 §1 p. 2 and
§7 pp. 63–68, with published checks of pp. 290 and 294.
