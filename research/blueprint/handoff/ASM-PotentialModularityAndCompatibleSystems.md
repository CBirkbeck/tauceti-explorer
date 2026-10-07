# Handoff: ASM-PotentialModularityAndCompatibleSystems (issue #253)

This job assembles the roadmap *Potential modularity and compatible systems* from its two parts:

- R23.1–R23.6, R24.1, R24.2: written by BP-PotentialModularityAndCompatibleSystems--R23.1, reviewed by REV-PotentialModularityAndCompatibleSystems--R23.1;
- R24.3, R24.4, R24.5 with R24.5:operations, R24.6: written by BP-PotentialModularityAndCompatibleSystems--R24.3, reviewed by REV-PotentialModularityAndCompatibleSystems--R24.3.

Worker: Claude, session claude-4KQqaq, 7 October 2026. I took no part in either part or in either review. This is a complete assembly, not a checkpoint.

## Files

- `research/blueprint/readmes/PotentialModularityAndCompatibleSystems.md`: the full roadmap document.
- `research/blueprint/suggested/PotentialModularityAndCompatibleSystems.lean`: the two parts' suggested files, joined.
- `research/blueprint/handoff/ASM-PotentialModularityAndCompatibleSystems.md`: this note.

The part packets are not deliverables of this job (the queue lists only the three files above), so they are unchanged. The fixes they need are listed below for a job that owns them.

## Both reviews' remaining objection is answered by the document

Both packets carry `review.status: needs_changes`, and both reviews give the same single reason: the part reader documents, which the review issues could not edit, still state text the reviews corrected in the packets. The reviews say the plans themselves need no further revision.

The assembled document is generated from the corrected packets, so it agrees with them node for node. A script checks that every packet field occurs in it after whitespace normalisation: 2401 fields (statements, titles, hypotheses, proof steps, acceptance checks, API and test names and statements, uses, excerpts, locators, prerequisites, planets, gaps, requests, source-issue fields and open items); none is missing. In particular every repair the two reviews list is in the document:

- R23.1 review: the Moret–Bailly criterion K′ ⊗_K L_v as an L_v-algebra; Taylor's auxiliary data with E9 (β_vβ_v^c = q_v), the Teichmüller branch and the extra exclusion p ∤ q_v − 1, and the algebraic, not cyclotomic, reading of α_wα_w^c = p; ω⁻¹ in the proof of Taylor's Lemma 1.5; no claim that Taylor's polynomial or weight computations were checked in Lean; the odd auxiliary lifting routed to R22.5; the corrected H6 request consumers; the 36 API items, 22 tests and 22 gaps.
- R24.3 review: every section of its "Required reader synchronisation" table, including `residual-members` (ii) (cofinite irreducibility), the scoped `dieulefait-families` with its new gap and E5, the R23.5 and R19.5 inputs of `almost-strict-compatibility`, R06.3/weil-deligne-descent in place of the weight-two crystallinity criterion, `theta_bound_depends_on_system`, the supplier "used by" lists, and the E1–E5 verdicts.

The part documents `readmes/PotentialModularityAndCompatibleSystems--R23.1.md` and `--R24.3.md` are superseded and were not edited. A re-review of the two packets against this document should find the reviews' stated reason resolved. Neither review verdict was changed.

## What was done

**The document** (4728 lines).

- Generated from the two packets by a script; the introduction and the layer overviews are new prose, checked against the node statements.
- Introduction: purpose and scope, with what each layer plans and what is not here; boundaries, with the four accepted restructurings that fix them (RS-06, RS-08, RS-12, RS-21) and the internal dependency discipline; a generated table of every other roadmap's layer or node imported, with the consuming nodes; a generated table of every node of another packet that cites this roadmap; a table answering, by node id, the ten requests other roadmaps have filed with this one; conventions (splitting over L_v, which prime is which in each source, the two Frobenius and Hodge–Tate normalisations, the compatibility contracts); the 29 sources with versions and passages read; the 30 pinned declarations; and a layer overview with the planets.
- Each layer has an overview, its open items, and every node in an order that puts prerequisites first: statement, hypotheses, proof outline, API, unit tests, acceptance, uses, ownership, dependencies (linked within the document), proposed location, suggested-file coverage, and sources with their literal excerpts. R24.5:operations stands before R24.5, whose constructions use its carrier.
- R23.6 has no nodes; its section carries the export and noncircularity table, which is the content the R23.1 part proposes to fold into the introduction.
- Closing sections: cross-part prerequisites, all 59 requests by supplier, the 29 gaps (G1–G29), the 14 source issues with their review verdicts, the two structural proposals, the R24.3 part's notes for the maintainer, and a generated table of layer dependencies.
- 1064 internal links, all resolving.

