# Modular Curves, Part II: stages R12.1–R13.2

## Purpose

This document plans part R12.1 of `ModularCurvesPartII`, which runs from the uniformisation of complex elliptic curves and the analytic modular curves (R12.1–R12.6) to generalised elliptic curves and the compactified level moduli stacks over ℤ (R13.1–R13.2).

This first checkpoint plans R13.1 and R13.2 at declaration level from Conrad's *Arithmetic moduli of generalized elliptic curves*. These are the stages that the already-planned part R13.3 (R14.1–R14.2) and the boundary stages R13.3–R13.6 request as the curves X₁(N), X₁(N, p) and X₀(n) over ℤ. R12.1–R12.6 are recorded with the sources to read next.

## Scope and boundaries

RS-06 is accepted and narrows every stage of this part. This checkpoint follows its keeps and suppliers:

- R13.1 constructs generalised elliptic curves, their polygon fibres, the group action on the smooth locus, and contraction with explicit base hypotheses. It reuses the anchor's Weierstrass models (Tau Ceti ModularCurves 1A), the scheme-theoretic group law (1D), Drinfeld level structures (3C), finite locally free group schemes (0B) and FiniteFlatGroupsAndIntegralPadicHodgeTheory R07.1. Compatibility with the smooth elliptic category is proved; generalised curves are not inferred from it.
- R13.2 owns the compactified moduli at the full Γ(N), Γ₁(N), Γ₁(N; n) and Γ₀(n) levels, with properness, flatness and the Deligne–Mumford locus explicit. The open level schemes (3C, 8D, 9D) and the compactified coarse curves over ℤ[1/N] (Layer 10) are imported; agreement on that overlap is proved, not rebuilt.
- Artin stacks over a scheme and their properties are AlgebraicModuliForArithmeticGeometry R09.5.

The boundary (Tate curves, cusps, coarse spaces, bad fibres) is R13.3–R13.6, in part R13.3. The Hecke correspondences are R14.1.

## Conventions

- A curve over S is a separated flat finitely presented morphism with non-empty fibres of pure dimension 1 (Conrad 2.1.1).
- 'DR semistable genus-1' is Deligne–Rapoport's 'stable genus-1': no marked points, and 1-gons are allowed.
- C_n is the standard Néron n-gon, and C₁ ≅ {y²z = x³ − x²z}.
- (N, n) is admissible when ord_p(n) ≤ ord_p(N) for every prime p ∣ gcd(N, n); Γ₁(N; n) is Conrad's notation.
- Drinfeld structures and cyclicity follow Katz–Mazur, with the scheme G^× of ℤ/Nℤ-generators.

## R12.1 Uniformisation of elliptic curves

No nodes yet.

### What is missing

- Not planned in checkpoint 1. The public sources to read next are Darmon–Diamond–Taylor §1.1–1.2 and 1.5 (uniformization, modular curves, S₂ ↔ Ω¹: Lemma 1.12, Theorem 1.33) and Conrad's appendix to Ribet–Stein §5.1; RS-06's keeps for this stage are recorded in RS-06.result.json.

## R12.2 Level structures and quotient identification

No nodes yet.

### What is missing

- Not planned in checkpoint 1. The public sources to read next are Darmon–Diamond–Taylor §1.1–1.2 and 1.5 (uniformization, modular curves, S₂ ↔ Ω¹: Lemma 1.12, Theorem 1.33) and Conrad's appendix to Ribet–Stein §5.1; RS-06's keeps for this stage are recorded in RS-06.result.json.

## R12.3 Cusps and compactification comparison

No nodes yet.

### What is missing

- Not planned in checkpoint 1. The public sources to read next are Darmon–Diamond–Taylor §1.1–1.2 and 1.5 (uniformization, modular curves, S₂ ↔ Ω¹: Lemma 1.12, Theorem 1.33) and Conrad's appendix to Ribet–Stein §5.1; RS-06's keeps for this stage are recorded in RS-06.result.json.

## R12.4 Connectedness and twisted curves

No nodes yet.

### What is missing

- Not planned in checkpoint 1. The public sources to read next are Darmon–Diamond–Taylor §1.1–1.2 and 1.5 (uniformization, modular curves, S₂ ↔ Ω¹: Lemma 1.12, Theorem 1.33) and Conrad's appendix to Ribet–Stein §5.1; RS-06's keeps for this stage are recorded in RS-06.result.json.

## R12.5 Differentials and Hecke normalisation

No nodes yet.

### What is missing

- Not planned in checkpoint 1. The public sources to read next are Darmon–Diamond–Taylor §1.1–1.2 and 1.5 (uniformization, modular curves, S₂ ↔ Ω¹: Lemma 1.12, Theorem 1.33) and Conrad's appendix to Ribet–Stein §5.1; RS-06's keeps for this stage are recorded in RS-06.result.json.

## R12.6 Descent and compatibility statements

No nodes yet.

### What is missing

- Not planned in checkpoint 1. The public sources to read next are Darmon–Diamond–Taylor §1.1–1.2 and 1.5 (uniformization, modular curves, S₂ ↔ Ω¹: Lemma 1.12, Theorem 1.33) and Conrad's appendix to Ribet–Stein §5.1; RS-06's keeps for this stage are recorded in RS-06.result.json.

## R13.1 Generalised elliptic curves

### Objects

#### Definition. Deligne–Rapoport semistable genus-1 curves and the standard Néron n-gons

*Module* `TauCeti/ModularCurves/Generalized/NeronPolygon.lean`. *Node* `ModularCurvesPartII:R13.1/semistable-genus-one-curves-and-neron-polygons`.

A curve over a scheme S is a separated flat finitely presented morphism with non-empty fibres of pure dimension 1. A DR semistable genus-1 curve is a proper curve f : C → S whose geometric fibres are connected and semistable with trivial dualizing sheaf. For n > 1 the standard n-gon C_n over S is obtained from ℙ¹_S × ℤ/nℤ by gluing the ∞-section of ℙ¹ × {i} to the 0-section of ℙ¹ × {i + 1}; ℤ/nℤ acts freely on it, and for d | n there is a finite étale dℤ/nℤ-torsor C_n → C_d. The standard 1-gon C₁ is the quotient C_n/(ℤ/nℤ), independent of n; it is ℙ¹_S with 0 and ∞ glued, and it is isomorphic to the nodal cubic y²z = x³ − x²z. The DR semistable genus-1 curves over an algebraically closed field are exactly the smooth genus-1 curves and the n-gons (n ≥ 1). The set of s ∈ S at which a proper flat finitely presented C → S has a DR semistable genus-1 fibre is open.

*Hypotheses.*

