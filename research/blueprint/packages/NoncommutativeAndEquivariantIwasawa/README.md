# Roadmap: noncommutative and equivariant Iwasawa theory

**Summary.** Build canonical Iwasawa localizations, characteristic elements and representation evaluations, and the congruence proof of the odd-prime, totally real main theorem. Then construct Bockstein leading terms, conditional interpolation and noncommutative Fitting invariants. Perfect-complex statements are distinguished from module statements requiring finite projective dimension. The elliptic-curve and general motivic main conjectures remain conjectural.

## Scope and ownership

This roadmap owns canonical Ore localization, its adapters to relative perfect-complex K-theory, characteristic elements, Iwasawa representation evaluation, the noncommutative congruence argument, cyclotomic Bockstein descent and the noncommutative Fitting construction. Uniform-group coordinates and the additional homological statements needed for these applications are included at their natural generality. The totally real theorem allows groups with elements of order p; statements using finite global dimension explicitly exclude them.

CompletedCohomologyPartII owns powerful and uniform groups, existence of open normal uniform subgroups, local and noetherian completed group algebras, filtered-ring transfer and the uniform Auslander-regular dimension theorem. PadicMeasuresIwasawaAlgebras owns completed group algebras, finite-free coefficient extension, compact Nakayama, commutative characteristic ideals and graded determinant lines. Their definitions and theorems are used as contracts below. Generic K-theory, induction, reduced norms, Galois duality, Selmer complexes and Hilbert modular forms also retain their existing owners. The new work is the adapter or additional theorem stated in each subsection, rather than another construction of those foundations.

## Conventions

The symbol p denotes a prime. Write Λ_O(G)=O[[G]], Λ(G)=Z_p[[G]], Ω_k(G)=k[[G]], and Ω(G)=F_p[[G]]. Unless otherwise stated O is the ring of integers of a finite extension L/Q_p, with uniformizer ϖ and residue field k. Coefficient extension is ordinary finite-free tensor product, with its induced complete topology. Unramified coefficients are required for the particular Frobenius logarithms in Layer 6. These coefficient rings have characteristic zero; equal-characteristic DVRs are not included in integral or rational p-adic assertions.

Modules are left modules. Maps between finite free left modules act on row coordinates by multiplication on the right; this makes the cokernel of right multiplication by f equal to Λ/Λf. A left basis over an open subgroup uses representatives of the cosets H′g; a right basis uses gH′. The coefficient ring is central. Compact modules are Hausdorff with continuous action, and completed tensor products and continuous cochains are used before passage to rational coefficients.

From Layer 1 onward G is compact p-adic analytic, H is closed normal, and G/H=Γ≅Z_p, with generator γ and T=γ−1. Write S={f: Λ/Λf is finitely generated over Λ(H)}, S*=⋃_{n≥0}pⁿS, M(p)={m: pⁿm=0 for some n}, and 𝔐_H(G)={finitely generated M: M/M(p) is finitely generated over Λ(H)}. In O-coefficients the corresponding saturation uses ϖ; p-saturation gives the same localization since p is a unit times ϖ^e. Total quotient rings, canonical Ore localizations and completed central localizations are distinct rings.

Complexes are cohomological: H^i(C[1])=H^{i+1}(C), [C[1]]=−[C], and d(C)=⊗_i d(C^i)^{(−1)^i}. The boundary is normalized by ∂[f]=[Λ/Λf] for regular f and by ∂ characteristic(C)=[C]. For the arithmetic complex with H^{−1}=X and H⁰=Z_p the zeta convention is ∂ζ=−[C]. The Bockstein is cup product with the homomorphism θ:G→Γ→Z_p normalized by θ(γ)=1; c_γ=log_p χ_cyc(γ) is retained whenever one changes from T to a cyclotomic variable. Artin evaluation uses Φ_ρ(g)=ρ(g)·ḡ and the Morita determinant, without division by dim ρ. Contravariant cohomology is converted using the stated transpose or contragredient, rather than a silent change of evaluation convention.

For totally real main theorems p is odd, F_∞/F is Galois, contains the cyclotomic Z_p-extension, is unramified outside a finite set Σ containing the primes over p, and has compact p-adic analytic Galois group. The condition μ=0 means that the maximal abelian pro-p extension of F_∞ unramified outside Σ has Galois group finitely generated over Λ(H); the equivalent cyclotomic formulation and its precise hypotheses are proved in Layer 4. Real places at p=2 require modified Tate terms and are excluded from the odd-prime theorem. A statement conditional on weak Leopoldt, semisimplicity, a main conjecture or a period comparison retains that condition.

## Exact supplier contracts

### From Mathlib and Tau Ceti

Mathlib's `OreLocalization.OreSet`, `OreLocalization` and `OreLocalization.universalHom` supply left fractions and their ring universal property. Its fractions `s⁻¹r`, the left Ore equation and the opposite-ring construction determine the left/right adapter in Layer 1. `Module.Finite`, `Submodule.span`, `PowerSeries`, `PadicInt`, `ZMod` and finite group representations are elementary carriers. Continuous cohomology uses the ProfiniteCohomology contract below. No noncommutative K₁, relative perfect-complex K₀ or noncommutative determinant functor is assumed to exist in these APIs.

Tau Ceti’s `fittingIdeal`, `fittingIdeal_eq_minorsIdeal_ker`, `fittingIdeal_quotient_zero` and `fittingIdeal_le_of_surjective` in `RingTheory/FittingIdeal/Basic` supply the commutative Fitting theory; Layer 7 compares its new invariant with that definition. Tau Ceti supplies pro-p groups (`TauCeti.IsProP`), completed group algebras and their coefficient, product and power-series comparisons, lower p-series, and finite-group induction and restriction. Its general `TauCeti.twistedMonoidAlgebra` over a commutative semiring already has the basis, multiplication and inverse-unit formulas: `TwistedMonoidAlgebra.basis`, `of_mul_of` and `isUnit_of`. Layer 6 constructs only the Iwasawa carry cocycle and its presentation, not another generic twisted algebra. The compact homology and perfect-complex adapters stated below are additional targets, rather than inferred from an unrelated continuous-cohomology connecting map.

### From the algebraic roadmaps

PadicMeasuresIwasawaAlgebras §1.7 provides O⊗_{Z_p}Λ(G)≃Λ_O(G) for every profinite G and finite-free O/Z_p, including Dirac elements and multiplication. Its §5.2 provides compact topological Nakayama for compact local rings with finite residue field: M=0 iff M/𝔪M=0, and finite generation and surjectivity can be checked modulo 𝔪. Its §§4.2 and 4.6 provide the commutative structure and coefficient-norm formulas, and §5.1 provides graded determinant lines for perfect complexes over a commutative ring, with shifts and Koszul signs. A noncommutative Picard-valued determinant is constructed separately in §2.7.

CompletedCohomologyPartII §0.1 supplies uniformity with fourth powers at 2 and open normal uniform subgroups of compact analytic groups. Its §3.11 supplies locality for pro-p groups and the maximal ideal (ϖ,g−1); §5.1 supplies two-sided noetherianity of O[[G]] and k[[G]]. Its §5.5 supplies complete filtered-ring lifting, uniform Auslander regularity with dimensions dim U+1 and dim U, and the finite-index Frobenius Ext/grade comparison. Those results, compact Nakayama and noetherianity are not new Layer 0 targets. Layer 0 adds the stated coordinate comparisons and the no-p-torsion finite-index dimension consequences.

AlgebraicKTheory A0 supplies finite-projective K₀ and the matrix-idempotent comparison; A1–A2 supply stable K₁, Morita invariance, automorphism classes and determinants over fields; A3 supplies the congruence relative group K₁(R,I), which need not equal ker(K₁(R)→K₁(R/I)); A4 supplies semilocal stable range one and units surjecting onto K₁. Its right-module convention is transported by opposite ring and transpose to our left-module convention. GeneralAlgebraicKTheory §4.6 supplies resolution, §§4.15–4.16 split relative triples and the classical boundary, §6.3 the Waldhausen fibration under its saturation, extension and cylinder hypotheses, §§6.9 and 6.19 the bounded-projective complex comparison, and §8.1 the homotopy-fibre relative group for a unital ring map. Layer 2 verifies these hypotheses for Ore localization and compares the resulting perfect-complex model; an abelian Serre localization theorem alone is insufficient.

RepresentationTheory/InductionRestriction Layers 6–7 supply Artin–Brauer induction and generic twisted representation algebra. ClassicalArithmeticCompletion §§7.14, 7.27, 7.46–7.47, 7.62–7.63 and 7.80/7.109 supply Adams operations, semilocal elimination, the finite-p-group integral logarithm with Frobenius, its image results, character twists, p-elementary determinant reduction and determinant fixed points. Layer 6 adds the exact kernel/cokernel computation and the one-dimensional inverse-limit comparison. SemisimpleAlgebras supplies Wedderburn decomposition; IntegralHeckeAndGaloisDeterminants Layer 0 supplies reduced norms and determinant laws. Neither replaces the noncommutative Fitting construction or proves the desired SK₁ vanishing.

### From the arithmetic roadmaps

ProfiniteCohomology supplies continuous cochains and cup products; ProfiniteArithmetic supplies the profinite Galois and class-field interfaces. ArithmeticGaloisDuality R02.4 and D7.3/D7.5/D7.7 supply cohomological dimension, finite-coefficient perfectness, compact Shapiro, derived Poitou–Tate and orthogonal-local-condition duality. Their real-place p=2 terms are modified Tate complexes and cannot be replaced by a finite perfect complex without further hypotheses.

SelmerIwasawaCohomology §§2.8–2.10 and §§2.21–2.23 supply Greenberg conditions, Selmer groups, contragredient Pontryagin duals, mapping fibres and change-of-condition triangles. Its §§3.1–3.3, 3.8–3.9 and 3.12–3.15 supply Iwasawa cochains, Shapiro/descent, local error complexes, duality with involution, conditional finiteness and étale comparisons. Its §4.18 supplies the Leopoldt statement. Weak Leopoldt and finite generation are hypotheses where that roadmap states them conditionally. The cyclotomic Bockstein height and its semisimplicity comparison are constructed here in Layer 7, from those duality and Selmer contracts.

PadicFamilies §5.9a supplies integral Hilbert q-expansions and §5.10 Hilbert Eisenstein-family carriers. Layer 6 supplies the additional Deligne–Ribet value congruences, pseudomeasures and normalized abelian main theorem actually used by the noncommutative proof. ArithmeticGaloisRepresentations §2.7 supplies Hecke functional equations and Weil–Deligne local constants with their stated measures; PadicHodgeTheory supplies de Rham/crystalline comparison and filtration. Dedekind continuation and residue are consumed from AnalyticNumberTheory's Dedekind-zeta target. No adelic functional-equation theorem is introduced here. The p-adic residue and regulator comparison needed for leading terms is a separate Layer 7 target.

### Supplier checks used by the build

- The filtered supplier is used on both sides of the noncommutative ring.
- For Z_p[[T]] with its (p,T)-adic filtration, gr=F_p[P,T]. The supplier gives two-sided noetherianity, the domain property and global dimension at most 2.
- The noncompact module Q_p with trivial group action has M/(p,I_G)M=0 but M≠0, so it is excluded from compact Nakayama.
- For M=Z_p[[T]]/(T−p), reduction modulo (p,T) is F_p and M≃Z_p is cyclic.
- The supplier gives Z_p[[T₁,…,T_d]] noetherian, with global dimension d+1.
- For G=∏_N C_p, I/I² in F_p[[G]] has infinite F_p-dimension, so I is not finitely generated and the noetherian analytic theorem does not extend to this group.
- For C_p, noetherianity remains true, but finite global dimension fails.

## How to read the build

Layer 0 fixes coordinates, coefficients and homological dimension. Layer 1 constructs S, S* and their torsion categories; Layer 2 compares their perfect-complex K-theory and defines characteristic elements. Layer 3 evaluates them and records their ambiguities. Layer 4 supplies the arithmetic complexes, and Layer 5 states the normalized conjectures. Layer 6 proves the totally real theorem through algebraic image conditions, full Möbius congruences and completed-to-canonical descent. Layer 7 supplies descent and leading-term formulas and then central annihilator consequences. The source-dependent rank and period hypotheses in that last layer remain explicit.

## Layer 0: Uniform coordinates and Iwasawa homological algebra

### 0.1 Uniform dimension and constant indices

For a finitely generated powerful pro-p group U, prove that torsion-freeness is equivalent to constancy of the successive indices of its lower p-series P₁=U, P_{n+1}=closure(P_n^p[P_n,U]). For uniform U these indices are p^d, where d is its minimal number of topological generators; |U:U^{p^n}|=p^{nd}. Powerfulness and uniformity have the supplier convention [U,U]⊆U^p at odd p and [U,U]⊆U⁴ at 2.

p is prime; U is a Hausdorff compact pro-p group.

Use `IsUniform.dim`, `IsUniform.lowerPSeries_index`, `IsUniform.iff_powerful_torsionFree`.

(Ardakov–Brown §2.3, pp. 3–4; Pstrągowski §7, Definition 7.1, Theorem 7.1 and Lemma 7.6, pp. 32–34; Calegari et al., Lemmas 4.5.6 and 4.5.9, pp. 662–663.)

**Checks.**

- ℤ_p^d is uniform of dimension d.
- ℤ/p is not uniform although it is powerful.
- The trivial group is uniform of dimension 0 (degenerate case).
- The first congruence subgroup Γ₁(GL_d(ℤ_p)) = ker(GL_d(ℤ_p) → GL_d(𝔽_p)) is uniform of dimension d² for odd p; at p = 2 the level-4 subgroup is needed.
- ℤ/p is powerful but not uniform: its lower p-series indices are p, 1.

*Needs:* CompletedCohomologyPartII §0.1; Tau Ceti lower p-series.

### 0.2 Compact p-adic analytic groups

Use the group-side model of a compact p-adic analytic group: a profinite G containing an open normal uniform pro-p subgroup U. Define its dimension as dim U, and prove independence of U, inheritance by open and closed subgroups and quotients by closed normal subgroups. Construct a compatible Q_p-analytic group structure from ordered p-valued coordinates, and compare its dimension with the group-side dimension. Conversely a compact p-adic analytic group has such U. The analytic structure need not be chosen to use the group-side predicates.

p is prime; G is profinite. The converse uses the open-uniform theorem, while the construction uses the finite-rank p-valuation and saturation of §0.6.

Use `IsCompactPAdicAnalytic`, `IsCompactPAdicAnalytic.of_open`, `IsCompactPAdicAnalytic.quotient`, `IsCompactPAdicAnalytic.exists_open_proP`.

(Ardakov–Brown §§2.1–2.3, pp. 2–4; Schneider, Theorem 27.1, pp. 192–194, and Theorem 29.8, pp. 206–208; Pstrągowski §7, pp. 32–37.)

**Checks.**

- A finite discrete group is compact p-adic analytic (U = 1).
- ℤ_p is compact p-adic analytic of dimension 1.
- ∏_{n∈ℕ} ℤ/p is pro-p but not of finite rank, hence not analytic.
- Finite groups, ℤ_p^d × (finite), GL_d(ℤ_p), SL_d(ℤ_p) and their congruence subgroups are examples.
- 'No element of order p', 'torsion-free' and 'pro-p' are different hypotheses: ℤ_p × ℤ/ℓ for ℓ ≠ p has no element of order p but is not pro-p, and ℤ_p × ℤ/p is pro-p with p-torsion.

*Needs:* CompletedCohomologyPartII §0.1; §§0.1, 0.5–0.7; Mathlib p-adic manifolds.

### 0.3 Completed group algebras are free over open subgroups

Let G be profinite and H′ ≤ H closed subgroups with H′ open in H. Then Λ(H) is a free left (and right) Λ(H′)-module of rank [H : H′], with basis any set of right (resp. left) coset representatives; likewise Ω(H) over Ω(H′). If H′ is open normal in H, Λ(H) ≅ Λ(H′) ∗ (H/H′) is a crossed product. Consequently a Λ(H)-module is finitely generated over Λ(H) iff it is finitely generated over Λ(H′).

Λ(−) = ℤ_p⟦−⟧, Ω(−) = F_p⟦−⟧, the completed group algebras of PadicMeasuresIwasawaAlgebras §1.7.

Finite generation here means algebraic finite generation; a choice of representatives gives a topological finite direct sum as well. For O-coefficients use the supplier finite-free coefficient comparison. Prove `openSubgroupBasis`, its left/right formulas, `rank_openSubgroup` and the section-dependent crossed-product comparison.

(Lazard, Chap. II, (2.2.7), p. 62; CFKSV, §2, p. 166; Ardakov–Brown, §2.2, p. 3 (v1).)

**Checks.**

- For H=H′ the basis has one element and both extension maps are identities.
- For H=Z_p and H′=pZ_p, the basis 1,γ,…,γ^{p−1} has rank p; left and right agree in this abelian case.
- For p=5 and H=S₃×Z₅, H′=Z₅, the algebra is free of rank 6 over Z₅[[T]] and remains noncommutative: the two 3-cycles obtained by multiplying distinct transpositions differ. An open normal subgroup gives a crossed product, not necessarily a commutative group algebra.
- The basis is a set of coset representatives, independent of the level V.
- For p=5, G=S₃×Z₅ and U=Z₅, Λ(G) is free of rank 6 over Λ(U). Its Γ-augmentation quotient is Z₅[S₃], where the basis products (12)(123) and (123)(12) differ. Commutative power series cannot replace this group ring.

*Needs:* PadicMeasuresIwasawaAlgebras §1.7.

### 0.4 Semilocality beyond pro-p groups

For compact p-adic analytic G, prove that O[[G]] and k[[G]] are semilocal and are local precisely when G is pro-p. Reduce the semisimple quotient using an open normal pro-p subgroup and the finite group algebra over k; the augmentation ideal together with ϖ is the maximal ideal in the local case. The pro-p locality statement is the supplier contract, and this target is its finite-index semilocal extension and converse.

O is a finite-extension ring of integers, k its residue field; G is compact p-adic analytic.

(Lazard, Chap. II, (2.2.2), p. 59; CFKSV, §2, p. 166; Ardakov–Brown, §4.1, Theorem (2), p. 9 (v1); CompletedCohomologyPartII, §3.11, Admissible integral complexes.)

**Checks.**

- For G=1, O[[G]]=O is local and k[[G]]=k is a field.
- For G=C_p, k[G] has radical (g−1) with (g−1)^p=0 and residue k; locality does not imply finite global dimension.
- For p odd and G=C₂, O[C₂]≃O×O is semilocal with two maximal ideals and is not local.
- Λ(ℤ/ℓ) = ℤ_p[ℤ/ℓ] for a prime ℓ ≠ p is a product of local rings and is not local: (1/ℓ)Σ_{g} g is a nontrivial idempotent.
- Λ(ℤ_p) ≅ ℤ_p[[T]] is local with maximal ideal (p, T), the kernel of reduction of the augmentation.
- In Z_p[C_p] the element σ−1 is not nilpotent (the ring embeds in Q_p×Q_p(ζ_p)), whereas (σ−1)^p=0 in F_p[C_p]; the nilpotence step uses characteristic p.

*Needs:* §0.2; §0.3; PadicMeasuresIwasawaAlgebras §1.7; `IsLocalRing`; `TauCeti.IsProP`.

### 0.5 Ordered coordinates of a uniform group

For uniform U of dimension d and an ordered minimal generating set (u₁,…,u_d), the map c:Z_p^d→U given by c(x)=u₁^{x₁}⋯u_d^{x_d} is a homeomorphism of spaces. Coordinate order is fixed. For every n≥0 it identifies p^n Z_p^d with U^{p^n}, and the resulting coordinate residues parameterize U/U^{p^n}; c is a group homomorphism only in the abelian case.

p prime; U uniform; an ordered minimal generating set is selected.

Use `UniformCoordinates.toHomeomorph` (The ordered product c is bundled with its continuous inverse); `UniformCoordinates.eval` (c(x) is the ordered product of u_i^{x_i}, c(0)=1 and c(e_i)=u_i); `UniformCoordinates.powerSubgroup` (c(p^n Z_p^d)=U^{p^n}; |U:U^{p^n}|=p^{nd}); `UniformCoordinates.changeBasis` (Two ordered bases give the transition homeomorphism c₂⁻¹∘c₁, with identity and composition laws).

(Schneider, Definition of ordered basis, p. 182; Proposition 26.5, pp. 184–185; Corollary 26.12, p. 188; Fu, §4, pp. 12–13, equations (10)–(13).)

**Checks.**

- For U=Z_p^2 with its standard additive generators, c is the identity and the level-n quotient has p^{2n} elements.
- For U=1, the empty product identifies Z_p^0 with the one-point group.
- In a nonabelian uniform semidirect product, c(x+y) differs from c(x)c(y) for suitable x,y; a group-equivalence implementation must fail.

*Needs:* §0.1.

### 0.6 Finite-rank p-valuations

Define a p-valuation ω:U→R∪{∞} by ω(x)=∞ iff x=1, ω(xy⁻¹)≥min(ω(x),ω(y)), ω([x,y])≥ω(x)+ω(y), ω(x)>1/(p−1) for x≠1, and ω(x^p)=ω(x)+1. Require the valuation topology to agree with the given complete topology. Finite rank means that gr U is finite free over F_p[P], with P raising degree by 1. An ordered valued basis satisfies ω(∏u_i^{x_i})=min_i(ω(u_i)+v_p(x_i)). Construct the p-saturation by adjoining p-power roots in valuation degrees permitting them, prove its universal property among complete saturated p-valued groups, and prove existence of ordered bases for complete finite-rank groups. Uniform groups have weights 1 at odd p and 2 at 2.

p prime; U a complete topological group with the stated valuation topology.

Name the saturation construction `PValuation.saturation`, its embedding and universal map `saturation_lift`, and the finite-rank ordered-basis theorem `exists_orderedBasis`. A saturated group is one in which every x with ω(x)>p/(p−1) has a p-th root. This strict threshold is part of the construction.

Use `PValuation.filtration` (U_ν={x:ω(x)≥ν}; U_ν U_μ⁻¹⊆U_min(ν,μ)); `PValuation.pow_p` (For x≠1, ω(x^p)=ω(x)+1, hence U has no p-torsion); `PValuation.commutator` (ω([x,y])≥ω(x)+ω(y)); `PValuation.orderedBasis_iff` (Ordered symbols form a free F_p[P]-basis iff the minimum formula holds).

(Lazard III.2.1.2, p. 81; Schneider §26, pp. 181–190, especially Proposition 26.5, Proposition 26.6 and Corollary 26.12.)

**Checks.**

- For additive Z_p, ω(x)=1+v_p(x) is valid at odd p and ω(0)=∞.
- At p=2 the value 1+v₂(x) fails the strict bound on a unit; 2+v₂(x) works.
- A group with an element x of order p cannot carry such a valuation: the exact p-power identity would assign a finite value to 1.

*Needs:* Tau Ceti lower p-series; §0.1; Mathlib p-adic integers and topological groups.

### 0.7 Ordered Iwasawa series and rationalization

Let U be uniform with ordered generators and O a complete finite-free Z_p coefficient DVR. For b_i=u_i−1, ordered summation identifies ∏_(α∈N^d) O with O[[U]] as topological O-modules: (c_α)↦Σ c_α b₁^{α₁}⋯b_d^{α_d}. The topology is the complete maximal-ideal topology. This is a power-series ring isomorphism when U is abelian; multiplication is ordered and noncommutative in general. With K=Frac(O), K⊗_O O[[U]] consists exactly of ordered K-coefficient series with a common bounded denominator, not all formal K-series.

p prime; U uniform of dimension d; O finite free over Z_p and complete; the unramified coefficient case is the directly checked Schneider statement.

Use `IwasawaSeries.ofCoefficients` (Send a coefficient family to its convergent ordered sum); `IwasawaSeries.coeff` (Recover c_α; coefficient recovery and reconstruction are inverse continuous maps); `IwasawaSeries.coeff_basis` (The coefficient of b^β in b^α is δ_(α,β)); `IwasawaSeries.weightedGraded` (For O the integers of a finite unramified extension of Q_p (so p is a uniformizer), and every p-valued group (G,ω) of finite rank with an ordered basis, not only a uniform U: gr_ω O[[G]]≅gr O⊗_(F_p[P])U(gr G) (Schneider Theorem 28.3, p. 199; coefficient convention p. 195). Hence gr_ω O[[G]] and O[[G]] are domains (Corollary 28.5, pp. 200–201), and when gr G is abelian the graded ring is polynomial in 1+rank G variables over O/pO (Corollary 28.6, p. 201). The injectivity uses the PBW basis of U(gr G) over F_p[P]. The ordered-module comparison for ramified O does not extend this particular graded formula or its O/pO domain argument); `IwasawaSeries.rational_iff_bounded` (A K-coefficient family is in K⊗O[[U]] iff its coefficient valuations are bounded below).

(Schneider, §28, pp. 195–201, Theorem 28.3 and Corollaries 28.4–28.6; Fu, §4, pp. 12–13, equations (14)–(15).)

**Checks.**

- For U=Z_p, recover the supplied coordinate γ↦1+T, with b^n mapping to T^n.
- For U=1 only the constant monomial remains; O[[1]]=O and rationalization is K.
- The family c_n=π^(−n) is a formal K-series but has no common bounded denominator, hence is excluded from K⊗O[[Z_p]].
- For noncommuting u₁,u₂, b₁b₂ and b₂b₁ need not have the same coefficients; the module equivalence cannot silently be a commutative ring equivalence.
- For O unramified over Z_p and additive Z_p^d with ω(x)=1+min v_p(x_i) at odd p, gr G is abelian and gr_ω O[[G]] is (O/pO)[X₀,X₁,…,X_d], with X₀ the class of p; the weighted grading has one more variable than the mod-p augmentation grading. For ramification index e>1, O/pO contains the nonzero nilpotent class of a uniformizer, so the asserted domain and polynomial-over-O/pO formula cannot be extended to ramified O by the ordered-module base change.
- For U=Z_p^d at odd p and unramified O, the weighted graded integral ring has the class of p as an additional variable beyond the d mod-p augmentation variables. For ramified O, O/pO has nilpotents; that expression cannot be used to assert a polynomial domain.

*Needs:* §0.5; §0.6; PadicMeasuresIwasawaAlgebras §1.7; ProfiniteProPGroups Layer 9 (completed group algebra and procyclic coordinates).

### 0.8 graded ring of Ω(G) for uniform G

For uniform U of dimension d, Ω(U)=F_p[[U]] has augmentation ideal J, is J-adically complete, and gr_J Ω(U)≅F_p[X₁,…,X_d], with X_i the symbol of u_i−1 for an ordered basis. For Λ(U)=Z_p[[U]] with maximal ideal m=(p,u_i−1), the analogous gr_m Λ(U)≅F_p[X₀,…,X_d] is asserted here only if [U,U]⊆U^{p²} for odd p, or [U,U]⊆U⁴ for p=2. The weighted p-valuations of §0.6 give the general uniform case; an unweighted integral polynomial claim for every uniform U is false.

p prime; U uniform with ordered generators; the extra commutator condition is required for the integral m-adic clause.

(Ardakov–Brown, §3.1, Theorem, p. 5 (v1); Ardakov–Brown, §3.4, Theorem, p. 7 (v1); Venjakob, Theorem 3.22, pp. 17–18; Theorems 3.26 and 3.30, pp. 18–20.)

**Checks.**

- For U=Z_p^d obtain d mod-p variables and d+1 integral variables.
- For odd p, the uniform semidirect product generated by a,b with aba⁻¹=b^{1+p} has [a−1,b−1] with leading term p(b−1); its integral m-adic graded ring is not commutative.
- Passing to a sufficiently small open extra-powerful subgroup repairs the integral polynomial step.

*Needs:* §0.1; §0.4; §0.7; `MvPolynomial`.

### 0.9 Auslander regularity of Iwasawa algebras

For compact p-adic analytic G without elements of order p, prove the two-sided Auslander condition for O[[G]] and k[[G]], and their finite global dimensions. For every finitely generated left module M, every right submodule N⊆Ext^i(M,R) satisfies Ext^j_{R^op}(N,R)=0 for j<i, and likewise after taking opposites. Transfer from an open normal uniform subgroup by the finite-index Frobenius comparison, rather than by a finite-index division argument. This extends the uniform supplier theorem to the stated groups.

G is compact p-adic analytic without p-torsion. O is a finite-extension ring of integers, k its residue field.

For nonzero M set j_R(M)=inf{i:Ext^i_R(M,R)≠0} and δ_R(M)=gldim R−j_R(M); put j_R(0)=+∞ and δ_R(0)=−∞. Prove `grade_coefficientReduction`: if ϖM=0 then j_{O[[G]]}(M)=j_{k[[G]]}(M)+1; for ϖ-torsion-free M retain the long exact Ext sequence and its kernel/cokernel terms instead of claiming an unconditional reduction isomorphism.

(Venjakob, Definition 3.3, p. 10, Theorems 3.26 and 3.30, pp. 18–20; Fu §6, pp. 22–23.)

**Checks.**

- G=Z_p^d has integral dimension d+1 and mod-p dimension d.
- For G=C_p, the trivial mod-p module has an infinite periodic resolution; the finite-dimension conclusion is unavailable.

*Needs:* CompletedCohomologyPartII §5.5; §0.3; arithmetic cohomological-dimension contract.

### 0.10 Finite global dimension without p-torsion

If G has dimension d and no element of order p, prove gldim O[[G]]=d+1 on both sides for every finite-extension ring of integers O. In particular every finitely generated module has a bounded resolution by finitely generated projectives. Use the uniform DVR theorem, finite-index Ext comparison and the no-p-torsion cohomological-dimension theorem; finite-free coefficient extension alone does not prove the ramified assertion.

No element of order p is essential: ℤ_p[ℤ/p] has infinite global dimension.

(Venjakob, Theorems 3.26 and 3.29, pp. 18–19; CFKSV §3, p. 174; Ribes–Zalesskii, Theorem 7.3.7(a), pp. 265–266.)

**Checks.**

- For G=1, gldim O=1, including ramified O; after passage to L it is 0.
- For G=Z_p^d, the dimensions of O[[T₁,…,T_d]] and k[[T₁,…,T_d]] are d+1 and d.
- For G=C_p, O[C_p] has infinite global dimension. The finite-over-O property is insufficient.
- G = ℤ_p^d: global dimension d + 1.
- G = ℤ_p × ℤ/ℓ with ℓ ≠ p: ℤ_p[ℤ/ℓ] is a product of unramified discrete valuation rings O_i, so Λ(G) ≅ ∏ O_i[[T]] has global dimension 2 = cd_p(G) + 1, although G is not torsion-free.
- G = ℤ/p: ℤ_p[ℤ/p] has infinite global dimension; the hypothesis is sharp.

*Needs:* §0.2; §0.9; CompletedCohomologyPartII §5.1 (two-sided noetherianity).

### 0.11 Rational Iwasawa global dimension

For compact p-adic analytic G of dimension d without p-torsion, prove that L⊗_O O[[G]]=O[[G]][1/ϖ] is Auslander regular of left and right global dimension d. This is the bounded-denominator rational Iwasawa algebra. It is distinct from its total quotient ring and from microlocal completions.

O is a finite-extension ring of integers; G has no elements of order p.

(Venjakob, Proposition 3.28 and Theorem 3.29, p. 19; Fu §6, pp. 22–23.)

**Checks.**

- For G=1 the integral ring has dimension 1 and its fraction field dimension 0.
- For G=Z_p the bounded-denominator rational algebra has dimension 1; treating it as the field of all fractions would incorrectly give 0.

*Needs:* §§0.7, 0.9–0.10; finite-index Ext comparison.

### 0.12 Lazard exterior cohomology of uniform groups

For a finitely generated powerful torsion-free pro-p group U of dimension d, continuous cohomology with trivial coefficients is naturally the graded F_p-algebra H*(U,F_p)≅∧*_(F_p) H¹(U,F_p), where dim H¹=d. Equivalently this is the Yoneda Ext algebra of the trivial module over Ω(U) in the continuous/compact module comparison. In particular the cup-product generators have square zero, including at p=2, and dim H^i=binomial(d,i). At 2 powerful means [U,U]⊆U⁴.

U uniform, p prime; coefficients trivial F_p; cohomology is continuous.

(Lazard, V.2.2.6.3 and V.2.2.7.2, p. 167 (551); V.2.5.7.1, p. 183 (567); Calegari et al., Proofs of Lemmas 4.5.6 and 4.5.9, pp. 662–663.)

**Checks.**

- For U=Z_p², dimensions are 1,2,1 and H¹ generators square to zero.
- For U=Z₂, the degree-one generator has square zero; replacing exterior by a symmetric algebra in characteristic 2 is wrong.
- For U=C_p the positive cohomology does not truncate; powerfulness alone does not suffice.

*Needs:* §0.1; §0.8; ProfiniteCohomology continuous cochains.

### 0.13 Twisting modules by a representation

Let G be compact p-adic analytic, O a finite-free Z_p coefficient DVR and ρ:G→GL_n(O) continuous. For a finitely generated compact Λ_O(G)-module N, its O-linear diagonal twist is tw_ρ(N)=N⊗_O O^n, with g(m⊗z)=gm⊗ρ(g)z. For a Λ(G)-module M, first form M_O=O⊗_(Z_p)M, then take this twist. It is exact, is functorial on equivariant O-linear maps and sends Λ_O(G)^m to a free Λ_O(G)-module of rank mn. The 𝔐_H(G) preservation statement belongs to §2.5; no quotient G/H is needed just to define twisting.

G compact p-adic analytic; ρ continuous on a finite-free O-lattice; N finitely generated and compact.

Use `twist`, `twist_exact`, `twist_free`.

(CFKSV, §3, (13) and Lemma 3.2, p. 171.)

**Checks.**

- For ρ = 1 (n = 1), tw_ρ(M) = M_𝒪.
- For a character ρ = κ : G → 𝒪^×, tw_κ(Λ_𝒪(G)) ≅ Λ_𝒪(G) via g ↦ κ(g)^{−1}g.
- tw_{ρ₁ ⊕ ρ₂}(M) = tw_{ρ₁}(M) ⊕ tw_{ρ₂}(M).
- The action is diagonal, not ρ on the coefficients alone; tw is used with the contragredient ρ̂ in the Euler characteristic formula.

*Needs:* §0.2; PadicMeasuresIwasawaAlgebras §1.7.

### 0.14 Iwasawa group homology and diagonal twists

For compact p-adic analytic G without p-torsion and A=Q_p⊗Z_p[[G]], define H_i(G,M)=Tor_i^A(Q_p,M) for a finitely generated left A-module, with Q_p a right module by augmentation. For an integral compact Λ-module use completed Tor in the compact module category. If W is a finite-dimensional continuous Q_p representation admitting a G-stable Z_p lattice, the diagonal action g(m⊗w)=gm⊗gw defines M⊗W as a finitely generated A-module. Then H_i(G,M⊗W) is finite dimensional over Q_p and is zero for i>dim G. Integral lattices and completed tensor products must be compared before using the rational Tor formula.

G compact p-adic analytic, without p-torsion; M finitely generated over A; W finite dimensional with a continuous G-action and stable integral lattice.

Construct `completedHomology` by compact projective resolutions and prove its comparison with continuous bar chains and its coefficient and Shapiro maps. After inverting p, prove `rationalHomology_eq_Tor`; finite generation and the finite projective resolutions in §§0.9–0.11 imply finite-dimensional homology and the dimension bound. These are homology comparison targets, not a consequence of the definition of continuous cohomology alone.

