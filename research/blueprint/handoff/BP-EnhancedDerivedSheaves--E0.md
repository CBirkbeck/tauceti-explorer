# Handoff — BP-EnhancedDerivedSheaves--E0 (issue #719)

Agent: Claude Code, session `cc-7b31c4`. Branch `cc-7b31c4-bp-e0`.

## Deliverables

- `research/blueprint/packets/EnhancedDerivedSheaves--E0.json` — 21 nodes (3 definitions,
  7 constructions, 9 theorems, 2 comparisons), 57 API items, 40 unit tests, 12 planets,
  **39 baseline declarations**, 10 gaps, 16 requests, 3 structural findings.
  `"part": "E0"`, `"status": "partial"`.
- `research/blueprint/readmes/EnhancedDerivedSheaves--E0.md` — 1959 lines.
- `research/blueprint/suggested/EnhancedDerivedSheaves--E0.lean` — 207 lines.
- This note.

## Checks run

- `check_blueprint.py … --index $TAUCETI_BASELINE/declarations.tsv` → **0 errors, 0 warnings**.
- `research/blueprint/intake.py check-files` → 0 problems.
- `python3 -m unittest discover -s tests` → OK.
- **The Lean file was not compiled.**

## Sources

No integrated decomposition. **Four** sources, all downloaded and hashed in this session:

| Source | SHA-256 | Read |
| --- | --- | --- |
| Lurie, *Higher Algebra* | `112b145a95a62dae…` | §1.1 (for the stable API), **§1.3.1 in full** — the dg nerve |
| Lurie, *Higher Topos Theory* | `58855f3a0ad6d9c4…` | **§4.3.2 in full**, §5.5.0–1 |
| Bhatt–Scholze, *The pro-étale topology for schemes* | `ae0960a28f0f2530…` | **§§3.1, 3.2, 3.3 in full**, §3.4 in part |
| Liu–Zheng, *Enhanced six operations…* | `ceac019a2be786cd…` | **setup only** — Definition 3.2.1 |

## The audit is unusually informative here, and the packet leans on it

`AUDIT-22` returns *not built* for E0, E2, E3, E4 and **partly built** for E1, and it
marks **E1's first target `mathlib` outright** — the only such verdict in this part of
the atlas. It also names the pinned quasicategory API **declaration by declaration**, and
identifies the pinned replete-topos statements as *instances* of Bhatt–Scholze 3.1.1
rather than the general notion. **Thirty-nine** pinned declarations are cited as a result,
the largest baseline of any packet in this session — which is exactly what the E0 stage
text asks for when it says to *reuse* Mathlib's quasicategory API rather than rebuild it.

## What is planned

- **E0** (6 nodes). The model with the pinned API named and the four missing pieces
  identified (equivalences, Joyal model structure, mapping spaces, universes); **HA
  1.3.1.6's dg nerve by its explicit simplex formula**, with HA 1.3.1.11, 1.3.1.12 and
  1.3.1.17; slices and colimits; the stable API **with the sign comparison the stage text
  forbids avoiding**; and the restricted straightening theorem it forbids calling
  "standard higher category theory".
- **E1** (4). Module sheaves as a Grothendieck abelian category; unbounded K-injective and
  K-flat replacements; the enhanced derived category as `N_dg` of the K-injective model,
  with its homotopy category identified with the **pinned** `DerivedCategory` through the
  pinned detection lemmas; presentability and the derived tensor **from the K-flat model**.
- **E2** (5). Bhatt–Scholze §3 in the parts read: replete topoi with the field
  counterexample, exactness of countable products, the underived inverse limit, the **left
  completion** and left-completeness for replete topoi, locally weakly contractible topoi,
  and the hypercover obligations.
- **E3** (4). HTT 4.3.2's relative left Kan extension with uniqueness **through a
  contractible Kan complex**; Liu–Zheng's diagram categories *without* their Artin-stack
  theorem; the adjoint functor theorem that must **produce** the right adjoint; mates and
  Beck–Chevalley.
- **E4** (2). Boundary markers; coverage **`not_read`**.

## What remains

Ten gaps. The four that block most:

1. **HTT Chapters 1–4 were largely not read.** Three nodes state obligations without
   locators as a result — slices and colimits, restricted straightening, and the
   cofinality half of the Beck–Chevalley node. Reading **HTT Ch. 3** (straightening) and
   **§4.1** (cofinality) closes all three.
2. **The existence of unbounded K-injective replacements has no source here**, and **all
   K-flat theory is absent everywhere**. Lurie proves the first in **HA §1.3.5**, which
   was not read — and §§1.3.2–1.3.5 are his own construction of exactly what E1 builds.
3. **Liu–Zheng was read only for its setup**, and the section numbering differs between
   the arXiv version read here and the published version the roadmap cites.
4. **Bhatt–Scholze §§3.5–3.6 (descent) were not read**, so the E2 hypercover node quotes
   no theorem.

Also recorded: three statements the stage texts demand that appear in **no** source read —
that an exact coproduct-preserving functor between stable cocomplete categories preserves
all small colimits; the finite-cohomological-dimension criterion with uniform truncation
estimates; and the shift/cone-sign comparison, which is a statement about Mathlib's
conventions and appears in no mathematical source at all.

## Three structural findings

1. **Three layers build E1's ordinary input**, one of them E1's own prerequisite: it is in
   Mathlib (`SheafOfModules` + `IsGrothendieckAbelian`), it is built by
   `DiamondsAndVStacks:D0`, and it is stated as a target of E1. E1's target list should be
   narrowed to what the library does not have.
2. **E4 is a re-export of `DD.1` with two further owners** (`DD.1` and `P7`) — the same
   shape as `E5:cotangent-export` in the companion packet. Narrow E4 to its three genuine
   items: the sheaf extension, the enhanced inverse limit, the reconstruction theorem.
3. **E0 is a root of the stage graph with six consumers and no incoming edges**, because
   both its declared inputs are *external markers*, not stage ids — which is also why they
   had to be dropped from node prerequisites here. Promote them, or record E0 as a root.

## Where to resume

**Read Higher Algebra §§1.3.2–1.3.5.** It is Lurie's own construction of the enhanced
derived category — derived ∞-categories, the universal property of `D(A)`, inverting
quasi-isomorphisms, and Grothendieck abelian categories — and it very likely discharges
most of E1's obligations, including the unbounded K-injective existence that is currently
E1's deepest hole. After that, HTT Ch. 3 and §4.1 for E0 and E3.
