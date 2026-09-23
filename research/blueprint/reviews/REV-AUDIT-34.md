# REV-AUDIT-34 — review of AUDIT-34

**Verdict: accepted.** 1 regrade. 178 targets, 197 declaration citations and 112 duplicates checked.

Batch: `PotentialAutomorphyInfrastructure`, `PotentialModularityAndCompatibleSystems`,
`SerreWeightAndLevelOptimisation`, `TorsionCohomologyInfrastructure`,
`LogicAndDefinabilityInNumberTheory` — 37 layers, 178 targets, 197 declaration citations, 112
duplicates. Baseline: tauceti `f790474`, mathlib `082e2d3`, matching the audit's `baseline` field and
the checkout at `workers/baseline`.

## What the audit claims

5 layers "partly built", 30 "not built", 2 "process". Of 178 targets, 11 are present (10 Mathlib, 1
both), 46 partial and 121 absent. That picture survived review. The four arithmetic roadmaps have
nothing — no potential automorphy, no Moret-Bailly theorem, no Serre weights, no torsion cohomology
machinery — while `LogicAndDefinabilityInNumberTheory` is the one member with real library support,
because Mathlib's model theory and computability are developed.

## 1. Every claim that something is in the libraries

**196 of 197 citations match `declarations.tsv` exactly on library, name, file and line.** All 113
cited files (78 Mathlib, 35 Tau Ceti) exist and none contains a `sorry` — the one apparent hit, at
`TauCeti/RingTheory/Huber/RingOfDefinition.lean:103`, is inside a module docstring recording that
*AINTLIB's* proof of a corresponding statement is a `sorry` and that Tau Ceti therefore ported only
the statement.

**The 197th citation is correct too, and it exposes a third index defect.**
`IsAdicComplete.henselianRing` is cited at `Mathlib/RingTheory/Henselian.lean:170`, and that is
exactly where it is — but it is declared `instance (priority := 100) …`, and
`declarations.tsv` does not index it. **For the orchestrator:** this is the largest of the three
extractor gaps found in this session's reviews, and unlike the other two it loses declarations
entirely rather than mangling their names. Mathlib declares **1,447** `instance (priority := …)`
declarations and I could not find a single one in the index: `IsAdicComplete.henselianRing`,
`Primrec.ofDenumerable`, `AddGroup.toOrderedSub`, `AddGroupSeminormClass.toZeroHomClass`,
`Algebra.complexToReal`, `BaireSpace.of_completelyPseudoMetrizable` and the rest all return zero
rows. An auditor searching the index by name will wrongly conclude that such an instance is absent.
(The other two gaps: `class abbrev` recorded as `abbrev`, reported in REV-AUDIT-36; the enclosing
namespace sometimes dropped, reported in REV-AUDIT-32.)

The eleven present claims are accurate, and they are the right declarations: Mathlib's
`FirstOrder.Language.Structure`, `Term`/`BoundedFormula`/`Formula`/`Theory` with `Realize`,
`Set.Definable`, the ultraproduct structure with Łoś's theorem (`Ultraproduct.sentence_realize`),
`ElementaryEmbedding`, `Filter.hyperfilter`, `AlgebraicGeometry.GeometricallyIrreducible`, `REPred`,
`Dioph` and `Dioph.pow_dioph`.

## 2. Layers marked "process"

**`PotentialModularityAndCompatibleSystems:R23.6` is genuine** — "Export separate residual and
characteristic-zero potential-modularity statements", "An application table", "Validation of the
separation against KW II §§6 and 10" — export and bookkeeping throughout.

**`SerreWeightAndLevelOptimisation:R20.6` is regraded "process" → "not built".** Its milestone's own
first instruction is "**Prove** the bounded-level, weight-two and trivial-character consequence used
by R29 at sufficiently large good p", and its first target is exactly that theorem. All three of its
targets are absent, so "not built" is accurate and keeps a real gap in the tally instead of filing it
under interface work. I added a sentence to that target's note recording why. With the change every
verdict in the audit follows its targets under a single rule.

This is the same defect I found at `PadicLocalLanglandsForGL2Qp:R30.1` in REV-AUDIT-33 — a
"process" layer whose milestone asks for a proof. **For the orchestrator:** it is worth checking the
other batches' process layers for the same pattern; the test that caught both is simply whether any
target begins with *prove* rather than *export*, *register*, *assign* or *bind*.

## 3. Re-searching the absent and partial claims

I re-searched independently over `declarations.tsv` and both Lean trees. **Nothing turned up that the
audit missed.** Zero hits for o-minimality, semialgebraic or subanalytic sets, Tarski–Seidenberg,
motivic integration, arc and jet spaces, Ax–Kochen–Ershov, Denef–Pas, cell decomposition, Igusa zeta
functions, potential automorphy, Serre weights, companion forms and congruence modules.

Two hits needed checking and both confirm the audit rather than contradict it:

* **Moret-Bailly.** Three Mathlib files mention it — but as the bibliography entry *Laumon and
  Moret-Bailly, Champs algébriques* in the descent files, not the Moret-Bailly theorem on rational
  points that R23.1 needs. Absent, as the audit says.
* **Presburger arithmetic.** Mathlib does have `FirstOrder.Language.presburger`, and the audit
  already cites it in LD.0 and cites `definable_iff_isSemilinearSet` for LD.1's
  quantifier-elimination target, with a note that is exactly right: the syntactic vocabulary and two
  elimination-flavoured results exist, but there is no general QE theorem. The Presburger file's own
  TODO confirms it.

## 4. Duplicates

**All 112 duplicate edges resolve in `data/atlas.json`.** Of the seven phrases the notes quote, four
match the cited stage verbatim and I checked the other three by hand: "general arithmetic-point" is
the title of `R24.5:operations`; "this lift is modular" is the shared *conclusion* the note says the
two layers have, not a quotation from R22.6; and "certified algorithms for special families" is
quoted from LD.5's **own** target, as its note states. All three are legitimate.

**No duplicate is missing.** The uncited roadmaps that score at all on this batch's vocabulary do so
in the ordinary English senses — `tauceti:TauCetiRoadmap/BelyiMaps`'s "definable" is "not merely
definable [but computable]" and its "compatible system" is a compatible system of homomorphisms into
`(ZMod n)ˣ`, not of Galois representations.

## Checks

- 197 citations × (library, name, file, line): 196 match the index; the 197th verified directly in
  the Mathlib source at the pinned commit.
- 113 cited files: all present, none with a `sorry`.
- 37 layer ids and 112 duplicate layer ids: all resolve in `data/atlas.json`.
- After the regrade, every verdict follows its targets under one rule.
- Lean: none.