Use `IwasawaHomology.coinvariants` (H₀(G,M)=Q_p⊗_A M; in the integral compact category use the Hausdorff completed coinvariant quotient); `IwasawaHomology.twist` (Diagonal tensor by W, compatible with sums, tensor products and coefficient extension); `IwasawaHomology.freeTwist` (A⊗W with diagonal action is A-free of rank dim W by the inverse-action formula); `IwasawaHomology.vanish_above_dim` (H_i(G,M⊗W)=0 for i>d; all homology groups are finite dimensional).

(Venjakob, §2, pp. 4–5; Fu, §6, pp. 22–23, proof of Theorem 1.4.)

**Checks.**

- For G=1, H₀(1,M)=M and all positive homology vanishes; here finitely generated A-modules are finite dimensional.
- For G=Z_p and trivial M=Q_p, the resolution A --(γ−1)→ A gives H₀=H₁=Q_p and higher homology zero.
- For G=Z_p acting on a one-dimensional W with γ acting by a≠1, the same resolution has differential a−1, so H₀=H₁=0.
- The free diagonal twist has H₀ dimension dim W and no positive homology; a twist that forgets the inverse action fails this comparison.

*Needs:* ProfiniteCohomology continuous bar construction; §§0.3, 0.9–0.12; Mathlib Tor and derived tensor.

### Examples

For Γ=Z_p, γ↦1+T identifies O[[Γ]] with O[[T]], while its rationalization contains precisely the series with coefficient valuations bounded below. The series Σ_{n≥0}ϖ^{−n}T^n is excluded. The trivial uniform group has dimension zero and an empty coordinate basis, giving O, k and L in the integral, residue and rational comparisons.

For odd p, take U=⟨a,b:aba⁻¹=b^{1+p}⟩, a torsion-free powerful semidirect product. Put A=σ(a−1), B=σ(b−1), P=σ(p) in the maximal-ideal graded ring of Z_p[[U]]. The expansion (1+b−1)^{1+p} gives AB−BA=PB in degree two. Thus that integral graded ring is noncommutative. After reduction modulo p, the commutator starts in degree p>2, and gr_J F_p[[U]] is polynomial in two variables. This distinguishes the two filtrations in §0.8 (Venjakob, Theorem 3.22, pp. 17–18; Ardakov–Brown §§3.1 and 3.4, pp. 5–7).

### Dependencies

CompletedCohomologyPartII §§0.1, 3.11, 5.1, 5.5; PadicMeasuresIwasawaAlgebras §§1.7, 5.2; ProfiniteCohomology continuous cochains and compact bar chains; Mathlib p-adic integers, manifolds, tensor products and Ext. Coordinates and the valued graded comparison precede the finite-index homological applications.

## Layer 1: Canonical Ore sets and torsion categories

### 1.1 canonical Ore set S

Let G be a compact p-adic analytic group with a closed normal subgroup H such that G/H ≅ ℤ_p. The canonical set is S = {f ∈ Λ(G) : Λ(G)/Λ(G)f is finitely generated as a left Λ(H)-module}. With O-coefficients, S_O is defined in the same way with Λ_O(G), Λ_O(H).

No hypothesis of 'no element of order p' is needed for S itself; CFKSV assume it only for later sections. Abstractly: for a ring A that is a left B-module through left multiplication, S = {f : A/Af finitely generated over B}.

 For the abstract compatible B-action, prove 1∈S and S·S⊆S without noetherian hypotheses. The Z_p[[T]] comparison is `mem_canonicalSet_powerSeries_iff`.

Use `canonicalSet`, `mem_canonicalSet_iff`, `one_mem_canonicalSet`, `mul_mem_canonicalSet`.

(CFKSV, §2, p. 166.)

**Checks.**

- B = A: S = A, including 0 (degenerate case: the zero-divisor statement needs the group hypotheses).
- A = F_p⟦T⟧ = Ω(ℤ_p), B = F_p (H = 1): S = {f ≠ 0}.
- A = ℚ[X], B = ℚ: S = {f ≠ 0}.
- Λ(ℤ_p) with H = 1: p ∉ S and T ∈ S (Λ/ΛT ≅ ℤ_p); S ≠ Λ ∖ {0}.
- For H = 1, G = Γ ≅ ℤ_p: Λ(Γ)/Λ(Γ)f is finitely generated over ℤ_p iff f ≠ 0 and p ∤ f (Weierstrass), so S = Λ(Γ) ∖ pΛ(Γ). This is the theorem `mem_canonicalSet_powerSeries_iff`, stated on ℤ_p[[T]] ≅ Λ(ℤ_p).
- For G=Γ, p is a nonzero divisor but p∉S. Thus S cannot be replaced by all regular elements or all nonzero elements.

*Needs:* §0.2; PadicMeasuresIwasawaAlgebras §1.7; `Module.Finite`; `Submodule.span`.

### 1.2 A central copy of ℤ_p in G/J

Let H ◁ G closed with G/H ≅ ℤ_p and J ≤ H open, normal in G. Then G/J contains a subgroup Π ≅ ℤ_p that is open, central, and maps isomorphically onto an open subgroup of Γ = G/H; hence Ω(Π) ≅ F_p⟦T⟧ is a discrete valuation ring in the centre of Ω(G/J), and Λ(Π) ≅ ℤ_p⟦T⟧.

J open in H (so H/J is finite) and normal in G.

(CFKSV, §2, (5) and proof of Lemma 2.1, p. 167.)

**Checks.**

- Π is central in G/J, not in G.
- Test: G = ℤ_p ⋊ ℤ_p acting by a unit u ≠ 1 with H = ℤ_p: Π = ⟨γ^{p^k}⟩ with u^{p^k} ≡ 1 mod |H/J|.
- For C_ℓ×Z_p with ℓ≠p, a lift with nontrivial C_ℓ-coordinate need not have pro-p closure. The construction first chooses a pro-p lift.

*Needs:* §0.2; PadicMeasuresIwasawaAlgebras §1.7.

### 1.3 algebra V(G/J)

With Π as in §1.2 and R(Π) = Frac Ω(Π) ≅ F_p((T)), put V(G/J) = R(Π) ⊗_{Ω(Π)} Ω(G/J). It is a finite-dimensional algebra over the central field R(Π); Ω(G/J) → V(G/J) is injective; and for x ∈ Ω(G/J), right multiplication by x on V(G/J) is injective iff surjective iff x is a unit of V(G/J), and the same holds on the left.

Ω(G/J) is a finite free Ω(Π)-module (§0.3), of rank [G/J : Π].

Use `totalAlgebra`, `totalAlgebra_finiteDimensional`, `algebraMap_totalAlgebra_injective`, `isUnit_iff_mul_right_injective`.

(CFKSV, §2, (6), p. 167.)

**Checks.**

- G = Γ, J = 1: V = F_p((T)), a field.
- G = Γ × ℤ/p, J = 1: V ≅ F_p((T))[ε]/(ε^p) (ε = σ − 1), with nilpotents.
- dim_{R(Π)} V(G/J) = [G/J : Π].
- V(G/J) is not a division ring in general (G/J may be nonabelian with zero divisors in Ω(G/J)).

*Needs:* §1.2; §0.3; `FractionRing`; `LinearMap.injective_iff_surjective`.

### 1.4 Criteria for membership in S (left)

Let J ≤ H be pro-p, open in H and normal in G, with φ_J : Λ(G) → Λ(G/J) and ψ_J : Λ(G) → Ω(G/J). For f ∈ Λ(G) the following are equivalent: (i) f ∈ S; (ii) Λ(G/J)/Λ(G/J)φ_J(f) is a finitely generated ℤ_p-module; (iii) Ω(G/J)/Ω(G/J)ψ_J(f) is finite; (iv) right multiplication by ψ_J(f) on Ω(G/J) is injective.

J pro-p, open in H, normal in G (such J exist and are cofinal).

(CFKSV, §2, Lemma 2.1, p. 166; CFKSV, §2, proof of Lemma 2.1, p. 167.)

**Checks.**

- Test on H = 1, G = Γ, J = 1: (iii) says F_p⟦T⟧/(f̄) finite, i.e. f̄ ≠ 0.

*Needs:* §1.1; §0.3; §1.3; §1.2; PadicMeasuresIwasawaAlgebras §5.2 (compact topological Nakayama).

### 1.5 Criteria for membership in S (right)

With J as before, f ∈ S iff Λ(G)/fΛ(G) is finitely generated as a right Λ(H)-module, iff Λ(G/J)/φ_J(f)Λ(G/J) is a finitely generated ℤ_p-module, iff Ω(G/J)/ψ_J(f)Ω(G/J) is finite, iff left multiplication by ψ_J(f) on Ω(G/J) is injective. In particular S is the same set whether defined with left or right modules.

As in §1.4.

(CFKSV, §2, Lemma 2.2, p. 167.)

**Checks.**

- The left–right symmetry uses that V(G/J) is finite-dimensional over R(Π): in an infinite-dimensional algebra such as End(k^(ℕ)) the shift operator has a left inverse and no right inverse.
- For G = Γ and H = 1 both criteria say f ∉ pΛ(Γ).

*Needs:* §1.4; §1.3.

### 1.6 S-torsion equals finite generation over Λ(H)

A finitely generated left (or right) Λ(G)-module M is S-torsion (every x ∈ M is killed by some s ∈ S) iff M is finitely generated over Λ(H).

G compact p-adic analytic, H ◁ G closed, G/H ≅ ℤ_p.

(CFKSV, §2, Proposition 2.3, p. 168; CFKSV, §2, proof of Proposition 2.3, p. 168.)

**Checks.**

- The direction S-torsion ⇒ finitely generated over B holds for any pair (A, B); the converse is the group-theoretic input.
- For G = Γ and H = 1, M = Λ(Γ)/(p) is not finitely generated over ℤ_p and is not S-torsion (p ∉ S), although it is S*-torsion.

*Needs:* §1.1; §1.4; §1.2; §0.3; CompletedCohomologyPartII §5.1 (two-sided noetherianity).

### 1.7 canonical Ore set theorem

S is multiplicatively closed, a left and right Ore set in Λ(G) (for s ∈ S, r ∈ Λ(G) there are t₁, t₂ ∈ S and w₁, w₂ with s w₁ = r t₁ and w₂ s = t₂ r), and consists of nonzero divisors. Hence Mathlib's OreLocalization.OreSet structure exists on S, on either side.

G compact p-adic analytic, H ◁ G closed, G/H ≅ ℤ_p.

(CFKSV, §2, Theorem 2.4, p. 168; CFKSV, §2, definition of Ore set, p. 166.)

**Checks.**

- The scope is the source’s Z_p quotient, not the arbitrary-normal-subgroup generalization.
- p ∉ S always: Λ(G)/pΛ(G) = Ω(G) is not finitely generated over Λ(H) because Γ = G/H is infinite; keep S and S* distinct.

*Needs:* §1.6; §1.4; §1.5; `OreLocalization.OreSet`; `OreLocalization.ore_right_cancel`.

### 1.8 Nilpotent kernels between finite levels

For pro-p subgroups J ⊆ J′ of H, open in H and normal in G, the kernel K of Ω(G/J) → Ω(G/J′) is a nilpotent two-sided ideal: K = Ω(G/J) I_Δ with Δ = J′/J a finite p-group and I_Δ^n = 0.

J ⊆ J′ as stated.

(CFKSV, §2, Lemma 2.5, p. 169.)

**Checks.**

- Test: G = Γ × ℤ/p, J = 1, J′ = ℤ/p: K = (σ − 1) with (σ − 1)^p = 0.

*Needs:* §0.4; PadicMeasuresIwasawaAlgebras §1.7; `IsPGroup`.

### 1.9 S as the elements regular modulo the prime radical

Let 𝒩 be the preimage in Λ(G) of the prime radical of Ω(G/J) (independent of J by §1.8). Then S is the set of elements of Λ(G) that are regular (nonzero divisors) modulo 𝒩.

The prime radical is the intersection of the two-sided prime ideals, not Mathlib's commutative nilradical. Ω(G/J) is noetherian on both sides (CompletedCohomologyPartII §5.1) and finite free over the central F_p[[Π]]; V(G/J) is its localization at the central F_p[[Π]]∖0.

(CFKSV, §2, Proposition 2.6, p. 169; CFKSV, §2, proof of Proposition 2.6, p. 170.)

**Checks.**

- The characterization, due to Schneider, shows that S depends only on Λ(G) and H.
- For G = Γ, H = J = 1: 𝒩 = pΛ(Γ) and S is the set of elements regular modulo p, that is Λ(Γ) ∖ pΛ(Γ).
- For R=F_p[C_p], the prime radical is the augmentation ideal, nilpotent of index p; the commutative nilradical gives the same answer here, but for M₂(F_p[ε]), ε²=0, the prime radical is M₂(εF_p[ε]), although the matrix ring has nonzero nilpotent elements outside it.

*Needs:* §1.8; §1.4; §1.5; §1.3; CompletedCohomologyPartII §5.1 (two-sided noetherianity).

### 1.10 saturated Ore set S*

S* = ⋃_{n≥0} p^n S. It is a multiplicatively closed left and right Ore set of nonzero divisors, and Λ(G)_{S*} = Λ(G)_S[1/p]. A finitely generated Λ(G)-module M is S*-torsion iff M/M(p) is finitely generated over Λ(H), where M(p) is the p-power torsion.

p is central in Λ(G).

Use `saturatedSet`, `saturatedSet_oreSet`, `saturatedLocalization_equiv`, `isSTorsion_saturated_iff`.

(CFKSV, §3, definition of S*, p. 170.)

**Checks.**

- G = Γ, H = 1: S* = Λ(Γ) ∖ {0} and Λ(Γ)_{S*} = Frac Λ(Γ).
- p ∈ S* but p ∉ S.
- M = Λ(G)/p is S*-torsion for every G.
- p ∉ S (Γ is infinite), so S* ≠ S.

*Needs:* §1.7; §1.6.

### 1.11 canonical localisation Λ(G)_S

Λ(G)_S is Mathlib's Ore localisation of Λ(G) at the Ore set S (on the left; the right localisation is canonically isomorphic because S is two-sided Ore). The map Λ(G) → Λ(G)_S is injective, every s ∈ S becomes a unit, and any ring map Λ(G) → T inverting S factors uniquely through Λ(G)_S. Likewise Λ(G)_{S*}, O-coefficients included.

S an Ore set of nonzero divisors (§1.7).

Use `canonicalLocalization`, `canonicalLocalization.algebraMap_injective`, `canonicalLocalization.isUnit`, `canonicalLocalization.lift`.

(CFKSV, §3, (11), p. 170.)

**Checks.**

- G = Γ, H = 1: Λ(Γ)_S = Λ(Γ)_{(p)}, the localisation at the height-one prime (p).
- p is not a unit in Λ(G)_S: Λ(G)_S/p is the nonzero localisation of Ω(G) at the image of S.
- For G abelian, Λ(G)_S agrees with the commutative localisation.
- Do not construct Λ(G)_S as a commutative fraction ring; Λ(G) is noncommutative.

*Needs:* §1.7; §1.10; `OreLocalization`; `OreLocalization.numeratorRingHom`; `OreLocalization.numeratorHom_inj`; `OreLocalization.universalHom`; `OreLocalization.universalHom_unique`; `OreLocalization.numerator_isUnit`.

### 1.12 Ore localisation is flat

For a left Ore set S of a ring R, the localisation R_S = S⁻¹R is flat as a right R-module, R_S ⊗_R M ≅ S⁻¹M naturally, and the kernel of M → R_S ⊗_R M is the S-torsion submodule of M. Hence a complex C of R-modules has R_S ⊗_R C acyclic iff every H^i(C) is S-torsion.

S left Ore; for the last statement C is bounded above with flat or projective terms, or any complex since R_S is flat.

(CFKSV, §4, proof of Theorem 4.4, p. 192.)

**Checks.**

- For R = ℤ, S = ℤ ∖ {0} and M = ℤ/n with n ≥ 1, S⁻¹M = 0 and the kernel of M → ℚ ⊗ M is all of M, the S-torsion submodule.
- CFKSV use exactness of localization at S in the proof of Theorem 4.4 (p. 192).

*Needs:* §1.11; `OreLocalization`.

### 1.13 category 𝔐_H(G)

𝔐_H(G) is the full subcategory of finitely generated left Λ(G)-modules that are S*-torsion; equivalently those M with M/M(p) finitely generated over Λ(H). It is a Serre subcategory (closed under submodules, quotients and extensions). For H = 1, G = Γ it is the category of finitely generated torsion Λ(Γ)-modules.

G, H as in §1.1.

Use `MH`, `mem_MH_iff`, `MH.isSerre`, `MH_trivial_H`.

(CFKSV, §3, p. 170.)

**Checks.**

- Λ(G)/Λ(G)f ∈ 𝔐_H(G) for f ∈ S*.
- Λ(G) ∉ 𝔐_H(G) (G infinite).
- For G = Γ: Λ(Γ)/(T) ∈ 𝔐 and Λ(Γ)/(p) ∈ 𝔐 (μ-type), Λ(Γ) ∉ 𝔐.

*Needs:* §1.10; §1.6; CompletedCohomologyPartII §5.1 (two-sided noetherianity).

### 1.14 Perfect complexes acyclic after localisation

For a left denominator (Ore) set S of a ring R, Σ_S is the full subcategory of the category C^p(R) of perfect complexes of R-modules consisting of the C with R_S ⊗_R C acyclic. Σ_S contains 0, is closed under quasi-isomorphism, shifts and extensions; by §1.12, C ∈ Σ_S iff every H^i(C) is S-torsion. For R = Λ(G) and S = S*, a module in 𝔐_H(G) of finite projective dimension, viewed as a complex, lies in Σ_{S*}.

Work in perfect complexes, represented by bounded complexes of finitely generated projectives. The localization is a flat right R-module.

Use `SigmaS`, `mem_SigmaS_iff`, `SigmaS.of_quasiIso`, `SigmaS.extension`.

(Burns–Venjakob, §2.2, p. 6 (v2).)

**Checks.**

- 0 ∈ Σ_S.
- The cone of multiplication by s ∈ S on R lies in Σ_S.
- R (in degree 0) is not in Σ_S unless R_S = 0.
- Burns–Venjakob need a weaker condition (iv′) for subcategories not closed under extensions; Σ_S itself satisfies (iv).

*Needs:* §§1.11–1.13; GeneralAlgebraicKTheory §§6.3, 6.9, 6.19.

### Examples

For H=1 and G=Γ, S in Z_p[[T]] consists of the series with nonzero reduction modulo p. Indeed a nonzero reduction has a finite T-order, so Weierstrass preparation gives a finite free Z_p-quotient; a series divisible by p gives an infinite mod-p quotient. Hence T∈S and p∉S, and S*=Z_p[[T]]∖{0}. The localized rings are Z_p[[T]]_(p) and Frac(Z_p[[T]]). In contrast the abstract definition with B=A contains 0, since A/A·0=A is finite over itself. Regularity uses the group quotient hypotheses (CFKSV, Propositions 2.2–2.3, pp. 166–168).

### Dependencies

Layer 0; compact Nakayama and noetherianity from the supplier contracts; Mathlib Ore localization and its opposite-ring adapter. The central finite quotient and finite-dimensional algebra criteria supply membership before the Ore proof; the torsion categories follow flat localization.

## Layer 2: Relative K-theory and characteristic elements

### 2.1 K₀ is insensitive to complete ideals

If I is a two-sided ideal of R and R is I-adically complete and separated and I⊆Jac(R), then K₀(R) → K₀(R/I) is an isomorphism; in particular K₀(Λ(G)) ≅ K₀(Ω(G)) ≅ K₀(F_p[G/U]) ≅ K₀(F_p[G/U]/Jac) for U open normal pro-p.

I-adic completeness and separatedness; I a two-sided ideal contained in Jac(R). For the displayed specializations, identify the appropriate complete ideals before applying the theorem.

Prove `idempotentLift_completeIdeal` by successive correction of matrix idempotents, and `idempotentLift_conjugate` for lifts congruent modulo I, then deduce `k0_completeIdeal_equiv` by the supplied matrix/projective comparison. In the displayed chain choose an open normal uniform U; the ideal generated by u−1 in Ω(G) gives a complete equivalent adic topology, and the finite-dimensional final radical is nilpotent.

(CFKSV, §4, Lemma 4.1, p. 187.)

**Checks.**

- R = ℤ_p, I = pℤ_p: K₀(ℤ_p) = ℤ = K₀(𝔽_p).
- R = ℤ_p[ℤ/ℓ] with ℓ ≠ p a prime, I = pR: R is a product of r unramified discrete valuation rings and R/I a product of r finite fields, r the number of irreducible factors of x^ℓ − 1 over 𝔽_p, so both K₀ are ℤ^r.

*Needs:* AlgebraicKTheory A0; compact Nakayama; matrix idempotents; complete ideal topology.

### 2.2 K₀(Λ(G)) injects into K₀ of a finite level

For P an open normal pro-p subgroup of G, K₀(Λ(G)) → K₀(ℤ_p[G/P]) is injective.

P pro-p (Nakayama over Λ(P)).

(CFKSV, §3, Lemma 3.5, p. 174.)

**Checks.**

- P must be pro-p for Nakayama.
- G = P = Γ: K₀(Λ(Γ)) = ℤ → K₀(ℤ_p) = ℤ is the identity on ranks.

*Needs:* §0.3; §0.4; PadicMeasuresIwasawaAlgebras §5.2 (compact topological Nakayama).

### 2.3 Detecting K₀(Λ(G)) by characters of a finite quotient

For P open normal pro-p, Δ=G/P and a finite splitting field L/Q_p for Δ, prove injectivity of K₀(Λ(G))→K₀(Z_p[Δ])→K₀(Q_p[Δ])→K₀(L[Δ])≃⊕_{ρ∈Irr_L(Δ)}Z. The finite-order coefficient step is `cartanBrauer_injective`: the projective-character map for Z_p[Δ] is injective, using the Cartan matrix and characteristic-zero lifts of modular characters. Prove this adapter before using character detection. Label the coordinates by the contragredient when they are computed from diagonal twists: for a projective M the coordinate at ρ^∨ is dim_L H₀(G,tw_ρ(M)_L). For arbitrary finitely generated M the alternating homology formula requires finite projective dimension.

P is open normal pro-p; L is finite over Q_p and splits Δ. Finite global dimension is used only for the all-module homology interpretation.

The character coefficient is normalized by Morita multiplicity, not by the full dimension of the corresponding simple matrix block. A regular representation has multiplicity dim ρ at the irreducible ρ.

(CFKSV, proof of Proposition 3.4, pp. 173–175; AlgebraicKTheory A0–A2 for the projective and splitting-field carriers.)

**Checks.**

- For Δ=1, the map is the rank map Z→Z.
- For Δ=C_p, Z_p[C_p] is local and K₀=Z; its regular character is nonzero after rationalization, even though reduction mod p is not semisimple.
- For a one-dimensional character χ, (χ⊗ρ)_G is nonzero for ρ=χ⁻¹. Replacing the contragredient label by χ changes the detected coordinate.
- The Euler-characteristic formula needs finite global dimension (no element of order p).

*Needs:* §2.2; §0.10.

### 2.4 H-homology of modules in 𝔐_H(G)

For M ∈ 𝔐_H(G) the homology groups H_i(H, M) = Tor_i^{Λ(G)}(Λ(Γ), M) are finitely generated torsion Λ(Γ)-modules for all i ≥ 0, and vanish for i ≥ dim G if G has no element of order p.

Under the no-p-torsion hypothesis cd_p(H)=dim G−1; integral homology means completed Tor.

(CFKSV, §3, Lemma 3.1, p. 171.)

**Checks.**

- Test: G = Γ, H = 1: H₀(1, M) = M is a torsion Λ(Γ)-module and higher homology vanishes.

*Needs:* §1.13; §1.10; CompletedCohomologyPartII §5.1 (two-sided noetherianity).

### 2.5 Twisting preserves 𝔐_H(G)

For a continuous ρ : G → GL_n(𝒪) and M ∈ 𝔐_H(G), the diagonal twist tw_ρ(M) = (M ⊗ 𝒪) ⊗_𝒪 𝒪ⁿ lies in 𝔐_H(G).

𝒪 finite free over ℤ_p.

(CFKSV, §3, Lemma 3.2, p. 171.)

**Checks.**

- Characteristic elements are evaluated at twists in Layer 3; for ρ trivial, tw_ρ(M) = M ⊗ O.

*Needs:* §1.13; §0.13.

### 2.6 Λ(G)_S is semilocal, Λ(G)_{S*} need not be

Λ(G)_S is a semilocal ring: for J ≤ H pro-p, open in H and normal in G, the image S_J of S consists of all nonzero divisors of Ω(G/J), Ω(G/J)_{S_J} is Artinian (= Ω(G/J) localised at the central Ω(Π) ∖ 0), and the kernel of Λ(G)_S → Ω(G/J)_S lies in the Jacobson radical. For G = ℤ_p² with H one factor, Λ(G)_{S*} = ℤ_p[[U, V]]_{(p,U)}[1/p] has infinitely many maximal ideals.

G, H as in Layer 1.

(CFKSV, §4, Proposition 4.2, p. 188; CFKSV, §4, p. 189.)

**Checks.**

- G = ℤ_p² with H one factor: Λ(G)_{S*} has infinitely many maximal ideals, so the theorem does not extend to S*.

*Needs:* §1.11; §1.4; §1.3; §1.2.

### 2.7 localized K₁ of Fukaya and Kato

For a full subcategory Σ of C^p(R) containing 0 and closed under quasi-isomorphism, shifts and direct sums ((i)–(iii), (iv′)), K_1(R, Σ) is the abelian group generated by symbols [C, a] with C ∈ Σ and a : 1_R → d_R(C), subject to [0, id] = 1, [C′, d_R(f)∘a] = [C, a] for quasi-isomorphisms f, [C, a] = [C′, a′][C″, a″] for short exact sequences in Σ, and [C[1], a^{−1}] = [C, a]^{−1} (Definition 2.5, after Fukaya–Kato). For a left denominator set S and Σ_S the complexes with R_S ⊗ C acyclic, [C, a] ↦ θ_{C,a} (the composite 1 → d(R_S ⊗ C) → 1) is an isomorphism ch_{R,Σ_S} : K_1(R, Σ_S) ≅ K_1(R_S) (Fukaya–Kato Proposition 1.3.7), and any Σ ⊆ Σ_S gives ch_{R,Σ} : K_1(R, Σ) → K_1(R_S).

R a ring; S a left denominator set; Σ as stated. When Σ satisfies (iv) (closure under extensions) the definition is Fukaya–Kato's.

Construct `noncommutativeDeterminant` from the Picard groupoid of virtual finitely generated projectives, with automorphism group K₁(R), and extend it to perfect complexes by alternating products. Prove its quasi-isomorphism, short-exact-sequence, shift and base-change compatibilities (`detPerfect_*`). This construction is required over noncommutative R; commutative determinant lines supply only the commutative specialization. Then prove the generators-and-relations comparison `localizedK1_equiv_K1Localization`, using the supplied K-theory fibration and the Ore flatness/perfect-model verification. Closure under direct sums alone is enough for the semisimple subcategory used in Layer 7; relations involving an exact sequence apply only when all three terms belong to it.

Use `LocalizedK1`, `LocalizedK1.mk`, `LocalizedK1.mk_shift`, `chLocalized`, `chLocalized_bijective`.

(Burns–Venjakob §2, pp. 3–7, especially Definition 2.5, p. 6 and the comparison following it; their formulation of the Fukaya–Kato localization comparison.)

**Checks.**

- For R=Z_p[[T]], C=[R --f→ R] in degrees −1,0 with f∈S and the identity determinant trivialization, ch([C,id])=f⁻¹. Hence ∂ch=−[C]=−[R/Rf].
- [0, id] = 1.
- Σ^{ss} satisfies (iv′) but not (iv), which is why Burns–Venjakob weaken (iv) to (iv′).
- For Σ_{A·} use the smallest subcategory with (i)–(iii) and (iv′) containing A·: the extension-closed version need not lie in Σ^{ss}.

*Needs:* §1.14; AlgebraicKTheory A0–A2; GeneralAlgebraicKTheory §§6.3, 6.19, 8.1; PadicMeasuresIwasawaAlgebras §5.1 for the commutative specialization.

### 2.8 Relative classes of torsion perfect complexes

For a regular two-sided Ore localization Λ→Λ_S, K₀(Λ,Λ_S) is represented by triples (P,α,Q), with finitely generated projectives P,Q and α:Λ_S⊗P≅Λ_S⊗Q, modulo stabilization, direct-sum and composition relations. Equivalently it is K₀ of perfect complexes acyclic over Λ_S. Fix ∂[s]=[Λ/Λs] for a regular denominator s. For a perfect torsion C set [C]=Σ_i(−1)^i[H^i(C)] whenever the cohomology modules have finite projective resolutions. Cone triangles obey [Cone(f)]=[D]−[C] for f:C→D. Burns–Venjakob’s characteristic map uses ∂ch(C,a)=−[C].

Λ noetherian; S a regular two-sided Ore set. For the displayed cohomology sum, each H^i(C) has a finite projective resolution.

Name the adapters `relativeTriples_equiv_perfectTorsion` and `relativePerfectClass_baseChange`. Verify that the homotopy fibre for R→R_S and the S-acyclic perfect model have the same K₀, and that the split-triple generator maps to its cone with the displayed sign. The supplied triple presentation alone does not identify the Ore model.

Use `RelativePerfectClass.ofTriple` (The class of (P,α,Q), with composition and direct-sum relations); `RelativePerfectClass.ofComplex` (The relative class of an S-acyclic perfect complex, invariant under quasi-isomorphism); `RelativePerfectClass.triangle` (For C→D→E→C[1], [D]=[C]+[E]; a shift negates the class); `RelativePerfectClass.boundary_sign` (∂[s]=[Λ/Λs], while ∂ch(C,a)=−[C]); `RelativePerfectClass.baseChange` (An exact derived coefficient/localization square carries [C] to its derived base-change class).

(Kakde, §2.2, pp. 6–8, relative triples and Lemma 5; Burns–Venjakob, §2.2, pp. 6–7; Proposition 3.8, pp. 10–11.)

**Checks.**

- For C=[Λ --T→ Λ] in degrees −1,0, [C]=[Λ/T], ∂[T]=[C], and ch(C)=T⁻¹.
- Shifting C once negates its relative class and inverts ch(C), detecting the boundary convention.
- For f:C→D, the cone has [Cone(f)]=[D]−[C]; the identity cone has zero class.
- For Λ=Z_p[C_p][[T]], the perfect complex [Λ --T→ Λ] is admitted even though the trivial F_p-module has no finite projective resolution.

*Needs:* §§1.11–1.14, 2.7; GeneralAlgebraicKTheory §§4.15–4.16, 6.19, 8.1.

### 2.9 localisation sequence for the canonical Ore set

For Λ=Z_p[[G]] and the regular two-sided canonical denominator set S (or S*), the perfect-complex localization theorem gives K₁(Λ)→K₁(Λ_S)→∂K₀(Λ,Λ_S)→K₀(Λ)→K₀(Λ_S). The relative group is modeled by S-acyclic perfect complexes. If G has no p-torsion, finite global dimension identifies it with K₀ of finitely generated S-torsion modules, or with K₀(𝔐_H(G)) for S*. The module identification requires that extra hypothesis; the relative-perfect sequence does not.

G compact p-adic analytic; H closed normal with G/H≅Z_p; canonical regular Ore set S or its p-saturation. Absence of p-torsion is assumed only for replacing relative perfect classes by all finitely generated torsion modules.

The target `orePerfectLocalization` verifies saturation and extension for S-quasi-isomorphisms, the mapping-cylinder hypotheses and the approximation/perfect comparison for derived extension of scalars. Flatness and clearing finitely many denominators give the finite perfect model. Apply the supplied Waldhausen fibration only after those verifications, and identify its boundary with the triple boundary.

(CFKSV, §3, (24), p. 174.)

**Checks.**

- The module description needs G without elements of order p; without it the relative group is described by perfect complexes (Σ_{S*}) only.
- For G = Γ, H = 1, the sequence is Λ^× → Q(Γ)^× → K₀(torsion modules) → ℤ → ℤ, with the last map an isomorphism.

*Needs:* §§1.7, 1.10–1.14, 2.7–2.8; GeneralAlgebraicKTheory §§4.6, 6.3, 6.8–6.9, 6.19, 8.1.

### 2.10 boundary map ∂_G

∂_G : K₁(Λ(G)_{S*}) → K₀(𝔐_H(G)) is the connecting map of the localisation sequence, normalised so that for s ∈ S* (a nonzero divisor, unit in Λ(G)_{S*}), ∂_G([s]) = [Λ(G)/Λ(G)s] = [coker(x ↦ xs)]; it is a homomorphism. Naturality uses denominator-preserving ring maps and derived base change on perfect complexes; the module-valued comparison additionally needs the resolution identification on both sides.

G has no elements of order p for the displayed target K₀(𝔐_H(G)). Without that hypothesis the same construction takes values in K₀(Λ,Λ_{S*}).

For R=Z_p[[T]], the complex [R --T→ R] in degrees −1,0 has class [R/(T)]. Its boundary is ∂T=+[R/(T)]; the shifted complex has the opposite class, and the determinant characteristic map for a trivialization 1→d(C) gives T⁻¹ instead. This fixes both signs without identifying the two characteristic conventions.

Use `boundaryMap`, `boundaryMap_unit`, `boundaryMap_exact`, `boundaryMap_natural`.

(CFKSV, §4, proof of Lemma 4.6, p. 191.)

**Checks.**

- G = Γ, H = 1: ∂[f] = [Λ(Γ)/(f)] for 0 ≠ f ∈ Λ(Γ).
- ∂[u] = 0 for u ∈ Λ(G)^× (degenerate case).
- ∂[p] = [Ω(G)] = [Λ(G)/p] ∈ K₀(𝔐_H(G)).
- For G=Γ and H=1, ∂[T⁻¹]=−[Λ/T]. This negative class cannot be represented by a single integral matrix cokernel modulo integral units.
- Fix the sign: ∂[s] = +[Λ/Λs]; the opposite convention changes characteristic elements to their inverses.

*Needs:* §2.9.

### 2.11 Surjectivity of ∂_G

If G has no element of order p, then ∂_G : K₁(Λ(G)_{S*}) → K₀(𝔐_H(G)) is surjective; equivalently every M ∈ 𝔐_H(G) has [M] = 0 in K₀(Λ(G)).

No element of order p.

(CFKSV, §3, Proposition 3.4, p. 174.)

**Checks.**

- For G = Γ this is the statement that finitely generated torsion Λ(Γ)-modules have zero class in K₀(Λ(Γ)) = ℤ.

*Needs:* §2.9; §2.3; §2.4; §2.5.

### 2.12 Characteristic elements

For M ∈ 𝔐_H(G) (G without element of order p), a characteristic element of M is any ξ_M ∈ K₁(Λ(G)_{S*}) with ∂_G(ξ_M) = [M]. Characteristic elements exist (§2.11) and two of them differ by an element of the image of K₁(Λ(G)) → K₁(Λ(G)_{S*}).

A characteristic element is a lift of a class, not a canonical scalar; its ambiguity is exactly the image of K₁(Λ(G)).

 For 0→M′→M→M″→0, prove ξ_M=ξ_M′ξ_M″ modulo the integral K₁ image (`characteristicElement_exact`).

Use `IsCharacteristicElement`, `exists_characteristicElement`, `characteristicElement_unique`, `characteristicElement_exact`.

(CFKSV, §3, definition (33), p. 176; CFKSV, §1, introduction, p. 163.)

**Checks.**

- M = Λ(G)/Λ(G)s with s ∈ S*: ξ_M = [s].
- M = 0: ξ_M ∈ image of K₁(Λ(G)) (degenerate case).
- G = Γ: ξ_M is the characteristic power series of M up to Λ(Γ)^×.
- Recover the characteristic power series up to Λ(Γ)^× for G = Γ (§2.14).

*Needs:* §2.11; §2.10; §2.9.

