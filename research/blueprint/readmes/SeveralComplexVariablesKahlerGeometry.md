# Several complex variables and Kähler geometry

**New roadmap design, CV.0–CV.6. Partial blueprint.** The declaration-level work in this checkpoint is the actual-function complex differential, complex-Hessian diagonal and boundary Levi calculus in CV.0. The other layers give precise geometric targets and proof interfaces, with their remaining work recorded. No stage or suggested Lean signature is claimed implemented.

## 1. Purpose, scope and existing owners

Several complex variables has two features that one-variable conformal geometry does not capture: holomorphic functions can extend across genuine holes, and analytic solvability is controlled by complex rather than real convexity. The first branch develops plurisubharmonicity, pseudoconvexity and the weighted barpartial equation to the Levi problem and Stein applications. A second branch constructs Hermitian curvature and compact Kähler harmonic theory, leading to vanishing and projective embedding. Their common pointwise calculus is built first; the compact branch does not assume the whole Levi problem as an unexplained prerequisite.

Use existing complex normed spaces and their compatible real scalar restrictions. Holomorphy uses the library's differentiability and analytic predicates, and manifolds and bundles use their existing carriers and instances. There is no replacement record storing a function together with an unrelated alleged derivative, nor an opaque field asserting that a Hodge decomposition or a solution operator exists.

Several neighbouring roadmaps already own substantial inputs. ComplexComparisonPartII:C0 constructs the local convergent-power-series, Weierstrass and coherence machinery, including nonreduced analytic ideal data; C1 owns the stated analytic acyclicity and coherent cohomology used for polydiscs and projective charts. A broader intrinsic analytic-space or general Stein Cartan theorem extends that owner rather than introducing parallel sheaf theory here. Its C2 and C4 supply projective GAGA and Chow comparisons after an analytic projective realization is available.

PDE supplies actual weak derivatives, Sobolev spaces, mollification, trace and compactness in the stated domain settings. A scalar-domain theorem is not the compact vector-bundle elliptic theorem needed for Hodge theory, and scalar density is not automatically graph-norm density for barpartial and its adjoint. Those extensions must be assigned and proved. The new roadmap owns the complex-geometric identities and estimates that use them.

HodgeStructures supplies the linear-algebraic Hodge and polarization carriers. It expressly does not prove that compact Kähler cohomology has the requisite decomposition. This roadmap constructs that geometric instance; it must not encode the desired geometric theorem as an input field. ComplexManifolds PR279 owns realification, atlases and holomorphic bundle gluing. Its actual current text was read, but its stage identifiers were not resolved in the atlas. That is an explicit interface gap, not permission to invent a competing manifold or bundle type.

The global targets concern finite-dimensional complex domains or smooth complex manifolds. Compactness and absence of boundary are retained for compact Hodge and vanishing statements. General singular vanishing, minimal-model theory and a general Monge–Ampère existence theorem are outside these endpoints. The targets below are substantial smooth theorems with their own hypotheses, not abbreviations for those larger programmes.

## 2. CV.0: derivatives of actual functions

Let E be a complex normed vector space with its compatible real normed-space structure. Put Jv=iv. For a real-valued function u, write D u and H u for the actual real first and second Fréchet derivatives. The latter is the existing `bilinearIteratedFDerivTwo`; the underlying implementation is the derivative of the derivative, converted to a bilinear map. No new real-Hessian definition or symmetry theorem is needed.

These derivative operators are total in Lean. Accordingly, every calculus theorem below carries the stated differentiability hypotheses. An arbitrary value returned by a total derivative at a nonsmooth function does not establish regularity, plurisubharmonicity or a boundary condition. The algebraic evaluation identities alone must never be used to bypass this distinction.

### The complex differential and tangent kernel

Construct `complexDifferential`, the complex-linear map

    partial u_x(v) = (D u_x(v) - i D u_x(Jv))/2.

