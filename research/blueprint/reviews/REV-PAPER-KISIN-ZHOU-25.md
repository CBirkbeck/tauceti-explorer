# Review: PAPER-KISIN-ZHOU-25 (Kisin–Zhou, Independence of ℓ for Frobenius conjugacy classes attached to abelian varieties)

Job `REV-PAPER-KISIN-ZHOU-25` (issue #1070), by Claude Code, session `cc-d67081`, 23 September 2026.
The extraction was written by session `cc-442dc5`. **Verdict: accept.** All twelve routes are
accepted. All fourteen recorded mistakes are confirmed. Two classes of presentation defect were
repaired in place.

## What was read

- **arXiv [2103.09945](https://arxiv.org/abs/2103.09945)v2**, 63 pages, fetched into scratch. Its
  SHA-256 is `62d26eb931f271404c333c4b9a929e85239222788834cf16dcec1dff230c34c8` — the hash the
  extraction records.
- Every recorded mistake at its locator, with **E9 settled on the page image**, since pdftotext eats
  the prime the finding is about.
- **Erratum check:** arXiv stops at v2; Crossref's record of `10.4007/annals.2025.202.3.3` has no
  `update-to`, `updated-by` or relation. The final Annals text (202 (2025), no. 3, 1077–1156) is
  paywalled and was not compared — the extraction says so in every finding's locator, which is the
  right way to record it.

## Mistakes in the paper (`sourceIssues` E1–E14)

**All fourteen are confirmed**, each with a `review` object. The ones that carry weight:

- **E10 (error, affects the proof).** In the proof of Lemma 6.3.3 (p. 60), "Let γ̃₁ ∈ G(C) be any
  lift … the eigenvalues of the image of γ̃₁ have absolute value 1. Hence γ̃₁ is contained in a
  maximal compact subgroup of G(C)." That implication needs **semisimplicity**: a nontrivial
  unipotent element has all eigenvalues 1 and lies in no compact subgroup. A semisimple lift exists
  and the central rescaling by z carries through, so the lemma stands — but not by the printed
  argument.
- **E14 (gap, affects the proof).** The last sentence of the same proof: "Any lift of ψ⁻¹(γ̃₂) to
  G(R) yields the required lift of γ." ψ⁻¹(γ̃₂) lives in (G/w(G_m))(R); a lift to G(R) need not exist,
  need not be semisimple, and must be multiplied back by the central z used to define γ₁. Keeping
  this separate from E10 is right — they are two different unjustified steps that share a phrase.
- **E11 (gap, affects the proof).** Pages 53 and 54 apply [Poo04, Corollary 3.4] to a scheme produced
  by [LMB00, Théorème 6.3] — a smooth chart of an algebraic stack. Poonen's Bertini theorems over
  finite fields are stated for a **smooth quasi-projective subscheme of P^n**, and a smooth chart is
  not quasi-projective for free. Either that is checked or the curve is built locally, which is what
  the extraction's items C20–C24 do.
- **E2** is confirmed decisively: Definition 3.1.6 (pp. 19–20) has only clauses **(1)** and **(2)**,
  and (2) is precisely "a closed immersion of local models M^loc_{G,{µ}} ↪ Gr(Λ) ⊗ O_E" — what p. 23
  needs. There is no clause (3), and Remark 3.1.7 itself cites "Definition 3.1.6 (2)".
- **E5, E6, E7, E9, E13** are each contradicted by the paper's own neighbouring text: Proposition
  4.2.3(5) says "torsion" where the hypothesis list on the same page and the proof on p. 35 both say
  **torsion-free**; the dominance order on p. 48 omits **nonnegative**, which would make ≺ order
  nothing; Lemma 5.2.5 puts the translation element ṫ_λ in G(F_q[[t]]) although t^λ has poles and
  p. 49 chooses the lift in **G(F_q((t)))**; p. 58's premise reads `h⁻¹gh = g` where it must be `g′`
  (confirmed on the image); and p. 59 writes K₁^p ⊂ **H**(A_f^p) for a level subgroup of H₁, then
  mismatches S_K and S_{K₁} inside one sentence.
- **E1, E3, E4, E8** are located and sound: σ-conjugation is u⁻¹wσ(**u**); the comparison c needs
  both sides over the same Witt coefficient ring; the étale Tate lattice is a **Z_p**-module and its
  transported tensors are s_{α,ét}; and H¹_B carries types ((1,0),(0,1)), not the ((0,−1),(−1,0)) of
  H_1.
- **E12** I located but did not verify in full: the step from Stembridge's single-root statement to
  the σ_q-orbit sum (pp. 49–50) genuinely needs an argument in the folded root system, and the
  extraction's items C14–C19 carry its proposed replacement. My verdict says exactly this.

## Changes made to the extraction

Both are presentation defects, and both matter because `sourceIssues` feed the public errata register
`data/source-issues.json`.

1. **Run-together text, repaired throughout.** The `source` block and every finding's `locator`,
   `printed`, `correction` and `reason` had lost their spaces: `arXiv2103.09945v2, p9,§2.2.2`,
   `Definition3.1.6`, `property(3)`, `Annals of Mathematics202(2025),no.3,1077–1156`,
   `of7 October2024`, `onp54`, `eigenvalues1`, `andp52`. All repaired, with the mathematics left
   alone — function application such as `sigma(u)` and `w(G_m)` is preserved, and I re-checked after
   each pass that no token like `PGL2`, `GL2`, `H1` or `C3` was broken.
2. **Leaked process text, removed.** Seven of the fourteen `reason` fields carried the extraction's
   own session id and an internal revision note: `(cc-442dc5) Reclassified to affect nothing: …`.
   The marker is gone and the substantive justification after it is kept. No session id now appears
   anywhere in the file except in the `completion` block (the extraction's proper attribution) and my
   `verification` block.

Nothing else changed: no item, status, route or locator.

## Items, statuses and routes

- **Library (23 items).** Every cited declaration resolves in the pinned index.
- **Planned (25 items).** They go to 25 distinct stages, and each plans its item — `RG2.4`
  ("Iwasawa decomposition … Cartan and Iwahori"), `BG0` ("G-torsors and isocrystals with reductive
  structure"), `BG1` ("the Kottwitz map kappa and rational dominant Newton cocharacter nu"),
  `R07.4` (Breuil–Kisin modules), `ShimuraData` `D3`/`D4`.
- **Missing (162 items).** Routed exactly once across the twelve routes. None is in either library:
  Shimura varieties, local models, affine Grassmannians, Honda–Tate theory, Newton strata, Kottwitz
  maps and display theory all return nothing; the only `isocrystal` hits are Mathlib's
  `WittVector.Isocrystal`, which the library items already cite.
- **Routes.** All twelve accepted. The six Part IIs all have an existing parent, a free id, a title
  beginning with the parent's title and an area that is a galaxy id; two of the parents are Tau Ceti
  roadmaps, which Protocol 15 makes existing work to extend. The split is careful — Breuil–Kisin
  modules stay in the parent's `R07.4` and the Shimura-datum foundations in `ShimuraData`, rather
  than being absorbed into the Part IIs.

## Two observations for the maintainer

Neither is a defect, and neither changed anything.

- **Locators are terse.** Most read `4.2.8` or `Proof of 5.2.3` with no page, so checking one means
  searching the PDF. The findings' locators are full, which is what matters most, but the items'
  are thinner than in the other extractions I reviewed today.
- **Seven items are not statements of the paper.** Their locators say
  `Continuation: proof of Kisin–Zhou 5.2.3 or 5.2.7`, and they are the extraction's own repair
  lemmas — C14–C19 for E12's folding combinatorics, C20–C24 for E11's local curve construction.
  They are genuinely useful, and routing them to `RootSystemsDominancePartII` and
  `LefschetzFiniteFieldBertiniPartII` is the right home, but a reader should know they are the
  extraction's additions rather than the paper's.

## Checks

- `python3 scripts/check_paper.py research/blueprint/papers/PAPER-KISIN-ZHOU-25.result.json` ok.
- `python3 research/blueprint/intake.py check-files` on the four files reports no problems.
- 162 missing items, 162 routed, each exactly once.
- Every planned and route stage id resolves; every Part II parent exists and every Part II id is free.
- The source PDF's SHA-256 matches the recorded hash.
- Lean: none.
