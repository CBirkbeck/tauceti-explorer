# Finite fields and character sums: FF.2 completion pass

This document specifies the new declarations of the FF.2 part packet. The parent blueprint remains the owner of its existing characters, Artin–Schreier sheaf, Fourier–Deligne transform, curve bounds, individual smooth-leading polynomial bound and uniform Lang–Weil theorem. The present pass imports those declarations and supplies the additional targets and proof contracts required by the routed papers. It does not replace the parent packet or the atlas data. The implementation status of every new node is unchecked.

The stage is **planned**, with ten explicit gaps. The packet is **complete** as a target-level planning pass; FF.2 is not closed. Its prerequisite chains terminate in checked baseline statements, existing blueprint nodes, requested supplier stages or the recorded gaps. The gaps concern actual missing mathematics and carriers, rather than estimates silently accepted as hypotheses. This distinction matters especially for the universal family, the Euler-characteristic formula, quantitative boundedness and the singular-variety Albanese.

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The reviewed library audit treats FF.2 as unbuilt. Mathlib supplies additive and multiplicative character carriers and some Gauss identities; its norm-product theorem has a field hypothesis. None of these declarations constructs an étale sheaf, supplies geometric Swan conductors or proves lissity over a polynomial parameter scheme. The new finite-ring theorem therefore extends an actual near miss, while the geometric nodes import their carrier foundations.

## Conventions and inherited targets

A finite field has cardinality q and characteristic p. The coefficient prime ℓ differs from p. Geometric sheaves use an algebraic ℓ-adic coefficient field E containing the values of the chosen additive and multiplicative characters. Numerical absolute values use embeddings into the complex numbers. A purity assertion used to obtain an algebraic square-root bound is applied at every complex embedding; a theorem stated for one embedding is not silently promoted to this assertion. Geometric Frobenius is used for cohomological traces and weights, with the usual Tate twist of weight −2. Arithmetic Frobenius is used for the cover's constant-field quotient. The two conventions are reconciled by inversion when passing between representations and trace formulas.

Multiplicative characters use Mathlib's extension by zero on **all nonunits**. The trivial multiplicative character consequently still vanishes on nonunits. An additive character is multiplicative in the sum of its arguments. Primitivity of an additive character of a finite ring means that every nonzero scalar shift is nontrivial. This is different from the multiplicative primitivity defined below. All stated polynomial bounds require the actual nontrivial-character guards of the parent.

The parent multiplicative bound has the precise exceptional form c·gᵉ over the algebraic closure, where e is the order of the character. A perfect power with another exponent is not an exception: for a cubic character, f=X² gives a nontrivial squared character and its sum is zero. Conversely c·gᵉ can be exceptional even when c is not an e-th power over the ground field. The inherited mixed bound uses its combined multiplicative/additive condition; applying either unmixed guard alone is insufficient. These controls retain the correction of RT-AREA-finitefields/5 without creating a duplicate theorem here.

For a general nontrivial additive character ψ=ψ_can(b·), b≠0, the canonical Artin–Schreier argument is applied to bQ. Scaling all coefficients by b preserves the smooth-leading open and its connectedness. This normalization reconciles the p-cyclic cover used by Weil I with the parent’s general finite-field character.

The parent Artin–Schreier construction is the single owner of Lψ, its finite-character torsor pushout, additivity, pullback and trace function. The parent global Fourier–Deligne transform uses Rpr₂!(pr₁*K⊗Lψ(xy))[1], whose function trace is the **negative unnormalized** Fourier sum. Its square is pullback by x↦−x with twist (−1). Normalized analytic Fourier sums and normalized hyper-Kloosterman traces are separate functions; no unnoticed half Tate twist is inserted in E-adic coefficients.

Every new declaration below has an identifier beginning `FiniteFieldsAndCharacterSums:FF.2/`. Its proposed namespace is `TauCeti.FiniteFieldSums.FF2`. References without this prefix are imports, not declarations to be built again in this part. The suggested file gives executable signatures only where the pinned libraries contain the real carriers. It records the missing geometric signatures by name and mathematical contract rather than inventing uninterpreted proposition fields.

## Finite-ring Fourier analysis and nonreduced moduli

The elementary branch closes the specific squarefree-modulus proof mismatch. A polynomial quotient with repeated factors is a finite Frobenius algebra for its top-coefficient functional, but its multiplicative character need not be primitive. The definition below provides exactly the annihilator argument needed for Fourier coefficients at nonunits. It is stronger than mere nontriviality over a general ring, while agreeing with nontriviality over a field. The functional equation then uses the full degree of the modulus, rather than the degree of its radical. The even-character case requires another factor and is excluded explicitly.

### Primitive multiplicative characters of finite rings

**Declaration:** `FiniteFieldsAndCharacterSums:FF.2/primitive-multiplicative-ring-character` (definition).

For a finite nontrivial commutative ring R and χ : MulChar(R,ℂ), χ is primitive if for every nonzero ideal I of R there is u∈R× with u−1∈I and χ(u)≠1. The top ideal is included. Equivalently χ on units does not factor through the unit group of any proper quotient R/I with I nonzero and proper, and χ is nontrivial. Values on nonunits are the existing MulChar values, hence zero.

**Hypotheses and conventions.** R finite, commutative and nontrivial. Characters use the baseline zero-on-nonunits convention.

**Construction or proof.**

1. Use the predicate on the existing MulChar carrier, not a second character type.
2. For a finite ring, reduction on units is surjective without a reducedness assumption. Lift a quotient unit to b with bc≡1 modulo I. By eventual periodicity of powers of a=bc, choose N≥1 with e=a^N idempotent. Since e≡1 modulo I, u=be+(1−e) lifts b; its inverse is ce·a^(N−1)e+(1−e), because a^Ne=e. This proves the required surjection directly.
3. Kernel containment is equivalent to factorization through this surjection. The I=R clause supplies nontriviality, which quotient-only phrasing misses for fields.

**Direct dependencies:** `mathlib:MulChar`, `mathlib:MulChar.ofUnitHom`.

**Uses.** primitive-finite-ring-gauss-norm: An annihilator ideal produces a unit which fixes a nonunit scalar but changes its character. primitive-modulus-functional-equation: Supplies the missing nonunit Fourier coefficients without a squarefree hypothesis.

**API.**

- `TauCeti.FiniteFieldSums.FF2.IsPrimitiveMulChar.field_iff` (characterisation): For a finite field, primitivity is equivalent to χ≠1.
- `TauCeti.FiniteFieldSums.FF2.IsPrimitiveMulChar.quotient_iff` (characterisation): For finite R, the stated kernel condition is equivalent to nontriviality plus absence of factorization through proper quotient unit groups.
- `TauCeti.FiniteFieldSums.FF2.IsPrimitiveMulChar.ringEquiv` (compatibility): Transport by a ring isomorphism preserves primitivity and commutes with the baseline extension of unit characters.
- `TauCeti.FiniteFieldSums.FF2.IsPrimitiveMulChar.prod_iff` (characterisation): A character of a nonempty finite product of nontrivial finite rings is primitive exactly when each factor character is primitive.

**Unit tests.**

- `TauCeti.FiniteFieldSums.FF2.primitive_field_three` (characterisation): The nontrivial character of F₃× is primitive.
- `TauCeti.FiniteFieldSums.FF2.primitive_zmod_four` (computation): On ℤ/4ℤ, χ(1)=1, χ(3)=−1, χ(0)=χ(2)=0 is primitive.
- `TauCeti.FiniteFieldSums.FF2.primitive_product_control` (non-example): On F₃×F₃, a character nontrivial only on the first factor is not primitive: I=0×F₃ detects the failure.
- `TauCeti.FiniteFieldSums.FF2.primitive_trivial_field` (degenerate): The trivial MulChar on a field fails the top-ideal clause.

**Acceptance.** Nontrivial characters over a field are primitive; the trivial character is not. Over a product of fields this agrees with the parent’s nontrivial-on-every-factor condition.

**Source passages.** kowalski-expsums-elementary, Chapter 4, Proposition 4.8 and primitive Dirichlet characters, pp. 41–43. General finite-ring kernel characterization of the source’s primitive Dirichlet character; the reduction-surjectivity proof is specified here.

### Primitive Gauss sums over finite commutative rings

**Declaration:** `FiniteFieldsAndCharacterSums:FF.2/primitive-finite-ring-gauss-norm` (theorem).

Let R be a finite nontrivial commutative ring, χ primitive in the preceding sense and ψ a primitive additive character R→ℂ. For every a∈R, τ(χ,ψ(a·))=χ⁻¹(a)τ(χ,ψ), including nonunits where both sides are zero. Moreover |τ(χ,ψ)|²=|R| and τ(χ,ψ)τ(χ⁻¹,ψ⁻¹)=|R|.

**Hypotheses and conventions.** χ multiplicatively primitive; ψ primitive as AddChar.IsPrimitive. Neither reducedness nor a field hypothesis is imposed.

**Construction or proof.**

1. For units use the baseline gaussSum_mulShift_eq. If a is a nonunit, multiplication by a on finite R is not injective (injectivity would imply surjectivity and an inverse), so Ann(a)≠0.
2. Choose u with u−1∈Ann(a) and χ(u)≠1. Substitution x↦ux leaves ψ(ax) unchanged and multiplies the sum by χ(u); hence the sum is zero.
3. Expand Σ_a|τ(χ,ψ(a·))|². Orthogonality AddChar.sum_mulShift leaves only x=y and gives |R|Σ_x|χ(x)|²=|R||R×|. Finite character values on units have modulus one.
4. The first formula identifies the left side with |R×||τ|²; cancel the positive unit-group cardinality. The product identity follows from star_gaussSum_eq.

**Direct dependencies:** `FiniteFieldsAndCharacterSums:FF.2/primitive-multiplicative-ring-character`, `mathlib:gaussSum`, `mathlib:gaussSum_mulShift_eq`, `mathlib:AddChar.sum_mulShift`, `mathlib:star_gaussSum_eq`.

**Acceptance.** Over ℤ/4ℤ with ψ(1)=i and χ(3)=−1, τ=2i and |τ|²=4. A nonprimitive character can have a nonzero nonunit Fourier coefficient, so the primitive guard is essential.

**Source passages.** kowalski-expsums-elementary, Chapter 4, (4.12), (4.16), pp. 44–47. Extends the stated primitive-modulus claim beyond the squarefree proof using annihilator ideals and Parseval; the source alone is not credited with this proof.

### The coefficient pairing on a polynomial quotient

**Declaration:** `FiniteFieldsAndCharacterSums:FF.2/polynomial-quotient-frobenius-pairing` (comparison).

For a finite field F, monic g∈F[X] of degree d≥1, let R=AdjoinRoot(g) and ℓ(r) be coefficient d−1 of its unique representative of degree<d. The F-bilinear pairing B(r,h)=ℓ(rh) is nondegenerate, including when g has repeated factors. For 0≤j≤d, the annihilator of the subspace degree<j is the subspace degree<d−j. For nontrivial ψ:F→ℂ, ψ∘ℓ is a primitive additive character of R.

**Hypotheses and conventions.** g monic and d≥1; no squarefree hypothesis.

**Construction or proof.**

1. For a nonzero representative r of degree k, multiply by X^(d−1−k): no reduction occurs and ℓ is its nonzero leading coefficient. Scaling by F proves nondegeneracy.
2. Products of degrees<j and <d−j have degree<d−1, so the second subspace lies in the annihilator. The perfect pairing gives dimension d−j and hence equality.
3. If a≠0, B(a,·) surjects onto F; composition with a nontrivial ψ cannot be trivial. This is the baseline AddChar.IsPrimitive condition.

**Direct dependencies:** `mathlib:AdjoinRoot`, `mathlib:AddChar.IsPrimitive`, `mathlib:AdjoinRoot.modByMonicHom`, `mathlib:AdjoinRoot.powerBasisAux'`.

**Acceptance.** g=X², r=X: pair with h=1 to obtain ℓ(rh)=1 despite nilpotents. For g=X²+1, B(X,X)=0, disproving a reversed-coordinate formula; nondegeneracy still holds.

**Source passages.** kowalski-expsums-elementary, Proof of Proposition 4.11, pp. 46–47, corrected coefficient argument. The parent E720 corrects coefficient reversal. This comparison states the correct pairing in the nonreduced case and supplies its dimension argument.

### Functional equation for primitive nonreduced moduli

**Declaration:** `FiniteFieldsAndCharacterSums:FF.2/primitive-modulus-functional-equation` (theorem).

Let F have q elements, g monic of degree d≥1, χ a primitive multiplicative character of R=F[X]/(g), with χ restricted to F× nontrivial. Extend χ to polynomials by reduction and by zero on nonunits. Put c_j=Σ_{h monic,deg h=j}χ(h), L(χ,T)=Σ_{j≥0}c_jT^j, and ψ₁=ψ∘ℓ for nontrivial ψ of F. Then c_j=0 for j≥d, c_j=q^(j−d)τ(χ,ψ₁)τ(χ⁻¹|F×,ψ⁻¹)c_{d−1−j}(χ⁻¹) for 0≤j<d, and L(χ,T)=W T^(d−1)L(χ⁻¹,(qT)⁻¹), W=τ(χ,ψ₁)τ(χ⁻¹|F×,ψ⁻¹)/q, |W|=q^((d−1)/2). This is an identity of Laurent polynomials and yields exact degree d−1.

**Hypotheses and conventions.** Primitivity on the full possibly nonreduced R. χ|F×≠1; the even-character factor 1−T is outside this statement.

**Construction or proof.**

1. Detect the monic degree-j affine subspace using the coefficient pairing and its annihilator, obtaining the parent’s formula with all h of degree≤d−1−j, including h=0.
2. Apply primitive-finite-ring-gauss-norm: nonunits contribute zero without CRT; units contribute χ⁻¹(h)τ.
3. Group h by their top coefficient. Lower-degree terms cancel under scalar F× because χ|F× is nontrivial. Top coefficients give the finite-field Gauss sum and the displayed coefficient identity.
4. For j≥d, equidistribution of representatives modulo g and the nontriviality of χ give c_j=0. Norms of the two Gauss sums give |W|; c_0=1 gives exact degree.

**Direct dependencies:** `FiniteFieldsAndCharacterSums:FF.2/primitive-finite-ring-gauss-norm`, `FiniteFieldsAndCharacterSums:FF.2/polynomial-quotient-frobenius-pairing`, `FiniteFieldsAndCharacterSums:FF.2/monic-polynomials-of-degree`, `mathlib:gaussSum_mul_gaussSum_eq_card`.

**Acceptance.** For d=1, L=1 and W=1. For g=X² over F₃, a primitive character nontrivial on constants has degree-one L; repeated factors do not reduce the modulus degree to its radical degree.

**Source passages.** kowalski-expsums-elementary, Proposition 4.11, pp. 46–47. The general primitive-modulus statement, supplied with the corrected pairing and the new nonunit argument, rather than repeating the parent’s squarefree theorem.

## The universal smooth-leading family

The relative theorem must distinguish an actual coefficient scheme from an unspecified collection of admissible polynomials. Its smooth-leading open is connected, so it provides a route from a calculable Fermat fiber to every fiber. Weil I uses a special compactification of normalized Artin–Schreier covers, whereas Weil II gives a second route through local acyclicity of an extension by zero. These are separate proof mechanisms with separate supplier requirements. Lissity and purity do not follow merely from constant dimensions of individual stalks.

The parent already states Deligne's several-variable numerical bound and its individual-fiber concentration theorem. This part supplies the family, local charts, historical compactification, local-acyclicity route, relative lissity, relative ranks and clean-duality comparison. Thus it accounts for Weil I 8.5 and Weil II 3.7 without re-planning the parent's 8.4 numerical endpoint.

### Artin–Schreier breaks over geometric local fields

**Declaration:** `FiniteFieldsAndCharacterSums:FF.2/geometric-artin-schreier-break` (lemma).

Let k be perfect of characteristic p and K=k((t)). If u∈K has valuation −m<0 with p∤m, the extension L/K defined by y^p−y=u is cyclic of degree p, totally ramified, and has lower and upper break m. Over algebraically closed k a nontrivial character of its group has Swan conductor m and no inertia invariants. Applied after Artin–Schreier reduction and after scaling the phase for a general additive character, this supplies the local computation in the parent Swan node.

**Hypotheses and conventions.** m>0, p∤m; geometric conductors are computed after extending residues to the algebraic closure. A general ψ=ψ_can(b·) uses u=bf, not f.

**Construction or proof.**

1. A root in K would give a pole divisible by p, so the Artin–Schreier class is nontrivial and the polynomial is irreducible. The valuation of y in L is −m with v_L(t)=p; hence e=p.
2. Choose 1≤a<p and b∈ℤ with bp−am=1. π=t^b y^a has valuation 1. For σ_c(y)=y+c, c≠0, σ_c(π)/π=(1+c/y)^a, whose difference from 1 has valuation m. Thus v_L(σ_cπ−π)=m+1.
3. The lower ramification groups are the cyclic group for 0≤i≤m and trivial beyond m; for one cyclic p-break the Herbrand transformation leaves that break m.
4. The requested geometric conductor definition gives Sw=m for each nontrivial character; inertia invariants vanish. This proves the equal-characteristic calculation directly, without importing finite-residue-field upper ramification as a theorem about k̄((t)).

**Direct dependencies:** `FiniteFieldsAndCharacterSums:FF.2/modified-pole-order`, `FiniteFieldsAndCharacterSums:FF.2/artin-schreier-sheaf`, `ArithmeticGaloisRepresentations:R01.3`, `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-8-constant-field-extensions-galois-ramification-and-inseparability-`.

**Acceptance.** u=t^(−m) gives Sw=m. u=t^(−p) is reduced to t^(−1); its Swan conductor is 1, so the raw-pole statement without p∤m fails.

