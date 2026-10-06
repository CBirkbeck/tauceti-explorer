# Weight-three polylogarithmic complexes

This document develops layer **Polylogarithms:P.3** beyond the reviewed parent blueprint. Its purpose is to turn explicit trilogarithmic symbols into configuration maps, compare the resulting homology classes with algebraic K-theory, and isolate the input that makes determinants of trilogarithms give the value ζ_F(3). The layer has a complete target-level plan, with 27 new declarations, 68 API items and 36 tests. Its coverage is **planned**, not closed: six precise gaps and five supplier requests remain. Every declaration has implementation status unchecked. The suggested file checks signatures; it proves none of this mathematics.

The parent packet defines B₃, the weight-three complex, its residues, the comparison targets and the existence form of the special-value theorem. This part imports those declarations and supplies the additional definitions and key theorems used in their proofs. It does not create another trilogarithm group or another Milnor K-theory. The auxiliary geometric presentation G₃ is retained because the source's seven-term and duality proofs actually use it. Its comparison with B₃ is a named theorem, with rationalization and normalization made explicit.

## Conventions and boundaries

For an infinite field F, put U_F=F×⊗_Z Q. The parent complex Γ(F,3) is in cohomological degrees 1,2,3:

B₃(F) → B₂(F)⊗_Q U_F → Λ³_Q U_F.

Its first map is δ₃[z]₃=[z]₂⊗u(z); the second sends [x]₂⊗u(y) to u(1−x)∧u(x)∧u(y). Here B₂ is the rational pre-Bloch group supplied by K3BlochGroups V.3. That supplier writes x∧(1−x) for its boundary, so its boundary must be negated before this comparison. A symbol at zero evaluates to zero, but the symbol [1]₃ is retained. It has complex trilogarithm value ζ(3). An identity that silently discards [1]₃ gives the wrong constants in both the coordinate relation and the geometric reductions.

The weight-three Bigrassmannian complex is homological: its tuple size m is its degree, with its corner C₄(3) in degree 4. The three nonzero comparison components occupy degrees 6,5,4, which correspond respectively to Γ degrees 1,2,3. Faces have zero-based signs (−1)^i. Alternation is always the **sum** over permutations with their signs, without division by m!. Symmetrization in the generic resolution, in contrast, is the average over its first k vectors and includes 1/k!. These two operations serve different purposes and cannot share a normalization by accident.

All tensor products and exterior powers after rationalization use native Mathlib modules. A vector configuration is a tuple of nonzero vectors modulo simultaneous GL, with its genericity condition. It is not a projective point configuration: independent changes of the vector lengths are not killed. Projected cross-ratios do forget those lengths, but the middle and exterior configuration maps can retain them. The scaled moment-curve test below detects this distinction.

K-theory enters through rational primitive Hurewicz and a rank filtration. The construction on GL₃ vanishes on the image of GL₂. Therefore its K-theoretic domain is the rank-at-most-three piece modulo its rank-at-most-two piece. Neither the equality of this quotient with an Adams eigenspace nor an isomorphism H¹Γ≃K₅^(3) is used. General rational primitive Hurewicz and its compatibility with that filtration belong to GeneralAlgebraicKTheory, Part II; the integral Suslin stability theorem is already owned by K3BlochGroups V.4.

The H³ transfer and the transfer on the entire complex have different inputs. H³ transfer is conjugation of the existing Milnor norm by the parent H³–Milnor equivalence. A derived transfer on Γ needs the weight-four homotopy/residue quasi-isomorphism of Goncharov's Conjecture 1.39. The conditional construction below names that hypothesis. No termwise transfer on B₃ follows just from the ordinary norm on field units.

At a number field, the selected embeddings comprise every real embedding and one embedding from each complex pair. Native infinite places provide a convenient selection, since L₃ is invariant under conjugation. Write d=r₁+r₂. The every-family formula has the orientation det=q·period, where q may be zero. The existence theorem supplies a family with q nonzero. Reversing the formula for every family would assert that a positive zeta value equals zero on the zero family.

## Baseline and ownership

The checked baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed library audit leaves P.3 open. Statements of the 25 declarations cited in the packet were read at the Mathlib pin. Native finite formal sums, quotient modules, independent families, matrices and determinants, tensor products, exterior powers, projectivization, direct sums, coinvariants, group homology and total complexes are available. These are foundations used here, not proposed replacements. Native number-field discriminants, infinite places and Dedekind zeta also supply the special-value target's carriers.

The imports from the atlas have precise boundaries:

| Owner | Imported mathematics | Additional interface requested |
|---|---|---|
| Polylogarithms parent P.3 | Explicit B₃, Γ in weights at most three, residues, H³–Milnor equivalence, target comparison and existence theorem | This part supplies the explicit configuration and regulator proof chains |
| K3BlochGroups V.3–V.4 | Pre-Bloch symbols, five-term relations, ordered cross-ratio, integral stability/Milnor quotient, configuration hyperhomology | Rational bounded-below complex coefficients and the symmetrized generic resolution |
| K2SymbolsBrauer T.2–T.4 | Milnor presentation, rational alternating symbols, transfers, projection, restriction-degree and norm-residue formulas | Degree-three Milnor–Quillen transfer adapter; the existing adapter is degree two |
| GeneralAlgebraicKTheory K.2 and KTheoryLowDegrees U.1 | Plus/Q construction and stable GL | Rational primitive Hurewicz, primitive splitting and rank compatibility |
| BorelRegulators R.3–R.7 | Borel ranks/classes, coordinate regulators, determinant and zeta period | Measurable/continuous primitive comparison and exact class-normalization adapter |
| Polylogarithms P.4 | Higher-weight polylogarithmic complexes | Weight-four homotopy/residue resolution used by the conditional derived transfer |

The general hyperhomology construction, primitive splitting and regulator-class adapter are Part II extensions of their owners. Defining them again as weight-three conveniences would duplicate the atlas. The packet records the proposed rescope and the exact supplier requests.

## Sources and the checks they support

