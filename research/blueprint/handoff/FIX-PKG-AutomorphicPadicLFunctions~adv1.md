# FIX-PKG-AutomorphicPadicLFunctions~adv1 — checkpoint

Issue #11469; Codex, session `codex-mZpMHc`; 20 October 2026.
Verdict: **needs_changes**. This is a checkpoint, not a completed fix or an
independent review. The claim bot confirmed this session's claim in
issue comment 6296623550. No second issue was claimed.

The blocker is mathematical and contractual: no verified argument found in
the inspected sources proves both full cofinite targets, and the integral
EHLS/Katz comparison still lacks its local and period-lattice computations.
The required lower-owner incorporations also lie outside this issue's four
permitted deliverables. The strong targets remain intact; no weaker theorem
is presented as their replacement. The new self-dual result below reduces
part of the source gap but does not justify accepting the package.

## Finding → change

| Finding in the adversarial review | Change and disposition |
| --- | --- |
| General automorphic rank-one cofiniteness, README 3h.7 | Preserved `hsieh_centralValues_cofinite_rankOne` with its full totally real, conductor, local-defect and residual-irreducibility hypotheses. Rechecked Hsieh Theorem 7.1, p. 759, and its use of old Hida on p. 760 against Hida's 2025 correction. The newly inspected independent theorem applies to CM-induced representations; restriction to G_M is reducible, so it cannot discharge this target's absolutely irreducible residual case. **Unresolved.** |
| Hecke rank-one cofiniteness, README 3h.8 | Added 3h.8a with Burungale–He–Tian–Ye (BHTY) version 2, Theorem 5.7, pp. 37–38: cofinite exact valuations for self-dual characters over general CM fields. Its two primes, L(1) convention, CM/Gauss normalization, root-sign subset and exceptional-prime conditions are explicit. The bridge to the earlier L(0,χ) normalization and the non-residually-self-dual cofinite branch remain separate. `HeckeValues_cofinite_rankOne` was retained. **Partially advanced, unresolved.** |
| Integral n=1 EHLS/Katz comparison, README 5.2 | Replaced the single general instruction with named ray-map, character-shift, local-section, period-lattice and comparison-ideal targets. Identified the actual EHLS ray group and the two integral Serre-pairing lines, including the congruence generator and the CM-period change in a Hecke twist. The unknown character/local/CM-lattice dictionary remains explicit. **Partially specified, unresolved.** |
| Lower-owner closure | Distinguished ALS's already planned general cochains and comparison maps from the additional BSW coefficient/Weyl/rational-period compatibility. Added `bswESHComparison` and its exact API, neat descent and negative controls. Rechecked PadicFamilies 5.10: its odd-p, totally odd parallel-weight coefficient family is not the full DR/Katz construction. The incorporation requests below are for the maintainer; neither lower owner was edited. **Unresolved.** |
| Additional error found in 3h.8 | Corrected Hsieh Theorem B's hypothesis from ordinary non-self-duality to **non-residual self-duality**, with the restricted-avatar condition and reciprocity conversion. Added a p-power-character negative control. **Fixed.** |
| Suggested Lean coverage | Added `selfDualHeckeAlgebraicValue` to the closing heavy-definition list. The new CM special value cannot be stated on the pinned carriers; no invented substitute or sorry'd carrier was introduced. The nine existing definitions, eighteen proved examples and theorem signatures are unchanged. **Checked.** |

Previously corrected avatar signs, classical/overconvergent level distinctions,
Hilbert cusp signs, weight/critical-index tests, normal-closure coefficient
fields, dyadic ray components, corrected Hida density, both Katz chambers,
EHLS compatible arithmetic pairs, EW hypotheses and the typed anticyclotomic
quotient are preserved. There are no edits to packets, metadata, reader
documents, other packages or the earlier review report.

## Independent source result and its limits

