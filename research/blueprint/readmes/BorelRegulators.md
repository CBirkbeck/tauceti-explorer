# Borel regulators: a source-checked partial blueprint

**Job:** BP-BorelRegulators, issue #74.  
**Worker:** ChatGPT Pro — cgp-504c2b4122bc.  
**Mathematical input revision:** `49f74b4d2bace99a76ceff4ac2199a3384c83c57`.  
**Submission branch base:** `1338883fe31f3b357dd91b7d5916e76e3b950c81`.  
**Companion packet:** `research/blueprint/packets/BorelRegulators.json`.

This is a partial mathematical blueprint, not a Lean implementation. All seven stages R.1–R.7 remain partial and every implementation status is unchecked. Module names and declaration names below are proposed interfaces. Their appearance is not a claim that a declaration exists in either pinned library. The packet contains 36 nodes, 64 API entries, 12 explicit gaps, 11 supplier requests and one restructuring proposal.

## 1. Purpose, scope and independent proof routes

The purpose is to construct normalized higher Borel regulators for number fields, prove their rank and lattice properties, and relate their determinants to leading terms of Dedekind zeta functions. A usable library must retain the actual maps, coefficient lines, embedding actions, integral lattices and comparison constants. A collection of abstract isomorphisms or a rank formula installed as an assumption does not supply this library.

The starting arithmetic case treated explicitly here is the full ring of integers O_F of an arbitrary number field F. The source roadmap also requires orders in central division algebras and suitable S-integer or field comparisons. These are not silently replaced by the commutative case. G4 records exactly the missing generality. The reserved exports

- `BorelRegulators:R.3/borel-rank-theorem`;
- `BorelRegulators:R.4/borel-regulator`

are preserved with their full statements for O_F. Neither is declared proof-ready. A continuation must retain these IDs and extend their prerequisites rather than replace the exports by differently named surrogates.

The rational-rank route passes through arithmetic cohomology, compact-dual stabilization, a special-linear K-space comparison and rational primitive Hurewicz. It does not import `ArithmeticKTheory:N.3:ranks`, which consumes the Borel result, and does not import finite generation of arithmetic K-groups. The regulator-lattice route first defines the map, then proves that its real extension is an isomorphism, and only then imports `ArithmeticKTheory:N.3:finite-generation`.

These distinctions prevent two invalid shortcuts. Equal dimensions of source and target do not prove a specified map is invertible: the zero map provides a counterexample. Rational rank and real nondegeneracy do not prove an integral image is discrete: the inclusion Z[1/2] into R has full rational rank but nonzero elements tending to zero. The lattice theorem needs independent finite generation.

The source check also separates two determinant normalizations. R^B_n is the covolume of this document's explicitly normalized coordinate regulator. R_m^77 is the historical homotopy-determinant regulator in Borel's 1977 section 6.4. The checked leading-term formula involves pi to the target dimension times R_m^77. An exact conversion between these two regulators is required before advertising a corresponding formula for R^B_n.

## 2. Global conventions and baseline boundary

Let E_F be the finite set of field embeddings F into C. Let c act by complex conjugation of the values. Let r_1 count the real embeddings and r_2 count the conjugate pairs of nonreal embeddings. The regulator weight is n>=2, the K-degree is q=2n-1, the matrix size is N, and the index in Borel's 1977 section 6 is m=n-1. The field degree [F:Q], the target dimension d_n and any stable-range bound are distinct parameters.

Put epsilon_n=(-1)^(n-1) and

    V_n(F) = { a : E_F -> R | a(c sigma) = epsilon_n a(sigma) }.

Define d_n=r_1+r_2 for odd n and d_n=r_2 for even n. This dimension is computed directly from embeddings before using any K-theory rank theorem. At a real embedding the even-weight condition forces a=-a, hence a=0. A nonreal pair contributes one free real coordinate in either parity.

The coefficient line is L_j=(2*pi*i)^j R inside C, with designated generator tau_j=(2*pi*i)^j. It is a real line, not a complex subspace of dimension one. The real coordinate of tau_j*a is a. The projection

    pi_(n-1)(z) = (z + (-1)^(n-1) conjugate(z))/2

has kernel L_n and image L_(n-1), so it induces C/L_n equivalent over R to L_(n-1). Quotients here are real additive/vector-space quotients. Treating C/L_n as a complex quotient would be incorrect.

Choose one representative of every nonreal conjugate pair, and include the real embeddings only for odd n. Evaluation identifies V_n with the corresponding coordinate space. Its measure is the pullback of coordinate Lebesgue measure. It is not the metric subspace measure inherited from R raised to the set of all embeddings. Under the latter convention the pair (a, plus or minus a) has length sqrt(2) times |a|. Interchanging these measures without a determinant conversion introduces spurious factors.

The pinned commits are:

    Mathlib: 082e2d37e8b0463410cdb532e111cd43d5a66174
    Tau Ceti: f790474821cf4256814db967cb154e7af3d0c369

Two baseline declaration bodies were positively checked. `NumberField.InfinitePlace`, in `Mathlib/NumberTheory/NumberField/InfinitePlace/Basic.lean`, supplies the subtype of absolute values arising from complex embeddings. This does not by itself certify the orbit, counting or extension-fiber lemmas needed below. `NumberField.dedekindZeta`, in `Mathlib/NumberTheory/NumberField/DedekindZeta.lean`, is the ideal-counting `LSeries`. The file's right-hand residue theorem does not supply meromorphic continuation at negative integers. No Tau Ceti declaration is positively cited in the packet.

