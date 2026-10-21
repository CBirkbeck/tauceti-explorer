# Excursion operators and the spectral action, Part II

This roadmap proves that the Fargues–Scholze map into the Bernstein center produces very stable distributions for every connected reductive group over a p-adic field. It then compares the image centers for a quasi-split group and each of its extended pure inner forms. The resulting map respects Levi restriction, stable tempered character transfer and matching test functions. Hansen’s Theorems 1.1 and 1.4 are the main milestones; the atomic-character consequences give Corollaries 1.2 and 1.3.

The base roadmap constructs the spectral map and the semisimple parameters. This continuation owns the stability argument and its applications. It imports the smooth representation category, Bernstein theory, coherent Hecke kernels, parameter reconstruction, stable harmonic analysis and the local-shtuka character formula. The packet has a complete target-level plan, with all seven layers marked **planned**. Its three explicit gaps concern supplier interfaces and the source of the regular-packet application; no layer is claimed closed or implemented.

## Conventions and scope

Let E be a finite extension of Q_p and G a connected reductive E-group. Fix ell distinct from p, an algebraic closure Qbar_ell, an isomorphism iota:Qbar_ell ≃ C, a compatible square root of the residue cardinality q, and Haar/quotient measures. All spectral and representation-theoretic objects are transported using these choices. Parameter continuity is interpreted in the coefficient topology fixed by ES5/LP2 before transport; no continuity of the field isomorphism iota to the usual topology on C is assumed. The main theorem has no tameness or lower bound on p. The regular-packet application has its own hypotheses.

Use H(G)=C_c^infinity(G(E),C). The Bernstein center Z(G) is identified with essentially compact invariant distributions, so convolution z*f is again in H(G). Distribution evaluation z(f) is a complex number; it is distinct from the test function z*f. We use the usual convolution (z*f)(x)=z(g -> f(g^(-1)x)) and put f^vee(g)=f(g^(-1)), z^vee(f)=z(f^vee). Thus (z*f)(1)=z(f^vee). Inversion preserves U(G); the identity-distribution arguments apply convolution to f^vee. Since G(E) is unimodular, (y*z)(f)=y(z^vee*f) for central distributions. The dual action on characters is (z·Theta)(f)=Theta(z*f). For an irreducible pi, write z_pi for the scalar action.

D(G) is the complex vector space of finite linear combinations of irreducible finite-length Harish-Chandra characters. It is not a space of all invariant distributions. D_temp(G) is the tempered character span. D_ell(G) is the elliptic summand in Arthur’s decomposition, rather than the span of every irreducible character having some nonzero elliptic value. The induced span D_ind(G) is the kernel of elliptic restriction. Prefix S denotes the stable subspace. I(G) is the quotient of H(G) by the common kernel of regular orbital integrals. The harmonic-analysis interface identifies this with the appropriate character-null quotient and supplies its cuspidal/noncuspidal decomposition.

A test function is unstable if all its stable orbital integrals on strongly regular semisimple stable classes vanish. Write U(G) for this subspace. Elliptic elements in this document are strongly regular semisimple elements whose centralizer is an elliptic maximal torus. R_g is the finite nonempty set of rational conjugacy classes in the stable class of such an element g. The Weyl discriminant is D_G(g). Characters and orbital integrals are used only on their prescribed regular loci; weighted functions can be extended by zero for the integrals.

Induction is normalized: i_P^G(tau)=Ind_P^G(delta_P^(1/2) tau), with delta_P(m)=|det(Ad(m) on Lie U_P)|_E. Use geometric reciprocity and the exact ES7 normalized-induction dictionary: its cyclotomic correction cancels the half-modulus twist, leaving the ordinary dual Levi inclusion. Basic inner strata use the common spectral center without a nonbasic Levi twist.

For a quasi-split G* and basic b in B(G*), write G=G*_b. Only extended pure inner forms represented this way are targets. Set Z_FS(G)=range(Psi_G), with its image algebra structure. Normalize transfer from G* to G by the Kottwitz sign e(G); e(G*)=1. On elliptic stable characters, (Trans_G Theta)(g)=e(G)Theta(g*) for matching elements. Matching functions are normalized by the same transfer factor so that Theta(f*)=Trans_G(Theta)(f).

### The conjectural boundary contributed by Fargues–Scholze

For quasi-split G, FS expect Psi_G to be injective and its image to consist exactly of stable distributions. This roadmap proves inclusion into the very stable subalgebra and the inner-form image quotient; it proves neither injectivity nor equality with the whole stable center. Conjecture I.9.5 itself concerns rationality and independence of ell; it is a different conjecture.

Source: FS24, §I.9, p. 35, paragraph following Conjecture I.9.5. The statement about a whole stable center remains a conjecture here. Constancy on a regular packet also gives no identification of its common FS class with the original regular parameter. The plans use a fixed coefficient dictionary; they make no additional independence-of-ell claim.

## Existing library and roadmap inputs

The pins are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Each declaration below was checked in source at its pin. General finite Fourier inversion, finite expectation, Grothendieck groups and algebra-image quotients already exist; this roadmap supplies their mathematical specialization to the character spaces, once the genuine carriers and supplier theorems are available.

| Pinned declaration | What is reused |
| --- | --- |
| `mathlib:Finsupp` | Finite coefficient vectors on an existing index type, with exact nonzero support. |
| `mathlib:Finsupp.mem_support_iff` | Membership in Finsupp.support is equivalent to a nonzero coefficient; used in the atomic-support criterion. |
| `mathlib:Submodule` | Submodules over a semiring/module; used for annihilators and support-minimal vectors. |
| `mathlib:Subalgebra` | Subalgebras with inherited scalar algebra structure; used for very stable and image centers. |
| `mathlib:Finset.expect` | Finite arithmetic expectation; its empty-set value is zero, so nonemptiness of stable fibers is stated separately. |
| `mathlib:Fintype.expect_eq_sum_div_card` | In a characteristic-zero field, finite expectation is the sum divided by the cardinality. |
| `mathlib:AddChar.complexBasis` | Additive characters of a finite abelian group give a complex basis of all its complex-valued functions. |
| `mathlib:AddChar.wInner_cWeight_eq_boole` | Character orthogonality for the normalized counting inner product on a finite group. |
| `mathlib:AlgHom.range` | The image subalgebra of an algebra homomorphism. |
| `mathlib:AlgHom.rangeRestrict` | An algebra homomorphism with codomain restricted to its image. |
| `mathlib:AlgHom.rangeRestrict_surjective` | Surjectivity onto the image, not onto the original codomain. |
| `mathlib:Ideal.quotientKerEquivRange` | The algebra equivalence from a source modulo the ring-homomorphism kernel to its image subalgebra. |
| `mathlib:MeasureTheory.norm_integral_le_of_norm_le_const` | A finite-measure integral has norm at most a uniform norm bound times total measure. |
| `tauceti:TauCeti.ExactK0` | The Grothendieck group for a specified Quillen exact structure on an essentially small additive category with binary biproducts. |
| `tauceti:TauCeti.ExactK0.lift` | The additive map out of exact K_0 from a short-exact additive invariant; supplies the existing algebraic universal property, not a smooth-character theorem. |
| `tauceti:TauCeti.AbelianK0.homologyEulerChar` | The finite alternating sum of cohomology classes in the Grothendieck group of an abelian category. |

The reviewed base-roadmap coverage audit distinguishes generic centers from the missing stable-distribution theory. Current upstream ReductiveGroups, RootSystems, LieHighestWeight and SmoothRepresentationsOfLocalGroups were checked against the current Tau Ceti library, as well as the pins. The ordinary smooth category, normalized induction, Bernstein theory and Weyl formulas are existing roadmap work. They receive no replacement nodes here. Tau Ceti’s simple-module class basis for Artinian rings cannot be applied directly to the p-adic smooth category; the required irreducible-character basis is part of G1.

### Exact existing node imports

| Existing node | Use |
| --- | --- |
| `ExcursionOperatorsAndSpectralAction:ES1:spectral-center/spectral-to-geometric-center-map` | Hecke-compatible geometric spectral center; the center-order condition holds over Qbar_ell. |
| `ExcursionOperatorsAndSpectralAction:ES0:classical-center/map-to-the-classical-bernstein-center` | Restriction to the ordinary smooth Bernstein center with its coefficient dictionary. |
| `ExcursionOperatorsAndSpectralAction:ES7:parabolic/stratum-maps` | The actual spectral maps on basic strata and their common central action. |
| `ExcursionOperatorsAndSpectralAction:ES7:parabolic/normalised-induction-dictionary` | Normalized induction and ordinary dual Levi restriction. |
| `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-an-irreducible-smooth-representation` | Existing semisimple FS parameter class of an irreducible. |
| `ExcursionOperatorsAndSpectralAction:ES5/excursion-character-of-a-schur-object` | The invariant-coordinate scalars of the excursion action. |
| `LanglandsParameterStacks:LP2:semisimple-characters/character-bijection` | Equality of excursion characters determines the semisimple parameter conjugacy class. |
| `BunGAndNewtonStrata:BG0/g-isocrystals-and-B-of-G` | G-isocrystals and their sigma-conjugacy classes B(G). |
| `BunGAndNewtonStrata:BG0/sigma-centralizer-J-b` | The reductive sigma-centralizer and its basic inner-form identification. |
| `BunGAndNewtonStrata:BG1/basic-class` | Basicness as centrality of the Newton morphism. |
| `BunGAndNewtonStrata:BG1/admissible-pair` | The Kottwitz equality and Newton inequality defining B(G,mu). |
| `BunGAndNewtonStrata:BG1/classification-by-two-invariants` | Classification by Newton/Kottwitz invariants and the basic-class Kottwitz bijection. |
| `BunGAndNewtonStrata:BG1/algebraic-fundamental-group` | The integral coroot quotient and its Galois coinvariants, with torsion retained. |
| `BunGAndNewtonStrata:BG1/torus-norm-description` | The torus Kottwitz isomorphism and rational-average Newton description. |
| `HeckeStacksAndLocalShtukas:HS1/hecke-operator-via-relative-homology` | The normalized relative-homology Hecke operator on the genuine lisse category. |
| `HeckeStacksAndLocalShtukas:HS1/monoidality-of-hecke-operators` | Unit, tensor-composition and fusion coherences. |
| `HeckeStacksAndLocalShtukas:HS1/properties-and-weil-equivariance` | Dual-representation adjunctions and preservation of compact objects. |
| `HeckeStacksAndLocalShtukas:HS3/hecke-operators-between-strata` | The basic-source identification of the enriched left adjoint with the shriek extension. |
| `HeckeStacksAndLocalShtukas:HS3/admissibility-duality-and-adjunction` | The star-extension finite-length theorem and its stated smooth-duality comparison; the G2 shriek trace interface is still required. |
| `EndoscopicTransferAndUnitaryTraceComparison:ET.0/semisimple-conjugacy` | Stable and rational conjugacy on the strongly regular semisimple locus. |
| `EndoscopicTransferAndUnitaryTraceComparison:ET.0/rational-classes-in-stable-class` | The cohomological rational-class fiber, its finiteness and the nonarchimedean abelianized comparison. |
| `EndoscopicTransferAndUnitaryTraceComparison:ET.0/kottwitz-sign` | The inner-form sign, with the full positive-root sum equal to 2rho. |
| `EndoscopicTransferAndUnitaryTraceComparison:ET.1/orbital-integral` | Orbital integrals, compatible measures and the discriminant convention. |
| `EndoscopicTransferAndUnitaryTraceComparison:ET.1/kappa-and-stable-orbital-integrals` | Finite stable orbital sums with transported centralizer measures. |
| `EndoscopicTransferAndUnitaryTraceComparison:ET.1/matching-functions` | Matching modulo the unstable-function kernel and vanishing on irrelevant classes. |
| `EndoscopicTransferAndUnitaryTraceComparison:ET.3/local-transfer-existence` | Existence of inner-form transfer over every p-adic field of characteristic zero. |

