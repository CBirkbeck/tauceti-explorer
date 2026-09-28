# Commutative algebra for deformation theory and patching — part P7

## Scope of this checkpoint

The part comprises P7–P9 and R03.1–R03.5. This partial blueprint retains the existing finite-prime-filtration input of R03.3, adds a five-node refinement of the R03.4 characteristic-zero-point argument, and adds four R03.3 nodes on catenarity and on freeness over a regular local base (Section 5a). The packet has 46 baseline references and one new object definition, the catenary predicate. The field, quotient, integral-closure and local-field constructions are reused from their existing owners. The stage coverage records retain the remaining work explicitly.

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. The five prime-filtration declarations in Sections 1–4 are in the same Mathlib module, `Mathlib/RingTheory/Ideal/AssociatedPrime/Finiteness.lean`; its inspected Git blob is `8981a4233c39016cfd51e882d7da6d90c368dec9`.

## 1. Generality and conventions

Let R be a **commutative Noetherian ring** and M a finitely generated R-module. Finite means Mathlib's `Module.Finite`, not finiteness of the underlying set. No completeness, localness, DVR, Dedekind, field or freeness hypothesis is imposed. In particular this interface applies over the arithmetic coefficient rings in expansion principles, not just the complete-local coefficient category used for deformation functors.

A finite prime filtration is a chain of actual submodules

    0 = N0 <= N1 <= ... <= Nn = M

whose successive subquotients are R-linearly equivalent to R/p for prime ideals p. The prime can vary with the step and can occur repeatedly. The filtration need not split. Its factors need not be simple: a prime ideal need not be maximal. Consequently the theorem does not imply finite length.

When N1 is contained in N2, the quotient is formed inside N2. In Mathlib that uses the submodule `N1.submoduleOf N2`, with underlying module N2. It is not a quotient of the type N2 by a submodule whose ambient type is still M. The construction retains the inclusion and the actual linear equivalence of this subquotient with R/p.

The ring may be trivial. There are then no prime ideals, every module is zero, and the filtration has no proper steps. The general theorem remains applicable; a claimed first nonzero factor would not.

## 2. The exact baseline contract

### A prime cyclic step

`Submodule.IsQuotientEquivQuotientPrime` already records two things: containment of the lower submodule in the upper, and a point of `PrimeSpectrum R` together with nonempty linear-equivalence data for the subquotient and R/p. Use this relation rather than introducing a parallel predicate.

`Submodule.isQuotientEquivQuotientPrime_iff` characterizes a step by a vector x: the larger submodule is the sum of the smaller submodule and the span of x, and the image of x in the quotient by the smaller submodule has prime annihilator. This is an explicit cyclic description, not merely a support statement.

The proof inspected in the library constructs the comparison maps. In the forward direction, it lifts the class corresponding to 1 modulo p. The natural map from the successive quotient into M/N1 is injective, so the annihilator computation transports through it. Surjectivity of the chosen cyclic generator gives the sum-with-span description. In the reverse direction, scalar multiplication by x descends through the annihilator quotient and the first isomorphism theorem identifies its range with the successive subquotient.

These details explain what is available to a consumer requiring an actual quotient map. The submodule inclusion and quotient projection are not extra future constructions; only their particular geometric application needs to be written.

### Existence of the whole filtration

`IsNoetherianRing.exists_relSeries_isQuotientEquivQuotientPrime` provides a `RelSeries` of these submodules with head bottom and last top. Its ambient parameters are precisely the commutative ring, Noetherianity and finite-module hypotheses above. The source's Stacks annotation is tag 00L0.

The pinned proof proceeds by the ascending-chain condition on submodules. Starting at zero, take a proper submodule N. The quotient M/N is nonzero and has an associated prime. Choose a vector with that prime annihilator and lift it to M. Adjoining its span strictly enlarges N and supplies the next prime cyclic step through the preceding characterization. Ascending-chain induction reaches the top. There is no uniform bound on the number of steps claimed by this argument.

