# REV-AUDIT-31 — review of AUDIT-31

**Verdict: accepted.** 2 corrections, 5 duplicates added. 160 targets checked.

Batch: `ArithmeticGaloisRepresentations`, `AutomorphicGaloisRepresentations`,
`AutomorphicGaloisRepresentationsPartII`, `ClassicalSerreModularity`,
`CompletedCohomologyAndLocalGlobalCompatibility` — 47 layers, 160 targets, 98 declaration
citations, 59 duplicates. Baseline: tauceti `f790474`, mathlib `082e2d3`.

## What the audit claims

44 layers "not built", 3 "process", no layer "built" or "partly built". No target is claimed
present in either library: 151 are absent and 9 partial. That picture survived review. These
five roadmaps are Galois representations attached to automorphic forms, Serre's conjecture and
p-adic local–global compatibility, and the libraries contain none of it.

## 1. Every claim that something is in the libraries

All 98 citations (75 distinct declarations) match `declarations.tsv` exactly on name, library,
file and line. None of the 65 cited files contains a `sorry`. I read the source around every
cited line and compared it with the audit's note; the notes are accurate and, where it matters,
precise about hypotheses — for example that Mathlib's `ContRepresentation` only asks each `g` to
act continuously and not for joint continuity in `g`, that `WeierstrassCurve.localPolynomial` is
built from point counts and the reduction type rather than from inertia invariants, and that
`TauCeti.Place.ramificationGroup` is the lower numbering for a place of `F'/k` trivial on the
constant field. For the Tau Ceti citations whose prefix could have been wrong I confirmed the
namespace in the file itself (`Representation.isOpen_ker_of_finite`,
`Field.absoluteGaloisGroup.finite_quotient_of_isOpen`, `TauCeti.Representation.IsInvariantForm`,
`Representation.exteriorPower` / `symmetricPower` / `baseChange`).

Two entries were wrong; both are fixed in place.

* **`ArithmeticGaloisRepresentations:R01.2`, decomposition groups.** The note said
  "Decomposition and inertia subgroups exist only for finite Galois extensions". That is false:
  `ValuationSubring.decompositionSubgroup` and `ValuationSubring.inertiaSubgroup`
  (`Mathlib/RingTheory/Valuation/RamificationGroup.lean:30,50`) are defined for an arbitrary
  extension `L/K` and an arbitrary valuation subring of `L`, with no finiteness or Galois
  hypothesis. The note now says what is actually missing — a decomposition group at a place of a
  number field inside the absolute Galois group, and independence of the choice up to conjugacy —
  and cites the declaration. The `partial` classification and the verdict are unchanged.
* **`ArithmeticGaloisRepresentations:R01.1`, finite Galois factorisation.**
  `Field.absoluteGaloisGroup.finite_quotient_of_isOpen` was labelled `exact`. It states that
  `Gal(L/K) ⧸ U` is finite for an open subgroup `U` of the Galois group of any normal extension:
  one input to the target, not the stated equivalence between continuity and factorisation
  through a finite Galois quotient for finite coefficient rings. Relabelled `related`, and the
  note now says `Module.Finite` (finitely generated) rather than "finite".

## 2. Layers marked "built" or "process"

No layer is "built". The three "process" layers are `AutomorphicGaloisRepresentationsPartII:AG2.1`
(an aggregate that explicitly exports the composition of AG2.1a and AG2.1b and states no
mathematics of its own), `ClassicalSerreModularity:R26.1` (source decomposition and assignment of
the lifting, compatible-system and small-prime lemmas to their suppliers) and
`CompletedCohomologyAndLocalGlobalCompatibility:R31.6` (export interface plus the globalisation
dependency audit). Each matches its description, and each matches the pattern of the 28 process
layers in previously accepted audits — interface, export and audit layers that also carry absent
targets. Since no target anywhere in the batch is present, "not built" is the right verdict for
all 44 mathematical layers, consistent with the 424 prior accepted "not built" layers whose
targets are partial-only.

## 3. Re-searching the absent and partial claims

I re-searched every absent and partial target by concept, over `declarations.tsv` and with
`grep -rn -i` over both Lean trees, using Mathlib naming conventions, synonyms and the key words
of each statement. Nothing turned up that the audit missed. Zero hits for: Weil group and
Weil–Deligne representations, Artin and Swan conductors, Hasse–Arf, upper-numbering ramification,
Brauer–Nesbitt, semisimplification, tame and fundamental characters, quasi-unipotence, ℓ-adic
monodromy, Tate modules, the Weil pairing, `E[n] ≅ (ℤ/n)²`, the Hasse bound, Tate's algorithm,
Ogg's formula, Néron models, the Dickson classification, absolute irreducibility, modular curves,
Kuga–Sato varieties, the Eichler–Shimura relation, Deligne–Serre, Hilbert modular forms, Shimura
varieties and curves, Jacquet–Langlands, local Langlands, the Satake transform, trace formulas,
endoscopy, eigenvarieties, dagger spaces, rigid cohomology, nearby cycles, crystalline and
semistable comparison, de Rham representations, deformation rings, pseudorepresentations,
patching, completed cohomology, Iwasawa algebras of compact p-adic analytic groups, locally
analytic and admissible representations, automorphic representations, Hecke characters, smooth
representations, Serre weights, adequacy, Taylor–Wiles primes, level raising, tensor induction,
invariant lattices, Rosser–Schoenfeld estimates, and the named source theorems
(Langlands–Tunnell, Skinner–Wiles, Schoof, Fontaine, Kisin, Buzzard, Pan, Rohrlich–Tunnell,
Snowden).