The generic ES5 stratum embedding is its supplied enriched left adjoint; it is not an assertion that an unrestricted shriek functor exists on every lisse stratum. The Hecke trace targets here use the specific basic-stratum shriek functors of Hansen, with their existence and comparisons explicitly requested in G2.

### Requested existing-stage interfaces

**R1 — `SmoothRepresentationsOfLocalGroups:SR.3`.** Reuse the ordinary complex categorical Bernstein center, its scalar action on irreducibles, its action on finite-length objects and its compatibility with the Hecke-algebra corners from the existing upstream SmoothRepresentations Layers 1 and 3. The comparison with essentially compact invariant distributions, faithful distribution evaluation, the dual character action and inversion z^vee(f)=z(f^vee) with delta_1(z*f^vee)=z(f) are explicit additional obligations in G1. The current upstream roadmap is not cited as already containing that distribution comparison or the Arthur/stable analysis.

Consumers: `SC0/stable-center`, `SC0/very-stable-center`, `SC0/very-stability-criterion`, `SC3/fargues-scholze-stability`, `SC4/atomic-stable-character`, `SC4/atomic-scalar-rigidity`.

**R2 — `SmoothRepresentationsOfLocalGroups:SR.2`.** Export normalized finite-length parabolic induction and the Bernstein center restriction r_M, with z·i_M^G(Theta)=i_M^G(r_M(z)·Theta), and the adjoint constant-term pairing on test functions. Use the square-root-of-modulus convention in the exact ES7 normalized-induction node.

Consumers: `SC1/hecke-modulo-induction`, `SC3/cuspidal-pairing-limit`, `SC3/fargues-scholze-stability`, `SC5/kernel-inclusion`, `SC5/inner-form-center-levi`, `SC6/character-transfer`.

**R3 — `EndoscopicTransferAndUnitaryTraceComparison:ET.0`.** Build on ET.0/semisimple-conjugacy and ET.0/rational-classes-in-stable-class for the existing stable-conjugacy relation and finite nonempty rational-class fibers. Additionally export finite rational maximal-torus conjugacy types (HKW Lemma 3.1.1, pp. 12–13), finiteness of geometrically conjugate rational embeddings of each fixed torus, and matching of every elliptic inner-form element with an elliptic element in the quasi-split form. These finite representative choices are not a compactness assertion about whole conjugacy orbits.

Consumers: `SC2/uniform-weight-equidistribution`, `SC3/compact-stable-representatives`, `SC5/kernel-inclusion`.

**R4 — `EndoscopicTransferAndUnitaryTraceComparison:ET.1`.** Reuse the exact ET.1/orbital-integral, ET.1/kappa-and-stable-orbital-integrals and ET.1/matching-functions nodes for measures, stable sums and the matching-function quotient. Supply their inversion compatibility for U(G), invariance of the discriminant under stable conjugacy, and the normalized duality Theta(f*)=Trans_G(Theta)(f) for the G1 stable-character transfer. Use the exact ET.0/kottwitz-sign node for e(G). The deeper stable-character decomposition and separation theorem remain G1.

Consumers: `SC0/stable-center`, `SC0/very-stable-center`, `SC0/stability-algebra`, `SC0/very-stability-criterion`, `SC0/stable-tempered-faithfulness`, `SC3/cuspidal-pairing-limit`, `SC4/atomic-stable-character`, `SC6/character-transfer`, `SC6/matching-test-functions`.

**R8 — `BunGAndNewtonStrata:BG1`.** Build on the exact existing BG0 G-isocrystal/J_b nodes and BG1 basic-class, admissible-pair, classification-by-two-invariants, algebraic-fundamental-group and torus-norm-description nodes. Supply these further compatibilities: every basic b admits a dominant mu with b in B(G,mu); the identity basic class belongs to B(G,mu) exactly when V_mu is trivial on Z(Ghat)^Gamma; and the torus Kottwitz comparison identifies the stable-conjugacy invariant fiber with ker(X_*(T_g)_Gamma -> pi_1(G)_Gamma), retaining integral torsion. These are BG1 refinements, not exports of the BG0 layer. See Hansen §2.2, pp. 6–9, HKW §3.2, pp. 14–16, and Fu §§3.2 and 4.2, pp. 18–19 and 24–25.

Consumers: `SC1/self-hecke-character-operator`, `SC2/weight-averaging-kernel`, `SC5/kernel-inclusion`.

**R9 — `GeometricSatakeAndFusion:GS4:integral-dual-group`.** Export the pinned dual root datum, characteristic-zero highest-weight representations V_mu, finite torus weight spaces, their tensor/duality and central-character conventions, and the dictionary between their weights and those of the differentiated highest-weight module on the derived group. The general Weyl character formula is imported from the existing LieHighestWeight Layer 6; only its mu_m specialization is planned here. If the representation-to-Lie weight dictionary exceeds this stage, add it in the existing ReductiveGroups direction rather than re-plan a Weyl theory here.

Consumers: `SC1/self-hecke-character-operator`, `SC1/stable-inner-hecke-formula`, `SC2/rho-averaging-sequence`, `SC2/weight-averaging-kernel`.

**R10 — `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-6-the-weyl-character-dimension-and-kostant-formulas`.** Use the existing integral Weyl character/denominator and dimension formulas for the characteristic-zero highest-weight module of the derived dual Lie algebra. Through R9 identify its weight multiplicities with V_mu; specialize to mu=4m rho_dual and retain the actual dual root lattice. This roadmap owns neither a new Weyl formula nor the highest-weight classification.

Consumers: `SC2/rho-averaging-sequence`.

### Missing supplier and source contracts

These contracts are the ends of the prerequisite chains that cannot yet be expressed by existing stage IDs. Their contents remain with their designated suppliers. They are not invented node prerequisites and are not counted as closed mathematics.

**G1 — Harmonic-analysis continuation has no addressable layers yet.** The accepted PAPER-HANSEN-26 route 2 assigns this input to SmoothRepresentationsCharactersPartII, but no roadmap definition, packet nodes or reserved stage IDs exist at the design audit. Required: the comparison of the existing categorical Bernstein center with essentially compact invariant distributions, faithful evaluation and the convolution/inversion pairing; irreducible-character independence and the finite-length K_0 character dictionary; Kazhdan density/null-function criterion; Arthur decompositions I(G)=direct sum_M I(M)_cusp^W and D_temp(G)=direct sum_M D_ell(M)^W with stable versions; D_ind=kernel of elliptic restriction and injectivity on D_ell; center preservation of these splittings and Hansen Lemma 2.1; unstable functions exactly those annihilated by SD_temp; stable delta_1; stable projection P_st agreeing with the finite elliptic average (Varma Lemma 3.4.5 as cited in Hansen p. 11); Harish-Chandra discriminant-weighted local character and orbital-integral bounds, cuspidal Weyl integration and compact orbital supports; stable tempered inner transfer with elliptic isomorphism, irrelevant-Levi vanishing and induction/Weyl compatibility, normalized by e(G). Hansen §2.1 and §§2.3–2.4, pp. 4–6 and 10–13, identify the interface. These are imported obligations, not new nodes here, and no fictitious stage identifier is used.

Direct consumers: `SC0/stable-center`, `SC0/very-stable-center`, `SC0/stability-algebra`, `SC0/very-stability-criterion`, `SC0/stable-tempered-faithfulness`, `SC1/self-hecke-character-operator`, `SC1/hecke-modulo-induction`, `SC2/character-averaging`, `SC3/cuspidal-pairing-limit`, `SC3/fargues-scholze-stability`, `SC4/atomic-stable-character`, `SC5/kernel-inclusion`, `SC6/character-transfer`, `SC6/matching-test-functions`.

**G2 — HKW continuation and the shriek character interface need supplier layers.** The accepted PAPER-HANSEN-26 route 3 assigns the geometric/trace input to HeckeStacksAndLocalShtukasKottwitzPartII; there are no defined or reserved stage IDs. Required for all dominant mu and basic b: bounded finite-length cohomology and the HKW elliptic character sum for the actual shriek functors i_1^*T_(V_mu dual)i_(b!) and i_b^*T_(V_mu)i_(1!), with sign e(G)e(G_b); inv[b] from HKW Definition 3.2.2, pp. 14–15, uniqueness from Remark 3.2.5, p. 15, and supported-weight existence from Fu Lemma 4.2.7, p. 25. HKW Proposition 6.4.5 and Definition 6.4.6, pp. 61–62, state Mant with (i_b)_*, whereas Hansen uses (i_b)_!. The supplier must prove the adapted formula by the documented Verdier-duality/inversion and representation-duality comparisons, tracking sign, cohomological shifts and the reverse invariant. A global equality of star and shriek extensions is not an acceptable substitute. No refined LLC hypothesis from HKW Theorem 6.5.1 is imported into Theorem 6.5.2.

Direct consumers: `SC1/self-hecke-character-operator`, `SC1/hecke-modulo-induction`, `SC1/inner-hecke-character-operators`, `SC1/stable-inner-hecke-formula`, `SC2/weight-averaging-kernel`, `SC2/character-averaging`, `SC5/kernel-inclusion`.

**G3 — Regular-packet atomicity under the exact corollary hypotheses remains unverified.** Hansen Corollary 1.3, p. 2, uses full atomic stability of the Kaletha regular supercuspidal packet sum assuming only tame splitting and p not dividing |W_G|. The inspected FKS arXiv:2106.09120v2 §4.3, p. 20, also assumes characteristic zero and convergence of the exponential map on the positive-depth Lie algebra; a sufficient bound is p >= (2+e)n. Its §4.4 retains those assumptions and Theorem 4.4.4, p. 26, states stability/endoscopy, not arbitrary-coefficient support minimality. Read the 2023 version of record or a subsequent primary source to verify whether the extra convergence condition was removed, and supply the atomicity argument under exactly Hansen’s hypotheses. Publisher full text was not obtained in this run. This is an unresolved source/supplier check, not a finding that the published corollary is false. The conditional implication from an atomic packet sum is already fully planned, and the main stability and inner-form theorems are independent of this gap.

Direct consumers: `SC4/regular-supercuspidal-packet`.

The two accepted continuation routes must receive real stage or node IDs before G1/G2 can be discharged. Existing `SmoothRepresentationsOfLocalGroupsPartII` concerns unitary/Fell topology and does not substitute for `SmoothRepresentationsCharactersPartII`. General harmonic analysis and the HKW trace theorem are therefore not silently reassigned to this continuation.

## Layer order and target specifications

Each local target ID below is prefixed by `ExcursionOperatorsAndSpectralActionPartII:` in the packet. The common conventions above apply to every target. The proposed declaration names fix the intended API; the suggested Lean file states only the parts whose real carriers exist at the pins.

