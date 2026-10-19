# Checkpoint: PKG-ArithmeticQuantumTopology~2

Issue [#10757](https://github.com/CBirkbeck/tauceti-explorer/issues/10757); Codex,
session `codex-BfwF5f`; 2026-10-19. **Blocked checkpoint, not a completed package revision.**
The prior independent verdict remains `needs_changes`; this worker has not reviewed its own
revision or changed that record. Resume from the package files and the supplier contracts below;
no scratch downloads are needed.

The draft status is deliberate. `issues.py:deliverables_complete` currently determines package
completion from output-file existence, so merging this checkpoint automatically would report
completion despite the unresolved requirements. Maintainer coordination is needed before making
this PR ready. No pipeline file was changed.

## Package-local work completed

- Reconciled elementary q-calculus ownership with the accepted
  HabiroCyclotomicCompletions package: finite/infinite Pochhammer products and their hypotheses
  come from its Layer 1. QSeriesPartitionsAndMockModularForms supplies scalar QM.5 only.
  Recorded the balanced/unbalanced quantum-integer specialization and the existing Mathlib
  Bernoulli declarations and sign convention.
- Replaced the ambiguous Habiro limit-point language by the sufficient integral theorem on
  orders: a fixed positive n must be adjacent to infinitely many distinct evaluated orders m,
  with m/n or n/m a nontrivial prime power. Primitive-root evaluation uses cyclotomic
  irreducibility over the rationals. Added the consecutive-prime-product control; no converse
  or arbitrary-infinite-set uniqueness assertion is made.
- Expanded the exact HB.7 supplier contract: additive closure, effective finite-projective
  rank-one descent, actual chart base changes, conservative charts, actual tensor equivalences
  and a finite global inverse certificate. Local generators do not supply these conclusions.
- Revised §6.8 to distinguish the modified CGZ Bloch class from the actual K₃ degree. The
  comparison retains localization, torsion, finite-Chern and regulator data from K3BlochGroups
  V.3–V.6 and HB.9. Named the knot-specific degree, all-order normalization and membership
  targets without introducing heavy Lean carriers absent at the pins.
- Kept the full quadratic étale algebra, both split factors, units 2 and δ, excluded root
  orders, integral matrix restriction, source phase and HB.8/HB.9 hypotheses. Added split
  idempotent/deck-involution, rational-matrix, bad-order, phase and torsion controls.
- Removed the unnecessary global module-membership dependency from the formal coefficient
  statements of §7.2. Their possible additional membership conclusion remains conditional on
  §6.8. Corrected the Layer 6 dependency summary to V.3–V.6.
- Replaced the unrelated bare matrix multiplication example by a proved computation using
  `knotMatrixCocycle` itself at 0,1,2 for T(x)=x+1. It computes both ordered products and fails
  for reversed multiplication. Removed the standalone numerical trefoil expression, which did
  not test an introduced definition; its Jones-convention witness remains in the README.
- Repaired the collapsed reference list and made the existing versioned arXiv identifiers
  clickable. Metadata remains `topic = "math.GT"`.

## Blockers and where to resume

### R1: ideal-volume geometry supplier

Read the accepted [P.2 reader](../readmes/Polylogarithms--P.2.md) and its
[independent review](../reviews/REV-Polylogarithms--P.2.md), rather than relying only on the
older parent packet. P.2 is accepted planning, not a closed stage. It now gives a concrete
Milnor sector-integration route with the h⁻³ density, factor 1/2, and signed obtuse-angle
decomposition. Thus the prior package review's description of an entirely missing volume
proof route is stale. This revision does not claim to have independently certified Milnor's
primary source or closed that proof.

The canonical geometric carrier remains an explicit gap: ideal boundary ℂP¹, the model
PSL₂(ℂ)/PGL₂(ℂ) action, measurable geodesically convex ideal regions, ordered orientation,
finite Riemannian volume, signed sectors and exhaustion/integration comparisons. Current
GeometricTopology Layers 7–8 and Tau Ceti's upper-half-space metrics/similarities do not export
this interface. The proposed early GeometricTopology Part II prefix has not been supplied.
P.2 owns the volume/Bloch–Wigner comparison; AQT §§5.1–5.3 and 5.9–5.12 consume it. Do not
duplicate the formula or introduce the cycle P.2 → all of AQT Layer 5 → P.2.

### R2: actual global Habiro module and full étale descent

Resume at [HB.7](../readmes/HabiroNumberFields--HB.7.md), especially its effective-descent
contract and `G-global-descent`/E23, then AQT §6.8. Its accepted October 6 planning review does
not close that gap. GSWZ Theorem 2's proof (§3.3, p. 43) establishes multiplicative behavior;
it does not supply the missing additive closure/effective global descent argument. The local
rank-one statement of Theorem 1 (§1.5, p. 9) cannot replace it.

The supplier must establish the actual module structure, finite projectivity of constant rank
one, chart base changes and conservativity, and the multiplication tensor equivalence on the
actual family modules. Opposite indices require finitely many global sections with
Σᵢ fᵢgᵢ=1; a single global generator is not required. Extend this to the whole
B=R[T]/(δT²−1), including every split factor. A number-field pullback or one chosen component
does not cover that algebra.

Keep [HB.8](../readmes/HabiroNahmSeries--HB.8.md)'s global-prefactor and uniform-regularity
obligations and [HB.9](../readmes/HabiroNahmSeries--HB.9.md)'s coefficient-transfer,
all-order HB.8 identification, finite-Chern/Kummer orientation, integral gluing and descendant
transport obligations. Their accepted planning verdicts are not proofs of their retained gaps.
The geometric k=1 GSW identity does not discharge these all-order arithmetic requirements.

### R3: supplier-first upstream order

The family is absent from the 94-roadmap Caraiani–Newton ordering. No approved order/bundle
was provided in this issue or during this session. The maintainer must assign one; this worker
has not invented a tier or moved definitions into unrelated lower-tier roadmaps.

The prior review's package inventory needs updating: HabiroCyclotomicCompletions now has an
accepted package review (October 9), and K3BlochGroups has a package but no package review
record in this checkout. HabiroNumberFields, HabiroNahmSeries, Polylogarithms and
QSeriesPartitionsAndMockModularForms still lack package directories under those names.
Current TauCetiRoadmap has none of these named roadmaps. The q-series parent packet still has
`needs_changes`; its October 19 bounded review records that the corrected lower-boundary eta
factor has not yet been propagated into the excluded reader. Do not import the reader's naive
inverse multiplier as a global cocycle or regard the bounded fix review as whole-plan approval.

These blockers require supplier-owned files and maintainer ordering outside #10757's outputs.
Complete those exports and their package reviews, assign an admissible order/bundle, then
recheck the exact AQT comparisons. The existing independent package review remains the full
audit baseline; this checkpoint is a bounded supplier-interface revision, not a repeated full
source or signature certification.

## Evidence and validation

Read GSWZ [arXiv:2412.04241v2](https://arxiv.org/abs/2412.04241v2), §1.5 pp. 8–10
(degrees and Theorems 1–2), §1.7 pp. 13–15 (quadratic algebra, Theorems 3–5 and odd family),
§1.8 pp. 15–17 (NZ input), and §3.3 p. 43 (multiplication proof). The PDF SHA-256 was
`308d1dd1c42bd979e5d5c31d9d95215a1808f604031b49c0ce2a1eb767273de9`, matching the recorded
source version. No source excerpts or private source files are submitted.

Checked existing Bernoulli and matrix inverse theorem statements at Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`. Elaboration used that Mathlib pin and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369` through `lean-check`, after a memory check above
20 GB available. Suggested.lean elaborates successfully: 19 warnings, all `sorry` warnings;
no sorry'd data definitions. Current upstream/library overlap checks used TauCetiRoadmap
`0d144d044dacebca17b654695b6f1ad58f159b27` and Tau Ceti
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, read only. The PeripheralActions and
CombinatorialHeegaardFloer packages supplied current shape examples. No Lake build, cache
download, language server or mutation of those checkouts was run.

`scripts/check_blueprint.py` on the unchanged AQT packet reports 0 errors and 0 warnings:
106 nodes, 206 API items, 159 packet tests, 36 planets, eight gaps, and zero closed stages.
Package/handoff `intake.py check-files` and `git diff --check` pass. Only the assigned package
README, Suggested file and this handoff changed; the metadata, packets, readers, tier list,
supplier packages and independent review record were left untouched.
