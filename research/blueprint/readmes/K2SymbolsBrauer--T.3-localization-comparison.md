# Explicit K₂: localization, residues and transfers

This part compares the symbol theory with the connecting maps of ring
K-theory. It starts with Milnor residues and norms already constructed in
T.3:symbols and T.4. Its output is a comparison of the actual homomorphisms,
with conventions strong enough to transport the Dedekind localization sequence
and its finite-transfer diagram. Higher Milnor residues are compared with
products in Quillen K-theory in every degree; invertibility of the product map
is used only in degree two.

The order is T.3:symbols → T.4 → T.3:localization-comparison. The construction
of Milnor residues, their product law, their finite support and Bass–Tate/Kato
norms belongs to the first two parts. GeneralAlgebraicKTheory K.3 supplies
localization, dévissage, resolution and Quillen transfers; K.7 supplies
products. SchemeKTheoryOperations S.3 and EllipticKTheory E.3 consume the
comparison here and supply their own scheme and curve adapters.

## Conventions and existing inputs

All Milnor and Quillen groups are written additively. A group of units is
written multiplicatively when displaying a degree-two residue. Thus a minus
sign on a residue homomorphism becomes inversion of its values.

Let R be a commutative discrete valuation ring, F its fraction field, k its
native residue field, and π a uniformizer. Its additive order is normalized
by ord(π)=1. For f=πᵃu and g=πᵇv with u,v∈Rˣ, the roadmap tame symbol is

\[
 t_v(f,g)=(-1)^{ab}\bar u^{\,b}\bar v^{-a}.
\]

It has t_v(u,π)=ū, t_v(π,u)=ū⁻¹ and t_v(π,π)=−1. The K-book's tame symbol
in III.6.3 is its inverse. That difference is retained throughout.

The imported higher residue r_v,n has the uniformizer **last**:

\[
 r_{v,n}\{u_1,\ldots,u_{n-1},\pi\}
   =\{\bar u_1,\ldots,\bar u_{n-1}\},\qquad
 r_{v,n}\{u_1,\ldots,u_n\}=0.
\]

Here n≥1, the uᵢ are units, K⁽ᴹ⁾₀(k)=ℤ, and the empty symbol is 1 in
degree zero. In particular r_v,1 is ord, while r_v,2 is t_v after identifying
K⁽ᴹ⁾₁(k) with kˣ. The parameter-first residue in Weibel III.7.3 is
(−1)ⁿ⁻¹r_v,n.

The unit-part specialization λ_π is the graded ring homomorphism

\[
 \lambda_\pi\{u_1\pi^{a_1},\ldots,u_n\pi^{a_n}\}
       =\{\bar u_1,\ldots,\bar u_n\}.
\]

It depends on π. The single owner of both maps is
`K2SymbolsBrauer:T.3/higher-milnor-residues`, parented in T.3:symbols. Its
Serre algebra writes d_π(x)=λ_π(x)+r_v(x)Π, with Π on the right,
Π²={−1}Π and Πa=(−1)ᵈᵉᵍ⁽ᵃ⁾aΠ. The imported product formula is

\[
 r_v(xy)=\lambda_\pi(x)r_v(y)+(-1)^j r_v(x)\rho_\pi(y),
 \quad y\in K^M_j(F),
\]

where ρ_π{uπᵃ}={(−1)ᵃū}. The imported parameter-change formula is
λ_(uπ)(x)=λ_π(x)−r_v(x){ū}. These conventions use the corrections already
recorded for Exercises III.7.1 and III.7.10; neither exercise is used to assert
that λ is uniformizer-independent.

The usable API of these imported maps comprises their symbol evaluations,
additivity, the specialization's unital ring structure, the residue product
law, parameter independence of r, the stated change of λ and surjectivity of
both maps. Three checks distinguish these inputs: at the 5-adic valuation,
r₂{2,5}=2, r₂{5,2}=3, and r₂{5,5}=4 in 𝔽₅ˣ; λ₅,1{5}=0 but
λ₁₀,1{5}={3}; and r₃{u,v,π}={ū,v̄} for units, while an all-unit
three-symbol has zero residue. Skew-commutativity does not make {π,π} vanish.

Write Φ_n:K⁽ᴹ⁾ₙ(F)→Kₙ(F) for the degree-n component of the imported
unital graded product map. It sends an ordered symbol to the ordered product
of its K₁ unit classes. In degree two use the specific equivalence

