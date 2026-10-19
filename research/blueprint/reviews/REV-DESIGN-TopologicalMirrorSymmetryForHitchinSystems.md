# Independent review: topological mirror symmetry for Hitchin systems

**Accepted as a complete target-level planning pass**, 19 October 2026.
Job `REV-DESIGN-TopologicalMirrorSymmetryForHitchinSystems`, issue #3621.
Reviewer: Codex, session `codex-tSfAVq`, independent of the design session
`codex-CFlcUI`.

The [packet](../packets/TopologicalMirrorSymmetryForHitchinSystems.json)
contains an individual verdict and mathematical check for every node in
`review.checked`, and an independent verdict for every source finding in
`sourceIssues[].review`. Acceptance verifies the statements and their proof
routes, including their recorded obligations. It does not discharge those
obligations. All six stages are **planned**, none is closed, and all
implementation statuses remain **unchecked**. The twelve named gaps are
preserved. This is a finished review, not a checkpoint.

## Counts and corrections

| Item | Reviewed result |
|---|---:|
| Nodes | 44: 43 verified, 1 corrected, 0 added |
| Definitions / constructions / theorems / comparisons | 6 / 8 / 28 / 2 |
| Baseline declarations | 9 confirmed; none removed or replaced |
| API items | 83 |
| Definition checks | 57, increased from 56 |
| Planets | 32 |
| Supplier requests / contracts | 27 / 3 |
| Gaps | 12, unchanged |
| Source findings | 29 confirmed; 0 rejected; 0 new |
| Routed extraction items | All 36 covered |

The mathematical correction is confined to
`TMS.1/relative-splitting`. Its statement and proof already distinguished the
bands, but its acceptance statement and API did not consistently do so.
Differences of Gm-neutralizations are line bundles; differences of
μr-neutralizations are μr-torsors, retaining the rth-power trivialization.
The action, difference-equivalence and chosen-origin API entries now state
both cases. An arbitrary line bundle cannot act on μr-neutralizations without
that extra data. The relative Kummer identification with Pic[r] remains a
statement about the rigidified sheaf.

The added `relativeSplit_kummerTrivialization` check uses the two μ2-torsors
given by t²=1 and t²=−1 over ℝ. Their associated line bundles are both trivial,
but they are distinct objects before rigidification. For U=V their relative
rigidified sheaf is nevertheless terminal. This detects forgetting power
trivializations or replacing a sheaf quotient by an orbit set of rational
objects. All four earlier checks at this node remain.

The reader has the same corrections and fifth check. The packet and reader
now identify the current completed Hodge reader by its actual
`Completed/HodgeStructures/README.md` location. Review metadata replaces
pending source-review prose, preserves earlier review/search provenance, and
records the new bounded correction search. The roadmap definition and
Suggested file needed no changes. No node was added and no baseline citation
was removed or broadened.

## Sources and findings

All four public PDFs were fetched independently. Their SHA-256 values match
the packet and reader. Locators refer to the published GWZ paper and the
explicit preprint versions of the other three sources; no passage was copied
into this review or its edits.

