# REV-RS-04 — independent restructuring review

Reviewer: Codex — codex-a71f92

Job: REV-RS-04; Refs #807

Date: 2026-09-30

Verdict: **accepted after five in-place corrections**

This reviews [RS-04.result.json](../restructure/RS-04.result.json), its
[original report](../restructure/RS-04.md), and the
[family evidence](../restructure/RS-04.json). The original author is
ChatGPT Pro — cp-2109-rs04-f7c2, not this reviewer. Acceptance concerns
ownership, preservation and dependency structure under PROTOCOL §15. It is
not certification of source proofs, Lean implementations or an executable
blueprint.

## Inspection ledger and reproducibility

The audit base is `faffc6a92c8c4ef17d3db83f3284bb9b10c23230`.
The pre-submission refresh tested
`e5d1eedf1a19f7ac8b245cd999cb0eb6d5f8a97c`.
I personally read the complete proposal, original report and family file,
including all 132 evidence entries. I read these nine complete member
documents, including construction, acceptance and execution-status text:

| Document under content/campaign | Native stage descriptions checked |
| --- | ---: |
| AdelicAlgebraicGroups/README.md | 6 |
| AutomorphicFormsOnReductiveGroups/README.md | 7 |
| AutomorphicSpectralTheory/README.md | 7 |
| BorelRegulators/README.md | 10 |
| ComplexMultiplicationAndExplicitReciprocity/README.md | 7 |
| EulerSystemsAndKolyvaginSystems/README.md | 9 |
| FunctionFieldArithmetic/README.md | 8 |
| HeegnerPointEulerSystems/README.md | 12 |
| ShimuraVarieties/README.md | 10 |

I also read the three complete anchor documents under
`content/tau-ceti`: AlgebraicCurves (108,314 characters; 13 stages),
GlobalNumberFields (43,305 characters; 12 stages), and ModularForms
(128,933 characters; 16 stages). All 117 native stage descriptions (76
members, 41 anchors) were matched literally to their authoritative documents.
All twelve documents and the 73 reviewed member-audit entries were unchanged
at the refresh above.

I read the 73 complete member entries in
`data/library-coverage.json`, including targets, evidence and duplicate
notes, and the complete additional entries for ClassFieldTheory Layers
6–8/13, LocalFieldsRamification Layer 3, ModularForms Layer 0 and
FiniteFieldsAndCharacterSums FF.3. The family evidence was checked against
the member/anchor text; it is not itself a mathematical verdict.

Additional bounded supplier inspection: the ClassFieldTheory scope and
normalization introduction and complete Layers 6–8/13; the
LocalFieldsRamification standing scope and complete Layer 3;
ModularCurvesPartII R12.5/R12.6 and the uniformization/quotient comparison
inputs R12.1–R12.3; ShimuraData D3–D5; AbelianSchemesAndArithmeticModuli
A5/A6; and the complete FiniteFieldsAndCharacterSums document. This is not
a claim to have read the other supplier documents or their underlying
papers in full.

Library pins remain Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.
For the positive restricted-product topology claims, I personally inspected
Mathlib's pinned `Topology/Algebra/RestrictedProduct/TopologicalSpace.lean`:
`continuous_dom`, `topologicalSpace_eq_iSup`,
`isOpen_forall_mem`, `isOpenEmbedding_structureMap`,
`isTopologicalGroup`, and `locallyCompactSpace_of_group`, with their
filter, openness, local-compactness and eventual-compactness hypotheses.
These give topology, not a restricted Haar-product or Poisson theorem.
For other library availability statements I distinguish the reviewed audit
from a fresh declaration-level proof check. No new claim of implemented CM,
class-field, upper-ramification, Witt-classification or factorization
mathematics is made.

## Corrections applied

### 1. Resolve ClassFieldTheory Layer 13 to its native stage

The original supplier
`UPSTREAM:ClassFieldTheory/Layer13-norm-theorems-and-class-fields`
passes the format check as an upstream reference, but is not a native stage
in the atlas. The actual restructuring application skips its five links,
so the claimed ring-class-field handoff would not enter the dependency graph.

I replaced all occurrences with:

`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-13-norm-theorems-and-class-fields`.

This changes the owner, CM.3/HE.0 supplier lists and the five links to CM.3,
CM.5, CM.6, HE.0 and HE.1. Layer 13's quadratic-order scope is retained:
its Picard/Artin theorem does not prove arbitrary higher-degree CM-order
class fields. HE.0 explicitly keeps the K/F order/idele construction where
the supplier's scope stops. CM.3 still proves that its actual special values
generate the imported field, rather than treating abstract existence as a
class-polynomial theorem.

### 2. Import generic upper ramification; keep the Witt/completion work