Searches of Mathlib, the official TauCetiProject/TauCeti repository and the CBirkbeck fork were discovery searches. Failure to find a higher regulator is not a proof of its absence at the pinned commit. G5 requires the remaining source-level baseline audit before implementation assigns existing declaration names.

## 3. R.1: arithmetic levels and finite-type consequences

### Arithmetic levels

Node `BorelRegulators:R.1/arithmetic-level` constructs, for F a number field and N>=2, Gamma_N=SL_N(O_F) inside the real points of the restriction of scalars of SL_N. It also fixes a maximal compact K_N, the symmetric space X_N=G_N(R)/K_N, and the block map A to diag(A,1). The chosen compact group includes its component action; replacing it by its identity component without a comparison is not permitted.

The inputs are `AdelicAlgebraicGroups:AA.3` and `ArithmeticLocallySymmetricSpaces:ALS.2`. The former must supply the integral arithmetic embedding and reduction data, while the latter supplies quotient and compactification foundations. Arithmeticity and finite-type properties are theorems about the construction, not assumptions inserted as fields of a structure to avoid proving them.

The proposed API consists of `BorelRegulators.arithmeticLevel`, returning the arithmetic embedding and quotient data; `BorelRegulators.arithmeticGroup`, whose underlying group is SL_N(O_F); and `BorelRegulators.blockInclusion`, the specified group homomorphism between successive levels. The quotient maps induced by block inclusion must be actual maps and must respect any choices of compact subgroups.

The source roadmap R.1 covers the more general division-algebra-order case. This node only constructs its full-ring-of-integers specialization. G4 requires the remaining inner forms and their compatibility with stabilization, and prevents the specialization from being mistaken for coverage of the entire stage.

### Finite Betti numbers

Node `BorelRegulators:R.1/finite-betti` proves that ordinary H^q(Gamma_N,Q), with trivial coefficients, is finite-dimensional for q>=0. It is not a statement about compactly supported or square-integrable cohomology. The declaration is `BorelRegulators.finiteBetti`.

Choose a normal torsion-free subgroup Gamma' of finite index. A finite CW-type Borel–Serre model gives finite-dimensional rational cohomology for Gamma'. Restriction and averaging, or the finite-quotient Hochschild–Serre argument in characteristic zero, identifies the cohomology of Gamma_N with the appropriate invariants. This descent is indispensable: changing the group to a torsion-free subgroup without proving the comparison does not prove the original statement.

This argument is finite-level topology. It neither proves finite generation of a K-group nor automatically proves finite type of a stabilized homotopy model. Those are distinct obligations. The acceptance test is to identify the group and coefficient system on both sides of every finite-index comparison. The unresolved work is G1 for detailed quotient/cohomology maps and G4 for the required arithmetic generality.

## 4. R.2: cochain comparisons and the compact-dual normalization

### Arithmetic restriction through invariant forms

Node `BorelRegulators:R.2/arithmetic-comparison` constructs

    j_N^q : H_cts^q(G_N(R),R) -> H^q(Gamma_N,R).

Under van Est, this is descent of invariant forms on X_N to the arithmetic quotient, followed by ordinary real group cohomology. It must commute with block maps, coefficient extension and cup products at the level of the chosen comparison maps.

`AutomorphicFormsOnReductiveGroups:AF.1a` supplies continuous and differentiable cochains, smoothing, relative Lie-algebra cochains, invariant forms and van Est with the stated smooth finite-dimensional coefficients and compact-component actions. This is not already the comparison with the arithmetic subgroup. `ArithmeticLocallySymmetricSpaces:ALS.5` is requested for quotient de Rham and group-cohomology comparisons.

At a torsion-free finite-index level, descend invariant forms and use the quotient comparison. Average to return to the full arithmetic group. A common normal finite-index subgroup proves independence of the selected level. The API is `BorelRegulators.arithmeticComparison` for j_N^q, `BorelRegulators.invariantFormDescent` for the differential-form map, and `BorelRegulators.finiteIndexDescent` for the averaged cohomological map.

The source locator is Borel 1974, section 11.1. G1 asks for declaration-sized comparisons and their naturality proofs. A map named van Est, without identifying its source, target and hypotheses, cannot stand in for this entire chain.

### Compact-dual transport

Node `BorelRegulators:R.2/compact-dual-transport` fixes the normalization used to define the Borel class. Here G=GL_N(C) as a real Lie group, K=U(N), q=2n-1, n>=2 and N>=n. Begin with singular cohomology of G with coefficients L_n, use the deformation retraction to K, and identify the compact-dual space with

    (U(N) x U(N))/U(N)_diag.

The order of the two factors and the diagonal compact subgroup are fixed as in Tamme, printed p.69. Pass to invariant forms and relative Lie-algebra cohomology. The tangent transport multiplies the odd-degree arguments by the specified power i^(2n-1), and the resulting real-line conversion yields continuous cohomology with coefficients L_(n-1).

The API is `BorelRegulators.compactDualTransport` for the complete composite, `BorelRegulators.compactDualRelativeMap` for the relative-cochain tangent map, and `BorelRegulators.compactDualVanEstMap` for the final continuous-cohomology comparison. The construction depends on AF.1a and the real Tate line below.

This chain, not the statement that some primitive generator is nonzero, specifies the Borel normalization. It must be checked on actual forms and orientations. The passage between a relative class and its absolute Lie-cohomology image requires care: equality of absolute images does not imply equality of relative classes unless the relevant injectivity is proved. A direct naturality proof can instead avoid that inference. These checks are recorded in G1 and G6.

