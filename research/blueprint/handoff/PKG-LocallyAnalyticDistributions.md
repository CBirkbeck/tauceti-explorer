# PKG-LocallyAnalyticDistributions — handoff (worker cc-150aff, 2026-10-09)

## What was produced

`research/blueprint/packages/LocallyAnalyticDistributions/` — `README.md` (TauCetiRoadmap prose form, about 254 KB),
`Suggested.lean` (TauCetiRoadmap form, about 206 KB, elaborates with `sorry` as the only warning), `metadata.toml`
(`topic = "math.NT"`).

The README was generated from the complete 303-target plan (`research/blueprint/packets/LocallyAnalyticDistributions.json`,
Codex pass of 2026-10-09, review pending) by a script that orders the targets by the reader document's heading order,
groups them into numbered subsections (0.1–0.3, 1.1–1.5, 2.1–2.3, 3.1–3.4, 4.1–4.15), hoists hypotheses shared by two or
more targets of a subsection into a lettered list that each target cites, hoists the dominant source locator and the shared
Mathlib inputs of a subsection, renders API lists and unit tests as prose and `**Checks.**` bullets, and maps every
prerequisite to a section reference, a Mathlib or Tau Ceti declaration, or a supplier layer. Front matter (scope and
ownership, conventions, exact supplier contracts, how to read), layer introductions, examples, dependencies, source
corrections and references were written by hand. Every definition keeps its API and at least three checks; every theorem
its hypotheses and locator; every target its prerequisites. Proof outlines of the plan are not reproduced (they are not
required by the form and would have added about 110 KB).

## Size

The README is about 254 KB, above the 200 KB figure in the deliverables section of the packaging brief and inside the
100–300 KB range of the binding "README in TauCetiRoadmap form" note. Everything that the form note forbids dropping
(tests, hypotheses, locators, prerequisites) is kept; what was cut to get from 334 KB to 254 KB was the source
"match" commentary, repeated hypothesis strings, repeated locators and repeated library inputs. Getting under 200 KB
would require dropping per-target prerequisites or merging Layer 4's fine-grained helper lemmas into coarser targets;
the maintainer may prefer to split Layer 4 (221 of the 304 targets, §4.1–§4.12 being the inherited Fredholm
development) into a Part II roadmap. Accepted packages already range from 197 KB (PadicMeasuresIwasawaAlgebras) to
556 KB (AdicSpacesPartII).

## Duplication against the current Tau Ceti library (a91d3aaf) and current upstream roadmaps

Searched by object (Gauss norm, restricted series, Tate algebra, entire series, Hasse derivative, resultant,
`charpolyRev`, upper-triangular matrices, compact/Fredholm operators, Riesz theory, c₀ spaces, Amice transform, Mahler
basis, locally analytic functions, character spaces, Mellin transforms, completed group algebras) in the library and in
the nine upstream roadmaps newer than the atlas snapshot plus the four Completed ones.

Removed and cited instead (1 target):
- `L4/polynomial-series-entire` ("native polynomials are entire") — a consequence of Tau Ceti
  `TauCeti.PowerSeries.isRestricted_polynomial` (`TauCeti/RingTheory/PowerSeries/Restricted.lean`) through the
  comparison §4.11 `isEntire_iff_forall_isRestricted`; listed under Scope and ownership. The declaration
  `polynomialSeries_entire` stays in `Suggested.lean` because two later signatures take it as an argument; its docstring
  is unchanged and the README states it is not a target.

Kept with an explicit boundary statement (not duplicates on inspection):
- Tau Ceti `Analysis/Fredholm/*` (index theory of `ContinuousLinearMap.IsFredholm`) and
  `Analysis/Normed/Operator/Compact/RieszTheory.lean` (Riesz theory for `IsCompactOperator`) are over a field with the
  archimedean-style compact-operator notion; Layer 4 is over a Noetherian Banach algebra with finitely-generated-image
  complete continuity. The only link asserted is the comparison in §4.1.
- Tau Ceti `TauCeti.PowerSeries.gaussValuation`, `IsDistinguished`, `norm_eq_gaussNorm` (restricted series at one radius)
  are cited as inputs of §4.11 (entire series carry all radii at once).
- Mathlib `LaurentSeries.hasseDeriv` (Hahn series) is cited; the power-series Hasse derivative of §4.5 must agree with it
  under the embedding, and that agreement is written into the target.
- OperatorTheory (upstream umbrella) is Hilbert-space theory over ℝ/ℂ; no overlap.

Moved down (1 notion): the plan cited `PadicDifferentialEquationsAndRigidCohomology:RD.5/nonarchimedean-hahn-banach`
(tier 12) from `L0/banach-splitting`. The nonarchimedean Hahn–Banach theorem (Ingleton; spherically complete K, with the
separable fallback) is now a target of §0.2, cited by Ingleton 1952 and Schneider's *Nonarchimedean Functional Analysis*
Chapter II §9 (no proposition numbers are given because those two sources were not re-read in this session; a reviewer
should pin them).

