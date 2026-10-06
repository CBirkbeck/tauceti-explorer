# Curves, currents and regulator comparisons — P.5

This is the target-level follow-up of the accepted [Polylogarithms packet](../packets/Polylogarithms.json), restricted to **Polylogarithms:P.5**. Its purpose is to connect the existing low-weight curve formulas to a usable current library, Green current classes, and the comparison with the universal regulator. It also specifies the three-point elliptic weight-three series and the exact analytic comparison still required. All thirty existing P.5 declarations are imported by their ids. The parent packet is unchanged.

The planning pass is complete and the stage is **planned**. Mathematical closure remains open: nine precisely stated gaps and eight supplier requests appear below. Every target has a declaration chain ending in the pinned libraries, an existing node, an exact requested interface, or one of those gaps. No declaration is claimed to be implemented. The small suggested-file models check that the proposed concrete signatures type correctly; they do not establish the global regulator theorems.

The two style references read for this pass are [Contour integration](../../../content/tau-ceti/ContourIntegration/README.md) and [Hodge structures](../../../content/tau-ceti/HodgeStructures/README.md). The roadmap’s reviewed library audit is **AUDIT-30**: P.5 is not built, with its five implementation targets absent. The six remaining tasks inherited from the parent are accounted for individually in the packet’s target coverage.

## Ownership and the dependency boundary

General real Deligne theory belongs to an **early archimedean prefix of MotivicEtaleKTheory:M.8**. That prefix must construct the real Deligne complex in all weights and degrees required here, hypercohomology, products, support classes, purity, logarithmic/current model comparisons and the universal Chern regulator. It exports units, cup products and norm/residue compatibility before the explicit comparisons in P.5, ER.2 and R.7. The late M.8 comparisons continue to consume completed Borel and p-adic regulator work.

The currently unsplit M.8 is not used as a prerequisite edge. Its late prerequisites would reverse the required order. This is an exact supplier request and a maintainer split proposal, with a recorded gap until an early prefix is accepted. It is not an invented stage id. This handles confirmed findings **RT-AREA-ktheory-2/7** and **/24**, including the accepted ER.2 follow-up’s corrected ownership.

P.5 owns the general curve expression η(f,g) and its comparison. ER.2 imports it and adds its elliptic dimension, embeddings and conjugation, period lattice, rational orientation and torsion-sensitive lift questions. ER.4 imports generic norm/trace from the early M.8 interface before proving its elliptic trace statement. No P.5 declaration depends on ER.2. The cone called Goncharov’s current complex in the parent remains a distinct explicit model; the comparison to general Deligne hypercohomology imports M.8 rather than reconstructing it.

The other boundaries are equally specific. M.4 owns the simplicial, cubical and mixed cycle complexes, moving, localization and comparison. M.6 supplies the rational higher Chern character. S.4 supplies divisor lengths, Quillen residues and its ordinary Chow identification, but this does not give the two-cohomology-degree graph comparison involving CH^p(X,1). R09.7 supplies algebraic embedded resolution in characteristic zero. R09.2 needs a Part II supplying Chow parameter spaces and incidence; its Hilbert/Quot theorem and Chow’s lemma are insufficient. C0 supplies analytification with its tracked PR196 analytic-space gap. An early analytic extension of C5 supplies global differential forms, integration and the torus Fourier interface. P.5 constructs the global current dual once from those forms and Mathlib’s chart distributions.

## Conventions that determine the maps

An oriented real manifold of dimension m has degree-q currents dual to compactly supported forms of degree m−q. Its differential is

\[
 (dT)(\varphi)=(-1)^{q+1}T(d\varphi).
\]

The topology on test forms is the locally convex inductive limit over compact supports, with all derivative seminorms on each fixed compact. It is not the compact-open smooth topology. Complex manifolds carry the positive complex orientation. Smooth multiplication and proper-on-support pushforward are available; arbitrary-current pullback is restricted to submersions or opens. The singular incidence transform of the parent must be defined through a resolved integrable form, not through an unrestricted current pullback.

Raw integration uses the positive complex orientation. For a complex d-fold and a codimension-p cycle, the BFT convention is

\[
 [\alpha]_{\mathrm{BFT}}(\omega)=(2\pi i)^{-d}\int_X\omega\wedge\alpha,
 \qquad \delta_Z=(2\pi i)^{-(d-p)}[Z]_{\mathrm{raw}}.
\]

The order of the wedge factors in that evaluation is part of the convention. The highest Deligne operator is −2∂bar∂, equivalently 2bar∂∂. For raw currents set dd^c=(i/π)∂bar∂=bar∂∂/(πi). Then dd^c log|f| is the divisor current, and a principal Green function is −log|f|. Published Goncharov equation (38) visibly uses the barred operator first; the bars were checked in the PDF image. The parent’s separate ordinary-d residue sign issue E21 remains unresolved in general degree.

All logarithmic symbol arguments are nonzero rational or meromorphic functions; an argument equal to zero is not admitted. Cube coordinates are t_i=y_i/x_i on □=P¹ minus {1}. The normalized cycle complex has zero infinity faces and differential Σ_i(−1)^i zero-face_i. BFT uses Δ^m=P^m minus {Σ_i z_i=0}. The parent hyperplane Σ_(i≥1)z_i=z_0 is carried to it by z_0↦−z_0. The factor −1 has zero logarithmic jet, so the forms agree under that change.

For the auxiliary complex this document fixes the order **(support, cycle, base)**. In cochain degree q its terms are A^(q+1)⊕H^q⊕D^q, with differential

\[
 d(a,z,\alpha)=(-da,dz+g_1a,d\alpha-\rho a).
\]

The base inclusion is (0,0,α), and a cycle is (0,cl(z),0). The comparison reads ψ(a,z,α)=Pc(z)−Green(a)+φ(α). This corrects the degree and coordinate mismatch in BFT preprint §4.8; its Theorem 6.10 uses a cycle-first ordering. The typed additive-group prototype checks the chosen signs and degree shift, without assuming any Deligne purity theorem.

For the elliptic expression choose Λ=Zu+Zv with A=Im(conj(u)v)>0. This is ordinary positive area, and μ=dxdy/A is probability area. Characters are χ_γ(z)=exp(2πi Im(z conjγ)/A), with a positive exponent. Reversing the character convention reverses the odd kernel. The differential identities used in the Fourier calculation are

\[
 \partial\chi_\gamma=(\pi\bar\gamma/A)\chi_\gamma\,dz,
 \qquad dz\wedge d\bar z=-2iA\,\mu,
 \qquad \widehat{\log|f|}(\gamma)=-\frac{A}{2\pi|\gamma|^2}\operatorname{div}f(\chi_{-\gamma})
 \quad(\gamma\ne0).
\]

The precise scalar in the target below is derived from these conventions. It is not a literal transcription of the preprint’s inconsistent normalization.

## How the comparisons are assembled

The current library is used by all four constructions: the curve symbol forms, the higher-cycle regulator, the Green presentation, and the Chow incidence application. Poincaré–Lelong fixes their principal-divisor signs. The smooth/current de Rham and Dolbeault comparisons are local resolution statements globalized by fine sheaves; they supply a model comparison after M.8 constructs general Deligne theory. Logarithmic Green representatives retain their support class, because an equation holding only away from a cycle cannot determine the cycle residue.

The route to Burgos Gil–Feliu–Takeda Theorem 6.18 is explicit. Start with the finite Wang polynomial, its differential and the resolved current boundary identity. Define Pc on M.4’s normalized cubical cycles. Form the support diagram, top-support projection g1 and base comparison φ. Local basic-Green estimates supply the top cycle residue and the lower-degree Green product identity. These identities make ψ a chain map and make its cycle and base restrictions commute. The requested Burgos–Feliu/universal comparison then identifies Pc after the M.6 rational Chern character. Finally the mixed Wang form and Pcs give both restrictions to Pc and Ps; M.4’s two mixed-inclusion quasi-isomorphisms transport the equality to the simplicial regulator. This proves the cited theorem in its smooth projective complex range once the named imports are supplied. The complete raw-Goncharov-to-BFT chain dictionary remains a distinct gap.

Weight two uses the parent η. The M.8 unit is log|f|; its cup formula gives iη. The higher Chern normalization ch_(i,j)=(−1)^(j−1)c_(i,j)/(j−1)! supplies ch_(2,2)=−c_(2,2), while the Chern product formula contributes the cancelling minus sign. The period around zero for (z,c), c>1 real, is −2πi log c. A current with vanishing logarithmic residues is not automatically a rational K2 class: actual rational tame-kernel membership is required.

In weight three, the parent ρ2 descends through B2 because both D and the alternating bilinear correction α respect its relations. The G00/D96 convention is r3(2)=−ρ2. Stokes and the one-form type identities give the exact parent pairing coefficient −4/3, for both holomorphic and antiholomorphic forms. D96’s K4 residue comparison applies over number fields, where Borel injectivity is available; it does not establish a generic K4 isomorphism or the missing complex-level transfer.

On an elliptic curve the required object is the three-point generalized Eisenstein–Kronecker series. It has a numerator linear in conjugate lattice variables and three quadratic denominators. The dyadic convergence estimate splits by the largest scale R and smallest scale s. Two variables have size comparable to R; a block has O(R²s²) pairs and term bound O(R^−3s^−2), giving O(R^−1) per block and O(log R) blocks at scale R. The sum over dyadic R converges. This justifies permutation, translation, period and scaling identities. The kernel scales by conjλ/|λ|⁶, so positive scaling by 2 gives 1/32.

The Fourier pairing uses the divisors in the order (div g, div f, div(1−f)). Zero Fourier modes cancel only in the summed symbol-cycle situation Σ(1−f)∧f∧g=0. They cannot be discarded function by function. Finite Fourier multiplication reproduces iA³/(4π²) for the log/α pairing, and therefore −iA³/(3π²) for the parent ρ2 pairing. Products near shared logarithmic poles still need a rigorous approximation argument; source normalization collation also remains open. The theorem is a target with those explicit proof obligations. No elliptic weight-three special-value conjecture is promoted to a theorem.

## Declaration inventory

Each item below has the full mathematical statement, its direct prerequisites, proof route and acceptance conditions. Definition and construction APIs and tests are listed under the declaration they serve. The packet ids are stable; the displayed names are the proposed library names. All nodes have implementation status unchecked.

### Current foundations

#### Compactly supported test forms

**TestForms** · definition · Polylogarithms:P.5/compact-test-forms

For a second countable smooth oriented real m-manifold M, TestForms^k(M) consists of smooth sections of Λ^k T* M with compact support. Its topology is the locally convex inductive limit over compact K of the Fréchet spaces of sections supported in K, with all coordinate derivative seminorms. Complexification gives complex test forms; complex manifolds have their canonical orientation. Extension by zero is defined for an open embedding only for support compactly contained in that open.

Direct prerequisites: mathlib:TestFunction, mathlib:TestFunction.ext, mathlib:TestFunction.continuous_iff_continuous_comp, ComplexComparisonPartII:C5.

Construction or proof route:

1. Import global smooth differential forms and their exterior derivative from the early analytic interface requested of C5.
2. Construct fixed-support seminorms chartwise, prove equivalence under changes of finite chart cover, and take the LF inductive limit.
3. In a single finite-dimensional chart use Mathlib TestFunction with alternating-form coefficients; prove extension-by-zero is continuous.

API:

- **TestForms.ext** (extensionality): Equality of sections at every point implies equality.
- **TestForms.chart** (compatibility): On an open finite-dimensional normed-space chart, k-forms identify with TestFunction with continuous alternating-map coefficients, with the same LF topology.
- **TestForms.extendZero** (functoriality): Open embeddings give continuous extension by zero; identity and composition hold when the support is compactly contained.
- **TestForms.d** (data): Exterior derivative is a continuous map TestForms^k→TestForms^(k+1), with square zero.

Unit tests:

- **TestForms.empty** (degenerate): TestForms^k of the empty manifold is zero.
- **TestForms.chart_scalar** (compatibility): Degree-zero real test forms on Ω are Mathlib TestFunction Ω R ∞, including its topology.
- **TestForms.support_escape** (non-example): Bump functions translated to disjoint balls escaping every compact subset of R do not converge to zero in the test LF topology, although they converge to zero in the compact-open smooth topology.