## 5. R.3: stable cohomology and the reserved rank theorem

### The homotopy model

Node `BorelRegulators:R.3/special-linear-k-model` proposes `BorelRegulators.specialLinearKModel`. Starting with `GeneralAlgebraicKTheory:K.2:plus`, construct a connected homotopy-associative, homotopy-commutative H-space Y_F of CW type with compatible identifications

    pi_q(Y_F) = K_q(O_F), q>=2,
    H_*(Y_F,Q) = colim_N H_*(SL_N(O_F),Q).

These comparisons must preserve Hurewicz and the block-sum Hopf structures. An abstract isomorphism of groups is not enough. The special-linear/determinant or appropriate cover comparison, including the required stable elementary-group and K_1 identifications, must be proved before replacing general-linear homology by special-linear homology.

Borel 1974, section 12.1, supplies the source-level role of this input. G2 records that the model bridge still needs a detailed decomposition. No finite-generation or rank conclusion is hidden in the model's data.

### Stable indecomposables

Node `BorelRegulators:R.3/stable-indecomposables` defines the precise stable goal. Let A_F be the degreewise eventually stable limit of H^*(SL_N(O_F),R). Its cohomological indecomposables in degree q are

    Q^q(A_F) = A_F^q / (A_F^{>0} A_F^{>0})^q.

For q>=2, their dimension is zero for even q, r_2 for q congruent to 3 modulo 4, and r_1+r_2 for q congruent to 1 modulo 4. The API declaration is `BorelRegulators.stableIndecomposables`.

Compute compact-dual cohomology, identify primitive generators and their degrees, and prove the arithmetic comparison in a range where compact-dual restriction also stabilizes. The analytic comparison range and the compact-dual restriction range are distinct. For each fixed q, choose N satisfying both. The system, multiplication and Hopf structures must first be constructed; writing a limit symbol does not establish any stabilization theorem.

The checked source passages are Borel 1974, sections 11.2, the opening of 11.5, and Proposition 12.2. The full compact-dual table and analytic interiors remain G3. In particular, the bound N-1>4[F:Q](2m+1) in Borel 1977, section 6.1, must not be generalized to arbitrary inner forms without proof. The basic acceptance values are q=2,3,5 giving dimensions 0,r_2,r_1+r_2. Decomposable products must not be counted as new K-theory generators.

### Rational primitive Hurewicz

Node `BorelRegulators:R.3/primitive-hurewicz` proposes `BorelRegulators.primitiveHurewicz`. For a connected H-space Y with the stated CW, homotopy-associative, homotopy-commutative, nilpotence and rational finite-type hypotheses, rational Hurewicz identifies pi_q(Y) tensor Q with primitive homology P H_q(Y,Q), for q>=2. Finite-dimensional pairing identifies the latter with the dual of cohomological indecomposables.

Primitives refer to the diagonal coproduct and do not mean all homology. The pairing argument says precisely that primitive homology annihilates products of positive-degree cohomology classes. Scalar extension from Q to R must commute with the maps used in the rank proof.

`StableHomotopyKTheory:H.6` supplies rationalization and scalar-extension infrastructure. Its present text is not evidence that it already owns the entire rational H-space theorem with all these hypotheses. G2 requests a precise producer or agreed scope extension and verification of the hypotheses for Y_F. Finite Betti numbers at each arithmetic level alone do not establish the stabilized finite-type condition.

### Reserved rank export

Node `BorelRegulators:R.3/borel-rank-theorem`, with API name `BorelRegulators.borelRankTheorem`, states:

    dim_Q(K_(2n-1)(O_F) tensor_Z Q) = d_n(F), for every n>=2.

For odd n, 2n-1 is congruent to 1 modulo 4; for even n it is congruent to 3 modulo 4. Apply the special-linear K-model, rational primitive Hurewicz and the indecomposable calculation. Finite-dimensional scalar extension converts the real cohomological dimension to the rational rank. No finite-generation assumption is made.

Borel's Proposition 12.2, printed p.271 of the 1974 paper, is the checked source statement and is more general: it concerns orders in central division algebras. G4 therefore requires that generalization and the S-integer/field localization comparisons. Section 11.10 announces further S-arithmetic results; it is not a proof of them. The rank export here is a theorem target whose prerequisites remain partial, not an assumption or implementation claim.

## 6. R.4: the normalized map, its real isomorphism and its lattice

### Coefficient and target declarations

`BorelRegulators:R.4/real-tate-line` defines L_j and tau_j with j>=0. Its API is `BorelRegulators.realTateLine` for the real subspace, `BorelRegulators.realTateLineGenerator` for tau_j, and `BorelRegulators.realTateCoordinate` for the real-linear equivalence tau_j*a to a. Nonzero tau_j makes the inverse, division followed by real part, well-defined. Replacing tau_j by i^j generally rescales determinants by a nonrational factor and is not an innocuous choice.

`BorelRegulators:R.4/tate-quotient-projection` constructs C/L_n equivalent over R to L_(n-1), for n>=1. The proposed names are `BorelRegulators.tateQuotientProjection`, `BorelRegulators.tateProjection` and `BorelRegulators.tateQuotientInverse`. The inverse is inclusion of L_(n-1) followed by the quotient map. The eigenspace formula proves the kernel and image statements directly. The use of this quotient is checked against Tamme's Theorem 3.21.