BHTY uses ℓ for the valuation prime and 𝔭|p for the tower prime; README
3h.8a reverses those roles explicitly to match this package. Its Theorem 5.7
is stronger at valuation prime 3 than introductory Theorem 1.4: root sign
+1 permits 3, while the root-sign −1 case excludes it. Valuation prime 2
is excluded. The theorem does not impose blanket oddness on the tower
prime. The tower prime has local degree one and avoids the valuation prime
and the nonsplit conductor part. Its conclusion is cofinite in Ξ⁺, the
root-sign +1 characters, not automatically in all of Ξ.

The normalization is equation (1.2), p. 3, including the unit index, selected
valuation-prime Gauss factors, gamma factors and a CM differential integral
and nonvanishing at that prime. The proof's period valuation comes from
Theorem 5.6, pp. 36–37; that theorem has a factor **2** multiplying the
local-defect sum for the squared period ratio. Theorem 5.7's proof recalls
the period relation without displaying that 2; follow the stated Theorem
5.6 when working through Proposition 5.5's two-factor argument. No source
passage is reproduced here.

The nonvanishing step uses the definite quaternionic CM test vector,
non-Eisenstein norm component and finite-field CM-translate independence
of Proposition 4.5, pp. 22–23, with Theorem 4.1 and Lemma 4.2, p. 21.
This is independent of the withdrawn Hida cofinite implication. The period
argument uses infinite nonvanishing at auxiliary primes; the final cofinite
conclusion at the chosen tower prime comes from the Shimura-set argument.
It must not be replaced by an intersection argument for two arbitrary
infinite or dense subsets.

The remaining normalization bridge is named
`selfDualHeckeValue_functionalEquationComparison`: take λ=χ⁻¹ and invert
the finite-order twist, then compare completed functional equations,
Gauss/conductor multipliers and both CM-period powers. Complex nonvanishing
alone does not identify their p-adic valuations. BHTY's result concerns
CM-induced GL₂ representations; it does not prove the general π target.

Wei He's version 2, Theorem 1.5, pp. 2–3, asserts density, despite the
stronger cofinite formulation of its conjectural problem; §1.4, p. 4,
distinguishes the latter. BHTY Theorem 6.1, p. 38, supplies infinite
nonvanishing in the non-residually-self-dual case, and Theorem 6.2,
pp. 38–39, combines it with the self-dual cofinite theorem. Neither proves
cofiniteness in that non-residually-self-dual branch.

The Castella–Liu–Wan addendum, Theorems 1.0.1–1.0.2, p. 1, explicitly
uses weakened infinite nonvanishing for imaginary quadratic fields; its
pp. 2–5 repair a downstream argument with two auxiliary families. This is
evidence about the source gap, not a new prerequisite or an upward citation.
Hung's 2017 paper was identified, but its full text was not verified; no
claim from it is used. Do not treat the bibliographic lead as a checked
replacement with matching hypotheses.

## Lower-owner incorporation requests

**PadicFamilies, Layer 5.** Incorporate the twenty old Layer 3 construction
nodes below, using the exact signatures, APIs, Checks and source locators
already written in this package's supplier contracts. The rational DR
normalization comparison remains in this package. These are existing
ownership requirements under the upstream order, not twenty new discoveries.
The table gives the node suffix after `AutomorphicPadicLFunctions:L3/` and
the required contract, so a subsequent worker need not rediscover the move.

