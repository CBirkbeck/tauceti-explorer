# FIX-RT-AREA-arithmeticgeometry-1~2 handoff

Codex `codex-pxMEXH`, issue #8921, 2026-10-17. Finished the round-2 planning fix;
no second job claimed. The fixes report is
`research/blueprint/redteam/RT-AREA-arithmeticgeometry-1.fixes-2.md`.

The packet, reader and suggested file now state the all-degree coherent/Hodge/
filtered de Rham and continuous-completion targets explicitly. The existing
`A4/all-degree-exterior-cohomology` ID and étale clause are retained. Seven new
prerequisite/refinement nodes carry `realises: []` pending the recorded A4
rescope proposal; RS-02 was not edited. `G-exterior`, the other existing proof
obligations and all unchecked implementation statuses remain honest. No source
passages or excerpts were committed; uncleared BBM was not accessed.

**Resume with the independent `REV-FIX-RT-AREA-arithmeticgeometry-1~2` review**,
not another implementation/planning pass. Check the scope extension, exact
arbitrary-base sheaf statements, filtered lift/splitting argument, relative
characteristic-two alternation, restricted formal-sheaf application and distinct
FKW étale route. The fixes report lists the sources and checks in full.

## Maintainer redirections (outside this job's allowlist)

- **Move down by tier:** `AbelianSchemesAndArithmeticModuli:A4/ordinary-de-rham-interface`
  owns the minimal proper-smooth ordinary differential complex (base-linear d),
  stupid filtration, perfect derived pushforward/base change, coherent and
  de Rham product maps. Point the relevant ordinary-complex/base-change parts
  of **DerivedDeRhamCohomology DD.2** and proper-smooth-control parts of **DD.5**
  to this owner. Do not move general animated de Rham, crystalline/prismatic
  theories or comparisons into A4. This tier-6 packet has no upward DD edge.
- Reuse current upstream **JacobianChallenge C** coherent pushforward/base-change
  foundations and **AlgebraicVectorBundles L0B/L0C/L2A/L2B** bundle operations;
  neither is replanned. A4's explicit derived de Rham refinements are not
  attributed as unnamed existing upstream theorems.
- The old A4 H¹/all-degree consumption of **R09.6/SF.3** as ordinary de Rham
  formalism has been replaced. The inherited **A0/relative-moduli-imports**
  still describes R09.6 as proper-flat coherent base change, whereas its
  current packet plans deformation theory. Align that separate A0 contract
  with current JacobianChallenge C in an appropriately scoped follow-up;
  do not infer the missing statement from the R09.6 label.
- The original paper extractions and RS-02 are immutable in this job. The
  `restructure` proposal and updated `consumerCoverage` record the intended
  A4 scope and ALB/FKW targets for the maintainer/reviewer.

Validation completed: blueprint checker without errors/warnings; sorry-data
checker; pinned `lean-check` compilation with only fourteen theorem/example
`sorry` warnings; native exterior/rank examples with complete proofs;
packet/reader/manifest consistency; intake file check; `git diff --check`.
No review verdict was changed. Nothing remains running.