Real linearity gives additivity. To prove complex linearity, write a=r+i s. Then a v=r v+s Jv and J(a v)=-s v+r Jv. Substituting these two expressions in the formula gives a times the original value. This constructs a map in the existing complex linear-map carrier, not just a function declared to be a complex derivative.

The API is `complexDifferential_apply`, `complexDifferential_re` and `complexDifferential_im`. They give the displayed formula and its real and imaginary parts, D u(v)/2 and -D u(Jv)/2. The evaluation is a separate node because subsequent formulas use it.

The existing kernel submodule is characterized by `mem_complexDifferential_ker`:

    v is in ker(partial u_x)
        iff D u_x(v)=0 and D u_x(Jv)=0.

Both equations matter. For a regular real level set, the real tangent is the first kernel, whereas the complex tangent is its intersection with its J-translate. Interpreting the real kernel as the tangent of an actual level manifold still uses the implicit-function theorem. The formula does not create that manifold by itself.

Three definition tests pin the convention: `complex_differential_realpart` gives partial(Re z)(v)=v/2; `complex_differential_constant` gives zero; and `complex_differential_normsq` gives partial(|z|²)_x(v)=conjugate(x)v. The last test rejects complex conjugation in the wrong argument as well as a missing factor two.

### The complex-Hessian diagonal

Define `complexHessian` by

    L_u(x;v) = (H u_x(v,v)+H u_x(Jv,Jv))/4.

It is the real diagonal of the complex Hessian. It is not a new full Hermitian-form carrier, and it has not yet been restricted to a boundary tangent. The full sesquilinear polarization and coordinate-matrix adapter belong to the remaining CV.0 interface work on the library's existing form carriers.

The API consists of `complexHessian_apply`, `complexHessian_smul` and `complexHessian_add`; all three also have node-level statements. For a complex scalar a, the diagonal scales by |a|². Indeed, expand the two real bilinear expressions for a v and J(a v): their mixed terms cancel, leaving the coefficient (Re a)²+(Im a)². For C² functions, differentiation of a sum twice proves additivity in u. The C² premises ensure both derivatives are those of the actual sum in a neighbourhood.

The four definition tests are `complex_hessian_normsq`, `complex_hessian_pluriharmonic`, `complex_hessian_negative` and `complex_hessian_zero_direction`. They respectively give L_(|z|²)(x;v)=|v|², L_(Re(z²))=0, L_(-|z|²)(0;1)=-1, and zero in the zero direction. Re(z²) has a nonzero indefinite real Hessian: the complex average must cancel it. Thus testing an arbitrary real Hessian or testing real convexity would define something different.

### Agreement with the genuine mixed derivative

The node `mixed-derivative-comparison`, with proposed declaration `complexHessian_eq_mixedDerivative`, establishes that the preceding diagonal is not merely an ad hoc real average. For C² u, fix v and differentiate the actual function y mapped to partial u_y(v). The barpartial directional expression is

    (D(partial u(−;v))_x(v) + i D(partial u(−;v))_x(Jv))/2.

Expanding the first-derivative formula gives

    (H(v,v)+H(Jv,Jv)+i(H(Jv,v)-H(v,Jv)))/4.

The pinned theorem `ContDiffAt.isSymmSndFDerivAt` supplies symmetry of the actual C² real second derivative. The imaginary terms cancel, so this expression is the complex cast of L_u(x;v). Differentiation of the evaluated first derivative uses the existing bounded bilinear derivative rule. Neither an independent formal jet nor an assumed complex Hessian is inserted.

### Complex lines and the Laplacian

The theorem `complexLine_laplacian` compares directly with the existing one-variable Laplacian:

    Delta(z mapped to u(x+z v))(0) = 4 L_u(x;v).

The affine line has real derivative sending 1 to v and i to Jv, and zero second derivative. Apply the real chain rule twice, then the pinned formula expressing the complex-plane Laplacian as the two real second derivatives along 1 and i. The result is the stated factor four. For v=0 it correctly gives the constant-line case.

This is the differential calculation behind Lebl's Proposition 2.4.9. The general statement that an upper-semicontinuous function is plurisubharmonic is not being defined by this formula. To derive the C² criterion, CV.2 must also supply the complete one-variable subharmonic/Laplacian equivalence and its source proof exercises.

