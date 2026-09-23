# Independent review: representation-theory index

**Accepted for the index owner.** The packet correctly has zero links and zero stage overlaps. This owner has no stages; its twelve children have their own distinct owners. The routing notes remain qualified recommendations rather than improperly attributed child-stage edges.

Reviewer: Codex — `codex-c83e7a`, job `REV-LINK-tauceti_TauCetiRoadmap_RepresentationTheory`, issue #122, 2026-09-23. Original worker: ChatGPT Pro — `cgp-212bf5d92a8b`, PR #794. This reviewer did not write the input. Claim comment 5798169017 was confirmed before work began.

## Exhaustive ownership check and the five-stage instruction

At repository commit `879a43a59c32230f32e26b93a7af789e7a579aec`, I inspected the complete atlas plus every supplemental roadmap definition, using the same world loader as `check_links.py`. Among 2007 stage records, **none has owner exactly** `tauceti:TauCetiRoadmap/RepresentationTheory`; the root roadmap's `stages` array is empty. No stage has that exact root followed by a stage delimiter. None of the six supplemental definitions replaces or extends the root owner.

The full index README independently states that “this page is the index and the map of how they fit together.” It describes twelve separate child roadmaps. Their current stage counts are:

| Child | Stages | Child | Stages |
|---|---:|---|---:|
| SemisimpleAlgebras | 8 | CharacterTheory | 10 |
| InductionRestriction | 10 | RootSystems | 6 |
| AdoIwasawa | 10 | LieHighestWeight | 10 |
| ClassicalGroups | 7 | SchurWeyl | 10 |
| CompactGroups | 7 | LieGroups | 10 |
| SpinRepresentations | 10 | QuiverRepresentations | 7 |

All 105 belong to those children, not to the index. A valid link for this job requires a source or target in the root's owned-stage set S. Since S is empty, the set of admissible links is empty for **every** partner in the 218-record catalogue. An overlap involving an owned stage is likewise impossible. This is an exhaustive ownership argument, not a keyword-based claim that representation theory has no mathematical dependencies.

The generated request to spot-check five **own** stages cannot literally be performed: there are zero. I record that limit explicitly and perform the exhaustive ownership check instead. I did not create parent stages or count child stages as parent-owned to meet a numerical quota. The producer's existing `rescope` proposal correctly identifies this queue-template mismatch; retain the collection and children, and have the orchestrator adjust future collection jobs. This review changes no queue or roadmap.

The nine `examined` entries remain a reading ledger. They are not passed off as all catalogue documents. Catalogue completeness follows from the empty candidate set; approval does not extend to the child link jobs.

## Routing-note review

Read the full root README, every quoted routing passage, and the full selected stage descriptions below. Also read InductionRestriction Layers 0, 2 and 7 and CompactGroups Layers 0, 1, 2 and 5. The six notes exactly match the index's six named consumers. All six routing quotations, the index quotation and the projective-source quotation are literal. All nine original README blob hashes match the current atlas README bytes; the cited documents have not changed.

| Consumer and stages checked | Review decision |
|---|---|
| ArithmeticGaloisRepresentations R01.1/R01.5 | Confirm. Algebraic induction and projective-factor-set candidates belong to InductionRestriction. Continuous integral models, coefficient descent and characteristic-p characteristic-polynomial recognition remain explicit arithmetic interfaces. The index's modular-representation exclusion prevents an unqualified finite-character-theory substitute; this is not a library-absence assertion. |
| AutomorphicFormsOnReductiveGroups AF.1/AF.1a | Confirm. Compact averaging and finite-dimensional complete reducibility do not supply smooth Fréchet globalization, relative cochains or the van Est comparison. The consumer stages explicitly own those constructions and hypotheses. |
| AutomorphicSpectralTheory AS.0/AS.4 | Confirm. Compact Peter–Weyl gives a Hilbert-sum setting. The measurable direct-integral, Eisenstein/residual and surjectivity work is explicitly in the spectral roadmap and its named automorphic/local suppliers. Navigation metadata does not justify a root-stage gate. |
| DeligneWeightsAndPurity DWP.2/DWP.8 | Confirm. The required symplectic tensor invariant/coinvariant calculation has a rational l-adic coefficient and scalar-extension contract. DWP.2 explicitly owns it unless an exact supplier is verified. DWP.8's geometric semisimplicity argument comes from weights, not finite-group Maschke. No child substitution is certified here. |
| QSeriesPartitionsAndMockModularForms QM.1/QM.6 | Confirm. QM.6 owns the VOA, Monster, no-ghost and denominator proof chain. The root's finite-type scope does not supply it. The LI.3/LI.4 references remain present in the source but their owner is retired; the packet correctly requests replacement, not new dependencies on a retired stage. |
| SmoothRepresentationsOfLocalGroups SR.0/1/2/2a/3a/6 | Confirm. Its smooth category, support conditions, adjunction directions, modulus conventions and coefficient regimes are genuine extra data. Algebraic finite-group induction and compact complex averaging do not automatically supply these constructions. Preserve the early/late division and invertible-denominator restrictions. |

These are source-contract checks. I did not independently audit all proofs in nine documents or every implementation named in their status summaries. The current reviewed library-coverage file has no exact root-stage entry; no existence or absence claim about a library theorem follows from that fact.

## Projective-representation counterexample

Confirm the source finding. InductionRestriction Layer 7 first says projective equivalence is determined by the coboundary class of the factor set, then correctly warns that H² classifies factor-set classes rather than projective representations. The displayed same-dimensional counterexample resolves the conflict.

For C2 on C², take the nonidentity element to I₂ in one genuine representation and to `diag(1,-1)` in the other. Both lifts square to I₂, so both normalized factor sets are constantly 1. Their projectivizations have kernels of sizes 2 and 1: the diagonal matrix is not scalar. Conjugacy preserves the projective kernel, so the representations are not projectively equivalent. Exact integer matrix checks confirm the C2 multiplication relations and scalar/non-scalar distinction; the kernel argument gives the mathematical conclusion.

Retain the correction: changing a lift rescales the cocycle by a coboundary; a fixed class admits many twisted-group-algebra modules. This finding is not an approval or edit of the entire child roadmap.

## Validation and limits

Refreshed concurrent AlgebraicCodingTheory and LieGroups link reviews at `ace8c73cf7f3ecacc01ae259b910699cd64e7bdf` before publication. Neither changes the subject ownership or source texts. Executed the previously unavailable full-world local validation:

```text
python3 scripts/check_links.py research/blueprint/links/tauceti_TauCetiRoadmap_RepresentationTheory.json
0 links; 0 overlaps; 9 examined; 0 errors; 0 warnings

python3 research/blueprint/intake.py check-files research/blueprint/links/tauceti_TauCetiRoadmap_RepresentationTheory.json research/blueprint/reviews/REV-LINK-tauceti_TauCetiRoadmap_RepresentationTheory.md
2 files; 0 problems
```

Additional assertions checked exact owner IDs, all supplemental IDs, the 105 separately owned child stages, the six-consumer set, eight literal source quotations, nine source blob hashes and the C2 matrix diagnostic. No links or overlaps were added or removed. The original validation field is retained as historical producer provenance; `reviewValidation` records the checks actually executed here. No Lean file was produced or compiled. Only the packet and this report change; integration and queue restructuring remain orchestrator work.
