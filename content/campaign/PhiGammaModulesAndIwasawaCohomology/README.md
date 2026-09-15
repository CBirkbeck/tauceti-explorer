# (φ,Γ)-modules, Herr complexes and local Iwasawa cohomology

This standalone supplier constructs the local cohomological engine required by Perrin–Riou regulators and signed Coleman maps. It is not a second period-ring or Selmer theory. The early input is [PadicHodgeTheory P7:annulus-foundations](../PadicHodgeTheory/README.md), together with [ArithmeticGaloisDuality](../ArithmeticGaloisDuality/README.md)'s continuous cochains. The actual Iwasawa/corestriction complex belongs to [SelmerIwasawaCohomology L3](../SelmerIwasawaCohomology/README.md); the comparison with the explicitly constructed ψ complex is owned here. [PadicHodgeRegulators](../PadicHodgeRegulators/README.md) owns Bloch–Kato exponentials, big logarithms, interpolation and integral Coleman maps.

Start with a finite extension K/Q_p and its cyclotomic tower K∞, a compatible system of roots of unity, H_K=Gal(Kbar/K∞), and Γ_K=Gal(K∞/K). Keep integral lattices T, rational representations V=T[1/p], integral étale coefficient rings, bounded overconvergent rings and Robba rings separate. A rational equivalence does not construct or recover an arbitrary integral lattice. General Lubin–Tate or multivariable towers are not obtained by renaming Γ_K.

## PG.0 — Cyclotomic coefficients and semilinear actions

Import the analytic Robba/annulus carriers and rational period functors from PadicHodgeTheory, and construct the specific integral field-of-norms/cyclotomic coefficient rings A_K, B_K and their overconvergent variants needed for the functors below. Prove their embeddings, topologies, completions, finite-extension functoriality and the commuting semilinear φ and Γ_K actions. Over Q_p compute φ(π)=(1+π)^p−1 and γ(π)=(1+π)^χ(γ)−1, with continuity/convergence and integral coefficient claims proved. Define an étale φ-module by the appropriate φ-linearization plus a stable lattice, not merely by existence of an abstract endomorphism.

Include field-of-norms Galois equivalence and the descent/lifting statements required in Fontaine's construction, as explicit local proof inputs. These are not consequences of writing down a Robba ring. The field-of-norms construction is compatible with the chosen algebraic closures and tower; independence is proved by natural equivalences.

## PG.1 — Fontaine's étale equivalence

Construct D(T)=(A⊗T)^(H_K) and its inverse via φ-fixed vectors on the enlarged coefficient ring. Prove finite freeness, étaleness, continuity, the two comparison maps, full faithfulness and essential surjectivity. Extend to V and to finite torsion coefficients in the source-supported integral category. Prove exactness, tensor/dual compatibility, finite scalar extension, unramified/rank-one character calculations and change of K. The inverse maps and their cocycle identities must be built; a record with an equivalence field is not a construction.

## PG.2 — Overconvergence and Robba realization

Prove the Cherbonnier–Colmez overconvergence theorem for p-adic representations over finite extensions of Q_p, including bounded-radius descent and the independence of the sufficiently small annulus. Compare integral, bounded overconvergent and Robba realizations through the exact scalar-extension maps. Separate equivalence for étale objects from the larger category of all Robba (φ,Γ)-modules; not every latter object is a Galois representation. Prove the finite-extension and duality comparisons used by PG.3–PG.7.

## PG.3 — Herr cochains and continuous Galois cohomology

For odd p and the finite prime-to-p torsion subgroup Δ⊂Γ_K, choose γ generating a suitable procyclic quotient. Construct the three-term complex on D^Δ with d0(x)=((φ−1)x,(γ−1)x) and d1(a,b)=(γ−1)a−(φ−1)b. Prove d1d0=0 from commuting actions, choice-of-generator comparison and functoriality. Construct the actual quasi-isomorphism to ArithmeticGaloisDuality's continuous Galois cochains, not just equality of dimensions or an abstract cohomology-group isomorphism.

Prove cup products, Tate duality with the source's residue/orientation normalization, restriction and corestriction, torsion/lattice/rational compatibility and finite-extension base change. At p=2 do not use exactness of invariants under a torsion subgroup of order 2: first use the torsion-free cyclotomic subgroup after adjoining μ_4, then construct the finite-group derived descent/double complex and its comparison. State explicitly which integral p=2 theorem has been proved before exporting it.

## PG.4 — The ψ operator and its topology

Construct ψ as the normalized left inverse of φ through the finite-free φ-coordinate decomposition (equivalently the normalized trace where defined). Prove its **integrality**, ψφ=1, ψ(φ(a)x)=aψ(x), compatibility with Γ, and continuity on each required coefficient ring and radius. Division by p in the trace formula requires proving the trace image is p-divisible; it is not a definition on an arbitrary integral ring. Transport ψ to étale modules through φ-linearization, prove independence of bases and functoriality.

Compute the rank-one cyclotomic formulas and compare with [ColemanPowerSeries L1–L2](../ColemanPowerSeries/README.md) and [PadicMeasuresIwasawaAlgebras L2](../PadicMeasuresIwasawaAlgebras/README.md). The power-series ψ, Galois-module ψ and analytic extension have distinct carriers until these comparison maps are proved. Include the identities relating ψ=1 and φ−1 needed by the regulator, with kernels and exceptional characters retained.

