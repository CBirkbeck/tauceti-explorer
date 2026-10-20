# PKG-MotivicEtaleKTheoryPartII~codex — roadmap package

Issue: [#11345](https://github.com/CBirkbeck/tauceti-explorer/issues/11345). Worker: Claude (Opus 5.5), session claude-OirM8L, 2026-10-20. Branch: `claude-OirM8L-pkg-motivic-etale-k-theory-part-ii`. Complete package submission.

## Deliverables

- `research/blueprint/packages/MotivicEtaleKTheoryPartII/README.md` — the roadmap in TauCetiRoadmap form (112 KB): Summary, Scope and ownership with Prerequisites and boundaries, Conventions, Exact supplier contracts (by supplier and section), How to read the build, Layers 1–4 with `### k.n` subsections, Examples and Dependencies per layer, Downstream consumers, References.
- `research/blueprint/packages/MotivicEtaleKTheoryPartII/Suggested.lean` — 216 lines: `import Mathlib` and `import TauCeti.Geometry.Hodge.Structure`, one module docstring, namespace `TauCetiRoadmap.MotivicEtaleKTheoryPartII`, five light real-bodied definitions (`motiveWeight`, `dualDegree`, `dualTwist`, `tatePlusDim`, `artinFactorRank`), eight theorems (all proved), five proved examples, a closing comment listing the README-only targets.
- `research/blueprint/packages/MotivicEtaleKTheoryPartII/metadata.toml` — `topic = "math.NT"`.

Inputs: the accepted design (packet `packets/MotivicEtaleKTheoryPartII.json`, reader `readmes/MotivicEtaleKTheoryPartII.md`, `suggested/MotivicEtaleKTheoryPartII.lean`, handoff `DESIGN-MotivicEtaleKTheoryPartII.md`). No packet, reader or other roadmap file was edited.

## Lean check

`lean-check research/blueprint/packages/MotivicEtaleKTheoryPartII/Suggested.lean` (Mathlib 082e2d3, Tau Ceti f790474, shared build) **exited 0 with no warnings at all**: every theorem and example is proved (no `sorry`). 216 lines; SHA-256 of the checked file `45d51db4abdb6dba8e4fce828ca27e8beb2facdc4f338f7b22913eea94cae7ad`. Imports: `import Mathlib` and `import TauCeti.Geometry.Hodge.Structure`. Declarations: `motiveWeight`, `dualDegree`, `dualTwist`, `tatePlusDim`, `artinFactorRank` (definitions); `motiveWeight_dual`, `dualDegree_dualTwist_involutive`, `artinFactorRank_add_tatePlusDim`, `artinFactorRank_one_add`, `artinFactorRank_rat`, `hodge_F_zero_inf_conjF_zero_eq_bot`, `hodge_F_zero_sup_conjF_zero_eq_top`, `tendsto_mul_dedekindZeta_one_add` (theorems); five examples, each a test of a definition of this roadmap. No `set_option`, no `#print`, no sorry'd data. `scripts/check_sorry_data.py`: clean. The gate's `mech_check.py` (run with `python3 -I` from scratch): 0 README identifiers missing from Lean, 0 empty Lean sections, 0 round-named labels (the word "continuation" was rephrased); its 3 "bold targets with no backticked name" are the Conventions paragraph labels **Motives.**, **Realizations.**, **Regulators.**, which are not targets.

## Coverage

All 23 plan targets are in the README. Every packet API name and unit-test name occurs in the README except two, removed on purpose (below): `padicRealizationOne_mem_g` and `IsLatticeGenerator`.

## What changed relative to the design, and why

- **Coordinate direction of the Borel normalization (§§2.2, 2.6).** The design said that replacing the Beilinson by the Borel regulator *multiplies* the coordinate of ϑ_∞ by 2^{d_r} ("the Borel coordinate is twice the Beilinson coordinate"). With the design's own convention (the generator built from a motivic lattice has coordinate R⁻¹, Huber–Kings proof of 1.4.1), and BorelRegulators §8.4 (R_Bo = 2^{d_j}R_Be), the coordinate is *divided* by 2^{d_r}. Fixed in the API, the Check, and pinned in Conventions ("ϑ_∞(x⁻¹ ⊗ y) = R⁻¹").
- **Direct sums of the Tamagawa condition (§4.1).** "The condition for M ⊕ M′ is the conjunction" is false with a common coefficient field acting diagonally (δ = p, δ′ = p⁻¹). Now: conjunction with product coefficients E × E′; with diagonal coefficients only one implication; new Check `tamagawaCondition_directSum_diagonal`.
- **Lichtenbaum form (§4.5).** The design's "if and only if" with R_k(F) the covolume of K_{2k−1}(O_F)/tors silently depends on the normalization of the p-adic realization at p ≤ k − 1 (character vs Chern class differ by (k−1)!, MotivicEtaleKTheory §12.8). The theorem is now stated for an arbitrary full lattice Ω with an explicit index term ι_p(Ω); the motivic lattice (SpecialValuesBirchTate's R^M) has ι_p = 1 at all odd p (`tamagawaCondition_iff_lichtenbaum_motivic`, equivalent to the odd part of SpecialValuesBirchTate's `MotivicLichtenbaumFormula`), and Huber–Kings's K-theory form holds for p ≥ k (`tamagawaCondition_iff_lichtenbaum_K`), where (k − 1)! is a p-adic unit. Checks pin the index term (pΩ) and the factorial (F = ℚ, k = 5, p = 3). HK Theorem 1.4.1 states only the implication; the equivalence is by the reversibility of each lattice step plus Borel's rationality.
- **Class number formula at s = 0 (§4.4).** No supplier states ζ_F^*(0) = −hR/w (BorelRegulators §5 is for j ≥ 2; Mathlib only has the residue at 1). New target `dedekindZeta_leadingCoeff_zero`, proved from the completed functional equation (BorelRegulators §5.1) and Mathlib's residue; the gamma-factor computation is written out. The twist-one exponential "index (q_v − 1)/q_v" is restated as a generalized index whose p-adic valuation −v_p(q_v) is that of 1 − q_v⁻¹.
- **Motivic factor defined through motivic cohomology (§1.2).** H¹_f is π_* of MotivicEtaleKTheory §12.3's `rationalIntegralPart` (higher Chow groups of the model); the Adams-eigenspace (Burns–Flach) description is recovered on the generic fibre by MotivicEtaleKTheory §9.3. Reason: MotivicEtaleKTheory's K-theory/motivic comparison (§9.3) is for smooth schemes over a field, not for the model 𝒳.
- **p-adic realization constructed without dividing factorials at finite level (§3.1).** c¹_p is built from MotivicEtaleKTheory §§10.1–10.2 (finite-coefficient motivic–étale comparison over a smooth Dedekind base) on 𝒳 ⊗ O_{K,S_p}, Hochschild–Serre, limits and ⊗ℚ (upstream EtaleCohomologyFoundations F.1, F.2.1–F.2.2, F.4.2, F.4.5). MotivicEtaleKTheory §12.1 itself warns that dividing by (j−1)! modulo m is not a normalization.
- **`IsLatticeGenerator` removed.** It was a one-line wrapper of `Submodule.span R {x} = L`; UPSTREAM_GUIDE ("never wrap a one-line … in a new predicate", "use Mathlib's vocabulary"). The integral clause is written with `Submodule.span`; Conventions says so. Its two Lean examples were about Mathlib objects only and are gone with it.
- **`padicRealizationOne_mem_g` removed.** Its only supplier (PadicHodgeRegulators D.2, syntomic–étale comparison for varieties) has no package and is outside every merge order; nothing in Layers 3–4 uses H¹_g. The boundary paragraph says the H¹_g statement is neither used nor stated; membership in H¹_f outside the proved cases is the named hypothesis `PadicRealizationFinite`.
- **Instances, not new predicates.** `RealExactness` is PeriodsAndSpecialValues PS.3.2's Burns–Flach exactness hypothesis for the K-theoretic witness of §2.2; `TamagawaCondition` is PS.3.3's `LeadingTermRational` together with equality of PS.4.1's `integralLattice` (θ_p = ϑ_p) with O_p·δ; the Kato/Huber–Kings form is the theorem `tamagawaCondition_iff_kato`. `tamagawaCondition_iff_etnc` is kept as a theorem because PS.5.2 asserts no converse to `ETNC.localize`; the converse for commutative coefficients uses PS.5.1's `finiteBoundaryGluing`.
- **`delignePeriodMap_finrank_coker`** holds for w ≤ −1 (injectivity), not only w ≤ −2; generalized.
- **Coefficients.** Layers 3–4 are stated for commutative A (finite products of number fields): ArithmeticGaloisDuality §D7.3 perfectness and TauCetiRoadmap PadicMeasuresIwasawaAlgebras §5.1 determinants are for commutative rings. Layer 2 keeps general semisimple A (PS.3.1–PS.3.2 handle it). The noncommutative statement remains PeriodsAndSpecialValues PS.5's.
- **Lean.** Kept the design's bookkeeping definitions and theorems; proved `artinFactorRank_rat` (now also twist one) and `tendsto_mul_dedekindZeta_one_add` (previously `sorry`); added `tatePlusDim_rat` as an example and the two Hodge-weight theorems on Tau Ceti's `HodgeStructureOn`, the Hodge content of `delignePeriodMap_injective/_surjective`.

## Supplier contracts the suppliers do not state, and what this package does

The supplier audit (scripted map of every plan citation onto the supplier PACKAGE sections, then read) found these contracts that no supplier states; each is now a target here or a named hypothesis:

| Needed | Supplier status | Here |
|---|---|---|
| ζ_F order and leading coefficient at s = 0 | BorelRegulators §§5.2–5.4 only j ≥ 2 | target `dedekindZeta_leadingCoeff_zero` (§4.4) |
| compactly supported cochains with archimedean terms (Fontaine/Burns–Flach/Huber–Kings convention) | ArithmeticGaloisDuality §D7.5 uses finite places only | target `compactCochainsWithInfinity` (§3.5) |
| Bloch–Kato conditions at v ∣ p are exact annihilators | SelmerIwasawaCohomology §2.16 covers v ∤ p and ∞ only | target `blochKatoCondition_orthogonal` (§3.2), Bloch–Kato Prop. 3.8 |
| positive definiteness of the Néron–Tate pairing on E(K) ⊗ ℝ | upstream EllipticCurves Layer 6 has ĥ, ĥ(P)=0 ⇔ torsion, Northcott, regulator; not definiteness on ⊗ℝ | target `neronTatePairing_posDef_real` (§2.5) |
| p-adic realization of motivic cohomology of X/K with ℚ_p coefficients | MotivicEtaleKTheory §12.1 finite coefficients only | construction in §3.1 from §§10.1–10.2 + Hochschild–Serre + limits |
| Betti–étale comparison equivariant for G_v | MotivesAndAlgebraicCycles §2.7 states it after forgetting the Galois action | API `bettiEtaleComparison_infinity` (§3.6), Burns–Flach (28) |
| identification of MotivicEtaleKTheory's number-field Deligne regulator with BorelRegulators' r_Be | stated in neither | in `beilinsonRegulatorReal_artin` (§2.2), comparing universal classes (MEK §§12.2–12.3, BR §§8.2–8.3) |
| compatibility of the regulators with general correspondences (proper pushforward) | MotivicEtaleKTheory §12.2 has pullback and products only; Burgos–Feliu (arXiv:0907.5169, p. 2) defer covariance | hypothesis `RegulatorsCommuteWithCoefficients` for A ≠ ℚ, proved for Artin motives and for elliptic curves with endomorphism coefficients (§2.2); not needed for A = ℚ |
| H¹_g and the syntomic factorization for varieties | PadicHodgeRegulators D.2, no package | not used; hypothesis `PadicRealizationFinite` |
| Kummer/elliptic local conditions, Selmer complexes, Poitou–Tate for lattices | SelmerIwasawaCohomology §§2.12, 2.21, 2.23, 4.9, 4.26; ArithmeticGaloisDuality §D7.6 (R02.4.3 is finite modules only) | re-cited to the right sections |

Locator facts: the de Rham comparison is PadicHodgeTheory §8.1 (`LisseZpSheaf.IsDeRham`); the archived TauCetiRoadmap HodgeStructures is replaced by the Tau Ceti library declarations `TauCeti.Hodge.HodgeStructureOn`, `isCompl_F_conjF`, `conjF_antitone` (present at f790474); the upstream checkout's working tree is an older branch — TauCetiRoadmap main (origin/main 2b35f483) has 103 roadmaps including PadicMeasuresIwasawaAlgebras (§5.1 `detLine`, `detLine_shortExact`, `detLine_cone`, `detLine_baseChange`, `detLine_shift`, `detLine_acyclic`) and EtaleCohomologyFoundations, which are cited from there.

## Duplication check

Searched by object in TauCetiRoadmap main (origin/main 2b35f483, via `git grep`; the checkout's working tree is an older branch), the current Tau Ceti library (a91d3aaf), the pinned Mathlib, and every atlas package README.
- Nothing in TauCetiRoadmap main, Tau Ceti or Mathlib states a target of this roadmap (no fundamental line, Tamagawa condition, Lichtenbaum formula, Beilinson regulator sequence or Deligne period map). Mathlib has the residue at s = 1 (cited); upstream NumberFieldArithmetic has the class number formula at the residue only; upstream EllipticCurves Layer 6 has the canonical height and regulator (cited; positive definiteness on ⊗ℝ is new here).
- PeriodsAndSpecialValues PS.3.2 already states the six-term sequence as an abstract hypothesis and `realTrivialization`; PS.3.3 the rationality predicate; PS.4.1 the integral lattice; PS.4.2 lattice independence; PS.5.2–PS.5.3 the ETNC and orientation; PS.6.3 the elliptic BSD equivalence. Here they are cited and instantiated, never restated: RealExactness and TamagawaCondition are defined as the PSV predicates at the K-theoretic comparisons; §4.3(1) cites PS.4.2 for the lattice change; §4.6 states only that the data of Layers 1–3 meet PS.6.3's hypotheses.
- SpecialValuesBirchTate §§8.1–8.2 own h_n(F), R_n^M(F) and the Lichtenbaum predicates; §4.5 cites them (SpecialValuesBirchTate does not cite this roadmap, so no cycle). The design had SpecialValuesBirchTate as a downstream consumer; it is now a supplier, and the Downstream-consumers section names no supplier.
- MotivicEtaleKTheory §12.7 (second paragraph, package README line ~1350) still carries the Tate/elliptic `fundamentalLineRealComparison`, `fundamentalLinePadicComparison` and the Tamagawa assertion; the de-cycling fix of MotivicEtaleKTheory removes them (design handoff, follow-up 1). This package states the general versions and cites only §12.7's first paragraph.
- `IsLatticeGenerator` removed in favour of Mathlib's `Submodule.span` (see above).

## Adversarial pass

Every statement of the README was instantiated in its degenerate cases; the table records the instances and what changed.

| Statement | Instances tried | Result | Change |
|---|---|---|---|
| `motiveWeight_dual`, `dualTwist` | ℚ(2) (d = 0): dual ℚ(−1) of weight 2; untwisted dual d − j gives weight 4 | holds; the twist d + 1 − j is forced | Check rewritten (the design's wording contradicted itself) |
| `weight_vanishing` | w = 0 (ℚ(0)), −1 (h¹(E)(1)), −2 (ℚ(1)), −4 (ℚ(2)), w ≥ 0 by duality | holds | none |
| `artinFactorRank`, `tatePlusDim` | ℚ at r = 1, 2, 3; imaginary quadratic r = 1, 2; r₁ + 2r₂ = [K:ℚ] | holds; proved in Lean for all K and for ℚ | twist-one case of `artinFactorRank_rat` and `tatePlusDim_rat` added |
| `motivicFactorOne` | ℚ(1): K₁(ℤ)⊗ℚ = 0 vs K₁(ℚ)⊗ℚ infinite; h¹(E)(0): n = −2 | holds | n for h¹(E)(0) corrected (was −1) |
| α_M injective/surjective | Hodge weights n = −2, −1, 0 | the Hodge content is two lemmas on Tau Ceti `HodgeStructureOn`, proved in Lean; both hold at n = −1 | Lean theorems added |
| `delignePeriodMap_finrank_coker` | w = −1 | true for w ≤ −1 | generalized from w ≤ −2 |
| wrong involution | ℚ(3) | lattice conjugation gives coker 0, contradicting rank K₅(ℤ) = 1 | reworded as a dimension count |
| ϑ_∞ coordinate and Borel factor | rank-one x⁻¹ ⊗ y; real quadratic √d/R; imaginary quadratic r = 2 (d_r = 1) | the Borel coordinate is HALF the Beilinson one | design's "twice" corrected; Conventions pin the R⁻¹ convention |
| unit regulator at complex places | ℚ(2^{1/3}), u = 2^{1/3} − 1 (norm 1) | squared absolute value forced | Check added |
| RealExactness / PadicRealizationIso direct sums | componentwise | hold | none |
| TamagawaCondition direct sum | diagonal ℚ-coefficients, δ = p, δ′ = p⁻¹ | conjunction is NOT equivalent for diagonal coefficients | split into product vs diagonal coefficients; Check added |
| two-term lattice | [ℤ_p --p^s--> ℤ_p] in degrees 0,1 and −1,0; finite Q in degree 0 vs 1 | matches PeriodsAndSpecialValues PS.4.2 and MotivicEtaleKTheory §12.7 | Check wording clarified |
| ℚ(0) Tamagawa | ζ(0) = −1/2: δ = −2·gen; p = 2 | unit at odd p, visible at 2 | Check rewritten as a computation of δ |
| Euler factor at p | V = ℚ, r = 0: φ = 1, 1 − φ not invertible; k = 2, p = 3: −2 | acyclic trivialization undefined in twist 0 | Check `euler_zero` added |
| Lichtenbaum form | ℚ, k = 2, p = 3, 5; replace Ω by pΩ; ℚ, k = 5, p = 3 with c vs ch | K-lattice form fails at p < k under the character normalization | general index-term statement; motivic lattice for all odd p; K-lattice for p ≥ k; two Checks |
| ζ_F at s = 0 | ℚ (order 0, −1/2); real quadratic (order 1, −hR/2) | no supplier states it | new target with the gamma-factor computation |
| twist-one class number case | generalized index of exp_p(O_{F_v}) | "(q − 1)/q" is not an index; valuation −v_p(q_v) | restated |
| compact support | ℚ with ℤ_p(0), ℤ_p(1); p = 2 | archimedean term needed; not perfect at 2 | new target `compactCochainsWithInfinity` with three Checks |
| p-adic realization | dividing c_j by (j − 1)! at finite level | invalid (MotivicEtaleKTheory §12.1) | construction via motivic–étale comparison, no division |
| Néron–Tate | torsion points, rank one | definiteness on E(K)/tors ⊗ ℝ, not on E(K) | new target with Checks |
| Sha criterion | rank 0; K′/K | holds; converse over K′ not claimed | none |
| Selmer complexes of Artin motives | V = ℚ, r = 0, 1, 2 | holds | r = 1 Check added |
| coefficient compatibility | A = ℚ; Artin automorphisms; isogeny ψ with ψ_* = deg ψ·(ψ^*)⁻¹ | no supplier for general pushforward | named hypothesis for A ≠ ℚ, proved in the two families |

Generality: K-theoretic motives over every number field K (restriction of scalars to ℚ where the formula is over ℚ), every coefficient number field E (and products), all twists j ∈ ℤ, all primes p for the rational statements and odd p (or K without real places) for the integral ones; the Tate and elliptic cases are theorems inside these general statements. Noncommutative coefficients are kept in Layer 2 and left to PeriodsAndSpecialValues PS.5 for Layers 3–4 (suppliers are commutative).

## Follow-ups needed in other roadmaps (not done here)

1. **MotivicEtaleKTheory** (its fix round): drop the second paragraph of §12.7 and its Checks 3 and the second half of 4, and every PeriodsAndSpecialValues prerequisite of Layer 12 (design handoff, item 1). The name collision `fundamentalLineRealComparison`/`fundamentalLinePadicComparison` disappears with it.
2. **PeriodsAndSpecialValues**: its README still says (Scope, "Two boundaries"; PS.3 intro; PS.3.1–PS.3.2 proof routes; PS.4.1; PS.6.1) that MotivicEtaleKTheory Layer 12 owns the arithmetic fundamental line and the regulator determinant comparison. With this package those comparisons are instances here; PSV must state them as hypotheses only (design handoff, item 2) and must not cite this roadmap. PSV PS.4.1 should also say that its RΓ_c includes the archimedean terms (needed for θ_λ : Ξ ⊗ E_λ ≅ d RΓ_c to typecheck with the factor d(B⁺)⁻¹); this package defines that complex in §3.5.
3. **SpecialValuesBirchTate** is now a supplier of this roadmap (§§8.1–8.3); it must not cite MotivicEtaleKTheoryPartII.
4. **Owners of the new targets.** If MotivicEtaleKTheory later adds proper pushforward for its Deligne and étale regulators, `RegulatorsCommuteWithCoefficients` becomes a theorem for every datum; if SelmerIwasawaCohomology adds the Bloch–Kato orthogonality at p, or ArithmeticGaloisDuality the archimedean compact cochains, or BorelRegulators the s = 0 leading term, the corresponding targets here should be replaced by citations.
5. PadicHodgeRegulators D.2 (syntomic factorization, H¹_g) is not cited; if it gets a package below this roadmap, `padicRealizationOne_mem_g` can be restored.

## Sources

Read for this package (fetched into scratch only, free copies; hashes match the design packet): Burns–Flach, Doc. Math. 6 (2001) §§3.1–3.4 and Lemma 18 (p. 559); Kato, arXiv:math/0304233v1 §§1.2, 2.1; Huber–Kings, arXiv:math/0101071v2 §§1.1–1.5, 2.2–2.3 (page numbers are the printed numbers of the arXiv file, which equal the PDF page numbers); Fontaine, Bourbaki 751 §§6–9 (printed page = PDF page + 203; OCR is poor); Bloch–Kato 1990, §3.8–3.9 and §5 (printed page = PDF page + 332). Burgos–Feliu, arXiv:0907.5169 (p. 2: covariance deferred) and Kerr–Lewis–Müller-Stach, arXiv:math/0409116, were consulted only to establish that no free source states proper-pushforward compatibility of the regulator. All 23 Burns–Flach/Kato locators matched; Huber–Kings and Bloch–Kato/Fontaine locator mismatches (BK has no "§5.1" label — now "Definition 5.1"; Fontaine §6 ends on p. 224; §9.2 starts on p. 230; two Huber–Kings attributions on pp. 6–7 narrowed) were corrected. Silverman's *Arithmetic of Elliptic Curves* is cited at section level (Chapter VIII, §9) for the lattice argument; it is not freely available and was not read for this job — the reviewer should confirm the section or replace it. No cleared-library book was needed.

No instruction-like text was found in any fetched source, issue comment or file read for this job.