Uses: DEM I §2.B — The correct continuous dual defines currents. BFT §2.2 — Normalised currents test complementary-degree compact forms.

Acceptance: The LF topology, rather than the topology induced from all smooth forms, controls the dual.

Sources: [DEM](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf), Chapter I §2.A, pp. 13–14.

#### Currents on complex manifolds

**ManifoldCurrent** · construction · Polylogarithms:P.5/manifold-currents

On an oriented m-manifold M define a degree-q current as a continuous linear functional on TestForms^(m-q)(M), with real or complex coefficients as specified. Set dT(φ)=(-1)^(q+1)T(dφ). On a complex d-manifold this decomposes as ∂+bar∂ and has bidegrees (p,q). Locally L1 forms α define [α](φ)=∫ α∧φ. Pushforward exists for smooth maps proper on the support, with degree changed by the dimension difference; use holomorphic maps, whose real dimension difference is even, so d commutes. Pullback of arbitrary currents is restricted to submersions (and open embeddings); multiplication is by smooth forms, not by arbitrary currents.

Direct prerequisites: Polylogarithms:P.5/compact-test-forms, mathlib:Distribution, mathlib:Distribution.ofFun, mathlib:Distribution.lineDerivCLM.

Construction or proof route:

1. Take the continuous dual of complementary-degree test forms.
2. Use chart coefficient decompositions into scalar Distribution; dualise d to obtain the signed differential and type decomposition.
3. Define proper-support pushforward by test-form pullback and submersion pullback by local fibre integration; verify chart independence and graded smooth multiplication.

API:

- **ManifoldCurrent.ext** (extensionality): Agreement on all test forms implies equality.
- **ManifoldCurrent.ofForm** (constructor): Locally L1 coefficients yield the integral current, additive and invariant under almost-everywhere equality.
- **ManifoldCurrent.d_apply** (simp): dT(φ)=(-1)^(degree T+1)T(dφ); d²=0.
- **ManifoldCurrent.pushforward** (functoriality): For holomorphic maps proper on support, pushforward is functorial and commutes with d, ∂ and bar∂.
- **ManifoldCurrent.pullback** (functoriality): Submersions admit pullback, with identity/composition and compatibility with smooth forms.
- **ManifoldCurrent.chart_top** (compatibility): A top-degree current in an oriented real chart is a scalar Mathlib Distribution under the complementary-degree-zero test-form identification.

Unit tests:

- **ManifoldCurrent.dirac** (computation): The top-degree Dirac current δx evaluates a scalar test function at x, agreeing with Distribution.delta.
- **ManifoldCurrent.derivative_sign** (compatibility): The derivative of a scalar chart distribution evaluates φ as -T(∂vφ), agreeing with Distribution.lineDerivCLM.
- **ManifoldCurrent.no_arbitrary_product** (non-example): The product δ0·δ0 has no canonical product in this API; smoothing δ0 by scale ε gives squares whose mass grows like ε^(-m).

Uses: G05 Theorem 2.4 and Definition 2.11 — Logarithmic forms on resolutions are pushed to currents on X. BFT §6 — Proper projection and differential identities define regulator maps.

Acceptance: On C, d(darg z)=2πδ0 in the positive complex orientation.

Sources: [DEM](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf), Chapter I §2.B–C, pp. 14–18.

#### Integration currents of analytic cycles

**CycleCurrent** · construction · Polylogarithms:P.5/analytic-cycle-current

For a pure-dimensional closed complex analytic subset Y of a complex d-manifold X, integrate complementary test forms over Yreg with its complex orientation. This is locally finite and defines the closed current [Y]raw of bidegree (c,c), c=codim Y. Extend additively to integral cycles. Whenever a proper resolution of Y is supplied, it equals pushforward of its integration current; for algebraic cycles such resolutions are constructed by R09.7, and the normalised BFT current is δY=(2πi)^(-(d-c))[Y]raw.

Direct prerequisites: Polylogarithms:P.5/manifold-currents, AlgebraicModuliForArithmeticGeometry:R09.7, ComplexComparisonPartII:C0/repair-analytification.

Construction or proof route:

1. Local finite ramified projections bound the mass near the singular locus (Demailly III Lemma 2.6).
2. Extend across the singular locus; closedness follows by the local extension argument of III Theorem 2.7.
3. For a resolution use change of variables away from a measure-zero analytic subset and proper pushforward.

API:

- **CycleCurrent.add** (simp): The current of Z+W is the sum of currents.
- **CycleCurrent.resolution** (compatibility): A proper resolution computes the same raw integration current.
- **CycleCurrent.closed** (characterisation): The integration current of a closed analytic cycle is d-closed.
- **CycleCurrent.bft** (coercion): In complex dimension d and codimension c the normalised current is (2πi)^(-(d-c)) times the raw current.

Unit tests:

- **CycleCurrent.point** (computation): In a complex curve the BFT current of a point is the ordinary Dirac current.
- **CycleCurrent.multiplicity** (computation): The current of div(z^r) on C is rδ0 for r a positive integer.
- **CycleCurrent.whole_space** (compatibility): For c=0, δX=(2πi)^(-d)[X]raw=[1] in BFT conventions.

Uses: BFT §2.2 and Lemma 6.1 — The degree-zero regulator is the cycle current. Green presentation — The Green equation uses integration over the cycle.

Acceptance: Multiplicity is retained for a nonreduced divisor.

Sources: [DEM](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf), Chapter III §2.B, Lemma 2.6 and Theorem 2.7, p. 140.

#### Smooth forms and current cohomology

**currentResolution** · theorem · Polylogarithms:P.5/current-resolution

On a second countable smooth manifold the inclusion of smooth forms into currents is a quasi-isomorphism of de Rham sheaf complexes. On a complex manifold the same inclusion is a quasi-isomorphism for each Dolbeault complex, compatibly with type and conjugation. Consequently the smooth and current Dolbeault models of real Deligne theory agree after the M.8 comparison is supplied.

Direct prerequisites: Polylogarithms:P.5/manifold-currents, ComplexComparisonPartII:C5.

Construction or proof route:

1. Regularise chart currents by smoothing kernels and use the compactly supported homotopy to show a closed current is locally cohomologous to a smooth form.
2. Apply the Poincaré lemma for currents in positive degrees and equality of locally constant degree-zero kernels.
3. For bar∂ use the Bochner–Martinelli/Koppelman homotopy and its distributional limit; fine sheaves globalise the local quasi-isomorphisms.

Acceptance: On a star-shaped chart, every d-closed current of positive degree is locally exact; degree zero retains constants.

Sources: [DEM](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf), Chapter I §2.D.3–4, Theorem 2.24, pp. 19–20; §3.E, Lemma 3.29, pp. 28–29.

#### Poincaré–Lelong formula

**poincareLelong** · theorem · Polylogarithms:P.5/poincare-lelong

For a nonzero meromorphic function f on a complex manifold, log|f| is locally L1 and (i/π)∂bar∂[log|f|]=[div f]raw. Define dd^c=(i/π)∂bar∂; this is equivalently bar∂∂[log|f|]=πi[div f]raw. On a complex curve d[darg f]=2π[div f]raw. The BFT degree-one Deligne differential is -2∂bar∂, hence d_D[-log|f|]=-δdiv f with its dimension/twist normalisation.

Direct prerequisites: Polylogarithms:P.5/analytic-cycle-current, Polylogarithms:P.5/manifold-currents.

Construction or proof route:

1. Prove the one-variable logarithm identity on a punctured disk by Stokes and the positive circle integral 2π.
2. Factor f at regular divisor points; units contribute no divisor current.
3. Extend across codimension at least two by the current support theorem used in Demailly III §2.C; apply linearity for meromorphic f.

Acceptance: dd^c log|z|=δ0 and dd^c(-log|z|)+δ0=0. The displayed bar∂∂ order matches the published G05 equation (38); replacing it by ∂bar∂ reverses the sign.

Sources: [DEM](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf), Chapter III §2.C, Theorem 2.15, pp. 143–144.

### Cycle parameters and Green classes

#### Admissible cycle parameter spaces

**AdmissibleChowLocus** · construction · Polylogarithms:P.5/admissible-chow-locus

Given P^N over C, finitely many specified simplex faces L_I and a general-position hyperplane H, let U_(c,e) be the open locus in the requested degree-e, codimension-c Chow parameter space whose cycles meet every L_I properly and are not contained in H where the coordinate-ratio construction requires this. The analytic parameter space Z^c is the disjoint union over e≥0 of these finite-dimensional loci. Its incidence cycle has a proper projection to the parameter space. Face intersection maps and vertex projection maps exist only on the loci where they preserve the prescribed dimensions; their target degree is recorded.

Direct prerequisites: AlgebraicModuliForArithmeticGeometry:R09.2, Polylogarithms:P.5/analytic-cycle-current, ComplexComparisonPartII:C0/repair-analytification.

Construction or proof route:

1. Request the general Chow parameter space, universal incidence cycle and upper semicontinuity of fibre dimensions as R09.2 Part II; Hilbert/Quot representability alone does not supply them.
2. Express failure of proper face intersection by the relevant fibre-dimension closed loci and take their complement.
3. Restrict the incidence cycle and the dimension-preserving projection domains; the projective incidence projection is proper. This supplies the missing carrier of the parent Chow-polylogarithm construction.

API:

- **AdmissibleChowLocus.points** (characterisation): Complex points represent effective cycles of the fixed degree with all required proper face intersections.
- **AdmissibleChowLocus.incidence** (data): The incidence cycle projects properly to each finite-degree locus.
- **AdmissibleChowLocus.face** (functoriality): Proper intersection with a specified face induces its cycle map and respects iterated faces on the common domain.
- **AdmissibleChowLocus.vertex** (functoriality): Projection from a vertex is defined only when dimension and codimension are preserved; no unrestricted map is exported.

Unit tests:

- **AdmissibleChowLocus.zero** (degenerate): The degree-zero component consists of the zero cycle and has empty incidence cycle.
- **AdmissibleChowLocus.line** (computation): For lines in P², each line distinct from every fixed one-dimensional face and avoiding every vertex meets all faces properly.
- **AdmissibleChowLocus.face_line** (non-example): A line equal to a one-dimensional face fails proper intersection with that face and is excluded.

Uses: Polylogarithms:P.5/chow-polylogarithm-forms — Provides its parameter spaces and the proper incidence projection; the already planned Radon transform is imported.

Acceptance: A line contained in a simplex face is excluded; a transverse line is included.

