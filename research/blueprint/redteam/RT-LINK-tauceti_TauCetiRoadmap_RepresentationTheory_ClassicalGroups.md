# Red team: ClassicalGroups link map

Worker: Codex, session `codex-J6LwjP`. Issue #4370. Read on 30 September 2026 at repository base `87471039bf9e14520e92e64b1ae1bbada6e45f74`.

One medium finding: the map leaves the diagonal tensor-action owner undecided, although the pinned implementation already shares that construction and gives a concrete producer/consumer direction. The twelve current directed links survive this attack. Their twenty-four evidence quotes and the two review-added overlap quotes are literal matches.

## Independence and scope

The original worker is ChatGPT Pro `cgp-87a9defc4f57`; the independent reviewer is Codex `codex-a71f92`. This session did neither job. It previously red-teamed the neighboring SchurWeyl map and recorded a different orthogonal-form prerequisite, CG0→SW9; that finding is not repeated here. This report attacks the link map and its ownership proposals, not every mathematical statement in the upstream roadmap or all of its implementation inventory.

## Existing links checked

CG = ClassicalGroups; RG = ReductiveGroups; LH = LieHighestWeight. All directions are supplier → consumer. The seven CG stages and thirteen external endpoint stages of this packet were read at contract level, including their coefficient and group/Lie qualifications.

| Links | Contract retained |
| --- | --- |
| 1–2: RG1/6 → CG0 | Rational coordinate-Hopf comodules and characteristic-zero complete reducibility; concrete complex-point and basis-independent rationality comparisons remain explicit. |
| 3–5: RG2/4/7 → CG3 | Algebraic differentiation, torus character lattices and full group root data. These retain the central direction and isogeny form; abstract semisimple roots alone do not supply them. |
| 6–7,10: LH4/9/0 → CG3 | Semisimple classification, reductive central-scalar transfer and the rank-one acceptance module. Group integrability and disconnected O remain separate. |
| 8–9: LH6 → CG4/5 | Actual character and coroot dimension theorems, with torus evaluation, Laurent twists and coordinate/hook-content comparisons left to CG. |
| 11–12: LH3/7 → CG6 | Enveloping maps and full central-character separation. These do not silently supply all reductive Capelli generators, their normalization or a chosen GT basis. |

The first four overlap proposals correctly separate rational carriers, finite-group versus algebraic Clifford theory, abstract versus concrete Weyl formulas, and semisimple versus reductive centers. The fifth is the finding below. The existing norm-only GT normalization problem remains explicitly unresolved; no chosen vector is inferred from its norm.

## Finding 1 — consume the existing tensor constructor and record its direction

The diagonal tensor-action dependency is left as an unresolved choice of constructor owner even though the mandated Tau Ceti pin already resolves it. Representation.tensorPower is the generic construction, TauCeti.tensorPowerRep is its classical standard-module specialization, and the actual Schur-Weyl GL/S_d mutual-commutant file imports that specialization and states its theorems using it. Thus the existing shared constructor should be consumed, and the narrowly scoped ClassicalGroups1 → SchurWeyl8 supplier edge is missing. The assembled atlas has neither that edge nor a path between these stages. This does not invalidate any of the twelve current edges or require a reverse Young-image/classification edge.