FA.3 originally retained “remaining upper-numbering/conductor calculations”
without naming the general local upper-ramification owner. AlgebraicCurves
Layer 8 explicitly supplies lower numbering and a completion bridge; its
scope wall assigns Herbrand functions, upper numbering and Hasse–Arf to
LocalFieldsRamification Layer 3.

The latter applies to nonarchimedean local fields with finite residue field,
not just finite extensions of Q_p. Thus it applies to the function-field
completions after FA.3 proves the comparison and verifies the hypotheses.
The generic upper filtration, Herbrand tower/quotient laws and Hasse–Arf
now have that native owner, with explicit links to FA.3, FA.4, FA.5 and FA.7.

FA.3 retains the complete cyclic p-power Artin–Schreier–Witt classification,
its equivalence relations, the global-place/completed-local transport,
explicit function-field conductor calculations and certified wild examples.
Purely inseparable Frobenius extensions remain separate from separable
Galois covers. No Witt classification is inferred from the bare Witt-vector
carrier, and no completed-local comparison is erased.

### 3. Narrow FA.4 at the exact local reciprocity boundary

FA.4 was unchanged in the original proposal and still requested the local
reciprocity construction for F_{q^d}((t)). ClassFieldTheory Layer 6 owns
finite local class formation and reciprocity for nonarchimedean local
fields; Layer 7 owns the absolute local Artin map, its finite restrictions,
normalization, dense-image/kernel and conductor interfaces.

I added an explicit FA.4 narrowing, named these owners, and also imported
Layer 8's local existence/norm correspondence **only in its equal-characteristic
prime-to-p scope**. The source explicitly excludes equal-characteristic
p-primary existence and injectivity; its full local existence result is
mixed-characteristic, and its global theorem is for number fields.
A broad “CFT supplies FA.4” deletion would therefore lose real work.

FA.4 still proves missing p-primary local existence/norm correspondence and
the consequent full local correspondence/profinite-completion result,
using FA.3's Witt theory. It keeps the global function-field class-formation
proof, principal-idele triviality, localization compatibility, finite
abelian existence and norm correspondence, ray fields/conductors, and
the degree/constant-field Frobenius convention. The infinite statement
remains dense-image/profinite-completion, not an isomorphism from the
uncompleted idele class group.

Nine explicit links connect Layers 6–8 to FA.4 and both existing FA.4
consumers, FA.6 and FA.7. Local specialization compares the actual imported
Artin map; it does not construct a second generic map or assume an opaque
class formation.

### 4. Name the normalized j-function supplier, not nebentypus theory

ModularForms Layer 0 includes an independent low-level
`LevelOne.JInputs` package: normalized j = E4^3/Delta, invariance,
q-expansion, j−1728 = E6^2/Delta and elliptic-point order inputs.
The original report's dismissal of the ModularForms/CM.3 overlap in terms
of character spaces does not address this part of the anchor.

R12.6 supplies moduli/descent comparisons; it is not the normalized
j-function construction. CM.3 now names ModularForms Layer 0 as supplier,
with direct links to CM.3 and its consumer CM.5. Only the independent
j-input contract is imported, not an assertion that all higher nebentypus,
Riemann–Roch or dimension theory is needed for CM values.

CM.3 still constructs the finite product over proper ideal classes, proves
integrality, Galois equivariance and actual generation of the specified
class field, and checks admissibility of ray-level functions. CM.5 still
proves precision/height bounds and reduction/isogeny certificates.
The reviewed audit marks the j package absent at the pin; ownership is
a planned supplier, not a completed Lean theorem.

### 5. Give generic certified finite-field factorization one owner

FA.7's narrowed text still retained generic finite-field factorization.
FF.3 explicitly owns polynomial factorization algorithms and checked
factor/irreducibility certificates. Its reviewed audit distinguishes
noncomputable unique factorization from missing verified algorithms;
the existence of normalized factors is not the requested algorithm.

FA.7 now imports the FF.3 factorization-certificate contract through an
owner entry, suppliedBy and an explicit link. It retains place enumeration,
transport from a stated function-field input representation, ray-character
and conductor packages, L-polynomial and completion certificates, assembly
correctness, cost/randomness conventions and the end-to-end examples.
The existing FA.1 certified Riemann–Roch kernel and curve base cases remain
separate suppliers. FF.3's broader point-counting work is not silently
claimed to solve these arithmetic adapters.

## Target preservation and ownership audit

Every changed layer retains its original stable identifier. The following
ledger separates imported mathematics from the remaining new obligations;
it supplements the proposal's 55 ownership entries rather than replacing them.

