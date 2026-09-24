# Handoff — BP-LanglandsParameterStacks (issue #767)

Agent: Claude Code, session `cc-7b31c4`. Branch `cc-7b31c4-bp-lps`.

## Deliverables

- `research/blueprint/packets/LanglandsParameterStacks.json` — 33 nodes (4 definitions,
  5 constructions, 17 theorems, 2 lemmas, 5 comparisons), 53 API items, 35 unit tests,
  25 planets, 30 baseline declarations, 11 gaps, 15 requests, 3 structural findings.
  `"part": null`, `"status": "partial"`.
- `research/blueprint/readmes/LanglandsParameterStacks.md` — 2787 lines.
- `research/blueprint/suggested/LanglandsParameterStacks.lean` — 240 lines.
- This note.

## Checks run

- `check_blueprint.py … --index $TAUCETI_BASELINE/declarations.tsv` → **0 errors, 0 warnings**.
- `research/blueprint/intake.py check-files` → 0 problems.
- `python3 -m unittest discover -s tests` → OK.
- **The Lean file was not compiled.** Every `implementationStatus` is `unchecked`.

## What this job rested on

A **reviewed integrated decomposition** already existed
(`data/decompositions/LanglandsParameterStacks.json`, review
`independent-review-REVIEW-EXT-05-EXT-02`, accepted 16 September 2026). All sixteen of
its node ids, statements, hypotheses, proof steps, acceptance items, locators and
excerpts are kept **unchanged**; excerpts over 400 characters were truncated at a word
boundary with a pointer back. What this job added to those sixteen: prerequisites
resolved to the pinned libraries or a named supplier, planets, per-layer coverage, and
API outlines with unit tests for the definitions and constructions.

A **reviewed library audit** also exists — `AUDIT-21`, reviewed as `REV-AUDIT-21` on
17 September 2026, 181 targets checked, 67 corrections — returning **not built** for all
eight layers with several targets *partial*. It was read first, as the job requires, and
it changed the packet: six declarations it names are cited rather than re-planned, and
all three structural findings come from its duplicate records.

## What this session read, and what that bought

Five bodies of material the decomposition had **located but not read** were read in full
here, and they are the seventeen new nodes.

| Read | Gave |
| --- | --- |
| **FS VIII.2 in full** (pp. 281–285) | the cotangent complex as `RΓ(W_E,(ĝ)_φ)[1]` with Poincaré duality; `Sing_{X/S}` and the singular-support criterion for perfectness; the computation of `Sing` for the parameter stack; the banal case and the nilpotent cone; and FS's own statement that in the non-banal case they are **not sure** the resulting notion is correct |
| **the proof of VIII.3.8** (p. 290) | the reconstruction of a semisimple cocycle of *discrete* groups, isolating **continuity** as the single imported step |
| **the proof of VIII.4.1** (pp. 291–292) | the invariant function `f(V,α,β)`, the *cartesian* reindexing square, the fusion argument for multiplicativity, and unit insertion |
| **FS VIII.5 in full** (pp. 293–301) | separatedness of the good-filtration t-structure; the good filtration of `O(Z¹(F_n,G))`; and Propositions VIII.5.10–VIII.5.13 — **the proof of Theorem VIII.5.2**, which the decomposition recorded as the unread heart of the integral theorem — including the equivalence whose *backwards* direction shows the hypothesis on `π₁(Ĝ)_tors` is **necessary** |
| **FS Chapter X in full** (pp. 339–350) | the compact-support definition, and the **answer** to the decomposition's open question |

## The decomposition's question, answered

> *"check specifically whether the integral spectral action there imposes the additional
> restriction that ℓ does not divide |π₁(Ĝ)_tors| (the roadmap says this restriction
> belongs to its consumer and is never removed by the existence of these categories)"*

**It does.** Theorem X.0.1 opens `Assume that ℓ does not divide the order of π₁(Ĝ)_tors`;
only the variant over a *field* over `Q_ℓ(√q)` is stated for any prime `ℓ`. And the
direction of the dependence is settled by the last line of §X.3: *"Combining this with
Theorem VIII.5.1, we have finished the proof of Theorem X.0.2"* — Theorem VIII.5.1 being
this roadmap's own. So Chapter X **consumes** Chapter VIII; the consumer cannot remove
the restriction, but neither does it introduce it.

One further point the decomposition could not know: **integrally the naive universal
property is false**. The analogue of Lemma X.1.2 fails, and Proposition X.3.1 is stated
for the sifted-colimit approximation `Perf(Map)^♮`.

## Three structural findings, all from AUDIT-21's duplicate records

1. **`SmoothRepresentationsOfLocalGroups:SR.6` builds a second integral model of the same
   cocycle schemes** — over `Z[1/p]` rather than `Z_ℓ` — and the audit records it as a
   duplicate of `LP0`, `LP1` *and* `LP2:integral-invariants`. The difference of base may
   justify both, but it should be one recorded decision, not two layers independently
   building cocycle schemes.
2. **Three other layers own pieces of this roadmap's foundations**: the upstream
   `ClassFieldTheory` layer 9 owns the local Weil group (and the audit says so in as many
   words); `AnabelianGeometryAndNonabelianChabauty:NC.3` owns nonabelian `H¹` with
   unipotent coefficients, which is the same foundation this roadmap needs and which
   neither library has; `PotentialAutomorphyInfrastructure:PA.1` owns integral Weyl and
   dual-Weyl modules, which is `LP3`'s first target.
3. **Chapter X depends on this roadmap and the link graph should say so** — with the
   consequence that `ES2`, `ES3` and `ES4` *inherit* their `π₁(Ĝ)_tors` hypothesis from
   here. Also: `LP4`'s text names `VS2`'s coefficient interpretation as an input, and
   nothing in Chapters VIII or X states any compatibility with it.

## What remains

Eleven gaps. The three that block most:

1. **V. Lafforgue §11 is unread**, and after this session's reading it is the *only*
   substantive unread input of `LP2:semisimple-characters`: three of the four steps of
   VIII.3.8's proof are now planned, and the fourth — continuity — is quoted from
   Proposition 11.7 and Lemma 11.10.
2. **All six modular-representation inputs of `LP3` are unread and none is in the
   library**: Donkin, Donkin–Mathieu, Kempf, Koppinen–Donkin, Touzé–van der Kallen,
   Prasad–Yu. What changed is that FS's *use* of each is now planned, so it is exactly
   visible which statement each is needed for. Obtain Jantzen, *Representations of
   Algebraic Groups*, 2nd ed., Part II Ch. 4, and Prasad–Yu.
3. **Zhu is in the library and entirely unread**, and FS VIII.2.5 uses `[Zhu20, 3.1.8]`.
   That is why VIII.2.4 and VIII.2.5 — the Weil–Deligne moduli — are **not planned** here;
   the packet plans the monodromy morphism and the boundary it marks, and says so.

Also open and recorded: Haboush's theorem; the relation FS leave as an exercise in the
proof of VIII.3.7; the derived mapping stack the `LP1` text asks for, which is not in FS;
and change-of-discretisation independence, where the source states its **own** open
question — it does not know whether passing to the `ℓ`-torsion-free quotient is necessary.

## Where to resume

The highest-value single action is **reading V. Lafforgue §11**: it closes the last input
of `LP2:semisimple-characters` here *and* the corresponding gaps in the
`ExcursionOperatorsAndSpectralAction` packets `ES0` and `ES5`, which cite the same two
results. After that, Jantzen Part II Ch. 4 for `LP3`, and Zhu §§2–3 for `LP1` and the
Weil–Deligne boundary.