| Layer | Targets | Main prerequisite layers |
| --- | --- | --- |
| SC0 — Stable central distributions | 5 | `SmoothRepresentationsOfLocalGroups:SR.3`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1` |
| SC1 — Hecke operators on character spaces | 6 | `HeckeStacksAndLocalShtukas:HS1`, `HeckeStacksAndLocalShtukas:HS3`, `BunGAndNewtonStrata:BG0`, `BunGAndNewtonStrata:BG1`, `GeometricSatakeAndFusion:GS4:integral-dual-group`, `ExcursionOperatorsAndSpectralAction:ES1:spectral-center`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic`, `ExcursionOperatorsAndSpectralAction:ES0:classical-center`, `SmoothRepresentationsOfLocalGroups:SR.2`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0` |
| SC2 — Quantitative stable averaging | 5 | `BunGAndNewtonStrata:BG1`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0`, `GeometricSatakeAndFusion:GS4:integral-dual-group`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-6-the-weyl-character-dimension-and-kostant-formulas`, `SC1` |
| SC3 — Stability of the FS center | 3 | `EndoscopicTransferAndUnitaryTraceComparison:ET.0`, `SC2`, `SmoothRepresentationsOfLocalGroups:SR.2`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1`, `SC0`, `SC1`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic`, `ExcursionOperatorsAndSpectralAction:ES1:spectral-center`, `SmoothRepresentationsOfLocalGroups:SR.3` |
| SC4 — Atomic characters and packet parameters | 4 | `SmoothRepresentationsOfLocalGroups:SR.3`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1`, `SC0`, `SC3`, `ExcursionOperatorsAndSpectralAction:ES5`, `LanglandsParameterStacks:LP2:semisimple-characters` |
| SC5 — Centers of extended pure inner forms | 3 | `SC0`, `SC3`, `SC1`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic`, `BunGAndNewtonStrata:BG0`, `BunGAndNewtonStrata:BG1`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0`, `SmoothRepresentationsOfLocalGroups:SR.2`, `ExcursionOperatorsAndSpectralAction:ES1:spectral-center` |
| SC6 — Stable transfer compatibility | 2 | `SC3`, `SC5`, `SC1`, `SmoothRepresentationsOfLocalGroups:SR.2`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1`, `EndoscopicTransferAndUnitaryTraceComparison:ET.3`, `SC0` |

## SC0. Stable central distributions

Define the stable central submodule and very stable central subalgebra; prove their action relation, the stable-character criterion for very stability and faithfulness on stable tempered virtual characters. Import stable delta_1 and harmonic-analysis separation through G1.

### Stable central distributions

**Target `SC0/stable-center` (definition).** Define Z_st(G) as the complex submodule of Z(G) consisting of z with z(f)=0 for every f in U(G), where z(f) is distribution evaluation, not convolution as a test function.

Proof or construction:

1. Import the categorical Bernstein center from SR.3 and the unstable test-function space from ET.1. G1 must supply the essentially compact invariant-distribution realization, its pairing and the character quotient; the current upstream categorical-center plan alone does not provide this comparison.
2. Take the annihilator of U(G) inside Z(G); linearity of evaluation gives the submodule structure.

**Check.** The defining quantifier ranges over all unstable test functions; the ambient object is a submodule, with no claimed closure under multiplication.

Direct prerequisites: `SmoothRepresentationsOfLocalGroups:SR.3`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1/orbital-integral`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1/kappa-and-stable-orbital-integrals`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1/matching-functions`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1`, `mathlib:Submodule`.

Sources: H26, §1.1, pp. 1–2 — Introduces distributional stability and the linear space of stable central elements.

API:

| Name | Role | Statement |
| --- | --- | --- |
| `StableCenter.mem_iff` | characterisation | z lies in Z_st(G) if and only if every f in U(G) satisfies z(f)=0. |
| `StableCenter.toCenter` | coercion | The inclusion Z_st(G) -> Z(G) is complex linear and injective. |
| `StableCenter.zero_add_smul` | structure | Zero, sums and all complex scalar multiples of stable central distributions are stable. |
| `StableCenter.eval_unstable` | simp | Evaluation of any stable central element on an unstable test function is zero. |

Definition tests:

- **StableCenter.torus** (compatibility): For a torus T, stable and rational conjugacy agree, U(T)=0 and Z_st(T)=Z(T).
- **StableCenter.zero** (degenerate): The zero distribution belongs to Z_st(G), even when U(G) is nonzero.
- **StableCenter.unit** (characterisation): The convolution identity delta_1 belongs to Z_st(G), using the imported stable-delta_1 theorem.
- **StableCenter.annihilator_fixture** (non-example): For the pairing on C^2 and U=span{(1,-1)}, the functional (a,b) annihilates U exactly when a=b; (1,0) fails. This checks the annihilator operation, without representing C^2 as a p-adic character space.

Uses: SC0/stability-algebra — The stable annihilator receives the very stable action.; Hansen Theorem 1.1, p. 2 — Its weaker distributional conclusion follows from very stability.

Atlas planet: **Stable Bernstein center**.

### Very stable central distributions

**Target `SC0/very-stable-center` (definition).** Define Z_vst(G)={z in Z(G) | for every f in U(G), z*f belongs to U(G)} as a complex subalgebra of Z(G). The stability of the identity distribution delta_1 is an imported harmonic-analysis theorem, not part of this definition.

Proof or construction:

1. Use the SR.3 categorical Bernstein center, its convolution realization requested through G1, and the ET.1 unstable subspace.
2. The unit, addition, scalar multiplication and composition preserve U(G); convolution multiplication agrees with composition.

**Check.** Convolution has codomain H(G) by essential compactness; the condition is preservation of a subspace.

Direct prerequisites: `SmoothRepresentationsOfLocalGroups:SR.3`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1/orbital-integral`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1/kappa-and-stable-orbital-integrals`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1/matching-functions`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1`, `mathlib:Subalgebra`.

Sources: H26, §1.1, pp. 1–2 — Defines the convolution-preservation condition and its algebra structure.

API:

| Name | Role | Statement |
| --- | --- | --- |
| `VeryStableCenter.mem_iff` | characterisation | z is very stable if and only if z*f is unstable for every unstable f. |
| `VeryStableCenter.toCenter` | coercion | The inclusion into Z(G) is an injective complex algebra map. |
| `VeryStableCenter.map_unstable` | functoriality | Convolution by z induces a linear endomorphism of U(G). |
| `VeryStableCenter.one_mul` | structure | The identity and products of very stable elements are very stable. |

Definition tests:

- **VeryStableCenter.torus** (compatibility): Every central distribution of a torus is very stable since U(T)=0.
- **VeryStableCenter.zero_one** (degenerate): Both zero convolution and identity convolution preserve U(G).
- **VeryStableCenter.diagonal_fixture** (non-example): On C^2 with U=span{(1,-1)}, diagonal convolution diag(a,b) preserves U exactly when a=b; diag(1,0) fails, despite sending zero to U.

Uses: SC0/very-stability-criterion — Converts the main target into preservation of stable tempered characters.; SC3/fargues-scholze-stability — The geometric central map takes values in this subalgebra.

Atlas planet: **Very stable Bernstein center**.

### Relations between the two stable centers

**Target `SC0/stability-algebra` (theorem).** Z_vst(G) embeds in Z_st(G), and Z_st(G) is a module over Z_vst(G) under convolution. In particular the convolution of a very stable element with a stable element is stable.

Proof or construction:

1. For z very stable and f unstable, inversion gives another unstable function f^vee(g)=f(g^(-1)). Then z*f^vee is unstable; the G1 stable-delta_1 theorem and the usual distribution pairing give delta_1(z*f^vee)=z(f)=0.
2. Put z^vee(f)=z(f^vee). Inversion preserves U(G) and intertwines central convolution, so z^vee is very stable. For stable y and unstable f, (y*z)(f)=y(z^vee*f)=0. These identities follow by unfolding convolution on the unimodular group.

**Check.** Use stable delta_1 and the inversion in the usual distribution pairing explicitly; do not infer that all products of stable elements are stable.

Direct prerequisites: `SC0/stable-center`, `SC0/very-stable-center`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1/orbital-integral`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1/kappa-and-stable-orbital-integrals`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1/matching-functions`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1`.

Sources: H26, §1.1, pp. 1–2 — Relates the annihilator definition to preservation under convolution.

### Character criterion for very stability

**Target `SC0/very-stability-criterion` (theorem).** For z in Z(G), the following are equivalent: z belongs to Z_vst(G); z·SD(G) is contained in SD(G); z·SD_temp(G) is contained in SD_temp(G). Here (z·Theta)(f)=Theta(z*f).

Proof or construction:

1. The G1 harmonic-analysis interface identifies unstable functions with the simultaneous annihilator of stable tempered virtual characters and identifies stable characters with their stable orbital behavior.
2. Preservation of U implies preservation of its character annihilators, since center action preserves D and D_temp.
3. If stable tempered characters stay stable, evaluate them on z*f for unstable f and apply the same annihilator criterion to z*f.

**Check.** The third condition suffices without an LLC classification; center preservation of tempered support is supplied independently of stability.

Direct prerequisites: `SC0/very-stable-center`, `SmoothRepresentationsOfLocalGroups:SR.3`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1/orbital-integral`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1/kappa-and-stable-orbital-integrals`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1/matching-functions`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1`.

Sources: H26, Lemma 2.2, p. 6 — Gives the three equivalent formulations of very stability.

Atlas planet: **Very stability criterion**.

### Stable tempered characters detect the very stable center

**Target `SC0/stable-tempered-faithfulness` (theorem).** The action of Z_vst(G) on SD_temp(G) is faithful: a very stable z annihilating every stable tempered virtual character is zero.

Proof or construction:

1. The G1 unstable-function criterion implies z*f lies in U(G) for every f in H(G), because every stable tempered character vanishes on it.
2. In particular z*f^vee is unstable for each f. Apply the G1 stable delta_1 theorem and delta_1(z*f^vee)=z(f) to get z(f)=0 for every f; faithful distribution evaluation gives z=0.

**Check.** The theorem is used for Z_FS only after SC3 proves its very stability.

Direct prerequisites: `SC0/very-stable-center`, `SC0/very-stability-criterion`, `SC0/stability-algebra`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1/orbital-integral`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1/kappa-and-stable-orbital-integrals`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1/matching-functions`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1`.

Sources: H26, Lemma 2.3, p. 6 — Proves faithfulness without assuming a complete description of tempered packets.

Atlas planet: **Stable tempered faithfulness**.

## SC1. Hecke operators on character spaces

Construct Euler-class Hecke operators on finite virtual character spaces using shriek basic-stratum extensions. Prove commutation with the FS central action, stable scalar action modulo induced characters, both directed inner-form operators, their central intertwining and their e(G)e(G_b) elliptic formula. G2 supplies all finite-length and extension-convention comparisons.

### Hecke operators on virtual characters

**Target `SC1/self-hecke-character-operator` (construction).** For dominant mu with 1 in B(G,mu), set F_mu=i_1^* T_(V_mu dual) i_(1!). Its bounded finite-length cohomology defines an Euler-class map on K_0 of finite-length smooth representations. After iota and complex linearization obtain T_mu:D(G)->D(G), with T_mu([A])=sum_j (-1)^j [H^j F_mu(A)]. The condition on mu is equivalently trivial action of Z(Ghat)^Gamma on V_mu.

Additional hypotheses: Use the normalized Hecke family, basic stratum adjunctions, and the G2 adapted shriek finite-length theorem.

Proof or construction:

1. Import the normalized Hecke operator, its unit and duality from the exact HS1 nodes, and basic-stratum shriek extensions from HS3/hecke-operators-between-strata. HS3/admissibility-duality-and-adjunction supplies bounded finite length in its star convention; G2 supplies the adapted shriek statement. Do not replace i_! by i_*.
2. The Euler relation sends distinguished triangles to sums, using the existing Grothendieck-group universal property.
3. Identify the complexified finite-length Grothendieck group with the finite span of irreducible characters through the G1 character independence theorem.

**Check.** No t-exactness is required; negative degrees contribute with their Euler signs.

Direct prerequisites: `HeckeStacksAndLocalShtukas:HS1/hecke-operator-via-relative-homology`, `HeckeStacksAndLocalShtukas:HS1/monoidality-of-hecke-operators`, `HeckeStacksAndLocalShtukas:HS1/properties-and-weil-equivariance`, `HeckeStacksAndLocalShtukas:HS3/hecke-operators-between-strata`, `HeckeStacksAndLocalShtukas:HS3/admissibility-duality-and-adjunction`, `BunGAndNewtonStrata:BG0/g-isocrystals-and-B-of-G`, `BunGAndNewtonStrata:BG1/admissible-pair`, `BunGAndNewtonStrata:BG1`, `GeometricSatakeAndFusion:GS4:integral-dual-group`, `tauceti:TauCeti.ExactK0`, `tauceti:TauCeti.ExactK0.lift`, `tauceti:TauCeti.AbelianK0.homologyEulerChar`.

Sources: H26, §2.2, pp. 6–7 — Constructs the decategorified Hecke map from shriek extensions.; HKW22, Proposition 6.4.5 and Definition 6.4.6, pp. 61–62 — Supplies finite-length input in its stated Mant convention; the shriek adaptation remains the explicit G2 supplier obligation.

API:

| Name | Role | Statement |
| --- | --- | --- |
| `HeckeCharacterOperator.apply_class` | characterisation | T_mu of the character class of A is the alternating sum of the finite-length cohomology classes of F_mu(A). |
| `HeckeCharacterOperator.map_add_smul` | structure | T_mu is complex linear on D(G). |
| `HeckeCharacterOperator.triangle` | relation | A distinguished triangle of finite-length inputs gives the corresponding Euler sum after F_mu. |
| `HeckeCharacterOperator.zero_weight` | simp | T_0 is the identity, using the unit Hecke kernel and i_1^* i_(1!)=id. |
| `HeckeCharacterOperator.k0_agreement` | compatibility | Before iota and complexification the map is the additive map supplied by ExactK0.lift; its finite Euler sum agrees with AbelianK0.homologyEulerChar on bounded complexes. |

Definition tests:

- **HeckeCharacterOperator.unit** (computation): For mu=0, T_0(Theta)=Theta.
- **HeckeCharacterOperator.zero_object** (degenerate): The zero representation and zero virtual character map to zero.
- **HeckeCharacterOperator.shift** (computation): For any input complex A and integer n, the Euler character of F_mu(A[n]) is (-1)^n times that of F_mu(A).
- **HeckeCharacterOperator.additivity** (compatibility): For A direct-sum B, its output Euler character is the sum of the two outputs, with no assumption that F_mu has only degree-zero cohomology.

Uses: Hansen Lemma 2.4 and Proposition 2.5, pp. 7–8 — Supplies the commuting operators and scalar action modulo induction.; SC2/character-averaging — Normalized operators converge on elliptic character restrictions.

Atlas planet: **Hecke character operators**.

### Hecke and excursion commutation on characters

**Target `SC1/hecke-central-commutation` (lemma).** For a in Z_spec(G), z=Psi_G(a), and Theta in D(G), T_mu(z·Theta)=z·T_mu(Theta) for each mu allowed in the self-Hecke construction.

Proof or construction:

1. Use the Hecke-compatible geometric center map and its restriction along the chosen basic stratum embedding.
2. Take cohomology Euler classes of the commuting natural transformations; then transport coefficients and complex-linearize.

**Check.** The result is restricted to z in the FS image; no commutation with arbitrary Bernstein central elements is asserted.

Direct prerequisites: `SC1/self-hecke-character-operator`, `ExcursionOperatorsAndSpectralAction:ES1:spectral-center/spectral-to-geometric-center-map`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic/stratum-maps`, `ExcursionOperatorsAndSpectralAction:ES0:classical-center/map-to-the-classical-bernstein-center`.

