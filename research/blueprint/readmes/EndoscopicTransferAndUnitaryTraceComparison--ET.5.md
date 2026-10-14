# Counting and stabilizing Igusa correspondences

**Summary.** ET.5 constructs the algebraic isocrystal and finite Igusa data needed to turn compact-support Hecke traces into a count of polarized effective triples. It calculates the centralizer mass, stabilizes through ordinary endoscopy, constructs the p-component through the Newton Levi and proves the stable elliptic Igusa identity with its kernel, Tamagawa and outer-automorphism factors. Negative central Frobenius shifts extend finite virtual-character identities to arbitrary compactly supported functions. The domain of the geometric stable orbital formula remains the acceptable functions. Every target below has its hypotheses and proof route; definition and construction targets also have a planning API and discriminating checks.

## Conventions and scope

The standing data are simple integral unramified PEL data of type A or C, with positive involution, self-dual lattice, hyperspecial p-level and neat prime-to-p level. Type D is excluded. Write k=F̄_p, L=Frac W(k), σ for Witt Frobenius, ℓ≠p, G for the rational PEL similitude group and μ for its Hodge cocharacter. The rational Dieudonné functor is dual to the usual contravariant functor: μ_{p∞} has weight −1. A polarized BT group with decreasing slopes λ_1>⋯>λ_r has Newton weights −λ_i, and the admissible locus is B(G,−μ). All tensor isocrystals are finite-dimensional even though the pinned carrier does not impose that condition.

For a decent b choose a common s>0, integral on its slopes and large enough for all finite-field descent data. The quasi-isogeny group J_b is an inner form of M_b=Z_G(ν_b); it is not generally Q_p-isomorphic to M_b. The root convention defines P(ν) by roots pairing negatively with ν. On a slope block, fr^{−sN} changes v_i to v_i−sNλ_i. The shifted function is φ^(N)(x)=φ(x(fr^s)^N), so its support is translated by the negative power.

At finite level U, e_g=1_{UgU}/vol(U) is the normalized correspondence function. Its integrated trace is the normalized finite correspondence trace; 1_{UgU} contributes vol(U) times that value. All orbital integrals use compatible centralizer quotient measures; the archimedean factors are compact modulo the specified real split centre and retain their central characters. Ordinary p-adic conjugacy of δ∈J_b(Q_p) must be distinguished from sigma-conjugacy of b∈G(L). Stable and rational semisimple conjugacy need not agree even for a connected centralizer.

## Existing foundations and supplier contracts

The library pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed atlas library audit has no ET entry; each baseline declaration below was read directly at its pin. The current upstream roadmaps and Tau Ceti library were checked before assigning these targets. Existing class-field/Brauer and reductive-group layers remain their owners.

- **`mathlib:WittVector.Isocrystal`** (Mathlib/RingTheory/WittVector/Isocrystal.lean): A module over Frac(W(k)) with a bijective Frobenius-semilinear operator, for perfect integral-domain k. Finite dimension is an additional hypothesis.
- **`mathlib:WittVector.IsocrystalEquiv`** (Mathlib/RingTheory/WittVector/Isocrystal.lean): A linear equivalence commuting with the two isocrystal Frobenius operators.
- **`mathlib:WittVector.StandardOneDimIsocrystal`** (Mathlib/RingTheory/WittVector/Isocrystal.lean): The one-dimensional carrier with Frobenius p^m times Witt Frobenius, m an integer.
- **`mathlib:WittVector.isocrystal_classification`** (Mathlib/RingTheory/WittVector/Isocrystal.lean): For algebraically closed k, every isocrystal of finrank one is equivalent to a standard integral-slope isocrystal. This does not classify arbitrary finite rank or G-structure.
- **`mathlib:AlgebraicGeometry.Scheme`** (Mathlib/AlgebraicGeometry/Scheme.lean): Locally ringed spaces locally isomorphic to an affine spectrum; a scheme carrier, without an Igusa moduli functor or l-adic six operations.
- **`mathlib:MeasureTheory.Measure.IsHaarMeasure`** (Mathlib/MeasureTheory/Group/Measure.lean): Left invariance, finiteness on compact sets and positivity on nonempty open sets. Quotient and Tamagawa measures are separate; regularity is separate unless supplied by local-group hypotheses.
- **`mathlib:Matrix.vandermonde`** (Mathlib/LinearAlgebra/Vandermonde.lean): Finite matrix whose (i,j)-entry is v_i^j.
- **`mathlib:Matrix.det_vandermonde`** (Mathlib/LinearAlgebra/Vandermonde.lean): The product formula det(V)=product over i<j of (v_j-v_i), over a commutative ring.
- **`tauceti:TauCeti.AlgebraicGeometry.AbelianVariety`** (TauCeti/AlgebraicGeometry/AbelianVariety/Basic.lean): A proper geometrically integral group scheme over a field, with derived smoothness, commutativity and geometric connectedness. This is an existing carrier, not finite-field Tate full faithfulness or Honda existence.

AbelianSchemesAndArithmeticModuli:A3,A4,A6 supplies abelian quotients, Tate modules, rational isogeny/torsor categories, Rosati positivity and the supporting Hom/characteristic-polynomial results. FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1–2 supplies BT groups, Cartier duality, rational Dieudonné full faithfulness and the general slope/isogeny classification. PELModuli:M0 and M2 supplies the determinant condition and integral moduli/deformation framework. ReductiveGroupsPartII:RG2.5 supplies the dual-centre/algebraic fundamental-group dictionary. ET.0 supplies rational/stable conjugacy, global obstruction and Tate–Nakayama; ET.1 and ET.3 supplies ordinary transfer and orbital integrals; ET.4 supplies smooth admissible character distributions, Tamagawa numbers, archimedean Lefschetz factors and the stable/twisted interface.

EtaleDualityAndPerverseSheaves:EDC.8 is the unique owner of general cohomological correspondences, local terms and the Fujiwara–Varshavsky theorem. The Igusa application verifies the actual algebraic legs, compatible Frobenius model and coefficient lift. In Theorem 2.3.2(b) of Varshavsky, take U=X: c_1 is proper and c_2 is quasi-finite on the entire finite-type scheme, and X\U is empty, hence locally invariant. The generic proof’s compactification and boundary contraction remain EDC.8 targets. Properness of the Igusa variety itself is unnecessary.