**Notation.** The R23.1 part writes much of its prose in ASCII (rho-bar, epsilon, wp, X-bar, Z_p, ->), the R24.3 part in Unicode. The document's node prose from the R23.1 part uses the R24.3 part's spellings (1027 token substitutions: ρ̄, ε, ℘, X̄, ℤ_p, →, ℚ, 𝔽_l and so on); the Conventions section lists them. Excerpts, locators, node ids, declaration names and code spans are untouched, and nothing in the R24.3 part is respaced (its Q_v is a Frobenius polynomial). Prime letters follow each source; the Conventions table says which is which.

**Cross-part prerequisites.** The R23.1 part never cites the R24.3 part. The R24.3 part cites four layers of the R23.1 part by stage id in fifteen places, although nodes now exist for them; the document's "Cross-part prerequisites" section gives the supplying node for each, and the packet fix is item 1 below. One citation has no supplying node: `R24.3/modern-prescribed-type-lifts` needs Snowden's Theorem 6.1.1 (finiteness of the global ring with local rings of definite type over a totally real field), which it calls "the analogue of R24.1", and no node of R24.1 states it. The node graph of both parts, with every packet it reaches, is acyclic, and no node uses a node of a later layer.

**`check_blueprint.py`**, with the pinned declaration index (`TAUCETI_BASELINE` set to the baseline directory), reports 0 errors and 0 warnings on both part packets. `intake.py check-files` passes on the document and the Lean file.

**The Lean file** (2024 lines).

