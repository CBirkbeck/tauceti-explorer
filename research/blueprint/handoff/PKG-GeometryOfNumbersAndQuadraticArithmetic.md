# PKG-GeometryOfNumbersAndQuadraticArithmetic

Package for the roadmap GeometryOfNumbersAndQuadraticArithmetic ("Geometry of numbers, quadratic forms and homogeneous arithmetic", upstream tier 3), written by Claude Code session cc-b6bfa5 on 2026-10-09 from the plan `research/blueprint/packets/GeometryOfNumbersAndQuadraticArithmetic.json` (revision 2, 300 nodes, review status needs_changes), its review `research/blueprint/reviews/REV-GeometryOfNumbersAndQuadraticArithmetic.md`, the atlas stage descriptions and the existing suggested file. No issue, no GitHub interaction. The revision-2 plan job running in parallel was not consulted.

## Delivered

- `research/blueprint/packages/GeometryOfNumbersAndQuadraticArithmetic/README.md` — the roadmap in TauCetiRoadmap prose form: title paragraph and layer table, Scope and ownership (with the "already in Mathlib / Tau Ceti" paragraph), Conventions, Exact supplier contracts, How to read the build, then Layers 0–6 with numbered `### k.n` subsections, each target as a prose paragraph (statement, hypotheses, API list for definitions and constructions, source locator, `*Needs:*` line, `**Checks.**` bullets), each layer closing with Examples and Dependencies; then Downstream consumers, References and Misprints in the sources. 291 targets from the plan (297 entries including the six new 6.1 targets) in 59 subsections; 183 Checks lists.
- `research/blueprint/packages/GeometryOfNumbersAndQuadraticArithmetic/Suggested.lean` — the signatures in TauCetiRoadmap form (details below).
- `research/blueprint/packages/GeometryOfNumbersAndQuadraticArithmetic/metadata.toml` — `topic = "math.NT"`.

## Size

The README is 284 KB. The deliverables paragraph of the packaging brief gives 200 KB as the maximum, and the later binding section on the README form says never to shrink by dropping tests, hypotheses or locators and that packages will often run 100–300 KB; I followed the binding section. Every definition and construction keeps its full API list and all of its tests, every theorem and lemma keeps its hypotheses and its locator, and the 147 lemma nodes are kept as full entries (statement, hypotheses, locator, needs) rather than folded. Standing hypotheses repeated across a subsection are hoisted once, the `*Needs:*` lines group Mathlib names, and no proof sketches are reproduced. If 200 KB is in fact the hard limit, the way to meet it without dropping content is to split Layer 6 (hermitian K-theory, 94 KB) into a Part II; the package layout allows only one README, so I did not do this.

## Corrections from the review applied

The review's material corrections are in the revision-2 plan and were inherited: the empty-generic-fibre branch of the local density with its separate eventual-emptiness lemma (3.2.3), the corrected proper-mass example (square lattice, four proper isometries, contribution 1/4), the cross-polytope polar of a box (4.4.3), the star body with its own compactness (4.5.1), the split LLL transitions (5.2–5.3) and the split cone/swindle/suspension/completion/spectrum chain (6.7). Its "remaining changes" were handled as follows: the review's sentences of the form "no X is asserted" / "the conclusion retains every stated hypothesis" were filtered out of the Checks (they are not tests), so a few lemmas have no Checks; the RT-AREA-algebraicnt-1/1 direct supplier contracts (QuadraticFormInvariants Layers 1, 3, 4, 5, 6, 9; GlobalQuadraticForms Layers 5, 6; Completed IntegralLattices Layers 1, 2, 4) are written out in "Exact supplier contracts" and 2.1 / 2.3 state the ten comparison targets; the narrowed K.4/K.6 citations are replaced by this roadmap's own 6.1 targets (below). The remaining obligations the review lists for `proper-spinor-genus`, `hermitian-lattice-invariants`, `lll-exact-reduction`, `exact-category-duality`, `exact-lagrangian`, `hyperbolic-space`, `isotropic-reduction`, `exact-grothendieck-witt-group`, `exact-witt-group`, `hermitian-q-construction`, `grothendieck-witt-space`, `quaternionic-integral-hermitian-data`, `higher-grothendieck-witt-groups`, `hermitian-suspension` and `nonconnective-hermitian-spectrum` are stated as targets with the hypotheses the plan now carries; the review's point that their typed carriers are missing is reflected in the Lean file's closing comment, which names the ones that could not be stated.