`BorelRegulators:R.4/embedding-target` constructs V_n as the kernel of the real-linear operator sending a to the function a(c sigma)-epsilon_n*a(sigma). The API names are `BorelRegulators.regulatorTarget`, `BorelRegulators.regulatorTargetValue` and `BorelRegulators.mkRegulatorTarget`: respectively the subspace, evaluation at an embedding, and the constructor from a function with its parity proof. Equality of target vectors is pointwise equality; the eventual implementation must expose that extensionality through its function-subspace representation rather than require users to unfold the construction.

`BorelRegulators:R.4/target-coordinates` requires finite exhaustive disjoint orbit representatives. It proposes `BorelRegulators.targetCoordinates`, `BorelRegulators.targetCoordinateEvaluation` and `BorelRegulators.targetCoordinateExtension`. The inverse fills omitted conjugates with epsilon_n times the selected value and fills real embeddings by zero in even weight. Both composites are verified pointwise. A change of representative or ordering acts by a signed permutation, provided the coordinate-measure convention is retained.

`BorelRegulators:R.4/target-dimension` proposes `BorelRegulators.targetDimension`, the equality dim_R V_n=d_n. Its proof is the preceding coordinate equivalence followed by a count. It has no dependency on the Borel rank theorem. The embedding conventions are checked in Borel 1977, section 1.4; the remaining pinned finite-embedding and counting APIs are G5.

### The normalized universal class

`BorelRegulators:R.4/continuous-borel-class` constructs b_(n,N) in continuous H^(2n-1)(GL_N(C),L_(n-1)), for n>=2 and N>=n. Start with the universal topological Chern-character component Ch_n of the universal bundle in degree 2n with coefficients L_n, apply cohomological suspension, and then the compact-dual transport fixed above. This is the Chern-character component, not the universal Chern class c_n.

The public API consists of `BorelRegulators.continuousBorelClass`, `BorelRegulators.discreteBorelClass` for restriction to the discrete group, and `BorelRegulators.borelClassEvaluation` for pairing with group homology. The image in absolute Lie cohomology has the differential-form normalization

    -2*(n-1)!/(2n-1)! * pi_(n-1) Tr((g^(-1) dg)^(2n-1)).

Matrix multiplication and wedge products are part of this expression. Tamme's Lemma 3.20, printed pp.69–70, was checked for this normalization test. A continuation must assign or locate an early universal Chern-character and suspension construction and verify all compact-dual maps. `H.6` alone is not a certificate for these stronger constructions; G6 makes that boundary explicit.

`BorelRegulators:R.4/borel-class-conjugation`, named `BorelRegulators.borelClassConjugation`, states that conjugation on GL_N(C) pulls the normalized class back to epsilon_n times itself in the fixed real Tate coordinate. Track conjugation through the universal class and compact-dual construction, and use the displayed form as a sign test. Do not infer equality of relative classes solely from their absolute images without proving injectivity.

`BorelRegulators:R.4/borel-class-block-sum`, named `BorelRegulators.borelClassBlockSum`, states primitivity under the block map from GL_A(C) times GL_B(C) to GL_(A+B)(C): its pullback is the sum of the two factor classes in the common stable range. The proof uses additivity of Ch_n on direct sums and naturality of suspension, compact-dual transport and restriction. Adding a trivial block proves stabilization compatibility. The trace of a block-diagonal matrix is an independent formula check, not a replacement for naturality of the cohomological maps.

### Reserved regulator export

`BorelRegulators:R.4/borel-regulator` constructs the additive map

    rho^B_(F,n) : K_(2n-1)(O_F) -> V_n(F),
    rho^B(x)(sigma) = tau_(n-1)^(-1) <b_n, h(K(sigma restricted to O_F)(x))>.

The pairing lies in L_(n-1), so division by its designated generator gives a real number. The map K(sigma) is the covariant map induced by a ring homomorphism. Use ordinary integral Hurewicz to define evaluation; rational Hurewicz is not needed at this point. Conjugation places the values in V_n, and primitivity/additivity gives an additive map.

The API is `BorelRegulators.borelRegulator` for the intrinsic map, `BorelRegulators.borelRegulatorCoordinates` for composition with the chosen coordinates into R^d_n, and `BorelRegulators.borelRegulatorReal` for its unique real-linear extension from K_(2n-1)(O_F) tensor_Z R. The reserved ID exports the coordinate map with its normalization. Its construction uses neither a rank theorem nor finite generation.

The map construction is motivated by Tamme's section 3.6 and depends on the actual plus/Hurewicz infrastructure in `GeneralAlgebraicKTheory:K.2:plus`. The original R.4 also asks for the number-field K-group formulation. G4 requires the integral-to-field and S-integer comparisons; no such equivalence is silently inserted here.

### Nondegeneracy is a separate theorem

`BorelRegulators:R.4/regulator-real-isomorphism`, named `BorelRegulators.regulatorRealIsomorphism`, proves that rho^B tensor R is an isomorphism onto V_n for every number field and n>=2. Identify the normalized embedding classes with the compact-dual primitive basis, prove that their coefficient matrix is invertible, and dualize using primitive Hurewicz. Then check that the resulting dual map is the actual regulator evaluation matrix.

The equal-dimension argument alone is invalid. Showing that one class is nonzero somewhere is also insufficient to prove independence of all embedding classes. The complete normalized basis calculation is G7. It must not depend on finite generation, and its qualitative nondegeneracy must not be confused with the exact numerical determinant conversion required for zeta values.

