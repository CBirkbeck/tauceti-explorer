# Handoff — BP-RelativeFarguesFontaine--RF0 (issue #985)

Agent: Claude Code, session `cc-7b31c4`. Branch `cc-7b31c4-bp-rf0`.

## Deliverables

- `research/blueprint/packets/RelativeFarguesFontaine--RF0.json` — 20 nodes
  (2 definitions, 6 constructions, 7 theorems, 2 lemmas, 3 comparisons),
  **41 API items, 31 unit tests**, 15 planets, 29 baseline declarations, 8 gaps,
  21 requests, 2 structural proposals. `"part": "RF0"`, `"status": "partial"`.
- `research/blueprint/readmes/RelativeFarguesFontaine--RF0.md` — 1341 lines.
- `research/blueprint/suggested/RelativeFarguesFontaine--RF0.lean` — 416 lines.
- This note.

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/RelativeFarguesFontaine--RF0.json --index $TAUCETI_BASELINE/declarations.tsv`
  → **0 errors, 0 warnings**.
- `python3 -m unittest discover -s tests` → 268 tests, OK.
- `python3 research/blueprint/intake.py check-files` → 0 problems.

**The Lean file was not compiled.** No Lean was run; the Mathlib build here is a
shared cache that must not be rebuilt. Every `implementationStatus` is
`unchecked`.

## Scope

First part of the roadmap: `RF0` with its two substages, `RF1`, `RF2` with its
two substages, and `RF3` — eight stages, and the 20 of the decomposition's 24
nodes whose `parentStageId` lies in them. `RF4` belongs to
`BP-RelativeFarguesFontaine--RF4` (issue #986). Not in a restructured family.

Every one of the eight definitions and constructions has an API outline and unit
tests, which is why this packet has 41 API items and 31 tests against 20 nodes.

## Source verification

**All four sources reproduce their recorded SHA-256 byte for byte**, downloaded
again in this session:

| source | SHA-256 |
| --- | --- |
| `FS-geometrization` | `9ab9efbd0df251bf…` |
| `SW20-berkeley` | `225505171ef809aa…` |
| `BMS18-integral` (arXiv:1602.03148) | `285f7d2088607688…` |
| `GR02-almost` (arXiv:math/0201175) | `c4ab39ad5cd3f95f…` |

No locator in this packet rests on a file that has changed. (Note for whoever
compares with the `CohomologyComparisons` packet: there the BMS record was of a
supplied text extraction and did not reproduce; here the record is of the arXiv
PDF and does.)

## The library finding — this roadmap reaches the pins further than its siblings

`data/library-coverage.json` has no reviewed audit entry, so the pinned index was
searched directly. The result is unusually good:

- **`mathlib:WittVector.teichmuller`** is *exactly* the unique multiplicative
  section `[·]` that the first node asserts, and it is the `[ϖ]` appearing in the
  definition of `𝒴_S` and in the radius function.
- **`mathlib:WittVector.fontaineTheta`** is the `θ` whose kernel the primitive
  degree-one ideals are and whose generators cut out the divisor of a leg tuple.
- **`mathlib:IsDiscreteValuationRing`** is what `B^+_dR` *is* at a geometric
  untilt — the fact the Cartan decomposition of `GeometricSatakeAndFusion` rests
  on.
- **`mathlib:AlgebraicGeometry.LocallyRingedSpace`** is the exact level at which
  `X_S → X_S^alg` is asserted: not schemes, not adic spaces.
- Plus `WittVector`, `WittVector.frobenius`, `PreTilt`, `PreTilt.untilt`,
  `Perfection`, `PerfectRing`, `IsAdicComplete`, `AdicCompletion`, `Valuation`,
  `SpectralSpace`, `IsLocalization`, `Ideal.span`, `GradedAlgebra`,
  `ProjectiveSpectrum`, `AlgebraicGeometry.Scheme`, `WittVector.Isocrystal`, and
  Tau Ceti's `Huber.Pair`, `ValuationSpectrum.spa` and `InvertibleSheaf`.

**Absent at both pins:** the adic-space and perfectoid layer itself. A search
found no declaration whose name contains `Perfectoid`, and no diamond. Those are
exactly the twenty-one requests, so the boundary between what is pinned and what
is planned is clean.

## Two things the packet is careful about

1. **`V(π)` is retained.** `𝒴_S` is over `O_E` and is not base-changed to `E`.
   That is what `GeometricSatakeAndFusion` depends on — its Remark VI.2.1 says
   the divisor `π = 0` is included and `B^+_dR(C^♯) = W_{O_E}(C)` there, which is
   the characteristic-`p` fibre carrying the Witt vector affine Grassmannian.
2. **The map `X_S → X_S^alg` is formal.** It is constructed with *no* ampleness
   hypothesis; only the GAGA equivalence needs one, and that is
   `VectorBundlesAndIsocrystals:VB2:ampleness`. Keeping them apart is what stops
   the two roadmaps from being circular, and the packet's nodes and unit tests
   say so.

## What remains

No layer is closed. The decomposition's seven gaps are carried forward and one
added. In rough order of how much they block:

1. **Ramified Witt vector foundations are assumed, not decomposed.** The first
   node states a universal property without a source that proves it; Mathlib has
   the unramified theory in full and nothing for the base change to `O_E`. This
   is the second structural proposal.
2. **Fargues' [Far20b] is absent from the supplied library**, and is cited for
   the Lubin–Tate relation.
3. **[GR03, Proposition 5.4.21] could not be matched** in the locally available
   Gabber–Ramero copy — whose hash *does* reproduce, and whose `edition` field
   already records that it is the arXiv v3 and not the Springer LNM pagination
   Fargues–Scholze cite.
4. **Sousperfectoid machinery is quoted but unread**, although the Stein
   exhaustion is stated for sousperfectoid annuli.
5. **`F4` supplies the fixed-field `Q_p` estimate only**; the ramified relative
   assembly of FS II.1.4 has no supplier. A request is filed against it.
6. **Classical points of `Y_C` and `X_C` are not covered by any RF stage text**,
   although `VectorBundlesAndIsocrystals:VB2:classification` plans them.

## Structural proposals

1. **Two atlas edges inside this roadmap run against the source's proof order:**
   `RF0 → RF0:integral-Y` and `RF2:untilts → RF2:integral-divisors`. The
   decomposition's link graph runs both the other way, and the mathematics is not
   in doubt — `𝒴_S` is `Spa` of the ramified Witt ring minus a locus, so the Witt
   construction is its input; and the divisor of a leg tuple is a product of
   generators of `ker(θ_i)`, each an untilt presented as a closed Cartier divisor
   by the norm estimate. **This is the third roadmap in this family where this
   session found the same pattern** — the others are recorded in
   `VectorBundlesAndIsocrystals--VB0` and `GeometricSatakeAndFusion--GS0`. Since
   these are edges between substages of one roadmap, a wrong direction makes the
   roadmap look internally circular.
2. **The ramified Witt foundations need an owner.** The base change
   `W(R) ⊗̂_{W(F_q)} O_E` is not special to this roadmap: it is the coefficient
   ring of the whole family, it is what makes the equal-characteristic case
   `R[[π]]`, and `GeometricSatakeAndFusion`'s integral divisor space and
   `VectorBundlesAndIsocrystals`' isocrystals both rest on it. PROTOCOL §15 says
   a general missing notion is planned once, in the roadmap that owns it. Either
   `RF0` should own it explicitly as a sub-layer with its own source route —
   Fargues–Fontaine chapter 1 is the obvious candidate and is in the reference
   library — or it should be a layer of whichever roadmap owns Witt vectors.

## Where to resume

The packet is complete against the decomposition for this part. The next real
work is source reading: Fargues–Fontaine chapter 1 for the ramified Witt
foundations, which is the one place where a written node has no proof source;
then the sousperfectoid material behind the Stein exhaustion; then [Far20b], if
it can be obtained. `RF4` (issue #986) is independent and can be taken in
parallel.