| Existing node suffix | Required lower-owner contract |
| --- | --- |
| `partial-zeta-distributions` | `partialZetaDistribution`, rational moments, finite-level and smoothing identities |
| `hilbert-cusp-combinatorics` | `hilbertCuspData`, normalized coefficients and odd-weight cusp sign transport |
| `hilbert-eisenstein-series` | `hilbertEisensteinSeries`, full coefficients and parity-compatible weights |
| `eisenstein-constant-terms` | `E_constantTerm_at_cusp`, both allowed contributions and zero/ramified cases |
| `siegel-klingen-rationality` | Rationality used by `partialZetaDistribution` and the Eisenstein coefficients |
| `padic-hilbert-modular-forms` | `PadicHilbertForm`, geometric ordinary tower, weight action and all q-expansions |
| `igusa-irreducibility` | `ordinaryHilbertIgusaTower`, componentwise irreducibility and finite-field input |
| `padic-q-expansion-principle` | `padicHilbert_qExpansion_integral`, `padicHilbert_constantDifference_integral` |
| `deligne-ribet-measure` | `deligneRibetMeasure`, Kummer congruences, full compactified-ideal-space dyadic refinement |
| `deligne-ribet-pseudomeasure` | `deligneRibetPseudomeasure`, norm twist, cocycle and admissible localization |
| `cm-type-p-ordinary` | `ordinaryCMType`, splitting, polarization and conjugation data |
| `cm-points-and-canonical-trivialisations` | `ordinaryCMPoint`, algebraic model, reciprocity and ordinary trivialization |
| `cm-periods` | `cmPeriodData`, common differential and weight-dependent scaling |
| `katz-differential-operators` | `katzDifferentialOperator`, unit-root splitting, q-derivative and iteration |
| `katz-cm-algebraicity` | Algebraic/p-adic comparison of ordinary CM evaluations |
| `katz-eisenstein-measure` | `katzEisensteinMeasure`, completed unit quotient and weighted-inversion convention |
| `katz-padic-l-function` | CM evaluation measure, full local factors and first critical chamber |
| `katz-functional-equation` | `katz_functionalEquation` and `katz_interpolation_otherChamber` |
| `katz-hida-tilouine-tame` | `katzHidaTilouineMeasure`, primitive/tame interpolation and functional equation |
| `group-ring-eisenstein-families` | `groupRingEisensteinFamily`, coefficientwise integral descent and ordinary corrections |

In particular include `ordinaryDeligneModule q` and Deligne's finite-field
equivalence, not just Serre–Tate deformation: q=p^a with a≥1, finite free
T, integral commuting F,V with FV=q, rational semisimplicity and Weil
absolute values, and the ordinary equal-rank p-adic split. Keep the q=2
ordinary/supersingular and zero-rank controls. Coordinate the general
ordinary abelian input with AbelianSchemesAndArithmeticModuli Layer 4.
The dyadic theorem also needs the compactified ideal space I, its boundary
G₁, the mod-2 parity defect and the exceptional-field Artin criterion.
PadicFamilies 5.10's coefficient-family definition neither constructs these
objects nor covers the base theorem's p=2 range. Do not add an upward
PadicFamilies dependency on AutomorphicPadicLFunctions.

**ArithmeticLocallySymmetricSpaces.** Incorporate `bswESHComparison`
and the four compatibility targets now specified in this package's first
supplier subsection. Reuse ALS.1.2–ALS.1.4, ALS.3.5, ALS.5b.1–ALS.5b.2
and ALS.5b.5; do not replan generic singular cochains or de Rham comparison.
The additional content is BSW's coefficient dual, α, bottom-degree cuspidal
compact-support class, real Weyl projections and rational sign-period
normalization, compatible with those cochains and finite-level descent.
No generic inverse to the forget-supports map or integral unit-period
comparison is requested.

**Arithmetic equidistribution input.** The new self-dual proof route also
needs BHTY Theorem 4.1's arithmetic CM-orbit equidistribution, including
its norm-fibre and separated-translate conditions. The consumer-side
targets `cmShimuraSet_nonEisenstein` and `cmShimuraSet_toricCofinite` are
named in 3h.8a. No corresponding Ratner/homogeneous-dynamics supplier
was found in the checked library/roadmaps or existing package search.
The maintainer must assign the general theorem to an earlier supplier or
commission that missing direction; the source-specific Shimura-set
application stays here. Ordinary Igusa-tower density does not supply it.
This additional dependency is explicit, rather than treated as already
available. No new roadmap or packet was written outside the allowed files.

## Adversarial pass on every touched statement

Heavy arithmetic and geometric carriers are unavailable at the pins. Their
Checks therefore remain on their actual mathematical objects in the README;
none was replaced by a scalar encoding in Lean. The Lean declarations and
eighteen proved examples from the prior review are unchanged and were
re-elaborated. The following rows cover the new/revised assertions and APIs.

