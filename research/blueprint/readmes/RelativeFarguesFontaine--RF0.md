# Foundations of adic spaces, Part II: relative Fargues–Fontaine curves and period geometry

The relative Fargues–Fontaine curve packages a perfectoid space in characteristic p together with all its coefficient-field untilts. Its integral period space retains the characteristic-p divisor; its generic period domain admits a free Frobenius action; and its quotient supports the line bundles whose sections form the homogeneous coordinate algebra. These constructions provide the period geometry used by geometric Satake, modifications of bundles, local de Rham rings and relative p-adic Hodge theory. The aim is a reusable library of coefficients, analytic charts, divisor ideals and comparisons, with the different topologies and coefficient conventions stated at each interface.

This roadmap extends the upstream **AdicSpaces** roadmap. Upstream's rational localization, valuation spectra, sheaf gluing and absolute Fargues–Fontaine endpoints are inputs. Its absolute interval rings are compared with the specialization of the relative rings as complete Huber pairs. The all-E integral and relative sheaf extensions are the new work; generic localization, completion and descent machinery remain with their owners. **LocalFieldsRamification** supplies the coefficient-field and inertia background. Its Part II extension supplies the additional Lubin–Tate formal-group and Cohen-ring inputs identified below. Neither upstream document is replanned here.

The scope consists of RF0, RF0:integral-Y, RF0:annuli, RF1, RF2, RF2:integral-divisors, RF2:untilts and RF3. RF2 is the aggregate realized by the divisor and untilt targets. RF0 collects the coefficient and period-domain interfaces without placing an aggregate prerequisite back on its own coefficient prefix. General vector bundles belong to RF4 and **VectorBundlesAndIsocrystals**. The arbitrary-rank isocrystal functor and general bundle cohomology belong to VB1; global generation, algebraic comparison and tautological twists belong to VB2:ampleness; degree-one moduli properness and cohomological smoothness belong to VB3:general-BC. These are definite ownership boundaries. Every incoming need is either an exact existing node or a precise requested stage.

## Conventions and mathematical order

Fix a complete discretely valued field E, a uniformizer π, and finite residue field F_q of characteristic p, where q=p^f. Mixed characteristic means E is a finite extension of Q_p; equal characteristic means E≃F_q((π)). Write O_E for the valuation ring. Fix an affinoid perfectoid base S=Spa(R,R⁺) over F_q and a topologically nilpotent unit ϖ∈R⁺. General bases are handled by affinoid open gluing. Every comparison preserves the marking of the tilt and the coefficient-field embedding. A Frobenius orbit of an unmarked untilt is insufficient to identify a specific theta map.

For arbitrary O_E-algebras in mixed characteristic, ramified Witt coordinates are defined by universal integral polynomials. The ghost map is injective only under the torsion-free hypothesis used in the Dwork argument. For a perfect residue algebra, the strict coefficient lift is π-adically complete and flat and admits a unique Teichmüller expansion. These are different levels of generality. The scalar extension W(R)⊗O_E uses the maximal unramified coefficient ring as tensor base. In equal characteristic the perfect strict lift is R[[π]]. Teichmüller is multiplicative in the ordinary Witt theory; the Q-twisted section need not be multiplicative, and a Lubin–Tate section respects its formal-group law instead of ordinary addition.

The integral coefficient ring W=W_O_E(R⁺) has the (π,[ϖ])-adic topology. Its integral period space is

\[
\mathcal Y_S=\operatorname{Spa}W\setminus V([\varpi]).
\]

The ideal (π) is retained. On the rational chart |π|ⁿ≤|[ϖ]|≠0, the ring is the rationally completed W⟨πⁿ/[ϖ]⟩[1/[ϖ]], with plus ring given by the prescribed integral closure. These chart rings are Tate rings because [ϖ] becomes a topologically nilpotent unit. No assertion that the unlocalized two-generator adic ring is Tate is needed. The coefficient map O_E→W need not be adic, which is why the integral completed tensor requires a specified extension of the generic R0 interface.

For E_root∞, the completion of E(π^(1/p^∞)), the n=1 chart uses compatible roots of the **whole** ratio π/[ϖ]. Put π_m=π^(1/p^m), v_m=[ϖ]^(1/p^m) and s_m=π_m/v_m. Then π_m=v_ms_m and s_(m+1)^p=s_m. The perfected tilted chart coordinate satisfies t₁^sharp=π/[ϖ] and |t₁|≤1. Its global open-disc coordinate is t=ϖt₁. On the common boundary |π|=|[ϖ]|=c<1, every s_m has norm one; π_m/[ϖ] would have norm c^(1/p^m−1)>1. At π=0 the valid coordinate vanishes, while the reciprocal [ϖ]/π is undefined. The algebraic reduction and integral perfectoid criterion must be checked before invoking the sheaf result. A continuous splitting as a topological module suffices for the sheaf descent argument; a ring retraction is not claimed.

The whole analytic p-typical A_inf locus is a separate object:

\[
Z_S=\operatorname{Spa}(W(R^+),W(R^+))\setminus V(p,[\varpi])
     =D(p)\cup D([\varpi]).
\]

It includes both the integral end p=0,[ϖ]≠0 and the crystalline end [ϖ]=0,p≠0. Kedlaya's algebraic/analytic bundle comparison uses this whole locus. It does not identify it with the generic period domain, and it does not imply that relative bundles are free. Strong noetherianity and the principal-ideal-domain statements for the valued-field integral space are requested from the classification owner, with their exact field hypotheses.

The generic domain is Y_S=𝒴_S∖V(π). For a point x, evaluate the radius at its rank-one maximal generalization:

\[
\operatorname{rad}_{\varpi}(x)=\frac{\log|[\varpi](x)|}{\log|\pi(x)|},
\qquad \operatorname{rad}_{\varpi}(\phi x)=q\operatorname{rad}_{\varpi}(x).
\]

Rational inequalities, rather than only this real-valued radius, define opens at points of higher rank. A closed interval [a,a] is a valid boundary annulus. Replacing ϖ by ϖ^m multiplies the radius by m and gives cofinal refinements of the annular basis; it does not preserve the numerical label of every individual interval.

The relative extended Robba theory starts with a perfect uniform Banach F_p-algebra and its adic plus ring. The coefficient-growth subrings, bounded localizations, interval Banach completions, unions, Fréchet limits and plus-growth variants are distinguished throughout. All twelve rational-basis presheaves are sheaves. The nine acyclic variants and the three Kiehl assertions are listed exactly in their nodes. A statement for one variant must not be spread to the remaining variants by changing notation. In particular, R̃⁺ and R̃^∞ can differ even on a Teichmüller element. The all-E extension must carry the norm estimates through the actual coefficient comparison; replacing p by π in a formula is an open proof obligation.

A bounded coefficient map induces a map on period spectra by restriction of valuations along the multiplicative Teichmüller section. This construction does not require that Teichmüller be additive. Berkovich deformation retracts the period spectrum onto the coefficient spectrum and an exponent interval; the Frobenius quotient has a circle of exponents. This is a statement about the Berkovich quotient, not an adic product decomposition. The period-spectrum surjectivity theorem retains spectral surjectivity as its hypothesis, without replacing it by a tensor-flatness assertion.

## The quotient and effective divisors

Frobenius acts freely and totally discontinuously on Y_S. Its q-scaled radius supplies translate-disjoint windows, and Y_[1,q] presents the quotient by identifying the two boundary charts. This constructs the analytic adic curve X_S=Y_S/φ^Z. The diamond descriptions

\[
\mathcal Y_S^\diamond\simeq S\times\operatorname{Spd}O_E,
\quad Y_S^\diamond\simeq S\times\operatorname{Spd}E,
\quad X_S^\diamond\simeq(S\times\operatorname{Spd}E)/(\phi_S^{\mathbb Z}\times1)
\]

supply its continuous qcqs projection to |S|. Functorial maps X_T→X_S exist for maps T→S. They do not supply an adic structural morphism X_S→S. Openness and closedness of the continuous projection follow from the VB3-owned degree-one moduli theorem; they are not a prerequisite of the early quotient construction. The global relative period sheaves also have an étale-topos functoriality, preserving étale and finite étale base maps.

A marked O_E-untilt has a ramified theta map with a principal regular kernel. Locally its generator has the form ξ=π−a[ϖ]. This includes the characteristic-p untilt, with ξ=π. The all-E construction and its analytic lower bound are established before taking products. On a suitable neighborhood, normalize |[ϖ]|=q^−1; multiplication by ξ satisfies ‖ξb‖≥q^−n‖b‖. Its image is closed, so the algebraic quotient is the completed untilt algebra. P1's p-typical primitive correspondence is imported only after matching the marking, ring, theta map, plus ring and topology.

Ordered d-tuples have product equation ∏ξ_i. Repeated legs give repeated factors: two equal legs have ideal (ξ²), not (ξ). Passing to unordered legs uses the symmetric quotient in v-sheaves and ordinary effective descent of the invertible ideal and its inclusion. A local product generator need not descend as a global function. The action stack retains permutation stabilizers at repeated tuples; the divisor moduli object is the sheaf of orbit classes. Degree zero gives the terminal sheaf and the empty divisor. Divisors on X use the actual RF1 quotient, with the Frobenius orbit taken on each generic leg.

The geometric degree criterion counts fibre lengths, including multiplicities and the characteristic-p point. Its early all-E converse requires a local factorization argument independent of global bundle classification. Fargues' checked generic proof uses Picard and Banach–Colmez results, so that proof alone cannot close the early integral target. The exact missing factorization input is recorded as a gap. The construction from ordered legs, regularity of products and ordinary line descent are independent of that converse.

For an effective divisor with ideal I_D, define the local ambient completion

\[
B_D^+=\varprojlim_n\mathcal O_{\mathcal Y}/I_D^n,
\]

and form B_D by inverting its completed invertible ideal locally and gluing. The ambient ring is completed, rather than the quotient O_D being completed at its zero ideal. Generator changes ξ↦uξ preserve the ideal and its powers. The ξ-adic and ξ²-adic completions are canonically the same by cofinality, whereas their first quotients and labelled filtrations differ. Comaximal divisors admit completed Chinese-remainder products; equal legs do not. At a characteristic-p integral leg the π-adic completion is the ramified coefficient ring, which is distinct from plugging a characteristic-p ring into Mathlib's absolute de Rham construction.

The degree-one moduli sheaf over Perf_(F_q) is Spd(E)/φ^Z. Over Perf_k for k=F̄_q it becomes Spd(Ĕ)/φ^Z, where Ĕ is the completed maximal unramified coefficient extension. This coefficient-base change must be stated explicitly. Div¹ is a moduli sheaf over the coefficient base; it is not the diamond of one fixed curve X_C. Spatial representability, properness, cohomological smoothness and the resulting open/closed projection belong to VB3:general-BC, which consumes the curve product formula.

For the Q_p-affinoid comparison, take a perfectoid affinoid (A,A⁺) over any characteristic-zero perfectoid field (K,K⁺). Identify A^flat+ with the pinned PreTilt A⁺ p, localize the same theta map, and identify its Cartier ideal before applying the R06.1 affinoid period theorem. Finite mixed-characteristic E requires one further step: finite separability lifts the chosen E-action through the nilpotent quotients of the complete p-typical ring, and the untilt embedding selects the relevant coefficient factor. The entire tensor extension may have more than that one factor. Equal characteristic and general bases use the intrinsic divisor construction and quotient-system v-descent.

The conormal line I_D/I_D² controls the filtration. Its tensor powers identify the successive graded pieces. A chosen frame ξ gives ξ^mO_D in degree m, and replacing ξ by uξ scales that frame by u^m. The intrinsic line need not be globally trivial. At a single geometric generic leg B_D⁺ is a complete DVR with residue C^sharp, and B_D is its fraction field. A ring attached to several legs is not automatically a DVR. Completion base change is functorial; a completed tensor isomorphism requires the strict finite-quotient comparison stated in its target.

## Twists, sections and projective charts

For n∈Z, descend the rank-one period module with semilinear operator π^−nφ to O_X(n). Consequently

\[
H^0(X_S,O(n))=\{f\in O(Y_S):\phi(f)=\pi^n f\}.
\]

The sign is fixed by this identity: O(1) has descent multiplier π^−1 and positive-eigenvalue sections. Tensor products add degrees, duality negates the degree, and changing a lift by φ^k changes the frame by π^−nk. This rank-one construction does not replan the arbitrary-rank isocrystal functor.

The Lubin–Tate tower E_LT∞ is separate from E_root∞. A compatible nonzero torsion parameter produces the bilateral period series used in FS II.2.2–II.2.3 (printed pp. 59–61). It is a π-eigenvector with a simple zero at the untilt, giving the degree-one divisor sequence and its consecutive twists. The formal O_E-module action, logarithm convergence, simple torsion zeros, tower tilt and reciprocity are required LocalFieldsRamification Part II inputs, not unnamed assumptions. Equal-characteristic coefficients remain in the stated target.

Form P_S=⊕_(n≥0)H⁰(X_S,O(n)) with multiplication induced by tensor products, and use the existing projective spectrum construction for Proj(P_S). For a positive-degree section g, the fractions a/g^k with deg(a)=k deg(g) define a ring map into O(D(g)) and a locally ringed morphism D(g)→D_+(g). These maps agree on D(gh) and glue on the section-covered open U=⋃D(g). This argument proves a map on U. Showing U=X_S, identifying tautological twists, and proving the global algebraic/analytic comparison require VB2:ampleness. A graded algebra generated in degree two demonstrates why degree-one standard opens cannot be assumed to cover Proj.

The analytic section calculation includes the crystalline end [ϖ]=0,π≠0. In FS II.2.5 the domains Y_[1,∞] and Y_[0,a] meet along compact annuli. Their Cech coefficient term W_O_E(R⁺)[1/π] has the π-adic Tate topology, distinct from the two-generator topology used for 𝒴. The two explicit Cech sequences and contracting Frobenius series are early section inputs. General bundle cohomology and global generation use their VB1/VB2 owners. Positive eigenvector restriction uses the corrected iteration index in KLII's errata and equality on the overlap where both sides of Frobenius are defined.

## Existing library inputs and prototype scope

The pinned baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The existing `FormalGroup` supplies the formal-law vocabulary. Its analytic evaluations use explicit summability; existing power-series evaluation by polynomial extension is available at its stated linear-topology hypotheses. `Module.length` supplies fibre length. `presheafToSheaf` supplies ordinary sheafification; it does not construct an action stack. The complete list of imported declarations appears below.

Current Tau Ceti `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039` additionally supplies the p-typical two-generator Witt Huber topology, `spaY`, Frobenius radius bounds and compact rational wandering windows, and the open topological quotient `spaX`, including compactness and `T0`. Reuse `TauCeti/RingTheory/Huber/WittVector.lean` and `TauCeti/AlgebraicGeometry/AdicSpace/FarguesFontaine/{Y,Window,Quotient}.lean` for these results. The all-E coefficients, integral perfectoid charts, relative norm completions and quotient structure sheaf are the extensions specified here. The absolute interval rings and absolute ringed-space quotient remain AdicSpaces Layer 6 inputs.

[The suggested Lean file](../suggested/RelativeFarguesFontaine--RF0.lean) gives proposed signatures at the pin with placeholder proofs and unchecked implementation status. The mathematical statements below are definitive. Where future perfectoid or site vocabulary is absent, the description of each suggested form identifies the precise algebraic or topological fragment it expresses. In particular the DVR length calculation is the forward geometric part of the family degree criterion, and the logarithm parameter calculation requires the LT comparison to obtain the divisor theorem. Neither fragment discharges the corresponding geometric input.

## Declaration catalogue

Each target states its hypotheses, direct inputs, proof plan and acceptance conditions. Definitions and constructions include API and tests. Imported supplier nodes are used at their stated hypotheses; the exact requested interfaces and outstanding proof inputs appear after the catalogue. All implementation statuses are unchecked.

## Coefficient foundations (RF0)

RF0 aggregates the coefficient prefix, integral period charts and annular interfaces. The strict universal-property target retains its aggregate identifier; the remaining coefficient targets are in RF0:integral-Y.

## Integral period space (RF0:integral-Y)

### Ramified Witt polynomials

**ramifiedWittPolynomials** (definition; `RelativeFarguesFontaine:RF0:integral-Y/ramified-witt-polynomials`).

For E of characteristic zero with residue field F_q and uniformizer π, set w_n(X_0,…,X_n)=Σ_{i=0}^n π^i X_i^(q^(n-i)). For every O_E-algebra A the ghost map on A^N is w_A(x)=(w_n(x))_n. A is not required perfect, reduced, flat or complete.

Hypotheses: E is a nonarchimedean local field of characteristic zero; q=p^f; n≥0. The all-E perfect strict lift is a separate construction.

Proof plan:

1. Write the finite polynomials over O_E, then evaluate them in any O_E-algebra.
2. Functoriality follows from evaluation of polynomials.

Prerequisites: `mathlib:WittVector`, `mathlib:WittVector.ghostComponent`.

API:

- **ramifiedGhost** (data): w_n(x)=Σ_{i≤n}π^i x_i^(q^(n-i)).
- **ramifiedGhost_zero** (characterisation): w_0(x)=x_0.
- **ramifiedGhost_one** (characterisation): w_1(x)=x_0^q+πx_1.
- **ramifiedGhost_natural** (functoriality): For f:A→B, w_B(f(x))=f(w_A(x)).

Unit tests:

- **ghost_first** (computation): w_0(x)=x_0.
- **ghost_second** (computation): w_1(x)=x_0^q+πx_1.
- **ghost_p_typical** (compatibility): For E=Q_p,π=p,q=p this is Mathlib WittVector.ghostComponent.

Uses:

- FF18 §1.2.1 Lemme 1.2.1: Defines operations by integral universal polynomial identities, without ghost injectivity on A.

Acceptance:

- Compute w_0=x_0 and w_1=x_0^q+πx_1.

Sources:

