# Handoff: BP-PotentialAutomorphyInfrastructure~2

**Job:** BP-PotentialAutomorphyInfrastructure~2 (revision round 2), issue #6934. **Worker:** Claude, session claude-NTd9Ze. **Date:** 7 October 2026.
**Deliverables:** the packet, the reader and the suggested file for `PotentialAutomorphyInfrastructure`, plus this note.
**Status:** the packet is `complete` again; all six stages are `planned` and none is closed. The `review` object of REV-PotentialAutomorphyInfrastructure is left in place for the next reviewer to replace.

## What this round changed

The packet is rebuilt from the reviewed round-1 packet by one rerunnable script, so all node ids the review accepted are kept. The single exception is a moved node, listed below. The reader is regenerated from the packet. The suggested file keeps its round-1 Lean and adds six typed cores.

| Item | Before | After |
| --- | --- | --- |
| Nodes | 118 (91 theorems, 27 definitions) | 123 (94 theorems, 29 definitions) |
| API items / unit tests | 110 / 82 | 120 / 89 |
| Planets | 34 | 34 (PA.2 swaps one) |
| Baseline declarations | 9 | 10 |
| Requests | 35 | 35 |
| Gaps | 12 | 7 |
| Restructure proposals | 6 | 8 |
| Typed Lean definition cores | 8 | 14 |
| Stage cycles involving PA | PA.3 → PA.4 → ML.1 → PA.3 | none |

### 1. The reader (review question 1)

The review left the reader out of date, so it contradicted the corrected packet. It was regenerated from the packet by a generator that, run on the round-1 packet with the round-1 prose, reproduces the round-1 reader byte for byte. The generator was a scratch tool and is not kept: later edits can be made in the reader directly, keeping its node sections verbatim with the packet.

The hand-written prose (the introduction, conventions, stage introductions and closing sections) was edited where the review named contradictions. A script confirms that every packet string field appears verbatim in the reader: node titles, statements, hypotheses, proof steps, acceptance, API rows, tests, request needs, gap details, source-issue corrections and restructure proposals.

Each location the review named is now synchronised:

| Location named by the review | Status in the reader |
| --- | --- |
| Transfer sections (generic transfer, reversed dependency) | The node text is the review's Chenevier Lemma 1.18(iii) argument. The PA.1 introduction explains why the coefficient map need not be surjective or flat. The transfer is a prerequisite of the middle-range theorem. |
| ALS.3 Matsushima routing | All Matsushima and rational-realization uses point to ALS.5; the PA.4 coverage text says so. |
| AG2.0 construction request | The AG2.0 request asks only for the normalization dictionary and for the exponent of the twisting character to be made a parameter. |
| Fixed global determinant and the G8 request | The `local-condition-mod-varpi-comparison` text and the PA.3 introduction use a variable global determinant. |
| `fontaine-laffaille-dimension-amplitude` | Imports the patching verification and P9; the PA.4 introduction says so. |
| Old PGL₂ proof sketch | Replaced by the review's eight-fact sketch; the PA.5 introduction separates facts (1)–(6) from (7)–(8). |
| E3 shown as a source misprint | The source-correction list prints the packet record, including the review's rejection and this round's note (see §5). |
| E56 scope | The PA.4 introduction states that the comparison holds in D(S∞/ϖ) and that D(S∞) gives only a weaker equality. |
| The review's three new gaps and its source-version scopes | All gaps, `sourceVersions` and per-finding scopes are rendered from the packet. The sources section lists Chenevier, BLGGT and the arXiv comparison copies. |

### 2. ι-ordinary notions now owned by PA.2 (as the issue routes Qian items 005, 134, 135)

The issue says PA.2 owns the ι-ordinary automorphic representation (Qian item 134), ι-ordinary automorphy (item 005) and the twisted-Steinberg criterion (item 135), and that the polarized Part II imports them. Round 1 had instead sent all three to `PotentialAutomorphyInfrastructurePartII:PL.0`. PL.0 plans only the polarized notion, is not an atlas stage, and its design review is `needs_changes`.

