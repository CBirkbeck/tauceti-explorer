# Handoff: PKG-ArithmeticGaloisDuality

Worker: Claude (claude-cEOcoh), 2026-10-12. Issue #8888.

## What was done

- `research/blueprint/packages/ArithmeticGaloisDuality/README.md`: the roadmap in TauCetiRoadmap
  form (2026-10-12 shape, about 387 KB), titled "continuous cohomology of profinite groups, part II — compact
  coefficients and arithmetic duality": Summary with the layer table, scope and ownership,
  conventions, exact supplier contracts, how to read the build, Layers R02.1, R02.2, R02.3, R02.4,
  D7, R02.5, D8, R02.6 (each with subsections, every target's statement with its hypotheses, API
  by name, Checks, proof sketch, locators and *Needs:*, and closing Examples and Dependencies),
  worked examples, downstream consumers and references. All 125 plan targets are present, plus six
  targets added under the tier rule (below).
- `research/blueprint/packages/ArithmeticGaloisDuality/Suggested.lean`: one short file (about 640
  lines) in namespace `TauCetiRoadmap.ArithmeticGaloisDuality`, with real-bodied light definitions
  only (towers with `lim`, `lim¹`, the Mittag-Leffler condition via Mathlib's
  `Functor.IsMittagLeffler`, morphisms of towers and the induced map on `lim¹`; the pointwise `Hom`
  with its product topology; additive sections; `IsUnramifiedOutside`, `maxUnramifiedOutside`,
  `galoisGroupS`, `exponentTwoField`; the localisation kernel `absoluteSha`; the restricted product
  `Pʳ_S`, `beta` and `sha`; the Euler-characteristic quotient and archimedean factors; admissible and
  ind-admissible coefficients; compactly supported cochains as Mathlib's mapping fibre; the
  trace-zero submodule and first-order lifts over `k[ε]`), and the milestones statable at the pins
  proved by `sorry` (Mittag-Leffler ⇒ `lim¹ = 0`, the `lim¹` exact sequence, cochain lifting,
  boundedness into a lattice, Hermite's finiteness with ramification outside `S`, finiteness of
  `H¹(G_{K,S}, M)`, Tate's Euler characteristic for totally complex fields, the compact-support
  long exact sequence, trace-zero duality iff `n` invertible, the first-order cocycle criterion,
  archimedean adjoint dimensions). `det(1 + εX) = 1 + ε tr X`, `mem_lim`, `sections_sub_mem_ker`,
  `mem_absoluteSha`, `sha_res_cor`, `sha_eq_absoluteSha`, `beta` and several examples are proved.
  No `sorry`'d data. The closing comment lists the README-only targets.
- `metadata.toml`: `topic = "math.NT"`.

## Lean check

`lean-check research/blueprint/packages/ArithmeticGaloisDuality/Suggested.lean` (shared build, Tau
Ceti f790474, Mathlib 082e2d37e8): exit 0, only `declaration uses 'sorry'` warnings. Imports:
`Mathlib`, `TauCeti.RepresentationTheory.Homological.ContCohomology.SmoothDiscrete`,
`TauCeti.Algebra.Lie.GeneralLinear.TraceForm` (both at the pin and in the shared build).

## Layer order and targets placed in another layer

The plan's layer labels are not in dependency order: targets of R02.3 and R02.4 depend on each
other, so do targets of D7 and of R02.2 and R02.4, and D8 needs R02.5 while R02.6 needs D8.
The README builds the layers in the order R02.1, R02.2, R02.3, R02.4,
D7, R02.5, D8, R02.6 and places these targets in a later layer than their plan label, so that no
target is used before it is stated (checked by script on the prerequisite graph):

