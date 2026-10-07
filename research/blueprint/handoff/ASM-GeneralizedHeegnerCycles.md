# Handoff: ASM-GeneralizedHeegnerCycles (issue #234)

This job assembles the roadmap *Generalized Heegner cycles and their Iwasawa variation* from its two parts:

- GH.0–GH.7: written by BP-GeneralizedHeegnerCycles--GH.0, reviewed by REV-GeneralizedHeegnerCycles--GH.0 (verdict `needs_changes`);
- GH.8: written by BP-GeneralizedHeegnerCycles--GH.8, reviewed by REV-GeneralizedHeegnerCycles--GH.8 (verdict `accepted`).

Worker: Claude, session claude-iclLBn, 7 October 2026. I took no part in either part or either review. This is a complete assembly, not a checkpoint.

## Files

- `research/blueprint/readmes/GeneralizedHeegnerCycles.md`: the full roadmap document (4961 lines).
- `research/blueprint/suggested/GeneralizedHeegnerCycles.lean`: the two parts' suggested files, joined (1736 lines).
- `research/blueprint/handoff/ASM-GeneralizedHeegnerCycles.md`: this note.

The part packets, part documents and part Lean files are not deliverables of this job (the queue lists only the three files above), so they are unchanged. The fixes the packets need are listed below for a job that owns them. No review verdict was changed, and no reviewed mathematics was changed.

## What the reviews asked for, and what this job answers

**GH.0 review (`needs_changes`).** Its handoff lists seven items.

- Item 6, reader synchronization: answered. The document is generated from the corrected packet. A script checks that every packet field occurs in it after whitespace normalization and the notation changes below: 2784 fields (ids, titles, statements, hypotheses, proof steps, acceptance checks, API and test names, roles and statements, uses, prerequisites, locators, excerpts, matches, planets, library locations, prototypes, review notes, requests, gaps, coverage, source issues, sources, baseline declarations, restructure proposals, refinements, target inventory and ownership); none is missing. In particular the corrected marked level (ker φ ∩ A[𝔑] = 0), the denominator N^m2^{2m}(m!)², the CM eigenbasis argument (distinct bidegrees, not values), the finite-order χ_t of the same conductor, the separation of (4.6) and (4.7), the R06.5 and filtration references, the auxiliary fine-level descent, the rational Gysin and Ext¹ = H¹ requests, the source-qualified CH descent and the register E1–E7 are all in it. The part document `readmes/GeneralizedHeegnerCycles--GH.0.md` is superseded and was not edited.
- Item 7, Lean receipt: answered by a harness check (below). The full GH.0 body now elaborates against the pinned Tau Ceti definitions.
- Items 1–5, the five interface and test contracts (`CMCurve`, `epsA`, `IsogPair`, `colemanPrimitive`, `universalNormClass`): not addressed. They need changes to the packet's test statements as well as to the Lean examples, which belongs to a revision of the GH.0 part; the joined file keeps the part's declarations and examples, and its header names the five. The document's gap G18 records them. A re-review of the GH.0 packet should therefore find the reader reason resolved and these five remaining.