**Source passages.** SERRE-RESIDUE, §4.4, Lemma 4′, pp. 144–145. The equal-characteristic case of the local calculation; the uniformizer proof explains the perfect-residue-field extension. DELIGNE-SGA45-SOMMES-TRIG, Exemple 3.5, (3.5.4), volume p. 191. This is the geometric Swan input used by the parent rational-function bound; the definition still requires the AGR extension.

### The universal polynomial with smooth leading form

**Declaration:** `FiniteFieldsAndCharacterSums:FF.2/universal-smooth-leading-polynomial-family` (construction).

Fix n≥1, d≥1, p∤d, and k=F_q. In affine coefficient space with coordinates c_α for |α|≤d, let S be the open locus where the degree-d part Q_d defines a smooth hypersurface in P^(n−1) and is nonzero; for n=1 its zero locus is empty. On S×A^n put Q_univ=Σ c_αX^α, f the projection, and L=L_ψ(Q_univ), using the parent Artin–Schreier construction. S is geometrically connected and contains the Fermat polynomial ΣX_i^d. This is the actual open coefficient scheme, not a set of polynomials declared smooth by an uninterpreted predicate.

**Hypotheses and conventions.** n,d positive; p∤d; ψ nontrivial. Coefficients E contain the p-th roots of unity, ℓ≠p.

**Construction or proof.**

1. Form the finite-dimensional coefficient affine space from the degree-bounded MvPolynomial coordinates. The projective Jacobian singularity incidence is closed after projection by properness, so its complement is open.
2. The Fermat point is smooth because p∤d, giving nonemptiness. A nonempty open in geometrically integral affine space is geometrically integral.
3. Evaluate the universal polynomial and pull back the parent L_ψ along this morphism; base change to a coefficient point recovers its polynomial sheaf.

**Direct dependencies:** `mathlib:MvPolynomial`, `mathlib:MvPolynomial.eval`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.2`, `FiniteFieldsAndCharacterSums:FF.2/artin-schreier-sheaf`.

**Uses.** polynomial-family-lissity and polynomial-family-cohomology: The connected smooth-leading parameter scheme transfers ranks and weights from the Fermat fiber. PAPER-DELIGNE-80/s3-3.7.2-universal-family: Supplies the actual universal object of the routed passage.

**API.**

- `TauCeti.FiniteFieldSums.FF2.UniversalPolynomialFamily.coefficient` (projection): The α-th coordinate is the coefficient of X^α, for |α|≤d.
- `TauCeti.FiniteFieldSums.FF2.UniversalPolynomialFamily.fiber` (compatibility): At a coefficient point Q, Q_univ specializes to Q and L specializes to L_ψ(Q).
- `TauCeti.FiniteFieldSums.FF2.UniversalPolynomialFamily.baseChange` (functoriality): Extension of the finite field commutes with S, Q_univ, f and L.
- `TauCeti.FiniteFieldSums.FF2.UniversalPolynomialFamily.fermat` (constructor): The coefficient vector of ΣX_i^d defines a point of S when p∤d.
- `TauCeti.FiniteFieldSums.FF2.UniversalPolynomialFamily.connected` (structure): S over k̄ is nonempty and geometrically integral, hence connected.

**Unit tests.**

- `TauCeti.FiniteFieldSums.FF2.universal_one_variable` (characterisation): For n=1,d≥1, membership in S is equivalent to c_d≠0.
- `TauCeti.FiniteFieldSums.FF2.universal_fermat` (computation): The fiber at Fermat is ΣX_i^d and its partial derivatives are dX_i^(d−1).
- `TauCeti.FiniteFieldSums.FF2.universal_bad_characteristic` (non-example): For d=p, the Fermat derivative test vanishes and the stated smooth family theorem does not apply.
- `TauCeti.FiniteFieldSums.FF2.universal_evaluation` (compatibility): Coefficient evaluation agrees with Mathlib MvPolynomial.eval at every affine point.

**Acceptance.** The n=1 locus is exactly nonzero leading coefficient. For d=1 the Fermat fiber is a nonconstant linear polynomial, with zero compact cohomology.

**Source passages.** DELIGNE-WEIL-II, §3.7.2, p. 215. The coefficient scheme and smooth-leading open; the notation is fixed here to avoid prime/unprime ambiguity. DELIGNE-WEIL-I, §8.10, p. 305. The original family argument used in the proof of 8.5.

### Artin–Schreier local models at infinity

**Declaration:** `FiniteFieldsAndCharacterSums:FF.2/polynomial-boundary-local-models` (lemma).

For Q in the universal smooth-leading family, normalize P^n in the Artin–Schreier cover T^p−T=jQ, j∈F_p×. Off Q_d=0 at infinity, the pair is étale locally the normalization of T^p−T=t₁^(−d), times a smooth factor. At a point of Q_d=0 at infinity it is étale locally the normalization of T^p−T=t₂t₁^(−d), times a smooth factor. These descriptions hold relatively over S; the second locus is empty for n=1.

**Hypotheses and conventions.** Geometric points; n≥1, d≥1, p∤d; leading hypersurface smooth. The harmless nonzero scalar j is absorbed in an étale coordinate.

**Construction or proof.**

1. Homogenize Q and let t₁ cut out infinity. Where Q_d is nonzero, the unit in Q=t₁^(−d)u has an étale d-th root since d is invertible.
2. At a zero of Q_d, smoothness makes its dehomogenization a transverse coordinate t₂ after including the lower-degree t₁ terms. Then Q=t₂t₁^(−d).
3. Normalization commutes with these étale localizations; the remaining coordinates are smooth product factors. The same Jacobian argument works in the coefficient family.

**Direct dependencies:** `FiniteFieldsAndCharacterSums:FF.2/universal-smooth-leading-polynomial-family`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.2`.

**Acceptance.** n=1 requires only the first local model. If Q_d is singular, t₂ need not be a coordinate and the second model is unjustified.

**Source passages.** DELIGNE-WEIL-I, §§8.7–8.8, pp. 304–305. The two local models, with variables rendered as subscripts; normalization and étale products are supplier inputs. DELIGNE-WEIL-II, §3.7.3, p. 216. The local constant-product argument for j!L in the alternative lissity proof.

### Relative compactification of polynomial Artin–Schreier covers

**Declaration:** `FiniteFieldsAndCharacterSums:FF.2/relative-artin-schreier-compactification` (theorem).

For the universal family and a fixed j∈F_p×, its Artin–Schreier cover admits an equivariant relative smooth projective compactification over S whose reduced boundary is a relative divisor with normal crossings. The compactification restricts to the given affine cover. This is the special surface-product compactification of Weil I 8.5(iii), not resolution of arbitrary varieties in positive characteristic.

**Hypotheses and conventions.** Same family hypotheses; finite Artin–Schreier deck group acts. Conditional on the precise surface-resolution and relative gluing request below.

**Construction or proof.**

1. Normalize S×P^n in the finite cover. The previous local models reduce all singularities to a fixed normalized surface germ times a smooth factor.
2. Use the requested equivariant surface procedure: normalize and blow up the reduced singular locus repeatedly, then blow up boundary points until the boundary has normal crossings. Termination and compatibility with étale maps and smooth products are needed, not assumed.
3. Glue the local resolutions using that compatibility to obtain a global relative smooth compactification and extend the deck action. Relative smoothness of all boundary strata is required for the cohomological base-change argument.

**Direct dependencies:** `FiniteFieldsAndCharacterSums:FF.2/polynomial-boundary-local-models`, `SchemeAndStackFoundations:SF.4`, `SchemeAndStackFoundations:SF.2`.

**Acceptance.** No characteristic-p resolution theorem in dimensions n is imported under a surface-resolution name. The construction must be equivariant and relative, not merely a collection of individually resolved fibers.

**Source passages.** DELIGNE-WEIL-I, §§8.5(iii), 8.6, 8.9–8.10, pp. 303–305. The exact historical compactification route; the theorem remains conditional on the surface supplier contract.

### Local acyclicity of the universal polynomial sheaf

**Declaration:** `FiniteFieldsAndCharacterSums:FF.2/polynomial-family-local-acyclicity` (lemma).

Let j:S×A^n→S×P^n and π:S×P^n→S. The sheaf j!L_ψ(Q_univ) is locally acyclic relative to π. On the affine chart this follows from lissity; at infinity its étale local descriptions are constant products relative to S. Thus the universal family admits the locally acyclic compactification of Weil II 3.7.3 without first resolving its cover.

**Hypotheses and conventions.** Universal smooth-leading family; geometric local acyclicity with the actual étale-site definition. The coefficient E contains the chosen additive character.

**Construction or proof.**

1. At a finite point, the projection is smooth and L is lisse, so apply smooth local acyclicity.
2. At infinity use the first or second local polynomial model. j!L is pulled back from the fixed local pair in the transverse coordinates; local acyclicity of a product follows from the general-base supplier contract.
3. The property is étale local, so these charts prove it globally. The use of local acyclicity over all of S exceeds a trait-only contract and is an explicit LPV.0 extension request.

**Direct dependencies:** `FiniteFieldsAndCharacterSums:FF.2/polynomial-boundary-local-models`, `LefschetzPencilsAndVanishingCycles:LPV.0`, `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.0`.

**Acceptance.** A statement only about pointwise fiber cohomology does not imply this lemma. Both finite and infinity charts must be checked, including d=1.

**Source passages.** DELIGNE-WEIL-II, §3.7.3, p. 216. The resolution-free lissity mechanism; actual local acyclicity and constructible derived coefficients are imported.

### Lissity of universal exponential-sum cohomology

**Declaration:** `FiniteFieldsAndCharacterSums:FF.2/polynomial-family-lissity` (theorem).

For every i, R^if!L_ψ(Q_univ) is lisse on S and its geometric stalk at Q is H^i_c(A^n_k̄,L_ψ(Q)). Formation commutes with extension of the finite field. The family ranks are constant on geometrically connected S.

**Hypotheses and conventions.** Same universal family; no properness is assumed for f:S×A^n→S.

**Construction or proof.**

1. Write Rf!L=Rπ* j!L using the proper compactification S×P^n.
2. Apply proper pushforward of local acyclicity to the previous lemma to obtain lisse cohomology sheaves, then proper base change gives the stalk formula.
3. The original Weil I route instead uses the relative resolved compactification and smooth proper base change with normal-crossings boundary. This alternative is recorded but is not a prerequisite of the Weil II route.

**Direct dependencies:** `FiniteFieldsAndCharacterSums:FF.2/polynomial-family-local-acyclicity`, `SchemeAndStackFoundations:SF.2`, `LefschetzPencilsAndVanishingCycles:LPV.0`.

**Acceptance.** For n=1,d=1 all these sheaves are zero. The stalk formula uses compact supports, rather than ordinary cohomology of a nonproper family.

**Source passages.** DELIGNE-WEIL-II, Lemma 3.7.3, pp. 215–216. The lissity conclusion; source notation is reconciled to the fixed S above. DELIGNE-WEIL-I, §8.10, p. 305. The historical relative-compactification proof supplies an alternative route.

### Ranks and purity in the universal polynomial family

**Declaration:** `FiniteFieldsAndCharacterSums:FF.2/polynomial-family-cohomology` (theorem).

For the universal family, R^if!L=0 for i≠n, and R^nf!L is lisse of rank (d−1)^n, punctually pure of weight n at every complex embedding of its algebraic eigenvalues. In particular the geometric fiber at Q has precisely that dimension and weight, refining the parent’s individual-fiber concentration target to a relative assertion.

**Hypotheses and conventions.** n,d≥1, p∤d, ψ nontrivial; smooth leading part. The all-conjugate purity convention is used, not just purity for an unspecified fixed embedding.

**Construction or proof.**

1. On the one-variable Fermat factors, H⁰_c and H²_c vanish by the parent curve-extremal result and nontrivial wild inertia. GOS and the local break d give dim H¹_c=d−1; clean extension and duality make it pure of weight 1.
2. Künneth gives concentration in degree n and dimension (d−1)^n at the Fermat point. Alternatively import the parent additive-l-function-purity and its determinant comparison for this same one-variable fiber.
3. Lissity and connectedness transfer vanishing and rank to every fiber. Use the requested Weil II 1.8.12 constancy of weights of a mixed lisse sheaf on a connected normal base to transfer weight n; repeat for every embedding.
4. Apply the parent trace formula to recover its Deligne several-variable bound. The family theorem is a new declaration; the numerical bound is imported, not duplicated.

**Direct dependencies:** `FiniteFieldsAndCharacterSums:FF.2/polynomial-family-lissity`, `FiniteFieldsAndCharacterSums:FF.2/geometric-artin-schreier-break`, `FiniteFieldsAndCharacterSums:FF.2/lisse-sheaf-extremal-cohomology-on-curve`, `FiniteFieldsAndCharacterSums:FF.2/additive-l-function-purity`, `FiniteFieldsAndCharacterSums:FF.2/rank-one-sheaf-l-function`, `EtaleDualityAndPerverseSheaves:EDC.2`, `SchemeAndStackFoundations:SF.2`, `DeligneWeightsAndPurity:DWP.5`, `DeligneWeightsAndPurity:DWP.7`.

**Acceptance.** n=1 agrees with the parent degree d−1 additive L-function. d=1 gives rank zero, rather than an artificial one-dimensional weight-n term.

**Source passages.** DELIGNE-WEIL-II, §3.7.4, p. 216. Reduction to Fermat via 1.8.12 and Künneth. DELIGNE-WEIL-I, §§8.10–8.12, pp. 305–306. The one-variable Euler characteristic and clean-duality inputs, with the same prime-to-p guard.

### Family transport of polynomial duality

**Declaration:** `FiniteFieldsAndCharacterSums:FF.2/polynomial-boundary-clean-duality` (comparison).

For an individual Q in the universal family, the forget-supports map H^n_c(A^n,L_ψ(Q))→H^n(A^n,L_ψ(Q)) is an isomorphism; the pairing with H^n_c(A^n,L_ψ(−Q)) to E(−n) is perfect and Frobenius equivariant. This supplies a compactification proof of the parent duality node, not a new general Poincaré duality theorem.

**Hypotheses and conventions.** Same polynomial hypotheses. Uses the historical compactification route, whose surface supplier remains an explicit gap.

**Construction or proof.**

1. Normalize ψ=ψ_can(b·), b≠0, by the coefficient-space automorphism Q↦bQ, which preserves S. For this normalized Artin–Schreier cover, the relative smooth compactification with relative normal-crossings boundary makes both ordinary and compact cohomology locally constant over S. Pass to the nontrivial deck-character summands; the cup-product pairing is a morphism of these lisse sheaves.
2. At the Fermat point, Künneth reduces the pairing to the one-variable phase X^d. Its nontrivial character has nonzero wild break at infinity, so this curve summand has clean extension. Imported Poincaré duality gives a perfect compact-support pairing there.
3. Connectedness and local constancy imply that this pairing is perfect on every fiber. Comparing with Poincaré duality between compact and ordinary cohomology forces the forget-supports map to be an isomorphism. No separate assertion of vanishing inertia on every exceptional boundary component is made.

**Direct dependencies:** `FiniteFieldsAndCharacterSums:FF.2/relative-artin-schreier-compactification`, `FiniteFieldsAndCharacterSums:FF.2/artin-schreier-sheaf`, `FiniteFieldsAndCharacterSums:FF.2/affine-concentration-criterion`, `EtaleDualityAndPerverseSheaves:EDC.2`, `SchemeAndStackFoundations:SF.2`, `FiniteFieldsAndCharacterSums:FF.2/universal-smooth-leading-polynomial-family`, `FiniteFieldsAndCharacterSums:FF.2/geometric-artin-schreier-break`.

**Acceptance.** Dual phase is −Q and the target twist is −n. Purity and dimension alone do not prove that the forget-supports map is an isomorphism.

**Source passages.** DELIGNE-WEIL-I, Lemma 8.5(ii) and reduction at §8.5, pp. 303–304. The clean-cover argument behind the parent’s forget-supports and cup-product statement; not inferred merely from the numerical bound.

## Hyper-Kloosterman sums and their sheaves

Positive-rank hyper-Kloosterman sums generalize the parent's ordinary two-variable sum. The coordinate-product presentation fixes the convention at zero as well as on the multiplicative group. The sheaf construction keeps the cohomological sign, and the monodromy calculation records which extension statement belongs at zero and which belongs at infinity. This distinction prevents an incorrect extension-by-zero assertion across the origin.

Sommes trigonométriques §§4–7 supplies the induction. The finite étale algebra calculation is imported only for reduced finite algebras; the nonreduced primitive-ring argument above is its own elementary branch. The simultaneous induction for concentration and local monodromy is presented as a proof contract with a precise specialization request, rather than a circular graph.

### Hyper-Kloosterman sums

**Declaration:** `FiniteFieldsAndCharacterSums:FF.2/hyper-kloosterman-sum` (definition).

For k≥1, a∈F_{q^r}, ψ_r=ψ∘Tr_{F_{q^r}/F_q}, define HKl_k(a;q^r)=Σ_{x∈F_{q^r}^k, Πx_i=a}ψ_r(Σx_i). All coordinates are allowed; if a≠0 they are automatically units. For a≠0 the analytic normalized trace is (q^r)^(-(k−1)/2)HKl_k(a;q^r). At a=0 the unnormalized value is (−1)^(k−1). The geometric sheaf below has trace (−1)^(k−1)HKl_k, not HKl_k in every rank.

**Hypotheses and conventions.** Nontrivial ψ; k positive; finite-field extensions use trace lifts.

**Construction or proof.**

1. Use the finite fiber of the product map on the existing finite field, and sum the existing additive character over it.
2. For a≠0 eliminate one coordinate, obtaining the usual unit-coordinate hyper-Kloosterman expression.
3. At zero, stratify by the zero coordinates. Each nonempty zero set contributes products of Σ_{x≠0}ψ_r(x)=−1, and inclusion-exclusion yields (−1)^(k−1).

