# BP-GeometricSatakeAndFusion--GS3-fusion handoff

Issue #10915; Codex (GPT-6), session `codex-XM8hhI`, 19 October 2026.
The bot confirmed the claim in [issue comment 6268481655](https://github.com/CBirkbeck/tauceti-explorer/issues/10915#issuecomment-6268481655).
Branch: `codex-XM8hhI-gs3-fusion`.

This is a complete target-level planning pass, not a checkpoint. The sole scoped
stage `GeometricSatakeAndFusion:GS3:fusion` is **planned**, not **closed**. The
packet has 8 nodes (2 definitions, 2 constructions, 4 theorems), 20 API items,
17 named unit-test specifications, 6 planets, 9 baseline declarations, 4 supplier
requests and 2 explicit carrier/transport gaps. All implementation statuses are
unchecked. No geometric formalization is claimed.

## Existing work and ownership

The issue points to a GS0 coverage record for GS3:fusion. The actual accepted
GS0 packet covers GS0–GS2 and has no such record. The accepted GS3 packet and
integrated decomposition already contain eight fusion targets. This stage-only
continuation retains exactly those eight identifiers, refines their contracts,
and imports the GS0–GS2 nodes. It neither creates a second independently named
fusion theory nor edits either accepted packet. Integration must treat these
records as refinements of the same IDs, not eight additional declarations.
The broader GS3 packet retains ownership of its separate GS4 targets.

The retained suffixes, under `GeometricSatakeAndFusion:GS3:fusion/`, are:

- `disjoint-leg-locus`
- `disjoint-leg-factorization-and-full-faithfulness`
- `support-parity`
- `fusion-product-and-sign-rule`
- `finite-set-functoriality-and-constant-terms`
- `drinfeld-fibre-realization`
- `symmetric-constant-term`
- `fusion-verdier-duality`

Current TauCetiRoadmap main (`0d144d044dacebca17b654695b6f1ad58f159b27`)
and current Tau Ceti (`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`) were
searched by the actual objects: Satake categories, Beilinson–Drinfeld
Grassmannians, fusion products, local Hecke geometry, local acyclicity,
Drinfeld equivalence and half-Tate conventions. Relevant hits in
SmoothRepresentationsOfLocalGroups, IntegralHeckeAndGaloisDeterminants,
ReductiveGroupsPartII and ModularForms concern classical spherical theory,
integral dual data or the scalar newform polynomial, not this geometric
construction. The current newform declaration in
`TauCeti/NumberTheory/ModularForms/Newforms/Satake.lean` was inspected.
ClassFieldTheory Layer 9 is imported as the existing Weil-group owner, including
its arithmetic-degree convention. No current upstream roadmap or library file
was edited or built.

The reviewed `AUDIT-21` entry finds the geometric targets absent and generic
symmetric-category APIs present. Its equal-characteristic GlobalShtukas GS.1
overlap remains a boundary: this part specifies the Fargues–Fontaine category,
not a second development of the global-shtuka fusion geometry. The touching
link records were read. The ClassFieldTheory screen's claim that GS has no
Weil-group use misses FS VI.9.2; the packet records that import explicitly.
The two current roadmap models consulted were LocalGaloisGroups and
AlgebraicVectorBundles, together with the AdicSpaces roadmap and the current
ClassFieldTheory Layer 9 interface.

## Confirmed red-team finding

**RT-AREA-geomlanglands/1 is addressed.** Convolution closure and rigidity are
explicit prerequisites of fusion. The packet carries the proposal to remove
`GS3:fusion → GS2:Satake-closure`, add
`GS2:Satake-closure → GS3:fusion`, and retitle the closure layer “Convolution
closure and rigidity.” Its proof is VI.8.1(iii) from (i),(ii) and Verdier
duality, with VI.8.2 dualizability from IV.2.24, VI.6.2 and VI.7.12. The
VI.8.1(ii) elementary degeneration is distinguished from completed VI.9 fusion.
The atlas edge and older text are not edited because they are outside this
issue's deliverables; the restructuring entry preserves the integration action.
No fusion theorem is used to obtain its own monoidal input.

The stage's existing wording groups sign correction and half-Tate normalization.
The reader separates their actual roles: parity correction gives ordinary
symmetric cohomology already in VI.9; a square root of q is used for downstream
normalized dual-group/parameter comparisons. Integration should preserve that
boundary rather than make unnormalized fusion depend on GS4 identification.

## Mathematical checks and refinements

| Target or convention | Instances and failure modes checked | Result reflected in the deliverables |
| --- | --- | --- |
| Disjoint locus | Empty I; one block; two singleton blocks; (x,x,y) and (x,y,x) with blocks (0,0,1) | Internal collisions allowed; cross-block collisions excluded; genuine open/base-change structure remains a geometric target |
| Restriction uniqueness | Two-leg diagonal; hypothetical codimension-zero component; an arbitrary object only on the open | Positive-codimension purity and both Hom directions required; no essential-surjectivity claim; existence of fusion proved separately |
| Parity and sign | Unit; empty tuple; dimension 1 versus rank 2; dimensions 1 and 3; characteristic two and three | Dimension/coroot parity; sign only on odd/odd summands; no division by two; mixed objects split by clopen support |
| Fusion | Unit and one block; two disjoint blocks; odd/odd and mixed parity; integral coefficients | Proper chain convolution supplies existence; corrected symmetry and ordinary fibre flip; explicit interchange, pentagon, triangle, both hexagons and involution |
| Finite-set maps | Fold; injection; empty-to-singleton; transposition squared; three and four successive merges | Grassmannian closed immersion, not a Hecke-stack immersion; actual block-sum map; comparison diagrams and higher coherent packaging retained |
| Collision proof | Pull back the pairwise-distinct source open along a fold | This open becomes empty. Within collapsed blocks use convolution/base-change diagrams; use disjoint uniqueness only between surviving blocks |
| Weil realization | Empty product; fold W→W²; injection W²→W; three successive maps | Restriction along dα:W^J→W^I, not induction or an action of just diagonal W; exact faithful functor with the precise split kernel/cokernel criterion |
| Drinfeld and coefficients | Diagonal-supported sheaves; discrete torsion versus adic coefficients; lisse-site versus locally constant perfect objects | IV.7.3 only for locally constant perfect complexes; VS1 owns that theorem, VS3 owns coefficient comparisons in their actual range |
| Tate conventions | H⁰(P¹)=Λ, H²(P¹)=Λ(−1); q=2 in Z/5; chosen s²=q | Root line Λ(1) has geometric scalar q⁻¹=3, not q=2; arithmetic degree has the opposite sign; half-Tate scalar s⁻¹; parameter untwisting kept distinct |
| Constant terms | P=G; nested Levis; fold and unit insertion | Degree shift ⟨2ρ_G−2ρ_M,μ⟩; additive shifts and transitivity; symmetric tensor/fibre/collision diagrams; precise FS VI.9.6 locator |
| Duality | Torus (μ,L); unit; evaluation and coevaluation | D preserves support and dualizes L; sw* negates support; internal dual sw*D; both triangle identities and leg transport required |

No theorem is strengthened to integral semisimplicity, abelianness of Satake,
or arbitrary coefficient extension. The torsion coefficient ring is explicitly
commutative and killed by an integer prime to p. The equal/mixed-characteristic
local-field scope and étale-local descent are retained. All inverse q scalars
are meaningful since p is invertible in the coefficient ring; a half-root is
used only after choosing it in an allowed coefficient extension.

## Remaining contracts

1. **Formal geometric carriers absent at the pins.** Div¹, Grassmannian/Hecke
diamonds, bounded ULA flat-perverse categories and continuous finite-projective
Weil representation categories come from the named earlier owners. The heavy
construction and coherence statements remain full reader targets. No arbitrary
category parameter or admitted data definition replaces them in Lean.
2. **Drinfeld transport and coefficient convention adapter.** VS1 must expose
the exact IV.7.3 theorem, degree-zero specialization, finite-product/diagonal
naturality and transported Tate stalk action. ClassFieldTheory supplies the
existing Weil topology/degree; VS3 supplies compatible adic comparisons with
specified coefficient rings and boundedness. Source-level directions and signs
are fixed here, but their carrier-level formal transport is not implemented.

The RG2.5 request is narrowed to parity, coroot/component quotients and Levi
shifts. It does not re-request GS4 dual-group reconstruction or rank-one
recognition. The source statements required for this stage have been checked;
the two remaining entries honestly distinguish supplied mathematical targets
from currently expressible Lean carriers. Independent review should check
these refinements and the exact external contracts before integration.

## Validation and source record

- `python3 scripts/check_blueprint.py research/blueprint/packets/GeometricSatakeAndFusion--GS3-fusion.json`: **0 errors, 0 warnings**.
- `python3 research/blueprint/intake.py check-files` on all four deliverables:
  **0 problems**.
- `git diff --check`: passed.
- `lean-check research/blueprint/suggested/GeometricSatakeAndFusion--GS3-fusion.lean`:
  **exit 0**, at pinned Mathlib `082e2d37e8`; only admitted-proof warnings.
  The 186-line file has three real-bodied light definitions and no admitted
  data. Finite numeric/negative-control computations are proved; geometric
  tests are reader specifications, not represented as compiled geometry.
  Memory available before compilation was 83 GB. All checks were sequential;
  no build, cache download, language server or background process was started.

The actual statements and surrounding hypotheses of all nine listed Mathlib
baseline declarations were read at the pin, not inferred from names. No Tau
Ceti implementation declaration is used as a geometric Satake baseline.

The public author-hosted FS PDF was read at the precise sections listed in
`source.readSections`: IV.7 pp164–166, VI introduction pp187–190, VI.7 pp221–224,
VI.8 pp224–226, VI.9 pp226–230, VI.11 pp235–236,238–239 and IX.7.1 pp334–335.
Its SHA-256 is
`9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`,
matching the accepted GS3 source version. All result descriptions are in our
own words; no source passage is reproduced. No new source error is asserted;
GS4's unrelated source-issue records are not copied into this stage packet.

Only the three named deliverables and this handoff change. The next worker
needs no scratch files: the public source, contracts and checks are recorded
here and in the packet/reader. Scratch is removed after the PR opens.
