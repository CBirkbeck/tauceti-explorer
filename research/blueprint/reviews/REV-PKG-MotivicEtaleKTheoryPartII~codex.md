# Independent package review: MotivicEtaleKTheoryPartII

Verdict: **needs_changes**. Reviewer: Codex, session `codex-qLZIyx`, 2026-10-20. Job `REV-PKG-MotivicEtaleKTheoryPartII~codex`, issue #11359. This is a completed review with corrections, not a checkpoint or an acceptance of the remaining mathematical contracts.

The package has all 23 sections corresponding to the accepted design, substantial APIs and discriminating Checks, appropriate `math.NT` metadata, and a compact suggested file that elaborates. Four substantive closure or generality problems remain after the corrections below. They are marked explicitly in the README. Neither an elaborating file nor an exact locator establishes the missing assertions.

## Input, independence and scope

I read the package, accepted packet, its source/version records and the relevant design/package handoffs. The package came from the Claude `OirM8L` submission #11354; its design came from Claude `iQpMDn`. Neither is this session's work. The issue's embedded revision template names an unrelated Mordell title and an earlier review/report that are absent from the checked-out input. I reviewed the actual fundamental-line package and its accepted packet; there was no earlier report to preserve or answer.

Only this package's README and Suggested.lean, this report, review.json and the required handoff are changed. The accepted packet and sibling roadmaps are untouched. The README remains below the issue's 200 KB limit. No fetched text was treated as instructions. No suspicious instructions were encountered.

## Remaining blockers

1. **The coefficient action on the model image is not constructed (§§1.1–1.2).** Let I be the image of motivic cohomology of the recorded model in generic-fibre motivic cohomology. The generic correspondence formula constructs an action on the ambient group. It does not show that a generic correspondence preserves I. For H¹_f = πI, an endomorphism γ = πγπ need not preserve πI solely by idempotence: γπI has not been shown to be contained in πI. Consequently the purported A-module structure and general correspondence API do not yet follow from the listed contracts. MotivicEtaleKTheory §§4.3–4.4 supply generic pullback/products/pushforward; §12.3 supplies a chosen-model image. Neither cited statement proves their required compatibility. Burns–Flach §3.1, p. 518, points to the theory of integral parts, including the construction beyond a chosen model; it is not a proof that the contracts currently listed suffice. Supply the preservation theorem and the relation to the model/Adams-K-theory integral part, with its actual hypotheses and proof dependencies. Requiring only model-extending correspondences would narrow the accepted target. This is a missing proof contract, not a claimed counterexample to the standard motivic theory.

2. **The noncommutative determinant comparison has an unresolved supplier and loses generality (conventions, §§2.6, 3.6).** PadicMeasuresIwasawaAlgebras §5.1 is explicitly over commutative rings. For arbitrary semisimple A, determinants live in the virtual-object Picard category V(A), with its coherent determinant functor, not simply in invertible A-modules. PeriodsAndSpecialValues itself records under “Virtual objects” that the relative K-groups and five-term sequence of its GeneralAlgebraicKTheory supplier do not construct this category and its coherences. Citing its formal line does not close that foundation. Layer 2 nonetheless allows noncommutative A, and Layer 3 specializes the accepted noncommutative comparison to commutative A. Supply the virtual-category contract and retain the general comparison (Burns–Flach §§2.1–2.5, pp. 504–509, and §3.4, p. 529). The restricted construction can remain as an additional specialization. The general duality compatibilities must also be proved with their archimedean correction: Huber–Kings Proposition 2.2.3, p. 18, is an Artin result over an abelian extension of ℚ, at odd p and r ≥ 1, and cannot be cited as the theorem for arbitrary motives and coefficients.

