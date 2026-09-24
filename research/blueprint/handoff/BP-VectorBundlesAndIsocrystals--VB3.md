# Handoff — BP-VectorBundlesAndIsocrystals--VB3 (issue #1003)

Agent: Claude Code, session `cc-7b31c4`. Branch `cc-7b31c4-bp-vb3`.

## Deliverables

- `research/blueprint/packets/VectorBundlesAndIsocrystals--VB3.json` — 11 nodes
  (1 definition, 7 theorems, 2 lemmas, 1 comparison), 7 API items, 5 unit tests,
  8 planets, 19 baseline declarations, 8 gaps, 10 requests, 2 structural
  proposals. `"part": "VB3"`, `"status": "partial"`.
- `research/blueprint/readmes/VectorBundlesAndIsocrystals--VB3.md` — 746 lines.
- `research/blueprint/suggested/VectorBundlesAndIsocrystals--VB3.lean` — 305 lines.
- This note.

## Checks run

- `python3 scripts/check_blueprint.py research/blueprint/packets/VectorBundlesAndIsocrystals--VB3.json --index $TAUCETI_BASELINE/declarations.tsv`
  → **0 errors, 0 warnings**.
- `python3 -m unittest discover -s tests` → 268 tests, OK.
- `python3 research/blueprint/intake.py check-files` → 0 problems.

**The Lean file was not compiled.** No Lean was run; the Mathlib build here is a
shared cache that must not be rebuilt. Every `implementationStatus` is
`unchecked`.

## Scope

