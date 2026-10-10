# DESIGN-QuiverRepresentationsPartII — #3462

Agent: Codex (GPT-6), session `codex-JZdBx9`, 10 October 2026. The bot confirmed claim comment 6102205002. This run submits one complete planning pass for independent review; it claims no implementation or independent review of its own work.

## Deliverables and coverage

The roadmap definition, packet, reader and suggested Lean file agree on six stages, MS.0–MS.5. The packet has status **complete**. All six stages are **planned**; none is closed. Every target is represented, and every prerequisite chain ends in a checked baseline declaration, a requested existing-owner stage, or one of the two precise gaps below. Every node retains `implementationStatus: unchecked`.

There are 35 nodes: 3 definitions, 13 constructions, 17 theorems, 1 comparison and 1 application. Definitions and constructions have 55 API items and 48 named unit tests. There are 21 planets, 10 checked baseline declarations, 4 supplier requests and 2 gaps. The reader gives the statements, hypotheses, source locators, proof outlines, dependencies, API and tests in our own words.

- **MS.0:** inclusive integral intervals, occurrence-sensitive multisegments, right truncation and one-copy maximal peeling. Parent interval machinery is a requested input.
- **MS.1:** finite graded coordinate models, VN/WL pairs, actual embedded images, shifts, the parent classification comparison and reconstruction from graded dimensions and the unshifted VN image.
- **MS.2:** commuting block coordinates, image restriction surjectivity in both directions, polynomial Zariski topology, maximal-rank generic loci and conormal symmetry. Involutivity depends on G1.
- **MS.3:** image-admissible loci, simultaneous admissibility on all iterated VN images, ramified truncation and its commutation with right truncation. These use the involutivity target.
- **MS.4:** weighted inclusion chains, the occurrence endpoint poset, finite Dilworth, matching rank, corrected monotone grid paths and the adjacent Knight–Zelevinsky formula. The adjacent rank argument uses independent scalar coordinates in one matrix, so it requires neither a higher-power rank formula nor G1.
- **MS.5:** truncation compatibility with maximal peeling, weighted-chain decrement, ramified maximal-split identity, representation comparison and the explicit rank-17 newform example. G1 and G2 remain prerequisites of the relevant targets.

## Exact open work

**G1 — finite-orbit conormal dimension and constructibility bridge.** Close the seven facts enumerated in the packet: an actual complex algebraic group action and affine point model; smooth locally closed irreducible orbits; the commutator tangent map; conormal vector-bundle fibers; irreducible equidimensional conormal closures giving exactly the incidence components; the unique dense opposite orbit and equality of conormal closures; and the open dense intersection in a fixed centralizer fiber via the associated bundle. The trace calculation and finite-orbit interval classification are planned. Zelevinsky §4.3 quotes Pyasetskii, and Mœglin–Waldspurger II.7 uses this geometric involution; neither citation alone supplies the missing formal prerequisite chain. A verified independent combinatorial involutivity proof could replace this bridge, with the affected proof outlines reconciled.

**G2 — existing-owner representation carrier and normalization.** Obtain the actual smooth irreducible GL_n(F) carrier, segment adapter on a fixed unramified degree-one cuspidal line, normalized Z/L constructions and the comparison L(m) ≅ Z(dual(m)). Here F is a finite extension of Q_p; the operator/combinatorial stages have no local-field dependency. The current upstream smooth-representation roadmap owns general classification and involution. The comparison node has its exact mathematical statement and dependencies, but its Lean signature is deliberately absent until those supplier types exist at the baseline. The suggested file records this exception explicitly; it introduces no arbitrary representation-valued function or comparison predicate to hide the missing interface.

Requests are recorded against the parent QuiverRepresentations Layers 1, 2 and 5 for the finite-path comparison, Krull–Schmidt multiplicities and type-A interval classification, and against early `EndoscopicTransferAndUnitaryTraceComparison:ET.6` for the representation interface. These are packet requests, not separate issues opened by this run. No general Gabriel theorem, smooth category, Aubert duality, conductor tuple, local Langlands or unipotent-induction theory is replanned here.

## Ownership and baseline audit

