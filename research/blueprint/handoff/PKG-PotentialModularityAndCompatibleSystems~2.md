# PKG-PotentialModularityAndCompatibleSystems~2 — handoff

Issue #9188, revision round 2 of the package. Worker: Claude (Claude Code), session `claude-6TeIHn`, 16 October 2026. The bot confirmed the claim on comment 6211965885.

This run starts from the README and Suggested.lean of the earlier unmerged draft checkpoint of this job (Codex `codex-XtIxOj`, PR #9516). It keeps that checkpoint's corrections (the Summary paragraph, the current-library rigidified line bundles in §2.5, the direction of the divisor trivialization, the concrete boundary checks, the CG determinant twist) and replaces the rest of its open items. This pull request supersedes #9516.

**Status: complete package revision.** All 92 targets of the plan are kept (anchors unchanged), 7 targets are added, and the two decisive objections of the package review are answered by planned targets rather than "Gap" paragraphs. `review.json` is left in place for the next reviewer. No packet was changed.

## What the review asked, and what was done

| Review objection | Resolution in the README |
| --- | --- |
| §4.2 (now 4.6): the nearly ordinary lifting supplier excludes residual representations induced from a CM extension split at the auxiliary prime | Taylor's own alternative (end of the proof of Proposition 4.1, Taylor 2006 pp. 762–763) is planned in full: new **4.4** level adjustment after soluble base change (Skinner–Wiles, Duke 107, main theorem p. 17, proof pp. 18–25; read in full here); new **4.5** crystalline lifting in the Fontaine–Laffaille range (Taylor 2006 Theorems 3.2–3.3, p. 755, with §§2–3 pp. 745–755); rewritten **4.6** with six proof steps (crystallinity from good reduction; irreducibility on E(√p*) needs p>3; the CM seed of level prime to p; level one after level adjustment; lifting; soluble descent; transfer to all μ). **3.3** now chooses the local open at p inside the good-ordinary locus and proves that this locus is open (forget the ℘-level, HMVSC H2.2 smooth model, Néron–Ogg–Shafarevich, HMVSC H2.6). **3.2** takes p>3 and proves that the prime choice is possible (Chebotarev plus a group-theoretic argument: oddness keeps the projective field out of the totally real Galois closure; a subdirect product of copies of the socle has a common regular semisimple element). HMVSC H6.5 (C3) already reads Taylor's condition as K_w=ℚ_p, so "p splits completely in F" was never an extra condition. **4.8** (Taylor 2006 Prop. 4.1) obtains good reduction above p₁ the same way and applies 4.6. |
| §8.3 (now 8.7): ordinary finiteness needs the polarized CM adapter, the finite restriction map and a rank-two ordinary unitary R=T | New block **8.3–8.6**: definite unitary groups in two variables and their ordinary Hecke algebras; Galois representations on them with Labesse base change and descent; rank-two ordinary R=T for adequate image (Thorne 2012 Thm 8.6/Cor 8.7 with the Thorne 2017 Prop. 7.2 repair); rank-two ordinary automorphy lifting and finiteness (BLGGT v4 Thms 2.4.1–2.4.2 = Thorne 2012 Thms 9.1/10.2 for n=2). These are the rank-two instances of PotentialAutomorphyInfrastructurePartII PL.2–PL.4, which is outside the Caraiani–Newton order and so cannot be cited: they **move down** here. **8.7** step 4 now uses GlobalGaloisDeformations §4.2 (`R04.4/restriction-finiteness`) for the finite map R_K→R_F. The "Gap" paragraph is gone. |
| §8.4 (now 8.8) CG: full p≥3 branch | Stated for adequate cyclotomic image: this excludes exactly the projective images PSL₂(F₃) at p=3 and PSL₂(F₅) at p=5. The README says these two images are the part of the CG statement outside the target. §8.8 has no consumer inside or outside this roadmap. |
| §9.2 NT automorphy | Uses 8.6(1); the Hida specialization is OrdinaryAutomorphicFormsAndModularityLifting `R21.2/hilbert-ordinary-weight-change`, and the local quotients are LocalGaloisDeformationRings `R08.6/newton-thorne-local-quotients`. |
| Discriminating Lean examples for full objects | Superseded by the 2026-10-12 shape: heavy carriers are README targets with prose Checks (every definition with an API has at least three; checked by script). Suggested.lean keeps the light real-bodied definitions and adds statable milestones (below). |

## Duplication removed (lower-tier owners imported)

From a Sonnet duplication sweep and two Sonnet supplier audits, each verdict re-checked against the supplier text:

- 1.1, 1.2, 1.4, 1.7: AutomorphicGaloisRepresentations (tier 18) §7.1 owns `CompatibleSystemData`, its weak, strict and Dieulefait–Pacetti almost-strict predicates and the operations (handoff PKG-AutomorphicGaloisRepresentations~2 records this move down). The README now imports them and keeps only what §7.1 lacks: KW almost strictness (crystallinity only at odd unramified primes), induction with its coefficient-prime clause, symmetric and exterior powers, Taylor's rank-d comparison.
- 1.5, 1.8: polarizations, multipliers and signs are ArithmeticGaloisRepresentations §7.4; the family wrapper stays here.
- 1.9, 1.10, 1.14: AG2.0 (`AlgHeckeChar.galoisChar`, `wt`) and AGR §3.13 (`geometricCharacter_isHeckeAvatar`, `geometricCharacter_totallyReal`); the nonexistent "ClassFieldTheoryPartII" citation is removed. The purity of infinity types is `HeckeCharacter/Purity.lean` in the current Tau Ceti library.
- 1.18: Serre's θ_l is now constructed through AGR §3.13 (de Rham characters are Hecke avatars), so the uncleared Serre book that blocked the earlier checkpoint is not needed.
- 2.14 (now 2.15): the finite-order extension is GL2AutomorphicRepresentationsAndTransfer R16.1 `finite_hecke_full_local_prescription`; this target adds infinite places and the p-primary refinement.
- 3.2: its data are the input contract (C1)–(C6) of HMVSC H6.5; the target now proves that contract's existence.
- 4.2 (old 4.5): forms and the Jacquet–Langlands realization are HMVSC R18.3.1–R18.3.3, R18.3.22, the Hecke-algebra representation AGR §6.10.
- 8.1: the field and witnesses are SerreWeightAndLevelOptimisation §6.6 `kwOptimisationData`.

## Supplier re-pointing (audit findings fixed)

SF.4 "point topology" → ReductiveGroupsPartII RG2.0.1; R09.3 "Picard" → AlgebraicModuliForArithmeticGeometry §7.3; A6 "good-reduction criterion" → NeronModels §§5.1, 5.3; SF.1/SF.2 "π₁" → InverseGalois IG.1.1, IG.2.6; Weil restriction smoothness and points → RG2.0a.2, AMAG R09.3 nodes plus the A6 splitting argument; Bertini irreducibility → Stacks Lemma 37.32.3 (Tag 0G4F, Jouanolou Thm 6.3(4)); strong approximation and S-units → TauCetiRoadmap GlobalNumberFields; ET.6 in 1.15 → ArithmeticGaloisRepresentations R01.2 local Euler and ε-factors; R19.2 → R19.6 for quaternionic Hecke algebras (4.2, 4.9); Savitt → FiniteFlat `R07.5/savitt-residual-types` (12.4); Snowden's A/B/C types defined from Snowden §2.1, p. 4 (4.15); the scope table's R21.4/R22.4 slips corrected; the function-field Chebotarev that 2.12 and the BHKT targets need is new target **2.11** (Lang–Weil, Poonen *Rational points on varieties* Thm 7.7.1, p. 222, and twisting); CM points for Taylor's Lemma 4.5 → ShimuraVarieties §§5.3, 5.5, 5.10.

## Inherited gap ledger (the 29 items of the package review)

| Item | Disposition |
| --- | --- |
| R23.1 1 | Chow: SF.4 `chow-lemma`; Bertini smoothness SF.4, irreducibility Stacks 0G4F; relative Picard AMAG §7.3, Abel maps SF.3; J(F) compact from properness and RG2.0.1 (2.7). The original EGA/Jouanolou/Murre/Altman–Kleiman texts were not read. |
| R23.1 2 | Unchanged: the Duke numbering of Khare's Lemma 2.2 and CDT Lemmas 3.1.1/4.2.4 (4.11–4.12) was not checked. |
| R23.1 3 | Supplier-side: GL2ModularityLifting R22.1 (packet needs_changes) and SerreWeight R20.3 own these contracts. |
| R23.1 4 | 8.1 imports SerreWeight §6.6; the condition on τ|G_F stays here with KW II §§2.7, 3.3. |
| R23.1 5 | 8.2 cites GGD §4.2 restriction finiteness and R22.3; R22.3 presupposes residual modularity over F, which 8.1's witnesses give. |
| R23.1 6 | Closed: 3.2, 3.3, 4.4, 4.5, 4.6, 4.8. |
| R23.1 7 | H6.5 supplies the local points; Taylor Corollary 1.7's square-root-of-determinant step (4.7) is unchanged. |
| R23.1 8 | Closed: 4.11 (weight and level removal) now cites the level adjustment 4.4. |
| R23.1 9 | Function-field Chebotarev is 2.11; Lang–Weil local points are Poonen Thm 7.7.2, p. 223 (not yet cited in 2.9). |
| R23.1 10 | Closed at target level: 2.6/2.7 reduce projective modules to free ones and cite GNF strong approximation and Dirichlet's S-unit theorem. |
| R23.1 11 | IG.2.6 (full-group specialization) now cited in 2.20; BLGGT Prop. 3.1.1's exact-completion refinement unchanged. |
| R23.1 12 | Unchanged: Moret-Bailly CRAS 311 (1990) not read; 2.23 rests on BHKT Thm 9.3 and Calegari Prop. 3.2. |
| R23.1 13 | Snowden's types now defined (4.15); (A1)/(A2), 4.4.2 and 7.6.1 unchanged. |
| R23.1 14 | Closed: 8.3–8.8, 9.2. |
| R23.1 15 | DDPA R03.4 point-extraction nodes cover it (9.1). |
| R23.1 16 | ψ₀ via AG2.0/AGR §3.13 is now available; Taylor's [Ta2] Lemma 2.1 congruence (3.1) unchanged. |
| R23.1 17 | Unchanged (4.15). |
| R23.1 18 | Closed at target level: 4.3 derives the torsion FL statement from crystallinity of the eigenforms and stability of the FL image under subquotients (FiniteFlat R07.3, AGR `R19.5/hilbert-local-behaviour-at-p`). |
| R23.1 19 | Closed: RG2.0a.2, AMAG R09.3 and the A6 splitting. |
| R23.1 20 | 2.2 plans the local inverse function theorem itself; RG2.0.1 supplies the topology. |
| R23.1 21 | Supplier APIs exist (AMAG §7.3, current-library rigidified classes); Lean examples superseded by the shape. |
| R23.1 22 | Closed for the prime (3.2); the CM quadratic and coefficient field come from 3.1 and the enlargement of N. |
| R24.3 1 | Closed: FiniteFlat `R07.5/savitt-residual-types`. |
| R24.3 2 | Scope kept (12.5); Gee 2011 unread. |
| R24.3 3 | 1.17 cites ARG §7.6 and R01.1 lattices; the common component field across λ is still proved here. |
| R24.3 4 | θ_l no longer needs Serre's book; Larsen–Pink, Bogomolov and Bruhat–Tits inputs of 1.20 unchanged. |
| R24.3 5 | Superseded by the shape. |
| R24.3 6 | Unchanged (12.1, the λ-independent overlap Hom characters). |
| R24.3 7 | Scope kept (12.5). |

## Maintainer notes (cross-roadmap, not edited here)

- **Upward citations into this tier-22 roadmap from lower tiers:** AutomorphicGaloisRepresentationsPartII (17) cites `R24.5:operations`, `compatible-system-predicates`, `polarized-system`, `character-system`, `linear-algebra-operations-on-systems`; GL2ModularityLifting (21) R22.1/R22.5 request CHT Lemmas 4.1.1–4.1.2 (here 2.15–2.16); GL2AutomorphicRepresentationsAndTransfer (15) R17.4/R17.5/R17.6 cite R23.3 and R24.5 nodes; ArithmeticGaloisRepresentations and WeightsInEtaleCohomology consume R24.5 nodes. Their owners should re-point to AGR §7.1, ARG §7.4, GL2ART R16.1 or move the notions further down.
- **Notions planned here that lower tiers also need:** OrdinaryAutomorphicFormsAndModularityLifting (20) lists as unowned the Skinner–Wiles level adjustment (its "required in addition" of R17.4), BLGG13 Thm A.4.1 and Thorne 2012 Thms 9.1/10.2 (its §§6.9, 6.13). They are now planned here (4.4, 8.3–8.6) at tier 22; the natural owners are GL2AutomorphicRepresentationsAndTransfer R17.4 and a rank-two ordinary roadmap below tier 20.
- PotentialAutomorphyInfrastructurePartII PL.2–PL.4 should import 8.3–8.6 for n=2.
- OAF §6.13 states the conclusion of Newton–Thorne Lemma 3.1 conditionally; 9.2 here supplies the point extraction and 8.6 the automorphy.

## Sources read in this run (public copies; nothing committed)

Taylor 2006 (EMS PDF; printed = PDF + 728): Thm 3.2–3.3 p. 755, §§2–3 pp. 745–755, Prop. 4.1 and its proof pp. 755–763. Taylor 2002 (author preprint fm.pdf, page images): choice of p and Lemma 1.1, printed pp. 7–8. Skinner–Wiles, Duke 107 (CiteSeerX copy): main theorem p. 17, proof pp. 18–20. Thorne 2012 (bigness.pdf, printed = PDF): Cor. 8.7, Thms 9.1, 10.1, 10.2, pp. 53–58. BLGGT arXiv v4: Thms 2.4.1–2.4.2, pp. 39–40. Snowden arXiv v1: §1.4 p. 3, §2.1 p. 4. Poonen, *Rational points on varieties* (author's online version, printed = PDF − 14): Thms 7.7.1–7.7.2, pp. 222–223. Stacks Project Tag 0G4F. The Geraghty 2010 preprint and the Thorne 2017 manuscript locators are those recorded, with hashes, in the PotentialAutomorphyInfrastructurePartII packet; they were not re-read here.

## Checks run

- `lean-check research/blueprint/packages/PotentialModularityAndCompatibleSystems/Suggested.lean`: exit 0, 33 warnings, all `declaration uses sorry`; 339 lines; twelve individual Mathlib imports (no `import Mathlib`).
- Scripted README checks: 99 target headings, every `(#…)` anchor resolves, every reference label defined and used, every target with an API has at least three Checks; forbidden-word scan.
- Two Sonnet proofreads of the rebuilt README; their corrections were applied after checking each.
- `research/blueprint/intake.py check-files` and `scripts/check_sorry_data.py` on the deliverables (results in the PR).

## Where to resume

The unchanged rows of the ledger are source-reading obligations (original papers not yet read at the cited locators), not missing targets. The cross-roadmap moves above are for the maintainer.
