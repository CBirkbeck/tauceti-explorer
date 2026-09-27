# Symplectic and contact geometry

**New roadmap design for issue #3071. Status: partial.** The scope is SC.0–SC.7. This checkpoint gives an eight-stage geometric programme and a declaration-sized pointwise contact/Reeb foundation. It does not claim to construct smooth contact manifolds, the reduction quotient, or the toric classification yet. The suggested file is not Lean-compiled.

## 1. Purpose, imports and conventions

The aim is to connect local contact and symplectic geometry to global Hamiltonian geometry: contact and Lagrangian neighbourhood theorems, regular symplectic reduction, moment-map convexity, and Delzant classification. This is not a second analytic Heegaard Floer roadmap. Its existing F2.1 stage owns the common symplectic-manifold, almost-complex and Darboux–Moser substrate. Its F1.3, F2 and F3 lanes retain Maslov theory, holomorphic curves and exact Lagrangian Floer homology. The new programme imports those interfaces where needed rather than rebuilding them or making an entire Floer complex a prerequisite for elementary geometry.

Generic manifolds, smooth embeddings, normal bundles and tubular neighbourhoods remain with GeometricTopology. The Lie algebra/tangent dictionary, exponential and adjoint action remain with LieGroups. A smooth quotient of a general manifold by a free compact action is not supplied merely by a theorem constructing a Lie group quotient G/H. Likewise ordinary Morse theory with isolated critical points is not the Morse–Bott handle theorem needed by the convexity proof. These two supplier gaps are recorded explicitly.

The selected conventions are:

- A manifold is an existing type with Mathlib manifold instances. Contactness, closedness, nondegeneracy and completeness are separate conditions; no replacement manifold record stores the desired conclusions.
- The contact branch uses a chosen coorientation and a global contact form alpha. Its Reeb field is normalized by alpha(R)=1 and contraction of d alpha with R equal to zero. Positive rescaling preserves that coorientation; it does not generally preserve the Reeb line. The standard form is dz minus the sum of p_i dq_i.
- The cotangent tautological form evaluates a covector on the derivative of the bundle projection; the canonical symplectic form is minus its exterior derivative. Symplectization uses d(exp(t)alpha), hence the pointwise sign dt wedge alpha.
- Hamiltonian fields satisfy contraction of omega with X_H equal to dH. Put {F,G}=omega(X_F,X_G); then X_H(F)={F,H}, and the vector-field bracket is [X_F,X_G]=-X_{ {F,G} }. For a left action, xi_M differentiates exp(t xi) acting on x. Equivariance uses the coadjoint action dual to Ad of g inverse.
- The torus has period lattice 2 pi Z^n. Counterclockwise rotation on C with dx wedge dy has moment -|z|^2/2 in the stated Hamiltonian convention. Moment-map translation and changes of integral torus coordinates are data changes, not silent identifications.

The global geometric targets are finite-dimensional. For the algebraic prefix, arbitrary real vector spaces are used where possible. Finite-dimensionality is stated exactly where a nondegenerate pairing must be surjective onto the algebraic dual.

Noncooriented contact line-bundle geometry, singular or orbifold reduction, virtual contact homology and new Floer invariants are not endpoints here. These exclusions do not remove hypotheses from the regular theorems. Compactness, support or completeness is retained wherever a local flow must run globally.

## 2. Actual carriers and pointwise contact data

### SC.0/contact-linear-data

Let V be a real vector space, alpha a linear functional on V, and beta a real bilinear form. Define

    IsContactData(alpha,beta)
      := alpha is nonzero
         and beta is alternating
         and beta restricted to ker(alpha) is nondegenerate.

The carrier of the hyperplane is the existing kernel submodule H=ker(alpha). The restriction is the existing `LinearMap.BilinForm.restrict`. The predicate contains no vector purported to solve the Reeb equations and no smoothness or exterior-derivative assertion.

This distinction is essential. In a manifold application beta must be the **actual** value of d alpha at the same point as alpha. The pair of a globally constant one-form dt and an unrelated nonzero two-form omega is not a contact-form construction: d(dt)=0. The pointwise transverse-line model below is legitimate linear data and is the value at the origin of a genuine contactization, but not of that constant one-form. To realize it smoothly, one can use dt+lambda on R times W with lambda_x(v)=omega(x,v)/2, whose derivative is omega; that differential calculation belongs to SC.1.

