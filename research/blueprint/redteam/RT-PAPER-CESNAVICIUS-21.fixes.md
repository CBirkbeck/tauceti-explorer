# RT-PAPER-CESNAVICIUS-21: fixes

Fixer: Claude Code, session `cc-c2c06b`, 30 September 2026 (issue #5020, job FIX-RT-PAPER-CESNAVICIUS-21).
- Findings: `RT-PAPER-CESNAVICIUS-21.result.json`.
- Verdicts: `RT-PAPER-CESNAVICIUS-21.review.json`. All six findings are confirmed. The verifier corrected
  the owner or a step in findings 2, 3, 4 and 6, and I followed its corrections.
- All six are fixed in `papers/PAPER-CESNAVICIUS-21.result.json`. The report
  `papers/PAPER-CESNAVICIUS-21.md` has a new closing section, and three phrases in it that misnamed the
  author's manuscript are corrected.
- I did none of the extraction, its review, the red team or the verification.
- **Result.** 84 items (3 library, 5 planned, 76 missing). `python3 scripts/check_paper.py` reports ok.
- **The source.** I re-fetched the author's file (SHA-256 `55ded201…9ac6`, "Date: July 28, 2020") and the
  arXiv v2 e-print (SHA-256 `8704c071…d088`). Both hashes match. I read the TeX at Remark 1.5 (l. 789),
  the proof of Proposition 2.7 (l. 1016), §2.10 (l. 1087) and the first paragraph of the proof of
  Theorem 3.14 (l. 1533). I checked Stacks 07PV and 07QU at their pages.

## /1 (medium, other): route 1's dependencies on routes 2 and 6 were not encoded: fixed

**Changes.**
- **Route 1's brief** now names the Kawasaki supplier by the title and id the queue will create:
  "Commutative algebra for deformation theory and patching, Part II
  (DeformationAndDerivedPatchingAlgebraPartII)".
  - It says that the job DESIGN-DeformationAndDerivedPatchingAlgebraPartII plans it from route 2.
  - It names the imported items: Theorem 3.14 (48–49), Proposition 3.11 (45), Lemma 3.6 (40) and the
    module blowups of §3.13 (47).
- **Ordering.** The brief says that whichever job designs the Macaulayfication direction must come after
  that Part II. If DESIGN-SchemeAndStackFoundationsPartII records the direction as a restructure proposal,
  the proposal carries both imports.
- **The avoidance lemma** (item 53) is now named as "the arithmetic-presentation continuation of Scheme,
  stack, cohomology and intersection foundations, Part II". That is route 6 here and route 13 of
  PAPER-BHATT-ETAL-23, both in DESIGN-SchemeAndStackFoundationsPartII.
- **Route 1's prerequisites** now include DeformationAndDerivedPatchingAlgebraPartII.
- **Route 6's reason** no longer carries the make_queue sentence. That sentence has been false since
  7685a59f (28 September), which lists every Part II proposal separately.
- **Route 6's brief** is cut to its own addition, the Noetherian projective case of avoidance (159
  words). It points to PAPER-BHATT-ETAL-23 route 13 for the full brief.
- I left the review JSON and the review report as they are, as dated records.

**For the maintainer.**
- DESIGN-SchemeAndStackFoundationsPartII (order 34) has about ten continuations: the verifier counted ten
  accepted ones, and twelve part-ii routes name this parent. The first is Česnavičius–Scholze flat
  cohomology, so the job will most likely "plan the first here and record a restructure
  proposal for the rest".
- So the ordering belongs on whichever job actually designs Macaulayfication. Putting `after` on the whole
  ten-continuation job would hold back unrelated directions.
- The alternative is to reserve node ids for Proposition 3.11, §3.13 and Theorem 3.14 for job
  DESIGN-DeformationAndDerivedPatchingAlgebraPartII. That has to go in the RESERVED table of
  `make_queue.py`, which generates `research/blueprint/reserved-ids.json`. A fix job cannot do it.

## /2 (medium, other): the ring-level dualizing complexes had an owner that does not plan them: fixed