### 2.13 Units surject onto K₁ of the localisations

If G has no element of order p, the natural maps Λ(G)_S^× → K₁(Λ(G)_S) and Λ(G)_{S*}^× → K₁(Λ(G)_{S*}) are surjective. Hence characteristic elements can be represented by units of Λ(G)_{S*}.

Units of a semilocal ring surject onto K₁, for possibly noncommutative rings: ClassicalArithmeticCompletion §7.27 (GL_n of a semilocal ring is generated by elementary and diagonal unit matrices); AlgebraicKTheory A4 (TauCetiRoadmap #1142) gives the same through stable range one.

For Λ_S use semilocal stable range one. For Λ_{S*}=Λ_S[1/p], give the separate CFKSV lifting-and-boundary argument `units_surject_K1_saturated`: Λ_{S*} need not be semilocal. For example, with G=Z_p² and H one factor, its maximal ideals are not controlled by semilocality of Λ_S.

(CFKSV, §4, Theorem 4.4, p. 189; CFKSV, §4, p. 189.)

**Checks.**

- An integral unit represents a class in the kernel of the boundary.
- For R=Z_p[[T]], a regular scalar T has boundary +[R/T]. The inverse class T⁻¹ has boundary −[R/T], so the whole localized K₁ cannot be modeled by single integral cokernels.

*Needs:* §§2.6, 2.9–2.11; AlgebraicKTheory A4; ClassicalArithmeticCompletion §7.27.

### 2.14 commutative one-variable case

For G = Γ ≅ ℤ_p and H = 1: S* = Λ(Γ) ∖ {0}, Λ(Γ)_{S*} = Q(Γ) is the fraction field, K₁(Q(Γ)) = Q(Γ)^×, K₀(𝔐_H(G)) is the Grothendieck group of finitely generated torsion Λ(Γ)-modules, and ∂ sends f/g to [Λ/f] − [Λ/g]. A characteristic element of a torsion module M is its characteristic power series char(M) (PadicMeasuresIwasawaAlgebras L4) up to Λ(Γ)^×.

Λ(Γ) ≅ ℤ_p[[T]] is a regular local ring of dimension 2; K₁(Λ(Γ)) = Λ(Γ)^×.

(CFKSV, §2–3, p. 170.)

**Checks.**

- The ambiguity K₁(Λ(Γ)) = Λ(Γ)^× is exactly 'up to units'.
- Check a pseudo-null (finite) module: its characteristic element is a unit.

*Needs:* §2.12; §2.10; PadicMeasuresIwasawaAlgebras §§4.2, 4.6.

### 2.15 Surjectivity of ∂ for every compact p-adic Lie group

Let G be a compact p-adic Lie group with closed normal H and G/H ≅ ℤ_p, possibly with elements of order p. In the localisation sequence K₁(Λ(G)) → K₁(Λ(G)_S) → K₀(Λ(G), Λ(G)_S) → K₀(Λ(G)) → K₀(Λ(G)_S), the boundary map ∂ is surjective: the map η : K₀(Λ(G), Λ(G)_S) → K₀(Λ(G)) is zero.

G may have p-torsion; the relative target consists of S-acyclic perfect complexes, not all S-torsion modules.

(Kakde, Lemma 5, pp. 8–9; CFKSV, Proposition 3.4, pp. 173–175 for the no-p-torsion module specialization.)

**Checks.**

- For G=C_p×Z_p, the relative boundary is still surjective although the ring does not have finite global dimension.
- A relative triple has projective terms and a localized isomorphism; clearing denominators gives a perfect cokernel, not a resolution theorem for arbitrary modules.

*Needs:* §2.9; §2.8; §2.3; §2.5.

### Examples

Let R=Z_p[[T]] and C=[R --T→ R] in degrees −1,0. Then [C]=[R/(T)] and ∂T=[C]. A determinant trivialization a_ε:1→d(C) gives ch(C,a_ε)=ε/T, hence ∂ch(C,a_ε)=−[C]. Its shift, with the monoidally inverted trivialization, gives T/ε and the opposite boundary. For the unit differential 1 the cokernel, boundary and order all vanish. These computations fix the relation between the module characteristic convention and the determinant-pair convention (Burns–Venjakob, proof of Proposition 3.8, pp. 10–11).

### Dependencies

Layers 0–1; AlgebraicKTheory A0–A4; GeneralAlgebraicKTheory §§4.6, 4.15–4.16, 6.3, 6.8–6.9, 6.19, 8.1; ClassicalArithmeticCompletion §7.27. Idempotent lifting and character detection precede boundary surjectivity. The relative-perfect sequence is constructed independently of the finite-global-dimension module comparison.

## Layer 3: Representation evaluation and its ambiguities

### 3.1 ring homomorphism Φ_ρ : Λ(G) → M_n(Λ_𝒪(Γ))

G is a compact p-adic Lie group with a closed normal H and G/H = Γ ≅ ℤ_p (topological generator fixed, Λ(Γ) = ℤ_p[[T]]), 𝒪 the ring of integers of a finite extension L of ℚ_p, Λ_𝒪(Γ) = 𝒪[[T]] with fraction field Q_𝒪(Γ), and ρ : G → GL_n(𝒪) continuous. By continuity ρ gives ρ : Λ(G) → M_n(𝒪) (14). The continuous homomorphism G → (M_n(𝒪) ⊗_{ℤ_p} Λ(Γ))^×, σ ↦ ρ(σ) ⊗ σ̄ (σ̄ the image of σ in Γ) (16), extends to a ring homomorphism Φ_ρ : Λ(G) → M_n(Λ_𝒪(Γ)) (15), with Φ_ρ(p) = pI_n; composing with the augmentation Λ_𝒪(Γ) → 𝒪 gives (14).

The representation has positive rank n for Morita evaluation. Rank zero still defines the zero matrix representation and zero twist, but is omitted from this K₁-to-field adapter.

Use `representationRingHom`, `twistRingHom`, `twistRingHom_augmentation`, `twistRingHom_p`.

(CFKSV, §3, (14)–(16), p. 172.)

**Checks.**

- G = Γ, H = 1, ρ = 1: Φ_ρ is the identity Λ(Γ) → Λ(Γ).
- Φ_ρ(σ) = ρ(σ)·σ̄, so det Φ_ρ(σ) = det ρ(σ)·σ̄ⁿ.
- Φ_{ρ₁⊕ρ₂} is block diagonal with blocks Φ_{ρ₁}, Φ_{ρ₂}.
- Φ_ρ records the Γ-component σ̄ as well as ρ(σ); for H = 1 and ρ trivial it is the identity of Λ(Γ).

*Needs:* §0.3; PadicMeasuresIwasawaAlgebras §1.7; `Matrix`.

### 3.2 Φ_ρ extends to the localisation at S*

(Lemma 3.3.) Φ_ρ extends to a ring homomorphism Φ_ρ : Λ(G)_{S*} → M_n(Q_𝒪(Γ)) (17): Φ_ρ(s) is invertible for every s ∈ S* = ∪_n pⁿS.

S the canonical Ore set of Layer 1.

(CFKSV, §3, Lemma 3.3, p. 172; CFKSV, §3, proof of Lemma 3.3, p. 173.)

**Checks.**

- The extension is to matrices over the fraction field Q_𝒪(Γ), not over Λ_𝒪(Γ): elements of S become invertible only after inverting nonzero power series.

*Needs:* §3.1; §1.7; §1.2; §1.3; §1.10.

### 3.3 Evaluation of K₁-elements at representations

(17) induces Φ′_ρ : K₁(Λ(G)_{S*}) → K₁(M_n(Q_𝒪(Γ))) = Q_𝒪(Γ)^× (22) (Morita equivalence and the determinant of the field Q_𝒪(Γ)). Let φ : Λ_𝒪(Γ) → 𝒪 be the augmentation with kernel 𝔭, extended to φ : Λ_𝒪(Γ)_𝔭 → L. For ξ ∈ K₁(Λ(G)_{S*}), ξ(ρ) := φ(Φ′_ρ(ξ)) ∈ L if Φ′_ρ(ξ) ∈ Λ_𝒪(Γ)_𝔭, and ξ(ρ) := ∞ otherwise. On K₁(Λ(G)) this restricts to K₁(Λ(G)) → K₁(M_n(𝒪)) = 𝒪^× (21).

ρ : G → GL_n(𝒪) continuous (Artin or not).

Use `twistK1` (Φ′_ρ : K₁(Λ(G)_{S*}) → Q_𝒪(Γ)^×); `evaluate` (ξ ↦ ξ(ρ) ∈ L ∪ {∞}); `evaluate_groupElement` ([g](ρ) = det ρ(g) for g ∈ G ⊆ Λ(G)^×); `evaluate_mul` ((ξη)(ρ) = ξ(ρ)η(ρ) when both are finite); `evaluate_directSum` (The rational determinant functions satisfy Φ′_(ρ₁⊕ρ₂)(ξ)=Φ′_ρ₁(ξ)Φ′_ρ₂(ξ). The augmentation values multiply when both factors are finite; do not assign a value to 0·∞); `evaluate_units` (On K₁(Λ(G)) the evaluation is (21), with values in 𝒪^×).

(CFKSV, §3, (21)–(22), p. 173.)

**Checks.**

- For g ∈ G, Φ′_ρ([g]) = det(ρ(g)ḡ I_n) = det ρ(g)·ḡⁿ, so [g](ρ) = det ρ(g) (augmentation ḡ ↦ 1).
- G = Γ, H = 1, ρ = 1: Λ(Γ)_{S*} = Q(Γ), and ξ(1) = f(0) for ξ = f ∈ Λ(Γ)_𝔭, while ξ = T gives 0 and ξ = 1/T gives ∞.
- For an open subgroup G′ ⊆ G and a character ψ of G′, [g](Ind_{G′}^G ψ) = det(Ind ψ)(g) = sgn(g on G/G′)·ψ(V(g)) with V the transfer: the sign of the permutation action survives.
- If x≠1 lies in the reduced-norm kernel, multiplying a K₁-element by x leaves all reduced determinant functions unchanged wherever defined. This is a conditional obstruction to uniqueness; the test does not assert existence of such x for every G.
- Let G=Γ and ξ=(γ−a)/(γ−b), with distinct a,b∈1+pZ_p. The characters γ↦a and γ↦b give respectively zero and a pole. Their direct sum has rational determinant ((aγ−a)/(aγ−b))((bγ−a)/(bγ−b)); cancellation of T gives the value −a/b at γ=1. For p=3, a=4 and b=7 this is −4/7. The separate values cannot be multiplied as 0·∞.
- For G=Γ, ξ=(γ−a)/(γ−b) with distinct a,b in 1+pZ_p, the characters γ↦a and γ↦b give a zero and a pole. Their direct-sum rational determinant has cancellation at augmentation, so an unconditional 0·∞ value rule is invalid.
- Conventions: Φ′_ρ is a determinant of Φ_ρ, so for a group element g, [g](ρ) = det ρ(g) (not trace, not det ρ(g^{−1})); the value ∞ is part of the definition.
- Only the value at the augmentation is taken: Φ′_ρ(ξ) ∈ Q_𝒪(Γ)^× carries more information than ξ(ρ).

*Needs:* §3.2; §2.9; GeneralAlgebraicKTheory §8.1; AlgebraicKTheory A2.

### 3.4 Akashi series

Assume G has no element of order p, let H◁G with G/H=Γ, and let M∈𝔐_H(G). Then H_i(H,M) are finitely generated torsion Λ(Γ)-modules and vanish above cd_p H. With f_(i,M) their characteristic series, the finite alternating product Ak(M)=∏_i f_(i,M)^{(−1)^i} modulo Λ(Γ)^× defines Ak:K₀(𝔐_H(G))→Q(Γ)^×/Λ(Γ)^×. For O-coefficient M use Λ_O(Γ); its coefficient norm satisfies N(Ak_O(M))=Ak(M). A particular bounded-homology perfect variant may be defined separately, but there is no infinite product for arbitrary p-torsion G.

G has no element of order p, ensuring a bounded homology product. Alternatively specify a category on which H-homology is bounded and the exact-sequence operations preserve that bound.

Use `akashiSeries`, `akashiSeriesO`, `akashiSeries_norm`, `homology_torsion`.

(CFKSV, §3, Lemma 3.1, p. 171; CFKSV, §3, (37)–(39), p. 177; CFKSV, §3, (40), p. 178.)

**Checks.**

- G = Γ, H = 1: Ak(M) is the characteristic power series of M (only H_0 = M).
- If H is finite of order prime to p, only H_0(H, M) = M_H contributes.
- For G=Z_p², H the first factor and M=Λ(G)/p, multiplication by the H-coordinate is injective on F_p[[T_H,T_Γ]]. Thus H₀(H,M)=F_p[[T_Γ]], higher H-homology vanishes, and Ak(M)=p modulo Λ(Γ)^×.
- For G=C_p×Γ, H=C_p and M=F_p with trivial action, H_i(H,M)≅F_p for every i≥0. The ordinary finite alternating-product definition is unavailable.
- Ak is defined only modulo units; the Euler-characteristic formula uses its value at T = 0 up to p-adic units.

*Needs:* §1.13; §2.4; PadicMeasuresIwasawaAlgebras §§4.2, 4.6.

### 3.5 evaluation–Akashi diagram

(Lemma 3.7.) With Δ_ρ([M]) = Ak_𝒪(tw_{ρ̂}(M)) (41)–(42), where ρ̂(g) = ρ(g^{−1})^t is the contragredient, and ∂_Γ : Q_𝒪(Γ)^× → Q_𝒪(Γ)^×/Λ_𝒪(Γ)^×, the square ∂_Γ ∘ Φ′_ρ = Δ_ρ ∘ ∂_G (43) commutes.

G without elements of order p (so ∂_G is defined on modules).

(CFKSV, §3, Lemma 3.7, p. 178; CFKSV, §3, proof of Lemma 3.7, p. 179.)

**Checks.**

- The contragredient ρ̂ appears on the module side: the evaluation at ρ corresponds to twisting by ρ̂.
- The row action is multiplication by ρ(g), so (v·g)·h=v·(gh). Multiplying rows by ρ(g)^t would reverse the order for noncommuting matrices.

*Needs:* §3.3; §3.4; §0.13; §2.10; GeneralAlgebraicKTheory §8.1; AlgebraicKTheory A2.

### 3.6 Characteristic elements compute twisted Euler characteristics

(Theorem 3.6.) Assume G has no element of order p. Let M ∈ 𝔐_H(G) with characteristic element ξ_M. For every continuous ρ : G → GL_n(𝒪) with χ(G, tw_{ρ̂}(M)) finite, ξ_M(ρ) ≠ 0, ∞ and χ(G, tw_{ρ̂}(M)) = |ξ_M(ρ)|_p^{−m_ρ}, where m_ρ = [L : ℚ_p] and |p|_p = 1/p.

G has no element of order p; χ(G, tw_{ρ̂}(M)) finite.

(CFKSV, §3, Theorem 3.6, p. 177; CFKSV, §3, proof of Theorem 3.6, p. 178.)

**Checks.**

- The formula determines |ξ_M(ρ)|_p only; the unit part of ξ_M(ρ) is not an Euler-characteristic invariant.
- G = Γ, H = 1, ρ = 1 and M = Λ(Γ)/(T − p): γ acts on M ≅ ℤ_p by 1 + p, so H₀(Γ, M) = ℤ_p/p and H₁(Γ, M) = 0, χ(Γ, M) = p, and ξ_M(1) = −p with |−p|_p^{−1} = p.
- For M = Λ(Γ)/(T), χ(Γ, M) is infinite (H₀ = H₁ = ℤ_p) and ξ_M(1) = 0, outside the theorem's hypothesis.

*Needs:* §3.5; §2.12; SelmerIwasawaCohomology §§3.1–3.3, 3.8–3.15.

### 3.7 Evaluation at Artin representations under a finiteness condition

(Theorem 3.8, Lemma 3.9.) Assume G has no element of order p and let M ∈ 𝔐_H(G) satisfy H_i(H′, M) finite for all i ≥ 1 and all open H′ ⊆ H normal in G (51). Then for every Artin representation ρ (ker ρ open), Ak_𝒪(tw_ρ(M)) ∈ Λ_𝒪(Γ)[1/p] modulo units (52), ξ_M(ρ) ≠ ∞, and ξ_M(ρ) ≠ 0 iff χ(G, tw_{ρ̂}(M)) is finite.

G without elements of order p; (51).

(CFKSV, §3, Theorem 3.8, p. 180; CFKSV, §3, Lemma 3.9, p. 181.)

**Checks.**

- Condition (51) is on all open normal H′ ⊆ H; it holds for M iff it holds for M(p) and M/M(p).

*Needs:* §3.6; §3.5; SelmerIwasawaCohomology §§3.1–3.3, 3.8–3.15.

### 3.8 Artin formalism for G-Euler characteristics

(Theorem 3.10.) Let G be a compact p-adic Lie group without elements of order p (no H needed), G′ ⊆ G open normal, Δ = G/G′, V the irreducible Q̄_p-representations of Δ, all realised over L with integers 𝒪. For finitely generated M, χ(G′, M) is finite iff χ(G, tw_ρ(M)) is finite for all ρ ∈ V, and then χ(G′, M)^{[L:ℚ_p]} = ∏_{ρ∈V} χ(G, tw_ρ(M))^{n_ρ} (58).

G without elements of order p.

 Here n_ρ=dim_L ρ, and finitely generated means over Λ(G).

(CFKSV, §3, Theorem 3.10, p. 183; CFKSV, §3, proof of Theorem 3.10, p. 184.)

**Checks.**

- The exponent [L : ℚ_p] on the left accounts for the 𝒪-coefficients.

*Needs:* §0.13; §2.3; PadicMeasuresIwasawaAlgebras §1.7.

### 3.9 GL₂ example: X₁(11) at p = 5

(Proposition 3.11.) For E = X₁(11), p = 5, F_∞ = ℚ(E_{5^∞}), G = Gal(F_∞/ℚ), H = Gal(F_∞/ℚ^cyc), M = X(E/F_∞) ∈ 𝔐_H(G), and the degree-4 Artin representations ρ_i induced from nontrivial characters of Gal(F_i/ℚ(μ_5)) with F_1 = ℚ(E_5), F_2 = ℚ(E_{2,5}) (E_2 the conductor-11 curve with E_2(ℚ) = 0): χ(G, tw_{ρ_1}(M)) = 5³ and χ(G, tw_{ρ_2}(M)) = 5, so |ξ_{E,5}(ρ_1)|_5^{−1} = 5³ and |ξ_{E,5}(ρ_2)|_5^{−1} = 5 (ρ̂_i = ρ_i).

Assume the explicit arithmetic values χ(G_F,X)=5⁴, χ(G_{F₁},X)=5¹⁶ and χ(G_{F₂},X)=5⁸, and the representation decompositions used in CFKSV (78)–(80). The conclusion is the Artin-formalism consequence of those inputs.

The relative exponents are (16−4)/4=3 and (8−4)/4=1, so the two evaluations have absolute-value inverses 5³ and 5. These explicit arithmetic inputs are hypotheses of this application.

(CFKSV, §3, Example, p. 185; CFKSV, §3, Proposition 3.11, p. 186; CFKSV, §3, proof of Proposition 3.11, p. 187.)

**Checks.**

- Checks the Frobenius/contragredient conventions: ρ_i are self-dual, so tw_{ρ̂_i} = tw_{ρ_i}.

*Needs:* §3.8; §3.6.

### 3.10 integrality conjecture for characteristic elements

Assume G has no element of order p. Put R₁ = Λ(G), R₂ = Λ(G)[1/p], R₃ = Λ(G)_{S*} (so R₁ ⊂ R₂ ⊂ R₃), A₁ = Λ_𝒪(Γ), A₂ = Λ_𝒪(Γ)[1/p], and α : R₃^× → K₁(R₃) the canonical map (surjective by §2.13). Let ℜ(G) be the continuous representations ρ of the form (11) (over the integers of finite extensions of ℚ_p) and 𝔄(G) ⊂ ℜ(G) the Artin ones. Conjecture 4.8 is the proposition that, for every ξ ∈ K₁(R₃), in each of four cases the assertions (a)–(d) are equivalent: Case 1: (a) ξ ∈ α(R₂ ∩ R₃^×), (b) ξ(ρ) ≠ ∞ for all ρ, (c) Φ′_ρ(ξ) ∈ A₂ for all ρ, (d) Φ′_ρ(ξ) ∈ A₂ for all Artin ρ; Case 2: α(R₁ ∩ R₃^×), ξ(ρ) finite and in 𝒪, Φ′_ρ(ξ) ∈ A₁; Case 3: α(R₂^×), ξ(ρ) ≠ 0, ∞, Φ′_ρ(ξ) ∈ A₂^×; Case 4: α(R₁^×), ξ(ρ) finite and in 𝒪^×, Φ′_ρ(ξ) ∈ A₁^×. (Lemma 4.9.) In each case (a) ⇒ (b), (b) ⇔ (c) and (c) ⇒ (d).

Conjecture 4.8 is a proposition. The stated implications are proved; the converses remain conjectural.

Use `IntegralityConjecture` (The proposition 'for all ξ, (a)–(d) are equivalent' in each case); `integrality_a_imp_b` (Lemma 4.9: (a) ⇒ (b)); `integrality_b_iff_c` (Lemma 4.9: (b) ⇔ (c)); `integrality_c_imp_d` (Lemma 4.9: (c) ⇒ (d)); `artinEvaluation_twist` (With Φ_ρ(g)=ρ(g)ḡ and a=η(γ), Φ′_(ρη)(ξ)(T)=Φ′_ρ(ξ)(a(1+T)−1). ).

(CFKSV, §4, Conjecture 4.8 and Lemma 4.9, p. 196; CFKSV, §4, after Lemma 4.9, p. 197.)

**Checks.**

- For G=Γ, p⁻¹ satisfies the pole-free Case 1 criterion but fails Case 2’s integral-value criterion. Do not identify these two cases.
- ξ = α(u) with u ∈ Λ(G)^× satisfies Case 4 (a), hence (b)–(d).
- ξ = α((T − p)^{−1}) for G = ℤ_p fails Case 1 (b) at the character with η(γ₀) − 1 = p.
- For ξ=[γ] and ρ=1, Φ′_η(ξ)=a(1+T). Substitution by a⁻¹(1+T)−1 gives a⁻¹(1+T), which is wrong whenever a²≠1.
- `IntegralityConjecture` occurs only as a stated hypothesis, never as a proved statement.
- For G=Γ, Case 2 requires finite integral values at all admitted characters. Absence of poles alone tests Case 1, and is insufficient for Case 2: the constant p⁻¹ has no poles but is not integral. The function T/(T−p) has a pole detected at η(γ)=1+p.
- For ξ=[γ] and η(γ)=a, the twisted determinant is a(1+T). The substitution (1+T)↦a(1+T) is the required direction; inverse substitution would produce a⁻¹(1+T).

*Needs:* §3.3; §3.5; §2.13; §2.12.

### 3.11 SK₁ and the quotient K′₁ of Iwasawa algebras

For a finite group P and 𝒪 the integers of a finite extension L/ℚ_p, SK₁(𝒪[P]) = ker(K₁(𝒪[P]) → K₁(L[P])). For a compact p-adic Lie group G, SK₁(Λ_𝒪(G)) := lim_U SK₁(𝒪[G/U]), and SK₁(Λ_𝒪(G)_S), SK₁(Λ̂_𝒪(G)_S) are its images in K₁(Λ_𝒪(G)_S) and K₁ of the p-adic completion Λ̂_𝒪(G)_S. K′₁(R) := K₁(R)/SK₁(R) for R each of these rings. Then K′₁(Λ_𝒪(G)) ≅ lim_Δ K′₁(𝒪[Δ]) over the finite quotients Δ of G, and K′₁(Λ(G)) ≅ lim_{Ḡ} K′₁(Λ(Ḡ)) over the quotients Ḡ = G/U by open pro-p subgroups U ≤ H normal in G.

G compact p-adic Lie.

 Prove compatibility of the inverse-limit maps with quotients and norms; Artin evaluation kills the integral SK₁ image and factors through K₁′.

Use `SK1`, `K1Prime`, `k1Prime_equiv_limit`, `k1Prime_equiv_limit_proP`, `k1Prime_map`, `evaluate_k1Prime`.

(Kakde, §2.2, Definitions 6 and 7, p. 9 (v3).)

**Checks.**

- G abelian: SK₁(Λ(G)) = 1 and K′₁(Λ(G)) = K₁(Λ(G)) ≅ Λ(G)^×.
- G = G_ab × Δ with #Δ prime to p: K′₁(Λ(G)_S) = K₁(Λ(G)_S) (Kakde, Lemma 17).
- P cyclic: SK₁(ℤ_p[P]) = 1, so K′₁(ℤ_p[P]) = K₁(ℤ_p[P]) = ℤ_p[P]^×.
- Elements differing by the image of integral SK₁ have identical Artin evaluations and identical boundary. If that image is nontrivial, these data cannot give uniqueness in K₁; no nontriviality or vanishing for every group is assumed.
- K′₁ is used because SK₁ is invisible to Artin evaluations; uniqueness in the main conjecture holds in K′₁.

*Needs:* §2.9; §0.4; ClassicalArithmeticCompletion §7.27.

### 3.12 Semisimple total quotient in dimension one

Suppose G is compact p-adic analytic with an open central Γ₀≅Z_p, and O is a finite extension ring of integers. With R=O[[Γ₀]] and F=Frac(R), define Q_O(G)=F⊗_R O[[G]]. It is the classical total ring of fractions and a finite-dimensional separable semisimple F-algebra; changing Γ₀ gives the canonically isomorphic total quotient. It is distinct from Λ(G)_S and Λ(G)[1/p].

G has an open central Z_p-subgroup (the one-dimensional situation of the cited routes); O finite over Z_p; coefficients are characteristic zero after tensoring.

 After a common finite splitting extension, every simple factor is a matrix algebra over its extended center; retain those centers in `IwasawaTotalQuotient.split`.

Use `IwasawaTotalQuotient.ofCentralSubgroup`, `IwasawaTotalQuotient.map`, `IwasawaTotalQuotient.centralChange`, `IwasawaTotalQuotient.split`.

(Kakde, §5.1.4, Lemma 37, pp. 31–32; Nickel, Example 2.7 and §2.2, pp. 7–8.)

**Checks.**

- For G=Z_p, Q_O(G)=Frac(O[[T]]), whereas the canonical S-localization still does not invert p.
- For G=C₂×Z_p with p odd, Q_Zp(G) is the product of two copies of Frac(Z_p[[T]]); it is not a field.
- For the trivial finite quotient, the construction is just the central field F; changing Γ₀ to Γ₀^p gives the same total quotient of the larger algebra.

*Needs:* §0.3; §1.11; ProfiniteProPGroups Layer 9 (completed group algebra and procyclic coordinates); RepresentationTheory/InductionRestriction Layer 7.

### 3.13 Reduced norms and the surviving SK₁ ambiguity

For the dimension-one total quotient Q=∏_i M_(n_i)(D_i), use the componentwise reduced norms supplied by IntegralHeckeAndGaloisDeterminants Layer 0. They induce Nrd:K₁(Q)→ζ(Q)^×, with kernel SK₁(Q). After a common splitting field, equality of determinant functions on all simple factors is equivalent to equality of reduced norms. Thus equality of all such characterwise determinants determines a localized class only modulo the inverse image of SK₁(Q); without injectivity K₁(Λ_S)→K₁(Q), it need not even determine a unique class modulo an internally defined kernel. Artin evaluations at admissible cyclotomic points require a separate separation argument. Kakde’s finite-level SK₁(Λ) and this SK₁(Q) are different definitions.

Dimension-one Q as above; all simple factors and their centers retained; a common splitting field. For conclusions about Λ_S additionally state the kernel of its map to Q; equality at isolated points is not substituted for equality of determinant functions.

Define `reducedNormCharacter` by the central simple factors and prove its independence of the splitting field and compatibility with Artin determinants; the reduced-norm laws themselves are supplied by IntegralHeckeAndGaloisDeterminants Layer 0.

(Ritter–Weiss, Introduction and §1, pp. 1–5; Ritter–Weiss (2026), Introduction and Theorem 1A, pp. 1–7; Nickel, §2.2, pp. 7–8; Remark 2.19, p. 11.)

**Checks.**

- For Q=M₂(F), Nrd is the ordinary determinant, so diag(a,b) maps to ab, not (ab)².
- For Q=F×F the two components remain ordered; (a,b) and (b,a) cannot be identified by multiplying them.
- A hypothetical nontrivial x∈SK₁(Q) has every split determinant equal to 1 but x≠1; no proof of uniqueness can discard this possibility.

*Needs:* §3.12; §3.3; §3.11; AlgebraicKTheory A2; IntegralHeckeAndGaloisDeterminants Layer 0.

### 3.14 Functoriality and induction of Artin evaluation

For the CFKSV twist Φ_ρ(g)=ρ(g)⊗ḡ and Artin representations admitting the localized map, coefficient extension carries its determinant to the extended determinant, Φ_(ρ⊕σ) gives the product of evaluations, and the trivial n-dimensional representation evaluates a scalar unit u as u^n. For an open subgroup U⊆G with compatible canonical denominator sets, the transfer in K₁ evaluates at σ as the original class at Ind_U^G σ. Quotient descent evaluates at a representation of G/N by inflation. All augmentation evaluations are asserted only on the regular-at-zero domain, with zeros/poles recorded separately.

Representations continuous with finite image on stable O-lattices; coefficient extension contains their values. For transfer/quotient statements require the relevant ring maps or finite-projective restriction functors to carry the localized perfect subcategories to each other.

(CFKSV, §3, pp. 171–173, equations (13)–(22); Theorem 3.10, pp. 183–184; Kakde, §§3–4, pp. 13–30; Proposition 95, pp. 67–69.)

**Checks.**

- For a scalar unit u∈O^× and dim ρ=n, evaluation is u^n.
- For G=C₂×Γ, U=Γ and σ=1, Ind σ=1⊕sgn; evaluation after transfer is the product of the two scalar evaluations.
- A class represented by T has augmentation zero and T⁻¹ a pole; neither belongs to an everywhere O^×-valued evaluation map.

*Needs:* §§3.11–3.13; AlgebraicKTheory A2; IntegralHeckeAndGaloisDeterminants Layer 0.

### Examples

For G=Γ and a one-dimensional character η with η(γ)=a, twisting a denominator γ−1 gives a(1+T)−1. Evaluation of [γ] is a, so using a⁻¹ instead changes the convention. For an index-two subgroup and the trivial character, the determinant of the permutation action of an element exchanging the two cosets is −1; evaluation of induced representations retains that sign. Rational determinant identities are formed before augmentation, which may have a zero or a pole (CFKSV (15)–(22), pp. 172–173).

### Dependencies

Layers 0–2; finite-free coefficient extension, commutative characteristic ideals and their norms; AlgebraicKTheory A2; generic induction and reduced norms. Ordinary Akashi and Euler-characteristic statements use the no-p-torsion hypotheses; the perfect-complex evaluation map itself does not acquire that restriction.

## Layer 4: Arithmetic modules and equivariant complexes

### 4.1 elliptic-curve Selmer specialization

Let E/ℚ be an elliptic curve and p ≥ 5 a prime of good ordinary reduction ('our hypotheses on p'), F_∞ = ℚ(E_{p^∞}) ⊇ ℚ(μ_{p^∞}) ⊇ ℚ^cyc (Weil pairing), G = Gal(F_∞/ℚ) (a closed subgroup of GL₂(ℤ_p), of dimension 4 without CM and 2 with CM, and with no element of order p), H = Gal(F_∞/ℚ^cyc), Γ = Gal(ℚ^cyc/ℚ). For an algebraic extension L/ℚ the Selmer group is 𝒮(E/L) = ker(H¹(L, E_{p^∞}) → Π_w H¹(L_w, E(L̄_w))) over the non-archimedean w, and X(E/L) = Hom(𝒮(E/L), ℚ_p/ℤ_p); for L/F Galois with compact p-adic Lie group and finite ramification set, X(E/L) is a finitely generated left Λ(Gal(L/F))-module. Also G_F = Gal(F_∞/F), H_F = Gal(F_∞/F^cyc) and Y(E/K) = X(E/K)/X(E/K)(p).

p ≥ 5 and good ordinary reduction; p ≥ 5 is what rules out p-torsion in G ⊂ GL₂(ℤ_p). This is the module-level Selmer instance; the separate §4.6 and dual-complex targets specify the complex-level objects.

Use the supplied Greenberg Selmer group and its contragredient Pontryagin dual, prove their agreement with the classical elliptic local Kummer condition and the stated finite-generation result for the p-adic Lie extensions used here. The targets `ellipticSelmer_eq_greenberg`, `ellipticDualSelmer_fg` and `trivialisingField_cyclotomic` provide this specialization. For arbitrary algebraic L the Selmer group is a direct limit over finite subextensions; the finite-generation assertion is restricted to Galois p-adic Lie extensions with the usual finite ramification hypotheses.

Use `trivialisingField`, `G_noPTorsion`.

(CFKSV, §5, set-up, p. 197; CFKSV, §5, Selmer groups and the hypotheses on p, p. 198.)

**Checks.**

- For E with CM, G has dimension 2; without CM, dimension 4 (Serre).
- F_∞ ⊇ ℚ(μ_{p^∞}) ⊇ ℚ^cyc, so Γ is a quotient of G.
- p = 3: GL₂(ℤ_3) contains elements of order 3, e.g. (0 −1; 1 −1), so G may have 3-torsion; the hypotheses exclude p = 3.
- Y(E/K) = X(E/K)/X(E/K)(p) removes the p-primary torsion.
- For L = F a number field, X(E/F) is the Pontryagin dual of the p-primary Selmer group, with ℤ_p-corank the Mordell–Weil rank plus the corank of Ш[p^∞].

*Needs:* SelmerIwasawaCohomology §§2.8–2.10, 2.21, 3.8, 3.13; Tau Ceti elliptic curves and Weil pairing; CFKSV ordinary local condition.

### 4.2 𝔐_H(G) conjecture and Mazur's torsion conjecture

(Conjecture 5.1.) Under the hypotheses on p, X(E/F_∞) belongs to 𝔐_H(G), i.e. is S*-torsion (§1.13). (Conjecture 5.2, Mazur.) If E has good ordinary reduction at p, then for each finite extension F of ℚ, X(E/F^cyc) is Λ(Γ_F)-torsion. They are named conjectural propositions.

The hypotheses of §4.1 hold. The equivalence between the two conjectures is not assumed; §4.3 proves the specified partial implications.

Use `MHConjecture`, `MazurTorsionConjecture`, `MHConjecture.of_criteria`.

(CFKSV, §5, Conjectures 5.1 and 5.2, p. 198.)

**Checks.**

- For CM curves Conjecture 5.2 holds (two-variable main conjecture; CFKSV p. 200), and 5.1 reduces to μ = 0 over some L (Corollary 5.5).
- For the conductor-11 curves at p = 5, Conjecture 5.1 holds (§4.3).
- For the zero Selmer module, both torsion and 𝔐_H predicates hold. For the free module Λ(G), the 𝔐_H predicate fails, since its localization is nonzero. Conjectural membership for an arithmetic X is a separate assertion.
- For CM curves, the named two-variable result supplies the cyclotomic torsion assertion; the additional μ=0 criterion is retained when deducing 𝔐_H membership.
- For the conductor-11 curves at p=5, §4.3 supplies the specific 𝔐_H membership theorem.
- The general 𝔐_H conjecture remains a proposition to assume. The proved criteria and CM cases do not prove it for every ordinary elliptic curve.
- Mazur’s cyclotomic torsion assertion and 𝔐_H membership are separate assertions; the GL₂ conjecture retains the cyclotomic input in its stated arithmetic setting.

*Needs:* §4.1; §1.13.

### 4.3 Criteria for X(E/F_∞) ∈ 𝔐_H(G)

(Lemma 5.3.) If X(E/F_∞) ∈ 𝔐_H(G), then for each finite F ⊂ F_∞: (i) X(E/F^cyc) is Λ(Γ_F)-torsion; (ii) H_i(H_F, X(E/F_∞)) = 0 for i ≥ 1; (iii) H_i(H_F, Y(E/F_∞)) is finite for i = 1, 2 and zero for i > 2; and μ_{G_L}(X(E/F_∞)) = μ_{Γ_L}(X(E/L^cyc)) when G_L is pro-p. (Lemma 5.4.) If X(E/F^cyc) is Λ(Γ_F)-torsion for all finite F and some L has G_L pro-p, μ_{G_L}(X(E/F_∞)) = μ_{Γ_L}(X(E/L^cyc)) and H₁(H_L, Y(E/F_∞)) finite, then X(E/F_∞) ∈ 𝔐_H(G). (Corollary 5.5.) If E has CM, X(E/F_∞) ∈ 𝔐_H(G) iff μ_{Γ_L}(X(E/L^cyc)) = 0 for some L with G_L pro-p. (Proposition 5.6.) If some L ⊂ F_∞ with G_L pro-p carries an elliptic curve E′ isogenous to E over L with X(E′/L^cyc) finitely generated over ℤ_p, then X(E/F_∞) ∈ 𝔐_H(G). Example: the three conductor-11 curves E₀, E₁, E₂ at p = 5 with L = ℚ(μ₅) (G_L pro-5 and X(E₁/L^cyc) = 0) satisfy Conjecture 5.1.

E/Q and p satisfy §4.1, and the finite fields F,L lie in F∞. The final conductor-11 application assumes G_L is pro-5 and X(E₁/L_cyc)=0 for L=Q(μ₅).

Prove the named control inputs `ellipticControl_kernelFinite`, `ellipticHomology_vanishing` and `ellipticMu_homologyFormula` in this specialization: restriction from cyclotomic to the trivializing tower has finite dual cokernel and Z_p-finitely generated kernel; cyclotomic torsion at all finite levels gives H_i(H_F,X)=0 for i≥1; and the μ difference is the alternating μ of H_i(H_L,Y). Use compact Nakayama to prove the converse criterion and the isogeny criterion. For the CM corollary prove the three specific inputs used on CFKSV p. 200: `cmCyclotomicTorsion` asserts Λ(Γ_F)-torsion for every finite F⊂F∞; `cmTwoVariableMuZero` asserts μ_(G_L)(X)=0 for every pro-p G_L; `cmDual_noPseudoNull` asserts that X has no nonzero pseudo-null Λ(G_L)-submodule. Their combination gives X(p)=0, so Y=X and its positive H_L-homology vanishes. These are additional arithmetic targets, not properties built into the Selmer definition.

(CFKSV §5, Lemmas 5.3–5.4, Corollary 5.5 and Proposition 5.6, pp. 199–201; the control and μ comparisons are the intermediate results cited in their proofs.)

**Checks.**

- Isogenous curves have the same p-power division field, so E₀, E₁, E₂ share F_∞ = ℚ(E_{5^∞}); Proposition 5.6's example uses this.
- Lemma 5.3(i) is the necessary condition: if X(E/F^cyc) is not Λ(Γ_F)-torsion for some F, then X(E/F_∞) ∉ 𝔐_H(G).

*Needs:* §§0.9–0.14, 3.4, 4.1–4.2; SelmerIwasawaCohomology §§3.3, 3.8–3.9; compact Nakayama.

### 4.4 Admissible p-adic Lie extensions and the hypothesis μ = 0

Let F be a totally real number field and p odd. An admissible p-adic Lie extension F_∞/F is a Galois extension, unramified outside a finite set of primes, with F_∞ totally real, G = Gal(F_∞/F) a p-adic Lie group and F_cyc ⊆ F_∞; put H = Gal(F_∞/F_cyc), Γ = G/H, and fix a finite set Σ of finite primes containing the primes above p and those ramified in F_∞. F_∞/F satisfies μ = 0 if some open pro-p subgroup H′ ≤ H has Gal(M/F_∞^{H′}) finitely generated over ℤ_p, M the maximal abelian pro-p extension of F_∞^{H′} unramified outside Σ; equivalently, the Iwasawa μ-invariant of L(μ_p) vanishes for L with L_cyc = F_∞^{H′}. Equivalently (Lemma 9), X = Gal(M_∞/F_∞) is finitely generated over Λ(H), M_∞ the maximal abelian pro-p extension of F_∞ unramified outside Σ.

F and F∞ are totally real; p is odd; Σ contains the primes over p as well as all ramified finite primes.

 For closed normal N⊆H, prove admissibility and μ=0 for F∞^N/F; finite base-field restriction F∞/F′ also preserves them. These are `AdmissibleExtension.sub` and `.res`.

Use `AdmissibleExtension`, `MuZero`, `muZero_iff_fg`, `AdmissibleExtension.sub`, `AdmissibleExtension.res`.

(Kakde §2.1, Definition 1, p. 4; §2.3, Definition 8 and Lemma 9, pp. 9–10.)

**Checks.**

- F_∞ = F_cyc: G = Γ ≅ ℤ_p and H = 1; μ = 0 is Iwasawa's μ = 0 for F(μ_p).
- F = ℚ(μ_p)^+, F_∞ the maximal abelian p-extension of F_cyc unramified outside p: admissible, and μ = 0 holds by Ferrero–Washington (Kakde's first example).
- F(μ_{p^∞})/F is not admissible: it is not totally real.
- A finite totally real extension is not admissible: it does not contain F_cyc.
- μ = 0 is a hypothesis, recorded separately; Ferrero–Washington proves it for abelian L/ℚ, and nothing more general is claimed.

*Needs:* §0.2; §1.6; PadicMeasuresIwasawaAlgebras §5.2 (compact topological Nakayama); ArithmeticGaloisDuality R02.2 (five-term transgression).

### 4.5 complex C(F_∞/F)

For an admissible F_∞/F, C(F_∞/F) = RHom(RΓ_ét(Spec 𝒪_{F_∞}[1/Σ], ℚ_p/ℤ_p), ℚ_p/ℤ_p) ≅ RHom(RΓ(Gal(F_Σ/F_∞), ℚ_p/ℤ_p), ℚ_p/ℤ_p), with H^{−1} = Gal(M_∞/F_∞), H⁰ = ℤ_p and H^i = 0 otherwise. It is a perfect complex of Λ(G)-modules, Λ(Gal(K/F)) ⊗^L_{Λ(G)} C(F_∞/F) ≅ C(K/F) for F ⊆ K ⊆ F_∞ with K/F Galois, and, under μ = 0, it is S-torsion, so it has a class [C(F_∞/F)] ∈ K₀(Λ(G), Λ(G)_S).

F∞/F is admissible with p odd and Σ containing p. The μ=0 condition is needed for S-acyclicity, not for defining the complex.

Prove `iwasawaComplex_perfect_withPTorsion` directly by the finite-projective arithmetic cochain model and its compact Shapiro descent. This is a separate target even when G has p-torsion; bounded, finitely generated cohomology alone would not imply it. Prove H²(Gal(FΣ/F∞),Q_p/Z_p)=0 in this cyclotomic totally real setting before asserting the two displayed cohomology groups. The map `iwasawaComplex_dualityTriangle` of §4.6 identifies the dual cochain model with the Tate-twisted compact-support model through the global duality comparison, including its real/local terms. Prove `iwasawaComplex_restrict`: restriction to Λ(G′), for G′ open in G, agrees with C(F∞/F∞^G′), with the same Σ-local terms.

Use `iwasawaComplex`, `iwasawaComplex_cohomology`, `iwasawaComplex_baseChange`, `iwasawaComplex_class`, `iwasawaComplex_restrict`.

(Kakde §2.3, p. 11, equation (1) and its cochain description; ArithmeticGaloisDuality D7.3/D7.5 for finite-projective cochains and duality.)

**Checks.**

- For F∞=F_cyc, with H^(−1)(C)=X and H⁰(C)=Z_p, the cohomological class is [C]=[Z_p]−[X]. Thus ∂ζ=−[C] has module expression [X]−[Z_p] whenever those module classes exist.
- H⁰(C(F_∞/F)) = ℤ_p with trivial action for every admissible F_∞/F.
- For G with p-torsion, X = Gal(M_∞/F_∞) can fail to have a finite projective resolution, so [X] need not be defined in K₀(Λ(G), Λ(G)_S), while [C(F_∞/F)] is.
- When G has elements of order p, X itself need not have finite projective dimension; the complex, not the module, is what has a class.

*Needs:* §4.4; §1.14; §1.6; ArithmeticGaloisDuality R02.4 (cohomological dimension)-bound; ArithmeticGaloisDuality R02.4 and D7.3/D7.5.

### 4.6 Equivariant compactly supported Iwasawa complexes

Let p be odd, F∞/F a Galois compact p-adic Lie extension containing the cyclotomic tower unramified outside a finite Σ containing p, ramified and archimedean places, and T a finite free Z_p Galois lattice unramified outside Σ. Define RΓ_Iw,c(F∞,T)=Rlim_L RΓ_c(O_(L,Σ),T), with corestriction transitions and left Λ(G)-action. At finite L, compact support is Cone(RΓ(O_(L,Σ),T)→⊕_(v∈Σ_L)RΓ(L_v,T))[−1], with the ordinary odd-primary real-place convention. Greenberg/Selmer local conditions replace the indicated local targets by their specified quotients or mapping fibres. The construction imports continuous Galois cochains, local conditions and the derived inverse limit; it adds the noncommutative coefficient action and comparison squares.

p odd; G=Gal(F∞/F) compact p-adic analytic; F∞ contains the cyclotomic tower; finite ramification set Σ as stated. T finite free, with continuous Galois action; local conditions and their transition maps are specified.

Construct the named comparison `iwasawaComplex_dualityTriangle` by applying compact Poitou–Tate to Q_p/Z_p and the dual lattice Z_p(1), retaining the involution on Λ, the dualizing shift [−3] and the real/local correction terms in the duality square. Its finite-level form is RΓ_c(O_{L,Σ},Z_p(1))≃RHom(RΓ(O_{L,Σ},Q_p/Z_p),Q_p/Z_p)[−3] with the odd-primary real-place convention. Passage to the tower uses restriction on discrete cochains dual to corestriction on compact cochains. This supplies the precise shift; it does not identify the unshifted compact-support complex with C.

Use `EquivariantCompactSupport.triangle` (The cone shifted by −1 fits in the stated global-to-local distinguished triangle); `EquivariantCompactSupport.action` (The conjugation/corestriction actions extend to the left completed group ring); `EquivariantCompactSupport.quotient` (For N closed normal with derived base-change hypotheses, Λ(G/N)⊗^L_Λ RΓ_Iw,c(F∞,T)≅RΓ_Iw,c(F∞^N,T), including the local terms); `EquivariantCompactSupport.openRestriction` (Restriction of scalars to Λ(U), U open in G, agrees with the complex over F∞^U); `EquivariantCompactSupport.duality` (The duality comparison with the totally real dual cochain complex includes its twist, shift and local correction triangle; no silent equality of these two complexes is allowed).

(Burns–Venjakob, §4, pp. 20–21; §6, pp. 28–36; Kakde, §2.3, p. 11, especially base change (1).)

**Checks.**

- For a cyclotomic abelian tower and the same T and local conditions, recover SelmerIwasawaCohomology Layer 3’s complex with identical cohomological degrees.
- At a finite real place and odd p, higher C₂-cohomology is zero by averaging; degree-zero invariants still occur in the compact-support triangle.
- For Σ enlarged by a finite prime, the difference is the corresponding local correction complex; dropping it changes the determinant.
- Taking N=1 gives the identity base-change map on both global and local terms.
- For a cyclotomic abelian tower and the same T and local conditions, recover SelmerIwasawaCohomology §§3.1–3.3’s complex with identical cohomological degrees.

*Needs:* ArithmeticGaloisDuality D7.3/D7.5/D7.7; SelmerIwasawaCohomology §§2.21–2.23, 3.1–3.3, 3.8–3.15; §§0.13–0.14, 4.5.

### 4.7 Perfection, torsion and derived arithmetic base change

Let p be odd and G have no element of order p. If the equivariant compact-support complex is bounded and all its cohomology groups are finitely generated over Λ(G), then it is perfect, by the finite-global-dimension theorem. Under the global/local Shapiro and duality hypotheses, quotient derived base change and open-subgroup restriction identify it with the corresponding arithmetic complexes and commute with the local triangles. It belongs to Σ_S exactly when its localized cohomology vanishes. In the totally real odd-primary μ=0 setting, the dual complex C has H^(−1)=X_Σ, H⁰=Z_p and Λ(H)-finite cohomology, hence is S-torsion. For G with p-torsion use the dedicated arithmetic perfect-model target of §4.5, independently of finite global dimension.

For the finite-global-dimension route: p odd, G compact p-adic analytic with no element of order p, bounded complex and finitely generated Λ(G)-cohomology; boundedness and finite generation must come from the stated arithmetic hypotheses, not from rational dimensions alone. For the comparisons: F∞/F unramified outside finite Σ containing p and infinity, finite-free continuous coefficient lattice and compatible perfect local conditions, with global and local Shapiro/duality supplied. For the final torsion clause: totally real admissible F∞/F and Kakde μ=0. For a group with p-torsion use §4.5’s specific cochain-perfection theorem.

(Kakde, §2.3, Lemma 9 and equation (1), pp. 10–11; Burns–Venjakob, §4, pp. 20–21; Lemma 6.2, pp. 29–30.)

**Checks.**

- A complex with a single Λ-free cohomology module is perfect but is not S-torsion.
- For the totally real cyclotomic specialization H=1, verify H^(−1)=X_Σ and H⁰=Z_p, rather than shifting both degrees by one.
- Derived specialization of a two-term resolution [Λ --T→ Λ] at T=0 has two nonzero terms; underived tensor of its cokernel loses Tor₁.

*Needs:* §4.6; §4.5; §1.12; §1.14; §0.10; SelmerIwasawaCohomology §§3.1–3.3, 3.8–3.15; ArithmeticGaloisDuality R02.4 and D7.3/D7.5.

### 4.8 Real-place correction at the prime two

At p=2, construct the real-place correction triangle using complete Tate cochains for Gal(C/R)=C₂, and compare it with the ordinary compact-support model. For the trivial Z₂ coefficient the real Tate cohomology has Z/2 in every even degree and zero in odd degrees, so this term is unbounded and is not a perfect complex. The comparison theorem must retain that unbounded term in the derived category. Under the additional hypothesis that there are no real places, the real correction is zero; finite-cochain perfectness and the specified local conditions can then be used. No odd-primary main theorem is extended to real 2-adic fields by this comparison.

p=2; specify the number field, integral coefficient lattice and real-place actions. A bounded perfect replacement is asserted only when the real correction vanishes under a stated hypothesis.

Name the real term `realTateCorrection`, the triangle `ordinary_to_modifiedCompactSupport` and its vanishing comparison `realCorrection_eq_zero_of_noRealPlaces`. Prove compatibility with finite-level restriction and corestriction.

(ArithmeticGaloisDuality R02.4 and D7.5; Burns–Venjakob §4, pp. 20–21 and §6, p. 28 for their odd-prime restriction.)

**Checks.**

- For trivial Z₂ over R, multiplication by 2 and zero alternate in the Tate resolution, giving Z/2 in every even degree.
- For a totally imaginary number field the direct sum of real correction terms is empty and hence zero.
- For odd p the positive-degree cohomology of C₂ vanishes by averaging; the compact-support degree-zero invariants still have to be included.
- For the trivial Z₂-module, H²(C₂,Z₂)=Z/2, whereas positive cohomology vanishes with Z_p coefficients at odd p.
- For a totally imaginary field there is no real-place correction sum.
- An alleged p=2 comparison that discards the real Tate term cannot preserve the compact-support triangle.

*Needs:* ArithmeticGaloisDuality R02.4/D7.5; §4.6.

### Examples

For the cyclotomic totally real complex, H^{−1}=X and H⁰=Z_p imply [C]=[Z_p]−[X] whenever both module classes exist. The normalized zeta boundary is therefore [X]−[Z_p]. With p-torsion in G only the perfect-complex class is used. For an ordinary elliptic curve, the Kummer local condition gives the Greenberg specialization, while the numerical vanishing input for the conductor-11 example is kept as a hypothesis of that example.

### Dependencies

Layers 0–3; ArithmeticGaloisDuality R02.4 and D7.3/D7.5/D7.7; SelmerIwasawaCohomology §§2.8–2.10, 2.21–2.23, 3.1–3.15. The totally real perfect-model theorem includes p-torsion and is separate from the finite-global-dimension route for general coefficient complexes. Modified real 2-primary terms remain in their own derived comparison.

## Layer 5: Normalized main conjectures

### 5.1 conjectural GL₂ p-adic L-function ℒ_E

For an Artin representation ρ of G realised over K_ρ, L(E, ρ, s) = Π_q P_q(E, ρ, q^{−s})^{−1} with P_q(E, ρ, T) = det(1 − Frob_q^{−1}T | (H¹_l(E) ⊗ V_{ρ,λ})^{I_q}); Ω_±(E) are the periods of the Néron differential over the ±-eigenvectors of complex conjugation on H₁(E(ℂ), ℤ); d^±(ρ) are the ±-dimensions of ρ; L_R(E, ρ, s) omits the Euler factors at R = {p} ∪ {q : ord_q(j_E) < 0}; p^{f_ρ} is the p-part of the conductor of ρ; 1 − a_pX + pX² = (1 − uX)(1 − wX) with u ∈ ℤ_p^×; e_p(ρ) is the local ε-factor at p. Assume (103): L(E, ρ, 1)/(Ω_+^{d⁺(ρ)}Ω_−^{d⁻(ρ)}) ∈ ℚ̄ and the analytic continuation of L(E, ρ, s) to s = 1. Let K(F_∞) be the maximal abelian extension of ℚ in F_∞ unramified at p (a finite extension), A the integers of the completion of K(F_∞) at a prime above p, Λ_A(G) = Λ(G) ⊗_{ℤ_p} A and S(A)* the corresponding Ore set, with Λ_A(G)_{S(A)*} = Λ(G)_{S*} ⊗ A. Conjecture 5.7 (p ≥ 5, good ordinary reduction) is the proposition that there is ℒ_E ∈ K₁(Λ_A(G)_{S(A)*}) with ℒ_E(ρ) ≠ ∞ and ℒ_E(ρ) = L_R(E, ρ, 1)/(Ω_+^{d⁺(ρ)}Ω_−^{d⁻(ρ)}) · e_p(ρ) · P_p(ρ̂, u^{−1})/P_p(ρ, w^{−1}) · u^{−f_ρ} for all Artin ρ (107).

This is a conjecture, conditional on the period algebraicity assertion (103) and analytic continuation. The coefficient enlargement A is the one prescribed in the Fukaya–Kato formulation discussed by CFKSV; representation evaluation extends to K₁(Λ_A(G)_{S(A)*}) by §§3.1–3.3.

 The interpolation proposition specifies no unique class in K₁ from evaluations alone; retain the kernel described in §3.13.

Use `twistedEllipticL`, `interpolationFactor`, `coefficientRingA`, `PAdicLFunctionConjecture`, `PAdicLFunctionConjecture.evaluation`.

(CFKSV, §5, the L-functions L(E, ρ, s), p. 202; CFKSV, §5, (103)–(106), p. 203; CFKSV, §5, Conjecture 5.7, p. 204.)

**Checks.**

- For trivial ρ, formula (107) includes (L(E,1)/Ω_+)·(1−u⁻¹)²·∏_(q∈R∖{p})P_q(E,1,q⁻¹). The primitive Mazur–Swinnerton-Dyer value is recovered only when the additional removed-factor product is 1; it is not silently dropped.
- 1 − a_pX + pX² = (1 − uX)(1 − wX) with uw = p and u + w = a_p.
- E = X₁(11), p = 5: A is the integers of the unramified extension of ℚ₅ of degree 5 (§5.4).
- For the zero virtual representation the rational interpolation factors multiply to 1; the existence of an element with all required values and boundary remains the asserted proposition.
- `PAdicLFunctionConjecture` occurs only as a stated hypothesis.
- The abelian specialisation (ρ a Dirichlet character of Γ-type) must recover the Mazur–Swinnerton-Dyer p-adic L-function with the same normalisation, not merely one with the same ideal.

*Needs:* §3.3; §1.7; §4.1.

### 5.2 GL₂ main conjecture

Assume p ≥ 5, good ordinary reduction and X(E/F_∞) ∈ 𝔐_H(G), and let ξ_E be a characteristic element of X(E/F_∞) (§2.12). Let i : K₁(Λ(G)_{S*}) → K₁(Λ_A(G)_{S(A)*}) be induced by the ring extension. Granted Conjecture 5.7, Conjecture 5.8 is the proposition that i(ξ_E) and ℒ_E have the same image in K₁(Λ_A(G)_{S(A)*})/(image of K₁(Λ_A(G))).

Existence (5.7) and the equality (5.8) are separate propositions; subsequent consequences retain these assumptions. For CM curves (G of dimension 2) CFKSV say 5.8 follows from the two-variable main conjecture of Rubin and Yager once X(E/F_∞) ∈ 𝔐_H(G) (Corollary 5.5); this is the CM specialization.

 Changing ξ_E by an integral K₁ image preserves the quotient equality, and the equality implies evaluation ratios in O-units wherever both values are nonzero.

Use `GL2MainConjecture`, `GL2MainConjecture.welldefined`, `GL2MainConjecture.evaluation`.

(CFKSV, §5, Conjecture 5.8, p. 204.)

**Checks.**

- Changing ξ_E by the image of u ∈ K₁(Λ(G)) changes every evaluation by a p-adic unit (|η(ρ)|_p = 1).
- E with CM: the conjecture reduces to Rubin–Yager given X(E/F_∞) ∈ 𝔐_H(G).
- For the zero virtual representation the rational interpolation factors multiply to 1; the existence of an element with all required values and boundary remains the asserted proposition.
- `GL2MainConjecture` occurs only as a stated hypothesis (§5.3).
- The ambiguity is exactly the image of K₁(Λ_A(G)); an equality in K₁(Λ_A(G)_{S(A)*}) itself is not asserted.

*Needs:* §5.1; §4.2; §2.12; §4.1.

### 5.3 Consequences of the main conjecture (Corollaries 5.9–5.10)

Assume CFKSV Conjecture 5.8, including the 𝔐_H(G) and interpolation hypotheses. For an Artin representation ρ and its contragredient ρ∨, the twisted Euler characteristic χ(G,tw_(ρ∨)X(E/F∞)) is finite if and only if L(E,ρ,1)≠0 (equivalently reindex the whole statement by ρ∨). When finite it equals |ℒ_E(ρ)|_p^(−[L:Q_p]), with ℒ_E(ρ) the complete period- and Euler-factor-normalized expression (107). The coefficient-field degree and every local factor are retained; no scalar equality with an unnormalized complex L-value is asserted.

The assertion is conditional on CFKSV Conjecture 5.8, with its 𝔐_H membership and interpolation assumptions. CFKSV note that Case 1 of Conjecture 4.8 would put ξ_E in the image of Λ(G)[1/p]^× ∩ Λ(G)_{S*}^×.

(CFKSV, §5, Corollaries 5.9–5.10, p. 204.)

**Checks.**

- At an Artin character, complex conjugation changes L(E,ρ,1) into L(E,ρ̂,1). Comparing the two readings requires the fixed complex and p-adic embeddings and the same period/local-factor conventions; no automatic p-adic equality follows from complex conjugation alone.

*Needs:* §5.2; §4.3; §3.7; §3.6; §3.10.

### 5.4 main conjecture for X₁(11) at p = 5: the data and the consistency check

For E = X₁(11) and p = 5 (continuing §3.9): K(F_∞) = ℚ(μ₁₁)⁺, 5 is inert in it, and A is the integers of the unramified extension of ℚ₅ of degree 5. For the two degree-4 Artin representations ρ₁, ρ₂: d⁺ = d⁻ = 2; f_{ρ₁} = 3, f_{ρ₂} = 5; P₅(ρ₁, X) = 1 − X, P₅(ρ₂, X) = 1; P₅(E, ρ₁, X) = 1 − X + 5X², P₅(E, ρ₂, X) = 1; P₁₁(E, ρ_i, X) = 1; |e₅(ρ₁)|₅ = 5^{−3/2}, |e₅(ρ₂)|₅ = 5^{−5/2}; 1 − a₅X + 5X² = 1 − X + 5X²; and L(E, ρ₁, 1)/(Ω₊Ω₋)² = −2²/(11²√5), L(E, ρ₂, 1)/(Ω₊Ω₋)² = −2⁶/(11²·5√5). Both L-values are nonzero, so with Proposition 3.11 Corollary 5.9 holds for ρ₁, ρ₂; the right-hand side of (107) has the 5-adic valuations predicted by (74), so Corollary 5.10 holds for them too.

Assume the displayed conductor, Euler-polynomial, period-normalized L-value and local ε absolute-value data. They are explicit inputs to this conditional interpolation check; existence of the full p-adic L-function is not concluded from two values.

(CFKSV, §5, Example, p. 205; CFKSV, §5, the L-values (115) and the conclusion, p. 206.)

**Checks.**

- The numerical consistency checks give −1/2+3/2+2=3 and −3/2+5/2=1; they do not validate the source L-values independently.

*Needs:* §5.3; §3.9.

### 5.5 main conjecture for totally real fields

For an admissible F_∞/F satisfying μ = 0, MC(F_∞/F) is the proposition: there is a unique ζ(F_∞/F) ∈ K′₁(Λ(G)_S) with ∂(ζ(F_∞/F)) = −[C(F_∞/F)] and ζ(F_∞/F)(ρκ_F^r) = L_Σ(ρ, 1 − r) for every Artin character ρ of G and every positive integer r divisible by [F_∞(μ_p) : F_∞], where κ_F is the p-adic cyclotomic character and L_Σ(ρ, 1 − r) the Klingen–Siegel value with the Euler factors at Σ removed.

μ = 0; p odd; F totally real. Kakde states it as Theorem 11 because he proves it (Layer 6).

Use `MainConjecture`, `IsZetaElement`, `isZetaElement_unique`, `mainConjecture_quotient`, `mainConjecture_open`.

(Kakde, §2.5, Theorem 11 (Main Conjecture), p. 13 (v3).)

**Checks.**

- F_∞ = F_cyc: MC is Wiles's theorem, with ζ the Deligne–Ribet pseudomeasure G₁(T)/T (Kakde §3).
- Enlarging Σ by a prime v multiplies ζ by the Euler factor at v and changes [C] accordingly (Remark 14).
- Stated in K₁(Λ(G)_S) instead of K′₁, uniqueness fails whenever SK₁(Λ(G)_S) ≠ 1.
- Replacing ∂ζ=−[C] by ∂ζ=+[C] reverses the boundary convention: ζ⁻¹ has that boundary and interpolates reciprocal values wherever nonzero.
- Uniqueness is in K′₁; in K₁ it can fail (Kakde, Remark 12). Kakde's Remark 12 also cites Burns for SK₁(Λ(G)_S) = ker ∂ ∩ ⋂_ρ ker(evaluation at ρ); that identity is not used here.

*Needs:* §3.11; §3.3; §2.15; §4.5; §4.4.

### 5.6 Localized zeta interpolation contract

For a specified perfect S-torsion arithmetic complex C, a specified sign ε∈{1,−1}, an allowed Artin/Tate-twist set A and normalized values I(ρ,r), define ZetaContract(C,ε,A,I) to be the set of ζ∈K₁(Λ_S) with ∂ζ=ε[C] and ev_(ρκ^r)(ζ)=I(ρ,r) wherever ordinary evaluation is defined. At exceptional zeros replace the last equality by the stated §7.4 formula, with its Bockstein trivialization. Existence means this set is nonempty; uniqueness means it has at most one element in the specified group, or only after passing to an explicitly named quotient. Periods, removed Euler factors and contragredients are part of I, not adjustable units.

C perfect and S-acyclic; its boundary sign is specified; evaluation maps are defined on the chosen domain. Interpolation data include coefficient field, periods, Frobenius convention, Artin dual and Euler factors.

 A contract descends through a group quotient of K₁ only when both its boundary and its evaluation functions kill the quotient kernel (`ZetaContract.quotient`).

Use `ZetaContract.boundary`, `ZetaContract.interpolate`, `ZetaContract.exists`, `ZetaContract.quotient`, `ZetaContract.leadingTerm`.

(CFKSV, Conjectures 5.7–5.8, pp. 201–204, equation (107); Kakde, §2.4, p. 12, and Theorem 11, p. 13 (v3); Burns–Venjakob, Conjecture 4.1, pp. 20–21; Theorems 5.5 and 6.7.)

**Checks.**

- For C=[Λ --T→ Λ], the positive-boundary characteristic lift is T, while the Burns–Venjakob characteristic map is T⁻¹ with negative boundary.
- Multiplying by a nontrivial integral unit preserves a boundary class but can change the normalized interpolation value; boundary equality does not imply the contract.
- If x≠1 belongs to the common kernel of boundary and every evaluation, then ζ and ζx meet the same contract; uniqueness needs an extra kernel theorem.
- Changing an Artin representation to its dual without changing the period/local-factor formula is a different contract.

*Needs:* §2.8; §3.3; §3.13; §4.7.

### 5.7 Norm, quotient and restriction of zeta contracts

Let a quotient G→G/N or an open subgroup U⊆G induce a compatible localization square; for U require Λ(G)_S finite projective over the chosen Λ(U)-localization. Quotient derived base change induces a map on relative K₀ and localized K₁; open-subgroup restriction of scalars induces the K-theory transfer. Their boundaries commute. Evaluation after quotient uses inflated representations; evaluation after transfer uses induced representations. Consequently the image of a zeta element satisfies the transported contract exactly when the arithmetic complex comparison and the normalized interpolation identities hold. For G^ab use N=[G,G] only when this quotient localization is admitted.

Canonical denominator/localization compatibility is proved for the chosen quotient or open subgroup. The arithmetic base-change/restriction and normalized L-function induction identities hold, with identical Euler-factor sets and periods.

(Kakde, §2.3, equation (1), p. 11; §4, pp. 17–30; Proposition 95, pp. 67–69; CFKSV, Theorem 3.10, pp. 183–184.)

**Checks.**

- The identity quotient and identity subgroup induce identity maps on contracts.
- For U=Γ⊆C₂×Γ, transfer evaluation at 1 equals the product of the 1 and sign evaluations.
- A chosen map that sends an S-denominator to a nonunit cannot define a map from Λ_S; the theorem must refuse it.

*Needs:* §5.6; §3.14; §4.7; GeneralAlgebraicKTheory §§6.3, 6.19, 8.1; AnalyticNumberTheory, Dedekind-zeta continuation and residue.

### 5.8 Normalized abelian determinant comparison

For an abelian extension in the conventions, compare the derived arithmetic complexes and their determinant trivializations with the normalized Deligne–Ribet function of §6.1. The target `abelianDeterminantComparison` fixes γ↦1+T, arithmetic/geometric Frobenius, the Artin dual, Σ-removal, auxiliary smoothing and period/epsilon factors. Prove that the specialized zeta element equals the actual normalized function, and deduce the corresponding characteristic-ideal and Fitting-ideal formulas. The all-prime abelian minus result in §6.36 has its own coefficient, μ and local hypotheses; its comparison is asserted only when the same perfect complex and localization are identified.

The two complexes are perfect and are related by the specified derived comparison; normalized determinant and period data are fixed. At p=2 the real-place comparison of §4.8 is additionally required.

Fix the Deligne–Ribet pseudomeasure, the involution and the distinguished denominator in the trivial-character component before comparing. An equality of characteristic ideals supplies only a unit ambiguity; the interpolation values choose a normalized representative. The target `abelianZeta_boundary` in §6.1 proves the normalized boundary, rather than treating the commutative ideal equality as a normalized zeta isomorphism.

(Kakde, §3, pp. 13–17, abelian comparison; Gambheera–Popescu, Theorem 6.30, pp. 33–34; §2.3, pp. 5–6.)

**Checks.**

- Multiplication of a power series by 1+p preserves its ideal and changes its value at T=0, detecting a comparison that proves only ideal equality.
- Under γ↦1+T, replacing γ by γ⁻¹ sends T to (1+T)⁻¹−1; the normalized formula must track this substitution.
- T-smoothing multiplies the L-element by the prescribed local factor; deleting it while retaining the same Selmer module fails the comparison.

*Needs:* PadicMeasuresIwasawaAlgebras §§4.2, 4.6, 5.1; SelmerIwasawaCohomology §§3.14, 4.21–4.23 for the conditional Tate dictionary; §§4.5, 5.5–5.6, 6.1.

### Examples

For the trivial elliptic Artin character the interpolation formula includes (1−u⁻¹)² and the product of every additional removed Euler factor; it is not just the primitive complex value divided by Ω₊. For the totally real cyclotomic trivial-character component, the denominator T contributes the class −[Z_p] to the zeta boundary. Multiplying a characteristic lift by an integral K₁ class preserves its boundary and changes its Artin values by p-adic units.

### Dependencies

Layers 2–4; the stated period, continuation and local-factor data; commutative determinant and Tate dictionaries. These are definitions of propositions and conditional consequences. The normalized abelian theorem used in the proof of the totally real conjecture is §6.1, not an assumed equality of unnormalized characteristic ideals.

## Layer 6: Congruences and the totally real main theorem

The arithmetic results in this layer have the odd-prime, totally real, admissible and μ=0 hypotheses of the conventions. The finite analytic value congruence in §6.24 does not require μ=0. In §§6.7–6.16 use the following dimension-one setting: G is pro-p, G=H⋊Γ with H finite, Z=Γ^{p^e} central, Ḡ=G/Z, and U_P is the inverse image of P≤Ḡ. Coefficients O are finite unramified extension rings of integers. Treat a finite product of such O componentwise, including separate abelianization factors in every exact sequence. Put R=O[[Z]] or the p-adic completion of R localized at its elements regular modulo p, as specified.

For §§6.17–6.30, allow Gal(F∞/F)=Δ×G with Δ cyclic of order prime to p and G as above. For P≤Ḡ put F_P=F∞^{Δ×U_P}, d_P=[F_P:F], r_P=[F_P:Q] and Σ_P the primes over Σ. The abelian zeta function ζ_P belongs to the extension with group Δ×U_P^ab and has the Deligne–Ribet normalization of §6.1. The finite-group trace ideals use Ḡ; Δ is split into unramified coefficient domains before the pro-p algebra argument. Central-localization, completion and quotient maps always preserve these coefficient components.

### 6.1 main conjecture for abelian × prime-to-p Galois groups

Let F_∞/F be admissible with μ = 0 and Gal(F_∞/F) = G × Δ, G abelian and Δ finite of order prime to p. Then MC(F_∞/F) holds, and K₁(Λ(G × Δ)) → K₁(Λ(G × Δ)_S) is injective. For G = H × Γ with H finite abelian, the Deligne–Ribet pseudomeasure ζ is a unit of Λ(G)_S (Lemma 15) with ∂ζ = −[C(F_∞/F)] (Theorem 16).

μ = 0; p odd; #Δ prime to p.

Construct `deligneRibetPseudomeasure`: for the abelian Galois group A unramified outside Σ, assemble the rational partial zeta values and Kummer congruences of §§6.19–6.22 into ζ∈Q(Λ(A)), with (1−a)ζ∈Λ(A) and the specified interpolation for every a∈A. Independence of a uses regularity of a chosen cyclotomic denominator. Prove `abelianMainConjecture_Wiles`: for each nontrivial finite abelian character ψ, the characteristic polynomial h_ψ(T) of γ on the ψ-part of the Σ-ramified Iwasawa module generates the same ideal as the ϖ-primitive numerator G_ψ^*(T) of its p-adic L-function; the trivial character has denominator T. Retain the μ factor until the standing μ=0 hypothesis removes it. Its proof needs the Hilbert Eisenstein congruence construction, its Galois/class-group comparison, the resulting characteristic-ideal divisibilities and their Euler-characteristic equality; name these `abelianMC_eisensteinDivisibility` and `abelianMC_reverseDivisibility` before deducing the equality. Finally prove `abelianZeta_boundary` by character detection, and use Brauer induction to construct p-adic Artin L-functions for the prime-to-p finite factor Δ, proving independence of the induction expression by interpolation. This is the abelian arithmetic theorem needed here, in addition to the already supplied Hilbert-form carriers.

(Kakde §3, pp. 14–17, Lemmas 15 and 17 and Theorems 16 and 18; Wiles, The Iwasawa conjecture for totally real fields, Theorems 1.3–1.4, Annals 131 (1990), pp. 493–540, as restated by Kakde on p. 14; Deligne–Ribet (0.4)–(0.5), pp. 231–232 and Theorem 8.2, pp. 278–279.)

**Checks.**

- For the cyclotomic trivial character over Q, the pseudomeasure has a T-denominator; treating it as an integral measure loses the −[Z_p] contribution to its boundary.
- For any locally constant test function ε, smoothing by the identity gives (1−1)ζ=0, consistent with Δ¹(ε,1−k)=0; it does not determine ζ.
- On a nontrivial finite abelian character component ψ, primitive h_ψ and G_ψ* generate the same ideal. Multiplying a representative by a unit preserves that ideal and changes interpolation; normalization is additional data.
- For the trivial cyclotomic character the normalized pseudomeasure has the denominator T; nontrivial character components have their prescribed numerator without this trivial-character pole.
- Deligne–Ribet construction and the normalized abelian main theorem are the targets of §§6.19–6.22 and this subsection. The μ=0 assumption controls the required localized unit property.

*Needs:* §§2.8–2.15, 3.11–3.14, 4.4–4.7, 5.5; §§6.19–6.22; PadicFamilies §§5.9a–5.10; ArithmeticGaloisRepresentations §2.7; generic Brauer induction.

### 6.2 Burns–Kato patching principle

Let 𝒞 be a family of pairs (U, V), U open in G and V closed normal in U with U/V admissible, and θ = (θ_{U,V}) : K′₁(Λ(G)) → ∏_𝒞 K′₁(Λ(U/V)), θ_S the same on the localisations, each θ_{U,V} the norm to U followed by the quotient map. Suppose each component localization map K′₁(Λ(U/V)) → K′₁(Λ(U/V)_S) is injective, θ is an isomorphism onto a subgroup Φ, θ_S lands in a subgroup Φ_S with Φ_S ∩ ∏ K′₁(Λ(U/V)) = Φ, MC holds for every F_∞^V/F_∞^U with (ζ_{U,V}) ∈ Φ_S, and every Artin character of G is a ℤ-combination of characters induced or inflated from the U/V. Then MC(F_∞/F) holds, and K′₁(Λ(G)) → K′₁(Λ(G)_S) is injective.

The hypotheses listed; μ = 0 for each subquotient.

(Kakde, §1, the observation of Burns and Kato, p. 3 (v3).)

**Checks.**

- If a component map is not injective, its integral preimage need not be unique. Component injectivity is an explicit patching hypothesis.
- For a singleton component with both maps the identity, patching returns the given abelian zeta element and preserves its boundary.

*Needs:* §5.5; §2.15; §4.5; §3.3.

### 6.3 Burns's reduction to one-dimensional extensions

Let F_∞/F be admissible with μ = 0. If MC holds for every F_∞^U/F with U ≤ H open pro-p and normal in G, and each K′₁(Λ(G/U)) injects into K′₁(Λ(G/U)_S), then MC(F_∞/F) holds.

μ = 0; the quotients G/U are one-dimensional.

(Kakde, §4.1, Theorem 21, p. 19 (v3).)

**Checks.**

- Injectivity on K₁′ is an explicit hypothesis of the reduction; equality of reduced determinant functions alone does not replace it.

*Needs:* §6.2; §3.11.

### 6.4 Reduction to ℚ_p-elementary Galois groups

Let F_∞/F be admissible, one-dimensional, with μ = 0. If MC holds, and K′₁(Λ(U)) → K′₁(Λ(U)_S) is injective, for every admissible subextension whose Galois group U is ℚ_p-elementary (U = P ⋊ Γ with a central open Γ^{p^r} and (P ⋊ Γ)/Γ^{p^r} an l-ℚ_p-elementary finite group C_n ⋊ P₁, the image of P₁ in (ℤ/n)^× lying in Gal(ℚ_p(μ_n)/ℚ_p)), then MC(F_∞/F) holds and K′₁(Λ(G)) injects into K′₁(Λ(G)_S).

G one-dimensional: G ≅ H ⋊ Γ with Γ^{p^e} central.

(Kakde, §4.2, Theorem 27, p. 21 (v3).)

**Checks.**

- The K₁ comparison uses Q_p-elementary subgroups with their coefficient action. A decomposition over ordinary elementary subgroups without that action does not supply the required integral K₁ isomorphism.

*Needs:* §6.2; §3.11; ClassicalArithmeticCompletion §7.63.

### 6.5 l-ℚ_p-elementary case, l ≠ p

If F_∞/F is admissible with μ = 0 and G = Gal(F_∞/F) is l-ℚ_p-elementary for a prime l ≠ p, then MC(F_∞/F) holds and K₁(Λ(G)) injects into K₁(Λ(G)_S). Here G ≅ Γ^{p^e} × Ḡ with Ḡ = C ⋊ P finite (Lemma 28); reducing to C a cyclic p-group and P of order prime to p, with C̄ = H⁰(P, C), P₁ = ker(P → Aut C) and G₁ = Γ × C × P₁, the map θ = (quotient, norm) : K₁(Λ(G)) → K₁(Λ(Γ × C̄ × P)) × K₁(Λ(G₁)) is an isomorphism onto Φ = {(x₀, x₁) : norm(x₀) = can(x₁), x₁ fixed by P} (Proposition 30).

l ≠ p; μ = 0.

(Kakde, §4.3, Theorem 33, p. 27 (v3).)

**Checks.**

- Finite Whitehead and integral-logarithm inputs have the precise statements in §§3.11 and 6.12, using Kakde’s public restatements of Oliver and Fukaya–Kato.
- If p does not divide |C|, the prime-to-p coefficient decomposition reduces the assertion to §6.1.

*Needs:* §6.2; §6.1; §3.11; ClassicalArithmeticCompletion §§7.46, 7.62.

### 6.6 Reduction of the p-ℚ_p-elementary case to Δ × pro-p

Let F_∞/F be admissible with μ = 0 and G p-ℚ_p-elementary, G/Γ^{p^e} = C_n ⋊ H_p with p ∤ n, U the preimage of H_p, and for χ ∈ Ĉ_n let U_χ = ker(U → Gal(L_χ/ℚ_p)), L_χ = ℚ_p(χ). Then K′₁(Λ(G)) ≅ ⊕_{χ∈C} K′₁(Λ_{𝒪_χ}(U_χ))^{U/U_χ} (Proposition 35), and if MC holds for each F_∞^{C_χ}/F_∞^{C_n ⋊ U_χ} with K′₁(Λ_{𝒪_χ}(U_χ)) → K′₁(Λ_{𝒪_χ}(U_χ)_S) injective, then MC(F_∞/F) holds and K′₁(Λ(G)) injects into K′₁(Λ(G)_S). This reduces the main conjecture to G = Δ × G_p with Δ cyclic of order prime to p and G_p one-dimensional pro-p.

G p-ℚ_p-elementary; μ = 0.

(Kakde, §4.4, Theorem 36, p. 29 (v3).)

**Checks.**

- This reduction leaves the pro-p dimension-one case, supplied by the congruence and zeta-tuple targets in this layer.

*Needs:* §6.2; §3.11; ClassicalArithmeticCompletion §§7.80, 7.109.

### 6.7 Iwasawa algebra of a one-dimensional pro-p group as a twisted group ring

In the standing dimension-one setting choose representatives hγ^a, 0≤a<p^e, of G/Z, where Z=Γ^(p^e) is central. The carry cocycle τ(hγ̄^a,h′γ̄^b)=γ^(p^e floor((a+b)/p^e)) gives an Iwasawa-specific isomorphism Λ_O(G)≅Λ_O(Z)[G/Z]^τ, using Tau Ceti’s generic twisted monoid algebra over the central commutative coefficient ring. The cocycle is symmetric and normalized at the identity; in general τ(g,g⁻¹)≠1, and the inverse of a basis element is τ(g,g⁻¹)⁻¹ times the inverse-labelled basis element. Changing the selected section gives the corresponding cohomologous presentation rather than literal equality of cocycles. Restriction gives Λ_O(U_P)≅Λ_O(Z)[P]^τ; U_P is abelian for cyclic P. For a coefficient domain put R=Λ_O(Z) and T=R∖pR. For a finite product R=∏_i R_i put T=∏_i(R_i∖pR_i), not R∖pR. With this central denominator set, both canonical localizations identify as Λ_O(G)_T=Λ_O(G)_S=Λ_O(Z)_(p)[G/Z]^τ, and their p-adic completions agree. For R=Λ_O(Z) or its localized p-adic completion the cocenter is the free R-module on Conj(G/Z), with the inherited carry convention.

The elementary exponent `carryExponent q a b=(a mod q+b mod q)/q` is defined for all natural q,a,b; its cocycle law requires q>0. The group presentation uses q=p^e and so always has q>0. At q=1 every exponent is zero. The coefficient ring is not required to be a field for the supplied twisted-algebra construction. For carryExponent, check carryExponent(9,1,8)=1, carryExponent(9,0,8)=0 and carryExponent(1,a,b)=0; reduction of a,b makes the same formulas valid for representatives outside [0,q). For q>0 prove `carryExponent_cocycle`: c(a,b)+c(a+b,d)=c(b,d)+c(a,b+d), where c=carryExponent q.

Use `iwasawaCarryCocycle`, `iwasawaAlgebra_equiv_twisted`, `twistingCocycle_symm`, `oreSetT`, `localizationT_equiv_localizationS`, `cocenter_equiv_conj`.

(Kakde, §5.1.2, p. 31, with Lemmas 37, 43, 45, 46 and Remark 38, pp. 31–33 (v3).)

**Checks.**

- τ ≡ 1 gives R[P]^1 = MonoidAlgebra R P.
- G = ℤ_p × C_p with e = 0: Z = Γ, Ḡ = C_p and τ ≡ 1, so Λ(G) = Λ(ℤ_p)[C_p].
- G = Γ = ℤ_p with Z = Γ^p (e = 1): Ḡ = ℤ/p and τ(γ^a, γ^b) = γ^p when a + b ≥ p (0 ≤ a, b < p), so γ̄^p = γ^p·1 and Λ(Γ) = Λ(Z)[X]/(X^p − γ^p).
- For G = ℤ_p and Z = 1 (no open Z), T = ℤ_p^× and Λ(G)_T = Λ(G) ≠ Λ(G)_S = Λ(G)_{(p)}; Lemma 37 needs Z open.
- For G/Z generated by γ̄ of order p^e>1, τ(γ̄,γ̄⁻¹)=γ^{p^e}≠1; multiplying the two basis elements requires this central carry.
- In R=Z_p[[T]]×Z_p[[T]], (1,0) and (0,1) both belong to R∖pR but their product is zero. The correct componentwise set excludes both.
- For Ḡ = 1 (G = Z ≅ ℤ_p) the construction is Λ_𝒪(ℤ_p) itself, and Conj Ḡ is a point.
- For trivial carry the imported twisted algebra agrees with MonoidAlgebra; no separate generic twisted group ring is owned here.

*Needs:* §§0.3, 1.1–1.11, 3.11–3.12; Tau Ceti `twistedMonoidAlgebra`, `TwistedMonoidAlgebra.of_mul_of`, `TwistedMonoidAlgebra.isUnit_of`.

### 6.8 maps θ^G and the congruence subgroups Φ^G, Φ^G_S

For P ≤ Ḡ, θ^G_P : K′₁(Λ_𝒪(G)) → K′₁(Λ_𝒪(U_P)) → K′₁(Λ_𝒪(U_P^ab)) = Λ_𝒪(U_P^ab)^× is the norm followed by abelianisation (just the norm when P is cyclic), θ^G = (θ^G_P)_{P≤Ḡ}, and θ^G_S, θ̂^G are the same maps on K′₁(Λ_𝒪(G)_S) and K′₁(Λ̂_𝒪(G)_S). The data: ver^{P′}_P : U_{P′}^ab → U_P^ab the transfer and ϕ : U_P → U_{P^p} the transfer for cyclic P, both extended to Iwasawa algebras with Frobenius on 𝒪 (Notations 40); for [P′,P′] ≤ P ≤ P′, the trace tr^{P′}_P, norm nr^{P′}_P and projection π^{P′}_P into Λ_𝒪(U_P/[U_{P′},U_{P′}]) (Definition 48); T_{P,P′} the image of x ↦ Σ_{g∈P′/P} g̃xg̃⁻¹ on Λ_𝒪(U_P), T_P = T_{P,N_ḠP} (Definition 49); and α_P(x) = x^p/∏_{k=0}^{p−1}ω_P^k(x) for nontrivial cyclic P, where ω_P is a fixed character of order p and ω_P(g) acts by g ↦ ω_P(g)g, and α_P(x) = x^p otherwise (Definition 47). Φ^G is the subgroup of ∏_{P≤Ḡ} Λ_𝒪(U_P^ab)^× of tuples (x_P) with M1: nr^{P′}_P(x_{P′}) = π^{P′}_P(x_P) whenever [P′,P′] ≤ P ≤ P′; M2: (x_P) is fixed by conjugation by G; M3: ver^{P′}_P(x_{P′}) ≡ x_P mod T_{P,P′} when [P′ : P] = p; M4: α_P(x_P) ≡ ∏_{P′} ϕ(α_{P′}(x_{P′})) mod pT_P for nontrivial cyclic P, over the cyclic P′ ≠ P with P′^p = P, and x_{1}^p ≡ ϕ(x_{1})∏_{P′} ϕ(α_{P′}(x_{P′})) mod pT_{1} over the nontrivial cyclic P′ with P′^p = 1. Φ^G_S and Φ̂^G_S impose the same conditions in ∏Λ_𝒪(U_P^ab)^×_S and ∏Λ̂_𝒪(U_P^ab)_S^× (Definition 51). For [P′ : P] = p and ω a nontrivial character of P′/P, nr^{P′}_P(x) = ∏_k ω^k(x) and tr^{P′}_P(x) = Σ_k ω^k(x) (Lemma 50).

For 𝒪 = 𝒪₁ ⊕ ⋯ ⊕ 𝒪_n the groups split as ⊕ Φ^G_{𝒪_i} (Remark 54), so 𝒪 is unramified in the proofs.

Use `thetaMap`, `alphaMap`, `traceIdeal`, `Phi`, `norm_eq_prod_twists`, `Phi_directSum`.

(Kakde, §5.2.2, Definition 51, p. 35 (v3).)

**Checks.**

- Ḡ = 1 (G = Z ≅ ℤ_p): C(Ḡ) = {1}, T_{1} = Λ_𝒪(Z), and M4 reads x^p ≡ ϕ(x) mod p, which every unit satisfies (Lemma 72), so Φ^G = Λ_𝒪(Z)^×.
- At p=2 the quadratic norm calculation for a+bg, g²=1, is a²−b². This is only a toy algebra test of M1, outside Kakde’s odd-prime theorem route; no Φ exactness or Suggested.lean computation at 2 is claimed.
- p = 2 and g² = c: the norm of a + bg is a² − cb² = (a + sb)(a − sb) when c = s². This is a toy norm check, outside the odd-prime exactness theorem.
- (x_{1}, x_{C₂}) = (1, g) is not in Φ^G: nr(g) = g·(−g) = −1 ≠ 1, so M1 fails. This is a toy norm check, outside the odd-prime exactness theorem.
- At p=2 the quadratic norm calculation for a+bg, g²=1, is a²−b². This is an algebra test of M1 outside the odd-prime theorem; nothing about Φ at p = 2 is claimed.
- p = 2 and g² = c: the norm of a + bg is a² − cb² = (a + sb)(a − sb) when c = s². This is a norm check outside the odd-prime exactness theorem.
- (x_{1}, x_{C₂}) = (1, g) is not in Φ^G: nr(g) = g·(−g) = −1 ≠ 1, so M1 fails. This is a norm check outside the odd-prime exactness theorem.
- The conditions are the multiplicative analogue of the pair condition of Proposition 30 (Remark 54); compare §6.5.

*Needs:* §6.7; §3.11; `MonoidHom.transfer`; `Algebra.norm`; `Algebra.trace`; `Abelianization`.

### 6.9 additive maps t^G_P, η_P, β^G and the group ψ^G_R

Let R = Λ_𝒪(Z) or Λ̂_𝒪(Z)_{(p)}. For P ≤ Ḡ, t^G_P : R[Conj Ḡ]^τ → R[P^ab]^τ is t^G_P([g]) = Σ_{x∈C(Ḡ,P)} {x⁻¹gx : x⁻¹gx ∈ P} over left coset representatives, independent of their choice. For cyclic P, η_P : R[P]^τ → R[P]^τ is the R-linear map with η_P(h) = h for generators h of P and 0 otherwise, For P≠1 this is η_P(x) = x − (1/p)Σ_k ω_P^k(x); for P=1 it is η_1=id. β^G_P = η_P ∘ t^G_P for cyclic P and t^G_P otherwise, and β^G_R = (β^G_P)_P (Definition 55). For cyclic P, T_{P,R} is the image of x ↦ Σ_{g∈W_ḠP} gxg⁻¹ on R[P]^τ, W_ḠP = N_ḠP/P (Definition 56). ψ^G_R ⊂ ∏_{P≤Ḡ} R[P^ab]^τ is the group of tuples (a_P) with A1: for [P′,P′] ≤ P ≤ P′ (and [P′,P′] ≠ P if P is nontrivial cyclic), tr^{P′}_P(a_{P′}) = π^{P′}_P(a_P) if P is not cyclic, η_P(tr^{P′}_P(a_{P′})) = π^{P′}_P(a_P) if P is cyclic and P′ is not, and tr^{P′}_P(a_{P′}) = 0 if P′ is cyclic and P<P′ (equality imposes no vanishing); A2: (a_P)_{P∈C(Ḡ)} is invariant under conjugation by Ḡ; A3: a_P ∈ T_{P,R} for every cyclic P (Definition 57). δ = Σ_{P cyclic} δ_P : ∏_P R[P^ab]^τ → R[Conj Ḡ]^τ[1/p], δ_P(x) = [x]/[Ḡ : P], is a left inverse of β^G_R (Definition 61, Lemma 62), and β^G_R lands in ψ^G_R (Lemma 60).

R[Conj Ḡ]^τ is only an R-module (Remark 42).

Use `tMap`, `etaGen`, `beta`, `Psi`, `delta`, `delta_comp_beta`, `beta_mem_Psi`.

(Kakde, §5.3, Definitions 55–57, p. 37 (v3).)

**Checks.**

- Ḡ = 1: β^G is the identity of R and ψ^G_R = T_{1,R} = R.
- Ḡ = C_p: C(Ḡ) = {1, Ḡ}, t^G_{1}(Σ r_g[g]) = p·r₁ and β^G_Ḡ(Σ r_g[g]) = Σ_{g≠1} r_g g; ψ^G_R = pR × {b : b has no identity coefficient} (A1 for {1} ≤ Ḡ forces p·b₁ = 0, A3 gives a_{1} ∈ pR), and β is the bijection onto it.
- For a nontrivial cyclic P, η_P(1)=0 and η_P(h)=h for a generator h. For P=1, the identity is a generator and η_1(1)=1. The averaging formula applies only in the nontrivial case.
- β^G_R is R-linear but not multiplicative, and ψ^G_R is only a group: for Ḡ = C_p, β^G_{1}(1) = p while β^G_{1}(1·1) ≠ β^G_{1}(1)² = p².
- For Ḡ=1, β=id and ψ=R: imposing cyclic trace-zero also at P=P′ would give ψ=0 and fail this test. For Ḡ=C_p, ψ=pR×{b with identity coefficient zero}, which is abstractly R^p.

*Needs:* §6.7; `ConjClasses`; `IsPrimitiveRoot.geom_sum_eq_zero`.

### 6.10 Kakde's additive theorem

β^G_R induces an isomorphism R[Conj Ḡ]^τ ≅ ψ^G_R (Theorem 58). Moreover id_{ℚ_p} ⊗ β^G_R : ℚ_p ⊗ R[Conj Ḡ]^τ → ∏_P ℚ_p ⊗ R[P^ab]^τ is injective with image the tuples satisfying A1 and A2, and if (id ⊗ β^G_R)(a) = (a_P) with a_P ∈ T_{P,R} for every cyclic P, then a ∈ R[Conj Ḡ]^τ and a_P ∈ R[P^ab]^τ for all P (Proposition 64).

(Kakde, §5.3.1, Theorem 58, p. 38 (v3).)

**Checks.**

- For Ḡ=C_p, the additive image is pR in the trivial component and arbitrary nonidentity coefficients in the C_p component, as computed in §6.9.
- For Ḡ=1, β is the identity. Additive injectivity in either case does not assert multiplicative K₁ injectivity.

*Needs:* §6.9; §6.7.

### 6.11 p-adic logarithm on relative K₁ of Iwasawa algebras

Let R = Λ̂_𝒪(Z)_{(p)} and J_R the Jacobson radical of the local ring R[Ḡ]^τ. Then J_R/pR[Ḡ]^τ is nilpotent (Lemma 65). For every ideal I ⊆ J_R, Log(1 + x) = Σ_{i≥1}(−1)^{i+1}x^i/i (x ∈ I) induces a unique homomorphism log_I : K₁(R[Ḡ]^τ, I) → (I/[R[Ḡ]^τ, I]) ⊗_{ℤ_p} ℚ_p; if I ⊆ ξR[Ḡ]^τ for a central ξ with ξ^p ∈ pξR[Ḡ]^τ, it lands in I/[R[Ḡ]^τ, I], and it is an isomorphism if moreover I^p ⊆ pIJ_R (Proposition 67). For Λ_𝒪(G), with G_n = G/Z^{p^n} and F = Frac 𝒪, the logarithms log : K₁(𝒪[G_n]) → F[Conj G_n] of Oliver kill torsion and pass to the limit, log : K′₁(Λ_𝒪(G)) → lim_n F[Conj G_n] = F⟦Z⟧[Conj Ḡ]^τ.

G pro-p, so R[Ḡ]^τ is local.

 Prove Log(uv)=Log(u)+Log(v) in the rational additive commutator quotient and naturality under the admitted group maps; these give `log_mul_mod_commutators` and `log_natural`.

Use `logRel`, `logRel_integral`, `logRel_bijective`, `log_mul_mod_commutators`, `logK1Prime`, `log_natural`.

(Kakde, §5.4, Proposition 67, p. 46 (v3).)

**Checks.**

- Ḡ = 1: [R, I] = 0 and log_I(1 + x) = log(1 + x) is the usual p-adic logarithm.
- G = ℤ_p × C_p, k = 𝔽_p: J_R/p is generated by g − 1, and (g − 1)^p = g^p − 1 = 0 in k[C_p].
- log is not injective: for G = ℤ_p × C_p the class of g has order p in K′₁(Λ(G)), so log(g) = 0 although g ≠ 1.
- The analogue over ℤ₂ with I = 2ℤ₂ fails I^p ⊆ pIJ_R (4ℤ₂ ⊄ 8ℤ₂), and log(1 + 2ℤ₂) = 4ℤ₂ ≠ 2ℤ₂; for odd p and I = pℤ_p the hypothesis holds and log : 1 + pℤ_p ≅ pℤ_p.
- Kakde notes (Remark 68) that for R = Λ̂_𝒪(Z)_{(p)} it is unclear whether log_{J_R} extends canonically to K₁(R[Ḡ]^τ); only log_{J_R} is used.

*Needs:* §6.7; AlgebraicKTheory A3 (relative K₁, relative elementary subgroup and radical-ideal comparison); ClassicalArithmeticCompletion §§7.46, 7.62.

### 6.12 integral logarithm on K′₁ of Iwasawa algebras

Let ϕ be the endomorphism of R (Frobenius on 𝒪, p-power map on Z), extended to R[Conj Ḡ]^τ by [g] ↦ [g^p] (Definition 69). Oliver–Taylor's integral logarithm L = log − (ϕ/p)log : K′₁(𝒪[G_n]) → 𝒪[Conj G_n] sits in an exact sequence 1 → μ(𝒪) × G_n^ab → K′₁(𝒪[G_n]) → 𝒪[Conj G_n] → G_n^ab → 1 with ω(Σ a_g g) = ∏ g^{tr_{𝒪/ℤ_p}(a_g)} (Oliver, Theorem 6.6); its inverse limit is L : K′₁(Λ_𝒪(G)) → Λ_𝒪(Z)[Conj Ḡ]^τ with 1 → μ(𝒪) × G^ab → K′₁(Λ_𝒪(G)) → Λ_𝒪(Z)[Conj Ḡ]^τ → G^ab → 1 exact (Definition 70). On the completed localisation, with J = ker(Λ̂_𝒪(G)_S → Λ̂_𝒪(Γ)_{(p)}) and the splitting Γ ↪ G, every x ∈ K′₁(Λ̂_𝒪(G)_S) is x = uy with u in the image of K₁(Λ̂_𝒪(G)_S, J) and y ∈ K′₁(Λ̂_𝒪(Γ)_{(p)}) (Lemma 71); y^p/ϕ(y) ≡ 1 mod p (Lemma 72); and L(uy) = log(u) − (ϕ/p)log(u) + (1/p)log(y^p/ϕ(y)) is a homomorphism K′₁(Λ̂_𝒪(G)_S) → Λ̂_𝒪(Z)_{(p)}[Conj Ḡ]^τ, independent of the splitting (Definition 73, Proposition 74).

G pro-p; 𝒪 unramified, so (p) is the maximal ideal of 𝒪.

The finite-group integral logarithm and its image computation are supplied by ClassicalArithmeticCompletion. Prove the additional kernel/cokernel identification `finiteIntegralLog_exact`, including the torsion-unit and abelianization maps, then the inverse-limit theorem `iwasawaIntegralLog_exact`. Surjectivity in an inverse limit is justified by the finite compatible quotients and compactness; it is not inferred from the existence of separate lifts. The last map O[Conj G]→G^ab is the coefficient-trace/abelianization map specified in Kakde, with O unramified and the Frobenius normalization retained. Prove `integralLog_compat`: the completed logarithm restricts to the integral one along K₁′(Λ_O(G))→K₁′(Λ̂_O(G)_S).

Use `frobeniusPhi`, `integralLog`, `omegaMap`, `integralLog_exact`, `integralLogCompleted`, `integralLogCompleted_indep`, `integralLog_compat`.

(Kakde §5.5, Definition 69, exact sequence (9) and Definition 70, p. 48; Definitions 73 and Proposition 74, pp. 49–51; ClassicalArithmeticCompletion §§7.46, 7.62.)

**Checks.**

- 𝒪 = ℤ_p and v scalar: p^n ∣ v^{p^n} − v^{p^{n−1}}; for p = 3, n = 3 checked on ℤ/27.
- Modulo p the completed localization of O[[Γ]] at (p) is F_q((T)), where ϕ(T)=T^p and coefficients undergo Frobenius. In particular T is invertible; F_q[[T]] would be the wrong residue ring.
- For G=Γ×C_p, L vanishes on G^ab. In particular L(γ)=0 although γ has infinite order. The whole kernel is not the torsion-unit subgroup.
- L ≠ log: for Ḡ = 1, 𝒪 = ℤ_p and x = 1 + p (p odd), L(x) = (1 − 1/p)log(1 + p) ≠ log(1 + p), because ϕ is trivial on ℤ_p.
- Kakde leaves the kernel and cokernel of L on K′₁(Λ̂_𝒪(G)_S) open (Remark 75, citing Ritter–Weiss); only the homomorphism is a target here.

*Needs:* ClassicalArithmeticCompletion §§7.46, 7.62, 7.80, 7.109; AlgebraicKTheory A2–A3; §§3.11, 6.7, 6.11.

### 6.13 additive and multiplicative sides: β^G(L(x)) through θ^G(x)

Define v^G_P on ∏_C F⟦Z⟧[C^ab] by v^G_P((x_C)) = Σ_{P′} ([P′ : P′^p]/[P : P′^p])ϕ(x_{P′}) over cyclic P′ with P′^p ≤ P when P is not cyclic, and Σ_{P′ ≠ P′^p = P} [P′ : P′^p]ϕ(x_{P′}) when P is cyclic (Definition 78); and u^G_P on ∏_C Λ_𝒪(U_C^ab)^× by u^G_P((x_C)) = ∏_{P′^p ≤ P} ϕ(x_{P′})^{|P′|} for noncyclic P and ∏_{P′ ≠ P′^p = P} ϕ(x_{P′}) for cyclic P, over cyclic P′ (Definition 80). Then for x ∈ K′₁(Λ_𝒪(G)): β^G_P(L(x)) = (1/(p²|P|))log(α_P(θ^G_P(x))^{p|P|}/u^G_P(α(θ^G(x)))) for noncyclic P; β^G_P(L(x)) = (1/p)log(α_P(θ^G_P(x))/u^G_P(α(θ^G(x)))) for nontrivial cyclic P; and β^G_{1}(L(x)) = (1/p)log(α_{1}(θ^G_{1}(x))/(ϕ(θ^G_{1}(x))u^G_{1}(α(θ^G(x))))) (Proposition 84); the same holds on K′₁(Λ̂_𝒪(G)_S). The logarithms are defined: α_P(θ^G_P(x))^{p|P|} ≡ u^G_P(α(θ^G(x))) mod p for noncyclic P (Lemma 82), and the cyclic quotients are ≡ 1 mod p (Remark 83).

(Kakde, §5.6, Proposition 84, p. 56 (v3); Schneider–Venjakob, Proposition 2.3 and proof, pp. 11–12 (v1).)

**Checks.**

- At Ḡ = 1 both sides are (1/p)log(x^p/ϕ(x)).

*Needs:* §6.12; §6.11; §6.9; §6.8.

### 6.14 multiplicative sequence for Φ^G

θ^G(K′₁(Λ_𝒪(G))) ⊆ Φ^G and θ̂^G_S(K′₁(Λ̂_𝒪(G)_S)) ⊆ Φ̂^G_S (Lemma 85). The map μ(𝒪) × G^ab → ∏_P Λ_𝒪(U_P^ab)^×, (ζ,g)↦(ζ^[G:U_P]·ver^G_(U_P)(g))_P, with the scalar norm exponent and the group transfer in each component, is injective and commutes with θ^G (Lemma 86). There is a surjection ω : ψ^G → G^ab, ω_ψ=ω_A∘δ, using the additive inverse δ:ψ^G≅Λ_O(Z)[Conj Ḡ]^τ, with ω ∘ β^G = ω (Lemma 87). The map ℒ = (ℒ_P) : Φ^G → ψ^G, with ℒ_P((x_C)) given by the right-hand sides of Proposition 84 with x_C in place of θ^G_C(x), sits in an exact sequence 1 → μ(𝒪) × G^ab → Φ^G → ψ^G → G^ab → 1 (Lemma 88).

(Kakde, §5.7, Lemmas 85–89, pp.58–65 (v3); Schneider–Venjakob, After Kakde, §4, Lemmas 4.7–4.9, pp. 26–30.)

**Checks.**

- For p=3 and O unramified of degree 2, let ζ have Teichmüller order 8. A rank-3 norm sends ζ to ζ³≠ζ; the scalar embedding cannot be the identity in every component.
- For G=Γ, Z=Γ^p and a=z=γ^p, β_(C_p)(a)=0 while ω_A(a)=z. Recovering ω from only a_(C_p) is false; ω_Aδ retains it.
- The kernel contains γ of infinite order. For O=∏_i O_i take ∏_i(μ(O_i)×G^ab), not μ(O)×a single G^ab.
- At a noncyclic P, ker ℒ gives a power of x_P in μ(O)×U_P^ab; it need not make x_P torsion. The torsion-free quotient supplied by the integral logarithm is the inference required here.

*Needs:* §6.8; §6.13; §6.10; §6.12; ClassicalArithmeticCompletion §§7.46, 7.62.

### 6.15 Kakde's congruence description of K′₁

Let G be a one-dimensional pro-p p-adic Lie group with G/H ≅ ℤ_p, Z ≤ G central open pro-cyclic, Ḡ = G/Z, and 𝒪 the integers of a finite unramified extension of ℚ_p or a finite direct sum of such rings. Then θ^G induces an isomorphism K′₁(Λ_𝒪(G)) ≅ Φ^G (Theorem 52); θ^G_S maps K′₁(Λ_𝒪(G)_S) into Φ^G_S, and Φ^G_S ∩ ∏_{P≤Ḡ} Λ_𝒪(U_P^ab)^× = θ^G(K′₁(Λ_𝒪(G))) (Theorem 53).

(Kakde, §5.2.3, Theorems 52–53, p. 36 (v3); proofs p. 65.)

**Checks.**

- The theorem is for G pro-p of dimension one and 𝒪 unramified. The general one-dimensional G reaches this case through §6.6, with 𝒪 = ℤ_p[Δ] ≅ ⊕_χ 𝒪_χ.
- For Ḡ = 1, Φ^G = Λ_𝒪(Z)^× = K′₁(Λ_𝒪(Z)).

*Needs:* §6.14; §6.10; §6.13; §6.12; §6.8; §3.11.

### 6.16 K′₁(Λ_𝒪(G)) injects into K′₁(Λ_𝒪(G)_S)

Let G be a compact p-adic Lie group with a quotient G/H ≅ ℤ_p, and 𝒪 the ring of integers of a finite unramified extension of ℚ_p. Then the map K′₁(Λ_𝒪(G)) → K′₁(Λ_𝒪(G)_S) is injective (Corollary 90).

G compact p-adic Lie with G/H ≅ ℤ_p; 𝒪 unramified.

(Kakde, §5.7, Corollary 90, p. 65 (v3).)

**Checks.**

- The printed Z_p-coefficient reduction and the additional reduction over an unramified O are separate obligations. A Z_p-only argument does not establish the general coefficient assertion.

*Needs:* §6.15; §6.4; §6.5; §6.6; §3.11; §1.7.

### 6.17 main conjecture as congruences between abelian zeta functions

Let F_∞/F be admissible with μ = 0 and Gal(F_∞/F) = Δ × G, with Δ cyclic of order prime to p and G a one-dimensional pro-p p-adic Lie group; fix Z ≤ G central open pro-cyclic, Ḡ = G/Z. For P ≤ Ḡ put F_P = F_∞^{Δ×U_P} and K_P = F_∞^{[U_P,U_P]}, so that Gal(K_P/F_P) = Δ × U_P^ab, and let ζ_P ∈ Λ(Δ × U_P^ab)^×_S be the Deligne–Ribet (Cassou-Noguès, Barsky) p-adic zeta function of K_P/F_P (Notations 91). Then MC(F_∞/F) holds if and only if (ζ_P)_P ∈ Φ^G_S, where Φ^G_S = Φ^G_{ℤ_p[Δ],S} (Proposition 93). Every irreducible Artin representation ρ of G has a one-dimensional χ inflated from Γ with ρ ⊗ χ trivial on Z (Lemma 92).

F_∞/F admissible, μ = 0, p odd; Gal(F_∞/F) = Δ × G as stated.

(Kakde, §6.1, Proposition 93, pp. 66–67 (v3).)

**Checks.**

- The criterion requires both implications: a normalized zeta element gives its abelian tuple, and an admitted tuple is patched with the arithmetic boundary.
- The M1–M2, M3 and M4 inputs are respectively §§6.18, 6.25 and 6.28. Omitting one leaves the tuple-membership criterion unproved.

*Needs:* §6.15; §6.2; §6.1; §5.5; §2.15; §3.3; §4.5; §§6.1, 6.19–6.22; PadicFamilies §§5.9a–5.10; AnalyticNumberTheory, Dedekind-zeta continuation and residue.

### 6.18 abelian zeta functions satisfy M1 and M2

In the setting of §6.17, the tuple (ζ_P)_P satisfies M1: nr^{P′}_P(ζ_{P′}) = π^{P′}_P(ζ_P) in Λ(Δ × U_P/[U_{P′}, U_{P′}])_S whenever [P′, P′] ≤ P ≤ P′; and M2: gζ_Pg^{−1} = ζ_{gPg^{−1}} in Λ(Δ × U_{gPg^{−1}}^ab)_S for every g ∈ G (Proposition 95).

As in §6.17.

(Kakde, §6.1, Proposition 95, pp. 67–68 (v3).)

**Checks.**

- M1 for identical subgroups is the identity norm; M2 for the identity conjugation fixes the component.
- M3 is an index-p instance of the full Möbius congruence. M4 additionally uses the completed construction and boundary-preserving canonical descent.

*Needs:* §6.17; §6.8; §6.1; §3.3; §§6.1, 6.19–6.22; PadicFamilies §§5.9a–5.10; AnalyticNumberTheory, Dedekind-zeta continuation and residue.

### 6.19 Partial zeta values and the smoothed values Δ^u_P

For j ≥ 0 and a coset x of Z^{p^j} in Δ × U_P^ab, δ(x) is its characteristic function and ζ(δ(x), s) = Σ_𝔞 δ(x)(g_𝔞)N𝔞^{−s} (Re s > 1, over integral ideals 𝔞 of F_P prime to Σ_P, g_𝔞 the Artin symbol) is the partial zeta function; by Klingen and Siegel it continues meromorphically with a simple pole at s = 1 only, and ζ(δ(x), 1 − k) ∈ ℚ for even k ≥ 2. For a locally constant ε = Σ ε(x)δ(x) with values in a ℚ-vector space V, L_{Σ_P}(ε, 1 − k) = Σ_x ε(x)ζ(δ(x), 1 − k) ∈ V (15); for a degree-one Artin character it is the Σ_P-truncated L-value. For ε locally constant ℚ_p-valued, u ∈ U_P^ab and k divisible by [F_∞(μ_p) : F_∞], Δ^u_P(ε, 1 − k) = L_{Σ_P}(ε, 1 − k) − κ(u)^k L_{Σ_P}(ε_u, 1 − k) with ε_u(g) = ε(ug) (16). These values are invariant under conjugation: Δ^u_P(δ(y), 1 − k) = Δ^u_{gPg^{−1}}(δ(gyg^{−1}), 1 − k) for u ∈ Z, g ∈ G (Lemma 103).

Prove `partialZeta_rational` by the Hilbert Eisenstein rational q-expansion comparison, and `deligneRibet_kummerCongruences`: if a finite combination Σ_k ε_k(x)N(x)^{k−1} takes values in Z_p on prime-to-Σ ideals, then Σ_k Δ_c(ε_k,1−k)∈Z_p for every c. The coefficient-refinement and character formulas then define these values over a Q-vector space. Construct the associated bounded Z_p-measures from these congruences and prove their weight-change formula, giving the pseudomeasure of §6.1. The value map is Q-linear in ε and independent of refinement of the finite coset partition (`sigmaLValue_linear`).

Use `partialZeta`, `sigmaLValue`, `sigmaLValue_linear`, `smoothedValue`, `smoothedValue_conj`, `sigmaLValue_character`.

(Kakde §6.3, (15)–(16), pp. 69–70, and Lemma 103, p. 73; Deligne–Ribet (0.4)–(0.5), pp. 231–232 and Theorem 8.2, pp. 278–279.)

**Checks.**

- F_P = ℚ, Σ = {3}, ε = 1 and k = 2: L_Σ(1, −1) = (1 − 3)ζ(−1) = (−2)(−1/12) = 1/6.
- ε ≡ 0 gives L_{Σ_P}(0, 1 − k) = 0.
- u = 1: κ(1) = 1 and ε_1 = ε, so Δ^1_P(ε, 1 − k) = 0; the smoothing needs u of infinite order.
- For F_P = ℚ and odd k ≥ 3, ζ(1 − k) = 0; the construction uses k divisible by [F_∞(μ_p) : F_∞], which is even.
- The rational-value map must respect refinement of coset partitions and Q-linearity in ε; these are the explicit partial-zeta and rationality interfaces of this subsection.

*Needs:* PadicFamilies §§5.9a–5.10; ArithmeticGaloisRepresentations §2.7; §6.7; §6.22 (Eisenstein coefficients and cusp formulas); compact measure/completed-algebra comparison.

### 6.20 Finite-level approximations of the abelian zeta functions

Let f be such that κ^{p−1}(Z) = 1 + p^fℤ_p. For P normal in P′ let T_{P,P′,j} be the image of x ↦ Σ_{g∈P′/P} gxg^{−1} on ℤ_p[Δ × U_P^ab/Z^{p^j}]/(p^{f+j}), T_{P,j} = T_{P,N_ḠP,j} (Definition 100). Then Λ(Δ × U_P^ab) ≅ lim_j ℤ_p[Δ × U_P^ab/Z^{p^j}]/(p^{f+j}), and T_{P,P′} ≅ lim_j T_{P,P′,j} (Lemma 101). For u ∈ U_P^ab, j ≥ 0 and k divisible by [F_∞(μ_p) : F_∞], the image of (1 − u)ζ_P in ℤ_p[Δ × U_P^ab/Z^{p^j}]/(p^{f+j}) is Σ_x Δ^u_P(δ(x), 1 − k)κ(x)^{−k}x mod p^{f+j}; in particular the limit does not depend on k (Proposition 102, attributed to Ritter–Weiss).

(Kakde, §6.4, Definition 100, Lemma 101 and Proposition 102, pp. 70–73 (v3).)

**Checks.**

- The finite-level congruence uses the precise Deligne–Ribet Kummer congruences constructed in §6.19; a value interpolation assertion alone does not imply integral coefficients.
- For u=1 both sides vanish: (1−1)ζ_P=0 and Δ¹_P=0.

*Needs:* §6.19; §6.1 (pseudomeasure construction only); compactness of finite-level trace images.

### 6.21 Smoothed Möbius values and trace ideals

In the finite-extension setting of §6.24, let λ̃_F=2^{−[F:Q]}λ_{F,S}. Fix g first. If its smoothed value congruences hold for that same g for every even locally constant ε, then the image of s_g=Σ_F μ_Σ(Σ_F) ver_F^L((1−g_F)λ̃_F) in Z_p[[H_S^+]] lies in tr_Σ(Z_p[[H_S^+]]). Here H_S^+ is the maximal totally real quotient of H_S. The stabilizer-modulus congruences imply the coefficientwise trace-ideal condition.

p odd; finite totally real p-extension L/K; same S, transfers, Möbius coefficients, normalization and g_F as in §6.24. The Deligne–Ribet finite-level approximation of each smoothed pseudomeasure holds. The quantifier is one fixed g for all ε. The conductor-dependent construction in §6.24 by itself gives no such uniform g.

(Ritter–Weiss, Congruences II, §1, Proposition 4 and its full coefficient argument, pp.5–6.)

**Checks.**

- For Σ=C_p and a fixed y, trace membership demands coefficient divisibility by p; for a free orbit it only demands constant coefficients on the orbit.
- The factor 2^{−[F:Q]} is retained until its Möbius-weighted removal in §6.25; it is not removed termwise by an unsupported equality.
- The statements ∀ε ∃g and ∃g ∀ε cannot be interchanged. Compactness of trace preimages applies after g has been fixed; it does not supply a common g from conductor-dependent choices.

*Needs:* §6.20; §6.19.

### 6.22 Hilbert Eisenstein series, restriction along the diagonal and the q-expansion principle

For L totally real of degree r, Hilbert modular forms of weight k on Γ₀₀(𝔣) have standard q-expansions c(0, f) + Σ_μ c(μ, f)q^μ_L over totally positive μ ∈ 𝒪_L (§6.6). For L′ ⊇ L of relative degree r′=[L′:L], restriction along the diagonal R_{L′/L} maps M_k(Γ₀₀(𝔣𝒪_{L′})) to M_{r′k}(Γ₀₀(𝔣)) with c(μ, R_{L′/L}f) = Σ_{tr(ν)=μ} c(ν, f) (§6.7), and its constant term at the cusp of α is that of f at α^* (Lemma 109). For β ∈ 𝒪_L totally positive with 𝔣 ⊆ β𝒪_L, the Hecke operator U_β has c(μ, f|U_β) = c(μβ, f) (Lemma 110). Deligne–Ribet: for locally constant ε on Gal(L_Σ/L) and even k ≥ 2 there is G_{k,ε} ∈ M_k(Γ₀₀(𝔣)) with q-expansion 2^{−r}L(ε, 1 − k) + Σ_μ(Σ_{𝔞∋μ} ε(g_𝔞)N𝔞^{k−1})q^μ and constant term N^k((α))2^{−r}L(ε_g, 1 − k) at the cusp of α (Proposition 111); the q-expansion principle: if f ∈ M_k(Γ₀₀(𝔣), ℚ) has non-constant standard coefficients in ℤ_(p), then c(0, f) − N(α_p)^{−k}c(0, α, f) ∈ ℤ_p (§6.11); hence c(0, G_{k,ε}) − N(α_p)^{−k}c(0, α, G_{k,ε}) = 2^{−r}Δ^u(ε, 1 − k) when α has Artin symbol u (Remark 112).

L totally real; Σ a finite set of finite primes containing those above p; 𝔣 an integral ideal supported on Σ.

Use the supplied Hilbert modular forms and integral q-expansion principle. Prove the additional targets `hilbertRestriction_qExpansion`, `hilbertU_qExpansion`, `deligneRibetEisenstein_qExpansion` and `hilbertCusp_constantDifference` with the displayed weight, trace, norm and cusp conventions; these are the precise extra formulas needed by the value congruence.

(Kakde, §§6.6–6.11, Lemmas 109–110, Proposition 111 and Remark 112, pp. 77–81 (v3).)

**Checks.**

- For a field extension of degree 1, diagonal restriction is the identity and preserves both weight and every q-coefficient.
- For U_1, the formula c(μ,f|U_1)=c(μ,f) is the identity. U_β selects the coefficient at μβ, with no extra norm factor in this convention.
- For L=Q, ε=1 and k=2, the Eisenstein constant is (1/2)ζ(−1)=−1/24 before Σ-truncation; at the p=3-truncated value it is (1/2)(1−3)ζ(−1)=1/12. This checks both 2^{−r} and Euler truncation.
- For L′ = L, R_{L′/L} is the identity and c(μ, f) is unchanged; for β = 1, U_β is the identity.
- The weight-changing restriction and the cusp/Eisenstein formulas are additional targets over PadicFamilies’ supplied Hilbert-form carriers.

*Needs:* PadicFamilies §§5.9a–5.10; §6.19 (analytic partial L-functions only); arithmetic reciprocity.

### 6.23 transfer into a maximal cyclic subgroup misses its generators

Let P ∈ C(Ḡ) be such that no P′ ∈ C(Ḡ) has P′^p = P, and let P ⊊ N ≤ N_ḠP. Then the image of the transfer ver : N^ab → P is a proper subgroup of P (Lemma 114).

Ḡ a finite p-group.

(Kakde, §6.12, Lemma 114, pp. 82–83 (v3).)

**Checks.**

- For Ḡ = C_{p²} × C_p and P = C_{p²} × 0 (maximal cyclic), N = Ḡ: ver(N^ab) ⊆ pC_{p²}, a proper subgroup.
- Kakde uses the lemma in Proposition 115: nontrivial stabilizers kill δ(y)(g_𝔟).

*Needs:* `MonoidHom.transfer`.

### 6.24 Möbius-weighted Hilbert Eisenstein value congruences

Let L/K be a finite p-extension of totally real number fields, Σ=Gal(L/K), and S contain p and every ramified finite prime. Put Σ_F=Gal(L/F), g_F=ver_K^F(g), and use the smoothed values of 2^{−[F:Q]}ζ_{F,S}, denoted by Δ̃. For every positive even k and even locally constant Z_(p)-valued ε on H_S=Gal(L_S/L), the special g constructed below satisfies Σ_{K⊆F⊆L} μ_Σ(Σ_F) Δ̃_{g_F}(1−|Σ_F|k, ε∘ver_F^L) ∈ |St_Σ(ε)| Z_(p). Here μ_Σ(V)=μ(1,V) is the subgroup-poset Möbius coefficient and even means factoring through the maximal totally real quotient.

p odd; L/K and S as in the statement. No μ=0 hypothesis is needed for this finite analytic congruence. Choose a common conductor ideal f supported on S, divisible by |Σ|, for all ε∘ver_F^L. Choose a positive rational integer f₀∈f, and the rational finite idèle α with components 1+f₀ at primes dividing f₀ and 1 elsewhere. Let γ=α_K and g=Art_K(γ). Then γ and γ⁻¹ lie in 1+f̂ and N_F(g_F)=(1+f₀)^{−[F:Q]}, so every g_F has nontrivial cyclotomic image.

The quantifiers are ∀ε ∀k ∃g, with g constructed from the common conductor for those data. The fixed-g-for-all-ε implication in §6.21 is a separate statement. The passage to a pseudomeasure trace congruence uses the full Möbius theorem of §6.25 and the independent completed construction; an unweighted sum over cyclic overgroups does not provide it.

(Ritter–Weiss, Congruences II, Propositions 5 and 9, pp.6–9; Lemma 10 and conclusion, pp.10–11 (v3); Kakde, Propositions 115–117, pp.83–86; Proposition 98, (12), p.69 (v3).)

**Checks.**

- For Σ=C_p×C_p the coefficients are 1 at 1, −1 at each of the p+1 lines, and p at Σ. At p=3 and r=2 the stabilizer polynomial is 2^9−4·2^3+3·2=486, divisible by 9. Replacing the full Möbius sum by an unweighted sum of cyclic overgroups fails this test.
- For a proper normalizer N in a larger finite quotient, restriction to its fixed field multiplies a weight by [N:P], not [Ḡ:P]. The special-cusp norm identity must use the same bottom field as that restriction.
- For the full stabilizer P=1 no cancellation Σμ=0 is asserted: divisibility modulo 1 is enough. For P≠1 retain all fixed pairs, including β rational and b=O_L.

*Needs:* §6.22; §6.19.

### 6.25 Analytic Möbius and index-p transfer congruences

Let G be a one-dimensional p-elementary totally real Galois group, A an abelian normal open subgroup containing its prime-to-p cyclic factor, and Q=G/A. In the central localization Λ•A, Σ_{A≤U≤G} μ_Q(U/A) ver_A^{U^ab}(ζ_{U^ab}) belongs to tr_Q(Λ•A), with the same S-truncation on every abelian pseudomeasure. For |Q|=p this is the index-p transfer congruence M3. In the finite-over-cyclotomic pro-p setting, central localization by central elements regular modulo p agrees with the canonical S-localization; unramified coefficient factors are treated componentwise.

p odd; totally real extension finite over the cyclotomic tower; S contains p and all ramified primes. Use abelian pseudomeasures with the Deligne–Ribet normalization; μ=0 is required when viewing them as units in the completed/canonical main-conjecture construction, not for the finite analytic value congruence.

Prove the additional uniform smoothing assertion `rwUniformSmoothing`: for the finite L/K and S of §6.24, there is a single g∈G_S with nontrivial cyclotomic image such that the full smoothed sum s_g of §6.21 lies in the Σ-trace ideal, hence its value congruences hold for every even locally constant ε. The same g must work for all conductors. The per-conductor idèle construction does not prove this assertion; it is the uniform analytic assertion in the cited Ritter–Weiss theorem and is a separate proof obligation in that analytic route.

(Ritter–Weiss, Proposition 6, p.3; §3, Lemma c and (3.1)–(3.3), pp.10–12; Ritter–Weiss, Congruences II, Theorem, p.2, and concluding Remark, p.11.)

**Checks.**

- For Q=C_p this gives ζ_A−ver_A^{G^ab}(ζ_{G^ab}) in tr_Q, with the sign determined by μ_Q(Q)=−1.
- For the cyclic-overgroup negative control, take Ḡ=C_{p²}×C_p, P=pC_{p²}×0. There are p cyclic P′ with P′^p=P, and W_Ḡ(P) has order p² acting trivially. M3 implies ζ_P≡φ(ζ_{P′}) modulo p for each P′, whereas an unweighted cyclic-overgroup sum would imply ζ_P≡pζ_P=0 modulo p, contradicting that ζ_P is a unit. The corrected full Möbius sum preserves the missing multiplicity.
- The uniform existence assertion is ∃g ∀ε, not ∀ε ∃g; the conductor-dependent calculation of §6.24 proves only the latter.
- Quantifier test. The g that work form a closed subgroup: s_(gh)=s_g+ver_K^L(g)s_h, because ver_F^L is a ring map and ver_K^L(g) is Σ-invariant. Proposition 5's element for the conductor 𝔣 has trivial image at that level, and its norm tends to 1 as 𝔣 grows. So no fixed g follows from the per-conductor construction by compactness.

*Needs:* §6.21; §6.24; §6.8.

### 6.26 auxiliary extension F̃_∞ and the trace-ideal bound

Choose a prime l ≡ 1 mod |Ḡ| with ℚ(μ_l) ∩ F_∞ = ℚ, let K ⊆ ℚ(μ_l) have degree |Ḡ| over ℚ, and put F̃ = KF, F̃_∞ = F̃F_∞. Then Gal(F̃_∞/F) = Δ × G̃ with G̃=H̃ × G and H̃ cyclic of order |Ḡ|. Set Ḡ̃=G̃/Z≅H̃ × Ḡ, a finite p-group. For P ∈ C(Ḡ̃) let i_P = max{[P′ : P] : P ⊆ P′ ∈ C(Ḡ̃)}, and take U_P as its inverse image in G̃. If P ≠ {1} then T_P ⊆ p·i_P²·Λ(Δ × U_P), and T_{1} = |Ḡ̃|Λ(Δ × Z); the same holds for T_{P,S} and T̂_P (Lemma 118). The main conjecture for F̃_∞/F implies it for F_∞/F.

(Kakde, §§6.13.1–6.13.2, Lemma 118, pp. 86–87 (v3).)

**Checks.**

- Arithmetic base change for C along G̃→G is the comparison of §§4.5–4.7; applying just an underived module quotient loses Tor terms.
- For Ḡ=1, H̃=1 and the auxiliary extension is the original extension. All finite trace indices are computed in Ḡ̃, not the infinite group G̃.

*Needs:* §6.17; §6.8; §6.3; §4.4.

### 6.27 Descent of a completed zeta element to the canonical localization

Let A_G=Λ_O(G), with G one-dimensional pro-p, finite kernel over Γ, central open Z≅Z_p and O an unramified coefficient domain. Let B_G be the p-adic completion of the central-regular localization of A_G. If b∈K₁(B_G) has abelianized norms equal to the normalized abelian zeta functions ζ_P, then there is ζ∈K′₁((A_G)_S) with θ_S(ζ)=(ζ_P) and ∂ζ=−[C]. In particular that tuple satisfies M1–M4. The result uses abelian main conjectures and arithmetic base change to impose its boundary; it does not identify the Ritter–Weiss refined class with [C].

p odd; finite-over-cyclotomic totally real μ=0 setting; A_G and C as in the canonical main-conjecture criterion. The integral θ-isomorphism K′₁(A_G)≅Φ, the inclusion θ̂(K₁(B_G))⊆Φ̂, the surjective canonical localization boundary, and the abelian main conjectures with base change of C are available. All denominator sets and coefficient products are componentwise. For Δ×G, apply the argument to the unramified domains O in Z_p[Δ].

Start with a §2.15 characteristic lift f of −[C]. By abelian main conjectures, the tuple θ_S(f)⁻¹(ζ_P) consists of integral units. Its completed realization is θ̂(f⁻¹b), so the completed integral-intersection theorem places it in Φ. Lift it through θ:K₁′(A_G)≃Φ and multiply f by that integral lift. This preserves ∂f and produces the required normalized tuple. This proof uses no identification of the Ritter–Weiss refined class ℧ with −[C].

(Kakde, Theorem 53, pp. 35–36 and its proof, p. 65; Ritter–Weiss, Theorem, pp. 2–3; §§6.31–6.34 for the completed construction.)

**Checks.**

- If W acts trivially with |W|=p^a, the trace ideal is exactly p^a times the ring; completion cannot weaken this modulus.
- For a free W-orbit the trace generator is its orbit sum with coefficient 1. No false divisibility by |W| is imposed.
- The lift f is generally not integral and b need not come from a canonical localized element by an inverse completion map. The correction z is integral because its entire tuple u, including inverses, is integral.

*Needs:* §6.15; §6.8; §6.1; §2.15; §4.5; §4.7.

### 6.28 M4 from Möbius congruences and canonical descent

In the one-dimensional Δ×pro-p, odd-p, totally real μ=0 setting, prove that the normalized abelian zeta tuple satisfies M4 in the canonical localization. Use the full Möbius congruences, the independent Ritter–Weiss completed construction and §6.27’s boundary-preserving descent. The intermediate congruences must hold at all finite levels with their trace moduli; replacing them by a sum over cyclic overgroups is insufficient.

p odd; totally real extension finite over the cyclotomic tower; S contains p and all ramified primes. μ=0; abelian main conjectures, arithmetic base change and the corrected algebraic θ-image theorem; unramified coefficient factors treated separately.

(Ritter–Weiss, Propositions 3, 5–6, pp.2–3; Theorem 7, p.4; §§4–6, pp.13–25; Kakde, Lemma 85, pp.58–60; Theorems 52–53, p.36 (v3).)

**Checks.**

- The C_{p²}×C_p test in §6.25 excludes the old cyclic-overgroup sum. M4 here follows from an actual completed multiplicative preimage and contraction of integral trace conditions.
- The special central P=1 factor is retained, while scalar torsion is embedded with norm powers [G:U_P].

*Needs:* §6.34; §6.27; §6.8.

### 6.29 abelian zeta functions satisfy M1–M4

For the original one-dimensional Δ×pro-p extension, the tuple (ζ_P) lies in Φ_S: M1–M2 follow from interpolation and conjugation, M3 from the index-p Möbius congruence, and M4 from the completed construction and canonical descent. The same statement applies to the separate enlarged extension. The §5.5 main conjecture follows from the congruence criterion.

(Kakde, §6.1, Theorem 94, p. 67, with §6.13, pp. 86–90 (v3); Ritter–Weiss, Theorem, p.1; Proposition 3, p.2; §§4–5, pp.13–22.)

**Checks.**

- For the trivial finite quotient, the tuple-membership assertion is the abelian normalized theorem.
- The full Möbius and completed-descent proof retains all subgroup multiplicities; a sum over cyclic overgroups would fail the C₉×C₃ test of §6.25.

*Needs:* §6.18; §6.25; §6.28; §6.17.

### 6.30 main conjecture for totally real fields (Kakde)

Let p be odd and F_∞/F an admissible p-adic Lie extension satisfying μ = 0, with G = Gal(F_∞/F). There is a unique ζ(F_∞/F) ∈ K′₁(Λ(G)_S) with ∂(ζ(F_∞/F)) = −[C(F_∞/F)] and ζ(F_∞/F)(ρκ^r_F) = L_Σ(ρ, 1 − r) for every Artin character ρ of G and every r ≥ 1 divisible by [F_∞(μ_p) : F_∞] (Theorem 11). That is, MC(F_∞/F) of §5.5 holds.

p odd; F_∞/F admissible; μ = 0 (Definition 8, known when F_∞ is abelian over ℚ by Ferrero–Washington).

(Kakde, §2.5, Theorem 11, p. 13 (v3); proof completed on p. 90; Ritter–Weiss, Propositions 3 and 6, pp.2–3; §§4–5, pp.13–22.)

**Checks.**

- For F_∞=F_cyc, the assertion is the normalized abelian main theorem of §6.1.
- The statement requires the arithmetic perfect complex of §4.5, the algebraic image theorem of §6.15 and the completed/descent argument of §§6.27–6.34, in addition to finite Whitehead inputs. Character interpolation alone does not prove the boundary or uniqueness.

*Needs:* §6.29; §6.26; §6.3; §6.4; §6.5; §6.6; §6.16; §6.15; §6.1; §5.5.

### 6.31 Ritter–Weiss logarithmic pseudomeasure

In the one-dimensional Ritter–Weiss setting, let Λ^G be the p-adic completion after inverting central elements regular modulo p, Q^G its total quotient, and T(R)=R/[R,R]_add the additive commutator quotient. The reduced-trace character map Tr identifies T(Q^G) with the admissible character-function space. Define t_(K/k) by Tr(t)=L(L_(K/k)), where L(f)(χ)=p⁻¹ log(f(χ)^p/Ψ(f(ψ_pχ))) and Ψ is induced by γ↦γ^p. For p-elementary G the integral group logarithm satisfies Tr∘L=L∘Det and has image in T(Λ^G). This completion and this t are distinct from the canonical localization and a multiplicative zeta element.

p odd; K/k totally real, k/Q finite and K/k_cyc finite; the stated character functions satisfy Galois and cyclotomic twisting compatibilities. For integrality of the group logarithm use p-elementary G=C×P with C finite cyclic of order prime to p and P pro-p.

 Prove `RWLogarithmicPseudomeasure.deflation` and compatibility with the source-defined additive restriction and trace maps. Additive restriction is not naive deletion of conjugacy-class basis terms.

Use `RWLogarithmicPseudomeasure.ofCharacterFunction`, `RWLogarithmicPseudomeasure.trace`, `RWLogarithmicPseudomeasure.deflation`, `RWLogarithmicPseudomeasure.logDet`.

(Ritter–Weiss, §1, diagram (D1), pp. 4–5; §6, Lemma i, pp. 22–24.)

**Checks.**

- For an abelian group, T(Λ^G)=Λ^G and the trace comparison is the scalar character comparison.
- For the group-like unit γ, p⁻¹log(γ^p/Ψγ)=0; a logarithm omitting Ψ fails this test.
- For the scalar unit 1+p over Z_p, the logarithm is (1−p⁻¹)log(1+p), not the ordinary log.
- The zero additive pseudomeasure is uniquely determined by zero trace but does not imply uniqueness of a multiplicative preimage when SK₁ survives.

*Needs:* §3.12; §3.13; §6.12; AlgebraicKTheory A2–A3.

### 6.32 Möbius–Wall and abelian pseudomeasure congruences

Let A be an abelian normal open subgroup of p-elementary G and Q=G/A a finite p-group. For ε∈(Λ^G)^×, Σ_(A⊆U⊆G) μ_Q(U/A) ver_A^U(res_U^G ε) lies in tr_Q(Λ^A). The same Möbius sum with the abelian pseudomeasures λ_(K^[U,U]/K^U) lies in the corresponding trace ideal in the central localization Λ•A. Here res denotes the K₁ transfer before the abelian group-transfer map ver, and μ_Q is the subgroup-poset Möbius function. These are distinct algebraic and analytic congruences.

p odd; one-dimensional totally real Ritter–Weiss setting; A includes the prime-to-p cyclic direct factor. The analytic clause uses the S-truncated abelian pseudomeasures and their Deligne–Ribet congruences.

(Ritter–Weiss, Propositions 5–6, p. 3; §2, pp. 6–10; §3, pp. 10–12; Ritter–Weiss, Congruences II, Propositions 4–5 and 9; Lemma 10, pp.5–11.)

**Checks.**

- If Q=C_p, μ_Q(1)=1 and μ_Q(Q)=−1, giving the norm-transfer difference in the Q-trace ideal.
- If Q=C_p², the subgroup Möbius coefficients are 1 on 1, −1 on each line and p on Q.
- If A=G, the trace ideal is all Λ^A; the resulting congruence imposes no extra condition.

*Needs:* §6.31; §6.22; §6.25; §§6.1, 6.19–6.22; PadicFamilies §§5.9a–5.10; RepresentationTheory/InductionRestriction Layer 6.

### 6.33 Ritter–Weiss logarithmic integrality criterion

Under the odd-prime, totally real, one-dimensional Ritter–Weiss hypotheses and μ_(K/k)=0, existence of Θ∈K₁(QG) with Det Θ=L_(K/k) and ∂Θ=℧_(K/k) is equivalent to L_(K/k)∈Det K₁(Λ^G). After p-elementary reduction, this is equivalent to t_(K/k)∈T(Λ^G). The implication from integral t to a multiplicative preimage requires the torsion congruence; the logarithm alone loses torsion information. The refined class ℧ is not silently identified with −[C] without a separately proved arithmetic comparison.

p odd; K/k totally real, k/Q finite, K/k_cyc finite; finite S contains all archimedean and ramified primes; μ_(K/k)=0. For the second equivalence use p-elementary G and the source’s compatible character-function space.

(Ritter–Weiss, Propositions 1–3, pp. 2–5; §6, Lemma k, pp. 25–27.)

**Checks.**

- A torsion character function may have zero logarithm; zero logarithm alone does not put it in Det of the integral K₁.
- The μ=0 hypothesis is retained when moving the boundary problem to the central completed localization.

*Needs:* §6.31; §6.32; §6.1 (normalized abelian theorem); AlgebraicKTheory A2.

### 6.34 Ritter–Weiss main theorem with μ = 0

Let p be odd and K/k a totally real Galois extension with k/Q finite, K containing k_cyc and [K:k_cyc]<∞. Let S contain all archimedean and ramified places and suppose μ_(K/k)=0. There exists Θ∈K₁(QG) with Det Θ=L_(K/k,S) and ∂Θ=℧_(K/k,S). The theorem proves existence; uniqueness in K₁(QG) is not part of its conclusion. Its comparison with the canonical main-conjecture statement of §5.5 requires both the localization maps and the refined-module/dual-complex sign comparison. Equivalently, in the source’s μ=0 criterion, L_(K/k,S) lies in Det K₁(B_G), where B_G=Λ∧G is the completed central-regular localization. This completed preimage, rather than the class ℧, is the input of §6.27.

Exactly the odd-prime, finite-over-cyclotomic, totally real and μ=0 hypotheses in the statement.

(Ritter–Weiss, Theorem, p. 1; Theorem 7, p. 4; §5, Lemmas g–h and Claims 1–3, pp. 17–22.)

**Checks.**

- The abelian case reduces to the normalized abelian pseudomeasure theorem with the same S.
- No p=2 or arbitrary higher-dimensional statement follows from this theorem.
- The completed preimage b has θ̂_P(b)=ζ_P: Det commutes with abelianized restriction, and Det is injective for the commutative semilocal B(U_P^ab). This identifies its normalized components without using a comparison of ℧ with the arithmetic complex.

*Needs:* §§6.31–6.33; §3.13; the normalized abelian theorem of §6.1.

### 6.35 Conditional Ritter–Weiss SK₁ reduction

For odd p, the universal vanishing SK₁(QG)=0 for the one-dimensional totally real Galois groups in Ritter–Weiss would follow if SK₁(D_(r,s,F))=0 for every finite unramified F/Q_p and positive r,s. Here O_m is the integer ring of F(ζ_(p^m)), A=O_r[[T]], B=O_(r+s)[[T]], and D_(r,s,F)=(Frac(B)/Frac(A),g,1+T), with g(ζ_(p^(r+s)))=ζ_(p^(r+s))^{1+p^r}. Thus an element u satisfies ub=g(b)u and u^{p^s}=1+T. The source’s Theorem 1A is this reduction; it is not a proof of all the required SK₁ vanishings. No unconditional uniqueness upgrade is exported.

p is odd; F/Q_p is finite unramified; r,s≥1; compatible p-power roots of unity are chosen. The displayed SK₁ vanishings for every such cyclic division algebra are premises of this implication, not conclusions.

(Ritter–Weiss (2026), Introduction, pp. 1–5; Theorem 1A, pp. 6–8.)

**Checks.**

- The hypothesis is a family of SK₁ vanishing assertions, not merely a single split-matrix calculation.
- The parameter change with m=1 is the identity; a prime-to-p m has the inverse exponent 1/m in Z_p.
- The statement supplies no result at p=2.

*Needs:* §3.13; AlgebraicKTheory A2; GeneralAlgebraicKTheory §8.1.

### 6.36 Unconditional abelian minus main theorem

Let H/F be finite abelian CM with F totally real, p odd, H∞/H cyclotomic and G=Gal(H∞/F). Let S,T be disjoint finite sets with S∞∪S_p⊆S, S_ram⊆S∪T and Hyp_p^T: T is not contained in S_ram and H has no nontrivial p-power root of unity congruent to 1 above every place of T∖S_ram. Then over R=Z_p[[G]]^− the source’s covariantly dualized smoothed Selmer module M=Sel_S^T(H∞)_p^− has Fitt_R(M)=(Θ_S^T), and admits an injective square finite-free presentation (hence projective dimension at most one). No μ=0 premise is used. Its comparison with the abstract Picard module’s Pontryagin dual is unconditional; identifying that dual with the Z_p-dual of the Tate module uses μ=0.

Exactly the field, parity and S,T conditions in the statement; complex conjugation defines the minus idempotent (1−j)/2. The source uses the covariant action (g f)(x)=f(gx) on duals, not an unrecorded contragredient convention.

(Gambheera–Popescu, Theorems 6.28 and 6.30, pp. 33–34; Proposition 7.10, p. 37 (v1); published Theorem 1.12.)

**Checks.**

- The idempotent (1−j)/2 requires odd p; it is not an integral two-primary construction.
- A finite-level theorem allowing fewer p-adic places in S does not remove S_p⊆S from the Iwasawa theorem.
- The theorem cannot remove μ=0 from the nonabelian Kakde or Ritter–Weiss statements.

*Needs:* SelmerIwasawaCohomology §§3.1–3.3, 3.8–3.15; PadicMeasuresIwasawaAlgebras §§4.2, 5.1; §7.21 for the commutative Fitting comparison.

### Examples

For G=Γ and Z=Γ^9, representatives γ^a with 0≤a<9 multiply with carry τ(γ̄,γ̄⁻¹)=γ^9. Consequently the inverse-labelled basis element alone is not the inverse; the scalar γ^{−9} is necessary. For Z=Γ the quotient is trivial and every carry is zero. In a product coefficient ring, (1,0) and (0,1) are both outside pR but multiply to zero; the regular-mod-p denominator set is the product of the component sets.

For Ḡ=C₉×C₃ and P=⟨(3,0)⟩ there are three cyclic overgroups P′ with P′³=P, generated by (1,t), t∈C₃. Conjugation is trivial and |N(P)/P|=9, so T_P=9R[P]. An unweighted sum of three identical unit values is 3ζ, which need not vanish modulo 9. The full Möbius method retains all intermediate subgroups. For C₃² its coefficients are 1, four copies of −1, and 3; for the scalar unit 2 the corresponding algebraic norm sum is 2⁹−4·2³+3·2=486, divisible by 9. These are tests of the algebraic expressions, not extensions of the arithmetic theorem to arbitrary functions (Kakde (12), p. 69; Ritter–Weiss, Proposition 5, p. 3; Congruences II, Proposition 9 and Lemma 10, pp. 8–11).

### Dependencies

Layers 0–5; generic K-theory, Brauer induction and twisted algebra; ClassicalArithmeticCompletion's finite integral logarithm and determinant fixed points; PadicFamilies' Hilbert forms and q-expansions. Build the partial-value and Eisenstein constructions before the pseudomeasure and normalized abelian theorem, then the additive and multiplicative image theorems, full analytic Möbius congruences, completed construction and canonical descent. The 2026 SK₁ implication retains its universal division-algebra premise. The abelian minus theorem is a separate result and does not remove μ=0 from the general noncommutative theorem.

## Layer 7: Bockstein descent, interpolation and Fitting invariants

For §§7.1–7.8 use compact analytic G, H◁G, G/H=Γ≅Z_p, γ and T=γ−1, and a positive-rank continuous ρ:G→GL_n(O), with O=O_L for finite L/Q_p. Complexes are perfect. A semisimplicity condition is an additional hypothesis, never inferred from perfectness or torsion alone.

For the Tate-motive results §§7.10–7.14, p is odd and F∞/Q is totally real Galois, contains Q_cyc, and is unramified outside finite S containing p and infinity. Put G=Gal(F∞/Q), H=Gal(F∞/Q_cyc), Γ=G/H. Choose a finite Galois E/Q inside F∞ with E∩Q_cyc=Q and E_w∩Q_{p,cyc}=Q_p for every w|p, and write Ḡ=Gal(E/Q). Let U=Spec Z[1/S], 𝕋=Λ(G) with σ acting by χ_cyc(σ)σ̄⁻¹, and c_γ=log_p χ_cyc(γ)≠0. A fixed field isomorphism C_p≃C is used for the regulator comparison. These are the hypotheses of Burns–Venjakob (15), §5, pp. 21–22; E and its local conditions are not arbitrary finite extensions. Each motivic statement also retains the finiteness and comparison hypotheses it names.

### 7.1 Bockstein homomorphisms

Let θ ∈ H^1(G, ℤ_p) = Hom_cont(G, ℤ_p) be G ↠ Γ → ℤ_p with γ ↦ 1; it corresponds to the extension 0 → ℤ_p → E_θ → ℤ_p → 0 with E_θ = ℤ_p² and G acting by (1 θ; 0 1), which gives θ : A· → A·[1] in D^b(Λ(G)). The Bockstein morphism in degree i is B_i = H^{−i}(θ_*) : Tor_i^{Λ(G)}(T_ρ, A·) → Tor_{i−1}^{Λ(G)}(T_ρ, A·), with T_ρ = 𝒪^n written as columns and right action v·g=ρ(g)^t v. Thus (v·g)·h=ρ(h)^tρ(g)^t v=v·(gh); in row coordinates the same action is v·g=vρ(g). For G = Γ, the triangle A· --T--> A· → ℤ_p ⊗^L A· gives 0 → H^i(A·)_Γ … exact sequences (3), and B_i is the composite H_i(Γ, A·) → H^{−i+1}(A·)^Γ --κ--> H^{−i+1}(A·)_Γ → H_{i−1}(Γ, A·), with κ induced by the identity (Lemma 3.1); so (H_·(Γ, A·), B_·) is a complex (4).

Construct `cupTheta` from the continuous extension by the derived tensor action, prove functoriality and compatibility with coefficient extension, then compute its connecting maps on a projective model. This construction precedes the square-zero theorem; specifying an arbitrary map of degree one would not fix its sign.

Use `thetaClass`, `cupTheta`, `bockstein`, `bockstein_eq_kappa`, `bockstein_sq`.

(Burns–Venjakob, §§3.1–3.2, Lemma 3.1, pp. 7–9 (v2).)

**Checks.**

- A· = [Λ(Γ) --T--> Λ(Γ)] in degrees −1, 0: H_1 = H_0 = ℤ_p and B_1 = −1 (proof of Proposition 3.8).
- If T acts invertibly on H^·(A·) the Bockstein complex is 0.
- A· = [Λ² --((T,1),(0,T))--> Λ²] has H^0 = Λ/T² and κ = 0, so B_1 = 0 on H_1 = H_0 = ℤ_p.
- The mapping-cone sign convention is BV's: d_cone = (d_B f; 0 −d_A).

*Needs:* §0.14; §3.1; ProfiniteCohomology continuous cup products; GeneralAlgebraicKTheory §§4.15–4.16, 6.3, 6.19.

### 7.2 Semisimple complexes and the order r(ρ)

A· ∈ C^p(Λ(Γ)) is semisimple if the Bockstein complex (H_·(Γ, A·), B_·) has ℤ_p-torsion (hence finite) cohomology; Σ^{ss} is the full subcategory of such complexes, and r_Γ(A·) = Σ_i (−1)^{i+1} dim_{ℚ_p}(H^i(A·)^Γ ⊗ ℚ_p) (Definition 3.2). Semisimple complexes have Λ(Γ)-torsion cohomology, and A· ∈ Σ^{ss} iff κ_i ⊗ ℚ_p is bijective in every degree, in which case r_Γ(A·) = Σ(−1)^{i+1} dim H^i(A·)_Γ ⊗ ℚ_p (Remark 3.3). For general G: A· is semisimple at ρ if (H_·(G, A·(ρ^*)), B_·) has ℤ_p-torsion cohomology (Definition 3.11), finite at ρ if H_·(G, A·(ρ^*)) is ℤ_p-torsion (Definition 3.12, so Σ^{fin−ρ} ⊆ Σ^{ss−ρ}), and r_G(A·)(ρ) = Σ(−1)^{i+1} dim_L(H^i(H, A·(ρ^*))^Γ ⊗ L). A· is semisimple at ρ iff A·_ρ = (Λ_𝒪(Γ) ⊗ 𝒪^n) ⊗^L A· is semisimple, with the same Bockstein maps and r_G(A·)(ρ) = r_Γ(A·_ρ) (Lemma 3.13). Over a discrete valuation ring R with uniformizer T, a bounded perfect semisimple complex is chain-isomorphic to a finite direct sum of cohomological shifts of the two-term blocks [R --1--> R] and [R --T--> R] (Lemma 3.9). The blocks may occupy different adjacent degrees; this decomposition is applied after augmentation localization, where T is a uniformizer, not directly over O[[T]].

The subcategory is closed under finite direct sums and shifts. It need not be extension closed: the displayed T² example gives the obstruction. For torsion over O, finite means finite length as an O-module; after rationalization the Bockstein complex is acyclic.

Use `IsSemisimple`, `IsSemisimpleAt`, `IsFiniteAt`, `orderAt`, `isSemisimple_iff_kappa`, `IsFiniteAt.isSemisimpleAt`, `isSemisimpleAt_iff_twist`, `semisimple_dvr_decomposition`.

(Burns–Venjakob, §3.2, Definition 3.2 and Remark 3.3, p. 9; §3.3, Definitions 3.11–3.12, Lemma 3.13; Lemma 3.9 (v2).)

**Checks.**

- [Λ --T--> Λ] is semisimple with r_Γ = −1.
- [Λ --f--> Λ] with f(0) ≠ 0 is finite at ρ_triv, with r = 0.
- [Λ² --((T,1),(0,T))--> Λ²] is an extension of two copies of [Λ --T--> Λ] but is not semisimple.
- An acyclic complex is finite at every ρ, with r = 0.
- Σ^{ss} and Σ^{ss−ρ} satisfy (i)–(iii) and (iv′) but not (iv): they are not closed under extensions.

*Needs:* §7.1; §2.7.

### 7.3 Bockstein trivialisation t(A·)

For A· ∈ Σ^{ss}, t(A·) : d_{ℤ_p}(ℤ_p ⊗^L_{Λ(Γ)} A·)_{ℚ_p} ≅ d((H_·(Γ, A·), 0))_{ℚ_p} = d((H_·(Γ, A·), B_·))_{ℚ_p} ≅ 1_{ℚ_p}, using property h) and then e) for the acyclic rational Bockstein complex (Definition 3.4, (5)). If ℚ_p ⊗^L A· is already acyclic, t(A·) is the acyclicity trivialisation (Remark 3.5). For an exact triangle A· → B· → C· of semisimple complexes, r_Γ(B·) = r_Γ(A·) + r_Γ(C·) and t(B·) = t(A·)t(C·) (Lemma 3.6). For general G, t(A·(ρ^*)) is the same composite (7) for 𝒪 ⊗^L_{Λ_𝒪(G)} A·(ρ^*), equal to t(A·_ρ) (Lemma 3.13).