The main primary source is [A. B. Goncharov, Geometry of Configurations, Polylogarithms, and Motivic Cohomology](https://sasha-goncharov.github.io/Advances1995.pdf), the author-hosted scan of the published *Advances in Mathematics* 114 (1995), pp. 197–318. The read passages are §1 pp. 197–222; transfers pp. 239–241; §2.5 pp. 256–259; §3 pp. 264–266; the §5 conclusion pp. 291–293; §§6–8 pp. 295–308; §9 pp. 308–311; and §10 Lemma 10.1 p. 312. The unexamined complete §§4–5 comparison proof remains part of the geometric normalization gap. The published scan, not the MPIM preprint, is the text against which the two published misprints are recorded.

The second source is [Goncharov–Rudenko, Motivic correlators, cluster varieties, and Zagier's conjecture on ζ_F(4), arXiv v5](https://arxiv.org/pdf/1803.08585v5). Although the paper's final target is weight four, §5.1 and §7.2–7.3 contain the explicit weight-three relation and configuration proofs needed here. The read passages include §1.2 and Theorem 1.8, all of §5.1 pp. 53–56, and §§7.1–7.3 pp. 61–68, including normalization footnote 16. Both its v5 PDF and TeX were checked at equation (142). Findings against this text are scoped to that preprint version, not asserted against an uncollated journal version.

[Jianqiang Zhao's primary supplement](https://arxiv.org/pdf/math/0311111), formula (3) on p. 2, independently displays the negative denominator in the coordinate argument that is misprinted in Goncharov (1.16). Only that formula and its nondegeneracy conditions are used; higher-Chow groups are owned elsewhere and are not part of this layer. The earlier Goncharov 1991 announcement was checked for the special-value and coordinate claims, but the 1995 published proof supplies the plan. Suslin's 1984 primary proof could not be obtained through the available MathNet access. Its theorem and its existing source-access gap are imported from V.4; this part does not claim to have read it.

Source URLs, SHA-256 hashes, access date 6 October 2026, precise locators, short excerpts and the match to each node are in the packet. Four source findings are recorded below and await independent review. The upstream Hodge-structures and algebraic-topology documents were read to set the density and API style.

## Explicit symbols and the relation

The relation is first a finite formal sum. This separates a wrong coordinate formula from a correct quotient: a quotient can hide a sign error by killing both sides, while the raw rational tests cannot. Its cobracket calculation is algebraic in B₂⊗U. Descent of the real function needs the separate analytic functional relation, whose derivative and continuation argument is recorded as a gap. The proof of a zero cobracket alone does not establish a constant-free analytic identity.

### Coordinate 22-term relation

Declaration `Polylogarithms:P.3/coordinate-relation` (construction). In Q[F], write [z] for the basis vector. Set A=ca−a+1 and B=bc−c+1. Define R(a,b,c)=Cyc₃([A]+[A/(ca)]+[c]+[B/(Ab)]−[A/c]+[−Ba/A]−[B/(Abc)]−[1])+[−abc], with Cyc₃ over (a,b,c),(c,a,b),(b,c,a). Its admissible locus requires a,b,c and all three cyclic A,B to be nonzero. The [1] terms are retained; values 1 or −1 are allowed. This construction is a formal relation, not a second definition of B₃.

The direct inputs are `mathlib:Finsupp.linearCombination`, `mathlib:Finsupp.lmapDomain`, `Polylogarithms:P.3/trilogarithm-group`.

The construction or proof proceeds as follows:

1. Use Finsupp.single for symbols and finite sums for the cyclic operator.
2. Expand (1.16), correcting the omitted minus sign inside the sixth argument: −a(bc−c+1)/(ca−a+1). The geometric relation (1.10) and the c=1 specialization fix this sign.
3. Relate its image to the parent quotient relation submodule.

The API serves the source uses p. 208 (1.16), p. 210 (1.17) (Provides the concrete formula used by the subsequent comparison and its normalization checks.). Names below are in `TauCeti.Polylog.WeightThree`.

| Declaration | Role | Required statement |
|---|---|---|
| `relation22` | constructor | The finite formal sum R(a,b,c) in Q[F]. |
| `relation22_cyclic` | relation | R(a,b,c)=R(c,a,b). |
| `relation22_map` | functoriality | An injective field map carries R(a,b,c) to R(fa,fb,fc). |
| `relation22_eval` | compatibility | Evaluation by Finsupp.linearCombination is the corresponding signed sum in any Q-module. |
| `relation22_quotient` | simp | The image of R(a,b,c) in the parent B₃ is zero on the admissible locus. |

The discriminating tests are:

- `relation222` (computation): R(2,2,2)=3[3]+3[3/4]+3[2]+3[1/2]+3[−2]−3[3/2]−3[1/4]−3[1]+[−8] over Q.
- `relation111` (degenerate): R(1,1,1)=3[1]+4[−1], not the zero formal sum.
- `relation11c` (characterisation): For c≠0, the image of R(1,1,c) modulo inversion [z]=[1/z] is −[c²]+4[c]+4[−c]; it is not this expression as a raw Finsupp sum.

Source match: G95, p. 208 (1.16), p. 210 (1.17) — The coordinate form of the parent relation, including its constant terms.; Z03, p. 2 formula (3), sixth cyclic argument — Its negative denominator confirms the minus sign in the corresponding trilogarithmic argument. No higher-Chow constructions are planned in P.3.

### Cobracket of the 22-term relation

Declaration `Polylogarithms:P.3/relation-cobracket` (theorem). For every admissible R(a,b,c), δ₃(eval R)=0 in B₂(F)⊗U_F, where U_F=F×⊗Q and δ₃[z]₃=[z]₂⊗u(z), with u(1)=0. This proves that the explicit coordinate relation is killed, rather than replacing explicit B₃ by the conjecturally larger inductive B₃.

Suggested name: `TauCeti.Polylog.WeightThree.relation_cobracket`.

The direct inputs are `Polylogarithms:P.3/coordinate-relation`, `Polylogarithms:P.3/polylogarithmic-complex`, `K3BlochGroups:V.3/five-term-relation`, `K3BlochGroups:V.3/pre-bloch-group`.

The construction or proof proceeds as follows:

1. Use GR Lemma 5.1 to replace each mixed symbol {x,y}₂,₁ by its six ordinary B₃ symbols, including −{1}₃.
2. Lemma 5.2 identifies Q₃ with the coordinate 22-term relation.
3. In Proposition 5.4 collect the determinant-unit coefficients; each remaining coefficient is two five-term relations or the displayed sum of three five-term relations.
4. Apply the supplier’s rational B₂ inversion and five-term identities; specialize only along the admissible locus.

Acceptance: R(1,1,1)=3[1]+4[−1] has zero cobracket and zero regulator, while [1] itself has nonzero regulator. The B₂ boundary convention is (1−x)∧x, the negative of V.3’s x∧(1−x).

Source match: GR5, §5.1 Lemmas 5.1–5.2, (109), Proposition 5.4 and (110)–(114) — The printed proof supplies the required vanishing in B₂⊗U.

### Functional relations of the trilogarithm

Declaration `Polylogarithms:P.3/trilogarithm-functional-relations` (theorem). Over C, the parent single-valued L₃ kills the corrected coordinate R(a,b,c), as well as [x]−[x⁻¹] and [x]+[1−x]+[1−x⁻¹]−[1] for x≠0. Identities extend to the admissible degenerate configurations by continuity. In particular L₃(R(1,1,1))=3ζ(3)+4(−3ζ(3)/4)=0.

Suggested name: `TauCeti.Polylog.WeightThree.trilogarithm_functional_relations`.

The direct inputs are `Polylogarithms:P.3/coordinate-relation`, `Polylogarithms:P.3/relation-cobracket`, `Polylogarithms:P.1/classical-polylogarithm`, `Polylogarithms:P.1/distribution-and-inversion`, `Polylogarithms:P.1/single-valued-continuity`, `Polylogarithms:P.2/bloch-wigner-descent`.

The construction or proof proceeds as follows:

1. Use the parent classical derivative identities and the B₂ Bloch–Wigner descent to turn the cobracket cancellation into vanishing of the differential of the corrected relation’s L₃ evaluation.
2. Compute the constant on the component through (1,1,1) using the distribution/inversion identities and continuity.
3. Verify continuation across the complement of the admissible divisor; this analytic constant argument needs a complete written treatment and is recorded as a gap.
4. Apply the same elementary differentiation and evaluation for the three-term identity; inversion is already P.1-owned.

Acceptance: The constant [1] has value ζ(3), not zero. The ordinary trilogarithm Li₃ alone does not satisfy this equation.

Source match: G95, Gon95 p. 205 Theorem 1.3, p. 208 (1.16), p. 210 specialization; §10 Lemma 10.1 — The stated source input is isolated with its precise proof obligations.

## Vector configurations and their complex

The free generic-tuple module carries the actual permutation representation of GL. Taking native coinvariants gives its orbit module and a reusable invariant-evaluation universal property. Projection faces use a quotient by one nonzero vector; any basis chosen to identify this quotient changes the output by GL and hence does not change its class. Deletion and projection lower tuple size, so their mixed face identity is checked before taking the quotient by the bottom rows. The resulting degree convention determines all three later comparison signatures.

### Generic vector configurations

Declaration `Polylogarithms:P.3/generic-vector-configurations` (definition). A generic m-tuple in F^q has every subfamily of size at most q linearly independent. Let C_m(q) be Q[generic m-tuples] modulo the span of [g·l]−[l] for g∈GL_q(F). This is the free Q-module on GL-orbits. Individual vector rescalings are not quotiented out. Deletion removes a vector; projection removes l_i and projects the others to F^q/F l_i, whose identification with F^(q−1) is immaterial in the orbit quotient.

The direct inputs are `mathlib:LinearIndependent`, `mathlib:Submodule.liftQ`, `mathlib:Representation.Coinvariants`, `mathlib:Matrix.GeneralLinearGroup`.

The construction or proof proceeds as follows:

1. Define the generic subtype using native LinearIndependent on injectively indexed subfamilies.
2. Use native Representation.Coinvariants of the rational permutation representation on the generic subtype. Its kernel is the span of [g·l]−[l], so the source presentation agrees with that existing quotient.
3. Use a linear equivalence from the one-dimensional quotient complement to define each projection face; different choices differ by GL.

The API serves the source uses §2.5 pp. 256–259; GR §7.1 (126)–(129) (Provides the concrete formula used by the subsequent comparison and its normalization checks.). Names below are in `TauCeti.Polylog.WeightThree`.

| Declaration | Role | Required statement |
|---|---|---|
| `GenericTuple` | constructor | Subtype of generic m-tuples in F^q. |
| `Config` | structure | The rational GL-coinvariant quotient C_m(q). |
| `configMk` | constructor | A generic tuple gives its class. |
| `configMk_gl` | relation | Simultaneous GL change leaves the class unchanged. |
| `configLift` | universal-property | Every GL-invariant function to a Q-module extends uniquely linearly. |
| `config_ext` | extensionality | Linear maps agreeing on all tuple classes are equal. |
| `configDelete` | projection | Delete the indexed vector, when the target row is present. |
| `configProject` | projection | Project the remaining vectors along the indexed vector. |
| `config_coinvariants` | compatibility | Config is the native Representation.Coinvariants of the permutation representation on GenericTuple. |

The discriminating tests are:

- `generic_basis` (compatibility): The standard basis of Q³ is generic, using native LinearIndependent.
- `generic_zero` (non-example): A tuple containing zero is not generic when q≥1.
- `config_ratios` (non-example): The classes of (1,2) and (1,3) in C₂(1) over Q differ: their ratios 2 and 3 distinguish GL₁ orbits.

Source match: G95, §2.5 pp. 256–259; GR §7.1 (126)–(129) — These are vector configurations modulo simultaneous GL, not projective point configurations.

### Weight-three Bigrassmannian complex

Declaration `Polylogarithms:P.3/weight-three-bigrassmannian` (construction). BC_m^(3)=⊕_{3≤q<m} C_m(q), in homological degree m, starting at degree 4. Set ∂=Σ_i(−1)^i deletion_i and p=Σ_i(−1)^i projection_i, with zero-based indices. Each lowers tuple size by one; projection also lowers q. With these face signs ∂p+p∂=0, so D=∂+p. Components leaving 3≤q<m are zero; this is the quotient by the lower rows, not a subcomplex obtained by simply dropping outgoing maps.

The direct inputs are `Polylogarithms:P.3/generic-vector-configurations`, `mathlib:HomologicalComplex₂.total`, `mathlib:DirectSum.lof`.

The construction or proof proceeds as follows:

1. Prove the two same-kind face identities and the mixed identity before taking signed sums.
2. Use the native finite direct sum of the orbit modules and assemble the two differential components.
3. Check D²=0, including the q=3 boundary and the m=q+1 corner.

The API serves the source uses GR §7.1 (129)–(130); Gon95 §6 (6.2) (Provides the concrete formula used by the subsequent comparison and its normalization checks.). Names below are in `TauCeti.Polylog.WeightThree`.

| Declaration | Role | Required statement |
|---|---|---|
| `bigrassmannian` | constructor | Degree m is the indicated finite direct sum. |
| `bigrassmannianD` | data | The degree −1 linear differential ∂+p. |
| `bigrassmannianD_component` | simp | On row q, D has deletion in row q and projection in row q−1 with the stated signs. |
| `bigrassmannianD_sq` | structure | Consecutive differentials compose to zero. |
| `bigrassmannian_corner` | compatibility | Degree 4 is canonically C₄(3). |
| `bigrassmannian_map` | functoriality | Injective field maps induce degreewise maps commuting with D; identity and composition laws hold. |

The discriminating tests are:

- `bigrassmannian_degree3` (degenerate): Degree 3 is zero.
- `bigrassmannian_degree4` (computation): Degree 4 has only row C₄(3); its outgoing differential is zero.
- `bigrassmannian_mixed` (characterisation): On C₇(4), the C₅(3) component of D² is ∂p+p∂=0, not ∂p−p∂.

Source match: GR5, GR §7.1 (129)–(130); Gon95 §6 (6.2) — The quotient and degree convention are specialized to weight three.

### Projected cross-ratio

Declaration `Polylogarithms:P.3/projected-cross-ratio` (construction). For a generic five-tuple in F³ define r(i|j,k,l,m)=|ijl||ikm|/(|ijm||ikl|), using the native determinant and the chosen volume form. It lies outside {0,1}. This is GR §7’s convention and the inverse of the ordered cross-ratio supplied by K3BlochGroups V.4; it is not GR §1’s convention. The volume form and each of the five vector scales cancel.

The direct inputs are `Polylogarithms:P.3/generic-vector-configurations`, `mathlib:Matrix.det`, `mathlib:Matrix.det_mul`, `K3BlochGroups:V.4/cross-ratio`.

The construction or proof proceeds as follows:

1. Compute determinants of the quotient-plane vectors as the three-dimensional minors with the projection vector first.
2. Use Plücker to show 1−r is nonzero.
3. Compare the four-bracket order with the supplier cross-ratio before applying B₂ identities.

The API serves the source uses GR §7.2 (135), (142) (Provides the concrete formula used by the subsequent comparison and its normalization checks.). Names below are in `TauCeti.Polylog.WeightThree`.

| Declaration | Role | Required statement |
|---|---|---|
| `projectedRatio` | constructor | The displayed determinant ratio for a generic five-tuple. |
| `projectedRatio_ne` | characterisation | r≠0 and r≠1. |
| `projectedRatio_gl` | functoriality | Simultaneous GL changes leave r unchanged. |
| `projectedRatio_scale` | relation | Independent nonzero vector rescalings leave r unchanged. |
| `projectedRatio_blochCrossRatio` | compatibility | r is the inverse of the V.4 ordered cross-ratio on the four projected points. |

The discriminating tests are:

- `projectedRatio_moment` (computation): On v(t)=(1,t,t²) at t=(1,2,3,5,7), r(1|2,3,4,5)=6/5.
- `projectedRatio_swap` (characterisation): Swapping projected indices 4 and 5 inverts the ratio, giving 5/6 on this fixture.
- `projectedRatio_bad` (non-example): A zero projection vector fails genericity; no ratio theorem is asserted for that input.

Source match: GR5, GR §7.2 (135), (142) — The convention in §7 is explicit and differs from the introduction.

## The three explicit maps and geometric reduction

The maps are normalized together: the projected ratio has the order fixed above, the middle map has the printed GR coefficient one, the top map has coefficient 1/5, and the exterior component uses the corrected coefficient −3. The right square can be tested entirely in the exterior cube of rational units; the two geometric relations need the actual explicit B₃ quotient. The auxiliary G₃ presentation supplies the intersection reduction used in the primary proof. Duality is defined on vector configurations by a kernel/annihilator construction before it is applied to projective tuples. This keeps its basis independence and its deletion/projection compatibility visible.

### Exterior configuration map

Declaration `Polylogarithms:P.3/exterior-configuration-map` (construction). Define r₄:C₄(3)→Λ³_Q U_F by −3 Alt₄(u|123|∧u|124|∧u|134|), with Alt the unnormalized signed sum. This is 18 times Gon95’s f₀^(3) of (3.3). The coefficient is chosen for r₅ of GR (142) and δ₂[x]=(1−x)∧x; the printed 2 Alt₄ in GR is incompatible with that square. Exterior powers are native Mathlib exteriorPower.

The direct inputs are `Polylogarithms:P.3/generic-vector-configurations`, `mathlib:exteriorPower.ιMulti`, `mathlib:exteriorPower.alternatingMapLinearEquiv`, `mathlib:Submodule.liftQ`, `mathlib:Matrix.det_mul`.

The construction or proof proceeds as follows:

1. Rewrite Gon95’s four-term f₀ formula as a signed alternation: Alt₄=-6 f₀.
2. Use (3.3)–(3.4) for volume independence, and determinant multiplicativity for GL descent.
3. Descend the signed sum by Submodule.liftQ; use native exterior insertion for the wedge.

The API serves the source uses Gon95 p. 264 formula for f₀^(3), (3.3)–(3.4); GR (142) (Provides the concrete formula used by the subsequent comparison and its normalization checks.). Names below are in `TauCeti.Polylog.WeightThree`.

| Declaration | Role | Required statement |
|---|---|---|
| `configExterior` | constructor | The Q-linear map r₄ on vector-configuration classes. |
| `configExterior_mk` | simp | Evaluation is −3 times the unnormalized alternation. |
| `configExterior_volume` | compatibility | Changing volume by λ∈F× does not change r₄. |
| `configExterior_alt` | relation | A permutation multiplies the value by its sign. |
| `configExterior_fieldMap` | functoriality | The native exterior cube of the rational unit map commutes with r₄. |

The discriminating tests are:

- `configExterior_small` (computation): For vectors (1,8,2),(7,3,11),(1,3,2),(9,4,3) over Q, r₄=18 u(5)∧u(67)∧u(197).
- `configExterior_moment4` (degenerate): For v(t) at t=1,2,3,5 the value is zero.
- `configExterior_native` (compatibility): The wedge in the small fixture is exteriorPower.ιMulti Q 3, not a tensor modulo only antisymmetry.

Source match: G95, Gon95 p. 264 formula for f₀^(3), (3.3)–(3.4); GR (142) — The corrected common normalization is checked by a nonzero rational exterior-coordinate counterexample.

### Middle configuration map

Declaration `Polylogarithms:P.3/middle-configuration-map` (construction). Define r₅:C₅(3)→B₂(F)⊗_Q U_F by Alt₅([r(1|2,3,4,5)]₂⊗u|345|), with the projected ratio just fixed. It is independent of the volume form and descends under simultaneous GL. The B₂ module and field maps come from V.3; its boundary is negated to match the parent complex.

The direct inputs are `Polylogarithms:P.3/projected-cross-ratio`, `Polylogarithms:P.3/generic-vector-configurations`, `K3BlochGroups:V.3/five-term-relation`, `K3BlochGroups:V.3/pre-bloch-group`, `mathlib:TensorProduct.map`, `mathlib:Submodule.liftQ`.

The construction or proof proceeds as follows:

1. Evaluate the projected cross-ratio on each ordered permutation and tensor its B₂ symbol with the determinant unit.
2. The extra u(λ) under a volume change has coefficient Alt₅[r(1|2,3,4,5)]₂, zero by the five-term relation.
3. Use the quotient universal property for GL descent and TensorProduct.map for field functoriality.

The API serves the source uses GR §7.2 (142); Gon95 Proposition 3.7 (Provides the concrete formula used by the subsequent comparison and its normalization checks.). Names below are in `TauCeti.Polylog.WeightThree`.

| Declaration | Role | Required statement |
|---|---|---|
| `configMiddle` | constructor | The Q-linear map r₅. |
| `configMiddle_mk` | simp | Evaluation is the stated signed five-point sum. |
| `configMiddle_volume` | compatibility | The map is independent of the volume form. |
| `configMiddle_alt` | relation | Permuting the five vectors multiplies the value by the sign. |
| `configMiddle_fieldMap` | functoriality | The tensor product of the supplier B₂ and unit maps commutes with r₅. |

The discriminating tests are:

- `configMiddle_moment` (computation): For v(t) at 1,2,3,5,7, d₂r₅=36 u(2)∧u(3)∧u(5).
- `configMiddle_scaleVolume` (characterisation): Multiplying the volume form by 2 contributes zero to r₅, despite changing every determinant unit.
- `configMiddle_notProjective` (non-example): On the moment-five fixture, multiply only v(1) by 2. Its d₂r₅ becomes 18 u(2)∧u(3)∧u(5), rather than the original 36 times that wedge. Thus independent vector scaling can change r₅; quotienting to projective tuples would lose data.

Source match: GR5, GR §7.2 (142); Gon95 Proposition 3.7 — The mixed degree map and its full volume-independence check.

### Triple-ratio configuration map

Declaration `Polylogarithms:P.3/triple-ratio-map` (construction). Define T(l)=|124||235||136|/(|125||236||134|) for a generic six-tuple, and r₆:C₆(3)→B₃(F) as (1/5) Alt₆[T(l)]₃. The symbol [1]₃ is permitted and generally nonzero. The ratio is invariant under independent vector rescalings; the resulting alternating map descends through GL. Use the explicit 22-term B₃ of the parent, not the conjectural equality with inductive B₃.

The direct inputs are `Polylogarithms:P.3/generic-vector-configurations`, `Polylogarithms:P.3/trilogarithm-group`, `mathlib:Finsupp.linearCombination`, `mathlib:Submodule.liftQ`.

The construction or proof proceeds as follows:

1. All six minors are nonzero by genericity.
2. Count the occurrences of each column scale and volume scale in numerator and denominator.
3. Use the parent B₃ generator and extend the alternating formula by Finsupp.linearCombination and quotient descent.

The API serves the source uses GR §7.2 (144), footnote 16; §7.3 Proposition 7.2 (Provides the concrete formula used by the subsequent comparison and its normalization checks.). Names below are in `TauCeti.Polylog.WeightThree`.

| Declaration | Role | Required statement |
|---|---|---|
| `tripleRatio` | constructor | The determinant ratio T. |
| `configTrilog` | constructor | The rational map r₆=(1/5) Alt₆[T]₃. |
| `configTrilog_mk` | simp | The formula holds on every generic tuple. |
| `tripleRatio_scale` | relation | Independent nonzero vector scales cancel in T. |
| `configTrilog_alt` | relation | A permutation multiplies r₆ by its sign. |
| `configTrilog_fieldMap` | functoriality | The parent B₃ field map commutes with r₆. |

The discriminating tests are:

- `tripleRatio_moment` (computation): For v(t) at 1,2,3,5,7,11 the raw triple ratio is 10/9.
- `tripleRatio_one` (degenerate): For e₁,e₂,e₃,(1,1,1),(1,2,3),(1,3,2), which is a generic six-tuple, the raw ratio is 1; this symbol is not discarded.
- `configTrilog_normalization` (non-example): 5r₆=Alt₆[T]₃; using 1/15 would make the left chain square differ by a factor of 3.

Source match: GR5, GR §7.2 (144), footnote 16; §7.3 Proposition 7.2 — The coefficient belongs to the same normalization as r₅, not Gon95a’s 1/15.

### Geometric trilogarithm presentation

Declaration `Polylogarithms:P.3/geometric-trilogarithm-presentation` (definition). Let G₃(F) be the rational module on PGL₃-orbits of arbitrary ordered six-tuples of native points of P²(F). Impose: a tuple is zero if two points coincide or four are collinear; the alternating seven-term deletion relation; and the intersection relation R3 of GR (148). For triangle vertices a₁,a₂,a₃ and b_i on a_i a_{i+1}, write T(z) for its tuple with invariant z=r′(b₁|a₂,a₃,b₂,b₃), where r′(u,v,w,x)=(u−w)(v−x)/((u−x)(v−w)). Put T₁(z)=−T(z)−2T(1−z)+T(1). For a type-B tuple y=(x₁,x₂,m,x₃,x₄,x₅) with m=x₁x₂∩x₃x₄, impose 3[y]=Σ_{i=1}⁵(−1)^(i−1) T₁(r′(y₆|y₁,…,ŷ_i,…,y₅)), wherever these projected configurations are defined. This auxiliary geometric group is compared with the parent B₃; it is not substituted for its definition.

The direct inputs are `mathlib:Projectivization`, `mathlib:Submodule.liftQ`, `mathlib:Finsupp.linearCombination`.

The construction or proof proceeds as follows:

1. Use native Projectivization F (F³) for points and the native Finsupp module for ordered tuples.
2. Generate a rational relation submodule from simultaneous projective GL changes and the three displayed families; take the native quotient.
3. Degenerate T(1) is retained via the triangle specialization of the source; do not exclude it by requiring every six-tuple to be generic.
4. Derive permutation antisymmetry from the seven-term relation with a repeated point (Gon95 Lemma 1.7).

The API serves the source uses Gon95 Definition 1.5 and Lemma 1.7 pp. 211–214; GR §7.3 (146)–(148) (Makes the geometric reduction in the chain-map and regulator proofs available as a named reusable object.). Names below are in `TauCeti.Polylog.WeightThree`.

| Declaration | Role | Required statement |
|---|---|---|
| `GeometricTrilog` | structure | The native rational quotient G₃(F) of formal projective six-tuples. |
| `geometricMk` | constructor | The class of an arbitrary ordered projective six-tuple. |
| `geometricMk_alt` | relation | Permuting its six points multiplies the class by the permutation sign. |
| `geometricLift` | universal-property | A rational linear evaluation killing all three relation families and projective GL changes factors uniquely through G₃. |
| `geometricTriangle` | constructor | The triangle-family class T(z), including its source specialization at z=1. |

The discriminating tests are:

- `geometric_repeat` (degenerate): A tuple with its first two points equal represents zero.
- `geometric_fourCollinear` (degenerate): A tuple with four points on one projective line represents zero.
- `geometric_triangle_nonzero` (non-example): Under the comparison below T(1) maps to [1]₃, with complex regulator ζ(3); the geometric group is not killed by its degeneration relations.

Source match: G95, Gon95 Definition 1.5 and Lemma 1.7 pp. 211–214; GR §7.3 (146)–(148) — The rationalized geometric presentation used in the seven-term and duality arguments.

### Geometric–symbol trilogarithm comparison

Declaration `Polylogarithms:P.3/geometric-trilogarithm-comparison` (comparison). There is a canonical rational isomorphism M₃:G₃(F)≃B₃(F). It sends T(z) to [z]₃. On type-B configurations use one third of the alternating five-term sum of T₁-values from (148), evaluated by T₁(z)=−[z]₃−2[1−z]₃+[1]₃. On generic six-tuples choose the intersection m of the first two and next two point lines, and use the seven-term relation to reduce to types B and C. The result is independent of the auxiliary intersection choice. Its unnormalized six-point alternation is (3/2) Alt₆[T_raw]₃, with T_raw the determinant triple ratio of the triple-ratio node. Integrally Gon95 states the comparison only modulo 6-torsion; rationalization removes that qualification.

Suggested name: `TauCeti.Polylog.WeightThree.geometric_trilogarithm_comparison`.

The direct inputs are `Polylogarithms:P.3/geometric-trilogarithm-presentation`, `Polylogarithms:P.3/coordinate-relation`, `Polylogarithms:P.3/triple-ratio-map`, `Polylogarithms:P.3/trilogarithm-group`, `K3BlochGroups:V.3/five-term-relation`.

The construction or proof proceeds as follows:

1. Use the triangle specialization to define the symbol-to-geometric map.
2. The corrected coordinate relation gives the relations among triangle classes; the geometric R3 gives the reverse evaluation.
3. Apply the seven-term reduction to the generic case and the projected five-point reduction to type C.
4. GR Lemmas 7.3–7.4 cancel the type-B alternating terms and identify the remaining type-C contribution with the triple ratio.
5. Track the factor 3/2 and the separate r₆ coefficient 1/5; the alternation of M₃ is not r₆ without this rescaling.

Acceptance: The displayed geometric and algebraic conventions agree with the stated source passage.

Source match: GR5, Gon95 Theorem A pp. 291–293; GR §7.3 Proposition 7.2 and Lemmas 7.3–7.4 pp. 66–68 — Provides the geometric-to-symbol adapter; the complete primary choice-independence proof remains in the normalization gap.

### Configuration duality

Declaration `Polylogarithms:P.3/configuration-duality` (construction). For 0<q<m, the kernel of the surjective column map F^m→F^q associated to a generic m-tuple has dimension m−q. Choosing a basis of that kernel and taking its coordinate columns gives a generic m-tuple in F^(m−q); another basis changes it by GL. This defines a linear equivalence *:C_m(q)≃C_m(m−q). Equivalently, annihilator duality on the generic Grassmannian gives the same map. Under the natural dimension identifications it is involutive. It exchanges deletion with projection and descends further through independent vector scaling to the projective configuration duality.

The direct inputs are `Polylogarithms:P.3/generic-vector-configurations`, `mathlib:LinearIndependent`, `mathlib:Matrix.det`.

The construction or proof proceeds as follows:

1. Identify the tuple with the row subspace of its full-rank q×m matrix; the dual row subspace is its annihilator.
2. Nonzero complementary minors show the dual tuple is generic.
3. For a matrix (I_q,B), the dual is (−Bᵀ,I_{m−q}); in the square case, normalize the first block to get −(B⁻¹)ᵀ.
4. Double annihilation proves involutivity, and taking a coordinate hyperplane exchanges deletion with quotient projection.
5. Use Gon95 Proposition 7.1 and Lemmas 7.2–7.5 for the geometric intersection description and Corollary 7.6 for the face identity.

The API serves the source uses Gon95 §7 pp. 298–303, (7.1)–(7.2), Lemmas 7.2–7.5, Corollary 7.6 (Makes the geometric reduction in the chain-map and regulator proofs available as a named reusable object.). Names below are in `TauCeti.Polylog.WeightThree`.

| Declaration | Role | Required statement |
|---|---|---|
| `configurationDual` | equivalence | The native rational linear equivalence C_m(q)≃C_m(m−q), for 0<q<m. |
| `configurationDual_sq` | structure | Duality twice is identity after identifying m−(m−q)=q. |
| `configurationDual_matrix` | simp | The dual of the columns of (I_q,B) is represented by the columns of (−Bᵀ,I_{m−q}). |
| `configurationDual_faces` | compatibility | Duality exchanges deletion and projection on the rows where both sides are defined. |

The discriminating tests are:

- `configurationDual_four` (computation): For q=2,m=4 and vectors (1,0),(0,1),(1,2),(1,3), the dual class is represented by (−1,−1),(−2,−3),(1,0),(0,1).
- `configurationDual_six` (characterisation): On C₆(3), applying the same-rank dual map twice returns the original class.
- `configurationDual_notInverse` (non-example): On a normalized square matrix (I_q,B), duality uses negative inverse transpose after normalizing the first block, not B⁻¹ alone; the four-vector fixture distinguishes these matrices.

Source match: G95, Gon95 §7 pp. 298–303, (7.1)–(7.2), Lemmas 7.2–7.5, Corollary 7.6 — The duality needed for the top projection identity, on actual vector configurations before projectivization.

### Seven-term configuration relation

Declaration `Polylogarithms:P.3/seven-term-configuration-relation` (theorem). For every generic seven-tuple in F³, Σ_{i=0}^6(−1)^i r₆(l without l_i)=0 in explicit B₃(F).

Suggested name: `TauCeti.Polylog.WeightThree.seven_term_configuration_relation`.

The direct inputs are `Polylogarithms:P.3/triple-ratio-map`, `Polylogarithms:P.3/trilogarithm-group`, `K3BlochGroups:V.3/five-term-relation`, `Polylogarithms:P.3/geometric-trilogarithm-comparison`.

The construction or proof proceeds as follows:

1. Use Gon95’s configuration presentation G₃ only as the finite geometric proof device of GR §7.3: repeat/collinearity relations, deletion relation and the intersection-line relation.
2. The intersection construction M₃ reduces each generic six-tuple to three degenerate types; the B₂ five-term relation gives their permutation identities.
3. Proposition 7.2 identifies Alt₆ M₃ with 3/2 times the raw triple-ratio alternation.
4. Alternate the seven-point relation and divide by the nonzero rational factors.

Acceptance: The statement holds on the generic seven-point moment-curve fixture 1,2,3,5,7,11,13. No discarded {1}₃ constant is used.

Source match: GR5, GR Theorem 1.8 and §7.3 Proposition 7.2, Lemmas 7.3–7.4 — A proof in the explicit B₃ presentation, not an appeal to the conjectural inductive comparison.

### Trilogarithm antisymmetry under duality

Declaration `Polylogarithms:P.3/trilogarithm-duality` (theorem). For a projective six-tuple with no four collinear points, its dual represents the negative of its class in G₃(F). Consequently M₃(*x)=−M₃(x), and the alternating triple-ratio map satisfies r₆ p=0 on C₇(4). This is an equality in the geometric quotient and then in the parent explicit B₃, not merely a functional identity of real regulators.

Suggested name: `TauCeti.Polylog.WeightThree.trilogarithm_duality`.

The direct inputs are `Polylogarithms:P.3/configuration-duality`, `Polylogarithms:P.3/geometric-trilogarithm-comparison`, `Polylogarithms:P.3/seven-term-configuration-relation`.

The construction or proof proceeds as follows:

1. Expand the six-tuple by the seven-term relation and R3 into the 46 projected-cross-ratio terms of Gon95 (8.2).
2. Describe the dual as the six hyperplanes attached to the two triangles by Corollary 7.6.
3. Pair the 46 original terms with the dual terms; identical projected configurations have opposite signs.
4. For the remaining pairs use L′₃(x)=−[x]₃−2[1−x]₃+[1]₃ and the identities in (8.1); Lemma 8.2 supplies the three exceptional projection comparisons.
5. Use deletion/projection duality and the seven-term relation in the dual C₇(3) configuration to obtain top projection vanishing.

Acceptance: The displayed geometric and algebraic conventions agree with the stated source passage.

Source match: G95, Gon95 Theorem 8.1 and Lemma 8.2 pp. 304–308; Theorem 6.3 p. 297 — The full source argument for top projection vanishing; its adapter to the common rational normalization is checked separately.

### Configuration chain comparison

Declaration `Polylogarithms:P.3/configuration-chain-comparison` (theorem). With the common normalization above, d₂r₅=r₄∂ on C₅(3), δ₃r₆=r₅∂ on C₆(3), and r₄p=r₅p=r₆p=0 on C₅(4), C₆(4), C₇(4) respectively. Together with the seven-term relation these components give a degree-reversed chain map BC_•^(3)→Γ(F,3), supported in degrees 6,5,4.

Suggested name: `TauCeti.Polylog.WeightThree.configuration_chain_comparison`.

The direct inputs are `Polylogarithms:P.3/exterior-configuration-map`, `Polylogarithms:P.3/middle-configuration-map`, `Polylogarithms:P.3/triple-ratio-map`, `Polylogarithms:P.3/seven-term-configuration-relation`, `Polylogarithms:P.3/weight-three-complex`, `Polylogarithms:P.3/trilogarithm-duality`.

The construction or proof proceeds as follows:

1. For the right square use Plücker and expand determinant-unit wedges; Gon95 Proposition 3.8 supplies the primitive normalization, and the corrected r₄ matches GR’s r₅.
2. For the left square use GR (143)–(144), checking the coefficient 1/5 against the old map rather than copying the old triple-ratio coefficient.
3. The two lower projection identities use the five-term relation (Gon95 Lemma 6.2 and Lemma 3.6).
4. Apply the trilogarithm-duality node: Corollary 7.6 exchanges deletion and projection, and Theorem 8.1 identifies dual six-tuples with their negatives. Its 46-term cancellation is read on pp. 304–308; converting M₃ to the common r₆ normalization is part of the explicit adapter check.
5. Use the previous seven-term node for the incoming degree-7 differential.

Acceptance: The right square on the rational moment fixture gives 36 u(2)∧u(3)∧u(5) on both sides. Using printed 2 Alt₄ gives −24 u(2)∧u(3)∧u(5), a nonzero counterexample. D lowers tuple size while Γ degrees are 6−m.

Source match: G95, Gon95 §6 Theorems 6.1, 6.3; GR (141)–(144) — The three nonzero components are isolated with the projection identities needed for totalization.

## Stable homology and the K-theory comparison

An ordinary generic GL₃ resolution gives the first comparison. Stabilization requires Goncharov's symmetrized resolution: the first k vectors are distinguished, permutation averaging has coefficient 1/k!, and the insertion operator anticommutes with the differential. The augmented total complex is acyclic by Lemma 2.16. Its projection along the distinguished vectors gives the map to the Bigrassmannian complex. The general edge-map machinery is imported and extended at its owner. Only after compatibility with block stabilization is proved does one restrict to the primitive K-theory classes.

### Stabilized configuration comparison

Declaration `Polylogarithms:P.3/stabilized-configuration-comparison` (construction). For infinite F and n≥3 construct c_i^(n):H_{6−i}(GL_n(F),Q)→H^iΓ(F,3), i=1,2,3, using the symmetrized generic-vector resolution C_•^{n−2}(n) of Gon95 §2.5 and its projection map φ to BC^(3). On GL₃ this restricts to the maps induced by r₆,r₅,r₄. The compatible stable map restricts along rational primitive Hurewicz from Quillen K_{6−i}.

The direct inputs are `Polylogarithms:P.3/weight-three-bigrassmannian`, `Polylogarithms:P.3/configuration-chain-comparison`, `GeneralAlgebraicKTheory:K.2:plus`, `mathlib:CategoryTheory.ShortComplex.homologyMap`, `mathlib:groupHomology`, `mathlib:Rep.trivial`, `K3BlochGroups:V.4/hyperhomology-map`, `K3BlochGroups:V.4`, `KTheoryLowDegrees:U.1/stable-general-linear-group`.

The construction or proof proceeds as follows:

1. Use tilde C_p(n), with the first k vectors fixed under d^k; average their permutations by 1/k!.
2. The operator λ^k inserts one of the remaining vectors among the first k+1 and then symmetrizes. Lemmas 2.12–2.16 give the acyclic augmented total resolution.
3. The component φ(l₁,…,l_m)=(l₁,…,l_k | l_{k+1},…,l_m) projects along the first k vectors and then applies the configuration comparison.
4. Use V.4/hyperhomology-map for the edge map, extending its coefficient/complex interface by the request below; groupHomology itself exists in Mathlib. Establish stabilization before taking the supplied stable GL colimit.

The API serves the source uses Gon95 §2.5 Lemmas 2.12–2.16; §6 (6.4)–(6.8) (Provides the concrete formula used by the subsequent comparison and its normalization checks.). Names below are in `TauCeti.Polylog.WeightThree`.

| Declaration | Role | Required statement |
|---|---|---|
| `configurationComparison` | constructor | The rational group-homology map c_i^(n), for n≥3 and i∈{1,2,3}. |
| `configurationComparison_stabilize` | functoriality | c_i^(n+1)∘H(stabilize)=c_i^(n). |
| `configurationComparison_rank3` | compatibility | For n=3 it is the homology map induced by the three explicit configuration components. |
| `configurationComparison_fieldMap` | functoriality | The parent Γ field map intertwines c_i with injective field maps; identity and composition laws follow. |
| `configurationComparison_K` | data | Restriction along rational primitive Hurewicz gives the comparison on the rank≤3 piece of K_{6−i}. |

The discriminating tests are:

- `configurationComparison_zero` (degenerate): Every c_i^(n) sends the zero homology class to zero.
- `configurationComparison_degree2` (characterisation): At i=2 its codomain is H²Γ and its group-homology degree is 4, correcting the final display on p. 298.
- `configurationComparison_stableFixture` (compatibility): The class represented by a degree-5 GL₃ configuration cycle has identical H¹Γ image after block stabilization to GL₄.

Source match: G95, Gon95 §2.5 Lemmas 2.12–2.16; §6 (6.4)–(6.8) — The construction on group homology precedes the restriction to rational K-theory.

### Rank-two vanishing

Declaration `Polylogarithms:P.3/rank-two-vanishing` (theorem). For n≥3 and i=1,2,3, c_i^(n) vanishes on the image of H_{6−i}(GL₂(F),Q). Thus restriction to K_{6−i}∩im H_{6−i}(GL₃) factors through its quotient by K_{6−i}∩im H_{6−i}(GL₂). No assertion identifies this rank-three graded quotient with an Adams eigenspace, and no factorization of all K_{6−i} through that quotient follows without a rank≤3 theorem.

Suggested name: `TauCeti.Polylog.WeightThree.rank_two_vanishing`.

The direct inputs are `Polylogarithms:P.3/stabilized-configuration-comparison`, `GeneralAlgebraicKTheory:K.2:plus`, `mathlib:Submodule.liftQ`, `Polylogarithms:P.3/k-theory-comparison-weight-three`, `KTheoryLowDegrees:U.1/stable-general-linear-group`.

The construction or proof proceeds as follows:

1. Fix a vector outside the GL₂ plane; it gives a GL₂-fixed section in the generic-vector resolution used in Gon95 §6.
2. The edge map into the weight-three quotient is consequently zero on this subgroup.
3. Intersect the stable homology images with the rational primitive K-space and apply the quotient universal property.

Acceptance: The quotient is rank≤3/rank≤2, in degrees 5,4,3 respectively. Adams-weight equivalence stays a conjectural P.4 input.

Source match: G95, Gon95 pp. 219–220 rank filtration; §6 pp. 297–298 — The rank-two vanishing and the precise domain of the rank-graded comparison.

### Top-degree configuration–Milnor comparison

Declaration `Polylogarithms:P.3/suslin-top-comparison` (comparison). Under the imported integral stability and Milnor-symbol isomorphism of K3BlochGroups:V.4/homological-stability, the rational map c₃ on the rank-three graded K₃ quotient agrees, via η:H³Γ≃K₃^M⊗Q, with the diagonal Milnor symbol map and primitive Hurewicz. This comparison is a normalization adapter; it does not replan Suslin’s homological stability. Compatibility with Quillen transfer in degree 3 needs a separate T.3 request.

Suggested name: `TauCeti.Polylog.WeightThree.suslin_top_comparison`.

The direct inputs are `Polylogarithms:P.3/steinberg-boundary-image`, `Polylogarithms:P.3/rank-two-vanishing`, `GeneralAlgebraicKTheory:K.2:plus`, `K2SymbolsBrauer:T.2/milnor-k-theory`, `Polylogarithms:P.3/milnor-degree-comparison`, `K3BlochGroups:V.4/homological-stability`, `K2SymbolsBrauer:T.3`.

The construction or proof proceeds as follows:

1. Import V.4/homological-stability; its Suslin source-proof gap remains with that owner. Compute the diagonal-symbol configuration image in degree 3 and compare the η normalization.
2. Use the requested primitive Hurewicz/rank interface to restrict the homology quotient to K₃.
3. Check that the diagonal-matrix Milnor symbol agrees with the configuration map before composing η.
4. The required primitive projection and symbol compatibility are requested below; Suslin’s own source was not obtained, and its existing V.4 source gap is inherited rather than duplicated.

Acceptance: The n=3 torsion allowance is 2-torsion, killed by Q. No integral isomorphism is asserted without that allowance.

Source match: G95, Gon95 p. 220 remark after Theorem 1.14, citing Suslin 1984 — This is the primary Goncharov statement of the Suslin input; access to Suslin’s own proof remains explicit.

## Top cohomology and transfers

The degree-three quotient is a presentation calculation, not another construction of Milnor K-theory. Its Steinberg subspace is exactly the image of the middle differential. Transporting Milnor norms through the parent equivalence then gives a concrete unconditional norm on H³. The usual restriction-degree law has coefficient [E:F], whereas applying the exterior cube to the ordinary unit norm would give its cube. The residue formula is imported with its finite-integral-closure hypotheses; ramification factors must not be inserted into that norm-residue sum. The final construction in this group states its weight-four hypothesis rather than treating it as an established theorem.

### Steinberg boundary image

Declaration `Polylogarithms:P.3/steinberg-boundary-image` (theorem). The image of d₂:B₂(F)⊗U_F→Λ³U_F is the span of u(1−x)∧u(x)∧u(y), x∉{0,1}, y∈F×. The canonical rational exterior-to-Milnor symbol map has exactly this kernel; hence H³Γ≃K₃^M(F)⊗Q. This is the presentation lemma supporting the imported parent comparison, not a second definition of Milnor K-theory.

Suggested name: `TauCeti.Polylog.WeightThree.steinberg_boundary_image`.

The direct inputs are `K2SymbolsBrauer:T.2/milnor-k-theory`, `K3BlochGroups:V.3/pre-bloch-group`, `Polylogarithms:P.3/polylogarithmic-complex`, `mathlib:exteriorPower.alternatingMapLinearEquiv`, `Polylogarithms:P.3/milnor-degree-comparison`, `K2SymbolsBrauer:T.2/milnor-alternating`.

The construction or proof proceeds as follows:

1. The supplier Milnor presentation is the tensor algebra modulo the two-sided Steinberg ideal.
2. Rational anticommutativity, including {a,a}={a,−1}, makes the degree-3 map factor through the native exterior cube; the −1 torsion disappears rationally.
3. In degree 3 the ideal is precisely the span of adjacent Steinberg pairs with one extra unit.
4. V.3 symbols generate B₂, so the differential has the same image.

Acceptance: {x,1−x,y} maps to zero. Repeating a rational unit gives zero in the rational exterior cube.

Source match: G95, Gon95 p. 218 Milnor presentation, p. 220 Suslin remark — The top-degree computation uses the algebraic presentation independently of Suslin’s Quillen comparison.

### Transfer on top cohomology

Declaration `Polylogarithms:P.3/cohomology-transfer` (construction). For a finite extension E/F define N_H³=η_F⁻¹∘(N^M_{E/F}⊗Q)∘η_E, where η is the parent H³–Milnor equivalence. It is transitive, satisfies projection and N_H³∘res=[E:F], and obeys residue–norm compatibility under the supplier’s finite-integral-closure hypotheses. This construction gives neither a B₃ transfer nor a chain map on Γ; applying Λ³ to the ordinary field norm is not the Milnor transfer.

The direct inputs are `Polylogarithms:P.3/steinberg-boundary-image`, `Polylogarithms:P.3/milnor-degree-comparison`, `K2SymbolsBrauer:T.4/milnor-transfer-transitivity`, `K2SymbolsBrauer:T.4/milnor-projection-formula`, `K2SymbolsBrauer:T.4/restriction-transfer-degree`, `K2SymbolsBrauer:T.3/transfer-and-norm-residue`, `Polylogarithms:P.3/residues-and-transfers`.

The construction or proof proceeds as follows:

1. Use the Steinberg boundary-image lemma to identify η and its symbol normalization.
2. Import the Milnor transfer, its transitivity, projection and degree laws from T.4.
3. Conjugate these maps and laws by η; use the parent residues and T.3 transfer–residue theorem.
4. In degree 3 the supplier’s right-uniformizer convention and the parent’s left-uniformizer convention have the same sign.

The API serves the source uses Gon95 pp. 239–241 transfer discussion; parent top-degree comparison (Provides the concrete formula used by the subsequent comparison and its normalization checks.). Names below are in `TauCeti.Polylog.WeightThree`.

| Declaration | Role | Required statement |
|---|---|---|
| `h3Transfer` | constructor | The Q-linear conjugate of the Milnor degree-3 norm. |
| `h3Transfer_eta` | compatibility | η_F∘N_H³=N^M∘η_E. |
| `h3Transfer_id` | simp | The transfer for F/F is identity. |
| `h3Transfer_comp` | functoriality | For a finite tower, the transfers compose. |
| `h3Transfer_res` | relation | N_H³∘res=[E:F] times identity. |
| `h3Transfer_projection` | compatibility | The product projection formula holds through η and the lower Milnor degrees. |
| `h3Transfer_residue` | compatibility | Residue after transfer is the sum of residue-field transfers, with no extra ramification multiplier. |

The discriminating tests are:

- `h3Transfer_identity` (degenerate): The base-extension identity gives the identity map.
- `h3Transfer_quadratic` (computation): For a quadratic extension, N_H³(res z)=2z for every z.
- `h3Transfer_notExteriorNorm` (non-example): As maps on the exterior cube of rational units, Λ³(N₁)∘Λ³(res₁)=d³ id for degree d. On H³, the Milnor norm satisfies N_H³∘res=d id. This contrasts the coefficient laws before quotienting; for number fields H³_Q=0, so no nonzero quadratic counterexample is asserted there.

Source match: G95, Gon95 pp. 239–241 transfer discussion; parent top-degree comparison — The unrestricted complex transfer is conditional there; top cohomology already has the supplier norm.

### Conditional transfer on the complex

Declaration `Polylogarithms:P.3/conditional-complex-transfer` (theorem). Assume the weight-four homotopy/residue resolution of Gon95 Conjecture 1.39: Γ(F(t),4)/Γ(F,4)→⊕_P Γ(F[t]/P,3)[−1] is a quasi-isomorphism, for monic irreducible P, with all maps interpreted in the derived category. For E=F[t]/P, insert its summand, invert this quasi-isomorphism and take minus the residue at infinity. After cancelling the shift this constructs a derived transfer Γ(E,3)→Γ(F,3). Its H³ map must agree with the previously constructed Milnor transfer. No unconditional B₃ or termwise transfer is inferred.

Suggested name: `TauCeti.Polylog.WeightThree.conditional_complex_transfer`.

The direct inputs are `Polylogarithms:P.3/cohomology-transfer`, `Polylogarithms:P.4/general-polylog-complex`, `Polylogarithms:P.4`, `Polylogarithms:P.5/residue-map`, `K2SymbolsBrauer:T.4/simple-transfer`.

The construction or proof proceeds as follows:

1. The residue-at-infinity map kills constants, hence factors through the quotient by Γ(F,4).
2. In the derived category compose the summand inclusion with the inverse of the assumed quasi-isomorphism and the negative infinity residue.
3. Compare H³ with the supplier’s Bass–Tate formula. For general finite extensions use simple-extension towers only after proving tower independence; this is recorded as a gap.

Acceptance: Weight THREE transfer requires the weight FOUR resolution. The result is derived, not automatically a chain map on the displayed terms.

Source match: G95, Gon95 pp. 239–241, Conjecture 1.39 and subsequent conditional transfer discussion — The stated source input is isolated with its precise proof obligations.

## The regulator and the every-family determinant

The real-valued functional descends on the explicit B₃ presentation and pulls back along each embedding. Comparing a configuration cocycle with a real one-dimensional Borel line only gives a real multiple; rationality needs calibration on a rational cycle with trilogarithm value ζ(3). The every-family statement additionally needs every δ₃-cycle to lift to stable degree-five homology, which is where the source's omitted higher-differential computation occurs. Primitive projection preserves the Borel pairing and suffices for regulator-image containment, without proving the conjectural full K₅ comparison. Finally a rational coordinate matrix multiplies the determinant by a rational scalar, including zero for dependent columns.

### Trilogarithm descent

Declaration `Polylogarithms:P.3/trilogarithm-descent` (construction). The parent single-valued function L₃(z)=Re(Li₃(z)−log|z|Li₂(z)+(1/3)log²|z|Li₁(z)), continuously extended at 0 and 1, induces a Q-linear L₃:B₃(C)→R. It kills the explicit 22-term, inversion and three-term relations with their constants. For an embedding σ:F→C, its composite with B₃(σ), restricted to ker δ₃=H¹Γ, gives the σ-coordinate regulator. Conjugate embeddings have equal coordinates.

The direct inputs are `Polylogarithms:P.1/single-valued-polylogarithm`, `Polylogarithms:P.3/trilogarithm-group`, `Polylogarithms:P.3/polylogarithmic-complex`, `mathlib:Finsupp.linearCombination`, `mathlib:Submodule.liftQ`, `Polylogarithms:P.3/trilogarithm-functional-relations`, `Polylogarithms:P.1/distribution-and-inversion`, `Polylogarithms:P.1/single-valued-continuity`.

The construction or proof proceeds as follows:

1. Import P.1’s single-valued function, continuity, inversion and distribution. Use the new functional-relation theorem for the 22-term identity; P.2 does not own this weight-three equation.
2. Extend to Q[C] by Finsupp.linearCombination and check each parent relation generator, retaining {1}₃.
3. Descend with Submodule.liftQ and use parent field functoriality for embeddings.

The API serves the source uses Gon95 p. 202 (1.4), p. 264 regulator descent (Provides the concrete formula used by the subsequent comparison and its normalization checks.). Names below are in `TauCeti.Polylog.WeightThree`.

| Declaration | Role | Required statement |
|---|---|---|
| `trilogDescent` | constructor | The induced Q-linear map B₃(C)→R. |
| `trilogDescent_mk` | simp | L₃([z]₃) equals the parent single-valued L₃(z). |
| `trilogDescent_sum` | compatibility | Evaluation of a formal finite sum is its rational linear combination of L₃ values. |
| `trilogDescent_conj` | relation | Complex conjugation leaves the descended functional invariant. |
| `trilogRegulatorAt` | data | The Q-linear functional on ker δ₃ obtained by pullback along σ. |
| `trilogRegulatorAt_conj` | compatibility | The σ and conjugate-σ coordinates agree. |

The discriminating tests are:

- `trilogDescent_zero` (degenerate): L₃([0]₃)=0.
- `trilogDescent_one` (computation): L₃([1]₃)=ζ(3)>0; [1]₃ cannot be killed.
- `trilogDescent_minusOne` (computation): L₃([−1]₃)=−3ζ(3)/4, so the image of R(1,1,1)=3[1]+4[−1] is zero.

Source match: G95, Gon95 p. 202 (1.4), p. 264 regulator descent — The quotient functional and its archimedean pullback supplement the parent regulator-comparison target.

### Configuration Borel class

Declaration `Polylogarithms:P.3/configuration-borel-class` (theorem). Over C, evaluating M₃ (equivalently the correctly normalized configuration map) by L₃ gives a measurable alternating configuration 5-cocycle. Its class is the comparison image of a nonzero class in H⁵_cts(GL₃(C),R), in the conjugation-even primitive Borel line. The measurable configuration cohomology in this degree is two-dimensional; one must project to the indicated parity/primitive line before using one-dimensionality.

Suggested name: `TauCeti.Polylog.WeightThree.configuration_borel_class`.

The direct inputs are `Polylogarithms:P.3/configuration-chain-comparison`, `Polylogarithms:P.3/trilogarithm-descent`, `BorelRegulators:R.3/compact-dual-cohomology`, `BorelRegulators:R.4/universal-borel-class`, `BorelRegulators:R.7`.

The construction or proof proceeds as follows:

1. Use Gon95 Theorem 9.1’s PGL₃-equivariant configuration spectral sequence; stabilizer cohomology is computed by measurable Shapiro.
2. The two classes are M₃ and the differential of the Bloch–Wigner face functional; track complex-conjugation parity.
3. Use Theorem 1.9 for the continuous-comparison lift and Proposition 1.11’s degenerate configuration test for non-coboundarity.
4. Import Borel’s primitive-line computation rather than constructing continuous group cohomology here.

Acceptance: The coefficient relating this class to Borel is initially a nonzero real number, not automatically rational. The degenerate {1} configuration evaluates to ζ(3).

Source match: G95, Gon95 Theorem 1.9, Proposition 1.11 and §9.1 Theorem 9.1 — The nonzero continuous class and the two-dimensional measurable calculation are kept distinct.

### Lifting trilogarithmic cycles

Declaration `Polylogarithms:P.3/cycle-lifting` (theorem). For every infinite F of characteristic zero, each z∈ker(δ₃:B₃(F)→B₂(F)⊗U_F) has a rational degree-5 stable GL homology class h whose configuration comparison equals z. For a number field the primitive projection of h has the same Borel pairing as h. This is the precise lifting input needed for all-family special values; it does not assert that H¹Γ is isomorphic to K₅^(3).

Suggested name: `TauCeti.Polylog.WeightThree.cycle_lifting`.

The direct inputs are `Polylogarithms:P.3/stabilized-configuration-comparison`, `Polylogarithms:P.3/trilogarithm-descent`, `GeneralAlgebraicKTheory:K.2:plus`, `BorelRegulators:R.4/universal-borel-class`, `K3BlochGroups:V.4`.

The construction or proof proceeds as follows:

1. Use the alternating rational resolution by all projective configurations in Gon95 §9.2, not merely the generic orbit complex.
2. Filter its PGL₃-equivariant homology spectral sequence; identify the degenerate-generator group on the E₂ diagonal with the trilogarithmic symbols and δ₃.
3. Compute the higher differentials to show every kernel element survives to total degree 5; the paper asserts this computation but does not display it.
4. Pass from PGL₃ to stable GL and primitive projection via the requested K-theoretic interface; the decomposable part has zero primitive Borel pairing.

Acceptance: The cycle [1]₃ has a homology lift pairing to ζ(3). The needed conclusion concerns regulator images, not injectivity of the K-comparison.

Source match: G95, Gon95 §9.2 pp. 310–311 — The asserted cycle-lifting computation is isolated as a theorem with an explicit proof gap.

### Rational regulator calibration

Declaration `Polylogarithms:P.3/rational-regulator-calibration` (theorem). Let b₃^G be Borel’s original real configuration normalization used by Gon95. Then the L₃ configuration class is a nonzero rational multiple of b₃^G. With the R.4 target-coordinates normalization, dividing R(2) by its Tate generator, the adapter is instead a nonzero rational multiple of π² times that coordinate regulator. The exact rational coefficient depends on the two universal-class conventions; it must be computed, not inferred from real one-dimensionality.

Suggested name: `TauCeti.Polylog.WeightThree.rational_regulator_calibration`.

The direct inputs are `Polylogarithms:P.3/configuration-borel-class`, `Polylogarithms:P.3/cycle-lifting`, `BorelRegulators:R.4/target-coordinates`, `BorelRegulators:R.4/borel-regulator`, `BorelRegulators:R.5/borel-zeta-proportionality`, `BorelRegulators:R.5/leading-term-functional-equation`, `Polylogarithms:P.3/trilogarithm-regulator-borel`, `BorelRegulators:R.7`.

The construction or proof proceeds as follows:

1. First obtain a nonzero real proportionality on the primitive parity-even line from the previous class node.
2. Lift [1]₃ over Q by §9.2 and evaluate L₃ to ζ(3).
3. Use Borel’s Q period statement in the same original real convention to prove the proportionality rational and nonzero.
4. Translate to R.4 using its universal-class normalization and Tate-coordinate adapter. Independently check the π² factor by R.5: its determinant period is sqrt|D| π^(−2r₁−5r₂)ζ_F(3), whereas the L₃ determinant period is sqrt|D| π^(−3r₂)ζ_F(3).
5. Record the exact class-level adapter as an open R.7 request; parent rational proportionality is not reused in a different normalization.

Acceptance: Over Q, L₃([1]₃)=ζ(3) and the normalized R.4 coordinate regulator has period π^(−2)ζ(3). The exponent discrepancy for general F is 2(r₁+r₂), the determinant of a π² coordinate adapter.

Source match: G95, Gon95 §9.2 p. 311 rational calibration; parent Borel suppliers — The rationality proof uses a nonzero rational cycle and a period comparison, not dimension alone.

### Regulator image containment

Declaration `Polylogarithms:P.3/regulator-image-containment` (theorem). For a number field F, write d=r₁+r₂, select all real embeddings and one embedding from each complex pair, and let R_L:H¹Γ(F,3)→R^d have coordinates L₃∘σ. Then im_Q R_L is contained in the Q-span of π² times the R.4 Borel regulator image on K₅(F)⊗Q. This containment suffices for every-family determinant rationality. It neither needs nor proves that the K₅ comparison is surjective or an isomorphism on all H¹Γ.

Suggested name: `TauCeti.Polylog.WeightThree.regulator_image_containment`.

The direct inputs are `Polylogarithms:P.3/cycle-lifting`, `Polylogarithms:P.3/rational-regulator-calibration`, `BorelRegulators:R.3/borel-rank-theorem`, `BorelRegulators:R.4/regulator-real-isomorphism`, `GeneralAlgebraicKTheory:K.2:plus`.

The construction or proof proceeds as follows:

1. Lift each cycle by the previous cycle-lifting theorem.
2. Apply the calibrated regulator-class equality at every selected embedding.
3. Replace stable homology by its primitive K-component, using the requested primitive Hurewicz interface and vanishing of primitive classes on decomposables.
4. Use the same coefficient at every embedding, since it is a universal class comparison over C.

Acceptance: Each regulator column has rational coordinates relative to a fixed Borel rational basis after the common π² adapter.

Source match: G95, Gon95 §9.2 p. 311, applied at all embeddings — The sufficient regulator-image statement separates the determinant argument from a stronger motivic comparison conjecture.

### Every-family special-value determinant

Declaration `Polylogarithms:P.3/every-family-special-value` (theorem). Let F be a number field, D_F its discriminant, d=r₁+r₂ and σ₁,…,σ_d the chosen embeddings. For ANY cycles z₁,…,z_d in ker δ₃, there exists q∈Q, possibly zero, with det(L₃(σ_i z_j))=q sqrt|D_F| π^(−3r₂) ζ_F(3). For some family q≠0, by the imported parent existence theorem. The orientation of this formula is essential: the reverse ζ_F(3)=q·det cannot hold for zero or dependent families.

Suggested name: `TauCeti.Polylog.WeightThree.every_family_special_value`.

The direct inputs are `Polylogarithms:P.3/regulator-image-containment`, `BorelRegulators:R.4/regulator-determinant`, `BorelRegulators:R.5/borel-positive-zeta-period`, `mathlib:Matrix.det_mul`, `Polylogarithms:P.3/weight-three-special-value`, `mathlib:NumberField.dedekindZeta`, `mathlib:NumberField.discr`, `mathlib:NumberField.InfinitePlace.nrRealPlaces`, `mathlib:NumberField.InfinitePlace.nrComplexPlaces`, `mathlib:NumberField.InfinitePlace.embedding`.

The construction or proof proceeds as follows:

1. Choose a rational Borel basis using the rank theorem and real regulator isomorphism.
2. Regulator-image containment writes every column as a rational matrix times π² times the Borel basis columns.
3. Use native Matrix.det_mul. R.5 gives the Borel determinant period sqrt|D| π^(−2r₁−5r₂)ζ_F(3) up to a nonzero rational scalar.
4. Multiply by π^(2d); the exponent becomes −3r₂. Singular rational coordinate matrices give q=0.
5. Import the parent existence theorem to obtain a family with nonzero determinant; do not duplicate its proof.

Acceptance: Taking all z_j=0 gives det=0 and q=0. For F=Q and z₁=[1]₃ the formula holds with q=1. Replacing a nonzero family by a rational matrix multiplies q by its determinant.

Source match: G95, Gon95 Theorem 1.1(a), §9.2; parent P.3 part (b) — The published existence theorem and the stronger every-family consequence have separate dependency chains.

## Normalization checks and source findings

The coordinate sum at a=b=c=1 is 3[1]+4[−1]. The complex values L₃(1)=ζ(3) and L₃(−1)=−3ζ(3)/4 make it zero, as required. The positive argument printed in Gon95 (1.16) instead gives 6[1]+[−1], with value 21ζ(3)/4. This is a direct contradiction with the same paper's functional equation and displayed specialization. The negative argument in Zhao's formula gives the corrected test. The generic geometric-to-coordinate adapter is still checked separately; one specialization alone cannot prove its full correctness.

The exterior-square check uses the canonical rational valuation coordinates of Q×⊗Q. Send u(x) to its prime-factorization vector; the class of −1 disappears because it is torsion. For each permutation, compute the three determinant-unit vectors and take their native alternating determinant wedge in prime order. On v(t)=(1,t,t²) at t=1,2,3,5,7, evaluation of d₂r₅ gives 36 u(2)∧u(3)∧u(5). The printed 2 Alt₄ after the deletion boundary gives −24 times this wedge. Replacing its coefficient by −3 gives 36. The wedge is nonzero because the rational unit classes of three distinct primes are independent. Three additional generic integer-vector fixtures give the same ratio −3/2. This is an exact rational calculation, not numerical evaluation of a polylogarithm, and independent review must confirm it.

The four-vector fixture in the tests has r₄=18 u(5)∧u(67)∧u(197), while its printed 2 Alt₄ value would be −12 times that wedge. For the moment-five fixture, scaling its first vector by 2 changes d₂r₅ from 36 to 18 times u(2)∧u(3)∧u(5). This verifies that the vector-configuration quotient retains information that a projective-point quotient would discard.

The regulator normalization has a second, independent coefficient issue. The R.4 regulator uses a Burgos-normalized universal class and coordinates obtained by dividing R(2) by its Tate generator. The corresponding R.5 Borel determinant period is proportional over Q to sqrt|D_F|·π^(−2r₁−5r₂)·ζ_F(3). The trilogarithm determinant period is sqrt|D_F|·π^(−3r₂)·ζ_F(3). Their ratio is π^(2d), so the coordinate adapter contains π², in addition to a nonzero rational factor. These determinant exponents detect the mismatch; they do not by themselves construct the universal-class comparison. R.7 owns that proof and its exact rational coefficient. Goncharov's claim about his original real Borel class cannot be copied as a plain rational-multiple claim for the R.4 coordinate convention.

- **Polylogarithms/E-P3-01 (misprint)**, Gon95 published p. 298, final c₂ display after (6.11): The c₂ target is H²(B_F(3)). Its input degree is 4 and the Γ indexing is i=6−4=2; Theorem 1.14 p. 220 and (6.11b) p. 297 both give H². No published erratum located; corrected locally from the adjacent source statements.
- **Polylogarithms/E-P3-02 (error)**, GR arXiv:1803.08585v5 §7.2 (142) and the following right-square assertion: With δ₂[x]=(1−x)∧x and the printed r₅, replace r₄ by −3 Alt₄. On v(t)=(1,t,t²) at t=1,2,3,5,7, d₂r₅=36 u(2)∧u(3)∧u(5), while the printed r₄∂=−24 times that basic wedge. The rational unit classes of distinct primes are independent. Alt₄=−6 f₀^(3) from Gon95 p. 264; the corrected r₄ is 18 f₀. Three additional generic rational fixtures give the same ratio −3/2. The failure persists with unnormalized alternation and zero-based deletion signs. New finding in this run; no correction located in v5 or its TeX source. Independent review must confirm.
- **Polylogarithms/E-P3-03 (gap)**, Gon95 published §9.2 p. 310: Display the spectral-sequence differentials and prove the asserted ker δ₃ cycle-lifting statement. The paper calls the computation unpleasant and states its result; it supplies no differential formulas there. The every-family determinant needs this precise step. Explicitly omitted computation in the source; no detailed primary replacement located.
- **Polylogarithms/E-P3-04 (misprint)**, Gon95 published p. 208 (1.16), sixth cyclic argument: Use {−a(bc−c+1)/(ca−a+1)}. Keep the coefficient +1. As printed, substitution a=b=c=1 gives 6[1]+[−1], whose L₃ value is 21ζ(3)/4, contradicting Theorem 1.3 and the explicitly printed p. 210 specialization 3[1]+4[−1]. The negative argument gives the latter. The geometric expression (1.10) and the independently displayed coordinate formula in Zhao’s supplement support the negative sign. The negative argument occurs in Zhao’s primary supplement formula (3); no publisher erratum for Gon95 located. Independent review must confirm the generic coordinate comparison.

## Coverage and remaining mathematical work

The follow-up covers all parent P.3 targets without changing their definitions. The table describes the proof chains that assembly should join to the parent. Coverage records a plan, not a certification that these theorems are proved.


| Parent target | Additional chain in this part |
|---|---|
| Explicit B₃ and Γ | Corrected coordinate relation → algebraic cobracket check; separate analytic functional identity |
| K-theory comparison | Generic coinvariants → Bigrassmannian → three maps → seven-term/duality → chain map → symmetrized resolution → stabilization → primitive/rank adapter |
| H³ and transfer | Steinberg image presentation → imported H³–Milnor equivalence → conjugated Milnor norms; full derived transfer remains conditional |
| Trilogarithm/Borel compatibility | Functional descent → measurable configuration class → primitive parity comparison → rational calibration and π² normalization |
| Special values | Parent existence theorem plus cycle lifting → primitive pairing → regulator-image containment → every-family determinant, with zero allowed |

The layer has two new planets, **Grassmannian configurations** and **Configuration comparison**. The parent's **Trilogarithmic motivic complex** and **Zagier's conjecture for ζ_F(3)** remain its existing landmarks; no duplicate planets are proposed. Assembly therefore has four P.3 planets, within the limit of six.

- **Configuration normalization and duality verification.** The primary duality proof in Gon95 §§7–8 and the GR v5 chain-map formulas have been read. The coefficient −3 Alt₄ is forced by the rational right-square computation. A fully checked adapter from Gon95’s M₃ and the geometric G₃ presentation to the corrected coordinate B₃ presentation, including choice-independence and the precise 3/2, 1/5 and old-map factors, remains to be written. Gon95 Theorem A asserts the needed rational isomorphism; its full §§4–5 proof has not been read. This must be resolved before treating the chain map as proved. Consuming declarations: `Polylogarithms:P.3/configuration-chain-comparison`, `Polylogarithms:P.3/geometric-trilogarithm-comparison`, `Polylogarithms:P.3/trilogarithm-duality`.
- **Analytic proof of corrected 22-term identity.** Gon95 Theorem 1.3 states the needed functional identity. Supply the full derivative/constant/continuation argument for the corrected coordinate expression, or a primary detailed analytic proof; the source theorem and GR cobracket proof alone do not display this analytic step. Consuming declarations: `Polylogarithms:P.3/trilogarithm-functional-relations`, `Polylogarithms:P.3/trilogarithm-descent`.
- **Cycle-lifting higher differentials.** Gon95 §9.2 asserts without displaying the unpleasant computation of higher differentials that ker δ₃ lifts to H₅(PGL₃(F),Q). Write those differentials and surviving-edge identification, then check PGL-to-stable-GL passage and primitive pairing. This is the decisive unresolved proof for the all-family conclusion; do not assume the stronger H¹Γ≃K₅^(3) conjecture. Consuming declarations: `Polylogarithms:P.3/cycle-lifting`, `Polylogarithms:P.3/regulator-image-containment`, `Polylogarithms:P.3/every-family-special-value`.
- **Suslin primary proof and primitive symbol adapter.** The integral homology/Milnor statement is imported from K3BlochGroups:V.4/homological-stability, which already owns its missing Suslin 1984 source proof. The primary text was not obtained (MathNet access failed). The new work is the diagonal-symbol, primitive-Hurewicz and configuration normalization adapter. Do not claim a second proof or integral transfer compatibility. Consuming declarations: `Polylogarithms:P.3/suslin-top-comparison`.
- **Exact regulator-class normalization.** R.4 uses Tate-divided R(2) coordinates and a Burgos-normalized class. Gon95’s original real Borel class has a different convention. The determinant exponents force a π² factor per coordinate; computing the exact universal class adapter is requested from R.7. Until then the parent plain rational-multiple wording cannot be applied to R.4 coordinates. Consuming declarations: `Polylogarithms:P.3/rational-regulator-calibration`, `Polylogarithms:P.3/regulator-image-containment`, `Polylogarithms:P.3/every-family-special-value`.
- **Unconditional complex transfer.** Only the H³ transfer is unconditional from Milnor norms. Gon95’s derived construction assumes the weight-four homotopy/residue quasi-isomorphism and does not establish tower independence of termwise B₃ transfers. P.4 owns the higher-weight hypothesis; a proof of it or a separate transfer construction is required. Consuming declarations: `Polylogarithms:P.3/conditional-complex-transfer`.

The supplier requests make the unresolved ownership explicit:

- **`GeneralAlgebraicKTheory:K.2:plus`:** Part II: natural rational primitive Hurewicz K_n(F)_Q≃Prim H_n(GL(F),Q), stable block-sum Hopf structure, primitive/decomposable splitting and compatibility with the rank≤r filtration. In degree 3 compare the primitive rank quotient and Suslin’s diagonal Milnor map; in degree 5 primitive Borel pairing kills the decomposable complement. This is not the arithmetic-only Cartan–Serre node in BorelRegulators R.3.
- **`K3BlochGroups:V.4`:** Part II extension of the existing hyperhomology-map: arbitrary bounded-below complexes of Q-linear representations and an acyclic augmented symmetrized generic-vector resolution, with the natural edge map to homology of coinvariants. Retain the existing projective-point configuration model as the integral specialization.
- **`BorelRegulators:R.7`:** Continuous/measurable configuration comparison with primitive and conjugation-even degree-5 Borel lines; exact conversion from Goncharov’s original real normalization to R.4 universal class and Tate-divided coordinates. Prove its universal π²·Q× factor and compute the rational coefficient in the chosen convention.
- **`K2SymbolsBrauer:T.3`:** Part II degree-3 Milnor–Quillen transfer compatibility after the top rank comparison, with its exact sign and torsion allowance. The existing milnor-quillen-transfer-comparison supplies degree 2 only. Needed to assert Quillen-transfer naturality, not to define the H³ Milnor transfer.
- **`Polylogarithms:P.4`:** Weight-four homotopy/residue quasi-isomorphism Γ(F(t),4)/Γ(F,4)→⊕_P Γ(k(P),3)[−1] (Gon95 Conjecture 1.39), or a proof-independent derived transfer with tower independence and agreement with Milnor top cohomology. Treat the conjectural hypothesis explicitly; explicit-to-inductive B₃ is not a proved isomorphism.

The Lean prototype uses individual Mathlib imports and concrete native carriers. Definition APIs and tests that cannot yet be stated with a faithful supplier carrier are named in comments with the exact missing interface; none is represented by a placeholder proposition. Several native index-transport statements are likewise marked rather than hiding a dimension equality. This limitation is part of the planning interface, and the handoff identifies it for assembly. In particular a successful signature check says nothing about the unproved duality normalization, analytic functional identity, omitted higher differentials or regulator calibration.

At assembly, reconcile three parent statements explicitly: the rank-restricted comparison domain, the π² coordinate normalization, and the determinant orientation for arbitrary families. The parent packet is left unchanged by this issue. A complete plan for P.3 is available for independent review, while the six listed gaps prevent closure.