**Direct dependencies:** `mathlib:AddChar`, `FiniteFieldsAndCharacterSums:FF.1/trace-lift-of-an-additive-character`, `FiniteFieldsAndCharacterSums:FF.2/kloosterman-sum`.

**Uses.** hyper-kloosterman-sheaf and hyper-kloosterman-bound: The product-fiber sum is identified through the trace formula and its sign. FKMS §4.3.3: Weight-zero normalization used by analytic trace-function consumers.

**API.**

- `TauCeti.FiniteFieldSums.FF2.hyperKloosterman.rank_one` (simp): HKl₁(a;q^r)=ψ_r(a).
- `TauCeti.FiniteFieldSums.FF2.hyperKloosterman.zero` (simp): HKl_k(0;q^r)=(−1)^(k−1).
- `TauCeti.FiniteFieldSums.FF2.hyperKloosterman.unit_fiber` (characterisation): For a≠0 the fiber is parametrized by k−1 units with last coordinate a/(Πx_i).
- `TauCeti.FiniteFieldSums.FF2.hyperKloosterman.rank_two` (compatibility): HKl₂(a;q^r)=K(1,a;q^r) for the parent Kloosterman convention.
- `TauCeti.FiniteFieldSums.FF2.hyperKloosterman.extension` (functoriality): Changing the chosen isomorphic finite extension preserves the sum after transporting a and trace-lifting ψ.

**Unit tests.**

- `TauCeti.FiniteFieldSums.FF2.hyper_kloosterman_one` (computation): HKl₁(a)=ψ(a).
- `TauCeti.FiniteFieldSums.FF2.hyper_kloosterman_zero` (degenerate): HKl₂(0)=−1, while a sum over units only at zero would give 0.
- `TauCeti.FiniteFieldSums.FF2.hyper_kloosterman_two` (compatibility): For a≠0, HKl₂(a)=Σ_{x≠0}ψ(x+a/x).
- `TauCeti.FiniteFieldSums.FF2.hyper_kloosterman_five` (computation): Over F₅ with ψ(x)=exp(2πix/5), HKl₂(1)=2+2cos(4π/5).

**Acceptance.** k=1: HKl₁(a)=ψ_r(a), including a=0. k=2,a≠0 agrees with the parent Kloosterman sum K(1,a).

**Source passages.** DELIGNE-SGA45-SOMMES-TRIG, §7.1, (7.1.1)–(7.1.4), pp. 218–219. All-coordinate product-fiber convention; §7.7 checks its zero fiber. FKMS-APPLIED-L-ADIC, §4.3.3, Theorem 4.4, pp. 12–13. The analytic unit-fiber normalized convention is compared, rather than substituted at zero.

### Gauss cohomology over a finite étale algebra

**Declaration:** `FiniteFieldsAndCharacterSums:FF.2/etale-algebra-gauss-cohomology` (theorem).

Let A be a finite étale F_q-algebra of degree N≥1, ψ nontrivial and χ a multiplicative character of A×. On V=Res_{A/F_q}G_m, put L=L_χ⊗L_ψ(Tr_{A/F_q}). Then H^i_c(V_k̄,L)=0 for i≠N and dim H^N_c=1. If χ is nontrivial on each field factor of A, H^N_c→H^N is an isomorphism. Geometric permutations of split factors act on the tensor cohomology with the Koszul sign of the permutation, rather than by ordinary unsigned permutation.

**Hypotheses and conventions.** Finite étale algebra, not a nonreduced finite ring. No nontriviality assumption for the concentration claim; it is needed for clean extension.

**Construction or proof.**

1. Split A over k̄; the phase and Kummer character decompose as external tensor products of one-variable Gauss sheaves.
2. Use the parent Gauss eigenvalue/cohomology result for each factor; Künneth puts the tensor in degree N and gives dimension one.
3. Each nontrivial Kummer factor has zero tame boundary invariants at 0 and the additive factor is wild at infinity, giving clean extension. The interchange of degree-one tensor factors supplies the sign stated in Sommes trig. 4.12.

**Direct dependencies:** `FiniteFieldsAndCharacterSums:FF.2/gauss-sum-frobenius-eigenvalue`, `FiniteFieldsAndCharacterSums:FF.2/kummer-sheaf`, `FiniteFieldsAndCharacterSums:FF.2/artin-schreier-sheaf`, `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.2`.

**Acceptance.** N=1 recovers the parent Gauss cohomology. A trivial Kummer factor has compact cohomology in degree one but its forget-supports map is not an isomorphism.

**Source passages.** DELIGNE-SGA45-SOMMES-TRIG, Proposition 4.11 and §4.12, pp. 201–202. Split Künneth concentration and the signed permutation action, used by §7.12 to prove wild monodromy of Kl.

### The relative hyper-Kloosterman sheaf

**Declaration:** `FiniteFieldsAndCharacterSums:FF.2/hyper-kloosterman-sheaf` (construction).

Let π:A^k→A¹ be product and σ:A^k→A¹ be sum. Define Kl_k=R^(k−1)π!L_ψ(σ), an E-sheaf on A¹, and restrict it to G_m for its lisse local system. On G_m its rank is k and its Frobenius trace over F_{q^r} is (−1)^(k−1)HKl_k(a;q^r). Its zero stalk is the canonically trivial rank-one E-space. Extend the A¹ sheaf by zero at infinity to P¹; this equals the ordinary direct-image extension of its restriction to G_m. It is not zero extension across 0.

**Hypotheses and conventions.** k≥1, ψ nontrivial, E finite over Q_ℓ containing character values. The construction uses genuine Rπ! and its cohomology sheaf, not a record containing unproved rank and purity fields.

**Construction or proof.**

1. Pull back the parent Artin–Schreier sheaf along σ and form the actual compactly supported direct image.
2. Proper-base-change-for-! gives each stalk as compact cohomology of the product fiber; the following simultaneous fiber/monodromy theorem supplies the rank and extension comparisons.
3. The trace formula in degree k−1 gives the sign. At zero the hyperplane-cover calculation gives a trivial rank-one stalk; at infinity wild inertia has no invariants.

**Direct dependencies:** `FiniteFieldsAndCharacterSums:FF.2/hyper-kloosterman-sum`, `FiniteFieldsAndCharacterSums:FF.2/artin-schreier-sheaf`, `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.0`.

**Uses.** hyper-kloosterman-fiber-cohomology and hyper-kloosterman-local-monodromy: Provides the actual direct image whose ranks and local invariants control the sum. FKMS trace-function examples: After arithmetic normalization its trace is the analytic weight-zero hyper-Kloosterman trace, with the stated sign convention.

**API.**

- `TauCeti.FiniteFieldSums.FF2.HyperKloostermanSheaf.stalk` (projection): The geometric stalk at a is H^(k−1)_c(Πx_i=a,L_ψ(Σx_i)).
- `TauCeti.FiniteFieldSums.FF2.HyperKloostermanSheaf.baseChange` (functoriality): The construction commutes with extension of the finite field and trace lift of ψ.
- `TauCeti.FiniteFieldSums.FF2.HyperKloostermanSheaf.trace` (compatibility): Trace at a∈F_{q^r} is (−1)^(k−1)HKl_k(a;q^r).
- `TauCeti.FiniteFieldSums.FF2.HyperKloostermanSheaf.rank_one` (equivalence): For k=1 it is the parent L_ψ on A¹.
- `TauCeti.FiniteFieldSums.FF2.HyperKloostermanSheaf.zero_stalk` (simp): At zero the stalk is E with trivial Frobenius, consistent with the trace sign.

**Unit tests.**

- `TauCeti.FiniteFieldSums.FF2.kl_sheaf_one` (compatibility): For k=1, π=σ=id and the sheaf is L_ψ.
- `TauCeti.FiniteFieldSums.FF2.kl_sheaf_zero` (degenerate): For k=2 its zero stalk has trace 1, while HKl₂(0)=−1.
- `TauCeti.FiniteFieldSums.FF2.kl_sheaf_sign` (computation): For k=2,a≠0, its trace is −Σ_{x≠0}ψ(x+a/x).
- `TauCeti.FiniteFieldSums.FF2.kl_sheaf_extension_control` (non-example): The extension across 0 cannot be j!: its stalk there is nonzero.

**Acceptance.** k=1 is L_ψ on A¹. k=2 has sheaf trace minus the parent positive Kloosterman sum.

**Source passages.** DELIGNE-SGA45-SOMMES-TRIG, Theorem 7.8(i)–(iv), pp. 221–222. The scan was inspected: zero extension is from A¹ to P¹, while the extension across 0 is direct image. FKMS-APPLIED-L-ADIC, Theorem 4.4, pp. 12–13. Comparison to analytic normalization; no half Tate twist is silently assumed in E.

### Cohomology of hyper-Kloosterman fibers

**Declaration:** `FiniteFieldsAndCharacterSums:FF.2/hyper-kloosterman-fiber-cohomology` (theorem).

For V_a={Πx_i=a}⊂A^k and L=L_ψ(Σx_i), H^i_c(V_a,L)=0 for i≠k−1 and H^(k−1)_c→H^(k−1) is an isomorphism. For a≠0 its dimension is k and it is pure of weight k−1; for a=0 it is canonically E with trivial Frobenius. These hold over k̄ with all-conjugate weight conventions.

**Hypotheses and conventions.** k≥1; ψ nontrivial. The a=0 statement uses the singular union of coordinate hyperplanes; smooth duality is used only on a≠0.

**Construction or proof.**

1. At a=0, the closed-cover spectral sequence for the coordinate hyperplanes has only the origin term: all positive-dimensional additive-character factors are acyclic. Its Čech shift places E in degree k−1.
2. For a≠0 use induction simultaneous with hyper-kloosterman-local-monodromy. The k=1 fiber is one point. Project V_a in rank k+1 onto its first unit coordinate x; the remaining coefficient sheaf is L_ψ(x)⊗[a/x]*Kl_k.
3. The local monodromy induction gives Swan 1 at 0 and k at infinity, with no invariants there. GOS on G_m yields χ_c=−(k+1), and curve-extremal vanishing gives concentration and dimension k+1.
4. Clean extension and duality supply the compact/ordinary comparison; the parent affine-concentration criterion and DWP.7 supply purity. The simultaneous induction is within the proof, not a cyclic node prerequisite.

**Direct dependencies:** `FiniteFieldsAndCharacterSums:FF.2/hyper-kloosterman-sheaf`, `FiniteFieldsAndCharacterSums:FF.2/etale-algebra-gauss-cohomology`, `FiniteFieldsAndCharacterSums:FF.2/character-sheaf-cohomology-vanishes`, `FiniteFieldsAndCharacterSums:FF.2/affine-concentration-criterion`, `FiniteFieldsAndCharacterSums:FF.2/geometric-artin-schreier-break`, `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.2`, `DeligneWeightsAndPurity:DWP.7`, `ArithmeticGaloisRepresentations:R01.3`.

**Acceptance.** k=2,a≠0 gives dimension two and weight one, recovering the constant 2. The zero fiber has dimension one and weight zero, not k and weight k−1.

**Source passages.** DELIGNE-SGA45-SOMMES-TRIG, Theorem 7.4; §§7.7, 7.13–7.14, pp. 220–225. The fiber concentration, clean comparison and the simultaneous induction with local monodromy; the zero-fiber spectral-sequence shift is retained.

### Local monodromy of hyper-Kloosterman sheaves

**Declaration:** `FiniteFieldsAndCharacterSums:FF.2/hyper-kloosterman-local-monodromy` (theorem).

The restriction of Kl_k to G_m is lisse of rank k. At 0 it is tame with unipotent inertia consisting of one Jordan block; at infinity its Swan conductor is 1 and wild inertia has no nonzero invariants. Its ordinary direct-image extension across 0 has a one-dimensional invariant stalk; the extension at infinity is zero. For k=1, inertia at 0 is trivial, a one-by-one Jordan block.

**Hypotheses and conventions.** k≥1; coefficients as in the sheaf construction.

**Construction or proof.**

1. In the simultaneous induction, the rank-k fiber theorem gives one nonzero compact direct-image cohomology sheaf. Leray and the acyclicity of L_ψ(Σx_i) on A^k give vanishing of its H⁰_c and H¹_c on A¹. Hence it has no punctual sections, embeds into the ordinary direct image of its generic restriction, and the quotient supported at 0 vanishes. Together with the fiber ranks, the precise specialization argument of §7.10 gives lissity on G_m and the direct-image extension at 0. These sheaf-theoretic steps are requested from SF.2; rank constancy alone is insufficient.
2. The Fourier interpretation and Euler characteristic of π imply total Swan 1 at 0 and infinity. The coordinate-permutation and Gauss clean-extension argument of §§7.9–7.12 forces the wild part to lie at infinity and to have no invariant vectors.
3. The zero-fiber dimension one and tame local classification give one unipotent Jordan block at 0. This supplies exactly the local input needed for the rank-(k+1) fiber step of §7.14.

**Direct dependencies:** `FiniteFieldsAndCharacterSums:FF.2/hyper-kloosterman-fiber-cohomology`, `FiniteFieldsAndCharacterSums:FF.2/etale-algebra-gauss-cohomology`, `FiniteFieldsAndCharacterSums:FF.2/fourier-deligne-transform`, `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.2`, `ArithmeticGaloisRepresentations:R01.3`, `FiniteFieldsAndCharacterSums:FF.2/character-sheaf-cohomology-vanishes`.

**Acceptance.** Tame unipotent invariants at zero have dimension one in every rank. Swan 1 at infinity does not imply rank one.

**Source passages.** DELIGNE-SGA45-SOMMES-TRIG, Theorem 7.8 and proof §§7.9–7.12, pp. 221–224. Full local input, not only the numerical trace bound; uses the same single GOS owner request.

### Deligne’s hyper-Kloosterman bound

**Declaration:** `FiniteFieldsAndCharacterSums:FF.2/hyper-kloosterman-bound` (theorem).

For k≥1, a∈F_{q^r}× and a nontrivial ψ of F_q, |HKl_k(a;q^r)|≤k(q^r)^((k−1)/2) at every embedding of the cyclotomic character values in ℂ. The normalized unit-fiber sum has absolute value≤k. At a=0 its exact value is (−1)^(k−1), separately.

**Hypotheses and conventions.** The square-root-in-dimension exponent uses a≠0. Extension degree r≥1; traces are lifted to the extension.

**Construction or proof.**

1. Use the fiber theorem and the trace formula: the sum is (−1)^(k−1) times the trace on k eigenvalues of weight k−1.
2. Apply the triangle inequality at each embedding. The zero-fiber evaluation follows from the definition API rather than from a false rank-k purity claim there.

**Direct dependencies:** `FiniteFieldsAndCharacterSums:FF.2/hyper-kloosterman-fiber-cohomology`, `FiniteFieldsAndCharacterSums:FF.2/hyper-kloosterman-sum`, `FiniteFieldsAndCharacterSums:FF.2/character-sheaf-trace-formula`.

**Acceptance.** k=1 gives absolute value 1. k=2 gives 2√(q^r), agreeing with the parent Kloosterman bound.

**Source passages.** DELIGNE-SGA45-SOMMES-TRIG, §7.1(7.1.3) and §7.5, pp. 219–221. The rank-k weight-(k−1) estimate. FKMS-APPLIED-L-ADIC, Theorem 4.4, p. 13. The normalized analytic bound, compared with the geometric sign convention.

## Explicit Betti bounds and the Albanese term in Lang–Weil

Uniform Lang–Weil needs more than the existence of an error constant for one variety. This branch records Katz's explicit Betti-number deductions, their affine Lefschetz and Adolphson–Sperber Euler inputs, and the rational Albanese comparison behind the top-weight term. Singular projective varieties require the rational-map universal Albanese–Weil variety; the Albanese–Serre variety and the dual of a smooth abelian scheme do not give that object.

The equation-count constants depend on fixed embedding data. The reduction of arbitrary affine varieties to projective closures requires quantitative saturation bounds, not just formal homogenization of the listed equations. The generic-pencil argument also needs a uniformly bounded exceptional locus. Those contracts remain requested rather than claimed from qualitative projective geometry.

### Katz’s smooth affine Betti bound

**Declaration:** `FiniteFieldsAndCharacterSums:FF.2/smooth-affine-betti-bound` (theorem).

Over an algebraically closed field of characteristic different from ℓ, let V⊂A^N be cut out by r≥1 equations of degree≤δ, N≥1,δ≥1. If V has dimension zero, or is smooth and connected, then β_c(V)=Σ_i dim H^i_c(V,Q_ℓ)≤A(N,r,δ), where E(N,r,δ)=2^r(r+1+rδ)^N and A(N,r,δ)=E(N,r,δ)+2+2Σ_{j=1}^{N−1}E(j,r,δ). For smooth V, β_c(V)=β(V).

**Hypotheses and conventions.** Dimension-zero or smooth connected affine V. The explicit Euler bound and generic affine weak Lefschetz are the open supplier inputs, recorded separately.

**Construction or proof.**

1. For dimension zero, β_c=χ_c≤E. For a connected smooth affine curve, β=2−χ≤E+2.
2. For dimension n≥2 choose a generic affine hyperplane section W, smooth connected of dimension n−1. Affine weak Lefschetz identifies cohomology below n−1 and injects in n−1; affine vanishing eliminates degrees>n.
3. The resulting inequality β(V)≤|χ(V)|+|χ(W)|+β(W) gives E(N,r,δ)+E(N−1,r,δ)+A(N−1,r,δ)=A(N,r,δ). Duality identifies ordinary and compact Betti sums for smooth V.

