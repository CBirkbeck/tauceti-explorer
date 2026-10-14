# BP-PotentialModularityAndCompatibleSystems--R24.5

Issue #9429. Worker: Codex, session codex-0Y1GxJ. This is a complete
target-level planning pass for R24.5, R24.5:operations and R24.6, submitted for
independent review. Each stage is **planned**, not proof-closed. No second job
was claimed.

No manager-priority issue was available at selection. Earlier fallback jobs
with upstream-authoritative maintainer instructions were skipped. The bot
[confirmed the claim](https://github.com/CBirkbeck/tauceti-explorer/issues/9429#issuecomment-6159399850)
for this available focus blueprint.

## Deliverables and reuse

The dedicated [packet](../packets/PotentialModularityAndCompatibleSystems--R24.5.json),
[reader](../readmes/PotentialModularityAndCompatibleSystems--R24.5.md) and
[suggested file](../suggested/PotentialModularityAndCompatibleSystems--R24.5.lean)
cover all three scoped stages. The accepted R24.3 packet already owns every
needed target. This pass introduces zero nodes and reuses 30: six definitions,
eight constructions, twelve theorems and four lemmas. Their 80 API items, 57
definition tests and ten planets remain with those identifiers. The reader
states every contract, API, test and proof sketch. The dedicated packet stores
30 exact import checks without creating another definition of these objects.

The supplied lift types and modularity-lifting proofs remain imports. This pass
introduces no deformation/patching target, and does not wait for
DeformationAndDerivedPatchingAlgebra. Sources routed to R23.* or R24.1–R24.4 in
the issue retain those owners; their field selection, deformation finiteness,
point extraction and prescribed lift constructions are outside this scope.

## Mathematical checks and owner handoffs

- Common continuous arithmetic family carriers precede all eigenform and
  potential-modularity instances. Preserve the RT-AREA-langlands-2/10 owner
  proposal: R24.5:operations owns the language, R19.3 constructs eigenform
  instances and R34.6 owns geometric eigenform purity. No graph file is edited.
- KW plain/almost strict, DP almost strict, BLGGT weak and BLGGT strict have
  distinct coefficient-prime conditions. The reader fixes both Frobenius and
  Hodge signs, and uses the R19.2 normalization dictionary for duals/twists.
- The Brauer construction needs the lambda-independent finite overlap Hom
  character to obtain norm one. The accepted R17.6 compatible-descent export
  handles a cyclic character fibre, but does not by itself supply this exact
  Mackey overlap theorem. Degree two alone is insufficient.
- Full R19.5 Skinner compatibility gives all-place strictness at reducible
  residual members and at two, without a degree or discrete-series guard.
  Historical KW almost strictness remains a separate theorem. These preserve
  RT-AREA-langlands-2/30.
- The general Hilbert local purity theorem already has the exact planned
  R19.3/monodromy-weight-purity-of-the-family node. The existing geometric
  R34.6/hilbert-local-monodromy-weight-export has Saito's degree/discrete-series
  restrictions. Preserve those guards and align the requested unrestricted
  R34.6 owner export with the existing R19.3 theorem; do not substitute the
  restricted theorem for the general one.
- The full DP Theorem 1.11 remains wider than R23.4's A/B/C scope. This pass adds
  the exact request to R23.4 for other weight-two potentially Barsotti–Tate types
  and arbitrary regular de Rham lifts. Naming this request does not establish
  it. The narrower Dieulefait 2004 theorem is not used outside its hypotheses.
- Savitt Corollary 6.15 and Remark 6.17 are independently read and collated with
  the corrected author copy. Their odd-prime tame nonscalar semisimplification
  does not certify an unrestricted nonsplit lattice classification. Keep the
  R15.4/R07.3 ordered extension and finite-flat adapter, and KW's separate
  dyadic argument.
- R24.6 imports modern transfer solely from R32.6, including its small-prime
  guards (RT-AREA-langlands-2/21). Cofinite rank-two residual irreducibility over
  the rationals and general-rank density-one irreducibility remain separate.
- Use v4/published BLGGT Gamma factors and keep the pointwise nonzero guard in
  the Lean cancellation example. The general semisimple coefficient-descent
  criterion needs the split-eigenvalue hypothesis; the accepted absolutely
  irreducible full-span R01.5 export alone is too narrow.

## Remaining proof obligations

Eight explicit gaps and 21 exact supplier requests are recorded. Three
requests consume existing upstream interfaces; the other eighteen remain
open for arithmetic realization or the specified stronger export. The eight
gaps concern:

1. Savitt-to-Serre weights and the ordered wild/finite-flat adapter.
2. Unread Gee input and the limits of the Dieulefait 2004 scope.
3. Original common-component/Sen inputs and general semisimple coefficient
   descent.
4. Original Larsen/Larsen–Pink, Bogomolov, Serre, Conrad–Chai–Oort and
   Bruhat–Tits proof leaves.
5. Arithmetic carriers needed for the full Lean signatures.
6. The exact Brauer overlap Hom-character theorem.
7. Potential modularity beyond R23.4's lift types for full DP Theorem 1.11.
8. The unrestricted Hilbert purity owner export versus the guarded geometric
   Saito theorem.

For each obligation the packet names its consumers and exact owner. A
follow-up must discharge these exports and source leaves and then close the
corresponding coverage records. It must preserve the existing identifiers and
update the assembled roadmap contracts without creating duplicate targets.

## Sources and library checks

This session independently read the applicable KW I/II statements and Brauer
proof; Khare's level-one Proposition 3.1; Taylor's family/reducibility argument;
BLGGT v4 definitions and the complete density/theta/integral-model arguments,
polarization and constituent lemma, Grothendieck formalism and coefficient
splitting lemma; selected published BLGGT counterparts; DP's family definition,
Theorem 1.11, residual lemma and Paso 5; the narrower Dieulefait 2004 theorem;
Skinner's theorem/conventions and selected proof paragraphs; ACC+ family
variants and rank-one/Artin purity; Swinnerton-Dyer's Delta exceptional-prime
computation; and Savitt's residual classification and scope remarks. Exact
sections, editions, URLs, dates and public-file hashes are in the packet.
Skinner's complete proof and original monodromy/integral-model references are
owner imports, not claimed independently verified. No private source text or
source passages enter the deliverables. Existing E1–E5 source issues are
referenced, not duplicated.

Sixteen pertinent baseline declarations were checked at Mathlib
082e2d37e8b0463410cdb532e111cd43d5a66174, with Tau Ceti pinned to
f790474821cf4256814db967cb154e7af3d0c369. The current read-only roadmap main
0d144d044dacebca17b654695b6f1ad58f159b27 and Tau Ceti current main
a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 were also searched for overlap.
The current LocalGaloisGroups, ProfiniteArithmetic, InductionRestriction,
SemisimpleAlgebras, GlobalNumberFields and relevant class-field/integral-Hecke
contracts were read. Existing mathematics is imported. No build was run in
those read-only trees.

## Validation

- The blueprint checker reports zero errors and zero warnings.
- Submission intake path/content checks report zero problems for all four
  deliverables.
- The compact 88-line suggested file elaborates through lean-check at the pins,
  with eleven expected declaration-use warnings for its eleven statement
  proofs and no other warnings or errors. It contains no data definition,
  arithmetic stand-in or theory development.
- A separate contract inventory verifies all 30 reused identifiers, all cited
  source IDs, exact node prerequisite IDs, the 80 API entries and 57 definition
  tests against the reader; all full arithmetic signature omissions are listed.
- Whitespace validation passes. Scratch sources are removed after opening the
  pull request; this handoff and the packet retain the needed provenance.