3. **The general geometric H¹_g factorization is unconstructed (§3.1).** The accepted target includes the syntomic/geometric factorization and its H¹_f consequence in the good-reduction weight range. The submitted package omitted H¹_g and supplied `PadicRealizationFinite` as an assumption outside Tate and elliptic cases. The revision restores named required targets and marks their missing construction. The predicate is a useful conditional interface, but not the general theorem. The listed supplier contracts do not provide the missing general syntomic construction and its compatibility with the normalized character. PadicHodgeRegulators is not a permissible unexplained upward citation: the upstream order explicitly moves the needed local-condition material down. Locate and state the required comparison in an allowed owner, or plan it here with its complete prerequisites. Do not replace the theorem by its desired conclusion as a hypothesis. General H¹_f membership in the exceptional weights and at bad primes remains appropriately conditional; the requested repair is the geometric factorization actually promised, not a proof of the full Bloch–Kato conjecture.

4. **The K-theory Lichtenbaum specialization has an extra prime bound (§4.5).** Huber–Kings Theorem 1.4.1, pp. 13–14, states the relevant K-theory regulator formula at every odd prime. Here `tamagawaCondition_iff_lichtenbaum_K` only removes the lattice index for p ≥ k. The factorial identity c_k = (−1)^(k−1)(k−1)! ch_k explains why this range is safe, but does not identify the integral image at smaller p. The normalized-character, Chern-class and integral comparison/edge-map normalizations must be matched to the regulator used in Huber–Kings before claiming the all-prime specialization. For k = 5 and p = 3 the factorial has valuation one, so this is a real integral issue. The arbitrary-lattice formula with its index term is useful and its scaling is correct, but it does not replace the accepted all-odd-prime K-theory target. No assertion that the small-prime index is nontrivial is justified merely by the scalar identity.

These repairs require genuine supplier/construction work. I have not declared them resolved by adding assumptions or silently reducing the target's generality.

## Corrections applied

- Distinguished the forward weight −1 height adjoint H¹_f(M) → H¹_f(M*(1))^* from the opposite arrow δ in the regulator sequence. Under nondegeneracy δ is its inverse. `RealExactness`, the elliptic specialization and rank-one/scaling Checks now agree with this direction and the inverse regulator coordinate.
- Added coefficient balancing of the height pairing against the transposed A^op-action. Commutation of cycle and regulator maps alone does not make the height arrow A-linear. Added scalar, transpose and degenerate-pairing controls.
- Represented finite coefficient extensions and E-linear Artin projectors by rational matrix projectors on finite disjoint unions, rather than treating an E-linear correspondence as a rational projector on the original X. Added basis-change, realization and model-image targets and three concrete Checks. This resolves the carrier mismatch; it does not resolve blocker 1 for arbitrary generic correspondences.
- Replaced the claim that all Artin actions come from field automorphisms by the permutation/matrix, transfer, coefficient-extension and idempotent-summand route. Natural endomorphism actions on elliptic heights use dual-isogeny adjointness.
- Distinguished the finite Hochschild–Serre edge F¹ → F¹/F² = E∞^(1,i) ↪ E₂^(1,i) from an isomorphism of the restriction kernel with H¹. The injection into column 1 is valid because there are no incoming differentials in the first-quadrant spectral sequence. Added the rational projected-edge and lift-independence construction lemmas, using purity of π and injectivity of inflation. The weight-vanishing argument is rational, not a finite-coefficient vanishing assertion. In particular, this review does **not** assert that a finite-level edge map cannot exist.
- Counted infinity once in the compact-to-Selmer triangle: the finite sum now runs over S_{p,f}, with a separate archimedean sum.
- Separated ordinary real cochains from complete Tate cochains. Rational ordinary cochains retain V^{G_v}[0], also at p = 2; rational complete Tate cochains vanish. Integral real ℤ₂-cochains require the separate modification/perfectness treatment. Removed the assertion that the rational complex itself becomes unbounded at 2.
- Removed the uncorrected compact/global duality quasi-isomorphism; retained the determinant target with its archimedean correction. Restricted the claim about what Huber–Kings Proposition 2.2.3 proves, both in the real and p-adic comparison APIs.
- Required a nonempty prime set in the Tamagawa-obstruction equivalence. At an empty set the primewise condition is vacuous and cannot imply rationality; the negative control records the alternative of imposing rationality on both sides.
- Replaced the sole citation to an uncleared Silverman book by a self-contained positive-definiteness argument from the supplied height and Northcott theorem. A positive semidefinite real form with a nonzero real radical gives infinitely many lattice points of bounded height by rounding multiples of a radical vector. This contradicts Northcott. No copy of that book was accessed.
- Kept the five light definitions and eight milestone signatures in Suggested.lean, changed theorem developments to the required `sorry` statements, retained the proved examples, and added a proved Artin parity example. Heavy carriers remain README targets and appear in the closing comment. No data definition is admitted.

