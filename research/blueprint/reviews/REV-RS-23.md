# REV-RS-23 — review of the RS-23 restructuring (Hilbert, Siegel and PEL moduli)

**Verdict: accepted, with four corrections made in place.** Reviewer: Claude Code, session `cc-39fac3`, 29 September
2026. The proposal was written by ChatGPT (GPT-6 Astra Pro), session `astra-7c41e9`. This reviewer took no part in it.

The corrections are needed because RS-06 and RS-14, both accepted on 23 September, changed PELModuli M5 and M6 after
RS-23 was written. The proposal's decisions are all sound.

**What was read.**
- `RS-23.json`: two members (HilbertModularVarietiesAndShimuraCurves, PELModuli), no anchors, and 20 directed leads
  (ten pairs), all from the library audits.
- The proposal `RS-23.result.json`, its report `RS-23.md` and the handoff note.
- Both member documents in full: H0–H6, R18.1–R18.6 and M0–M6.
- ShimuraData D5.
- Every stage that consumes a changed layer: H1, H2, R35.2, R35.3, R35.5, R35.6, R28.1, R28.2, and
  AutomorphicCongruences L1 and AutomorphicPadicLFunctions L4, L4e and L5.
- Every other restructuring with an entry on these stages. RS-02, RS-06, RS-14 and RS-17 are accepted; RS-04 and
  RS-21 are pending.

**Checks run.**
- `python3 scripts/check_restructure.py research/blueprint/restructure/RS-23.result.json` reports `ok` on the
  corrected file.
- The atlas as `scripts/build.py` assembles it at origin/main `ba5cc428` (2840 stages, 7792 edges). On it I checked:
  - that every stage id in the proposal exists;
  - that none of the 14 links is already an edge;
  - the cycle test for each link, which looks for a path from its target back to its source;
  - the path witnesses the report gives for its 11 shortcut links.
- The Mathlib primitive the report cites, at Mathlib `082e2d3`:
  - `Submodule.traceDual` (`Mathlib/RingTheory/DedekindDomain/Different.lean:57`) and `mem_traceDual` (`:69`);
  - `FractionalIdeal.dual` (`:229`), in a section that assumes `IsDomain`, `IsFractionRing` and `IsIntegrallyClosed`.

  The report's reading is right: this is trace-dual algebra, not a polarization module.

## 1. Duplication

The ten evidence pairs are all resolved, and I agree with each verdict.
- **H0 / M0 and the rational Hilbert data.** D5 constructs "the two Hilbert data from a totally real field", their
  reflex fields and morphisms, "including the Hilbert trace-pairing symplectic embedding for `G*`". So H0's rational
  constructions are D5's, and H0 keeps what D5 does not do:
  - the derived-group and centre descriptions;
  - the domain components;
  - the integral lattice and different refinement;
  - the Hodge-type and abelian-type verifications.

  M0 owns only the generic PEL datum. The owner record (D5, formerly H0 and M5) is right.
- **H1 against M0, M1, M2 and M3.** These are supplier–consumer handoffs. H1 keeps the polarization-module instance, the
  determinant-condition check, the trace/different Weil-pairing dictionary and the component comparison. The generic
  engine is M0–M3's.
- **H1 / M5.** This is a genuine duplicate. M5 asks to "construct the trace-pairing PEL datum for a totally real field
  and a polarization module; hand its Hilbert moduli problem to H1–H2", and H1 constructs the same moduli problem.
  - Making H1 the owner, with H1 → M5, is the right direction. H1 already consumes M3, and M4 → M5, so the reverse
    would be circular in substance.
- **H2 against M2 and M4, and R18.2 / M4.** The proposal rightly keeps the ramified, p = 2 and Carayol bad-prime
  geometry. M2's good-prime smoothness and M4's normalization over a good base do not supply it.
- **H4 / M1.** M1 owns the generic level functors. H4 keeps the three Hilbert full-level problems, the adjugate
  action and the effective groups.
- **M6 / M2** is not an evidence row, but the documents show the duplicate. M6 says "construct … the fine
  scheme/algebraic space at each proved rigidifying level, with the universal abelian scheme", which M2 already
  constructs.
  - Narrowing M6 to import M1 and M2 is right.
  - Keeping arbitrary-level stack algebraicity, the Hodge line and the descent obstruction in M6 is also right.

**Two further overlaps checked; neither is a duplicate.**
- **H5's F = ℚ test against M5's genus-one comparison.** Both compare a rank-one moduli problem with Tau Ceti's modular
  curves, but not the same one:
  - H5 matches the Hilbert tame-level conventions (`µ_N`, `K₀`, `K₁`);
  - M5 compares full level, with the Weil-pairing determinant, against Y_full(N).

  Both import the Tau Ceti roadmap, and neither re-plans the other's comparison.
- **M6's nonempty examples against M5's examples.** M6's Siegel and unitary examples test that the arithmetic moduli
  are nonempty. M5 constructs the example moduli problems and checks positivity, reflex field, dimension and the
  good-prime conditions. An edge M5 → M6 would make M6, and with it Faltings finiteness, wait for M4 and H1.
  Correction 3 records this in M6's `keeps`.