Sources: H26, Lemma 2.4, p. 7 — Decategorifies Hecke compatibility of the excursion action.

### Stable Hecke action modulo induced characters

**Target `SC1/hecke-modulo-induction` (comparison).** Let D_ind(G) be the span of characters induced from proper Levi subgroups, equivalently the kernel of elliptic restriction by the G1 theorem. T_mu preserves D_ind(G). For stable Theta in SD(G), T_mu(Theta) - (dim V_mu)Theta belongs to D_ind(G).

Proof or construction:

1. The G2 shriek HKW formula shows that T_mu(Theta) has zero elliptic restriction whenever Theta does.
2. For stable Theta the invariant fibers contain exactly one rational conjugacy class for each occurring weight; replace all character values by Theta(g) and sum weight multiplicities to dim V_mu.
3. Apply the G1 elliptic-kernel theorem to both conclusions.
4. The geometric trace and invariant-fiber assertions in this step are precisely contract G2; do not treat them as supplied by finite-dimensional Fourier algebra or by the generic HS3 amplitude statement alone.

**Check.** The correction is an induced virtual character; it is not claimed to be tempered.

Direct prerequisites: `SC1/self-hecke-character-operator`, `SmoothRepresentationsOfLocalGroups:SR.2`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/semisimple-conjugacy`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/rational-classes-in-stable-class`.

Sources: H26, Proposition 2.5, pp. 7–8 — Identifies the stable scalar action in the quotient by induced characters.

### Hecke operators between basic inner forms

**Target `SC1/inner-hecke-character-operators` (construction).** For any dominant mu and basic b in B(G,mu), let G_b be the associated extended pure inner form. The functors i_1^* T_(V_mu dual) i_(b!) and i_b^* T_(V_mu) i_(1!) yield complex-linear Euler maps T_mu:D(G_b)->D(G) and T_mu^rev:D(G)->D(G_b). The superscript rev names the reverse geometric operator and does not mean a linear transpose.

Additional hypotheses: The G2 interface supplies bounded finite-length cohomology for both shriek functors for all dominant mu, without a minuscule assumption.

Proof or construction:

1. Apply the same Euler construction as the self-Hecke case to each pair of basic strata.
2. Use dual V_mu only in the forward direction; fix weights and signs in the reverse character formula by the G2 duality comparison.

**Check.** For b=1 the forward operator is the self-Hecke operator; no global identification of star and shriek extensions is used.

Direct prerequisites: `SC1/self-hecke-character-operator`, `HeckeStacksAndLocalShtukas:HS1/hecke-operator-via-relative-homology`, `HeckeStacksAndLocalShtukas:HS1/monoidality-of-hecke-operators`, `HeckeStacksAndLocalShtukas:HS1/properties-and-weil-equivariance`, `HeckeStacksAndLocalShtukas:HS3/hecke-operators-between-strata`, `HeckeStacksAndLocalShtukas:HS3/admissibility-duality-and-adjunction`, `BunGAndNewtonStrata:BG0/sigma-centralizer-J-b`, `BunGAndNewtonStrata:BG1/basic-class`, `BunGAndNewtonStrata:BG1/admissible-pair`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic/stratum-maps`.

Sources: H26, §2.2, p. 9 — Introduces the two directed character operators for basic inner forms.

API:

| Name | Role | Statement |
| --- | --- | --- |
| `InnerHecke.forward_apply` | characterisation | The forward operator is the Euler class of i_1^* T_(V_mu dual) i_(b!). |
| `InnerHecke.reverse_apply` | characterisation | The reverse operator is the Euler class of i_b^* T_(V_mu) i_(1!). |
| `InnerHecke.linear` | structure | Both directed maps preserve complex linear combinations. |
| `InnerHecke.basic_one` | compatibility | For b=1, forward agrees with HeckeCharacterOperator for the same mu and normalization. |
| `InnerHecke.euler_shift` | relation | A shift by n in either input multiplies its Euler output by (-1)^n. |

Definition tests:

- **InnerHecke.trivial_modification** (computation): For mu=0 and b=1 both maps are the identity.
- **InnerHecke.zero_input** (degenerate): The zero character has zero forward and reverse image.
- **InnerHecke.basic_one_agreement** (compatibility): For b=1 the forward formula uses V_mu dual and agrees with the self-Hecke formula, including all cohomological signs.
- **InnerHecke.dual_convention** (non-example): For GL_1 and a nonzero cocharacter mu, the forward and reverse kernels have opposite cocharacter labels; the API must not identify their labels merely because the dimensions are both one.

Uses: Hansen Proposition 2.7, p. 9 — Gives the two central commutation identities and stable trace scalars.; SC5/kernel-inclusion and SC6/character-transfer — Detects nonzero operators on the quasi-split form and compares transfer.

Atlas planet: **Inner form Hecke operators**.

### Central commutation across inner forms

**Target `SC1/inner-hecke-central-commutation` (theorem).** For a in the common spectral center, z=Psi_G(a), z_b=Psi_(G_b)(a), T_mu(z_b·Theta)=z·T_mu(Theta) and T_mu^rev(z·Xi)=z_b·T_mu^rev(Xi), for all Theta in D(G_b) and Xi in D(G).

Proof or construction:

1. Restrict the Hecke-compatible natural central transformation to the two basic strata, using the basic case of the stratum-center comparison.
2. Decategorify the two natural commutation squares using the inner Hecke Euler maps.

**Check.** Both directions use the same spectral element and the basic inner-form identification of spectral centers.

Direct prerequisites: `SC1/inner-hecke-character-operators`, `ExcursionOperatorsAndSpectralAction:ES1:spectral-center/spectral-to-geometric-center-map`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic/stratum-maps`.

Sources: H26, Proposition 2.7(i), p. 9 — Uses the same spectral action to intertwine the central operators on the two forms.

Atlas planet: **Inner form central commutation**.

### Stable inner form Hecke formula

**Target `SC1/stable-inner-hecke-formula` (theorem).** For matching strongly regular elliptic elements g in G(E), g_b in G_b(E), and stable Theta in SD(G_b), T_mu(Theta)(g)=e(G)e(G_b)(dim V_mu)Theta(g_b). For stable Xi in SD(G), T_mu^rev(Xi)(g_b)=e(G)e(G_b)(dim V_mu)Xi(g). The signs e are the Kottwitz signs, including e(G*)=1 for a quasi-split form.

Proof or construction:

1. Use G2: the adapted shriek HKW elliptic formula is the sum over pairs (lambda,[g_b]) with inv[b](g,g_b)=the coinvariant image of lambda, weighted by dim V_mu[lambda], multiplied by e(G)e(G_b).
2. HKW Remark 3.2.5 gives uniqueness and Fu Lemma 4.2.7 gives existence for each occurring weight. Stability makes the character value independent of [g_b].
3. For the reverse operator use the reversed invariant, weight duality, and the same sign product; sum all weight dimensions.

**Check.** All dominant weights and all relevant basic b are allowed; the statement is confined to matching elliptic elements.

