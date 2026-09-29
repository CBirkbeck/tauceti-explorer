# REV-PAPER-DELIGNE-80: review of the extraction of Deligne, *La conjecture de Weil. II*

**Verdict: accept.** All six routes are accepted: five source routes and one new roadmap. The new roadmap's brief is corrected in place. All 71 recorded mistakes are confirmed, and one new mistake, E72, is added.

Reviewer: Claude Code, session `cc-fb70e5`, 29 September 2026. Extraction under review: Claude Code `cc-f805bf` (PR #4559, issue #4495). It has 505 items (5 library, 302 planned, 198 missing), 6 routes and 71 `sourceIssues`, with status `complete`. `cc-fb70e5` appears nowhere in its files.

Source: Publ. Math. IHÉS **52** (1980), 137–252, doi:10.1007/BF02684780. I used the [Numdam scan](https://www.numdam.org/article/PMIHES_1980__52__137_0.pdf) (117 pages). Its SHA-256 `b06eea61…cc71` matches the recorded hash. PDF page 2 is printed page 137.

## 1. Items: complete and accurate

- **Coverage.** A script read the statement headers (Théorème, Lemme, Proposition, Corollaire, Variante, Scholie, Définition) from the scan's text layer: 123 of them, and every one appears in an item. The one apparent miss, "Lemme (4.4.25)" on p. 228, is the OCR of Lemme (4.4.2ˢ); the page image shows it, and item `s4-4.4.2s-orthogonal-generation` covers it.
- **Locators.** The 114 locators that cite a numbered statement all point to the right page.
- **Statements.** I compared these items with the page images: Théorème (3.3.1) (p. 204, "de type fini sur Z"), Théorème (3.4.1)(i)–(iii) (p. 207, with (iii) keeping "X₀ normal") and Théorème (1.8.4). They match.
- **Not read.** I did not read every proof in the 116 pages. I read the pages at every source issue and the statements of the numbered results.

## 2. Statuses: all hold

The seven declarations cited by the five library items are all in the pinned index:
- `TauCeti.Divisor.finite_ker_degreeClass`;
- the `TauCeti.Sl2Std` classification, decomposition, dimension and Clebsch–Gordan theorems;
- Mathlib's `riemannZeta_ne_zero_of_one_le_re`.

I opened `finite_ker_degreeClass` (the degree-zero class group of a function field over a finite field is finite) and `Sl2Std.existsUnique_nonempty_lieModuleEquiv` (in characteristic 0, an irreducible triangularizable sl₂-module is a unique V(n)) at Tau Ceti f790474. They provide their items.

## 3. Routes: all six accepted

**Routes 1–5** are source routes into the layers written for Weil II or its inputs:
- DWP.5–DWP.8 and DWP.10;
- LPV.1–LPV.3, LPV.5 and LPV.7;
- FF.2 (the family form of the exponential-sum bound);
- EDC.4 (weak Lefschetz with Z_ℓ coefficients);
- SF.2 (the §0 conventions).

**Route 6** is a new roadmap, `EllAdicHomotopyTypesAndWeights`, for §5.
- **Why a new roadmap.** Nothing in the atlas plans ℓ-adic homotopy types of varieties, Sullivan minimal models built from étale hypercovers, or weight gradings on them. I searched the stage texts for Sullivan, minimal models, rational and étale homotopy types, and formality. The only neighbour is Tau Ceti's DGAInfinity (A∞ minimal models, Massey products and formality), and a Tau Ceti roadmap is never re-planned.
- **The brief.** It states the targets exactly and lists its imports.
- **One correction.** The brief pointed to "the atlas's Hodge-theory owner" without naming it. That owner is tauceti:TauCetiRoadmap/HodgeStructures, and its milestone L2 covers only abstract mixed Hodge structures (Théorie de Hodge II §§1–2). The mixed Hodge structure on the cohomology of complex varieties, which (5.3.3) uses, has no atlas owner. The brief now names L2 and says the design must plan the rest or take it as a prerequisite.

## 4. Mistakes in the paper: 71 of 71 confirmed, 1 added

Every entry was checked on the page image at its locator.

**The substantive ones, where I redid the check:**
- **E50.** (1/2π) sin²θ dθ has mass 1/4 on [0, π]. The SU(2) image of Haar measure is (2/π) sin²θ dθ.
- **E51.** #E_x(F_{qⁿ}) = 1 − 2cos θ·q^{n/2} + qⁿ.
- **E47.** (3.4.1)(iii) assumes lisse and normal (p. 207), and its proof uses the surjection π₁(U₀) → π₁(X₀). The nodal-cubic counterexample to Variante (3.4.9) is valid.
- **E38.** ω₁(g) = q^{−deg g} (2.2.7), and Frobenius has positive degree, so the weight is −2ℛ(τ).
- **E57.** For roots of equal length, Tr(s_δ s_δ′) = dim − 4 + (δ, δ′)².
- **E33.** The proof yields (1 − ε₁)(1 − ε₂) − ε₂, not 1 − ε.
- **E15.** Deligne's own weight mnemonic on p. 170 fails for the printed twist.
- **E14.** The identities are stated for i ≥ 0.
- **E40.** (2.1.13) gives only geometric decay of q^{−n}#X₀(F_{qⁿ}).
- **E68.** Lemme (5.3.5) is "laissée au lecteur".

**E72** (new, error, affects nothing; (3.5.1), p. 211). When (2.2.8) is quoted, the weight is again printed 2ℛ(τ) for −2ℛ(τ). The conclusions of (3.5.1) are those of the corrected sign: a pole only at τ = ω_N for ℛ(τ) > N − 1/2.

## 5. Checks

`scripts/check_paper.py` passes on the corrected extraction. The review's changes are:
- the 72 `review` verdicts and E72;
- route 6's brief;
- the report's source-issue note and a new section "Corrections by the independent review".
