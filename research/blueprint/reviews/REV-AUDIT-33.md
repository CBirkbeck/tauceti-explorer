# REV-AUDIT-33 — review of AUDIT-33

**Verdict: accepted.** 1 regrade. 158 targets, 102 declaration citations and 93 duplicates checked.

Batch: `IntegralHeckeAndGaloisDeterminants`, `LocalGaloisDeformationRings`,
`ModularityAndLanglandsExtensions`, `OrdinaryAutomorphicFormsAndModularityLifting`,
`PadicLocalLanglandsForGL2Qp` — 33 layers, 158 targets, 102 declaration citations, 93 duplicates.
Baseline: tauceti `f790474`, mathlib `082e2d3`, matching the audit's `baseline` field and the
checkout at `workers/baseline`.

## What the audit claims

1 layer "partly built", 26 "not built" and **6 "process"** — the largest share of process layers in
any batch I have reviewed. Of 158 targets, 133 are absent, 24 partial and exactly **one** is present.
That picture survived review: Galois determinants and pseudorepresentations, local deformation rings,
the Breuil–Mézard machinery, Colmez's functor, Robba rings and (φ,Γ)-modules, and Hida families are
none of them in either library.

## 1. Every claim that something is in the libraries

**All 102 citations match `declarations.tsv` exactly on library, name, file and line.** All 61 cited
files (43 Mathlib, 18 Tau Ceti) exist and none contains a `sorry`.

The single present target is right: Mathlib's `PolynomialLaw` is Roby's functorial family
`S ⊗[R] M → S ⊗[R] N` with `toFun`/`isCompat` and composition, assuming only `CommSemiring R`, so it
is at least as general as IHG.0 asks. The partial notes are accurate about what is and is not there —
that `DividedPowerAlgebra` has `dp`, the weak universal property and functoriality but not the
grading `Γ^n` or the representability theorem; that `LinearMap.det` exists but the comparison
statement needs the determinant law that is absent; that Mathlib's `IsHeckeTriple` and Tau Ceti's
Hecke ring give an abstract Hecke ring but no action on a complex.

## 2. Layers marked "process"

This is where the batch needed the most scrutiny, since "process" excuses a layer from the
"not built" tally. **Five of the six are genuine**, and their stages say so themselves: `R08.6`
("Export each source local condition…"), `ML.0` ("Define a common register…"), `ML.4` ("Give
Arthur/Mok/KMSW classification inputs explicit proof-source owners"), `ML.5` ("Register cyclic base
change…") and `R21.6` ("Export the exact lifting statements…", plus a dependency check that is an
acyclicity audit of the roadmap's own graph). Every target of all five begins with *register*,
*export*, *assign*, *bind* or *a dependency check*, and the audit records that the material to be
exported is itself absent, so nothing is hidden behind the classification.

**One regrade: `PadicLocalLanglandsForGL2Qp:R30.1`, "process" → "not built".** Two of its three
targets are import obligations ("Import the analytic Robba/annulus coefficient rings", "Import étale
(φ,Γ)-modules…"), but the third is "Fix the GL₂(Q_p) covariance convention **and prove the
normalization bridge** with R16.3" — a theorem, not bookkeeping, and it is the only such target among
the six process layers. All three targets are absent, so "not built" is both accurate and the more
informative label: it keeps a real gap in the tally instead of filing it under interface work. I
added a sentence to that target's note recording why. With the change every verdict in the audit
follows its targets under a single rule.

## 3. Re-searching the absent and partial claims

I re-searched independently over `declarations.tsv` and both Lean trees. **Nothing turned up that the
audit missed.** Zero hits for pseudorepresentations, pseudocharacters, determinant laws,
Cayley–Hamilton reconstruction, deformation functors, framed deformations, Lubin–Tate theory,
Breuil–Mézard, Colmez or the Montréal functor, Robba rings, (φ,Γ)-modules, the Herr complex, ordinary
forms, Hida families and Λ-adic forms.

The non-zero hits are exactly the ones the audit cites: `polynomialLaw` (53) and `dividedPower` (383)
for IHG.0, and `amice` (12) for the Amice transform that its R30.1 note names as the nearest
available coefficient ring, correctly observing that the file lists the general-base and
bounded-power-series theory as TODO.

## 4. Duplicates

**All 93 duplicate edges resolve in `data/atlas.json`.** Of the 34 phrases the notes quote, 26 match
the cited stage verbatim and I checked the other eight by hand — they are bracketed inflections and
fragments, and each is accurate in substance: `DeformationAndDerivedPatchingAlgebra:P9` really is
titled "Amplitude, depth and component support"; `LocalGaloisDeformationRings:L7` really says
"separate the flag-bearing functor from its image after forgetting the flag"; and
`GL2AutomorphicRepresentationsAndTransfer:R16.3` really says "The p-adic Banach correspondence of R30
is different theory", which is the audit's reason for *not* treating R30 as duplicating it.

**No duplicate is missing.** The uncited roadmaps that score highest on this batch's vocabulary are
`tauceti:TauCetiRoadmap/ModularCurves` and `…/EllipticCurves`, but their hits are the ordinary English
words "determinant" (22) and "ordinary" (12) — determinants of matrices, ordinary reduction — not
Galois determinants or Hida ordinarity. I also checked `…/ModularForms#layer-8`, which owns "the
integral Hecke algebra": it is the classical modular-symbol lattice `𝕄 N k` for GL₂/ℚ, a finite
ℤ-module built to reach coefficient fields, with no perfect complex and no nilpotence bound, so it is
a different object from IHG.2's Hecke action on a bounded perfect complex. IHG.2's four recorded
duplicates (TC.2, R19.6, P7, P9) name the owners that do overlap, including R19.6 for the
nilpotent-ideal phenomenon in the completed Hecke algebra.

## Checks

- 102 citations × (library, name, file, line): all match the pinned index.
- 61 cited files: all present, none with a `sorry`.
- 33 layer ids and 93 duplicate layer ids: all resolve in `data/atlas.json`.
- After the regrade, every verdict follows its targets under one rule.
- Lean: none.