**GH.8 review (`accepted`).** Its report lists reader errata (GH.5/GH.6 ownership of the leading-class unit and non-torsion, the ramified conductor-field comparisons, HE.8's E(K)[p] = 0, the corrected BSD dependency range, 13 signatures and 32 examples). All are in the document, since it is generated from the corrected packet. The part document `--GH.8.md` is superseded and was not edited.

## What was done

**The document.** Generated from the two packets by a script; the introduction, layer overviews, conventions and closing notes are new prose, checked against the node statements.

- Introduction: purpose and scope with the nine layers; what is not here, by owner; boundaries, with the three accepted restructurings that fix them (RS-04, RS-06, RS-08), the dependency discipline and the separation of the CH, LV and Castella hypothesis packages; a generated table of every other roadmap's layer or node imported, with the consuming nodes; a table of every node of another packet that cites this roadmap, with the answering node; a table answering the four requests other roadmaps have filed with this one; conventions; the 11 sources (the parts cite five of them under two identifiers each; the hashes agree); the 19 pinned declarations with the library audit's overlap findings; and a layer overview.
- Each layer has an overview, its planets and open items, and every node in packet order, which is already topological: statement, hypotheses, construction or proof outline, API, unit tests, acceptance, used by, depends on (linked), open requests and gaps, proposed location, suggested-file coverage, the review verdict and note, and sources with their excerpts.
- Closing sections: cross-part prerequisites, the 19 requests to other roadmaps and the 8 requests of GH.8 to earlier layers, the 24 gaps (G1–G18 from GH.0, G19–G24 from GH.8), the 8 source issues, the structural proposals with the integrated-id refinements, a layer-dependency table and notes for the maintainer.
- 178 anchors and 1435 internal links, all resolving.

**Notation.** Two reconciliations, both listed in the document's Conventions section; only symbols change, never a formula.

- In seven GH.0/GH.1 nodes drawn from BDP the packet writes r for the BDP fibre-power index in some fields, while CH's r is the half weight; the document writes m there. Nodes and fields: `GH.0/cm-projector-and-symmetric-power`, `GH.0/cm-character-decomposition`, `GH.0/generalized-kuga-sato-variety-and-its-projector`, `GH.0/self-duality-of-the-projected-cohomology` (all prose fields); `GH.1/field-of-definition-of-generalized-heegner-cycles` (proof steps); `GH.1/etale-abel-jacobi-map` and `GH.1/p-adic-abel-jacobi-map` (acceptance). Source excerpts, locators and "match" notes keep BDP's r. The Lean file's comment blocks for these nodes use m too.
- The GH.8 packet writes Greek letters and symbols in ASCII (x_phi, psi^{-1}, Abel--Jacobi, ->, c_0, T-dagger); the document prints them in Unicode as the GH.0 part does. Excerpts, locators, identifiers and Lean names are untouched, and "zeta elements" is a word.

**Cross-part prerequisites.** The GH.0 part never cites GH.8. The GH.8 part cites earlier layers by layer id in 28 places, written before the GH.0 nodes existed. The document's table maps each to the GH.0–GH.7 nodes that supply it, read from the citing node's hypotheses and proof steps, and says what no node supplies (in each case already a GH.8 request or gap). With these edges the node graph has no cycle and every edge points to an earlier layer. Three findings: several weight-two facts exist in GH.0/GH.1 only as acceptance checks (X_0 = C; AJ_et(P − ∞) is a Kummer class; AJ_F(P − ∞)(ω_f) is a Coleman integral), so the GH.8 requests stand; no GH.5 node states the integral leading-class comparison κ₁ = v·κ_∞ (GH.8's gap G23); and `GH.8/corrected-bsd-input-export` takes CH (4.7) "from GH.2/GH.3", but CH (4.7) is `GH.1/character-projected-heegner-class`.

**`check_blueprint.py`**, with `TAUCETI_BASELINE` set to the pinned declaration index, reports 0 errors and 0 warnings on both part packets (unchanged by this job).

**The Lean file.**

- One standard note, one import block (16 Mathlib modules and `TauCeti.AlgebraicGeometry.AbelianVariety.Isogeny`), part GH.0 in `TauCeti.GeneralizedHeegner` and part GH.8 in `TauCeti.GeneralizedHeegnerCycles.WeightTwoChecks`, each in its own section so that the GH.0 part's `open CategoryTheory AlgebraicGeometry` does not leak. No name clashed. Every declaration, docstring and example of both parts is kept; the only body changes are the r → m comment text above and the section wrappers.
- Every definition, API and test name of the GH.0 packet (66 declarations, 63 API items, 54 tests) and all six `leanName`s of the GH.8 packet occur in the file.
- **Elaboration.** `lean-check` on the file itself stops at its Tau Ceti import: the shared build has no `TauCeti/AlgebraicGeometry/AbelianVariety/Isogeny.olean` (the GH.0 author and reviewer hit the same). I built a scratch copy in which that import is replaced by the eight Tau Ceti modules it needs, read at f790474 (`ResidueDegree`, `RationalPoint.Basic`, `AbelianVariety.Basic`, `Hom.Basic`, `MorphismGroup`, `End.Basic`, `Hom.BaseChange`, `Isogeny`) and inlined in dependency order (module keywords and `@[expose]` removed, imports hoisted, each file's section closed). `lean-check` on that copy, at Mathlib 082e2d3, exits 0 with no errors and no warnings other than 266 `declaration uses 'sorry'` (221 from part GH.0, 45 from part GH.8, the latter matching the GH.8 review's count). This is the first elaboration of the whole GH.0 body, including the CM curve and marked-isogeny prototypes; the GH.0 author had checked the Mathlib-only portion. It is a harness check, not a compilation of the committed file; the scratch copy is not committed.

## Fixes the part packets need (not deliverables here)

None of these changes a statement.

1. **Layer citations in the GH.8 packet that should name nodes.** Replace each prerequisite `GeneralizedHeegnerCycles:GH.k` by the nodes below (where a node is already cited directly, just drop the layer citation):
   - `GH.8/weight-zero-cycle`: GH.0 → `GH.0/generalized-kuga-sato-variety-and-its-projector`, `GH.0/newform-cm-projector`; GH.1 → `GH.1/generalized-heegner-cycle`, `GH.1/homological-triviality-of-generalized-heegner-cycles`.
   - `GH.8/modular-quotient-kummer`: GH.1 → `GH.1/etale-abel-jacobi-map`.
   - `GH.8/character-sum-comparison`: GH.1 → `GH.1/etale-abel-jacobi-map`; GH.3 → `GH.3/iwasawa-heegner-class`.
   - `GH.8/positive-tail-corestriction`: GH.3 → `GH.3/ordinary-stabilized-class`, `GH.3/iwasawa-heegner-class`.
   - `GH.8/differential-evaluation`: GH.1 → `GH.1/p-adic-abel-jacobi-map`.
   - `GH.8/ordinary-p-old-family`: GH.3 → `GH.3/ordinary-stabilized-class`, `GH.3/iwasawa-heegner-class`; GH.4 → `GH.4/fixed-weight-regulator-adapter`, `GH.4/castella-hsieh-abel-jacobi-formula-and-big-logarithm-reciprocity`; GH.7 → `GH.7/critical-character-twist`, `GH.7/howard-family-tower`, `GH.7/family-representation-specialization`, `GH.7/two-variable-regulator-checkpoint`, `GH.7/family-regulator-localization`, `GH.7/ordinary-localization-injective`, `GH.7/higher-weight-family-specialization`.
   - `GH.8/uniform-coherent-kernel-bound` and `GH.8/uniform-coherent-lift`: GH.1 → `GH.1/integral-abel-jacobi-comparison`; GH.3 → `GH.3/iwasawa-heegner-class`.
   - `GH.8/primitive-character-stabilization`: GH.3 → `GH.3/iwasawa-heegner-class`.
   - `GH.8/weight-two-reciprocity`: GH.1 → `GH.1/etale-abel-jacobi-map`, `GH.1/p-adic-abel-jacobi-map`; GH.3 → `GH.3/iwasawa-heegner-class`, `GH.3/stabilized-first-step-adapter`; GH.4 → `GH.4/fixed-weight-regulator-adapter`; GH.7 → `GH.7/family-regulator-localization`.
   - `GH.8/automorphic-reciprocity-export`: GH.4 → (already cites `GH.4/castella-hsieh-…`); GH.7 → `GH.7/critical-character-twist`, `GH.7/howard-family-tower`, `GH.7/family-measure-specialization`, `GH.7/two-variable-explicit-reciprocity`, `GH.7/higher-weight-family-specialization`.
   - `GH.8/corrected-bsd-input-export`: GH.0 → `GH.0/newform-cm-projector`; GH.2 → `GH.2/finite-local-abel-jacobi-class`, `GH.2/local-condition-at-p-and-the-castella-hsieh-corrections`; GH.3 → `GH.3/ordinary-stabilized-class`, `GH.3/iwasawa-heegner-class`; GH.4 → (already cites `GH.4/castella-hsieh-…`); GH.5 → `GH.5/longo-vigni-admissible-triple`, `GH.5/higher-weight-kolyvagin-class`; GH.6 → `GH.6/selmer-rank-one`, `GH.6/anticyclotomic-nonvanishing`; GH.7 → `GH.7/family-measure-specialization`, `GH.7/two-variable-explicit-reciprocity`. Also add `GH.1/character-projected-heegner-class` (CH (4.7)) and correct proof step 1, which attributes CH (4.7) to GH.2/GH.3.
   The GH.8 requests to GH.0–GH.7 should stay, narrowed to what the document's cross-part table lists as open.
2. **Duplicate source issue.** `GeneralizedHeegnerCycles/E-GH8-1` (GH.8) and `GeneralizedHeegnerCycles/E7` (GH.0) are the same finding about the CH §4.4 display Sym^{2r−2} T_p(B)(1 − r) ⊗ O_F ≃ Ind S^{r−1}(A) ⊗ O_F, present in both editions and confirmed by both reviews with the same rank count. `data/source-issues.json` and `research/errata/REGISTER.md` list it twice, once under each edition. Keep one id (E7, the earlier) and let the GH.8 packet cite it; E-GH8-1's remark on the pure conjugate components can join E7's correction.
3. **Notation.** Apply the r → m change to the seven GH.0 nodes listed above, and the ASCII → Unicode change to the GH.8 packet, including its planet name "Weight-two Abel--Jacobi comparison" (the atlas shows the double hyphen).
4. **Names.** The GH.8 packet's Lean names live in `TauCeti.GeneralizedHeegnerCycles.WeightTwoChecks`, its library namespace is `TauCeti.GeneralizedHeegnerCycles.WeightTwo` and its module `TauCeti/NumberTheory/HeegnerCycles/WeightTwo`, while the GH.0 packet uses `TauCeti.GeneralizedHeegner` and `TauCeti/NumberTheory/GeneralizedHeegner`. Moving GH.8 to `TauCeti.GeneralizedHeegner.WeightTwo` and `TauCeti/NumberTheory/GeneralizedHeegner/WeightTwo` would give the roadmap one root; the joined Lean file keeps the packets' names until then.
5. **Small slips.** The GH.0 packet's first `restructure` entry writes "A.3"; the layer id is `AbelianSchemesAndArithmeticModuli:A3`.

## An ownership question for the maintainer: the Kuga–Sato variety

No roadmap plans the Kuga–Sato variety W_m (the canonical desingularization of the fibre power of the universal generalized elliptic curve over X₁(N), with its boundary cohomology), and the requests for it form a loop. GH.0 imports W_m and Scholl's projector ε_W and requests both from ModularCurvesPartII R14.3 (GH.0 request 8); the R14.3 packet has no node on fibre powers or Scholl's projector. AutomorphicGaloisRepresentations R19.1 plans Scholl's projector itself (`R19.1/scholl-projector`, which is GH.0's ε_W) and requests the fibre powers from GH.0. WeightsInEtaleCohomology R34.5 requests the classical W_r and its projector from GH.0. RS-06 divides the work as: R14.3 the integral cohomology and Sym^{k−2} local systems on the universal family, R19.1 the eigenspace/projector, GH.0 the higher-dimensional cycles. On that division: the geometry of W_m needs an owner before R19.1 and GH.0 (naturally R14.3 or a layer it imports); GH.0 should take ε_W and Scholl's concentration theorem from `R19.1/scholl-projector`; the R19.1 and R34.5 requests should go to the W_m owner. `R19.1/scholl-projector` currently cites GH.0, so that citation has to move before GH.0 cites R19.1, or the two layers would depend on each other. The document records this under Boundaries ("An open ownership question") and answers the R19.1 and R34.5 citations accordingly.

## Structural proposals of the parts

| Proposal | Part | Status |
|---|---|---|
| Part II of PadicHodgeRegulators after L3: integral relative Lubin–Tate and ordinary-family regulators, Ochiai's exponential, Yager's module, the two-variable map (GH.0 request to L3) | GH.0 | awaiting the maintainer |
| Part II of SelmerIwasawaCohomology extending L4: Nekovář's corrected family parity (GH.0 request to L4) | GH.0 | awaiting the maintainer |
| ES.5 extended by CH's bounded-error anticyclotomic descent; ES.5 → GH.5 and ES.8 → GH.5 edges (RT-iwasawa-1/10) | GH.0 | awaiting the maintainer |
| RS-06 applied: R14.3 extended to higher fibre powers; R14.3 → GH.0 and A3 → GH.0 edges | GH.0 | awaiting the maintainer; see the ownership question above, which this proposal does not settle |
| L3h owns the GL₂ BDP measure, GH.4 owns BDP 5.13 and CH's cycle identities, GZ.9 imports m = 0; L3h → GZ.9 and GH.4 → GZ.9 (RT-iwasawa-1/11) | GH.0 | awaiting the maintainer |
| Refine the six integrated checkpoint nodes; keep their ids as aliases (the `refines` list) | GH.0 | awaiting the maintainer |
| Ownership of generic main-conjecture comparisons with ModularIwasawaMainConjectures L6, of congruence divisibilities with AutomorphicCongruences L2, of the BSD transfer with RankZeroOneBSD BSD.6a | GH.8 | recorded in the GH.8 `ownership` field; no restructuring proposed |

## Requests of the parts

27 requests: 18 from GH.0 and 1 from GH.8 to other roadmaps, and 8 from GH.8 to GH.0–GH.7. The document gives each in full ("Requests to other roadmaps"); this is the index of the external ones.

| Supplier | Requests (part) | Needed by |
|---|---|---|
| ArithmeticGaloisDuality R02.1 | 1 (GH.0) | GH.1 étale Abel–Jacobi map |
| AutomorphicGaloisRepresentations R19.1, R19.6 | 2 (GH.0) | GH.5 admissible triple; GH.7 critical twist, family tower, family representation |
| AutomorphicPadicLFunctions L3h | 1 (GH.0) | GH.1 depletion; GH.4 BDP, CH 4.9, 5.7, 5.8; GH.6 nonvanishing; GH.7 family measure |
| ComplexMultiplicationAndExplicitReciprocity CM.1 | 1 (GH.0) | GH.0 CM curve; GH.1 isogenies, field of definition, character class; GH.2 conjugation; GH.7 critical twist |
| DerivedDeRhamCohomology DD.2 | 1 (GH.0) | GH.0 cohomology and Hodge filtration; GH.1 homological triviality |
| EtaleDualityAndPerverseSheaves EDC.6 | 1 (GH.0) | GH.0 cohomology; GH.1 homological triviality, étale Abel–Jacobi map |
| EulerSystemsAndKolyvaginSystems ES.5 | 1 (GH.0) | GH.6 rank one and rank zero |
| HeegnerPointEulerSystems HE.1 | 1 (GH.0) | GH.7 family tower |
| ModularCurvesPartII R14.3 | 1 (GH.0) | GH.0 product, cohomology, filtration, coefficient projector, good model; GH.1 depletion; GH.2 conjugation; GH.7 family tower |
| PadicDifferentialEquationsAndRigidCohomology RD.4 | 1 (GH.0) | GH.1 residue pairing, Coleman primitive |
| PadicHodgeRegulators D.2, L1, L3 | 3 (2 GH.0, 1 GH.8) | GH.1 syntomic comparison; GH.8 differential evaluation, weight-two reciprocity; GH.2, GH.4, GH.5, GH.7 regulators |
| PadicHodgeTheory R06.2, R06.5 | 2 (GH.0) | GH.1 filtered Frobenius extensions, p-adic Abel–Jacobi map; GH.2 Frobenius congruence, finite local class |
| SchemeAndStackFoundations SF.2, SF.5 | 2 (GH.0) | GH.0 good model, projectors; GH.1 cycle, étale Abel–Jacobi map, residue pairing |
| SelmerIwasawaCohomology L4 | 1 (GH.0) | GH.6 parity |

## Notes for other roadmaps

- **Consumers can cite node ids.** AutomorphicGaloisRepresentations R19.1 (`parabolic-realisation-premotive`, `scholl-projector`) and WeightsInEtaleCohomology R34.5 cite layer GH.0, which has no node for W_m or ε_W alone (see the ownership question). GrossZagierAndArithmeticHeights GZ.9 cites layer GH.1 and the integrated id `GH.1/generalized-heegner-cycles-and-their-abel-jacobi-images`; BDP Theorem 5.13 is `GH.4/bdp-special-value-formula` and the m = 0 cycle `GH.1/generalized-heegner-cycle`. RankZeroOneBSD BSD.6a cites layer GH.7 in three nodes; the inputs it needs are collected by `GH.8/corrected-bsd-input-export`.
- **The BSD.0 request** to GH.7 names a "Chida–Hsieh erratum"; the erratum the roadmap uses is Castella–Hsieh's.
- **GZ.8's request** for BDP Theorem 5.13 under BDP Assumption 5.12 is answered by `GH.4/bdp-special-value-formula` (GH.4, not GH.1).

## For the orchestrator and the reviewer

- **No reviewed mathematics changed.** No packet, part document or part Lean file was edited. The document's node prose differs from the packets only in the notation listed above; the Lean file differs from the parts only in the standard note, the section wrappers and the r → m comment text.
- **Regenerating the document** after packet fixes: the generator and its prose fragments were scratch files of this job and are not kept. The node sections follow a fixed format (anchor, heading, meta line, statement, then bold-labelled fields); a later job can regenerate them from the packets and keep the hand-written introduction, layer overviews and closing notes.
- **Planets.** 40 in all: GH.1 and GH.6 show six each, the limit; the others fewer.
- **Checks run:** `check_blueprint.py` on both part packets (0 errors, 0 warnings); the field-coverage and link script on the document; `lean-check` on the harness copy (exit 0, only `sorry` warnings); `intake.py check-files` on the three deliverables.