A `RelSeries` of length n has n steps and n+1 vertices. Extracting the data of a step yields a containment, a prime and a nonempty linear equivalence. Choosing an equivalence when needed is harmless; no canonical filtration, canonical prime ordering or functorial choice of filtration is asserted.

### The ready-made induction principle

`IsNoetherianRing.induction_on_isQuotientEquivQuotientPrime` is the preferred consumer interface. It proves a property of every finite R-module from three hypotheses:

1. The property holds for every subsingleton module.
2. It holds for every finite module N equipped with an R-linear equivalence to R/p for a prime p.
3. In a short exact sequence of finite modules, it holds for the middle module whenever it holds for both outer modules.

The exact-sequence input is concrete: linear maps f and g, injectivity of f, surjectivity of g and `Function.Exact f g`. In particular, the hypothesis is not merely a zero composite. Surjectivity concerns the original coefficient quotient map, not any map obtained by taking global sections.

The motive is a dependent property of modules in a fixed universe, with their additive, module and finite-module instances. The prime-quotient case is formulated using a linear equivalence from N to R/p, rather than demanding that R/p itself belong to that fixed universe. Preserve this feature when applying the theorem to geometric functors.

The proof also supplies transport under arbitrary linear equivalences: use the exact sequence consisting of an equivalence followed by the zero map to a zero module. It then inducts on the supplied submodule series, transporting the lower module to its image in the next submodule and using the canonical subtype/quotient exact sequence. No separate finite-filtration induction library is required.

### An existing application

`associatedPrimes.finite` uses this exact induction. The zero case has empty associated-prime set; the prime-quotient case uses the corresponding singleton calculation and transport through a linear equivalence; the extension case uses containment in the union of the two outer associated-prime sets. This confirms that the induction is already an operational library interface, not an unimplemented declaration inferred from its name.

## 3. Contract for Fourier–Jacobi injectivity

The consumer is `AutomorphicBundles:B5/fj-injectivity-finite`. Write F(M) for its actual automorphic section module, G(M) for its actual coefficient-family module and eta_M for the constructed expansion map. This is notation for the geometric objects already owned by B5 and its suppliers, not new algebraic stand-ins.

Apply the existing induction to the property **eta_M is injective**.

**Zero case.** Tensoring the fixed coefficient sheaf with a zero module gives a zero sheaf, hence a zero section module. The expansion map with that source is injective. For a subsingleton carrier the same statement follows through its unique zero-module identification.

**Prime-quotient case.** B5's cyclic-coefficient theorem supplies injectivity for R/p only after its geometric hypotheses have been proved: component detection and the formal-chart comparison with residue coefficients. For a module N linearly equivalent to R/p, functoriality sends the equivalence and its inverse to inverse maps on F and G. Naturality of eta then transports injectivity. This does not assert that forming global sections commutes with an arbitrary tensor product or quotient.

**Extension case.** Start with an actual short exact coefficient sequence N1 -> N2 -> N3. B5 must construct the two naturality squares and establish the left-exact section row and injectivity of the first coefficient-family map. A section in F(N2) with zero expansion has zero image in F(N3), by injectivity at N3. Exactness of the F row lifts it to F(N1). Naturality and injectivity of G(N1) -> G(N2) make the lift's expansion zero; injectivity at N1 kills the lift. This is precisely the nonsplit extension step already separated in the B5 packet.

The induction concludes finite-coefficient injectivity. It contributes no geometric component theorem, formal-function theorem, invariant-exactness theorem or commutation of products with filtered colimits. Those obligations remain in B5. The further passage to arbitrary coefficients still needs the section-colimit comparison and injectivity of coefficient-family inclusions, not a colimit/product interchange.

**Dependency correction.** This argument needs the pinned Mathlib induction theorem directly. It does not wait for all of R03.3, for Schlessinger's criterion or for the complete-local coefficient category. The obsolete generic request has been removed from B5 in merged PR #3093, with its direct baseline citations and proof steps updated. Genuine unrelated uses of R03.3 are unaffected.