The API projections are `IsContactData.alpha_ne_zero`, `IsContactData.beta_isAlt` and `IsContactData.horizontal_nondegenerate`. The definition tests deliberately include the dimension-one case: alpha=id on R and beta=0 are allowed because H=0. The zero covector is rejected in every dimension, and first projection on R times R^2 with beta=0 is rejected because its horizontal restriction is degenerate. These are `contact_one_dimensional`, `contact_zero_covector_rejected` and `contact_zero_twoform_rejected`.

### SC.0/horizontal-symplectic-form and SC.0/linear-contact-model

The pinned Tau Ceti carrier `SymplecticForm H` already means an alternating nondegenerate real bilinear form. Construct `horizontal` by putting beta.restrict(H) into that carrier. Its alternation is inherited by evaluating beta on the included vector twice; its nondegeneracy is the contact hypothesis. There is no new symplectic-form definition.

The API is `horizontal_apply`, `horizontal_toBilinForm` and `horizontal_proof_independent`. The first two identify the actual pairing, while the third says that a change of proof witness changes no data. The tests `horizontal_model`, `horizontal_diagonal` and `horizontal_zero_kernel` respectively recover a given symplectic pairing, check alternation, and retain the zero-dimensional horizontal space of the one-dimensional contact example.

For the linear model, start with an existing symplectic form omega on W. On R times W put alpha(t,v)=t and beta((t,v),(s,w))=omega(v,w). The vector (1,0) witnesses nonzeroness of alpha. The kernel is exactly the image of v mapped to (0,v); this linear identification transports omega and its nondegeneracy. This proves `model_isContactData`, without imposing finite dimension. It is a test of the pointwise definition, not a competing global symplectic or contact carrier.

### Reuse the bilinear dual equivalence

For finite-dimensional V, H is finite-dimensional. The existing theorem behind `LinearMap.BilinForm.toDual` identifies H with its dual through beta restricted to H. Its inverse sends a covector ell to the unique z satisfying

    beta(z,w)=ell(w) for all w in H.

`apply_toDual_symm_apply` proves this evaluation. The pinned definition constructs the equivalence from injectivity and equality of dimensions; its hypotheses and proof were inspected. The suggested file gives a direct reuse example. There is deliberately **no new generic horizontal-solver node**, no new musical-isomorphism carrier, and no request to implement a theorem that is already available.

## 3. Constructing the Reeb vector and its splitting

### SC.0/reeb-existence-uniqueness

Assume now that V is finite-dimensional and the pair is contact data. Since alpha is nonzero, choose u with alpha(u) nonzero and rescale it to make alpha(u)=1. Restrict the covector beta(u,-) to H and let z be its inverse under the existing bilinear dual equivalence. Thus beta(z,w)=beta(u,w) for every horizontal w.

Set r=u-z. Then alpha(r)=1 and beta(r,w)=0 for every w in H. To check the latter equation on the whole of V, write

    v = alpha(v)r + (v-alpha(v)r).

The second term is horizontal; alternation gives beta(r,r)=0. Hence beta(r,v)=0 for all v. This is a construction from the contact hypotheses, not an assumption that the radical already comes with a normalized generator.

For uniqueness, the difference of two candidates belongs to H, since their alpha values are both one, and annihilates all of H. Nondegeneracy of the restricted pairing makes that difference zero. The proof only uses finite dimension in the already-existing inverse-dual step. A weakly nondegenerate form on an infinite-dimensional space is not silently treated as surjective onto its dual.

### SC.0/reeb-vector, SC.0/reeb-characterization and SC.0/reeb-uniqueness

Define `reeb` by choosing the solution of the preceding proved existence theorem. The companion lemmas `reeb_spec` and `reeb_unique` are separate dependency nodes: they supply normalization and annihilation, and identify any candidate that satisfies both equations. The third API lemma, `reeb_ne_zero`, follows immediately from alpha(r)=1.

The tests `reeb_model`, `reeb_normalization_matters` and `reeb_negative_coorientation` give respectively (1,0) on the transverse-line model, 1/2 for alpha=2 id on R, and -1 for alpha=-id. They distinguish the normalized vector from an arbitrary nonzero generator of the radical. The last test is not a claim that negative rescaling preserves a previously chosen coorientation.

