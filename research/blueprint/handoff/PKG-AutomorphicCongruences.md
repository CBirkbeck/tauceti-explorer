# PKG-AutomorphicCongruences — package handoff

Completed package for #10758 by Codex (GPT-6), session `codex-5MsNSf`, 2026-10-20. Branch: `codex-5MsNSf-automorphic-congruences`. Claim confirmed by the claim bot in [comment 6281247774](https://github.com/CBirkbeck/tauceti-explorer/issues/10758#issuecomment-6281247774). This run claims no other job.

## Deliverables and result

- [README](../packages/AutomorphicCongruences/README.md): all 92 accepted targets in ten layers, all 130 API items for 18 definitions/constructions, every input test and acceptance check, ten worked-example sections and exact supplier contracts. The README contains mathematical prose, not the packet catalogue or programme history.
- [Suggested.lean](../packages/AutomorphicCongruences/Suggested.lean): two real-bodied generic Eisenstein-ideal definitions; the quotient-presentation and finite-family factor-separation milestones; four proved examples. Arithmetic carriers absent at the pins remain README targets. No data is admitted and no theory is developed in this file.
- [metadata.toml](../packages/AutomorphicCongruences/metadata.toml): `topic = "math.NT"`.

This is a completed packaging job, not a claim that the arithmetic is formalised or that all suppliers are implemented. The accepted inputs themselves have 26 gaps and 43 supplier requests. Their mathematical requirements are preserved and sharpened; outstanding source verification and supplier work are identified below for independent review. Neither input packet, assembled reader nor old suggested file was edited.

## Validation

- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicCongruences--L0.json`: 69 targets, 125 API items, 68 unit tests; zero errors and warnings.
- `python3 scripts/check_blueprint.py research/blueprint/packets/AutomorphicCongruences--L5b.json`: 23 targets, 5 API items, 4 unit tests; zero errors and warnings.
- Final `lean-check` on the package Suggested.lean: exit 0; only `declaration uses sorry` at lines 39 and 82. All four examples proved. Available memory immediately before compiling was 75 GiB. No Lake project/build/cache operation or language server was started.
- Mechanical package audit: 92 unique target anchors, 549 internal target links and no broken target links; 130 API entries; all 18 defining targets have at least three discriminating checks; ten layers, ten Examples sections and ten Dependencies sections. All internal target prerequisites run forward in the displayed order, with no internal cycle.
- `git diff --check`: passed. `python3 research/blueprint/intake.py check-files` on all four deliverables: four files, zero problems.

## Existing work and pins

Library signatures were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The readonly current roadmaps checkout was `0d144d044dacebca17b654695b6f1ad58f159b27`; current Tau Ceti was `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The current DifferentialGeometry and ProfiniteArithmetic READMEs were read in full as models. The nine roadmaps newer than the atlas snapshot and the four named Completed roadmaps were screened against these targets, as were IntegralHeckeAndGaloisDeterminants, EllipticCurves and ProfiniteCohomology. No existing roadmap was edited or replanned. The reviewed `data/library-coverage.json` was read.

The pinned signatures checked include:

| Library file | Declarations used |
| --- | --- |
| Mathlib/RingTheory/Length.lean | `Module.length` (extended natural-valued submodule-lattice length), finite-length and zero-module conventions |
| Mathlib/Algebra/Module/LocalizedModule/Basic.lean | `LocalizedModule` and its localization interface |
| Mathlib/RingTheory/Ideal/Span.lean | `Ideal.span`, `Ideal.span_singleton_mul_left_unit` |
| Mathlib/RingTheory/Ideal/Maps.lean | `Ideal.map`, `Ideal.comap`, `Ideal.mem_comap`, `Ideal.map_span`, `Ideal.map_mul`, `RingHom.ker` |
| Mathlib/RingTheory/DiscreteValuationRing/Basic.lean | `IsDiscreteValuationRing` |
| Mathlib/RingTheory/LocalRing/Defs.lean | `IsLocalRing` |
| Mathlib/Algebra/GroupWithZero/Basic.lean | `IsReduced` |
| Mathlib/RingTheory/RegularLocalRing/Defs.lean | `IsRegularLocalRing` |
| Mathlib/RingTheory/UniqueFactorizationDomain/Defs.lean | `UniqueFactorizationMonoid` |
| Mathlib/LinearAlgebra/Matrix/Charpoly/Basic.lean | `Matrix.charpoly`, using det(TI−M) |
| Mathlib/RingTheory/MvPowerSeries/Basic.lean | `MvPowerSeries` |
| TauCeti/RepresentationTheory/Homological/ContCohomology/LowDegree.lean | `TauCeti.ContCohomology.H1`, quotient of continuous cocycles by coboundaries |
| TauCeti/AlgebraicGeometry/EllipticCurve/QuadraticTwist.lean | `WeierstrassCurve.quadraticTwistPointEquiv_map_eq_quadraticCharacter_smul_map` |
| TauCeti/NumberTheory/Multiquadratic/MultiquadraticSplitting.lean | `NumberField.ncard_primesOver_multiquadratic_iff`, with its odd/unramified hypotheses |
| TauCeti/NumberTheory/Multiquadratic/Galois/Basic.lean | `TauCeti.Multiquadratic.isGalois`, with 2≠0 |