## 4. Regression and non-example requirements

The suggested file imports the existing module and gives direct reuse examples. It introduces no new prime-filtration definition.

**The zero module.** Over Z, the module of functions from an empty finite type has bottom equal to top. The existential filtration theorem applies and its induction starts in the subsingleton case.

**Repeated factors and a nonsplit extension.** For M = Z/4 as a Z-module, the submodule generated by 2 lies strictly between zero and M. Both successive quotients are Z/2. The projection Z/4 -> Z/2 has no additive section: the image of 1 under a map from Z/2 must be annihilated by 2, so is 0 or 2, both reducing to zero. Thus an implementation replacing the extension case by a direct-sum case would fail.

**Several primes.** For Z/12 use the chain of subgroups generated successively by 0, 6, 3 and 1. The quotient orders are 2, 2 and 3. Prime occurrence is not restricted to a set of distinct primes or to a single residue characteristic.

**Finite generation is not finite length.** Z as a module over itself has the one-step prime filtration with p = 0. It is not a finite set and not a finite-length Z-module. Do not require maximal ideals in place of primes. The direct invocation of the existing theorem on Z is a regression against those extra hypotheses.

**The trivial ring.** For R = Z/1 and a finite free R-module, the theorem reduces to the zero-module case. This checks that neither a nonzero ring nor an arbitrary prime choice is silently assumed before the zero case.

The finite abelian-group checks are elementary regressions, not a proof of the general theorem or a replacement for Lean elaboration. The general result is reused from the inspected pinned library.

## 5. Characteristic-zero points of finite local algebras

This section refines the integrated node
`R03.4/characteristic-zero-points-from-finiteness-and-dimension` without replacing its identifier. The four intermediate nodes make its algebraic proof explicit. Its arithmetic dimension input, local-field interpretation and framed-lifting extension are distinguished rather than hidden in one assertion.

### Conventions and the exact target

Let O be a discrete valuation ring, pi a uniformizer, and K its fraction field. For the characteristic-zero conclusion assume that K has characteristic zero. Fix an algebraically closed extension Omega/K, with the compatible O action. Let A be a commutative local O-algebra which is **finite as an O-module**, with Krull dimension at least one.

The algebraic target is a finite intermediate field E of Omega/K and an O-algebra map

    A -> integralClosure(O,E)

which reflects units, in the sense of Mathlib's `IsLocalHom`. The target is the existing integral-closure subalgebra, not an opaque ring postulated to have the properties the proof needs. Over an arbitrary, possibly incomplete DVR, that integral closure need not be local. For the source setting, where O is the complete ring of integers of a characteristic-zero nonarchimedean local field, the **Local fields and ramification, Layer 0** supplier identifies this closure with the complete DVR of integers in E. Only with that identification do we export the local integral point in the source's topological setting.

Neither flatness nor reducedness of A is assumed. The resulting map can have a kernel, the point need not be unique, and the target residue field is allowed to extend the residue field of A. No canonical choice of a prime or of an embedding into Omega is asserted.

### R03.4/nilpotent-uniformizer-artinian

**Statement.** For any finite commutative O-algebra A, nilpotence of pi_A implies that A is Artinian. Localness of A and finiteness of the residue field of O are not required.

Choose n such that pi_A^n=0. The coefficient map factors through O/(pi^n), with the quotient action on A defined by this factorization. An O-generating family for A also generates it over the quotient: every scalar in the expression maps to its quotient class. The proof requires no lift of a generator or a splitting of a module extension.

The uniformizer criterion `IsDiscreteValuationRing.irreducible_iff_uniformizer` identifies the ideal (pi^n) with the nth power of the maximal ideal. The pinned result `IsDiscreteValuationRing.length_quotient_pow_maximalIdeal` computes the O-module length of that quotient as n. Apply `Module.length_ne_top_iff` and `isFiniteLength_iff_isNoetherian_isArtinian`. Apply the existing `isArtinian_of_tower` to the quotient scalar tower: its ideals are O-submodules, so it is Artinian as a ring as well. Finally `IsArtinianRing.of_finite` applies to A over this quotient. If n=0, the factor ring and A are zero, so the conclusion still holds.