### Lattice, covolume and changes of normalization

`BorelRegulators:R.4/regulator-lattice`, named `BorelRegulators.regulatorLattice`, states that the regulator kernel is precisely the torsion subgroup and its image is a full lattice. Here, and only here in this route, import `ArithmeticKTheory:N.3:finite-generation`. A finitely generated abelian group modulo torsion is free. Real injectivity shows that the kernel consists of torsion, while any torsion element maps to zero in a real vector space. The images of a free integral basis form a real basis, so their integer span is discrete and cocompact.

`BorelRegulators:R.4/regulator-covolume` defines R^B_n(F)=|det M|, where the columns are regulator coordinates on an integral basis of the K-group modulo torsion. Its API is `BorelRegulators.borelCovolume`, `BorelRegulators.regulatorMatrix` and `BorelRegulators.freeKQuotient`. The quotient's finite-free structure must be proved, not posited. Torsion-kernel proves independence of representatives. The empty determinant is 1.

`BorelRegulators:R.4/covolume-independence`, named `BorelRegulators.covolumeIndependence`, proves invariance under the integral basis and selected embedding representatives/orderings. An integral basis change right-multiplies M by an element of GL_d(Z) with determinant plus or minus one. A target change left-multiplies by a signed permutation. Taking absolute determinants proves invariance. The Tate generator and measure convention are held fixed: this is not invariance under arbitrary rescaling.

`BorelRegulators:R.4/covolume-scaling`, named `BorelRegulators.covolumeScaling`, is the comparison lemma for maps f=c*g from the same integral free group into the same measured real vector space. For nonzero real c and rank d, R(f)=|c|^d R(g). In compatible bases M_f=c M_g, so determinant homogeneity proves the formula. For d=0 it gives 1=1. This node will transport the Borel–Beilinson scalar to determinants.

The unresolved R.4 work is G5–G7 for baseline APIs, the normalized class and its nondegeneracy; G8 for the historical determinant conversion; and G11 for the full product and Adams-weight compatibility required by the source roadmap.

## 7. R.5: continuation, exact zero order and historical determinant lines

### Analytic objects belong to the analytic supplier

`AutomorphicLFunctionsAndLocalFactors:AL.1` must export a continued Dedekind zeta function agreeing with the pinned ideal LSeries on Re(s)>1. Its completed function uses

    Gamma_R(s) = pi^(-s/2) Gamma(s/2),
    Gamma_C(s) = 2*(2*pi)^(-s) Gamma(s),
    Lambda_F(s) = |D_F|^(s/2) Gamma_R(s)^r_1 Gamma_C(s)^r_2 zeta_F(s).

The functional equation is Lambda_F(s)=Lambda_F(1-s). The supplier must identify the actual functions and Haar/discriminant conventions, not merely offer a formal functional equation for an unrelated object. Positivity and nonvanishing at real s>1, exact gamma poles and ideal Euler products are also required. The upstream ArithmeticDirichletSeries roadmap supplies related series and Euler-product infrastructure, not a replacement for this continued analytic object.

### Leading coefficient and its zero order

`BorelRegulators:R.5/zeta-leading-coefficient` constructs the leading coefficient at s0=1-n after the exact zero order has been proved. The local analytic factorization is

    zeta_F(s) = (s-s0)^d_n * (a + O(s-s0)), a nonzero.

Use germs, remove the proved zero power, extend holomorphically and evaluate. Uniqueness is equality of analytic germs. Do not evaluate the raw totalized LSeries at s0 and call that the continued value. The API names are `BorelRegulators.continuedDedekindZeta`, which is an imported analytic object; `BorelRegulators.zetaNormalizedGerm`; and `BorelRegulators.zetaLeadingCoefficient`.

`BorelRegulators:R.5/zeta-zero-order`, named `BorelRegulators.zetaZeroOrder`, proves holomorphy at 1-n, zero order exactly d_n and a nonzero leading coefficient. At n>1 the Euler product and completed factors are nonzero. At 1-n, Gamma_C has a simple pole for every complex place, while Gamma_R has a simple pole precisely when n is odd. Factor these gamma functions into pole powers and holomorphic units. By the functional equation, the completed germ is a unit because its reflected value is at n. The zeta germ must therefore cancel exactly the combined pole order.

This proves an exact order, not just a lower bound. For a totally real field and n=2, the order is zero: -1 is not a pole or a forced zero of zeta_F. Borel 1977, section 1.4 and section 6.4, supplies the source-level parity and leading-term context. The analytic argument has no dependency on K-theory.

### The historical determinant is a different object

`BorelRegulators:R.5/borel77-determinant` defines R_m^77(F)>0 by the determinant-line comparison in Borel 1977, section 6.4. The two lattices come from the integral images in the rational homotopy of the compact-dual model and in rational arithmetic K-theory. Take their appropriate top exterior powers and dual lines. If x_m and y_m are the generators with compatible orientation, write

    j^*(x_m) = R_m^77(F) * y_m.

Here m=n-1 and the determinant degree is d_n, not [F:Q]. The API names are `BorelRegulators.borel1977Regulator`, `BorelRegulators.compactDualDeterminantLattice` and `BorelRegulators.arithmeticDeterminantLattice`. The necessary comparison nondegeneracy and integral compact-dual lattice remain part of G8. They are not assumed simply because a positive scalar has been named.