**Direct dependencies:** `EtaleDualityAndPerverseSheaves:EDC.2`, `EtaleDualityAndPerverseSheaves:EDC.4`, `SchemeAndStackFoundations:SF.2`, `PadicDifferentialEquationsAndRigidCohomology:RD.6`.

**Acceptance.** A point has β_c=1. An affine curve of genus g with s punctures has β_c=2g+s, compatible with the Euler step.

**Source passages.** KATZ-BETTI, Part I, Theorem 2 and proof, manuscript pp. 2–4. The precise affine weak-Lefschetz induction and constants, not the existing projective smooth weak-Lefschetz contract.

### Katz’s arbitrary affine Betti bound

**Declaration:** `FiniteFieldsAndCharacterSums:FF.2/arbitrary-affine-betti-bound` (theorem).

For any closed subscheme V⊂A^N over an algebraically closed field, N≥1, defined by r≥1 equations of degree≤δ≥1, β_c(V)≤B(N,r,δ)=1+Σ_{∅≠J⊂{1,…,r}} A(N+1,1,1+δ|J|). Nilpotents and singularities are allowed. Here A is the constant in smooth-affine-betti-bound.

**Hypotheses and conventions.** ℓ invertible in the ground field. The N=1 case, not stated in Katz’s Theorem 1 header, is supplied by its same complement argument and the curve base case.

**Construction or proof.**

1. Excision in A^N gives β_c(V)≤1+β_c(A^N−V)=1+β(A^N−V), since the complement is smooth.
2. Cover the complement by D(F_i). Mayer–Vietoris bounds β by the sum over nonempty intersections.
3. Each intersection is the smooth hypersurface zΠ_{i∈J}F_i=1 in A^(N+1), of degree≤1+δ|J|. It can be empty; a nonempty such principal open is connected. Apply the preceding smooth bound to obtain B.
4. Étale cohomology is unchanged by reduction; no smoothness of V is used.

**Direct dependencies:** `FiniteFieldsAndCharacterSums:FF.2/smooth-affine-betti-bound`, `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.2`, `SchemeAndStackFoundations:SF.0`.

**Acceptance.** The empty closed subscheme has zero cohomology. A union of axes is permitted; no ordinary/compact duality is applied to the singular union itself.

**Source passages.** KATZ-BETTI, Part I, Theorem 1 and proof, manuscript pp. 2–3. The complement cover and auxiliary smooth hypersurface argument, including the N=1 extension needed by Theorem 3.

### Explicit Betti bounds for projective varieties

**Declaration:** `FiniteFieldsAndCharacterSums:FF.2/explicit-projective-betti-bound` (theorem).

If X⊂P^N, N≥1, is defined by r≥1 homogeneous equations of degree≤δ≥1, then β(X)=β_c(X)≤1+Σ_{j=1}^N B(j,r,δ)≤8·2^r(rδ+3)^(N+1). This holds in arbitrary characteristic with ℓ invertible, for singular and nonreduced X. For a finite-field model of X, the total reduced numerator/denominator degree τ(X) of Z(X,T)/Z(P^n,T), n=dim X, is at most β(X)+n≤9·2^r(rδ+3)^(N+1).

**Hypotheses and conventions.** Projective X, N≥1, r,δ≥1. τ counts degrees after cancellations and is nonnegative; the n=0 counting case is handled directly.

**Construction or proof.**

1. Filter projective space by affine coordinate strata. Excision and the preceding arbitrary-affine bound give 1+Σ B(j,r,δ), with the point stratum contributing at most 1.
2. For b=3+sδ≥3, insert E(j,1,1+sδ)=2b^j into A: A(j+1,1,1+sδ)=2b^(j+1)+2+4Σ_{t=1}^j b^t≤4b^(j+1)−4.
3. For b_max=3+rδ, B(j,r,δ)≤1+(2^r−1)(4b_max^(j+1)−4). Summing a geometric series gives at most N+1+6·2^r b_max^(N+1)≤8·2^r b_max^(N+1). This derives the factor 8 used by Ghorpade–Lachaud, rather than misquoting Katz’s looser displayed factor 9.
4. The trace formula bounds the total degree of Z by β. Cancel its common top Tate factor with Z(P^n); the remaining projective-space factors add at most n, yielding τ≤β+n and the factor 9.

**Direct dependencies:** `FiniteFieldsAndCharacterSums:FF.2/arbitrary-affine-betti-bound`, `SchemeAndStackFoundations:SF.2`.

**Acceptance.** A linear projective space has β=n+1 and τ=0. The bound controls compact cohomology of every affine stratum, not ordinary Betti numbers of a singular affine variety.

**Source passages.** KATZ-BETTI, Part I, Theorem 3, manuscript p. 4. Affine stratification yields the displayed sum; the sharper factor 8 is derived explicitly here. GHORPADE-LACHAUD-02, §5, explicit Betti-number bound and §11.1–11.2. The factor 9 in uniform Lang–Weil comes after the Betti bound, not from identifying the two constants.

### Albanese–Weil varieties and linear curve sections

**Declaration:** `FiniteFieldsAndCharacterSums:FF.2/albanese-linear-section-bound` (theorem).

Let X⊂P^N be geometrically integral projective of dimension n≥2 and degree d over a perfect field. A geometric generic linear curve section Y is integral, and its smooth projective normalization Ỹ induces a surjection Jac(Ỹ)→Alb_w(X). Thus 2 dim Alb_w(X)≤2g(Ỹ)≤(d−1)(d−2). For generic sections of dimension≥2 the induced Albanese–Weil homomorphism is a purely inseparable isogeny. Alb_w uses the universal rational-map Albanese; it is not the Albanese for everywhere regular maps on a singular X.

**Hypotheses and conventions.** Geometric generic or nonempty-open general linear sections. The general rational Albanese, its section functoriality and the singular-section genus inequality are extension requests; no general Albanese carrier is constructed here.

**Construction or proof.**

1. Use the requested rational Albanese universal property and section theorem from its single abelian/Picard supplier.
2. For a curve section pass to its smooth normalization, whose rational Albanese is its Jacobian, to obtain surjectivity.
3. Use generic birational plane projection of the integral degree-d curve and the arithmetic-genus bound (d−1)(d−2)/2; normalization can only lower that genus. This singular-curve comparison exceeds the supplier’s smooth-plane-curve formula and is an explicit SF.3 extension.

**Direct dependencies:** `AbelianSchemesAndArithmeticModuli:A2`, `SchemeAndStackFoundations:SF.3`, `SchemeAndStackFoundations:SF.0`.

**Acceptance.** For X=P^n, Alb_w=0 and d=1 gives zero right side. Replacing Alb_w by Alb_s on a singular projective variety is not justified.

**Source passages.** GHORPADE-LACHAUD-02, Proposition 9.4(i)–(iii), pp. 28–29. The generic section maps and genus inequality; the proof references a general rational-Albanese theory absent from the present A2 contract.

### Bombieri–Sperber’s Albanese point-count expansion

**Declaration:** `FiniteFieldsAndCharacterSums:FF.2/bombieri-sperber-albanese-expansion` (theorem).

For a projective geometrically integral X/F_q of dimension n≥2, A=Alb_w(X), and arithmetic Frobenius endomorphism ϕ of A, for every r≥1 one has #X(F_{q^r})=π_n(q^r)−(q^r)^(n−1)Tr(ϕ^r)+O_X((q^r)^(n−1)). The constant is independent of r. This is the fixed-variety all-extension expansion used to identify the highest nontrivial weight; it does not yet assert a bound uniform over arbitrary X.

**Hypotheses and conventions.** Projective X; exact rational-Albanese convention. The normal-surface/resolution comparison and uniformly bounded generic-pencil bad locus are explicit supplier gaps.

**Construction or proof.**

1. In dimension two, use normalization and a projective smooth surface resolution, birational invariance of rational Albanese, Picard/Tate comparison and Gysin/duality to identify the weight-three trace with qTr(ϕ). Lower-weight and boundary terms are O(q).
2. For n≥3 select a generic codimension-two pencil center meeting X in dimension n−2. The requested bounded-pencil contract bounds the center and exceptional fibers by O((q^r)^(n−1)).
3. On each good hyperplane section, the previous dimension expansion applies; its rational Albanese is purely inseparably isogenous to A, so their Frobenius traces agree. Sum over q^r+1 good parameters, controlling the finitely many bad parameters and the overcounted center.
4. The induction must be uniform over the fibers of this fixed pencil, using a fixed finite-type family and bounded exceptional locus. Finitely many small extension fields can be absorbed into one X-dependent constant.

**Direct dependencies:** `FiniteFieldsAndCharacterSums:FF.2/albanese-linear-section-bound`, `AbelianSchemesAndArithmeticModuli:A2`, `SchemeAndStackFoundations:SF.4`, `SchemeAndStackFoundations:SF.0`, `EtaleDualityAndPerverseSheaves:EDC.2`, `DeligneWeightsAndPurity:DWP.7`, `FiniteFieldsAndCharacterSums:FF.2/lang-weil-estimate`, `FiniteFieldsAndCharacterSums:FF.2/explicit-projective-betti-bound`.

**Acceptance.** X=P^n has ϕ trace zero and exact count π_n. This estimate is insufficient to claim the explicit uniform equation-degree constant before the Betti theorem.

**Source passages.** GHORPADE-LACHAUD-02, Lemma 11.7 and proof, pp. 37–38. The pencil proof of the all-extension expansion; source alone does not replace the surface and family-uniformity supplier inputs.

### The highest odd weight and the Albanese–Weil spectrum

**Declaration:** `FiniteFieldsAndCharacterSums:FF.2/top-weight-albanese-comparison` (comparison).

For projective geometrically integral X/F_q of dimension n≥2, the multiset of eigenvalues of geometric cohomological Frobenius on the weight-(2n−1) quotient of H^(2n−1)(X_k̄,Q_ℓ) equals {q^(n−1)α_j}, where α_j are the characteristic roots of the Frobenius endomorphism of Alb_w(X), with multiplicity. Hence its dimension is 2 dim Alb_w(X) and the traces over extensions are (q^r)^(n−1)Tr(ϕ^r). Equality of spectra is asserted, without an unjustified canonical isomorphism of representations.

**Hypotheses and conventions.** Weight quotient in the algebraic all-conjugate sense. Abelian Frobenius roots are pure of weight one; its Tate-module convention is fixed by the supplier.

**Construction or proof.**

1. The trace formula and weight bounds separate the q^(rn) top Tate term and the possible weight-(2n−1) term; all other terms are O_X(q^(r(n−1))).
2. Compare with the all-extension Bombieri–Sperber expansion. The difference of the two candidate power sums is O_X(q^(r(n−1))).
3. Both spectra have exact absolute value q^(n−1/2). Apply the finite-spectrum converse and linear independence of distinct exponential sequences to force the signed multiplicities of every such root to vanish. This is the signed version of Ghorpade–Lachaud Lemma 8.2, not an application of an unsigned positive-multiplicity bound without cancellation control.

**Direct dependencies:** `FiniteFieldsAndCharacterSums:FF.2/bombieri-sperber-albanese-expansion`, `AbelianSchemesAndArithmeticModuli:A2`, `DeligneWeightsAndPurity:DWP.1`, `DeligneWeightsAndPurity:DWP.7`, `DeligneWeightsAndPurity:DWP.8`, `SchemeAndStackFoundations:SF.2`, `WeilConjectures:WC.5:power-sum-converse`.

**Acceptance.** The rank bound follows from the generic curve-section node. A bound on one point count, rather than all extensions, cannot determine this spectrum.

**Source passages.** GHORPADE-LACHAUD-02, Theorem 10.7; proof after Lemma 11.7, pp. 34, 38. The highest-weight spectrum identification, with the all-extension and signed-power-sum argument stated explicitly.

### Uniform Lang–Weil over a bounded family

**Declaration:** `FiniteFieldsAndCharacterSums:FF.2/uniform-lang-weil-family` (application).

Fix N,r,δ≥1. There is a constant C(N,r,δ) such that for every finite field F_Q and geometrically integral affine V⊂A^N_F_Q defined by r equations of degree≤δ, dimension e≥1, |#V(F_Q)−Q^e|≤C(N,r,δ)Q^(e−1/2). For projective fibers X⊂P^N of degree d and dimension e, the parent’s sharper form holds with (d−1)(d−2)Q^(e−1/2)+9·2^r(rδ+3)^(N+1)Q^(e−1). For a fixed finite-type presentation these constants are uniform over all finite-field fibers and extensions that are geometrically integral.

**Hypotheses and conventions.** Uniformity is in specified embedding/equation data or a fixed finite-type presentation. Dimension-zero geometrically integral fibers are single rational reduced points and are treated separately.

**Construction or proof.**

1. The new projective Betti bound and top-weight Albanese comparison provide the missing inputs of the imported parent uniform theorem; the curve-section bound yields its degree coefficient.
2. For affine varieties use excision with the projective closure. Homogenizing only the listed generators can create infinity components: obtain a bound for generators of the homogenized saturated ideal using the requested bounded-presentation elimination contract, then bound the boundary as well.
3. For fixed finite-type presentations choose finite affine charts and bounded generators once. Apply the bounds to geometrically integral fibers; dimension and degree bounds are controlled by this presentation. This proves the exact family uniformity needed by HW-16 rather than a fixed-V assertion.

