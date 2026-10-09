# REV-PKG-SchemeAndStackFoundations — accepted with fixes applied

Reviewer session `cc-68f917`, 9 October 2026. Package at `research/blueprint/packages/SchemeAndStackFoundations/`
(README 199,994 bytes after the fixes; Suggested.lean 477 KB; `metadata.toml` `topic = "math.AG"`).
Verdict: **accepted** (`review.json`). Everything below the "Remaining" heading is a limit of the
200 KB cap, not a defect I could fix in place.

## What was checked

1. **Quality bar.** Read against `UPSTREAM_GUIDE.md` and the StableReduction and JacobianChallenge
   READMEs. The package has the upstream shape (what and why, boundaries, conventions, layers in order,
   every target numbered with source and prerequisites). No process language in the README; the Lean
   file had some (see fixes).
2. **Sources.** (a) The SF.5 locators (T421–T436), flagged by the author as written from memory. Fulton's
   numbering was checked against public notes that quote the book by number (E. Assaf's Dartmouth
   seminar notes; the Warwick study-group notes; T. Krämer's HU Berlin notes, which cite "Fulton, th.
   6.5"; the arXiv citations of Example 8.4.6 and Example 12.3.1 / Theorem 12.3) and the Stacks Project
   chapter 42 table of contents (tag 02P3): Theorem 1.4, Proposition 1.6, Theorem 1.7, Propositions 1.7,
   1.8, 2.5, 3.1, Theorems 2.4, 3.2, 3.3, 6.2, 6.5, Proposition 8.1.1, Example 8.4.6, Theorem 12.3 and
   Example 12.3.1 are confirmed. Hartshorne V.1 was checked against T. R. Ramadas's CMI notes (Theorem 1.1),
   C. Ji's Columbia notes (Lemma 1.7's content; Theorem 1.10 is Nakai–Moishezon) and A. Egbert's exercise
   index (V.1.3 adjunction for effective divisors, V.1.9 the Hodge inequality, V.1.10 the Weil bound).
   Not confirmable from public sources: Fulton Examples 1.3.2, 2.1.1, 3.2.11, 8.1.12, 8.4.5, 15.2.2,
   Corollaries 2.4.2 and 15.2.1, "Definition 3.1", "Definition 6.1", Appendix "B.5.5", and Hartshorne
   "Example 1.9.1". (b) A random sample of 15 Stacks locators from SF.0 one-line targets and 8 from
   SF.1–SF.4, each fetched from `stacks.math.columbia.edu/tag/<tag>`: all 23 numbered locators agree
   with the tag page (lemma/section number and kind); the other 3 sampled were tag lists without a
   number to compare.
3. **Gaps.** No upward citation, `FoundationsAndLibraryIntegration` id or `UPSTREAM:` id in the README.
   The only unresolved internal reference reported by the author (`SF.0/henselization`) is not a node
   anywhere; it occurs only in the SF.0 packet's moved-down table, and the README now points at the
   henselization strand explicitly. T434's "signature `(1, ρ − 1)`" form needed the theorem of the base,
   which the README assigns to a higher roadmap (AbelianSchemesAndArithmeticModuli); restated.
4. **Unit tests.** The 98 definitions and constructions each list at least three named tests of
   distinct kinds; the packets' statements are of the required shape (computed values, degenerate
   cases, agreement with the nearest library notion, non-examples). In the README 90 of the 98 test
   lists are cut off mid-sentence by the size cap (see Remaining).
5. **Lean.** `lean-check …/Suggested.lean`: exit 0, 935 warnings, all
   `declaration uses sorry`, 0 errors (run twice: on the received file and on the edited one). No
   `: Prop := sorry` body and no `True` placeholder (the `def … : Prop :=` declarations have real
   bodies). Spot-checked ten declarations against the README statements: `relativeSpec` (T004),
   `IsAlgebraicSpace` (T217; sheaf + representable diagonal + étale atlas), `IsReplete` (T282; the
   sequential-limit surjectivity), `grothendieck_existence` (T380-area; Noetherian adic ring, proper
   `f`, support condition), `PicardGroupoid`, `azumayaClass`, Schlessinger's `H1`/`H2` (T369),
   `alteration_theorem` and `semistable_alteration_theorem` (SF.4e; integral, separated, finite type,
   nonzero centre; trait with finite extension), `TopologicalExtension.kernel_iff` (T219). All carry the
   README's hypotheses. Of the 98 README definitions, 84 have a declaration; the 14 SF.0 definitions
   without one (reflexive sheaves, local dimension, ind-étale algebras, catenary, Cohen–Macaulay,
   CM-quasi-excellent, Japanese, Nagata, perfect schemes, universal homeomorphisms, perfectly
   proper/smooth morphisms, weakly normal schemes) are now named in a comment block of the SF.0
   section. The SF.5 definitions were already named in the closing block.