## PG.5 — The ψ-complex and derived Iwasawa comparison

For T construct the two-term ψ complex [D(T) --(ψ−1)→ D(T)] in **cohomological degrees 1 and 2**, with its actual Γ_K/Iwasawa-algebra action. Prove the quasi-isomorphism with Rlim_n RΓ(K_n,T) under corestriction in the stated cyclotomic setting, comparing with SelmerIwasawaCohomology L3's independently constructed complex. Deduce H¹_Iw≅D(T)^(ψ=1) and the degree-two cokernel only after proving the complex comparison and its coefficient hypotheses; keep any derived-limit terms visible until the applicable vanishing result is established.

Prove naturality in T, finite extension of K, corestriction, Tate twisting, finite-flat coefficient extension and specialization. For rational coefficients specify H¹_Iw(K,T)⊗Q_p rather than silently interchanging rationalization with an arbitrary inverse limit. Give the chain-level maps to PG.3 at finite characters and compare their normalization with Bloch–Kato maps in PadicHodgeRegulators L1. The p=2 branch uses PG.3's derived torsion descent rather than odd-p averaging. This milestone is independent of constructing a big logarithm or proving a main conjecture.

## PG.6 — Wach modules and crystalline lattices

For Q_p and then finite **unramified** extensions, construct the Wach module attached to a crystalline lattice in the chosen bounded Hodge–Tate interval. State the twist converting the convention HT(Q_p(1)) to the source convention. Prove existence/uniqueness, Γ-triviality modulo π, φ-height bounds, the D_cris comparison and reconstruction of the lattice, with tensor/dual and unramified-base-change maps. Record precisely which operations require rationalization or weight bounds. Do not claim the same integral Wach theorem for arbitrary ramified fields, all de Rham representations or every affinoid family.

Export bases only after proving freeness; identify the change-of-basis action and the filtration/Frobenius normalization needed for PadicHodgeRegulators L4. This supplies existence of the Wach object, not the signed Coleman maps or their image correction, which remain regulator-owned.

## PG.7 — Relative cohomology and qualified families

For the affinoid/relative Robba category of Kedlaya–Pottharst–Xiao, construct relative Herr and Iwasawa complexes and prove their finiteness, perfectness and base-change theorems with the source's hypotheses and Tor corrections. A family of Galois representations gives an étale family, but pointwise étaleness and pointwise crystallinity cannot be promoted to uniform integral lattices or constant D_cris rank without separate theorems. Prove the source-qualified triangulation/specialization inputs required by family regulators, naming exceptional loci.

Keep this later relative theorem separate from PG.1's integral fixed-field equivalence and PG.5's cyclotomic lattice theorem. Consumers are PadicFamilies L4 and the exact de Rham regulator extension of PadicHodgeRegulators L4. No universal scalar p-adic L-function is inferred from a vector-valued cohomology functor.

## Source and acceptance contract

Primary routes: Fontaine's étale (φ,Γ) equivalence; Cherbonnier–Colmez, *Représentations p-adiques surconvergentes*; Herr, *Sur la cohomologie galoisienne des corps p-adiques*; Berger's crystalline/Wach-module theory; and Kedlaya–Pottharst–Xiao, *Cohomology of arithmetic families of (φ,Γ)-modules*. LLZ and Rodrigues Jacinto–Williams provide the regulator-facing normalization/checks, not substitutes for missing equivalence proofs. Exact editions, acquired files and any remaining source-family gaps are recorded in round-02 sources.

Tests: trivial and Tate-twist rank-one lattices; d²=0 with the chosen sign; ψφ=1 but φψ not the identity; finite-layer corestriction; a Δ-isotypic odd-p example and the p=2 descent distinction; crystalline unramified Wach input versus a ramified/noncrystalline non-example; and a family base change with nonzero Tor. Every completed stage supplies constructions, universal properties, comparison maps, hypotheses and the listed tests. Suggested.lean is an honest elementary cochain prototype, not a realization of period rings or a completed comparison theorem.

## September 2026 implementation handoff

These additions refine the existing stage IDs. They are construction and review tasks; source decomposition and Lean proofs remain required before a stage is complete.

| Stage | Ordered construction and theorem contract |
| --- | --- |
| `PG.1` | Build descent maps in both directions for the étale equivalence, preserving a chosen integral lattice; the Robba rational realization is a later scalar extension. |
| `PG.3` | Construct a chain map to continuous cochains, its cup-product compatibility and the finite-extension descent at p=2. A dimension formula for the three-term complex is insufficient. |
| `PG.5` | Fix degrees 1 and 2 of the ψ complex and compare its transitions with corestriction at the chain level; keep the H0/lim¹ and rationalization comparisons explicit. |

**Producer–consumer handoff.** PadicHodgeRegulators L2 consumes the actual ψ comparison and PG.6 Wach existence; SelmerIwasawaCohomology owns the independent inverse-limit complex.

**Acceptance.** Check ψφ=1 without φψ=1, a Tate twist, generator change and dyadic torsion descent. Semilinear maps become linear only over the declared fixed/scalar ring.

**Source-readiness boundary.** Pin Fontaine, Herr, Cherbonnier–Colmez and Berger proof versions; family perfectness is a separate KPX theorem.

Read the per-area revision record for inspected files, fresh versus inherited evidence and proposed graph handoffs. Existing source-unit checkpoints remain aggregation milestones, not proofs of their component theorems.