Use `bocksteinTrivialization`, `bocksteinTrivialization_of_acyclic`, `bocksteinTrivialization_triangle`, `bocksteinTrivialization_twist`.

(Burns–Venjakob, §3.2, Definition 3.4, Remark 3.5 and Lemma 3.6, pp. 9–10; (7) in §3.3 (v2).)

**Checks.**

- ℚ_p ⊗^L A· acyclic: t(A·) is the acyclicity isomorphism.
- [Λ --T--> Λ]: t is the inverse of the Bockstein B_1 = −1 on ℚ_p (proof of Proposition 3.8).
- For [Λ --T--> Λ] ⊕ [Λ --T--> Λ], t is the product of the two trivialisations and r = −2.
- The Bockstein trivialization must be independent of the chosen finite decomposition and compatible with direct sums and shifts; Lemma 3.6 supplies a theorem to prove, not a choice of unrelated determinant bases.

*Needs:* §7.2; §7.1; GeneralAlgebraicKTheory §§4.15–4.16, 6.3, 6.19.

### 7.4 leading term at a representation

For A· ∈ Σ^{ss−ρ} and a : 1_{Λ(G)} → d_{Λ(G)}(A·), the leading term (A·, a)^*(ρ) ∈ L^× is (−1)^{r_G(A·)(ρ)} times the element of L^× ≅ K_1(L) ≅ Aut(1_L) given by 1_L --L^n ⊗ a--> d_L(L^n ⊗^L_{Λ(G)} A·) --t(A·(ρ^*))--> 1_L (Definition 3.14; for G = Γ and ρ = ρ_triv, Definition 3.7). It gives a homomorphism (−)^*(ρ) : K_1(Λ(G), Σ) → L^× on subcategories Σ ⊆ Σ^{ss−ρ} with (i)–(iii), (iv′). If A· ∈ Σ^{fin−ρ}, the leading term is the value [A·, a](ρ) in the sense of Fukaya–Kato 4.1.5 (Remark 3.15).

 For the shift, transport the monoidal inverse a^⊗−1:1→d(A)⁻¹ to d(A[1]); the characteristic function and leading term invert and the order negates (`leadingTerm_shift`). This operation differs from reversing the arrow a.

