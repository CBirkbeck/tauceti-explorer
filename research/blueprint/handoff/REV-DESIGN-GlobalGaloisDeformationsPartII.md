# REV-DESIGN-GlobalGaloisDeformationsPartII handoff

Issue #3540; Claude, session `claude-mRT4Pe`; branch
`claude-mRT4Pe-review-ggd-partii`. The claim was
[confirmed by the bot](https://github.com/CBirkbeck/tauceti-explorer/issues/3540#issuecomment-6261567434).
This is a finished independent review, not a checkpoint. The design pass by
`codex-csQTUB` (PR #10610) is accepted after corrections in place. The report is
`research/blueprint/reviews/REV-DESIGN-GlobalGaloisDeformationsPartII.md`, and
per-node verdicts are in `packet.review.checked`.

## State after review

- 81 nodes: 54 verified, 27 corrected, none added.
- One node was removed. `GG2.10/residual-potential-automorphy-input`
  duplicated the accepted
  `ModularityAndLanglandsExtensions:ML.2/potential-automorphy-with-steinberg-place`.
- 6 gaps (G6 added), 40 requests, 50 planets.
- All 11 stages planned, none closed.
- All 46 source findings confirmed; E32's description corrected; E45/G1
  strengthened.
- Suggested file revised; `lean-check` passes with 19 admitted-proof warnings
  only.

## Moves and follow-ups for other roadmaps

- **G6 owner needed** for large-prime reductive inputs: the equivariant
  exponential, good-characteristic centralizers, G-semisimplification and
  finite-field root position. The plan had requested them from TauCetiRoadmap
  ReductiveGroups layers 7–8, which do not state them.
- **Lazard inputs** are now requested from:
  - LocallyAnalyticDistributionsPartII ND.0: open p-valued subgroups.
  - NoncommutativeAndEquivariantIwasawa NE.0: finite free resolution, the Ext
    description and Lazard V (2.4.10).
  - AutomorphicFormsOnReductiveGroups AF.1a: semisimple Lie-algebra vanishing
    and Whitehead.

  These used to be framed as an extension of the upstream ReductiveGroupsPartII.
  Those owners' next revisions should take the requests.
- **ModularityAndLanglandsExtensions ML.2** (accepted) has two problems:
  - `potential-automorphy-with-steinberg-place` lacks the ι-ordinarity of
    weight 0 and handles only one auxiliary place.
  - `compatible-system-from-potential-automorphy` asserts all-ℓ density, which
    needs an away-ℓ Steinberg place for every ℓ and the G5
    classification/formal-character input.

  Requests 35 and 37 here record both. A fix job for ML.2 may be warranted.
- **PotentialAutomorphyInfrastructurePartII PL.7** states ANT20 with strong
  primitivity. The FKP22 application checks only non-inducedness, so a request
  asks the owner to either drop that hypothesis or state it.
- **Errata:** FKP22 Lemma 3.7 also fails under C1–C4 when M* has repeated
  constituents, e.g. FKP19 Proposition 7.8 with its multiplicities from
  Remark 7.9. An errata job for this roadmap should carry the strengthened E45.

Nothing remains to resume for this job.