The historical object must not be defined by renaming R^B_n or by inserting an unproved rational multiple. Conversion requires tracking the integral compact-dual homotopy lattice, Chern-character normalization, cohomological suspension, factorials, powers of pi, Tate coordinates and measures.

### The checked proportionality statement

`BorelRegulators:R.5/borel77-leading-term`, named `BorelRegulators.borel77LeadingTerm`, states

    zeta_F^*(1-n) / (pi^d_n * R_(n-1)^77(F)) belongs to Q^x.

The primary locators are Theorem 6.2 and section 6.4, equation (5), printed p.633, read with the 1980 erratum. The historical pi factor is part of this statement. It does not certify that zeta_F^*(1-n)/R^B_n is rational under this document's separate coordinate normalization. Nor is this rational proportionality the integral Lichtenbaum formula with torsion and dyadic factors.

The original proof involves compact cycles, nonzero primitive restrictions, finite-place volumes and archimedean determinant factors. G8–G9 require their proof decomposition. Citing the final displayed formula does not close those dependencies.

The 1980 correction was read in full. It fixes an oriented discriminant square root by an ordered integral-basis embedding determinant, replaces absolute discriminants by discriminants in the indicated rational expressions, and removes specified powers of i in the formulas of sections 5.5 and 6.2. Precisely, the listed replacements concern the 1977 text at p.616 third line from the bottom, p.627 fifth line from the bottom, and p.628 line 2; the deleted i factors are in 5.5(1), 5.5(4) and 6.2(5). A continuation must use the corrected chain, not combine the corrected conclusion with uncorrected intermediate rational structures.

## 8. R.6: the part of the Tamagawa route actually decomposed

The original stage requires the adelic and Tamagawa description used in Bloch's first four lectures. Those lectures were not accessed in this run. Two explicit nodes isolate the split finite-place portion accessible from Borel's public paper. They are useful prerequisites, not a claim that the global Tamagawa argument has been supplied.

`BorelRegulators:R.6/split-local-volume-factor`, named `BorelRegulators.splitLocalVolumeFactor`, considers a nonarchimedean local ring of integers O with residue cardinality q and r>=2. For the smooth split SL_r/O model with the integral invariant gauge form and additive O-volume one,

    volume(SL_r(O)) = product_(j=2,...,r) (1-q^(-j)).

Each smooth reduction fiber has measure q^(-(r^2-1)). Count GL_r over the residue field by choosing successively independent columns, and divide by q-1 through the surjective determinant map to obtain the number of SL_r points. Multiplying by the fiber volume gives the displayed factor. `AdelicAlgebraicGroups:AA.3` is requested for the exact smooth-model measure theorem.

The normalization matters. Compact-open probability measure gives SL_r(O) volume one instead. The split integral gauge measure is not yet the globally discriminant-normalized Tamagawa measure. Non-split or ramified integral models require their own local statement. The basic acceptance test is r=2, yielding 1-q^(-2).

`BorelRegulators:R.6/finite-euler-volume-product`, named `BorelRegulators.finiteEulerVolumeProduct`, states that for a number field F,

    product_(v finite) product_(j=2,...,r) (1-Nv^(-j))
      = product_(j=2,...,r) zeta_F(j)^(-1).

The product converges absolutely and is positive and nonzero. AL.1 supplies the convergent ideal Euler products. Interchanging a finite product with these absolutely convergent products is legitimate. Removing finitely many places introduces the inverse of exactly the removed local factors; no global quotient-volume statement follows merely from this identity.

Borel 1977, section 2.4, printed pp.618–619, is the public source locator. G9 still requires the actual adelic quotient, convergence factors and global gauge measure; product-formula and discriminant/archimedean conversions; finite volume or compactness for each group used; compact cycles and their nonzero primitive restrictions; and the rationality/Tamagawa theorem with exact hypotheses. The comparison with the cohomological determinant must be constructed. Importing the desired Borel conclusion to prove its own reformulation would be circular.

## 9. R.7: the independent Beilinson map, scalar and compatibility tests

### Independent construction and the ownership problem

`BorelRegulators:R.7/beilinson-regulator` constructs the embeddingwise Beilinson regulator into H_D^1(Spec C,R(n))=C/L_n, applies the explicit real quotient projection and divides by the same tau_(n-1) used for the Borel map. Its target is V_n(F). The universal class is again the Chern-character component, not c_n.

The API is `BorelRegulators.beilinsonRegulator` for the intrinsic map, `BorelRegulators.beilinsonEmbeddingClass` for its class in C/L_n at an embedding, and `BorelRegulators.beilinsonRegulatorCoordinates` for the coordinate presentation. The conjugation relation comes from the independent Deligne real structure, not from assuming the desired equality with the Borel regulator.

The relevant supplier texts were checked. `MotivicEtaleKTheory:M.6` constructs motivic spectral sequences and rational weights. The real Deligne cycle-class and regulator construction belongs to `M.8`. But the atlas places M.8 downstream of R.7. Importing the whole M.8 to define the input of R.7 would introduce a cycle.

The packet therefore requests an early construction-only export inside the motivic owner: the Deligne complex, cycle-class map and higher-K Chern-character compatibility, independent of the Borel comparison. R.7 remains responsible for the archimedean scalar comparison; the remaining M.8 applications consume it. No new supplier node or stage identifier is invented, and no other roadmap is edited. The packet's `restructure` entry records this rescope for the orchestrator. G10 remains until an agreed producer is available.

### Exact scalar and determinant factor