The pinned Tau Ceti commit is `f790474821cf4256814db967cb154e7af3d0c369`; Mathlib is `082e2d37e8b0463410cdb532e111cd43d5a66174`. Statements of all ten cited declarations were read, not inferred from search names. `Module.Basis.ofVectorSpace` supplies the basis/freeness input; the adjacent `Module.Free.of_divisionRing` instance was also read and is used in the Lean prototype. The index omits that root-qualified instance, so the packet cites the indexed basis declaration rather than inventing an index name.

The reviewed library audit, supplier stage descriptions and source extraction were checked. Current read-only TauCetiRoadmap commit `81207c7f16d5abf770f13a7d2bdcdb465c030787` and Tau Ceti commit `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` were also searched. The full QuiverRepresentations and SchurWeylDuality reader documents and relevant suggested declarations were read for ownership and density. No existing generic commuting multisegment or ramified maximal-split API was found.

Current upstream SmoothRepresentationsOfLocalGroups §SR.5.3 already plans segments, Z/L and the Zelevinsky involution, whereas the atlas snapshot's SR.5 description concerns integral families. The packet's `upstreamNotes` asks the maintainer to reconcile that identity and route ET.6 to the existing owner. Upstream files were not edited. No notions were moved from a higher tier into this roadmap.

## Sources and access limits

Read AKY, arXiv:2110.09070v4, §§2.1, 2.3–2.5 and 3.1–3.3, especially Lemmas 3.1–3.4, Proposition 3.5, Lemma 3.6, Proposition 3.7 and the proof of Proposition 2.7 (arXiv pp.7–22). Packet locators use that version's printed pages. The Cambridge version-of-record retrieval exceeded the browser limit; this run does not claim a new full published-text collation.

Read Mœglin–Waldspurger, *Sur l'involution de Zelevinski*, introduction p.136, II.1–II.2 pp.148–150, II.4–II.5 pp.160–162, II.6 pp.162–169 and II.7 p.169 through public GDZ OCR, with rendered pp.149 and 160 checked. The recorded hash covers GDZ's complete journal-volume PDF, not a separately extracted article. The algorithm chooses the greatest left endpoint among candidates with the selected right endpoint; this convention matters in the repeated-interval tests.

Read Zelevinsky's ICM 1998 article §§2–3, Theorem 1, pp.410–411, and §5 p.412; Goemans's MIT 18.997 Lecture 6, Dilworth Theorem 3 and its first inductive proof pp.6-1–6-2, and split-poset matching argument p.6-3; and Zelevinsky's 1981 original §4.3 and Proposition 4.4, printed pp.20–21. MathNet's browser extraction supplied the last passage; direct download returned 403, so no hash is asserted. The public English formula transcription was used only to check notation.

The full Knight–Zelevinsky 1996 article was not obtained after bounded searches and publisher-access failures. Its full rank proof is not claimed read or used. The adjacent case is proved in the plan by the independent centralizer-coordinate/matching argument. No restricted book was required; no source file or prose excerpt is committed.

Two source findings are inherited from the independently reviewed AKY extraction and rechecked against the relevant arXiv formulas and calculations: the grid-path endpoint must be (1,r), and the four surviving maximal-dual truncation labels are 2,3,4,5. They are distinguished from new findings. Existing bounded correction searches retain their original dates and scope; this run claims no fresh exhaustive search or proof of absence of a correction.

## Verification

`python3 scripts/check_blueprint.py research/blueprint/packets/QuiverRepresentationsPartII.json` reports **0 errors and 0 warnings**, with six planned stages. The suggested file elaborated using `lean-check` at the pinned baseline; its only warnings are declarations using `sorry`. There are 34 named node declarations, all 55 API signatures, all 48 named packet test examples and five additional acceptance examples. G2 is the explicitly recorded missing signature. Elaboration checks types and signatures, not the mathematical proofs.

A consistency audit checked every named API, test and suggested declaration against both the reader and Lean file, unique API/test names, unchecked implementation status, and absence of private paths. Finite diagnostic calculations tested all 1,001 multisegments of at most four occurrences with endpoints in [0,3], at five cuts each. They checked involutivity, ram/truncation commutation, maximal/remainder truncation, the ramified maximal split, matching counts, the adjacent formula and weighted peeling. Both the repeated-interval and rank-17 source examples passed. These computations are supporting diagnostics, not Lean proofs or a substitute for G1. `git diff --check` also passed.

The next worker should independently review this complete pass and resolve G1, G2 and the four supplier requests before declaring affected stages closed. The exact proof dependencies and remaining work are in the packet, so no deleted scratch material is required to resume.
