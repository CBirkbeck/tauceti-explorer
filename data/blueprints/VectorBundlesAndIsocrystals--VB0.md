# Isocrystals, vector bundles and geometric classification

This document develops VB0, VB1 and the two children of VB2 in **Isocrystals,
vector bundles and Banach–Colmez spaces**. Its endpoint is a classification of
bundles and coherent sheaves on the Fargues–Fontaine curve at a geometric point,
together with its finite étale coefficient-algebra theorem. The development
also proves positive-twist generation, algebraization and the ampleness
criteria used by the relative theory. It builds on the period spaces and
rank-one twists supplied by **Relative Fargues–Fontaine curves**, rather than
constructing those spaces again.

The plan contains 51 target-level nodes. Each has an exact statement, a proof
route and direct inputs; each new definition or construction has an API and
discriminating examples. All five scoped stages are **planned**. None is
**closed**: seven named proof or integration gaps and fifteen supplier
contracts delimit the outstanding refinements. These are mathematical plans,
and no declaration is claimed implemented. The suggested file is a collection
of signatures, not the roadmap; this document and the packet are definitive.

## Conventions and boundary

Fix a nonarchimedean local field E with residue field F_q and uniformizer π.
The coefficient field L is the completion of its maximal unramified extension.
In mixed characteristic it is W_{O_E}(bar F_q)[1/π]; in equal characteristic it
is bar F_q((π)). The inversion is essential: the integral Witt ring is not
the scalar field of finite-dimensional isocrystals. Write σ for the lift of
**arithmetic q-Frobenius**, fixing E and π. The coefficient embedding, E and σ
are part of the data. An unramified extension of E of degree f may identify
the completed coefficient fields, but changes the designated automorphism to
σ^f.

An isocrystal D has an invertible σ-semilinear Frobenius Φ. With basis
e_0,…,e_{r−1}, the standard block D(s,r) satisfies

\[
 \Phi(e_i)=e_{i+1}\quad(i<r-1),\qquad
 \Phi(e_{r-1})=\pi^s e_0,\qquad
 \Phi^r=\pi^s\sigma^r.
\]

Its isocrystal slope is s/r. Fix k=bar F_q. Over a perfectoid S with a
specified k-structure, our covariant bundle functor sends it to O(−s/r).
For λ=d/h in lowest terms with h>0, the standard O(λ) is defined over F_q
by cyclic matrix descent with wrap coefficient π^{−d}; over k it agrees
with the image of D(−d,h). Its rank is h. The geometric degree computation
gives degree d: O(1/2) has rank two and degree one, while D(1,2) gives
O(−1/2) after the coefficient embedding is fixed. Fargues–Fontaine’s M(d,h)
uses the same π^{−d} cyclic matrix.

The division algebra indexed by a **bundle** slope λ=d/h is

\[
 D_\lambda=E_h[\Pi],\qquad
 \Pi^h=\pi^d,\qquad \Pi x=\sigma(x)\Pi,
\]

where E_h/E is unramified of degree h. Its arithmetic Brauer invariant is
λ modulo Z. Consequently the endomorphism division algebra of an isocrystal
of slope a has invariant −a. Using geometric Frobenius or exchanging the
cyclic generator with its inverse changes the sign; the comparison with the
Class field theory invariant fixes this choice.

For a geometric point, C is a complete algebraically closed perfectoid field
of characteristic p containing F_q. Degree is the integer degree of a
determinant line bundle, not a relative degree function on all perfectoid
bases. The slope deg(V)/rank(V) is defined for nonzero bundles. The zero
bundle has rank and degree zero, the empty HN filtration and no finite slope.
Fixed-slope categories include zero as a separate object.

The classification is geometric. After choosing k→C, the functor from
isocrystals induces a bijection on isomorphism classes of bundles on X_C;
it does not classify all relative bundles over an arbitrary perfectoid S.
It is also not fully
faithful on all morphisms: Hom_Φ(D(0,1),D(−1,1)) is zero, whereas
Hom(O,O(1)) is the nonzero positive-twist section space. Its endomorphism
map on one simple block is nevertheless an isomorphism of division algebras.

VB3 owns Banach–Colmez spaces, their two-term hypercohomology definition,
Lubin–Tate covers, fundamental exact sequences, projectivized properness and
abstract positive resolutions. This part supplies the curve cohomology
complex and uses the early basic examples. It does not define a
Banach–Colmez space as a cokernel. VB4 owns relative HN strata, family
trivialization, slope-zero local systems and the relative vanishings of
FS II.3.4. Their proofs cannot be inputs to early twist cohomology.
Filtered isocrystals, G-isocrystals, B(G), G-bundles, Satake and the
Weil-map construction belong to their existing consumers.

## The order that makes the proofs possible

The accepted RS-15 and RS-20 boundaries, together with the confirmed
RT-AREA-padic-1/21 finding, prescribe the following order. The distinction
between a partial chart map and a global map is a proof obligation.

| Step | Objects and results | What it supplies |
| --- | --- | --- |
| RF3 | Rank-one O(n), their sign and divisor laws; P and maps D(g)→D_+(g) | Homogeneous charts on the union of nonvanishing loci |
| VB1 analytic prefix | Bundles, annular/Robba descent, two-term cohomology, v-descent, exact tensor isocrystal functor | Inputs that do not use Proj/GAGA or HN |
| Basic VB3 | Lubin–Tate and fundamental exact sequence | Positive and negative basic section spaces |
| VB1 twist cohomology | The three sign cases and bounded open-ball identification | Vanishing and degree-one divisor sections |
| VB1 geometric prefix | Classical points, independent chart coverage, regularity/PID complements, Picard degree, HN | Geometric degree and filtration without general-S ampleness |
| VB2 ampleness | Corrected global generation, global chart coverage, schematic twists, GAGA and ampleness criteria | Full relative algebraization |
| VB2 classification | Stability, base change, key extension lemma, splitting, endomorphisms, coherent and finite étale algebras | Geometric classification exports |

The current RF3 packet supplies rank-one descent and partial charts, and
the current basic VB3 definition and Lubin–Tate nodes use the early analytic
VB1 nodes. Those retargetings are already present. Its fundamental exact
sequence node still also imports VS1 for the later divisor-to-Weil comparison.
Twist cohomology and the key extension need only the early exact sequence;
separating that sequence from its Weil comparison removes the remaining direct
cycle through VS1 and classification. G-INTEGRATION records this specific
supplier split. The requested narrow declaration graph is acyclic; the
existing aggregate graph is not claimed repaired.

The geometric prefix requires particular care. FS prints regularity and
Picard degree after GAGA. Reusing that proof order as an input to HN creates
the cycle that the area finding identifies. Instead, degree-one untilt divisor
sections separate classical points, and their nonvanishing charts cover
X_C. Annular classical-point rings and homogeneous localization then give
the geometric schematic map and chartwise bundle comparison. Regularity and
the PID complement follow by factoring sections at their finitely many
classical zeros. Picard degree is then computed from a single DVR and its
PID complement. The independent separation/localization proof is explicitly
G-GEOM, rather than an implicit use of the full GAGA theorem.

For HN existence, saturation provides the correspondence between generic
subspaces and strict bundle subobjects; local lengths provide determinant
degree monotonicity. A meromorphic trivialization with bounded divisor poles,
followed by wedge-power injections and negative-twist vanishing, bounds the
degrees of subbundles of each rank. This is the curve-specific verification
in G-HN. Classification does not justify its own filtration input.

## Reusing the pinned libraries

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. The reviewed coverage catalogue has
no VectorBundlesAndIsocrystals entry; that absence is not a verdict that the
libraries contain nothing relevant. Sixteen cited declarations were checked
in their source files.

Mathlib already defines Witt-vector fraction-field Frobenius, isocrystals,
intertwining morphisms, intertwining equivalences and rank-one standard
blocks. `WittVector.Isocrystal` has no finite-dimensionality constraint, and
`isocrystal_classification` assumes rank one. VB0 restricts this carrier in
the Q_p case and adds general-E coefficients and higher-rank classification.
It does not relabel the existing rank-one theorem as full Dieudonné–Manin.

For schematic bundles, use `AlgebraicGeometry.Scheme.Modules` and a **single**
local generator witness that is both finite and locally free. The locally
free predicate alone permits infinite ranks. Tau Ceti proves finite
presentation from this paired witness. Its `InvertibleSheaf` and
`LineBundleClass` provide line sheaves and tensor classes; the latter is a
commutative monoid at this pin. Mathlib also has the Picard group of a ring.
These are carriers and generic operations; the geometric curve’s integer
Picard computation is new.

Tau Ceti bundles central simple algebras and supplies algebraic Brauer
operations, including scalar extension and split endomorphism classes.
General cyclic algebras and the arithmetic local invariant are requested
from Class field theory Layer 5, including the bridge from this algebraic
Brauer group to its cohomological carrier. The algebraic operation is not
itself an invariant formula. Local fields and ramification Layer 2 supplies
unramified fields and arithmetic Frobenius; RF0 owns completion, ramified
Witt coefficients and period-ring comparisons.

AdicSpacesPartII R3 supplies finite locally free adic sheaves and the
finite-projective sheafy-affinoid correspondence without a noetherian
hypothesis. Its generic trace theorem supplies the finite étale perfect
pairing. RF0’s exact Stein-acyclicity node supplies sousperfectoid annular
cohomology. SchemeAndStackFoundations supplies generic scheme gluing,
determinants, quasi-coherent finite-type predicates and affine criteria;
the requested variants must apply to these curves, not only finite-type
curves over a field.

## Declaration contracts

The following sections give the complete target inventory. A source link names
the theorem or section and page used; the packet additionally records the
source match in our own words, version, hash and access date. Inputs name
direct nodes or supplier contracts. The API names and test names are shared
with the suggested file.

## VB0 — finite isocrystals

### 1. Finite isocrystals over the completed maximal unramified coefficient field

Node: `VectorBundlesAndIsocrystals:VB0/isocrystal-category-and-standard-block`.

Fix a nonarchimedean local field E, residue field F_q, uniformizer π and L=breve E. In mixed characteristic L=W_{O_E}(bar F_q)[1/π]; in equal characteristic L=bar F_q((π)). Let σ be the lift of q-power arithmetic Frobenius fixing E and π. An E-isocrystal is a finite-dimensional L-vector space D with a bijective σ-semilinear Φ. Morphisms are L-linear maps f with fΦ_D=Φ_D′f. This category retains E, σ and the coefficient embedding; the coefficient field alone does not determine it.

The proof proceeds as follows. Restrict the existing semilinear-module API to finite-dimensional objects and supply general-E σ from the coefficient supplier. Use intertwining linear maps for identities and composition; kernels and cokernels inherit bijective Φ, making the finite category E-linear abelian. For E=Q_p, identify this category with the finite-dimensional full subcategory of Mathlib isocrystals, not with every WittVector.Isocrystal.

The reusable interface is:

- `FiniteIsocrystal` (data): A finite L-module with a σ-semilinear equivalence.
- `FiniteIsocrystal.Hom` (data): The E-vector subspace of L-linear maps intertwining the two Frobenius equivalences; scalars are restricted through the specified σ-fixed E embedding, not arbitrary L-scalars.
- `FiniteIsocrystal.Hom.ext` (extensionality): Intertwining morphisms agree iff their underlying functions agree.
- `FiniteIsocrystal.category` (instance): Identity and composition are inherited from linear maps; the category is E-linear abelian.
- `FiniteIsocrystal.toWitt` (compatibility): For E=Q_p and σ=p-Frobenius, forget finiteness to the existing WittVector.Isocrystal class; arrows and isomorphisms agree.
- `FiniteIsocrystal.coeffFrobenius` (projection): Return the specified σ together with the E-coefficient embedding; do not infer it from L.

Its uses are FF18 8.2.3 and VectorBundlesAndIsocrystals:VB2:classification: Source category for the bundle functor and rational classification.; GLX26 §5.1: Tensor isocrystal input to the filtered/G-isocrystal consumer; no filtered objects are rebuilt here..

Discriminating examples:

- `finiteIsocrystal_zero` (degenerate): The zero module has rank 0 and an invertible semilinear zero-to-zero map.
- `finiteIsocrystal_witt` (compatibility): For Q_p the finite subcategory embeds fully faithfully into WittVector.IsocrystalHom and IsocrystalEquiv.
- `finiteIsocrystal_requires_bijective` (non-example): The zero Frobenius map on nonzero L is not an isocrystal.
- `finiteIsocrystal_unramified_frobenius` (computation): For the unramified degree-two E′, the coefficient automorphism is σ², not σ.

Acceptance: Zero is an object, with rank zero; an infinite-dimensional Mathlib isocrystal is excluded. Changing E unramified of degree f changes the specified Frobenius to σ^f even when the completed coefficient fields are identified.

Direct inputs: `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`, `RelativeFarguesFontaine:RF0/ramified-witt-universal-property`, `mathlib:WittVector.FractionRing.frobenius`, `mathlib:WittVector.Isocrystal`, `mathlib:WittVector.IsocrystalHom`, `mathlib:WittVector.IsocrystalEquiv`.