This round adds four PA.2 nodes:

- `PA.2/iota-ordinary-automorphic-representation` (definition, planet "ι-ordinary automorphic representation"). Source: BLGGT §2.1 (arXiv 1010.2561, PDF p. 33). That section defines ι-ordinarity, with the weight normalization, for regular algebraic automorphic π without polarization. Qian Definition 1.3 cites Geraghty Definition 5.3.
- `PA.2/ordinarily-automorphic-representation` (definition; Qian Definition 1.3).
- `PA.2/twisted-steinberg-ordinarity-criterion` (theorem; proof of Qian Lemma 4.3), with the corrected sign +jc_τ of E74.
- `PA.2/iota-ordinary-soluble-base-change` (theorem). It states Geraghty Lemma 5.7 as ACC uses it in §6.6.10 and in the proof of Corollary 5.5.2. The split case is proved from the locality of the definition; the nonsplit case cites Geraghty and is a gap leaf.

To keep PA.2 at six planets, the ι-ordinary planet replaces the "Ordinary Bruhat comparison" planet. The consumers that took these notions from PL.0 now import the PA.2 nodes:

- `ordinary-automorphic-galois-flag`
- `ordinary-lifting-descent`
- `ordinary-automorphy-lifting`
- `ordinary-base-change-fields`

`ordinary-base-change-fields` no longer transports ι-ordinarity; `ordinary-lifting-descent` does that. The PL.0 stage request is withdrawn. The two field-checklist nodes import the exact node `PL.0/auxiliary-cm-extensions` (BLGGT A.2.1–A.2.3). The rank-one branches import `R24.5/character-system`. A restructure entry proposes that `PL.0/iota-ordinary` import the PA.2 definition, and that `ML.2/steinberg-ordinarity-lemma` cite the PA.2 criterion.

### 3. The three `unverifiable` nodes and review questions 2–5

- **`fontaine-laffaille-lifting-descent` and `ordinary-lifting-descent` (question 3).**
  - **The ML.1 request was wrong.** Its nodes concern weight-one and Artin modularity. Worse, `ML.1/imaginary-quadratic-elliptic-modularity` requires PA.4, so the request closed the stage cycle PA.3/PA.4/ML.1.
  - **Owner.** The extraction routed ACC Proposition 6.5.13 (items 268–269) to ML.5. But ML.5 lies downstream of PA.4 (PA.5 → ML.2 → ML.3 → ML.5), so it cannot supply PA.4. The proposition is now the PA.5 node `PA.5/soluble-base-change-and-descent`, covering base change, descent and the local identity at every place.
  - **Inputs to the new node:**
    - Arthur–Clozel cyclic base change and descent, requested from `EndoscopicTransferAndUnitaryTraceComparison:ET.7a`. The request includes local base change at every place and its compatibility with local Langlands, which closes the E60 gap. The confirmed fix of RT-AREA-langlands-1/1 proposes ET.4b for this; the request says it moves there once that stage exists.
    - `AL.3/strong-multiplicity-one`, a Chebotarev request, `AG2.6/compatible-system-of-pi` and `AG2.2/attachment-under-solvable-base-change`.
  - **Unramified descent** uses the exact node `AG2.5/varma-semisimplified-comparison-and-monodromy-bound`.
  - **Restructure.** A proposal asks ML.5's `cyclic-base-change-gln` to import the PA.5 node for the soluble iteration.
  - **Gaps.** The two gaps "Owner contract for general unpolarized soluble automorphic descent" and "Rational unpolarized base-change and local compatibility source leaves" are therefore removed. Both nodes now close through exact nodes and stage requests; the nonsplit Geraghty Lemma 5.7 remains a gap leaf.