## 3. Product and chain rules

### Product and scalar composition

For C² real functions u,w, `complexHessian_mul` proves

    L_(u w) = u L_w + w L_u
                + 2 Re(partial u(v) conjugate(partial w(v))).

Differentiate the actual real product twice. Its diagonal cross term is 2 D u(v)D w(v), and the Jv term is the corresponding product in Jv. Their sum divided by four is exactly the displayed real part. The cross term is essential even when both individual complex Hessians vanish.

For a real C² function chi near u(x), `complexHessian_comp_real` proves

    L_(chi composed with u)
        = chi_prime(u(x)) L_u
            + chi_second(u(x)) |partial u_x(v)|².

The second real chain rule follows by differentiating the first chain rule using the bounded bilinear and scalar-product rules. It has terms chi_prime H u and chi_second D u tensor D u. The two-direction average identifies the last diagonal with the squared modulus of partial u.

`complexHessian_comp_nonneg` is the immediate positivity consequence when the diagonal of u, chi_prime and chi_second are nonnegative at the specified points. It is explicitly a smooth differential assertion. The full convex-composition theorem for nonsmooth plurisubharmonic functions has an additional approximation/upper-semicontinuity proof in CV.2.

These formulas also check the normalization: for chi(t)=t² the coefficient of |partial u|² is two. A formula with coefficient one would fail the actual-function regression calculation.

### Why holomorphic pullback cancels the second-derivative term

`holomorphic_second_trace` is a separate lemma. For an actual complex-C² map f:E→F, its real second derivative satisfies

    D_R² f_x(v,v)+D_R² f_x(Jv,Jv)=0.

The pinned restriction-of-scalars theorem identifies the real first derivative with the complex derivative restricted to real scalars. Apply this on a neighbourhood, differentiate again, and restrict the actual complex second derivative. Complex bilinearity makes evaluation on Jv,Jv multiply its value on v,v by i²=-1. This is why the sum is zero. A real-smooth map need not satisfy it.

Now `complexHessian_comp_holomorphic` proves

    L_(u composed with f)(x;v)=L_u(f(x);D_C f_x(v)).

The real second chain rule has the usual term H u(Df v,Df w) and the extra term D u(D² f(v,w)). In the complex-line trace, the latter disappears by the preceding lemma. Complex linearity of the first derivative identifies the remaining two terms with the claimed Hessian. This proof does not assume a linear map in place of the nonlinear holomorphic f.

The accompanying first-order formula `complexDifferential_comp_holomorphic` only needs the two first derivatives. It is equality of actual complex linear maps, partial(u composed with f)=partial u composed with D_C f. This is the coordinate-change input for the complex tangent, while the second-order result is the input for Levi positivity.

Three useful consequences remain separate declarations. `complexHessian_re_holomorphic` makes L_(Re f) zero; `complexHessian_normSq` computes L_(|z|²); and `complexHessian_normSq_holomorphic` gives L_(|f|²)(x;v)=|D_C f_x(v)|². They require no unrelated positive-definite matrix as input.

The theorem-level regressions distinguish the hypotheses. The function Re(z²) is pluriharmonic but not real convex: its values at i and -i are -1, while its value at their midpoint is zero. The squared modulus of f(z)=z² has Hessian zero at zero, so strict positivity is not preserved through a critical point. Finally, Re(z)² has complex Hessian 1/2 at the origin in direction 1. It cannot be treated as a holomorphic pullback of a harmonic function merely because the map used in its expression is real smooth.

## 4. Boundary Levi forms and the choice of defining function

Let rho be C² near a point x with rho(x)=0 and D_R rho_x nonzero. The selected local inside is rho<0. Its complex tangent is the existing kernel of partial rho_x. We keep the ambient norm fixed throughout comparisons.

### The explicit multiplier calculation

