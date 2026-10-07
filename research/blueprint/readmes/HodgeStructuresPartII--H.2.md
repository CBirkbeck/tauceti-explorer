# Variations, canonical extensions and fixed parts — H.2

This continuation begins with the intrinsic fibre theory already in Tau Ceti and the common pure variation planned by ShimuraData:D3. Its new work is the complex polarized variation without a real form or lattice, the mixed/admissible interfaces, logarithmic canonical extension, Gauss–Manin coefficient variations, fixed parts and connected monodromy. The parent H.0 supplies connections and their operations. Period manifolds and derivatives remain H.3; parabolic degrees and stability remain H.4; rigidity and arithmetic models remain H.5; pure nilpotent-orbit estimates and semistable degeneration remain H.6. H.2 never depends on H.6, which consumes this interface.

The target-level planning pass is **complete**, and stage **HodgeStructuresPartII:H.2 is planned**. It has 31 declaration nodes, 56 API items, 45 discriminatory tests and six planets. Its 18 gaps and 12 supplier requests are part of the mathematical plan. Each declaration has implementation status unchecked. The packet is not closed: the remaining work is stated at the end, and an independent review determines the next refinement pass.

## Conventions and the library boundary

A decreasing Hodge filtration is indexed by integers, with type (p,n−p) in pure weight n. Real/rational fibres satisfy F^p complementary to conjugate F^(n+1−p), using their actual conjugation. A complex polarized variation instead carries its smooth type decomposition and flat Hermitian form; it need not carry conjugation or an integral lattice. We use the Landesman–Litt sign convention: (−1)^p ψ is positive on the p-th summand, and for a real bilinear polarization ψ=i^(−n)Q(−,conjugate(−)). Tate K(m) has weight −2m and type (−m,−m).

For a punctured-disc coordinate s=exp(2πiz), N means log T. In a logarithmic frame ∇=d+A ds/s the positive-loop monodromy is exp(−2πiA), so A=−N/(2πi) on the unipotent branch. The canonical strip is 0≤Re(α)<1. Canonical extension is exact on arbitrary local systems, while ordinary tensor/dual compatibility is asserted on the unipotent branch. Two residues 3/4 sum to 3/2, which must be shifted to 1/2 for the tensor's canonical extension.

Admissibility in the finite-cover interface explicitly assumes quasi-unipotence. The unipotent criterion requires both a graded-compatible extended Hodge flag and a relative monodromy filtration; nilpotence alone does not supply the latter. LL24 uses real mixed Hodge modules for arbitrary orthogonal coefficients. Its broader real-exponent convention is a separate recorded comparison gap, rather than an inferred quasi-unipotence statement.

The fixed part of a mixed variation is a mixed Hodge structure. Its underlying vector space is the existing native monodromy invariant module. A real form of an irreducible complex system is a choice when it exists; quaternionic self-conjugacy is not real descent. Connected algebraic monodromy is semisimple under a preserved integral lattice and polarizability. Arbitrary complex PVHS gives reductivity; an irrational unitary line gives connected closure G_m.

The baseline is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. The reviewed library audit has no HodgeStructuresPartII entry. It records parent L0/L1/L3 built and L2 partly built; the following actual declarations were read at the pins and are reused.

- **tauceti:TauCeti.LocalCoefficientSystem**, TauCeti/AlgebraicTopology/LocalCoefficient.lean: Functor FundamentalGroupoid X to ModuleCat R, with no global trivialization or freeness implicit.
- **tauceti:TauCeti.LocalCoefficientSystem.constantFunctor**, TauCeti/AlgebraicTopology/LocalCoefficient.lean: Constant local coefficient system of a supplied module.
- **tauceti:TauCeti.LocalCoefficientSystem.pullback**, TauCeti/AlgebraicTopology/LocalCoefficient.lean: Contravariant pullback along continuous maps, with native identity/composition natural isomorphisms.
- **tauceti:TauCeti.LocalCoefficientSystem.transport**, TauCeti/AlgebraicTopology/LocalCoefficient.lean: Path-class transport as an R-linear equivalence of fibres.
- **tauceti:TauCeti.LocalCoefficientSystem.monodromyRepresentation**, TauCeti/AlgebraicTopology/LocalCoefficient.lean: Representation of FundamentalGroup X x on the actual fibre, with constant and pullback comparisons.
- **tauceti:TauCeti.Hodge.HodgeStructureOn**, TauCeti/Geometry/Hodge/Structure.lean: Bounded decreasing filtration F on a complex vector space with a supplied conjugation, satisfying F^p complementary to conjugate F^(n+1−p); F_bot follows from opposedness.
- **tauceti:TauCeti.Hodge.MixedHodgeStructure**, TauCeti/Geometry/Hodge/Mixed/Basic.lean: Finite rational W, finite complex F and pure rational weight-graded pieces after abstract base change; its integral carrier is an arbitrary abelian group, not a finite free lattice.
- **tauceti:TauCeti.Hodge.MixedHodgeStructure.gradedHodgeStructure**, TauCeti/Geometry/Hodge/Mixed/Basic.lean: Pure weight-k structure on the complexified rational W_k/W_(k−1), with F exactly the induced filtration.
- **tauceti:TauCeti.Hodge.MixedHodgeStructure.Hom**, TauCeti/Geometry/Hodge/Mixed/Morphism.lean: A single rational linear map preserving W whose derived complexification preserves F; no independent unrelated complex map.
- **tauceti:TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_F_eq_map_F**, TauCeti/Geometry/Hodge/Mixed/Strictness.lean: Every native mixed Hodge morphism is strict for F.
- **tauceti:TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_WQ_eq_map_WQ**, TauCeti/Geometry/Hodge/Mixed/Strictness.lean: Every native mixed Hodge morphism is strict for rational W.
- **mathlib:Representation.invariants**, Mathlib/RepresentationTheory/Invariants.lean: Submodule of vectors fixed by every element of a group representation.
- **mathlib:Representation.mem_invariants**, Mathlib/RepresentationTheory/Invariants.lean: Membership is equivalent to ρ(g)v=v for every g.

Native MixedHodgeStructure takes an arbitrary abelian integral carrier, not a finite free lattice. A rational model uses V_Z=V_Q as a Z-module with the identity rational base-change map. Its native Hom has one rational linear map and its derived complexification; both strictness theorems are already present. The full real analogue and coefficient-general polarization still need the upstream L1/L2 extensions.

## Imports and ownership

The exact imports from the accepted parent packet are HodgeStructuresPartII:H.0/intrinsic-preconnection, /intrinsic-curvature, /griffiths-filtration, /intrinsic-tensor and /intrinsic-dual. The common pure carrier, integral polarization and local flat-bundle description are ShimuraData:D3/variation, /polarized-integral-variation and /flat-bundle-local. Generic ordinary and relative monodromy filtrations remain LefschetzPencilsAndVanishingCycles:LPV.1/monodromy-filtration and /relative-monodromy-uniqueness. H.2 only imposes their supplied contract in its admissibility predicate.

ShimuraData and the LPV.0 supplier packet currently have needs_changes reviews. Their exact node statements are planning inputs, not native or accepted implementations. ComplexComparisonPartII is a pending repair packet. Its exact proper comparison, proper coherent pushforward and sheaf/singular comparison nodes are reused; coefficient/logarithmic/relative strengthening is requested from C5. Intrinsic Hodge theory does not provide the geometric cohomological Hodge theorem. The upstream document points to its separate bicomplex sibling, which is a routing lead for the cohomological engine.

The six planets are Complex polarized variation, Variation of mixed Hodge structure, Admissible variation, Deligne canonical extension, Gauss–Manin connection and Theorem of the fixed part. Group-valued monodromy remains in the detailed declaration graph without adding a seventh planet.

## Declaration graph

Each item below is one target-level declaration. Its direct prerequisites identify the library or owning supplier. The proof paragraphs record the named engines and their boundaries; missing proofs remain gaps. API names and tests also appear in the suggested file, as signatures where the present carriers allow them and as explicit omission entries otherwise.

### Complex polarized variation of Hodge structure

**HodgeStructuresPartII:H.2/complex-pvhs** · definition · proposed name **ComplexPVHS**.

For a complex manifold S and n∈Z, a complex PVHS is a finite-rank complex local system L, the associated smooth flat bundle (V,D), a finite smooth decomposition V=⊕_(p+q=n)V^(p,q), and a D-flat nondegenerate Hermitian form ψ. Different summands are ψ-orthogonal; (−1)^p ψ is positive definite on V^(p,n−p). D maps V^(p,q) into A^(1,0)(V^(p,q)⊕V^(p−1,q+1)) ⊕ A^(0,1)(V^(p,q)⊕V^(p+1,q−1)). The holomorphic structure is D^(0,1); F^a=⊕_(p≥a)V^(p,n−p) is a holomorphic subbundle and D F^a⊂F^(a−1)⊗Ω¹. No conjugation, rational form, lattice or quasi-unipotence is implicit.

Hypotheses: S complex manifold; rank locally finite and constant on components; pure weight n.

Construction or proof:

1. Use the native local coefficient functor and the H.0 flat-connection interface. Impose the displayed smooth differential condition, orthogonality and positivity; derive holomorphic F from D^(0,1).
2. Compare real/rational complexifications with ShimuraData:D3/variation; ψ is the sesquilinear polarization, not the integral bilinear form itself.

Direct prerequisites: **tauceti:TauCeti.LocalCoefficientSystem**, **ShimuraData:D3/variation**, **ShimuraData:D3/flat-bundle-local**, **HodgeStructuresPartII:H.0/intrinsic-preconnection**, **HodgeStructuresPartII:H.0/intrinsic-curvature**, **ComplexComparisonPartII:C0**.

Uses:

- LL22 Proposition 4.1.4: The decomposition and ψ supply semisimplicity and shifted isotypic summands.
- HodgeStructuresPartII:H.3 and H.5: The holomorphic F supplies period derivatives; no integral lattice may be added to arbitrary complex PVHS.

API:

- **ComplexPVHS.localSystem** (projection): Forget decomposition and polarization to the native complex local coefficient system.
- **ComplexPVHS.hodgeFiltration** (data): F^a=⊕_(p≥a)V^(p,n−p); its associated holomorphic bundle is defined by D^(0,1).
- **ComplexPVHS.pullback** (functoriality): Holomorphic pullback pulls back L,D,ψ and each smooth summand; identity/composition agree with native local-system pullback.
- **ComplexPVHS.ofReal** (compatibility): The complexification of a polarized real variation has the same opposed F and ψ(v,w)=i^(−n)Q(v,conjugate(w)) in the LL sign convention, with Q normalized so i^(2p−n)Q(v,conjugate(v))>0.
- **ComplexPVHS.hom** (characterisation): A morphism is a flat complex-linear map preserving each Hodge summand; preservation of the polarizing form is not required.

Unit tests:

- **ComplexPVHSTest.lineFiltration** (computation): For a constant type-(p,n−p) line, F^a is top iff a≤p, and bottom otherwise.
- **ComplexPVHSTest.zeroRank** (degenerate): The zero local system has the unique zero decomposition and vacuous positive-definiteness.
- **ComplexPVHSTest.noRealSymmetry** (non-example): A weight-zero line of type (1,−1) is a complex PVHS but cannot be a nonzero real Hodge structure of that sole type, because conjugation would require (−1,1).
- **ComplexPVHSTest.nativeRealFiber** (compatibility): For a real variation complexified with its actual conjugation, its fibre F is the F of HodgeStructureOn, including n-opposedness.

Acceptance:

- A type-(p,n−p) constant line has F^a=C for a≤p, zero otherwise, and ψ=(−1)^p z conjugate(w).
- An infinite-image unitary line of type (0,0) is allowed.