Current Tau Ceti also has Fitting ideals, completed group algebras, compact-module infrastructure and inertia. These remain imports. Its twist point equivalence is not silently identified with an integral Tate-lattice, ordinary-filtration or Selmer isomorphism. Current IHG Layer 6 is a rank-two/two-character theorem, including residual coincidence; it does not prove the polarized SU/Wan 1+n+1 result.

AutomorphicCongruences has no assigned entry in the checked CaraianiNewton tier list. I therefore make no assertion that all its suppliers are upstream or in lower tiers. The package is for independent atlas review; an upstream port still requires supplier/tier reconciliation. No higher-tier consumer is used as an arithmetic supplier.

## Corrections and ownership routing for the maintainer

The issue forbids changing the accepted packets. The following package corrections should be reconciled there and in consumers when approved:

1. Reordered the L0 local cocycle bridge before its Selmer-length application, with an assumed stable lattice rather than a circular dependence on the eventual length theorem. Moved exceptional-prime comparison before the L2 reverse bound and auxiliary-field selection before the seed theorems.
2. Removed ModularIwasawaMainConjectures consumer targets from prerequisite lists. The ordinary seed equality is assembled directly from the AC reverse bound, Kato L4 and the determinant criterion; it is not imported from its own downstream consumer. Universal-family restatement remains a downstream MIMC L4 reference.
3. Routed abelian/CM-character p-adic functions and Rankin/Katz comparisons from the stale APL L3 ownership to PadicFamilies L5. APL L3h retains nonvanishing and its specialized BDP comparison. The general BDP object is not imported from the later Gross–Zagier application.
4. Routed the Yager/unramified-by-cyclotomic exponential to PadicHodgeRegulators, Part II. GH.7 is a checkpoint, not that construction. The FW bounded-denominator application remains here.
5. Kept the source-specific polarized SU construction here; requested the general polarized extension from IntegralHeckeAndGaloisDeterminants, Part II, rather than enlarging or duplicating its existing rank-two theorem. Added explicit Hilbert period/local-condition adapters.
6. Strengthened auxiliary K selection by ramification at a new odd prime outside D_F. Its finite ramification in FK/F excludes the narrow Hilbert class field. The proof route uses independent local square classes/CRT, squarefree discriminants and finite residual-field avoidance. This is an added required proof, not an assertion that BCS Lemma 5.2.3 states the stronger selection. Independent review should check its simultaneous local/minimality conditions.
7. Clarified normal/Krull characteristic products as divisorial hulls; no normal branch is assumed factorial. Fixed-form restriction uses explicit power-series UFDs, nonzero majorant specialization and early Kato torsion/control inputs. Fitting ideals, determinant lines and characteristic divisors are distinguished.
8. Added componentwise nonvanishing to the generic zeta trivialization. Generic rank one and torsion H² alone do not exclude the zero map. At an Euler scalar 1−α=0 the determinant line exists but has no acyclic fractional trivialization.
9. New primary-source check: LLZ14 Lemma 6.8.9 excludes primes over p and assumes a tame conductor condition; Corollary 6.8.10 gives only a rational c-independent class. The integral CW Beilinson–Flach normalization requires a separate smoothing-unit or denominator/lattice proof at primes over p. The package states that obligation instead of using LLZ alone as an integral argument. KLZ reciprocity also retains its smoothing, Atkin–Lehner, sign and congruence-ideal factors until the CW comparison is proved.
10. New primary-source check: FW §6.2, Props 6.8–6.9 require a minimal lift/unchanged monodromy filtration and the common conductor exponent. The essential invariant line is not asserted at arbitrary level or through conductor drop; rank-one top derivative is insufficient.

## Source verification