Suppose sigma=h rho for a specified real function h. The first-order lemmas `boundaryFactor_fderiv` and `boundaryFactor_complexDifferential` only require both factors differentiable at x. At the zero level they give

    D sigma_x=h(x) D rho_x,
    partial sigma_x=h(x) partial rho_x.

If h(x) is nonzero, `boundaryFactor_ker` gives equality of the actual complex kernel submodules, and `boundaryFactor_regular` proves that sigma remains regular. These are explicit map and kernel identities, not identifications between unnamed tangent spaces.

For the Hessian calculation assume additionally that the GIVEN h is C². The product rule gives

    L_sigma(x;v)=h(x)L_rho(x;v)

for a complex tangent v. The term rho(x)L_h vanishes, and the cross term vanishes because partial rho_x(v)=0. The lemma `boundaryFactor_hessian` is deliberately a tangent statement. It is false on all ambient directions in this generality.

### Normalization

Define `normalizedLevi` on the tangent subtype by

    Levi_norm(rho,x;v)=L_rho(x;v)/norm(D_R rho_x).

Its regularity proof is an explicit parameter. A nonzero continuous linear map has positive operator norm, so division by it is legitimate. In the Euclidean model that operator norm equals the gradient norm, giving Demailly's convention in I (7.10). On a general normed space this is the specified operator-norm normalization, not a claim that a Euclidean gradient has been constructed.

The API `normalizedLevi_apply`, `normalizedLevi_nonneg_iff` and `normalizedLevi_proof_independent` provides the formula, positivity equivalence with the unnormalized tangent diagonal, and independence of the regularity proof witness. The first two are separate node lemmas. The normalized object does not accept an arbitrary normal vector as its argument.

For a nonzero C² multiplier, `normalizedLevi_factor` yields

    Levi_norm(h rho,x;v)
        = (h(x)/|h(x)|) Levi_norm(rho,x;v).

The numerator scales by h(x) on the tangent space, and the derivative norm scales by |h(x)|. The earlier regularity and kernel lemmas supply the target witnesses for the same ambient vector. A positive multiplier preserves the value and the chosen inside. A negative multiplier reverses both the sign and the side. Thus normalization removes positive scalar freedom, not the orientation of a defining function.

This comparison keeps the ambient norm fixed. A general biholomorphic change of coordinates preserves the unnormalized complex Hessian through the actual derivative, but its normalization also changes the norm of the defining covector. Exact normalized-value invariance under an arbitrary chart or metric change is not asserted.

The three definition tests supply their regularity and kernel witnesses, rather than assuming impossible ones. For rho(z,w)=|z|²+|w|²-1 at (1,0), tangent (0,1) has value 1/2. For the halfspace rho(z,w)=Re w at zero, tangent (1,0) has value zero. For the opposite sphere defining function the original tangent vector has value -1/2. They are `levi_sphere_value`, `levi_halfspace_zero` and `levi_orientation_reversal`.

### The normal Hessian can change while the boundary does not

`boundary_normal_correction` uses the scalar chain rule with chi(t)=t+a t². At the zero level,

    L_(rho+a rho²)(x;v)
        = L_rho(x;v)+2a |partial rho_x(v)|².

The correction vanishes on complex tangent vectors. It need not vanish on a normal vector.

For the unit sphere in C², take sigma=rho-rho². Near its zero level, 1-rho is positive, so sigma and rho define the same local side and have the same boundary gradient. At (1,0), however, L_sigma is -1 on (1,0) and +1 on (0,1). A boundary definition demanding nonnegativity of the full ambient Hessian would reject this perfectly valid defining function of the ball. This is an acceptance counterexample to that wrong definition, not a source erratum.

### The C² ratio issue is a real regularity boundary

The smooth-multiplier theorem must not be applied to arbitrary pairs of C² defining functions without checking its hypothesis. In a real normal coordinate t, take

    rho(t)=t,
    sigma(t)=t(1+|t|^(3/2)).

Both are C², have derivative one at zero, and define the same side. Their forced ratio off the zero set is 1+|t|^(3/2), whose second derivative is unbounded as t tends to zero. It cannot extend to a C² multiplier near zero. The same example can be used in one real coordinate of a complex domain.

