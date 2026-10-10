# PKG-InductionRestrictionPartII — blocked checkpoint

## Current session: codex-kpOXkh

Issue [#7592](https://github.com/CBirkbeck/tauceti-explorer/issues/7592).
Worker: Codex (GPT-6), session `codex-kpOXkh`, 2026-10-10.
The bot [confirmed this claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7592#issuecomment-6103179816).
This continues merged checkpoint [#8638](https://github.com/CBirkbeck/tauceti-explorer/pull/8638).
None of the manager's forty priority issues was available in the initial
open `swarm`/`state:available` query. This was the first eligible package in
the permitted fallback order. Exactly one job was claimed.

### What changed

The native UCT specification now includes the canonical Ext injection that
its README already required. The inherited Lean exactness statement asserted
only that some injection existed with the right range. It gave no map to
which the required naturality identities could refer.

- `IntegralUCTExt` abbreviates the actual Mathlib derived Ext carrier, with
  Additive(G^ab) in its opposite first argument and A in its second argument.
- `integral_uct_ext_inclusion` is a specified additive homomorphism into
  native `groupCohomology.H2 (Rep.trivial ℤ G A)`. Its API states injectivity,
  equality of its range with the evaluation kernel, and naturality under
  group pullback and coefficient pushforward, using the existing Ext
  bifunctor and native cohomology maps. There are no finiteness or injective
  coefficient assumptions. `integral_uct_evaluation_exact` now uses this
  same injection rather than an existentially chosen map.
- Three admitted examples test the nonzero integral Ext contribution for
  C₂ with coefficients ℤ; the zero Ext contribution for ℤ² with arbitrary
  abelian coefficients; and a nonzero evaluation-kernel class for C₄ with
  coefficients C₂. These exercise native carriers, not placeholder predicates.
- README gives the construction through free integral bar chains, the H₁
  abelianization identification, and the projective-resolution comparison
  with Mathlib's Ext. It adds the corresponding API, tests and source locators.

Fresh primary-source readings supporting this change were Hatcher,
*Algebraic Topology*, §3.1, Theorem 3.2 and its Ext computations/naturality,
printed pp.195–196 ([author PDF](https://pi.math.cornell.edu/~hatcher/AT/AT.pdf)),
and Löh, *Group Cohomology* (30 July 2019), Theorem 1.4.1 pp.20–22 and
Corollary 1.6.9 p.47 ([author notes](https://loeh.app.ur.de/teaching/grouphom_ss19/lecture_notes.pdf)).
The pinned `Ext` definition and `CategoryTheory.ProjectiveResolution.isoExt`
were inspected directly. Statements and construction routes are in our own
words. No source passage was added to the repository.

### Why completion is blocked

The accepted source-of-truth plan still leaves two prerequisite owners
unassigned. Issue #7592 restricts edits to the package and this handoff and
explicitly says: "Change no packet; if the plan has a mistake, describe it in
the handoff note." A package that silently assigns these inputs to a layer
would contradict that plan. PROTOCOL sections 3, 15 and 20 and UPSTREAM_GUIDE
require the missing mathematics to be actual targets with named owners.

The two entries were inspected directly:

- `gaps[0]`, **Natural integral homological bridge — supplier unassigned**:
  arbitrary-abelian-coefficient native integral UCT, its natural Ext injection
  and oriented evaluation; the central-extension class map and homological
  five-term exactness; finite positive-degree homology consequences; and the
  coprime degree-two LHS edge including the incoming d₃. Twelve targets need
  these inputs. The packet explicitly says its proposed continuation is an
  ownership question, not an existing stage or dependency. Parent
  InductionRestriction Layer 7 owns ordinary covers only.
- `gaps[4]`, **Conjugacy of complements over a cyclic coprime quotient**:
  conjugacy by an element of H for finite coprime H,C, with C cyclic and
  without an abelian or solvable hypothesis on H. RS.5/admissible-inertia-classes
  needs this input. The packet explicitly requires a general finite-group
  owner to be assigned.

The accepted review retains five gaps and one request; all six stages are
`planned`, none `closed`. The ordinary-cover request has a named parent owner.
The finite-certificate and original-signature obligations remain recorded.
This session does not certify that they have been discharged. Admitted Lean
signatures specify planned mathematics; they neither prove it nor assign
its owner in the authoritative graph. This checkpoint is caused by the scope
blocker, not the eight-hour limit. `metadata.toml` remains absent.

### Fresh supplier checks

Read-only TauCetiRoadmap main is
`070dc2becd74419e76303ede84b465ed4a69461f`; current Tau Ceti is
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
InductionRestriction and SemisimpleAlgebras READMEs were read in full. Current
roadmap/library searches and direct statement inspection found no matching
owner contract:

- AlgebraicTopology Stage 6 plans singular UCT. Current
  `TauCeti.ChainComplex.kronecker_bijective` (Algebra/Homology/Kronecker,
  line 177) assumes `[Injective Y]`, and `TopCat.singularKroneckerEquiv`
  (AlgebraicTopology/Cohomology/Kronecker, line 85) assumes `[Injective M]`.
  These do not supply the arbitrary-coefficient native group sequence.
- ProfiniteCohomology explicitly excludes Hochschild–Serre; its cohomological
  five-term sequence does not supply the required homological extension maps.
- Current `TauCeti.groupHomology.transfer_comp_map_subtype_id`
  (GroupHomology/Transfer/Basic, line 107) supplies transfer followed by
  inclusion as subgroup index times identity. Reuse it for annihilation;
  do not plan another transfer theory.
- Pinned Mathlib `Subgroup.exists_right_complement'_of_coprime`
  (GroupTheory/SchurZassenhaus, line 277) concludes existence, not conjugacy.
  ArithmeticStatistics ST.5's complement-conjugacy target assumes an abelian
  normal subgroup. It does not supply this possibly nonabelian H case.
- The reviewed library audit has no direct Part II entry. The parent's
  R17.5/MP.1 entries describe projective lifting and factor-set classification,
  not these two general contracts.

The previous checkpoint's additional candidate exclusions and the substantive
ownership amendment below remain applicable. No library or upstream roadmap
was modified, and no Lake command was run in the read-only checkouts.

### Verification

- Final `lean-check research/blueprint/packages/InductionRestrictionPartII/Suggested.lean`:
  exit 0, 678 warnings, all `declaration uses sorry`, zero errors or other
  diagnostics. The inherited file had 670 such warnings; the eight additional
  warnings are the new map, four API lemmas and three examples. Preflight
  showed 94 GiB available. The check finished. No language server, library
  build, update or cache download was started.
- The shared helper identifies its Tau Ceti build pin as
  `f790474821cf4256814db967cb154e7af3d0c369`; Mathlib source HEAD was
  independently read as `082e2d37e8b0463410cdb532e111cd43d5a66174`.
  Successful elaboration validates signatures, not proofs or ownership.
- `python3 scripts/check_blueprint.py research/blueprint/packets/InductionRestrictionPartII.json`:
  exit 0, zero errors and warnings; 109 nodes, 124 API items, 96 tests,
  30 planets, 30 baseline declarations, five gaps, one request, six planned
  stages and zero closed stages.
- Fresh name inventory found all 109 target suffixes, 124 API suffixes and
  96 test labels in each package file. All 32 definition/construction nodes
  have at least three tests. This is a correspondence check, not a new
  mathematical audit of all 109 statements.
- `python3 research/blueprint/intake.py check-files` on the two changed package
  files and this handoff: three allowed files, zero problems.
  `git diff --check` passed.

### Artifact receipts

The packet is unchanged; the two package files changed as described above.

| Artifact | SHA-256 |
| --- | --- |
| `packets/InductionRestrictionPartII.json` | `85af7815c4223c6b160f957e001598afb66ae1aaa84ddbea6995008ed72519c5` |
| `packages/InductionRestrictionPartII/README.md` | `f0316dd9934aaaab2375b34590a31e58042f26788d82ad9c3d19ea8770ee869b` |
| `packages/InductionRestrictionPartII/Suggested.lean` | `6dab88e81c6fa9cf03ee44c8f82e5ec3cd87809eb52fa757bb4e6bc9f5cbb137` |

### Resumption gate

First confirm the five contract owners proposed below, or name actual
alternative owner layers, and reconcile the accepted packet and its source
documents. Then reconcile the package, retaining the now-specified natural
Ext injection, complete the remaining native interfaces/certificates to the
package standard, and add exactly `topic = "math.GR"` in metadata.toml.
A theorem awaiting implementation differs from a prerequisite without an owner.

**Queue recommendation:** suspend package eligibility until this amendment
is made. Another package-only run cannot amend the unchanged authoritative
plan. No label was changed here. The inherited mathematical proof routes,
source receipts and finite-model notes are preserved below; those calculations
were not rerun. The current verification results above supersede its older
compiler counts and its earlier existential-only Ext warning. No scratch
artifact is needed to resume.

## Inherited implementation record — session codex-pCwOIS

Issue #7592. Worker: Codex (GPT-6), session `codex-pCwOIS`, 2026-10-10.
The [claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7592#issuecomment-6101646310)
was [confirmed by the bot](https://github.com/CBirkbeck/tauceti-explorer/issues/7592#issuecomment-6101647425).
This continues the merged checkpoint
[#8585](https://github.com/CBirkbeck/tauceti-explorer/pull/8585).
One job was claimed. This is a blocked submission, not a completed package or
an eight-hour timeout. No permission question is pending.

## What changed

The unnamed input contracts now have explicit native interfaces, sources,
proof routes and tests in the package. These specify the mathematical inputs
already required by the accepted plan; they do not assign their suppliers.
No packet, reader, original suggested file, library or other roadmap changed.
`metadata.toml` remains absent so intake treats this as a checkpoint.

A mathematical error in the inherited README is corrected: the Ext term is
in the kernel of the UCT **evaluation map**
H²(G,A)→Hom(H₂(G,ℤ),A), not the kernel of the single extension's class map
H₂(G,ℤ)→A. These kernels belong to different carriers. The C₂/ℤ and C₄→C₂
examples distinguish them.

The added interfaces are:

- `integral_uct_evaluation`: pairing on the existing native homology and
  cohomology carriers, with the finite-sum cycle formula, naturality in the
  group and coefficients, the actual Mathlib Ext carrier in its exactness
  statement, and bijectivity when the abelianization is free over ℤ.
  Its three tests cover the cyclic Ext kernel, positive/negative orientation
  with infinite coefficients, and a nonzero torsion-coefficient evaluation.
- `extension_class_map_section`, `extension_class_map_natural`,
  `extension_class_map_five_term` and `extension_class_map_split`: section
  formulas, specified maps of extensions, full image/kernel equality, and
  the consequence of a homomorphic section. Three tests cover arbitrary
  split kernels, the nonsplit C₄ extension with zero evaluation, and the
  specified D₈ extension with nonzero evaluation.
- `coprime_degree_two_edge`: the coinvariants of the specified Γ-action on
  H₂(H,ℤ) identify the actual kernel of the semidirect-product projection's
  homology map. The formula retains the native H-inclusion. Its README proof
  checks the incoming d₃ as well as d₂: the relevant source and target are
  killed by coprime group orders, so Bézout forces the differentials to zero.
- `cyclic_coprime_complement_conjugacy`: a subgroup whose projection to the
  cyclic complement is bijective is conjugate to the standard complement
  by one element of H. The README gives a Sylow induction that does not
  assume H solvable, and shows how it applies to an equal-order lift.

The generic transfer construction is explicitly reused from current Tau Ceti,
not proposed again. AlgebraicTopology's singular UCT and topological transfer
remain in its existing stages. The native group/bar adapters are still the
unassigned part of the homological contract.

## Why completion is blocked

The source-of-truth packet explicitly records:

1. **Natural integral homological bridge — supplier unassigned.** This
   includes arbitrary-abelian-kernel UCT, oriented evaluation, central-extension
   homological five-term transgression, finite homology consequences and the
   coprime degree-two reduction. The parent Layer 7 is expressly excluded as
   a supplier of the general bridge.
2. **Conjugacy of complements over a cyclic coprime quotient.** Its entry
   requires a general finite-group owner to be assigned. Pinned Mathlib's
   Schur–Zassenhaus statements supply existence, not conjugacy.

The package issue makes that accepted plan the source of truth, limits edits
to the package and handoff, and directs plan mistakes to the handoff rather
than permitting packet changes. PROTOCOL §20 requires named prerequisite
chains; UPSTREAM_GUIDE requires a missing key theorem to be an actual target
here or in an identified supplier. Native admitted signatures and mathematical
proof routes settle the required statements, but do not amend target ownership
in the accepted graph. These two decisions cannot be completed in the allowed
files without silently replacing the source-of-truth plan.

## Concrete planning amendment to consider

The following is a proposal for a planning worker, not an ownership assignment
made by this submission. It keeps the existing six layers and all 109 targets.

| Contract | Proposed location and exact output |
| --- | --- |
| Native integral UCT evaluation | RS.1, before reduced covers: H²(G,A)→Hom(M(G),A), natural in arbitrary G and A, with kernel Ext¹(G^ab,A), surjectivity and the displayed oriented cycle formula. Add a definition node with the API and three tests now in the package. |
| Central extension class map and five-term exactness | RS.1, before `homology_image`: the section-independent class-map construction and exact image/kernel theorem, for arbitrary abelian kernels. Keep the full extension diagram and sign convention. Add the construction and key-theorem nodes, reusing Tau Ceti's factor-set interfaces. |
| Finite integral homology consequences | RS.1, before `commutator_order`: finiteness and order annihilation in positive degrees. Reuse current native transfer and trivial-group vanishing; use finite generation of the bar complex for finiteness. Do not create a second transfer theory. |
| Coprime degree-two edge | RS.5, before primary-kernel/compatible-cover results: the coinvariant-kernel isomorphism in `coprime_degree_two_edge`, including its specified inclusion and the d₃ argument. Establish its native filtered-resolution input rather than citing an unnamed LHS supplier. RS.6 then imports this output. |
| Cyclic complement conjugacy | RS.5, before admissible inertia classes: `cyclic_coprime_complement_conjugacy` with finite coprime H,C and C cyclic, without solvability of H. Add the key-theorem node and its Sylow induction. If another finite-group owner is selected, record its exact layer instead. |

A planning amendment must confirm these owners or name actual alternative
supplier layers, add the necessary key-definition/theorem nodes and source
locators, and replace the two unassigned gap entries. The source documents
must be reconciled as that amendment requires. The original Suggested exactness
prototype stated existence of an Ext injection with the correct range, while
README required its canonical natural identification. Session codex-kpOXkh
replaced that prototype with a specified injection and both naturality maps,
as recorded above. Those signatures must be retained in the eventual supplier
contract; they do not themselves assign its owner.

## Verification

- Final `lean-check research/blueprint/packages/InductionRestrictionPartII/Suggested.lean`
  exited 0 with 670 warnings, all `declaration uses sorry`; no errors or other
  warnings. The preflight had 99 GiB available. No language server, library
  build, update or cache download was started.
- `python3 scripts/check_blueprint.py research/blueprint/packets/InductionRestrictionPartII.json`
  exited 0 with zero errors and warnings. The unchanged packet has 109 nodes,
  124 API items, 96 tests, five gaps, one request, six planned stages and zero
  closed stages. Successful syntax checking is not prerequisite closure.
- All 109 target names, 124 API names and 96 test labels occur in README and
  Suggested, compared by last namespace component. Suggested has 556 distinct
  named declarations including 12 named instances, and 210 anonymous examples.
  This run adds 12 named declarations and six examples. README is 151,274 bytes,
  below the 200 KB limit. Inventory is name coverage, not semantic certification.
- Independent arithmetic checked the coordinate cocycle identity on all 64
  triples in C₂² and 15,625 lattice triples in the box [-2,2]²; the ordered
  evaluations are 1 and −1. The normalized C₂ bar matrices are d₂=[2], d₃=[0],
  giving H₂(C₂,ℤ)=0 and H²(C₂,ℤ)=ℤ/2.
- Exhaustive multiplication, inverse and associativity checks on the affine
  semidirect groups C₃⋊C₂ and C₅⋊C₄ verified H-conjugacy of all equal-order
  lifts (4 and 16 including identity). A nonabelian check used Heisenberg₂₇
  with (a,b,z)↦(−a,−b,z): all nine outside involutions are H-conjugate to the
  standard C₂ lift. Distinct complements in C₂×C₂ fail conjugacy, confirming
  the coprimality hypothesis. These finite checks supplement the proof route;
  they do not prove the general theorem or the admitted Lean examples.
- `git diff --check` and the local swarm file checks pass. Only three allowed
  deliverable/handoff paths change; metadata is intentionally absent.

## Upstream and sources

Current roadmaps were read at `81207c7f16d5abf770f13a7d2bdcdb465c030787`,
current Tau Ceti at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`.
InductionRestriction and SemisimpleAlgebras READMEs were read in full, with
AlgebraicTopology's relevant interfaces inspected. The reviewed library audit
has no direct Part II entry. The parent's Layer 7 retains ordinary covers;
AlgebraicTopology Stage 6 owns singular UCT, Stage 5 topological transfer.
Current `TauCeti.groupHomology.transfer_comp_map_subtype_id` gives transfer
followed by inclusion as index times identity. Its exact statement was read;
it is absent from the pinned build and is therefore not imported into Suggested.
The Lean check uses Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369` and
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`.

The cleared-source index was consulted. The added citations use authors'
public copies, accessed 2026-10-10; no source text is copied into the repository.

| Source | Reading and locator | SHA-256 |
| --- | --- | --- |
| Hatcher, *Algebraic Topology*, [author PDF](https://pi.math.cornell.edu/~hatcher/AT/AT.pdf) | §3.1 Theorem 3.2 and naturality, printed pp.195–196; free-chain UCT with arbitrary coefficients and nonnatural splitting | `bebb3032bf9021b956da3bd070eb6c67dc662cf849be9cdf6679f677560e5618` |
| Löh, *Group Cohomology*, 30 July 2019, [author notes](https://loeh.app.ur.de/teaching/grouphom_ss19/lecture_notes.pdf) | Corollary 1.6.9 p.47; Theorem 1.7.15 p.64; Theorem 3.2.12 pp.123–124, Proposition 3.2.13 pp.124–125 and Remark 3.2.14 p.125 | `d4f2d819bfa85c57277db74bf749d05f03e85833c76e89eab99127f077d2cd76` |
| Conrad, *The Schur–Zassenhaus theorem*, [author PDF](https://kconrad.math.uconn.edu/blurbs/grouptheory/schurzass.pdf) | Example 2 p.1 states cyclic existence; Remark 5 p.4 states conjugacy. The note omits its proof, so the cyclic Sylow induction is supplied explicitly in the package. | `7294dabc64a607186d96ee39bed942d78873c4408327c971c617fdc397ec0805` |

Wood (2021), §2 pp.2–4 and §4 pp.6–7 were also read. Its arbitrary-kernel
application and the inherited generating hypotheses are retained. The ten
accepted source issues remain unchanged. Public notes proving conjugacy only
for abelian Hall kernels or for solvable total groups were not used to justify
the required theorem for a possibly nonabelian, nonsolvable H.

## Where to resume

First make the ownership amendment above. Do not spend another package-only
run repeating the signature inventory while the same suppliers remain unnamed.
Then reconcile the package against the amended graph and add
`topic = "math.GR"` in `metadata.toml` when §20 is met.

All 31 row-certificate signatures and 38 RS.6 targets remain. Preserve their
oriented class maps, chosen projections and embeddings, centralizer enumerations,
actual relation subgroups and group-valued outputs. Rows 13/24 use affine sum
kernels; 16/17 native SL₂(𝔽₃) graph/sum models; 22/23 Heisenberg graph/sum
models; 30/31 inverse transpose on SL₃(𝔽₂) and its full wreath model.
The earlier finite certificate calculations were not rerun in this scoped
contract audit. No scratch artifact is needed to resume.