This proof uses finite **length**, not finite cardinality. In particular it works over an infinite residue field. It does not confuse having some pi-torsion with the much stronger assertion that a power of pi annihilates 1.

**Tests.** The algebra O/(pi^n)[t]/(t^2) is a positive test with nonzero nilpotents. The zero algebra tests exponent zero. The algebra O[t]/(pi*t,t^2) rejects the incorrect replacement of nilpotence of pi by the existence of a pi-torsion element: t is torsion, but the image of O survives.

### R03.4/generic-prime-coefficient-injection

**Statement.** If q is a prime ideal of a commutative O-algebra A and pi_A does not lie in q, then O -> A/q is injective. This step does not require A to be finite or local.

The kernel is the contraction of q to O, hence is prime. By `IsDiscreteValuationRing.iff_pid_with_one_nonzero_prime`, a nonzero prime of O is its unique maximal ideal. That ideal is (pi), and so cannot be the contraction under the avoidance hypothesis. The contraction is therefore zero. This proves injectivity and fixes the actual quotient coefficient map for the scalar towers used next.

**Tests.** For A=O and q=0, the statement recovers the original coefficient injection. For A=O/(pi), its zero prime contains pi_A=0, so it cannot be selected as a generic prime. The two branches of O[t]/(t^2-pi*t) yield distinct generic quotient maps; the construction must not identify them merely because their reductions meet.

### R03.4/algebraic-point-of-generic-prime

**Statement.** Let O be a commutative domain and A a finite commutative O-algebra. Let Omega be an algebraically closed field over O with injective coefficient map. For a prime q of A with O -> A/q injective, construct an O-algebra map f:A -> Omega whose kernel is exactly q.

Set B=A/q. The image of a finite O-generating family for A generates B, so B is integral, and hence algebraic, over O. The domains B and Omega have torsion-free O actions because their coefficient maps are injective. These are exactly the hypotheses needed for the pinned `IsAlgClosed.lift` on B.

The particular lift supplied by that definition is injective. This is not an inference that an arbitrary map from a domain is injective. The inspected definition extends the coefficient embedding through the fraction fields, uses a field embedding of Frac(B), and composes it with B -> Frac(B). Both component maps are injective. Composing this lift with A -> B gives f, and its kernel is q.

This applies the existing algebraic-closure and fraction-field constructions; none is defined again. The coefficient identities are those of the actual composed algebra homomorphisms.

**Tests.** For A=O[t]/(t^2), the generic prime (t) yields t->0, so the map on A itself is not injective. A product algebra can supply different generic kernels; it cannot generally be embedded as a ring into a field. A characteristic-p quotient is rejected by the coefficient-injection hypothesis when Omega has characteristic zero.

### R03.4/finite-field-of-point-values

**Statement.** For a compatible O -> K -> Omega tower with K and Omega fields, a module-finite commutative O-algebra A and an O-algebra map f:A -> Omega, the existing intermediate field

    E = IntermediateField.adjoin K (range f)

is finite-dimensional over K. A need not be reduced and f need not be injective.

Here is an explicit spanning argument. Choose O-generators a_1,...,a_r via `Module.Finite.exists_fin'`, and let W be the K-span of f(a_1),...,f(a_r) in Omega. Every f(a) lies in W by the expression of a in those O-generators and the compatibility of the coefficient maps. In particular 1 belongs to W.

For each i,j, express a_i*a_j in the same generating family over O. Applying f shows that f(a_i)*f(a_j) belongs to W. K-bilinearity then makes W closed under multiplication. Thus W, with the inherited operations, is a finite-dimensional K-subalgebra C of Omega.