Direct prerequisites: `SC1/inner-hecke-character-operators`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/semisimple-conjugacy`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/rational-classes-in-stable-class`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/kottwitz-sign`, `GeometricSatakeAndFusion:GS4:integral-dual-group`.

Sources: H26, Proposition 2.7(ii), p. 9 — Computes the scalar on stable elliptic restrictions in both directions.; HKW22, Theorem 6.5.2, pp. 65–66; Equation (3.3.3), §3.3, p. 18 — Supplies the elliptic character formula and Kottwitz sign conversion, subject to the documented extension-convention comparison.; FU25, Lemma 4.2.7, p. 25 — Provides existence of the invariant fibers used when collapsing the sum.

Atlas planet: **Stable inner form Hecke formula**.

## SC2. Quantitative stable averaging

Construct the finite elliptic stable average, the dual-root sequence mu_m=4m rho_dual and normalized weight multiplicity kernels. Use the existing Weyl formula and finite Fourier basis to prove a group-uniform O(1/m) kernel error, then the discriminant-weighted compact-uniform character averaging estimate.

### Finite stable averaging on elliptic classes

**Target `SC2/elliptic-stable-average` (construction).** For strongly regular elliptic g, let R_g be the finite nonempty set of G(E)-conjugacy classes in the stable class of g. For a conjugation-invariant function h on the elliptic locus define Av(h)(g)=|R_g|^(-1) sum_[gprime] in R_g h(gprime). This is the finite arithmetic mean, not a measure-weighted mean. For a virtual character the notation Av(Theta) denotes this function only; it is not by definition a virtual character.

Proof or construction:

1. ET.0 supplies finite rational class fibers; membership of g makes R_g nonempty.
2. Use Mathlib finite expectation on the finite class set; conjugation invariance makes representatives immaterial.

**Check.** The function is stable on the elliptic locus, linear in h and idempotent; agreement with a global stable projection is a separate G1 theorem.

Direct prerequisites: `EndoscopicTransferAndUnitaryTraceComparison:ET.0/semisimple-conjugacy`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/rational-classes-in-stable-class`, `mathlib:Finset.expect`, `mathlib:Fintype.expect_eq_sum_div_card`.

Sources: H26, §2.2, p. 8 — Defines the finite average needed for elliptic convergence.

API:

| Name | Role | Statement |
| --- | --- | --- |
| `EllipticAverage.apply` | characterisation | Av(h)(g) equals the finite expectation of h over R_g. |
| `EllipticAverage.linear` | structure | Av is complex linear on conjugation-invariant elliptic functions. |
| `EllipticAverage.stable` | relation | Stably conjugate elliptic inputs have the same average. |
| `EllipticAverage.idempotent` | relation | Av(Av(h))=Av(h). |
| `EllipticAverage.finset_expect` | compatibility | For any enumeration of R_g by a nonempty finite type, the value equals Mathlib finite expectation, independently of the enumeration. |

Definition tests:

- **EllipticAverage.two_classes** (computation): If R_g has two classes with h-values 2 and 6, Av(h)(g)=4.
- **EllipticAverage.singleton** (compatibility): If R_g is a singleton, Av(h)(g)=h(g); in particular this holds for a torus.
- **EllipticAverage.zero** (degenerate): The average of the zero function is zero.
- **EllipticAverage.nonuniform** (non-example): For the two values 2 and 6, the weighted sum with weights 1/4 and 3/4 equals 5 and is not the stable average 4.

Uses: Hansen Lemma 2.6, pp. 8–9 — Is the pointwise limit of normalized Hecke character values.; SC3/cuspidal-pairing-limit — The G1 stable-projection theorem agrees with this average on the elliptic locus.

Atlas planet: **Elliptic stable averaging**.

### The dual-root averaging sequence

**Target `SC2/rho-averaging-sequence` (definition).** For m a nonnegative integer define mu_m=4m rho_dual=2m sum_(alpha positive root of Ghat) alpha in X*(That)=X_*(T). Write N=the number of positive roots of Ghat and d_m=dim V_(mu_m)=(4m+1)^N. Then mu_m is dominant, in the dual root lattice, trivial on Z(Ghat)^Gamma, and V_(mu_m) is self-dual. Averaging estimates use m>=1.

Proof or construction:

1. Use the based dual root datum from GS4; writing 4m rho_dual as 2m times the positive-root sum places it in the dual root lattice even when rho_dual is not a character.
2. Differentiate the characteristic-zero algebraic representation on the derived group, identifying its highest weight and torus weight multiplicities with the LieHighestWeight Layer 6 input; the central character is fixed by mu_m. Specialize that imported integral Weyl character formula as in Fu Lemma 3.1.2 to obtain the product of symmetric root strings. Evaluate at one for d_m and invert weights for self-duality. The representation/weight dictionary is part of request R9, not a replacement Weyl theorem.

**Check.** Use roots of the dual group, hence coroots of G; the published Hansen wording is corrected in source issue E2.

Direct prerequisites: `GeometricSatakeAndFusion:GS4:integral-dual-group`, `tauceti:TauCetiRoadmap/RepresentationTheory/LieHighestWeight#layer-6-the-weyl-character-dimension-and-kostant-formulas`.

Sources: H26, §2.2, p. 8; corrected positive-root convention — Selects the highest weights used by Fu averaging.; FU25, Lemmas 3.1.2–3.1.3, pp. 18–19 — Gives the formal-character product, exact dimension and self-duality with the dual-root convention.

API:

| Name | Role | Statement |
| --- | --- | --- |
| `RhoSequence.value` | characterisation | mu_m is 2m times the sum of positive roots of Ghat, viewed as a cocharacter of G. |
| `RhoSequence.zero` | simp | mu_0=0 and d_0=1. |
| `RhoSequence.central_trivial` | compatibility | V_(mu_m) has trivial action of Z(Ghat)^Gamma, hence 1 belongs to B(G,mu_m). |
| `RhoSequence.character` | data | The formal character is product_(alpha positive root of Ghat) sum_(j=-2m)^(2m) e^(j alpha), with each root string having length 4m+1. |
| `RhoSequence.dimension` | simp | d_m=(4m+1)^N is positive. |
| `RhoSequence.self_dual` | equivalence | There exists a Ghat-equivariant isomorphism from V_(mu_m) to its contragredient; no canonical choice of invariant pairing is claimed. |

Definition tests:

- **RhoSequence.torus** (degenerate): With no roots, mu_m=0 and d_m=1 for every m.
- **RhoSequence.A1** (computation): In dual type A1 with positive root alpha, mu_m=2m alpha and d_m=4m+1.
- **RhoSequence.B2_coroots** (non-example): For G of type B2 with positive roots e1-e2,e2,e1,e1+e2, the positive coroot sum is 4e1+2e2, so mu_m=8m e1+4m e2. Using the G-root sum 3e1+e2 would give a different, incorrect sequence.
- **RhoSequence.initial** (compatibility): At m=0 the representation is the one-dimensional trivial representation and the Hecke operator is the identity.

Uses: Fu Lemma 3.1.2 and Proposition 3.3.1, pp. 18–21 — The product formula controls the dimension and nontrivial Fourier coefficients.; Hansen Lemma 2.6, pp. 8–9 — The central-trivial weights define self-Hecke averaging operators.

Atlas planet: **Dual root averaging sequence**.

### Normalized weight multiplicity kernel

**Target `SC2/weight-averaging-kernel` (construction).** For m>=1 and gprime representing a class in R_g, define C_m(g,gprime)=d_m^(-1) sum_(lambda with coinvariant image inv(g,gprime)) dim V_(mu_m)[lambda]. This is a finitely supported weight sum, and each C_m is a nonnegative real rational number, with sum_(R_g) C_m(g,gprime)=1. Equivalently it is the pushforward to H_g=ker(X_*(T_g)_Gamma -> pi_1(G)_Gamma) of the normalized weight multiplicity distribution, transported along the invariant bijection R_g≃H_g.

Proof or construction:

1. Import integral pi_1, the torus Kottwitz description and basic-class classification from their exact BG1 nodes. Request through R8 their compatibility with the stable-conjugacy invariant. Then use G2 uniqueness and existence of invariant fibers and Fu Lemmas 3.2.1–3.2.3 for the finite H_g quotient of the dual root lattice.
2. Sum nonnegative integer weight dimensions over each fiber and divide by positive d_m.
3. Each occurring weight has exactly one class, so the mass is one.
4. The geometric trace and invariant-fiber assertions in this step are precisely contract G2; do not treat them as supplied by finite-dimensional Fourier algebra or by the generic HS3 amplitude statement alone.

**Check.** The target is the kernel H_g, rather than the full cocharacter coinvariant group.

Direct prerequisites: `SC2/rho-averaging-sequence`, `SC2/elliptic-stable-average`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/semisimple-conjugacy`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/rational-classes-in-stable-class`, `GeometricSatakeAndFusion:GS4:integral-dual-group`, `BunGAndNewtonStrata:BG1/algebraic-fundamental-group`, `BunGAndNewtonStrata:BG1/torus-norm-description`, `BunGAndNewtonStrata:BG1/classification-by-two-invariants`, `BunGAndNewtonStrata:BG1`.

Sources: H26, Lemma 2.6 proof, p. 8 — Rewrites the normalized elliptic Hecke formula as a probability kernel.; FU25, Lemmas 3.2.1–3.2.3, pp. 19–20; Lemmas 4.2.6–4.2.7, pp. 24–25 — Identifies the finite quotient receiving weights and the invariant fibers.

API:

| Name | Role | Statement |
| --- | --- | --- |
| `WeightKernel.apply` | characterisation | Each coefficient is the sum of weight multiplicities in its invariant fiber divided by d_m. |
| `WeightKernel.nonnegative` | relation | Every coefficient is nonnegative. |
| `WeightKernel.total_mass` | relation | The coefficients over all classes in R_g sum to one. |
| `WeightKernel.pushforward` | compatibility | Via R_g≃H_g this is the pushforward of the normalized finite weight multiset; reordering or changing a representative leaves it unchanged. |
| `WeightKernel.hecke_evaluation` | characterisation | For any Theta, normalized self-Hecke elliptic evaluation is the sum of C_m(g,gprime)Theta(gprime). |

Definition tests:

- **WeightKernel.torus** (degenerate): For a torus, H_g=0, R_g is a singleton and its coefficient is one.
- **WeightKernel.A1_mod2** (computation): In dual type A1 with root lattice Z alpha and quotient Z/2 mapping alpha to 1, weights j alpha for -2m<=j<=2m have multiplicity one. The two masses are (2m+1)/(4m+1) and 2m/(4m+1), rather than exactly 1/2.
- **WeightKernel.A1_m1** (computation): For m=1 in that quotient, the masses are 3/5 and 2/5 and their sum is one.
- **WeightKernel.center_kernel** (non-example): For G=GL_1 the full cocharacter coinvariant group is Z but H_g=ker(Z->Z)=0. A construction averaging over all of Z fails both finiteness and the singleton coefficient test.

Uses: Hansen Lemma 2.6 proof, p. 8 — Separates the character values from the finite weight distribution.; SC2/uniform-weight-equidistribution — Finite Fourier inversion is applied to this distribution.

Atlas planet: **Weight averaging kernel**.

### Uniform quantitative weight equidistribution

**Target `SC2/uniform-weight-equidistribution` (theorem).** There exists C_G>=0 such that for every strongly regular elliptic g and m>=1, sum_(gprime in R_g) |C_m(g,gprime)-1/|R_g|| <= C_G/m. If N=0 then H_g and R_g are singletons and the left side is zero.

Proof or construction:

1. Fu identifies H_g as a finite quotient of the dual root lattice; a nontrivial character is nontrivial on some positive dual root.
2. Evaluate the product formula: the corresponding geometric-series factor is bounded independently of m, while the other N-1 factors are at most 4m+1 in absolute value. Divide by (4m+1)^N.
3. Apply finite abelian Fourier inversion/orthogonality from the pinned Mathlib declarations to bound the error for every h in H_g.
4. ET.0/HKW Lemma 3.1.1 supplies finitely many rational maximal-torus conjugacy types. Take the maximum of the finitely many constants and cardinalities; enlarge it to include initial m.

**Check.** The constant depends only on the fixed group over E, not on g or its stable class.

