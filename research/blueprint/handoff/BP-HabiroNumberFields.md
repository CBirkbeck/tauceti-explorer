# Handoff — BP-HabiroNumberFields (issue #748)

Agent: Claude Code, session `cc-7b31c4`. Branch `cc-7b31c4-bp-hnf`.

## Deliverables

- `research/blueprint/packets/HabiroNumberFields.json` — 18 nodes (4 definitions,
  5 constructions, 4 theorems, 5 comparisons), 50 API items, 36 unit tests,
  6 planets, 2 baseline declarations, 4 gaps, 15 requests, 3 structural
  proposals. `"part": null`, `"status": "partial"`.
- `research/blueprint/readmes/HabiroNumberFields.md` — 1096 lines.
- `research/blueprint/suggested/HabiroNumberFields.lean` — 190 lines, every proof
  `sorry`.
- This note.

**All four stages in scope are `source_decomposed` with an empty `remaining`.**

## Checks run

- `check_blueprint.py … --index $TAUCETI_BASELINE/declarations.tsv` → **0 errors,
  0 warnings**.
- `intake.py check-files` on the four paths.
- `python3 -m unittest discover -s tests`.

**No Lean was compiled**; shared Mathlib cache.

## Three sources, all hash-recorded

- **GSWZ, *The Habiro ring of a number field*** (arXiv:2412.04241), `308d1dd1c4…`
  — Definitions 1.1, 1.3, 1.4 and Theorem 1. Already on disk from this session's
  `HabiroNahmSeries` job, where its hash was checked against `plans/HABIRO.md`,
  and re-read here.
- **CGZ, *Bloch groups, algebraic K-theory, units, and Nahm's conjecture***
  (arXiv:1712.04887v3), `024317c20a…` — Theorems 1.2 and 1.6, Remark 1.3. Also
  already on disk from that job.
- **Hutchinson, *The Chern class and the cyclic quantum dilogarithm***
  (arXiv:2104.14413v4), `ee224a185b…` — taken as LaTeX source, which reads
  cleanly. Suslin's sequence, the Chern-class isomorphism, Soulé's product
  formula and the computation `c_ζ(η_ζ) = ζ`.

What was read from each is in `sources[i].readSections`; what was not is gaps 1–3.

## The one thing worth flagging about the state of the field

**The scalar in CGZ Theorem 1.6 is settled for odd orders.** CGZ prove `R = c^β`
for a universal invertible `β` and conjecture it is 2 up to sign; Hutchinson
proves `R_ζ = c_ζ²` for odd `N`. The HB.2 stage text still describes the
refinement as something to be proved and says "this does not set the scalar to
one" — which remains right — but a structural note asks that it record that the
question is *closed* in that range, so a reader does not treat it as open where
it is not. Outside the hypotheses the weaker comparison is retained, exactly as
the stage text says.

## The negative statements, each carried as a node

- **HB.1** — the two Bloch conventions differ by bounded 2- and 3-primary groups
  and are never identified integrally; and where the eigenspace projection
  divides by a group order, **invert the order or use the integral kernel**.
- **HB.2** — units, S-units, Kummer classes and their quotients are four
  different objects; the scalar is not set to one.
- **HB.6** — **no naive `R`-algebra structure** (constant families need not
  glue); **not a domain** merely because `O_F` is; **the full cyclotomic
  coefficient algebra**, not one residue field, in a p-adic comparison; and the
  Frobenius is **not a global automorphism** except in the abelian case, which is
  a separate result.
- **HB.7** — **locally a line is not globally free**, and a multiplication map is
  not an isomorphism because the local description resembles one.

And one positive point that needed its own node: the gluing condition of HB.6 is
a *definition* only because `ζ_{pm} − ζ_m` is topologically nilpotent in the
completion — which is precisely the hypothesis Mathlib's `PowerSeries.subst`
requires, and which the companion `HabiroCyclotomicCompletions` packet states in
the same form.

## What is imported

Fifteen requests: `K3BlochGroups:V.1/V.2/V.4`, `MotivicEtaleKTheory:M.3/M.8`,
`ArithmeticKTheory:N.1/N.4/N.5`, `HabiroCyclotomicCompletions:HC.1/HC.3/HC.5/HC.6`,
`PadicHodgeRegulators:D.4`, `HabiroRings:HR.5`, `StableHomotopyKTheory:H.2`. The
stage text for HB.1 insists the cohomological theorem be formalised rather than
assumed; this packet imports it by name and states exactly what is imported, so
the dependency is visible rather than silent.

## Gaps

1. **The proofs in GSWZ §§2–3 were not read** — Theorem 1 and Lemmas 3.4, 3.6 are
   what the existence of invertible sections and the gluing condition rest on.
2. **CGZ was read only through its introduction** — §§2, 4 and 5 are where the
   five-term relation and the comparison are proved.
3. **Hutchinson was read through §3** — the Bott-element computation is in §§3–4.
4. **The cohomological input of HB.1 has no source here** — it is imported, and
   the three owners' packets should be checked to confirm they prove what this
   layer needs.

## Where to resume

GSWZ §§2–3 (gap 1): it is the only gap that blocks nodes rather than deepening
them, and the file is already on disk and hashed.