6. **Own words.** No verbatim passages found; one-line targets are titles plus locators, not summaries.
7. `python3 research/blueprint/intake.py check-files` on the three files: 0 problems. No `/home/` paths.

## What was fixed

- **Locators of the one-line targets.** 334 of the README's 364 ellipses were locators cut off at a
  fixed width ("Stacks, Lemma 15.12.1, indicated …"), so the convention "a one-line target is specified
  by its locator" did not hold. Every one-line target now carries its complete principal locator from
  the plan (first source; the lemma-strand entries carry their principal source and a count). The
  room came from removing 98 unused HTML anchors, shortening the strand entries to their first three
  lemma titles (the lemmas are declarations of `Suggested.lean`), folding SF.6, and trimming the
  bibliography; the file is 199,994 bytes.
- **SF.5 sources.** Each of T421–T436 now cites Fulton 1998 / Hartshorne 1977 by the numbers that were
  confirmed, with the unconfirmed example numbers replaced by section references, and a Stacks
  chapter 42 section and tag added where one exists (02RV, 02R3, 02S0, 0AZ0, 02RA, 02RF, 02SI, 02SN,
  02TG, 02TV, 02TZ, 02UK, 0FBI, 0FC0, 02UO). `.inter_comm` cites Theorem 2.4 instead of "Cor. 2.4.2";
  the `p_a` adjunction cites Exercise V.1.3; T434 cites Theorem 1.10 as Nakai–Moishezon and Exercise
  1.9 for the Hodge inequality; T435 cites Exercises 1.9–1.10.
- **SF.6.** An upstream roadmap would not present nine declaration-free "contracts" as a layer: the
  guide asks for layers of targets, and these are boundary statements about maps other roadmaps own.
  The layer is folded into "Prerequisites and boundaries" as the bullet "Interfaces consumed by the
  arithmetic roadmaps", keeping the carriers, hypotheses and sources of S1–S9 in condensed form; the
  layer table and diagram no longer list SF.6; the Lean closing block refers to the boundaries section.
- **Henselization.** SF.0's introduction names the strand (T111–T118, `key/henselization` = T113);
  the "Owned here" bullet names T-numbers.
- **Bibliography.** Rebuilt: arXiv identifiers had been read as years ("Couveignes 1907",
  "Kings–Sprang 1912", "Harpaz–Wittenberg 1904", "Cesnavicius 2009", "Dimitrov–Gao et al. 2001",
  "Bhatt–Ma et al. 2012"); anonymous entries ("196 2026", "contributors 2026"); duplicates
  (Kings–Sprang, Bhatt–Scholze 2017, Boxer–Pilloni, Kisin under two labels); "Hoften"; and no entry
  for Fulton, Hartshorne or the nine interface sources. The two Harpaz–Wittenberg papers and the three
  Brauer exposés now have distinct labels, applied consistently in the body.
- **Lean file.** Header rewritten without process language; "packet" (60 occurrences in comments)
  replaced by "roadmap"/"README"; the 14 untyped SF.0 definitions listed; the closing block updated.

## Remaining (under the cap; not defects of the plan)

- The test lists of 90 definitions and 19 hypothesis lines are still abbreviated with an ellipsis.
  Restoring the first sentence of each test costs about 10 KB; it does not fit. The conventions now
  say that a test's complete statement is the `example` of that name in `Suggested.lean` where the
  carrier exists at the pins (336 examples are typed).
- The 314 one-line targets state no hypotheses of their own; the cited statement's hypotheses apply.
- A split into two packages (SF.0–SF.2 and SF.3–SF.5, each well under the cap) would remove both limits
  and is the change I would recommend before the draft PR if the maintainers want full statements.
- Fulton's internal example numbers listed under "Not confirmable" were removed rather than guessed;
  a reader with the book can restore them.
