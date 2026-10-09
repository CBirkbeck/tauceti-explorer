# Smooth representations of local groups: spherical theory, integral families, and integral adjointness

This part plans SR.4–SR.6. Its outputs are the classical spherical Satake isomorphism with explicit integral normalizations, the generic integral representation theory of GL_n needed for families, and the excursion-theoretic proof of center finiteness and second adjointness over integral coefficients. The packet is a complete planning pass: all three stages are **planned**, and none is **closed**. Eight gaps and thirteen requests identify where a prerequisite chain ends. Every declaration remains an unchecked proposal.

The distinction between those statuses matters. The final integral adjunction is a theorem over every commutative Z[1/p]-algebra; its present proof route nevertheless needs substantial geometric and integral invariant theory that the pinned libraries do not supply. Recording its hypotheses and intermediate contracts does not construct the Fargues–Scholze action. Likewise, the explicit spherical formulas below do not establish the missing classical flag counts merely by giving them names. The gaps at the end delimit both claims.

## Conventions and the shared foundation

Let F be a nonarchimedean local field, p its residue characteristic, q its residue cardinality, and varpi a chosen uniformizer when a formula uses one. Coefficient residue characteristic is denoted ell, so that ell differs from p. A general coefficient ring A has p invertible whenever a unipotent-coinvariant or integral smooth-category assertion needs that hypothesis. A Noetherian, flat, reduced, or ell-torsion-free assumption is attached to the theorem that needs it; these properties are not silently imposed on every coefficient ring.

A representation means an algebraic homomorphism to A-linear endomorphisms together with the separately stated smoothness condition: each vector has an open stabilizer. Admissibility means that the fixed module for every compact open subgroup is finitely generated over the coefficient ring. It is not a dimension condition over an arbitrary ring. The earlier SR.0 export owns the smooth abelian category and its subobjects; SR.1 owns finite-sum convolution and compact-open Hecke corners; SR.2 owns induction and Jacquet functors; SR.2a owns the independent characteristic-zero second adjunction; SR.3 owns characteristic-zero Bernstein and cuspidal-support theory. This part requests those interfaces and does not plan a second copy of them.

Haar volumes are fixed at the construction that uses them. For hyperspecial K, its characteristic function is the convolution identity with vol(K)=1. In the raw Satake transform, vol(N intersect K)=1. For induction we distinguish unnormalized I_P from normalized i_P=delta_P^(1/2) I_P, and distinguish their Jacquet partners accordingly. A chosen q-half or modulus half is data. Integral formulas that do not require it are retained separately.

For a nonsplit unramified reductive group, the relevant Weyl group is the relative group W_0 of the maximal F-split torus, with the Frobenius action on the pinned dual group retained. Arithmetic Frobenius Fr is used in the discrete Weil relation Fr s Fr^-1=s^q. A consumer using geometric Frobenius must invert the relevant element and adjust its cyclotomic convention. No absolute-Weyl formula is substituted for this relative one.

The exact baselines are Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The declaration statements were read at those commits. Mathlib already defines algebraic representations, ordinary invariant submodules, ordinary coinvariant quotients and the categorical center. Tau Ceti supplies the double-coset degree map and affine group-scheme carrier. Their existence does not imply local reductive decompositions, analytic convolution, Satake, integral Bernstein blocks, or finite-wild parameter schemes. Relevant accepted AUDIT14, AUDIT16 and AUDIT21 rows were read; there is no reviewed coverage row for this roadmap itself, so the packet also records an independent source audit. The arithmetic GL_n polynomial results at ranks one and two are not an all-rank local Satake theorem.

## SR.4: the classical transform and its consumers

The proof starts with Iwasawa and Cartan decomposition, obtained from ReductiveGroupsPartII:RG2.4, rather than geometric Satake. Iwasawa gives the torus quotient and lets the N integral be written as finite sums with powers of q in the denominators. Cartan identifies the dominant relative-coweight basis. The leading Satake term of a double coset determines a triangular change of basis; induction in dominance order proves the isomorphism. This is the coefficient-safe proof: it does not divide by the Weyl-group order. It therefore remains the intended route when ell divides that order. Treumann–Venkatesh's published §7.1–§7.3, pp. 204–208, provides the transform, twisting and invariant-theory framework.

The raw transform S* has twisted relative-Weyl invariants as its image. The twisting factor is the evaluation at q of half the difference between the positive dual-coroot sum and its Weyl translate. That difference is even without choosing a half of the entire sum. Normalized S uses a selected modulus half and has ordinary Weyl invariants as target. A pseudoroot has both a square condition and a twisted-fixed-point condition; the second condition cannot be dropped. Translation by it explains why unnormalized principal-series parameters contain an inverse pseudoroot whereas normalized parameters do not. These conventions are fixed before publishing any eigencharacter comparison.

The c-group statement uses a separate source version. Theorem 7.9 occurs in Treumann–Venkatesh arXiv:1407.2346v1, §§7.8–7.9, pp. 29–31, not in the published §7. The central quotient absorbs a simultaneous change of q-half and makes the characteristic-not-two formulation canonical. The characteristic-two pseudoroot treatment remains separate. A reference to the published article alone would not support this numbered theorem.

For GL_n, the minuscule double coset with r copies of varpi maps to q^(r(n-r)/2) times the r-th elementary symmetric polynomial. The scalar coset is inverted to obtain symmetric Laurent polynomials. The existing ModularForms Hecke algebra remains the multiplication supplier. SR.4 owns the Satake transform and comparison, including its all-n content. Hall–Littlewood expressions then organize the nonminuscule coefficients. Their apparent poles must be canceled universally before specializing to a coefficient ring; evaluating the rational formula at colliding variables is not an integral specialization. In Leslie's unramified quadratic GL_n(E) formula, q denotes the cardinality of the smaller field's residue field, so q_E=q^2 and the Hall–Littlewood parameter is q^-2 (arXiv:1911.07907v3, §3.1, pp. 22–24).

Normalized parabolic descent is an N constant term followed by the prescribed K averaging. The dual-Levi restriction square must commute with Satake and with descent in stages. Leslie's extra xi_(a,b) substitution multiplies the first variable block by q^-b and the second by q^-a; it is an additional twist, not a change in the definition of ordinary descent. The test of M=G forces descent to be the identity, and the test of M=T forces the normalized constant-term convention.

Unitary parameter spaces require care over rings. Define a parameter by a tuple of units paired under reversal, with the odd middle entry equal to one. Its characteristic polynomial satisfies reciprocity. The converse from a reciprocal polynomial to a globally ordered paired tuple is false over general rings, as the concrete product-ring test below shows. Polynomial genericity conditions are consequently defined directly by evaluation and derivative units. Their interpretation as statements about individual roots needs hypotheses preventing collisions; if q^2=1 after reduction, the naive distinct-root wording can identify conditions that the polynomial predicates keep separate. These restrictions implement the existing Liu catalogue findings E5 and E27.

The triangular unitary Satake matrix is expressed using dual GL_N Weyl traces and Gaussian coefficients at -q. The subsequent even and odd formulas are polynomial identities obtained from that matrix and residual hermitian isotropic counts. For a residual space of even dimension 2k, the number of maximal isotropic subspaces is the product of q^(2i-1)+1, for i from 1 to k. In particular its second factor is q^3+1. The even-rank d_bullet coefficients and odd-rank d coefficients are different universal polynomials. Quotients by q+1 in their displayed expressions are simplified over the universal polynomial ring first; the formulas do not require q+1 to be a unit in A. The full category of two parahoric correspondences remains with UnitaryLevelRaisingTypesAndHeckeOperators. Here only their hyperspecial spherical products and images are exported. Liu et al., Appendix B, pp. 331–346, supplies the identities; the classical count refinement remains G-HL-COUNT because its geometric proof cannot be used as an upward prerequisite.

The global inert-unitary application has a further boundary. Conjugate self-duality alone does not imply that a local GL_N Satake tuple belongs to the displayed unitary parameter space. The application in Liu §3.1, pp. 139–142, also uses the central-character condition on the positive ideles of the base field. A downstream global consumer must carry that condition rather than use the local reciprocity identity to manufacture it. This is the restriction behind the existing E28 finding; SR.4 makes no global base-change existence claim.

The GSp_4 spin polynomial keeps the central scalar generator and the similitude. Its roots pair as alpha delta=beta gamma. With Pilloni's q^-3/2 twist, reversing the degree-four polynomial gives Calegari–Geraghty's monic polynomial after the change of names Tx1=T2, Tx2=T1 and Sx=T0. The middle coefficient contains (q^3+q)T0. The spherical comparison belongs here; Iwahori/Klingen computations and global Galois-representation construction remain with their established owners. Pilloni's §5.1.3–§5.1.5, author PDF pp. 21–22, and Calegari–Geraghty Definition 6.7, author PDF pp. 38–39, fix these normalizations.

Derived Satake is a separate coefficient theorem. Venkatesh's Theorem 3.3, pp. 21–26, assumes coefficients Z/ell^r, q congruent to one modulo ell^r, and ell not dividing the Weyl order. Restriction–corestriction kills the off-torus terms and proves multiplicativity. The Iwahori/spherical Morita comparison in Lemmas 4.5 and 4.7, pp. 29–31, applies on the etale locus; it is not asserted at a ramified Weyl orbit. The chosen right convolution action gives an anti-isomorphism. Finally the integral Iwahori quadratic relation is (T_s+1)(T_s-q_s)=0. A positive braid monoid is the integral presentation; the braid group requires the parameters to be invertible. Both distinctions are carried through the Clozel–Thorne comparison.

## SR.5: generic integral families

Whittaker coinvariants are a concrete quotient by rho(u)v-psi(u)v. Untwisting the representation by the unit-valued inverse character lets this construction reuse Mathlib's ordinary coinvariants. The quotient universal property and arbitrary-module tensor compatibility are the first API contracts. Mirabolic Phi and Psi functors then provide fixed-order derivatives D^r=Psi^- (Phi^-)^(r-1), with D^0 the identity. The induction partners and their adjunctions are kept distinct. Exactness follows from compact pro-p character projectors and filtered colimits when p is a unit; tensoring need not be flat. Emerton–Helm §3.1, pp. 12–17, also distinguishes descent of a functor from descent of a chosen quotient map.

The canonical iterated mirabolic map embeds the Schwartz submodule into V. Its top derivative is unchanged, and its mirabolic endomorphisms are the coefficient endomorphisms of that derivative. These facts explain both scalarity of co-Whittaker endomorphisms and the arbitrary-module tensor result. Nakamura Proposition B.10, pp. 274–275, proves the latter for GL_2(Q_l) with coefficient residue characteristic p different from l in that source's notation. The general GL_n extension is a planned use of the same Schwartz argument, not a theorem attributed to that proposition.

Essentially AIG is a field-fiber condition with three independent requirements: an absolutely irreducible generic socle, a nongeneric quotient, and exhaustion by finite-length subrepresentations. Absolute simplicity is tested after every field extension. An endomorphism ring equal to the base field alone does not define it. A co-Whittaker A-module additionally has admissible invariants, a free rank-one top derivative, and essentially AIG smooth duals at **every** prime fiber. Minimal-prime information is used downstream in a reconstruction theorem; it does not replace the definition's all-prime quantifier.

The integral Bernstein center is built by inertial blocks and type projective envelopes. A block's universal Whittaker projective has endomorphism ring the block center and a free rank-one derivative. Helm's integral center article, arXiv:1201.1874v3, Theorems 11.8, 11.17, 12.8 and 12.9, gives the relevant structure and saturation route. The finite-group envelope and modular multisegment inputs of its §§4–10 are explicitly unfinished refinement G-MODULAR-TYPES. Helm arXiv:1210.1789v1, Theorem 6.3, yields universal domination by the base-changed block projective. Domination is a quotient statement; two dominated modules need not be isomorphic. Reduced-family reconstruction uses compatible generic fibers and an image in their product.

Helm's Theorem 7.8 in that 2012 version assumes Conjecture 7.4. An unconditional local-Langlands family export must use the downstream interpolation work and its prerequisites, recorded as G-INTERPOLATION. The reader does not promote the conjecture to a theorem. For compact-open invariants there is always a natural tensor comparison map, but it is not an isomorphism under arbitrary nonflat coefficient change. Valid pro-p averaging, or suitable projectivity, supplies sufficient conditions. Ordinary smooth scalar duals have their own finite-projectivity hypotheses; they are not the injective-cogenerator duals of SR.6.

Emerton–Helm Theorem 3.2.13, pp. 21–22, gives Ext orthogonality for different exact supercuspidal supports, not merely different inertial classes. The distinct residual-Frobenius block of Calegari–Geraghty §9.4.1 has still more specific hypotheses. Its ordered-character deformation category includes the finite ell-primary quotient of residue-field units as well as formal unramified variables. The stabilized Q(V)^(n!) projector isolates a chosen residual root. Theorem 9.16, PDF pp. 126–127, compares all right derived invariants; its proof uses enough injectives and finite-reductive-group acyclicity, beyond the degree-zero diagonal calculation. Characteristic-zero highest derivatives from Atobe–Kondo–Yasuda §2.3, p. 8, are a convention adapter and cannot be confused with iterating a fixed D^r.

The essential-vector export remains deliberately precise about what is missing. A rank-one derivative does not supply a canonical vector at a prescribed compact level. A general integral-family theorem needs a source and its torsion, level and coefficient hypotheses. The accepted RS-21 ownership keeps the GL_2 field newvector theorem in R16.2 and the Fouquet–Wan minimal-lift line in AutomorphicCongruences:L3. SR.5 retains only the general integral GL_n contract, with gap G-ESSENTIAL.

## SR.6: the integral excursion route

This stage starts with crossed cocycles and a finite-wild discrete Weil presentation. For each permitted wild kernel, construct one affine relation scheme over Z[1/p]; every Z_ell model is its base change. Finite presentation is obtained from finitely many generator values in the pinned dual group and their relation equations. The relative fiber dimension and total dimension over the integral base are distinct. Flatness, local complete intersection and derived cotangent theory are not being asserted merely from the closed-relation construction. DHKM parameters arXiv:2009.06708v3, §1.2 and §2, pp. 4–6 and 10–12, fixes this common integral object. Its Theorem 4.1(ii) and Corollary 4.2, pp. 29–30, supply the ell-adic extension comparison. An ell-adic comparison of choices does not canonically identify all discrete models over Z[1/p].

DHKM finiteness, arXiv:2203.04929v2, §2, pp. 5–10, reduces the Frobenius quotient to finitely many wild-centralizer strata. In the tame torus calculation the map n Fr-q is an isogeny: eigenvalues of the finite-order part have absolute value one whereas q is greater than one. The maximal fixed subtorus is used, rather than the entire potentially disconnected fixed subgroup. Integral twisted-component quotient finiteness then transfers the torus calculation to reductive groups. Closed-orbit and integral Chevalley–Steinberg refinements remain G-INTEGRAL-GIT; a field-only orbit classification cannot replace them.

The excursion algebra is the colimit of invariant cocycle-coordinate rings along free-group presentations. Matrix-coefficient data is a convenient generator presentation, but it does not itself define a geometric action. Fargues–Scholze VIII.3, pp. 285–290, separates the universal-homeomorphism comparison, the rational isomorphism, and the stronger integral invariant theorem with a dual-fundamental-group good-prime condition. DHKM's reduced-algebra finiteness works without imposing that stronger condition. Torsion-free cuspidal lattices kill the nilpotent ell-torsion before using that reduced algebra.

The actual finite-set Hecke action on the lisse derived category of Bun_G is an indispensable construction. It must carry the Weil descent, fusion and uniform finite-wild bound, so that creation, Weil action and annihilation define central operators satisfying the excursion relations. Fargues–Scholze VIII.4 and IX.5, pp. 291–296 and 327–328, give that construction and its central action. Their torus and adjoint-map comparisons, IX.6, pp. 330–333, identify the split connected central-character action. Their parabolic comparison, IX.7, pp. 335–338, uses a constant-term argument on sufficiently unstable strata; the normalized modulus half cancels the ratio of cyclotomic twists. The complete geometric bootstrap is gap G-GEOMETRIC-ACTION, not an assumed action axiom in Lean.

Current worker-tier rules require these minimum inputs to be owned here even though the older campaign text imported LP1/LP2 and ES1/ES6/ES7. The higher parameter-stack and spectral-action plans become consumers of the exact nodes below. Their broader enhanced, derived-stack and spectral-action targets remain with them. The handoff gives the redirect map; no other roadmap file is edited in this job.

For a finitely generated smooth representation V, Z-finiteness concerns the **image** Z_V of the categorical center in its equivariant endomorphisms. That image must be a finite-type R-algebra, and each V^K must be finite over it. Bounded-depth projective generators reduce this assertion to compact-open Hecke corners. DHKM §3, pp. 11–14, embeds suitable projectives in finite sums of induced torsion-free cuspidal lattices; the torus comparison and finite reductive restriction then give the needed central module finiteness. Dat's integral depth generators remain G-DEPTH. The resulting finite-over-center theorem assumes a Noetherian Z_ell-algebra. The parabolic center map over Z[1/p] has its separate Noetherian flat hypothesis.

Finally a positive contracting Hecke operator splits compact-open invariants into a nilpotent summand and an invertible summand identified with Jacquet invariants. Center finiteness controls the ell-adic generators; a characteristic-zero comparison gives the uniform nilpotence bound. Smooth duals into Q_ell/Z_ell provide injective cogenerators, and products across ell handle the Z[1/p] category. The duality R_P(V^vee)=(R_oppositeP V)^vee is about this cogenerator dual. Passing through its resolutions proves I_P left adjoint to delta_P R_oppositeP over every commutative Z[1/p]-algebra, with the unit, counit and both triangle identities. Neither Noetherianity nor an ell-adic algebra structure remains in that final statement. The Noetherian consequences are then stated separately. DHKM Corollary 1.3 and §4.2, pp. 2 and 15–16, is the source of this final passage.