| Source | Independent reading used for this review |
|---|---|
| [GWZ20, published Inventiones 221 (2020), 505–596](https://link.springer.com/content/pdf/10.1007/s00222-020-00957-8.pdf) | Every node locator: definitions and comparison proofs in §§2.1–2.5, pp.512–528; Corollary 5.29, p.564; §§6–7, pp.565–594. Every finding locator was also read, including p.508, §§3.1–3.2, pp.529–534, Claim 4.2, p.538, Construction 4.15, p.543, and §§5.1–5.5, pp.548–563. |
| [HT03, math/0205236v1](https://arxiv.org/pdf/math/0205236v1) | §3, numbered pp.8–13, including Propositions 3.2 and 3.6 and their proofs; §6, numbered pp.17–18. |
| [Ito, math/0211378v3](https://arxiv.org/pdf/math/0211378v3) | §4, Lemma 4.3/Remark 4.2, numbered pp.12–13; §5.1–5.3, numbered pp.13–16, including the generalized fractional realization and its sign. |
| [Bittner, math/0111062v1](https://arxiv.org/pdf/math/0111062v1) | §7, Lemma 7.1 and proof, numbered p.18; distinguished the equivariant scissor ring from its further representation quotient. |

All 29 findings are confirmed **in the scope recorded by their review
reasons**. In particular, E15–E17, E25–E26 and E29 identify missing proof
steps; confirmation does not assert that the corresponding geometric
conclusion is false. E2 rejects the fixed-coefficient logarithm/exponential
argument for unbounded denominators, without rejecting existence of roots
over varying algebraic coefficients. E26's root-gerbe example refutes the
general passage from Brauer neutrality to μn-neutrality; it is not a
counterexample about the particular Higgs gerbes. E29 withholds the generic
stable-torsor certificate in the elliptic canonical case while retaining the
main theorem's full genus range.

The source checks independently recomputed the weighted BC2 and sign-action
counts (E23), the inverse spectral determinant and its power formula (E12),
and the local pairing counterexample at Q3 (E24). The deformation-complex
placement and fixed-determinant scalar band at p.576 support E27–E28.
Corollary 5.29 was checked visually as well as in extracted text: the
published conjugation bar is present, and the packet's conjugate-integral
formula is correct.

On 19 October the independent bounded correction search opened the
[publisher record](https://link.springer.com/article/10.1007/s00222-020-00957-8)
and [arXiv version history](https://arxiv.org/abs/1707.06417), and searched
the exact title with correction/erratum and the authors with
mirror/erratum/corrigendum. It returned no correction for these points.
This does not establish that no correction exists. No author was contacted.

## Pinned baseline and current ownership

Every declaration and its ambient hypotheses were read at Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369` or Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174`. All nine citations fit their
limited uses.

| Declaration | Confirmed boundary |
|---|---|
| `TauCeti.Hodge.MixedHodgeStructure`, Mixed/Basic.lean:72 | Abstract filtrations and pure graded pieces; supplies no geometric cohomology. |
| `TauCeti.Hodge.tate_hodgeNumber`, Tate/Basic.lean:159 | Z(m) has Hodge index −m; hence Lefschetz uses the negative Tate twist. |
| `TauCeti.AlgebraicGeometry.InvertibleSheaf`, LineBundle/Basic.lean:78 | Locally free rank-one sheaves. |
| `TauCeti.AlgebraicGeometry.LineBundleClass`, LineBundle/Class.lean:49 | Isomorphism classes and a commutative monoid; not the full relative Picard theory. |
| `TauCeti.AlgebraicGeometry.AbelianVariety`, AbelianVariety/Basic.lean:94 | Proper geometrically integral commutative group object over a field; not a relative dual abelian scheme. |
| `CommGroup.sum_inv_mul_monoidHom_apply_eq_ite`, CharacterOrthogonality.lean:123 | Finite commutative G, domain coefficients with enough roots, inverse on the tag; exactly the existing Fourier input. |
| `sum_hom_units_eq_zero`, RingTheory/IntegralDomain.lean:186 | Nontrivial character, finite domain group and domain coefficient ring. |
| `AddMonoidAlgebra`, Algebra/MonoidAlgebra/Defs.lean:64 | Finite sums with additive exponents, suitable for rational bidegrees. |
| `Matrix.trace`, LinearAlgebra/Matrix/Trace.lean:45 | Finite diagonal sum; supports the explicit Jordan regression. |

The reviewed library-audit rows agree with the packet: R09.4/R09.5 are
partly built (AUDIT-01), A2/A3 not built/partly built (AUDIT-08), and R02.4,
DWP.7 and R01.5 not built (AUDIT-02/18/31). There is no audit entry for this
new roadmap. Those verdicts do not override actual pinned declarations.

The current upstream commits were independently rechecked:
roadmaps `0d144d044dacebca17b654695b6f1ad58f159b27`, library
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. The complete current
Completed/HodgeStructures and AlgebraicVectorBundles readers were read,
with relevant Suggested declarations and current-library ownership searches.
Generic tensor, exterior, determinant and total-space constructions remain
imports from AlgebraicVectorBundles. Neither current upstream tree was
modified or built. No private source was needed.

## Closure and supplier checks

The six-layer order is sound. All 44 targets have prerequisites or explicit
gap endpoints; the 36 routed items, including the stronger unclosed
Theorem 7.23 target, are preserved. Every definition/construction has its
use-driven API and at least three discriminating checks. The 32 planets name
the central objects or results. The complete status denotes a finished
target-level pass under PROTOCOL §0; the nonempty remaining lists correctly
prevent mathematical closure.

The cross-roadmap checks read the 24 distinct referenced exact supplier
nodes and the twelve broader stage specifications. In particular:

- R09.4's gerbe/band-change and R09.5's rigidification exports retain their
  sheaf and base-change hypotheses. A2/A3 retain normalized Poincaré,
  isogeny and Weil-pairing conventions. No such generic theory is replanned.
- R02.4's local duality and isogeny-index statements are characteristic
  zero. G-local precisely requests the prime-to-p equal-characteristic
  extension used over k[[t]].
- ET.2b's Higgs/spectral/Picard exports are over finite fields and do not
  supply every relative stable fixed-determinant general-D construction.
  CB.7 and CB.9 provide canonical GL carriers and purity, with the narrower
  scope recognized by G-moduli and G-Higgs-purity.
- SF.2's profinite Hochschild–Serre statement and SF.3's Picard–Brauer
  sequence supply the constant-Brauer argument. No new spectral sequence
  or unconditional endpoint vanishing is assumed.
- CP.3 needs the equivariant fractional Hodge–Tate adapter, and LD.3 needs
  the actual equivariant Bittner presentation. H.1's existing scope does not
  already provide the requested family-coherent unitary comparison.
- The unregistered ET Part II and Hodge Part III contracts are honest
  ownership proposals, not fictitious resolved stage identifiers.

The local integral proof uses only the sufficient forward Brauer condition;
it does not require G-Kummer or the unitary comparison. The final invariant
comparison does require the generic integration, geometric realization,
relative-moduli and arithmetic-descent gates. The actual cohomological Galois
isomorphism is correctly separated from its justified virtual consequence.
Primary Nitsure/Faltings properness and Ngô codimension proofs were not
recursively re-proved in this review; their missing interfaces remain named
obligations, exactly as in the input plan.

## Validation and maintainer routing

- Blueprint checker: **0 errors, 0 warnings**, 44 nodes, 83 API items,
  57 checks, 32 planets, six planned stages and zero closed stages.
- Source-issue and source-version schema checks: **passed** for all 29
  verdicts and the published PDF receipt.
- Reader consistency: every node statement, hypothesis, proof step,
  acceptance condition, use, API item and test matches the packet. All
  36 routed-item memberships and all 44 review memberships agree.
- `check_sorry_data.py`: **passed**; no admitted data definitions.
- `lean-check` of the unchanged 128-line Suggested file: **exit 0**, only
  the 15 expected warnings for proofs using `sorry`. Available memory was
  83 GiB before the check. No language server, library build or dependency
  update ran. The signatures check the numeric/algebraic conventions; they
  do not implement the geometric targets.

The maintainer needs to register or otherwise resolve the proposed ET Part II
and geometric-MHS Part III owners, then route the twelve explicit gap
contracts in dependency order. The strong μn condition and actual Galois
isomorphism remain distinct follow-ups and must not become assumed inputs of
the main mirror comparison. No change to another roadmap's files is proposed
by this PR beyond the packet's existing ownership proposals.
