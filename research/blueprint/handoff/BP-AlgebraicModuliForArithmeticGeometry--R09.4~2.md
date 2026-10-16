# Blocked checkpoint: BP-AlgebraicModuliForArithmeticGeometry--R09.4~2

**Codex (GPT-6), session codex-ieRCCS, 16 October 2026.** Issue
[#9301](https://github.com/CBirkbeck/tauceti-explorer/issues/9301).
**The revision is unfinished. No mathematical correction is claimed.**

The bot confirmed this session's claim in
[comment 6224997440](https://github.com/CBirkbeck/tauceti-explorer/issues/9301#issuecomment-6224997440),
responding to [claim 6224995341](https://github.com/CBirkbeck/tauceti-explorer/issues/9301#issuecomment-6224995341).
Earlier claim attempts on #9313 and #9330 lost to other sessions; neither
became this session's claim. #9301 was then the first eligible available issue
in the manager's ordered list. No second job was claimed.

## Blocker and required disposition

The maintainer's [13 October instruction](https://github.com/CBirkbeck/tauceti-explorer/issues/9301#issuecomment-6146996689)
stops further atlas blueprint rounds for this roadmap and directs changes to
the authoritative upstream pull request. Re-read the complete issue discussion
and that comment directly; no subsequent comment rescinds it. The checkpoint
merges [#9968](https://github.com/CBirkbeck/tauceti-explorer/pull/9968),
[#10015](https://github.com/CBirkbeck/tauceti-explorer/pull/10015),
[#10058](https://github.com/CBirkbeck/tauceti-explorer/pull/10058) and
[#10066](https://github.com/CBirkbeck/tauceti-explorer/pull/10066) released the
issue without resolving that instruction.

Rechecked upstream PRs and fetched the README at each immutable head below.
All three PRs remain open. The main roadmap's head is unchanged from the
preceding checkpoint; both supplier heads are also unchanged. Their
README hashes match the preceding handoff. The verified boundaries remain:

| Upstream README inspected | Relevant ownership boundary |
| --- | --- |
| [AlgebraicModuliForArithmeticGeometry #853, ceba5c798ace9c7aaa13b4f1732828187c904ce5, Scope and ownership](https://github.com/TauCetiProject/TauCetiRoadmap/blob/ceba5c798ace9c7aaa13b4f1732828187c904ce5/TauCetiRoadmap/AlgebraicModuliForArithmeticGeometry/README.md#scope-and-ownership) | This roadmap excludes the generalized elliptic and polarized abelian applications assigned to the historical R09.4 packet. Its generic representability and gerbe theory does not authorize continuing those applications here. |
| [ModularCurvesPartII #913, 0cfa5c512482c8155e5b9ed1bb711cb152bf6198, Scope and ownership](https://github.com/TauCetiProject/TauCetiRoadmap/blob/0cfa5c512482c8155e5b9ed1bb711cb152bf6198/TauCetiRoadmap/ModularCurvesPartII/README.md#scope-and-ownership) | AdicSpacesPartIII R2.11 supplies the generalized elliptic carrier, standard polygons, Tate family and fine compactified moduli on its stated representable range. ModularCurvesPartII supplies integral stack applications, contractions and bad-characteristic level structures. The carrier and its stack applications have distinct existing owners. |
| [AbelianSchemesAndArithmeticModuli #849, abd7847d2c511273d97a075e563de6608ec5a0f9, Scope and ownership](https://github.com/TauCetiProject/TauCetiRoadmap/blob/abd7847d2c511273d97a075e563de6608ec5a0f9/TauCetiRoadmap/AbelianSchemesAndArithmeticModuli/README.md#scope-and-ownership) | This roadmap owns relative abelian schemes, duality, polarizations, graph bundles, ample cohomology, full levels and polarized automorphisms. It excludes polarized moduli stacks, their level covers and compactifications, directing those to PELModuli, ShimuraVarieties and ShimuraCompactifications. Its characteristic-zero ShimuraVarieties reference does not establish an exact supplier for every integral stack target in the packet. |

These are verified roadmap ownership statements, not proofs or implementation
claims. In particular, the upstream list of other roadmaps is insufficient
to discharge all historical supplier obligations. PROTOCOL section 15 treats
open Tau Ceti roadmap PRs as existing work. Continuing the old arithmetic
assignment would contradict both its ownership rule and the maintainer's
instruction. Editing those authoritative upstream files is outside this
issue's deliverable paths.

**Next action:** the maintainer must retire or rescope this obsolete atlas
assignment, or explicitly authorize historical corrections with the current
upstream ownership reconciled. An available label or another merged checkpoint
does not establish that disposition. Workers may not change the queue, labels,
other packets or upstream roadmap files to resolve it themselves.

## Changes and preserved frontier

Only the first coverage `remaining` entry and this handoff change. The coverage
entry records this session's verification and confirmed claim. No upstream
head or mathematical contract changed since the previous checkpoint.
The packet and its sole stage, **AlgebraicModuliForArithmeticGeometry:R09.4**,
remain **partial**. The independent review remains **needs_changes**.
Every mathematical packet field, node ID and source finding is preserved;
the reader and suggested Lean file are unchanged.

| Item | Count |
| --- | ---: |
| Nodes | 33 |
| Constructions | 10 |
| Definitions | 3 |
| Theorems | 20 |
| API items | 68 |
| Definition/construction unit tests | 43 |
| Planets in this packet | 1 |
| Pinned baseline declarations | 12 |
| Mathematical gaps | 14 |
| Supplier requests | 21 |

The accepted A0-extension packet and its gerbe frontier remain untouched.
Neither its proofs nor this packet's inherited baseline citations were
recertified in this continuation.

## Mathematical resume worklist after disposition

The eight corrections in [the independent review](../reviews/REV-AlgebraicModuliForArithmeticGeometry--R09.4.md)
remain outstanding. They are historical correction targets, conditional on
resolving the ownership conflict above:

1. In `arith-standard-ngon`, synchronize arbitrary-ring smooth points with
   units times locally constant spectrum labels. Include the four-point
   control over F₂ × F₂ for n = 2, and distinguish connected-base labels.
2. Use the cyclic coequalizer and étale-local node charts, retaining both
   normalization flags and the irreducible-one-gon control; the split crossing
   is not a Zariski neighborhood of that node.
3. In `arith-contraction`, require Deligne–Rapoport semistability, including
   trivial relative dualizing bundle on the geometric genus-one fibres.
   Include the elliptic-core/rational-tail counterexample and synchronize
   the supplier request, theorem and bare-divisor example.
4. In `arith-elliptic-proper`, include singular generic polygons: after a
   finite extension split the polygon and extend it as a constant polygon.
   Keep the smooth-generic prescribed-component model obligation explicit.
5. In `arith-relative-dual`, use A0-extension's `relative-picard-sheaf`,
   `relative-picard-base-change` and `section-rigidified-picard`, rather than
   the nonexistent R09.1 Picard target. Keep arbitrary-base representability,
   Poincaré universality, biduality and base change separate from field results.
6. In `arith-local-ample-representatives`, distinguish the field square-root
   torsor from extending a chosen representative on an étale neighborhood.
   Preserve the exact approximation, compatible lifting and effectivity input.
7. Reconcile the field ample-cohomology, Riemann–Roch, degree-square and cubic
   very-ampleness obligations with the current existing owner. The historical
   JacobianChallenge reference did not state the required exports; #849 A2.4
   now expressly plans ample cohomology, Riemann–Roch and the degree formula.
   Check the exact supplier statements before replacing requests or gaps.
8. Synchronize source locators, source versions, the ledger of 14 gaps and
   21 requests, ownership, and validation statements throughout all files.

The review gives the exact statements, counterexamples, locators and node
verdicts. It did not require closing all fourteen openly recorded mathematical
gaps before synchronizing the reader. Its verification belongs to its author.

The confirmed RT-AREA-algebraicgeometry/1 and /17 findings remain unchanged.
Reconcile their single-owner stack and stable-pointed-moduli interfaces against
current upstream ownership before composing suppliers. In particular, the
historical StableReductionPartII references to generic R09.4 must be rewired
to the generic stack owner, and R09.5's requested finite surjective scheme
cover carries the pulled-back universal family without asserting étaleness
at wild primes. This checkpoint edits none of those suppliers.

## Evidence and validation

Read WORKERS.md, both protocols, UPSTREAM_GUIDE.md, the complete issue and
comments, the independent review, prior handoff, packet status and inventory,
and the reviewed R09.4 entry in `data/library-coverage.json`. Read the current
upstream READMEs' introductions and ownership sections above, and the read-only
main ModularCurves and StableReduction introductions, conventions and boundaries.
The inspected upstream main is `0d144d044dacebca17b654695b6f1ad58f159b27`;
the current Tau Ceti source tree is `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
Read the current field-valued `AbelianVariety` carrier and representative
ModularCurves and StableReduction signatures. These readings establish the
ownership boundary only; they do not recertify the historical pinned audit.
Neither tree was modified or built. No mathematical source proof or private
reference was newly certified, and no source passage is copied here.

The three fetched README SHA-256 digests are, respectively:

- AlgebraicModuliForArithmeticGeometry: `b4a7ca317a09dac2fd62fa702c2c58fed7602069472ba6b58b3ff08adf0651a9`.
- ModularCurvesPartII: `6f98748841c20ca0c898849b3293adf8f08650f5c44384671811c41737012c9b`.
- AbelianSchemesAndArithmeticModuli: `dc4a3d5d305fb7c0df8d7e0ea21357457c53397d0e62e664af4ffa4eabec97b2`.

The packet checker reports **0 errors and 0 warnings**. Structural comparison
confirms the first coverage obligation is the packet's only changed value;
reader and Lean hashes are unchanged. Allowed-deliverable and whitespace checks
pass. **Lean was not compiled in this continuation:** its file is unchanged
and the assignment is stopped before mathematical revision. The earlier
review's pinned elaboration result remains historical evidence only.
No scratch artifact is needed after submission.
