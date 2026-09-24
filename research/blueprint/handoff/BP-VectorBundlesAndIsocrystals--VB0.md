# Handoff — BP-VectorBundlesAndIsocrystals--VB0 (issue #1002)

Agent: Claude Code, session `cc-7b31c4`. Branch `cc-7b31c4-bp-vb0`.

## Deliverables

- `research/blueprint/packets/VectorBundlesAndIsocrystals--VB0.json` — 13 nodes
  (1 definition, 1 construction, 8 theorems, 2 lemmas, 1 comparison), 15 API
  items, 9 unit tests, 10 planets, 30 baseline declarations, 9 gaps, 10 requests,
  2 structural proposals. `"part": "VB0"`, `"status": "partial"`.
- `research/blueprint/readmes/VectorBundlesAndIsocrystals--VB0.md` — 927 lines.
- `research/blueprint/suggested/VectorBundlesAndIsocrystals--VB0.lean` — 385 lines.
- This note.

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/VectorBundlesAndIsocrystals--VB0.json --index $TAUCETI_BASELINE/declarations.tsv`
  → **0 errors, 0 warnings**, with the pinned declaration index in place.
- `python3 -m unittest discover -s tests` → 268 tests, OK.
- `python3 research/blueprint/intake.py check-files` on the four changed paths →
  0 problems.

**The Lean file was not compiled.** No Lean was run; the Mathlib build here is a
shared cache that must not be rebuilt. Every `implementationStatus` is
`unchecked`.

## Scope

First part of the roadmap: `VB0`, `VB1` and `VB2` with its two substages — five
stages, and the 13 of the decomposition's 23 nodes whose `parentStageId` lies in
them. `VB3` and `VB4` belong to `BP-VectorBundlesAndIsocrystals--VB3` (issue
#1003). This roadmap is not a member of any restructured family.

## One source hash does not reproduce, and the reason is traced

`FS-geometrization` and `SW13-moduli` reproduce their recorded SHA-256 **byte for
byte**. `FF18-courbes` does not: the file at the recorded URL now hashes to
`8c020573d3dce341088ea7e83fe1063b410686c08e3a144fa3c0de634667cc79` against a
recorded `cc159f38a3801c736b71ecea363496abe7706550bfb416600718ee9933922ca3`. The
author's page carries a living version of the book.

Rather than leave that as a bare failure the current file was extracted — object
streams inflated, text operators read — and checked against the locators:

- **Every cited statement number is present and unchanged:** Définition 5.5.1,
  Théorème 5.5.4, Définition 5.5.5, Proposition 5.5.6, §8.2.3 *Lien avec les
  isocristaux*, Définition 8.2.5, Proposition 8.2.6, Définition 8.2.7,
  Proposition 8.2.8, Remarque 8.2.9, Théorème 8.2.10.
- **Every printed page number is uniformly 50 lower:** §5.5 begins on printed
  p. 162 against a recorded 212–215; Définition 8.2.5 is on p. 236 against 286;
  Théorème 8.2.10 on p. 238 against 288. The file has 404 PDF pages against a
  recorded 400.

Fifty is exactly the length of Colmez's preface, which the record's own `edition`
field puts at printed pp. 1–50: the version the decomposition read paginates
preface and main text continuously, and the current file restarts the main text
at 1. So the mathematical half of every Fargues–Fontaine locator is corroborated
here and the page half is not; a reader of the current file should subtract 50. A
maintainer may prefer to hash a fixed edition — the text is Astérisque 406 — or
to cite by statement number, which is the portable half.

## The library finding

`data/library-coverage.json` has no reviewed audit entry for this roadmap, so the
pinned index was searched directly and
`Mathlib/RingTheory/WittVector/Isocrystal.lean` was read at `082e2d3`.

**Mathlib already has isocrystals.** `WittVector.Isocrystal` — a vector space over
`K(p,k) = W(k)[1/p]` with a bijective Frobenius-semilinear map — is exactly
`φ-Mod_L` for `E = Q_p`, together with `IsocrystalHom`, `IsocrystalEquiv`,
`StandardOneDimIsocrystal m`, and **`isocrystal_classification`**: over an
algebraically closed field of characteristic `p`, a one-dimensional isocrystal is
isomorphic to a standard one. That is the rank-one case of Dieudonné–Manin,
proved in Lean, at the pin — and it should be read against the decomposition's
own first gap, which records that Dieudonné–Manin is quoted and never proved in
anything read. Also present: `FractionRing.frobenius` and `frobeniusRingHom`
(Frobenius as an *automorphism* for `k` perfect), `IsPrincipalIdealRing`,
`IsDedekindDomain`, `ValuationRing`, `AlgebraicGeometry.Scheme`,
`AlgebraicGeometry.IsProper`, `IsAlgClosed`, `PerfectRing`, `IsFractionRing`, and
Tau Ceti's `AlgebraicGeometry.InvertibleSheaf`, `Huber.Pair` and
`ValuationSpectrum.spa`.

So VB0 plans only what is missing: the general-`E` version over
`L_E = W_{O_E}(F̄_q)[1/π]` with `σ_E`, the higher-rank blocks
`φ^h = π^{-d}σ^h`, Dieudonné–Manin in all dimensions, and the functor to bundles.

**Absent at both pins:** `HarderNarasimhan`, `Semistable`, `SemiStable`,
`PicardGroup`, and any ampleness. The slope formalism of VB1 is entirely new.

## What remains

No layer is closed. The decomposition's six gaps are carried forward and three
added. In rough order of how much they block:

1. **Dieudonné–Manin is quoted, never proved** in anything read. The rank-one case
   is pinned; the general case is the missing half.
2. **Kedlaya–Liu is in the reference library and unread**, while FS II.2.6 and
   II.2.7 are respectively a proof and an axiomatisation of its 6.2.4 and 6.3.9,
   and three theorems are attributed to it.
3. **The Brauer invariant of `D_λ`** is an explicit obligation of the stage text
   and is not in anything read; only the cyclic presentation and the dimension
   count are.
4. **The HN sign and dominance convention is not pinned across the sources**, and
   a filtration indexed the other way reverses every later statement.
5. **Two supplier edges the atlas does not have.** Theorem II.2.5 asserts that the
   Banach–Colmez spaces are relatively representable in *locally spatial
   diamonds* and *cohomologically smooth*, so VB1 consumes
   `DiamondsAndVStacks:D5` and `DiamondSixOperations:S4`; the atlas links the
   second only into `VB3:general-BC` and the first not at all. Also
   `UPSTREAM:LocalFieldsRamification` appears as a supplier of VB0 in the stage
   edges but is not a stage of `data/atlas.json`, so it cannot be named in a
   request.

## Structural proposals

1. **Three atlas edges inside this roadmap run against the source's proof order.**
   The decomposition's link graph runs `VB2:ampleness/schematic-curve… →
   VB1/degree-rank-slope…`, `VB2:classification/classical-points… →
   VB2:ampleness/schematic-curve…`, and both `VB3:positive-basic-examples` nodes
   into `VB1`/`VB2:ampleness`; the atlas has all three the other way. The
   mathematics is not in doubt — the degree function needs `Pic(X_C) = ℤ` and
   saturation, which the schematic model supplies; the PID structure of affinoids
   is what makes `X_C^alg` regular of dimension one; and the fundamental exact
   sequence is an input to the cohomology of the twists. Since these are edges
   between substages of one roadmap, the wrong direction also makes the roadmap
   look internally circular.
2. **Narrow VB0's text to what the pinned library does not already contain**, and
   cite `WittVector.Isocrystal`, `StandardOneDimIsocrystal` and
   `isocrystal_classification` for the rest.

## Where to resume

The packet is complete against the decomposition for this part. The next real
work is source reading: Kedlaya–Liu 6.2.4 and 6.3.9 first, since two nodes are
written against them; then a source that proves Dieudonné–Manin in general; then
the Brauer invariant. The other part of this roadmap, issue #1003, is independent
of all of that and can be taken in parallel — but note that its
`VB3:positive-basic-examples` nodes are inputs to this part, not consequences,
which is the first structural proposal.