## Source verification

The author marks no package locator as unverified, and the packet's `sourceIssues` is empty. I opened all five public sources listed below. Their PDF hashes match the packet's recorded hashes. I inspected the relevant mathematical statements themselves, including scanned Fontaine formulas, rather than relying on search snippets. Page numbers below are printed pages, except Huber–Kings, which uses the version-2 arXiv pagination as the package specifies.

Sources: [Burns–Flach](https://ems.press/content/serial-article-files/25892?nt=1), [Kato v1](https://arxiv.org/pdf/math/0304233v1), [Huber–Kings v2](https://arxiv.org/pdf/math/0101071v2), [Fontaine](https://www.numdam.org/item/SB_1991-1992__34__205_0.pdf), [Bloch–Kato](https://math.stanford.edu/~conrad/BSDseminar/refs/BKTamagawa.pdf).

For the random sample I grouped the reference list into 35 locator groups: 11 Burns–Flach, 3 Kato, 11 Huber–Kings, 5 Fontaine and 5 Bloch–Kato groups, in reference/section order. A uniform sample without replacement of 15 groups used Python `random.Random(11359).sample`. The selected locators and the checked content are:

| Locator | Verification and consequence |
| --- | --- |
| Bloch–Kato Definition 5.1, p. 369 | Global finite/geometric conditions; the following motivic discussion uses an integral K-theory image. Does not supply general chosen-model correspondence stability. |
| Huber–Kings Theorem 1.4.1, pp. 13–14 | Lichtenbaum reformulation, regulator determinant and cohomological orders; all odd primes. Small-prime normalization remains blocker 4. |
| Huber–Kings Proposition 2.2.3, pp. 17–18 | Duality/local conjecture implication with Artin, abelian-extension, odd-prime and twist hypotheses. General citation corrected. |
| Burns–Flach (18)–(24), pp. 520–521 | Finite local complexes, crystalline complex and tangent term. Identity and acyclic determinant trivializations must be distinguished. |
| Kato §2.1(a)–(d), pp. 167–168 | Motive with coefficient-field action, rational line, two comparisons and rational zeta element; inverse-line orientation confirmed. These comparisons require conjectural inputs in general. |
| Huber–Kings Proposition 1.2.10, p. 11 | Global-duality formulation includes the plus factor; dyadic remarks are separate. |
| Kato §1.2, p. 165 | Determinant/inverse determinant and finite-field cone normalization. Not a proof of number-field comparisons. |
| Burns–Flach comparisons, p. 529 | Real and p-adic identifications assembled from earlier exact sequences; virtual-object formulation. |
| Fontaine §8.3(d), p. 230 | Opposite-direction isomorphism in weight −1 and pairing interpretation; height adjoint/inverse corrected. |
| Burns–Flach (26), p. 522 | Nine-term exact diagram; endpoints and dual Selmer factors checked. |
| Huber–Kings Definitions 1.2.1–1.2.2, p. 7 | Fundamental line and real realization conventions, with inverse motivic determinant. |
| Burns–Flach Lemma 5, pp. 526–528 | Integral structures and lattice/place-set independence; real/odd-prime conventions matter. |
| Huber–Kings Conjecture 1.2.8 and Proposition 1.2.9, p. 10 | Rational element and lattice generation, independence and Euler factors; not a theorem asserting the conjecture in general. |
| Huber–Kings Proposition 1.2.3, p. 7 | Artin real exactness via Dirichlet/Borel, with the endpoint in twist one. |
| Bloch–Kato (5.2) and Conjecture 5.3, p. 370 | Canonical regulator via weights and Hochschild–Serre; comparison is a conjecture in general, with stated special cases. |

I additionally checked Burns–Flach §3.1, pp. 517–518, (16)–(17), p. 519, (27)–(29), pp. 523–526, and the surrounding construction; Huber–Kings §1.1, pp. 3–6, Definition 1.2.4/Proposition 1.2.5, p. 8, Lemma 1.2.6/Definition 1.2.7, p. 9, and Propositions 2.3.1–2.3.2, pp. 18–21; Fontaine §7.1, pp. 224–225, and §9.3–§9.6, pp. 231–233; and the Bloch–Kato local-condition and Kummer statements around Proposition 3.8, pp. 354–355, and Proposition 5.4, pp. 370–371. These checks support the local corrections, not acceptance of the four missing contracts. No source passage or section-by-section source summary is included in the package.

## Libraries, supplier boundaries and moved material

I read the relevant reviewed audit entries in `data/library-coverage.json`: AUDIT-27 for PeriodsAndSpecialValues and AUDIT-30 for MotivicEtaleKTheory. Their absence verdicts for the heavy targets agree with the pinned source search; they are not used as substitutes for reading declarations.

Pinned Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` supplies the unit rank/log embedding/regulator, infinite-place rank identities and rational degree-one values, and Dedekind zeta's right-hand real limit at 1. Its `dedekindZeta` is the ideal L-series, not the continuation at nonpositive integers. The suggested leading-term theorem correctly reindexes its real limit, while the continued function and functional equation are consumed from BorelRegulators.

At Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`, I read Hodge opposedness and conjugate-filtration antitonicity, the finite Kummer map, and the elliptic regulator statements. The Néron–Tate pairing is the halved polar form and equals canonical height on the diagonal; the regulator is the absolute Gram determinant and is 1 in rank zero. These conventions agree with the revised elliptic Checks.

For the current-implementation/duplication audit I searched mathematical objects, operations and hypotheses against TauCetiRoadmap `origin/main` at `14e4aedb9081a3822d7f020476e77cbb5de9e4fc`, including Completed, and Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The search included all nine newer roadmap directories: AlgebraicVectorBundles, DifferentialGeometry, IntegralLattices, LocalGaloisGroups, OperatorTheory, OrthogonalSpinGroups, PeripheralActions, ProfiniteArithmetic and RealAlgebraicGeometry; and Completed ContourIntegration, EffectiveBounds, OrthogonalL2Bases and RestrictedProducts. Searches covered motivic/cycle/Adams images, regulators and heights, Hodge filtrations, compact support/Selmer complexes, virtual/graded determinants, archimedean involutions and leading terms, not only proposed names.

I read current Completed HodgeStructures and ImaginaryQuadraticClassNumber as the two upstream README/Suggested.lean models, and inspected the determinant contract in current PadicMeasuresIwasawaAlgebras §5.1. Existing pure Hodge structures, canonical heights, unit regulators and determinant infrastructure remain consumed prerequisites. The retained elementary Hodge targets are the F⁰ weight consequences for the period map, not a second Hodge-structure construction. No additional target was found to require deletion as already implemented or already planned upstream; no upstream files were changed. This does not close the noncommutative virtual-category gap.

The named suppliers were checked at the sections actually consumed, particularly MotivicEtaleKTheory §§4, 9.3, 10.4–10.5, 12.1–12.3 and 12.6–12.8, PeriodsAndSpecialValues PS.3–PS.5, and the local/global and Selmer contracts. No `FoundationsAndLibraryIntegration` or `UPSTREAM:` pseudo-supplier remains in the package. The general syntomic omission is recorded rather than filled with an upward PadicHodgeRegulators citation.

For the moved-material check I compared MotivicEtaleKTheory's package history, including `5ebc53629` and `0dec037e3`, with its current §12.7. Its inverse arithmetic determinant and Selmer local determinant remain suppliers, not new definitions here. The more specialized fundamental-line paragraph becomes the explicit real/p-adic comparisons and Tamagawa condition of this package. The significant predecessor controls are retained:

| Predecessor control | Location here |
| --- | --- |
| Zero complex has unit determinant | §4.1 zero-complex Check |
| Two-term multiplication by a has inverse determinant a⁻¹ | Conventions and §4.1 two-term Check |
| Swapping odd factors changes sign | §2.6 odd-swap Check |
| Integral local U_v factors enter in the inverse orientation | §§4.1, 4.3 local/Selmer Checks |
| Unbounded real dyadic integral complex is not automatically perfect | §§3.5–3.6, revised ordinary/Tate distinction |
| Rational basis is not automatically an integral generator | §4.1 span/generator and index Checks |

A repository-wide search found no sibling package, packet or link-map dependency on `MotivicEtaleKTheoryPartII` in reverse. However, the older MotivicEtaleKTheory §12.7 special-value paragraph still refers to PeriodsAndSpecialValues, while PeriodsAndSpecialValues cites MotivicEtaleKTheory §12.7. This pre-existing sibling loop needs the manager's pending sibling fix; the new package's supplier contract explicitly consumes only the arithmetic determinant paragraph, without the special-value comparison. Nothing outside this job was edited.

## Adversarial pass and target fidelity

All 23 accepted targets have matching README subsections. The following table records the cases checked, including definitions and their API claims. A row without a correction means those instances exposed no further defect, not that an unformalized theorem has been proved.

| Section | Instances, hypotheses and result |
| --- | --- |
| 1.1 datum/weight/duality/coefficients | ℚ(2), h¹(E)(1), impure diagonal, double dual; finite quadratic coefficients and matrix idempotents. Rational/E-linear carrier mismatch fixed; model-action contract remains. |
| 1.2 factor definitions and functoriality | ℤ× versus ℚ× in twist one, point in twist zero, n < 0 and n = 0, elliptic Pic⁰. Model image is essential; general correspondence stability remains. |
| 1.3 weight vanishing | w = −4, −2, −1, 0 and dual weight −2−w. Checked the exponents of all four motivic factors. |
| 1.4 Artin factors | r ≤ 0, r = 1, r ≥ 2; ℚ, real and imaginary quadratic fields. Unit rank has the missing-one term only at r = 1; plus rank has the opposite parity contribution. |
| 1.5 elliptic factors | j ≤ 0, j = 1, j ≥ 2; Mordell–Weil rank zero and rank one, dual twist 2−j. No higher-twist Beilinson isomorphism asserted unconditionally. |
| 2.1 period/Deligne maps | ℚ(0), ℚ(2), ℚ(3), and weight −1; coefficient conjugation changes plus parity. Injective range w < 0 and surjective range w ≥ −1 agree on the centre. |
| 2.2 regulators, height and coefficients | Complex-place logarithm has multiplicity two; Borel is twice Beilinson; rank-one height and matrix-transpose action. Inverse height direction and balancing corrected. |
| 2.3 exactness predicate | Weight −1 zero/degenerate height, rank r determinant, basis 3P. Forward Gram determinant scales by 9, inverse arrow by 1/9 in rank one. |
| 2.4 Artin real exactness | r ≥ 2 regulator, r = 1 product-formula endpoint, r ≤ 0 via duality; imaginary quadratic twist two. |
| 2.5 elliptic real exactness | Rank zero, rank one and j = 2; Northcott excludes a real radical. Conditional higher-twist criterion retained. |
| 2.6 real comparison | Rank-one R gives coordinate R⁻¹; real quadratic √d/R; two odd-factor swap gives −1; Borel substitution divides coordinate by 2^rank. General determinant/duality contract remains. |
| 3.1 realization maps and finite condition | Finite edge versus projected rational edge; ℚ even twists, units versus uniformizer, Kummer elliptic, factorial at p < j. General geometric factorization remains. |
| 3.2 realization predicate and orthogonality | Must use the actual maps, for M and its dual, not equal dimensions. H²/H³ are dual factors via the Selmer duality contract. No conjectural isomorphism made unconditional. |
| 3.3 Artin realization | All twists, all rational primes including 2; unit Kummer case and higher twists with Soulé. Integral dyadic claims are not inferred from the rational result. |
| 3.4 elliptic realization | Rank zero does not imply zero Selmer group when rational Tate module of Sha survives; p-primary Sha finiteness criterion retained. |
| 3.5 compact/Selmer complexes | Trivial rational representation at a real place, including p = 2: ordinary H⁰ = ℚ_p, complete Tate complex rationally zero. Definitions separated. |
| 3.6 p-adic comparison | Identity versus acyclic local trivialization, Frobenius eigenvalue 1, ℚ_p(0) infinity counted once; Euler factor 1−3 at k = 2. Generality and duality-source limitations recorded. |
| 4.1 zeta element/condition | Zero complex, [O --a--> O], a nonunit versus a unit; span equality versus rational basis; Ξ versus Δ = Ξ⁻¹. Leading term required nonzero and comparison hypotheses explicit. |
| 4.2 obstruction equivalence | Nonempty and empty prime sets; rationality is not implied by an empty conjunction. Nonempty hypothesis and control added. |
| 4.3 alternative forms | Finite lattice quotient, local term in degree zero, missing infinity factor; all integral real statements retain odd-prime restriction. General compatibility remains part of blocker 2. |
| 4.4 class number | ℚ: ζ(0) = −1/2, residue at 1 is 1; real quadratic comparison gives the expected factor 1/(2h). Rank-zero unit regulator is 1. |
| 4.5 Lichtenbaum | Rank-zero determinant is 1; Ω → pΩ subtracts rank from both sides; F = ℚ, k = 2, p = 3 gives valuation −1; k = 5, p = 3 detects nonunit factorial. All-prime K normalization remains. |
| 4.6 elliptic BSD data | Rank zero regulator 1, rank one inverse height; finite Sha input and analytic leading-term input remain explicit. It transports the supplied BSD adapter, not a proof of BSD. |

The general determinant convention is over commutative coefficient rings with perfect complexes; no arbitrary torsion module is treated as a projective factor. In the DVR lattice examples a uniformizer may replace p, and lengths/valuations use that uniformizer; no ramified coefficient order is silently identified with ℤ_p. Weights and twists are integers, so the negative and zero twists are included. The generality defects remaining are the explicit blockers, not changes to Lean's carriers.

## Lean and submission validation

`lean-check` on the revised Suggested.lean exited **0** at the shared pinned environment. Its only diagnostics are the eight expected “declaration uses sorry” warnings. The original input also elaborated; the revision preserves all eight target signatures and makes the statement-only shape explicit. There are five real-bodied definitions and four proved examples, with at most two examples exercising any kept definition. The closing block names the heavy README-only definitions and constructions, including the coefficient copower.

I checked all thirteen definition/theorem signatures against the README, exceeding the required ten: `motiveWeight`, `dualDegree`, `dualTwist`, `motiveWeight_dual`, `dualDegree_dualTwist_involutive`, `tatePlusDim`, `artinFactorRank`, `artinFactorRank_add_tatePlusDim`, `artinFactorRank_one_add`, `artinFactorRank_rat`, both Hodge F⁰ consequences, and `tendsto_mul_dedekindZeta_one_add`. Integer bounds, parity, unit rank, dual twist and the one-sided real limit agree. The heavy comparison milestones are not forced into weak encodings over existing carriers.

Validation commands and their final results are recorded in the handoff. The packet checker reports 23 nodes, **0 errors and 0 warnings**. The packet remains unchanged. Elaboration and submission checks are structural validation; they do not resolve the four mathematical blockers above.
