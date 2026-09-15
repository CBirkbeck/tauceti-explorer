# Hochschild, cyclotomic and refined trace methods

Construct a shared trace-theoretic library for local-field K-theory and Habiro cohomology. [StableHomotopyKTheory](../StableHomotopyKTheory/README.md) supplies spectra, smash products and actual homotopy limits; [EnhancedDerivedSheaves](../EnhancedDerivedSheaves/README.md) supplies coherent categories and modules; [GeneralAlgebraicKTheory](../GeneralAlgebraicKTheory/README.md) supplies K-theory. This owner contains the trace foundations formerly repeated inside the finite/local K-theory roadmap. Arithmetic field and DVR calculations remain in KTheoryFiniteLocalFields.

The classical cyclotomic foundation is [Nikolaus–Scholze, On topological cyclic homology](https://arxiv.org/abs/1707.01799), with Dundas–Goodwillie–McCarthy's local-structure manuscript for the full relative trace proof. The additional ku/KU and refined-invariant targets use [Wagner, q-de Rham cohomology and THH over ku](https://arxiv.org/abs/2510.06057), [Meyer–Wagner, refined TC](https://arxiv.org/abs/2410.23115), [Efimov, Rigidity of the category of localizing motives](https://arxiv.org/abs/2510.17010), and Wagner's [2026 thesis](https://ferdinand-wagner.github.io/papers/q-Thesis.pdf). Versioned downloads are in the reference manifest. These newer constructions do not identify ordinary and refined TC on arbitrary rational inputs.

## RT.1. Algebraic Hochschild and cyclic theory

Construct the Hochschild chain complex of an associative algebra by tensor powers over its stated base, including derived tensor products where flatness is absent. Define faces, degeneracies, cyclic operators and Connes's B. Prove simplicial/cyclic relations, b²=B²=bB+Bb=0, normalization and functoriality. Build cyclic, negative cyclic and periodic cyclic complexes with direct-sum/product totalizations distinguished, and prove the SBI exact sequence with degree conventions fixed.

Prove Morita invariance, external products, base change under actual Tor hypotheses and the smooth characteristic-zero HKR comparison. Compare the de Rham differential with B. A mixed complex only specifies the algebraic theory; it is not topological Hochschild homology.

## RT.2. THH, circle actions and cyclotomic structure

Construct THH of spectral categories and E₁-algebras by cyclic realization. Give the S¹-action as coherent data, prove equivalence invariance and compare the spectral-category/algebra models. Construct restriction, homotopy orbits, homotopy fixed points and Tate constructions with their norm/fibre sequence and multiplicative structure.

Define a cyclotomic spectrum by the source's Frobenius maps to Tate fixed points, including the residual circle action and prime indexing. Construct TC, TC⁻ and TP with their comparison maps. State bounded-below/completion hypotheses when using the modern fixed-point formula, and prove agreement with the classical genuine-equivariant TR/TC formulation used by local K-theory calculations. Ordinary fixed points, homotopy fixed points and Tate fixed points remain different functors.

## RT.3. The trace and relative comparison

Construct the Dennis/cyclotomic trace from the same K-theory functor and prove its naturality, multiplicativity and compatibility with support/relative fibres. Prove the relative nilpotent comparison theorem with its connective input and p-completion assumptions, and the rational relative K/cyclic-homology comparison with the stated nilpotence hypotheses. The chosen proof includes its excision, approximation/functor-calculus and convergence inputs as named subtargets; none follows simply from defining a trace.

Export the map-level square for a nilpotent extension, a henselian pair in the proven range, and a filtered tower. Include limits and their derived correction terms. Test a square-zero extension and a truncated polynomial algebra; compare the resulting boundary maps with the low-degree K₂ symbol calculations.

### RT.3b. The Beilinson square and the prismatic F-crystal proof bridge

Prove Antieau–Mathew–Morrow–Nikolaus, [On the Beilinson fiber square](https://arxiv.org/abs/2003.12541v2), Theorem 2.12 and Corollary 3.9. For every ordinary ring R the natural square with top row TC(R;ℚ_p)→TC(R/p;ℚ_p) and bottom row HC⁻(R;ℚ_p)→HP(R;ℚ_p) is a pullback. Here ℚ_p means **p-completion followed by inversion of p**, not rationalization before completion. Build both vertical maps, prove the square commutes, and construct its pullback equivalence.

The proof must distinguish the spectral reduction R⊗_𝕊𝔽_p in Theorem 2.12 from the ordinary ring R/p in Corollary 3.9, supplying the quasi-isogeny comparison of §3. In AMMN's ordinary cyclic-homology convention prove fib(TC(R;ℚ_p)→TC(R/p;ℚ_p))≃ΣHC(R;ℚ_p); the rotated third term is Σ²HC. Prove the notation/shift dictionary before using a source's abbreviated Beilinson fibre sequence. Export the p-torsion-free p-complete specialization and filtered refinement of AMMN Theorem 6.17 used by [PrismaticCohomology](../PrismaticCohomology/README.md) PR.7's proof of the prismatic F-crystal/crystalline-lattice equivalence. Henselian hypotheses enter the K-theoretic version, not this general TC square; do not silently identify K with TC for arbitrary R.

## RT.4. Complex K-theory, ku and KU

<a id="stage-RT.4:topological"></a>

**Early topological K-theory (RT.4:topological).** Construct topological complex K-theory from vector bundles, prove Bott periodicity and its spectrum-level multiplication, and define ku as the connective cover of KU. Identify π_*ku=ℤ[β] and π_*KU=ℤ[β,β⁻¹] with |β|=2, proving the localization comparison. These are topological K-theory objects; they are not algebraic K(ℂ) under another name. Compare their ordinary/relative THH and the equivariant constructions used by Wagner.

<a id="stage-RT.4:q-Hodge"></a>

**Later q-Hodge instance (RT.4:q-Hodge).** For a quasi-syntomic ring R with **2 invertible** and a supplied **connective spherical E₂-lift** S_R satisfying S_R⊗Hℤ≃HR, construct the even filtration used in Wagner Theorem 1.2 / 4.27. Prove completeness, multiplicativity and the graded comparison with derived q-de Rham and q-Hodge complexes. A lift only as an E₂ ku-algebra is insufficient. The odd-prime restriction in the underlying Devalapurkar comparison must not be erased; an E₁/p=2 variant requires the source's separate even-resolution hypothesis. Do not select a spherical lift for every ring without proof.

Construct the genuine finite-C_m enhancements called **cyclonic spectra** in Wagner, not just the prime-indexed cyclotomic object of RT.2. Define TC^{−(m)} through genuine C_m fixed points followed by residual-circle homotopy fixed points. These objects do not automatically have classical TR restriction maps. Prove the bounded-below reconstruction used for connective ku, then the compatible even-filtration/Bott-localization construction for KU. Do not apply a connective fixed-point formula directly to an unbounded periodic object without its comparison proof.

<a id="stage-RT.4:Habiro-comparison"></a>

**Late arithmetic comparison (RT.4:Habiro-comparison).** Prove Theorem 5.63's even-graded Habiro comparison with lim_m TC^{−(m)}(KU⊗S_R/KU), including the Σ^(−2i) grading and Bott inversion. For number fields prove Corollary 6.15 only for R=O_F[1/Δ] with Δ divisible by **6 and disc(F)** and the specified spherical étale lift. Its π₀ comparison is with the relative/GSWZ ring constructed by HabiroRings/HabiroNumberFields, not a new definition of that ring. Its stronger excluded-prime condition does not replace the discriminant-only ring construction of HR.5.

## RT.5. Refined localizing invariants

Build the category of localizing motives and its required tensor structure from enhanced small stable categories. Construct compact/dualizable objects, the relevant continuous extensions and the rigidity theorem used in the Efimov–Scholze refinement. Treat the rigidity theorem as a proof milestone with the source's size and dualizability hypotheses. GeneralAlgebraicKTheory's concrete spectrum definition is already available and is not replaced by a universal-property axiom.

Construct refined THH/TC⁻ through the source's localizing-invariant construction, including its comparison to the ordinary invariant, base change and multiplicative maps. Reproduce the Meyer–Wagner computation for ku⊗ℚ and KU⊗ℚ over ku and KU with the exact completion/filtration conventions. Rationalization can annihilate ordinary p-completed THH information; it does not automatically annihilate the refined theory.

## RT.6. Habiro interfaces and verification

Export the coherent circle/Frobenius, even filtration and graded q-Hodge data to [HabiroCohomologyFoundations](../HabiroCohomologyFoundations/README.md). Habiro ring/derived-coefficient descent is constructed by [HabiroRings](../HabiroRings/README.md) HR.2–5 and applied to cohomology in HQ.3–4; this owner proves the trace-theoretic instances. Supply chain-level and spectrum-level comparisons, not a list of homotopy groups without maps.

Also own the [BMS2](https://arxiv.org/abs/1802.03261) quasisyntomic THH/TC⁻/TP computation and motivic-filtration interface: construct evenness on quasiregular semiperfectoid covers, quasisyntomic descent, the complete filtrations and their multiplicative/Frobenius-compatible graded comparisons with prismatic Δ, Nygaard pieces, Breuil–Kisin twists and syntomic complexes. Prove exhaustiveness/completeness and the precise derived convergence in each stated class; do not assume all THH of all rings is even. Generic Δ/Nygaard objects and syntomic Frobenius maps belong to [PrismaticCohomology](../PrismaticCohomology/README.md), ordinary derived de Rham to [DerivedDeRhamCohomology](../DerivedDeRhamCohomology/README.md), and A_inf/Lη to [AInfCohomology](../AInfCohomology/README.md). This stage constructs the **trace-to-prismatic comparison**, not a second Δ. Use the source-qualified BMS2 proof and AMMN's filtered refinements, preserving p-completeness and quasisyntomic hypotheses.

The dependency order is RT.1–3 and early PR constructions → RT.3b/RT.6 comparisons → PR.7's F-crystal application or HQ.8's comparison atlas. PR.7 is not a prerequisite for constructing the AMMN bridge. These late return edges are recorded in the Habiro addition metadata.

Acceptance examples include HKR for a polynomial algebra, the square-zero relative trace, the finite-field THH comparison consumed by local K-theory, Bott localization ku→KU, and the rational-input refined calculation. Every spectral sequence includes a filtration and convergence proof. Suggested.lean prototypes the mixed-complex compatibility already expressible over Mathlib; the higher spectral constructions are precise contracts above.
## Preserved source-unit readiness checkpoints

These checkpoints preserve the original 64-unit/159-edge plan. Native milestone scopes and all original edges are machine-readable in the source graph mapping; a checkpoint is not evidence of Lean completion.

<a id="stage-KU-traces"></a>

**KU-traces — Hochschild and cyclotomic trace constructions.** Readiness checkpoint for original `traces`: verify completion and map-level compatibility of [RefinedTraceMethods:RT.1](README.md), [RefinedTraceMethods:RT.2](README.md), [RefinedTraceMethods:RT.3](README.md), [KTheoryFiniteLocalFields:L.4](../KTheoryFiniteLocalFields/README.md). This is an aggregation of those owners, not a new proof construction. Original prerequisites: `spectra`, `waldhausen`. 

## September 2026 implementation handoff

These additions refine the existing stage IDs. They are construction and review tasks; source decomposition and Lean proofs remain required before a stage is complete.

| Stage | Ordered construction and theorem contract |
| --- | --- |
| `RT.2` | Construct norm, homotopy fixed-point and Tate maps as coherent maps before imposing cyclotomic Frobenius; record bounded-below hypotheses in the modern/classical comparison. |
| `RT.3b` | Prove the spectral-reduction-to-ordinary-R/p comparison and the shift dictionary before exporting the Beilinson square; rationalize after p-completion. |
| `RT.4:Habiro-comparison` | Perform the connective even-filtration comparison before Bott inversion. Prove the finite-C_m cyclonic enhancement and arithmetic coefficient comparison with its 6·disc localization. |

**Producer–consumer handoff.** KTheoryFiniteLocalFields L.4–5 receives genuine TR/trace comparisons; PrismaticCohomology PR.7 receives the AMMN bridge, and HQ receives only the stated q-Hodge instances.

**Acceptance.** Test a square-zero extension, a periodic nonconnective object and a rational refined example to prevent identifying ordinary and refined invariants.

**Source-readiness boundary.** Full DGM approximation/convergence and refined rigidity proof interiors remain substantial source tasks.

Read the per-area revision record for inspected files, fresh versus inherited evidence and proposed graph handoffs. Existing source-unit checkpoints remain aggregation milestones, not proofs of their component theorems.
