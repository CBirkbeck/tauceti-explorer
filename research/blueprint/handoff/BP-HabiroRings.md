# Handoff — BP-HabiroRings (issue #749)

Agent: Claude Code, session `cc-7b31c4`. Branch `cc-7b31c4-bp-hrb`.

## Deliverables

- `research/blueprint/packets/HabiroRings.json` — 27 nodes (4 definitions,
  6 constructions, 8 theorems, 9 comparisons), 56 API items, 40 unit tests,
  10 planets, **0 baseline declarations**, 4 gaps, 15 requests, 3 structural
  proposals. `"part": null`, `"status": "partial"`.
- `research/blueprint/readmes/HabiroRings.md` — 1452 lines.
- `research/blueprint/suggested/HabiroRings.lean` — 215 lines, every proof
  `sorry`.
- This note.

**All eight stages in scope are `source_decomposed` with an empty `remaining`.**

## Checks run

- `check_blueprint.py … --index $TAUCETI_BASELINE/declarations.tsv` → **0 errors,
  0 warnings**.
- `intake.py check-files` on the four paths.
- `python3 -m unittest discover -s tests`.

**No Lean was compiled**; shared Mathlib cache.

## The source, and how to read its numbering

**Ferdinand Wagner, *q-Hodge complexes over the Habiro ring*** (arXiv:2510.04782v2),
taken as LaTeX source, SHA-256 `9c33845587…`. It is the paper the stage texts
cite throughout.

**The stage texts' numbering does match it**, and the next worker should not
repeat the mistake this note originally recorded. The source runs a *single
counter per section*, shared by the numbered paragraphs (`numpar`) and the
theorem environments alike, and letters its appendix sections. Counting that way,
the stage texts' Corollary 2.4, Theorem 2.9, Remark 2.10, Lemma 2.12, Corollary
2.13, Remark 2.14, Corollary 3.13 and Appendix B.2/B.3/B.4/B.8 all land on
exactly the statements they describe — eleven citations, eleven hits. Counting
only the theorem environments, or only the numbered paragraphs, is what makes the
numbering look broken.

**The companion q-Witt paper was not obtained** — it is where the relative q-Witt
rings, their ghost description and the no-restriction obstruction actually live.
That is gap 1, and a structural note asks that HR.4's stage text name it as its
implementation source the way the other layers name this one.

## Zero baseline declarations, and that is the honest answer

Nothing in either pinned library is close enough to cite: no Λ-rings with
commuting Adams operations, no Habiro completion, no q-Witt vectors, no descent
machinery of this shape. Every node is either new work or an import from one of
the eight prerequisite roadmaps — **fifteen requests**, the largest set of any
packet I have written in this session.

## Each caution the stage texts give, carried as a hypothesis or a non-example

- **HR.1** — Λ-ring is the *arithmetic* notion, never an Iwasawa algebra; perfect
  covering is **not automatic**; there need be **no global Frobenius** on `R`.
- **HR.2** — completion is **not** inverting the `q^m − 1`; the four detection
  results are what prove staticity, **not** an assumption that completion is
  exact; the solid comparison is **bounded below**.
- **HR.3** — the diagram degenerates because of an arithmetic computation, and
  that is **not a licence** to glue arbitrary pairwise isomorphisms; the
  conclusion is an equivalence of categories, not an object.
- **HR.4** — **there is no restriction operator**, so the transitions are named
  Frobenius and no big q-Witt ring exists in the naive sense.
- **HR.5** — keep the **full cyclotomic coefficient algebra**; and the proof line
  asserting `Φ_m` stays irreducible modulo every `ℓ ∤ m` is **false as stated** —
  `Φ₅` over `𝔽₁₁` splits — with componentwise idempotent descent as the repair.
  The theorem is not in doubt; the line is.
- **HR.6** — a graded line module is **not** a cohomology class; late return edge,
  **not** a cycle.
- **HR.7** — the generic equaliser is **not** a Habiro construction, and no
  placeholder or axiom stands for a contract.

## Gaps

1. **The companion q-Witt paper was not obtained** (HR.4, HR.1).
2. **The appendix was read only at its opening** (HR.2) — the four detection
   results are stated as the stage text lists them.
3. **The later descent sections were not read** (HR.6).

## Where to resume

Obtain Wagner's q-Witt paper (gap 1). It is the only gap that blocks nodes rather
than deepening them: HR.4's two central objects are stated on the strength of the
stage text alone.