- [Courbes et fibres vectoriels en theorie de Hodge p-adique](https://www.imo.universite-paris-saclay.fr/~fontaine/courbe.pdf), §1.2.1, printed p. 53. The characteristic-zero scope of the arbitrary-algebra construction precedes the displayed Witt polynomials.

### Ramified Dwork criterion

**ramifiedDworkCriterion** (theorem; `RelativeFarguesFontaine:RF0:integral-Y/ramified-dwork-criterion`).

If A is a π-torsion-free O_E-algebra with O_E-linear ring endomorphism σ lifting a↦a^q modulo π, the ghost map w_A is injective and its image consists precisely of sequences y with y_(n+1)-σ(y_n)∈π^(n+1)A for every n≥0.

Hypotheses: E as in ramified-witt-polynomials; π-torsion-free (equivalently p-torsion-free here); σ(a)≡a^q mod π. No completeness assumption.

Proof plan:

1. Injectivity follows inductively by cancelling π^n in the nth coordinate.
2. The binomial congruence propagates a≡b mod π^i to a^q≡b^q mod π^(i+1).
3. Solve recursively for each Witt coordinate by the Dwork congruence.

Prerequisites: `RelativeFarguesFontaine:RF0:integral-Y/ramified-witt-polynomials`.

Acceptance:

- The constant ghost sequence of a scalar from O_E passes the congruence; no injectivity claim is made on F_q.

Sources:

- [Courbes et fibres vectoriels en theorie de Hodge p-adique](https://www.imo.universite-paris-saclay.fr/~fontaine/courbe.pdf), Lemme 1.2.1, proof, printed p. 53. The proof identifies the ghost image by successive congruences under a Frobenius lift.

### Ramified Witt functor on arbitrary coefficient algebras

**ramifiedWittArbitraryAlgebras** (construction; `RelativeFarguesFontaine:RF0:integral-Y/ramified-witt-arbitrary-algebras`).

There is a unique functor W_(O_E,π) from O_E-algebras to O_E-algebras with underlying set A^N for which every ghost map is an O_E-algebra homomorphism. Its operations are universal integral polynomials and are natural even on algebras with π-torsion. For a π-adic input algebra this means the same functor, with its subsequently specified V-topology, not a new flat lift.

Hypotheses: E characteristic zero as in §1.2.1; arbitrary O_E-algebra A. Ghost injectivity is only used on universal torsion-free polynomial rings.

Proof plan:

1. Apply Dwork to O_E[X_i,Y_i,…] with the coefficient-fixing Frobenius lift X_i↦X_i^q.
2. Solve addition, multiplication and scalar ghost equations there and establish integral coefficient polynomials.
3. Transfer the identities by natural evaluation to every A, including π-torsion.

Prerequisites: `RelativeFarguesFontaine:RF0:integral-Y/ramified-witt-polynomials`, `RelativeFarguesFontaine:RF0:integral-Y/ramified-dwork-criterion`.

API:

- **ramifiedWitt** (data): Carrier A^N with polynomial-defined O_E-algebra operations.
- **ramifiedWitt_map** (functoriality): A coefficient algebra map f induces coordinatewise W(f).
- **ramifiedWitt_ghost_hom** (structure): Every w_n is an O_E-algebra homomorphism.
- **ramifiedWitt_p_typical** (compatibility): At E=Q_p,π=p the functor canonically agrees with Mathlib WittVector p on Z_p-algebras.
- **ramifiedCoeffs** (data): The Witt-coordinate function W(A)→A^N, distinct from ghost coordinates.
- **ramifiedMk** (constructor): Coordinate equivalence A^N≃W(A).
- **ramifiedWitt_ext** (extensionality): Equality of every Witt coordinate implies equality of vectors, including on torsion algebras.
- **ramifiedWitt_coeff_mk** (simp): The nth coordinate of the vector constructed from x is x_n.
- **ramifiedWitt_map_coeff** (simp): The nth coordinate of W(f)(x) is f(x_n).
- **ramifiedWitt_map_id** (functoriality): W(id)=id.
- **ramifiedWitt_map_comp** (functoriality): W(g∘f)=W(g)∘W(f).

Unit tests:

- **witt_zero_algebra** (degenerate): W(0) is the zero ring.
- **witt_ghost_operations** (computation): w_n(x+y)=w_n(x)+w_n(y), w_n(xy)=w_n(x)w_n(y).
- **witt_torsion_not_strict** (non-example): For imperfect A=F_p[t], W(A)/p is not A via the zeroth coordinate; the arbitrary functor must not assert the perfect strict-lift property.

Uses:

- FF18 §1.2.4 and local divisor equations: The twisted functor and coefficient comparison must apply before specializing to perfect R^+.

Acceptance:

- Check naturality on A→A/π^m and uniqueness of operations by testing the universal polynomial algebra.

Sources:

- [Courbes et fibres vectoriels en theorie de Hodge p-adique](https://www.imo.universite-paris-saclay.fr/~fontaine/courbe.pdf), Lemme 1.2.1, printed p. 53. The statement is a functor on all O_E-algebras, not only perfect residue algebras.

### Uniformizer-independent ramified Witt vectors

**ramifiedWittUniformizerChange** (construction; `RelativeFarguesFontaine:RF0:integral-Y/ramified-witt-uniformizer-change`).

For uniformizers π,π′ of O_E there is a unique natural algebra isomorphism u_(π,π′):W_(O_E,π)→W_(O_E,π′) preserving the ghost maps. The maps satisfy u_(π′,π″)u_(π,π′)=u_(π,π″). Define W_OE as the compatible limit over all uniformizers; evaluation at a chosen uniformizer is an algebra isomorphism.

Hypotheses: E characteristic zero; comparison of functors, not coordinatewise identity.

Proof plan:

1. Dwork image congruences depend on (π), not its generator.
2. Construct the universal coordinate change on torsion-free polynomial rings and specialize.
3. The ghost uniqueness gives identity, inverse and cocycle laws; form the canonically identified limit.

Prerequisites: `RelativeFarguesFontaine:RF0:integral-Y/ramified-dwork-criterion`, `RelativeFarguesFontaine:RF0:integral-Y/ramified-witt-arbitrary-algebras`.

API:

- **uniformizerChange** (data): Canonical W_π(A)≃W_π′(A), natural in A.
- **uniformizerChange_ghost** (characterisation): w_π′∘u_(π,π′)=w_π.
- **uniformizerChange_cocycle** (characterisation): u_(π′,π″)∘u_(π,π′)=u_(π,π″).
- **uniformizerChange_teich** (compatibility): u_(π,π′)([a])=[a].

Unit tests:

- **uniformizer_same** (degenerate): u_(π,π)=id.
- **uniformizer_inverse** (computation): u_(π′,π)u_(π,π′)=id.
- **uniformizer_coordinates** (non-example): The change preserves ghosts and [a], but V_π′=(π′/π)V_π; it does not preserve V without the scalar.

Uses:

- RF0:integral-Y charts and RF2 local equations: Transfers rings, topologies and primitive presentations under a choice change.

Acceptance:

- Compare operations before and after π′=uπ; do not leave coordinates unchanged.

Sources:

- [Courbes et fibres vectoriels en theorie de Hodge p-adique](https://www.imo.universite-paris-saclay.fr/~fontaine/courbe.pdf), §1.2.1 and Définition 1.2.2, printed pp. 53–54. The preceding comparison identifies the functors and Definition 1.2.2 removes the uniformizer choice.

### Teichmuller, Frobenius and Verschiebung

**ramifiedTeichFrobeniusVerschiebung** (construction; `RelativeFarguesFontaine:RF0:integral-Y/ramified-teich-frobenius-verschiebung`).

On W_OE(A), [a] has Witt coordinates (a,0,…); it is a natural multiplicative section of coordinate zero. F is the algebra endomorphism shifting ghosts. V_π is the additive coordinate shift transported from W_π. F and [−] are independent of π, V_π depends on π. FV_π=π and V_π(F(x)y)=xV_π(y). For F_q-algebras also V_πF=π and F acts by q-powers on V-expansion coefficients.

Hypotheses: Arbitrary O_E-algebra A, E characteristic zero; VF=π only for F_q-algebras. Multiplication by π uses the W_OE-algebra structure.

Proof plan:

1. Construct F by ghost shift on universal rings using the Dwork image condition.
2. Use the coordinate shift for V_π and compute ghost identities.
3. Extend identities naturally to torsion algebras; use q-power Frobenius on an F_q-algebra for the additional formula.

Prerequisites: `RelativeFarguesFontaine:RF0:integral-Y/ramified-witt-arbitrary-algebras`, `RelativeFarguesFontaine:RF0:integral-Y/ramified-witt-uniformizer-change`, `mathlib:WittVector.frobenius`.

API:

- **ramifiedTeich** (data): Natural multiplicative map A→W_OE(A).
- **ramifiedFrobenius** (data): F with w_n(Fx)=w_(n+1)(x).
- **ramifiedVerschiebung** (data): V_π is the additive coordinate shift.
- **ramifiedFV** (characterisation): F(V_π(x))=πx.
- **ramifiedVProjection** (characterisation): V_π(F(x)y)=xV_π(y).
- **ramifiedVF_residue** (compatibility): For an F_q-algebra A, V_π(F(x))=πx.

Unit tests:

- **teich_product** (computation): [ab]=[a][b] and [0]=0, [1]=1.
- **teich_not_additive** (non-example): For Q_2 and A=F_2, [1]+[1]=2≠[0] in W(F_2).
- **fv_not_vf_general** (compatibility): F(V_π(1))=π; VF=π is tested only on residue-algebra inputs.

Uses:

- FS II.1.1 and VI.1.2: [ϖ] supplies chart denominators and primitive equations; F supplies the q-Frobenius quotient.
- VectorBundlesAndIsocrystals:VB0: Provides the coefficient Frobenius for general-E isocrystals.

Acceptance:

- Recover p-typical Teichmuller and Frobenius after the canonical ring comparison.

Sources:

- [Courbes et fibres vectoriels en theorie de Hodge p-adique](https://www.imo.universite-paris-saclay.fr/~fontaine/courbe.pdf), §1.2.1, printed p. 54. The displayed F/V relations include the projection formula and separate the residue-algebra case.

### V-adic expansion and truncated ramified Witt vectors

**ramifiedVAdicExpansion** (theorem; `RelativeFarguesFontaine:RF0:integral-Y/ramified-v-adic-expansion`).

For arbitrary O_E-algebra A, W_OE(A)≅lim_n W_OE(A)/V_π^nW_OE(A), and each element has a unique convergent expansion Σ_{n≥0}V_π^n[a_n]. Each V_π^n image is an ideal independent of π. This is V-adic completeness; without perfectness it is not the assertion V^nW=π^nW.

Hypotheses: n≥1 for the inverse system; E characteristic zero; no torsion or perfectness assumption on A.

Proof plan:

1. The n-truncation remembers precisely the first n Witt coordinates.
2. Use the F/V projection formula to make V^nW an ideal.
3. Recursively remove [a_0] then divide by V; coordinatewise inverse limits give completeness and uniqueness.

Prerequisites: `RelativeFarguesFontaine:RF0:integral-Y/ramified-teich-frobenius-verschiebung`, `RelativeFarguesFontaine:RF0:integral-Y/ramified-witt-uniformizer-change`.

Acceptance:

- An imperfect residue algebra has V-adic completeness without V=π.

Sources:

- [Courbes et fibres vectoriels en theorie de Hodge p-adique](https://www.imo.universite-paris-saclay.fr/~fontaine/courbe.pdf), §1.2.1, printed p. 54. The expansion and inverse-limit completeness are stated before any perfectness assumption.

### Perfect ramified strict lift

**ramifiedWittUniversalProperty** (construction; `RelativeFarguesFontaine:RF0/ramified-witt-universal-property`).

For every nonarchimedean local E with finite residue F_q and perfect F_q-algebra R, W_OE(R) is the unique π-adically complete π-torsion-free (hence O_E-flat) O_E-algebra with specified reduction W_OE(R)/π≅R. It has unique multiplicative Teichmuller representatives and unique π-adic expansions Σπ^n[r_n]; q-Frobenius lifts r↦r^q. In characteristic zero it is canonically W(R)⊗_(W(F_q))O_E, already complete because O_E is finite free. In equal characteristic it is R[[π]]. Uniqueness is in the category of complete lifts with the fixed residue identification.

Hypotheses: E mixed or equal characteristic; R perfect. Arbitrary-algebra ghost theory above is only claimed in its source range, E characteristic zero.

Proof plan:

1. In mixed characteristic use VF=π and invertibility of F for perfect R to identify V^nW with π^nW; the expansion proves completeness and torsion-freeness.
2. Use Teichmuller limits to construct the unique residue-lifting map between two strict lifts.
3. Compare with scalar extension through the unramified coefficient subring; a finite basis preserves π-adic completeness.
4. In equal characteristic the coefficient embedding gives R[[π]], with coefficientwise q-Frobenius.

Prerequisites: `RelativeFarguesFontaine:RF0:integral-Y/ramified-teich-frobenius-verschiebung`, `RelativeFarguesFontaine:RF0:integral-Y/ramified-v-adic-expansion`, `mathlib:PerfectRing`, `mathlib:IsAdicComplete`, `mathlib:WittVector.teichmuller`, `mathlib:PadicInt`.

API:

- **strictLift_reduce** (compatibility): The strict lift of the specified perfect residue algebra R reduces modulo the chosen uniformizer to R; the marking is F_q-linear.
- **strictLift_expansion** (characterisation): Each element has exactly one Σπ^n[r_n] expansion.
- **strictLift_complete** (structure): The strict lift is π-adically complete and π-torsion-free, hence O_E-flat.
- **strictLift_frobenius** (characterisation): For q equal to the finite residue cardinality, the canonical O_E-linear lift of q-power Frobenius sends [a] to [a^q].
- **strictLift_equalChar** (compatibility): For a complete equal-characteristic coefficient DVR and perfect residue algebra, strictRamifiedWitt O_E R≃R[[π]], sending [a] to the constant series a and π to X.
- **strictLift_pTypical** (compatibility): For E=Q_p the perfect strict lift agrees with the arbitrary-coordinate construction specialized to WittVector p R, preserving Teichmüller, Frobenius and reduction.

Unit tests:

- **strict_lift_fq** (computation): For the actual residue algebra O_E/m_E, the constructed strict lift is O_E as an O_E-algebra.
- **strict_lift_zero** (degenerate): W_OE(0)=0.
- **strict_lift_equal_char** (compatibility): The constructed equal-characteristic comparison sends strictTeich(a) to PowerSeries.C a, so it also identifies the additive Teichmüller section.
- **strict_lift_perfect_required** (non-example): The square map on F_2[T] is not surjective; the strict perfect-lift theorem cannot be applied to this algebra.

Uses:

- RelativeFarguesFontaine:RF0:integral-Y/curly-Y-affinoid-definition: Supplies the actual ring and coefficient topology before defining Spa.
- Zhu17 §0.5 and BS17 §9: Identifies their WO coefficient rings for loop functors without constructing a second ring theory.

Suggested form: The all-E carrier strictRamifiedWitt has a complete-DVR coefficient ring and its residue-algebra action as parameters. Uniformizer, finite residue cardinality and bijective q-power hypotheses are explicit in its API. The universal equivalence requires a complete π-regular target and a coefficient-compatible residue marking. The equal-characteristic test uses this carrier, rather than the mixed-characteristic arbitrary-coordinate functor. The Q_p comparison has strictRamifiedWitt(PadicInt p,R) as its source, perfect characteristic-p R as its residue input, and preserves the constructed Teichmüller lift.

Acceptance:

- The reduction isomorphism and flatness require perfectness; E=Q_p agrees with Mathlib WittVector p via a ring isomorphism.
- Keep the fixed residue-algebra action in the uniqueness category: a bare ring isomorphism of residues is insufficient without compatibility with O_E reduction.

Sources:

- [Courbes et fibres vectoriels en theorie de Hodge p-adique](https://www.imo.universite-paris-saclay.fr/~fontaine/courbe.pdf), §1.2.1, perfect case and Lemme 1.2.3, printed pp. 54–55. Inverting F converts the V-adic expansion into the π-adic strict lift.
- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), II.1 opening, printed p. 47. The introductory coefficient convention includes both characteristics; FF §1.3.2 gives the equal-characteristic power-series model.

### Change of coefficient field

**ramifiedCoefficientComparison** (construction; `RelativeFarguesFontaine:RF0:integral-Y/ramified-coefficient-comparison`).

For a finite extension E′/E of characteristic-zero local fields with residue degree f, the natural O_E-algebra map u:W_OE(A)→W_OE′(A), for every O_E′-algebra A, has w_n^E′(u(x))=w_(fn)^E(x). It preserves Teichmuller lifts and satisfies uF_E^f=F_E′u and uV_π=(π/π′)V_π′uF_E^(f−1).

Hypotheses: The scalar π/π′ belongs to O_E′; the Frobenius on the right of the V formula is F_E before u, not F_E′ after u.

Proof plan:

1. Use the Dwork congruences for the subsequence of ghosts with indices fn.
2. Construct the universal coordinate polynomials and extend to torsion inputs.
3. Check the F and V formulas on universal ghost coordinates; record the printed V-formula correction.

Prerequisites: `RelativeFarguesFontaine:RF0:integral-Y/ramified-witt-arbitrary-algebras`, `RelativeFarguesFontaine:RF0:integral-Y/ramified-teich-frobenius-verschiebung`.

API:

- **coefficientMap** (data): Natural algebra map with ghost index fn.
- **coefficientMap_teich** (characterisation): u([a])=[a].
- **coefficientMap_frobenius** (compatibility): u(F_E^f x)=F_E′u(x).
- **coefficientMap_verschiebung** (compatibility): u(V_πx)=(π/π′)V_π′u(F_E^(f−1)x).

Unit tests:

- **coefficient_identity** (degenerate): For E′=E the map is the identity.
- **coefficient_ghost_one** (computation): The first nonconstant E′ ghost is the fth E ghost.
- **coefficient_unramified_frobenius** (non-example): For residue degree f>1, uF_E^f=F_E′u; uF_E=F_E′u is not the required identity.

Uses:

- RF2:untilts coefficient change: Matches the ramified theta map, divisor generator and coefficient Frobenius.

Acceptance:

- For f=1 the V comparison reduces to the uniformizer-scaling formula.

Sources:

- [Courbes et fibres vectoriels en theorie de Hodge p-adique](https://www.imo.universite-paris-saclay.fr/~fontaine/courbe.pdf), Lemme 1.2.3, printed p. 55. The ghost diagram defines coefficient comparison; the following V formula requires the corrected Frobenius index.
- [Courbes et fibres vectoriels en theorie de Hodge p-adique, corrected author copy](https://webusers.imj-prg.fr/~laurent.fargues/Courbe_fichier_principal.pdf), §1.2.1 Lemme 1.2.3, printed p. 7. The Frobenius iterate lies inside u, confirming the corrected Verschiebung coefficient formula in E2.

### Witt diagonal and unramified coefficient action

**ramifiedWittDiagonal** (construction; `RelativeFarguesFontaine:RF0:integral-Y/ramified-witt-diagonal`).

The natural map Δ:W_OE(A)→W_OE(W_OE(A)) is characterized by outer ghosts w_n(Δx)=F_E^n(x). If E″ is the maximal unramified subextension of E′/E, the identification W_OE(F_q′)=O_E″ and Δ induce the O_E″-algebra structure on W_OE(A) used in coefficient base change.

Hypotheses: E characteristic zero; A an O_E′-algebra for the coefficient-action assertion.

Proof plan:

1. Apply Dwork to the Frobenius sequence on the universal Witt algebra.
2. Specialize the natural map from W_OE(F_q′) through Δ and the coefficient inclusion.
3. Ghost uniqueness gives compatibility of this coefficient action with u.

Prerequisites: `RelativeFarguesFontaine:RF0:integral-Y/ramified-coefficient-comparison`, `RelativeFarguesFontaine:RF0:integral-Y/ramified-teich-frobenius-verschiebung`, `RelativeFarguesFontaine:RF0/ramified-witt-universal-property`.

API:

- **ramifiedDiagonal** (data): Δ with outer nth ghost F_E^n.
- **ramifiedDiagonal_ghost** (characterisation): w_n(Δx)=F_E^n x.
- **unramifiedCoefficientAction** (structure): O_E″ acts through Δ on W_OE(A).

Unit tests:

- **diagonal_ghost_zero** (computation): w_0(Δx)=x.
- **diagonal_ghost_one** (computation): w_1(Δx)=F_E x.
- **diagonal_unramified_action** (compatibility): For A=F_q′, the coefficient action identifies W_OE(A) with O_E″.

Uses:

- FF18 coefficient base change: Provides the exact tensor-product base, rather than silently tensoring over O_E.

Acceptance:

- The tensor product in coefficient base change is over O_E″ with this action.

Sources:

- [Courbes et fibres vectoriels en theorie de Hodge p-adique](https://www.imo.universite-paris-saclay.fr/~fontaine/courbe.pdf), §1.2.1 following Lemme 1.2.3, printed p. 55. The diagonal supplies the otherwise missing unramified scalar structure.

### Perfect coefficient base change

**perfectCoefficientBaseChange** (theorem; `RelativeFarguesFontaine:RF0:integral-Y/perfect-coefficient-base-change`).

For perfect F_q′-algebra R and E′/E finite, W_OE(R)⊗_(O_E″)O_E′≃W_OE′(R), carrying [r]⊗1 to [r] and F_E^f⊗id to F_E′. In equal characteristic the same comparison follows from R[[π]] and finite coefficient extension. The tensor product is complete because the coefficient module is finite free; its base is the maximal unramified subextension, not O_E when f>1.

Hypotheses: Perfect R with specified F_q′ action; the mixed-characteristic action is the one defined by Δ.

Proof plan:

1. Compute reduction modulo π′ and identify it with R.
2. Show π′-completeness and flatness by a finite O_E″ basis of O_E′.
3. Apply strict-lift uniqueness; check the coefficient Frobenius on Teichmuller expansions.
4. Use the explicit power-series model in equal characteristic.

Prerequisites: `RelativeFarguesFontaine:RF0/ramified-witt-universal-property`, `RelativeFarguesFontaine:RF0:integral-Y/ramified-witt-diagonal`, `RelativeFarguesFontaine:RF0:integral-Y/ramified-coefficient-comparison`.

Acceptance:

- At E=Q_p this is W(R)⊗_(W(F_q′))O_E′; a naive tensor over Z_p has the wrong residue algebra.

Sources:

- [Courbes et fibres vectoriels en theorie de Hodge p-adique](https://www.imo.universite-paris-saclay.fr/~fontaine/courbe.pdf), §1.2.1, printed pp. 55–56. The comparison is an isomorphism exactly after imposing perfectness and using the unramified scalar action.

### Q-twisted Witt vectors

**qTwistedWittFunctor** (construction; `RelativeFarguesFontaine:RF0:integral-Y/q-twisted-witt-functor`).

For Q∈O_E[X] with Q≡X^q modulo π, set Q_0=X and Q_n=Q iterated n times, and w_(n,Q)(x)=Σ_(i≤n)π^i Q_(n−i)(x_i). There is a unique natural algebra structure on A^N with these ghost homomorphisms, and a canonical ghost-preserving isomorphism W_(O_E,Q,π)(A)≃W_(O_E,π)(A), for every O_E-algebra A.

Hypotheses: E characteristic zero; no perfectness, completeness or π-torsion-free assumption on A. The polynomial congruence is coefficientwise: Q.map(O_E→O_E/(π))=X^q. It is a mandatory parameter of the constructed twisted ring and its Q-Teichmüller section.

Proof plan:

1. Prove the congruence Q(x)≡Q(y) modulo π^(i+1) when x≡y modulo π^i, i≥1.
2. Apply the twisted Dwork criterion on universal torsion-free polynomial algebras.
3. Transfer integral operations and the unique ghost-preserving comparison to arbitrary A.

Prerequisites: `RelativeFarguesFontaine:RF0:integral-Y/ramified-dwork-criterion`, `RelativeFarguesFontaine:RF0:integral-Y/ramified-witt-arbitrary-algebras`.

API:

- **twistedGhost** (data): w_(n,Q)=Σ_(i≤n)π^i Q_(n−i)(x_i).
- **twistedWitt** (data): Polynomial-defined natural O_E-algebra on A^N.
- **twistedWittEquiv** (equivalence): Canonical ghost-preserving algebra isomorphism to ordinary ramified Witt vectors.

Unit tests:

- **twist_first_ghost** (computation): w_(1,Q)(x)=Q(x_0)+πx_1.
- **twist_ordinary** (compatibility): Q=X^q recovers ordinary ramified Witt vectors.
- **twist_torsion** (non-example): The functor and comparison exist on A=O_E/π²; their definition cannot require ghost injectivity there.

Uses:

- FF18 §1.2.2 and RF3 Lubin–Tate divisor sections: Separates the twisted coordinate functor from the ordinary multiplicative Teichmuller map.

Suggested form: twistedWitt, its O_E-algebra structure, and qTwistedWittFunctor all retain the concrete polynomial congruence Q mod π=X^q. The ghost formulas themselves can be evaluated without constructing a twisted ring.

Acceptance:

- Evaluate w_(0,Q) and w_(1,Q); do not assume Q is additive or multiplicative.

Sources:

- [Courbes et fibres vectoriels en theorie de Hodge p-adique](https://www.imo.universite-paris-saclay.fr/~fontaine/courbe.pdf), Proposition 1.2.4 and Lemmes 1.2.5–1.2.6, printed pp. 56–57. The proposition constructs the twisted functor for arbitrary coefficient algebras.

### Q-Teichmuller lift

**qTeichmullerLift** (construction; `RelativeFarguesFontaine:RF0:integral-Y/q-teichmuller-lift`).

Transport (a,0,…) through the twisted Witt comparison to define [a]_Q∈W_OE(A). Its ghosts are Q_n(a), it satisfies Q([a]_Q)=[Q(a)]_Q, and every element has a unique V_π expansion ΣV_π^n[a_n]_Q. For perfect F_q-algebra A the π expansion is unique and [a]_Q=lim_n Q_n(â_n), for any lifts â_n of a^(q^(−n)). The map is not generally multiplicative.

Hypotheses: Arbitrary O_E-algebra A for the ghosts and V expansion; perfect residue algebra for the π expansion and limit. The polynomial congruence is coefficientwise: Q.map(O_E→O_E/(π))=X^q. It is a mandatory parameter of the constructed twisted ring and its Q-Teichmüller section.

Proof plan:

1. Apply the twisted comparison to coordinate-zero representatives.
2. Use universal ghosts for the Q identity and coordinate induction for the V expansion.
3. Use contraction modulo successive powers of π for the perfect-residue limit and its independence of chosen lifts.

Prerequisites: `RelativeFarguesFontaine:RF0:integral-Y/q-twisted-witt-functor`, `RelativeFarguesFontaine:RF0:integral-Y/ramified-v-adic-expansion`, `RelativeFarguesFontaine:RF0/ramified-witt-universal-property`.

API:

- **qTeich** (data): Natural lift A→W_OE(A).
- **qTeich_ghost** (characterisation): w_n([a]_Q)=Q_n(a).
- **qTeich_equation** (characterisation): Q([a]_Q)=[Q(a)]_Q.
- **qTeich_limit** (characterisation): For perfect residue A, [a]_Q=lim_n Q_n(â_n).

Unit tests:

- **q_teich_ordinary** (compatibility): For Q=X^q, [a]_Q=[a].
- **q_teich_multiplicative_group** (computation): For E=Q_p and Q=(1+X)^p−1, [a]_Q=[1+a]−1.
- **q_teich_not_multiplicative** (non-example): At p=2 and a=b=1 in F_2, [1]_Q=−1, so [ab]_Q≠[a]_Q[b]_Q.

Uses:

- FF18 Chapter 2 points y_ε and RF3 divisor section: Provides the formal-group-adapted coefficients of period functions.

Suggested form: The Q section and ghost/functional-equation API have the same Q and congruence. The limit uses the canonical π-adic topology and lifts of the inverse q-power roots in a perfect residue algebra; no arbitrary topology or unrelated root sequence is substituted.

Acceptance:

- For Q=(1+X)^p−1 over Q_p obtain [a]_Q=[1+a]−1.

Sources:

- [Courbes et fibres vectoriels en theorie de Hodge p-adique](https://www.imo.universite-paris-saclay.fr/~fontaine/courbe.pdf), Proposition 1.2.7 and Exemple 1.2.8, printed pp. 57–58. The natural lift has a functional equation; Example 1.2.8 distinguishes it from the multiplicative lift.

### Lubin–Tate Teichmuller lift

**lubinTateTeichmullerLift** (construction; `RelativeFarguesFontaine:RF0:integral-Y/lubin-tate-teichmuller-lift`).

If Q≡πX mod X² and Q≡X^q mod π, its Lubin–Tate formal group satisfies LT_Q([x]_Q,[y]_Q)=[LT_Q(x,y)]_Q when perfect A is complete for (x,y). For a perfect complete valued field F of characteristic p and any Lubin–Tate formal group LT over O_E, the weak limit [x]_LT=lim_n[π^n]_LT([x^(q^(−n))]) gives an injective O_E-module map (m_F,+_LT)→(W_OE(m_F),+_LT). This is a module map for the formal-group law, not for ordinary addition.

Hypotheses: E characteristic zero for this cited arbitrary Witt functor; x,y topologically nilpotent. The general formal power series require the weak topology, not solely π-adic convergence.

Proof plan:

1. Identify ([x]_Q,[y]_Q,π) with ([x],[y],π) and prove the needed complete topology.
2. Evaluate the formal group using completeness and commute it with Q iterations.
3. Apply the limit characterization of [−]_Q, then the identical contraction argument for a general LT formal power series.
4. The residue map proves injectivity and scalar compatibility.

Prerequisites: `RelativeFarguesFontaine:RF0:integral-Y/q-teichmuller-lift`, `RelativeFarguesFontaine:RF0/ramified-witt-universal-property`, `RelativeFarguesFontaine:RF0:integral-Y/coefficient-weak-topology`, `mathlib:FormalGroup`, `mathlib:MvPowerSeries.eval₂`.

API:

- **ltTeich** (data): For the specified Lubin–Tate formal O_E-module LT, the constructed weak lift is injective on the topologically nilpotent ideal m_F.
- **ltTeich_add** (characterisation): Evaluate the same Mathlib FormalGroup power series in F and in the weak Witt ring; LT([x]_LT,[y]_LT)=[LT(x,y)]_LT whenever these evaluations converge.
- **ltTeich_scalar** (characterisation): Evaluate the scalar endomorphism [a]_LT of that same formal O_E-module on source and target; its value commutes with the LT lift.
- **ltTeich_limit** (characterisation): The weak limit uses the scalar series [π^n]_LT and Teichmüller lifts of the unique inverse q-power roots of x; the weak topology is the (π,[ϖ])-adic coefficient topology.

Unit tests:

- **lt_teich_zero** (degenerate): [0]_LT=0.
- **lt_teich_multiplicative** (computation): For the multiplicative formal group and its binomial scalar action, the constructed lift is [1+x]−1; the polynomial specialization over F_2 is tested in ramifiedWitt.
- **lt_teich_injective** (compatibility): Equality of the actual LT images implies equality of the marked residue elements; a nonzero topologically nilpotent element has nonzero lift.

Uses:

- FS II.2.3: The logarithm of the compatible Lubin–Tate tower supplies the section with a simple untilt zero.

Suggested form: The formal law is the existing FormalGroup O_E with IsComm. Source and target evaluate its identical coefficient series, with Summable hypotheses, and scalar values use the scalar series belonging to this LT module. The formal O_E-module action and LT condition, and the domain m_F, await the LocalFields Part II interface and are explicitly omitted from the carrier prototype under §13. These omissions do not replace the law by arbitrary functions.

Acceptance:

- State the coefficient field, formal group and topology in the limit; no ordinary additive-map assertion.

Sources:

- [Courbes et fibres vectoriels en theorie de Hodge p-adique](https://www.imo.universite-paris-saclay.fr/~fontaine/courbe.pdf), Lemme 1.2.9 and Corollaire 1.2.10, printed p. 58. The formal-group lift converges weakly and intertwines the Lubin–Tate module law.

### Weak coefficient topology

**coefficientWeakTopology** (theorem; `RelativeFarguesFontaine:RF0:integral-Y/coefficient-weak-topology`).

For a perfect complete valued field F/F_q and A=W_OE(O_F), the product topology on Teichmuller expansion coefficients equals the (π,[ϖ])-adic topology for a topologically nilpotent ϖ∈O_F. A is separated complete in this topology. For 0<ρ<1 the Gauss norm |Σπ^n[x_n]|_ρ=sup_n|x_n|ρ^n induces it; at ρ=1 the mixed-characteristic Teichmuller map need not be continuous.

Hypotheses: This field case is FF Proposition 1.4.11. The relative uniform-Banach version is separately proved by period-ring estimates below.

Proof plan:

1. The finite coefficient seminorms bound tails uniformly by powers of ρ.
2. Compare finite coefficient neighborhoods with powers of (π,[ϖ]).
3. Use completeness of F coefficientwise; the source example at ρ=1 prevents extending the assertion to that endpoint.

Prerequisites: `RelativeFarguesFontaine:RF0/ramified-witt-universal-property`.

Acceptance:

- The LT construction uses this topology; π-adic and weak topologies are separately named.
- Reuse the current Tau Ceti p-typical topology/domain/window/orbit implementation described in upstreamNotes. This node adds the stated all-E or ringed-space relative extension, not another p-typical carrier or topological quotient.

Sources:

- [Courbes et fibres vectoriels en theorie de Hodge p-adique](https://www.imo.universite-paris-saclay.fr/~fontaine/courbe.pdf), Définition 1.4.10, Proposition 1.4.11 and Remarque 1.4.12, printed pp. 64–65. The comparison explicitly excludes the endpoint norm from continuity of Teichmuller representatives.

### Integral period chart rings

**integralRationalChartRings** (construction; `RelativeFarguesFontaine:RF0:integral-Y/integral-rational-chart-rings`).

Put W=W_OE(R^+) with ideal of definition (π,[ϖ]). For n=p^m>0, C_n=W⟨π^n/[ϖ]⟩ is the completed rational ring of definition; B_n=C_n[1/[ϖ]], and B_n^+ is the integral closure of C_n in B_n. The rational subset is |π|^n≤|[ϖ]|≠0. Its Tate unit is [ϖ]; π is allowed to vanish. The completion topology is the rational-localisation topology induced from W, not solely π-adic.

Hypotheses: S=Spa(R,R^+) affinoid perfectoid over F_q; R^+ open integrally closed bounded; ϖ a topologically nilpotent unit of R.

Proof plan:

1. Form the rational localisation using the Huber-pair construction imported from the adic roadmap.
2. Use [ϖ] as the inverted denominator and complete the ring of definition.
3. Take the integral closure plus ring; the universal property describes maps with the stated valuation inequality.

Prerequisites: `RelativeFarguesFontaine:RF0/ramified-witt-universal-property`, `AdicSpacesPartII:R0`, `tauceti:TauCeti.Huber.Pair`.

API:

- **integralChartRing** (data): B_n=W⟨π^n/[ϖ]⟩[1/[ϖ]], with its completed topology.
- **integralChartPlus** (data): Integral closure of C_n in B_n.
- **integralChart_universal** (universal-property): Continuous W-maps to complete pairs satisfying the rational bounds factor uniquely through B_n.
- **integralChart_frobenius** (functoriality): φ compares n=p^m charts through q-power Teichmuller coefficients.

Unit tests:

- **chart_special_fibre** (degenerate): π=0 is allowed and [ϖ] is invertible on each chart.
- **chart_unit_denominator** (computation): [ϖ] is a topologically nilpotent unit in B_n.
- **chart_not_witt_tate** (non-example): W with its (π,[ϖ])-adic topology is not asserted Tate; Tate-ness is obtained after the chart localisation.

Uses:

- FS II.1.1: Supplies the actual affinoid rings for the sheaf and perfectoid comparison.

Suggested form: The non-Tate/Tate example compares a proper two-generator IsAdic topology on the original W with the actual integralChartRing: W has no topologically nilpotent unit, whereas the localized image of [ϖ] is a unit tending to zero under powers. The chart special fibre and denominator tests also use the constructed ring.

Acceptance:

- Track both the topology and the plus ring, including the characteristic-p fibre.

Sources:

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), II.1.1 proof, printed p. 48. The displayed rings define the chart and its plus ring before sheafiness is proved.

### Root-extension chart model

**rootExtensionChartModel** (construction; `RelativeFarguesFontaine:RF0:integral-Y/root-extension-chart-model`).

Let E_root∞ be the completion of E(π^(1/p^∞)). On the n=1 chart let π_m=π^(1/p^m), v_m=[ϖ]^(1/p^m), s_m=π_m/v_m. In the completed base extension, set A_0^+=(W⊗̂_OE O_(E_root∞))[s_m:m≥0]^∧_[ϖ], with π_m=v_m s_m and s_(m+1)^p=s_m. Then A=A_0^+[1/[ϖ]], and A^+ is the integral closure of the extended chart plus ring. Reduction gives A_0^+/[ϖ]≃(R^+/ϖ)[t_1^(1/p^∞)]. The quotient in s_m roots the entire ratio π/[ϖ].

Hypotheses: Choose compatible roots; R^+ is perfect, so v_m exists. E_root∞ is distinct from the Lubin–Tate torsion extension used for divisor sections.

Proof plan:

1. Use successive finite coefficient extensions and the rational relation π=[ϖ]s_0 to construct the completed presentation.
2. Adjoin compatible roots of that relation; retain all π_m=v_ms_m equations.
3. Reduce modulo [ϖ] and eliminate the coefficient-root relations, leaving the perfected polynomial variable.

Prerequisites: `RelativeFarguesFontaine:RF0:integral-Y/integral-rational-chart-rings`, `RelativeFarguesFontaine:RF0:integral-Y/perfect-coefficient-base-change`, `AdicSpacesPartII:R0`.

API:

- **rootChartModel** (data): The integral completed presentation with the three specified coefficient, denominator and whole-ratio root sequences. Their zeroth entries are the images of π and [ϖ].
- **rootChart_reduce** (compatibility): The integral root model modulo the image of [ϖ] is the coefficient quotient (R^+/ϖ) with only the variable t_1 perfected; the coefficient quotient is not replaced by its perfection.
- **rootChart_roots** (characterisation): The constructed sequence s_(m+1)^p=s_m, together with the compatible π_m and v_m sequences.
- **rootChart_tiltCoordinate** (compatibility): In the constructed model π_m=v_m s_m; after denominator localization s_0=π/[ϖ]. The geometric tilt identifies the corresponding root sequence with t_1, whose sharp is s_0.
- **rootChartRatio** (constructor): The compatible whole-ratio sequence in that same rootChartModel.

Unit tests:

- **root_boundary_norm** (computation): A valuation on the actual rootChartModel with nonzero v_m and |π_m|=|v_m| has |s_m|=1.
- **root_special_fibre** (degenerate): Localize the constructed v_0 before quotienting by the constructed π_0: the image of s_0 is zero.
- **root_wrong_fraction** (non-example): Rooting only the numerator fails the boundary norm at every m>0.
- **root_reciprocal** (non-example): In a nonzero π_0=0 special fibre with v_0 inverted, the constructed s_0 is not a unit. Its reciprocal cannot be the integral chart coordinate.

Uses:

- FS II.1.1 and FarguesFontaineDiamonds:F4/root_annulus_tilt: Gives the integral model before importing the fixed-field generic comparison.

Suggested form: All root streams and the reduction live in one constructed integral model with an Algebra W action, zeroth-entry identifications and compatible p-power equations. The variable-perfection reduction is a ring equivalence on that model. The two special-fibre examples localize its denominator before setting its coefficient to zero.

Acceptance:

- On |π|=|[ϖ]|=c<1, every s_m has norm 1; π^(1/p^m)/[ϖ] would have norm c^(1/p^m−1)>1.

Sources:

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), II.1.1 root-extension presentation, printed p. 48. The displayed root presentation roots the entire ratio. Its tilt-coordinate reciprocal in the MPIM copy is corrected as source finding E1; the Fargues author copy has the correct coordinate.

### Perfectoid root extension and split sheaf descent

**chartCoverPerfectoidnessAndSheafiness** (theorem; `RelativeFarguesFontaine:RF0:integral-Y/chart-cover-perfectoidness-and-sheafiness`).

The charts B_n are sheafy. Their completed extension to E_root∞ is perfectoid; the associated perfected disc charts glue to S×_(F_q)Spa F_q[[t^(1/p^∞)]]. Hence curly-Y_S is an analytic adic space over O_E. In mixed characteristic the charts are sousperfectoid; in equal characteristic perfection after the root extension and the split-module argument give the same sheaf conclusion.

Hypotheses: B_n as defined above; plus rings are integral closures. The splitting is a continuous B_n-linear retraction, not a ring retraction.

Proof plan:

1. Reduce to n=1 using coefficient perfection and Frobenius.
2. For A_0^+, use u=[ϖ]^(1/p): u^p divides p in mixed characteristic because π=[ϖ]s_0 and p is a unit times a power of π; the root presentation proves u is regular and Frob:A_0^+/u→A_0^+/u^p is bijective. Apply the integral-perfectoid criterion (BMS 3.10(ii)); in equal characteristic apply the perfect characteristic-p criterion.
3. Identify the tilt from the reduction presentation and t_1^sharp=π/[ϖ]. Normalize the global disc coordinate so these are the corresponding nested disc charts.
4. The coefficient-root extension admits a topological module splitting; transport it through the completed chart tensor product. Apply sousperfectoid sheaf descent, then glue the rational chart cover.

Prerequisites: `RelativeFarguesFontaine:RF0:integral-Y/root-extension-chart-model`, `PerfectoidSpaces:P1`, `PerfectoidSpaces:P3`, `AdicSpacesPartII:R5/split-injection-completed-base-change`, `AdicSpacesPartII:R5/sousperfectoid-sheafy`.

Acceptance:

- Verify the chosen u and both quotient ideals in the criterion; establish a continuous splitting before invoking the imported theorem.

Sources:

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proposition II.1.1 and proof, printed pp. 48–49. The actual topological direct-summand argument establishes sheafiness; the root presentation checks the integral criterion.
- [Integral p-adic Hodge theory](https://arxiv.org/abs/1602.03148), Lemma 3.10(ii), printed pp. 22–23. The criterion requires regularity, divisibility and the Frobenius quotient isomorphism, not merely surjectivity.

### Integral relative period domain

**curlyYAffinoidDefinition** (construction; `RelativeFarguesFontaine:RF0:integral-Y/curly-Y-affinoid-definition`).

For affinoid S define curly-Y_S=Spa(W_OE(R^+),W_OE(R^+))∖V([ϖ]), with the (π,[ϖ])-adic coefficient topology and the sheaf structure glued from the integral charts. It retains V(π), is independent of the pseudouniformizer, and q-Frobenius on R^+ induces an analytic automorphism. Its special fibre is the open period domain in characteristic p.

Hypotheses: All E with finite residue F_q; S affinoid perfectoid over F_q. Spa here includes structure sheaves from the adic roadmap, whereas pinned TauCeti.ValuationSpectrum.spa supplies only the valuation subset.

Proof plan:

1. Use the rational chart cover and sheafiness theorem to attach the adic structure.
2. For ϖ,ϖ′ find n with ϖ|ϖ′^n and ϖ′|ϖ^n; the topologies and nonvanishing opens coincide.
3. Apply q-Frobenius and its inverse on the coefficient ring and glue charts.

Prerequisites: `RelativeFarguesFontaine:RF0:integral-Y/integral-rational-chart-rings`, `RelativeFarguesFontaine:RF0:integral-Y/chart-cover-perfectoidness-and-sheafiness`, `tauceti:TauCeti.ValuationSpectrum.spa`.

API:

- **integralPeriodDomain** (data): Analytic curly-Y_S built from B_n charts.
- **integralPeriodDomain_independent** (equivalence): Canonical comparison for ϖ and ϖ′.
- **integralPeriodDomain_frobenius** (structure): q-Frobenius induces an analytic automorphism.
- **integralPeriodDomain_chart** (compatibility): The charts identify with |π|^n≤|[ϖ]|≠0.

Unit tests:

- **integral_equal_char_disc** (compatibility): For E=F_q((π)) and S=Spa C, curly-Y_C is the open unit disc, including π=0.
- **integral_zero_fibre** (degenerate): The characteristic-p untilt gives a point on V(π).
- **integral_not_generic** (non-example): Removing V(π) in the definition fails the special-fibre test.

Uses:

- GeometricSatakeAndFusion:GS0:loop-geometry: The integral period domain supplies the degeneration to ramified Witt coefficients.

Acceptance:

- Specialisation at π=0 must survive; the generic open is defined separately.

Sources:

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), II.1 opening and Proposition II.1.1, printed pp. 47–48. The topology and nonvanishing locus are both independent of the chosen pseudouniformizer.

### Integral period diamond comparison

**untiltFunctorOfPoints** (theorem; `RelativeFarguesFontaine:RF0:integral-Y/untilt-functor-of-points`).

For perfectoid T/F_q, maps from an untilt T^sharp to curly-Y_S are naturally pairs of an O_E-untilt of T and a map T→S. Thus curly-Y_S^diamond≃S×Spd O_E. The diamond of a pre-adic space is formed using untilt pairs; the non-Tate coefficient object Spd O_E is not replaced by Spd E.

Hypotheses: Affinoid and subsequently general S; maps to O_E require π topologically nilpotent in the untilt, and the image of [ϖ] invertible in its Tate ring.

Proof plan:

1. A map from an affinoid untilt is a continuous W_OE(R^+)→A^+ map whose Teichmuller pseudouniformizer is invertible in A.
2. Use the perfect strict-lift universal property and theta to identify it with R^+→(A^+)^flat, preserving plus rings.
3. This is precisely a map T→S; descend the equivalence on affinoid covers.

Prerequisites: `RelativeFarguesFontaine:RF0/ramified-witt-universal-property`, `RelativeFarguesFontaine:RF0:integral-Y/curly-Y-affinoid-definition`, `DiamondsAndVStacks:D6`, `PerfectoidSpaces:P1/fontaine-theta-and-primitive-kernel`.

Acceptance:

- Use the pre-adic diamond interface from D6; do not presume the non-Tate coefficient ring is a Tate pair.

Sources:

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proposition II.1.2, printed p. 49. The asserted integral product includes the whole O_E-untilt functor.

### Gluing integral period spaces

**gluingForGeneralBase** (theorem; `RelativeFarguesFontaine:RF0:integral-Y/gluing-for-general-base`).

For an affinoid open S′⊂S, curly-Y_S′→curly-Y_S is an open immersion and |curly-Y_S′|=|curly-Y_S|×_|S||S′|. The affinoid construction therefore glues for every perfectoid S/F_q, compatibly with the integral diamond product and Frobenius.

Hypotheses: An open immersion of bases, not an unrestricted ordinary fibre product of adic spaces over S.

Proof plan:

1. Take the inverse image open in the diamond product.
2. Compare its adic structure with curly-Y_S′ after O_E→O_E_root∞, where both spaces are perfectoid and diamonds detect the isomorphism.
3. Use the split injections on structure sheaves to descend the isomorphism; cocycle identities follow from naturality.

Prerequisites: `RelativeFarguesFontaine:RF0:integral-Y/untilt-functor-of-points`, `RelativeFarguesFontaine:RF0:integral-Y/chart-cover-perfectoidness-and-sheafiness`, `DiamondsAndVStacks:D6/etale-site-comparison`.

Acceptance:

- Check the intersection of two affinoid base opens; the identification is canonical.

Sources:

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proposition II.1.3 and proof, printed p. 49. The split base extension proves the open comparison before global gluing.

### Whole analytic A-inf locus

**wholeAnalyticAinfLocus** (construction; `RelativeFarguesFontaine:RF0:integral-Y/whole-analytic-ainf-locus`).

For E=Q_p put W=W(R^+). With its (p,[ϖ])-adic topology, define Z_S=Spa(W,W)∖V(p,[ϖ]), the union of D(p) and D([ϖ]). It contains curly-Y_S=D([ϖ]) and the end where [ϖ]=0,p≠0. Use the two rational charts |[ϖ]|≤|p|≠0 and |p|≤|[ϖ]|≠0 with their distinct completed Tate topologies; their overlap is the equal-boundary localisation.

Hypotheses: Perfect Tate Huber R of characteristic p with integral-element subring R^+; this additional comparison is explicitly p-typical.

Proof plan:

1. Cover the complement of simultaneous vanishing by the two rational inequalities.
2. Use Kedlaya Definition 3.5 for B_1,B_2,B_12 and their plus rings.
3. Attach the sheaf structure from the stable-uniformity theorem below.

Prerequisites: `RelativeFarguesFontaine:RF0/ramified-witt-universal-property`, `AdicSpacesPartII:R0`.

API:

- **wholeAnalyticAinf** (data): The complement of V(p,[ϖ]).
- **wholeAnalyticAinf_cover** (characterisation): Two inequality charts cover Z_S.
- **wholeAnalyticAinf_overlap** (compatibility): Their intersection is Spa(B_12,B_12^+).

Unit tests:

- **analytic_crystalline_end** (computation): A valuation through W(k)[1/p], killing [ϖ], lies in Z_S.
- **analytic_special_end** (degenerate): p=0,[ϖ]≠0 is in Z_S and in curly-Y_S.
- **analytic_not_generic_union** (non-example): Removing V(p)∪V([ϖ]) would omit both ends.

Uses:

- GR24 Theorem 4.15 proof and SW20 Proposition 13.1.1: Provides the precise analytic domain used in the added-source algebraicity statement.

Acceptance:

- Retain the crystalline end [ϖ]=0 and compare the generic part with the appropriate p-adic topology.

Sources:

- [Some ring-theoretic properties of A_inf](https://arxiv.org/abs/1602.09016), Hypothesis 3.4 and Definition 3.5, printed p. 7; Theorem 3.8, pp. 8–9. The locus removes simultaneous vanishing, not each divisor separately.

### Sheafiness at both analytic ends

**wholeAnalyticAinfSheafiness** (theorem; `RelativeFarguesFontaine:RF0:integral-Y/whole-analytic-ainf-sheafiness`).

The whole analytic A_inf locus Z_S is sheafy on the specified charts, including the end [ϖ]=0,p≠0. For any discrete perfect F_p-algebra R_0, W(R_0)[1/p] with its p-adic Tate topology is sheafy. This is distinct from strong noetherianity of the field-case Y_[0,∞), requested from the classification owner; no relative noetherianity is asserted.

Hypotheses: Kedlaya Hypothesis 3.4 for Z_S; discrete R_0 for the separate Witt assertion; field case only for strong noetherianity.

Proof plan:

1. Use the stable uniformity of A_1,A_12,B_1,B_2,B_12,B_2′ in Kedlaya 3.6; do not assert the stronger unproved property of A_2.
2. For the p-adic end, complete the coefficient-root extension and identify its perfectoid reduction; a split module retraction descends sheafiness.

Prerequisites: `RelativeFarguesFontaine:RF0:integral-Y/whole-analytic-ainf-locus`, `RelativeFarguesFontaine:RF0:integral-Y/root-extension-chart-model`, `AdicSpacesPartII:R5/sousperfectoid-sheafy`, `AdicSpacesPartII:R5/split-injection-completed-base-change`.

Acceptance:

- Distinguish equal underlying rings with different p-adic and [ϖ]-adic topologies; no general relative noetherianity conclusion.

Sources:

- [Berkeley Lectures on p-adic Geometry](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), Proposition 13.1.1, printed pp. 108–109; Remark 13.1.2 and Theorem 13.1.3, p. 109. The endpoint sheafiness and perfect discrete input are broader than the relative integral open.
- [Some ring-theoretic properties of A_inf](https://arxiv.org/abs/1602.09016), Proposition 3.6, printed p. 8. The exact chart list suffices; A_2 is only proved uniform.

### Whole-locus algebraicity import interface

**puncturedAinfBundleAlgebraicity** (comparison; `RelativeFarguesFontaine:RF0:integral-Y/punctured-ainf-bundle-algebraicity`).

For E=Q_p, identify RF0’s Z_S=Spa(W(R^+),W(R^+)) minus V(p,[ϖ]) and its canonical morphism to Spec W(R^+) minus V(p,[ϖ]) with Y-ad, X-sch and the pullback functor in RelativeFarguesFontaine:RF4:vector-bundles/kedlaya-algebraicity-of-punctured-bundles, using x=ϖ. The algebraicity equivalence used on this presentation is exactly that RF4-owned equivalence. This node supplies the presentation comparison and an exact import; it does not construct or prove a second algebraicity theorem. Extension to a finite free W(R^+)-module is imported only under RF4’s valued-field hypotheses, and not for general R.

Hypotheses: Kedlaya Hypothesis 3.4. The analytic-to-scheme map is the punctured A_inf comparison, not RF3’s global Proj map.

Proof plan:

1. Identify the defining complements, both inequality charts and the canonical locally ringed-space map with the RF4 presentation, substituting x=ϖ.
2. Transport the pullback functor across these presentation identifications and import the RF4-owned Kedlaya Theorem 3.8 equivalence.
3. For the extension corollary, retain the valued-field hypotheses of RF4 and the general-base restriction witnessed by Kedlaya Example 3.14.

Prerequisites: `RelativeFarguesFontaine:RF0:integral-Y/whole-analytic-ainf-locus`, `RelativeFarguesFontaine:RF0:integral-Y/whole-analytic-ainf-sheafiness`, `RelativeFarguesFontaine:RF4:vector-bundles/kedlaya-algebraicity-of-punctured-bundles`.

Acceptance:

- Check both analytic ends and retain the field/general-ring distinction.

Sources:

- [Some ring-theoretic properties of A_inf](https://arxiv.org/abs/1602.09016), Theorem 3.8, printed pp. 8–9; Example 3.14, p. 10. The theorem is on the punctured spectrum; the example prevents a general global freeness assertion.
- [A prismatic approach to crystalline local systems](https://par.nsf.gov/servlets/purl/10534610), Theorem 4.15 proof, printed pp. 74–75. Guo–Reinecke applies this precise algebraicity theorem, while product φ-module freeness has the RF4 owner.

### Classical integral period points

**classicalPointsOfIntegralPeriodDisc** (definition; `RelativeFarguesFontaine:RF0:integral-Y/classical-points-of-integral-period-disc`).

For C algebraically closed perfectoid over F_q, a point of curly-Y_C is classical precisely when it is the closed Cartier point of an O_E-untilt C^sharp with a specified identification (C^sharp)^flat≃C. The completed residue field and induced theta map recover this marking. In equal characteristic curly-Y_C is an open unit disc and its classical points are a∈C with |a|<1, including a=0.

Hypotheses: Closed points arising from marked untilts; the assertion that all maximal ideals or all closed points have this form is a separate VB2-classification theorem.

Proof plan:

1. Use the integral Cartier construction below to attach a point to an untilt.
2. Recover the untilt and its marking from the completed residue map.
3. For equal characteristic evaluate the coefficient π at a topologically nilpotent a.

Prerequisites: `RelativeFarguesFontaine:RF0:integral-Y/curly-Y-affinoid-definition`, `RelativeFarguesFontaine:RF0:integral-Y/untilt-functor-of-points`, `RelativeFarguesFontaine:RF2:untilts/closed-cartier-divisor-norm-estimate`.

API:

- **classicalIntegralPoint** (data): The support ideal ker θ of the actual marked O_E-untilt point; in equal characteristic it is the kernel of evaluation at a∈C with |a|<1.
- **classicalIntegralPoint_injective** (characterisation): The completed residue field and specified θ recover the marked untilt; equality of those constructed points gives equality of marked data.
- **classicalIntegralPoint_equalChar** (compatibility): The supports of the constructed equal-characteristic evaluation maps are in bijection with a∈C, |a|<1, including zero.

Unit tests:

- **classical_zero** (degenerate): The constructed equal-characteristic evaluation point at zero has support (X).
- **classical_small_nonzero** (computation): For 0<|a|<1 the constructed evaluation kernel contains X−a and differs from the support at zero.
- **classical_gauss_nonexample** (non-example): The positive-radius Gauss valuation on C[X] has zero support; every constructed evaluation kernel contains the nonzero X−a, so the supports differ.

Uses:

- FS II.1.8–II.1.14 and VB2:classification: Separates the early untilt characterization from PID and bundle classification.

Suggested form: Classical supports are computed from the specified θ or disc evaluation, not an arbitrary ideal assignment. The Gauss nonexample compares these actual kernels with the constructed Gauss valuation.

Acceptance:

- The marking is part of the data; maximal-ideal/PID characterization is not used in the definition.

Sources:

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Example II.1.6 and Definition/Proposition II.1.7, printed p. 51. The definition uses untilts and retains the equal-characteristic zero point.

### Tilting map of the period disc

**tiltingMapOfPeriodDisc** (construction; `RelativeFarguesFontaine:RF0:integral-Y/tilting-map-of-period-disc`).

Root extension and tilting give a continuous surjective map |D_C|≃|D_C,perf|≃|curly-Y_C×O_E O_E_root∞|→|curly-Y_C|. Its inverse image of the classical locus is exactly the classical locus. On a classical a∈C, |a|<1, its image is cut out by π−[a]. The map is topological; ordinary ring structure is not transported through tilting.

Hypotheses: C algebraically closed; D_C the ordinary open disc. Compatible root extension and the tilt convention from the root chart.

Proof plan:

1. Use the homeomorphism between the disc and its perfection.
2. Identify the perfected disc with the tilt of the root-extended integral period space.
3. Project the coefficient extension; evaluate θ on π−[a] for classical points.

Prerequisites: `RelativeFarguesFontaine:RF0:integral-Y/chart-cover-perfectoidness-and-sheafiness`, `RelativeFarguesFontaine:RF0:integral-Y/classical-points-of-integral-period-disc`, `PerfectoidSpaces:P2`.

API:

- **periodDiscTiltMap** (data): Continuous surjective map of underlying disc/period spaces.
- **periodDiscTiltMap_classical** (characterisation): Preimage of the classical locus is the classical disc locus.
- **periodDiscTiltMap_equation** (compatibility): The classical point a maps to the Cartier ideal (π−[a]).

Unit tests:

- **tilting_zero** (degenerate): a=0 maps to the special-fibre ideal (π).
- **tilting_equation** (computation): For 0<|a|<1 the image satisfies π=[a].
- **tilting_not_additive** (non-example): For mixed-characteristic E the topological map is not induced by an additive embedding C→W_OE(C).

Uses:

- FS II.1.9 and II.1.14: Reduces base extension and inertia to ordinary disc Gauss points.

Acceptance:

- At a=0 the equation is π; surjectivity does not turn tilting into an additive ring map.

Sources:

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proposition II.1.8 and preceding construction, printed p. 51. The displayed map sends classical x to (π−[x]) and detects the classical locus.

### Gauss-point disc in the base-extension fibre

**gaussDiscFibre** (theorem; `RelativeFarguesFontaine:RF0:integral-Y/gauss-disc-fibre`).

Let x∈D_C(C), 0<ρ<1 with the closed ρ-disc contained in D_C, and x_ρ its Gauss point. After base change to its completed residue field C(x_ρ), the fibre of x_ρ contains the open disc of radius ρ around the tautological point. For power series f, |u−t|<ρ implies |f(u)−f(t)|<|f(x_ρ)| when f is nonzero, so the restricted valuations agree.

Hypotheses: Use a disc genuinely contained in the open unit disc. The printed membership condition x_ρ∈|D_C| already excludes ρ=1; 0<ρ<1 is an explicit equivalent range here, not a source misprint.

Proof plan:

1. Translate the centre to zero and use |u^n−t^n|<ρ^n.
2. Bound each coefficient term strictly below the attained Gauss maximum.
3. Convergence of the power series ensures the maximum is attained and proves the valuation equality.

Prerequisites: `RelativeFarguesFontaine:RF0:integral-Y/classical-points-of-integral-period-disc`, `AdicSpacesPartII:R0/affinoid-maximum-modulus`.

Suggested form: The suggested inequality evaluates an actual PowerSeries C by its coefficient tsum and compares with its actual Gauss coefficient supremum. It requires a nonzero series, 0<ρ<1, decay of ‖a_n‖ρ^n, ‖u‖,‖t‖≤ρ and ‖u−t‖<ρ. The geometric completed-residue-field embedding is omitted, while the analytic maximum and strict difference bound remain explicit.

Acceptance:

- A zero-radius point is classical and is not an instance of this positive-radius theorem.

Sources:

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Lemma II.1.10 and proof, printed p. 52. The proof bounds actual convergent series on a disc contained in the open unit disc. Membership of its Gauss point excludes radius one; this is not a source misprint.

### Classical base change and nonclassical fibres

**classicalBaseChangeAndNonclassicalFibres** (theorem; `RelativeFarguesFontaine:RF0:integral-Y/classical-base-change-and-nonclassical-fibres`).

For C′/C complete algebraically closed, a point x of curly-Y_C is classical iff its fibre in curly-Y_C′ consists of a classical point. A nonclassical rank-one point has, after some such extension, a fibre containing a nonempty open subset. No corresponding claim is made for arbitrary higher-rank points.

Hypotheses: The phrase “is a classical point” refers to the whole fibre, not just the existence of a classical point in it.

Proof plan:

1. For classical points use marked-untilt base extension.
2. For the converse, descend the isomorphism of the corresponding residue-field diamond along the v-cover Spa C′→Spa C.
3. For nonclassical rank-one points reduce through the tilting map to a Gauss disc or decreasing balls with positive limiting radius, and apply the Gauss-fibre theorem.

Prerequisites: `RelativeFarguesFontaine:RF0:integral-Y/tilting-map-of-period-disc`, `RelativeFarguesFontaine:RF0:integral-Y/gauss-disc-fibre`, `DiamondsAndVStacks:D2/v-descent-of-functions`.

Acceptance:

- The nonclassical fibre can contain classical points; merely finding one does not characterize classical x.

Sources:

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proposition II.1.9 and proof, printed pp. 51–52. The dichotomy is specifically for nonclassical rank-one points.

### Inertia at a period Gauss point

**inertiaAtAPeriodGaussPoint** (theorem; `RelativeFarguesFontaine:RF0:integral-Y/inertia-at-a-period-gauss-point`).

On the generic period domain Y_C there is a nonclassical rank-one point x with completed residue field K(x) such that Gal(K(x)^sep/K(x))→I_E is surjective. The image of any origin-centred Gauss point of radius 0<r<1 under the punctured disc tilting map works.

Hypotheses: C algebraically closed over F_q with the coefficient embedding used to identify the unramified completion in K(x); this is the early input to VS1’s Drinfeld argument.

Proof plan:

1. The residue field contains the unramified coefficient completion, so the Galois image lies in inertia.
2. For every finite extension of that coefficient completion, the Gauss locus lifts uniquely with its radius.
3. Connectedness of the fibre of each finite extension forces the map onto every finite inertia quotient; pass to the inverse limit.

Prerequisites: `RelativeFarguesFontaine:RF0:integral-Y/tilting-map-of-period-disc`, `RelativeFarguesFontaine:RF0:integral-Y/gauss-disc-fibre`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group`.

Acceptance:

- Export the exact residue-field inertia statement to VStackSheavesAndLisseCategories:VS1, without importing Drinfeld’s lemma back.

Sources:

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Lemma II.1.14 and proof, printed p. 54. The nonclassical Gauss-point calculation gives the surjection onto inertia.

## Annuli and period sheaves (RF0:annuli)

### Generic relative period domain

**genericPeriodDomain** (construction; `RelativeFarguesFontaine:RF0:annuli/generic-period-domain`).

Define Y_S=curly-Y_S∖V(π)=Spa W_OE(R^+)∖V(π[ϖ]) in the affinoid case. It is the generic open of the integral period space, with the inherited sheaf and Frobenius. Its points have both |π| and |[ϖ]| nonzero. Functoriality is induced from coefficient maps and gluing.

Hypotheses: S perfectoid over F_q; the integral construction already supplies sheafiness.

Proof plan:

1. Take the nonvanishing open of π and restrict the structure sheaf.
2. Use coefficient functoriality and the independence of ϖ to identify this with the displayed affine open.
3. Glue along base opens.

Prerequisites: `RelativeFarguesFontaine:RF0:integral-Y/curly-Y-affinoid-definition`, `RelativeFarguesFontaine:RF0:integral-Y/gluing-for-general-base`.

API:

- **genericPeriodDomain** (data): The generic open Y_S.
- **genericPeriodDomain_open** (characterisation): The inclusion Y_S→curly-Y_S is open.
- **genericPeriodDomain_functorial** (functoriality): A map T→S induces Y_T→Y_S; identities and composition agree.

Unit tests:

- **generic_equal_char** (compatibility): For E=F_q((π)),Y_C is the punctured open unit disc.
- **generic_special_absent** (degenerate): The point π=0 is excluded.
- **generic_both_invertible** (computation): Both π and [ϖ] are nonzero at every generic point.

Uses:

- RF1 quotient and RF2 generic divisors: Supplies the actual adic domain on which Frobenius acts discontinuously.

Acceptance:

- The special-fibre Cartier point is absent here, while it remains present in curly-Y.
- Reuse the current Tau Ceti p-typical topology/domain/window/orbit implementation described in upstreamNotes. This node adds the stated all-E or ringed-space relative extension, not another p-typical carrier or topological quotient.

Sources:

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Definition II.1.15, printed p. 54. The generic period domain removes precisely the π=0 fibre from curly-Y.

### Radius and relative period annuli

**radiusFunctionAndRationalAnnuli** (construction; `RelativeFarguesFontaine:RF0:annuli/radius-function-and-rational-annuli`).

For x∈|Y_S| let x̃ be its unique rank-one generalization and rad_ϖ(x)=log|[ϖ](x̃)|/log|π(x̃)|∈(0,∞). For rational 0<a≤b define the rational open Y_[a,b] by |π|^b≤|[ϖ]|≤|π|^a, using integer-power inequalities to interpret rational exponents. Its ring B_[a,b] is the completed rational localisation of W_OE(R^+), with integral-closure plus ring. Equal endpoints are allowed. The radius factors through the Berkovich quotient and rad_ϖ(φx)=q rad_ϖ(x). Changing ϖ changes the radius function but gives cofinal annular exhaustions of the same Y_S.

Hypotheses: Affinoid S; fixed ϖ for this radius, a,b positive rational. The rational open may differ from the entire set rad^−1([a,b]) at higher-rank points.

Proof plan:

1. Use the maximal/rank-one generalization of analytic points; logarithm ratios are independent of rescaling the real valuation.
2. Clear denominators in the rational inequalities and use Huber rational localisation.
3. q-Frobenius fixes π and raises [ϖ] to the qth power.
4. Compare powers of two pseudouniformizers for cofinality; do not assert their radii equal.

Prerequisites: `RelativeFarguesFontaine:RF0:annuli/generic-period-domain`, `DiamondsAndVStacks:D5/berkovich-quotient`, `AdicSpacesPartII:R0`.

API:

- **periodRadius** (data): The logarithm ratio at the rank-one generalization.
- **periodAnnulus** (data): The completed rational chart for [a,b].
- **periodRadius_frobenius** (characterisation): rad_ϖ(φx)=q rad_ϖ(x).
- **periodAnnulus_restrict** (functoriality): I⊂J induces the continuous rational restriction B_J→B_I.
- **periodAnnulus_plus** (compatibility): B_I^+ is the integral closure of its ring of definition.

Unit tests:

- **radius_scale** (computation): If |[ϖ]|=|π|^a at a rank-one point, rad_ϖ=a.
- **annulus_equal_ends** (degenerate): [a,a] gives a boundary annulus and is not discarded as empty.
- **radius_varpi_power** (non-example): Replacing ϖ by ϖ^m multiplies rad by m, while preserving the generic domain.

Uses:

- RF1 fundamental annulus and RF3 eigenvector restrictions: Provides the q-scaled annular cover and its transition rings.

Acceptance:

- For a=b the affinoid boundary is used in the fundamental-domain gluing.
- Reuse the current Tau Ceti p-typical topology/domain/window/orbit implementation described in upstreamNotes. This node adds the stated all-E or ringed-space relative extension, not another p-typical carrier or topological quotient.

Sources:

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proposition II.1.16, printed pp. 54–55. The source allows boundary circles and distinguishes the rational open from the radius inverse image.

### Witt seminorm extension and restriction

**wittSeminormLambdaMu** (construction; `RelativeFarguesFontaine:RF0:annuli/witt-seminorm-lambda-mu`).

For a perfect F_p-algebra with a power-multiplicative seminorm α bounded by the trivial norm, define λ(α)(Σp^i[x_i])=max_i p^(−i)α(x_i), and μ(β)(x)=β([x]). They preserve multiplicative seminorms. The maps on their Berkovich spectra are continuous, μλ=id and λμ≥id. The same formulas extend to the relative integral and interval rings with the domination conditions of KL5.1.2.

Hypotheses: The initial ring need not be a field or Banach. The analytic relative version uses a perfect uniform Banach pair over an analytic field and 0<s≤r. For the initial Witt spectrum, α(x)≤1 and β is dominated by the p-adic norm: β(x)≤1 for all Witt x and β(p)≤p^−1. Both spectra carry the topology induced by pointwise evaluation. Perfectness and characteristic p are mandatory.

Proof plan:

1. Use homogeneous Witt addition polynomials to prove the ultrametric bound.
2. A leading maximal coefficient gives multiplicativity when α is multiplicative; iterate for power multiplicativity.
3. Prove μ is subadditive despite the nonadditivity of Teichmuller representatives.
4. Use stable Witt presentations to prove continuity and μλ=id; extend bounded seminorms to completions.

Prerequisites: `RelativeFarguesFontaine:RF0/ramified-witt-universal-property`, `mathlib:Valuation`.

API:

- **wittLambda** (data): A map from trivial-bounded multiplicative coefficient seminorms to p-adic-bounded Witt seminorms, defined by the Teichmüller coefficient maximum.
- **wittMu** (data): The actual Teichmüller restriction from the p-adic-bounded Witt spectrum to the trivial-bounded coefficient spectrum.
- **wittMu_lambda** (characterisation): μ(λ(α))=α.
- **wittLambda_mu** (characterisation): On that bounded Witt spectrum, β(x)≤λ(μ(β))(x) for every Witt vector.
- **wittLambda_continuous** (compatibility): Continuous for the induced pointwise-evaluation spectrum topologies.

Unit tests:

- **lambda_teich** (computation): λ(α)([x])=α(x).
- **lambda_p** (computation): λ(α)(p)=p^−1 for a nonzero seminorm.
- **lambda_mu_not_identity** (non-example): If β(p)=p^−1 and β(p−[ϖ])=0, the actual λμ majorant takes the positive value p^−1 on p−[ϖ]. The normalized primitive quotient is not fixed by λμ.

Uses:

- KL5.1–5.4: Defines relative annular norms, radius and the Berkovich retraction.

Suggested form: TrivialBoundedSpectrum and WittBoundedSpectrum encode the actual domination inequalities, with induced evaluation topologies. A trivial Witt norm giving β(p)=1 is excluded. The λ/μ composition and primitive nonidentity example refer to the constructed maps.

Acceptance:

- Distinguish a ring homomorphism from this construction on seminorms.

Sources:

- [Relative p-adic Hodge theory: foundations](https://arxiv.org/abs/1301.0792), Definition 3.3.2 and Lemma 3.3.3, printed p. 76; Proposition 5.1.2, pp. 114–115. The first construction is on general perfect rings; the analytic estimates state the analytic domination conditions.
- [Nonarchimedean geometry of Witt vectors](https://arxiv.org/abs/1004.0466), Lemmas 4.1 and 4.4, Theorem 4.5 and Example 4.7, printed pp. 19–23. The theorem gives continuity and the retraction inequalities, without calling the Teichmuller map additive.

### Relative extended Robba rings

**relativeExtendedRobbaRings** (construction; `RelativeFarguesFontaine:RF0:annuli/relative-extended-robba-rings`).

For a perfect uniform Banach pair (R,R^+) over an analytic field of characteristic p with spectral norm α, define Ẽ^int=W(R), Ẽ=Ẽ^int[1/p], R̃^(int,r)={Σ_(i≥0)p^i[x_i]:p^(−i)α(x_i)^r→0}, R̃^(bd,r)=R̃^(int,r)[1/p], R̃^r its Frechet completion for λ(α^s), 0<s≤r, and R̃^[s,r] its Banach completion for max(λ(α^s),λ(α^r)). Dropping r takes the union over r>0. Define each plus-input variant by R^+ instead of R. Its integral/bounded variants are W(R^+) and W(R^+)[1/p]; R̃^+ is the completion for all s>0, whereas R̃^∞=∩_rR̃^r is a different ring. Record p-adic, weak, Banach, Frechet and inductive limit topologies separately.

Hypotheses: KL Hypothesis 5.0.1. These are extended relative rings. The paper does not construct the arithmetic relative Robba rings. For all E replace p by π and p-Frobenius by q-Frobenius and prove the stated extension.

Proof plan:

1. Use the coefficient norm estimates to show the growth subsets are subrings.
2. Localize integral growth rings and complete in the indicated families of norms.
3. Use log convexity to identify the interval norm with its two endpoint maximum.
4. Construct inclusions, their topologies and Frobenius φ:R̃^[s,r]≃R̃^[s/q,r/q].

Prerequisites: `RelativeFarguesFontaine:RF0/ramified-witt-universal-property`, `RelativeFarguesFontaine:RF0:annuli/witt-seminorm-lambda-mu`.

API:

- **relativeRobbaIntegral** (data): The actual subring of WittVector p R whose Teichmüller expansion coefficients satisfy p^−i α(x_i)^r→0, at r>0.
- **relativeRobbaInterval** (data): The endpoint-norm completion of the bounded growth ring at 0<s≤r.
- **relativeRobbaPlus** (data): The image in the infinity ring of the all-positive-radii completion of W(R^+)[1/p]; the R^+ input is retained.
- **relativeRobba_restrict** (functoriality): Continuous interval restrictions for interval inclusion.
- **relativeRobba_frobenius** (compatibility): In the p-typical prototype, φ transports [s,r] to [s/p,r/p]; the all-E q-transport requires the recorded norm extension.

Unit tests:

- **robba_teich** (computation): The actual Teichmüller Witt element belongs to relativeRobbaIntegral, and its actual coefficient growth tends to zero.
- **robba_singleton_interval** (degenerate): The actual completed singleton interval norm on its Teichmüller image equals α(x)^r; the definition is not tested by an unrelated max identity.
- **robba_plus_infinity** (non-example): If α(x)>1 and α≤1 on R^+, the actual Teichmüller image of x in relativeRobbaInfinity does not lie in the constructed plus-completion image.

Uses:

- RF0 rational annuli: Provides the actual rings of analytic functions and their restriction maps.
- RF4 Frobenius modules: Supplies rings, topologies and exact interval restrictions without prematurely importing module classification.

Suggested form: The integral carrier has the concrete growth predicate. Interval, infinity and plus constructors retain p, α and R^+ as applicable. Tests use their actual Teichmüller maps, norm and subring membership. The all-E extension remains a separate target and gap, with the correct unramified coefficient tensor base.

Acceptance:

- Never identify R̃^∞ with R̃^+ or complete every ring in a single norm.

Sources:

- [Relative p-adic Hodge theory: foundations](https://arxiv.org/abs/1301.0792), Hypothesis 5.0.1 and Definitions 5.1.1 and 5.1.3, printed pp. 113–115. The source retains a general Banach base and distinguishes the several completions and topologies.

### Robba growth, units and Frobenius invariants

**robbaGrowthUnitsAndInvariants** (theorem; `RelativeFarguesFontaine:RF0:annuli/robba-growth-units-and-invariants`).

For nonzero x, t↦log λ(α^t)(x) is convex. In R̃^r, boundedness as t→0 characterizes R̃^(bd,r). Every unit of R̃ is already a unit in R̃^bd by KL5.2.3. The φ^d-invariant ring is W(R^(φ^d))[1/p], retaining idempotents and disconnected constants. For R^+=R°, membership x∈R̃^+ within R̃^∞ is equivalent to limsup_(t→∞)λ_t(x)^(1/t)≤1.

Hypotheses: Use exactly the bounded or completed ring in each criterion. Frobenius invariants are not asserted to be Q_p when the base is disconnected.

Proof plan:

1. Prove convexity first on finite Witt sums and then by completion.
2. Use bounded endpoint norms to recover bounded Witt coefficients.
3. For a unit x with inverse y, use affine residue-field log norms and a uniform two-radius bound to show both x and y have bounded growth near zero.
4. For invariants compare each coefficient under φ^d; for the plus criterion use the integral/fractional splitting and the asymptotic coefficient maximum.

Prerequisites: `RelativeFarguesFontaine:RF0:annuli/relative-extended-robba-rings`, `RelativeFarguesFontaine:RF0:annuli/witt-seminorm-lambda-mu`.

Acceptance:

- Check the invariant formula on R=F_p×F_p before using a scalar fixed-field simplification.

Sources:

- [Relative p-adic Hodge theory: foundations](https://arxiv.org/abs/1301.0792), Lemmas 5.2.1–5.2.2 and Corollaries 5.2.3–5.2.4, printed pp. 116–117; Lemma 5.2.11 and proof, pp. 119–120. The norm estimates and coefficient criteria retain the relative base, and the last result distinguishes plus from infinity.

### Controlled Robba splittings and intersections

**robbaControlledSplittings** (theorem; `RelativeFarguesFontaine:RF0:annuli/robba-controlled-splittings`).

For 0<s≤r and n∈Z every x∈R̃^[s,r] splits x=y+z with y∈p^nR̃^(int,r), z extending to every [s,r′], r′≥r, and λ_t(z)≤p^((1−n)(1−t/r))λ_r(x)^(t/r) for t≥r. For 0<c<1 there is the second splitting of KL5.2.9 into bounded and plus parts with endpoint norm bounds and its φ estimates. Consequently R̃^[s,r]∩R̃^[s′,r′]=R̃^[s,r′] inside R̃^[s′,r] for 0<s≤s′≤r≤r′. Intersection preservation for a base ring square requires strict inclusions and, for completions, a strict difference map.

Hypotheses: The interval intersection specifies its common ambient ring. The strictness conditions of Remark 5.2.13 cannot be removed.

Proof plan:

1. Split finite Witt sums at their p-adic index, or by α(x_i)>c.
2. Approximate a completed element by a geometrically convergent sequence of bounded sums.
3. Sum the split pieces using the displayed estimates.
4. Apply the integral-ring intersection lemma and strict completion exactness to the interval and base-square intersections.

Prerequisites: `RelativeFarguesFontaine:RF0:annuli/relative-extended-robba-rings`, `RelativeFarguesFontaine:RF0:annuli/robba-growth-units-and-invariants`, `AdicSpacesPartII:R0/strict-complex-completion-exact`.

Acceptance:

- Do not use the naive coefficient-series formula for an arbitrary interval-completed element.

Sources:

- [Relative p-adic Hodge theory: foundations](https://arxiv.org/abs/1301.0792), Lemma 5.2.6, Remark 5.2.7, Lemmas 5.2.8–5.2.10 and Remark 5.2.13, printed pp. 117–121. The source expressly warns that even injectivity may fail without the strictness assumptions.

### Relative period presheaves

**relativePeriodPresheaves** (construction; `RelativeFarguesFontaine:RF0:annuli/relative-period-presheaves`).

On Spa(R,R^+) define the period presheaf for each of the twelve variants Ẽ^int,Ẽ,R̃^(int,r),R̃^(int,+),R̃^int,R̃^(bd,r),R̃^(bd,+),R̃^bd,R̃^[s,r],R̃^r,R̃^+,R̃ by the inverse limit of its values on rational affinoids contained in an open U. Restrictions and base maps are induced by the coefficient maps and completions. The plus-input and positive-radii-completion variants keep their distinct topologies.

Hypotheses: Perfect uniform Banach base as in KL5.0.1; bounds and radii must be adjusted for a bounded coefficient map before taking the union.

Proof plan:

1. Construct the functor on the rational basis from Witt naturality and bounded norm estimates.
2. Use restriction coherence to define the limit on all opens.
3. Prove its value on a rational affinoid is its original period ring once the basis sheaf condition is established.

Prerequisites: `RelativeFarguesFontaine:RF0:annuli/relative-extended-robba-rings`, `AdicSpacesPartII:R3`.

API:

- **relativePeriodPresheaf** (data): The rational-basis limit presheaf retains the coefficient functor, plus subrings, norms, rational basis, prime, radii s,r and twelve-variant index.
- **relativePeriodPresheaf_restrict** (functoriality): Compatible restriction maps for open inclusion.
- **relativePeriodPresheaf_affinoid** (characterisation): On a rational affinoid U, identify the constructed presheaf value with relativePeriodRing of coeff(U), plus(U), α_U, p,s,r and that same variant.
- **relativePeriodPresheaf_phi** (compatibility): The coefficient Frobenius induces the natural transformation to the same variant with radii s/p,r/p.

Unit tests:

- **period_empty** (degenerate): The value on the empty open is the terminal zero ring.
- **period_restriction_chain** (compatibility): Restriction through two rational subopens equals their composite.
- **period_plus_distinction** (non-example): Use the actual affinoid comparison for variant 10 and its inclusion into relativeRobbaInfinity. A Teichmüller coefficient with norm greater than one is outside this map’s range when the plus coefficients have norm at most one.

Uses:

- KL8.3.4 and relative curves: Globalizes period functions over nonaffinoid bases and the etale site.

Suggested form: The suggested relativePeriodRing index order is the twelve-variant order stated in this node. Its rational evaluation uses the specified coefficient/plus/norm/prime/radius data, and restrictions are the actual Functor.map. The empty-open, restriction-chain and plus-range examples test this presheaf and its affinoid maps.

Acceptance:

- Keep the sheaf claim separate from the definition.

Sources:

- [Relative p-adic Hodge theory: foundations](https://arxiv.org/abs/1301.0792), Definition 5.3.1, printed pp. 121–122. The definition is on the rational basis and lists twelve variants rather than a single unspecified period sheaf.

### Period sheaves and rational acyclicity

**relativePeriodSheafAndAcyclicity** (theorem; `RelativeFarguesFontaine:RF0:annuli/relative-period-sheaf-and-acyclicity`).

Every period presheaf of KL5.3.1 is a sheaf. Rational Tate acyclicity is asserted for Ẽ^int,Ẽ,R̃^(int,r),R̃^int,R̃^(bd,r),R̃^bd,R̃^[s,r],R̃^r,R̃, exactly the nine variants of Theorem5.3.3. The Kiehl property is proved for Ẽ^int and R̃^(int,r), and separately for R̃^[s,r]; it is not automatically asserted for all twelve variants.

Hypotheses: Use continuous strict rational covering sequences and the norm assigned to each variant. The plus variants are sheaves without the extra acyclicity claim in this theorem.

Proof plan:

1. Lift the elementary Laurent covering sequence coefficientwise in Witt expansions.
2. Apply the controlled splitting to preserve its strictness under each completion.
3. For R̃^r choose a convergent correction sequence over the shrinking radii, eliminating the lim^1 term.
4. Apply the imported rational-basis sheaf and Kiehl descent criteria only to the cases proved in KL5.3.3 and5.3.6.

Prerequisites: `RelativeFarguesFontaine:RF0:annuli/relative-period-presheaves`, `RelativeFarguesFontaine:RF0:annuli/robba-controlled-splittings`, `AdicSpacesPartII:R3/sheafy-tate-acyclicity-and-kiehl-gluing`, `AdicSpacesPartII:R3/glueing-square-finite-projective-descent`.

Acceptance:

- The final plan must retain the exact nine acyclic variants and avoid a blanket Kiehl assertion.

Sources:

- [Relative p-adic Hodge theory: foundations](https://arxiv.org/abs/1301.0792), Lemma 5.3.2, Theorems 5.3.3 and 5.3.6, printed pp. 122–123. The all-variant sheaf statement and restricted acyclicity/Kiehl lists are separate source assertions.

### Relatively perfectoid interval rings

**intervalRingsRelativelyPerfectoid** (theorem; `RelativeFarguesFontaine:RF0:annuli/interval-rings-relatively-perfectoid`).

For 0<s≤r the Banach rings Ẽ, R̃^(bd,r) and R̃^[s,r] are relatively perfectoid. For any compatible adic plus extension they are stably uniform, sheafy, rationally acyclic and satisfy finite-projective Kiehl gluing. After scalar extension to the completed p-power-root tower the interval norm is power multiplicative and the ring is perfectoid. In all-E annular charts use the specified whole root relations and prove the coefficient extension of these norm estimates.

Hypotheses: No field assumption on R. Relative perfectoidness is the imported sousperfectoid/relative-perfectoid condition, not an unproved designation for every Frechet or integral ring.

Proof plan:

1. Compute scalar tensor norms using fractional p-power exponents and their orthogonal basis.
2. Prove power multiplicativity away from the finitely many norm-crossing radii and use convex continuity at crossings.
3. Frobenius-compatible Teichmuller representatives generate a dense perfect subring after tensor extension.
4. Apply the R5 split completed-base-change and sheafiness criterion to the listed Banach rings.
5. Use the corrected perfectoid completed-tensor comparison of KLII Theorem 3.3.13 (including injectivity), requested from P3, when invoking Lemma 5.3.14; the old KL3.6.11 proof is incomplete.

Prerequisites: `RelativeFarguesFontaine:RF0:annuli/relative-extended-robba-rings`, `RelativeFarguesFontaine:RF0:annuli/robba-growth-units-and-invariants`, `RelativeFarguesFontaine:RF0:integral-Y/root-extension-chart-model`, `AdicSpacesPartII:R5/sousperfectoid-sheafy`, `AdicSpacesPartII:R5/split-injection-completed-base-change`, `PerfectoidSpaces:P3`.

Acceptance:

- The integral period disc uses its own chart theorem; it is not one of the three rings in this assertion.

Sources:

- [Relative p-adic Hodge theory: foundations](https://arxiv.org/abs/1301.0792), Theorem 5.3.9 and Lemma 5.3.14, printed pp. 123–125. The theorem concerns three Banach rings; its proof verifies the tensor norm rather than assuming its exactness.

### Interval adic pairs and base projection

**intervalAdicPairAndBaseProjection** (construction; `RelativeFarguesFontaine:RF0:annuli/interval-adic-pair-and-base-projection`).

Give R̃^[s,r] the plus ring obtained by completing the subring generated by elements of endpoint norm <1 and [R^+]. A semivaluation first determines its unique exponent t∈[s,r], then a seminorm γ=μ(β)^(1/t) of R. Extending to H(γ) and using {x:v([x])≤1} yields the valuation on R. This defines μ_ad:Spa(R̃^[s,r],R̃^[s,r],+)→Spa(R,R^+) as a continuous map of adic topological spaces, without a structural ring homomorphism R→R̃^[s,r].

Hypotheses: Teichmuller representatives are multiplicative; their nonadditivity must be handled through the valuation-ring criterion. The pair uses the specified completed plus ring.

Proof plan:

1. Determine t by evaluating a topologically nilpotent unit from the analytic coefficient field.
2. Use domination to extend the seminorm to the completed residue field.
3. Prove the bounded Teichmuller representatives form a valuation ring.
4. Check the plus condition and continuity on rational inequalities.

Prerequisites: `RelativeFarguesFontaine:RF0:annuli/relative-extended-robba-rings`, `RelativeFarguesFontaine:RF0:annuli/interval-rings-relatively-perfectoid`, `RelativeFarguesFontaine:RF0:annuli/witt-seminorm-lambda-mu`, `tauceti:TauCeti.ValuationSpectrum.spa`.

API:

- **relativeAnnulusPair** (data): The interval Banach ring with its completed plus ring.
- **relativeAnnulus_exponent** (characterisation): The unique t∈[s,r] determined by the coefficient valuation.
- **relativeAnnulus_toBase** (data): The continuous adic-spectrum map μ_ad.
- **relativeAnnulus_baseValuation** (characterisation): Its valuation ring consists of the bounded Teichmuller representatives.

Unit tests:

- **annulus_projection_teich** (computation): The pullback valuation measures [x] by the corresponding coefficient valuation.
- **annulus_endpoint** (degenerate): Both t=s and t=r occur; a singleton interval is allowed.
- **annulus_no_additive_teich** (non-example): The projection is defined by valuations although [x+y] need not equal [x]+[y].

Uses:

- KL5.3.11–5.3.13: Pulls rational base domains back to genuine rational annular domains.

Acceptance:

- Use the source plus ring and normalized exponent in the projection.

Sources:

- [Relative p-adic Hodge theory: foundations](https://arxiv.org/abs/1301.0792), Lemma 5.3.4 and Definition 5.3.10, printed pp. 122–124. The adic projection is built from a valuation ring, not a nonexistent additive Teichmuller ring map.

### Rational base change and interval descent

**annularRationalBaseChange** (theorem; `RelativeFarguesFontaine:RF0:annuli/annular-rational-base-change`).

A rational localization (R,R^+)→(S,S^+) induces the rational localization of interval pairs representing μ_ad^−1Spa(S,S^+). Rational base coverings therefore induce annular coverings and the interval period sheaf satisfies Kiehl gluing. For a finite covering I=⋃I_j of a compact interval in (0,∞), R̃^I→∏R̃^I_j is effective descent for finite projective modules. After the scalar extension of KL5.3.14, each subinterval restriction is itself a rational localization; before that extension use the proven gluing square, rather than asserting rationality.

Hypotheses: The interval cover is finite and uses closed intervals; the Banach base is perfect uniform over an analytic field. General base maps give functorial maps, not a universal uncompleted tensor identity.

Proof plan:

1. Lift rational inequalities by Teichmuller representatives.
2. Apply stable uniformity and the spectral-norm isometry criterion to the map from the rational localization.
3. The dense coefficient subring proves surjectivity and the rational base-cover assertion.
4. For interval covers use controlled splitting/intersections to check the gluing square, or descend the rational-cover argument after the specified perfectoid scalar extension.

Prerequisites: `RelativeFarguesFontaine:RF0:annuli/interval-adic-pair-and-base-projection`, `RelativeFarguesFontaine:RF0:annuli/robba-controlled-splittings`, `RelativeFarguesFontaine:RF0:annuli/interval-rings-relatively-perfectoid`, `AdicSpacesPartII:R3/glueing-square-finite-projective-descent`, `AdicSpacesPartII:R3/finite-projective-etale-descent`.

Acceptance:

- Do not call every interval restriction a rational localization over Q_p before the required scalar extension.

Sources:

- [Relative p-adic Hodge theory: foundations](https://arxiv.org/abs/1301.0792), Lemma 5.3.11, Corollary 5.3.12 and Theorems 5.3.13 and 5.3.16, printed pp. 124–126. Rational localization in the base and descent along interval covers are distinct comparisons.

### Berkovich period deformation

**berkovichPeriodDeformation** (construction; `RelativeFarguesFontaine:RF0:annuli/berkovich-period-deformation`).

On M(R̃^(int,r)) the stable-presentation construction defines H(β,u), u∈[0,1], with H(β,0)=β, H(β,1)=λμ(β), μH(β,u)=μ(β), and H(H(β,u),v)=H(β,max(u,v)). It is continuous. On T_R=⋃_(0<s<r)M(R̃^[s,r]) it gives a strong deformation retract to M(R)×(0,∞). The properly discontinuous φ^d action scales the exponent by q=p^d, has compact Hausdorff quotient X_R, and descends the retraction to M(R)×(R_>0/q^Z)≃M(R)×S^1.

Hypotheses: These are Berkovich spaces and their maximal Hausdorff quotient. Neither the deformation nor the circle description asserts an adic ringed-space product.

Proof plan:

1. Extend to the residue valued field and define H using stable Witt presentations.
2. Check the endpoint, restriction and max-semigroup formulas.
3. Embed into a Witt spectrum for the trivially normed integral ring to prove joint continuity.
4. Use the exponent and a compact fundamental annulus to prove discontinuity and compactness; descend the compatible deformation.

Prerequisites: `RelativeFarguesFontaine:RF0:annuli/witt-seminorm-lambda-mu`, `RelativeFarguesFontaine:RF0:annuli/interval-adic-pair-and-base-projection`, `RelativeFarguesFontaine:RF0:annuli/robba-growth-units-and-invariants`, `DiamondsAndVStacks:D5/berkovich-quotient`.

API:

- **periodHomotopy** (data): The stable-presentation H on the Gauss-bounded spectrum of the constructed relative integral growth ring, with coefficient norm and r>0 as parameters.
- **periodHomotopy_zero** (characterisation): H(β,0)=β.
- **periodHomotopy_one** (characterisation): H(β,1)=relativePeriodLambda(relativePeriodMu β), with the same coefficient datum and radius.
- **periodHomotopy_max** (characterisation): H(H(β,u),v)=H(β,max(u,v)) for that constructed H.
- **periodBerkovichQuotient** (data): The compact quotient and its circle-valued exponent.

Unit tests:

- **homotopy_fixed** (compatibility): For a point produced by the actual relative Gauss section λ, H(λ(β),u)=λ(β).
- **homotopy_mu** (computation): The actual relative Teichmüller restriction μ is constant along each H path.
- **circle_disconnected_base** (non-example): On a product coefficient algebra, two period points with different μ-values at (1,0) cannot be joined by the constructed deformation; the quotient retains the base components.

Uses:

- RF1 topology and KL8.7: Identifies the maximal Hausdorff quotient and the topological exponent map.

Suggested form: IntegralPeriodSpectrum consists of multiplicative seminorms on the actual relativeRobbaIntegral dominated by its coefficient Gauss norm. relativePeriodLambda and relativePeriodMu are the specified coefficient-maximum and Teichmüller-restriction maps. H has these actual maps as endpoints, preserves the actual coefficient seminorm and is jointly continuous in the pointwise topology. The fixed-point test starts with a constructed Gauss point; the product-base test uses evaluation on (1,0) to separate components along H. The whole annular union/radius circle geometry is omitted from the quotient-carrier signature.

Acceptance:

- The topological circle statement supplies no adic structural map to the base.

Sources:

- [Relative p-adic Hodge theory: foundations](https://arxiv.org/abs/1301.0792), Theorem 5.4.1, Definition 5.4.3, Theorem 5.4.4 and Proposition 5.4.6, printed pp. 126–127. The source proves a topological retraction on Berkovich spectra and their quotient.
- [Nonarchimedean geometry of Witt vectors](https://arxiv.org/abs/1004.0466), Definition 7.5, Theorem 7.8 and proof, printed pp. 33–34. The stable-presentation construction fixes the actual norm maps and proves the joint continuity and max-composition law used in the relative extension.

### Surjectivity of relative period spectra

**periodSpectrumSurjectivity** (theorem; `RelativeFarguesFontaine:RF0:annuli/period-spectrum-surjectivity`).

If R→S is bounded between perfect uniform Banach F_p-algebras and M(S)→M(R) is surjective, then M(R̃_S^(int,r))→M(R̃_R^(int,r)) is surjective for every r>0. The proof extends a seminorm using a perfected auxiliary variable, a primitive quotient and a lift from M(S). No faithfully flat tensor-product hypothesis is substituted for the given spectral surjectivity.

Hypotheses: R,S retain their Banach topology; use exactly KL5.4.2’s hypothesis on Berkovich spectra.

Proof plan:

1. Adjoin and perfect a variable with its p^−1-Gauss norm.
2. Extend the given Witt seminorm so p−T is killed and read it as a primitive-quotient norm.
3. Lift the base seminorm through M(S) and the residue-field completed tensor extension.
4. Restrict the lifted norm back to the original integral growth ring.
5. Use the corrected primitive perfectoid quotient input requested from P3, as in KLII Theorem 3.3.13 rather than the incomplete proof of KL3.6.11 (source finding E10).

Prerequisites: `RelativeFarguesFontaine:RF0:annuli/witt-seminorm-lambda-mu`, `RelativeFarguesFontaine:RF0:annuli/relative-extended-robba-rings`, `RelativeFarguesFontaine:RF2:integral-divisors/ramified-primitive-untilt-equation`, `AdicSpacesPartII:R0`, `PerfectoidSpaces:P3`.

Acceptance:

- Do not broaden the conclusion to an adic-cover or tensor isomorphism without another comparison.

Sources:

- [Relative p-adic Hodge theory: foundations](https://arxiv.org/abs/1301.0792), Lemma 5.4.2, printed p. 126. The conclusion is spectral surjectivity, with an explicit auxiliary-variable proof.

### Finite etale compatibility of period rings

**periodRingsFiniteEtaleCompatibility** (theorem; `RelativeFarguesFontaine:RF0:annuli/period-rings-finite-etale-compatibility`).

Finite etale S/R lifts to the relative Witt and extended period rings. FÉt(R̃^int)→FÉt(W(R))→FÉt(R) are tensor equivalences; at a fixed r the category is φ^−1-equivariant FÉt(R̃^(int,r)), with quasi-inverse S↦R̃_S^(int,r). The bounded and completed period-ring extensions of KL5.5.4 are finite etale and satisfy its finite-module base-change comparisons. For a normalized degree-one primitive z with z_0∈R× and z−[z_0]∈pW(R^+)×, r≥1 and intervals containing 1, the listed period-ring maps become isomorphisms modulo z^m, m>0. Consequently the lifted finite-etale correspondence agrees with the imported perfectoid tilting correspondence.

Hypotheses: The fixed-radius integral category requires Frobenius descent. The primitive quotient is normalized and is taken at a window containing its radius. Use the corrected primitive definition in KLII Appendix A: z_0 is a unit of R. This concerns the generic quotient comparison and does not remove the π=0 integral leg.

Proof plan:

1. Lift a finite residue-module generating set and use a strict norm bound to obtain generators at sufficiently small radii. In the iterative proof of Lemma 5.5.2 initialize the residual with z_0=z, not the printed z_0=0 (source finding E11). Also use the S-period ring for the final arbitrary element in Lemma5.5.2 (E13), and read the scalar ring of Proposition5.5.3 without the printed FÉt wrapper (E14).
2. Use henselian lifting for the integral union and Frobenius iteration for each fixed radius.
3. Lift a finite-projective splitting and prove the completed tensor map is isometric.
4. Use the primitive relation to exchange p and [z_0] in the finite quotients; induct on m via regularity. Use the corrected x_0 coefficient and spectral coefficient norm in the final estimate of KL5.5.5 (KLII Appendix A).
5. Compare the finite-etale equivalence with the P3 almost-purity supplier, without rebuilding almost purity.

Prerequisites: `RelativeFarguesFontaine:RF0:annuli/relative-extended-robba-rings`, `RelativeFarguesFontaine:RF0:annuli/robba-controlled-splittings`, `RelativeFarguesFontaine:RF2:integral-divisors/ramified-primitive-untilt-equation`, `AdicSpacesPartII:R3/finite-projective-etale-descent`, `PerfectoidSpaces:P3`.

Acceptance:

- Record the finite module tensor comparisons from Proposition5.5.4, not a general tensor-limit interchange.

Sources:

- [Relative p-adic Hodge theory: foundations](https://arxiv.org/abs/1301.0792), Lemma 5.5.2, Propositions 5.5.3–5.5.4, Lemma 5.5.5 and Corollary 5.5.6, printed pp. 128–132. The fixed-radius integral category has Frobenius descent, and the primitive quotient theorem keeps its normalization.

### Stein exhaustion of the generic period space

**steinExhaustionAndHigherAcyclicity** (theorem; `RelativeFarguesFontaine:RF0:annuli/stein-exhaustion-and-higher-acyclicity`).

For affinoid perfectoid S, the generic Y_S admits a countable increasing exhaustion by compact rational annuli. Each annulus is sheafy and O-acyclic. Restriction maps on analytic functions have dense image, and the controlled annular approximations imply lim^1=0 for the countable inverse system. Hence H^i(Y_S,O)=0 for i>0 and O(Y_S) is its Frechet inverse limit. For general S this is applied on affinoid base charts, rather than asserting global acyclicity over a nonaffinoid base.

Hypotheses: Affinoid base and a countable cofinal annular exhaustion. The topological inverse-limit argument uses dense restrictions and complete Banach spaces, not algebraic Mittag–Leffler surjectivity.

Proof plan:

1. Choose cofinal intervals tending to both ends of the generic radius range.
2. Apply relatively perfectoid annular sheafiness and Tate acyclicity.
3. Approximate restrictions by the common dense bounded period subring.
4. Use a geometrically convergent correction sequence to kill the lim^1 obstruction, and the covering spectral sequence to conclude higher O-acyclicity.

Prerequisites: `RelativeFarguesFontaine:RF0:annuli/interval-rings-relatively-perfectoid`, `RelativeFarguesFontaine:RF0:annuli/relative-period-sheaf-and-acyclicity`, `RelativeFarguesFontaine:RF0:annuli/robba-controlled-splittings`, `AdicSpacesPartII:R0/strict-complex-completion-exact`.

Suggested form: annularInverseLimit is the subtype of compatible sequences in the actual annular section rings, with ring projections. For a sheaf on a nested exhaustion covering Y, exhaustionSectionsMap is the restriction ring homomorphism and the suggested theorem asserts its bijectivity. The additive difference map 1−shift on a countable product of complete normed section rings is separately asserted surjective when restrictions are continuous with dense range. This supplies the lim^1=0 input. The Fréchet topology comparison and sheaf-cohomology H^i vocabulary are omitted from the prototype; their exact mathematical conclusion and affinoid-base scope remain in this target.

Acceptance:

- No unproved vanishing for an arbitrary nonaffinoid base, and no automatic surjectivity of dense restrictions.

Sources:

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), II.2 opening, printed p. 57. The source assertion concerns generic Y_S for affinoid S; the annular proof explains the scope.

### Annular coefficient and anchor comparisons

**annularCoefficientChoiceAndAnchorComparisons** (comparison; `RelativeFarguesFontaine:RF0:annuli/annular-coefficient-choice-and-anchor-comparisons`).

Uniformizer and topologically nilpotent-unit choices give canonical identifications of Y_S and its sheaf; the annular coverings change by cofinal refinement with the transformed radius convention. Finite coefficient-field change is computed from the perfect unramified-base Witt tensor comparison, then rational localization, completion and integral closure of plus rings. In the specialization E=Q_p,S=Spa(F,O_F), identify each closed interval ring and plus ring with the absolute B^I,B^{I,+} of upstream AdicSpaces layer6, respecting all rational restriction maps, complete topologies and Frobenius. These comparisons commute with the fixed-field diamond presentation; a homeomorphism of spectra is insufficient.

Hypotheses: For coefficient change choose the residue embedding and corresponding q-power Frobenius. For a general completed coefficient extension use the integral coefficient-tensor interface requested from R0; no tensor product over R of nonadditive Teichmuller maps is formed.

Proof plan:

1. Use ghost-preserving Witt uniformizer transport and the unit change in each primitive equation.
2. Compare the valuations defining the two annular bases and obtain cofinal rational refinements.
3. Carry the finite unramified-base scalar comparison through the finite completed chart operations and plus-ring integral closure.
4. At the fixed-field anchor match the same Witt coefficient norms and dense subrings; the completion universal property identifies the rings, not merely their Spa sets.
5. Check each comparison commutes with restrictions, the transported Frobenius and the F0 choice transport.

Prerequisites: `RelativeFarguesFontaine:RF0:integral-Y/ramified-witt-uniformizer-change`, `RelativeFarguesFontaine:RF0:integral-Y/perfect-coefficient-base-change`, `RelativeFarguesFontaine:RF0:annuli/relative-extended-robba-rings`, `RelativeFarguesFontaine:RF0:annuli/annular-rational-base-change`, `RelativeFarguesFontaine:RF0:annuli/radius-function-and-rational-annuli`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-6-the-adic-farguesfontaine-curve`, `FarguesFontaineDiamonds:F0/choice_transport`, `AdicSpacesPartII:R0`.

Acceptance:

- A field-specialization check must give an isomorphism of complete Huber pairs compatible with the coefficient Frobenius.

Sources:

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), II.1.1 and generic-open convention, printed pp.48–49. The relative construction retains canonical choice transport; the fixed-field ring comparison matches the imported absolute period charts.
- [Relative p-adic Hodge theory: foundations](https://arxiv.org/abs/1301.0792), Definitions 5.1.1–5.1.3 and Remark 5.1.6, printed pp. 113–115. The comparison must preserve the named topologies and restriction maps.

### Local generation on period annuli

**localGenerationOnPeriodAnnuli** (theorem; `RelativeFarguesFontaine:RF0:annuli/local-generation-on-period-annuli`).

Let M be finite projective over R̃^[s,r],0<s≤r. If elements e_1,…,e_n generate its base change to R̃_(H(β))^[s,r] for β∈M(R), then they generate M after a rational localization of the base (R,R^+) encircling β. This is a local neighborhood conclusion and does not assert that M is free or that the same generators work over the whole base.

Hypotheses: Finite projective interval module, a finite proposed generating set and generation over the completed coefficient residue field.

Proof plan:

1. Apply Nakayama at each point of the residue-field period annulus.
2. Cover that compact annulus by finitely many rational neighborhoods where the elements generate.
3. Spread this finite covering to a rational base neighborhood of β.
4. Use the residue-point detection criterion for surjectivity of finite modules to conclude generation.

Prerequisites: `RelativeFarguesFontaine:RF0:annuli/relative-extended-robba-rings`, `RelativeFarguesFontaine:RF0:annuli/interval-adic-pair-and-base-projection`, `RelativeFarguesFontaine:RF0:annuli/annular-rational-base-change`, `AdicSpacesPartII:R3/glueing-square-finite-projective-descent`.

Suggested form: M is explicitly finite projective over relativeRobbaInterval. Generation is tested on annularResidueRing⊗M using 1⊗e_i; the conclusion chooses a rational localization around β and tests the same generators on rationalPeriodRing⊗M. Both rings are named constructors from the completed coefficient residue field or chosen rational localization, with the canonical interval-ring algebra maps. No arbitrary target N or unrelated linear baseChange map occurs.

Acceptance:

- This supplies the exact PAPER-KEDLAYA-LIU-15/191 target. Global sections generating every interval are the separate VB1-owned Lemma6.1.4.

Sources:

- [Relative p-adic Hodge theory: foundations](https://arxiv.org/abs/1301.0792), Lemma 5.1.7 and proof, printed p. 116. The relative residue-field generation criterion spreads over a neighborhood, without a global freeness assertion.

## Relative curve and functoriality (RF1)

### Relative Fargues–Fontaine curve

**frobeniusQuotientAndPresentation** (construction; `RelativeFarguesFontaine:RF1/frobenius-quotient-and-presentation`).

q-Frobenius acts freely and totally discontinuously on Y_S. Define X_S=Y_S/φ^Z as the analytic adic quotient, gluing open sets disjoint from their nontrivial translates. For affinoid S it is qcqs and is presented by the fundamental annulus Y_[1,q] with its two boundary annuli identified by φ:Y_[1,1]≃Y_[q,q].

Hypotheses: All perfectoid S/F_q; use the adic quotient supplied by the anchor/adic-space roadmap, not a mere quotient set.

Proof plan:

1. The positive radius and rad(φx)=q rad(x) exclude nonzero stabilizers.
2. Shrink radius intervals to avoid their q-power translates; these give local quotient charts.
3. Glue local charts by Frobenius identifications and use the compact fundamental annulus to prove qcqs.

Prerequisites: `RelativeFarguesFontaine:RF0:annuli/generic-period-domain`, `RelativeFarguesFontaine:RF0:annuli/radius-function-and-rational-annuli`, `tauceti:TauCetiRoadmap/AdicSpaces#layer-5-adic-spaces-and-elementary-geometry`.

API:

- **relativeCurve** (data): The analytic adic quotient X_S.
- **relativeCurve_localChart** (characterisation): A translate-disjoint open embeds openly in X_S.
- **relativeCurve_fundamental** (characterisation): Y_[1,q] presents X_S with φ-identification of the endpoints.
- **relativeCurve_qcqs** (structure): Affinoid S implies X_S qcqs.

Unit tests:

- **quotient_frobenius_orbit** (computation): x and φx have the same image in X_S.
- **quotient_boundary** (compatibility): Radius 1 and radius q boundary charts are identified.
- **quotient_no_special** (non-example): π=0 belongs to curly-Y and cannot enter the free-action quotient construction.

Uses:

- RF2 curve divisors and RF3 rank-one descent: Provides the actual quotient space and local trivialisations for descent.

Acceptance:

- Both boundary annuli survive, and q is the residue cardinality rather than necessarily p.
- Reuse the current Tau Ceti p-typical topology/domain/window/orbit implementation described in upstreamNotes. This node adds the stated all-E or ringed-space relative extension, not another p-typical carrier or topological quotient.

Sources:

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Definition II.1.15 and Proposition II.1.16, printed pp. 54–55. The local quotient and the boundary identification define the relative adic curve.

### Period diamonds and the topological map to the base

**diamondFormulaAndMapToBase** (theorem; `RelativeFarguesFontaine:RF1/diamond-formula-and-map-to-base`).

There are canonical isomorphisms Y_S^diamond≃S×Spd E and X_S^diamond≃(S×Spd E)/(φ_S^Z×id). Since absolute Frobenius φ_S×φ_E acts trivially on the product topology, the second presentation can topologically move the action to the coefficient factor. It gives a qcqs continuous map |X_S|→|S|. This is not an adic structural morphism X_S→S.

Hypotheses: The coefficient base is Perf_(F_q), with a chosen embedding when changing to an algebraically closed residue base.

Proof plan:

1. Restrict the integral product comparison to the generic open.
2. Identify the actual equivariant action and apply effective sheaf quotient descent.
3. Use simultaneous absolute Frobenius on topology to transfer the action; on affinoid opens the compact fundamental annulus proves the map qcqs.
4. At the fixed-field Q_p specialization identify the ring maps defining the existing F1 and F2 comparisons.

Prerequisites: `RelativeFarguesFontaine:RF0:integral-Y/untilt-functor-of-points`, `RelativeFarguesFontaine:RF1/frobenius-quotient-and-presentation`, `DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products`, `FarguesFontaineDiamonds:F1/affinoid_product`, `FarguesFontaineDiamonds:F2/quotient_iso`.

Acceptance:

- Check equivariance on maps of marked untilts, not only a homeomorphism of quotient sets.

Sources:

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proposition II.1.17 and preceding paragraph, printed p. 55. The topological map exists through diamond presentations; it is not the ordinary adic projection.

### Functoriality of relative period curves

**relativeCurveFunctoriality** (theorem; `RelativeFarguesFontaine:RF1/relative-curve-functoriality`).

A map of perfectoid bases T→S over F_q induces analytic maps curly-Y_T→curly-Y_S, Y_T→Y_S and X_T→X_S, preserving Frobenius, quotient charts and pullback of locally free sheaves. Composition and identity hold. For an open base immersion these are the open inverse images on topology. The diamond square Y_T^diamond→Y_S^diamond over T→S is cartesian; curve diamonds compare through the equivariant quotient presentation, with the Frobenius action on the varying base.

Hypotheses: General morphisms have no ordinary cartesian square X_T→X_S over T→S in adic spaces, since there is no structural X_S→S.

Proof plan:

1. Construct maps by coefficient functoriality, compatible rational inequalities and completed localisations.
2. Use the already established integral open comparison on base opens.
3. q-Frobenius equivariance descends maps to quotient charts; descent cocycles prove composition.
4. Check products and quotients on the actual untilt functors.

Prerequisites: `RelativeFarguesFontaine:RF0:integral-Y/gluing-for-general-base`, `RelativeFarguesFontaine:RF0:integral-Y/ramified-coefficient-comparison`, `RelativeFarguesFontaine:RF1/frobenius-quotient-and-presentation`, `RelativeFarguesFontaine:RF1/diamond-formula-and-map-to-base`, `AdicSpacesPartII:R0/completed-tensor-product`.

Acceptance:

- A geometric point s→S gives X_(K(s),K(s)^+)→X_S with the correct marking.

Sources:

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), II.1.3 and paragraph after II.1.16, printed pp. 49 and 55. The source supplies base maps and fibre curves without an adic projection onto S.

### Global period sheaves and etale curve maps

**globalPeriodSheavesAndEtaleFunctoriality** (construction; `RelativeFarguesFontaine:RF1/global-period-sheaves-and-etale-functoriality`).

Glue the twelve rational period sheaves over any perfect adic base; their etale sheafifications have the same values on perfect uniform affinoids. The relative-curve functor carries etale, finite etale and faithfully finite etale base morphisms to morphisms with the same property. The projection of underlying topological spaces upgrades to a morphism of etale topoi. This does not supply a structural adic map X_S→S.

Hypotheses: Use the etale comparison for the exact affinoid class; a general nonuniform affinoid is not covered.

Proof plan:

1. Glue rational period sheaves by functoriality on overlaps.
2. Use the R3 etale comparison and KL8.2.21 to identify etale values.
3. Apply period-ring finite-etale compatibility on annuli and descend along Frobenius.
4. Reduce general etale morphisms to finite-etale affinoid neighborhoods and compose the induced maps of sites.
5. Use the corrected factorization in KL8.2.20: Z_ij→Y is finite etale and Y_ij→Z_ij is an open immersion (KLII Appendix A, p. 191).

Prerequisites: `RelativeFarguesFontaine:RF0:annuli/relative-period-sheaf-and-acyclicity`, `RelativeFarguesFontaine:RF0:annuli/period-rings-finite-etale-compatibility`, `RelativeFarguesFontaine:RF1/relative-curve-functoriality`, `RelativeFarguesFontaine:RF1/diamond-formula-and-map-to-base`, `DiamondsAndVStacks:D6/etale-site-comparison`.

API:

- **globalRelativePeriodSheaf** (data): The glued period sheaves on a perfect adic base.
- **globalRelativePeriodSheaf_affinoid** (characterisation): On a rational affinoid U, the glued sheaf has the specific relativePeriodRing(coeff(U),plus(U),α_U,p,s,r,i) as its ring of functions.
- **relativeCurve_etale** (functoriality): Etale base maps induce etale curve maps.
- **relativeCurve_finiteEtale** (characterisation): Finite etale and faithfully finite etale base maps retain those properties.
- **relativeCurve_etaleTopos** (data): The underlying projection induces a morphism of etale topoi.

Unit tests:

- **global_period_affinoid** (compatibility): Restriction to an affinoid recovers the rational period sheaf.
- **curve_split_etale** (computation): A disjoint union of two copies of S gives two copies of X_S.
- **curve_etale_not_structural** (non-example): The topos projection and continuous projection do not imply an adic structural ring map.

Uses:

- RF4 bundle descent: Supplies actual etale sites and compatible period sheaves for bundle classification.

Suggested form: Global affine values keep the same coefficient functor, plus subrings, norms, prime, radii and variant as the rational period presheaves. The étale maps use the actual relative-curve functor. Its split test compares F(S⊔S) with F(S)⊔F(S), so an unrelated ring equivalence cannot discharge it. The perfectoid-base domain, sheaf proof and geometric étale property await their owner vocabulary and are omitted explicitly under §13.

Acceptance:

- The all-E extension of the p-typical period sheaf statements is proved in the coefficient comparison.

Sources:

- [Relative p-adic Hodge theory: foundations](https://arxiv.org/abs/1301.0792), Definition 8.3.4, printed p. 166; Lemma 8.7.15 and Remark 8.7.16, p. 180. The conclusion is a site/topos morphism, rather than a missing map of structure rings.

### Lubin–Tate diamond presentation

**lubinTateDiamondPresentation** (comparison; `RelativeFarguesFontaine:RF1/lubin-tate-diamond-presentation`).

For the perfect characteristic-p field F tilt of the Lubin–Tate tower E_LT∞, the associated classical generic period space has diamond Y_F^◇≃Spd(F)×Spd(E), equivalently the punctured perfectoid open-disc presentation of FF18 Remark3.19. The relative curve is its φ^Z quotient. The LT-tower presentation uses the O_E× action supplied by Lubin–Tate theory and local reciprocity; it is separate from the whole π/[ϖ] root extension used to prove integral chart perfectoidness.

Hypotheses: This is the field-case comparison in the source. The LT torsion tower, its tilt and reciprocity are precise missing upstream inputs; no universal base or root/LT tower identification is assumed.

Proof plan:

1. Use the formal-group torsion tower and its tilted open-disc coordinate.
2. Apply the reviewed diamond product description to the field pair.
3. Track the coefficient action and Frobenius orbit on both presentations.
4. Compare the resulting quotient with the RF1 curve presentation.

Prerequisites: `RelativeFarguesFontaine:RF0:integral-Y/lubin-tate-teichmuller-lift`, `RelativeFarguesFontaine:RF1/diamond-formula-and-map-to-base`, `RelativeFarguesFontaine:RF0:integral-Y/root-extension-chart-model`.

Acceptance:

- Keep E_LT∞ and E_root∞ as distinct named extensions.

Sources:

- [Courbes et fibres vectoriels en theorie de Hodge p-adique](https://www.imo.universite-paris-saclay.fr/~fontaine/courbe.pdf), Preface Remark 3.19, printed p. 38. The remark records the punctured perfectoid-disc/diamond picture arising from the LT field; the all-base product theorem is supplied separately.

## Divisors and local period rings (RF2)

This aggregate is realized by the integral-divisor and generic-untilt targets below.

## Integral divisors (RF2:integral-divisors)

### Ramified primitive untilt equations

**ramifiedPrimitiveUntiltEquation** (theorem; `RelativeFarguesFontaine:RF2:integral-divisors/ramified-primitive-untilt-equation`).

An O_E-untilt (R^sharp,R^sharp+) of the marked perfectoid pair (R,R^+) gives a continuous surjection θ_E:W_OE(R^+)→R^sharp+ with principal regular kernel (ξ). Locally choose ϖ with ϖ^sharp dividing π and a lift a of π/ϖ^sharp; then ξ=π−a[ϖ] is a primitive generator. This includes a characteristic-p untilt with ξ=π. For E=Q_p the construction and primitive ideal agree with the imported P1 correspondence. An arbitrary element of W_OE(R^+) is not asserted primitive.

Hypotheses: All E, specified coefficient embedding and marked untilt; characteristic-p leg allowed on the integral domain. The q-Teichmuller formal-group lifts are not substituted for multiplicative [ϖ] in this equation.

Proof plan:

1. In mixed characteristic obtain the coefficient theta by the p-typical theta and the O_E action, using the unramified scalar comparison; in equal characteristic evaluate the power-series variable at the coefficient π.
2. Apply the ramified strict-lift quotient argument to identify the untilt plus ring and its regular primitive kernel.
3. Choose ϖ^sharp|π, lift the quotient through θ_E, and compare with the primitive generator using reduction and the coefficient of π.
4. Check the p-typical specialization on theta and its kernel, not only on the quotient carrier.

Prerequisites: `RelativeFarguesFontaine:RF0/ramified-witt-universal-property`, `RelativeFarguesFontaine:RF0:integral-Y/perfect-coefficient-base-change`, `PerfectoidSpaces:P1/fontaine-theta-and-primitive-kernel`, `PerfectoidSpaces:P1/untilts-classified-by-primitive-ideals`, `PerfectoidSpaces:P1/distinguished-element-criterion`.

Acceptance:

- Prove the ramified regularity/quotient comparison before the integral closed-image argument; do not infer it from generic invertibility of π.

Sources:

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proposition II.1.4 proof, printed p. 50. The source first identifies the regular primitive quotient and then chooses this convenient equation.

### Untilts as integral closed Cartier divisors

**closedCartierDivisorNormEstimate** (theorem; `RelativeFarguesFontaine:RF2:untilts/closed-cartier-divisor-norm-estimate`).

The marked O_E-untilt embeds into curly-Y_S as a relative closed Cartier divisor. On a neighborhood U={|ξ|≤|[ϖ]|^n}, give each completed residue field the normalization |[ϖ]|=q^−1 and A=O(U) its spectral norm. Multiplication by ξ satisfies ||ξa||≥q^−n||a||. Therefore it is injective with closed image, and the completed untilt quotient is already A/ξ; 0→O→O→i_*O_(S^sharp)→0 is exact. This remains valid at π=0 and on every geometric-base fibre.

Hypotheses: ξ the ramified primitive equation just constructed; after localisation the untilt pullback is all of S^sharp. The normalization and common neighborhood are part of the assertion.

Proof plan:

1. Any neighborhood of the Cartier zero contains one of the displayed U.
2. Reduce to a geometric fibre and its perfected disc using the root extension and tilt. Approximate by finite-level ordinary rational-disc functions. Apply the R0 strict finite-type affinoid maximum-modulus theorem only at those finite levels, where the Shilov boundary lies on |ξ|=|[ϖ]|^n.
3. Take the supremum of the finite-level boundary estimates |ξf|=q^−n|f|, then pass through the norm-controlled approximations to the perfected disc. This proves the lower bound without assuming a general perfected affinoid has a point attaining the spectral supremum.
4. The lower bound gives regularity and closed image by completeness. Since the untilt is the separated completion of A/ξ, closedness identifies the algebraic quotient with the complete ring.
5. Check fibrewise Cartier exactness using the same construction.

Prerequisites: `RelativeFarguesFontaine:RF2:integral-divisors/ramified-primitive-untilt-equation`, `RelativeFarguesFontaine:RF0:integral-Y/curly-Y-affinoid-definition`, `RelativeFarguesFontaine:RF0:integral-Y/chart-cover-perfectoidness-and-sheafiness`, `AdicSpacesPartII:R0/affinoid-maximum-modulus`, `FarguesFontaineDiamonds:F4/multiplication_lower_bound`.

Acceptance:

- Use the reciprocal/root-corrected disc model; the zero section is included, and no generic-only divisor theorem is an input.

Sources:

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proposition II.1.4 and Remark II.1.5, printed p. 50. The norm estimate proves the complete quotient; this integral argument precedes products.

### Ordinary descent of period line bundles

**ordinaryVDescentOfPeriodLineBundles** (theorem; `RelativeFarguesFontaine:RF2:integral-divisors/ordinary-v-descent-of-period-line-bundles`).

Invertible O-modules on curly-Y_S, with their maps into O, satisfy effective v-descent in the perfectoid base S. The descended object is an ordinary invertible sheaf and its inclusion, not only an almost module. The generic and curve-local versions follow by restriction and Frobenius descent.

Hypotheses: Use affinoid period charts with topological-module root splitting; descent includes cocycles and maps. A global generator need not descend.

Proof plan:

1. Apply perfectoid vector-bundle v-descent on the root-extended charts.
2. Use the continuous split-module comparison to descend the finite projective module, as in SW 19.5.3; use rational Kiehl glueing on overlaps.
3. Descend the map to O and verify the invertible ideal condition v-locally.
4. For a degree-one leg the locally chosen generators can change by units; their ideals descend canonically.

Prerequisites: `RelativeFarguesFontaine:RF0:integral-Y/root-extension-chart-model`, `RelativeFarguesFontaine:RF0:integral-Y/chart-cover-perfectoidness-and-sheafiness`, `DiamondsAndVStacks:D3`, `AdicSpacesPartII:R3/sheafy-tate-acyclicity-and-kiehl-gluing`.

Acceptance:

- Record the missing general perfectoid vector-bundle descent interface in D3; no incoming VB1 dependency.

Sources:

- [Berkeley Lectures on p-adic Geometry](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), Proposition 19.5.3 and proof, printed pp. 180–181. The general torsor statement uses ordinary vector-bundle descent and a split-module argument; only its GL_1 consequence is needed here.
- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.1.2 proof, printed p. 191. The source descends the invertible ideal itself.

### Effective divisor moduli

**divDModuliVSheaf** (definition; `RelativeFarguesFontaine:RF2:integral-divisors/div-d-moduli-v-sheaf`).

For d≥0 define the small v-sheaves Div^d_curlyY=(Spd O_E)^d/Σ_d, Div^d_Y=(Spd E)^d/Σ_d and Div^d_X=(Spd E/φ^Z)^d/Σ_d. Each quotient is the sheafification of orbit classes, not the quotient stack. Coincident legs have multiplicity and must not be deleted. At d=0 the sheaf is final and its divisor is empty.

Hypotheses: On Perf_(F_q); coefficient base and Frobenius action are fixed. Formation of Div_X requires the actual RF1 curve quotient, while the integral product definition only needs curly-Y.

Proof plan:

1. Form finite products of the specified small v-sheaves.
2. Use the small sheaf quotient interface and compare with the sheaf of isomorphism classes of the action groupoid.
3. Restrict the integral coefficient factor to E; use the curve quotient on each individual leg for Div_X.

Prerequisites: `RelativeFarguesFontaine:RF0:integral-Y/untilt-functor-of-points`, `RelativeFarguesFontaine:RF1/frobenius-quotient-and-presentation`, `RelativeFarguesFontaine:RF1/diamond-formula-and-map-to-base`, `DiamondsAndVStacks:D0/groupoid-quotients-and-two-fibre-products`, `mathlib:CategoryTheory.presheafToSheaf`.

API:

- **effectiveDivisors** (data): The v-sheafification of U↦Sym(Leg(U),d), whose restrictions apply the leg restriction to every component. Choose Leg=Spd O_E, Spd E or the constructed Frobenius quotient according to the domain.
- **effectiveDivisors_zero** (characterisation): The sheafification of Sym(Leg(U),0) is the final sheaf, with empty divisor.
- **effectiveDivisors_orderedCover** (universal-property): The map from the actual finite product Leg^d sends an ordered section to its symmetric orbit class and then to the sheafification; it is an epimorphism.
- **effectiveDivisors_generic** (compatibility): The coefficient-open leg inclusion induces the generic symmetric-power open subfunctor.

Unit tests:

- **divisor_degree_zero** (degenerate): The actual constructed sheaf has exactly one degree-zero section over each test object.
- **divisor_double** (computation): The image of the actual ordered tuple (a,a) is the sheafification of its repeated symmetric orbit, with length two and no deletion of a leg.
- **divisor_not_stack** (non-example): In the discrete category of sections of constructed Div^2, the endomorphisms of the repeated divisor form a subsingleton; the swap is a distinct nonidentity stabilizer of its ordered tuple. This distinguishes orbit sheaf from action stack.

Uses:

- FS VI.1.2 and GeometricSatakeAndFusion:GS0:loop-geometry: Supplies integral, generic and curve leg bases for the corresponding completed rings.

Suggested form: The orbit presheaf and toSheafify map are explicit. The stack nonexample tests both the nontrivial swap stabilizer and the discrete endomorphisms of the actual divisor sheaf section; testing only invariance under swap would be insufficient.

Acceptance:

- For d=2, (D,D) is a legitimate ordered lift of 2D; its presence is independent of a global ordering obstruction for other divisors.

Sources:

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Definition VI.1.1, printed p. 190. The symmetric quotients are sheaf quotients, retaining repeated entries.

### Product Cartier equations and affineness

**productEquationAndAffineness** (theorem; `RelativeFarguesFontaine:RF2:integral-divisors/product-equation-and-affineness`).

An ordered tuple of d O_E-untilts cuts out a closed Cartier divisor on curly-Y_S with equation ξ=∏_i ξ_i. For affinoid S its ring is W_OE(R^+)[1/[ϖ]]/(ξ), with plus ring the integral closure of W_OE(R^+)/(ξ). Multiplication by the product is regular with closed image on a common suitable neighborhood, including repeated ξ_i. After ordinary ideal descent an unordered divisor is also affinoid for affinoid S. Generic divisors are affine by restriction; divisors on X_S are affine only locally in the analytic topology of S.

Hypotheses: d≥0, with ξ=1 for d=0; generators exist after ordering/localisation, not necessarily globally.

Proof plan:

1. Apply the degree-one Cartier lower bounds successively on a common chart; the product lower bound is the product of the constants.
2. Identify the complete product quotient and the integral-closure plus ring.
3. Descend the invertible ideal along the ordered cover, preserving regularity and its inclusion into O.
4. Quasicompactness over affinoid S places the support in one integral chart; identify its complete quotient there.
5. Use Frobenius local charts for X; do not infer a global affinoid presentation on X.

Prerequisites: `RelativeFarguesFontaine:RF2:untilts/closed-cartier-divisor-norm-estimate`, `RelativeFarguesFontaine:RF2:integral-divisors/ordinary-v-descent-of-period-line-bundles`, `RelativeFarguesFontaine:RF2:integral-divisors/div-d-moduli-v-sheaf`, `RelativeFarguesFontaine:RF0:integral-Y/integral-rational-chart-rings`, `RelativeFarguesFontaine:RF1/frobenius-quotient-and-presentation`.

Acceptance:

- At repeated legs the local ring is A/(ξ_1²), not A/(ξ_1); the zero divisor has ring 0.

Sources:

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proposition VI.1.2 and proof, printed p. 191. The product equation, ideal descent and chart containment yield the three affine assertions.

### Geometric degree criterion

**relativeDegreeCriterion** (theorem; `RelativeFarguesFontaine:RF2:integral-divisors/relative-degree-criterion`).

Div^d_curlyY(S), Div^d_Y(S) and Div^d_X(S) identify with relative effective closed Cartier divisors whose pullback to every geometric Spa(C,C^+) has total degree d, counting lengths and repeated points. In the integral case the characteristic-p point is included. For a pre-existing Cartier divisor, this criterion supplies local ordered presentations rather than assuming an ordering in the definition.

Hypotheses: The integral extension of the family factorisation theorem is a recorded proof gap; the generic symmetric-power theorem is Far Proposition 2.18 in the edition read. d=0 is the empty divisor.

Proof plan:

1. The product equation proves the fibre degree of every tuple, including multiplicities.
2. For the converse use geometric factorisation of primitive period functions and the family lifting of their unordered roots.
3. In the generic case compare Far Definition 2.6 and Proposition 2.18 with the leg quotient.
4. For the integral endpoint and arbitrary base isolate the missing factorisation/descent bridge as a gap, rather than using Banach–Colmez properness or bundle classification as an early input.

Prerequisites: `RelativeFarguesFontaine:RF2:integral-divisors/div-d-moduli-v-sheaf`, `RelativeFarguesFontaine:RF2:integral-divisors/product-equation-and-affineness`, `RelativeFarguesFontaine:RF2:integral-divisors/ordinary-v-descent-of-period-line-bundles`, `DiamondsAndVStacks:D3`, `mathlib:Module.length`.

Suggested form: The suggested relativeDegreeCriterion is the local geometric-fibre calculation: in a DVR, the quotient by the product of d parameters has module length d, including d=0 and repeated parameters. primitiveProductIdeal is the actual product ideal. This is the forward length fragment of the full family criterion. It does not assert factorization of an arbitrary Cartier divisor or remove the recorded early all-E family-factorization gap.

Acceptance:

- The generic proof in the author preprint uses Picard/section theorems; the all-E integral extension needs an independent early proof, which is recorded explicitly.
- The full inverse family implication needs the explicit integral factorization argument recorded as a gap; the DVR product-length signature certifies only the geometric forward calculation.

Sources:

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Remark VI.1.3, printed p. 191. The remark asserts the fibrewise characterization.
- [Simple connexite des fibres d une application d Abel-Jacobi et corps de classes local](https://webusers.imj-prg.fr/~laurent.fargues/cdc.pdf), Definition 2.6 and Proposition 2.18, printed pp. 6 and 11. The generic ordered sum is a surjective quasi-pro-etale diamond morphism and its symmetric sheaf quotient is Div^d.

### Descent on divisors and their thickenings

**vDescentOfBundlesOnTheDivisor** (theorem; `RelativeFarguesFontaine:RF2:integral-divisors/v-descent-of-bundles-on-the-divisor`).

For a family D_S from Div^d, vector bundles on D_S and on each finite infinitesimal thickening V(I_D^n), n≥1, form v-stacks in S. Morphisms and descent data descend, and effectivity gives ordinary finite locally free modules. The limit of the finite quotient rings is a v-sheaf; the almost vanishing used in matrix correction is not the final descent conclusion.

Hypotheses: Affineness local on S for curve divisors; finite n. The separate completion-module algebraization is not asserted here.

Proof plan:

1. Descend morphisms by function-sheaf descent and finite quotient exact sequences.
2. Over geometric bases induct on divisor degree and thickening length, reducing the reduced degree-one case to the untilt vector-bundle theorem.
3. Reduce étale covers to rational and finite étale covers on the stable affinoid basis; use ordinary finite projective descent.
4. For a general v-cover approximate the geometric invariant basis so the cocycle is in 1+[ϖ]M_r(O^+/ξ).
5. Root-chart module splitting transfers almost H^1 vanishing from the perfectoid cover. Correct the cocycle successively with shrinking norm; completeness gives an invariant basis and an ordinary descended bundle.

Prerequisites: `RelativeFarguesFontaine:RF2:integral-divisors/product-equation-and-affineness`, `RelativeFarguesFontaine:RF2:untilts/closed-cartier-divisor-norm-estimate`, `DiamondsAndVStacks:D2/v-descent-of-functions`, `DiamondsAndVStacks:D3`, `PerfectoidSpaces:P3`, `AdicSpacesPartII:R5/stable-basis-covering-reduction`, `AdicSpacesPartII:R3/finite-projective-etale-descent`.

Acceptance:

- Check ξ² and every ξ^n; a double leg is not treated as a reduced degree-one divisor.

Sources:

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proposition VI.1.4 and proof, printed pp. 191–192. The matrix-improvement argument proves ordinary effectivity using almost H^1 as a tool.
- [Berkeley Lectures on p-adic Geometry](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf), Lemma 17.1.8 and Corollary 17.1.9, printed pp. 150–151. The same filtration/limit method treats finite local de Rham thickenings and their rings.

### Completed divisor period rings

**completedRingsBPlusAndB** (construction; `RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B`).

For the invertible Cartier ideal I_D⊂O_Z, Z=curly-Y_S,Y_S or X_S, define the sheaf B_D^+=lim_(n≥1)O_Z/I_D^n on the formal divisor and B_D by locally inverting a generator of its completed ideal. If D is affine, take global sections; on X use the analytic local affine presentation. A generator ξ identifies this with ξ-adic completion and localization, but ξ′=uξ changes only the trivialization. The construction is intrinsic to I_D and descends under permutations and v-covers.

Hypotheses: Completion is of the ambient sheaf, not of O_D with its zero divisor ideal. The zero divisor gives the zero ring. A general completed base change must use continuous completed maps; ordinary tensor products need not commute with the inverse limit.

Proof plan:

1. Apply existing adic completion on each affine neighborhood with its actual ideal, then glue by the ideal-independent quotient system.
2. Use regularity to identify the completed ideal locally as a line and invert its local generator.
3. The unit-change comparison makes the localizations glue canonically.
4. Function descent on all finite thickenings and limits proves the v-sheaf property; order is irrelevant after ideal descent.

Prerequisites: `RelativeFarguesFontaine:RF2:integral-divisors/product-equation-and-affineness`, `RelativeFarguesFontaine:RF2:integral-divisors/v-descent-of-bundles-on-the-divisor`, `mathlib:AdicCompletion`, `mathlib:IsLocalization`, `mathlib:Ideal.span`, `mathlib:Ideal.span_singleton_mul_left_unit`.

API:

- **divisorCompletion** (data): Intrinsic inverse-limit ring/sheaf B_D^+.
- **divisorPuncturedCompletion** (data): Local inversion of the completed invertible ideal.
- **divisorCompletion_generator** (compatibility): A generator identifies B_D^+ with its adic completion.
- **divisorCompletion_changeGenerator** (equivalence): Replacing ξ by uξ induces the canonical identical ideal-adic ring.
- **divisorCompletion_residue** (characterisation): B_D^+→O_D has kernel the completed ideal.
- **divisorCompletion_complete** (universal-property): For a finitely generated ideal I (locally principal for the Cartier input), the completion is complete for the extended ideal; B_D^+≃lim_n B_D^+/I_D^n.

Unit tests:

- **completion_empty** (degenerate): D=∅ gives B_D^+=0.
- **completion_double** (computation): Completion along (ξ²) and along (ξ) have cofinal filtrations, but A/ξ² and A/ξ differ.
- **completion_special** (compatibility): At the characteristic-p leg ξ=π the integral completion is W_OE(R), rather than the absolute characteristic-p input of Mathlib BDeRhamPlus.
- **completion_unit_change** (compatibility): ξ and uξ generate identical powers of ideals.

Uses:

- RF2:untilts, RF4 and GS0 loop geometry: Supplies residue, filtration and punctured-completion rings while preserving the integral special fibre.

Acceptance:

- A repeated leg is completed along (ξ²), which has a cofinal power filtration with (ξ); its finite quotient modulo (ξ²) still retains multiplicity.

Sources:

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.1 after Proposition VI.1.4, printed p. 192. The positive and punctured rings are defined from the invertible ideal in all three period domains.

### Addition and disjoint divisor loci

**additionAndDisjointDivisorLoci** (construction; `RelativeFarguesFontaine:RF2:integral-divisors/addition-and-disjoint-divisor-loci`).

Concatenation of ordered tuples descends to Div^d×Div^e→Div^(d+e), associative and commutative with the empty-divisor unit. Its Cartier ideal is I_(D+E)=I_D I_E. The disjoint locus consists of pairs with disjoint supports, equivalently I_D+I_E=O locally, and there the positive completed ring splits B_(D+E)^+≃B_D^+×B_E^+ by the Chinese remainder theorem. At colliding legs this product splitting is not asserted.

Hypotheses: All three divisor domains; disjointness is local in the analytic space. Quotienting does not discard equal entries.

Proof plan:

1. Use block concatenation and permutation invariance on the ordered covers.
2. Multiply the descended Cartier ideals.
3. For disjoint supports apply CRT to every power of the comaximal ideals and pass to inverse limits.

Prerequisites: `RelativeFarguesFontaine:RF2:integral-divisors/div-d-moduli-v-sheaf`, `RelativeFarguesFontaine:RF2:integral-divisors/product-equation-and-affineness`, `RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B`.

API:

- **divisorAdd** (data): Degree-additive concatenation of symmetric leg quotients.
- **divisorAdd_ideal** (characterisation): I_(D+E)=I_D I_E.
- **divisorAdd_assoc** (characterisation): (D+E)+F=D+(E+F).
- **divisorAdd_disjointCompletion** (compatibility): Comaximal supports give the completed CRT product.

Unit tests:

- **addition_empty** (degenerate): D+0=D.
- **addition_repeat** (computation): D+D=2D with ideal I_D².
- **addition_no_crt_collision** (non-example): For a geometric leg, A/ξ² is a length-two local thickening and is not (A/ξ)×(A/ξ).

Uses:

- HeckeStacksAndLocalShtukas and GS0 factorisation: Distinguishes disjoint factorisation from coincident-leg geometry.

Acceptance:

- The repeated divisor 2D has equation ξ² and does not satisfy the disjoint CRT hypothesis.

Sources:

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Definition VI.1.1 and VI.1.2 product proof, printed pp. 190–191. Concatenation and product equations give addition including repeated legs.
- [Simple connexite des fibres d une application d Abel-Jacobi et corps de classes local](https://webusers.imj-prg.fr/~laurent.fargues/cdc.pdf), §2.4 preceding Proposition 2.18, printed p. 11. The source explicitly records the divisor addition monoid.

## Generic untilts and completions (RF2:untilts)

### Generic marked untilt comparison

**primitiveUntiltCorrespondence** (comparison; `RelativeFarguesFontaine:RF2:untilts/primitive-untilt-correspondence`).

Restrict the all-E integral theta/primitive presentation to O_E-untilts in which π is invertible. The marked untilt is a Cartier divisor on Y_S and then on X_S; the latter depends only on its Frobenius orbit. In the E=Q_p case the marking, theta map, primitive ideal and quotient plus ring identify with P1/marked-untilt and P1/untilts-classified-by-primitive-ideals. This imports that correspondence rather than constructing another p-typical primitive-ideal theory.

Hypotheses: An E-untilt, not merely an O_E-untilt; geometric residue and plus-ring markings are retained.

Proof plan:

1. Use the integral ramified presentation and closed Cartier estimate.
2. Restrict to the generic open, then descend through the local Frobenius quotient.
3. Match the p-typical coefficient ring and theta on the marked pair, including the ideal and plus ring.
4. Frobenius translates give the same curve divisor; local inverse charts recover the orbit.

Prerequisites: `RelativeFarguesFontaine:RF2:integral-divisors/ramified-primitive-untilt-equation`, `RelativeFarguesFontaine:RF2:untilts/closed-cartier-divisor-norm-estimate`, `RelativeFarguesFontaine:RF1/frobenius-quotient-and-presentation`, `PerfectoidSpaces:P1/marked-untilt`, `PerfectoidSpaces:P1/untilts-classified-by-primitive-ideals`, `FarguesFontaineDiamonds:F4/curve_untilt_divisor`.

Acceptance:

- A special-fibre leg is outside this comparison; its integral presentation remains valid.

Sources:

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proposition II.1.18, printed p. 55. The generic curve divisor depends on the Frobenius orbit of the marked untilt.

### Degree-one divisor moduli and coefficient base

**div1ModuliAndProperness** (construction; `RelativeFarguesFontaine:RF2:untilts/div1-moduli-and-properness`).

The degree-one Cartier-divisor moduli on Perf_(F_q) is Div^1=Spd E/φ^Z, canonically the d=1 curve-leg quotient. Its points locally on the analytic base come from an E-untilt. After base change to Perf_k, k an algebraic closure of F_q with fixed coefficient embedding, it is Spd Ĕ/φ^Z, where Ĕ=W_OE(k)[1/π]. The two coefficient bases must not be identified before this base change. This node constructs the moduli only; its properness, spatial representability and cohomological smoothness have the accepted VB3:general-BC owner.

Hypotheses: Sheaf quotient, not the diamond of one fixed curve. The legacy node id is preserved while the late property payload is forwarded.

Proof plan:

1. Take the degree-one specialization of the symmetric quotient and compare with generic marked-untilt orbits.
2. Use the local quotient charts to see open-cover and v-cover quotients agree here.
3. Compute the coefficient-base extension using the strict-lift/unramified completion and track φ.

Prerequisites: `RelativeFarguesFontaine:RF2:integral-divisors/div-d-moduli-v-sheaf`, `RelativeFarguesFontaine:RF2:untilts/primitive-untilt-correspondence`, `RelativeFarguesFontaine:RF1/diamond-formula-and-map-to-base`, `RelativeFarguesFontaine:RF0/ramified-witt-universal-property`, `mathlib:CategoryTheory.presheafToSheaf`.

API:

- **degreeOneDivisors** (data): The sheafification of the pointwise integer-Frobenius orbit presheaf of Spd E, with the identification with the degree-one curve-leg symmetric sheaf.
- **degreeOneDivisors_localUntilts** (characterisation): The actual sheafification unit sends a coefficient untilt to its orbit divisor; each divisor admits such a lift locally on the analytic base.
- **degreeOneDivisors_baseChange** (compatibility): For the specified inverse-image functor Perf_k→Perf_(F_q), the coefficient-base comparison and its Frobenius compatibility induce an isomorphism between base-changed Div^1 and the sheafification of Spd Ĕ/φ^Z.

Unit tests:

- **divone_fq_base** (compatibility): A section a and a distinct Frobenius translate φ(a) have the same image in the actual constructed Div^1; the raw Spd E definition fails this test.
- **divone_algebraic_closure** (computation): The constructed Div^1 base-change comparison uses the fixed inverse-image functor, coefficient isomorphism and compatible Frobenius automorphisms on both sites.
- **divone_not_fixed_curve** (non-example): For a two-point coefficient section set exchanged by Frobenius, the constructed orbit set has one element. This checks the quotient operation, distinct from a raw coefficient space or one fixed geometric curve.

Uses:

- HeckeStacksAndLocalShtukas:HS0 and GS0: Provides degree-one leg data before any properness/smoothness theorem.
- VectorBundlesAndIsocrystals:VB3:general-BC: Supplies the moduli input for the separately owned FS II.1.21 theorem.

Suggested form: The Frobenius orbit setoid, pointwise quotient presheaf, sheafification and its section map are explicit. The base-change API compares these constructed sheaves using the actual inverse-image functor and Frobenius-compatible coefficient identification; it no longer accepts an unrelated quotient object.

Acceptance:

- Do not import C4, S5 or VB3 back into the early divisor construction.

Sources:

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Definition II.1.19 and following paragraph, printed p. 56. The source’s Perf_Fq formula precedes the Perf_k unramified-completion formula after II.2.4.

### P-typical affinoid de Rham comparison

**pTypicalAffinoidCompletionComparison** (comparison; `RelativeFarguesFontaine:RF2:untilts/p-typical-affinoid-completion-comparison`).

For a characteristic-zero perfectoid field K with an open bounded valuation subring K^+ and a perfectoid affinoid (K,K^+)-algebra (A,A^+), put S=Spa(A^flat,A^flat+), take its Q_p-untilt divisor D and J=ker(θ:W(A^flat+)[1/p]→A). Then B_D^+≃lim_n W(A^flat+)[1/p]/J^n, preserving θ, J, the residue map and filtration. Under the checked P1 comparison PreTilt A^+ p≃A^flat+, this is the pinned Mathlib BDeRhamPlus A^+ p. Only after this actual identification import R06.1’s affinoid theorem and its local generator.

Hypotheses: K and K^+ satisfy the exact R06.1/bdr-plus-of-perfectoid-affinoid-algebras hypotheses. K need not be C_p. The primitive generator from K has nonzero image in every affinoid input; A^+ is p-adically complete with p nonunit.

Proof plan:

1. Match the geometric tilt to Mathlib PreTilt through the P1 comparison.
2. Match Mathlib fontaineTheta, localization away from p and its extended kernel with the divisor theta map.
3. Use a Cartier neighborhood and the cofinal ideal-power quotient system to identify the two completions.
4. Map the chosen primitive generator from the field and check that it generates the same ideal. Invoke the R06.1 theorem with this comparison, retaining its residue and filtration.

Prerequisites: `RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B`, `RelativeFarguesFontaine:RF2:untilts/primitive-untilt-correspondence`, `PerfectoidSpaces:P1/tilt-comparison-with-mathlib-pretilt`, `PadicHodgeTheory:R06.1/bdr-plus-of-perfectoid-affinoid-algebras`, `mathlib:BDeRhamPlus`, `mathlib:WittVector.fontaineTheta`, `mathlib:PreTilt`, `mathlib:PreTilt.untilt`.

Acceptance:

- The comparison precedes supplier reuse and includes the actual ideal and residue map. Characteristic-p inputs are outside this theorem.

Sources:

- [p-adic Hodge theory for rigid-analytic varieties](https://people.mpim-bonn.mpg.de/scholze/pAdicHodgeTheory.pdf), §6, Definition 6.1, Lemma 6.3 and Corollary 6.4, printed pp. 35–36. The exact affinoid range and theta-adic ring are the supplier’s statement.
- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.1 completion definition, printed p. 192. The divisor-completion notation is identified with the same theta-adic object.

### Ramified de Rham coefficient comparison

**coefficientFieldDeRhamComparison** (theorem; `RelativeFarguesFontaine:RF2:untilts/coefficient-field-de-rham-comparison`).

For finite E/Q_p and a marked E-untilt A over a characteristic-zero perfectoid field, the θ_E-adic completion of W_OE(A^flat+)[1/π] is canonically the p-typical B_D^+ of A, with the chosen E action lifted from the residue ring. It preserves residue, the completed Cartier ideal, filtration and localization. For E′/E the comparison is compatible with a specified E′ action on the same untilt; a tensor product over the smaller coefficient field before selecting that action can have extra factors.

Hypotheses: Perfect residue coefficient ring with F_q action; the chosen embedding E→A selects the completion factor. This comparison is only mixed characteristic.

Proof plan:

1. Identify the ramified Witt ring with its p-typical scalar extension over the maximal unramified coefficient ring.
2. After inverting p the coefficient extension is finite separable. Lift the chosen residue action uniquely through each square-zero step J^n/J^(n+1) by formal etaleness; lift the compatible sequence to the complete ring.
3. The corresponding finite-etale factor has residue A and is isomorphic to the completed p-typical ring; the selected factor gives the θ_E completion.
4. Identify the two completed invertible ideals and their unit-related local generators; this gives filtration and punctured-localization compatibility.

Prerequisites: `RelativeFarguesFontaine:RF0:integral-Y/perfect-coefficient-base-change`, `RelativeFarguesFontaine:RF2:untilts/p-typical-affinoid-completion-comparison`, `mathlib:Algebra.FormallyEtale.comp_bijective`, `mathlib:Algebra.FormallyEtale.of_isSeparable`, `mathlib:IsAdicComplete.liftRingHom`.

Acceptance:

- Preserve the selected embedding; do not claim the entire finite scalar extension is a single de Rham ring.

Sources:

- [Courbes et fibres vectoriels en theorie de Hodge p-adique](https://www.imo.universite-paris-saclay.fr/~fontaine/courbe.pdf), Lemme 1.2.3 and coefficient base change, printed pp. 55–56. The coefficient comparison is the starting ring map; the completion factor is selected by the untilt coefficient embedding.
- [Henselian pairs and finite etale algebras](https://stacks.math.columbia.edu/tag/09ZL), Tags 09XI and 09ZL, accessed 7 October 2026. Finite etale lifting selects the unique residue-compatible factor of the complete coefficient extension.

### Generic divisor de Rham rings

**BdRCompletionAndFiltration** (comparison; `RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration`).

For a generic degree-one leg, write B_dR^+=B_D^+ and B_dR=B_D, using the intrinsic completed Cartier ideal. The p-typical affinoid object is identified by the explicit affinoid comparison and its R06.1 theorem; finite mixed-characteristic coefficients are compared by the selected-factor theorem. Equal-characteristic E and arbitrary perfectoid bases retain the intrinsic all-E ideal-adic construction and v-descent. For d>1 the same notation denotes a divisor ring and is not automatically a DVR.

Hypotheses: The completion and punctured ring were constructed once in integral-divisors. This node is their generic de Rham interpretation, not another independent completion.

Proof plan:

1. Restrict the integral completion to Div^1_Y and Div^1_X.
2. Apply the p-typical and finite-coefficient comparisons exactly in their hypotheses.
3. For equal characteristic use the power-series coefficient ring and the local Cartier ideal directly.
4. Glue the generic identifications and compare them with the integral construction on common quotient systems.

Prerequisites: `RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B`, `RelativeFarguesFontaine:RF2:untilts/p-typical-affinoid-completion-comparison`, `RelativeFarguesFontaine:RF2:untilts/coefficient-field-de-rham-comparison`, `RelativeFarguesFontaine:RF2:untilts/primitive-untilt-correspondence`.

Acceptance:

- Absolute Mathlib BDeRhamPlus on a characteristic-p input is zero; it cannot replace the equal-characteristic E divisor completion.

Sources:

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.1 after Proposition VI.1.4, printed p. 192. The de Rham name is attached to the already defined divisor completion.

### Cartier filtration and Breuil–Kisin lines

**cartierFiltrationAndBreuilKisinLines** (theorem; `RelativeFarguesFontaine:RF2:untilts/cartier-filtration-and-breuil-kisin-lines`).

Let J be the completed Cartier ideal in B_D^+. The residue map has B_D^+/J≃O_D. For m≥0, gr^m B_D^+=J^m/J^(m+1)≃(I_D/I_D²)^(⊗m), a line bundle on D. On B_D set Fil^m=J^m B_D^+ for m∈Z using the invertible fractional ideal. A chosen generator ξ identifies each graded piece with ξ^m O_D and the graded ring with O_D[T,T^−1]; replacing ξ by uξ scales the degree-m trivialization by (u mod I_D)^m. The intrinsic line need not be globally free.

Hypotheses: Regular invertible Cartier ideal and complete sheaf from the integral construction; no choice of generator is retained in the intrinsic statement.

Proof plan:

1. Use the cofinal quotient presentation to identify the completed ideal and residue map.
2. For a local regular generator multiply by ξ^m to identify O_D with J^m/J^(m+1).
3. Check the unit-change transition functions and glue to tensor powers of the conormal line.
4. Invert the local ideal for negative powers and check graded multiplication.

Prerequisites: `RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B`, `RelativeFarguesFontaine:RF2:untilts/closed-cartier-divisor-norm-estimate`, `RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration`.

Acceptance:

- Use ξ² versus ξ tests for finite thickenings; preserve potentially nontrivial conormal transition functions.

Sources:

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proposition VI.1.11 and preceding VI.1.10, printed pp. 194–195. The source identifies Breuil–Kisin twists intrinsically; the local scalar presentation depends on a generator.

### Geometric untilt DVR

**geometricDivisorCompleteDvr** (theorem; `RelativeFarguesFontaine:RF2:untilts/geometric-divisor-complete-dvr`).

For a geometric marked E-untilt C^sharp, the generic degree-one completion B_D^+ is a complete discrete valuation ring with maximal ideal the completed Cartier ideal and residue field C^sharp. A local primitive generator is a uniformizer, and B_D is its fraction field. This includes equal-characteristic E via its Cartier completion; the p-typical characteristic-zero case agrees with the R06.1 geometric theorem.

Hypotheses: One geometric degree-one leg. A degree-d divisor with several geometric supports has a product of such local rings, and a finite thickening is not itself a DVR.

Proof plan:

1. The completed quotient modulo the Cartier ideal is the field C^sharp.
2. A local regular generator and completeness show every residue-nonzero element is a unit by geometric-series lifting.
3. Successive Cartier quotients give associated graded C^sharp[T]; separated completeness makes each nonzero element a uniformizer power times a unit.
4. Conclude domain, discrete valuation and fraction-field localization; check against the supplier only in its geometric characteristic-zero hypotheses.

Prerequisites: `RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B`, `RelativeFarguesFontaine:RF2:untilts/cartier-filtration-and-breuil-kisin-lines`, `mathlib:IsDiscreteValuationRing`, `PadicHodgeTheory:R06.1/bdr-plus-complete-dvr`.

Acceptance:

- No DVR assertion for a non-field affinoid base or a disconnected multi-leg divisor.

Sources:

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.1 degree-one ring convention, printed p. 192. The local ring is the completion at a geometric degree-one Cartier point.
- [p-adic Hodge theory for rigid-analytic varieties](https://people.mpim-bonn.mpg.de/scholze/pAdicHodgeTheory.pdf), §6, geometric specialization of Lemma 6.3, printed p. 35. The primitive theta generator supplies the maximal ideal in the matching characteristic-zero case.

### Divisor completion and coefficient base change

**divisorCompletionBaseChange** (theorem; `RelativeFarguesFontaine:RF2:untilts/divisor-completion-base-change`).

Base maps of marked perfectoid pairs induce continuous maps on finite Cartier quotient rings and hence on B_D^+, B_D, residue and filtration. For rational restrictions and finite etale base maps satisfying the strict quotient comparison, these identify the completed base changes. Under finite coefficient-field change use the unramified Witt comparison and, in mixed characteristic, the selected embedding in the de Rham completion. For arbitrary v-covers the assertion is sheaf descent of the quotient systems and their limit; no uncompleted tensor product is claimed to commute with that limit.

Hypotheses: Specify the complete tensor topology, plus integral closure and finite-quotient compatibility for a base-change isomorphism. Arbitrary nonflat or nonsplit tensor operations are not included.

Proof plan:

1. Functoriality of primitive ideals gives maps on every quotient by I_D^n.
2. Use rational/finite-etale exactness on the actual complete quotient rings to prove the finite-level comparisons.
3. Pass to the compatible inverse limit with its completion topology and localize the ideal.
4. For general v-covers use the already proved ring/sheaf descent; the maps on graded lines are pullbacks of the conormal line.

Prerequisites: `RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B`, `RelativeFarguesFontaine:RF2:integral-divisors/v-descent-of-bundles-on-the-divisor`, `RelativeFarguesFontaine:RF1/relative-curve-functoriality`, `RelativeFarguesFontaine:RF0:integral-Y/perfect-coefficient-base-change`, `RelativeFarguesFontaine:RF2:untilts/coefficient-field-de-rham-comparison`, `AdicSpacesPartII:R0/completed-tensor-product`, `AdicSpacesPartII:R3/finite-projective-etale-descent`.

Acceptance:

- State and check the strict finite-quotient comparison instead of treating all completed tensor products as exact.

Sources:

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), VI.1 completion v-sheaves, printed p. 192. The source gives functorial descent, while tensor-limit exchange needs the separately stated hypotheses.

## Rank-one twists and sections (RF3)

### Integral rank-one Frobenius twists

**isocrystalLineBundlesAndSign** (construction; `RelativeFarguesFontaine:RF3/isocrystal-line-bundles-and-sign`).

For n∈Z, descend the trivial line on Y_S with semilinear Frobenius operator Φ_n=π^(−n)φ to define O_X(n). The tensor comparison O(m)⊗O(n)≃O(m+n) and dual comparison O(n)^∨≃O(−n) preserve the descent trivializations. Its sections are exactly f∈O(Y_S) with φ(f)=π^n f. The rank-one coefficient operator π^(−n)σ has isocrystal slope −n; the geometric twist has degree n. The arbitrary-rank exact tensor functor has the sole VB1 owner.

Hypotheses: Use the actual RF1 quotient and analytic invertible O-modules. No use of an arbitrary-rank isocrystal classification or a completed VB1 stage is required to define this rank-one descent.

Proof plan:

1. Use local translate-disjoint opens in Y_S to descend the trivial line and its integral-power cocycle.
2. Multiplying the coefficients π^(−m)π^(−n) gives tensor and dual identifications.
3. A descended section is Φ_n-invariant, equivalently φ(f)=π^n f.
4. Compare the coefficient rank-one normalization with VB0’s isocrystal convention; export agreement to VB1 without importing the full functor.

Prerequisites: `RelativeFarguesFontaine:RF1/frobenius-quotient-and-presentation`, `RelativeFarguesFontaine:RF1/diamond-formula-and-map-to-base`, `AdicSpacesPartII:R3/sheafy-tate-acyclicity-and-kiehl-gluing`.

API:

- **curveTwist** (data): The descended line O_X(n), n∈Z.
- **curveTwist_tensor** (equivalence): O(m)⊗O(n)≃O(m+n).
- **curveTwist_dual** (equivalence): O(n)^∨≃O(−n).
- **curveTwist_sections** (characterisation): H^0(X_S,O(n))≃{f∈O(Y_S):φ(f)=π^n f}.
- **curveTwist_transition** (compatibility): Between lifts differing by φ^k the frame cocycle is π^(−nk), satisfying the additive k-cocycle relation.

Unit tests:

- **twist_zero** (degenerate): O(0) is the structure line with descent φ.
- **twist_one_sign** (computation): O(1) has multiplier π^−1 and sections with φ(f)=πf.
- **twist_negative_sign** (non-example): O(−1) has multiplier π and sections with φ(f)=π^−1 f.
- **twist_inverse** (compatibility): O(n)⊗O(−n)≃O.

Uses:

- VB1 isocrystal-to-bundle functor: Provides the rank-one normalization to which the full functor must agree.
- RF3 section algebra: Supplies the tensor multiplication and explicit local frames.

Acceptance:

- Use n=1 and n=−1 to test the sign; the full functor payload of the legacy id is forwarded.

Sources:

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), II.2 opening after Proposition II.2.1, printed p. 58. The chosen coefficient multiplier fixes both the section eigenvalue and the slope sign.

### Lubin–Tate divisor section

**lubinTateDivisorSection** (theorem; `RelativeFarguesFontaine:RF3/lubin-tate-divisor-section`).

Let E_LT∞ be the completion of the Lubin–Tate torsion tower, and S^sharp an untilt over it. A compatible nonzero torsion parameter X̃ gives a convergent period function f=Σ_(i∈Z)π^i[X̃^(q^(−i))] satisfying φ(f)=πf. Its zero on X_S is exactly the untilt divisor, with multiplicity one. Hence 0→O_X→O_X(1)→O_(S^sharp)→0, with the last map interpreted through the chosen divisor trivialization. Tensoring gives the corresponding consecutive-twist exact sequences.

Hypotheses: The chosen LT tower is distinct from E_root∞. The all-E functional construction uses the LT logarithm; its mixed-characteristic period comparison has the precise SW13 input recorded as a gap.

Proof plan:

1. Use the LT Teichmuller lift and compatible torsion sequence to form the convergent bilateral sum. In mixed characteristic use the crystalline-boundary/Cech comparison first, together with the separately requested Lubin–Tate logarithm exact sequence; it does not depend on the resulting LT section.
2. Shift the summation index to prove the Frobenius eigenvalue.
3. Identify the function with the LT logarithm on the universal cover; the logarithm’s torsion zeros are simple.
4. Apply the generic Cartier ideal comparison to identify I_D(1) with O and deduce exactness.
5. Apply the constructed bilateral-sum eigenvalue identity. At each torsion point translate the specified logarithm to zero and use its nonzero derivative to identify its principal ideal with the local parameter; repeated factors then have length two.

Prerequisites: `RelativeFarguesFontaine:RF0:integral-Y/lubin-tate-teichmuller-lift`, `RelativeFarguesFontaine:RF3/isocrystal-line-bundles-and-sign`, `RelativeFarguesFontaine:RF2:untilts/primitive-untilt-correspondence`, `RelativeFarguesFontaine:RF2:untilts/closed-cartier-divisor-norm-estimate`, `RelativeFarguesFontaine:RF0:annuli/radius-function-and-rational-annuli`, `RelativeFarguesFontaine:RF3/crystalline-boundary-and-cech-section-input`, `mathlib:Module.length`.

Suggested form: The section is lubinTateBilateralSection=∑_(i∈Z)π^i roots_i in the actual period function ring. Its eigenvalue theorem requires continuous φ fixing π, the compatible shift φ(roots_i)=roots_(i−1), and convergence. The simple-zero signature is the translated LT logarithm with zero constant term and nonzero linear coefficient; its squared quotient has length two. The supplier must identify this logarithm with the bilateral section in the local analytic ring. No theorem assigns the eigenvalue to an arbitrary period function.

Acceptance:

- The product of two such sections at the same leg has a double zero; the one-section theorem is genuinely simple.

Sources:

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proposition II.2.3 and proof, printed pp. 60–61. The exact sequence is obtained over the Lubin–Tate tower by the logarithm zero calculation.

### Graded section algebra and projective scheme

**gradedAlgebraAndAlgebraicCurveMap** (construction; `RelativeFarguesFontaine:RF3/graded-algebra-and-algebraic-curve-map`).

For affinoid S let P_S=⊕_(n≥0)H^0(X_S,O(n)), with multiplication from the twist tensor comparison. Form X_S^alg=Proj(P_S) using Mathlib’s projective spectrum/scheme construction and its affine charts Spec(P_S[g^−1]_0), g homogeneous of positive degree. The analytic chart maps are constructed separately on U=⋃_gD(g). This node does not assert U=X_S or define an invertible degree-one Proj twist; both need the VB2:ampleness theorem.

Hypotheses: The nonnegative grading is by N; O(n) exists for integral n. Proj need not be covered by degree-one generators.

Proof plan:

1. Define the direct sum and multiplication using coherent tensor associativity of rank-one twists.
2. Use the existing graded-ring and ProjectiveSpectrum construction.
3. Identify standard degree-zero localization charts and their overlap maps.
4. Preserve the legacy id while moving the global-map and tautological-twist payload to the exact VB2 node.

Prerequisites: `RelativeFarguesFontaine:RF3/isocrystal-line-bundles-and-sign`, `mathlib:GradedAlgebra`, `mathlib:ProjectiveSpectrum`, `mathlib:AlgebraicGeometry.Scheme`, `mathlib:AlgebraicGeometry.projIsoSpec`.

API:

- **curveSectionAlgebra** (data): Nonnegatively graded direct sum of twist sections.
- **curveSectionAlgebra_mul** (characterisation): Degree m,n multiplication lands in degree m+n.
- **curveProj** (data): Mathlib Proj of P_S.
- **curveProj_chart** (compatibility): D_+(g)≃Spec(P_S[g^−1]_0) for positive-degree g.

Unit tests:

- **graded_zero_degree** (degenerate): P_0=H^0(X_S,O).
- **graded_product** (computation): An eigenvector of eigenvalue π^m times one of eigenvalue π^n has eigenvalue π^(m+n).
- **proj_not_degree_one_cover** (non-example): For a graded ring generated only in degree two, degree-one standard opens cannot be assumed to cover Proj.

Uses:

- VB2:ampleness: Supplies the Proj object and standard charts before global-generation/GAGA comparison.

Acceptance:

- The existing VB2:ampleness/global-proj-map-and-twists is the sole owner of the global map and invertible twists.

Sources:

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), II.2.3 opening and proof of Proposition II.2.7, printed pp. 64–67. The source’s chart construction is used; the preceding generation theorem is required to extend it to all X_S.

### Section-covered Proj comparison

**sectionCoveredProjChartMap** (theorem; `RelativeFarguesFontaine:RF3/section-covered-proj-chart-map`).

For g∈H^0(X_S,O(n)), n>0, its nonvanishing locus D(g) trivializes O(n). Fractions a/g^k with deg a=kn define a ring map P_S[g^−1]_0→O(D(g)) and a morphism of locally ringed spaces D(g)→D_+(g). On D(g)∩D(h)=D(gh) these maps agree. They glue to U=⋃_(g positive degree)D(g)→Proj(P_S). Global coverage U=X_S and tautological-twist pullback are not asserted at this stage.

Hypotheses: Actual nonvanishing of a section of an invertible sheaf; n need not be 1.

Proof plan:

1. Use g as a frame and send a/g^k to its ratio in the local trivialization.
2. Check multiplication, equal fractions and localization on smaller standard opens.
3. The local ring map at each point respects maximal ideals, giving the locally ringed morphism.
4. Use D(g)∩D(h)=D(gh) to glue the chart maps only over U.

Prerequisites: `RelativeFarguesFontaine:RF3/graded-algebra-and-algebraic-curve-map`, `RelativeFarguesFontaine:RF3/isocrystal-line-bundles-and-sign`, `mathlib:AlgebraicGeometry.LocallyRingedSpace`, `mathlib:IsLocalization`.

Acceptance:

- On P^1 with L=O(−1), positive-power global sections vanish and U=∅. Quasicompactness cannot supply a cover that does not exist.

Sources:

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proposition II.2.7 proof, printed p. 67. The proof constructs maps on nonvanishing opens; the generation input determines whether their union covers.

### Positive Frobenius eigenvectors on a window

**positiveFrobeniusEigenvectorRestriction** (theorem; `RelativeFarguesFontaine:RF3/positive-frobenius-eigenvector-restriction`).

For n≥0,d>0,q=p^d and r>0, restriction identifies {x∈R̃^+:φ^d x=p^n x}, {x∈R̃:φ^d x=p^n x}, and compatible eigenvectors on the fundamental window R̃^[r/q,r]. The window equality is interpreted by agreement after restriction to the overlap on which x and φ^d x are both defined. The all-E version has multiplier π^n and q-Frobenius. This is the concrete period-ring presentation of nonnegative-degree sections, without a finite-dimensionality assertion.

Hypotheses: The displayed KL result has n nonnegative. Negative twists and geometric vanishing need their own arguments and cannot be inferred by changing this sign.

Proof plan:

1. Iterate Frobenius and use interval intersections to extend a window eigenvector across all radii.
2. The eigenvalue gives the plus growth bound.
3. For a general R^+ use the residue projection in the final paragraph of KL5.2.12, rather than replacing R^+ by R°.
4. Compare the extended eigenvector with the invariant descent equation defining O(n).
5. In the growth estimate use an iteration index m distinct from the eigenweight n, as corrected in KLII Appendix A, printed p. 190.

Prerequisites: `RelativeFarguesFontaine:RF0:annuli/relative-extended-robba-rings`, `RelativeFarguesFontaine:RF0:annuli/robba-growth-units-and-invariants`, `RelativeFarguesFontaine:RF0:annuli/robba-controlled-splittings`, `RelativeFarguesFontaine:RF3/isocrystal-line-bundles-and-sign`.

Acceptance:

- The statement is a restriction bijection and has no cohomological finiteness conclusion.

Sources:

- [Relative p-adic Hodge theory: foundations](https://arxiv.org/abs/1301.0792), Corollary 5.2.12 and proof, printed p. 120. The restriction result applies to nonnegative eigenweights and general relative R^+.

### Crystalline boundary and twist section input

**crystallineBoundaryAndCechSectionInput** (theorem; `RelativeFarguesFontaine:RF3/crystalline-boundary-and-cech-section-input`).

In FSII.2.5 put Y_[1,∞]={|[ϖ]|≤|π|≠0}, including the end [ϖ]=0,π≠0, and Y_[0,a]={|π|^a≤|[ϖ]|≠0}, retaining the end π=0. Write B_[a,b] for the rings of functions with the specified rational completion. The two-chart Cech sequences are 0→W_OE(R^+)[1/π]→B_[1,∞]⊕B_[0,q][1/π]→B_[1,q]→0 and the same sequence with q replaced by1. The coefficient ring on the left has its π-adic Tate topology, distinct from the (π,[ϖ])-adic topology of the integral period space. For n>0 the contracting Frobenius series used in FSII.2.5 give the restriction quasi-isomorphism of the two φ−π^n complexes. This provides the section input for the rank-one twists; general bundle cohomology and global generation remain at VB1/VB2.

Hypotheses: Affinoid perfectoid base, actual boundary charts and their complete topologies. The notation [1,∞] does not mean a subset of generic Y. The displayed rational inequality for general a is interpreted by integer powers for rational a.

Proof plan:

1. Apply sheafiness of the π-adic Tate ring W_OE(R^+)[1/π] to its two rational charts.
2. Use the exact two-chart covering sequences with q and with1.
3. On the integral-end term invert φ−π^n using Σ_(j≥1)π^(n(j−1))φ^(−j); on the [ϖ]-divisible crystalline-end term use −Σ_(j≥0)π^(−n(j+1))φ^j.
4. Check convergence in the actual interval norms and deduce the restriction quasi-isomorphism.

Prerequisites: `RelativeFarguesFontaine:RF0:integral-Y/whole-analytic-ainf-locus`, `RelativeFarguesFontaine:RF0:integral-Y/whole-analytic-ainf-sheafiness`, `RelativeFarguesFontaine:RF0:annuli/relative-period-sheaf-and-acyclicity`.

Acceptance:

- This records the boundary chart calculation without importing VB2 global generation into RF3.

Sources:

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proof of PropositionII.2.5, printed p. 63. The source uses the boundary analytic chart in proving the positive-twist generation theorem.

## Imported declarations

- `mathlib:AdicCompletion` — `Mathlib/RingTheory/AdicCompletion/Basic.lean`. The inverse system completion of a module along powers of an ideal, with the ring structure for the ring itself. Cartier completion and analytic topology are compared explicitly.
- `mathlib:Algebra.FormallyEtale.comp_bijective` — `Mathlib/RingTheory/Etale/Basic.lean`. Bijectivity of AlgHom postcomposition to B/I for I²=0 and a formally etale source. Applied successively, not misread as a theorem for every ideal.
- `mathlib:Algebra.FormallyEtale.of_isSeparable` — `Mathlib/RingTheory/Etale/Field.lean`. A separable field algebra is formally etale. It supplies the separable finite coefficient-field input after inverting p.
- `mathlib:AlgebraicGeometry.LocallyRingedSpace` — `Mathlib/Geometry/RingedSpace/LocallyRingedSpace.lean`. Ringed spaces with local stalks, the target category of the map on the section-covered open.
- `mathlib:AlgebraicGeometry.Scheme` — `Mathlib/AlgebraicGeometry/Scheme.lean`. Locally affine locally ringed spaces, including the existing projective spectrum scheme.
- `mathlib:BDeRhamPlus` — `Mathlib/RingTheory/Perfectoid/BDeRham.lean`. AdicCompletion of ker theta on the p-localized Witt ring for PreTilt O p. It agrees with the geometric period completion only after identifying the input, theta and Cartier ideals; characteristic-p input gives the zero localization.
- `mathlib:GradedAlgebra` — `Mathlib/RingTheory/GradedAlgebra/Basic.lean`. An internal decomposition of an algebra by submodules whose products add degrees; direct sum multiplication produces the external section algebra.
- `mathlib:Ideal.span` — `Mathlib/RingTheory/Ideal/Span.lean`. The generated ideal of a subset, used for primitive equations, products and Cartier powers.
- `mathlib:Ideal.span_singleton_mul_left_unit` — `Mathlib/RingTheory/Ideal/Span.lean`. Equality span{uξ}=span{ξ} for IsUnit u. Reuse this algebraic fact; new work concerns the completed sheaf and its filtration.
- `mathlib:IsAdicComplete` — `Mathlib/RingTheory/AdicCompletion/Basic.lean`. Ideal-adic separatedness and completeness as a module condition; no comparison with any Huber completion is automatic.
- `mathlib:IsAdicComplete.liftRingHom` — `Mathlib/RingTheory/AdicCompletion/RingHom.lean`. Lifts a compatible family of ring maps into S/I^n to S when S is I-adically complete. Used for the unique compatible separable-coefficient lift.
- `mathlib:IsDiscreteValuationRing` — `Mathlib/RingTheory/DiscreteValuationRing/Basic.lean`. The local nonfield principal-ideal-domain class. The complete-DVR and residue-field theorems at a geometric leg are new.
- `mathlib:IsLocalization` — `Mathlib/RingTheory/Localization/Defs.lean`. The algebraic localization universal property. Its Huber, completion and generator-free sheaf comparisons are separate targets.
- `mathlib:PerfectRing` — `Mathlib/FieldTheory/Perfect.lean`. The bijective Frobenius condition in characteristic p. Perfect coefficient rings satisfy it; perfectoidness is an additional analytic notion.
- `mathlib:PreTilt` — `Mathlib/RingTheory/Perfection.lean`. The ring Perfection (O/(p)) p. This algebraic inverse limit is compared to a marked geometric tilt through P1, rather than called that tilt by definition.
- `mathlib:PreTilt.untilt` — `Mathlib/RingTheory/Perfectoid/Untilt.lean`. The multiplicative sharp map under prime, nonunit and p-adic completeness hypotheses; it is not additive and does not classify marked untilts.
- `mathlib:ProjectiveSpectrum` — `Mathlib/AlgebraicGeometry/ProjectiveSpectrum/Topology.lean`. The homogeneous prime spectrum excluding the irrelevant ideal, and its topology. The projective scheme construction is imported; coverage by analytic sections is not a baseline result.
- `mathlib:Valuation` — `Mathlib/RingTheory/Valuation/Basic.lean`. Multiplicative maps into a linearly ordered group with zero satisfying the ultrametric inequality; new analytic valuations need their continuity and plus bounds.
- `mathlib:WittVector` — `Mathlib/RingTheory/WittVector/Defs.lean`. The p-typical carrier with coefficients indexed by N. Its ramified analogue and strict-lift comparison are new.
- `mathlib:WittVector.fontaineTheta` — `Mathlib/RingTheory/Perfectoid/FontaineTheta.lean`. The p-typical map W(PreTilt O p)→O for p-adically complete O, with prime and nonunit hypotheses. A marked geometric tilt and all-E theta need explicit comparisons.
- `mathlib:WittVector.frobenius` — `Mathlib/RingTheory/WittVector/Frobenius.lean`. The p-typical ring endomorphism under Fact p.Prime. It is not by itself the q-Frobenius on ramified coefficients.
- `mathlib:WittVector.ghostComponent` — `Mathlib/RingTheory/WittVector/Basic.lean`. The nth p-typical ghost component as a ring homomorphism, used only after the exact Q_p parameter specialization.
- `mathlib:WittVector.teichmuller` — `Mathlib/RingTheory/WittVector/Teichmuller.lean`. The p-typical multiplicative monoid homomorphism. It gives the unramified comparison, without asserting an additive coefficient map.
- `tauceti:TauCeti.Huber.Pair` — `TauCeti/RingTheory/Huber/Pair.lean`. A Huber ring equipped with an integral-element subring; it supplies the ring-pair interface, not sheafiness or an analytic adic space.
- `tauceti:TauCeti.ValuationSpectrum.spa` — `TauCeti/AlgebraicGeometry/AdicSpace/Spa/Basic.lean`. The subset of continuous valuation-spectrum points bounded by1 on the plus subring. It is a carrier and does not supply the structure sheaf or quotient geometry.
- `mathlib:AlgebraicGeometry.projIsoSpec` — `Mathlib/AlgebraicGeometry/ProjectiveSpectrum/Scheme.lean`. The locally ringed space of the standard positive-degree Proj open is isomorphic to Spec of HomogeneousLocalization.Away. This is an algebraic chart theorem; no analytic chart ring is asserted isomorphic to it.
- `mathlib:FormalGroup` — `Mathlib/RingTheory/FormalGroup/Basic.lean`. One-dimensional formal group laws with their power-series coefficients and IsComm; the LT O_E-module action is additional supplier work.
- `mathlib:MvPowerSeries.eval₂` — `Mathlib/RingTheory/MvPowerSeries/Evaluation.lean`. Power-series evaluation by extension from the dense polynomial subring. Its ring-homomorphism form eval₂Hom requires continuous coefficients, HasEval, completeness and a compatible linear topology; analytic LT evaluation here uses explicitly summable coefficient series.
- `mathlib:Module.length` — `Mathlib/RingTheory/Length.lean`. Module length in extended natural numbers. DVR product-parameter quotients and logarithm double-zero examples use this existing invariant.
- `mathlib:CategoryTheory.presheafToSheaf` — `Mathlib/CategoryTheory/Sites/Sheafification.lean`. The constructed sheafification functor under HasWeakSheafify, with its unit toSheafify; quotient orbit presheaves use it, rather than a stack.
- `mathlib:PadicInt` — `Mathlib/NumberTheory/Padics/PadicIntegers.lean`. The p-adic integers, with their existing complete-DVR instances and maximal ideal generated by p; the strict-lift Q_p comparison uses this coefficient ring.

## Required interfaces and ownership

### AdicSpacesPartII:R0

Topological rational chart completion, separatedness, the spectral-norm isometry criterion and a countable Banach correction argument for dense inverse-limit restrictions. Extend the coefficient completed-tensor interface to π-adic O_E→W_OE(R^+) with (π,[ϖ])-adic target topology: this map need not be adic, so the existing adic-map completed-tensor node alone is insufficient. Specify the completed integral coefficient tensor, continuity of a module splitting and commuting finite quotient maps.

Direction: incoming. Consumers: `RelativeFarguesFontaine:RF0:integral-Y/integral-rational-chart-rings`, `RelativeFarguesFontaine:RF0:integral-Y/root-extension-chart-model`, `RelativeFarguesFontaine:RF0:integral-Y/whole-analytic-ainf-locus`, `RelativeFarguesFontaine:RF0:annuli/radius-function-and-rational-annuli`, `RelativeFarguesFontaine:RF0:annuli/period-spectrum-surjectivity`, `RelativeFarguesFontaine:RF0:annuli/annular-coefficient-choice-and-anchor-comparisons`.

### PerfectoidSpaces:P1

The integral perfectoid criterion of BMS Lemma3.10(ii) and Lemma3.21, with a regular u satisfying u^p|p, u-adic completeness and Frobenius S/u→S/u^p bijective. The root chart has u=[ϖ]^(1/p); its quotient presentation must verify every hypothesis. The existing distinguished-element-criterion proves Witt regularity and does not supply this integral criterion.

Direction: incoming. Consumers: `RelativeFarguesFontaine:RF0:integral-Y/chart-cover-perfectoidness-and-sheafiness`.

### PerfectoidSpaces:P2

The tilted perfected open-disc charts and continuity of the homeomorphism of adic spectra, allowing the retained π=0 end. General spatial site machinery is imported rather than replanned.

Direction: incoming. Consumers: `RelativeFarguesFontaine:RF0:integral-Y/tilting-map-of-period-disc`.

### PerfectoidSpaces:P3

Almost vanishing of H^1_v of the integral functions on affinoid perfectoid charts, with the required annihilator and norm control; tilting equivalence for finite etale categories compatible with the normalized primitive quotients. Effective ordinary module descent is a separate D3 input. The primitive perfectoid quotient input in KL5.3.14 must use the corrected KLII Theorem3.3.13, in place of the incomplete KL3.6.11 proof.

Direction: incoming. Consumers: `RelativeFarguesFontaine:RF0:integral-Y/chart-cover-perfectoidness-and-sheafiness`, `RelativeFarguesFontaine:RF2:integral-divisors/v-descent-of-bundles-on-the-divisor`, `RelativeFarguesFontaine:RF0:annuli/period-rings-finite-etale-compatibility`, `RelativeFarguesFontaine:RF0:annuli/interval-rings-relatively-perfectoid`, `RelativeFarguesFontaine:RF0:annuli/period-spectrum-surjectivity`.

### DiamondsAndVStacks:D6

Extend the D6 owner with the D6:pre-adic interface of SW §§18.1–18.2: the diamond of a pre-adic object and pre-adic Spd(O_E), used by FSII.1.2 for maps from marked perfectoid untilts, including π=0 and bounded coefficient maps. Current D6 generic Spd does not provide this extension (confirmed RT-AREA-padic-1/3). This is an extension request, not a citation to an existing D6:pre-adic node.

Direction: incoming. Consumers: `RelativeFarguesFontaine:RF0:integral-Y/untilt-functor-of-points`.

### DiamondsAndVStacks:D3

Extend D3, whose current supplier statement covers perfectoid spaces and their morphisms, with ordinary effective v-descent of finite locally free modules, including GL_1, using SW17.1.8 and SW19.5.3 and their split-module hypotheses. Neither almost modules nor almost H^1 vanishing has this conclusion.

Direction: incoming. Consumers: `RelativeFarguesFontaine:RF2:integral-divisors/ordinary-v-descent-of-period-line-bundles`, `RelativeFarguesFontaine:RF2:integral-divisors/relative-degree-criterion`, `RelativeFarguesFontaine:RF2:integral-divisors/v-descent-of-bundles-on-the-divisor`.

### AdicSpacesPartII:R3

The rational-basis presheaf, covering and sheaf-gluing interface for the twelve relative period-ring variants. All the analytic estimates and the exact variant lists remain RF0 targets, while generic sheaf and finite-projective descent criteria are imports.

Direction: incoming. Consumers: `RelativeFarguesFontaine:RF0:annuli/relative-period-presheaves`.

### tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius

The maximal unramified coefficient extension and its completion, residue-field Frobenius and functoriality from Layer 2. Inertia and its finite-quotient exact sequence are requested separately from Layer 4.

Direction: incoming. Consumers: `RelativeFarguesFontaine:RF0:integral-Y/inertia-at-a-period-gauss-point`.

### tauceti:TauCetiRoadmap/AdicSpaces#layer-5-adic-spaces-and-elementary-geometry

Adic gluing along translate-disjoint analytic opens and the sheaf quotient by a free totally discontinuous Z-action; the new q-radius proof and relative quotient are RF1’s work.

Direction: incoming. Consumers: `RelativeFarguesFontaine:RF1/frobenius-quotient-and-presentation`.

### tauceti:TauCetiRoadmap/AdicSpaces#layer-6-the-adic-farguesfontaine-curve

The fixed-field Q_p absolute interval Huber pairs, their complete rings/plus rings, restrictions, Frobenius and quotient. RF0 proves isomorphisms of the relative specialization with these existing objects.

Direction: incoming. Consumers: `RelativeFarguesFontaine:RF0:annuli/annular-coefficient-choice-and-anchor-comparisons`.

### VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor

The arbitrary-rank exact tensor isocrystal-to-bundle functor, agreeing with the early rank-one multiplier π^(−n) and slope −n. Include KL6.1.4: sections generating a φ-bundle on every compact interval generate its module of global sections over R̃^∞ after Kiehl descent.

Direction: outward. Consumers: `RelativeFarguesFontaine:RF3/isocrystal-line-bundles-and-sign`.

### VectorBundlesAndIsocrystals:VB2:ampleness/global-proj-map-and-twists

The global-generation/cohomology theorem FSII.2.6 and the resulting U=X_S, globally defined analytic-to-Proj morphism and invertible tautological twists. Include KL8.9.3’s algebraic Cartier section and affine complement, then the algebraic/analytic identifications of B_e and B_dR after this global comparison. RF3 provides P, Proj and only the maps on U.

Direction: outward. Consumers: `RelativeFarguesFontaine:RF3/graded-algebra-and-algebraic-curve-map`, `RelativeFarguesFontaine:RF3/section-covered-proj-chart-map`.

### VectorBundlesAndIsocrystals:VB3:general-BC

The precise Div^1 moduli theorem FSII.1.21 and Far Proposition2.18 in the checked preprint: spatial representability, properness, cohomological smoothness and the resulting openness/closedness of |X_S|→|S|. It must use the curve product formula already supplied by RF1, C4 proper base change and the S5 smoothness input. Create a node in this known stage; do not feed it back into early RF1.

Direction: outward. Consumers: `RelativeFarguesFontaine:RF2:untilts/div1-moduli-and-properness`, `RelativeFarguesFontaine:RF1/diamond-formula-and-map-to-base`.

### VectorBundlesAndIsocrystals:VB2:classification/classical-points-and-principal-ideal-domains

Extend the exact reviewed node to the classical points of the integral period disc, local-PID/maximal-ideal description FSII.1.11–II.1.12 and II.1.22, and SW13.1.3’s strong noetherianity on the field-case Y_[0,∞) excluding x_L. RF0 supplies the early marked-point and tilted Gauss-disc inputs. No strong noetherianity for general relative bases or for the whole analytic locus is claimed.

Direction: outward. Consumers: `RelativeFarguesFontaine:RF0:integral-Y/classical-points-of-integral-period-disc`, `RelativeFarguesFontaine:RF0:integral-Y/whole-analytic-ainf-sheafiness`.

### RelativeFarguesFontaine:RF4:vector-bundles

Receive the whole-analytic A_inf algebraicity theorem used by Guo–Reinecke and supply φ-module freeness/projectivity over products of valuation rings with its precise Ivanov hypotheses. Own KL8.9.6(b,c) bundle patching and supply the bundle theorem needed after the global Proj comparison. Do not duplicate the early ambient Cartier completions.

Direction: outward. Consumers: `RelativeFarguesFontaine:RF0:integral-Y/punctured-ainf-bundle-algebraicity`.

### VectorBundlesAndIsocrystals:VB1

Own the cohomology of arbitrary bundles and the exact derived Cech computation of KL8.9.6(a) for flat quasicoherent sheaves using B_e,B_dR^+,B_dR after the VB2 global comparison. Its algebraic hypotheses and flatness must remain explicit.

Direction: outward. Consumers: `RelativeFarguesFontaine:RF3/crystalline-boundary-and-cech-section-input`.

### tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions

Propose LocalFieldsRamification, Part II for FF Remark1.3.5’s nonperfect-residue Cohen rings: existence of flat π-complete lifts and isomorphism of lifts using H^−2 and H^−1 of the full cotangent complex, without canonical uniqueness. Upstream’s current layers do not contain this extension.

Direction: outward. Consumers: `RelativeFarguesFontaine:RF0/ramified-witt-universal-property`.

### DerivedDeRhamCohomology:DD.0

Supply the full cotangent-complex obstruction theory and L_(K/F_q)≃Ω^1_(K/F_q)[0] for field K, required by the proposed nonperfect Cohen-ring extension in FF Remark1.3.5. Mathlib’s naive cotangent complex alone cannot replace it.

Direction: outward. Consumers: `RelativeFarguesFontaine:RF0/ramified-witt-universal-property`.

### tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-4-the-tame-quotient-of-the-absolute-galois-group

Use Layer 4 inertia as a closed normal subgroup of the absolute Galois group, the exact sequence to the residue-field Galois group and its finite quotients. RF0 proves the new surjectivity calculation at the Gauss fibre; the local-field definitions and exact sequence are imported.

Direction: incoming. Consumers: `RelativeFarguesFontaine:RF0:integral-Y/inertia-at-a-period-gauss-point`.

## Proof inputs requiring refinement

The following inputs remain explicit. They limit closure of the plan, while each has a stated owner or consumer contract.

### Integral coefficient tensor interface

The all-E source computation is read, but its O_E coefficient map into the (π,[ϖ])-adic ring need not satisfy R0’s adic-map hypothesis. The precise R0 request must be implemented or extended before the completed tensor and topological module splitting can be invoked.

Needed by: `RelativeFarguesFontaine:RF0:integral-Y/root-extension-chart-model`, `RelativeFarguesFontaine:RF0:integral-Y/chart-cover-perfectoidness-and-sheafiness`.

### Integral perfectoid criterion supplied at P1

The root relation verifies u^p=[ϖ] divides p in mixed characteristic and the displayed quotient Frobenius is bijective; complete the regularity and completion-topology comparison against the requested integral criterion. Existing P1 distinguished regularity is not that criterion.

Needed by: `RelativeFarguesFontaine:RF0:integral-Y/chart-cover-perfectoidness-and-sheafiness`.

### All-E relative period norm extension

KL’s relative estimates are p-typical. Carry each uniform estimate through the finite unramified-base coefficient tensor in mixed characteristic and through R^+[[π]] in equal characteristic, tracking |π| and q. A syntactic replacement p↦π is not a proof. The explicit targets, rings and source proof steps are present.

Needed by: `RelativeFarguesFontaine:RF0:annuli/relative-extended-robba-rings`, `RelativeFarguesFontaine:RF0:annuli/interval-rings-relatively-perfectoid`, `RelativeFarguesFontaine:RF0:annuli/annular-coefficient-choice-and-anchor-comparisons`.

### Early all-E degree criterion without bundle circularity

Fargues Proposition2.18 proves the generic degree criterion using Pic and Banach–Colmez theorems, which RS-20 places at a subsequent owner. The early integral criterion requires an independent local Weierstrass/factorization argument with fibre lengths and v-local ordered legs, including π=0; establish it without importing VB2/VB3. The forward map, product regularity and line descent are independent targets already written.

Needed by: `RelativeFarguesFontaine:RF2:integral-divisors/relative-degree-criterion`.

### Ordinary bundle correction on divisor thickenings

FSVI.1.4 uses almost vanishing and a convergent matrix correction to obtain ordinary effective descent. The norm-controlled correction across all finite I^n quotient rings remains to be formalized; neither an almost vector bundle nor an almost H^1 conclusion is adequate.

Needed by: `RelativeFarguesFontaine:RF2:integral-divisors/v-descent-of-bundles-on-the-divisor`.

### Lubin–Tate formal groups and logarithm input

Mathlib already supplies FormalGroup and convergent multivariate power-series evaluation. The missing input is a Lubin–Tate formal O_E-module with its scalar endomorphisms and LT condition, its marked torsion tower and tilt, and logarithm comparison with simple torsion zeros over every E. Upstream ClassFieldTheory excludes Lubin–Tate theory. This is a precise LocalFieldsRamification Part II request; no nonexistent LocalFields:LF2 node is cited.

Needed by: `RelativeFarguesFontaine:RF0:integral-Y/lubin-tate-teichmuller-lift`, `RelativeFarguesFontaine:RF3/lubin-tate-divisor-section`, `RelativeFarguesFontaine:RF1/lubin-tate-diamond-presentation`.

### Completion base-change exactness

The statement separates functorial maps and v-sheaf descent from a completed tensor isomorphism. Verify strict finite-quotient comparisons for the stated rational and finite-etale cases, then the inverse-limit comparison; arbitrary tensor-limit exchange is not asserted.

Needed by: `RelativeFarguesFontaine:RF2:untilts/divisor-completion-base-change`.

### Geometric completion comparison interfaces

The algebraic pinned constructions exist and R06.1 supplies matching p-typical affinoid periods. Establish the marked tilt/PreTilt identification, localized theta-kernel and analytic Cartier quotient before applying it; select the E embedding/factor after finite separable coefficient extension. R06.1 is not a theorem for every ramified/equal-characteristic coefficient presentation.

Needed by: `RelativeFarguesFontaine:RF2:untilts/p-typical-affinoid-completion-comparison`, `RelativeFarguesFontaine:RF2:untilts/coefficient-field-de-rham-comparison`.

### Global Proj and Div1 properties have outward owners

The outward nodes/stage are requested, not early prerequisites: VB2 extends U→Proj globally and supplies twists; VB3 supplies Div1 properness/smoothness and hence openness/closedness of the projection. This is an ownership boundary rather than an unproved global claim in the early packet.

Needed by: `RelativeFarguesFontaine:RF3/section-covered-proj-chart-map`, `RelativeFarguesFontaine:RF2:untilts/div1-moduli-and-properness`, `RelativeFarguesFontaine:RF1/diamond-formula-and-map-to-base`.

## Source routing

The extracted source items below are routed to their mathematical targets. An outward route imports its existing owner; it does not introduce a second construction.

- `PAPER-ZHU-17/G01` → `RelativeFarguesFontaine:RF0/ramified-witt-universal-property`, `RelativeFarguesFontaine:RF0:integral-Y/ramified-teich-frobenius-verschiebung`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-ZHU-17/witt-vectors-of-perfect-rings` → `RelativeFarguesFontaine:RF0/ramified-witt-universal-property`, `RelativeFarguesFontaine:RF0:integral-Y/ramified-teich-frobenius-verschiebung`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-ZHU-17/teichmuller-lift` → `RelativeFarguesFontaine:RF0/ramified-witt-universal-property`, `RelativeFarguesFontaine:RF0:integral-Y/ramified-teich-frobenius-verschiebung`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-ZHU-17/local-disc-notation` → `RelativeFarguesFontaine:RF0/ramified-witt-universal-property`, `RelativeFarguesFontaine:RF0:integral-Y/ramified-teich-frobenius-verschiebung`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-GUO-REINECKE-24/129` → `RelativeFarguesFontaine:RF0:integral-Y/whole-analytic-ainf-locus`, `RelativeFarguesFontaine:RF0:integral-Y/whole-analytic-ainf-sheafiness`, `RelativeFarguesFontaine:RF4:vector-bundles/kedlaya-algebraicity-of-punctured-bundles`, `RelativeFarguesFontaine:RF4:vector-bundles`. RF0 owns the whole analytic locus and its sheafiness. RF4 owns the punctured A_inf algebraicity theorem; RF0’s stable comparison node imports that exact theorem. The separate product φ-module freeness/projectivity payload retains its outward RF4 routing request and requires an ownership decision.
- `PAPER-BHATT-SCHOLZE-17/G901` → `RelativeFarguesFontaine:RF0/ramified-witt-universal-property`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-FARGUES-SCHOLZE-21/c2a-thm-II.0.1-classical-points-untilts` → `VectorBundlesAndIsocrystals:VB2:classification/classical-points-and-principal-ideal-domains`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-FARGUES-SCHOLZE-21/c2a-ex-II.1.6-equal-char-disc` → `RelativeFarguesFontaine:RF0:integral-Y/classical-points-of-integral-period-disc`, `RelativeFarguesFontaine:RF0:integral-Y/classical-base-change-and-nonclassical-fibres`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-FARGUES-SCHOLZE-21/c2a-defprop-II.1.7-classical-points` → `RelativeFarguesFontaine:RF0:integral-Y/classical-points-of-integral-period-disc`, `RelativeFarguesFontaine:RF0:integral-Y/classical-base-change-and-nonclassical-fibres`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-FARGUES-SCHOLZE-21/c2a-constr-tilting-map-DC-to-YC` → `RelativeFarguesFontaine:RF0:integral-Y/tilting-map-of-period-disc`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-FARGUES-SCHOLZE-21/c2a-prop-II.1.8-classical-preimage` → `RelativeFarguesFontaine:RF0:integral-Y/classical-points-of-integral-period-disc`, `RelativeFarguesFontaine:RF0:integral-Y/classical-base-change-and-nonclassical-fibres`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-FARGUES-SCHOLZE-21/c2a-prop-II.1.9-classical-base-change` → `RelativeFarguesFontaine:RF0:integral-Y/classical-points-of-integral-period-disc`, `RelativeFarguesFontaine:RF0:integral-Y/classical-base-change-and-nonclassical-fibres`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-FARGUES-SCHOLZE-21/c2a-lem-II.1.10-gauss-point-disc` → `RelativeFarguesFontaine:RF0:integral-Y/gauss-disc-fibre`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-FARGUES-SCHOLZE-21/c2a-lem-II.1.14-inertia-point` → `RelativeFarguesFontaine:RF0:integral-Y/inertia-at-a-period-gauss-point`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-FARGUES-SCHOLZE-21/c2a-fact-XS-to-S-open-closed` → `VectorBundlesAndIsocrystals:VB3:general-BC`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-SCHOLZE-WEINSTEIN-20/89` → `RelativeFarguesFontaine:RF0:integral-Y/whole-analytic-ainf-sheafiness`, `VectorBundlesAndIsocrystals:VB2:classification/classical-points-and-principal-ideal-domains`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-FARGUES-FONTAINE-18/94` → `RelativeFarguesFontaine:RF1/lubin-tate-diamond-presentation`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-FARGUES-FONTAINE-18/104` → `RelativeFarguesFontaine:RF0:integral-Y/ramified-witt-polynomials`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-FARGUES-FONTAINE-18/105` → `RelativeFarguesFontaine:RF0:integral-Y/ramified-witt-arbitrary-algebras`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-FARGUES-FONTAINE-18/106` → `RelativeFarguesFontaine:RF0:integral-Y/ramified-dwork-criterion`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-FARGUES-FONTAINE-18/107` → `RelativeFarguesFontaine:RF0:integral-Y/ramified-witt-uniformizer-change`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-FARGUES-FONTAINE-18/108` → `RelativeFarguesFontaine:RF0:integral-Y/ramified-witt-uniformizer-change`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-FARGUES-FONTAINE-18/109` → `RelativeFarguesFontaine:RF0:integral-Y/ramified-teich-frobenius-verschiebung`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-FARGUES-FONTAINE-18/110` → `RelativeFarguesFontaine:RF0:integral-Y/ramified-teich-frobenius-verschiebung`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-FARGUES-FONTAINE-18/111` → `RelativeFarguesFontaine:RF0:integral-Y/ramified-v-adic-expansion`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-FARGUES-FONTAINE-18/112` → `RelativeFarguesFontaine:RF0:integral-Y/ramified-teich-frobenius-verschiebung`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-FARGUES-FONTAINE-18/114` → `RelativeFarguesFontaine:RF0:integral-Y/ramified-coefficient-comparison`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-FARGUES-FONTAINE-18/115` → `RelativeFarguesFontaine:RF0:integral-Y/ramified-witt-diagonal`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-FARGUES-FONTAINE-18/116` → `RelativeFarguesFontaine:RF0:integral-Y/perfect-coefficient-base-change`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-FARGUES-FONTAINE-18/118` → `RelativeFarguesFontaine:RF0:integral-Y/q-twisted-witt-functor`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-FARGUES-FONTAINE-18/119` → `RelativeFarguesFontaine:RF0:integral-Y/q-twisted-witt-functor`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-FARGUES-FONTAINE-18/120` → `RelativeFarguesFontaine:RF0:integral-Y/q-twisted-witt-functor`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-FARGUES-FONTAINE-18/121` → `RelativeFarguesFontaine:RF0:integral-Y/q-twisted-witt-functor`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-FARGUES-FONTAINE-18/122` → `RelativeFarguesFontaine:RF0:integral-Y/q-teichmuller-lift`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-FARGUES-FONTAINE-18/123` → `RelativeFarguesFontaine:RF0:integral-Y/q-teichmuller-lift`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-FARGUES-FONTAINE-18/124` → `RelativeFarguesFontaine:RF0:integral-Y/q-teichmuller-lift`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-FARGUES-FONTAINE-18/125` → `RelativeFarguesFontaine:RF0:integral-Y/lubin-tate-teichmuller-lift`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-FARGUES-FONTAINE-18/126` → `RelativeFarguesFontaine:RF0:integral-Y/lubin-tate-teichmuller-lift`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-FARGUES-FONTAINE-18/127` → `RelativeFarguesFontaine:RF0:integral-Y/lubin-tate-teichmuller-lift`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-FARGUES-FONTAINE-18/128` → `RelativeFarguesFontaine:RF0:integral-Y/lubin-tate-teichmuller-lift`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-FARGUES-FONTAINE-18/134` → `tauceti:TauCetiRoadmap/LocalFieldsRamification`, `DerivedDeRhamCohomology:DD.0`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-KEDLAYA-LIU-15/130` → `RelativeFarguesFontaine:RF0:annuli/witt-seminorm-lambda-mu`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-KEDLAYA-LIU-15/122` → `RelativeFarguesFontaine:RF0/ramified-witt-universal-property`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-KEDLAYA-LIU-15/188` → `RelativeFarguesFontaine:RF0:annuli/relative-extended-robba-rings`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-KEDLAYA-LIU-15/189` → `RelativeFarguesFontaine:RF0:annuli/witt-seminorm-lambda-mu`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-KEDLAYA-LIU-15/190` → `RelativeFarguesFontaine:RF0:annuli/relative-extended-robba-rings`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-KEDLAYA-LIU-15/191` → `RelativeFarguesFontaine:RF0:annuli/local-generation-on-period-annuli`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-KEDLAYA-LIU-15/192` → `RelativeFarguesFontaine:RF0:annuli/robba-growth-units-and-invariants`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-KEDLAYA-LIU-15/193` → `RelativeFarguesFontaine:RF0:annuli/robba-controlled-splittings`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-KEDLAYA-LIU-15/194` → `RelativeFarguesFontaine:RF0:annuli/robba-growth-units-and-invariants`, `RelativeFarguesFontaine:RF3/positive-frobenius-eigenvector-restriction`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-KEDLAYA-LIU-15/195` → `RelativeFarguesFontaine:RF0:annuli/relative-period-presheaves`, `RelativeFarguesFontaine:RF0:annuli/relative-period-sheaf-and-acyclicity`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-KEDLAYA-LIU-15/196` → `RelativeFarguesFontaine:RF0:annuli/interval-adic-pair-and-base-projection`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-KEDLAYA-LIU-15/197` → `RelativeFarguesFontaine:RF0:annuli/relative-period-sheaf-and-acyclicity`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-KEDLAYA-LIU-15/198` → `RelativeFarguesFontaine:RF0:annuli/interval-rings-relatively-perfectoid`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-KEDLAYA-LIU-15/200` → `RelativeFarguesFontaine:RF0:annuli/annular-rational-base-change`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-KEDLAYA-LIU-15/201` → `RelativeFarguesFontaine:RF0:annuli/witt-seminorm-lambda-mu`, `RelativeFarguesFontaine:RF0:annuli/period-spectrum-surjectivity`, `RelativeFarguesFontaine:RF0:annuli/berkovich-period-deformation`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-KEDLAYA-LIU-15/202` → `RelativeFarguesFontaine:RF0:annuli/berkovich-period-deformation`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-KEDLAYA-LIU-15/204` → `RelativeFarguesFontaine:RF0:annuli/period-rings-finite-etale-compatibility`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-KEDLAYA-LIU-15/205` → `RelativeFarguesFontaine:RF0:annuli/period-rings-finite-etale-compatibility`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-KEDLAYA-LIU-15/209` → `VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-KEDLAYA-LIU-15/199` → `RelativeFarguesFontaine:RF0:annuli/interval-adic-pair-and-base-projection`, `RelativeFarguesFontaine:RF0:annuli/annular-rational-base-change`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-KEDLAYA-LIU-15/270` → `RelativeFarguesFontaine:RF1/global-period-sheaves-and-etale-functoriality`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-KEDLAYA-LIU-15/317` → `RelativeFarguesFontaine:RF1/global-period-sheaves-and-etale-functoriality`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-KEDLAYA-LIU-15/318` → `RelativeFarguesFontaine:RF1/global-period-sheaves-and-etale-functoriality`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-KEDLAYA-LIU-15/336` → `source issue RelativeFarguesFontaine/E4`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-KEDLAYA-LIU-15/337` → `VectorBundlesAndIsocrystals:VB2:ampleness/global-proj-map-and-twists`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-KEDLAYA-LIU-15/338` → `VectorBundlesAndIsocrystals:VB2:ampleness/global-proj-map-and-twists`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-KEDLAYA-LIU-15/339` → `VectorBundlesAndIsocrystals:VB2:ampleness/global-proj-map-and-twists`, `RelativeFarguesFontaine:RF2:integral-divisors/completed-rings-B-plus-and-B`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.
- `PAPER-KEDLAYA-LIU-15/340` → `VectorBundlesAndIsocrystals:VB1`, `RelativeFarguesFontaine:RF4:vector-bundles`. Exact maintainer-routed item; own nodes give the target and proof outline, external payloads are precise outward requests or the recorded source issue.

## Source editions and corrections

The source records distinguish author/preprint editions from publisher samples. Corrections are scoped to the edition in which they occur; the radius-one Gauss-disc claim is rejected because the disc-membership hypothesis already excludes it. All statements and proof plans are in our own words.

- **FS-geometrization**: [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf); MPIM author copy, PDF created 27 November 2024, 356 pages; locators refer to this copy, not Astérisque 466 (2026). Read: II.1.1–II.1.22; II.2.1–II.2.4; proof of II.2.5 printed p. 63; II.2.6–II.2.9; VI.1.1–VI.1.4 and VI.1.10–VI.2 opening; Revision reading: II.1.1 and II.1.6–II.1.10, printed pp. 48 and 51–52; II.1.19–II.1.21, pp. 55–56; II.2 opening and II.2.1–II.2.3, pp. 57–61; VI.1.1–VI.1.4, pp. 190–192..
- **SW20-berkeley**: [Berkeley Lectures on p-adic Geometry](https://www.math.uni-bonn.de/people/scholze/Berkeley.pdf); Annals of Mathematics Studies 207; PDF dated 'March 27, 2020' on every page header. Read: §6.2–6.3; Proposition 13.1.1, Remark 13.1.2 and Theorem 13.1.3; Proposition 14.2.6; Lemma 17.1.8 and Corollary 17.1.9; §§18.1–18.2; Proposition 19.5.3; Revision reading: Proposition 13.1.1, Remark 13.1.2 and Theorem 13.1.3, pp. 108–109; Lemma 17.1.8 and Corollary 17.1.9, pp. 150–151; Proposition 19.5.3 and proof, pp. 180–181..
- **BMS18-integral**: [Integral p-adic Hodge theory](https://arxiv.org/abs/1602.03148); Publications IHES 128 (2018) 219-397; library PDF, section 3 inspected 2026-09-15. Read: Section 3.2: Lemma 3.10 (i)–(ii), printed pp. 22–23; Lemma 3.21, printed p. 27.; BP-RelativeFarguesFontaine--RF0, 24 September 2026: the file was downloaded again in this session from the URL recorded here and its SHA-256 reproduces the recorded value byte for byte.; Revision reading: Lemma 3.21 and proof, printed p. 27; the downloaded public PDF reproduces the recorded hash..
- **Stacks-finite-etale**: [Henselian pairs and finite etale algebras](https://stacks.math.columbia.edu/tag/09ZL); Tags 09XI and09ZL, accessed7 October2026. Read: Lemma15.11.6 (09XI), including proof; Lemma15.13.2 (09ZL), including proof.
- **KLII-errata**: [Relative p-adic Hodge theory II: imperfect period rings](https://arxiv.org/abs/1602.06899); arXiv:1602.06899v3 (2019); Appendix A and Theorem 3.3.13 with Remark 3.3.14. Read: Appendix A, Errata for Foundations, printed pp.189–191; Theorem 3.3.13 and Remark 3.3.14, printed pp. 61–62; read statement and corrected injectivity proof.; Revision reading: corrected Theorem 3.3.13 and Remark 3.3.14, pp. 61–62; Appendix A, pp. 189–191..
- **FF18-courbes**: [Courbes et fibres vectoriels en theorie de Hodge p-adique](https://www.imo.universite-paris-saclay.fr/~fontaine/courbe.pdf); Author copy, 16 April 2017, 399 pages; Astérisque 406 (2018). Read: Preface Remark 3.19; §1.2.1–1.2.2; §1.3.1–1.3.5; Proposition 1.4.9 and proof, printed pp. 63–64, compared with the 2018 copy.; Revision reading: §1.2.1–1.2.2 and §1.3.1–1.3.2, printed pp. 53–59; Proposition 1.4.9, pp. 63–64..
- **KL15-foundations**: [Relative p-adic Hodge theory: foundations](https://arxiv.org/abs/1301.0792); arXiv:1301.0792v5, 9 May 2015 (PDF dated 2 May 2015); preprint of Astérisque 371 (2015). Read: Definition 3.3.2 and Lemma 3.3.3; §5.0–5.5; §8.2 Proposition 8.2.20 and Theorem 8.2.22; Definition 8.3.4; §8.7; Conjecture 8.8.20; §8.9; Revision reading: Definition 3.3.2 and Lemma 3.3.3, p. 76; §5.1–5.5, pp. 113–132, including corrected signs and initialization; Definition 8.3.4, p. 166, and Lemma 8.7.15/Remark 8.7.16, p. 180..
- **Far-divisors**: [Simple connexite des fibres d une application d Abel-Jacobi et corps de classes local](https://webusers.imj-prg.fr/~laurent.fargues/cdc.pdf); Author preprint dated 24 October 2017; source cited as Far20b by FS, numbering checked in this edition. Read: Definition 2.6; §2.2 proof and statement of Proposition 2.18; statement of Proposition 2.19.
- **HK-sheafiness**: [Sheafiness criteria for Huber rings](https://kskedlaya.org/papers/criteria.pdf); Author-hosted criteria.pdf, version 6 August 2026, accessed 7 October 2026. Read: §7 Definitions 7.1–Remark 7.2, Lemma 7.3, Corollary 7.4, Lemma 7.5.
- **Ked-Ainf**: [Some ring-theoretic properties of A_inf](https://arxiv.org/abs/1602.09016); arXiv:1602.09016v5, 11 June 2019. Read: §3 Hypothesis 3.4, Definition 3.5, Proposition 3.6, Theorem 3.8–3.9, Example 3.14; Revision reading: Hypothesis 3.4 and Definition 3.5, p. 7; Proposition 3.6 and Theorem 3.8, pp. 8–9; Example 3.14, p. 10..
- **Ked-Witt**: [Nonarchimedean geometry of Witt vectors](https://arxiv.org/abs/1004.0466); arXiv:1004.0466 author copy. Read: §4, supporting KL15 Definition 3.3.2 and Lemma 3.3.3; Revision reading: §4, pp. 19–23; Definition 7.5, Theorem 7.8 and proof, pp. 33–34..
- **Zhu17**: [Affine Grassmannians and the geometric Satake in mixed characteristic](https://annals.math.princeton.edu/2017/185-2/p02); Annals of Mathematics 185 (2017), no. 2, §0.5. Read: §0.5 coefficient conventions.
- **BS17**: [Projectivity of the Witt vector affine Grassmannian](https://people.mpim-bonn.mpg.de/scholze/Witt.pdf); Author copy Witt.pdf, §9. Read: §9 coefficient convention preceding Definition 9.1.
- **GR24-prismatic**: [A prismatic approach to crystalline local systems](https://par.nsf.gov/servlets/purl/10534610); Inventiones mathematicae 236 (2024), 17–164; publisher article from NSF PAR. Read: Proof of Theorem 4.15, printed pp. 74–75.
- **Sch13-periods**: [p-adic Hodge theory for rigid-analytic varieties](https://people.mpim-bonn.mpg.de/scholze/pAdicHodgeTheory.pdf); Author-hosted pAdicHodgeTheory.pdf. Read: §6 definitions, Lemma 6.3 and Corollary 6.4; Revision reading: Definition 6.1, Lemma 6.3 and Corollary 6.4, printed pp. 35–36..
- **FF18-corrected**: [Courbes et fibres vectoriels en theorie de Hodge p-adique, corrected author copy](https://webusers.imj-prg.fr/~laurent.fargues/Courbe_fichier_principal.pdf); Author-hosted PDF created 13 November 2018, 404 pages; Lemme 1.2.3 and Proposition 1.4.9 checked. Read: Lemme 1.2.3, printed p. 7; Proposition 1.4.9 and proof, printed p. 16, corrected product leading exponent.; Revision comparison: Lemme 1.2.3, printed p. 7, and Proposition 1.4.9, p. 16..
- **FS21-fargues**: [Geometrization of the local Langlands correspondence, Fargues author copy](https://webusers.imj-prg.fr/~laurent.fargues/Geometrization.pdf); Author-hosted PDF created 26 February 2021, 348 pages; comparison of II.1.1 and II.1.10 only. Read: Proof of II.1.1, printed p. 48; Lemma II.1.10; Revision comparison: II.1.1, printed p. 48, and II.1.10, p. 52..

- **RelativeFarguesFontaine/E1** (confirmed), `FS-geometrization`, Proof of II.1.1, printed p. 48, MPIM author copy created 27 November 2024: t_1^sharp = π/[ϖ]. The displayed root presentation roots the whole ratio π/[ϖ]. The chart relation is π=[ϖ]s_0 and |π|≤|[ϖ]|. The reciprocal is unbounded when |π|<|[ϖ]| and undefined on the retained π=0 end. The Fargues author copy prints π/[ϖ]. Correct in the Fargues author copy created 26 February 2021, proof of II.1.1, p. 48: https://webusers.imj-prg.fr/~laurent.fargues/Geometrization.pdf
- **RelativeFarguesFontaine/E2** (confirmed), `FF18-courbes`, Lemme 1.2.3, printed p. 55, author copy dated 16 April 2017: u(V_π x) = (π/π′) V_π′(u(F_E^(f−1)x)), with the iterate taken before u. On outer ghost component n≥1 the left side is π w_(fn−1)(x); the corrected right side has the same ghost component. Iterating F_E′ after u instead yields index f(n−1)+f(f−1), which differs for f>1. Corrected in the Fargues author copy created 13 November 2018, §1.2.1 Lemme 1.2.3, p. 7: https://webusers.imj-prg.fr/~laurent.fargues/Courbe_fichier_principal.pdf
- **RelativeFarguesFontaine/E3** (rejected), `FS-geometrization`, Lemma II.1.10, printed p. 52, MPIM author copy created 27 November 2024: For the open unit disc use 0<ρ<1, while retaining the stated condition x_ρ∈|D_C|. The radius-one Gauss norm has |T|=1, so it is outside the open unit disc. The additional printed membership condition already excludes it; this is an endpoint clarification, not a false theorem under that condition. new
- **RelativeFarguesFontaine/E4** (confirmed), `KL15-foundations`, Conjecture 8.8.20(b), printed p. 187, arXiv:1301.0792v5; finding scoped to that preprint: The unrestricted perfectoid/uniform conclusion cannot include nonreduced divisors. Keep (a) as a sourced conjecture, and require a separate proved reduced/simple-leg hypothesis for any perfectoid assertion. Over a geometric field take F=O(2) and t=s², where s is a degree-one section with a simple zero. F(-2)=O is globally etale, and t is fibrewise nonzero. Locally the divisor algebra is A/(s²), with nonzero nilpotent s mod s². A uniform Tate algebra is reduced: multiplying a nilpotent by arbitrary powers of a topologically nilpotent unit produces unbounded power-bounded elements. Hence this thickening admits no compatible uniform Banach norm and is not perfectoid. new
- **RelativeFarguesFontaine/E5** (confirmed), `KL15-foundations`, Lemmas 5.2.8 and 5.2.10 proofs, printed pp. 118–119, arXiv:1301.0792v5: With x=y+z use z=x−y in 5.2.8 and y=x−z in 5.2.10. The two displayed signs contradict the immediately stated decomposition. All subsequent nonarchimedean norm bounds are unchanged by negation, so the intended statements and estimates remain correct. No corresponding entry found in KLII Appendix A, printed pp. 189–191; the two sign corrections follow directly from x=y+z in the cited proofs.
- **RelativeFarguesFontaine/E6** (confirmed), `KL15-foundations`, Corollary 5.2.12 proof, printed p. 120, arXiv:1301.0792v5: Use an iteration index m distinct from the eigenweight n: the bound is sup_(r∈[s,qs]) limsup_(m→∞) p^(-mn/(rq^m)) λ(α^r)(x)^(1/(rq^m))≤1. The second displayed equation in the eigenvector-growth proof is corrected in KLII Appendix A. Its iteration index must be distinct from the fixed eigenweight; the accumulating exponent includes the iteration factor m. Relative p-adic Hodge theory II: imperfect period rings, arXiv:1602.06899v3, Appendix A, https://arxiv.org/abs/1602.06899, printed p. 190
- **RelativeFarguesFontaine/E7** (confirmed), `KL15-foundations`, §3.6, Lemma 3.6.3 and Definition 3.6.4, printed p. 88, used in Lemma 5.5.5, pp. 130–131; arXiv:1301.0792v5: Add the condition z_0∈R× to the generic primitive definition. Integral π=0 legs use the separate all-E Cartier result. The comparison identifies p and the Teichmuller lift of z_0 in finite quotients; without invertibility in R the generic quotient and its period-radius normalization are not the intended untilt. This is the missing hypothesis explicitly supplied by Appendix A. Relative p-adic Hodge theory II: imperfect period rings, arXiv:1602.06899v3, Appendix A, https://arxiv.org/abs/1602.06899, printed p. 190
- **RelativeFarguesFontaine/E8** (confirmed), `KL15-foundations`, Lemma 5.5.5 proof, printed p. 131, arXiv:1301.0792v5: Replace the three y_0 occurrences by x_0 and use the spectral coefficient norm (the two α symbols corrected in Appendix A). The last estimate bounds the x expansion being completed; y is the earlier comparison expansion. Appendix A specifies these replacements. Relative p-adic Hodge theory II: imperfect period rings, arXiv:1602.06899v3, Appendix A, https://arxiv.org/abs/1602.06899, printed p. 191
- **RelativeFarguesFontaine/E9** (confirmed), `KL15-foundations`, Proposition 8.2.20 proof, printed p. 164, arXiv:1301.0792v5: Z_ij→Y is finite etale and Y_ij→Z_ij is an open immersion. A factorization requires morphisms with named targets. This is the corrected basis factorization used to reduce etale descent to finite etale maps and open covers. Relative p-adic Hodge theory II: imperfect period rings, arXiv:1602.06899v3, Appendix A, https://arxiv.org/abs/1602.06899, printed p. 191
- **RelativeFarguesFontaine/E10** (confirmed), `KLII-errata`, Appendix A, printed p. 190, entry for Foundations Proposition 3.6.11; corrected Theorem 3.3.13 and Remark 3.3.14, pp. 61–62, arXiv:1602.06899v3: Use the corrected Theorem 3.3.13 in Relative p-adic Hodge theory II for the primitive-quotient/perfectoid input; the P3 supplier must provide the corrected interface. The authors explicitly identify an incomplete proof in Appendix A. The period-spectrum proof must therefore consume the corrected perfectoid result, not treat the old proof as a closed input. Relative p-adic Hodge theory II: imperfect period rings, arXiv:1602.06899v3, Appendix A, https://arxiv.org/abs/1602.06899, printed p. 190 and corrected Theorem 3.3.13
- **RelativeFarguesFontaine/E11** (confirmed), `KL15-foundations`, Lemma 5.5.2 proof, printed p. 128, arXiv:1301.0792v5 only: Put z_0 = z, the element to be expanded in the lifted generators. The recursion subtracts a lifted residue expansion from z_l. Starting with zero can produce only zero and does not expand an arbitrary z. Taking R=S a perfect analytic field, the single generator 1 and z=1 exposes the failure. new
- **RelativeFarguesFontaine/E12** (confirmed), `FF18-courbes`, Proposition 1.4.9 proof, printed p. 64, author copy dated 16 April 2017: π^{n_0+m_0} in the leading product term and its norm expression. Multiplying terms of indices n_0 and m_0 adds their exponents. For π² and π³ the leading term has exponent 5, not 6. The 2018 author copy prints the sum. Correct in the 13 November 2018 Fargues author copy, Proposition1.4.9 proof, printed p.16: https://webusers.imj-prg.fr/~laurent.fargues/Courbe_fichier_principal.pdf
- **RelativeFarguesFontaine/E13** (confirmed), `KL15-foundations`, Lemma 5.5.2 proof, first lines of printed p. 129, arXiv:1301.0792v5 only: Use R̃_S^(int,s), whose elements must be expanded in the lifted generators. The preceding estimate expands [z] for z in S. To show generation of the S-period ring one must expand an arbitrary element of that ring, not merely one of the coefficient ring R. new
- **RelativeFarguesFontaine/E14** (confirmed), `KL15-foundations`, Proposition 5.5.3 proof, printed p. 129, arXiv:1301.0792v5 only: Remove FÉt: the module is over the ring R̃_R^(int,r), not its finite-etale category. The finite generation asserted by Lemma5.5.2 is a module-over-ring assertion; the displayed FÉt expression denotes a category and cannot serve as that scalar ring. new
