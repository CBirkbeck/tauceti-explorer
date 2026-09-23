# REV-AUDIT-34 — review of AUDIT-34

**Verdict: accepted.** No correction was needed. 178 targets checked; 196 of 197 citations matched
the index mechanically, and the one that did not is the index's fault, not the audit's.

Batch: `PotentialAutomorphyInfrastructure`, `PotentialModularityAndCompatibleSystems`,
`SerreWeightAndLevelOptimisation`, `TorsionCohomologyInfrastructure`,
`LogicAndDefinabilityInNumberTheory` — 37 layers, 178 targets, 197 declaration citations, 112
duplicates. Baseline: tauceti `f790474`, mathlib `082e2d3`. Reviewer: Claude Code, session
`cc-7b31c4`, issue #869; the audit was done by the local lane `claude4/1` (ledger, 2026-09-17,
after one `limit` checkpoint), so this is a different agent.

## What the audit claims

30 layers "not built", 5 "partly built" and 2 "process"; of 178 targets, 121 absent, 46 partial, 10
present in Mathlib and 1 in both libraries. The shape of the batch is unusual and the audit gets it
right: four of the five roadmaps are modularity infrastructure with essentially nothing built, while
the fifth, `LogicAndDefinabilityInNumberTheory`, is the one roadmap in the atlas whose first layers
Mathlib has already finished.

## 1. Every claim that something is in the libraries

**196 of 197 citations match** `declarations.tsv` exactly on name, library, file and line, and all
113 cited files exist. The exception and the one apparent `sorry` are both artefacts:

* `IsAdicComplete.henselianRing` (cited in `LD.1`) is **absent from the index, not from Mathlib**.
  It is declared at `Mathlib/RingTheory/Henselian.lean:170`, exactly where the audit says, as
  `instance (priority := 100) IsAdicComplete.henselianRing …`; `index_declarations.py`'s declaration
  regex has a `(?!\()` lookahead after the keyword, so a name that follows `instance (priority := …)`
  is never captured. The citation is right.
* `TauCeti/RingTheory/Huber/RingOfDefinition.lean` matches a `grep` for `sorry`, but the match is in
  the **module docstring**, in a provenance paragraph recording that AINTLIB's proof of the
  corresponding statement is a `sorry` and that Tau Ceti supplied a proof instead. With comments and
  docstrings stripped, none of the 113 cited files contains a `sorry` in code.

Both are worth recording for whoever red-teams this audit: a mechanical check against
`declarations.tsv`, or a bare `grep sorry`, produces a false positive on each.

**Layer coverage is exact** — the 37 audited layers are the 37 the atlas gives these roadmaps — and
**all 112 duplicates resolve** to real atlas stages; the six I read in full are borne out by the
target layer's own description (R04.6's global presentation for R24.2, AG2.6's coefficient-prime
comparison for PA.5 and R24.5, CC.8's tower adapters for TC.2, R06.4's weight intervals for PA.1,
R21.1's ordinary projectors as the rank-two instance of PA.2).

**All eleven targets claimed present were read in the source and hold.** The substantial block is
`LD.0`/`LD.4`, and it is as complete as the audit says: `FirstOrder.Language.Structure`, `Term`,
`BoundedFormula` (with the `Fin n` de Bruijn indexing the layer asks for), `Formula`, `Theory` and
`Realize`; `Set.Definable` with an explicit parameter set, its Boolean and projection algebra,
`DefinableFun`, and `mvPolynomial_zeroLocus_definable`; the ultraproduct with its induced structure
and Łoś's theorem in both the sentence and bounded-formula forms, with compactness derived from it;
elementary embeddings, elementary substructures and both Tarski–Vaught tests; `REPred`,
`ComputablePred`, Post's theorem, the halting problem and Rice's theorem; `Dioph` with its closure
properties and `Dioph.pow_dioph`, the hard step of MRDP, on top of the Pell development. `LD.1`'s
Henselian package (`HenselianLocalRing`, `HenselianRing`, the TFAE, adic completeness implies
henselian, and Tau Ceti's local-field and adic-completion instances) is likewise as described.

## 2. Re-searching the absent and partial claims

Nothing turned up that the audit missed. Zero declaration-name hits for Serre weights, completed
cohomology, the Borel–Serre boundary, locally symmetric spaces, Moret-Bailly's theorem,
Hilbert–Blumenthal varieties, congruence modules, Fontaine–Laffaille modules, or a Galois
representation attached to a modular form — the three `galoisRepresentation` hits are the Galois
action on the cocharacter lattice of a torus.

The audit's positive findings are the more useful half, and they hold. Tau Ceti really does prove
what `SerreWeightAndLevelOptimisation`'s document does not credit: multiplicity one and strong
multiplicity one for newforms (`Newforms/MultiplicityOne.lean`, `Newforms/StrongMultiplicityOne.lean`)
and the degeneracy/level-raising apparatus (`ModularForms/Degeneracy.lean`), all sorry-free — while
the Hecke modules are complex vector spaces of analytic cusp forms, so nothing integral, residual or
mod-p exists, exactly as the summary says. The same pattern holds for `TorsionCohomologyInfrastructure`,
whose TC.0 would build on Tau Ceti's Huber/Spa development, and for `PotentialModularityAndCompatibleSystems`
R23.1, where Mathlib's `GeometricallyIrreducible` and `Smooth` are the geometric hypothesis of
Moret-Bailly, "the input, not the theorem".

The two `process` layers, `R23.6` and `R20.6`, are export-and-table layers whose targets are all
absent, which matches their descriptions and the pattern of the previously accepted audits.

## Most important finding

There was nothing to correct. The two artefacts are worth carrying forward, because both would read
as audit errors to a mechanical check: `declarations.tsv` has no entry for a declaration written
`instance (priority := …) Name …`, and a `grep sorry` over a cited file can hit a provenance
docstring. The audit's own most valuable output — that four roadmap documents fail to credit
material Tau Ceti has already built, with the newform and degeneracy theory the clearest case —
survives review intact.

## Checks run

- Every citation matched against `declarations.tsv` at the pinned commits (196/197 mechanically, the
  remaining one resolved in the source); every cited file opened and scanned for `sorry` with
  comments and docstrings stripped (113 files, none); every declaration behind a claim of presence
  read in the source.
- Layer coverage compared against `data/atlas.json` (37/37, none extra); every duplicate target
  resolved against the atlas stage list (112/112), six read against the target layer's description.
- `python3 research/blueprint/intake.py check-files research/blueprint/audit/AUDIT-34.result.json`:
  no problems.
- A `review` object was added to the result, in the form the accepted audits AUDIT-01…31 use:
  `status: accepted`, `checked: 178`, no corrections.
- No Lean file was written or compiled, and no claim is made that anything here is formalised.
