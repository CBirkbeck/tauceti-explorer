# Complex comparison, Part II

This roadmap adds coherent analytic modules, coherent GAGA and algebraic de Rham–Betti comparison to the shared complex analytification programme. Its objects retain nilpotents. Its comparisons are the canonical pullback, exchange, integration and coefficient maps, so that an arithmetic application can identify its own sections, residues, periods and monodromy through those maps.

The mathematical layers are C0–C5. C0 supplies the coherent analytic algebra and the general exchange map; C1 proves analytic cohomology and projective twist inputs independently of algebraization; C2 proves projective GAGA; C3 proves proper GAGA; C4 applies coherent-ideal and graph algebraization; C5 builds ordinary, relative, Hodge and regular-singular logarithmic comparisons. The table of acceptance cases distributes the arithmetic examples among those layers. C6 contributes no mathematical target.

## Conventions and shared objects

All analytic spaces have finite complex dimension and use quotient structure sheaves of convergent holomorphic functions. Ideals need not be radical. Algebraic schemes are locally of finite type over C unless a target specifies another base. The symbol F^an means tensor pullback along the canonical locally ringed-space map X^an→X, rather than an independently assigned analytic module. For an analytic coherent module, coherence means local finite presentation over a coherent analytic structure sheaf; Noetherian stalks alone do not establish this sheaf condition.

Cohomology uses the native sheaf-cohomology and derived sheaf-module objects. Exterior derivatives and connections are C-linear; relative derivatives are f⁻¹O_S-linear. They generally are not O_X-linear. Accordingly the de Rham complex is a complex of abelian or C-module sheaves, with coherent O-modules in its terms, and its comparison uses differential operators or principal parts. This distinction also applies to the logarithmic monodromy triangle.

A positive coordinate loop has integral ∫dz/z=2πi. First Chern forms use iΘ/(2π), with the Fubini–Study hyperplane class integrating to 1 on P¹. The Hodge star on complex forms is C-linear; conjugation occurs in its metric pairing. The nonnegative Hodge Laplacian is dd*+d*d, and on functions it is the negative of the scalar div-grad Laplacian. For a canonical logarithmic extension choose residue representatives 0≤Re(a)<1; its positive-loop monodromy is exp(−2πia). The general strip extension needs an integer lattice adjustment under tensor products. The unipotent extension has its separate tensor compatibility.

## Inputs and ownership

ComplexComparison PR196, Layers 0–2 at head 4bd72379658126cbe9be935656396f0c9dac4de0, proposes the nonreduced analytic-space carrier, its quotient/gluing maps and finite-type scheme analytification. AnalyticGeometry PR279, Milestones 5–7 at head 581f66fed0f12fe49b8f5dd96aa18d3e435c190a, proposes the smooth holomorphic bundle carrier. Both remain open supplier proposals. Their integration is an explicit gap; C0 applies them and does not construct a competing carrier. The finite-coefficient Artin comparison of PR196 does not supply the arbitrary-abelian-coefficient result needed in C5.

Current TauCetiRoadmap main f9e4a9026b04c282878900edaada0a3f3eb3c82a and Tau Ceti a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039 were checked against the older atlas snapshot. AlgebraicVectorBundles L0A–L0C owns the general sheaf-module monoidal, internal-Hom, finite locally free, exterior-power and determinant interfaces. DifferentialGeometry L5–L9 owns smooth forms, Stokes, smooth de Rham theory, integration/cup comparison and duality. The pinned `TauCeti.Hodge.Conjugation` and `TauCeti.Hodge.HodgeStructureOn` structures already provide the abstract Hodge carrier, and Completed HodgeStructures owns its broader linear algebra; its completion does not prove analytic Hodge theory. These existing plans are imported. DifferentialGeometry needs an extension for Ehresmann and Hermitian holomorphic Chern connections, PDE needs compact bundle elliptic estimates beyond its scalar D16, and OperatorTheory needs the Montel/Schwartz compact-map cohomology interface.

The projective algebraic cohomology inputs belong to R09.1; proper Chow dévissage and resolution belong to R09.2; algebraic-space étale descent and algebraic family Hom/Isom belong to R09.3. SchemeAndStackFoundations SF.1/SF.2 supplies the native sites, module descent, derived comparison and bounded hypercohomology. DiamondsAndVStacks D0 supplies the acyclic-cover Čech-to-derived comparison. AlgebraicCurves supplies the existing projective function-field model and open immersion of an affine curve, and AlgebraicTopology supplies singular chains, products, trace and finite-CW inputs.

ComplexComparison is tier 5. Its elementary prelog, logification, chart, logarithmic-differential, log-smooth and ordinary-connection prefix is therefore planned here. The higher-tier CrystallineCohomology and DerivedDeRhamCohomology owners import this prefix; divided powers, crystalline sites, the full cotangent complex and derived de Rham remain with them. HodgeStructuresPartII H.0/H.2/H.6/H.8 imports the ordinary-connection, canonical-extension/Gauss–Manin, proper-log-monodromy and geometric-Hodge interfaces respectively. Higgs, Rees, variations and limiting Hodge constructions retain their existing owners. Consumer exports to SF.6 and MC.2 are outputs, never upward prerequisites. Definable Chow and nonproper Borel algebraicity remain in their existing owners.

## Pinned prototype boundary

The suggested file elaborates against Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. It uses the actual germ quotient, ring/ideal quotients, sheaf-module categories, native sheaf cohomology, Kähler differentials, exterior powers, cochain complexes, monoids and inner-product operators. At those pins the shared analytic-space carrier, global analytic cotangent gluing, compact manifold form/current carrier and algebraic-space derived interfaces are unavailable. The suggested signatures therefore omit those conditions, as the prototyping convention requires; they do not encode the omitted condition by an arbitrary proposition or opaque carrier. Ringed-site GAGA signatures are meaningful only after supplying the projective/proper analytification data specified below.

The affine/stalk tests retain their native operations. The Hodge star prototype uses an oriented plane chart, and the harmonic/curve tests use the supplied finite cohomology models; their identification with geometric cohomology is a target below. The regular-singular prototype gives the rank-one rational connection chart on P¹, including the derivative factor at infinity. The full statements below, rather than those limited carrier prototypes, are the formalization contract. All implementation statuses are unchecked.

<a id="c0"></a>

## C0. Coherent analytic algebra and pullback

Start with convergent germs and the unique Weierstrass quotient/remainder, then prove sheaf coherence rather than replacing it by stalk Noetherianity. Use quotient sheaves for closed analytic subspaces and the canonical local-ring map for coherent analytification. The all-degree exchange map is constructed here before either projective or proper comparison is proved.

Atlas objects: Convergent power-series ring; Weierstrass division; Weierstrass preparation; Oka coherence; Cartan–Remmert dimension theorem.

<a id="C0-repair-analytification"></a>

### Applying the shared complex analytification carrier

Use the finite-type complex-scheme analytification supplied by ComplexComparison PR196 Layers0–2, including quotient structure sheaves, nonreduced schemes, morphisms over C and the canonical locally ringed-space map φ_X:X^an→X. This target applies that carrier to coherent sheaves; it does not construct a second analytification functor.

Target `C0/repair-analytification` (application). Dependencies: `mathlib:AlgebraicGeometry.LocallyRingedSpace`.

Prototype: `TauCeti.ComplexComparison.schemeCoherentAnalytification`.

Proof route: Take the shared quotient-sheaf and gluing construction, not just the topology of complex points. Use its canonical morphism of locally ringed spaces to feed the native sheaf-module pullback API. Retain nilpotent ideals in every closed-subspace comparison.

Acceptance: The dual-number point has one underlying point and structure ring C[ε]/(ε²). Functoriality, products and closed immersions are the supplier maps, with the C-linear structure retained.