| Statement / interface | Instances tried and calculation | Result / change |
| --- | --- | --- |
| ALS imported cochain/comparison contracts | Neat level, compact space, noncompact modular component, zero finite-projective coefficient module; all degrees | Reuse general ALS targets. Compact support is retained, including noncompact spaces; zero coefficients give zero complexes. |
| `bswESHComparison`, `_hecke`, `_coefficients` | F=Q, k=0, q=1; imaginary quadratic F, q=1; dual versus primal coefficients | Target uses L₁(V_λ*) then α to L₂(V_λ*), with actual Hecke operators. No new generic cochain carrier. |
| `bswESHComparison_weyl` | r₁=1 versus r₁=0 | Two real sign projections versus the trivial real Weyl group. The action is on the resulting cohomology class; no unspecified action on a holomorphic source is invented. |
| `bswESHComparison_period` | One period Ω changed to aΩ, a≠0; a=ϖ over a DVR; Ω=0 | Rational class scales by a⁻¹. Zero periods are excluded; a nonunit remains possible rationally, so no integral unit claim. |
| BSW arbitrary-level descent | Neat refinement quotient of order divisible by p; characteristic zero versus residue F₂ | Exact invariants valid over characteristic zero; integral exactness is not claimed. General classical levels preserved. |
| `hsieh_HeckeValues_dense` | Exact self-dual character twisted by norm pullback of order-five mod-11 character, p=5 | On rational ideles the twist is the square of an order-five character and is nontrivial; modulo p it is trivial. Corrected missing non-residual-self-duality hypothesis. |
| Residual condition and reciprocity | Restriction agreeing everywhere versus disagreeing at one base idele; invert both source characters | Disagreement tests the restricted avatar. Inversion preserves equality/inequality; do not invert only one side. |
| Hecke root-sign and cofinite boundary | Self-dual sign −1; infinite bad conductor set with no arithmetic progression | Central value zero on the first component. Density does not imply finiteness of the bad set. Full cofinite target retained. |
| Self-dual datum in 3h.8a | κ=0,1; negative κ; p ordinary split versus inert; trivial twist ν=1 | Gamma arguments 1,2 are positive; negative κ and nonordinary type excluded. ν=1 need not be a good specialization. |
| `selfDualHeckeAlgebraicValue`, `_algebraic` | CM degree 2 and larger; period differential zero; coefficient field versus integral valuation ring | Transport only the algebraic normalized value through embeddings. Zero periods excluded. No equality of C and C_p or characteristic-p interpolation. |
| `selfDualHeckeAlgebraicValue_periodChange` | κ=0,1, differential changed by p-unit a | Period exponents 1,3 give a⁻¹,a⁻³. No weight-independent scalar across the family. |
| `selfDualHeckeAlgebraicValue_gauss` | e=0,1,2 and fixed additive conductor | Unramified factor 1; ramified arguments ϖ⁻¹,ϖ⁻² and multipliers |ϖ|,|ϖ|². Positive conductor idele not substituted. |
| `selfDualHeckeValues_cofinite_rankOne` | Empty inert-prime set, zero defects, positive defect sum, zero special value | Empty/zero sum gives valuation 0; positive sum gives that positive valuation, not a unit. Zero value has ∞ valuation and cannot satisfy a finite equality. |
| Prime and level range | Valuation p=2, p=3 with ε=±1; tower ℓ=2; local degree >1; split conductor prime | Exclude valuation 2; allow 3 only on root+ branch. No extra tower oddness or squarefree conductor condition. Degree one and minus-conductor exclusion remain mandatory. |
| Root-sign character subset | Split tower prime, ε(λ)=+1; inert tower prime with alternating conductor parity | Ξ⁺ cofinite in Ξ in split case; retain Ξ⁺ in inert case. The theorem is not asserted for all twists on a negative-sign parity. |
| Toric and CM-period proof inputs | Constant function; wrong norm component; primitive vector multiplied by ϖ; squared-period valuation | Non-Eisenstein/component/primitive conditions essential. Keep factor 2 in Theorem 5.6; arbitrary integral rescaling does not preserve normalization. |
| CM versus general π | Restrict an induced 2-dimensional Galois representation to G_M | Two characters appear, so absolute residual irreducibility fails. New theorem does not close 3h.7. |
| `selfDualHeckeValue_functionalEquationComparison` | χ↦χ⁻¹, ν↦ν⁻¹; nonzero complex value but period quotient of positive valuation | Functional-equation bridge named and left unresolved. Complex nonvanishing is insufficient for a unit-valued comparison. |
| Non-self-dual source boundary | Wei He Theorem 1.5; BHTY Theorems 6.1–6.2 | Density/infinite conclusions inspected directly. No cofinite strengthening asserted. |
| `unitaryRankOne_rayMap` | C=1; C enlarged; trivial character; finite torsion component; dyadic sign component | Full ray group kept. Construct at the chosen common tame level or use pushforwards; no canonical measure lift to a finer ray group. |
| GU(1) versus ray group | F real quadratic, locally attained norm tuples (2,3) versus (2,2) | Only the latter satisfies a common rational multiplier. No torus/ray-group identification from notation. |
| `unitaryRankOne_characterShift` | m=0,1; conjugate CM type; both Katz chambers | Equality of local Euler and archimedean factors is required at each shift; no unverified norm-twist formula inserted. Obligation remains open. |
| `unitaryRankOne_localSections` | Unramified place, tame bad place, p-place, local Euler value zero | All source sections, volumes and partial Fourier factors retained. No cancellation at zero and no correction defined by a quotient of global values. Computations remain open. |
| `unitaryRankOne_periodLattice` | Eigen/eigen versus eigen/localized pairing, nonunit congruence c; Hecke-character twist | Preserve both integral lines and Q[π,χ]=cQ_{π,χ}; twisted rational structure requires its CM period. No automatic c∈O×. |
| `unitaryRankOne_comparisonIdeal` | O versus O; O versus ϖO; fraction field versus DVR; ramified O; zero Euler factor | Relative ideals O and (ϖ) differ integrally but not after tensoring with the field. Family specialization compatibility required. Zero Euler factors excluded from ratios. |
| `unitaryRankOne_KatzComparison` / uniqueness | Zero measure, zero moment, agreeing few moments versus determining tests; field-valued versus lattice-valued equality | No unit from 0/0 and no integral equality from complex values. Apply bounded-measure uniqueness only after the entire dictionary. |
| Suggested.lean closing list | New special-value carrier absent; all existing declaration signatures unchanged | Added only the heavy name. Elaboration succeeded with the same two intended sorry warnings. |