## Forward reference removed

The plan has one edge from a lower layer to a higher one: `GN.2/signed-hermitian-witt-comparison` cites `GN.6/exact-witt-group`. The README states 2.9.4 through the classical anisotropic-class Witt group and makes the exact-category comparison a sentence of 6.4.2; the same holds for 2.1.3 (field Witt comparison), whose exact-category side is proved in 6.4.

## Notions moved down (now targets here)

| Citation in the plan | Target here |
| --- | --- |
| GeneralAlgebraicKTheory K.1 (Q-construction, K-groups of exact categories), 12 citations | 6.1.1 `quillenQ`, 6.1.2 `exactKGroup` (Quillen 1973 §2) |
| GeneralAlgebraicKTheory K.4 (S-construction, delooping) | 6.1.4 `waldhausenS` (Waldhausen 1985 §§1.3–1.5, 1.9) |
| GeneralAlgebraicKTheory K.6 (nonconnective spectrum) | 6.1.5 `nonconnectiveKSpectrum` (Schlichting 2004 §§3–4) |
| StableHomotopyKTheory H.1, H.2, H.4 (nerve realisation, Quillen's theorems, group completion), 6 citations added in revision 2 | 6.1.3 `nerveRealization`, `quillenTheoremA`, `quillenTheoremB`; 6.1.6 `groupCompletion` (Quillen §1; Segal 1974; McDuff–Segal 1976) |
| MetaplecticAutomorphicForms MP.5 (theta kernel) | 3.4.1 `latticeThetaSeries`: the theta series of a positive definite ℤ-lattice as a holomorphic function with coefficients `r_L(m)` (Conway–Sloane Ch. 2 §2.3; Duke p. 74). Modularity is not stated. |
| MetaplecticAutomorphicForms MP.7 (half-integral coefficient estimate) | 4.3: `halfIntegralCoefficientBound` (Iwaniec 1987, Theorem 1) and `siegelLowerBound_r3` as the stated inputs of Duke's theorem |
| ClassicalArithmeticCompletion CA.3 (atlas stage edge: normal forms with change-of-basis certificates) | not cited by any plan node; the certificate notion is 5.2.1 `UnimodularBasisCertificate`, which needs only Mathlib. Nothing to move. |

GeneralAlgebraicKTheory, StableHomotopyKTheory and MetaplecticAutomorphicForms are outside the 94-roadmap upstream set, so these are restatements rather than deferrals. The 6.1 targets are stated at target level from the standard sources named in the README; I did not download those sources in this session, so their locators are section and theorem numbers.

## Duplication audit against the current Tau Ceti and upstream roadmaps

Searched by object (two Explore agents, read-only, with positive controls, no `head` on absence checks): Tau Ceti a91d3aaf, Mathlib 082e2d3, every roadmap in `TauCetiRoadmap/*` including the nine newer ones, and `Completed/*`. Note that the roadmap-env checkout is on the branch `roadmap/integral-hecke-and-galois-determinants`, which carries AdelicAlgebraicGroups, ReductiveGroupsPartII and SmoothRepresentationsOfLocalGroups ahead of `origin/main`; AdelicAlgebraicGroups is cited here by its atlas stage ids as the plan does.

Removed (deleted from the layers, cited under Scope and ownership, references re-pointed to the library declaration):

| Plan node | Exists as |
| --- | --- |
| `GN.0/covolume-square-gram` | Tau Ceti `ZLattice.covolume_sq_eq_det_gram` (`TauCeti/Algebra/Module/ZLattice/Covolume.lean:42`, same statement) |
| `GN.0/gram-det-orthonormal-coordinates` | Mathlib `LinearMap.normDet_sq_eq_det_gram` (`Mathlib/Analysis/InnerProductSpace/NormDet.lean:304`; the family form is the case `U = EuclideanSpace`) |
| `GN.0/mixed-embedding-normalization` | Mathlib `NumberField.mixedEmbedding.covolume_idealLattice` |
| `GN.1/blichfeldt-native-interface` | Mathlib `MeasureTheory.exists_pair_mem_lattice_not_disjoint_vadd` |
| `GN.1/minkowski-first-native-interface` | Mathlib `exists_ne_zero_mem_lattice_of_measure_mul_two_pow_lt_measure` / `_le_measure` |
| `GN.1/ideal-class-application-import` | Mathlib `NumberField.exists_ideal_in_class_of_norm_le` |
| `GN.1/unit-application-import` | Mathlib `NumberField.Units.finrank_modTorsion` |
| `GN.2/spinor-reflection-product` | OrthogonalSpinGroups 1D (`θ(τ_v) = [Q v]`, homomorphism), Tau Ceti `CliffordAlgebra.spinorNorm`; the example is kept as a Check of 2.4.6 |
| `GN.6/strong-category-duality` | Tau Ceti `Functor.IsInvolutiveDual` and `Functor.dualityEquivalence` (`TauCeti/CategoryTheory/InvolutiveDual.lean:49`) |

Kept as variants, with the one-clause difference in the entry: `successive-minimum` (IntegralLattices 2F is the positive definite Euclidean-ball case in squared units), `covolume-dual` (IntegralLattices 1B is the rational Gram-determinant identity), `lattice-localization` (IntegralLattices 3A completes over ℤ_p), `integral-genus` and `proper-spinor-genus` (IntegralLattices 3F, 4C are the case R = ℤ), `spinor-unimodular-stabilizer` (OrthogonalSpinGroups 2F is over ℚ_p and ℝ), `spinor-adelic-norm` (OrthogonalSpinGroups 3F and Tau Ceti `OrthogonalCompactOpens.adelicSpinorNorm` are the case K = ℚ), `definite-integral-isometry-finite` and `definite-genus-class-finite` (Tau Ceti `IntegralLattice.IsPosDef.finite_isometry` and IntegralLattices 2G are the ℤ-cases; the number-ring halves are the targets), `genus-mass` (IntegralLattices 7A over ℤ), `construction-a-real-lattice-interface` (AlgebraicCodingTheory Layer 6 gives the discriminant; the entry gives the real covolumes), `field-witt-comparison` (Tau Ceti `WittRing`, `WittGrothendieckRing`). Everything else — Hadamard, the projection/dual/primitive covolume identities, Minkowski's second theorem and the linear forms theorem, Dedekind-domain lattices, hermitian and quaternionic lattices, signed hermitian forms, densities and Siegel polynomials, mass over number rings, Henk and Davenport counts, homogeneous dynamics, transference, star bodies, Mahler, Siegel mean value, LLL, and all of hermitian K-theory — is absent from both libraries and from every upstream roadmap (IntegralLattices line 189 and OrthogonalSpinGroups line 63 list lattices over number rings and hermitian forms as having no owner).

## Lean

`Suggested.lean` (164 KB) was produced from `research/blueprint/suggested/GeometryOfNumbersAndQuadraticArithmetic.lean` by reshaping, not rewriting: `import Mathlib` plus the five Tau Ceti modules it uses; one module docstring; a single `namespace TauCetiRoadmap.GeometryOfNumbersAndQuadraticArithmetic`; the sections reordered into `/-! ## Layer k -/` blocks in README order (the baseline file had Layer 4 counting sections before Layer 2 and the exact-category sections interleaved); `lemma` → `theorem`; packet node ids stripped from docstrings; process comments removed; the two theorems that duplicate library results deleted and `#check @LinearMap.normDet_sq_eq_det_gram` pinned (the Tau Ceti `covolume_sq_eq_det_gram` module does not exist at the f790474 pin, so it is cited in the README only); the Mathlib-import section (`mixed_embedding_normalization`, `ideal_class_application_import`, `unit_application_import`) dropped; a closing comment naming the targets that are stated in the README but not typed here (6.1, the genus and spinor genus, the local density and Siegel polynomial, the theta series, the hermitian suspension and spectrum, the dynamics theorems other than `oppenheim_values`). Counts: 425 declarations, 363 `example`s, 696 `sorry` warnings. The `StrongCategoryDuality` structure is kept as the carrier the exact duality extends, with a docstring saying it is Tau Ceti's `IsInvolutiveDual` bundled. `NamedChecks` (41 examples that cut across layers) sits at the end under `/-! ## Checks across layers -/`.

Compilation: `lean-check <worktree>/research/blueprint/packages/GeometryOfNumbersAndQuadraticArithmetic/Suggested.lean` (Tau Ceti f790474 + Mathlib 082e2d37): exit 0, 0 errors, 696 warnings, all `declaration uses 'sorry'`, no other warning. Lean time spent: about 35 minutes.

## Checks

- `python3 research/blueprint/intake.py check-files` on the four files: 0 problems; no private path in any deliverable.
- README: no "(removed)" stubs, no packet ids, no planning vocabulary (grep for packet, planning, reviewer, catalogue, stand-in, unchecked, node, atlas, deferred, optional, pending: none); `Checks` lists on every definition and construction (≥ 3 bullets) and on every theorem that had tests.
- The README layer sections were generated from the plan by a script (scratch, not committed) and then edited; the top sections, the layer introductions, examples and dependencies, the 6.1 targets, the 3.4 theta target and the 4.3 inputs are written by hand.

## For the maintainer

- The plan is at review status needs_changes; this package inherits its corrected statements and resolves the structural objections (direct supplier contracts, moved-down K-theory inputs, forward edge, non-tests), but cannot close the review's source-acquisition items (Hironaka/Gan–Yu/Cho–Yamauchi, Ratner, Howe–Moore, Banaszczyk, Shimura/Gan–Hanke–Yu); those theorems are stated with their exact hypotheses and their sources at statement level.
- Five of the plan's prerequisite citations target roadmaps that exist only as directories in the roadmap repository (`RepresentationTheory/LieGroups`, `RepresentationTheory/SpinRepresentations`); both exist with the cited layers.
- `research/blueprint/suggested/GeometryOfNumbersAndQuadraticArithmetic.lean`, the plan JSON and the reader were not edited.

## Adversarial mathematics pass

Done by hand on the conventions, every definition, the hand-written targets and the headline theorems; the per-lemma instances of the long chains (1.5, 4.1, 5.2–5.3, 6.7) were tried for dimension 0/1 and the empty family only. Agents for a second pass could not be started (machine-wide concurrency limit), so the manager's gate should repeat it on the 147 lemma entries.

| Statement | Instances tried | Result |
| --- | --- | --- |
| 0.1 Hadamard, uniform bound | n = 0 (1 ≤ 1, 1 ≤ 0^0 = 1), dependent family (det 0), complex `(1, i)` | ok |
| 0.3 covolume of dual / projection / primitive intersections | dim 0 (covol 1 = 1⁻¹), W = 0 and W = E, ℤ(1,2) ⊥ ℤ(2,−1) in ℤ² (√5 = √5) | ok |
| 1.2.1 successive minima | non-full lattice: `sInf ∅ = 0` junk beyond the rank | hypothesis `IsZLattice` already on every law; negative control added |
| 1.3.4 / 1.5.21 Minkowski lower/upper | d = 0 (1 ≤ 1 ≤ 1 under the Dirac volume), cube (upper attained), cross-polytope (lower attained) | ok |
| 1.4.2 linear forms | n = 1, equality ∏a_i = |det A| (non-strict), compactness | ok |
| 4.1.2, 4.1.5, 4.1.12 Henk | Henk 2002 read: Theorem 1.5 is strict `<`, (1.2) is `≤ ⌊2/λ₁+1⌋^d`; d = 2 cube gives 9 < 18 | ok |
| 4.4.3 / 4.4.13 / 4.4.14 transference | i = 1 and i = n, ℤ^d (λ_i = 1, λ_i(L*) = 1, μ = √d/2) | ok; 4.4.14 upper constant n is Regev's, stated as such |
| 4.4 Gaussian sums | s = 1, u = 0, dim 0 | ok |
| 4.5.2 critical determinant | rank 0 (= 1); `K°` meant interior and clashed with the polar of 4.4.3 | notation fixed to `int K` |
| 4.5.8 Mahler, 4.6.1 Siegel | n = 1 excluded by hypothesis | ok |
| 4.3.1 Oppenheim | n = 2 counterexample `x² − (3+2√2)y²` is a Check; integral form excluded | ok |
| 4.3 Duke inputs | Gauss's `r₃(n)` formula was misstated as `12 h(−4n)` for all square-free n | corrected to "an explicit multiple of the class number of discriminant −n or −4n" |
| 5.1.2 / 5.1.4 LLL | n = 0 (vacuously reduced), n = 1 (factor 1), δ = 3/4 equality accepted, `(2,0),(1,1)` fails Lovász | ok |
| 2.2.1 integral quadratic lattice | ℤ with x² (polar 2xy, not unimodular), non-principal ideal, non-Dedekind base | Lean carrier more general than the prose: clause and negative control added |
| 2.6.1 atomic forms | ⟨a⟩ unit; `[1,1,1]` over ℤ₂; p odd (binary case excluded by "2 not a unit") | ok |
| 2.7.3 invariant factors | n = 0 (val 0, type 0); Lean over any PID with any π | generality clause added |
| 2.9.4 signed Witt group | unramified quadratic extension: ⟨1,1⟩ hyperbolic iff −1 is a norm, giving C2×C2 / C4 | ok |
| 3.1.3 finite hermitian isometry count | n = m = 1, nondegenerate source: `q·(1 − (−q)^{−1}) = q + 1` norm-one elements | ok |
| 3.2.1 normalised count | exponent n(2m−n) = 2mn − n²; denominator needs q ≥ 2; Lean total with natural subtraction, n ≤ m | clause added |
| 3.2.4 Siegel polynomial | n = 1, k = 0: `Den(⟨1⟩,⟨1⟩) = 1 + q⁻¹ = 1 − (−q)^{−1}`; rank one valuation a: `Σ_{i≤a}(−X)^i` | ok |
| 3.2.6 Cho–Yamauchi | rank one, a even and odd: the sum telescopes to `(1 + X^{a+1})/(1 + X)` | ok |
| 3.2.7 functional equation | a = 1: `(−X)(1 − X⁻¹) = 1 − X` | ok |
| 3.3.5 maximal-lattice mass formula | constants not independently recomputed in this session; stated as read from Kirschmer Definition 3.1 / Table 1 by the plan | unverified — flagged for the gate |
| 3.3.3 / 3.3.4 mass, adelic identity | rank 1 (proper stabilizer trivial), square lattice (four proper isometries, 1/4) | ok |
| 3.4.1 theta series | ℤ: coefficients 2, 0, 0, 2 at q, q², q³, q⁴; ℤ²: 4, 4; rank 0: 1; odd lattice not an `e^{2πiτ}`-series | ok |
| 6.1.1 Q-construction | `Hom(0, X)` | my check was FALSE (it is the set of admissible subobjects, not a singleton); corrected |
| 6.1.2–6.1.6 | zero category, product projection, trivial groupoid | ok |
| 6.4.6 forgetful∘hyperbolic | `FH[X] = [X] + [DX]`; equals 2 only for trivial D | ok |
| 6.11 integer tables | `GW₀^s(ℤ) = ℤ ⊕ ℤ` (⟨1⟩, ⟨−1⟩), `W(ℤ) = ℤ` | ok |
| Conventions | `q(x) = B(x,x)/2` with polar `B(x+y)−B(x)−B(y)` gives `B(x,x) = 2q(x)`; determinant factor `2^{−n}`; sign `(−1)^{n(n−1)/2}` | consistent |

Lean-vs-README generality: `IntegralQuadraticLattice` (any `CommRing R`), `HermitianLatticeInvariants` (any PID, any π), `normalizedHermitianCount` (any finite ring, parameters `q`, `N`), `SignedHermitianSpace` (any field with `star`) are more general in Lean than the prose, which the entries now say; `latticeCoveringRadius` and `latticePackingRadius` are total with junk values on non-full or zero lattices, and the prose states the full-lattice hypothesis. `lll_short_vector_factor` carries `0 < n`, `oppenheim_values` carries `3 ≤ n`, `henk_successive_minima_count` carries `2 ≤ d`, matching the prose. The Lean file was not changed by the pass (the corrected items have no Lean counterpart), so the compile result above stands.