Proof references: [SGA1-XII](https://arxiv.org/pdf/math/0206203v2), XII1.1–1.2, printedpp.239–241, PDF255–257.

<a id="C0-convergent-germs"></a>

### Convergent holomorphic germs

For n≥0, O_n is the subring of Filter.Germ(𝓝0)(C^n,C) consisting of germs with a representative analytic over C near0. It is the ring C{z_1,…,z_n}, with evaluation at0, maximal ideal of vanishing germs, and the Taylor map to the formal power-series ring. Equality is agreement on some neighbourhood, rather than equality of arbitrarily chosen representatives.

Target `C0/convergent-germs` (definition). Dependencies: `mathlib:Filter.Germ.valueRingHom`, `mathlib:AnalyticAt`.

Prototype: `TauCeti.ComplexComparison.ConvergentGerm`.

Proof route: Use neighbourhood equivalence of functions and the native analytic predicate. Addition and multiplication descend and preserve analyticity. Taylor expansion identifies the germ with a series converging on some positive polydisc; evaluation is the native germ ring map.

API:

- `ConvergentGerm.ofAnalytic` (constructor): An analytic representative defines a germ independently of its extension away from0.
- `ConvergentGerm.eval` (compatibility): Evaluation is Filter.Germ.valueRingHom restricted to the analytic subring.
- `ConvergentGerm.taylor_injective` (characterisation): Equality of all Taylor coefficients is equality of germs.

Discriminating tests:

- `ConvergentGerm.zeroVariables` (degenerate): O_0 is canonically C.
- `ConvergentGerm.coordinate_eval` (computation): The i-th coordinate has evaluation0 and first Taylor coefficient1 in direction i.
- `ConvergentGerm.inverse_one_sub_coordinate` (characterisation): 1−z is a unit, with germ inverse Σ_{j≥0}z^j on |z|<1; this distinguishes germs from polynomial rings.

Uses: C0 local analytic rings and coherent presentations — Provides the local coefficient rings and their convergent, rather than merely formal, algebra.; SGA1 XII1.1 — Completion identifies analytic and algebraic local rings at a complex point..

Acceptance: The named API and the three discriminating tests below hold in the shared carrier, through the specified compatibility maps.

Proof references: [DEMAILLY](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf), II2.1–2.7, pp.79–81.

<a id="C0-weierstrass-division"></a>

### Convergent Weierstrass division

Let f∈O_n be regular of order d in the last variable (f(0,z_n) has a zero of exact order d). Every g∈O_n has unique g=qf+r, with q∈O_n and r=Σ_{j<d}a_j(z′)z_n^j, a_j∈O_{n−1}. The quotient and remainder converge after a common shrink of polydiscs.

Target `C0/weierstrass-division` (theorem). Dependencies: [C0/convergent-germs](#C0-convergent-germs).

Prototype: `TauCeti.ComplexComparison.weierstrassDivision`.

Proof route: Choose a small contour enclosing the d zeros with f nonzero on it. Cauchy division produces holomorphic coefficient functions and quotient on a smaller polydisc. The residue formula and uniqueness for a distinguished polynomial give uniqueness; formal division alone supplies no convergence.

Acceptance: Dividing z^3 by z² gives q=z,r=0; dividing z+1 by z² gives r=z+1.

Proof references: [DEMAILLY](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf), II2.3 and proof, pp.80–81.

<a id="C0-weierstrass-preparation"></a>

### Convergent Weierstrass preparation

For f as in Weierstrass division, f=uP uniquely, where u is a unit of O_n and P is monic of degree d in z_n, with all lower coefficients in the maximal ideal of O_{n−1}. The unit and polynomial are convergent germs.

Target `C0/weierstrass-preparation` (theorem). Dependencies: [C0/weierstrass-division](#C0-weierstrass-division).

Prototype: `TauCeti.ComplexComparison.weierstrassPreparation`.

Proof route: Divide z_n^d by f and isolate the polynomial remainder. The leading coefficient is a nonvanishing germ and supplies the unit. Apply uniqueness of division to compare two factorizations.

Acceptance: For f=z²(1+z), the prepared polynomial is z² and the unit is 1+z; preparation retains the exact regular order two.

Proof references: [DEMAILLY](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf), II2.1 and proof, p.80.

<a id="C0-noetherian-germs"></a>

### Noetherian analytic local rings

O_n is a Noetherian local C-algebra with maximal ideal (z_1,…,z_n), and its completion is C[[z_1,…,z_n]]. Quotients O_n/I by finitely generated ideals remain Noetherian local rings, including nonradical I.

Target `C0/noetherian-germs` (theorem). Dependencies: [C0/weierstrass-preparation](#C0-weierstrass-preparation).

Prototype: `TauCeti.ComplexComparison.noetherianGerms`.

Proof route: Use induction on n and a generic coordinate change making one nonzero ideal element regular in z_n. Weierstrass division makes the quotient finite over O_{n−1}; Noetherian induction controls every ideal. Use Taylor coefficients and powers of the maximal ideal for the completion.

Acceptance: The quotient C{z}/(z²) is a local length-two ring with nonzero square-zero class z; its completion preserves that class.

Proof references: [DEMAILLY](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf), II2.6–2.7 and proofs, p.81.

<a id="C0-oka-coherence"></a>

### Oka coherence of the holomorphic sheaf

On an open subset of C^n the holomorphic structure sheaf is coherent: every morphism O^r→O^s has a locally finitely generated relation sheaf. A quotient analytic space defined by a coherent ideal, including a nonradical ideal, has coherent structure sheaf.

Target `C0/oka-coherence` (theorem). Dependencies: [C0/noetherian-germs](#C0-noetherian-germs), [C0/weierstrass-division](#C0-weierstrass-division).

Prototype: `TauCeti.ComplexComparison.okaCoherence`.

Proof route: Choose a Weierstrass-regular relation and divide uniformly near the base point. Induct on dimension to generate relations on one common neighbourhood, not just independently at each stalk. Descend presentations along the coherent ambient ideal; kernels and quotient structure sheaves retain the nilpotent relations.

Acceptance: The relation sheaf of (a,b)↦za+wb on C² is generated by (−w,z). The nonradical quotient by z² remains coherent.

Proof references: [DEMAILLY](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf), II3.11–3.19, pp.87–90; II9.10, pp.123–124.

<a id="C0-coherent-analytic-module"></a>

### Coherent analytic module category

For an analytic space T with coherent O_T, Coh(T) is the full subcategory of native SheafOfModules(O_T) satisfying SheafOfModules.IsFinitePresentation. This agrees with finite local generation together with finite local generation of the kernel of every finite-free presentation. Morphisms are the existing O_T-linear sheaf morphisms.

Target `C0/coherent-analytic-module` (construction). Dependencies: `mathlib:SheafOfModules.IsFinitePresentation`, [C0/oka-coherence](#C0-oka-coherence).

Prototype: `TauCeti.ComplexComparison.CoherentAnalyticModule`.

Proof route: Apply the native local-finite-presentation condition to the analytic structure sheaf. Coherence makes the condition independent of chosen local finite generators. Use full-subcategory morphisms and the sheaf-module gluing API; do not invent a parallel module category.

API:

- `CoherentAnalyticModule.ofPresentation` (constructor): A finite local cokernel presentation gives an object.
- `CoherentAnalyticModule.presentation_iff` (characterisation): Local finite presentation is equivalent to the coherent-module condition over coherent O_T.
- `CoherentAnalyticModule.hom_ext` (extensionality): A morphism is determined by its restrictions on an open cover.

Discriminating tests:

- `CoherentAnalyticModule.free` (compatibility): O_T^r gives the native finite-free sheaf module of rank r.
- `CoherentAnalyticModule.zero` (degenerate): The zero sheaf has a presentation of ranks0 and0.
- `CoherentAnalyticModule.torsion` (non-example): O_C/(z) is coherent but not locally free at0.

Uses: C1–C3 coherent cohomology and GAGA — Carries all algebraic-to-analytic module functors and comparisons.; Qian companion Proposition3.6 — Carries the coherent terms of the log differential complex..

Acceptance: The named API and the three discriminating tests below hold in the shared carrier, through the specified compatibility maps.

Proof references: [DEMAILLY](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf), II3.11–3.16, pp.87–89.

<a id="C0-coherent-operations"></a>

### Coherent kernels, tensor and internal Hom

On a coherent analytic ringed space, kernels, cokernels, extensions, finite tensor products and internal Hom of coherent O-modules are coherent. Restrictions preserve coherence and coherent modules with compatible transition isomorphisms glue effectively on open covers. The resulting category is abelian; this is not inferred from Noetherian stalks alone.

Target `C0/coherent-operations` (theorem). Dependencies: [C0/coherent-analytic-module](#C0-coherent-analytic-module).

Prototype: `TauCeti.ComplexComparison.coherentOperations`.

Proof route: Reduce each operation to kernels and cokernels of finite-free local presentations. For Hom, present its first argument and identify Hom as the kernel between finite sums of the second argument. Glue finite presentations locally and apply sheaf descent; import the general monoidal and internal-Hom construction from AlgebraicVectorBundles.

Acceptance: For multiplication by z on O/(z²), both its kernel (z) and cokernel O/(z) are coherent, while the kernel is not a free rank-one O-module.

Proof references: [DEMAILLY](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf), II3.13–3.16, pp.88–89; II9.12, p.124.

<a id="C0-coherent-analytic-ideal"></a>

### Coherent analytic ideals and nilpotent quotients

A coherent analytic ideal is an O_T-submodule I⊆O_T whose sheaf module is coherent. Use the shared analytic-space quotient carrier with sheaf O_T/I and underlying zero locus; do not replace I by its radical. Inclusion and quotient are maps in the native module category.

Target `C0/coherent-analytic-ideal` (construction). Dependencies: [C0/coherent-operations](#C0-coherent-operations), [C0/repair-analytification](#C0-repair-analytification).

Prototype: `TauCeti.ComplexComparison.CoherentAnalyticIdeal`.

Proof route: Use coherent submodules of the structure sheaf. The supplier constructs the quotient locally ringed space; apply coherence to its quotient structure sheaf. Pullback of the quotient extends the ideal, rather than taking the inverse image of its set of zeros alone.

API:

- `CoherentAnalyticIdeal.quotient` (data): The structure sheaf of the quotient is O_T/I.
- `CoherentAnalyticIdeal.pullbackQuotientIso` (compatibility): Pullback of O/I is O′/(I O′).
- `CoherentAnalyticIdeal.quotientMap` (projection): O_T→O_T/I has kernel exactly I.

Discriminating tests:

- `CoherentAnalyticIdeal.dualNumbers` (computation): The quotient of O_C at0 by (z²) has basis1,z and z≠0,z²=0.
- `CoherentAnalyticIdeal.zeroIdeal` (degenerate): I=0 retains T and its entire structure sheaf.
- `CoherentAnalyticIdeal.unitIdeal` (degenerate): I=O_T gives the empty analytic subspace.

Uses: C2 nonreduced GAGA and C4 Chow — The coherent ideal, including multiplicities, is the algebraization datum.; C6 infinitesimal point acceptance — Distinguishes the thickened point from its reduction..

Acceptance: The named API and the three discriminating tests below hold in the shared carrier, through the specified compatibility maps.

Proof references: [DEMAILLY](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf), II9.10–9.14, pp.123–124.

<a id="C0-holomorphic-bundle-dictionary"></a>

### Holomorphic bundles and locally free coherent modules

On a smooth complex manifold, taking holomorphic sections gives an equivalence between finite-rank holomorphic vector bundles from the shared AnalyticGeometryMilestonesPR279 Milestone7 carrier and finite locally free coherent O-modules. It preserves tensor, dual, exterior powers, determinant and holomorphic pullback. This dictionary is stated on smooth spaces, rather than used as a definition on singular spaces.

Target `C0/holomorphic-bundle-dictionary` (theorem). Dependencies: [C0/coherent-operations](#C0-coherent-operations).

Prototype: `TauCeti.ComplexComparison.holomorphicBundleDictionary`.

Proof route: Use a finite holomorphic frame to identify the section sheaf with O^r. Recover transition matrices from overlaps of module frames, and glue the supplier bundle. Check the tensor/dual/determinant formulas on frames and descend.

Acceptance: The rank-two trivial bundle has section module O² and determinant O. The coherent torsion module O/(z) is excluded from the finite locally free subcategory.

Proof references: [DEMAILLY](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf), II3.1–3.6, pp.83–86.

<a id="C0-repair-local-faithful-flatness"></a>

### Faithfully flat algebraic-to-analytic local comparison

For X locally of finite type over C and x∈X(C), the canonical local ring map O_{X,x}→O_{X^an,x} is faithfully flat, and induces an isomorphism of maximal-ideal completions. In an affine presentation the analytic ring is O_n/I O_n, retaining nonradical I.

Target `C0/repair-local-faithful-flatness` (theorem). Dependencies: [C0/repair-analytification](#C0-repair-analytification), [C0/noetherian-germs](#C0-noetherian-germs), `SchemeAndStackFoundations:SF.1`.

Prototype: `TauCeti.ComplexComparison.localFaithfulFlatness`.

Proof route: Compute both completions as the same formal power-series quotient. Use flatness of Noetherian local completion and the completed-map criterion to obtain flatness before completion. The local map has the same residue field C, hence flatness is faithful.

Acceptance: At the origin of A¹ the local polynomial and analytic rings have completion C[[z]]. Tensoring the quotient by z² gives C{z}/(z²), retaining its nonzero nilpotent.

Proof references: [SGA1-XII](https://arxiv.org/pdf/math/0206203v2), XII1.1 and proof, printedpp.239–240, PDF255–256.

<a id="C0-repair-coherent-pullback"></a>

### Coherent sheaf analytification by ringed pullback

For X locally of finite type over C define F^an=O_{X^an}⊗_{φ_X^{-1}O_X}φ_X^{-1}F using the native sheaf-module pullback. For coherent F this lies in Coh(X^an). Object and morphism maps define the analytification functor; its exactness is proved separately.

Target `C0/repair-coherent-pullback` (construction). Dependencies: `tauceti:TauCeti.AlgebraicGeometry.FinitelyPresentedSheaf`, [C0/repair-analytification](#C0-repair-analytification), [C0/coherent-analytic-module](#C0-coherent-analytic-module).

Prototype: `TauCeti.ComplexComparison.CoherentAnalytification.functor`.

Proof route: Apply inverse image and extension of scalars to a finite local presentation. Coherence of O_{X^an} proves the pulled-back presentation is coherent. Identity, composition and module-morphism maps are those of the native pullback.

API:

- `CoherentAnalytification.obj` (data): The object is the displayed tensor pullback.
- `CoherentAnalytification.map` (functoriality): Pullback of sheaf morphisms preserves identity and composition.
- `CoherentAnalytification.tensorIso` (compatibility): (F⊗G)^an≅F^an⊗G^an.
- `CoherentAnalytification.idealQuotientIso` (compatibility): (O_X/I)^an≅O_{X^an}/I O_{X^an}.

Discriminating tests:

- `CoherentAnalytification.structureSheaf` (compatibility): O_X analytifies to the analytic structure sheaf.
- `CoherentAnalytification.freeModule` (computation): O_X^r analytifies to O_{X^an}^r, including rank0.
- `CoherentAnalytification.dualNumberQuotient` (computation): The nonreduced point retains the length-two module C[ε]/ε².

Uses: C2–C3 GAGA — The comparison functor is the canonical pullback, rather than an unnamed equivalence.; C5 analytification of de Rham terms — Applies to the coherent terms; differentials require the separate differential-operator extension..

Acceptance: The named API and the three discriminating tests below hold in the shared carrier, through the specified compatibility maps.

Proof references: [SGA1-XII](https://arxiv.org/pdf/math/0206203v2), XII1.3, printedp.241, PDF257.

<a id="C0-repair-exact-faithful-pullback"></a>

### Exact and faithful coherent analytification

For X locally of finite type over C, coherent analytification is exact and faithful and reflects isomorphisms. Flatness is checked at complex points; faithfulness uses finite-type Jacobson support detection. It need not be full on nonproper X.

Target `C0/repair-exact-faithful-pullback` (theorem). Dependencies: [C0/repair-coherent-pullback](#C0-repair-coherent-pullback), [C0/repair-local-faithful-flatness](#C0-repair-local-faithful-flatness), `SchemeAndStackFoundations:SF.1`.

Prototype: `TauCeti.ComplexComparison.exactFaithfulPullback`.

Proof route: Flat stalk pullback preserves short exact sequences. A nonzero coherent kernel, cokernel or image has a closed complex point in its support. Faithful flatness detects its nonzero stalk and yields faithfulness and isomorphism reflection.

Acceptance: On A¹ the holomorphic endomorphism exp(z) of O is not an algebraic endomorphism; exactness does not supply fullness.

Proof references: [SGA1-XII](https://arxiv.org/pdf/math/0206203v2), XII1.3, printedp.241, PDF257.

<a id="C0-coherent-pullback-operations"></a>

### Tensor, Hom, dual and determinant comparison

Analytification commutes naturally with tensor and internal Hom for finitely presented coherent modules, and with dual and determinant of finite locally free modules. It commutes with restriction, closed-immersion direct image and short exact sequences, with their actual canonical maps.

Target `C0/coherent-pullback-operations` (theorem). Dependencies: [C0/repair-exact-faithful-pullback](#C0-repair-exact-faithful-pullback), [C0/coherent-operations](#C0-coherent-operations).

Prototype: `TauCeti.ComplexComparison.coherentPullbackHom`.

Proof route: Present the first Hom argument by two finite free modules. Flatness identifies kernels after pullback, giving the internal-Hom comparison. Tensor, exterior powers and determinant follow from native sheaf-module monoidal pullback and local frames.

Acceptance: For O(1) on P¹, the analytic dual is O(−1) and the determinant of O(1)⊕O is O(1). For a double point, quotient and inclusion maps retain the nilpotent class.

Proof references: [SERRE-GAGA](https://www.numdam.org/item/AIF_1956__6__1_0.pdf), §12, Lemma6, printedp.23; SGA1 XII1.3.

<a id="C0-fiber-dimension-loci"></a>

### Cartan–Remmert source fibre-dimension loci

For a holomorphic map f:T→S of finite-dimensional complex analytic spaces, the set A_k={x∈T:dim_x f^{-1}(f(x))≥k} is a closed analytic subset of T, with the reduced induced analytic structure. Properness is not required for this source locus. For proper f its image B_k={s:dim f^{-1}(s)≥k} is a closed analytic subset of S, by C4 Remmert.

Target `C0/fiber-dimension-loci` (theorem). Dependencies: [C0/oka-coherence](#C0-oka-coherence).

Prototype: `TauCeti.ComplexComparison.fiberDimensionLoci`.

Proof route: Upper semicontinuity follows from an adapted finite projection on a common small polydisc, as in Demailly II8.2 pp.116–117. Analyticity needs the local analytic dimension-locus theorem, not upper semicontinuity alone; the unverified Whitney proof reference is an explicit gap. Glue the local defining ideals; nilpotents do not affect local fibre dimension. The proper-image consequence consumes C4 without making this node depend on it.

Acceptance: For f:C²→C,(z,w)↦zw, every fibre has local dimension1, so A_1=C² and A_2=∅. For the blowup of C² at0, A_1 is the exceptional curve while A_0 is the whole source.

Proof references: [PS08](https://math.haifa.ac.il/kobi/Newton.pdf), Theorem7.2 and Lemma8.2, author-PDFpp.21–23; Lemma8.2 redirects analyticity to Whitney9F p.240.

<a id="C3-repair-higher-image-comparison-map"></a>

### Canonical higher-direct-image comparison

For a morphism f:X→S locally of finite type over C and a coherent F, construct θ^q_{f,F}:(R^q f_*F)^an→R^q f^an_*F^an whenever the algebraic higher image is coherent; more generally construct it on sheaf modules before restricting to coherence. The degree-zero map is adjunction followed by pullback, and the higher maps form a morphism of derived direct images and their cohomology sheaves. Defining θ does not require properness.

Target `C3/repair-higher-image-comparison-map` (construction). Dependencies: [C0/repair-coherent-pullback](#C0-repair-coherent-pullback), `SchemeAndStackFoundations:SF.2`.

Prototype: `TauCeti.ComplexComparison.relativeHigherImageComparison`.

Proof route: Construct the degree-zero adjunction square of ringed-space pullback and pushforward. Use an injective/acyclic resolution and the canonical derived exchange map, rather than choose unrelated isomorphisms in each degree. Coherence restricts the construction to the coherent categories; projective and proper arguments prove its invertibility.

API:

- `HigherImageComparison.degreeZero` (compatibility): θ^0 is the pullback–pushforward adjunction map.
- `HigherImageComparison.naturality` (functoriality): A coherent sheaf morphism gives a commuting square for θ^q.
- `HigherImageComparison.composition` (compatibility): For composable maps the derived θ agrees with the composite exchange map and the Leray edge maps.

Discriminating tests:

- `HigherImageComparison.identity` (degenerate): For f=id, θ^0 is identity and positive higher images vanish.
- `HigherImageComparison.twist` (computation): For P¹→SpecC and O(−2), θ^1 maps the inverse Laurent monomial to the same analytic Čech class.
- `HigherImageComparison.nonreducedPoint` (compatibility): For Spec(C[ε]/ε²)→SpecC, θ^0 preserves the length-two C-algebra and its nilpotent element.

Uses: C2–C3 comparison in every degree — The canonical map is what the projective and proper proofs show to be an isomorphism.; C5 bounded differential-operator complexes — The termwise exchange maps induce hypercohomology comparison and connecting-map compatibility..

Acceptance: The named API and the three discriminating tests below hold in the shared carrier, through the specified compatibility maps.

Proof references: [SGA1-XII](https://arxiv.org/pdf/math/0206203v2), XII4.1–4.2, printedpp.247–249, PDF263–265.

<a id="c1"></a>

## C1. Analytic cohomology and independent projective inputs

The Dolbeault and weighted-solution route establishes coherent acyclicity on the chart domains. The standard projective cover then computes analytic twists through Laurent monomials and the imported Čech comparison. Compact coherent finiteness and the independent Cartan generation/vanishing argument supply finite twist presentations. None of these inputs is proved by assuming GAGA.

Atlas objects: Cartan theorem B; Analytic twisting sheaf; Projective twist cohomology; Cartan–Serre finiteness; Analytic Serre generation.

<a id="C1-local-dolbeault"></a>

### Dolbeault lemma with holomorphic parameters

On a polydisc in C^n, every smooth ∂̄-closed (p,q)-form with q>0 admits, after restriction to a smaller polydisc, a smooth (p,q−1)-primitive. If coefficients depend holomorphically on additional complex parameters, the primitive preserves that dependence. The degree-zero kernel is the sheaf of holomorphic p-forms.

Target `C1/local-dolbeault` (theorem). Dependencies: [C0/oka-coherence](#C0-oka-coherence).

Prototype: `TauCeti.ComplexComparison.localDolbeault`.

Proof route: Solve the one-variable equation by Cauchy–Green with a cutoff and differentiate under the integral. Remove successively the last-variable d̄z component, shrinking discs so the cutoff support stays away from the boundary. Induct in the number of variables and retain estimates on compact subpolydiscs and holomorphic parameter derivatives.

Acceptance: On a coordinate disc, ∂̄(z̄)=d z̄. For a holomorphic parameter t the primitive t z̄ remains holomorphic in t.

Proof references: [CARTAN18](https://www.numdam.org/item/SHC_1953-1954__6__A18_0.pdf), §1, pp.18-1–18-3.

<a id="C1-weighted-dolbeault-estimate"></a>

### Weighted Dolbeault estimate and minimal solution

On a complete Kähler manifold with Hermitian holomorphic bundle E, let A=[iΘ(E),Λ] be nonnegative in bidegree(p,q), q>0. If ∂̄g=0 and ∫⟨A^{-1}g,g⟩ is finite (the inverse quadratic form interpreted on the range), there is ∂̄u=g with ||u||²≤∫⟨A^{-1}g,g⟩. With u orthogonal to ker∂̄ it is unique and smooth when g is smooth. For a domain in C^n the bundle weight e^{-φ} is chosen with positive Levi form.

Target `C1/weighted-dolbeault-estimate` (theorem). Dependencies: [C1/local-dolbeault](#C1-local-dolbeault), [C1/bochner-kodaira](#C1-bochner-kodaira).

Prototype: `TauCeti.ComplexComparison.weightedDolbeaultEstimate`.

Proof route: Integration by parts and the Bochner–Kodaira identity give the coercive graph-norm estimate. Complete-metric cutoffs and Friedrichs convolution approximate both differential and adjoint domains; boundaries cannot be ignored. Hahn–Banach and Riesz represent the functional ∂̄*v↦⟨v,g⟩; elliptic regularity gives the smooth minimal solution.

Acceptance: The estimate includes completeness or an independently established boundary-domain argument, not a formal application on an incomplete open ball.

Proof references: [DEMAILLY](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf), VIII1.2, pp.364–365; VIII3.2–3.3, pp.368–369; VIII4.5–4.8, pp.371–372.

<a id="C1-stein-coherent-acyclicity"></a>

### Cartan B on the analytic domains used here

On a second-countable Stein complex space, every coherent analytic module has vanishing H^q for q>0. In particular polydiscs, C^a×(C*)^b and closed analytic subspaces of these domains are acyclic for coherent modules. Nonreduced structures are included. A finite open cover alone does not imply this result.

Target `C1/stein-coherent-acyclicity` (theorem). Dependencies: [C1/weighted-dolbeault-estimate](#C1-weighted-dolbeault-estimate), [C0/coherent-operations](#C0-coherent-operations).

Prototype: `TauCeti.ComplexComparison.cartanB`.

Proof route: Choose a complete metric and an exhaustion-dependent rapidly increasing weight so every relevant smooth form satisfies the weighted estimate. Resolve coherent modules locally by ambient free modules, of enough finite length for the fixed degree; use convex bumps and Runge approximation to glue. Pass through a countable exhaustion with the required dense transition images and surjective Čech terms; this is not an algebraization argument.

Acceptance: On C×C* the structure module has zero positive-degree cohomology; a skyscraper at one point has H⁰=C and still has no positive cohomology.

Proof references: [DEMAILLY](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf), IX4.1–4.5 and4.12–4.13, pp.419–422 and426–428.

<a id="C1-acyclic-projective-cover"></a>

### Leray projective chart computations

Apply DiamondsAndVStacks D0/cech-to-derived-comparison to the standard projective charts and their finite intersections, which are C^a×(C*)^b. The augmented Čech complex computes native sheaf cohomology because every intersection is coherent-acyclic; refine to distinguished acyclic neighbourhoods on closed analytic subspaces.

Target `C1/acyclic-projective-cover` (application). Dependencies: [C1/stein-coherent-acyclicity](#C1-stein-coherent-acyclicity), `DiamondsAndVStacks:D0/cech-to-derived-comparison`, `mathlib:CategoryTheory.Sheaf.H`.

Prototype: `TauCeti.ComplexComparison.acyclicProjectiveCover`.

Proof route: Identify the actual coordinate intersections and their restrictions. Invoke Cartan B on every intersection, including repeated-index degenerate intersections. Use the supplier Leray comparison and its naturality; no second spectral-sequence API is planned here.

Acceptance: The two standard charts of P¹ have overlap C*. Their Čech Laurent computation gives the one-dimensional H¹(O(−2)) represented by z⁻¹ in the chosen trivialization.

Proof references: [CARTAN18](https://www.numdam.org/item/SHC_1953-1954__6__A18_0.pdf), §§2–4, pp.18-3–18-7.

<a id="C1-analytic-twisting-sheaf"></a>

### Analytic projective twisting sheaves

For P^r(C) define O(k), k∈Z, by homogeneous holomorphic sections of degree k on the C* cone, equivalently by the standard-chart transition factors (Z_j/Z_i)^k. Use the shared projective analytification and native invertible-module/tensor APIs.

Target `C1/analytic-twisting-sheaf` (construction). Dependencies: [C0/coherent-operations](#C0-coherent-operations), [C0/repair-analytification](#C0-repair-analytification).

Prototype: `TauCeti.ComplexComparison.analyticTwistTransition`.

Proof route: Use homogeneous local frames and transition functions on nonzero-coordinate charts. Verify the multiplicative cocycle and glue an invertible coherent module. Identify its algebraic pullback using the same homogeneous frames.

API:

- `AnalyticTwist.chartTransition` (data): The change from frame i to frame j is the prescribed ratio to power k.
- `AnalyticTwist.tensorIso` (compatibility): O(k)⊗O(l)≅O(k+l).
- `AnalyticTwist.analytificationIso` (compatibility): Algebraic O(k) analytifies to this analytic twisting sheaf.

Discriminating tests:

- `AnalyticTwist.zero` (degenerate): O(0)≅O.
- `AnalyticTwist.dual` (characterisation): O(k)∨≅O(−k), fixing the sign of the transition factor.
- `AnalyticTwist.hyperplaneSection` (computation): Z_i is a global section of O(1), with the corresponding hyperplane as its zero scheme.

Uses: C1 twist cohomology and C2 GAGA — Provides the common analytic and algebraic twist objects and multiplication maps.; C4 projective Chow — High twists produce homogeneous generators of a coherent analytic ideal..

Acceptance: The named API and the three discriminating tests below hold in the shared carrier, through the specified compatibility maps.

Proof references: [CARTAN18](https://www.numdam.org/item/SHC_1953-1954__6__A18_0.pdf), §2, pp.18-3–18-4.

<a id="C1-twist-cohomology"></a>

### All-degree projective twist cohomology

For r≥1, H^q(P^r_an,O(k)) is zero unless q=0 or q=r; H^0 for k≥0 has homogeneous monomial basis of degree k, and H^r for k≤−r−1 has inverse monomial basis with every exponent negative and total degree k. Thus h^0=binom(k+r,r) and h^r=binom(−k−1,r), with the stated ranges. For r=0, H^0(P^0,O(k))=C for every k and all positive degrees vanish. The polynomial-to-holomorphic Čech map identifies these bases and multiplication maps.

Target `C1/twist-cohomology` (theorem). Dependencies: [C1/analytic-twisting-sheaf](#C1-analytic-twisting-sheaf), [C1/acyclic-projective-cover](#C1-acyclic-projective-cover), `AlgebraicModuliForArithmeticGeometry:R09.1`.

Prototype: `TauCeti.ComplexComparison.twistCohomology`.

Proof route: Expand convergent Laurent series on chart intersections, keeping uniform compact convergence. Split by exponent support; the augmented Čech combinatorics contracts every support pattern except the all-nonnegative and all-negative cases. Compare the surviving monomials with the algebraic calculation; connecting maps use the same Čech differential signs.

Acceptance: P¹ has h^0(O(2))=3, h^1(O(−2))=1, and O(−1) is acyclic in all degrees.

Proof references: [CARTAN18](https://www.numdam.org/item/SHC_1953-1954__6__A18_0.pdf), §§3–6, pp.18-4–18-9.

<a id="C1-compact-coherent-finiteness"></a>

### Cartan–Serre finiteness on compact analytic spaces

For a compact finite-dimensional complex analytic space T, including nonreduced T, and a coherent module F, H^q(T,F) is finite dimensional for every q and vanishes for q above a uniform ambient cohomological bound. The statement includes compact analytic algebraic spaces once their local ringed charts are supplied.

Target `C1/compact-coherent-finiteness` (theorem). Dependencies: [C0/coherent-operations](#C0-coherent-operations), [C1/stein-coherent-acyclicity](#C1-stein-coherent-acyclicity), `DiamondsAndVStacks:D0/cech-to-derived-comparison`.

Prototype: `TauCeti.ComplexComparison.compactCoherentFiniteness`.

Proof route: Topologize sections by finite local presentations on embedded analytic charts. Use nested finite distinguished covers and compact restriction maps from Montel’s theorem. The compact-map cohomology lemma of Schwartz yields finite-dimensional Čech cohomology; Leray identifies it with the native derived carrier.

Acceptance: A projective double point has H⁰(O)=C[ε]/(ε²), of dimension two, and no higher coherent cohomology. The P¹ twist computation agrees with compact finiteness.

Proof references: [DEMAILLY](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf), IX4.6–4.8 and proof, pp.422–424.

<a id="C1-analytic-serre-generation"></a>

### Independent analytic Serre generation

For a coherent module F on a projective analytic space T⊆P^r_an, there exists k_0 such that F(k) is generated by finitely many global sections for every k≥k_0. This includes nonreduced closed analytic subspaces and is proved before GAGA.

Target `C1/analytic-serre-generation` (theorem). Dependencies: [C1/compact-coherent-finiteness](#C1-compact-coherent-finiteness), [C1/analytic-twisting-sheaf](#C1-analytic-twisting-sheaf), [C0/coherent-operations](#C0-coherent-operations).

Prototype: `TauCeti.ComplexComparison.analyticSerreGeneration`.

Proof route: Induct on the dimension of support, using a hyperplane section and coherent kernel/cokernel. Use finiteness of H¹ to stabilize the relevant restriction maps after increasing twists. Nakayama gives generation near each point; compactness gives one integer and finitely many global generators.

Acceptance: On P¹, O(−2)(k)=O(k−2) is globally generated for k≥2. This assertion is proved analytically before using essential surjectivity.

Proof references: [CARTAN19](https://www.numdam.org/item/SHC_1953-1954__6__A19_0.pdf), §8, ThéorèmeA and proof, pp.19-1–19-4.

<a id="C1-analytic-serre-vanishing"></a>

### Independent analytic Serre vanishing

For F as above, there exists k_1 such that H^q(T,F(k))=0 for all q>0 and k≥k_1. Choose k_1 uniformly for the finitely many coherent modules in a given presentation/dévissage. The proof uses analytic generation and twist cohomology, not essential surjectivity of GAGA.

Target `C1/analytic-serre-vanishing` (theorem). Dependencies: [C1/analytic-serre-generation](#C1-analytic-serre-generation), [C1/twist-cohomology](#C1-twist-cohomology).

Prototype: `TauCeti.ComplexComparison.analyticSerreVanishing`.

Proof route: Analytic generation gives a surjection from a finite sum of negative twists. Its kernel is coherent; dimension shifting and the finite ambient cohomological bound descend from high degrees. Twist-cohomology vanishing closes the induction without assuming algebraization.

Acceptance: For O(−2) on P¹, all positive cohomology of O(k−2) vanishes for k≥1; the untwisted sheaf has one-dimensional H¹.

Proof references: [CARTAN19](https://www.numdam.org/item/SHC_1953-1954__6__A19_0.pdf), §9, ThéorèmeB and proof, pp.19-4–19-5.

<a id="C1-twist-presentations"></a>

### Finite twist presentations and coherent dévissage

Every coherent analytic F on P^r admits an exact O(−b)^m→O(−a)^n→F→0 with finite a,b,m,n. Kernels are coherent and the construction can be iterated to any prescribed finite length. A global bounded locally free resolution is not asserted for singular or nonreduced T.

Target `C1/twist-presentations` (theorem). Dependencies: [C1/analytic-serre-generation](#C1-analytic-serre-generation), [C0/coherent-operations](#C0-coherent-operations).

Prototype: `TauCeti.ComplexComparison.twistPresentation`.

Proof route: Generate F(a) globally to obtain the first surjection. Generate a sufficiently high twist of the coherent kernel to obtain the second map. Repeat for the finite length needed by dimension shifting; do not infer finite projective dimension on a singular space.

Acceptance: For a double point 2p in P¹, 0→O(−2)→O→O_(2p)→0 is a finite twist presentation. Its cokernel has length two, not the reduced point length one.

Proof references: [CARTAN19](https://www.numdam.org/item/SHC_1953-1954__6__A19_0.pdf), §§8–9, pp.19-1–19-5; Serre§12, Lemma5 pp.22–23.

<a id="C1-bochner-kodaira"></a>

### Bochner–Kodaira identity on a complete Kähler manifold

For a Hermitian holomorphic vector bundle E on a Kähler manifold, its Chern connection D=D′+D″ satisfies Δ″=Δ′+[iΘ(E),Λ]. On compactly supported smooth E-valued forms, integration gives ||D″u||²+||D″*u||²=||D′u||²+||D′*u||²+⟨[iΘ(E),Λ]u,u⟩. Passing to closed operator domains requires the density theorem used in the weighted estimate.

Target `C1/bochner-kodaira` (theorem). Dependencies: [C1/local-dolbeault](#C1-local-dolbeault), [C0/holomorphic-bundle-dictionary](#C0-holomorphic-bundle-dictionary).

Prototype: `TauCeti.ComplexComparison.bochnerKodaira`.

Proof route: Use the imported Hermitian bundle metric and Chern connection in a normal holomorphic frame. Compute the wedge/contraction commutators at the frame origin, then use graded Jacobi and D²=Θ. Apply integration by parts on compactly supported forms; complete-metric cutoffs and Friedrichs density extend the estimate to the graph domain.

Acceptance: The curvature commutator is included; the unweighted trivial bundle alone does not give the positive estimate.

Proof references: [DEMAILLY](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf), VII1.1–1.3 and proofs, pp.329–331; V12.10 p.270.

<a id="c2"></a>

## C2. Projective GAGA

Compare every degree of twist cohomology first. Resolve a coherent module to sufficient finite length and use exactness, finite cohomological bounds and connecting maps for general modules. Internal Hom gives full faithfulness. Analytic finite twist presentations then algebraize the presenting matrix and its cokernel. The construction includes nonreduced closed subschemes and gives an exact equivalence.

Atlas objects: Projective cohomology comparison; Projective GAGA.

<a id="C2-projective-cohomology"></a>

### Projective coherent cohomology comparison

For a projective C-scheme X, without a reducedness assumption, coherent F and q≥0, the canonical map H^q(X,F)→H^q(X^an,F^an) is a C-linear isomorphism, natural in F and compatible with connecting maps of short exact sequences.

Target `C2/projective-cohomology` (theorem). Dependencies: [C1/twist-cohomology](#C1-twist-cohomology), [C1/twist-presentations](#C1-twist-presentations), [C0/repair-exact-faithful-pullback](#C0-repair-exact-faithful-pullback), [C3/repair-higher-image-comparison-map](#C3-repair-higher-image-comparison-map), `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`, `AlgebraicModuliForArithmeticGeometry:R09.1`.

Prototype: `TauCeti.ComplexComparison.projectiveCohomology`.

Proof route: Embed X in projective space and push F forward along the closed immersion, retaining its ideal rather than reducing X. Compare all twist classes on the common acyclic Čech cover. Use coherent kernels and finite-length dimension shifting; finite algebraic cohomological dimension and analytic Serre vanishing terminate the induction.

Acceptance: The result holds for a double point embedded in P¹, whose H^0 structure sheaf has C-dimension2. It holds in all degrees, including q above the cohomological bound where both sides vanish.

Proof references: [SERRE-GAGA](https://www.numdam.org/item/AIF_1956__6__1_0.pdf), §12, Theorem1 and Lemmas5–7, printedpp.20–24; SGA1 XII4.2.

<a id="C2-projective-full-faithfulness"></a>

### Projective coherent full faithfulness

For a projective C-scheme X and coherent F,G, Hom_X(F,G)→Hom_{X^an}(F^an,G^an) is bijective. It is the canonical pullback map and is compatible with composition and identities.

Target `C2/projective-full-faithfulness` (theorem). Dependencies: [C2/projective-cohomology](#C2-projective-cohomology), [C0/coherent-pullback-operations](#C0-coherent-pullback-operations).

Prototype: `TauCeti.ComplexComparison.projectiveFullFaithfulness`.

Proof route: Identify Hom with H^0 of the coherent internal-Hom sheaf. Use flat finite-presentation Hom comparison from C0. Apply the degree-zero case of the named cohomology comparison.

Acceptance: On P¹ the canonical Hom comparison for O(1)→O(2) identifies the two-dimensional space of linear sections and preserves composition.

Proof references: [SERRE-GAGA](https://www.numdam.org/item/AIF_1956__6__1_0.pdf), §12, Theorem2 and Lemma6, printedpp.21–24.

<a id="C2-projective-essential-surjectivity"></a>

### Algebraization of projective coherent modules

Every coherent analytic module on X^an for a projective C-scheme X is isomorphic to F^an for an algebraic coherent module F. The assertion includes coherent modules on nonreduced X.

Target `C2/projective-essential-surjectivity` (theorem). Dependencies: [C2/projective-full-faithfulness](#C2-projective-full-faithfulness), [C1/twist-presentations](#C1-twist-presentations), [C0/coherent-analytic-ideal](#C0-coherent-analytic-ideal).

Prototype: `TauCeti.ComplexComparison.projectiveEssentialSurjectivity`.

Proof route: First take a two-term twist presentation of the analytic module pushed to projective space. Full faithfulness algebraizes its matrix, and exact pullback identifies its coherent cokernel. The algebraic ideal of X annihilates that cokernel because its analytic action is zero and C0 is faithful.

Acceptance: The coherent analytic quotient defined by a doubled point on P¹ algebraizes with its square ideal; algebraizing only its reduced support fails the test.

Proof references: [SERRE-GAGA](https://www.numdam.org/item/AIF_1956__6__1_0.pdf), §12, Theorem3 and proof, printedpp.24–25; SGA1 XII4.4.

<a id="C2-projective-gaga-equivalence"></a>

### Exact projective GAGA equivalence

For projective X/C, the native coherent analytification functor is an exact equivalence Coh(X)≌Coh(X^an), with the unit and counit arising from full faithfulness and coherent algebraization. It preserves the operations in C0 and uses the already defined canonical cohomology maps.

Target `C2/projective-gaga-equivalence` (construction). Dependencies: [C2/projective-full-faithfulness](#C2-projective-full-faithfulness), [C2/projective-essential-surjectivity](#C2-projective-essential-surjectivity), [C0/repair-exact-faithful-pullback](#C0-repair-exact-faithful-pullback).

Prototype: `TauCeti.ComplexComparison.projectiveGAGA`.

Proof route: Use full faithfulness and essential surjectivity to construct the quasi-inverse on the existing categories. Choose the unit and counit from the canonical pullback comparison and verify the triangle identities. Transport exactness and tensor/dual compatibilities without changing the underlying functor.

API:

- `ProjectiveGAGA.functor` (compatibility): The forward functor is coherent analytification.
- `ProjectiveGAGA.unit` (data): Algebraization followed by analytification has the canonical unit isomorphism.
- `ProjectiveGAGA.counit` (data): Analytification of the algebraized analytic module has the canonical counit isomorphism.

Discriminating tests:

- `ProjectiveGAGA.dualNumbers` (computation): The module C[ε]/ε² retains its nilpotent endomorphism, rather than becoming a reduced C-module.
- `ProjectiveGAGA.lineBundle` (compatibility): The equivalence takes algebraic O(1) to AnalyticTwist(1).
- `ProjectiveGAGA.kernel` (characterisation): A kernel of a coherent morphism is taken to the analytic kernel, testing exactness.

Uses: C3 projective modifications — The equivalence supplies coherent descent data on the projective pieces.; C4 algebraic ideals and morphisms — Algebraizes coherent ideal inclusions and their quotient objects..

Acceptance: The named API and the three discriminating tests below hold in the shared carrier, through the specified compatibility maps.

Proof references: [SERRE-GAGA](https://www.numdam.org/item/AIF_1956__6__1_0.pdf), Theorems1–3, printedpp.20–25.

<a id="C2-relative-projective-comparison"></a>

### Projective higher-direct-image comparison over a base

For projective f:X→S with S locally of finite type over C and coherent F, θ^q_{f,F} is an isomorphism for every q. This is a statement about analytifying algebraic higher images. It does not say that every analytic coherent module on X^an is algebraic when S is nonproper.

Target `C2/relative-projective-comparison` (theorem). Dependencies: [C2/projective-cohomology](#C2-projective-cohomology), [C3/repair-higher-image-comparison-map](#C3-repair-higher-image-comparison-map), `tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change`.

Prototype: `TauCeti.ComplexComparison.relativeProjectiveComparison`.

Proof route: Work over an affine algebraic base and its small Stein analytic neighbourhoods. Relative twist presentations and relative Serre vanishing compare the algebraic and analytic derived images term by term. Use coherent dévissage and compatibility with restriction to identify the adjunction map, and glue on the base.

Acceptance: For S=A¹ and X=P¹×S, the comparison holds for algebraic F; an analytic coefficient exp(s) does not thereby become algebraic.

Proof references: [SGA1-XII](https://arxiv.org/pdf/math/0206203v2), XII4.2, printedpp.248–249, PDF264–265.

<a id="C2-gaga-base-change"></a>

### Projection and base-change compatibility with their hypotheses

For projective f and coherent F, the higher-image comparison commutes with projection by a finite locally free module on S. It commutes with an algebraic flat base change and with derived Tor-independent base change for the complexes to which the SchemeAndStackFoundations SF.2 theorem applies. An individual R^q base-change isomorphism is asserted only under the supplier theorem’s cohomology-and-base-change hypotheses, not for arbitrary jumping cohomology.

Target `C2/gaga-base-change` (theorem). Dependencies: [C2/relative-projective-comparison](#C2-relative-projective-comparison), `SchemeAndStackFoundations:SF.2/tor-independent-base-change`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change`.

Prototype: `TauCeti.ComplexComparison.gagaFlatBaseChange`.

Proof route: Use the derived pullback/direct-image exchange diagrams before passing to degree q. Finite locally free tensor factors commute with both pullback and pushforward. Identify the same base-change square on both sides using the exact hypotheses of the imported algebraic theorem.

Acceptance: For P¹×S→S and O(−2), R¹f_*O(−2)=O_S; the named comparison commutes with a flat base change and tensoring by a line bundle on S. Jumping families retain the supplier theorem hypotheses.

Proof references: [SGA1-XII](https://arxiv.org/pdf/math/0206203v2), XII4.2 and its functoriality, printedpp.248–249.

<a id="C2-projective-geometric-dictionaries"></a>

### Projective ideals, sections and bundle dictionary

For projective X/C, coherent ideal sheaves and closed analytic subspaces of X^an algebraize uniquely, including their nilpotent structure. Coherent-module morphisms, global sections, invertible modules and finite locally free modules compare via the equivalence. The locally free locus is reflected by faithful flatness, and determinant and dual agree with C0.

Target `C2/projective-geometric-dictionaries` (theorem). Dependencies: [C2/projective-gaga-equivalence](#C2-projective-gaga-equivalence), [C0/coherent-analytic-ideal](#C0-coherent-analytic-ideal), [C0/holomorphic-bundle-dictionary](#C0-holomorphic-bundle-dictionary).

Prototype: `TauCeti.ComplexComparison.projectiveGeometricDictionary`.

Proof route: Algebraize the ideal as a coherent submodule and use fullness for its inclusion into O. Check multiplication and the ideal property by faithfulness, then take the algebraic quotient. Use local faithful-flat descent of finite projectivity for finite locally free modules.

Acceptance: The doubled hyperplane ideal and its quotient algebraize together. The analytic line bundle O(1) has the algebraic dual O(−1), and their tensor is O.

Proof references: [SGA1-XII](https://arxiv.org/pdf/math/0206203v2), XII4.4–4.5, printedpp.249–251, PDF265–267.

<a id="c3"></a>

## C3. Proper GAGA and algebraic spaces

For schemes use relative proper coherent dévissage after a Chow modification, retaining the canonical exchange maps and nonreduced base. For algebraic spaces use analytic étale descent to construct the category, then Hall’s global closed-point reconstruction route for absolute proper GAGA. The presentation charts may be nonproper; proper GAGA is never applied to those charts. The relative space comparison is a separate target with a recorded proof gap.

Atlas objects: Proper coherent GAGA; Closed-point GAGA reconstruction; Algebraic-space GAGA.

<a id="C3-repair-relative-proper-gaga"></a>

### Proper higher-direct-image comparison

For a proper morphism f:X→S of schemes locally of finite type over C and coherent F, every R^qf_*F is coherent and θ^q_{f,F}:(R^qf_*F)^an→R^qf^an_*F^an is a natural isomorphism. The target allows nonreduced X and S and nonprojective f. Properness is over S; this target is not an absolute categorical equivalence for nonproper S.

Target `C3/repair-relative-proper-gaga` (theorem). Dependencies: [C2/relative-projective-comparison](#C2-relative-projective-comparison), `AlgebraicModuliForArithmeticGeometry:R09.2`, `tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change`.

Prototype: `TauCeti.ComplexComparison.relativeProperComparison`.

Proof route: Use the R09.2 Chow modification that is projective over the base and an isomorphism on a dense open. Coherent dévissage separates modules supported on the lower-dimensional complement and the part compared through the modification. Noetherian induction, proper coherent direct-image finiteness and the Leray comparison reduce to the projective result.

Acceptance: The proof contains a genuine proper-to-projective reduction, not an assumption that every proper scheme is projective. The comparison is the previously constructed θ, in every degree.

Proof references: [SGA1-XII](https://arxiv.org/pdf/math/0206203v2), XII4.2, printedpp.248–249, PDF264–265.

<a id="C3-repair-proper-coherent-full-faithfulness"></a>

### Proper coherent full faithfulness over C

For a proper C-scheme X, the analytification functor is fully faithful on coherent modules, including nonreduced schemes. Hom comparison is C-linear and respects composition.

Target `C3/repair-proper-coherent-full-faithfulness` (lemma). Dependencies: [C3/repair-relative-proper-gaga](#C3-repair-relative-proper-gaga), [C0/coherent-pullback-operations](#C0-coherent-pullback-operations).

Prototype: `TauCeti.ComplexComparison.properFullFaithfulness`.

Proof route: Apply proper higher-image comparison to X→SpecC in degree zero. Identify Hom with global sections of the coherent internal Hom. Use finite-presentation flat Hom comparison, retaining the actual pullback map.

Acceptance: On a proper double point, multiplication by ε is a nonzero square-zero endomorphism and its image remains nonzero under analytification.

Proof references: [SGA1-XII](https://arxiv.org/pdf/math/0206203v2), XII4.4–4.5, printedpp.249–251, PDF265–267.

<a id="C3-repair-proper-coherent-essential-surjectivity"></a>

### Proper coherent algebraization

For X proper over C, every coherent analytic module on X^an algebraizes to an algebraic coherent module. This includes nonprojective and nonreduced X. The statement is not applied to noncompact charts of an algebraic space.

Target `C3/repair-proper-coherent-essential-surjectivity` (theorem). Dependencies: [C3/repair-proper-coherent-full-faithfulness](#C3-repair-proper-coherent-full-faithfulness), [C2/projective-essential-surjectivity](#C2-projective-essential-surjectivity), `AlgebraicModuliForArithmeticGeometry:R09.2`.

Prototype: `TauCeti.ComplexComparison.properEssentialSurjectivity`.

Proof route: Use a projective Chow modification and its proper fibre product to algebraize the pulled-back module and descent maps on the projective locus. Treat modules supported on the modification’s exceptional complement by Noetherian induction. Use coherent proper pushforward, the canonical adjunction map and the full-faithfulness result to reconstruct the module on X.

Acceptance: A coherent analytic quotient on a proper infinitesimal thickening algebraizes with its quotient map. Nonproper charts of a proper algebraic space remain outside this absolute theorem.

Proof references: [SGA1-XII](https://arxiv.org/pdf/math/0206203v2), XII4.4, printedpp.249–250, PDF265–266.

<a id="C3-proper-gaga-equivalence"></a>

### Exact proper GAGA equivalence

For X proper over C, the forward coherent analytification functor is an exact equivalence Coh(X)≌Coh(X^an), natural for algebraic maps between proper spaces and compatible with tensor, finite-presentation Hom, dual, determinant and canonical cohomology comparison.

Target `C3/proper-gaga-equivalence` (construction). Dependencies: [C3/repair-proper-coherent-essential-surjectivity](#C3-repair-proper-coherent-essential-surjectivity), [C3/repair-proper-coherent-full-faithfulness](#C3-repair-proper-coherent-full-faithfulness), [C0/repair-exact-faithful-pullback](#C0-repair-exact-faithful-pullback).

Prototype: `TauCeti.ComplexComparison.properGAGA`.

Proof route: Assemble the proved full-faithfulness and algebraization results on the native categories. Use canonical pullback natural isomorphisms for maps, rather than require a strictly functorial choice of quasi-inverse. Transfer the exact and monoidal structure with coherent unit and counit.

API:

- `ProperGAGA.functor` (compatibility): The equivalence’s functor is the C0 tensor pullback.
- `ProperGAGA.pullbackIso` (functoriality): For algebraic g between proper spaces, pullback and analytification commute by a natural isomorphism.
- `ProperGAGA.cohomologyIso` (compatibility): The cohomology isomorphism is θ for the structure map, in every degree.

Discriminating tests:

- `ProperGAGA.projectiveRestriction` (compatibility): On a projective scheme the equivalence agrees with ProjectiveGAGA through the common forward functor.
- `ProperGAGA.closedNonreduced` (computation): The double-point quotient and its nonzero nilpotent multiplication map both algebraize.
- `ProperGAGA.affineNonexample` (non-example): On A¹, multiplication by exp(z) is an analytic coherent morphism absent from the algebraic Hom set.

Uses: C4 graph algebraization — Transfers coherent ideals on proper ambient spaces.; C5 differential-operator complex comparison — Provides termwise proper coherent comparison; the operator step is separate..

Acceptance: The named API and the three discriminating tests below hold in the shared carrier, through the specified compatibility maps.

Proof references: [SGA1-XII](https://arxiv.org/pdf/math/0206203v2), XII4.2–4.5, printedpp.248–251.

<a id="C3-analytic-etale-descent"></a>

### Coherent analytic descent on étale presentations

An étale presentation U→X of a finite-type complex algebraic space analytifies to local analytic isomorphisms, and coherent modules on X^an are coherent modules on U^an with effective descent data over (U×_X U)^an. The pullback maps and cocycle coincide with algebraic étale coherent descent under analytification. This applies to nonproper U without asserting GAGA on U.

Target `C3/analytic-etale-descent` (theorem). Dependencies: [C0/repair-analytification](#C0-repair-analytification), `SchemeAndStackFoundations:SF.1`, `AlgebraicModuliForArithmeticGeometry:R09.3`.

Prototype: `TauCeti.ComplexComparison.analyticEtaleStalkIso`.

Proof route: Use the supplier étale analytification/local-isomorphism carrier. Apply native sheaf-module gluing to the cover groupoid and its coherent presentations. Compare restrictions and cocycles by C0; the global algebraization step is supplied by the reconstruction theorem.

Acceptance: For the degree-two étale map G_m→G_m, coherent descent uses the deck cocycle on the fibre product; both charts are nonproper, so the construction uses descent rather than absolute GAGA on them.

Proof references: [HALL](https://bpb-ap-se2.wpmucdn.com/blogs.unimelb.edu.au/dist/5/501/files/2021/05/get.pdf), §9, Theorem9.1 and applications, pp.20–21; analytic local presentation discussion.

<a id="C3-closed-point-reconstruction"></a>

### Derived GAGA by closed-point reconstruction

Let c:T→X be a flat morphism of ringed sites of a proper finite-type C-algebraic space. Assume coherent structure sheaves, the residue-field/closed-point comparison and Tor-independent support squares, bounded finite-dimensional cohomology for coherent complexes on T, and the derived quasi-coherent adjoint and perfect support-approximation interfaces of Hall’s Theorem9.1. Then Lc* gives an equivalence of bounded coherent derived categories, inducing the coherent equivalence and cohomology comparison. The missing algebraic-space derived interfaces are explicit SF.2 requests.

Target `C3/closed-point-reconstruction` (theorem). Dependencies: [C3/analytic-etale-descent](#C3-analytic-etale-descent), [C1/compact-coherent-finiteness](#C1-compact-coherent-finiteness), `SchemeAndStackFoundations:SF.2/derived-pullback-pushforward-qcoh`, `SchemeAndStackFoundations:SF.2/perfect-generator`.

Prototype: `TauCeti.ComplexComparison.closedPointReconstruction`.

Proof route: Construct the quasi-coherent right adjoint and show it preserves bounded coherent complexes by perfect testing. Closed-point residue equivalences and Tor-independent base change identify unit/counit after tensoring with perfect support detectors. Top-cohomology Nakayama detects the cones; the adjunction is an equivalence, whose t-exact flat pullback restricts to the coherent hearts.

Acceptance: For a proper scheme viewed as an algebraic space, reconstruction recovers the scheme GAGA functor; residue testing on a doubled closed point detects its nilpotent module.

Proof references: [HALL](https://bpb-ap-se2.wpmucdn.com/blogs.unimelb.edu.au/dist/5/501/files/2021/05/get.pdf), Theorems3.8,5.5,7.4,8.1,9.1 and proof, pp.8–14,18–21.

<a id="C3-proper-algebraic-space-gaga"></a>

### Proper GAGA for algebraic spaces

For a proper finite-type algebraic space X/C, including nonreduced X, coherent analytification is an exact equivalence and gives all-degree coherent cohomology comparison. For a proper map of finite-type algebraic spaces, the canonical higher-direct-image comparison is an isomorphism. The construction uses analytic étale presentation and global reconstruction; it never applies proper GAGA to a nonproper chart.

Target `C3/proper-algebraic-space-gaga` (theorem). Dependencies: [C3/closed-point-reconstruction](#C3-closed-point-reconstruction), [C3/repair-relative-proper-gaga](#C3-repair-relative-proper-gaga), [C3/analytic-etale-descent](#C3-analytic-etale-descent).

Prototype: `TauCeti.ComplexComparison.properAlgebraicSpaceGAGA_schemePart`.

Proof route: Verify the local faithful-flat and residue-field hypotheses on finite-type étale scheme charts. Compact coherent finiteness and the requested algebraic-space derived support interfaces meet the reconstruction theorem’s global hypotheses. For the relative assertion apply the same proper derived comparison over Stein neighbourhoods of the base, retaining θ and coherent descent.

Acceptance: An étale chart U of proper X need not be proper; no absolute GAGA invocation on U appears. The algebraic-space extension of SF.2 is a prerequisite gap until supplied, not inferred from the scheme-only node.

Proof references: [HALL](https://bpb-ap-se2.wpmucdn.com/blogs.unimelb.edu.au/dist/5/501/files/2021/05/get.pdf), Theorem9.1 and analytic applications, pp.20–21.

<a id="c4"></a>

## C4. Analytic images, Chow and graph algebraization

Prove Remmert and Remmert–Stein by their dimension and finite-projection arguments. Reduced projective Chow is supplemented by coherent-ideal algebraization to retain nilpotents. A separated target is handled through compactification and proper support, rather than silently imposing target properness. Serre’s reduced algebraic-graph criterion has its separate nonproper source scope. Complete affine curves using the already owned projective model and compare connectedness by idempotents and finite punctures.

Atlas objects: Remmert proper mapping theorem; Projective Chow theorem; Proper morphism comparison; Affine curve connectedness.

<a id="C4-remmert-proper-image"></a>

### Remmert proper mapping theorem

For a proper holomorphic map f:T→S of finite-dimensional complex analytic spaces, the image of a closed analytic subset A⊆T is a closed analytic subset of S, with its reduced analytic structure. Properness may be required only on A. Nilpotent structure is handled by coherent ideals separately; this theorem concerns the underlying analytic subset.

Target `C4/remmert-proper-image` (theorem). Dependencies: [C0/oka-coherence](#C0-oka-coherence), [C0/weierstrass-preparation](#C0-weierstrass-preparation).

Prototype: `TauCeti.ComplexComparison.remmertProperImage`.

Proof route: Work near a compact fibre with finitely many adapted coordinate neighbourhoods. Induct simultaneously on dimension with the extension theorem: outside the lower-dimensional critical image, finite projections and symmetric holomorphic coefficients describe the image. Extend across the critical image with the dimension inequality from the simultaneous induction; topological properness proves closedness.

Acceptance: Projection of a compact projective analytic subset along a projective factor has analytic image. Without properness, a holomorphic image need not be closed or analytic.

Proof references: [DEMAILLY](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf), II8.8 and simultaneous proof with II8.7, pp.118–120.

<a id="C4-remmert-stein-extension"></a>

### Remmert–Stein analytic closure theorem

Let E be an analytic subset of a complex manifold and A an analytic subset of its complement whose every irreducible component has dimension strictly greater than dimE. Then the closure of A is analytic. The strict dimension inequality is essential.

Target `C4/remmert-stein-extension` (theorem). Dependencies: [C4/remmert-proper-image](#C4-remmert-proper-image), [C0/weierstrass-preparation](#C0-weierstrass-preparation).

Prototype: `TauCeti.ComplexComparison.remmertSteinExtension`.

Proof route: Use the extension half of the same simultaneous dimension induction as the proper mapping proof. Choose finite linear projections whose exceptional sets have smaller dimension. Extend the symmetric coefficients and reconstruct the closed analytic set; equal-dimensional closure is not asserted.

Acceptance: The closure of the punctured line C*⊆C is analytic across E={0}, since 1>0. A sequence of points accumulating at 0 violates the strict dimension inequality and need not have analytic closure.

Proof references: [DEMAILLY](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf), II8.7 and simultaneous proof, pp.118–120.

<a id="C4-nonreduced-projective-chow"></a>

### Coherent-ideal and nonreduced projective Chow

Every closed analytic subspace Z⊆P^r_an defined by a coherent ideal I, including a nonradical I, is the analytification of a unique closed algebraic subscheme of P^r. On reduced subsets this is ordinary projective Chow. The stronger claim uses coherent-ideal algebraization rather than just algebraizing the support.

Target `C4/nonreduced-projective-chow` (theorem). Dependencies: [C1/analytic-serre-generation](#C1-analytic-serre-generation), [C2/projective-geometric-dictionaries](#C2-projective-geometric-dictionaries), [C4/remmert-stein-extension](#C4-remmert-stein-extension).

Prototype: `TauCeti.ComplexComparison.nonreducedProjectiveChow`.

Proof route: High twists generate the coherent ideal by homogeneous holomorphic sections. Twist H^0 comparison identifies these generators with homogeneous polynomials. Algebraize the inclusion and multiplication maps and compare their quotient sheaves, retaining all nilpotent orders.

Acceptance: The double hyperplane defined by a square of a homogeneous linear form retains the square ideal. The theorem makes no claim about an arbitrary closed analytic subset of A^n; definable Chow is owned by LD.6.

Proof references: [CARTAN19](https://www.numdam.org/item/SHC_1953-1954__6__A19_0.pdf), §10, Proposition9, pp.19-5–19-7; Demailly II8.10 p.121.

<a id="C4-proper-support-algebraization"></a>

### Coherent algebraization with proper support

For a separated finite-type C-scheme Y and a coherent analytic module on Y^an whose support is proper over C, algebraize the module and its morphisms uniquely. For proper-support coherent ideal data in a compactification, retain the quotient structure. This extension needs the already owned Nagata compactification theorem and proper GAGA; it does not algebraize analytic modules with nonproper support.

Target `C4/proper-support-algebraization` (theorem). Dependencies: [C3/proper-gaga-equivalence](#C3-proper-gaga-equivalence), `SchemeAndStackFoundations:SF.2`.

Prototype: `TauCeti.ComplexComparison.properSupportAlgebraization`.

Proof route: Request the Noetherian separated finite-type compactification leaf in SF.2; the present supplier packet does not yet prove it. Do not re-plan Nagata in this comparison roadmap. Proper support is closed in the compactification, so extending the supported coherent module by zero is coherent on an analytic neighbourhood of that support. Apply proper GAGA to the compactification and restrict back; support detection and full faithfulness make the result independent of compactification.

Acceptance: A finite-length analytic module supported at 0 in A¹ algebraizes with its nilpotents; full analytic O_A¹ has nonproper support and does not satisfy this contract.

Proof references: [SGA1-XII](https://arxiv.org/pdf/math/0206203v2), XII4.4–4.5, printedpp.249–251, together with compactification reduction.

<a id="C4-repair-proper-morphism-algebraicity"></a>

### Algebraic morphisms from proper sources

For X proper over C and Y separated of finite type over C, the canonical map Hom_C(X,Y)→Hom_hol(X^an,Y^an) is bijective. Include nonreduced X and Y; Y need not be proper. The algebraic-space version uses the C3 algebraic-space carrier and equivalence.

Target `C4/repair-proper-morphism-algebraicity` (theorem). Dependencies: [C4/proper-support-algebraization](#C4-proper-support-algebraization), [C0/coherent-analytic-ideal](#C0-coherent-analytic-ideal), [C3/proper-gaga-equivalence](#C3-proper-gaga-equivalence), `SchemeAndStackFoundations:SF.1`.

Prototype: `TauCeti.ComplexComparison.properMorphismAlgebraicity`.

Proof route: The analytic graph is a closed analytic subspace of X^an×Y^an, proper over C. Algebraize its coherent ideal in a proper compactification, including quotient structure and both projections. The algebraic first projection is an isomorphism: properness and analytic fibres give quasi-finiteness, hence finiteness; its finite module map is an isomorphism by faithful-flat analytic detection. Compose its inverse with the second projection.

Acceptance: Maps from Spec(C[ε]/ε²) retain their infinitesimal information. For X=P¹ and Y=A¹ every holomorphic map is constant; the target is covered although Y is nonproper.

Proof references: [SGA1-XII](https://arxiv.org/pdf/math/0206203v2), XII4.5 and application of XII4.4, printedpp.250–251; Serre§19 for reduced projective case.

<a id="C4-algebraic-graph-regular"></a>

### Algebraic graphs of holomorphic maps

For reduced finite-type complex varieties X,Y, a holomorphic map X^an→Y^an whose graph is a locally closed algebraic subvariety of X×Y is regular. No properness or smoothness assumption on X is needed. For nonreduced sources the graph must be algebraic as a subspace, not merely as a reduced set.

Target `C4/algebraic-graph-regular` (theorem). Dependencies: [C0/repair-local-faithful-flatness](#C0-repair-local-faithful-flatness), `AlgebraicModuliForArithmeticGeometry:R09.2`, `SchemeAndStackFoundations:SF.1`.

Prototype: `TauCeti.ComplexComparison.algebraicGraphRegular`.

Proof route: The graph’s first algebraic projection is bijective and analytically an isomorphism. Serre’s closure argument gives a Zariski homeomorphism; componentwise birationality identifies total fraction rings. Use the faithful-flat local-ring intersection argument to identify the algebraic stalks; the second projection then gives the regular map.

Acceptance: BKT20 Theorem4.12 first uses definable Chow LD.6 to make a nonproper graph algebraic, then this criterion. Projective Chow does not supply that first step.

Proof references: [SERRE-GAGA](https://www.numdam.org/item/AIF_1956__6__1_0.pdf), §8, Propositions8–9 and proof, printedpp.13–15.

<a id="C4-family-morphism-interface"></a>

### Relative morphism comparison and arithmetic interfaces

Apply proper-source morphism comparison to proper complex fibres and to a total family proper over C. For a projective family over a nonproper algebraic base, use its algebraic Hom/Isom functor from R09 and compare its complex fibres; an arbitrary holomorphic base section need not be algebraic. PEL and Baily–Borel consumers use the shared analytification and their own compactifications, and an isogeny comparison includes the algebraic group law and finite kernel.

Target `C4/family-morphism-interface` (application). Dependencies: [C4/repair-proper-morphism-algebraicity](#C4-repair-proper-morphism-algebraicity), [C4/algebraic-graph-regular](#C4-algebraic-graph-regular), `AlgebraicModuliForArithmeticGeometry:R09.3`, [C2/gaga-base-change](#C2-gaga-base-change).

Prototype: `TauCeti.ComplexComparison.properMorphismAlgebraicity`.

Proof route: Use functoriality of graph algebraization to preserve algebraic composition and fibre identities. Apply the imported representability of Hom/Isom where available and compare the fibre over an algebraic complex point. Check group-law diagrams by faithfulness for isogenies; impose the consumer’s properness and algebraic variation hypotheses.

Acceptance: For a constant family of abelian varieties, algebraic isogeny graphs compare on each proper complex fibre. A holomorphic coefficient exp(s) over S=A¹ is not thereby an algebraic section of a relative Hom space.

Proof references: [SGA1-XII](https://arxiv.org/pdf/math/0206203v2), XII4.5, printedpp.250–251; [BKT20](https://par.nsf.gov/purl/10200187), Theorem4.12, printedp.933 (PDFp.17), and its algebraic-graph application.

<a id="C4-repair-affine-curve-completion-interface"></a>

### The affine curve–compact Riemann surface interface

For a smooth affine complex curve U, import its unique smooth projective model C, the open immersion U→C, and the function-field/holomorphy-ring dictionary from AlgebraicCurves Layers12B–12C and6. The boundary D=C minus U is finite, and U^an=C^an minus D under the shared analytification. The construction of the projective model, normalization and rational-map extension belongs to those suppliers.

Target `C4/repair-affine-curve-completion-interface` (theorem). Dependencies: `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts`, `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-6-extensions-of-function-fields`, [C0/repair-analytification](#C0-repair-analytification).

Prototype: `TauCeti.ComplexComparison.affineCurveCompletionInterface`.

Proof route: Use the existing function-field model and its open-immersion universal property. A closed proper subset of a Noetherian curve has dimension zero and finitely many complex points. Compare restriction of the structure sheaf and the complement topology; do not equate all holomorphic functions on U^an with its coordinate ring.

Acceptance: For A¹⊆P¹ the boundary is {∞}; exp(z) is holomorphic on U^an and is absent from C[z].

Proof references: [CURVE-CONTRACT](https://github.com/TauCetiProject/TauCetiRoadmap/blob/f9e4a9026b04c282878900edaada0a3f3eb3c82a/TauCetiRoadmap/AlgebraicCurves/README.md), Layers12B–12C and6; comparison of the supplied open immersion.

<a id="C4-punctured-riemann-connected"></a>

### Connectedness after deleting a finite boundary

If M is a connected Riemann surface and D is a finite subset, M\D is connected and path connected. The argument uses its real dimension two; it would be false for a connected real one-dimensional interval with an interior point removed.

Target `C4/punctured-riemann-connected` (theorem). Dependencies: [C4/repair-affine-curve-completion-interface](#C4-repair-affine-curve-completion-interface).

Prototype: `TauCeti.ComplexComparison.puncturedRiemannConnected`.

Proof route: Connected manifolds are path connected by their locally path-connected charts. Replace each piece of a path meeting D by an arc inside a punctured coordinate disc, using a finite covering subdivision. The replacement avoids all boundary points and keeps both endpoints.

Acceptance: P¹ minus {0,∞} is path connected. An interval minus an interior point is disconnected, exposing the required real dimension two.

Proof references: [CURVE-CONTRACT](https://github.com/TauCetiProject/TauCetiRoadmap/blob/f9e4a9026b04c282878900edaada0a3f3eb3c82a/TauCetiRoadmap/AlgebraicCurves/README.md), Layer12C analytic dictionary; local complex-disc topology.

<a id="C4-affine-curve-connectedness"></a>

### Algebraic versus analytic connectedness of smooth curves

For a smooth affine complex curve U, U is algebraically connected if and only if U^an is connected. Complete U with its supplied projective model, compare projective idempotents through proper GAGA, and remove the finite boundary using the preceding topological theorem. The proof does not invoke nonproper full faithfulness.

Target `C4/affine-curve-connectedness` (theorem). Dependencies: [C4/punctured-riemann-connected](#C4-punctured-riemann-connected), [C3/proper-gaga-equivalence](#C3-proper-gaga-equivalence).

Prototype: `TauCeti.ComplexComparison.affineCurveConnectedness`.

Proof route: Connectedness of the smooth projective model agrees with connectedness of its dense affine open, component by component. Proper GAGA identifies idempotents in H^0(O_C) with those on C^an. The finite-boundary theorem preserves analytic connectedness.

Acceptance: A¹ and G_m analytify to connected C and C*. A disjoint union of two affine lines remains disconnected; no nonproper Hom fullness is used.

Proof references: [CURVE-CONTRACT](https://github.com/TauCetiProject/TauCetiRoadmap/blob/f9e4a9026b04c282878900edaada0a3f3eb3c82a/TauCetiRoadmap/AlgebraicCurves/README.md), Layer12B–12C, with proper GAGA on the projective model.

<a id="c5"></a>

## C5. de Rham, geometric Hodge and logarithmic comparison

The first group constructs ordinary and relative C-linear complexes, the operator comparison and arbitrary-coefficient topological resolution. The second group adds geometric Hodge operators, positive current integration and Chern/intersection normalization. The third group supplies ordinary connections, corrected regular-singular comparison, curve compact-support/residue interfaces and the elementary log prefix, ending in proper log GAGA and its monodromy triangle. These groups have different analytic and algebraic supplier requirements; each is stated below.

Atlas objects: Algebraic de Rham complex; Differential-operator hypercohomology comparison; Sheaf–singular comparison; de Rham–Betti comparison; Relative Hodge bundle theorem; Regular-singular Riemann–Hilbert equivalence.

<a id="C5-algebraic-de-rham-complex"></a>

### Algebraic de Rham complex

For a smooth C-scheme X, Ω^p_{X/C}=∧^pΩ^1_{X/C} uses the native Kähler differentials and exterior powers, glued by localization. The differential d is C-linear and satisfies d²=0 and the graded Leibniz law; it is not O_X-linear. Forget the O_X-module structures to form a native cochain complex of sheaves of C-modules, and take its native hypercohomology.

Target `C5/algebraic-de-rham-complex` (construction). Dependencies: `mathlib:KaehlerDifferential.D`, `mathlib:exteriorPower.ιMulti`, `SchemeAndStackFoundations:SF.2`.

Prototype: `TauCeti.ComplexComparison.algebraicDeRhamComplex`.

Proof route: Use the universal derivation and exterior powers on affines. Define d(a_0 da_1∧…∧da_p)=da_0∧…∧da_p and verify the defining relations. Localization compatibility glues the terms and C-linear differential; smoothness gives finite locally free terms in a bounded degree range.

API:

- `AlgebraicDeRham.d_on_generator` (characterisation): The differential has the displayed value on a generator.
- `AlgebraicDeRham.d_squared` (simp): Every consecutive pair of differentials composes to zero.
- `AlgebraicDeRham.pullback` (functoriality): A C-morphism induces pullback of forms commuting with d.

Discriminating tests:

- `AlgebraicDeRham.point` (degenerate): On SpecC only degree0 is C.
- `AlgebraicDeRham.polynomial` (computation): d(z^n)=n z^(n−1) dz on A¹.
- `AlgebraicDeRham.torus` (non-example): dz/z is closed and not exact in the algebraic de Rham complex of G_m.

Uses: C5 proper and relative comparison — Provides the algebraic complex and its filtration by form degree.; SchemeAndStackFoundations SF.6 and MotivesAndAlgebraicCycles MC.2 — Exports the named algebraic realization and comparison source, including products and pullbacks..

Acceptance: The named API and the three discriminating tests below hold in the shared carrier, through the specified compatibility maps.

Proof references: [GROTH1966](https://www.numdam.org/article/PMIHES_1966__29__95_0.pdf), Theorems1–2 and notation, printedpp.95–97; Deligne70 II6.2.

<a id="C5-holomorphic-de-rham-complex"></a>

### Holomorphic de Rham complex

On a complex manifold T, Ω^p_T is the coherent sheaf of holomorphic p-forms on the shared analytic manifold carrier. Holomorphic exterior derivative forms a bounded cochain complex of sheaves of C-modules. Its degree-zero term is O_T and its differential is C-linear, not O_T-linear.

Target `C5/holomorphic-de-rham-complex` (construction). Dependencies: [C0/holomorphic-bundle-dictionary](#C0-holomorphic-bundle-dictionary), `SchemeAndStackFoundations:SF.2`.

Prototype: `TauCeti.ComplexComparison.holomorphicDeRhamComplex`.

Proof route: Use holomorphic cotangent frames and the native exterior-bundle operations. Define d in coordinates and compare on overlaps by the chain rule. Forget to sheaves of C-modules before forming the cochain complex.

API:

- `HolomorphicDeRham.degreeZero` (compatibility): Ω^0_T is the analytic structure sheaf.
- `HolomorphicDeRham.d_squared` (simp): The exterior derivative has square zero.
- `HolomorphicDeRham.pullback` (functoriality): Holomorphic pullback commutes with the complex differential.

Discriminating tests:

- `HolomorphicDeRham.point` (degenerate): The complex on a point is C in degree0.
- `HolomorphicDeRham.coordinate` (computation): d(z_i)=dz_i in a holomorphic coordinate chart.
- `HolomorphicDeRham.torusPeriod` (computation): The integral of dz/z on the positively oriented unit circle is2πi.

Uses: C5 holomorphic Poincaré resolution — Resolves the constant C-sheaf on the complex manifold.; C5 algebraic analytification — Receives the algebraic de Rham terms and their analytified differential operators..

Acceptance: The named API and the three discriminating tests below hold in the shared carrier, through the specified compatibility maps.

Proof references: [DELIGNE70](https://publications.ias.edu/sites/default/files/Number9.pdf), I2.17–2.23, printedpp.11–17.

<a id="C5-holomorphic-poincare"></a>

### Holomorphic Poincaré lemma

The inclusion of the constant C-sheaf into Ω^•_T is a quasi-isomorphism on a complex manifold T. On a coordinate ball, every closed holomorphic p-form for p>0 is exact on a smaller star-shaped ball, and ker(d:O→Ω¹) consists of locally constant functions.

Target `C5/holomorphic-poincare` (theorem). Dependencies: [C5/holomorphic-de-rham-complex](#C5-holomorphic-de-rham-complex).

Prototype: `TauCeti.ComplexComparison.holomorphicPoincare`.

Proof route: Contract the coordinate ball radially and integrate contraction of p-forms along the contraction. Differentiate under the parameter integral to obtain dK+Kd=id−evaluation, with the degree-zero evaluation term. The local homotopy proves exactness on stalks and glues the canonical inclusion into a quasi-isomorphism.

Acceptance: On a coordinate ball the closed one-form dz has primitive z. Degree zero consists of constants on a connected ball; on C* the global dz/z need not be exact.

Proof references: [DELIGNE70](https://publications.ias.edu/sites/default/files/Number9.pdf), I2.17–2.23 and proof, printedpp.11–17.

<a id="C5-differential-operator-analytification"></a>

### Analytification of finite-order differential operators

For finite-presentation coherent modules F,G, an algebraic C-linear differential operator D:F→G of order≤m factors through the native principal-parts quotient P^m(F) of the diagonal ideal to order m+1. Analytify that factorization and the diagonal quotient to obtain a C-linear analytic differential operator D^an, independent of the chosen bound. Composition, restrictions and commutators are preserved. This extends C0 without treating D as an O-linear morphism.

Target `C5/differential-operator-analytification` (construction). Dependencies: [C0/repair-coherent-pullback](#C0-repair-coherent-pullback), [C0/coherent-analytic-ideal](#C0-coherent-analytic-ideal), `SchemeAndStackFoundations:SF.2`.

Prototype: `TauCeti.ComplexComparison.differentialOperatorAnalytification`.

Proof route: Form principal parts from the finite diagonal neighbourhood using tensor products and the diagonal-ideal quotient. Analytify its universal jet map and the O-linear map from principal parts to G. Check changes of order, composition and the iterative commutator characterization of differential operators.

API:

- `DifferentialOperatorAnalytification.orderZero` (compatibility): Order-zero operators give the C0 O-linear morphism map.
- `DifferentialOperatorAnalytification.composition` (functoriality): Analytification respects composition and the sum of order bounds.
- `DifferentialOperatorAnalytification.deRham` (compatibility): The analytified first-order exterior differential is holomorphic exterior derivative.

Discriminating tests:

- `DifferentialOperatorAnalytification.scalar` (compatibility): Multiplication by an algebraic function analytifies to multiplication by its holomorphic function.
- `DifferentialOperatorAnalytification.derivative` (computation): d/dz on C[z] analytifies to the usual holomorphic derivative.
- `DifferentialOperatorAnalytification.nonLinearOverO` (non-example): D(z·1)−zD(1)=1 for D=d/dz, so the operator cannot be represented as an O-linear map.

Uses: C5 bounded coherent complex comparison — Analytifies the differentials and their square-zero identities.; Qian companion Proposition3.6 — Analytifies logarithmic de Rham complexes and the maps defining the monodromy triangle..

Acceptance: The named API and the three discriminating tests below hold in the shared carrier, through the specified compatibility maps.

Proof references: [DELIGNE70](https://publications.ias.edu/sites/default/files/Number9.pdf), II6.2–6.4, printedpp.98–100, PDF101–103.

<a id="C5-bounded-operator-hypergaga"></a>

### Proper hypercohomology comparison for differential-operator complexes

For X proper over C and a bounded complex K whose terms are coherent O_X-modules and whose differentials are finite-order C-linear differential operators, the canonical comparison RΓ(X,K)→RΓ(X^an,K^an) is a quasi-isomorphism of C-complexes. The same holds for a proper map f and bounded complexes of f^{-1}O_S-linear differential operators relative to S. Compatible short exact sequences of such complexes give compatible distinguished triangles and connecting morphisms.

Target `C5/bounded-operator-hypergaga` (theorem). Dependencies: [C5/differential-operator-analytification](#C5-differential-operator-analytification), [C3/repair-relative-proper-gaga](#C3-repair-relative-proper-gaga), `SchemeAndStackFoundations:SF.2`.

Prototype: `TauCeti.ComplexComparison.operatorHyperGAGA`.

Proof route: Use the finite filtration by complex degree and the canonical comparison of each coherent term. The bounded hypercohomology spectral sequence identifies the E1 pages; operator analytification makes all differentials commute. Bounded convergence gives the quasi-isomorphism, and the resolution-level construction respects compatible triangles.

Acceptance: The proof does not apply coherent O-linear GAGA directly to a C-linear differential. The connecting map of the logpoint exact sequence compares under the actual triangle, not an unnamed vector-space isomorphism.

Proof references: [DELIGNE70](https://publications.ias.edu/sites/default/files/Number9.pdf), II6.6 and proof, printedp.101, PDF104; Qian companion Proposition3.6.

<a id="C5-small-singular-cochain-sheaf"></a>

### Small singular cochains with nestings

For a space T and an abelian group A, use Sella’s directed nestings of neighbourhoods indexed by finite lists of points to restrict singular simplices to those small in every face. Take the directed quotient/colimit of the resulting A-valued cochains. This gives a flasque cochain sheaf with the constant A-sheaf as its degree-zero augmentation on semilocally contractible T. It uses native additive sheaves and the imported singular chain complex.

Target `C5/small-singular-cochain-sheaf` (construction). Dependencies: `mathlib:CategoryTheory.Sheaf.H`, `tauceti:TauCeti.Topology.subsingleton_H_succ_of_isFlasque`, `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

Prototype: `TauCeti.ComplexComparison.smallSingularCochains`.

Proof route: Use the nesting monotonicity under deleting entries, and impose smallness on all faces. The directed refinement and subdivision/prism homotopies give a cochain sheaf with surjective restriction maps. Local contractibility gives the augmentation exactness; Sella’s face-corrected homotopy compares small and all singular cochains.

API:

- `SmallSingularCochains.augmentation` (data): Locally constant A-valued functions map to degree-zero cocycles.
- `SmallSingularCochains.restriction_surjective` (characterisation): All cochain sheaf restriction maps are surjective.
- `SmallSingularCochains.small_inclusion_equivalence` (compatibility): Small-chain inclusion is a chain homotopy equivalence after the nesting refinement.

Discriminating tests:

- `SmallSingularCochains.point` (computation): The augmentation computes A in degree0 and zero positive cohomology on a point.
- `SmallSingularCochains.empty` (degenerate): Every positive or degree-zero cohomology group of the empty space is zero.
- `SmallSingularCochains.nonHausdorff` (non-example): Sella’s five-point example defeats naïve sheafification of all cochains; the nesting construction still gives flasque restriction maps.

Uses: C5 sheaf–singular comparison for every A — Provides a flasque resolution with a chain-level comparison, independent of finite coefficients.; Integral period and torsion bookkeeping — Applies unchanged to Z,Q,C and torsion groups..

Acceptance: The named API and the three discriminating tests below hold in the shared carrier, through the specified compatibility maps.

Proof references: [SELLA](https://arxiv.org/pdf/1602.06674v3), Lemma0.1, Example0.3 and Steps1–3, pp.1–19.

<a id="C5-repair-sheaf-singular-comparison"></a>

### Sheaf–singular comparison for arbitrary abelian coefficients

For a semilocally contractible space T and any abelian group A, the canonical map from cohomology of the constant A-sheaf to singular cohomology with coefficients A is an isomorphism in every degree, natural in T and A. Semilocal contractibility means every neighbourhood contains a smaller neighbourhood whose inclusion is null homotopic. No Hausdorff or finite-coefficient assumption is used.

Target `C5/repair-sheaf-singular-comparison` (theorem). Dependencies: [C5/small-singular-cochain-sheaf](#C5-small-singular-cochain-sheaf), `tauceti:TauCeti.Topology.subsingleton_H_succ_of_isFlasque`.

Prototype: `TauCeti.ComplexComparison.sheafSingularComparison`.

Proof route: Use the exact flasque small-cochain resolution of the constant sheaf. Apply the native positive-degree flasque acyclicity instance and derived cohomology of the resolution. Use the explicit small-chain homotopy equivalence to identify its global cohomology with singular cohomology.

Acceptance: The comparison is stated separately for Z,Q,C and finite torsion coefficients. Sella supplies an additive comparison; a product-compatible comparison requires the separate multiplicative-chain interface.

Proof references: [SELLA](https://arxiv.org/pdf/1602.06674v3), Theorem and Lemma0.1, pp.1–3; subdivision construction and proof, pp.6–19.

<a id="C5-repair-proper-de-rham-betti"></a>

### Proper smooth algebraic de Rham–Betti comparison

For a smooth proper C-scheme X and q≥0, there is a canonical natural C-linear isomorphism H^q_dR(X/C)≅H^q_sing(X^an,C). It is the composite of operator hyper-GAGA, the holomorphic Poincaré quasi-isomorphism and the sheaf–singular comparison. Projectivity is not required; smoothness is required for this ordinary de Rham complex.

Target `C5/repair-proper-de-rham-betti` (theorem). Dependencies: [C5/algebraic-de-rham-complex](#C5-algebraic-de-rham-complex), [C5/holomorphic-de-rham-complex](#C5-holomorphic-de-rham-complex), [C5/bounded-operator-hypergaga](#C5-bounded-operator-hypergaga), [C5/holomorphic-poincare](#C5-holomorphic-poincare), [C5/repair-sheaf-singular-comparison](#C5-repair-sheaf-singular-comparison).

Prototype: `TauCeti.ComplexComparison.properDeRhamBetti`.

Proof route: Identify analytified Kähler forms with holomorphic cotangent exterior powers by local coordinates. Compare the proper bounded differential-operator complexes. Resolve the constant sheaf holomorphically and then compare to singular cohomology.

Acceptance: The proper nonprojective case uses C3, not C2 alone. A singular proper scheme is not assigned ordinary de Rham comparison without a different cohomology theory.

Proof references: [GROTH1966](https://www.numdam.org/article/PMIHES_1966__29__95_0.pdf), Theorem1 and proper comparison argument, printedpp.95–96.

<a id="C5-multiplicative-period-interface"></a>

### Products, integral coefficients and periods

The de Rham–Betti comparison is compatible with pullback and, through DifferentialGeometry’s integration/cup homotopy and AlgebraicTopology Stage6, with wedge/cup products and manifold trace. Keep H^q_sing(X^an,Z), its torsion subgroup and its image in C-cohomology distinct. On a compact smooth manifold the free quotient is a finite-rank lattice after the imported finite-CW/triangulation theorem; extension to Q and C is the named coefficient-change map.

Target `C5/multiplicative-period-interface` (application). Dependencies: [C5/repair-proper-de-rham-betti](#C5-repair-proper-de-rham-betti), `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

Prototype: `TauCeti.ComplexComparison.multiplicativePeriodInterface`.

Proof route: Use the existing smooth integration chain map and its wedge/cup homotopy; do not manufacture another smooth de Rham theorem. Apply coefficient-change and universal coefficients with their finite-generation hypotheses. Retain torsion information at the Z-level and fix the positively oriented G_m loop period of dz/z to2πi.

Acceptance: The integral lattice is the image of H_Z modulo torsion, not an arbitrary basis of H_C. The trace normalization agrees with complex orientation and the first Chern class factor i/(2π).

Proof references: [GROTH1966](https://www.numdam.org/article/PMIHES_1966__29__95_0.pdf), Theorems1–2, printedpp.95–97; DGH21 Proposition4.2 for normalization.

<a id="C5-relative-poincare"></a>

### Relative analytic Poincaré resolution

For a smooth holomorphic map f:T→S, the relative holomorphic complex Ω^•_{T/S} resolves f^{-1}O_S. With coefficients in a locally free integrable relative connection it resolves its relative horizontal sheaf. The unqualified constant C-sheaf is not the degree-zero kernel for a varying base.

Target `C5/relative-poincare` (theorem). Dependencies: [C5/holomorphic-de-rham-complex](#C5-holomorphic-de-rham-complex).

Prototype: `TauCeti.ComplexComparison.relativePoincare`.

Proof route: Choose a local product chart and apply the radial homotopy only to the fibre coordinates. Holomorphic dependence on base parameters is preserved by integration. The degree-zero kernel is the pullback of base holomorphic functions; local horizontal frames give the coefficient version.

Acceptance: For the projection C_z×C_t→C_t, a degree-zero function of t survives and dz has a relative primitive z. The kernel is f⁻¹O_S, not the constant C-sheaf.

Proof references: [DELIGNE70](https://publications.ias.edu/sites/default/files/Number9.pdf), I2.22–2.23 and proof, printedpp.15–17, PDF18–20.

<a id="C5-relative-betti-local-system"></a>

### Betti local systems in a proper smooth family

For a proper smooth holomorphic map of complex manifolds f:T→S, R^qf_*A is locally constant for every abelian group A, identified with the cohomology of a compact fibre. For A=C it has finite rank. A proper submersion admits C∞ local trivializations by Ehresmann’s theorem, requested as a DifferentialGeometry PartII extension because the current roadmap does not supply it.

Target `C5/relative-betti-local-system` (theorem). Dependencies: [C5/repair-sheaf-singular-comparison](#C5-repair-sheaf-singular-comparison).

Prototype: `TauCeti.ComplexComparison.relativeBettiLocalSystem`.

Proof route: Import the proper-submersion local trivialization, keeping properness and smoothness explicit. Identify sheaf and singular cohomology locally on the base with the fibre cohomology. The transition maps define the locally constant coefficient sheaf; finite-CW compact fibres supply finite rank for C.

Acceptance: For the product of a compact genus-g Riemann surface with a smooth base, integral H¹ stalks are Z^(2g) with constant monodromy. Complex stalks have complex dimension 2g, not finite additive-group generation.

Proof references: [DELIGNE70](https://publications.ias.edu/sites/default/files/Number9.pdf), Deligne70 I2.23 and II7: relative cohomology setup; [TOMDIECK](https://www.uni-math.gwdg.de/tammo/GT03.pdf), §2.2, Theorem2.2.4 and proofs2.2.1–2.2.3, pp.52–53.

<a id="C5-gauss-manin-connection"></a>

### Gauss–Manin connection from the de Rham filtration

For a smooth proper algebraic map f:X→S in characteristic zero with S smooth, the filtration of the absolute de Rham complex by pulled-back base forms gives the integrable connection ∇:H^q_dR(X/S)→Ω¹_S⊗H^q_dR(X/S). It is the connecting morphism of the first two filtration levels, satisfies the Leibniz law, and its analytic horizontal local system is R^qf^an_*C.

Target `C5/gauss-manin-connection` (construction). Dependencies: [C5/algebraic-de-rham-complex](#C5-algebraic-de-rham-complex), [C5/relative-poincare](#C5-relative-poincare), [C5/relative-betti-local-system](#C5-relative-betti-local-system), [C5/algebraic-connection](#C5-algebraic-connection), `SchemeAndStackFoundations:SF.2`.

Prototype: `TauCeti.ComplexComparison.gaussManinConnection`.

Proof route: Filter the absolute de Rham complex by the number of pulled-back base forms; smoothness makes its graded pieces Ω^p_S⊗Ω^•_(X/S)[−p]. Take the connecting map of the first two levels. Identify the first spectral-sequence page with Ω^p_S⊗H^q_dR(X/S) using the locally free projection formula. Its multiplicative differential gives the connection and its Leibniz rule. The square of this first differential is zero, so the extended connection has zero curvature (Katz–Oda §2, Theorem1, pp.201–204). Use the short exact filtration quotient and the Čech total complex of an affine cover to identify this differential with the connecting construction (§3 pp.204–206). The complex is a complex of abelian sheaves even though its terms are coherent. Compare the exact sequence through operator hyper-GAGA and relative Poincaré to identify the analytic horizontal sheaf and the Betti local system.

API:

- `GaussManin.connection` (data): The connection is the filtration connecting morphism.
- `GaussManin.integrable` (simp): Its curvature is zero.
- `GaussManin.horizontalComparison` (compatibility): Analytic horizontal sections are the Betti local system with its canonical coefficient map.

Discriminating tests:

- `GaussManin.constantFamily` (computation): For X=F×S the connection on H^q_dR(F)⊗O_S differentiates only base coefficients.
- `GaussManin.degreeZero` (degenerate): For a family with connected fibres, H^0=O_S with its ordinary derivative.
- `GaussManin.leibniz` (characterisation): ∇(a v)=da⊗v+a∇v, testing that the connection is not O_S-linear.

Uses: C5 relative comparison — Exports the comparison as an isomorphism of flat bundles, not merely vector spaces.; Qian23 relative Hodge bundles — Provides the connection and the transversality interface on the relative de Rham bundle..

Acceptance: The named API and the three discriminating tests below hold in the shared carrier, through the specified compatibility maps.

Proof references: [DELIGNE70](https://publications.ias.edu/sites/default/files/Number9.pdf), II7.4–7.8, printedpp.114–118, PDF117–121; integrability in7.8 refers to Katz–Oda; [KATZODA68](https://www.its.caltech.edu/~matilde/GaussManinKatzOda.pdf), §1 pp.199–201; §2 Theorem1 and proof pp.201–204, especially the first-page differential and zero curvature onp.203; §3 pp.204–206.

<a id="C5-relative-de-rham-betti"></a>

### Proper smooth relative de Rham–Betti comparison

For a smooth proper algebraic map f:X→S of smooth C-schemes, the canonical morphism (R^q f_*Ω^•_{X/S})^an→(R^qf^an_*C)⊗_C O_{S^an} is an isomorphism of locally free holomorphic modules with integrable connection, compatible with pullback and fibre comparison. Use relative f^{-1}O_S Poincaré, proper hyper-GAGA and Ehresmann; no projectivity hypothesis is introduced.

Target `C5/relative-de-rham-betti` (theorem). Dependencies: [C5/gauss-manin-connection](#C5-gauss-manin-connection), [C5/relative-poincare](#C5-relative-poincare), [C5/relative-betti-local-system](#C5-relative-betti-local-system), [C5/bounded-operator-hypergaga](#C5-bounded-operator-hypergaga).

Prototype: `TauCeti.ComplexComparison.relativeDeRhamBetti`.

Proof route: Compare the relative bounded differential-operator complexes under the proper map. Use the relative Poincaré resolution and local topological trivialization to identify analytic hypercohomology with the Betti module tensored with O_S. The filtration connecting maps identify the Gauss–Manin and locally constant flat connections.

Acceptance: For a constant elliptic family, the comparison carries a fixed fibre class times a holomorphic base coefficient to the corresponding Betti class times that coefficient; the connection differentiates the coefficient.

Proof references: [DELIGNE70](https://publications.ias.edu/sites/default/files/Number9.pdf), I2.23 and II7; Deligne1968 Theorem5.5.

<a id="C5-relative-hodge-bundles"></a>

### Relative Hodge degeneration, local freeness and base change

For f:X→S smooth and proper with S locally Noetherian over a characteristic-zero field, each R^qf_*Ω^p_{X/S} is finite locally free and commutes with arbitrary base change. The relative Hodge-to-de Rham spectral sequence degenerates at E1, and each Hodge-filtration step in H^n_dR(X/S) is a locally direct summand, also compatible with base change. S may be nonreduced. For a finite group action whose order is invertible on S, each character idempotent cuts out a finite locally free direct summand; it inherits the filtration and comparison.

Target `C5/relative-hodge-bundles` (theorem). Dependencies: [C5/relative-de-rham-betti](#C5-relative-de-rham-betti), [C5/proper-pure-hodge](#C5-proper-pure-hodge), `tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change`.

Prototype: `TauCeti.ComplexComparison.relativeHodgeBundles`.

Proof route: Noetherian approximation reduces to finite type and then to Artin local thickenings. Over fields embed the needed finitely generated characteristic-zero data into C and apply the proper geometric Hodge result. Deligne’s length comparison on Artin thickenings forces degeneration, freeness and arbitrary base change; idempotent images are direct summands, giving Qian’s character statement.

Acceptance: The theorem includes a dual-number base; reduced-fibre dimension counting alone is not its proof. An averaging projector is used only when the finite group order is invertible.

Proof references: [DELIGNE1968](https://www.numdam.org/item/PMIHES_1968__35__107_0.pdf), Theorem5.5 and proof, printedpp.124–125, PDF19–20; Qian23 Lemma3.10(2), printedp.1266.

<a id="C5-hodge-star"></a>

### Hodge star on the existing smooth-form carrier

On an oriented Riemannian real m-manifold, define the fibrewise Hodge star on DifferentialGeometry’s smooth exterior forms by α∧*β=⟨α,β⟩vol. Extend C-linearly to complex forms and use the Hermitian pairing with conjugation in the defining identity. The native smooth-form carrier and wedge product are imported, not reconstructed.

Target `C5/hodge-star` (construction). Dependencies: `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`.

Prototype: `TauCeti.ComplexComparison.planeStar`.

Proof route: Use the induced metric and oriented volume element on each cotangent exterior power. The nondegenerate wedge pairing defines a unique star; smooth local orthonormal frames prove smoothness. Compare frames and extend complex linearly, keeping conjugation in the Hermitian formula.

API:

- `HodgeStar.wedge_identity` (characterisation): α∧*conj(β)=⟨α,β⟩vol for complex forms.
- `HodgeStar.square` (simp): *² on degree r is multiplication by (−1)^(r(m−r)).
- `HodgeStar.isometry` (compatibility): The star preserves the pointwise norm and identifies complementary degrees.

Discriminating tests:

- `HodgeStar.dimensionZero` (degenerate): On an oriented point, star is identity.
- `HodgeStar.euclideanPlane` (computation): With dx∧dy positive, *dx=dy and *dy=−dx.
- `HodgeStar.complexLinearity` (characterisation): *(iα)=i*α; conjugation belongs in the pairing, not in the star map.

Uses: C5 codifferential and Hodge Laplacian — Defines the formal adjoint with the exact degree sign.; C5 Kähler harmonic decomposition — Acts on the existing complex-valued form bundle and respects the Hodge metric..

Acceptance: The named API and the three discriminating tests below hold in the shared carrier, through the specified compatibility maps.

Proof references: [DEMAILLY](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf), VI3.1–3.9, pp.291–293.

<a id="C5-hodge-laplacian"></a>

### Positive Hodge Laplacian and formal adjoint

On a compact oriented Riemannian m-manifold without boundary, the codifferential on r-forms is δ_r=(−1)^(m(r+1)+1)*d*. The Hodge Laplacian is Δ_r=dδ+δd and has nonnegative energy ⟨Δα,α⟩=||dα||²+||δα||². DifferentialGeometry’s scalar laplaceBeltrami uses div grad; Δ_0 is its negative. Use the existing smooth forms, integration and metric APIs.

Target `C5/hodge-laplacian` (construction). Dependencies: [C5/hodge-star](#C5-hodge-star).

Prototype: `TauCeti.ComplexComparison.hodgeLaplacian`.

Proof route: Use Stokes and the wedge-star identity to compute the adjoint sign with the input degree r. Expand Δ and use d²=0 to prove commutation with d and δ. Integration on the compact boundary-free manifold gives the energy identity and positivity.

API:

- `HodgeLaplacian.formalAdjoint` (characterisation): δ is the L² adjoint of d under the stated compactness and boundary assumptions.
- `HodgeLaplacian.energy` (simp): The displayed sum-of-squares energy identity holds.
- `HodgeLaplacian.commute_d` (compatibility): Δ_{r+1}d=dΔ_r.

Discriminating tests:

- `HodgeLaplacian.constant` (degenerate): A constant function has Δ_0=0.
- `HodgeLaplacian.euclideanSign` (computation): In R³, Δ_0(x_1²)=−2, fixing the sign against div grad.
- `HodgeLaplacian.starSign` (computation): In real dimension2 the input-degree formula gives δ_1=−*d*, so the formal-adjoint test catches a shifted degree.

Uses: C5 harmonic forms and Green operator — Defines the elliptic operator and its kernel.; C1 weighted Dolbeault estimate — The Dolbeault adjoint and Kähler identity use the same sign and metric conventions..

Acceptance: The named API and the three discriminating tests below hold in the shared carrier, through the specified compatibility maps.

Proof references: [DEMAILLY](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf), VI1.1–1.2, pp.287–288; VI3.9–3.14, pp.293–294.

<a id="C5-compact-elliptic-hodge"></a>

### Compact bundle elliptic Fredholm and regularity interface

Import an extension of PDEPartII to formally self-adjoint strongly elliptic operators on finite-rank vector bundles over compact smooth boundary-free manifolds. The required contract is H^{s+2} elliptic regularity, a global Gårding estimate, Rellich compactness, finite-dimensional smooth kernel, closed image equal to its orthogonal complement, and bounded inverse on that complement. The present scalar Euclidean PDE roadmap does not yet provide this contract.

Target `C5/compact-elliptic-hodge` (application). Dependencies: [C5/hodge-laplacian](#C5-hodge-laplacian), `tauceti:TauCetiRoadmap/PDE#milestone-d-16`.

Prototype: `TauCeti.ComplexComparison.compactEllipticHodge`.

Proof route: Apply the requested local system estimates in finitely many bundle trivializations and control commutator terms with a partition of unity. Compact Sobolev inclusion makes the kernel finite and the orthogonal-complement estimate coercive. The self-adjoint closed-range argument and elliptic regularity produce a smooth Green solution for smooth data.

Acceptance: Demailly states the Rellich and Gårding inputs but refers out for their proofs; this is an explicit supplier gap. Neither scalar Lax–Milgram alone nor a bare Hilbert-space spectral theorem proves this bundle elliptic contract.

Proof references: [DEMAILLY](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf), VI2.2–2.4, pp.289–291; elliptic regularity VI1.6 pp.288–289.

<a id="C5-harmonic-projection-green"></a>

### Harmonic projection and Green operator

For the compact manifold and Hodge Laplacian above, H_r is the orthogonal projection onto its finite-dimensional smooth kernel and G_r is zero on that kernel and the inverse of Δ_r on its orthogonal complement. Thus id=H+ΔG=H+GΔ on smooth forms. Harmonic forms represent de Rham cohomology uniquely.

Target `C5/harmonic-projection-green` (construction). Dependencies: [C5/compact-elliptic-hodge](#C5-compact-elliptic-hodge), [C5/hodge-laplacian](#C5-hodge-laplacian).

Prototype: `TauCeti.ComplexComparison.harmonicProjection`.

Proof route: Use the imported compact bundle elliptic Fredholm result to split kernel and orthogonal complement. Define the Green inverse there and prove smoothness by regularity. Commutation with d and δ gives the exact/coexact/harmonic decomposition and the unique cohomology representative.

API:

- `HarmonicGreen.projection_idempotent` (simp): H²=H and H is self-adjoint.
- `HarmonicGreen.green_identity` (characterisation): ΔG=GΔ=id−H on smooth forms.
- `HarmonicGreen.cohomologyEquiv` (compatibility): The map from harmonic r-forms to the existing smooth de Rham cohomology is an isomorphism.

Discriminating tests:

- `HarmonicGreen.point` (degenerate): On a point, H_0=id and G_0=0.
- `HarmonicGreen.circle` (computation): On the unit circle harmonic1-forms form the one-dimensional span of dθ.
- `HarmonicGreen.projectiveLine` (computation): On P¹, harmonic1-forms vanish while harmonic0- and2-forms each have dimension1.

Uses: C5 Kähler geometric Hodge decomposition — Provides harmonic representatives before assigning their bidegrees.; Proper algebraic Hodge theory — Imports smooth de Rham cohomology from DifferentialGeometry and supplies its analytic harmonic refinement..

Acceptance: The named API and the three discriminating tests below hold in the shared carrier, through the specified compatibility maps.

Proof references: [DEMAILLY](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf), VI2.4, pp.290–291; VI3.15–3.17, pp.294–295.

<a id="C5-kaehler-identities"></a>

### Kähler identities and equality of Laplacians

On a Kähler manifold, with L=ω∧ and Λ its adjoint, [Λ,∂]=i∂̄* and [Λ,∂̄]=−i∂*. Consequently Δ_d=2Δ_∂=2Δ_∂̄, with the positive Hodge sign. On a general Hermitian manifold torsion terms occur, so these uncorrected identities are not asserted.

Target `C5/kaehler-identities` (theorem). Dependencies: [C5/hodge-star](#C5-hodge-star), [C5/hodge-laplacian](#C5-hodge-laplacian).

Prototype: `TauCeti.ComplexComparison.kaehlerIdentities`.

Proof route: Compute wedge/contraction commutators in constant orthonormal complex coordinates. Kähler normal coordinates kill the first metric derivatives at the chosen point, globalizing the identities. Apply graded Jacobi and ∂²=∂̄²=∂∂̄+∂̄∂=0 to identify the three Laplacians.

Acceptance: For a flat complex coordinate chart, Δ_d=2Δ_∂̄ with the positive sign. A general Hermitian metric keeps its torsion terms and does not satisfy the uncorrected Kähler formula.

Proof references: [DEMAILLY](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf), VI6.1–6.7, pp.304–306; VI6.8–6.9 pp.306–307.

<a id="C5-kaehler-hodge-decomposition"></a>

### Compact Kähler geometric Hodge decomposition

For a compact Kähler manifold T, smooth de Rham cohomology in degree n is canonically the direct sum of harmonic (p,q)-forms with p+q=n, hence of H^q(T,Ω^p_T); complex conjugation exchanges (p,q) and(q,p). The Hodge filtration and its conjugate are opposed, and the Hodge-to-de Rham spectral sequence degenerates at E1. E1 degeneration on a general compact complex manifold alone is not used to infer this canonical decomposition.

Target `C5/kaehler-hodge-decomposition` (theorem). Dependencies: [C5/harmonic-projection-green](#C5-harmonic-projection-green), [C5/kaehler-identities](#C5-kaehler-identities), [C1/local-dolbeault](#C1-local-dolbeault), `tauceti:TauCeti.Hodge.Conjugation`, `tauceti:TauCeti.Hodge.HodgeStructureOn`.

Prototype: `TauCeti.ComplexComparison.compactKaehlerHodge`.

Proof route: The equal Laplacians preserve bidegree, so the unique harmonic representative splits into harmonic (p,q) components. Dolbeault’s fine resolution identifies those components with coherent H^q(Ω^p). The conjugation and harmonic splitting prove opposed filtrations; the ∂∂̄ lemma yields filtration compatibility and degeneration.

Acceptance: For an elliptic curve, H¹_C has conjugate one-dimensional (1,0) and (0,1) pieces. For P¹, H¹=0 and H² has type (1,1).

Proof references: [DEMAILLY](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf), VI8.1–8.6, pp.309–311; corrected use of VI11.3 pp.322–323.

<a id="C5-proper-pure-hodge"></a>

### Pure Hodge structure for proper smooth complex schemes

For a smooth proper C-scheme X, including nonprojective X, H^n_sing(X^an,Q) carries the pure Hodge structure of weight n whose Hodge filtration is algebraic de Rham form degree under comparison. Use the completed HodgeStructures roadmap only for abstract filtered/decomposed linear algebra. A nonprojective X^an need not be Kähler, so geometric Hodge theory is transported from a projective smooth modification.

Target `C5/proper-pure-hodge` (theorem). Dependencies: [C5/kaehler-hodge-decomposition](#C5-kaehler-hodge-decomposition), [C5/repair-proper-de-rham-betti](#C5-repair-proper-de-rham-betti), `AlgebraicModuliForArithmeticGeometry:R09.2`, `tauceti:TauCeti.Hodge.Conjugation`, `tauceti:TauCeti.Hodge.HodgeStructureOn`.

Prototype: `TauCeti.ComplexComparison.properPureHodge`.

Proof route: Chow modification and characteristic-zero resolution give a smooth projective proper modification Y→X. Pullback on cohomology is injective, with a trace/Gysin retraction through the existing manifold duality interface. Deligne’s filtration argument transports the pure structure and identifies the algebraic de Rham filtration on X.

Acceptance: No geometric Kähler or Hodge theorem is attributed to the abstract HodgeStructures package. The projective modification, resolution and trace compatibility are explicit inputs.

Proof references: [DELIGNE1968](https://www.numdam.org/item/PMIHES_1968__35__107_0.pdf), Proposition4.3 and Theorem5.3, printedpp.120–123, PDF15–18.

<a id="C5-analytic-cycle-integration"></a>

### Lelong integration over analytic cycles

For a pure d-dimensional analytic subset Z of a complex manifold, define [Z](η)=∫_{Z_reg}η for compactly supported smooth2d-forms, using complex orientation. The integral converges near the singular locus and defines a closed positive current. For a cycle Σm_iZ_i use the weighted sum; nilpotent thickness enters only through the chosen cycle multiplicities, not through the reduced regular locus.

Target `C5/analytic-cycle-integration` (construction). Dependencies: [C4/remmert-stein-extension](#C4-remmert-stein-extension), [C5/closed-current-extension](#C5-closed-current-extension).

Prototype: `TauCeti.ComplexComparison.analyticCycleIntegration`.

Proof route: Generic finite projections bound local mass by their finite sheet numbers. Extend the integration functional across the lower-dimensional singular locus using the finite-mass closed-current extension theorem. Take integer-weighted sums and use the existing smooth test forms, integration and Stokes APIs.

API:

- `AnalyticCycleIntegration.regular` (compatibility): On a smooth submanifold the functional is the existing manifold integral.
- `AnalyticCycleIntegration.add` (functoriality): Integration is additive in cycle multiplicities.
- `AnalyticCycleIntegration.closed` (simp): [Z](dη)=0 for every compactly supported test form of the appropriate degree.

Discriminating tests:

- `AnalyticCycleIntegration.point` (degenerate): A zero-dimensional reduced point integrates a function by evaluation.
- `AnalyticCycleIntegration.line` (computation): A coordinate complex line uses the orientation dx∧dy, not its negative.
- `AnalyticCycleIntegration.doubleLine` (characterisation): The cycle2[L] gives twice the integral; integrating only the reduced regular locus would lose that multiplicity.

Uses: DGH21 Proposition4.2 — Integrates semipositive forms over an analytic component, with compact cutoffs near its boundary.; C5 first Chern class and intersections — Pairs a cohomology representative with a possibly singular algebraic cycle..

Acceptance: The named API and the three discriminating tests below hold in the shared carrier, through the specified compatibility maps.

Proof references: [DEMAILLY](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf), III2.5–2.7 and proofs, p.140; III2.1–2.3, pp.138–140.

<a id="C5-semipositive-wedge"></a>

### Semipositive (1,1)-form wedge inequality

With complex orientation, wedge products of semipositive real (1,1)-forms are strongly positive. If α,β are semipositive and α−β is semipositive on a pure d-dimensional analytic set, then ∫_Zχ β^d≤∫_Zχ α^d for every nonnegative compactly supported smooth cutoff χ. More generally every mixed term in the binomial expansion is nonnegative.

Target `C5/semipositive-wedge` (theorem). Dependencies: [C5/analytic-cycle-integration](#C5-analytic-cycle-integration).

Prototype: `TauCeti.ComplexComparison.semipositiveWedge`.

Proof route: Diagonalize each semipositive Hermitian form into a sum of positive elementary wedges. Multiply the elementary wedges and check the complex orientation sign. Expand α=(α−β)+β and integrate the nonnegative mixed terms against the positive cycle current.

Acceptance: For α=tω and β=sω with t≥s≥0, their d-fold wedge integrals satisfy s^d≤t^d after a nonnegative cutoff. The zero form gives zero and each mixed positive term has the complex orientation.

Proof references: [DEMAILLY](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf), III1.7–1.12, pp.131–132; DGH21 Proposition4.2, PDFpp.16–18.

<a id="C5-chern-fubini-study-intersection"></a>

### Chern curvature, Fubini–Study and intersection normalization

For a Hermitian holomorphic line bundle L, (i/2π)Θ(L) represents the image of integral c1(L). On P^r the normalized Fubini–Study form represents c1(O(1)) and integrates to1 over a projective line. For a projective d-dimensional algebraic cycle Z, the integral of a smooth representative c1(L)^d over Z, with its cycle multiplicities, equals the algebraic intersection degree (c1(L)^d·Z). Mixed line-bundle degrees and Segre pullbacks compare with the same normalization.

Target `C5/chern-fubini-study-intersection` (theorem). Dependencies: [C5/analytic-cycle-integration](#C5-analytic-cycle-integration), [C5/semipositive-wedge](#C5-semipositive-wedge), [C5/multiplicative-period-interface](#C5-multiplicative-period-interface), `AlgebraicModuliForArithmeticGeometry:R09.1`.

Prototype: `TauCeti.ComplexComparison.chernFubiniStudyIntersection`.

Proof route: The Lelong–Poincaré identity identifies curvature with the divisor current of a meromorphic section. Use the normalized projective metric to evaluate c1(O(1)) on a line. Iterate divisor intersections or the imported projective degree/intersection interface, retaining multiplicities and lowering the singular support dimension.

Acceptance: On P¹ the normalized O(1) curvature integrates to one; O(m) gives degree m. A doubled cycle contributes twice its reduced degree, and a Segre pullback gives the tensor-product first Chern class.

Proof references: [DEMAILLY](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf), V13.2–13.9, pp.271–273; V15.8,15.10,15.12 and proofs, pp.279–281; DGH21 Proposition4.2.

<a id="C5-dgh-integration-application"></a>

### The DGH Proposition4.2 integration contract

In DGH21 Proposition4.2 use the Segre Fubini–Study representative of O(1,1), and after the paper’s projection ρ_2 the line bundle O(0,1,1) on the triple product. The semipositive form C[N]^*θ_α−N²θ_ω gives the mixed-wedge inequality on the analytic component. Compact cutoffs, Lelong integration and the lower-dimensional boundary argument compare its integral to the algebraic intersection degree with exactly that line bundle.

Target `C5/dgh-integration-application` (application). Dependencies: [C5/analytic-cycle-integration](#C5-analytic-cycle-integration), [C5/semipositive-wedge](#C5-semipositive-wedge), [C5/chern-fubini-study-intersection](#C5-chern-fubini-study-intersection).

Prototype: `TauCeti.ComplexComparison.dghIntegrationApplication`.

Proof route: Retain the paper’s second projection and its line-bundle pullback, rather than replace it with O(1,1,1). Apply the semipositive mixed-wedge inequality to each compact cutoff on the analytic component. Pass to the limit using finite mass and remove the lower-dimensional boundary contribution before identifying the total intersection degree.

Acceptance: The Fubini–Study normalization has integral1 on a line; the period of dz/z remains2πi. Every use of integration on a singular set passes through the analytic-cycle functional.

Proof references: [DGH21](https://arxiv.org/pdf/2001.10276v3), Proposition4.2 and proof, PDFpp.16–18.

<a id="C5-algebraic-connection"></a>

### Ordinary algebraic connections and flat coefficient complexes

For a smooth C-scheme X and finite locally free E, a connection is a C-linear sheaf map ∇:E→Ω¹_X⊗E satisfying ∇(as)=da⊗s+a∇s. Extend it by the graded Leibniz formula to E⊗Ω^•; flatness is zero curvature, equivalently the extended differential squares to zero. This elementary connection and coefficient-complex prefix moves down from higher-tier CrystallineCohomology and HodgeStructuresPartII; their crystalline and Hodge-theoretic extensions import it.

Target `C5/algebraic-connection` (construction). Dependencies: [C5/algebraic-de-rham-complex](#C5-algebraic-de-rham-complex), [C0/coherent-operations](#C0-coherent-operations).

Prototype: `TauCeti.ComplexComparison.AlgebraicConnection`.

Proof route: Use the native sheaf modules, Kähler derivation and tensor product. Impose the displayed Leibniz equation on the C-linear connection map, rather than define an opaque flatness predicate. Extend to exterior forms; compute the square as wedge action by curvature.

API:

- `AlgebraicConnection.leibniz` (characterisation): The connection satisfies the displayed scalar Leibniz equation.
- `AlgebraicConnection.tensor` (functoriality): Connections on E and F induce ∇_E⊗1+1⊗∇_F on E⊗F.
- `AlgebraicConnection.curvature_iff_square` (simp): Zero curvature is equivalent to square zero on the coefficient de Rham complex.

Discriminating tests:

- `AlgebraicConnection.trivial` (compatibility): On O_X, ∇ is the universal exterior derivative.
- `AlgebraicConnection.point` (degenerate): On SpecC every connection has zero map and zero curvature.
- `AlgebraicConnection.rankOneTorus` (computation): d+a dz/z on O_{G_m} is flat and has local monodromy exp(−2πia).

Uses: C5 Gauss–Manin and Deligne equivalence — Carries the actual connection maps and horizontal tensor operations.; Higher-tier CrystallineCohomology and HodgeStructuresPartII — Supplies their ordinary connection prefix without an upward prerequisite..

Acceptance: The named API and the three discriminating tests below hold in the shared carrier, through the specified compatibility maps.

Proof references: [DELIGNE70](https://publications.ias.edu/sites/default/files/Number9.pdf), I2.3–2.15, printedpp.6–11, PDF9–14.

<a id="C5-regular-singular-connection"></a>

### Regular singularities along algebraic boundaries

A finite locally free integrable algebraic connection on a smooth finite-type C-variety is regular singular if on every smooth curve mapping into it the induced connection has a logarithmic lattice at each missing point of a smooth completion. On a smooth proper compactification with a simple-normal-crossings boundary this is equivalent to existence of a finite locally free logarithmic lattice. The equivalence and independence of compactification use Deligne’s corrected II4.1, not the withdrawn II1.23–1.24.

Target `C5/regular-singular-connection` (definition). Dependencies: [C5/algebraic-connection](#C5-algebraic-connection), [C5/divisorial-log-structure](#C5-divisorial-log-structure), `AlgebraicModuliForArithmeticGeometry:R09.7/snc-compactification`.

Prototype: `TauCeti.ComplexComparison.RegularSingular`.

Proof route: Define the curve criterion using the supplied smooth curve model and punctured local lattices. Use local monodromy extensions, resolution and the corrected moderate-growth argument to obtain a logarithmic lattice on an SNC compactification. Apply pullback and local boundary charts to prove the curve criterion and independence of choices.

API:

- `RegularSingular.restrict` (functoriality): Restriction to an algebraic open preserves regular singularity.
- `RegularSingular.pullback` (functoriality): Pullback along an algebraic map between smooth varieties preserves regular singularity.
- `RegularSingular.tensor` (compatibility): Tensor and dual preserve regular singularity.

Discriminating tests:

- `RegularSingular.trivial` (degenerate): The trivial connection on any smooth variety is regular singular.
- `RegularSingular.logarithmic` (computation): d+a dz/z on G_m has logarithmic lattices at0 and∞.
- `RegularSingular.irregularInfinity` (non-example): d+dz on A¹ is flat but is irregular at∞, so arbitrary flat algebraic connections are excluded.

Uses: CS17 §2.3 — Algebraizes horizontal tensor morphisms through the regular-singular equivalence.; C5 nonproper de Rham comparison — Supplies the exact hypothesis for Deligne’s algebraic-to-analytic coefficient comparison..

Acceptance: The named API and the three discriminating tests below hold in the shared carrier, through the specified compatibility maps.

Proof references: [DELIGNE70](https://publications.ias.edu/sites/default/files/Number9.pdf), II4.1 and II5.1–5.9, printedpp.91–98; DELIGNE-ERRATUM replacement proof.

<a id="C5-canonical-logarithmic-extension"></a>

### Canonical logarithmic extension with a residue strip

For a finite-rank C-local system on U= X\D with X smooth proper and D simple normal crossings, choose a representative τ of C/Z, for example residues with0≤Reλ<1. Construct its locally free logarithmic extension with every residue eigenvalue in τ. Local monodromy is exp(−2πi Res). For general τ the extension is exact but tensor compatibility requires adjusting residues by integer shifts; the unipotent nilpotent-residue extension is tensor compatible.

Target `C5/canonical-logarithmic-extension` (construction). Dependencies: [C5/regular-singular-connection](#C5-regular-singular-connection), [C5/log-differentials](#C5-log-differentials).

Prototype: `TauCeti.ComplexComparison.canonicalResidue`.

Proof route: In a punctured polydisc choose commuting logarithms of the commuting monodromy operators with the required residue representatives. Multiply multivalued flat frames by the residue exponential to obtain single-valued holomorphic frames with logarithmic connection. The moderate-growth characterization glues these frames and proves uniqueness, local freeness and exactness.

API:

- `CanonicalLogExtension.residueSpectrum` (characterisation): Residue eigenvalues lie in the chosen representative strip.
- `CanonicalLogExtension.monodromy` (compatibility): Monodromy around each positive coordinate loop is exp(−2πiRes).
- `CanonicalLogExtension.uniqueness` (simp): An extension with the strip condition is unique as an extension of the given flat bundle.

Discriminating tests:

- `CanonicalLogExtension.emptyBoundary` (degenerate): With D empty, the extension is the original flat bundle.
- `CanonicalLogExtension.rankOne` (computation): Residue a has monodromy exp(−2πia).
- `CanonicalLogExtension.tensorCarry` (non-example): Two residues3/4 add to3/2; the canonical strip representative is1/2, so the general canonical extension is not an unadjusted tensor functor.

Uses: C5 Deligne equivalence and coefficient comparison — Constructs the regular algebraic connection by proper coherent GAGA.; CrystallineCohomology log prefix consumers — Fixes residue and monodromy conventions without importing a crystalline comparison theorem..

Acceptance: The named API and the three discriminating tests below hold in the shared carrier, through the specified compatibility maps.

Proof references: [DELIGNE70](https://publications.ias.edu/sites/default/files/Number9.pdf), II5.1–5.5 and proof, printedpp.91–95, PDF94–98.

<a id="C5-deligne-regular-singular-equivalence"></a>

### Deligne regular-singular Riemann–Hilbert equivalence

For a smooth finite-type complex variety U, algebraic finite locally free integrable connections with regular singularities are equivalent to finite-rank C-local systems on U^an, through analytification and horizontal sections. The functor is exact, fully faithful, and compatible with tensor and dual on U. In particular horizontal analytic tensors between regular algebraic connections are algebraic. Descent of those tensors to a specified number field is an additional arithmetic input.

Target `C5/deligne-regular-singular-equivalence` (theorem). Dependencies: [C5/canonical-logarithmic-extension](#C5-canonical-logarithmic-extension), [C5/relative-poincare](#C5-relative-poincare), [C3/proper-gaga-equivalence](#C3-proper-gaga-equivalence), `SchemeAndStackFoundations:SF.1`.

Prototype: `TauCeti.ComplexComparison.rankOneRiemannHilbert`.

Proof route: On a smooth quasiprojective open use an SNC compactification and construct the canonical logarithmic extension. Proper coherent GAGA algebraizes the extension and the finite-order logarithmic connection operator. The regular moderate-growth characterization algebraizes horizontal morphisms; algebraic open descent covers the general smooth variety.

Acceptance: A proper smooth variety has no boundary regularity obstruction; proper coherent GAGA suffices for the horizontal-map step used in CS17. On A¹ the irregular connection d+dz is excluded, although its analytic horizontal sheaf is locally constant.

Proof references: [DELIGNE70](https://publications.ias.edu/sites/default/files/Number9.pdf), II5.7–5.9 and proof, printedpp.95–98; corrected II4.1; CS17 §2.3 PDFp.17.

<a id="C5-regular-singular-de-rham-comparison"></a>

### Deligne nonproper logarithmic coefficient comparison

For a smooth finite-type C-variety U and a regular-singular flat algebraic connection(E,∇) with local system V, H^q_dR(U,E)≅H^q_sing(U^an,V). For an SNC proper compactification and a logarithmic extension whose residue eigenvalues avoid strictly positive integers, Ω^•_X(logD)⊗E→Rj_*(Ω^•_{U^an}⊗E^an) is a quasi-isomorphism. State and use the residue restriction; an arbitrary logarithmic lattice need not compute the same cohomology.

Target `C5/regular-singular-de-rham-comparison` (theorem). Dependencies: [C5/deligne-regular-singular-equivalence](#C5-deligne-regular-singular-equivalence), [C5/bounded-operator-hypergaga](#C5-bounded-operator-hypergaga), [C5/log-de-rham-complex](#C5-log-de-rham-complex), [C5/repair-sheaf-singular-comparison](#C5-repair-sheaf-singular-comparison).

Prototype: `TauCeti.ComplexComparison.regularSingularDeRhamComparison`.

Proof route: On a boundary polydisc expand Laurent series and separate the negative-exponent subcomplex. Contract it using the inverses of the exponent-plus-residue operators; excluding positive integer residue eigenvalues makes these inverses available. Apply proper operator hyper-GAGA to the extension and then the coefficient Poincaré resolution; algebraic open descent removes a global quasiprojectivity restriction.

Acceptance: For the trivial connection on G_m, H¹ is generated by dz/z with positive-loop period 2πi. The lattice generated by z⁻¹ for the trivial connection has residue −1 and is allowed; the lattice generated by z has positive residue 1 and can add a local cohomology obstruction.

Proof references: [DELIGNE70](https://publications.ias.edu/sites/default/files/Number9.pdf), II6.7–6.10 and proof, printedpp.102–105, PDF105–108.

<a id="C5-curve-log-complex"></a>

### Curve logarithmic and compact-support de Rham complexes

For a smooth projective complex curve C with reduced finite boundary D and U=C\D, Ω^•_C(logD)=[O_C→Ω¹_C(D)] computes ordinary de Rham cohomology of U. The complex Ω^•_C(logD)⊗O_C(−D)=[O_C(−D)→Ω¹_C] computes compact-support cohomology. Differentials are C-linear. The inclusion from the compact-support complex to the ordinary one gives parabolic H¹ as its image, with the named residue/localization maps.

Target `C5/curve-log-complex` (construction). Dependencies: [C5/log-de-rham-complex](#C5-log-de-rham-complex), [C5/regular-singular-de-rham-comparison](#C5-regular-singular-de-rham-comparison), [C4/repair-affine-curve-completion-interface](#C4-repair-affine-curve-completion-interface).

Prototype: `TauCeti.ComplexComparison.curveLogComplex`.

Proof route: Use the supplied curve completion and its finite reduced divisor. The local logarithmic Poincaré calculation identifies the ordinary complex with Rj_*C and the twisted complex with j!C. The inclusion of complexes induces the ordinary/compact-support map and its image; no new generic compact-support cohomology carrier is defined.

API:

- `CurveLogComplex.ordinary` (data): The terms are O_C and Ω¹_C(D) with the exterior differential.
- `CurveLogComplex.compactSupport` (data): The twisted terms are O_C(−D) and Ω¹_C.
- `CurveLogComplex.parabolic` (compatibility): Parabolic H¹ is the image of the natural H¹_c→H¹ map.

Discriminating tests:

- `CurveLogComplex.emptyBoundary` (degenerate): For D empty the ordinary and compact-support complexes agree.
- `CurveLogComplex.affineLine` (computation): For P¹\{∞}, ordinary H¹ vanishes and H²_c is one-dimensional.
- `CurveLogComplex.torus` (computation): For P¹\{0,∞}, H¹ is generated by dz/z and parabolic H¹ is zero.

Uses: Arithmetic curve comparison acceptance — Carries ordinary, compact-support and parabolic cohomology with one fixed period convention.; C5 residue and localization — Supplies the two complexes and their exact sequence rather than an invented curve model..

Acceptance: The named API and the three discriminating tests below hold in the shared carrier, through the specified compatibility maps.

Proof references: [GROTH1966](https://www.numdam.org/article/PMIHES_1966__29__95_0.pdf), Theorem2, printedp.96; Deligne70 II6.9–6.10, printedpp.103–105.

<a id="C5-curve-residue-localization"></a>

### Residues and curve localization with the period factor

For the preceding curve, 0→Ω^•_C→Ω^•_C(logD)→⊕_{p∈D}C_p[−1]→0 is exact, with residue Res_p(a dz/z)=a. Its hypercohomology localization sequence compares to Betti localization after multiplying the residue identification by2πi for a positive loop. The global residue sum maps to the oriented trace; compact-support and ordinary pairings induce the parabolic pairing with these same conventions.

Target `C5/curve-residue-localization` (theorem). Dependencies: [C5/curve-log-complex](#C5-curve-log-complex), [C5/multiplicative-period-interface](#C5-multiplicative-period-interface).

Prototype: `TauCeti.ComplexComparison.curveResidueLocalization`.

Proof route: Check the logarithmic quotient locally and identify the coefficient of dz/z. Apply native hypercohomology to its exact triangle and compare every connecting morphism through operator GAGA. The loop integral fixes the2πi factor; Stokes and duality identify the trace and compact-support pairing.

Acceptance: On P¹, dz/z has residues 1 at 0 and −1 at ∞. For G_m the ordinary H¹ is C and its parabolic image is zero; the Betti residue map differs by 2πi.

Proof references: [GROTH1966](https://www.numdam.org/article/PMIHES_1966__29__95_0.pdf), Theorem2, printedpp.96–97; Deligne70 II6.9–6.10.

<a id="C5-prelog-structure"></a>

### Prelog structures on the native ringed site

For a ringed site (T,O_T), a prelog structure is a sheaf M of commutative monoids and a multiplicative sheaf morphism α:M→(O_T,·). It may send nonunits to zero. On a ring A with chart monoid P this is a MonoidHom P A, not an additive ring map and not a map only into A*. Morphisms commute with α.

Target `C5/prelog-structure` (definition). Dependencies: `SchemeAndStackFoundations:SF.1`.

Prototype: `TauCeti.ComplexComparison.PrelogStructure`.

Proof route: Use native monoid objects, sheaves and monoid homomorphisms on the same site as O_T. Forget the additive structure of O_T in the target, retaining its multiplicative zero. Define morphisms by their commuting structure-map square.

API:

- `PrelogStructure.structureMap` (data): The structure map is multiplicative and sends1 to1.
- `PrelogStructure.morphism` (functoriality): A prelog morphism is a monoid-sheaf morphism compatible with the structure maps.
- `PrelogStructure.restrict` (compatibility): Restriction to an open uses native sheaf restriction.

Discriminating tests:

- `PrelogStructure.trivialChart` (degenerate): The one-element chart maps its unit to1.
- `PrelogStructure.coordinateChart` (computation): The additive chart N maps n to z^n on a coordinate disc.
- `PrelogStructure.standardLogpoint` (computation): For N→C the generator maps to0, while0 in additive N maps to1; restricting the target to units would exclude the logpoint.

Uses: C5 associated log structure — Input of the logification adjunction.; Qian logarithmic comparison — Carries the standard logpoint and semistable chart maps..

Acceptance: The named API and the three discriminating tests below hold in the shared carrier, through the specified compatibility maps.

Proof references: [KATO89](https://math.uchicago.edu/~drinfeld/p-adic_periods/Kato_log-structures.pdf), §1.1, printedp.192.

<a id="C5-log-structure"></a>

### Log structures and the unit condition

A log structure is a prelog structure α:M→O_T for which the induced map α^{-1}(O_T*)→O_T* is an isomorphism of monoid sheaves. Units are the native unit group of O_T, and the condition is tested sheafwise, equivalently stalkwise. A log morphism combines a ringed-space map with a compatible map on pulled-back monoid sheaves.

Target `C5/log-structure` (definition). Dependencies: [C5/prelog-structure](#C5-prelog-structure).

Prototype: `TauCeti.ComplexComparison.LogStructure`.

Proof route: Form the inverse-image unit subsheaf from the native unit map. Require the actual induced morphism to be an isomorphism, rather than supply an unrelated equivalence or a name for the condition. Use restriction and stalk maps of the native sheaf category.

API:

- `LogStructure.unitsIso` (characterisation): The unit-preimage morphism is the specified isomorphism.
- `LogStructure.trivial` (constructor): O_T*→O_T is the trivial log structure.
- `LogStructure.restrict` (functoriality): Open restriction preserves the unit condition.

Discriminating tests:

- `LogStructure.trivialUnits` (compatibility): In the trivial log structure the characteristic quotient M/O_T* is the one-element monoid.
- `LogStructure.point` (degenerate): On a field point the trivial log structure is its multiplicative unit group.
- `LogStructure.rawNChart` (non-example): The raw coordinate chart N→C[z] is not itself a log structure because it omits the nontrivial units; logification adds them.

Uses: C5 divisorial and fine log charts — States the actual unit requirement and log-morphism category.; CrystallineCohomology CR.5 higher-tier consumer — Imports this elementary ringed log prefix; crystalline sites and comparison remain there..

Acceptance: The named API and the three discriminating tests below hold in the shared carrier, through the specified compatibility maps.

Proof references: [KATO89](https://math.uchicago.edu/~drinfeld/p-adic_periods/Kato_log-structures.pdf), §1.2–1.4, printedpp.192–194.

<a id="C5-associated-log-structure"></a>

### Associated log structure by the unit pushout

For a prelog α:M→O_T, define M^a as the sheaf pushout M⊕_{α^{-1}(O_T*)}O_T*, with the induced structure map to O_T. It is a log structure and is left adjoint to forgetting a log structure to a prelog structure. Sheafify the monoid pushout when constructed sectionwise.

Target `C5/associated-log-structure` (construction). Dependencies: [C5/log-structure](#C5-log-structure).

Prototype: `TauCeti.ComplexComparison.associatedLog`.

Proof route: Use the native commutative-monoid colimit and sheafification. The pushout identifies exactly the old elements mapping to units with their native units. The pushout universal property gives the log unit isomorphism and the logification adjunction.

API:

- `AssociatedLog.unit` (data): There is the canonical prelog morphism M→M^a.
- `AssociatedLog.lift_unique` (characterisation): A prelog map to a log structure factors uniquely through M^a.
- `AssociatedLog.idempotent` (simp): Logification of an existing log structure is canonically itself.

Discriminating tests:

- `AssociatedLog.trivialMonoid` (degenerate): Logifying the one-element chart gives O_T*.
- `AssociatedLog.coordinate` (computation): At a coordinate zero the characteristic monoid of the divisorial chart is N.
- `AssociatedLog.unitChart` (compatibility): A chart whose every generator maps to a unit logifies to the trivial log structure.

Uses: C5 pullback and divisorial log structures — Adds the correct units after changing rings or sites.; C5 logarithmic differentials — The differential module is unchanged by logifying its prelog charts..

Acceptance: The named API and the three discriminating tests below hold in the shared carrier, through the specified compatibility maps.

Proof references: [KATO89](https://math.uchicago.edu/~drinfeld/p-adic_periods/Kato_log-structures.pdf), §1.3 and pushout description, printedpp.192–193.

<a id="C5-log-pullback"></a>

### Pullback of a log structure

For a ringed-space morphism f:T→S and log structure M on S, define f* M as logification of f^{-1}M→f^{-1}O_S→O_T. This is not merely f^{-1}M: changing rings can turn nonunits into units. Identity and composition have the canonical native inverse-image and logification isomorphisms.

Target `C5/log-pullback` (construction). Dependencies: [C5/associated-log-structure](#C5-associated-log-structure).

Prototype: `TauCeti.ComplexComparison.logPullback`.

Proof route: Pull back the monoid sheaf and compose the structure map with f’s ring map. Logify using the units in the target structure sheaf. The universal property identifies iterated pullback and preserves fine chart conditions.

API:

- `LogPullback.chart` (characterisation): A chart pulls back by composing its ring map and then logifying.
- `LogPullback.identity` (simp): Identity pullback is canonically the original log structure.
- `LogPullback.composition` (functoriality): Composite pullback is canonically the iterated pullback.

Discriminating tests:

- `LogPullback.openComplement` (computation): A coordinate divisorial log structure becomes trivial where the coordinate is invertible.
- `LogPullback.origin` (computation): Pullback to the coordinate zero gives the standard logpoint N→C,1↦0 after logification.
- `LogPullback.trivial` (degenerate): Pullback of a trivial log structure is trivial.

Uses: C5 chart and differential base change — Carries the logarithmic part of the base-change maps.; Regular-singular compactification changes — Compares boundary charts under algebraic pullback..

Acceptance: The named API and the three discriminating tests below hold in the shared carrier, through the specified compatibility maps.

Proof references: [KATO89](https://math.uchicago.edu/~drinfeld/p-adic_periods/Kato_log-structures.pdf), §1.4 and1.6, printedpp.193–195.

<a id="C5-fine-log-chart"></a>

### Fine log structures and integral finite charts

A commutative monoid is integral when cancellation holds, equivalently it embeds in its group completion. It is fine when it is also finitely generated. A log structure is fine when étale locally it is the logification of a chart from a fine monoid. A chart includes its map and the induced logification isomorphism. Fine does not imply saturated: saturation is a separate condition in the group completion.

Target `C5/fine-log-chart` (definition). Dependencies: [C5/associated-log-structure](#C5-associated-log-structure), [C5/log-pullback](#C5-log-pullback).

Prototype: `TauCeti.ComplexComparison.FineLogChart`.

Proof route: Use the native finite-generation and cancellation conditions on the chart monoid. Keep the chart-to-logification isomorphism as data and require local charts in the étale topology. Group-completion localization compares overlapping charts; Kato’s finite-generation argument extends a suitable stalk chart to an étale neighbourhood.

API:

- `FineLogChart.groupCompletionEmbedding` (characterisation): Cancellation makes the monoid map to its group completion injective.
- `FineLogChart.logificationIso` (data): The chosen chart logifies to the given log structure.
- `FineLogChart.etaleLocal` (functoriality): Fine charts exist étale locally and pull back along the native log pullback.

Discriminating tests:

- `FineLogChart.free` (computation): N^r is integral and finitely generated, including r=0.
- `FineLogChart.unsaturated` (non-example): The additive submonoid generated by2 and3 in Z is fine but not saturated.
- `FineLogChart.noncancellative` (non-example): A monoid with a≠b and ca=cb is not integral, even if finitely generated.

Uses: C5 log smoothness and coherent differentials — Controls chart finiteness and the group-completion differential formula.; Qian proper fine log comparison — Provides the exact fine condition without silently strengthening it to fine saturated..

Acceptance: The named API and the three discriminating tests below hold in the shared carrier, through the specified compatibility maps.

Proof references: [KATO89](https://math.uchicago.edu/~drinfeld/p-adic_periods/Kato_log-structures.pdf), §2.1–2.5 and2.9–2.10, printedpp.197–200.

<a id="C5-divisorial-log-structure"></a>

### Divisorial log structure of a normal-crossings boundary

For a smooth scheme X with an SNC divisor D and j:U=X\D→X, M_D is the subsheaf of the multiplicative O_X consisting of functions invertible on U. With local equations z_1…z_r=0 it is logified from N^r→O_X, e_i↦z_i, and is fine and saturated. The underlying scheme and SNC boundary are imported from R09.7, including its quasiprojectivity hypothesis where used.

Target `C5/divisorial-log-structure` (construction). Dependencies: [C5/fine-log-chart](#C5-fine-log-chart), `AlgebraicModuliForArithmeticGeometry:R09.7/snc-compactification`.

Prototype: `TauCeti.ComplexComparison.divisorialLog`.

Proof route: Use the native open-immersion restriction of units to define the subsheaf. Regular SNC local coordinates factor boundary-supported divisors into coordinate powers times a unit. This identifies the subsheaf with logification of N^r, and fixes its characteristic monoids.

API:

- `DivisorialLog.chart` (characterisation): At an r-fold crossing the coordinate chart is N^r.
- `DivisorialLog.offBoundary` (compatibility): On U the structure is the trivial log structure.
- `DivisorialLog.changeEquation` (simp): Multiplying a boundary equation by a unit gives the same log structure.

Discriminating tests:

- `DivisorialLog.empty` (degenerate): An empty boundary gives the trivial log structure.
- `DivisorialLog.oneBranch` (computation): At a smooth boundary point the characteristic monoid is N.
- `DivisorialLog.crossing` (computation): For xy=0 in A² the characteristic monoid at the origin is N², not N.

Uses: C5 logarithmic forms and Deligne lattices — Provides the boundary logarithmic cotangent object.; Higher-tier log geometry consumers — Imports the shared elementary SNC chart instead of constructing another log carrier..

Acceptance: The named API and the three discriminating tests below hold in the shared carrier, through the specified compatibility maps.

Proof references: [KATO89](https://math.uchicago.edu/~drinfeld/p-adic_periods/Kato_log-structures.pdf), §1.5(1), printedp.194; Example2.5(1), pp.197–198.

<a id="C5-log-differentials"></a>

### Universal logarithmic differentials

For a prelog ring morphism (A,Q)→(B,P), Ω¹_log is (Ω¹_{B/A}⊕(B⊗_Z P^gp)) modulo dα(p)−α(p)dlogp and dlogh(q)=0 for q∈Q. Its universal pair (d,dlog) has dlog(pp′)=dlogp+dlogp′. Glue this quotient on the native ringed site. It is invariant under logification, satisfies logarithmic base change, and is coherent under the finite-type fine-chart hypotheses.

Target `C5/log-differentials` (construction). Dependencies: [C5/prelog-structure](#C5-prelog-structure), [C5/associated-log-structure](#C5-associated-log-structure), [C5/fine-log-chart](#C5-fine-log-chart), `mathlib:KaehlerDifferential.D`.

Prototype: `TauCeti.ComplexComparison.LogDifferentialModule`.

Proof route: Use native Kähler differentials, monoid group completion, tensor and submodule quotient. Impose both the scalar derivative relation and the relative base-monoid relation. The universal logarithmic derivation identifies changes of charts and logification; finite charts imply coherence.

API:

- `LogDifferentials.universal` (characterisation): Module maps out classify pairs of ordinary and logarithmic derivations with the displayed relations.
- `LogDifferentials.scalarRelation` (simp): dα(p)=α(p)dlogp.
- `LogDifferentials.baseChange` (compatibility): Log base change induces the canonical differential isomorphism in the corresponding log fibre product.

Discriminating tests:

- `LogDifferentials.trivial` (compatibility): For trivial log structures the module is the native Ω¹_{B/A}.
- `LogDifferentials.logpoint` (computation): For the standard logpoint over the trivial C-point, Ω¹_log=C·dlogt although the ordinary differential module is0.
- `LogDifferentials.relativeLogpoint` (degenerate): For identity of the standard logpoint, the relative log differential module is0; omitting the base-monoid relation gives a wrong answer.

Uses: Qian companion Proposition3.6 — Provides the coherent logarithmic cotangent and its absolute-to-relative quotient.; CrystallineCohomology CR.5 — Imports these universal log differentials; divided powers and crystalline comparisons are separate..

Acceptance: The named API and the three discriminating tests below hold in the shared carrier, through the specified compatibility maps.

Proof references: [KATO89](https://math.uchicago.edu/~drinfeld/p-adic_periods/Kato_log-structures.pdf), §1.7–1.8, pp.195–196; §2.1 p.197; Qian companion Proposition3.6 pp.18–19.

<a id="C5-log-smoothness"></a>

### Log smoothness by infinitesimal lifting

A morphism of fine log schemes is log smooth when its underlying scheme map is locally of finite presentation and every square-zero exact closed-immersion test diagram in Kato’s §3.1–3.3 has a lift étale locally on the test source. Here exact closed immersion means the pulled-back target log structure is the source log structure in that definition. Log étale additionally requires uniqueness. The fine log fibre product includes integralization when needed.

Target `C5/log-smoothness` (definition). Dependencies: [C5/fine-log-chart](#C5-fine-log-chart), [C5/log-differentials](#C5-log-differentials).

Prototype: `TauCeti.ComplexComparison.LogSmooth`.

Proof route: State the square-zero ideal, commuting square and compatible log-map equations explicitly. Quantify over the native scheme and log morphisms and an étale cover of the test object. Use the fine-category fibre product and its universal property for base-change statements.

API:

- `LogSmooth.lift` (characterisation): Every specified square-zero exact test square lifts étale locally.
- `LogSmooth.strict_iff` (compatibility): For a strict map, log smoothness is equivalent to ordinary smoothness.
- `LogSmooth.baseChange` (functoriality): Fine log base change preserves log smoothness.

Discriminating tests:

- `LogSmooth.identity` (degenerate): Identity of a fine log scheme is log étale and log smooth.
- `LogSmooth.trivialStructures` (compatibility): With trivial log structures the condition is ordinary smoothness.
- `LogSmooth.semistableChart` (computation): The semistable xy=t chart N→N²,1↦(1,1), is log smooth although its central underlying fibre is singular.

Uses: C5 logarithmic cotangent local freeness — Supplies the exact smoothness hypothesis for the exterior log complex.; Qian proper log GAGA — Identifies the proper fine log-smooth class in the companion comparison theorem..

Acceptance: The named API and the three discriminating tests below hold in the shared carrier, through the specified compatibility maps.

Proof references: [KATO89](https://math.uchicago.edu/~drinfeld/p-adic_periods/Kato_log-structures.pdf), Definitions3.1–3.3, pp.200–201.

<a id="C5-log-chart-criterion"></a>

### Kato chart criterion and log cotangent local freeness

A fine log morphism is log smooth iff étale locally there are charts Q→P extending a base chart such that the kernel and torsion part of the cokernel of Q^gp→P^gp are finite of orders invertible on X, and X→Y×_{SpecZ[Q]}SpecZ[P] is étale. For log étale use the whole cokernel rather than its torsion part. Log smoothness gives finite locally free Ω¹_log. No saturation hypothesis is inserted.

Target `C5/log-chart-criterion` (theorem). Dependencies: [C5/log-smoothness](#C5-log-smoothness), [C5/log-differentials](#C5-log-differentials).

Prototype: `TauCeti.ComplexComparison.logChartCriterion`.

Proof route: The toric chart model lifts units across square-zero ideals using1+I and the invertible group orders. Log derivations measure the difference between two lifts, giving local freeness and deformation control. Choose logarithmic differential generators and enlarge the chart group; Kato’s group argument and the infinitesimal criterion give the étale chart factorization.

Acceptance: For N→N², 1↦(1,1), the group cokernel is free of rank one and the semistable chart is log smooth. For multiplication by n on N, log étaleness requires n invertible; fine charts are not silently required to be saturated.

Proof references: [KATO89](https://math.uchicago.edu/~drinfeld/p-adic_periods/Kato_log-structures.pdf), Proposition3.4, Theorem3.5 and proof3.13, pp.201–205; Proposition3.10 p.203.

<a id="C5-log-de-rham-complex"></a>

### Logarithmic de Rham complex

For a fine log morphism, Ω^p_log=∧^pΩ¹_log and d extends the universal log derivation by d(dlogp)=0 and the graded Leibniz law. It is a complex of modules over the inverse image of the base structure sheaf, with C-linear differentials in the complex case. In a log-smooth finite-dimensional case its terms are finite locally free and bounded. For an SNC boundary the terms coincide with forms generated by dz_i/z_i and ordinary coordinate differentials.

Target `C5/log-de-rham-complex` (construction). Dependencies: [C5/log-differentials](#C5-log-differentials), [C5/log-chart-criterion](#C5-log-chart-criterion), [C5/algebraic-de-rham-complex](#C5-algebraic-de-rham-complex).

Prototype: `TauCeti.ComplexComparison.logDeRhamComplex`.

Proof route: Take native exterior powers of the universal quotient differential module. Verify d preserves its logarithmic relations and has square zero. Glue by chart independence and identify the SNC coordinate generators.

API:

- `LogDeRham.dlogClosed` (simp): d(dlogp)=0.
- `LogDeRham.d_squared` (simp): Every consecutive differential composes to zero.
- `LogDeRham.SNC` (compatibility): The log complex for M_D is the usual Ω^•_X(logD).

Discriminating tests:

- `LogDeRham.emptyBoundary` (degenerate): For a trivial log boundary this is ordinary de Rham.
- `LogDeRham.coordinate` (computation): On the log line, dz=z dlogz and dlogz is closed.
- `LogDeRham.crossing` (computation): At a two-branch SNC crossing, Ω¹_log is free on dlogx,dlogy and Ω²_log on their wedge.

Uses: C5 Deligne nonproper comparison — Provides its bounded coherent logarithmic complex.; Qian companion Theorem1.8 and Proposition3.6 — Provides absolute and relative log complexes and their boundary triangle..

Acceptance: The named API and the three discriminating tests below hold in the shared carrier, through the specified compatibility maps.

Proof references: [KATO89](https://math.uchicago.edu/~drinfeld/p-adic_periods/Kato_log-structures.pdf), §1.9 p.196 and Proposition3.10 p.203; Qian companion Proposition3.6.

<a id="C5-proper-log-gaga-monodromy"></a>

### Proper logarithmic GAGA and its monodromy triangle

For a proper fine log-smooth complex log scheme X over the standard logpoint (SpecC,N→C,1↦0), canonical analytification compares the relative logarithmic de Rham hypercohomology with its analytic counterpart in every degree. It compares the short exact absolute-to-relative log complex sequence, with first map dlogt wedge, and hence the connecting endomorphism N. This is a de Rham monodromy comparison; no Kato–Nakayama Betti comparison is inferred without its separate topological theorem.

Target `C5/proper-log-gaga-monodromy` (theorem). Dependencies: [C5/log-de-rham-complex](#C5-log-de-rham-complex), [C5/bounded-operator-hypergaga](#C5-bounded-operator-hypergaga), [C5/differential-operator-analytification](#C5-differential-operator-analytification).

Prototype: `TauCeti.ComplexComparison.properLogMonodromyTriangle_distinguished`.

Proof route: The chart quotient formula makes each log form coherent and identifies algebraic and analytic absolute-to-relative sequences. Apply bounded C-linear differential-operator hyper-GAGA under properness. Functoriality for the exact triangle identifies the connecting endomorphism N and its sign from the fixed wedge map.

Acceptance: For identity of the standard logpoint, the relative complex is C in degree0 and N=0. The proof covers proper fine log-smooth schemes without strengthening fine to saturated or projective.

Proof references: [QIAN-COMPANION](https://arxiv.org/pdf/2103.00106v1), Theorem1.8, pp.3–4; Proposition3.6 and proof, pp.18–19.

<a id="C5-closed-current-extension"></a>

### Finite-mass extension of closed positive currents

Let E be a closed complete pluripolar subset of a complex manifold and T a closed positive current on its complement with locally finite mass near E. Its extension by zero across E is a closed positive current. Analytic subsets, in particular singular loci, are admissible E. The finite-mass hypothesis cannot be dropped.

Target `C5/closed-current-extension` (theorem). Dependencies: [C4/remmert-stein-extension](#C4-remmert-stein-extension).

Prototype: `TauCeti.ComplexComparison.closedCurrentExtension`.

Proof route: Choose a plurisubharmonic function with pole locus E and cutoff functions tending to1 away from E. Stokes and Cauchy–Schwarz bound the error terms by a uniformly controlled weighted gradient term times the mass on a shrinking neighbourhood. Finite local mass makes that latter term tend to0; the smooth approximation of the plurisubharmonic function is an explicit analytic supplier input.

Acceptance: The integration current of a complex line extends across a deleted point with finite local mass and remains closed. Multiplicity two doubles the current; a current of infinite boundary mass is outside the theorem.

Proof references: [DEMAILLY](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf), III2.3 (Skoda–El Mir) and proof, pp.138–140.

## Acceptance cases and consumers

**Twists and nilpotent points.** P¹: h⁰O(2)=3, h¹O(−2)=1, O(−1) acyclic; the double point has length2 and a nonzero square-zero endomorphism. Targets: [C1/twist-cohomology](#C1-twist-cohomology), [C2/projective-gaga-equivalence](#C2-projective-gaga-equivalence).

**Elliptic Hodge and isogeny comparison.** For an algebraic elliptic curve over C supplied by EllipticCurves, H⁰(Ω¹) is the one-dimensional invariant-differential space and H¹_Betti(Z) is free of rank2 with alternating polarization. A holomorphic isogeny of proper analytifications algebraizes with its group-law square, finite kernel and degree. This imports the elliptic curve and polarization APIs, not a new uniformization theorem. Targets: [C5/proper-pure-hodge](#C5-proper-pure-hodge), [C4/family-morphism-interface](#C4-family-morphism-interface).

**Logarithmic loop and compact support.** On G_m, Res₀(dz/z)=1 and its positively oriented loop period is2πi. Ω(logD)(−D) gives compact-support cohomology; its image in ordinary H¹ is parabolic cohomology. Targets: [C5/curve-log-complex](#C5-curve-log-complex), [C5/curve-residue-localization](#C5-curve-residue-localization).

**Modular q normalization.** Under the imported ModularCurvesPartII R12.5 Kodaira–Spencer normalization, f(q)(du/u)² maps to f(q)dq/q; q=e^{2πiτ} gives dq/q=2πi dτ. du/u is the relative Tate-curve differential, while dq/q is a base differential. The comparison preserves these factors and does not construct Kodaira–Spencer again. Targets: [C5/multiplicative-period-interface](#C5-multiplicative-period-interface), [C5/relative-de-rham-betti](#C5-relative-de-rham-betti).

**PEL and Baily–Borel fibres.** The proper PEL/Baily–Borel algebraic ambient spaces and their nilpotent coherent ideals use the same analytic carrier as C0. The proper-source morphism comparison preserves graph projections; the nonproper definable Chow step stays with LD.6. Targets: [C0/repair-analytification](#C0-repair-analytification), [C4/family-morphism-interface](#C4-family-morphism-interface).

**Relative Hodge and Qian characters.** A dual-number characteristic-zero base satisfies local freeness and arbitrary base change by Deligne5.5. An invertible-order character idempotent remains a vector-bundle summand. On the identity standard logpoint the relative complex is C in degree0 and the connecting monodromy is0. Targets: [C5/relative-hodge-bundles](#C5-relative-hodge-bundles), [C5/proper-log-gaga-monodromy](#C5-proper-log-gaga-monodromy).

**Integral realization exports.** SF.6 and MC.2 import the algebraic de Rham realization, its rational/integral Betti coefficient maps, products and trace from C5. Torsion is retained in H_Z and killed only by the named coefficient change. Targets: [C5/algebraic-de-rham-complex](#C5-algebraic-de-rham-complex), [C5/multiplicative-period-interface](#C5-multiplicative-period-interface).

## Remaining supplier and proof contracts

Every mathematical target is stated. The following leaves prevent a claim of proof closure; they do not remove the targets or assert implementation.

**Shared analytic-space suppliers need tracked integration.** ComplexComparison PR196 Layers0–2 (head4bd72379658126cbe9be935656396f0c9dac4de0) and AnalyticGeometry PR279 Milestones5–7 (head581f66fed0f12fe49b8f5dd96aa18d3e435c190a) are open proposals. Record their nonreduced quotient, gluing, étale and holomorphic-bundle exports once as tracked suppliers. No accepted stage ID or pinned implementation is invented. Needed by: [C0/repair-analytification](#C0-repair-analytification), [C0/holomorphic-bundle-dictionary](#C0-holomorphic-bundle-dictionary).

**Cartan–Remmert analytic dimension-locus proof.** PS08 Lemma8.2 redirects analyticity to Whitney, Complex Analytic Varieties, Theorem9F p.240. That book is neither freely supplied nor cleared in the maintainer library. Demailly II8.2 proves semicontinuity, which does not by itself prove analyticity. The exact analytic-locus proof still needs a cleared source or another public proof. Needed by: [C0/fiber-dimension-loci](#C0-fiber-dimension-loci).

**Current sheaf-module and smooth-form plans are outside the atlas snapshot.** Reuse AlgebraicVectorBundles L0A–L0C and DifferentialGeometry L5–L9 on current main f9e4a9026b04c282878900edaada0a3f3eb3c82a. Their general monoidal/sheaf-Hom and smooth integration/de Rham carriers are not in the pinned library or atlas stage index. Encode the existing suppliers; do not make a second construction here. Needed by: [C0/coherent-operations](#C0-coherent-operations), [C5/multiplicative-period-interface](#C5-multiplicative-period-interface), [C5/hodge-star](#C5-hodge-star), [C5/analytic-cycle-integration](#C5-analytic-cycle-integration).

**Analytic exhaustion, Chern connection and compact-map interfaces.** The weighted Cartan proof needs Stein recognition/strictly plurisubharmonic exhaustion and Hermitian holomorphic bundle Chern connection/curvature; Skoda–El Mir uses smooth plurisubharmonic approximation. The compact coherent finiteness proof uses Montel and Schwartz’s compact-map cohomology theorem. Request these analytic or OperatorTheory PartII interfaces, with their complete-metric/domain hypotheses, rather than infer them from Hilbert spectral theory. Needed by: [C1/bochner-kodaira](#C1-bochner-kodaira), [C1/stein-coherent-acyclicity](#C1-stein-coherent-acyclicity), [C1/compact-coherent-finiteness](#C1-compact-coherent-finiteness), [C5/closed-current-extension](#C5-closed-current-extension).

**Proper algebraic-space derived reconstruction.** SF.2 currently supplies scheme D_QCoh and a proper pushforward right adjoint. It does not supply the right adjoint to QCoh inclusion or Hall’s space-level perfect support-approximation theorem. The SF.2 request gives the exact missing contract; these are different adjoints. Needed by: [C3/closed-point-reconstruction](#C3-closed-point-reconstruction).

**Relative algebraic-space comparison proof.** Hall Theorem9.1 establishes absolute proper GAGA. Applying it over a nonproper base does not prove relative higher-image comparison. Complete the relative analytic coherent-finiteness and derived comparison over Stein neighbourhoods, with étale descent and the named exchange map. The statement is recorded as a target whose relative proof route needs verification. Needed by: [C3/proper-algebraic-space-gaga](#C3-proper-algebraic-space-gaga).

**Noetherian compactification supplier leaf.** The SF.2 coherent-duality packet explicitly leaves Noetherian Nagata compactification open. Supply its separated finite-type version before the proper-support extension and separated-target graph proof. A curve completion or Chow lemma does not replace it. Needed by: [C4/proper-support-algebraization](#C4-proper-support-algebraization).

**Compact bundle elliptic estimates.** PDE D16 is a scalar Euclidean estimate. Demailly VI2.2–2.3 states Rellich/Gårding and refers out for proofs. The PDE PartII contract must prove the compact bundle system version before Green operators and geometric Hodge theory close. Needed by: [C5/compact-elliptic-hodge](#C5-compact-elliptic-hodge).

**Ehresmann and finite-CW supplier interfaces.** Tom Dieck §2.2 pp.52–53 supplies a public proof of proper-submersion local triviality, but DifferentialGeometry current main has no Ehresmann target. Request DifferentialGeometry PartII with that theorem and its native manifold hypotheses; request the compact fibre finite-CW theorem from AlgebraicTopology for finite rank. Needed by: [C5/relative-betti-local-system](#C5-relative-betti-local-system).

Exact supplier requests:

- `AlgebraicModuliForArithmeticGeometry:R09.1`: Algebraic O(k) on projective space with all-degree monomial cohomology, finite cohomological dimension, relative Serre generation/vanishing and finite twist presentations. Projective cycle degrees, divisor intersection multiplicities, and their Segre pullback formulas are the algebraic half of the Chern/integration normalization.
- `AlgebraicModuliForArithmeticGeometry:R09.2`: Relative Noetherian Chow modification and coherent support dévissage for a proper finite-type complex map; characteristic-zero resolution of a Chow modification when a smooth projective source is required for pure Hodge theory. Keep nonprojective and nonreduced hypotheses explicit.
- `AlgebraicModuliForArithmeticGeometry:R09.3`: Effective étale coherent descent on the presentation groupoid of finite-type algebraic spaces, and the algebraic Hom/Isom representability contract in its stated projective-family scope. This does not assert GAGA for the nonproper presentation charts.
- `SchemeAndStackFoundations:SF.1`: Effective ringed-module descent and finite-type scheme/algebraic-space sites; Noetherian completion flatness and the completed-map criterion; Jacobson closed-point detection for coherent supports; finite/quasi-finite reflection for the graph argument. Where not already supplied, extend the foundational prefix rather than borrow a higher-tier comparison.
- `SchemeAndStackFoundations:SF.2`: Native derived sheaf-module exchange maps, bounded hypercohomology and triangle compatibility. Extend the scheme-only D_QCoh nodes to proper algebraic spaces with the QCoh-inclusion right adjoint/quasi-coherator, perfect support approximation (Hall Theorems3.8,5.5), bounded-coherent preservation and residue testing. Also supply Noetherian separated finite-type compactification in the coherent-duality direction; the compactification leaf is not a proved Nagata theorem.
- `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-12-the-dictionary--function-fields--curves-and-the-comparison-contracts`: The existing unique smooth projective function-field model and complex Riemann-surface dictionary of Layers12B–12C, with the supplied open immersion from the affine curve. C4 only adds the finite boundary and connectedness comparison.
- `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-6-extensions-of-function-fields`: The existing valuation/local-ring and holomorphy-ring dictionary for the open immersion into the projective curve model; no second normalization or rational-map-extension theorem.
- `tauceti:TauCetiRoadmap/AlgebraicTopology#stage-6-cohomology-products-and-manifold-duality`: Singular chains/cochains for arbitrary abelian groups, coefficient/pullback maps, subdivision and prism homotopies, products and trace. Include compact smooth finite-CW/triangulation and universal coefficients for the integral lattice, and degree-one modification trace/pullback compatibility for pure Hodge transport.
- `tauceti:TauCetiRoadmap/JacobianChallenge#layer-c-relative-coherent-cohomology-and-base-change`: Relative proper coherent direct-image finiteness, projection and cohomology/base-change with the stated flatness and fibre hypotheses; extend the curve interface to the higher-dimensional proper maps required by GAGA rather than assert arbitrary individual R^q base change.
- `tauceti:TauCetiRoadmap/PDE#milestone-d-16`: PDE PartII: bundle-valued strongly elliptic operators on compact manifolds without boundary, global Sobolev regularity and Gårding estimate, Rellich compactness, Fredholm closed range, finite smooth kernel and inverse on the orthogonal complement. Current D16 is scalar Euclidean Gårding; it is a starting point, not this full result.
- `tauceti:TauCetiRoadmap/StableReduction#layer-2-coherent-curve-theory-duality-and-positivity`: Import its coherent algebraic cohomology, projective twists and curve duality in their precise scope. General all-degree projective/relative proper inputs are requested from R09 and JacobianChallenge; curve duality alone is insufficient.

## Source corrections

**E1 — DELIGNE70, II1.23–1.24 and the proof of II4.1, in LNM163(1970).** The original route uses the two results withdrawn by the author in the proof of the regularity criterion. Use the 1971 replacement proof of II4.1: resolve the boundary, obtain a uniform pole bound by the Baire argument, then extend across codimension two. Do not rely on the withdrawn results or a circular appeal to II5.9. The author explicitly deletes II1.23–1.24 and replaces the proof of II4.1. Correction search: Deligne, Erratum to SLN163(1971), all three pages.

**E2 — DEMAILLY, VIII2.4, p.366, author CADG PDF.** The cutoff is decreasing from1 to0, while its derivative is bounded between0 and2. For the indicated decreasing cutoff use −2≤ρ′≤0, or state |ρ′|≤2. A differentiable function with nonnegative derivative cannot decrease from1 to0. The subsequent norm estimate needs only the absolute bound. Correction search: No separate correction located on the author’s document page; scoped to this author PDF.

**E3 — DEMAILLY, VI11.3 and proof, pp.322–323, author CADG PDF.** The dimension argument for E1 degeneration is used to assert a canonical direct-sum decomposition on a general compact complex manifold. That argument identifies the associated graded and dimensions. A canonical geometric splitting needs opposed filtrations or another proved splitting construction; this plan proves it using compact Kähler harmonic theory and proper algebraic transport. A two-step filtered C² admits automorphisms e₂↦e₂+a e₁ inducing identity on its graded pieces. Dimensions and graded pieces alone therefore do not give a functorial splitting. Correction search: No separate correction located on the author’s document page; scoped to the printed argument.

**E4 — DEMAILLY, VII1.1–1.2 and proofs, pp.329–330, author CADG PDF.** The normal-frame reference retains a V12 placeholder, and the cited VI10 references do not locate the required commutator and graded-Jacobi identities. Use V12.10 for normal Chern frames, VI6.8 for the Hermitian commutators and VI5.7 for graded Jacobi. Those are the numbered statements actually used in the local-frame and commutator computation. Correction search: No separate correction located on the author’s document page; scoped to this author PDF.

## Source editions

These locators refer to the editions actually read. PDF page numbers are one-based; printed page numbers are identified separately where they differ. Unread redirects are the explicit gaps above. No source text is reproduced.

- [DEMAILLY — Complex Analytic and Differential Geometry](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf). Jean-Pierre Demailly. Public version read 2026-10-09. Read 2026-10-09. Selected proof locations: II §§2–3, pp.79–90: convergence, Weierstrass and Oka proofs; II §§8–9, pp.116–124: local dimension, extension, proper images and nonreduced sheaves; VI §§1–3, pp.287–295; §§6–8, pp.306–311; §11, pp.322–323: Hodge operators and Kähler decomposition; VIII §§1–5, pp.363–372: closed operators, density and weighted estimates; IX §4, pp.419–428: coherent acyclicity and compact cohomology; III §§1–2 and V §§13–15: positivity, analytic integration and Chern classes; VII1.1–1.3, pp.329–331: Chern commutators and Bochner–Kodaira; III1.7–1.12 pp.130–132; III2.3–2.7 pp.138–140; V12.10 p.270; V13.2–13.9 pp.271–273; V15.8–15.12 pp.279–281.
- [SERRE-GAGA — Géométrie algébrique et géométrie analytique](https://www.numdam.org/item/AIF_1956__6__1_0.pdf). Jean-Pierre Serre. Public version read 2026-10-09. Read 2026-10-09. Selected proof locations: §§10–13, Theorems 1–3, pp.19–25: projective GAGA; §8, Propositions8–9 and proofs, printedpp.13–15, PDF14–16: algebraic graphs and the local-ring intersection argument.
- [SGA1-XII — SGA 1, Exposé XII: Géométrie algébrique et géométrie analytique](https://arxiv.org/pdf/math/0206203v2). Alexander Grothendieck and Michèle Raynaud. Revised public edition, arXiv:math/0206203v2; modern page numbering. Read 2026-10-09. Selected proof locations: XII 1.1–1.3, printed pp.239–241, PDF255–257; XII 4.1–4.5, printed pp.247–251, PDF263–267: relative proper comparison and coherent equivalence.
- [CARTAN18 — Séminaire Henri Cartan 1953–1954, Exposé 18](https://www.numdam.org/item/SHC_1953-1954__6__A18_0.pdf). Henri Cartan. Public version read 2026-10-09. Read 2026-10-09. Selected proof locations: §§1–6, pp.18-1–18-10: Dolbeault, Laurent expansions and projective twists.
- [CARTAN19 — Séminaire Henri Cartan 1953–1954, Exposé 19](https://www.numdam.org/item/SHC_1953-1954__6__A19_0.pdf). Henri Cartan. Public version read 2026-10-09. Read 2026-10-09. Selected proof locations: §§8–10, pp.19-1–19-7: independent analytic generation/vanishing and coherent-ideal Chow.
- [GROTH1966 — On the de Rham cohomology of algebraic varieties](https://www.numdam.org/article/PMIHES_1966__29__95_0.pdf). Alexander Grothendieck. Public version read 2026-10-09. Read 2026-10-09. Selected proof locations: Theorems 1, 1′ and 2, printed pp.95–97; proper comparison argument p.96.
- [SELLA — Comparison of sheaf cohomology and singular cohomology](https://arxiv.org/pdf/1602.06674v3). Yehonatan Sella. arXiv:1602.06674v3. Read 2026-10-09. Selected proof locations: Entire paper, pp.1–19: Lemma0.1, Example0.3, nesting construction, Steps1–3.
- [DELIGNE1968 — Théorème de Lefschetz et critères de dégénérescence de suites spectrales](https://www.numdam.org/item/PMIHES_1968__35__107_0.pdf). Pierre Deligne. Public version read 2026-10-09. Read 2026-10-09. Selected proof locations: §4, Proposition4.3; §5, Theorems5.3 and5.5, printed pp.120–125, PDF15–20.
- [DELIGNE70 — Équations différentielles à points singuliers réguliers](https://publications.ias.edu/sites/default/files/Number9.pdf). Pierre Deligne. Lecture Notes in Mathematics163 (1970), with the author’s 1971 erratum. Read 2026-10-09. Selected proof locations: I2.3–2.15, pp.6–11: jets, connections and curvature; I2.17–2.23, pp.14–17: relative Poincaré proof; II5.1–5.9, pp.91–98: canonical extension and regular connections; II6.2–6.10, pp.98–105: operator complexes and Laurent contraction; II7.4–7.9 and proofs, pp.114–120: Gauss–Manin and regularity;7.8 refers integrability to Katz–Oda.
- [DELIGNE-ERRATUM — Erratum to SLN163](https://publications.ias.edu/sites/default/files/Erratum%20to%20SLN%20163.pdf). Pierre Deligne. 1971 author erratum. Read 2026-10-09. Selected proof locations: All three pages: deletion of II1.23–1.24 and replacement proof of II4.1.
- [HALL — GAGA theorems](https://bpb-ap-se2.wpmucdn.com/blogs.unimelb.edu.au/dist/5/501/files/2021/05/get.pdf). Jack Hall. Public version read 2026-10-09. Read 2026-10-09. Selected proof locations: §§3–5, pp.7–14: coherent complexes, adjoint and support detectors; §§7–9, pp.18–21: conservativity and proper algebraic-space reconstruction.
- [PS08 — Complex analytic geometry in a nonstandard setting](https://math.haifa.ac.il/kobi/Newton.pdf). Ya’acov Peterzil and Sergei Starchenko. Public version read 2026-10-09. Read 2026-10-09. Selected proof locations: Theorems7.1–7.4 and Lemma8.2, author-PDF pp.21–23: dimension and image loci; proof redirect to Whitney9F is recorded separately.
- [KATO89 — Logarithmic structures of Fontaine–Illusie](https://math.uchicago.edu/~drinfeld/p-adic_periods/Kato_log-structures.pdf). Kazuya Kato. Algebraic Analysis, Geometry, and Number Theory (1989), pp.191–224; public scanned article. Read 2026-10-09. Selected proof locations: §§1–3, printedpp.192–205, PDF2–16: logification, charts, log differentials, lifting and the proof3.13 of the chart criterion.
- [QIAN-COMPANION — Ordinarity of local Galois representation arising from Dwork motives](https://arxiv.org/pdf/2103.00106v1). Lie Qian. arXiv:2103.00106v1. Read 2026-10-09. Selected proof locations: Theorem1.8, PDFpp.3–4; Proposition3.6 and its proof, PDFpp.18–19.
- [QIAN23 — Potential automorphy for GL_n](https://par.nsf.gov/purl/10388233). Lie Qian. Public version read 2026-10-09. Read 2026-10-09. Selected proof locations: Relative Hodge bundles, printedp.1264 (PDF26); Lemma3.10(2), printedp.1266 (PDF28).
- [MPT19 — Ax–Schanuel for Shimura varieties](https://arxiv.org/pdf/1711.02189v3). Ngaiming Mok, Jonathan Pila and Jacob Tsimerman. arXiv:1711.02189v3. Read 2026-10-09. Selected proof locations: §3.1, PDFpp.6–7: fibre-dimension loci, proper projection, and the separate definable Chow step.
- [DGH21 — Uniformity in Mordell–Lang for curves](https://arxiv.org/pdf/2001.10276v3). Vesselin Dimitrov, Ziyang Gao and Philipp Habegger. arXiv:2001.10276v3. Read 2026-10-09. Selected proof locations: Proposition4.2 and proof, PDFpp.16–18: analytic integration, semipositive wedge inequality and intersection normalization.
- [CS17 — On the generic part of the cohomology of compact unitary Shimura varieties](https://arxiv.org/pdf/1511.02418). Ana Caraiani and Peter Scholze. Public version read 2026-10-09. Read 2026-10-09. Selected proof locations: §2.3, PDFp.17: regular connections and algebraic horizontal tensors.
- [BKT20 — Tame topology of arithmetic quotients and algebraicity of Hodge loci](https://par.nsf.gov/purl/10200187). Benjamin Bakker, Bruno Klingler and Jacob Tsimerman. Journal of the American Mathematical Society33 (2020). Read 2026-10-09. Selected proof locations: Theorem4.12 and graph argument, printedp.933 (PDF17); Theorem4.13 is definable Chow and stays with LD.6.
- [CURVE-CONTRACT — Algebraic curves: function fields, divisors, and Riemann–Roch](https://github.com/TauCetiProject/TauCetiRoadmap/blob/f9e4a9026b04c282878900edaada0a3f3eb3c82a/TauCetiRoadmap/AlgebraicCurves/README.md). Tau Ceti roadmap maintainers. Public version read 2026-10-09. Read 2026-10-09. Selected proof locations: Layer12B–12C and Layer6: projective models, their maps and holomorphy rings.
- [TOMDIECK — Differential Manifolds](https://www.uni-math.gwdg.de/tammo/GT03.pdf). Tammo tom Dieck. Author notes, preliminary version of January13,2009. Read 2026-10-09. Selected proof locations: §2.2, Theorems2.2.1,2.2.3,2.2.4 and proofs, pp.52–53.
- [KATZODA68 — On the differentiation of de Rham cohomology classes with respect to parameters](https://www.its.caltech.edu/~matilde/GaussManinKatzOda.pdf). Nicholas M. Katz and Tadao Oda. Journal of Mathematics of Kyoto University8(2)(1968),199–213; published article scan hosted by Caltech. Read 2026-10-09. Selected proof locations: §1 pp.199–201, connection, extended differential and curvature; §2 Theorem1 and proof pp.201–204; §3 filtration connecting map and Čech reduction pp.204–206.