### SC.0/horizontal-projection and its formula

Construct a linear map into the actual kernel,

    P(v)=v-alpha(v)r.

The expression has alpha value zero by normalization. Linearity follows by expansion of the linear functional, and therefore the construction uses the actual module structure rather than a chosen set-theoretic splitting. The API consists of `horizontalProjection_coe`, `horizontalProjection_subtype` and `horizontalProjection_reeb`. The first is promoted to its own node, SC.0/horizontal-projection-formula, because the splitting and form-recovery constructions use the evaluation equation.

The tests `projection_kills_reeb`, `projection_fixes_horizontal` and `projection_ignores_reeb_translation` check that P(r)=0, that the inclusion of H followed by P is the identity, and that P(v+t r)=P(v). These pin the complement selected by the Reeb vector and distinguish P from an arbitrary linear projection onto the same hyperplane.

### SC.0/reeb-splitting and SC.0/horizontal-form-recovery

Define

    splitting(v)=(alpha(v),P(v)) in R times H,
    splitting_inverse(t,h)=t r+h in V.

Both maps are linear. The second followed by the first gives (t,h), since alpha(h)=0 and P(r)=0. The other composite is alpha(v)r+v-alpha(v)r=v. This constructs an actual `LinearEquiv` on the existing product and kernel types.

The API `splitting_apply`, `splitting_symm_apply` and `splitting_reeb` gives the two formulas and the normalized Reeb axis. The corresponding tests are `splitting_reeb_axis`, `splitting_horizontal_axis` and `splitting_roundtrip`. They check both distinguished axes and their sum, not merely the existence of some dimension-counting isomorphism.

Finally, expanding P in both arguments gives

    beta(P(v),P(w))=beta(v,w).

Every additional term has r in one slot. It vanishes by the Reeb equations or their skew-symmetric counterpart. Thus the full form is recovered from the horizontal pairing through this particular splitting. No positivity or inner product is used, and no arbitrary complementary line is substituted for the radical.

## 4. Rescaling without discarding the differential term

### SC.0/rescaled-exterior-data and SC.0/rescaled-form-evaluation

Let c be a real number and ell a real covector. Use the existing bilinear products of covectors to define

    beta_prime = c beta + ell tensor alpha - alpha tensor ell.

The value on v,w is

    c beta(v,w)+ell(v)alpha(w)-alpha(v)ell(w).

For a smooth function f, the intended specialization is c=f(x), ell=df_x. It is exactly the product rule d(f alpha)=f d alpha+df wedge alpha at x. The construction itself is pointwise and does not certify that such smooth data have been supplied.

The API is `rescaledForm_apply`, `rescaledForm_zero` and `rescaledForm_comp`; the evaluation has its own lemma node. The zero-covector case is c beta. Applying a second first-order rescaling (d,m) gives the same result as a single rescaling with factor dc and differential d ell+c m. That identity is the ordinary derivative product rule, proved here by expanding the two existing rank-one bilinear forms.

Tests `rescaling_constant`, `rescaling_gradient_term` and `rescaling_product_rule` check factor two with zero differential, the value -ell(v) on the old Reeb direction and a horizontal vector when c=1, and the explicit factors two followed by three. The second test already rejects replacing the new exterior data by c beta.

### SC.0/rescaling-contact-condition

If c is nonzero, ker(c alpha)=ker(alpha). The rank-one correction vanishes on two horizontal arguments, so the new restriction is c times the old nondegenerate pairing. It remains nondegenerate because c is invertible. The evaluation formula also gives alternation of beta_prime, and the new covector is nonzero. This proves contactness of the rescaled pair.

This algebraic result permits negative c. In a smooth cooriented application, preserving that chosen coorientation requires f positive. At c=0 the first-order formula still defines a bilinear form, but its proposed contact covector is zero, so no contact-preservation theorem is asserted.

### SC.0/reeb-rescaling

Define Z in H by the **existing** inverse dual of beta restricted to H, applied to the restricted covector ell. Thus

    beta(Z,w)=ell(w) for every w in H.

The normalized Reeb vector for the rescaled pair is

    r_prime = c^(-1)r + c^(-2)Z.                              (R)