Direct prerequisites: `SC2/weight-averaging-kernel`, `SC2/rho-averaging-sequence`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/semisimple-conjugacy`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/rational-classes-in-stable-class`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0`, `mathlib:AddChar.complexBasis`, `mathlib:AddChar.wInner_cWeight_eq_boole`.

Sources: H26, Lemma 2.6 proof, pp. 8–9 — Uses Fu quantitative growth to obtain a uniform bound across elliptic classes.; FU25, Proposition 3.3.1, p. 21; proof of Theorem 4.3.1, pp. 26–27 — Bounds all nontrivial Fourier coefficients by one lower power of m.; HKW22, Lemma 3.1.1, pp. 12–13 — Provides the finiteness of rational maximal-torus conjugacy types needed for a group-uniform constant.

Atlas planet: **Uniform weight equidistribution**.

### Discriminant-weighted character averaging

**Target `SC2/character-averaging` (theorem).** Let Theta be any element of D(G), and U a compact subset of G(E) with this property: for each elliptic stable class meeting U, U contains a representative of every rational conjugacy class in it. Then there is C_(Theta,U)>=0 such that for all m>=1 and g in U strongly regular elliptic, |D_G(g)|^(1/2) |d_m^(-1) T_(mu_m)(Theta)(g)-Av(Theta)(g)| <= C_(Theta,U)/m.

Proof or construction:

1. Use the G2 self-Hecke elliptic formula to identify d_m^(-1)T_(mu_m)(Theta)(g) with sum_(R_g) C_m(g,gprime)Theta(gprime).
2. Subtract the arithmetic average and apply the sum of absolute coefficient errors from uniform weight equidistribution.
3. The Weyl discriminant is stable-invariant; choose representatives in U and use the G1 Harish-Chandra local boundedness of |D|^(1/2)|Theta| on compact sets.
4. The geometric trace and invariant-fiber assertions in this step are precisely contract G2; do not treat them as supplied by finite-dimensional Fourier algebra or by the generic HS3 amplitude statement alone.

**Check.** Uniformity is weighted by the discriminant; the compact set contains representatives, not entire noncompact conjugacy orbits.

Direct prerequisites: `SC1/self-hecke-character-operator`, `SC2/weight-averaging-kernel`, `SC2/uniform-weight-equidistribution`, `SC2/elliptic-stable-average`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/semisimple-conjugacy`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/rational-classes-in-stable-class`.

Sources: H26, Lemma 2.6, pp. 8–9 — Proves weighted uniform convergence on compact sets with enough stable representatives.

Atlas planet: **Character averaging estimate**.

## SC3. Stability of the FS center

Prove the compact stable-representative lemma and O(1/m) convergence of normalized Hecke pairings against cuspidal test functions. Deduce Hansen Theorem 1.1 by semisimple-rank induction: the FS center image lies in the very stable subalgebra for arbitrary connected reductive p-adic G.

### Compact representatives for the cuspidal integrals

**Target `SC3/compact-stable-representatives` (lemma).** Choose finitely many representatives T of rational elliptic maximal-torus conjugacy classes and compact subsets C_T of T(E). There is a compact U in G(E) containing all C_T such that every strongly regular elliptic stable class meeting U has representatives of every rational conjugacy class in U.

Proof or construction:

1. ET.0 and HKW Lemma 3.1.1 give finitely many rational conjugacy classes of E-embeddings of each fixed torus that are geometrically conjugate to its inclusion.
2. For each T choose representatives for those embedding classes, including the inclusion and the finitely many geometric Weyl identifications. Take the union of their images of C_T.
3. This finite union is compact. A strongly regular element in one image has that embedded torus as centralizer; every rational conjugacy class in its stable class is represented by another chosen embedding of the same original element.

**Check.** U contains compact sets of representatives, rather than a union of whole conjugacy orbits. The assertion includes singular points of C_T only for compactness, without imposing character values there.

Direct prerequisites: `EndoscopicTransferAndUnitaryTraceComparison:ET.0/semisimple-conjugacy`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/rational-classes-in-stable-class`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0`.

Sources: H26, §2.3, pp. 10–11, compact-U step — Expands the representative choice used before applying the uniform averaging estimate.; HKW22, Lemma 3.1.1, pp. 12–13 — Provides finiteness of rational torus conjugacy classes and the stable-class topology.

### Averaging against cuspidal test functions

**Target `SC3/cuspidal-pairing-limit` (theorem).** For Xi in D_temp(G) let P_st(Xi) in SD_temp(G) be the G1 stable projection. For every cuspidal f in I(G)_cusp, (d_m^(-1)T_(mu_m)(Xi)-P_st(Xi))(f) tends to zero as m tends to infinity. More precisely, its absolute value is at most C_(Xi,f)/m for m>=1.

Proof or construction:

1. G1 supplies the cuspidal Weyl integration formula, with a finite sum of integrals over elliptic tori, compact orbital-support closures C_T, and bounded |D|^(1/2)O_t(f).
2. G1 supplies P_st(Xi)(g)=Av(Xi)(g) for elliptic g. Choose compact U using compact stable representatives; character averaging bounds the other factor |D|^(1/2)(d_m^(-1)T(Xi)-P_st Xi) by C/m on all C_T.
3. Extend that weighted factor by zero outside the strongly regular locus, and apply the pinned finite-measure integral norm bound on each compact C_T. Sum the finitely many Weyl coefficients.

**Check.** Neither the approximants nor the error are asserted to be tempered; Xi is tempered so that the imported stable projection is available.

Direct prerequisites: `SC2/character-averaging`, `SC3/compact-stable-representatives`, `SC2/elliptic-stable-average`, `SmoothRepresentationsOfLocalGroups:SR.2`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1/orbital-integral`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1/kappa-and-stable-orbital-integrals`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1/matching-functions`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1`, `mathlib:MeasureTheory.norm_integral_le_of_norm_le_const`.

Sources: H26, §2.3, pp. 10–11 — Converts elliptic uniform convergence into convergence of pairings with cuspidal functions.

Atlas planet: **Cuspidal averaging limit**.

### Very stability of the Fargues–Scholze center

**Target `SC3/fargues-scholze-stability` (theorem).** For every connected reductive G over every finite extension E of Q_p, Psi_G:Z_spec(G)->Z(G) factors through Z_vst(G). Hence Z_FS(G)=range(Psi_G) is contained in Z_vst(G), and all its elements are stable distributions. There is no tameness, residual-prime-size, quasi-splitness or discrete-parameter restriction.

Proof or construction:

1. Induct on semisimple rank. For an induced stable tempered character i_M^G Theta_M, use the ES7 normalized-induction dictionary and the SR.2 central restriction identity z·i_M^G=i_M^G(r_M(z)·-), with r_M(Psi_G a)=Psi_M(res a). The smaller-rank result makes this stable.
2. G1 supplies the Arthur decomposition into induced and elliptic stable tempered summands and Hansen Lemma 2.1 preserving the cuspidal/noncuspidal test-function splitting. Reduce to Theta in SD_ell(G) and unstable cuspidal f; z*f is cuspidal.
3. For each admissible mu set C_mu=d_mu^(-1)T_mu(Theta)(z*f). The comparison modulo induced characters makes this equal to the constant Theta(z*f), because induced characters vanish on cuspidal functions.
4. Hecke central commutation rewrites C_(mu_m)=d_m^(-1)T_(mu_m)(Xi)(f) for Xi=z·Theta. Xi is tempered, independently of stability. Subtract P_st Xi, which vanishes on unstable f, then apply the cuspidal pairing limit to show this constant is zero.
5. The very-stability character criterion finishes the induction. At semisimple rank zero G is a torus and stable conjugacy is rational conjugacy.

**Check.** The proof never assumes z·Theta stable before establishing it; only the independently supplied stable projection of Xi is used.

Direct prerequisites: `SC0/very-stability-criterion`, `SC0/stability-algebra`, `SC1/hecke-central-commutation`, `SC1/hecke-modulo-induction`, `SC3/cuspidal-pairing-limit`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic/normalised-induction-dictionary`, `ExcursionOperatorsAndSpectralAction:ES1:spectral-center/spectral-to-geometric-center-map`, `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`.

Sources: H26, Theorem 1.1, p. 2; proof §2.3, pp. 9–11 — Proves very stability of the FS image for arbitrary connected reductive p-adic groups.

Atlas planet: **Fargues–Scholze center stability**.

## SC4. Atomic characters and packet parameters

Define atomic stability by nonzero arbitrary-coefficient support minimality. Prove scalar rigidity and constancy of the FS semisimple parameter conjugacy class on atomic supports. Plan the regular supercuspidal packet corollary under Hansen’s exact tame and p-Weyl hypotheses, retaining G3 as the unresolved atomicity source input.

### Atomically stable virtual characters

**Target `SC4/atomic-stable-character` (definition).** A virtual character Theta=sum_(i in S) a_i Theta_(pi_i) is atomically stable if S is a finite nonempty set of pairwise nonisomorphic irreducible smooth representations, every a_i is nonzero, Theta is stable, and every nonzero stable virtual character supported in S has support exactly S. Coefficients of the competing virtual character are arbitrary complex numbers, not necessarily the a_i. Equivalently its irreducible-character coefficient vector is a nonzero support-minimal member of the stable-character subspace.

Proof or construction:

1. Use the G1 linear independence of irreducible characters to make finite coefficient support intrinsic.
2. Express minimality as the absence of a nonzero vector of smaller support in the stable-character subspace; match it to Finsupp.support and Submodule without defining a replacement character carrier.

**Check.** Zero and the empty support are excluded; testing only proper partial sums of Theta is insufficient.

Direct prerequisites: `SmoothRepresentationsOfLocalGroups:SR.3`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1/orbital-integral`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1/kappa-and-stable-orbital-integrals`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1/matching-functions`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1`, `mathlib:Finsupp`, `mathlib:Finsupp.mem_support_iff`, `mathlib:Submodule`.

Sources: H26, §1.1 before Corollary 1.2, p. 2 — Defines the support-minimal stable combinations used to compare semisimple parameters.

API:

| Name | Role | Statement |
| --- | --- | --- |
| `AtomicStable.nonzero` | projection | An atomically stable virtual character is nonzero. |
| `AtomicStable.stable` | projection | An atomically stable virtual character belongs to SD(G). |
| `AtomicStable.support_minimal` | characterisation | A nonzero stable vector with support contained in the atomic support has the same support. |
| `AtomicStable.smul_iff` | relation | For c nonzero, cTheta is atomically stable if and only if Theta is. |
| `AtomicStable.finsupp_criterion` | compatibility | Under the irreducible-character coefficient isomorphism, atomic stability is precisely nonzero support minimality in the stable submodule of complex finitely supported functions. |

Definition tests:

- **AtomicStable.zero** (degenerate): The zero character is not atomically stable.
- **AtomicStable.torus_single** (computation): Each irreducible character of a torus is stable and atomically stable.
- **AtomicStable.torus_pair** (non-example): A nonzero combination of two distinct irreducible torus characters is stable but is not atomically stable: either singleton character gives smaller stable support.
- **AtomicStable.arbitrary_coefficients** (non-example): In the coefficient-space fixture SD=span{(1,2,0),(1,1,1)} in C^3, (1,1,1) is not support minimal because (1,2,0) has smaller support, although none of its nonempty proper 0/1 partial sums is in SD.
- **AtomicStable.line_fixture** (compatibility): In the line submodule span{(1,2)} of C^2, every nonzero vector is support minimal; this checks the exact Finsupp/Submodule criterion used in the compact Lean statement.

Uses: Hansen Corollary 1.2, p. 2 — Support minimality forces a common central spectral character.; SC4/regular-supercuspidal-packet — The application needs atomicity as an explicit external theorem, not as a synonym for stable packet sum.

Atlas planet: **Atomically stable character**.

### Scalar rigidity on an atomic stable support