- **`rank-two-adjoint-monodromy` (question 2).** No owner exists anywhere: the owner search covered all packets, decompositions, roadmaps, Tau Ceti documents and restructure results.
  - Facts (1)–(6) are verified, with (6) from RG2.0a. Facts (7)–(8) rest on the gap "Unramified forms of products of adjoint PGL₂", which states exactly what is needed.
  - A new restructure entry asks for one owner of Galois cohomology and forms of reductive groups. The natural owner is the accepted candidate `ReductiveGroupsArithmeticPartII` (arithmetic forms). The same missing owner is recorded independently by the PELModuli packet.
  - EndoscopicTransfer ET.0 only transports conjugacy under inner twists, so it is not an owner.
- **Prescribed crystalline CM character (question 4).** The review missed the existing node `AG2.0/prescribed-crystalline-twisting-character`, which is ACC Theorem 4.5.1's twist. It and `AG2.0/galois-character-of-an-algebraic-hecke-character` are now imported. The gap is removed. The AG2.0 request asks for the unit exponent to become a parameter, because the second case (8b) of the proof needs exponent 1 (E32).
- **Finite character for Corollary 4.4.8.** The gap is replaced by the exact node `R23.1/cht-character-extension` (Chevalley approximation; not Grunwald–Wang). The deduction is in the proof steps.
- **Integral highest-weight theory (question 5).** The confirmed fix of RT-AREA-geomlanglands/24 (`redteam/RT-AREA-geomlanglands.fixes-2.md`) names the already accepted Part II `ReductiveGroupsIntegralRepresentationsPartII` (KP18 route 5, KPZ26 route 3; design pending) as the single owner, and says not to create RG2.6. The gap, the layer-7 and layer-9 requests, the coverage records and the restructure entry now say this. The LanglandsParameterStacks packet already does the same.
- **Finite projective groups.** The gap "Rank-two projective-group classification inputs" is replaced by exact imports:
  - `ArithmeticGaloisRepresentations:R01.4/dickson-classification-and-the-dyadic-refinement`, `…/normal-subgroups-and-automorphisms-of-psl2-pgl2` and `…/restriction-to-the-cyclotomic-field`;
  - the baseline declaration `mathlib:Matrix.ProjectiveSpecialLinearGroup.rank_two_simple`, read at the pin.
- **G7.** ACC Lemmas 7.1.4 and 7.1.6(1)–(2) are `ArithmeticGaloisRepresentations:G7/enormous-symmetric-powers` and `…/G7/taylor-wiles-image-lemmas`. The `GlobalGaloisDeformations:G7` request no longer asks for them. `symmetric-power-adjoint-genericity` needs only Chebotarev, which replaces its G7 stage citation.

### 4. A stage-order fix

`PA.3/ordinary-deformation-hecke-map` (ACC Proposition 6.6.7) forms its Hecke action on the Hida complex A(μ,χ), which was defined at PA.4. The node is renamed from `PA.4/ordinary-hida-complex` to `PA.3/ordinary-hida-complex`; no other file referenced the old id. The review object's per-node list still names the old id, because the review object is left untouched.

With this move and the ML.1 withdrawal, no PA stage lies in any strongly connected component. The check built atlas `requires`/`stageEdges`, the new roadmap definitions, and edges induced from all packets' node prerequisites, and compared the components before and after this round. Inside the roadmap the stage order is now PA.0 → PA.1 → PA.2 → PA.3 → PA.4, with PA.5 → PA.2 and PA.5 → PA.4.

### 5. Checking the reviewer's in-place corrections

All 17 substantively corrected nodes were re-read against the source PDFs. All five copies match the recorded SHA-256 values. All 125 node excerpts, including those of the five new nodes, occur on their recorded PDF pages.

Confirmed corrections:

- the Chenevier transfer repair;
- the CTG weight choice: Definition 4.3.5 is a block-difference condition, and a brute-force check for n = 2,…,6 agrees with the review;
- the variable determinant and g = qn − n²[F⁺:Q] (E58);
- the ALS.3 → ALS.5 rerouting;
- the normal-closure genericity repair;
- the PGL₂ fact split.

Changes made after the check:

- **`degree-reflection-duality`.** Duality relates H^{d−1−q} to compactly supported cohomology, and ACC (p. 977) needs H_c ≅ H after non-Eisenstein localization. The node now also imports `ALS.4/gln-boundary-eisenstein` and `ALS.3/twisting-isomorphism` (ACC Proposition 2.2.23), with a proof step.
- **Two PA.2 nodes.** `determinant-component-product` and `central-torus-cohomology-shifting` no longer import finite-level duality, which their proofs (Lemmas 5.4.14 and 5.4.16) do not use. The ALS.5 duality request no longer cites Lemma 5.4.16.
- **E3.** The rejection is questioned, not overridden. The printed D(S∞) equality is true, but §6.3.5(3) (p. 1050) needs the D(S∞/ϖ) form, and the proof of Theorem 6.5.4 cites 6.4.17 for it (p. 1069). The review verdict is kept; a `revisionNote` on E3 asks the next review to re-examine it. The node statement already records both forms.
- **Slips.**
  - `genericity-normal-closure-restriction` cited "(correction E3)"; it now cites E70.
  - The review's E56 reason says "unprimed I₀"; the page shows that T₀ is the unprimed letter. This is the reviewer's text, so it is noted here and not edited.

### 6. Assigned red-team findings

| Finding | Handling |
| --- | --- |
| RT-AREA-langlands-1/7 | PA.4 states ACC Theorems 6.1.1 and 6.1.2, Corollary 6.5.5 and Theorem 6.6.2, with all their hypotheses. The restructure proposes the edges PA.1→PA.4, PA.2→PA.4 and PA.4→ML.2. The descent inputs are now acyclic (§3). |
| RT-AREA-langlands-1/21 | PA.4 imports the G7 auxiliary sets, diamonds and presentations, and owns only the arithmetic levels and complexes. It proposes the edge G7→PA.4. |
| RT-AREA-langlands-1/22 | PA.3 imports L7, L8, R08.2, G7, G8 and P9, and proposes the corresponding edges, plus L7→P9. The support contract stays conditional, and the PA.3/PA.4 cycle is removed (§4). |
| RT-AREA-geomlanglands/24 | Single owner: ReductiveGroupsIntegralRepresentationsPartII, per the confirmed fix (§3). The PA.1 nodes keep only GL_n bounds and the Kostant calculations. The gap stays until that design assigns a stage. |

### 7. Suggested Lean file

Six definitions gained typed local or numerical cores. Every packet API and test name for them is either a declaration or a one-line omission comment that names the missing input. No proposition-valued stand-in, `True` or arbitrary `Prop` parameter is used; where a statement needs it, the core assumes a local ring, a finite residue field, or an Artinian and Noetherian module.