Use `leadingTerm`, `leadingTermHom`, `leadingTerm_mul`, `leadingTerm_eq_value`, `leadingTerm_shift`.

(Burns–Venjakob, §3.3, Definition 3.14 and Remark 3.15, pp. 14–15; Definition 3.7, p. 10 (v2).)

**Checks.**

- A· = [Λ --T--> Λ], trivialisation a_ε: leading term ε(0), r = −1 (Proposition 3.8).
- Its shift has r = +1 and leading term ε(0)^{−1}: a vanishing case with its Bockstein determinant.
- For C=[Λ --f→Λ] in degrees −1,0, f(0)≠0 and the identity determinant trivialization, r=0 and the leading term is exactly f(0)⁻¹. A different trivialization must be specified to introduce a unit factor.
- The T² extension of §7.1 is not semisimple, so no leading term is defined for it.
- The extension with cokernel R/(T²) is not semisimple, so no leading term is defined for it.
- The localized determinant domain is generated using direct sums and condition (iv′). The extension-closed version contains the nonsemisimple R/(T²) example, so it cannot carry this leading-term map.

*Needs:* §7.3; §7.2; §2.7.

### 7.5 Leading terms as leading coefficients of characteristic series

Let 𝓛 = [A·, a] with A· ∈ Σ^{ss} for G = Γ, and ch_Γ : K_1(Λ(Γ), Σ^{ss}) → K_1(Q(Γ)) = Q(Γ)^×. Writing F = T^rG(T) with G(0) ∈ L^× (6), (i) r(ch_Γ(𝓛)) = r_Γ(A·), and (ii) (−)^*(ρ_triv) = (−)^*(0) ∘ ch_Γ, where F^*(0) = G(0) (Proposition 3.8). The same holds with 𝒪, L, Λ_𝒪(Γ) and Q_𝒪(Γ) (Remark 3.10).