`BorelRegulators:R.7/borel-beilinson-factor`, named `BorelRegulators.borelBeilinsonFactor`, states

    rho^B_(F,n) = 2 * r^Beil_(F,n), for n>=2,

with both maps valued in the same V_n and using identical real Tate-coordinate conversion. Tamme's Theorem 3.21, printed pp.70–71, was read together with its displayed proof. It compares the universal constructions over C, using relative K-theory, vanishing of odd topological K-theory, the relative Chern-character comparison and two cocycle descriptions. The coefficients differ by two. Evaluation on Hurewicz and the embedding maps then gives the number-field formula.

The proof invokes Theorem 3.11 and Propositions 3.16 and 3.18. Their full statements and proof interiors were not independently audited here. G10 explicitly requires those checks, the relevant surjectivity and every comparison map. The factor is checked at the theorem and displayed-proof level; that is not a completed recursive proof decomposition.

`BorelRegulators:R.7/borel-beilinson-determinant`, named `BorelRegulators.borelBeilinsonDeterminant`, deduces

    R^B_n(F) = 2^d_n * R^Beil_n(F)

using the same integral K-lattice and the same target measure. This is determinant homogeneity applied to the map equality, with the target-dimension theorem fixing the exponent. In dimension zero both determinants are one. Comparing determinants formed with different lattices or differently normalized measures would not justify this formula.

### Restriction and trace on the target

`BorelRegulators:R.7/embedding-restriction-and-trace` considers a finite extension L/F of number fields. Define P:V_n(F)->V_n(L) and T in the reverse direction by

    (P a)(tau) = a(tau restricted to F),
    (T b)(sigma) = sum_(tau extending sigma) b(tau).

Every embedding of F into C has [L:F] extensions, since the extension is separable. Conjugation commutes with restriction and permutes each extension fiber onto the conjugate fiber. Consequently both formulas preserve the required parity and define real-linear maps. There is no extra factor one-half attached to a complex pair.

The API names are `BorelRegulators.targetRestriction`, `BorelRegulators.targetTrace` and `BorelRegulators.embeddingExtensionFiber`. G5 asks for the pinned finite-embedding extension-count API. The mathematical formulas do not certify that particular library names already exist.

`BorelRegulators:R.7/trace-after-restriction`, named `BorelRegulators.traceAfterRestriction`, proves T composed with P equals [L:F] times the identity. Each summand over an extension fiber is the same a(sigma), so this is the fiber-count theorem followed by function extensionality. At a real embedding in even weight, conjugate nonreal extensions cancel in the trace of an arbitrary target vector. This cancellation does not alter the formula for T P.

### K-theory transfer compatibility

`BorelRegulators:R.7/regulator-restriction-transfer`, named `BorelRegulators.regulatorRestrictionTransfer`, states that scalar extension and restriction-of-scalars transfer commute with the regulator through P and T:

    rho_L^B composed with res = P composed with rho_F^B,
    rho_F^B composed with tr  = T composed with rho_L^B.

Here O_L is finite projective over O_F and tr is the actual exact-functor transfer on finite projective modules. Restriction is functoriality of ring maps and Hurewicz. For transfer, base-change a restricted module to C and decompose it as the direct sum indexed by extensions of the chosen embedding. Use the K-theory base-change comparison and block primitivity of the class.

`GeneralAlgebraicKTheory:K.7` is requested for those maps and their compatibility, not just an equality of ranks. G11 records the remaining source/API audit. The source roadmap also requires products and Adams weight n; separate map-level statements and proofs must be supplied. They are not consequences of the trace formula alone.

### Low-dimensional acceptance cases

`BorelRegulators:R.7/zero-dimensional-test`, named `BorelRegulators.zeroDimensionalTest`, treats totally real F and even n>=2. All target values vanish by parity, so V_n=0 and both maps are zero. The rank and lattice theorems show the torsion-free K-quotient has rank zero; both covolumes are one by the empty determinant convention. The analytic zero-order theorem says the zeta function has order zero at 1-n. The case F=Q, n=2 is mandatory. No numerical value at -1 is inferred from the pinned raw LSeries definition.

`BorelRegulators:R.7/imaginary-quadratic-target-test`, named `BorelRegulators.imaginaryQuadraticTargetTest`, treats imaginary quadratic F and n=2. The two embedding values have the form (a,-a). Choosing the conjugate representative negates the scalar regulator and leaves its absolute covolume unchanged. The Borel–Beilinson determinant factor is two because d_2=1.

This is not yet the Bloch–Wigner test required by the full stage. `Polylogarithms:P.2` must supply the exact K_3/Bloch-group comparison, its integral versus rational or torsion quotient convention, and the dilogarithm sign and scalar in the same Tate coordinates. A one-dimensional target alone does not identify two maps. G11 records this missing comparison explicitly.

## 10. Cross-roadmap boundaries and recursive remaining work

The two complete upstream roadmap documents read for architecture and density were ArithmeticDirichletSeries and RepresentationTheory/LieGroups. The first provides series, Euler-product and related analytic infrastructure, while the continued completed zeta function is assigned to AL.1. The second provides Lie/matrix-group infrastructure but does not by itself supply arithmetic stable cohomology, quotient comparisons or the normalized universal regulator class. Campaign supplier texts read include GeneralAlgebraicKTheory, ArithmeticKTheory, StableHomotopyKTheory, AutomorphicFormsOnReductiveGroups and AutomorphicLFunctionsAndLocalFactors; the relevant M.6–M.8 sections of MotivicEtaleKTheory were checked.