- One standard note, one import block (27 Mathlib modules and `TauCeti.AlgebraicGeometry.LineBundle.Class`), and three namespaces: `TauCeti.PotentialModularity` (R23.1–R23.5), `TauCeti.CompatibleSystems` (R24.1–R24.2 from the first part, then R24.3–R24.6) and `TauCeti.CompatibleSystems.Tests`, followed by the second part's catalogue of omitted signatures.
- The parts defined `GaloisGroup` twice, as `AlgebraicClosure F ≃ₐ[F] AlgebraicClosure F` and as `Field.absoluteGaloisGroup F`; the joined file has one, `TauCeti.PotentialModularity.GaloisGroup F := Field.absoluteGaloisGroup F` (the same type, in Mathlib's vocabulary), opened selectively in the other namespaces. No other name clashed. Every declaration, docstring and example of both parts is kept.
- Every one of the 204 API and test names of the packets occurs in the file.
- **Elaboration.** The shared `lean-check` build has Mathlib at the pin but not the Tau Ceti line-bundle modules, so `lean-check` on the file itself stops at its first import (`TauCeti/AlgebraicGeometry/LineBundle/Class.olean` does not exist), as the R23.1 review also found. To check it anyway, I built a scratch copy in which that import is replaced by the 20 Tau Ceti source files it needs, read at the pinned commit f790474 and inlined in dependency order (module keywords removed, sections closed per file, one `open` moved so that it resolves as in its own module). `lean-check` on that copy, at Mathlib 082e2d3, exits 0: no errors, and the only warnings from the joined file are its 158 `declaration uses 'sorry'` (the parts' 79 + 79); the inlined Tau Ceti code adds one warning that `@[expose]` has no effect outside a module. So the whole joined file, including the rigidified Picard prototype that neither the R23.1 author nor its reviewer could compile, elaborates against the pinned Tau Ceti definitions. The scratch copy is not committed.

## Fixes the part packets need (not deliverables here)

1. **Stage citations in the R24.3 packet that should name nodes.**
   - `R24.3/theorem-5-1-part-1-minimal-crystalline`, `-part-2-weight-two`, `-part-3-level-one-type-at-q`, `-part-4-level-two-type-at-q`: replace `…:R24.1` by `PotentialModularityAndCompatibleSystems:R24.1/kw-ii-theorem-10-1-finiteness-of-the-unframed-global-ring` and `…:R24.2` by `PotentialModularityAndCompatibleSystems:R24.2/characteristic-zero-points-of-R-bar-S-psi-give-lifts-of-required-type` (their proof steps cite "R24.1, KW II Theorem 10.1" and "R24.2, KW II Corollary 4.7").
   - `R24.3/finite-presentation-complete-intersection`: replace `…:R24.2` by `DeformationAndDerivedPatchingAlgebra:R03.4/characteristic-zero-points-from-finiteness-and-dimension`, the algebraic extraction the R24.2 nodes themselves use.
   - `R24.3/kw-annals-minimal-lifts`: replace `…:R24.1` by `PotentialModularityAndCompatibleSystems:R23.3/kw-annals-theorem-2-1-taylor-potential-modularity-with-ordinarity` (KW Annals Proposition 3.8 is finiteness by Taylor's potential modularity and Fujiwara's R = T; it already cites `GL2ModularityLifting:R22.3/minimal-ring-finite`) and add `DeformationAndDerivedPatchingAlgebra:R03.4` for the finite-image criterion of Lemma 3.6.
   - `R24.3/modern-prescribed-type-lifts`: replace `…:R24.2` by the R03.4 extraction node; for `…:R24.1` there is no node. Either the R23.1 packet gains a node for Snowden's Theorem 6.1.1 in R24.1, built on `R23.3/snowden-totally-real-potential-residual-modularity` and an R = T theorem over the totally real field, or the R24.3 packet records the gap.
   - `R24.5/brauer-induction-system`, `R24.5/dieulefait-families`: replace `…:R23.4` by `PotentialModularityAndCompatibleSystems:R23.4/potential-modularity-of-a-given-lift`.
   - `R24.5/almost-strict-compatibility`: replace `…:R23.5` by `PotentialModularityAndCompatibleSystems:R23.5/control-of-the-extension` (its "(iii) d) of Theorem 6.1").
   None of these changes a statement; all edges point to earlier layers, so no cycle arises.
2. **Duplicate source-issue ids.** Both packets number their findings under `PotentialModularityAndCompatibleSystems/E…`: the R23.1 packet E2–E10, the R24.3 packet E1–E5. E2, E3, E4 and E5 therefore name two different findings each, and `data/source-issues.json` and `research/errata/REGISTER.md` already list both. Renumber the R24.3 packet's E1–E5 as E11–E15 and update the in-node references to them (`R24.5/system-l-functions` cites E2, `R24.5/serre-theta-uniform-bounds` E3, `R24.5/dieulefait-families` E5). The register's line for KW II, proof of Theorem 10.1, "already recorded in the atlas as PotentialModularityAndCompatibleSystems/E2", means the R23.1 packet's E2. The document disambiguates by part.
3. **`upstreamNotes` format.** The R24.3 packet writes `{"where", "note"}`; PROTOCOL §10 asks for `{"roadmaps", "note"}`, and two of its three notes concern proposed roadmaps, not Tau Ceti (the R24.4 stage edge; R19.5). The R24.3 review raised the same point.
4. **A non-existent owner.** The R23.1 packet's scope note and Qian source record say that Qian's Lemma 2.1 "belongs to Dwork Part II". No such roadmap exists. The closest owner is ModularityAndLanglandsExtensions ML.2 (potential automorphy assembly), whose `moret-bailly-galois-control` node cites R23.1's Moret–Bailly theorem. The document names ML.2 and does not mention a Dwork Part II.

## Structural proposals of the parts

| Proposal | Part | Status |
|---|---|---|
| Fold the process layer R23.6 into the introduction; assign its residual, given-lift and field-control exports to R23.3, R23.4 and R23.5 | R23.1 | awaiting the maintainer. The document keeps R23.6 as a layer, with the export table in its section, so the fold is a deletion of that layer when the maintainer applies it. |
| Create "Class field theory, Part II: algebraic ℓ-adic character realization and classification" (upstream ClassFieldTheory first; GlobalNumberFields Layers 9–10 imported), supplying the type-A₀ Hecke realization, common coefficient field, local comparison and converse classification that `R24.5/character-system` requests | R24.3 | awaiting the maintainer; the request stands against upstream ClassFieldTheory Layer 11 meanwhile |

## Requests of the parts

59 requests (33 from the R23.1 part, 26 from the R24.3 part) to 51 supplier layers. They are given in full, with the exact statement needed, in the document's "Requests to other roadmaps" section; this is the index. Two (upstream GlobalNumberFields Layers 9 and 10) are `provided-upstream`; the R23.1 part's are `open`; the R24.3 part's carry `open` except those two.

| Supplier | Requests (part) | Needed by |
|---|---|---|
| AbelianSchemesAndArithmeticModuli A6 | 1 (R23.1) | R23.1 Moret–Bailly above a preliminary field, Snowden's soluble preliminary field, surjective specialisation; R23.2 restriction of scalars; R23.5 BCGP local data |
| AlgebraicModularFormsAndSerreWeights R15.4, R15.6 | 2 (R24.3) | R24.4 (α), (β); R24.5 KW I 5.1 systems; R24.6 residual members; R24.3 lift types |
| AlgebraicModuliForArithmeticGeometry R09.3 | 1 (R23.1) | R23.1 generalised Picard functor |
| ArithmeticGaloisRepresentations R01.1–R01.5, G7 | 6 (R24.3) | most nodes of R24.5:operations; R24.3 lift types; R24.5 Brauer system; R24.6 residual members, linked systems |
| AutomorphicGaloisRepresentations R19.2–R19.6 | 7 (both) | R23.3 Taylor 2006, KW 6.1, Snowden, BCGP; R24.1 KW 10.1; R24.5 Brauer, almost strict and strict systems; R24.6 linked systems and local compatibility |
| DeformationAndDerivedPatchingAlgebra R03.3, R03.4 | 2 (both) | R24.3 Böckle's Lemma 2; R24.1 KW 10.1 |
| EndoscopicTransferAndUnitaryTraceComparison ET.6 | 1 (R24.3) | R24.5 system L-functions |
| GL2AutomorphicRepresentationsAndTransfer R17.3–R17.6 | 6 (both) | R23.3 (Langlands–Tunnell, Jacquet–Langlands, base change); R23.5 control; R24.4; R24.5 Brauer system |
| GL2ModularityLifting R22.3, R22.4, R22.5 | 4 (both) | R23.3 KW 6.1, Snowden; R24.1 auxiliary field; R24.3 Böckle's Theorem 1; R24.4 KW I 4.1 |
| GlobalGaloisDeformations R04.6 | 1 (R23.1) | R23.3 Snowden; R24.1 ordinary finiteness; R24.2 Newton–Thorne |
| HilbertModularVarietiesAndShimuraCurves H6, R18.3 | 3 (R23.1) | R23.2 moduli applications; R23.3 KW 6.1, KW Annals 2.1, Taylor 2006 |
| LocalGaloisDeformationRings L8, R08.2, R08.6 | 5 (both) | R24.1 ordinary and CG finiteness, auxiliary field; R24.2 Newton–Thorne; R24.3 lift types, prescribed-type lifts |
| OrdinaryAutomorphicFormsAndModularityLifting R21.4–R21.6 | 3 (R23.1) | R23.3 Taylor transfer, Taylor 2006, KW 6.1; R24.1 ordinary and CG finiteness |
| PadicFamilies L5 | 1 (R23.1) | R23.3 KW 6.1, KW Annals 2.1; R24.2 Newton–Thorne |
| PadicHodgeTheory R06.2, R06.4 | 2 (both) | R24.5:operations Hodge data; R23.3 Taylor 2006 Lemma 1.4 |
| SchemeAndStackFoundations SF.1–SF.4 | 4 (R23.1) | R23.1 Moret–Bailly proof, function-field torsor, specialisation, Theorem G; R23.5 BCGP local data |
| SerreWeightAndLevelOptimisation R20.3, R20.6 | 2 (both) | R23.3 KW 6.1; R24.4 (α), (β) |
| WeightsInEtaleCohomology R34.6 | 1 (R24.3) | R24.5 strict Brauer system |
| Tau Ceti Chebotarev Layer 10; ClassFieldTheory Layers 7, 11, 12; GlobalNumberFields Layers 9, 10; InductionRestriction Layer 6 | 7 (both) | R23.1 Frobenius primes, CHT lemmas; R23.2 Taylor's Lemma 1.1; R24.5:operations characters, purity, Grothendieck ring; R24.5 Brauer system |

## Notes for other roadmaps

- **Consumers can cite node ids.** The document's table "Requests other roadmaps have filed with this one" gives, for each of the ten requests filed here, the nodes that answer it, and what they leave open: KW Annals Theorem 4.2 and Snowden's Theorem 5.1.2 have no node of their own; refinements (a) and (c) of the GL2ModularityLifting R22.1 request (a p-primary component of p-power order; weak approximation for squares) are stated by no node; `R24.5/compatible-system` states the comparison with Dieulefait–Pacetti's Definition 1.10 but its API has no separate predicate for their clauses (4)–(5). In particular GL2ModularityLifting R22.1 cites the layer R23.1 where `R23.1/cht-character-extension` and `R23.1/cht-soluble-prescribed-completions` now exist, and ClassicalSerreModularity R27.3 and SmallRamificationAndAbelianVarietyBaseCases R25.5 cite layers R23.4, R24.3, R24.5 and R24.6 where nodes exist.
- **ClassicalSerreModularity R33** consumes `R24.5/dieulefait-families`, which plans DP Theorem 1.11 only for the lifts R23.4 reaches (source issue E5 of the R24.3 part). The R24.3 review made the same point.

## For the orchestrator and the reviewer

- **No reviewed mathematics changed.** No packet, part document or part Lean file was edited. The document's node prose differs from the packets only in the notation listed above; the Lean file differs from the parts only in the single `GaloisGroup` abbreviation, the standard note and section headers.
- **Regenerating the document** after packet fixes: the generator and its prose fragments were scratch files of this job and are not kept. The node sections follow a fixed format (heading, meta line, statement, then bold-labelled fields); a later job can regenerate them in the same format from the packets and keep the hand-written introduction and layer overviews.
- **Planets.** R23.1, R23.3 and R24.5:operations show six each, the limit; the others fewer; 29 in all.
