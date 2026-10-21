# Roadmap: locally analytic distributions, Part II — noncommutative distribution algebras and microlocalisation

**Summary.** This roadmap starts where *Locally analytic distributions, growth and character spaces* (LocallyAnalyticDistributions) stops. That roadmap builds the spaces C^an(X, K) of locally analytic functions on compact p-adic manifolds, their strong duals D(X, K), completed tensor products and the commutative Amice and Mellin theory on ℤ_p and on abelian groups. Here the group G is a compact p-adic Lie group that need not be commutative. The roadmap makes D(G, K) an algebra under convolution and develops the structure that the representation theory of p-adic Lie groups and the p-adic Langlands programme use: the Fréchet–Stein property of Schneider and Teitelbaum with its coadmissible modules and Banach steps D_r(G, K); the completed enveloping algebras Û(g)_K, the closures U_r(g) and Frommer's theorem; the Arens–Michael envelope 𝒰(g); the Ardakov–Wadsley microlocalisation of the Iwasawa algebra K[[G]], which identifies it with Û(g)_K up to S_0-torsion; and central specialisation along infinitesimal characters. The final theorem is Fu's Theorem 1.5: for p odd, G a finite product of first congruence subgroups of SL₂(ℤ_p) and every integral parameter λ ∈ ℤ_p^m, the composite ℚ_p[[G]] → Û(g) → Û(g)_λ is injective. It is the algebraic input of Fu's sharp bound dim S_k(K_f) ≪ (min k_i)^{−1}Δ(k) for cohomological cusp forms over fields that are not totally real. The last layer adds the Schneider–Teitelbaum duality between finitely generated K[[G]]-modules and admissible Banach representations and the algebraic Peter–Weyl theorem on compact open subgroups of SL₂, which convert Iwasawa-module statements into multiplicities of algebraic representations.

The targets below are specifications for formalisation. Every definition comes with the API it needs and with checks that a plausible wrong definition fails; every theorem carries its hypotheses, its source and the earlier targets, library declarations and supplier layers it rests on. The companion [Suggested.lean](Suggested.lean) proposes Lean forms for the few targets whose carriers exist at the pinned libraries; it is not the roadmap and not exhaustive, and this document is definitive.

## Scope and ownership

This roadmap owns:

- p-valuations, ordered bases and the condition (HYP); the analytic structure of p-valued groups; Lazard's Lie lattice L_G and the normalisation g_R = (1/p) R L_G; first congruence subgroups of SL₂(ℤ_p) and their Lie lattices (Layer ND.0).
- The Fréchet algebra D(G, K) of a compact locally L-analytic group, whose convolution product is the one of LocallyAnalyticDistributions L1 extended to L-analytic groups and spherically complete K, the embedding U(g_K) ⊂ D(G, K), the rational Iwasawa algebra L[[G]] ⊂ D(G, K) with its coefficient expansion, decompositions over open subgroups and the centrality of Z(g) (ND.1).
- Fréchet–Stein algebras and coadmissible modules, once, for every roadmap of the atlas; the Banach steps D_r(G, K), their graded rings, the Fréchet–Stein property of D(G, K) and its faithful flatness over L[[G]] (ND.2).
- The p-adically completed enveloping algebra Û(h)_K of a free R-Lie lattice, the closures U_r(g, K) and Frommer's theorem, the crossed-product structure of D_{r_n}, the weighted completions U(g)_r and the Arens–Michael envelope 𝒰(g) with its coadmissible and admissible modules (ND.3).
- Algebraic microlocalisation of filtered rings, the microlocalisation of Iwasawa algebras, the identification D_{1/p}(G, K) ≅ Û(g_R)_K and coefficient extension, Lie modules and the comparison of isotypic quotients (ND.4).
- Central specialisation of D(G, K), D_r, U_r and Û(g); induced infinitesimal characters; strong duality and density for eigenspaces; domains among central quotients; the Ext comparison for finite crossed products; faithfulness of affinoid Verma modules; Fu's injectivity theorem (ND.5).
- The Schneider–Teitelbaum duality for admissible Banach representations of compact p-adic Lie groups, algebraic functions and the algebraic Peter–Weyl theorem on compact open subgroups of SL₂(ℤ_p) (ND.6).

It leaves the following to the roadmaps and libraries named, and does not restate them.

- **Function spaces and duality** belong to LocallyAnalyticDistributions, Layer L0: nonarchimedean locally convex spaces, strict morphisms, Hahn–Banach over spherically complete fields, spaces of compact type and nuclear Fréchet spaces with their duality, analytic manifolds and atlases, C^an(M, E), pullback and multiplication, C^an(X × Y) ≅ C^an(X) ⊗̂ C^an(Y), and D(X, K) for compact X with dense Dirac distributions and D(X × Y) ≅ D(X) ⊗̂ D(Y). The convolution product of distributions on a compact analytic group, with its associativity and unit, belongs to its Layer L1 (`L1/distribution-convolution`, stated there for K finite over ℚ_p); ND.1 imports it.
- **Uniform pro-p groups and Iwasawa algebras** belong to NoncommutativeAndEquivariantIwasawa, Layer NE.0: the lower p-series, uniform and compact p-adic analytic groups, Lazard's noetherian theorem for ℤ_p[[G]] and O[[G]], Zariskian filtrations, compact Nakayama and finite global dimension.
- **Completed group rings and bounded measures** belong to PadicMeasuresIwasawaAlgebras, Layers L0–L1 (now a Tau Ceti roadmap), with Tau Ceti's completed group algebra (ProfiniteProPGroups, Layer 9).
- **Schikhof biduality** for torsion-free compact o-modules and complete o-lattices belongs to CompletedCohomologyPartII, Layer CC.3 (`CC.3/qualified-biduality`); ND.6 imports it for the Schneider–Teitelbaum duality.
- **Classical Lie theory** belongs to the Tau Ceti roadmap LieHighestWeight: sl₂-representations (Layer 0), the PBW theorem and Verma modules (Layer 3), complete reducibility (Layer 5), the centre of U(g) and the Harish-Chandra homomorphism (Layer 7).
- **Admissible locally analytic representations**, the anti-equivalence with coadmissible D(G, K)-modules (Schneider–Teitelbaum 2003, Theorem 6.3) and the existence of analytic vectors belong to the proposed roadmap LocallyAnalyticRepresentationsOfLocalGroups, which imports Layers ND.1–ND.3 from here.
- **Solid and quasi-abelian functional analysis** — Banach–Smith and Fréchet–LS duality, solid completed tensors and the solid realisation of coadmissible modules (Boxer–Calegari–Gee–Pilloni Theorem 2.2.32 and Corollary 2.2.36) — form a separate Part II of LocallyAnalyticDistributions, proposed alongside this one; it imports ND.2 and ND.3/arens-michael-envelope.
- **Growth of algebraic quotients of Û(g)** (Fu §3: generic elements, Theorem 3.2, Proposition 3.4, Theorem 1.6) belongs to the pending algebraic Part II of LieHighestWeight; it imports Û(h)_K from ND.3.
- **Not in this roadmap**: no automorphic forms, completed cohomology or Emerton's spectral sequence (Fu §7), no category O or analytic localisation, no Colmez functor and no locally analytic vectors in Galois representations.

## Conventions

1. **Fields.** p is a prime, ℚ_p ⊆ L ⊆ K ⊆ ℂ_p with L/ℚ_p finite and K complete; |p| = p^{−1}. Where a statement needs K discretely valued (Fréchet–Stein theory, faithful flatness) or spherically complete (duality), it says so; finite extensions of ℚ_p are both. R denotes the integers of K, π a uniformiser, k the residue field. In ND.4 R is unramified (π = p) until coefficients are extended by base change.
2. **Groups.** A p-valuation ω takes values in (1/(p−1), ∞], is assumed rational-valued from ND.1 on, and (HYP) is Schneider–Teitelbaum's condition (saturated, ω(h_i) + ω(h_j) > p/(p−1)). For p odd a uniform group carries ω(g) = n + 1 on G^{p^n} ∖ G^{p^{n+1}}, with minimal generators as an ordered basis. G_1 = ker(SL₂(ℤ_p) → SL₂(𝔽_p)); h = diag(1, −1), e = E_{12}, f = E_{21}; for p odd exp(ph), exp(pe), exp(pf) are minimal generators of G_1 and g_{ℤ_p} = (1/p)L_{G_1} = sl₂(ℤ_p).
3. **Distributions.** D(G, K) = C^an(G, K)′_b. Convolution integrates the left variable first: (λ ∗ μ)(f) = λ(g ↦ μ(h ↦ f(gh))). x ∈ g maps to x̃(f) = (d/dt) f(exp(tx))|₀; with this sign x̃ ∗ ỹ − ỹ ∗ x̃ = [x, y]~ and the ordered monomial x^α pairs with coordinates of the second kind to α!·δ. Schneider–Teitelbaum (2002, Lemma 2.4) differentiate along exp(−tx) and obtain a factor (−1)^{|α|}.
4. **Norms and Banach steps.** For an ordered basis (h_i), b_i = h_i − 1, b^α the ordered product, τ_α = Σ α_i ω(h_i): ‖Σ d_α b^α‖_r = sup |d_α| r^{τ_α}. D_r(G, K) is the completion, the series with |d_α| r^{τ_α} → 0; D_{<r}(G, K), with bounded |d_α| r^{τ_α}, is a different space. r_n = p^{−1/p^n}.
5. **Enveloping algebras.** Û(h) = lim_a U(h)/π^a U(h) and Û(h)_K = Û(h) ⊗_R K for a free R-Lie lattice h; Û(h)_{n,K} = Û(π^n h)_K. U_r(g, K) is the closure of U(g_K) in D_r(G, K). U(g)_r is the completion of U(g) for sup |a_n| r^{|n|} in a PBW basis of an integral lattice, and 𝒰(g) = lim_{r≥1} U(g)_r is the Arens–Michael envelope (written Û(g) by Boxer–Calegari–Gee–Pilloni; it is not the single Banach algebra Û(g)_K).
6. **Casimir and central characters.** In U(sl₂), Δ = ½h² − h + 2ef = ½h² + ef + fe, central, acting on Sym^k by ½k(k + 2) and on a Verma module of highest weight a by ½a(a + 2); Δ is four times the Killing-form Casimir element of Tau Ceti (`TauCeti.casimirElement`). For G_1^m, λ ∈ K^m stands for the character Δ_i ↦ λ_i of Z(g) = K[Δ_1, …, Δ_m]. Fu writes the kernel through p²Δ + λ_0, so λ_0 = −p²λ.
7. **Modules.** Modules are left modules. A coherent sheaf for a Fréchet–Stein algebra has transition isomorphisms A_n ⊗_{A_{n+1}} M_{n+1} ≅ M_n with the Banach algebra on the left. Flatness of a ring map means flatness on both sides when it is stated without a side.
8. **Microlocalisation.** S_0 = ⋃_a (p^a + m^{a+1}) ⊆ R[[G]] is used only for R unramified; over a ramified K the microlocalisation K[[G]] → Û(g_R)_K is the base change of the one over ℚ_p.
9. **Names.** All new declarations live under `TauCeti.`; the namespaces in each layer are proposals. Names follow Mathlib's conventions.

## Exact supplier contracts

**From Mathlib** (`082e2d37e8b0463410cdb532e111cd43d5a66174`). `UniversalEnvelopingAlgebra` with `ι` and `lift` (the universal property, an equivalence between Lie algebra maps L → A and algebra maps U(L) → A); `LieAlgebra.SpecialLinear.sl` and `IsSl2Triple`; `Matrix.SpecialLinearGroup` with `map` along ring homomorphisms; `PadicInt` and `PadicInt.toZMod`; `MonoidHom.ker`; `OreLocalization` and `OreLocalization.OreSet` (Ore localisation of noncommutative rings); `IsRingFiltration`; `IsNoetherianRing`, `IsDomain`; `Module.Flat`, `Module.FaithfullyFlat`; `AbstractMeasure` (measures C(X, R) →L[R] E, without convolution at this commit); `NormedSpace.exp`; `UniformSpace.Completion`; `Subalgebra.topologicalClosure`, `Subgroup.topologicalClosure`; `MvPolynomial`; `IsUltrametricDist`; `IsTopologicalGroup`; `LieModule`.

**From Tau Ceti** (`f790474821cf4256814db967cb154e7af3d0c369`). `TauCeti.IsProP` (pro-p groups); `TauCeti.UniversalEnvelopingAlgebra.pbwFiltration` (the PBW filtration) with `TauCeti.UniversalEnvelopingAlgebra.span_orderedPBWMonomials_eq_pbwFiltration` (ordered monomials span it over any commutative ring: the spanning half of PBW); `TauCeti.casimirElement` with `casimirElement_mem_center` (the Killing-form Casimir, central). The completed group algebra `TauCeti.completedGroupAlgebra` is in later Tau Ceti commits but not at the pin, and is consumed through PadicMeasuresIwasawaAlgebras L1.

**From LocallyAnalyticDistributions L0.** `L0/locally-analytic-function-space`, `L0/locally-analytic-pullback`, `L0/locally-analytic-product`, `L0/locally-analytic-dual-nuclear`, `L0/analytic-manifold-atlases`, `L0/compact-type-spaces`, `L0/compact-type-nuclear-duality`, `L0/compact-type-extension-duality`, `L0/nonarchimedean-hahn-banach`, `L0/banach-open-mapping-lifts`, `L0/strict-morphisms-quasi-abelian`, `L0/nonarchimedean-locally-convex-spaces`, `L0/locally-convex-limits`, `L0/amice-mahler-basis`, `L0/banach-c0-models`, exactly as stated there.

**From LocallyAnalyticDistributions L1.** `L1/distribution-convolution`: the convolution (λ ∗ μ)(f) = μ(y ↦ λ(x ↦ f(xy))) on D(G, K) for a compact analytic group G and K finite over ℚ_p, associative with unit δ_1; by Fubini it equals λ(x ↦ μ(y ↦ f(xy))).

**From CompletedCohomologyPartII CC.3.** `CC.3/qualified-biduality`: evaluation identifies M ≅ D_O D_O M for torsion-free compact O-modules and L ≅ D_O D_O L for complete separated torsion-free O-lattices (Schikhof biduality; Schneider–Teitelbaum 2002, Israel J., §§1–2).

**From NoncommutativeAndEquivariantIwasawa NE.0.** `NE.0/lower-p-series`, `NE.0/uniform-pro-p-group`, `NE.0/compact-padic-analytic-group`, `NE.0/uniform-graded-polynomial`, `NE.0/zariskian-noetherian`, `NE.0/iwasawa-noetherian`, `NE.0/iwasawa-local-iff-pro-p`, `NE.0/compact-nakayama`.

**From PadicMeasuresIwasawaAlgebras L0–L1.** Bounded measures on profinite spaces, the integral and rational measure algebras with convolution in the order xy for nonabelian groups, Dirac elements, and the comparison of integral measures with the completed group algebra.

**From LieHighestWeight (Tau Ceti).** Layer 0: the modules Sym^k(K²). Layer 3: the PBW basis theorem over a field and Verma modules. Layer 5: complete reducibility. Layer 7: Z(U(g)) and the Harish-Chandra homomorphism.

## How to read the build

The layers are ND.0 to ND.6 in dependency order. Each target is a bold-titled paragraph giving its statement with all hypotheses, the API of a definition or construction as a list of named lemmas, its source with the locator, and *Needs*: the earlier targets, library declarations and supplier layers it rests on. The checks of a definition or construction are the **Checks** bullets under it, one per unit test. Each layer ends with its dependencies. Nothing is optional.

## Layer ND.0: p-valued groups, their analytic structure and Lazard lattices

Schneider–Teitelbaum's norms on D(G, K) are built from a p-valuation and an ordered basis, so the layer starts with Lazard's theory as presented by Schneider (2011): the valuation axioms, the graded Lie algebra, ordered bases with their global chart and saturation. For p odd, uniform groups — the objects NoncommutativeAndEquivariantIwasawa NE.0 defines — are exactly the p-valued groups satisfying (HYP), and their p-valuation is the one Fu and Ardakov–Wadsley use. The layer then records the analytic structure, Lazard's Lie lattice with the normalisation g_R = (1/p)R L_G that makes the first congruence subgroup of SL₂(ℤ_p) have Lie lattice sl₂(ℤ_p).

**Targets of the layer.** Lazard's p-valuations ω on a group, the graded Lie algebra gr G over 𝔽_p[ε], finite rank, ordered bases and the global chart ψ : ℤ_p^d → G, saturation and the condition (HYP) of Schneider–Teitelbaum; uniform pro-p groups (imported from NoncommutativeAndEquivariantIwasawa NE.0) as p-valued groups with (HYP) for odd p; the unique p-adic Lie group structure of a p-valuable group; Lazard's Lie lattice L_G with the normalisation g_R = (1/p) R L_G; the first congruence subgroups G_1 = ker(SL₂(ℤ_p) → SL₂(𝔽_p)), with (1/p) L_{G_1} = sl₂(ℤ_p) for p odd.

### p-valuations, ordered bases and the condition (HYP)

**Target `LocallyAnalyticDistributionsPartII:ND.0/p-valuation` (definition).** Let G be a group and p a prime. A p-valuation on G is a function ω : G∖{1} → (1/(p−1), ∞) such that, with ω(1) := ∞, for all g, h ∈ G: ω(gh⁻¹) ≥ min(ω(g), ω(h)); ω(g⁻¹h⁻¹gh) ≥ ω(g) + ω(h); ω(g^p) = ω(g) + 1. For ν > 0 put G_ν = {g : ω(g) ≥ ν} and G_{ν+} = {g : ω(g) > ν}; these are normal subgroups and gr G = ⊕_{ν>0} G_ν/G_{ν+} is a graded Lie algebra over 𝔽_p[ε] (bracket from commutators, ε acting by g ↦ g^p, of degree 1). (G, ω) has finite rank d if gr G is a free 𝔽_p[ε]-module of rank d. An ordered basis is a sequence (h_1, …, h_d) in G∖{1} whose classes h_i G_{ω(h_i)+} form an 𝔽_p[ε]-basis of gr G. (G, ω) is saturated (p-saturated) if every g with ω(g) > p/(p−1) is a p-th power. The pair (G, ω) with a chosen ordered basis satisfies (HYP) if it is saturated and ω(h_i) + ω(h_j) > p/(p−1) for all i ≠ j.

**Planet.** p-valuation.

**Suggested home.** `TauCeti/Topology/Algebra/Group/Profinite/PValuation`, namespace `TauCeti.PValuation`.

**Hypotheses and conventions.**

- ω is real valued; from ND.1 on it is assumed to take rational values, which is no loss of generality (Lazard III.3.1.11, as recalled in ST03 §4, p. 15).
- At p = 2 the lower bound 1/(p−1) = 1 makes the axioms stronger; every statement of this roadmap that needs (HYP) is stated for odd p or with (HYP) as an explicit hypothesis.

**Construction.**

1. G_ν and G_{ν+} are normal because ω is invariant under conjugation up to the commutator axiom: ω(ghg⁻¹) ≥ min(ω(h), ω(g)+ω(h)) = ω(h), and equality follows by symmetry (Schneider §23).
2. The commutator axiom makes [G_ν, G_μ] ⊆ G_{ν+μ}, which gives the graded Lie bracket on gr G; the p-power axiom gives the operator P of degree one, and P commutes with brackets (Schneider Proposition 25.1; ST03 §4, pp. 14–15).
3. Ordered bases exist for (G, ω) of finite rank (Schneider Proposition 26.6) and are characterised by the basis property of their symbols (Schneider Proposition 26.5).

**Needs.** `mathlib:IsTopologicalGroup`, `mathlib:Subgroup.topologicalClosure`, `tauceti:TauCeti.IsProP`.

**API.**

- `TauCeti.PValuation` (structure): A p-valuation ω : G → ℝ ∪ {∞} (WithTop ℝ) with ω(1) = ∞, ω finite and > 1/(p−1) off 1, and the three axioms.
- `TauCeti.PValuation.trivial` (example): The trivial group with ω ≡ ∞.
- `TauCeti.PValuation.filtration` (data): The normal subgroups G_ν = {ω ≥ ν} and G_{ν+} = {ω > ν}, antitone in ν.
- `TauCeti.PValuation.map_conj` (simp): ω(ghg⁻¹) = ω(h) for all g, h.
- `TauCeti.PValuation.gr` (constructor): The graded 𝔽_p[ε]-Lie algebra gr G with ε acting by the p-power map.
- `TauCeti.PValuation.IsOrderedBasis` (characterisation): (h_1, …, h_d) is an ordered basis iff the symbols σ(h_i) form an 𝔽_p[ε]-basis of gr G.
- `TauCeti.PValuation.IsSaturated` (data): Every g with ω(g) > p/(p−1) is a p-th power.
- `TauCeti.PValuation.Hyp` (data): The condition (HYP): saturated, and ω(h_i) + ω(h_j) > p/(p−1) for i ≠ j.
- `TauCeti.PValuation.restrict` (functoriality): The restriction of ω to a closed subgroup is a p-valuation; ordered bases of open normal subgroups are compatible with conjugation.

**Checks.**

- `pValuation_padicInt` (computation): On the additive group G = pℤ_p (p odd), written multiplicatively, ω(x) = v_p(x) is a p-valuation of rank 1 with ordered basis (p); ω(p^k u) = k for a unit u.
- `pValuation_trivial` (degenerate): The trivial group has the unique p-valuation (ω(1) = ∞), rank 0 and the empty ordered basis.
- `not_pValuation_torsion` (non-example): A p-valued group is torsion-free. If g ≠ 1 had order p, then ω(g^p) = ω(1) = ∞ would equal the finite value ω(g) + 1. If g ≠ 1 had finite order m prime to p, then g = (g^p)^k with pk ≡ 1 mod m, so ω(g) ≥ ω(g^p) = ω(g) + 1, again impossible. Hence ℤ/p is not p-valued, and neither is SL_2(ℤ_p) for any p, since −1 has order 2 (for p = 3 it also contains elements of order 3).
- `not_isSaturated_shift` (non-example): On the additive group ℤ_p (p odd), ω = v_p + 1 is a saturated p-valuation (ω(x) > p/(p−1) means v_p(x) ≥ 1, i.e. x ∈ pℤ_p is a p-th power), while ω = v_p + 2 is a p-valuation that is not saturated: the generator 1 has ω(1) = 2 > p/(p−1) but is not a p-th power.

**Uses.**

- ST03 §4, Theorems 4.5, 4.9 and 4.10: the norms ‖·‖_r and the Fréchet–Stein structure of D(G, K) are built from ω and an ordered basis satisfying (HYP).
- AW13 §10.3 and Fu (2024) equation (15): a uniform group carries the integral p-valuation ω(g) = n + 1 on G^{p^n} ∖ G^{p^{n+1}}, which makes the norms ‖·‖_r of ST03 equal to Fu's ‖·‖_r.
- ST03 Theorem 5.1, step 1: the lower p-series of an open normal uniform subgroup gives a conjugation-invariant p-valuation, so the norms on D(H, K) extend to D(G, K).

**Acceptance.**

- Computation, degenerate and non-example tests below pin the axioms and the saturation condition.

**Sources.**

- Schneider, p-Adic Lie Groups (2011), §23, Definition of a p-valuation, p. 169, and §26, Propositions 26.5–26.6, pp. 184–186: Defines p-valuations with values above 1/(p−1), the filtration G_ν and graded Lie algebra gr G over 𝔽_p[P], finite rank, ordered bases and saturation.
- Schneider–Teitelbaum (2003), §4, pp. 14–15 and p. 20: Recalls Lazard's p-valuations, gr G over 𝔽_p[ε], ordered bases and the global chart, and states the hypothesis (HYP) used for the noncommutative Banach steps.

### Ordered bases give global coordinates

**Target `LocallyAnalyticDistributionsPartII:ND.0/ordered-basis-chart` (theorem).** Let (G, ω) be a p-valued group of finite rank d, complete for the topology defined by ω. Then (i) G is a pro-p group whose topology is defined by the subgroups G_ν, and it is topologically finitely generated; (ii) an ordered basis (h_1, …, h_d) exists; (iii) for every ordered basis the map ψ : ℤ_p^d → G, (x_1, …, x_d) ↦ h_1^{x_1} ⋯ h_d^{x_d}, is a homeomorphism satisfying ω(ψ(x)) = min_i (ω(h_i) + v_p(x_i)); (iv) the subgroups G^{p^n} generated by p^n-th powers are open, and for saturated (G, ω) they equal G_{ν+} for suitable ν.

**Suggested home.** `TauCeti/Topology/Algebra/Group/Profinite/PValuation`, namespace `TauCeti.PValuation`.

**Hypotheses and conventions.**

- Completeness and finite rank are both needed: an infinite product of copies of ℤ_p with ω = v_p is p-valued but not of finite rank, and has no finite ordered basis.

**Proof.**

1. Finite rank makes every graded piece gr_ν G finite and puts the values of ω in finitely many progressions ν_j + ℕ_0 (Schneider §26, the discussion after Lemma 26.1, drawn there for a profinite G whose topology ω defines); so the filtration is countable and separated with finite p-group quotients G/G_ν, and completeness makes G = lim G/G_ν a pro-p group (Lazard II.1.1.5 as cited in ST03 p. 15).
2. An ordered basis is obtained by lifting an 𝔽_p[ε]-basis of gr G and ordering by ω (Schneider Proposition 26.6); Proposition 26.5 proves the equivalence of the basis condition and the ordered-product description.
3. The ordered-product map is continuous and bijective, by successive approximation along the filtration, and ω of an ordered product is the minimum of the ω(h_i^{x_i}) = ω(h_i) + v_p(x_i) (Schneider Proposition 26.5; ST03 p. 15 citing Lazard III.2.2.5/6). A continuous bijection from a compact space to a Hausdorff space is a homeomorphism.
4. The p-power subgroups are treated in Schneider Proposition 26.15 and Remark 26.9.

**Needs.** `LocallyAnalyticDistributionsPartII:ND.0/p-valuation`, `mathlib:PadicInt`.

**Acceptance.**

- For G = 1 + pℤ_p (p odd) with ω = v_p(· − 1) and ordered basis (1 + p), ψ(x) = (1 + p)^x and ω((1 + p)^x) = 1 + v_p(x).

**Sources.**

- Schneider, p-Adic Lie Groups (2011), §26, Lemma 26.1, Propositions 26.5, 26.6 and 26.15, pp. 181–191: Proves that finite-rank p-valued groups have ordered bases, that ordered products give a bijective chart with the minimum formula for ω, and describes the p-power subgroups.
- Schneider–Teitelbaum (2003), §4, p. 15: States that ψ : ℤ_p^d → G is a bijective global chart with ω(h^x) = min(ω(h_i) + ω_p(x_i)) and uses it to identify C(G, K) and C^an(G, K) with function spaces on ℤ_p^d.

### Uniform pro-p groups are p-valued groups satisfying (HYP)

**Target `LocallyAnalyticDistributionsPartII:ND.0/uniform-groups-p-valued` (theorem).** Let p be odd and G a uniform pro-p group of dimension d (NoncommutativeAndEquivariantIwasawa NE.0). Define ω(1) = ∞ and ω(g) = n + 1 for g ∈ G^{p^n} ∖ G^{p^{n+1}}. Then ω is an integral p-valuation of rank d, every minimal topological generating set (g_1, …, g_d) is an ordered basis with ω(g_i) = 1, each element of G^{p} is a p-th power, and (G, ω, (g_i)) satisfies (HYP). Conversely, a compact group with a p-valuation and an ordered basis satisfying (HYP) is powerful and torsion-free, hence uniform. In particular ψ(x) = g_1^{x_1} ⋯ g_d^{x_d} is a homeomorphism ℤ_p^d → G and ω(ψ(x)) = 1 + min_i v_p(x_i).

**Suggested home.** `TauCeti/Topology/Algebra/Group/Profinite/PValuation`, namespace `TauCeti.PValuation`.

**Hypotheses and conventions.**

- p odd. For p = 2 the analogous statement replaces G by its Frattini subgroup (ST03 Theorem 5.1, step 1), and this roadmap does not use it.

**Proof.**

1. The lower p-series of a uniform group is G^{p^n} and the p-power map induces bijections G^{p^n}/G^{p^{n+1}} → G^{p^{n+1}}/G^{p^{n+2}} (AW13 §10.2, recalling DDMS Lemma 4.10); this gives the three axioms of a p-valuation (AW13 §10.3, proof of the theorem, which cites Lazard II.2.1.2).
2. gr G ≅ ⊕ G^{p^n}/G^{p^{n+1}} is free of rank d over 𝔽_p[t] with basis the classes of a minimal generating set (AW13 Lemma 10.2), so these form an ordered basis with ω = 1.
3. Since ω(g_i) + ω(g_j) = 2 > p/(p−1) for p ≥ 3 and every element of G^p = {ω ≥ 2} is a p-th power, (HYP) holds (ST03 Remark after Lemma 4.3, p. 20). The converse is the same Remark: commutators of basis elements are p-th powers, so G is powerful, and a p-valued group is torsion-free.
4. The formula for ω on ordered products is ND.0/ordered-basis-chart.

**Needs.** `NoncommutativeAndEquivariantIwasawa:NE.0/uniform-pro-p-group`, `NoncommutativeAndEquivariantIwasawa:NE.0/lower-p-series`, `LocallyAnalyticDistributionsPartII:ND.0/p-valuation`, `LocallyAnalyticDistributionsPartII:ND.0/ordered-basis-chart`.

**Acceptance.**

- For G = 1 + pℤ_p ⊂ ℤ_p^× (p odd), which is uniform of dimension 1, ω(1 + p^n u) = n for a unit u, matching v_p(g − 1).

**Sources.**

- Schneider–Teitelbaum (2003), §4, Remark following Lemma 4.3, p. 20: Relates uniform groups to p-valued groups: for p odd a uniform group has an integral p-valuation with an ordered basis of value 1 satisfying (HYP), and conversely (HYP) forces uniformity.
- Ardakov–Wadsley (2013), §10.2, Lemma, and §10.3, proof of the Theorem, pp. 68–69: Defines ω(g) = i + 1 on G^{p^i} ∖ G^{p^{i+1}} for a uniform group, notes it is a p-valuation, and identifies gr G ⊗ k with t·h_k[t].
- Fu (2024), §4, equation (15), p. 13: Characterises the p-valuation of a uniform group by ω(g_i) = 1 and ω(g) = 1 + min v_p(x_i) in ordered coordinates.

### The analytic structure of a p-valued group

**Target `LocallyAnalyticDistributionsPartII:ND.0/p-valued-analytic-structure` (theorem).** (i) A p-valuable pro-p group G (one admitting a p-valuation of finite rank defining its topology) carries a unique structure of a locally ℚ_p-analytic manifold making it a p-adic Lie group, of dimension equal to its rank; for any ordered basis the chart ψ of ND.0/ordered-basis-chart is an analytic isomorphism ℤ_p^d → G, and the group operations are given in these coordinates by power series with coefficients in ℚ_p converging on ℤ_p^d. (ii) Conversely every p-adic Lie group G has a compact open subgroup G′ with an integral p-valuation defining its topology such that (G′, ω) is saturated and rank G′ = dim G; and every compact p-adic Lie group has an open normal subgroup which is uniform (for p odd) or p-valued satisfying (HYP).

**Planet.** Analytic structure of a p-valued group.

**Suggested home.** `TauCeti/Topology/Algebra/Group/Profinite/PValuation`, namespace `TauCeti.PValuation`.

**Hypotheses and conventions.**

- Uniqueness is of the manifold structure compatible with the topology and the group operations; the chart ψ depends on the ordered basis, and two ordered bases give analytically compatible charts.

**Proof.**

1. Schneider §29 shows that multiplication in ordered coordinates is given by power series (Proposition 29.2), hence that a p-valuable group is a p-adic Lie group (Corollary 29.6), uniquely so (Theorem 29.8).
2. Schneider Theorem 27.1 constructs, from a chart at the identity, a compact open subgroup with a saturated integral p-valuation of rank equal to the dimension.
3. An open normal uniform subgroup exists by ST03 §4, p. 14, citing DDMS Corollary 8.34; its p-valuation satisfies (HYP) by ND.0/uniform-groups-p-valued.

**Needs.** `LocallyAnalyticDistributionsPartII:ND.0/ordered-basis-chart`, `LocallyAnalyticDistributionsPartII:ND.0/uniform-groups-p-valued`, `LocallyAnalyticDistributions:L0/analytic-manifold-atlases`, `NoncommutativeAndEquivariantIwasawa:NE.0/compact-padic-analytic-group`.

**Acceptance.**

- For G = 1 + pℤ_p (p odd) the chart x ↦ (1 + p)^x = exp(x log(1 + p)) is analytic with analytic inverse x = log(g)/log(1 + p); the multiplication is (x, y) ↦ x + y.
- For the first congruence subgroup of SL_2(ℤ_p) the analytic structure is the one induced from the ℚ_p-manifold SL_2(ℤ_p) (ND.0/first-congruence-sl2).

**Sources.**

- Schneider, p-Adic Lie Groups (2011), §27, Theorem 27.1, p. 192; §29, Proposition 29.2, Corollary 29.6 and Theorem 29.8, pp. 202–206: Every p-adic Lie group has a compact open saturated p-valued subgroup of rank equal to its dimension; a p-valuable pro-p group has a unique p-adic Lie group structure, with multiplication analytic in ordered coordinates.
- Fu (2024), §4, p. 12, citing DDMS Theorem 8.18: Uses that a uniform pro-p group is compact locally ℚ_p-analytic and satisfies (HYP) of ST03.
- Schneider–Teitelbaum (2003), §4, p. 14: Recalls that any compact locally ℚ_p-analytic group has an open normal uniform subgroup (DDMS Corollary 8.34).

### The Lazard Lie lattice and the Lie algebras g_R, g_K of a uniform group

**Target `LocallyAnalyticDistributionsPartII:ND.0/lazard-lie-lattice` (construction).** Let p be odd, G uniform of dimension d with minimal topological generating set (g_1, …, g_d), R a complete discrete valuation ring with fraction field K ⊇ ℚ_p. On the set G define λ·x = x^λ (λ ∈ ℤ_p), x + y = lim_{i→∞} (x^{p^i} y^{p^i})^{p^{−i}} and [x, y] = lim_{i→∞} (x^{−p^i} y^{−p^i} x^{p^i} y^{p^i})^{p^{−2i}}. These operations make G a Lie algebra L_G over ℤ_p, free of rank d with basis g_1, …, g_d, and powerful: [L_G, L_G] ⊆ p L_G. Put g_R := R ⊗_{ℤ_p} (1/p)L_G (an R-Lie algebra free of rank d, since [p⁻¹L_G, p⁻¹L_G] ⊆ p⁻¹L_G) and g_K := K ⊗_R g_R. The p-adic logarithm identifies L_G with a ℤ_p-lattice in the Lie algebra Lie(G) of the analytic group of ND.0/p-valued-analytic-structure, so g_{ℚ_p} = ℚ_p ⊗ L_G ≅ Lie(G), and L_{G^{p^n}} = p^n L_G.

**Planet.** Lazard Lie lattice.

**Suggested home.** `TauCeti/Topology/Algebra/Group/Profinite/Lazard`, namespace `TauCeti.Lazard`.

**Hypotheses and conventions.**

- p odd; for p = 2 the bracket satisfies [L_G, L_G] ⊆ 4L_G and the normalisation of g_R is unchanged (AW13 §10.2), but this roadmap does not use p = 2.
- The normalisation g_R = (1/p) R L_G is the one of Ardakov–Wadsley and Fu: under it the first congruence subgroup of SL_2(ℤ_p) has g_{ℤ_p} = sl_2(ℤ_p) (ND.0/first-congruence-sl2).

**Construction.**