**Changes.** I followed the verifier's version of the fix. Only this paper's ring-level items move; no
other paper's items have to move.
- **Items 39, 79 and 80** moved from route 5 (AS.1) to route 4 (R03.3).
  - Route 4's reason states the extension of R03.3's contract explicitly: "dualizing complexes of
    Noetherian rings, their normalisation, localisation and quotients, existence over complete local
    rings, the Cohen–Macaulay criteria and local duality".
  - That meets gap G2 of REV-PAPER-IYENGAR-KHARE-MANNING-24.
  - The reason also gives the grounds: items 76 and 78 (local cohomology, Matlis duality) are already
    here, and so is PAPER-CALEGARI-GERAGHTY-18's canonical module.
- **Route 5** now carries item 52 alone.
  - Its reason drops the claim that the IKM-24 rejection "confirms" AS.1.
  - It replaces "single owner of dualizing complexes of Noetherian rings and schemes" with the
    scheme-level adapters that HACON-WITASZEK-23 and BHATT-ETAL-23 actually send.
  - It notes that AS.1 imports the ring-level items from R03.3, and that AS.1's requires do not yet
    include R03.3.
- **Route 2's brief** imports items 39, 79 and 80 from R03.3, and AnalyticStacks is gone from route 2's
  prerequisites. The commutative Part II no longer sits downstream of AS.0, SA.0, E1, E5:animation
  and DD.2.
- **Route 1's brief** imports 39, 79 and 80 from R03.3, and 52 from AS.1. AnalyticStacks stays in
  route 1's prerequisites, for item 52.
- **The notes of items 39, 52, 79, 80 and 81** are updated. Item 39 keeps the review's earlier note as a
  record.

## /3 (low, missing): the sheaf-level (S_n) and Cohen–Macaulay predicates had no owner: fixed

**Changes.** I followed the verifier's owner, SF.0 on route 3, rather than the red team's route 1.
Accepted routes already send consumers of these predicates into SchemeAndStackFoundations itself:
PAPER-LE-LEHUNG-LEVIN-ETAL-20/T58 to SF.0 and PAPER-PILLONI-20 route 24 to SF.2. So a definition in its
own Part II would reverse the dependency.
- **Item 16** is now the module-level part: depth, (S_n) and Cohen–Macaulay finite modules, with the E4
  quantifier and EGA IV₂ 5.7.5. It is still planned, now in R03.3 only. Its note explains the split and
  withdraws the false "route 1 states [it] as an adapter".
- **New item 84 (missing, route 3, SF.0)** covers:
  - Supp(𝓜) as the closed subscheme of Ann_{O_X}(𝓜);
  - stalkwise (S_n) and Cohen–Macaulay coherent modules, with the E4 quantifier over x ∈ Supp(𝓜);
  - (S_1) as the absence of embedded associated points;
  - (S_n) and Cohen–Macaulay locally Noetherian schemes, the predicate in the conclusion of Theorem 1.6.
- **Route 3's reason** explains item 84.
- **Route 1's brief** imports item 84 from SF.0 and item 16 from R03.3, and keeps item 26's loci.

**For the maintainer.** RS-25 narrowed SF.0 to the relative Spec and general relative Proj constructions.
Route 3 sends SF.0 items that are neither: item 71 (extending coherent submodules) and now item 84. The
accepted routes the verifier relies on do the same. So this is an atlas-level question about what SF.0
still owns after RS-25, not one this fix can settle. RT-PAPER-CESNAVICIUS-19/4 raises the same question
about another extraction's SF.0 route.

## /4 (low, missing): the ascent of formal-fibre properties had no item: fixed

**Changes.** I followed the verifier's owner, R03.3 on route 4, rather than route 1. R03.3 already has
special cases from accepted routes: PAPER-BOCKLE-IYENGAR-PASKUNAS-23/088 and PAPER-PASKUNAS-QUAST-26/76,
where finitely generated algebras over complete local Noetherian rings are excellent. Planning the general
theorem on route 1 would plan it twice.
- **New item 85 (missing, route 4)** is in ring form.
  - For P ∈ {geometrically regular, Cohen–Macaulay, (S_n)} under EGA IV₂ 7.3 (7.3.8): if the formal
    fibres of a Noetherian ring's local rings have P, so do those of every finitely generated algebra
    and its localisations (EGA IV₂ 7.4.4; Stacks 07PV for G-rings).
  - Corollary: localisations of finite type algebras over quasi-excellent or excellent rings are again
    quasi-excellent or excellent (EGA IV₂ 7.8.3(ii); Stacks 07QU).
  - The scheme form: quasi-excellence passes to X-schemes locally of finite type, in particular to finite
    ones.