The correct route to the general defining-function theorem does not need this ratio to be C². First prove that the two differentials are related at the boundary by a positive scalar, using their common regular level set and the same-side condition. For a tangent vector choose an actual C² curve in that level set and differentiate each defining function along it twice. The curve-acceleration terms cancel after scaling the first derivatives, giving the corresponding identity for second derivatives on tangent vectors; apply it to v and Jv. Existence of such curves and the first-order comparison require the genuine implicit-function/level-set interface. Those steps and their typed theorem remain explicit CV.0/CV.2 closure work.

Lebl's Proposition 2.3.6 assigns independence as a proof exercise. Demailly supplies an intrinsic interpretation in I (7.11). This checkpoint does not pretend that the explicit multiplier proof, or the failed C²-ratio shortcut, completes that broader theorem.

## 5. The analytic branch

### CV.1: holomorphic functions and analytic loci

Work with actual holomorphic functions on finite-dimensional complex domains. The several-variable Cauchy formula, power-series comparison and separate-to-joint holomorphy must build on whatever the pinned analytic and one-variable theories already supply. Before creating new declaration nodes for them, complete their exact presence audit. The local inverse and rank theorems retain their differential hypotheses.

The Hartogs endpoint has n at least two, Omega open and connected in C^n, K compact and contained in Omega, and Omega minus K connected. A holomorphic function on Omega minus K extends uniquely to Omega. Connectedness of the complement and the dimension bound are not decorative: neither a one-variable annulus nor independent data on separated complementary pieces satisfies this statement.

Local convergent germs, Weierstrass division/preparation, coherent ideals and nonreduced analytic subspaces stay with ComplexComparisonPartII:C0 and its general intrinsic extension. This roadmap applies them to analytic zero loci, regular loci and local parametrization. Analytic subspaces are not replaced by their underlying reduced zero sets. The source work for the full Hartogs and local-parametrization arguments remains to be completed; a stage description is not evidence of a verified proof.

### CV.2: plurisubharmonicity and pseudoconvexity

The general psh object is upper-semicontinuous, may take minus infinity, and is tested on complex lines by subharmonicity, allowing an identically minus-infinity restriction. It is not the C² positivity predicate. Its API must address decreasing limits, the relevant locally bounded envelope operations, composition and holomorphic pullback, including the possibility of collapse to minus infinity. Strictness requires its own local lower-bound formulation.

For C² functions, CV.0's actual line-Laplacian identity reduces psh to positivity of the complex-Hessian diagonal once the complete one-variable subharmonic criterion is proved. The already-pinned harmonic primitive theorem supplies genuine one-variable harmonic functions where needed; it does not supply the entire nonsmooth subharmonic theory.

The stage then proves local regularization, psh exhaustions and the boundary Levi criterion with its precise open-domain and C² regular-boundary hypotheses. Holomorphic convexity, domains of holomorphy and psh-exhaustion pseudoconvexity are connected by proved implications. They are not made synonymous by defining them to be the same proposition. A pointwise boundary statement is not automatically a global exhaustion, and a compactness or exhaustion hypothesis needed to globalize it must be stated.

The unit ball, halfspace, products, complex dimension one, and the negative-normal-Hessian example are required tests. The full defining-function proof uses the regularity-safe route above. The source subharmonic proof exercises, regularization and local-to-global implications are still required nodes; they are not discharged by the C² formulas in this packet.

### CV.3: weighted barpartial solvability and the Levi problem

Construct barpartial on actual complex-valued forms and then its distributional realization in the existing weak-derivative and L² carriers. A weighted Hilbert adjoint is determined by its graph domain; it is not simply a formal differential expression with the word adjoint attached. Prove integration by parts, the basic estimate, graph-norm approximation and the exhaustion/weak-compactness argument before applying Hilbert duality.