1. The limits exist and define a ℤ_p-Lie algebra structure (DDMS Theorem 4.30, as recalled in AW13 §10.2 and Fu §4). Freeness with basis the minimal generators follows from the ordered coordinates of ND.0/uniform-groups-p-valued.
2. For the comparison with the analytic Lie algebra use Schneider §31: for saturated (G, ω), log identifies G with a ℤ_p-lattice of the normed Lie algebra L_ω(G) (Corollary 31.7), and the Hausdorff series (Theorem 32.1) shows that the group law is recovered by the Campbell–Hausdorff formula; under log the operations above become addition and bracket.
3. L_{G^{p^n}} = p^n L_G because G^{p^n} is uniform with generators g_i^{p^n} (AW13 §10.2).

**Needs.** `LocallyAnalyticDistributionsPartII:ND.0/uniform-groups-p-valued`, `LocallyAnalyticDistributionsPartII:ND.0/p-valued-analytic-structure`, `NoncommutativeAndEquivariantIwasawa:NE.0/uniform-pro-p-group`, `mathlib:LieAlgebra`, `mathlib:PadicInt`.

**API.**

- `TauCeti.Lazard.lieLattice` (constructor): L_G, the set G with the Lazard addition, ℤ_p-scaling and bracket, as a ℤ_p-Lie algebra.
- `TauCeti.Lazard.lieLattice_free` (characterisation): L_G is free over ℤ_p with basis any minimal topological generating set.
- `TauCeti.Lazard.lie_lieLattice_le` (relation): [L_G, L_G] ⊆ p L_G.
- `TauCeti.Lazard.liealgR` (data): g_R = R ⊗ (1/p)L_G as an R-Lie algebra, with g_K = K ⊗ g_R.
- `TauCeti.Lazard.lieLattice_powP` (functoriality): L_{G^{p^n}} = p^n L_G inside L_G ⊗ ℚ_p; a continuous homomorphism of uniform groups induces a ℤ_p-Lie algebra map.
- `TauCeti.Lazard.log_lieLattice` (compatibility): log : G → Lie(G) is an isomorphism of ℤ_p-Lie algebras from L_G onto a lattice of Lie(G).

**Checks.**

- `lieLattice_abelian` (computation): For G = 1 + pℤ_p the Lazard addition is multiplication, (1 + p)^a + (1 + p)^b = (1 + p)^{a+b}, and the bracket is zero.
- `lieLattice_trivial` (degenerate): The trivial group gives L_G = 0 and g_R = 0.
- `lieLattice_bracket_scaled` (non-example): For the first congruence subgroup of SL_2(ℤ_p) the bracket of L_G corresponds under log to [x, y] on p·sl_2(ℤ_p), so [L_G, L_G] ⊆ pL_G but not ⊆ p²L_G: [p e, p f] = p² h with p h ∈ L_G ∖ pL_G. A definition normalised as g_R = L_G ⊗ R would give g_{ℤ_p} = p·sl_2(ℤ_p), not sl_2(ℤ_p).
- `lieLattice_sl2_compat` (compatibility): For the first congruence subgroup of SL_2(ℤ_p), g_{ℤ_p} is Mathlib's LieAlgebra.SpecialLinear.sl (Fin 2) ℤ_p, with exp(p x) ∈ G corresponding to x ∈ g_{ℤ_p}.

**Uses.**

- AW13 Theorem 10.4 (ND.4/lazard-microlocalisation): the microlocalisation of R[[G]] is the completed enveloping algebra of g_R = (1/p)R L_G.
- ST02 §2 and Fu (22)–(23) (ND.1/lie-algebra-in-distributions): g_K acts on locally analytic functions by derivatives along one-parameter subgroups, giving U(g_K) → D(G, K).
- Kohlhaase §1.4, Frommer's theorem (ND.3/frommer-theorem): the elements X_i = log(1 + b_i) = log(g_i) form a basis of g whose closure U_r(g) describes D_r(G, K).
- Fu Lemma 5.6 (ND.0/first-congruence-sl2): for the first congruence subgroup of SL_2(ℤ_p), (1/p)L_G = sl_2(ℤ_p).

**Acceptance.**

- For G = 1 + pℤ_p, L_G = ℤ_p·(1 + p) with zero bracket, and log identifies it with pℤ_p ⊂ ℚ_p = Lie(G); g_{ℤ_p} = ℤ_p·log(1 + p)/p.

**Sources.**

- Ardakov–Wadsley (2013), §10.2, the displayed operations, the Definition of 1/p R L_G and the Lemma, p. 68: Recalls Lazard's ℤ_p-Lie algebra L_G of a uniform group, powerful and free of rank d, and defines the R-Lie algebra (1/p)R L_G and the graded comparison gr G ⊗ k ≅ t h_k[t].
- Fu (2024), §4, equations (10)–(12) and the definitions of g_R, g_K, p. 12: Uses the same operations and the normalisation g_R = (1/p) L_G ⊗ R, g_K = g_R ⊗ K.
- Schneider, p-Adic Lie Groups (2011), §31, Corollary 31.7, p. 229, and §32, Theorem 32.1, p. 232: For saturated groups log is a bijection between ordered bases and suitable lattice bases of the normed Lie algebra L_ω(G), and the Hausdorff series converges on the relevant domain.

### First congruence subgroups of SL₂(ℤ_p) and their products

**Target `LocallyAnalyticDistributionsPartII:ND.0/first-congruence-subgroup` (definition).** For a prime p let G_1 := ker(SL_2(ℤ_p) → SL_2(𝔽_p)) = SL_2(ℤ_p) ∩ (I_2 + pM_2(ℤ_p)), the kernel of reduction modulo p, and for m ≥ 1 let G = G_1^m ⊂ SL_2(ℤ_p)^m. G is open, normal of finite index in SL_2(ℤ_p)^m.

**Suggested home.** `TauCeti/NumberTheory/Padics/CongruenceSL2`, namespace `TauCeti`.

**Construction.**

1. G_1 is the kernel of the group homomorphism induced by the ring map ℤ_p → ℤ/p, hence a normal subgroup; it is open because ℤ_p → ℤ/p is continuous with discrete target.

**Needs.** `mathlib:Matrix.SpecialLinearGroup`, `mathlib:Matrix.SpecialLinearGroup.map`, `mathlib:PadicInt.toZMod`, `mathlib:MonoidHom.ker`.

**API.**

- `TauCeti.firstCongruenceSL2` (constructor): G_1 := (Matrix.SpecialLinearGroup.map (PadicInt.toZMod)).ker as a subgroup of SL(2, ℤ_[p]).
- `TauCeti.mem_firstCongruenceSL2_iff` (characterisation): g ∈ G_1 iff every entry of g − 1 lies in pℤ_p.
- `TauCeti.firstCongruenceSL2_normal` (instance): G_1 is a normal subgroup.
- `TauCeti.firstCongruenceProduct` (constructor): G = Π_{i<m} G_1 as a subgroup of Fin m → SL(2, ℤ_[p]).
- `TauCeti.upperUnipotent` (example): The element of SL_2(ℤ_p) with rows (1, a) and (0, 1), used in the tests.

**Checks.**

- `one_mem_firstCongruenceSL2` (degenerate): 1 ∈ G_1.
- `upperUnipotent_p_mem` (computation): The matrix with rows (1, p) and (0, 1) lies in G_1.
- `upperUnipotent_one_not_mem` (non-example): The matrix with rows (1, 1) and (0, 1) lies in SL_2(ℤ_p) but not in G_1.
- `neg_one_not_mem` (non-example): −1 ∉ G_1 for p odd, since −1 − 1 = −2 is a unit; so G_1 has trivial centre-intersection with {±1}.

**Uses.**

- Fu Theorems 1.4, 1.5 and 5.1: G = ∏ G_i is the group whose rational Iwasawa algebra is microlocalised and centrally specialised.
- AW14 §5.4: G_1 is the congruence kernel ker(SL_2(ℤ_p) → SL_2(ℤ_p/p)) with n = 0, to which the Verma faithfulness theorem applies.
- Fu §6 (ND.6/algebraic-peter-weyl): algebraic matrix coefficients are restricted to G.

**Acceptance.**

- The tests below; that G_1 is uniform for p odd is ND.0/first-congruence-sl2.

**Sources.**

- Fu (2024), §1, before Theorem 1.4, p. 3, and §5, before Lemma 5.6, p. 19: Defines G_i = (I_2 + pM_2(ℤ_p)) ∩ SL_2(ℤ_p) and G as their product, as the groups of the main theorems.

### The first congruence subgroup of SL₂(ℤ_p) and its Lie lattice

**Target `LocallyAnalyticDistributionsPartII:ND.0/first-congruence-sl2` (theorem).** (i) If G is a compact open uniform subgroup of SL_n(ℚ_p), its Lazard Lie algebra satisfies g_{ℚ_p} ≅ sl_n(ℚ_p), the isomorphism given by the matrix logarithm. (ii) Let p be odd and G_1 = ker(SL_2(ℤ_p) → SL_2(𝔽_p)). Then G_1 is uniform of dimension 3; with h = diag(1, −1), e = E_{12}, f = E_{21}, the elements exp(ph), exp(pe), exp(pf) form a minimal topological generating set; and (1/p)L_{G_1} = g_{ℤ_p} = ℤ_p h ⊕ ℤ_p e ⊕ ℤ_p f = sl_2(ℤ_p) with [h, e] = 2e, [h, f] = −2f, [e, f] = h. For G = G_1^m the corresponding statements hold componentwise, with g_{ℤ_p} = sl_2(ℤ_p)^m.

**Planet.** First congruence subgroup of SL₂(ℤ_p).

**Suggested home.** `TauCeti/NumberTheory/Padics/CongruenceSL2`, namespace `TauCeti`.

**Hypotheses and conventions.**

- (i) is an identification of rational Lie algebras; the integral equality in (ii) is specific to the first congruence subgroup and p odd.

**Proof.**

1. For x ∈ p M_2(ℤ_p) the exponential and logarithm series converge (p odd) and are mutually inverse bijections between p·sl_2(ℤ_p) and G_1; under them the commutator limits of ND.0/lazard-lie-lattice become the matrix bracket (Fu, proof of Lemma 5.6, citing DDMS Lemma 7.12). Hence L_{G_1} = p·sl_2(ℤ_p) and (1/p)L_{G_1} = sl_2(ℤ_p).
2. exp(px) for x ∈ {h, e, f} reduce to a basis of G_1/G_1^p ≅ sl_2(𝔽_p), so they are a minimal generating set, and G_1 is uniform since its lower p-series is G_1^{p^n} = ker(SL_2(ℤ_p) → SL_2(ℤ/p^{n+1})).
3. (i) is DDMS Chapter 9, Exercise 9, as cited by Fu Lemma 4.1: the matrix logarithm is a Lie algebra isomorphism from ℚ_p ⊗ L_G onto the Lie algebra of the closed subgroup G of SL_n(ℚ_p), which is sl_n(ℚ_p) since G is open.

**Needs.** `LocallyAnalyticDistributionsPartII:ND.0/first-congruence-subgroup`, `LocallyAnalyticDistributionsPartII:ND.0/lazard-lie-lattice`, `mathlib:LieAlgebra.SpecialLinear.sl`, `mathlib:IsSl2Triple`, `mathlib:NormedSpace.exp`.

**Acceptance.**