The finite/integral comparison makes C integral over K. The pinned `Algebra.IsIntegral.inv_mem` makes this subalgebra closed under inverses in Omega. Its underlying subset therefore gives an intermediate field. It contains f(A), while every intermediate field containing f(A) contains W. Consequently its underlying subset is exactly E, and the finite spanning family proves the result.

There is no exchange of a fraction field with an inverse limit and no choice of denominators depending on an infinite family. This is ordinary finite-dimensional algebra.

**Tests.** A=O gives E=K. The nilpotent quotient O[t]/(t^2) under t->0 also gives E=K. Module-finiteness cannot be weakened to finite type: evaluation of O[t] at a transcendental element generates an infinite-dimensional field over K.

### Assembly of the characteristic-zero integral point

Choose a uniformizer pi. Suppose pi_A were nilpotent. The first node would make A Artinian; `IsArtinianRing.isMaximal_of_isPrime` and `Ring.krullDimLE_zero_iff` would imply dim(A)<=0, contrary to the dimension premise. Thus pi_A is not nilpotent.

The **existing** `nilpotent_iff_mem_prime`, negated, gives a prime q avoiding pi_A. The second and third nodes produce f:A -> Omega with kernel q and injective O -> A/q. The fourth node produces the finite field E=K(f(A)).

Corestrict f first to E. The O action on E is the composite O -> K -> E, and its inclusion in Omega respects that action. Because A is finite over O, each f(a) is integral over O; transport its monic relation to E through the injective inclusion E -> Omega. Hence f corestricts again to integralClosure(O,E). This is a constructed map into the existing subtype, not an existential ring chosen to force the result.

A DVR is Noetherian and integrally closed. In characteristic zero the finite extension E/K is separable. Thus `IsIntegralClosure.finite` shows that this integral closure is finite over O. The finiteness result itself is already in Mathlib and is not a new node.

The local-map step needs care. Factor the map through B=A/q. Its map into the integral closure is injective. The closure is integral over O, hence integral over B by `Algebra.IsIntegral.tower_top`. The injective integral map therefore reflects units by `RingHom.IsIntegral.isLocalHom`. Since A is local and B is a nonzero quotient, A -> B is local by `IsLocalHom.of_surjective`. The composite is local by `RingHom.isLocalHom_comp`. Applying the integral-injective theorem directly to the original map from A would be invalid: that map usually has the nonzero kernel q.

For the complete local-field source setting, import Layer 0's actual finite-intermediate-field topology and `integerRing_eq_integralClosure` comparison. Transport the map to the ring of integers of E. Localness sends powers of the source maximal ideal into the corresponding powers of the target maximal ideal. These powers are the declared adic neighbourhood bases, giving continuity. The supplier owns the field topology, integer ring and completeness; this roadmap owns their application to the finite local algebra.

### Tests that distinguish the hypotheses

**Torsion is not itself an obstruction.** The finite algebra O[t]/(pi*t,t^2) has the O-point t->0. Its nonzero t is killed by pi, so adding flatness or torsion-freeness to the input would discard a valid case. By contrast O/(pi^n)[t]/(t^2) has nilpotent pi and admits no unital O-algebra point in characteristic zero.

**Positive dimension alone is insufficient.** The algebra k[t], viewed over O through its residue field k, has dimension one and pi acts by zero. It is not finite as an O-module, so the theorem correctly does not apply.

**Points are not unique or separated by reduction.** In O[t]/(t^2-pi*t), both t->0 and t->pi define O-points. They are distinct in characteristic zero but have the same reduction. The existence theorem contains no uniqueness clause.