Here coefficients are O with fraction field L, so Q_O(Γ) embeds in L((T)). For nonzero F, define its Laurent order r and coefficient F*(0) by F=T^r u with u regular and nonzero at 0. The negative order in the two-term example is compatible with ∂ch=−[A·].

Use `laurentOrder`, `laurentLeadingCoefficient`, `leadingTerm_eq_laurentCoefficient`.

(Burns–Venjakob, §3.2, Proposition 3.8 and Remark 3.10, pp. 11–12 (v2).)

**Checks.**

- For F=3T⁻²(1+T), ord_T F=−2 and F*(0)=3.
- For F=1, ord_T F=0 and F*(0)=1; F=0 is outside the domain.
- For F=T and F⁻¹=T⁻¹ the orders are 1 and −1, while both leading coefficients are 1.
- For A· = [Λ --T→ Λ] with trivialization a_ε the order is −1 and the leading term is ε(0); ch_Γ = T⁻¹ε has the same order and leading coefficient.

*Needs:* §7.4; §7.2; §2.7; §2.14.

### 7.6 Leading terms on the canonical localisation

For A· ∈ Σ_{S*} ∩ Σ^{ss−ρ} and ch_{G,A·} : K_1(Λ(G), Σ_{A·}) → K_1(Λ(G)_{S*}), let ρ_* : K_1(Λ(G)_{S*}) → K_1(M_n(Q_𝒪(Γ))) ≅ Q_𝒪(Γ)^× be induced by g ↦ ρ(g)ḡ. Then (i) r_G(A·)(ρ) = r_Γ(A·_ρ) = r(ρ_*(ch_{G,A·}(A·))), and (ii) (−)^*(ρ) = (ρ_*(−))^*(0) ∘ ch_{G,A·} (Proposition 3.16). Accordingly F^*(ρ) := ρ_*(F)^*(0) for F ∈ K_1(Λ(G)_{S*}), and F(ρ) := F^*(ρ) when r(ρ_*(F)) = 0.

