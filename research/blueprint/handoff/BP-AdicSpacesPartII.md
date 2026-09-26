# Handoff: BP-AdicSpacesPartII

Job `BP-AdicSpacesPartII` (issue #670), roadmap `AdicSpacesPartII`, retitled by the accepted RS-05
**Foundations of adic spaces, Part II: analytic and formal geometry**. Worker: Claude Code, session
`cc-e94dc5` (Claude Opus 5.5, with parallel subagents per layer and a single integration pass).

Deliverables:

- `research/blueprint/packets/AdicSpacesPartII.json` (part `null`, all eight stages in scope);
- `research/blueprint/readmes/AdicSpacesPartII.md`;
- `research/blueprint/suggested/AdicSpacesPartII.lean`;
- this note.

## What is done

| Layer | Nodes | Planets | Coverage |
|---|---|---|---|
| R0 Morphisms and admissible affinoid products | 121 | 6 | source_decomposed |
| R1 Analytification and algebraic correspondences | 41 | 3 | source_decomposed |
| F0 Formal geometry | 57 | 6 | source_decomposed |
| R2 Formal schemes, generic fibres, Hasse domains | 84 | 5 | source_decomposed |
| R3 Coherent sheaves and finite traces | 70 | 6 | source_decomposed |
| R4 Étale and pro-étale sites | 13 | 2 | source_decomposed |
| R5 Families and sousperfectoid spaces | 38 | 4 | source_decomposed |
| F1 Dagger geometry and overconvergent de Rham complexes | 70 | 6 | source_decomposed |

494 nodes: 68 definitions, 61 constructions, 76 theorems, 276 lemmas, 13 comparisons; 1324 API items,
597 unit tests, 38 planets, 409 baseline declarations (each statement read in the pinned Lean source),
1523 source excerpts from 41 sources, 68 gaps, 23 requests, 35 source issues.

- Every target of every stage in scope, as narrowed by RS-05, is realised by a node, and every stage is
  `source_decomposed`: the stage arguments are decomposed from their sources, the proof inputs that
  were not read are recorded gaps, and the inputs owned by other roadmaps are requests. No stage is
  `closed`: prerequisite chains end in the anchor's Layers 0–5 (the pinned Tau Ceti tree does not
  contain the category of adic spaces, the structure sheaf as a sheaf, or gluing), in requests to
  other roadmaps, and in the gaps.
- All 24 node ids of the reviewed decomposition are kept, each narrowed to one declaration, with its
  verified locators and excerpts.
- RS-05 is followed: F0, R0, R3, R4 and R5 are planned only as far as their `keeps`; R4 builds no
  second site (every site node is a comparison with an AdicEtaleGeometry A1 node); R5 leaves torsor
  descent to PerfectoidSpaces P9; no anchor content is replanned.

## Continuation (second submission)