## Declaration plan and acceptance contracts

The following entries are organized by the mathematical targets of this roadmap, not by the sections of any source. Node identifiers match the packet. API and test names are proposed contributor-facing names. The full statements below are definitive; the narrower executable adapters and unelaborated comment contracts are distinguished in the signature table after this plan.

### SR.4 declarations

<a id="satake-transform"></a>

#### Integral and normalized Satake transforms

`SmoothRepresentationsOfLocalGroups:SR.4/satake-transform` · construction. Proposed name: `SRPlan.satakeTransform`.

For an unramified connected reductive F-group, hyperspecial K, minimal P=TN and cocharacter lattice Lambda=T(F)/T(F)^0, define S*(f)(t)=integral_N f(tn) with vol(N intersect K)=1. It has finite support on Lambda and takes values over Z[q^-1]. With a chosen q-half in the coefficient ring, S=delta_P^(1/2) S*. The domain uses vol(K)=1 and the existing finite double-coset convolution.

Additional hypotheses: p is invertible in the coefficient ring; q is the residue cardinality.

Proof route. 1. Identify T(F)/T(F)^0 with the relative cocharacter lattice using Iwasawa decomposition. 2. Express the N integral as finite coset sums with volumes powers of q; prove independence of subdivisions and compact support. 3. Use N T decomposition and Fubini on finite sums to prove multiplicativity; isolate the modulus factor rather than choosing it silently.

Inputs: `SmoothRepresentationsOfLocalGroups:SR.1`, `ReductiveGroupsPartII:RG2.4`, `tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra`, `mathlib:HeckeCosetModule`, `mathlib:Finsupp.linearCombination`.

Source: [D. Treumann; A. Venkatesh](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p04-p.pdf), §7.1–7.2, pp. 204–206.

Uses. SR.4 spherical eigencharacters: Translate convolution characters to torus characters. GeometricSatakeAndFusion:GS4: Supply the classical transform for a downstream trace comparison.

API contracts:

- `SRPlan.satakeTransform.support` (characterisation): S* has finite lattice support.
- `SRPlan.satakeTransform.coefficient` (data): The coefficient at t is the N integral with N intersect K of volume one.
- `SRPlan.satakeTransform.baseChange` (compatibility): S* commutes with scalar extension whenever q remains a unit.

Definition tests:

- `SRPlan.satakeTransform.torus` (degenerate): If N=1 and K=T(F)^0, S* is the identity.
- `SRPlan.satakeTransform.unit` (computation): The characteristic function of K maps to the identity lattice monomial.
- `SRPlan.satakeTransform.gl2` (computation): For GL_2, normalized S([K diag(varpi,1) K])=q^(1/2)(X_1+X_2).

Acceptance. For a torus N=1, the transform is the identity on the group algebra. An arbitrary coefficient change with q invertible commutes with S*.

Atlas planet: **Satake transform**.


<a id="twisted-weyl-invariance"></a>

#### The twisted relative Weyl action

`SmoothRepresentationsOfLocalGroups:SR.4/twisted-weyl-invariance` · theorem. Proposed name: `SRPlan.twistedWeylInvariance`.

Let W0=N_G(A)/Z_G(A) for the maximal F-split torus A and let Sigma* be the sum of positive dual coroots. S* lands in functions invariant for w*a=w(a)((Sigma*-w Sigma*)/2)(q). The difference is even, so this action is integral without a square root of q. Normalized S lands in the ordinary W0 invariants.

Proof route. 1. Reduce simple relative reflections to the folded rank-one A1 and A2 cases. 2. Compute the rank-one integration and its modulus; verify the twisting cocycle under multiplication in W0. 3. Use the positive-root sum to express the twist integrally.