S, S* the canonical Ore sets of CFKSV.

Use the representation specialization of §3.1 and the Morita determinant, not a matrix-entry evaluation. When the Laurent order is positive, the ordinary CFKSV value is zero while the leading coefficient is a unit; equality with the nonzero ordinary value is asserted only at order zero.

(Burns–Venjakob, §§3.4.1–3.4.2, Proposition 3.16, pp. 15–16 (v2).)

**Checks.**

- F(ρ) agrees with CFKSV's evaluation at ρ (§3.3) when r = 0.
- The domain K_1(Λ(G), Σ_{A·}) is taken with (iv′), as in §7.4.

*Needs:* §7.5; §7.4; §1.10; §3.3; §2.7.

### 7.7 Leading terms as derivatives in the cyclotomic direction

Fix χ : G ↠ Γ → ℤ_p^× of infinite order, c_{χ,γ} = log_p(χ(γ)) ∈ ℚ_p^×, L = [A·, a] with A· ∈ Σ_{S*}, f_ρ(T) = ρ_*(ch_{G,A·}(L)) ∈ Q_𝒪(Γ)^×, and f_L(ρχ^s) = f_ρ(χ(γ)^s − 1), a p-adic meromorphic function of s ∈ ℤ_p. With r = r_G(A·)(ρ): (i) near 0, L^*(ρχ^s) = L(ρχ^s) = f_L(ρχ^s) for s ≠ 0; (ii) c_{χ,γ}^r L^*(ρ) is the leading coefficient at s = 0 of f_L(ρχ^s); (iii) if r ≥ 0, c_{χ,γ}^r L^*(ρ) = (1/r!)(d^r/ds^r) f_L(ρχ^s)|_{s=0} (Lemma 3.17). For χ = χ_cyc this is partial derivation in the cyclotomic direction (Remark 3.18).

The perfect complex A underlying 𝓛 lies in Σ_(ss−ρ), so r=r_G(A)(ρ) is the Laurent order and the Bockstein leading term exists. For a bare scalar f the substitution argument instead uses r=ord_T(f), without asserting an arithmetic determinant comparison.

The nonzero scalar c_{χ,γ} follows from infinite image of the continuous character of Γ; at p=2 a topological generator maps into the torsion-free part after the finite sign factor is removed. For negative r use a Laurent coefficient, not a derivative of a function regular at zero. Under γ↦γ^u, c changes by u and the T-leading coefficient by u^(−r), so their product is unchanged.

(Burns–Venjakob, §3.4.3, Lemma 3.17 and Remark 3.18, pp. 16–17 (v2).)

**Checks.**

- For r < 0 only the leading-coefficient statement (ii) holds.

*Needs:* §7.6.

### 7.8 Generalized Euler–Poincaré characteristics