- Under (ii), the Iwasawa algebra ℤ_p[[G_1]] is the noncommutative power series ring in F = exp(pf) − 1, H = exp(ph) − 1, E = exp(pe) − 1 (Fu p. 19).
- The Casimir element Δ = ½h² − h + 2ef of U(sl_2) is four times the Killing-form Casimir of sl_2 (Tau Ceti's casimirElement): with κ(h, h) = 8 and κ(e, f) = 4 the dual basis of (h, e, f) is (h/8, f/4, e/4), giving h²/8 + (ef + fe)/4 = Δ/4.

**Sources.**

- Fu (2024), Lemma 4.1, p. 12, and Lemma 5.6 with its proof, p. 19: States that a compact open uniform subgroup of SL_n(ℚ_p) has g_K ≅ sl_{n,K}, and that the first congruence subgroup has g_0 ≅ sl_2(ℤ_p) with minimal generators exp(ph), exp(pe), exp(pf).
- Ardakov–Wadsley (2014), §5.4, the hypotheses and the congruence-kernel example, p. 16: Records that the congruence kernel ker(G(O_L) → G(O_L/p^{n+1})) satisfies p^n g = (1/p)R L_G, which for SL_2 over ℤ_p and n = 0 is the statement (1/p)L_{G_1} = sl_2(ℤ_p).

### Dependencies

Within this roadmap: none.

On other roadmaps and the libraries: `LocallyAnalyticDistributions:L0/analytic-manifold-atlases`, `NoncommutativeAndEquivariantIwasawa:NE.0/compact-padic-analytic-group`, `NoncommutativeAndEquivariantIwasawa:NE.0/lower-p-series`, `NoncommutativeAndEquivariantIwasawa:NE.0/uniform-pro-p-group`, `mathlib:IsSl2Triple`, `mathlib:IsTopologicalGroup`, `mathlib:LieAlgebra`, `mathlib:LieAlgebra.SpecialLinear.sl`, `mathlib:Matrix.SpecialLinearGroup`, `mathlib:Matrix.SpecialLinearGroup.map`, `mathlib:MonoidHom.ker`, `mathlib:NormedSpace.exp`, `mathlib:PadicInt`, `mathlib:PadicInt.toZMod`, `mathlib:Subgroup.topologicalClosure`, `tauceti:TauCeti.IsProP`.

## Layer ND.1: The distribution algebra D(G, K) of a compact p-adic Lie group

The distribution algebra is the dual of the function space of LocallyAnalyticDistributions L0, made into an algebra by pushing forward along the multiplication; nothing here re-builds the function spaces, and the convolution product itself is the one of LocallyAnalyticDistributions L1. The layer fixes the conventions that the rest of the roadmap depends on: the order of convolution, the sign of the Lie algebra embedding, the coefficient expansion in an ordered basis, and the decomposition over open subgroups that reduces general compact groups to p-valued ones.

**Targets of the layer.** For a compact locally L-analytic group G and K spherically complete, the strong dual D(G, K) of C^an(G, K) (LocallyAnalyticDistributions L0) with the convolution λ ∗ μ = m_*(λ ⊗ μ) of LocallyAnalyticDistributions L1, extended to L-analytic G and spherically complete K: an associative unital Fréchet algebra with dense Dirac distributions; the injective algebra map U(g_K) → D(G, K), x ↦ (f ↦ (d/dt) f(exp(tx))|₀); the rational Iwasawa algebra L[[G]] inside D(G, K) and the coefficient expansion Σ d_α b^α in an ordered basis; the free decomposition over open subgroups and crossed products; centrality of Z(g) for open subgroups of connected algebraic groups.

### The distribution algebra D(G, K) under convolution

**Target `LocallyAnalyticDistributionsPartII:ND.1/distribution-algebra` (construction).** Let ℚ_p ⊆ L ⊆ K be complete fields with L/ℚ_p finite and K spherically complete (for instance discretely valued), and G a compact locally L-analytic group with multiplication m : G × G → G. D(G, K) := C^an(G, K)′_b is the nuclear Fréchet space of LocallyAnalyticDistributions:L0/locally-analytic-dual-nuclear, and its product is the convolution of LocallyAnalyticDistributions:L1/distribution-convolution: λ ∗ μ := m_*(λ ⊗ μ), using D(G × G, K) ≅ D(G, K) ⊗̂ D(G, K); explicitly (λ ∗ μ)(f) = λ(g ↦ μ(h ↦ f(gh))), which equals the iterated integral μ(h ↦ λ(g ↦ f(gh))) written there. That layer constructs the product, its associativity and its unit for K finite over ℚ_p and G compact ℚ_p-analytic; the same construction runs over L and any spherically complete K. In this generality (D(G, K), ∗) is an associative unital K-algebra with unit δ_1, convolution is jointly continuous, so D(G, K) is a Fréchet algebra; δ_g ∗ δ_h = δ_{gh}, so g ↦ δ_g is a group homomorphism G → D(G, K)^×; the induced map K[G] → D(G, K) is injective with dense image. D(G, K) is commutative iff G is.

**Planet.** Distribution algebra D(G,K).

**Suggested home.** `TauCeti/NumberTheory/Padics/DistributionAlgebra/Basic`, namespace `TauCeti.DistributionAlgebra`.

**Hypotheses and conventions.**

- The convolution product itself is owned by LocallyAnalyticDistributions:L1/distribution-convolution and is not constructed again; what this node adds is the generality (locally L-analytic G, spherically complete K), joint continuity and the Fréchet-algebra structure, the Dirac homomorphism with injectivity and density, functoriality and the commutativity criterion.
- Compactness of G gives joint continuity; for a general locally analytic group D(G, K) is an algebra with separately continuous multiplication (ST02 Proposition 2.3), which this roadmap does not use.
- The first factor is paired with the left variable of the product gh. Integrating in the other order gives the same element (Fubini, through D(G × G) ≅ D(G) ⊗̂ D(G)); pairing the first factor with the right variable instead gives the opposite algebra, which the tests distinguish.

**Construction.**

1. The external product C^an(G) ⊗̂ C^an(G) ≅ C^an(G × G) (LocallyAnalyticDistributions:L0/locally-analytic-product) dualises to D(G × G) ≅ D(G) ⊗̂ D(G) (LocallyAnalyticDistributions:L0/locally-analytic-dual-nuclear), and m_* = (m^*)′ is continuous (LocallyAnalyticDistributions:L0/locally-analytic-pullback). The composite is the convolution of ST02 §2, p. 8, and for K finite over ℚ_p and L = ℚ_p it is LocallyAnalyticDistributions:L1/distribution-convolution; the stagewise construction there runs unchanged over L and any spherically complete K.
2. Associativity and the unit are part of LocallyAnalyticDistributions:L1/distribution-convolution; in the general setting they follow on Dirac distributions from associativity of m and extend by continuity and density of the span of Dirac distributions (ST02 Proposition 2.3, p. 9, and Lemma 3.1, p. 13).
3. Injectivity of K[G] → D(G, K): distinct points are separated by locally constant, hence locally analytic, functions. Density: a continuous linear form on D(G, K) vanishing on all δ_g is, by reflexivity, a locally analytic function vanishing everywhere (ST02 Lemma 3.1 and its proof).

**Needs.** `LocallyAnalyticDistributions:L0/locally-analytic-dual-nuclear`, `LocallyAnalyticDistributions:L1/distribution-convolution`, `LocallyAnalyticDistributions:L0/locally-analytic-product`, `LocallyAnalyticDistributions:L0/locally-analytic-pullback`, `LocallyAnalyticDistributions:L0/locally-analytic-function-space`, `LocallyAnalyticDistributionsPartII:ND.0/p-valued-analytic-structure`.

**API.**

- `TauCeti.DistributionAlgebra.D` (constructor): D(G, K) := C^an(G, K)′_b as a K-algebra under the convolution of LocallyAnalyticDistributions L1 (TauCeti.AnalyticDistributions.distributionConvolution), for a compact locally L-analytic group G.
- `TauCeti.DistributionAlgebra.convolution_apply` (simp): (λ ∗ μ)(f) = λ(g ↦ μ(h ↦ f(gh))) for f ∈ C^an(G, K).
- `TauCeti.DistributionAlgebra.dirac` (constructor): δ : G →* D(G, K)^×, with δ_g(f) = f(g).
- `TauCeti.DistributionAlgebra.dirac_mul_dirac` (simp): δ_g ∗ δ_h = δ_{gh} and δ_1 = 1.
- `TauCeti.DistributionAlgebra.continuous_mul` (instance): Convolution is jointly continuous; D(G, K) is a Fréchet K-algebra.
- `TauCeti.DistributionAlgebra.dense_span_dirac` (characterisation): The K-span of {δ_g} is dense; two continuous K-linear maps out of D(G, K) agreeing on Dirac distributions are equal.
- `TauCeti.DistributionAlgebra.map` (functoriality): A locally analytic homomorphism φ : G → H induces a continuous algebra map φ_* : D(G, K) → D(H, K) with φ_*δ_g = δ_{φ(g)}, (ψφ)_* = ψ_*φ_*, id_* = id.
- `TauCeti.DistributionAlgebra.comm_iff` (characterisation): D(G, K) is commutative iff G is commutative.

**Checks.**

- `dirac_mul_dirac_comm_iff` (computation): In D(G_1, ℚ_p) for the first congruence subgroup G_1 of SL_2(ℤ_p), δ_{exp(pe)} ∗ δ_{exp(pf)} ≠ δ_{exp(pf)} ∗ δ_{exp(pe)}, since the two group elements do not commute and g ↦ δ_g is injective.
- `distributionAlgebra_trivial` (degenerate): For G = {1}, D(G, K) = K with δ_1 = 1.
- `distributionAlgebra_finite` (compatibility): For a finite group G (a compact 0-dimensional analytic group), D(G, K) ≅ MonoidAlgebra K G, the group algebra, via δ_g ↦ single g 1.
- `convolution_order` (non-example): The rule (λ ∗^op μ)(f) = λ(g ↦ μ(h ↦ f(hg))) gives δ_a ∗^op δ_b = δ_{ba}: it is the opposite algebra, different from ∗ on δ_{exp(pe)}, δ_{exp(pf)} in D(G_1, ℚ_p), and for it x̃ ∗^op ỹ − ỹ ∗^op x̃ = −[x, y]~, so U(g_K) → D(G, K) would be an anti-homomorphism. By contrast μ(h ↦ λ(g ↦ f(gh))) equals (λ ∗ μ)(f) by Fubini.
- `convolution_eq_distributionConvolution` (compatibility): For K finite over ℚ_p and G compact ℚ_p-analytic, λ ∗ μ = TauCeti.AnalyticDistributions.distributionConvolution λ μ, the convolution of LocallyAnalyticDistributions L1, whose defining iterated integral μ(h ↦ λ(g ↦ f(gh))) agrees with λ(g ↦ μ(h ↦ f(gh))) by Fubini.

**Uses.**

- ST03 §§3–5 (ND.2): D(G, K) is the Fréchet algebra shown to be Fréchet–Stein, with Banach completions D_r(G, K).
- Fu Theorem 5.2 (ND.5/central-strong-duality): D(G, ℚ_p) is specialised along infinitesimal characters and compared with C^la(G, ℚ_p)[λ]′_b.
- ST03 §6 and the consumer LocallyAnalyticRepresentationsOfLocalGroups: admissible locally analytic representations are duals of coadmissible D(G, K)-modules.
- AW14 §3.3 and Theorem B: D(G, K) is a G-graded algebra containing the algebra of distributions supported at the identity.

**Acceptance.**

- For G = ℤ_p (additive, L = ℚ_p) D(G, K) is the commutative algebra of LocallyAnalyticDistributions:L0/locally-analytic-distributions, and the Amice transform carries convolution to multiplication of power series on the open disc (LocallyAnalyticDistributions L1).

**Sources.**

- Schneider–Teitelbaum (2002, JAMS), §2, construction of the convolution and Proposition 2.3, pp. 8–9: Defines convolution on D(G, K) as m_* composed with the completed tensor product of distributions, and proves that it is an associative unital algebra with unit δ_1, a Fréchet algebra for compact G.
- Schneider–Teitelbaum (2002, JAMS), §3, Lemma 3.1 with proof, p. 13: Shows that Dirac distributions span a dense subspace, using reflexivity and Hahn–Banach, and that D(G, K) = ⊕_{g∈G/H} δ_g ∗ D(H, K) for compact open H.
- Fu (2024), §4, p. 13: Recalls the K-Fréchet algebra D(G, K) of Schneider–Teitelbaum for a uniform G and its relation to K[[G]].
- Schneider–Teitelbaum (2002, JAMS), §2, p. 8, the separately continuous external product and m_*: Builds λ ⊗̂ μ ∈ D(G × G, K) with (λ ⊗̂ μ)(f_1 × f_2) = λ(f_1)μ(f_2), jointly continuous for compact G, and defines ∗ as m_* composed with it; this is the product that LocallyAnalyticDistributions L1 constructs stagewise.

### The enveloping algebra inside D(G, K)

**Target `LocallyAnalyticDistributionsPartII:ND.1/lie-algebra-in-distributions` (construction).** Let G be a compact locally L-analytic group with Lie algebra g (over L). For x ∈ g let x̃ ∈ D(G, K) be the distribution f ↦ (d/dt) f(exp(tx))|_{t=0}. The map x ↦ x̃ is L-linear and satisfies x̃ ∗ ỹ − ỹ ∗ x̃ = [x, y]~, so it extends to a K-algebra homomorphism U(g) ⊗_L K = U(g_K) → D(G, K), which is injective. For λ ∈ D(G, K), x̃ ∗ λ = lim_{t→0} t⁻¹(δ_{exp(tx)} − δ_1) ∗ λ in D(G, K). For g ∈ G, δ_g ∗ x̃ ∗ δ_{g⁻¹} = (Ad(g)x)~. Under the action of D(G, K) on C^an(G, K) by the contragredient of left translation, x̃ acts by the derivation f ↦ (d/dt) f(exp(−tx)·)|_{t=0}.

**Suggested home.** `TauCeti/NumberTheory/Padics/DistributionAlgebra/Basic`, namespace `TauCeti.DistributionAlgebra`.

**Hypotheses and conventions.**

- The sign is fixed by x̃(f) = (d/dt) f(exp(tx))|₀ on the identity; Fu writes the Lie action on functions by (22) with t·x the ℤ_p-scaling of the Lazard lattice, which is the same distribution for x ∈ g_{ℤ_p}.

**Construction.**

1. x̃ = x·δ_1 for the derivative action of g on distributions (ST02 §2, p. 12), and the limit formula holds in C^an(G, K)′_s, hence in D(G, K) because bounded sets of the reflexive space are contained in c-compact ones on which the weak and strong topologies agree (ST02 p. 12).
2. The commutator relation follows from the limit formula and the Campbell–Hausdorff expansion exp(tx)exp(sy)exp(−tx)exp(−sy) = exp(ts[x, y] + O(t²s, ts²)); the universal property of U(g) (Mathlib UniversalEnvelopingAlgebra.lift) gives the algebra map.
3. Injectivity: pairing with polynomial functions in a chart at 1 computes the PBW coefficients (the distributions supported at 1 are dual to germs of analytic functions, and the monomials x^α pair nondegenerately with coordinate monomials), using the PBW basis theorem of LieHighestWeight Layer 3.
4. Conjugation: δ_g ∗ x̃ ∗ δ_{g⁻¹}(f) = (d/dt) f(g exp(tx) g⁻¹)|₀ = (Ad(g)x)~(f) (Fu, proof of Proposition 5.3, p. 17, in the language of functions).

**Needs.** `LocallyAnalyticDistributionsPartII:ND.1/distribution-algebra`, `LocallyAnalyticDistributionsPartII:ND.0/lazard-lie-lattice`, `mathlib:UniversalEnvelopingAlgebra`, `mathlib:UniversalEnvelopingAlgebra.lift`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ`.

**API.**

- `TauCeti.DistributionAlgebra.ofLie` (constructor): x ↦ x̃ : g → D(G, K), x̃(f) = (d/dt) f(exp(tx))|₀.
- `TauCeti.DistributionAlgebra.ofLie_lie` (relation): x̃ ∗ ỹ − ỹ ∗ x̃ = [x, y]~.
- `TauCeti.DistributionAlgebra.envelopingHom` (universal-property): The K-algebra map U(g_K) → D(G, K) extending ofLie, via UniversalEnvelopingAlgebra.lift.
- `TauCeti.DistributionAlgebra.envelopingHom_injective` (characterisation): U(g_K) → D(G, K) is injective.
- `TauCeti.DistributionAlgebra.ofLie_eq_lim` (characterisation): x̃ ∗ λ = lim_{t→0} t⁻¹(δ_{exp(tx)} − δ_1) ∗ λ.
- `TauCeti.DistributionAlgebra.dirac_conj_ofLie` (relation): δ_g ∗ x̃ ∗ δ_{g⁻¹} = (Ad(g)x)~.
- `TauCeti.DistributionAlgebra.map_ofLie` (functoriality): For a locally analytic homomorphism φ, φ_*(x̃) = (dφ(x))~.

**Checks.**

- `ofLie_padicInt` (computation): For G = ℤ_p (L = ℚ_p) and x = 1, x̃(f) = f′(0); on f(z) = z² + 3z it takes the value 3.
- `ofLie_zero` (degenerate): 0̃ = 0, and for a finite group (g = 0) envelopingHom is the inclusion K → D(G, K).
- `ofLie_sl2_commutator` (computation): For G = G_1 ⊂ SL_2(ℤ_p) (p odd), ẽ ∗ f̃ − f̃ ∗ ẽ = h̃ and h̃ ∗ ẽ − ẽ ∗ h̃ = 2ẽ in D(G, ℚ_p).
- `ofLie_not_dirac` (non-example): For G = ℤ_p, x̃ is not in the span of Dirac distributions nor a bounded measure: its Amice transform log(1 + T) is unbounded on the open disc.

**Uses.**

- Fu §5 and Kohlhaase §1.4 (ND.3/radius-enveloping-closure): U_r(g) is the closure of the image of U(g) in D_r(G, K).
- ST02 Proposition 3.7 (ND.1/central-enveloping-distributions): the image of Z(g) is central in D(G, K).
- Fu Theorem 5.2 (ND.5/infinitesimal-character-quotients): D(G, ℚ_p) is specialised along a character of Z(g) through this map.

**Acceptance.**

- For G = ℤ_p and x = 1 ∈ Lie(ℤ_p) = ℚ_p, x̃(f) = f′(0); its Amice transform is log(1 + T) (LocallyAnalyticDistributions convention 5).

**Sources.**

- Schneider–Teitelbaum (2002, JAMS), §2, the derivative action and the limit formula, p. 12: Defines the action of g on distributions, identifies the image of x with x·δ_1 and proves x·λ = (x·δ_1) ∗ λ via the limit formula in D(G, K).
- Fu (2024), §5, equations (22)–(23), p. 15, and the proof of Proposition 5.3, p. 17: Writes the Lie action on C^la(G, ℚ_p) by difference quotients along t·x, the inclusion U(g) → D(G, ℚ_p), and the conjugation identity g(x·(g⁻¹f)) = (gxg⁻¹)·f.

### The rational Iwasawa algebra K[[G]] inside D(G, K)

**Target `LocallyAnalyticDistributionsPartII:ND.1/iwasawa-to-distributions` (construction).** Let G be a compact locally ℚ_p-analytic group, o_L the integers of a finite extension L ⊆ K. Let o_L[[G]] = lim_N o_L[G/N] (N open normal) be the completed group ring of PadicMeasuresIwasawaAlgebras L1 (the integral measures on G), and L[[G]] := L ⊗_{o_L} o_L[[G]] (the bounded L-valued measures). Restricting a measure to locally analytic test functions defines an injective continuous K-algebra-compatible map L[[G]] → D(G, K), extending g ↦ δ_g; its image is dense. When (G, ω) is p-valued with an ordered basis h_1, …, h_d and b_i = h_i − 1, b^α = b_1^{α_1} ⋯ b_d^{α_d} (ordered product), every λ ∈ D(G, K) has a unique convergent expansion λ = Σ_α d_α b^α with d_α ∈ K and sup_α |d_α| r^{τ_α} < ∞ for every 0 < r < 1, where τ_α = Σ_i α_i ω(h_i); conversely every such series converges in D(G, K). The coefficient d_α is the α-th Mahler coefficient pairing: b^α(f) = c_α(ψ^*f), so d_α is determined by λ on the Mahler basis binom(x, α) in the coordinates ψ. A distribution lies in ℤ_p[[G]] iff all d_α ∈ ℤ_p, and in L[[G]] iff the d_α lie in L and are bounded.

**Suggested home.** `TauCeti/NumberTheory/Padics/DistributionAlgebra/Basic`, namespace `TauCeti.DistributionAlgebra`.

**Hypotheses and conventions.**

- The coefficient description uses the chart ψ of ND.0/ordered-basis-chart; it depends on the ordered basis, but the norms built from it do not (ND.2/banach-steps).
- L[[G]] is not lim_N L[G/N]: bounded measures are o_L[[G]][1/p] (PadicMeasuresIwasawaAlgebras L1).

**Construction.**

1. Bounded measures are continuous linear forms on C(G, L); restriction to C^an(G, K) is continuous and injective because locally constant functions are dense in C(G, L) and are locally analytic (LocallyAnalyticDistributions:L0/locally-analytic-function-space). Multiplicativity holds on Dirac measures and extends by density and continuity.
2. Expansion: via ψ, C(G, K) ≅ C(ℤ_p^d, K) has the Mahler basis binom(x, α), and Amice's theorem identifies the analytic functions with Mahler expansions satisfying |c_α| r^{|α|} → 0 for some r > 1 (ST03 p. 16, citing Lazard III.1.3.9). The finite-difference computation gives b^α(f) = c_α(ψ^*f). Duality then gives the coefficient description of distributions (ST03 pp. 16–17).
3. Integrality: ℤ_p[[G]] is the set of series with ℤ_p-coefficients (ST03 p. 17, citing Lazard III.2.3; also AW13 §10.3 for uniform G, from DDMS Theorem 7.20).

**Needs.** `LocallyAnalyticDistributionsPartII:ND.1/distribution-algebra`, `PadicMeasuresIwasawaAlgebras:L1`, `PadicMeasuresIwasawaAlgebras:L0`, `LocallyAnalyticDistributionsPartII:ND.0/ordered-basis-chart`, `LocallyAnalyticDistributions:L0/amice-mahler-basis`, `LocallyAnalyticDistributions:L0/locally-analytic-function-space`, `mathlib:AbstractMeasure`.

**API.**

- `TauCeti.DistributionAlgebra.ofMeasure` (constructor): L[[G]] → D(G, K), restriction of a bounded measure to locally analytic test functions.
- `TauCeti.DistributionAlgebra.ofMeasure_injective` (characterisation): ofMeasure is injective.
- `TauCeti.DistributionAlgebra.ofMeasure_mul` (simp): ofMeasure(μ ∗ ν) = ofMeasure μ ∗ ofMeasure ν and ofMeasure δ_g = δ_g.
- `TauCeti.DistributionAlgebra.coeff` (data): d_α(λ) ∈ K, the coefficient of b^α, for a chosen ordered basis.
- `TauCeti.DistributionAlgebra.hasSum_coeff` (characterisation): λ = Σ_α d_α(λ) b^α in D(G, K), and a family (d_α) arises iff sup_α |d_α| r^{τ_α} < ∞ for all r < 1.
- `TauCeti.DistributionAlgebra.coeff_eq_mahler` (compatibility): b^α(f) = c_α(ψ^* f), the Mahler coefficient in the chart ψ.
- `TauCeti.DistributionAlgebra.mem_range_ofMeasure_iff` (characterisation): λ comes from ℤ_p[[G]] iff all d_α ∈ ℤ_p, and from L[[G]] iff every d_α lies in L and (d_α) is bounded.

**Checks.**

- `coeff_dirac_generator` (computation): For an ordered basis element h_i, δ_{h_i} = 1 + b_i, so d_0 = 1, d_{e_i} = 1 and all other coefficients vanish.
- `ofMeasure_trivial_group` (degenerate): For G = {1}, L[[G]] = L and ofMeasure is the inclusion L → K.
- `ofMeasure_padicInt_compat` (compatibility): For G = ℤ_p the composite of ofMeasure with the Amice transform is Mathlib's AbstractMeasure.amiceTransform on integral measures (via PadicMeasuresIwasawaAlgebras L2).
- `log_not_bounded_coeff` (non-example): For G = ℤ_p the distribution with coefficients d_n = (−1)^{n+1}/n (Amice transform log(1 + T)) is in D(G, ℚ_p) but not in ℚ_p[[G]], since its coefficients are unbounded.

**Uses.**

- ST03 Theorem 4.11 (ND.2/faithful-flatness): L[[G]] → D(G, K) is faithfully flat.
- Fu Theorem 5.2 (ND.5/eigenspace-density-injectivity): injectivity of ℚ_p[[G]] → D(G, ℚ_p)_λ is proved by duality with C(G, ℚ_p).
- ST03 §4 (ND.2/banach-steps): the norms ‖·‖_r are defined on the coefficients d_α.

**Acceptance.**

- For G = ℤ_p, d_n(λ) = λ(binom(x, n)), the coefficients of the Amice transform (LocallyAnalyticDistributions convention 5), and ℤ_p[[G]] = ℤ_p[[T]] with T = δ_1 − 1.

**Sources.**

- Schneider–Teitelbaum (2003), §4, pp. 15–17: Expands every λ ∈ D(G, K) uniquely as Σ d_α b^α with the stated growth, identifies b^α(f) with Mahler coefficients, embeds ℤ_p[[G]] into D(G, K) as the series with ℤ_p-coefficients, and defines K[[G]] := K ⊗_{ℚ_p} ℤ_p[[G]] (p. 18).
- Fu (2024), §4, displays following (13) and (14), p. 13: Describes R[[G]] as noncommutative power series in b_1, …, b_d and D(G, K) as power series with the stated convergence.
- Ardakov–Wadsley (2013), §10.3, the identification of RG with power series, p. 69: Identifies R[[G]] with noncommutative formal power series in b_i with coefficients in R, from the proof of DDMS Theorem 7.20.

### Finite free decomposition over an open subgroup

**Target `LocallyAnalyticDistributionsPartII:ND.1/open-subgroup-decomposition` (theorem).** Let G be a compact locally L-analytic group and H ⊆ G an open subgroup with coset representatives g_1 = 1, …, g_l of G/H. Then D(G, K) = ⊕_{i} δ_{g_i} ∗ D(H, K) = ⊕_i D(H, K) ∗ δ_{g_i}: D(G, K) is a free left and right D(H, K)-module of rank [G : H] with basis the δ_{g_i}, and the decomposition is topological (D(G, K) ≅ D(H, K)^l). If H is normal, conjugation by δ_g preserves D(H, K) and D(G, K) is the crossed product D(H, K) ∗ (G/H) in the sense of McConnell–Robson §1.5.8: a free D(H, K)-module on units ḡ, ḡ ∈ G/H, with ḡ D(H, K) = D(H, K) ḡ and ḡ h̄ ∈ D(H, K)^× · (gh)‾.

**Suggested home.** `TauCeti/NumberTheory/Padics/DistributionAlgebra/Basic`, namespace `TauCeti.DistributionAlgebra`.

**Proof.**

1. G is the disjoint union of the open cosets g_iH, so C^an(G, K) = Π_i C^an(g_iH, K) topologically (LocallyAnalyticDistributions:L0/locally-analytic-function-space), and translation by g_i identifies C^an(g_iH, K) with C^an(H, K); dualising gives the decomposition (ST02 proof of Lemma 3.1, p. 13; ST03 Theorem 5.1, step 1, p. 29).
2. For normal H, δ_g ∗ D(H, K) ∗ δ_{g⁻¹} = D(H, K) because conjugation by g is an analytic automorphism of H; the crossed product axioms follow with twisting δ_{g_i} δ_{g_j} = δ_{h_{ij}} δ_{g_k}, h_{ij} ∈ H.

**Needs.** `LocallyAnalyticDistributionsPartII:ND.1/distribution-algebra`, `LocallyAnalyticDistributions:L0/locally-analytic-function-space`.

**Acceptance.**

- For G = ℤ_p and H = pℤ_p, D(ℤ_p, K) = ⊕_{a=0}^{p−1} δ_a ∗ D(pℤ_p, K); under the Amice transform this is the decomposition of power series by residue classes.

**Sources.**

- Schneider–Teitelbaum (2002, JAMS), §3, proof of Lemma 3.1, p. 13: States D(G, K) = ⊕_{g∈G/H} δ_g ∗ D(H, K) for a compact open subgroup H.
- Schneider–Teitelbaum (2003), §5, proof of Theorem 5.1, Step 1, pp. 29–30: Uses that the Dirac distributions of coset representatives form a basis of D(G_0, K) as a left D(H_0, K)-module, with D(G_0, K) topologically isomorphic to D(H_0, K)^l.
- Ardakov–Wadsley (2013), §10.6, the crossed-product definition, p. 72: Recalls the definition of a crossed product S ∗ H of a ring by a group, with its action and twisting.

### The centre of U(g) is central in D(G, K)

**Target `LocallyAnalyticDistributionsPartII:ND.1/central-enveloping-distributions` (theorem).** Let G be an open (compact) subgroup of the group G(L) of L-rational points of a connected linear algebraic group G over L, with Lie algebra g. Then the image of Z(g) ⊗_L K under U(g_K) → D(G, K) lies in the centre of D(G, K). Consequently, for every g ∈ G and z ∈ Z(g), z commutes with δ_g, and z acts on C^an(G, K) by G-equivariant continuous endomorphisms for both the left and the right translation action.

**Planet.** Centrality of Z(g) in D(G,K).

**Suggested home.** `TauCeti/NumberTheory/Padics/DistributionAlgebra/Basic`, namespace `TauCeti.DistributionAlgebra`.

**Hypotheses and conventions.**

- Connectedness of G is essential: for a disconnected group the adjoint action of G(L) on U(g) need not fix Z(g) (for G = O(2), where U(so(2)) = Z(so(2)) = K[x], an element of determinant −1 sends x to −x, so x is not central in D(O(2)(L) ∩ GL_2(o_L), K)).

**Proof.**

1. By density of Dirac distributions (ND.1/distribution-algebra) it suffices to show δ_g ∗ z ∗ δ_{g⁻¹} = z, i.e. that the adjoint action of G(L) on U(g) fixes Z(g); by ND.1/lie-algebra-in-distributions δ_g ∗ x̃ ∗ δ_{g⁻¹} = (Ad(g)x)~ on generators.
2. For connected G the adjoint action of G(L) fixes Z(g) (ST02 Proposition 3.7, p. 16, citing Bourbaki and Demazure–Gabriel II §6.1.5); the equivariance on functions follows by transposition.

**Needs.** `LocallyAnalyticDistributionsPartII:ND.1/lie-algebra-in-distributions`, `LocallyAnalyticDistributionsPartII:ND.1/distribution-algebra`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-7-the-center-of-ul-harish-chandra-freudenthal-and-serres-relations`.

**Acceptance.**

- For G = G_1 ⊂ SL_2(ℤ_p) (p odd) the Casimir Δ = ½h² − h + 2ef is central in D(G_1, ℚ_p).

**Sources.**

- Schneider–Teitelbaum (2002, JAMS), §3, Proposition 3.7 and its proof, p. 16: Proves that for G open in the L-points of a connected algebraic group, Z(g) ⊗ K lies in the centre of D(G, K), by density of Dirac distributions and invariance of Z(g) under the adjoint action.
- Fu (2024), §5, proof of Theorem 5.2, p. 16: Uses this centrality to make the generators of the kernel of λ act by G-equivariant endomorphisms of C^la(G, ℚ_p).

### Dependencies

Within this roadmap: Layer ND.0.

On other roadmaps and the libraries: `LocallyAnalyticDistributions:L0/amice-mahler-basis`, `LocallyAnalyticDistributions:L0/locally-analytic-dual-nuclear`, `LocallyAnalyticDistributions:L0/locally-analytic-function-space`, `LocallyAnalyticDistributions:L0/locally-analytic-product`, `LocallyAnalyticDistributions:L0/locally-analytic-pullback`, `LocallyAnalyticDistributions:L1/distribution-convolution`, `PadicMeasuresIwasawaAlgebras:L0`, `PadicMeasuresIwasawaAlgebras:L1`, `mathlib:AbstractMeasure`, `mathlib:UniversalEnvelopingAlgebra`, `mathlib:UniversalEnvelopingAlgebra.lift`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-7-the-center-of-ul-harish-chandra-freudenthal-and-serres-relations`.

## Layer ND.2: Fréchet–Stein algebras, coadmissible modules and the Banach steps D_r(G, K)

Fréchet–Stein algebras are the analytic replacement for noetherian rings: a coadmissible module is a compatible system of finitely generated modules over noetherian Banach algebras, and Theorems A and B make these an abelian category. The Banach steps D_r(G, K) are the completions for the norms of ND.1; their graded rings are commutative polynomial rings, which gives noetherianity at rational radii and flat transitions, hence the Fréchet–Stein property of D(G, K) for every compact locally L-analytic group.

**Targets of the layer.** Schneider–Teitelbaum's Fréchet–Stein algebras and coadmissible modules with Theorems A and B, base change, the abelian category of coadmissible modules and the closedness criterion; the norms ‖·‖_r = sup |d_α| r^{τ_α}, 1/p ≤ r < 1, and the Banach steps D_r(G, K) (weighted coefficients tending to zero, distinct from the bounded D_{<r}); graded rings, multiplicativity and noetherianity for r ∈ p^ℚ; flat transitions and the Fréchet–Stein property of D(G, K) for every compact locally L-analytic G; faithful flatness of D(G, K) over L[[G]].

### Fréchet–Stein algebras

**Target `LocallyAnalyticDistributionsPartII:ND.2/frechet-stein-algebra` (definition).** Let K be a complete nonarchimedean field. A K-Fréchet algebra is an associative unital K-algebra A with a Fréchet topology for which multiplication is continuous. For a continuous seminorm q on A let A_q be the completion of A/{q = 0}; q is an algebra seminorm if q(ab) ≤ c q(a) q(b) for some c > 0, and then A_q is a K-Banach algebra and A → A_q an algebra map with dense image. A is a (left) K-Fréchet–Stein algebra if there is an increasing sequence q_1 ≤ q_2 ≤ … of continuous algebra seminorms defining the topology such that, for every n, (i) A_{q_n} is left noetherian, and (ii) A_{q_n} is flat as a right A_{q_{n+1}}-module via the transition map. Then A ≅ lim_n A_{q_n} as Fréchet algebras.

**Planet.** Fréchet–Stein algebra.

**Suggested home.** `TauCeti/Analysis/Normed/FrechetStein`, namespace `TauCeti.FrechetStein`.

**Hypotheses and conventions.**

- Flatness is on the side that makes A_{q_n} ⊗_{A_{q_{n+1}}} (−) exact on left modules; two-sided Fréchet–Stein means both one-sided conditions.

**Construction.**

1. The limit isomorphism holds for any defining increasing sequence of seminorms, and algebra seminorms make the transitions algebra maps (ST03 §3, pp. 7–8).

**Needs.** `LocallyAnalyticDistributions:L0/nonarchimedean-locally-convex-spaces`, `LocallyAnalyticDistributions:L0/locally-convex-limits`, `mathlib:IsNoetherianRing`, `mathlib:Module.Flat`.

**API.**

- `TauCeti.FrechetStein.banachCompletion` (constructor): A_q, the Hausdorff completion of A for an algebra seminorm q, with the dense algebra map A → A_q.
- `TauCeti.FrechetStein.IsFrechetStein` (structure): An increasing sequence of continuous algebra seminorms defining the topology with left noetherian completions and right-flat transitions.
- `TauCeti.FrechetStein.limEquiv` (equivalence): A ≅ lim_n A_{q_n} as topological K-algebras.
- `TauCeti.FrechetStein.of_cofinal` (characterisation): Being Fréchet–Stein is witnessed by any cofinal subsequence; coadmissibility does not depend on the chosen sequence.
- `TauCeti.FrechetStein.isNoetherian_of_banach` (example): A left noetherian K-Banach algebra is Fréchet–Stein with the constant sequence.

**Checks.**

- `frechetStein_banach_field` (degenerate): K itself, with its norm as the constant sequence, is a Fréchet–Stein algebra.
- `frechetStein_entire` (computation): The algebra 𝒪(𝔸¹) of entire series Σ a_n T^n (|a_n| R^n → 0 for all R) over a discretely valued K is Fréchet–Stein for the Gauss norms at R = p^n: each completion is a Tate algebra, noetherian, and the restriction maps between Tate algebras of nested discs are flat.
- `frechetStein_distributions_padicInt` (compatibility): For G = ℤ_p, D(ℤ_p, K) with the norms ‖·‖_r, r = p^{−1/p^n}, is Fréchet–Stein, matching under the Amice transform the Fréchet–Stein algebra of functions on the open unit disc (LocallyAnalyticDistributions L1).
- `not_frechetStein_formalPowerSeries` (non-example): The formal power series ring K[[T]] with the coefficientwise topology is a noetherian Fréchet algebra (the limit of the finite-dimensional K[T]/(T^n)) but not Fréchet–Stein: every continuous algebra seminorm factors through some K[T]/(T^m), and K[T]/(T^a) is not flat over K[T]/(T^b) for a < b (a flat module over an Artinian local ring is free, and dim_K K[T]/(T^a) = a < b).

**Uses.**

- ST03 Theorems 4.10 and 5.1 (ND.2/frechet-stein-distribution): D(G, K) is a K-Fréchet–Stein algebra.
- BCGP §2.2.29–2.2.31 (ND.3/arens-michael-envelope): the Arens–Michael envelope 𝒰(g) = lim_r U(g)_r is Fréchet–Stein and has coadmissible modules.
- ST03 Proposition 3.7 (ND.5/infinitesimal-character-quotients): quotients of D(G, K) by closed two-sided ideals, such as central specialisations, are Fréchet–Stein.

**Acceptance.**

- A K-Banach algebra that is left noetherian is Fréchet–Stein with the constant sequence; the tests below exhibit the nondegenerate case.

**Sources.**

- Schneider–Teitelbaum (2003), §3, the opening paragraphs and the Definition, pp. 7–8: Defines K-Fréchet algebras, the Banach completions A_q, algebra seminorms, and Fréchet–Stein algebras by noetherian completions with flat transitions.

### Coherent sheaves and coadmissible modules

**Target `LocallyAnalyticDistributionsPartII:ND.2/coadmissible-module` (definition).** Let A be a K-Fréchet–Stein algebra with defining sequence (q_n). A coherent sheaf for (A, (q_n)) is a family (M_n)_n of finitely generated left A_{q_n}-modules with A_{q_n}-linear isomorphisms A_{q_n} ⊗_{A_{q_{n+1}}} M_{n+1} ≅ M_n; morphisms are compatible families. Its global sections are Γ(M_n) := lim_n M_n, a left A-module. A left A-module is coadmissible if it is isomorphic to Γ(M_n) for some coherent sheaf. The full subcategory 𝒞_A of Mod(A) of coadmissible modules does not depend on the defining sequence. A coadmissible module carries its canonical topology, the projective limit of the canonical Banach topologies of the finitely generated A_{q_n}-modules M_n; it is a K-Fréchet space with continuous A-action.

**Planet.** Coadmissible module.

**Suggested home.** `TauCeti/Analysis/Normed/FrechetStein`, namespace `TauCeti.FrechetStein`.

**Hypotheses and conventions.**

- Left modules throughout. The transition isomorphisms are A_{q_n} ⊗_{A_{q_{n+1}}} M_{n+1} ≅ M_n with the Banach algebra on the left; BCGP Definition 2.2.31 writes the tensor factors in the opposite order (recorded under sourceIssues).

**Construction.**

1. Independence of the sequence is a cofinality argument (ST03 p. 8). The canonical topology on a finitely generated module over a noetherian Banach algebra is the quotient topology from any finite free presentation (ST03 Proposition 2.1, p. 6).

**Needs.** `LocallyAnalyticDistributionsPartII:ND.2/frechet-stein-algebra`.

**API.**

- `TauCeti.FrechetStein.CoherentSheaf` (structure): Finitely generated A_{q_n}-modules M_n with the transition isomorphisms.
- `TauCeti.FrechetStein.CoherentSheaf.Γ` (constructor): Global sections lim_n M_n as a left A-module.
- `TauCeti.FrechetStein.IsCoadmissible` (data): M is coadmissible if M ≅ Γ(M_n) for a coherent sheaf.
- `TauCeti.FrechetStein.isCoadmissible_iff_of_cofinal` (characterisation): Coadmissibility is independent of the defining sequence.
- `TauCeti.FrechetStein.canonicalTopology` (instance): The canonical Fréchet topology on a coadmissible module; A × M → M is continuous.
- `TauCeti.FrechetStein.isCoadmissible_self` (example): A is coadmissible as a left A-module.

**Checks.**

- `isCoadmissible_zero` (degenerate): The zero module is coadmissible (the zero sheaf).
- `isCoadmissible_banach` (compatibility): For A a left noetherian Banach algebra with the constant sequence, the coadmissible modules are exactly the finitely generated A-modules.
- `isCoadmissible_entire_quotient` (computation): Over A = 𝒪(𝔸¹), the module A/(T − a) ≅ K is coadmissible for every a ∈ K, with M_n = K for all n with |a| ≤ p^n and M_n = 0 before.
- `not_isCoadmissible_direct_sum` (non-example): Over A = 𝒪(𝔸¹) and the points a_k = p^{−k} (so |a_k| = p^k), the product M = Π_k A/(T − a_k) ≅ Π_k K is coadmissible (M_n is the finite sum over the a_k in the disc of radius p^n), but the submodule ⊕_k A/(T − a_k) of finitely supported families is dense and not closed in the canonical topology, hence not coadmissible.

**Uses.**

- ST03 §6, Theorem 6.3: admissible locally analytic representations correspond to coadmissible D(G, K)-modules by strong duality (consumer: LocallyAnalyticRepresentationsOfLocalGroups).
- Fu proof of Theorem 5.2 (ND.5/central-strong-duality): D(G, ℚ_p)_λ is a coadmissible quotient of D(G, ℚ_p).
- BCGP §2.2.31–2.2.36: coadmissible 𝒰(g)-modules and their solid realisation (the solid realisation is planned by the split-off solid functional-analysis Part II).

**Acceptance.**

- Finitely presented A-modules are coadmissible (ND.2/coadmissible-theorems); A itself corresponds to the coherent sheaf (A_{q_n}).

**Sources.**

- Schneider–Teitelbaum (2003), §3, Definitions of coherent sheaves and coadmissible modules, p. 8, and the canonical topology, p. 11: Defines coherent sheaves (M_n) with A_{q_n} ⊗ M_{n+1} ≅ M_n, global sections lim M_n, coadmissible modules, the category 𝒞_A and the canonical Fréchet topology.
- Boxer–Calegari–Gee–Pilloni (2025), §2.2, Definition 2.2.31, p. 24: Defines coadmissible modules over the Arens–Michael envelope Û(g) by finitely generated modules over its Banach completions.

### Theorems A and B and the abelian category of coadmissible modules

**Target `LocallyAnalyticDistributionsPartII:ND.2/coadmissible-theorems` (theorem).** Let A be a K-Fréchet–Stein algebra, (M_n) a coherent sheaf and M = Γ(M_n). (A) For every n the map M → M_n has dense image for the canonical topology. (B) lim^{(i)}_n M_n = 0 for all i ≥ 1; hence Γ is exact. Consequences: A_{q_n} ⊗_A M ≅ M_n for every n; A_{q_n} is flat as a right A-module; Γ : Coh(A, (q_n)) → 𝒞_A is an equivalence; 𝒞_A is an abelian subcategory of Mod(A), closed under finite direct sums, kernels, cokernels, images, sums of coadmissible submodules and finitely generated submodules; finitely presented A-modules are coadmissible. For a submodule N of a coadmissible M: N is coadmissible ⇔ M/N is coadmissible ⇔ N is closed in the canonical topology. Every A-linear map between coadmissible modules is continuous and strict; every finitely generated left ideal of A is closed. If I ⊆ A is a closed two-sided ideal, A/I is a K-Fréchet–Stein algebra with defining completions A_{q_n}/A_{q_n}I and A/I ≅ lim_n A_{q_n}/A_{q_n}I. If A → B is a continuous algebra map of Fréchet–Stein algebras with B coadmissible over A, a B-module is coadmissible over B iff over A.

**Planet.** Theorems A and B for coadmissible modules.

**Suggested home.** `TauCeti/Analysis/Normed/FrechetStein`, namespace `TauCeti.FrechetStein`.

**Proof.**

1. (A): for m > n choose a surjection A_{q_m}^r → M_m; the image of A_{q_m}^r in A_{q_n}^r is dense, and all maps are continuous for canonical topologies (ST03 Proposition 2.1.iii), so M_m → M_n has dense image; conclude by the Mittag-Leffler argument of Bourbaki (ST03 p. 9).
2. (B) follows from (A) by EGA III 0.13.2.4 (ST03 p. 9). Corollaries 3.1, 3.3, 3.4 and 3.5 and Remark 3.2 are formal consequences (ST03 pp. 9–11).
3. Closed ⇔ coadmissible: the closure of N is Γ(N_n) for the images N_n ⊆ M_n (ST03 Lemma 3.6). Continuity and strictness use the open mapping theorem for Fréchet spaces (LocallyAnalyticDistributions:L0/banach-open-mapping-lifts).
4. Quotients by closed two-sided ideals: ST03 Proposition 3.7, using flat base change for the transitions; restriction along A → B: ST03 Lemma 3.8.

**Needs.** `LocallyAnalyticDistributionsPartII:ND.2/coadmissible-module`, `LocallyAnalyticDistributionsPartII:ND.2/frechet-stein-algebra`, `LocallyAnalyticDistributions:L0/banach-open-mapping-lifts`, `LocallyAnalyticDistributions:L0/strict-morphisms-quasi-abelian`.

**Acceptance.**

- For A = D(G, K) and M = A/A(z − λ(z))_{z} for finitely many central z (ND.5/infinitesimal-character-quotients), Proposition 3.7 gives D(G, K)_λ ≅ lim_n D_{r_n}(G, K)_λ, which is Fu Proposition 5.5.

**Sources.**

- Schneider–Teitelbaum (2003), §3, Theorem (A and B), p. 9; Corollary 3.1, p. 9; Remark 3.2 and Corollaries 3.3–3.4, p. 10; Corollary 3.5, Lemma 3.6 and Proposition 3.7, pp. 11–12; Lemma 3.8, p. 12: Proves Theorems A and B for coherent sheaves, the base change isomorphism, flatness of A_{q_n} over A, the equivalence with coherent sheaves, the abelian category of coadmissible modules, the closedness criterion, strictness of maps, and that quotients by closed two-sided ideals are Fréchet–Stein.

### The norms ‖·‖_r and the Banach steps D_r(G, K)

**Target `LocallyAnalyticDistributionsPartII:ND.2/banach-steps` (construction).** Let K ⊆ ℂ_p be complete and discretely valued, |p| = 1/p, and let (G, ω) be a compact p-valued group with rational-valued ω and ordered basis (h_1, …, h_d), b_i = h_i − 1, τ_α = Σ α_i ω(h_i). For 1/p ≤ r < 1 and λ = Σ d_α b^α ∈ D(G, K) put ‖λ‖_r := sup_α |d_α| r^{τ_α}. Then ‖·‖_r is a norm on D(G, K), submultiplicative for 1/p ≤ r < 1, independent of the ordered basis (for fixed ω), the family (‖·‖_r)_{1/p≤r<1} defines the Fréchet topology, and ‖δ_g‖_r = 1. D_r(G, K) is the completion: the K-Banach algebra of all series Σ d_α b^α with |d_α| r^{τ_α} → 0 as |α| → ∞. The larger space D_{<r}(G, K) of series with sup_α |d_α| r^{τ_α} < ∞ (bounded, not tending to zero) is distinct from D_r(G, K); for r′ < r one has D_r ⊆ D_{<r} ⊆ D_{r′}, so lim_r D_r = lim_r D_{<r} = D(G, K) although at a fixed radius the two differ. When G is uniform with the integral p-valuation of ND.0/uniform-groups-p-valued, τ_α = |α| and ‖λ‖_r = sup |d_α| r^{|α|}, which is Fu's norm.

**Planet.** Banach steps D_r(G,K).

**Suggested home.** `TauCeti/NumberTheory/Padics/DistributionAlgebra/BanachSteps`, namespace `TauCeti.DistributionAlgebra`.

**Hypotheses and conventions.**

- Submultiplicativity needs r ≥ 1/p (ST03 Lemma 4.1.ii); below 1/p the expansions of b_βb_γ have coefficients that can increase the norm.
- Fu's display (16) describes D_r by bounded coefficients; that is D_{<r}, not the completion (sourceIssues).

**Construction.**

1. The structure constants b_βb_γ = Σ c_{βγ,α} b^α lie in ℤ_p with v_p(c_{βγ,α}) ≥ τ_β + τ_γ − τ_α, because ‖·‖_{1/p} is multiplicative on ℤ_p[[G]] (Lazard III.2.3, cited in ST03 p. 17); hence |c_{βγ,α}| r^{τ_α} ≤ r^{τ_β+τ_γ} for 1/p ≤ r ≤ 1 (ST03 Lemma 4.1) and ‖λμ‖_r ≤ ‖λ‖_r‖μ‖_r (ST03 Proposition 4.2).
2. The completion is described by the c₀ condition because finite sums are dense for ‖·‖_r and the coefficient functionals are continuous (ST03 p. 18).
3. Independence of the ordered basis: expanding one basis in the other, v_p(c_{β,α}) ≥ max(0, τ′_β − τ_α), which gives the two inequalities of norms (ST03 p. 25).
4. D_r ⊆ D_{<r} is trivial; D_{<r} ⊆ D_{r′} for r′ < r because |d_α| r′^{τ_α} = |d_α| r^{τ_α}(r′/r)^{τ_α} → 0. The example of the tests shows D_r ≠ D_{<r}.

**Needs.** `LocallyAnalyticDistributionsPartII:ND.1/iwasawa-to-distributions`, `LocallyAnalyticDistributionsPartII:ND.0/p-valuation`, `LocallyAnalyticDistributionsPartII:ND.0/uniform-groups-p-valued`, `mathlib:IsUltrametricDist`, `mathlib:UniformSpace.Completion`.

**API.**

- `TauCeti.DistributionAlgebra.normR` (data): ‖Σ d_α b^α‖_r = sup_α |d_α| r^{τ_α}.
- `TauCeti.DistributionAlgebra.normR_mul_le` (relation): ‖λμ‖_r ≤ ‖λ‖_r‖μ‖_r for 1/p ≤ r < 1.
- `TauCeti.DistributionAlgebra.normR_dirac` (simp): ‖δ_g‖_r = 1 for g ∈ G.
- `TauCeti.DistributionAlgebra.normR_indep` (characterisation): ‖·‖_r depends only on ω, not on the ordered basis.
- `TauCeti.DistributionAlgebra.Dr` (constructor): D_r(G, K), the completion of D(G, K) for ‖·‖_r, a K-Banach algebra.
- `TauCeti.DistributionAlgebra.mem_Dr_iff` (characterisation): Σ d_α b^α ∈ D_r(G, K) iff |d_α| r^{τ_α} → 0.
- `TauCeti.DistributionAlgebra.DltR` (constructor): D_{<r}(G, K), series with sup |d_α| r^{τ_α} < ∞, with D_r ⊆ D_{<r} ⊆ D_{r′} for r′ < r.
- `TauCeti.DistributionAlgebra.Dr_transition` (functoriality): For r′ ≤ r the identity extends to a norm-decreasing algebra map D_r → D_{r′} with dense image.
- `TauCeti.DistributionAlgebra.lim_Dr` (equivalence): D(G, K) ≅ lim_r D_r(G, K) as Fréchet algebras.

**Checks.**

- `normR_b_pow` (computation): For G uniform with ω(h_i) = 1, ‖b^α‖_r = r^{|α|}; for G = ℤ_p and r = p^{−1/p}, ‖T^p‖_r = 1/p.
- `Dr_trivial` (degenerate): For G = {1}, D_r(G, K) = K for every r.
- `Dr_ne_DltR` (non-example): For G = ℤ_p (so d = 1, τ_n = n) and r = p^{−1/p}, the series with d_{pj} = p^{−j} and d_n = 0 otherwise has |d_{pj}| r^{pj} = 1 for all j: it lies in D_{<r}(ℤ_p, K) but not in D_r(ℤ_p, K).
- `Dr_padicInt_compat` (compatibility): For G = ℤ_p, D_r(ℤ_p, K) is the closed-disc algebra of power series in T with |a_n| r^n → 0, the Gauss-norm Tate algebra at radius r of PadicFunctionalAnalysis/RestrictedPowerSeries, compatible with the Amice transform.
- `normR_one_not_finite` (non-example): The radius r = 1 is excluded: for G = ℤ_p the distribution with Amice transform log(1 + T) has coefficients d_n = (−1)^{n+1}/n, so sup_n |d_n| = ∞ and ‖·‖_1 is not a norm on D(ℤ_p, K).

**Uses.**

- ST03 Theorems 4.5, 4.9, 4.10: the D_r(G, K) are the noetherian Banach completions exhibiting D(G, K) as Fréchet–Stein.
- Fu Proposition 5.3 and Theorem 5.7 (ND.3, ND.5): the radii r_n = p^{−1/p^n} give crossed-product decompositions and the central quotients D^λ_r(G, ℚ_p).
- AW14 Lemma 5.2 (ND.4/d-one-over-p): the step D_{1/p}(G, K) is the p-adically completed enveloping algebra Û(g_R)_K.
- Kohlhaase §1.4 (ND.3/frommer-theorem): U_r(g) is the closure of U(g) in D_r(G, K).

**Acceptance.**

- For G = ℤ_p (uniform of dimension 1), ‖Σ d_n T^n‖_r = sup |d_n| r^n with T = δ_1 − 1: D_r(ℤ_p, K) is the ring of power series in T converging on the closed disc |T| ≤ r (up to the Amice normalisation), and D(ℤ_p, K) = lim_r D_r the functions on the open disc.

**Sources.**

- Schneider–Teitelbaum (2003), §4, the norms ‖·‖′_r and ‖·‖_r, p. 16; Lemma 4.1 and Proposition 4.2, pp. 17–18; the definition of D_r(G, K) as a completion and its c₀ description, p. 18; the definition of D_{<r}(G, K), p. 19, and Lemma 4.8, p. 23; basis independence, p. 25: Defines the norms, proves submultiplicativity for 1/p ≤ r < 1, identifies D_r(G, K) with series whose weighted coefficients tend to zero, introduces D_{<r}(G, K), and shows the norms do not depend on the ordered basis.
- Fu (2024), §4, the norms ‖·‖_r and equation (16), pp. 13–14: Uses the same norms for a uniform group with ω ≡ 1 on minimal generators and describes D_r(G, K), with the bounded-coefficient condition in place of the decay condition.
- Kohlhaase (2007), §1.4, p. 15: Recalls the norms with τ_α, states that they are independent of the basis, and describes D_r(G_0, K) by coefficients |d_α| r^{τ_α} → 0.

### Graded rings, multiplicativity and noetherianity of D_r(G, K)

**Target `LocallyAnalyticDistributionsPartII:ND.2/banach-step-structure` (theorem).** Assume (HYP) for (G, ω, (h_i)) and K discretely valued with residue field k and gr·K ≅ k[ε_o, ε_o^{−1}]. Let 1/p < r < 1. (i) The associated graded ring of D_r(G, K) for the filtration F^s_r = {‖·‖_r ≤ p^{−s}} is gr·K ⊗_{𝔽_p[ε]} gr·_r ℤ_p[[G]], a commutative polynomial ring over gr·K in the principal symbols σ_r(b_1), …, σ_r(b_d); the same holds for ℤ_p[[G]] over 𝔽_p[ε] and for K[[G]]. Hence ‖·‖_r is multiplicative and D_r(G, K) has no zero divisors. (ii) If moreover r ∈ p^ℚ, then D_r(G, K) and ℤ_p[[G]] are left and right noetherian integral domains. (iii) At r = 1/p, ℤ_p[[G]], L[[G]] and D_{1/p}(G, K) are left and right noetherian integral domains with multiplicative norm ‖·‖_{1/p}, and gr·_{1/p} ℤ_p[[G]] ≅ U(gr G), the enveloping algebra of the 𝔽_p[ε]-Lie algebra gr G, which need not be commutative.

**Suggested home.** `TauCeti/NumberTheory/Padics/DistributionAlgebra/BanachSteps`, namespace `TauCeti.DistributionAlgebra`.

**Hypotheses and conventions.**

- Noetherianity at real radii r ∉ p^ℚ is not asserted: the proof uses that the filtration is quasi-integral, which needs r ∈ p^ℚ and rational ω. Fu Theorem 4.2 states noetherianity for all 1/p ≤ r < 1 (sourceIssues).
- The commutativity of the graded ring in (i) uses (HYP) through ST03 Lemma 4.4; at r = 1/p the graded ring is U(gr G), commutative only when gr G is abelian.

**Proof.**

1. gr·_r ℤ_p[[G]] is free over 𝔽_p[ε] on the symbols σ_r(b^α) = Π σ_r(b_i)^{α_i}; base change to gr·K and to the completion is ST03 Lemma 4.3.
2. The symbols commute: under (HYP), h_i^{−1}h_j^{−1}h_ih_j = g^p and b_ib_j − b_jb_i = h_jh_i(g^p − 1) has ‖·‖_r < ‖b_ib_j‖_r for 1/p < r (ST03 Lemma 4.4). A filtered ring whose graded ring is a domain has multiplicative norm (ST03 Theorem 4.5.i).
3. Noetherianity for r ∈ p^ℚ: the filtration is quasi-integral and complete with noetherian graded ring, so ST03 Proposition 1.1 (Zariskian filtrations; NoncommutativeAndEquivariantIwasawa:NE.0/zariskian-noetherian) applies (ST03 Theorem 4.5.ii).
4. r = 1/p: Lazard's theorem gr·_{1/p} ℤ_p[[G]] ≅ U(gr G) (Lazard III.2.3.3, cited ST03 p. 17; Schneider Theorem 28.3) is a noetherian domain, and Proposition 1.1 gives (iii) (ST03 Remark 4.6).

**Needs.** `LocallyAnalyticDistributionsPartII:ND.2/banach-steps`, `LocallyAnalyticDistributionsPartII:ND.0/p-valuation`, `NoncommutativeAndEquivariantIwasawa:NE.0/zariskian-noetherian`, `NoncommutativeAndEquivariantIwasawa:NE.0/iwasawa-noetherian`, `mathlib:IsRingFiltration`, `mathlib:IsNoetherianRing`, `mathlib:IsDomain`.

**Acceptance.**

- For G = ℤ_p and r ∈ (1/p, 1), gr·_r D_r(ℤ_p, K) = gr·K[σ(T)], the Gauss-norm graded ring of a closed-disc algebra.
- For G = G_1 ⊂ SL_2(ℤ_p) (p odd) and 1/p < r < 1, gr·_r D_r(G_1, ℚ_p) ≅ 𝔽_p[ε, ε^{−1}][F, H, E] (Fu, proof of Theorem 5.7).

**Sources.**

- Schneider–Teitelbaum (2003), Lemma 4.3, p. 20; Lemma 4.4, p. 21; Theorem 4.5 and Remark 4.6, p. 22: Computes the graded rings, proves commutation of symbols under (HYP), multiplicativity of ‖·‖_r and noetherianity for r ∈ p^ℚ, and treats r = 1/p via Lazard's U(gr G).
- Schneider, p-Adic Lie Groups (2011), §28, Theorem 28.3, p. 199, and Corollary 28.5, p. 200: Identifies gr Λ(G) with gr O ⊗_{𝔽_p[P]} U(gr G) and shows it is an integral domain.
- Fu (2024), Theorem 4.2, p. 14: States the noetherian integral domain property with multiplicative norm for D_r(G, K), 1/p ≤ r < 1, citing ST03 §4.

### D(G, K) is a Fréchet–Stein algebra

**Target `LocallyAnalyticDistributionsPartII:ND.2/frechet-stein-distribution` (theorem).** (i) Assume (HYP) and K discretely valued. For 1/p < r′ ≤ r < 1 in p^ℚ the transition D_r(G, K) → D_{r′}(G, K) is flat (on both sides), through D_r → D_{<r} → D_{r′}; hence D(G, K) is a two-sided K-Fréchet–Stein algebra for the norms ‖·‖_r, r ∈ p^ℚ ∩ (1/p, 1), for instance r_n = p^{−1/p^n}. (ii) For an arbitrary compact locally L-analytic group G (L/ℚ_p finite, K discretely valued), D(G, K) is a two-sided K-Fréchet–Stein algebra: choose an open normal uniform subgroup H_0 of the underlying ℚ_p-analytic group G_0 (p odd; for p = 2 its Frattini subgroup), with the conjugation-invariant p-valuation from the lower p-series, put q_r(Σ_i λ_i δ_{g_i}) = max_i ‖λ_i‖_r on D(G_0, K) = ⊕ D(H_0, K)δ_{g_i}, and pass to the quotient D(G_0, K) → D(G, K).

**Planet.** Fréchet–Stein property of D(G,K).

**Suggested home.** `TauCeti/NumberTheory/Padics/DistributionAlgebra/BanachSteps`, namespace `TauCeti.DistributionAlgebra`.

**Proof.**

1. Flatness of D_r → D_{<r}: after a finite extension of K making r^{ω(h_i)} = |π|^{m_i/e}, the graded ring of F^0_r D_{<r} is k[[u_1, …, u_d]] and that of D_r is k[u_1, …, u_d]; polynomial → power series is flat, and ST03 Proposition 1.2 lifts graded flatness (ST03 Lemma 4.8).
2. Flatness of D_{<r} → D_{r′}: the graded map is a localisation in ε_o (ST03 Theorem 4.9, pp. 23–24). With ND.2/banach-step-structure (ii) this gives (i) (ST03 Theorem 4.10).
3. General G: conjugation preserves the lower p-series, so ‖δ_g λ δ_{g⁻¹}‖_r = ‖λ‖_r by basis independence; q_r is submultiplicative up to the constant max ‖λ_k(δ_{g_ig_j})‖_r, D_r(G_0, K) is free of rank l over D_r(H_0, K), hence noetherian, and flatness follows by base change (ST03 Theorem 5.1, step 1). Step 2 passes from G_0 to the L-analytic G by the closed quotient map D(G_0, K) → D(G, K) and ST03 Proposition 3.7 (ND.2/coadmissible-theorems).

**Needs.** `LocallyAnalyticDistributionsPartII:ND.2/banach-step-structure`, `LocallyAnalyticDistributionsPartII:ND.2/banach-steps`, `LocallyAnalyticDistributionsPartII:ND.2/frechet-stein-algebra`, `LocallyAnalyticDistributionsPartII:ND.2/coadmissible-theorems`, `LocallyAnalyticDistributionsPartII:ND.1/open-subgroup-decomposition`, `LocallyAnalyticDistributionsPartII:ND.0/p-valued-analytic-structure`, `NoncommutativeAndEquivariantIwasawa:NE.0/lower-p-series`.

**Acceptance.**

- For G = ℤ_p, (i) is the Fréchet–Stein structure of the functions on the open unit disc.
- For G = G_1^m ⊂ SL_2(ℤ_p)^m (p odd), D(G, ℚ_p) is Fréchet–Stein for the radii r_n = p^{−1/p^n}, which are the radii of Fu Proposition 5.3.

**Sources.**

- Schneider–Teitelbaum (2003), Lemma 4.8 and Theorem 4.9, pp. 23–24; Theorem 4.10, p. 24: Proves flatness of D_r → D_{<r} → D_{r′} by graded methods and deduces the Fréchet–Stein property under (HYP).
- Schneider–Teitelbaum (2003), §5, Theorem 5.1 and its proof, pp. 29–30: Extends the Fréchet–Stein property to every compact locally L-analytic group via an open normal uniform subgroup, coset decompositions and the quotient D(G_0, K) → D(G, K).
- Fu (2024), Theorem 4.2, p. 14: Uses D(G, K) = lim_r D_r(G, K) as a K-Fréchet–Stein algebra.

### Faithful flatness of D(G, K) over the Iwasawa algebra

**Target `LocallyAnalyticDistributionsPartII:ND.2/faithful-flatness` (theorem).** Let L ⊆ K be finite over ℚ_p, K discretely valued. (i) Under (HYP), the maps ℤ_p[[G]] → L[[G]] → D_r(G, K) are flat (both sides) for every 1/p ≤ r < 1 with r ∈ p^ℚ. (ii) Under (HYP), L[[G]] → D(G, K) is faithfully flat: D(G, K) is faithfully flat as a left and as a right L[[G]]-module. (iii) For an arbitrary compact locally ℚ_p-analytic group G_0, L[[G_0]] → D(G_0, K) is faithfully flat. In particular, for K finite over ℚ_p (taking L = K) and a finitely generated K[[G]]-module M, D(G, K) ⊗_{K[[G]]} M = 0 implies M = 0, and the functor is exact.

**Planet.** Faithful flatness over the Iwasawa algebra.

**Suggested home.** `TauCeti/NumberTheory/Padics/DistributionAlgebra/BanachSteps`, namespace `TauCeti.DistributionAlgebra`.

**Hypotheses and conventions.**

- Flatness of D_r over ℤ_p[[G]] uses the graded criterion ST03 Proposition 1.2 and r ∈ p^ℚ (or r = 1/p via Remark 4.6).

**Proof.**

1. (i): the graded map is a base extension of 𝔽_p[ε] → gr·K, which is flat; ST03 Proposition 1.2 and Theorem 4.5.i lift this to the filtered rings; the trace L → ℚ_p makes D_r ⊗_{L[[G]]} M a direct summand of D_r ⊗_{ℤ_p[[G]]} M (ST03 Proposition 4.7).
2. (ii) flatness: for a left ideal J of the noetherian ring L[[G]], D ⊗ J is finitely presented hence coadmissible, so D ⊗ J = lim_r D_r ⊗ J and injectivity follows from (i) and left exactness of lim (ST03 Theorem 4.11, pp. 25–26).
3. (ii) faithfulness: reduce to a proper left ideal J ⊆ o[[G]] with o[[G]]/J p-torsion-free and show D_r J ≠ D_r for some r, comparing the graded modules of D_r/D_rJ and o[[G]]/J (ST03 pp. 26–28, with Lemma 4.12).
4. (iii) passes to an open normal subgroup with (HYP) by ND.1/open-subgroup-decomposition (ST03 Theorem 5.2, p. 30).

**Needs.** `LocallyAnalyticDistributionsPartII:ND.2/banach-step-structure`, `LocallyAnalyticDistributionsPartII:ND.2/frechet-stein-distribution`, `LocallyAnalyticDistributionsPartII:ND.2/coadmissible-theorems`, `LocallyAnalyticDistributionsPartII:ND.1/iwasawa-to-distributions`, `LocallyAnalyticDistributionsPartII:ND.1/open-subgroup-decomposition`, `NoncommutativeAndEquivariantIwasawa:NE.0/iwasawa-noetherian`, `mathlib:Module.FaithfullyFlat`, `mathlib:Module.Flat`.

**Acceptance.**

- For G = ℤ_p, ℚ_p[[T]]-modules ℚ_p ⊗ ℤ_p[[T]]/(f) with f distinguished survive in D(ℤ_p, ℚ_p): the zeros of f lie in the open unit disc.
- Fu equation (14), p. 13, is the case G uniform, L = K.

**Sources.**

- Schneider–Teitelbaum (2003), Proposition 4.7, p. 22; Theorem 4.11 and its proof with Lemma 4.12, pp. 25–28; Theorem 5.2, p. 30: Proves flatness of the Banach steps over the Iwasawa algebra and faithful flatness of D(G, K) over L[[G]], first under (HYP) and then for any compact locally ℚ_p-analytic group.
- Fu (2024), §4, equation (14), p. 13: Uses the faithfully flat natural map K[[G]] → D(G, K) of ST03 Theorem 4.11.

### Dependencies

Within this roadmap: Layer ND.0, Layer ND.1.

On other roadmaps and the libraries: `LocallyAnalyticDistributions:L0/banach-open-mapping-lifts`, `LocallyAnalyticDistributions:L0/locally-convex-limits`, `LocallyAnalyticDistributions:L0/nonarchimedean-locally-convex-spaces`, `LocallyAnalyticDistributions:L0/strict-morphisms-quasi-abelian`, `NoncommutativeAndEquivariantIwasawa:NE.0/iwasawa-noetherian`, `NoncommutativeAndEquivariantIwasawa:NE.0/lower-p-series`, `NoncommutativeAndEquivariantIwasawa:NE.0/zariskian-noetherian`, `mathlib:IsDomain`, `mathlib:IsNoetherianRing`, `mathlib:IsRingFiltration`, `mathlib:IsUltrametricDist`, `mathlib:Module.FaithfullyFlat`, `mathlib:Module.Flat`, `mathlib:UniformSpace.Completion`.

## Layer ND.3: Completed enveloping algebras, Frommer's theorem and the Arens–Michael envelope

Two completions of U(g) appear in the sources and must not be confused. The p-adic completion Û(h)_K of an integral lattice is a single noetherian Banach algebra; Layer ND.4 identifies it with D_{1/p}(G, K) and with the microlocalisation of the Iwasawa algebra. The Arens–Michael envelope 𝒰(g) is the limit of the weighted completions U(g)_r over all radii, the algebra of distributions supported at the identity. Between them sit Frommer's closures U_r(g) ⊆ D_r(G, K), over which D_r is free of finite rank; at r_n = p^{−1/p^n} this is a crossed product by G/G^{p^n}.

**Targets of the layer.** The p-adically completed enveloping algebra Û(h)_K of a free R-Lie lattice h and its deformations Û(h)_{n,K}; the closures U_r(g, K) of U(g) in D_r(G, K) and Frommer's theorem (D_r free over U_r, U_r described in the logarithms log(1 + b_i)); the crossed-product decomposition D_{r_n} = U_{r_n} ∗ (G/G^{p^n}) at r_n = p^{−1/p^n} with ‖log(1 + b_i)‖_{r_n} = p^{n−1}; the Arens–Michael envelope 𝒰(g) = lim_r U(g)_r, its Fréchet–Stein structure, coadmissible and admissible 𝒰(g)-modules and exact completion of finitely generated U(g)-modules.

### The p-adically completed enveloping algebra Û(h)_K

**Target `LocallyAnalyticDistributionsPartII:ND.3/completed-enveloping-algebra` (construction).** Let R be a complete discrete valuation ring with uniformiser π and fraction field K, and h an R-Lie algebra which is free of finite rank as an R-module, with R-basis u_1, …, u_d. The π-adic completion Û(h) := lim_a U(h)/π^a U(h) is an R-lattice in the K-Banach algebra Û(h)_K := Û(h) ⊗_R K, whose norm has unit ball Û(h). By the PBW theorem every element of Û(h)_K is uniquely a convergent sum Σ_α c_α u^α (ordered monomials, c_α ∈ K, c_α → 0), and ‖Σ c_α u^α‖ = sup |c_α|. For n ≥ 0 put Û(h)_{n,K} := Û(π^n h)_K (the n-th deformation). Each Û(h)_{n,K} is a left and right noetherian K-Banach algebra (an almost commutative affinoid algebra in the sense of AW13 §3.8) with Gr(Û(h)_{n,K}) ≅ gr U(h)/π gr U(h) ≅ Sym(h ⊗ k); the inclusions U(h_K) ⊂ Û(h)_{n+1,K} ⊂ Û(h)_{n,K} are dense. For a finite extension K′/K with integers R′ and ramification index e, K′ ⊗_K Û(h)_{n,K} ≅ Û(R′ ⊗_R h)_{en,K′}; in particular Û(R′ ⊗_R h)_{K′} ≅ K′ ⊗_K Û(h)_K.

**Planet.** Completed enveloping algebra Û(g)_K.

**Suggested home.** `TauCeti/Algebra/Lie/UniversalEnveloping/Completed`, namespace `TauCeti.CompletedEnveloping`.

**Hypotheses and conventions.**

- h must be free of finite rank over R; for the Lie algebras of uniform groups this holds with h = g_R = (1/p) R L_G (ND.0/lazard-lie-lattice).
- The base change statement is for finite extensions K′/K, as used for coefficient extension in ND.4/microlocal-coefficient-extension and ND.5/central-injectivity-theorem.

**Construction.**

1. U(h) is a deformable R-algebra (AW13 Example 3.4(c)) because gr U(h) ≅ Sym(h) is flat over R; the π-adic completion of a deformable algebra is a complete doubly filtered K-algebra with Gr ≅ gr A/π gr A (AW13 §3.7, Lemma and Corollary).
2. Noetherianity: an almost commutative affinoid algebra is noetherian by Li–Van Oystaeyen II.2.2.1 (AW13 §3.8, Proposition and the remark before it).
3. PBW description: the ordered monomials u^α span U(h) over R (the spanning half of PBW at the pinned Tau Ceti, TauCeti.UniversalEnvelopingAlgebra.span_orderedPBWMonomials_eq_pbwFiltration, valid over any commutative ring) and are R-linearly independent because their images in U(h_K) are (the PBW basis theorem over the field K, LieHighestWeight Layer 3); so they form an R-basis of U(h) and gr U(h) ≅ Sym(h); π-adic completion turns finite sums into null sequences.
4. Base change: AW13 Lemma 3.9(c), which needs [K′ : K] < ∞ and multiplies the deformation index by e.

**Needs.** `mathlib:UniversalEnvelopingAlgebra`, `tauceti:TauCeti.UniversalEnvelopingAlgebra.pbwFiltration`, `tauceti:TauCeti.UniversalEnvelopingAlgebra.span_orderedPBWMonomials_eq_pbwFiltration`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ`, `NoncommutativeAndEquivariantIwasawa:NE.0/zariskian-noetherian`.

**API.**

- `TauCeti.CompletedEnveloping.completion` (constructor): Û(h) = lim_a U(h)/π^a U(h), an R-algebra, with Û(h)_K = K ⊗_R Û(h) a K-Banach algebra with unit ball Û(h).
- `TauCeti.CompletedEnveloping.deformation` (constructor): Û(h)_{n,K} := Û(π^n h)_K, with dense injective maps Û(h)_{n+1,K} → Û(h)_{n,K}.
- `TauCeti.CompletedEnveloping.hasSum_pbw` (characterisation): Every element is uniquely Σ_α c_α u^α with c_α → 0, and the norm is sup |c_α|.
- `TauCeti.CompletedEnveloping.isNoetherianRing` (instance): Û(h)_{n,K} is left and right noetherian.
- `TauCeti.CompletedEnveloping.gr_equiv` (equivalence): Gr(Û(h)_{n,K}) ≅ Sym(h ⊗_R k).
- `TauCeti.CompletedEnveloping.lift` (universal-property): A Lie algebra map φ : h → B into a complete R-algebra B (π-adically complete, π-torsion-free) with φ(h) ⊆ B extends uniquely to a continuous R-algebra map Û(h) → B.
- `TauCeti.CompletedEnveloping.baseChange` (functoriality): Û(R′ ⊗ h)_{K′} ≅ K′ ⊗_K Û(h)_K for K′/K finite, compatible with the maps from U(h); more generally K′ ⊗_K Û(h)_{n,K} ≅ Û(R′ ⊗ h)_{en,K′}, e the ramification index of K′/K.
- `TauCeti.CompletedEnveloping.ofEnveloping_injective` (compatibility): U(h_K) → Û(h)_K is injective with dense image.

**Checks.**

- `completion_abelian_rank_one` (computation): For h = R·u abelian, Û(h)_K is the Tate algebra K⟨u⟩; the element Σ_n π^n u^n lies in it and Σ_n u^n does not.
- `completion_zero` (degenerate): For h = 0, Û(h)_K = K.
- `completion_sl2_casimir` (computation): For h = sl_2(ℤ_p), p odd, the Casimir Δ = ½h² − h + 2ef has norm 1 in Û(h)_{ℚ_p}, and Û(h)_{ℚ_p} is noncommutative: ef − fe = h ≠ 0.
- `completion_depends_on_lattice` (non-example): Û(h)_K depends on the lattice, not only on h_K: Û(πh)_K = Û(h)_{1,K} is a proper subalgebra of Û(h)_K, since Σ_n π^n u^n lies in Û(h)_K but not in Û(πh)_K, where π^n u^n = (πu)^n has norm 1.

**Uses.**

- AW13 Theorem 10.4 (ND.4/lazard-microlocalisation): the microlocalisation of R[[G]] at gr p is Û(g_R)_K.
- AW14 Theorems 4.6 and 5.4 (ND.5/affinoid-verma-faithfulness): affinoid Verma modules are modules over Û(g)_{n,K} and their annihilators are computed there.
- Fu Theorems 1.5, 1.6, 4.3 and 5.1: the target of central specialisation is Û(g)_λ = Û(g_{ℚ_p}) ⊗_{Z(g),λ} ℚ_p.
- AW14 Lemma 5.2 (ND.4/d-one-over-p): Û(g_R)_K is the Banach step D_{1/p}(G, K).
- the pending design of PadicEnvelopingAlgebras (LieHighestWeightPartII): Fu §3's growth estimates for quotients of Û(g) are stated over this algebra.

**Acceptance.**

- For h = R·u abelian of rank one, Û(h)_K = K⟨u⟩ is the Tate algebra in one variable, and Û(π^n h)_K = K⟨π^n u⟩ is the Tate algebra of the disc of radius |π|^{−n}.

**Sources.**

- Ardakov–Wadsley (2013), §3.4 Example (c), §3.5, §3.7 Definition, Lemma and Corollary, §3.8 Definition and Proposition, §3.9 Lemma, pp. 14–17: Defines deformable R-algebras, their n-th deformations and π-adic completions Â_{n,K}, computes Gr(Â_{n,K}) and shows these are noetherian almost commutative affinoid algebras, with base change along finitely ramified extensions.
- Ardakov–Wadsley (2013), §10.4, the display defining Û(h)_K, p. 70: Specialises to h = (1/p)R L_G and writes Û(h)_K = (lim U(h)/p^r U(h)) ⊗_R K.
- Fu (2024), §4, definitions of Û(g_R) and Û(g_K), p. 12: Defines the completed enveloping algebras Û(g_R) = lim U(g_R)/p^a U(g_R) and Û(g_K) = Û(g_R) ⊗_R K.

### The closure U_r(g, K) of U(g) in D_r(G, K)

**Target `LocallyAnalyticDistributionsPartII:ND.3/radius-enveloping-closure` (construction).** Let G be uniform (p odd) with ordered basis g_1, …, g_d, b_i = g_i − 1, and let x_i := log(1 + b_i) = Σ_{n≥1} (−1)^{n+1} b_i^n / n, the image in D(G, K) of log(g_i) ∈ g = L_G ⊗ ℚ_p. For 0 < r < 1, U_r(g, K) is the closure of the image of U(g_K) (ND.1/lie-algebra-in-distributions) in the Banach algebra D_r(G, K). It is a closed subalgebra, stable under conjugation by the δ_g, g ∈ G, and for r′ ≤ r the transition D_r → D_{r′} maps U_r(g, K) into U_{r′}(g, K).

**Suggested home.** `TauCeti/NumberTheory/Padics/DistributionAlgebra/Frommer`, namespace `TauCeti.DistributionAlgebra`.

**Construction.**

1. Closure of a subalgebra in a Banach algebra is a subalgebra. Stability under conjugation follows from δ_g x̃ δ_{g⁻¹} = (Ad(g)x)~ (ND.1/lie-algebra-in-distributions) and continuity of conjugation (Fu, proof of Proposition 5.3, p. 17).
2. x_i is the image of log(g_i) because the logarithm series converges in D_r(G, K) for r < 1 and computes the derivative of t ↦ δ_{g_i^t} at t = 0 (Kohlhaase §1.4, where X = (log(1 + b_i))_i is the basis of g used).

**Needs.** `LocallyAnalyticDistributionsPartII:ND.1/lie-algebra-in-distributions`, `LocallyAnalyticDistributionsPartII:ND.2/banach-steps`, `LocallyAnalyticDistributionsPartII:ND.0/lazard-lie-lattice`, `mathlib:Subalgebra.topologicalClosure`.

**API.**

- `TauCeti.DistributionAlgebra.Ur` (constructor): U_r(g, K) := topological closure of the image of U(g_K) in D_r(G, K).
- `TauCeti.DistributionAlgebra.log_mem_Ur` (simp): x_i = log(1 + b_i) ∈ U_r(g, K) and is the image of log(g_i).
- `TauCeti.DistributionAlgebra.conj_Ur` (relation): δ_g U_r(g, K) δ_{g⁻¹} = U_r(g, K) for g ∈ G.
- `TauCeti.DistributionAlgebra.Ur_transition` (functoriality): D_r → D_{r′} restricts to U_r → U_{r′} for r′ ≤ r.
- `TauCeti.DistributionAlgebra.Ur_isClosed` (characterisation): U_r(g, K) is a closed subalgebra of D_r(G, K).

**Checks.**

- `Ur_trivial` (degenerate): For G = {1}, U_r = D_r = K.
- `log_norm_r1` (computation): For G = ℤ_p (p odd) and r_1 = p^{−1/p}, ‖log(1 + T)‖_{r_1} = max_k r_1^{p^k}/|p^k| = max_k p^{k − p^{k−1}} = 1, attained only at k = 1 (the term T^p/p).
- `Ur_ne_Dr` (non-example): For G = ℤ_p and r = r_1 = p^{−1/p}, U_r ≠ D_r: δ_1 = 1 + T is not in the closure of K[log(1 + T)] at that radius, while δ_p = exp(p log(1 + T)) is (Fu, proof of Proposition 5.3); D_{r_1} is free of rank p over U_{r_1}.
- `Ur_compat_enveloping` (compatibility): The map U(g_K) → U_r(g, K) is injective and its image is dense; on generators it is the map x ↦ x̃ of ND.1/lie-algebra-in-distributions.

**Uses.**

- Fu Proposition 5.3 (ND.3/crossed-product-radius): D_{r_n}(G, ℚ_p) is a crossed product of U_{r_n}(g) by G/G^{p^n}.
- Fu proof of Theorem 5.1 (ND.5/fu-direct-injectivity): a nonzero multiple of δ is found in U^λ_r(g) and compared with Û(g)_λ.
- Kohlhaase §1.4–1.5: the structure of D_r(G, K) over U_r(g, K) is used to compute centres of distribution algebras.

**Acceptance.**

- For G = ℤ_p and r ∈ (p^{−1}, 1), U_r(Lie ℤ_p, K) is the closure of K[x] with x = log(1 + T): the power series in log(1 + T) converging for the norm ‖·‖_r (Frommer's theorem below).

**Sources.**

- Kohlhaase (2007), §1.4, definition of U_r(g, K), p. 15: Defines U_r(g, K) as the closure of U(g, K) in D_r(G_0, K) and uses the Q_p-basis x_i = log(1 + b_i) of g.
- Fu (2024), §5, the definitions of U_r(g), U^λ_r(g) and D^λ_r(G, ℚ_p), p. 17: Defines U_r(g) as the closure of U(g) in D_r(G, ℚ_p) following Frommer and Kohlhaase, and its central quotients.

### Frommer's description of D_r(G, K) over U_r(g, K)

**Target `LocallyAnalyticDistributionsPartII:ND.3/frommer-theorem` (theorem).** Let K be discretely valued, G a uniform pro-p group (more generally a p-valued group as in Kohlhaase §1.4, with τ_i = ω(h_i)), r ∈ p^ℚ with 1/p < r < 1, and x_i = log(1 + b_i). Then: (i) U_r(g, K) = {Σ_α d_α x^α : d_α ∈ K, |d_α| ‖x^α‖_r → 0}, with ‖Σ d_α x^α‖_r = sup_α |d_α| ‖x^α‖_r; (ii) U_r(g, K) is a noetherian subalgebra of D_r(G, K); (iii) there are integers ℓ_i ≥ 1, ℓ_i = max{m ≥ 1 : sup_{n≥1} |1/n| r^{nτ_i} = |1/m| r^{mτ_i}}, such that D_r(G, K) is a free right U_r(g, K)-module with basis the b^α, 0 ≤ α_i < ℓ_i. For a closed uniform subgroup H compatible with G the same holds for D(H, K), and the closure of D(G, K)·D(H, K) in D_r(G, K) is a finitely generated free U_r(g, K)-module with basis in K[H].

**Planet.** Frommer's theorem.

**Suggested home.** `TauCeti/NumberTheory/Padics/DistributionAlgebra/Frommer`, namespace `TauCeti.DistributionAlgebra`.

**Hypotheses and conventions.**

- r must lie in p^ℚ ∩ (1/p, 1); the source states the theorem only there. Frommer's original proof (Münster SFB 478 preprint 265, 2003) was not available; the statement is taken from Kohlhaase's summary and his proof of Corollary 1.4.1.

**Proof.**

1. The orthogonality of the monomials x^α for ‖·‖_r is shown by a careful analysis of orthogonal bases (Frommer §1.4, Lemma 3 and Corollaries 1–3, as cited by Kohlhaase).
2. The integers ℓ_i record where the maximum in ‖log(1 + b_i)‖_r = max_n |1/n| r^{nτ_i} is attained; the b^α with α_i < ℓ_i fill the remaining coordinates (Kohlhaase, proof of Corollary 1.4.1).
3. Noetherianity of U_r(g, K) follows from its graded ring being a polynomial ring, as for D_r (ND.2/banach-step-structure).

**Needs.** `LocallyAnalyticDistributionsPartII:ND.3/radius-enveloping-closure`, `LocallyAnalyticDistributionsPartII:ND.2/banach-steps`, `LocallyAnalyticDistributionsPartII:ND.2/banach-step-structure`.

**Acceptance.**

- For G uniform with τ_i = 1 and r = r_n = p^{−1/p^n}, the maximum max_k r_n^{p^k}/|p^k| is attained exactly at k = n, so ℓ_i = p^n and ‖x_i‖_{r_n} = p^{n−1}: D_{r_n} is free over U_{r_n} on the b^α with α_i < p^n, which matches the coset count [G : G^{p^n}] = p^{nd} (Fu Proposition 5.3).

**Sources.**

- Kohlhaase (2007), §1.4, Theorem (Frommer) and Corollary 1.4.1 with proof, pp. 15–16: Summarises Frommer's theorem: for r ∈ p^ℚ, 1/p < r < 1, U_r(g, K) is a noetherian subalgebra described by weighted series in x_i = log(1 + b_i), and D_r(G_0, K) is free over it with basis the b^α, α_i < ℓ_i; extends this to compatible uniform subgroups.
- Fu (2024), §5, equation (27) and the proof of Proposition 5.3, p. 17: Uses Frommer's description (27) of U_r(g) and the freeness of D_r over U_r with basis representatives of G/G^{p^n}.

### D_{r_n}(G, ℚ_p) as a crossed product of U_{r_n}(g) by G/G^{p^n}

**Target `LocallyAnalyticDistributionsPartII:ND.3/crossed-product-radius` (theorem).** Let p be odd, G uniform with minimal generators g_i, ω(g_i) = 1, and r_n = p^{−1/p^n} for n ≥ 1. Then (i) ‖log(1 + b_i)‖_{r_n} = p^{n−1}; (ii) for every g ∈ G, g^{p^n} ∈ U_{r_n}(g), since g^{p^n} = exp(p^n log g) and the exponential series converges in U_{r_n}(g); (iii) D_{r_n}(G, ℚ_p) is a crossed product U_{r_n}(g) ∗ (G/G^{p^n}): it is a free left and right U_{r_n}(g)-module on δ_γ for any set of coset representatives γ of G/G^{p^n}, with δ_γ U_{r_n}(g) = U_{r_n}(g) δ_γ and twisting in U_{r_n}(g)^× ∩ δ_{G^{p^n}}; (iv) if G is open in the ℚ_p-points of a connected split reductive group, then for every character λ of Z(g), D^λ_{r_n}(G, ℚ_p) ≅ U^λ_{r_n}(g) ∗ (G/G^{p^n}).

**Planet.** Crossed-product decomposition of D_r.

**Suggested home.** `TauCeti/NumberTheory/Padics/DistributionAlgebra/Frommer`, namespace `TauCeti.DistributionAlgebra`.

**Hypotheses and conventions.**

- The crossed product is not a tensor product with the group algebra of G/G^{p^n}: the twisting cocycle is nontrivial whenever G/G^{p^n} does not lift to a subgroup.

**Proof.**

1. (i): ‖log(1 + b_i)‖_r = max_k r^{p^k}/|p^k| = max_k p^{k − p^{k−n}}, which equals p^{n−1} at k = n and is strictly smaller for every other k ≥ 0 (k − p^{k−n} < n − 1 for k ≠ n when p ≥ 3) (Fu, proof of Proposition 5.3, p. 17).
2. (ii): ‖x_i^k‖_{r_n} = p^{(n−1)k} by multiplicativity (ND.2/banach-step-structure) and |p^{nk}/k!| p^{(n−1)k} ≤ p^{k/(p−1)} p^{−k} → 0, so exp(p^n x_i) converges in U_{r_n}(g), and it equals g_i^{p^n}; products of such elements give all of G^{p^n} by ordered coordinates.
3. (iii): Frommer's freeness (ND.3/frommer-theorem) with ℓ_i = p^n, the elements b^α, α_i < p^n, span the same right U_{r_n}-module as the δ_γ for coset representatives; U_{r_n} is stable under conjugation (ND.3/radius-enveloping-closure).
4. (iv): Z(g) is central in D_r (ND.1/central-enveloping-distributions) and contained in U_{r_n}(g), so the crossed-product structure passes to the quotient by the central ideal.

**Needs.** `LocallyAnalyticDistributionsPartII:ND.3/frommer-theorem`, `LocallyAnalyticDistributionsPartII:ND.3/radius-enveloping-closure`, `LocallyAnalyticDistributionsPartII:ND.2/banach-step-structure`, `LocallyAnalyticDistributionsPartII:ND.1/central-enveloping-distributions`, `LocallyAnalyticDistributionsPartII:ND.1/open-subgroup-decomposition`, `LocallyAnalyticDistributionsPartII:ND.0/uniform-groups-p-valued`.

**Acceptance.**

- For G = ℤ_p and n = 1: D_{r_1}(ℤ_p, ℚ_p) = ⊕_{a=0}^{p−1} U_{r_1} δ_a, with δ_p = exp(p log(1 + T)) ∈ U_{r_1}.

**Sources.**

- Fu (2024), Proposition 5.3 and its proof, pp. 17–18: Proves that D_r(G, ℚ_p) for r = p^{−1/p^n} is a crossed product of U_r(g) by G/G^{p^n}, computing ‖log(1 + b_i)‖_r = p^{n−1} and the convergence of exp(p^n X_i), and deduces the central quotient version.
- Ardakov–Wadsley (2013), §10.6, Proposition and Remark, pp. 71–72: Constructs the crossed products U_n ∗ H_n of the microlocalisation of R G^{p^n} by G/G^{p^n} and remarks that they should be D_{p^{−1/p^n}}(G, K).

### The Arens–Michael envelope 𝒰(g) and its coadmissible modules

**Target `LocallyAnalyticDistributionsPartII:ND.3/arens-michael-envelope` (construction).** Let E/ℚ_p be finite and g the Lie algebra of a linear algebraic group over o_E, with a chosen o_E-basis x_1, …, x_d of the integral Lie lattice g_0 (closed under the bracket). For r ∈ ℝ_{>0} put |Σ_n a_n x^n|_r := sup_n |a_n| r^{|n|} on U(g) (PBW coordinates) and let U(g)_r be the completion; for r ≥ 1 these are Banach algebras. The Arens–Michael envelope is 𝒰(g) := lim_{r≥1} U(g)_r, a Fréchet–Stein algebra and a nuclear Fréchet space; it is the strong dual 𝒪_{G,e}′ of the space of germs at e of analytic functions (an LB-space of compact type), and U(g) → 𝒰(g) is injective with dense image, x ↦ (f ↦ (d/dt) f(exp(tx))|₀). For the small-group analytic distribution algebras D(G_r) (G_r the congruence polydisc subgroups) there are cofinal comparisons: for every r there is r′ with U(g)_{r′} → D(G_r) and D(G_{r′}) → U(g)_r, so 𝒰(g) = lim_r U(g)_r = lim_r D(G_r). A left 𝒰(g)-module is coadmissible in the sense of ND.2/coadmissible-module for the sequence U(g)_r; U(g) → 𝒰(g) and U(g) → U(g)_r are flat, so M ↦ 𝒰(g) ⊗_{U(g)} M is an exact functor from finitely generated U(g)-modules to coadmissible 𝒰(g)-modules. An admissible 𝒰(g)-module is the continuous dual of a coadmissible one, an LB-space of compact type.

**Planet.** Arens–Michael envelope 𝒰(g).

**Suggested home.** `TauCeti/Algebra/Lie/UniversalEnveloping/Completed`, namespace `TauCeti.CompletedEnveloping`.

**Hypotheses and conventions.**

- Do not confuse 𝒰(g) with the p-adic completion Û(g_R)_K of ND.3/completed-enveloping-algebra: the latter is the single Banach step U(g)_r for the norm of a lattice, while 𝒰(g) is the limit over all radii. BCGP write Û(g) for 𝒰(g).
- Left modules; the transition isomorphisms read U(g)_r ⊗_{U(g)_{r+1}} M_{r+1} ≅ M_r.

**Construction.**

1. Submultiplicativity of |·|_r for r ≥ 1 and the description 𝒰(g) = (𝒪_{G,e})′ follow from ST02 Lemmas 2.4–2.5: the germs are power series Σ a_n T^n in coordinates of the second kind with |a_n| s^{|n|} → 0 for some s > 0, their dual is Σ b_n Z^n with sup |b_n| s^{−|n|} < ∞ for all s > 0, and x^n pairs with T^n to give n!·δ (up to the sign convention of ND.1/lie-algebra-in-distributions).
2. Cofinality with the D(G_r): BCGP Remark 2.2.30; Fréchet–Stein property: BCGP §2.2.29–2.2.30 citing ST03 §3 (the transitions U(g)_{r′} → U(g)_r between Banach completions of an almost commutative algebra are flat, as for Tate algebras of nested polydiscs).
3. The norms |·|_r, r > 1, are submultiplicative and cofinal among submultiplicative seminorms, so their completion is the Arens–Michael envelope (Schmidt Proposition 3.2.1); 𝒰(g) is a Fréchet–Stein integral domain whose Banach completions are the noetherian U(g)_r, flat over 𝒰(g) (Schmidt Proposition 3.2.3 and the following remark); U(g) → 𝒰(g) is flat (Schmidt Theorem 4.3.3), whence exactness of completion (BCGP Proposition 2.2.35).

**Needs.** `LocallyAnalyticDistributionsPartII:ND.2/coadmissible-module`, `LocallyAnalyticDistributionsPartII:ND.2/coadmissible-theorems`, `LocallyAnalyticDistributionsPartII:ND.2/frechet-stein-algebra`, `LocallyAnalyticDistributionsPartII:ND.1/lie-algebra-in-distributions`, `LocallyAnalyticDistributions:L0/compact-type-nuclear-duality`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ`, `mathlib:UniversalEnvelopingAlgebra`.

**API.**

- `TauCeti.CompletedEnveloping.radiusCompletion` (constructor): U(g)_r, the completion of U(g) for |Σ a_n x^n|_r = sup |a_n| r^{|n|}; a Banach algebra for r ≥ 1.
- `TauCeti.CompletedEnveloping.arensMichael` (constructor): 𝒰(g) := lim_{r≥1} U(g)_r as a Fréchet algebra.
- `TauCeti.CompletedEnveloping.arensMichael_frechetStein` (instance): 𝒰(g) is a Fréchet–Stein algebra for the sequence U(g)_r, r = 1, 2, 3, ….
- `TauCeti.CompletedEnveloping.arensMichael_dual_germs` (equivalence): 𝒰(g) ≅ (𝒪_{G,e})′_b, the strong dual of the germs of analytic functions at e.
- `TauCeti.CompletedEnveloping.arensMichael_cofinal` (compatibility): For each r there is r′ with U(g)_{r′} → D(G_r) → U(g)_{r″}, so 𝒰(g) ≅ lim_r D(G_r).
- `TauCeti.CompletedEnveloping.flat_arensMichael` (characterisation): U(g) → 𝒰(g) and U(g) → U(g)_r are flat.
- `TauCeti.CompletedEnveloping.completeModule` (functoriality): M ↦ 𝒰(g) ⊗_{U(g)} M is exact from finitely generated U(g)-modules to coadmissible 𝒰(g)-modules.
- `TauCeti.CompletedEnveloping.IsAdmissible` (data): An admissible 𝒰(g)-module is the continuous dual of a coadmissible module, with the contragredient action.

**Checks.**

- `arensMichael_abelian` (computation): For g = E·x, 𝒰(g) = 𝒪(𝔸¹_E) = {Σ a_n x^n : |a_n| r^n → 0 for all r}; exp(x) = Σ x^n/n! lies in U(g)_r only for r < p^{−1/(p−1)} < 1, so exp(x) ∉ 𝒰(g): its elements are entire series in x.
- `arensMichael_zero` (degenerate): For g = 0, 𝒰(g) = E.
- `arensMichael_pairing` (compatibility): With the convention of ND.1/lie-algebra-in-distributions, the ordered monomial x_1^{α_1} ⋯ x_d^{α_d} pairs with the coordinate monomial t^β of the second kind to α!·δ_{αβ}; ST02 Lemma 2.4 obtains (−1)^{|α|}α! because it differentiates along exp(−tx).
- `completeModule_orientation` (non-example): For a left module the transition U(g)_r ⊗_{U(g)_{r+1}} M_{r+1} ≅ M_r is the correct one; the reversed M_{r+1} ⊗_{U(g)_{r+1}} U(g)_r is not defined for a left module M_{r+1}, which pins the corrected orientation of BCGP Definition 2.2.31.

**Uses.**

- BCGP Theorem 2.2.32 and Corollary 2.2.36 (split-off solid functional-analysis Part II): coadmissible 𝒰(g)-modules embed fully faithfully and exactly in solid 𝒰(g)-modules.
- BCGP §2.2.37–2.2.39 and §3 (LieHighestWeightPartIICompletedCategoryO): the completed category Ô and analytic localisation are built from coadmissible 𝒰(g)-modules.
- AW14 Theorem B: D(H, K)_1, the distributions supported at the identity, is the Arens–Michael envelope, algebraically independent over KH.

**Acceptance.**

- For g = E·x abelian, U(g)_r = the Tate algebra of the disc |x| ≤ r and 𝒰(g) = 𝒪(𝔸¹), the entire functions; the finitely generated U(g)-module E[x]/(x − a) completes to the coadmissible module 𝒪(𝔸¹)/(x − a) ≅ E for every a ∈ E.

**Sources.**

- Boxer–Calegari–Gee–Pilloni (2025), §2.2.29, Remark 2.2.30, Definition 2.2.31, Definition 2.2.33, §2.2.34 and Proposition 2.2.35, pp. 23–24: Defines Û(g) = 𝒪_{G,e}^∨ as the limit of the PBW-norm completions U(g)_r, compares it cofinally with the small-group distribution algebras, defines coadmissible and admissible modules, and records the flatness of U(g) → Û(g) and the exact completion functor.
- Schneider–Teitelbaum (2002, JAMS), §2, Lemmas 2.4 and 2.5, pp. 10–11: Describes the germs at 1 and their dual by power series in coordinates of the second kind and the image of U(g) in the dual.
- Schmidt (2013), §3.2, Proposition 3.2.1, Remark 3.2.2 and Proposition 3.2.3, pp. 5–6; Theorem 4.3.3, p. 16: Realises the Arens–Michael envelope of U(g) as the completion for the PBW norms with r > 1, shows it is a Fréchet–Stein integral domain with noetherian Banach completions U_r(g), and proves that U(g) → Û(g) is flat.

### Dependencies

Within this roadmap: Layer ND.0, Layer ND.1, Layer ND.2.

On other roadmaps and the libraries: `LocallyAnalyticDistributions:L0/compact-type-nuclear-duality`, `NoncommutativeAndEquivariantIwasawa:NE.0/zariskian-noetherian`, `mathlib:Subalgebra.topologicalClosure`, `mathlib:UniversalEnvelopingAlgebra`, `tauceti:TauCeti.UniversalEnvelopingAlgebra.pbwFiltration`, `tauceti:TauCeti.UniversalEnvelopingAlgebra.span_orderedPBWMonomials_eq_pbwFiltration`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ`.

## Layer ND.4: Microlocalisation of Iwasawa algebras and Lie modules

Ardakov–Wadsley's microlocalisation inverts, in the Iwasawa algebra of a uniform group over an unramified ring, the elements whose principal symbol is a power of p, and completes. Lazard's computation of the graded ring makes this possible, and the result is again Û(g_R)_K, which is also the Banach step D_{1/p}(G, K). Finite-dimensional modules on which these elements act invertibly are unchanged, which is the source of Fu's comparison of W-isotypic quotients.

**Targets of the layer.** Algebraic microlocalisation of Zariskian filtered rings at homogeneous Ore sets; Lazard's m-adic filtration of R[[G]] with gr R[[G]] ≅ U(gr G ⊗ k); the microlocal Ore set S_0 = ⋃ (p^a + m^{a+1}) over unramified R; the Ardakov–Wadsley theorem Q_{gr p}(R[[G]]) ≅ Û(g_R)_K, the identification D_{1/p}(G, K) ≅ Û(g_R)_K, and the extension to ramified coefficients by base change; microlocalisation of finitely generated modules; Lie modules, semisimplicity of finite-dimensional K[[G]]-modules for congruence kernels; Fu's comparison of W-isotypic quotients before and after microlocalisation.

### Algebraic microlocalisation of complete filtered rings

**Target `LocallyAnalyticDistributionsPartII:ND.4/microlocalisation` (construction).** Let A be a ring with an exhaustive separated ℤ-filtration F_•A (F_iA·F_jA ⊆ F_{i+j}A, 1 ∈ F_0A) which is Zariskian (for example complete with noetherian associated graded ring gr A), and let T ⊆ gr A be a (left and right) Ore set of homogeneous elements. Then S := {s ∈ A : gr s ∈ T} is an Ore set in A; the Ore localisation A_S carries a natural Zariskian filtration with gr(A_S) ≅ (gr A)_T; the microlocalisation Q_T(A) is the completion of A_S for that filtration. For a finitely generated A-module M with a good filtration, Q_T(M) is the completion of M_S for the induced good filtration. Then Q_T(A) is flat over A (both sides), Q_T(A) ⊗_A M ≅ Q_T(M), and Q_T(M) = 0 iff M_S = 0, i.e. iff M is S-torsion.

**Planet.** Microlocalisation.

**Suggested home.** `TauCeti/RingTheory/Microlocalization`, namespace `TauCeti.Microlocalization`.

**Hypotheses and conventions.**

- Zariskian filtrations (Li–Van Oystaeyen) are needed for flatness and for the identification Q_T(A) ⊗ M ≅ Q_T(M); a complete filtration with noetherian graded ring is Zariskian (AW13 §2.3).

**Construction.**

1. (a) S is Ore, (b) the induced filtration on A_S is Zariskian with graded ring (gr A)_T, and (c) good filtrations localise: Li–Van Oystaeyen, Corollary 2.2, Propositions 2.3, 2.6, 2.8 and Corollaries 2.4, 2.5, 2.7 of [56] in AW13 (AW13 §2.4, Lemma and Corollary, p. 9).
2. The Ore localisation itself is Mathlib's OreLocalization for the Ore set S; the filtration and its completion are built on Mathlib's IsRingFiltration and UniformSpace.Completion.

**Needs.** `mathlib:OreLocalization`, `mathlib:OreLocalization.OreSet`, `mathlib:IsRingFiltration`, `mathlib:UniformSpace.Completion`, `mathlib:Module.Flat`, `NoncommutativeAndEquivariantIwasawa:NE.0/zariskian-noetherian`.

**API.**

- `TauCeti.Microlocalization.oreSetOfSymbols` (constructor): S = {s : gr s ∈ T} is an Ore set of A for a homogeneous Ore set T ⊆ gr A of a Zariskian filtered ring.
- `TauCeti.Microlocalization.microlocalization` (constructor): Q_T(A), the completion of the Ore localisation A_S for its induced filtration, a complete filtered ring with gr Q_T(A) ≅ (gr A)_T.
- `TauCeti.Microlocalization.algebraMap` (data): The ring map A → Q_T(A), strictly filtered.
- `TauCeti.Microlocalization.flat` (instance): Q_T(A) is flat as a left and a right A-module.
- `TauCeti.Microlocalization.tensor_equiv` (equivalence): Q_T(A) ⊗_A M ≅ Q_T(M) for finitely generated M with a good filtration.
- `TauCeti.Microlocalization.eq_zero_iff` (characterisation): Q_T(M) = 0 iff every element of M is killed by some s ∈ S.
- `TauCeti.Microlocalization.lift` (universal-property): A strictly filtered ring map φ : A → B into a complete filtered ring with gr φ(T) ⊆ (gr B)^× extends uniquely to Q_T(A) → B.

**Checks.**

- `microlocalization_trivial_T` (degenerate): For T = {1}, S consists of the elements with symbol 1 (units of A when the filtration is complete) and Q_T(A) = A.
- `microlocalization_commutative` (compatibility): For commutative A with the I-adic filtration and T = {(gr x)^a}, Q_T(A) is the I-adic completion of the localisation A_S, which for x central regular is the completion of the localisation A[1/x] for the induced filtration.
- `microlocalization_powerSeries` (computation): For A = ℤ_p[[X]] with the (p, X)-adic filtration and the powers of gr p, the microlocalisation is ℚ_p⟨X/p⟩ (power series in X/p with coefficients tending to zero), via the inclusion ℤ_p[[X]] → ℚ_p⟨X/p⟩; the element p + X² ∈ S becomes a unit there, while X ∉ S is not inverted.
- `microlocalization_kills_torsion` (non-example): For A = ℤ_p[[X]] with the (p, X)-adic filtration and the Ore set of powers of gr p, the module ℤ_p[[X]]/(p) is S-torsion (p ∈ S), so its microlocalisation is 0 although the module is nonzero: microlocalisation is flat but not faithful.

**Uses.**

- AW13 Theorem 10.4 (ND.4/lazard-microlocalisation): the microlocalisation of R[[G]] at gr p is Û(g_R)_K.
- AW13 Proposition 11.1 and Theorem 11.1 (ND.4/lie-modules): finite-dimensional S_n-torsion-free modules are unchanged by microlocalisation.
- Fu Theorem 4.3 (ND.4/isotypic-comparison): the flat base change K[[G]] → Û(g_K) is applied to the sequence 0 → Ann(W)M → M → M_W → 0.

**Acceptance.**

- For A = ℤ_p[[X]] with its (p, X)-adic filtration and the Ore set of powers of gr p, the microlocalisation is the completed localisation of ℤ_p[[X]] at the elements p^a + (p, X)^{a+1}, which is ℚ_p⟨X/p⟩ (ND.4/lazard-microlocalisation in dimension one).

**Sources.**

- Ardakov–Wadsley (2013), §2.1–2.4, the Definition of the microlocalisation Q_T(A) and Q_T(M), the Lemma and the Corollary, pp. 7–9: Recalls filtered rings, Zariskian filtrations and algebraic microlocalisation at a homogeneous Ore set, with flatness, the base change isomorphism and the torsion criterion for vanishing.
- Fu (2024), §2, Definition 2.1 and Lemma 2.2, pp. 5–6: Recalls Λ-filtrations, associated graded rings and principal symbols, and computes the graded ring of a quotient A/A·a when gr a is a nonzerodivisor.

### Lazard's m-adic filtration of the Iwasawa algebra of a uniform group

**Target `LocallyAnalyticDistributionsPartII:ND.4/m-adic-filtration` (theorem).** Let R be a complete discrete valuation ring with uniformiser p (so R is unramified over ℤ_p) and residue field k, G uniform of dimension d with minimal generators g_i, b_i = g_i − 1, and m = ker(R[[G]] → k) the maximal ideal. Then R[G] is dense in R[[G]], every element is uniquely Σ_α λ_α b^α (λ_α ∈ R), and the m-adic degree is deg(Σ λ_α b^α) = min_α (v(λ_α) + |α|). The m-adic filtration is complete, and gr_m R[[G]] ≅ U(gr G ⊗_{𝔽_p} k) as graded k[t]-algebras, where gr G ⊗ k ≅ t·h_k[t] with h_k = h/ph, h = (1/p) R L_G. In particular gr_m R[[G]] is a noetherian domain, so the m-adic filtration is Zariskian.

**Suggested home.** `TauCeti/NumberTheory/Padics/IwasawaMicrolocal`, namespace `TauCeti.IwasawaMicrolocal`.

**Hypotheses and conventions.**

- The degree formula and the description of gr need p to be a uniformiser; for ramified R the elements p^a + m^{a+1} may include 0 (sourceIssues).

**Proof.**

1. Density and the power-series description: AW13 §10.3, from the proof of DDMS Theorem 7.20 and DDMS Theorem 7.5 for the degree formula; completeness from p-adic completeness of R.
2. ω(g) = i + 1 on G^{p^i} ∖ G^{p^{i+1}} is a p-valuation whose graded Lie algebra is gr G, because commutators agree modulo G^{p²} with the Lie bracket (DDMS Lemma 4.28); Lazard's Theorem III.2.3.3 gives gr R[[G]] ≅ U(gr G ⊗ k) (AW13 §10.3, proof; Schneider Theorem 28.3).
3. gr G ⊗ k ≅ t h_k[t] is free of rank d over k[t] (AW13 Lemma 10.2), so the PBW theorem makes U of it a noetherian domain (AW13 Corollary 10.3).

**Needs.** `LocallyAnalyticDistributionsPartII:ND.0/uniform-groups-p-valued`, `LocallyAnalyticDistributionsPartII:ND.0/lazard-lie-lattice`, `LocallyAnalyticDistributionsPartII:ND.1/iwasawa-to-distributions`, `NoncommutativeAndEquivariantIwasawa:NE.0/uniform-graded-polynomial`, `NoncommutativeAndEquivariantIwasawa:NE.0/iwasawa-local-iff-pro-p`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ`.

**Acceptance.**

- For G = ℤ_p (written 1 + pℤ_p), R[[G]] = R[[b]], deg(Σ λ_n b^n) = min(v(λ_n) + n), and gr_m = k[t][σ(b)] with σ(b) of degree 1: the (p, b)-adic filtration of R[[b]].

**Sources.**

- Ardakov–Wadsley (2013), §10.1, §10.2 Lemma, §10.3 Theorem and Corollary, pp. 67–69: With p a uniformiser of R, describes R[[G]] as power series in the b_i, proves Lazard's degree formula and completeness, identifies gr R[[G]] with U(gr G ⊗ k), and shows it is a noetherian domain.
- Schneider, p-Adic Lie Groups (2011), §28, Theorem 28.3, p. 199: Proves the isomorphism gr O ⊗_{𝔽_p[P]} U(gr G) ≅ gr Λ(G) for p-valued G.

### The microlocal Ore set S_0 = ⋃_a (p^a + m^{a+1})

**Target `LocallyAnalyticDistributionsPartII:ND.4/microlocal-ore-set` (construction).** Under the hypotheses of ND.4/m-adic-filtration (R unramified with uniformiser p), the powers of gr p form a multiplicatively closed set of homogeneous central regular elements of the noetherian domain gr_m R[[G]], hence an Ore set T, and the associated set of ND.4/microlocalisation is S_0 = {x ∈ R[[G]] : gr x = (gr p)^a for some a ≥ 0} = ⋃_{a≥0} (p^a + m^{a+1}). S_0 is an Ore set of R[[G]] not containing 0, and for each n ≥ 0 the analogous set S_n ⊆ R[[G^{p^n}]] is stable under conjugation by G.

**Suggested home.** `TauCeti/NumberTheory/Padics/IwasawaMicrolocal`, namespace `TauCeti.IwasawaMicrolocal`.

**Hypotheses and conventions.**

- Fu (17) takes R to be the integers of an arbitrary finite extension K of ℚ_p; for ramified R, p ∈ m², so 0 = p − p ∈ p + m² and S_0 is not an Ore set of nonzerodivisors. Over ramified K the microlocalisation is obtained by base change (ND.4/microlocal-coefficient-extension).

**Construction.**

1. gr p is central and regular in gr_m R[[G]] (it is t in degree 1 of k[t] ⊆ U(t h_k[t])), so its powers form an Ore set of the noetherian domain; ND.4/microlocalisation (a) transports this to S_0 (AW13 §10.4, the display of S, p. 70).
2. x ∈ p^a + m^{a+1} has gr x = (gr p)^a because deg p^a = a when p is a uniformiser; the converse is the definition of the symbol.
3. Conjugation by G preserves the m_n-adic filtration of R[[G^{p^n}]] and fixes p (AW13 §10.6, p. 71).

**Needs.** `LocallyAnalyticDistributionsPartII:ND.4/m-adic-filtration`, `LocallyAnalyticDistributionsPartII:ND.4/microlocalisation`.

**API.**

- `TauCeti.IwasawaMicrolocal.oreSet` (constructor): S_0 ⊆ R[[G]] as an Ore set, for R with uniformiser p.
- `TauCeti.IwasawaMicrolocal.mem_oreSet_iff` (characterisation): x ∈ S_0 iff x ∈ p^a + m^{a+1} for some a ≥ 0, iff gr x = (gr p)^a.
- `TauCeti.IwasawaMicrolocal.zero_not_mem_oreSet` (simp): 0 ∉ S_0 when p is a uniformiser of R.
- `TauCeti.IwasawaMicrolocal.oreSet_conj` (functoriality): S_n ⊆ R[[G^{p^n}]] is stable under conjugation by G.

**Checks.**

- `p_mem_oreSet` (computation): p ∈ S_0 (a = 1) and 1 ∈ S_0 (a = 0).
- `oreSet_trivial_group` (degenerate): For G = {1}, R[[G]] = R, m = pR, and S_0 = R ∖ {0}: microlocalisation is passage to K.
- `b_not_mem_oreSet` (non-example): b_i ∉ S_0: its symbol has degree 1 but is not gr p.
- `zero_mem_ramified` (non-example): For R = ℤ_p[√p] (uniformiser ϖ = √p, so p = ϖ² ∈ m²) the set ⋃_a (p^a + m^{a+1}) contains 0 = p − p ∈ p + m², so the displayed set is not an Ore set of nonzerodivisors over a ramified coefficient ring.

**Uses.**

- AW13 Theorem 10.4 (ND.4/lazard-microlocalisation): inverting S_0 and completing gives Û(g_R)_K.
- Fu proof of Theorem 4.3 (ND.4/isotypic-comparison): S_0 consists of units of Û(g_K) and so acts invertibly on Lie modules.
- AW13 Corollary 10.11 and Proposition 11.1 (ND.4/lie-modules): finite-dimensional modules are S_n-torsion-free for n large.

**Acceptance.**

- For G = ℤ_p and R = ℤ_p, S_0 contains p + b² but not b + p²: its elements are those whose leading form is a power of p.

**Sources.**

- Ardakov–Wadsley (2013), §10.4, the definition of S, p. 70, and §10.6, the sets S_n, p. 71: Defines the microlocal Ore set S = ⋃ (p^a + m^{a+1}) from the powers of gr p, and its analogues S_n in R[[G^{p^n}]], stable under conjugation by G.
- Fu (2024), §4, equation (17), p. 14: Introduces the same set S_0 ⊆ R[[G]], with R the integers of an arbitrary finite extension K of ℚ_p.

### The microlocalisation of R[[G]] is the completed enveloping algebra

**Target `LocallyAnalyticDistributionsPartII:ND.4/lazard-microlocalisation` (theorem).** Let R be a complete discrete valuation ring with uniformiser p, K = Frac R, G a uniform pro-p group with minimal generators g_i and h = (1/p) R L_G with R-basis u_i (corresponding to the g_i). The exponential exp(u) converges in A := Û(h)_K for u ∈ L_G ⊆ p h, and g ↦ exp(log g) is an injective group homomorphism G → A^×; it extends to a strictly filtered ring homomorphism ψ : R[[G]] → A with ψ(b_i) = exp(p u_i) − 1 ≡ p u_i, sending gr p to the invertible symbol s and gr b_i to s u_i. The induced map from the microlocalisation is an isomorphism of complete ℤ-filtered rings Q_{gr p}(R[[G]]) ≅ Û(h)_K. Consequently K[[G]] → Û(h)_K is flat (both sides) and, for finitely generated K[[G]]-modules M, Û(h)_K ⊗_{K[[G]]} M = 0 iff M is S_0-torsion. For n ≥ 0, Q_{gr p}(R[[G^{p^n}]]) ≅ Û(h)_{n,K}.

**Planet.** Ardakov–Wadsley microlocalisation theorem.

**Suggested home.** `TauCeti/NumberTheory/Padics/IwasawaMicrolocal`, namespace `TauCeti.IwasawaMicrolocal`.

**Hypotheses and conventions.**

- R unramified over ℤ_p (p a uniformiser); the ramified case is ND.4/microlocal-coefficient-extension.
- The microlocalisation already inverts p (p ∈ S_0): the target is the rational algebra Û(h)_K, not the integral completion Û(h).

**Proof.**

1. The Campbell–Hausdorff formula (DDMS Theorem 6.28) shows u ∗ v = log(exp u exp v) ∈ L_G, and u ↦ exp u identifies G with exp(L_G) ⊂ A^× (AW13 §10.4, proof, citing the proof of DDMS Theorem 9.10).
2. ψ(b^α) ≡ p^{|α|} u^α mod p^{|α|+1} F_0 A, so with Lazard's degree formula (ND.4/m-adic-filtration) and the PBW basis of the slice gr_0 A ≅ U(h_k), deg ψ(x) = deg x on R[G]; ψ extends by density to a strictly filtered map on R[[G]].
3. gr A ≅ U(h_k)[s, s^{−1}] (AW13 Lemma 3.1), so ψ extends to Q_t(R[[G]]) by the universal property of microlocalisation (ND.4/microlocalisation); it is injective (strictly filtered) and its graded map is surjective, hence it is an isomorphism of complete filtered rings (AW13 Theorem 10.4, proof, pp. 70–71).
4. Flatness and the torsion criterion are ND.4/microlocalisation. The statement for G^{p^n} uses L_{G^{p^n}} = p^n L_G (AW13 Proposition 10.6(a)).

**Needs.** `LocallyAnalyticDistributionsPartII:ND.4/microlocalisation`, `LocallyAnalyticDistributionsPartII:ND.4/microlocal-ore-set`, `LocallyAnalyticDistributionsPartII:ND.4/m-adic-filtration`, `LocallyAnalyticDistributionsPartII:ND.3/completed-enveloping-algebra`, `LocallyAnalyticDistributionsPartII:ND.0/lazard-lie-lattice`, `mathlib:NormedSpace.exp`.

**Acceptance.**

- For G = 1 + pℤ_p ≅ ℤ_p and R = ℤ_p, Q_{gr p}(ℤ_p[[b]]) ≅ ℚ_p⟨u⟩ with b ↦ exp(pu) − 1: the microlocalisation is the Tate algebra of the disc |b| ≤ |p|.
- Lazard's original form: Û(h) is the saturation Sat(R[G]) of the valued group ring (AW13 Remark 10.5(a)).

**Sources.**

- Ardakov–Wadsley (2013), §10.4, Theorem and its proof, pp. 70–71; §10.5, Remarks (a)–(d), p. 71; §10.6 Proposition (a), p. 72: Proves that the microlocalisation of R[[G]] at gr p is isomorphic as a complete filtered ring to Û(h)_K with h = (1/p)R L_G, via g ↦ exp(log g), and notes its relation to Lazard's saturation and to D_{1/p}(G, K).
- Fu (2024), §4, equation (18), p. 14, and the explicit form after Lemma 5.6, p. 19: Uses the flat microlocalisation K[[G]] → Û(g_K), explicitly F ↦ exp(pf) − 1, H ↦ exp(ph) − 1, E ↦ exp(pe) − 1 for the first congruence subgroup.

### The Banach step D_{1/p}(G, K) is the completed enveloping algebra

**Target `LocallyAnalyticDistributionsPartII:ND.4/d-one-over-p` (theorem).** Let p be odd, L/ℚ_p finite, K a complete discretely valued extension of L with integers R, and G an L-uniform group with associated R-Lie algebra g = R ⊗_{o_L} (1/p) L_G. There is a natural isomorphism of K-Banach algebras D_{1/p}(G, K) ≅ Û(g)_K, extending the map g ↦ exp(log g) on G ⊂ D(G, K). For L = ℚ_p, D_{1/p}(G, K) consists of the series Σ d_α b^α with |d_α| p^{−|α|} → 0.

**Planet.** D₁/ₚ(G,K) as a completed enveloping algebra.

**Suggested home.** `TauCeti/NumberTheory/Padics/DistributionAlgebra/Frommer`, namespace `TauCeti.DistributionAlgebra`.

**Hypotheses and conventions.**

- p odd and G uniform (L-uniform for general L).
- The isomorphism is of Banach algebras with the norm ‖·‖_{1/p} on the left and the π-adic norm of the lattice Û(g) on the right; AW14 Lemma 5.2 writes the coefficient condition as finiteness of the supremum (sourceIssues: the completion requires decay to zero).

**Proof.**

1. For K′ ⊆ K unramified over ℚ_p with K/K′ finite (Cohen structure theorem), the Lazard microlocalisation theorem (ND.4/lazard-microlocalisation, AW13 Theorem 10.4) identifies Q_{gr p}(R′G) with Û(g′)_{K′}; both sides are the completion of K′[G] for ‖·‖_{1/p} (AW14 Lemma 5.2, proof, p. 14; AW13 Remark 10.5(c)).
2. Base change to K: Û(g)_K = K ⊗_{K′} Û(g′)_{K′} (ND.3/completed-enveloping-algebra) and D_{1/p}(G, K) = K ⊗_{K′} D_{1/p}(G, K′) from the coefficient description (ND.2/banach-steps).
3. For general L, restriction of scalars from L to ℚ_p and the quotient D(G_0, K) → D(G, K) (AW14 Lemma 5.2, end of proof).

**Needs.** `LocallyAnalyticDistributionsPartII:ND.3/completed-enveloping-algebra`, `LocallyAnalyticDistributionsPartII:ND.2/banach-steps`, `LocallyAnalyticDistributionsPartII:ND.4/lazard-microlocalisation`, `LocallyAnalyticDistributionsPartII:ND.0/lazard-lie-lattice`.

**Acceptance.**

- For G = 1 + pℤ_p ≅ ℤ_p, D_{1/p}(ℤ_p, ℚ_p) ≅ ℚ_p⟨u⟩ with u = log(1 + T)/p: the Tate algebra in u.

**Sources.**

- Ardakov–Wadsley (2014), §5.1 and Lemma 5.2 with proof, p. 14: For an L-uniform group and its R-Lie algebra g = R ⊗ (1/p)L_G, proves a natural isomorphism of K-Banach algebras D_{1/p}(G, K) ≅ Û(g)_K, reducing to an unramified subfield and AW13 Theorem 10.4.
- Ardakov–Wadsley (2013), §10.5, Remark (c), p. 71: Remarks that the algebra Û(h)_K appears as the largest distribution algebra D_{1/p}(G, K) of Schneider–Teitelbaum.
- Fu (2024), §4, p. 12, and the proof of Theorem 5.1, p. 21: Identifies Û(g_K) with D_{1/p}(G, K), citing ST03, AW13 Remark 10.5(c) and AW14 Lemma 5.2.

### Microlocalisation over a ramified coefficient field

**Target `LocallyAnalyticDistributionsPartII:ND.4/microlocal-coefficient-extension` (theorem).** Let K be a finite extension of ℚ_p with integers R (possibly ramified), G uniform, and g_{ℤ_p} = (1/p) L_G. Define the microlocalisation of K[[G]] = K ⊗_{ℚ_p} ℚ_p[[G]] as the base change K ⊗_{ℚ_p} (ℚ_p[[G]] → Û(g_{ℤ_p})_{ℚ_p}) of ND.4/lazard-microlocalisation. Then Û(g_{ℤ_p})_{ℚ_p} ⊗_{ℚ_p} K ≅ Û(g_R)_K with g_R = R ⊗ g_{ℤ_p}, the resulting map K[[G]] → Û(g_R)_K is flat on both sides, it is the unique continuous extension of g ↦ exp(log g), and for a K[[G]]-module M, Û(g_R)_K ⊗_{K[[G]]} M ≅ Û(g_{ℤ_p})_{ℚ_p} ⊗_{ℚ_p[[G]]} M, where M is viewed as a ℚ_p[[G]]-module by restriction.

**Suggested home.** `TauCeti/NumberTheory/Padics/IwasawaMicrolocal`, namespace `TauCeti.IwasawaMicrolocal`.

**Hypotheses and conventions.**

- This replaces Fu's direct use of the set (17) over ramified R (sourceIssues, Fu E4); the microlocal Ore set is used only over ℤ_p.

**Proof.**

1. Base change of completed enveloping algebras along finite K/ℚ_p: ND.3/completed-enveloping-algebra (AW13 Lemma 3.9).
2. Flatness is preserved by base change: K ⊗ Û(g_{ℤ_p})_{ℚ_p} is flat over K ⊗ ℚ_p[[G]] = K[[G]] (Bourbaki, Commutative Algebra I §2.7).
3. Agreement with exp(log g) holds on G ⊂ K[[G]], which is dense; continuity gives uniqueness.
4. For the module formula write B = K ⊗ Û, A = K ⊗ ℚ_p[[G]] and Λ = ℚ_p[[G]]; then B = A ⊗_Λ Û, so B ⊗_A M ≅ Û ⊗_Λ M for every A-module M (associativity of tensor products).

**Needs.** `LocallyAnalyticDistributionsPartII:ND.4/lazard-microlocalisation`, `LocallyAnalyticDistributionsPartII:ND.3/completed-enveloping-algebra`, `mathlib:Module.Flat`, `mathlib:Algebra.TensorProduct.rid`.

**Acceptance.**

- For K = ℚ_p this is ND.4/lazard-microlocalisation with R = ℤ_p.

**Sources.**

- Ardakov–Wadsley (2013), §3.9, Lemma, p. 17: Base change of the π-adic completion of a deformable algebra along a complete finitely ramified extension.
- Fu (2024), §4, equations (17)–(18), p. 14: States the flat microlocalisation K[[G]] → Û(g_K) for a finite extension K of ℚ_p, which this node obtains by base change from ℚ_p.

### Microlocalisation of finitely generated Iwasawa modules

**Target `LocallyAnalyticDistributionsPartII:ND.4/microlocal-module` (construction).** For K finite over ℚ_p, G uniform and M a finitely generated K[[G]]-module, its microlocalisation is M̂ := Û(g_K) ⊗_{K[[G]]} M with the natural K[[G]]-linear map η_M : M → M̂, m ↦ 1 ⊗ m. The functor M ↦ M̂ is exact (flatness, ND.4/microlocal-coefficient-extension), natural in M, sends finitely generated modules to finitely generated Û(g_K)-modules, and M̂ = 0 iff M is S_0-torsion (over K = ℚ_p; over general K after restriction to ℚ_p[[G]]). Microlocalisation is not faithful: S_0-torsion modules are killed; faithful flatness of K[[G]] → D(G, K) (ND.2/faithful-flatness) is a different statement.

**Suggested home.** `TauCeti/NumberTheory/Padics/IwasawaMicrolocal`, namespace `TauCeti.IwasawaMicrolocal`.

**Construction.**

1. Exactness and the torsion criterion are ND.4/microlocalisation and ND.4/lazard-microlocalisation; finite generation is preserved by base change of finitely generated modules.

**Needs.** `LocallyAnalyticDistributionsPartII:ND.4/microlocal-coefficient-extension`, `LocallyAnalyticDistributionsPartII:ND.4/lazard-microlocalisation`, `LocallyAnalyticDistributionsPartII:ND.4/microlocalisation`.

**API.**

- `TauCeti.IwasawaMicrolocal.microlocalModule` (constructor): M̂ := Û(g_K) ⊗_{K[[G]]} M with η_M : M → M̂.
- `TauCeti.IwasawaMicrolocal.microlocalModule_exact` (functoriality): M ↦ M̂ is an exact functor on finitely generated K[[G]]-modules, with (f ∘ g)^ = f̂ ∘ ĝ.
- `TauCeti.IwasawaMicrolocal.microlocalModule_eq_zero_iff` (characterisation): M̂ = 0 iff M is S_0-torsion (K = ℚ_p).
- `TauCeti.IwasawaMicrolocal.microlocalModule_self` (simp): K[[G]]^ = Û(g_K).

**Checks.**

- `microlocalModule_trivial` (computation): For the trivial K[[G]]-module K, K̂ ≅ K and η_K is an isomorphism.
- `microlocalModule_zero` (degenerate): 0̂ = 0.
- `microlocalModule_kills_artin` (non-example): For G = 1 + pℤ_p ≅ ℤ_p with b = (1 + p) − 1, the module M = ℚ_p[[b]]/((1 + b)^p − 1) (functions on the finite quotient G/G^p) has M̂ ≅ ℚ_p: under b ↦ exp(pu) − 1, (1 + b)^p − 1 = exp(p²u) − 1 = p²u·(unit), so only the trivial character survives and the p − 1 nontrivial characters (defined over ℚ_p(ζ_p)) are killed.
- `microlocalModule_not_faithful_vs_distributions` (compatibility): For the same M, D(G, ℚ_p) ⊗ M ≅ M is p-dimensional (faithful flatness), while M̂ is one-dimensional: microlocalisation and passage to distributions differ.

**Uses.**

- Fu Theorem 4.3 and the proof of Theorem 1.4: multiplicities of W_k in M are computed after microlocalisation, and short exact sequences (33)–(34) are preserved.
- Fu Theorem 1.6 (route of PadicEnvelopingAlgebras): growth bounds are proved for cyclic torsion Û(g_K)-modules obtained by microlocalisation.

**Acceptance.**

- M = K[[G]] gives M̂ = Û(g_K); for M = K (trivial module) M̂ = K, since the augmentation of every s ∈ S_0 is a nonzero element of p^a(1 + pR), so S_0 acts invertibly on the trivial module.

**Sources.**

- Fu (2024), §4, the paragraph after equation (18), p. 14: Defines the microlocalisation M̂ = Û(g_K) ⊗_{K[[G]]} M of a finitely generated K[[G]]-module.
- Ardakov–Wadsley (2013), §10.5, Remark (d), p. 71, and §10.6 Proposition (e), p. 72: Notes that the modules killed by base change along R[[G]] → Û(h)_K are exactly the S-torsion modules, and the analogue for the crossed products.

### Lie modules: semisimplicity and the equivalence with finite-dimensional g-modules

**Target `LocallyAnalyticDistributionsPartII:ND.4/lie-modules` (theorem).** Let R be unramified with uniformiser p, G a uniform group which is a congruence kernel ker(𝔾(ℤ_p) → 𝔾(ℤ/p^{m+1})) of a semisimple group scheme 𝔾 over R with Lie algebra 𝔤, p^{m+1}𝔤 = R ⊗ L_G, and U_n = Q_{gr p}(R[[G^{p^n}]]) ≅ Û(𝔤)_{n+m,K} with crossed products U_n ∗ H_n, H_n = G/G^{p^n}. Let ℳ be the category of K[[G]]-modules finite-dimensional over K. (P) If M ∈ ℳ is S_n-torsion-free, η_M : M → (U_n ∗ H_n) ⊗_{K[[G]]} M is an isomorphism; every M ∈ ℳ is S_n-torsion-free for n large. (a) ℳ is semisimple. (b) The Lie modules ℒ ⊆ ℳ (restrictions of finite-dimensional U_0-modules along K[[G]] → U_0) are equivalent, via U_0 ⊗_{K[[G]]} −, to finite-dimensional U(𝔤_K)-modules; a simple Lie module V has End_{K[[G]]}(V) = K. (c) Every simple M ∈ ℳ is V ⊗ ρ with V a simple Lie module and ρ a simple Artin module (some open subgroup acts trivially).

**Planet.** Lie modules.

**Suggested home.** `TauCeti/NumberTheory/Padics/IwasawaMicrolocal`, namespace `TauCeti.IwasawaMicrolocal`.

**Hypotheses and conventions.**

- The semisimplicity and lattice hypotheses of AW13 §10.12 are part of the statement. The very-good-prime restriction of §10.12 is not needed: AW13 §11.1 drops it. For a uniform group with nonsemisimple Lie algebra the conclusion (a) fails: for G = ℤ_p with topological generator γ, K[[G]]/((γ − 1)²) is a nonsplit extension of the trivial module by itself.

**Proof.**

1. (P) for n = 0: a finite-dimensional S-torsion-free module is unchanged by localisation at S, because s acts injectively hence bijectively, and its R-lattice is already p-adically complete (AW13 Proposition 11.1, proof, using Li–Van Oystaeyen I.5.5 for separation); general n by restriction to G^{p^n} and the crossed-product identity (U_n ∗ H_n) ⊗ M ≅ U_n ⊗_{R G^{p^n}} M (AW13 Proposition 10.6(d)). Torsion-freeness for n large: AW13 Corollary 10.11.
2. (a): identify V with a module over U_n ∗ H_n; finite-dimensional U_n-modules are semisimple (AW13 Corollary 9.2), and averaging a U_n-linear projection over H_n in characteristic zero gives a K[[G]]-linear one (AW13 Theorem 11.1(a), citing Passman).
3. (b): restriction and base change are adjoint, and (P) with n = 0 shows the unit and counit are isomorphisms on Lie modules (AW13 Theorem 11.1(b)); End = K by Corollary 11.1.
4. (c): AW13 Theorem 11.2 (factorisation), using isotypy of (U_n ∗ H_n) ⊗ M as a U_n-module (Lemma 11.2).

**Needs.** `LocallyAnalyticDistributionsPartII:ND.4/lazard-microlocalisation`, `LocallyAnalyticDistributionsPartII:ND.4/microlocal-ore-set`, `LocallyAnalyticDistributionsPartII:ND.3/completed-enveloping-algebra`, `LocallyAnalyticDistributionsPartII:ND.0/first-congruence-sl2`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-5-complete-reducibility-weyls-theorem`.

**Acceptance.**

- For G = G_1 ⊂ SL_2(ℤ_p) (m = 0, p odd), the finite-dimensional ℚ_p[[G_1]]-modules are semisimple and Sym^k(ℚ_p²) is a simple Lie module.

**Sources.**

- Ardakov–Wadsley (2013), §10.6 Proposition, pp. 71–72; §10.12, p. 77; §11.1 Definition, Proposition, Theorem and Corollary, pp. 78–80; §11.2 Lemma and Theorem, pp. 80–81: Under the congruence-kernel hypotheses, proves that finite-dimensional S_n-torsion-free modules are unchanged by the crossed-product microlocalisation, that finite-dimensional KG-modules are semisimple, that Lie modules correspond to finite-dimensional U(g_K)-modules, and that simple modules factor as Lie module tensor Artin module.
- Fu (2024), §4, the paragraphs following equation (18), p. 14: Pulls back finite-dimensional irreducible U(g_K)-modules with a g_R-lattice along the microlocalisation, citing AW13 Theorem 11.1 and Corollary 11.1 for irreducibility and semisimplicity.

### The Lie module attached to a finite-dimensional representation

**Target `LocallyAnalyticDistributionsPartII:ND.4/lie-module-of-representation` (construction).** Let K be finite over ℚ_p with integers R, G uniform with g_R = (1/p)R L_G and g_K split semisimple. Let W be a finite-dimensional U(g_K)-module and W_0 ⊆ W a g_R-stable R-lattice. The U(g_R)-action on W_0 extends continuously to Û(g_R) (W_0 is finite free, hence p-adically complete), hence the U(g_K)-action on W extends to Û(g_K); pulling back along the microlocalisation K[[G]] → Û(g_K) (ND.4/microlocal-coefficient-extension) makes W a K[[G]]-module 𝓛(W), a Lie module. Its restriction to G is the representation g ↦ exp(log g) acting on W, and its differentiated action is the given g_K-action. If W is irreducible, 𝓛(W) is irreducible, and End_{K[[G]]}(𝓛(W)) = K.

**Suggested home.** `TauCeti/NumberTheory/Padics/IwasawaMicrolocal`, namespace `TauCeti.IwasawaMicrolocal`.

**Hypotheses and conventions.**

- A g_R-stable lattice exists for every finite-dimensional W (AW13 §9.2, via Humphreys' lattice argument); the K[[G]]-module 𝓛(W) does not depend on its choice.

**Construction.**

1. Continuity of the U(g_R)-action for the p-adic topology of W_0 gives the extension to Û(g_R) and Û(g_K) (Fu §4, p. 14; AW13 §9.2).
2. Independence of the lattice: two lattices are commensurable, and the extended actions agree on the dense subalgebra U(g_K).
3. Irreducibility and End = K: ND.4/lie-modules (b).

**Needs.** `LocallyAnalyticDistributionsPartII:ND.4/lie-modules`, `LocallyAnalyticDistributionsPartII:ND.4/microlocal-coefficient-extension`, `LocallyAnalyticDistributionsPartII:ND.3/completed-enveloping-algebra`, `mathlib:LieModule`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-5-complete-reducibility-weyls-theorem`.

**API.**

- `TauCeti.IwasawaMicrolocal.lieModule` (constructor): 𝓛(W): the K[[G]]-module structure on W obtained from a g_R-stable lattice.
- `TauCeti.IwasawaMicrolocal.lieModule_indep_lattice` (characterisation): 𝓛(W) does not depend on the chosen lattice.
- `TauCeti.IwasawaMicrolocal.lieModule_group_apply` (simp): g ∈ G acts on 𝓛(W) by exp(log g).
- `TauCeti.IwasawaMicrolocal.lieModule_irreducible` (characterisation): W irreducible ⇒ 𝓛(W) irreducible with End = K.
- `TauCeti.IwasawaMicrolocal.lieModule_map` (functoriality): A U(g_K)-linear map W → W′ is K[[G]]-linear 𝓛(W) → 𝓛(W′).

**Checks.**

- `lieModule_trivial` (degenerate): For W = K the trivial g_K-module, 𝓛(W) is the trivial K[[G]]-module (augmentation).
- `lieModule_standard_sl2` (computation): For G = G_1 ⊂ SL_2(ℤ_p) and W = ℚ_p² the standard representation, the element exp(pe) ∈ G_1 acts by the matrix with rows (1, p), (0, 1).
- `lieModule_compat_restriction` (compatibility): For W = Sym^k(ℚ_p²), 𝓛(W) equals the restriction to G_1 of the algebraic representation Sym^k of SL_2(ℤ_p).
- `artin_not_lieModule` (non-example): Over K containing ζ_p, a nontrivial character of G_1 ⊂ SL_2(ℤ_p) trivial on G_1^p (an Artin module) is not a Lie module: a one-dimensional Lie module comes from a one-dimensional sl_2(K)-module, which is trivial because sl_2 is perfect, so G_1 would act trivially.

**Uses.**

- Fu Theorem 4.3 (ND.4/isotypic-comparison): W is the module whose isotypic quotients are compared before and after microlocalisation.
- Fu §6 (ND.6/algebraic-peter-weyl): W_k = ⊠ Sym^{k_i} is a Lie module, so §4 applies to it.

**Acceptance.**

- For G = G_1 ⊂ SL_2(ℤ_p) and W = Sym^k(ℚ_p²) with lattice Sym^k(ℤ_p²), 𝓛(W) is the restriction to G_1 of the algebraic representation of SL_2(ℤ_p) (ND.6/algebraic-peter-weyl).

**Sources.**

- Fu (2024), §4, the paragraphs following equation (18), p. 14: Extends the U(g_R)-action on a lattice W_0 to Û(g_R) and pulls W back along the microlocalisation; calls these Lie modules after AW13 §11.1.
- Ardakov–Wadsley (2013), §9.2, Theorem and its proof, p. 61, and §11.1, Theorem (b) and Corollary, pp. 79–80: Finds a stable R-lattice in a finite-dimensional module and shows Lie modules correspond to finite-dimensional g_K-modules with scalar endomorphisms.

### Microlocalisation preserves W-isotypic quotients

**Target `LocallyAnalyticDistributionsPartII:ND.4/isotypic-comparison` (theorem).** Let K be finite over ℚ_p, G uniform with g_K split semisimple and satisfying the hypotheses of ND.4/lie-modules, W an irreducible finite-dimensional g_K-module with stable lattice, viewed as a Lie module. Write Ann(W) ⊆ U(g_K), Ânn(W) ⊆ Û(g_K) and Ãnn(W) ⊆ K[[G]] for the annihilators, and for a finitely generated K[[G]]-module M put M_W = M/Ãnn(W)M and M̂_W = M̂/Ânn(W)M̂ (the maximal quotients isomorphic to finite sums of W). Then U(g_K)/Ann(W) ≅ Û(g_K)/Ânn(W) ≅ End_K(W), and for every finitely generated K[[G]]-module M the natural map M_W → M̂_W is an isomorphism, naturally in M. In particular K[[G]]/Ãnn(W) ≅ Û(g_K)/Ânn(W) ≅ End_K(W).

**Planet.** Comparison of algebraic quotients.

**Suggested home.** `TauCeti/NumberTheory/Padics/IwasawaMicrolocal`, namespace `TauCeti.IwasawaMicrolocal`.

**Hypotheses and conventions.**

- Surjectivity of K[[G]]/Ãnn(W) → End_K(W) is part of the conclusion: a priori the map is only injective; it follows from the comparison, not from irreducibility of W over an arbitrary field.

**Proof.**

1. U(g_K)/Ann(W) ≅ End_K(W) by the density theorem for the absolutely irreducible module W over the split semisimple g_K (Fu (19), citing Bourbaki VIII §6.2), and U(g_K) is dense in Û(g_K), which acts through the same finite-dimensional quotient.
2. Apply the flat functor M ↦ M̂ to 0 → Ãnn(W)M → M → M_W → 0. M_W is a finite sum of W, hence S_0-torsion-free with S_0 acting invertibly (S_0 consists of units of Û(g_K)), so by ND.4/lie-modules (P) with n = 0, M_W ≅ Û ⊗ M_W, compatibly with the reverse Û-linear map (Fu, proof of Theorem 4.3, p. 15). For ramified K, (P) is applied over ℚ_p: by ND.4/microlocal-coefficient-extension, Û(g_K) ⊗_{K[[G]]} M_W ≅ Û(g_{ℤ_p})_{ℚ_p} ⊗_{ℚ_p[[G]]} M_W, and M_W restricted to ℚ_p[[G]] is finite-dimensional and S_0-torsion-free.
3. Maximality of M̂_W gives Ânn(W)M̂ ⊆ Û ⊗ Ãnn(W)M, and Û·Ãnn(W) ⊆ Ânn(W) gives the reverse inclusion; hence M̂_W = M_W.

**Needs.** `LocallyAnalyticDistributionsPartII:ND.4/lie-module-of-representation`, `LocallyAnalyticDistributionsPartII:ND.4/microlocal-module`, `LocallyAnalyticDistributionsPartII:ND.4/microlocal-coefficient-extension`, `LocallyAnalyticDistributionsPartII:ND.4/lie-modules`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-5-complete-reducibility-weyls-theorem`.

**Acceptance.**

- For M = K[[G]], the theorem gives K[[G]]/Ãnn(W) ≅ End_K(W), the identity used in Fu (32) for W = W_k.

**Sources.**

- Fu (2024), §4, displays (19)–(20) and Theorem 4.3 with its proof, pp. 14–15: Compares the annihilators of W in U(g_K), Û(g_K) and K[[G]] and proves that the W-isotypic quotients of M and of its microlocalisation agree, using flatness and AW13 Proposition 11.1 with n = 0.

### Dependencies

Within this roadmap: Layer ND.0, Layer ND.1, Layer ND.2, Layer ND.3.

On other roadmaps and the libraries: `NoncommutativeAndEquivariantIwasawa:NE.0/iwasawa-local-iff-pro-p`, `NoncommutativeAndEquivariantIwasawa:NE.0/uniform-graded-polynomial`, `NoncommutativeAndEquivariantIwasawa:NE.0/zariskian-noetherian`, `mathlib:Algebra.TensorProduct.rid`, `mathlib:IsRingFiltration`, `mathlib:LieModule`, `mathlib:Module.Flat`, `mathlib:NormedSpace.exp`, `mathlib:OreLocalization`, `mathlib:OreLocalization.OreSet`, `mathlib:UniformSpace.Completion`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-5-complete-reducibility-weyls-theorem`.

## Layer ND.5: Infinitesimal characters and injectivity of central specialisation

The roadmap's endpoint. Fu proves injectivity of ℚ_p[[G]] → Û(g)_λ for induced λ directly, through distributions: density of eigenfunctions in C(G, ℚ_p), the projective limit over the Banach steps, a domain property of central quotients and a crossed-product grade argument. The domain property has a gap at the radii used, recorded here. Ardakov–Wadsley's faithfulness of affinoid Verma modules gives the theorem for every integral λ after a finite coefficient extension, and that is the route the endpoint follows; Fu's route is kept as a separate theorem.

**Targets of the layer.** Central specialisations D(G, K)_λ, D^λ_r, U^λ_r and Û(g)_λ, and the eigenspaces C^la(G, K)[λ]; induced infinitesimal characters (λ induced iff 2λ(Δ) + 1 is a square in ℤ_p for SL₂); strong duality D(G, K)_λ ≅ C^la(G, K)[λ]′_b; the locally analytic principal series and density of eigenfunctions, giving ℚ_p[[G]] ↪ D(G, ℚ_p)_λ for induced λ; D(G, ℚ_p)_λ = lim D^λ_{r_n}; domains among central quotients and the small-radius normal form; Ardakov–Brown's Ext comparison for finite crossed products; the topological PBW normal form of U^λ_{r_n}; Fu's direct route for induced λ; faithfulness of affinoid Verma modules (Ardakov–Wadsley) and the endpoint: for G = G_1^m and every λ ∈ ℤ_p^m, ℚ_p[[G]] → Û(g)_λ is injective.

### Central specialisations of distribution and enveloping algebras

**Target `LocallyAnalyticDistributionsPartII:ND.5/infinitesimal-character-quotients` (construction).** Let G be a compact open subgroup of 𝔾(ℚ_p) for a connected split reductive ℚ_p-group 𝔾 with Lie algebra g, Z(g) the centre of U(g), K/ℚ_p finite and λ : Z(g) → K a character; for generators z_1, …, z_n of the polynomial ring Z(g), ker λ is generated by z_1 − λ(z_1), …, z_n − λ(z_n). Define: D(G, K)_λ := D(G, K) ⊗_{Z(g), λ} K = D(G, K)/Σ_i D(G, K)(z_i − λ(z_i)); C^la(G, K)[λ] := {f ∈ C^an(G, K) : z f = λ(z) f for all z ∈ Z(g)}, z acting through ND.1/central-enveloping-distributions; and similarly D^λ_r(G, K) := D_r(G, K)/D_r(G, K)·ker λ, U^λ_r(g) := U_r(g)/U_r(g)·ker λ and Û(g)_λ := Û(g_K)/Û(g_K)·ker λ. The ideal Σ D(G, K)(z_i − λ(z_i)) is a closed two-sided ideal, so D(G, K)_λ is a Fréchet–Stein algebra and a coadmissible D(G, K)-module, and C^la(G, K)[λ] is a closed G-stable subspace of C^an(G, K), of compact type. For 𝔾 = SL_2^m, Z(g) = K[Δ_1, …, Δ_m] with Δ_i = ½h_i² − h_i + 2e_if_i, and λ is determined by λ = (λ(Δ_i))_i ∈ K^m.

**Suggested home.** `TauCeti/NumberTheory/Padics/DistributionAlgebra/Central`, namespace `TauCeti.DistributionAlgebra`.

**Hypotheses and conventions.**

- Fu writes the kernel of λ on Z(g) through p²Δ + λ_0, so that λ_0 = −p²λ(Δ) in his notation; this roadmap writes λ = λ(Δ) directly.
- Closedness of the ideal uses that it is finitely generated and two-sided (z_i central); a non-closed ideal would not give a Fréchet quotient.

**Construction.**

1. The z_i − λ(z_i) are central (ND.1/central-enveloping-distributions), so the left ideal they generate is two-sided; finitely generated left ideals of a Fréchet–Stein algebra are closed (ND.2/coadmissible-theorems), and quotients by closed two-sided ideals are Fréchet–Stein (ST03 Proposition 3.7).
2. C^la(G, K)[λ] is the joint kernel of the continuous operators z_i − λ(z_i), hence closed; closed subspaces of spaces of compact type are of compact type (LocallyAnalyticDistributions:L0/compact-type-spaces); G-stability holds because z_i acts G-equivariantly.
3. For sl_2, Z(U(sl_2)) = K[Δ] by Harish-Chandra (LieHighestWeight Layer 7); for a product, Z is the tensor product of the centres.

**Needs.** `LocallyAnalyticDistributionsPartII:ND.1/central-enveloping-distributions`, `LocallyAnalyticDistributionsPartII:ND.2/coadmissible-theorems`, `LocallyAnalyticDistributionsPartII:ND.3/radius-enveloping-closure`, `LocallyAnalyticDistributionsPartII:ND.3/completed-enveloping-algebra`, `LocallyAnalyticDistributions:L0/compact-type-spaces`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-7-the-center-of-ul-harish-chandra-freudenthal-and-serres-relations`, `tauceti:TauCeti.casimirElement`.

**API.**

- `TauCeti.DistributionAlgebra.centralQuotient` (constructor): D(G, K)_λ := D(G, K)/D(G, K)·ker λ as a Fréchet–Stein algebra.
- `TauCeti.DistributionAlgebra.centralIdeal_isClosed` (characterisation): D(G, K)·ker λ is closed and two-sided.
- `TauCeti.DistributionAlgebra.eigenspace` (constructor): C^la(G, K)[λ], the joint λ-eigenspace of Z(g), a closed G-stable subspace of compact type.
- `TauCeti.DistributionAlgebra.centralQuotientR` (constructor): D^λ_r(G, K), U^λ_r(g) and Û(g)_λ, the analogous quotients, with the natural maps between them.
- `TauCeti.sl2H` (constructor): h = diag(1, −1), e = E_{12} (TauCeti.sl2E) and f = E_{21} (TauCeti.sl2F) in Mathlib's sl (Fin 2) K.
- `TauCeti.sl2Casimir` (constructor): Δ = ½h² − h + 2ef ∈ U(sl_2(K)), which is 4·(the Killing-form Casimir TauCeti.casimirElement) and acts on Sym^k by ½k(k + 2).
- `TauCeti.sl2Casimir_mem_center` (relation): Δ commutes with every element of U(sl_2(K)).

**Checks.**

- `casimir_acts_symk` (computation): Δ acts on Sym^k(K²) by the scalar ½k(k + 2): on the highest weight vector x^k, h acts by k and e by 0, so Δ x^k = (½k² − k + 2·k)x^k.
- `centralQuotient_trivial_character` (degenerate): For λ = λ(Δ) = 0, the trivial representation K is a quotient of D(G_1, K)_0; for G finite (g = 0) the quotient is D(G, K) itself.
- `casimir_killing_compat` (compatibility): For sl_2 over a field of characteristic zero, Δ = 4·TauCeti.casimirElement (Killing form κ(h, h) = 8, κ(e, f) = 4).
- `centralQuotient_large_zero` (non-example): For the first congruence subgroup (p odd), r = p^{−2/3} and λ = p^{−1}, ‖Δ‖_r ≤ p^{2/3} < p = |λ|, so Δ − λ is a unit of D_r and D^λ_r(G_1, ℚ_p) = 0: central quotients at non-integral parameters can vanish.

**Uses.**

- Fu Theorem 5.2 (ND.5/central-strong-duality): D(G, ℚ_p)_λ is the strong dual of C^la(G, ℚ_p)[λ].
- Fu Theorem 1.5 (ND.5/central-injectivity-theorem): the target of the injectivity theorem is Û(g)_λ.
- Fu Proposition 5.5 and Theorem 5.7: D(G, ℚ_p)_λ = lim_n D^λ_{r_n} and the domain property of D^λ_r.

**Acceptance.**

- On W_k = Sym^k(K²), Δ acts by ½k(k + 2); so W_k is a quotient of D(G_1, K)_λ for λ = ½k(k + 2).

**Sources.**

- Fu (2024), §5, the definitions before Theorem 5.2, p. 16, and of U^λ_r(g), D^λ_r(G, ℚ_p), p. 17; §3, the Casimir Δ_i and the quotients U_λ, Û_λ, pp. 7–8: Defines the infinitesimal specialisations D(G, ℚ_p) ⊗_{Z(g), λ} ℚ_p, C^la(G, ℚ_p)[λ], U^λ_r(g), D^λ_r(G, ℚ_p) and Û(g)_λ, with Δ_i = ½h_i² − h_i + 2e_if_i.
- Schneider–Teitelbaum (2003), §3, Proposition 3.7 and the remark before it, p. 11: Finitely generated left ideals of a Fréchet–Stein algebra are closed, and the quotient by a closed two-sided ideal is Fréchet–Stein.

### Induced infinitesimal characters

**Target `LocallyAnalyticDistributionsPartII:ND.5/induced-infinitesimal-characters` (definition).** In the setting of ND.5/infinitesimal-character-quotients, fix a Borel pair (𝔹, 𝕋) of 𝔾 with T = 𝕋(ℚ_p) ∩ G, B = 𝔹(ℚ_p) ∩ G = TN, and a triangular decomposition g_0 = n̄_0 ⊕ t_0 ⊕ n_0; let HC : Z(g) → U(t) be the Harish-Chandra homomorphism for this decomposition. A locally analytic character χ : T → 1 + pℤ_p has derivative dχ : U(t) → ℚ_p. An infinitesimal character λ : Z(g) → ℚ_p is induced if λ = dχ ∘ HC for some such χ. For 𝔾 = SL_2 and G = G_1, a character χ(diag(t, t⁻¹)) = t^c (c ∈ ℤ_p) gives λ(Δ) = ½c² + c, so λ is induced iff 2λ(Δ) + 1 is the square of an element of ℤ_p; for G = G_1^m, iff each 2λ_i + 1 is a square in ℤ_p.

**Suggested home.** `TauCeti/NumberTheory/Padics/DistributionAlgebra/Central`, namespace `TauCeti.DistributionAlgebra`.

**Hypotheses and conventions.**

- The sign of the linear term in λ(Δ) = ½c² ± c depends on the choice of n versus n̄; the criterion '2λ(Δ) + 1 is a square in ℤ_p' does not.
- Fu Remark 5.8 asserts that λ is induced iff v_p(λ_0) ≥ 2; only the 'only if' direction holds (sourceIssues).

**Construction.**

1. For SL_2, T ∩ G_1 = {diag(t, t⁻¹) : t ∈ 1 + pℤ_p} ≅ ℤ_p, and every continuous character to 1 + pℤ_p is t ↦ t^c, c ∈ ℤ_p, with dχ(h) = c.
2. HC(Δ) = ½h² + h (or ½h² − h for the opposite Borel), so λ(Δ) = ½c² ± c and 2λ(Δ) + 1 = (c ± 1)², a square in ℤ_p; conversely if 2λ + 1 = s², s ∈ ℤ_p, take c = s − 1.

**Needs.** `LocallyAnalyticDistributionsPartII:ND.5/infinitesimal-character-quotients`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-7-the-center-of-ul-harish-chandra-freudenthal-and-serres-relations`, `LocallyAnalyticDistributionsPartII:ND.0/first-congruence-sl2`.

**API.**

- `TauCeti.DistributionAlgebra.IsInducedCharacter` (data): λ = dχ ∘ HC for a locally analytic χ : T → 1 + pℤ_p.
- `TauCeti.DistributionAlgebra.IsSl2InducedParameter` (data): For λ = λ(Δ) ∈ ℤ_p: ∃ s ∈ ℤ_p, 2λ + 1 = s²; by isInduced_sl2_iff this is the induced condition for G_1.
- `TauCeti.DistributionAlgebra.isInduced_sl2_iff` (characterisation): For G_1 ⊂ SL_2(ℤ_p), λ is induced iff 2λ(Δ) + 1 ∈ (ℤ_p)².
- `TauCeti.DistributionAlgebra.isInduced_symk` (example): λ_k = ½k(k + 2) is induced, by χ(t) = t^k.
- `TauCeti.DistributionAlgebra.isInduced_pi` (functoriality): For G = G_1^m, λ is induced iff each component is.

**Checks.**

- `isInduced_symk` (computation): λ(Δ) = ½k(k + 2) is induced for every k ∈ ℕ (2λ + 1 = (k + 1)²).
- `isInduced_zero` (degenerate): λ(Δ) = 0 is induced (c = 0, the trivial character).
- `not_isInduced_three` (non-example): At p = 3, λ(Δ) = 1 is not induced: 2λ + 1 = 3 has odd valuation, so it is not a square in ℚ_3, although λ ∈ ℤ_3.
- `isInduced_valuation_only_if` (non-example): Every induced λ has 2λ(Δ) + 1 a square, hence p²λ(Δ) ∈ p²ℤ_p; the converse fails by not_isInduced_three, so a valuation criterion alone does not characterise induced characters.

**Uses.**

- Fu Theorems 5.1 and 5.2: the direct proof of injectivity uses the locally analytic principal series of an induced character.
- Fu Theorem 1.4: genericity is needed only at the induced parameters λ_k.

**Acceptance.**

- λ_k(Δ) = ½k(k + 2) for W_k is induced (c = k).
- At p = 3, λ(Δ) = 1 is integral but not induced: 2·1 + 1 = 3 is not a square in ℚ_3.

**Sources.**

- Fu (2024), §5, the Harish-Chandra homomorphism (24) and the definition of induced characters, p. 16; Remark 5.8, pp. 20–21: Defines induced infinitesimal characters λ = dχ ∘ HC for analytic torus characters χ : T → 1 + pℤ_p and claims a valuation criterion for being induced.

### Strong duality after infinitesimal specialisation

**Target `LocallyAnalyticDistributionsPartII:ND.5/central-strong-duality` (theorem).** In the setting of ND.5/infinitesimal-character-quotients with K = ℚ_p (or K finite over ℚ_p), the pairing D(G, K) × C^an(G, K) → K induces a topological isomorphism of Fréchet spaces D(G, K)_λ ≅ (C^la(G, K)[λ])′_b. Equivalently, the annihilator of C^la(G, K)[λ] in D(G, K) is the closed ideal D(G, K)·ker λ.

**Planet.** Strong duality after infinitesimal specialisation.

**Suggested home.** `TauCeti/NumberTheory/Padics/DistributionAlgebra/Central`, namespace `TauCeti.DistributionAlgebra`.

**Hypotheses and conventions.**

- G compact open in the ℚ_p-points of a connected split reductive group, so that Z(g) acts centrally and G-equivariantly.

**Proof.**

1. The z_i − λ(z_i) act by continuous G-equivariant endomorphisms of C^an(G, K) (ND.1/central-enveloping-distributions), giving the strict left exact sequence 0 → C^la(G, K)[λ] → C^an(G, K) → C^an(G, K)^n, f ↦ ((z_i − λ(z_i))f)_i (Fu (25)–(26)).
2. Dualise: for spaces of compact type the strong dual is exact on strict sequences and the closed subspace C^la[λ] has dual the quotient of D(G, K) by its annihilator (LocallyAnalyticDistributions:L0/compact-type-nuclear-duality and L0/compact-type-extension-duality, with Hahn–Banach over the spherically complete K).
3. The annihilator is the closure of the image of the transposed map D(G, K)^n → D(G, K), (μ_i) ↦ Σ μ_i(z_i − λ(z_i)) (up to the antipode, which preserves Z(g)); that image is the finitely generated ideal D(G, K)·ker λ, closed by ND.2/coadmissible-theorems. Fu obtains the same identification from ST03 Theorem 6.3.

**Needs.** `LocallyAnalyticDistributionsPartII:ND.5/infinitesimal-character-quotients`, `LocallyAnalyticDistributionsPartII:ND.1/central-enveloping-distributions`, `LocallyAnalyticDistributionsPartII:ND.2/coadmissible-theorems`, `LocallyAnalyticDistributions:L0/compact-type-nuclear-duality`, `LocallyAnalyticDistributions:L0/compact-type-extension-duality`, `LocallyAnalyticDistributions:L0/nonarchimedean-hahn-banach`, `LocallyAnalyticDistributions:L0/locally-analytic-dual-nuclear`.

**Acceptance.**

- For λ = λ_k, W_k^* ⊗ W_k ⊆ C^la(G, K)[λ_k] (matrix coefficients, ND.6/algebraic-peter-weyl), and dually D(G, K)_{λ_k} surjects onto End_K(W_k).

**Sources.**

- Fu (2024), Theorem 5.2, first assertion, and its proof, equations (25)–(26), p. 16: Identifies D(G, ℚ_p) ⊗_{Z(g), λ} ℚ_p with the strong dual of the compact-type space C^la(G, ℚ_p)[λ], using ST02 Proposition 3.7 and ST03 Theorem 6.3.
- Schneider–Teitelbaum (2002, JAMS), §3, Proposition 3.7, p. 16: Z(g) is central in D(G, K), so its elements act by G-equivariant endomorphisms.

### The locally analytic principal series and a nowhere-vanishing eigenfunction

**Target `LocallyAnalyticDistributionsPartII:ND.5/principal-series-eigenfunction` (construction).** In the setting of ND.5/induced-infinitesimal-characters, for a locally analytic character χ : T → 1 + pℤ_p let Ind(χ) := {f ∈ C^an(G, ℚ_p) : f(gtn) = χ(t) f(g) for g ∈ G, t ∈ T, n ∈ N}, a closed G-stable subspace (G acting by left translation). Z(g) acts on Ind(χ) by the induced character λ = dχ ∘ HC, so Ind(χ) ⊆ C^la(G, ℚ_p)[λ]. Choosing a locally analytic section of G → X := G/B over a finite disjoint open cover of X, one obtains a topological isomorphism Ind(χ) ≅ C^an(X, ℚ_p) and a function f_0 ∈ Ind(χ) with f_0(g) ≠ 0 for every g ∈ G; then f_0·φ ∈ C^la(G, ℚ_p)[λ] for every smooth (locally constant) φ on G.

**Suggested home.** `TauCeti/NumberTheory/Padics/DistributionAlgebra/Central`, namespace `TauCeti.DistributionAlgebra`.

**Hypotheses and conventions.**

- The section is locally analytic on a finite disjoint cover, not a single global analytic section of the flag variety; this suffices because X is compact and totally disconnected.
- Z(g) acts on C^an(G, ℚ_p) by differential operators, which are local: on each open set where φ is constant, z(φ f_0) = φ·z(f_0).

**Construction.**

1. X = G/B is a compact ℚ_p-analytic manifold and G → X is a locally trivial B-bundle with locally analytic sections over a finite disjoint open cover (LocallyAnalyticDistributions:L0/analytic-manifold-atlases); Ind(χ) ≅ C^an(X, ℚ_p) by restricting along the section (Fu, proof of Theorem 5.2, p. 17).
2. Take f_0 the function equal to 1 on the image of the section, extended by f_0(s(x)tn) = χ(t); it never vanishes since χ takes values in 1 + pℤ_p.
3. Z(g) acts on Ind(χ) through dχ ∘ HC: in the triangular PBW decomposition z = HC(z) + (terms ending in n), right N-invariance kills the second part and right T-equivariance makes U(t) act through dχ (Fu, p. 16, after the definition of Ind(χ)); multiplication by a locally constant function commutes with differential operators on each open set where it is constant.

**Needs.** `LocallyAnalyticDistributionsPartII:ND.5/induced-infinitesimal-characters`, `LocallyAnalyticDistributionsPartII:ND.5/infinitesimal-character-quotients`, `LocallyAnalyticDistributions:L0/analytic-manifold-atlases`, `LocallyAnalyticDistributions:L0/locally-analytic-function-space`.

**API.**

- `TauCeti.DistributionAlgebra.principalSeries` (constructor): Ind(χ) ⊆ C^an(G, ℚ_p), closed and G-stable.
- `TauCeti.DistributionAlgebra.principalSeries_eigen` (characterisation): Z(g) acts on Ind(χ) by dχ ∘ HC.
- `TauCeti.DistributionAlgebra.principalSeries_equiv` (equivalence): Ind(χ) ≅ C^an(G/B, ℚ_p) after a choice of locally analytic section on a finite disjoint cover.
- `TauCeti.DistributionAlgebra.nonvanishingEigenfunction` (constructor): f_0 ∈ Ind(χ) with f_0(g) ≠ 0 for all g.
- `TauCeti.DistributionAlgebra.smul_locallyConstant_mem_eigenspace` (relation): f_0·φ ∈ C^la(G, ℚ_p)[λ] for locally constant φ.

**Checks.**

- `principalSeries_trivial` (degenerate): For χ = 1, Ind(χ) contains the constant function 1, and f_0 = 1.
- `principalSeries_sl2_value` (computation): For G = G_1 ⊂ SL_2(ℤ_p) and χ(t) = t^c, f_0(diag(t, t⁻¹)) = t^c on T ∩ G_1, e.g. f_0(diag(1 + p, (1 + p)⁻¹)) = (1 + p)^c.
- `principalSeries_nonvanishing` (characterisation): f_0(g) ∈ 1 + pℤ_p for every g ∈ G, so |f_0| = 1 and f_0 is a unit of C(G, ℚ_p).
- `one_not_mem_principalSeries` (non-example): For χ ≠ 1 the constant function 1 is not in Ind(χ): 1(gt) = 1 ≠ χ(t) for any t ∈ T with χ(t) ≠ 1.

**Uses.**

- Fu Theorem 5.2, second part (ND.5/eigenspace-density-injectivity): f_0 times smooth functions is a dense subspace of C(G, ℚ_p) inside C^la[λ].

**Acceptance.**

- For χ trivial, Ind(χ) = C^an(G/B, ℚ_p) and f_0 = 1; λ = HC^*(0) is the infinitesimal character of the trivial representation.

**Sources.**

- Fu (2024), §5, the definition of Ind(χ), p. 16, and the proof of Theorem 5.2, second part, p. 17: Defines the locally analytic principal series, uses a splitting X ↪ G ↠ X to identify Ind(χ) with C^la(X, ℚ_p), and chooses a nowhere-vanishing f_0 with infinitesimal character λ.

### Density of eigenfunctions and injectivity into D(G, ℚ_p)_λ

**Target `LocallyAnalyticDistributionsPartII:ND.5/eigenspace-density-injectivity` (theorem).** Let λ be an induced infinitesimal character. Then C^la(G, ℚ_p)[λ] is dense in C(G, ℚ_p) for the supremum norm, and consequently the composite ℚ_p[[G]] → D(G, ℚ_p) → D(G, ℚ_p)_λ is injective.

**Suggested home.** `TauCeti/NumberTheory/Padics/DistributionAlgebra/Central`, namespace `TauCeti.DistributionAlgebra`.

**Hypotheses and conventions.**

- Only induced λ are treated by this argument; for non-induced integral λ injectivity is proved through Verma modules (ND.5/central-injectivity-theorem).

**Proof.**

1. f_0·C^sm(G, ℚ_p) ⊆ C^la(G, ℚ_p)[λ] (ND.5/principal-series-eigenfunction); since f_0 is a unit of C(G, ℚ_p) and C^sm(G, ℚ_p) is dense in C(G, ℚ_p), so is f_0·C^sm(G, ℚ_p) (Fu, proof of Theorem 5.2, p. 17).
2. ℚ_p[[G]] is the continuous dual of C(G, ℚ_p) (bounded measures, PadicMeasuresIwasawaAlgebras L0–L1). A measure μ whose image in D(G, ℚ_p)_λ = (C^la[λ])′_b (ND.5/central-strong-duality) vanishes kills the dense subspace C^la[λ], hence μ = 0.

**Needs.** `LocallyAnalyticDistributionsPartII:ND.5/principal-series-eigenfunction`, `LocallyAnalyticDistributionsPartII:ND.5/central-strong-duality`, `LocallyAnalyticDistributionsPartII:ND.1/iwasawa-to-distributions`, `PadicMeasuresIwasawaAlgebras:L0`.

**Acceptance.**

- For λ = λ_0 = 0 (χ trivial), the function f_0 = 1 already shows that the locally constant functions lie in C^la[0].

**Sources.**

- Fu (2024), Theorem 5.2, second assertion, and its proof, pp. 16–17: Proves that for induced λ the composite ℚ_p[[G]] → D(G, ℚ_p) ⊗_{Z(g), λ} ℚ_p is injective, by density of f_0·C^sm(G, ℚ_p) in C(G, ℚ_p).

### Central specialisation commutes with the Banach steps

**Target `LocallyAnalyticDistributionsPartII:ND.5/central-projective-limit` (theorem).** In the setting of ND.5/infinitesimal-character-quotients with G = G_1^m (p odd) and r_n = p^{−1/p^n}, the natural map D(G, ℚ_p)_λ → lim_n D^λ_{r_n}(G, ℚ_p) is an isomorphism of Fréchet algebras.

**Suggested home.** `TauCeti/NumberTheory/Padics/DistributionAlgebra/Central`, namespace `TauCeti.DistributionAlgebra`.

**Hypotheses and conventions.**

- The isomorphism is not formal (tensor products do not commute with inverse limits in general); it uses coadmissibility of the central quotient.

**Proof.**

1. I = D(G, ℚ_p)·ker λ is a closed two-sided ideal (ND.5/infinitesimal-character-quotients), so ST03 Proposition 3.7 (ND.2/coadmissible-theorems) gives D/I ≅ lim_n D_{r_n}/D_{r_n}I, and D_{r_n}I = D_{r_n}·ker λ because ker λ is generated by central elements; the r_n are cofinal in p^ℚ ∩ (1/p, 1).
2. Fu's proof instead dualises: by Theorem 5.2, D_λ ≅ (C^la[λ])′_b = lim_n (C^{n,an}[λ])′_b, and the deep translation estimate ‖g − 1‖ ≤ 1/p on C^{n,an}(G, ℚ_p) for g ∈ G^{p^{n+1}} gives maps D_{r_{n+1}} → (C^{n,an})′_b (Fu (28)–(29)); both routes give the same map on Dirac distributions.

**Needs.** `LocallyAnalyticDistributionsPartII:ND.5/infinitesimal-character-quotients`, `LocallyAnalyticDistributionsPartII:ND.2/coadmissible-theorems`, `LocallyAnalyticDistributionsPartII:ND.2/frechet-stein-distribution`, `LocallyAnalyticDistributionsPartII:ND.5/central-strong-duality`.

**Acceptance.**

- For λ = λ_k each D^λ_{r_n} surjects onto End(W_k), compatibly in n.

**Sources.**

- Fu (2024), Proposition 5.5 and its proof, with the estimate preceding (29), pp. 18–19: Proves D(G, ℚ_p) ⊗_{Z(g), λ} ℚ_p ≅ lim_n D^λ_{r_n}(G, ℚ_p) by strong duality and the action of D_{r_{n+1}} on the Banach spaces C^{n,an}(G, ℚ_p).
- Schneider–Teitelbaum (2003), Proposition 3.7 and its proof, pp. 11–12: For a closed two-sided ideal I of a Fréchet–Stein algebra, A/I ≅ lim_n A_{q_n}/A_{q_n}I.

### Central quotients D^λ_r(G_1^m, ℚ_p) are domains for integral λ

**Target `LocallyAnalyticDistributionsPartII:ND.5/radius-central-domain` (theorem).** Let p be odd, G = G_1^m, λ ∈ ℤ_p^m and 1/p < r < 1. Put Δ′_i = p²Δ_i, expressed in the coordinates F_i, H_i, E_i (ND.0/first-congruence-sl2) through pf_i = log(1 + F_i), ph_i = log(1 + H_i), pe_i = log(1 + E_i). (i) For 1/p < r′ < p^{−1/2}, the principal symbol of Δ′_i − p²λ_i for the norm ‖·‖_{r′} is ½H_i² + 2E_iF_i, and gr_{r′} D_{r′}(G, ℚ_p)/(Δ′_i − p²λ_i)_i ≅ 𝔽_p[ε, ε⁻¹][F_i, H_i, E_i]/(½H_i² + 2E_iF_i)_i, an integral domain. (ii) Consequently D^λ_r(G, ℚ_p) is an integral domain for every 1/p < r < p^{−1/2} (taking r′ = r). (iii) For p^{−1/2} ≤ r < 1, in particular for the radii r_n = p^{−1/p^n} used in ND.5/fu-direct-injectivity, the same conclusion holds provided the filtration induced by ‖·‖_{r′} on D_r/D_r·ker λ is separated, i.e. D_r ∩ D_{r′}·ker λ = D_r·ker λ inside D_{r′}; this separatedness is a recorded gap. For p ≥ 5 the radii p^{−1/2} ≤ r < p^{−1/(p−1)} are covered directly by ND.5/small-radius-central, so the open range is p^{−1/(p−1)} ≤ r < 1, which contains every r_n. (iv) For non-integral parameters the statement fails: for r = p^{−2/3} and λ(Δ) = p^{−1}, D^λ_r(G_1, ℚ_p) = 0.

**Suggested home.** `TauCeti/NumberTheory/Padics/DistributionAlgebra/Central`, namespace `TauCeti.DistributionAlgebra`.

**Hypotheses and conventions.**

- Integrality of λ (v_p(p²λ) ≥ 2) is necessary: Fu Theorem 5.7 states the domain property for all λ and all 1/p < r < 1 (sourceIssues E7).
- At the radius r = r_n itself the direct graded argument fails: there the logarithm log(1 + X) has principal symbol p^{−n}σ(X)^{p^n}, so the symbol of p²Δ − p²λ for ‖·‖_{r_n} is a unit times (½H² + 2EF)^{p^n} (Frobenius is additive in characteristic p), and the graded ring of D^λ_{r_n} has nilpotents. This is why the source passes to a weaker norm.

**Proof.**

1. gr_{r′} D_{r′}(G_1, ℚ_p) ≅ 𝔽_p[ε, ε⁻¹][F, H, E] (ND.2/banach-step-structure, using ST03 Theorem 4.5 under (HYP)), and for r′ < p^{−1/2} the logarithms log(1 + X) have principal symbol X, since max_k r′^k/|k| = r′ (Fu, proof of Theorem 5.7).
2. p²Δ − p²λ = ½(log(1 + H))² − p log(1 + H) + 2 log(1 + E) log(1 + F) − p²λ has symbol ½H² + 2EF when v_p(p²λ) ≥ 2; ½H² + 2EF is irreducible over the algebraic closure (it is a nondegenerate quadratic form in three variables), so the quotient of the polynomial ring is a domain, also for products (Fu Lemma 3.3, third part).
3. Fu Lemma 2.2 identifies gr of A/A·a with gr A/gr a when gr a is regular; with a separated induced filtration this transfers the domain property from the graded ring to D^λ_r. For r′ = r < p^{−1/2} separatedness holds because the ideal is closed (finitely generated in a noetherian Banach algebra, ST03 Proposition 2.1).
4. (iv): ‖Δ‖_r ≤ p^{2/3} < p = |λ| makes Δ − λ = −λ(1 − Δ/λ) a unit by the geometric series.

**Needs.** `LocallyAnalyticDistributionsPartII:ND.2/banach-step-structure`, `LocallyAnalyticDistributionsPartII:ND.5/infinitesimal-character-quotients`, `LocallyAnalyticDistributionsPartII:ND.0/first-congruence-sl2`, `LocallyAnalyticDistributionsPartII:ND.4/microlocalisation`, `LocallyAnalyticDistributionsPartII:ND.5/small-radius-central`.

**Acceptance.**

- For λ = λ_k and r < p^{−1/2}, D^{λ_k}_r(G_1, ℚ_p) is a domain surjecting onto End(W_k) for k ≥ 1 — a domain with a matrix-algebra quotient, which is consistent because the kernel is a nonzero two-sided ideal.

**Sources.**

- Fu (2024), Theorem 5.7 and its proof, p. 20, with Lemma 2.2, p. 6, and Lemma 3.3, p. 9: Shows that D^λ_r(G, ℚ_p) is an integral domain by computing its graded ring for a weaker norm ‖·‖_{r′}, r′ < p^{−1/2}, and identifying the symbol of p²Δ + λ_0 with ½H² + 2EF.

### Small radii: logarithmic coordinates and central quotients

**Target `LocallyAnalyticDistributionsPartII:ND.5/small-radius-central` (theorem).** Let p be odd, G = G_1^m and p^{−1} ≤ r < p^{−1/(p−1)}, any real radius; put ρ = pr. (i) The map e_i, f_i, h_i ↦ p^{−1} log(1 + E_i), p^{−1} log(1 + F_i), p^{−1} log(1 + H_i) extends to an isometric isomorphism of Banach algebras from the completion B_ρ of U(sl_2(ℤ_p)^m) ⊗ ℚ_p for the weighted PBW norm |Σ c_α x^α|_ρ = sup |c_α| ρ^{|α|} onto D_r(G, ℚ_p), with inverse given on group coordinates by b_i ↦ exp(p x_i) − 1. (ii) For λ ∈ ℤ_p^m the ideal D_r·ker λ is closed and D^λ_r(G, ℚ_p) is a nonzero integral domain, with an explicit normal form: every element is uniquely Σ_α d_α Π_i e_i^{a_i} f_i^{b_i} h_i^{c_i} with c_i ∈ {0, 1} and |d_α| ρ^{|α|} → 0, and the quotient norm is attained on normal forms.

**Suggested home.** `TauCeti/NumberTheory/Padics/DistributionAlgebra/Central`, namespace `TauCeti.DistributionAlgebra`.

**Hypotheses and conventions.**

- This is a derived statement, not printed in the source: it combines Fu's equations (27) and (30) with the convergence of log and exp on the stated range; no rationality of log_p r is needed.
- It does not cover the radii r_n = p^{−1/p^n} ≥ p^{−1/p}, which exceed p^{−1/(p−1)}.

**Proof.**

1. For r < p^{−1/(p−1)}, ‖log(1 + b) − b‖_r < ‖b‖_r and exp(px) − 1 converges, so log(1 + b_i) and b_i have the same norm r and the coordinate changes are mutually inverse isometries (compare Fu (27) and (30)); the ρ = pr normalisation accounts for x = p^{−1} log(1 + b).
2. Normal form: in B_ρ divide by Δ − λ using h² = 2(Δ − λ) + 2λ + 2h − 4ef; for |λ| ≤ 1 ≤ ρ² each reduction step does not increase the weighted norm, so division has bounded quotient and remainder, the ideal is closed and the normal forms give a topological basis (cf. Fu Lemma 3.3, first part, for the algebraic basis).
3. Domain: for ρ > 1 the graded ring for |·|_ρ is 𝔽_p[ε, ε⁻¹][e, f, h]/(½h² + 2ef) (rescaled), a domain, and the ideal is closed, so the induced filtration is separated and Fu Lemma 2.2 transfers the domain property; at ρ = 1 (r = 1/p) the quotient is Û(sl_2(ℤ_p)^m)_λ, a domain by Fu Lemma 3.3 (last part).

**Needs.** `LocallyAnalyticDistributionsPartII:ND.2/banach-steps`, `LocallyAnalyticDistributionsPartII:ND.2/banach-step-structure`, `LocallyAnalyticDistributionsPartII:ND.3/completed-enveloping-algebra`, `LocallyAnalyticDistributionsPartII:ND.5/infinitesimal-character-quotients`, `LocallyAnalyticDistributionsPartII:ND.0/first-congruence-sl2`.

**Acceptance.**

- At r = p^{−1}, ρ = 1 and B_1 = Û(sl_2(ℤ_p)^m)_{ℚ_p}, recovering ND.4/d-one-over-p for G_1^m.

**Sources.**

- Fu (2024), §5, equations (27) and (30), pp. 17 and 20; Lemma 3.3, p. 9: Gives Frommer's description of U_r(g) in logarithmic coordinates, the identification x ↦ log(1 + (x − 1)) of the Lie action, and the basis e^a f^b h^c (c ∈ {0, 1}) of U(sl_2)/(Δ − r).
- Schneider–Teitelbaum (2003), Theorem 4.5, p. 22: Multiplicativity of ‖·‖_r on D_r(G, K) used to compute norms of logarithms.

### Ext and grade over a finite crossed product

**Target `LocallyAnalyticDistributionsPartII:ND.5/crossed-product-ext-comparison` (theorem).** Let T = R ∗ H be a crossed product of a ring R by a finite group H and M a right T-module. Then Ext^i_T(M, T) ≅ Ext^i_R(M, R) as left R-modules for all i ≥ 0; the left-module version holds by passing to opposite rings. Consequently, if R and T are noetherian (Auslander–Gorenstein), the grade j_T(M) = inf{i : Ext^i_T(M, T) ≠ 0} equals j_R(M), and the injective dimensions of R and T agree.

**Suggested home.** `TauCeti/RingTheory/CrossedProduct/Ext`, namespace `TauCeti.CrossedProduct`.

**Proof.**

1. Ext^i_T(−, T) and Ext^i_R(−, R) are derived from Hom_T(−, T) and Hom_R(−, R); T is free of finite rank over R, so projective T-resolutions restrict to projective R-resolutions, and it suffices to show T ≅ Hom_R(T_R, R_R) as right T-modules (AB07 §5.4 Lemma, proof).
2. The isomorphism is α(f) = Σ_{g∈H} f(ḡ) ḡ⁻¹, with inverse β(Σ r_g ḡ)(h̄) = r_{h⁻¹}: the coefficient-of-identity Frobenius pairing (AB07 p. 17).

**Needs.** `LocallyAnalyticDistributionsPartII:ND.1/open-subgroup-decomposition`, `mathlib:IsNoetherianRing`.

**Acceptance.**

- For H trivial the statement is a tautology; for R a field and T = R[H] (trivial action and twisting), Ext^i_{R[H]}(M, R[H]) ≅ Ext^i_R(M, R) = 0 for i > 0, reflecting that group algebras of finite groups are self-injective.

**Sources.**

- Ardakov–Brown (2007), §5.4, Lemma and its proof, and the Corollary, pp. 16–17: Proves Ext^i_T(M, T) ≅ Ext^i_R(M, R) for a crossed product T = R ∗ G with G finite, via T ≅ Hom_R(T, R), and deduces equality of injective dimensions.
- Fu (2024), §5, proof of Theorem 5.1, p. 21: Applies [AB07, Cor 5.4] to compare codimensions of D^λ_r/δD^λ_r over D^λ_r and over U^λ_r.

### Topological PBW normal form of U^λ_r(g) and its injection into Û(g)_λ

**Target `LocallyAnalyticDistributionsPartII:ND.5/central-radius-normal-form` (theorem).** Let p be odd, G = G_1^m, λ ∈ ℤ_p^m and r = r_n (n ≥ 1). Then U_{r_n}(g) is the weighted completion of U(sl_2(ℤ_p)^m) ⊗ ℚ_p for the PBW weight p^n on each of e_i, f_i, h_i; every element of U^λ_{r_n}(g) is uniquely a convergent sum Σ_α d_α Π_i e_i^{a_i} f_i^{b_i} h_i^{c_i} with c_i ∈ {0, 1} and |d_α|·p^{n|α|} → 0; U^λ_{r_n}(g) is an integral domain; and the natural map U^λ_{r_n}(g) → Û(g)_λ is injective, Û(g)_λ having the same normal forms with weight 1.

**Suggested home.** `TauCeti/NumberTheory/Padics/DistributionAlgebra/Central`, namespace `TauCeti.DistributionAlgebra`.

**Hypotheses and conventions.**

- The source leaves this normal form to the reader; the bounded division below supplies it. Separatedness of the quotient topology and the injection are proved together from the normal form, never by assuming the injection.

**Proof.**

1. Frommer's description (ND.3/frommer-theorem) with x_i = log(g_i) ∈ {ph_i, pe_i, pf_i} and ‖x_i‖_{r_n} = p^{n−1} (ND.3/crossed-product-radius) shows that U_{r_n}(g) consists of Σ c_α e^a f^b h^c with |c_α| p^{n|α|} → 0, i.e. the weighted completion with weight p^n.
2. Bounded division by Δ_i − λ_i: replace h_i² by 2(Δ_i − λ_i) + 2λ_i + 2h_i − 4e_if_i; with weight ρ = p^n ≥ 1 and |λ_i| ≤ 1 no reduction step increases the weighted norm, so every element has a unique normal form with remainder bounded by the norm, the ideal is closed and the quotient norm is the sup norm on normal forms (Fu Lemma 3.3, first part, for the algebraic basis of U(sl_2)/(Δ − λ)).
3. Domain: the graded ring for the weighted norm is 𝔽_p[ε, ε⁻¹][e_i, f_i, h_i]/(½h_i² + 2e_if_i), a domain (Fu Lemma 3.3, third part, and Lemma 2.2).
4. Injectivity: the inclusion of the weight-p^n completion into the weight-1 completion Û(g) maps normal forms to normal forms with the same coefficients.

**Needs.** `LocallyAnalyticDistributionsPartII:ND.3/frommer-theorem`, `LocallyAnalyticDistributionsPartII:ND.3/crossed-product-radius`, `LocallyAnalyticDistributionsPartII:ND.3/completed-enveloping-algebra`, `LocallyAnalyticDistributionsPartII:ND.5/infinitesimal-character-quotients`, `LocallyAnalyticDistributionsPartII:ND.4/microlocalisation`.

**Acceptance.**

- For λ = λ_k the normal form of U^λ_r(g) maps onto End(W_k); the kernel is the ideal of normal forms vanishing on W_k.

**Sources.**

- Fu (2024), Proof of Theorem 5.1, the displayed description of U^λ_r(g) and the injection into Û(g) ⊗_{Z(g), λ} ℚ_p, p. 21; Lemma 3.3, pp. 9–10: States the topological basis of U^λ_r(g) by monomials e^a f^b h^c with c ∈ {0, 1}, leaving the proof to the reader, and the injectivity of U^λ_r(g) → Û(g)_λ; Lemma 3.3 gives the algebraic basis and the domain property.

### Injectivity of central specialisation for induced characters (direct route)

**Target `LocallyAnalyticDistributionsPartII:ND.5/fu-direct-injectivity` (theorem).** Let p be odd, G = G_1^m and λ an induced infinitesimal character. Then the composite ℚ_p[[G]] → Û(g_{ℚ_p}) → Û(g)_λ of the microlocalisation (ND.4/lazard-microlocalisation) and central specialisation is injective.

**Suggested home.** `TauCeti/NumberTheory/Padics/DistributionAlgebra/Central`, namespace `TauCeti.DistributionAlgebra`.

**Hypotheses and conventions.**

- This route depends on ND.5/radius-central-domain at the radii r_n, whose proof has a recorded gap (separatedness); the theorem itself, and its extension to all λ ∈ ℤ_p^m, are established independently by ND.5/central-injectivity-theorem.

**Proof.**

1. For 0 ≠ δ ∈ ℚ_p[[G]], its image in D(G, ℚ_p)_λ is nonzero (ND.5/eigenspace-density-injectivity), so by ND.5/central-projective-limit its image in D^λ_{r_n} is nonzero for some n.
2. D^λ_{r_n} is a noetherian domain (ND.5/radius-central-domain, with its gap) and Auslander–Gorenstein (its graded ring is a commutative hypersurface; AW13 Proposition 2.5(b)), so the torsion module D^λ_{r_n}/δD^λ_{r_n} has positive grade (AW13 Proposition 2.5(a), condition (iii) of an exact dimension function).
3. D^λ_{r_n} = U^λ_{r_n} ∗ (G/G^{p^n}) (ND.3/crossed-product-radius), so the grade over U^λ_{r_n} is the same (ND.5/crossed-product-ext-comparison). If U^λ_{r_n} ∩ δD^λ_{r_n} were 0, U^λ_{r_n} would embed in D^λ_{r_n}/δD^λ_{r_n}, contradicting grade j(U^λ_{r_n}) = 0; hence there is δ′ with 0 ≠ δδ′ ∈ U^λ_{r_n}.
4. U^λ_{r_n} → Û(g)_λ is injective (ND.5/central-radius-normal-form), and Û(g) = D_{1/p}(G, ℚ_p) (ND.4/d-one-over-p), so the image of δδ′, hence of δ, in Û(g)_λ is nonzero.

**Needs.** `LocallyAnalyticDistributionsPartII:ND.5/eigenspace-density-injectivity`, `LocallyAnalyticDistributionsPartII:ND.5/central-projective-limit`, `LocallyAnalyticDistributionsPartII:ND.5/radius-central-domain`, `LocallyAnalyticDistributionsPartII:ND.5/crossed-product-ext-comparison`, `LocallyAnalyticDistributionsPartII:ND.5/central-radius-normal-form`, `LocallyAnalyticDistributionsPartII:ND.3/crossed-product-radius`, `LocallyAnalyticDistributionsPartII:ND.4/d-one-over-p`, `LocallyAnalyticDistributionsPartII:ND.4/lazard-microlocalisation`.

**Acceptance.**

- For m = 1 and λ = λ_k = ½k(k + 2) (induced by χ(t) = t^k), every nonzero δ ∈ ℚ_p[[G_1]] has nonzero image in Û(g)_{λ_k}, although its image in End(W_k) may vanish.

**Sources.**

- Fu (2024), Theorem 5.1 and its proof, pp. 16 and 21: Proves injectivity of ℚ_p[[G]] → Û(g) ⊗_{Z(g), λ} ℚ_p for induced λ via Theorem 5.2, Proposition 5.5, Theorem 5.7, AW13 Proposition 2.5, Proposition 5.3, AB07 and the normal form of U^λ_r(g).
- Ardakov–Wadsley (2013), §2.5, Definitions and Proposition, pp. 9–10: Auslander–Gorenstein rings, grade and canonical dimension; d_A is an exact dimension function, and Zariskian filtrations with Auslander–Gorenstein graded ring give Auslander–Gorenstein rings.

### Integral Casimir parameters come from integral highest weights after a finite extension

**Target `LocallyAnalyticDistributionsPartII:ND.5/integral-casimir-roots` (lemma).** Let p be odd and λ = (λ_1, …, λ_m) ∈ ℤ_p^m. Let K = ℚ_p(√(1 + 2λ_1), …, √(1 + 2λ_m)), a finite extension of degree at most 2^m, with integers R. Then a_i := −1 + √(1 + 2λ_i) ∈ R satisfies a_i(a_i + 2)/2 = λ_i, so the R-linear character a : t_0 = ⊕ ℤ_p h_i → R, h_i ↦ a_i, has central character χ_a(Δ_i) = λ_i on the affinoid Verma module of highest weight a. The extension K is in general ramified or nontrivial even when λ_i ∈ ℤ_p: λ is induced over ℚ_p (ND.5/induced-infinitesimal-characters) only when every √(1 + 2λ_i) ∈ ℤ_p.

**Proof.**

1. a_i is a root of the monic polynomial X² + 2X − 2λ_i ∈ ℤ_p[X], hence integral over ℤ_p; a_i(a_i + 2)/2 = ((a_i + 1)² − 1)/2 = λ_i.
2. On a highest weight vector v (e_iv = 0, h_iv = a_iv), Δ_iv = (½a_i² − a_i + 2e_if_i)v = (½a_i² − a_i + 2a_i)v = ½a_i(a_i + 2)v, using e_if_i = f_ie_i + h_i.

**Needs.** `LocallyAnalyticDistributionsPartII:ND.5/induced-infinitesimal-characters`, `LocallyAnalyticDistributionsPartII:ND.5/infinitesimal-character-quotients`, `mathlib:PadicInt`.

**Acceptance.**

- At p = 3 and λ = 1, K = ℚ_3(√3) is ramified and a = −1 + √3 ∈ ℤ_3[√3].

**Sources.**

- Fu (2024), Theorem 1.5 and the sentence following it, p. 4; Remark 5.8, pp. 20–21: States injectivity for all λ ∈ ℤ_p^r and notes that it can be deduced from AW14 Theorems 4.6 and 5.4; the integral root computation is the elementary bridge between the Casimir parameters and the R-linear highest weights of AW14.
- Ardakov–Wadsley (2014), §4.5, the R-linear character λ and the affinoid Verma module; §4.6, the central character χ_λ, pp. 10–11: Defines affinoid Verma modules for R-linear characters of p^n t and their central characters.

### Affinoid Verma modules are faithful over Iwasawa algebras

**Target `LocallyAnalyticDistributionsPartII:ND.5/affinoid-verma-faithfulness` (theorem).** Let p be odd, L/ℚ_p finite, K a complete discretely valued extension of L with integers R, 𝔾 a connected simply connected split semisimple group scheme over o_L with Lie algebra 𝔤, p very good for 𝔾, and G an L-uniform group with p^n 𝔤 = R ⊗ (1/p) L_G (for example the congruence kernel ker(𝔾(o_L) → 𝔾(o_L/p^{n+1}))). For an R-linear character λ : p^n t → R, the affinoid Verma module V̂^λ = Û(𝔤)_{n,K} ⊗_{Û(b⁺)_{n,K}} K_λ satisfies: (i) its annihilator in Û(𝔤)_{n,K} is the two-sided ideal generated by ker(χ_λ : Z(𝔤_K) → K); (ii) V̂^λ is faithful as a K[[G]]-module. Hence K[[G]] → Û(𝔤)_{n,K}/Û(𝔤)_{n,K}·ker χ_λ is injective. For 𝔾 = SL_2^m over ℤ_p and G = G_1^m one has n = 0 (ND.0/first-congruence-sl2), and every p odd is very good.

**Planet.** Faithfulness of affinoid Verma modules.

**Suggested home.** `TauCeti/NumberTheory/Padics/DistributionAlgebra/Central`, namespace `TauCeti.DistributionAlgebra`.

**Hypotheses and conventions.**

- Simply connected and very good p are hypotheses of AW14 §4.4–4.6 and §5.4; for type A_1 very good means p ∤ 2.

**Proof.**

1. (i): Ch(V̂^λ) = (b⁺_k)^⊥; the ideal Gr(ker χ_λ·Û) is S(𝔤_k)^{G_k}_+·S(𝔤_k), prime, with zero set the nilpotent cone 𝒩^*; the annihilator is G(R)-stable, so its characteristic variety contains G·(b⁺_k)^⊥, dense in 𝒩^*; primality forces equality of graded ideals (AW14 Lemma and Theorem 4.6, p. 11).
2. (ii): V̂^λ is free of rank one over Û(p^n n)_K; the action of R T on U(n_K)v is faithful (AW14 Proposition 4.7), so V̂^λ is faithful over R B by the general faithfulness theorem 5.3, then over R B⁺ by the Cartan involution (Proposition 4.8), and finally over K[[G]] by Theorem 5.3 again (AW14 Theorem 5.4, proof, p. 16).
3. The injectivity statement is the composite of (ii) with (i).

**Needs.** `LocallyAnalyticDistributionsPartII:ND.3/completed-enveloping-algebra`, `LocallyAnalyticDistributionsPartII:ND.4/d-one-over-p`, `LocallyAnalyticDistributionsPartII:ND.0/first-congruence-sl2`, `LocallyAnalyticDistributionsPartII:ND.0/lazard-lie-lattice`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-7-the-center-of-ul-harish-chandra-freudenthal-and-serres-relations`.

**Acceptance.**

- For G_1 ⊂ SL_2(ℤ_p) and λ = k ∈ ℕ, V̂^k has the finite-dimensional quotient Sym^k, but V̂^k itself is infinite-dimensional and faithful over ℚ_p[[G_1]], whereas Sym^k is not faithful.

**Sources.**

- Ardakov–Wadsley (2014), Theorem 4.4 (centre), Lemma 4.5, Lemma and Theorem 4.6, pp. 10–11; §5.1–5.4, Theorem 5.4 and its proof, pp. 13–16: Computes the annihilator of affinoid Verma modules as generated by the kernel of the central character, and proves that affinoid Verma modules are faithful over KG for congruence kernels of simply connected split semisimple groups at very good odd p, including n = 0.

### Injectivity of central specialisation for every integral parameter

**Target `LocallyAnalyticDistributionsPartII:ND.5/central-injectivity-theorem` (theorem).** Let p be odd, G = G_1^m = Π (I_2 + pM_2(ℤ_p)) ∩ SL_2(ℤ_p) and g = sl_2(ℚ_p)^m with Casimirs Δ_1, …, Δ_m. For every λ ∈ ℤ_p^m the composite ℚ_p[[G]] → Û(g_{ℤ_p})_{ℚ_p} → Û(g)_λ = Û(g_{ℤ_p})_{ℚ_p}/(Δ_i − λ_i)_i of the microlocalisation and central specialisation is injective. Equivalently, the image of every nonzero element of ℚ_p[[G]] in Û(g) is generic: it stays nonzero in Û(g)_λ for all λ ∈ ℤ_p^m.

**Planet.** Fu's central injectivity theorem.

**Suggested home.** `TauCeti/NumberTheory/Padics/DistributionAlgebra/Central`, namespace `TauCeti.DistributionAlgebra`.

**Hypotheses and conventions.**

- λ is arbitrary in ℤ_p^m, including parameters not induced over ℚ_p; the proof passes through a finite extension of coefficients and descends.

**Proof.**

1. Choose K and integral a_i with a_i(a_i + 2)/2 = λ_i (ND.5/integral-casimir-roots).
2. By ND.5/affinoid-verma-faithfulness with n = 0, K[[G]] → Û(g_R)_K/(Δ_i − λ_i) is injective.
3. Descent: K[[G]] = K ⊗_{ℚ_p} ℚ_p[[G]], Û(g_R)_K = K ⊗_{ℚ_p} Û(g_{ℤ_p})_{ℚ_p} (ND.3/completed-enveloping-algebra, base change) and the quotient by the central ideal commutes with K ⊗ −; the square formed by the two microlocalisation maps commutes (ND.4/microlocal-coefficient-extension). K is faithfully flat over ℚ_p, so the kernel of the ℚ_p-map is zero once its K-base change is.
4. For induced λ this is also ND.5/fu-direct-injectivity, which Fu proves directly.

**Needs.** `LocallyAnalyticDistributionsPartII:ND.5/integral-casimir-roots`, `LocallyAnalyticDistributionsPartII:ND.5/affinoid-verma-faithfulness`, `LocallyAnalyticDistributionsPartII:ND.4/microlocal-coefficient-extension`, `LocallyAnalyticDistributionsPartII:ND.4/lazard-microlocalisation`, `LocallyAnalyticDistributionsPartII:ND.3/completed-enveloping-algebra`, `LocallyAnalyticDistributionsPartII:ND.5/infinitesimal-character-quotients`, `mathlib:Module.FaithfullyFlat`.

**Acceptance.**

- For m = 1, λ = 0: ℚ_p[[G_1]] embeds into Û(sl_2(ℤ_p))_{ℚ_p}/(Δ), the completed algebra of the Casimir-zero quotient, though the target has dimension 2 (in the sense of its characteristic variety) against 3 for ℚ_p[[G_1]].
- At p = 3, λ = 1 (not induced) the statement still holds, through K = ℚ_3(√3).

**Sources.**

- Fu (2024), Theorem 1.5 and the following paragraph, pp. 3–4: States that ℚ_p[[G]] → Û(g)_λ is injective for every λ ∈ ℤ_p^r and records that this follows from AW14 Theorems 4.6 and 5.4; §5 gives a direct proof for induced λ.
- Ardakov–Wadsley (2014), Theorems 4.6 and 5.4, pp. 11 and 16: The annihilator and faithfulness theorems for affinoid Verma modules.

### Dependencies

Within this roadmap: Layer ND.0, Layer ND.1, Layer ND.2, Layer ND.3, Layer ND.4.

On other roadmaps and the libraries: `LocallyAnalyticDistributions:L0/analytic-manifold-atlases`, `LocallyAnalyticDistributions:L0/compact-type-extension-duality`, `LocallyAnalyticDistributions:L0/compact-type-nuclear-duality`, `LocallyAnalyticDistributions:L0/compact-type-spaces`, `LocallyAnalyticDistributions:L0/locally-analytic-dual-nuclear`, `LocallyAnalyticDistributions:L0/locally-analytic-function-space`, `LocallyAnalyticDistributions:L0/nonarchimedean-hahn-banach`, `PadicMeasuresIwasawaAlgebras:L0`, `mathlib:IsNoetherianRing`, `mathlib:Module.FaithfullyFlat`, `mathlib:PadicInt`, `tauceti:TauCeti.casimirElement`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-3-enveloping-algebra-verma-modules-and-lλ`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-7-the-center-of-ul-harish-chandra-freudenthal-and-serres-relations`.

## Layer ND.6: Banach–Iwasawa duality and the algebraic Peter–Weyl theorem

The last layer turns Iwasawa modules into representations. Schneider–Teitelbaum duality identifies finitely generated K[[G]]-modules with admissible Banach representations, so W-quotients of an Iwasawa module are dual to W-isotypic vectors. For compact open subgroups of SL₂(ℤ_p) the algebraic functions give these explicitly: the degree-k graded piece is W_k ⊗ W_k^*, and K[[G]]/Ann(W_k) ≅ End_K(W_k).

**Targets of the layer.** The Schneider–Teitelbaum anti-equivalence between finitely generated K[[G]]-modules and admissible K-Banach representations of a compact p-adic Lie group; algebraic functions on compact open subgroups of SL₂(ℤ_p) with their degree filtration; the algebraic Peter–Weyl theorem C^alg_{≤k}/C^alg_{≤k−1} ≅ W_k ⊗ W_k^* and K[[G]]/Ann(W_k) ≅ End_K(W_k).

### Admissible Banach representations and finitely generated Iwasawa modules

**Target `LocallyAnalyticDistributionsPartII:ND.6/banach-iwasawa-duality` (theorem).** Let K be a finite extension of ℚ_p with integers o and G a compact p-adic Lie group (so o[[G]] and K[[G]] = K ⊗_o o[[G]] are noetherian). (i) A finitely generated o[[G]]-module carries a unique Hausdorff topology, its canonical topology, for which the action is continuous; submodules are closed and o[[G]]-linear maps continuous. (ii) A K-Banach representation E of G is admissible if there is a G-invariant bounded open o-lattice L ⊆ E such that (E/L)^H is of cofinite type for every open normal subgroup H; E is admissible iff its continuous dual E′ is finitely generated over K[[G]], with K[[G]] acting by the contragredient action through bounded measures. (iii) The functor M ↦ M^d := Hom_o^{cont}(M_0, K) (for a finitely generated o-torsion-free lattice M_0 of M, with the canonical topology) is an anti-equivalence between finitely generated K[[G]]-modules and admissible K-Banach representations of G, quasi-inverse to E ↦ E′; in particular the admissible representations form an abelian category. (iv) Under (iii), finite-dimensional continuous representations W correspond to finite-dimensional K[[G]]-modules W′ (the dual), and Hom_{K[[G]]}(M, W) ≅ Hom_G(W′, M^d) for finitely generated M.

**Planet.** Schneider–Teitelbaum Banach duality.

**Suggested home.** `TauCeti/RepresentationTheory/Padic/BanachIwasawa`, namespace `TauCeti.BanachIwasawa`.

**Hypotheses and conventions.**

- K is a finite extension of ℚ_p (more generally discretely valued with o noetherian); G compact p-adic Lie, so that o[[G]] is noetherian (NoncommutativeAndEquivariantIwasawa:NE.0/iwasawa-noetherian).
- The duality is Schikhof duality between compact o-modules and Banach spaces with lattices, not the strong duality of locally analytic distributions; the two are compared through ND.1/iwasawa-to-distributions.

**Proof.**

1. (i): o[[G]] is compact and noetherian, so a finite presentation gives the canonical topology (ST02B Proposition 3.1).
2. (ii): if E′ is finitely generated, its unit ball is a finitely generated compact o[[G]]-module and the cofinite-type condition follows from topological Nakayama (NoncommutativeAndEquivariantIwasawa:NE.0/compact-nakayama); conversely the cofinite-type condition makes the Pontryagin dual of E/L a finitely generated o[[G]]-module (ST02B Lemma 3.4).
3. (iii): the anti-equivalence between o-torsion-free compact o[[G]]-modules up to isogeny and Banach representations (ST02B Theorem 2.3) is the G-equivariant form of Schikhof duality; its biduality isomorphisms for torsion-free compact o-modules and for o-lattices are planned in CompletedCohomologyPartII:CC.3/qualified-biduality and imported from there. Restricted by (i)–(ii) it gives ST02B Theorem 3.5.
4. (iv) is the restriction of (iii) to finite-dimensional objects together with adjunction.

**Needs.** `LocallyAnalyticDistributionsPartII:ND.1/iwasawa-to-distributions`, `CompletedCohomologyPartII:CC.3/qualified-biduality`, `PadicMeasuresIwasawaAlgebras:L0`, `PadicMeasuresIwasawaAlgebras:L1`, `NoncommutativeAndEquivariantIwasawa:NE.0/iwasawa-noetherian`, `NoncommutativeAndEquivariantIwasawa:NE.0/compact-nakayama`, `LocallyAnalyticDistributions:L0/banach-c0-models`, `mathlib:AbstractMeasure`.

**Acceptance.**

- For G = ℤ_p and E = C(ℤ_p, K) (left regular representation), E′ = K[[ℤ_p]] is free of rank one.
- Fu §6: the dual of K[[G]] as a module over itself is C(G, K), and W_k^* ≅ W_k is a finite-dimensional K[[G]]-module.

**Sources.**

- Schneider–Teitelbaum (2002, Israel J.), §3, Proposition 3.1, Lemma 3.4, Theorem 3.5 and Corollary 3.6, pp. 13–15: Defines admissible Banach representations by a cofinite-type condition, shows admissibility is finite generation of the dual over K[[G]], and proves the anti-equivalence between finitely generated K[[G]]-modules and admissible Banach representations.
- Fu (2024), §6, opening paragraphs, p. 21: Uses the duality of ST02a to view the finite-dimensional Banach representation W_k as a K[[G]]-module and C(G, K) as the dual of K[[G]].

### Algebraic functions on a compact open subgroup of SL₂(ℤ_p)

**Target `LocallyAnalyticDistributionsPartII:ND.6/algebraic-matrix-coefficients` (construction).** Let G ⊆ SL_2(ℤ_p) be an open subgroup (in particular G_1) and K/ℚ_p finite. The algebraic functions on G are C^alg(G, K) := the image of K[SL_2] = K[x, y, z, w]/(xw − yz − 1) under restriction to G (via g = (x y; z w)); restriction K[SL_2] → C(G, K) is injective, so C^alg(G, K) ≅ K[SL_2]. G × G acts by left and right translation, (g_1, g_2)·f(g) = f(g_1⁻¹ g g_2), preserving the degree filtration C^alg_{≤n} (images of polynomials of total degree ≤ n in x, y, z, w). dim_K C^alg_{≤n}/C^alg_{≤n−1} = C(n+3, 3) − C(n+1, 3) = (n + 1)². For G = G_1^m use the tensor product of the factors.

**Suggested home.** `TauCeti/RepresentationTheory/Padic/BanachIwasawa`, namespace `TauCeti.BanachIwasawa`.

**Hypotheses and conventions.**

- Injectivity of restriction uses Zariski density of the open subgroup G in SL_2 over K (an open subgroup of a connected group's ℚ_p-points is Zariski dense); it fails for finite subgroups.

**Construction.**

1. A polynomial vanishing on an open subset of SL_2(ℚ_p) vanishes identically, since SL_2 is an irreducible variety and an open subgroup is Zariski dense (it contains a neighbourhood of 1, where an analytic chart shows any regular function vanishing is zero).
2. The degree-n piece of K[x, y, z, w] modulo the degree-n piece of (xw − yz − 1)·K[x, y, z, w]_{≤n−2} has dimension C(n+3, 3) − C(n+1, 3) = (n + 1)² (Fu §6, p. 22).

**Needs.** `LocallyAnalyticDistributionsPartII:ND.0/first-congruence-subgroup`, `mathlib:MvPolynomial`, `mathlib:Matrix.SpecialLinearGroup`.

**API.**

- `TauCeti.BanachIwasawa.algebraicFunctions` (constructor): C^alg(G, K) ⊆ C(G, K), the restrictions of regular functions on SL_2.
- `TauCeti.BanachIwasawa.sl2CoordinateRing` (constructor): K[x, y, z, w]/(xw − yz − 1), the coordinate ring of SL_2.
- `TauCeti.BanachIwasawa.restrictToSubgroup` (constructor): The ℚ_p-algebra map ℚ_p[x, y, z, w] → (G → ℚ_p) evaluating at the matrix entries.
- `TauCeti.BanachIwasawa.ker_restrictToSubgroup` (characterisation): For G containing a principal congruence subgroup, the kernel of restriction is (xw − yz − 1); hence K[SL_2] → C(G, K) is injective.
- `TauCeti.BanachIwasawa.choose_sub_choose_eq_sq` (other): C(n + 3, 3) − C(n + 1, 3) = (n + 1)², the graded dimension count.
- `TauCeti.BanachIwasawa.degreeFiltration` (data): C^alg_{≤n}(G, K), stable under the two-sided action of G × G.
- `TauCeti.BanachIwasawa.finrank_gr` (simp): dim C^alg_{≤n}/C^alg_{≤n−1} = (n + 1)².
- `TauCeti.BanachIwasawa.algebraicFunctions_le_locallyAnalytic` (compatibility): C^alg(G, K) ⊆ C^an(G, K) ⊆ C(G, K).

**Checks.**

- `finrank_gr_zero` (degenerate): dim C^alg_{≤0} = 1 (constants).
- `finrank_gr_one` (computation): dim C^alg_{≤1}/C^alg_{≤0} = 4, spanned by the classes of x, y, z, w.
- `finrank_gr_two` (computation): dim C^alg_{≤2}/C^alg_{≤1} = 9 = C(5, 3) − C(3, 3) = 10 − 1, the relation xw − yz = 1 removing one quadric.
- `restrict_not_injective_finite` (non-example): For the finite subgroup {±1} ⊂ SL_2(ℤ_p), restriction of K[SL_2] is not injective (x − w vanishes on it); openness of G is needed.

**Uses.**

- Fu §6, proof of (32) (ND.6/algebraic-peter-weyl): the degree-k graded piece is W_k ⊗ W_k^* and identifies the maximal W_k-quotient of K[[G]].
- ND.5/central-strong-duality acceptance: matrix coefficients of W_k lie in the λ_k-eigenspace C^la(G, K)[λ_k].

**Acceptance.**

- n = 0: constants, dimension 1; n = 1: the span of x, y, z, w modulo constants, dimension 4.

**Sources.**

- Fu (2024), §6, the definition of C^alg(G, K) and its degree filtration, pp. 21–22: Defines the algebraic vectors of C(G, K) as polynomial functions K[x, y, z, w]/(xw − yz − 1) on G ⊆ SL_2(ℤ_p), with two-sided G-action and degree filtration of graded dimensions (n + 1)².

### The algebraic Peter–Weyl theorem on a compact open subgroup of SL₂

**Target `LocallyAnalyticDistributionsPartII:ND.6/algebraic-peter-weyl` (theorem).** Let p be odd, G = G_1^m, k ∈ ℕ^m, W_k = ⊠_i Sym^{k_i}(K²) and K/ℚ_p finite. (i) W_k, restricted to any open subgroup of G, is absolutely irreducible, self-dual (W_k^* ≅ W_k), its differentiated action is the algebraic sl_2^m-action, and it is a Lie module (ND.4/lie-module-of-representation). (ii) For m = 1, C^alg_{≤k}/C^alg_{≤k−1} ≅ W_k ⊗ W_k^* as G × G-representations, and the W_k-isotypic algebraic vectors in C(G, K) (for either the left or the right action) form a closed subspace isomorphic to W_k ⊗ W_k^*; for m ≥ 1 the same holds for the tensor products. (iii) Under the duality of ND.6/banach-iwasawa-duality, the maximal W_k-quotient of K[[G]] is K[[G]]/Ann_{K[[G]]}(W_k) ≅ End_K(W_k), so dim_K Hom_{K[[G]]}(K[[G]], W_k) = dim W_k = Π (k_i + 1).

**Planet.** Algebraic Peter–Weyl theorem for SL₂.

**Suggested home.** `TauCeti/RepresentationTheory/Padic/BanachIwasawa`, namespace `TauCeti.BanachIwasawa`.

**Hypotheses and conventions.**

- Irreducibility on every open subgroup uses Zariski density, or the Lie-module comparison; irreducibility for an arbitrary (for example finite) subgroup is false.

**Proof.**

1. (i): an open subgroup is Zariski dense in SL_2^m, so its invariant subspaces in the algebraic representation W_k are sl_2^m-stable, and W_k is irreducible under sl_2^m (LieHighestWeight Layer 0); self-duality is the invariant pairing on Sym^k; W_k is a Lie module because it is the restriction of an algebraic representation (AW13 Theorem 11.3 factorisation with trivial Artin factor; Fu §6, p. 22).
2. (ii): x^k, as a function of g = (x y; z w), is left-invariant under the lower unipotent and right-invariant under the upper unipotent subgroup with highest weight k, and generates a copy of W_k ⊗ W_k^* in degree k; the dimension count (k + 1)² of ND.6/algebraic-matrix-coefficients gives equality; complete reducibility identifies the isotypic algebraic vectors (Fu §6, pp. 21–22); finite-dimensional subspaces are closed.
3. (iii): the duality of ND.6/banach-iwasawa-duality identifies the maximal W_k-quotient of K[[G]] with the dual of the W_k-isotypic part of C(G, K), which is W_k ⊗ W_k^*; hence K[[G]]/Ann(W_k) ≅ End(W_k) (Fu (32)); alternatively (32) follows from ND.4/isotypic-comparison.

**Needs.** `LocallyAnalyticDistributionsPartII:ND.6/algebraic-matrix-coefficients`, `LocallyAnalyticDistributionsPartII:ND.6/banach-iwasawa-duality`, `LocallyAnalyticDistributionsPartII:ND.4/lie-module-of-representation`, `LocallyAnalyticDistributionsPartII:ND.4/isotypic-comparison`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-0-sl₂-representation-theory-the-engine`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-5-complete-reducibility-weyls-theorem`.

**Acceptance.**

- k = 0: the maximal trivial quotient of K[[G]] is K (augmentation), End(W_0) = K.
- k = 1, m = 1: K[[G_1]]/Ann(K²) ≅ M_2(K), of dimension 4 = (1 + 1)².

**Sources.**

- Fu (2024), §6, pp. 21–22, including (32): Shows that W_k is irreducible and self-dual on G, computes the graded pieces of C^alg(G, K) as W_k ⊗ W_k^*, and identifies the maximal W_k-quotient of K[[G]] with End_K(W_k), also via Theorem 4.3.
- Ardakov–Wadsley (2013), §11.2–11.3, Theorem (factorisation), pp. 80–81: Every finite-dimensional simple KG-module is a Lie module tensored with an Artin module, so the algebraic W_k is a Lie module.

### Dependencies

Within this roadmap: Layer ND.0, Layer ND.1, Layer ND.2, Layer ND.3, Layer ND.4.

On other roadmaps and the libraries: `CompletedCohomologyPartII:CC.3/qualified-biduality`, `LocallyAnalyticDistributions:L0/banach-c0-models`, `NoncommutativeAndEquivariantIwasawa:NE.0/compact-nakayama`, `NoncommutativeAndEquivariantIwasawa:NE.0/iwasawa-noetherian`, `PadicMeasuresIwasawaAlgebras:L0`, `PadicMeasuresIwasawaAlgebras:L1`, `mathlib:AbstractMeasure`, `mathlib:Matrix.SpecialLinearGroup`, `mathlib:MvPolynomial`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-0-sl₂-representation-theory-the-engine`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-5-complete-reducibility-weyls-theorem`.

## Open points

Every layer is planned at target level. The remaining refinements and the recorded gap:

- ND.0: At lemma level, split ND.0/p-valued-analytic-structure into Schneider Theorem 27.1 (existence of a saturated open subgroup) and Theorem 29.8 (uniqueness of the analytic structure), and state the comparison of the Lazard addition with the Campbell–Hausdorff series as its own lemma.
- ND.1: At lemma level, promote the density of Dirac distributions and the limit formula x̃ ∗ λ = lim t⁻¹(δ_{exp(tx)} − δ_1) ∗ λ to lemma nodes.
- ND.2: At lemma level, split ND.2/coadmissible-theorems into Theorem A, Theorem B, Corollaries 3.1–3.5, Lemma 3.6 and Proposition 3.7 of ST03, and ND.2/faithful-flatness into ST03 Proposition 4.7, Theorem 4.11 and Theorem 5.2.
- ND.3: Frommer's original preprint (Münster SFB 478 no. 265, 2003) was not obtained; ND.3/frommer-theorem rests on Kohlhaase's summary and his proof of Corollary 1.4.1. A source job should obtain Frommer's §1.4 and check the orthogonality lemma.
- ND.4: At lemma level, separate AW13 Proposition 10.6 (crossed products U_n ∗ H_n) and Corollary 10.11 (S_n-torsion-freeness for large n) from ND.4/lie-modules.
- ND.5: Close the gap of ND.5/radius-central-domain (iii): separatedness of the ‖·‖_{r′}-filtration on D_r/D_r·ker λ for p^{−1/(p−1)} ≤ r < 1 (p^{−1/2} ≤ r < 1 when p = 3), which Fu's direct route (ND.5/fu-direct-injectivity) needs at r_n = p^{−1/p^n}; the endpoint ND.5/central-injectivity-theorem does not depend on it.
- ND.6: At lemma level, state ST02B Theorem 2.3, the G-equivariant Schikhof anti-equivalence, as a lemma node inside ND.6/banach-iwasawa-duality, built on the Schikhof biduality imported from CompletedCohomologyPartII:CC.3/qualified-biduality (planned there, not planned again here).
- Gap — Separatedness of the weaker-norm filtration on central quotients at large radii: Fu's proof of Theorem 5.7 computes gr_{r′} of D_r/D_r(p²Δ + λ_0) for a weaker norm ‖·‖_{r′}, r′ < p^{−1/2}, and needs the induced filtration to be separated, i.e. D_r ∩ D_{r′}·(p²Δ − p²λ) = D_r·(p²Δ − p²λ) inside D_{r′}. It holds for r < p^{−1/2} (take r′ = r), and ND.5/small-radius-central gives the domain property directly for r < p^{−1/(p−1)}; at the radius r_n itself the graded ring of D^λ_{r_n} is not a domain (the symbol of p²Δ − p²λ is a p^n-th power), so the weaker norm cannot be avoided. The radii r_n = p^{−1/p^n} used in the proof of Theorem 5.1 all exceed p^{−1/2}. Density of D_r in D_{r′} and the domain property of the graded ring do not imply separatedness. The roadmap's endpoint (ND.5/central-injectivity-theorem) is proved by the Verma-module route and does not use this step; the gap concerns only Fu's direct route for induced characters.

## Source corrections

Each correction is stated in our own words at its locator; the nodes use the corrected statements.

- **E1** (misprint, FU24, §4, equation (16), p. 14 (arXiv v2; published p. 138)). D_r(G, K), defined as the completion of D(G, K) for ‖·‖_r, is described as the series Σ λ_α b^α with sup_α |λ_α| r^{|α|} finite. Correction: The completion consists of the series with |λ_α| r^{|α|} → 0; the bounded condition describes the larger space D_{<r}(G, K) of ST03 Lemma 4.8. Reason: For G = ℤ_p and r = p^{−1/p} the coefficients λ_{pj} = p^{−j} (zero otherwise) give a bounded weighted sequence not tending to zero; ST03 p. 18 states the decay condition. Known: Recorded as PAPER-FU-24/E2 in the paper extraction; no published erratum. Review: confirmed — Checked at FU24 (16), arXiv v2 p. 14: the display describes D_r(G, K) by bounded weighted coefficients, while the completion for ‖·‖_r (ST03 p. 19) is the null-sequence condition; the example λ_{pj} = p^{−j} at r = p^{−1/p} separates the two. Nothing downstream uses the bounded description.
- **E2** (gap, FU24, Theorem 4.2, p. 14 (arXiv v2; published p. 138)). D_r(G, K) is stated to be a noetherian Banach integral domain with multiplicative norm for every 1/p ≤ r < 1. Correction: Multiplicativity and the domain property hold for all real 1/p < r < 1 and at r = 1/p; noetherianity is proved only for r ∈ p^ℚ (and r = 1/p). Reason: ST03 Theorem 4.5(ii) needs r ∈ p^ℚ for the filtration to be quasi-integral; nothing downstream needs irrational radii. Known: Recorded as PAPER-FU-24/E8 in the paper extraction; no published erratum. Review: confirmed — Checked at FU24 Theorem 4.2, p. 14 against ST03 Theorem 4.5 and Remark 4.6, pp. 22: noetherianity is proved there for r ∈ p^ℚ and for r = 1/p only; multiplicativity and the domain property hold for every 1/p < r < 1. Kind gap is right: the assertion lacks a proof, not a counterexample.
- **E3** (error, FU24, §4, equation (17), p. 14 (arXiv v2; published p. 138)). The microlocal set ⋃_a (p^a + m^{a+1}) is formed in R[[G]] with R the integers of an arbitrary finite extension K of ℚ_p. Correction: Use R unramified (p a uniformiser), as in AW13 §10.1, and obtain the microlocalisation over K by base change (ND.4/microlocal-coefficient-extension). Reason: If R is ramified then p ∈ m², so 0 = p − p ∈ p + m² and the set is not an Ore set of nonzerodivisors. Known: Recorded as PAPER-FU-24/E4 in the paper extraction; no published erratum. Review: confirmed — Checked at FU24 §4, (17), p. 14: R is the integers of an arbitrary finite extension K of ℚ_p, while AW13 §10.1 assumes p is a uniformiser. For ramified R, p ∈ m² and 0 ∈ p + m², so the displayed set is not the microlocal Ore set of the powers of gr p (whose degree is e, not 1).
- **E4** (error, FU24, Theorem 5.7, p. 20 (arXiv v2; published p. 145)). D^λ_r(G, ℚ_p) is stated to be an integral domain for every λ and every 1/p < r < 1. Correction: Add the integrality hypothesis v_p(λ_0) ≥ 2 (for example λ(Δ) ∈ ℤ_p); for non-integral λ the quotient can be zero. Reason: For r = p^{−2/3} and λ(Δ) = p^{−1}, ‖Δ‖_r ≤ p^{2/3} < |λ|, so Δ − λ is a unit of D_r and D^λ_r = 0; the proof's own first branch (symbol a unit) reaches this zero quotient. Known: Recorded as PAPER-FU-24/E7 in the paper extraction; no published erratum. Review: confirmed — Checked at FU24 Theorem 5.7, p. 20: λ is an arbitrary infinitesimal character and the conclusion is "integral domain"; the proof itself reaches the zero quotient when v(λ_0) ≤ 1, and the zero ring is not a domain. Recomputed the counterexample: at r = p^{−2/3}, ‖h‖_r = p^{1/3}, so ‖Δ‖_r ≤ p^{2/3} < p = |p^{−1}|.
- **E5** (gap, FU24, Proof of Theorem 5.7, p. 20, as used in the proof of Theorem 5.1, p. 21 (arXiv v2)). The graded ring of D^λ_r for the weaker norm ‖·‖_{r′} is identified, via Lemma 2.2, with the quotient of the graded ring of D_r by the symbol of p²Δ + λ_0, and the domain property is transferred to D^λ_r. Correction: The transfer needs the induced filtration on D_r/D_r(p²Δ + λ_0) to be separated; this holds for r < p^{−1/2} but is unproved at the radii r_n = p^{−1/p^n} of Theorem 5.1 (the gap of this packet). Reason: Lemma 2.2 applies to a filtration in which every nonzero element has an exact degree; the filtration induced by ‖·‖_{r′} on a quotient of D_r need not have this property. Known: Recorded as PAPER-FU-24/E5 in the paper extraction; Theorem 1.5 itself follows from AW14, as the paper notes. Review: confirmed — Checked at FU24 proof of Theorem 5.7, p. 20, and its use on p. 21. Separatedness of the ‖·‖_{r′}-filtration on D_r/D_r a is equivalent to D_r ∩ D_{r′}a = D_r a; D_r → D_{r′} is flat but not faithfully flat (for G = ℤ_p, T − t with r′ < |t| ≤ r becomes a unit in D_{r′}), so this does not follow formally. At r_n itself the graded ring is not a domain (the symbol is a p^n-th power), so the weaker norm is needed. The endpoint is unaffected (AW14 route).
- **E6** (error, FU24, Remark 5.8, second bullet, pp. 20–21 (arXiv v2; published p. 147)). An infinitesimal character λ is said to be induced if and only if v_p(λ_0) ≥ 2. Correction: Only 'only if' holds: λ is induced iff 2λ(Δ) + 1 is a square in ℤ_p (ND.5/induced-infinitesimal-characters). Reason: At p = 3, λ(Δ) = 1 is integral, but 2λ + 1 = 3 is not a square in ℚ_3. Known: Recorded as PAPER-FU-24/E3 in the paper extraction; no published erratum. Review: confirmed — Checked at FU24 Remark 5.8, p. 21. For χ(diag(t, t⁻¹)) = t^c, c ∈ ℤ_p, HC(Δ) = ½h² ± h gives λ(Δ) = ½c² ± c and 2λ + 1 = (c ± 1)²; conversely a square root s ∈ ℤ_p gives c = s ∓ 1. At p = 3, λ = 1 has v_3(λ_0) = 2 but 2λ + 1 = 3 is not a square.
- **E7** (misprint, AW14, §5.2, proof of the Lemma, p. 14 (arXiv v1); the same text in the published version, Münster J. Math. 7 (2014), p. 20). D_{1/p}(G, K) is described as the formal power series Σ λ_α b^α for which the supremum of |λ_α|(1/p)^{|α|} is finite. Correction: As the completion of D(G, K) for ‖·‖_{1/p}, D_{1/p}(G, K) consists of the series with |λ_α| p^{−|α|} → 0; this is also what matches Û(g)_K, whose elements are null sequences in the PBW basis. Reason: Under b_i ↦ exp(pu_i) − 1 ≡ pu_i, Σ λ_α b^α corresponds to Σ λ_α p^{|α|} u^α + (higher order), which lies in Û(g)_K iff |λ_α| p^{−|α|} → 0; the bounded series λ_α = p^{−|α|} at α = (n, 0, …, 0) (so |λ_α| p^{−|α|} = 1) gives Σ u_1^n plus higher-order terms, not in Û(g)_K. Known: new Review: confirmed — Checked at AW14 §5.2, proof of the Lemma, arXiv v1 p. 14 and the published version (Münster J. Math. 7 (2014), p. 20), which prints the same condition. The completion D_{1/p}(G, K) of ST03 §4 is the null-sequence space; with λ_α = p^{−|α|} at α = (n, 0, …, 0) the bounded series maps to Σ u_1^n + (higher order), which is not in Û(g)_K. The proof is unaffected because the comparison maps are isometric.
- **E8** (misprint, BCGP25, Definition 2.2.31, p. 24 (arXiv v1)). A left Û(g)-module is called coadmissible when it is lim M_r with M_r finitely generated and M_{r+1} ⊗_{Û(g)_{r+1}} Û(g)_r = M_r. Correction: For left modules the transition is Û(g)_r ⊗_{Û(g)_{r+1}} M_{r+1} ≅ M_r, with the Banach algebra on the left, as in ST03 §3. Reason: M_{r+1} ⊗_{Û(g)_{r+1}} (−) requires M_{r+1} to be a right module. Known: Recorded as PAPER-BOXER-CALEGARI-GEE-PILLONI-25/E002 in the paper extraction. Review: confirmed — Checked at BCGP25 Definition 2.2.31, arXiv v1 p. 24: M_{r+1} ⊗_{Û(g)_{r+1}} Û(g)_r is printed for a left module; ST03 §3 (p. 8) writes A_{q_n} ⊗_{A_{q_{n+1}}} M_{n+1}. Agrees with PAPER-BOXER-CALEGARI-GEE-PILLONI-25/E002.
- **E9** (misprint, FU24, §6, the paragraph identifying the degree-k graded piece with W_k ⊗ W_k^*, p. 22 (arXiv v2)). The function x^k (x the upper-left matrix entry) is said to be left invariant under the lower triangular unipotent subgroup and right invariant under a subgroup called the "lower upper triangular" nilpotent subgroup. Correction: x^k is right invariant under the upper triangular unipotent subgroup: (gn)_{11} = g_{11} for n upper unipotent. Reason: For n = (1 a; 0 1), the (1,1) entry of gn is g_{11}; for the lower unipotent n = (1 0; a 1) it is g_{11} + a g_{12}, which is not invariant. Left invariance under the lower unipotent subgroup holds because the first row of (1 0; a 1) is (1, 0). Known: new Review: confirmed — Found by REV-DESIGN-LocallyAnalyticDistributionsPartII while checking ND.6/algebraic-peter-weyl; the node already uses the corrected statement.

## Boundaries with neighbouring roadmaps

- **split** (LocallyAnalyticDistributionsPartII, LocallyAnalyticDistributionsPartIIQuasiAbelianFunctionalAnalysis). The design brief joins three continuations of LocallyAnalyticDistributions. Two of them (PAPER-FU-24 route 2 and PAPER-BOXER-CALEGARI-GEE-PILLONI-25 route 18) concern noncommutative distribution algebras and are planned here. The third (PAPER-BOXER-CALEGARI-GEE-PILLONI-25 route 17, joining PAPER-COLMEZ-DOSPINESCU-NIZIOL-20) is quasi-abelian and solid functional analysis: Banach–Smith and Fréchet–LS duality, solid versus topological completed tensors, the false Lemma 2.7.5 and its replacement. It does not depend on noncommutative distributions, and its solid realisation of coadmissible modules (BCGP Theorem 2.2.32 and Corollary 2.2.36) depends on this roadmap rather than the other way round. Proposal: LocallyAnalyticDistributionsPartIIQuasiAbelianFunctionalAnalysis, 'Locally analytic distributions, growth, and character spaces, Part II: quasi-abelian p-adic functional analysis and derived categories of convex spaces', parent LocallyAnalyticDistributions, area representations, gets its own design job with PAPER-BOXER-CALEGARI-GEE-PILLONI-25 route 17 and PAPER-COLMEZ-DOSPINESCU-NIZIOL-20. It imports ND.2 (coadmissible modules) and ND.3/arens-michael-envelope from this roadmap and adds BCGP Theorem 2.2.32 and Corollary 2.2.36 (the fully faithful exact functor into solid 𝒰(g)-modules).
- **rescope** (LocallyAnalyticDistributionsPartII, LieHighestWeightPartII). The brief asks this roadmap to import the p-adically completed enveloping algebra Û(h)_K, the weighted PBW completions U(g)_r and their division theorems from a supplier 'PadicEnvelopingAlgebras' (PAPER-FU-24 route 1, PAPER-BOXER-CALEGARI-GEE-PILLONI-25 route 19), which is only a sub-route of the pending design job DESIGN-LieHighestWeightPartII (issue 3373) and has no stage. The notions are needed here as Banach completions of U(g) in their own right (AW13 §3.7, §10.4; Schmidt §3.2; BCGP §2.2.29). Proposal: ND.3/completed-enveloping-algebra owns Û(h)_K and its deformations Û(h)_{n,K}; ND.3/arens-michael-envelope owns U(g)_r and 𝒰(g) = lim U(g)_r with coadmissible 𝒰(g)-modules; ND.5/central-radius-normal-form owns the bounded division by Δ − λ at radius p^n. Neither depends on distribution algebras, so the algebraic Part II (LieHighestWeightPartII or a separate PadicEnvelopingAlgebras) imports them and keeps Fu §3 (generic elements, Lemma 3.1, Theorem 3.2, Proposition 3.4, Theorem 1.6 and the algebraic Lemma 3.3), with no dependency running back from it to this roadmap's later layers.
- **rescope** (LocallyAnalyticDistributionsPartII, LocallyAnalyticRepresentationsOfLocalGroups). FIX-RT-PAPER-FU-24 and PAPER-BOXER-CALEGARI-GEE-PILLONI-25 route 34 make this roadmap the single owner of D(G, K), its Banach steps, the Fréchet–Stein property and coadmissible modules, to be imported by the pending design LocallyAnalyticRepresentationsOfLocalGroups (issue 3411). Proposal: LocallyAnalyticRepresentationsOfLocalGroups imports ND.1 (D(G, K), U(g) ⊂ D(G, K), centrality of Z(g)), ND.2 (Fréchet–Stein algebras, coadmissible modules, D_r, faithful flatness) and ND.3 (U_r(g), Frommer, 𝒰(g)); it keeps admissible locally analytic representations and ST03 Theorem 6.3, ST03 §§7–8, Ding's and Colmez–Dospinescu–Nizioł's terminal theorems, and BCGP §2.2.18–2.2.27.
- **rescope** (LocallyAnalyticDistributionsPartII, PadicMeasuresIwasawaAlgebras, CompletedCohomologyPartII). FIX-RT-AREA-automorphic-1/17 proposed a sub-stage PadicMeasuresIwasawaAlgebras:L1:banach-representations for the Schneider–Teitelbaum duality between admissible Banach representations and finitely generated Iwasawa modules (ST02B Lemma 3.4, Theorem 3.5). That proposal was not applied, and PadicMeasuresIwasawaAlgebras has since gone upstream to Tau Ceti without it. Proposal: ND.6/banach-iwasawa-duality owns the duality (ST02B Lemma 3.4, Theorem 3.5). CompletedCohomologyPartII:CC.5/banach-admissibility, which cites ST02B Theorem 3.5 as a source, and the p-adic local Langlands consumers (R30.2) import it from ND.6. ND.6 in turn imports the Schikhof biduality that CompletedCohomologyPartII:CC.3/qualified-biduality already plans (ST02B §§1–2). CC.2 must not import ND.6: CC.3 builds on CC.2, so that import would close the stage cycle CC.2 → CC.3 → ND.6 → CC.2. If the orchestrator prefers the Schikhof biduality to sit with the foundational duality, it moves into ND.6 and CC.3 imports it; either way it is planned once.

## Downstream consumers

- LocallyAnalyticRepresentationsOfLocalGroups: admissible locally analytic representations, Schneider–Teitelbaum Theorem 6.3, Ding's and Colmez–Dospinescu–Nizioł's theorems, Boxer–Calegari–Gee–Pilloni §2.2.18–2.2.27 (imports ND.1–ND.3).
- The solid functional-analysis Part II of LocallyAnalyticDistributions: the solid realisation of coadmissible 𝒰(g)-modules (imports ND.2, ND.3).
- The algebraic Part II of LieHighestWeight (completed category O, Fu §3): imports Û(h)_K and 𝒰(g) from ND.3.
- WeightAspectAutomorphicMultiplicity (Fu Theorems 1.2–1.4, §7): imports ND.4/isotypic-comparison, ND.5/central-injectivity-theorem and ND.6.
- CompletedCohomologyPartII (CC.5, not CC.2) and the p-adic local Langlands roadmaps: import ND.2/faithful-flatness and ND.6/banach-iwasawa-duality.

## References

- **FU24.** Weibo Fu, *Sharp bounds for multiplicities of Bianchi modular forms*. Annals of Mathematics 200 (2024), no. 1, 123–152; arXiv:2201.11190v2 (15 February 2024), whose numbering agrees with the published text. The arXiv text was read; page numbers are those of the arXiv PDF. https://arxiv.org/pdf/2201.11190v2
- **ST03.** Peter Schneider and Jeremy Teitelbaum, *Algebras of p-adic distributions and admissible representations*. Inventiones Mathematicae 153 (2003), 145–196; arXiv:math/0206056v1 (6 June 2002). The arXiv text was read; page numbers are those of the arXiv PDF. https://arxiv.org/pdf/math/0206056v1
- **ST02.** Peter Schneider and Jeremy Teitelbaum, *Locally analytic distributions and p-adic representation theory, with applications to GL2*. Journal of the American Mathematical Society 15 (2002), 443–468; arXiv:math/9912073v1 (9 December 1999). The arXiv text was read; page numbers are those of the arXiv PDF. https://arxiv.org/pdf/math/9912073v1
- **ST02B.** Peter Schneider and Jeremy Teitelbaum, *Banach space representations and Iwasawa theory*. Israel Journal of Mathematics 127 (2002), 359–380; arXiv:math/0005066v1 (7 May 2000). The arXiv text was read; page numbers are those of the arXiv PDF. https://arxiv.org/pdf/math/0005066v1
- **AW13.** Konstantin Ardakov and Simon Wadsley, *On irreducible representations of compact p-adic analytic groups*. Annals of Mathematics 178 (2013), 453–557; arXiv:1102.2606v3 (11 May 2012). The arXiv text was read; page numbers are those of the arXiv PDF. https://arxiv.org/pdf/1102.2606v3
- **AW14.** Konstantin Ardakov and Simon Wadsley, *Verma modules for Iwasawa algebras are faithful*. Münster Journal of Mathematics 7 (2014), 5–26; arXiv:1308.5104v1 (23 August 2013). The arXiv text was read; page numbers are those of the arXiv PDF. https://arxiv.org/pdf/1308.5104v1
- **AB07.** Konstantin Ardakov and Kenneth A. Brown, *Primeness, semiprimeness and localisation in Iwasawa algebras*. Transactions of the American Mathematical Society 359 (2007), 1499–1515; arXiv:math/0412401v1 (20 December 2004). The arXiv text was read; page numbers are those of the arXiv PDF. https://arxiv.org/pdf/math/0412401v1
- **KOH07.** Jan Kohlhaase, *Invariant distributions on p-adic analytic groups*. Duke Mathematical Journal 137 (2007), 19–62; author's copy from the author's page. Its §1.4 summarises H. Frommer, The locally analytic principal series of split reductive groups, Münster SFB 478 preprint 265 (2003), which was not obtained. https://www.esaga.uni-due.de/f/jan.kohlhaase/Kohlhaase_Invariant_Distributions.pdf
- **SCHM13.** Tobias Schmidt, *Verma modules over p-adic Arens–Michael envelopes of reductive Lie algebras*. Journal of Algebra 390 (2013), 160–180; arXiv:1008.3897v2 (25 June 2013). The arXiv text was read; page numbers are those of the arXiv PDF. https://arxiv.org/pdf/1008.3897v2
- **BCGP25.** George Boxer, Frank Calegari, Toby Gee and Vincent Pilloni, *Modularity theorems for abelian surfaces*. arXiv:2502.20645v1 (28 February 2025), 230 pp. Only §2.2.27–2.2.36 was read for this roadmap. https://arxiv.org/pdf/2502.20645v1
- **SCH11.** Peter Schneider, *p-Adic Lie Groups*. Grundlehren der mathematischen Wissenschaften 344, Springer, 2011. Read in the maintainer's cleared library; cited by numbered statement and printed page. https://doi.org/10.1007/978-3-642-21147-8