The packet says to choose an early constructor owner and withholds a directed link because the current roadmap contracts do not decide it. The relevant roadmap descriptions do match: [CG Layer 1](https://github.com/CBirkbeck/tauceti-explorer/blob/87471039bf9e14520e92e64b1ae1bbada6e45f74/content/tau-ceti/RepresentationTheory/ClassicalGroups/README.md#layer-1-functorial-constructions-and-tensor-powers) defines the diagonal tensor power of the standard representation; [SW Layer 8](https://github.com/CBirkbeck/tauceti-explorer/blob/87471039bf9e14520e92e64b1ae1bbada6e45f74/content/tau-ceti/RepresentationTheory/SchurWeyl/README.md#layer-8-schur-weyl-duality) defines its diagonal map alongside the permutation action. The pinned implementation resolves the direction more precisely than those descriptions alone.

| Fresh pinned source at Tau Ceti f790474 | Statement read and significance |
| --- | --- |
| [Tensor/Power.lean:100](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Tensor/Power.lean#L100) | `Representation.tensorPower` works for a commutative semiring, monoid and module. Its bundled homomorphism supplies identity/multiplication laws; line 106 identifies the action with the diagonal `PiTensorProduct.map`. |
| [ClassicalGroups/Standard.lean:44](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/ClassicalGroups/Standard.lean#L44) | `stdRep` is built from `Matrix.GeneralLinearGroup.toLin`; the following lemmas identify matrix-vector multiplication. |
| [ClassicalGroups/TensorPower.lean:55](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/ClassicalGroups/TensorPower.lean#L55) | `tensorPowerRep k n d := (stdRep k n).tensorPower d`, over any commutative ring; line 60 bundles it as FDRep. Lines 67 and 77 prove permutation and group-algebra commutation. |
| [Symmetric/TensorAction/Basic.lean:48](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Symmetric/TensorAction/Basic.lean#L48) | The shared permutation action, its convention and the diagonal-map commutation lemmas already exist. |
| [Symmetric/TensorAction/GeneralLinear.lean:8](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RepresentationTheory/Symmetric/TensorAction/GeneralLinear.lean#L8) | Imports `ClassicalGroups.TensorPower`; lines 61–86 state the two image-centralizer theorems using that action, over an infinite field with nonzero d!. This includes C and proves actual reuse, not just similar names. |

The first four construction/interface facts suffice to avoid a second constructor. The fifth additionally supplies direct consumer evidence. This does not claim that all Young-image, character and highest-weight comparisons are already covered by these files.

Retain the two-sided overlap quotations, but revise its recommendation/proposal to consume the existing Representation.tensorPower / TauCeti.tensorPowerRep API and permutation-commutation results instead of commissioning another constructor or leaving its direction undecided. Add one inferred link from ClassicalGroups#layer-1-functorial-constructions-and-tensor-powers to SchurWeyl#layer-8-schur-weyl-duality, using those two existing README quotes. Its reason must limit the import to the early diagonal action and its carrier/convention comparison, with k=C, dimension n and degree d (SW's displayed bound names d,n are reversed). Cite the pinned declarations and the actual GeneralLinear import. Preserve separate Young-image, highest-weight and character-theory boundaries; do not add a reverse ClassicalGroups2 → SchurWeyl8 edge or demand all of ClassicalGroups' classification first. Keep the existing GL/S_d centralizer field hypotheses when mentioning that consumer; this finding does not certify the whole Schur-Weyl roadmap or commission its already available image theorem. Refresh the summary/provenance to record the scoped pinned-library check, the resolved constructor boundary and the new outgoing link. A scratch-only proposed packet passes check_links and merge_links; the edge count becomes 8,008, remains 8,008 on repeated merge, and is acyclic. Submit through ordinary review/promotion, not by hand-editing generated atlas data.

Full stage IDs for the new edge:

- `tauceti:TauCetiRoadmap/RepresentationTheory/ClassicalGroups#layer-1-functorial-constructions-and-tensor-powers`
- `tauceti:TauCetiRoadmap/RepresentationTheory/SchurWeyl#layer-8-schur-weyl-duality`

## Search for omitted or duplicate interfaces

Read the nine links and six overlaps already delegated to RootSystems, SchurWeyl and SpinRepresentations, and the additional current LieGroups overlap. The additional endpoint set contains twelve stages; it preserves the GL center, root-datum/isogeny distinctions, Specht versus GL dimensions, Young-image direction, bounded-tableau/GT dictionary, and spin versus SO boundary. None is repeated as a new finding.

The full stage screen used the immutable atlas plus new definitions: 2,028 unique stage records and 221 roadmap records. Candidate counts are lexical screening evidence, not mathematical absence claims:

| Focus | Query family | Candidate stages / roadmaps |
| --- | --- | --- |
| CG0 | comodules, linear reductivity, rational representations | 9 / 6 |
| CG1 | tensor actions, symmetric/exterior powers | 20 / 16 |
| CG2 | Young symmetrizers, Schur functors, mutual commutants | 5 / 2 |
| CG3 | highest weights, character lattices, dominant integrality | 32 / 18 |
| CG4 | Schur polynomials, Weyl characters, bialternants | 5 / 4 |
| CG5 | Weyl dimensions, hook-content | 1 / 1 |
| CG6 | GT, Capelli, central characters, branching | 29 / 18 |

Additional contract checks covered CompactGroups' SU2 symmetric-power engine; LieGroups' compact/holomorphic comparison; ArithmeticGaloisRepresentations G7 and compatible-system operations; AG2.1/AG2.1a geometric projectors; AutomorphicBundles B2 and AutomorphicForms AF4; LP3/PA1 integral highest-weight theory; and ShimuraData D1. Continuity, real/complex comparison, integral coefficients, lattices and geometric projectors remain extra conditions. No further unconditional edge from the complex classical-group classification follows just from those words.

The reviewed `data/library-coverage.json` has no direct ClassicalGroups layer entry; its G7 duplicate note points to algebraic power constructions. `AUDIT-42` is not among its accepted reviews and was only a file-location lead. The five pinned files above were downloaded and their pertinent signatures/definitions read independently. No claim of a complete roadmap-wide library audit is made.

## Structural verification and boundaries

- Target `check_links`: 12 links, 5 overlaps, 217 distinct examined IDs; zero errors or warnings. All 26 active quotations are literal source-file substrings.
- Actual read-only atlas assembly: 2,840 stages, 8,007 edges; all twelve packet edges present and no return path for any.
- Supplemental graph: all 36 research link packets plus base links and 65 additional consecutive-layer order edges across eight relevant roadmaps; 4,278 unique edges and no return path for a current edge. This does not certify all unrelated planning components.
- The proposed thirteen-link packet passes `check_links`. A scratch-only hypothetical accepted-packet fixture passed `merge_links` and its global acyclicity check: 8,007→8,008 edges, still 8,008 on repetition. Edge-set insertion is idempotent; no claim is made that repeated merging leaves evidence arrays identical. No production packet, review or atlas was changed by this simulation.
- Deliverables: `check_redteam.py`, exact JSON/finding-ID check, `intake.py check-files`, and `git diff --check`. No Lean file is part of this job and no Lean compilation was run.

The mathematical source evidence here is the repository's roadmap contracts and the linked exact-commit declarations, all read on 30 September 2026. No external textbook citation or inherited inventory sentence is presented as an independently verified implementation claim.
