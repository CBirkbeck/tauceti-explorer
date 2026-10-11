# PKG-InductionRestrictionPartII — blocked checkpoint

Issue [#7592](https://github.com/CBirkbeck/tauceti-explorer/issues/7592).
Worker: Codex, session `codex-dQ202u`, 2026-10-11.
The bot [confirmed the claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7592#issuecomment-6103795959).
Branch: `codex-dQ202u-induction-restriction-package`.
This continues merged checkpoint [#8659](https://github.com/CBirkbeck/tauceti-explorer/pull/8659).
Its handoff retains the earlier session receipts; this note consolidates the
resumption requirements and supersedes the compiler counts.
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
| Central extension class map and five-term exactness | RS.1, before `homology_image`: section-independent class-map construction, the full extension diagram and exact image/kernel theorem for arbitrary abelian kernels. Preserve the sign convention and reuse Tau Ceti factor-set interfaces. Add construction and key-theorem nodes. |
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

The general finite-homology consequences now have explicit native signatures,
using `groupHomology (Rep.trivial ℤ G ℤ) (n + 1)`. The successor degree prevents
an accidental degree-zero assertion. The README separates the transfer
annihilator from the finite-generation input needed for finiteness.

Three new admitted examples test these consequences:

1. A trivial group has zero homology in every positive degree.
2. C₂ has cardinality-two integral homology in odd degrees and zero homology
   in positive even degrees. Reuse the existing cyclic resolution interfaces.
3. H₀(C₂,ℤ) is infinite, and twice the class of 1 is nonzero.

Three more examples test the coprime edge using actual multiplier maps:

1. For trivial quotient Γ, the inclusion map induces a bijection.
2. For C₃²⋊C₂ with inversion action, the action on M(C₃²) is the identity,
   the inclusion induces a bijection, and the total multiplier has order
   three. Inversion on both basis vectors acts by determinant +1 on their
   exterior product. Using inversion on the multiplier would kill it.
3. With trivial action on C₂×C₂, the total multiplier and the projection
   kernel have order two, while inclusion from the first factor is not
   surjective. The mixed H₁ tensor class detects missing coprimality.

These conclusions follow from the integral product formula, cyclic integral
homology, and the displayed coprime-edge argument. They are acceptance
statements, not new formal proofs. Two declarations and six admitted examples
were added; no new carrier, transfer theory or cyclic resolution was planned.

Fresh primary-source reading: Löh, *Group Cohomology*, 30 July 2019,
[author notes](https://loeh.app.ur.de/teaching/grouphom_ss19/lecture_notes.pdf),
Corollary 1.6.13 p.49; Theorem 1.7.15 p.64; §3.2.5, Theorem 3.2.22 p.135
and Corollary 3.2.23 pp.136–137. The product calculations and induced action
are deductions stated in our own words. The cleared-source index was read.
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
  exit 0; 689 warnings, all `declaration uses sorry`; zero errors or other
  warnings. Preflight showed 101 GiB available. The check finished; no
  language server, library build, update or cache download was started.
- The helper uses Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.
  Mathlib source HEAD is `082e2d37e8b0463410cdb532e111cd43d5a66174`.
- Packet checker: exit 0, zero errors/warnings; 109 nodes, 124 API items,
  96 tests, 30 planets, 30 baseline declarations, five gaps, one request,
  six planned stages and zero closed stages. The packet is unchanged.
- All 109 target suffixes, 124 API suffixes and 96 test labels occur in both
  package files; all 32 definition/construction nodes have at least three
  tests. All six new test labels occur in both files. This is correspondence
  coverage, not a mathematical audit of every inherited target.
- README: 157,618 bytes, below the 200 KB limit.
- Local intake file checks: three permitted changed files, zero problems.
  `git diff --check` passed.

| Artifact | SHA-256 |
| --- | --- |
| `packets/InductionRestrictionPartII.json` (unchanged) | `85af7815c4223c6b160f957e001598afb66ae1aaa84ddbea6995008ed72519c5` |
| `packages/InductionRestrictionPartII/README.md` | `de85a9b3a5431bef19520598a1cee7ef5543ac8036b7559e40b21158652ecfdd` |
| `packages/InductionRestrictionPartII/Suggested.lean` | `9db96d1277b860e03ca501009ae735acaabdb693e1261a418267dea818869b76` |

No scratch artifact is needed to resume. No second job was claimed.