- DR semistable genus-1 curves are Deligne–Rapoport's 'stable genus-1' curves. They are not stable in the Deligne–Mumford sense, since they have no marked points and 1-gons are allowed.
- The gluing construction commutes with base change on S, so C_n is defined over ℤ.
- C₁ is the quotient of C_n by a free action; its existence uses SGA 3 V 4.1, since each orbit lies in an affine open.

*API.*

- `DRSemistableGenusOne` (*structure*) — A proper curve C → S with connected semistable geometric fibres of trivial dualizing sheaf.
- `neronPolygon` (*constructor*) — C_n over S, from ℙ¹ × ℤ/nℤ by gluing ∞_i to 0_{i+1}.
- `neronPolygon_torsor` (*characterisation*) — For d | n, C_n → C_d is a finite étale dℤ/nℤ-torsor.
- `neronOneGon_iso_nodalCubic` (*equivalence*) — C₁ ≅ {y²z = x³ − x²z}.
- `isOpen_semistableGenusOneLocus` (*characterisation*) — The DR semistable genus-1 locus of a proper flat f.p. family is open.
- `classification_algClosed` (*characterisation*) — Over k = k̄: smooth genus 1 or C_n for some n ≥ 1.

*Used by.*

- `ModularCurvesPartII:R13.1/generalized-elliptic-curve` — the underlying curve of a generalized elliptic curve
- `ModularCurvesPartII:R13.1/contraction-away-from-a-divisor` — contraction stays in the class
- `ModularCurvesPartII:R13.2/moduli-stacks-are-proper-flat-artin` — universally embedded families via O(3D)

*Unit tests.* A wrong definition fails one of these.

- `neronOneGon_nodal` (value) — C₁ is the nodal cubic y² = x³ − x² (the parametrisation identity).
- `neronPolygon_components` (value) — C_n has n components and smooth locus 𝔾_m × ℤ/nℤ.
- `not_semistable_cuspidal` (non-example) — The cuspidal cubic y² = x³ is not DR semistable: its singularity is not a node.
- `semistable_smooth_genus_one` (degenerate) — A smooth proper genus-1 curve with geometrically connected fibres is DR semistable.

*Construction.*

1. Well-definedness of C_n: gluing finitely many copies of ℙ¹ along disjoint sections, compatibly with base change.
2. C₁: SGA 3 Exp. V Thm. 4.1 gives the quotient C_n → C_{1,n} as a finite étale ℤ/nℤ-torsor, compatible with base change; the torsor maps C_n → C_d identify all C_{1,n}.
3. Nodal cubic: t ↦ (t² + 1, t(t² + 1)) sends 0 and ∞ to the same point and factors through C₁, giving C₁ ≅ {y²z = x³ − x²z}.
4. Classification over an algebraically closed field and openness: Deligne–Rapoport II 1.2, 1.3 and 1.5 (request to the anchor and to AlgebraicModuliForArithmeticGeometry for the curve-theoretic inputs).

*Acceptance.*

- The map t ↦ (t² + 1, t(t² + 1)) satisfies y² = x³ − x²: t²(t² + 1)² = (t² + 1)³ − (t² + 1)².
- C_n has n irreducible components, each ℙ¹, and n nodes; its smooth locus is 𝔾_m × ℤ/nℤ.

*Uses.* `AlgebraicModuliForArithmeticGeometry:R09.5`.

*Sources.*

- Arithmetic moduli of generalized elliptic curves, §2.1, Definition 2.1.2, p. 4: “A Deligne–Rapoport (DR) semistable genus-1 curve over S is a proper curve f : C →S such that the geometric ﬁbers are connected and semistable with trivial dualizing sheaf.” The definition.
- Arithmetic moduli of generalized elliptic curves, §2.1, p. 5: “The map t 7→(t2 + 1, t(t2 + 1)) from P1 to the nodal plane curve y2z = x3 −x2z factorizes through C1 and induces an isomorphism between C1 and this nodal cubic.” The 1-gon as the nodal cubic.

#### Definition. Generalized elliptic curves (E, +, e) and their morphisms

*Module* `TauCeti/ModularCurves/Generalized/Basic.lean`. *Node* `ModularCurvesPartII:R13.1/generalized-elliptic-curve`.

A generalized elliptic curve over S is (E, +, e): E a DR semistable genus-1 curve, + : E^{sm} ×_S E → E an S-morphism and e ∈ E^{sm}(S) such that + restricts to a commutative group scheme structure on E^{sm} with identity e, and + is an action of E^{sm} on E under which, on singular geometric fibres, translation by each rational point of the smooth locus rotates the graph of irreducible components. A morphism E → E′ is an S-map carrying E^{sm} into E′^{sm} and inducing a group map on smooth loci. The standard n-gon with + induced from (𝔾_m × ℤ/nℤ) × (ℙ¹ × ℤ/nℤ) → ℙ¹ × ℤ/nℤ is a generalized elliptic curve. Over an algebraically closed field a generalized elliptic curve is an elliptic curve or a standard n-gon, and Aut(C_n) = ⟨inv⟩ ⋉ μ_n. For a finite subgroup G ⊆ E^{sm} meeting the identity component trivially on non-smooth geometric fibres, E/G is again a generalized elliptic curve.

*Hypotheses.*

