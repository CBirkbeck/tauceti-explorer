# RT-AREA-representations-3 — red team of Representation theory, part 3 of 3

**One finding, medium: two roadmaps disclaim the weight-lattice apparatus in opposite directions using the same words, which is the most plausible root cause of the already-confirmed finding RT-AREA-representations-1/1. The other three heads are clean.**

Red team: Claude Code, session `cc-fb70e5`, 24 September 2026. Target: part 3 of the Representation theory area — five roadmaps, **46 stages**:

| roadmap | stages | declared prerequisites |
|---|---|---|
| `…/CompactGroups` | 7 | OrthogonalL2Bases, LieGroups |
| `…/LieGroups` | 10 | — |
| `…/LieHighestWeight` | 10 | LieGroups, RootSystems |
| `…/SpinRepresentations` | 10 | ClassicalGroups, LieHighestWeight, RootSystems |
| `tauceti:TauCetiRoadmap/ZigzagPreprojective` | 9 | — |

**Eligibility, measured:** none of the 43 papers this session has reviewed routes to any of these five. This job completes the area's trio — I verified part 1's red team and wrote part 2's — which is the cross-part reading §17 asks each part to do, and is what produced the finding.

## First, does part 1's fix point somewhere real?

RT-AREA-representations-1/1 asked `ClassicalGroups` to cite `LieHighestWeight` for the abstract Weyl dimension formula. LieHighestWeight is in *this* part, so the fix is checkable here. **It is sound**: Layer 6 is "the Weyl character, dimension, and Kostant formulas", and the text states the formula outright — "**The Weyl dimension formula.** Specializing at the trivial character, `dim L(λ) = ∏_{α>0} ⟨λ+ρ, α^∨⟩ / ⟨ρ, α^∨⟩`".

## The finding — and how it was graded, twice

It first looked like a **high-severity ownership gap**, in which nothing builds the weight lattice at all:

- **RootSystems** (lines 45–51): "The weight and root lattices, the coweight and coroot lattices, the fundamental weights, dominant integral weights, and `ρ` — the lattice apparatus that the Weyl character and dimension formulas run on — are **not** built here; they belong to [the highest-weight roadmap]".
- **LieHighestWeight** (lines 165–167): "The **root/weight lattices, fundamental weights, `ρ`, the dominance API, and the Weyl action on the weight lattice** are **not** in Mathlib as such; they are the province of `../RootSystems/README.md`, and we consume them from there." Line 202 repeats it.

The same list of objects, assigned each way — and LieHighestWeight closes the escape that both defer to the library ("**not** in Mathlib as such").

**Reading one level further changed the verdict.** LieHighestWeight lines 114–119: "The **integral weight lattice** `X` is therefore a `ℤ`-submodule of `Module.Dual K H`, **not** a `K`-subspace; **a named milestone constructs it as such**, proves the roots lie in it, **exhibits `ρ` (the half-sum of positive roots) as an element of it**, and shows the coroot pairings land in `ℤ`. The `ℤ`-module structure of `X` and the Weyl action on it are **shared with** `../RootSystems/README.md`; we **reuse the abstract lattice and do not rebuild it**."

So LieHighestWeight *does* build the concrete apparatus while reusing the abstract lattice. **Nothing is unowned; the two notes disclaim different things under one name.** The finding is therefore a terminological collision, not a gap — and it drops from high to medium.

**Why medium rather than low.** The consequence is documented, not hypothetical: this collision is the most plausible cause of RT-AREA-representations-1/1, where ClassicalGroups cited RootSystems for the Weyl dimension and character formulas — exactly the apparatus RootSystems' boundary sends away. Fixing only ClassicalGroups' citation leaves the trap in place for the next roadmap that reads either note.

**Fix:** make each note say which sense it means, leaving the division of labour alone, since the division is sound. RootSystems should say the concrete apparatus (fundamental weights, dominant integral weights, ρ as an element of `X`, the dominance API) is built in LieHighestWeight while the abstract lattice and Weyl action are supplied here; LieHighestWeight should replace "are the province of `../RootSystems/README.md`, and we consume them from there" with something matching its own lines 114–119. Cross-reference the two.

## Attack 2 — the library boundary. Clean, and unusually well documented.

This head produced the model-theory area's sharpest finding and nothing in part 2. Here both roadmaps that make **checkable** claims about Mathlib are right:

- **SpinRepresentations**: "Mathlib has a substantial Clifford-algebra library and, unusually, **already has the Pin and Spin groups**", naming `pinGroup`, `spinGroup`, `orthogonalGroup`, `specialOrthogonalGroup`, `equivExterior`. All five exist — `pinGroup` and `spinGroup` in `Mathlib/LinearAlgebra/CliffordAlgebra/SpinGroup.lean`, the orthogonal groups in `LinearAlgebra/UnitaryGroup.lean`, `equivExterior` in `CliffordAlgebra/Inversion.lean`.
- **CompactGroups** makes a **reproducible negative** claim: "What Mathlib does **not** have is the theory that connects them: the **Peter–Weyl theorem** itself (a search for `PeterWeyl`/`matrixCoeff` in Mathlib returns nothing)". Both searches return **zero files**. So Peter–Weyl is correctly planned rather than duplicated.

No layer in the part plans what the library already has.

## Attack 3 — duplication. Clean.

- **ZigzagPreprojective against QuiverRepresentations** (part 2), the pair the vocabulary flags: different objects under a shared adjective. ZigzagPreprojective is "Zigzag, preprojective, and Ginzburg algebras" and plans zigzag algebras, quadratic and Koszul duality, Ginzburg DG algebras, Calabi–Yau completions, A∞ deformations and spherical twists — preprojective **algebras** — while QuiverRepresentations' only use of the word is "the preprojective/preinjective `(n, n+1)`, `(n+1, n)`" dimension vectors of Auslander–Reiten theory, i.e. preprojective **modules**. ZigzagPreprojective is explicitly careful about this class of hazard, undertaking to build its chain "without identifying objects which agree only after a duality, a completion, or transfer of an A∞ structure".
- **SpinRepresentations against SchurWeyl** (part 2) was settled from the other side in `RT-AREA-representations-2`: complementary by design, spin representations being "the one part … that the tensor-power engine cannot reach".

## Attack 4 — stage graph and status. Within norms.

All 46 stages have empty `requires` and carry `status: unknown`. Atlas-wide, 669 of 1962 stages have empty `requires` (34%) and 656 carry `status: unknown` (33%), the only other value being `needs_source_decomposition`. Prerequisites are recorded at roadmap level, as in part 2.

## A path note for whoever works here next

`ZigzagPreprojective`'s roadmap id is `tauceti:TauCetiRoadmap/ZigzagPreprojective`, **not** under `.../RepresentationTheory/` like the area's other members, and its document is at `content/tau-ceti/ZigzagPreprojective/README.md`. Its atlas record also carries `readme: null` while that document exists.

## What this red team did not do

I did not re-derive the mathematics of any layer. The library head was pursued on the roadmaps making explicit Mathlib claims rather than across all 46 stages declaration by declaration. Omissions were checked only where a roadmap's own text raised the question — CompactGroups' Peter–Weyl and Haar-measure needs, whose analytic end it attributes to Mathlib and whose declared prerequisite `OrthogonalL2Bases` I did not open. Duplication was screened at roadmap granularity and read closely on the two pairs that screening and subject knowledge flagged.