- **The locator** lists every use: Remark 1.5; Proposition 2.7 ("Since X̃ inherits quasi-excellence");
  §2.10; and, without citation, Lemma 2.11, Corollary 2.14 and Proposition 5.5.
- **Citations.**
  - Item 1's statement gains the clause that quasi-excellence passes to finite-type X-schemes.
  - The notes of items 1, 6, 25 and 28 cite item 85.
  - Route 1's brief imports it from R03.3.
  - Items 6 and 28 stay on route 1, with the open-subscheme condition of EGA IV₂ 6.11.9(i).

**For the maintainer.** PAPER-LE-LEHUNG-LEVIN-ETAL-23/Z79 proposes the G-ring case for SF.0/SF.1/SF.4/SF.5.
That extraction is unreviewed (its review job, #1255, is open), and I wrote it in this session. When it is reviewed, Z79
should point at item 85 in R03.3, so that the G-ring case and the CM/(S_n) cases have one owner.

## /5 (low, missing): the dimension bound for blowing up had no item: fixed

**Changes.**
- **New item 86 (missing, route 2)** states dim Bl_I(Supp M) ≤ dim Supp M for a finite module over a
  Noetherian local ring (Herrmann–Ikeda–Orbanz 12.14). It gives both steps the verifier checked:
  - dim Proj(S) ≤ dim S − 1 for the Rees algebra S = A[IAt], A = R/Ann(M);
  - dim S ≤ dim A + 1, by the dimension inequality over the minimal primes of A.
- **Item 49's note** and **route 2's "Construct here"** name item 86.
- **Placement.** I chose route 2, next to the blowups it serves, which the verifier accepted. The item's
  note says the ring-level Rees inequality may instead go to R03.3 if the design job finds other
  consumers.
- The verifier also noted that item 49 does mention the bound as a cited step. The fix adds the item and
  a supplier, which were what was missing.

## /6 (low, other): the "author's copy of the published version" is the author's 2020 manuscript: fixed

**Changes.**
- **readSections** now describes the file as the author's manuscript dated 28 July 2020. It is listed
  under the Duke reference but is earlier than arXiv v2 and is not the Duke typeset text (37 pages). The
  version check is marked as a comparison of two author-produced texts.
- A new readSections entry records that nobody has read the version of record. Project Euclid refuses
  scripted access, and OpenAlex lists no open copy.
- **`sourceVersions`** is new. It has three entries, each with its hash:
  - `author copy` for the manuscript;
  - `preprint` for the arXiv v2 PDF;
  - `preprint` for the arXiv v2 e-print.
- There is **deliberately no `published` entry**. `scripts/collation.py` counts any declared
  `published` entry as a completed reading of the version of record, even one marked "not read". With
  these entries, `provenance()` returns "preprint".
- **E1–E9 locators** now say "of the author's manuscript dated 28 July 2020".
  - Their `searched` entries no longer call it the published version. E3's claim that "the published
    version … and arXiv v2 … agree" is corrected.
  - Each gains an entry scoping the finding to the two author texts.
  - `known: new` therefore means new relative to them.
- **The report** gets the same corrections in "The source read" and in the E1 bullet, which spoke of "the
  content stream of the published PDF".

**Not done, as the verifier advised: adding the paper to `research/blueprint/collation/REQUESTS.md`.**
- That file is generated by `collation.py --write`, and it lists only papers with a finding that affects
  a stated result. E1–E8 affect nothing and E9 the proof, so a hand edit would vanish at the next
  regeneration.

**For the maintainer.** The Duke text is unread. Someone with browser access should collate it, above all
for:
- E1: the printed statement of Corollary 1.11, "divisor in X";
- E2: §1.13, "ificaiton".

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-CESNAVICIUS-21.result.json`: ok.
- `research/blueprint/intake.py check-files` on the three deliverables: no problems.
- The JSON is written with the file's own formatting (indent 1). The diff touches only the fixed
  records.
- No Lean was compiled.