The first submission (#2924) was merged as a checkpoint. This continuation:

- decomposes the proof of flattening by admissible blow-up (Bosch–Lütkebohmert II §§1–4, with the
  Raynaud–Gruson statements it uses, read on the Göttingen digitisation centre's scan) into 43 R2
  nodes ending in the existing nodes for Theorem 5.2 and Corollary 5.3;
- adds `R1/rigid-adic-etale-comparison` (Huber 1996, 1.7.10–1.7.11, through Diao–Lan–Liu–Zhu,
  Remark 3.2.15, and de Jong–van der Put, Observations 3.1.1–3.1.2), which R4's comparison of the rigid
  and adic étale topoi uses;
- adds the API item `Huber.Pair.completedTensor_adicRing` (agreement of R0's and F0's completed tensor
  products on adic rings);
- records Huber 1996 1.3.14–1.3.16, 1.5.7, 1.5.8 and 1.5.10 as a gap (not public, not stage targets);
- sets every stage to `source_decomposed`, with the remaining work carried by the gaps, the requests
  and the restructure proposals.

## Ownership decisions made here (also in `restructure`)

1. **Huber 1994, Theorem 2.2, Case I** (sheafiness for Huber pairs with a noetherian ring of
   definition, and the discrete case) had no owner: the anchor's Layer 4 covers strongly noetherian
   Tate rings only. It is planned in R0, with Huber's (1.3) for finite modules.
2. **Uniformisation** of complete Tate pairs and of completed tensor products (asked for by
   AdicEtaleGeometry A0's supplier contract, consumed by PerfectoidSpaces P2) is planned in R0.
3. **Kedlaya–Liu, Theorem 2.4.23** (Čech acyclicity of the structure sheaf for every sheafy Tate pair)
   is planned in R3; the anchor states all-degree acyclicity only for strongly noetherian rings.
4. **Classical affinoid algebras** had no owner. The algebraic half (Noether normalisation,
   Nullstellensatz, supremum seminorm, integrality of A°, reductions) is R0.0; affinoid subdomains,
   Gerritzen–Grauert, Tate acyclicity for affinoid coverings and rigid local rings are R1.0. Tate's
   rigid spaces are R1's (no roadmap planned them).
5. **The local structure of étale morphisms** (de Jong–van der Put; Huber 1996, Lemma 2.2.8) is R0's.
6. **EGA 0_I (7.3.1)** has one owner, F0; R0 keeps only its Huber-ring consequence.

Restructure proposals in the packet: (i) move the six Grosse-Klönne finiteness nodes of F1 that need
Monsky–Washnitzer finiteness to PadicDifferentialEquationsAndRigidCohomology RD.5 (RD.5 owns that
finiteness and consumes F1); (ii) move the proper-GAGA target from R1 to R3 (R3/proper-gaga and
R3/gaga-finite-covers realise R1 already); (iii) split R0 into sub-layers R0o (classical affinoid
algebras), R0a (completed tensor products and fibre products), R0b (separated, proper, finite and
quasi-finite morphisms), R0c (differentials, smooth and étale morphisms), with the node lists;
(iv) add to the stage descriptions of R0, R1 and R3 the owners fixed above.

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/AdicSpacesPartII.json` with the
  pinned declaration index: **0 errors, 0 warnings**.
- Every excerpt was machine-checked against the text of the source actually read (whitespace- and
  hyphenation-insensitive; a second pass ignoring mathematical symbols for transcribed formulae):
  1523 excerpts, 0 not found. Huber's 1996 book is not public; its excerpts are only those the
  reviewed decomposition verified.
- Stage graph: the stage edges induced by all node prerequisites, together with the atlas stage edges
  and the RS-05 links, contain no cycle through this roadmap.
- The document has no Lean code blocks and none of "optional", "deferred", "later".

## The suggested Lean file

**Compiled.** `research/blueprint/suggested/AdicSpacesPartII.lean` elaborates against Mathlib
`082e2d3` and Tau Ceti `f790474` (Lean v4.34.0-rc2), with `lake env lean` in a project at exactly those
commits: 0 errors, and its only warnings are 883 `declaration uses 'sorry'`. It has 138 individual
Mathlib and `TauCeti.*` imports and one section per node; every packet name appears in it (1921 names).
438 API items are real declarations, with ring-level objects prototyped against Tau Ceti's Huber pairs,
restricted power series, rational localisation and `Spa`; 190 unit tests are `example`s. The 1205 names
whose objects need a carrier no library has (the anchor's category of adic spaces and its sheaves, rigid,
formal and dagger spaces, étale sites, perfectoid spaces) are comments of the form
`-- <name>: not stated here; needs <carrier> (supplier: <node or stage>)`, and their ring-level cores are
stated under suffixed names. The stand-ins are a `structure` with real fields for PerfectoidSpaces P1's perfectoid Tate rings
(as in the suggested file of PerfectoidSpaces P8) and the ideal-valued `Module.fittingIdeal` for the
ring-level Fitting ideal requested from Tau Ceti StableReduction Layer 0 (neither library has it). 28 lines exceed 100
columns; `lake env lean` does not lint line length.

## Sources

Read (all public, SHA-256 in the packet): Huber, *A generalization of formal schemes and rigid
analytic varieties* (Math. Z. 1994) and *Continuous valuations* (1993), Kiehl's two 1967 Inventiones
papers, Bosch–Lütkebohmert I and II and Raynaud–Gruson (all through the Göttingen digitisation centre with OCR, formulae
checked against the page images); EGA I and EGA III (Numdam); van der Put (Mém. SMF, Numdam); Wedhorn,
Hübner, Morel and Conrad's lecture notes; Kedlaya–Liu, the Berkeley lectures, Hansen–Kedlaya (dated
6 August 2026), BHW, CHJ, Scholze 2013 with its erratum, Zavyalov (two papers), Fujiwara–Kato,
Conrad's genpaper, *Relative ampleness* and *Irreducible components*, de Jong–van der Put,
Grosse-Klönne (three papers), Kedlaya (*Finiteness*, *Counting points*), Vezzani, Diao–Lan–Liu–Zhu (two
papers), Tan–Tong, Scholze's torsion paper, and Stacks Project tag pages.

Not public or not read (recorded as gaps): Huber's 1996 book beyond the verified excerpts, Huber's
habilitation [Hu4], Huber–Knebusch, Bosch–Güntzer–Remmert, Temkin's properness comparison, Köpf,
Raynaud–Gruson, Elkik, Bosch's rigid Artin approximation, Kiehl's de Rham paper, Bierstone–Milman,
Ardakov–Wadsley, SGA 3 VII_B, de Jong's Berthelot generic fibre paper, Berkovich's spectral radius
theorem.

Two mismatched downloads were caught and replaced by the correct papers: arXiv math/0508003 is not
Conrad's *Relative ampleness* (the author's PDF is used) and arXiv 1608.04186 is not Vezzani's paper
(arXiv 1509.01718 is used).

## Requests to other roadmaps

The anchor's Layers 0–5 (the category of adic spaces, the structure sheaf, rational localisation,
Weierstrass theory, strong noetherianness, uniform and stably uniform pairs; each request states the
exact items), AdicEtaleGeometry A1 (Huber 2.2.8 in A1's comparison of étale notions; the explicit
corrected pro-étale covering condition; étale morphisms of non-noetherian spaces by local
description), PerfectoidSpaces P1–P3 (perfectoid statements without a base field), ClassicalAdicEtale
Cohomology H0 (the affinoid tilde-limit criterion), DiamondsAndVStacks D0 (Cartan's criterion),
TropicalAndBerkovichArithmetic TB.0 (Gel'fand spectrum), AlgebraicModuliForArithmeticGeometry R09.1–
R09.3 (projective geometry, Chow's lemma, dévissage), ModularCurvesPartII R13.1 (generalised elliptic
curves), SchemeAndStackFoundations SF.2 (Godement resolutions), and the Tau Ceti roadmaps
StableReduction Layer 2, JacobianChallenge Layers B and C and ModularCurves 0e (coherent cohomology of
schemes, flat base change, descent).

## Requests other packets made to this roadmap

All served by nodes: PerfectoidSpaces P8 (finite algebras over affinoids, analytification and GAGA,
vector bundles on sheafy affinoids, CHJ coefficient algebras), PadicHodgeTheory P7 (algebraic models of
étale affinoids, smooth formal schemes and Frobenius lifts, Kiehl finiteness and base change),
PadicDifferentialEquationsAndRigidCohomology (dagger algebras, weak completions, formal generic fibres
and tubes, Kiehl on quasi-Stein spaces, finite étale trace), ColemanIntegration (residue discs, weak
completions). Requests addressed here that belong elsewhere: RelativeFarguesFontaine RF0's R0, R1, R2
and R5 requests are anchor Layers 0–5 material; RF4's R2 request is anchor and AdicEtaleGeometry A1
material, its R3 request (sousperfectoid rings) is served by R5; PerfectoidSpaces P0's R3 request
(Huber's étale theory, tilde-limits) is ClassicalAdicEtaleCohomology H0's. RD.4/de-rham-trace cites
`mathlib:Algebra.trace`, which is zero on non-free modules; it should use R3's projective trace.

## What remains, and where to resume

1. The gaps (68), chiefly the unread proof sources above and the proofs Huber asserts "as for
   schemes" (1.6.7–1.6.9).
2. Once the anchor's Layer 5 lands in Tau Ceti, state the geometric declarations of the suggested file
   against it (they are comments now) and re-check the requests.
3. The restructure proposals above wait for the maintainer.

## Fields beyond the protocol's template

- `importsFromTauCetiRoadmaps` on nodes: the Tau Ceti roadmap stages (anchor layers) a node uses. The
  checker reads every `tauceti:` string as a library declaration, so these cannot be prerequisites;
  each such stage has a `requests` entry whose `neededBy` lists the node.
- `library` on nodes: the proposed Tau Ceti module and namespace.