\[
 \Phi_2=\theta_2^\natural\circ m_F,
 \qquad \theta_2^\natural(z)=\theta_2(\varepsilon z),
 \quad \varepsilon\in\{1,-1\}.
\]

Here m_F is symbol-preserving Matsumoto, θ₂ is T.1's Hurewicz-normalized
classical-to-Quillen equivalence, and ε is the constant torus-orientation sign
of T.2/unit-loop-product-symbol. T.2/graded-map-degree-two-identification
supplies this precise equality. An unspecified classical K₂ equivalence
cannot be substituted into a boundary formula without transporting ε.

Let Dₙ:Kₙ(F)→Kₙ₋₁(k) be the actual localization connecting map, with
D₁[π]=[k]=1. It uses the right module convention

\[
 D(x\,j^*y)=D(x)\,\bar y.
\]

Consequently D(j*y·x)=(−1)ᵈᵉᵍ⁽ʸ⁾ȳD(x). The notation
δₙ=(−1)ⁿ⁻¹Dₙ denotes a degreewise signed map, rather than a change to the
underlying localization fibration. No completeness, coefficient field, finite
residue field or characteristic hypothesis is imposed on the DVR.

The named ring inputs are K.3/abelian-localization-theorem,
K.3/devissage-theorem, K.3/resolution-theorem,
K.3/localization-degree-one-index, K.3/dvr-degree-one-boundary and
K.3/localization-product-boundary. The index convention sends a generically
invertible map α to [coker α]−[ker α], so multiplication by π has positive
boundary. The torsion Serre quotient and its localization/finite-transfer
naturality are also required; their exact contract appears below.

## The local comparison in every degree

**Target — Milnor–Quillen residue comparison**
(`T.3:localization-comparison/product-residue-comparison`). For every n≥1,

\[
 D_n\Phi_n=(-1)^{n-1}\Phi_{n-1}r_{v,n},
 \qquad \delta_n\Phi_n=\Phi_{n-1}r_{v,n}.
\]

This refines the existing `T.3/localization-boundary` target and does not
introduce a second localization theorem. To prove it, expand each symbol
using fᵢ=uᵢπᵃⁱ. Bilinearity and {π,π}={−1,π} reduce to all-unit symbols
and symbols with one π in the final slot. All-unit products lift to Kₙ(R)
and have zero boundary by exactness. A unit product b of degree n−1 satisfies

\[
 D_n(\Phi_{n-1}(b)[\pi])
       =(-1)^{n-1}\Phi_{n-1}(\bar b)D_1[\pi].
\]

Reduction of its product is the product of its reductions, by K.7
naturality. Agreement on these generators proves equality of homomorphisms.
This argument asserts neither a Milnor K-theory splitting over R nor
injectivity of Φ in higher degrees.

In degree two, expansion gives the explicit value

\[
 D_2\Phi_2\{f,g\}=(-1)^{ab}\bar v^{\,a}\bar u^{-b}
                  =t_v(f,g)^{-1}.
\]

With θ₂ rather than θ₂♮, the formula is D₂θ₂m_F=−εr_v,2, or t_v^(−ε)
in units. The constant sign commutes with naturality and additive transfers.
It must still be displayed when identifying the boundary itself.

**Checks.** At R=ℤ_(5), D₂Φ₂{2,5}=3, D₂Φ₂{5,2}=2, and
D₂Φ₂{5,5}=4 in 𝔽₅ˣ. The first two detect inversion; the last detects a
missing diagonal sign. D₁[5]=1 fixes the degree-one orientation, while
D₃Φ₃{u,v,5}=Φ₂{ū,v̄} tests the positive odd-degree sign. Finite-field
K₂ vanishing cannot distinguish the two classical-to-Quillen normalizations.

**Source.** Weibel, III.7.3, printed p.246 / PDF p.254; V.6.6.1, printed
p.409 / PDF p.417; Exercise V.5.3, printed p.405 / PDF p.413. The
all-degree identity is the generator argument above, derived from these
interfaces rather than quoted as a theorem of the book.

## Total residues and the Dedekind sequence