**Target `SC4/atomic-scalar-rigidity` (theorem).** Let Theta=sum_(i in S) a_i Theta_(pi_i) be atomically stable and z in Z_vst(G). Then z_(pi_i)=z_(pi_j) for every i,j in S, where z_pi is the scalar by which z acts on pi.

Proof or construction:

1. Very stability makes z·Theta stable. Fix i in S and subtract z_(pi_i)Theta; the result is stable and its i coefficient is zero.
2. Its support is contained in S but is strictly smaller unless the vector is zero. Atomic minimality forces it to be zero.
3. For each j, a_j is nonzero, so the j coefficient equation implies z_(pi_j)=z_(pi_i).

**Check.** This argument uses arbitrary-coefficient support minimality, not the false claim that checking only partial sums is enough.

Direct prerequisites: `SC4/atomic-stable-character`, `SC0/very-stability-criterion`, `SmoothRepresentationsOfLocalGroups:SR.3`.

Sources: H26, Corollary 1.2 proof from Theorem 1.1, p. 2 — The central character is constant on the support of an atomic stable virtual character.

Atlas planet: **Atomic scalar rigidity**.

### FS parameters on atomic stable supports

**Target `SC4/atomic-fs-parameter` (theorem).** If Theta=sum_(i in S) a_i Theta_(pi_i) is atomically stable, all pi_i have the same Fargues–Scholze semisimple L-parameter conjugacy class. Equality is equality in the set of Ghat-conjugacy classes of continuous semisimple Weil parameters with the prescribed Weil projection, using the coefficient topology of the imported ES5/LP2 parameter object before transport by iota.

Proof or construction:

1. Apply FS very stability and atomic scalar rigidity to every spectral central function.
2. The imported ES5 excursion-character and parameter theorems identify these scalar evaluations with the invariant coordinates of the semisimple parameter.
3. Apply LP2 semisimple-character uniqueness to conclude equality of the conjugacy classes, with coefficients transported by the fixed iota.

**Check.** Do not claim equality of chosen cocycle representatives, recovery of a Weil–Deligne monodromy operator, or agreement with an independently constructed LLC.

Direct prerequisites: `SC3/fargues-scholze-stability`, `SC4/atomic-scalar-rigidity`, `ExcursionOperatorsAndSpectralAction:ES5/parameter-of-an-irreducible-smooth-representation`, `ExcursionOperatorsAndSpectralAction:ES5/excursion-character-of-a-schur-object`, `LanglandsParameterStacks:LP2:semisimple-characters/character-bijection`.

Sources: H26, Corollary 1.2, p. 2 — Deduces constancy of the semisimple FS parameter from stability.

Atlas planet: **Atomic FS parameter constancy**.

### Regular supercuspidal packet constancy

**Target `SC4/regular-supercuspidal-packet` (application).** Target: if G splits over a tame extension, p does not divide the absolute Weyl group order, and phi is a regular supercuspidal parameter with nonempty Kaletha packet Pi_phi(G), then the FS semisimple parameter is constant as pi varies in Pi_phi(G). This target requires the external atomic-stability assertion for sum_(pi in Pi_phi(G)) Theta_pi under exactly these hypotheses; its source justification is open in G3. The conditional implication from that assertion is supplied by the preceding theorem.

Additional hypotheses: G splits over a tame extension; p does not divide |W_G|; phi is regular supercuspidal; Pi_phi(G) is nonempty.

Proof or construction:

1. Use the external regular-packet construction to obtain a finite set of pairwise nonisomorphic irreducible supercuspidals.
2. Discharge G3: establish full arbitrary-coefficient atomic stability under the stated hypotheses, not merely stability of the packet sum.
3. Apply atomic FS parameter constancy. The result assigns a single FS class to this packet and makes no assertion that it equals phi.

**Check.** This is a planned target with an explicit unresolved source gap. The gap does not feed into SC3, SC5 or SC6.

Direct prerequisites: `SC4/atomic-fs-parameter`.

Sources: H26, Corollary 1.3 and preceding paragraph, p. 2 — States the regular-packet application with the source hypothesis mismatch exposed.; FKS21v2, §4.3 assumptions, p. 20; §4.4, pp. 24–26, especially Theorem 4.4.4 — The inspected version proves stability and endoscopic identities with additional exponential-convergence hypotheses; it does not directly state the exact atomic input needed here.

## SC5. Centers of extended pure inner forms

For a basic extended pure inner form of a quasi-split G*, prove ker(Psi_G*) <= ker(Psi_G). Construct the unique surjective spectral-algebra map tau_G between the FS image centers, and prove its compatibility with normalized Levi restriction. The center maps are not asserted to identify whole stable Bernstein centers.

### Kernel inclusion for extended pure inner forms

**Target `SC5/kernel-inclusion` (theorem).** Let G* be quasi-split over E, let b be basic in B(G*), and put G=G*_b. Under the canonical identification of the spectral centers, ker(Psi_(G*)) is contained in ker(Psi_G).

Proof or construction:

1. Prove the contrapositive by semisimple-rank induction. If z=Psi_G(a) is nonzero, SC0 faithfulness and SC3 very stability give a stable tempered character detected by z.
2. Use the G1 stable Arthur decomposition. If an induced proper-Levi component is detected, the normalized center restriction is nonzero; the smaller-rank kernel inclusion for the corresponding Levi M of G and M* of G*, together with the ES7 normalized-induction dictionary, forces Psi_(G*)(a) nonzero.
3. Otherwise choose Theta in SD_ell(G) with z·Theta nonzero. The G1 center preservation of elliptic summands and injectivity of elliptic restriction give an elliptic g with nonzero value.
4. BG1/request R8 supplies a dominant mu with b in B(G*,mu); G2 supplies the adapted shriek trace formula. ET.0 supplies a matching elliptic element g* in G*. The stable inner-Hecke formula makes T_mu(z·Theta)(g*)=e(G)dim(V_mu)(z·Theta)(g), which is nonzero.
5. Inner central commutation identifies this with Psi_(G*)(a)·T_mu(Theta), so Psi_(G*)(a) cannot vanish. The rank-zero case uses the same elliptic argument.

**Check.** The nonzero character is stable only because SC3 has already been proved; this dependency cannot be reversed.

Direct prerequisites: `SC0/stable-tempered-faithfulness`, `SC3/fargues-scholze-stability`, `SC1/inner-hecke-central-commutation`, `SC1/stable-inner-hecke-formula`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic/normalised-induction-dictionary`, `BunGAndNewtonStrata:BG0/sigma-centralizer-J-b`, `BunGAndNewtonStrata:BG1/basic-class`, `BunGAndNewtonStrata:BG1/classification-by-two-invariants`, `BunGAndNewtonStrata:BG1`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/semisimple-conjugacy`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/rational-classes-in-stable-class`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0`, `SmoothRepresentationsOfLocalGroups:SR.2`.

Sources: H26, Theorem 1.4, p. 3; proof §2.4, pp. 11–12 — Shows that the quasi-split FS image detects every inner-form image.

Atlas planet: **Inner form kernel inclusion**.

### The surjective map between FS centers

**Target `SC5/inner-form-center-map` (construction).** For G*=quasi-split and G=G*_b with b basic, define tau_G:Z_FS(G*) -> Z_FS(G) by tau_G(Psi_(G*)(a))=Psi_G(a). This is the unique surjective Z_spec(G*)-algebra map satisfying that identity, where each FS center is the image subalgebra rather than the whole Bernstein center.

Proof or construction:

1. Use kernel inclusion to show that the formula is independent of the spectral lift.
2. Use the existing first-isomorphism equivalence between a source modulo the kernel and the image, or its universal property, to obtain the algebra map.
3. Surjectivity follows by choosing the same spectral element for every element of the target image; uniqueness follows because the source is an image.

**Check.** No injectivity or surjectivity of Psi onto the whole Bernstein center is assumed or concluded.

Direct prerequisites: `SC5/kernel-inclusion`, `ExcursionOperatorsAndSpectralAction:ES1:spectral-center/spectral-to-geometric-center-map`, `mathlib:AlgHom.range`, `mathlib:AlgHom.rangeRestrict`, `mathlib:AlgHom.rangeRestrict_surjective`, `mathlib:Ideal.quotientKerEquivRange`.

Sources: H26, Theorem 1.4, p. 3; construction §2.4, pp. 11–12 — Factors the two spectral maps through their ranges.

API:

| Name | Role | Statement |
| --- | --- | --- |
| `FSCenterTransfer.lift` | constructor | Kernel inclusion induces tau_G between the two image algebras. |
| `FSCenterTransfer.apply_Psi` | simp | tau_G(Psi_(G*)(a))=Psi_G(a) for each spectral element a. |
| `FSCenterTransfer.map_add_mul_one` | structure | tau_G preserves addition, multiplication, one and the common spectral algebra action. |
| `FSCenterTransfer.surjective` | universal-property | Every element of Z_FS(G) is tau_G(x) for a source image element x. |
| `FSCenterTransfer.unique` | extensionality | An algebra map from Z_FS(G*) agreeing with tau_G on every Psi_(G*)(a) equals tau_G. |
| `FSCenterTransfer.range_quotient` | compatibility | Via Ideal.quotientKerEquivRange, tau_G is the quotient map induced by ker(Psi_(G*)) <= ker(Psi_G). |

Definition tests:

- **FSCenterTransfer.trivial_twist** (compatibility): For b=1 on G*, tau_G is the identity of Z_FS(G*).
- **FSCenterTransfer.zero_one** (degenerate): tau_G maps zero to zero and the convolution unit to the convolution unit.
- **FSCenterTransfer.quotient_fixture** (computation): For source A=C[X], maps id_A and evaluation at zero induce the quotient A -> C, sending X to zero and constants to themselves.
- **FSCenterTransfer.kernel_direction** (non-example): For the two projections C×C -> C, ker(pr1) is not contained in ker(pr2); no map tau:C->C can satisfy tau(pr1(x))=pr2(x) for every x. This rejects reversing or omitting kernel inclusion.

Uses: Hansen Theorem 1.4(i), p. 3 — Its defining spectral formula proves the Levi square.; Hansen Theorem 1.4(ii), p. 3 — The same map acts on transferred stable characters and matching functions.

Atlas planet: **Inner form FS center map**.

### Compatibility of tau with Levi restriction

**Target `SC5/inner-form-center-levi` (theorem).** If M is a Levi subgroup of G=G*_b and M* the corresponding Levi of G*, then r_M o tau_G = tau_M o r_(M*) on Z_FS(G*), with all four maps restricted to their FS image subalgebras and normalized parabolic induction.

Proof or construction:

1. Use the ES7 normalized-induction dictionary to obtain r_M(Psi_G(a))=Psi_M(res_(M*) a) and the corresponding identity on G*.
2. Evaluate both composites on Psi_(G*)(a), use the defining formulas for tau_G and tau_M, and then use surjectivity of Psi_(G*) onto its own range.

**Check.** The final surjectivity is onto Z_FS(G*); the theorem does not assume a stable-center conjecture.

Direct prerequisites: `SC5/inner-form-center-map`, `ExcursionOperatorsAndSpectralAction:ES7:parabolic/normalised-induction-dictionary`, `SmoothRepresentationsOfLocalGroups:SR.2`.

Sources: H26, Theorem 1.4(i), p. 3; §2.4, p. 12 — Gives the commuting Levi-restriction square.

Atlas planet: **Levi compatibility of center transfer**.

## SC6. Stable transfer compatibility