Primary PDFs were read in scratch, never copied into deliverables. Main-source downloads matched the packet source hashes. Claims are paraphrased with numbered locators, not excerpts. SU uses the 226-page author manuscript, FW arXiv v3, Nakamura arXiv v2, CLW v1 plus the six-page addendum, and BCS v2 and published pagination separately. Wan-2015 inequalities at p=5 and weight 2 were checked visually in the PDF because text extraction loses the equality bars. No uncleared book was used; the cleared-library index was read.

Selected foundational checks included SU §§3–4 and its lattice, period and congruence statements; SU Theorem 7.3.1, p.104, interpolation and final divisibility statements; FW §§3.3–3.4, §§4.2, 4.6–4.8, §5 and Props 6.7–6.9; CLW pp.78–81 and its addendum; Nakamura type specialization pp.79–80; Fujiwara pp.95,97; Kato Theorem 17.4, pp.273–274; and the Wan/BCS exceptional and fixed-form comparisons. These are selected statements/proof passages, not a claim to have read every proof in those papers.

An additional reproducible 15-target sample (seed 10758) was checked directly:

| Target | Source passage read |
| --- | --- |
| L5w.10 family divisibility | Wan-2015 Thms 3 and 101, pp.3–4,88–89; p≥5 and κ₀≥2 visually confirmed |
| L0.2 primitive comparison | SU Lemmas 3.2.16–17 and Prop.3.2.18, pp.26–27 |
| L3.8 classical specialization | Nakamura v2 Thm4.3 and Remark4.4, p.66, with type comparisons pp.79–80 |
| L2s.3 Klingen families | CLW pp.31,44,46 and the addendum's revised two-family construction |
| L0.9 CM integrality | CLW p.81; this verifies the invocation, not the original HT hypotheses |
| L1.5 SU function | SU pp.199,202 and the stated interpolation/μ inputs |
| L5b.5 four-factor bound | BCS published pp.11–12 |
| L2s.7 localized divisibility | CLW pp.78,81 and addendum p.6 |
| L1.7 coefficient coprimality | SU p.217 |
| L1.10 two-variable theorem | SU pp.41–42 |
| L5w.9 exceptional primes | Wan-2015 Lemma87, p.71, and Thm101 proof p.89 |
| L5 aggregate | BCS v2 pp.2,10 |
| L3.10 generalized conjecture | FW pp.34,36 |
| L2.7 BF construction | CW Thm3.6, p.15, then original KLZ/LLZ passages below |
| L1.2 ordinary control | SU pp.91,95 |

The original KLZ17 statements were additionally read in the publisher PDF: Notation7.7.1 and Thm7.7.2 (p.71), Definition8.1.1 (p.72), Proposition8.1.7 (p.75), Theorem10.2.2 (p.94). LLZ14 Lemma6.8.9 and Corollary6.8.10 were read at printed p.736. The primary-source references are added to the package. This resolves the literal unread-statement part of `klz-not-read`, not the entire motivic construction or integral smoothing comparison.

Unverified original locators are explicitly retained as supplier obligations: the HT93/HT94/Hid06 and Hid91 comparison chain invoked at CLW p.81; Harris (1984) Theorem2.5.6 as invoked by SU/CLW; Vatsal's original μ proof; the original Ikeda/Ichino local formula proofs; Paškūnas–Tung's original p=3 extension; the original Betina–Williams equal-Satake comparison and Pottharst analytic-complex results. Other source locators not in the checked passages above remain inherited locators and should be sampled by the independent reviewer; they have not all been reverified in their original papers.

## Remaining supplier and proof obligations

These are mathematical prerequisites of the roadmap targets, not tasks claimed by this worker. In particular, no full endpoint is represented as a theorem already implemented by the cited generic roadmap.