Let V be a set-indexed family of normalized discrete valuations on F. Assume
**finite character**: each a∈Fˣ has nonzero order at only finitely many
indices. Repeated valuations are allowed only when this hypothesis survives.
T.3/finite-support proves that a finite sum of n-symbols has residue support
inside the union of the order supports of all its entries.

**Construction — total residue homomorphism**
(`T.3:localization-comparison/global-residue-hom`). For n≥1 construct

\[
 \operatorname{Res}^M_{V,n}:K^M_n(F)
       \longrightarrow\bigoplus_{v\in V}K^M_{n-1}(k_v),
 \qquad (\operatorname{Res}^M_{V,n}x)_v=r_{v,n}(x).
\]

Use Mathlib's dependent `DirectSum`; the residue fields need not coincide.
In degree two its summands use the additive type tag on k_vˣ. The
finite-support proof belongs to each input x. A finite sum of homomorphisms
would require almost every entire component homomorphism to be zero, which
is a stronger and inappropriate requirement. Construct each direct-sum
element from its finite support and coordinates; coordinate extensionality
proves additivity, presentation independence and uniqueness.

For the nonzero primes of a Dedekind domain, the pinned
`IsDedekindDomain.HeightOneSpectrum.Support.finite` controls poles. Apply it
to both a and a⁻¹ to control nonzero orders. For function-field places use
`TauCeti.Place.finite_setOf_ord_ne_zero` with its explicit
`IsFunctionField k F` hypothesis. The existing divisor and place notions are
consumed, rather than constructed here.

The API serves the tame-kernel targets of T.5, the finite-support sums of
T.4 reciprocity, and the affine/DVR comparisons used by S.3 and E.3:

| Declaration | Contract |
| --- | --- |
| `MilnorK.globalResidueHom` | The additive homomorphism Res⁽ᴹ⁾ above. |
| `MilnorK.globalResidueHom_apply` | Its v-coordinate equals r_v,n(x). |
| `MilnorK.globalResidueHom_unique` | Equality of all residue coordinates characterizes the homomorphism. |
| `MilnorK.globalResidueHom_support_subset` | Any finite symbol expression bounds support by the union of all entry order supports; the bound need not be sharp. |
| `MilnorK.globalResidueHom_eq_zero_iff` | Res⁽ᴹ⁾(x)=0 iff every residue vanishes; its kernel is the intersection of residue kernels. |
| `MilnorK.globalResidueHom_degree_one` | Coordinates are ord_v(a); compare to the existing principal divisor by coefficients. |
| `MilnorK.globalResidueHom_degree_two` | Coordinates on {f,g} are t_v(f,g), with the additive unit tag made explicit. |
| `MilnorK.globalResidueHom_quillen` | For Dedekind primes, the actual global boundary obeys the signed product comparison below. |
| `MilnorK.globalResidueHom_reindex` | Relabeling the valuation family by an equivalence reindexes the output, including its native residue fields. |

**Tests.** The empty family gives the zero map into the trivial direct sum,
and zero has zero output for every family. For F=ℚ and V the rational
primes, Res⁽ᴹ⁾₂{2,5} has just one nontrivial coordinate: 2 at 5. At 2 the
residue is 1 in the trivial 𝔽₂ˣ. This also shows why support is bounded by
the union of entry supports rather than their intersection. The actual
Quillen boundary has coordinate 3 at 5.

For the same family {2,−1}={2,1−2} has every residue trivial, although 2
has positive order at the prime 2; support containment can be strict.
The symbols {5,2} and {5,5} give coordinates 3 and 4 at 5, respectively.
Adding a symbol and its inverse gives zero in the direct sum. Finally, the
family indexed by ℕ with every valuation equal to the 5-adic valuation
fails finite character: {2,5} would have coordinate 2 at every index. Its
coordinate function is not an element of the direct sum. This is a failure
of the hypothesis, not a new unrestricted residue map.

For a Dedekind domain R with fraction field F, let D⁽ᴿ⁾ₙ be its localization
boundary and let V be its nonzero prime family. Then the map equality is

\[
 D^{(R)}_n\Phi_n
   =(-1)^{n-1}\Bigl(\bigoplus_{v\in V}\Phi_{n-1}\Bigr)
             \operatorname{Res}^M_{V,n}.
\]