**The residue field may have to grow.** Take O=Z_3 and A=O[t]/(t^2-18). The algebra is finite, and its reduction is F_3[t]/(t^2), so A is local with residue field F_3. It is a domain: a square root of 18 in Q_3 would give a square root of 2, which is impossible after reducing a hypothetical unit root modulo 3. In any characteristic-zero integral point, the image of t divided by 3 has square 2. This element is integral and a unit, and its residue is a square root of 2. Such a root is absent from F_3. A finite extension with larger residue field, for example the unramified quadratic one, supplies the point. The chain from the zero prime to the nonzero maximal ideal (3,t) also verifies the positive-dimension premise for this domain. Thus the generic theorem cannot demand that its target have the same residue field as A.

This last example is a counterexample to a **generic strengthening**, not a reported error in Khare–Wintenberger's arithmetic corollary. A source-specific fixed-residue statement needs its own arithmetic and category hypotheses. None is silently obtained from this generic finite-algebra argument.

### Framed lifting and remaining source boundaries

The integrated node also mentions lifting the point to a formally smooth framed enlargement. That is a separate construction. With a proved complete-local presentation B=A[[x_1,...,x_d]], evaluate every x_i at zero and use the complete-local universal property. An alternative proof must build compatible maps to all Artinian target quotients and then justify their inverse-limit realization. The source residue data and any coefficient extension must be retained in either route.

Bare formal smoothness of an arbitrary ring map is not enough for a local integral lifting assertion: localization O -> K is formally smooth as a ring map, but K has no O-algebra map into the ring of integers of a finite extension, where pi is still a nonunit. This does not contradict a theorem in the complete-local coefficient category; it explains why that category cannot be omitted.

The finite-over-subring criteria, the finite-image theorem for universal deformation rings, and the arithmetic dimension estimates in the integrated decomposition remain required. This section does not reconstruct or certify those arithmetic inputs. The packet and every stage remain partial.

## 5a. R03.3: catenarity and freeness over a regular local base

Layer R03.6 of this roadmap asked R03.3 for two statements that the integrated depth node did not export.
These four nodes supply them. RS-08 assigns both to R03.3: it keeps "explicit catenarity and excellence
hypotheses" and "Cohen–Macaulay modules over a regular local base", proved compatible with ModularCurves 4D.
Library files: `TauCeti/RingTheory/Catenary` (namespace `Ring`) and `TauCeti/RingTheory/RegularLocalRing/MaximalDepth`.

### R03.3/catenary

**Definition: catenary rings** (`Ring.IsCatenary`, a definition; node `catenary`; Stacks Definition 10.105.1, tag 00NI).
A commutative ring R is catenary if, for all primes p ⊆ q:
- the lengths of chains of primes from p to q are bounded; and
- any two *saturated* chains from p to q, that is `LTSeries` in `PrimeSpectrum R` each of whose steps is a
  covering relation `⋖`, have the same length.

The pinned Mathlib has no catenary predicate. For a Noetherian ring, boundedness is automatic, since heights are finite.

*API.*
- `IsCatenary.of_ringEquiv`: invariance under ring isomorphisms.
- `IsCatenary.quotient`: quotients of catenary rings are catenary (Stacks 00NK).
- `IsCatenary.localization`: localizations of catenary rings are catenary (Stacks 00NJ).
- `isCatenary_of_ringKrullDim_le_one`: a ring of dimension at most one is catenary.
- `isCatenary_iff_ringKrullDim_quotient_covBy`: the lemma below.

*Unit tests.*
- A field is catenary (`isCatenary_test_field`).
- ℤ is catenary (`isCatenary_test_int`).
- k[x, y] is catenary although 0 ⊂ (x, y) and 0 ⊂ (x) ⊂ (x, y) differ in length (`isCatenary_test_mvPolynomial_two`).
  This test rejects a definition without *saturated*.
- Some Noetherian local domain is not catenary: Nagata's A[x]_{m'} of dimension 3, with a maximal chain of
  length 2 (Stacks 02JE; `isCatenary_test_nagata`). This test rejects a definition without the equal-length clause.

### R03.3/catenary-iff-dimension-function