| Narrowed layer | Imported owner/package | Remaining obligations |
| --- | --- | --- |
| AA.0 | pinned restricted-product topology | restricted Haar products, finite-set/measurable compatibility and Fubini under hypotheses |
| AF.0 | AA.3 height/reduction comparisons | actual test-function topology, growth, translations, derivatives and convolution estimates |
| AS.4 | AF.3 cuspidal rapid decay, square-integrability and multiplicity | residual/continuous terms, direct-integral completeness, surjectivity, Weyl factors and compatibility |
| R.6 | AA.2 measures; AA.3 finite-volume reduction | Bloch/Borel identities, actual groups and normalization conversions |
| CM.0 | GN11 order/Picard carriers; D3 reflex-field carrier | CM fields/types/reflex types, polarization and order restrictions, comparison linear algebra |
| CM.3 | GN11; native CFT13; MF0 j-inputs | class-polynomial integrality, special-value generation, admissibility and certified examples |
| HE.0 | GN11 and quadratic-order CFT13 | conductor towers, quotient maps, unit-corrected degrees, norm/level compatibility and K/F cases outside scope |
| HE.1 | CM.1 elliptic ideal/lattice construction; CM.2 reciprocity comparison | actual level structures, embeddings, descent, Jacobian/quotient maps, denominators and choice formulas |
| V0 | AA.3/AA.4 reduction and qualified approximation | Hermitian/effective-action transport, specified stabilizers and analytic component isomorphism |
| V1 | AA.4 underlying covers/Hecke squares | holomorphic transport, neat/effective deck groups and analytic composition |
| V5 | CM.0 type/reflex data; V4 torus reciprocity | main CM theorem, reduction/Frobenius, polarization/level action, algebraization after M3 and Siegel model |
| FA.0 | AC12 dictionary; AC0/1/2/6/8 | finite exact-constant specialization, normalization/degree transport and acceptance checks |
| FA.1 | AC3/4/5/9 divisor/RR/residue package | rational Picard comparisons, certified bases/linear algebra and no-rational-point acceptance |
| FA.2 | AA.0/topology; AC4/5/9 | completed adeles, discreteness/cocompactness, degree-zero idele compactness, self-dual Fourier/Poisson theory |
| FA.3 | AC6/7/8/10 and local ramification Layer 3 | full Witt classification, completion transport, explicit conductors and wild certificates |
| FA.4 | local CFT6/7; equal-characteristic prime-to-p CFT8 | missing p-primary local existence and full global function-field reciprocity |
| FA.7 | FA.1, AC1/3, FF.3 | place-enumeration adapters and larger certified arithmetic packages |

Other layers retain their document content and existing imports. In
particular, the original boundaries below survive:

- AF.1 relative Lie cochains and AF.1a differentiable/continuous cochains,
  van Est and invariant forms are distinct contracts. R.2 consumes these;
  its arithmetic/block-inclusion comparison is not a second generic
  van Est proof. The ALS.5 local-system comparison is not identified with
  Borel's stable primitive-class argument.
- AF.3 cuspidal finite multiplicity does not imply AS.4 spectral completeness.
  AS.6's general invariant trace formula is not the anchor's level-one
  Eichler–Selberg trace formula. Borel's stable ranks, integral regulator
  lattices and normalization identities are not removed by measure imports.
- V4 supplies the special-torus/reflex-norm carrier; V5 owns the difficult
  main CM theorem; CM.2 supplies its explicit normalized application.
  CM.0 remains before V5 and CM.2 after V5. A suppliedBy annotation on CM.0
  is not an automatic V4→CM.0 prerequisite: the retained CM-type definition
  does not require late torus reciprocity. The general pure-Shimura-datum
  endpoint and both towers are not replaced by PEL/abelian-type examples.
- ES owns generic finite/singular comparison, corrected derivatives,
  error-tolerant descent, primitivity and Iwasawa interfaces. HE owns actual
  geometric classes and congruences, local arithmetic errors and hypothesis
  verification, dyadic/CM exceptional cases, and Heegner nonvanishing.
  Higher-rank exterior-bidual/Gorenstein descent is not collapsed into rank one.
- HE.7s, HE.8c and the early HE.8 family/nonvanishing boundary remain as recorded.
  HE.8b owns the later reverse-divisibility/equality application; no source
  checkpoint or Howard/BCS hypothesis check is promoted to a completed proof.
- FA.5 retains Artin inertia factors and constants-sensitive Chebotarev,
  with the independent curve Weil input and genus/conductor hypotheses.
  FA.6 retains function-field reduction/finiteness and the split degree-center
  correction, not an imported archimedean Harish–Chandra proof. No number-field
  adelic arithmetic statement is silently generalized to function fields.