Projecting to a prime localizes the torsion category at that prime and
identifies the component with the boundary for R_v. Apply the local theorem,
then `DirectSum.ext`. `DirectSum.map` constructs the family of component
Φ maps. A global Quillen boundary on arbitrary Kₙ(F) is asserted here only
for the Dedekind localization sequence, not for an arbitrary family V.

The existing target `T.3/dedekind-localization-boundary` supplies the exact
segment

\[
 \bigoplus_vK_2(k_v)\longrightarrow K_2(R)\longrightarrow K_2(F)
  \xrightarrow{D^{(R)}_2}\bigoplus_vk_v^\times
  \xrightarrow{j}K_1(R)\longrightarrow K_1(F).
\]

Its kernel at K₂(F) is the image of K₂(R). Its residue cokernel is
ker(K₁(R)→K₁(F)), identified with SK₁(R) by the low-degree determinant
interface. The proof uses the torsion Serre quotient, dévissage into the
residue categories and resolution for the regular rings R,F,k_v. It does
not assume that K₂(R)→K₂(F) is injective or that the boundary is onto.

To display Res⁽ᴹ⁾₂ in this exact row, transport K₂(F) through Φ₂ and
multiply the residue term by −1. The outgoing map becomes −j. Replacing
only D₂ by −D₂ preserves exactness but fails to give the specified
commutative comparison of rows. When all residue fields are finite,
K₂(k_v)=0 gives injection at the left. For a semilocal Dedekind domain the
stronger short exact degree-two sequence is the separate statement of
Weibel V.6.6.2. Neither special case is generalized to all Dedekind domains.
For example, the real circle ring ℝ[x,y]/(x²+y²−1) has nonzero SK₁,
detected in III.1.5.4 by its rotation matrix. Its total residue boundary
therefore has nonzero cokernel even though each local tame symbol is onto.

**Source.** Weibel III.6.5, printed pp.236–237 / PDF pp.244–245;
III.7.4, printed pp.247–248 / PDF pp.255–256; V.6.6–6.6.2, printed
pp.409–410 / PDF pp.417–418. The non-surjectivity example is III.1.5.4,
printed p.185 / PDF p.193. The constructor and its API assemble the
earlier-owned finite-support theorem with the existing direct sum.

## Specialization and its correction term

The K-book uses the specialization q_π,n(z)=Dₙ₊₁([π]·z), with π on the
left. Here q is notation for that composite, not an additional construction
of K-theory. It is different from the image of λ_π on ramified symbols.

**Target — Milnor–Quillen specialization comparison**
(`T.3:localization-comparison/specialization-product-comparison`). For n≥1,

\[
 \lambda_{\pi,n}(x)=r_{v,n+1}(x\{-\pi\}),\qquad
 \Phi_n\lambda_{\pi,n}(x)
     =(-1)^nD_{n+1}(\Phi_n(x)[-\pi]).
\]

For the parameter-first Quillen specialization the formula instead is

\[
 q_{\pi,n}(\Phi_nx)
   =\Phi_n\bigl(\lambda_{\pi,n}(x)+r_{v,n}(x)\{-1\}\bigr)
   =\Phi_n\lambda_{-\pi,n}(x).
\]

In Serre's algebra d_π{−π}={−1}+Π. Multiplying
(λ_π(x)+r_v(x)Π)({−1}+Π), the terms contributed by Π{−1} and Π²
cancel, leaving coefficient λ_π(x). This proves the first equality.
Apply the residue comparison in degree n+1 for the second. For q_π,
commuting [π] past a degree-n class supplies (−1)ⁿ, cancelling the
boundary-comparison sign. The coefficient of Π in d_π(x)Π is
λ_π(x)+r_v(x){−1}. Finally {−1} is killed by 2, so the parameter-change
formula at −π identifies this with λ_(−π)(x).

For π′=uπ both compared specialization composites change by
−Φₙ(r_v,n(x){ū}). The residue and localization boundary remain independent
of π. On an all-unit symbol the correction vanishes, and both
specializations give the product of the reduced units in the original order.

**Checks.** At ℤ_(5), λ₅,1{5}=0 but q₅,1([5])=[−1], namely 4 in 𝔽₅ˣ.
The corrected expression −D₂([5][−5]) is zero. Changing to 10 gives
λ₁₀,1{5}={3}, whereas q₁₀,1([5])={2}; the difference from the value
at 5 is −{2} in both formulas. A unit such as 2 specializes to its residue
2 in both constructions. For k=ℚ(s), F=k((t)) and x={s,t}, λ_t,2(x)=0
but q_t,2Φ₂(x)=Φ₂{s,−1}. The latter is nonzero, detected by the
s-adic boundary −1. This detects the correction beyond degree one.

