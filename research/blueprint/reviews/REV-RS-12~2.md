# REV-RS-12~2 — second independent restructuring review

Verdict: **needs_changes**. Refs #1614. Reviewer: Codex, session
`codex-a71f92`, 2026-09-23. Proposal author: `cg-6b83f1`; previous
independent reviewer: `cp-7b4e91`. This is a completed restructuring review,
not approval of the incomplete mathematical blueprints.

The proposal preserves the family’s mathematical targets and supplier
interfaces. Its remaining structural defect is the same one identified in
[REV-RS-12](REV-RS-12.md): its declared extension still contains a constructor
of its base. I independently checked the current artifacts, not merely the
previous verdict. The current proposal does not implement that requested repair.

## 1. Unresolved extension frontier

[Protocol §15](../PROTOCOL.md#15-build-on-existing-roadmaps-never-duplicate)
requires an extension to start where its base stops. The Part II title has the
required form, and the base identifier is correct. The actual allocation does
not yet establish that boundary:

```text
AutomorphicGaloisRepresentationsPartII:AG2.0
  -> AutomorphicGaloisRepresentationsPartII:AG2.1a
  -> EndoscopicTransferAndUnitaryTraceComparison:ET.6
  -> GL2AutomorphicRepresentationsAndTransfer:R16.3
  -> GL2AutomorphicRepresentationsAndTransfer:R16.6
  -> AutomorphicGaloisRepresentations:R19.1
```

Every arrow is an existing supplier-to-consumer stage edge. The corresponding
descriptions substantiate the path: early normalization feeds raw compact
unitary cohomology; this supplies the local comparison in ET.6, which is used
by R16.3; R16.6 depends on R16.3, and R19.1 names R16.6. AG2.1a deliberately
precedes an established local correspondence. The aggregate AG2.1 cannot be
substituted for it, since AG2.1b already consumes the comparison.

The author’s report §4 and the proposal’s extension reason acknowledge this.
Interpreting `extends` as only the late public theorem scope does not relocate
the shared foundation or implement the requested boundary. This is not a
demand that every base lemma precede every extension lemma; it concerns
ownership of mathematics used to construct the stated base.

The present graph is acyclic, including all proposed links. Adding
`R19.1 -> AG2.0` makes it cyclic along the displayed witness. Do not add that
edge, silently remove any existing edge, or transfer a completed realization
into the early raw-cohomology interface.

### Decision needed from the orchestrator

Choose and record an actual structural repair:

- Give the shared early normalization/raw-cohomology foundation an appropriate
  earlier owner, delimit the remaining extension, preserve the targets and
  old-ID handling, and forward every affected consumer; or
- Source-audit an over-broad dependency on the displayed path and split it
  into the precise early and late interfaces. For R16.6 this means separating
  the early newform comparison from the local-parameter comparison where
  justified, not just deleting an inconvenient prerequisite.

A different justified merge/rescope is also reviewable. An exception to the
extension rule needs explicit maintainer authorization. Neither a new
cross-family owner nor that authorization is established by the current
proposal. I therefore did not invent a move outside this review’s scope.

## 2. Ownership and conservation checks

I read both member READMEs in full, all sixteen member stage descriptions,
the ten directional leads (five unordered pairs), all twenty ownership
entries, nine external owner-stage descriptions, and the descriptions of all
twenty direct external consumer stages. The family lists no anchors.

The five family overlaps are accounted for:

| Overlap | Owner and retained extension |
| --- | --- |
| R19.1 / AG2.7 | R19.1 owns the actual classical geometric and weight-one constructions; AG2.7 supplies typed exports and an isomorphism-class comparison, not a second public GL2 carrier. |
| R19.2 / AG2.3 | R19.2 supplies the exact Hilbert overlap. AG2.3 retains general rank, uncovered CM/rank-two cases, its eigenvariety instance, approximation and descent. |
| R19.3 / AG2.6 | R24.5:operations owns the generic compatible-system carrier; each family layer constructs its actual automorphic family. R34.6 supplies the generic realized-eigenspace purity application. |
| R19.4 / AG2.5 | R19.4 supplies full WD comparison on its domain. AG2.5 retains new domains, the late normalization comparison, polarized upgrades and the weaker nonselfdual monodromy bound. |
| R19.5 / AG2.6 | R19.5 supplies its exact coefficient-prime comparison. New general-rank assertions remain separately proved in AG2.6, not inferred from good-prime compatibility. |

The other ownership scopes keep generic operations and polarizations at G7,
lattices at R01.1, automorphic rationality at AF.4, and determinant/reconstruction
and spherical normalization at IHG.1/IHG.4/IHG.3. Their automorphic instances
remain here. AG2.7 owns the local residual no-cyclotomic-ratio predicate; IG.5
owns its dual-Hecke-normalized trace/genericity application. These are deliberate
supplier/application boundaries, not duplicate theorems.

All sixteen stages remain (twelve keep, four narrow). In particular:

- R19.1 retains weight-two Jacobians, higher-weight cohomology and the separate
  weight-one branch. General regular algebraic existence does not replace them.
- R19.2/R19.5 retain parity, auxiliary-place, descent and source-specific local
  hypotheses. Ordinary/endpoint and residual qualifications are not discarded.
- R19.6 retains integral Hecke determinants at all finite quotients, nilpotents,
  residual reconstruction hypotheses and deformation maps. The abelian-variety
  realization is weight-two-only, with total dimension `2[K_f:Q]`.
- AG2.1a remains raw geometry; AG2.1b retains the actual-constituent extraction
  from virtual characters with multiplicities, purity and cancellation.
- AG2.2 retains discrete/isobaric assembly separately from the cuspidal theorem.
  Generic representation operations alone do not prove automorphic compatibility.
- AG2.4 retains the HLTT boundary/Levi, dagger/compact-support, all-power
  congruence, determinant-limit and factor-extraction steps. Its basic
  nonselfdual endpoint is not silently strengthened.
- AG2.5 retains monodromy as well as its precise comparison strength; AG2.6
  retains actual coefficient-place families, not merely a table of traces.
  AG2.7 does not infer global image hypotheses from a local ratio predicate.

### Forwarding

For every narrowed layer I checked links from each named supplier to the
narrowed layer itself and to every old direct consumer:

| Narrowed layer | Named suppliers | Old direct consumers |
| --- | --- | --- |
| R19.3 | R24.5:operations, R34.6 | R19.4, CM.4 |
| AG2.3 | R19.2 | AG2.4, AG2.5, AG2.6 |
| AG2.5 | R19.4 | AG2.6, AG2.7, IG.5 |
| AG2.6 | R24.5:operations, R19.3, R19.5 | AG2.7 |

All required links exist in the base graph or the proposal. The early operations
interface is not the late potential-modularity existence theorem.

All twenty existing outward edges remain: R19.1 to R15.6/Kato L2; R19.3 to
CM.4; R19.5 to AutomorphicCongruences L0/L5, Kato L3, PadicFamilies L4 and
PadicHodgeRegulators L4; R19.6 to R31.3, R29.1/R29.5, R22.1, R21.3, R24.1
and R20.1; AG2.1a to ET.6/ET.6a; AG2.2 to TC.4; AG2.5 to IG.5; AG2.7 to
PA.0. Their descriptions still find the required mathematical interfaces.
No anchor, upstream document or generated atlas was edited.

## 3. Previous corrections independently rechecked

These are preserved corrections, not new discoveries in this review.

1. The AG2.5 contract correctly separates an irreducible ramified principal
   series with `N=0` from a Steinberg twist with rank-one `N`. I reread
   [Snowden, Lecture 16](https://virtualmath1.stanford.edu/~conrad/modseminar/pdf/L16.pdf),
   §§1.1–1.2, Theorems 1.3–1.4, pp. 1–3, as extracted text. The normalized
   character ratio excludes `|.|^{±1}` for the irreducible principal series;
   a special subquotient of reducible induction is not a counterexample.
   No successful page-image check of that PDF is claimed here.
2. The R19.1 correction rejects the inherited universal one-subgroup assertion
   in characteristic p without discarding finite representability or geometric
   Eichler–Shimura. I inspected printed pp. 156–157 of
   [Deligne, Bourbaki exposé 355](https://www.numdam.org/item/SB_1968-1969__11__139_0.pdf),
   §3.13 and Proposition 3.15/proof. For `y²=x³+3x+2` over F5, direct
   enumeration gives `O,(1,1),(1,4),(2,1),(2,4)` and discriminant 4.
   Its reduced order-five subgroup differs from the connected Frobenius kernel.
   This persists over an algebraic closure with prime-to-five level. A correct
   sourced ordinary/supersingular statement is still needed in the blueprint.

I also reran the elementary WD test with `F=diag(1/2,1)` and
`N=[[0,1],[0,0]]`: `N²=0` and `FNF⁻¹=N/2`; replacing N by zero loses
monodromy while preserving the underlying Weil representation. Over F5 the
all-pairs ratio predicate accepts roots `(1,1)` for p=7, rejects `(1,2)`
for p=7, and rejects `(1,1)` for p=11. It is not a distinct-roots predicate.

## 4. Scope and inherited gaps

The reviewed library-coverage records for all sixteen member layers were read,
including their 31 recorded targets and duplication notes. I did not turn a
name search into a new absence proof or add a library declaration claim.
The library pins remain Mathlib
`082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`.

I checked the partial decompositions’ statement/hypothesis and gap records:
eight nodes/eight gaps in the base, seven nodes/seven gaps in Part II.
This is not a fresh reading of every construction paper or every proof.
In particular, the source-specific coefficient-prime and full/semisimplified
WD boundaries were checked against those reviewed records and the contracts,
not newly proved.

The unresolved proof readings, exact monodromy-order definition, discrete versus
cuspidal assembly, missing AG2.1b/AG2.2/AG2.3 expansions, and reconstruction
descent from algebraically closed to finite residue fields remain open.
Finished rec-normalized construction nodes currently placed in AG2.0/AG2.1a
still need correct placement. Those inherited blueprint gaps are not resolved
by this structural review and are separate from the extension-frontier verdict.

## 5. Changes, validation and input pin

Only the proposal’s top-level `review` object changed: current reviewer/date,
independently supported `needs_changes` verdict, scope and corrections log.
All roadmap decisions, layer contracts, owners and links are unchanged.
The previous report remains available for history. This report is the second
deliverable; no generated data, hand-edited issue state or private path is added.

Audited repository commit: `438dc5becb18d25a5c4416232c58e0563d221c6e`.
Publication base: `4b3641a4f904237c25db793625a8f3b00c29b1b3`; all reviewed
inputs listed in §§2–4 and the binding instructions were byte-identical there.
The following SHA-256 values identify the relevant pre-review inputs:

| Input | SHA-256 |
| --- | --- |
| RS-12.result.json | `c00fc97c026abc58b146836a4894306f4451131c13213f21610b27a562e8bccc` |
| RS-12.md | `c94be05598234a45f2bad7ce4eb7d49a55e1101ed92940e45768bf5c3b9850ab` |
| RS-12.json | `f2347c385ca2138045d9729dba2e30839db35716b5397e0a78c9826633df43d4` |
| data/atlas.json | `62ab6c2ccb94ee9c4d99813da02b69656941721d30fc29384e2b7e6e86361c56` |
| data/library-coverage.json | `6fe73095d574e7f98497e0dcc0eeec3a9ab0a2c04b4eed98ded8e678a3adea7a` |
| Snowden PDF | `2a9d4362dcacb131d56bf244983888ef6e5501d68473b1b04c3f29c243e46858` |
| Deligne PDF | `19509c19b0cb056f4a5eba83a48a99f54bb6df0c7a96ab7f4018b0765e1ed98c` |

Checks run:

- `python3 scripts/check_restructure.py research/blueprint/restructure/RS-12.result.json`: passed.
- Intake file validation: two deliverables, zero problems.
- Standard-library unittest discovery for `test_check_restructure.py`,
  `test_restructure.py`, `test_intake.py`: 8 + 6 + 29 = 43 tests passed.
- Independent scratch audit: exact sixteen-stage coverage, twenty distinct
  ownership labels, thirty distinct known-endpoint non-self links, all four
  forwarding sets and twenty outward edges checked. The full base graph
  (including external endpoint IDs) has 2,019 vertices and 3,508 edges; union
  with the proposal has 3,534 edges and remains acyclic. Four proposal edges
  already exist, 26 are new. The counterfactual reverse edge fails acyclicity.
- The finite-field, rational-matrix and ratio-predicate assertions in §3 passed.

No Lean file is a deliverable, and no Lean compilation was attempted.
Schema/test success does not establish the missing structural decision.

## Orchestrator handoff

The review is complete; the proposal is not accepted. Resume with the shared
foundation/extension boundary in §1. Record concrete ownership, preserved IDs
and consumer forwarding, then request another independent review. Keep both
previous source corrections and all stronger source-qualified rank-two
interfaces. Do not mark the partial decompositions complete.