- The rotation condition forces the component group of E_s^{sm} to be cyclic on singular geometric fibres.
- A morphism is automatically equivariant for the E^{sm}-actions (universal schematic density of E^{sm}).
- Quotients E/G need G to meet the identity component trivially on non-smooth fibres (hence étale there). Otherwise E → E/G is not flat and E/G is not DR semistable (Conrad's Example 2.1.6).
- Compatibility with the smooth category: a generalized elliptic curve with smooth fibres is an elliptic curve in the sense of Tau Ceti ModularCurves Layer 1 (1D, the scheme-theoretic group law), as RS-06 requires.

*API.*

- `GeneralizedEllipticCurve` (*structure*) — (E, +, e) over S with the group and rotation conditions.
- `GeneralizedEllipticCurve.smoothLocus` (*projection*) — E^{sm}, a commutative S-group.
- `GeneralizedEllipticCurve.Hom` (*structure*) — S-maps preserving smooth loci and inducing group maps.
- `GeneralizedEllipticCurve.ofEllipticCurve` (*coercion*) — An elliptic curve (Tau Ceti ModularCurves 1D) is a generalized elliptic curve.
- `neronPolygon_generalizedElliptic` (*instance*) — C_n with (2.1.2) is a generalized elliptic curve.
- `aut_neronPolygon` (*characterisation*) — Aut(C_n) ≅ ⟨inv⟩ ⋉ μ_n.
- `GeneralizedEllipticCurve.quotient` (*constructor*) — E/G for G meeting the identity component trivially on non-smooth fibres.

*Used by.*

- `ModularCurvesPartII:R13.2/gamma-level-structures` — level structures live on E^{sm}
- `ModularCurvesPartII:R13.1/non-smooth-locus-and-base-change` — S^∞ for a generalized elliptic curve
- `ModularCurvesPartII:R13.3` — Tate generalized elliptic curves at the cusps

*Unit tests.* A wrong definition fails one of these.

- `aut_neronPolygon_order` (value) — Over k̄ with char k ∤ n, #Aut(C_n) = 2n.
- `neronOneGon_smoothLocus` (value) — C₁^{sm} ≅ 𝔾_m as groups.
- `generalizedElliptic_of_smooth` (compatibility) — A generalized elliptic curve with smooth geometric fibres is an elliptic curve.
- `not_generalizedElliptic_twisted_two_gon` (non-example) — Conrad's Example 2.1.11 with Remark 2.1.13: a twisted 2-gon over a local artin ring, with singularities tt′ = a and uu′ = a′ for suitable a, a′, is DR semistable but carries no generalized elliptic structure, even fpqc-locally.

*Construction.*

1. Well-definedness: the conditions are fibrewise and closed under base change.
2. Standard n-gon: the 𝔾_m × ℤ/nℤ action descends to (2.1.2), compatibly with base change and with change of n.
3. Automorphisms of C_n: Deligne–Rapoport II 1.10. inv extends inversion on C_n^{sm}; μ_n acts on the i-th component by t ↦ ζ^i t.
4. Classification over k̄: Deligne–Rapoport II 1.15.
5. Quotients: under the hypothesis G acts freely on E, and the quotient inherits the group law.

*Acceptance.*

- Over k̄ with char k ∤ n, Aut(C_n) has order 2n.
- The 1-gon's smooth locus is 𝔾_m, with the group law of multiplication.

*Uses.* `ModularCurvesPartII:R13.1/semistable-genus-one-curves-and-neron-polygons`.

*Planet:* Generalized elliptic curve.

*Sources.*

- Arithmetic moduli of generalized elliptic curves, §2.1, Definition 2.1.4, p. 5: “A generalized elliptic curve over S is a triple (E, +, e) where E is a DR semistable genus-1 curve, + : Esm ×S E →E is an S-morphism, and e ∈Esm(S) is a section such that” The definition, with the two conditions after it.
- Arithmetic moduli of generalized elliptic curves, §2.1, Example 2.1.5, p. 5: “the automorphism functor of the standard n-gon Cn as a generalized elliptic curve is ⟨inv⟩⋉µn” The automorphisms of C_n.

#### Construction. Contraction of a DR semistable genus-1 curve away from a relative Cartier divisor in the smooth locus

*Module* `TauCeti/ModularCurves/Generalized/Contraction.lean`. *Node* `ModularCurvesPartII:R13.1/contraction-away-from-a-divisor`.

Let C be a DR semistable genus-1 curve over S and D ⊂ C^{sm} a relative effective Cartier divisor finite over S. There is a DR semistable genus-1 curve C̄ with a proper S-map u : C → C̄ contracting exactly the geometric fibral components disjoint from D. It is unique up to unique isomorphism and compatible with base change, and u is an isomorphism over C̄^{sm}. It is functorial for automorphisms of C preserving D. If C is a generalized elliptic curve and D a subgroup of C^{sm}, then C̄ has a unique generalized elliptic curve structure making u a group map on u^{−1}(C̄^{sm}), and D ⊂ C̄ is S-ample.

*Hypotheses.*

- C̄ may have automorphisms over C, so the uniqueness is of the pair (C̄, u).
- Contraction is how level structures are made ample: each Γ-structure's divisor must meet every component (node gamma-level-structures).

*API.*

- `contraction` (*constructor*) — (C̄, u : C → C̄) contracting the components disjoint from D.
- `contraction_unique` (*extensionality*) — Any two contractions are uniquely isomorphic under C.
- `contraction_baseChange` (*compatibility*) — Contraction commutes with base change on S.
- `contraction_iso_smooth` (*characterisation*) — u is an isomorphism over C̄^{sm}.
- `contraction_generalizedElliptic` (*constructor*) — For D a subgroup, C̄ is a generalized elliptic curve and u a group map.

*Used by.*

- `ModularCurvesPartII:R13.1/drinfeld-structures-and-cyclicity` — reduce to ample G
- `ModularCurvesPartII:R13.2/contraction-maps-between-levels` — the maps (E; P, Q) ↦ (c(E), P)

*Unit tests.* A wrong definition fails one of these.

- `contraction_of_ample` (degenerate) — If D meets every component of every geometric fibre, u is an isomorphism.
- `contraction_polygon_to_one_gon` (value) — C_n contracted away from D ⊂ identity component is C₁.
- `contraction_divisor_ample` (compatibility) — D is S-ample on C̄.
- `not_contraction_group_nonsubgroup` (non-example) — If D is not a subgroup, C̄ carries no induced generalized elliptic structure compatible with u in general (the uniqueness clause needs D ⊂ C^{sm} a subgroup).

*Construction.*

1. Existence and uniqueness: Deligne–Rapoport IV 1.2 (request to AlgebraicModuliForArithmeticGeometry R09.5 for the contraction of semistable curves).
2. Base change: from uniqueness.
3. Functoriality: C̄^{sm} ⊂ C̄ is universally schematically dense, so an automorphism α with α(D) = D descends uniquely.
4. Group structure: node deligne-rapoport-structure-criterion applied to D acting on C̄.

*Acceptance.*

- Contracting an n-gon away from a divisor meeting only the identity component gives the 1-gon.
- If D meets every component, u is an isomorphism.

*Uses.* `ModularCurvesPartII:R13.1/semistable-genus-one-curves-and-neron-polygons`, `ModularCurvesPartII:R13.1/deligne-rapoport-structure-criterion`, `AlgebraicModuliForArithmeticGeometry:R09.5`.

*Sources.*

- Arithmetic moduli of generalized elliptic curves, §2.1, p. 7: “that contracts all geometric ﬁbral irreducible components that are disjoint from D. This “contraction away from D” is unique up to unique isomorphism” Existence and uniqueness of the contraction.
- Arithmetic moduli of generalized elliptic curves, §2.1, p. 7: “In particular, if C is a generalized elliptic curve and D is a subgroup of Csm then C has a unique structure of generalized elliptic curve” The induced generalized elliptic structure on the contraction.

#### Definition. Drinfeld structures, cyclic subgroups and standard cyclic subgroups on generalized elliptic curves

*Module* `TauCeti/ModularCurves/Generalized/Cyclic.lean`. *Node* `ModularCurvesPartII:R13.1/drinfeld-structures-and-cyclicity`.

Let E be a generalized elliptic curve over S. A finite locally free closed subgroup G ⊆ E^{sm} of constant order N is cyclic if fppf-locally it has a ℤ/Nℤ-generator (Katz–Mazur). (Theorem 2.3.2) If P is a ℤ/Nℤ-structure on E^{sm} then (N/d)P is a ℤ/dℤ-structure for d | N. If {P, Q} is a Drinfeld ℤ/Nℤ-basis of E^{sm}[N] then P is a ℤ/Nℤ-structure and {(N/d)P, (N/d)Q} a Drinfeld ℤ/dℤ-basis. (Theorem 2.3.5, Definition 2.3.6) For G cyclic of order N and d | N, the subgroups generated by (N/d)P for all generators P coincide: the standard cyclic subgroup G_d. (Theorem 2.3.7) G is cyclic if and only if its scheme G^× of ℤ/Nℤ-generators is finite locally free of rank φ(N). (Corollary 2.3.8) If N is squarefree, every finite locally free subgroup of order N is cyclic.

*Hypotheses.*

- Katz–Mazur prove these for elliptic curves using p-divisible groups and quotients by non-étale subgroups. For generalized elliptic curves new proofs are needed. RS-06 makes the anchor's Drinfeld levels (Tau Ceti ModularCurves 3C) the starting case.
- φ(N) = deg Φ_N, and μ_N^× = Spec ℤ[T]/Φ_N(T).
- The standard subgroup G_d is well defined only because of Theorem 2.3.5; different generators give the same subgroup.

*API.*

- `IsCyclicSubgroup` (*data*) — G ⊆ E^{sm} of order N is cyclic: fppf-locally a ℤ/Nℤ-generator exists.
- `generatorScheme` (*constructor*) — G^×, the scheme of ℤ/Nℤ-generators, finite and finitely presented.
- `isCyclic_iff_generatorScheme` (*characterisation*) — IsCyclic G ↔ G^× finite locally free of rank φ(N).
- `standardSubgroup` (*constructor*) — G_d ⊆ G for d | N, generated by (N/d)P for any generator P.
- `drinfeldStructure_divisor` (*relation*) — P a ℤ/Nℤ-structure ⇒ (N/d)P a ℤ/dℤ-structure.
- `isCyclic_of_squarefree` (*characterisation*) — Squarefree order ⇒ cyclic.

*Used by.*

- `ModularCurvesPartII:R13.2/gamma-level-structures` — Γ₁(N; n)-structures use cyclic C and its standard subgroups
- `ModularCurvesPartII:R13.2/moduli-stacks-are-proper-flat-artin` — the covering M̃_{Γ₁(N;n)} → M_{Γ₁(N;n)} of rank φ(n)

*Unit tests.* A wrong definition fails one of these.

- `generatorScheme_mu` (value) — For G = μ_N: G^× = Spec ℤ[T]/Φ_N(T), of rank φ(N) = deg Φ_N.
- `isCyclic_prime_order` (degenerate) — Every finite locally free subgroup of prime order is cyclic.
- `not_isCyclic_klein` (non-example) — For an elliptic curve over a field of characteristic ≠ 2, E[2] ≅ (ℤ/2)² is étale of order 4 but not cyclic: an étale group is cyclic exactly when it is abstractly cyclic, and E[2] has no point of order 4. By contrast, in characteristic p the extension of ℤ/p by μ_p on a polygon is cyclic of order p², the case behind the non-Deligne–Mumford cusps.
- `standardSubgroup_indep` (compatibility) — G_d does not depend on the chosen generator P (Theorem 2.3.5).

*Construction.*

1. Reduce to S artin local with algebraically closed residue field (the loci in question are represented by closed subschemes [KM 1.3.7]), and by primary decomposition [KM 1.7.3] to N = p^r with p the residue characteristic.
2. Non-smooth case of 2.3.2: G is an extension of a cyclic constant group by a connected multiplicative group. Either the connected–étale sequence with Lemma 2.3.1 applies, or G ≅ μ_{p^r}, where Φ_{p^r}(b) = 0 ⇒ Φ_{p^{r−1}}(b^p) = 0. For bases: after a flat base change E^{sm}[p^r] is the p^r-torsion of an elliptic curve [KM 8.10.7].
3. 2.3.5: by contraction assume G ample; if the closed fibre is a p^s-gon, p^sP and p^sP′ generate the same μ_{p^{r−s}} (Corollary 2.3.3), and the quotients agree.
4. 2.3.7: fibral rank φ(N) by embedding E^{sm}_k into a polygon and then into an elliptic curve's N-torsion. Flatness: valuative criterion over reduced bases, and over artin bases by realising the situation over the reduced universal deformation ring W[[t]] of the 1-gon E/H.
5. 2.3.8: reduce to prime order p; μ_p^× is flat of rank p − 1, and α_p-deformations occur only on elliptic curves [KM 6.8.7].

*Acceptance.*

- G = μ_{p^r} ⊂ C_n^{sm}: G^× = Spec ℤ[T]/Φ_{p^r}(T) of rank φ(p^r) = p^{r−1}(p − 1).
- N = 6 (squarefree): every order-6 finite locally free subgroup is cyclic.

*Uses.* `ModularCurvesPartII:R13.1/generalized-elliptic-curve`, `ModularCurvesPartII:R13.1/contraction-away-from-a-divisor`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1`, `mathlib:Polynomial.natDegree_cyclotomic`.

*Planet:* Cyclicity criterion.

*Sources.*

- Arithmetic moduli of generalized elliptic curves, §2.3, Definition 2.3.4, p. 12: “A ﬁnite locally free closed subgroup scheme G ⊆Esm with constant order N is cyclic if it admits a Z/NZ-generator fppf-locally on S.” Cyclic subgroups.
- Arithmetic moduli of generalized elliptic curves, §2.3, Theorem 2.3.7, p. 13: “The subgroup G is cyclic if and only if its scheme G× of Z/NZ-generators is ﬁnite locally free over S with rank φ(N).” The cyclicity criterion.
- Arithmetic moduli of generalized elliptic curves, §2.3, Corollary 2.3.8, p. 14: “If the order of G is squarefree then G is cyclic.” Squarefree order.

### Theorems

#### Theorem. The locus of non-smoothness S^∞ of a generalized elliptic curve: local polygon structure and base change

*Module* `TauCeti/ModularCurves/Generalized/Basic.lean`. *Node* `ModularCurvesPartII:R13.1/non-smooth-locus-and-base-change`.

For a proper curve f : C → S, C^{sing} has the closed subscheme structure given by the first Fitting ideal of Ω¹_{C/S}, and S^{∞,f} is its scheme-theoretic image. For f : E → S a generalized elliptic curve, S^{∞,f} is a locally finite disjoint union of open subschemes S^{∞,f}_n over which E is fppf-locally the standard n-gon (Lemma 2.1.10), and the formation of S^{∞,f} ⊆ S commutes with arbitrary base change (Theorem 2.1.12).

*Hypotheses.*

- For arbitrary DR semistable genus-1 curves, T^{∞,f_T} ⊆ S^{∞,f} ×_S T can be a strict inclusion of subschemes; Conrad's Example 2.1.11 is such a case. Base change compatibility is special to generalized elliptic curves.
- The equality is of subschemes, not just of underlying sets.

*Proof.*

1. Lemma 2.1.10 is Deligne–Rapoport II 1.15: fppf-locally on S^{∞,f}, E is the standard n-gon with locally constant n.
2. Theorem 2.1.12: if (2.1.3) is not an isomorphism, it stays so after an fppf cover of S^{∞,f} ×_S T. There E is a standard polygon, for which S^∞ = S (Example 2.1.9, from the local form xy = a in Example 2.1.7). Contradiction.

*Acceptance.*

- For the standard n-gon over any S, S^∞ = S.
- For the Tate curve over ℤ[[q]], S^∞ = V(q) (the cusp), stable under base change.

*Uses.* `ModularCurvesPartII:R13.1/generalized-elliptic-curve`.

*Sources.*

- Arithmetic moduli of generalized elliptic curves, §2.1, Theorem 2.1.12, p. 6: “The formation of the closed subscheme S∞,f ,→S is compatible with base change on S.” The base change theorem.
- Arithmetic moduli of generalized elliptic curves, §2.1, Lemma 2.1.10, p. 6: “is a locally ﬁnite (in S) disjoint union of open subschemes S∞,f n such that the generalized elliptic curve E is isomorphic to the standard n-gon fppf-locally over S∞,f n .” The local polygon structure.

#### Theorem. Deligne–Rapoport's criterion for a generalized elliptic structure, and its divisor form

*Module* `TauCeti/ModularCurves/Generalized/Contraction.lean`. *Node* `ModularCurvesPartII:R13.1/deligne-rapoport-structure-criterion`.

Let f : C → S be a DR semistable genus-1 curve, e ∈ C^{sm}(S), G a commutative flat S-group locally of finite presentation acting on C, trivially on Pic⁰_{C/S} and transitively on the components of each geometric fibre. Then C has a unique generalized elliptic structure with identity e in which g ∈ G(T) acts by translation by g(e), and any automorphism commuting with G is a translation (Theorem 2.2.2). Corollary 2.2.3: for D ⊂ C^{sm} an S-ample relative effective Cartier divisor with a commutative group structure and an action on C extending it, this extends to a generalized elliptic structure if and only if D acts trivially on Pic⁰_{C/S}. Then the structure is unique, and the triviality can be checked on geometric fibres; the good locus is open and closed in S.

*Hypotheses.*

- Pic⁰_{C/S} (degree 0 on each component) is a semi-abelian algebraic space group over S. That it is a scheme (Deligne) is not needed.
- For any generalized elliptic curve E, the action of E^{sm} on Pic⁰_{E/S} is trivial (Deligne–Rapoport II 1.13); the criterion is its converse.

*Proof.*

1. Theorem 2.2.2 is Deligne–Rapoport II 3.2 (request).
2. Corollary 2.2.3: ampleness of D makes D(s) transitive on components; apply 2.2.2 with G = D.
3. Openness and closedness of the trivial-action locus: the universal action is an endomorphism of the semi-abelian space A_G over G, and Lemma 2.2.1 (the locus where two endomorphisms agree is open and closed) gives V ⊆ G; its complement's image is open and closed.

*Acceptance.*

- For C = C_n and D = μ_n × ℤ/nℤ acting by (2.1.2), the criterion recovers the standard structure.
- The twisted 2-gons of Example 2.1.11 carry no generalized elliptic structure (Remark 2.1.13), so no D on them satisfies the criterion.

*Uses.* `ModularCurvesPartII:R13.1/semistable-genus-one-curves-and-neron-polygons`, `AlgebraicModuliForArithmeticGeometry:R09.5`.

*Sources.*

- Arithmetic moduli of generalized elliptic curves, §2.2, Theorem 2.2.2, p. 8: “There exists a unique generalized elliptic curve structure on C with identity section e such that each g ∈G(T) acts on C/T via translation by g(e) ∈Csm(T) for all S-schemes T.” The criterion.
- Arithmetic moduli of generalized elliptic curves, §2.2, Corollary 2.2.3, p. 8: “This extends to a generalized elliptic curve structure on C if and only if the natural induced action of D on the algebraic space Pic0 C/S is trivial” The divisor form used for moduli.

### What is missing

- Degeneration operations beyond contraction (e.g. the Tate curve as a degeneration) are R13.3's.
- The Deligne–Rapoport inputs (DR II 1.2–1.15, 3.2; IV 1.2) are requested, not re-proved; Deligne–Rapoport is not public.

## R13.2 Compactified level moduli

### Objects

#### Definition. Γ₁(N)-, Γ(N)- and Γ₁(N; n)-structures on generalized elliptic curves, and Γ₀(n)-structures

*Module* `TauCeti/ModularCurves/Generalized/LevelStructure.lean`. *Node* `ModularCurvesPartII:R13.2/gamma-level-structures`.

For a generalized elliptic curve E → S: a Γ₁(N)-structure is P ∈ E^{sm}(S) with NP = 0 such that D = Σ_{j∈ℤ/N}[jP] is a subgroup scheme meeting every irreducible component of every geometric fibre (an ample Drinfeld ℤ/Nℤ-structure). A Γ(N)-structure is (P, Q) with Σ_{i,j}[iP + jQ] a subgroup killed by N (so equal to E^{sm}[N]) meeting every component. For N, n with ord_p(n) ≤ ord_p(N) for all p | gcd(N, n), a Γ₁(N; n)-structure is (P, C): P a Drinfeld ℤ/Nℤ-structure, C ⊂ E^{sm} cyclic of order n, Σ_j (jP + C) meeting every component, and Σ_{j∈ℤ/p^e}(j(N/p^e)P + C[p^e]) = E^{sm}[p^e] for p | gcd(N, n), e = ord_p(n). Γ₀(n)-structures are Γ₁(1; n)-structures, i.e. S-ample cyclic subgroups of order n. Then Σ_j (jP + C) is a subgroup scheme of E^{sm} (Theorem 2.4.5).

*Hypotheses.*

- Ampleness (meeting every component) forces singular geometric fibres of a Γ₁(N)-structure to be d-gons for d | N, and those of a Γ(N)-structure to be N-gons.
- The p-condition (2.4.4) is equivalent to the single condition at d = gcd(N, n) (Lemma 2.4.4). It says that {(N/d′)P, (n/d′)Q} is a Drinfeld basis of E^{sm}[d′] for every d′ | d, where Q generates C.
- The restriction ord_p(n) ≤ ord_p(N) is part of the definition; Γ₁(1; n) (N = 1) covers all Γ₀(n).
- On elliptic curves these are Katz–Mazur's Drinfeld level structures (Tau Ceti ModularCurves 3C, 8D), which the definition extends to the boundary.

*API.*

- `Gamma1Structure` (*structure*) — An ample Drinfeld ℤ/Nℤ-structure P on E^{sm}.
- `GammaStructure` (*structure*) — An ample Drinfeld ℤ/Nℤ × ℤ/Nℤ-structure (P, Q) with ⟨P, Q⟩ = E^{sm}[N].
- `Gamma1NnStructure` (*structure*) — (P, C) as in Definition 2.4.3, for admissible (N, n).
- `Gamma0Structure` (*coercion*) — Γ₀(n) := Γ₁(1; n): an S-ample cyclic subgroup of order n.
- `Gamma1NnStructure.divisor_isSubgroup` (*characterisation*) — Σ_j (jP + C) is a subgroup of E^{sm} (Theorem 2.4.5).
- `Gamma1NnStructure.condition_at_gcd` (*equivalence*) — (2.4.4) for all p ↔ (2.4.5) at d = gcd(N, n).
- `AdmissibleLevel` (*data*) — (N, n) admissible: ord_p(n) ≤ ord_p(N) for all p | gcd(N, n).

*Used by.*

- `ModularCurvesPartII:R13.2/moduli-stacks-are-proper-flat-artin` — the moduli problems M_Γ
- `ModularCurvesPartII:R14.1/degeneracy-maps-and-hecke-correspondence` — X₁(N, p) = M_{Γ₁(N; p)}

*Unit tests.* A wrong definition fails one of these.

- `admissibleLevel_N_one` (degenerate) — (1, n) is admissible for every n (Γ₀(n)).
- `not_admissibleLevel_p_psq` (non-example) — (p, p²) is not admissible: ord_p(p²) = 2 > 1 = ord_p(p).
- `gamma1_singular_fibres` (value) — The singular geometric fibres of a Γ₁(N)-structure are d-gons with d | N.
- `gamma1N1_eq_gamma1` (compatibility) — Γ₁(N; 1)-structures are Γ₁(N)-structures.

*Construction.*

1. Well-definedness: each condition is representable by a closed subscheme of the base [KM 1.3.7].
2. Lemma 2.4.4: primary decomposition of generators [KM 1.7.3], and Theorem 2.3.2(2) for the divisor d′.
3. Theorem 2.4.5: reduce to artin local base and N = p^r, n = p^e. For elliptic closed fibre use [KM 5.5.2, 5.5.7] to show {P, Q} is a ℤ/p^r × ℤ/p^e-structure. For polygon closed fibre, C is étale and splits the connected–étale sequence; pass to the universal deformation over a reduced base of characteristic 0.

*Acceptance.*

- N = 1: a Γ₁(1)-structure is P = e, and D = [e] meets every component only for smooth or 1-gon fibres.
- Γ₀(p) over 𝔽_p: on a supersingular elliptic curve the unique subgroup of order p (ker F) is a Γ₀(p)-structure.

*Uses.* `ModularCurvesPartII:R13.1/drinfeld-structures-and-cyclicity`.

*Sources.*

- Arithmetic moduli of generalized elliptic curves, §2.4, Definition 2.4.1, p. 14: “A Γ1(N)-structure on E/S is an ample Drinfeld Z/NZ-structure on the smooth separated group scheme Esm” Γ₁(N)-structures.
- Arithmetic moduli of generalized elliptic curves, §2.4, Definition 2.4.3, p. 14: “A Γ1(N; n)-structure on E/S is a pair (P, C) where” Γ₁(N; n)-structures; the conditions follow.
- Arithmetic moduli of generalized elliptic curves, §2.4, Theorem 2.4.5, p. 15: “If (E; P, C) is a Γ1(N; n)-structure over a scheme S, then the relative eﬀective Cartier divisor D = P j∈Z/NZ(jP + C) is a subgroup scheme in Esm.” The divisor is a subgroup.

### Theorems

#### Theorem. The moduli stacks M_Γ are proper flat CM Artin stacks of relative dimension 1, Deligne–Mumford in the stated cases

*Module* `TauCeti/ModularCurves/Generalized/Stack.lean`. *Node* `ModularCurvesPartII:R13.2/moduli-stacks-are-proper-flat-artin`.

For Γ ∈ {Γ(N), Γ₁(N; n)}, the stack M_Γ of Γ-structures on generalized elliptic curves is an Artin stack of finite type over ℤ (Theorem 3.1.4) and proper over ℤ (Theorem 3.2.7). M_{Γ(N)} is Deligne–Mumford and smooth over ℤ[1/N]. M_{Γ₁(N;n)} is smooth over ℤ[1/Nn], and Deligne–Mumford away from the degenerate triples in characteristic p whose p-part of C is non-étale and disconnected (possible iff p² | n); so it is Deligne–Mumford iff n is squarefree. M_Γ → Spec ℤ is flat and CM of pure relative dimension 1 (Theorem 3.3.1). The closed substack M_Γ^∞ (degenerate objects) is a relative effective Cartier divisor, and M_Γ is regular (Theorem 4.1.1). M_{Γ₁(N;n)} has geometrically connected fibres over ℤ (Theorem 4.2.1(1)).

*Hypotheses.*

- Artin stacks are in the sense of Laumon–Moret-Bailly, over Spec ℤ. The Isom-functors of generalized elliptic curves are quasi-finite separated and finitely presented (Theorem 3.1.2), and of Γ-structures finite (Theorem 3.2.2).
- M_{Γ₁(N;n)} is genuinely not Deligne–Mumford when p² | n (the cusps in characteristic p); the enhanced stack M̃_{Γ₁(N;n)} (pairs (P, Q) with Q generating C) is Deligne–Mumford and finite locally free of rank φ(n) over it.
- RS-06: import the anchor's open level schemes and the prime-N ≥ 5 diamond-quotient compactification over ℤ[1/N]; agreement in that overlap is node agreement-with-katz-mazur-schemes.

*Proof.*

1. Artin property (3.1.4): universally embedded families (f, D, ι, ρ) with ι : f_*O(3D) ≅ O^{3d}, representable by a quasi-projective scheme (Lemma 3.1.5, via Lemma 2.4.7); the Γ-structure locus is cut out using Corollary 2.2.3; the diagonal is representable by Lemma 3.1.1.
2. Deligne–Mumford (3.1.7): the diagonal is unramified except at the stated cusps.
3. Properness (3.2.7): separatedness from finiteness of Isom-schemes (3.2.2) and the valuative criterion via Lemma 3.2.6 (semistable reduction of generalized elliptic curves with level structure over a complete DVR).
4. Flatness and CM (3.3.1): via the Deligne–Mumford cover M̃_{Γ₁(N;n)} and universal deformation rings at geometric points (Corollary 3.1.9), with the Tate curve as the universal formal deformation of the 1-gon (Lemma 3.3.5).
5. Regularity and the Cartier divisor (4.1.1): the contraction c_Γ : M_Γ → M₁ is finite flat (for Γ₁(N; n) over M₁^0 or for n squarefree); normality (Lemma 4.1.4); regularity along the cusps in bad characteristic by Katz–Mazur Ch. 10 calculations.
6. Geometric connectedness (4.2.1(1)).

*Acceptance.*

- Γ₀(p) (N = 1, n = p squarefree): M_{Γ₀(p)} is a proper flat regular Deligne–Mumford stack over ℤ; its fibre at p (two components crossing at the supersingular points, Deligne–Rapoport) is the R13.5 check.
- Γ₀(p²) = Γ₁(1; p²): M is not Deligne–Mumford over 𝔽_p at the cusps where C is non-étale and disconnected (an extension of ℤ/p by μ_p on a polygon), which exist because p² | n.

*Uses.* `ModularCurvesPartII:R13.2/gamma-level-structures`, `ModularCurvesPartII:R13.1/deligne-rapoport-structure-criterion`, `ModularCurvesPartII:R13.1/semistable-genus-one-curves-and-neron-polygons`, `AlgebraicModuliForArithmeticGeometry:R09.5`, `ModularCurvesPartII:R13.3`.

*Planet:* Compactified level moduli stacks.

*Sources.*

- Arithmetic moduli of generalized elliptic curves, §1.2, Theorem 1.2.1, p. 2: “The moduli stack M Γ1(N;n) classifying Γ1(N; n)-structures on generalized elliptic curves is a proper ﬂat Artin stack over Z” The headline theorem.
- Arithmetic moduli of generalized elliptic curves, §3.2, Theorem 3.2.7, p. 26: “In particular, M Γ1(N;n) is Deligne–Mumford if and only if n is squarefree.” The Deligne–Mumford criterion.
- Arithmetic moduli of generalized elliptic curves, §3.3, Theorem 3.3.1, p. 26: “The proper morphism M Γ →Spec(Z) is ﬂat and CM with pure relative dimension 1.” Flatness.

#### Theorem. Schematic loci, fine moduli for large level, and agreement with the anchor's prime-level compactification

*Module* `TauCeti/ModularCurves/Generalized/KatzMazur.lean`. *Node* `ModularCurvesPartII:R13.2/agreement-with-katz-mazur-schemes`.

Let Γ = Γ₁(N; n) with n squarefree (resp. Γ(N)) over S = Spec ℤ (resp. Spec ℤ[ζ_N]). There is an open subscheme M^{sch} ⊆ M_Γ whose geometric points are those with trivial automorphism group. If d | N and d ≥ 5 (resp. d ≥ 3), then M_Γ/S[1/d] ⊆ M^{sch}, and M^∞/S[1/d] is relatively ample. Hence for large N, M_{Γ₁(N)} is the proper flat ℤ-scheme X₁(N)/ℤ of Katz–Mazur, a fine moduli scheme for Drinfeld Γ₁(N)-structures on generalized elliptic curves. M_Γ is the normalization of M₁ in M_Γ|_{ℤ[1/level]} (Remark 4.1.5). For prime N ≥ 5 over ℤ[1/N], M_{Γ₁(N)} agrees with the anchor's compactified curve (Tau Ceti ModularCurves Layer 10), by uniqueness of normalization.

*Hypotheses.*

- The agreement is only in the overlap RS-06 names (prime N ≥ 5 diamond quotients over ℤ[1/N]); other levels and bases use this roadmap's stacks.
- The contraction M_Γ → M₁ is finite flat when n is squarefree (Lemma 4.1.2), which is what Remark 4.1.5 needs.

*Proof.*

1. Theorem 4.2.1(2): the trivial-automorphism locus is open (Deligne–Mumford) and a scheme. For d | N with d ≥ 5 and char ∤ d, Γ₁(d)-structures have no automorphisms, and the contraction maps of Lemma 4.2.3 carry this to Γ₁(N; n).
2. Remark 4.1.5: M_Γ is normal and finite flat over the regular M₁, so it is the normalization of M₁ in its restriction to ℤ[1/level].
3. Anchor agreement: Layer 10 builds X_H by normalizing ℙ¹_j in Y_H. Over ℤ[1/N] both are normalizations of the j-line in the same open curve (the anchor's Y₁(N) = M_{Γ₁(N)}^0, Katz–Mazur), so they agree.

*Acceptance.*

- N = 5, 7, 11: M_{Γ₁(N)}[1/N] is a scheme; X₁(11) has genus 1.
- Levels N ≤ 4 are outside the hypothesis d ≥ 5, and the theorem asserts nothing about them.

*Uses.* `ModularCurvesPartII:R13.2/moduli-stacks-are-proper-flat-artin`, `ModularCurvesPartII:R13.2/contraction-maps-between-levels`.

*Planet:* X₁(N) as a fine moduli scheme.

*Sources.*

- Arithmetic moduli of generalized elliptic curves, §4.2, Theorem 4.2.1, p. 35: “There exists an open subscheme M sch whose geometric points are exactly those of M with trivial automorphism group.” The schematic locus.
- Arithmetic moduli of generalized elliptic curves, §4.2, Remark 4.2.2, p. 36: “so these are ﬁne moduli schemes for Drinfeld structures on generalized elliptic curves.” Fine moduli schemes for large level, agreeing with Katz–Mazur.

#### Theorem. Contraction maps between level moduli stacks are finite flat surjective of constant rank

*Module* `TauCeti/ModularCurves/Generalized/Contraction.lean`. *Node* `ModularCurvesPartII:R13.2/contraction-maps-between-levels`.

Let N ≥ 1 and n squarefree. Each of the following is finite, flat and surjective of constant rank: (1) M_{Γ(N)} → M_{Γ₁(N)}, (E; P, Q) ↦ (c(E), P); (2) M_{Γ(N)} → M_{Γ(d)} and M_{Γ₁(N)} → M_{Γ₁(d)} for d | N, contracting away from the standard d-torsion subgroups; (3) M_{Γ₁(N;n)} → M_{Γ₁(N)}, (E; P, C) ↦ (c(E), P); (4) M_{Γ₁(N)} → M_{Γ₀(N)}, (E, P) ↦ (E, ⟨P⟩). Here c(E) is the contraction away from ⟨P⟩.

*Hypotheses.*

- n squarefree keeps all stacks Deligne–Mumford and the maps flat; for p² | n the map (3) is not known to be flat along the bad cusps.
- The maps use contraction (node contraction-away-from-a-divisor), since forgetting data can make a divisor non-ample.

*Proof.*

1. Each map is proper and quasi-finite between regular (hence CM) stacks of the same dimension, so it is finite and flat (miracle flatness), and surjective by counting over ℂ.
2. The ranks are the analytic degrees, e.g. [Γ₁(d) : Γ₁(N)] for (2).

*Acceptance.*

- (4) for N = p prime has rank φ(p) = p − 1, the generators of ⟨P⟩; on coarse spaces the degree is (p − 1)/2, since (E, P) ≅ (E, −P).
- (1) for N = p prime has rank p(p − 1) = |GL₂(𝔽_p)|/(p² − 1) over the smooth locus, the points Q completing P to a basis.

*Uses.* `ModularCurvesPartII:R13.2/moduli-stacks-are-proper-flat-artin`, `ModularCurvesPartII:R13.1/contraction-away-from-a-divisor`.

*Sources.*

- Arithmetic moduli of generalized elliptic curves, §4.2, Lemma 4.2.3, p. 36: “Each of the following “contraction maps” is ﬁnite, ﬂat, and surjective with constant rank:” The four contraction maps.

### What is missing

- The proofs of §3 (universally embedded families, the valuative criterion, deformation rings) are outlined from their statements; §§3.1–3.3's proofs were read only for their structure.
- Refined Γ₀ levels and the full/fixed-pairing distinction over ℤ[ζ_N] (Theorem 4.1.1(3)) are stated for Γ(N) only.
- Coarse spaces (as opposed to the stacks) are R13.4a's.

## Requests to other roadmaps

- `tauceti:TauCetiRoadmap/ModularCurves#1a-projective-weierstrass-models` — Projective Weierstrass models, including the nodal cubic y²z = x³ − x²z to which the 1-gon is compared. Needed by `semistable-genus-one-curves-and-neron-polygons`.
- `tauceti:TauCetiRoadmap/ModularCurves#1d-the-scheme-theoretic-group-law` — Elliptic curves over a base with their scheme-theoretic group law, the smooth case that generalized elliptic curves must extend compatibly (RS-06). Needed by `generalized-elliptic-curve`.
- `tauceti:TauCetiRoadmap/ModularCurves#3c-the-four-level-structures` — Katz–Mazur's Drinfeld ℤ/Nℤ-structures, bases and cyclic subgroups on elliptic curves, the starting case of the generalized-elliptic versions (RS-06). Needed by `drinfeld-structures-and-cyclicity`, `gamma-level-structures`.
- `tauceti:TauCetiRoadmap/ModularCurves#0b-finite-locally-free-group-schemes-and-cartier-duality` — Finite locally free commutative group schemes, A-generators in Katz–Mazur's intrinsic and extrinsic senses, and the scheme G^× of ℤ/Nℤ-generators. Needed by `drinfeld-structures-and-cyclicity`.
- `tauceti:TauCetiRoadmap/ModularCurves#8d-the-cyclicity-locus-and-γ₀n` — The cyclicity locus and Γ₀(N)-structures on elliptic curves (Katz–Mazur 6), extended here to the boundary. Needed by `gamma-level-structures`.
- `tauceti:TauCetiRoadmap/ModularCurves#layer-10-compactified-coarse-curves-over-ℤ1n-cusps-and-the-shimura-covering` — The anchor's compactified coarse curve X_H over ℤ[1/N] for prime N ≥ 5 diamond quotients (normalization of ℙ¹_j in Y_H), with which M_{Γ₁(N)}[1/N] must agree. Needed by `agreement-with-katz-mazur-schemes`.
- `tauceti:TauCetiRoadmap/ModularCurves#9d-coarse-moduli-schemes-and-finite-quotients` — Coarse moduli schemes and finite quotients, for the schematic locus and the normalization identification. Needed by `agreement-with-katz-mazur-schemes`.
- `AlgebraicModuliForArithmeticGeometry:R09.5` — Artin and Deligne–Mumford stacks in the sense of Laumon–Moret-Bailly, the diagonal and valuative criteria, normalization of stacks, and the Deligne–Rapoport results on semistable genus-1 curves used by Conrad (classification over k̄, openness, contraction DR IV 1.2, the structure criterion DR II 3.2). Needed by `semistable-genus-one-curves-and-neron-polygons`, `contraction-away-from-a-divisor`, `deligne-rapoport-structure-criterion`, `moduli-stacks-are-proper-flat-artin`.
- `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1` — Connected–étale sequences and the structure of finite flat group schemes over artin local rings, used in the cyclicity proofs. Needed by `drinfeld-structures-and-cyclicity`.

## Gaps

- **Deligne–Rapoport and Katz–Mazur are cited, not read.** Verified: Conrad's statements and the structure of his proofs, which invoke Deligne–Rapoport (II 1.2–1.15, II 3.2, IV 1.2) and Katz–Mazur (1.3.7, 1.7.3, 1.11.2, 5.5.x, 6.1.1, 6.7.2, 6.8.7, 8.10.7) as black boxes. Not verified: those results. Deligne–Rapoport is not public; the Katz–Mazur inputs are the anchor's (Tau Ceti ModularCurves Layers 0–8), which RS-06 names as suppliers.

## Sources

- Brian Conrad, *Arithmetic moduli of generalized elliptic curves*. Author's copy kmpaper.pdf (49 pages; printed page = PDF page) of the paper published in J. Inst. Math. Jussieu 6 (2007), 209–278; locators give the author's copy's pages and result numbers. https://math.stanford.edu/~conrad/papers/kmpaper.pdf (SHA-256 `f53e4ff819d534926e6ee59874cbce4e7bad4a315cbd6d05984b8405b11f15d8`). Read: cc-fb70e5, 2026-09-29 (part R12.1, checkpoint 1): §1 (pp. 1–4); §2.1–2.4 in full (pp. 4–16); the statements of §§3.1–3.3 (Theorems 3.1.2, 3.1.4, 3.1.6, 3.1.7, Corollary 3.1.9, Theorems 3.2.2, 3.2.7, 3.3.1), §4.1 (Theorem 4.1.1, Lemmas 4.1.2, 4.1.4, Remark 4.1.5) and §4.2 (Theorem 4.2.1, Remark 4.2.2, Lemma 4.2.3), pp. 18–37.

## Non-goals

- The boundary charts, coarse spaces and bad fibres (R13.3–R13.6).
- Rebuilding the anchor's open level schemes or its Layer 10 compactification over ℤ[1/N]; agreement is proved on the overlap.
- General Artin stacks (AlgebraicModuliForArithmeticGeometry R09.5).