Sources: [FF18-courbes](https://webusers.imj-prg.fr/~laurent.fargues/Courbe_fichier_principal.pdf), 8.2.3, Definition 8.2.5, printed p. 236.

### 2. Rational standard Frobenius blocks

Node: `VectorBundlesAndIsocrystals:VB0/rational-standard-block`.

For s∈Z and r>0, define D(s,r)=L^r with Φ(e_i)=e_{i+1} for i<r−1 and Φ(e_{r−1})=π^s e_0, applying σ to coefficients. Then Φ^r=π^sσ^r and its isocrystal slope is s/r. The coprime pair gives the simple block. FF M(d,h) is D(−d,h); its bundle is O(d/h), rank h and degree d.

The proof proceeds as follows. Construct the cyclic coefficient-semilinear matrix and its inverse, using π≠0. Iterate on the basis to obtain the r-th-power formula; compare r=1 with the pinned p^m block.

The reusable interface is:

- `SlopeBlock` (constructor): D(s,r), with r>0 and π≠0.
- `SlopeBlock.frobenius_basis` (simp): Evaluate Φ on the cyclic basis, including the π^s wraparound.
- `SlopeBlock.iterate` (relation): Φ^r=π^sσ^r, with σ^r acting coefficientwise.
- `SlopeBlock.rank` (projection): The L-rank is r.
- `SlopeBlock.slope` (projection): The rational isocrystal slope is s/r.
- `SlopeBlock.rankOneWitt` (compatibility): At E=Q_p, r=1, D(s,1) identifies with StandardOneDimIsocrystal s.

Its uses are Dieudonné–Manin theorem: Canonical simple objects.; FS II.2.11–14: Define O(λ) with slope reversal and test its rank and degree..

Discriminating examples:

- `slopeBlock_half` (computation): D(1,2) has rank 2 and isocrystal slope 1/2.
- `slopeBlock_wraparound` (characterisation): On D(−1,2), Φ²(e_0)=π^{-1}e_0, ruling out a coefficient-linear or unsigned shift.
- `slopeBlock_rankOne` (compatibility): D(−2,1) is the pinned rank-one block with exponent −2.
- `slopeBlock_not_simple` (non-example): D(2,2) has slope 1 and is not simple: it is two copies of D(1,1).

Acceptance: D(1,2) has slope 1/2 and its bundle O(−1/2) has degree −1. The standard block is simple only if gcd(s,r)=1.

Direct inputs: `VectorBundlesAndIsocrystals:VB0/isocrystal-category-and-standard-block`, `mathlib:WittVector.StandardOneDimIsocrystal`.

Sources: [FF18-courbes](https://webusers.imj-prg.fr/~laurent.fargues/Courbe_fichier_principal.pdf), 8.2.3 before Proposition 8.2.6, p. 237; [Ked05](https://ems.press/content/serial-article-files/25974), Definition 4.1.1, printed p. 487.

### 3. Dieudonné–Manin classification of finite isocrystals

Node: `VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals`; declaration `dieudonneManinIsocrystals`.

Over L with algebraically closed residue field bar F_q, every finite E-isocrystal is a finite direct sum of coprime D(s,r); the multiset of rational slopes with block multiplicities is unique. The coprime blocks are simple, Hom between distinct slopes is zero, and every isocrystal short exact sequence splits. This asserts no analogous classification over an arbitrary perfect residue field without descent data.

The proof proceeds as follows. Use the standard-module eigenvector calculation and slope filtration in Ked05; record the unproved imported Lemma 4.3.3 separately as G-DM rather than treating the citation as closure. For trivial residue valuation descend an eigenbasis from the Hahn extension via the dual basis argument and coefficient reduction (4.5.5–4.5.8). Simplicity, distinct-slope Hom vanishing and splitting identify the unique multiplicities; restrict rank one to the pinned theorem. The equal-characteristic proof is G-DM.

Acceptance: D(2,2)≅D(1,1)⊕D(1,1); rank-one case agrees with the library. The sum of multiplicity times reduced denominator equals the rank; slope multiplicity is not itself the rank.

Direct inputs: `VectorBundlesAndIsocrystals:VB0/rational-standard-block`, `mathlib:WittVector.isocrystal_classification`.

Sources: [Ked05](https://ems.press/content/serial-article-files/25974), 4.5.3–4.5.8, pp. 497–499; [Lurie26](https://www.math.ias.edu/~lurie/205notes/Lecture26-Isocrystals.pdf), Theorem 6, p. 2.

### 4. Tensor and dual calculus for isocrystals

Node: `VectorBundlesAndIsocrystals:VB0/tensor-and-dual-slopes`; declaration `isocrystalTensorSlopes`.

Finite isocrystals form a rigid exact E-linear tensor category. Tensor Frobenius is Φ_D⊗Φ_D′ and dual Frobenius is ℓ↦σ∘ℓ∘Φ_D^{-1}. Tensor slopes are pairwise sums, dual slopes are negatives. If a,b have reduced denominators h_a,h_b,h_{a+b}, then D_a⊗D_b≅D_{a+b}^{⊕h_a h_b/h_{a+b}}.

The proof proceeds as follows. Use the semilinear tensor and inverse-dual formulas; verify evaluation and coevaluation intertwine Φ. Apply classification after a common denominator to calculate the unique slope and rank.

Acceptance: D_{1/2}⊗D_{1/2}≅D_1^{⊕4}, and D_{1/2}∨≅D_{−1/2}. Tensoring with the unit D(0,1) preserves an object.

Direct inputs: `VectorBundlesAndIsocrystals:VB0/isocrystal-category-and-standard-block`, `VectorBundlesAndIsocrystals:VB0/rational-standard-block`, `VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals`.

Sources: [Ked05](https://ems.press/content/serial-article-files/25974), Definition 3.1.5 and Lemma 4.1.2, pp. 478, 487; [FF18-courbes](https://webusers.imj-prg.fr/~laurent.fargues/Courbe_fichier_principal.pdf), Proposition 8.2.6, p. 237.

### 5. Division endomorphisms of a simple isocrystal

Node: `VectorBundlesAndIsocrystals:VB0/endomorphism-division-algebra`; declaration `isocrystalEndDivision`.

For coprime (s,r), End_Φ(D(s,r)) is a central division algebra over E of dimension r². With E_r/E unramified degree r and arithmetic σ, it has presentation ⊕_{i=0}^{r−1}E_r Π^i, Π^r=π^{−s}, Πx=σ(x)Π. Its arithmetic Brauer invariant is computed later by the separate brauer-invariant-sign node. The bundle endomorphism comparison is a separate classification-layer node.

The proof proceeds as follows. Simplicity makes nonzero intertwining maps invertible. The diagonal action of E_r and inverse cyclic shift give Πx=σ(x)Π and Π^r=π^{−s}; compare dimensions by solving the intertwining equations. The centralizer of E_r and Π is E. This proves the center and the cyclic presentation without invoking the later Brauer invariant comparison, which consumes this theorem.

Acceptance: For s=−1,r=2 the algebra has dimension 4 and the quaternion cyclic presentation Π²=π. For r=1 the algebra is E regardless of s.

Direct inputs: `VectorBundlesAndIsocrystals:VB0/rational-standard-block`, `VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`.

Sources: [FF18-courbes](https://webusers.imj-prg.fr/~laurent.fargues/Courbe_fichier_principal.pdf), Definition 8.2.7 and Proposition 8.2.8, pp. 237–238.

### 6. Slope-labelled cyclic algebra

Node: `VectorBundlesAndIsocrystals:VB0/slope-division-algebra`.

For bundle slope λ=d/h in lowest terms, h>0, set D_λ=Cyc(E_h/E, arithmetic σ, π^d), a central division algebra with Π^h=π^d and Πx=σ(x)Π. Use the general cyclic algebra construction supplied by Class field theory; this node supplies the slope-indexed specialization and its identification with End_Φ(D(−d,h)), rather than redoing cyclic algebra theory.

The proof proceeds as follows. Specialize the requested general cyclic algebra to E_h, σ and π^d; use its basis for dimension h². Use the endomorphism presentation to prove the specialization is a division algebra and bundle it with CSA.of.

The reusable interface is:

- `SlopeDivisionAlgebra` (constructor): The cyclic algebra D_λ for the reduced pair of λ.
- `SlopeDivisionAlgebra.generator` (data): The element Π with Π^h=π^d.
- `SlopeDivisionAlgebra.commutation` (relation): Πx=σ(x)Π for x∈E_h; specify arithmetic Frobenius.
- `SlopeDivisionAlgebra.basis` (structure): E-basis obtained from an E-basis of E_h times Π^i, 0≤i<h.
- `SlopeDivisionAlgebra.isocrystalEnd` (equivalence): E-algebra equivalence with End_Φ(D(−d,h)).

Its uses are FF18 8.2.8: Compute stable-bundle endomorphisms.; CFT Layer 5: Match algebraic Brauer classes with the arithmetic local invariant..

Discriminating examples:

- `slopeDivision_integer` (degenerate): D_3≅E because the reduced denominator is one.
- `slopeDivision_half` (computation): D_{1/2} has dimension 4 and Π²=π.
- `slopeDivision_negative` (non-example): D_{−1/3} uses Π³=π^{−1}, not π, and has invariant −1/3.
- `slopeDivision_end` (compatibility): D_{1/3}≅End_Φ(D(−1,3)), not End_Φ(D(1,3)).

Acceptance: The label is λ, the negative of the isocrystal slope.

Direct inputs: `VectorBundlesAndIsocrystals:VB0/endomorphism-division-algebra`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`, `tauceti:TauCeti.CSA.of`.

Sources: [FF18-courbes](https://webusers.imj-prg.fr/~laurent.fargues/Courbe_fichier_principal.pdf), Definition 8.2.7, p. 237.

### 7. Arithmetic Brauer invariant and slope normalization

Node: `VectorBundlesAndIsocrystals:VB0/brauer-invariant-sign`; declaration `slopeBrauerInvariant`.

Under the algebraic-to-cohomological Brauer comparison and the arithmetic local invariant inv_E:Br(E)≃Q/Z, inv_E[D_λ]=λ mod Z. Restriction to finite E′/E multiplies this invariant by [E′:E]; the opposite algebra negates it. This fixes the choice Πx=σ(x)Π with arithmetic, not geometric, Frobenius.

The proof proceeds as follows. Import the general unramified cyclic-algebra invariant formula inv Cyc(E_h,σ,π^d)=d/h from CFT Layer 5, including its comparison with the pinned algebraic Brauer group. Use BrauerGroup.baseChange_mk for the algebraic scalar extension; translate CFT restriction multiplication and opposite inversion.

Acceptance: The invariant of D_{1/3} is 1/3, not −1/3; cubic unramified scalar extension splits its class. D_{1/2} splits over E_2, consistent with the pinned split endomorphism-algebra class.

Direct inputs: `VectorBundlesAndIsocrystals:VB0/slope-division-algebra`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`, `tauceti:TauCeti.BrauerGroup.baseChange_mk`, `tauceti:TauCeti.BrauerGroup.mk_end`.

Sources: [FF18-courbes](https://webusers.imj-prg.fr/~laurent.fargues/Courbe_fichier_principal.pdf), Definition 8.2.7, p. 237.

### 8. Coefficient extension and induction adjunction

Node: `VectorBundlesAndIsocrystals:VB0/scalar-extension-adjunction`; declaration `coefficientAdjunction`.

For finite separable E′/E of residue degree f, ramification degree e and total degree n=ef, identify the coefficient fields compatibly. Pull D to D⊗_{L_E}L_E′ with Frobenius Φ^f⊗σ_E′; induction is the f cyclic conjugate copies of restriction of scalars, with wraparound given by Φ′. Pull and induction are adjoint in both directions: Hom(Pull D,D′)≅Hom(D,Ind D′) and Hom(Ind D′,D)≅Hom(D′,Pull D). The reverse adjunction uses the perfect separable trace pairing and the identification of finite cyclic induction with coinduction; no division by n is required. Pull preserves rank and scales slopes by n; induction multiplies rank by n and divides isoclinic slopes by n. At the bundle stage they compare to pullback/pushforward along the finite étale coefficient curve map, with its two trace adjunctions.

The proof proceeds as follows. Use σ_E′=σ_E^f and v_E′(π_E)=e to obtain the total-degree slope factor ef, not merely f. Give the cyclic induction arrows explicitly and prove Hom(Pull D,D′)≅Hom(D,Ind D′). For the reverse direction identify the dual of the finite separable coefficient field with itself by (a,b)↦Tr(ab); this identification is compatible with coefficient Frobenius. Finite cyclic induction equals coinduction, giving Hom(Ind D′,D)≅Hom(D′,Pull D). SF.1 supplies these module and finite étale sheaf adjunctions, including units/counits; trace self-duality is used without dividing by the extension degree. Check both units/counits, their Frobenius compatibility and the triangle identities; apply the block classification to compute slopes. Fun later transports these identities to the coefficient curve map. The reverse bundle adjunction is the map-transfer step used by Cl.

Acceptance: Unramified degree two sends slope 1/2 to 1; totally ramified degree two sends slope 1 to 2. The two coefficient categories differ even if their L fields identify. For a degree-h unramified coefficient map f and λ=s/h, a nonzero O(s)→f*V gives a nonzero f_*O(s)=O(λ)→V under Hom(f_*W,V)≅Hom(W,f*V). This works even in equal characteristic when p divides h.

Direct inputs: `VectorBundlesAndIsocrystals:VB0/isocrystal-category-and-standard-block`, `VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`, `SchemeAndStackFoundations:SF.1`.

Sources: [FF18-courbes](https://webusers.imj-prg.fr/~laurent.fargues/Courbe_fichier_principal.pdf), 8.2.3 after Proposition 8.2.8, p. 238; [SW20](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf), Theorem 13.5.7, proof, printed p. 114 (PDF p. 124).

### 9. Finite Galois descent of isocrystals

Node: `VectorBundlesAndIsocrystals:VB0/finite-galois-descent`; declaration `isocrystalGaloisDescent`.

Let L′/L be finite Galois and let σ′ be a coefficient automorphism extending σ. Finite L-vector spaces with bijective σ-semilinear Φ are equivalent to finite L′-vector spaces with bijective σ′-semilinear Φ′ and a semilinear Galois descent action ρ satisfying Φ′ρ_g=ρ_{σ′gσ′^{-1}}Φ′ for every g∈Gal(L′/L). The descended module is the invariant module and Φ′ restricts to a bijective σ-semilinear Φ. Ordinary commutation with each ρ_g is sufficient only when σ′ centralizes the Galois group. This is module descent with Frobenius, not classification over arbitrary perfect residue fields.

The proof proceeds as follows. Apply the supplier finite faithfully flat module descent equivalence. The conjugation compatibility makes Φ′ preserve Galois invariants; its inverse also preserves them. Descend both maps and the intertwining equation on arrows through the effective module descent equivalence.

Acceptance: For the identity extension the equivalence is the identity. Rank-one forms require their descent cocycle; slope alone is not asserted to classify them.

Direct inputs: `VectorBundlesAndIsocrystals:VB0/isocrystal-category-and-standard-block`, `SchemeAndStackFoundations:SF.1`.

Sources: [FF18-courbes](https://webusers.imj-prg.fr/~laurent.fargues/Courbe_fichier_principal.pdf), 8.2.3, Definition 8.2.5, printed p. 236; [Ked05](https://ems.press/content/serial-article-files/25974), 4.5.7–4.5.8, pp. 498–499.

## VB1 — analytic descent and the geometric prefix

### 1. Finite locally free bundles on the curve

Node: `VectorBundlesAndIsocrystals:VB1/finite-locally-free-bundles`.

For X_S imported from RF1, Bun(X_S) is the category of structure-sheaf modules admitting a covering with finite free trivializations. The same local generator data must be finite and locally free. Schematic bundles use Scheme.Modules and the pinned local generator APIs; analytic bundles use the R3 coherent-sheaf carrier. Pullback, tensor, dual, determinants and exact sequences are transported from these suppliers. Finite rank is required even though the pinned locally free predicate alone allows infinite ranks.

The proof proceeds as follows. Bundle the existing sheaf-of-modules object with finite locally free trivialization data; forgetful functors are full subcategory inclusions. Import sheaf pullback and its tensor coherence. Define exactness using exact sequences of sheaves, retaining locally free endpoints.

The reusable interface is:

- `CurveBundle` (data): A structure-sheaf module with a single finite locally free local generator witness.
- `CurveBundle.ofFree` (constructor): The free sheaf of finite rank n.
- `CurveBundle.ext` (extensionality): Bundle morphisms are equal iff the underlying sheaf morphisms are equal.
- `CurveBundle.pullback` (functoriality): Pullback along curve-base change, with identity and composition isomorphisms.
- `CurveBundle.tensorDual` (structure): Tensor, unit, dual and evaluation from the structure-sheaf module category.
- `CurveBundle.finitePresentation` (compatibility): Apply the pinned finite-presentation theorem to the same finite locally free witness.

Its uses are FS II.2.1–15: Carrier for analytic descent, cohomology, degree and classification.; KL15 6.3.12: Common carrier for Frobenius-module comparisons..

Discriminating examples:

- `curveBundle_zero` (degenerate): The free sheaf on the empty family is a bundle of rank 0.
- `curveBundle_free_two` (computation): O_X⊕O_X is a bundle of rank 2.
- `curveBundle_not_infinite` (non-example): On a nonempty geometric curve, a free sheaf on an infinite constant basis is not finite locally free; test its nonzero residue-field stalk. The nonempty hypothesis excludes the empty scheme, where the zero sheaf admits every vacuous presentation.
- `curveBundle_schematic` (compatibility): For a scheme, forgetting CurveBundle returns its Scheme.Modules object with the pinned finite locally free data.

Acceptance: The zero object and free rank n objects are admitted; infinite free modules are excluded.

Direct inputs: `RelativeFarguesFontaine:RF1/frobenius-quotient-and-presentation`, `AdicSpacesPartII:R3/locally-free-sheaf`, `AdicSpacesPartII:R3/sheafy-tate-acyclicity-and-kiehl-gluing`, `SchemeAndStackFoundations:SF.0`, `mathlib:AlgebraicGeometry.Scheme.Modules`, `mathlib:SheafOfModules.LocalGeneratorsData.IsLocallyFreeData`, `mathlib:SheafOfModules.LocalGeneratorsData.IsFiniteType`, `tauceti:SheafOfModules.LocalGeneratorsData.IsLocallyFreeData.isFinitePresentation`.

Sources: [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), II.2 preamble and Proposition II.2.1, pp. 57–58.

### 2. Annular Frobenius descent for bundles

Node: `VectorBundlesAndIsocrystals:VB1/annular-frobenius-descent`; declaration `annularBundleDescent`.

For affinoid perfectoid S of characteristic p over F_q, finite locally free bundles on X_S are equivalent, exactly and tensorially, to finite projective bundles on the RF0 closed annuli with compatible overlap identifications and bijective Frobenius identification under radius rescaling. Restriction to a fundamental annular range and Frobenius translates gives the inverse. Cohomology on Y_S is acyclic in positive degrees by sousperfectoid annular acyclicity and dense restriction maps.

The proof proceeds as follows. Import annular finite-projective/coherent equivalence and acyclicity from R3; identify the RF0 annuli and Frobenius rescaling. Glue the fundamental range and all Frobenius translates; RF1 quotient descent yields the inverse to restriction. For the exhaustion of Y_S, use dense restriction maps to kill lim¹ and the Čech-to-derived supplier; no global GAGA is used.

Acceptance: The identity descent datum gives O_X; replacing a bijective Frobenius identification by a noninvertible map is not descent.

Direct inputs: `VectorBundlesAndIsocrystals:VB1/finite-locally-free-bundles`, `RelativeFarguesFontaine:RF0/ramified-witt-universal-property`, `RelativeFarguesFontaine:RF0:annuli/radius-function-and-rational-annuli`, `RelativeFarguesFontaine:RF1/frobenius-quotient-and-presentation`, `AdicSpacesPartII:R3/locally-free-sheaf`, `AdicSpacesPartII:R3/sheafy-tate-acyclicity-and-kiehl-gluing`, `DiamondsAndVStacks:D0/cech-to-derived-comparison`, `RelativeFarguesFontaine:RF0:annuli/stein-exhaustion-and-higher-acyclicity`.

Sources: [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), II.2 preamble, p. 57; [CS17](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), 3.3.4, p. 683.

### 3. Relative tilted Robba ring from curve annuli

Node: `VectorBundlesAndIsocrystals:VB1/tilted-robba-ring`.

For perfectoid affinoid S=Spa(R,R⁺) in characteristic p, define the relative tilted Robba ring R̃_R as colim_{r>0} lim_{s→0} Γ(Y_{S,[s,r]},O). At fixed r the inverse limit has its Fréchet seminorms, and the union carries the corresponding LF topology. Frobenius rescales radii by q. For E=Q_p its absolute specialization agrees with CS17 3.2.10, and its relative form is the ring used in 3.3.4; general E uses the coefficient-compatible RF0 annuli. Absolute field R gives a Bézout ring; no such assertion is made for every affinoid R.

The proof proceeds as follows. Take the inverse limits with the annular restriction maps, then the filtered union over outer radii; retain all seminorms. Identify the q-Frobenius maps on the limit system. Use the field-only Bézout input of RF0 when required, not in the relative case.

The reusable interface is:

- `TiltedRobba` (constructor): The annular inverse-limit/filtered-union ring.
- `TiltedRobba.restrict` (functoriality): Cofinal radius restriction maps, compatible with composition.
- `TiltedRobba.frobenius` (structure): Coefficient-semilinear ring automorphism with radius rescaling q.
- `TiltedRobba.seminorm` (data): The family of annular seminorms on fixed-radius Fréchet pieces.
- `TiltedRobba.compareCS` (compatibility): For E=Q_p identify the ring, Frobenius and topology with CS17 3.2.10.

Its uses are CS17 3.3.4: A single-ring description of analytic curve bundles.; KL15 6.3.17–18: Norms and continuous group actions on Frobenius invariants..

Discriminating examples:

- `tiltedRobba_cofinal` (characterisation): Using s_j→0 in a fixed r inverse limit produces the same ring and topology.
- `tiltedRobba_zero_section` (degenerate): The zero compatible annular family has all seminorms zero.
- `tiltedRobba_frobenius_radius` (computation): At Q_p, Frobenius moves the outer radius r to r/p in the CS convention.
- `tiltedRobba_not_algebraic_union` (non-example): Replacing the fixed-r inverse limit by an algebraic union loses compatible sections defined on all sufficiently small inner radii.

Acceptance: Changing the cofinal radius sequence gives a canonical topological ring isomorphism.

Direct inputs: `RelativeFarguesFontaine:RF0/ramified-witt-universal-property`, `RelativeFarguesFontaine:RF0:annuli/radius-function-and-rational-annuli`, `VectorBundlesAndIsocrystals:VB1/annular-frobenius-descent`.

Sources: [CS17](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), Definition 3.2.10 and Theorems 3.2.13, 3.3.4, pp. 681–683.

### 4. Finite projective Frobenius modules and integral models

Node: `VectorBundlesAndIsocrystals:VB1/robba-frobenius-modules`.

A Robba Frobenius module is a finite projective R̃_R-module M with a semilinear Frobenius whose linearization φ* M→M is an isomorphism. A globally étale model is a finite locally free module over the integral Robba ring whose linearized Frobenius is invertible and whose scalar extension is M. This defines the global model predicate needed in KL 8.8.7; equivalence with pointwise purity or local systems is not included here and remains VB4-owned.

The proof proceeds as follows. Use finite-projective modules and the actual scalar-extension linearization, not an arbitrary endomorphism. Import the integral Robba subring from RF0 and store a finite locally free Frobenius-stable model plus scalar-extension isomorphism.

The reusable interface is:

- `RobbaPhiModule` (data): Finite projective M with invertible Frobenius linearization.
- `RobbaPhiModule.Hom` (data): R̃-linear maps commuting with Frobenius.
- `RobbaPhiModule.baseChange` (functoriality): Base change of modules and linearizations under coefficient-compatible perfectoid maps.
- `RobbaPhiModule.GlobalEtaleModel` (data): An integral finite locally free model and Frobenius identification.
- `RobbaPhiModule.isGloballyEtale` (characterisation): Existence of such a global model; independent of presentation.

Its uses are KL15 6.3.12: Bundle equivalence.; KL15 8.8.7: Global étale models imply vanishing after positive twist and global ampleness..

Discriminating examples:

- `robbaPhi_trivial` (degenerate): The rank-one ring with its own Frobenius has its evident integral étale model.
- `robbaPhi_noninvertible` (non-example): Zero linearization on a nonzero free module is excluded.
- `robbaPhi_finite_projective` (compatibility): Over an absolute field the module is free by the field Bézout theorem, while its definition remains finite projective.
- `robbaPhi_unit_lattice` (characterisation): A rank-one Frobenius multiplier that is an integral unit preserves an invertible rank-one integral model.

Acceptance: Global model data does not follow merely from a slope computed at one geometric point.

Direct inputs: `VectorBundlesAndIsocrystals:VB1/tilted-robba-ring`, `AdicSpacesPartII:R3/locally-free-sheaf`, `AdicSpacesPartII:R3/sheafy-tate-acyclicity-and-kiehl-gluing`.

Sources: [CS17](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), Definition before Theorem 3.3.4, p. 683 (absolute case before 3.2.13, p. 681); [KL15](https://arxiv.org/pdf/1301.0792), 7.3.4–7.3.5, pp. 148–149.

### 5. Exact tensor equivalence of Robba modules and curve bundles

Node: `VectorBundlesAndIsocrystals:VB1/robba-bundle-equivalence`; declaration `robbaBundleEquivalence`.

For affinoid perfectoid characteristic-p S, RobbaPhiModule(R̃_S)≃Bun(X_S) is an exact tensor equivalence, commuting with base change and duals. Spread a finite presentation to sufficiently small annuli, extend across Frobenius translates, then descend to X_S. Its inverse takes compatible annular sections. For Q_p this is CS17 3.3.4. The general-E coefficient comparison is requested from RF0; this analytic equivalence does not require Proj/GAGA.

The proof proceeds as follows. Spread module and invertible linearization matrices to annuli using finite projectivity; a finite range suffices. Use Ann to glue and descend; restriction reconstructs the original module and arrows. Compare tensor and exact sequences on annuli, using the supplier coherent equivalence.

Acceptance: Rank-one Frobenius π^{-n} gives O(n), fixing the sign. The equivalence includes all finite projective relative modules, not only globally free ones.

Direct inputs: `VectorBundlesAndIsocrystals:VB1/robba-frobenius-modules`, `VectorBundlesAndIsocrystals:VB1/annular-frobenius-descent`.

Sources: [CS17](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), Theorem 3.3.4, p. 683; [KL15](https://arxiv.org/pdf/1301.0792), 6.3.12, p. 141.

### 6. Two-term Frobenius complex for curve cohomology

Node: `VectorBundlesAndIsocrystals:VB1/frobenius-two-term-cohomology`.

For a bundle V descended from M on Y_S, derived global sections on X_S identify with the homotopy fiber of φ−1 on RΓ(Y_S,M). Annular Stein acyclicity reduces this to [Γ(Y_S,M) →^{φ−1} Γ(Y_S,M)] in degrees 0 and 1. H⁰ is the kernel, H¹ the cokernel and H^i=0 for i>1. The differential is E-linear, not L-linear; negative shifted complexes are interpreted by hypercohomology, never by a bare cokernel definition of Banach–Colmez spaces.

The proof proceeds as follows. Apply the quotient group cohomology fiber sequence for the infinite cyclic Frobenius action. Use Ann to eliminate higher cohomology on Y_S. Identify kernel/cokernel by the two-term long exact sequence.

The reusable interface is:

- `FrobeniusComplex` (constructor): The E-linear two-term complex in degrees 0 and 1.
- `FrobeniusComplex.differential` (simp): The differential sends x to φ(x)−x.
- `FrobeniusComplex.H0` (characterisation): H⁰=ker(φ−1).
- `FrobeniusComplex.H1` (characterisation): H¹=coker(φ−1).
- `FrobeniusComplex.map` (functoriality): A Frobenius-equivariant bundle morphism induces a cochain map.
- `FrobeniusComplex.compareDerived` (equivalence): Canonical quasi-isomorphism with RΓ(X_S,V), compatible with pullback.

Its uses are FS II.2.5: Compute twist cohomology by difference equations.; VectorBundlesAndIsocrystals:VB3:positive-basic-examples/banach-colmez-space-definition: Supply RΓ(X_T,V_T) for its degree-zero hypercohomology v-sheaf..

Discriminating examples:

- `frobeniusComplex_zero` (degenerate): For the zero module both terms and both cohomology groups vanish.
- `frobeniusComplex_identity` (computation): For φ=id on a nonzero E-vector space the differential is zero, so H⁰ and H¹ both equal that space.
- `frobeniusComplex_kernel` (characterisation): H⁰ consists precisely of φ-fixed vectors, not all vectors.
- `frobeniusComplex_degree` (non-example): The cokernel occupies degree 1, and cannot represent H⁰(V) for an arbitrary V.

Acceptance: The zero bundle gives the zero complex; the differential on O is φ−1, not φ.

Direct inputs: `VectorBundlesAndIsocrystals:VB1/annular-frobenius-descent`, `DiamondsAndVStacks:D0/cech-to-derived-comparison`, `RelativeFarguesFontaine:RF0:annuli/stein-exhaustion-and-higher-acyclicity`.

Sources: [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), II.2 preamble, p. 57.

### 7. V-descent of bundles and their derived cohomology

Node: `VectorBundlesAndIsocrystals:VB1/v-descent-for-bundles-and-cohomology`; declaration `bundleVDescent`.

On Perf/F_q, S↦Bun(X_S) is a v-stack. For any perfectoid S and V∈Bun(X_S), T↦RΓ(X_T,V_T) on Perf/S is a derived v-sheaf. In the affinoid case this follows after completed tensoring with the perfectoid completed coefficient extension E_∞, where closed annuli become affinoid perfectoid, and descending the finite projective module data. Both arrows and effective objects descend.

The proof proceeds as follows. Use RF0 coefficient perfectoidization and finite-projective descent on the resulting affinoid perfectoid annuli. Apply D2 v-acyclicity and function descent to the annular complexes; descend Frobenius maps and glue. Use the two-term derived complex, not separate underived group sheafifications, for cohomology descent.

Acceptance: A v-cover descent datum reconstructs a bundle uniquely up to equivalence. The induced maps on cohomology are the maps of the derived v-sheaf complex.

Direct inputs: `VectorBundlesAndIsocrystals:VB1/annular-frobenius-descent`, `VectorBundlesAndIsocrystals:VB1/frobenius-two-term-cohomology`, `DiamondsAndVStacks:D2/higher-v-acyclicity`, `DiamondsAndVStacks:D2/v-descent-of-functions`, `SchemeAndStackFoundations:SF.1`.

Sources: [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proposition II.2.1, pp. 57–58.

### 8. The exact tensor isocrystal-to-bundle functor

Node: `VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor`.

Fix k=bar F_q and its coefficient inclusion in L=breve E. For perfectoid S/k with the specified k-structure, define E_S(D) by descending D⊗_L O_{Y_S} along Φ_D⊗φ_Y. It is an exact tensor functor from finite E-isocrystals to Bun(X_S), compatible with duals, k-compatible base change and finite coefficient pull/induction. For any perfectoid S/F_q, define the standard O_{X_S}(d/h) directly by descending the cyclic rank-h Frobenius matrix with wrap coefficient π^{−d}; this needs no chosen k-embedding. After base change to k it agrees with E_S(D(−d,h)). Its rank is h, O(n) agrees with RF3 rank-one twists, and O(λ)∨=O(−λ). Geometric degree d is a later consequence of degree-rank-slope-and-HN-formalism, not an input to this construction. No relative classification is asserted.

The proof proceeds as follows. Use the specified k-structure to embed L in the analytic coefficient sheaf, then apply Ann to the finite free bundle and its diagonal semilinear Frobenius. Define standard cyclic matrix descent separately over F_q and compare after k-base change. Tensor/dual identities and exactness are checked on Y_S, where scalar extension is flat. Compare rank-one descent with RF3 and coefficient curve maps with Adj; geometric degrees are proved in the degree node.

The reusable interface is:

- `bundleOfIsocrystal` (constructor): For S over the fixed k=bar F_q, the analytic Frobenius-descended bundle E_S(D), retaining the coefficient embedding.
- `bundleOfIsocrystal.map` (functoriality): Descend an intertwining linear map; preserve identity and composition.
- `bundleOfIsocrystal.tensorDual` (compatibility): Exact tensor structure and dual compatibility.
- `standardBundle` (constructor): For S/F_q, descend the cyclic matrix for (−d,h); over k compare with E_S(D(−d,h)).
- `standardBundle.integerTwist` (compatibility): O(n) identifies with RF3 rank-one twists, with their tensor laws.
- `standardBundle.baseChange` (functoriality): Perfectoid pullback preserves the cyclic standard bundle; general E_S(D) pullback retains the chosen k-embedding. At a geometric point, coefficient pullback multiplies λ by [E′:E], as proved with degree and scalar extension.

Its uses are FS II.2.5 and II.2.11–15: Twist cohomology and stable classification objects.; GeometricSatakeAndFusion and GLX26 §5.1: Tensor input without asserting the G-isocrystal/G-bundle equivalence owned elsewhere..

Discriminating examples:

- `standardBundle_zero` (degenerate): O(0) is the tensor unit of rank 1, rather than the rank-zero bundle.
- `standardBundle_half_sign` (computation): Over geometric C/k, D(1,2) maps to O(−1/2), rank 2; the degree −1 check belongs after geometric degree is constructed.
- `standardBundle_integer` (compatibility): D(−2,1) maps to the RF3 twist O(2).
- `standardBundle_tensor_half` (computation): Over geometric C/k, O(1/2)⊗O(1/2)≅O(1)^{⊕4}; rank 4 detects omission of the tensor multiplicity.

Acceptance: Over a geometric C with chosen k-embedding, D(1,2) maps to O(−1/2) of rank 2. Its degree −1 is checked after the geometric degree node. Without a k-embedding the general D⊗_L construction is unavailable; standard cyclic descent is still defined.

Direct inputs: `VectorBundlesAndIsocrystals:VB0/isocrystal-category-and-standard-block`, `VectorBundlesAndIsocrystals:VB0/rational-standard-block`, `VectorBundlesAndIsocrystals:VB0/tensor-and-dual-slopes`, `VectorBundlesAndIsocrystals:VB0/scalar-extension-adjunction`, `VectorBundlesAndIsocrystals:VB1/annular-frobenius-descent`, `VectorBundlesAndIsocrystals:VB1/v-descent-for-bundles-and-cohomology`, `RelativeFarguesFontaine:RF3/isocrystal-line-bundles-and-sign`.

Sources: [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), II.2 preamble, p. 58; [FF18-courbes](https://webusers.imj-prg.fr/~laurent.fargues/Courbe_fichier_principal.pdf), Proposition 8.2.6 and Remark 8.2.9, pp. 237–238.

### 9. Slope-sensitive cohomology of standard bundles

Node: `VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`; declaration `standardBundleCohomology`.

For λ<0, H⁰(X_S,O(λ))=0 and the v-sheaf H¹(O(λ)) is locally spatial, partially proper and cohomologically smooth. For λ=0, the degree-zero v-sheaf is constant E and the pro-étale sheafification of degree-one cohomology is zero; RΓ_proét(S,E)≃RΓ(X_S,O). For λ>0 and affinoid S, H¹(X_S,O(λ))=0; its H⁰ v-sheaf is locally spatial, partially proper and cohomologically smooth. After base change to the fixed algebraically closed k, the positive H⁰ v-sheaf is a d-dimensional perfectoid open ball in mixed characteristic only for 0<λ=d/h≤[E:Q_p]; in equal characteristic every positive λ has this description. Nonaffinoid global H¹ vanishing is not asserted. The negative λ=−1 presentation is (A¹_{S♯})^diamond/E on an untilt cover.

The proof proceeds as follows. Reduce rational λ to an integer twist after the finite unramified denominator cover, using Adj and trace. Solve φ−π^n by convergent annular series for positive integer twists; the zero case uses the fundamental exact sequence from the BC owner. For negative twists use untilt exact sequences and induction. Import the BC owner’s basic positive/negative geometric representability package with its early analytic inputs; G-INTEGRATION isolates the needed fundamental sequence from its later VS1 comparison. There is no dependence on full VB1/HN. The open-ball dimension is the positive numerator d, not the rank h.

Acceptance: At λ=0 H¹ vanishes only after the stated v-sheafification or on affinoid pro-étale input; distinguish this from a global assertion on arbitrary S. At Q_p, λ=2 is outside the open-ball guarantee; positivity alone is insufficient.

Direct inputs: `VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor`, `VectorBundlesAndIsocrystals:VB1/frobenius-two-term-cohomology`, `VectorBundlesAndIsocrystals:VB1/v-descent-for-bundles-and-cohomology`, `VectorBundlesAndIsocrystals:VB3:positive-basic-examples/lubin-tate-universal-cover`, `VectorBundlesAndIsocrystals:VB3:positive-basic-examples/fundamental-exact-sequence`, `VectorBundlesAndIsocrystals:VB0/scalar-extension-adjunction`.

Sources: [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proposition II.2.5 and proof, pp. 62–64.

### 10. Classical points and annular Dedekind rings

Node: `VectorBundlesAndIsocrystals:VB2:classification/classical-points-and-principal-ideal-domains`; declaration `classicalPointPid`.

For complete algebraically closed perfectoid C/F_q and a connected affinoid U=Spa(B,B⁺) in Y_C, Spm(B) identifies with the classical points of U, whose residue fields are untilts of C over E. B is a PID. On X_C, classical points are Frobenius orbits and affinoid chart rings are Dedekind domains; their PID upgrade is obtained from geometric Picard degree, rather than assumed as an early analytic input.

The proof proceeds as follows. Use Q4 strongly Zariski closed perfectoidization to reduce zero loci to the tilted perfectoid disc. Classical maximal ideals have primitive principal generators; a nonzero function has finitely many zeros with finite orders on a compact annulus. Factor by these generators to prove the annular PID assertion; descend Frobenius orbits to X_C and glue Dedekind local rings. Do not use the full schematic GAGA theorem.

Acceptance: Distinguish classical rank-one closed points from every topological point of the adic space. The untilt residue field may depend on the point, even for the fixed C.

Direct inputs: `RelativeFarguesFontaine:RF0/ramified-witt-universal-property`, `RelativeFarguesFontaine:RF0:annuli/radius-function-and-rational-annuli`, `RelativeFarguesFontaine:RF1/frobenius-quotient-and-presentation`, `PerfectoidQuotients:Q4`, `AdicSpacesPartII:R3/locally-free-sheaf`, `AdicSpacesPartII:R3/sheafy-tate-acyclicity-and-kiehl-gluing`.

Sources: [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proposition II.1.11, Corollary II.1.12 and Definition/Proposition II.1.22, pp. 53–57.

### 11. Elementary algebraization at a geometric point

Node: `VectorBundlesAndIsocrystals:VB1/geometric-point-chart-cover`.

For complete algebraically closed perfectoid C, RF3 supplies P_C=⊕_{n≥0}Γ(X_C,O(n)) and chart maps on nonvanishing loci. Prove these loci cover X_C using the classical-point description and the Lubin–Tate degree-one divisor sections, then glue a global locally ringed spectral map α_C:X_C→Proj(P_C). It identifies finite locally free bundles on the geometric curve with their schematic counterparts by chartwise finite-projective comparison. This geometric-point construction precedes the general-S ampleness/GAGA theorem; it is not imported from that theorem.

The proof proceeds as follows. For a nonclassical point any nonzero degree-one divisor section is nonvanishing. For a classical point choose a distinct degree-one divisor; justify this separation and existence from the Lubin–Tate evaluation sequence. G-GEOM names the exact residual proof contract. Identify the degree-zero localizations with analytic nonvanishing chart functions, using RF3 chart comparisons and the early annular PID structure. Glue chart maps; compare locally free sheaves chartwise through finite-projective modules and effective gluing, not through full general-S GAGA.

The reusable interface is:

- `geometricCurveMap` (constructor): The global map α_C formed from the proved geometric-point covering.
- `geometricCurveMap.chart` (simp): On D(f), the map is the RF3 map to D_+(f).
- `geometricCurveMap.compatible` (compatibility): The chart maps agree on D(fg) under homogeneous localization.
- `geometricBundleAlgebraization` (equivalence): Exact tensor equivalence of analytic and schematic finite locally free bundles at C.
- `geometricCurveMap.closedPoints` (characterisation): Classical points map bijectively to schematic closed points.

Its uses are FS II.2.9–12: Obtain regularity, Picard degree and HN before general ampleness.; RT-AREA-padic-1/21: Remove the former ampleness/degree/classification cycle..

Discriminating examples:

- `geometricCurveMap_nonvanishing` (characterisation): A nonzero divisor section is nonvanishing at every nonclassical point.
- `geometricCurveMap_separates` (non-example): The section vanishing at x cannot alone define a chart containing x; use a section with a distinct zero divisor.
- `geometricCurveMap_overlap` (compatibility): The maps for f and g agree on D(fg).

Acceptance: Every classical point must be excluded from the zero locus of some chosen homogeneous section; a map defined only on their union does not suffice.

Direct inputs: `VectorBundlesAndIsocrystals:VB2:classification/classical-points-and-principal-ideal-domains`, `RelativeFarguesFontaine:RF3/isocrystal-line-bundles-and-sign`, `RelativeFarguesFontaine:RF3/graded-algebra-and-algebraic-curve-map`, `VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`, `VectorBundlesAndIsocrystals:VB3:positive-basic-examples/lubin-tate-universal-cover`, `AdicSpacesPartII:R3/locally-free-sheaf`, `AdicSpacesPartII:R3/sheafy-tate-acyclicity-and-kiehl-gluing`, `SchemeAndStackFoundations:SF.0`.

Sources: [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proof of Proposition II.2.9, p. 68; [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proposition II.2.7, pp. 66–67.

### 12. Regular noetherian geometric curve and PID complements

Node: `VectorBundlesAndIsocrystals:VB2:ampleness/schematic-curve-at-a-geometric-point`; declaration `geometricCurveRegular`.

For complete algebraically closed perfectoid C, X_C^alg=Proj(P_C) is connected, regular, noetherian and one-dimensional. Classical points correspond bijectively to its closed points; for every classical x the complement of x in X_C^alg is affine with PID coordinate ring. Degree-one untilt divisor sections cut out Spec(C♯) and their nonvanishing complements give these charts.

The proof proceeds as follows. A divisor section f_x cuts out the untilt point; find a chart containing x using GeoMap. Factor a homogeneous section into its finitely many classical zeros and an everywhere nonzero remainder, using ClassPt. An invertible positive twist would contradict the computed twist cohomology, so the remainder has degree zero and lies in E×. Use this factorization in P[f_x^{-1}]_0 to prove PID, identify maximal ideals and DVR local rings, and glue the noetherian regular one-dimensional scheme.

Acceptance: X_C^alg is not asserted to be a finite-type E-curve; regularity and noetherianness are local statements from its charts.

Direct inputs: `VectorBundlesAndIsocrystals:VB1/geometric-point-chart-cover`, `VectorBundlesAndIsocrystals:VB2:classification/classical-points-and-principal-ideal-domains`, `VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`, `SchemeAndStackFoundations:SF.0`.

Sources: [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proposition II.2.9 and proof, p. 68.

### 13. Untilts and completed local rings

Node: `VectorBundlesAndIsocrystals:VB1/completed-local-ring-comparison`; declaration `completedLocalUntilt`.

At a classical point x of the geometric curve, identify the completed local ring with the RF2 untilt period DVR, whose residue field is C_x♯. At E=Q_p this is B_dR⁺(C_x♯). A uniformizer t_x depends on a choice of generator; neither its equality with a global t nor the equality of every untilt with a fixed C♯ is asserted.

The proof proceeds as follows. Compare analytic and homogeneous-localization stalks through GeoMap. Complete the regular local ring and identify the primitive untilt ideal with the RF2 period DVR; specialize to the Q_p B_dR⁺ statement.

Acceptance: Changing a local generator multiplies t_x by a unit; residue fields are identified with their own untilts.

Direct inputs: `VectorBundlesAndIsocrystals:VB2:ampleness/schematic-curve-at-a-geometric-point`, `RelativeFarguesFontaine:RF2:untilts/BdR-completion-and-filtration`.

Sources: [CN25](https://arxiv.org/pdf/2108.12785), §3.2.1, p. 14.

### 14. Picard group of the geometric curve

Node: `VectorBundlesAndIsocrystals:VB1/picard-degree`; declaration `picardDegreeEquivalence`.

At complete algebraically closed C, the map Z→Pic(X_C), n↦[O(n)], is an isomorphism of groups. Every classical point has divisor class [O(1)]. Use the existing invertible-sheaf and line-bundle-class carriers, adding dual inverses and the curve-specific integer classification; a commutative monoid of classes in the baseline is not already this Picard computation.

The proof proceeds as follows. Trivialize a line bundle away from one closed point using its PID complement. A transition at the DVR is a power of the uniformizer times a unit, so the bundle is O(n[x]). The Lubin–Tate divisor sequence identifies O([x])=O(1); cohomology rules out a nonzero n with O(n) trivial.

Acceptance: O(n)≅O(m) iff n=m, and O([x]) has degree 1 for every classical x.

Direct inputs: `VectorBundlesAndIsocrystals:VB2:ampleness/schematic-curve-at-a-geometric-point`, `VectorBundlesAndIsocrystals:VB1/geometric-point-chart-cover`, `VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor`, `tauceti:TauCeti.AlgebraicGeometry.InvertibleSheaf`, `tauceti:TauCeti.AlgebraicGeometry.LineBundleClass`, `mathlib:CommRing.Pic`.

Sources: [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proposition II.2.10 and proof, p. 68.

### 15. Rank, determinant degree and rational slope

Node: `VectorBundlesAndIsocrystals:VB1/degree-rank-slope-and-HN-formalism`.

For V∈Bun(X_C), rank(V) is its finite locally constant rank, constant on connected X_C. Set deg(V)=PicDegree(det V)∈Z and μ(V)=deg(V)/rank(V)∈Q only for V≠0. Rank and degree are additive in bundle short exact sequences; deg(V⊗W)=rank(W)deg(V)+rank(V)deg(W), deg(V∨)=−deg(V). For O(d/h) in reduced form, rank=h and degree=d. No global degree function on arbitrary perfectoid S is asserted; VB4 uses geometric fibers.

The proof proceeds as follows. Import determinant and finite-rank exact-sequence identities from the sheaf supplier. Compose determinant class with the inverse Picard isomorphism. Compute ranks and degrees of blocks after the unramified denominator cover or determinant Frobenius; this uses no bundle classification. Keep the nonzero hypothesis at every slope comparison; zero bundles are treated separately.

The reusable interface is:

- `bundleRank` (projection): Constant finite rank on X_C.
- `bundleDegree` (constructor): Integer Picard degree of the determinant.
- `bundleSlope` (projection): Rational degree/rank for a nonzero bundle.
- `bundleDegree.exact` (relation): Degree and rank add in short exact sequences.
- `bundleDegree.tensorDual` (relation): Tensor determinant formula and dual sign.
- `bundleDegree.standard` (simp): For λ=d/h reduced, rank O(λ)=h and degree O(λ)=d.

Its uses are FS II.2.11–14: Stability and HN axioms.; VectorBundlesAndIsocrystals:VB4: Degree and slope of each geometric fiber; do not assume a constant global relative degree..

Discriminating examples:

- `bundleDegree_zero` (degenerate): Rank and degree of the zero bundle are both zero; no slope is requested.
- `bundleDegree_half` (computation): O(1/2) has (rank,degree,slope)=(2,1,1/2).
- `bundleDegree_dual` (compatibility): O(1/2)∨ has rank 2, degree −1 and slope −1/2.
- `bundleDegree_directSum` (computation): O(1)⊕O(−1) has rank 2 and degree 0, although its HN slopes are 1 and −1.

Acceptance: O(1/2) has rank 2, degree 1 and slope 1/2.

Direct inputs: `VectorBundlesAndIsocrystals:VB1/finite-locally-free-bundles`, `VectorBundlesAndIsocrystals:VB1/picard-degree`, `VectorBundlesAndIsocrystals:VB0/tensor-and-dual-slopes`, `VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor`, `SchemeAndStackFoundations:SF.0`.

Sources: [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), After Proposition II.2.10, pp. 68–69; [FF18-courbes](https://webusers.imj-prg.fr/~laurent.fargues/Courbe_fichier_principal.pdf), 5.5.1, pp. 162–163 (rank/degree axioms p. 162; Definition 5.5.1 p. 163).

### 16. Saturation and torsion degree on the geometric curve

Node: `VectorBundlesAndIsocrystals:VB1/saturation-and-torsion-degree`.

For a coherent subsheaf F of a geometric bundle V, its saturation F^sat is the inverse image of the torsion subsheaf of V/F, so V/F^sat is torsion free and locally free on the regular one-dimensional curve. A torsion coherent sheaf T has degree ∑_x length_{O_x}(T_x)deg(x), with deg(x)=1 at a classical point. A generic-fiber isomorphism F→G of bundles satisfies deg(F)≤deg(G), with equality iff it is an isomorphism. This gives the strict-subobject and degree-monotonicity HN axioms.

The proof proceeds as follows. Use local DVR torsion-free finite modules to show the saturated quotient is locally free. Compute lengths locally and compare determinant divisors; exactness yields the degree inequality and equality criterion. Verify finite support by noetherianness and quasi-compactness; generic subspaces have unique saturated inverse images.

The reusable interface is:

- `bundleSaturation` (constructor): The saturated inverse image inside V.
- `bundleSaturation.universal` (universal-property): Smallest saturated subsheaf containing F; its quotient is torsion free.
- `bundleSaturation.idempotent` (simp): Saturating an already saturated subsheaf does nothing.
- `torsionDegree` (constructor): Finite sum of local DVR lengths times point degree.
- `torsionDegree.exact` (relation): Torsion degree is additive in short exact sequences.
- `genericIso_degree` (characterisation): Generic bundle injection has nonnegative degree defect, zero precisely for an isomorphism.

Its uses are FF18 5.5.1: Verify generic-fiber exact-category HN hypotheses.; Coherent classification: Separate torsion and bundle pieces..

Discriminating examples:

- `saturation_zero` (degenerate): The zero subbundle of a torsion-free bundle is saturated.
- `saturation_divisor` (computation): The image O(−1)⊂O cut out by one classical point saturates to O, with torsion degree 1.
- `torsionDegree_length_two` (computation): O_x/(t_x²) has degree 2, not degree 1.
- `saturation_not_same_rank` (non-example): Equal generic rank does not make O(−1)→O an isomorphism; its degree defect is positive.

Acceptance: For O→O(1) defined by a degree-one divisor section the cokernel has length 1 and degree 1.

Direct inputs: `VectorBundlesAndIsocrystals:VB2:ampleness/schematic-curve-at-a-geometric-point`, `VectorBundlesAndIsocrystals:VB1/completed-local-ring-comparison`, `VectorBundlesAndIsocrystals:VB1/degree-rank-slope-and-HN-formalism`, `SchemeAndStackFoundations:SF.0`.

Sources: [FF18-courbes](https://webusers.imj-prg.fr/~laurent.fargues/Courbe_fichier_principal.pdf), 5.5.2.1, printed p. 164; generic-isomorphism axioms in 5.5.1, p. 162.

### 17. Stable and semistable geometric bundles

Node: `VectorBundlesAndIsocrystals:VB1/geometric-semistability`.

A nonzero bundle V on X_C is semistable if every proper nonzero saturated subbundle F has μ(F)≤μ(V), and stable if the inequality is strict. Checking all coherent subsheaves of smaller positive rank is equivalent after saturation. The zero bundle is admitted into each fixed-slope subcategory separately, but has no slope and is not called stable.

The proof proceeds as follows. Use saturated subbundles to match the exact-category strict subobjects. Apply saturation’s degree monotonicity to compare the coherent-subsheaf formulation.

The reusable interface is:

- `BundleSemistable` (characterisation): Nonzero V and the weak inequalities for proper saturated subbundles.
- `BundleStable` (characterisation): Nonzero V and the strict inequalities.
- `BundleStable.semistable` (relation): Stable implies semistable.
- `BundleSemistable.iso` (compatibility): Stability and semistability are invariant under bundle isomorphisms.
- `BundleSemistable.saturation` (equivalence): Equivalent test using coherent subsheaves of smaller positive rank.

Its uses are FS II.2.11–14: Identify O(λ), define HN graded pieces and the fixed-slope category..

Discriminating examples:

- `bundleSemistable_line` (degenerate): Every line bundle is stable: there is no proper positive-rank saturated subbundle.
- `bundleSemistable_equal_sum` (characterisation): O⊕O is semistable of slope 0 but is not stable.
- `bundleSemistable_unequal_sum` (non-example): O(1)⊕O(−1) is not semistable: O(1) has slope 1>0.
- `bundleStable_zero` (non-example): The zero bundle is not stable and is never assigned a finite slope.

Acceptance: A direct sum of two equal-slope line bundles is semistable and not stable.

Direct inputs: `VectorBundlesAndIsocrystals:VB1/degree-rank-slope-and-HN-formalism`, `VectorBundlesAndIsocrystals:VB1/saturation-and-torsion-degree`.

Sources: [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Before Example II.2.11, p. 69; [FF18-courbes](https://webusers.imj-prg.fr/~laurent.fargues/Courbe_fichier_principal.pdf), Definition 5.5.5 and Proposition 5.5.6, p. 164.

### 18. Harder–Narasimhan filtration of geometric bundles

Node: `VectorBundlesAndIsocrystals:VB1/harder-narasimhan-filtration`.

Every bundle V on X_C has a unique finite exhaustive filtration by saturated subbundles with nonzero semistable graded pieces of strictly decreasing rational slopes. Write V^{≥λ} for the decreasing threshold filtration; it is functorial and invariant under isomorphism. The zero bundle has the empty filtration. Existence uses the HN axioms, including boundedness of degrees of subbundles of each rank; it does not use the geometric classification theorem.

The proof proceeds as follows. Verify exactness of generic fiber, positivity of rank, saturated subobject correspondence, determinant additivity and generic-isomorphism degree monotonicity with Sat. Obtain rankwise upper bounds by a meromorphic trivialization V→O(N)^m with finite divisor poles, then use wedge injections and negative-twist H⁰ vanishing. This avoids invoking global generation/GAGA; its complete verification is G-HN. Choose the maximal-slope subobject of maximal rank and iterate on its locally free quotient. Uniqueness and functoriality follow from slope orthogonality.

The reusable interface is:

- `HNFiltration` (constructor): The unique saturated finite decreasing-slope filtration.
- `HNFiltration.threshold` (projection): V^{≥λ} for a rational threshold λ.
- `HNFiltration.graded` (data): Semistable graded bundles and their ranks and degrees.
- `HNFiltration.unique` (characterisation): Every filtration satisfying these properties equals the canonical one.
- `HNFiltration.functorial` (functoriality): Every bundle morphism preserves each threshold piece.
- `HNFiltration.semistable` (characterisation): A nonzero bundle is semistable iff it has one HN slope.

Its uses are FS II.2.13–14: Base change, semistable reduction and split classification.; VectorBundlesAndIsocrystals:VB4: Fiberwise HN data; relative HN filtration is owned by VB4..

Discriminating examples:

- `hnFiltration_zero` (degenerate): The zero bundle has no nonzero HN graded pieces.
- `hnFiltration_two_slopes` (computation): O(1)⊕O(−1) has descending HN slopes 1,−1 and rank-one pieces.
- `hnFiltration_equal_slopes` (characterisation): O⊕O has one slope-zero piece of rank 2, rather than two strictly decreasing equal slopes.
- `hnFiltration_threshold` (computation): For O(1)⊕O(−1), the threshold ≥0 is O(1).

Acceptance: For O(1)⊕O(−1), the first piece is O(1); for a semistable object there is a single nonzero graded piece.

Direct inputs: `VectorBundlesAndIsocrystals:VB1/geometric-semistability`, `VectorBundlesAndIsocrystals:VB1/saturation-and-torsion-degree`, `VectorBundlesAndIsocrystals:VB1/degree-rank-slope-and-HN-formalism`, `VectorBundlesAndIsocrystals:VB2:ampleness/schematic-curve-at-a-geometric-point`, `VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`.

Sources: [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proposition II.2.12, p. 69; [FF18-courbes](https://webusers.imj-prg.fr/~laurent.fargues/Courbe_fichier_principal.pdf), 5.5.1–5.5.4, pp. 162–164.

### 19. Rank-normalized Harder–Narasimhan polygon

Node: `VectorBundlesAndIsocrystals:VB1/harder-narasimhan-polygon`.

For HN graded pieces with ranks r_i and slopes λ_1>…>λ_m, the HN polygon is the concave piecewise-linear function on [0,rank V] starting at (0,0), with segment length r_i and slope λ_i. It ends at (rank V,deg V). For V=0 it is the single point (0,0). Use rank lengths, not one unit per simple block.

The proof proceeds as follows. Take cumulative ranks and degrees of HN graded pieces and linearly interpolate. Strictly decreasing slopes prove concavity; exact additivity proves the endpoint formula.

The reusable interface is:

- `HNPolygon` (constructor): The rational piecewise-linear polygon from HN graded data.
- `HNPolygon.vertices` (projection): Cumulative rank and degree vertices.
- `HNPolygon.endpoint` (simp): Endpoint (rank V,deg V).
- `HNPolygon.concave` (characterisation): The polygon has decreasing segment slopes.
- `HNPolygon.directSum` (compatibility): Direct sum merges the descending slope multisets, weighted by ranks.

Its uses are VectorBundlesAndIsocrystals:VB4/semicontinuity-of-HN-polygon: Fiberwise polygons and dominance order..

Discriminating examples:

- `hnPolygon_zero` (degenerate): The zero polygon has only (0,0).
- `hnPolygon_half` (computation): For O(1/2) the endpoint is (2,1), not (1,1/2).
- `hnPolygon_split` (computation): For O(1)⊕O(−1), vertices are (0,0),(1,1),(2,0).
- `hnPolygon_not_slope_only` (non-example): The polygon of O(1)⊕O(−1) is not the horizontal rank-two degree-zero segment.

Acceptance: O(1/2) gives a segment from (0,0) to (2,1).

Direct inputs: `VectorBundlesAndIsocrystals:VB1/harder-narasimhan-filtration`.

Sources: [FF18-courbes](https://webusers.imj-prg.fr/~laurent.fargues/Courbe_fichier_principal.pdf), Theorem 5.5.3, p. 163.

## VB2:ampleness — algebraization and ampleness

### 1. Global generation and vanishing after positive twists

Node: `VectorBundlesAndIsocrystals:VB2:ampleness/quantitative-global-generation`; declaration `positiveTwistGeneration`.

For affinoid perfectoid S/F_q and V∈Bun(X_S), there is n_0 such that for every n≥n_0, V(n) is generated by finitely many global sections and H^i(X_S,V(n))=0 for all i>0. The bound depends on V and the chosen affinoid S. On a general perfectoid base the assertion is local on S; no uniform global bound is asserted. The quantitative proof uses the two half-annulus contraction estimates of KL6.2.2–6.2.4, not the defective estimate (II.2.1) in FS.

The proof proceeds as follows. Spread finite projective data to annuli using RE. The alternative free-stabilization route uses the requested finite-projective K₀ input, but is not required by the KL proof. On each half annulus of ratio q^{1/2}, bound forward and inverse Frobenius matrices by c_1,c_2. Choose a large twist and a cutoff c so that both terms in the KL6.2.2 contraction constant ε are <1; decompose coefficients using the annular splitting estimate and sum the convergent error series. Construct approximate-basis invariant sections on [r/q^{1/2},r], then repeat on [r/q,r/q^{1/2}]. The two finite families together generate every annulus under Frobenius translates. Use KL6.2.2 difference-equation surjectivity and Coh for higher vanishing. General-E normalization replaces the p-based KL constants with the RF0 π/q annular comparison. G-GG records that remaining comparison and forbids importing the false FS bound q^{−M−1} or its dropped π^{−N} factor.

Acceptance: Every sufficiently large integer n works, not merely an unbounded sequence. For V=O(−m), n>m gives H¹=0; zero slope is treated by the zero-case cohomology statement.

Direct inputs: `VectorBundlesAndIsocrystals:VB1/robba-bundle-equivalence`, `VectorBundlesAndIsocrystals:VB1/frobenius-two-term-cohomology`, `VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`, `KTheoryLowDegrees:Z.1`, `RelativeFarguesFontaine:RF3/isocrystal-line-bundles-and-sign`, `RelativeFarguesFontaine:RF3/graded-algebra-and-algebraic-curve-map`, `AdicSpacesPartII:R3/locally-free-sheaf`, `AdicSpacesPartII:R3/sheafy-tate-acyclicity-and-kiehl-gluing`.

Sources: [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Theorem II.2.6 and proof, pp. 64–66; [KL15](https://arxiv.org/pdf/1301.0792), Propositions 6.2.2–6.2.4 and Remark 6.2.5, pp. 136–137.

### 2. Global Proj map and compatible schematic twists

Node: `VectorBundlesAndIsocrystals:VB2:ampleness/global-proj-map-and-twists`.

For affinoid perfectoid S, set X_S^alg=Proj(P_S) using the RF3 graded ring. Apply GG to prove the homogeneous nonvanishing loci cover X_S, then glue the RF3 chart maps to α_S:X_S→X_S^alg. For sufficiently large positive m, construct invertible O_alg(m) with pullback O(m) and compatible multiplication; use consecutive large powers to define O_alg(1) and all integer tensor powers. Do not assume the naive Proj shift sheaf in degree one is already invertible for an arbitrary graded ring.

The proof proceeds as follows. Use GG for O to prove coverage before chart gluing. On large-degree charts construct the transition ratios for O_alg(m); common refinements give multiplication coherence. Choose consecutive sufficiently large a,a+1 and define O_alg(1)=O_alg(a+1)⊗O_alg(a)∨; prove independence of the choices and recovery of all large powers.

The reusable interface is:

- `curveProjMap` (constructor): Global α_S after homogeneous chart coverage.
- `curveProjMap.chart` (compatibility): Its restriction is the RF3 homogeneous localization chart map.
- `algebraicTwist` (constructor): Invertible O_alg(n), obtained from compatible sufficiently large shifts.
- `algebraicTwist.pullback` (compatibility): α_S*O_alg(n)≅O(n).
- `algebraicTwist.add` (relation): O_alg(n+m)≅O_alg(n)⊗O_alg(m), coherently.
- `algebraicTwist.largeShift` (characterisation): For large n it agrees with the Proj graded shift sheaf.

Its uses are FS II.2.7: Global GAGA and cohomology comparison.; RS-20/RF3: The chart supplier has no dependency on this global theorem..

Discriminating examples:

- `algebraicTwist_zero` (degenerate): O_alg(0) is the structure-sheaf tensor unit.
- `algebraicTwist_consecutive` (characterisation): O_alg(a+1)⊗O_alg(a)∨ pulls back to O(1).
- `algebraicTwist_inverse` (compatibility): O_alg(−1) is the dual of O_alg(1).
- `curveProjMap_coverage` (non-example): A map on the union of D(f) is not called curveProjMap before the union is proved to be X_S.

Acceptance: The global map is defined on all X_S; RF3’s partial union alone is insufficient.

Direct inputs: `VectorBundlesAndIsocrystals:VB2:ampleness/quantitative-global-generation`, `RelativeFarguesFontaine:RF3/isocrystal-line-bundles-and-sign`, `RelativeFarguesFontaine:RF3/graded-algebra-and-algebraic-curve-map`, `SchemeAndStackFoundations:SF.0`, `VectorBundlesAndIsocrystals:VB1/finite-locally-free-bundles`.

Sources: [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proposition II.2.7, pp. 66–67.

### 3. GAGA for the relative schematic curve

Node: `VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence`; declaration `curveGaga`.

Let X be a locally ringed spectral space with line bundle O(1) such that every finite locally free V has V(n) globally generated and H^i(X,V(n))=0 for all i>0 and all sufficiently large n. The homogeneous chart maps define a global α:X→Proj⊕Γ(X,O(n)); pullback gives an exact tensor equivalence of finite locally free bundles and comparison isomorphisms on all bundle cohomology. Apply this to X_S for affinoid perfectoid S via GG and GMap. No coherent-sheaf equivalence on arbitrary nonnoetherian S is inferred from this bundle statement.

The proof proceeds as follows. Use sufficiently positive twists to present bundles by finite free sums; vanishing of H¹ makes the section functor exact in the needed range. Build the schematic graded module and use generation and localizations to obtain a vector bundle; compare its pullback. Resolve Hom bundles by twists to prove full faithfulness and exactness. A finite chart Čech complex reduces all cohomology comparisons to filtered colimits of twist sections.

Acceptance: The unit and every integer twist agree under pullback; morphisms are identified, not only isomorphism classes. For S=C this equivalence agrees with the independently established GeoMap prefix.

Direct inputs: `VectorBundlesAndIsocrystals:VB2:ampleness/quantitative-global-generation`, `VectorBundlesAndIsocrystals:VB2:ampleness/global-proj-map-and-twists`, `VectorBundlesAndIsocrystals:VB1/finite-locally-free-bundles`, `SchemeAndStackFoundations:SF.0`, `DiamondsAndVStacks:D0/cech-to-derived-comparison`.

Sources: [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proposition II.2.7 and proof, pp. 66–67.

### 4. Independence of the ample line bundle

Node: `VectorBundlesAndIsocrystals:VB2:ampleness/independence-of-positive-twist`; declaration `ampleLineIndependence`.

Two line bundles satisfying the axiomatic generation/vanishing hypotheses on the same X yield canonically isomorphic Proj schemes, with the same locally ringed map from X and the same finite locally free equivalence. The identification is functorial and obeys the cocycle law for three choices. No arbitrary choice of line bundle without these hypotheses is included.

The proof proceeds as follows. Use nonvanishing loci of positive sections to reconstruct the affine open charts from their structure-sheaf functions. Refine charts from the two choices jointly and compare their degree-zero localizations intrinsically. Glue identity maps on these rings; uniqueness on the common basis proves functoriality and the cocycle law.

Acceptance: Replacing O(1) by O(2) gives the Veronese Proj comparison and the same α.

Direct inputs: `VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence`, `VectorBundlesAndIsocrystals:VB2:ampleness/global-proj-map-and-twists`, `SchemeAndStackFoundations:SF.0`, `VectorBundlesAndIsocrystals:VB2:ampleness/ample-section-affineness`.

Sources: [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Remark II.2.8, p. 67; [KL15](https://arxiv.org/pdf/1301.0792), 8.8.8–8.8.9, p. 182.

### 5. Prüfer charts and coherent Frobenius correspondence

Node: `VectorBundlesAndIsocrystals:VB2:ampleness/prufer-and-coherent-correspondence`; declaration `pruferCoherentComparison`.

For an absolute analytic characteristic-p field F in the KL setting, every positive homogeneous chart ring P_F[f^{-1}]_0 is Prüfer. Coherent sheaves on Proj(P_F) correspond to finitely presented R̃_F-modules with invertible Frobenius linearization. Finite locally free objects correspond to finite projective Frobenius modules. The claim is absolute; Prüfer or Bézout hypotheses are not silently imposed on arbitrary relative bases.

The proof proceeds as follows. Use the absolute Robba Bézout input to prove distributivity of intersections and sums of ideals; twisted-invariant exactness transfers it to homogeneous chart rings. Spread finite presentations to annuli; sheafify the corresponding graded invariant modules on Proj and reconstruct by localization. Use the Prüfer characterization that finitely generated torsion-free modules are projective for the locally free subcategory.

Acceptance: A finite torsion coherent module is allowed in the coherent correspondence but is not called a bundle.

Direct inputs: `VectorBundlesAndIsocrystals:VB1/tilted-robba-ring`, `VectorBundlesAndIsocrystals:VB1/robba-frobenius-modules`, `VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence`, `RelativeFarguesFontaine:RF0/ramified-witt-universal-property`, `RelativeFarguesFontaine:RF0:annuli/radius-function-and-rational-annuli`, `SchemeAndStackFoundations:SF.0`.

Sources: [KL15](https://arxiv.org/pdf/1301.0792), Definition 6.3.5, Lemma 6.3.6 and Theorem 6.3.14, pp. 138–142 (Theorem 6.3.14 printed p. 142).

### 6. Norm topology on twisted Frobenius invariants

Node: `VectorBundlesAndIsocrystals:VB2:ampleness/norms-on-twisted-invariants`.

For a finite projective tilted Robba Frobenius module M and each fixed integer n, the space Γ_n(M)=ker(φ−π^n) has a canonical Banach topology from a sufficiently small annular radius. Its induced norms at admissible radii and from finite projective presentations are equivalent. This is a separate assertion for each n; no uniform norm-equivalence constant over all n is asserted.

The proof proceeds as follows. Put the finite-projective quotient seminorm on a fixed annulus. On eigenvectors compare the norm with its Frobenius translates; the growth bounds and annular log-convexity compare radii. KL6.3.17 prints p^{-n} alongside M(n), contrary to Definition 6.2.1; reindex its proof by n↦−n to obtain our Γ_n=ker(φ−π^n). See E15. Complete the fixed-eigenvalue subspace and show the topology is independent of a presentation. General-E radius constants require RF0’s coefficient comparison.

The reusable interface is:

- `TwistedInvariant` (constructor): The kernel of φ−π^n as an E-vector space.
- `TwistedInvariant.norm` (structure): Banach topology at a fixed n from any admissible annular norm.
- `TwistedInvariant.radiusEquiv` (compatibility): Different sufficiently small radii induce equivalent norms.
- `TwistedInvariant.map` (functoriality): Intertwining module maps act continuously on Γ_n.
- `TwistedInvariant.presentationIndependent` (characterisation): The topological vector space is independent of projective presentation.

Its uses are KL15 6.3.18: Detect continuity of profinite actions on the geometric bundle..

Discriminating examples:

- `twistedInvariant_zero` (degenerate): For M=0 the invariant Banach space is zero.
- `twistedInvariant_n_zero` (characterisation): At n=0 the space is ker(φ−1).
- `twistedInvariant_change_radius` (compatibility): Two admissible radii induce the same open subsets of Γ_n.
- `twistedInvariant_not_exact_norm` (non-example): Rescaling the chosen module norm changes its numeric values but leaves the invariant topology unchanged.
- `twistedInvariant_sign` (characterisation): On the rank-one module with φ=π·id, π≠0 and π²≠1, Γ_1 is the whole space while ker(φ−π^{-1}) is zero. This detects the sign mismatch in KL6.3.17.

Acceptance: Changing finite projective generators preserves the topology, rather than an exact numeric norm.

Direct inputs: `VectorBundlesAndIsocrystals:VB1/robba-frobenius-modules`, `VectorBundlesAndIsocrystals:VB1/tilted-robba-ring`, `VectorBundlesAndIsocrystals:VB1/robba-bundle-equivalence`.

Sources: [KL15](https://arxiv.org/pdf/1301.0792), Lemma 6.3.17, p. 142.

### 7. Continuous profinite actions on Frobenius modules

Node: `VectorBundlesAndIsocrystals:VB2:ampleness/continuous-frobenius-group-actions`.

Let a profinite group G act by continuous E-algebra automorphisms on every fixed-radius Fréchet piece of R̃_R and commute with Frobenius; in particular it fixes E and π. A semilinear G-action on M is LF-continuous if its action map is continuous for the annular LF topology. This is equivalent to continuity of G on every Γ_n(M) with its fixed-n Banach topology. Actions commute with Frobenius and preserve the specified ring action, hence act E-linearly on each invariant space.

The proof proceeds as follows. Define continuity using the genuine G×M topological action, not only an algebraic representation. Restrict to the closed invariant spaces and apply fixed-n norm equivalence. Conversely, the quantitative-global-generation theorem supplies sufficiently many twisted invariant generators; use them to control the LF action. This is the dependency explicitly invoked as KL6.2.4 in Definition 6.3.18.

The reusable interface is:

- `ContinuousPhiAction` (data): Frobenius-commuting semilinear G-action, whose coefficient action fixes E, with a jointly LF-continuous action map.
- `ContinuousPhiAction.restrictInvariants` (functoriality): Continuous E-linear action on Γ_n for each n.
- `ContinuousPhiAction.invariantCriterion` (equivalence): LF continuity iff every twisted-invariant action is continuous.
- `ContinuousPhiAction.baseChange` (compatibility): Continuous scalar extension along an E-algebra map compatible with the coefficient actions and Frobenius preserves the action.

Its uses are KL15 6.3.18 and Galois-equivariant consumers: Transfer topological actions through the Robba/bundle comparison..

Discriminating examples:

- `continuousPhiAction_trivial` (degenerate): The trivial group action is continuous and commutes with φ.
- `continuousPhiAction_all_weights` (characterisation): The criterion quantifies over all integers n, including negative and zero twists.
- `continuousPhiAction_finite` (compatibility): A finite discrete group acting by continuous semilinear automorphisms yields a continuous action.
- `continuousPhiAction_requires_commutation` (non-example): A continuous module action that does not commute with φ does not restrict to the invariant spaces and is excluded.

Acceptance: Testing one eigenvalue alone is not the stated criterion.

Direct inputs: `VectorBundlesAndIsocrystals:VB2:ampleness/norms-on-twisted-invariants`, `VectorBundlesAndIsocrystals:VB1/robba-frobenius-modules`, `VectorBundlesAndIsocrystals:VB1/tilted-robba-ring`, `VectorBundlesAndIsocrystals:VB2:ampleness/quantitative-global-generation`.

Sources: [KL15](https://arxiv.org/pdf/1301.0792), Definition 6.3.18, printed p. 143.

### 8. Two affine charts and cohomological dimension one

Node: `VectorBundlesAndIsocrystals:VB2:ampleness/two-affine-cover-cohomological-dimension`; declaration `curveCohomologicalDimension`.

In the relative KL setting choose a fixed analytic coefficient field L and two homogeneous sections f_1,f_2 of the same positive degree whose images generate the unit ideal in the tilted Robba ring. Their D_+(f_i) cover Proj(P_R), each is affine and their intersection is affine. Every quasi-coherent sheaf G has H^i=0 for i>1; Čech cohomology on this two-open cover computes H⁰ and H¹. The degree-one normalization is the one used by KL 8.8.

The proof proceeds as follows. Produce the two scalar coefficient sections and their unit ideal relation; homogeneous saturation proves the Proj cover. Use the affine intersection D_+(f_1f_2) and affine quasi-coherent acyclicity to compute the Čech complex.

Acceptance: Both charts are needed; global sections on only D_+(f_1) do not generate on its complement.

Direct inputs: `VectorBundlesAndIsocrystals:VB2:ampleness/quantitative-global-generation`, `VectorBundlesAndIsocrystals:VB2:ampleness/global-proj-map-and-twists`, `SchemeAndStackFoundations:SF.0`, `DiamondsAndVStacks:D0/cech-to-derived-comparison`, `VectorBundlesAndIsocrystals:VB1/tilted-robba-ring`.

Sources: [KL15](https://arxiv.org/pdf/1301.0792), Remark 8.7.6 and Theorem 8.7.7, printed p. 178.

### 9. Tensor global ampleness and rational-local ampleness

Node: `VectorBundlesAndIsocrystals:VB2:ampleness/tensor-global-ampleness`.

For a finite locally free F on X_S^alg, GloballyAmple(F) means: for every finite-type quasi-coherent G, there exists N(G) such that F^{⊗n}⊗G is globally generated by finitely many sections for all n≥N(G). Ample(F) means this on a strong rational covering of the perfectoid base. This is KL’s tensor-power bundle notion, not an unproved equivalence with projective-bundle ampleness or with pointwise positive slopes.

The proof proceeds as follows. Import quasi-coherent finite-type and global-generation predicates from SF0. Define tensor powers using the bundle tensor unit at n=0; cover independence follows by refinement of strong rational covers.

The reusable interface is:

- `BundleGloballyAmple` (characterisation): ∀ finite-type G, eventually every F^{⊗n}⊗G is finitely globally generated.
- `BundleAmple` (characterisation): Global ampleness after a strong rational cover of S.
- `BundleGloballyAmple.iso` (compatibility): The predicates are invariant under bundle isomorphism.
- `BundleGloballyAmple.tensorPower` (relation): Positive powers preserve and detect the predicate.
- `BundleAmple.refine` (functoriality): A refinement of the witnessing strong rational cover is also a witness.

Its uses are KL15 8.8.3–9: Power criterion, cohomological characterization and affine nonvanishing loci..

Discriminating examples:

- `bundleAmple_positive_line` (computation): O(1) is globally ample.
- `bundleAmple_unit_fails` (non-example): O is not globally ample: tensor with O(−1) has no global sections on the geometric curve.
- `bundleAmple_zero` (degenerate): Under the tensor-power definition the zero bundle is globally ample: for n≥1 its tensor power times every G is zero, generated by the empty finite family. No positive-rank hypothesis is added.
- `bundleAmple_threshold` (characterisation): For O(1) tested against O(−m), a generation bound grows with m; a common threshold for all m is not required.

Acceptance: The threshold may depend on G; replacing it by a threshold independent of all G is incorrect. The zero bundle satisfies this tensor-power definition; standard projective-bundle conventions must not be imported silently.

Direct inputs: `VectorBundlesAndIsocrystals:VB1/finite-locally-free-bundles`, `VectorBundlesAndIsocrystals:VB2:ampleness/global-proj-map-and-twists`, `SchemeAndStackFoundations:SF.0`, `VectorBundlesAndIsocrystals:VB2:ampleness/two-affine-cover-cohomological-dimension`.

Sources: [KL15](https://arxiv.org/pdf/1301.0792), Definition 8.8.2, printed p. 180.

### 10. Power criterion for tensor global ampleness

Node: `VectorBundlesAndIsocrystals:VB2:ampleness/ampleness-power-criterion`; declaration `amplenessPowerCriterion`.

For every positive integer m, F is globally ample iff F^{⊗m} is globally ample, with the same statement for rational-local ampleness. The test sheaf remains every finite-type quasi-coherent G.

The proof proceeds as follows. For the forward implication take the subsequence of exponents divisible by m. For the converse apply global ampleness of F^{⊗m} to the finitely many sheaves F^{⊗i}⊗G, 0≤i<m, and take the maximum threshold.

Acceptance: For O(2) the criterion recovers ampleness of O(1); m=0 is excluded.

Direct inputs: `VectorBundlesAndIsocrystals:VB2:ampleness/tensor-global-ampleness`.

Sources: [KL15](https://arxiv.org/pdf/1301.0792), Lemma 8.8.3, printed p. 180.

### 11. Positive line ampleness and finite-type presentations

Node: `VectorBundlesAndIsocrystals:VB2:ampleness/positive-lines-and-finite-type-presentations`; declaration `positiveLineAmple`.

For every integer e>0, O_alg(e) is globally ample. Every finite-type quasi-coherent G on X_S^alg is a quotient of a finite sum of integer twists O_alg(e_i). On each of the two affine charts take finitely many local generators and multiply by sufficiently high powers of its homogeneous section to extend them globally; use both charts and a common maximum exponent.

The proof proceeds as follows. Import extension of local sections after clearing homogeneous denominators on a quasi-compact scheme. Do it for both D_+(f_1) and D_+(f_2); extend every generator with a common exponent. The resulting finite family generates G(n); take a surjection from the corresponding negative twists and use Pow for e>0.

Acceptance: Do not infer generation on all X from sections generating only on the first affine chart.

Direct inputs: `VectorBundlesAndIsocrystals:VB2:ampleness/quantitative-global-generation`, `VectorBundlesAndIsocrystals:VB2:ampleness/two-affine-cover-cohomological-dimension`, `VectorBundlesAndIsocrystals:VB2:ampleness/global-proj-map-and-twists`, `VectorBundlesAndIsocrystals:VB2:ampleness/tensor-global-ampleness`, `SchemeAndStackFoundations:SF.0`, `VectorBundlesAndIsocrystals:VB2:ampleness/ampleness-power-criterion`.

Sources: [KL15](https://arxiv.org/pdf/1301.0792), Lemma 8.8.4 (statement p. 180, proof p. 181) and Corollary 8.8.5, p. 181.

### 12. Cohomological criterion for tensor global ampleness

Node: `VectorBundlesAndIsocrystals:VB2:ampleness/cohomological-ampleness-criterion`; declaration `cohomologicalAmplenessCriterion`.

For a bundle F on X_S^alg the following are equivalent: (a) F is globally ample; (b) for every finite-type quasi-coherent G, H¹(F^{⊗n}⊗G)=0 for all sufficiently large n; (c) for every e∈Z, H¹(F^{⊗n}(e))=0 for all sufficiently large n. Thresholds may depend on G or e. The implication (c)⇒(a) must produce one positive power independently of e, then apply the power criterion.

The proof proceeds as follows. From a finite-type twist presentation, global generation and dimension-one Čech cohomology reduce (a)⇒(b) to positive-line H¹ vanishing imported from Tw/GAGA, not from ampleness itself. Clearly (b)⇒(c). For (c)⇒(a) first choose n_0 at e=0; for each e choose n divisible by n_0 with the required H¹ vanishing. Use the divisor exact sequence to generate F^{⊗jn}(e), tensor with generated F^{⊗kn_0}, and express every large multiple of n_0 as jn+kn_0. This proves one fixed power globally ample for all twists; apply PL and Pow.

Acceptance: The exponent defining the ample power cannot depend on e. At F=O, condition (c) fails for e=−1 on the geometric curve.

Direct inputs: `VectorBundlesAndIsocrystals:VB2:ampleness/tensor-global-ampleness`, `VectorBundlesAndIsocrystals:VB2:ampleness/ampleness-power-criterion`, `VectorBundlesAndIsocrystals:VB2:ampleness/positive-lines-and-finite-type-presentations`, `VectorBundlesAndIsocrystals:VB2:ampleness/two-affine-cover-cohomological-dimension`, `VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`, `VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence`.

Sources: [KL15](https://arxiv.org/pdf/1301.0792), Proposition 8.8.6 and proof, pp. 181–182.

### 13. Positive twists of globally étale bundles

Node: `VectorBundlesAndIsocrystals:VB2:ampleness/globally-etale-positive-ampleness`; declaration `globallyEtalePositiveAmple`.

In the KL coefficient setting, if F corresponds to a Robba Frobenius module with a global finite locally free étale integral model, then for every integer n>0, H¹(F(n))=0 and F(n) is globally ample. The global model hypothesis is stronger than pointwise purity. General-E specialization requires the normalized RF0 comparison; no converse to this theorem is asserted.

The proof proceeds as follows. Apply the Frobenius difference-equation estimate with the integral model to obtain H¹(F(n))=0 for n>0. Tensor powers of the model remain integral; for each e, sufficiently many positive twists give the vanishing required by AC.

Acceptance: The untwisted unit F=O has a global étale model but fails global ampleness; n>0 is essential.

Direct inputs: `VectorBundlesAndIsocrystals:VB1/robba-frobenius-modules`, `VectorBundlesAndIsocrystals:VB1/robba-bundle-equivalence`, `VectorBundlesAndIsocrystals:VB2:ampleness/cohomological-ampleness-criterion`, `VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`, `VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence`.

Sources: [KL15](https://arxiv.org/pdf/1301.0792), Corollary 8.8.7, p. 182.

### 14. Affine nonvanishing loci of ample line sections

Node: `VectorBundlesAndIsocrystals:VB2:ampleness/ample-section-affineness`; declaration `ampleSectionAffine`.

If L is a globally ample line bundle on X_S^alg and s∈Γ(L), the open nonvanishing locus D(s) is affine, including the empty case. Its coordinate ring is the degree-zero localization of ⊕_{n≥0}Γ(L^{⊗n}) at s. This yields intrinsic Proj reconstruction and the canonical independence comparison for ample choices.

The proof proceeds as follows. Express j_*G on D(s) through filtered twists and multiplication by s. Use the cohomological ampleness criterion to show quasi-coherent higher cohomology vanishes on D(s); apply the supplier quasi-compact scheme affineness criterion. Identify its global functions by homogeneous localization and glue these affine charts.

Acceptance: For s=0 the open is empty; for the standard positive homogeneous section this recovers D_+(s).

Direct inputs: `VectorBundlesAndIsocrystals:VB2:ampleness/tensor-global-ampleness`, `VectorBundlesAndIsocrystals:VB2:ampleness/cohomological-ampleness-criterion`, `VectorBundlesAndIsocrystals:VB2:ampleness/two-affine-cover-cohomological-dimension`, `SchemeAndStackFoundations:SF.0`.

Sources: [KL15](https://arxiv.org/pdf/1301.0792), Lemma 8.8.8 and Corollary 8.8.9, p. 182.

## VB2:classification — geometric classification

### 1. Stability of rational standard bundles

Node: `VectorBundlesAndIsocrystals:VB2:classification/standard-bundle-stability`; declaration `standardBundleStable`.

For every λ=d/h in lowest terms, O_{X_C}(λ) is stable of rank h, degree d and slope λ. If a saturated subbundle F has rank r<h and degree s, then s/r≤λ by the wedge/H⁰ argument; equality would force h|r and is impossible.

The proof proceeds as follows. Tensor calculus puts ∧^r O(λ) inside a sum of blocks of slope rλ; det F=O(s) gives a nonzero map into that wedge. Negative-twist H⁰ vanishing forces s≤rλ. If equality holds, coprimality forces h|r, contrary to 0<r<h.

Acceptance: O(1/2) is stable although its rank is 2; degree alone does not determine its slope.

Direct inputs: `VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor`, `VectorBundlesAndIsocrystals:VB1/degree-rank-slope-and-HN-formalism`, `VectorBundlesAndIsocrystals:VB1/geometric-semistability`, `VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`, `VectorBundlesAndIsocrystals:VB0/tensor-and-dual-slopes`.

Sources: [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Example II.2.11 and proof, p. 69.

### 2. Fixed-slope abelian finite-length category

Node: `VectorBundlesAndIsocrystals:VB2:classification/fixed-slope-abelian-category`; declaration `fixedSlopeAbelian`.

For each λ∈Q, semistable bundles of slope λ together with the zero bundle form an E-linear abelian finite-length category. Its simple objects are the stable bundles. Kernels and cokernels inside this category are saturated bundle kernels and quotients; a nonzero map between stable equal-slope objects is an isomorphism. This statement precedes classification and does not yet identify all simple objects with O(λ).

The proof proceeds as follows. Use slope inequalities on kernel and saturated image to force equality in rank/degree and eliminate torsion in the cokernel. Strict rank decreases bound chains of subobjects; simple means no proper same-slope subobject, equivalent to stability.

Acceptance: O⊕O has a proper slope-zero subobject; it is not simple even though semistable.

Direct inputs: `VectorBundlesAndIsocrystals:VB1/geometric-semistability`, `VectorBundlesAndIsocrystals:VB1/harder-narasimhan-filtration`, `VectorBundlesAndIsocrystals:VB1/saturation-and-torsion-degree`.

Sources: [FF18-courbes](https://webusers.imj-prg.fr/~laurent.fargues/Courbe_fichier_principal.pdf), Theorem 5.5.4 and Proposition 5.5.6, pp. 163–164.

### 3. Base change of the geometric HN filtration

Node: `VectorBundlesAndIsocrystals:VB2:classification/HN-filtration-base-change`; declaration `hnBaseChange`.

For an extension of complete algebraically closed perfectoid fields C⊂C′, the pullback of every threshold HN piece is the corresponding threshold piece on X_C′. For finite separable E′/E of degree n, the finite coefficient curve map f satisfies (f*V)^{≥λ}=f*(V^{≥λ/n}); ranks are preserved and degrees/slopes multiply by n. In particular f*O(1)=O(n). These are geometric-field and coefficient changes with different normalizations.

The proof proceeds as follows. Induct on rank and descend the candidate highest-slope subbundle through the geometric extension using VD and absence of Hom from higher to lower slopes. For coefficients first use an unramified/Galois splitting cover and the explicit block pullback; apply uniqueness to the descended HN filtration and the determinant degree scaling.

Acceptance: For an unramified quadratic coefficient extension the threshold ≥1 pulls back the original threshold ≥1/2. Extending C alone does not rescale slopes.

Direct inputs: `VectorBundlesAndIsocrystals:VB1/harder-narasimhan-filtration`, `VectorBundlesAndIsocrystals:VB1/v-descent-for-bundles-and-cohomology`, `VectorBundlesAndIsocrystals:VB0/scalar-extension-adjunction`, `VectorBundlesAndIsocrystals:VB1/degree-rank-slope-and-HN-formalism`, `VectorBundlesAndIsocrystals:VB2:classification/fixed-slope-abelian-category`, `VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor`.

Sources: [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Proposition II.2.13 and proof, pp. 69–70.

### 4. Nonzero sections of the key rank-one extension

Node: `VectorBundlesAndIsocrystals:VB2:classification/key-extension-lemma`; declaration `keyExtensionSection`.

Let C be complete algebraically closed and let 0→O(−1)→V→O(1/n)→0 be a bundle extension on X_C, n≥1. After an extension C′/C of complete algebraically closed perfectoid fields, H⁰(X_C′,V)≠0. The proof applies in both mixed and equal characteristic and does not require a prior claim that the negative Banach–Colmez quotient is nonperfectoid in equal characteristic.

The proof proceeds as follows. Assuming no section after any extension makes the connecting map from positive H⁰ into H¹(O(−1)) injective. Use the basic BC connectedness and negative presentation A¹/E supplied by Tw and the BC owner. The image contains a nonclassical point and hence is open after extension; π-contraction forces surjectivity. Compose the quotient map A¹→A¹/E, the assumed inverse, and a nonzero untilt evaluation to obtain a nonzero E-linear affine-line diamond endomorphism with nontrivial kernel. In mixed characteristic use analytic maps A¹→A¹; in equal characteristic use maps of the perfected analytic affine line, whose convergent additive series may initially have fractional p-power exponents. In both cases g(πX)=πg(X) kills every exponent except 1, so g(X)=aX, contradicting the kernel. G-KEY records the missing supplier comparison and open-image verification.

Acceptance: At n=1 this gives the section required by the rank-two induction, with the same equal-characteristic proof route.

Direct inputs: `VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`, `VectorBundlesAndIsocrystals:VB1/frobenius-two-term-cohomology`, `VectorBundlesAndIsocrystals:VB1/v-descent-for-bundles-and-cohomology`, `VectorBundlesAndIsocrystals:VB3:positive-basic-examples/fundamental-exact-sequence`, `AdicEtaleGeometry:A1`.

Sources: [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Lemma II.2.15 and proof, pp. 71–72.

### 5. Geometric classification of vector bundles

Node: `VectorBundlesAndIsocrystals:VB2:classification/dieudonne-manin-classification-of-bundles`; declaration `geometricBundleClassification`.

For complete algebraically closed perfectoid C/F_q, every bundle on X_C is a finite direct sum of O(λ), uniquely up to permutation of reduced rational slopes and multiplicities. The HN filtration splits, and every semistable slope-λ bundle is O(λ)^{⊕m}. After choosing the embedding k=bar F_q→C, the finite-isocrystal functor induces a bijection on isomorphism classes in this geometric setting, but is not fully faithful on all morphisms and is not asserted to classify relative bundles on arbitrary S.

The proof proceeds as follows. If V is not semistable, induct on rank and split its HN extensions using positive-slope H¹ vanishing. Reduce fixed slope λ=s/h to zero by finite unramified coefficient pullback and the fixed-slope abelian finite-length category. After the slope-zero argument gives O(s)→f*V, use the reverse trace adjunction Hom(f_*O(s),V)≅Hom(O(s),f*V), with f_*O(s)=O(λ), to obtain a nonzero standard-bundle map. Stability and finite length finish the fixed-slope induction. Zero-twist H¹ vanishing, applied after the standard tensor/denominator comparison, splits the remaining equal-slope extensions; the ordinary pullback-left-adjoint direction alone cannot transfer this map. To justify replacing C by an extension, argue conditionally: if V becomes trivial there, then Isom(O^rank(V),V) is a v-locally trivial GL_rank(V)(E)-torsor by H⁰(O)=E and VD; D3 makes this a pro-étale torsor over the algebraically closed point, hence trivial. This does not assume V is already v-locally trivial. Now use GG to choose minimal d with O(−d) injecting into a slope-zero V; apply the rank induction and the key extension lemma after allowed extensions to rule out d≥2 and handle d=1, thereby proving triviality. Uniqueness follows from stable slopes and rank multiplicities. For lack of full faithfulness, Hom_Φ(D(0,1),D(−1,1))=0 while Hom(O,O(1))=H⁰(O(1))≠0.

Acceptance: O(1)⊕O(−1) has the two displayed summands; slope-zero rank m is O^{⊕m}. The explicit O→O(1) example detects a false full-faithfulness assertion.

Direct inputs: `VectorBundlesAndIsocrystals:VB0/dieudonne-manin-isocrystals`, `VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor`, `VectorBundlesAndIsocrystals:VB2:classification/standard-bundle-stability`, `VectorBundlesAndIsocrystals:VB2:classification/fixed-slope-abelian-category`, `VectorBundlesAndIsocrystals:VB1/harder-narasimhan-filtration`, `VectorBundlesAndIsocrystals:VB2:classification/HN-filtration-base-change`, `VectorBundlesAndIsocrystals:VB2:classification/key-extension-lemma`, `VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`, `VectorBundlesAndIsocrystals:VB0/scalar-extension-adjunction`, `DiamondsAndVStacks:D3/locally-profinite-torsors`, `VectorBundlesAndIsocrystals:VB2:ampleness/quantitative-global-generation`.

Sources: [FS-geometrization](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Theorem II.2.14 and proof, pp. 70–72; [FF18-courbes](https://webusers.imj-prg.fr/~laurent.fargues/Courbe_fichier_principal.pdf), Theorem 8.2.10, pp. 238–239.

### 6. Hom and extension calculus for geometric bundles

Node: `VectorBundlesAndIsocrystals:VB2:classification/hom-and-ext-calculus`; declaration `bundleHomExt`.

For geometric standard bundles on X_C^alg, compute Ext in the abelian category of structure-sheaf modules (equivalently QCoh for these finite locally free inputs), with Ext¹ also classifying bundle extensions. Hom(O(λ),O(μ))=H⁰(O(λ)∨⊗O(μ)) vanishes for λ>μ, and Ext¹(O(λ),O(μ))=H¹(O(λ)∨⊗O(μ)) vanishes for λ≤μ. The tensor decomposes into h_λh_μ/h_{μ−λ} copies of O(μ−λ). Ext^i between these bundles vanishes for i>1. Equal-slope End(O(λ)) need not be E when its denominator exceeds one.

The proof proceeds as follows. SF.0 supplies Hom/Ext versus cohomology for a finite locally free source in the abelian module-sheaf category. Use GAGA for geometric analytic/schematic cohomology comparison and the two-affine-cover theorem for schematic higher cohomology vanishing. Then apply exact tensor Frobenius calculus. Apply positive, zero and negative twist cases with μ−λ; preserve the ordering of source and target. For the tensor multiplicity use the correctly indexed formula O(d₁,h₁)⊗O(d₂,h₂)=O(d₁h₂+d₂h₁,h₁h₂). In the noncoprime cover calculation put δ=gcd(h₁,h₂), decompose the pulled-back second factor into δ copies with denominator h₂/δ, and apply the coprime calculation to h₁/δ and h₂/δ. This repairs the source proof slips recorded in E16–E18.

Acceptance: Hom(O(1),O)=0 but Hom(O,O(1))≠0. Ext¹(O(−1),O(1))=0, while the reverse direction can have nontrivial extensions.

Direct inputs: `VectorBundlesAndIsocrystals:VB2:classification/dieudonne-manin-classification-of-bundles`, `VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`, `VectorBundlesAndIsocrystals:VB0/tensor-and-dual-slopes`, `VectorBundlesAndIsocrystals:VB1/frobenius-two-term-cohomology`, `SchemeAndStackFoundations:SF.0`, `VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence`, `VectorBundlesAndIsocrystals:VB2:ampleness/two-affine-cover-cohomological-dimension`.

Sources: [FF18-courbes](https://webusers.imj-prg.fr/~laurent.fargues/Courbe_fichier_principal.pdf), Proposition 5.6.23(4)–(5), statement p. 181; proof p. 183.

### 7. Stable-bundle division endomorphism comparison

Node: `VectorBundlesAndIsocrystals:VB2:classification/bundle-endomorphism-comparison`; declaration `stableBundleEnd`.

The natural E-algebra map End_Φ(D(−d,h))→End_{X_C}(O(d/h)) is an isomorphism for each reduced rational slope. Both identify with D_{d/h}, of dimension h² and invariant d/h mod Z. This full endomorphism comparison on one simple block coexists with the failure of full faithfulness between different slopes.

The proof proceeds as follows. The functor injects intertwining matrices into bundle endomorphisms. Pull to the unramified denominator cover, compute invariants after tensor decomposition using HE and H⁰(O)=E, and obtain dimension h². Compare with the cyclic-algebra basis; the injective map between equal finite dimensions is an algebra isomorphism.

Acceptance: End(O(1/2)) has E-dimension 4; it is not a matrix algebra over E and not just E.

Direct inputs: `VectorBundlesAndIsocrystals:VB0/endomorphism-division-algebra`, `VectorBundlesAndIsocrystals:VB0/slope-division-algebra`, `VectorBundlesAndIsocrystals:VB0/brauer-invariant-sign`, `VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor`, `VectorBundlesAndIsocrystals:VB2:classification/hom-and-ext-calculus`.

Sources: [FF18-courbes](https://webusers.imj-prg.fr/~laurent.fargues/Courbe_fichier_principal.pdf), Proposition 8.2.8 and proof, pp. 237–238.

### 8. Coherent sheaves on the geometric curve

Node: `VectorBundlesAndIsocrystals:VB2:classification/coherent-sheaf-classification`; declaration `geometricCoherentClassification`.

Every coherent sheaf F on X_C^alg is, noncanonically, a direct sum T⊕V with T its torsion subsheaf and V a finite sum of O(λ). T has finite support at closed untilt points and each local piece is a finite sum of O_x/(t_x^{n_j}), n_j>0. The torsion-free quotient is locally free because the curve is regular and one-dimensional; the split is not claimed canonical. This specializes CN Theorem 3.9(iii) at E=Q_p and applies to the general-E geometric curve using its DVR charts.

The proof proceeds as follows. Take the canonical finite-support torsion subsheaf; the finite torsion-free quotient is locally free on each DVR chart. The extension splits because Ext¹(V,T)=H¹(V∨⊗T)=0 for finite-support sheaves, using affine support and Čech acyclicity. Use the elementary-divisor classification of finite-length modules over a DVR and Cl for V.

Acceptance: O_x/(t_x²) is torsion of degree 2 and rank 0; it is not a rank-one bundle. Only the torsion subobject and quotient are canonical, not a chosen splitting.

Direct inputs: `VectorBundlesAndIsocrystals:VB2:ampleness/schematic-curve-at-a-geometric-point`, `VectorBundlesAndIsocrystals:VB1/completed-local-ring-comparison`, `VectorBundlesAndIsocrystals:VB1/saturation-and-torsion-degree`, `VectorBundlesAndIsocrystals:VB2:classification/dieudonne-manin-classification-of-bundles`, `VectorBundlesAndIsocrystals:VB2:classification/hom-and-ext-calculus`, `SchemeAndStackFoundations:SF.0`.

Sources: [CN25](https://arxiv.org/pdf/2108.12785), §3.2.3, Theorem 3.9(iii), pp. 14–15.

### 9. Geometric simple connectivity via finite étale algebras

Node: `VectorBundlesAndIsocrystals:VB2:classification/finite-etale-constant-algebras`; declaration `finiteEtaleConstantAlgebras`.

For complete algebraically closed perfectoid C, every finite étale O_{X_C}-algebra B is canonically O_{X_C}⊗_E A with A=H⁰(X_C,B) a finite étale E-algebra. Thus finite étale covers of X_C are exactly coefficient-field covers; after base change to an algebraic closure of E they split. The statement is not that X_C has no nontrivial covers over nonalgebraically closed E. Export this theorem to VStackSheavesAndLisseCategories:VS1 for its divisor and Weil-map construction.

The proof proceeds as follows. The perfect trace pairing B≅B∨ forces degree zero. A maximal positive-slope summand would have sufficiently high products mapping into slopes above every summand, hence be nilpotent by Hom vanishing; finite étale algebras are reduced, giving a contradiction. Self-duality excludes negative slopes as well. Cl makes B a trivial bundle. Its algebra maps are constant since H⁰(O)=E, so B=O⊗A. The perfect trace pairing makes A finite étale; inverse scalar extension proves the category equivalence.

Acceptance: A finite separable E′/E gives the nontrivial coefficient cover O⊗E′ and is not excluded. Over bar E every finite étale coefficient algebra is a finite product of bar E.

Direct inputs: `VectorBundlesAndIsocrystals:VB2:classification/dieudonne-manin-classification-of-bundles`, `VectorBundlesAndIsocrystals:VB2:classification/hom-and-ext-calculus`, `VectorBundlesAndIsocrystals:VB1/degree-rank-slope-and-HN-formalism`, `VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence`, `SchemeAndStackFoundations:SF.0`, `AdicSpacesPartII:R3/etale-iff-trace-pairing-perfect`.

Sources: [FF18-courbes](https://webusers.imj-prg.fr/~laurent.fargues/Courbe_fichier_principal.pdf), Theorem 8.6.1 and proof, pp. 248–249; [SW20](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf), Theorem 13.5.7 and proof, printed p. 114 (PDF p. 124).

## Source corrections that affect the plan

The packet preserves nineteen independently confirmed source findings, with
their identifiers and review provenance. The source assertions and review
reasons are described in our own words. In the current Fargues–Fontaine copy,
the polygon misprint is on printed p. 163, the stability misprint on p. 164,
the coefficient-ring defects on pp. 229 and 234–236, and the coefficient
adjunction misprint on p. 238. Main-text PDF pages add 60 to these numbers;
the packet also preserves the original edition's locators.

E15 records the independently confirmed twist-sign misprint. In the
arXiv v5 text of KL6.3.17, the displayed p^{-n} eigenspace is identified with
M(n) invariants, although Definition 6.2.1 scales the twisted Frobenius by
p^{-n}. The invariant equation is therefore φ(v)=p^n v. We reindex the norm
proof and include `twistedInvariant_sign` to distinguish the two spaces on a
rank-one module. The publisher's full-document link returned HTTP 404; this
finding is scoped to the hashed preprint. Kedlaya's errata page and Part II
Appendix A were checked and contain no correction for this lemma.

The slope block and HN conventions incorporate the following corrections:
the Witt coefficient scalar is a fraction field; a stable subobject test
excludes the object itself; the HN polygon uses coordinates (rank, degree),
not (degree, rank); the coefficient adjunction uses the bundle category
rather than fixed points. In CN §3.2.2, a purported extension interval bound
has only a lower bound on one term and an upper bound on the other. The split
extension O(5)⊕O violates the claimed interval [0,1]. Both terms must have
slopes within the interval. No node uses the uncorrected assertion.

For FS twist cohomology, coefficient recurrence is φ(r_i)=r_{i−n}; the
rational-slope exponent follows the reduced numerator/denominator convention;
negative-twist induction uses O(n)[1] and O(n+1)[1] for n<−1. The positive
open ball has dimension the numerator d of λ=d/h, not the bundle rank h.

The FS quantitative estimate (II.2.1) is false with its printed radius
convention, and another inclusion drops a factor π^{−N}. Generation is
therefore proved through KL6.2.2–6.2.4: each half annulus has a contraction
constant strictly below one, and two finite families of invariant sections
are needed. A claim of generation from one half annulus is insufficient.
G-GG records the general-E comparison of that corrected route. For GAGA,
formal chart maps glue on their union; global generation proves that this
union is the entire space.

The KL ampleness proofs use both affine charts when extending local
generators, positive-twist H¹ vanishing rather than a circular invocation of
ampleness, and a single exponent n_0 chosen at e=0 before treating every
integer twist e. The zero bundle satisfies KL’s tensor-power global-ampleness
definition vacuously; O fails it against O(−1). These tests distinguish this
notion from other conventions for ample vector bundles.

E16–E19 record additional slips in FF5.6.23, printed pp. 182–183.
The projection formula keeps d/δ as its twist; coefficient pullback has
degree nd and the pullback arrow must have the correct target. For general
pullback use induction or the disjoint-component fiber product, since dividing
one denominator by the gcd need not make it coprime to the other. Tensor
products retain both pairs (d₁,h₁),(d₂,h₂); divide both denominators by their
gcd before applying the coprime case. The last cohomology identity uses the
line on X_h. These findings were already partly recorded by the FF paper
extraction E116–E120; the current copy fixes its older condition-number slip.
The packet records current printed/PDF pages, explicit repairs and independent
verdicts, rather than importing the extraction’s older pagination.

## Supplier contracts and ownership

### `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`

Supply the completed maximal unramified coefficient field with arithmetic q-Frobenius and finite unramified extensions. Completion and ramified-Witt comparison belong to RF0; the existing unramified Frobenius theory is imported, not replanned.

Consumers: `VectorBundlesAndIsocrystals:VB0/isocrystal-category-and-standard-block`, `VectorBundlesAndIsocrystals:VB0/endomorphism-division-algebra`, `VectorBundlesAndIsocrystals:VB0/scalar-extension-adjunction`.

### `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-5-local-coefficients-the-brauer-group-the-local-invariant-and-duality`

Supply the general cyclic algebra Cyc(E_h/E,arithmetic σ,π^d), its central-simple structure, the algebraic BrauerGroup ↔ cohomological H² comparison, and inv=d/h. Include restriction multiplication by total extension degree and opposite inversion. These general algebraic/arithmetic inputs are owned by Class field theory; this packet only specializes to slope labels.

Consumers: `VectorBundlesAndIsocrystals:VB0/slope-division-algebra`, `VectorBundlesAndIsocrystals:VB0/brauer-invariant-sign`.

### `RelativeFarguesFontaine:RF0/ramified-witt-universal-property`

Extend the existing ramified Witt universal property to its fraction field L=breve E and q-Frobenius, plus the general-E/integral tilted Robba coefficient comparison. Normalize π_E and σ_E, preserve topology and Frobenius under E′/E; equal characteristic uses R[[π]] and its fraction field.

Consumers: `VectorBundlesAndIsocrystals:VB0/isocrystal-category-and-standard-block`, `VectorBundlesAndIsocrystals:VB1/tilted-robba-ring`, `VectorBundlesAndIsocrystals:VB1/robba-frobenius-modules`, `VectorBundlesAndIsocrystals:VB1/robba-bundle-equivalence`, `VectorBundlesAndIsocrystals:VB2:ampleness/norms-on-twisted-invariants`, `VectorBundlesAndIsocrystals:VB2:ampleness/globally-etale-positive-ampleness`.

### `RelativeFarguesFontaine:RF3/isocrystal-line-bundles-and-sign`

Preserve the accepted RS-20 rank-one contract: RF3 exposes O(n), the π^{-n} sign, tensor/dual and untilt-divisor compatibility. The general finite-isocrystal functor belongs to VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor. No full VB1 or ampleness prerequisite is needed for rank-one descent; the current RF0 packet already has this scope.

Consumers: `VectorBundlesAndIsocrystals:VB1/isocrystal-to-bundle-functor`, `VectorBundlesAndIsocrystals:VB1/geometric-point-chart-cover`.

### `RelativeFarguesFontaine:RF3/graded-algebra-and-algebraic-curve-map`

Preserve the accepted RS-20 chart contract: the homogeneous graded ring and maps D(g)→D_+(g) glue only on U=⋃D(g). The current RF0 packet supplies these local maps and overlap laws without claiming U=X. Early geometric coverage is VectorBundlesAndIsocrystals:VB1/geometric-point-chart-cover; general-S coverage and compatible schematic twists are VectorBundlesAndIsocrystals:VB2:ampleness/global-proj-map-and-twists.

Consumers: `VectorBundlesAndIsocrystals:VB1/geometric-point-chart-cover`, `VectorBundlesAndIsocrystals:VB2:ampleness/global-proj-map-and-twists`, `VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence`.

### `SchemeAndStackFoundations:SF.0`

Supply generic locally free sheaf tensor/dual/determinant and exact-sequence identities; QCoh finite-type/global-generation predicates; Proj/localization gluing; extension of sections after clearing homogeneous denominators on qcqs schemes; regular dimension-one torsion-free/coherent and finite-length DVR module facts; finite-support cohomology and affine cohomological criterion. These must apply to the non-finite-type but regular noetherian geometric curve and to the nonnoetherian relative Proj. No algebraic-curve finite-type assumption may be added.

Consumers: `VectorBundlesAndIsocrystals:VB1/finite-locally-free-bundles`, `VectorBundlesAndIsocrystals:VB1/geometric-point-chart-cover`, `VectorBundlesAndIsocrystals:VB2:ampleness/schematic-curve-at-a-geometric-point`, `VectorBundlesAndIsocrystals:VB1/degree-rank-slope-and-HN-formalism`, `VectorBundlesAndIsocrystals:VB1/saturation-and-torsion-degree`, `VectorBundlesAndIsocrystals:VB2:ampleness/global-proj-map-and-twists`, `VectorBundlesAndIsocrystals:VB2:ampleness/gaga-equivalence`, `VectorBundlesAndIsocrystals:VB2:ampleness/prufer-and-coherent-correspondence`, `VectorBundlesAndIsocrystals:VB2:ampleness/two-affine-cover-cohomological-dimension`, `VectorBundlesAndIsocrystals:VB2:ampleness/tensor-global-ampleness`, `VectorBundlesAndIsocrystals:VB2:ampleness/positive-lines-and-finite-type-presentations`, `VectorBundlesAndIsocrystals:VB2:ampleness/ample-section-affineness`, `VectorBundlesAndIsocrystals:VB2:classification/hom-and-ext-calculus`, `VectorBundlesAndIsocrystals:VB2:classification/coherent-sheaf-classification`, `VectorBundlesAndIsocrystals:VB2:classification/finite-etale-constant-algebras`.

### `SchemeAndStackFoundations:SF.1`

Supply effective finite faithfully flat/Galois descent of finite projective modules, with compatible semilinear endomorphisms, both coefficient extension/restriction adjunctions for finite separable field extension, using the perfect trace pairing to identify restriction with coinduction and checking compatibility with Frobenius, plus both adjunctions between finite étale sheaf pullback and pushforward with their units/counits and triangle identities (without dividing by the extension degree), and gluing of such data. V-descent on perfectoid annuli uses the D2 v-theorems in addition; ordinary fpqc descent alone does not establish the analytic v-stack. When a lifted σ′ conjugates the Galois group, require Φ′ρ_g=ρ_{σ′gσ′^{-1}}Φ′; ordinary commutation is the centralizing special case.

Consumers: `VectorBundlesAndIsocrystals:VB0/scalar-extension-adjunction`, `VectorBundlesAndIsocrystals:VB0/finite-galois-descent`, `VectorBundlesAndIsocrystals:VB1/v-descent-for-bundles-and-cohomology`.

### `PerfectoidQuotients:Q4`

Supply FS II.0.2/ECD5.8: a Zariski closed subset of an affinoid perfectoid admits the universal strongly Zariski closed perfectoid quotient, surjective on the ring and almost surjective on the plus ring, compatibly with tilt. The present Q4 packet has radical quotient algebra but no exact named node for this complete geometric statement.

Consumers: `VectorBundlesAndIsocrystals:VB2:classification/classical-points-and-principal-ideal-domains`.

### `KTheoryLowDegrees:Z.1`

Import the existing Z.1 finite-projective presentations, split/exact K₀ universal property and stable-isomorphism criterion: kernels in finite free presentations of the same projective have equal K₀ classes and become isomorphic after finite free stabilization. Z.2 owns locally constant rank and does not supply this argument. The KL contraction route does not require this alternative stabilization argument; Frobenius compatibility remains local work.

Consumers: `VectorBundlesAndIsocrystals:VB2:ampleness/quantitative-global-generation`.

### `AdicEtaleGeometry:A1`

Extend the analytic foundations with the comparison used in FS II.2.15: in mixed characteristic E-linear affine-line diamond maps come from analytic A¹ maps; in equal characteristic use the perfected analytic affine line and convergent additive series allowing fractional p-power exponents. Prove that g(πX)=πg(X) leaves only g(X)=aX, and supply the nonclassical-point/open-image step. Existing étale-site targets do not state this input. Reuse the generic diamond functor rather than duplicating it.

Consumers: `VectorBundlesAndIsocrystals:VB2:classification/key-extension-lemma`.

### `VectorBundlesAndIsocrystals:VB3:positive-basic-examples/banach-colmez-space-definition`

Preserve the current early prerequisites VectorBundlesAndIsocrystals:VB1/finite-locally-free-bundles, VectorBundlesAndIsocrystals:VB1/frobenius-two-term-cohomology and VectorBundlesAndIsocrystals:VB1/v-descent-for-bundles-and-cohomology. The two-term Banach–Colmez definition is H⁰ of derived RΓ for two-term complexes; a cokernel does not define it.

Consumers: `VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`, `VectorBundlesAndIsocrystals:VB1/frobenius-two-term-cohomology`.

### `VectorBundlesAndIsocrystals:VB3:positive-basic-examples/lubin-tate-universal-cover`

Provide FS II.2.2–II.2.4, including the degree-one untilt evaluation, connected basic positive spaces and the negative A¹/E presentation. Preserve the current early definition/Lubin–Tate prerequisites through Bundle/Ann/Coh/VD and the stated formal-group/RF2 inputs. It must not import Tw or HN, since Tw consumes this package. The early fundamental exact sequence is separately requested below without its later VS1 comparison.

Consumers: `VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`, `VectorBundlesAndIsocrystals:VB1/geometric-point-chart-cover`, `VectorBundlesAndIsocrystals:VB2:ampleness/schematic-curve-at-a-geometric-point`, `VectorBundlesAndIsocrystals:VB2:classification/key-extension-lemma`.

### `VectorBundlesAndIsocrystals:VB3:positive-basic-examples/fundamental-exact-sequence`

Export the early untilt sequence 0→O→O(1)→O_{S^sharp}→0 and its degree-one divisor identification using Lubin–Tate evaluation, the early analytic VB1 nodes and RF2 Cartier-divisor inputs. Separate the later VS1 divisor-to-Weil/local-reciprocity comparison into its own declaration. Tw and Key consume only the early sequence, so its supplier must not import VS1, geometric classification or family HN. Preserve the current early definition/Lubin–Tate retargeting; the unresolved later comparison remains with VS1.

Consumers: `VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`, `VectorBundlesAndIsocrystals:VB2:classification/key-extension-lemma`.

### `VectorBundlesAndIsocrystals:VB4`

Own FS II.3.4’s relative geometric-slope vanishings: negative fiber slopes imply H⁰=0; nonnegative slopes kill H¹ after pro-étale cover; positive slopes yield an étale neighborhood with vanishing on every affinoid base change. Their proofs consume VB3 positive resolutions and VB4 family trivialization. Do not route them back into the early twist-cohomology stage.

Consumers: `VectorBundlesAndIsocrystals:VB1/cohomology-of-twists`, `VectorBundlesAndIsocrystals:VB2:classification/dieudonne-manin-classification-of-bundles`.

### `VStackSheavesAndLisseCategories:VS1`

Consume VectorBundlesAndIsocrystals:VB2:classification/finite-etale-constant-algebras for SW20 16.3.2–16.3.6 divisor/Weil-map work. VS1 owns that construction and uses the Class field theory Layer 9 reciprocity input; this packet exports only the constant finite étale algebra theorem required by RT-AREA-geomlanglands/31. Respect the mixed-characteristic scope of the current Layer 9 reciprocity isomorphism; an equal-characteristic divisor/reciprocity use needs a separate supplier, as recorded in upstreamNotes.

Consumers: `VectorBundlesAndIsocrystals:VB2:classification/finite-etale-constant-algebras`.

## Named refinements and stage coverage

### G-INTEGRATION — Atomic early-layer integration

On 2026-10-08 the current RF0 packet already restricts RF3 to rank-one twists and partial homogeneous charts; the current VB3 definition and Lubin–Tate nodes already use the early analytic VB1 nodes. The remaining direct cycle is the VB3 fundamental-exact-sequence node, which combines the early untilt exact sequence with the later VS1 divisor-to-Weil comparison and imports VS1. Tw and Key need only the early exact sequence, whereas VS1 consumes geometric classification. Split the early exact-sequence/divisor identification from the later Weil/reciprocity comparison and keep the early node free of VS1. The existing supplier is under a needs_changes review. Preserve the accepted narrow RF3 contracts and align the aggregate stage graph after this remaining split; only the graph of the requested narrowed contracts is claimed acyclic.

### G-DM — Dieudonné–Manin proof inputs beyond the pinned rank-one theorem

Ked05 4.5.5–4.5.8 provides the mixed-characteristic ramified-coefficient route, but its eigenvector calculation Lemma 4.3.3 imports [19, Lemma 4.12] without a proof read here. A proof of that specific calculation and a full equal-characteristic bar F_q((π)) proof are required. Lurie26 Theorem 6, p. 2 is only a statement source. This gap replaces the inherited claim that no higher-rank proof route had been read.

### G-GEOM — Independent geometric chart-cover proof

Complete the transplantation of FS II.2.9 before general-S GAGA: show at least two distinct untilt divisor classes can be represented by degree-one sections, separate every classical point by a nonvanishing section, prove the homogeneous-localization/analytic chart comparison on their overlaps, and establish the chartwise finite-projective equivalence. This is the early prefix demanded by RT-AREA-padic-1/21. The source states II.2.9 after GAGA, so its printed proof alone does not close this reordered prefix.

### G-HN — HN axiom verification without ampleness

Write the curve-specific verification of FF5.5.1, especially meromorphic trivialization with bounded finite divisor poles and a wedge-power upper bound on degrees of saturated subbundles of every fixed rank. The local DVR and torsion degree work is specified by Sat; generic-fiber exactness and boundedness must not be inferred from the classification theorem or from general-S global generation. FS II.2.12 has no expanded proof.

### G-KEY — Equal-characteristic analytic affine-line input

FS II.2.15 gives the common outline: a nonclassical image point becomes an open image in A¹/E after extending C; contraction makes the map surjective. To obtain the contradiction, compare E-linear affine-line diamond maps with analytic A¹ maps in mixed characteristic and with maps of perfected analytic A¹ in equal characteristic. The latter series may have fractional p-power exponents; π-linearity kills all except exponent 1. Supply this exact comparison and the open-image argument in the analytic foundations owner. These are recorded proof refinements, not an assumption of nonperfectoidness in equal characteristic.

### G-LEAN — Actual curve carriers for source-level signatures

The pinned libraries contain semilinear isocrystals, module sheaves, line-bundle classes and Brauer operations, but no relative Fargues–Fontaine curve, completed tilted Robba ring, its annular descent or HN bundle objects. The suggested file states genuine algebraic and numerical prototypes and finite locally free carrier signatures. Curve-dependent assertions whose hypotheses require these missing supplier carriers are explicitly omitted and indexed by their planned names, rather than encoded by arbitrary propositions. Replace those omissions when the named supplier carriers exist.

### G-GG — General-E corrected annular contraction comparison

FS II.2.6 estimates (II.2.1) and its π-adic inclusion are false as printed (confirmed FS extraction E75/E76). Use the fully read KL6.2.2–6.2.4 proof, whose two half-annuli and contraction constants are specified in GG, then prove its coefficient/radius normalization for general E and equal characteristic using the RF0 annular ring comparison. This gap does not question the generation theorem, but prevents treating the defective published quantitative proof as closed.

| Stage | Coverage | Refinements |
| --- | --- | --- |
| `VectorBundlesAndIsocrystals:VB0` | planned | G-DM: full eigenvector and equal-characteristic proofs; CFT cyclic/cohomological Brauer contract. |
| `VectorBundlesAndIsocrystals:VB1` | planned | G-GEOM: independent chart coverage/local comparison; G-HN: boundedness and generic-fiber axioms; G-INTEGRATION: retarget basic BC/RF3 suppliers; G-LEAN: actual curve carriers. |
| `VectorBundlesAndIsocrystals:VB2` | planned | The two child stages are fully target-planned; their named proof/supplier refinements remain. |
| `VectorBundlesAndIsocrystals:VB2:ampleness` | planned | Supplier coefficient-normalization and K₀ stabilization contracts; SF0 nonnoetherian Proj/global-generation and affineness inputs; G-INTEGRATION and G-LEAN. G-GG: general-E comparison for the corrected KL contraction proof. |
| `VectorBundlesAndIsocrystals:VB2:classification` | planned | G-KEY: both-characteristic analytic input; prerequisite G-DM/G-GEOM/G-HN; VS1 export integration and G-LEAN. |

VB2 is the aggregate of its two children; the classification node also realizes that aggregate. The retained classical-point and regular-curve identifiers now have VB1 as parent, while retaining their original target realization. No target or correct identifier is discarded.

## Atlas presentation

| Layer | Planets |
| --- | --- |
| `VectorBundlesAndIsocrystals:VB0` | Finite isocrystals; Rational Frobenius blocks; Dieudonné–Manin theorem; Isocrystal endomorphism algebra |
| `VectorBundlesAndIsocrystals:VB1` | Curve vector bundles; Frobenius cohomology complex; V-descent for curve bundles; Isocrystal-to-bundle functor; Picard degree; Harder–Narasimhan filtration |
| `VectorBundlesAndIsocrystals:VB2:ampleness` | Positive-twist global generation; Fargues–Fontaine GAGA; Tensor global ampleness; Cohomological ampleness criterion |
| `VectorBundlesAndIsocrystals:VB2:classification` | Geometric bundle classification; Stable-bundle endomorphism algebra; Geometric simple connectivity |

The proposed reader sublayers separate the analytic and geometric prefixes of VB1, and the algebraization, Robba topology and ampleness-criteria groups of VB2:ampleness. Current parent IDs remain authoritative until the restructuring is applied. Each current layer has at most six planets. The packet records the atomic dependency retargeting and the simple-connectivity export to VS1; it does not edit those suppliers.

## Public sources and editions

- [Geometrization of the local Langlands correspondence](https://people.mpim-bonn.mpg.de/scholze/Geometrization.pdf), Laurent Fargues; Peter Scholze. Author-hosted 356-page PDF; printed page equals PDF page; bytes reproduce the inherited hash. Read passages: II.1.11–14 and II.1.22, pp. 53–57: classical points, annular rings and quotient curve; II.2, pp. 57–72: complete descent, basic cohomology, ampleness, GAGA and geometric classification proofs; II.3.4, p. 79: relative slope-vanishing uses assigned to the VB3/VB4 part. SHA-256 `9ab9efbd0df251bfa3b610d1d1d88a8dfb1bdf7c397bd04f4c277280d98ae905`.
- [Courbes et fibrés vectoriels en théorie de Hodge p-adique](https://webusers.imj-prg.fr/~laurent.fargues/Courbe_fichier_principal.pdf), Laurent Fargues; Jean-Marc Fontaine; preface Pierre Colmez. Current author-hosted 404-page version of Astérisque 406 (2018). Main-text pagination restarts after the preface; use printed main-text pages, not the inherited continuously paginated edition. Read passages: 5.5.1–5.5.6, pp. 162–164: exact-category HN axioms, filtration, polygons, fixed slope; 5.6.22–5.6.23, pp. 181–183: pullback, tensor, dual and Hom/Ext of slope bundles; 8.2.3–8.2.4, pp. 236–239: isocrystals, cyclic endomorphism algebra, coefficient adjunction, classification; 8.5.1 and 8.6.1, pp. 248–249: geometric simple connectivity and finite étale algebras. SHA-256 `8c020573d3dce341088ea7e83fe1063b410686c08e3a144fa3c0de634667cc79`.
- [Relative p-adic Hodge theory: Foundations](https://arxiv.org/pdf/1301.0792), Kiran S. Kedlaya; Ruochuan Liu. arXiv:1301.0792v5; 210 PDF pages; printed pages cited. Read passages: 6.2.1–6.2.6, pp. 135–137: complete contraction and two-half-annulus generation proof; 6.3.5–6.3.19, pp. 138–143: Prüfer charts, categories, invariant norms and cohomology; 7.3.4–7.3.5, pp. 148–149: local and global pure/étale models; 8.7.6–8.7.7, p. 178: two affine charts and cohomological dimension; 8.8.1–8.8.9, pp. 180–182: global ampleness, power and cohomology criteria, affineness. SHA-256 `a6a117423db62aec072442bb15b70e3175bcc3b631bdcd6d74f740e3c6cfd942`.
- [On the generic part of the cohomology of compact unitary Shimura varieties](https://annals.math.princeton.edu/wp-content/uploads/annals-v186-n3-p01-p.pdf), Ana Caraiani; Peter Scholze. Publisher PDF, Annals of Mathematics 186 (2017), pp. 649–766; citations use printed pages. Read passages: 3.2.10–3.2.13, printed p. 681: relative tilted Robba ring and Frobenius modules; 3.3.4, printed p. 683: exact tensor equivalence with curve bundles. SHA-256 `4f9449e5ecfd8fb8b43a04acef73060f531be995babaa9f744f3db36aaa5e61a`.
- [On the cohomology of p-adic analytic spaces, II: the C_st-conjecture](https://arxiv.org/pdf/2108.12785), Pierre Colmez; Wiesława Nizioł. arXiv:2108.12785v4, 25 November 2024; paper-route identifier CN25 retained; citations use printed pages and §3.2 numbering. Read passages: 3.2.1–3.2.4, pp. 14–15: Q_p curve, closed points, completed local rings, slopes and cohomology; abstract Banach–Colmez theory remains VB3-owned. SHA-256 `83c6afdc8a377e38dced9dd8b400cb3461a2d47de2664a094e81a04332051361`.
- [Berkeley Lectures on p-adic Geometry](https://people.mpim-bonn.mpg.de/scholze/Berkeley.pdf), Peter Scholze; Jared Weinstein. Author-hosted 260-page PDF; PDF page = printed page + 10. Read passage: Theorem 13.5.7 and proof, printed p. 114 (PDF p. 124): finite étale algebras and classification argument for simple connectivity. SHA-256 `225505171ef809aa0070c023c881ff1da844923775f2d631474c0b42eea4bffc`.
- [Slope filtrations revisited](https://ems.press/content/serial-article-files/25974), Kiran S. Kedlaya. Documenta Mathematica 10 (2005), 447–525. Read passages: 2.0.1 and 2.1.1–2.1.4, pp. 451–452: ramified Witt coefficients and Frobenius; 3.1.1–3.1.6, pp. 477–478: standard modules and pushforward; 4.1.1–4.1.2, p. 487: standard blocks and tensor multiplicities; 4.5.1–4.5.12, pp. 497–499: Dieudonné–Manin and descent; Lemma 4.3.3 remains a specifically identified proof input. SHA-256 `9a9e305e74a57c459311bb5d90ec0d38bd7b6551da6152f2f94e586d6ce4bd68`.
- [Lecture 26: Isocrystals](https://www.math.ias.edu/~lurie/205notes/Lecture26-Isocrystals.pdf), Jacob Lurie. Three-page lecture note; statement source, not a full proof of Dieudonné–Manin. Read passages: Definition 1 and standard blocks, p. 1; Theorem 6, p. 2; Warning 17, p. 3 on lack of full faithfulness. SHA-256 `73fcb0f228e194ba1e4db21957702d861d6abaeae4c11bc3a66511a0b91251ea`.
- [The connected components of affine Deligne–Lusztig varieties](https://arxiv.org/pdf/2208.07195), Ian Gleason; Dong Gyu Lim; Yujie Xu. arXiv:2208.07195v3, 10 November 2025, 57 pages; atlas paper-route identifier GLX26 retained. Read passages: 5.1, pp. 31–32: tensor isocrystal input to filtered/G-isocrystal consumers; filtered objects are outside this part. SHA-256 `d2249ddbe1ae2f4728000d27846d396adffc97b2f8b7b1c82c5d2701153fcb12`.


## Suggested signatures and validation limits

The suggested file elaborates against pinned Mathlib 082e2d3 with only
admitted-proof warnings. Its core has 36 of the 98 planned API names as typed specializations,
30 of the 72 discriminating tests as examples, and three of the 33 named
theorem/comparison signatures in the finite Witt coefficient specialization.
Eight of the eighteen definition/construction carriers have typed interfaces.
The full contract index records every planned name, its mathematical contract,
and whether its signature or geometric comparison is omitted. There are 62
omitted API signatures, 42 omitted examples and 30 omitted theorem signatures;
several typed interfaces also need the explicit comparisons listed there.

The algebraic interfaces use actual finite modules, invertible semilinear
maps, projective integral models, kernels, cokernels and continuous commuting
actions. The schematic bundle interface uses a finite/free witness on the
same trivializing neighbourhood. The numerical HN polygon takes ranked
degree pieces; its identification with graded curve bundles remains an
obligation. The Witt conversion preserves the given module structure and
checks intertwining, rather than discarding the designated Frobenius.

Actual relative FF curves, Robba topologies, HN subobjects and the diamond
comparison needed for the key extension theorem are unavailable at the pin.
Their hypotheses are left in the definitive mathematical plan and indexed
as omissions, as permitted by PROTOCOL §13; no arbitrary proposition or
invented geometric predicate stands in for them. G-LEAN records this common
refinement. Three relevant Tau Ceti imports are listed in comments but were
not compiled: their pinned source declarations were read, and no existing
compiled modules at that Tau Ceti pin were available. The successful check
therefore certifies the Mathlib interfaces' types, with proofs unfinished.
