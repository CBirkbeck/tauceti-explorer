# REV-AUDIT-32 — review of AUDIT-32

**Verdict: accepted.** 3 duplicates added. 185 targets, 87 declaration citations and 127
duplicates checked.

Batch: `EllipticCurveModularity`, `EndoscopicTransferAndUnitaryTraceComparison`,
`GL2ModularityLifting`, `GlobalGaloisDeformations`, `IgusaVarietiesAndTorsionConcentration` — 49
layers, 185 targets, 87 declaration citations, 127 duplicates. Baseline: tauceti `f790474`, mathlib
`082e2d3`, matching the audit's `baseline` field and the checkout at `workers/baseline`.

## What the audit claims

46 layers "not built", 3 "process", none built or partly built. Of 185 targets, **174 are absent and
11 partial; none is present**. That picture survived review. Modularity of elliptic curves, Serre's
conjecture, Galois deformation rings, Taylor–Wiles patching, endoscopic transfer and Igusa varieties
are not in either library at the pinned commits, and neither is any of their scaffolding — no Tate
module, no Weil pairing, no conductor of an elliptic curve, no Jacobian, no Galois action on torsion
points.

## 1. Every claim that something is in the libraries

**86 of 87 citations match `declarations.tsv` exactly on library, name, file and line.** All 50 cited
files (33 Tau Ceti, 17 Mathlib) exist and none contains a `sorry`.

**The 87th is correct too.** `ModularForm.Λ` is cited at
`Mathlib/NumberTheory/ModularForms/LFunction.lean:91`; line 91 is `noncomputable def Λ` inside
`namespace ModularForm` (lines 36–161), so the full name is exactly as cited. The index records it
as bare `Λ`, without the namespace. **For the orchestrator:** this is a second, independent defect in
`declarations.tsv` beyond the `class abbrev` one reported in REV-AUDIT-36 — the extractor does not
always prefix a declaration with its enclosing namespace, and it is inconsistent *within a single
file* (that file's `ModularForm.tendsto_ofComplex_I_mul_atTop_atImInfty` at line 42 keeps its prefix,
while `Λ`, `L`, `weakFEPair` and `hasSum_Λ` lose theirs). 26,459 of the 246,008 Mathlib rows carry a
dotless name, so a name-based checker will produce false "missing" verdicts on some of them. These
citations should not be "fixed".

The eleven partial targets and the five non-`related` fits are accurate:
`Newform.eq_of_forall_notMem_eigenvalue_eq` and `…_qExpansion_coeff_eq` really are strong
multiplicity one in the strong form R29.3 needs (agreement outside a finite set of good indices
forces equality, with nothing assumed at indices dividing the level), and `WittVector.Isocrystal`
with `isocrystal_classification` is correctly labelled `more general`/`special case` against IG.0's
Newton-map target.

The notes are unusually careful about which *side* of a comparison exists — that
`WeierstrassCurve.frobeniusTrace` and the newform's Hecke eigenvalue are both defined but nothing
relates them; that Mathlib's `localEulerFactor` is built "and the roadmap does not say so"; that Tau
Ceti's base-point-normalised Abel–Jacobi map exists at divisor-class level "and the roadmap does not
credit it". Those are the right observations to record.

## 2. Layers marked "built" or "process"

No layer is built or partly built. The three "process" layers are all
`EndoscopicTransferAndUnitaryTraceComparison:ET.2a` and its two prefixes — import-only layers that
construct nothing, whose own text says they import EDC.0–6 and LPV.6 as "the same source coefficient
categories and operators, not independently constructed aliases". The audit records that the imported
material is itself absent, so the classification hides nothing.

## 3. Re-searching the absent claims

I re-searched independently over `declarations.tsv` and both Lean trees. **Nothing turned up that the
audit missed.** Zero hits for Serre's conjecture, deformation rings, universal deformations,
Taylor–Wiles, patching, Hecke algebras as such, Igusa varieties, Newton stratifications,
Rapoport–Zink spaces, endoscopy, transfer factors, the trace formula, Tate modules, the Weil pairing
and Néron models.

Every misleading hit is one the audit already names:

* `modularity` matches exactly one declaration, `Finset.expansion_submodularity` in additive
  combinatorics — the R29.6 note says precisely this.
* `jacobian` matches `WeierstrassCurve.Universal.Jacobian.*`, which is Jacobian *coordinates*, not
  the Jacobian variety; the R29.5 note says no Jacobian of a curve exists.
* `fundamentalLemma` matches homotopical algebra; `conductor` matches Γ₀-twist lemmas, never an
  elliptic curve's conductor, as the R29.4 note states.
* `abelJacobi` matches Tau Ceti's `OrderSystem.weightedAbelJacobiClass`, which is exactly what the
  audit cites for R29.5.

## 4. Duplicates

**All 127 recorded duplicate edges resolve in `data/atlas.json`.** I checked the notes the hard way:
many quote the counterpart roadmap, and **all 24 quoted phrases were found in the stage they cite**
once en-dashes and the audit's bracketed inflections (`deduce[s]`, `appl[ies]`, `consume[s]`) are
allowed for — including ModularCurvesPartII R14.6's "the finite-level freeness statements needed for
Taylor–Wiles modules. Supply the rational cusp and normalised Abel–Jacobi map used by R29",
ClassicalSerreModularity R33.6's "Deduce the same R29 elliptic-curve theorem", and
EndoscopicTransfer ET.5's "Consume only IG.0–IG.1's finite-level Igusa varieties".

**Three duplicates are added, and they share one root cause: the audit records no Tau Ceti layer at
all** (0 of 127), although Protocol 15 makes Tau Ceti roadmaps existing work that the atlas imports
rather than re-plans, and although the audit itself cites Tau Ceti *declarations* for these very
targets. `EllipticCurveModularity` has **no Tau Ceti prerequisite on any of its six stages**.

* `R29.2` and `R29.3` ← `tauceti:TauCetiRoadmap/ModularForms#layer-8g-galois-stability-the-character-field-and-rationality`.
  8G builds `CharacterField χ` and `CoefficientField f` with `CharacterField χ ≤ CoefficientField f`,
  and exists precisely to prove that `f ↦ f^σ` is well defined — "a deep stability statement"
  proved algebraically through the Hecke algebra. That is exactly what R29.2 asks to record
  ("coefficient fields and primes above p") and what R29.3's rationality target needs; the audit's
  own notes say the Galois half is the missing piece, without noticing that Tau Ceti plans it.
* `R29.4` ← `…ModularForms#layer-4-eigenforms-newforms-primitive-forms-the-conductor`. "The primitive
  level of f equals N_E" is a statement about the conductor of a newform, which Layer 4 owns; only
  the elliptic-curve side of the equality belongs in R29.4.

I checked the other roadmaps that plan this mathematics and are absent from the list.
`AutomorphicCongruences:L3` imports "patching from DeformationAndDerivedPatchingAlgebra and the
applicable lifting theorem from GL2ModularityLifting" — a declared importer, and the kind of handoff
Protocol 15 allows — but unlike the Tau Ceti case it adds no ownership question, so I left it out.

## Checks

- 87 citations × (library, name, file, line): 86 match the index; the 87th verified directly in the
  Mathlib source at the pinned commit.
- 50 cited files: all present, none with a `sorry`.
- 49 layer ids and 130 duplicate layer ids (127 + 3 added): all resolve in `data/atlas.json`.
- 24 quoted phrases in duplicate notes: all verified against the cited stage descriptions.
- Lean: none.
