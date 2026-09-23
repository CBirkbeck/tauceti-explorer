# Review: PAPER-ZAVYALOV-25 (Zavyalov, Mod-p Poincaré Duality in p-adic analytic geometry)

Job `REV-PAPER-ZAVYALOV-25` (issue #1064), by Claude Code, session `cc-d67081`, 23 September 2026.
The extraction was written by session `cc-39fac3` (issue #1063). **Verdict: accept.** All eight
routes are accepted. All twelve recorded mistakes are confirmed. **No correction was needed** — no
item, status, route or locator changed.

## What was read

- **arXiv [2111.01830](https://arxiv.org/abs/2111.01830)v3**, 101 pages, fetched into scratch and
  never into the repository. Its SHA-256 is
  `a984d973782649972a835b302e20ec91fc9c1abc5e5b43c7eccc5934b9c2c951` — byte for byte the hash the
  extraction records.
- Every one of the twelve recorded mistakes at its locator, together with the surrounding text that
  settles it; a sample of items against the paper; and a sweep of the paper's own numbering.
- **Erratum check, done independently:** arXiv has only v1 (2 November 2021), v2 (25 August 2022) and
  v3 (21 February 2024); the Crossref record of `10.4007/annals.2025.201.3.2` has no `update-to`, no
  `updated-by` and no `relation`. **The published Annals text could not be compared** — the DOI
  resolves to the publisher's bot-protection page and the article page offers no direct PDF. The
  extraction discloses exactly this and argues that v3, being later than the journal's revision date
  of 31 January 2024, is the accepted text; that reasoning is sound and I could not improve on it.
  It is the one caveat on the twelve `known: "new"` entries.

## Items and statuses

- **Statements and locators.** Sampled across the paper and checked verbatim: Theorem 2.2.2 (p. 11),
  Construction 2.2.8/Lemma 2.2.9 (p. 13), Lemma 2.2.16 (p. 15 — the item correctly carries the
  *flat* hypothesis the lemma has, while describing the trace construction for finite morphisms
  separately), Theorem 2.5.5 (p. 24), Lemma 4.2.8 (pp. 50–51), Theorem 4.2.30 (pp. 58–59),
  Theorem 4.3.15 (pp. 63–64), Definition A.17 (p. 87). Every one matched.
- **Nothing on the way to the main results is missing.** I extracted all 303 paper-internal numbered
  statements and compared them with the numbers the 155 items cite. Twelve are unmentioned, and none
  is a gap: **Theorem 1.1.1** is classical Poincaré duality for a compact complex manifold (the
  motivation — the paper's algebraic analogue, Theorem 1.1.2, *is* an item, routed to
  `EtaleDualityAndPerverseSheaves:EDC.2:pairings`); "Lemma 1.1.10", "Definition 1.2.1" and
  "Proposition 2.3.10" are [Hub96] citations that my pattern misread as internal; five are Remarks;
  "Theorem 5.5.9" does not exist (§5.5 ends at 5.5.6, which is an item); and **Definition D.6**, the
  rational pro-étale trace, is never referred to again in the paper.
- **Planned (14 items).** Every cited stage id exists, and every layer does plan its item — I read
  each description: `AInfCohomology:AI.1` is "The derived décalage operator Lη"; `AI.3` says "Build a
  toric perfectoid cover of a small framed affine … and prove the almost purity comparison"; `AI.4`
  proves "the Hodge–Tate reduction of AΩ … identifying its cohomology sheaves with differential forms
  and BK twists" (BMS Theorem 8.3); `PerfectoidQuotients:Q0` constructs integral perfectoid rings;
  `ClassicalAdicEtaleCohomology:H3` uses "his compactification/partial-properness and support
  definitions"; `AdicSpacesPartII:F0` proves "properness, separatedness and smoothness comparisons
  with formal models" (Lütkebohmert–Temkin); `H0`/`H3` own the étale trace of a finite étale map.
- **Missing (141 items).** Searched the pinned index myself for dualizing complexes, `f^!`,
  Grothendieck duality, rigid-analytic spaces, formal schemes, almost mathematics, étale cohomology,
  Poincaré duality, trace maps and coherent sheaves: all zero. The only adic material is Tau Ceti's
  `Spa` (381 rows), which is what the planned items already point at. No missing item is in either
  library, and the extraction records no `library` item at all — correct for this paper.

## Routes

All eight accepted; `PAPER-ZAVYALOV-25.review.json` gives the reason on each. The Part II is the
substance, and its frontier is right: `ClassicalAdicEtaleCohomology:H3` is titled "Proper support,
traces and Poincaré duality **for curves**" and its text stops at the trace and pairing "for smooth
analytic curves over a complete algebraically closed nonarchimedean field", so duality in every
dimension with p-torsion coefficients starts exactly where the base stops. The id is free, the title
begins with the parent's, and `padic` is a galaxy id. The brief states the final theorems by number,
gives seven layers following §§2–5 and the appendices, names its imports layer by layer, and sets
four tests.

One route deserves a note for the reader: **`AnalyticStacks:AS.1` is not an atlas stage** — it is a
layer of a *draft* roadmap (`research/blueprint/roadmaps/AnalyticStacks.json`, layers AS.0–AS.4),
which is why `check_paper.py` accepts it. That is legitimate, and the route's own justification
checks out: `PAPER-BHATT-ETAL-23` and `PAPER-HACON-WITASZEK-23` both route their coherent-duality
adapters to the same `AnalyticStacks:AS.1`, so this joins an existing owner instead of proposing a
rival.

## Mistakes in the paper (`sourceIssues` E1–E12)

**All twelve are confirmed**, each with a `review` object giving what I could check myself. They are
all misprints and all `affects: nothing`, which is the right classification. The ones worth naming:

- **E10 (Theorem 4.4.24).** The statement reads "Let 𝔛 be a separated admissible formal O_C-scheme
  with smooth generic fiber X = 𝔛_C of pure dimension d", dropping the reduced special fibre.
  Definition 3.5.1 (p. 44) defines a **nice** model as "a separated admissible formal O_C-scheme 𝔛
  with smooth generic fiber of pure dimension d **and reduced special fiber**", and Theorem 3.5.2
  constructs Faltings' trace only for nice 𝔛 — so as printed the theorem asserts almost perfectness
  of a pairing that has not been defined for its 𝔛. The intended hypothesis is unambiguous: p. 48
  states the goal of §4 "for any nice admissible formal O_C-scheme", and p. 66 states it "for any
  admissible separated rig-smooth formal O_C-scheme 𝔛 with reduced special fiber".
- **E6.** Three citations of Lemma 2.3.5 (pp. 46, 47, 48) for formal schemes, where that lemma is
  about *schemes* ("a separated, flat, finitely presented O_K-scheme"). The formal-scheme statement is
  Corollary 2.4.5, and for the amplitude claim on p. 47 the paper elsewhere cites Lemma 2.2.13 — both
  of which the extraction names.
- **E4.** On p. 29 the letters A′ and B′ are swapped against the sentence above them, which fixes
  𝔘 ⊂ Spf A° with 𝔣^{-1}(𝔘) → 𝔘 finite flat; the replacement is of Y, not X, as the following clause
  ("B° is a finite, locally free A°-algebra") confirms.
- **E2, E8, E12** are direction and shift slips each contradicted by their own neighbouring line:
  f^! runs from Y to X (part (1) of the same lemma); the identification's two ends must both be
  ω^a_𝔛; and the composition ends in Tr_f(−d)[−2d], so the global trace lands in [−2d].

I did not read all 101 pages hunting for mistakes the extraction missed, and I record none. The
numbering sweep above is the systematic check I did run, and it found nothing uncovered.

## Changes made to the extraction

None beyond the twelve `review` objects and a `verification` block. This is the first extraction I
have reviewed in this session that needed no correction to any item, status, route, locator or note.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-ZAVYALOV-25.result.json` reports ok.
- `python3 research/blueprint/intake.py check-files` on the four files reports no problems.
- 141 missing items, 141 routed, each exactly once; no routed id is a non-item.
- Every planned and route stage id resolves (`AnalyticStacks:AS.1` in the draft roadmaps, the rest in
  `data/atlas.json`); the Part II's parent exists, its own id does not, and its area is a galaxy id.
- The source PDF's SHA-256 matches the recorded hash.
- Lean: none.