First, c alpha(r_prime)=1. For a horizontal w, the new pairing is

    beta_prime(r_prime,w)
      = c^(-1) beta(Z,w) - c^(-1) ell(w)
      = 0.

Since r_prime is normalized by c alpha, it supplies a transverse direction, and every vector is a multiple of r_prime plus an element of H. The new form is alternating, hence also vanishes on (r_prime,r_prime). Therefore it annihilates every vector. The preceding Reeb uniqueness theorem identifies it with the constructed new Reeb vector.

This proof keeps the sign of Z fixed by beta(Z,w)=ell(w). It does not assume that r_prime is proportional to r. The component of ell along r does not create another term: annihilation on the horizontal space together with alternation and normalization already proves the equation on all vectors.

In the standard contact chart alpha=dz-p dq, let f=exp(q). At q=p=0 one has beta=dq wedge dp and ell=dq. The horizontal solution is Z=-partial_p. Formula (R) gives partial_z-partial_p, not partial_z. More generally in the transverse-line model, taking ell=omega(z,-) on the horizontal factor gives the new vector (1,z) at c=1. Both the concrete sign test and the general model appear in the regressions.

### SC.0/constant-reeb-rescaling

For ell=0 the inverse dual sends zero to zero, so (R) becomes r_prime=c^(-1)r. This constant case must not be generalized to nonconstant f by forgetting its derivative. In particular, equal contact hyperplanes do not determine the same Reeb dynamics. This is why the roadmap distinguishes a contact distribution, a chosen contact form, strict maps and contactomorphisms from the start.

## 5. Pointwise symplectization and coordinate changes

### SC.0/linear-symplectization and SC.0/symplectization-evaluation

On R times V define the actual bilinear form

    Omega((s,v),(t,w)) = beta(v,w)+s alpha(w)-t alpha(v).

This uses only existing bilinear pullbacks and products of covectors. Alternation is immediate from the expression. For nondegeneracy, suppose (s,v) annihilates every right argument. Test (1,0) to get alpha(v)=0. Test (0,h) for h in H to get beta(v,h)=0; horizontal nondegeneracy gives v=0. Finally choose w with alpha(w)=1 and test (0,w), obtaining s=0. The other-sided nondegeneracy follows from alternation.

This proof does not require finite dimension, the existence of a Reeb vector, or a chosen complement. It constructs an element of the existing `TauCeti.SymplecticForm (R times V)` carrier. In the smooth setting, d(exp(t)alpha) is exp(t) times this pointwise expression. Proving that identity on actual tangent bundles, its smoothness and its closedness still belongs to SC.1. The cited symplectization proposition in Cannas da Silva leaves its proof as an exercise; the argument above supplies the pointwise part rather than pretending that the source has already discharged the manifold interfaces.

The API consists of `symplectization_apply`, its separate evaluation lemma, `symplectization_horizontal` and `symplectization_reeb_pair`. The tests `symplectization_reeb_area`, `symplectization_horizontal_area` and `symplectization_orientation` give area +1 on time followed by Reeb, recover beta on horizontal vectors, and give -1 on the reversed transverse pair. They fix the dt wedge alpha sign. When V is one-dimensional they recover the ordinary area form on a two-dimensional vector space.

### SC.0/contact-linear-pullback and SC.0/reeb-linear-pullback

For a linear equivalence e:V->W, pull back alpha by composition and beta in both arguments. Surjectivity of e preserves nonzeroness of the covector. The map identifies the actual two kernel submodules. If a horizontal vector annihilates all horizontal vectors after pullback, its image annihilates the entire horizontal subspace of W, so it is zero by nondegeneracy. Injectivity of e then kills the original vector. Alternation also pulls back. This proves contactness without choosing coordinates or a new kernel carrier.

In finite dimension e inverse of the original Reeb vector is normalized for the pulled-back covector and annihilates its two-form. The already-proved uniqueness theorem therefore gives

    Reeb(e*alpha,e*beta)=e^(-1)(Reeb(alpha,beta)).

The identity and composition cases follow from this formula. An arbitrary noninjective linear map is not a substitute for a linear equivalence; it can make a horizontal pairing degenerate. The result is the pointwise coordinate-change theorem needed in SC.1 for smooth chart comparisons, not a claim that the latter have already been constructed.