**Direct dependencies:** `FiniteFieldsAndCharacterSums:FF.2/uniform-lang-weil-estimate`, `FiniteFieldsAndCharacterSums:FF.2/explicit-projective-betti-bound`, `FiniteFieldsAndCharacterSums:FF.2/top-weight-albanese-comparison`, `FiniteFieldsAndCharacterSums:FF.2/albanese-linear-section-bound`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.2`.

**Acceptance.** Linear projective fibers have exact count π_e. Geometric integrality cannot be replaced by connectedness: two irreducible components contribute two leading terms.

**Source passages.** GHORPADE-LACHAUD-02, Theorem 11.1 and Remark 11.3, pp. 35–36. The projective equation-data bound and its affine extension; the family contract spells out the bounded presentation needed in routed applications.

## Constant-field cosets and geometric Chebotarev

The cover is connected, but need not be geometrically connected. Its geometric components and its constant-field quotient are essential: arithmetic Frobenius classes lie in a specified coset of the geometric group, and the density denominator is the order of that geometric group. Twisting is performed over each counting field. The exact identity sums the twists of all geometric components; individual component counts need not coincide.

FunctionFieldArithmetic:FA.5 supplies the constant-field quotient and the existing curve result. This part extends the variety-level twist application of uniform Lang–Weil, preserving that convention. Equation and boundary bounds are kept through descent of a finite invariant generating linear system, rather than a nonexistent finite-dimensional space of all global sections on a quasi-projective scheme.

### Twists of a geometric component in the Frobenius coset

**Declaration:** `FiniteFieldsAndCharacterSums:FF.2/constant-coset-twist-count` (lemma).

Let X/F_q be smooth geometrically connected of dimension e≥1 and Y→X a connected finite étale Galois cover with group G of F_q-automorphisms. Let H⊲G be the geometric subgroup, G/H≅Gal(F_{q^m}/F_q), and Γ_r the inverse image of arithmetic Frob_q^r. For g∈Γ_r, the semilinear action g⁻¹Frob_q^r preserves every geometric component D of Y, giving a descended twist D_{r,g}/F_{q^r}. If C_G(g) is its conjugacy class, N_r(C_G(g))=|Z_G(g)|⁻¹Σ_D #D_{r,g}(F_{q^r}), the sum being over all m geometric components. Individual component-twist counts need not agree.

**Hypotheses and conventions.** Arithmetic Frobenius conventions for the torsor; cohomological geometric Frobenius is its inverse in the representation dictionary. The twist is formed separately over F_{q^r}; it is not the r-th power of a fixed F_q twist.

**Construction or proof.**

1. Arithmetic Frobenius permutes the m components through its image in G/H. Exactly g∈Γ_r makes g⁻¹Frob^r preserve each component. Use effective descent on D.
2. For a rational base point, the number of lifts satisfying Frob^r(y)=gy is |Z_G(g)| when its class is C_G(g), otherwise zero.
3. Count the solutions of Frob^r(y)=gy over all components, each descended separately under g⁻¹Frob^r. Their total is the sum of their twist point counts; do not replace this sum by m times one chosen component.
4. Use |G|=m|H| and |C_G(g)|=|G|/|Z_G(g)| for the leading term after applying Lang–Weil separately to all m twists.

**Direct dependencies:** `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.0`, `SchemeAndStackFoundations:SF.2`, `FunctionFieldArithmetic:FA.5`.

**Acceptance.** For a pure constant extension, H=1 and every point has the unique admissible Frobenius coset class. If g∉Γ_r there are no such points; assigning density |C|/|G| in every extension is false.

**Source passages.** MEAGHER-CHEBOTAREV, Proof of Theorem 1.1, pp. 198–200. Extends the geometrically connected-cover twist count by retaining its constant-field components and the FA.5 coset convention.

### Chebotarev with a constant-field Frobenius coset

**Declaration:** `FiniteFieldsAndCharacterSums:FF.2/constant-field-coset-chebotarev` (theorem).

In the preceding setting, for a conjugacy-stable subset C⊂G and r≥1, let N_r(C) count x∈X(F_{q^r}) whose arithmetic Frobenius class lies in C. Then N_r(C)=|C∩Γ_r|/|H|·q^(re)+O(q^(r(e−1/2))). For a fixed cover the constant is independent of r. It is uniform over covers and twists with specified bounded projective embedding and boundary-equation data (including the finite G-action); it is not asserted to depend only on the base degree or |G|.

**Hypotheses and conventions.** X smooth geometrically connected; cover connected finite étale Galois. For a dense open étale locus of a generically finite cover, the excluded boundary contributes O(q^(r(e−1))) under the same bounded-data hypotheses.

**Construction or proof.**

1. For each G-conjugacy class in C∩Γ_r use constant-coset-twist-count and Lang–Weil on every component twist D_{r,g}. There are m such components, each with leading term q^(re), giving m/|Z_G(g)|=|C_G(g)|/|H|.
2. Fix a finite G-stable linear system giving an equivariant projective embedding, and equivariant boundary equations. Descent twists its finite-dimensional vector space and equations; dimensions and degrees stay bounded. The SF.1 equivariant-presentation request is needed for uniformity across twists.
3. Apply uniform-lang-weil-family to the twists and sum |class|/|H| over the permitted classes. There are finitely many classes, and the specified data control their errors for every r.
4. In dimension one, import FA.5’s genus/conductor error and its coset convention, rather than building a second function-field Chebotarev theorem.

**Direct dependencies:** `FiniteFieldsAndCharacterSums:FF.2/constant-coset-twist-count`, `FiniteFieldsAndCharacterSums:FF.2/uniform-lang-weil-family`, `SchemeAndStackFoundations:SF.1`, `SchemeAndStackFoundations:SF.0`, `FunctionFieldArithmetic:FA.5`.

**Acceptance.** When m=1, H=G and Γ_r=G, recovering the parent density |C|/|G|. For a constant extension of degree m, counts vanish on incompatible extension degrees and equal #X on the unique compatible class.

**Source passages.** MEAGHER-CHEBOTAREV, Theorem 1.1 and Appendix A, pp. 196–202. Geometrically connected case of the argument; the constant-coset correction and bounded finite linear system are supplied explicitly here.

## Correlation, quasi-orthogonality and Möbius stabilizers

Trace correlations have a cohomological main term whenever the geometric representations have common constituents. An estimate asserting cancellation for all pairs is therefore false even for the trivial sheaf. The main term is the Frobenius trace on geometric coinvariants; its phases need not be identically one when two sheaves are only geometrically isomorphic.

For Möbius pullbacks, the geometric isomorphism stabilizer is defined as a subgroup of PGL₂ over the algebraic closure. This pass needs the subgroup, conjugation and singular-set API, and cancellation outside it. It does not need an algebraic representability theorem or a classification of all such subgroups. Artin–Schreier and Kummer examples separate equality of trace functions from geometric isomorphism up to an arithmetic constant twist.

### The full main term in trace-function correlations

**Declaration:** `FiniteFieldsAndCharacterSums:FF.2/trace-correlation-main-term` (theorem).

Let U⊂A¹_F_q be a nonempty open and F,G lisse algebraic E-sheaves on U, punctually pure of weight zero at the fixed embedding ι:Ē→ℂ. For Q=q^r, put C_r=Q⁻¹Σ_{x∈U(F_Q)}t_F,r(x)conj(t_G,r(x)). If W=(V_F⊗V_G^∨)_{π₁(U_k̄)} with its induced Frobenius, then |C_r−Tr(Frob_q^r|W)|≤b₁Q^(−1/2), where b₁=dim H¹_c(U_k̄,F⊗G^∨). On middle-extension traces on all A¹ add at most |A¹−U|rk(F)rk(G)/Q to the error. The main term is not discarded when geometric invariants are present.

**Hypotheses and conventions.** Lisse pure weight-zero sheaves on common affine U. Use coinvariants, not an unproved identification with invariants for arbitrary representations.

**Construction or proof.**

1. On U purity gives the dual trace equal to complex conjugation. Apply the parent trace formula to F⊗G^∨.
2. H⁰_c vanishes on a connected nonproper curve; imported duality identifies H²_c=W(−1). Dividing by Q gives Tr(Frob^r|W).
3. DWP.7 bounds H¹_c eigenvalues by √Q, giving the exact Betti error. Boundary middle-extension stalks have eigenvalues of weight≤0 and rank≤the generic rank, yielding the stated finite boundary correction.
4. The parent conductor bound, together with GOS and local tensor Swan inequalities from AGR, converts b₁ into a constant depending only on the two conductors and the common singular set.

**Direct dependencies:** `FiniteFieldsAndCharacterSums:FF.2/trace-function`, `FiniteFieldsAndCharacterSums:FF.2/character-sheaf-trace-formula`, `FiniteFieldsAndCharacterSums:FF.2/lisse-sheaf-extremal-cohomology-on-curve`, `FiniteFieldsAndCharacterSums:FF.2/h1c-conductor-bound`, `EtaleDualityAndPerverseSheaves:EDC.2`, `DeligneWeightsAndPurity:DWP.7`, `ArithmeticGaloisRepresentations:R01.3`.

**Acceptance.** F=G=constant rank one on A¹ gives C_r=1 and W=E; cancellation is absent. Distinct additive characters on A¹ give W=0 and the usual exact orthogonality.

**Source passages.** FKMS-APPLIED-L-ADIC, §5, (5.1)–(5.2), pp. 13–14. The full Frobenius main term, before imposing isotypicity; the explicit Betti error avoids ambiguity in printed conductor exponents.

### Isotypic quasi-orthogonality

**Declaration:** `FiniteFieldsAndCharacterSums:FF.2/isotypic-quasi-orthogonality` (theorem).

If F,G in trace-correlation-main-term are geometrically isotypic, with multiplicities m_F,m_G of irreducible geometric constituents L_F,L_G, then the main term is zero when L_F is not isomorphic to L_G. If they are isomorphic, dim W=m_Fm_G and its Frobenius eigenvalues α_1,…,α_{m_Fm_G} have modulus one; C_r=Σα_i^r+O(q^(−r/2)). For geometrically irreducible F,G the nonzero main term is a single α^r. The constants are independent of r, controlled by the preceding Betti/conductor data.

**Hypotheses and conventions.** Geometric isotypicity, not arithmetic isotypicity alone. No arithmetic semisimplicity or Frobenius diagonalizability is assumed.

**Construction or proof.**

1. Use DWP.8 geometric semisimplicity of pure lisse sheaves and Schur’s lemma to identify the dimension of the coinvariant Hom space.
2. The Frobenius action on the multiplicity Hom space is pure of weight zero; hence its generalized eigenvalues have modulus one. Traces of powers count them with multiplicity even if Jordan blocks are present.
3. Insert this description of W into trace-correlation-main-term.

**Direct dependencies:** `FiniteFieldsAndCharacterSums:FF.2/trace-correlation-main-term`, `DeligneWeightsAndPurity:DWP.8`, `DeligneWeightsAndPurity:DWP.7`.

**Acceptance.** For F=G geometrically irreducible the main term is 1. An arithmetic unipotent extension of the constant sheaf need not split; traces still obey the eigenvalue formula.

**Source passages.** FKMS-APPLIED-L-ADIC, Theorem 5.2, (5.3)–(5.4), p. 14. The geometric-isotypic main term and extension-uniform error, retaining the distinction from arithmetic semisimplicity.

### The geometric Möbius stabilizer of a sheaf

**Declaration:** `FiniteFieldsAndCharacterSums:FF.2/geometric-mobius-stabilizer` (definition).

For a middle-extension E-sheaf F on P¹_k̄, define Aut_geom(F) as the subgroup of PGL₂(k̄) consisting of γ for which γ*F is isomorphic to F. For F defined over F_q the rational stabilizer is its intersection with PGL₂(F_q). The definition asserts a subgroup of transformations; algebraic-group representability and classification are not part of it.

**Hypotheses and conventions.** Use middle extension from the maximal lisse locus and genuine sheaf isomorphism. A chosen finite-field model defines the rational intersection.

**Construction or proof.**

1. Use actual pullback on the constructible sheaf category and equality of geometric isomorphism classes.
2. Identity, composition and inverse follow from pullback functoriality; composition reverses pullback order but preserves membership.
3. A pullback isomorphism preserves the singular set and local inertia representations; conductor is invariant under a Möbius automorphism.

**Direct dependencies:** `SchemeAndStackFoundations:SF.2`, `EtaleDualityAndPerverseSheaves:EDC.0`, `FiniteFieldsAndCharacterSums:FF.2/trace-function`.

**Uses.** mobius-autocorrelation-bound: Precisely detects whether the geometric Hom main term vanishes. ExponentialSumsAndCircleMethod:ES.0: Distinguishes exceptional transformations in completed character-sum applications.

**API.**

- `TauCeti.FiniteFieldSums.FF2.GeometricMobiusStabilizer.one` (structure): Identity lies in Aut_geom(F).
- `TauCeti.FiniteFieldSums.FF2.GeometricMobiusStabilizer.mul` (structure): Membership is closed under composition.
- `TauCeti.FiniteFieldSums.FF2.GeometricMobiusStabilizer.inv` (structure): Membership is closed under inverse.
- `TauCeti.FiniteFieldSums.FF2.GeometricMobiusStabilizer.conjugate` (functoriality): For γ*F the stabilizer is γ⁻¹Aut_geom(F)γ.
- `TauCeti.FiniteFieldSums.FF2.GeometricMobiusStabilizer.singularSet` (compatibility): Every member preserves the intrinsic singular locus and matches local inertia data.

**Unit tests.**

- `TauCeti.FiniteFieldSums.FF2.mobius_trivial` (degenerate): For the constant sheaf the stabilizer is all PGL₂(k̄).
- `TauCeti.FiniteFieldSums.FF2.mobius_additive_translation` (computation): Every translation stabilizes L_ψ(X) geometrically: the added constant gives a geometrically trivial rank-one factor.
- `TauCeti.FiniteFieldSums.FF2.mobius_kummer_inverse` (characterisation): Inversion stabilizes the nontrivial Kummer sheaf exactly for a quadratic character.
- `TauCeti.FiniteFieldSums.FF2.mobius_kummer_nonexample` (non-example): A nontrivial translation does not preserve the two singular points 0 and ∞ of a nontrivial Kummer sheaf.

**Acceptance.** The trivial sheaf has full PGL₂ stabilizer. The inversion stabilizes L_χ on G_m exactly when χ=χ⁻¹.

**Source passages.** FKMS-APPLIED-L-ADIC, Definition 7.1 and Examples 7.3, pp. 19–20. The group used by the correlation criterion; its additional representability claim is not needed for this target.

### Cancellation outside the geometric Möbius stabilizer

**Declaration:** `FiniteFieldsAndCharacterSums:FF.2/mobius-autocorrelation-bound` (application).

For a geometrically irreducible, punctually weight-zero middle-extension sheaf F on P¹_F_q and γ∈PGL₂(F_q), sum over the common affine lisse domain U∩γ⁻¹U. If γ∉Aut_geom(F), the normalized autocorrelation Q⁻¹Σt_F(x)conj(t_F(γx)) is O_F(Q⁻¹/2) for Q=q^r, uniformly in r and in γ with fixed conductor data. On the full projective line use the middle-extension boundary correction. If γ belongs to the stabilizer the rank-one Hom main term must be retained.

**Hypotheses and conventions.** Geometrically irreducible F; γ defined over the base field. The sum excludes a pole of γ when written in affine coordinates.

**Construction or proof.**

1. Pull back F along γ; its conductor and weight are unchanged.
2. Apply isotypic-quasi-orthogonality to F and γ*F on their common domain. Stabilizer nonmembership means the geometric constituents are nonisomorphic, so W=0.
3. Bound the common singular set and tensor Swan terms by the conductor inputs; apply the explicit boundary correction where needed.

**Direct dependencies:** `FiniteFieldsAndCharacterSums:FF.2/geometric-mobius-stabilizer`, `FiniteFieldsAndCharacterSums:FF.2/isotypic-quasi-orthogonality`, `ArithmeticGaloisRepresentations:R01.3`.

**Acceptance.** For the identity, F=γ*F and the correlation has a main term; a cancellation-only theorem would fail. For a Kummer sheaf and a nontrivial translation, singular-set mismatch gives cancellation.

**Source passages.** FKMS-APPLIED-L-ADIC, Proposition 7.2, p. 20. The vanishing-Hom correlation criterion, not the separate finite-group classification of §§7.4–7.7.

## Global and local Fourier ownership

The existing parent Artin–Schreier and global Fourier nodes remain imports for BROWNING–SAWIN-20, ABE-25/A19, YANG–ZHAO-25/A02 and the Artin–Schreier factor of FRESÁN–SABBAH–YU-22/33. The proposed general-base local Fourier supplier owns the nearby-cycle product kernels, not a second Artin–Schreier sheaf. Its comparison with the global transform is a requested extension of LefschetzPencilsAndVanishingCycles:LPV.0, coordinated with SF.2 and EDC.0. `GeneralBasesFourier` is a proposal and is not used as a registered prerequisite identifier.

The requested stationary-phase comparison computes the nearby and vanishing cycles of a compactified global Fourier transform from the local R¹Φ kernels π/π′, π′/π and 1/(ππ′). It includes each finite singularity and infinity, cohomological shift [1], the inversion x↦−x and twist (−1), and the exclusion of geometrically constant subquotients in Laumon 2.4.3.3's local duality statement. The public Laumon sections 2.1–2.4 were read for these contracts; the proof of 2.5 was not decomposed. Abe's torsion and local regular finite-ℤℓ coefficient setting exceeds the parent's E-field construction and requires a coefficient extension at the same supplier boundary.

## Supplier contracts and ownership

These requests extend existing owners in their own direction. A request records the exact theorem needed and the new nodes consuming it; it does not assert that a stage already exports it. In particular there is one Grothendieck–Ogg–Shafarevich owner, one general geometric conductor owner, and one rational Albanese owner. FiniteFieldsAndCharacterSums owns its rank-one local calculation, numerical applications and character-sum constructions.

### `SchemeAndStackFoundations:SF.0`

Actual affine coefficient and projective schemes, smooth loci and projective singularity incidence; normalization commuting with étale maps; geometric component and dimension conventions. Extension needed: bounded homogeneous generators after saturation/projective closure in terms of (N,r,δ), and bounded degree/number of exceptional loci in a fixed generic hyperplane pencil. The existing stage is not credited with a quantitative elimination theorem.

New consumers: `FiniteFieldsAndCharacterSums:FF.2/universal-smooth-leading-polynomial-family`, `FiniteFieldsAndCharacterSums:FF.2/polynomial-boundary-local-models`, `FiniteFieldsAndCharacterSums:FF.2/arbitrary-affine-betti-bound`, `FiniteFieldsAndCharacterSums:FF.2/albanese-linear-section-bound`, `FiniteFieldsAndCharacterSums:FF.2/bombieri-sperber-albanese-expansion`, `FiniteFieldsAndCharacterSums:FF.2/uniform-lang-weil-family`, `FiniteFieldsAndCharacterSums:FF.2/constant-coset-twist-count`, `FiniteFieldsAndCharacterSums:FF.2/constant-field-coset-chebotarev`.

### `SchemeAndStackFoundations:SF.1`

Effective Galois descent of each quasi-projective component under g⁻¹Frob_q^r, performed separately over F_{q^r}; descent of a finite G-stable generating linear system and its projective embedding, with equation degrees and boundary presentation unchanged by twisting. Use a finite span of generating sections and their G-orbits, not all H⁰ on a quasi-projective scheme.

New consumers: `FiniteFieldsAndCharacterSums:FF.2/constant-coset-twist-count`, `FiniteFieldsAndCharacterSums:FF.2/constant-field-coset-chebotarev`.

### `SchemeAndStackFoundations:SF.2`

Genuine étale sites, finite-character torsor pushout and π₁ representations; constructible E-coefficients, compact direct image with base change, projection formula, Künneth (including degree signs), trace formula over every finite extension, excision/Mayer–Vietoris, affine vanishing and proper pushforward of locally acyclic complexes. Supply the specialization/local-monodromy argument of Sommes trig. 7.9–7.12 for R^(k−1)π!, not the invalid implication that constant stalk dimension alone gives lissity.

New consumers: `FiniteFieldsAndCharacterSums:FF.2/universal-smooth-leading-polynomial-family`, `FiniteFieldsAndCharacterSums:FF.2/polynomial-boundary-local-models`, `FiniteFieldsAndCharacterSums:FF.2/relative-artin-schreier-compactification`, `FiniteFieldsAndCharacterSums:FF.2/polynomial-family-local-acyclicity`, `FiniteFieldsAndCharacterSums:FF.2/polynomial-family-lissity`, `FiniteFieldsAndCharacterSums:FF.2/polynomial-family-cohomology`, `FiniteFieldsAndCharacterSums:FF.2/polynomial-boundary-clean-duality`, `FiniteFieldsAndCharacterSums:FF.2/etale-algebra-gauss-cohomology`, `FiniteFieldsAndCharacterSums:FF.2/hyper-kloosterman-sheaf`, `FiniteFieldsAndCharacterSums:FF.2/hyper-kloosterman-fiber-cohomology`, `FiniteFieldsAndCharacterSums:FF.2/hyper-kloosterman-local-monodromy`, `FiniteFieldsAndCharacterSums:FF.2/smooth-affine-betti-bound`, `FiniteFieldsAndCharacterSums:FF.2/arbitrary-affine-betti-bound`, `FiniteFieldsAndCharacterSums:FF.2/explicit-projective-betti-bound`, `FiniteFieldsAndCharacterSums:FF.2/top-weight-albanese-comparison`, `FiniteFieldsAndCharacterSums:FF.2/uniform-lang-weil-family`, `FiniteFieldsAndCharacterSums:FF.2/constant-coset-twist-count`, `FiniteFieldsAndCharacterSums:FF.2/geometric-mobius-stabilizer`.

### `SchemeAndStackFoundations:SF.4`

Part II extension: equivariant resolution of the normalized Artin–Schreier surface models of Weil I 8.8–8.9, with termination, étale/smooth-product compatibility, relative gluing and relative normal-crossings boundary; also resolution of projective normal surfaces for Ghorpade–Lachaud 10.9/11.7. No general resolution in positive-characteristic dimensions≥3 is requested or assumed.

New consumers: `FiniteFieldsAndCharacterSums:FF.2/relative-artin-schreier-compactification`, `FiniteFieldsAndCharacterSums:FF.2/bombieri-sperber-albanese-expansion`.

### `SchemeAndStackFoundations:SF.3`

Part II extension of the smooth-curve contract: normalization genus of a possibly singular integral projective degree-d curve is at most (d−1)(d−2)/2 via generic birational plane projection and arithmetic-genus comparison. The smooth plane-curve genus formula alone does not suffice.

New consumers: `FiniteFieldsAndCharacterSums:FF.2/albanese-linear-section-bound`.

### `EtaleDualityAndPerverseSheaves:EDC.0`

Actual constructible E-adic derived categories and their cohomology sheaves, on scheme étale sites, with support and coefficient-extension conventions. These are the carriers of L_ψ, Rπ!, the universal family and pullback isomorphisms; no private Prop-valued carrier substitutes are planned.

New consumers: `FiniteFieldsAndCharacterSums:FF.2/polynomial-family-local-acyclicity`, `FiniteFieldsAndCharacterSums:FF.2/hyper-kloosterman-sheaf`, `FiniteFieldsAndCharacterSums:FF.2/geometric-mobius-stabilizer`.

### `EtaleDualityAndPerverseSheaves:EDC.2`

Poincaré duality and the Frobenius-equivariant H²_c=geometric-coinvariants(−1) formula on smooth affine curves; clean extension from vanishing inertia and compatibility with deck-character decomposition; Gysin and duality for the normal-surface Albanese comparison. Continue the one existing parent GOS request: for C/k smooth projective connected of genus g, U=C−S, F lisse E_λ with ℓ≠char k, χ_c(U,F)=rk(F)(2−2g−|S|)−Σ Sw_s(F). Register its single Euler-characteristic supplier after EDC.2, as EtaleDualityAndPerverseSheaves Part II: CurveEulerCharacteristic, coordinated with PAPER-DELIGNE-74 route 6. Prove finite-torsion/lattice/inverse-limit/coefficient-extension passages; Raynaud Part I alone is not yet an E_λ-adic proof.

New consumers: `FiniteFieldsAndCharacterSums:FF.2/polynomial-family-cohomology`, `FiniteFieldsAndCharacterSums:FF.2/polynomial-boundary-clean-duality`, `FiniteFieldsAndCharacterSums:FF.2/etale-algebra-gauss-cohomology`, `FiniteFieldsAndCharacterSums:FF.2/hyper-kloosterman-fiber-cohomology`, `FiniteFieldsAndCharacterSums:FF.2/hyper-kloosterman-local-monodromy`, `FiniteFieldsAndCharacterSums:FF.2/smooth-affine-betti-bound`, `FiniteFieldsAndCharacterSums:FF.2/arbitrary-affine-betti-bound`, `FiniteFieldsAndCharacterSums:FF.2/bombieri-sperber-albanese-expansion`, `FiniteFieldsAndCharacterSums:FF.2/trace-correlation-main-term`.

### `EtaleDualityAndPerverseSheaves:EDC.4`

Part II extension: for smooth connected affine V⊂A^N of dimension n≥2, a dense open of affine hyperplanes gives smooth connected V∩H with H^i(V,Q_ℓ)→H^i(V∩H,Q_ℓ) isomorphism for i≤n−2 and injection for i=n−1. EDC.4 presently exports projective smooth weak Lefschetz and smooth-center blowup, not this affine theorem.

New consumers: `FiniteFieldsAndCharacterSums:FF.2/smooth-affine-betti-bound`.

### `LefschetzPencilsAndVanishingCycles:LPV.0`

Part II general-base extension: local acyclicity of a constructible complex pulled back from a fixed étale local product over any finite-type coefficient base, and proper pushforward then lissity with base change, as SGA 4½ [Th. finitude] 2.16/A.2 used by Weil II 3.7.3. Also coordinate the proposed GeneralBasesFourier extension: compare compactified global Rpr₂!(pr₁*K⊗L_ψ(xy))[1] nearby/vanishing cycles with the local R¹Φ kernels π/π′, π′/π and 1/(ππ′), including finite singularities and infinity. Fix geometric Frobenius, shift [1], inversion x↦−x and twist (−1), and Laumon 2.4.3.3’s exclusions of geometrically constant subquotients in local duality. GeneralBasesFourier is a proposal, not a registered prerequisite id.

New consumers: `FiniteFieldsAndCharacterSums:FF.2/polynomial-family-local-acyclicity`, `FiniteFieldsAndCharacterSums:FF.2/polynomial-family-lissity`.

### `ArithmeticGaloisRepresentations:R01.3`

Part II equal-characteristic extension: conductors of continuous ℓ-adic representations of geometric complete DVRs k̄((t)), ℓ≠p, using finite wild inertia and break decomposition; integrality/additivity and the lower/upper finite-image conductor relation. Include Sw(V⊗W)≤rk(W)Sw(V)+rk(V)Sw(W), tame unipotent invariants, and twisting by a strictly larger rank-one break. R01.3’s arithmetic wording and finite-residue-field LocalFieldsRamification do not already export this geometric contract. FF.2 proves its rank-one Artin–Schreier break, not a second general conductor definition.

New consumers: `FiniteFieldsAndCharacterSums:FF.2/geometric-artin-schreier-break`, `FiniteFieldsAndCharacterSums:FF.2/hyper-kloosterman-fiber-cohomology`, `FiniteFieldsAndCharacterSums:FF.2/hyper-kloosterman-local-monodromy`, `FiniteFieldsAndCharacterSums:FF.2/trace-correlation-main-term`, `FiniteFieldsAndCharacterSums:FF.2/mobius-autocorrelation-bound`.

### `DeligneWeightsAndPurity:DWP.5`

Weil II 1.8.12: weights of a mixed lisse sheaf are constant on a connected normal parameter scheme, for a fixed embedding, with a separate all-conjugate application for algebraic sheaves. This family-weight constancy is additional to generic local-weight terminology.

New consumers: `FiniteFieldsAndCharacterSums:FF.2/polynomial-family-cohomology`.

### `DeligneWeightsAndPurity:DWP.7`

The actual sharp direct-image bounds: H^i_c of a weight-zero algebraic sheaf has weights≤i, and ordinary cohomology on smooth varieties has the dual lower bounds. State both fixed-embedding ι versions and algebraic all-conjugate versions; purity on the clean image follows from the two bounds. Do not identify these with a numerical assertion about an arbitrary trace function.

New consumers: `FiniteFieldsAndCharacterSums:FF.2/polynomial-family-cohomology`, `FiniteFieldsAndCharacterSums:FF.2/hyper-kloosterman-fiber-cohomology`, `FiniteFieldsAndCharacterSums:FF.2/bombieri-sperber-albanese-expansion`, `FiniteFieldsAndCharacterSums:FF.2/top-weight-albanese-comparison`, `FiniteFieldsAndCharacterSums:FF.2/trace-correlation-main-term`, `FiniteFieldsAndCharacterSums:FF.2/isotypic-quasi-orthogonality`.

### `DeligneWeightsAndPurity:DWP.8`

Geometric semisimplicity of pure lisse sheaves, weight filtration/quotients and generalized Frobenius eigenvalue conventions. Arithmetic semisimplicity is not asserted; traces of powers remain valid with Jordan blocks.

New consumers: `FiniteFieldsAndCharacterSums:FF.2/top-weight-albanese-comparison`, `FiniteFieldsAndCharacterSums:FF.2/isotypic-quasi-orthogonality`.

### `DeligneWeightsAndPurity:DWP.1`

Weil weight-one bounds for the characteristic roots of Frobenius on an abelian variety, and compatibility with its Tate-module Frobenius convention and isogeny invariance, used for Alb_w spectra.

New consumers: `FiniteFieldsAndCharacterSums:FF.2/top-weight-albanese-comparison`.

### `AbelianSchemesAndArithmeticModuli:A2`

Part II extension: the rational-map universal Albanese–Weil variety of a general projective integral variety, functoriality under rational maps and purely inseparable isogeny invariance; normal-projective Picard/Tate comparison and generic-linear-section maps of Ghorpade–Lachaud 9.4/9.6. A2’s existing abelian-scheme dual/Picard functor is imported as the foundation but is not a general singular-variety Albanese. Distinguish Alb_w from Alb_s and Pic_w from Pic_s.

New consumers: `FiniteFieldsAndCharacterSums:FF.2/albanese-linear-section-bound`, `FiniteFieldsAndCharacterSums:FF.2/bombieri-sperber-albanese-expansion`, `FiniteFieldsAndCharacterSums:FF.2/top-weight-albanese-comparison`.

### `PadicDifferentialEquationsAndRigidCohomology:RD.6`

Part II extension: the Adolphson–Sperber Euler characteristic degree bound |χ_c(V,Q_ℓ)|≤2^r(r+1+rδ)^N for a closed affine V⊂A^N defined by r equations of degree≤δ, including singular/nonreduced V, with rigid/exponential-sum degree computation and comparison to ℓ-adic Euler characteristic. RD.6 presently plans traces/Fourier/weights, not this explicit Newton-polytope degree theorem. Its complete p-adic proof is not claimed decomposed here.

New consumers: `FiniteFieldsAndCharacterSums:FF.2/smooth-affine-betti-bound`.

### `FunctionFieldArithmetic:FA.5`

The finite-cover constant-field quotient and arithmetic Frobenius coset convention, G/H≅Gal(F_{q^m}/F_q), plus curve Chebotarev with genus/conductor-controlled errors. FF.2 extends the variety twist application to this convention and imports the one-variable theorem.

New consumers: `FiniteFieldsAndCharacterSums:FF.2/constant-coset-twist-count`, `FiniteFieldsAndCharacterSums:FF.2/constant-field-coset-chebotarev`.

### `WeilConjectures:WC.5:power-sum-converse`

Import the finite-spectrum power-sum estimate recorded in the parent; extend its proof explicitly to a finite signed sum Σc_jλ_j^r, c_j∈ℤ, by grouping equal roots and using exponential-sequence independence. If it is O(B^r) for every r, all nonzero coefficients on roots of modulus>B vanish. Used with B=q^(n−1) and candidate roots of modulus q^(n−1/2).

New consumers: `FiniteFieldsAndCharacterSums:FF.2/top-weight-albanese-comparison`.

### `tauceti:TauCetiRoadmap/AlgebraicCurves#layer-8-constant-field-extensions-galois-ramification-and-inseparability-`