A normalization target is the Euclidean scalar estimate. Let Omega be pseudoconvex in C^n and phi a smooth strictly psh real weight. Let lambda_min be the smallest eigenvalue of the matrix whose diagonal quadratic form is L_phi. If g is a distributionally barpartial-closed (0,1) form, locally L², and

    integral_Omega |g|² exp(-phi)/lambda_min < infinity,

construct f with barpartial f=g and squared weighted L² norm at most that integral. Here |g|² is the sum of squares of its dbarz-coordinate coefficients and integration uses Euclidean Lebesgue measure. The statement does not assert an arbitrary smooth-up-to-boundary solution from an interior L² estimate.

Demailly VIII (6.5) is an estimate for (n,q) forms with a line-bundle curvature term on a weakly pseudoconvex Kähler manifold. The scalar Euclidean specialization must identify the top-form trivialization and all norm factors. On a curved manifold, converting a scalar (0,q) problem to that theorem changes the line bundle and includes canonical-bundle/Ricci curvature. That term is not deleted by a change of notation.

The Levi-problem application requires the actual exhaustion and holomorphic-separation construction, not merely the assertion that an estimate exists. General Cartan A/B and coherent Stein extensions belong to ComplexComparisonPartII:C0–C1 in their own direction. The local chart acyclicity used in this proof must be proved independently or given a noncircular route; it cannot be both an input to and a consequence of the same global estimate.

## 6. The Hermitian and compact Kähler branch

### CV.4: complex forms, bundles and curvature

Use the complex manifolds and holomorphic bundle structures owned by the existing atlas/gluing programme. Construct type decomposition of smooth forms and the actual partial and barpartial operators, their algebraic identities and the local Dolbeault resolution. Compare its cohomology with the already-owned sheaf cohomology rather than invent a second meaning of cohomology.

A Chern connection is the actual connection compatible with the given Hermitian metric and with (0,1) part equal to the holomorphic structure. Existence, uniqueness and frame-change formulas are theorems. Audit the generic connection and bundle APIs first. For a local line metric exp(-phi), use the real curvature form i partial barpartial phi; for the standard Euclidean Kähler form use (i/2) times the sum of dz_j wedge dbarz_j. Track the resulting factors when comparing curvature eigenvalues, gradients and the scalar L² convention.

A Kähler form is real, of type (1,1), positive and closed. A positive pointwise form alone is not a Kähler metric. Construct local potentials, tensor and dual curvature formulas, and distinguish Griffiths from Nakano positivity. The ring-theoretic KaehlerDifferential object is not a substitute for these analytic tangent-bundle constructions.

### CV.5: compact Kähler Hodge theory

On a compact Kähler manifold without boundary, the Hodge theorem first requires the genuine compact elliptic theory of differential operators on vector bundles. The chosen PDE supplier must construct that theory with its closed ranges, compactness, regularity and harmonic representatives. A scalar-domain estimate is insufficient.

Prove the Kähler commutators and the normalization Delta_d=2 Delta_barpartial, then the actual harmonic decomposition and the ddbar lemma. Establish that the resulting cohomological decomposition is independent of the chosen Kähler metric, has the required conjugation symmetry, and realizes the degeneration of the Hodge-to-de Rham spectral sequence. Lefschetz operators, hard Lefschetz and the Hodge–Riemann signs are separate mathematical outputs, not assumed inside a Hodge-structure record.

The geometric realization uses integral cohomology modulo torsion, or a specified rational lattice, with the actual de Rham/Betti comparison. The existing HodgeStructures carriers receive the proved decomposition and forms. An arbitrary real Kähler class yields real Lefschetz pairings, not automatically a rational polarization. The rational assertion carries a rational Kähler class, as supplied in particular by an ample integral line bundle. Primitive and total-cohomology forms must be compared with the existing polarization conventions explicitly.

The inspected Demailly page containing the compact decomposition and ddbar argument relies on preceding elliptic and Kähler identities. Those predecessors still require complete source decomposition. Reading the endpoint does not make them existing library theorems.

### CV.6: vanishing and projective embedding