Sources: [G05](https://www.ams.org/journals/jams/2005-18-01/S0894-0347-04-00472-2/S0894-0347-04-00472-2.pdf), Section 3.1, p. 22, notation Z^q_p(L).

#### Logarithmic Green forms

**LogGreenForm** · definition · Polylogarithms:P.5/logarithmic-green-forms

For smooth projective complex X, a codimension-p cycle z and Y=supp z, a logarithmic Green form is a real Deligne support representative (ω,g) of cl(z) in degree 2p: ω is smooth on X, g is smooth on X\Y, and g pulls back on an embedded resolution of (X,Y) to a logarithmic form along a normal-crossings divisor. Representatives are taken modulo the support-complex boundaries, retaining the support class, not merely the off-support equation d_Dg=ω. A basic representative has g=Σλj αj+β on a resolution, with λj divisor Green functions, αj smooth of type (p-1,p-1), restrictions ∂ and bar∂ closed, and β smooth.

Direct prerequisites: Polylogarithms:P.5/poincare-lelong, AlgebraicModuliForArithmeticGeometry:R09.7.

Construction or proof route:

1. Request M.8 support Deligne classes and its logarithmic Dolbeault model; restrict to classes of cycles.
2. Use the weight-one representative and integration by parts to absorb differentiated logarithms into ∂/bar∂ boundary terms (Burgos II Lemma 4.5).
3. Impose the support class to pin the divisor residue coefficient; retain the resolution-independence proof via common refinements.

API:

- **LogGreenForm.class** (projection): The support Deligne class is cl(z), with the specified Tate twist.
- **LogGreenForm.basic** (constructor): Every Green-form class has a basic logarithmic representative as stated.
- **LogGreenForm.refine** (compatibility): Passing to a common resolution does not change its class.
- **LogGreenForm.change** (relation): Adding a support-complex boundary changes the representative but not its Green-form class.

Unit tests:

- **LogGreenForm.principal** (computation): For a rational function f, (0,-log|f|) is the Green representative for div f in BFT conventions.
- **LogGreenForm.zero** (degenerate): The zero cycle admits the zero pair.
- **LogGreenForm.residue_required** (non-example): On P¹ the zero form on the complement of a nonzero point satisfies d_Dg=0 there but is not a Green representative for that point: its support class is zero.

Uses: BFT §6.3, equations (6.6)–(6.9) — Controls local integrability and the precise cycle residue in products with Wm.

Acceptance: A pair with zero off-support curvature can still carry a nonzero support class.

Sources: [BUR](https://www.icmat.es/miembros/burgos/files/tesis.pdf), Chapter II Definition 4.2 and Lemma 4.5, pp. 79–81.

#### Logarithmic current integrability and residues

**logarithmicCurrentEstimate** · theorem · Polylogarithms:P.5/logarithmic-current-estimate

Let Y have codimension p in a complex manifold X, and let α be a degree-r logarithmic form along Y, defined through a resolution of (X,Y). If r<2p, α is locally L1. If r<2p-1, d[α]=[dα]. In the borderline Green degree, a basic Green representative (ω,g) of cl(z) satisfies d_D[g]+δz=[ω]. These conclusions apply to currents modulo those annihilating test forms vanishing along the boundary used by the normalised cubical model.

Direct prerequisites: Polylogarithms:P.5/logarithmic-green-forms, Polylogarithms:P.5/manifold-currents, Polylogarithms:P.5/current-resolution.

Construction or proof route:

1. In normal-crossings charts, a test form vanishing on the divisor supplies one radial factor in each singular variable, leaving integrals of powers of log r against dr finite.
2. Duality with test forms vanishing on Y shows a possible residue annihilates them; such currents vanish below real degree 2p.
3. For a basic Green form compute the remaining exceptional-divisor residue by Stokes; the support class fixes its coefficient to the cycle, and higher-dimensional exceptional fibres contribute zero.

Acceptance: d(darg z)=2πδ0 shows the strict inequality r<2p-1 cannot be replaced by r≤2p-1.

Sources: [BUR](https://www.icmat.es/miembros/burgos/files/tesis.pdf), Chapter II Proposition 3.1, Corollary 3.8, pp. 73–78, and proof of Theorem 4.3, pp. 80–82.

#### Green forms give Green currents

**greenCurrentComparison** · comparison · Polylogarithms:P.5/green-current-comparison

For smooth projective complex X and a codimension-p cycle z, the map from logarithmic Green-form classes for z to Green current classes for z is an isomorphism. In BFT conventions its image satisfies d_D[g]+δz=[ω]; in unscaled conventions dd^c[g]+[z]raw is smooth. The map respects addition and pullback along morphisms for which the cycle pullback is defined and codimension p is preserved. No pullback of an arbitrary current is asserted.

Direct prerequisites: Polylogarithms:P.5/logarithmic-current-estimate, Polylogarithms:P.5/current-resolution.

Construction or proof route:

1. Local integrability and the residue theorem show a representative produces a Green current.
2. Both spaces are affine spaces over smooth (p-1,p-1) forms modulo ∂ and bar∂ images; the current/smooth comparison identifies the translation spaces.
3. Use basic representatives and resolution changes to verify allowed pullbacks and independence of representatives.

Acceptance: A constant Green function for the zero divisor survives before principal rational-function relations are imposed.

Sources: [BUR](https://www.icmat.es/miembros/burgos/files/tesis.pdf), Chapter II Theorem 4.3(1),(3) and its proof, pp. 79–83.

#### Green current cycle classes

**GreenCH** · definition · Polylogarithms:P.5/green-presentation

For a smooth projective complex X and p≥1, define GreenCH^p(X) as the abelian group of pairs (z,g), z an integral codimension-p cycle and g a real (p-1,p-1) raw current, with dd^c g+[z]raw smooth, modulo (0,∂u+bar∂v) with the required real condition and principal pairs (div_Y f,-ιY*log|f|), where Y has codimension p-1 and the pushforward uses a resolution if Y is singular. Here dd^c=(i/π)∂bar∂=bar∂∂/(πi). This is the degree-zero complex-variety presentation of G05 equation (38), which was equation (36) in the preprint; it does not define arithmetic Chow groups of an arbitrary arithmetic ring.

Direct prerequisites: Polylogarithms:P.5/green-current-comparison, Polylogarithms:P.5/analytic-cycle-current, SchemeKTheoryOperations:S.4/coniveau-weight-one-differential.

Construction or proof route:

1. Use Poincaré–Lelong on the normalisation/resolution of Y to show every principal pair satisfies the Green condition with zero curvature.
2. The Green condition is additive; quotient by the stated subgroup, retaining integral cycles and real current coefficients.
3. Correct the prose dimension labels in G05: z is a codimension-p cycle and Y has codimension p-1, not invariably divisors.

API:

- **GreenCH.mk** (constructor): A pair satisfying the Green condition determines a class.
- **GreenCH.forget** (projection): Forget the Green current to obtain CH^p(X), respecting principal relations.
- **GreenCH.curvature** (projection): Curvature dd^c g+[z]raw is a well-defined smooth closed (p,p) form on the quotient.
- **GreenCH.principal** (simp): The principal pair on every codimension-(p-1) Y has zero class.
- **GreenCH.current_boundary** (relation): Adding ∂u+bar∂v does not change the class.

Unit tests:

- **GreenCH.P1_principal** (computation): On P¹, ([0]-[∞],-log|z|) represents zero.
- **GreenCH.point** (degenerate): GreenCH^1(Spec C)=0: cycles vanish and principal pairs for constant f kill every real constant Green function.
- **GreenCH.positive_curvature** (non-example): A pair on P¹ with z=[0] and curvature integral one cannot be zero, whereas a principal pair has zero curvature.

Uses: Polylogarithms:P.5/higher-arakelov-chow-degree-zero — Supplies the missing explicit target group of the parent comparison. BFT Theorem 7.4 — Gives the complex component of the degree-zero identification; arithmetic-field descent uses the involution separately.

Acceptance: For p=1 the principal relation is (div f,-log|f|).

Sources: [G05](https://www.ams.org/journals/jams/2005-18-01/S0894-0347-04-00472-2/S0894-0347-04-00472-2.pdf), Section 2.10, equation (38), p. 21 (preprint equation (36)).

#### Gersten graphs and the degree-zero Arakelov presentation

**gerstenGreenAssembly** · application · Polylogarithms:P.5/gersten-green-assembly

For smooth projective complex X, identify the parent degree-zero higher Arakelov group with GreenCH^p(X), using the graph morphism from the final Gersten terms ⊕_(codim p-2) Λ² C(Y)*→⊕_(codim p-1) C(Y)*→Z^p(X) into the Bloch cycle complex. The requested input is an isomorphism on the last two cohomology groups, together with its compatible tame-symbol/divisor differential; no quasi-isomorphism of the entire complexes is asserted.

Direct prerequisites: Polylogarithms:P.5/green-presentation, Polylogarithms:P.5/higher-arakelov-chow-degree-zero, Polylogarithms:P.5/arakelov-motivic-complex, MotivicEtaleKTheory:M.4, SchemeKTheoryOperations:S.4/coniveau-chow-group, K2SymbolsBrauer:T.3/tame-symbol.

Construction or proof route:

1. Use admissible graph cycles for f and (f,g), moving representatives until all faces are met properly.
2. Import the exact top-two cohomology comparison requested from M.4; S.4 supplies the existing divisor/coniveau identification, with tame-symbol convention from T.3.
3. Evaluate the regulator on graphs: principal pairs and ∂/bar∂ boundaries give exactly the denominator; the top smooth quotient imposes precisely the Green condition.

Acceptance: Check the p=1 principal graph z↦f(z), including the minus sign in its Green function. Do not replace the needed CH^p(X,1) comparison by S.4’s Bloch formula for CH^p(X).

Sources: [G05](https://www.ams.org/journals/jams/2005-18-01/S0894-0347-04-00472-2/S0894-0347-04-00472-2.pdf), Proposition 2.14, pp. 21–22.

### Higher-cycle regulator comparisons

#### The normalised current dictionary

**bftCurrentDictionary** · comparison · Polylogarithms:P.5/bft-current-dictionary

On a smooth projective complex d-fold, the BFT form current is [α](ω)=(2πi)^(-d)∫ω∧α, and its codimension-p cycle current is δY=(2πi)^(-(d-p))∫Yω. Below Deligne degree 2p a degree-k cochain has ordinary form degree k-1 and twist p-1; the top degree uses closed (p,p) currents of twist p. The top differential is -2∂bar∂=2bar∂∂. Apply the requested M.8 Dolbeault real Deligne functor to the smooth/current quasi-isomorphism to identify cohomology with H_D. This pins the BFT model. Identification of the parent raw simplicial regulator with this normalised map still requires its separate degreewise sign/scale dictionary, recorded as a gap.

Direct prerequisites: Polylogarithms:P.5/current-resolution, Polylogarithms:P.5/analytic-cycle-current, Polylogarithms:P.5/goncharov-deligne-complex, Polylogarithms:P.5/goncharov-deligne-complex-comparison.

Construction or proof route:

1. Keep the dimension shift D_R=E_R′[-2d](-d) and dual test-form twist d-p from BFT equation (2.1).
2. Check the pairing order ω∧α and the cycle normalisation before constructing Deligne complexes.
3. Use the smooth/current quasi-isomorphism and M.8’s generic model comparison; check the top operator against the bars visible in published G05 p.21.

Acceptance: For p=1 and -log|f| the boundary is -δdiv f. On a point H_D^1(point,R(1))=R with unit regulator log|a| under the M.8 convention; the Wang input is its negative.

Sources: [BFT](https://arxiv.org/pdf/0909.5296v1), §2, equations (2.1)–(2.2), pp. 3–4.

#### Wang forms in a Dolbeault algebra

**WangForm.coefficients** · construction · Polylogarithms:P.5/wang-forms

For a Dolbeault algebra A and u1,…,um∈D¹(A,1), set S_m^i=(-2)^m Alt(u1∂u2∧…∧∂ui∧bar∂u_(i+1)∧…∧bar∂um), with Alt the unaveraged signed permutation sum. Define T0=1 and Tm=(2m!)^(-1)Σ_(i=1)^m(-1)^i S_m^i. It lies in D^m(A,m), ordinary degree m-1 for m>0. For rational functions use uj=-log|fj|, with ∂uj=-½dlog fj and bar∂uj=-½dbarlog fj. Define Wm=Tm(y1/x1,…,ym/xm) and Gm=Tm(z1/z0,…,zm/z0).

Direct prerequisites: mathlib:ExteriorAlgebra, mathlib:ExteriorAlgebra.ι_sq_zero, mathlib:ExteriorAlgebra.ι_add_mul_swap, Polylogarithms:P.5/bft-current-dictionary, mathlib:ExteriorAlgebra.map.

Construction or proof route:

1. Construct the finite alternating sum with a fixed bracketing and factorial denominator.
2. Use the Dolbeault type projections supplied by M.8 to check membership in D^m(A,m).
3. Substitute the negative logarithms for rational functions; place W and G on the indicated projective ambient spaces away from their divisors.

API:

- **WangForm.coefficients** (data): The pointwise finite polynomial takes real u-values and holomorphic/antiholomorphic degree-one components, with exactly (-2)^m/(2m!) and signs (-1)^i.
- **WangForm.one** (simp): T1(u)=u; for f this is -log|f|.
- **WangForm.two** (simp): T2(u,v)=u(∂v-bar∂v)-v(∂u-bar∂u).
- **WangForm.alternating** (relation): Permuting inputs multiplies Tm by the permutation sign.
- **WangForm.pullback** (functoriality): Pullback by a Dolbeault-algebra morphism commutes with Tm, Wm and Gm.
- **WangForm.unit_function** (simp): For m>0, Tm(f1,…,1,…,fm)=0.

Unit tests:

- **WangForm.test_one** (computation): T1 with u=3 and zero derivatives is 3, rather than -3 or 6.
- **WangForm.test_two** (computation): For u=1,v=0, ∂u=bar∂u=bar∂v=0 and ∂v=a, the pointwise T2 is the degree-one form a.
- **WangForm.test_zero** (degenerate): T0=1; a tuple containing the zero jet (the logarithmic jet of the constant function 1) gives zero for m>0.

Uses: BFT Proposition 5.3 — The finite formula yields the Deligne differential and comparison with alternating iterated products. BFT §6 — Wm defines Pc and Gm defines Ps.

Acceptance: Use unaveraged Alt; inserting a second factorial changes T2.

Sources: [BFT](https://arxiv.org/pdf/0909.5296v1), §5.1, equations (5.1)–(5.2), p. 8; equations (5.22),(5.25), pp. 14–15.

#### The Wang form differential

**wangDifferential** · theorem · Polylogarithms:P.5/wang-differential

For u_j∈D¹(A,1), Tm is (1/m!) times the alternating right-nested Deligne product uσ1•(uσ2•…•uσm), and d_D Tm=Σ_(j=1)^m(-1)^(j-1)d_Duj•T_(m-1)(u1,…,omit uj,…,um). The nesting is retained: the Deligne product is associative up to homotopy rather than strictly associative.

Direct prerequisites: Polylogarithms:P.5/wang-forms.

Construction or proof route:

1. Differentiate each S_m^i into its ∂ and bar∂ components; adjacent pure-type terms cancel in the signed sum.
2. Collect the remaining mixed terms with the stated index sign and factorial.
3. For the iterated-product identity determine its alternating coefficients using the highest Hodge component; this is the induction of BFT Proposition 5.3.

Acceptance: At m=1 the formula reads d_DT1=d_Du1. Do not flatten the iterated product using a nonexistent strict associativity law.

Sources: [BFT](https://arxiv.org/pdf/0909.5296v1), Proposition 5.3 and proof, pp. 8–10.

#### Comparison with the parent logarithmic r forms

**rWangComparison** · comparison · Polylogarithms:P.5/r-wang-comparison

For nonzero rational functions f1,…,fm, Tm(-log|f1|,…,-log|fm|)=(-1)^m r_(m-1)(f1,…,fm), where the parent r-form uses unaveraged Alt and coefficients 1/((2j+1)!(m-2j-1)!). Equality is of the off-divisor forms and of their locally integrable extension currents. In particular T1=-r0, T2=r1=iη, and T3=-r2.

Direct prerequisites: Polylogarithms:P.5/wang-forms, Polylogarithms:P.5/r-form, Polylogarithms:P.5/r-forms-and-distributions.

Construction or proof route:

1. Expand dlog f into dlog|f|+i darg f and its conjugate in the S terms.
2. Use the binomial identity from BFT proof of Theorem 5.13 to collect terms of matching parity.
3. Compare factorials with the parent coefficients; equality of L1 forms gives equality of their currents.

Acceptance: T2(z,c)=-i log|c|darg z; the sign is tested before using a residue identity.

Sources: [BFT](https://arxiv.org/pdf/0909.5296v1), Definition 5.10 and Theorem 5.13, pp. 11–13.

#### Boundary identities for Wang currents

**wangBoundaryCurrents** · theorem · Polylogarithms:P.5/wang-boundary-currents

For rational functions on a smooth projective complex variety, in the BFT normalisation d_D[Tm]=-[T_(m-1)]∘Res, with the exterior residue placing the uniformiser first and T0=1. On (P¹)^m this gives d_D[Wm]=Σ_(i=1)^mΣ_(j=0,1)(-1)^(i+j)(δ_i^j)*[W_(m-1)], with j=0 the zero face and j=1 the infinity face. For Gm on P^m, d_D[Gm]=Σ_(i=0)^m(-1)^i(∂i)*[G_(m-1)]. The restriction of Wm to a holomorphic map factoring through any ratio-one boundary is zero.

Direct prerequisites: Polylogarithms:P.5/wang-differential, Polylogarithms:P.5/poincare-lelong, Polylogarithms:P.5/r-wang-comparison, AlgebraicModuliForArithmeticGeometry:R09.7, Polylogarithms:P.3/exterior-residue.

Construction or proof route:

1. For normal-crossings divisors compute the logarithmic current residue using Poincaré–Lelong and the Wang differential.
2. Reduce arbitrary divisors by embedded resolution and proper pushforward, using the parent convergence theorem.
3. Compute the exterior residues of the cube coordinate wedge and the simplex ratios explicitly; ratio-one vanishing follows since the full jet of log 1 is zero.

Acceptance: For m=1, d_D[-log|z|]=-δ0+δ∞. This theorem is in the BFT d_D convention; it does not silently settle the parent’s ordinary-d general sign gap E21.

Sources: [BFT](https://arxiv.org/pdf/0909.5296v1), Proposition 5.16 equation (5.21), Theorems 5.23,5.26 and Proposition 5.24, pp. 14–15.

#### The cubical logarithmic regulator

**CubicalRegulator** · construction · Polylogarithms:P.5/cubical-regulator

For smooth projective complex X and an admissible integral codimension-p cycle Z in X×□^m, □=P¹\{1}, let Zbar be its projective closure and ι:Ztilde→X×(P¹)^m a resolution. Define Pc(Z)=πX*ι*[Tm of the restricted coordinate functions]=πX*(δZ∧Wm) in τ≤2p D_D^(2p-m)(X,p), with the BFT current twists. The product notation is defined through resolution and integration, not by an arbitrary current product. Extend linearly on the M.4 normalised cube complex ∩ker(infinity faces), with differential δ=Σ_i(-1)^i zero-face_i. Pc is independent of resolution and is a chain map.

Direct prerequisites: MotivicEtaleKTheory:M.4, Polylogarithms:P.5/wang-boundary-currents, Polylogarithms:P.5/analytic-cycle-current, Polylogarithms:P.5/r-forms-and-distributions.

Construction or proof route:

1. Proper face intersection makes every restricted coordinate function nonzero at the generic point of Z.
2. Use the parent convergence theorem on a common resolution and BFT normalised pushforward to define the current.
3. Apply the Wang boundary identity and proper pushforward; infinity-face terms vanish on the normalised complex.

API:

- **CubicalRegulator.cycle** (constructor): An admissible generator maps to πX* of its resolved Wang current.
- **CubicalRegulator.resolution** (compatibility): Different resolutions give the same current.
- **CubicalRegulator.boundary** (characterisation): d_D Pc(Z)=Pc(δZ) on the normalised complex.
- **CubicalRegulator.zero_degree** (simp): Pc at m=0 is the BFT cycle current.

Unit tests:

- **CubicalRegulator.point** (computation): For a point on a complex curve in m=0 the image is its Dirac current.
- **CubicalRegulator.P1_unit** (computation): For the degree-one point t=a of □ with a≠0,1,∞ and X a point, Pc(a)=-log|a|.
- **CubicalRegulator.face_excluded** (non-example): A component lying in t=0 is not an admissible input; assigning log 0 to it is not a regulator extension.

Uses: BFT Theorems 6.10–6.11 — The cubical map is compared with the support-complex regulator. BFT Lemma 6.17 — The mixed map restricts to Pc.

Acceptance: At m=0 the regulator is exactly δZ.

Sources: [BFT](https://arxiv.org/pdf/0909.5296v1), §6.2, equation (6.3) and Lemma 6.4, pp. 16–17.

#### The support complex for the regulator comparison

**BFTAuxiliary.Degree** · construction · Polylogarithms:P.5/bft-auxiliary-complex

With M.8 logarithmic Deligne complexes and M.4 admissible cube supports, form DA^(r,-m)=τ≤2p Dlog^r(X×□^m,p), take infinity-face normalisation, and totalise with d_D+(-1)^rδ. Let DA_Z be the corresponding support cone s(Dlog(X×□^m)→Dlog((X×□^m)\Z)), and Hp_m its top support cohomology H_D,Z^(2p). Use the standard maps g1:DA_Z^(2p-*)→Hp_* and ρ:DA_Z→DA. Fix cochain grading: DA_H^q=DA_Z^(q+1)⊕Hp^q⊕DA^q. Define DA_H as the shifted simple of Hp←g1 DA_Z→ρ DA: d(a1,a2,a3)=(-da1, da2+g1a1, da3-ρa1). Its maps are β(α)=(0,0,α) and the cycle map z↦(0,cl(z),0).

Direct prerequisites: MotivicEtaleKTheory:M.4, mathlib:CochainComplex.mappingCone, Polylogarithms:P.5/bft-current-dictionary.

Construction or proof route:

1. Import Deligne support cone, purity and homotopy invariance from the early M.8 contract.
2. Construct normalisation and total complexes over the M.4 supports; identify top support classes with cycles tensored with R by purity.
3. Assemble the shifted simple with the displayed signs; g1 is a quasi-isomorphism by the truncation/purity contract, so β is one too.
4. Correct the first-coordinate degree and cycle insertion in the preprint §4.8; in this fixed order the support complex is first, cycles second and base forms third. The theorem-6.10 display is translated from its cycle-first notation.

API:

- **BFTAuxiliary.differential** (data): The three-coordinate differential is exactly the one in the statement.
- **BFTAuxiliary.beta** (constructor): β includes DA as the third coordinate and is a quasi-isomorphism.
- **BFTAuxiliary.cycle** (constructor): In the fixed (support,cycle,base) order, a cycle z maps to (0,cl(z),0).
- **BFTAuxiliary.purity** (compatibility): Top support Deligne cohomology is the admissible cycle group tensored with R; g1 is the induced top-class projection.

Unit tests:

- **BFTAuxiliary.beta_sign** (computation): d(0,0,α)=(0,0,dα), so β is a cochain map.
- **BFTAuxiliary.square** (characterisation): For chain maps g1 and ρ, the displayed differential squares to zero on each of the three summands.
- **BFTAuxiliary.point_top** (compatibility): For X a point and p=m=0, the top support cycle class is R and sends the integral generator to 1.

Uses: BFT §6.3 — The three summands are precisely the inputs to the chain comparison ψ.

Acceptance: Changing either minus sign in the simple differential can violate d²=0.

Sources: [BFT](https://arxiv.org/pdf/0909.5296v1), §4, Proposition 4.3 and equations (4.4),(4.8), pp. 6–8.

#### Integration against Wang forms

**WangIntegration** · construction · Polylogarithms:P.5/integration-comparison

For DA^(r,-m), define φ(α)=πX*[α•Wm] in Deligne degree r-m. The product has ordinary degree r+m-1 before projection and uses the M.8 fixed Deligne product. On the infinity-face normalised DA complex this lands in smooth τ≤2p D(X,p), is a cochain map and a quasi-inverse of the base inclusion τD(X,p)→DA(X,p)_0.

Direct prerequisites: Polylogarithms:P.5/wang-boundary-currents, Polylogarithms:P.5/bft-auxiliary-complex, Polylogarithms:P.5/logarithmic-current-estimate.

Construction or proof route:

1. Combine local logarithmic integrability with the ratio-one vanishing of Wm to control the compactification boundary.
2. Prove d_D[α•Wm]=[d_Dα•Wm]+(-1)^rΣ_i,j(-1)^(i+j)(δ_i^j)*[(δ_i^j)*α•W_(m-1)].
3. Push forward to match the total differential; on normalised inputs the resulting current is smooth. The composition with the base inclusion is identity, and base inclusion is a quasi-isomorphism by M.8 homotopy invariance.

API:

- **WangIntegration.apply** (data): φ(α)=πX*[α•Wm].
- **WangIntegration.chain** (characterisation): φ commutes with the total d_D+(-1)^rδ differential.
- **WangIntegration.base** (simp): At m=0, φ is the normalised smooth-form inclusion into currents.
- **WangIntegration.inverse** (equivalence): On cohomology φ is inverse to base inclusion.

Unit tests:

- **WangIntegration.base_test** (compatibility): φ at m=0 has current evaluation (2πi)^(-dim X)∫ω∧α.
- **WangIntegration.zero** (degenerate): φ(0)=0 in every bidegree.
- **WangIntegration.degree** (characterisation): An input of bidegree (r,-m) has output Deligne degree r-m, not r+m.

Uses: BFT Theorem 6.10 — The third component of ψ and the β comparison square.

Acceptance: The normalisation condition is used for smooth landing.

Sources: [BFT](https://arxiv.org/pdf/0909.5296v1), Theorem 6.5(1)–(4), p. 17.

#### The Green form and Wang current product identity

**greenWangProduct** · theorem · Polylogarithms:P.5/green-wang-product

For a normalised support representative (ω,g) of degree r over X×□^m, the form g•Wm is locally L1. At r=2p, if cl(ω,g)=cl(z), d_D[g•Wm]=[ω•Wm]-δz•Wm-[δg•W_(m-1)]. At r<2p, d_D[g•Wm]=[d_Dg•Wm]+(-1)^(r-1)[δg•W_(m-1)]. Face sums in δ use the normalised cube differential and support changes. The expression δz•Wm is the resolved cycle current of Pc.

Direct prerequisites: Polylogarithms:P.5/logarithmic-current-estimate, Polylogarithms:P.5/green-current-comparison, Polylogarithms:P.5/integration-comparison, Polylogarithms:P.5/cubical-regulator.

Construction or proof route:

1. Choose basic Green representatives on a resolution simultaneously adapted to the cycle and cube boundary.
2. Use the local radial estimates and ratio-one vanishing to obtain L1 products.
3. Apply the basic Green residue computation; the top degree contributes the cycle current, while residues vanish in lower degrees. Combine the graded Leibniz sign with the Wang face identity.

Acceptance: At m=0 and r=2p this reduces to d_D[g]+δz=[ω]. The minus cycle term and the lower-degree parity cannot be omitted.

Sources: [BFT](https://arxiv.org/pdf/0909.5296v1), Equation (6.6), Propositions 6.7 and 6.9, pp. 18–19; [BUR](https://www.icmat.es/miembros/burgos/files/tesis.pdf), Chapter II §3 and proof of Theorem 4.3, pp. 73–82.

#### The regulator chain comparison

**RegulatorComparison.apply** · construction · Polylogarithms:P.5/regulator-homotopy

On DA_H^(2p-*) define ψ((ω,g),z,α)=Pc(z)-πX*[g•Wm]+φ(α), in the fixed (support,cycle,base) coordinate order, with the bidegree of the support representative specifying m. This is a cochain map to τD_D^(2p-*) and satisfies ψ∘cycle=Pc and ψ∘β=φ. Thus Pc and the Burgos–Feliu support regulator agree on higher Chow homology through the common support complex.

Direct prerequisites: Polylogarithms:P.5/bft-auxiliary-complex, Polylogarithms:P.5/integration-comparison, Polylogarithms:P.5/green-wang-product.

Construction or proof route:

1. Define each summand with the same Tate twists and target grading.
2. Substitute the auxiliary differential and the two Green product identities; all support and face terms cancel.
3. Restrict to the first and third summands to obtain the commuting square. β and φ induce isomorphisms, so the square compares the regulators on homology.

API:

- **RegulatorComparison.apply** (data): ψ is Pc minus the Green integral plus φ, with the specified grading.
- **RegulatorComparison.chain** (characterisation): ψ commutes with the three-coordinate differential.
- **RegulatorComparison.cycle** (simp): ψ(0,z,0)=Pc(z) in the fixed (support,cycle,base) order.
- **RegulatorComparison.beta** (simp): ψ(0,0,α)=φ(α).

Unit tests:

- **RegulatorComparison.first** (compatibility): On a pure cycle the comparison gives Pc.
- **RegulatorComparison.third** (compatibility): On a pure third-coordinate form the comparison gives φ.
- **RegulatorComparison.middle_sign** (computation): On ((ω,g),0,0) in the fixed coordinate order the value is -πX*[g•Wm], rather than its positive.

Uses: BFT Theorem 6.11 — Identifies Pc with the Burgos–Feliu regulator.

Acceptance: The correction term is negative.

Sources: [BFT](https://arxiv.org/pdf/0909.5296v1), Theorem 6.10, pp. 18–19.

#### The cubical regulator agrees with the universal regulator

**cubicalBeilinson** · comparison · Polylogarithms:P.5/cubical-beilinson

For smooth projective complex X and p,n≥0, Pc:CH_c^p(X,n)→H_D^(2p-n)(X,R(p)) agrees with the Burgos–Feliu support regulator. After the M.6 rational Chern character K_n(X)_Q≅⊕pCH^p(X,n)_Q and the M.8 universal Chern normalisation, its direct sum is Beilinson’s regulator. This does not redefine the universal Chern classes in P.5.

Direct prerequisites: Polylogarithms:P.5/regulator-homotopy, MotivicEtaleKTheory:M.6.

Construction or proof route:

1. Use the commuting ψ/β/φ square to identify Pc with the support regulator.
2. Import the precise Burgos–Feliu/universal Chern character comparison requested from early M.8, matching its ch_p,n convention with the M.6 eigenspaces.
3. Compose with the rational higher-Chow Chern character.

Acceptance: The m=0 case is the normalised cycle-class map, not a freely rescaled one. For a∈C* with a≠1, Pc([a])=-log|a| while the chosen universal Deligne unit is +log|a|. The M.6 K1-to-cycle character must therefore provide the compensating sign (−[a], equivalently the inverse-point class); do not assert unit agreement before that convention is exported.

Sources: [BFT](https://arxiv.org/pdf/0909.5296v1), Theorem 6.11, p. 19, with Theorem 4.7, p. 7.

#### Mixed Wang forms

**MixedWangForm.apply** · construction · Polylogarithms:P.5/mixed-wang-forms

On (P¹)^n×P^m define M_(n,m)=T_(n+m)(y1/x1,…,yn/xn,z1/z0,…,zm/z0), with M_(0,0)=1. Its current differential is the sum of cubical face currents with signs (-1)^(i+j) and simplicial face currents with signs (-1)^(n+i). It restricts to Wn when m=0 and to Gm when n=0. It vanishes on every ratio-one cubical boundary.

Direct prerequisites: Polylogarithms:P.5/wang-forms, Polylogarithms:P.5/wang-boundary-currents, mathlib:Fin.append.

Construction or proof route:

1. Insert both ordered coordinate tuples in the same alternating polynomial.
2. Compute residues with the cube variables placed first; a simplex residue crosses n variables and gains (-1)^n.
3. Apply resolution, local integrability and the unit-jet vanishing already proved for T.

API:

- **MixedWangForm.apply** (data): The form is T on the ordered concatenation of cube and simplex ratios.
- **MixedWangForm.cube** (simp): M_(n,0)=Wn.
- **MixedWangForm.simplex** (simp): M_(0,m)=Gm.
- **MixedWangForm.boundary** (characterisation): d_D[M_(n,m)] has the cube signs (-1)^(i+j) and simplex signs (-1)^(n+i).

Unit tests:

- **MixedWangForm.origin** (degenerate): M_(0,0)=1.
- **MixedWangForm.one_each** (computation): M_(1,1) equals T2 of the two coordinate logarithmic jets, with coefficient one in the explicit T2 formula.
- **MixedWangForm.ratio_one** (non-example): The restriction to y1/x1=1 is zero, whereas evaluation at a nonconstant ratio need not vanish.

Uses: BFT Section 6.4 — Defines the common regulator comparing simplex and cube complexes.

Acceptance: At (n,m)=(1,1) the simplex differential has the negative total-complex sign.

Sources: [BFT](https://arxiv.org/pdf/0909.5296v1), Section 6.4, equations (6.13)–(6.14), p. 20.

#### The mixed cycle regulator

**MixedRegulator** · construction · Polylogarithms:P.5/mixed-regulator

For the M.4 admissible mixed codimension-p cycle complex on X×□^n×Δ^m, use Δ^m=P^m minus {Σ_(i=0)^m zi=0}. Define Pcs(Z)=πX*(δZ∧M_(n,m)) through projective closure and resolution, in Deligne degree 2p-n-m. The mixed total boundary is δ+(-1)^n∂. The map is a chain map and restricts along the M.4 cubical and simplicial inclusions ic,is to Pc and Ps. To identify the parent simplex convention Σ_(i=1)^m zi=z0 use z0↦-z0; constant factors -1 do not change logarithmic jets.

Direct prerequisites: Polylogarithms:P.5/mixed-wang-forms, Polylogarithms:P.5/cubical-regulator, MotivicEtaleKTheory:M.4, Polylogarithms:P.5/regulator-map-on-higher-chow.

Construction or proof route:

1. Use the existing admissibility and resolution construction, now for both sets of faces.
2. Push forward the mixed current boundary identity; the simplex term acquires precisely the totalisation sign.
3. Restrict to n=0 and m=0 and compare simplex hyperplane conventions by the stated projective automorphism. Correct BFT preprint equation (6.15) to degree 2p-n-m.

API:

- **MixedRegulator.cycle** (constructor): An admissible mixed generator maps to its resolved M current pushed to X.
- **MixedRegulator.degree** (data): Bidegree (n,m) maps to Deligne degree 2p-n-m.
- **MixedRegulator.chain** (characterisation): d_D Pcs=Pcs(δ+(-1)^n∂).
- **MixedRegulator.restrict** (compatibility): Pcs∘ic=Pc and Pcs∘is=Ps in the same BFT model.

Unit tests:

- **MixedRegulator.axes** (compatibility): At (n,0) the map equals Pc, and at (0,m) it equals Ps.
- **MixedRegulator.degree_test** (computation): For p=2,n=1,m=1 the target degree is 2, rather than 3.
- **MixedRegulator.origin** (degenerate): At (0,0) an admissible cycle maps to δZ.

Uses: BFT Theorem 6.18 — Transfers the cubical universal-regulator comparison to the simplicial regulator.

Acceptance: The projective projection has relative complex dimension n+m; neither index may be dropped from the output degree.

Sources: [BFT](https://arxiv.org/pdf/0909.5296v1), Section 6.4, equation (6.15), Proposition 6.16 and Lemma 6.17, pp. 20–21.

#### Simplicial and cubical regulators agree

**simplicialCubicalComparison** · comparison · Polylogarithms:P.5/simplicial-cubical-comparison

For smooth projective complex X, the M.4 mixed-cycle inclusions is and ic are quasi-isomorphisms and identify the homology maps of Ps and Pc through Pcs. The simplicial regulator is the parent Goncharov cycle formula evaluated in the BFT normalised current model. The additional degreewise conversion from the parent raw G05 model is a separate recorded gap.

Direct prerequisites: Polylogarithms:P.5/mixed-regulator, MotivicEtaleKTheory:M.4.

Construction or proof route:

1. Import the exact two mixed-inclusion quasi-isomorphisms, Levine’s comparison as stated in BFT Proposition 6.12.
2. Use the two chain-level restriction equalities from Lemma 6.17.
3. Invert their homology isomorphisms to compare the regulators; retain the parent raw-model conversion as an explicit obligation.

Acceptance: The comparison uses inverse homology maps; a simplex cycle is not by definition a cube cycle.

Sources: [BFT](https://arxiv.org/pdf/0909.5296v1), Proposition 6.12, p. 20; Lemma 6.17, p. 21.

#### The simplicial regulator agrees with Beilinson’s regulator

**beilinsonComparisonAssembly** · application · Polylogarithms:P.5/beilinson-comparison-assembly

For every smooth projective complex variety X and n≥0, the direct sum of the BFT-normalised simplicial regulators CH_s^p(X,n)_Q→H_D^(2p-n)(X,R(p)), composed with the M.6 rational higher Chern character K_n(X)_Q→⊕pCH_s^p(X,n)_Q, equals the M.8 universal Beilinson regulator. This is the precise content and hypothesis range of BFT Theorem 6.18. Identification with every raw parent convention is conditional on the recorded model-conversion gap.

Direct prerequisites: Polylogarithms:P.5/simplicial-cubical-comparison, Polylogarithms:P.5/cubical-beilinson, MotivicEtaleKTheory:M.6, Polylogarithms:P.5/regulator-induces-beilinson.

Construction or proof route:

1. Follow Pc through the auxiliary-complex comparison ψ and the Burgos–Feliu/universal input.
2. Transfer the resulting equality along the mixed cycle quasi-isomorphisms.
3. Compose with the common rational Chern character and keep the parent ordinary-d sign conversion separate.

Acceptance: No extension to arbitrary singular or nonproper X is inferred from this theorem.

Sources: [BFT](https://arxiv.org/pdf/0909.5296v1), Theorem 6.18 and proof, p. 21.

### Curve symbols and the elliptic weight-three expression

#### Curve symbols and the Chern regulator

**curveSymbolChernComparison** · comparison · Polylogarithms:P.5/curve-symbol-chern-comparison

For a smooth projective geometrically integral curve X over C and a rational K2 class represented by Σj{fj,gj} with vanishing tame symbols in κ(x)*⊗Q, its weight-two real Deligne regulator is represented by iΣjη(fj,gj), η(f,g)=log|f|darg g-log|g|darg f, in the M.8 differential-form model. With ch_(i,j)=(-1)^(j-1)c_(i,j)/(j-1)!, ch_(2,2)=-c_(2,2); multiplicativity and the Chern product coefficient -1 give the positive unit cup product. This fixes the general curve formula once, without adding the elliptic embedding, period or rational-orientation choices owned by ER.2.

Direct prerequisites: Polylogarithms:P.5/weight-two-regulator-form, Polylogarithms:P.5/unramified-weight-two-class, K2SymbolsBrauer:T.3/tame-symbol.

Construction or proof route:

1. Request units, Deligne cup products, Chern-character normalisation and localization from early M.8.
2. Insert unit representatives log|f|,log|g| in equation (7.3.2); π1(dlog f)=i darg f gives iη.
3. Use the tame-symbol kernel and localization to extend the generic-point class to X; the cup-product computation alone is not a K2-lift criterion.

Acceptance: For f=z and g=c>1 real the period around zero is -2πi log c. Unit-modulus tame symbols make η closed as a current but do not imply rational unramified K2 membership. No Deligne carrier or universal Chern class is defined in ER.2 or this node.

Sources: [NEK](https://math.stanford.edu/~conrad/BSDseminar/refs/BeilinsonintroII.pdf), Section 7.3 equation (7.3.2), Section 7.4 equation (7.4.1), p. 23; [SCH](https://ncatlab.org/nlab/files/SchneiderBeilinsonConjectures.pdf), Section 4, p. 28, higher Chern character and product equation.

#### The weight-three formula descends to symbols

**weightThreeRelationDescent** · theorem · Polylogarithms:P.5/weight-three-relation-descent

On a smooth complex curve, the parent formula ρ2({f}2⊗g)=D(f)darg g-(1/3)α(1-f,f)log|g|, α(a,b)=log|a|dlog|b|-log|b|dlog|a|, is compatible with the B2 functional relations and is additive in g. Thus it defines the middle map of the imported weight-three curve polylogarithmic complex. Under the G00 convention Lhat2=iD and α_G00=-α, r3(2)=-ρ2. The neighbouring map is r3(1)=L3, whereas the parent diagonal relation is ρ2({f}2⊗f)=-dL3(f).

Direct prerequisites: Polylogarithms:P.3/weight-three-complex, Polylogarithms:P.5/weight-three-curve-regulator, Polylogarithms:P.1/bloch-wigner-dilogarithm, Polylogarithms:P.2/bloch-wigner-descent, Polylogarithms:P.1/bloch-wigner-five-term.

Construction or proof route:

1. Use the imported B2 relation quotient and the single-valued dilogarithm descent.
2. The relation boundary Σ(1-f)∧f=0 implies Σα(1-f,f)=0 because α is an alternating bilinear map on multiplicative functions; this handles the logarithmic correction.
3. Translate the explicit n=3 formula of G00 and check the diagonal exact form using the parent trilogarithm differential.

Acceptance: A formal sum relation in B2 maps to zero even when individual logarithmic correction terms are nonzero. Do not compare formulas without translating the definition of α.

Sources: [G00](https://arxiv.org/pdf/math/0003086), Section 2, n=3 formulas, pp. 5–6; Theorem 2.5(i) proof, p. 20.

#### The weight-three curve regulator and K4

**weightThreeMotivicComparison** · comparison · Polylogarithms:P.5/weight-three-motivic-comparison

Let X be a smooth projective geometrically integral curve over a number field F. The imported rational map c_(2,3):K4(F(X))_Q→H²Γ(F(X),3)_Q is compatible with Quillen residues K3(κ(x))_Q→H¹Γ(κ(x),2)_Q and with the real Deligne regulator. The resulting unramified class from K4(X)_Q has the curve regulator represented by r3(2)=-ρ2 in the D96 convention. The diagram is a compatibility statement, not an isomorphism on K4. The generic-field construction remains subject to the imported P.3 proof gap.

Direct prerequisites: Polylogarithms:P.3/k-theory-comparison-weight-three, Polylogarithms:P.5/weight-three-relation-descent, SchemeKTheoryOperations:S.4/coniveau-residue-differential, BorelRegulators:R.4/regulator-real-isomorphism.

Construction or proof route:

1. Import the P.3 map and its unresolved construction proof without duplicating it.
2. Apply D96 Theorem 2.1 only over a number field; its residue fields are finite extensions of F.
3. Use the M.8 universal regulator comparison and number-field Borel injectivity to obtain the residue compatibility of D96 §3.7; request the exact input rather than extending it to all fields.

Acceptance: The proof does not show injectivity of a Borel regulator for arbitrary residue fields. No full complex-level transfer is inferred from the map on K4.

Sources: [D96](https://arxiv.org/pdf/alg-geom/9512016v2), Theorem 2.1, pp. 5–6; Section 3.7, pp. 22–23.

#### Generalized Eisenstein–Kronecker series

**EllipticTrilog.kernel** · definition · Polylogarithms:P.5/generalized-elliptic-trilogarithm

Let Λ=Zu+Zv⊂C with A=Im(conj(u)v)>0 and E(C)=C/Λ. For γ∈Λ set χγ(z)=exp(2πi Im(z conjγ)/A). Define K3(x,y,z)=Σ′_(γ1+γ2+γ3=0) χγ1(x)χγ2(y)χγ3(z)(conjγ3-conjγ2)/(|γ1|²|γ2|²|γ3|²), excluding each zero γ. Equivalently sum over two independent Z² indices with γ3=-γ1-γ2. The sum is absolutely convergent and descends to E³. Extend separately linearly to finite integral divisors in each argument. This three-point weight-three kernel is the generalized elliptic trilogarithmic series in D96, not a one-variable weight-two series.

Direct prerequisites: mathlib:Complex.exp_add, mathlib:IsZLattice, mathlib:Multipliable.

Construction or proof route:

1. Construct the oriented lattice character with the actual area A, and prove it is periodic in z modulo Λ.
2. Define the explicit two-index summand, zeroing the excluded indices. Prove absolute convergence by the separate summability theorem before using rearrangements.
3. Extend to divisors by finite sums and show independence of lifts using character periodicity.

API:

- **EllipticTrilog.kernel** (constructor): The explicit absolutely convergent two-index sum defines K3.
- **EllipticTrilog.periodic** (functoriality): Adding a lattice element to any argument leaves K3 unchanged.
- **EllipticTrilog.translation** (relation): K3(x+a,y+a,z+a)=K3(x,y,z).
- **EllipticTrilog.antisymmetric** (relation): K3(x,z,y)=-K3(x,y,z), hence K3(x,y,y)=0.
- **EllipticTrilog.divisors** (constructor): Finite integral divisors are evaluated by the trilinear finite sum.
- **EllipticTrilog.scale** (compatibility): Scaling Λ,x,y,z by λ≠0 multiplies K3 by conjλ/|λ|⁶.

Unit tests:

- **EllipticTrilog.diagonal** (degenerate): K3(x,y,y)=0, by exchanging the second and third summation variables.
- **EllipticTrilog.zero_divisor** (computation): Evaluation on a zero divisor is zero in every slot.
- **EllipticTrilog.scaling_test** (compatibility): For a positive real scale 2, K3_(2Λ)(2x,2y,2z)=K3_Λ(x,y,z)/32; a weight-two single-index kernel has the wrong exponent.

Uses: D96 Theorem 3.4 — The divisor evaluation is the elliptic Fourier expression for the weight-three regulator pairing. Polylogarithms:P.6 — Supplies an explicit regulator expression, without asserting an L-value formula in P.5.

Acceptance: Reversing the lattice orientation without changing the character convention changes the formula.

Sources: [D96](https://arxiv.org/pdf/alg-geom/9512016v2), Section 1.2, definition (1), printed p.1, specialised to n=3.

#### Absolute convergence of the elliptic trilogarithmic series

**EllipticTrilog.absoluteSummability** · theorem · Polylogarithms:P.5/elliptic-trilogarithm-summability

For every oriented full lattice Λ in C, the absolute values of the K3 summands over (γ1,γ2)∈Λ² with γ1γ2(γ1+γ2)≠0 are summable, uniformly in x,y,z because all characters have modulus one. Consequently the divisor sum, index permutations, lattice-lift invariance and the scaling identity may be evaluated by absolutely convergent rearrangement.

Direct prerequisites: Polylogarithms:P.5/generalized-elliptic-trilogarithm, mathlib:IsZLattice, mathlib:Multipliable.

Construction or proof route:

1. Use lattice discreteness and the O(R²) point count in discs, reducing norm estimates to Z².
2. Split dyadic blocks by the largest and smallest of |γ1|,|γ2|,|γ3|. At least two are comparable to the largest scale R. The numerator is O(R); if the third scale is s≤R, each term is O(R^(-3)s^(-2)), while the block has O(R²s²) pairs.
3. Sum O(R^(-1)) over the dyadic largest scales and O(log R) possible smaller scales; the total is finite.

Acceptance: The exclusion γ1+γ2=0 is necessary; a zero denominator is not a summand.

Sources: [D96](https://arxiv.org/pdf/alg-geom/9512016v2), Section 1.2, definition (1), printed p.1.

#### The weight-three regulator pairing

**weightThreePairing** · theorem · Polylogarithms:P.5/weight-three-pairing

For a smooth projective complex curve X, nonzero meromorphic f,1-f,g and a holomorphic or antiholomorphic one-form ω, the locally integrable parent regulator satisfies ∫X ρ2({f}2⊗g)∧ω=-(4/3)∫X log|g|α(1-f,f)∧ω. For r3(2)=-ρ2 the scalar is +4/3. The identities hold termwise, without requiring Σ(1-f)∧f∧g=0; that condition enters the subsequent divisor-only Fourier formula.

Direct prerequisites: Polylogarithms:P.5/weight-three-relation-descent, Polylogarithms:P.5/r-forms-and-distributions, Polylogarithms:P.1/bloch-wigner-differential.

Construction or proof route:

1. Apply the parent differential of D and the type identities darg g∧ω=i dlog|g|∧ω and dD(f)∧ω=-i α(1-f,f)∧ω for holomorphic ω.
2. Use Stokes after deleting small divisor discs; integrable logarithmic singularities make the boundary terms vanish. This gives ∫D(f)darg g∧ω=-∫log|g|α∧ω.
3. Add the -(1/3) correction. For antiholomorphic ω both type signs reverse, giving the same product and scalar.

Acceptance: Replacing ρ2 by r3(2) changes the scalar sign. The same scalar applies to holomorphic and antiholomorphic test forms.

Sources: [D96](https://arxiv.org/pdf/alg-geom/9512016v2), Theorem 3.3 and proof, equations (25)–(28), pp. 20–21.

#### The elliptic regulator formula

**ellipticFourierComparison** · theorem · Polylogarithms:P.5/elliptic-fourier-comparison

Let E=C/(Zu+Zv), A=Im(conj(u)v)>0, with positive complex orientation and dz the lifted holomorphic form. For a finite rational symbol cycle Σj{fj}2⊗gj with Σj(1-fj)∧fj∧gj=0 in Λ³(C(E)*⊗Q), put Dj=div gj, Fj=div fj, Hj=div(1-fj). In the explicit character and area convention of K3, the target comparison is Σj∫E log|gj|α(1-fj,fj)∧dbarz = iA³/(4π²) ΣjK3(Dj,Fj,Hj), and hence Σj∫Eρ2({fj}2⊗gj)∧dbarz = -iA³/(3π²)ΣjK3(Dj,Fj,Hj). The constants are derived using ordinary area, not copied from D96’s implicit normalization; rigorous Fourier regularisation and source collation are recorded proof gaps.

Direct prerequisites: Polylogarithms:P.5/generalized-elliptic-trilogarithm, Polylogarithms:P.5/elliptic-trilogarithm-summability, Polylogarithms:P.5/weight-three-pairing, Polylogarithms:P.5/poincare-lelong, ComplexComparisonPartII:C5.

Construction or proof route:

1. With probability area measure μ=dxdy/A, the mean-zero log|f| has coefficient -A div f(χ_-γ)/(2π|γ|²). Also ∂χγ=(π conjγ/A)χγ dz and dz∧dbarz=-2iAμ.
2. Apply these coefficients to the three factors; swapping the second and third arguments and then γ↦-γ produces the positive-character order (div g,div f,div(1-f)) and the displayed constant.
3. Use D96 §3.6 to cancel the constants of the logarithms: the symbol boundary-zero condition and exact dilogarithm differential eliminate each basis constant contribution.
4. Pass from regularised logarithms to currents and their integrals; supply domination near shared divisor points and compare against the source version of record. These two obligations remain explicit, rather than declaring the Fourier argument complete.

Acceptance: The mean constants cannot simply be set to zero separately without the summed symbol-cycle condition. Finite Fourier polynomials must reproduce the iA³/(4π²) scalar and argument order. This is a formula for an explicit regulator pairing; no modularity or elliptic L-value assertion is added.

Sources: [D96](https://arxiv.org/pdf/alg-geom/9512016v2), Theorem 3.4 and proof, equations (29)–(31), pp. 21–22.

## Parent imports and target coverage

The following thirty accepted parent declarations remain the suppliers of the existing stage targets. Their mathematical statements, APIs, tests and conjecture/theorem distinctions remain in the parent packet and [reader](Polylogarithms.md). The new inventory supplies missing foundations and comparisons without redeclaring them.

- Polylogarithms:P.5/curve-polylogarithmic-complex
- Polylogarithms:P.5/weight-two-regulator-form
- Polylogarithms:P.5/unramified-weight-two-class
- Polylogarithms:P.5/chow-dilogarithm
- Polylogarithms:P.5/strong-reciprocity-implies-suslin
- Polylogarithms:P.5/r-form
- Polylogarithms:P.5/r-forms-and-distributions
- Polylogarithms:P.5/residue-map
- Polylogarithms:P.5/r-form-differential
- Polylogarithms:P.5/simplex-form
- Polylogarithms:P.5/goncharov-deligne-complex
- Polylogarithms:P.5/goncharov-deligne-complex-comparison
- Polylogarithms:P.5/regulator-map-on-higher-chow
- Polylogarithms:P.5/regulator-map-chain-map
- Polylogarithms:P.5/regulator-map-real
- Polylogarithms:P.5/chow-polylogarithm-forms
- Polylogarithms:P.5/arakelov-motivic-complex
- Polylogarithms:P.5/higher-arakelov-chow-degree-zero
- Polylogarithms:P.5/regulator-induces-beilinson
- Polylogarithms:P.5/strong-reciprocity-conjecture
- Polylogarithms:P.5/reciprocity-second-triangle
- Polylogarithms:P.5/chow-dilogarithm-steinberg
- Polylogarithms:P.5/chow-dilogarithm-projective-line
- Polylogarithms:P.5/reciprocity-projective-line
- Polylogarithms:P.5/chow-dilogarithm-families
- Polylogarithms:P.5/reciprocity-algebraic-numbers
- Polylogarithms:P.5/chow-dilogarithm-on-elliptic-curves
- Polylogarithms:P.5/chow-dilogarithm-plane-curves
- Polylogarithms:P.5/weight-three-curve-regulator
- Polylogarithms:P.5/general-weight-reciprocity-conjecture

**Real Deligne–Beilinson complex.** Early M.8 request and gap; generic theory is not duplicated. New nodes: bft-current-dictionary, current-resolution.

**Currents and Poincaré–Lelong.** Mathlib chart baseline plus early C5 and R09.7 requests. New nodes: compact-test-forms, manifold-currents, analytic-cycle-current, current-resolution, poincare-lelong.

**Chow varieties.** R09.2 Part II and resolved-incidence gap. New nodes: admissible-chow-locus.

**Group (36) and Gersten comparison.** M.4 top-two graph request; current and resolution constructions above. New nodes: logarithmic-green-forms, logarithmic-current-estimate, green-current-comparison, green-presentation, gersten-green-assembly.

**Elliptic trilogarithm and weight-three curve expression.** Inherited P.3 comparison, number-field Borel input, torus Fourier interface and precise regularisation/collation gap. New nodes: weight-three-relation-descent, weight-three-motivic-comparison, generalized-elliptic-trilogarithm, elliptic-trilogarithm-summability, weight-three-pairing, elliptic-fourier-comparison.

**Proof route of BFT Theorem 6.18.** M.4 mixed inclusions, M.6 rational Chern character, early M.8 support/universal comparison; raw parent conversion remains a gap. New nodes: wang-forms, wang-differential, r-wang-comparison, wang-boundary-currents, cubical-regulator, bft-auxiliary-complex, integration-comparison, green-wang-product, regulator-homotopy, cubical-beilinson, mixed-wang-forms, mixed-regulator, simplicial-cubical-comparison, beilinson-comparison-assembly.

**Existing curve complexes, η, residues, Chow dilogarithm, reciprocity and real regulator targets.** Parent declarations imported unchanged with transfer, sign and integral rigidity gaps retained. General reciprocity remains a conjecture. New nodes: curve-symbol-chern-comparison.

## Supplier contracts and open proof work

**MotivicEtaleKTheory:M.8.** An accepted EARLY archimedean prefix, before the late Selmer/Iwasawa and R.7/D.2 comparisons: the cone R(p)_D for all p on smooth complex varieties and its real-conjugation descent; hypercohomology and its long exact sequences; logarithmic smooth/Dolbeault/current comparisons, products with fixed homotopy-associative representatives, support cones, purity and cube homotopy invariance; universal Chern classes and ch_(i,p)=(-1)^(p-1)c_(i,p)/(p-1)!, the unit log|f| and symbol cup formula, cycle classes, proper trace/norm with divisor and tame-residue compatibility. Include the precise Burgos–Feliu support-regulator equality with the universal Chern regulator used by BFT Theorem 4.7. This foundation is owned by M.8 once, not by ER.2 or P.5.

**ComplexComparisonPartII:C5.** ComplexComparisonPartII, Part II: an early smooth-manifold analytic interface for global real/complex differential forms, alternating type decomposition, exterior derivative, partitions of unity, smooth integration and Stokes with the support hypotheses; chart distributions and the test LF topology remain imported from Mathlib. For the elliptic Fourier target also supply characters/Fourier expansion on a compact real torus and the distributional logarithmic Green-function coefficients in the explicit measure convention. The proper algebraic de Rham–Betti comparison alone does not supply this interface.

**AlgebraicModuliForArithmeticGeometry:R09.2.** Algebraic moduli for arithmetic geometry, Part II: projective Chow parameter spaces over C for effective cycles of fixed degree and codimension, their incidence cycles and proper incidence projections, algebraicity of the proper-face-intersection open loci via fibre dimension, and face/vertex cycle maps on domains where dimensions are preserved. Hilbert and Quot schemes and Chow’s lemma do not by themselves give this contract.

**AlgebraicModuliForArithmeticGeometry:R09.7.** Embedded characteristic-zero resolution of an analytic cycle coming from an algebraic cycle in a smooth complex algebraic ambient variety, simultaneously adapted to its rational-function divisors and cube/simplex boundary, with properness, normal-crossings charts and common refinements. Use R09.7a–d’s existing scope, not an unrestricted analytic or mixed-characteristic resolution theorem.

**MotivicEtaleKTheory:M.4.** For smooth projective complex X, simplicial, infinity-face-normalised cubical and mixed Bloch cycle complexes with admissible supports, total boundary δ+(-1)^n∂, and BOTH mixed-inclusion quasi-isomorphisms (Levine 1994 Theorem 4.7, as used in BFT Proposition 6.12). Also the admissible graph map from the final Gersten terms Λ²k(Y)*→k(Y)*→Z^p(X), compatible with tame/divisor signs and inducing isomorphisms in its last TWO cohomology groups (ordinary CH^p and CH^p(X,1)); S.4’s ordinary Bloch formula supplies only the former. Import moving and localization rather than reconstructing cycle complexes in P.5.

**MotivicEtaleKTheory:M.6.** For smooth projective complex varieties and n≥0, the rational higher Chern character K_n(X)_Q≅⊕p CH^p(X,n)_Q with the Adams weight, products and localization normalizations, in both cycle models after M.4 comparison. It must use the same universal ch_(n,p) convention as the early M.8 archimedean regulator. In the chosen conventions Pc([a])=-log|a| but the universal unit regulator is +log|a|: export the compensating K1-to-cube character sign, hence the class −[a] (equivalently [a^-1] under the multiplicative cycle identification). This test is part of the contract, not an unchecked scalar agreement.

**BorelRegulators:R.4.** Export the j=2 number-field regulator injectivity on K3(F)_Q used in D96 Theorem 2.1, transporting the existing regulator-real-isomorphism from O_F to F through localization and the rational vanishing of positive even K-groups of finite residue fields. This is a number-field statement and does not require the exact late R.7 factor-two normalization.

**ComplexComparisonPartII:C0.** Import the existing analytification node with its tracked PR196 analytic-space gap. Supply the analytic closed-subspace and dimension interfaces, finite local ramified projection/mass estimates for pure analytic sets, and holomorphic charts needed for Demailly III §2.B–C. These are analytic-space foundations, not another construction of currents or Chow parameter spaces. No accepted PR196 stage id is invented.

**Early M.8 supplier not yet split.** All general Deligne carriers, support operations and universal-regulator inputs terminate at the exact request to M.8 above. Confirmed RT-AREA-ktheory-2/7 and /24 require an accepted early archimedean prefix before a dependency id can be used. Do not promote the request into an edge from the entire unsplit M.8.

**Global smooth analytic and torus Fourier interface.** Mathlib scalar test functions/distributions are chart objects. The early C5 Part II interface requested here must supply global differential forms and integration before global current operations, and distributional Fourier coefficients before the elliptic formula. Existing proper de Rham–Betti nodes are a near miss, not a replacement. Analytic subsets and finite local projections also rest on C0/repair-analytification and its tracked, unintegrated PR196 carrier; the eighth request names this exact boundary.

**Chow incidence carrier and singular-family Radon operation.** R09.2 Part II must construct the requested parameter spaces. The parent Radon transform also needs a resolved, locally integrable pull–push through singular incidence families; a generic incidence projection need not be a submersion, so the arbitrary-current pullback API cannot justify this step. Provide a family-specific resolved-form construction and its independence proof.

**Top-two Gersten/Bloch graph comparison.** The graph map and moving argument are specified by the M.4 request; an actual node proving isomorphism on CH^p(X,1) as well as ordinary CH^p is absent. S.4 divisor lengths, Gersten resolution and Bloch formula do not establish this stronger comparison by themselves.

**Inherited polylogarithmic complex transfers.** The accepted parent gap remains: no source read constructs full B(F,3) complex transfers. Λ³ of a field norm composed with restriction scales by degree cubed; it is not the desired degree-one transfer. D96’s K4 transfer is not a construction of this missing chain map.

**Parent ordinary residue sign and raw-model conversion.** The BFT model has been fixed explicitly, including Tm=(-1)^m r_(m-1), d_D=-2∂bar∂ at the top, and its dimension-dependent integration twists. The parent E21 ordinary-d sign issue remains to be reconciled in every degree and with G05’s (2πi)^(p-m) factors. Published G05 p.21 visibly uses bar∂∂; no missing-bar OCR allegation is made. Until the complete degreewise chain dictionary is checked, the raw-parent-to-universal comparison is conditional.

**Imported P.3 K4 comparison construction.** The P.3 map is imported by id with the parent’s unresolved proof/source decomposition. D96 Theorem 2.1 gives a number-field compatibility diagram and its §3.7 proof; it is not a proof of the generic-field map’s construction or an isomorphism on all K4.

**Elliptic Fourier regularisation and normalization collation.** The area/character convention and finite convolution determine the stated iA³/(4π²) scalar and -4/3 parent pairing factor. A rigorous approximation theorem controlling products near shared logarithmic poles and a comparison against the accessible version of record are still needed. The journal PDF was unavailable, and D96 v2 Theorem 3.4 has an impossible real-one integral convention; this pass records a target with proof obligations, not a completed analytic comparison.

**Inherited integral reciprocity carrier.** The accepted parent states the general conjecture rationally. Its integral Goncharov group through rigidity and Suslin rigidity supplier remain unresolved there. Preserve the proved P1/elliptic/algebraic-number cases and do not promote the general conjecture to a theorem.

## Source versions and corrections

**G05** — [Polylogarithms, regulators, and Arakelov motivic complexes](https://www.ams.org/journals/jams/2005-18-01/S0894-0347-04-00472-2/S0894-0347-04-00472-2.pdf), A. B. Goncharov. JAMS 18 (2005), 1–60; published PDF. Read: Section 2, pp. 9–22; Section 3, pp. 22–25; Section 6, pp. 45–56, compared with accepted parent nodes. SHA-256: 36de73ac0fbc242e52f858e20c7e22839b050bc65cab54426505b662f36617be.

**BFT** — [On Goncharov’s regulator and higher arithmetic Chow groups](https://arxiv.org/pdf/0909.5296v1), J. I. Burgos Gil, E. Feliu, Y. Takeda. arXiv:0909.5296v1; internal PDF date July 29, 2021. Read: Sections 1–7, complete 24-page text. SHA-256: 63155506c01244497f732d6d57cf78b979a18cbbe24cbca8fade1da99f359cd5.

**D96** — [Deninger’s conjecture on L-function of elliptic curves at s=3](https://arxiv.org/pdf/alg-geom/9512016v2), A. B. Goncharov. arXiv:alg-geom/9512016v2 (2 February 1996); regenerated PDF internal date November 5, 2018. Read: Section 1 definitions; Section 2 residue construction; Section 3 complete regulator and Fourier proof; appendix sign correction. SHA-256: 8e0798f9d67fbbd4ca14a2da386e130e8efb5785a5f01304ac3c268a6e0d3712.

**G00** — [Explicit regulator maps on polylogarithmic motivic complexes](https://arxiv.org/pdf/math/0003086), A. B. Goncharov. arXiv:math/0003086, public text. Read: Section 2, Theorem 2.2 and explicit n=3 formula; Section 3 construction; Section 4 pp. 17–22, differential calculation and descent proof of Theorem 2.5(i). SHA-256: 47a616bada4abeaee1672679593e5b69e6d293b2cf98e08de6b726072f9a69ea.

**DEM** — [Complex Analytic and Differential Geometry](https://www-fourier.univ-grenoble-alpes.fr/~demailly/manuscripts/agbook.pdf), Jean-Pierre Demailly. Public author manuscript, version served on 2026-10-06. Read: Chapter I §2, pp. 13–20; §3.E, pp. 28–29; Chapter III §2.B–C, pp. 140–144. SHA-256: d7c7654a7417e8322e5dcf8fe8ec818b4c1a18cf280b41f2df5a871b776d89a1.

**BUR** — [Anillos de Chow aritméticos](https://www.icmat.es/miembros/burgos/files/tesis.pdf), José Ignacio Burgos Gil. Universitat de Barcelona PhD thesis, 1994; public author PDF. Read: Chapter II §3 complete, pp. 72–78; §4.1–4.7, pp. 79–82; local basic-Green representative proof. SHA-256: 65a531b4ed7cc8d0f1318645aaa7003a0d685e65ae7706fc01249fdb3fe8457c.

**SCH** — [Introduction to the Beilinson conjectures](https://ncatlab.org/nlab/files/SchneiderBeilinsonConjectures.pdf), Peter Schneider. Beilinson’s Conjectures on Special Values of L-Functions, Perspectives in Mathematics 4 (1988), published chapter scan. Read: Section 4, pp. 27–29, higher Chern character and its product normalisation. SHA-256: 9693e4a34e8aa8d6c92899b2ba2ce9735615de4758d536d8dc25d9b20f9ea88b.

**NEK** — [Beilinson’s conjectures](https://math.stanford.edu/~conrad/BSDseminar/refs/BeilinsonintroII.pdf), Jan Nekovář. Public author copy, chapter §§7.3–7.4; printed page 23. Read: Sections 7.3–7.4, equations (7.3.1),(7.3.2),(7.4.1); not the erroneous degree-two display in §7.5. SHA-256: 3b6ba59cb8338b59fd8206318b2a91c3588ca09545522d6fb33717287924eacd.

The JAMS source is the published article. The BFT journal PDF refused access, and the Springer D96 request served an access page. Findings about those texts are scoped to the cited arXiv versions. The public Burgos thesis supplies the Green arguments; the original Duke article was not obtained. The manuscript’s theorem numbering differs from the Duke citation. The source-version records preserve these distinctions.

**Polylogarithms/E22** (misprint, affects nothing), arXiv:0909.5296v1, equation (6.15), printed p.20; published PDF unavailable (HTTP 403). The target Deligne degree is 2p−n−m. The cycle is in X×□^n×Δ^m, and projection integrates over both index directions. At p=2,n=m=1 the degree is 2. The next lemma uses total degree 2p−* and has both boundaries. Correction search: new (finding scoped to the arXiv v1 text; no claim about the inaccessible version of record).

**Polylogarithms/E23** (error, affects a stated result), arXiv:alg-geom/9512016v2, Theorem 3.4 and equation (31), pp.21–22; version of record not obtained. Fix a real positive area convention, such as (i/2)∫dz∧dbarz=A>0, and carry its A,π and i factors through the Fourier coefficient and pairing. In our convention the target constant is iA³/(4π²) in the displayed log/α pairing. For a nonzero holomorphic form on a complex curve, ∫ω∧ω̄ is purely imaginary, negative imaginary with the positive complex orientation, and cannot equal the positive real number 1. Rescaling a lattice changes the three-point kernel by conjλ/|λ|⁶, so omitting area factors also cannot define a scale-independent literal formula. Correction search: new (normalization issue in the accessible preprint; publisher collation is outstanding).

**Polylogarithms/E24** (misprint, affects nothing), Published JAMS 18 (2005), p.21, prose immediately following equation (38). Z is a codimension-n cycle, and Y is a codimension-(n−1) subvariety; f is a rational function on Y. The numerator uses n−1,n−1 currents and the principal relation has current bidegree n−1,n−1. The following Gersten graph description explicitly uses codimension n−1 for Y. For n=1, Y=X, not a divisor. Correction search: new.

**Polylogarithms/E25** (misprint, affects nothing), arXiv:0909.5296v1, §4 equation (4.8) and following cycle map, printed p.8, compared with Theorem 6.10 p.18; inspected the PDF image, not only extracted text. For the displayed differential in (support,cycle,base) order, the first coordinate has cochain degree 2p−n+1 and the cycle map is (0,f1(z),0). Equivalently reorder to (cycle,support,base) throughout and conjugate the differential by that permutation. Theorem 6.10 uses this reordered notation. In degree q, d of the cycle coordinate lies in Hp^(q+1), so g1(α1) must have that same degree; the printed q−1 cannot be added to it. Moreover f1(z) is an Hp class, not an element of the support-complex first coordinate. The typed graded differential in the suggested prototype checks the corrected degree. Correction search: new (scoped to the accessible arXiv v1 text).

## Baseline and prototype acceptance

The pinned commits are Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 and Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. Actual declaration statements were read before they were cited. The static declaration index omits the generated additive name Summable; the packet cites the actual Multipliable definition with its generated additive alias recorded, and the prototype elaborates Summable itself.

- **mathlib:TestFunction** (Mathlib/Analysis/Distribution/TestFunction.lean): Smooth maps with compact support contained in an open subset of a real normed space, equipped with the LF topology.
- **mathlib:TestFunction.ext** (Mathlib/Analysis/Distribution/TestFunction.lean): Pointwise equality implies equality of bundled test functions.
- **mathlib:TestFunction.continuous_iff_continuous_comp** (Mathlib/Analysis/Distribution/TestFunction.lean): A linear map into a locally convex space is continuous exactly when every fixed-compact restriction is continuous; includes algebra/scalar-tower hypotheses.
- **mathlib:Distribution** (Mathlib/Analysis/Distribution/Distribution.lean): Continuous real-linear dual of real test functions on an open normed-space subset, with values in a topological real module.
- **mathlib:Distribution.delta** (Mathlib/Analysis/Distribution/Distribution.lean): Evaluation distribution, including zero outside the open set.
- **mathlib:Distribution.lineDerivCLM** (Mathlib/Analysis/Distribution/Distribution.lean): Distribution derivative is minus precomposition with the test-function derivative; the order constraint is enforced.
- **mathlib:Distribution.ofFun** (Mathlib/Analysis/Distribution/Distribution.lean): Locally integrable functions give distributions by integral of test function times function; without local integrability the construction is zero.
- **mathlib:ExteriorAlgebra** (Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean): Exterior algebra of a module over a commutative ring, via the zero quadratic form.
- **mathlib:ExteriorAlgebra.ι_sq_zero** (Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean): The square of a degree-one generator is zero.
- **mathlib:ExteriorAlgebra.ι_add_mul_swap** (Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean): Products of degree-one generators anticommute.
- **mathlib:CochainComplex.mappingCone** (Mathlib/Algebra/Homology/HomotopyCategory/MappingCone.lean): Homotopy cofiber of a morphism of integer-indexed cochain complexes in a preadditive category with the required binary biproducts.
- **mathlib:Complex.exp_add** (Mathlib/Analysis/Complex/Exponential.lean): The complex exponential of a sum is the product of the exponentials.
- **mathlib:IsZLattice** (Mathlib/Algebra/Module/ZLattice/Basic.lean): A discrete Z-submodule spans the ambient normed real vector space; discreteness is a separate typeclass assumption. The two-generator positive-area lattice must be shown to satisfy these native conditions.
- **mathlib:Multipliable** (Mathlib/Topology/Algebra/InfiniteSum/Defs.lean): Its generated additive declaration Summable asserts existence of an unordered HasSum in a topological additive monoid. For complex terms absolute summability yields summability and licenses index rearrangement.
- **mathlib:ExteriorAlgebra.map** (Mathlib/LinearAlgebra/ExteriorAlgebra/Basic.lean): A linear map of modules induces an algebra homomorphism on exterior algebras; used by the coefficient-level Wang pullback signature.
- **mathlib:Fin.append** (Mathlib/Data/Fin/Tuple/Basic.lean): Ordered concatenation of a Fin m tuple and a Fin n tuple into Fin(m+n), via Fin.addCases.

The [suggested file](../suggested/Polylogarithms--P.5.lean) uses individual Mathlib modules. It prototypes the scalar chart Poincaré–Lelong identity, the full Wang polynomial and mixed concatenation, the shifted three-coordinate additive-group differential, the correction-term sign, and the lifted elliptic kernel with finite divisor evaluation. Every absent global signature has a named omission comment identifying its missing carrier; no undefined condition is replaced by an arbitrary proposition.

Acceptance requires a zero-error packet validation; disjoint ids from the parent; all definition APIs and at least three discriminating tests; every supplier stage resolved or requested; no whole-M.8 dependency; consistent current, factorial, coordinate and Fourier signs; and suggested-file elaboration with only its intentional proof-hole warnings. Source findings require independent review and publisher collation where access was unavailable.

The six planets of this follow-up are Currents, Poincaré–Lelong formula, Green current classes, Generalized Eisenstein–Kronecker series, Elliptic regulator formula, Wang forms. The packet proposes three presentation groups for the broad parent stage. Assembly must reconcile the existing parent planets with these six before promotion; the current job does not edit the atlas.
