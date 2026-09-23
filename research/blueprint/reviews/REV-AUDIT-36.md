# REV-AUDIT-36 — review of AUDIT-36

**Verdict: accepted.** 1 correction. 233 targets, 293 declaration citations and 172 duplicates
checked.

Batch: `CrystallineCohomology`, `DerivedDeRhamCohomology`, `DiamondsAndVStacks`,
`DiamondEtaleCohomology`, `DiamondSixOperations` — 42 layers, 233 targets, 293 declaration
citations, 172 duplicates. Baseline: tauceti `f790474`, mathlib `082e2d3`, matching the audit's
`baseline` field and the checkout at `workers/baseline`.

## What the audit claims

3 layers "partly built", 38 "not built", 1 "process". Of 233 targets, **195 are absent and 27
partial**; only 11 are claimed present, all but one in Mathlib. That picture survived review, and it
is the right one: crystalline cohomology, the de Rham–Witt complex, log structures, derived de Rham
cohomology, perfectoid spaces, diamonds, v-stacks and the six operations are simply not in either
library at the pinned commits.

## 1. Every claim that something is in the libraries

**287 of 293 citations match `declarations.tsv` exactly on library, name, file and line.** All 137
cited files (119 Mathlib, 18 Tau Ceti) exist and none contains a `sorry`.

**The remaining 6 are correct too, and the audit already explains why they cannot be looked up.**
They are `IsAffineMonoid` and `IsAffineAddMonoid`, cited three times each. Both are declared
`class abbrev` in `Mathlib/Algebra/AffineMonoid/Basic.lean`, at lines 25 and 20 — exactly the lines
cited — and the index extractor records a `class abbrev` under the literal token `abbrev` instead of
its name. The audit's own CR.5 note says so ("`class abbrev`, so declarations.tsv records it only as
`abbrev`; read Basic.lean lines 20 and 25"), which is how I found it. **For the orchestrator:** this
is a defect in `declarations.tsv`, not in the audit, and it is narrow — exactly 2 rows in 316,810
carry the name `abbrev`, both from that one file, and no other Lean construct is mis-parsed. Any
name-based checker will flag these six citations; they should not be "fixed".

I read the source of all 11 present claims and they are accurate: Mathlib's `DividedPowers`
structure with the full axiom list, `IsDPMorphism`/`DPMorphism` with the `on_span` reduction,
`RatAlgebra.dividedPowers` with its uniqueness, `PadicInt.dividedPowers` (with `[Fact p.Prime]`
only, so `p = 2` is covered), `IsSubDPIdeal` and the PD quotient, `WittVector.fontaineTheta` with
`surjective_fontaineTheta`, `Algebra.Extension.exact_cotangentComplex_toKaehler`,
`H1Cotangent.isLocalizedModule`, `SpectralSpace` with the constructible topology, `Profinite`/
`Stonean` with `CompHaus.presentation`, and sheafification with its left exactness. Each note is
precise about the hypotheses — that θ needs `[IsAdicComplete (span {p}) R]`, that
`OfInvertibleFactorial.dividedPowers` is strictly more general than the ℚ-algebra case.

