# BP-SchemeAndStackFoundations--SF.0 handoff (checkpoint)

Issue: #6325. Agent: Claude Code. Session: `cc-3bb662`. Branch: `cc-3bb662`.

This is a **checkpoint**, stopped on the coordinator's wrap-up order. The packet has `status: partial` and SF.0
coverage `partial` with a precise `remaining` list. `python3 scripts/check_blueprint.py
research/blueprint/packets/SchemeAndStackFoundations--SF.0.json` reports 0 errors and 0 warnings (run with the pinned
declaration index, `TAUCETI_BASELINE` set to the swarm baseline). Nothing is claimed implemented; every node is
`unchecked`.

## Deliverables and counts

- Packet: 110 declarations at target level (22 definitions, 15 constructions, 63 theorems, 5 comparisons, 3
  applications, 2 lemmas), 293 API items, 170 unit tests, 6 planets (Relative spectrum, Relative Proj, Universally
  catenary rings, Néron–Popescu desingularization, Elkik's lifting theorem, Perfection of schemes), 454 baseline
  declarations, 237 source records, 5 requests (Tau Ceti Stable reduction L2, Jacobian challenge L-B, Modular curves
  0d, 0e, 4d), source issues E101–E116 (new misprints/errors found in Stacks, Clausen–Mathew, Česnavičius,
  Dimitrov–Gao–Habegger, Zhu, Bhatt–Scholze; to be reviewed). Ids do not collide with the base packet.
- Reader: generated from the packet (conventions, what Mathlib provides, boundaries, every declaration with statement,
  proof outline, API, unit tests, dependencies, sources).
- Suggested Lean file: prototypes the relative Spec / relative Proj group (quasi-coherent algebras, pushforward
  algebra, relative spectrum with API and tests, pullback, base change, morphism properties, qcoh modules,
  symmetric algebra, graded algebras, Proj base change, relative Proj and comparisons), the normal-components theorem
  and the image-ideal left-unit coherence (restating the needed base definitions). **Compiled**:
  `lean-check research/blueprint/suggested/SchemeAndStackFoundations--SF.0.lean` →
  0 errors, only `declaration uses 'sorry'` warnings (116). The other groups' nodes have **no** Lean prototype yet.

## What is done (by sub-area of SF.0)

1. **Relative spectrum** (stage target): quasi-coherent algebras presented on Mathlib's affine Zariski site as
   coequifibered presheaves (exactly the input of Mathlib's `relativeGluingData`), sheaf comparison, f_*O_X for qcqs
   f, relative Spec, universal property, affine anti-equivalence, pullback, base change, morphism properties, qcoh
   modules on Spec_S(A), Sym of a quasi-coherent module. Stacks 27.3–27.4, 29.11.
2. **Relative Proj** (stage target): graded quasi-coherent algebras, Proj base change (Stacks 27.11.6, absent from
   Mathlib), general relative Proj glued from Mathlib's Proj, base change, affine comparison, compatibility with the
   finitely generated relative Proj of Tau Ceti Stable reduction Layer 2 (requested, not re-planned).
3. **Henselization** (base remaining item 1; carrier and API **moved down** from PerfectoidSpaces:P3): ind-étale
   algebras, flatness, R/I^n comparison, Noetherian/completion, recognition, filtered colimits, quotients and integral
   base change, local and pointwise henselization, henselian finite étale equivalence and finite algebras over
   henselian local rings, characterisations and permanence of henselian pairs, Elkik smooth lifting, Z_(p)^h example.
   Finding: `Algebra.ZariskisMainProperty.of_finiteType` supplies the Stacks 15.11.5 input of the base gap.
4. **Excellence** (base remaining item 3; **moved down** from DeformationAndDerivedPatchingAlgebra:R03.3): catenary,
   universally catenary, depth, Cohen–Macaulay, (S_n), support of coherent modules, CM schemes, CM/(S_n)-quasi-excellent
   schemes (Česnavičius Def. 1.2), Japanese/Nagata rings, quasi-excellent ⇒ Nagata, finiteness of normalization,
   completion consequences, standard examples, non-Japanese DVR, Nagata's non-catenary domain, Néron–Popescu.
5. **Perfect schemes** (routes BS17, Zhu, van Hoften, Witaszek): absolute/relative Frobenius (DWP.0 request), universal
   homeomorphisms and their criteria, topological invariance of the étale site (AdicCoefficients request), direct-limit
   perfection, perfect schemes, perfection and its properties, pfp morphisms and models, perfect properness and
   valuative criterion, perfect smoothness, Witt schemes, weakly normal models, Frobenius factorization.
6. **Morphisms of finite type** (routes GGK, Xie–Yuan, He, Gao–Habegger, Kisin–Zhou, DGH, Schmidt–Stix,
   Klevdal–Patrikis, Clausen–Mathew, Česnavičius-22, Couveignes, Schröer, absolute integral closure): dimension,
   fibre dimension, fibre loci, étale coordinates, quasi-sections, Jacobson/closed points, limits with affine
   transitions (existence is absent from Mathlib), Noetherian approximation, finite-presentation limits, spreading out,
   integral-point descent, P^1 → affine, unibranch, unramified criteria.
7. **Coherent extension/Hartogs** (routes Česnavičius-21/71, Gille–Parimala, LLLM-20, Hacon–Witaszek, Kisin–Pappas,
   Boxer–Pilloni): 9 of 17 targets drafted (see remaining).
8. **Image-ideal strand** (base remaining item 2): left-unit coherence node; longer towers follow by induction from
   the base three-morphism and unit coherences (no pentagon node); conductor identifications belong to
   NeronModelsAndSemistableAbelianVarietiesPartII:G.0.
9. **Other**: Noetherian normal schemes are finite disjoint unions of integral schemes (StableReductionPartII MC.6).

## Notions moved down (record for the higher roadmaps)

- Henselization of pairs (carrier, universal property, API): from `PerfectoidSpaces:P3/henselisation-of-pairs` to
  SF.0 (`SF.0/henselization`, `key/henselization` and the new nodes). `key/henselization` (base packet) must drop its
  P3 prerequisite (cite `SF.0/henselization-flat` and `SF.0/henselization-recognition`); P3 imports from SF.0.
- Catenary rings: from `DeformationAndDerivedPatchingAlgebra:R03.3/catenary` to `SF.0/catenary-ring`; the base node
  `SF.0/excellent-ring` must cite `SF.0/universally-catenary` instead of R03.3.
- Depth, Cohen–Macaulay modules, Serre's conditions: no lower-tier owner; planned here (`SF.0/depth`,
  `SF.0/cohen-macaulay`, `SF.0/serre-condition-sn`).
These are also recorded in the packet's `movesDown` and `restructure` fields.

## RT-AREA-algebraicgeometry/11 (Weil restriction)

Handled: SF.0 plans no Weil restriction. Owners per the finding: Tau Ceti Modular curves 0F → ReductiveGroupsPartII:RG2.0a
(affine finite type, includes the affine finite étale case Lawrence–Sawin uses) → AlgebraicModuli R09.3 (algebraic
spaces). PAPER-LAWRENCE-SAWIN-25/82 should be routed to RG2.0a. Recorded in `confirmedFindings` and the reader.

## What remains (exact next steps)

1. Coherent group: plan the 8 unwritten targets listed in the coverage record (Hartogs for affine targets, j_*E
   coherence/reflexivity, codimension-two extension on regular surfaces, Hartogs closure of ideals, MCM extension,
   vector schemes V(E)/W(E), Tor-independent squares, Z_(p) model descent); re-read the mechanically filled baseline
   `provides` and source records of the 9 drafted coherent nodes and of the perfection group.
2. Restore genuine dependencies cut to keep the graph acyclic (forward edges in drafting order), checking for cycles:
- ind-etale-algebra -> henselian-pair-characterisations
- henselization-filtered-colimit -> henselian-pair-permanence
- henselization-integral-base-change -> henselian-pair-permanence
- henselian-finite-etale-equivalence -> henselian-pair-characterisations
- henselian-local-finite-algebras -> henselian-pair-characterisations
- quasi-excellent-nagata -> regular-map-completion
- absolute-frobenius -> universal-homeomorphism
- absolute-frobenius -> universal-homeomorphism-criteria
- relative-frobenius -> perfect-scheme
- relative-frobenius -> universal-homeomorphism
- relative-frobenius -> universal-homeomorphism-criteria
- relative-frobenius-etale-and-smooth -> universal-homeomorphism-criteria
- perfection-universal-homeomorphism -> perfection-preserves-morphism-properties
- perfection-reflects-morphism-properties -> perfection-preserves-morphism-properties
- pfp-models -> perfectly-proper
- reflexive-extension-normal -> coherent-hartogs
- geometric-irreducible-components -> field-extension-descent
- generic-fibre-spreading -> finite-presentation-limits
- generic-fibre-spreading -> affine-transition-limits
- flat-proper-fibre-loci -> noetherian-approximation
- flat-proper-fibre-loci -> finite-presentation-limits
- etale-coordinates -> unramified-criteria
- quasi-sections -> unramified-criteria
- noetherian-approximation -> finite-presentation-limits
3. Lean prototypes for the henselization, excellence, perfection, finite-type and coherent nodes (every API item and
   unit test under its packet name; Prop-valued definitions with real bodies). An uncompiled draft for the excellence
   group exists only in this worker's scratch and is not committed.
4. Account for every item of the 28 SF.0 paper routes (planned / handed to SF.1–SF.5 / not planned) in a packet field;
   hand-offs already identified: algebraic-space and stack items to SF.1, topos points, cohomology and derived
   Tor-independence to SF.2, divisors/Pic/ampleness to SF.3, Elkik approximation, Kollár's criterion, blow-ups and
   alterations to SF.4, Bézout/degrees/nef to SF.5. Routes without an accepted review (CARO-PASTEN-23 r8,
   LE-LEHUNG-LEVIN-ETAL-23 r7) are not planned.
5. Consumer requests still unanswered are listed in the coverage record.
6. Then set SF.0 `planned` and the packet `complete`.

## Sources

Stacks Project tags (≈310 pages, each with sha256 in the packet) and these public papers, all read on 2026-10-09 with
page-1 titles checked: Bhatt–Scholze arXiv 1507.06490v3; Zhu arXiv 1407.8519v3; van Hoften arXiv 2010.10496v4;
Witaszek arXiv 2002.11915v2; Česnavičius arXiv 1810.04493v2 and 2009.05299v7; Clausen–Mathew–Morrow arXiv 1803.10897v2;
Clausen–Mathew arXiv 1905.06611v3; Bhatt et al. arXiv 2012.15801v3; Couveignes arXiv 1907.13617v2; Klevdal–Patrikis
arXiv 2303.03863v2; Schröer arXiv 2004.07025v3; EGA IV (Numdam scans); Milne, Lectures on étale cohomology (author's
site); Gille–Parimala, Le–Le Hung–Levin–Morra, Hacon–Witaszek, Kisin–Pappas, Boxer–Pilloni (arXiv versions; ids in the
packet's source records). Not obtained: Colliot-Thélène–Sansuc (behind the Gille–Parimala Hartogs items; Stacks is cited
instead).
