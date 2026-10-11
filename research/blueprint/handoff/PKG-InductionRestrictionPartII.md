# PKG-InductionRestrictionPartII — blocked checkpoint

Refs [#7592](https://github.com/CBirkbeck/tauceti-explorer/issues/7592).
Codex (GPT-6), session `codex-FRZdOs`, 11 October 2026.
Branch: `codex-FRZdOs-induction-restriction-package`.
The bot [confirmed this session's claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7592#issuecomment-6104553257).
Base atlas commit: `fbbbb004ed1556c56b68dc09238e46e1d4b75e15`.
No manager-priority issue appeared in the available swarm enumeration;
this package was selected in the permitted fallback order. Exactly one job
was claimed.

## Result and blocker

This is a **blocked checkpoint**, not a completed package. Fresh inspection
confirms that the accepted packet still has both unassigned prerequisite
owners described below: arbitrary-coefficient integral UCT and the native
homological extension bridge (`gaps[0]`), and cyclic coprime complement
conjugacy for possibly nonabelian kernels (`gaps[4]`).

The job restricts edits to the package and this note and explicitly says
“Change no packet; if the plan has a mistake, describe it in the handoff
note.” PROTOCOL §§3, 15 and 20 require named, nonduplicated prerequisite
owners. The source-of-truth packet calls the homological continuation an
ownership question, not an existing supplier, and its restructuring proposal
asks for assignment once. Native admitted signatures do not discharge that
assignment. The current read-only supplier trees did not change this result.

Complete the planning amendment described in the earlier note before
reopening package work: assign the five contracts to actual layers, add the
needed nodes and replace the two unassigned gap entries. RS.1 and RS.5 are
proposed placements only. An alternative supplier must name its layer and
supply the same native carriers, arbitrary-kernel hypotheses, maps and
naturality. Retain the existing parent ordinary-cover request and all finite
certificate targets. No new owner, edge or review verdict was assigned here.

`metadata.toml` remains absent. Its future content is
`topic = "math.GR"`. The local `deliverables_complete` implementation checks
all package output paths before returning completion; adding metadata now
would advance this blocked package incorrectly. The missing file keeps
this submission a checkpoint.

## New work

Add `extension_five_term_test_4` to the README and Suggested.lean. It uses
Mathlib's actual `SemidirectProduct.toGroupExtension` for the inversion action
of C₂ on C₃, rather than an assumed central-extension carrier. The extension
has a splitting and a noncentral kernel, the kernel's map to abelianization
is zero and not injective, and the induced quotient map on abelianizations
is bijective. This complements the three inherited central examples. It
tests the centrality hypothesis in the split-kernel injectivity claim and
the absence of that hypothesis on the two tail conclusions. It never calls
the central-extension class map on a noncentral extension.

The calculation is explicit: elements are (i,j)∈ℤ/3×ℤ/2 with
(i,j)(k,l)=(i+(−1)^j k,j+l). For a=(1,0), t=(0,1), the commutator
[t,a]=a⁻²=a. The kernel C₃ therefore lies in the commutator subgroup;
the abelian quotient C₂ proves the reverse inclusion. Exhaustively checking
the six elements and all 36 commutators in Python gave a commutator subgroup
of order three equal to that kernel, and confirmed the homomorphic standard
section and noncentrality. These are calculation receipts; the Lean example
still has an admitted proof.

Fresh source reading: Löh, *Group Cohomology*, 30 July 2019,
[author notes](https://loeh.app.ur.de/teaching/grouphom_ss19/lecture_notes.pdf),
Theorem 1.4.1 pp.20–22 and Example 1.4.4 p.22. The latter gives the symmetric
group abelianization check; the semidirect-product computation above is an
explicit deduction. Conrad, [*The Schur–Zassenhaus theorem*](https://kconrad.math.uconn.edu/blurbs/grouptheory/schurzass.pdf),
Example 2 p.1 and Remark 5 p.4, was also inspected: the former establishes
cyclic-quotient existence, and the latter states the separate conjugacy
conclusion. No primary-source passage was copied into a deliverable.

## Fresh supplier checks

Read the current InductionRestriction and SemisimpleAlgebras READMEs in full,
the relevant suggested interfaces, and the reviewed library audit. The
read-only roadmap commit remains `070dc2becd74419e76303ede84b465ed4a69461f`;
current Tau Ceti remains `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.

- Current `TauCeti.ChainComplex.kronecker_bijective`,
  `Algebra/Homology/Kronecker.lean`, line 177, explicitly requires an
  injective coefficient object. It does not give the arbitrary-coefficient
  Ext injection needed here. AlgebraicTopology Stage 6 supplies singular
  UCT; the native group/bar adapter still has to have an owner.
- Current `TauCeti.groupHomology.transfer_comp_map_subtype_id`,
  `GroupHomology/Transfer/Basic.lean`, line 107, supplies transfer followed
  by inclusion as the subgroup index times identity. Reuse that theorem;
  it does not by itself supply finite generation, UCT or the coprime edge.
- Parent InductionRestriction Layer 7 owns ordinary representation groups;
  its cohomological multiplier does not supply the missing generic native
  homology contracts. Inspected ProfiniteCohomology and LocalGaloisGroups
  interfaces give cohomological and local-field constructions, not this
  arbitrary-group integral five-term sequence.
- At Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`,
  `Subgroup.exists_right_complement'_of_coprime`,
  `GroupTheory/SchurZassenhaus.lean`, line 277, asserts complement existence,
  with no conjugacy conclusion. `SemidirectProduct.toGroupExtension` and
  `inr_splitting`, `GroupExtension/Defs.lean`, lines 326 and 339, provide
  exactly the extension and section used in the new test.

## Verification in this session

- `lean-check research/blueprint/packages/InductionRestrictionPartII/Suggested.lean`:
  **exit 0, 696 warnings, all `declaration uses sorry`; zero errors or other
  warnings**. Preflight memory was 99 GiB available. The shared helper uses
  the atlas's Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` build;
  its Mathlib source HEAD is the pin above. The check finished. No library
  build, update, cache download or language server was started.
- `python3 scripts/check_blueprint.py research/blueprint/packets/InductionRestrictionPartII.json`:
  exit 0, zero errors/warnings; 109 nodes, 124 API items, 96 planned tests,
  five gaps, one request, six planned stages, zero closed stages. Packet
  SHA-256 is unchanged:
  `85af7815c4223c6b160f957e001598afb66ae1aaa84ddbea6995008ed72519c5`.
- All 109 target suffixes, 124 API suffixes and 96 planned test labels still
  occur in both package files; the new companion test occurs in both.
  This is name correspondence, not a mathematical audit of every inherited
  finite certificate.
- README: 160,376 bytes, below the 200 KB limit. Only the README,
  Suggested.lean and this handoff are changed. No scratch artifact is needed
  to resume; calculation and resumption details are recorded here.

The prior note follows to retain its exact amendment proposals, inherited
finite-model obligations and references to earlier computation receipts.
Its compiler counts and artifact hashes are historical; the fresh check
above supersedes them.

---

## Previous checkpoint: codex-pYtfSw

Issue [#7592](https://github.com/CBirkbeck/tauceti-explorer/issues/7592).
Worker: Codex, session `codex-pYtfSw`, 2026-10-11.
The bot [confirmed the claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7592#issuecomment-6104130586).
Branch: `codex-pYtfSw-induction-restriction-package`.
This continues merged checkpoint [#8662](https://github.com/CBirkbeck/tauceti-explorer/pull/8662),
which continued [#8659](https://github.com/CBirkbeck/tauceti-explorer/pull/8659).
Those handoffs retain the earlier calculation receipts. This note consolidates
the resumption requirements and supersedes the compiler counts.
Exactly one issue was claimed.

## Blocker and resumption gate

The accepted packet still has two unassigned prerequisite owners:

- `gaps[0]`, **Natural integral homological bridge — supplier unassigned**:
  arbitrary-coefficient integral UCT, its specified natural Ext injection
  and oriented evaluation; central-extension class map and homological
  five-term exactness; finite positive-degree homology consequences; the
  coprime degree-two edge, including its incoming d₃. Twelve targets need
  this bridge. The proposed continuation is explicitly an ownership
  question, not an existing dependency. Parent InductionRestriction Layer 7
  owns ordinary Schur covers, not this general bridge.
- `gaps[4]`, **Conjugacy of complements over a cyclic coprime quotient**:
  finite coprime H,C with C cyclic, and conjugacy by an element of H,
  without an abelian or solvable hypothesis on H.
  RS.5/admissible-inertia-classes needs it. Pinned complement existence
  supplies no conjugacy conclusion. The packet requires a finite-group
  owner to be assigned.

Issue #7592 says: “Change no packet; if the plan has a mistake, describe it
in the handoff note.” It permits only the package and this handoff.
Assigning owners in package prose would silently replace its authoritative
plan. PROTOCOL §§3, 15, 20 and UPSTREAM_GUIDE require named prerequisite
chains. Admitted native signatures specify their contracts but neither
prove them nor assign their owners in the accepted graph.
This checkpoint is caused by that scope blocker, not the eight-hour limit.

**Resume after a planning amendment confirms the following owners or names
actual alternative supplier layers.** Reconcile the packet and its source
documents before reconciling the package. Repeated package-only inventories
cannot resolve the same ownership decisions. Recommend suspending package
eligibility until that amendment; this worker changed no labels.

| Contract | Proposed owner and exact output |
| --- | --- |
| Native integral UCT | RS.1, before reduced covers: H²(G,A)→Hom(M(G),A), for arbitrary G and abelian A, with its oriented cycle formula, surjectivity and specified Ext¹(G^ab,A) injection. Preserve group and coefficient naturality of both maps. Add the definition, API and three tests already in the package. |
| Central extension class map and five-term exactness | RS.1, before `homology_image`: section-independent class-map construction and exactness of the full sequence through total-group and quotient abelianizations, for arbitrary abelian kernels. Preserve the sign convention and reuse Tau Ceti factor-set and Mathlib abelianization interfaces. Add construction and key-theorem nodes. |
| Finite integral homology consequences | RS.1, before `commutator_order`: `integral_homology_finite` and `integral_homology_card_smul` in positive degrees. Reuse current native transfer and trivial-group vanishing; use finite generation of integral bar chains for finiteness. Retain the three new degree tests. |
| Coprime degree-two edge | RS.5, before primary-kernel/compatible-cover results: `coprime_degree_two_edge`, with its coinvariant-kernel isomorphism and specified inclusion. Establish the native filtered-resolution input and the d₃ argument. RS.6 imports the result. Retain the three new edge tests. |
| Cyclic complement conjugacy | RS.5, before admissible inertia classes: `cyclic_coprime_complement_conjugacy`, finite coprime H,C and C cyclic, without solvability of H. Add its key-theorem node, Sylow induction and three existing conjugacy tests; or record the exact layer of an alternative finite-group owner. |

These are proposed amendments, not ownership assignments made here. Add the
necessary definition/theorem nodes and source locators, then replace the two
unassigned gap entries. All existing 109 targets and six layers remain.

`metadata.toml` remains absent deliberately. `issues.py`'s
`deliverables_complete` regards a package as complete once all output paths
exist, without checking prerequisite ownership. Adding metadata now would
misclassify this checkpoint. A direct call returns `False` for the current
four-output job. Add `topic = "math.GR"` only when the package meets §20.

## Changes in this session

The README already specified the full homological five-term sequence, but
Suggested stated exactness only at M(G). Three new native API signatures
complete its remaining arrows:

- `extension_class_map_exact_at_kernel`: the image of τ equals the kernel of
  `(Abelianization.of.comp S.inl).toAdditive`.
- `extension_class_map_exact_at_abelianization`: the image of that inclusion
  equals the kernel of `(Abelianization.map S.rightHom).toAdditive`.
- `extension_class_map_abelianization_surjective`: the last map is onto.

Only the first statement needs centrality. The last two use an arbitrary
extension with abelian kernel. The maps retain the specified inclusion and
projection; no private H₁ carrier or extra definition was introduced. This
spells out an existing package contract without assigning its missing owner.

Three new admitted examples, `extension_five_term_test_1` through `_3`,
distinguish the tail maps:

1. Every split central extension, including infinite kernels, has injective
   inclusion into total-group abelianization and surjective projection.
2. Every C₂→C₄→C₂ extension has injective kernel inclusion, while the final
   projection has a kernel of order two and is not injective. This holds
   despite the absence of a splitting.
3. For the specified D₈→C₂² extension, the kernel inclusion into abelianization
   is zero, the final projection is bijective, and τ is onto. The nontrivial
   central kernel is the commutator subgroup.

These are acceptance statements with admitted proofs. The README now names
the same API and tests and distinguishes the spectral-sequence deduction
from the free-total-group example used to illustrate it in the source.

Fresh primary-source reading: Löh, *Group Cohomology*, 30 July 2019,
[author notes](https://loeh.app.ur.de/teaching/grouphom_ss19/lecture_notes.pdf),
Theorem 1.4.1 pp.20–22, Theorem 3.2.12 pp.123–124, Remark 3.2.14 p.125,
and the proof of Theorem 3.2.18 pp.129–131. The full sequence for arbitrary
central extensions is a deduction from the low-degree filtration, not a
claim that Theorem 3.2.18 has an arbitrary total group. The cleared-source index was read.
No source passage or section-by-section source summary was added.

## Library and roadmap checks

Read-only TauCetiRoadmap main:
`070dc2becd74419e76303ede84b465ed4a69461f`.
Current read-only Tau Ceti:
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
InductionRestriction and SemisimpleAlgebras READMEs were read in full;
relevant AlgebraicTopology, ProfiniteCohomology and LocalGaloisGroups
interfaces were inspected. The reviewed library audit was read. It has no
direct Part II entry; R17.5/MP.1 describe projective lifting and factor-set
classification, not the general integral bridge.

- Current `TauCeti.groupHomology.transfer_comp_map_subtype_id`,
  GroupHomology/Transfer/Basic line 107, supplies transfer followed by
  inclusion as subgroup index times identity. Reuse it for annihilation.
  It is absent at the pin, so Suggested does not import that newer module.
- Mathlib `groupHomology.isZero_groupHomology_succ_of_subsingleton`,
  GroupHomology/Basic line 263, supplies the trivial-group vanishing.
  `H0IsoOfIsTrivial`, LowDegree line 892, supplies the degree-zero check.
  `Rep.FiniteCyclicGroup.groupHomologyIsoEven` and `groupHomologyIsoOdd`,
  FiniteCyclic lines 85 and 122, supply cyclic parity computations.
  These exact statements were read at the Mathlib pin.
- Current `TauCeti.ChainComplex.kronecker_bijective`,
  Algebra/Homology/Kronecker line 177, assumes injective coefficients.
  AlgebraicTopology Stage 6 plans singular UCT. Neither supplies the native
  arbitrary-coefficient group sequence needed here.
- ProfiniteCohomology's five-term interface is cohomological and explicitly
  excludes Hochschild–Serre. The inspected local-Galois interfaces do not
  supply the integral homological extension maps.
- Pinned `Subgroup.exists_right_complement'_of_coprime`,
  GroupTheory/SchurZassenhaus line 277, supplies existence only.
  ArithmeticStatistics ST.5's complement-conjugacy target assumes an
  abelian kernel, so it does not cover possibly nonabelian H.

No upstream roadmap or library was changed or built. No Lake command ran in
those read-only trees.

## Inherited obligations to retain

The existing package contains the specified native UCT Ext injection and
both naturality maps; its evaluation-kernel tests for C₂ with ℤ, ℤ² with
arbitrary abelian coefficients, and C₄ with C₂ must remain. Preserve the
oriented central-extension formula and its nonsplit C₄→C₂ counterexample.
The coprime edge still needs its explicit d₃ check. Preserve the cyclic
Sylow-induction proof and all three conjugacy tests, especially the inverse
conjugator for C₃⋊C₂ and the noncoprime diagonal counterexample.

Retain the previous checkpoint's two finite positive-degree homology
signatures and six tests. The positive-degree tests cover the trivial group,
C₂ parity, and the failure of finiteness/order annihilation in H₀. The
coprime-edge tests cover trivial quotient, C₃²⋊C₂ with inversion acting
trivially on the multiplier, and the extra tensor class when coprimality
fails for C₂×C₂. Their source and calculation receipts remain in #8662.

The accepted packet also records ordinary-cover input with a named parent
owner, finite table/order-96 certificates, and original signatures requiring
missing carriers. This session does not certify those inherited obligations
as discharged. All 31 row-certificate signatures and 38 RS.6 targets remain.
Retain oriented class maps, chosen projections and embeddings, centralizer
enumerations, actual relation subgroups and group-valued outputs. Rows 13/24
use affine sum kernels; 16/17 native SL₂(𝔽₃) graph/sum models; 22/23 Heisenberg
graph/sum models; 30/31 inverse transpose on SL₃(𝔽₂) and its full wreath model.
Earlier finite-certificate calculations were not rerun here. The ten accepted
source issues remain unchanged. Prior computation receipts and public-source
version hashes are in the handoff merged by #8659.

## Verification

- `lean-check research/blueprint/packages/InductionRestrictionPartII/Suggested.lean`:
  exit 0; 695 warnings, all `declaration uses sorry`; zero errors or other
  warnings. Preflight showed 97 GiB available. The check finished; no
  language server, library build, update or cache download was started.
- The helper uses Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.
  Mathlib source HEAD is `082e2d37e8b0463410cdb532e111cd43d5a66174`.
- Packet checker: exit 0, zero errors/warnings; 109 nodes, 124 API items,
  96 tests, 30 planets, 30 baseline declarations, five gaps, one request,
  six planned stages and zero closed stages. The packet is unchanged.
- All 109 target suffixes, 124 API suffixes and 96 test labels occur in both
  package files; all 32 definition/construction nodes have at least three
  tests. The three new API names and three new test labels occur in both files. This is correspondence
  coverage, not a mathematical audit of every inherited target.
- README: 159,497 bytes, below the 200 KB limit.
- Local intake file checks: three permitted changed files, zero problems.
  `git diff --check` passed.

| Artifact | SHA-256 |
| --- | --- |
| `packets/InductionRestrictionPartII.json` (unchanged) | `85af7815c4223c6b160f957e001598afb66ae1aaa84ddbea6995008ed72519c5` |
| `packages/InductionRestrictionPartII/README.md` | `6cd57a8e2f41f751f13a7858440f893a2a5abcf313c23725150e65b47159e982` |
| `packages/InductionRestrictionPartII/Suggested.lean` | `1ffdde971a3f1f8232519d48cabf0f0b9f1172a5c92c0ec2e6b2258a075fb959` |

No scratch artifact is needed to resume. No second job was claimed.
