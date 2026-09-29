# RT-AREA-representations-3: fixes

Fixer: Claude Code, session `cc-e94dc5`, 29 September 2026 (issue #3984).
- Findings: `RT-AREA-representations-3.result.json`.
- Verdicts: `RT-AREA-representations-3.review.json`.
- One finding. It was confirmed, and the verdict corrects the fix.

This report is the only file changed. Both files the finding names are Tau Ceti roadmaps:
- `content/tau-ceti/RepresentationTheory/RootSystems/README.md`;
- `content/tau-ceti/RepresentationTheory/LieHighestWeight/README.md`.

Both are snapshots of the upstream TauCetiRoadmap repository. Under PROTOCOL.md section 15 they are existing work, and the atlas never re-plans them. The correction is therefore a note for the Tau Ceti maintainer: replacement wording for each passage, below. No atlas packet owns this mathematics, so no node or `requests` entry is added.

## /1 (medium, error): the two roadmaps each send the weight lattice to the other

### What the documents say

Line numbers are as on `main`; they match the review's snapshot.

- **RootSystems, lines 45–50** (Scope boundary). The weight, root, coweight and coroot lattices, the fundamental weights, dominant integral weights and `ρ` "are **not** built here; they belong to" LieHighestWeight.
- **LieHighestWeight** sends the same objects back to RootSystems in six places:
  - **lines 64–67:** RootSystems "is the home of … the root/weight lattices";
  - **lines 114–118:** a named milestone constructs the integral weight lattice `X ⊂ Module.Dual K H`, yet the next sentence says "we reuse the abstract lattice and do not rebuild it";
  - **lines 165–168 and 199–203:** the lattices, fundamental weights, `ρ`, the dominance API and the Weyl action are "the province of" RootSystems;
  - **Layer 1, lines 352–355:** the same;
  - **Layer 2, lines 384–386:** weights "lie in the weight lattice `X` of `../RootSystems/README.md`".
- **RootSystems Layer 6, lines 376–386**, supplies something narrower. For each valid Dynkin type it pins one simply connected integral root datum, with coordinate lattices `Fin t.rank → ℤ`. This is not the general lattice `X` in the Cartan dual of an arbitrary semisimple Lie algebra.

### The corrected diagnosis

The red team's diagnosis was that "nothing is unowned" and that RootSystems supplies an abstract lattice. That is not right.
- The milestone of LieHighestWeight lines 114–117 sits in **no layer** of either roadmap: every LieHighestWeight layer that uses `X` imports it from RootSystems, and RootSystems excludes it.
- The red team's suggested wording ("the abstract lattice object and the Weyl action on it are supplied here") is therefore not used.

The review's contract, which is also the resolution recorded in `overlaps[0]` of the accepted link map `research/blueprint/links/tauceti_TauCetiRoadmap_RepresentationTheory_RootSystems.json`:
- **RootSystems keeps** the finite-type coordinate data.
- **LieHighestWeight keeps** the general highest-weight lattice dictionary.
- **The two are compared**; neither gives a second definition.

### What the pinned libraries have

Each declaration below was read at Mathlib `082e2d3` and Tau Ceti `f790474`.

**Mathlib.**
- The root and coroot lattices: `RootPairing.rootSpan` and `RootPairing.corootSpan` at `S = ℤ` (`LinearAlgebra/RootSystem/IsValuedIn.lean:166, 169`).
- `RootPairing.Base.toWeightBasisInt` (`Base.lean:407`): a `ℤ`-basis of `rootSpan ℤ` by the simple roots. It is a basis of the root lattice, **not** of fundamental weights.
- `RootDatum` (`Defs.lean:109`).
- `RootPairing.weylGroupRootRep` (`WeylGroup.lean:190`): the Weyl action on the weight space. For `LieAlgebra.IsKilling.rootSystem H`, the weight space is `Module.Dual K H`.

**Tau Ceti at the root-pairing level.**
- `TauCeti.dominantChamber` (`LinearAlgebra/RootSystem/Chamber.lean:137`).
- `TauCeti.weylVector` (`LinearAlgebra/RootSystem/Weyl/Vector.lean:151`), `ρ` of a base. Its docstring calls it the root-pairing-level prerequisite of LieHighestWeight's `ρ` item.
- `TauCeti.DynkinType.simplyConnectedRootDatum` and `simplyConnectedBase` (`SimplyConnectedRootDatum/Assembly.lean:79, 94`).
- Their acceptance theorems `hasCartanType_simplyConnectedRootDatum` and `span_coroot_simplyConnectedRootDatum` (`:498, :513`).

**Tau Ceti at the Lie level**, in LieHighestWeight's suggested home.
- `TauCeti.IsIntegralWeight` (`Algebra/Lie/Weights/Integrality.lean:133`).
- Its closure API: `isIntegralWeight_zero`, `IsIntegralWeight.add`, `.neg`, `.sub` and `.zsmul` (lines 153–182).
- `isIntegralWeight_of_weight` (line 203).
- `TauCeti.IsDominantIntegral` (`Algebra/Lie/HighestWeight/Basic.lean:284`).

**In neither library:**
- `X` as a `ℤ`-submodule of `Module.Dual K H`, and its Weyl stability;
- `ρ ∈ X` at the Lie level;
- the fundamental weights of a general base;
- the comparison of `X` with the pinned datum's character lattice.

A search for `Submodule ℤ` under `Algebra/Lie` and `LinearAlgebra/RootSystem` finds only type-specific lattices: `sl₂`, the special linear carrier, the `E₆`/`E₇` minuscule lattices, and the Geck coordinate lattices. Fundamental weights occur only as the standard basis of the pinned datum's character lattice.

The promised milestone is therefore unbuilt. That is consistent with the review: nothing here infers that the milestone is built, or that LieHighestWeight is complete.

### Note for the Tau Ceti maintainer: replacement wording

**RootSystems, Scope boundary (lines 45–50).** Replace the paragraph with:

> **Scope boundary.** This roadmap stops at the root system, its Weyl group, chambers, the
> classification, and the per-type coordinate data of Layer 6. It does not build the lattice apparatus
> of a semisimple Lie algebra that the Weyl character and dimension formulas run on: the integral
> weight lattice `X ⊂ Module.Dual K H`, the fundamental weights of a base, dominant integral weights,
> `ρ` as an element of `X`, and the dominance API. These belong to
> [the highest-weight roadmap](../LieHighestWeight/README.md), which builds them on Mathlib's
> `RootPairing` API and the chambers supplied here. The root and coroot lattices are Mathlib's
> `RootPairing.rootSpan ℤ` and `corootSpan ℤ`; neither roadmap redefines them. The one exception is
> Layer 6. For each valid Dynkin type it pins a particular simply connected integral root datum,
> whose character lattice `Fin t.rank → ℤ` has the fundamental weights as its standard basis. That
> datum is finite-type coordinate data, not the general lattice. The highest-weight roadmap compares
> its lattice with it rather than defining a second one.

**LieHighestWeight, lines 64–67.** Replace "which is the home of abstract root systems, bases and positive systems, Weyl groups, and the root/weight lattices" with:

> which is the home of abstract root systems, bases and positive systems, Weyl groups and their
> chambers, the Cartan–Killing classification, and the pinned coordinate datum of each Dynkin type.
> The integral weight lattice of a semisimple Lie algebra, its fundamental weights, `ρ` and the
> dominance API are built here (Layer 2) and compared with that datum.

**LieHighestWeight, lines 114–118.** After "a named milestone" insert "(Layer 2)". Replace the final sentence ("The `ℤ`-module structure of `X` and the Weyl action on it are shared with `../RootSystems/README.md`; we reuse the abstract lattice and do not rebuild it.") with:

> `X` is built here; `../RootSystems/README.md` does not supply it, since its Layer 6 pins only the
> coordinate lattice of each Dynkin type. We reuse, and do not rebuild:
> - the root and coroot lattices, Mathlib's `RootPairing.rootSpan ℤ` and `corootSpan ℤ`;
> - `Base.toWeightBasisInt`, the `ℤ`-basis of the root lattice by the simple roots (not a basis of
>   fundamental weights);
> - the Weyl action, Mathlib's `weylGroupRootRep` on `Module.Dual K H`, restricted to `X`.

**LieHighestWeight, lines 165–168.** Replace "The **root/weight lattices, fundamental weights, `ρ`, the dominance API, and the Weyl action on the weight lattice** are **not** in Mathlib as such; they are the province of `../RootSystems/README.md`, and we consume them from there." with:

> The root and coroot lattices are in Mathlib as `RootPairing.rootSpan ℤ` and `corootSpan ℤ`, and the
> Weyl action on `Module.Dual K H` as `weylGroupRootRep`. The **integral weight lattice `X`, the
> fundamental weights, `ρ` as an element of `X`, and the dominance API** are **not** in Mathlib. They
> are built here (Layer 2) on the chambers of `../RootSystems/README.md`, and compared with the
> coordinate datum of its Layer 6.

**LieHighestWeight, lines 202–203.** Replace "These, and the root/weight lattices, are the province of [../RootSystems/README.md]" with:

> These are the province of [../RootSystems/README.md](../RootSystems/README.md), which adds chambers,
> the classification and the per-type coordinate data; the weight lattice is built here.

**LieHighestWeight, Layer 1 (lines 352–355).** Replace "The **root/weight lattices** and the **Weyl group's action** are the province of [../RootSystems/README.md]; this layer only fixes the notation `ρ` …" with:

> The Weyl group's action on `Module.Dual K H` is Mathlib's `weylGroupRootRep`, and the chambers are
> those of [../RootSystems/README.md](../RootSystems/README.md). This layer only fixes the notation
> `ρ` for the half-sum of positive roots (at the root-pairing level, `TauCeti.weylVector` of the
> base), and states dominance and integrality of weights in `Module.Dual K H` against coroots. The
> lattice `X` is Layer 2's.

**LieHighestWeight, Layer 2 (line 385).** Replace "the weight lattice `X` of `../RootSystems/README.md`" with "the integral weight lattice `X` (below)". Before the Weyl-invariance bullet, insert the milestone:

> - **The integral weight lattice (the milestone of the conventions).** Define `X` as the
>   `ℤ`-submodule of `Module.Dual K H` of integral weights. `TauCeti.IsIntegralWeight` and its closure
>   lemmas are its carrier and submodule axioms. Prove:
>   - `rootSpan ℤ ≤ X`;
>   - the coroot pairings of `X` land in `ℤ`;
>   - `X` is stable under `weylGroupRootRep`;
>   - `ρ ∈ X`;
>   - the fundamental weights of the base (dual to the simple coroots) form a `ℤ`-basis of `X`
>     indexed by `base.support`;
>   - the dominant integral weights (`IsDominantIntegral`) are exactly their `ℕ`-combinations.
>
>   **Comparison, not redefinition.** For simple `L`, `rootSystem H` has a unique valid Dynkin type
>   `t` (RootSystems Layer 5). Then `X`, with its fundamental-weight basis, is identified with the
>   character lattice `Fin t.rank → ℤ` of `DynkinType.simplyConnectedRootDatum t ht`, and the simple
>   roots of the base go to those of `DynkinType.simplyConnectedBase t ht`. The comparison uses only
>   RootSystems Layers 5–6, so RootSystems gains no dependency on representation theory.

**LieHighestWeight Layer 6** keeps the Weyl character, dimension and Kostant formulas; this note does not move them.

### What this note leaves open

The link map's remaining interfaces are not assigned here:
- the coweight lattice;
- the semisimple (non-simple) form of the comparison;
- a real realization of the chamber geometry of RootSystems Layer 4, which is stated over `ℝ` against `Module.Dual K H`.

The link map asks for these to be audited declaration by declaration before any comparison work is assigned.

ClassicalGroups lines 294–303 cite RootSystems for the Weyl formulas. That is the separately confirmed finding RT-AREA-representations-1/1, with its own fix job. The review calls the red team's claim that this collision caused that error speculative, and this report does not repeat it.