## 6. From the prefix to the smooth and global programme

The smooth bridge cannot be skipped. On a local trivialization, choose a smooth transverse vector with alpha value one. A smooth frame of the kernel is then obtained by projection along that transverse vector. The restricted beta matrix is invertible, and the inverse is smooth by the finite-dimensional inverse-matrix formula on the nonzero-determinant locus. The pointwise Reeb construction therefore becomes smooth on the chart; uniqueness makes the chartwise constructions agree. This is the proof route for SC.1 once the actual exterior-derivative and bundle APIs are supplied, not a new smoothness field added to IsContactData.

For Gray stability, on a compact manifold solve on ker(alpha_t) the equation

    contraction of d alpha_t with X_t = -dot(alpha_t),

with X_t horizontal. On all tangent vectors it becomes

    dot(alpha_t)+contraction of d alpha_t with X_t = mu_t alpha_t,
    mu_t=dot(alpha_t)(R_t).

Cartan's formula and the time-dependent flow give pullback alpha_t equal to a positive function times alpha_0. Compactness supplies the global flow interval. Nothing here asserts strict equality of the forms or removes the flow hypotheses. The source proof was read, but the generic flow and exterior-calculus implementation and its contact specialization still require declaration-sized nodes.

Regular reduction and toric classification are independent branches from the common symplectic and Lie foundations. They do not depend on the whole contact-isotopy chain. The stage graph below keeps these branches separate. In particular, no source-defined circle action is silently identified with one having the opposite moment sign or a different period.

### SC.1: Smooth contact forms and Reeb dynamics

On finite-dimensional smooth real manifolds without boundary, use the actual smooth one-form alpha and its exterior derivative to impose contactness at each tangent space; prove the equivalent nonvanishing volume criterion in dimension 2n+1. Keep a selected coorientation and its global form explicit. Use SC.0 to construct a smooth Reeb vector field, proving smooth dependence through the restricted nondegenerate bundle map, and its local flow. Prove global existence under compactness or a separately stated completeness hypothesis, not for every Reeb field. Distinguish strict maps from contactomorphisms and prove the nonconstant rescaling formula for nowhere-zero functions; positive functions preserve the chosen coorientation. Pin contact Hamiltonians by alpha(X_H)=H and contraction of d alpha with X_H=(R H)alpha-dH. Construct the actual exact symplectic form d(exp(t)alpha) on R times M and its Liouville vector. Compute dz-sum p_i dq_i, the standard sphere and diagonal ellipsoids, including orbit periods under the displayed normalization. Import smooth symplectic forms, exterior calculus and flows rather than substitute formal tangent data.

### SC.2: Contact normal forms and isotopy

Prove contact Darboux in every odd real dimension using the selected form convention dz-sum p_i dq_i. For a smooth family of cooriented contact structures on a compact boundaryless manifold, prove Gray stability by an isotopy with pullback alpha_t=f_t alpha_0 and f_t positive. Do not strengthen this to preservation of the forms themselves or remove the global flow hypothesis. Prove the neighbourhood theorem for a compact boundaryless embedded Legendrian using J^1L=T*L times R and its dz-lambda form; retain the zero-section identification. Prove compactly supported contact isotopy extension with its neighbourhood and support data. The generic tubular-neighbourhood, smooth-embedding, flow and relative-Moser infrastructure is imported from its owners; only the contact-specific equations and comparisons live here.

### SC.3: Lagrangian neighbourhoods and embeddings

Use the existing symplectic-manifold, cotangent-form and Lagrangian notions. Prove the Weinstein neighbourhood theorem for a compact boundaryless embedded Lagrangian L, with a symplectomorphism between neighbourhoods of its image and of the zero section in T*L respecting that section. Fix lambda_can at a covector by evaluation on the projection differential and omega_can=-d lambda_can. A graph of a smooth one-form is Lagrangian precisely when that form is closed; with a chosen global primitive its graph is exact. Local primitives must not be confused with a global exactness statement. Prove the symplectic-neighbourhood comparison for compact boundaryless symplectic submanifolds with a specified isomorphism of their symplectic normal bundles, and the graph/diagonal test for symplectomorphisms. Reuse Darboux, relative Moser and tubular neighbourhoods. Maslov theory, holomorphic curves and the exact Lagrangian Floer complex remain with HeegaardFloer.

