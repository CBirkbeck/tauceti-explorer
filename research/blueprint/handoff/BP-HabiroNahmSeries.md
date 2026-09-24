# Handoff — BP-HabiroNahmSeries (issue #1011)

Agent: Claude Code, session `cc-7b31c4`. Branch `cc-7b31c4-bp-nahm`.

## Deliverables

- `research/blueprint/packets/HabiroNahmSeries.json` — 74 nodes (10 definitions,
  11 constructions, 23 theorems, 14 lemmas, 3 comparisons, 13 applications), 143
  API items, 84 unit tests, 25 planets, 46 baseline declarations, 10 gaps, 24
  requests, 5 structural proposals. `"part": null`, `"status": "partial"`.
  **All seven layers in scope carry `source_decomposed` coverage with an empty
  `remaining` list.**
- `research/blueprint/readmes/HabiroNahmSeries.md` — the roadmap document, 3270
  lines, one section per layer with every node's statement, hypotheses, proof
  outline, API, unit tests, acceptance items, prerequisites and sources.
- `research/blueprint/suggested/HabiroNahmSeries.lean` — 822 lines of suggested
  signatures and `example` unit tests, 280 `sorry`s.
- This note.

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/HabiroNahmSeries.json --index $TAUCETI_BASELINE/declarations.tsv`
  → **0 errors, 0 warnings**, with the pinned declaration index in place, so all
  46 baseline references were resolved against it and not merely checked for form.
- `python3 -m unittest discover -s tests` → 273 tests, OK.
- `python3 research/blueprint/intake.py check-files` on the four changed paths → 0 problems.

**The Lean file was not compiled.** No Lean was run for this job. The Mathlib
build on this machine is a shared cache that must not be rebuilt, and this
working tree has no elaborated dependency modules. Nothing in this packet is
claimed to be formalised and every `implementationStatus` is `unchecked`.

## Sources: three, all read as LaTeX

All three were downloaded from arXiv on 24 September 2026, hashed, and read as
**e-print LaTeX source** rather than as extracted PDF text, so every statement is
read as the authors wrote it and every environment number was recomputed from the
theorem counters.

| id | paper | PDF SHA-256 |
| --- | --- | --- |
| `cgz` | Calegari–Garoufalidis–Zagier, *Bloch groups, algebraic K-theory, units, and Nahm's conjecture*, arXiv:1712.04887v3 | `024317c2…3bf5` (matches the campaign library record cited in `plans/HABIRO.md`) |
| `gswz` | Garoufalidis–Scholze–Wheeler–Zagier, *The Habiro ring of a number field*, arXiv:2412.04241v2 | `308d1dd1…3de9` (matches `plans/HABIRO.md` exactly, as does the e-print hash `b93170cf…fd66`) |
| `gz` | Garoufalidis–Zagier, *Asymptotics of Nahm sums at roots of unity*, arXiv:1812.07690v1 | `c8e81004…5b66` |

**`gz` is not in the family's plan document.** HB.4's stage text names "the
detailed proof of Garoufalidis–Zagier" as the source of the all-orders expansion,
and that paper is the only one that proves it — CGZ quote it in simplified form.
A `restructure` entry asks that it be added to the family's source register with
both hashes.

**Read in full:** CGZ §1.3 and all of §7; GSWZ §§1.6, 1.7, 2, 3, 4; all of
Garoufalidis–Zagier except its appendix.
**Not read**, each a gap with its next source action: CGZ §§2–6 (the unit and the
Chern class — `HabiroNumberFields:HB.1`'s job), GSWZ §§1.1–1.5 and §5 (the Habiro
ring and its modules — `HB.6`/`HB.7`), the GZ appendix (the KMS identity —
`HB.2`), and four cited works not obtained: Zagier's dilogarithm survey,
Vlasenko–Zwegers, Hutchinson, and Kontsevich–Soibelman with Efimov.

## What shaped the packet

- **AUDIT-14 was read first.** It records HB.5a *partly built* and the other six
  layers *not built*. Its evidence list is what makes HB.5a the smallest layer
  here: `Subgroup.IsArithmetic` with the equivalence to finite index, `IsCusp`,
  scaling matrices, `CuspOrbits`, `Subgroup.strictWidthInfty`, Tau Ceti's
  `cuspTranslationOrbitWidth` and `Function.Periodic.qParam` are all pinned, so
  the layer plans only the two things that are missing — weight-zero *meromorphic*
  modular functions with Laurent expansions at every cusp, and the radial growth
  theorem — plus a node stating the four facts HB.5 actually consumes.
- **The Bloch-group and polylogarithm material is imported by node identifier**
  from the reviewed `K3BlochGroups.json` and `Polylogarithms.json`, which already
  carry the CGZ-convention Bloch group, the five-term relation, the boundary into
  the antisymmetric quotient with its two-primary discrepancy, Suslin's sequence,
  the five-term certificates, the Bloch–Wigner function and the weight-two
  regulator. Nothing of it is re-planned (PROTOCOL §15).
- **The two kinds of Nahm datum are kept apart**, as HB.3's text demands: the
  analytic record (positive definite rational `A`, `B`, `C`) and the formal record
  (symmetric integral `A`). There is a coercion from a positive-definite integral
  formal datum to an analytic one and deliberately none the other way.
- **Neither source proves existence and uniqueness of the distinguished
  solution.** Both assert it. The proof outline here is the standard convexity
  argument, reconstructed: in `u = log X` the potential `W(u) = −½uᵀAu − Σ Li₂(e^{u_i})`
  has gradient `−(Au)_i + log(1 − e^{u_i})`, so its critical points are exactly the
  solutions in the cube; its Hessian is `−(A + diag(z/(1−z))) = −Ã`, negative
  definite, so `W` is strictly concave; `W → −∞` at infinity and its gradient
  forces the maximum off the boundary. The same `Ã` is the Hessian of HB.4's
  Gaussian and the discriminant of HB.8, which is a useful consistency check.
- **Two printed slips in GSWZ** are recorded as a gap for a `kind:errata` job: the
  t-deformed equations (zjt) print `z_j` inside the product where the exponent
  `A_{i,j}` requires `z_i`; and §4.3 prints the quartic field's discriminant as
  `−5²·19` and, three paragraphs later, as `−5⁴·19`. Neither affects any statement
  here.

## What remains

No layer is *closed* — closure means Lean. Every layer is *source_decomposed*: its
stage targets are decomposed from sources that were read. The ten gaps, each with
an exact next source action, in rough order of how much they block:

1. **Poisson summation** — Claims 1–4 of GZ §4.3 are referred to Vlasenko–Zwegers
   pp. 623–625, which was not obtained, and Poisson summation is absent from both
   libraries (the only Euler–Maclaurin statement pinned is the trapezoid-rule error
   bound). This is the largest analytic obligation in the roadmap.
2. **Zagier's dilogarithm survey** — three statements rest on it: existence and
   uniqueness of the distinguished solution, the constant `K` of its eq. (29), and
   the exponentially small error under modularity, its eq. (28).
3. **CGZ §§2–6** — the injectivity statement of CGZ Theorem 1.2 ends the proof of
   Theorem 7.5, and Theorems 1.5/1.6 with eq. (14) give HB.9's constant term. That
   reading is `HB.1`'s job, not this one.
4. **General rank** — GSWZ write Theorems 7 and 8 and the gluing step of Theorem 5
   for `N = 1` only. The general statements are planned here; the general proofs
   are not in the source.
5. **Periodicity of the Gaussian integrals** — cited to Aarhus II and GSW, neither
   obtained; the computation in the proof of Lemma 2.12 is recorded as the outline.
6. Hutchinson; Kontsevich–Soibelman and Efimov; Wagner's thesis; and no textbook
   treatment of the cusp theory of finite-index subgroups.

## Structural proposals

1. **Add Garoufalidis–Zagier to the family's source register** with both hashes:
   it is HB.4's primary source and is missing from `plans/HABIRO.md`.
2. **Divide HB.8.** It carries the whole of GSWZ §2 — 17 nodes here — in two
   independent halves: the combinatorial one (admissible series, DT exponents,
   level `m`, Theorems 6 and 7), which needs only `HC.1`; and the analytic-algebraic
   one (formal Gaussian integration, the ring `S`, Theorems 3 and 8, WKB), which
   needs `HB.2`. They meet only at the identification theorem.
3. **Narrow HB.5a's text** to the two facts the libraries lack, citing the pinned
   declarations for the rest, and keep the non-congruence insistence, which is the
   part that carries information.
4. **HB.4's cyclic-dilogarithm target belongs to HB.2** and the text should say so.
5. **Record which node discharges each acceptance item** in the roadmap document.

## Where to resume

The next real work is source acquisition, not reading what is in hand:
Vlasenko–Zwegers first (it unblocks the only analytic gap that a formalisation
would hit immediately), then Zagier's survey. After that the general-rank proofs
of GSWZ Theorems 7 and 8 are mathematics to be written, not read. `HB.1` and
`HB.2` are the two supplier jobs that this packet leans on hardest; until they
exist, `HB.5`'s theorem and `HB.9`'s constant-term lemma rest on requests.