Citations kept as supplier contracts: PadicMeasuresIwasawaAlgebras (tier 1) L0, L0a, L2, L3 (the package README's names
are used throughout); AdicSpacesPartII (tier 3) R3; the Tau Ceti roadmaps AdicSpaces (Layers 0 and 5) and
ReductiveGroupsPartII (RG2.1). The plan's request to a "shared functional-analysis Part II proposal" for solid
localisation has no roadmap behind it; the README states §4.15's finite-window target classically and says no
solid-localisation claim is made.

## Suggested.lean

Built from `research/blueprint/suggested/LocallyAnalyticDistributions.lean` (all 533 declarations retained): `import
Mathlib` plus `TauCeti.RingTheory.Polynomial.Resultant.AdjoinRoot`; one module docstring; the whole file inside
`namespace TauCetiRoadmap.LocallyAnalyticDistributions` with sub-namespaces `Huber`, `NonarchimedeanFredholm`,
`LocallyAnalytic`, `Mellin`, `AnalyticDistributions`; `lemma` → `theorem` (149 renames); docstrings generated from the
plan for the 451 declarations that had none (target statement and locator, or the API item's statement); layer section
comments at the block boundaries (the operator-theoretic half of Layer 4 comes first because the Layer 0–3 signatures
reuse its coefficient spaces); the transcription worklist and the two closing omission registers replaced by one closing
comment naming the untypeable targets; process comments removed. Two edits were needed for `import Mathlib`: at this pin
the additive form of `Finset.mulAntidiagonal` is a genuine `Finset.antidiagonal` with `IsPWO` arguments that shadows the
`HasAntidiagonal` export, so the Hasse product formula now writes `Finset.HasAntidiagonal.antidiagonal`; and `open
Matrix` inside the roadmap namespace is written `open _root_.Matrix` because the file declares its own `Matrix.*` lemmas.

Check: `lean-check <absolute path>/Suggested.lean` (the swarm wrapper, pinned at Tau Ceti f790474 + Mathlib 082e2d3) → exit 0, 489 `declaration uses 'sorry'`
warnings, no other warnings or errors, about 27 s.

Not typed at the pins (listed in the closing comment and stated in the README): the global compact-type carriers
`discAnalytic`, `LAh`, `LA`, `Dist`, `Cr`, `DistOrder`; the three-space and Hahn–Banach theorems; chart pullback and
independence, completed analytic tensors, strong duality; the unbounded Amice transform and its dictionary on the global
carrier; the non-splitting theorems; the anisotropic function space and the rectangular/multidegree extension theorems;
`distributionMellin`, its Fréchet isomorphism, coefficient extension and adic comparison; the dual scalar-extension map;
the Tate-algebra and formal-series compactness theorems; the finite-slope perfect complex, its homotopy invariance, the
Euler-characteristic local constancy and the Fréchet finite-slope theorem.

## Checks run

- `python3 research/blueprint/intake.py check-files` on the four files → 0 problems; no `/home/` paths.
- Residue scan of both files for packet ids and process words → none.

## Open points for the maintainer

- Size (above).
- The plan's review is pending; this package packages it as is. Its six source corrections are restated in the README
  under "Source corrections" without the finding ids.
- The Hahn–Banach locators (above).
- Statements are the plan's own wording, lightly normalised; a mathematician's pass over Layer 4's 221 targets for
  readability would improve the prose but was outside the time box.

## Adversarial mathematics pass (brief, "Adversarial mathematics pass", 2026-10-09)

Done over the conventions, every definition/construction, and the identities of Layers 1–4 that carry a sign, a
normalisation, a denominator or a degenerate case; Layer 4's 150 helper lemmas were checked through their shared
conventions and their existing degenerate tests (zero operator, empty matrix, zero ring, A = K × K, dual numbers,
characteristic two, nilpotent coefficients), not one by one.

| Statement / convention | Instances tried | Result and change |
| --- | --- | --- |
| Amice normalisation δ_a ↦ (1+T)^a; multiplication by x = (1+T)d/dT | δ_1, x·δ_1 | d/dT alone gives 1, not 1+T: convention confirmed; witness added (Convention 13) |
| Transpose derivative (dμ)(f) = μ(f′) has multiplier +log(1+T) | μ = dδ_a: coefficients μ(binom(x,1)) = 1, μ(binom(x,2)) = a − 1/2 | match log(1+T)(1+T)^a = T + (a − 1/2)T² + …; the opposite sign would give −log; witness added |
| Clopen restriction formula p⁻ⁿΣ_{η} η^{−b}A_μ((1+T)η − 1) | δ_a, n = 1, a ≡ b and a ≢ b | gives (1+T)^a resp. 0: correct; needs μ_{pⁿ} ⊆ L — hypothesis was missing in prose; Convention 11 added |
| Dilation, φ, ψ, twist formulas | δ_c, z^x·δ_c, σ_a δ_c = δ_{ac} | all consistent with (1+T)^c; no change |
| Division by x; ∫_{b+pⁿℤ_p} x^k μ formula | δ_a, k ≥ 0; k ≤ −1 with b ∈ pⁿℤ_p | k ≥ 0 reproduces a^k·1_{a≡b}; the k ≤ −1 case is excluded exactly when b ∈ pⁿℤ_p in the statement; ambiguity Kδ_0 stated; no change |
| LA_h stages and non-example 1_{a+p^hℤ_p} ∉ LA_{h−1} | h = 0 | vacuous (no LA_{−1}); check now says "for h ≥ 1" |
| C^r, order r, Amice–Vélu–Vishik | r = 0; r = N + 1 (critical) | r = 0 is measures (target); the critical case is a stated negative control (d^{N+1}δ_0) |
| Vector order r = (1/2, 0), f = 1 ⊗ 1_{pℤ_p} | Loeffler Def. 2.12 instance | the plan's counterexample stands; the tensor definition is used (Source corrections) |
| Component Mellin series and evaluation κ_{ν,t} | δ_u with u = γ^m; trivial character t = 0; p = 2 with ω(−1) = −1, ⟨−1⟩ = 1 | (1+T)^m, value 1 = total mass at t = 0; p = 2 uses the {±1} × (1+4ℤ_2) chart and γ = 5 as stated; witness added |
| Clearing quotient F(t)/(κ_t(a) − 1) | trivial character (κ_t(a) = 1) | denominator vanishes: the construction already restricts to E(D,t) ≠ 0 and asserts no value there; stated again in Convention 13 |
| Fredholm series sign c_n = (−1)^n Σ minors | u = a·id on A; u = 0; nilpotent 2×2 | 1 − aT (c_1 = −tr), 1, 1: Lean tests rank_one_scalar, zero_operator, nonzero_nilpotent pin them |
| Slope endpoint "≤ h includes equality" | u = a·id, v(a) = h | reciprocal root a⁻¹ has valuation −h ≥ −h: included; matches sources E4/E6 corrections |
| Riesz convention c = Δ_h P_u(a) unit, E = 1 − (vb)^h | u = id, a = 1, h = 1; h = 0 | c = −1, E = 1 (Lean riesz_scalar_root passes c = −1); h = 0 gives E = 0 (riesz_order_zero) |
| Q*(X) = X^{deg Q}Q(1/X); Res(Q, F) = norm of ρ_Q(F) | Q = X − a; Q = 1; F = 0 | (X−a)* = 1 − aX; Res(1,F) = 1 (zero ring); Res(Q,0) = 0 not a unit — negative control `resultant_zero_series` added to §4.4 |
| Fredholm resolvent | u = id on A | P_u(T)(1 − Tu)⁻¹ = 1 entire, Neumann series alone not entire — negative control `resolvent_not_neumann` added to §4.5 |
| Hasse derivative, root multiplicity by first unit Hasse derivative | characteristic 2, T²; dual numbers | Δ_2(T²) = 1 while (T²)″ = 0 (Lean hasse_characteristic_two); nonunit first derivative over A[ε] is excluded by the "unit" clause (Lean root_nonunit_constant) |
| Entire series / open-disc series radii | R = 1 (Σ Tⁿ), every R > 0 | Σ Tⁿ is open-disc but not entire and not closed-disc analytic: three existing non-examples |
| Zero algebra, zero module, empty index | A = 0; c₀(∅); n = 0 matrices | A = 0 excluded by Convention 1 and `[Nontrivial A]`; P = 1 on c₀(∅) and for the empty matrix (existing tests); the universal spectral identity is stated without nontriviality (zero_ring test) |
| O ramified / unramified / equal characteristic | Layer 0–2 domain ℤ_p with coefficients L ⊆ ℂ_p; Layer 3 Lean over any complete ultrametric K with bounded ℤ_p-action | prose and Lean generality now stated and reconciled in Convention 12; equal-characteristic coefficients are not claimed for the p⁻ⁿ / roots-of-unity / logarithm statements |
| Generality README vs Lean (ultrametric norms) | 65 Lean statements with explicit `hA`, 2 with `hM` | Lean carries ultrametricity per statement; README standing hypotheses are the stronger side; recorded in Convention 12 |
| Interfaces promised vs supplied | "comparison with IsCompactOperator" and "agreement with LaurentSeries.hasseDeriv" in my front matter | no target behind either: both promises cut; the §4.1 complete-continuity/affinoid agreement has its target |
| Definitions with a passing and a failing example | all 14 definitions and 34 constructions | 46 already had one; `entire-resultants` and `resolvent-series` now do (above). The two new negative controls are stated in the README only; their Lean `example`s need the `entireResultant`/resolvent signatures' proof arguments and were not added in the time box |