For a positive holomorphic line bundle L on a compact Kähler n-fold, prove the Bochner–Kodaira–Nakano identity with its actual Chern connection, adjoints and curvature operator. Its bidegree signs imply the line-bundle Akizuki–Nakano vanishing H^{p,q}(X,L)=0 for p+q>n, and hence H^q(X,K_X tensor L)=0 for q>0. Merely equipping an arbitrary line bundle with a Hermitian metric is not the positivity hypothesis.

Kodaira embedding requires more than finite-dimensional sections or global generation. Construct sufficiently high powers with simultaneous point and tangent-jet separation, build their projective map, and prove injectivity and injective differential; compactness then supplies the required embedding properties. Prove the uniform choice of a power, not a point-dependent exponent that cannot define one projective map. Keep the integral first Chern class and its 2pi normalization.

Projective GAGA and Chow from ComplexComparisonPartII are used after this analytic embedding to identify its algebraic realization. Using projective algebraization as a premise for constructing the embedding would be circular. The complete section/jet construction and the embedding proof are outstanding source work; the statements in Demailly VII Sections 13–14 were inspected, not the entire proof chain.

## 7. Evidence, validation and continuation

The two mathematical sources are Jiří Lebl, *Tasty Bits of Several Complex Variables*, version 4.4 of 31 May 2026, and Jean-Pierre Demailly, *Complex Analytic and Differential Geometry*, the author-hosted 21 June 2012 version. Their URLs, exact passages and access limits are recorded in both JSON deliverables. The proofs in CV.0 are explicit calculations from the actual derivatives and the indicated source conventions; they are not represented as 28 separately numbered source theorems.

Lebl's printed pp.66 and 85 were visually inspected, including the boundary Levi definition and the full line-calculation proof of Proposition 2.4.9. The defining-function independence passage on p.68 was parsed-only after a failed image; its proof is assigned to an exercise. Demailly's printed pp.59, 311, 334 and 378 were visually inspected. The gradient-normalized definition on p.58 was parsed-only after failed images. The endpoint pages for Hodge, vanishing and weighted estimates still cite substantial prerequisites. No PDF-byte hash, publisher-edition comparison or full-book certification is claimed.

The two versions use compatible but different Levi normalizations: Lebl uses the tangent complex Hessian, while Demailly divides by the gradient norm. This is a convention difference, not an error. The C² ratio example and the altered defining-function example test invalid proof shortcuts; no source-error allegation, novelty claim or author communication is made.

Eleven baseline declarations were inspected at Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174, in seven files whose exact Git blobs are recorded. They include the actual bilinear second derivative, its symmetry and Laplacian comparison, chain/product/bilinear rules, restriction of scalars and the existing one-variable harmonic primitive theorem. Tau Ceti remains pinned at f790474821cf4256814db967cb154e7af3d0c369. The aggregate reviewed audit returned no readable content; the limited default-branch searches do not establish exhaustive absence of several-variable or Chern-connection theory.

The prototype gives 31 named declarations: 28 core nodes plus three API-only lemmas. Its nine API entries accompany the three data-bearing definitions/constructions. It contains ten definition tests and four additional theorem-level regressions. All are on actual function, derivative, linear-map and kernel carriers. The file is not Lean-compiled, and no proof placeholder is evidence of elaboration.

The local exact symbolic suite differentiates actual polynomial functions and nonlinear holomorphic maps. It checks the factors, chain rules, positive and negative defining factors, normal/tangent distinction and the ratio regularity example. Its 345 assertions are regression checks, not universal proofs or a substitute for the typed library. The handoff records the structural checks and observed publication/CI results separately. No full-atlas cycle check or local full-repository validator is claimed.

The next steps are to elaborate CV.0, complete its Hermitian polarization and regularity-safe general defining-function comparison, and then construct CV.2's actual nonsmooth psh theory. In parallel, reconcile the precise manifold, sheaf and compact-bundle-elliptic owners before giving the remaining global arguments declaration-level packets. Every stage retains its explicit worklist; none becomes closed because the pointwise formulas have been written.
