# REV-RT-PAPER-KOENIGSMANN-16 — verification of the red-team findings on PAPER-KOENIGSMANN-16

**Verdict: all nine findings are confirmed, at the severities the red team gave: four medium, five low.**

Three fixes need adjusting (/2, /4, /7). For /7 the status is wrong: neither library states the local square criterion, so the item is planned in Tau Ceti LocalFieldsRamification, not library. Each reason in `RT-PAPER-KOENIGSMANN-16.review.json` states the adjusted fix.

- **Verifier:** Claude Code, session `cc-58621d`, 30 September 2026 (issue #4523).
- **Independence.** This verifier took no part in any of the three jobs:
  - the red team, RT-PAPER-KOENIGSMANN-16 (Claude Code, `cc-f805bf`, #4691);
  - the extraction, PAPER-KOENIGSMANN-16 (Claude Code, `cc-39fac3`, #3944);
  - its review, REV-PAPER-KOENIGSMANN-16 (Claude Code, `cc-fb70e5`, #4460).

**What was checked.**

- **The sources.**
  - Koenigsmann, *Defining ℤ in ℚ*, Ann. of Math. 183 (2016) 73–93, publisher PDF (`https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p02-p.pdf`), SHA-256 `f26c2e15…3c93`.
  - arXiv:1011.3424v2, SHA-256 `6f10efdd…c58c541`.
  - Both hashes match the red team's.
  - The passages on pp. 73, 78, 79, 88 and 90–92 were read, those on pp. 90 and 91 on 150-dpi page images.
- **The records.**
  - The extraction and its report.
  - REV-PAPER-KOENIGSMANN-16.
  - PAPER-ALPOGE-BHARGAVA-SHNIDMAN-26 and its review, for /4.
- **The atlas.**
  - `research/blueprint/atlas/roadmaps/LogicAndDefinabilityInNumberTheory.json`.
  - The GlobalQuadraticForms link map in `research/blueprint/links/`.
  - `data/library-coverage.json`.
  - Every stage a finding cites, on the atlas `scripts/build.py` assembles.
- **Library claims.** Read at Mathlib `082e2d3` and Tau Ceti `f790474`:
  - Mathlib's `ModelTheory` directory;
  - `Padics/Hensel.lean` and `NumberTheory/Dioph.lean`;
  - Tau Ceti's `Algebra/Quaternion/NormForm.lean`.

`python3 scripts/check_redteam.py research/blueprint/redteam/RT-PAPER-KOENIGSMANN-16.review.json` reports `ok`.

## Medium

**/1 (error): confirmed; the fix is right.**
- LD.4 requires only CA.4 and LD.0.
- The roadmap lists neither quadratic-form roadmap as a prerequisite.
- The GlobalQuadraticForms link map records "none … Summary only" for it, and there is no QuadraticFormInvariants link map.

Route 1's reason still says LD.4's inputs are "already planned or built" in those roadmaps. The report (line 89) says the route "records the stage's dependencies", but nothing carries them. The four stage ids the fix lists exist.

**/2 (missing): confirmed; the item needs two parts.**
- p. 92 defines model completeness and existential closedness.
- Remark 24's proof ends "not every definable subset of Q is diophantine in Q, and hence Q is not model complete". It uses that model completeness makes every definable set existentially definable.
- No item states this. LD.0's description does not plan it, and Mathlib's `ModelTheory` has no such notion; `model_completeTheory` is about a structure's complete theory.

`check_paper.py` allows one kind per item, so the fixer should add a definition item and a theorem item, both in LD.0. LD.0 → LD.4 already exists, so item 41 can depend on them.

**/3 (missing): confirmed; the fix is right.**
- Proposition 23(c) rests entirely on Colliot-Thélène–Van Geel: "by the main result in [CTVG14], diophantine in Q" (pp. 91–92).
- The extraction makes other external inputs items (items 4, 17, 39), but this one appears only in prerequisites and in item 40's text.
- Mathlib's `Dioph` is over ℕ only.

**/4 (duplicate): confirmed; one clause needs correcting.** Item 42 plans diophantine closure properties for ℚⁿ in LD.4. PAPER-ALPOGE-BHARGAVA-SHNIDMAN-26 plans them for any commutative ring (items /1, /3, /46, /47) in a Part II that starts "after LD.4" and whose route its review rejected pending revision. So LD.4 should own the general form.

The correction: the fix says "over a field one equation suffices", but the reduction f² + g² = 0 needs a formally real field such as Q (in general, a field that is not algebraically closed) and fails over algebraically closed fields. The clause should be stated for Q.

## Low

- **/5: confirmed; the fix is right.** QuadraticFormInvariants 6C is nonarchimedean throughout. GlobalQuadraticForms 4.4 proves the archimedean symbol precisely "because Quadratic Form Invariants' Layer 6C carries `IsNonarchimedeanLocalField` on every theorem about the symbol". Item 8's note is wrong at p = ∞.
- **/6: confirmed; the fix is right.** Tau Ceti's `QuaternionAlgebra.normForm`, `normForm_mul`, `equivalent_normForm_weightedSumSquares` (⟨1, −a, −b, ab⟩) and `equivalent_pureNormForm_weightedSumSquares` exist at the pin. AUDIT-05 records QuadraticFormInvariants layer 2 as partly built, with exactly this target.
- **/7: confirmed; the fix's status is wrong.**
  - p. 78 uses 1 + 8Z₂ ⊆ (Q₂^×)², and p. 88 uses "J(R_p) ⊆ lZ_l. Thus x ∈ 2(Q_l^×)²". No item carries the local square criterion.
  - It is not in the libraries. Mathlib has only the general `hensels_lemma` (Hensel.lean:461), and Tau Ceti has no square criterion.
  - Tau Ceti LocalFieldsRamification layer 1 plans "U(K, 2e+1) ⊆ (Kˣ)², named `unitFiltration_le_range_powMonoidHom_two`", including "U(K,3) = 1 + 8ℤ_2 consists of squares".
  - So the new item is planned there, with `hensels_lemma` as its base.
- **/8: confirmed; the fix is right.**
  - p. 90 prints "Then R_p^{[k]} = Z_l". Proposition 10(b) gives Z_(l), and the paper otherwise writes Z_(l) for the localization.
  - p. 91 prints "k + Z_(2)" where the sentence's own assumption and Proposition 21(c) have k + 8Z_(2).
  - Both are also in arXiv v2, and both affect nothing.
- **/9: confirmed; the fix is right.** p. 73 states the conditional transfer (an existential definition of Z in Q would make Th∃(Q) undecidable, by Matiyasevich). No item carries it, and LD.4's acceptance asks for each transfer's own interpretation theorem.

## What becomes a fix job

The four medium findings (/1, /2, /3, /4) will be queued as FIX-RT-PAPER-KOENIGSMANN-16, with the adjustments above for /2 and /4. The low findings are recorded; the fixer may apply them with the same care, and /7's corrected status in particular.

No Lean file is a deliverable, and no Lean was run.