## 2. Nothing lost

**The four narrowings.** Each keeps its specialised outputs and names its suppliers.

**Consumers of the narrowed layers.**
- **H0 and H1.** H0's only consumer is H1, which gains D5 → H1. H1's only consumer is H2, which gains M0, M1 and M3 →
  H2 beside its existing M2 input.
- **M5 is no longer a sink.** The report says "the existing graph has no outgoing edge from M5". That was true at its
  baseline. Since then RS-14 has made M5 the owner of the "Unitary PEL example with specified signatures, polarization
  and good-prime/reflex-field checks", and has added edges from M5 to AutomorphicCongruences L1 and
  AutomorphicPadicLFunctions L4, L4e and L5.
  - All four consumers use the unitary example: L4 is "ordinary unitary groups and the doubling method", and L1 is
    Skinner–Urban's U(2,2) input.
  - RS-23 keeps the unitary example in M5, so no consumer loses anything.
  - The report's no-cycle argument relied on M5 being a sink. I rechecked D5, H0 and H1 → M5 directly on the current
    graph, and all three are acyclic.
  - Correction 1 records this in M5's `keeps`.
- **M6 has more consumers than the proposal lists.** RS-06 attached M6 to R35.2, R35.3, R35.6 and R28.2, as well as
  R35.5 and R28.1, and made M6 the owner of the "actual polarized moduli universal family/Hodge line and
  rational-family/coarse-point descent interface". None of the six loses its input:
  - **R35.2 and R35.3** take the Hodge line and the invariant differentials, which stay in M6.
  - **R35.5 and R35.6** already have edges from M2 (from RS-06), and the proposal adds M1 → R35.5.
  - **R28.1** gains M1 and M2 → R28.1.
  - **R28.2** takes the descent component that R28.1 imported. It stays in M6, and R28.2 reaches M1 and M2 through
    R28.1.

  Corrections 2 and 4 name the six consumers and align RS-23's M2 owner record with RS-06's.

**External contracts.** The consumers listed in section 5 of the report keep their edges, and no edge is removed.
- **Unchanged layers.** The later edges from RS-02 (into H2, H4, M0, M2 and M3), RS-06 (into R18.1), RS-17 (into
  R18.4) and RS-21 (into R18.3) all enter layers that RS-23 keeps. RS-04's CM.0 → D5 edge enters D5, which RS-23
  leaves unchanged.
- **RS-02 into the narrowed layers.**
  - Its A5 and R12.1 inputs to H1 stay, since they feed the abelian-scheme and uniformization work H1 keeps.
  - Its A6, R09.3 and JacobianChallenge inputs to M6 stay, since they feed the field descent and Weil restriction
    behind the arithmetic comparison M6 keeps.

## 3. Anchors, extensions and format

- There are no anchors, no Part II extension and no title change. Both roadmaps are kept, and every one of their 20
  stages is listed.
- The file has the §15 shape: `roadmaps`, `layers` (keep or narrow, each narrowing with `keeps` and `suppliedBy`),
  `links` and `owners`, and it passes `check_restructure.py`.
- **The links.** All 14 join existing stages, none is already an edge, and each passes the cycle test on the current
  graph:
  - 11 are shortcuts along existing paths, and each witness in the report is still a path;
  - the other three are the inputs to M5.

## 4. Corrections made in `RS-23.result.json`

1. **M5 `keeps`.** It now records RS-14's owner record for the unitary example and its four consumer edges, which stay.
2. **M6 `keeps`, exports.** The exports now name all six RS-06 consumers (R35.2, R35.3, R35.5, R35.6, R28.1,
   R28.2). M6 stays RS-06's owner of the consumer-facing family and Hodge-line export and of the descent interface.
3. **M6 `keeps`, examples.** Its nonempty Siegel and unitary examples are stated to be arithmetic nonemptiness tests
   on the M1/M2 carriers, with the reason no M5 → M6 edge is added.
4. **`owners`.** The M2 record for the universal abelian family is narrowed to the family's construction, in
   agreement with RS-06.

No layer action, link or other owner record changed. The `review` object is added at the top level.

## 5. For the orchestrator

- **The report `RS-23.md` is not a deliverable of this job, so I left it unchanged.** Two of its sentences are out of
  date since RS-14:
  - section 3, "The existing graph has no outgoing edge from M5";
  - the sink argument in section 6.

  The corrected JSON is the operative record.
- **Integration order.** RS-23 is consistent with the accepted RS-02, RS-06, RS-14 and RS-17. The pending RS-04 and
  RS-21 add edges only into D5, R18.1 and R18.3, which RS-23 leaves unchanged or keeps, so they do not conflict.
- **Future blueprints.** The report names outside stages that repeat member phrasing: R23.2 repeats H6's twist, and
  R28.1 repeats M6's descent comparison. Their future blueprints should cite the supplier instead of restating it.
  Nothing in this review changes those stages.