**One correction, made in place.** `CrystallineCohomology:CR.7`'s p-divisible-group target said "The
cited file/line is nominal — see TauCeti/AlgebraicGeometry/AffineGroupScheme/CartierDuality/ for the
actual declarations". The citation is not nominal: `FiniteLocallyFreeCommAffineGroupSchemeCat.
cartierDuality` really is at `…/CartierDuality/FiniteLocallyFree.lean:232`, which is inside the very
directory the note redirects to. The note now says the citation is exact and stands for the
Cartier-duality directory beside it. (The other "nominal" remark, on CR.3's `frobenius`, is correct
as written: that declaration is in the CharP files, and the note says only that it is not in a
crystalline context. Its `fit` is already `related`.)

## 2. Layers marked "built" or "process"

No layer is "built". The one "process" layer, `CrystallineCohomology:CR.7`, is an export/interface
task — PD bases, crystals, connections and Frobenius to R07's Dieudonné theory — and the audit
correctly records that its four targets are absent anyway, so nothing is hidden behind the
classification. It matches the interface-and-export pattern of the process layers in previously
accepted audits.

The three "partly built" layers (CR.0, DD.0, D0) each have present targets, so the grading follows
the same rule as the rest of the batch.

## 3. Re-searching the absent and partial claims

I re-searched independently over `declarations.tsv` and both Lean trees. **Nothing turned up that
the audit missed.** Zero hits for: `crystallineSite`, `crystalline`, PD/divided-power envelopes,
`deRhamWitt`, Witt differentials, log structures, log smoothness, `prismatic`, δ-rings, prisms,
v-stacks, v-sheaves, spatial diamonds, the six operations, `j_!`, `f^!`, cohomological smoothness
and biduality.

The near-misses are all as the audit describes them, and it names each one:

* **Perfectoid material in Mathlib is ring-theoretic only** — `Mathlib/RingTheory/Perfectoid/`
  contains `PreTilt`, `untilt`, `fontaineTheta` and `BDeRham`, and the audit cites exactly those,
  while recording that there is no perfectoid *ring class*, no perfectoid space, and no tilting
  *equivalence*.
* **`diamond` in the index is Tau Ceti's diamond operator** on modular-curve Hecke cosets, as the D4
  note says.
* **Mathlib's pro-étale topology is on schemes** (`AlgebraicGeometry/Sites/Proetale.lean`), which the
  D2 note states explicitly, along with the absence of any v-topology.
* Tau Ceti's `Spa(A,A⁺)`, its rational subsets, structure presheaf and the faithful flatness of
  rational localizations are cited where they are the nearest thing, with the note saying each time
  what the perfectoid statement would add.
* The generic carriers — `MorphismProperty`, `IsStackFor`/`IsPrestackFor`, `Precoherent`,
  `GrothendieckTopology`, `Profinite` — are cited as `related` with a sentence saying they have
  nothing to be applied to. That is the right treatment.

## 4. Duplicates

**All 172 duplicate edges resolve in `data/atlas.json`, and all 172 are distinct.** They are
concentrated where they should be: 27 against DiamondEtaleCohomology, 18 against
CrystallineCohomology, 17 against DiamondsAndVStacks, 15 against DiamondSixOperations, 13 against
PrismaticCohomology.

I tested the notes the hard way. Many of them quote the counterpart roadmap; **I checked all 45
quoted phrases against the cited stage's description and every one is there** — including
PadicHodgeTheory R06.1's "generic PD envelopes from CrystallineCohomology CR.0", HabiroRings HR.2's
"generic derived completion from DerivedDeRhamCohomology DD.1", PerfectoidSpaces P6's "instantiates
the κ-small perfectoid-space definitions", and DiamondSixOperations S0's three predicates
"compactifiable, representable in locally spatial diamonds, locally finite `dim.trg`".

**No duplicate is missing.** Four roadmaps plan this mathematics heavily and are absent from the
list — `FarguesFontaineDiamonds`, `RelativeFarguesFontaine`, `PerfectoidShimuraVarieties`,
`AdicSpacesPartII` — and I checked each: they are declared **consumers**, not rival owners.
`FarguesFontaineDiamonds:F0` and `F3` both carry `DiamondsAndVStacks:D6` in their `requires`, and the
atlas already records F0, F3, `PerfectoidShimuraVarieties:S0` and
`RelativeFarguesFontaine:RF2:integral-divisors` among D6's `consumers`. Protocol 15 calls these
deliberate handoffs, and the audit's D6 list correctly names only the layers that *share* ownership
(AdicEtaleGeometry A4, which itself says the Spd sheaf "is owned by D6" while keeping the uniform
completion; PerfectoidSpaces P1; Tau Ceti's own AdicSpaces layer 5; and D5).

## Checks

- 293 citations × (library, name, file, line): 287 match the index; the other 6 verified directly in
  the Mathlib source at the pinned commit (`class abbrev`, invisible to the index).
- 137 cited files: all present, none with a `sorry`.
- 42 layer ids and 172 duplicate layer ids: all resolve in `data/atlas.json`.
- 45 quoted phrases in duplicate notes: all verified against the cited stage descriptions.
- Lean: none.
