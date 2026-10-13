# Independent package review: AutomorphicSpectralTheory

Verdict: **needs_changes**. Reviewer: `independent-review-REV-PKG-AutomorphicSpectralTheory`.
Worker: Claude (Opus 5.5), session `claude-zjZySy`. Date: 13 October 2026.
Issue: [#7921](https://github.com/CBirkbeck/tauceti-explorer/issues/7921).
This session wrote neither the package nor its plan.

## Why the verdict is needs_changes

The package was written on 11 October 2026, the day before the binding shape rule
(PACKAGE_REVIEW.md, "Shape of a roadmap", 2026-10-12). It fails both of that rule's mechanical
gates, and the rule tells the reviewer to return `needs_changes` on either one:

- `Suggested.lean` has **6,077 lines**; the cap is 5,000.
- `scripts/check_sorry_data.py` reports **46 data definitions or instances with a `sorry` body**.

The Lean file also develops theory rather than stating it: there are stand-in carriers, a
re-implementation of cochain cohomology, and constructions with sorry'd instances (details below).
Separately, the README is still in the atlas catalogue form that "README in TauCetiRoadmap form"
forbids.

The fix is a rewrite of both files into the upstream shape. A reviewer who did that rewrite would
then be accepting their own work, and the shape rule says the long draft must not be cut at review
time. So this review **changes nothing in the package**. It records exactly what the revision must
do, and it carries out the checks the reviser will need: suppliers and tiers, duplication against
current upstream, an adversarial pass over the explicit formulas, and `lean-check`.

The mathematics checked here holds up (see "Adversarial spot-check"). The defects are of form and
shape, plus one supplier contract that is incomplete.

## The six review checks

| Check | Result | Evidence |
|---|---|---|
| 1. Upstream form | **Fails** | The README uses `## AS.k —` and `### AS.k.j —` headings and field lists (`Assume:` 109, `API:` 79, `Tests:` 78, `Source:` 195, `Uses:` 195). It has no `**Checks.**` lists, no `### Examples` or `### Dependencies` per layer, no `**Summary.**` paragraph, no `## Exact supplier contracts` and no `## How to read the build`. The title is not `# Roadmap: …`. Size is 209,223 bytes; under the 2026-10-12 rule size is not itself a defect. |
| 2. Fidelity to the plan | Not re-audited | The packager reports all 190 targets, 223 API items and 219 tests present. Under the shape rule the review stops at the gates; the revision's review must re-check coverage after the rewrite. |
| 3. Own words | Pass on the sample read | Layers AS.0 (special functions), AS.1.1–AS.1.29 and AS.5 were read in full. They are in the packager's own words with locators and no source passages. The plan ids are a form defect, not a quotation problem. |
| 4. No process | **Fails** | 83 atlas slugs (`AA.0/restricted-haar-product` alone 40 times, `AF.*/…` 24, `AL.*/…` 7, `ALS.5/…` 4). There are B1–B… labels for library declarations (74) and S1–S30 source labels (194 locators). Other process traces: "(cited)", "(quoted input)" and "(quoted 'well-known')" in headings (AS.1.21, AS.1.28, AS.1.29, AS.2.22); "Φ as in item 88" (AS.1.21); "this node owns …" (AS.5.3); the paragraph beginning "Names live in `TauCeti.AutomorphicSpectral`. AS.k.j numbers targets …"; tests named `test1`–`test3` with Lean-fixture wording ("constructor guard", "returns no value at index zero"); "Correct" and "New" in the headings of AS.0.29 and AS.0.30. |
| 5. Suggested.lean | **Fails the shape gates; elaborates** | `lean-check` exits 0 with no errors and 722 warnings, all `declaration uses sorry` (shared build at Mathlib `082e2d3`, Tau Ceti `f790474`). But: 6,077 lines; 46 sorry'd data definitions; namespace `TauCeti.AutomorphicSpectral` rather than `TauCetiRoadmap.AutomorphicSpectralTheory`; layer headings `## AS.k —`; docstrings citing atlas ids (`AS.0.25a`, `` `AL.0/bessel-k` ``). |
| 6. metadata.toml | Pass | One line, `topic = "math.NT"`. Automorphic spectral theory and the trace formula fit math.NT; math.RT would also be defensible. |

## What the revision must do

### A. Suggested.lean: rewrite to the compact shape

Aim for roughly 1,000–1,500 lines, as with the tier 1–4 roadmaps.

1. **Remove every sorry'd data definition.** The 46 flagged are:
   - Direct integrals: `map_isometry`, `direct_integral`, `mk`, `reindex`, `decomposable_operator`.
   - Projection-valued measures: `scalarMeasure`, `borelIntegral`, `diagonal_measure`, `multiplication_measure`, `spectral_resolvent`.
   - Operator theory: `kernel_operator`, `traceNorm`, `operatorTrace`, `harmonicDiagonal`, `nuclear_lf_space`, `realStageEquiv`.
   - Projective tensor product: `projective_tensor` with its sorry'd `normed`/`normedSpace`/`complete` instances, `tensor`, `map`, `scalar_unit_equiv`, `finite_matrix_equiv`.
   - Vector Schwartz spaces and poles: `tensor`, `fourier`, `directSumPoles`.
   - Modular models: `fullModular`, `levelModular`, `effectiveModularGroup`, `identityCoset`.
   - Continued functions: `continuedV`, `normalizedV`, `continuedE`, `scalarCoefficient`, `continued`, `residue_calculus`, `automorphic_green`.
   - Other: `squareCoverKernel`, `rankOneDilation`, `isobaric_sum`, `associate_parameter_fields`, `mk`, `spectral_map`, `eisenstein_principal_value`, `compactCohomologyFinite`, `rankOneCohomologyFinite`.

   A continued meromorphic function is stated existentially in a theorem (there is a meromorphic
   F agreeing with the series on Re s > 1 and satisfying the functional equation), never as a
   sorry'd `def`.
2. **Remove the stand-in carriers and every statement that mentions them.** These are
   `HilbertModel`, `GLAutomorphicDatum` (its `standardL : ℂ → ℂ` is an arbitrary function),
   `ModularGeometry`, `SpecialFunctions`, `CochainData` and its `cohomology` (Mathlib's
   `HomologicalComplex` already provides this), `InductionData`/`NormalizedInduction`,
   `TruncationData`, `ScalarIntertwinerPair`, `RegularFunctionFieldFamily`, `PWMultiplier`,
   `gm_family` and `multiplicative_gm_family`. `measurable_hilbert_field` and
   `projection_valued_measure` are heavy constructions, and the second is SelfAdjointSpectralTheory's
   carrier. Their statements become README targets.

   The adelic layers (Eisenstein series of reductive groups, truncation, spectral decomposition,
   Franke, the trace formulas) and the function-field layers have no carrier at the pins
   (G(𝔸), automorphic quotients, induced Hilbert families). They live in the README only.
3. **Form.** Use `namespace TauCetiRoadmap.AutomorphicSpectralTheory`, one module docstring in the
   upstream form, and `/-! ## Layer k: <title> -/` headings in README order. Docstrings carry no
   atlas ids.
4. **Indicative keep-list** (light, real-bodied, carriers at the pins). The reviser decides the
   final set; one or two discriminating `example`s for each kept definition:
   - `StripOrder`, `FiniteStripOrder`, `CommonDenominator`.
   - `bessel_j` and `bessel_i` from `Complex.regularizedHGFun`, and `bessel_k` from its Mellin
     integral. Examples: I₀(0) = 1, J_{1/2}, I_{1/2}, K_{1/2}.
   - `kloosterman_sum`. Examples: S(m,n;1) = 1, S(0,0;c) = φ(c).
   - `weight_laplacian`. Example: Δ₀ y^s = s(1−s) y^s.
   - The SL₂(ℤ) and Γ₀(N) nonholomorphic Eisenstein series as sums over coprime pairs, with
     convergence, invariance, the eigen-equation, and existence of the meromorphic continuation
     with its functional equation.
   - `legendre_q` and `point_pair_invariant`; `archimedean_v_integral` with the V_s(0) formula;
     `sine_power_integral`; the Whittaker M function from `Complex.regularizedHGFun`.
   - The Herglotz representation, which is statable at the pins.

### B. README: rewrite into the upstream shape

The mathematical content is kept in full; only the scaffolding changes.

1. Title `# Roadmap: automorphic spectral theory and trace distributions`, then an opening
   `**Summary.**` paragraph.
2. Add `## Scope and ownership`, `## Conventions`, `## Exact supplier contracts` (From Mathlib /
   From Tau Ceti / From TauCetiRoadmap.<X> / From other roadmaps, naming the declarations or
   layers consumed) and `## How to read the build`.
3. Layers become `## Layer k: <title>` with `### k.n <topic>` subsections. Each subsection is prose
   that names its API lemmas in the sentence, followed by a `**Checks.**` list (one bullet per test,
   each saying what is computed and what a wrong definition would give). Each layer ends with
   `### Examples` and `### Dependencies`.
4. Drop the field lists, the `AS.k.j` numbering, the B-labels and the S-labels:
   - Name library declarations in place.
   - Cite sources by short keys (`[Art05]`, `[Fra98]`, …) with theorem, section and page.
   - Replace each atlas slug by the upstream place it stands for:
     - `AA.0/restricted-haar-product` → AdelicAlgebraicGroups Layer 0 (§§0.1–0.3).
     - `AA.2/…` → §§2.1–2.3; `AA.3/…` → §§3.1, 3.4–3.6.
     - `ALS.5/de-rham-comparison` → ArithmeticLocallySymmetricSpaces ALS.5b.1;
       `ALS.5/cuspidal-cohomology` → ALS.5b.5.
     - `AF.3/constant-term`, `AF.3/cuspidal-spectrum-discrete`,
       `AF.3/cuspidal-automorphic-representation` and `AF.2/smooth-automorphic-forms` →
       ArithmeticLocallySymmetricSpaces ALS.F.6, which now owns automorphic forms, T([G]), constant
       terms, cusp forms and Gelfand–Piatetski-Shapiro discreteness.
     - `AF.1a/relative-lie-cochain-complex` → ALS.F.5.
     - `AF.1/infinitesimal-character` → RepresentationTheory/LieHighestWeight Layer 7, as ALS uses it.
     - The remaining AutomorphicFormsOnReductiveGroups items (discrete series, Langlands
       classification, normalized real parabolic induction, restricted tensor products) stay with
       that tier-11 roadmap, cited by layer and statement rather than by slug.
     - `AL.0/bessel-k` and `AL.1/…` → the matching sections of AutomorphicLFunctionsAndLocalFactors.

   (ArithmeticLocallySymmetricSpaces is TauCetiRoadmap pull request #871.)
5. Remove the process traces listed under check 4.
6. **Franke contract (an incomplete interface, not only form).** Upstream
   ArithmeticLocallySymmetricSpaces does not prove Franke's theorem. It takes it as the hypothesis
   `FrankeInput(G, K, V)` of its ALS.5b.4, with three clauses:
   - (a) Franke's comparison;
   - (b) the decomposition of 𝒜_J(G) over associate classes, with the cusp forms as the
     {G}-summand;
   - (c) for a proper class {P}, the Hecke eigensystems in the {P}-summand's cohomology are those of
     unnormalized induction from a cuspidal σ on L_P, whose infinitesimal character is that of the
     dual of the L_P-representation of highest weight w(λ+ρ)−ρ for a Kostant representative
     w ∈ W^P.

   AS.5.10 (Franke's comparison, Fra98 §7.4 Theorem 18) and AS.5.12 (the Franke–Schwermer
   cuspidal-support decomposition) give (a) and (b). Clause (c) is stated only for GL_n
   (AS.5.13), and the Kostant-weight description is missing. The revision should:
   - state that Layer 5 discharges `FrankeInput(G, K, V)` under ALS.5b.4's hypotheses (K neat,
     V = V_λ irreducible, A_∞ acting through ζ_V, 𝔪_G = 𝔤/𝔞_G, the full K_∞);
   - add clause (c) as a target (Fra98 §7.6 p. 261, with the use in ACC+23 §2.4.9, proof of
     Theorem 2.4.10, pp. 949–950), or record it as a gap.

   This also settles the packager's open question about AF/ALS citing AS upward. Upstream ALS
   imports Franke as a hypothesis, so AS.5 stays here and is the place that discharges it.

## Suppliers and tiers

AutomorphicSpectralTheory is tier 13 in `research/blueprint/upstream/CaraianiNewton.md`. Every
roadmap the README cites is lower or already upstream:

| Supplier | Tier / status |
|---|---|
| ReductiveGroupsPartII | 1; TauCetiRoadmap main |
| AdelicAlgebraicGroups, SmoothRepresentationsOfLocalGroups | 2; TauCetiRoadmap main |
| ArithmeticLocallySymmetricSpaces | 11; TauCetiRoadmap PR #871 |
| AutomorphicFormsOnReductiveGroups | 11 |
| AutomorphicLFunctionsAndLocalFactors | 12 |
| OperatorTheory (SelfAdjointSpectralTheory, OperatorIdeals) and RepresentationTheory/CompactGroups | TauCetiRoadmap main |

The earlier upward citations (EndoscopicTransfer) and the off-order ones (QSeries,
EllipticRegulators) are gone: the packager planned AS.2.6a, AS.6.8a, AS.6.16a, AS.0.25a and
AS.1.15a here.

## Duplication against current upstream

Checked against TauCetiRoadmap main (`0d144d0`), PR #871's README, and the Tau Ceti library at
`a91d3aaf`, by object rather than by name.

- OperatorTheory owns projection-valued measures, the Borel calculus, Stone's theorem and the
  spectral measure of unbounded self-adjoint operators (SelfAdjointSpectralTheory, Parts A–E). It
  also owns Schatten classes, the trace-class family (OI-B30) and Hilbert–Schmidt operators
  (OperatorIdeals, Parts B–C). AS.0.5 and AS.0.7–AS.0.10 already state only their additions; the
  supplier contract should name the items consumed (for example OI-B30).
- Upstream ALS.F.6 covers AS's AF.2/AF.3 citations (see B.4).
- Nothing upstream owns orbital integrals, pseudo-coefficients, Paley–Wiener theory, Kloosterman
  sums, Bessel or Whittaker functions, Legendre Q, or nonholomorphic Eisenstein series.
  ModularForms Layer 11 is the holomorphic Eichler–Selberg trace formula, a different object.
- The Tau Ceti library has holomorphic weighted and character Eisenstein series of weight ≥ 3
  (`TauCeti/NumberTheory/ModularForms/EisensteinSeries/`). They are distinct from AS.1.24's
  nonholomorphic series and need no change.

No target needs removing for duplication.

## Adversarial spot-check

A `sorry` build checks no truth, so the explicit rank-one formulas, the conventions and a sample of
adelic tests were checked by computation. They were checked by hand, and numerically to about
10⁻¹¹ or better with pure-Python quadrature and lattice sums (no numerical library was available).
**No statement checked was false.**

| Statement | Instances tried | Result |
|---|---|---|
| Conventions: Δ_k vs unitary normalization, shift k²/4 − k/2 | general k by direct differentiation; k = 1/2 | holds (−3/16) |
| AS.0.25a Bessel half-order checks; AS.0.27 Whittaker–Bessel comparison | DLMF 13.18.8–9 | holds |
| AS.0.26 tests M_{0,1/2} = 2 sinh(y/2), M_{1,1/2} = y e^{−y/2} | Kummer series | holds |
| AS.0.29 sine-power integral with 2^{ν−1} | (ν, β) = (1.7, 0.4), (2.5, −1.3), (0.6, 2.0) | holds |
| AS.0.30 Whittaker cycle integral (A.1), both signs | (μ, s, t) = (0.3, 1.7, 1.3), (−0.6, 2.2, 0.8), (0, 1.25, 2.5) | holds |
| AS.0.32–0.34 leading coefficients of (A.2), (A.3) | Γ duplication | agree |
| AS.0.35 Q_{s−1}: integral = ₂F₁ form; Q₀, Q₁ values | s = 1, 1.5, 2, 2.3 | holds |
| AS.0.37 g₁ = g; Legendre equation ⇔ Δ_GZ g_s = s(s−1) g_s | identity in cosh d | holds |
| AS.0.38 Q_{s−1} near t = 1 | DLMF 14.8.9 with ψ(1) = −γ | holds |
| AS.0.40 V_s(0) | k = 1, s ∈ {0.7, 1, 2}; k = 2, s ∈ {−0.4, 0.7, 1}; k = 3, s = 1.3 | holds |
| AS.0.43 V_{−r}(t) | (k, r) = (1, 0), (2, 0), (2, 1), by residues | holds |
| AS.0.45 K-Bessel form of V*_s | k = 1 closed form at s = 1; numerically k = 1, 2, 3 | holds |
| AS.1.1 half-modulus dilation tests | r^{2 Re s} scaling; r = 4 without half-modulus | holds |
| AS.1.2, AS.1.4 SL₂ chamber and c-function | λ = s − 1/2; ξ(2s−1)/ξ(2s) | consistent |
| AS.1.15 residues of Λ(2s)E at 0 and 1 | standard | −1/2, +1/2 |
| AS.1.22 residues 3/π, 3/(π(p+1)), κ_N; 2ζ(4) non-primitive sum | index formula | holds |
| AS.1.23 Möbius formula (2.16) for E_N | N = 1, 2, 6, s = 3, z = 0.13 + 0.71i, lattice sums | holds |
| AS.1.24 half-sum = L^{(N)} × primitive coset sum | odd ε; gcd extraction | holds |
| AS.1.29 E(z,s) Fourier expansion; E_{2,s} identity, constant term and coefficients | s = 3 numerically; identity by direct ∂_z | holds |
| AS.5.1 `cusp_power` (a + b < 1/2) | hyperbolic norm of dy | holds |
| AS.5.3, AS.5.6 tests | Jordan block; directions (1,1), (2,1) | holds |

### Mistakes in the sources

- AS.0.29 notes that the printed sine-power formula in Duke–Imamoḡlu–Tóth 2016 (Annals 184,
  p. 984) lacks 2^{ν−1}. This is entry **E9** of the confirmed register
  `research/blueprint/errata/PAPER-DUKE-IMAMOGLU-TOTH-16.md`, and the corrected formula was checked
  numerically above.
- AS.0.33 is consistent with the register's √2 correction (E10).

## Files

- Package `README.md`, `Suggested.lean` and `metadata.toml`: **unchanged**.
- `review.json`: written, status `needs_changes`.
- `python3 research/blueprint/intake.py check-files` on this report and `review.json`: 0 problems.

## Questions for the orchestrator

1. The AutomorphicFormsOnReductiveGroups package (tier 11, not yet written) should also point its
   automorphic-forms and cusp-form items at upstream ALS.F.6, as AS now must.
2. Should Franke's clause (c) for general G be a new AS.5 target, or does the maintainer prefer to
   leave it as a recorded gap behind upstream's `FrankeInput` hypothesis?