**Source.** Weibel III.7.3 and its proof, printed p.246 / PDF p.254;
the specialization paragraph after V.6.6.4, printed p.410 / PDF p.418.
The distinction between these composites is a comparison of the source's
constructions, not an additional erratum.

## Transfers and the two residue squares

The two transfer targets already present here retain their identifiers:
`T.3/quillen-transfer-norm-residue` and
`T.3/milnor-quillen-transfer-comparison`. Their input is the independently
constructed Quillen transfer of K.3 and the Milnor norm of T.4. The latter is
defined using Bass–Tate lifts and the negative infinity residue, then proved
transitive; it is not defined by transport from Quillen K-theory.

Let R⊂S be Dedekind domains with S finite as an R-module, and E/F their
fraction fields. Restriction of scalars gives a morphism of localization
sequences. For a prime v of R and its primes w in S, every connective degree
n≥1 satisfies

\[
 D_{v,n}N^Q_{E/F}=
       \sum_{w\mid v}N^Q_{k_w/k_v}D_{w,n}.
\]

On the torsion term, a simple S-module k_w becomes the k_v-vector space
k_w under restriction of scalars. This is the residue-field transfer;
there is no further ramification multiplier. Its K₀ value is f_w=[k_w:k_v]
and its K₁ value is the determinant field norm, including inseparable residue
extensions. The latter is the existing `Algebra.norm`, not a product over
distinct embeddings. The sum is finite over each v, and maps of residue
direct sums are assembled using their existing universal property.

Under Φ₂ the two field transfers agree for **every finite extension**:

\[
 N^Q_{E/F}\Phi_{2,E}=\Phi_{2,F}N^M_{E/F}.
\]

The inherited proof uses arbitrary field base change and prime-to-p
detection, not the desired norm/residue square. For each prime p pass to a
p-closed extension F⁽ᵖ⁾ assembled from finite extensions of degree prime to p.
Both transfers have the same base-change decomposition on
E⊗_F F⁽ᵖ⁾=∏Bᵢ, with each factor weighted by its **local module length**
ℓᵢ and transferred through its residue field Lᵢ. Each Lᵢ/F⁽ᵖ⁾ has a
tower of normal degree-p steps. The imported degree-p generation theorem
expresses K⁽ᴹ⁾₂ in symbols {y,res(x)} with x in the base. Both transfers
send them to {N₁(y),x} by the projection formula. Transitivity proves
equality after this base change. For their difference on one input, finite
descent and restriction–transfer give an annihilator prime to p. Taking
all p kills the difference. These ingredients are the existing T.4
prime-to-p-closure, p-closed-generation, transfer-base-change,
milnor-projection-formula, milnor-transfer-transitivity and
restriction-transfer-degree nodes, and K.3/finite-field-transfer-base-change.
No assertion of agreement in all Milnor degrees is inferred from this
degree-two proof.

Consequently, where S is the finite normalization of the valuation ring,
the degree-two square is the previously constructed Milnor identity

\[
 t_v(N^M_{E/F}x)=
       \prod_{w\mid v}N_{k_w/k_v}(t_w(x)).
\]

Inverting all residues gives the Quillen square, so the two normalizations
are consistent. The Milnor formula itself, in every degree, remains owned
by `T.3/transfer-and-norm-residue`, parented in T.4. General finite
extensions of incomplete valued fields retain the explicit finite-normalization
hypothesis; no unconditional degree formula is substituted for it.

By the projection formula, transfer after restriction on Kₙ(F) multiplies
by [E:F]: the transfer of 1 is the dimension class [E] in K₀(F). In the
opposite variance, normalized residue under restriction has the ramification
factor r_w res=e_w res r_v. These distinguish three separate factors:
e in pullback residues, f in the degree-one norm-valuation formula, and
[E:F] in transfer after restriction.