- **CFT — `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`.** The existing Brauer local invariant exact sequence: local invariants sum to zero, and vanishing denominator multiples characterize splitting and global embeddings. Consume the upstream layer, never replan it. Needed by [Finite-field Tate full faithfulness and Honda classification](#finite-field-tate-honda), [Geometric B-linear isogeny classification and division invariants](#unpolarized-padic-type-classification), [Polarized realizations, global cohomology and near-equivalence fibres](#polarized-realization-near-equivalence).
- **TRACE — `EtaleDualityAndPerverseSheaves:EDC.8`.** The existing coefficient correspondence c_2!c_1*L→L and compact-support trace theorem for a finite-type finite-field scheme with c_1 proper, c_2 quasi-finite, and sufficiently large Frobenius power. Its ramification/contraction bound is coefficient-independent for the fixed correspondence. The generic compactification and local-term machinery remain EDC.8. Needed by [Finite-level Hecke correspondences and coefficient lifts](#finite-correspondence-geometry), [Large negative Frobenius shifts give the compact-support fixed-point trace](#large-frobenius-fixed-point-trace).
- **UNITARY — `EndoscopicTransferAndUnitaryTraceComparison:ET.0`.** In the precise CS unitary similitude data, prove ker¹(Q,G)=1 using the simply connected derived group and the determinant/similitude torus with its global norm local-to-global theorem. This is the necessary evaluation before specializing the general |ker¹| prefactor to 1. Needed by [Unitary specialization and the endoscopic coefficients](#unitary-stable-specialization).
- **MASS — `EndoscopicTransferAndUnitaryTraceComparison:ET.4`.** The specified Tamagawa identity |A_Q(I_0)|/|K(I_0/Q)|=τ(G)|ker¹(Q,G)| and compatible inner-centralizer/real norm-one quotient measures. Preserve the existing primary-source proof gaps in ET.4 rather than inferring the mass from a finite stabilizer count. Needed by [Unstabilized Igusa counting with centralizer masses](#orbit-mass-counting), [Finite obstruction Fourier expansion and transfer away from p](#prestabilization-awayp).
- **ARCH — `EndoscopicTransferAndUnitaryTraceComparison:ET.4`.** Lefschetz functions compact modulo A_H(R)^0, with ξ and L-embedding central character, and stable orbital integrals zero for nonelliptic, nontransfer and non-(G,H)-regular classes, sufficient to restrict the stable sum to the domain of Shin Lemma 6.5. Needed by [Finite obstruction Fourier expansion and transfer away from p](#prestabilization-awayp), [Adelic endoscopic test functions and stable choice independence](#global-test-function), [Stable elliptic Igusa trace formula with all mass factors](#stable-trace-with-normalizations).

## ET.5. Counting and stabilizing Igusa correspondences

The targets form four consecutive mathematical steps: algebraic isocrystals and finite Igusa geometry; polarized types and effective fixed-point parameters; orbital masses and ordinary endoscopic stabilization; and central-character separation. Definitions have their full mathematical carriers and intended API here. The suggested file keeps only the lightweight valuation and finite-sum signatures whose carriers exist at the pins.

<a id="algebraic-g-isocrystals"></a>

### 1. Algebraic G-isocrystals and sigma-conjugacy

**Definition.** For connected reductive G/Q_p, k=F̄_p, L=Frac W(k), and Witt Frobenius σ, define B(G) as G(L) modulo b′=g⁻¹bσ(g). A G-isocrystal is an exact faithful Q_p-linear tensor functor Rep_Qp(G)→Isoc(k); its underlying L-valued fibre functor is isomorphic to scalar extension of the usual one. The functor attached to b sends (V,ρ) to (V⊗L,ρ(b)σ). Isomorphism classes identify with B(G); the automorphism functor of this tensor functor gives J_b. Finite rank is separate from the pinned isocrystal carrier; the full slope classification comes from R07.2, not its rank-one Mathlib special case.

**Hypotheses.** Connected reductive G; algebraically closed residue field; rational, not integral, coefficients.

**API.**

- **`GIsocrystal.ofElement`** (constructor): (V,ρ)↦(V⊗L,ρ(b)σ), preserving tensor products, duals and exact sequences.
- **`GIsocrystal.changeTrivialization`** (compatibility): The change by g identifies b with g⁻¹bσ(g).
- **`GIsocrystal.classification`** (equivalence): The quotient of elements by sigma-conjugacy equals isomorphism classes of these tensor functors.
- **`GIsocrystal.aut`** (characterisation): Tensor automorphisms of the functor equal the sigma-centralizer functor of b.

**Checks.**

- **rank_one.** For G=G_m the class of p^m has integral slope m and agrees with StandardOneDimIsocrystal; m=0 is the unit isocrystal.
- **fractional_rank_two.** For GL_2, Φ(e_1)=e_2 and Φ(e_2)=p e_1 gives slope 1/2 twice, and is not a sum of two rank-one integral-slope objects.
- **sigma_not_ordinary.** If b′=g⁻¹bσ(g), multiplication by g intertwines Frobenius. Replacing σ(g) with g makes that intertwining equation fail unless σ(g)=g.

**Uses.** [PEL Dieudonné comparison and quasi-isogeny groups](#pel-isocrystal-comparison): Relates quasi-isogenies to the tensor centralizer. [Newton and Kottwitz invariants with the PEL sign](#newton-kottwitz-invariants): Supplies the domain of both invariants.

**Proof route.**

1. Use the pinned semilinear carrier and the tensor/representation dictionary supplied by reductive groups.
2. Trivialize the L-valued fibre functor; changing its trivialization changes b by sigma-conjugation. Frobenius-compatible tensor isomorphisms are exactly those conjugators.
3. Use Steinberg vanishing over L to justify the trivialization; record the tensor-descent primary-proof boundary G1.

**Acceptance.** For GL_n the class is the isocrystal isomorphism class, not ordinary conjugacy.

**Direct prerequisites.** `mathlib:WittVector.Isocrystal`, `mathlib:WittVector.IsocrystalEquiv`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-manin-classification`, `ReductiveGroupsPartII:RG2.5/langlands-dual-group`.

**Sources.** [R. E. Kottwitz, Isocrystals with additional structure](https://www.numdam.org/article/CM_1985__56_2_201_0.pdf), §§3–4.2, pp.211–213. Constructs the tensor slope functor from b. [S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §4.2, Definition 4.5 and Lemmas 4.6–4.7, pp.10–11. Identifies the tensor category with concrete PEL isocrystals and their automorphisms.

<a id="newton-kottwitz-invariants"></a>

### 2. Newton and Kottwitz invariants with the PEL sign

**Construction.** For connected reductive G/Q_p, let D be the protorus with X*(D)=Q, π₁(G)=X_*(T)/coroot lattice with its Galois action, and N(G) the Galois-fixed geometric conjugacy classes of maps D→G. Define ν̄_G:B(G)→N(G) through rational slope decompositions in every representation, and κ_G:B(G)→π₁(G)_Γ. Both are functorial for group homomorphisms, and the image of ν̄ under abelianization equals κ⊗Q. For quasi-split G and a conjugacy class μ, B(G,−μ) means κ=−μ^natural and ν̄≤(−μ)^diamond in the dominant order (choose the dominant member before Galois averaging). This is a definition of the admissible locus, not a claim that every element occurs in a PEL special fibre. For the dual Dieudonné convention used below, BT slopes λ give ν weights −λ.

**Hypotheses.** Fix a based root datum for dominance; μ and Galois action are specified.

**API.**

- **`NewtonMap.representation`** (characterisation): For any representation, ν acts with precisely the slopes of its isocrystal.
- **`KottwitzMap.functorial`** (functoriality): For f:G→H, κ_H(f_*b)=π₁(f)_Γ κ_G(b), and ν_H=f∘ν_G up to conjugacy.
- **`AdmissibleClass.mem`** (characterisation): Membership is the simultaneous κ equality and dominant Newton inequality.
- **`Invariants.innerTwist`** (compatibility): Inner forms have the canonical common π₁ with its Galois action; no arbitrary map of dual centres is assumed.

**Checks.**

- **gm.** G_m: κ(p^m)=m and ν(p^m)=m; the admissible locus for −μ consists of the single class −μ.
- **gl2half.** The rank-two slope-1/2 example has κ=1. Its dual has slope −1/2 twice and κ=−1.
- **basic_not_zero.** For GL_n a central slope r is basic even when nr≠0; basic means central ν, not trivial κ.
- **mu_average.** For a non-Galois-invariant μ the bound uses the average of its dominant conjugates, rather than μ itself.

**Uses.** [Decent representatives, Newton Levi and J_b](#decent-levi-and-jb): Defines the Levi and decency equation. [Igusa triples, centralizer isocrystals and the effective obstruction](#effective-triples-and-invariant): κ on the centralizer computes the local invariant at p.

**Proof route.**

1. Obtain the slope protorus grading from finite-dimensional isocrystals.
2. Use the algebraic fundamental group and the torus valuation map; extend by reductive-group descent as in RR Theorem 1.15.
3. Pin the duality and sign at the PEL comparison, and retain the primary general κ construction as G1.

**Acceptance.** For GL_n, κ is v_p(det b) and ν̄ lists slopes; Σ of BT slopes λ_i gives κ=−Σλ_i with multiplicities.

**Direct prerequisites.** [Algebraic G-isocrystals and sigma-conjugacy](#algebraic-g-isocrystals), `ReductiveGroupsPartII:RG2.5/dual-centre-and-fundamental-group`.

**Sources.** [M. Rapoport and M. Richartz, On the classification and specialization of F-isocrystals with additional structure](https://www.numdam.org/item/CM_1996__103_2_153_0.pdf), §§1.7–1.15, pp.156–162. Gives Newton, the algebraic fundamental group and their compatible functorial invariants. [S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §4.1, pp.8–10; Definition 4.11, p.12. Uses B(G,−μ) for the dual Dieudonné convention.

<a id="decent-levi-and-jb"></a>

### 3. Decent representatives, Newton Levi and J_b

**Construction.** For quasi-split connected reductive G/Q_p and [b]∈B(G), choose a representative whose Newton map ν_b is rational and an integer s>0 with bσ(b)⋯σ^{s−1}(b)=(sν_b)(p) and sν_b integral. Then b∈G(L_s), M_b=Z_G(ν_b) is a Q_p-Levi and b is basic in M_b. The functor R↦{g∈G(L⊗_Qp R):g=bσ(g)b⁻¹} is represented by a reductive Q_p-group J_b, an inner form of M_b with descent cocycle Int(b). Fix an L_s-inner isomorphism ψ:J_b→M_b; transport stable classes to G geometrically. Changing b by sigma-conjugation changes J_b by an isomorphism canonical up to inner automorphism. The pair (M_b,[b] in B(M_b)) has a rational-conjugacy orbit independent of these choices. This last statement concerns classes in B(M_b), not rational conjugacy of every pair of actual representatives.

**Hypotheses.** Quasi-split G for rational Newton Levi; decency integer can be enlarged.

**API.**

- **`Jb.points`** (characterisation): The displayed Frobenius-commuting equation describes R-points for every Q_p-algebra R.
- **`Jb.innerNewtonLevi`** (equivalence): ψ identifies J_b and M_b only after splitting the inner twist.
- **`Jb.sigmaConjugacy`** (functoriality): If b′=g⁻¹bσ(g), conjugation by g⁻¹ identifies the point functors, up to inner automorphism for another choice.
- **`DecentRepresentative.enlarge`** (compatibility): Replacing s by a positive multiple preserves decency and makes all slope products integral.
- **`NewtonLevi.classIndependence`** (compatibility): The rational-conjugacy class of the pair (M_b,[b]_M) is independent of a rational Newton representative.

**Checks.**

- **trivial.** b=1 gives ν=0, M_b=G and J_b=G.
- **division_basic.** GL_2 with isoclinic slope 1/2 has J_b=D^× for the quaternion division algebra; it is not GL_2(Q_p) as a rational group.
- **ordinary.** GL_2 with distinct slopes 0 and −1 has M_b=G_m×G_m and J_b split; the two-block slope order is retained.
- **representative_class.** Kottwitz Proposition 6.3 identifies classes in B(M); no assertion b′=gbg⁻¹ for arbitrary decent representatives is an API item.

**Uses.** [The slope-separated quasi-isogeny monoid](#igusa-monoid): Identifies quasi-isogenies and the central Frobenius element. [Effective Levi endoscopy for the Igusa p-factor](#effective-levi-endoscopy): Provides the inner twist on the p-adic endoscopic side.

**Proof route.**

1. Use Kottwitz §§4.3 and 6.2 to choose rational ν and solve the decency equation after finite unramified extension.
2. Descend the Levi by Int(b); centrality of the decency product makes the cocycle valid.
3. Identify the fixed functor with the descended group, and prove its independence using sigma-conjugators. The general representability argument is source boundary G1.

**Acceptance.** If b is basic, M_b=G but J_b can be a nonsplit inner form.

**Direct prerequisites.** [Algebraic G-isocrystals and sigma-conjugacy](#algebraic-g-isocrystals), [Newton and Kottwitz invariants with the PEL sign](#newton-kottwitz-invariants), `EndoscopicTransferAndUnitaryTraceComparison:ET.0/inner-twist`.

**Sources.** [R. E. Kottwitz, Isocrystals with additional structure](https://www.numdam.org/article/CM_1985__56_2_201_0.pdf), §4.3, pp.213–214; §§5.2 and 6.2–6.5, pp.215–216,219–220. Constructs decency and the inner form, with invariance of the Levi class. [M. Rapoport and M. Richartz, On the classification and specialization of F-isocrystals with additional structure](https://www.numdam.org/item/CM_1996__103_2_153_0.pdf), §1.11–1.12, pp.158–159. States representability of the centralizer functor and its basic criterion. [S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §3.2, p.10. Fixes the decent representative and inner isomorphism for transfer.

<a id="pel-isocrystal-comparison"></a>

### 4. PEL Dieudonné comparison and quasi-isogeny groups

**Comparison.** For unramified integral simple PEL data of type A or C (positive involution, split matrix B_p over unramified centres, self-dual O_B-stable lattice and positive h), use the dual of the usual contravariant rational Dieudonné module. It sends μ_{p∞} to L(−1), and a polarized BT group with B_p-action to a hermitian isocrystal with pairing valued in L(−1). The determinant condition cuts out the classes in B(G,−μ) that arise from these BT groups. For Σ of class b, rational quasi-isogenies preserving the action and polarization up to scalar identify with J_b(Q_p), canonically up to inner automorphism. Quasi-isogenies to another such BT group are exactly its Frobenius-compatible hermitian isocrystal isomorphisms.

**Hypotheses.** The comparison is over F̄_p in the isogeny category; the pairing is nondegenerate and its similitude scalar is retained. Type D is excluded. The membership condition does not assert nonemptiness of every Shimura Newton stratum.

**Proof route.**

1. Consume R07.2 Dieudonné full faithfulness and Cartier duality.
2. Dualize and track the Tate twist through the pairing: all λ become −λ.
3. Apply the concrete/tensor dictionary of Shin §4.2 and identify the automorphism functor.

**Acceptance.** The multiplicative BT group has slope 1 before dualization and weight −1 after it; the étale group has weight 0.

**Direct prerequisites.** [Algebraic G-isocrystals and sigma-conjugacy](#algebraic-g-isocrystals), [Newton and Kottwitz invariants with the PEL sign](#newton-kottwitz-invariants), [Decent representatives, Newton Levi and J_b](#decent-levi-and-jb), `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-p-divisible`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-cartier-dual`, `PELModuli:M0/determinant-condition`.

**Sources.** [S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §4.2–4.3, Lemmas 4.7 and 4.14, pp.10–13. The hermitian and tensor comparisons identify J_b with polarized quasi-isogenies.

<a id="central-leaf-slope-data"></a>

### 5. Central leaves and completely slope-divisible families

**Definition.** Fix the good-reduction PEL special fibre X_K over F̄_p and a polarized O_B-BT group Σ=⊕Σ_i with slopes 1≥λ_1>⋯>λ_r≥0. Its central leaf C_Σ is the reduced locus where the geometric BT group with all additional structures is isomorphic to Σ, inside the Newton stratum with class b. It is smooth and closed in that stratum, not necessarily closed in X_K. A BT group H is completely slope divisible if it has a filtration whose graded pieces have slopes λ_i and, for one common s>0, p^{−sλ_i}F^s is an isomorphism on each graded piece and induces the required isogenies on the filtered pieces; use the exact filtration/isogeny condition of Mantovan §3. For a completely slope-divisible Σ, H=A[p∞]|C_Σ has this filtration, equivariant for O_B, and the polarization pairs grade i with the complementary slope 1−λ_i. Over a perfect field the filtration splits; it need not split over C_Σ.

**Hypotheses.** Unramified integral PEL type A or C, hyperspecial level at p and neat prime-to-p level; reduced schemes, all geometric fibres. Choose Σ satisfying the determinant condition.

**API.**

- **`CentralLeaf.geometricPoints`** (characterisation): x lies in C_Σ iff A_x[p∞]≅Σ with O_B-action and polarization up to a common unit.
- **`CentralLeaf.newton`** (coercion): C_Σ→X^b is a closed immersion into its Newton stratum, with reduced structure.
- **`SlopeFiltration.functorial`** (functoriality): BT morphisms preserve the filtration; O_B acts on its pieces and duality pairs complementary slopes.
- **`SlopeFiltration.perfectFibre`** (equivalence): Over a perfect field the completely slope-divisible group is the sum of its graded pieces; this is not imposed on the entire family.
- **`CentralLeaf.level`** (compatibility): Prime-to-p level projections and Hecke maps preserve the central-leaf system.

**Checks.**

- **ordinary.** For an ordinary elliptic BT group over F̄_p the pieces are μ_{p∞} and Q_p/Z_p, of slopes 1 and 0.
- **basic.** For a single slope the filtration has one graded piece; the leaf still remembers the integral BT group, not just its rational isocrystal.
- **duality.** If the polarization is principal, the multiplicities at λ and 1−λ agree; an isolated slope 0 without a slope 1 partner cannot be such a polarized datum.
- **fibre_not_family.** A family with nontrivial extensions may have split perfect fibres; replacing H by the direct sum of grades as a family is not part of this definition.

**Uses.** [Finite-level Igusa moduli and deck groups](#finite-igusa-moduli): Supplies the graded BT groups to trivialize. [The slope-separated quasi-isogeny monoid](#igusa-monoid): The slope gaps control gluing of kernel subgroups.

**Proof route.**

1. Use the PEL representable smooth model and its universal BT group.
2. Apply the central-leaf and slope-filtration results quoted in Mantovan §3; retain their primary proof boundary G2.
3. Morphisms preserve slopes, and duality exchanges λ and 1−λ; this gives the inherited action and graded pairings.

**Acceptance.** Fixing an isogeny class defines the Newton stratum; fixing an isomorphism class defines the finer central leaf.

**Direct prerequisites.** `PELModuli:M2/representability`, `PELModuli:M2/formal-smoothness`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.1/p-divisible-group`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/dieudonne-slopes`, [PEL Dieudonné comparison and quasi-isogeny groups](#pel-isocrystal-comparison), `mathlib:AlgebraicGeometry.Scheme`.

**Sources.** [E. Mantovan, On the cohomology of certain PEL type Shimura varieties](https://www.its.caltech.edu/~mantovan/papers/PEL.pdf), §3, Proposition 1 and Proposition 2, pp.7–10. Defines structured central leaves, their smoothness and the graded slope condition. [S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §5, pp.15–16. Chooses a completely slope-divisible group and its central leaf.

<a id="finite-igusa-moduli"></a>

### 6. Finite-level Igusa moduli and deck groups

**Construction.** For m≥1 define Ig_{K^p,m} over C_{Σ,K^p} by O_B-equivariant isomorphisms j_i:Σ_i[p^m]→gr_i(A[p∞])[p^m], compatible with the graded polarization up to one common unit modulo p^m, which extend étale locally to every higher truncation. With Γ_b=Aut_O_B,λ(Σ)⊂J_b(Q_p) and U_p(m)=ker(Γ_b→Aut(Σ[p^m])), this functor is a finite étale Γ_b/U_p(m)-torsor over the leaf. It is smooth, finite type and usually nonproper. Higher level maps are finite étale and are restriction of the j_i. The U_p(m) form a basis of compact open subgroups of Γ_b. Ig_∞ denotes the inverse system and its inverse-limit geometric points, not a new finite-type scheme.

**Hypotheses.** The central leaf and slope-divisible Σ of the preceding target; m≥1. The lifting condition is part of the moduli problem; arbitrary truncated isomorphisms are not substituted for it.

**API.**

- **`FiniteIgusa.points`** (characterisation): Its S-points consist of the liftable structured graded trivializations, including a single common similitude unit.
- **`FiniteIgusa.torsor`** (universal-property): The moduli functor is represented by a finite étale Γ_b/U_p(m)-torsor.
- **`FiniteIgusa.transition`** (functoriality): For m′≥m, restrict j_i to p^m; transitions compose and commute with deck transformations.
- **`FiniteIgusa.deckKernel`** (characterisation): The kernel of the Γ_b-action is U_p(m), not every automorphism of the truncated group.
- **`FiniteIgusa.quotient`** (equivalence): Geometric points at level U=K^p×U_p(m) identify with Ig_∞(F̄_p)/U.

**Checks.**

- **ordinary_elliptic.** For Σ=μ_{p∞}⊕Q_p/Z_p, Γ_b≅Z_p^××Z_p^× with the common similitude equal to the product; at m≥1 the fibre has φ(p^m)^2 points.
- **level_reduction.** Restriction from m+1 to m reduces each unit modulo p^m and gives the quotient deck map.
- **liftable_only.** A truncated automorphism not liftable to all higher m is absent from the deck group, even if it preserves the visible level-m pairing.
- **nonproper.** If the central leaf is nonproper, its nonempty finite étale cover cannot be declared proper merely because the cover map is finite.

**Uses.** [Rational Igusa cohomology and the full group action](#rational-igusa-cohomology): Computes level invariants and finite traces. [Finite-level Hecke correspondences and coefficient lifts](#finite-correspondence-geometry): The projection leg is finite étale.

**Proof route.**

1. Represent the liftable truncation trivializations and impose the closed O_B and polarization conditions.
2. Use formal rigidity of isoclinic groups to transport fibre trivializations over completed local rings, as in Mantovan Proposition 4.
3. The compact integral automorphism group gives the deck quotient, whose action is free and transitive on every fibre; primary liftability/rigidity proof inputs remain G2.

**Acceptance.** The torsor has degree |Γ_b/U_p(m)|; its finite étaleness does not make the leaf proper.

**Direct prerequisites.** [Central leaves and completely slope-divisible families](#central-leaf-slope-data), [Decent representatives, Newton Levi and J_b](#decent-levi-and-jb).

**Sources.** [E. Mantovan, On the cohomology of certain PEL type Shimura varieties](https://www.its.caltech.edu/~mantovan/papers/PEL.pdf), §4, Definition 3 and Proposition 4, pp.10–11. The all-higher-level liftability condition and finite étale Galois property. [S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §5, pp.15–16. Uses the structured finite-level moduli and compact deck subgroups.

<a id="igusa-monoid"></a>

### 7. The slope-separated quasi-isogeny monoid

**Definition.** Order the BT slopes decreasingly. For δ∈J_b(Q_p) with δ⁻¹ an integral isogeny, let e_i be the least integer such that ker δ_i⁻¹⊂Σ_i[p^{e_i}], and f_i the largest integer such that Σ_i[p^{f_i}]⊂ker δ_i⁻¹. Define S_b by these isogeny conditions and f_{i−1}≥e_i for i≥2. Kernel gluing gives δ:Ig_{K^p,m}→Ig_{K^p,m−e_1} for m≥e_1 and compatible prime-to-p Hecke maps. Γ_b, p⁻¹ and fr^{−s} lie in S_b, where fr^{−s} acts with valuations −sλ_i; J_b(Q_p)=⟨S_b,p,fr^s⟩. This is an action of a monoid on a level system; it does not assert geometric actions of arbitrary J_b-elements at a fixed level.

**Hypotheses.** Σ split into completely slope-divisible components with additional structures; common s integral on all slopes.

**API.**

- **`IgusaMonoid.mem`** (characterisation): Membership is integral δ⁻¹ together with all successive kernel inequalities.
- **`IgusaMonoid.levelMap`** (constructor): For m≥e_1, quotient by the glued subgroup and descend the remaining j_i to level m−e_1.
- **`IgusaMonoid.comp`** (compatibility): Compositions agree after passing to a common sufficiently large source level.
- **`IgusaMonoid.centralGenerators`** (structure): Γ_b,p⁻¹,fr^{−s} belong; adjoining inverse central powers generates J_b(Q_p).
- **`IgusaMonoid.awayp`** (compatibility): The S_b and G(A_f^p) actions commute on the level system.

**Checks.**

- **scalar.** δ=p⁻¹ belongs, despite not being an integral automorphism; all kernel bounds equal 1.
- **wrong_slope_order.** For two slopes λ_1>λ_2 and integral exponents a_1<a_2, δ_i=p^{−a_i} has f_1=a_1<e_2=a_2, and is excluded.
- **frobenius.** fr^{−s} belongs because sλ_{i−1}≥sλ_i; its inverse need not belong.
- **basic.** With one slope there is no successive inequality, but δ⁻¹ must still be an isogeny.

**Uses.** [Finite-level Hecke correspondences and coefficient lifts](#finite-correspondence-geometry): Constructs algebraic Hecke legs. [Rational Igusa cohomology and the full group action](#rational-igusa-cohomology): Extends the monoid action by invertible central actions.

**Proof route.**

1. Glue the finite flat subgroup with the prescribed graded kernels using f_{i−1}≥e_i, then take the abelian quotient and its induced structures.
2. Functoriality of quotients yields the monoid law after enough level has been chosen.
3. Negative scalar and Frobenius powers put each quasi-isogeny into this cone; retain the general kernel-gluing proof boundary G2.

**Acceptance.** For δ=p⁻¹, all e_i=f_i=1; for fr^{−s}, e_i=f_i=sλ_i, in decreasing order.

**Direct prerequisites.** [Finite-level Igusa moduli and deck groups](#finite-igusa-moduli), [PEL Dieudonné comparison and quasi-isogeny groups](#pel-isocrystal-comparison), `AbelianSchemesAndArithmeticModuli:A3/nonaffine-abelian-quotient`, `AbelianSchemesAndArithmeticModuli:A3/polarized-weil-pairing`.

**Sources.** [E. Mantovan, On the cohomology of certain PEL type Shimura varieties](https://www.its.caltech.edu/~mantovan/papers/PEL.pdf), §4, Lemma 5 and discussion before and after it, pp.11–13. Gives the separated kernel bounds and finite-level quotient maps. [S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §5, pp.16–17. Defines S_b and its relation with the whole quasi-isogeny group.

<a id="rational-igusa-cohomology"></a>

### 8. Rational Igusa cohomology and the full group action

**Construction.** For ℓ≠p and an algebraic representation ξ of G, let L_ξ be its rational ℓ-adic coefficient system on the PEL model and its pullback to finite Igusa varieties. Define H_c^k(Ig_b,L_ξ)=colim_{K^p,m}H_c^k(Ig_{K^p,m},L_ξ), using finite étale level pullbacks. The S_b×G(A_f^p) action extends uniquely to J_b(Q_p)×G(A_f^p), since p⁻¹ and fr^{−s} act invertibly on rational cohomology. These are smooth admissible representations, vanish for k>2dim C_Σ, and their K^p×U_p(m) invariants equal finite-level cohomology. Set [H_c]=Σ_k(−1)^k[H_c^k], and evaluate test functions by Haar integration with compatible quotient measures. This uses finite-dimensional invariant spaces, not finite-dimensionality of the full infinite-level representation.

**Hypotheses.** Neat level, ℓ≠p, rational ℓ-adic coefficients, and ξ algebraic. Choose an identification Q̄_ℓ≅C when discussing complex characters.

**API.**

- **`IgusaCohomology.levelInvariants`** (equivalence): H_c^k(Ig_b,L_ξ)^{K^p×U_p(m)}≅H_c^k(Ig_{K^p,m},L_ξ).
- **`IgusaCohomology.extendAction`** (universal-property): The J_b-action is the unique extension that inverts p⁻¹ and fr^{−s}.
- **`IgusaCohomology.virtual`** (constructor): Take the finite alternating sum in the smooth admissible Grothendieck group.
- **`IgusaCohomology.normalizedHecke`** (compatibility): e_g=1_{UgU}/vol(U) has the correspondence trace; 1_{UgU} has vol(U) times that trace.

**Checks.**

- **degree_zero_torsor.** On a finite étale zero-dimensional fibre of size d, the identity correspondence has trace d, whereas 1_U has integrated trace vol(U)d.
- **fixed_level.** For a fixed U, the trace factors through the finite-dimensional U-invariant subspace; the full representation is not required to be finite-dimensional.
- **rational_inversion.** Absolute Frobenius acts invertibly on rational ℓ-adic cohomology. This assertion does not replace an integral torsion-concentration theorem.
- **nonproper_cohomology.** For a nonproper leaf the target is H_c, not ordinary H; their traces need not agree.

**Uses.** [Large negative Frobenius shifts give the compact-support fixed-point trace](#large-frobenius-fixed-point-trace): Provides the finite-level trace to compare with stalks. [Stable elliptic Igusa trace formula with all mass factors](#stable-trace-with-normalizations): Provides the left-hand distribution.

**Proof route.**

1. Consume the algebraic étale finite-level cohomology and six operations supplier.
2. Mantovan Lemma 6 identifies the central actions with level projection and Frobenius; rational cohomology inverts both.
3. Admissibility follows by exact averaging for the finite deck quotient and the level-invariant identity; dimension gives the bounded alternating sum.

**Acceptance.** Changing the Haar measure by a scalar changes the integrated characteristic-function trace by that scalar.

**Direct prerequisites.** [Finite-level Igusa moduli and deck groups](#finite-igusa-moduli), [The slope-separated quasi-isogeny monoid](#igusa-monoid), `EndoscopicTransferAndUnitaryTraceComparison:ET.4/padic-character-distributions`, `EtaleDualityAndPerverseSheaves:EDC.8/cohomological-correspondence-lifting`, `mathlib:MeasureTheory.Measure.IsHaarMeasure`, `AbelianSchemesAndArithmeticModuli:A4/etale-tate-module`.

**Sources.** [E. Mantovan, On the cohomology of certain PEL type Shimura varieties](https://www.its.caltech.edu/~mantovan/papers/PEL.pdf), §4, Lemma 6 and Proposition 7, pp.13–14. Inverts the central monoid actions and proves admissibility. [S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §5, p.17 and §6, equation (11), p.17. Defines coefficient cohomology, level invariants and Haar normalization.

<a id="frobenius-descent-model"></a>

### 9. A finite-field model compatible with the central Frobenius action

**Theorem.** After enlarging a common decency integer s to contain the reflex residue field, each finite Igusa level admits a model J_{K^p,m}/F_{p^s} whose absolute p^s-Frobenius, transported to F̄_p and interpreted with the level-transition identifications, is fr^{−s}. For a finite family of S_b-Hecke correspondences, enlarge the field and source levels so the schemes, both legs and coefficient lifts descend to one finite field. This is a descent theorem, stronger than the elementary fact that a finite-type F̄_p-scheme has some finite-field model.

**Hypotheses.** Use the central fr^{−s} defined by the fixed slope-divisible Σ, and compatible levels and polarization.

**Proof route.**

1. Mantovan Lemma 6 compares quotient-by-Frobenius with absolute Frobenius and level projection.
2. Construct the compatible descent datum by the isomorphism p^{−sλ_i}F^s on each slope piece.
3. Verify effectivity and coefficient compatibility; Shin Lemma 6.3 cites the detailed thesis §2.3, which is the precise unread primary boundary G3.

**Acceptance.** An arbitrary finite-field model is insufficient: its Frobenius must be the specified central fr^{−s}, with the negative sign.

**Direct prerequisites.** [The slope-separated quasi-isogeny monoid](#igusa-monoid), [Finite-level Igusa moduli and deck groups](#finite-igusa-moduli).

**Sources.** [S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §6, Lemma 6.3, p.19. Uses the finite-field model with absolute Frobenius equal to fr^{−s}, referring to the thesis for descent details. [E. Mantovan, On the cohomology of certain PEL type Shimura varieties](https://www.its.caltech.edu/~mantovan/papers/PEL.pdf), §4, Lemma 6, p.13. Identifies the Frobenius quotient map and level transition.

<a id="acceptable-functions-with-geometry"></a>

### 10. Acceptable support and acceptable functions

**Definition.** For δ∈J_b(Q_p) write δ_i on the BT slope λ_i. It is acceptable when every pair of eigenvalues satisfies v_p(e_i)<v_p(e_j) for i<j. Equivalently transport its semisimple stable class through the inner twist to M_b and require v_p(α(δ_s))>0 iff ⟨α,ν_b⟩>0 for every root outside M_b, with ν_i=−λ_i. The parabolic P(ν_b) has positive roots with ⟨α,ν_b⟩<0. A locally constant compactly supported φ on G(A_f^p)×J_b(Q_p) is acceptable if its support is in G(A_f^p)×S_b with acceptable δ and it admits a finite double-coset expansion at neat level U whose algebraic correspondences have finite fixed-point sets and satisfy the compact-support stalk-trace formula. Support acceptability alone is weaker than this definition. The normalized function e_g=1_{UgU}/vol(U) is used when comparing with a correspondence.

**Hypotheses.** The finite moduli, geometric monoid and rational coefficient correspondences constructed here. Eigenvalues are computed after algebraic closure and by semisimplification for nonsemisimple δ.

**API.**

- **`AcceptableElement.slopeCriterion`** (characterisation): For decreasing BT slopes, all valuations on an earlier block are less than all on a subsequent block.
- **`AcceptableElement.rootCriterion`** (equivalence): The root criterion through the inner twist agrees with the slope criterion for ν=−λ.
- **`AcceptableElement.centralShift`** (compatibility): Multiplication by fr^{−sN} sends v_i to v_i−sNλ_i; multiplication by a uniform scalar adds the same valuation to every block.
- **`AcceptableFunction.mem`** (characterisation): Support in S_b and acceptable elements, a finite neat double-coset presentation, fixed-point finiteness and the stalk-trace identity are all required.
- **`AcceptableFunction.linear`** (structure): Sums and scalar multiples of acceptable functions are acceptable after common refinement of their levels.

**Checks.**

- **ordinary_pair.** For slopes (1,0), δ=(1,p) is acceptable and δ=(p,1) is not.
- **basic_not_geometric.** One slope makes every δ acceptable as an element, but a δ with δ⁻¹ not an isogeny is not in S_b.
- **unit_bad_support.** With two slopes, 1_{Γ_b} fails element support acceptability because it contains the identity with equal valuations.
- **negative_shift.** For λ=(1,0), fr^{−sN} has valuation pair (−sN,0), acceptable for N>0; the positive shift reverses the order.

**Uses.** [Unstabilized Igusa counting with centralizer masses](#orbit-mass-counting): Restricts the counting formula to its verified geometric domain. [The Igusa endoscopic function at p](#p-test-function): Provides the open cone needed to push a Levi function to H.

**Proof route.**

1. Translate the dual slope weights to the root condition, keeping ν=−λ.
2. Use finite double-coset expansions and include the geometric trace conditions as data of the predicate.
3. The large-Frobenius theorem proves these conditions for shifted functions; it is not used circularly in their definition.

**Acceptance.** Basic b has one slope, so element acceptability is vacuous; its function trace and monoid conditions remain.

**Direct prerequisites.** [Decent representatives, Newton Levi and J_b](#decent-levi-and-jb), [The slope-separated quasi-isogeny monoid](#igusa-monoid), [Rational Igusa cohomology and the full group action](#rational-igusa-cohomology).

**Sources.** [S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §6, Definitions 6.1–6.2, p.19. Separates valuation support, finite fixed points and the trace identity. [S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §3.3, Definitions 3.1–3.2 and Lemma 3.4, p.11. Root acceptability, inner transfer, openness and modulus identity.

<a id="finite-correspondence-geometry"></a>

### 11. Finite-level Hecke correspondences and coefficient lifts

**Construction.** For U=K^p×U_p(m), g in G(A_f^p)×S_b and a sufficiently small source level V, construct c_g=(c_1,c_2):Ig_V→Ig_U×Ig_U: c_1 is the level projection and c_2 the quotient quasi-isogeny followed by level restriction. The first leg is finite étale, hence proper. The second has finite geometric fibres, by the finite double-coset decomposition of UgU on Ig_∞/U, and is quasi-finite because it is finite type. The universal quasi-isogeny identifies the rational coefficient pullbacks and supplies u_g:c_{2!}c_1^*L_ξ→L_ξ. Compose with the finite étale trace when changing V. After normalization, the induced operator on H_c equals that of e_g=1_{UgU}/vol(U). No properness of Ig_U or of the second leg is asserted.

**Hypotheses.** g has its p-component in S_b; source levels exceed the kernel-loss bound. The coefficient lift and its finite-field descent must be constructed, not inferred from point-set equivariance alone.

**API.**

- **`IgusaCorrespondence.ofMonoid`** (constructor): Choose a sufficiently high source level; projection and quotient give the two algebraic legs.
- **`IgusaCorrespondence.firstProper`** (characterisation): c_1 is finite étale; this is a property of the leg, not properness of its target.
- **`IgusaCorrespondence.secondQuasiFinite`** (characterisation): Finite geometric fibres and finite type give quasi-finiteness of c_2.
- **`IgusaCorrespondence.coefficient`** (constructor): The universal quasi-isogeny and finite étale trace give a morphism c_{2!}c_1^*L_ξ→L_ξ.
- **`IgusaCorrespondence.refine`** (compatibility): After refinement of V the integrated normalized Hecke operator is unchanged.

**Checks.**

- **identity.** For g=1, the identity coefficient lift gives the identity operator and fixed locus Ig_U before Frobenius twisting.
- **proper_leg.** A nonproper affine leaf can have a finite étale projection leg; requiring Ig_U proper would wrongly exclude it.
- **finite_cosets.** If UgU is the disjoint union of d right U-cosets, its action has at most d translates over each geometric point, including multiplicities through the source cover.
- **no_pointset_lift.** A permutation of Ig_∞(F̄_p) alone supplies neither an algebraic correspondence nor u_g, and does not satisfy this construction.

**Uses.** [Large negative Frobenius shifts give the compact-support fixed-point trace](#large-frobenius-fixed-point-trace): Supplies Varshavsky’s proper first leg, quasi-finite second leg and coefficient correspondence.

**Proof route.**

1. Use finite-level quotient maps of the monoid and the commuting away-p level maps.
2. Express the second fibre as finitely many coset translates on Ig_∞/U; finite type gives quasi-finiteness.
3. Transport ξ along the universal rational quasi-isogeny and descend its sheaf morphism; combine with the proper-support trace. The explicit coefficient construction is G3.

**Acceptance.** For g=1 and V=U both legs and the coefficient lift are identities.

**Direct prerequisites.** [The slope-separated quasi-isogeny monoid](#igusa-monoid), [Finite-level Igusa moduli and deck groups](#finite-igusa-moduli), [Rational Igusa cohomology and the full group action](#rational-igusa-cohomology), `EtaleDualityAndPerverseSheaves:EDC.8/scheme-correspondence`, `EtaleDualityAndPerverseSheaves:EDC.8/cohomological-correspondence-lifting`, `EtaleDualityAndPerverseSheaves:EDC.8/cohomological-correspondence-composition`.

**Sources.** [S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §6, equations (12)–(14) and proof of Lemma 6.3, pp.18–20. Finite Hecke legs, finite fibres and correspondence normalization.

<a id="large-frobenius-fixed-point-trace"></a>

### 12. Large negative Frobenius shifts give the compact-support fixed-point trace

**Theorem.** For any φ∈C_c^∞(G(A_f^p)×J_b(Q_p)), define φ^(N)(x)=φ(x(fr^s)^N). There is N_0 such that for every N≥N_0 its support is in S_b and consists of acceptable elements; a common finite-level expansion then has finite fixed-point sets and tr(φ^(N)|[H_c]) equal to the sum of coefficient-stalk traces at its Frobenius–Hecke fixed points, with the Haar/coset normalization above. Thus φ^(N) is an acceptable function in the full geometric sense. For each finite family of descended correspondences, q^N>d suffices once support enters the cone, where q=p^s and d is a correspondence-dependent contraction/ramification bound; no bound uniform over all test functions is claimed.

**Hypotheses.** Finite-field model and coefficient lifts as in the preceding targets; ℓ≠p, finite-dimensional rational stalks.

**Proof route.**

1. Compact support gives finitely many valuation and kernel bounds. Multiplying by fr^{−sN} subtracts sNλ_i, eventually making every earlier/subsequent slope gap negative and every kernel inequality valid.
2. Descend the finite family to the compatible q-model and identify its central shift with c_1 composed with F^N.
3. Apply EDC.8 Fujiwara–Varshavsky: c_1 proper, c_2 quasi-finite, U=X, q^N>d. Fixed points are isolated and local terms equal stalk traces. Sum the finite coset expansion.

**Acceptance.** For the identity on a smooth nonproper curve, Frobenius twisting has finitely many fixed points, whereas the untwisted identity has a positive-dimensional fixed locus.

**Direct prerequisites.** [Acceptable support and acceptable functions](#acceptable-functions-with-geometry), [Finite-level Hecke correspondences and coefficient lifts](#finite-correspondence-geometry), [A finite-field model compatible with the central Frobenius action](#frobenius-descent-model), `EtaleDualityAndPerverseSheaves:EDC.8/fujiwara-varshavsky-trace-formula`.

**Sources.** [S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §6, Lemma 6.3 and its proof, pp.19–20. Eventually shifts every function into the geometric acceptable domain. [Y. Varshavsky, Lefschetz–Verdier trace formula and a generalization of a theorem of Fujiwara](https://arxiv.org/pdf/math/0505564v2), §2.3, Theorem 2.3.2(a),(b), pp.20–21. The proper/quasi-finite hypotheses and large-Frobenius trace theorem.

<a id="polarized-isogeny-points"></a>

### 13. Polarized isogeny classes and Igusa point orbits

**Definition.** Let PIC be the set of B-linear polarized abelian varieties z=(A,λ,ι) over F̄_p up to B-linear quasi-isogeny carrying λ to a positive rational multiple, whose prime-to-p hermitian Tate module is V⊗A_f^p and whose polarized rational BT group is Σ up to quasi-isogeny. Put H_z=Aut_B^0(A,λ), the rational quasi-isogeny similitude group. After fixing comparison isomorphisms, the fibre of Ig_∞ geometric points over z is H_z(Q)\(G(A_f^p)×J_b(Q_p)). A fixed point of a coset operator determines a rational acceptable element a∈H_z(Q), modulo rational conjugacy at this intermediate orbit step. For the final effective-triple parameter set, define FPAV to consist instead of a near-equivalence class of z and an H_z(A)-conjugacy class [a] of an acceptable rational a. Near equivalence requires isometry of the structured Tate spaces at every ℓ≠p and of the polarized rational BT modules at p, not merely the same unpolarized Newton polygon.

**Hypotheses.** PIC has the PEL determinant and positivity conditions; all comparisons retain the similitude scalar. H_z is reductive and compact modulo centre at infinity by the Rosati positivity.

**API.**

- **`PIC.points`** (characterisation): The stated additional structures, determinant and rational comparison conditions define membership.
- **`PIC.fibre`** (equivalence): A chosen comparison identifies the fibre with the displayed rational double quotient.
- **`NearEquivalence.local`** (characterisation): Compare polarized hermitian structures at every finite place, not just rational slopes.
- **`FPAV.pair`** (constructor): A near-equivalence class and an adelic conjugacy class containing an acceptable rational a form a parameter.
- **`PIC.changeComparison`** (compatibility): Changing comparisons conjugates H_z and transports every orbit parameter.

**Checks.**

- **level_free.** The same z can have many Igusa points at a finite level; PIC is not a point-level moduli set.
- **polarization.** Isomorphic unpolarized rational BT modules with inequivalent hermitian pairings do not automatically define the same near-equivalence class.
- **adelic_vs_rational.** Several rational H_z-conjugacy classes can lie in one adelic class; FPAV groups them, while the preliminary orbit sum keeps them separate.

**Uses.** [Adelic polarized fixed-point parameters equal effective triples](#effective-triple-bijection): Defines the domain of the final classification. [Unstabilized Igusa counting with centralizer masses](#orbit-mass-counting): Separates orbit integration from near-equivalence multiplicities.

**Proof route.**

1. Forget the level and graded trivializations to obtain z; rational quasi-isogenies are the stabilizers of the comparison choices.
2. Tate and Dieudonné full faithfulness identify the automorphism groups and the double quotient.
3. Separate rational orbits, needed for local orbital integrations, from adelic orbits, used to aggregate the final mass.

**Acceptance.** Changing a comparison conjugates its H_z embedding and does not change the quotient or the eventual conjugacy class.

**Direct prerequisites.** [Finite-level Igusa moduli and deck groups](#finite-igusa-moduli), [PEL Dieudonné comparison and quasi-isogeny groups](#pel-isocrystal-comparison), [Finite-field Tate full faithfulness and Honda classification](#finite-field-tate-honda), `AbelianSchemesAndArithmeticModuli:A6/localized-isogeny-category`, `AbelianSchemesAndArithmeticModuli:A6/weak-localized-polarization`, `AbelianSchemesAndArithmeticModuli:A6/rosati-positivity`.

**Sources.** [S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §7, pp.20–24; §9, Definition 9.3, pp.28–29. The point fibre, quasi-isogeny groups and adelic FPAV equivalence.

<a id="finite-field-tate-honda"></a>

### 14. Finite-field Tate full faithfulness and Honda classification

**Theorem.** For abelian varieties A,B over F_q and ℓ≠p, Hom_Fq(A,B)⊗Z_ℓ≅Hom_Gal(T_ℓA,T_ℓB). Their rational endomorphism algebras are semisimple, Frobenius acts semisimply, and equal Frobenius characteristic polynomials are equivalent to F_q-isogeny. Simple F_q-isogeny classes correspond to conjugacy classes of q-Weil algebraic integers π. If K=Q(π) and D=End_Fq^0(A), then Z(D)=K; inv_v D is 1/2 at real places, 0 at complex places and finite places away from p, and [K_v:Q_p]v(π)/v(q) modulo Z at v|p. If e is the index of D, then 2dim A=e[K:Q]. Honda existence, including the real Weil-number cases, is a separate proof input from Tate full faithfulness.

**Hypotheses.** Finite base field; integral Tate modules for full faithfulness, rational isogeny category for the classification.

**Proof route.**

1. Tate §2 uses polarization and finiteness of bounded-degree polarized varieties to realize stable isotropic subspaces by endomorphisms; a commutant argument proves surjectivity at split primes.
2. Compare ranks at other primes and integral saturation, then use A×B and its matrix corners for Hom.
3. Use the centralizer description and local division invariants for simple objects. Honda’s converse realizes each Weil number; its primary proof is unread boundary G4a.

**Acceptance.** For an ordinary elliptic curve, the two p-slopes are 0 and 1 and D is the imaginary quadratic field. Real π with π²=q can yield a quaternion algebra and must not be discarded as a CM-only case.

**Direct prerequisites.** `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`, `FiniteFlatGroupsAndIntegralPadicHodgeTheory:R07.2/isogeny-classification`, `tauceti:TauCeti.AlgebraicGeometry.AbelianVariety`, `AbelianSchemesAndArithmeticModuli:A4/etale-tate-module`, `AbelianSchemesAndArithmeticModuli:A6/hom-is-free-of-finite-rank`, `AbelianSchemesAndArithmeticModuli:A6/poincare-complete-reducibility`, `AbelianSchemesAndArithmeticModuli:A6/characteristic-polynomial-on-tate-module`.

**Sources.** [J. Tate, Endomorphisms of abelian varieties over finite fields](https://pazuki.perso.math.cnrs.fr/index_fichiers/Tate66.pdf), §2, Propositions 1–2, pp.136–139; §3, Theorems 1–2, pp.139–140. Full faithfulness, semisimplicity and isogeny detection. [W. C. Waterhouse, Abelian varieties over finite fields](https://www.numdam.org/item/ASENS_1969_4_2_4_521_0.pdf), Chapter 2, Theorems 1–2, pp.526–528. Weil numbers, real and p-adic invariants, and the Honda existence statement.

<a id="finite-field-padic-types"></a>

### 15. Effective p-adic types with common-refinement equivalence

**Definition.** For a CM field or totally real field M with involution c, a p-adic type is an effective rational divisor η on its p-places such that η+cη=[p], where [p] has coefficient e(x/p). A simple type is minimal under descent through involution-preserving subfields. A type with multiplicities is (M=∏M_t,η,(n_t)_{t},κ:F→M), with n_t positive integers and κ compatible with involutions. Pullback to M′ multiplies η_x by e(y/x) at y|x; equal simple factors are combined by adding n_t. Identify two data only after a common refinement respecting η, multiplicities and κ, and select their unique minimal representative. The associated BT slopes are η_x/e(x/p). This normalized divisor records a geometric isogeny class over F̄_p after a finite field of definition and all endomorphisms have been chosen; it is not merely a fixed-F_q Frobenius polynomial.

**Hypotheses.** F=Z(B); η rational effective; multiplicities nonzero, not signed.

**API.**

- **`PadicType.mem`** (characterisation): All η_x≥0 and η_x+η_cx=e(x/p).
- **`PadicType.pullback`** (functoriality): At y|x set η′_y=e(y/x)η_x; iterated pullbacks compose.
- **`PadicType.refinement`** (equivalence): Common-refinement equivalence respects the F-action and adds multiplicities of repeated simple factors.
- **`PadicType.minimal`** (universal-property): Every class has a minimal representative, unique up to compatible field isomorphism.
- **`PadicType.slopes`** (compatibility): η_x/e(x/p) is unchanged under ramified pullback.

**Checks.**

- **ordinary_CM.** For a split p in an imaginary quadratic field, coefficients (1,0) define slopes (1,0); (1,1) violates η+cη=[p].
- **real_half.** For M=Q and c=id, η_p=1/2 is the allowed simple real type, not 0 or 1.
- **ramified_refinement.** If e(y/x)=2, a coefficient η_x=1/2 becomes η′_y=1, while the normalized slope stays unchanged.
- **merge_factors.** Two identical minimal factors of multiplicities 2 and 3 refine to one with multiplicity 5; signed cancellation is forbidden.

**Uses.** [Geometric B-linear isogeny classification and division invariants](#unpolarized-padic-type-classification): Classifies geometric B-linear isogeny classes. [Acceptability recovers the endomorphism centre and adelic centralizers](#acceptable-centralizer-identity): The acceptability inequalities force the type to descend to F[a].

**Proof route.**

1. Normalize valuations of a Weil number by v(q) and account for ramification in pullback.
2. Descend to the smallest involution-stable field that supports η; compare any two models by finite-field extension and common refinement.
3. Use the involution identity to pair slopes λ and 1−λ.

**Acceptance.** At a real p-place c fixes x, hence η_x=e(x/p)/2 and the slope is 1/2.

**Direct prerequisites.** [Finite-field Tate full faithfulness and Honda classification](#finite-field-tate-honda).

**Sources.** [S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §8, definitions and Lemmas 8.1–8.3, pp.24–25. Normalized types, refinement equivalence and minimal representatives.

<a id="unpolarized-padic-type-classification"></a>

### 16. Geometric B-linear isogeny classification and division invariants

**Theorem.** B-linear abelian varieties over F̄_p up to B-linear isogeny correspond to the minimal effective p-adic types with multiplicities and compatible κ, subject to the Morita dimensions of B. For a simple factor of centre M_t the B-linear endomorphism division algebra C_t has inv_x C_t=1/2−inv_x(B⊗_F M_t) at real x, −inv_x(B⊗_F M_t) at finite x∤p, and η_x f(x/p) modulo Z at x|p under the standing split B_p hypothesis. Its p-component has slope η_x/e(x/p) and height [M_{t,x}:Q_p]sqrt([B:F])sqrt([C_t:M_t]); multiply by n_t and sum for the full type. This classifies unpolarized B-linear objects. A principal polarization and the prescribed hermitian local forms are not supplied by the divisor alone.

**Hypotheses.** Simple central B over F with the PEL involution; p-adically split B; admissible B-action dimensions. Work over F̄_p, permitting finite-field extension containing all endomorphisms.

**Proof route.**

1. Choose a finite model with all endomorphisms defined and normalize its Weil numbers; finite extensions become common refinements.
2. Apply Tate–Honda factorwise and use Brauer invariants plus Morita equivalence to impose the B-action.
3. Take the commutant algebra; tensor-product invariants subtract inv B, with the real 1/2 contribution retained. Dimensions determine multiplicities and BT heights.

**Acceptance.** For B=Q and the real type η=1/2, C has the real and p-adic quaternion invariants 1/2, giving the supersingular elliptic case.

**Direct prerequisites.** [Effective p-adic types with common-refinement equivalence](#finite-field-padic-types), [Finite-field Tate full faithfulness and Honda classification](#finite-field-tate-honda), `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`.

**Sources.** [S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §8, Lemmas 8.4–8.5, pp.25–26. B-linear type classification and local endomorphism/height formulas.

<a id="polarized-realization-near-equivalence"></a>

### 17. Polarized realizations, global cohomology and near-equivalence fibres

**Theorem.** For a polarized B-linear z, its polarized quasi-isogeny forms with the same real positivity are classified by ker(H¹(Q,H_z)→H¹(R,H_z)). Those forms near equivalent to z are the locally trivial subset ker¹(Q,H_z), defined as the kernel of localization at every place. Their H-groups have the common inner-form identification induced by central cocycles. For an admissible effective triple below, its prescribed B-action, positive real pairing and finite-place hermitian/isocrystal data admit a polarized realization; this existence uses global Brauer embeddings and the hermitian Hasse principle, not unpolarized Tate–Honda alone. Any conversion to an integral lattice or prime-to-p level separately respects the PEL determinant and self-dual local conditions.

**Hypotheses.** The quasi-isogeny category permits positive rational polarization similitudes; integral principal-polarization assertions need the indicated lattice step.

**Proof route.**

1. Twist the structured object by H_z; positivity is the real localization condition.
2. Local Tate and Dieudonné comparison detects near equivalence, giving exactly ker¹, not all real-trivial classes.
3. Build the centre and p-adic type from the triple, globalize the B-module by the Brauer sequence, then globalize its local hermitian forms and polarization. Shin’s Kottwitz 1992 realization lemmas are unread boundary G4b.

**Acceptance.** Triviality at infinity alone does not imply triviality at all finite places.

**Direct prerequisites.** [Polarized isogeny classes and Igusa point orbits](#polarized-isogeny-points), [Geometric B-linear isogeny classification and division invariants](#unpolarized-padic-type-classification), [PEL Dieudonné comparison and quasi-isogeny groups](#pel-isocrystal-comparison), `EndoscopicTransferAndUnitaryTraceComparison:ET.0/kottwitz-duality`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-10-global-carriers-the-brauer-sequence-and-the-sum-of-local-invariants`, `AbelianSchemesAndArithmeticModuli:A6/abelian-torsor-twist`, `AbelianSchemesAndArithmeticModuli:A6/twist-realizations-polarizations-and-level`, `AbelianSchemesAndArithmeticModuli:A6/real-isometries-and-polarized-torsors`.

**Sources.** [S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §9, pp.27–29; §12, Lemmas 12.1–12.2, pp.38–40. Polarized H¹ classification, locally trivial fibre, and global realization.

<a id="acceptable-centralizer-identity"></a>

### 18. Acceptability recovers the endomorphism centre and adelic centralizers

**Theorem.** For z∈PIC and an acceptable rational a∈H_z(Q), let M_z be the centre of End_B^0(A) and F[a] the B-central field algebra generated by a. Then M_z⊂F[a]. Under the chosen Tate and Dieudonné comparisons, Z_{G(A_f^p)×J_b(Q_p)}(a)=ι(Z_{H_z}(a)(A_f)). In particular the finite-place centralizer used in the orbit integral is the adelic group of a rational reductive centralizer; an isomorphism of the unpolarized BT groups alone would not provide this conclusion.

**Hypotheses.** a acceptable, semisimple in the counting formula, with all PEL structures retained.

**Proof route.**

1. The strictly separated eigenvalue valuations determine which embeddings of F[a] carry each slope.
2. Hence the normalized p-divisor descends to F[a]; minimality of the type forces M_z⊂F[a].
3. Tate/Dieudonné commutants now identify the local centralizers at all finite places, with compatible hermitian structure.

**Acceptance.** If two slope blocks have equal eigenvalue valuations, the recovery argument fails; regularity by itself cannot replace acceptability.

**Direct prerequisites.** [Effective p-adic types with common-refinement equivalence](#finite-field-padic-types), [Geometric B-linear isogeny classification and division invariants](#unpolarized-padic-type-classification), [Polarized isogeny classes and Igusa point orbits](#polarized-isogeny-points), [Acceptable support and acceptable functions](#acceptable-functions-with-geometry).

**Sources.** [S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §8, Lemma 8.6 and its proof, pp.26–27. The separated valuations recover the centre and give the finite-adelic centralizer identity.

<a id="effective-triples-and-invariant"></a>

### 19. Igusa triples, centralizer isocrystals and the effective obstruction

**Definition.** An Igusa triple of type b is (γ_0;γ,δ), where γ_0∈G(Q) is semisimple and R-elliptic, γ∈G(A_f^p) is geometrically conjugate to γ_0 place by place, and δ∈J_b(Q_p) is acceptable and geometrically conjugate to γ_0 through the fixed inner identification. Identify γ_0 by rational stable conjugacy, γ by ordinary G(A_f^p)-conjugacy, and δ by ordinary J_b(Q_p)-conjugacy. Write I_0=Z_G(γ_0), connected for these type A/C groups with simply connected derived group, and I_δ=Z_{J_b}(δ), its p-adic inner form. Transport the hermitian isocrystal while identifying γ_0 with δ to obtain a basic b_δ∈B((I_0)_Qp). Define α_p=κ_{I_0}(b_δ), α_v from the rational-class cocycle for γ_v at v≠p,∞, and α_∞ from μ on an elliptic real torus. For this elliptic I_0 set K(I_0/Q)=(⋂_v Z(Î_0)^{Γ_v}Z(Ĝ))/Z(Ĝ). Extend the local characters to Z(Î_0)^{Γ_v}Z(Ĝ), with restrictions −μ on Z(Ĝ) at p, +μ at infinity and zero elsewhere. Their product descends to α∈K(I_0/Q)^D. The triple is effective iff α=1. The induced minimal p-adic type includes positive integral multiplicities determined by Morita heights; its construction respects this equivalence relation.

**Hypotheses.** Standing simple unramified PEL type A/C, b∈B(G,−μ); local and global dual-centre dictionaries supplied by ET.0. K is the finite obstruction group defined here, not the entire group π₀Z(Î_0)^Γ.

**API.**

- **`IgusaTriple.mem`** (characterisation): The three semisimple/stable matching conditions and p-acceptability define membership.
- **`IgusaTriple.equiv`** (equivalence): Stable rational conjugacy of γ_0 and ordinary adelic/p-adic conjugacy of γ,δ are the three relations.
- **`IgusaTriple.centralizerIsocrystal`** (constructor): Transport gives basic b_δ in B(I_0) and its inner automorphism group is I_δ.
- **`IgusaTriple.localInvariant`** (constructor): κ(b_δ), away-p rational cocycles and the μ-character define the local components.
- **`IgusaTriple.effective`** (characterisation): Their descended product α is trivial precisely for an effective triple.
- **`IgusaTriple.type`** (compatibility): The normalized divisor and Morita heights define a refinement-invariant type with positive integral multiplicities.

**Checks.**

- **sign_cancellation.** The p-component restricts to −μ and the infinite component to +μ on Z(Ĝ); choosing +μ twice prevents descent.
- **ordinary_delta.** Two σ-conjugate elements in G(L) need not be ordinary conjugate in J_b(Q_p); the triple quotient never identifies them on that basis.
- **character_orthogonality.** For K=Z/2, summing its two characters gives 2 for α=1 and 0 for the nontrivial obstruction.
- **refinement.** If distinct factors have identical minimal type, combine their positive multiplicities rather than claiming the first constructed type is already minimal.

**Uses.** [Adelic polarized fixed-point parameters equal effective triples](#effective-triple-bijection): Defines the effective target set. [Finite obstruction Fourier expansion and transfer away from p](#prestabilization-awayp): Finite character orthogonality removes the effective restriction.

**Proof route.**

1. Use separated valuations to assign each p-place of F[γ_0] to a unique BT slope; descend the normalized divisor to its minimal centre.
2. Use local module dimensions, Brauer invariants and the real symplectic parity to show the multiplicities are positive integers independent of p-place.
3. Transport Frobenius into I_0 and compute κ; the restrictions at p and infinity cancel on Z(Ĝ), so the local product defines the obstruction on K. Prove independence from all transport choices.

**Acceptance.** The p-variable δ is a rational J_b-element; replacing its ordinary conjugacy relation by sigma-conjugacy gives the wrong parameter space.

**Direct prerequisites.** [Newton and Kottwitz invariants with the PEL sign](#newton-kottwitz-invariants), [Acceptability recovers the endomorphism centre and adelic centralizers](#acceptable-centralizer-identity), [Geometric B-linear isogeny classification and division invariants](#unpolarized-padic-type-classification), `EndoscopicTransferAndUnitaryTraceComparison:ET.0/kottwitz-duality`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/global-kottwitz-obstruction`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/rational-classes-in-stable-class`.

**Sources.** [S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §10, Definitions 10.1,10.3,10.7; Lemmas 10.4 and 10.8–10.10, pp.29–34. The equivalence relation, centralizer isocrystal, integral type and local/global obstruction.

<a id="effective-triple-bijection"></a>

### 20. Adelic polarized fixed-point parameters equal effective triples

**Comparison.** The map FPAV_b→KT_b sending (z,[a]) to the stable rational class γ_0 matching a and the ordinary adelic classes (γ,δ) induced by its Tate/Dieudonné comparisons is a bijection onto effective triples. Its domain uses near-equivalence classes of z and adelic H_z(A)-conjugacy of a. Rational H_z(Q)-conjugacy classes within this adelic class, and the ker¹(Q,H_z) polarized twists, are counted subsequently in the orbit mass. A triple without vanishing α has no polarized fixed-point realization.

**Hypotheses.** All additional structures and the definition of FPAV above; acceptable semisimple a.

**Proof route.**

1. Use the centralizer identity to match local classes, and the CM-lift/global obstruction cancellation of Shin Lemma 11.3 to prove effectivity of geometric pairs.
2. Construct a B-linear type from the triple, globalize the endomorphism embedding and positive polarization, then obtain z and a with the prescribed finite local data.
3. The hermitian Hasse principle and local full faithfulness make realizations near equivalent and identify a adelically, proving injectivity. The CM lifting and polarized existence primaries remain G4b.

**Acceptance.** A rational-conjugacy domain would generally have several elements over one triple; it is not the bijection asserted here.

**Direct prerequisites.** [Polarized isogeny classes and Igusa point orbits](#polarized-isogeny-points), [Polarized realizations, global cohomology and near-equivalence fibres](#polarized-realization-near-equivalence), [Igusa triples, centralizer isocrystals and the effective obstruction](#effective-triples-and-invariant).

**Sources.** [S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §11, Lemma 11.3, pp.36–38; §12, Lemma 12.3, pp.40–41. Obstruction cancellation, realization, and the precise FPAV/effective-triple bijection.

<a id="orbit-mass-counting"></a>

### 21. Unstabilized Igusa counting with centralizer masses

**Theorem.** For an acceptable φ and algebraic ξ, tr(φ|[H_c(Ig_b,L_ξ)])=Σ_{(γ_0;γ,δ) effective} vol(I_∞(R)^1)⁻¹ |A_Q(I_0)| tr ξ(γ_0) O^{G(A_f^p)×J_b(Q_p)}_{(γ,δ)}(φ). Here A_Q(I_0) is the Pontryagin dual of π₀(Z(Î_0)^Γ); I_∞ is the inner form of I_0 compact modulo the real split centre; I_∞(R)^1 is its character-norm-one subgroup. The measures come from the Tamagawa measure on I_0(A)^1, descend to the finite adeles by the real-volume quotient, and are transported compatibly to the inner centralizers of γ and δ. The sum is finite for the fixed acceptable support. The displayed coefficient aggregates near-equivalence twists and rational orbits; it is not the reciprocal of a finite automorphism group.

**Hypotheses.** Compatible Haar quotient measures, algebraic coefficient representation and fixed finite double-coset expansion.

**Proof route.**

1. Apply the compact-support fixed-point trace and the PIC double-quotient description.
2. Sum rational a-orbits to get centralizer quotient volumes; use the acceptable-centralizer identity to obtain rational reductive groups.
3. Aggregate the ker¹ polarized twists, apply the effective-triple bijection, and use the Tamagawa/dual-component identities from ET.4.

**Acceptance.** Rescaling a centralizer Haar measure rescales its orbital integral inversely and its associated volume directly, leaving their product unchanged.

**Direct prerequisites.** [Large negative Frobenius shifts give the compact-support fixed-point trace](#large-frobenius-fixed-point-trace), [Adelic polarized fixed-point parameters equal effective triples](#effective-triple-bijection), [Acceptability recovers the endomorphism centre and adelic centralizers](#acceptable-centralizer-identity), `EndoscopicTransferAndUnitaryTraceComparison:ET.4/tamagawa-number-formula`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1/orbital-integral`.

**Sources.** [S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §13, Theorem 13.1 and proof, pp.41–42. The exact mass coefficient, inner centralizer measures and coefficient trace.

<a id="corrected-cohomological-functoriality"></a>

### 22. The corrected adelic cohomology map used in global cancellation

**Theorem.** For a number field F and connected reductive G, the canonical map H¹(F,G(A_F))→A_F(G), expressed through the algebraic fundamental group and global duality, is functorial for homomorphisms of reductive groups. The separate map β_G from H¹(F,G(A_F)/Z(G)(F)) is used for a fixed G and its exact-sequence arguments; no functoriality under arbitrary homomorphisms is asserted for it. In particular an inclusion of groups need not carry the centre of the source into the centre of the target and need not induce the required map on these quotients.

**Hypotheses.** Global cohomology with the standard adelic Galois action; A_F(G) is the dual-component group in ET.0.

**Proof route.**

1. Use the functorial map on algebraic fundamental groups, not a nonexistent functor on central quotients.
2. Apply global duality to the adelic cohomology map.
3. In the cancellation proof use β only within each fixed group, and the corrected unquotiented map for cross-group comparison.

**Acceptance.** The diagonal torus of GL_2 has centre equal to itself, whose image is not central in GL_2; it defeats the uncorrected quotient functoriality claim.

**Direct prerequisites.** `EndoscopicTransferAndUnitaryTraceComparison:ET.0/kottwitz-duality`, [Newton and Kottwitz invariants with the PEL sign](#newton-kottwitz-invariants).

**Sources.** [S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §2, Lemma 2.4, p.5. The original functoriality sentence requires the published author correction. [S. W. Shin, Errata](https://math.berkeley.edu/~swshin/errata.pdf), p.1, first entry. Replaces the unsupported β functoriality by functoriality of unquotiented adelic H¹.

<a id="prestabilization-awayp"></a>

### 23. Finite obstruction Fourier expansion and transfer away from p

**Theorem.** For each triple, 1_{α=1}=|K(I_0/Q)|⁻¹Σ_{κ∈K(I_0/Q)}⟨α,κ⟩. The dual-component/Tamagawa identity |A_Q(I_0)|/|K(I_0/Q)|=τ(G)|ker¹(Q,G)| rewrites the counting formula as a sum over stable rational pairs (γ_0,κ). With local transfer factors satisfying ∏_vΔ_v(γ_H,γ_0)=1, invert the κ-characters when grouping rational classes into the three factors O^p, O_p and O_∞ of Shin (5.5). For effective triples the product of local Kottwitz signs is 1. Ordinary Langlands–Shelstad transfer of φ_v for v≠p,∞ gives h_v^H; hyperspecial unit functions transfer to unit functions at almost all unramified places with unit Haar normalization. The archimedean Lefschetz function h_∞^H realizes O_∞, is compact modulo A_H(R)^0 with its specified central character, and kills nonelliptic or nontransfer classes. These supplied identities stabilize the two factors away from p, leaving the acceptable J_b factor.

**Hypotheses.** Standing type A/C data; compatible global/local measures and transfer-factor normalization; decomposable φ followed by linear extension. General ker¹(Q,G) is retained. No twisted fundamental lemma is needed in this route.

**Proof route.**

1. Use finite-character orthogonality and ET.4 Tamagawa identities.
2. Parametrize (γ_0,κ) by elliptic endoscopic data and matching γ_H via ET.0 norm correspondence.
3. Apply ordinary local transfer and ordinary group fundamental lemma; use ET.4 archimedean transfer and the product-sign identity from the realized rational centralizer.

**Acceptance.** The Fourier expansion vanishes for α≠1; omitting it would incorrectly count ineffective triples.

**Direct prerequisites.** [Unstabilized Igusa counting with centralizer masses](#orbit-mass-counting), [The corrected adelic cohomology map used in global cancellation](#corrected-cohomological-functoriality), `EndoscopicTransferAndUnitaryTraceComparison:ET.0/norm-correspondence`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/kottwitz-sign`, `EndoscopicTransferAndUnitaryTraceComparison:ET.3/local-transfer-existence`, `EndoscopicTransferAndUnitaryTraceComparison:ET.3/group-fundamental-lemma`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/tamagawa-number-formula`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/archimedean-lefschetz-functions`.

**Sources.** [S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §5, equations (5.2)–(5.7), Lemma 5.1, pp.15–17. Fourier expansion, product signs and transfers away from p.

<a id="effective-levi-endoscopy"></a>

### 24. Effective Levi endoscopy for the Igusa p-factor

**Construction.** For a local endoscopic datum (H,s,η) of G at p, let E_p^eff(J_b,G;H) be the isomorphism classes of endoscopic data (M_H,s_H,η_H) for the inner form J_b of M_b whose associated acceptable semisimple stable pairs (δ,κ) occur, and whose extension through M_b⊂G gives (H,s,η). Realize M_H as a Q_p-Levi of H with a cocharacter ν_{M_H} mapping geometrically to ν_b; choose compatible L-morphisms and fix representatives of the finite coset set Out(H,s,η)/Out_G(M_H,s_H,η_H), giving embeddings I(M_H,H). For each effective stable pair there is a unique embedding coset, up to the permitted automorphism of the Levi datum, carrying its M_H-class to the given H-class. Its elements are acceptable for every embedded cocharacter iν_{M_H}. Empty effective Levi sets contribute zero.

**Hypotheses.** Fix the decency inner twist, the global datum localized at p, and compatible based dual embeddings. The quotient is a set of cosets with representatives, not an assertion that the subgroup is normal.

**API.**

- **`EffectiveLevi.relevance`** (characterisation): Existence of an acceptable J_b stable pair and extension to the chosen H datum determines relevance.
- **`EffectiveLevi.embeddingCosets`** (constructor): Choose one embedding for each Out(H)/Out_G(M_H) coset.
- **`EffectiveLevi.uniqueContribution`** (characterisation): A relevant H-class has one contributing embedding coset modulo permitted Levi automorphisms.
- **`EffectiveLevi.cocharacter`** (compatibility): ν_{M_H} transports ν_b; every chosen embedding carries acceptable elements to its own acceptable cone.
- **`EffectiveLevi.empty`** (compatibility): No relevant datum implies a zero p-function.

**Checks.**

- **trivial_datum.** For H=G* the Newton Levi datum is M_H=M_b; the inner relevance still depends on J_b, not on whether H is quasi-split.
- **outer_cosets.** If the two outer groups coincide, I has one representative; multiplying the summand by the full outer group size is wrong.
- **empty.** If no acceptable J_b class matches the H datum, the effective set is empty and the construction contributes zero.
- **embedded_cone.** Two different embedding representatives may transport ν differently; testing acceptability against one fixed untransported cocharacter is not the rule.

**Uses.** [The Igusa endoscopic function at p](#p-test-function): Indexes the finite sum of transferred and pushed Levi functions.

**Proof route.**

1. Restrict the centralizing dual datum to M_b and use the inner-form relevance condition for J_b.
2. Construct the Levi in H and compare the two dual/L-group diagrams.
3. Inject Out_G(M_H) into Out(H), choose coset representatives, and prove uniqueness from the corresponding stable-pair parametrization. Acceptability follows from inclusion of root systems.

**Acceptance.** Counting all embeddings without quotienting by Out_G(M_H) overcounts a stable pair.

**Direct prerequisites.** [Decent representatives, Newton Levi and J_b](#decent-levi-and-jb), [Acceptable support and acceptable functions](#acceptable-functions-with-geometry), `EndoscopicTransferAndUnitaryTraceComparison:ET.0/endoscopic-datum`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/norm-correspondence`.

**Sources.** [S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §6.1–6.2, equations (6.1)–(6.7) and Lemma 6.2, pp.17–21. Effective inner-form Levi data, outer automorphism cosets and uniqueness.

<a id="acceptable-levi-pushforward"></a>

### 25. Acceptable Levi functions, ordinary orbital integrals and normalized Jacquet modules

**Theorem.** For connected reductive G_0/Q_p, a rational cocharacter ν with Levi M=Z_{G_0}(ν), and φ∈C_c^∞(M(Q_p)) supported on ν-acceptable elements, assume O_m^M(φ)=0 for semisimple m with disconnected centralizer. There exists a lift φ̃∈C_c^∞(G_0(Q_p)) with O_g^{G_0}(φ̃)=δ_{P(ν)}(m)⁻¹O_m^M(φ) if g is rationally conjugate to an acceptable m, and zero otherwise. Such m is unique up to M(Q_p)-conjugacy. Its stable version is SO_g(φ̃)=δ_{P(ν)}(m)⁻¹SO_m(φ) when g is stably conjugate to an acceptable m, and zero otherwise. For irreducible admissible π, tr π(φ̃)=tr J_{P(ν)^op}^{G_0}(π)(φ), where J_P=Jac_P⊗δ_P^{−1/2}. This is the specified normalized lift, including the full δ_P⁻¹ orbital factor; it is not arbitrary parabolic induction.

**Hypotheses.** The root acceptability sign and P(ν) convention are those fixed above; quotient Haar measures on corresponding centralizers are compatible.

**Proof route.**

1. Acceptable eigenvalue valuations force a conjugating Weyl element to preserve P(ν); rational conjugacy therefore stays in M. The stable rational-class bijection uses H¹(M)→H¹(G_0) through the parabolic.
2. Set φ_0=φδ_P⁻¹ and prescribe its conjugacy-summed orbital function. Prove the germ conditions needed for realization by a compactly supported function; the source omits this general-group step, boundary G5.
3. Use |D_{G_0}^M(m)|=δ_P(m), Weyl integration and Casselman’s character comparison to derive the normalized opposite-Jacquet identity.

**Acceptance.** For GL_2 diagonal M and ν=(−1,0), m=(1,p) has δ_P(m)=p. The required orbital coefficient is p⁻¹; dropping the modulus fails. The regular pair (1,−1),(−1,1) is G-conjugate but not M-conjugate and is not acceptable.

**Direct prerequisites.** [Acceptable support and acceptable functions](#acceptable-functions-with-geometry), `EndoscopicTransferAndUnitaryTraceComparison:ET.1/orbital-integral`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/padic-character-distributions`.

**Sources.** [S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §1.2, p.4; §3.3–3.4, Lemmas 3.4–3.6,3.9 and Corollary 3.10, pp.11–12. Exact opposite normalized Jacquet and full-modulus orbital normalization.

<a id="transfer-factor-constant"></a>

### 26. The Igusa p-invariant equals the inner-transfer cocycle pairing

**Theorem.** Normalize Δ_{M_H}^{M_b}(γ_H,γ_0)=|D_G^{M_b}(γ_0)|_p^{−1/2}|D_H^{M_H}(γ_H)|_p^{1/2}Δ_H^G(γ_H,γ_0). For each effective Levi datum there is a nonzero constant c_{M_H}, independent of the matching acceptable semisimple elements, such that c_{M_H}Δ_{M_H}^{J_b}(γ_H,δ)=⟨α̃_p(γ_0,δ),κ̃⟩⁻¹Δ_{M_H}^{M_b}(γ_H,γ_0). The lifts α̃_p,κ̃ are the extended dual-centre characters used in prestabilization. The identity includes singular semisimple matches by descent. For H=G*, M_H=M_b and the trivial datum, c_{M_b}=e(J_b). Split J_b does not force all c_{M_H}=1 for nontrivial data.

**Hypotheses.** Compatible L-embeddings, inner twists, Haar measures and local transfer-factor conventions fixed throughout.

**Proof route.**

1. For regular matches express the ratio of inner transfer factors by Tate–Nakayama duality for (T_0^der×T_0′^der)/anti-diagonal Z(G^der).
2. Lift b and the conjugator to the derived group and compute its cocycle; functoriality of κ identifies the cocycle pairing with α̃_p and the same κ̃, leaving a constant independent of elements.
3. For a singular centralizer, lift its basic b_δ through an elliptic torus and perturb by a sufficiently close regular t. Compare κ under the torus map and use transfer-factor descent; retain the inverse in the pairing.

**Acceptance.** For basic GL_2 with J_b the quaternion multiplicative group, the trivial datum has c=e(J_b)=−1; setting every constant to +1 changes the trace.

**Direct prerequisites.** [Effective Levi endoscopy for the Igusa p-factor](#effective-levi-endoscopy), [Igusa triples, centralizer isocrystals and the effective obstruction](#effective-triples-and-invariant), [Finite obstruction Fourier expansion and transfer away from p](#prestabilization-awayp), `EndoscopicTransferAndUnitaryTraceComparison:ET.0/tate-nakayama-tori`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1/transfer-factor-properties`.

**Sources.** [S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §6.3, equations (6.8)–(6.9), Lemma 6.3, pp.21–22; §6.4, pp.23–26; §8.1, p.27. Compares the cocycle and κ pairing, proves the constant, and extends to singular matches.

<a id="p-test-function"></a>

### 27. The Igusa endoscopic function at p

**Construction.** For acceptable φ_p∈C_c^∞(J_b(Q_p)) and each effective Levi datum set φ_p^0=φ_p·δ̄_{P(ν_b)}^{1/2}, where the modulus is transported to J_b through its inner identification. Choose its ordinary endoscopic transfer φ_{M_H} to M_H supported on the intersection of the open iν_{M_H}-acceptable cones, using Shin’s cutoff argument; its regular orbital integrals retain matching. For each i∈I(M_H,H), multiply by δ_{P(iν_{M_H})}^{−1/2} and apply the acceptable-Levi lift to H, obtaining φ̃_{M_H,i}. Define h_p^H=Σ_{M_H}Σ_i c_{M_H}φ̃_{M_H,i}; use zero when the effective set is empty. Its stable orbital integral at every (G,H)-regular semisimple γ_H equals the κ-weighted O_p factor of prestabilization for matching effective data, and vanishes for ineffective/nonmatching classes. The character identity of the Levi lift fixes the normalized opposite Jacquet functor used in subsequent spectral reduction.

**Hypotheses.** Acceptable support, effective data, and transfer factors normalized by the preceding constant theorem. Choose the acceptable-cone support cutoff. Verify the disconnected-centralizer vanishing required by the Levi lift; this general-group applicability check is included in G5.

**API.**

- **`IgusaPFunction.sourceModulus`** (constructor): Multiply φ_p by the transported δ_P^{1/2} before transfer.
- **`IgusaPFunction.leviTransfer`** (constructor): Ordinary matching defines the stable orbital class of φ_{M_H}.
- **`IgusaPFunction.push`** (constructor): Multiply by δ_{P(iν)}^{−1/2} and take the prescribed acceptable-Levi lift.
- **`IgusaPFunction.sum`** (structure): Sum c_{M_H} times the lifts over effective data and embedding cosets.
- **`IgusaPFunction.stableOrbital`** (characterisation): On (G,H)-regular semisimple classes its SO equals the defined κ-weighted O_p, and is zero on nonmatching classes. The ARCH supplier kills nonregular contributions in the global sum.
- **`IgusaPFunction.choice`** (compatibility): Changing the representatives with the matching data transported preserves stable orbital integrals; pointwise equality of functions is not required.

**Checks.**

- **empty.** Empty E_p^eff gives h_p^H=0, including every stable orbital integral.
- **trivial_sign.** For the quaternion basic GL_2 case and H=G*, the source transfer has the inner-form sign and the additional constant is −1, as the normalization theorem requires.
- **ordinary_moduli.** For two one-dimensional blocks, the δ^{1/2} at the source and δ^{−1/2} before lift occur separately; deleting both changes the prescribed Jacquet trace.
- **one_effective_coset.** If a class has one relevant embedding coset, only that summand has nonzero SO; the finite sum must not multiply it by the outer group order.

**Uses.** [Adelic endoscopic test functions and stable choice independence](#global-test-function): Supplies the p-component of the adelic endoscopic test function. `EndoscopicTransferAndUnitaryTraceComparison:ET.7b/red-trace-duality`: Its source modulus and normalized opposite Jacquet identity fix the downstream reduction trace; the reduction functor remains ET.7b’s target.

**Proof route.**

1. Use ordinary local endoscopic transfer J_b→M_H and the square-root modulus on its source.
2. The two modulus corrections and discriminant relation convert the stable Levi orbital identity to the required O_p term.
3. Uniqueness of the contributing embedding coset prevents overcounting. The constant theorem supplies exactly the inverse κ character.

**Acceptance.** Taking one embedding without accounting for the coset set can omit contributions; taking all automorphisms can repeat them.

**Direct prerequisites.** [Effective Levi endoscopy for the Igusa p-factor](#effective-levi-endoscopy), [Acceptable Levi functions, ordinary orbital integrals and normalized Jacquet modules](#acceptable-levi-pushforward), [The Igusa p-invariant equals the inner-transfer cocycle pairing](#transfer-factor-constant), `EndoscopicTransferAndUnitaryTraceComparison:ET.3/local-transfer-existence`.

**Sources.** [S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §6.3, equations (6.10)–(6.11) and Lemma 6.5, pp.22–23. Both square-root moduli, the embedding sum and stable orbital identity.

<a id="global-test-function"></a>

### 28. Adelic endoscopic test functions and stable choice independence

**Construction.** For a decomposable acceptable φ=φ^pφ_p and ξ, assemble h^H=h^{H,p}h_p^Hh_∞^H. The finite away-p factors are ordinary transfers with hyperspecial units at almost all places; h_p^H is the preceding finite Levi sum; h_∞^H is the supplied Lefschetz function, compact modulo A_H(R)^0 and transforming by χ_H determined by ξ and the L-embedding. Extend linearly to finite sums of decomposable φ. The stable elliptic distribution depends only on the matching orbital data with compatible global measures, not on particular transfer functions, representative L-data, or reciprocal local rescalings Δ_v→a_vΔ_v with ∏a_v=1. Arbitrary unrelated rescaling of one local transfer factor is not an invariance.

**Hypotheses.** Compatible global transfer factors, split-centre quotients and Tamagawa measures; h_∞ central character retained.

**API.**

- **`IgusaGlobalFunction.tensor`** (constructor): Use ordinary away-p transfer, the p-Levi sum and h_∞ with the ξ-central character.
- **`IgusaGlobalFunction.linear`** (functoriality): Extend from decomposable functions by finite linear combinations.
- **`IgusaGlobalFunction.unramified`** (compatibility): At almost all unramified places a normalized hyperspecial unit supplies the factor.
- **`IgusaGlobalFunction.rescale`** (compatibility): Reciprocal local transfer-factor rescalings with product one preserve global stable orbital integrals.
- **`IgusaGlobalFunction.datumIso`** (compatibility): Transport an isomorphism of data, all embeddings and local factors before comparing stable distributions.

**Checks.**

- **one_local_scalar.** Scaling only Δ_p by a≠1 without compensating elsewhere changes the normalization; it is not a permitted invariant operation.
- **reciprocal_scalars.** Multiplying one finite factor by a and another by a⁻¹ leaves the global stable orbital product unchanged.
- **split_centre.** For a group with noncompact real split centre, retain compact-mod-centre support and its central character; requiring ordinary compact support discards the Lefschetz function.

**Uses.** [Stable elliptic Igusa trace formula with all mass factors](#stable-trace-with-normalizations): Defines its right-hand test functions.

**Proof route.**

1. Almost-all unit transfers define the restricted tensor product.
2. Multiply the three orbital identities to recover the prestabilized summand.
3. Apply the global product constraint to the local scalars; datum isomorphisms transport both embeddings and orbital classes.

**Acceptance.** An archimedean Lefschetz function need not be compactly supported on H(R); its support is compact after the prescribed split-centre quotient.

**Direct prerequisites.** [Finite obstruction Fourier expansion and transfer away from p](#prestabilization-awayp), [The Igusa endoscopic function at p](#p-test-function), `EndoscopicTransferAndUnitaryTraceComparison:ET.4/archimedean-lefschetz-functions`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/stable-elliptic-distribution`.

**Sources.** [S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §5.2, pp.16–17; §7, equation (7.1), Lemma 7.1, pp.26–27. Global tensor assembly and invariance of the stable orbital data.

<a id="stable-trace-with-normalizations"></a>

### 29. Stable elliptic Igusa trace formula with all mass factors

**Theorem.** For acceptable φ and ξ as above, tr(φ|[H_c(Ig_b,L_ξ)])=|ker¹(Q,G)|Σ_{(H,s,η)∈E_ell(G)}ι(G,H)ST_e^H(h^H), with ι(G,H)=τ(G)/(τ(H)|Out(H,s,η)|). The stable elliptic distribution is the ET.4 one, with the component-centralizer coefficient, Tamagawa measures and real split-centre quotient; on the contributing connected regular centralizers the component coefficient is 1. Functions h^H use the fixed global transfer normalization and the c_{M_H} p-constants. The formula is a distributional equality on the geometric acceptable domain, independent of matching function choices. It makes no claim that this geometric construction of h^H works for all compactly supported functions without the acceptable support.

**Hypotheses.** Type A/C PEL data, b∈B(G,−μ), rational ℓ-adic cohomology identified with complex coefficients.

**Proof route.**

1. Multiply the three local orbital identities and identify each stable elliptic summand.
2. Count datum automorphisms to obtain |Out|⁻¹, and divide the prefactor τ(G)|ker¹| by the τ(H) built into ST_e.
3. Use global stable choice independence and extend from decomposable acceptable functions by linearity.

**Acceptance.** For H=G* the outer factor is 1, but the ker¹ prefactor and Tamagawa ratio still have to be evaluated, rather than silently dropped.

**Direct prerequisites.** [Unstabilized Igusa counting with centralizer masses](#orbit-mass-counting), [Finite obstruction Fourier expansion and transfer away from p](#prestabilization-awayp), [The Igusa endoscopic function at p](#p-test-function), [Adelic endoscopic test functions and stable choice independence](#global-test-function), `EndoscopicTransferAndUnitaryTraceComparison:ET.4/stable-elliptic-distribution`.

**Sources.** [S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §7, Theorem 7.2 and proof, p.27. The complete stable elliptic coefficient and acceptable-function trace identity.

<a id="central-shift-character-separation"></a>

### 30. Central Frobenius shifts determine finite virtual-character identities

**Theorem.** Let Π_1,Π_2 be finite virtual complex smooth admissible representations of G(A_f^p)×J_b(Q_p), or the finite families of irreducible constituents visible after fixing the other test functions and a p-level. If their traces agree for every acceptable function, they agree for every compactly supported locally constant function. More locally, for fixed φ suppose the difference on φ^(N) is Σ_{j=1}^r c_j z_j^{−N}, where z_j are distinct nonzero eigenvalues of the central fr^s after grouping constituents with equal eigenvalues. If it vanishes for every sufficiently large integer N, then all c_j vanish and the difference at N=0 vanishes. No diagonalizability of a central action on arbitrary extensions is assumed: compute traces in the finite Grothendieck decomposition, where the central element acts by scalars on irreducibles.

**Hypotheses.** Finite number of constituents for the fixed-level/test-function family; scalar central action on each irreducible. The shifted φ^(N) is eventually acceptable by the geometric theorem.

**Proof route.**

1. Group the finite virtual-character difference by equal central characters.
2. For r consecutive large N, the equations have matrix diag(z_j^{−N_0}) times a Vandermonde matrix on z_j⁻¹.
3. Nonzero, pairwise distinct scalars give nonzero determinant, so every grouped coefficient is zero, including their sum at N=0.

**Acceptance.** With eigenvalues 2 and 3, two consecutive equations c_1·2^{−N}+c_2·3^{−N}=0 have nonzero determinant. A single equation would not suffice. Equal eigenvalues must first be grouped.

**Direct prerequisites.** [Large negative Frobenius shifts give the compact-support fixed-point trace](#large-frobenius-fixed-point-trace), `EndoscopicTransferAndUnitaryTraceComparison:ET.4/padic-character-distributions`, `mathlib:Matrix.vandermonde`, `mathlib:Matrix.det_vandermonde`.

**Sources.** [S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §6, Lemma 6.4 and proof, pp.20–21. Finite irreducible expansion and central-shift separation. [A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.5, Lemma 5.5.1, pp.741–743. Applies the separation to a fixed finite spectral expression. [A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/pdf/1909.01898v2), §5.6, Lemma 5.6.2, pp.75–76. Extends the fixed finite linear combination to N=0.

<a id="unitary-stable-specialization"></a>

### 31. Unitary specialization and the endoscopic coefficients

**Application.** For the unitary similitude PEL data used by Caraiani–Scholze, localize at split p and write the quasi-split form as G_{2n}. Its elliptic data are the trivial G_{2n} datum and G_{n_1,n_2} with n_1+n_2=2n, n_1≥n_2>0, omitting the pair when both n_i and [F⁺:Q] are odd. Use the parity-twisted L-embeddings of ET.0, not an untwisted block embedding of Weil groups. The unramified Hecke factor is pullback along that L-embedding. Evaluate ker¹(Q,G)=1 for these particular groups by the supplied global unitary duality/Hasse statement before dropping the general prefactor. For acceptable φ the result is tr(φ|[H_c])=Σ_Hι(G,H)ST_e^H(h^H). Combining the supplied stable-to-twisted identity and base-change test functions yields τ(G)Σ_H ε_H I_spec^{H̃θ}(f^{H̃}θ), with ε_H=1/2 only for equal nonzero blocks and 1 otherwise. The latter uses the ET.4 spectral supplier rather than replanning it.

**Hypotheses.** Precisely the global unitary data and sufficiently divisible neat away-p principal level of CS non-compact §§5.1,5.3,5.4; p splits in the imaginary quadratic subfield. The infinity factors on proper endoscopic groups use their supplied nontrivial coefficient systems Ξ, not an assertion that every endoscopic Π_∞ is trivial-coefficient cohomological. Trivial coefficient system for the displayed CS non-compact formula; general ξ uses the matching archimedean central character.

**Proof route.**

1. Use ET.0 classification and parity L-embedding formulas. The degenerate n_2=0 presentation is the trivial datum and is not counted twice.
2. Apply the general formula and justify ker¹=1 from the global unitary supplier (request U); preserve it until that proof is provided.
3. Use ET.4 compatible base change, small-level transfers, archimedean functions and stable/twisted comparison, then evaluate the outer automorphism index.

**Acceptance.** For equal blocks the outer swap gives the coefficient 1/2; for unequal positive blocks it gives no extra half.

**Direct prerequisites.** [Stable elliptic Igusa trace formula with all mass factors](#stable-trace-with-normalizations), `EndoscopicTransferAndUnitaryTraceComparison:ET.0/unitary-elliptic-endoscopic-data`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/stable-twisted-identity`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/unramified-transfers`, `EndoscopicTransferAndUnitaryTraceComparison:ET.4/small-level-transfer`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/kottwitz-duality`.

**Sources.** [A. Caraiani and P. Scholze, On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), §5.2, Theorem 5.2.3, pp.734–735. Compact unitary stable Igusa trace specialization. [A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/pdf/1909.01898v2), §5.2, pp.67–68; §5.3, Theorem 5.3.2, p.68; §5.6, Theorem 5.6.1, pp.74–75. Unitary indexing, the acceptable stable formula and twisted coefficient.

<a id="normalization-acceptance-examples"></a>

### 32. Worked normalization tests for assembly

**Application.** The assembled layer must pass the following simultaneous checks: ordinary two-block slopes (1,0) require negative Frobenius shifts; the rank-one basic element condition is vacuous but geometric acceptability is not; quaternion basic GL_2 has c=e(J_b)=−1 for the trivial datum; the acceptable GL_2 Levi lift has δ_P⁻¹ orbital scaling and opposite normalized Jacquet trace; a nonzero K-obstruction cancels under finite Fourier summation; n_2=0 is counted only as the trivial unitary datum; equal positive blocks give the outer-swap half; and character extension groups repeated central eigenvalues before taking a Vandermonde determinant.

**Hypotheses.** All functions and Haar measures use the conventions fixed in this reader.

**Proof route.**

1. Compute the slope valuations, the upper-triangular GL_2 modulus and the quaternion sign.
2. Evaluate the two characters of Z/2, and the equal-block swap quotient.
3. Use the explicit determinant for central eigenvalues 2 and 3 and check what changes if they coincide.

**Acceptance.** For slopes (1,0), a_i−Nλ_i for a=(5,0) is separated only for N>5. For ν=(−1,0), m=(1,p), δ_P=p and the orbital lift coefficient is p⁻¹. For eigenvalues 2,3 the determinant of rows N,N+1 is −2^{−N−1}3^{−N−1}, nonzero.

**Direct prerequisites.** [Acceptable support and acceptable functions](#acceptable-functions-with-geometry), [The Igusa p-invariant equals the inner-transfer cocycle pairing](#transfer-factor-constant), [Acceptable Levi functions, ordinary orbital integrals and normalized Jacquet modules](#acceptable-levi-pushforward), [Igusa triples, centralizer isocrystals and the effective obstruction](#effective-triples-and-invariant), [Unitary specialization and the endoscopic coefficients](#unitary-stable-specialization), [Central Frobenius shifts determine finite virtual-character identities](#central-shift-character-separation).

**Sources.** [S. W. Shin, Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf), §6, Definitions 6.1–6.2 and Lemma 6.4, pp.19–21. Slope and central-shift tests. [S. W. Shin, A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf), §3.4, Lemma 3.9, p.12; §6.3, Remark 6.4, p.22. Modulus and inner-sign checks. [A. Caraiani and P. Scholze, On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/pdf/1909.01898v2), §5.6, Theorem 5.6.1, p.75. Equal-block half.

### Examples

**Ordinary slope order and the strict boundary.** With λ=(1,0), s=1 and valuation table a=(5,0), the negative shift produces (5−N,0). It is acceptable exactly when N>5. At N=5 the valuations coincide, so the strict inequality fails. The positive shift (5+N,0) never enters the acceptable cone. For two blocks with several eigenvalues the test compares every earlier value with every subsequent value; comparing only the two averages can accept an interlaced spectrum incorrectly.

**Finite-level degree and Haar scaling.** For the ordinary elliptic BT group μ_{p∞}⊕Q_p/Z_p, the structured similitude automorphisms are pairs of units, with multiplier their product. A liftable level-m fibre has φ(p^m)^2 points. At p=3,m=2 this is 36, not |GL_2(Z/9)|. On a zero-dimensional finite fibre of size d the identity correspondence trace is d; integration against 1_U is vol(U)d. Finite étaleness of the fibre cover gives a proper projection leg even when its central leaf is not proper.

**Real type and a quaternion centralizer.** For B=Q,M=Q,c=id, the p-divisor identity gives η_p=1/2. The simple polarized geometric object can be supersingular elliptic, with endomorphism algebra ramified at p and infinity. The p-component has slope 1/2, division index 2 and BT height 2. Restricting the type to CM fields would lose this case. For basic GL_2, J_b=D^× is an inner form of GL_2; for the trivial endoscopic datum, both its inner transfer sign and c_{M_b} are −1. This example is a local normalization test, independent of whether a specified global Newton stratum is nonempty.

**Levi modulus.** Let M be the diagonal torus of GL_2, ν=(−1,0) and m=(1,p). P(ν) is upper triangular and δ_P(m)=|1/p|_p=p. Lemma 3.9’s orbital lift therefore multiplies O_m by p⁻¹. Its spectral counterpart is the normalized Jacquet module for the opposite parabolic. The p-function first multiplies the J_b test by the source square-root modulus, transfers it, then applies the Levi square-root correction and this orbital lift. Those are three distinct normalizations.

**An ineffective obstruction and a near-equivalence fibre.** If K=Z/2 and α is nontrivial, the two Fourier terms are +1 and −1 and the effective indicator vanishes. An ineffective triple contributes nothing despite having local semisimple matching classes. Polarized forms with only trivial real localization belong to ker(H¹(Q,H_z)→H¹(R,H_z)); the near-equivalent ones must also be trivial at every finite place and form ker¹(Q,H_z). After this aggregation, several rational a-orbits may belong to one adelic FPAV parameter; their quotient volumes are included in the mass.

**Outer swap and finite character separation.** The unitary presentation with a zero second block is the trivial datum, counted once. For positive equal blocks the outer swap has order two and gives ε=1/2; unequal blocks give ε=1. For distinct central eigenvalues 2 and 3, rows N and N+1 give determinant −2^{−N−1}3^{−N−1}, which is nonzero. With two equal eigenvalues the columns coincide and coefficients 1,−1 can cancel for every N: they must be combined before forming the Vandermonde system.

## Downstream compatibility

The ET.6a packet already owns ET.7b/newton-reduction, red-trace-duality and local-factorization. They import this layer’s p-function normalization and central-shift theorem. The normalized reduction is Red=n-Red⊗δ̄_{P(ν_b)}^{1/2}, or equivalently the untwisted reduction evaluated at φ_pδ̄^{1/2}; omitting that twist breaks the trace comparison for nonbasic b. The endoscopic infinity types are cohomological for the coefficient systems Ξ selected by the Lefschetz factors; for a proper endoscopic group these need not be trivial. These are the established ET.6a corrections E4/E5, inherited from the CS17 findings E74/E77. The finite spectral expression and the reduction functor remain ET.7b targets, and no backward dependency from ET.5 is introduced.

The extension is applied after the away-p factors and the p-level have been fixed: the resulting finite expression in irreducible J_b characters vanishes under all sufficiently large central shifts, and character separation gives the equality at N=0. It supplies precisely the all-function finite linear trace identity of CSnc Lemma 5.6.2. It supplies neither a positivity assertion for its virtual coefficients nor an all-function construction of the geometric stable orbital test function.

## Source corrections and proof boundaries

The source locators distinguish author copies, published scans and numbered arXiv versions. In particular the Shin copies are 44 and 30 pages, respectively, so their page locators are not the journal page numbers. The attempted Cambridge version-of-record text could not be served: findings E7–E9 concern only the identified author copy. They await independent review. All target statements use the corrections.

**E6 — Author copy, §2 Lemma 2.4, p.5; corrected author errata p.1.** The adelic β_G map using the quotient by Z(G)(F) is asserted functorial for homomorphisms of reductive groups. Use the functorial map H¹(F,G(A_F))→A_F(G). Keep β_G only in its fixed-group exact-sequence arguments. A group inclusion need not carry its source centre into the target centre; the diagonal torus in GL_2 prevents the claimed map of quotients. Reach: the proof. Correction status: Shin author-maintained errata.pdf, p.1, first entry.

**E7 — Author copy, §3.2, p.10, paragraph invoking Kottwitz Proposition 6.3.** Decent representatives of the same class in B(G), with their rational Newton Levi, are described as rationally conjugate as actual elements. Kottwitz Proposition 6.3 compares the rational conjugacy orbits of (M,[b]_M), with [b]_M in B(M). It does not compare arbitrary actual decent elements by ordinary rational conjugacy. For G_m, take b=1 and b′=x⁻¹σ(x)≠1 for a Teichmüller unit x in an unramified extension L_s. Both have ν=0, are σ-conjugate and satisfy the decency norm-one equation; ordinary torus conjugacy cannot change either element. Reach: the proof. Correction status: new.

**E8 — Author copy, §3.3, proof of Corollary 3.8, p.11, parenthetical explanation.** Connectedness of the semisimple centralizer is used to identify stable and rational conjugacy classes by definition. Connected centralizers can have several rational classes in a stable class. Use the acceptable rational-conjugacy uniqueness and the stable rational-class comparison of Lemmas 3.5–3.6. An elliptic regular element of SL_2(Q_p) has connected norm-one torus T. H¹(Q_p,T)=Q_p×/N(E×) is nontrivial for a quadratic E, while H¹(Q_p,SL_2)=1; its stable class therefore contains distinct rational classes. Reach: the proof. Correction status: new.

**E9 — Author copy, §6.4, p.26, last displayed equality of the general-case perturbation argument.** The final transfer-factor equality has the pairing ⟨α̃_p,κ̃⟩ without inversion. Use ⟨α̃_p,κ̃⟩⁻¹, consistently with equation (6.9) and the regular-case cocycle comparison. The perturbation preserves κ(b_δ) and the centralizer cocycle. Its limit must have the same inverse character as the regular identity; changing the exponent would not prove Lemma 6.3. Reach: the proof. Correction status: new.

The source-proof boundaries are part of the exact mathematical specification. ET.5 is planned at target granularity; the following inputs must be supplied before it is dependency-closed. A statement read through a citing paper is not recorded as a primary proof read.

- **G1 — Primary general tensor/κ/centralizer proof chain.** Kottwitz 1985 §§3–4.5 and 5.1–5.2,6.2–6.5 were read, including the descent construction. RR §1.3–1.15 supplies the general invariant statements, but its cited Kottwitz 1997 general κ construction and Rapoport–Zink Proposition 1.12 representability proof were not read. Steinberg fibre-functor vanishing and the general tensor-descent proof must be located before source-decomposed status; rank-one Mathlib classification does not fill this boundary.
- **G2 — Primary completely slope-divisible, liftable-moduli and kernel-gluing proofs.** Mantovan 2005 §§3–4 states and uses the precise structured central-leaf, liftability and finite étale torsor results and includes the two-slope gluing argument. Primary Oort–Zink leaf/slope filtration and Mantovan 2004 Proposition 3.3, Lemma 3.4 and general Lemma 3.6 induction were not read. Supply the structured, scheme-representable PEL form, all-higher-level liftability and general equivariant kernel gluing. Arbitrary truncated automorphisms cannot substitute for liftability.
- **G3 — Compatible finite-field descent and the actual coefficient lift.** Shin 2009 Lemma 6.3 identifies its model Frobenius with fr^{−s} but cites the unread thesis §2.3 for descent details. Complete the effective descent datum on the chosen finite levels and the universal quasi-isogeny morphism c_2!c_1*L_ξ→L_ξ over that field. The proper first leg and finite-fibre/quasi-finite second leg are established in this plan; point-set equivariance alone cannot close the coefficient gap. Varshavsky’s large-Frobenius theorem is imported, not reproved here.
- **G4a — Honda existence primary proof.** Tate 1966 proof §§1–3 and Waterhouse Chapter 2 statements were read. Honda’s existence converse is only read as stated by Waterhouse, not at its primary CM-lifting proof. Supply that primary chain, including real Weil numbers. The existing Brauer/class-field roadmap supplies its invariants; a proof over F_q must be related to the geometric common-refinement classification rather than identifying the two.
- **G4b — Polarized existence and CM-lift cancellation primary proofs.** Shin 2009 §§11–12 gives the exact construction/cancellation route, but cites unread Kottwitz 1992 §13 CM lifting and Lemma 9.2 with §17.1 for polarization and local hermitian realization. Locate their primary proofs, track the positive polarization and self-dual lattice/determinant conditions, and use corrected adelic cohomological functoriality. Unpolarized Honda–Tate does not prove effective polarized realization.
- **G5 — General acceptable-Levi orbital realization and applicability.** Shin 2010 Lemma 3.9 omits its main general-group orbital germ-realization step, referring to Harris–Taylor V.5.2 and Vignéras Theorem B. Harris–Taylor is not in the cleared library and no other copy was used. Supply an accessible primary general-group germ proof or obtain the cleared source, plus Casselman’s exact normalized character comparison. Verify the support cutoff and disconnected-centralizer vanishing required when applying the lemma to effective Levi transfer; do not extend Lemma 6.5 beyond (G,H)-regular classes.
- **G6 — Inherited global measure, archimedean and spectral supplier proof boundaries.** The existing ET.4 packet has an independent review with needs_changes and primary-proof gaps for Tamagawa identities, archimedean Lefschetz transfer and stable/twisted comparison. This pass records exact interfaces MASS and ARCH and imports those targets; it does not certify their proofs. The UNITARY evaluation ker¹=1 also needs its exact global unitary norm/Hasse proof. These supplier checks are required before ET.5 is dependency-closed.

## Ownership and assembly

ET.5 owns the required early algebraic prefix because ET is tier 14, IgusaVarietiesAndTorsionConcentration is tier 19 and BunGAndNewtonStrata is outside the current 94-roadmap order. The exact owner move covers the algebraic G-isocrystal/κ/Newton/J_b dictionary, PEL comparison and finite structured Igusa levels, monoid, rational cohomology and compatible Frobenius descent. The analytic tower, Hodge–Tate period morphism and boundary geometry keep their Igusa owner; torsor stacks and geometric Langlands keep their BunG owner.

The common finite-field Tate–Honda foundation also moves down from the outside-tier AbelianSchemesAndArithmeticModuliPartII. Its general theorem is a shared supplier for that Part II and AG2.1a after the owner repoint. The Igusa effective-triple theorem is specific to polarized geometric Igusa data. It does not identify the different ordinary F_{p^r} Shimura triples or c-polarized virtual abelian varieties required by their point-count supplier. The latter retains its own construction and statement. No ComplexMultiplicationAndExplicitReciprocity:CM.5 dependency is introduced.

The accepted ET.0 packet covers ET.0–3. The older ET.4 packet also contains fifteen ET.5 targets with an independent review recording needs_changes. The packet’s refines entries give a supersession map for assembly: publish the repaired target once, replacing its old identifier and incoming uses. The older packet is unchanged by this pass. General Fujiwara–Varshavsky remains EDC.8, Tamagawa computations remain ET.4, and normalized representation reduction remains ET.7b.

## Sources

- **[Counting points on Igusa varieties](https://math.berkeley.edu/~swshin/IgusaVar.pdf)**, S. W. Shin. Author copy of Duke Math. J. 146 (2009), 509–568; 44 pages, locators below use author-copy printed pages, equal to PDF pages. Read: §2, pp.4–6; §3, pp.6–8; §4, pp.8–13; §5, pp.13–17; §6, pp.17–20; §7, pp.20–24; §8, pp.24–27; §9, pp.27–29; §10, pp.29–34; §§11–12, pp.34–41; §13, pp.41–42. SHA-256: `022defdc0ebd913cdfd96d6c37b0f583dc9dc73716c23d1577c18035ff74eff8`.
- **[A stable trace formula for Igusa varieties](https://math.berkeley.edu/~swshin/StableIgusa.pdf)**, S. W. Shin. Author copy of J. Inst. Math. Jussieu 9 (2010), 847–895; 30 pages, locators use author-copy printed pages, equal to PDF pages. Read: §1.2, pp.3–4; §3.1–3.4, pp.10–12; §4, pp.12–15; §5, pp.15–17; §6, pp.17–26; §7, pp.26–27; §8, pp.27–29. SHA-256: `e74cbbe4463f003b8ae2eb10636744c7ae032d25a566f8b441004c7f14e2faf0`.
- **[On the cohomology of certain PEL type Shimura varieties](https://www.its.caltech.edu/~mantovan/papers/PEL.pdf)**, E. Mantovan. Author copy of Duke Math. J. 129 (2005), 573–610; locators use author-copy pages. Read: §3, pp.6–10, central leaves and slope filtration; §4, pp.10–14, finite Igusa moduli, monoid, Frobenius and rational cohomology. SHA-256: `6172cd3ac7579f6115356a9112d1721efe24387e1d168ab99755dca9cfbd4a2e`.
- **[Isocrystals with additional structure](https://www.numdam.org/article/CM_1985__56_2_201_0.pdf)**, R. E. Kottwitz. Compositio Math. 56 (1985), 201–220; published Numdam scan; locators use printed journal pages. Read: §3, pp.211–212; §4, pp.212–215; §5.1–5.2, pp.215–216; §6.1–6.5, pp.218–220. SHA-256: `51fe79cbe6798ea061128fd294c2459046572fcf5f7ed150c75d50e974819171`.
- **[On the classification and specialization of F-isocrystals with additional structure](https://www.numdam.org/item/CM_1996__103_2_153_0.pdf)**, M. Rapoport and M. Richartz. Compositio Math. 103 (1996), 153–181; published Numdam scan. Read: §1.3–1.15, pp.156–162: statements, examples and algebraic functors; results cited there from Kottwitz and Rapoport–Zink are not primary proofs read here.. SHA-256: `86acb9e18422e641d85f799262e1793614f705029a9cbd70dc0b03f74bcb13d8`.
- **[Lefschetz–Verdier trace formula and a generalization of a theorem of Fujiwara](https://arxiv.org/pdf/math/0505564v2)**, Y. Varshavsky. arXiv:math/0505564v2, author preprint of Geom. Funct. Anal. 17 (2007), 271–319. Read: §2.2, pp.19–20, Frobenius contraction statements; §2.3, pp.20–21, Theorem 2.3.2 and its proof; general trace machinery supplied by EDC.8. SHA-256: `8b4cb7ee9b1726cc998fc4d952a2542576e85ebe21e70b0f5c9f31c4682b8ac6`.
- **[Errata](https://math.berkeley.edu/~swshin/errata.pdf)**, S. W. Shin. Author-maintained two-page errata; read 2026-10-14. Read: p.1, first entry, correcting Counting points on Igusa varieties Lemma 2.4. SHA-256: `0c84c8d54cbfd222e6810677f4e765eac9b27c6070ac4df5572b64780ab782be`.
- **[Endomorphisms of abelian varieties over finite fields](https://pazuki.perso.math.cnrs.fr/index_fichiers/Tate66.pdf)**, J. Tate. Invent. Math. 2 (1966), 134–144; published scan. Read: §1, pp.134–136; §2, pp.136–139; §3 Theorems 1–2, pp.139–140. SHA-256: `47f284526522fb48840e1a1383b9bfc0bfc3f6aded39db6119a34a6e02214b87`.
- **[Abelian varieties over finite fields](https://www.numdam.org/item/ASENS_1969_4_2_4_521_0.pdf)**, W. C. Waterhouse. Ann. Sci. ENS 2 (1969), 521–560; published Numdam scan. Honda existence is stated, not proved here. Read: Chapter 2, pp.526–528, Weil numbers, endomorphism invariants and Honda classification. SHA-256: `7be2bf9dde45454afa3dd9a0ea1ba05acbe952b6b573a0c37c2b1b8f0cccbb47`.
- **[On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf)**, A. Caraiani and P. Scholze. Ann. of Math. 186 (2017), 649–766; published PDF; printed page = PDF page + 648. Read: §5.2, pp.732–735, definitions and stable formula; §5.5, pp.741–743, finite-character extension of acceptability. SHA-256: `4f9449e5ecfd8fb8b43a04acef73060f531be995babaa9f744f3db36aaa5e61a`.
- **[On the generic part of the cohomology of non-compact unitary Shimura varieties](https://arxiv.org/pdf/1909.01898v2)**, A. Caraiani and P. Scholze. arXiv:1909.01898v2, 22 November 2023, 90 pages; locators use preprint pages. Read: §5.2, pp.67–68; §5.3, p.68; §5.6, pp.74–76, construction and finite-character extension. SHA-256: `803fc16ab30fa37fa1ce08c683885040c2034bbefc6ca6567e73026006229f2e`.

## Suggested signatures

The accompanying [suggested file](../suggested/EndoscopicTransferAndUnitaryTraceComparison--ET.5.lean) is not exhaustive; this document is the definitive roadmap. Its namespace is `TauCetiRoadmap.EndoscopicTransferAndUnitaryTraceComparison.Igusa`. `IsSlopeSeparated` compares every pair of finite rational valuation sets in the block order; `frobeniusShift` has a real body subtracting sNλ_i. Their six examples include the ordinary sign, basic case, unit non-example and the strict N=5 boundary. `eventually_slope_separated` is the finite-family valuation milestone. `finite_character_separation` states the nonzero, pairwise-distinct central-eigenvalue Vandermonde milestone and has two examples testing repeated versus distinct eigenvalues. It elaborates at the library pins. The heavy mathematical objects, their API items and all checks stay specified above.
