# RT-PAPER-CESNAVICIUS-21: red team of the Česnavičius Macaulayfication extraction

Red team: Claude Code, session `cc-f805bf`, 30 September 2026 (issue #4328).

**Target.** `PAPER-CESNAVICIUS-21`, the extraction of K. Česnavičius, *Macaulayfication of Noetherian schemes*, [Duke Math. J. 170 (2021), no. 7, 1419–1455](https://doi.org/10.1215/00127094-2020-0063). The preprint is [arXiv:1810.04493](https://arxiv.org/abs/1810.04493), and v2 is the last version.

**Who did what.**
- `cc-7b31c4` wrote the extraction (issue #2184).
- `REV-PAPER-CESNAVICIUS-21` (`cc-38267a`, issue #2185) accepted it after substantial corrections.
- I did neither job.

**Disclosure.** This session filed RT-PAPER-TEMKIN-17 (PR #4697), which named SchemeAndStackFoundations SF.4 as the owner of alterations and resolution. No finding below relies on it. Finding 4 mentions SF.4 only because PAPER-LE-LEHUNG-LEVIN-ETAL-23 itself proposes it.

**Result: six findings, two medium and four low. None is high.**

- The mathematics of the extraction holds up:
  - every item statement I compared with the TeX is faithful;
  - all nine source issues re-derive;
  - every library citation holds at the pinned commits.
- The medium findings are about routing:
  - a cross-route dependency that the queue can no longer honour;
  - an owner for Noetherian dualizing complexes that does not plan them.

The machine-readable file is [RT-PAPER-CESNAVICIUS-21.result.json](RT-PAPER-CESNAVICIUS-21.result.json).

## Source

Fetched on 30 September 2026. All three hashes match the ones the extraction records.

| Text | Where | SHA-256 |
| --- | --- | --- |
| arXiv v2 e-print (TeX + bibliography) | [arXiv](https://arxiv.org/e-print/1810.04493v2) | `8704c071…d088` |
| arXiv v2 PDF (24 pp.) | [arXiv](https://arxiv.org/pdf/1810.04493v2) | `a07d62e6…07b9` |
| Author's file, dated 28 July 2020 (24 pp.) | [author's page](https://webusers.imj-prg.fr/~kestutis.cesnavicius/macaulayfication.pdf) | `55ded201…9ac6` |

- arXiv lists only v1 and v2.
- The author's page lists no corrigendum.
- The Duke version of record could not be fetched: Project Euclid served a bot block (finding 6).

**How I read it.**
- I re-read the whole paper in the TeX (ll. 684–2045).
- I checked the locators in the text layers of both PDFs.
- I re-derived the proofs of Proposition 4.4, Proposition 5.2, Theorem 5.3 and Proposition 5.5 step by step.

## What held

- **Coverage.** Every numbered statement and paragraph, Conjecture 1.1 to Proposition 5.5, has an item. So does footnote 1. The review's 22 added inputs close most of the gaps in the proofs. The two exceptions are findings 4 and 5.
- **Statements.** The review's rewrites are right. This covers items /12 (E1), /16 (E4), /43 (E5), /45 (E6), /49 (E7) and /55 (E9). Items /7, /57 and /59 carry the main theorems' exact hypotheses:
  - Theorem 1.6 needs a CM-quasi-excellent Noetherian scheme;
  - Proposition 5.2 needs CM-excellent and locally equidimensional;
  - no global dualizing complex is assumed.
- **Source issues.** All nine hold:
  - E1 and E2 are at TeX ll. 854 and 873.
  - E3 holds, and so does the review's extension of it to Theorem 2.13.
  - E4 holds: off the support, depth is +∞ and dimension is −∞.
  - E5: over k[[t,u]], M = R/(u) ⊕ R has d-sequence (t, u). Its t-torsion is 0, but its tu-torsion is R/(u) ⊕ 0.
  - E6–E8 hold at the TeX. In E8 both forms are true.
  - E9: over A = k[[s,t,u,v,z]]/((s,t)∩(u,v)) with K = (z), take the module (A/K) ⊕ k. The product of the A-annihilators is 𝔪², but the preimage is 𝔪² + (z). Both repairs work, because Proposition 4.4 uses only the ideals (j_1,…,j_i).
  - I found no further mistakes, only grammar.
- **Library.** I opened all 35 cited declarations at Mathlib `082e2d3` and Tau Ceti `f790474`. Each exists as stated.
  - Mathlib has no depth. `RingTheory/Regular/Depth.lean` is a deprecated stub, and `Depth/Rees.lean` holds only Rees's theorem.
  - Mathlib has no Cohen–Macaulay predicate, no excellence, no blowup and no dualizing complex.
  - `Scheme.Birational` is birational equivalence, not a predicate on morphisms.
  - Tau Ceti's `IsInjectiveEnvelope` does not prove existence.
- **Planned statuses.** I read each cited layer in full:
  - /13 is planned in AdicCoefficientsAndComparisons L2, which plans the nonnoetherian Nagata statement.
  - /62 is planned in StableReduction Layers 4 and 2, including flat base change.
  - /73 is planned in JacobianChallenge C.
  - /75 is planned in L2, on top of Mathlib's `Scheme.Hom.image`.
  - /16 is only partly planned (finding 3).
- **Duplication.** I compared the items with the extractions that touch the same material:
  - André 2018 (big CM algebras, R03.3 local cohomology);
  - Bhatt 2018 (blowups for SF.4);
  - Temkin 2017 (normalisation and flattening in L5);
  - Bhatt et al. 2023 and Hacon–Witaszek 2023 (AS.1, R03.3);
  - Česnavičius 2019 (SGA 2 on SF.4);
  - Iyengar–Khare–Manning 2024;
  - Böckle–Iyengar–Paškūnas 2023.

  Only the overlaps in findings 2 and 4 remain.
- **Prerequisites.** All 14 DOIs resolve through Crossref to the cited works, including the review's corrections (Deligne, GLL, Kollár, Heitmann, Heinrich).

## Findings

### 1. The dependency of route 1 on routes 2 and 6 is lost in the queue (medium, other)

**What route 1 needs.** Route 1 (Macaulayfication) imports Kawasaki's Theorem 3.14, Proposition 3.11 and the module blowups from route 2. It imports the avoidance lemma from route 6.

**What the file records.**
- Route 1's `prerequisites` name neither sibling.
- Its brief imports them by the ids `KawasakiCohenMacaulayBlowingUps` and `SchemeAndStackFoundationsPartIIArithmeticPresentation`.

**What the queue does.** Since commit 7685a59f (28 September, after the review), `make_queue.py` builds one design job per Part II parent (l. 423):
- route 1, route 6 and seven other continuations become DESIGN-SchemeAndStackFoundationsPartII (issue #3361);
- route 2 becomes DESIGN-DeformationAndDerivedPatchingAlgebraPartII (issue #3476).

**Consequences.**
- None of the three ids in the brief will exist.
- Both jobs are available now, and neither has an `after`. The Scheme job is order 31 and the commutative job is order 146, so the consumer is likely to be designed first. The review required the opposite: "Route 2 must be designed before route 1".
- The review's reason for copying Bhatt et al.'s brief into route 6 no longer describes the queue: "make_queue.py keeps one brief per shared design id, and the later paper in papers.json wins".

**Fix.**
- In route 1:
  - import from DeformationAndDerivedPatchingAlgebraPartII by that id, and add it to route 1's prerequisites;
  - say that the avoidance lemma is planned inside the same Scheme Part II job.
- In route 6, drop the sentence about make_queue.
- For the maintainer, either of these:
  - make the Scheme Part II job wait for the commutative one;
  - have the commutative job reserve node ids for Proposition 3.11, §3.13 and Theorem 3.14.

### 2. AS.1 does not plan Noetherian dualizing complexes, and the IKM-24 precedent is misread (medium, other)

**What route 5 does.** It sends items 39, 52, 79 and 80 to AnalyticStacks AS.1:
- ring-level dualizing complexes;
- their normalisation;
- local duality;
- existence and the Cohen–Macaulay criteria.

**What AS.1 plans.** AS.1's contract is Scholze's Lectures VII–VIII:
- locally compact spaces;
- the quasi-coherent formalism on derived schemes;
- Grothendieck–Serre duality for proper smooth maps;
- D-modules.

Its inputs are AS.0, SolidAnalyticRings SA.0 (light condensed anima), EnhancedDerivedSheaves E1 and E5:animation, SF.1 and DD.2. Item 39's note concedes that "AS.1's own text does not plan it".

**The consequence.** Route 2 is pure local algebra (Lemma 3.6, Kawasaki's theorem). Through this owner it becomes downstream of condensed anima.

**The misread precedent.** Route 5's reason says that the rejection of IKM-24 route 3 "confirms the choice". That review rejected the route because the duality package was "not explicitly in the named stage contracts". It also left "generic local duality/Tate ownership" unresolved. The same objection applies to AS.1.

**Fix.**
- Correct route 5's reason.
- Record the owner as an open maintainer decision. The recommended owner for the ring-level items 39, 79 and 80 is R03.3, as an explicit extension of its contract. R03.3 already receives local cohomology (/76) and the injective hull (/78) from these routes.
- Leave item 52 with the scheme-level owner the maintainer picks.
- Drop AnalyticStacks from route 2's prerequisites.
- Move the accepted routes 5 of Hacon–Witaszek and Bhatt et al. together with these items.

### 3. Sheaf-level (S_n) and Cohen–Macaulay predicates have no owner (low, missing)

Item 16 is marked planned in R03.3 and SF.0, but neither layer plans these predicates:
- R03.3 plans finite modules over rings;
- SF.0 plans quasi-coherent modules;
- the (S_k) precedent it cites is also module-level.

The note says that "route 1 states [the sheaf-level form] as an adapter". Route 1's brief does not. Its "Construct here" list omits these notions:
- Supp(𝓜) as the closed subscheme cut out by the annihilator;
- (S_n) and Cohen–Macaulay coherent modules;
- (S_n) and Cohen–Macaulay schemes, the predicate in the conclusion of Theorem 1.6.

**Fix.** Add them to route 1's list, with the E4 convention, next to item 26's loci. Correct item 16's note.

### 4. Ascent of formal-fibre properties has no item, and it overlaps LLL-23 (low, missing)

**Where the theorem is used.** EGA IV₂ 7.4.4 (with 7.3.8) says that a property of the formal fibres ascends along morphisms locally of finite type.
- Remark 1.5 and §2.10 rest on it for P = Cohen–Macaulay and P = (S_n).
- The proof of Proposition 2.7 uses the regular case: "Since X̃ inherits quasi-excellence". Item 1 does not state that case.

**The overlap.** PAPER-LE-LEHUNG-LEVIN-ETAL-23/Z79 (G-rings are stable under essentially finite type maps) proposes the regular case for SF.4. That extraction is partial and unreviewed.

**Fix.**
- Add one item, "EGA IV₂ 7.4.4 for P ∈ {regular, CM, (S_n)}", with the corollary for quasi-excellence (7.8.3).
- Cite it from items 1, 6, 25 and 28, and plan it once in route 1.
- Reconcile the owner with LLL-23 when that extraction is reviewed.

### 5. The blowup dimension bound HIO 12.14 has no item (low, missing)

The proof of Theorem 3.14 (p. 14) starts from dim Bl_I(Supp M) ≤ dim Supp(M), which is Herrmann–Ikeda–Orbanz 12.14. This is what reduces Cohen–Macaulayness to depth at closed points.
- StableReduction Layer 4 plans no dimension statement.
- Mathlib has `reesAlgebra`, but no dimension formula for it.

**Fix.** Add an item on route 2, via dim R[It] ≤ dim R + 1.

### 6. The "published version" read is the author's July 2020 manuscript (low, other)

**What the file is.** The file recorded as "the author's copy of the published version" is not the Duke text:
- page 1 prints "Date: July 28, 2020";
- the PDF was created on 28 July 2020 and has 24 pages;
- it predates arXiv v2;
- Duke's pages 1419–1455 are 37 pages.

**What follows.** Neither the extraction nor the review read the version of record. Their claims that the published and arXiv texts are "the same", and that "both carry" E1 and E2, compare two texts that the author produced.

**Fix.**
- Relabel the file as the author's final manuscript.
- Add `sourceVersions` entries for the author copy and the preprint, noting that the Duke text was not read.
- Scope E1–E9 to those two texts.
- List the paper in `research/blueprint/collation/REQUESTS.md`.

## Checks

- `python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-CESNAVICIUS-21.result.json`: ok.
- `python3 research/blueprint/intake.py check-files` on both deliverables: 2 files, 0 problems.