Prove tau_G intertwines the FS center action with stable tempered character transfer using elliptic reverse-Hecke comparisons modulo induced characters and rank induction. Deduce that convolution preserves matching stable orbital integrals for compactly supported smooth test functions, with transfer factor e(G), including irrelevant-class vanishing.

### FS center action commutes with stable character transfer

**Target `SC6/character-transfer` (theorem).** For the extended pure inner form G=G*_b, z in Z_FS(G*) and Theta in SD_temp(G*), Trans_G(z·Theta)=tau_G(z)·Trans_G(Theta). Normalize Trans_G on elliptic stable characters by (Trans_G Theta)(g)=e(G)Theta(g*) for matching elliptic elements; it kills irrelevant Levi summands and commutes with induction from relevant Levi summands.

Proof or construction:

1. Import the G1 stable tempered transfer decomposition and its elliptic isomorphism; the Kottwitz-sign convention is fixed here and shared with ET.1.
2. Induct on rank using the stable Arthur decomposition. On irrelevant Levi summands both sides vanish; on relevant proper-Levi summands use smaller-rank character-transfer compatibility, the Levi square for tau and central restriction.
3. For elliptic Theta use reverse inner Hecke: its elliptic restriction is dim(V_mu)Trans_G(Theta). Thus T_mu^rev(Theta)-dim(V_mu)Trans_G(Theta) is in D_ind(G), by the G1 elliptic-kernel theorem.
4. Apply reverse central commutation. The center preserves D_ind(G) and the elliptic summand; the same elliptic comparison applied to stable z·Theta identifies the desired two elliptic restrictions. Divide by the positive dimension and use injectivity of elliptic restriction on D_ell(G).

**Check.** Reverse Hecke output is compared modulo induced characters; it is not assumed to lie in the elliptic summand.

Direct prerequisites: `SC3/fargues-scholze-stability`, `SC5/inner-form-center-map`, `SC5/inner-form-center-levi`, `SC1/inner-hecke-central-commutation`, `SC1/stable-inner-hecke-formula`, `SC1/hecke-modulo-induction`, `SmoothRepresentationsOfLocalGroups:SR.2`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/semisimple-conjugacy`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/rational-classes-in-stable-class`, `EndoscopicTransferAndUnitaryTraceComparison:ET.0/kottwitz-sign`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1/orbital-integral`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1/kappa-and-stable-orbital-integrals`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1/matching-functions`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1`.

Sources: H26, Theorem 1.4(ii), p. 3; proof §2.4, pp. 12–13 — Intertwines the FS center actions with stable tempered transfer.

Atlas planet: **Stable character transfer compatibility**.

### FS central convolution preserves matching test functions

**Target `SC6/matching-test-functions` (theorem).** Suppose f* in H(G*) and f in H(G) have matching stable orbital integrals for the inner-form transfer factor e(G). For every z in Z_FS(G*), z*f* and tau_G(z)*f also have matching stable orbital integrals, including vanishing on stable classes in G* with no matching class in G.

Proof or construction:

1. Use ET.3 smooth transfer in characteristic zero to choose a function h* on G* matching tau_G(z)*f.
2. For every Theta in SD_temp(G*), transfer duality for (f*,f), character-transfer compatibility, and duality for (h*,tau_G(z)*f) give Theta(z*f* - h*)=0.
3. Apply the G1 unstable-function criterion on G*: z*f* - h* has all stable orbital integrals zero. ET.1 linearity of matching gives the required equality and the vanishing on irrelevant classes.

**Check.** The matching functions need not be canonical representatives; the assertion is about their orbital-integral classes.

Direct prerequisites: `SC6/character-transfer`, `SC5/inner-form-center-map`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1/orbital-integral`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1/kappa-and-stable-orbital-integrals`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1/matching-functions`, `EndoscopicTransferAndUnitaryTraceComparison:ET.1`, `EndoscopicTransferAndUnitaryTraceComparison:ET.3/local-transfer-existence`, `SC0/very-stability-criterion`.

Sources: H26, Theorem 1.4 final assertion, p. 3; proof §2.4, p. 13 — Passes the character identity to convolution of matching test functions.

Atlas planet: **Matching function compatibility**.

## Source checks and acceptance boundary

Hansen uses shriek basic-stratum extensions; HKW states its Mant functor using star extension. Finite length and the character formula for the exact shriek composites, in both directions, are part of G2. Compactness, admissibility and the existence of a trace distribution do not alone supply this interface. The HKW Theorem 6.5.2 input is separate from the refined-LLC hypotheses of its Theorem 6.5.1.

For the averaging estimate, nontrivial Fourier coefficients lose one power of m. Finitely many rational torus types let one take a group-uniform bound. A compact collection of stable representatives makes the Harish-Chandra bound applicable to all rational classes; taking an entire conjugacy saturation would generally destroy compactness. The Weyl discriminant factor is required when passing to cuspidal integrals.

The stability induction uses the stable projection of Xi=z·Theta without first assuming Xi stable. The Hecke correction is induced, and its vanishing on cuspidal test functions explains why the pairing is constant. Its limiting value is zero. The later inner-form argument can then use faithful stable tempered detection. Reverse Hecke is compared modulo induced characters before applying elliptic restriction; its output is not presumed elliptic.

The regular-packet target is an application with source contract G3. It does not strengthen the unconditional main theorem, and no additional prime bound has been inserted into the statement of that theorem. The two Hansen misprints and the HKW sign-convention misprint are corrected throughout:

- **E1**, Published version, §2.4, p. 13, reverse-Hecke functor in the elliptic-transfer paragraph: Use i_(1!) in the composite i_b^* T_(V_mu) i_(1!). The source category is the quasi-split group attached to the identity basic stratum, and the definition on p. 9 has this index. Already recorded as PAPER-HANSEN-26/E1 and confirmed in REV-PAPER-HANSEN-26; the present review confirms the correction independently. Independent verdict: confirmed by REV-DESIGN-ExcursionOperatorsAndSpectralActionPartII (2026-10-19).
- **E2**, Published version, §2.2, p. 8, definition of rho_G preceding Lemma 2.6: Use the positive roots of Ghat, equivalently the positive coroots of G, in mu_m=4m rho_dual. Fu Lemma 3.1.2 and the character product require the dual-root sum; in type B2 the root and coroot sums differ, as the explicit test records. Already recorded as PAPER-HANSEN-26/E2 and confirmed in REV-PAPER-HANSEN-26; the intended dual-root interpretation is unchanged. Independent verdict: confirmed by REV-DESIGN-ExcursionOperatorsAndSpectralActionPartII (2026-10-19).
- **E3**, HKW22, Published version, §3.3, p. 18, explanatory sentence after Equation (3.3.3); compare Appendix A.2, p. 72: Interpret rho_G as half the positive-root sum, so 2rho_G is the full sum in the Kottwitz-sign exponent. Appendix A.2 defines 2rho using the full positive-coroot sum in the dual root datum and proves the sign identity in Lemma A.2.1. Doubling that sum again would make every sign trivial. For split GL_2 and the quaternionic basic inner form with mu=(1,0), the correct exponent is odd and the sign product is -1. Already recorded as PAPER-HANSEN-KALETHA-WEINSTEIN-22/E5; independently confirmed in this review and newly included in this packet. Independent verdict: confirmed by REV-DESIGN-ExcursionOperatorsAndSpectralActionPartII (2026-10-19).

### Suggested Lean boundary

The companion file uses existing finitely supported coefficient vectors and submodules to state the support-minimality and diagonal-scalar milestone of SC4. It uses Mathlib finite expectation for the elementary averaging estimate underlying SC2, and algebra-homomorphism ranges for the quotient factorization underlying SC5. Its single new definition has a real body on these existing carriers. Its examples exercise zero, singleton and two-coordinate supports, the empty finite average convention, and the direction of kernel inclusion.

The actual p-adic character spaces, stable subspaces, Hecke functors and stable-transfer maps are README targets. They are not replaced in Lean by abstract types bearing their names or predicates whose content is unspecified. The README and packet carry all 45 definition API items and 36 definition tests; the compact file is a selection of statable milestones and examples, not a claim that every target has been formalized.

### Completion criteria

Every layer has its target nodes, exact hypotheses, proof route, source locators and direct prerequisites. All definition/construction APIs and tests are specified. To close a layer, replace its direct and transitive G1/G2 annotations by actual supplier references, discharge its existing-stage requests and, for SC4, verify G3. Keep all implementation statuses unchecked until actual library work provides evidence. The independent plan review must check both the mathematical interfaces and the source-hypothesis distinction in G3.

## Sources read

- **H26**. David Hansen. [Excursion operators and the stable Bernstein center](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/AB00A1DF177B6DAB542489D58DA1C8AD/S2050508626100286a.pdf/excursion-operators-and-the-stable-bernstein-center.pdf). Forum of Mathematics, Pi 14 (2026), e10, pp. 1–14; version of record. Read 2026-10-19: Entire article, pp. 1–14: definitions, Lemmas 2.1–2.6, Propositions 2.5 and 2.7, proofs of Theorems 1.1 and 1.4, and Corollaries 1.2–1.3.
- **FU25**. Chenji Fu. [Stability of elliptic Fargues–Scholze L-packets](https://arxiv.org/pdf/2501.00652v1). arXiv:2501.00652v1 (1 January 2025). Read 2026-10-19: §§3.1–3.3, pp. 18–21: dual-root product, finite H_g, Fourier growth; §4.2, pp. 24–25: invariant fibers, especially Lemma 4.2.7; §4.3, pp. 26–27: proof of Theorem 4.3.1 and equidistribution.
- **HKW22**. David Hansen, Tasho Kaletha and Jared Weinstein. [On the Kottwitz conjecture for local shtuka spaces](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/33A94496879999F3D63C2997F2D50D9D/S2050508622000075a.pdf/div-class-title-on-the-kottwitz-conjecture-for-local-shtuka-spaces-div.pdf). Forum of Mathematics, Pi 10 (2022), e13, pp. 1–79; version of record. Read 2026-10-19: §3.1, pp. 12–13: rational torus finiteness and class topology; §3.2, pp. 14–16: inv[b], uniqueness and torus fibers; §3.3, pp. 17–18: Equation (3.3.3) sign; §6.4, pp. 61–62: finite length and the stated star-extension Mant functor; §6.5, pp. 65–66: Theorem 6.5.2; Appendix C, p. 75: Theorem C.1.1 characterizing nonelliptic virtual representations as proper-parabolic induced combinations; Appendix A.2, p. 72: Lemma A.2.1 and the half-sum convention for the sign in (3.3.3).
- **FS24**. Laurent Fargues and Peter Scholze. [Geometrization of the local Langlands correspondence](https://arxiv.org/pdf/2102.13459v4). arXiv:2102.13459v4 (2024). Read 2026-10-19: §I.9, pp. 34–35: Definition I.9.2, Proposition I.9.3, Conjecture I.9.5 and the separate following stable-center expectation.
- **FKS21v2**. Jessica Fintzen, Tasho Kaletha and Loren Spice. [A twisted Yu construction, Harish-Chandra characters, and endoscopy](https://arxiv.org/pdf/2106.09120v2). arXiv:2106.09120v2 (3 September 2021); preprint of Duke Mathematical Journal 172 (2023), pp. 2241–2301. Published full text not retrieved. Read 2026-10-19: Introduction, pp. 2–4: scope and field restrictions; §4.3, pp. 19–23: especially assumptions on p and exponential convergence on p. 20; §4.4, pp. 24–26: regular packets, stable sums, Theorem 4.4.4.

The packet records the SHA-256 hashes and exact versions. No source passage is reproduced. The FKS entry identifies the preprint actually read; it is not evidence that the inaccessible version of record has unchanged hypotheses.
