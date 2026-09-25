# Handoff — BP-HabiroCyclotomicCompletions (issue #554)

Agent: Claude Code, session `cc-7b31c4`. Branch `cc-7b31c4-bp-hcc`.

## Deliverables

- `research/blueprint/packets/HabiroCyclotomicCompletions.json` — 21 nodes
  (1 definition, 7 constructions, 7 theorems, 6 comparisons), 45 API items,
  32 unit tests, 9 planets, 16 baseline declarations, 4 gaps, 5 requests,
  3 structural proposals. `"part": null`, `"status": "partial"`.
- `research/blueprint/readmes/HabiroCyclotomicCompletions.md` — 1165 lines.
- `research/blueprint/suggested/HabiroCyclotomicCompletions.lean` — 234 lines,
  every proof `sorry`.
- This note.

**All six stages are `source_decomposed` with an empty `remaining`.**

## Checks run

- `check_blueprint.py … --index $TAUCETI_BASELINE/declarations.tsv` → **0 errors,
  0 warnings**.
- `intake.py check-files` on the four paths.
- `python3 -m unittest discover -s tests`.

**No Lean was compiled**; shared Mathlib cache.

## The source

**Kazuo Habiro, *Cyclotomic Completions of Polynomial Rings*, Publ. RIMS 40
(2004), 1127–1146** — the paper the stage texts cite by theorem number
throughout. Open access. SHA-256 `f56094672a…`.

Getting it was not routine and the next worker should know: **the publisher's DOI
mapping for this volume is broken.** The DOI printed in several secondary sources
(`10.2977/prims/1145475493`) resolves to a different article entirely. The
correct DOI is `10.2977/prims/1145475444`, found by a bibliographic lookup by
title; resolving it gives the article page, whose single article-file link is the
paper. The hash recorded in the packet is of the file actually read.

Sections read are listed in `sources[0].readSections`, including what was not:
§§3.2–3.3, 6.2, 7.1–7.2 and 7.5, and the proofs of the three rigidity theorems
beyond their reductions. Those are gaps 1 and 2. The text layer inserts spaces
inside words; every excerpt was repaired character by character without changing
a word.

## What the libraries turned out to have

`AUDIT-17` records every layer as *not built*, and every claim was re-checked.
What is striking is how much of exactly the right infrastructure is pinned with
nothing assembled: cyclotomic polynomials over any ring with the factorisation of
`qⁿ − 1`; **division with remainder by a monic polynomial with its degree bound
and uniqueness** — which is precisely HC.2's normalisation; **the polynomial
Taylor shift with its coefficients identified as Hasse derivatives** — precisely
HC.3's identification at polynomial level; **`PowerSeries.subst` requiring exactly
the nilpotence hypothesis** HC.3 insists on; adic completion; and Tau Ceti's
complete separated topological rings and executable arithmetic modulo a monic
polynomial. Nothing named Habiro exists in either tree, `P_N(q)` has no carrier
(Mathlib lists q-Pochhammer symbols as a TODO), and no completion, evaluation or
Taylor map out of one is constructed.

## The traps the stage texts name, each carried

- **HC.1** — no injectivity of `R[q] → R[q]^S` is asserted; and the completion is
  **neither q-adic nor (q−1)-adic**, which has its own statement because the two
  are easy to confuse and every later theorem is false for them.
- **HC.2** — unrestricted expansions are **not** unique; only the normalised one
  is. No formal division by a non-unit cyclotomic polynomial.
- **HC.3** — the higher Taylor coefficients are **Hasse** derivatives, and the
  comparison with ordinary ones keeps the factorial denominators; re-expansion
  needs topological nilpotence in a proved complete ring.
- **HC.4** — all three rigidity theorems keep their **full** hypotheses: the chain
  runs inside the larger set (4.1); domain, characteristic zero and the
  asymmetric separation conditions (5.2); **infinitely many adjacent** elements,
  not merely an infinite set (6.1). And §7.4's three non-surjectivity statements
  are a node of their own, so an injective Taylor map is never read as an
  isomorphism.
- **HC.5** — **no exactness is assumed**: the derived-limit correction is stated
  instead, which is why the derived completion belongs to `HabiroRings:HR.2`. The
  module theorem takes adjacency over the **module**. Inverting a prime destroys
  adjacency across it, and restricted root orders are **not** a localisation.

## Gaps

1. **§§3.2–3.3, 7.1–7.2 and 7.5 were not read** — §7.5 in particular is where the
   rational case is treated in detail, and HC.5's rational node currently rests on
   the introduction's summary.
2. **The proofs of Theorems 4.1, 5.2 and 6.1 were read only in outline.**
3. **HC.2's algorithms are the packet's own** — Habiro gives no algorithms, and a
   structural note asks that the stage text say so.
4. **The universal property of HC.1 is stated, not sourced** — Habiro constructs
   the limit and uses its projections.

## Where to resume

Read §7.5 and the proofs on pp. 1131–1141 — about fifteen pages that close gaps 1
and 2 together, and they need nothing but the file already hashed.