I found no reason to merge or retire these nine mathematically different
roadmaps. Every original link and ownership entry remains, except the
resolved CFT13 alias and the two clarified FA.3/FA.4 remaining-target labels.
Six additional owner entries account for the corrections. There are no
dropped, moved or retired layers.

## Anchors and Part II frontier

The proposal edits no Tau Ceti roadmap or stage. New outgoing prerequisite
links update graph consumer lists, not the anchors' mathematical content.
All 41 anchor stage payloads, apart from graph adjacency, are unchanged.

FunctionFieldArithmetic remains the sole extension, with the exact title:

> Algebraic curves — function fields, divisors, and Riemann–Roch, Part II: global function-field arithmetic

It extends the actual AlgebraicCurves roadmap. The first proposed link is
AC12's curve/function-field dictionary → FA.0. The extension imports the
anchor's places, divisors, completion-free repartitions, Riemann–Roch,
different/Hurwitz and comparison contracts. It adds completed adelic
analysis, the missing p-primary/local-global reciprocity work, function-field
automorphic finiteness and certified arithmetic. Algebraic repartitions are
not represented as completed analytic adeles; neither the Poisson theorem
nor Witt/class-field existence is discarded as “already in curves”.

## Checks run

The original format checker passed, but this did not catch the skipped
CFT13 alias or missing ownership imports. After correction:

1. `scripts/check_restructure.py` on the scratch proposal with its family
   file beside it: **pass**. Its underlying `check` also passed against
   the exact audit-base and refreshed native stage/roadmap universe.
2. Actual `scripts/restructure.py:apply_restructurings`, with the pinned
   repository source loaded in memory, applied to the 1,968-stage,
   3,508-edge snapshot: **pass**, both for RS-04 alone and for all 31
   already accepted proposals plus RS-04 in sorted promotion order.
3. Corrected proposal: 9 roadmap decisions, 17 narrowed layers, 55 owners,
   128 links. Each application installs **114 new RS-04 native edges**;
   eight proposed native edges already exist. **Zero native links are
   skipped** for missing endpoints or cycle closure.
4. All old edges and all stage ids are preserved; all 117 scope
   descriptions, statuses, parent/leaf identity and execution-status fields
   are unchanged. No RS-04 stage is hidden. Anchor payloads are unchanged
   except new adjacency. The exact Part II title/base and first AC12
   prerequisite were asserted.
5. Negative cycle-orientation checks assert that neither V4→CM.0 nor
   CM.2→V5 is introduced. Existing consumer edges are retained, including
   outside-family consumers; new supplier links forward the removed
   mathematics to the affected consumers described above.
6. The six Mathlib `UPSTREAM:` topology references intentionally remain
   non-native metadata and are the only skipped links. The §15 checker
   explicitly permits a library/source owner without a stage. They do not
   become six executable native stage dependencies. Their owner/supplier
   annotations and pinned source evidence remain available to blueprints.
   This differs from CFT13, where an actual native stage exists and the
   graph handoff was repaired.

The intake file-scope/JSON/private-path check passed for exactly the two
authorized deliverables (two files, zero problems).

These checks cover the actual restructuring application, not a full website
build or all other promotion overlays, and do not assert that pre-existing
global cycles have been eliminated. No Lean file is changed or generated;
Lean compilation is **not applicable**. No library, Lake or atlas build
was run.

## Questions and downstream obligations

No unresolved issue requires returning this structural proposal for another
author revision. The orchestrator can accept the corrected JSON. Subsequent
blueprint jobs must nevertheless verify complete primary proofs and exact
input/output signatures, especially the missing equal-characteristic
p-primary existence proof, Witt classification, completed Fourier theory,
CM-value integrality and algorithm certificates. A planned supplier is not
a proved theorem.

The stage-level graph is coarse: CM must select the independent MF0 j-input
contract, and FA.7 must select FF.3's factorization contract. If future
blueprints split those packages, their new leaf links must preserve these
contracts rather than importing unrelated higher theory. The six library
references need declaration-level blueprint dependencies because the
restructuring application cannot create native library stages. These are
execution/integration obligations, not lost targets or additional permission
to alter the immutable anchors.

### Handoff summary

Accepted RS-04 after five corrections: resolve native CFT13; import local
upper ramification; narrow FA.4 with the prime-to-p/p-primary boundary;
name the normalized j-input supplier; and import certified factorization
from FF.3. All nine member and three anchor documents, 117 native descriptions,
132 family evidence entries and reviewed member audits were checked.
The actual restructuring application accepts every native link, alone and
with all accepted proposals, preserving old edges, ids, descriptions and
statuses. No mathematical target or anchor content is removed; no Lean
formalization is claimed.