### SC.4: Hamiltonian actions and moment maps

For smooth actions of finite-dimensional real Lie groups on a symplectic manifold, use the actual Lie algebra, exponential and adjoint action. Reuse Hamiltonian fields and flows from the common symplectic substrate. Fix contraction i_XH omega=dH and the bracket {F,G}=omega(X_F,X_G); then X_H(F)={F,H} and [X_F,X_G]=-X_{ {F,G} }. For a left action set xi_M=d/dt at zero of exp(t xi) acting on x. A moment map satisfies d<mu,xi>=i_xi_M omega; a Hamiltonian action also requires coadjoint equivariance with Ad_(g inverse). Existence of component Hamiltonians alone does not imply equivariance. Prove Noether conservation for invariant Hamiltonians, uniqueness of moment maps on a connected manifold up to a coadjoint-invariant constant, cotangent-lift and product constructions. Normalize the circle as R/(2 pi Z): its counterclockwise action on C with dx wedge dy has moment -|z|^2/2. Track all sign and period conversions against the chosen suppliers.

### SC.5: Regular symplectic reduction

For a compact Lie group acting Hamiltonianly with equivariant moment map, assume the zero level is nonempty and the action on it is free. Prove regularity, construct its smooth principal quotient through the generic smooth-quotient interface, and define the unique reduced closed two-form whose pullback is the restricted original form. Prove nondegeneracy by the tangent quotient and the orbit/symplectic-orthogonal identities. Locally free actions produce orbifold issues, not a manifold theorem with the word free omitted. State other moment levels using their stabilizers and the needed regular/free hypotheses separately. Prove reduction in stages for commuting compact actions with both stage quotients free and regular, and compatibility of reduced invariant Hamiltonian flows. Compute the scalar circle reduction of C^(n+1) at moment -c, c>0, including the quotient CP^n and the convention that a projective line has area 2 pi c. The general free proper quotient theorem must be provided, not inferred from the existence of G/H for a closed subgroup.

### SC.6: Hamiltonian tori and convexity

For a compact connected symplectic manifold with a Hamiltonian torus action, prove that moment fibers are connected and the image is the convex hull of the images of the fixed-point components. Build the equivariant local normal form and weight decomposition used by the proof. Component Hamiltonians have Morse-Bott critical sets with even index and coindex; give the handle/level-set topology needed to turn those properties into connectedness rather than cite isolated-point Morse theory as sufficient. State the effective-action dimension bound, isotropic orbits, and the full-dimensional polytope conclusion in the toric case. Fixed components need not be isolated for a general Hamiltonian torus action. Keep the integral lattice and the chosen period normalization fixed; generic convex-set facts and Lie-group representations are imported from their existing theories.

### SC.7: Delzant construction and classification

Classify compact connected 2n-dimensional symplectic manifolds with effective Hamiltonian action of a fixed n-torus and a chosen moment map by their Delzant moment polytopes. The polytope is simple, rational and smooth: the primitive edge or facet-normal data at each vertex are unimodular in the fixed lattice. Support constants are real; vertices are not required to be integral. Construct the manifold by symplectic reduction of C^d using the actual lattice homomorphism and kernel torus, proving freeness from unimodularity, compactness and the exact image. Prove that two such spaces with the same normalized moment polytope are equivariantly symplectomorphic preserving the moment map. Translation enters only when forgetting its additive normalization; integral linear changes enter only with an explicit torus reidentification. Delzant Theorem 2.1 gives the smooth equivariant comparison and Proposition 4.1 provides the symplectic upgrade: both proof phases are targets. Build neither a second generic polytope library nor algebraic toric varieties, and retain the symplectic conclusion rather than stopping at diffeomorphism.

## 7. Sources, ownership and verification boundary

The primary pointwise references are Cannas da Silva, *Lectures on Symplectic Geometry*, the author-hosted January 2006 revision, Sections 10.1 and 11.1–11.2, and Geiges, *Contact geometry*, arXiv:math/0307242v2. The contact rescaling and naturality formulas in this packet are explicit deductions from the Reeb equations and the derivative product rule; they are not presented as newly discovered source errors or as separately numbered results printed in those sources.