The analytic claims retain their number-field/characteristic-zero and compact
group hypotheses. Zero coefficient modules, the unit ideal and trivial
characters cause no added nonvanishing assertion. Equal-characteristic
DVRs and noncompact character groups are not within the interpolation
statements. The full dyadic DR contract was neither removed nor weakened
by the separate odd-valuation-prime self-dual theorem.

## Library and upstream overlap audit

Read the reviewed coverage for all eight main-packet layers. Current-upstream
inspection was read-only at TauCetiRoadmap
`0d144d044dacebca17b654695b6f1ad58f159b27`, Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` and Mathlib
`6b7abb3c7686292736be2955bd3eb9ebf63b456a`. Current GlobalNumberFields
and ProfiniteArithmetic were read as the two upstream models, with the
PadicMeasuresIwasawaAlgebras exemplar for package form.

Object searches checked toric periods, CM periods, ordinary/Igusa data,
integral eigenlattices, Serre pairings, ray class groups and arithmetic
equidistribution, including the nine post-snapshot roadmaps and Completed
ContourIntegration, EffectiveBounds, OrthogonalL2Bases and RestrictedProducts.
No new source-specific CM valuation theorem, BSW rational eigenclass
comparison or integral EHLS/Katz dictionary was found. Generic topology,
bundles, lattices and local/global representation objects remain imported.
There is no new duplicated construction to delete. No upstream library or
roadmap file was edited and no Lake command was run there.

The separate elaboration pins remain Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Read the pinned declarations
`classMap_surjective` and `riemannZeta_zero` used by the unchanged Lean
file; the former transitions from a larger modulus to a divisor, and the
latter gives ζ(0)=−1/2. The current general Hecke-character API is not
mistaken for a declaration available at the older pin.

## Validation

- `free -g` reported 80 GB available before the compile, above the 20 GB
  minimum. One `lean-check` was run, with no language server or Lake build.
- `lean-check research/blueprint/packages/AutomorphicPadicLFunctions/Suggested.lean`
  exited 0. Its only warnings are the two existing `sorry` bodies, at
  lines 40 and 186. The file has 241 lines, nine real-bodied definitions,
  three theorems and eighteen proved examples.
- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicPadicLFunctions.json`
  reported zero errors and zero warnings. The 105-node packet is unchanged;
  this check does not certify the new mathematics or close its recorded gaps.