| Input gap | Package treatment / what still requires proof |
| --- | --- |
| fw-4-8-sketch | L2.13 states the ordinary transfer, twist separation and integral p-power descent explicitly; the source's sketch is not a completed proof. |
| ichino-triple-product | AL.3 needs the precise definite-unitary/quaternionic local formula, not only split GL₂. |
| harris-cap | AutomorphicSpectralTheory Part II must supply the exact sufficiently regular holomorphic CAP exclusion after GL₂ modularity. Original theorem unverified. |
| klz-not-read | Numbered original statements now read; norm-compatible motivic construction, normalization and integral smoothing comparison remain required. |
| hida-tilouine-not-read | Exact integral CM-theta congruence/Katz and Rankin denominator comparison remains unverified; L0.9 is a conditional comparison target. |
| ordinary-bstw-owner | KatoEulerSystems L5 needs the ordinary two-variable zeta element, both reciprocity laws and four-term duality sequences; one-variable L4 is insufficient. |
| su-proofs-cited | All SU targets and numbered locators retained. Not every proof in §§5–6,9–11,13 has been read. |
| fw-crystalline-proofs | Exact analytic finite-slope Selmer-complex base change and equal-Satake Bianchi-family comparison are requested, with correction terms. |
| nakamura-proofs | BM co-Whittaker factor distinguished from its smooth dual; type coinvariants retained; minimal-lift essential-vector contract and separate p=3 refinement required. |
| vatsal-mu | Imported only through APL L3h with its actual hypotheses; original proof not reverified. |
| integral-period-dictionary | Saturated EPW-to-SU integral lattice map must be a unit comparison. |
| unitary-galois-adapter | Imaginary-quadratic SU Galois assembly/descent and ordinary local filtration are not supplied by a theorem restricted to larger CM fields. |
| hida-representation-conventions | Explicit dual, Tate twist, reciprocal Frobenius and integral ordinary-lattice dictionaries remain necessary. |
| general-weight-nonvanishing-repair | Scalar CLW repair does not prove the vector-valued/general-weight FW repair; two-family joint height-one avoidance and rational denominators retained. |
| unramified-regulator-supplier | Yager module and integral unramified-by-cyclotomic regulator belong to PadicHodgeRegulators Part II; AC proves its boundedness application. |
| kato-integral-quotient-witness | Produce τ with O-free rank-one quotient on the actual integral lattice; rational dimension one is insufficient. |
| auxiliary-field-narrow-delta | Added simultaneous new-ramification selection proof route; independent review must verify this strengthening. |
| Exact minimal theorem and period suppliers | R21.4/R04.6 and APL L3h need Fujiwara's exact minimal types/freeness and the matching quaternionic period instance. |
| Integral fixed-form analytic/control refinements | Wan82's integral imprimitive and fractional general-Σ domains kept distinct; primitive integral landing needs Euler/control maps. |
| Torsion and local convention bridge | Prove genuine finite torsion duals using early inputs and compare locally-trivial/inertia conditions; char=0 for non-torsion is not torsion. |
| Exact elliptic image refinement and CM upper bound | Kato supplier needs BCS (im), MSD/Néron normalization and a separate CM rational elliptic-unit route. |
| Full arithmetic Lean signatures | Heavy arithmetic carriers deliberately absent from Lean; all exact targets remain in README. |
| Normal coefficient-ring characteristic and faithful descent extensions | Require divisorial operations over normal branches, principal-majorant control and faithful extension/contraction; restriction-of-scalars norm is different. |
| Polarized rank-four extension and localized congruence model | IHG Part II plus exact source-localized intersection/quotient, saturation and length comparison; no inference from rank-two IHG.6. |
| Hilbert extensions of L0 period and Selmer interfaces | Hilbert integral pairings, local extension classes, primitive/inertia comparisons and nonzero specialization are explicit refinements, not automatic Q-case corollaries. |
| Totally real extension of L1 ordinary boundary sequence | Extend the all-cusp GU(2,2) boundary sequence and coefficient-change/cuspidal lift to F; import geometry rather than duplicate it. |

## Adversarial mathematical pass

| Layer | Failure cases checked and resulting safeguard |
| --- | --- |
| L0 | Zero lattice, rank zero, Σ containing p, unramified versus strict condition, ramified nonunit Euler factor, inverse Frobenius, noninjective coefficient kernel, normal versus UFD and exact SU polarized hypotheses. |
| L1 | Hida coefficient dimension versus fixed O, Eisenstein trace four versus GL₂ trace two, boundary versus cusp, canonical-period units and separate residual disjointness characters. |
| L2s | Supersingular GL₂ input with semi-ordinary unitary normalization; two rational families, joint height-one avoidance versus a global unit, and cyclotomic localization versus only p-inversion. |
| L2 | Correct valuation direction, exceptional pulled-back primes, nonunit Steinberg Euler factor, α_p≡±1 exclusion, BF local ordering/fractional targets, φ=1 exclusion, p-primary smoothing and integral Kato witness. |
| L3 | p=3 requires its own supplier extension; p=2 excluded; BM versus smooth dual, conductor jumps, scalar residual parity, zero generic zeta map, Euler scalar zero, determinant versus Fitting ideal. |
| L4 | Primal/dual inverse determinant, finite étale norm, ramified O length versus p-adic valuation, nonunit residual Euler factors, and all Tor/local corrections at ramified specialization. |
| L5w | p=5 and κ=2 included in Wan range; Fujiwara induced inertia type; narrow class field; rational projector denominators; localization before quotient surjectivity; split Hecke indices; characteristic zero convention versus torsion. |
| L5a | Simultaneous odd and 2-adic splitting; new finite ramification for narrow exclusion; nonzero principal specialization; μ=0 upgrades only the remaining vertical inequality; period scalar versus integral unit. |
| L5b | Integral twist and finite-level discrete Shapiro, local ordinary lines, τ squaring valid only for p odd, free versus merely rational rank-one quotient, all four individual bounds, nonzero factors, faithful coefficient descent. |
| L5 | Rational equality can hide a uniformizer defect; integral conclusion retains (im) and all four integral Kato bounds. |