Second part of the roadmap: `VB3` with its three substages, and `VB4` — five
stages, and the 10 of the decomposition's 23 nodes whose `parentStageId` lies in
them. `VB0`, `VB1` and `VB2` belong to `BP-VectorBundlesAndIsocrystals--VB0`
(issue #1002, PR #2851). This roadmap is not in a restructured family.

## The one node that is not inherited

The reviewed decomposition has **no definition node in this scope**. The
Banach–Colmez space, which all ten of its theorems are about, appears only inside
their statements — and the VB3 stage text says in terms to *"Construct the sheaf
of sections `T ↦ H⁰(X_T,ℰ_T)`"*, while PROTOCOL §0 requires that no definition of
the sources be left out. So one node was added,
`VB3:positive-basic-examples/banach-colmez-space-definition`, with an API outline
and five unit tests.

**Its three locators were read directly from `Geometrization.pdf` in this
session**, from a file whose SHA-256 reproduces the recorded value byte for byte,
by inflating the PDF's object streams and reading its text operators; the printed
pages were confirmed from the running heads:

- **Definition I.3.5, printed p. 19** — `BC(ℰ)(T) = H⁰(X_T, ℰ|_{X_T})`, and the
  negative form `BC(ℰ[1])(T) = H¹(X_T, ℰ|_{X_T})` under the hypothesis that `ℰ`
  is everywhere of only negative Harder–Narasimhan slopes.
- **The sentence after it, printed p. 19** — *"Implicit here is that this functor
  actually defines a locally spatial diamond. For this, we calculate some key
  examples of Banach–Colmez spaces."* So representability is a theorem of this
  layer, not part of the definition; the node's API and unit tests say so.
- **After Proposition II.2.1, printed p. 58** — the two-term form
  `BC([ℰ_1 → ℰ_0]) : T ↦ H⁰(X_T, [ℰ_1 → ℰ_0]|_{X_T})`, for a complex in
  homological degrees `[0,1]` with `H⁰(X_T, ℰ_1|_{X_T}) = 0` for **all**
  `T ∈ Perf_S`, with the source's own note that they will usually apply it only
  when one of `ℰ_1`, `ℰ_0` is zero.

A reviewer should check those three first: they are the only content of this
packet not inherited from the independent review of the decomposition.

## Source verification

`FS-geometrization` and `SW13-moduli` reproduce their recorded SHA-256 **byte for
byte**. `FF18-courbes` does not — the author's page carries a living version of
the book — and the companion packet records the full diagnosis: every cited
statement number is present and unchanged, and every printed page number is
uniformly 50 lower, exactly the length of Colmez's preface. **No node of this
part cites Fargues–Fontaine**, so nothing here depends on that.

## The library finding

`data/library-coverage.json` has no reviewed audit entry, so the pinned index was
searched directly. **One node has a real carrier.** The contracting-action lemma
(II.2.17) is pure general topology — a taut locally spectral space whose
generalizations form chains under specialization, with a contracting automorphism
— and Mathlib has `SpectralSpace`, `PrespectralSpace`, `QuasiSober`,
`Specializes`, `CompactSpace` and `TotallyDisconnectedSpace`, while Tau Ceti has
`TauCeti.ValuationSpectrum.spectralSpace_spa_of_pairOfDefinition`. That lemma
could be stated and proved against the pins alone once tautness and the chain
condition are added. Also cited: `WittVector` and `WittVector.Isocrystal`.

**Absent at both pins**, as in the other part: Harder–Narasimhan filtrations,
semistability, slopes, ampleness, and every diamond, perfectoid space and
v-sheaf.

## What remains

No layer is closed. The decomposition's six gaps are carried and two added. In
rough order of how much they block:

1. **The step Fargues–Scholze compress**, from [SW13, Theorem A] to the explicit
   `B^{φ=π}` identification: how full faithfulness of the crystalline period
   morphism gives the universal-cover statement was not resolved, and the
   renormalisation of covariant Dieudonné theory for `π`-divisible
   `O_E`-modules was read only as an assertion.
2. **Kedlaya–Liu 7.3.6–7.3.7, 7.4.5, 7.4.9 and 8.5.12 are unread**, and FS
   II.2.19 and II.2.20 — the whole of VB4 — are restatements or extensions of
   them.
3. **ECD Propositions 11.19, 11.24, 18.10 and Lemmas 10.13, 12.11** are quoted
   inside the properness and splitting proofs and were not read.
4. **The dominance convention for the HN polygon** is fixed in FS only through
   the convex-hull description; the comparison with Fargues–Fontaine's concave
   convention was not made, and a polygon read the other way makes semicontinuity
   point the wrong way.
5. A locator note the decomposition raises: the stage text says to use *"II.2.15's
   endomorphism analysis"*, but in the version read II.2.15 is the key extension
   lemma. The stage text may be citing a different numbering.

## Structural proposals

1. **`VB3:positive-basic-examples` supplies `VB1` and `VB2:ampleness`, not the
   other way round.** The decomposition's link graph runs
   `lubin-tate-universal-cover → VB1/cohomology-of-twists` and
   `fundamental-exact-sequence → VB2:ampleness/schematic-curve…`; the atlas has
   both reversed. The stage text agrees with the decomposition: *"Use FS II.2.1's
   Lubin–Tate calculation … as the positive/basic input to VB2:classification"*
   and *"Do not use classification to prove its own positive-section input."* The
   whole design of this substage is that it is an independent local calculation,
   and an edge in the other direction asserts the circularity the stage exists to
   forbid. The companion packet records the two further reversed edges inside VB1
   and VB2.
2. **The contracting-action lemma is general topology and should be separated.**
   Nothing in Lemma II.2.17 mentions the curve, a bundle or a perfectoid space.
   It is reusable by anything that quotients a spectral space by a contracting
   automorphism, and the pins already carry almost all its vocabulary. PROTOCOL
   §15 says a general missing notion should be planned once, in the roadmap that
   owns it; as it stands it is buried in a layer about Banach–Colmez spaces,
   where nothing else will find it.

## Where to resume

The packet is complete against the decomposition for this part, plus the added
definition. The next real work is source reading: Kedlaya–Liu §7 first, since the
whole of VB4 is written against it; then the SW13 compression, which is the one
place where the Lubin–Tate identification rests on an argument nobody has
followed end to end.