**Checks.** For ℚ(i)/ℚ at 2, N(1+i)=2, ord₂N(1+i)=1 and
ord_(1+i)(1+i)=1. The residue degree is 1 while e=2; an extra e in the
pushforward formula fails. Conversely, pullback of 2 has order 2. For
E=ℚ(i)((t)) over ℚ((t)), e=1, f=2 and N(t)=t², detecting f rather
than e in the valuation of a norm. On a restricted symbol transfer
multiplies by the field degree, in agreement with the sum of e_wf_w when
the finite-normalization hypothesis applies.

For the inseparable test F=𝔽_p(s), E=𝔽_p(s¹ᐟᵖ), base change to E
gives E⊗_F E≅E[ε]/(εᵖ). There is one residue field E but its local
length is p: the base-change composite res·N is p·id, rather than id.
Use G-theory dévissage of this Artin algebra, not a false K(B)=G(B)
comparison. The proof must also cover degree-three extensions over a
3-closed field; checking quadratic generators alone is insufficient.

**Source.** Weibel V.6.6.3–6.6.4, printed p.410 / PDF p.418;
V.3.3.2, printed pp.386–387 / PDF pp.394–395; III.1.7.1 and its following
paragraph, printed p.187 / PDF p.195. The quadratic illustration is
III.6.1.5, printed p.232 / PDF p.240. The general two-transfer comparison
is imported with its existing prime-to-p proof and owner prerequisites;
the quadratic corollary alone is not cited as its proof.

## Library boundary and supplier contracts

At Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and Tau Ceti
f790474821cf4256814db967cb154e7af3d0c369, the reviewed library audit finds
no Milnor groups, Quillen localization sequence or K₂ residue comparison.
The reusable infrastructure already exists: dependent direct sums and their
coordinate maps; determinant norms and `Algebra.norm_algebraMap`; finite
order-support inputs for Dedekind primes and function-field places; and
`TauCeti.SplitK0.finrankEquiv`, taking a vector-space class to its dimension.
The connective K₀ model comparison remains with its owning K-theory roadmap.

The current AlgebraicCurves roadmap and library also supply normalized
places, native residue fields, finite-support divisors and their affine-model
interfaces. LocalFieldsRamification supplies finite-residue local fields,
normalized valuations, e,f and their norm identities. Neither is reconstructed
here. The current roadmap main, including the nine directions newer than the
atlas snapshot, supplies no replacement for the K-theoretic comparisons above.

The required K.3 torsion quotient contract is precise: finitely generated
torsion R-modules form a Serre subcategory of finitely generated R-modules;
localization identifies the quotient with finite-dimensional F-vector spaces;
the identifications are natural for R→R_v and finite restriction of scalars;
and dévissage identifies the torsion term with the finite-support sum of the
residue-field K-theories. The existing abstract localization theorem does
not by itself establish this ring quotient equivalence.

The remaining product-model contract is T.2's request to K.7: its degree-(1,1)
biexact product must agree with the plus-construction product under the
chosen S¹∧S¹≅S² convention. T.2 owns the unit-symbol comparison and ε;
this part requests no second version. Its finite-field classical-presentation
and stable-witness inputs remain needed for the all-field degree-two
equivalence.

The general Milnor norm/residue chain retains the earlier arbitrary-residue
complete-DVR support requirement: finite-extension valuations, finite free
normalization lattices, norm valuation/residue identities and base-change
component lengths. Its proposed Local Fields and Ramification, Part II
ownership is distinct from the finite-residue upstream local-field roadmap.
These inputs are needed by the earlier norm/residue proof, not by the
Quillen finite-Dedekind transfer square or the equality-of-transfers proof
using arbitrary field base change. AlgebraicCurves keeps its existing
function-field normalization and completion comparisons.

The suggested Lean file states only calibration results over existing
direct sums, residue-field units and determinant norms. The new K-theoretic
targets, the nine total-residue API entries and its five tests remain
mathematical targets here until their Milnor and Quillen carriers exist.
No axiomatized replacement for those missing carriers is introduced.

The three new planets are **Milnor–Quillen residue comparison**, **Total
residue homomorphism**, and **Milnor–Quillen specialization comparison**.
The inherited **Localisation theorem for K₂** remains the exact-sequence
planet; no earlier residue or transfer construction is duplicated.

## Reference

Charles A. Weibel, *The K-book: An Introduction to Algebraic K-theory*,
[author-hosted combined draft, 29 August 2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf).
All page locators above refer to this draft. SHA-256:
`a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`.
The statements and derivations above are in the roadmap's own words.