- `R02.2/compact-hochschild-serre` → Layer D7 (it needs D7's derived coefficient algebra);
- `R02.2/cyclotomic-local-global-kernel` → Layer R02.3 (it needs `R02.3/absolute-and-relative-sha`);
- `R02.3/finite-compact-support`, `R02.3/function-field-finiteness-euler` → Layer R02.4 (they need
  Poitou–Tate);
- `R02.4/global-finiteness`, `cohomological-dimension-bound`, `euler-characteristic-additivity`,
  `global-euler-characteristic` stay in R02.4 (their plan stage is R02.3, but they use R02.4 duality);
- `R02.4/lattice-rational-poitou-tate`, `abelian-variety-local-duality`,
  `isogeny-dual-exact-sequence` → Layer D7 (they need D7's derived duality).

Consumers citing these by their old stage should look them up by title in the new layer.

## Notions moved down into this roadmap (tier rule)

- **FunctionFieldArithmetic FA.2–FA.5** (outside the 94; eleven citations) is replaced by five new
  targets in Layer R02.3, subsection R02.3.2 *Global function fields: class-field inputs*:
  *Function-field places, ideles and `S`-units* (FA.2), *Restricted ramification over a global
  function field* (FA.3), *Local inputs at places of a global function field* and *The class
  formation of a global function field* (FA.4), *Chebotarev density for global function fields*
  (FA.5). Sources: Neukirch–Schmidt–Wingberg (electronic edition 2.3, printed pages), VII §§1–3 and
  VIII §§1, 3; Milne ADT I §2. FunctionFieldArithmetic should import these.
- **Normalised ring duality** (the plan's open gap for D7's Grothendieck branch): the dualizing
  complex and the normalised local dualizing complex are SchemeAndStackFoundations SF.2 (lower tier,
  cited); Grothendieck local duality `RHom_R(K, ω) ≅ D(RΓ_𝔪(K))` is a new D7 target *Grothendieck
  local duality for a complete Noetherian local ring* (Stacks, Theorem 47.18.3, Tag 0A84; Nekovář
  §§2.5–2.8).
- **Derived tensor / K-flat inputs**: cited from SchemeAndStackFoundations SF.2 (derived tensor and
  internal Hom of modules) and EnhancedDerivedSheaves E1 (K-flat complexes) inside D7's targets.
- **Étale Ext / gerbe input for abelian varieties and tori**: the dual abelian scheme and abelian
  gerbes are AlgebraicModuliForArithmeticGeometry R09.4, the étale–Galois comparison is
  SchemeAndStackFoundations SF.2, tori and character lattices are TauCetiRoadmap ReductiveGroups;
  the Barsotti–Weil step is stated inside *Local abelian-variety duality and gerbe evaluation*
  (Milne ADT I, Lemma 3.1, Theorem 3.2, Corollary 3.4).
- **Prescribed local field construction**: the approximation and avoidance input is stated inside
  *Totally real local base change with avoidance* (weak approximation with Krasner's lemma and an
  auxiliary place), as in Boxer–Calegari–Gee–Newton–Thorne Lemma 5.3.3.
- Remarks in the plan that higher roadmaps (GlobalGaloisDeformations,
  DeformationAndDerivedPatchingAlgebra, LocalGaloisDeformationRings, potential modularity,
  NoncommutativeAndEquivariantIwasawa) consume or bind targets were removed; those roadmaps import
  from here.

## Overlaps with existing work (cited, not restated)

- **InverseGaloisAndArithmeticFundamentalGroups IG.4.2** (tier 6, package PR #9288 open): its
  finite Galois localisation kernels, finite-coefficient Poitou–Tate consequences over `G_K` and
  the order-two Grunwald–Wang alternative are cited in *Scope and ownership* and in the *Needs:* of
  *Absolute and relative locally trivial groups*, *All-place Sha duality and transfer adjunction*
  and *Grunwald–Wang with its exact dyadic obstruction*. The targets here are kept as variants: over
  `G_{K,S}` and global fields of both characteristics, with transfer adjunction, and with the exact
  dyadic obstruction. The plan's note asking InverseGalois to import Grunwald–Wang from here is not
  possible under the tier order (IG is lower); the maintainer may want to reconcile.
- Tau Ceti library: `TauCeti.traceBilinForm`, `traceBilinForm_nondegenerate`, `TauCeti.slIdeal`
  (pin) are used for D8's trace duality instead of a new trace pairing; current Tau Ceti (a91d3aaf,
  not at the pin) has Sylow detection for group cohomology
  (`TauCeti.groupCohomology.isZero_of_isZero_sylow`), injective envelopes
  (`TauCeti.IsInjectiveEnvelope`, existence only for finite length), `IsAdicComplete.of_finite`, the
  modular Artin-induction ingredients and `homAction` moved to
  `Topology/Algebra/GroupAction/InternalHom/Basic.lean`; these are recorded as partial overlaps,
  no target was removed.
- No target of this roadmap is stated by a current TauCetiRoadmap roadmap; ClassFieldTheory
  explicitly leaves out Grunwald–Wang and function-field class field theory, ProfiniteCohomology
  leaves out Hochschild–Serre and non-discrete coefficients.

## Plan corrections made in the README (no packet changed)

Found by the adversarial pass while writing; each is a degenerate case or a hypothesis the plan
left implicit.

- R02.1 *Completed tensor products and finite reductions*: for finitely generated `T`, `M` over a
  complete Noetherian local ring the comparison `T ⊗ M → T ⊗̂ M` is always an isomorphism; the
  projective-`T` clause is stated for arbitrary complete `M`.
- R02.1 *Rationalisation of lattice cohomology*: "no nonzero divisible elements in `Hⁱ(G, T)`" is
  proved in the README when the groups `H^{i−1}(G, T/pⁿT)` are finite; the unrestricted form is
  stated as in the plan and attributed to Tate (Rubin, Appendix B, Proposition 2.4).
- R02.2 *Degeneration of the Hochschild–Serre spectral sequence*: the short exact sequences for
  `cd(G/H) ≤ 1` need torsion coefficients (`G = Ẑ`, `H = 1`, `A = ℤ` fails); the Examples
  rows/columns were swapped and are fixed; `n ≥ 1` added to the extended five-term sequence.
- R02.3 *The S-idele classes as a quotient of the idele classes*: the principal-ideal step uses the
  maximal unramified abelian `S`-split extension of `F′`; localisation is independent of the
  embedding up to the canonical identification; relative `Ш¹(K/F, M)` needs `G_K` acting trivially.
- R02.4 *Poitou–Tate*: topological types of the middle row are "discrete, locally compact,
  compact" in the order written (the plan copied Milne's snake order). *Ext into the S-units and
  the S-ideles*: `Hom_{G_S}(M, J_S)` is a restricted product. *Cohomological dimension*:
  `Hʳ(G_S, ℤ/2) ≅ (ℤ/2)^{r₁}` only for `r ≥ 3`. *Pʳ_S self-duality*: `r ∈ {0, 1, 2}`. *Global
  Euler characteristic*: the product identity `χ(M)χ(M^D) = ∏ χ(K_v, M)` uses Tate groups at the
  archimedean places (Milne I, Remark 5.2(a), p. 67, prints `H⁰(G_v, M)`; checked on the rendered
  page). *Roots after prescribed totally real base change*: Brauer injectivity kills the obstruction
  only for `m = 2`. *Character roots*: `F` a number field.
- D7 *Duality when p = 2 and K has real places*: the pairings take values in `ℚ/ℤ` with
  `M^D = Hom(M, E_S)`; *Derived tensor*: Tor vanishing is sufficient (not necessary) for the
  underived comparison; Nekovář's `ω• = ω[−d]` is kept apart from the normalised `ω`.
- D8: the fixed-determinant tangent space is `H¹(G, ad⁰)/δ(H⁰(G, k))`; the Tor-vanishing
  condition for Selmer coefficient change is explicit.
- R02.5: the Selmer complex comparison is stated with its `H⁰` cokernel; the relaxed prime `q` in
  *Changing one local condition* has explicit hypotheses; the rank-one value is `−r₂` when
  `ζ_p ∈ F`.
- R02.6: division by `2` only where the characteristic is not `2`.

## Points for the package review

- NSW page numbers in R02.3.2 were read from the page headers of the electronic edition 2.3
  (the offset between PDF and printed pages changes from 21 to 22 inside Chapter VIII).
- *Chebotarev density for global function fields* cites NSW (9.1.3), which states the theorem for
  global fields and refers to the literature for the proof; the proof sketch is a plan, not a
  source summary.
- The S-unit rank for function fields is not used; only finiteness of `Cl_S(F)` for nonempty `S`
  (AlgebraicCurves Layer 5 plus NSW VIII §3, p. 452).
- *Totally real local base change with avoidance*: the proof sketch spells out the field
  construction (weak approximation and Krasner's lemma for the local extensions, an auxiliary
  prime with transposition inertia and `S_n` Galois group for linear disjointness). The last part
  is a standard completion of the argument cited to Boxer–Calegari–Gee–Newton–Thorne Lemma 5.3.3,
  not read off that source.
- *Inflation–restriction for compact and rational coefficients* (ii): the limit argument needs a
  sentence on `(T/pᵐT)^H` versus `T^H/pᵐ`; the statement follows Rubin B.2.5.
- *H¹(SL₂(F), End⁰) vanishes*: the Check `H¹(SL₂(𝔽₅), End⁰) ≠ 0` is the standard exception, not
  re-checked in Darmon–Diamond–Taylor.
- Locators: 57 Milne and Neukirch–Schmidt–Wingberg locators were compared with the PDFs (theorem
  number on the cited printed page); all agree. Other sources were not reopened.
- Remaining plan-level source gap: the lower bound in *The antiunit class-field rank* rests on
  Maire, *Sur la dimension cohomologique des pro-p-extensions des corps de nombres*, JNT 95 (2002),
  Proposition 19, and its 2003 addendum, which were not read.
