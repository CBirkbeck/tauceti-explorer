# PKG-InductionRestrictionPartII — blocked checkpoint

## Current session: codex-FnrdAE

Issue [#7592](https://github.com/CBirkbeck/tauceti-explorer/issues/7592).
Worker: Codex (GPT-6), session `codex-FnrdAE`, 2026-10-10.
The bot [confirmed this claim](https://github.com/CBirkbeck/tauceti-explorer/issues/7592#issuecomment-6102940479).
This continues merged checkpoint [#8633](https://github.com/CBirkbeck/tauceti-explorer/pull/8633).
None of the manager's forty priority issues was available in the initial
open `swarm`/`state:available` query. The package was selected from the
permitted fallback queue. One job was claimed.

### Disposition

**Blocked checkpoint on an unchanged planning input.** The package cannot
meet PROTOCOL sections 3, 15 and 20 while its accepted source-of-truth plan
leaves prerequisite ownership unassigned. The issue restricts edits to the
three package files and this handoff and explicitly requires: "Change no
packet; if the plan has a mistake, describe it in the handoff note."
The prerequisite amendment must therefore be made by the maintainer or an
in-scope planning job before this package can finish.

The two blocking entries were inspected directly, rather than inferred from
the previous checkpoint:

- `gaps[0]`, **Natural integral homological bridge — supplier unassigned**:
  arbitrary-abelian-coefficient native integral UCT with its natural Ext
  injection, oriented evaluation, extension transgression and homological
  five-term exactness; finite positive-degree homology consequences; and
  the coprime degree-two edge, including the incoming d₃. Twelve targets
  need this contract. Parent InductionRestriction Layer 7 is expressly the
  ordinary-cover supplier only.
- `gaps[4]`, **Conjugacy of complements over a cyclic coprime quotient**:
  conjugacy by an element of H for finite coprime H,C with C cyclic,
  permitting nonabelian H. RS.5/admissible-inertia-classes needs this input.

The accepted review explicitly retains five gaps and one request. The packet
has `status: complete`, meaning a finished planning pass; all six stages are
`planned` and none is `closed`. The ordinary-cover request has an identified
parent owner. The finite-certificate and native-signature obligations remain
recorded; this session does not certify that they have been discharged.
Admitted native signatures and proof routes do not assign the two missing
owners in the authoritative graph.

**Queue recommendation:** suspend package eligibility until the ownership
amendment below has been made. Another package-only continuation with the
same packet cannot perform that amendment. No label was changed here.

### Fresh supplier checks

Current read-only TauCetiRoadmap is
`070dc2becd74419e76303ede84b465ed4a69461f`; current Tau Ceti is
`a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`. These are the same commits as
checkpoint #8633. No Lake command was run in either checkout.
InductionRestriction and SemisimpleAlgebras READMEs were read, and searches
of current roadmap and library sources were followed by inspection of the
candidate statements:

- AlgebraicTopology Stage 6 specifies singular UCT. Current
  `TauCeti.ChainComplex.kronecker_bijective` (Algebra/Homology/Kronecker,
  line 177) requires `[Injective Y]`; `TopCat.singularKroneckerEquiv`
  (AlgebraicTopology/Cohomology/Kronecker, lines 85–88) requires
  `[Injective M]`. Neither supplies the required arbitrary-coefficient
  native group sequence and its Ext injection.
- ProfiniteCohomology explicitly excludes the Hochschild–Serre spectral
  sequence. Its cohomological five-term sequence is not the native
  homological extension sequence needed here.
- Current `TauCeti.groupHomology.transfer_comp_map_subtype_id`
  (GroupHomology/Transfer/Basic, lines 107–109) supplies transfer followed
  by inclusion as the subgroup index times the identity. Reuse this input;
  the missing bridge is not a request for another transfer theory.
- Current
  `TauCeti.FactorSet.characterTransgression_injective_iff_range_inl_le_commutator_of_separates`
  (GroupExtension/Character, line 148) concerns kernel characters and an
  explicit separation hypothesis. It does not supply integral homological
  transgression or five-term exactness.
- Pinned Mathlib `Subgroup.exists_right_complement'_of_coprime`
  (GroupTheory/SchurZassenhaus, lines 277–292) concludes complement
  existence. Its conclusion does not compare two complements. The search
  of the pinned finite-group sources found no matching conjugacy supplier.
- The exact candidate `StableHomotopyKTheory:H.1/bar-complex-comparison`
  supplies a natural classifying-space/bar comparison. It does not supply
  the extension maps or arbitrary-coefficient UCT; K3BlochGroups--V.4
  records those additional inputs as a Part II supplier gap.
- `ArithmeticStatistics:ST.5/complements-of-a-coprime-abelian-normal-subgroup-are-conjugate`
  requires an abelian normal Hall kernel. This does not cover the allowed
  nonabelian H. The inverse-Galois node IG.4/coprime-profinite-complements
  retains finite conjugacy and its inverse-limit passage as explicit proof
  obligations and records a complement-conjugacy gap. Neither candidate
  resolves the present unassigned contract.

The reviewed library audit has no direct Part II entry. Its adjacent R17.5
and MP.1 records describe projective lifting and factor-set classification,
with the parent owning ordinary representation groups; they do not establish
these missing contracts. No new ownership assignment was made.

### Fresh verification and preserved artifacts

- `python3 scripts/check_blueprint.py research/blueprint/packets/InductionRestrictionPartII.json`:
  exit 0, zero errors and warnings; 109 nodes, 124 API items, 96 tests,
  30 planets and 30 baseline declarations. Five gaps, one request, six
  planned stages and zero closed stages remain.
- `lean-check research/blueprint/packages/InductionRestrictionPartII/Suggested.lean`:
  exit 0; 670 warnings, all `declaration uses sorry`; no errors or other
  diagnostics. Memory preflight showed 101 GiB available. The shared
  helper identifies its Tau Ceti build pin as
  `f790474821cf4256814db967cb154e7af3d0c369`; the Mathlib source HEAD was
  independently read as `082e2d37e8b0463410cdb532e111cd43d5a66174`.
  The check finished. No language server, library build, update or cache
  download was started. Elaboration validates signatures, not implementation
  or prerequisite ownership.
- `python3 research/blueprint/intake.py check-files research/blueprint/handoff/PKG-InductionRestrictionPartII.md`: one allowed file, zero problems.
  `git diff --check` passed.
- Name correspondence: all 109 target suffixes, 124 API suffixes and 96
  test labels occur in both package files. All 32 definition/construction
  nodes have at least three tests. This is an inventory check, not a fresh
  mathematical review of every signature.
- README is 151,274 bytes; Suggested.lean is 178,906 bytes. Both package
  files and the authoritative packet remain unchanged. `metadata.toml`
  remains absent, so this is not a completed package submission.

| Unchanged artifact | SHA-256 |
| --- | --- |
| `packets/InductionRestrictionPartII.json` | `85af7815c4223c6b160f957e001598afb66ae1aaa84ddbea6995008ed72519c5` |
| `packages/InductionRestrictionPartII/README.md` | `919907f5c82678c279d6723eacf7c331f490237f1614fa1be9cb1274100191ac` |
| `packages/InductionRestrictionPartII/Suggested.lean` | `9151ddf2e8835b89cf66492904029d62c1e70ab6912875bc9266c266d15fa7f0` |

Only this handoff changes. Repeated session receipts have been consolidated;
the substantive mathematical amendment, interfaces, source receipts and
finite-model resumption notes from session codex-pCwOIS are preserved below.
Its source readings and finite calculations are inherited evidence, not work
rerun in this session. No scratch artifact is needed to resume.

### Resumption gate

First assign the five contracts in the amendment table below to actual owner
layers and reconcile the accepted packet and its source documents. Then
reconcile this package, retain naturality of the canonical Ext injection,
complete its native interfaces and certificates to the package standard,
and add exactly `topic = "math.GR"` in metadata.toml. Preserve the distinction
between a theorem still to be implemented and a prerequisite whose ownership
has not yet been specified.

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
must be reconciled as that amendment requires. The Suggested exactness
prototype currently states existence of an Ext injection with the correct
range; README also requires its canonical natural identification. A supplier's
full API must retain that naturality, not treat the existential prototype as
an exhaustive specification.

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
