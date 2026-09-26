# Analytic toric geometry, Part II: arithmetic toroidal compactifications

**First prerequisite:** the unchanged [Analytic toric geometry](https://github.com/CBirkbeck/tauceti-explorer/blob/main/content/tau-ceti/AnalyticToricGeometry/README.md) roadmap, `tauceti:TauCetiRoadmap/AnalyticToricGeometry`.

**Part C0; status: partial.** The scope is C0, C1, C2, C2.general, C3, C3.general, C4 and C5. C6 belongs to the other part. This specification has twelve C0 declarations and five C5 declarations. The C0 strand gives integral coefficient algebra and relative torus charts; the C5 strand applies their ordinary coordinate descriptions to the actual neat PEL boundary. The construction of that PEL model, its non-neat descent and the remaining eight-stage targets are not declared complete.

The accepted RS-32 boundary is binding. The anchor owns the common lattice, cone, dual-monoid, finite-fan and finite-complex toric constructions. This extension changes the coefficient base and relative torsor setting, and supplies arithmetic-admissible cone systems, arithmetic quotients and their compactifications. Finitely many cone orbits does not make a fan finite. Relative properness, degeneration, canonical descent and coefficient-specific cohomology are not consequences of the finite-complex theorems. C4 builds on the local Raynaud theory owned by R11.3 rather than duplicating it.

## 1. Conventions and dependency order

For the coefficient algebra, let R be a commutative ring and P an additive commutative monoid. The notation R[P] means Mathlib's existing `AddMonoidAlgebra R P`. An element is a finite monomial sum; its coefficient family is the existing `coeff` field. Write e_p for the unit-coefficient monomial of degree p. The zero ring and nonreduced coefficient rings are included.

For the relative geometry, let H be a **split torus** over a scheme Z and let T → Z be a right H-torsor. Algebraic-space bases use their actual étale atlases and descent. The character lattice M is finite free; the cocharacter lattice is its integral dual. Use the common closed rational polyhedral salient cone σ and the existing additive monoid

\[
P_\sigma=\{m\in M:\langle m,v\rangle\geq0\text{ for all }v\in\sigma\}.
\]

Lan's cone convention is relatively open. His nonnegative character monoid agrees with the one for its closure. When comparing strictly positive character degrees, use the relative interior of the closed cone, not every point of a set containing the origin. For the zero cone the nonnegative monoid is all of M and the strictly positive part is empty.

A right translation by h acts on a weight-m function through multiplication by m(h). Let L_m be the corresponding invertible subsheaf of the actual pushforward of O_T. The identifications L_0 ≅ O_Z and the multiplication maps

\[
L_m\otimes L_n\longrightarrow L_{m+n}
\]

are inherited from the torsor algebra and are isomorphisms. Their associativity, symmetry and unit compatibility are retained. A family of line bundles without these coherent multiplication maps is not the input. Lan's Remark 6.1.2.2 is relevant precisely because one cannot freely choose incompatible rigidifications.

The ordinary relative chart construction is generic in T. It consumes the torsor/descent interface of SF.1 and the relative-Spec interface of SF.0. **It does not import C4.** C4 instantiates this construction with its actual cusp torsors. Thus the direction remains generic foundations → C0 → C4/early C5. The PEL component detector belongs to SF.2 after proper coherent cohomology, and feeds early C5, then B5. There is no reverse B5 dependency.

## 2. Face restriction in the existing monoid algebra

### 2.1 The face projection

**Node:** `C0/face-projection`. **Declaration:** `AddMonoidAlgebra.faceProjection`.

Let F be an existing additive submonoid of P satisfying the explicit face condition

\[
a+b\in F\quad\Longleftrightarrow\quad a\in F\text{ and }b\in F.
\]

Define the R-algebra homomorphism

\[
\pi_{R,F}:R[P]\longrightarrow R[F],\qquad
r e_p\longmapsto
\begin{cases}r e_p,&p\in F,\\0,&p\notin F.\end{cases}
\]

The subtype is retained in the target degree. This is coefficient restriction, not the augmentation that sends every e_p to one. It neither reduces R nor discards invertible character directions.

The underlying additive restriction already exists at the pin as `comapDomain` along the injective inclusion F → P. Reuse it. To prove multiplicativity, reduce by finite bilinearity to two monomials. The product e_a e_b survives restriction exactly when a+b lies in F, which by the face condition is exactly when both factors survive. In the surviving case, subtype addition agrees with addition in P. Since zero belongs to F, the unit and every scalar are preserved. Alternatively, the monomial-or-zero map is a multiplicative map from `Multiplicative P`, so the pinned `AddMonoidAlgebra.lift` packages it; its monomial formula proves agreement with `comapDomain`. No cancellation or domain hypothesis on P or R is needed.

The face hypothesis is substantive. Restriction to the even submonoid of the nonnegative integers is additive but not multiplicative: e_1 is killed, while its square e_2 is retained. The theorem does not silently apply to an arbitrary additive submonoid.

**API.** `faceProjection_eq_comapDomain` identifies the underlying operation with the native coefficient restriction. `faceProjection_single_mem` and `faceProjection_single_not_mem` give the two monomial rules. `faceProjection_coeff`, `faceProjection_comp_inclusion` and `faceProjection_coefficient_change` are promoted to their own dependency nodes below. Additivity, scalar linearity and multiplication laws travel in the existing `AlgHom` type instead of a parallel structure.

**Definition tests.** All names below are in the `AddMonoidAlgebra` namespace.

| Test | Required statement |
|---|---|
| `faceProjection_zero_test` | The zero polynomial maps to zero. |
| `faceProjection_positive_test` | Over Z/4, with P = N and F = {0}, the monomial e_1 maps to zero. |
| `faceProjection_nilpotent_test` | In the same example, the zero-degree coefficient of the image of 2e_0 is 2, which is nonzero. |
| `faceProjection_laurent_test` | Over Z, with P = Z and F = P, the image of e_−1 retains coefficient one in degree −1. |

Together the last three reject augmentation, reduction of the coefficient base, and deletion of Laurent directions.

### 2.2 Coefficients and the inclusion section

**Nodes:** `C0/face-projection-coeff` and `C0/face-projection-section`.

For m ∈ F and f ∈ R[P],

\[
\operatorname{coeff}_m(\pi_{R,F}(f))=\operatorname{coeff}_m(f).
\]

This is evaluation of the existing coefficient restriction at a subtype element. There is no summation over several different degrees, because the inclusion is injective.

Let i_F:R[F] → R[P] be the existing degree-map algebra homomorphism induced by that inclusion. On a coefficient monomial it simply forgets the subtype proof. The coefficient formula therefore gives

\[
\pi_{R,F}\circ i_F=\mathrm{id}_{R[F]}.
\]

This constructs an actual right inverse and proves surjectivity of π. It does not merely prove that a nonempty fiber exists. These two lemmas are separate nodes because the kernel, quotient and coefficient-change proofs use them. Their signatures use the native `mapDomainAlgHom` rather than a new inclusion carrier.

### 2.3 The actual ideal, not its radical

**Node:** `C0/face-projection-kernel`. **Declaration:** `AddMonoidAlgebra.ker_faceProjection`.

Put

\[
J_F=(e_p:p\notin F)\subseteq R[P],
\]

using the existing `Ideal.span`. Then

\[
\ker\pi_{R,F}=J_F.
\]

Every off-face generating monomial is killed, giving one inclusion. Conversely, the coefficient formula says that an element of the kernel has zero coefficients in every F-degree. Its finite monomial expansion therefore expresses it as a sum of scalar multiples of the indicated off-face generators. This gives the reverse inclusion and the coefficient characterization of membership in J_F.

No radical is taken. Over R = Z/4, the positive-degree ideal in R[N] does not contain 2e_0; its quotient retains the nonzero nilpotent scalar. For F = P the generating set is empty and J_F is zero. These cases continue to make sense for the zero ring.

### 2.4 The quotient equivalence

**Node:** `C0/face-quotient`. **Declaration:** `AddMonoidAlgebra.faceQuotientEquiv`.

Construct the canonical R-algebra equivalence

\[
R[P]/J_F\;\simeq_R\;R[F]
\]

whose value on the quotient class of f is π(f). Apply the pinned `Ideal.quotientKerAlgEquivOfRightInverse` using the inclusion section, then transport the quotient along the proved identity ker π = J_F. The generic first isomorphism theorem is already present and is not replanned. The new construction pins down the equivalence for this specified monomial ideal.

**API.** `faceQuotientEquiv_mk` gives the quotient-map formula. `faceQuotientEquiv_symm_single` sends a retained monomial to its original quotient class. `faceQuotientEquiv_coeff` reads retained coefficients from a representative. `faceQuotient_mk_eq_iff` says that two quotient classes coincide exactly when their representatives agree in every F-degree. This last theorem explicitly retains the face hypothesis even though it does not occur syntactically in the displayed ideal expression.

**Definition tests.** The namespace is again `AddMonoidAlgebra`.

| Test | Required statement |
|---|---|
| `faceQuotient_zero_test` | The class of zero maps to zero. |
| `faceQuotient_positive_test` | Over Z/4, for N and its zero face, the class of e_1 maps to zero. |
| `faceQuotient_nilpotent_test` | The image of the class of 2e_0 has zero-degree coefficient 2, not zero. |
| `faceQuotient_laurent_test` | For Z as both coefficient ring and degree group with the whole face, the class of e_−1 retains its degree −1 coefficient. |

The quotient carrier is the existing ideal quotient. No separate “toric quotient” type is introduced.

### 2.5 Arbitrary coefficient change

**Nodes:** `C0/face-projection-coefficient-change` and `C0/face-kernel-coefficient-change`.

For every unital ring homomorphism φ:R → S, let φ_P and φ_F be the existing monoid-algebra coefficient maps. Then

\[
\varphi_F\circ\pi_{R,F}=\pi_{S,F}\circ\varphi_P.
\]

Each coefficient map sends r e_p to φ(r)e_p. Both sides therefore agree on monomials, including the killed degrees, and finite additivity proves the equality. The Lean signature is an equality of **ring homomorphisms**: it does not silently identify an R-algebra homomorphism with an S-algebra homomorphism.

There is also the ideal-extension identity

\[
J_F\,S[P]=\ker\pi_{S,F}.
\]

Indeed, the image of each unit-coefficient generator e_p is the same e_p, since φ(1)=1. Extension of the ideal generated by a set is generated by its image. Rewriting the two kernels by the monomial-ideal theorem gives the result. There is no flatness, injectivity or surjectivity condition on φ.

This is **extension**, not contraction of the kernel. A retained coefficient may become zero under φ, so the preimage of the new kernel can be larger than the old kernel. The ideal-extension theorem must not be restated as equality of those preimages. The map Z/4 → Z/2 is a useful nonflat test of both distinctions.

Combining the quotient equivalences with this naturality gives the usual coefficient-base-change comparison of the specified stratum quotient. The monoid algebras have their ordinary free monomial bases; no completed algebra or inverse limit is involved. Nothing here says that arbitrary kernels commute with tensoring, or that tensoring commutes with an infinite product or completion.

## 3. Relative integral charts

### 3.1 Construct the embedding from the torsor algebra

**Node:** `C0/relative-torus-embedding`. **Declaration:** `TauCeti.Toric.Relative.torusEmbedding`.

With the conventions of section 1, form the quasi-coherent subalgebra

\[
\mathcal A_\sigma=\bigoplus_{m\in P_\sigma}L_m
\subseteq p_*\mathcal O_T,
\qquad T(\sigma)=\operatorname{Spec}_Z\mathcal A_\sigma.
\]

Closure of P_σ under addition and the inherited multiplication make this an algebra. The generic relative-Spec universal property and base-change theorem belong to SF.0. The actual character-line grading, its multiplication and its torsor comparison belong to the generic torsor/descent interface in SF.1. The C0 task applies them to the nonnegative-character subalgebra; it does not introduce another generic relative-Spec or torsor definition.

Trivialize a basis of character lines on a cover of Z, compatibly with the given torsor. There the algebra is O_Z[P_σ], not an arbitrary algebra with the same rank. If local torsor sections satisfy t_β = t_α g_αβ, a point written t = t_α h_α = t_β h_β satisfies h_α = g_αβ h_β. Hence the corresponding weight-m coordinate functions satisfy

\[
q_{\beta,m}=m(g_{\alpha\beta})^{-1}q_{\alpha,m}.
\]

These unit transitions are the actual cocycle. They preserve the multiplication, every homogeneous ideal used below and the torus action. Pullback preserves the character lines and direct sums, so the relative-Spec comparison descends after any base change. On the zero cone the algebra is the entire torsor algebra and the embedding is T itself.

**API.** In namespace `TauCeti.Toric.Relative`, `embedding_trivialization` gives the actual local monoid-algebra spectrum; `embedding_baseChange` carries identity and composition compatibility; `embedding_torusAction` extends the given action; `embedding_zeroCone` recovers T; and `embedding_changeTrivialization` records the displayed unit formula with its multiplicative and ideal compatibilities.

**Definition tests.**

| Test | Required statement |
|---|---|
| `embedding_rankOne_test` | A trivial G_m-torsor and positive ray give A¹_Z with its usual G_m open. |
| `embedding_zeroCone_test` | The zero-cone construction recovers the supplied torsor even when that torsor is not trivial. |
| `embedding_lineDual_test` | If L is the weight-one function line, the positive-ray construction is Spec_Z Sym(L), namely V(L dual) under V(E) = Spec Sym(E dual). It is not V(L) with these conventions. |
| `embedding_nilpotentBase_test` | Over Z/4 the rank-one chart is (Z/4)[q], and restriction at q=0 retains 2. |

A nontrivial character line need not have a global monomial generator. The definition and all transition maps must remain meaningful without choosing one globally.

### 3.2 Ordinary face localizations

**Node:** `C0/relative-face-open`. **Declaration:** `TauCeti.Toric.Relative.faceOpenImmersion`.

For a face τ of σ, construct an equivariant open immersion T(τ) → T(σ). The common toric supplier provides an integral character m ∈ P_σ exposing τ and the identity

\[
P_\tau=P_\sigma+\mathbb N(-m).
\]

On a trivialization, the induced algebra map is localization of R[P_σ] at e_m. Its universal property says that a character algebra map extends exactly when e_m becomes invertible. Relative Spec therefore gives a principal open. On overlaps the local equation changes by a unit, so these opens and their maps agree and descend.

Identity, composition and common-face overlap formulas are verified on the same character maps. They are compatible with the unchanged finite-complex chart formulas. The quadrant and its first-coordinate ray give the elementary test: the face chart inverts the second coordinate.

This is an **ordinary** open-immersion theorem. An open immersion does not by itself provide a morphism between completions taken along different stratum ideals. In particular, no previously rejected direct-completion shortcut is reintroduced. Completion maps require their own ideal-containment and continuity data.

### 3.3 Regular coordinates over the actual base ring

**Node:** `C0/relative-regular-coordinates`. **Declaration:** `TauCeti.Toric.Relative.regularCoordinateIso`.

Suppose σ has dimension r in a rank-n cocharacter lattice and is regular. Choose an integral basis extending its primitive ray generators and a multiplication-compatible local torsor trivialization. The anchor's intrinsic dual-monoid equivalence gives

\[
P_\sigma\simeq\mathbb N^r\times\mathbb Z^{n-r}.
\]

Apply the existing monoid-algebra congruence induced by this degree equivalence. Its coefficient ring is arbitrary already; this generic operation is not a new C0 construction. It identifies the actual local algebra with

\[
R[x_1,\ldots,x_r,y_1^{\pm1},\ldots,y_{n-r}^{\pm1}].
\]

The isomorphism takes each character monomial to its exponent monomial, and relative Spec supplies the corresponding scheme isomorphism over the local base. The product-monoid interpretation and the polynomial/Laurent interpretation are compared through their generators and universal properties, not through an unexplained equality of carriers.

A change of primitive basis induces the corresponding monomial change, and a change of torsor trivialization introduces the character units above. The global embedding is defined before these choices, so no basis becomes part of its definition.

Regularity is stronger than simpliciality. The cone with primitive rays (1,0) and (1,2) is simplicial but those rays do not extend to an integral basis. It is not a permitted input to this regular-coordinate theorem. A full rank-two regular cone gives R[x₁,x₂], a rank-one cone in rank two gives R[x₁,y±¹], and the zero cone gives the split torus rather than affine space.

The split-torus hypothesis is also retained. A split group of multiplicative type with torsion in its character group can have nonsmooth fibers in the relevant characteristic. The present smooth-coordinate theorem is not exported for such a group by simply calling it split.

### 3.4 Scheme-theoretic relative strata

**Node:** `C0/relative-stratum-quotient`. **Declaration:** `TauCeti.Toric.Relative.stratumQuotientIso`.

Set F_σ = M ∩ σ⊥. Nonnegative character evaluations show that a+b vanishes on σ if and only if both a and b vanish there, so F_σ is a face of P_σ. In this case it is a saturated subgroup of M. Apply the face projection on a trivialized chart. It gives the quotient algebra R[F_σ], with kernel the sum of the off-face character lines.

The actual character-unit transitions preserve this projection and its ideal, so the affine comparisons descend. The relative closed stratum is

\[
\operatorname{Spec}_Z\left(\bigoplus_{m\in F_\sigma}L_m\right).
\]

With the inherited multiplication, this is the pushout of the original torsor along the quotient torus whose character lattice is F_σ. SF.1 supplies that generic torsor/graded-algebra comparison. A separate unrelated torsor whose points happen to have the expected form would not suffice.

The homogeneous ideal and quotient commute with arbitrary base change by the coefficient-algebra theorem and relative-Spec comparison. This is a **scheme-theoretic relative stratum**. Under suitable reducedness hypotheses it agrees with the reduced-complement description used in the source. Such an identification is not transported through an arbitrary nonreduced base change by taking reductions: over Z/4 the full-ray stratum is Spec(Z/4), not Spec(Z/2).

The zero cone retains the whole torsor. A full positive ray in rank one has stratum Z. A rank-one cone in rank two retains a rank-one torus direction. These tests fix the orthogonal character subgroup, not merely the dimension of an unspecified stratum.

### 3.5 Boundary intersections and exact opens

**Node:** `C0/relative-boundary-coordinates`. **Declaration:** `TauCeti.Toric.Relative.boundaryCoordinateIso`.

In the regular coordinates above, let J be a subset of the r polynomial-coordinate indices. The degrees whose J coordinates vanish form a face submonoid. Its off-face monomial ideal is exactly (x_j:j∈J), since an off-face monomial contains at least one selected variable. The face-quotient theorem therefore identifies the scheme-theoretic coordinate intersection with

\[
R[x_i:i\notin J,\ y_1^{\pm1},\ldots,y_{n-r}^{\pm1}].
\]

The exact boundary open removes the remaining coordinate divisors. It is the localization at f = ∏_{i∉J}x_i. Multiplication by f shifts the exponent basis injectively, even when R is nonreduced. The same calculation holds after every coefficient change. Thus the localization map, and its restrictions to affine opens, is injective: the exact open is universally schematically dense.

For an elementary topological check, if a nonempty principal open D(g) were disjoint from D(f), then gf would be nilpotent. Some power of f times the corresponding power of g would be zero. Injectivity of multiplication by powers of f would force g to be nilpotent, contradicting nonemptiness of D(g). This proves density without counting rational points or assuming that R is a field.

Polynomial algebras and their Laurent localizations are smooth over R, so every coordinate intersection is smooth over the local cusp base. Smoothness over the arithmetic base requires that cusp base to be smooth over it as well. These statements descend using the actual ordinary étale charts. A global arithmetic quotient still needs C5's branch separation and label preservation; a coordinate proof does not supply them.

For a quadrant the three choices of J give the plane, a line and the base. If all boundary coordinates are selected, the complementary product is one and the exact open is the whole intersection. The ideal over Z/4 continues to retain the coefficient 2. Over a finite field the density assertion concerns the scheme, not the number of rational points.

## 4. The retained neat PEL boundary argument

### 4.1 Actual model, charts and hypotheses

Use Lan's actual algebraic space X = M_H,Σ^tor, defined as the quotient of the constructed étale groupoid in 6.3.3.15 of the author revision of 14 March 2021. The base B = Spec R is the indicated regular Noetherian localization of the reflex integers, or its specified field version. Retain the PEL hypotheses of 1.4.1.2 and Condition 1.4.3.10, including the maximal-order extension of the lattice action. PELModuli M2 supplies the exact good-prime and level restrictions; these are not replaced by saying that a prime is large.

Require neat H and compatible admissible smooth cone decompositions satisfying 6.3.3.4, including Condition 6.2.5.25. These are the hypotheses for separating boundary branches. The model is smooth and proper over B at this level. Its construction, universal family, ordinary charts and properness remain source-theorem construction obligations, not properties stored in a substitute record. No scheme realization, ample line bundle or integral minimal compactification is assumed.

Definition 6.3.2.5 gives an ordinary stratification-preserving **étale** map from a good algebraic model to the relative torus embedding. Proposition 6.3.2.6 supplies such neighborhoods, and 6.3.2.16 identifies their face labels. The finite assembly uses 6.3.3.1–6.3.3.4; the relation and descent in 6.3.3.14–6.3.3.16 preserve equivalence classes of stratum labels. The neat no-self-intersection conclusion occurs in 6.4.1.1(3).

Known errata 61 and 72 preserve the finite-type étaleness requirements: formal étaleness alone is not enough. Errata 71 and 74 preserve the actual torus-torsor/abelian-torsor/stack base and equivalence-class labels. The relative C0 construction supplies ordinary chart algebra, but not the approximation and groupoid theorems that connect those charts to X.

Let D_i be the finite family of irreducible components of the reduced boundary. Define D_J as their scheme-theoretic intersection, with D_empty = X, and D_J° by removing the D_i for i outside J. These are actual closed and open subspaces of X, not a new stratification. Each labelled stratum may have several irreducible components; keep them separate.

### 4.2 Smooth intersections and fiberwise density

**Retained nodes:** `C5/neat-boundary-intersection-smooth` and `C5/neat-boundary-open-fiberwise-dense`.

Every D_J → B is smooth, possibly empty or disconnected. Pull to the actual ordinary relative chart and apply the C0 regular-coordinate and boundary-ideal comparisons. Neat branch separation identifies distinct global boundary components through the point with distinct coordinate hyperplanes; after shrinking, components not through the point are absent. Quotienting by the selected variables gives another smooth polynomial/Laurent chart. The actual cusp base is smooth over B by C4 and lower-dimensional M2. Composition and étale descent give the claimed relative smoothness.

The word “regular” in the absolute scheme criterion of Stacks 41.21.2 is not silently interpreted as smooth over B. The ordinary arithmetic-base coordinates provide that stronger conclusion.

After any geometric base change, the exact open is the coordinate localization from section 3.5 and is dense. Pull this open back through the étale chart maps: inverse images of dense opens under open maps are dense, because a nonempty source open has nonempty open image meeting the given dense open. Descend along the jointly surjective cover and restrict to an open-and-closed component as needed. Extension from a residue field to its algebraic closure is surjective, so the geometric-fiber assertion also implies the ordinary residue-fiber assertion.

The quadrant tests give plane, line and base. A disconnected intersection remains smooth and is not renamed a single stratum. An irreducible nodal divisor is a warning against dropping branch separation; this is a generic counterexample, not a claimed PEL example. Over a DVR, deleting the closed fiber from a whole boundary section gives Spec R[1/π], dense in the total section but absent from the closed fiber. Thus arbitrary total-space density cannot replace the relative coordinate argument.

### 4.3 Recover the labelled stratum component

**Retained node:** `C5/neat-stratum-closure-component`.

For a nonempty irreducible component Z₀ of a labelled stratum, let J be the set of global boundary components containing it. There is a unique connected component W of D_J such that

\[
Z_0=W\cap D_J^\circ.
\]

Its reduced closure in X is W.

The source closure/incidence theorem makes each D_i a union of stratum components. Hence Z₀ lies wholly inside or outside each D_i and belongs to the indicated exact-pattern open. On an ordinary regular relative chart, a zero/nonzero coordinate pattern is a face-orbit stratum. The C0 quotient and face-open maps describe this pattern; the good algebraic models preserve its labels, and the two groupoid projections preserve their equivalence classes. Each labelled subset in D_J° is therefore open, as the image of its appropriate étale chart. Its complement is a union of the other open label subsets.

Each labelled stratum is smooth over the regular base, hence regular, and its irreducible components are open and closed. Thus D_J° is partitioned into open-and-closed stratum components. An arbitrary refinement of a stratification would not have this property; the actual labels and quotient maps are essential.

The regular Noetherian space D_J has irreducible, open-and-closed connected components. Each nonempty W meets D_J° in a nonempty dense open, which is irreducible. That open cannot meet two pieces of an open-and-closed partition. Conversely connected Z₀ belongs to one W. This proves the equality and uniqueness. W is already closed in X and reduced, so it is the reduced closure with its actual subspace structure.

For a disconnected-intersection test, over a base where 2 is invertible the divisors w=1 and w=z² in P¹_z × P¹_w meet in the two disjoint sections z=1 and z=−1. The whole intersection is not the closure of one zero-dimensional stratum component. When J is empty the statement includes components of the open moduli stratum; it does not create a cusp when the boundary is empty.

### 4.4 Proper closures without positivity

**Retained node:** `C5/neat-stratum-closure-proper`.

The W above is proper over B. It is an open-and-closed component of D_J, which is a closed subspace of X, so W → X is a closed immersion. Compose with the actual proper toroidal structural map. Smoothness follows from section 4.2, and the exact stratum open is dense in every geometric fiber of W.

No Hodge positivity, projectivity, scheme realization or minimal compactification enters this proof. A whole boundary section of P¹_B is proper; deleting its special fiber does not produce the required closure. Separate components of a boundary intersection give separate proper closures, not an assertion that all their fibers are geometrically connected. The algebraic-space case is retained throughout.

### 4.5 Detect every geometric-fiber component

**Retained node:** `C5/neat-strata-detect-geometric-components`.

If finitely many nonempty labelled strata meet every irreducible component of X, their base changes meet every irreducible component of each geometric fiber X_b. Split the selected strata into their finitely many irreducible components and use the previous results to obtain smooth proper closed W_a with opens Z_a dense in every geometric fiber.

Apply the generic detector assigned to SF.2 after SF.1's algebraic spaces and proper coherent cohomology. Its exact input is a smooth proper X over a regular Noetherian base, together with such W_a and Z_a detecting total components. The proof uses the arithmetic-base Stein factor X → E → B. Here E is finite étale and X → E is proper and surjective with connected geometric fibers, using Stacks 76.36.1, 76.36.4 and 76.36.9.

Each W_a → E is proper. It is also smooth: its graph in W_a ×_B E is a section of an étale separated morphism, hence open, and the projection to E is smooth. Therefore its image is open and closed. Regularity identifies connected and irreducible components. Properness and connected fibers identify the component sets of X and E: a disconnected inverse image of a connected component of E would give a disjoint closed partition of that component. The total-component hypothesis consequently makes the images of the W_a cover E.

Over a geometric point b, the points of the finite discrete E_b index the connected regular, hence irreducible, components of X_b. A corresponding nonempty fiber in some W_a is open and closed in W_a,b, so fiberwise density of Z_a,b reaches it. The argument uses the geometric fibers of the given factorization, not an unproved assertion that all Stein factor formation commutes with nonflat base change.

This provides the neat-level residue-component premise for B5's prime-quotient Fourier–Jacobi argument. Coefficient comparison on completed charts and arbitrary-coefficient dévissage remain separate. A connected finite étale E can have several points in a geometric fiber, all of which must be reached. Two disjoint proper smooth curves with strata on just one component fail the hypothesis. Non-neat levels are not included by simply taking a neat cover: coverage on every lifted component and descent must be proved, and toroidal level maps need not be étale at the boundary. No averaging by a stabilizer order is used.

## 5. Retained scope, sources and acceptance

C0 still owns arithmetic cone actions, finite-orbit and positivity-domain local-finiteness conditions, compatible cusp supports, common and smooth/projective refinement existence, and the qualified relative/arithmetic support-properness theorem. The ordinary relative chart strand is not all of that stage. In particular an infinite family of cones containing zero is not locally finite near zero merely because the orbit set is finite.

C1 retains V2's rational boundary components and the existing mixed-Hodge vocabulary, and constructs the additional mixed data, positivity cones, labels, full stabilizers, transports and actual torsors/finite covers. C2/C2.general retain arithmetic transition, separation, quotient/gluing, normality/properness, projectivity for the required fan and canonical descent, with V8.general in the general-data case. There is no universal abelian scheme for generic pure Shimura data.

C3/C3.general retain arithmetic refinement and Hecke extensions with compatible fans, identity/composition and common-refinement comparisons. Degree-zero structure-sheaf pushforward and coefficient-specific higher direct images are separate targets. One fixed fan is not assumed stable under all Hecke maps. C4 imports local Raynaud/polarized lattice uniformization from R11.3 and adds relative cusp effectivity, algebraization, biextensions, degeneration data and endomorphism/level compatibility. Its dimension-one comparison distinguishes the invariant relative differential du/u from the base differential dq/q and retains ramification at p-power cusps.

C5 still needs complete construction chains for the good algebraic models, the actual étale relation and effective quotient, the universal family, completed charts and valuative properness. The natural embedding of a good algebraic base into its completion must not be identified without proof with the separate family-induced embedding in the source good-model definition. The non-neat branch/stack argument, Hodge positivity, section finite generation, minimal projectivity, open quasi-projectivity, higher-p-level normalizations and height outputs remain required.

The early toroidal and late minimal exports of C5 must be separated before whole-stage dependency promotion: the latter consumes B5 constant terms. The arithmetic-base Stein factor used here is not the Shimura minimal compactification. The packet keeps current stage identifiers and the split proposal; it makes no full-atlas acyclicity claim.

Primary text is [Lan's author revision dated 14 March 2021](https://www.kwlan.org/articles/cpt-PEL-type-thesis-revision.pdf), especially 6.1.1–6.1.2 for the relative torus algebra and the precise ordinary-chart/quotient passages cited above. The [author-hosted errata](https://www.kwlan.org/articles/cpt-PEL-type-book-pup-err.pdf) supply the retained finite-type, stack and label corrections. [Stacks 0CBN](https://stacks.math.columbia.edu/tag/0CBN) is the absolute normal-crossings comparison; [0A18](https://stacks.math.columbia.edu/tag/0A18), including [0E0D](https://stacks.math.columbia.edu/tag/0E0D), supplies the algebraic-space Stein inputs. The explicit general face-algebra and exact-pattern deductions are not attributed to separately numbered theorems in those texts.

The source-version and viewing ledger is in the packet and handoff. No publisher-edition comparison or new version-of-record error allegation is made. Relative quotient formulas under nonreduced base change and the initial multiplicative-type generality are not conflated with unrestricted reduction or smoothness statements. Further source-generality and collation work is listed as a gap.

The suggested file has native signatures for the seven coefficient-algebra nodes, ten algebra API statements (including promoted ones), and eight algebra examples. It preserves the three baseline specialization examples. The five relative geometric signatures, their five API items and four tests, and the five C5 signatures remain explicitly unstated until real pinned-compatible geometric carriers are supplied. Named omissions are not elaborated declarations.

Acceptance separates four checks: the mathematical proofs with their stated hypotheses; finite-support algebra regressions; structural validation of the packet and its named references; and Lean elaboration. None substitutes for another. The handoff and PR record which checks were actually run.