Import the existing arbitrary-residue lower ramification/completion bridge as its document states. Do not import its explicitly excluded upper-numbering theorem for infinite residue fields. FF.2’s direct cyclic calculation and the separate AGR conductor extension supply that missing geometric case.

New consumers: `FiniteFieldsAndCharacterSums:FF.2/geometric-artin-schreier-break`.

## Target inventory and source routing

### All 88 accepted parent FF.2 declarations



**providedBy:** `FiniteFieldsAndCharacterSums:FF.2/additive-companion-sum`, `FiniteFieldsAndCharacterSums:FF.2/multiplicative-companion-sum`, `FiniteFieldsAndCharacterSums:FF.2/monic-polynomials-of-degree`, `FiniteFieldsAndCharacterSums:FF.2/monic-l-series`, `FiniteFieldsAndCharacterSums:FF.2/monic-l-series-log-derivative`, `FiniteFieldsAndCharacterSums:FF.2/root-sum-additive-character`, `FiniteFieldsAndCharacterSums:FF.2/root-sum-multiplicative-character`, `FiniteFieldsAndCharacterSums:FF.2/additive-l-function`, `FiniteFieldsAndCharacterSums:FF.2/multiplicative-l-function`, `FiniteFieldsAndCharacterSums:FF.2/root-sum-additive-top-coefficients`, `FiniteFieldsAndCharacterSums:FF.2/additive-l-function-is-polynomial`, `FiniteFieldsAndCharacterSums:FF.2/root-sum-multiplicative-periodicity`, `FiniteFieldsAndCharacterSums:FF.2/multiplicative-l-function-is-polynomial`, `FiniteFieldsAndCharacterSums:FF.2/l-function-reciprocal-roots`, `FiniteFieldsAndCharacterSums:FF.2/primitive-ring-gauss-sum-norm`, `FiniteFieldsAndCharacterSums:FF.2/multiplicative-l-function-leading-coefficient`, `FiniteFieldsAndCharacterSums:FF.2/multiplicative-l-function-functional-equation`, `FiniteFieldsAndCharacterSums:FF.2/mixed-l-function-is-polynomial`, `FiniteFieldsAndCharacterSums:FF.2/trace-kernel-artin-schreier`, `FiniteFieldsAndCharacterSums:FF.2/artin-schreier-point-count-average`, `FiniteFieldsAndCharacterSums:FF.2/kummer-point-count-average`, `FiniteFieldsAndCharacterSums:FF.2/stepanov-curve-ring`, `FiniteFieldsAndCharacterSums:FF.2/pole-degree`, `FiniteFieldsAndCharacterSums:FF.2/coprime-semigroup-representation`, `FiniteFieldsAndCharacterSums:FF.2/pole-degree-mul`, `FiniteFieldsAndCharacterSums:FF.2/riemann-roch-space-dimension`, `FiniteFieldsAndCharacterSums:FF.2/stepanov-norm`, `FiniteFieldsAndCharacterSums:FF.2/stepanov-zero-count`, `FiniteFieldsAndCharacterSums:FF.2/auxiliary-function-uniqueness`, `FiniteFieldsAndCharacterSums:FF.2/auxiliary-function-vanishing`, `FiniteFieldsAndCharacterSums:FF.2/auxiliary-function-existence`, `FiniteFieldsAndCharacterSums:FF.2/stepanov-upper-bound`, `FiniteFieldsAndCharacterSums:FF.2/upper-to-lower-bound-kummer`, `FiniteFieldsAndCharacterSums:FF.2/upper-to-lower-bound-artin-schreier`, `FiniteFieldsAndCharacterSums:FF.2/stepanov-bound-kummer-curve`, `FiniteFieldsAndCharacterSums:FF.2/stepanov-bound-artin-schreier-curve`, `FiniteFieldsAndCharacterSums:FF.2/additive-l-function-root-bound`, `FiniteFieldsAndCharacterSums:FF.2/multiplicative-l-function-root-bound-coprime`, `FiniteFieldsAndCharacterSums:FF.2/weil-bound-additive`, `FiniteFieldsAndCharacterSums:FF.2/weil-bound-multiplicative-coprime-degree`, `FiniteFieldsAndCharacterSums:FF.2/artin-schreier-reduced-form`, `FiniteFieldsAndCharacterSums:FF.2/artin-schreier-invariance`, `FiniteFieldsAndCharacterSums:FF.2/artin-schreier-trivial-sum`, `FiniteFieldsAndCharacterSums:FF.2/weil-bound-additive-reduced`, `FiniteFieldsAndCharacterSums:FF.2/multiplicative-perfect-power-sum`, `FiniteFieldsAndCharacterSums:FF.2/artin-schreier-function-field`, `FiniteFieldsAndCharacterSums:FF.2/artin-schreier-curve-point-count`, `FiniteFieldsAndCharacterSums:FF.2/artin-schreier-zeta-factorization`, `FiniteFieldsAndCharacterSums:FF.2/additive-l-function-purity`, `FiniteFieldsAndCharacterSums:FF.2/kummer-function-field`, `FiniteFieldsAndCharacterSums:FF.2/kummer-curve-point-count`, `FiniteFieldsAndCharacterSums:FF.2/kummer-zeta-factorization`, `FiniteFieldsAndCharacterSums:FF.2/multiplicative-l-function-purity`, `FiniteFieldsAndCharacterSums:FF.2/artin-schreier-sheaf`, `FiniteFieldsAndCharacterSums:FF.2/kummer-sheaf`, `FiniteFieldsAndCharacterSums:FF.2/character-sheaf-trace-formula`, `FiniteFieldsAndCharacterSums:FF.2/homotopy-invariance-of-endomorphism-action`, `FiniteFieldsAndCharacterSums:FF.2/character-sheaf-cohomology-vanishes`, `FiniteFieldsAndCharacterSums:FF.2/translation-cancellation`, `FiniteFieldsAndCharacterSums:FF.2/trace-function`, `FiniteFieldsAndCharacterSums:FF.2/lisse-sheaf-extremal-cohomology-on-curve`, `FiniteFieldsAndCharacterSums:FF.2/modified-pole-order`, `FiniteFieldsAndCharacterSums:FF.2/swan-conductor-of-artin-schreier-sheaf`, `FiniteFieldsAndCharacterSums:FF.2/h1c-conductor-bound`, `FiniteFieldsAndCharacterSums:FF.2/deligne-bound-for-trace-functions`, `FiniteFieldsAndCharacterSums:FF.2/deligne-estimate-for-character-sums`, `FiniteFieldsAndCharacterSums:FF.2/affine-concentration-criterion`, `FiniteFieldsAndCharacterSums:FF.2/rank-one-sheaf-l-function`, `FiniteFieldsAndCharacterSums:FF.2/rank-one-sheaf-root-bound`, `FiniteFieldsAndCharacterSums:FF.2/weil-bound-multiplicative`, `FiniteFieldsAndCharacterSums:FF.2/weil-bound-mixed`, `FiniteFieldsAndCharacterSums:FF.2/artin-schreier-sum-on-curve-bound`, `FiniteFieldsAndCharacterSums:FF.2/involution-eigenvalue-pairing`, `FiniteFieldsAndCharacterSums:FF.2/kloosterman-sum`, `FiniteFieldsAndCharacterSums:FF.2/kloosterman-l-function`, `FiniteFieldsAndCharacterSums:FF.2/kloosterman-bound`, `FiniteFieldsAndCharacterSums:FF.2/gauss-sum-frobenius-eigenvalue`, `FiniteFieldsAndCharacterSums:FF.2/hypersurface-through-all-rational-points`, `FiniteFieldsAndCharacterSums:FF.2/elementary-n-variable-bound`, `FiniteFieldsAndCharacterSums:FF.2/deligne-cohomology-of-polynomial-sheaf`, `FiniteFieldsAndCharacterSums:FF.2/deligne-duality-for-polynomial-sheaf`, `FiniteFieldsAndCharacterSums:FF.2/deligne-n-variable-bound`, `FiniteFieldsAndCharacterSums:FF.2/fourier-deligne-transform`, `FiniteFieldsAndCharacterSums:FF.2/fourier-deligne-inversion`, `FiniteFieldsAndCharacterSums:FF.2/fourier-input-for-one-modulus`, `FiniteFieldsAndCharacterSums:FF.2/lang-weil-estimate`, `FiniteFieldsAndCharacterSums:FF.2/uniform-lang-weil-estimate`, `FiniteFieldsAndCharacterSums:FF.2/dimension-from-point-counts`, `FiniteFieldsAndCharacterSums:FF.2/geometric-chebotarev`.