For A· ∈ Σ^{ss−ρ}, put H^i_B(G, −) = H^i((H_{−·}(G, −), B_{−·})), χ_add(G, A·(ρ^*)) = Σ_i (−1)^i length_𝒪 H^i_B(G, A·(ρ^*)) and χ_mult = (#κ_L)^{χ_add}. For any trivialisation a and L = [A·, a]: χ_add(G, A·(ρ^*)) = ord_L(L^*(ρ)) and χ_mult(G, A·(ρ^*)) = |L^*(ρ)|_p^{−[L:ℚ_p]} (Proposition 3.19). The Pontryagin dual of the Hochschild–Serre differentials used by Coates–Schneider–Sujatha and others is the Bockstein map, and when A·(ρ^*) ⊗ ℚ_p is acyclic this recovers CFKSV Theorem 3.6, Venjakob Proposition 6.3 and Fukaya–Kato Remark 4.1.13 (Remark 3.20).

(Burns–Venjakob, §3.5, Proposition 3.19 and Remark 3.20, pp. 17–18 (v2).)

**Checks.**

- When A· is finite at ρ the valuation of the value is the Euler characteristic, recovering CFKSV Theorem 3.6 (§3.6).
- For A· = [Λ --T→ Λ] at ρ = 1, the Bockstein B_1 = −1 is an isomorphism, so all Bockstein cohomology vanishes and χ_add = 0 = ord(ε(0)) for a trivialization a_ε with ε ∈ Λ(Γ)^×.

*Needs:* §7.4; §3.6; GeneralAlgebraicKTheory §§4.15–4.16, 6.3, 6.19.

### 7.9 Fukaya–Kato global zeta isomorphism (as a proposition)

For p odd, U = Spec ℤ[1/S] with S ⊇ {p, ∞}, a motive M over ℚ with a G_ℚ-stable lattice T_p of M_p, F_∞/ℚ a p-adic Lie extension with G = Gal(F_∞/ℚ), and 𝕋 = Λ(G) ⊗ T_p with the diagonal action g(x ⊗ y) = xḡ^{−1} ⊗ gy: the conjecture (Fukaya–Kato 2.3.2) asserts a unique isomorphism ζ_Λ(M) : 1_Λ → d_Λ(RΓ_c(U, 𝕋))^{−1} in 𝒞_Λ whose base change along every motivic ρ : G → GL_n(𝒪_λ) is the composite of ζ_K(M(ρ^*))_{K_λ} : 1 → Δ_K(M(ρ^*))_{K_λ} with the p-adic period-regulator ϑ_λ, where ζ_K(M(ρ^*)) is the isomorphism matching L^*_K(M(ρ^*)) through the period-regulator ϑ_∞ on the fundamental line Δ_K(M) = d(H^0_f(M))^{−1}d(H^1_f(M))d(H^0_f(M^*(1))^*)d(H^1_f(M^*(1))^*)^{−1}d(M_B^+)d(t_M)^{−1} (Conjecture 4.1). It implies the equivariant Tamagawa number conjecture of Burns–Flach. This is a conjectural proposition. The conditional Tate/critical-motive targets explicitly assume its existence and use the typed shift construction below before taking a leading term. Put C=RΓ_c(U,𝕋) and D=C[1]. The determinant shift isomorphism s_C:d(D)≅d(C)⁻¹ defines ζ_D=s_C⁻¹∘ζ:1→d(D). If C is semisimple at ρ, the global leading term means [D,ζ_D]^*(ρ); it is not [C,ζ]. Its order is r(D)=−r(C), its boundary is ∂ch[D,ζ_D]=−[D]=[C], and t(D) is the monoidal inverse of t(C) under s_C. Monoidal inversion sends d(C)→1 to d(C)⁻¹→1; it is distinct from reversing the arrow of a morphism.

p odd; the finiteness of motivic cohomology, ϑ_∞ and ϑ_λ are themselves conjectural inputs (standard conjectures).

The target `fukayaKato_implies_etnc` proves the finite-level implication by derived specialization of the integral determinant isomorphism and the two period-regulator comparisons. It assumes the global conjecture and the motivic finiteness/comparison conjectures; it does not establish those conjectures.

Use `fundamentalLine`, `PeriodRegulatorData`, `FukayaKatoZetaConjecture`, `fukayaKato_implies_etnc`, `globalZetaLeadingTerm`.

(Burns–Venjakob §4, (8)–(14) and Conjecture 4.1, pp. 18–21; §2.1, pp. 4–5, Lemma 3.6, p. 10 and Definition 3.14, p. 14.)

**Checks.**

- For the Tate motive and the cyclotomic abelian tower, the conjectural determinant isomorphism specializes to the normalized Iwasawa zeta contract; its existence is still stated as a conjecture here.
- For an acyclic C with its acyclicity zeta isomorphism the shifted pair has order 0, boundary 0 and leading term 1.
- The finite-level determinant conjecture obtained by derived specialization recovers the Bloch–Kato Tamagawa-number formulation with its period maps; a trivial group is used only in that finite-level formulation.
- If C specializes in degrees 2,3 with a rank-one Bockstein B²=b, then d(C[1])=d(H²)⁻¹d(H³) and its canonical Bockstein trivialization has scalar b⁻¹. The §7.4 sign is −1 and the order is −1. This distinguishes a pole from a zero without choosing incompatible determinant bases across the shift.
- The global pair [RΓ_c[1],ζ_D] has boundary +[RΓ_c]. It is different from the totally real dual Galois-cochain convention ∂ζ=−[C(F∞/F)]. No identification of these two arithmetic complexes is implicit.
- The global zeta existence proposition is named as a hypothesis whenever its leading term is used.
- If C specializes in degrees 2,3 with a rank-one Bockstein B²=b, then d(C[1])=d(H²)⁻¹d(H³) and its canonical Bockstein trivialization has scalar b⁻¹. The leading-term sign is −1 and the order is −1. This distinguishes a pole from a zero without choosing incompatible determinant bases across the shift.
- The implication has named conjectural inputs. The Tate-motive and critical-motive targets state the conditional leading-term formulas of Burns–Venjakob §§5–6.

*Needs:* §7.4; §4.5; GeneralAlgebraicKTheory §§4.15–4.16, 6.3, 6.19; ArithmeticGaloisDuality R02.4 and D7.3/D7.5.

### 7.10 Descent for the Tate motive at ρ under Leopoldt

Fix ρ ∈ R_{ℂ_p}(Ḡ) with Leopoldt's conjecture valid at ρ, i.e. (ℚ_p ⊗ ker λ_p)^ρ = 0 for λ_p : O_E[1/p]^× ⊗ ℤ_p → ∏_{w|p}E_w^× ⊗̂ ℤ_p. (i) (H^i_c(U, 𝕋_E) ⊗ ℚ_p)^ρ is (cok λ_p ⊗ ℚ_p)^ρ for i = 2, (ℚ_p)^ρ for i = 3, and 0 otherwise. (ii) RΓ_c(U, 𝕋) ∈ Σ_{ss−ρ} and r_G(RΓ_c(U, 𝕋))(ρ) = ⟨ρ, 1⟩ = dim_{ℂ_p}(ℚ_p)^ρ. (iii) Under (i), the Bockstein morphism (B²)^ρ : H²_c → H³_c is induced by log_{p,γ,E} : ∏_{w|p}E_w^× ⊗̂ ℤ_p → ℤ_p, (e_w) ↦ −Σ_w c_γ^{−1}log_p(N_{E_w/ℚ_p}(e_w)).

(Burns–Venjakob, §5.1, Lemma 5.1 and proof, pp. 22–24 (v2).)

**Checks.**

- For E=Q and ρ=1 at odd p, the cyclotomic cokernel is (Q_p^×⊗̂Z_p)/⟨p⟩≃1+pZ_p. After tensoring with Q_p, log_p identifies it with Q_p, and the Bockstein is −c_γ⁻¹log_p.

*Needs:* §§7.1–7.3; SelmerIwasawaCohomology §4.18 for the Leopoldt proposition; arithmetic logarithms and compact Poitou–Tate.

### 7.11 p-adic Stark conjecture at s = 1 (Serre; BV Conjecture 5.2)

For ρ ∈ R_{ℂ_p}(Ḡ), let L_{p,S}(s, ρ) be Greenberg's S-truncated p-adic Artin L-function (L_{p,S}(n, ρ) = L_S(n, ρω^{n−1}) for n < 0) and L^*_{p,S}(1, ρ) := lim_{s→1}(s − 1)^{⟨ρ,1⟩}L_{p,S}(s, ρ). Let μ_∞ : ℂ ⊗ log_∞(O_E^×) ≅ ℂ ⊗ E₀ (E₀ the trace-zero part of E) and μ_p : ℚ_p ⊗ log_∞(O_E^×) → ℚ_p ⊗ E₀ the maps induced by exp_∞ followed by λ_p and log_p (19). Require det μ_p on the ρ-part to be nonzero as part of P-Stark(ρ), equivalently use the corresponding Leopoldt input for that part. The conjecture then asserts that L^*_{p,S}(1, ρ) is the leading term of L_{p,S}(s, ρ) at s = 1 and, for every ℚ[Ḡ]-isomorphism g : E₀ → O_E^× ⊗ ℚ, L^*_{p,S}(1, ρ)/det_{ℂ_p}((ℂ_p ⊗ μ_p) ∘ (ℂ_p ⊗ g))^ρ = L^*_S(1, ρ)/det_ℂ(μ_∞ ∘ (ℂ ⊗ g))^ρ, the two sides compared through a fixed j : ℂ_p ≅ ℂ.

A fixed isomorphism j : ℂ_p ≅ ℂ. The quotient formulation includes nonvanishing of its p-adic regulator determinant; without it only a cross-multiplied identity is meaningful and does not itself imply nonvanishing.

Construct `padicArtinL` by the abelian functions and Brauer induction of §6.1, with the displayed Teichmüller twist; prove compatibility with induction before defining the regulator quotient. The map μ_p is defined on the rational unit lattice identified with its archimedean logarithmic image; exp_∞ here inverts that identification, not a map from arbitrary complex vectors to p-adic units. A comparison of scalar extensions uses j.

Use `PadicStarkAtOne` (The proposition P-Stark(ρ) for ρ ∈ R_{ℂ_p}(Ḡ)); `padicStark_indep_g` (The identity does not depend on the choice of g); `padicStark_add` (P-Stark is additive in ρ (both sides are multiplicative in ρ)); `padicStark_induction` (P-Stark is inductive: P-Stark(Ind ρ) ⇔ P-Stark(ρ) for subfields); `padicStark_permutation` (P-Stark(Ind_J^{Ḡ}1_J) ⇔ the p-adic class number formula for E^J (§7.12)).

(Burns–Venjakob, §5.2, Conjecture 5.2 and Remark 5.3, pp. 24–25 (v2).)

**Checks.**

- ρ = 1, E = ℚ: ⟨1, 1⟩ = 1 and P-Stark(1) is Res_{s=1}ζ_{p,S}(s) = (1 − p^{−1})·∏_{ℓ∈S∖{p}}(1 − ℓ^{−1}), the S-truncated Kubota–Leopoldt residue.
- E real quadratic, ρ the quadratic character: both sides involve log_p ε resp. log|ε| of a fundamental unit (Leopoldt's p-adic class number formula).
- ρ with ⟨ρ, 1⟩ = 0 (nontrivial irreducible): the leading term is the value L_{p,S}(1, ρ).
- The displayed quotient formula requires μ_p to be invertible on the ρ-part. If Leopoldt fails there, its determinant is zero and this quotient is undefined; use the cross-multiplied conjectural formulation instead of inferring a higher-order zero from this test.
- Burns–Venjakob Remark 5.3 makes Tate's formulation (Tate, *Les conjectures de Stark*, Chapter VI §5) precise about the unit lattice and μ_p; the statement here follows Burns–Venjakob.

*Needs:* §§6.1, 7.1–7.10; SelmerIwasawaCohomology §4.18 for Leopoldt as a proposition; arithmetic logarithms and the unit theorem.

### 7.12 p-adic Stark conjecture for permutation characters

For a subgroup J ⊆ Ḡ and ρ = Ind_J^{Ḡ}1_J, P-Stark(ρ) holds iff the residue at s = 1 of the minimally p-truncated p-adic zeta function of E^J is nonzero and equal to 2^{[E^J:ℚ]−1}hR_p e_p/√|d|, with e_p = ∏_{v|p}(1 − Nv^{−1}); by Colmez this holds iff Leopoldt's conjecture holds for E^J. Leopoldt for E implies it for every E^J. For the general S-truncated function multiply this displayed residue by ∏_(v∈S_f(E^J),v∤p)(1−Nv⁻¹). Keep the same factors on the complex side in the induction comparison.

Prove `padicZeta_residue` for every totally real field: the residue formula itself does not assume Leopoldt, and its right side is allowed to vanish. Its nonvanishing is equivalent to the p-adic regulator being nonzero, hence to Leopoldt. Fix the regulator and discriminant signs together by the real embeddings as in Colmez, Lemmas 5.2–5.3. Artin induction then proves the asserted permutation case with identical Euler truncations on both sides.

(Burns–Venjakob, Remark 5.4, p. 25; Colmez §5, Lemmas 5.2–5.5 and final Theorem, pp. 386–388.)

**Checks.**

- E^J = ℚ: the formula reduces to Res_{s=1}ζ_p(s) = 1 − 1/p (Kubota–Leopoldt).
- For E^J=Q and S_f={p,ℓ}, the residue is (1−p⁻¹)(1−ℓ⁻¹), whereas the minimally p-truncated residue has only the first factor.

*Needs:* §7.11; §§6.1, 6.19–6.22; PadicFamilies §§5.9a–5.10; AnalyticNumberTheory, Dedekind-zeta continuation and residue.

### 7.13 Tate-motive interpolation with the global determinant shift

Assume P-Stark(ρ) for all characters of Ḡ and existence of the Fukaya–Kato zeta isomorphism. Put C=RΓ_c(U,𝕋), D=C[1], m=⟨ρ,1⟩ and ζ_D=s_C⁻¹ζ_Λ(𝕋):1→d(D). Then C and D are semisimple at ρ, r_G(C)(ρ)=m, r_G(D)(ρ)=−m, and c_γ^{−m}·[D,ζ_D]^*(ρ)=L^*_(p,S)(1,ρ). The associated meromorphic function in the cyclotomic variable has order −m at zero, and its leading coefficient is c_γ^{−m}[D,ζ_D]^*(ρ).

The Fukaya–Kato isomorphism ζ_{Λ(G)}(𝕋) (Conjecture 4.1) is assumed to exist.

The proof transports the global map to d(C[1]) and computes t(C[1]) using the logarithmic Bockstein. The exponent −m is the Laurent order of this shifted pair. The cyclotomic substitution is applied with that order; reversing the direction of the global map would instead invert the interpolation scalar.

(Burns–Venjakob, Theorem 5.5 and proof (21)–(26), pp. 25–27; Definitions 3.2 and 3.14, pp. 9, 14; Lemma 3.17, pp. 16–17 and Lemma 5.1, pp. 22–24.)

**Checks.**

- For E=Q and ρ=1 choose a basis u of H²_c with log_p u=ℓ and the usual basis of H³_c. Then ζ=L^*_S(1,1)·ℓ in d(H²_c)⁻¹d(H³_c), B²=−ℓ/c_γ, t(D)=−c_γ/ℓ and the leading sign is −1. Their product is c_γ L^*_S(1,1); multiplying by c_γ⁻¹ gives the p-adic residue. An exponent +1 fails this scalar test.
- If γ is replaced by γ^a for a∈Z_p^×, then c_(γ^a)=a c_γ and B² scales by a⁻¹. The pole coefficient [D,ζ_D]^* scales by a^m, so c_γ^{−m}[D,ζ_D]^* is invariant.
- For m=0 the shift still types the inverse determinant line; no cyclotomic correction factor occurs. The regulator and zeta existence assumptions remain substantive.

*Needs:* §7.10; §7.11; §7.12; §7.9; §7.4; §7.7.

### 7.14 interpolation formula for ℚ-rational characters under Leopoldt

Assume Leopoldt for E at p and existence of the Fukaya–Kato isomorphism. For every Q-valued character ρ of Ḡ, there is an integer n_ρ≥1 such that (c_γ^(−⟨ρ,1⟩)[RΓ_c(U,𝕋)[1],ζ_D]*(ρ))^n_ρ=L*_(p,S)(1,ρ)^n_ρ. For a permutation character take n_ρ=1. Here ζ_D is the global map transported along d(C[1])≃d(C)⁻¹ as in §7.13. Artin rational induction expresses an integer multiple of ρ as an integral combination of permutation characters, giving the power identity. It does not remove the possible n_ρ-th root of unity.

Leopoldt's conjecture for E at p; the Fukaya–Kato isomorphism exists.

Q-valued means all character values lie in Q, not merely Q_p. A character of order 3 over Q₇ is Q₇-valued but not Q-valued; rational induction into permutation characters does not apply to that character.

(Burns–Venjakob, Corollary 5.7 and proof, p. 27; rational Artin induction and the shifted determinant convention of §7.13.)

**Checks.**

- Scope: the permutation characters Ind_H 1_H are ℚ-valued, so only ℚ-valued n_ρ·ρ are ℤ-combinations of them; a ℚ_p-valued cubic character (p ≡ 1 mod 3) is not.
- For the trivial character n_ρ=1 and the residue normalization is c_γ⁻¹[D,ζ_D]^*. This agrees with the rank-one Bockstein test, not a formula with c_γ instead of c_γ⁻¹.

*Needs:* §7.13; §7.12.

### 7.15 local ε-isomorphism ε_{p,L}(V) and Fukaya–Kato's local conjecture

Fix t = (t_n) a generator of ℤ_p(1) and ψ_p : ℚ_p → Q̄_p^× with kernel ℤ_p, 1/p^n ↦ t_n. For a de Rham L-representation V of G_{ℚ_p}, with L̃ = Q̂_p^nr ⊗ L, Γ^*(j) = Γ(j) = (j − 1)! for j > 0 and Res_{s=j}Γ(s) = (−1)^(−j)((−j)!)^{−1} for j ≤ 0, h(j) = dim_L gr^jD_dR(V) and Γ_L(V) = ∏_j Γ^*(j)^{−h(−j)}, ε_{p,L}(V) : 1_{L̃} → (d_L(RΓ(ℚ_p, V))d_L(V))_{L̃} is the product of Γ_L(V), η_l(V)·η_l(V^*(1))^* and Fukaya–Kato's ε_dR(V) : 1 → d(V)d(D_dR(V))^{−1} (which involves Deligne's ε(D_pst(V))). Conjecture 6.1 (Fukaya–Kato 3.4.3): for 𝕋 = Λ ⊗ T there is a unique ε_{p,Λ}(𝕋) : 1_{Λ̃} → (d_Λ(RΓ(ℚ_p, 𝕋))d_Λ(𝕋))_{Λ̃} (Λ̃ = W(F̄_p)⟦G⟧) whose base change along each ρ : G → GL_n(O) is ε_{p,L}(T(ρ^*)).

L/ℚ_p finite; V de Rham; the Haar measure and t are fixed and suppressed.

Use `gammaStar` over Q with the same formula and map it to L. Local constants of the Weil–Deligne representation, with the chosen ψ_p and self-dual measure, come from ArithmeticGaloisRepresentations §2.7. The target `localEpsilon_deRham` constructs the η and ε_dR determinant maps using the de Rham/crystalline comparison; `localEpsilon` assembles them. Integral interpolation remains the named conjectural proposition, whereas its base-change identity is part of that proposition. Name the positive-integer comparison `gammaStar_eq_Gamma` and the punctured complex limit at −n `gammaStar_eq_residue` (n≥0).

Use `localEpsilon`, `gammaStar`, `gammaL`, `LocalEpsilonConjecture`, `localEpsilon_baseChange`.

(Burns–Venjakob, §6.1, pp. 28–29, and Conjecture 6.1 (v2).)

**Checks.**

- Γ^*(3) = 2! = 2.
- Γ^*(−2) = (−1)^{−2}/2! = 1/2 = Res_{s=−2}Γ(s).
- V = ℚ_p: h(0) = 1, so Γ_L(V) = Γ^*(0)^{−1} = 1.
- Γ^* is not Γ at j ≤ 0, where Γ has poles; the residue is used instead.
- Γ-factor convention on V = ℚ_p(1): D_dR has one jump at j = −1, so Γ_L(V) = Γ^*(1)^{−1} = 1; on V = ℚ_p it is Γ^*(0)^{−1} = 1.

*Needs:* ArithmeticGaloisRepresentations §2.7; PadicHodgeTheory de Rham/crystalline and Weil–Deligne comparisons; §§2.7, 7.9.

### 7.16 Dabrowski–Panchishkin representations and their Selmer complexes

A representation W of G_ℚ satisfies (DP) if it is de Rham and has a G_{ℚ_p}-subrepresentation Ŵ with the natural map D_dR(Ŵ)→t_p(W):=D_dR(W)/Fil⁰D_dR(W) is an isomorphism; then 0 → Ŵ → W → W̃ → 0 with D⁰_dR(Ŵ) = t_p(W̃) = 0, and Z = W^*(1) satisfies (DP) with Ẑ = W̃^*(1). The Selmer complexes SC_U(Ŵ, W) and SC(Ŵ, W) are the mapping fibres of RΓ(U, W) → RΓ(ℚ_p, W/Ŵ) ⊕ ⊕_{ℓ∈S_f∖S_p}RΓ(ℚ_ℓ, W) (resp. RΓ_{/f}(ℚ_ℓ, W) with RΓ_{/f} = cone(RΓ_f → RΓ)). Conditions: (A1) P_ℓ(W, 1)P_ℓ(Z, 1) ≠ 0 for ℓ ∈ S_f ∖ S_p; (B1) P_p(W, 1)P_p(Z, 1) ≠ 0; (C1) P_p(W̃, 1)P_p(Z̃, 1) ≠ 0 (each with equivalent forms). Lemma 6.2: under (A1) the complexes at ℓ ≠ p are acyclic; under (C1), RΓ_{/f}(ℚ_p, X) ≅ RΓ(ℚ_p, X̃) and RΓ_f(ℚ_p, X) ≅ RΓ(ℚ_p, X̂); under both, SC_U(Ŵ, W) ≅ RΓ_f(ℚ, W).

W a finite-dimensional L-representation of G_{ℚ,S}; P_ℓ(V, u) = det(1 − φ_ℓu | V^{I_ℓ}) (ℓ ≠ p), det(1 − φ_pu | D_cris(V)) (ℓ = p), φ geometric Frobenius.

Use the supplier Selmer mapping-fibre construction and specify these DP local conditions. The targets `dpLocalCondition_comparison` and `selmerComplexU_iso_f` prove Lemma 6.2 with (A1) and (C1); condition (B1) is retained separately for the later denominator. A nonzero Euler factor in (B1) does not imply (C1), as the Tate curve shows.

Use `IsDabrowskiPanchishkin`, `selmerComplexU`, `selmerComplex`, `selmerComplexU_iso_f`, `isDabrowskiPanchishkin_dual`.

(Burns–Venjakob, §6.2, conditions (DP), (A1)–(C3), (27)–(29), Lemma 6.2, pp. 29–30 (v2); Berger, §II.3.3 p.15 and §§II.4.2–II.4.4 pp.17–19, author PDF.)

**Checks.**

- For A with good ordinary reduction, use W=h¹(A)(1)_p≅V_p(A) after polarization, and its ordinary Kummer subrepresentation Ŵ. Do not add a second Tate twist to V_p(A).
- For a split Tate elliptic curve over Q_p, W=V_p(E), Ŵ=Q_p(1), W̃=Q_p and Z=W*(1)≅W. In Berger’s covariant convention D_st(W) has basis x,y with φx=p⁻¹x, φy=y, Nx=0 and Ny=v_p(q)x≠0. Thus D_cris(W)=Q_p x, so P_p(W,1)=P_p(Z,1)=1−p⁻¹≠0 and (B1) holds; W̃=Z̃=Q_p gives P_p(W̃,1)=P_p(Z̃,1)=0, so (C1) fails. The reciprocal Frobenius convention has the same zero/nonzero verdict.
- W = ℚ_p(1): Ŵ = W, W̃ = 0.
- A non-de Rham W does not satisfy (DP).
- For W=Q_p(1), Fil⁰D_dR(W)=0 and t_p(W)=D_dR(W)/Fil⁰ is one-dimensional. The DP condition uses D_dR(Ŵ)→t_p(W), not an equality Fil⁰D_dR(Ŵ)=t_p(W).

*Needs:* SelmerIwasawaCohomology §§2.21–2.23, 3.1–3.3, 3.8–3.15; ArithmeticGaloisDuality; PadicHodgeTheory; §7.15.

### 7.17 Nekovář's p-adic height as a Bockstein map; semisimplicity iff non-degenerate

Nekovář's height h_p(W) : H¹_f(ℚ, W) × H¹_f(ℚ, Z) → L (his h̃_{π,1,1}, agreeing up to sign with Schneider, Perrin-Riou, Mazur–Tate and Zarhin) has adjoint equal to H¹_f(ℚ, W) ≅ H¹(SC_U) →^B H²(SC_U) ≅ H²_f(ℚ, W) ≅ H¹_f(ℚ, Z)^* with B the Bockstein of SC_U(𝕋̂_{cyc,ρ}, 𝕋_{cyc,ρ}) (32)–(33). Descent (Proposition 6.4, Fukaya–Kato 1.6.5): L_n ⊗_{Λ,ρ} commutes with RΓ(U, ·), RΓ_c(U, ·), RΓ(ℚ_ℓ, ·) and SC_U, and with RΓ_f(ℚ_ℓ, ·) for ℓ ∉ Υ ∪ S_p, while SC descends only up to the triangle (34) over ℓ ∈ Υ. Proposition 6.6: under (A1), (C1) and (D2), SC_U(𝕋̂_{cyc,ρ}, 𝕋_{cyc,ρ}) ∈ Σ_ss iff h_p(W) is non-degenerate (F), and then r_Γ(SC_U)=−h and r_Γ(SC_U[1])=h for h=dim_L H¹_f(ℚ,W). The order h belongs to the shifted complex SC_U[1].

W = N_λ = V ⊗ [ρ]^*_λ for a motive M satisfying (DP) and a critical twist; (D2): H⁰_f(ℚ, W) = H⁰_f(ℚ, Z) = 0; Υ the primes ℓ ≠ p of infinite ramification in F_∞. Assume (A1) and (C1) for the Bloch–Kato comparison; the self-dual local conditions and Poitou–Tate comparison identify H²_f(W) with H¹_f(Z)*.

Construct `cyclotomicHeight` by composing the Selmer Bockstein with this duality; prove `cyclotomicHeight_eq_nekovar` with the sign of (32)–(33). This is a target here, rather than an assumed general height theory. Prove `selmerDescent_withRamificationErrors`, retaining the Υ-local triangle, and `height_nondegenerate_iff_semisimple`. A rank-one H¹→H² Bockstein b gives order −1 before shifting and +1 after shifting.

(Burns–Venjakob §6.2, (32)–(35), Propositions 6.4 and 6.6, pp. 31–33; Definition 3.2, p. 9 and Lemma 3.9, pp. 11–12.)

**Checks.**

- If the Bloch–Kato Selmer spaces are zero, the height determinant on rank zero is 1, semisimplicity holds and the order is 0.
- For one-dimensional Selmer spaces and Bockstein b≠0, the height determinant is b and the orders are −1 before shifting, +1 after shifting.
- For a one-dimensional space with Bockstein 0 the height is degenerate and its rational Bockstein complex is not acyclic. Perfectness alone gives no semisimplicity.
- For the abelian-variety setting of BV Example 6.5, retain D1 and D2, while nondegeneracy of the height remains a separate hypothesis; the example does not prove it in general.
- For [R --T→R] in degrees 1,2, H²=R/T and r=−1. Its derived special fiber has H¹=H²=L; taking +dim H¹ as the order of the unshifted complex gives the wrong sign.

*Needs:* §§7.1–7.8, 7.16; ArithmeticGaloisDuality and SelmerIwasawaCohomology Selmer duality/descent.

### 7.18 Critical-motive interpolation on shifted Selmer complexes

Assume W satisfies (A1), (B1), (C1), (D1) and (F), and that ζ_Λ(M) (Conjecture 4.1) and ε_{p,Λ}(𝕋̂) (Conjecture 6.1) exist. Then SC_U(𝕋̂, 𝕋) and SC(𝕋̂, 𝕋) belong to Σ_(ss−ρ), h=dim_L H¹_f(ℚ,W), r_G(SC_U)(ρ)=r_G(SC)(ρ)=−h, and r=r_G(SC_U[1])(ρ)=r_G(SC[1])(ρ)=h, and the leading term 𝓛^*(ρ) (resp. 𝓛_U^*(ρ)) of the Fukaya–Kato p-adic L-function equals (−1)^r·L^*_{K,B}(M(ρ^*))/(Ω_∞(M(ρ^*))R_∞(M(ρ^*)))·Ω_p(M(ρ^*))R_p(M(ρ^*))·Γ(V̂)^{−1}·P_{L,p}(Ŵ^*(1), 1)/P_{L,p}(Ŵ, 1) (38), with L^*_{K,B} truncated at B = Υ ∪ S_p (resp. B = S ∖ S_∞), Ω_∞, R_∞ the archimedean period and regulator (42)–(43), Ω_p the p-adic period (46) and R_p = det h_p(W) (50). In this formula 𝓛_U:1→d(SC_U)⁻¹ is the zeta/epsilon composite of the proof, transported to d(SC_U[1]); likewise for 𝓛 and SC[1]. The symbols 𝓛_U^*,𝓛^* mean these shifted pairs, with boundary +[SC_U],+[SC]. The scalar expression (38) is retained, with its r attached to the shifted complexes.

The hypotheses of §7.17 and of Fukaya–Kato's Conjectures 4.1 and 6.1. Include (D2), the motivic-to-Bloch–Kato Selmer comparison, or supply the named regulator/period comparison proving its equivalence to (D1). Nondegeneracy alone is not that comparison.

Define `archimedeanPeriod` as det(α_N:N_B⁺⊗C→t_N⊗C), and `archimedeanRegulator` as the determinant of the inverse archimedean height map relative to compatible motivic bases. Define `padicPeriod` by the cycle d(Ŵ)→d(D_dR(Ŵ))→d(t_N)→d(N_B⁺)→d(W⁺)→d(Ŵ): its maps are ε_dR⁻¹, the de Rham comparison, the chosen Betti/de Rham bases, the p-adic Betti comparison and β(ρ). Define `padicRegulator` as det(ad h_p(W)) after the motivic-to-Bloch–Kato comparison. Prove `regulatorPeriodComparison` with (D1), (D2) and these comparison hypotheses. Simultaneous basis change cancels between the four scalar factors. The proof then factors the zeta/epsilon composite into the seven determinant terms (44)–(50), retaining the Υ-local error terms and the sign (−1)^h for the shifted pair.

(Burns–Venjakob §6.3, Theorem 6.7, (36)–(50), Remark 6.8 and Example 6.9, pp. 33–36.)

**Checks.**

- When h=0 the empty height determinant is 1 and the sign is +1; the formula retains its periods, Gamma and Euler factors.
- Replacing the Betti basis by a times itself multiplies Ω_∞ and Ω_p by a. Their ratio in the interpolation formula is unchanged.
- If P_p(Ŵ,1)=0, the displayed quotient is undefined. The regular formula requires (B1) and its local consequences; use a specified Laurent factorization as in §7.24 for exceptional factors.
- Remark 6.8: without (B1), replace P_{L,p}(Ŵ, 1) by the leading coefficient of P_{L,p}(Ŵ, p^s) at s = 0 (the exceptional-zero situation).
- Example 6.9: for an elliptic curve and F_∞ = ℚ(E[p^∞]), (38) predicts the leading terms of the CFKSV p-adic L-function 𝓛_E at Artin characters with non-degenerate heights.
- For one Selmer block with special-fiber B¹=b, t(SC_U)=b⁻¹, t(SC_U[1])=b, r(SC_U)=−1 and r(SC_U[1])=1. With global factor A into the inverse line, the shifted leading term is −Ab. Replacing ζ by its inverse would give a different scalar.

*Needs:* §§7.9, 7.15–7.17; de Rham and Betti comparisons; the explicitly assumed motivic finiteness and regulator comparisons.

### 7.19 Orders admitted for noncommutative Fitting invariants

A Fitting order is an o-order Λ in a finite-dimensional separable semisimple algebra A over F=Frac(o), where o is an integrally closed commutative noetherian complete local domain. Thus Λ is a finite torsion-free o-subalgebra with FΛ=A. Fix a containing maximal order Λ′ for computations, retaining its center ζ(Λ′), and the componentwise reduced norm on every matrix algebra over A. A one-dimensional Iwasawa algebra with an open central Γ₀≅Z_p is such an order over o=Z_p[[Γ₀]]. The finite-over-center hypothesis is needed for these reduced norms and Fitting invariants.

o integrally closed, commutative, noetherian, complete and local; Λ finite torsion-free over o; A=F⊗Λ finite-dimensional separable semisimple.

The construction extends to any commutative noetherian complete local domain o using the finite integral closure and the same separable semisimple total quotient, as in Nickel, Remark 2.16; integrally closed o is the standing convention here. Name that scalar comparison `FittingOrder.integralClosure`. The matrix-size-zero norm is 1, fixing the zero-module normalization. Prove independence of the containing maximal order used for these constructions.

Use `FittingOrder.ambient`, `FittingOrder.maximalOrder`, `FittingOrder.reducedNorm`, `FittingOrder.iwasawa`.

(Nickel, Definition 2.1 and Examples 2.3–2.7, pp. 7–8; Remark 2.16, p. 10.)

**Checks.**

- For Λ=M₂(Z₃), take o=Z₃ and A=M₂(Q₃); the reduced norm is the 2×2 determinant.
- For Λ=Z_p[C_p], A=Q_p[C_p] is semisimple despite p dividing the group order; semisimplicity is required over F, not over the residue field.
- For Λ=Z_p[[Z_p]], use o=Λ and A=Frac(Λ); the coefficient domain need not be a DVR.
- An arbitrary higher-dimensional nonabelian Iwasawa algebra is not admitted by the central dimension-one construction.

*Needs:* §3.12; §3.13; IntegralHeckeAndGaloisDeterminants Layer 0.

### 7.20 Integrality ring and denominator ideal

For a Fitting order Λ⊆Λ′⊆A, define I(Λ) as the ζ(Λ)-module generated by nr(H) for square matrices H over Λ of all sizes; it is a commutative order between ζ(Λ) and ζ(Λ′). Let H* be the generalized adjoint computed from the reduced characteristic polynomials of the simple factors, so H*H=HH*=nr(H)I. Define H(Λ)={x∈ζ(Λ): xH* has entries in Λ for every square H over Λ}. It is a central ideal satisfying H(Λ)I(Λ)=H(Λ)⊆ζ(Λ). The central conductor F(Λ)={x∈ζ(Λ′):xΛ′⊆Λ} lies in H(Λ).

The Fitting order hypotheses and its reduced norms; all matrix sizes enter the definitions.

Use `FittingIntegralityRing.mem` (I(Λ) is generated over ζ(Λ) by all square-matrix reduced norms); `GeneralizedAdjoint.mul` (H*H=HH*=nr(H)I over the ambient semisimple algebra); `FittingDenominatorIdeal.mem` (x∈H(Λ) iff x∈ζ(Λ) clears every generalized-adjoint denominator); `FittingDenominatorIdeal.integrality` (H(Λ)I(Λ)=H(Λ) and F(Λ)⊆H(Λ)); `FittingDenominatorIdeal.maximal` (For a maximal order, H(Λ)=I(Λ)=ζ(Λ)).

(Nickel, §2.2 and Example 2.8, pp. 8–9; §3.1, pp. 11–12; Proposition 3.8, p. 13.)

**Checks.**

- For a commutative order, generalized adjoints are ordinary adjugates, so H(Λ)=I(Λ)=Λ.
- For Λ=M₂(Z₃), the center and both auxiliary ideals identify with Z₃.
- For Λ=Z_p[D_(2p)] with p odd, nr(σ+τ)=(1/p)Σ_g g lies in I(Λ) but not ζ(Λ); forcing all norms into the integral center is false.
- For finite Z_p[G], H(Λ)=ζ(Λ) iff p does not divide |G′|, as in Proposition 3.8; this is not the condition p∤|G|.

*Needs:* §7.19; IntegralHeckeAndGaloisDeterminants Layer 0.

### 7.21 Maximal noncommutative Fitting invariant

For a finite presentation Λ^a --h→ Λ^b→M→0 of a left module (row vectors, h acts on the right), put Fitt_Λ(h)=0 if a<b and otherwise take the I(Λ)-ideal generated by reduced norms of all b×b row submatrices. This invariant can depend on the presentation. Define Fitt_Λ^max(M) as the largest such ideal among all finite presentations; it exists by noetherianity and the ability to enlarge presentations. It is an I(Λ)-ideal in ζ(A), not in general an ideal of ζ(Λ). An epimorphism M→N gives Fitt^max(M)⊆Fitt^max(N).

Λ a Fitting order; M finitely presented; matrix convention for left modules as stated.

Prove `NoncommFitting.exists_maximizingPresentation` by enlarging presentations (Theorem 2.13). `NoncommFitting.commutative` compares with Tau Ceti’s `fittingIdeal R M 0`. Changing bases multiplies reduced norms by I(Λ)-units. Isomorphic modules have equal maximal invariants (`NoncommFitting.iso`).

Use `NoncommFitting.ofPresentation`, `NoncommFitting.maximal`, `NoncommFitting.iso`, `NoncommFitting.epimorphism`, `NoncommFitting.commutative`.

(Nickel, §2.3, Example 2.11, Theorem 2.13, Definition 2.14 and Lemma 2.17, pp. 9–11.)

**Checks.**

- For Λ=Z₃ and M=Z₃/9, the maximal invariant is (9); for a free nonzero module it is 0.
- For Λ=M₂(Z₃) and M=0, the identity presentation gives I(Λ)=Z₃. The surjective two-block presentation with blocks [[4,1],[1,4]] and [[5,1],[1,5]] has norms 15,24, giving the smaller presentation invariant 3Z₃.
- For M=0, Fitt^max(M)=I(Λ); maximizing is essential in the preceding matrix example.
- The exact-sequence product inclusion holds, but a general equality for direct sums is not part of this API.

*Needs:* §§7.19–7.20; finite presentations; Tau Ceti `fittingIdeal`; reduced norms of §3.13.

### 7.22 Fitting invariant of a characteristic class

Let Λ be a Fitting order with total quotient A and suppose 0→Λ^b --h→Λ^b→M→0 is exact. Then h is invertible over A, ∂[h]=[M] for the Layer 2 positive boundary, and Fitt_Λ^max(M)=nr(h)I(Λ). More generally any x∈K₁(A) with ∂x=[M] gives Fitt_Λ^max(M)=nr(x)I(Λ), since changing x by K₁(Λ) changes its reduced norm by an I(Λ)-unit. If a zeta element has ∂ζ=−[M], use nr(ζ⁻¹). Equality of the resulting Fitting ideals does not imply equality of boundary classes or zeta elements.

Λ a Fitting order; M has an injective square finite-free presentation. For an arbitrary perfect complex with cohomology in several degrees, first specify the virtual/determinant invariant; this theorem concerns the module M.

(Nickel, Proposition 2.18 and Remark 2.19, p. 11.)

**Checks.**

- For Λ=Z_p[[T]], h=(T), obtain Fitt(Λ/T)=(T), not (T⁻¹).
- Multiplying h by a Λ-invertible matrix changes its norm by an I(Λ)-unit and leaves the Fitting ideal unchanged.
- Equality of fractional ideals permits units of I(Λ) that need not arise from nr K₁(Λ); it is insufficient for equality of relative classes.

*Needs:* §7.21; §2.8; §3.13.

### 7.23 Denominator-corrected Fitting annihilation

For every finitely presented module M over a Fitting order Λ, H(Λ)Fitt_Λ^max(M)⊆Ann_(ζ(Λ))(M). Thus the characteristic-class Fitting formula of §7.22 yields an integral central annihilator only after the stated denominator ideal is applied. For a commutative order H(Λ)=Λ and this reduces to the usual Fitting annihilator inclusion. For noncommutative orders no assertion that the raw reduced norm annihilates M integrally is made.

Λ a Fitting order; M finitely presented; the actual Λ, I(Λ) and H(Λ) are used.

(Nickel, Theorem 3.16, p. 14; Examples 3.9 and 3.18, pp. 13–15.)

**Checks.**

- For Z_p/ p^n, the formula gives (p^n)⊆Ann(M), with equality.
- For Λ=Z_p[G] and augmentation ideal Δ_pG, the source computes Fitt^max(Δ_pG)=(1/|G′|)N_G Z_p, while the denominator-corrected product is N_G Z_p=Ann_(ζΛ)(Δ_pG).
- For G=S₃ and p=3 the raw generator (1/3)N_G is not integral, so an annihilator claim in ζΛ before clearing denominators fails.

*Needs:* §7.20; §7.21; §7.22.

### 7.24 Exceptional Euler factors and Bockstein leading terms

Suppose a representation-specialized characteristic function has a proved Laurent factorization f(T)=E(T)g(T), with E a specified product of local Euler factors and g(T)=T^m u(T), u(0)≠0. Write E(T)=T^e v(T), v(0)≠0. Then ord_T f=e+m and the leading coefficient is v(0)u(0). When the specialized perfect complex is semisimple in the Burns–Venjakob sense, identify this coefficient with its Bockstein determinant, retaining the boundary sign and the Γ-generator logarithmic conversion to an s-derivative. This conditional comparison separates an explicit local zero from any further zero in g; interpolation away from zeros alone supplies neither semisimplicity nor a regulator.

A proved local factorization and orders e,m; leading coefficients nonzero. For the determinant assertion, the source’s semisimplicity, rational acyclicity and chosen Bockstein trivialization hypotheses.

(Burns–Venjakob, Proposition 3.8, pp. 10–11; Remark 3.15 and Proposition 3.16, pp. 13–15; Theorem 6.7, pp. 33–36.)

**Checks.**

- E(T)=1−(1+T)=−T and g(0)=a≠0 give a simple zero with leading coefficient −a; losing the local sign fails.
- For C=[Λ --T→Λ] in degrees −1,0, BV’s characteristic function T⁻¹ has order −1; its shift has order 1 and the inverse leading coefficient, according to the determinant convention.
- If E(T)=−T and g(T)=T u(T), the total order is 2; a single local exceptional factor does not prove the global order is 1.

*Needs:* §7.5; §7.7; §7.17; §5.6.

### Examples

For C=[R --T→ R] in degrees −1,0, the specialized Bockstein is −1. With ch(C,a_ε)=ε/T one has r(C)=−1 and leading term ε(0); shifting and monoidally inverting the trivialization gives r=+1 and leading term ε(0)⁻¹. The extension matrix [[T,1],[0,T]] has cokernel R/(T²): after specialization its Bockstein is zero, so it is not semisimple, although both diagonal blocks are. Direct-sum closure is sufficient for the localized determinant group; extension closure is not asserted for the semisimple subcategory.

For a rank-one Tate descent in degrees 2,3 write its Bockstein as b=−ℓ/c_γ. After shifting, the Bockstein trivialization has scalar b⁻¹=−c_γ/ℓ, the leading-term sign is −1 and the order is −1. With c_γ=5, ℓ=7 and global determinant scalar 11, the leading term is 55/7 and c_γ⁻¹ times it is 11/7. Changing γ to γ² changes the unnormalized leading term and c_γ by the same factor 2, preserving the cyclotomic coefficient. A Selmer block in degrees 1,2 instead has r=−1; its shift has order +1 and trivialization scalar b. For b=7 and scalar 11 the shifted leading term is −77. These computations fix pole versus zero and the shift direction (Burns–Venjakob, Lemma 5.1, pp. 22–24; proof of Theorem 6.7, pp. 34–36).

For Λ=M₂(Z₃), the two-block presentation of zero in §7.21 has determinants 15 and 24, generating 3Z₃. Modulo 3 the row spaces of [[4,1],[1,4]] and [[5,1],[1,5]] are the distinct lines spanned by (1,1) and (2,1); together they generate, so the map is surjective by Nakayama. The identity presentation gives Z₃. Thus the maximal invariant of zero is Z₃, and a single arbitrary presentation is insufficient (Nickel, Example 2.11, p. 9).

### Dependencies

Layers 0–6; perfect-complex determinants and relative K-theory; Selmer mapping fibres and arithmetic duality; ArithmeticGaloisRepresentations §2.7; PadicHodgeTheory de Rham/crystalline comparison; the stated motivic period and regulator hypotheses. Bocksteins precede semisimplicity and leading terms; duality constructs the height; local descent retains ramification error triangles; Fitting invariants require the separate finite-over-center order hypotheses.

## Worked examples

1. **Two denominator sets.** Take G=Γ and H=1. Weierstrass division gives S=Z_p[[T]]∖pZ_p[[T]]: T qualifies because its quotient is Z_p, and p does not. Saturation adds p and gives every nonzero series. Thus Λ_S is the height-one localization at (p), while Λ_{S*} is the fraction field (§§1.1, 1.10–1.11).
2. **An open subgroup need not make the algebra commutative.** With p=5, G=S₃×Z₅ and U=Z₅, coset representatives give six basis elements over Z₅[[T]]. Augmentation in T gives Z₅[S₃], where (12)(123)≠(123)(12). Finite freeness supplies a crossed product, not a commutative series presentation (§0.3).
3. **Integral and mod-p gradings differ.** For odd p, let aba⁻¹=b^{1+p}. With A,B,P the initial forms of a−1,b−1,p, the maximal-ideal graded ring satisfies AB−BA=PB. In the mod-p augmentation filtration the term involving p disappears and the remaining commutator has higher degree. The mod-p polynomial theorem therefore does not give the same integral theorem without the stronger commutator hypothesis (§0.8).
4. **A normalized cocycle can have a carry at inverses.** Let Z=Γ^{p^e}, e>0, and represent Γ/Z by exponents 0,…,p^e−1. The representatives of γ̄ and γ̄⁻¹ add to p^e, so their cocycle value is γ^{p^e}. The inverse of a twisted basis element needs its inverse central carry; normalization at the identity does not remove it (§6.7).
5. **A pole and a nonsemisimple extension.** For C=[R --T→R] in degrees −1,0 with BV characteristic function ε/T, the order is −1 and the leading term is ε(0). Shifting and inverting the determinant trivialization gives order +1 and leading term ε(0)⁻¹. The matrix [[T,1],[0,T]] instead presents R/(T²); its specialized Bockstein is zero between its two surviving one-dimensional groups. Both diagonal blocks are semisimple, but their extension is not (§§2.7–2.8, 7.1–7.4).
6. **The maximal Fitting invariant uses all presentations.** Over M₂(Z₃), stack the blocks [[4,1],[1,4]] and [[5,1],[1,5]]. Their reductions have complementary row lines over F₃, hence the presentation is surjective, with cokernel zero. Its block reduced norms 15 and 24 generate 3Z₃. The identity presentation of zero gives Z₃, which is the maximal invariant. A presentation invariant alone therefore gives the wrong answer (§7.21).
7. **Cyclic overgroups have multiplicity.** In C₉×C₃, P=⟨(3,0)⟩ has the three cyclic overgroups ⟨(1,t)⟩, t∈C₃. Each has cube P. The Weyl group has order 9 and acts trivially. Individual M3 congruences identify each transferred Frobenius component with ζ_P modulo 3. Summing those three components without the proper coefficients would give ζ_P≡3ζ_P≡0, impossible for a unit. This tests the need for the full subgroup Möbius formula (§§6.24–6.25).
8. **A full stabilizer sum.** The subgroup lattice of C₃² has four lines, with Möbius coefficients 1,−1,−1,−1,−1,3. At r=2 its complete stabilizer expression is 2⁹−4·2³+3·2=486=9·54. For a trivial stabilizer the modulus is 1, so no cancellation identity is needed (§6.24).
9. **Shifted determinant scalars.** Take a rank-one Tate block with c_γ=5, logarithmic regulator ℓ=7 and complex leading factor L=11. Its global determinant scalar is Lℓ=77, B²=−7/5, and the shifted trivialization is −5/7. The leading sign −1 gives 55; multiplication by c_γ⁻¹ gives 11. Under γ↦γ² both 55 and c_γ double. A Selmer block with height 7 and global factor 11 has shifted order +1 and leading term −77. These are different shifts and different determinant scalars (§§7.13, 7.18).

## Downstream consumers

Noncommutative main-conjecture applications use the boundary and normalized interpolation together; character values alone retain the stated SK₁ ambiguity. Selmer and equivariant Tamagawa-number applications use the coefficient action, involution, compact-support comparison, cyclotomic height and shifted determinant formula. Integral annihilator applications use the finite-over-center order hypotheses and the denominator ideal, in addition to the characteristic element. The ordinary elliptic example is a specialization; it does not replace these general algebraic constructions.

The named consumer interfaces are:

- CompletedCohomologyPartII consumes the coordinate and homological additions of Layer 0 alongside its own uniformity, locality and filtered-ring theorems.
- ArithmeticLocallySymmetricSpacesPartII consumes rational homological dimension, compact group homology and flat Ore localization (§§0.11, 0.14, 1.12). Its noetherian input remains CompletedCohomologyPartII §5.1.
- GlobalGaloisDeformationsPartII consumes finite-resolution consequences and exterior cohomology (§§0.10, 0.12).
- ModpRepresentationsOfGL2OverLocalFields consumes p-valuations, weighted series and Auslander regularity (§§0.6–0.9); LocallyAnalyticDistributionsPartII consumes the group-side analytic and coordinate interfaces (§§0.1–0.2, 0.5–0.6).
- ScholzeFunctorAndModpCohomologyOfTheLubinTateTower uses the noetherian supplier directly; this package does not own another copy.
- PadicMeasuresIwasawaAlgebras and AutomorphicPadicLFunctions consume the commutative characteristic comparison, Akashi construction and additional normalized abelian/Deligne–Ribet targets (§§2.14, 3.4, 6.1, 6.19–6.22).
- IntegralIwasawaTheory consumes the arithmetic and main-theorem interfaces of Layers 4 and 6, including the abelian minus theorem (§6.36).
- PeriodsAndSpecialValues consumes the global determinant orientation and Tate/local interpolation (§§7.9, 7.13–7.15).
- SelmerIwasawaCohomologyPartII and ModularIwasawaMainConjectures consume the DP Selmer and height/Bockstein interfaces (§§7.16–7.17).

## References

Page numbers refer to the versions linked here; CFKSV, Lazard, Deligne–Ribet and Colmez use printed journal pages. Statements of conjectures are distinguished from theorem targets in the text.

- Ardakov–Brown, [*Ring-theoretic properties of Iwasawa algebras: a survey*](https://arxiv.org/abs/math/0511345), v1, §§2–5.
- Berger, [*An introduction to the theory of p-adic representations*](https://perso.ens-lyon.fr/laurent.berger/articles/article05.pdf), §II.
- Burns–Venjakob, [*On the leading terms of zeta isomorphisms and p-adic L-functions in non-commutative Iwasawa theory*](https://arxiv.org/abs/math/0511672), v2, §§2–6.
- Calegari et al., [*The unbounded denominators conjecture*](https://www.math.uchicago.edu/~fcale/papers/UDC.pdf), §4.5.
- Coates–Fukaya–Kato–Sujatha–Venjakob (CFKSV), [*The GL₂ main conjecture for elliptic curves without complex multiplication*](https://www.numdam.org/item/PMIHES_2005__101__163_0/), §§2–5, pp. 163–208.
- Colmez, [*Résidu en s=1 des fonctions zêta p-adiques*](https://webusers.imj-prg.fr/~pierre.colmez/residu.pdf), §5, pp. 386–388.
- Deligne–Ribet, [*Values of abelian L-functions at negative integers over totally real fields*](https://math.berkeley.edu/~ribet/Articles/deligne-ribet.pdf), (0.1)–(0.5), §§6–8, pp. 227–286.
- Fu, [*Sharp bounds for multiplicities of Bianchi modular forms*](https://arxiv.org/abs/2201.11190), §4, pp. 12–13.
- Gambheera–Popescu, [*An unconditional equivariant main conjecture in Iwasawa theory and applications*](https://arxiv.org/abs/2303.13603), v1, §§2–6.
- Kakde, [*The main conjecture of Iwasawa theory for totally real fields*](https://arxiv.org/abs/1008.0142), v3, §§2–6.
- Lazard, [*Groupes analytiques p-adiques*](https://www.numdam.org/item/10.1007/BF02684303/), Chapters II–V, pp. 5–219.
- Nickel, [*Notes on noncommutative Fitting invariants*](https://www.unibw.de/timor/mitarbeiter/mitarbeiter/univ-prof-dr-andreas-nickel/nickel/fitting-survey.pdf), §§2–3.
- Pstrągowski, [*p-adic analytic groups*](https://www.kurims.kyoto-u.ac.jp/~piotr/291y_notes.pdf), §7.
- Ritter–Weiss, [*On the “main conjecture” of equivariant Iwasawa theory*](https://arxiv.org/abs/1004.2578), v2; [*Congruences between abelian pseudomeasures, II*](https://arxiv.org/abs/1001.2091), v3; [*On uniqueness in equivariant Iwasawa theory*](https://arxiv.org/abs/2608.22601), v1.
- Schneider–Venjakob, [*A splitting for K₁ of completed group rings*](https://arxiv.org/abs/1006.1493), v1; [*K₁ of certain Iwasawa algebras, after Kakde*](https://www.mathi.uni-heidelberg.de/~otmar/papervenjakob/congruences-final.pdf).
- Venjakob, [*On the structure theory of the Iwasawa algebra of a p-adic Lie group*](https://arxiv.org/abs/math/0106269), §§2–3; [*On the work of Ritter and Weiss in comparison with Kakde’s approach*](https://www.mathi.uni-heidelberg.de/~otmar/workshopms/RitterWeiss.pdf).
- Wiles, [*The Iwasawa conjecture for totally real fields*](https://annals.math.princeton.edu/1990/131-3/p02), Theorems 1.3–1.4, pp. 493–540; their normalized application is restated in Kakde §3, p. 14.
- Schneider, *p-adic Lie Groups*, §§26–29, pp. 181–208; Ribes–Zalesskii, *Profinite Groups*, Theorem 7.3.7(a), pp. 265–266. The finite integral logarithm of Oliver–Taylor and the determinant and epsilon formulations of Fukaya–Kato are used in the explicit expositions of Kakde and Burns–Venjakob cited in the relevant subsections; the height comparison follows Burns–Venjakob (32)–(33).