Apparent hits that are not the concept, each checked in context: the 46 "Hodge–Tate" hits are the
Tate Hodge structure `ℚ(n)` in `TauCeti/Geometry/Hodge`, not p-adic Hodge–Tate weights; the 165
"Steinberg" hits are groups of Lie type and the `GL₂(F_q)` character table; "Ramanujan" is
`RamanujanFormula.lean` on derivatives of Eisenstein series; the 10 "Iwasawa" hits are
`MulAction.IwasawaStructure`; "Jacobian" is Jacobian coordinates and the measure-theoretic
Jacobian; the 242 "admissible" hits are admissible lattices, orders and absolute values; and
`Mathlib/RingTheory/PolynomialLaw/` is a single `Basic.lean` with no multiplicative laws or
determinants, exactly as the audit says.

Three specific claims were worth checking closely, and all three hold:

* **Chebotarev.** `TauCeti/NumberTheory/Chebotarev/` has 83 declarations — Frobenius prime sets,
  ramified primes, tagged fibres, von Mangoldt weights — and no density conclusion anywhere in
  the directory: no `HasDirichletDensity`, no `HasNaturalDensity`. Infrastructure, not the
  theorem, as the audit says.
* **Higher ramification.** `Mathlib/RingTheory/Valuation/RamificationGroup.lean` still carries
  "TODO: Define higher ramification groups in lower numbering", and Tau Ceti's groups are
  Stichtenoth 3.8.4 for a place of a function field. No upper numbering, no conductor.
* **Fredholm theory.** The 337 Fredholm declarations are operator index theory imported by the
  Heegaard Floer roadmap; `isFredholm_iff_finite_ker_coker` needs `IsRCLikeNormedField`. This is
  not Serre's theory of Fredholm determinants of completely continuous operators on p-adic Banach
  spaces, which is what `AG2.3` asks for. The audit's note already made exactly this distinction.

## 4. Duplicates

All 54 duplicates resolve to real atlas layers, and each claimed overlap is borne out by the
target layer's description. Five were added:

| layer | added duplicate | why |
| --- | --- | --- |
| `ArithmeticGaloisRepresentations:R01.3` | `tauceti:TauCetiRoadmap/EllipticCurves#layer-4` | owns Tate's algorithm, the Ogg exponent `v(Δ) − m + 1` and its identification with the ramification-theoretic conductor — T5's elliptic-curve conductor comparison |
| `ArithmeticGaloisRepresentations:R01.5` | `tauceti:TauCetiRoadmap/Chebotarev#layer-10` | owns `hasDirichletDensity_frobeniusPrimeSet` with value `#C/#G` over every number field — the Frobenius density this layer consumes |
| `AutomorphicGaloisRepresentations:R19.1` | `tauceti:TauCetiRoadmap/ModularForms#layer-8` | owns Eichler–Shimura via modular symbols, the integral Hecke algebra and the coefficient field as a number field — the same coefficient-field and integral-structure target by a different route |
| `AutomorphicGaloisRepresentations:R19.6` | `OrdinaryAutomorphicFormsAndModularityLifting:R21.3` | restates the target for the ordinary Hecke algebra, with the map from the ordinary deformation ring |
| `ClassicalSerreModularity:R33.4` | `SmallRamificationAndAbelianVarietyBaseCases:R25.4` | owns Schoof's semistable small-prime theorem, the prime-5 nonexistence theorem this layer applies |

Candidates examined and rejected: `GlobalGaloisDeformations:G7` and `R04.5` consume G7's adequacy
and enormous-image definitions and say so, rather than restating them;
`AutomorphicLFunctionsAndLocalFactors:AL.4` is unramified L-group factors, not bad-prime
compatibility; `PadicLocalLanglandsForGL2Qp:R30.6` says in terms that the occurrence of its local
results inside global completed cohomology is R31's separate theorem;
`CompletedCohomologyPartII:CC.6` is already listed, and under the right layer (R31.2).

## Most important finding

Nothing substantive was wrong. The one factual error was the claim that Mathlib's decomposition
and inertia subgroups exist only for finite Galois extensions — they are defined for an arbitrary
extension and an arbitrary valuation subring — and correcting it does not change the target's
`partial` status or the layer's verdict. The more useful outcome is the five added duplicates,
three of which point at Tau Ceti's own roadmaps: Chebotarev density, the elliptic-curve conductor
through Tate's algorithm, and the coefficient field of a newform through modular symbols are all
already owned elsewhere in the atlas.