**accounting:** Imported with their original scopes and gaps. This part changes none of their ids or definitions; squarefree parent modulus declarations remain squarefree..

### Stage polynomial/rational additive, multiplicative, mixed and Kloosterman bounds



**providedBy:** `FiniteFieldsAndCharacterSums:FF.2/weil-bound-additive`, `FiniteFieldsAndCharacterSums:FF.2/weil-bound-additive-reduced`, `FiniteFieldsAndCharacterSums:FF.2/weil-bound-multiplicative`, `FiniteFieldsAndCharacterSums:FF.2/weil-bound-mixed`, `FiniteFieldsAndCharacterSums:FF.2/artin-schreier-sum-on-curve-bound`, `FiniteFieldsAndCharacterSums:FF.2/kloosterman-bound`.

**accounting:** Parent imports retain nontriviality, modified poles, c·g^ord(χ) degeneracy and independent elementary one-variable routes..

### Explicit curve constants and local Swan computation



**providedBy:** `EtaleDualityAndPerverseSheaves:EDC.2`, `ArithmeticGaloisRepresentations:R01.3`, `FiniteFieldsAndCharacterSums:FF.2/geometric-artin-schreier-break`.

**accounting:** One GOS owner and geometric conductor request; new direct break proof supplies the rank-one input, not a general duplicate GOS theorem..

### Several-variable square-root bound and its family mechanism



**providedBy:** `FiniteFieldsAndCharacterSums:FF.2/deligne-n-variable-bound`, `FiniteFieldsAndCharacterSums:FF.2/universal-smooth-leading-polynomial-family`, `FiniteFieldsAndCharacterSums:FF.2/polynomial-family-local-acyclicity`, `FiniteFieldsAndCharacterSums:FF.2/polynomial-family-lissity`, `FiniteFieldsAndCharacterSums:FF.2/polynomial-family-cohomology`, `FiniteFieldsAndCharacterSums:FF.2/polynomial-boundary-clean-duality`.

**accounting:** All 19 Weil I FF.2 application routes, the original twentieth GOS item at its one shared supplier, both local conductor items and both Weil II family routes are explicitly mapped. Historical compactification and the alternative locally acyclic proof remain separate..

### Primitive characters for non-squarefree moduli



**providedBy:** `FiniteFieldsAndCharacterSums:FF.2/primitive-multiplicative-ring-character`, `FiniteFieldsAndCharacterSums:FF.2/primitive-finite-ring-gauss-norm`, `FiniteFieldsAndCharacterSums:FF.2/polynomial-quotient-frobenius-pairing`, `FiniteFieldsAndCharacterSums:FF.2/primitive-modulus-functional-equation`.

**accounting:** Annihilator and Parseval proof removes the reducedness guard without asserting the even-character functional equation..

### Uniform Lang–Weil and HW-16 bounded families



**providedBy:** `FiniteFieldsAndCharacterSums:FF.2/uniform-lang-weil-estimate`, `FiniteFieldsAndCharacterSums:FF.2/smooth-affine-betti-bound`, `FiniteFieldsAndCharacterSums:FF.2/arbitrary-affine-betti-bound`, `FiniteFieldsAndCharacterSums:FF.2/explicit-projective-betti-bound`, `FiniteFieldsAndCharacterSums:FF.2/albanese-linear-section-bound`, `FiniteFieldsAndCharacterSums:FF.2/bombieri-sperber-albanese-expansion`, `FiniteFieldsAndCharacterSums:FF.2/top-weight-albanese-comparison`, `FiniteFieldsAndCharacterSums:FF.2/uniform-lang-weil-family`.

**accounting:** Parent numerical theorem imported; all missing key proof inputs accounted as new application nodes or precise supplier extension gaps..

### Geometric Chebotarev with nontrivial constant field



**providedBy:** `FiniteFieldsAndCharacterSums:FF.2/geometric-chebotarev`, `FiniteFieldsAndCharacterSums:FF.2/constant-coset-twist-count`, `FiniteFieldsAndCharacterSums:FF.2/constant-field-coset-chebotarev`.

**accounting:** Coset density uses |H|, and the exact count sums all component twists separately..

### Sommes trig. §4 cohomological Gauss input and §7 hyper-Kloosterman family



**providedBy:** `FiniteFieldsAndCharacterSums:FF.2/etale-algebra-gauss-cohomology`, `FiniteFieldsAndCharacterSums:FF.2/hyper-kloosterman-sum`, `FiniteFieldsAndCharacterSums:FF.2/hyper-kloosterman-sheaf`, `FiniteFieldsAndCharacterSums:FF.2/hyper-kloosterman-fiber-cohomology`, `FiniteFieldsAndCharacterSums:FF.2/hyper-kloosterman-local-monodromy`, `FiniteFieldsAndCharacterSums:FF.2/hyper-kloosterman-bound`.

**accounting:** The Gauss clean extension, simultaneous induction, zero fiber, local monodromy and analytic normalization are explicit. Sommes trig. §§5–6 general Hecke-character theory is outside FF.2 targets; its cyclotomic ideal content is the parent FF.1 direction, not replanned here..

### FKMS §5 and §7 correlations



**providedBy:** `FiniteFieldsAndCharacterSums:FF.2/trace-correlation-main-term`, `FiniteFieldsAndCharacterSums:FF.2/isotypic-quasi-orthogonality`, `FiniteFieldsAndCharacterSums:FF.2/geometric-mobius-stabilizer`, `FiniteFieldsAndCharacterSums:FF.2/mobius-autocorrelation-bound`.

**accounting:** Full coinvariant main term, purity and geometric isotypicity; automorphism classification/representability is not needed for the requested cancellation criterion..

### Global/local Fourier and character-sheaf ownership



**providedBy:** `FiniteFieldsAndCharacterSums:FF.2/artin-schreier-sheaf`, `FiniteFieldsAndCharacterSums:FF.2/fourier-deligne-transform`, `LefschetzPencilsAndVanishingCycles:LPV.0`.

**accounting:** Accepted global owners imported. Local stationary phase and generalized coefficient API have an explicit request/gap; the proposed Part II is never used as a registered supplier id..

### Suggested Lean on actual baseline carriers



**providedBy:** `mathlib:MulChar`, `mathlib:AdjoinRoot`, `mathlib:AddChar`, `mathlib:gaussSum`.

**accounting:** Representable signatures and tests are prototyped. Missing geometric signatures have a complete name ledger and a carrier gap, not fake types or logical stand-ins..

The source routes below preserve accepted suppliers and identify proposed corrections without editing review gates. Rejected Bright–Newton and Harpaz–Wittenberg route records require maintainer action; this pass supplies their FF.2 mathematical endpoint but does not reinterpret a rejection as acceptance. The EXT-08 integration discrepancy is likewise an upstream note.

| Routed item | Supplying declarations | Qualification |
| --- | --- | --- |
| `PAPER-DELIGNE-74/s8-8.4.1-normalize-character` | `FiniteFieldsAndCharacterSums:FF.1/additive-characters-are-shifts` | Applications are planned at target level; supplier-dependent passages retain the named gaps. |
| `PAPER-DELIGNE-74/s8-artin-schreier-cover` | `FiniteFieldsAndCharacterSums:FF.2/artin-schreier-sheaf` | Applications are planned at target level; supplier-dependent passages retain the named gaps. |
| `PAPER-DELIGNE-74/s8-AS-frobenius-on-fibre` | `FiniteFieldsAndCharacterSums:FF.2/character-sheaf-trace-formula` | Applications are planned at target level; supplier-dependent passages retain the named gaps. |
| `PAPER-DELIGNE-74/s8-AS-sheaves-Fj` | `FiniteFieldsAndCharacterSums:FF.2/artin-schreier-sheaf` | Applications are planned at target level; supplier-dependent passages retain the named gaps. |
| `PAPER-DELIGNE-74/s8-8.4.3-decomposition` | `FiniteFieldsAndCharacterSums:FF.2/artin-schreier-sheaf`, `SchemeAndStackFoundations:SF.2` | Applications are planned at target level; supplier-dependent passages retain the named gaps. |
| `PAPER-DELIGNE-74/s8-8.5-i-concentration` | `FiniteFieldsAndCharacterSums:FF.2/deligne-cohomology-of-polynomial-sheaf`, `FiniteFieldsAndCharacterSums:FF.2/polynomial-family-cohomology` | Applications are planned at target level; supplier-dependent passages retain the named gaps. |
| `PAPER-DELIGNE-74/s8-8.5-ii-duality` | `FiniteFieldsAndCharacterSums:FF.2/deligne-duality-for-polynomial-sheaf`, `FiniteFieldsAndCharacterSums:FF.2/polynomial-boundary-clean-duality` | Applications are planned at target level; supplier-dependent passages retain the named gaps. |
| `PAPER-DELIGNE-74/s8-8.5-iii-compactification` | `FiniteFieldsAndCharacterSums:FF.2/relative-artin-schreier-compactification` | Applications are planned at target level; supplier-dependent passages retain the named gaps. |
| `PAPER-DELIGNE-74/s8-8.4-from-8.5` | `FiniteFieldsAndCharacterSums:FF.2/deligne-n-variable-bound` | Applications are planned at target level; supplier-dependent passages retain the named gaps. |
| `PAPER-DELIGNE-74/s8-8.6-compactification-setup` | `FiniteFieldsAndCharacterSums:FF.2/relative-artin-schreier-compactification` | Applications are planned at target level; supplier-dependent passages retain the named gaps. |
| `PAPER-DELIGNE-74/s8-8.7-Y0-smooth-off-H0` | `FiniteFieldsAndCharacterSums:FF.2/polynomial-boundary-local-models` | Applications are planned at target level; supplier-dependent passages retain the named gaps. |
| `PAPER-DELIGNE-74/s8-8.8-local-structure-over-H0` | `FiniteFieldsAndCharacterSums:FF.2/polynomial-boundary-local-models` | Applications are planned at target level; supplier-dependent passages retain the named gaps. |
| `PAPER-DELIGNE-74/s8-8.9-zariski-resolution` | `FiniteFieldsAndCharacterSums:FF.2/relative-artin-schreier-compactification`, `SchemeAndStackFoundations:SF.4` | Applications are planned at target level; supplier-dependent passages retain the named gaps. |
| `PAPER-DELIGNE-74/s8-8.10-relative-compactification` | `FiniteFieldsAndCharacterSums:FF.2/relative-artin-schreier-compactification` | Applications are planned at target level; supplier-dependent passages retain the named gaps. |
| `PAPER-DELIGNE-74/s8-8.10-local-constancy` | `FiniteFieldsAndCharacterSums:FF.2/polynomial-family-lissity` | Applications are planned at target level; supplier-dependent passages retain the named gaps. |
| `PAPER-DELIGNE-74/s8-8.10-kunneth-separation` | `FiniteFieldsAndCharacterSums:FF.2/polynomial-family-cohomology` | Applications are planned at target level; supplier-dependent passages retain the named gaps. |
| `PAPER-DELIGNE-74/s8-8.11-n1-vanishing` | `FiniteFieldsAndCharacterSums:FF.2/lisse-sheaf-extremal-cohomology-on-curve`, `FiniteFieldsAndCharacterSums:FF.2/polynomial-family-cohomology` | Applications are planned at target level; supplier-dependent passages retain the named gaps. |
| `PAPER-DELIGNE-74/s8-8.11-duality-n1` | `FiniteFieldsAndCharacterSums:FF.2/polynomial-boundary-clean-duality`, `EtaleDualityAndPerverseSheaves:EDC.2` | Applications are planned at target level; supplier-dependent passages retain the named gaps. |
| `PAPER-DELIGNE-74/s8-8.11-euler-characteristic` | `FiniteFieldsAndCharacterSums:FF.2/polynomial-family-cohomology`, `EtaleDualityAndPerverseSheaves:EDC.2`, `FiniteFieldsAndCharacterSums:FF.2/geometric-artin-schreier-break` | Applications are planned at target level; supplier-dependent passages retain the named gaps. |
| `PAPER-DELIGNE-80/s3-3.7.2-universal-family` | `FiniteFieldsAndCharacterSums:FF.2/universal-smooth-leading-polynomial-family` | Imports accepted parent targets where applicable; the bounded-family theorem is a distinct application, not a redefinition of these objects. |
| `PAPER-DELIGNE-80/s3-3.7.3-lissity` | `FiniteFieldsAndCharacterSums:FF.2/polynomial-family-local-acyclicity`, `FiniteFieldsAndCharacterSums:FF.2/polynomial-family-lissity` | Imports accepted parent targets where applicable; the bounded-family theorem is a distinct application, not a redefinition of these objects. |
| `PAPER-BROWNING-SAWIN-20/schreier` | `FiniteFieldsAndCharacterSums:FF.2/artin-schreier-sheaf` | Imports accepted parent targets where applicable; the bounded-family theorem is a distinct application, not a redefinition of these objects. |
| `PAPER-BROWNING-SAWIN-20/translationcancel` | `FiniteFieldsAndCharacterSums:FF.2/translation-cancellation` | Imports accepted parent targets where applicable; the bounded-family theorem is a distinct application, not a redefinition of these objects. |
| `PAPER-BROWNING-SAWIN-20/extensiondimension` | `FiniteFieldsAndCharacterSums:FF.2/dimension-from-point-counts` | Imports accepted parent targets where applicable; the bounded-family theorem is a distinct application, not a redefinition of these objects. |
| `PAPER-BROWNING-SAWIN-20/langweil` | `FiniteFieldsAndCharacterSums:FF.2/lang-weil-estimate` | Imports accepted parent targets where applicable; the bounded-family theorem is a distinct application, not a redefinition of these objects. |
| `PAPER-BROWNING-SAWIN-20/fourierdeligne` | `FiniteFieldsAndCharacterSums:FF.2/fourier-deligne-transform` | Imports accepted parent targets where applicable; the bounded-family theorem is a distinct application, not a redefinition of these objects. |
| `PAPER-BROWNING-SAWIN-20/fourierinput` | `FiniteFieldsAndCharacterSums:FF.2/fourier-input-for-one-modulus` | Imports accepted parent targets where applicable; the bounded-family theorem is a distinct application, not a redefinition of these objects. |
| `PAPER-DELIGNE-74/s8-GOS-formula` | `EtaleDualityAndPerverseSheaves:EDC.2` | The twentieth original FF route item is the one shared Part II supplier, now PAPER-DELIGNE-74 route 6; its registration and E-adic proof remain gap/gos-owner. |
| `PAPER-DELIGNE-74/s8-8.12-swan-conductor` | `ArithmeticGaloisRepresentations:R01.3`, `FiniteFieldsAndCharacterSums:FF.2/geometric-artin-schreier-break` | PAPER-DELIGNE-74 route 5 is a worked conductor application. FF.2 supplies the direct cyclic calculation and imports the general conductor definition through the AGR extension request. |
| `PAPER-DELIGNE-74/s8-8.13-artin-schreier-conductor` | `ArithmeticGaloisRepresentations:R01.3`, `FiniteFieldsAndCharacterSums:FF.2/geometric-artin-schreier-break` | Artin conductor is d+1 and Swan is d for the nontrivial rank-one character. The arbitrary-residue bridge is not replaced by a finite-residue theorem. |

## Remaining proof obligations

### One geometric GOS owner still needs registration

Identifier: `FiniteFieldsAndCharacterSums:FF.2/gap/gos-owner`. The parent request and PAPER-DELIGNE-74 route 6 identify one Part II extension after EDC.2. No registered stage/node presently states the theorem. The Raynaud source read is finite torsion; its complete E_λ passage must be proved at that owner. The genus, boundary count and Swan terms remain explicit. The parent’s cohomological curve bounds remain conditional on this shared input.

New consumers: `FiniteFieldsAndCharacterSums:FF.2/polynomial-family-cohomology`, `FiniteFieldsAndCharacterSums:FF.2/hyper-kloosterman-fiber-cohomology`, `FiniteFieldsAndCharacterSums:FF.2/hyper-kloosterman-local-monodromy`, `FiniteFieldsAndCharacterSums:FF.2/trace-correlation-main-term`.

### Geometric conductor generality is an extension, not an existing export

Identifier: `FiniteFieldsAndCharacterSums:FF.2/gap/geometric-conductor`. The rank-one Artin–Schreier break is proved by the direct uniformizer calculation in this packet. The actual ℓ-adic Swan definition and tensor/break API over k̄((t)) still need AGR’s equal-characteristic extension. No unramified base-change theorem from a finite-residue-field local-fields stage is assumed.