- **IwahoriLevelTower:** Iw_v(b,c) ⊂ GL_n(O) and the diamond quotient for local O.
- **TaylorWilesArithmeticLevels:** the auxiliary local pair. The index [GL_n(O_v):Iw_v] equals the flag count, and the product over Q is ≡ (n!)^{#Q} mod p.
- **ArithmeticOrdinarySummand:** the stable image ⋂ range(U^k), its bijectivity, and its comparison with localization at U.
- **RelativeBruhatCells:** relative and absolute lengths, the cells P·w·N, and openness over a nontrivially normed field.
- **OrdinaryGaloisCharacters:** the uniformizer values and their telescoping determinant.
- **BruhatOrientationCharacter:** a(t)^{-1}/|a(t)|_p over ℚ_p.

The obligations comment is regenerated from the revised packet.

**Compiled:** yes. `lean-check` on the pinned build (Mathlib 082e2d3; at least 20 GB available) exits 0 with 91 warnings, all `declaration uses 'sorry'`, and no errors. The file imports individual Mathlib modules only.

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/PotentialAutomorphyInfrastructure.json` (with the pinned declaration index): 0 errors, 0 warnings.
- The section-18 validator (`check_errata.check`) on the packet's `sourceIssues` and `sourceVersions`: ok.
- `python3 research/blueprint/intake.py check-files` on the three deliverables: 0 problems.
- Excerpt check: 125 of 125 source entries occur on their recorded pages (normalised NFKC, whitespace removed).
- Every packet string field appears in the reader, and every declaration, API and test name appears in the suggested file.
- Stage-cycle check: as in §4.
- The words "optional", "deferred", "later" and the token `sorry` do not occur in the reader. In the packet, the only occurrences are in round-1 source-issue reasons and in the review object, where they describe the source or the review (for example "used later in the paper"), not work left undone.

## Sources

Read for this round:

- ACC, published author copy, §§6.5.12, 6.6.10 and 5.5;
- Qian, NSF copy, Definition 1.3 and the proof of Lemma 4.3;
- BLGGT, arXiv 1010.2561, §2.1 (new source; SHA-256 recorded);
- Chenevier, arXiv 0809.0415;
- BCGP and the Bianchi author copies, for the excerpt checks.

Not obtained: Geraghty, Math. Ann. 373 (2019), and his 2010 thesis. No free copy was found; this is the gap on Lemmas 5.2 and 5.7. Not read: AC89 (requested from ET.7a), Henniart, and Larsen–Pink/Larsen (a gap, with an R24.5 request).

## What remains (by stage; all `planned`)

- **PA.0:** the ALS groupoid, cellular and boundary extensions; coefficient lattices from ReductiveGroupsIntegralRepresentationsPartII once it has a stage.
- **PA.1:** the integral highest-weight API from the same Part II; the R07.3 interval, twists and IG.7 concentration; the AG2.0 exponent parameter for case (8b); the IHG.0 and IHG.1 transfer contracts.
- **PA.2:** the smooth monoid categories at coefficient p and the arithmetic functor signatures; the O-flat polynomial-law transfer (gap); Geraghty's Lemmas 5.2 and 5.7 in a primary copy (gap).
- **PA.3:** the L7, L8, R08.2, G7, G8 and P9 contracts; the variable-determinant counts in G8.
- **PA.4:** the P8 fixed-ultrafilter and P7/ALS uniform-rank and free-cell inputs (gap).
- **PA.5:** the R24.5 extremely weak rank-one and monodromy extensions (gap); the ET.7a cyclic base-change contract; an owner for forms of reductive groups (gap); the separate real-multiplication large-image argument downstream.

## Requests made to other roadmaps this round

- **New:** `EndoscopicTransferAndUnitaryTraceComparison:ET.7a` (Arthur–Clozel cyclic base change and descent with local base change at every place); `tauceti:TauCetiRoadmap/Chebotarev#layer-10-dirichlet-density-chebotarev`.
- **Withdrawn:** `ModularityAndLanglandsExtensions:ML.1` (wrong owner, and a cycle); `PotentialAutomorphyInfrastructurePartII:PL.0` (replaced by PA.2 ownership and the exact `PL.0/auxiliary-cm-extensions` import).
- **Edited:**
  - AG2.0 (the exponent parameter);
  - ALS.5 finite-level duality;
  - R24.5:operations (names the near-miss Larsen nodes and asks for Henniart's theorem);
  - ReductiveGroups layers 7 and 9 (the integral-representations owner);
  - R24.5/character-system (the rank-one converse);
  - GlobalGaloisDeformations G7 (drops Lemmas 7.1.4 and 7.1.6).
- **Consumer lists:** every request's `neededBy` list was rebuilt from the node prerequisites. Where one supplier has two requests, each keeps its own list.

## For the next reviewer

Check these first: the five new nodes and their sources; the ownership argument for ACC Proposition 6.5.13 in PA.5 (the extraction routed it to ML.5); the E3 note; and the renamed Hida-complex node. The maintainer decides on the eight restructure proposals: the four red-team edge sets, ι-ordinary ownership, Proposition 6.5.13 ownership, forms of reductive groups, and the real-multiplication large-image owner.