**Lemma: catenarity of a Noetherian local ring as a dimension function** (`Ring.isCatenary_iff_ringKrullDim_quotient_covBy`;
node `catenary-iff-dimension-function`; Stacks Lemma 10.105.10, tag 0ECF). For a Noetherian local ring A:

```text
A catenary   ⟺   dim A/p = dim A/q + 1  whenever p ⋖ q in Spec A.
```

The right side is the hypothesis `hcat` of R03.6's `NearlyFaithful.of_quotient_of_isSMulRegular`.

*Proof.* dim A/p is the Krull dimension of V(p) (`ringKrullDim_quotient`), and it is finite (`ringKrullDim_quotient_le`,
`ringKrullDim_lt_top`). So chains from p have length at most dim A/p, and a longest chain from p ends at m and is
saturated, since otherwise a prime can be inserted (`RelSeries.insertNth`).
- (⇒) For p ⋖ q, put p in front of a longest saturated chain from q to m. This gives a saturated chain from p to m
  of length dim A/q + 1, which must equal dim A/p.
- (⇐) Chains from p to q are bounded by dim A/p. Along a saturated chain the hypothesis telescopes, so its length
  is dim A/p − dim A/q.

*Acceptance.*
- Locality is needed. The semilocal ring k[x, y] localized away from (x, y) ∪ (x − 1) is catenary, but
  (0) ⋖ (x − 1) with dimensions 2 and 0.
- Catenarity does not give equidimensionality: k⟦x, y, z⟧/(xz, yz) satisfies the condition but has components of
  dimensions 2 and 1. R03.6 therefore keeps its separate equidimensionality hypothesis.
- Nagata's ring fails the condition along its chain of length 2.

### R03.3/regular-local-cohen-macaulay

**Lemma: a regular local ring is Cohen–Macaulay** (node `regular-local-cohen-macaulay`; Stacks Lemma 10.106.3, tag 00NQ).
If A is regular local of dimension d, a minimal generating set x₁, …, x_d of m is an A-regular sequence. So A has an
A-regular sequence in m of length d.

*Proof.* By induction on d:
- A is a domain, so x₁ is a nonzerodivisor.
- dim A/(x₁) = d − 1 (`ringKrullDim_quotient_span_singleton_succ_eq_ringKrullDim_of_mem_nonZeroDivisors`), and the
  maximal ideal of A/(x₁) is generated by d − 1 elements, so A/(x₁) is regular (`isRegularLocalRing_iff`).

The domain property (Stacks 00NP, from gr_m A ≅ κ[X₁, …, X_d], 00NO) is not in the pinned Mathlib. It is recorded as a gap.

*Acceptance.*
- k⟦x, y⟧/(x², xy) has dimension 1 and depth 0, since x is killed by m.
- k⟦x, y⟧/(xy) is Cohen–Macaulay but not regular.

### R03.3/free-of-maximal-depth-regular-local

**Lemma: maximal-depth modules over a regular local ring are free** (`Module.free_of_isRegular_of_isRegularLocalRing`;
node `free-of-maximal-depth-regular-local`; Stacks Lemma 10.106.6, tag 00NT, the case e = d of Proposition 10.110.1,
tag 00O7). If A is regular local and M is finite with an M-regular sequence in m of length dim A, then M is free.

This is R03.6's form of the hypothesis "M ≠ 0 and depth M ≥ dim A".

*Proof.*
1. depth M = dim A: the given sequence gives ≥, and depth M ≤ dim Supp M ≤ dim A gives ≤.
2. pd M < ∞, because a regular local ring has finite global dimension.
3. depth A = dim A (`regular-local-cohen-macaulay`).
4. Auslander–Buchsbaum gives pd M = depth A − depth M = 0.

Steps 1, 2 and 4 use the integrated node `R03.3/depth-auslander-buchsbaum-and-dimension-bounds`. A finite projective
module is flat, hence free over a local ring (`Module.Flat.of_projective`, `Module.free_of_flat_of_isLocalRing`).