New consumers: `FiniteFieldsAndCharacterSums:FF.2/geometric-artin-schreier-break`, `FiniteFieldsAndCharacterSums:FF.2/hyper-kloosterman-fiber-cohomology`, `FiniteFieldsAndCharacterSums:FF.2/hyper-kloosterman-local-monodromy`, `FiniteFieldsAndCharacterSums:FF.2/trace-correlation-main-term`, `FiniteFieldsAndCharacterSums:FF.2/mobius-autocorrelation-bound`.

### Relative surface-product resolution and boundary calculation

Identifier: `FiniteFieldsAndCharacterSums:FF.2/gap/surface-resolution`. Weil I 8.9/8.10 needs termination, equivariance and étale/product-compatible resolution of the specific normalized surface pair; a relative normal-crossings boundary makes ordinary and compact cohomology locally constant. Duality is checked at the clean one-variable Fermat fiber and transported through this family, rather than asserting inertia vanishing along every exceptional boundary divisor. SF.4 does not yet provide this contract. The Weil II lissity proof does not depend on this historical route.

New consumers: `FiniteFieldsAndCharacterSums:FF.2/relative-artin-schreier-compactification`, `FiniteFieldsAndCharacterSums:FF.2/polynomial-boundary-clean-duality`, `FiniteFieldsAndCharacterSums:FF.2/bombieri-sperber-albanese-expansion`.

### General-base local acyclicity and family weights

Identifier: `FiniteFieldsAndCharacterSums:FF.2/gap/general-base-acyclicity`. LPV.0’s trait contract does not provide all of Weil II 3.7.3 over the coefficient scheme. Its requested locally constant-product/proper-pushforward theorem and DWP.5’s 1.8.12 family-weight constancy must be exported with actual carriers before the relative nodes can be closed.

New consumers: `FiniteFieldsAndCharacterSums:FF.2/polynomial-family-local-acyclicity`, `FiniteFieldsAndCharacterSums:FF.2/polynomial-family-lissity`, `FiniteFieldsAndCharacterSums:FF.2/polynomial-family-cohomology`.

### Affine weak Lefschetz is outside the existing EDC.4 scope

Identifier: `FiniteFieldsAndCharacterSums:FF.2/gap/affine-lefschetz`. Katz’s smooth affine induction uses a generic affine hyperplane with isomorphism/injection in the specified ordinary-cohomology degrees. Projective smooth weak Lefschetz is a near miss. A single Part II extension at the duality/Lefschetz owner is requested.

New consumers: `FiniteFieldsAndCharacterSums:FF.2/smooth-affine-betti-bound`.

### The explicit Adolphson–Sperber Euler bound requires its p-adic proof

Identifier: `FiniteFieldsAndCharacterSums:FF.2/gap/explicit-euler-degree`. Katz supplies the target formula and the Betti-number deductions, but the full Dwork/Newton-polytope degree and ℓ-adic Euler comparison proof of |χ_c|≤2^r(r+1+rδ)^N was not decomposed. The RD.6 extension request states that exact theorem. This gap propagates through A,B and the projective constant to uniform Lang–Weil.

New consumers: `FiniteFieldsAndCharacterSums:FF.2/smooth-affine-betti-bound`, `FiniteFieldsAndCharacterSums:FF.2/explicit-projective-betti-bound`, `FiniteFieldsAndCharacterSums:FF.2/uniform-lang-weil-family`.

### Rational Albanese and singular-section genus

Identifier: `FiniteFieldsAndCharacterSums:FF.2/gap/rational-albanese`. The existing abelian-scheme A2 stage does not construct Alb_w of a general singular variety; SF.3’s smooth-plane-curve formula does not prove the normalized singular-section inequality. Their Part II contracts, together with Picard/Tate and surface comparisons, are needed to close the parent uniform Lang–Weil proof.

New consumers: `FiniteFieldsAndCharacterSums:FF.2/albanese-linear-section-bound`, `FiniteFieldsAndCharacterSums:FF.2/bombieri-sperber-albanese-expansion`, `FiniteFieldsAndCharacterSums:FF.2/top-weight-albanese-comparison`.

### Uniform pencils, projective closure and equivariant twist presentations

Identifier: `FiniteFieldsAndCharacterSums:FF.2/gap/bounded-presentations`. For the fixed-X pencil proof, bound the center, bad fibers and their cohomology uniformly using fixed embedding data. For arbitrary affine bounded equations, supply quantitative saturation/homogenization bounds rather than taking an unchecked projective closure. For Chebotarev twists, descend a finite G-stable generating linear system and its bounded boundary presentation. These are separate precise SF.0/SF.1 requested extensions.

New consumers: `FiniteFieldsAndCharacterSums:FF.2/bombieri-sperber-albanese-expansion`, `FiniteFieldsAndCharacterSums:FF.2/uniform-lang-weil-family`, `FiniteFieldsAndCharacterSums:FF.2/constant-field-coset-chebotarev`.

### Local/global Fourier comparison and coefficient scope

Identifier: `FiniteFieldsAndCharacterSums:FF.2/gap/local-global-fourier`. The global FT and L_ψ stay at their accepted parent FF.2 owner; the unregistered GeneralBasesFourier Part II owns local kernels/vanishing cycles. The LPV.0 request specifies the stationary-phase comparison and normalization. Laumon §§2.3–2.4 were read for this contract, not fully decomposed. Abe A19’s torsion/local-regular-finite-Z_ℓ coefficients exceed the parent’s E-field character sheaf: commission the shared coefficient-change API at SF.2/EDC.0 before marking those entire items supplied.

New consumers: `FiniteFieldsAndCharacterSums:FF.2/polynomial-family-local-acyclicity`, `FiniteFieldsAndCharacterSums:FF.2/hyper-kloosterman-local-monodromy`.

### Missing Lean carriers are listed, not replaced

Identifier: `FiniteFieldsAndCharacterSums:FF.2/gap/prototype-carriers`. The pinned libraries lack the actual smooth-leading open coefficient scheme with its étale sheaf category, Rf!, local conductors, Alb_w comparison objects and Möbius sheaf pullback stabilizer. Their signatures/API/tests are documented in the prototype name ledger and intentionally omitted from executable Lean under protocol §13. The two representable definitions use baseline MulChar and finite-field sum carriers; no theorem is replaced by a Prop-valued placeholder.

New consumers: `FiniteFieldsAndCharacterSums:FF.2/universal-smooth-leading-polynomial-family`, `FiniteFieldsAndCharacterSums:FF.2/hyper-kloosterman-sheaf`, `FiniteFieldsAndCharacterSums:FF.2/geometric-mobius-stabilizer`.

The suggested file's omitted geometric signatures are explicitly named in its carrier ledger. They become executable signatures only after their suppliers export the actual schemes, étale coefficient categories, derived functors, geometric inertia and rational Albanese carriers. An elaborating arithmetic prototype is not evidence of these geometric constructions. The unit-test contracts stay attached to their genuine intended objects, including their counterexamples.

## Source correction and review boundary

Meagher Appendix A, Proposition A.2, p. 201, uses the full space of sections of a line bundle on a quasi-projective scheme as a finite-dimensional representation. For A¹ and its trivial line bundle that space is k[t], so the stated finiteness argument fails. The repaired descent proof takes finitely many sections which give a chosen embedding and the finite span of their G-orbits, then descends this generating linear system. This supplies the finite invariant representation the proof needs and retains presentation bounds. The packet records this as E800. A bounded search of the publisher page and public correction records found no published correction; the observation still needs independent verification, and its novelty is not established here.

The parent's recorded corrections are imports. In particular the top-coefficient pairing uses the corrected coefficient order rather than reversing it, the functional-equation calculation includes all lower-degree representatives, and the constant-field Gauss factor retains its sign. No duplicate source-error entries are introduced for those earlier observations.

## Planets and stage structure

The new part marks six candidate planets: Universal smooth polynomial family; Lissity of exponential-sum cohomology; Hyper-Kloosterman sums; Katz’s Betti-number bound; Constant-field Chebotarev theorem; Trace-function quasi-orthogonality. These are meaningful mathematical objects or theorems, not bookkeeping checks. The parent already has six FF.2 planets, so concatenating their planet flags would exceed the layer limit. The packet's assembly proposal selects a combined six: the parent Artin–Schreier sheaf, the parent Deligne several-variable bound, the new hyper-Kloosterman sum, the new correlation/quasi-orthogonality endpoint, the parent uniform Lang–Weil estimate and the new constant-field-coset Chebotarev theorem. Promotion and any subdivision belong to assembly.

The proposed subdivision separates finite-ring and curve character sums, universal polynomial families, trace sheaves and Fourier comparison, and bounded point counts with Chebotarev. It preserves the current FF.2 identifier until a restructuring job acts. The GOS and other Part II proposals add supplier layers, rather than burying foundations inside a numerical bound.

## Baseline declarations

Only the following checked statements are baseline imports. Finite-field theorems are not credited with finite-ring generality, and elementary polynomial carriers are not credited with schemes or sheaves.

- `mathlib:AddChar`, Mathlib/Algebra/Group/AddChar.lean: An additive character into a multiplicative monoid; character values, composition and scalar shifts.
- `mathlib:AddChar.IsPrimitive`, Mathlib/NumberTheory/LegendreSymbol/AddCharacter.lean: For a commutative ring, every nonzero scalar shift is nontrivial; this is additive, not multiplicative, primitivity.
- `mathlib:AddChar.sum_mulShift`, Mathlib/NumberTheory/LegendreSymbol/AddCharacter.lean: Orthogonality of scalar shifts of a primitive additive character of a finite commutative ring.
- `mathlib:MulChar`, Mathlib/NumberTheory/MulChar/Basic.lean: Multiplicative characters of commutative monoids, extended by zero on every nonunit; not merely on zero.
- `mathlib:MulChar.ofUnitHom`, Mathlib/NumberTheory/MulChar/Basic.lean: Extends a homomorphism on units to a MulChar by zero on nonunits.
- `mathlib:gaussSum`, Mathlib/NumberTheory/GaussSum.lean: The finite-ring sum of the product of multiplicative and additive characters.
- `mathlib:gaussSum_mulShift_eq`, Mathlib/NumberTheory/GaussSum.lean: A unit scalar shift multiplies the Gauss sum by the inverse multiplicative character, for finite commutative rings.
- `mathlib:star_gaussSum_eq`, Mathlib/NumberTheory/GaussSum.lean: Complex conjugation inverts both characters on any finite commutative ring.
- `mathlib:gaussSum_mul_gaussSum_eq_card`, Mathlib/NumberTheory/GaussSum.lean: Norm-product identity for a nontrivial multiplicative character and primitive additive character of a finite FIELD; no finite-ring generality.
- `mathlib:AdjoinRoot`, Mathlib/RingTheory/AdjoinRoot.lean: The actual quotient F[X]/(g), with its canonical ring and algebra maps.
- `mathlib:MvPolynomial`, Mathlib/Algebra/MvPolynomial/Basic.lean: Multivariate polynomials with their finite-support coefficient carrier.
- `mathlib:MvPolynomial.eval`, Mathlib/Algebra/MvPolynomial/Eval.lean: Evaluation in the coefficient ring; used in the universal family and sum tests.
- `mathlib:AdjoinRoot.modByMonicHom`, Mathlib/RingTheory/AdjoinRoot.lean: The canonical linear map taking a quotient class to its remainder modulo a monic polynomial; actual reduced representatives.
- `mathlib:AdjoinRoot.powerBasisAux'`, Mathlib/RingTheory/AdjoinRoot.lean: The power basis indexed by Fin g.natDegree for arbitrary monic g, including nonreduced quotients.

## Public sources and reading scope

- **Exponential sums over finite fields: elementary methods**, Emmanuel Kowalski. Lecture notes, version of September 14, 2021, the author's PDF; printed page = PDF page − 2. [Public text](https://people.math.ethz.ch/~kowalski/exponential-sums-elementary.pdf). Read 2026-10-05: Chapter 4, primitive Dirichlet characters, Proposition 4.8 and (4.11)–(4.12), Proposition 4.11 and (4.15)–(4.16), pp. 41–47; parent corrections E709/E720/E721/E723 consulted.
- **Cohomologie etale (SGA 4 1/2), expose 'Application de la formule des traces aux sommes trigonometriques' [Sommes trig.]**, Pierre Deligne. Lecture Notes in Mathematics 569, Springer 1977, pp. 168-232; scan served by the Institute for Advanced Study (publications.ias.edu, file Number32.pdf, 351 pages). This is the roadmap's source DELIGNE.. [Public text](https://publications.ias.edu/sites/default/files/Number32.pdf). Read 2026-10-05: §3.2(3.2.1), §3.5(3.5.4) and §4.3/4.11–4.12, pp. 189–191, 196–202; §§7.1–7.15, pp. 218–226: product fibers, cohomology, local monodromy and induction; page 221 inspected as an image; §§5–6 screened for scope: algebraic Hecke characters are not FF.2 target inputs.
- **La conjecture de Weil. I**, Pierre Deligne. Publications mathematiques de l'IHES 43 (1974), 273-307; Numdam scan PMIHES_1974__43__273_0. [Public text](https://www.numdam.org/item/PMIHES_1974__43__273_0.pdf). Read 2026-10-05: §8.4–8.13, pp. 302–306: trace decomposition, compactification, local models, family, Künneth and the local break.
- **La conjecture de Weil. II**, Pierre Deligne. Publications mathematiques de l'IHES 52 (1980), 137-252; Numdam scan PMIHES_1980__52__137_0. [Public text](https://www.numdam.org/item/PMIHES_1980__52__137_0.pdf). Read 2026-10-05: §3.7.2–3.7.4, pp. 215–216: universal family, local acyclicity/lissity and Fermat reduction; §1.8.10–1.8.13, pp. 177–178: weight constancy/purity on connected parameter bases.
- **Lectures on Applied l-adic Cohomology**, Etienne Fouvry, Emmanuel Kowalski, Philippe Michel, Will Sawin. arXiv:1712.03173v3 (16 April 2019), 68 pages; published in Contemporary Mathematics 740 (2019); arXiv version read. [Public text](https://arxiv.org/pdf/1712.03173v3). Read 2026-10-05: §4.3.3/Theorem 4.4, hyper-Kloosterman normalization; §5, (5.1)–(5.4) and Theorem 5.2, pp. 13–14: full Hom main term and geometric isotypicity; §6.1–6.3 Fourier conventions and §7.1, Definition 7.1/Proposition 7.2/Examples 7.3, pp. 19–20; classification screened, not planned.
- **Transformation de Fourier, constantes d'equations fonctionnelles et conjecture de Weil**, Gerard Laumon. Publications mathematiques de l'IHES 65 (1987), 131-210; Numdam scan PMIHES_1987__65__131_0. [Public text](https://www.numdam.org/item/PMIHES_1987__65__131_0.pdf). Read 2026-10-05: §1.2 pp. 140–142, global transform normalization, via parent verified citations; §2.1–2.4 pp. 150–164: geometric local conductors, local kernels and their nearby/vanishing-cycle comparison; 2.4.3.3 local-duality exclusions; proof §2.5 not fully decomposed.
- **Etale cohomology, Lefschetz theorems and number of points of singular varieties over finite fields**, Sudhir R. Ghorpade and Gilles Lachaud. arXiv:0808.2169v1 (15 August 2008), corrected version of Moscow Math. J. 2 (2002), 589-631; arXiv version read. [Public text](https://arxiv.org/pdf/0808.2169v1). Read 2026-10-05: §5 explicit Betti bound; §9.1–9.6 rational Albanese/Picard and generic sections; §10.7–10.9 highest odd weight; §11.1–11.7 uniform Lang–Weil and the Bombieri–Sperber pencil proof.
- **Sums of Betti numbers in arbitrary characteristic**, Nicholas M. Katz. Author manuscript; published Finite Fields Appl. 7 (2001), 29–44. [Public text](https://web.math.princeton.edu/~nmk/BettiSum14.pdf). Read 2026-10-05: Part I: axiomatic setup, Theorems 1–3 and their proofs, pp. 1–4; Part II read for coefficient scope; its compatible-system generalization is not a target here.
- **Sur les corps locaux à corps résiduel algébriquement clos**, Jean-Pierre Serre. Bull. Soc. Math. France 89 (1961), 105–154. [Public text](https://www.numdam.org/item/BSMF_1961__89__105_0.pdf). Read 2026-10-05: §4.4, Lemma 4′, pp. 144–145; equal-characteristic Artin–Schreier case.
- **Caractéristique d’Euler–Poincaré d’un faisceau et cohomologie des variétés abéliennes**, Michel Raynaud. Séminaire Bourbaki 1964/65, exposé 286; torsion-coefficient formulation. [Public text](https://www.numdam.org/item/SB_1964-1966__9__129_0.pdf). Read 2026-10-05: Exposé 286, Part I: Swan module and Euler characteristic theorem, pp. 129–140.
- **A simple proof of Chebotarev’s density theorem over finite fields**, Steve Meagher. Bull. Aust. Math. Soc. 98 (2018), 196–202. [Public text](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/72DECC8EB5E120B1218B4A3AC4129C62/S0004972718000448a.pdf/a-simple-proof-of-chebotarevs-density-theorem-over-finite-fields.pdf). Read 2026-10-05: Theorem 1.1 and proof, pp. 196–200; Appendix A, Proposition A.2, pp. 201–202.
- **On the degree of the L-function associated with an exponential sum**, Alan Adolphson; Steven Sperber. Compositio Math. 68 (1988), 125–159. [Public text](https://www.numdam.org/item/CM_1988__68_2_125_0.pdf). Read 2026-10-05: Introduction and §5.22–5.27; Euler-bound input only, not a decomposition of the full p-adic proof.

The packet pins the downloaded source versions by SHA-256 and records passage-level matches. Its proof contracts distinguish a source theorem, a corrected statement, a derived numerical constant and an extension beyond the source’s displayed hypotheses. Sources whose deeper proofs were not decomposed are identified in the gap ledger; they are not cited as complete prerequisite chains.