The global design uses Cannas da Silva's regular reduction, moment convexity and Delzant chapters and Delzant's original 1988 paper, *Hamiltoniens periodiques et images convexes de l'application moment*. There is an important proof boundary: the original Theorem 2.1 first supplies the equivariant smooth comparison, and its footnote assigns the symplectic upgrade to Proposition 4.1. Both are required by SC.7. Cannas da Silva explicitly limits the Delzant discussion there to the existence direction. The reduction slice argument is a sketch and the convexity proof outline depends on Morse–Bott ingredients and exercises. None of those missing proof steps is promoted to a verified supplier by this design.

Source links and exact inspected passages are in the packet and roadmap source records:

- Cannas da Silva: https://people.math.ethz.ch/~acannas/Papers/lsg.pdf
- Geiges v2: https://arxiv.org/pdf/math/0307242v2
- Delzant: https://numdam.org/item/10.24033/bsmf.2100.pdf

The Cannas da Silva cover and relevant printed pp.58,63,64,145 were visually inspected. Some other passages were parsed-only after image failures. Geiges and the relevant Delzant passages were read as parsed text, not as successfully inspected page images. No fresh PDF-byte hash, publisher-edition comparison or full-book/full-paper audit is claimed. The packet distinguishes passages actually inspected from the remaining neighbourhood, toric-gluing and classification proof work.

The baseline is Tau Ceti f790474821cf4256814db967cb154e7af3d0c369 and Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174. The twelve cited baseline declarations were read at those exact commits, including the form definitions, restriction and pullback, products of covectors, alternation and the full finite-dimensional inverse-dual construction. Their Git blob hashes are in the packet. The separate pinned manifold two-form file was read for its exact boundary: it supplies fiberwise nondegeneracy and expressly does not supply manifold exterior derivative/closedness. The contact application must retain that distinction.

The existing HeegaardFloer, GeometricTopology and LieGroups roadmaps and their atlas stages were consulted for ownership. Targeted code searches and an open Mathlib PR search for contact geometry did not identify a competing contact/Reeb construction, but those are not an exhaustive absence certificate. The oversized aggregate library audit returned no readable content; the available PDE audit excerpt only supported the already-documented shared analytic ownership. It is not treated as an accepted contact-specific audit. No source erratum or author communication is part of this task.

The suggested file gives twenty core node declarations and twenty-one API items, with five named APIs also serving as node lemmas. It additionally gives twenty-one definition/construction tests, three theorem-level regressions and one direct baseline duality-reuse example. The file is **not Lean-compiled**. Proof placeholders are blueprint obligations, not claims of implementation. Actual mathematical data in the new definitions are given explicitly; no opaque proposition stores the Reeb theorem, rescaling formula or smooth-manifold conclusion.

The handoff records exact local rational tests, structural checks and publication hashes. Those tests supplement the written proofs; they do not prove a statement for every vector space, establish smoothness, or certify elaboration. No local full-repository validator or whole-atlas cycle check is claimed. The published submission must pass the repository's actual checks, and their observed result belongs in the PR conversation.

## 8. Continuation and acceptance of the new design

First elaborate the contact prefix on the existing carriers and reconcile its names with any library changes after the pinned snapshot. The pointwise construction must be tested before adding the actual exterior-derivative and smooth Reeb-field bridge. Retain the one-dimensional and negative-coorientation tests and the nonconstant-rescaling counterexample. They expose different errors and are not interchangeable.

Next close SC.1's smoothness and exterior-calculus interfaces with the existing owner. Read and decompose the neighbourhood proofs before turning SC.2 and SC.3 into implementation-ready packets. Keep the shared symplectic foundation in HeegaardFloer; do not move it merely because this roadmap consumes it.

For the independent Hamiltonian branch, verify the sign and period adapters, assign the genuine generic smooth free-action quotient and Morse–Bott topology interfaces, and only then source-decompose the global reduction and convexity proofs. Keep free versus locally free, connected versus disconnected, and fixed versus renormalized moment maps distinct. In SC.7 complete both the toric construction and the symplectic uniqueness upgrade, with real support constants and the actual integral lattice. A diagram or a smooth classification statement alone is not the endpoint.

This checkpoint remains a partial design and pointwise proof specification until those source, supplier and elaboration obligations are actually completed.