Inputs: [satake-transform](#satake-transform), `ReductiveGroupsPartII:RG2.1`, `ReductiveGroupsPartII:RG2.5`.

Source: [D. Treumann; A. Venkatesh](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p04-p.pdf), §7.2, pp. 205–206.

Acceptance. Keep W0 and the Frobenius action; the absolute Weyl group is incorrect for a nonsplit group.


<a id="satake-isomorphism"></a>

#### Classical Satake isomorphism

`SmoothRepresentationsOfLocalGroups:SR.4/satake-isomorphism` · theorem. Proposed name: `SRPlan.satakeIsomorphism`.

Over Z[q^-1], S* identifies the spherical Hecke algebra with the twisted W0-invariant lattice algebra. After adjoining a specified q-half, S identifies it with ordinary W0 invariants. Coefficient versions use the integral triangular orbit-sum basis, including when the coefficient characteristic divides the order of W0.

Proof route. 1. Use Cartan decomposition to index double-coset basis vectors by dominant relative coweights. 2. Compute the leading term of S* and show all other terms are strictly lower in dominance order. 3. Construct twisted orbit sums with the same unit leading coefficients, and induct to prove both injectivity and surjectivity.

Inputs: [satake-transform](#satake-transform), [twisted-weyl-invariance](#twisted-weyl-invariance), `ReductiveGroupsPartII:RG2.4`.

Source: [D. Treumann; A. Venkatesh](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p04-p.pdf), §7.2, pp. 205–206.

Acceptance. No averaging over W0 is used. GL_1 gives the Laurent group algebra and GL_2 gives the expected two elementary symmetric generators with the central one inverted.

Atlas planet: **Satake isomorphism**.


<a id="torus-character-dictionary"></a>

#### Unramified torus characters

`SmoothRepresentationsOfLocalGroups:SR.4/torus-character-dictionary` · theorem. Proposed name: `SRPlan.torusCharacterDictionary`.

Over an algebraically closed field with p invertible, unramified characters of T(F) are points of the Frobenius-coinvariant dual torus. This is the character-lattice dictionary, including nonsplit unramified tori.

Proof route. 1. Identify unramified characters with homomorphisms Lambda to coefficient units. 2. Use the dual torus character lattice and Frobenius coinvariants to obtain the point bijection.

Inputs: `ReductiveGroupsPartII:RG2.5`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`.

Source: [D. Treumann; A. Venkatesh](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p04-p.pdf), §7.1, p. 204.

Acceptance. For split G_m the value on varpi is an arbitrary nonzero scalar.


<a id="frobenius-component-invariants"></a>

#### Twisted conjugation on the Frobenius component

`SmoothRepresentationsOfLocalGroups:SR.4/frobenius-component-invariants` · theorem. Proposed name: `SRPlan.frobeniusComponentInvariants`.

Restriction from the dual group Frobenius component H semidirect Fr to the dual torus identifies conjugation-invariant regular functions with W0-invariant regular functions on the relative dual torus, over the fields and integral forms of TV §7.3. Closed conjugacy orbits are semisimple unramified parameters.

Proof route. 1. Construct the restricted Weyl action using Frobenius-fixed normalizer representatives. 2. Show the torus-conjugation map is dominant via its tangent map. 3. Use traces of Weyl modules and dominance-triangularity, rather than irreducible character independence in small characteristic.

Inputs: [torus-character-dictionary](#torus-character-dictionary), `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, `ReductiveGroupsPartII:RG2.5`.

Source: [D. Treumann; A. Venkatesh](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p04-p.pdf), §7.3, pp. 206–208.

Acceptance. A Weyl module trace argument survives small coefficient characteristic.


<a id="pseudoroot"></a>

#### Local pseudoroots

`SmoothRepresentationsOfLocalGroups:SR.4/pseudoroot` · definition. Proposed name: `SRPlan.Pseudoroot`.

A local pseudoroot is an element a0 of the dual torus with a0 squared equal to Sigma*(q), fixed by the twisted W0 action. Multiplication by a0 converts the twisted parameter action to the ordinary one. Choosing a square root of q constructs a pseudoroot; an even Sigma* gives a canonical one.

Proof route. 1. Define the square and fixed-point conditions together. 2. Evaluate the half-coroot sum after adjoining q-half and verify both conditions.

Inputs: [twisted-weyl-invariance](#twisted-weyl-invariance).

Source: [D. Treumann; A. Venkatesh](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p04-p.pdf), §7.4, pp. 208–209.

Uses. TV Proposition in §7.5: Correct the unnormalized induction parameter.

API contracts:

- `SRPlan.Pseudoroot.square` (projection): a0 squared equals Sigma*(q).
- `SRPlan.Pseudoroot.fixed` (projection): Every twisted relative Weyl element fixes a0.
- `SRPlan.Pseudoroot.translate` (compatibility): Translation by a0 identifies twisted and ordinary Weyl orbits.

Definition tests:

- `SRPlan.Pseudoroot.even` (characterisation): If Sigma*=2 eta with eta invariant as required, eta(q) is a pseudoroot.
- `SRPlan.Pseudoroot.trivial` (degenerate): For a torus Sigma*=0, the identity is a pseudoroot.
- `SRPlan.Pseudoroot.characteristicTwo` (computation): In characteristic two, the construction in TV gives the identity pseudoroot.

Atlas planet: **Local pseudoroot**.


<a id="spherical-parameter"></a>

#### Spherical eigencharacters and parameters

`SmoothRepresentationsOfLocalGroups:SR.4/spherical-parameter` · theorem. Proposed name: `SRPlan.sphericalParameter`.

For an algebraically closed coefficient field of characteristic different from p, a spherical Hecke character determines a semisimple unramified parameter. The K-fixed line in unnormalized Ind_P^G(theta) has character f mapped to theta(S*f) and parameter t_theta a0^-1 semidirect Fr; normalized induction has parameter t_chi semidirect Fr.

Proof route. 1. Choose the spherical vector with value one on K. 2. Compute convolution at the identity using Iwasawa decomposition and compare the S* pairing. 3. Apply the torus dictionary and translate by the chosen pseudoroot.

Inputs: [satake-isomorphism](#satake-isomorphism), [pseudoroot](#pseudoroot), [frobenius-component-invariants](#frobenius-component-invariants), `SmoothRepresentationsOfLocalGroups:SR.2`.

Source: [D. Treumann; A. Venkatesh](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p04-p.pdf), §7.5, pp. 209–211.

Acceptance. Changing q-half changes a0 and the unnormalized formula compatibly. State the one-dimensional principal-series K-fixed line, without claiming all modules have one-dimensional invariants.


<a id="c-group-formulation"></a>

#### Canonical c-group Satake formulation

`SmoothRepresentationsOfLocalGroups:SR.4/c-group-formulation` · theorem. Proposed name: `SRPlan.cGroupFormulation`.

In the earlier TV formulation and coefficient characteristic different from two, the c-group is (L-group times G_m)/the central order-two subgroup generated by (Sigma*(-1),-1). Its Frobenius fiber at the local cyclotomic value gives a canonical Satake invariant algebra, independent of q-half. The characteristic-two case retains the preceding pseudoroot formulation.

Proof route. 1. Construct the central quotient and the squared G_m projection. 2. Compare its Frobenius fiber to the dual group component using a temporary square root. 3. Changing the square root multiplies both factors by the central order-two element and leaves the quotient identification unchanged.

Inputs: [spherical-parameter](#spherical-parameter), `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components`.

Source: [D. Treumann; A. Venkatesh](https://arxiv.org/pdf/1407.2346v1), §§7.8–7.9, Theorem 7.9, pp. 29–31.

Acceptance. Theorem 7.9 is cited to arXiv v1, since it is absent from the published §7.


<a id="gln-generators"></a>

#### Explicit GL_n spherical generators

`SmoothRepresentationsOfLocalGroups:SR.4/gln-generators` · theorem. Proposed name: `SRPlan.glnGenerators`.

For GL_n(F), S([K diag(varpi repeated r,1 repeated n-r) K])=q^(r(n-r)/2) e_r(X_1,...,X_n). The scalar coset is invertible, and the target is the symmetric Laurent polynomial ring. Reuse the existing arithmetic GL_n Hecke algebra and central-coset localization comparison, rather than defining another multiplication.

Proof route. 1. Count rank-r residual quotients in the minuscule double coset and compute the delta-half factor. 2. Identify the dominant monomials and apply symmetric polynomial generation. 3. Compare the integral arithmetic generators with their local images and invert the central coset.

Inputs: [satake-isomorphism](#satake-isomorphism), `tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra`, `tauceti:LeftCosetModule.deg`.

Source: [D. Treumann; A. Venkatesh](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p04-p.pdf), §7.2, pp. 205–206; GL_n specialization.

Acceptance. The assertion is for all n; baseline polynomial surjectivity at n=1,2 is not the all-n Satake theorem.


<a id="hall-littlewood"></a>

#### Hall–Littlewood spherical functions

`SmoothRepresentationsOfLocalGroups:SR.4/hall-littlewood` · definition. Proposed name: `SRPlan.HallLittlewood`.

For a dominant integral tuple lambda of length n and invertible variables X_i, define P_lambda(X;t) by the symmetric rational expression: sum over permutations of X^lambda times product_{i<j}(X_i-t X_j)/(X_i-X_j), divided by the stabilizer Poincare polynomial v_lambda(t). Prove cancellation to a symmetric Laurent polynomial over Z[t] before specializing denominators in coefficient rings.

Proof route. 1. Define the expression in the rational-function field in independent variables. 2. Pair terms along simple reflections to prove pole cancellation. 3. Factor the stabilizer contribution and prove the quotient is integral.

Inputs: [satake-isomorphism](#satake-isomorphism).

Source: [S. Leslie](https://arxiv.org/pdf/1911.07907v3), §3.1, pp. 22–23, displayed Macdonald formula.

Uses. Leslie §3.1: Compute the endoscopic spherical transfer on double-coset basis vectors.

API contracts:

- `SRPlan.HallLittlewood.symmetric` (structure): P_lambda is invariant under variable permutations.
- `SRPlan.HallLittlewood.homogeneous` (characterisation): Its total Laurent degree is the sum of lambda_i.
- `SRPlan.HallLittlewood.integral` (compatibility): The universal expression lies in symmetric Laurent polynomials over Z[t], so specialization uses no variable-difference inverses.

Definition tests:

- `SRPlan.HallLittlewood.rankOne` (degenerate): For n=1, P_(m)=X^m.
- `SRPlan.HallLittlewood.zero` (computation): P_0=1.
- `SRPlan.HallLittlewood.minuscule` (computation): For lambda=(1 repeated r,0 repeated n-r), P_lambda=e_r.


<a id="macdonald-formula"></a>

#### Macdonald formula for GL_n

`SmoothRepresentationsOfLocalGroups:SR.4/macdonald-formula` · theorem. Proposed name: `SRPlan.macdonaldFormula`.

For GL_n(E), with E/F unramified quadratic and q=card(k_F), S(1_lambda)=q^<lambda,2 rho> P_lambda(X;q^-2). Hall–Littlewood branching separates n=a+b variables into bidegrees with |alpha|+|beta|=|lambda|.

Proof route. 1. Use the GL_n elementary-divisor count and the triangular Satake coefficients to identify the universal Hall–Littlewood expression. 2. Split the symmetric polynomial into its two variable sets and prove the branching identities, preserving Laurent shifts.

Inputs: [hall-littlewood](#hall-littlewood), [gln-generators](#gln-generators).

Source: [S. Leslie](https://arxiv.org/pdf/1911.07907v3), §3.1, pp. 22–24.

Acceptance. The residue cardinality of E is q squared; a missing square changes every normalization.


<a id="parabolic-descent"></a>

#### Spherical parabolic descent

`SmoothRepresentationsOfLocalGroups:SR.4/parabolic-descent` · construction. Proposed name: `SRPlan.parabolicDescent`.

For P=MN, define normalized spherical descent f^P(m)=delta_P(m)^(1/2) integral_N integral_K f(kmnk^-1) dk dn, with vol(K)=vol(N intersect K)=1. Under Satake this is restriction along the dual Levi embedding. Leslie’s xi_(a,b) also twists the two determinant characters by |.|_E^(b/2) and |.|_E^(a/2).

Proof route. 1. Reduce the integrals to finite compact-open cosets and verify spherical invariance in M. 2. Apply Iwasawa decomposition twice to compare constant terms and prove the Satake restriction square. 3. Add the determinant twists explicitly; homogeneity controls the resulting q powers.

Inputs: [satake-transform](#satake-transform), `SmoothRepresentationsOfLocalGroups:SR.2`, `mathlib:Finsupp.linearCombination`.

Source: [S. Leslie](https://arxiv.org/pdf/1911.07907v3), §3.1, pp. 23–25, Lemma 3.2.

Uses. Leslie Lemma 3.2: Compute xi_(a,b), including its character twists. IntegralHeckeAndGaloisDeterminants:IHG3: Export the normalized Levi restriction square.

API contracts:

- `SRPlan.parabolicDescent.support` (structure): Descent preserves compact support modulo the Levi compact subgroup.
- `SRPlan.parabolicDescent.satake` (compatibility): Normalized Satake followed by dual-Levi restriction equals Levi Satake after descent.
- `SRPlan.parabolicDescent.stages` (functoriality): Nested Levi descents agree, using the product of the specified modulus halves.

Definition tests:

- `SRPlan.parabolicDescent.wholeGroup` (degenerate): For M=G, descent is the identity.
- `SRPlan.parabolicDescent.torus` (compatibility): For M=T, descent agrees with the normalized constant term.
- `SRPlan.parabolicDescent.xiVariables` (computation): xi_(a,b) replaces the first a variables by q^-b X_i and the last b by q^-a Y_j.


<a id="paired-unitary-parameter"></a>

#### Ordered unitary Satake parameters

`SmoothRepresentationsOfLocalGroups:SR.4/paired-unitary-parameter` · definition. Proposed name: `SRPlan.PairedParameter`.

Over a coefficient ring L, an inert rank-N paired parameter is an ordered tuple of units alpha with alpha_i alpha_(N+1-i)=1 and, for odd N, middle alpha=1. Its monic polynomial is product(T-alpha_i). A reciprocal polynomial over an arbitrary product ring does not necessarily admit this paired ordering.

Proof route. 1. Define the paired tuple and forget it to its polynomial. 2. Use paired products to prove the reciprocal identity; define the Hecke character through Weyl-invariant lattice evaluation. 3. Retain polynomial-only parameters separately when paired ordering has not been proved.

Inputs: [spherical-parameter](#spherical-parameter).

Source: [Y. Liu; Y. Tian; L. Xiao; W. Zhang; X. Zhu](https://par.nsf.gov/servlets/purl/10323568), §3.1, Definition 3.1.1 and Construction 3.1.8, pp. 139–141.

Uses. Liu Construction 3.1.8: Produce a well-defined Hecke character while avoiding the arbitrary-ring ordering error.

API contracts:

- `SRPlan.PairedParameter.polynomial` (data): P_alpha(T)=product_i(T-alpha_i).
- `SRPlan.PairedParameter.reciprocal` (compatibility): P_alpha(T)=(-T)^N P_alpha(T^-1), interpreted after clearing Laurent powers.
- `SRPlan.PairedParameter.weyl` (functoriality): Permutations and inversion of paired coordinates leave the character unchanged.

Definition tests:

- `SRPlan.PairedParameter.rankOne` (degenerate): The only inert paired rank-one parameter is alpha=1.
- `SRPlan.PairedParameter.rankTwo` (computation): For units a,a^-1, P=T^2-(a+a^-1)T+1.
- `SRPlan.PairedParameter.productRing` (non-example): Over F_5 times F_5, roots (1,2),(2,1),(3,3) give a reciprocal cubic but none can be the required middle root.


<a id="unitary-genericity"></a>

#### Polynomial unitary genericity predicates

`SmoothRepresentationsOfLocalGroups:SR.4/unitary-genericity` · definition. Proposed name: `SRPlan.UnitaryGenericity`.

For q a unit of L and monic unitary P of rank N: odd Tate genericity means P derivative at 1 is a unit; odd intertwining genericity means P(-q) is a unit; even level-raising genericity means P(q)=0 and P derivative at q is a unit; even intertwining genericity means P(-1) is a unit. These polynomial predicates remain the definitions when roots collide.

Proof route. 1. Define the four parity-specific conditions directly on P. 2. Derive root interpretations only when the separated values and simple-root hypotheses justify them.

Inputs: [paired-unitary-parameter](#paired-unitary-parameter).

Source: [Y. Liu; Y. Tian; L. Xiao; W. Zhang; X. Zhu](https://par.nsf.gov/servlets/purl/10323568), Definition 3.1.5 and Remark 3.1.6, pp. 140–141.

Uses. Liu §3.1 and Appendix B: Control units and simple roots in the local spherical eigenvalues.

API contracts:

- `SRPlan.UnitaryGenericity.oddTate` (characterisation): In odd rank the Tate condition is IsUnit(P derivative evaluated at 1).
- `SRPlan.UnitaryGenericity.evenRaising` (characterisation): In even rank the raising condition combines P(q)=0 with IsUnit(P derivative evaluated at q).
- `SRPlan.UnitaryGenericity.baseChange` (compatibility): Every predicate is preserved by ring homomorphisms carrying q to a unit.

Definition tests:

- `SRPlan.UnitaryGenericity.doubleRoot` (non-example): For rank two with q=1 and P=(T-1)^2, the even raising condition fails.
- `SRPlan.UnitaryGenericity.oddOne` (computation): For P=T-1 the odd Tate condition holds.
- `SRPlan.UnitaryGenericity.collision` (non-example): For P=T-1 and q=-1, odd intertwining fails despite there being no nonmiddle reciprocal pair.


<a id="unitary-weyl-traces"></a>

#### Unitary dual-group trace coordinates

`SmoothRepresentationsOfLocalGroups:SR.4/unitary-weyl-traces` · theorem. Proposed name: `SRPlan.unitaryWeylTraces`.

For the unramified unitary rank-N dual group GL_N semidirect the pinned transpose-inverse involution, invariant lattice coordinates are the elementary symmetric functions in mu_i=x_i/x_(N+1-i)+x_(N+1-i)/x_i. The extended exterior-power tensor-dual representation has Frobenius-component trace equal to the subset sum of the products x_i/x_(N+1-i), with cardinality delta.

Proof route. 1. Compute the pinned involution using the alternating antidiagonal matrix. 2. Extend exterior power tensor its dual by the signed factor swap and calculate the trace on the fixed basis vectors. 3. Group paired indices to express the subset sum in the elementary mu_i coordinates.

Inputs: [satake-isomorphism](#satake-isomorphism), `ReductiveGroupsPartII:RG2.5`.

Source: [Y. Liu; Y. Tian; L. Xiao; W. Zhang; X. Zhu](https://par.nsf.gov/servlets/purl/10323568), Appendix B.1, pp. 331–333, Lemmas B.1.1–B.1.4.

Acceptance. Odd middle coordinates are handled separately, rather than adding a fictitious reciprocal pair.


<a id="unitary-triangular-transform"></a>

#### Unitary minuscule triangular Satake matrix

`SmoothRepresentationsOfLocalGroups:SR.4/unitary-triangular-transform` · theorem. Proposed name: `SRPlan.unitaryTriangularTransform`.

For t_delta=(1 repeated delta,0 repeated N-2delta,-1 repeated delta), write T_delta for its hyperspecial double coset. Then q^(delta(N-delta)) trace(rho_(N,delta)) = sum_(i=0)^delta GaussianBinomial(N-2i,delta-i;-q) S(T_i). The matrix is unitriangular and gives an integral algorithm for all spherical calculations in Appendix B.

Proof route. 1. Compute the constant-term coefficients by classifying residual isotropic flags and their lift indices. 2. Use the Gaussian-binomial recurrence to identify each coefficient and verify its exponent. 3. Invert the triangular matrix over Z[q^-1].

Inputs: [unitary-weyl-traces](#unitary-weyl-traces), [satake-transform](#satake-transform), `ReductiveGroupsPartII:RG2.4`.

Source: [Y. Liu; Y. Tian; L. Xiao; W. Zhang; X. Zhu](https://par.nsf.gov/servlets/purl/10323568), Lemma B.2.6, pp. 336–337.

Acceptance. The paper invokes Xiao–Zhu for this matrix; the missing direct classical count is a recorded gap, not an upward geometric-Satake import.


<a id="unitary-isotropic-counts"></a>

#### Mixed-level spherical product counts

`SmoothRepresentationsOfLocalGroups:SR.4/unitary-isotropic-counts` · theorem. Proposed name: `SRPlan.unitaryIsotropicCounts`.

The product I of the two neighboring unitary lattice correspondences has coefficient at T_delta equal to the number of maximal isotropic subspaces in a residual hermitian space of dimension N-2delta. In even dimension 2k this is product_(i=1)^k(q^(2i-1)+1); in odd dimension 2k+1 it is product_(i=1)^k(q^(2i+1)+1). These coefficients define its hyperspecial spherical image.

Proof route. 1. Reduce pairs of endpoint lattices to their common residual discriminant space. 2. Count a first isotropic line and apply induction to its perpendicular quotient. 3. Prove the Gaussian product identity by its finite polynomial recurrence.

Inputs: `SmoothRepresentationsOfLocalGroups:SR.1`, [unitary-triangular-transform](#unitary-triangular-transform).

Source: [Y. Liu; Y. Tian; L. Xiao; W. Zhang; X. Zhu](https://par.nsf.gov/servlets/purl/10323568), Lemma B.2.4, pp. 335–336; Lemmas B.2.7–B.2.8, pp. 337–339.

Acceptance. The second factor in the even product is q cubed plus one. This exports the spherical product; the full two-parahoric operator category remains with its existing owner.


<a id="unitary-even-formulas"></a>

#### Even-rank unitary spherical identities

`SmoothRepresentationsOfLocalGroups:SR.4/unitary-even-formulas` · theorem. Proposed name: `SRPlan.unitaryEvenFormulas`.

For N=2r, S(I)=q^(r^2) product_i(mu_i+2) and S((q+1)R-I)=-q^(r^2) product_i(mu_i-q-q^-1). Moreover S(R+(q+1)T)=-(q^(r^2+1)-q^(r^2-1)) sum_j product_(i not j)(mu_i-q-q^-1). R is the linear combination of T_delta with coefficient ((1-(-q)^(r-delta))/(q+1)) product_(i=1)^(r-delta)(q^(2i-1)+1); all apparent quotients are universal polynomials.

Proof route. 1. Substitute the triangular matrix into the isotropic counts. 2. Use the finite Gaussian identities and factor the resulting symmetric polynomial in the mu_i. 3. Differentiate the product identity to obtain the sum with one factor removed.

Inputs: [unitary-isotropic-counts](#unitary-isotropic-counts), [unitary-triangular-transform](#unitary-triangular-transform).

Source: [Y. Liu; Y. Tian; L. Xiao; W. Zhang; X. Zhu](https://par.nsf.gov/servlets/purl/10323568), Lemmas B.3.1–B.3.4 and Proposition B.3.5, pp. 339–343.

Acceptance. Do not invert q+1 in the coefficient ring; simplify the universal geometric sums first. Use the corrected q^(2i-1)+1 factors.


<a id="unitary-odd-formulas"></a>

#### Odd-rank unitary spherical identities

`SmoothRepresentationsOfLocalGroups:SR.4/unitary-odd-formulas` · theorem. Proposed name: `SRPlan.unitaryOddFormulas`.

For N=2r+1, S(I)=q^(r^2+r) product_i(mu_i+q+q^-1) and S(T)=q^(r^2+r) product_i(mu_i-2). Here T=sum_delta d_(r-delta,q) T_delta and d_(k,q)=sum_(j=0)^k (-1)^j(2j+1) q^(j(j+1)) GaussianBinomial(2k+1,k-j;-q). Even-rank T uses d_bullet_(k,q)=(d_(k,q)+(((-q)^(k+1)-1)/(q+1)) product_(i=1)^k(q^(2i-1)+1))/(q+1), again evaluated as a polynomial.

Proof route. 1. Expand the d coefficients using Gaussian recurrence. 2. Apply the triangular Satake matrix and pair inverse torus weights. 3. Verify the product formula and the polynomial divisibility defining d_bullet before specialization.

Inputs: [unitary-isotropic-counts](#unitary-isotropic-counts), [unitary-triangular-transform](#unitary-triangular-transform).

Source: [Y. Liu; Y. Tian; L. Xiao; W. Zhang; X. Zhu](https://par.nsf.gov/servlets/purl/10323568), Notation 1.3.1, pp. 119–120; Lemmas B.4.1–B.4.2 and Proposition B.4.3, pp. 344–345.

Acceptance. The displayed d_bullet formula is distinct from d; even and odd coefficient systems cannot be interchanged.


<a id="gsp4-spin-polynomial"></a>

#### The GSp_4 spherical spin polynomial

`SmoothRepresentationsOfLocalGroups:SR.4/gsp4-spin-polynomial` · definition. Proposed name: `SRPlan.SpinPolynomial`.

For residue size q and spherical generators T0 (central scalar varpi), T1 (diag(varpi^2,varpi,varpi,1)) and T2 (diag(varpi,varpi,1,1)), define Q(X)=1-T2 X+q(T1+(q^2+1)T0)X^2-q^3 T2 T0 X^3+q^6 T0^2 X^4. The scalar generator and similitude are retained.

Proof route. 1. Define the polynomial over the integral spherical Hecke algebra. 2. Evaluate each generator using the twisted spin Satake parameter; retain the central term.

Inputs: [gln-generators](#gln-generators), `ReductiveGroupsPartII:RG2.5`.

Source: [V. Pilloni](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/complexhidatheorygsp4.pdf), §5.1.3–5.1.5, pp. 21–22.

Uses. Calegari–Geraghty Definition 6.7: Match the reciprocal monic Galois polynomial. GSp4LocalLanglandsAndGaloisRepresentations: Supply the hyperspecial normalization without duplicating Iwahori and Klingen calculations.

API contracts:

- `SRPlan.SpinPolynomial.constant` (simp): Q(0)=1.
- `SRPlan.SpinPolynomial.coefficients` (data): The degree-four coefficient is q^6 T0^2 and the degree-one coefficient is -T2.
- `SRPlan.SpinPolynomial.reciprocal` (compatibility): The reciprocal monic polynomial has coefficients 1,-T2,q T1+(q^3+q)T0,-q^3 T2 T0,q^6 T0^2.

Definition tests:

- `SRPlan.SpinPolynomial.rankFour` (computation): The polynomial has the four specified coefficients, including the q^3+q central contribution.
- `SRPlan.SpinPolynomial.similitude` (characterisation): For roots alpha,beta,gamma,delta with alpha delta=beta gamma, its top coefficient is their product.
- `SRPlan.SpinPolynomial.centralScaling` (compatibility): Scaling all four spin roots by c multiplies the coefficient of X^j by c^j.


<a id="gsp4-galois-comparison"></a>

#### GSp_4 spin and monic polynomial comparison

`SmoothRepresentationsOfLocalGroups:SR.4/gsp4-galois-comparison` · comparison. Proposed name: `SRPlan.gsp4GaloisComparison`.

Under the q^-3/2 similitude twist convention, Q(X)=product_(xi=alpha,beta,gamma,delta)(1-xi X), with alpha delta=beta gamma, T0=q^-3 alpha delta and the generator evaluations of Pilloni §5.1.4. Substitution Tx1=T2, Tx2=T1, Sx=T0 identifies the reciprocal polynomial with Calegari–Geraghty Definition 6.7. This is a local normalization comparison, not a construction of global Galois representations.

Proof route. 1. Expand the four-factor polynomial using the common similitude relation. 2. Substitute the spherical generator eigenvalues and check all five coefficients. 3. Take the reciprocal polynomial and match the changed generator names.

Inputs: [gsp4-spin-polynomial](#gsp4-spin-polynomial), [spherical-parameter](#spherical-parameter).

Source: [F. Calegari; D. Geraghty](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf), Definition 6.7, pp. 38–39; compare Pilloni §5.1.4.

Acceptance. The correct root pairing is alpha delta=beta gamma.


<a id="derived-satake"></a>

#### Derived Satake at Taylor–Wiles primes

`SmoothRepresentationsOfLocalGroups:SR.4/derived-satake` · theorem. Proposed name: `SRPlan.derivedSatake`.

For split G, S=Z/ell^r, q congruent to 1 modulo ell^r and ell not dividing |W|, derived spherical restriction gives a graded algebra isomorphism with (S[Lambda] tensor H*(T(k_F),S))^W. Its degree-zero map is the classical Satake specialization. The Iwahori-to-spherical Morita comparison is restricted to the etale locus of Spec S[Lambda] over Spec S[Lambda]^W.

Proof route. 1. Prove the finite reductive group cohomology restriction using restriction-corestriction and the Weyl norm, with |W| invertible. 2. Use Cartan decomposition for the underlying module bijection. 3. Apply the double-coset formula: off-torus orbit corestrictions vanish by the positive ell-power index, giving multiplicativity. 4. For the Iwahori comparison localize on the etale locus, reduce fibers to distinct characters, and identify the matrix algebra.

Inputs: [satake-isomorphism](#satake-isomorphism), `SmoothRepresentationsOfLocalGroups:SR.1`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`.

Source: [A. Venkatesh](https://arxiv.org/pdf/1608.07234v3), Theorem 3.3, pp. 21–26; Lemmas 4.5 and 4.7, pp. 29–31.

Acceptance. The relation to convolution is an anti-isomorphism for the chosen right action convention. At ramified Weyl orbits the Morita assertion is not made.

Atlas planet: **Derived Satake isomorphism**.


<a id="unitary-iwahori-center"></a>

#### Unitary Iwahori center comparison

`SmoothRepresentationsOfLocalGroups:SR.4/unitary-iwahori-center` · comparison. Proposed name: `SRPlan.unitaryIwahoriCenter`.

In the unitary odd-rank Iwahori examples of Clozel–Thorne §2.1, the Bernstein presentation identifies the center with the relative-Weyl invariant lattice algebra; its hyperspecial comparison uses the same Satake normalization. The integral quadratic relation is (T_s+1)(T_s-q_s)=0. Over integral coefficients the generators use the positive braid monoid; the braid group becomes available only after the q_s are units.

Proof route. 1. Import the Iwahori multiplication and corrected parameter-dependent quadratic relations from SR.1. 2. Use the Bernstein cross relation to identify the center after the specified coefficient extension. 3. Compare hyperspecial spherical central characters to the relative-Weyl Satake algebra.

Inputs: [satake-isomorphism](#satake-isomorphism), `SmoothRepresentationsOfLocalGroups:SR.1`, `ReductiveGroupsPartII:RG2.1`.

Source: [L. Clozel; J. Thorne](https://www.dpmms.cam.ac.uk/~jat58/lrspiii.pdf), §2.1, pp. 4–8.

Acceptance. Do not infer T_s is invertible over Z from a braid-group presentation.


<a id="geometric-trace-contract"></a>

#### Classical trace comparison contract

`SmoothRepresentationsOfLocalGroups:SR.4/geometric-trace-contract` · comparison. Proposed name: `SRPlan.geometricTraceContract`.

Export the normalized Satake isomorphism, dominant-coweight basis and Weyl-module trace functions with explicit q-half and Frobenius. A downstream geometric Satake trace comparison must use these same functions and normalizations. The geometric equivalence is not used to prove SR.4.

Proof route. 1. Specify the common lattice basis and normalize the trace of the dual highest-weight representation. 2. Publish the comparison square as a consumer contract; its geometric side remains with the existing geometric owner.

Inputs: [satake-isomorphism](#satake-isomorphism), [frobenius-component-invariants](#frobenius-component-invariants).

Source: [D. Treumann; A. Venkatesh](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p04-p.pdf), §7.2–7.3, pp. 205–208.

Acceptance. IHG3 and GS4 consume the classical export and cannot supply an input to its proof.


### SR.5 declarations

<a id="twisted-coinvariants"></a>

#### Whittaker coinvariants

`SmoothRepresentationsOfLocalGroups:SR.5/twisted-coinvariants` · definition. Proposed name: `SRPlan.WhittakerCoinvariants`.

For an A-linear U-action rho and a character psi:U to A units, define V_(U,psi) as V modulo the A-span of rho(u)v-psi(u)v. For the maximal unipotent of GL_n and a nondegenerate smooth psi, this is the top Bernstein–Zelevinsky derivative. Ordinary coinvariants are already in Mathlib and occur when psi=1.

Proof route. 1. Untwist the restricted representation by psi^-1 and apply the existing coinvariant quotient. 2. Compare the two generating relation spans using unit scalar multiplication. 3. Construct the universal psi-equivariant quotient map.

Inputs: `mathlib:Representation`, `mathlib:Representation.Coinvariants`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`.

Source: [M. Emerton; D. Helm](https://arxiv.org/pdf/1104.0321), §3.1, pp. 12–15; Helm §3, pp. 4–5.

Uses. Helm Theorem 6.3: The rank-one quotient represents genericity. Nakamura Proposition B.10: Control endomorphisms after arbitrary tensoring.

API contracts:

- `SRPlan.WhittakerCoinvariants.relation` (relation): The image of rho(u)v equals psi(u) times the image of v.
- `SRPlan.WhittakerCoinvariants.lift` (universal-property): A linear map satisfying that relation factors uniquely through the quotient.
- `SRPlan.WhittakerCoinvariants.tensor` (compatibility): Tensoring with any coefficient module commutes with this quotient.

Definition tests:

- `SRPlan.WhittakerCoinvariants.trivialCharacter` (compatibility): For psi=1 the quotient agrees with Mathlib ordinary coinvariants.
- `SRPlan.WhittakerCoinvariants.trivialGroup` (degenerate): For U=1 the quotient map is an isomorphism.
- `SRPlan.WhittakerCoinvariants.incompatibleCharacter` (non-example): A trivial rank-one action and a psi value with psi(u)-1 invertible have zero Whittaker quotient.

Atlas planet: **Whittaker coinvariants**.


<a id="mirabolic-derivatives"></a>

#### Mirabolic functors and derivatives

`SmoothRepresentationsOfLocalGroups:SR.5/mirabolic-derivatives` · construction. Proposed name: `SRPlan.BZDerivative`.

Let P_n=GL_(n-1) semidirect F^(n-1). Define Psi^- by ordinary last-row coinvariants, Psi^+ by inflation, Phi^- by the specified nontrivial last-row character quotient, Phi^+ by compact induction and its right adjoint by smooth induction. Set D^r=Psi^- (Phi^-)^(r-1) for 1<=r<=n and D^0=identity. Over a perfect coefficient field without chosen roots, descend the functors by the diagonal conjugations of EH; a chosen quotient map need not descend.

Proof route. 1. Identify the stabilizer of the last-row character as P_(n-1). 2. Use compact and smooth induction for the two Phi adjoints and distinguish them. 3. Check Galois twisting of the character is conjugation by the relevant integral diagonal element; descend the functors and scalar-extension isomorphisms.

Inputs: [twisted-coinvariants](#twisted-coinvariants), `SmoothRepresentationsOfLocalGroups:SR.2`.

Source: [M. Emerton; D. Helm](https://arxiv.org/pdf/1104.0321), §3.1, Lemmas 3.1.1–3.1.8, pp. 12–15.

Uses. Helm §3 and §6: Represent the top generic quotient. Atobe–Kondo–Yasuda §2.3: Compare the characteristic-zero highest-derivative convention.

API contracts:

- `SRPlan.BZDerivative.zero` (simp): D^0 is the identity functor.
- `SRPlan.BZDerivative.top` (compatibility): D^n agrees with nondegenerate Whittaker coinvariants.
- `SRPlan.BZDerivative.baseChange` (functoriality): Every derivative commutes with arbitrary coefficient extension in the specified ell-not-p regime.

Definition tests:

- `SRPlan.BZDerivative.rankOne` (degenerate): For GL_1 the top derivative is the underlying coefficient module.
- `SRPlan.BZDerivative.range` (characterisation): D^r is indexed by ordinary order r, not by the r-th iteration of highest derivative.
- `SRPlan.BZDerivative.induced` (compatibility): The top derivative of a normalized parabolic induction is the tensor product of the top derivatives of its Levi factors.


<a id="derivative-exactness"></a>

#### Exactness and mirabolic filtration

`SmoothRepresentationsOfLocalGroups:SR.5/derivative-exactness` · theorem. Proposed name: `SRPlan.derivativeExactness`.

If p is a unit in A and the required character is defined or descended, Psi^-, Phi^-, their induction partners and all derivatives are exact. The standard adjunctions, Psi^- Psi^+=Id, Phi^- Phi^+=Id, mixed vanishings, and 0 to Phi^+Phi^- to Id to Psi^+Psi^- to 0 hold in the smooth mirabolic category. Derivatives commute with arbitrary A-module tensoring.

Proof route. 1. Exhaust the last-row unipotent by compact pro-p opens and use exact character projectors on each. 2. Identify coinvariants as a filtered colimit and use exactness of filtered colimits. 3. Compute the compact-induction orbit filtration, its adjunction maps and the natural short exact sequence.

Inputs: [mirabolic-derivatives](#mirabolic-derivatives), `SmoothRepresentationsOfLocalGroups:SR.1`.

Source: [M. Emerton; D. Helm](https://arxiv.org/pdf/1104.0321), Lemmas 3.1.1–3.1.8, pp. 12–15.

Acceptance. Neither flatness of the coefficient change nor ell invertible is required here; p invertible is.


<a id="schwartz-submodule"></a>

#### Schwartz submodule

`SmoothRepresentationsOfLocalGroups:SR.5/schwartz-submodule` · construction. Proposed name: `SRPlan.SchwartzSubmodule`.

For a smooth GL_n representation V, the Schwartz submodule J(V) is the image of the canonical mirabolic map (Phi^+)^(n-1) Psi^+(V^(n)) into V. The map is injective. Its top derivative is V^(n), it commutes with coefficient-module tensoring, and End_(P_n)(J(V))=End_A(V^(n)).

Proof route. 1. Iterate the mirabolic short exact sequence to construct the canonical map. 2. Use the mixed vanishings to identify its kernel and top derivative. 3. Apply the iterated adjunction to compute endomorphisms and tensor compatibility.

Inputs: [mirabolic-derivatives](#mirabolic-derivatives), [derivative-exactness](#derivative-exactness).

Source: [M. Emerton; D. Helm](https://arxiv.org/pdf/1104.0321), §3.1, Lemmas 3.1.14–3.1.16, pp. 16–17; §6.3, Lemma 6.3.2, pp. 50–51.

Uses. Helm Proposition 6.2: Show scalar endomorphisms exhaust co-Whittaker endomorphisms. Nakamura Proposition B.10: Extend the scalar endomorphism argument to M tensor V.

API contracts:

- `SRPlan.SchwartzSubmodule.injective` (structure): The canonical mirabolic map has zero kernel.
- `SRPlan.SchwartzSubmodule.derivative` (compatibility): J(V) has the same top derivative as V.
- `SRPlan.SchwartzSubmodule.endomorphisms` (equivalence): Restriction identifies End_(P_n)(J(V)) with End_A(V^(n)).

Definition tests:

- `SRPlan.SchwartzSubmodule.rankOne` (degenerate): J(V)=V for n=1.
- `SRPlan.SchwartzSubmodule.zeroDerivative` (characterisation): If V^(n)=0 then J(V)=0.
- `SRPlan.SchwartzSubmodule.tensor` (compatibility): J(M tensor V)=M tensor J(V), for an arbitrary coefficient module M.


<a id="essentially-aig"></a>

#### Essentially AIG representations

`SmoothRepresentationsOfLocalGroups:SR.5/essentially-aig` · definition. Proposed name: `SRPlan.EssentiallyAIG`.

For a field kappa of characteristic different from p, a smooth representation is essentially AIG if its socle is absolutely irreducible and generic, its quotient by the socle has zero top derivative, and it is the union of its finite-length subrepresentations. Generic means nonzero nondegenerate Whittaker quotient. Absolutely irreducible means simple after every field extension.

Proof route. 1. Define socle as the sum of simple subrepresentations, reusing the representation/submodule dictionary. 2. State absolute irreducibility by extension of scalars, not End=kappa alone. 3. Combine the socle, nongeneric quotient and locally finite-length conditions.

Inputs: [twisted-coinvariants](#twisted-coinvariants), `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`, `SmoothRepresentationsOfLocalGroups:SR.3`, `mathlib:Representation.IsIrreducible`, `mathlib:Subrepresentation.subrepresentationSubmoduleOrderIso`, `mathlib:LinearMap.baseChange`, `mathlib:Representation.prod`.

Source: [D. Helm](https://arxiv.org/pdf/1210.1789), Definition 3.3 and Lemma 3.4, pp. 5–6; EH §3.2, pp. 17–24.

Uses. Helm Definition 6.1: Require essentially AIG smooth duals at every prime fiber.

API contracts:

- `SRPlan.EssentiallyAIG.socle` (projection): The socle is absolutely simple and has nonzero top derivative.
- `SRPlan.EssentiallyAIG.quotient` (projection): The quotient by the socle has zero top derivative.
- `SRPlan.EssentiallyAIG.endomorphisms` (characterisation): Every equivariant endomorphism is scalar.

Definition tests:

- `SRPlan.EssentiallyAIG.genericSimple` (characterisation): An absolutely irreducible generic representation is essentially AIG.
- `SRPlan.EssentiallyAIG.twoGeneric` (non-example): The direct sum of two nonzero generic simple representations is not essentially AIG.
- `SRPlan.EssentiallyAIG.zero` (non-example): The zero representation is not essentially AIG.

Atlas planet: **Essentially AIG representation**.


<a id="integral-blocks"></a>

#### Integral GL_n Bernstein blocks

`SmoothRepresentationsOfLocalGroups:SR.5/integral-blocks` · theorem. Proposed name: `SRPlan.integralBlocks`.

For algebraically closed k of characteristic ell different from p, the smooth W(k)[GL_n(F)] category decomposes by mod-ell inertial supercuspidal support. Each block center A_[L,pi] is a reduced, ell-torsion-free finite-type W(k)-algebra. Its k-points classify exact supercuspidal supports of simple representations in that block. This center specializes the existing abstract CatCenter, not a new abstract center construction.

Proof route. 1. Construct projective type envelopes and the dual injectives; partition simple objects by mod-ell support and prove block orthogonality. 2. Use the explicit symmetric Laurent subalgebra and finite admissibility of projective generators to prove the center is finite type. 3. Embed into the characteristic-zero center for reducedness and torsion-freeness; compare support through the Laurent coordinate subalgebra.

Inputs: `mathlib:CategoryTheory.CatCenter`, `mathlib:CategoryTheory.Linear.toCatCenter`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`, `SmoothRepresentationsOfLocalGroups:SR.3`.

Source: [D. Helm](https://arxiv.org/pdf/1201.1874), Definition 4.12, pp. 13–14; Theorems 11.8, 12.8–12.9 and Corollary 12.12, pp. 58, 67–69.

Acceptance. The proof of type-envelope structure and its modular classification is a separate recorded prerequisite gap. The older Helm v1 references to H1 Theorem 12.1 correspond to different numbering in H1 v3.


<a id="type-projectives"></a>

#### Distinguished type projectives and their fibers

`SmoothRepresentationsOfLocalGroups:SR.5/type-projectives` · theorem. Proposed name: `SRPlan.typeProjectives`.

For a maximal distinguished cuspidal k-type (K,tau), the compactly induced projective envelope P_(K,tau) has commutative endomorphism ring E_(K,tau), is E-admissible, and its top derivative is locally free of rank one over E. Every prime fiber has absolutely irreducible generic cosocle and essentially AIG smooth dual.

Proof route. 1. Projectivity lifts a hypothetical second generic constituent to an endomorphism killing the cosocle, contradicting scalar endomorphisms. 2. Propagate the AIG property through generization and specialization using stable lattices. 3. Use unlinked aperiodic modular multisegments to show every point specializes from a generic point. 4. Use fiber dimension one and finite generation of the derivative to obtain a locally free line.

Inputs: [integral-blocks](#integral-blocks), [mirabolic-derivatives](#mirabolic-derivatives), [essentially-aig](#essentially-aig), `SmoothRepresentationsOfLocalGroups:SR.2`.

Source: [D. Helm](https://arxiv.org/pdf/1210.1789), Theorem 4.1, Proposition 4.3, Theorem 4.8 and Corollary 4.9, pp. 6–9.

Acceptance. A locally free line need not be globally trivialized; the downstream universal Whittaker object provides a free line.


<a id="universal-whittaker"></a>

#### Universal block Whittaker projective

`SmoothRepresentationsOfLocalGroups:SR.5/universal-whittaker` · construction. Proposed name: `SRPlan.UniversalWhittaker`.

Choose a nondegenerate W(k)-valued character psi of U and form W=c-Ind_U^G psi. Let W_[L,pi] be its integral-block summand. Hom_G(W,V)=V^(n), W_[L,pi] is projective and admissible over its block center, and W_[L,pi]^(n) is free of rank one over that center. This is the universal generic projective, not a universal arbitrary irreducible representation.

Proof route. 1. Use the pro-p exhaustion of U to prove projectivity and Whittaker representability. 2. Compare block endomorphisms after inverting ell to Bernstein–Deligne. 3. Embed the center into the tensor product of type endomorphism rings and use ell-saturation to descend the equality. 4. Lift a derivative generator and use projectivity to prove it generates W over G.

Inputs: [twisted-coinvariants](#twisted-coinvariants), [integral-blocks](#integral-blocks), [type-projectives](#type-projectives), `SmoothRepresentationsOfLocalGroups:SR.2`.

Source: [D. Helm](https://arxiv.org/pdf/1210.1789), §3, pp. 4–5; Theorem 5.2 and Proposition 5.3, pp. 10–11.

Uses. Helm Theorem 6.3: Base change the universal object to a prescribed center character.

API contracts:

- `SRPlan.UniversalWhittaker.represents` (universal-property): Hom_G(W_[L,pi],V) is naturally the top derivative of the block part of V.
- `SRPlan.UniversalWhittaker.center` (equivalence): End_G(W_[L,pi]) is the integral block center.
- `SRPlan.UniversalWhittaker.line` (structure): The top derivative is free of rank one over the center.

Definition tests:

- `SRPlan.UniversalWhittaker.nongeneric` (non-example): Hom_G(W,V)=0 for a representation with zero top derivative.
- `SRPlan.UniversalWhittaker.genericSimple` (characterisation): A generic simple fiber is a nonzero quotient of the corresponding universal fiber.
- `SRPlan.UniversalWhittaker.baseChange` (compatibility): After a center map to A, the top derivative of W tensor A is A.

Atlas planet: **Universal Whittaker projective**.


<a id="co-whittaker"></a>

#### Co-Whittaker families

`SmoothRepresentationsOfLocalGroups:SR.5/co-whittaker` · definition. Proposed name: `SRPlan.CoWhittaker`.

For a Noetherian W(k)-algebra A, a smooth A[GL_n(F)] representation V is co-Whittaker if it is admissible, V^(n) is free of rank one over A, and for every prime ideal a the smooth dual of V tensor_A kappa(a) is essentially AIG. Domination means a surjective equivariant map. The fiber condition is not replaced by genericity at minimal primes only.

Proof route. 1. Combine the compact-open finite-generation predicate from SR.0, the specified free top derivative and the all-prime fiber test. 2. Use Schwartz generation to recover an endomorphism from its derivative scalar.

Inputs: [essentially-aig](#essentially-aig), [universal-whittaker](#universal-whittaker), [schwartz-submodule](#schwartz-submodule), `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`, `mathlib:LinearMap.baseChange`, `mathlib:Representation.prod`.

Source: [D. Helm](https://arxiv.org/pdf/1210.1789), Definition 6.1 and Proposition 6.2, pp. 11–12.

Uses. AutomorphicCongruences:L3: Provide the general local-family and coefficient-change contract. Nakamura Appendix B: Control tensor endomorphisms for the GL_2 application.

API contracts:

- `SRPlan.CoWhittaker.derivative` (projection): The top derivative is isomorphic to A as an A-module.
- `SRPlan.CoWhittaker.fibers` (projection): Every prime fiber has essentially AIG smooth dual.
- `SRPlan.CoWhittaker.scalars` (equivalence): The natural A to End_(A[G])(V) map is an isomorphism.

Definition tests:

- `SRPlan.CoWhittaker.field` (characterisation): Over a field a finite-length admissible family is co-Whittaker exactly when its cosocle is absolutely irreducible generic and its top derivative has dimension one.
- `SRPlan.CoWhittaker.twoCopies` (non-example): The direct sum of two nonzero co-Whittaker families fails the rank-one derivative condition.
- `SRPlan.CoWhittaker.nongeneric` (non-example): An admissible representation with zero top derivative is not co-Whittaker.

Atlas planet: **Co-Whittaker family**.


<a id="universal-domination"></a>

#### Universal co-Whittaker domination

`SmoothRepresentationsOfLocalGroups:SR.5/universal-domination` · theorem. Proposed name: `SRPlan.universalDomination`.

For any Noetherian A and center map A_[L,pi] to A, W_[L,pi] tensor A is co-Whittaker and surjects onto every co-Whittaker A-family with that center character. A co-Whittaker family has a uniquely determined center character through its scalar endomorphisms. Domination does not assert that every quotient is isomorphic to the universal object.

Proof route. 1. Base-change the free derivative and use the universal essentially AIG dual fibers. 2. Choose a derivative generator in V and lift it through Whittaker representability. 3. A nonzero cokernel would have a nonzero fiber quotient without generic constituent, contradicting the essentially AIG dual condition.

Inputs: [co-whittaker](#co-whittaker), [universal-whittaker](#universal-whittaker), [derivative-exactness](#derivative-exactness).

Source: [D. Helm](https://arxiv.org/pdf/1210.1789), Theorem 6.3, pp. 12–13.

Acceptance. The center character determines the universal dominating object, not a unique arbitrary co-Whittaker quotient.


<a id="reduced-family-reconstruction"></a>

#### Reconstruction from minimal-prime fibers

`SmoothRepresentationsOfLocalGroups:SR.5/reduced-family-reconstruction` · theorem. Proposed name: `SRPlan.reducedFamilyReconstruction`.

Let A be a reduced Noetherian algebra over the block center and choose nonzero generic-cosocle quotients V_a of the universal fibers at its finitely many minimal primes. The image of the diagonal universal map in the product of V_a is co-Whittaker, A-torsion-free and uniquely determined by these generic fibers in the sense of Helm Lemma 6.4.

Proof route. 1. Use reducedness to embed A into the product of its minimal-prime fraction fields. 2. Take the diagonal image and show its derivative is exactly the diagonal copy of A. 3. Use the fiber quotient property and Nakayama to establish co-Whittaker generation and the uniqueness image property.

Inputs: [universal-domination](#universal-domination).

Source: [D. Helm](https://arxiv.org/pdf/1210.1789), Lemma 6.4, pp. 13–14.

Acceptance. Reducedness is essential; no nilpotent information is recovered by minimal-prime fibers.


<a id="llc-family-conditional"></a>

#### The conditional local-Langlands family construction

`SmoothRepresentationsOfLocalGroups:SR.5/llc-family-conditional` · theorem. Proposed name: `SRPlan.llcFamilyConditional`.

In Helm arXiv v1, for a complete reduced ell-torsion-free Noetherian local W(k)-algebra A and a Galois family rho, existence of the desired pi(rho) follows from the conjectural integral Bernstein-center interpolation map of Conjecture 7.4. Uniqueness, when a family with the stated generic fibers exists, is the Emerton–Helm theorem. This source does not prove the interpolation conjecture in general.

Proof route. 1. Specify the center character only under the interpolation hypothesis. 2. Apply the reduced-family diagonal-image construction to the dual Breuil–Schneider generic fibers. 3. Apply EH uniqueness to a torsion-free co-Whittaker family with these fibers.

Inputs: [reduced-family-reconstruction](#reduced-family-reconstruction).

Source: [D. Helm](https://arxiv.org/pdf/1210.1789), Theorems 7.1 and 7.8, Conjectures 7.4–7.5, pp. 14–17.

Acceptance. Conjecture 7.5 is stronger than Conjecture 7.4 and is not needed for the conditional construction.


<a id="tensor-endomorphisms"></a>

#### Endomorphisms after arbitrary coefficient tensoring

`SmoothRepresentationsOfLocalGroups:SR.5/tensor-endomorphisms` · theorem. Proposed name: `SRPlan.tensorEndomorphisms`.

For a co-Whittaker GL_2(Q_l) family V over a Noetherian Z_p-algebra A, p different from l, and any A-module M, End_A(M) to End_(A[G])(M tensor_A V) is an isomorphism. After renaming local residue characteristic to p and coefficient characteristic to ell, the Schwartz proof extends to GL_n with the preceding derivative package; the generalization is a planned proof, not a misquotation of Proposition B.10.

Proof route. 1. Identify the tensor top derivative with M without assuming M flat. 2. Use tensor compatibility of J and its mirabolic endomorphism computation. 3. Schwartz generation makes restriction of endomorphisms injective; f tensor identity gives its inverse.

Inputs: [co-whittaker](#co-whittaker), [schwartz-submodule](#schwartz-submodule), [derivative-exactness](#derivative-exactness).

Source: [K. Nakamura](https://link.springer.com/content/pdf/10.1007/s00222-023-01203-7.pdf), Proposition B.10 and proof, pp. 274–275.

Acceptance. No finite generation or flatness of M is added.


<a id="invariants-duality-base-change"></a>

#### Integral invariants and duality safeguards

`SmoothRepresentationsOfLocalGroups:SR.5/invariants-duality-base-change` · comparison. Proposed name: `SRPlan.invariantsDualityBaseChange`.

For a ring map A to B there is a natural map B tensor_A V^K to (B tensor_A V)^K. It is an isomorphism under an available averaging projector with invertible pro-order, and otherwise only with separately proved hypotheses; it is not asserted for arbitrary hyperspecial K or arbitrary base change. Smooth duality over fields and its base-change compatibility for admissible finite-dimensional invariant modules are kept separate from injective-cogenerator duality.

Proof route. 1. Construct the invariant comparison by the universal tensor map. 2. In the averaging case identify invariants with a split projector image and tensor that image. 3. For ordinary contragredients state finite-projective invariant hypotheses before using Hom-tensor interchange.

Inputs: `mathlib:Representation.invariants`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`, `SmoothRepresentationsOfLocalGroups:SR.2`, [co-whittaker](#co-whittaker).

Source: [M. Emerton; D. Helm](https://arxiv.org/pdf/1104.0321), §3.1, pp. 12–15; compare DHKM §4.2, pp. 14–15.

Acceptance. Top derivative base change is unconditional in its p-invertible regime; compact-open invariant base change is not.


<a id="ext-support-orthogonality"></a>

#### Ext and exact supercuspidal support

`SmoothRepresentationsOfLocalGroups:SR.5/ext-support-orthogonality` · theorem. Proposed name: `SRPlan.extSupportOrthogonality`.

For irreducible admissible representations of GL_n or its Levi over a field of characteristic different from p, nonzero Ext^i implies the same exact supercuspidal support. In a supercuspidal block the Laurent-coordinate maximal ideals kill Ext, so distinct unramified twists have zero Ext; inertial equivalence alone is insufficient for nonvanishing.

Proof route. 1. For supercuspidal types identify the block with a Laurent polynomial algebra and use two distinct maximal ideals annihilating Ext. 2. Induct on Ext degree through embeddings into cuspidal induction, using exact Jacquet functors and the appropriate field adjunction. 3. Use admissible duality for the second variable and propagate to arbitrary irreducibles.

Inputs: [integral-blocks](#integral-blocks), `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`.

Source: [M. Emerton; D. Helm](https://arxiv.org/pdf/1104.0321), Theorem 3.2.13 and Corollary 3.2.14, pp. 21–22.

Acceptance. This field proof uses the field theory supplied earlier; it does not make SR.5 depend circularly on general SR.6 second adjointness.


<a id="cg-distinct-block"></a>

#### The distinct-eigenvalue local block

`SmoothRepresentationsOfLocalGroups:SR.5/cg-distinct-block` · theorem. Proposed name: `SRPlan.cgDistinctBlock`.

In the Calegari–Geraghty setup, A=O/varpi^k, q congruent to 1 modulo ell and residual unramified Frobenius eigenvalues distinct. There is a unique irreducible unramified principal series pi attached to the residual semisimple parameter. The locally admissible category with every irreducible subquotient pi is equivalent to the direct-limit finite-length module category of the completed ordered-character deformation algebra: independent pro-ell residual-unit cyclic variables of order d and independent formal unramified variables X_i.

Proof route. 1. Use distinct residual torus characters to split the geometric-lemma filtration and kill off-character Ext in every degree. 2. Identify each finite-length object with induction of its ordered Borel-Jacquet module by adjunction and length comparison. 3. Pass to the locally admissible union of finite-length objects and the completed deformation algebra.

Inputs: [ext-support-orthogonality](#ext-support-orthogonality), `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`, `SmoothRepresentationsOfLocalGroups:SR.2`, [spherical-parameter](#spherical-parameter).

Source: [F. Calegari; D. Geraghty](https://math.uchicago.edu/~fcale/papers/CG.pdf), Lemmas 9.9–9.13, §9.4.1, PDF pp. 124–125.

Acceptance. The formal variables act topologically nilpotently on finite-length modules; an uncompleted polynomial module category includes wrong blocks.


<a id="cg-derived-projector"></a>

#### Derived hyperspecial–parahoric comparison

`SmoothRepresentationsOfLocalGroups:SR.5/cg-derived-projector` · theorem. Proposed name: `SRPlan.cgDerivedProjector`.

In that distinct residual-eigenvalue block, projection e_alpha to a chosen simple Frobenius root induces an isomorphism from hyperspecial invariants to the distinguished line-parahoric invariants, and an isomorphism on all their right derived functors. The projector is the stabilized Q(V)^(n!) construction of CG, with Q isolating the chosen residual root; the result is specific to this local block.

Proof route. 1. Construct enough injectives from the ordered-character deformation category. 2. Show principal-congruence invariants of injectives are acyclic for the finite reductive quotient using induced Borel modules. 3. Compute parahoric invariants of the principal series as the direct sum of ordered root eigenspaces; hyperspecial invariants map diagonally. 4. Apply the root projector and the injective resolution to prove the derived comparison.

Inputs: [cg-distinct-block](#cg-distinct-block), `SmoothRepresentationsOfLocalGroups:SR.1`.

Source: [F. Calegari; D. Geraghty](https://math.uchicago.edu/~fcale/papers/CG.pdf), Lemmas 9.14–9.15 and Theorem 9.16, §9.4.1, PDF pp. 125–127.

Acceptance. The degree-zero calculation alone is not the derived statement.


<a id="highest-derivative-adapter"></a>

#### Characteristic-zero highest-derivative adapter

`SmoothRepresentationsOfLocalGroups:SR.5/highest-derivative-adapter` · comparison. Proposed name: `SRPlan.highestDerivativeAdapter`.

For the characteristic-zero GL_n multisegment convention used by Atobe–Kondo–Yasuda, the highest nonzero normalized derivative is irreducible and is obtained by the corresponding endpoint shortening. Their iterated highest-derivative notation is distinguished from the fixed-order D^r functors above. The local-conductor/newvector application belongs to its established GL_2 owner.

Proof route. 1. Compare normalizing modulus twists and segment endpoint conventions with ordinary mirabolic derivatives. 2. Apply the characteristic-zero multisegment highest-derivative theorem and iterate with an explicit order sequence.

Inputs: [mirabolic-derivatives](#mirabolic-derivatives), `SmoothRepresentationsOfLocalGroups:SR.3`.

Source: [H. Atobe; S. Kondo; S. Yasuda](https://arxiv.org/pdf/2110.09070v4), Introduction and §2.3, pp. 2–3 and 8.

Acceptance. An r-fold highest-derivative iteration is not generally the order-r derivative.


<a id="essential-vector-contract"></a>

#### Integral essential-vector contract

`SmoothRepresentationsOfLocalGroups:SR.5/essential-vector-contract` · application. Proposed name: `SRPlan.essentialVectorContract`.

Export Whittaker representability, derivative base change, Schwartz generation, co-Whittaker domination and the correctly conditioned invariant and duality maps for integral essential-vector applications. A canonical GL_n essential vector over arbitrary nonreduced A is not deduced from rank-one derivatives alone. The field GL_2 conductor/newvector theory and the Fouquet–Wan minimal-lift line keep their assigned owners under RS-21.

Proof route. 1. Specify the evaluation map to the derivative line and the compact-open invariant source used by the consumer. 2. Require the consumer to prove its level, nonvanishing and integrality hypotheses rather than declare a canonical lift from an abstract free line.

Inputs: [universal-domination](#universal-domination), [tensor-endomorphisms](#tensor-endomorphisms), [invariants-duality-base-change](#invariants-duality-base-change).

Source: [D. Helm](https://arxiv.org/pdf/1210.1789), §6, pp. 11–14; EH §6.3, pp. 50–52.

Acceptance. The general integral essential-vector statement is an explicit refinement gap until an appropriate source and coefficient regime are established.


### SR.6 declarations

<a id="crossed-cocycles"></a>

#### Crossed cocycles and gauge action

`SmoothRepresentationsOfLocalGroups:SR.6/crossed-cocycles` · definition. Proposed name: `SRPlan.CrossedCocycle`.

For a group Gamma acting on H by alpha, a crossed cocycle c satisfies c(gamma delta)=c(gamma) alpha(gamma)(c(delta)). Gauge conjugation by h is (h.c)(gamma)=h c(gamma) alpha(gamma)(h)^-1. Its associated section gamma mapped to (c(gamma),gamma) is a homomorphism into H semidirect Gamma.

Proof route. 1. Construct cocycles as the equations for a section of the semidirect projection. 2. Prove the gauge law and covariance under equivariant H homomorphisms. 3. For a finite presentation record equations on the chosen generator values.

Inputs: `ReductiveGroupsPartII:RG2.5`, `mathlib:Representation`.

Source: [J.-F. Dat; D. Helm; R. Kurinczuk; G. Moss](https://arxiv.org/pdf/2009.06708), §1.2, pp. 4–6; §2.1, p. 10.

Uses. DHKM Theorem 1.7: Construct the finite-wild parameter scheme. LanglandsParameterStacks:LP1: Supply the single canonical scheme after the tier move.

API contracts:

- `SRPlan.CrossedCocycle.one` (simp): c(1)=1.
- `SRPlan.CrossedCocycle.gauge` (functoriality): Gauge conjugation preserves the crossed cocycle relation and is an H-action.
- `SRPlan.CrossedCocycle.map` (functoriality): An equivariant homomorphism H to H-prime maps crossed cocycles and commutes with gauge conjugation.

Definition tests:

- `SRPlan.CrossedCocycle.trivialAction` (characterisation): For trivial alpha, cocycles are group homomorphisms.
- `SRPlan.CrossedCocycle.identityCocycle` (degenerate): The constant identity function is a cocycle.
- `SRPlan.CrossedCocycle.coboundary` (computation): Gauge conjugating the identity gives c(gamma)=h alpha(gamma)(h)^-1.

Atlas planet: **Finite-wild cocycles**.


<a id="finite-wild-discretization"></a>

#### Finite-wild Weil discretization

`SmoothRepresentationsOfLocalGroups:SR.6/finite-wild-discretization` · theorem. Proposed name: `SRPlan.finiteWildDiscretization`.

Choose arithmetic Frobenius Fr and a compatible tame generator s. W_F^0 is the preimage of Z[1/q] semidirect Fr^Z inside W_F; Fr s Fr^-1=s^q. For a normal open finite-action-compatible wild subgroup P_F^e, W_F^0/P_F^e is finitely presented. Its topology keeps the wild subgroup profinite and the tame–Frobenius quotient discrete.

Proof route. 1. Construct the dense tame–Frobenius subgroup from the local Weil-group exact sequence. 2. Adjoin the finite wild generators and their conjugation relations to the tame Frobenius relation. 3. Check the topology used for cocycles and compare arithmetic with geometric Frobenius.

Inputs: `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`, [crossed-cocycles](#crossed-cocycles).

Source: [J.-F. Dat; D. Helm; R. Kurinczuk; G. Moss](https://arxiv.org/pdf/2009.06708), §1.2, pp. 4–6; §2.1, p. 10.

Acceptance. Geometric Frobenius is the inverse of Fr; reverse all parameter normalizations together.


<a id="finite-wild-representability"></a>

#### One integral finite-wild cocycle scheme

`SmoothRepresentationsOfLocalGroups:SR.6/finite-wild-representability` · theorem. Proposed name: `SRPlan.finiteWildRepresentability`.

For the pinned split dual group H over Z[1/p] with finite Weil action, the cocycle functor on W_F^0/P_F^e is represented by a finite-presentation affine scheme, realized as the closed relation locus in H^r for a finite presentation of the group. Construct this scheme once over Z[1/p]; its Z_ell models are base changes, not independent schemes. The expected fiber dimension is dim(H over the base), while the total dimension over Z[1/p] includes the base dimension.

Proof route. 1. Translate each group relation to an equality of H-valued regular functions in the generator coordinates. 2. Form the corresponding equalizer closed subscheme and prove the representing point bijection for every base algebra. 3. Use presentation changes to identify the represented functor; base change then gives all coefficient models.

Inputs: [crossed-cocycles](#crossed-cocycles), [finite-wild-discretization](#finite-wild-discretization), `tauceti:TauCeti.AffineGroupSchemeCat`, `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ`.

Source: [J.-F. Dat; D. Helm; R. Kurinczuk; G. Moss](https://arxiv.org/pdf/2009.06708), §1.2 and §2.1–2.2, pp. 4–6 and 10–11.

Acceptance. Do not claim canonical independence of W_F^0 choices over Z[1/p]; canonical ell-adic extensions and quotient comparisons are separate theorems.


<a id="ell-adic-extension"></a>

#### Ell-adic cocycle extension and changes of discretization

`SmoothRepresentationsOfLocalGroups:SR.6/ell-adic-extension` · theorem. Proposed name: `SRPlan.ellAdicExtension`.

After base change to Z_ell, ell different from p, the universal finite-wild cocycle extends continuously to W_F/P_F^e in the relative discrete ell-adic sense of DHKM. Changes of tame generator and Frobenius give canonical ell-adic functor comparisons; the integral discretized schemes are not thereby identified over Z[1/p].

Proof route. 1. Use finite wild image and the ell-adic continuity of the universal generator values. 2. Show the dense-subgroup extension is unique and compare different dense discretizations through the continuous point functor.

Inputs: [finite-wild-representability](#finite-wild-representability).

Source: [J.-F. Dat; D. Helm; R. Kurinczuk; G. Moss](https://arxiv.org/pdf/2009.06708), Theorem 4.1(ii) and Corollary 4.2, pp. 29–30 (proof refinement outstanding).

Acceptance. The extension theorem is an explicitly unrefined source prerequisite, with its exact page mapping checked before future closure.


<a id="wild-strata"></a>

#### Finite wild strata and reductive centralizers

`SmoothRepresentationsOfLocalGroups:SR.6/wild-strata` · theorem. Proposed name: `SRPlan.wildStrata`.

Over the algebraic integral base used by DHKM, wild cocycles have finitely many H-conjugacy classes; their centralizers have reductive connected components. The finite-wild scheme decomposes into induced tame cocycle strata for the centralizers, after choosing extensions of the wild cocycle that normalize a Borel pair.

Proof route. 1. Apply prime-to-base finite-group invariant theory to the wild p-group action. 2. Choose representatives and their smooth reductive centralizers after the specified integral base extension. 3. Construct each induced stratum by extension to tame–Frobenius generators and identify stabilizers.

Inputs: [finite-wild-representability](#finite-wild-representability), `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`.

Source: [J.-F. Dat; D. Helm; R. Kurinczuk; G. Moss](https://arxiv.org/pdf/2009.06708), Propositions 1.1–1.2, pp. 4–6; used in DHKM §2.1, pp. 5–6.

Acceptance. The connected centralizer and its component group are retained separately.


<a id="twisted-component-finiteness"></a>

#### Twisted reductive-component quotient finiteness

`SmoothRepresentationsOfLocalGroups:SR.6/twisted-component-finiteness` · theorem. Proposed name: `SRPlan.twistedComponentFiniteness`.

If H is a closed reductive subgroup of a reductive G over the integral base of DHKM and is stable under Int(g) theta, the induced map from the relevant H g theta component quotient to the G theta component quotient is finite. The construction descends from the algebraic integral base after the finite scalar extensions used in §2.

Proof route. 1. Trivialize the diagonalizable torsors using vanishing Picard group and divisible units over the chosen algebraic integral base. 2. Reduce via twisted Chevalley–Steinberg to torus quotients and finite Weyl actions. 3. Control central isogenies and torus power maps to show integrality of the coordinate extension.

Inputs: `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory`, [wild-strata](#wild-strata).

Source: [J.-F. Dat; D. Helm; R. Kurinczuk; G. Moss](https://arxiv.org/pdf/2203.04929v2), Lemma 2.2, pp. 5–6; Lemma 2.1, p. 5.

Acceptance. The integral reductive invariant theory is recorded as a missing proof package rather than assumed from an abstract invariant subring.


<a id="tame-torus-engine"></a>

#### Tame torus isogeny engine

`SmoothRepresentationsOfLocalGroups:SR.6/tame-torus-engine` · theorem. Proposed name: `SRPlan.tameTorusEngine`.

For a tame stratum with semisimple inertia s and a normalizer representative n, the equation n Fr(t) n^-1 t^-q=s^q(n)n^-1 lies in the maximal fixed subtorus T^(s,0). The torus endomorphism n Fr-q is an isogeny, giving a finite map to the allowed normalizer components. Closed orbits are reached by this torus locus.

Proof route. 1. List the finite allowed normalizer components satisfying the inertia relation. 2. On cocharacter lattices, n Fr has finite order, so n Fr-q has nonzero determinant since q>1. 3. Apply the closed-orbit/completely-reducible criterion to conjugate semisimple tame data into the normalizer-torus locus.

Inputs: [wild-strata](#wild-strata), [twisted-component-finiteness](#twisted-component-finiteness).

Source: [J.-F. Dat; D. Helm; R. Kurinczuk; G. Moss](https://arxiv.org/pdf/2203.04929v2), §2.1–2.2, Lemmas 2.8–2.9, pp. 7–9.

Acceptance. T^(s,0) is the maximal fixed subtorus; it is not silently the full fixed-point scheme.


<a id="frobenius-quotient-finite"></a>

#### Finite Frobenius evaluation on cocycle quotients

`SmoothRepresentationsOfLocalGroups:SR.6/frobenius-quotient-finite` · theorem. Proposed name: `SRPlan.frobeniusQuotientFinite`.

The Frobenius evaluation Z^1(W_F^0/P_F^e,H)//H to the twisted Frobenius component H semidirect Fr//H is finite over Z[1/p]. After restriction to a Weil-stable closed reductive subgroup, the induced cocycle quotient map is also finite.

Proof route. 1. Reduce the finite wild strata to the tame torus engine. 2. Use the finite torus map and surjectivity on closed orbits to inject quotient rings into a finite algebra. 3. Apply noetherianity and descent of finite generation to establish the integral quotient map.

Inputs: [finite-wild-representability](#finite-wild-representability), [tame-torus-engine](#tame-torus-engine).

Source: [J.-F. Dat; D. Helm; R. Kurinczuk; G. Moss](https://arxiv.org/pdf/2203.04929v2), Theorem 1.7 and Corollary 1.8, p. 4; Theorem 2.3 and Corollaries 2.4–2.5, pp. 6–10.

Acceptance. The proof is over the integral coefficient base, not merely over algebraically closed fields.

Atlas planet: **Finite Frobenius evaluation**.


<a id="excursion-algebra"></a>

#### Finite-wild excursion algebra

`SmoothRepresentationsOfLocalGroups:SR.6/excursion-algebra` · construction. Proposed name: `SRPlan.ExcursionDatum`.

For W=W_F^0/P_F^e, define Exc(W,H) as the colimit, over free-group maps F_n to W, of the invariant coordinate rings O(Z^1(F_n,H))^H. Its generators can be expressed by excursion tuples: finite I, a representation V of the corresponding H/Weil finite-action product, diagonal-H invariant creation and annihilation maps alpha and beta, and gamma in W^I. Functorial pullback, product and concatenation impose the excursion relations.

Proof route. 1. Construct the free-group cocycle invariant diagram from the generator-word substitution maps. 2. Take its commutative-algebra colimit and derive the Theta_n presentation; inversion follows by inserting gamma and gamma^-1 and concatenating. 3. Use matrix coefficients with diagonal invariants to present the same generators as excursion data.

Inputs: [crossed-cocycles](#crossed-cocycles), [finite-wild-representability](#finite-wild-representability), `mathlib:CategoryTheory.CatCenter`, `mathlib:Representation.tprod`.

Source: [L. Fargues; P. Scholze](https://arxiv.org/pdf/2102.13459), Definition VIII.3.4, Proposition VIII.3.7 and Definition VIII.4.2, pp. 287–290 and 292–294.

Uses. DHKM §3.1: Construct the natural center action and reduced excursion algebra. ExcursionOperatorsAndSpectralAction:ES1: Consume this moved algebra and relations.

API contracts:

- `SRPlan.ExcursionDatum.matrixCoefficient` (data): The coefficient function is beta(rho(h_i)_i alpha(1)).
- `SRPlan.ExcursionDatum.diagonalInvariant` (characterisation): Simultaneous diagonal H conjugation does not change the coefficient.
- `SRPlan.ExcursionDatum.tensorProduct` (compatibility): Tensoring excursion representations multiplies their coefficient functions.

Definition tests:

- `SRPlan.ExcursionDatum.unit` (degenerate): For the trivial one-dimensional representation with identity creation and annihilation, the coefficient is one.
- `SRPlan.ExcursionDatum.zeroAnnihilation` (computation): If beta is zero, the coefficient is zero.
- `SRPlan.ExcursionDatum.singleton` (compatibility): For one index, creation and annihilation through invariant vectors give a constant coefficient function.

Atlas planet: **Excursion algebra**.


<a id="excursion-invariant-comparison"></a>

#### Excursion and cocycle quotient comparison

`SmoothRepresentationsOfLocalGroups:SR.6/excursion-invariant-comparison` · theorem. Proposed name: `SRPlan.excursionInvariantComparison`.

The excursion algebra maps to the finite-wild invariant cocycle ring by a universal homeomorphism, becomes an isomorphism after inverting ell and has nilpotent ell-torsion. The strong integral isomorphism requires ell not dividing the torsion order of the dual fundamental group. The reduced excursion algebra has finite Frobenius/reductive-subgroup restriction maps without that good-prime assumption.

Proof route. 1. Present cocycle rings as free-group colimits and compare invariants after coefficient extension. 2. Use the semisimple closed-orbit criterion for the universal-homeomorphism assertion. 3. For the reduced finiteness statement inject the reduced excursion ring into the invariant ring after rational comparison and use the finite Frobenius algebra as a noetherian coefficient subalgebra.

Inputs: [excursion-algebra](#excursion-algebra), [frobenius-quotient-finite](#frobenius-quotient-finite).

Source: [L. Fargues; P. Scholze](https://arxiv.org/pdf/2102.13459), Propositions VIII.3.5–VIII.3.7, pp. 287–290; DHKM Corollary 2.6, p. 10.

Acceptance. Reduced finiteness is the statement used by DHKM; do not strengthen it to unrestricted integral excursion-isomorphism.


<a id="geometric-hecke-action"></a>

#### The geometric Hecke action needed here

`SmoothRepresentationsOfLocalGroups:SR.6/geometric-hecke-action` · theorem. Proposed name: `SRPlan.geometricHeckeAction`.

For the Fargues–Scholze lisse derived category on Bun_G over ell-adic coefficients with the specified q-half, construct the exact monoidal, finite-set-compatible Hecke action with W_F^I descent, preservation of compact/ULA objects and a uniform finite-wild bound on each compact object. Its restriction to the trivial G-bundle stratum yields the smooth representation action used by DHKM. This is an actual geometric construction, not a tuple of assumed functors.

Proof route. 1. Construct the Hecke correspondences on Bun_G from the Fargues–Fontaine curve. 2. Use mixed-characteristic geometric Satake, the lisse sheaf formalism and fusion to obtain the finite-set-compatible action. 3. Prove compact/ULA preservation and apply a tensor-generator to obtain one wild bound for all representations and index sets.

Inputs: [excursion-algebra](#excursion-algebra), [geometric-trace-contract](#geometric-trace-contract), `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`.

Source: [L. Fargues; P. Scholze](https://arxiv.org/pdf/2102.13459), Theorem IX.0.1, pp. 318–319; Theorem IX.5.1, pp. 327–328.

Acceptance. The unresolved geometric bootstrap is an explicit gap; no higher-tier roadmap is used as an input.


<a id="excursion-center-action"></a>

#### Excursion action on the smooth categorical center

`SmoothRepresentationsOfLocalGroups:SR.6/excursion-center-action` · theorem. Proposed name: `SRPlan.excursionCenterAction`.

The finite-set Hecke action gives a ring map Exc(W,H) to the categorical center by S_(I,V,alpha,beta,gamma)=T_beta gamma T_alpha. The maps satisfy the free-group excursion relations, and every finitely generated smooth representation is acted on through some finite-wild quotient. No strong spectral-center/invariant-ring isomorphism is needed.

Proof route. 1. Use regular representation matrix coefficients to show the operator depends only on the invariant function. 2. Use external tensor products and fusion to prove multiplication and word-substitution relations. 3. Use relative-discrete ell-adic endomorphisms of a compact generator and pro-p wild inertia to obtain the finite quotient.

Inputs: [excursion-algebra](#excursion-algebra), [geometric-hecke-action](#geometric-hecke-action), `mathlib:CategoryTheory.CatCenter`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`.

Source: [L. Fargues; P. Scholze](https://arxiv.org/pdf/2102.13459), Theorem VIII.4.1, pp. 291–294; Theorem IX.5.1, pp. 327–328.

Acceptance. The map is natural on morphisms, so its image lies in CatCenter.


<a id="torus-central-compatibility"></a>

#### Torus and split-central compatibility

`SmoothRepresentationsOfLocalGroups:SR.6/torus-central-compatibility` · theorem. Proposed name: `SRPlan.torusCentralCompatibility`.

The excursion action for a torus agrees with the local class-field character action. The action is compatible with products, Weil restriction and homomorphisms inducing an adjoint-group isomorphism. In particular its restriction to the maximal split connected center of G agrees with the central character of a smooth cuspidal representation.

Proof route. 1. For induced tori compute the tautological Hecke modification and the local reciprocity character, then resolve general tori by induced tori. 2. Use product decomposition and Cartesian Hecke correspondences to compare the excursion operators under adjoint isomorphisms. 3. Apply the product and torus diagrams to the connected split center and compare its Bernstein action.

Inputs: [excursion-center-action](#excursion-center-action), `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group`, `ReductiveGroupsPartII:RG2.5`.

Source: [L. Fargues; P. Scholze](https://arxiv.org/pdf/2102.13459), Theorem IX.6.1, Propositions IX.6.2–IX.6.3 and Theorem IX.6.4, pp. 330–333; DHKM §3.1, p. 11.

Acceptance. Do not assert compatibility with every central component from the connected split-center argument alone.


<a id="parabolic-excursion-compatibility"></a>

#### Normalized parabolic excursion compatibility

`SmoothRepresentationsOfLocalGroups:SR.6/parabolic-excursion-compatibility` · theorem. Proposed name: `SRPlan.parabolicExcursionCompatibility`.

For normalized parabolic induction, the excursion action commutes with the dual-Levi restriction map. For unnormalized induction the ratio of the rho_G and rho_M cyclotomic twists is retained. The chosen delta_P^(1/2) normalization cancels that ratio in the normalized statement.

Proof route. 1. Reduce through inner forms and z-embeddings to a quasisplit group with connected center. 2. Move to sufficiently unstable bundle strata so bounded modifications preserve the Harder–Narasimhan parabolic. 3. Apply the constant-term Hecke correspondence, proper base change and Satake restriction; track the degree shift and cyclotomic twist. 4. Translate the geometric unnormalized action to the prescribed normalized induction.

Inputs: [excursion-center-action](#excursion-center-action), `SmoothRepresentationsOfLocalGroups:SR.2`, `ReductiveGroupsPartII:RG2.5`.

Source: [L. Fargues; P. Scholze](https://arxiv.org/pdf/2102.13459), Theorem IX.7.2 and Corollary IX.7.3, pp. 335–338; DHKM §3.1, p. 11.

Acceptance. The dual Levi map without the cyclotomic correction is the normalized formula only.


<a id="z-finite"></a>

#### Z-finite smooth representations

`SmoothRepresentationsOfLocalGroups:SR.6/z-finite` · definition. Proposed name: `SRPlan.ZFinite`.

For a Noetherian coefficient ring R, let Z_V be the image of the smooth categorical center in End_(R[G])(V). Say V is Z-finite if Z_V is a finite-type R-algebra and V^K is finite over Z_V for every compact open K. The image is used, rather than the full possibly infinitely generated center.

Proof route. 1. Construct the commutative center-image algebra via the categorical action. 2. Equip each invariant module with the induced image action. 3. Separate finite type of the image from finite generation of the invariant modules.

Inputs: `mathlib:CategoryTheory.CatCenter`, `mathlib:Representation.invariants`, `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`.

Source: [J.-F. Dat; D. Helm; R. Kurinczuk; G. Moss](https://arxiv.org/pdf/2203.04929v2), §3.2, Lemmas 3.1–3.3, pp. 11–12.

Uses. DHKM Theorem 1.2: Express the finite-over-center result for all finitely generated smooth objects.

API contracts:

- `SRPlan.ZFinite.image` (data): Z_V is the image subalgebra in equivariant endomorphisms.
- `SRPlan.ZFinite.invariants` (projection): Each compact-open invariant module is finite over Z_V.
- `SRPlan.ZFinite.subquotient` (compatibility): Over a Noetherian base, Z-finiteness passes to subquotients.

Definition tests:

- `SRPlan.ZFinite.zero` (degenerate): The zero representation is Z-finite.
- `SRPlan.ZFinite.scalarFinite` (characterisation): An admissible family with scalar center image and finite-type scalar image is Z-finite.
- `SRPlan.ZFinite.infiniteDirectSum` (non-example): An infinite direct sum of the trivial representation over a field is not Z-finite.


<a id="depth-generators"></a>

#### Depth projective generators and center criteria

`SmoothRepresentationsOfLocalGroups:SR.6/depth-generators` · theorem. Proposed name: `SRPlan.depthGenerators`.

A bounded-depth smooth block over p-invertible coefficients has a finitely generated projective generator built from compact pro-p induction. Z-finiteness of all finitely generated objects is equivalent to finite-over-finite-type-center behavior of the corresponding Hecke corners. The depth splitting and these generators are the integral Dat inputs; the compact-open corner comparison is supplied by SR.1.

Proof route. 1. Use compact induction and the pro-p idempotent to produce projective generators for each depth. 2. Express each finitely generated object as a quotient of a finite generator sum. 3. Identify the image of the category center on the generator with the relevant corner center and transfer finite-module conditions.

Inputs: [z-finite](#z-finite), `SmoothRepresentationsOfLocalGroups:SR.1`, `SmoothRepresentationsOfLocalGroups:SR.2`.

Source: [J.-F. Dat; D. Helm; R. Kurinczuk; G. Moss](https://arxiv.org/pdf/2203.04929v2), Lemma 3.2, pp. 11–12; Appendix inputs cited there to Dat (2009).

Acceptance. The cited integral depth construction remains a precise source-refinement gap.


<a id="cuspidal-embedding"></a>

#### Torsion-free projective cuspidal embeddings

`SmoothRepresentationsOfLocalGroups:SR.6/cuspidal-embedding` · theorem. Proposed name: `SRPlan.cuspidalEmbedding`.

A finitely generated projective smooth representation over the algebraic ell-adic coefficient base embeds into a finite direct sum of normalized parabolic inductions of finitely generated ell-torsion-free cuspidal Levi modules. This is proved by characteristic-zero cuspidal-support theory and stable lattices; it is not integral supercuspidal classification by assertion.

Proof route. 1. Invert ell and decompose the projective by characteristic-zero cuspidal support. 2. Choose integral stable lattices in the finitely many cuspidal factors. 3. Use finite generation to clear finitely many denominators and obtain the integral embedding; keep torsion-free lattices.

Inputs: [depth-generators](#depth-generators), `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`, `SmoothRepresentationsOfLocalGroups:SR.2a`.

Source: [J.-F. Dat; D. Helm; R. Kurinczuk; G. Moss](https://arxiv.org/pdf/2203.04929v2), Lemma 3.4, pp. 12–13.

Acceptance. Only projective generators need this embedding, not every smooth object.


<a id="cuspidal-excursion-finiteness"></a>

#### Excursion finiteness on cuspidal lattices

`SmoothRepresentationsOfLocalGroups:SR.6/cuspidal-excursion-finiteness` · theorem. Proposed name: `SRPlan.cuspidalExcursionFiniteness`.

For a finitely generated ell-torsion-free cuspidal lattice, the excursion action factors through the reduced finite-wild algebra: nilpotent ell-torsion acts trivially. Torus/central compatibility makes the lattice admissible over the relevant central-character excursion algebra. Reductive-subgroup restriction finiteness then transfers this finite-module property to parabolic inductions.

Proof route. 1. Use torsion-freeness to kill nilpotent ell-torsion excursion operators. 2. Compare the split-central action with the torus parameter algebra and the cuspidal invariant finiteness statement. 3. Apply finite reduced-excursion restriction and normalized parabolic compatibility to the embedding factors.

Inputs: [cuspidal-embedding](#cuspidal-embedding), [excursion-invariant-comparison](#excursion-invariant-comparison), [torus-central-compatibility](#torus-central-compatibility), [parabolic-excursion-compatibility](#parabolic-excursion-compatibility).

Source: [J.-F. Dat; D. Helm; R. Kurinczuk; G. Moss](https://arxiv.org/pdf/2203.04929v2), §3.3, pp. 13–14, proof of Theorem 1.2.

Acceptance. No unsupported equality of the full excursion ring with the invariant ring is used.


<a id="integral-center-finiteness"></a>

#### Integral finiteness over the center

`SmoothRepresentationsOfLocalGroups:SR.6/integral-center-finiteness` · theorem. Proposed name: `SRPlan.integralCenterFiniteness`.

If R is a Noetherian Z_ell-algebra with ell different from p, every finitely generated smooth R[G(F)] representation is Z-finite, and each Hecke algebra R[K backslash G(F) slash K] is a finite module over its finite-type R-center. Bounded-depth centers are finite over the corresponding reduced finite-wild excursion algebras.

Proof route. 1. First work over the algebraic integral ell-adic base and a torsion-free projective generator. 2. Embed into the cuspidal induction factors and inherit their finite excursion action on each invariant module. 3. The generator endomorphism algebra embeds in the endomorphisms of a finite invariant module over a Noetherian excursion algebra; deduce finite type of its center image. 4. Pass to finite quotients of generator sums, then use flat coefficient ascent and faithful-flat descent to handle R.

Inputs: [cuspidal-excursion-finiteness](#cuspidal-excursion-finiteness), [depth-generators](#depth-generators), [z-finite](#z-finite).

Source: [J.-F. Dat; D. Helm; R. Kurinczuk; G. Moss](https://arxiv.org/pdf/2203.04929v2), Theorems 1.1–1.2, p. 1; Corollary 3.5, p. 14.

Acceptance. The theorem is not stated over every Noetherian Z[1/p]-algebra.

Atlas planet: **Integral center finiteness**.


<a id="parabolic-center-map"></a>

#### The integral parabolic center map

`SmoothRepresentationsOfLocalGroups:SR.6/parabolic-center-map` · theorem. Proposed name: `SRPlan.parabolicCenterMap`.

For a Noetherian flat Z[1/p]-algebra R, there is a unique map Z_R(G) to Z_R(M) intertwining unnormalized parabolic induction. On bounded-depth centers over Z_ell, the Levi center is finite over the induced G-center action, with arbitrary Noetherian Z_ell coefficient extension as in DHKM §4.1.

Proof route. 1. Construct the map after rationalization via the characteristic-zero center. 2. Show it preserves lattices by faithful parabolic induction modulo ell and noetherian invariant control. 3. Use flat coefficient extension for the integral map and finite excursion restriction for the bounded-depth finite-module assertion.

Inputs: [integral-center-finiteness](#integral-center-finiteness), `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`.

Source: [J.-F. Dat; D. Helm; R. Kurinczuk; G. Moss](https://arxiv.org/pdf/2203.04929v2), Theorems 4.1 and 4.3; Lemma 4.2, pp. 14–15.

Acceptance. Flatness belongs to the general Z[1/p] center-map statement; do not erase it.


<a id="stable-operator"></a>

#### Stable contracting Hecke operators

`SmoothRepresentationsOfLocalGroups:SR.6/stable-operator` · definition. Proposed name: `SRPlan.StableOperator`.

For a module M and endomorphism T, stability means there exists c>=1 and a T-invariant direct summand I such that M=ker(T^c) direct sum I and T restricts to an automorphism of I. For a decomposed compact open K and a strictly P-positive central element lambda, use the Hecke operator T_lambda on V^K. The invertible summand maps canonically to the Levi compact-open Jacquet invariants.

Proof route. 1. Define stable nilpotent/invertible splitting intrinsically from the operator. 2. Use the positive-element Hecke localization description of Jacquet invariants. 3. Prove the splitting and Jacquet identification do not depend on the choice of sufficiently contracting lambda.

Inputs: `SmoothRepresentationsOfLocalGroups:SR.1`, `SmoothRepresentationsOfLocalGroups:SR.2`.

Source: [J.-F. Dat; D. Helm; R. Kurinczuk; G. Moss](https://arxiv.org/pdf/2203.04929v2), Definition implicit in Lemmas 4.5–4.7, pp. 15–16; Helm H1 Definition 11.9, p. 58.

Uses. DHKM Corollary 4.9: Establish uniform K,P stability over Z[1/p].

API contracts:

- `SRPlan.StableOperator.split` (characterisation): M is the direct sum of ker(T^c) and a T-invertible submodule for some positive c.
- `SRPlan.StableOperator.invertiblePart` (data): The stable image identifies with the localization M[T^-1].
- `SRPlan.StableOperator.dual` (compatibility): Stability passes to the injective-cogenerator dual with adjoint operator.

Definition tests:

- `SRPlan.StableOperator.nilpotent` (degenerate): A nilpotent T is stable with invertible part zero.
- `SRPlan.StableOperator.automorphism` (characterisation): An invertible T is stable with nilpotent part zero.
- `SRPlan.StableOperator.mixed` (computation): On M1 direct sum M2 with T nilpotent on M1 and invertible on M2, the stable invertible part is M2.

Atlas planet: **Stable Hecke operator**.


<a id="ell-adic-stability"></a>

#### Ell-adic admissibility and uniform stability

`SmoothRepresentationsOfLocalGroups:SR.6/ell-adic-stability` · theorem. Proposed name: `SRPlan.ellAdicStability`.

Finite-center control makes the Jacquet module of a bounded-depth compact pro-p projective generator admissible over the G-center. Consequently every such generator is K,P-stable. The nilpotence bound may be chosen independently of ell different from p by comparing its torsion-free characteristic-zero Hecke operator with the complex operator.

Proof route. 1. Use finite bounded-depth Levi center over G-center to obtain admissibility of the generator Jacquet module. 2. Apply the noetherian localization splitting lemma to its K-invariants. 3. Compare the same contracting operator after rationalization to the complex stabilization bound, then descend the bound to torsion-free ell-adic lattices.

Inputs: [integral-center-finiteness](#integral-center-finiteness), [parabolic-center-map](#parabolic-center-map), [stable-operator](#stable-operator), `SmoothRepresentationsOfLocalGroups:SR.2a`.

Source: [J.-F. Dat; D. Helm; R. Kurinczuk; G. Moss](https://arxiv.org/pdf/2203.04929v2), Lemmas 4.4–4.7, pp. 15–16.

Acceptance. Uniformity in ell is required to pass from individual ell-adic categories to all Z[1/p] modules.


<a id="cogenerators"></a>

#### Injective cogenerators across coefficient primes

`SmoothRepresentationsOfLocalGroups:SR.6/cogenerators` · theorem. Proposed name: `SRPlan.cogenerators`.

The smooth dual Hom_Zell(V,Q_ell/Z_ell) of a compact pro-p projective generator is an injective cogenerator for the appropriate ell-primary smooth category. Every simple Z[1/p] smooth representation embeds into one of these cogenerators; arbitrary objects admit resolutions by products across ell different from p. These duals use injective coefficient modules, not ordinary scalar duals.

Proof route. 1. Use injectivity of Q_ell/Z_ell and exact pro-p invariants to prove the smooth dual is injective. 2. Classify the coefficient annihilator of a simple module and choose the matching ell-primary dual generator. 3. Embed arbitrary modules in products of these cogenerators and iterate cokernels; retain the uniform stability bound.

Inputs: [depth-generators](#depth-generators), [ell-adic-stability](#ell-adic-stability), `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category`.

Source: [J.-F. Dat; D. Helm; R. Kurinczuk; G. Moss](https://arxiv.org/pdf/2203.04929v2), Lemma 4.8 and Corollary 4.9, p. 16.

Acceptance. Products are smooth products in the smooth category; an algebraic product need not be smooth.


<a id="jacquet-cogenerator-duality"></a>

#### Jacquet duality with the opposite parabolic

`SmoothRepresentationsOfLocalGroups:SR.6/jacquet-cogenerator-duality` · theorem. Proposed name: `SRPlan.jacquetCogeneratorDuality`.

For the smooth dual V-vee=Hom_Z[1/p](V,Q/Z[1/p])^smooth, stability gives R_P(V-vee) isomorphic to (R_oppositeP V)-vee. The pairing on compact-open invariants descends to the mutually adjoint invertible Hecke summands, and the isomorphism is natural.

Proof route. 1. Pair compact-open invariants by the injective coefficient dual and compare adjoint T_lambda and T_lambda^-1. 2. Pass to the stable invertible summands, identified with Jacquet invariants. 3. Take the cofinal system of decomposed compact opens and prove the natural opposite-parabolic pairing.

Inputs: [cogenerators](#cogenerators), [stable-operator](#stable-operator), `SmoothRepresentationsOfLocalGroups:SR.2`.

Source: [J.-F. Dat; D. Helm; R. Kurinczuk; G. Moss](https://arxiv.org/pdf/2203.04929v2), Corollary 4.10, p. 16.

Acceptance. The opposite parabolic is essential, and this duality is not replaced by an admissible field contragredient claim.


<a id="integral-second-adjointness"></a>

#### Second adjointness over p-invertible rings

`SmoothRepresentationsOfLocalGroups:SR.6/integral-second-adjointness` · theorem. Proposed name: `SRPlan.integralSecondAdjointness`.

For every commutative Z[1/p]-algebra R, unnormalized I_P is left adjoint to delta_P R_oppositeP. If a specified square root delta_P^(1/2) exists, normalized i_P is left adjoint to normalized r_oppositeP. Construct the natural Hom equivalence, its unit and counit and both triangle identities. No Noetherian or Z_ell-algebra hypothesis is imposed on this final adjunction.

Proof route. 1. Prove the Hom isomorphism first on injective-cogenerator duals using first Frobenius reciprocity and Jacquet duality. 2. Resolve arbitrary smooth objects by products of the dual generators and use uniform stability to extend the comparison. 3. Transfer the Z[1/p] adjunction to R-linear objects by compatibility with scalar actions. 4. Construct unit and counit from the natural Hom equivalence and verify the triangles; translate twists to normalized functors only after choosing delta-half.

Inputs: [jacquet-cogenerator-duality](#jacquet-cogenerator-duality), `SmoothRepresentationsOfLocalGroups:SR.2`.

Source: [J.-F. Dat; D. Helm; R. Kurinczuk; G. Moss](https://arxiv.org/pdf/2203.04929v2), Corollary 1.3, p. 2; end of §4.2, p. 16.

Acceptance. For P=G the adjunction is the identity. The unnormalized right adjoint is delta_P R_oppositeP, not R_P.

Atlas planet: **Integral second adjointness**.


<a id="integral-noetherian-consequences"></a>

#### Integral Noetherian consequences

`SmoothRepresentationsOfLocalGroups:SR.6/integral-noetherian-consequences` · theorem. Proposed name: `SRPlan.integralNoetherianConsequences`.

For a Noetherian Z[1/p]-algebra R, the relevant Hecke algebras are Noetherian, induction preserves projectives and finite generation, and Jacquet functors preserve admissibility. An irreducible Qbar_ell representation is integral exactly when its supercuspidal support is integral. Finite-over-center remains the stronger Z_ell-algebra theorem already stated.

Proof route. 1. Use second adjointness and the exact opposite Jacquet functor for projectivity. 2. Use the established depth generators and Hecke stabilization for noetherianity and admissibility transfer. 3. Compare induction lattices and Jacquet support for the irreducible integrality criterion.

Inputs: [integral-second-adjointness](#integral-second-adjointness), [integral-center-finiteness](#integral-center-finiteness), `SmoothRepresentationsOfLocalGroups:SR.2`, `SmoothRepresentationsOfLocalGroups:SR.3`.

Source: [J.-F. Dat; D. Helm; R. Kurinczuk; G. Moss](https://arxiv.org/pdf/2203.04929v2), Corollaries 1.4–1.6, pp. 2–3.

Acceptance. Noetherianity over Z[1/p] is not mislabeled finite over its center.


<a id="cuspidal-reduction-consequences"></a>

#### Cuspidal reduction and generic irreducibility

`SmoothRepresentationsOfLocalGroups:SR.6/cuspidal-reduction-consequences` · theorem. Proposed name: `SRPlan.cuspidalReductionConsequences`.

For an irreducible integral ell-adic representation, cuspidality of its reduction implies cuspidality of the characteristic-zero representation. For an irreducible cuspidal Levi representation, induction is irreducible on a nonempty open set of unramified characters in the coefficient setting of DHKM Corollary 4.12, and the associated parabolic inductions have the stated common Grothendieck-class comparison.

Proof route. 1. Commute Jacquet reduction with coefficient change and use lattice nonvanishing to detect noncuspidality. 2. Use finite endomorphism control over the unramified character torus and characteristic-zero generic irreducibility to descend a nonempty open locus.

Inputs: [integral-second-adjointness](#integral-second-adjointness), [integral-noetherian-consequences](#integral-noetherian-consequences).

Source: [J.-F. Dat; D. Helm; R. Kurinczuk; G. Moss](https://arxiv.org/pdf/2203.04929v2), Corollaries 4.11–4.12, pp. 16–17.

Acceptance. The statement is generic irreducibility on an open locus, not all unramified twists.


## Cross-stage acceptance

For a split torus, the spherical transform is the Laurent group-algebra identity, the pseudoroot is one, the parameter dictionary is evaluation on a uniformizer, and both parabolic functors reduce to the identity. This checks the common normalizations across SR.4 and SR.6 rather than only one coefficient formula.

Over characteristic zero, a GL_2 normalized unramified principal series has its standard hyperspecial fixed line and the eigenvalue q^(1/2)(alpha_1+alpha_2) for the minuscule Hecke operator. Its top derivative is a line. A GL_2 Steinberg representation instead has nonzero Whittaker quotient and no hyperspecial fixed vectors, while its Iwahori fixed line carries the sign eigenvalue -1 for the simple generator. These tests prevent genericity from being identified with sphericity, or co-Whittaker rank-one derivative from being identified with a rank-one fixed module at every level. The field hypotheses and special reducibility cases must be retained when importing these examples from SR.2/SR.3.

A compact pro-p induction over p-invertible coefficients is the projective-generator test for the Hecke-corner and contracting-operator contracts. It need not be admissible over the coefficient ring: SR.6 asserts finite invariants over the appropriate finite-type center image. The nilpotent, invertible and mixed operator examples distinguish stabilization from global invertibility. The final adjunction is checked through its natural Hom equivalence and both triangle identities, using the opposite parabolic and the unnormalized modulus.

For a finite p-group over F_p, invariants fail to be exact; the averaging denominator is unavailable. This imported SR.1 test is a mandatory guard against transferring either the ell-not-p derivative exactness or the integral adjunction proof to characteristic p. For the unitary spherical counts, direct enumeration over F_4 gives 3 maximal isotropic lines in dimension 2, 9 in dimension 3, and 27 maximal isotropic planes in dimension 4. Thus the even dimension-4 count is (2+1)(2^3+1), detecting the incorrect second factor. These finite checks do not close the general classical count gap.

## Suggested Lean scope

The suggested file imports individual Mathlib modules at the pinned commit. Proof bodies are omitted; none of the declarations is an implementation. The table specifies the omitted conditions rather than hiding them in a Prop-valued field. The file also lists every unavailable full signature by its proposed name in an explicitly unelaborated comment inventory. These names do not become Lean declarations through compilation.

| Object | Executable prototype and limit |
| --- | --- |
| `SRPlan.satakeTransform` | Finite coefficient-matrix linear map only; actual N integral, local reductivity, hyperspecial K, convolution multiplicativity and ring equivalence await G-SATAKE-CARRIER. |
| `SRPlan.parabolicDescent` | Finite coefficient-matrix composition and compatibility square; actual Levi/constant-term carrier and xi variable substitution await G-SATAKE-CARRIER. |
| `SRPlan.Pseudoroot` | Actual square and twisted-fixed equations for a group action; identification of the twist with dual roots and the characteristic-two case awaits RG2.1/RG2.5. |
| `SRPlan.PairedParameter` | Actual tuple-of-units definition, reciprocal polynomial and product-ring counterexample; dual unitary identification is a mathematical contract. |
| `SRPlan.UnitaryGenericity` | The four polynomial predicates and change-of-ring/non-example signatures are executable. Their parity and unitary-local interpretation remain mathematical contracts. |
| `SRPlan.SpinPolynomial` | Actual polynomial and fixed degree-four reflection. Arbitrary coefficients permit a smaller degree, so reflect 4 is used; identification with invertible spherical generators awaits the Hecke/local carrier. |
| `SRPlan.HallLittlewood` | Actual rational evaluation, symmetry, homogeneity, nonnegative dominant polynomiality and separated-variable tests. Universal Laurent cancellation/specialization at collisions is omitted in G-HL-COUNT. |
| `SRPlan.WhittakerCoinvariants` | Actual untwist using inverse units and the existing ordinary quotient, universal linear map and arbitrary-module tensor relation quotient. GL_n nondegenerate-character identification awaits SR.2. |
| `SRPlan.BZDerivative` | Actual common-category endofunctor iteration, with natural isomorphisms supplied as data and existence results wrapped in Nonempty. The rank-changing mirabolic functors, true top-derivative identification and induction test await SR.2/G-MODULAR-TYPES. |
| `SRPlan.SchwartzSubmodule` | Actual range of a supplied linear map, injectivity-to-range equivalence, identity-range and zero-range tests. Canonical mirabolic map, derivative, endomorphism and tensor contracts are omitted. |
| `SRPlan.EssentiallyAIG` | Actual socle containment, absolute simplicity after field extension, Whittaker quotient and locally finite-length formula; includes zero and two-generic-summand non-examples. GL_n scalar endomorphism contract is omitted. |
| `SRPlan.CoWhittaker` | Actual smooth/admissible/free-line/all-prime-fiber formula with smooth duals; derivative, prime fibers, two-copy and nongeneric tests are executable. Scalarity and the field-cosocle characterization need the GL_n package. |
| `SRPlan.UniversalWhittaker` | Locally constant psi-equivariant functions with compact support modulo U; the block idempotent, action/smoothness comparison, projectivity and all six block API/test signatures are omitted. |
| `SRPlan.CrossedCocycle` | Actual crossed equation, gauge and equivariant map, identity/coboundary/trivial-action tests. Scheme representability and ell-adic continuity are separate unelaborated theorem contracts. |
| `SRPlan.ExcursionDatum` | Actual diagonal-fixed matrix-coefficient data and multiplication calculation. The free-group colimit algebra, finite Weil component and all actual Hecke operators are omitted in G-GEOMETRIC-ACTION. |
| `SRPlan.ZFinite` | Actual finite-type-algebra and compact-open invariant-module predicate for a supplied commutative action. Constructing the actual categorical-center image, subquotients and infinite-sum test is omitted. |
| `SRPlan.StableOperator` | Actual nilpotent/invertible decomposition and nilpotent, automorphism and mixed-product tests. Jacquet/localization identification and cogenerator-dual comparison are omitted. |

There are 72 omitted full signatures: 53 node-level contracts, 11 API contracts and 8 tests. Each is listed in `suggestedLean.omittedSignatures` in the packet. Adapter signatures that exist are still narrower than the complete mathematical statement in this reader. In particular `BZDerivative.top` fixes iteration order and does not prove the GL_n top-Whittaker comparison. `SchwartzSubmodule.rankOne` checks an identity map range and does not construct the canonical GL_1 mirabolic map. Their full comparisons must be supplied before a stage is closed.

## Dependencies, refinement and closure

The following requests are imports, not new copies of the suppliers. A missing requested export needs reconciliation with its owner. The geometric minimum required by SR.6 instead moves down under the current worker-tier rule.

| Supplier | Required export |
| --- | --- |
| `SmoothRepresentationsOfLocalGroups:SR.0:abelian-category` | The smooth abelian category, smooth subobjects/products, compact-open invariants and admissibility; keep its enhanced derived successor separate. |
| `SmoothRepresentationsOfLocalGroups:SR.1` | Finite-sum convolution and comparison with the existing double-coset ring; valid pro-p idempotents; corrected integral Iwahori quadratic relations and positive braid monoid. |
| `SmoothRepresentationsOfLocalGroups:SR.2` | Smooth and compact induction, normalized and unnormalized Jacquet functors, exactness for p-invertible coefficients, mirabolic closed-subgroup induction and the geometric lemma. |
| `SmoothRepresentationsOfLocalGroups:SR.2a` | The characteristic-zero second adjunction and contracting-operator stabilization, independent of SR.6. |
| `SmoothRepresentationsOfLocalGroups:SR.3` | Characteristic-zero Bernstein decomposition, admissible duality, cuspidal support and integral stable lattices when the cited field theory applies. |
| `ReductiveGroupsPartII:RG2.1` | Relative roots, relative Weyl group, folded rank-one root subgroups and positive-root modulus. |
| `ReductiveGroupsPartII:RG2.4` | Iwasawa and Cartan decompositions, torus valuation lattice and finite root-subgroup indices for hyperspecial K. |
| `ReductiveGroupsPartII:RG2.5` | Pinned integral dual group with its finite Weil action and relative Frobenius torus data. |
| `tauceti:TauCetiRoadmap/ModularForms#layer-2-hecke-operators-and-the-hecke-algebra` | Existing arithmetic GL_n Hecke multiplication, local p-integral comparison and central-coset localization, as assigned by RS-21; no all-n Satake theorem is assumed. |
| `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-9-the-local-weil-group` | Local Weil group, wild/tame exact sequences, arithmetic/geometric Frobenius and torus reciprocity. |
| `tauceti:TauCetiRoadmap/ReductiveGroups#layer-7-structure-theory` | Reductive torus/normalizer structure and highest-weight Weyl-module traces; integral twisted invariant refinements remain G-INTEGRAL-GIT. |
| `tauceti:TauCetiRoadmap/ReductiveGroups#layer-3-subgroups-quotients-components` | Central quotient group schemes for the characteristic-not-two c-group. |
| `tauceti:TauCetiRoadmap/ReductiveGroups#layer-9-pinned-chevalleydemazure-group-schemes-over-ℤ` | Pinned split integral dual group and its finite-action automorphisms. |

The remaining work is finite and explicit, but the number of nodes required by a gap is not yet estimated as small. A gap closes only when its prerequisite statements, own definitions, API and tests have been refined and verified; writing a convenient abstract action interface is insufficient.

### G-SATAKE-CARRIER: Local reductive carrier and full Satake signatures

SR.0–SR.2 and RG2.4 must supply the actual smooth carrier, finite-sum measure comparison and local reductive decompositions. The suggested file gives the integral finite-sum coefficient and descent interfaces but omits reductivity, hyperspeciality and the all-n geometric count that cannot yet be expressed with the imported baseline types. A complete ring-isomorphism signature must be added when these requested carriers exist.

Immediate consumers: [satake-transform](#satake-transform), [parabolic-descent](#parabolic-descent).

### G-HL-COUNT: Classical Hall–Littlewood and unitary count proofs

Leslie cites Macdonald and Minguez; Liu cites Xiao–Zhu for the triangular Satake matrix. The target formulas, recurrence proof routes and coefficient tests are planned here. The direct elementary-divisor/isotropic-flag proofs and universal integrality of Hall–Littlewood specialization still need a primary open-source proof refinement; no uncleared book was read and geometric Satake is not used as an upward input.

Immediate consumers: [macdonald-formula](#macdonald-formula), [unitary-triangular-transform](#unitary-triangular-transform).

### G-MODULAR-TYPES: Integral type envelopes and modular classification

Refine Helm H1 §§4–10 and the Minguez–Secherre modular multisegment inputs cited in Helm Theorem 4.8 into definition/API/test nodes. The projective-envelope and saturated-center statements are read at their source locators, but the finite-group projective envelopes, type covers and aperiodic multisegment classification are not claimed closed.

Immediate consumers: [integral-blocks](#integral-blocks), [type-projectives](#type-projectives).

### G-ESSENTIAL: Integral essential-vector theorem

A free top derivative alone does not provide a canonical level vector. Establish a sourced GL_n integral essential-vector statement with precise Noetherian/reduced/torsion and compact-level hypotheses. RS-21 assigns the GL_2 field newvector theorem to R16.2 and the Fouquet–Wan minimal-lift line to AutomorphicCongruences:L3; retain only the general family export here.

Immediate consumers: [essential-vector-contract](#essential-vector-contract).

### G-INTERPOLATION: Integral Bernstein interpolation beyond the selected 2012 source

Helm arXiv:1210.1789v1 proves existence only conditionally on Conjecture 7.4. If the desired export is unconditional local-Langlands families, read and decompose the downstream Helm–Moss interpolation theorem and its dependencies; do not turn this conjecture into a theorem.

Immediate consumers: [llc-family-conditional](#llc-family-conditional).

### G-GEOMETRIC-ACTION: Geometric bootstrap for the actual Hecke action

The finite-set action requires the Fargues–Fontaine curve, Bun_G strata and Hecke correspondences, solid/lisse sheaves and ULA finiteness, six-functor base change and mixed-characteristic geometric Satake/fusion. The precise action, finite-wild, torus/adjoint-map and parabolic theorem contracts are outlined here from FS VIII.4 and IX.0–IX.7. A future refinement must move down and construct the minimum packages under the current tier rule; no EnhancedDerivedSheaves, parameter-stack or spectral-action stage is cited upward. The suggested file does not replace these objects by an assumed Prop-valued Hecke-action field.

Immediate consumers: [geometric-hecke-action](#geometric-hecke-action), [excursion-center-action](#excursion-center-action).

### G-INTEGRAL-GIT: Integral twisted quotient and wild strata proofs

Refine the reductive centralizer strata, integral twisted Chevalley–Steinberg and completely-reducible closed-orbit results, and the universal ell-adic extension proof of DHKM parameters §4. Finite presentation and the torus-isogeny reduction are outlined; a field-only GIT statement is not sufficient for integral finiteness.

Immediate consumers: [wild-strata](#wild-strata), [twisted-component-finiteness](#twisted-component-finiteness), [ell-adic-extension](#ell-adic-extension).

### G-DEPTH: Integral depth generators

Read the Dat (2009) appendix invoked in DHKM Lemma 3.2 and decompose its integral depth projectors and finite projective generators. The earlier smooth category and compact induction do not alone prove this bounded-depth generation statement.

Immediate consumers: [depth-generators](#depth-generators).

## Sources and version control

All locators above refer to the following pinned source editions, accessed on 2026-10-09. The packet records the PDF SHA-256 for each. Printed pages are used unless the edition or locator explicitly says author PDF or PDF pages. No source passage is reproduced. Sources invoked inside these works are not treated as read proofs: the modular classification, classical count, depth-generator and geometric bootstrap refinements remain recorded gaps. No uncleared book was used.

- **tv**: D. Treumann; A. Venkatesh, [Functoriality, Smith theory, and the Brauer homomorphism](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p04-p.pdf). Annals of Mathematics 183 (2016), 177–215; published PDF. Target reading: §7.1–7.5, pp. 204–211.

- **tvpre**: D. Treumann; A. Venkatesh, [Functoriality, Smith theory, and the Brauer homomorphism: c-group formulation](https://arxiv.org/pdf/1407.2346v1). arXiv:1407.2346v1, 9 July 2014; separate earlier formulation. Target reading: §7.8–7.9, pp. 29–31; Theorem 7.9.

- **leslie**: S. Leslie, [The endoscopic fundamental lemma for unitary Friedberg–Jacquet periods](https://arxiv.org/pdf/1911.07907v3). arXiv:1911.07907v3 author preprint; locators use this version, not Annals pagination. Target reading: §3.1, pp. 22–25, including Lemma 3.2.

- **liu**: Y. Liu; Y. Tian; L. Xiao; W. Zhang; X. Zhu, [On the Beilinson–Bloch–Kato conjecture for Rankin–Selberg motives](https://par.nsf.gov/servlets/purl/10323568). Inventiones Mathematicae 228 (2022), 107–375; published PDF. Target reading: Notation 1.3.1, pp. 119–120; §3.1, pp. 139–142; Appendix B.1–B.4, pp. 331–346.

- **cg**: F. Calegari; D. Geraghty, [Modularity lifting beyond the Taylor–Wiles method](https://math.uchicago.edu/~fcale/papers/CG.pdf). Author PDF of Inventiones Mathematicae 211 (2018), 297–433. Target reading: §9.4.1, Lemmas 9.9–9.15 and Theorem 9.16, PDF pp. 123–127.

- **venkatesh**: A. Venkatesh, [Derived Hecke algebra and cohomology of arithmetic groups](https://arxiv.org/pdf/1608.07234v3). arXiv:1608.07234v3. Target reading: §3, pp. 21–26, Theorem 3.3; §4, pp. 26–31, Lemmas 4.5 and 4.7.

- **pilloni**: V. Pilloni, [Higher coherent cohomology and p-adic modular forms of singular weights](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/complexhidatheorygsp4.pdf). Author PDF for Duke Mathematical Journal 169 (2020), 1647–1807. Target reading: §5.1.3–5.1.5, author PDF pp. 21–22.

- **cg20**: F. Calegari; D. Geraghty, [Minimal modularity lifting for nonregular symplectic representations](https://www.math.uchicago.edu/~fcale/papers/Siegel.pdf). Author PDF for Duke Mathematical Journal 169 (2020), 801–896. Target reading: §6.1, Definition 6.7, author PDF pp. 38–39.

- **ct**: L. Clozel; J. Thorne, [Level-raising and symmetric power functoriality, III](https://www.dpmms.cam.ac.uk/~jat58/lrspiii.pdf). Accepted author PDF, 10 December 2015, Compositio Mathematica 153 (2017). Target reading: §2.1, author PDF pp. 4–8; Bernstein presentation and center.

- **helm**: D. Helm, [Whittaker models and the integral Bernstein center for GL_n](https://arxiv.org/pdf/1210.1789). arXiv:1210.1789v1, 5 October 2012. Target reading: §§2–7, pp. 3–17; Definitions 3.3 and 6.1, Theorems 5.2 and 6.3, conditional Theorem 7.8.

- **helmcenter**: D. Helm, [The Bernstein center of the category of smooth W(k)[GL_n(F)]-modules](https://arxiv.org/pdf/1201.1874). arXiv:1201.1874v3, 16 May 2016. Target reading: Definition 4.12, pp. 13–14; §§10–12, pp. 53–69, especially Theorems 10.9, 11.8, 11.17, 12.8 and 12.9.

- **eh**: M. Emerton; D. Helm, [The local Langlands correspondence for GL_n in families](https://arxiv.org/pdf/1104.0321). arXiv:1104.0321 v1, 2 April 2011; locators use its printed pages. Target reading: §3.1, pp. 12–17; §3.2, pp. 17–24, Theorem 3.2.13; §6.2–6.3, pp. 48–52.

- **nakamura**: K. Nakamura, [Zeta morphisms for rank two universal deformations](https://link.springer.com/content/pdf/10.1007/s00222-023-01203-7.pdf). Inventiones Mathematicae 234 (2023), author/publisher PDF. Target reading: Appendix B, Proposition B.10 and its proof, pp. 274–275.

- **aky**: H. Atobe; S. Kondo; S. Yasuda, [Local newforms for the general linear groups over a non-archimedean local field](https://arxiv.org/pdf/2110.09070v4). arXiv:2110.09070v4, 28 September 2022. Target reading: Introduction and §2.3, pp. 2–3 and 8; highest derivative convention.

- **dhkm**: J.-F. Dat; D. Helm; R. Kurinczuk; G. Moss, [Finiteness for Hecke algebras of p-adic groups](https://arxiv.org/pdf/2203.04929v2). arXiv:2203.04929v2, 22 April 2022. Target reading: §§1–4, pp. 1–16, including Theorem 1.7, Lemmas 2.2, 2.8, 3.4, 4.7–4.8, Corollary 4.10.

- **dhkmparameters**: J.-F. Dat; D. Helm; R. Kurinczuk; G. Moss, [Moduli of Langlands parameters](https://arxiv.org/pdf/2009.06708). arXiv:2009.06708v3, 29 February 2024. Target reading: §§1.2 and 2.1–2.3, pp. 4–6 and 10–12; Proposition 1.2; Theorem 4.1 and Corollary 4.2 used as explicitly unrefined prerequisites.

- **fs**: L. Fargues; P. Scholze, [Geometrization of the local Langlands correspondence](https://arxiv.org/pdf/2102.13459). arXiv:2102.13459v4, 27 November 2024. Target reading: §VIII.3–VIII.4, pp. 285–296; Theorems IX.0.1, IX.5.1, IX.6.1, IX.6.4, IX.7.2 and Corollary IX.7.3, pp. 318–319, 327–338.
