# Independent review: Lipnowski–Tsimerman (2018)

Job `REV-PAPER-LIPNOWSKI-TSIMERMAN-18`, issue #1333. Reviewer: Codex, session `codex-hjdg0j`, 23 September 2026. Base: `181c6175f014e3af7a7e66d5a4f26c7041ba2671`.

**Verdict: revise. The review is complete; the extraction is partial.** The previous complete status overstated source closure and treated a coefficient correction as sufficient to recover unrestricted mass/statistical conclusions. Preserve the useful local/adelic proof plans and every incoming item ID, but keep the outstanding hypotheses visible.

The reviewer did not author the extraction. Its recorded contributors are codex-c83e7a, codex-a71f92, cgp-20260923-h7q4, codex-7e92bd and Claude Code cc-442dc5. Earlier readings remain attributed to them.

## Scope and source versions

All 184 incoming item statements, locators and notes, the 13 incoming routes, 22 incoming source findings and the recorded V/D/C/L/S proof plans were inspected. The revised result has 185 items, including the separately proved fixed imaginary quadratic mass input, and 15 routes. All 122 missing items occur in exactly one route.

| Source | Fresh read | SHA-256 |
|---|---|---|
| [Lipnowski–Tsimerman](https://arxiv.org/pdf/1511.02212v1) | All 38 pages, including references. Journal text not available for collation. | `5ceed8168ce37b75da67699189e7e8730527c31f3339dce979a1a1901243f81a` |
| [Lee](https://arxiv.org/pdf/2002.04420v3) | Pages 1–10; especially §§3.1–3.3 and the corrected/refined upper bounds. | `2521898dfcd96c22950c026058b0b4e68e147aa89989964649eb317718fbbd3b` |
| [Conrad](https://virtualmath1.stanford.edu/~conrad/vigregroup/vigre04/polarization.pdf) | All 10 pages; images of pp.1,4,9 checked. | `7156a718e879f7cc752a460ad61c14dbcfd2978a13149b7024c9809ac487af6b` |
| [Yun preprint](https://arxiv.org/pdf/1303.2420v2) | Pages 1–4 and 14–18, with images at the disputed formulas. | `a9f560f9c7ed334ff4895cde2676476cd430e0efa7c14e3d6d508df5326bc347` |
| [Yun published](https://math.mit.edu/~zyun/Estimate_published.pdf) | Printed pp.400–403 and 415–419; not all 22 pages. | `639b5d47c8415f215d3e55401e17062ef3ef1feeb079960ef4baa5f360336c7b` |
| [DiPippo–Howe](https://arxiv.org/pdf/math/9803097v3) | Pages 1–3, including corrected Theorem 1.3; not its full proof. | `e72551cc19790a83c516623dcc618e72765dad3eff083294d64115d3fb4642a4` |
| [Lemmermeyer](https://arxiv.org/pdf/1309.1071v1) | Pages 1–3, including the full Proposition 1 argument; journal not collated. | `53a80b00b693203386df6ca3350b4d5891159580037ca72a2096d59776300065` |
| [Terakado–Yu](https://arxiv.org/pdf/2210.04054v1) | Pages 4–12, including local classification, density tables and (2.6)–(2.8). | `233b0f39643236a1dd7160966230f255e9b64e8bdd1f3604488a0f4a44ce3e07` |
| [Milne 1968](https://www.jmilne.org/math/articles/1968a.pdf) | Fresh image-read of printed pp.65–67 from a hash-matched cached public PDF after the fresh URL returned 406; not a full-paper read. | `8abdaf4fa604d5ed7faee3f9d4e9dc9382dc35d7b79382fe3540f495fe98fc35` |

The arXiv record and both LT author pages were checked afresh. The canonical Project Euclid endpoint remains unreadable, so this is **not** a line-by-line review of the 51-page Duke article. Lee supplies specific published corrections, not permission to identify every preprint formula with the journal version. The author-hosted 1971 Waterhouse–Milne PDF returned HTTP 406 and no matching cached copy was available; the earlier full read is not claimed as this reviewer’s work. Tate/Honda/Gan–Yu and the other supplier proofs are not all freshly read here; G8 records the limitation.

The Milne 1968 author errata page was read in full. Its pp.78–79 and p.81 corrections do not repair the p.67 abscissa. Conrad’s public notes and the Yun, Lemmermeyer and Terakado–Yu version records/author pages were searched for corrections. Four Yun preprint slips are corrected in the author-hosted published version; they are recorded as known, not newly uncorrected errors. Failure to locate another erratum does not establish priority.

## Library and ownership audit

Read the 61 cited declaration statements at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. All 32 cited files were byte-compared against their raw GitHub URLs; SHA-256 evidence is in `independentVerification.libraryFileChecks`. Imports include the existing abelian-variety/isogeny, Witt/isocrystal, finite-module/length, polynomial/resultant/norm, Brauer/centralizer and class-number infrastructure. No cited library status is a claim that the surrounding arithmetic theorem is already implemented.

Each of the 121 incoming missing IDs received a scoped family search and an exact name-variant search in both pinned libraries. The seven families were polarization/NS/Rosati; finite-field Tate/Honda/Dieudonné; hermitian lattices/mass/orbits; adelic levels/norms; CL/spacing statistics; ambiguous classes/Lang/residue bounds; and Witt/resultant recognition. Inspected near matches include quadratic-Q narrow/ambiguous norm classes, Tate cohomology rather than Tate’s isogeny theorem, Weil-divisor local orders, abstract unitary groups, and the already cited resultant/Witt infrastructure. These searches establish the stated absence at the inspected scope, not an exhaustive semantic impossibility result. The new fixed-field lemma falls in the same inspected hermitian-mass family.

Read all 33 incoming planned-stage assignments, all route stage descriptions and the relevant reviewed library-coverage entries. Additional ownership checks covered CA.3, upstream GlobalNumberFields and IntegralLattices in full, and the Multiquadratic Layer 2 specialization. R07.2/RG2.3 lack matching reviewed audit entries; that absence is not positive evidence. WC.0 is source reconciliation, while WC.6 imports a trace theorem; PR196 TraceFormula Layers 11/14 remain the finer supplier reconciliation. DWP.4 is the smooth-projective Riemann-hypothesis import. The Part II brief now includes A3 and AA.1.

Accepting a source route means its stated mathematical contract is usable at its owning layer; it does not declare the layer implemented. Four bundles/supplier matches remain rejected.

| Route | Owner | Verdict | Reason |
|---|---|---|---|
| 1 | AbelianSchemesAndArithmeticModuli | accept | A2 explicitly owns duals, Poincaré bundles, polarizations and Rosati. The corrected birigidification, graph factor two, rational NS and orbit dictionary fit that owner; import the existing abelian-variety carriers. |
| 2 | AbelianSchemesAndArithmeticModuli | accept | A4 owns Tate-module realizations. Keep the separate finite-field full-faithfulness theorem in the Part II consumer; no duplicate realization carrier. |
| 3 | AbelianSchemesAndArithmeticModuli | accept | A6 owns arithmetic Hom/End, semisimplicity and Rosati cones. The corrected reduced-trace multiplicity and Albert special case extend that owner. |
| 4 | FiniteFlatGroupsAndIntegralPadicHodgeTheory | accept | R07.2 owns Dieudonné modules and F,V conventions. Fixed Witt coefficients and characteristic-polynomial descent are adapters on the existing Witt APIs; retain the stated covariance and prime-field/general-q distinctions. |
| 5 | GeometryOfNumbersAndQuadraticArithmetic | accept | GN.2 owns hermitian lattices, local invariants, genera and local-global theory. Coefficient DVRs, monogenic orders and determinant-index adapters use existing carriers and do not duplicate the upstream integral-lattice roadmap. |
| 6 | GeometryOfNumbersAndQuadraticArithmetic | reject | Reject the bundle despite its correct GN.3 owning direction. The exact mass/density normalization and dyadic cases, uniform residue-ratio bound, genus bounds and free/projective comparison remain G4. The fixed imaginary quadratic lemma proves only its explicitly restricted case. |
| 7 | AdelicAlgebraicGroups | accept | AA.4 owns compact-level double-coset maps and stabilizer-sensitive index comparisons. The S4–S5 argument retains left stabilizers and finite support; no neatness assumption or new double-coset carrier is introduced. |
| 8 | ArithmeticStatistics | accept | ST.0 owns the arithmetic family and weighted/unweighted measures. These definitions count actual F_p-isomorphism classes and retain finiteness as a prerequisite. |
| 9 | ArithmeticStatistics | reject | Reject the bundle: G5 leaves unrestricted concentration unproved, and G7 leaves the enhanced joint probability limits unestablished. The corrected elementary spacing and odd-p implications are explicitly conditional; an unspecified quaternionic analogue is not a theorem. |
| 10 | AbelianSchemesAndArithmeticModuliPartIIFiniteFields | reject | Reject pending supplier reconciliation G8/G10. The finite-field direction is an appropriate Part II and T1–T5 are concrete targets, but general Lang, the precise trace supplier, reduced-norm images/rank-one class sets and original proof leaves are not closed. A3/AA.1 and the corrected DWP.4 imports are now explicit; general polynomial/norm results have been removed to routes 14/15. |
| 11 | PELModuli | accept | M6 owns the finite-field finiteness adapter at fixed polarization degree, importing finite-type polarized moduli from M2/M5. This avoids a circular appeal to the unpolarized count being proved. |
| 12 | AnalyticNumberTheory | accept | AN.4 owns the explicitly stated Dedekind-zeta residue upper bound. Accept only that one-item source route; it supplies no lower bound for the residue ratio and does not close G4. |
| 13 | ReductiveGroupsPartII | reject | Reject: RG2.3 is a parahoric-model stage and does not state general Lang H^1 vanishing. The abelian-variety descent application also requires a nonaffine case. Name a genuine supplier in G10. |
| 14 | ClassicalArithmeticCompletion | accept | CA.3 explicitly owns resultant and polynomial arithmetic. The five monic-lift/congruence/multiplicity-recognition adapters have the V3–V5 proof on the existing resultant, norm, Gauss and DVR carriers; a present abelian-variety consumer does not own the general result. |
| 15 | ClassFieldTheoryPartIIRelativeAmbiguousClasses | accept | The relative prime-cyclic ambiguous-class/unit-norm exact sequence is a class-field-theoretic continuation beyond the inspected upstream exits. Its brief states the groups, map, exact sequence and cardinal consequence, imports existing ideal/class/unit carriers and Hilbert 90, and compares the upstream Multiquadratic Layer 2 quadratic specialization. |

## Mathematical corrections and remaining boundaries

The factor-of-two graph pullback and rational Néron–Severi dictionary agree with Conrad. The Mumford construction now retains the zero-fibre normalization unless a rigidification removes it. The reduced-trace multiplier is retained explicitly. The new D_*² local bound is distinguished from Lee’s printed D_*⁴ correction; its resulting exponent is 4g(2g−1), not Lee’s 8g(2g−1).

The mass assembly now states its exact identity and uniform logarithmic error as hypotheses. A two-sided estimate for a residue ratio does not follow from separate upper bounds. The general density item stays withheld until its measures, dyadic cases and source formula are fixed. No unnamed quaternionic analogue of Conjecture 5.2 is used to state a corrected all-ppav theorem. The enhanced CL law needs existence and total mass independently of a positive zero-cokernel liminf.

For two root blocks of multiplicity h, the cyclic spacing measure has at least 2(h−1) zero gaps among 2g gaps. Under an independent high-probability h≥0.99g hypothesis, its limiting Kolmogorov discrepancy from an atomless spacing law is at least 0.99. The odd-p point-count obstruction is retained, and the characteristic-two counterexample is retained. These elementary implications do not establish family concentration.

WORKERS still requires named APIs and discriminating tests for definitions. Of 44 incoming definitions/constructions, 38 have absent/prose/string-only structures; the six structured entries also need role/kind normalization. A checker’s tolerance of legacy fields does not discharge that requirement. G9 is restored rather than described as implementation-only work.

## Fixed imaginary quadratic mass input

Fix an imaginary quadratic field L with class number one. Let H_L(n) be the number of positive definite unimodular hermitian forms on O_L^n modulo GL_n(O_L). Then

`log H_L(n) = (1/2)n² log n + O_L(n²)`.

This is a fixed-field statement. Terakado–Yu assumes that 2 is unramified in the totally real field; here that field is Q, so the condition is satisfied. It is not automatically satisfied for all CM fields generated by p-Weil numbers.

For each nonempty genus, (2.6) gives its mass as

`2 |D_L|^(n(n+1)/4) ∏_(j=1)^n ((j−1)!/(2π)^j) × ∏_(v finite) β_v^−1`.

Use the rational arithmetic stabilizer G¹(Q)∩gKg⁻¹, correcting the real-points typo on p.10. Equations (2.7)–(2.8) express the density product by the Dirichlet L-values, a fixed power of 2, and the finitely many ramified factors λ_v. The value L(1,χ_L) is positive and fixed. For j≥2, both signs of log L(j,χ_L^j) are bounded by log ζ(j), whose sum converges. The ramified factors have log-size O_L(n), including the normal/subnormal dyadic cases in Lemma 2.2.4. The discriminant contributes O_L(n²).

For the factorial term, interchange the finite sums:

`Σ_(j=1)^n log((j−1)!) = Σ_(k=1)^(n−1) (n−k) log k`

`= (1/2)n² log n − (3/4)n² + O(n log n)`.

Integral comparison (or Stirling with a summed remainder) proves this estimate; a numerical ratio is not its proof. The (2π) term is O(n²). Thus each genus has the asserted logarithmic mass.

For fixed L the local unimodular classifications give only a bounded number of determinant/norm-ideal types in each rank: unramified primes have the prescribed type and only the finitely many ramified primes admit the listed alternatives. At the dyadic primes the norm ideals divide the fixed ideal (2), so their number is bounded independently of n. Landherr’s local-global theorem, with all archimedean signatures fixed positive definite, bounds the number of rational spaces and hence genera. The identity form supplies at least one genus. The class-number-one hypothesis makes every projective O_L-lattice free.

Finally, finite automorphism groups embed in GL_(2n)(Z), whose finite subgroup orders are exp(O(n log n)). For each finite genus C, `mass(C) ≤ #C ≤ max|Aut| mass(C)`. Summing the bounded number of genera proves the theorem. The finiteness, local classification, Landherr and integral finite-group bounds remain the named mathematical suppliers to be formalized; no new carrier is proposed.

This supplies the fixed-field mass input for the elliptic-power lower bound T4. Combining that lower bound with the separately recorded exp(O_p(g²)) upper bound proves the qualitative repeated-factor comparison T5, subject to those recorded suppliers. It supplies neither a varying-field uniform error bound nor a quaternionic B0 concentration theorem.

## In-place changes

All incoming IDs are preserved. The item-level changes are:

- `main-repeated-source`: dependsOn, note.
- `main-elliptic-source`: name, note, proofStatus, statement.
- `trace-formula`: note, planned.
- `mumford-map`: statement.
- `density-source`: note, proofStatus, statement.
- `mass-asymptotic-source`: name, note, proofStatus, statement.
- `model-count-source`: name, proofStatus, statement.
- `model-concentration-source`: proofStatus, statement.
- `elliptic-power-source`: dependsOn, note.
- `spacing-source`: proofStatus, statement.
- `enhanced-failure-source`: proofStatus, statement.
- `adelic-local-orbit-bound`: note.
- `monic-coefficient-lift`: note.
- `resultant-congruence`: note.
- `resultant-factor-slope`: note.
- `resultant-valuation-recognition`: note.
- `padic-resultant-recognition`: note.
- `ambiguous-unit-norms`: note.
- `lang-theorem`: note.
- `fixed-imaginary-quadratic-mass`: added.

In addition: restore partial status and open gaps; supply the independent review object and source/hash evidence; review every source finding; narrow E13/E14/E21; add 13 checked findings; move five generic polynomial items from route 10 to CA.3 (route 14), and the relative unit-norm sequence to an explicit class-field Part II brief (route 15); add the fixed-field mass lemma to route 6; correct DWP/A3/AA.1 imports; replace the report’s obsolete front matter while retaining attributed proof records.

## Source findings

There are 35 confirmed, version-scoped entries: 22 inherited and 13 added. Nine have known corrections (five from Lee and four Yun publication fixes). The other 26 mean no applicable correction was found in the recorded searches. They are not asserted to persist in unread versions. E12/E14/E21 identify proof gaps, not counterexamples to the ultimate theorems.

### E1 — confirmed

v1 p.10, §3.1.5 (13); final 2018 text not obtained. No applicable correction located in the recorded search; finding is scoped to the version read, not a priority claim.

For n=1, δ=1 the left side counts a=0,1 and equals 2; the right side is 1. A stars-and-bars count also gives binom(nδ+n,n), so dropping the positive lower-order terms cannot give this upper bound.

Correction: Use the weighted-partition/rank-one argument L3–L6 for a coarse replacement; do not retain this weak-composition bound.

### E2 — confirmed

v1 p.12, §3.2.1 orbit-map display; final 2018 text not obtained. No applicable correction located in the recorded search; finding is scoped to the version read, not a priority claim.

In R=Z_3[3i]⊂S=Z_3[i], M=S and g=1,−1 represent the same orbit point. Their proposed maps differ at i by 2i∉R. Thus the displayed map depends on a representative. The replacement congruence/stabilizer argument avoids it.

Correction: This formula does not descend to orbit points. Use the isotypic L9 and general-block S2–S3 congruence/profile arguments; neither is the printed map.

### E3 — confirmed

v1 p.9, §3.1.4 display after (10); final 2018 text not obtained. No applicable correction located in the recorded search; finding is scoped to the version read, not a priority claim.

Because M′⊂M and F(M)⊂M′, F(M′)⊂F(M)⊂M′. Quotienting gives a surjection from M′/F(M′) to M′/F(M), with the claimed length inequality. The printed inclusion reverses its direction.

Correction: There is a canonical surjection M'/F(M')→M'/F(M), not the displayed inclusion. Since F(M)⊆M', the denominator intersection is redundant.

### E4 — confirmed

v1 p.10, §3.1.5, power-series quotient assertion; final 2018 text not obtained. No applicable correction located in the recorded search; finding is scoped to the version read, not a priority claim.

A quotient of the local ring Z_ℓ[[X]] has residue field F_ℓ. An unramified quadratic local order has residue field F_(ℓ²), so it cannot be such a quotient. L2 correctly inserts its residue-field coefficient DVR.

Correction: First pass to the unramified coefficient DVR O₀ with residue field R/rad R; then R is a quotient of O₀[[T]].

### E5 — confirmed

v1 p.5, Lemma 2.1; final 2018 text not obtained. No applicable correction located in the recorded search; finding is scoped to the version read, not a priority claim.

At g=1,q=2 the five reciprocal root-radius polynomials X²−aX+2 with a=−2,…,2 exceed 2√2. Without reciprocity even the reconstruction from the first g coefficients fails (X²−q versus X²+q). The safe reciprocal upper bound is retained.

Correction: For reciprocal polynomials use the safe bound (4g+1)^g q^(g(g+1)/4); impose reciprocity explicitly for the reconstruction by g coefficients.

### E6 — confirmed

v1 p.15, (26); final 2018 text not obtained. Known correction: J. Lee, "On the lower bound of the number of abelian varieties over F_p", Int. Math. Res. Not. IMRN 2022, no. 6, 4290–4317, DOI 10.1093/imrn/rnaa153 (arXiv:2002.04420v3), §3.1(2): "The upper bound in the inequality (31) of [7] should be corrected to (2√p)^(2·C(d,2))" (published (31) = v1 (26)).

The polynomial discriminant is the square of the unordered difference product. Its elementary exponent is 2 binom(d,2)=d(d−1), as independently stated by Lee §3.1(2).

Correction: The elementary discriminant bound has exponent d(d−1).

### E7 — confirmed

v1 p.16, (28), final fixed-p asymptotic; final 2018 text not obtained. Known correction: J. Lee, "On the lower bound of the number of abelian varieties over F_p", Int. Math. Res. Not. IMRN 2022, no. 6, 4290–4317, DOI 10.1093/imrn/rnaa153 (arXiv:2002.04420v3), Theorem 1.1 and (9)–(10) keep the factor 2^(34g²); Lee's Lemma 3.1 (|d′(A_0)|_∞ ≤ (2g)^(2g) p^(C(2g,2))) removes it in his improved bound.

For fixed p, c g² log 2 contributes a nonzero constant multiple of g² log p. It cannot be absorbed into o(g²); Lee Theorem 1.1 keeps 2^(34g²). This is a proof-constant defect, not a disproof of every stronger bound.

Correction: Keep powers of 2 with exponents proportional to g² in the fixed-p leading coefficient, or export only exp(O_p(g²)).

### E8 — confirmed

v1 p.16, §4.1 graph-pullback assertion; final 2018 text not obtained. No applicable correction located in the recorded search; finding is scoped to the version read, not a priority claim.

Conrad Example 2.2 gives graph pullback [2]*L⊗L^−2 after rigidification. Since [2]* acts by 4 on NS, its class is 2[L]. On an elliptic curve the degree doubles, so it cannot equal L in general.

Correction: Use [2]*L⊗L^(−2), up to the chosen rigidification, with Néron–Severi class 2[L].

### E9 — confirmed

v1 pp.17–18, §4.2 and Lemma 4.6; final 2018 text not obtained. No applicable correction located in the recorded search; finding is scoped to the version read, not a priority claim.

NS of an elliptic curve is Z whereas the rational Rosati-fixed subspace is Q. Tensoring by Q is necessary. The half-normalized Φ_f and the rational quadratic pullback in the items consistently account for the graph factor of two.

Correction: Use NS(A)⊗Q for the claimed rational vector-space isomorphism and rational pullback D_f on quasi-endomorphisms.

### E10 — confirmed

v1 p.18, Remark 4.8; final 2018 text not obtained. No applicable correction located in the recorded search; finding is scoped to the version read, not a priority claim.

For an elliptic curve with End⁰=Q, the Tate trace of [n] is 2n while Trd_(Q/Q)(n)=n. In general the rational trace is 2g/(em) times reduced trace, where e=[Z:Q] and m²=[D:Z].

Correction: Use the trace of the Tate representation, including representation multiplicity over the reduced trace.

### E11 — confirmed

v1 p.27, (41), quadratic discriminant factor; final 2018 text not obtained. No applicable correction located in the recorded search; finding is scoped to the version read, not a priority claim.

For π=√p exp(iθ), |π−conjugate π|²=4p sin²θ. The missing factor four changes only an O(dn² log p) contribution in the later logarithmic estimate.

Correction: The absolute quadratic discriminant factor is 4p sin²θ.

### E12 — confirmed

v1 p.29, (49); final 2018 text not obtained. No applicable correction located in the recorded search; finding is scoped to the version read, not a priority claim.

An upper bound for each Dedekind-zeta residue does not supply a lower bound for their ratio. Equation (49) asserts control of an absolute logarithm. Its omitted lower control remains G4; this confirms a proof gap, not the negation of the estimate.

Correction: Supply lower as well as upper controls for the residue ratio before asserting this two-sided logarithmic bound.

### E13 — confirmed

v1 p.30, (51), compared with p.26 (39); final 2018 text not obtained. No applicable correction located in the recorded search; finding is scoped to the version read, not a priority claim.

Summing log((j−1)!) gives (1/2)n²log n+O(n²); the (2π) powers add only O(n²). Thus the displayed factorial term is halved. The fixed imaginary quadratic derivation in this review confirms the corresponding elliptic-power coefficient. It does NOT verify all-field uniform mass error, Example 4.12’s proposed repair, or an unrestricted statistical theorem; those extra claims have been removed from the correction.

Correction: The factorial product in (39) contributes (1/2)[K:Q]n²log n+O([K:Q]n²). The fixed imaginary quadratic case gives exp((1/2)n²log n+O_L(n²)), as derived in fixed-imaginary-quadratic-mass. The full varying-field mass formula/error, all-field model count and statistical consumers require the separate G4/G5 hypotheses. Do not infer them by halving a coefficient alone.

### E14 — confirmed

v1 p.33, Corollary 5.13 proof applying Conjecture 5.2; final 2018 text not obtained. No applicable correction located in the recorded search; finding is scoped to the version read, not a priority claim.

Definition 5.1 and Conjecture 5.2 require CM fields L_i. B0 has a noncommutative quaternion algebra with real center Q(√p), so the cited conjecture cannot be applied to all “bad” varieties. Confirmed only as a missing hypothesis/proof. The incoming unspecified quaternionic analogue and B0 alternative were not established and are withdrawn.

Correction: Keep the unrestricted conclusion withheld. Supply an explicitly quantified quaternionic model/comparison and mass/concentration theorem for B0-containing classes, or prove those classes negligible. Conjecture 5.2 alone covers neither. No unspecified analogue is a corrected theorem.

### E15 — confirmed

v1 p.34, Corollary 5.14 proof; final 2018 text not obtained. No applicable correction located in the recorded search; finding is scoped to the version read, not a priority claim.

With two distinct roots repeated h times, there are h−1 adjacent zero gaps in each block, hence 2h−2 among 2g cyclic gaps. The finite mass is at least (h−1)/g. The limiting 0.99 discrepancy follows only from the separate probabilistic concentration hypothesis.

Correction: For 2g cyclic gaps, two distinct roots each repeated h times force zero mass at least (2h−2)/(2g)=h/g−1/g; state a limiting discrepancy conclusion in a specified metric.

### E16 — confirmed

v1 pp.35–36, Definition 5.16 and Example 5.17; final 2018 text not obtained. No applicable correction located in the recorded search; finding is scoped to the version read, not a priority claim.

The source defines the measure by a limit without proving existence or preservation of total mass. A lower bound on the simultaneous zero-cokernel probability only gives a positive liminf. The conditional reformulation keeps the convergence assumption explicit.

Correction: Prove existence and total mass one of the joint limiting law. The odd-prime union bound supplies a positive liminf, not convergence.

### E17 — confirmed

v1 p.36, Lemma 5.19 and its proof; Corollary 5.20 at p = 2. No applicable correction located in the recorded search; finding is scoped to the version read, not a priority claim.

Writing #E(F_p)=p+1−a and #E(F_(p²))=(p+1−a)(p+1+a), both being p-powers forces p^i+p^j=2p+2. For odd p, exactly one exponent must be zero and p^m=2p+1 would imply p divides 1. For p=2, traces ±1 give factors 2 and 4. The proof also corrects the printed extension-field trace formula.

Correction: The lemma holds exactly for odd p. For odd p: if p^i = p+1−a and p^j = p+1+a then p^i+p^j = 2p+2, which forces i = 0 or j = 0 modulo p and then p^(j) = 2p+1, impossible. For p = 2 the curves with a = ±1 are counterexamples. The printed proof ("a = 1 and b = 1") is wrong for every p, since #E(F_(p²)) = p²+1−(a²−2p). Corollary 5.20 must exclude p = 2.

### E-MILNE68-NEWTON-ABSCISSA — confirmed

Milne, Extensions of abelian varieties defined over a finite field, Invent. Math. 5 (1968), published p.67, proof of Theorem 1(c), definition of the Newton polygon; author-hosted published page image.. No applicable correction located in the recorded search; finding is scoped to the version read, not a priority claim.

Freshly inspected the author-hosted published p.67 image from the cached PDF with matching SHA-256. The abscissa must be the exponent i, since the next line minimizes ord_p(c_i)−si. Coefficients themselves do not locate monomials horizontally.

Correction: Use (i, ord_p(c_i)) for each nonzero coefficient c_i of F^i.

### E18 — confirmed

LT arXiv:1511.02212v1, p.21, Proposition 4.14(1), final sentence of the alternative p-adic proof; final journal text not acquired.. No applicable correction located in the recorded search; finding is scoped to the version read, not a priority claim.

For E/F_5:y²=x³+1, direct point count gives trace 0, so the p-polynomial is X²+5. It is Eisenstein over Q_5, and its 2-dimensional centralizer is the field Q_5(√−5), a division algebra. The alternative sentence is false; the preceding local-invariant proof is the appropriate route.

Correction: A Frobenius centralizer can be a division algebra (a field). Use the preceding local-invariant calculation to prove splitting over each local center; being a Q_p-centralizer or merely not being a division algebra does not establish that splitting.

### E19 — confirmed

v1 p.11, (14), and p.14, (20); published Corollary 3.18 and (25) in the proof of Corollary 3.22 (numbering from Lee 2022). Known correction: J. Lee, "On the lower bound of the number of abelian varieties over F_p", Int. Math. Res. Not. IMRN 2022, no. 6, 4290–4317, DOI 10.1093/imrn/rnaa153 (arXiv:2002.04420v3), §3.1(1)(c) and (2).

There are m(m−1), not binom(m,2), ordered pairs of distinct root occurrences. With the fourth power this gives exponent 4m(m−1)=8 binom(m,2). Lee §3.1 confirms the correction. The new D_*² estimate is an independent stronger replacement, not Lee’s printed correction.

Correction: (2p^(1/2))^(8·C(2g,2)) in both places.

### E20 — confirmed

v1 p.15, (27); published (32) (numbering from Lee 2022). Known correction: J. Lee, "On the lower bound of the number of abelian varieties over F_p", Int. Math. Res. Not. IMRN 2022, no. 6, 4290–4317, DOI 10.1093/imrn/rnaa153 (arXiv:2002.04420v3), §3.1(2), inequality (8).

The sum of CM-factor degrees is 2g. Squaring that total gives 4g²; the square-root discriminant contribution gives 2g² after E6. Lee inequality (8) independently displays this exponent.

Correction: (2√p)^(2g²(1+o(1))) with the corrected (26) (E6); even with (26) as printed the exponent is g²(1+o(1)).

### E21 — confirmed

v1 p.1, Theorem 0.1, and p.16, (28); published Theorem 0.1 and Proposition 3.23. Known correction: J. Lee, "On the lower bound of the number of abelian varieties over F_p", Int. Math. Res. Not. IMRN 2022, no. 6, 4290–4317, DOI 10.1093/imrn/rnaa153 (arXiv:2002.04420v3), Theorem 1.1 ("a (corrected) main result of [7]") and Theorem 1.4.

Lee Theorem 1.1 gives the corrected-argument exponent 69/4 and factor 2^(34g²), while Theorem 1.4 proves 45/4 by a refined argument. This review confirms failure of the stated derivation of 17/2, not a counterexample to that upper bound.

Correction: The corrected argument gives B(p,g)≤2^(34g²)p^((69/4)g²(1+o(1))) (Lee Theorem 1.1). Lee Theorem 1.4 separately gives p^((45/4)g²(1+o(1))). The printed derivation of exponent 17/2 is not established; the stronger bound is not disproved by that fact.

### E22 — confirmed

LT arXiv:1511.02212v1 p.32, proof of Lemma 5.9; journal not collated. No applicable correction located in the recorded search; finding is scoped to the version read, not a priority claim.

At a vertex at most one coordinate lies strictly between its bounds. Since 1/2<ε<1, exactly one coordinate is εg and one is (1−ε)g; choose their ordered distinct positions. For k=2 the feasible segment has two vertices, not six. The maximum-norm inequality itself remains valid.

Correction: For g>0, k≥2, 1/2<ε<1 use the polytope [0,εg]^k∩{Σx_i=g}, with k(k−1) vertices, the permutations of (εg,(1−ε)g,0,…,0). Handle g=0 separately.

### E-CONRAD-RIGIDIFICATION — confirmed

Conrad Polarizations, public PDF p.1 after Definition 1.1. No applicable correction located in the recorded search; finding is scoped to the version read, not a priority claim.

Both are maps from the structure sheaf to the same zero fibre after pullback; compatibility is equality. Replacing them by c i and c′ i′ requires c=c′, not inverse scalars. The next sentence’s unique common scalar confirms the intended statement.

Correction: Multiplying the two trivializations in their displayed common direction preserves compatibility when c=c′.

### E-CONRAD-DIAGONAL — confirmed

Conrad Polarizations, public PDF p.4, end of Example 1.7. No applicable correction located in the recorded search; finding is scoped to the version read, not a priority claim.

A correspondence is trivial along each positive-dimensional factor A×{0} and {0}×A; it cannot be ample on A×A when dim A>0. Example 1.5 computes the diagonal pullback whose form is Tr_(C/R)B.

Correction: Use Δ*L ample on A, as in Example 1.5.

### E-CONRAD-SEMIDEFINITE — confirmed

Conrad Polarizations, public PDF p.9, paragraph before Theorem 3.4. No applicable correction located in the recorded search; finding is scoped to the version read, not a priority claim.

T=diag(1,0) on C² has TT*=diag(1,0). Its nonzero kernel disproves definiteness, while trace 1 supplies exactly the positivity needed for the trace form.

Correction: For T≠0, TT* is nonzero positive semidefinite and has strictly positive trace. It is positive definite only if T is invertible.

### E-YUN-TEST-FUNCTION — confirmed

Yun arXiv:1303.2420v2 p.2 §1.3; compare published p.400. Known correction: Corrected in Yun’s author-hosted published version, The Legacy of Srinivasa Ramanujan, RMS Lecture Notes 20 (2013), pp.399–420, https://math.mit.edu/~zyun/Estimate_published.pdf p.400.

For n=1 and γ=π, the printed group test function vanishes while Theorem 1.5’s lower polynomial equals 1. The published p.400 uses the Lie algebra test function.

Correction: For γ∈gl_n(F) integral regular semisimple, use 1_(gl_n(O_F)); alternatively the group-valued version needs γ integral invertible.

### E-YUN-DUAL-LENGTH — confirmed

Yun arXiv:1303.2420v2 p.4 §2.2; compare published p.403. Known correction: Corrected in Yun’s author-hosted published version, The Legacy of Srinivasa Ramanujan, RMS Lecture Notes 20 (2013), pp.399–420, https://math.mit.edu/~zyun/Estimate_published.pdf p.403.

Take E=F, M1=π^−1 O_F and M2=O_F with the standard self-dual pairing. Both displayed relative lengths are 1, not opposite. The published version has equality.

Correction: Use [M1:M2]=[M2∨:M1∨].

### E-YUN-EPSILON-DOMAIN — confirmed

Yun arXiv:1303.2420v2 p.15, Lemma 4.9 proof; published p.416. No applicable correction located in the recorded search; finding is scoped to the version read, not a priority claim.

The preceding line identifies ψ with a class in (V2∨⊗V1)/(U2∨⊗U1); each tensor factor of the displayed operator acts on that space. The swapped subscripts in the End annotation persist on published p.416.

Correction: The operator γ2∨⊗id−id⊗γ1 acts on V2∨⊗V1.

### E-YUN-FILTRATION — confirmed

Yun arXiv:1303.2420v2 p.16, Proposition 4.13 proof; published p.417. Known correction: Corrected in Yun’s author-hosted published version, The Legacy of Srinivasa Ramanujan, RMS Lecture Notes 20 (2013), pp.399–420, https://math.mit.edu/~zyun/Estimate_published.pdf p.417.

The proof has fixed the next filtration step and chooses a lift of the new leading term. Repeating the same step is circular and gives no induction. Published p.417 corrects the second exponent to m+1.

Correction: Generate I∩(X^m) by I∩(X^(m+1)) and f_m.

### E-YUN-EXAMPLE-RANK — confirmed

Yun arXiv:1303.2420v2 p.18, final example; published p.419. Known correction: Corrected in Yun’s author-hosted published version, The Legacy of Srinivasa Ramanujan, RMS Lecture Notes 20 (2013), pp.399–420, https://math.mit.edu/~zyun/Estimate_published.pdf p.419.

The described cube has dimension n−1 and contains two P² pieces. Thus n=3; the point count 2q²−q matches this value. Published p.419 prints n=3.

Correction: The two-triangle square example is n=3.

### E-TY-ISOTROPY — confirmed

Terakado–Yu arXiv:2210.04054v1 p.5, §2.1.3. No applicable correction located in the recorded search; finding is scoped to the version read, not a priority claim.

Every hermitian space contains zero, so the literal definition makes every space isotropic and none anisotropic. The anisotropic cases used below require x≠0.

Correction: Require a nonzero element x.

### E-TY-ODD-ORTHOGONAL — confirmed

Terakado–Yu arXiv:2210.04054v1 p.9, Table 1, O_(2m+1) row. No applicable correction located in the recorded search; finding is scoped to the version read, not a priority claim.

For q odd, determinant maps O_(2m+1)(F_q) onto {±1}; −I has determinant −1. Its kernel is SO, of index two. Already O_1(F_q)={±1} has order 2, not the printed empty product 1. The subsequent odd-rank density formula does contain a factor 2.

Correction: For odd q multiply this order by 2; the printed expression is the order of SO_(2m+1). In characteristic two keep its separate convention.

### E-TY-ARITHMETIC-STABILIZER — confirmed

Terakado–Yu arXiv:2210.04054v1 p.10, paragraph before Definition 2.3.3. No applicable correction located in the recorded search; finding is scoped to the version read, not a priority claim.

On p.9 K contains the whole archimedean factor. Intersecting with the embedded real group would give that whole factor, not a discrete arithmetic subgroup or the finite lattice automorphism group in the definite case. The genus double quotient on the preceding line uses G¹(F).

Correction: Use Γ_g=G¹(F)∩gKg^−1 with diagonal rational points, then view Γ_g in G¹(F⊗R).

### E-LEMMER-SURJECTIVITY — confirmed

Lemmermeyer arXiv:1309.1071v1 p.3, first paragraph, proof of Proposition 1. No applicable correction located in the recorded search; finding is scoped to the version read, not a priority claim.

The equation a^σ=(α)a fixes the ideal class, not the ideal. It proves ambiguity only. The surjectivity argument constructs preimages of arbitrary unit-norm classes, whereas strongly ambiguous classes have trivial image by the following kernel calculation.

Correction: The constructed preimage belongs to Am(L/K). Strong ambiguity is the kernel condition proved in the next paragraph.

## Gaps and resumption

- **G0 (open)**: The 51-page Duke text was not readable through the legitimate publisher endpoint; author pages link arXiv v1. All LT direct findings are v1-scoped. Lee supplies published numbering and five known numerical corrections, not a full journal-version collation.
- **G1 (resolved)**: The unpolarized constant is settled by E21: the corrected statement is Lee's Theorem 1.1, and the item states it. [cc-442dc5] Earlier: Sharp unpolarized numerical coefficient and original lower-count proof interiors remain unverified; existing corrected reciprocal/discriminant bounds retained.
- **G2 (open)**: L1–L9/S1–S6 and C3–C6 give conditional local/adelic assembly; the total D_*³h bound still requires its stated arithmetic suppliers and an estimate for h. General-q covariance and sharper printed local estimates are not thereby established.
- **G3 (resolved)**: E8–E10 are recorded and the items use the corrected normalizations; reduced-trace-source now states the corrected Remark 4.8. [cc-442dc5] Earlier: Polarization normalization, rational NS, geometric/reduced trace and original Lang supplier closure remain as in predecessor.
- **G4 (open)**: Open uniform varying-field hermitian mass input: exact Gan–Yu measures and ramified dyadic densities, a two-sided uniform residue-ratio estimate, and the number of genera/free-projective comparisons. The fixed imaginary quadratic mass theorem added by review is proved separately; it does not discharge the uniform G4 statement.
- **G5 (open)**: Conjecture 5.2 only supplies CM-field model comparisons. An unrestricted all-ppav concentration theorem needs an explicit quaternionic B0 model, a precisely quantified comparison hypothesis, and its mass/concentration estimate, or a proof that all excluded B0-containing classes are negligible. Neither an unspecified analogue nor a coefficient change supplies this. The new B0 alternative previously asserted is withdrawn.
- **G6 (resolved)**: Lemma 5.19 holds exactly for odd p (elliptic-pgroups-large); Corollary 5.20 is restated for odd p (E17). [cc-442dc5] Earlier: F₂ counterexample retained; only p≥7 repaired source lemma is routed; final-version comparison outstanding.
- **G7 (open)**: The finite multiplicity-to-zero-spacing calculation and odd-p nontrivial point-count implication are verified. Their family-level hypotheses are open G5. Existence/tightness/total mass of the enhanced joint limits must be supplied separately; a positive liminf of the trivial-cokernel event proves no convergence.
- **G8 (open)**: Classical supplier interfaces remain explicit mathematical obligations, not implementation-only work: full Tate/Honda/finite-group Dieudonné source closure, degree/positivity and moduli finiteness, reduced-norm images and rank-one quaternion class sets, and the analytic/mass sources. Review checked the recorded C/D/V proof plans and Milne pp.65–67 but does not certify every original proof leaf as read.
- **G9 (open)**: WORKERS requires every definition to have a planning API and tests; §§0/4/12 remain binding even though check_paper.py does not enforce them. Of 44 inherited definitions/constructions, 38 retain prose-only or string tests/API and must be normalized to explicit named mathematical clauses with uses and discriminating tests. The six structured entries also use several nonstandard role/kind labels. This structural gap was incorrectly withdrawn.
- **G10 (open)**: Resolve the trace-formula supplier below WC.6 (PR196 TraceFormula, not WC.0), general Lang vanishing including abelian varieties (not claimed by RG2.3), and the source-qualified reduced-norm image/rank-one class-set interfaces. The omitted A3 and AA.1 imports have been restored to the Part II brief; remaining ownership/source contracts are not discharged by this edit.

## Validation

`python3 scripts/check_paper.py research/blueprint/papers/PAPER-LIPNOWSKI-TSIMERMAN-18.result.json` passes. The five deliverables pass `research/blueprint/intake.py check-files`. Additional checks preserve all incoming IDs, require unique routing of every missing item, validate local dependency references and acyclicity, require one verdict per route/source finding, verify source hashes and check the exact five-file archive diff. Main inputs are compared before publication.

Exact diagnostics independently check the rank-one counting failure, the genus-one q=2 polynomial count, discriminant normalization, resultant multiplicity slopes including repeated irreducible factors, the noninvertible Rosati matrix, the F_5 supersingular example, the eight smooth general Weierstrass models over F_2 with traces ±1 (found by exhaustive coefficient enumeration), zero-gap counts and the Lemma 5.9 vertex count. Factorial numerical ratios are a sanity check only; the proof is the finite-sum calculation above. No Lean file was requested, produced or compiled, and no formalization is claimed. No git commands were used.
