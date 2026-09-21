# Lipnowski–Tsimerman: finite-field abelian-variety counts

Partial checkpoint by **Codex — codex-c83e7a**, 21 September 2026. Refs #1332.

This is a source-qualified extraction and routing proposal, not a formalization. It records 113 items: 8 library imports, 26 planned imports and 79 missing items. Ten routes assign 60 missing items and 25 planned source items without duplication. The remaining 19 missing items are explicitly withheld. All 37 definitions/constructions have a consumer-derived API and at least three discriminating acceptance tests in the JSON.

## What was read

The [public preprint](https://arxiv.org/pdf/1511.02212v1), dated 6 November 2015, was read completely: all 38 pages, §§0–5.7.3 and the bibliography. Both [Tsimerman's page](https://www.math.toronto.edu/jacobt/) and [Lipnowski's page](https://sites.google.com/site/michaellipnowski/) point to this version. Crossref identifies the [published article](https://doi.org/10.1215/00127094-2018-0029) as Duke Math. J. 167(18) (2018), 3403–3453, hence 51 pages. **No match between the preprint and the final text has been established.** The canonical publisher full-text and download links returned security-check HTML, not a PDF. The differences below are findings about the public v1 only.

The supplementary primary reading is [Conrad, *Polarizations*](https://virtualmath1.stanford.edu/~conrad/vigregroup/vigre04/polarization.pdf), all ten pages, and [Yun, *Orbital integrals and Dedekind zeta functions*, v2](https://arxiv.org/abs/1303.2420), introduction and §§1.3–1.5 plus §§4.8–4.13, including the complete proofs of Lemma 4.9 and Proposition 4.13. The rest of Yun is not claimed read. Main-paper pages 5, 10, 15, 18, 27, 30 and 36 were also visually checked to rule out extraction artifacts in the problematic formulas.

Source files were freshly downloaded on 2026-09-21. SHA-256 values and exact access timestamps are in `source.files`:

- https://arxiv.org/pdf/1511.02212: `5ceed8168ce37b75da67699189e7e8730527c31f3339dce979a1a1901243f81a`; 38 pages; all 38 pages.
- https://arxiv.org/pdf/1303.2420: `a9f560f9c7ed334ff4895cde2676476cd430e0efa7c14e3d6d508df5326bc347`; 19 pages; selected sections specified above.
- https://virtualmath1.stanford.edu/~conrad/vigregroup/vigre04/polarization.pdf: `7156a718e879f7cc752a460ad61c14dbcfd2978a13149b7024c9809ac487af6b`; 10 pages; all 10 pages.

## The mathematical dependency chain

For fixed prime p, the paper separates the unpolarized count B(p,g) from the principally polarized count A(p,g). Both are unweighted counts of **F_p-isomorphism classes**. Neither is the coarse moduli point count nor the stack mass Σ1/|Aut|. The large difference comes from many inequivalent principal polarizations on a fixed underlying variety.

The unpolarized branch first bounds Frobenius polynomials, hence isogeny classes, then describes each isogeny class by rational orbits on prime-to-p Tate lattices and p-adic Dieudonné lattices. Local centralizer orbits and global adelic class sets give separate factors. The prime-field restriction matters: F and V are Q_p-linear for F_p, whereas nonprime finite fields require semilinear centralizers. Tate-module Frobenius conventions must be compared explicitly with geometric Frobenius on cohomology; purity by itself does not give semisimplicity.

The polarized branch imports duals, the rigidified Poincaré bundle, Mumford's homomorphism, rational Néron–Severi space and Rosati positivity. A fixed principal polarization identifies other principal polarizations with positive integral units modulo Rosati congruence. The model-ring construction then leads to definite hermitian lattices. A mass formula counts all projective classes with automorphism weights; Gram matrices count free classes without weights. The Steinitz/class-group obstruction and the finite automorphism bound are therefore real proof steps.

The statistical branch distinguishes unconditional statements from Conjecture 5.2. The conjecture compares logarithmic polarization counts with model-ring orbit counts only for products of matrix algebras over CM fields. The paper's large elliptic-factor, spacing and enhanced Cohen–Lenstra conclusions require additional checks described below. Definition 5.16's joint limit must exist and be tight before it is a probability measure.

## Source gaps and repairs

**G0 — Final version.** Obtain a legitimate final or author-accepted 2018 version and reconcile all numbered results. A 38-versus-51-page difference can reflect typesetting; it neither proves a mathematical change nor licenses assuming equality. Keep all identifiers stable and record exact changed statements.

**G1 — Polynomial and discriminant constants.** Lemma 2.1 fails literally at g=1,q=2: the five polynomials X²−aX+2 with −2≤a≤2 already exceed 2√2. X²−q also shows why the root-radius condition alone does not force reciprocal coefficients. A checked replacement for reciprocal polynomials is (4g+1)^g q^(g(g+1)/4), obtained from the first g integral power sums, the bound |s_k|≤2gq^(k/2), Newton identities and reciprocity. The resulting isogeny-class logarithmic upper bound retains coefficient 1/4.

The discriminant in (26) is a squared Vandermonde product, giving exponent d(d−1), not binomial(d,2). In (28), powers of 2 raised to multiples of g² cannot be absorbed into o_g(1) when p is fixed. Thus the 17/2 coefficient is not exported. A useful existing substitute is Tau Ceti's h_K≤|D_K|4^[K:Q], which directly gives the coarse exp(O_p(g²)) class-number scale after the corrected discriminant bound; the sharper analytic constants need not be reimplemented for that weaker goal.

**G2 — Local orders and repeated eigenvalues.** Yun Lemma 4.9 counts a fiber with prescribed *flag quotients*, uses full characteristic polynomials in the resultant and counts unordered pairs of blocks once. It does not identify a fiber with fixed intersections in every summand. Yun also makes a residue-field reduction before treating R as a quotient of O[[X]]. For example, an unramified quadratic O_F/Z_ℓ cannot be a quotient of Z_ℓ[[X]], whose unique residue field is F_ℓ. The v1 weak-composition estimate in (13) fails already at δ=0. Dualizing the lattice sandwich, repeated-eigenvalue shear quotients, stabilizer representative choices and multiplicities all remain to close. The statement of Yun for regular semisimple orbital integrals is not a bound for arbitrary repeated blocks without further argument.

**G3 — Polarization normalization.** Conrad Example 2.2 verifies (1,φ_L)*P_A=[2]*L⊗L^(−2), whose NS class is 2[L]. The v1 equality with L is not literal. Its Φ_f=(1/2)f^(−1)φ_L is consistent with D_f(a,1) only after rationalizing NS; Φ_f([L₀])=1/2 and D_f(1,1)=2[L₀]. The principal-polarization orbit map uses f^(−1)λ. Moreover Remark 4.8's unqualified reduced-trace equality fails when End⁰(A)=Q: geometric trace of 1 is 2g and reduced trace is 1. The JSON retains the actual Tate-representation trace and does not copy the incorrect identity.

**G4 — Hermitian masses.** Equation (39)'s displayed factorial product has logarithm (1/2)[K:Q]n²log n+O([K:Q]n²), whereas (51) prints coefficient 1. This is visible in the PDF, and elementary summation checks it. The relative quadratic discriminant also has 4p sin²θ rather than p sin²θ; its O_p(d) logarithmic scale survives. The step (49) from upper bounds for residues to a two-sided bound for their quotient is not justified by those upper bounds alone. Acquire Gan–Yu's actual measure and local-density formula, including its dyadic domain, and the needed analytic estimates before accepting (39), (51), (54)–(56) or the 0.99 threshold. An asymptotic implication also needs an explicit sufficiently-large-g quantifier absorbing uniform O_p(g²) terms.

**G5 — Conditional scope and real Frobenius.** Conjecture 5.2 assumes CM-field endomorphism factors. The real Weil number with field Q(√p) produces the definite quaternionic exception already treated separately in §3.2.2. Corollary 5.13 needs a bound for varieties involving that factor, or an appropriately stated extra hypothesis. Strong approximation also needs its noncompactness hypotheses; at real ramified places reduced norms have positivity restrictions, so the class-set identification must use the correct narrow/norm-image quotient rather than automatically an ordinary class group.

**G6 — Small-prime counterexample.** Over F₂, the smooth curve E: y²+xy=x³+x²+1 has discriminant 1, #E(F₂)=2 and #E(F₄)=8. Both point groups are 2-groups, contradicting the literal v1 Lemma 5.19. Direct enumeration over F₂[t]/(t²+t+1) gives one and seven affine points, respectively. For p≥7 the source argument has a safe repair: the Hasse interval at p contains only the p-power p; trace a=1 then gives #E(F_(p²))=p(p+2), not a p-power. No p=2 conclusion is exported. The final paper may have corrected this; it was not acquired.

**G7 — Statistical normalization and limits.** With 2g cyclic eigenangle gaps, two eigenvalues each repeated h times force at least 2h−2 zero gaps, hence mass at least h/g−1/g, not h/g. State a limiting discrepancy bound in a specified metric. The finite-g matrix laws in Definition 5.16 exist, but the general joint limit and normalization are extra theorems. The odd-prime union bound in Example 5.17 proves a positive liminf, not convergence. Theorem 0.3 retains both “no repeated factors” and “coprime to X²−p”; it does not alone prove that every kind of squarefree isogeny class has negligible probability.

**G8 — Remaining source and extraction closure.** Read the original Tate–Honda and Waterhouse proofs, Jacobowitz's dyadic classification, Gan–Yu, Lang's cone theorem, the analytic residue/regulator estimates, norm-unit/class-group comparison, Serre's finite-group bound and Friedman–Washington. Expand the informal §1 stack/cohomology discussion and its Euler-characteristic suppliers, Remark 2.3's lower bound and the local/global proof interiors into atomic items. The source explicitly says §1 is not used later; an orbifold Euler characteristic must not be used as an ordinary rational Betti-number identity. The general trace-formula owner (upstream PR196, cited by the atlas) needs an exact current stage locator; DWP.7's weight bounds are already a checked planned import. FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.2 has no direct reviewed-audit row at this snapshot, so its absence evidence uses the explicitly cross-referencing A4/A3 reviewed audits plus whole-library searches; this does not pretend that an unaudited packet was reviewed.

## Routes and library evidence

1. **AbelianSchemesAndArithmeticModuli** (source; 15 items). A2 already owns duals, Poincaré bundles, polarizations and Rosati. Add the explicitly normalized NS and orbit dictionary there; use Conrad to repair v1 graph-pullback and rationalization errors.

2. **AbelianSchemesAndArithmeticModuli** (source; 1 items). Tate-module realizations are already an A4 target; finite-field full faithfulness is a separate consumer.

3. **AbelianSchemesAndArithmeticModuli** (source; 6 items). Import the existing field Hom/End carriers and add only the already planned arithmetic, semisimple and Rosati-cone targets.

4. **FiniteFlatGroupsAndIntegralPadicHodgeTheory** (source; 1 items). The existing Dieudonné owner fixes covariance and F,V. A new finite-field application must consume it, not reconstruct it.

5. **GeometryOfNumbersAndQuadraticArithmetic** (source; 13 items). GN.2 explicitly owns integral/hermitian lattices, local invariants, genera and local-global theory. Existing rational Z-lattices and CM fields are reused; O_L-projective lattices and dyadic norm ideals are not already built.

6. **GeometryOfNumbersAndQuadraticArithmetic** (source; 15 items). GN.3 owns arithmetic quotient counts, local densities and mass. Add the checked Yun local inputs and weighted-to-unweighted comparison, while the disputed exact estimates remain outside the route.

7. **AdelicAlgebraicGroups** (source; 1 items). Strong approximation is an existing owner target. Keep the definite quaternion rank-one exception and norm-image obstructions visible.

8. **ArithmeticStatistics** (source; 3 items). ST.0 owns arithmetic families and weighted/unweighted measures; define these counts on actual F_p-isomorphism classes.

9. **ArithmeticStatistics** (source; 9 items). ST.5 explicitly owns random-matrix laws and function-field statistics. Conjectures stay hypotheses, and the enhanced limit is a separate existence task. No disputed 0.99 endpoint is routed here.

10. **AbelianSchemesAndArithmeticModuliPartIIFiniteFields** (part-ii; 21 items). A1–A6 construct relative geometry and realizations but have no Honda–Tate/Waterhouse classification or prime-field lattice-counting layers. This extension consumes them; PEL moduli and statistical models remain with their existing owners.

The sole proposed Part II ends at the explicit finite-field classification and counting suppliers in its brief. It imports the existing abelian-variety carrier and A2–A4/A6, R07.2, GN.2–GN.3 and AA.4. **PELModuli M1–M6 retains ownership of the polarized moduli stack and the rational-object/coarse-point distinction.** ArithmeticStatistics retains the measures and conditional distribution endpoints. No second general mass-formula, Picard, Dieudonné or CM foundation is proposed.

The complete 211-record atlas portfolio was searched and its blob identities checked against the current snapshot. Relevant full owner descriptions, the new-roadmap records, the available packet and the reviewed `data/library-coverage.json` were inspected. The six new roadmap records concern the analytic/Habiro/Witt programme and Lawrence–Venkatesh; none supplies this finite-field classification. Reserved identifiers have no collision. The JacobianChallenge Layer E audit distinguishes built field-level abelian varieties from the absent dual/polarization and general multiplication-isogeny theory; A2/A4/A6, GN.2/GN.3, PEL, AA.4 and ST.0/ST.5 audits make the same boundaries explicit.

The pinned source declarations were opened and their statements read. The eight library items import: AbelianVariety/dim/smooth; IsIsogeny/isIsogeny_iff; WittVector.Isocrystal and its morphisms; NumberField.IsCMField; intrinsic CM conjugation and embedding identities; the real-right-limit analytic class number formula; Tau Ceti's uniform class-number bound; and Matrix.card_GL_field/card_matrix. Witt vectors or a one-dimensional isocrystal classification do not supply Dieudonné classification of abelian varieties; Hodge polarizations do not supply geometric polarizations.

## Validation

`check_paper.py` and `intake.py check-files` were run on the actual named files. Custom checks require those files to exist, check unique IDs and route ownership, validate real stage/parent/area IDs, verify all primary-source hashes and every D/C API/test block, and reject accidental local paths. Mathematical checks independently enumerate the F₂/F₄ elliptic counterexample and finite matrix groups, evaluate Yun's partition counts including colength zero, test the corrected reciprocal-polynomial bound in genus one, the weak-composition failure, the factorial leading coefficient, convex concentration on integer compositions, cyclic zero-gap multiplicities and the p≥7 repair.

These are finite and analytic sanity checks, not Lean proofs. No Lean file is requested by this paper issue and no Lean compilation was performed. The JSON deliberately remains `partial`; passing a schema checker does not certify source closure.

## Item index

Full statements, qualifications, library declarations, existing stage IDs, APIs and tests are in the adjacent JSON. “Withheld” means missing and absent from every proposed route.

| Item | Kind | Status | Locator |
|---|---|---|---|
| `abelian-variety` — Abelian variety over a field | definition | library | §0; §3 setup |
| `unpolarized-count` — Unweighted abelian-variety count | definition | planned | §0 p.1 |
| `ppav-count` — Unweighted principally polarized count | definition | planned | §0 pp.1–2 |
| `polarization-fiber` — Number of polarizations on a fixed variety | definition | missing | §4.4; Conjecture 5.2 |
| `main-unpolarized-source` — Source main unpolarized estimate | theorem | missing / withheld | Theorem 0.1; §3.2.3 (28) |
| `main-repeated-source` — Source squarefree-isogeny probability | theorem | missing / withheld | Theorem 0.3; Proposition 4.17 |
| `main-elliptic-source` — Source conditional large elliptic factor | theorem | missing / withheld | Theorem 0.2; Corollary 5.13 |
| `trace-formula` — Compactly supported trace formula | theorem | missing / withheld | §1 (1)–(2) |
| `weights-source` — Weights used in the point-count heuristic | theorem | planned | §1 p.3 |
| `euler-source` — Orbifold Euler characteristic heuristic | theorem | missing / withheld | §1 pp.4–5 |
| `isogeny` — Isogeny of abelian varieties | definition | library | §3 setup |
| `rational-endomorphism` — Rational endomorphism algebra | definition | planned | §3 pp.6–7 |
| `poincare-decomposition` — Isogeny decomposition and semisimplicity | theorem | planned | §3.2.2; Proposition 4.16 |
| `tate-module` — Prime-to-characteristic Tate module | definition | planned | §3 setup |
| `tate-hom` — Tate full faithfulness over finite fields | theorem | missing | §3 lattice classification; [25] |
| `weil-polynomial` — Frobenius polynomial and reciprocity | definition | missing | §2; §4.3 |
| `isogeny-polynomial` — Frobenius polynomial determines the isogeny class | theorem | missing | Corollary 2.2, Tate input |
| `honda-tate` — Honda–Tate simple isogeny classification | theorem | missing | §0; §3.2.2; Proposition 4.14 |
| `power-sum-count` — A safe reciprocal-polynomial counting bound | theorem | missing | §2 Lemma 2.1, repaired elementary bound |
| `power-sum-source` — Printed polynomial-count constant | theorem | missing / withheld | §2 Lemma 2.1 |
| `isogeny-class-upper` — Asymptotic count of isogeny classes | theorem | missing | Corollary 2.2 with repaired power-sum-count |
| `isocrystal` — Frobenius isocrystal carrier | definition | library | §3 p-adic realization |
| `dieudonne-lattice` — Integral Dieudonné realization | definition | planned | §3 setup |
| `marked-lattice-space` — Prime-to-p and p lattice spaces | definition | missing | §3 equations (5)–(6) |
| `marked-quasi-isogeny` — Marked quasi-isogenies classified by lattices | theorem | missing | §3 (5)–(6) |
| `forget-marking` — Isomorphism classes as rational orbits | theorem | missing | §3 (7) |
| `prime-p-centralizer` — The prime-field p-component reduction | theorem | missing | Remark 3.2 |
| `local-order` — Local monogenic order | definition | missing | §3.1.2 |
| `saturation-normalization` — Normalized lattice sandwiches | theorem | missing | §3.1.2 |
| `flag-fiber` — Stable lattice with prescribed flag quotients | definition | missing | §3.1.3; Yun §4.8–4.9 |
| `extension-shear` — Centralizer shears identify equivalent extensions | theorem | missing | Lemma 3.1 and proof |
| `yun-resultant-fiber` — Resultant cardinality of a disjoint-spectrum fiber | theorem | missing | Yun Lemma 4.9 pp.14–15; LT §3.1.1 |
| `extension-determinant-bound` — Bound after removing zero eigenspaces | theorem | missing | §3.1.4 pp.8–10 |
| `punctual-hilbert-count` — Finite-colength ideal count | definition | missing | Yun §4.12–4.13 |
| `yun-partition-formula` — Yun finite-colength partition formula | theorem | missing | Yun Proposition 4.13 pp.16–17 |
| `hilbert-crude-bound` — Crude partition upper bound | theorem | missing | LT §3.1.5; Yun Proposition 4.13 |
| `local-orbit-source` — Unclosed local orbit estimate | theorem | missing / withheld | §§3.1.5–3.1.6 |
| `stabilizer-depth-source` — Unclosed integral stabilizer-index bound | theorem | missing / withheld | §3.2.1 (16)–(20) |
| `adelic-class-set` — Adelic class set of the endomorphism group | definition | missing | §3.2 (15) |
| `strong-approximation` — Strong approximation supplier | theorem | planned | §3.2.2 before (21) |
| `nonabelian-class-comparison` — Class-set comparison by reduced norms | theorem | missing | §3.2.2 (21) |
| `class-formula` — Analytic class number formula | theorem | library | §3.2.2 (22) |
| `coarse-class-bound` — Available uniform class-number bound | theorem | library | Coarser available replacement for §3.2.2 |
| `weil-discriminant-bound` — Correct elementary discriminant estimate | theorem | missing | §3.2.2 (26), corrected exponent |
| `regulator-source` — Skoruppa input awaiting original proof | theorem | missing / withheld | §3.2.2 (23), [24] |
| `residue-source` — Louboutin input awaiting original proof | theorem | missing / withheld | §3.2.2 (24), [18] |
| `dual-poincare` — Dual variety and rigidified Poincaré bundle | definition | planned | §4.1; Conrad §1 |
| `polarization` — Polarization as a positive symmetric morphism | definition | planned | Definition 4.1; Conrad Definitions 2.1,3.2 |
| `mumford-map` — Mumford homomorphism of a line bundle | construction | planned | §4.1; Conrad Example 2.2 |
| `graph-pullback` — Correct graph-pullback normalization | theorem | missing | Conrad Example 2.2 pp.6–7, correcting LT §4.1 |
| `phi-kernel` — Kernel of the Mumford map | theorem | missing | §4.1 (1)–(2); Conrad Lemma 2.3 and p.8 |
| `phi-ample-isogeny` — Ample line bundles induce isogenies | theorem | planned | §4.1 (3); Conrad Remark 2.4 |
| `finite-field-polarization-descent` — Line-bundle realization over a finite field | theorem | missing | Remark 4.2; Conrad Theorem 2.6 |
| `polarized-isomorphism` — Isomorphism of symmetric morphisms | definition | planned | Definition 4.3 |
| `phi-pullback` — Pullback covariance | theorem | planned | Remark 4.4 (29) |
| `rosati` — Rosati involution | definition | planned | Definition 4.5; Conrad §3 |
| `ns-rational` — Rational Néron–Severi space | definition | missing | §4.2 with rationalization made explicit |
| `ns-rosati-map` — Normalized Néron–Severi/Rosati map | construction | missing | §4.2, Lemma 4.6 with rational domain corrected |
| `endomorphism-trace` — Geometric endomorphism trace | definition | planned | Definition 4.7; Conrad Definition 3.3 |
| `degree-polynomial` — Degree characteristic polynomial | theorem | planned | §4.3, Mumford §19 Theorem 4 |
| `rosati-positivity` — Positive Rosati trace pairing | theorem | planned | §4.3; Conrad Theorem 3.4 pp.9–10 |
| `positive-ample` — Ample classes and positive symmetric elements | theorem | missing | Proposition 4.9 |
| `real-cone` — Real ample-cone matrix description | theorem | missing | Proposition 4.10 |
| `polarization-orbits` — Polarizations as Rosati-conjugacy orbits | theorem | missing | Proposition 4.11 |
| `integer-matrix-example` — No-CM elliptic-power orbit example | theorem | missing | Example 4.12 |
| `cm-field` — CM field and maximal real subfield | definition | library | §4.4.1; Definition 5.1 |
| `cm-conjugation` — Intrinsic CM conjugation | definition | library | Definition 5.1 |
| `cm-unit-orbits` — Polarizations for a maximal CM endomorphism order | theorem | missing | Example 4.13 |
| `prime-field-end-algebra` — Commutative endomorphisms in the nonreal prime-field case | theorem | missing | Proposition 4.14(1) |
| `waterhouse-orders` — Realization of nonreal prime-field orders | theorem | missing | Proposition 4.14(2), Waterhouse Theorem 6.1 |
| `squarefree-pol-count` — Squarefree nonreal polarization bound | theorem | missing | Proposition 4.16 |
| `model-ring` — Model ring with positive involution | definition | missing | Definition 5.1 |
| `model-orbit-count` — Positive-unit model orbit count | definition | missing | Definition 5.1; Conjecture 5.2 |
| `model-comparison-conjecture` — Conjectural comparison with the model ring | theorem | missing | Conjecture 5.2 |
| `unit-norm-label` — Totally positive unit norm labels | definition | missing | §5.2 |
| `unitary-group` — Unitary group of a definite hermitian space | definition | missing | §5.2 |
| `hermitian-lattice` — Integral projective hermitian lattice | definition | planned | Definition 5.3 |
| `hermitian-dual` — Dual and unimodularity | definition | planned | Definition 5.3 |
| `gram-orbit-bijection` — Free unimodular lattices and Gram congruence | theorem | missing | Proposition 5.4 |
| `norm-ideal` — Norm ideal of a local hermitian lattice | definition | missing | Definition 5.5 |
| `local-hermitian-classification` — Local unimodular classification input | theorem | planned | Proposition 5.6 and following paragraph |
| `hermitian-genus` — Genus of a hermitian lattice | definition | planned | §5.3 (37) |
| `genus-double-cosets` — Hermitian genus as a unitary class set | theorem | missing | §5.3 (37) |
| `hermitian-mass` — Weighted hermitian genus mass | definition | planned | §5.4 (38) |
| `tamagawa-mass` — Unitary Tamagawa mass formula | theorem | planned | §5.4 (38) |
| `density-source` — Unverified simplified local-density formula | theorem | missing / withheld | §5.4 (39) |
| `relative-discriminant` — Elementary CM relative-discriminant bound | theorem | missing | §5.4.1 (41), corrected factor |
| `factorial-asymptotic` — Factorial product asymptotic | theorem | missing | §5.4.3, elementary audit of (39) to (51) |
| `mass-asymptotic-source` — Source leading mass asymptotic | theorem | missing / withheld | §§5.4.3–5.5 |
| `gl-card` — Finite general linear group cardinality | theorem | library | Lemma 5.8; Example 5.17 |
| `finite-integral-group` — Minkowski finite integral group bound | theorem | missing | Lemma 5.8 and full proof |
| `mass-cardinality-comparison` — Passing from mass to class count | theorem | missing | §5.4.4 (52)–(53) |
| `free-projective-comparison` — Free versus projective mass classes | theorem | missing | Remark 5.7; (54) |
| `model-count-source` — Source model-ring logarithmic bound | theorem | missing / withheld | §5.4.5 (55) |
| `convex-concentration` — Convex mass-concentration inequality | theorem | missing | Lemma 5.9 |
| `model-concentration-source` — Source model concentration threshold | theorem | missing / withheld | Proposition 5.10 |
| `split-prime-density` — Density of primes splitting in a class-number-one CM field | theorem | missing | Lemma 5.11 proof |
| `cm-elliptic-existence` — Elliptic curve with class-number-one endomorphisms | theorem | missing | Lemma 5.11 proof |
| `elliptic-power-source` — Source elliptic-power asymptotic | theorem | missing / withheld | Lemma 5.11 (56) |
| `spacing-measure` — Normalized eigenangle spacing measure | definition | missing | §5.6, expanded convention |
| `spacing-source` — Source random-matrix discrepancy conclusion | theorem | missing / withheld | Corollary 5.14 |
| `cl-measure` — Cohen–Lenstra probability measure | definition | planned | §5.7.1 |
| `friedman-washington` — Random integral matrices and Cohen–Lenstra | theorem | planned | §5.7.1 [9] |
| `enhanced-cl` — Proposed enhanced Cohen–Lenstra law | definition | missing | Definition 5.16 |
| `cl-two-prime` — Two-extension zero-cokernel probability at two | theorem | missing | Example 5.17, first case |
| `cl-odd-prime` — Uniform positive bound at odd primes | theorem | missing | Example 5.17, second case |
| `enhanced-cl-conjecture` — Source enhanced-statistics conjecture | theorem | missing | Conjecture 5.18 |
| `elliptic-pgroups-source` — False small-prime lemma in the public preprint | theorem | missing / withheld | Lemma 5.19 |
| `elliptic-pgroups-large` — Large-prime repair of the elliptic lemma | theorem | missing | Lemma 5.19, explicitly restricted elementary repair |
| `point-count-isogeny` — Point counts are isogeny invariant | theorem | missing | Corollary 5.20 proof |
| `enhanced-failure-source` — Source failure of enhanced Cohen–Lenstra | theorem | missing / withheld | Corollary 5.20 |
| `reduced-trace-source` — Unqualified reduced-trace identification in v1 | theorem | missing / withheld | Remark 4.8 |
| `ramification-count` — Ramified-prime count from the relative discriminant | theorem | missing | §5.4.2 (44), sharper elementary bound |