*Acceptance.*
- Regularity is needed: k = k[ε]/(ε) over the dual numbers is not free.
- Maximal depth is needed: k over k⟦x⟧ is not free.
- **Compatibility with ModularCurves 4D.** For a finite local map A → B of regular local rings of equal dimension,
  B has maximal depth over A. So B is free, which recovers 4D's miracle flatness instead of restating it.

*Consumers.* R03.6's `patching-free-conclusion` and `patching-kernel-equals-ideal`. Once these nodes are merged,
R03.6 can cite them in place of its requests to R03.3.

## 6. Remaining scope and ownership

The accepted RS-08 keeps the generic commutative-algebra direction of R03.3, while importing the specified local regularity, completion, flatness and coherent-support statements from ModularCurves 4D. The finite-prime-filtration result above is an even earlier baseline input. It neither reconstructs 4D nor makes the rest of R03.3 complete.

Section 5a now supplies catenarity, Cohen–Macaulayness of regular local rings and maximal-depth freeness over a regular local base; the domain property of regular local rings (Stacks 00NP) is a recorded gap. The remaining work for R03.3 includes its hypothesis-complete depth, Cohen–Macaulay, Auslander–Buchsbaum, complete-intersection, dimension and component-support arguments, respecting the reviewed audit's existing regular-sequence and projective-dimension declarations. Those presence/absence leads were not all re-audited in this checkpoint.

For P7, generic module/complex Milnor and Mittag–Leffler lemmas remain assigned to ArithmeticGaloisDuality R02.1 by RS-08; the complete-local derived applications stay here. P8 and P9 must retain their uniformity, derived-action, integral-torsion and component-support hypotheses. R03.1 and R03.2 must preserve the distinction between coefficient categories, hulls, representing objects and arithmetic Galois instances. R03.4's characteristic-zero-point theorem requires a genuine dimension or non-torsion premise. R03.5 constructs actual compatible patching data before asserting its depth and support conclusions.

The existing integrated decomposition remains the starting material for those parts. Its node identifiers must be retained when the corresponding arguments are verified and refined. This partial packet is not an instruction to discard those nodes or an accepted replacement for that decomposition.

## Sources and verification boundary

The main verification source is the [pinned Mathlib file](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/AssociatedPrime/Finiteness.lean), read with its parameter declarations and proofs. The corresponding mathematical statement and two source proofs were checked at [Stacks tag 00L0](https://stacks.math.columbia.edu/tag/00L0). The difference between the library's associated-prime proof and the Stacks maximal-counterexample proof is not a discrepancy in their conclusions.

The accepted AUDIT-17 R03.3 record was read, including its citation of associatedPrimes.finite, and the audit's accepted review was checked. The oversized aggregate library-coverage file returned empty content; it is not claimed read. RS-08's R03.3/P7 decisions and accepted review were read, and the relevant exact-category and local-regularity interfaces in GrothendieckEulerForms and ModularCurves were consulted. No new source erratum is alleged. Compilation and observed CI results belong in the handoff and PR; Lean-shaped examples alone do not establish elaboration.

The characteristic-zero continuation inspected the scoped AUDIT-17 R03.4 entry, the integrated point node and its source conventions, and the LocalFieldsRamification Layer 0 finite-extension/integral-closure contract. The original five baseline records and the other-stage worklists are retained. The new proof uses the additional pinned files listed with blob hashes in the packet, whose statements and proof passages were inspected. These reads do not constitute a new whole-library absence audit.

The external source is [Khare–Wintenberger, author preprint, Corollary 4.7](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf), with the coefficient conventions on pp. 4–5 and the point/dimension passages on pp. 45–46. Those passages were read as parsed text; requests for the page images failed. No fresh PDF hash, successful visual inspection or publisher-edition comparison is claimed. [Stacks 00JB](https://stacks.math.columbia.edu/tag/00JB) was read for the Artinian/finite-length argument. The five nodes are explicit proof refinements, not a claim that the paper prints these five separate lemmas. No new source erratum is alleged.