- `python3 research/blueprint/intake.py check-files` on the four job files
  reported `4 file(s), 0 problem(s)`.
- `git diff --check` passed. Only the four permitted deliverables changed.

## Public-source provenance

The following primary/journal/author PDF bytes were inspected on
2026-10-20. Files and extracted text remained in disposable scratch and
are not submitted. No cleared private book was needed, no source passage
was copied into the repository, and no suspicious instruction was found in
untrusted material. No source-supplied command was executed.

| Source | SHA-256 |
| --- | --- |
| [Hida 2025 correction](https://www.math.ucla.edu/~hida/EllrevF.pdf) | `a41b6e91efff93dd7e21c774fb790efa19ca88db1667df291d463c0111f73980` |
| [Hsieh 2014](https://emis.muni.cz/journals/DMJDMV/vol-19/24.pdf) | `a662df673725f6abbdb5b3ee272e78973c125cbc5d6fd0ba9307c790e8070718` |
| [Hsieh nonvanishing, version 1](https://arxiv.org/pdf/1208.4751v1) | `330cbaa073b6998f51647f34eff43b2c4d8293abaf236296477cc1953a9156c5` |
| [BHTY, version 2, 13 March 2026](https://arxiv.org/pdf/2508.19706v2) | `ae96c6cf8703b814488fd822f6d55111f6d251030cbd4c0dd5ec62395b62aeea` |
| [Wei He, version 2](https://arxiv.org/pdf/2308.15051v2) | `c90cfc13af00798fe744d251cdff8380b51e7f268737e69e7baf17e7b1cfdcf6` |
| [Castella–Liu–Wan addendum](https://web.math.ucsb.edu/~castella/CLW-addendum.pdf) | `c008624ff05f61c3780f02aaddf1188f4a68ec01cfffb9f1e63bd4d994820fd9` |
| [EHLS, version 5](https://arxiv.org/pdf/1602.01776v5) | `881a496afe0a7f4707fed614a969af481ed737ae1174db1995be3164a90b9569` |
| [BSW, version 3](https://arxiv.org/pdf/1602.06244v3) | `4209161c0b5f139372833fd873cbaf2b99fcef3e6edef3ec50ba3869096d8d5f` |

## Where to resume

Start with README 3h.8a and 5.2. Verify the new source result and derive the
L(0)/L(1) integral bridge before counting any part of the old Hecke target
as closed. Find an independent argument matching the general π target and
the non-residually-self-dual cofinite branch; do not recycle density or a
Q-only theorem. Finish the EHLS rank-one character/local/period dictionary,
with an actual fractional ideal and family specialization theorem. Arrange
the lower-owner incorporations and the arithmetic-equidistribution supplier
through the maintainer. Acceptance still requires all of these; compilation
does not discharge any of them. All information needed to resume is in this
handoff and the four deliverables, not disposable scratch.