Sources: [LL22](https://arxiv.org/pdf/2202.00039v3), Definitions 4.1.1–4.1.2, pp.27–28: Exact smooth, Hermitian and differential convention; no real structure required..

Suggested-file scope: Pointwise rational/complex fibre, necessary disc data, rank-one residue or constant/product-family shadow only. No full global carrier or theorem is asserted. Remaining full signatures use G1.

### Realification of a complex polarized variation

**HodgeStructuresPartII:H.2/realification** · construction · proposed name **ComplexPVHS.realification**.

For a complex PVHS L of weight n, L⊕conjugate(L) has the canonical real form {(v,conjugate(v))}; conjugation exchanges factors. Put the conjugate of L^(q,p) in bidegree (p,q) on the second factor and extend F by direct sum. The corresponding real bilinear polarization is chosen with the fixed weight sign so that its associated Hermitian form restricts to ψ on L. This gives a polarizable real VHS with L as a complex Hodge direct summand. A pre-existing real form on L is additional choice, not produced canonically by this construction.

Hypotheses: Finite-rank complex PVHS of weight n.

Construction or proof:

1. Swap the two factors conjugate-linearly; compute the fixed locus and its scalar extension.
2. Pair complementary bidegrees using ψ and its conjugate, with the parity sign (−1)^n; verify opposedness, positivity and transversality factorwise.

Direct prerequisites: **HodgeStructuresPartII:H.2/complex-pvhs**, **ShimuraData:D3/variation**, **tauceti:TauCetiRoadmap/HodgeStructures#milestone-l1--polarization--hodgeriemann-semisimplicity-summit-of-the-pure-theory**.

Uses:

- Del87 §1.11: Reduces the complex fixed-part theorem to real analytic fixed part.
- LL24 Theorem 4.2.2: Provides a real recipient when an irreducible complex system has no real form.

API:

- **ComplexPVHS.realification** (constructor): Real polarized variation on the canonical fixed locus of L⊕conjugate(L).
- **ComplexPVHS.realificationComplexEquiv** (equivalence): Its complexification is isomorphic to L⊕conjugate(L), respecting connection and Hodge type.
- **ComplexPVHS.realificationInclusion** (projection): The complex inclusion of L is flat and preserves Hodge type.
- **ComplexPVHS.realificationMap** (functoriality): A flat Hodge map f induces f⊕conjugate(f), with identity and composition laws.

Unit tests:

- **RealificationTest.rankOne** (computation): A complex line realifies to a real plane; its complexification has complex dimension two.
- **RealificationTest.typeSwap** (computation): A complex (1,−1) line yields real types (1,−1) and (−1,1), not two copies of (1,−1).
- **RealificationTest.alreadyReal** (compatibility): For L=V_R⊗C, canonical doubled realification is V_R⊕V_R, not a canonical choice of one summand.

Acceptance:

- Real dimension is twice complex rank, not four times.
- Conjugation swaps both the factors and p,q; simply taking the same type in both factors fails.

Sources: [Del87](https://publications.ias.edu/sites/default/files/56_Untheoremede.pdf?download=1), §1.11, printed p.8: Complex variations are treated by adding their complex conjugate.; [Timm87](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0379/LOG_0011.pdf), Theorem 7.1 proof, pp.169–170: Unitary special case: V⊕V dual and fixed real subsystem..

Suggested-file scope: Pointwise rational/complex fibre, necessary disc data, rank-one residue or constant/product-family shadow only. No full global carrier or theorem is asserted. Remaining full signatures use G1/G2.

### Real and rational variations of mixed Hodge structure

**HodgeStructuresPartII:H.2/mixed-variation** · definition · proposed name **MixedVariation**.

For K=Q or R on a complex manifold S, a VMHS is a finite-rank K-local system L with a bounded increasing filtration W by local subsystems and a bounded decreasing filtration F by holomorphic subbundles of E=L⊗_K O_S. Each fibre (L_s,W_s,F_s) is a mixed K-Hodge structure; equivalently Gr^W_k with induced F is a pure weight-k variation. Require Griffiths transversality ∇F^p⊂F^(p−1)⊗Ω¹. Morphisms are flat K-linear maps preserving W and F; complex maps are derived by scalar extension. The rational fibres use the native MixedHodgeStructure through V_Z=V_Q as a Z-module and identity rational model, with no finite free Z-lattice implied. Complexification of a real VMHS is provided; arbitrary complex mixed variations require two opposed filtrations and are not silently identified with real ones.

Hypotheses: K=Q or R; finite rank; bounded filtrations locally uniformly; locally free graded holomorphic bundles.

Construction or proof:

1. Import pure variations and the fibre mixed-Hodge/strictness interface; form weight subsystems and induced pure variations.
2. The connection on each weight subsystem is induced by the native local system. F is analytic, not a collection of independently chosen fibre flags.

Direct prerequisites: **tauceti:TauCeti.LocalCoefficientSystem**, **tauceti:TauCeti.Hodge.MixedHodgeStructure**, **tauceti:TauCeti.Hodge.MixedHodgeStructure.Hom**, **ShimuraData:D3/variation**, **HodgeStructuresPartII:H.0/griffiths-filtration**, **tauceti:TauCetiRoadmap/HodgeStructures#milestone-l2--mixed-hodge-structures-strictness-deligne**.

Uses:

- SZ85 §4 and LL24 §4.2: The fixed part and evaluation maps are morphisms of mixed variations.
- HodgeStructuresPartII:H.6: Boundary weight filtration is transported as a local subsystem.

API:

- **MixedVariation.localSystem** (projection): Underlying native K-local coefficient system.
- **MixedVariation.fiber** (data): Native rational MHS, or the requested real analogue, at s, with the actual W and F.
- **MixedVariation.hom** (characterisation): Flat K-map preserving W and F; its complex action is its base change.
- **MixedVariation.pullback** (functoriality): Holomorphic pullback preserves both filtrations, identity and composition.
- **MixedVariation.ofPure** (constructor): A pure weight-n variation has W_k=0 for k<n and W_k=L for k≥n.

Unit tests:

- **MixedVariationTest.pureWeight** (computation): For ofPure(V,n), Gr^W_k=0 unless k=n and Gr^W_n=V.
- **MixedVariationTest.zero** (degenerate): Rank zero satisfies all bounds, opposedness and transversality.
- **MixedVariationTest.nativeFiber** (compatibility): Over a point, rational VMHS is the native MixedHodgeStructure with V_Z=V_Q; a morphism is exactly its native Hom.
- **MixedVariationTest.nonflatWeight** (non-example): On a disc the moving line span((1,z)) in the trivial rank-two flat bundle cannot serve as W_0, although it is a holomorphic line subbundle.

Acceptance:

- Flatness of W is mandatory; F need not be flat.
- A rational VMHS does not automatically possess an integral lattice.

Sources: [SZ85](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0080/LOG_0032.pdf), Definitions 3.4–3.5, pp.508–509: Bounded W by subsystems, F by subbundles and pure graded variation..

Suggested-file scope: Pointwise rational/complex fibre, necessary disc data, rank-one residue or constant/product-family shadow only. No full global carrier or theorem is asserted. Remaining full signatures use G1/G2.

### Weight-graded pure variation

**HodgeStructuresPartII:H.2/graded-variation** · construction · proposed name **MixedVariation.graded**.

For a mixed K-variation V and k∈Z, the quotient subsystem W_k/W_(k−1), induced holomorphic filtration (F^p∩W_k+W_(k−1))/W_(k−1), and induced connection form a pure weight-k K-variation. For rational fibres this agrees with MixedHodgeStructure.gradedHodgeStructure, through the rational quotient/base-change identification. A mixed morphism induces a pure graded morphism, functorially.

Hypotheses: A mixed variation; k∈Z.

Construction or proof:

1. Construct quotient local systems using the supplier sheaf/module exactness; induced F is locally free by strictness.
2. Identify fibre quotients with native rational weightGradedRat; invoke the defining graded purity and induced transversality.

Direct prerequisites: **HodgeStructuresPartII:H.2/mixed-variation**, **tauceti:TauCeti.Hodge.MixedHodgeStructure.gradedHodgeStructure**, **tauceti:TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_F_eq_map_F**, **EnhancedDerivedSheaves:E1**.

Uses:

- LL24 §4.1 and Theorem 4.2.2: Weight graded polarization and the irreducible constituent are found on Gr^W.
- HodgeStructuresPartII:H.6: Relative monodromy is centred at k on this quotient.

API:

- **MixedVariation.graded** (constructor): Gr^W_k as a pure variation.
- **MixedVariation.gradedFiber** (compatibility): The rational fibre equals native gradedHodgeStructure under quotient base change.
- **MixedVariation.gradedMap** (functoriality): Induced quotient maps preserve identity/composition and the induced Hodge filtration.

Unit tests:

- **GradedVariationTest.pure** (computation): Gr^W_n(ofPure(V,n))≅V.
- **GradedVariationTest.otherWeight** (degenerate): Gr^W_k(ofPure(V,n))=0 for k≠n.
- **GradedVariationTest.native** (compatibility): Its rational fibre filtration is exactly native gradedF, not the restriction of F to W_k without quotienting.

Acceptance:

- For a pure input only its weight-n quotient survives.

Sources: [SZ85](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0080/LOG_0032.pdf), Definition 3.4, p.508: The defining weight-graded pure variation..

Suggested-file scope: Pointwise rational/complex fibre, necessary disc data, rank-one residue or constant/product-family shadow only. No full global carrier or theorem is asserted. Remaining full signatures use G1.

### Graded polarization of a mixed variation

**HodgeStructuresPartII:H.2/graded-polarizable** · definition · proposed name **GradedPolarization**.

A graded polarization of a mixed K-variation consists, for every k, of a flat nondegenerate K-bilinear polarization Q_k on Gr^W_k with parity (−1)^k, target K(−k), orthogonality Q_k(F^p,F^(k+1−p))=0, and positivity i^(2p−k)Q_k(v,conjugate(v))>0 on each nonzero (p,k−p) vector. It imposes no nondegenerate form on the entire mixed extension and no integral or unimodular structure. Graded-polarizable means such a family exists; retain chosen Q_k when constructing duals and norms.

Hypotheses: K=Q or R; mixed variation with pure weight-graded quotients.

Construction or proof:

1. Use the imported pure-polarization contract on each graded variation.
2. Do not apply the native integral polarization predicate to a real system without a lattice; request the coefficient-general extension from upstream L1.

Direct prerequisites: **HodgeStructuresPartII:H.2/graded-variation**, **tauceti:TauCetiRoadmap/HodgeStructures#milestone-l1--polarization--hodgeriemann-semisimplicity-summit-of-the-pure-theory**, **ShimuraData:D3/polarized-integral-variation**.

Uses:

- SZ85 Definition 3.13 and Theorem 4.1: Admissibility and cohomological fixed part require polarizable pure graded objects.
- LL24 Theorems 4.1.1 and 4.2.2: Unitary cohomology and isotypic evaluation use graded polarizations.

API:

- **GradedPolarization.gradedForm** (data): The flat weight-k form Q_k.
- **GradedPolarization.pullback** (functoriality): Each Q_k pulls back; no new monodromy condition.
- **GradedPolarization.ofPure** (compatibility): On ofPure(V,n), a graded polarization is the pure polarization on V; zero other grades.
- **GradedPolarization.dual** (structure): The dual variation has weights −k, with the corresponding dual pure forms.

Unit tests:

- **GradedPolarizationTest.tate** (computation): Q(1) has only weight −2 and type (−1,−1); its graded polarization has the chosen positive Hodge sign.
- **GradedPolarizationTest.zeroGrade** (degenerate): A zero graded quotient satisfies nondegeneracy and positivity vacuously.
- **GradedPolarizationTest.noWholeForm** (non-example): A non-split mixed extension of Q(0) by Q(1) can be graded-polarizable although there is no pure polarization of a single weight on the whole extension.

Acceptance:

- Nontrivial extensions of weights zero and minus two are allowed.

Sources: [SZ85](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0080/LOG_0032.pdf), Definition 3.5, p.509: Polarization on graded pieces, not the whole mixed object..

Suggested-file scope: Pointwise rational/complex fibre, necessary disc data, rank-one residue or constant/product-family shadow only. No full global carrier or theorem is asserted. Remaining full signatures use G1/G2; L1/L2 requests.

### Admissibility on a punctured disc

**HodgeStructuresPartII:H.2/admissible-disc** · definition · proposed name **AdmissibleDisc**.

Let V be a graded-polarizable real/rational VMHS on Δ* with unipotent monodromy T. Set N=log T (no factor 2πi), z on the universal cover with s=exp(2πiz), and Ψ(s)=exp(−zN)F(z). It is admissible precisely when Ψ extends holomorphically to s=0 as a flag whose induced filtrations on every Gr^W_k have the original graded dimensions (equivalently the extended F and Gr^W F are subbundles), and the relative monodromy filtration M(N,W) exists. Import the relative-filtration contract: NM_j⊂M_(j−2), and on Gr^W_k the induced M is the monodromy filtration centred at k. Nilpotence of N alone does not imply this existence. For quasi-unipotent T, use a finite cyclic cover killing its semisimple part; cover independence is a theorem, not a condition assumed without proof.

Hypotheses: Graded-polarizable VMHS; unipotent T for the two-condition criterion; quasi-unipotent T explicitly for the finite-cover variant.

Construction or proof:

1. Use the canonical unipotent extension to express Ψ and its graded-compatible limit.
2. Use the existing LPV.1 relative-monodromy uniqueness/ordinary-monodromy nodes rather than owning these linear algebra definitions here.
3. SZ85 A.9 proves the limit MHS and N type (−1,−1) from these two conditions and pure graded degeneration; that analytic engine is an explicit proof gap.

Direct prerequisites: **HodgeStructuresPartII:H.2/graded-polarizable**, **HodgeStructuresPartII:H.2/canonical-extension**, **LefschetzPencilsAndVanishingCycles:LPV.1/monodromy-filtration**, **LefschetzPencilsAndVanishingCycles:LPV.1/relative-monodromy-uniqueness**.

Uses:

- SZ85 Theorem 4.1: The boundary relative filtration produces the logarithmic mixed-Hodge complex.
- HodgeStructuresPartII:H.6: Supplies admissibility data; H.6 owns pure nilpotent orbits and multi-variable estimates.

API:

- **AdmissibleDisc.limitFiltration** (data): The extended F_∞ on the canonical unipotent fibre, compatible with Gr^W.
- **AdmissibleDisc.relativeWeight** (projection): The unique relative M(N,W); not ordinary monodromy centred at one chosen weight.
- **AdmissibleDisc.reparametrize** (compatibility): Changing s by a holomorphic coordinate with nonzero derivative conjugates F_∞ by exp(cN) and leaves M unchanged.
- **AdmissibleDisc.finiteCover** (characterisation): For quasi-unipotent T, admissibility is invariant under a further finite cyclic cover; N becomes eN and M is unchanged.

Unit tests:

- **AdmissibleDiscTest.constant** (degenerate): A constant MHS has T=1, N=0, F_∞=F and M=W.
- **AdmissibleDiscTest.noRelative** (non-example): On R e_0⊕R a⊕R b with W_(−1)=R a⊕R b, W_0=V and Ne_0=a, Na=Nb=0, no relative M exists: induced graded N are zero so M=W, but NM_0 is not contained in M_(−2)=0. The weight −1 real plane may carry the usual two conjugate Hodge types.
- **AdmissibleDiscTest.essentialSingularity** (non-example): The Hodge–Tate extension with weights zero and two and period coordinate exp(1/s), T=1, has relative M=W but no limiting flag, hence is not admissible.
- **AdmissibleDiscTest.ramification** (computation): For s=t^e, log(T^e)=eN, and the relative M is unchanged; the logarithmic connection residue is multiplied by e.

Acceptance:

- N=0 still requires a limiting flag; essential singularities in extension classes are excluded.
- The centre on Gr^W_k is k, not zero.

Sources: [SZ85](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0080/LOG_0032.pdf), Definition 3.13 and Appendix A.9, pp.510–511 and 540: The third condition is deduced from the first two in Appendix A.; [Peters](https://www-fourier.univ-grenoble-alpes.fr/~peters/Articles/bisect_AG.pdf), Appendix A, Definition A.1, pp.51–53: The graded-compatible limit and relative filtration are separate requirements..

Suggested-file scope: Pointwise rational/complex fibre, necessary disc data, rank-one residue or constant/product-family shadow only. No full global carrier or theorem is asserted. Remaining full signatures use G1/G3/G4/G5.

### Curve-test admissibility

**HodgeStructuresPartII:H.2/admissible-variation** · definition · proposed name **AdmissibleVariation**.

For a graded-polarizable real/rational VMHS on a smooth quasiprojective S with quasi-unipotent boundary monodromy, admissibility means that for every holomorphic disc map f:Δ→Sbar into a smooth SNC compactification with f(Δ*)⊂S, f*V satisfies the punctured-disc finite-cover criterion. Maps tangent to or meeting several boundary components are included. Kashiwara’s theorem makes this independent of the SNC compactification and stable under holomorphic pullback. This packet specifies the quasi-unipotent convention; its identification with the more general real mixed-Hodge-module convention used in LL24 for arbitrary unitary coefficients remains an explicit gap.

Hypotheses: Smooth quasiprojective S; smooth SNC compactification; quasi-unipotent boundary monodromy, an extra assumption when no lattice is present.

Construction or proof:

1. Apply the local disc criterion to all boundary arcs.
2. Use the curve-test invariance theorem cited by Peters Appendix A; full Kashiwara proof and arbitrary real-exponent generalization remain gaps, not borrowed from H.6.

Direct prerequisites: **HodgeStructuresPartII:H.2/admissible-disc**, **HodgeStructuresPartII:H.2/graded-polarizable**.

Uses:

- LL24 Theorem 4.2.1: Fixed part on arbitrary smooth quasiprojective bases needs admissibility, not just a holomorphic mixed filtration.
- HodgeStructuresPartII:H.6: Boundary restrictions receive the common predicate without a reverse dependency.

API:

- **AdmissibleVariation.curveTest** (characterisation): Every permitted disc pullback is admissible.
- **AdmissibleVariation.pullback** (functoriality): Holomorphic pullback between smooth algebraic bases preserves admissibility, with all boundary arcs tested.
- **AdmissibleVariation.compactificationIndependent** (equivalence): The predicate is the same for any smooth SNC compactification.
- **AdmissibleVariation.constant** (constructor): A constant graded-polarizable MHS gives an admissible variation.

Unit tests:

- **AdmissibleVariationTest.point** (degenerate): Over a point a graded-polarizable MHS is admissible.
- **AdmissibleVariationTest.curve** (compatibility): On a smooth curve the definition is exactly admissibility at every puncture of its smooth completion.
- **AdmissibleVariationTest.productArc** (computation): For commuting unipotent boundary T_1,T_2, the arc (s^a,s^b) has N=aN_1+bN_2 and requires M(N,W), including a,b>0.

Acceptance:

- Checking only transverse arcs through generic boundary points is not this definition.

Sources: [Peters](https://www-fourier.univ-grenoble-alpes.fr/~peters/Articles/bisect_AG.pdf), Appendix A, first three paragraphs, p.51: Admissibility by all curves, compactification independence and the explicitly assumed quasi-unipotence..

Suggested-file scope: Pointwise rational/complex fibre, necessary disc data, rank-one residue or constant/product-family shadow only. No full global carrier or theorem is asserted. Remaining full signatures use G1/G5/G6.

### Limit mixed Hodge structure from admissibility

**HodgeStructuresPartII:H.2/limit-mhs** · theorem · proposed name **AdmissibleDisc.limitMixedHodgeStructure**.

For an admissible unipotent punctured-disc mixed variation, (V_R,M(N,W),F_∞) is a real MHS, N is a morphism to its Tate twist by −1 (equivalently type (−1,−1)), and the induced pure-graded limits agree with the imported monodromy filtrations centred at their original weights. This is a consequence of the two admissibility conditions, not a third independent axiom.

Hypotheses: Unipotent admissible graded-polarizable VMHS; normalization N=log T.

Construction or proof:

1. Apply the pure one-variable degeneration theorem separately to Gr^W_k; its complete analytic proof is a recorded gap.
2. Follow SZ85 Appendix A.9: use relative M uniqueness, finite bifiltration splittings and strictness of mixed Hodge extensions to lift graded purity and N type through W.
3. Identify the resulting F and M on the unchanged underlying vector space. No multi-variable orbit estimate is asserted.

Direct prerequisites: **HodgeStructuresPartII:H.2/admissible-disc**, **tauceti:TauCetiRoadmap/HodgeStructures#milestone-l2--mixed-hodge-structures-strictness-deligne**, **LefschetzPencilsAndVanishingCycles:LPV.1/monodromy-filtration**.

Acceptance:

- N=0 gives the original constant MHS, with M=W.
- A rank-two weight-one unipotent block has M_0=im N, M_1=ker N and M_2=V.

Sources: [SZ85](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0080/LOG_0032.pdf), Appendix A.9, pp.540–541: Full printed proof reduces to pure graded degeneration and extension strictness..

Suggested-file scope: Pointwise rational/complex fibre, necessary disc data, rank-one residue or constant/product-family shadow only. No full global carrier or theorem is asserted. Remaining full signatures use G2/G3/G4.

### Tensor and internal Hom preserve admissibility

**HodgeStructuresPartII:H.2/admissible-operations** · theorem · proposed name **AdmissibleVariation.tensorHom**.

Admissible graded-polarizable real/rational variations are closed under tensor product, dual and internal Hom. Tensor W and F are convolution filtrations, N=N_V⊗1+1⊗N_U and relative M is the convolution of the relative filtrations; dual/Hom use the corresponding dual weight shifts and commutator N. The flat evaluation Hom(V,U)⊗V→U is a mixed-variation morphism. All statements are in the quasi-unipotent convention of this packet.

Hypotheses: Two admissible graded-polarizable VMHS on the same smooth quasiprojective base.

Construction or proof:

1. SZ85 A.4 constructs the tensor relative filtration by induction on W with its extension-splitting corrections; do not infer it from nilpotence alone.
2. SZ85 A.10 uses unipotent canonical-extension tensor compatibility to extend F and its graded quotients; reduce quasi-unipotent case to a common finite cover.
3. The fibre tensor/dual/Hom Hodge operations come from upstream L2; flat evaluation preserves convolution filtrations by their defining inequalities.

Direct prerequisites: **HodgeStructuresPartII:H.2/admissible-variation**, **HodgeStructuresPartII:H.2/canonical-extension**, **HodgeStructuresPartII:H.2/unipotent-tensor**, **tauceti:TauCetiRoadmap/HodgeStructures#milestone-l2--mixed-hodge-structures-strictness-deligne**, **HodgeStructuresPartII:H.0/intrinsic-tensor**, **HodgeStructuresPartII:H.0/intrinsic-dual**.

Acceptance:

- Hom of pure weights a,b has weight b−a.
- The constant Tate tensor shifts both W and F; evaluation has type (0,0).

Sources: [SZ85](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0080/LOG_0032.pdf), Appendix A.4 and A.10, pp.537–541: Relative-weight tensor proof and admissibility closure are printed..

Suggested-file scope: Pointwise rational/complex fibre, necessary disc data, rank-one residue or constant/product-family shadow only. No full global carrier or theorem is asserted. Remaining full signatures use G1/G2/G5.

### Deligne canonical logarithmic extension

**HodgeStructuresPartII:H.2/canonical-extension** · construction · proposed name **CanonicalExtension**.

For a finite-rank complex local system L on U=X\D, where X is a complex manifold and D a simple normal crossing divisor, let (E,∇)=L⊗O_U with its flat connection. There is a unique extension (Ebar,∇bar) by a locally free O_X-module with integrable logarithmic connection whose residue eigenvalues lie in the half-open strip 0≤Re(α)<1; restriction to U is the given flat bundle. Uniqueness includes extension of all horizontal morphisms. For unipotent local monodromy the residues are nilpotent. Locally choose commuting residues A_i with exp(−2πi A_i)=T_i and a frame satisfying ∇bar=d+Σ A_i dz_i/z_i. This choice of strip is the canonical extension, not the dual/tensor extension without eigenvalue corrections.

Hypotheses: Complex manifold X; SNC D; native finite-rank complex local system on U. The analytic extension needs no quasi-unipotence assumption. Algebraic existence additionally requires regular singularity.

Construction or proof:

1. Del70 II.5.2 constructs the nilpotent-residue extension from commuting unipotent T_i.
2. Del70 II.5.4 decomposes arbitrary commuting monodromy into rank-one characters times unipotent blocks and chooses the indicated logarithm representatives.
3. Use nonresonance and the horizontal growth characterization for uniqueness and gluing; regular algebraic comparison uses the corrected Del70 erratum.

Direct prerequisites: **tauceti:TauCeti.LocalCoefficientSystem**, **ShimuraData:D3/flat-bundle-local**, **HodgeStructuresPartII:H.0/intrinsic-preconnection**, **HodgeStructuresPartII:H.0/intrinsic-curvature**, **ComplexComparisonPartII:C0**, **ComplexComparisonPartII:C1**.

Uses:

- LL24 Theorem 4.1.1: The relative logarithmic de Rham complex uses exactly this extension.
- HodgeStructuresPartII:H.4 and H.6: Residues supply parabolic weights and degeneration normalization.

API:

- **CanonicalExtension.restrict** (compatibility): Restriction of (Ebar,∇bar) to U is the supplied flat bundle.
- **CanonicalExtension.residue** (projection): Along D_i, Res_i∇bar is an endomorphism of Ebar|D_i with eigenvalues in [0,1) by real part.
- **CanonicalExtension.map** (functoriality): Every horizontal map extends uniquely, preserving identities/composites.
- **CanonicalExtension.unique** (universal-property): An extension with the strip condition has a unique horizontal isomorphism restricting to the identity on U.
- **CanonicalExtension.unipotentResidue** (characterisation): All T_i unipotent iff all canonical residue eigenvalues are zero, hence all residues nilpotent.

Unit tests:

- **CanonicalExtensionTest.trivial** (degenerate): The trivial local system extends to (O_X,d) with residue zero.
- **CanonicalExtensionTest.minusOne** (computation): On Δ*, a line with T=−1 has residue 1/2 and exp(−2πi/2)=−1.
- **CanonicalExtensionTest.integerShift** (non-example): Residue 3/2 also has T=−1 but is not canonical because 3/2 is outside the strip.
- **CanonicalExtensionTest.tensorCorrection** (computation): Two canonical lines of residue 3/4 have tensor residue 3/2; the canonical extension of their tensor has residue 1/2, obtained locally by frame z^(−1)(e⊗e).

Acceptance:

- For monodromy −1 the chosen line residue is 1/2.
- For monodromy 1 the chosen line residue is zero.

Sources: [Del70](https://publications.ias.edu/sites/default/files/Number9.pdf?download=1), II.5, Propositions 5.2 and 5.4, Remark 5.5(i): Existence, uniqueness and the specified strip; not asserted tensor monoidal in general..

Suggested-file scope: Pointwise rational/complex fibre, necessary disc data, rank-one residue or constant/product-family shadow only. No full global carrier or theorem is asserted. Remaining full signatures use G1/G7.

### Exactness of canonical extension

**HodgeStructuresPartII:H.2/extension-exact** · theorem · proposed name **CanonicalExtension.exact**.

For a fixed logarithm branch represented by 0≤Re(α)<1, canonical extension is exact on finite-rank complex local systems on a fixed SNC complement: a short exact sequence gives a short exact sequence of locally free logarithmic bundles with connection. The restriction identifications commute with all maps. Exactness does not imply compatibility with tensor products or ordinary dual bundles.

Hypotheses: Fixed X,D and fixed strip; short exact sequence of finite-rank complex local systems.

Construction or proof:

1. Use the simultaneous generalized-eigenspace decomposition of local monodromy from Del70 II.5.4.
2. On each character component use the nilpotent logarithm construction, which sends invariant subspaces and quotients to their tensor O_X modules. Glue by unique horizontal extension.

Direct prerequisites: **HodgeStructuresPartII:H.2/canonical-extension**, **EnhancedDerivedSheaves:E1**.

Acceptance:

- An invariant Jordan-block line and its quotient extend exactly despite non-split monodromy.
- The residue-3/4 tensor example still fails ordinary tensor compatibility.

Sources: [Del70](https://publications.ias.edu/sites/default/files/Number9.pdf?download=1), II.5.4, property (c) and its proof: Exactness of the chosen extension functor..

Suggested-file scope: Pointwise rational/complex fibre, necessary disc data, rank-one residue or constant/product-family shadow only. No full global carrier or theorem is asserted. Remaining full signatures use G1/G7.

### Residue and local monodromy

**HodgeStructuresPartII:H.2/residue-monodromy** · theorem · proposed name **CanonicalExtension.residueMonodromy**.

In the commuting logarithmic frame ∇=d+Σ A_i dz_i/z_i of the canonical extension, positive local loops have T_i=exp(−2πi A_i). On a unipotent block N_i=log T_i=−2πi A_i. Under s=t^e, the pulled-back residue is eA; if its eigenvalues leave the strip, recanonicalization shifts them by integers. In the unipotent case no shift occurs and N becomes eN.

Hypotheses: Canonical logarithmic extension near an SNC chart; orientation of loops is positive; the residue matrix is in the supplied constant local normal form.

Construction or proof:

1. Solve horizontal sections z_i^(−A_i)v and continue log z_i by 2πi.
2. Pull back dz/z=e dt/t. Apply uniqueness of the canonical extension after eigenvalue normalization.

Direct prerequisites: **HodgeStructuresPartII:H.2/canonical-extension**.

Acceptance:

- A=1/2 gives T=−1; a unipotent Jordan residue A has exp(−2πiA)=1−2πiA when A²=0.
- The real relative-monodromy operator is N=log T, not the complex residue A.

Sources: [Del70](https://publications.ias.edu/sites/default/files/Number9.pdf?download=1), II.5.2–5.4 local construction: The local commuting residue frame fixes the sign..

Suggested-file scope: Pointwise rational/complex fibre, necessary disc data, rank-one residue or constant/product-family shadow only. No full global carrier or theorem is asserted. Remaining full signatures use G1/G7; rank-one scalar adapter is present.

### Tensor compatibility on the unipotent branch

**HodgeStructuresPartII:H.2/unipotent-tensor** · theorem · proposed name **CanonicalExtension.unipotentTensor**.

For local systems with unipotent local monodromy on the same SNC complement, canonical extension commutes with tensor products, duals and internal Hom. Residues on the tensor are A⊗1+1⊗B, on the dual −A transpose, and on Hom B∘f−f∘A. They are nilpotent, so remain in the strip. These comparisons are coherent and restrict to the ordinary flat tensor/dual/Hom comparisons.

Hypotheses: All local monodromy operators of each factor are unipotent.

Construction or proof:

1. Construct tensor/dual connections from the H.0 operations. Commuting sums of nilpotents are nilpotent.
2. Invoke canonical uniqueness rather than assuming a general tensor theorem.

Direct prerequisites: **HodgeStructuresPartII:H.2/canonical-extension**, **HodgeStructuresPartII:H.0/intrinsic-tensor**, **HodgeStructuresPartII:H.0/intrinsic-dual**.

Acceptance:

- Residue-zero constant factors have ordinary tensor and dual extensions.
- The residue-3/4 example shows the unipotent hypothesis cannot be removed.

Sources: [Del70](https://publications.ias.edu/sites/default/files/Number9.pdf?download=1), II.5.2, tensor property and uniqueness: The nilpotent branch is tensor compatible..

Suggested-file scope: Pointwise rational/complex fibre, necessary disc data, rank-one residue or constant/product-family shadow only. No full global carrier or theorem is asserted. Remaining full signatures use G1; H.0 global tensor/dual suppliers.

### Extended Hodge filtration at an admissible boundary

**HodgeStructuresPartII:H.2/filtered-extension** · construction · proposed name **FilteredExtension**.

For an admissible unipotent mixed variation on Δ*, extend F by its untwisted limiting flag inside the canonical extension. The resulting Fbar^p are holomorphic subbundles, restrict to F^p, have locally free Gr^W Gr_F, and satisfy logarithmic transversality ∇bar Fbar^p⊂Fbar^(p−1)⊗Ω¹(log{0}). For quasi-unipotent monodromy use a finite cover and the corresponding canonical-eigenvalue normalization; the descended filtration is the intersection/saturated extension determined by the original F and Ebar, not an arbitrarily chosen limit flag. Global SNC gluing requires the multi-variable admissibility extension theorem, recorded separately as a gap.

Hypotheses: Admissible graded-polarizable disc variation in the packet convention; unipotent case first.

Construction or proof:

1. The admissibility limit constructs Fbar in the unipotent canonical frame. Apply residue/monodromy normalization and limiting N type to extend transversality.
2. For a short exact sequence use SZ85 §5.26 and limit MHS strictness to obtain exact Fbar subbundles; descent of the finite-cover variant needs its stated theorem.

Direct prerequisites: **HodgeStructuresPartII:H.2/admissible-disc**, **HodgeStructuresPartII:H.2/limit-mhs**, **HodgeStructuresPartII:H.2/canonical-extension**, **HodgeStructuresPartII:H.2/residue-monodromy**, **tauceti:TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_F_eq_map_F**.

Uses:

- HodgeStructuresPartII:H.6: Supplies logarithmic Hodge filtration with the residue normalization.
- SZ85 §4 and LL24 §4.1: Filtered logarithmic complexes compute Hodge filtrations and strict evaluation.

API:

- **FilteredExtension.restrict** (compatibility): Fbar^p restricts to F^p under the canonical extension identification.
- **FilteredExtension.limit** (projection): The fibre of Fbar at zero is the untwisted F_∞ in the unipotent frame.
- **FilteredExtension.graded** (compatibility): Weight-graded Fbar is the extended pure-graded filtration; intersections/quotients are locally free.
- **FilteredExtension.map** (functoriality): A mixed-variation map extends and preserves Fbar; identities/composites agree.
- **FilteredExtension.exact** (relation): Every Fbar^p sequence attached to a short exact sequence of admissible variations is exact.

Unit tests:

- **FilteredExtensionTest.constant** (degenerate): For a constant type-(0,0) line, Fbar^0=O_Δ and Fbar^1=0.
- **FilteredExtensionTest.limit** (computation): For a unipotent nilpotent-orbit model F(z)=exp(zN)F_∞ satisfying admissibility, the untwisted Fbar is constant with fibre F_∞.
- **FilteredExtensionTest.noEssential** (non-example): The period coordinate exp(1/s) Hodge–Tate example cannot be supplied as an admissible input.

Acceptance:

- For a constant variation the extension has constant F; for a non-admissible essential singularity it is undefined.

Sources: [SZ85](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0080/LOG_0032.pdf), §3.13 and §5.26, pp.510–511 and 534: Admissible limit and exact extended filtration.; [LL22](https://arxiv.org/pdf/2202.00039v3), Proposition 4.1.4(4), p.28 and proof: Pure curve canonical-extension transversality cites Brunebarbe §7..

Suggested-file scope: Pointwise rational/complex fibre, necessary disc data, rank-one residue or constant/product-family shadow only. No full global carrier or theorem is asserted. Remaining full signatures use G1/G5/G8.

### Canonical-extension logarithmic de Rham comparison

**HodgeStructuresPartII:H.2/log-comparison** · comparison · proposed name **canonicalLogComparison**.

For U=X\D as above and its canonical extension, the analytic logarithmic complex DR_log(Ebar)=[Ebar→Ebar⊗Ω¹_X(log D)→…] is quasi-isomorphic to Rj_*L. Thus H^q(X,DR_log(Ebar))≅H^q(U,L). The strip excludes positive integer residue eigenvalues, as required by Del70 II.6.10. The coefficient/log comparison engine belongs to ComplexComparisonPartII:C5; this node is its canonical-strip adapter, not a new generic de Rham comparison theory.

Hypotheses: SNC boundary; canonical extension; sheaf hypercohomology and coefficient singular/sheaf comparison supplied by C5.

Construction or proof:

1. Use the canonical residue strip to discharge the no-positive-integer hypothesis of Del70 II.6.10.
2. Invoke the requested local logarithmic Poincaré lemma and coefficient sheaf comparison; pass to derived global sections using E1. Supporting local proof input remains explicit until supplied.

Direct prerequisites: **HodgeStructuresPartII:H.2/canonical-extension**, **ComplexComparisonPartII:C5**, **ComplexComparisonPartII:C5/repair-sheaf-singular-comparison**, **EnhancedDerivedSheaves:E1**.

Acceptance:

- For a punctured disc constant line, the two-term logarithmic complex has H^0=C and H^1=C.
- For scalar residue 1/2, local invariants and local coinvariants vanish, matching the logarithmic complex.

Sources: [Del70](https://publications.ias.edu/sites/default/files/Number9.pdf?download=1), II.6.10, and local inputs II.3.15/6.9: Canonical strip satisfies the comparison hypothesis..

Suggested-file scope: Pointwise rational/complex fibre, necessary disc data, rank-one residue or constant/product-family shadow only. No full global carrier or theorem is asserted. Remaining full signatures use G7; C5/E1 suppliers.

### Gauss–Manin system and logarithmic comparison

**HodgeStructuresPartII:H.2/gauss-manin** · construction · proposed name **GaussManin**.

For a smooth proper morphism f:X→S of smooth complex algebraic varieties and q≥0, H_Q=R^q f_*Q is a finite-rank rational local system, E=H_Q⊗O_(S^an) has the flat Gauss–Manin connection, and E≅(R^q f_*Ω^•_(X/S))^an with base change compatibility. More generally, for a proper smooth compactification fbar:Xbar→S with relative SNC boundary D and U=Xbar\D, and a finite-rank flat complex system L on U with canonical extension, E=R^q f_*L⊗O_S is identified with relative logarithmic de Rham hypercohomology of its extension and carries the same connection. The relative SNC compactification is essential for local freeness over the whole base; for a general smooth nonproper morphism assert these properties only on the dense open supplied by Del70 II.6.13.

Hypotheses: Smooth base; proper smooth compactified family; relative SNC boundary, if present; coefficient local system; q≥0; proper case rational coefficients.

Construction or proof:

1. Use local topological triviality of the smooth relative SNC pair to form the native local system.
2. Invoke requested relative/log coefficient comparison and proper coherent base change; identify the absolute differential-induced connection with the local-system connection (Del70 II.6.14 and §§6.17–6.18).
3. Record the dense-open caveat outside the compactifiable family hypotheses.

Direct prerequisites: **tauceti:TauCeti.LocalCoefficientSystem**, **HodgeStructuresPartII:H.0/intrinsic-preconnection**, **HodgeStructuresPartII:H.0/intrinsic-curvature**, **ComplexComparisonPartII:C5**, **ComplexComparisonPartII:C3/repair-relative-proper-gaga**, **HodgeStructuresPartII:H.2/log-comparison**.

Uses:

- LL24 §§4.1 and 5.1: Constructs coefficient curve variation and its flat bundle.
- HodgeStructuresPartII:H.3 and H.8: Supplies the geometric connection for period derivatives.

API:

- **GaussManin.localSystem** (data): R^q f_* of the supplied coefficient system, as a native local coefficient system.
- **GaussManin.deRhamEquiv** (equivalence): Its associated holomorphic bundle is the relative (logarithmic) de Rham hypercohomology bundle, carrying the compared connection.
- **GaussManin.baseChange** (functoriality): Pullback of the smooth relative SNC family yields the corresponding local system and de Rham connection; identity/composition coherence.
- **GaussManin.fiber** (projection): The fibre at s is H^q(U_s,L_s), with its de Rham comparison and path transport.

Unit tests:

- **GaussManinTest.product** (computation): For U=Y×S with pulled-back coefficients, Gauss–Manin is the constant H^q(Y,L) local system with connection d.
- **GaussManinTest.degreeZero** (degenerate): For a proper family with connected fibres and trivial coefficients, R^0 f_*Q is the constant Q system.
- **GaussManinTest.nativeTransport** (compatibility): Parallel transport in the de Rham bundle matches native local-system path transport, not an independently specified map.

Acceptance:

- A product family has the constant cohomology local system and connection d.
- An elliptic proper family gives rank two in degree one.

Sources: [Del70](https://publications.ias.edu/sites/default/files/Number9.pdf?download=1), II.6.13–6.14 and §§6.17–6.18: Full-base local freeness uses a smooth proper relative SNC compactification.; [LL24](https://arxiv.org/pdf/2205.15352v4), §5.1 setup and equation (5.3), pp.27–29: Curve coefficient instance consumed by the period derivative..

Suggested-file scope: Pointwise rational/complex fibre, necessary disc data, rank-one residue or constant/product-family shadow only. No full global carrier or theorem is asserted. Remaining full signatures use G1/G7; C5 relative-cohomology supplier.

### Geometric pure polarized variation

**HodgeStructuresPartII:H.2/geometric-pure** · theorem · proposed name **geometricPureVariation**.

If f:X→S is smooth projective of relative dimension d over a smooth complex algebraic base with a relative ample class, the torsion-free degree-q integral cohomology local system with Hodge filtration induced from relative de Rham cohomology is a polarized integral VHS of weight q. Use the primitive Lefschetz decomposition and its signed cup-product forms to polarize the full cohomology. The fibre is the imported cohomological pure Hodge structure, the connection is Gauss–Manin, and Griffiths transversality holds. Projectivity/relative polarization is explicit; smooth proper complex fibres are not automatically treated as projective polarized ones.

Hypotheses: Smooth projective f; relative ample class; q≥0; torsion-free lattice H^q(X_s,Z)/torsion.

Construction or proof:

1. Use the fibre cohomological Hodge decomposition and Hodge–Riemann/Hard Lefschetz engine, which is a recorded supplier gap beyond the intrinsic fibre library.
2. Construct F via relative de Rham degeneration; differentiate representatives to prove Griffiths transversality.
3. Combine primitive signed polarizations through the Lefschetz decomposition; compare with ShimuraData:D3/polarized-integral-variation.

Direct prerequisites: **HodgeStructuresPartII:H.2/gauss-manin**, **ShimuraData:D3/polarized-integral-variation**, **ComplexComparisonPartII:C5/repair-proper-de-rham-betti**, **tauceti:TauCetiRoadmap/HodgeStructures#milestone-l1--polarization--hodgeriemann-semisimplicity-summit-of-the-pure-theory**.

Acceptance:

- Degree one of a smooth elliptic family has weight one and ranks h^(1,0)=h^(0,1)=1.
- The cup-product sign must agree with the intrinsic pure polarization convention.

Sources: [Del71](https://www.numdam.org/item/PMIHES_1971__40__5_0.pdf), §4.1.1–4.1.2, pp.40–43: Proper/projective geometric fixed-part setup.; [Del71](https://www.numdam.org/item/PMIHES_1971__40__5_0.pdf), §4.2.9(a), p.47: Polarizable geometric local systems supply integral monodromy..

Suggested-file scope: Pointwise rational/complex fibre, necessary disc data, rank-one residue or constant/product-family shadow only. No full global carrier or theorem is asserted. Remaining full signatures use G1/G9.

### Unitary cohomology of a punctured curve

**HodgeStructuresPartII:H.2/unitary-curve-fiber** · theorem · proposed name **unitaryCurveFiber**.

For a smooth projective complex curve C, reduced D, U=C\D, and finite-rank orthogonal real local system V_R with complexification V, H¹(U,V_R) has a functorial graded-polarizable real MHS with only weights 1 and 2. W_1 is the image of H¹(C,j_*V_R), W_2=H¹(U,V_R), and F¹ is the image of H⁰(C,Ebar⊗Ω¹_C(log D)) in logarithmic hypercohomology; F⁰=H_C, F²=0. Canonical extension uses [0,1). For arbitrary unitary complex V, apply realification V⊕V dual and project to V to obtain weight/Hodge/conjugate-Hodge filtrations, without asserting a real structure on H¹(U,V) itself.

Hypotheses: Smooth projective curve, finite reduced boundary, orthogonal real coefficients; or complex unitary coefficients for the direct-summand version.

Construction or proof:

1. Timm87 Theorem 6.3 identifies the log complex as a mixed Hodge complex using residue strata and its Theorem 5.1 harmonic-form Hodge decomposition. The 1986 appendix and the generic mixed-Hodge-complex engine remain explicit gaps.
2. Lemma 6.2 gives the weight range and W_1; Theorem 7.1(a) gives E_1 degeneration and the displayed F¹ image.
3. Theorem 7.1 realifies V with its dual; split the coefficient log complexes to descend the filtrations to complex V.

Direct prerequisites: **HodgeStructuresPartII:H.2/log-comparison**, **HodgeStructuresPartII:H.2/graded-polarizable**, **tauceti:TauCetiRoadmap/HodgeStructures#milestone-l2--mixed-hodge-structures-strictness-deligne**, **ComplexComparisonPartII:C1**.

Acceptance:

- For constant R on a genus-g curve with r>0 punctures, dim W_1=2g and dim Gr^W_2=r−1.
- For C=P¹ and D={0,∞}, H¹(U,R)=R(−1), of type (1,1); for D empty all H¹ has weight one.

Sources: [Timm87](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0379/LOG_0011.pdf), Lemma 6.2, Theorem 6.3/Proposition 6.4, Theorem 7.1(a), pp.166–170: Weight range, mixed complex proof and complex coefficient degeneration.; [LL24](https://arxiv.org/pdf/2205.15352v4), Theorem 4.1.1 proof, pp.24–25: Precisely this fibre calculation is used in the family..

Suggested-file scope: Pointwise rational/complex fibre, necessary disc data, rank-one residue or constant/product-family shadow only. No full global carrier or theorem is asserted. Remaining full signatures use G2/G10/G11.

### Unitary curve Gauss–Manin mixed variation

**HodgeStructuresPartII:H.2/unitary-curve-family** · theorem · proposed name **unitaryCurveFamily**.

Let π:C→M be a smooth proper family of curves over a smooth quasiprojective base with disjoint sections D and U=C\D, and let V_R be a finite-rank orthogonal real local system on U. R¹π°_*V_R, its Gauss–Manin bundle and the fibrewise filtrations of the preceding node form a graded-polarizable real VMHS: W_1=R¹π_*j_*V_R included into R¹π°_*V_R, W_2 is the whole system, and F¹=im π_*(Ebar⊗Ω¹_(C/M)(log D)). Under quasi-unipotent boundary monodromy on M this is admissible in this packet’s finite-cover convention. LL24 asserts admissibility for arbitrary unitary real coefficients using real mixed Hodge modules; retaining that broader claim requires the recorded real-exponent convention gap and mixed-Hodge-module direct-image engine.

Hypotheses: Smooth pointed curve family; smooth quasiprojective M; orthogonal real V_R; quasi-unipotence on base boundary for the finite-cover admissibility conclusion.

Construction or proof:

1. Use relative log comparison/base change to glue the fibre Hodge filtration, and the unitary fibre theorem for graded purity.
2. There are only F⁰,F¹,F²=0, so Griffiths transversality follows directly.
3. LL24 invokes Saito/Schnell real mixed Hodge modules: Rπ_*Rj_*V_R and its locally constant degree-one cohomology yield graded polarization/admissibility. Those cited proof engines are gaps, not established by the fibre argument.

Direct prerequisites: **HodgeStructuresPartII:H.2/gauss-manin**, **HodgeStructuresPartII:H.2/unitary-curve-fiber**, **HodgeStructuresPartII:H.2/admissible-variation**, **HodgeStructuresPartII:H.2/mixed-variation**.

Acceptance:

- For a product pointed family with constant coefficients the mixed variation is constant.
- F¹ is an image, not blindly identified with all global logarithmic one-forms when relative H⁰ contributes a differential.

Sources: [LL24](https://arxiv.org/pdf/2205.15352v4), Theorem 4.1.1 and complete printed proof, pp.24–25: Family formula plus the separate mixed-Hodge-module argument..

Suggested-file scope: Pointwise rational/complex fibre, necessary disc data, rank-one residue or constant/product-family shadow only. No full global carrier or theorem is asserted. Remaining full signatures use G1/G6/G15.

### Unitary curve Hodge bigrading

**HodgeStructuresPartII:H.2/unitary-bigrading** · theorem · proposed name **unitaryBigrading**.

For the complex unitary curve cohomology system H_V of the preceding family, let conjugate F be induced using V dual ≅conjugate V. Define H^(1,0)=F¹∩W_1, H^(0,1)=conjugate F¹∩W_1 and H^(1,1)=F¹∩conjugate F¹. Then H_V is the direct sum of these three smooth subbundles; conjugation exchanges H_V^(p,q) with H_(V dual)^(q,p). In general these summands are not flat local subsystems.

Hypotheses: Unitary complex coefficient system on the pointed smooth projective curve family; conjugate filtration transported through the unitary duality identification.

Construction or proof:

1. Apply the real unitary fibre MHS and its two-step weight/Hodge filtration; check the direct decomposition fibrewise.
2. Use V⊕V dual realification and split the coefficient filtrations; the conjugation comparison is factor exchange, not a claimed self-conjugation on V.

Direct prerequisites: **HodgeStructuresPartII:H.2/unitary-curve-family**, **HodgeStructuresPartII:H.2/unitary-curve-fiber**, **tauceti:TauCetiRoadmap/HodgeStructures#milestone-l2--mixed-hodge-structures-strictness-deligne**.

Acceptance:

- For C*, constant coefficients have only H^(1,1); for a proper elliptic curve only H^(1,0),H^(0,1).
- No flatness of the Hodge summands is inferred.

Sources: [LL24](https://arxiv.org/pdf/2205.15352v4), Lemma 4.1.2, equations (4.1)–(4.2), p.25: Exact three-component formula and dual-conjugate comparison..

Suggested-file scope: Pointwise rational/complex fibre, necessary disc data, rank-one residue or constant/product-family shadow only. No full global carrier or theorem is asserted. Remaining full signatures use G1/G2.

### Cohomology of an admissible mixed variation on a curve

**HodgeStructuresPartII:H.2/curve-cohomology-mhs** · theorem · proposed name **curveCohomologyMHS**.

For a smooth algebraic curve S with smooth projective completion Sbar and finite boundary, and an admissible graded-polarizable real/rational VMHS V, H^i(S,V) carries a natural functorial mixed Hodge structure. The evaluation H⁰(S,V)→V_s is a mixed Hodge morphism and its image is a mixed Hodge substructure independent of s under parallel transport. The comparison uses the logarithmic two-term complex of the canonical extension, with its Hodge filtration and the corrected boundary weight filtration; W is not simply the original coefficient W with no cohomological shift.

Hypotheses: Admissible graded-polarizable VMHS; smooth curve and finite boundary; same quasi-unipotent convention.

Construction or proof:

1. Follow SZ85 §4.1–4.17: extend F; construct the filtered logarithmic two-term complex with Z_k=NW_k+(M_(k−1)∩W_(k−1)) at each unipotent boundary point and the indicated décalage/cohomological shifts.
2. Its Gr^W pieces split into the pure-coefficient cohomological Hodge complex and supported boundary graded-cokernel terms (with Tate twist). The Zucker pure-coefficient cohomology theorem and the mixed-Hodge-complex engine are explicit gaps.
3. Apply §4.19: restriction to a fibre is a mixed-Hodge-complex morphism; strictness gives the constant sub-MHS. Finite-cover descent handles quasi-unipotence.

Direct prerequisites: **HodgeStructuresPartII:H.2/admissible-variation**, **HodgeStructuresPartII:H.2/filtered-extension**, **HodgeStructuresPartII:H.2/log-comparison**, **tauceti:TauCetiRoadmap/HodgeStructures#milestone-l2--mixed-hodge-structures-strictness-deligne**, **EnhancedDerivedSheaves:E1**.

Acceptance:

- For V=R(0) on C*, H⁰=R(0), H¹=R(−1).
- A constant MHS gives H⁰ the original mixed weights, not a forced single weight.

Sources: [SZ85](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0080/LOG_0032.pdf), Theorem 4.1, §§4.2–4.17, Corollary 4.19, pp.513–518: Complete printed construction and curve fixed-part corollary; cited analytic engine separated..

Suggested-file scope: Pointwise rational/complex fibre, necessary disc data, rank-one residue or constant/product-family shadow only. No full global carrier or theorem is asserted. Remaining full signatures use G1/G11.

### Theorem of the fixed part for mixed variations

**HodgeStructuresPartII:H.2/mixed-fixed-part** · construction · proposed name **MixedFixedPart**.

For an admissible graded-polarizable real/rational VMHS V on a connected smooth quasiprojective S, the native monodromy invariant subspace I_s=(ρ_s).invariants≅H⁰(S,V) has the induced mixed Hodge structure W_k I=I∩W_k V_s, F^p I_C=I_C∩F^p V_s. These filtrations are independent of s under native path transport. The evaluation of the constant system I into V is a mixed-variation morphism; it identifies I with the largest constant sub-local system. Constancy of the underlying system alone does not supply the assertion without admissibility.

Hypotheses: Connected smooth quasiprojective S; admissible graded-polarizable VMHS; finite rank; real/rational coefficient convention.

Construction or proof:

1. Use SZ85 Corollary 4.19 on curves and strict native mixed morphisms.
2. Use Katz §4.3.4.0 connecting nearby points by smooth affine curves; a global invariant stays invariant on every such curve. Apply functorial Deligne splitting of fibre MHS to each component and propagate it along all such curves, so each component is flat and globally invariant. This identifies the invariant sub-MHS and its constant filtrations. The curve-existence and analytic continuation interfaces are gaps.
3. The inclusion/evaluation is strict by native fibre MHS strictness; its maximal constant universal property is the native invariants condition.

Direct prerequisites: **HodgeStructuresPartII:H.2/curve-cohomology-mhs**, **HodgeStructuresPartII:H.2/mixed-variation**, **mathlib:Representation.invariants**, **mathlib:Representation.mem_invariants**, **tauceti:TauCeti.LocalCoefficientSystem.monodromyRepresentation**, **tauceti:TauCeti.LocalCoefficientSystem.transport**, **tauceti:TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_F_eq_map_F**, **tauceti:TauCeti.Hodge.MixedHodgeStructure.Hom.range_inf_WQ_eq_map_WQ**, **tauceti:TauCetiRoadmap/HodgeStructures#milestone-l2--mixed-hodge-structures-strictness-deligne**.

Uses:

- LL24 Proposition 4.2.2: H⁰(Hom(tilde L,V)) is the constant multiplicity MHS for evaluation.
- André92 §5: Fixed tensors over finite covers control algebraic monodromy.

API:

- **MixedFixedPart.structure** (constructor): MHS on the native invariant module with induced W and F.
- **MixedFixedPart.evaluation** (projection): Strict injection of the constant invariant MHS system into V.
- **MixedFixedPart.transport** (compatibility): Native path transport identifies the MHS on I_s and I_t, independently of path on invariants.
- **MixedFixedPart.map** (functoriality): A mixed-variation morphism restricts to a mixed Hodge map of invariants; identity/composition laws.
- **MixedFixedPart.constantUniversal** (universal-property): Any mixed-variation map from a constant MHS factors uniquely through the evaluation map.

Unit tests:

- **MixedFixedPartTest.constant** (degenerate): For a constant MHS Q, its fixed part is Q with exactly its W,F.
- **MixedFixedPartTest.nontrivialLine** (computation): A rank-one character with some ρ(g)≠1 has zero native invariant submodule and zero fixed MHS.
- **MixedFixedPartTest.nativeInvariant** (compatibility): The underlying module is Representation.invariants of the native monodromyRepresentation, with induced inclusion into the actual fibre.
- **MixedFixedPartTest.twoWeights** (non-example): For constant Q(0)⊕Q(1), the fixed MHS has weights zero and minus two; it is not a pure weight-zero Hodge structure.

Acceptance:

- For a constant mixed variation the fixed part is its entire original MHS.
- Infinite-image nontrivial unitary rank-one coefficients have zero fixed part.

Sources: [SZ85](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0080/LOG_0032.pdf), Corollary 4.19 and proof, p.518: Curve theorem; no higher-dimensional claim attributed to this corollary.; [LL24](https://arxiv.org/pdf/2205.15352v4), Theorem 4.2.1, p.26: Smooth quasiprojective mixed fixed part.; [Andre92](https://www.numdam.org/item/CM_1992__82_1_1_0.pdf), §5, proof after Theorem 1, pp.10–11: Reduction to curves follows Katz §4.3.4.0.; [Katz72](https://web.math.princeton.edu/~nmk/old/algsoln.pdf), §4.3.4.0, printed p.70: Connect nearby points by smooth affine curves; global invariants remain curve-invariant..

Suggested-file scope: Pointwise rational/complex fibre, necessary disc data, rank-one residue or constant/product-family shadow only. No full global carrier or theorem is asserted. Remaining full signatures use G1/G2/G12.

### Fixed part of a complex polarized variation

**HodgeStructuresPartII:H.2/complex-fixed-part** · theorem · proposed name **complexFixedPart**.

For a complex PVHS L on a connected smooth quasiprojective S, its invariant space H⁰(S,L) decomposes into constant Hodge types, and the flat inclusion of this constant complex polarized Hodge structure into L preserves the smooth decomposition. The induced Hermitian form is nondegenerate with the required type signs. This theorem does not assume a lattice or quasi-unipotent boundary monodromy.

Hypotheses: Finite-rank complex PVHS; S smooth quasiprojective, hence an open subset of a compact analytic variety.

Construction or proof:

1. Realify L. Del87 §1.11 applies Schmid growth bounds to invariant vectors and bounded plurisubharmonic Hodge norms on the compactification; constancy forces their Hodge components to be horizontal.
2. Split back to L; the invariant type components are orthogonal and each has definite signed metric, so their total restricted form is nondegenerate. The full analytic Schmid/Griffiths engine remains a recorded gap.

Direct prerequisites: **HodgeStructuresPartII:H.2/complex-pvhs**, **HodgeStructuresPartII:H.2/realification**, **mathlib:Representation.invariants**.

Acceptance:

- An infinite-image unitary type-(0,0) line has fixed part zero.
- A constant type-(1,−1) complex line retains that type; no real symmetry is imposed.

Sources: [Del87](https://publications.ias.edu/sites/default/files/56_Untheoremede.pdf?download=1), §1.11, p.8, complete printed proof: Complex fixed part through realification and Hodge norm constancy..

Suggested-file scope: Pointwise rational/complex fibre, necessary disc data, rank-one residue or constant/product-family shadow only. No full global carrier or theorem is asserted. Remaining full signatures use G1/G13.

### Semisimplicity of the underlying complex local system

**HodgeStructuresPartII:H.2/complex-semisimple** · theorem · proposed name **complexSemisimple**.

The underlying finite-rank complex local system of a complex PVHS on a smooth connected quasiprojective complex variety is semisimple. Consequently it is a finite direct sum of irreducible complex local systems, and its algebraic monodromy group is reductive. This is different from semisimplicity of the category of Hodge subobjects, and different from semisimplicity of the connected algebraic monodromy group.

Hypotheses: Complex PVHS; connected smooth quasiprojective base.

Construction or proof:

1. Del87 §1.12 explicitly asserts this result in the algebraic/Kähler compactification setting and cites Nori; LL22 Proposition 4.1.4(1) gives the punctured-projective-curve instance.
2. The source’s Nori proof is not supplied there. A complete published proof in the stated noncompact generality is a gap; a projective-only harmonic-metric proof does not discharge it.
3. Once module semisimplicity is established, use the upstream characteristic-zero faithful-representation reductivity criterion.

Direct prerequisites: **HodgeStructuresPartII:H.2/complex-pvhs**, **tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules**, **tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups**.

Acceptance:

- A nontrivial unipotent Jordan representation on C* cannot be a complex PVHS.
- A nontrivial infinite unitary line is semisimple as a representation but has connected algebraic closure G_m, which is not a semisimple group.

Sources: [Del87](https://publications.ias.edu/sites/default/files/56_Untheoremede.pdf?download=1), §1.12, pp.8–9: Separates Hodge-category semisimplicity from underlying complex-system semisimplicity.; [LL22](https://arxiv.org/pdf/2202.00039v3), Proposition 4.1.4(1), p.28: Curve instance, not alone a general-base proof..

Suggested-file scope: Pointwise rational/complex fibre, necessary disc data, rank-one residue or constant/product-family shadow only. No full global carrier or theorem is asserted. Remaining full signatures use G1/G14; RG1/RG6.

### Isotypic Hodge decomposition and shift uniqueness

**HodgeStructuresPartII:H.2/isotypic-hodge** · theorem · proposed name **isotypicHodge**.

For a complex PVHS L on smooth connected quasiprojective S, write its semisimple local system as ⊕_i S_i⊗M_i with pairwise nonisomorphic irreducible S_i and M_i=Hom_loc(S_i,L). Each S_i supports a complex PVHS unique up to integral renumbering of the single Hodge index; choose its weight consistently with this renumbering. Each M_i then has a constant complex polarized Hodge structure and evaluation ⊕S_i⊗M_i→L is a Hodge isomorphism. For fixed total weight, shifts on S_i and M_i are opposite; a shift need not be an integral real Tate twist. The statement concerns complex type grading, without adding a real or integral structure.

Hypotheses: Complex PVHS; algebraic base; choice of representatives and Hodge-index shifts for irreducible constituents.

Construction or proof:

1. Use underlying semisimplicity and the standard semisimple isotypic decomposition from RG1.
2. Del87 §1.13 applies complex fixed part to End(L); each simple matrix block has a Hodge grading. Lift its G_m grading from PGL to GL using §1.14 and choose a homogeneous rank-one projector. Its image yields the constituent PVHS.
3. Apply fixed part to Hom(S_i,L); evaluation identifies the multiplicity grading. Central scalar lifts differ by a character, giving exactly the integral shift ambiguity.

Direct prerequisites: **HodgeStructuresPartII:H.2/complex-semisimple**, **HodgeStructuresPartII:H.2/complex-fixed-part**, **tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules**, **tauceti:TauCetiRoadmap/ReductiveGroups#layer-4-jordan-decomposition-diagonalizable-groups-tori**.

Acceptance:

- For L=S⊕S the multiplicity is a two-dimensional constant Hodge structure, not a second nonconstant variation.
- For rank one, different single-index assignments differ by integer renumbering.

Sources: [Del87](https://publications.ias.edu/sites/default/files/56_Untheoremede.pdf?download=1), §§1.13–1.14 and full proof, pp.9–10: Matrix grading lift, homogeneous projector and shift ambiguity.; [LL22](https://arxiv.org/pdf/2202.00039v3), Proposition 4.1.4(2), p.28: Isotypic version used by Landesman–Litt..

Suggested-file scope: Pointwise rational/complex fibre, necessary disc data, rank-one residue or constant/product-family shadow only. No full global carrier or theorem is asserted. Remaining full signatures use G1/G14; RG1/RG4.

### Real variation attached to an irreducible constituent

**HodgeStructuresPartII:H.2/irreducible-real-form** · construction · proposed name **IrreducibleRealForm**.

Given an irreducible complex local system L occurring in the complexification of a graded-polarizable real VMHS, choose a pure weight-graded quotient in which L occurs and its complex PVHS from isotypic decomposition. If L admits an actual real form, choose that form and the compatible real Hodge grading (weight may be renumbered). Otherwise use the canonical real form of L⊕conjugate(L). Call the resulting real PVHS tilde L. A self-conjugate irreducible representation can be quaternionic; an isomorphism L≅conjugate L alone is not enough to choose the first branch. Choices are recorded and unique only up to the appropriate isomorphism/renumbering.

Hypotheses: Irreducible complex L; nonzero map L→V_C for graded-polarizable real mixed V; an actual real-form choice in the first branch.

Construction or proof:

1. Choose the least weight step meeting the injected irreducible L to obtain a nonzero pure-graded map.
2. Use isotypic shift uniqueness and conjugation to obtain the compatible real grading when an involutive real form exists; otherwise use doubled realification.
3. Do not convert existence of a real form into a canonical selected real structure.

Direct prerequisites: **HodgeStructuresPartII:H.2/graded-variation**, **HodgeStructuresPartII:H.2/isotypic-hodge**, **HodgeStructuresPartII:H.2/realification**.

Uses:

- LL24 Proposition 4.2.2: Supplies the pure real factor in a mixed evaluation map.

API:

- **IrreducibleRealForm.variation** (constructor): Chosen real PVHS tilde L with the displayed branch.
- **IrreducibleRealForm.complexification** (equivalence): Compare with L or L⊕conjugate L, respecting flat maps and Hodge type.
- **IrreducibleRealForm.choiceInvariant** (compatibility): Changing real form or Hodge shift yields the corresponding isomorphism and compensating multiplicity Hodge shift, rather than literal equality.

Unit tests:

- **IrreducibleRealFormTest.realLine** (computation): A trivial complex line with chosen ordinary real form has real rank one in the first branch.
- **IrreducibleRealFormTest.nonrealCharacter** (computation): A line character whose image is not contained in R* has no real form and yields a real rank-two doubled variation.
- **IrreducibleRealFormTest.quaternionic** (non-example): For an irreducible L with a conjugate-linear intertwiner J satisfying J²=−1 and no involutive one, self-conjugacy does not permit the real-form branch.

Acceptance:

- The complexification of tilde L is L in the chosen real branch, and L⊕conjugate L in the doubled branch.

Sources: [LL24](https://arxiv.org/pdf/2205.15352v4), Equation (4.3) and Proposition 4.2.2 proof, p.26: Exactly the real-form versus doubled branch..

Suggested-file scope: Pointwise rational/complex fibre, necessary disc data, rank-one residue or constant/product-family shadow only. No full global carrier or theorem is asserted. Remaining full signatures use G1/G2; real-form/descent carrier.

### Fixed-part evaluation for an irreducible constituent

**HodgeStructuresPartII:H.2/irreducible-evaluation** · theorem · proposed name **irreducibleEvaluation**.

Let V be an admissible graded-polarizable real VMHS on smooth connected quasiprojective S, and let irreducible complex L have Hom_loc(L,V_C)≠0. For the chosen tilde L, assuming its pure variation is admissible in the same convention, Q=H⁰(S,Hom(tilde L,V)) is a nonzero constant real MHS and the flat evaluation Q⊗tilde L→V is a nonzero mixed-variation morphism. Q is allowed to be mixed and the map is not asserted surjective. LL24 asserts the same conclusion in its general real-admissibility convention without the extra finite-cover hypothesis; matching those conventions is recorded as a gap.

Hypotheses: Admissible graded-polarizable real V; irreducible complex L occurring in V_C; selected tilde L; compatible admissibility of its pure factor.

Construction or proof:

1. Construct tilde L on a nonzero weight-graded constituent.
2. Tensor/Hom admissibility makes Hom(tilde L,V) admissible; mixed fixed part gives Q its constant MHS.
3. A nonzero complex map and its conjugate, or real/imaginary part in the real branch, give Q≠0; evaluation preserves the filtrations by convolution.

Direct prerequisites: **HodgeStructuresPartII:H.2/irreducible-real-form**, **HodgeStructuresPartII:H.2/admissible-operations**, **HodgeStructuresPartII:H.2/mixed-fixed-part**.

Acceptance:

- For constant V=R(0)⊕R(−1) and L=C trivial, Q contains both weights; evaluation is not restricted to pure multiplicity.
- For V with two nonisomorphic constituents the chosen L evaluation need not cover the other constituent.

Sources: [LL24](https://arxiv.org/pdf/2205.15352v4), Proposition 4.2.2 and complete proof, p.26: Q is a constant real mixed Hodge structure and evaluation is nonzero..

Suggested-file scope: Pointwise rational/complex fibre, necessary disc data, rank-one residue or constant/product-family shadow only. No full global carrier or theorem is asserted. Remaining full signatures use G1/G2/G6.

### Algebraic monodromy group and identity component

**HodgeStructuresPartII:H.2/algebraic-monodromy** · construction · proposed name **AlgebraicMonodromy**.

For a finite-rank K-local system L, K=Q,R,C, on connected S with base point s, define G_mon(L,s) as the Zariski closure over K of the native representation π₁(S,s)→GL(L_s). Its geometric identity component G_mon° is used for connected-monodromy statements. The coefficient field, base point and fibre identification are retained; path transport identifies groups by conjugation. Passing to a finite connected topological cover replaces the image by a finite-index subgroup and leaves G_mon° unchanged. Generic closed subgroup schemes, geometric components and representation theory belong to ReductiveGroups.

Hypotheses: Connected locally path connected base; finite-dimensional fibre over K; native local coefficient system and monodromy representation.

Construction or proof:

1. Take the schematic reduced Zariski closure of the image in the native finite-dimensional GL group, using RG0/RG3.
2. Apply the native path-transport monodromy conjugacy; finite-index image gives the same identity component because its finitely many cosets cover the closure.

Direct prerequisites: **tauceti:TauCeti.LocalCoefficientSystem.monodromyRepresentation**, **tauceti:TauCeti.LocalCoefficientSystem.transport**, **tauceti:TauCetiRoadmap/ReductiveGroups#layer-0-the-functor-of-points-and-the-three-way-dictionary**, **tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components**.

Uses:

- Del71 §4.2.9 and André92 §5: Supplies the group to which semisimple/unipotent-radical conclusions apply.
- HodgeStructuresPartII:H.5: Retains infinite unitary rank-one examples when discussing integrality.

API:

- **AlgebraicMonodromy.group** (constructor): The K-Zariski closure of native monodromy inside GL(L_s).
- **AlgebraicMonodromy.identityComponent** (projection): The geometric identity component with its K-form in characteristic zero.
- **AlgebraicMonodromy.transport** (functoriality): Path transport conjugates closures; composites give coherent conjugacies.
- **AlgebraicMonodromy.finiteCover** (compatibility): Finite connected covers leave the identity component unchanged.
- **AlgebraicMonodromy.invariants** (characterisation): A vector/tensor is fixed by the closure iff fixed by every native monodromy element.

Unit tests:

- **AlgebraicMonodromyTest.trivial** (degenerate): A constant system has the trivial algebraic group.
- **AlgebraicMonodromyTest.finite** (computation): A line with image {1,−1} has finite closure μ₂ and trivial identity component.
- **AlgebraicMonodromyTest.unipotent** (computation): The Z representation m↦[[1,m],[0,1]] over Q has closure G_a, which is connected and unipotent.
- **AlgebraicMonodromyTest.unitaryInfinite** (non-example): For the complex rank-one Z character m↦exp(2πiθm), θ irrational, the closure is G_m; unitarity does not force finite image or a semisimple connected algebraic group.

Acceptance:

- Finite monodromy has trivial geometric identity component; infinite unitary monodromy need not.

Sources: [Del71](https://www.numdam.org/item/PMIHES_1971__40__5_0.pdf), §4.2.9, pp.47–48: Connected algebraic monodromy is the identity component of the closure..

Suggested-file scope: Pointwise rational/complex fibre, necessary disc data, rank-one residue or constant/product-family shadow only. No full global carrier or theorem is asserted. Remaining full signatures use G18; RG0/RG3.

### Finite determinant for integral polarized monodromy

**HodgeStructuresPartII:H.2/finite-determinant** · lemma · proposed name **finiteDeterminant**.

For a polarizable integral VHS on a smooth connected quasiprojective complex variety, every irreducible complex constituent of its underlying local system has finite-order determinant character. A merely complex or rational polarized variation without a preserved lattice does not satisfy this conclusion in general.

Hypotheses: Finite free preserved Z-lattice; pure polarizable variation; algebraic base; irreducible complex constituent.

Construction or proof:

1. Del71 §4.2.8: isotypic Hodge decomposition and fixed part of its endomorphisms make the determinant characters unitary.
2. The lattice makes eigenvalues algebraic integers and supplies all conjugate constituents, all with unit-modulus determinant. Apply the Kronecker algebraic-integer theorem; finite generation of π₁ makes the resulting torsion determinant image finite.
3. Record the exact Kronecker/finite-generation suppliers as gaps until declaration-level imports are verified.

Direct prerequisites: **ShimuraData:D3/polarized-integral-variation**, **HodgeStructuresPartII:H.2/isotypic-hodge**, **HodgeStructuresPartII:H.2/complex-fixed-part**, **tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules**.

Acceptance:

- The irrational unitary rank-one character fails the lattice hypothesis and has infinite determinant.
- A polarizable rank-one integral character has image in {1,−1}.

Sources: [Del71](https://www.numdam.org/item/PMIHES_1971__40__5_0.pdf), §4.2.8(iv), pp.45–47: The lattice and conjugate determinant argument are essential..

Suggested-file scope: Pointwise rational/complex fibre, necessary disc data, rank-one residue or constant/product-family shadow only. No full global carrier or theorem is asserted. Remaining full signatures use G1/G16.

### Semisimplicity of connected integral monodromy

**HodgeStructuresPartII:H.2/connected-semisimple** · theorem · proposed name **connectedMonodromySemisimple**.

For a polarizable integral VHS on a connected smooth quasiprojective complex variety, the geometric connected algebraic monodromy group G_mon° is semisimple. In particular this holds for the torsion-free cohomology local systems of smooth projective polarized families. Without a preserved lattice only reductivity follows from complex PVHS semisimplicity; an irrational unitary line has G_mon°=G_m.

Hypotheses: Polarizable integral pure variation; connected smooth quasiprojective base.

Construction or proof:

1. Underlying representation is semisimple, so the characteristic-zero closure is reductive.
2. After a finite cover keep the same identity component. The finite-determinant lemma makes every irreducible constituent determinant trivial on G_mon°.
3. Use the reductive-group decomposition: a connected central torus acts by scalar characters on irreducibles; its determinant powers being trivial forces every scalar character trivial, and faithfulness kills the torus. A connected reductive group with finite centre is semisimple.

Direct prerequisites: **HodgeStructuresPartII:H.2/algebraic-monodromy**, **HodgeStructuresPartII:H.2/complex-semisimple**, **HodgeStructuresPartII:H.2/finite-determinant**, **tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups**, **ShimuraData:D3/polarized-integral-variation**, **HodgeStructuresPartII:H.2/geometric-pure**.

Acceptance:

- A non-isotrivial elliptic family with Zariski-dense SL₂ monodromy has G_mon°=SL₂.
- The infinite unitary line counterexample prevents dropping integrality.

Sources: [Del71](https://www.numdam.org/item/PMIHES_1971__40__5_0.pdf), §4.2.9(a) and proof, pp.47–48: Connected semisimplicity from integral polarizable monodromy..

Suggested-file scope: Pointwise rational/complex fibre, necessary disc data, rank-one residue or constant/product-family shadow only. No full global carrier or theorem is asserted. Remaining full signatures use G1/G14/G16/G18.

### Unipotent radical of connected mixed monodromy

**HodgeStructuresPartII:H.2/mixed-monodromy** · theorem · proposed name **mixedMonodromyRadical**.

For an admissible graded-polarizable integral VMHS on a connected smooth quasiprojective base, G_mon° has semisimple graded quotient and unipotent radical equal to the kernel of its action on ⊕_k Gr^W_k V. In particular its connected solvable radical is unipotent; the whole connected group need not be semisimple. Integral means a finite free Z-local system whose rational variation and W are as above; no integral splitting of W is assumed.

Hypotheses: Admissible graded-polarizable rational VMHS plus a preserved finite free integral lattice; connected algebraic base.

Construction or proof:

1. Apply pure integral connected monodromy to all graded pieces, retaining the joint graded representation. Fixed part on tensor constructions or André92 §5 normality in the derived generic MT group gives semisimplicity of this joint graded image, not the unjustified claim that an arbitrary subgroup of a product of semisimple groups is semisimple.
2. The kernel acts as identity on each W-graded piece, hence is upper triangular unipotent. It is a normal unipotent subgroup.
3. The reductive graded quotient forces R_u into that kernel, and maximality gives equality; use RG5/RG6. André’s generic MT alternative and its supporting normality engine remain a recorded refinement.

Direct prerequisites: **HodgeStructuresPartII:H.2/algebraic-monodromy**, **HodgeStructuresPartII:H.2/graded-variation**, **HodgeStructuresPartII:H.2/mixed-fixed-part**, **HodgeStructuresPartII:H.2/connected-semisimple**, **tauceti:TauCetiRoadmap/ReductiveGroups#layer-5-solvable-and-unipotent-groups-the-unipotent-radical**, **tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups**.

Acceptance:

- A nontrivial admissible mixed Tate logarithm variation can have connected monodromy G_a.
- A split constant mixed variation has trivial monodromy even if its fibre MHS is non-split as a Hodge extension.

Sources: [Andre92](https://www.numdam.org/item/CM_1992__82_1_1_0.pdf), §5, Theorem 1, Corollaries 1–2 and proof, pp.10–11: Integral good variations and connected monodromy: pure semisimplicity, mixed unipotent radical..

Suggested-file scope: Pointwise rational/complex fibre, necessary disc data, rank-one residue or constant/product-family shadow only. No full global carrier or theorem is asserted. Remaining full signatures use G1/G17/G18.

## Supplier contracts

### ComplexComparisonPartII:C0

On algebraic analytifications, finite locally free analytic O-modules, subbundles, quotients and scalar extension must agree with holomorphic vector bundles, with local frames and sheaf tensor/exterior operations. The existing coherent-pullback node alone supplies no flat connection or smooth-Hermitian bundle. Arbitrary complex-manifold carriers remain G1 below.

Consumers: **HodgeStructuresPartII:H.2/complex-pvhs**, **HodgeStructuresPartII:H.2/canonical-extension**.

### ComplexComparisonPartII:C1

Supply the analytic sheaf/Dolbeault resolution, local logarithmic frame gluing and coherent hypercohomology interfaces on SNC complements needed for extension and unitary coefficient cohomology. Do not claim the harmonic-form Hodge theorem is part of ordinary coherent cohomology.

Consumers: **HodgeStructuresPartII:H.2/canonical-extension**, **HodgeStructuresPartII:H.2/unitary-curve-fiber**.

### ComplexComparisonPartII:C5

Extend the existing smooth-proper trivial-coefficient comparison node to flat local coefficients on SNC complements: the logarithmic Poincaré quasi-isomorphism Rj_*L≃DR_log(E) when residue eigenvalues avoid positive integers, and relative smooth-proper/relative-SNC de Rham comparison with the Gauss–Manin connection, local freeness and base change. Current C5 text includes nonproper curves; the full relative-SNC higher-dimensional coefficient case requires an explicit expansion of that supplier, not an assumed existing node.

Consumers: **HodgeStructuresPartII:H.2/log-comparison**, **HodgeStructuresPartII:H.2/gauss-manin**.

### EnhancedDerivedSheaves:E1

Supply ordinary sheaf-module kernels/cokernels and exact coefficient change, quotient local systems, derived global sections/pushforwards and coherent bounded logarithmic hypercohomology, compared with the already native local coefficient functor. The general enhanced derived carrier is imported, never rebuilt here.

Consumers: **HodgeStructuresPartII:H.2/graded-variation**, **HodgeStructuresPartII:H.2/extension-exact**, **HodgeStructuresPartII:H.2/log-comparison**, **HodgeStructuresPartII:H.2/curve-cohomology-mhs**.

### tauceti:TauCetiRoadmap/HodgeStructures#milestone-l1--polarization--hodgeriemann-semisimplicity-summit-of-the-pure-theory

Extend the intrinsic pure polarization interface from finite free integral base-change models to finite-dimensional rational and real models with the same bilinear parity and i^(2p−n) positivity sign; provide the bilinear-to-Hermitian comparison ψ=i^(−n)Q(−,conjugate(−)), dual and realification operations. No lattice or unimodularity may be inferred for complex/real systems.

Consumers: **HodgeStructuresPartII:H.2/realification**, **HodgeStructuresPartII:H.2/graded-polarizable**, **HodgeStructuresPartII:H.2/geometric-pure**.

### tauceti:TauCetiRoadmap/HodgeStructures#milestone-l2--mixed-hodge-structures-strictness-deligne

Reuse native rational MHS, gradedHodgeStructure, Hom and strictness. Supply the real-coefficient analogue and functorial tensor, dual, internal Hom and Deligne splitting compatible with rational base change. Arbitrary complex mixed structures need two filtrations and are a separate coefficient generalization; this packet only uses real/rational VMHS and their complexification. This request does not assign cohomological mixed-Hodge-complex theory to the intrinsic L2 scope.

Consumers: **HodgeStructuresPartII:H.2/mixed-variation**, **HodgeStructuresPartII:H.2/limit-mhs**, **HodgeStructuresPartII:H.2/admissible-operations**, **HodgeStructuresPartII:H.2/unitary-curve-fiber**, **HodgeStructuresPartII:H.2/unitary-bigrading**, **HodgeStructuresPartII:H.2/curve-cohomology-mhs**, **HodgeStructuresPartII:H.2/mixed-fixed-part**.

### tauceti:TauCetiRoadmap/ReductiveGroups#layer-0-the-functor-of-points-and-the-three-way-dictionary

Represent finite-dimensional GL_K(V), its rational points and their action on V, with the field K retained and compatibility with native group representations.

Consumers: **HodgeStructuresPartII:H.2/algebraic-monodromy**.

### tauceti:TauCetiRoadmap/ReductiveGroups#layer-1-representations--comodules

Finite-dimensional semisimple isotypic decomposition ⊕S_i⊗Hom(S_i,V), including evaluation isomorphism and endomorphism matrix blocks, compatible with existing Mathlib irreducibility/Schur APIs; scalar action of the connected central torus on irreducibles. No duplicate Schur lemma is requested.

Consumers: **HodgeStructuresPartII:H.2/complex-semisimple**, **HodgeStructuresPartII:H.2/isotypic-hodge**, **HodgeStructuresPartII:H.2/finite-determinant**.

### tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components

Zariski closure of a subgroup of GL_K(V) in characteristic zero, geometric identity components, conjugation/base change, finite-index invariance of the identity component and equality of vector/tensor invariants with those of the dense subgroup.

Consumers: **HodgeStructuresPartII:H.2/algebraic-monodromy**.

### tauceti:TauCetiRoadmap/ReductiveGroups#layer-4-jordan-decomposition-diagonalizable-groups-tori

A grading of a finite-dimensional matrix algebra over C by G_m, viewed as G_m→PGL(V), lifts to GL(V); any two lifts differ by an integer character. Supply the split diagonalizable central-extension calculation used in Del87 §1.14.

Consumers: **HodgeStructuresPartII:H.2/isotypic-hodge**.

### tauceti:TauCetiRoadmap/ReductiveGroups#layer-5-solvable-and-unipotent-groups-the-unipotent-radical

A subgroup acting trivially on every step-graded quotient of a finite filtration is unipotent; compare this kernel with the maximal connected normal unipotent subgroup.

Consumers: **HodgeStructuresPartII:H.2/mixed-monodromy**.

### tauceti:TauCetiRoadmap/ReductiveGroups#layer-6-reductive-and-semisimple-groups

In characteristic zero a faithful completely reducible representation detects reductivity; a connected reductive group with finite centre is semisimple; control connected central tori on irreducibles. For a normal unipotent kernel with reductive quotient, the kernel is the unipotent radical.

Consumers: **HodgeStructuresPartII:H.2/complex-semisimple**, **HodgeStructuresPartII:H.2/connected-semisimple**, **HodgeStructuresPartII:H.2/mixed-monodromy**.

## Gaps and continuation

### G1 — Global analytic variation carriers

The native fibre and local coefficient libraries do not bundle complex manifolds, smooth/holomorphic vector bundles, flat analytic connections, sesquilinear bundle metrics and holomorphic/antiholomorphic type subbundles. H.0 and ShimuraData:D3 are conditional plans (D3 review needs_changes), not implementations. C0 only covers algebraic analytifications. The suggested file therefore exposes actual native local systems and fibre flags but omits the differential/holomorphic conditions and all global signatures that require them; it must not be interpreted as a full variation definition.

Consumers: **HodgeStructuresPartII:H.2/complex-pvhs**, **HodgeStructuresPartII:H.2/realification**, **HodgeStructuresPartII:H.2/mixed-variation**, **HodgeStructuresPartII:H.2/graded-variation**, **HodgeStructuresPartII:H.2/graded-polarizable**, **HodgeStructuresPartII:H.2/canonical-extension**, **HodgeStructuresPartII:H.2/filtered-extension**, **HodgeStructuresPartII:H.2/gauss-manin**.

### G2 — Real and complex coefficient fibre generalizations

Native MixedHodgeStructure is rational with abstract integral/rational/complex base-change data, and native pure polarization starts from an integral bilinear form. No finite free lattice follows from those abstract data. Real MHS/polarizations and arbitrary complex mixed two-filtration structures need the L1/L2 contracts above. Rational fibres can be tested natively; a real condition is not replaced by an opaque proposition in Lean.

Consumers: **HodgeStructuresPartII:H.2/realification**, **HodgeStructuresPartII:H.2/mixed-variation**, **HodgeStructuresPartII:H.2/graded-polarizable**, **HodgeStructuresPartII:H.2/unitary-curve-fiber**, **HodgeStructuresPartII:H.2/mixed-fixed-part**, **HodgeStructuresPartII:H.2/irreducible-real-form**.

### G3 — Relative monodromy carrier supplier

LPV.1/monodromy-filtration and /relative-monodromy-uniqueness already own the linear algebra; their packet is needs_changes. The exact unique relative-filtration contract is imported, but there is no installed Lean bundled carrier or finite-cover naturality interface. The suggested file uses explicit necessary equations on supplied filtrations, without claiming uniqueness or existence of a full relative filtration.

Consumers: **HodgeStructuresPartII:H.2/admissible-disc**, **HodgeStructuresPartII:H.2/limit-mhs**, **HodgeStructuresPartII:H.2/admissible-operations**.

### G4 — Pure analytic degeneration input to SZ85 A.9

The complete Schmid one-variable pure graded degeneration proof (limiting Hodge flag, monodromy-centred purity and N type) cited in SZ85 A.9 has not been read/closed here. This is an external proof gap, not an H.6 prerequisite: H.6 already consumes H.2, so adding that edge creates a cycle. H.2 supplies only its mixed admissibility consequence; H.6 owns orbit estimates and multi-variable refinements.

Consumers: **HodgeStructuresPartII:H.2/limit-mhs**, **HodgeStructuresPartII:H.2/filtered-extension**.

### G5 — Curve-test and finite-cover invariance

Peters Appendix A states Kashiwara curve-test/compactification invariance and the finite-cover trick but does not prove the full statements. Read Kashiwara §§1.7–1.8 and prove compatibility of the graded-compatible limit with ramification, descent and all SNC arcs. No check restricted to generic transverse arcs suffices.

Consumers: **HodgeStructuresPartII:H.2/admissible-disc**, **HodgeStructuresPartII:H.2/admissible-variation**, **HodgeStructuresPartII:H.2/admissible-operations**, **HodgeStructuresPartII:H.2/filtered-extension**.

### G6 — General real admissibility versus the finite-cover convention

LL24 Theorem 4.1.1 permits arbitrary orthogonal/unitary real coefficients and uses real mixed Hodge modules. Such coefficients need not have quasi-unipotent boundary monodromy: a product family with an irrational unitary rank-two real character pulled from the base is a counterexample to that implication. This packet states its finite-cover admissibility corollary with quasi-unipotence explicit. Supply a precise real-exponent/R-specializable admissibility definition and the comparison with that corollary before exporting LL24 in its unrestricted form. This is a convention/proof gap, not a claim of an error in LL24.

Consumers: **HodgeStructuresPartII:H.2/admissible-variation**, **HodgeStructuresPartII:H.2/unitary-curve-family**, **HodgeStructuresPartII:H.2/irreducible-evaluation**.

### G7 — Logarithmic comparison local proof

Del70 II.6.10 and its hypotheses were read; the complete local proof in II.3.15 and II.6.9 has not been closed. C5 must supply the coefficient logarithmic Poincaré lemma and its sheaf hypercohomology/relative comparison interfaces. Ordinary proper trivial-coefficient comparison is not enough.

Consumers: **HodgeStructuresPartII:H.2/log-comparison**, **HodgeStructuresPartII:H.2/gauss-manin**.

### G8 — Filtered extension beyond a disc

The unipotent disc construction and SZ85 §5.26 exactness were read. Quasi-unipotent descended filtrations and global SNC locally free intersections/graded quotients need the multi-variable extension theorem (LL22 points to Brunebarbe §7). Until supplied, the construction node promises the disc interface and records global SNC gluing as this gap.

Consumers: **HodgeStructuresPartII:H.2/filtered-extension**.

### G9 — Cohomological pure Hodge and polarization engine

The intrinsic upstream Hodge library supplies fibre structures and Hodge–Riemann predicates, not the cohomology-to-Hodge decomposition, relative E₁ degeneration, Hard Lefschetz or geometric Hodge–Riemann theorem. Del71’s geometric argument assumes these. The upstream document places this in its separate bicomplex/cohomological sibling (issue 173), without an atlas stage we can honestly name as supplier. Record this routing need; do not add a false L0/L1 request for a cohomological theorem.

Consumers: **HodgeStructuresPartII:H.2/geometric-pure**.

### G10 — Unitary harmonic-form coefficient theorem

Timm87 §5.1 explicitly reduces to Timmerscheidt’s appendix in Esnault–Viehweg, Inventiones 86 (1986), 161–194. Its L²/logarithmic harmonic-form proof has not been read, nor has the required Kähler-identity resolution been verified in the baseline. C1 supplies sheaf analysis only; the Hodge decomposition analytic engine remains a separate proof input.

Consumers: **HodgeStructuresPartII:H.2/unitary-curve-fiber**.

### G11 — Mixed-Hodge-complex cohomology engine

Timm87 §6.4 and SZ85 §4 construct filtered coefficient log complexes and invoke Deligne mixed-Hodge-complex theory and Zucker pure-coefficient cohomology. The intrinsic L2 scope does not own cohomological mixed Hodge complexes; no suitable reviewed node was found in the catalogue screen. The next pass must route a general mixed-Hodge-complex/cohomology supplier (the bicomplex sibling is a lead), then read the exact Deligne III and Zucker theorem proofs. Do not duplicate generic derived sheaves in H.2.

Consumers: **HodgeStructuresPartII:H.2/unitary-curve-fiber**, **HodgeStructuresPartII:H.2/curve-cohomology-mhs**.

### G12 — Curve reduction and global fixed-part formal interface

Katz §4.3.4.0’s complete argument was read. It uses existence of smooth affine algebraic curves through nearby points and analytic propagation of flat sections. For the mixed case use the functorial native Deligne splitting on fibre MHS to propagate every component; a restriction to a larger curve-invariant space alone does not prove the global invariant subspace is a sub-MHS. The curve-existence/analytic propagation declarations and their owner have not been verified.

Consumers: **HodgeStructuresPartII:H.2/mixed-fixed-part**.

### G13 — General complex fixed-part analytic proof

Del87 §1.11’s entire printed norm argument was read, but its cited Schmid norm bounds and Griffiths horizontal-Hodge-component theorem were not. Obtain their exact noncompact hypotheses and complete proof. This gap is not resolved by assuming quasi-unipotence or a lattice on a complex PVHS.

Consumers: **HodgeStructuresPartII:H.2/complex-fixed-part**.

### G14 — Underlying complex semisimplicity proof

Del87 §1.12 cites Nori for the semisimplicity of the underlying complex local system in the algebraic/Kähler compactification setting; the proof is not printed there. LL22 gives the punctured-projective-curve statement; Simpson92 harmonic-metric correspondence gives the projective case, not the entire quasiprojective claim. Locate/read a published proof in the required generality or refine via curve restriction with a proven fundamental-group surjectivity theorem.

Consumers: **HodgeStructuresPartII:H.2/complex-semisimple**, **HodgeStructuresPartII:H.2/isotypic-hodge**, **HodgeStructuresPartII:H.2/connected-semisimple**.

### G15 — Family real mixed-Hodge-module direct images

LL24 Theorem 4.1.1 uses Saito/Schnell real mixed Hodge modules, Rj_*, proper Rπ_* and the locally constant smooth-object criterion (Schnell Theorem 21.1). These are not consequences of the fibre Timm87 theorem and were not independently read. No existing atlas owner supplying exactly real mixed Hodge modules was found. Route this general engine before claiming the family graded-polarizable/admissible result closed.

Consumers: **HodgeStructuresPartII:H.2/unitary-curve-family**.

### G16 — Lattice determinant arithmetic inputs

Read the Del71 §4.2.8 proof, but verify exact pinned Kronecker algebraic-integer and finite-generation-of-π₁ declarations or supply their owning stages. The all-conjugates/unit-modulus argument uses a preserved lattice; do not replace it with merely rational coefficients or invoke bounded complex unitary image as finite.

Consumers: **HodgeStructuresPartII:H.2/finite-determinant**.

### G17 — Joint graded monodromy semisimplicity

The image of the joint graded representation is not semisimple merely because each separate graded closure is semisimple. André92 §5 applies fixed part to all tensor constructions and generic derived MT normality. Supply that precise normality/representation engine, with generic MT distinguished from special-fibre MT and coefficient lattices retained, or prove the determinant/central-torus argument simultaneously for all graded weights.

Consumers: **HodgeStructuresPartII:H.2/mixed-monodromy**.

### G18 — Installed algebraic-group signatures

Generic GL group schemes, K-Zariski closures, geometric identity components and unipotent radicals are supplier contracts RG0/RG3/RG5/RG6, not installed typed carriers used by this suggested file. Omit the group-valued definitions, group properties and their tests until those interfaces are available; a native abstract group representation alone does not supply an algebraic-group scheme.

Consumers: **HodgeStructuresPartII:H.2/algebraic-monodromy**, **HodgeStructuresPartII:H.2/connected-semisimple**, **HodgeStructuresPartII:H.2/mixed-monodromy**.

## Suggested file and checks

The suggested file is a fibre/rank-one/constant-family prototype. Its complex object over a point uses an actual finite direct sum and sesquilinear Hermitian form. Rational mixed fibres and graded maps reuse native objects; the graded polarization has actual rational and complex bilinear forms linked by base change. Disc data retain actual nilpotence and weight-lowering equations, while the unavailable holomorphic and centred graded-quotient conditions are explicitly omitted. Residue examples compute the sign, strip and tensor integer correction. No full global theorem is asserted for a partial carrier.

The file represents 64 distinct planned names through these limited signatures/examples and explicitly lists 66 omitted full signatures. The per-node suggestedCoverage table gives the exact trace. A full-file lean-check attempt stopped before type checking because the shared build lacks the cached TauCeti.AlgebraicTopology.LocalCoefficient object. A separate Mathlib-only probe of residue, filtration and invariant signatures elaborated with placeholder-proof warnings only. The full file is **not certified as elaborated**. The shared Mathlib is exactly the pin; its Tau source HEAD differs, but all 23 transitive imported Tau modules have unchanged source bytes at the Tau pin. No library build or cache fetch was run.

The blueprint checker passed with no errors or packet warnings, including checks against the shared declaration index. All stage targets are planned; none is claimed closed. The continuation closes the following work:

- Close G1–G3/G18 and the analytic/fibre/relative-filtration/algebraic-group supplier contracts; replace the partial suggested signatures with full global carriers.
- Close G4–G8: pure degeneration input, Kashiwara finite-cover/curve test, real-exponent convention, local logarithmic comparison and SNC filtered extension.
- Route and close G9–G11/G15: cohomological Hodge, unitary harmonic-form, mixed-Hodge-complex and real mixed-Hodge-module engines.
- Close G12–G14: curve propagation, analytic fixed-part proof and full quasiprojective underlying-complex semisimplicity.
- Close G16–G17: exact lattice arithmetic declarations and joint graded monodromy semisimplicity.
- Read all requested supplier outputs after their reviews; ShimuraData:D3 and LPV.1 are needs_changes plans, not accepted/native implementations.

## Source versions and correction

- **[LL24: Canonical representations of surface groups](https://arxiv.org/pdf/2205.15352v4)**, Aaron Landesman and Daniel Litt. arXiv:2205.15352v4, 23 February 2025. Accessed 2026-10-07; SHA-256 4cb511ba40675aa6899b351f2ee27eb9487b4a21f65ec8000c1f2cc1a5107ceb. Read: §4.1–4.2 complete statements and printed proofs, pp.24–26; §5.1.1–5.1.3 and §5.3 Gauss–Manin setup, pp.27–29. The mixed-Hodge-module proof cited in §4.1 is not independently established here.
- **[LL22: Geometric local systems on very general curves and isomonodromy](https://arxiv.org/pdf/2202.00039v3)**, Aaron Landesman and Daniel Litt. arXiv:2202.00039v3. Accessed 2026-10-07; SHA-256 4f291599d8259d8084677c9f4325cc4329e7460d246ff0b311aa739da45763ab. Read: §4.1 pp.27–29: Definitions 4.1.1–4.1.3, Proposition 4.1.4 and its entire printed proof; parabolic assertions routed to H.4, not redeveloped here.
- **[Del70: Équations différentielles à points singuliers réguliers](https://publications.ias.edu/sites/default/files/Number9.pdf?download=1)**, Pierre Deligne. Lecture Notes in Mathematics 163 (1970), IAS public scan; corrected by April 1971 erratum. Accessed 2026-10-07; SHA-256 0dc37edd7758198cc4cd7ebed0dae63ff821336cebe739636a31591671593ba2. Read: II §5: Propositions 5.2–5.4, Remark 5.5, Corollary 5.6 and full construction; II §6: Corollary 6.10, Propositions 6.13–6.14 and proof §§6.17–6.18. Supporting local comparison lemmas 3.15/6.9 not fully checked.
- **[Del70Err: Erratum to Équations différentielles à points singuliers réguliers](https://publications.ias.edu/sites/default/files/Erratum%20to%20SLN%20163.pdf?download=1)**, Pierre Deligne. April 1971, all three pages. Accessed 2026-10-07; SHA-256 d603a393015cec4ed55a7ee852957b513526379092ad89231ec6f66e4ec59d2b. Read: Entire erratum: removal of II.1.23–1.24, corrected regularity proof for II.4.1, and reference corrections.
- **[Del71: Théorie de Hodge II](https://www.numdam.org/item/PMIHES_1971__40__5_0.pdf)**, Pierre Deligne. Publications Mathématiques de l’IHÉS 40 (1971), 5–58, published scan. Accessed 2026-10-07; SHA-256 748edefb44fded8af67869abfed87062d66977d25b5d12f7d014f1810a063c3f. Read: §§4.1–4.2, pp.40–48, complete printed proofs of invariant cycles, fixed part, semisimplicity and algebraic monodromy; earlier Hodge foundations consumed from upstream.
- **[Del87: Un théorème de finitude pour la monodromie](https://publications.ias.edu/sites/default/files/56_Untheoremede.pdf?download=1)**, Pierre Deligne. Progress in Mathematics 67 (1987), 1–19, IAS public author scan. Accessed 2026-10-07; SHA-256 efbfd98f93f1ae0f34f1f983bfb8b07c3cae9ab02638cc6a4ad2d13c9b84602b. Read: §§1.11–1.14, printed pp.8–10: fixed part, semisimplicity discussion, isotypic structures and grading-lift proof. Underlying complex semisimplicity in §1.12 cites Nori; its proof is a recorded gap.
- **[SZ85: Variation of mixed Hodge structure. I](https://gdz.sub.uni-goettingen.de/download/pdf/PPN356556735_0080/LOG_0032.pdf)**, Joseph Steenbrink and Steven Zucker. Inventiones Mathematicae 80 (1985), 489–542, GDZ published scan. Accessed 2026-10-07; SHA-256 d8a41457f4174ac5844ca2129c3db842e5f0ae37e8e8c4ec3bcdb006627e88ad. Read: §§2.1–2.11, pp.498–502: relative monodromy discussion; §§3.1–3.17, pp.507–512: definitions and non-examples; §§4.1–4.20, pp.513–518: cohomology and curve fixed part with full printed proof; §5.26 strictness; Appendix A.1–A.10, pp.537–541, full printed arguments. Cited Schmid and Zucker analytic engines are distinguished from these arguments.
- **[Timm87: Mixed Hodge theory for unitary local systems](https://gdz.sub.uni-goettingen.de/download/pdf/PPN243919689_0379/LOG_0011.pdf)**, Klaus Timmerscheidt. Journal für die reine und angewandte Mathematik 379 (1987), 152–171, GDZ published scan. Accessed 2026-10-07; SHA-256 603f6c75a04fdc3fd5035764d6119ceb6c0f4ce3668bb62bf7b460e7b3e65025. Read: §5 Theorem 5.1 and its reduction to the 1986 appendix; §6 Lemma 6.2, Theorem 6.3 and Proposition 6.4 proof; §7 Theorem 7.1 and realification/direct-summand proof, pp.163–170. The 1986 harmonic-form appendix is a separate missing proof input.
- **[Peters: Deformations and rigidity for mixed period maps](https://www-fourier.univ-grenoble-alpes.fr/~peters/Articles/bisect_AG.pdf)**, Gregory Pearlstein and Chris Peters. 53-page author preprint; Appendix A pagination belongs to this version. Accessed 2026-10-07; SHA-256 884152764d3854fc8f31327b41dc68114bde2d6244a8e34507a8d5b7ca6e6456. Read: Appendix A, pp.51–53, complete definitions of pre-admissibility and curve-test admissibility, Kashiwara reference and non-admissible Hodge–Tate example. No identification with the 2024 version-of-record pagination is claimed.
- **[Andre92: Mumford–Tate groups of mixed Hodge structures and the theorem of the fixed part](https://www.numdam.org/item/CM_1992__82_1_1_0.pdf)**, Yves André. Compositio Mathematica 82 (1992), 1–24, published PDF. Accessed 2026-10-07; SHA-256 074b1c8edfaef320e24b617bf4dda594e80ac5f555f28dc8cee9fcb371d2d14e. Read: §§2 and 4, pp.3–4 and 8–9, MT and good integral variations; §5 Theorem 1 and Corollaries 1–2 with entire proof, pp.10–11. Its higher-dimensional curve reduction is followed to Katz §4.3.4.0.
- **[Milne: Introduction to Shimura Varieties](https://www.jmilne.org/math/xnotes/svi.pdf?download=1)**, James S. Milne. 2017 notes. Accessed 2026-10-07; SHA-256 f637e61735ff9cf9730c43d978d8f05185685a37d5e1920fc3347061c83d7c7e. Read: §2 pp.28–29: pure real variations and the opposed filtration/transversality convention, imported from ShimuraData:D3.
- **[Katz72: Algebraic solutions of differential equations (p-curvature and the Hodge filtration)](https://web.math.princeton.edu/~nmk/old/algsoln.pdf)**, Nicholas M. Katz. Inventiones Mathematicae 18 (1972), 1–118, author-hosted GDZ scan. Accessed 2026-10-07; SHA-256 bc428a0280a71c5237ca99db058ca9117f045bf640660e69ba30a1d97759b836. Read: §§4.3.3–4.3.6, printed pp.69–71, complete curve-reduction and geometric fixed-part/Leray proofs; no claim to have read the other 115 pages.

The packet records the known April 1971 Deligne erratum as HodgeStructuresPartII/E1. II.1.23/1.24 are removed and the dependent II.4.1 regularity proof is replaced. Canonical-extension and comparison nodes use the corrected proof route. No new source-error claim is made. Selected passages, complete printed arguments and unread cited analytic engines are distinguished in the source records and gaps.