The eleven requests name AA.3, ALS.2, ALS.5, AF.1a, K.2:plus, H.6, N.3:finite-generation, AL.1, the early construction-only portion of M.8, K.7 and P.2. The packet gives the exact requested statement and consuming node IDs. The early M.8 request is a scope repair, not an import of the currently cyclic whole stage. P.2 requests the missing explicit comparison, not a claim that the imaginary-quadratic target calculation already depends on an established dilogarithm formula.

G1 requires cochain descent, quotient comparisons, finite-index independence and compact-dual maps. G2 requires the actual special-linear K-space and rational H-space theorem with verified finite-type hypotheses. G3 requires source decomposition of the analytic stability estimates and the full compact-dual table. G4 restores orders in central division algebras and the correct S-integer and field localization statements.

G5 requires the remaining pinned API audit for embeddings, finite-free quotients, determinants, germs and lattice measures. G6 requires the universal Chern-character/suspension producer and conjugation/block naturality. G7 requires the normalized primitive-basis matrix and its nondegeneracy. These gaps must be resolved before calling the reserved exports proof-ready, even though the exports' mathematical statements and interfaces are fixed.

G8 is the exact historical-determinant versus coordinate-covolume conversion. G9 is the independent global Bloch/Tamagawa route, including access to the required lectures or a fully adequate primary-source substitute. G10 is the early Deligne construction and Tamme's imported proof interiors. G11 is transfer/product/Adams and explicit weight-two comparison work. G12 is the full repository validator and pinned declaration-index check. Local structural success does not remove any mathematical gap.

Every coverage record remains partial with its own explicit continuation list. The current local dependency graph is acyclic; a structural check on local node IDs does not certify that future supplier exports will be free of global cycles. In particular, resolving the M.8 split requires an orchestrator decision and a refreshed global graph, not merely a fresh name.

## 11. Source ledger and verification limits

All sources were consulted on 2026-09-16. The packet records their public URLs, edition/version, exact locators and read-section boundaries. The bibliography is:

**Borel 1974.** Armand Borel, *Stable real cohomology of arithmetic groups*, Ann. Sci. ENS (4) 7 (1974), 235–272, DOI 10.24033/asens.1269. The inspected scans include printed pp.266–268 and 270–271, with Proposition 12.2. The complete compact-dual table and analytic proof interiors were not fully audited.

**Borel 1977.** Armand Borel, *Cohomologie de SL_n et valeurs de fonctions zeta aux points entiers*, Ann. Scuola Norm. Sup. Pisa (4) 4 (1977), 613–636. Readings include the introduction, sections 1.1–1.6, parsed sections 2.1–2.4, and the scans of pp.630–634 covering the end of 5.5, 5.6, Theorem 6.2, 6.3, 6.4 and the opening of section 7. Most proof interiors of sections 4–5 remain unaudited.

**Borel 1980.** The erratum in Ann. Scuola Norm. Sup. Pisa (4) 7 (1980), p.373, was inspected in full. Its discriminant and i-factor corrections are part of the source convention here.

**Tamme 2010.** Georg Tamme, *The Relative Chern Character and Regulators*, Regensburg dissertation, arXiv:1007.1385v1, 8 July 2010. Section 3.6, printed pp.69–71, was read, including the compact-dual chain, Lemma 3.20, Theorem 3.21 and its proof. The statements/proof interiors of its referenced Theorem 3.11 and Propositions 3.16/3.18 still need independent checking.

The source roadmap is itself a specification, not a primary proof. Nodes citing a roadmap milestone are explicitly marked as construction goals or elementary deductions with their supplied hypotheses. The primary-source excerpts in the packet are deliberately short locator tokens, not copied book passages. No source-file hash is fabricated when PDF bytes were not downloaded. No PDF or extracted book-text dump is included in the repository. Bloch's lectures were not accessed and are not described as verified.

## 12. Validation and submission status

The worker ran JSON parsing and a custom local consistency checker. Both exited zero. The checks covered exact scope, reserved IDs, 36 unique nodes, 64 API entries, declared local/baseline/supplier references, local dependency acyclicity, README node/API coverage, scope vocabulary and private-path/Lean-code checks. Elementary rank/Gamma parity and determinant scaling/permutation sanity checks also passed. They are not proofs of the analytic or K-theoretic results.

The actual repository command is

    python3 scripts/check_blueprint.py research/blueprint/packets/BorelRegulators.json

It requires the real repository world and, for declaration existence checks, the pinned declaration index. These were not present together in the local execution container, so this command was not run locally and no reduced atlas was fabricated to make it pass. The existing pull-request workflow covers this packet, fetches both pinned trees and generates the index. Its observed outcome belongs in the PR checks and submission comment; local checks do not predict or replace that outcome.

The initial mathematical inputs were read at `49f74b4d2bace99a76ceff4ac2199a3384c83c57`. Before submission, main had advanced to `1338883fe31f3b357dd91b7d5916e76e3b950c81`. The Borel source roadmap, pins and checker were unchanged. Browser-sized atlas extracts and instructions were added or updated; the instructions and Borel extract were rechecked. The branch `cgp-504c2b4122bc/BP-BorelRegulators` isolates only this job's three files.

The work remains subject to full validation, continuation and an independent review under the repository's account/agent requirements. Submission does not integrate the packet, close the issue or mark the job done. The companion handoff identifies the exact next proof and source checks while preserving both reserved identifiers.