## Target and API preservation index

The input identifiers occur only in this handoff. Sections below are the package's mathematical sections. `API` is the number of preserved named items, not a claim that they are Lean declarations.

| Input target (prefix AutomorphicCongruences:) | README section | API | Checks, including refinements |
| --- | --- | ---: | ---: |
| `L0/sigma-primitive-selmer` | [L0.1](../packages/AutomorphicCongruences/README.md#ac-l0-sigma-primitive-selmer) | 8 | 6 |
| `L0/primitive-imprimitive-comparison` | [L0.2](../packages/AutomorphicCongruences/README.md#ac-l0-primitive-imprimitive-comparison) | 0 | 2 |
| `L0/selmer-specialization-control` | [L0.3](../packages/AutomorphicCongruences/README.md#ac-l0-selmer-specialization-control) | 0 | 2 |
| `L0/eisenstein-ideal` | [L0.4](../packages/AutomorphicCongruences/README.md#ac-l0-eisenstein-ideal) | 7 | 5 |
| `L0/su-lattice-datum` | [L0.5](../packages/AutomorphicCongruences/README.md#ac-l0-su-lattice-datum) | 8 | 5 |
| `L0/extension-class-local-conditions` | [L0.6](../packages/AutomorphicCongruences/README.md#ac-l0-extension-class-local-conditions) | 0 | 1 |
| `L0/lattice-construction` | [L0.7](../packages/AutomorphicCongruences/README.md#ac-l0-lattice-construction) | 0 | 3 |
| `L0/canonical-period-congruence-number` | [L0.8](../packages/AutomorphicCongruences/README.md#ac-l0-canonical-period-congruence-number) | 0 | 1 |
| `L0/hida-tilouine-anticyclotomic` | [L0.9](../packages/AutomorphicCongruences/README.md#ac-l0-hida-tilouine-anticyclotomic) | 0 | 1 |
| `L1/gu22-ordinary-hermitian-forms` | [L1.1](../packages/AutomorphicCongruences/README.md#ac-l1-gu22-ordinary-hermitian-forms) | 7 | 5 |
| `L1/gu22-hida-control` | [L1.2](../packages/AutomorphicCongruences/README.md#ac-l1-gu22-hida-control) | 0 | 1 |
| `L1/eisenstein-datum` | [L1.3](../packages/AutomorphicCongruences/README.md#ac-l1-eisenstein-datum) | 8 | 5 |
| `L1/klingen-eisenstein-series` | [L1.4](../packages/AutomorphicCongruences/README.md#ac-l1-klingen-eisenstein-series) | 7 | 4 |
| `L1/su-padic-l-function` | [L1.5](../packages/AutomorphicCongruences/README.md#ac-l1-su-padic-l-function) | 0 | 2 |
| `L1/padic-eisenstein-family` | [L1.6](../packages/AutomorphicCongruences/README.md#ac-l1-padic-eisenstein-family) | 0 | 2 |
| `L1/nonsingular-coefficient-coprimality` | [L1.7](../packages/AutomorphicCongruences/README.md#ac-l1-nonsingular-coefficient-coprimality) | 0 | 1 |
| `L1/gu22-galois-pseudocharacter` | [L1.8](../packages/AutomorphicCongruences/README.md#ac-l1-gu22-galois-pseudocharacter) | 7 | 5 |
| `L1/su-selmer-lower-bound` | [L1.9](../packages/AutomorphicCongruences/README.md#ac-l1-su-selmer-lower-bound) | 0 | 1 |
| `L1/su-two-variable-theorem` | [L1.10](../packages/AutomorphicCongruences/README.md#ac-l1-su-two-variable-theorem) | 0 | 2 |
| `L1/su-cyclotomic-divisibility` | [L1.11](../packages/AutomorphicCongruences/README.md#ac-l1-su-cyclotomic-divisibility) | 0 | 1 |
| `L2s/semi-ordinary-weight-space` | [L2s.1](../packages/AutomorphicCongruences/README.md#ac-l2s-semi-ordinary-weight-space) | 7 | 5 |
| `L2s/semi-ordinary-hida-theory` | [L2s.2](../packages/AutomorphicCongruences/README.md#ac-l2s-semi-ordinary-hida-theory) | 0 | 1 |
| `L2s/semi-ordinary-klingen-family` | [L2s.3](../packages/AutomorphicCongruences/README.md#ac-l2s-semi-ordinary-klingen-family) | 7 | 5 |
| `L2s/fourier-jacobi-primitivity` | [L2s.4](../packages/AutomorphicCongruences/README.md#ac-l2s-fourier-jacobi-primitivity) | 0 | 1 |
| `L2s/clw-eisenstein-congruence` | [L2s.5](../packages/AutomorphicCongruences/README.md#ac-l2s-clw-eisenstein-congruence) | 0 | 1 |
| `L2s/cap-exclusion` | [L2s.6](../packages/AutomorphicCongruences/README.md#ac-l2s-cap-exclusion) | 0 | 1 |
| `L2s/clw-main-divisibility` | [L2s.7](../packages/AutomorphicCongruences/README.md#ac-l2s-clw-main-divisibility) | 0 | 2 |
| `L2s/clw-integrality-and-p-inverted` | [L2s.8](../packages/AutomorphicCongruences/README.md#ac-l2s-clw-integrality-and-p-inverted) | 0 | 1 |
| `L2/general-weight-semi-ordinary-control` | [L2.1](../packages/AutomorphicCongruences/README.md#ac-l2-general-weight-semi-ordinary-control) | 0 | 1 |
| `L2/vector-valued-klingen-family` | [L2.2](../packages/AutomorphicCongruences/README.md#ac-l2-vector-valued-klingen-family) | 0 | 1 |
| `L2/greenberg-function-factorization` | [L2.3](../packages/AutomorphicCongruences/README.md#ac-l2-greenberg-function-factorization) | 0 | 1 |
| `L2/fw-fourier-jacobi-unit` | [L2.4](../packages/AutomorphicCongruences/README.md#ac-l2-fw-fourier-jacobi-unit) | 0 | 1 |
| `L2/exceptional-height-one-primes` | [L2.5](../packages/AutomorphicCongruences/README.md#ac-l2-exceptional-height-one-primes) | 0 | 1 |
| `L2/fw-greenberg-divisibility` | [L2.6](../packages/AutomorphicCongruences/README.md#ac-l2-fw-greenberg-divisibility) | 0 | 1 |
| `L2/klz-beilinson-flach-classes` | [L2.7](../packages/AutomorphicCongruences/README.md#ac-l2-klz-beilinson-flach-classes) | 8 | 5 |
| `L2/bf-explicit-reciprocity` | [L2.8](../packages/AutomorphicCongruences/README.md#ac-l2-bf-explicit-reciprocity) | 0 | 1 |
| `L2/castella-wan-equivalence` | [L2.9](../packages/AutomorphicCongruences/README.md#ac-l2-castella-wan-equivalence) | 0 | 1 |
| `L2/auxiliary-field-selection` | [L2.10](../packages/AutomorphicCongruences/README.md#ac-l2-auxiliary-field-selection) | 0 | 1 |
| `L2/unramified-exponential-boundedness` | [L2.11](../packages/AutomorphicCongruences/README.md#ac-l2-unramified-exponential-boundedness) | 0 | 1 |
| `L2/fw-crystalline-main-conjecture` | [L2.12](../packages/AutomorphicCongruences/README.md#ac-l2-fw-crystalline-main-conjecture) | 0 | 1 |
| `L2/fw-ordinary-reverse-bound` | [L2.13](../packages/AutomorphicCongruences/README.md#ac-l2-fw-ordinary-reverse-bound) | 0 | 2 |
| `L2/wan-rankin-selberg-divisibility` | [L2.14](../packages/AutomorphicCongruences/README.md#ac-l2-wan-rankin-selberg-divisibility) | 0 | 1 |
| `L3/fw-residual-hypotheses` | [L3.1](../packages/AutomorphicCongruences/README.md#ac-l3-fw-residual-hypotheses) | 9 | 6 |
| `L3/universal-deformation-ring-structure` | [L3.2](../packages/AutomorphicCongruences/README.md#ac-l3-universal-deformation-ring-structure) | 0 | 2 |
| `L3/smooth-classical-points` | [L3.3](../packages/AutomorphicCongruences/README.md#ac-l3-smooth-classical-points) | 0 | 1 |
| `L3/fundamental-line` | [L3.4](../packages/AutomorphicCongruences/README.md#ac-l3-fundamental-line) | 8 | 6 |
| `L3/completed-homology-factorization` | [L3.5](../packages/AutomorphicCongruences/README.md#ac-l3-completed-homology-factorization) | 0 | 1 |
| `L3/equivariant-zeta-morphism-completed-homology` | [L3.6](../packages/AutomorphicCongruences/README.md#ac-l3-equivariant-zeta-morphism-completed-homology) | 7 | 5 |
| `L3/nakamura-universal-zeta-morphism` | [L3.7](../packages/AutomorphicCongruences/README.md#ac-l3-nakamura-universal-zeta-morphism) | 7 | 5 |
| `L3/nakamura-specialization-theorem` | [L3.8](../packages/AutomorphicCongruences/README.md#ac-l3-nakamura-specialization-theorem) | 0 | 1 |
| `L3/zeta-trivialization` | [L3.9](../packages/AutomorphicCongruences/README.md#ac-l3-zeta-trivialization) | 7 | 6 |
| `L3/kato-generalized-main-conjecture` | [L3.10](../packages/AutomorphicCongruences/README.md#ac-l3-kato-generalized-main-conjecture) | 7 | 5 |
| `L4/integrality-of-universal-trivialization` | [L4.1](../packages/AutomorphicCongruences/README.md#ac-l4-integrality-of-universal-trivialization) | 0 | 1 |
| `L4/etale-point-descent` | [L4.2](../packages/AutomorphicCongruences/README.md#ac-l4-etale-point-descent) | 0 | 1 |
| `L4/fw-universal-family-theorem` | [L4.3](../packages/AutomorphicCongruences/README.md#ac-l4-fw-universal-family-theorem) | 0 | 1 |
| `L4/family-to-point-limit` | [L4.4](../packages/AutomorphicCongruences/README.md#ac-l4-family-to-point-limit) | 0 | 1 |
| `L4/fw-pointwise-theorem` | [L4.5](../packages/AutomorphicCongruences/README.md#ac-l4-fw-pointwise-theorem) | 0 | 1 |
| `L4/derived-specialization-corrections` | [L4.6](../packages/AutomorphicCongruences/README.md#ac-l4-derived-specialization-corrections) | 0 | 1 |
| `L4/zeta-morphism-congruences` | [L4.7](../packages/AutomorphicCongruences/README.md#ac-l4-zeta-morphism-congruences) | 0 | 1 |
| `L4/residual-zeta-morphism` | [L4.8](../packages/AutomorphicCongruences/README.md#ac-l4-residual-zeta-morphism) | 6 | 5 |
| `L4/nakamura-residual-structure` | [L4.9](../packages/AutomorphicCongruences/README.md#ac-l4-nakamura-residual-structure) | 0 | 1 |
| `L4/nakamura-lambda-defect` | [L4.10](../packages/AutomorphicCongruences/README.md#ac-l4-nakamura-lambda-defect) | 0 | 1 |
| `L5/ordinary-elliptic-refinement-aggregate` | [L5.1](../packages/AutomorphicCongruences/README.md#ac-l5-ordinary-elliptic-refinement-aggregate) | 0 | 1 |
| `L5a/ordinary-two-variable-equivalence` | [L5a.1](../packages/AutomorphicCongruences/README.md#ac-l5a-ordinary-two-variable-equivalence) | 0 | 1 |
| `L5a/quartic-cm-selmer-restriction` | [L5a.2](../packages/AutomorphicCongruences/README.md#ac-l5a-quartic-cm-selmer-restriction) | 0 | 1 |
| `L5a/quartic-cm-l-function-factorization` | [L5a.3](../packages/AutomorphicCongruences/README.md#ac-l5a-quartic-cm-l-function-factorization) | 0 | 1 |
| `L5a/auxiliary-field-existence` | [L5a.4](../packages/AutomorphicCongruences/README.md#ac-l5a-auxiliary-field-existence) | 0 | 3 |
| `L5a/greenberg-mu-vanishing` | [L5a.5](../packages/AutomorphicCongruences/README.md#ac-l5a-greenberg-mu-vanishing) | 0 | 1 |
| `L5a/two-variable-product-containment` | [L5a.6](../packages/AutomorphicCongruences/README.md#ac-l5a-two-variable-product-containment) | 0 | 1 |
| `L5w/fujiwara-instance` | [L5w.1](../packages/AutomorphicCongruences/README.md#ac-l5w-fujiwara-instance) | 0 | 2 |
| `L5w/canonical-period-duality` | [L5w.2](../packages/AutomorphicCongruences/README.md#ac-l5w-canonical-period-duality) | 0 | 3 |
| `L5w/quaternionic-period-primitivity` | [L5w.3](../packages/AutomorphicCongruences/README.md#ac-l5w-quaternionic-period-primitivity) | 0 | 2 |
| `L5w/klingen-interpolation` | [L5w.4](../packages/AutomorphicCongruences/README.md#ac-l5w-klingen-interpolation) | 0 | 2 |
| `L5w/fourier-coefficient-coprimality` | [L5w.5](../packages/AutomorphicCongruences/README.md#ac-l5w-fourier-coefficient-coprimality) | 0 | 2 |
| `L5w/eisenstein-coefficient-ideal` | [L5w.6](../packages/AutomorphicCongruences/README.md#ac-l5w-eisenstein-coefficient-ideal) | 5 | 7 |
| `L5w/height-one-congruence` | [L5w.7](../packages/AutomorphicCongruences/README.md#ac-l5w-height-one-congruence) | 0 | 3 |
| `L5w/galois-selmer-instance` | [L5w.8](../packages/AutomorphicCongruences/README.md#ac-l5w-galois-selmer-instance) | 0 | 4 |
| `L5w/exceptional-height-one-primes` | [L5w.9](../packages/AutomorphicCongruences/README.md#ac-l5w-exceptional-height-one-primes) | 0 | 2 |
| `L5w/wan-family-divisibility` | [L5w.10](../packages/AutomorphicCongruences/README.md#ac-l5w-wan-family-divisibility) | 0 | 2 |
| `L5w/arithmetic-specialization` | [L5w.11](../packages/AutomorphicCongruences/README.md#ac-l5w-arithmetic-specialization) | 0 | 3 |
| `L5w/quartic-cm-divisibility` | [L5w.12](../packages/AutomorphicCongruences/README.md#ac-l5w-quartic-cm-divisibility) | 0 | 2 |
| `L5w/selected-base-change-hypotheses` | [L5w.13](../packages/AutomorphicCongruences/README.md#ac-l5w-selected-base-change-hypotheses) | 0 | 2 |
| `L5b/four-twist-lattice-dictionary` | [L5b.1](../packages/AutomorphicCongruences/README.md#ac-l5b-four-twist-lattice-dictionary) | 0 | 2 |
| `L5b/quadratic-selmer-decomposition` | [L5b.2](../packages/AutomorphicCongruences/README.md#ac-l5b-quadratic-selmer-decomposition) | 0 | 3 |
| `L5b/cyclotomic-control` | [L5b.3](../packages/AutomorphicCongruences/README.md#ac-l5b-cyclotomic-control) | 0 | 2 |
| `L5b/cyclotomic-analytic-factorization` | [L5b.4](../packages/AutomorphicCongruences/README.md#ac-l5b-cyclotomic-analytic-factorization) | 0 | 2 |
| `L5b/four-factor-product-bound` | [L5b.5](../packages/AutomorphicCongruences/README.md#ac-l5b-four-factor-product-bound) | 0 | 2 |
| `L5b/rank-one-image-twist` | [L5b.6](../packages/AutomorphicCongruences/README.md#ac-l5b-rank-one-image-twist) | 0 | 2 |
| `L5b/four-twist-kato-bound` | [L5b.7](../packages/AutomorphicCongruences/README.md#ac-l5b-four-twist-kato-bound) | 0 | 2 |
| `L5b/factor-separation` | [L5b.8](../packages/AutomorphicCongruences/README.md#ac-l5b-factor-separation) | 0 | 2 |
| `L5b/rational-cyclotomic-endpoint` | [L5b.9](../packages/AutomorphicCongruences/README.md#ac-l5b-rational-cyclotomic-endpoint) | 0 | 2 |
| `L5b/integral-cyclotomic-endpoint` | [L5b.10](../packages/AutomorphicCongruences/README.md#ac-l5b-integral-cyclotomic-endpoint) | 0 | 2 |

## Review and security notes

Resume with independent package review, especially the original-source comparisons and supplier refinements listed above. No new claim is needed from this worker. Upstream submission is the maintainer's decision after supplier/tier reconciliation.

No suspicious instruction was encountered in issue comments or source documents. Fetched papers were treated as data. No fetched code was executed, no source passage was copied into the repository, and no messages were sent except the authorized issue claim and pull-request submission. Scratch sources and scripts are disposable; this note contains the information needed after their deletion.
