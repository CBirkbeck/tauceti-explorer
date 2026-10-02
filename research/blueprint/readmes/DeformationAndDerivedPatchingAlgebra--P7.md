# Commutative algebra for deformation theory and patching — part P7

## Scope of this checkpoint

The part comprises P7–P9 and R03.1–R03.5. This partial blueprint retains the existing finite-prime-filtration input of R03.3, adds a five-node refinement of the R03.4 characteristic-zero-point argument, and adds four R03.3 nodes on catenarity and on freeness over a regular local base (Section 5a). Before the continuation in Section 5b, the packet had 46 baseline references and one object definition, the catenary predicate. Section 5b preserves those nine nodes and adds fourteen Hilbert–Samuel nodes; the combined packet has 62 baseline references. The field, quotient, integral-closure and local-field constructions are reused from their existing owners. The stage coverage records retain the remaining work explicitly.

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

## 5b. General Hilbert–Samuel multiplicity

This continuation supplies the maintained reserved identifier
`DeformationAndDerivedPatchingAlgebra:key/hilbert-samuel-multiplicity` in
R03.3, once for general finite modules and ideals of definition. It is a
plan with gaps, not closure of the key definition, the stage, or this part.
The previous nine nodes, APIs, tests and historical source receipts remain.

Let (A,m) be a commutative Noetherian local ring, q an ideal with radical m,
and M a finitely generated A-module. An ideal of definition is necessarily
proper in this nontrivial local ring. No completeness, reducedness,
equidimensionality, field or DVR hypothesis belongs to the general definition.
Finite generation is not finite cardinality.

The convention is H(n)=length_A(M/q^(n+1)M). Length starts in ℕ∞;
finite-adic-quotient-length makes the values finite before they are read in
ℕ or ℚ. The pinned ENat conversion sends infinity to zero, so using it on an
unverified length would erase the difference between an infinite module and
the zero module. The quotient is the actual module quotient by the existing
ideal action on the top submodule, not a private carrier.

The cumulative polynomial P interpolates H eventually. Stacks 10.59 calls
the polynomial for the graded-piece function φ(n) its Hilbert polynomial;
that is not our cumulative P. Stacks 43.15 instead indexes its cumulative
function by q^nM. It is P(T−1) in our n+1 convention. Translation does not
change the leading coefficient, degree or multiplicity.

Intrinsic e(q;M) uses dim Supp M. Dimension-indexed e(q;M,d) extracts
d! coeff(P,d), and its multiplicity theorems require dim Supp M≤d. Ambient
e_A(M) takes d=dim A and vanishes on lower-dimensional modules. The raw
coefficient extractor at smaller d is not a multiplicity and is not promised
nonnegative. The zero module gives P=0 and e=0; its support dimension is
bottom, not zero.

The pinned Polynomial.hilbertPoly already extracts an eventual polynomial
from a rational formal power series. It does not construct a module's
associated graded, prove graded finite generation, or prove a module Hilbert
series rational. The source file explicitly leaves that graded-module
development as future work. The module-to-series bridge is therefore a
recorded gap, not a baseline theorem. Existing Module.supportDim, generic
prime filtration and length exactness are imported directly.

### Declaration-sized development

### R03.3/hilbert-samuel-function: Hilbert–Samuel quotient-length function

Proposed declaration: `TauCeti.HilbertSamuel.function`.

Definition. For any commutative ring A, module M and ideal q, define H(q,M,n)=length_A(M/(q^(n+1)·M)) in ℕ∞. Here q^(n+1)·M is the existing ideal action on the top submodule. For the local Noetherian finite-module regime, finite-adic-quotient-length proves that these values are finite; only then read them in ℕ or ℚ.

Hypotheses. A is a commutative ring and M an A-module for this raw extended-natural-valued definition; q is any ideal.

Proof route.

1. Use the actual quotient of M by (q^(n+1))·top, with its induced A action. Use Module.length directly, not the number of elements, a residue-field dimension of the whole quotient, or an unproved length-toNat conversion.

Dependencies: `mathlib:Module.length`, `mathlib:Submodule.smul_eq_map₂`.

API.

- `TauCeti.HilbertSamuel.function_eq_length`: H(q,M,n) is exactly the A-length of M/q^(n+1)M.

- `TauCeti.HilbertSamuel.function_zero`: For a zero module H(q,0,n)=0 for every n and q.

- `TauCeti.HilbertSamuel.function_congr`: An A-linear equivalence M≃N induces equality of quotient-length functions for the same q.

- `TauCeti.HilbertSamuel.function_top`: For q=A the raw function is zero; the ideal-of-definition hypotheses reject q=A over a nontrivial local ring.

Unit tests.

- `HilbertSamuelTest.function_field_rank` (computation): For a field k, q=0 and M=k^r, H(q,M,n)=r for all n, including n=0 and r=0.

- `HilbertSamuelTest.function_dvr_power` (computation): For a DVR O, q=m^s, s>0, and M=O, H(q,M,n)=s(n+1).

- `HilbertSamuelTest.function_infinite` (non-example): For A=ℤ, q=0 and M=ℤ, the raw length is ∞ for all n. Applying ENat.toNat would misleadingly give zero; do not export a polynomial here.

- `HilbertSamuelTest.function_zero` (degenerate): For the zero A-module and any ideal q the function is identically zero.

Acceptance: At n=0 take M/qM, not the zero quotient M/M. A finite quotient over an infinite residue field can still have finite length.

Sources: [STACKS-HS](https://stacks.math.columbia.edu/tag/00K4), §10.59 opening formulas and ideal-of-definition variant. The cumulative n+1 convention is read from section 10.59; graded and cumulative polynomials are not identified.

### R03.3/finite-length-of-maximal-power-annihilation: Finite length under maximal-ideal-power annihilation

Proposed declaration: `TauCeti.HilbertSamuel.finite_length_of_maximal_power`.

Lemma. For a Noetherian local A and finite A-module N, if m^r·N=0 for some r:ℕ, then length_A(N)≠∞, including r=0 and N=0.

Hypotheses. A is a commutative Noetherian local ring, N a finite A-module. There is r:ℕ such that m^r·top_N=bottom.

Proof route.

1. Filter N by m^iN for 0≤i≤r. Each subquotient is finite, because A is Noetherian, and is annihilated by m.

2. Use the induced A/m scalar action on each subquotient. Module.length_eq_of_surjective compares its A-length with its residue-field length, and Module.length_eq_finrank makes the latter a finite natural number.

3. Induct along the finite filtration using Module.length_eq_add_of_exact on the actual inclusion/projection exact sequences; do not assume they split. For r=0 the annihilation hypothesis already makes N zero.

Dependencies: `mathlib:Module.length_eq_of_surjective`, `mathlib:Module.length_eq_finrank`, `mathlib:Module.length_eq_add_of_exact`.

Acceptance: The module k[ε]/(ε²) has length 2 over itself although the filtration need not split. Without finite generation an infinite direct sum of k has mN=0 but infinite length.

Sources: [STACKS-FINITE-LENGTH](https://stacks.math.columbia.edu/tag/00J0), Lemma 10.52.8, statement and proof. Maximal-ideal-power annihilation and finite generation give the finite filtration used here.

### R03.3/finite-adic-quotient-length: Finite adic quotient lengths

Proposed declaration: `TauCeti.HilbertSamuel.function_ne_top`.

Lemma. Under the common hypotheses, H(q,M,n)≠∞ for every n:ℕ.

Hypotheses. A is a commutative Noetherian local ring with maximal ideal m; q is an ideal with radical q = m. M is a finite A-module; no field, DVR, equidimensionality, completeness, freeness or nonzero hypothesis unless explicitly stated.

Proof route.

1. Use Ideal.exists_radical_pow_le_of_fg and Noetherianity to choose r with m^r⊆q. If needed increase r to a positive integer; ideal powers decrease.

2. The quotient N=M/q^(n+1)M is finite and is annihilated by m^(r(n+1)), since m^(r(n+1))⊆q^(n+1). Apply finite-length-of-maximal-power-annihilation.

3. This supplies the necessary finiteness witness before H.toNat is interpreted as the genuine length.

Dependencies: `DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-function`, `DeformationAndDerivedPatchingAlgebra:R03.3/finite-length-of-maximal-power-annihilation`, `mathlib:Ideal.exists_radical_pow_le_of_fg`, `mathlib:ENat.toNat`.

Acceptance: For a field and q=0 the lengths of finite-dimensional modules are finite. For k[[x,y]], q=(x) is rejected: its radical is not m, and A/q^(n+1) has infinite length.

Sources: [STACKS-HS](https://stacks.math.columbia.edu/tag/00K4), §10.59, immediately after Definition 10.59.1. The cumulative n+1 convention is read from section 10.59; graded and cumulative polynomials are not identified.

### R03.3/eventual-hilbert-samuel-polynomial: Existence and uniqueness of the cumulative polynomial

Proposed declaration: `TauCeti.HilbertSamuel.existsUnique_polynomial`.

Theorem. Under the common hypotheses there is exactly one P∈ℚ[T] such that P(n)=H(q,M,n).toNat for all n≥N for some N:ℕ. The polynomial interpolates the cumulative function, not the degree-n graded piece.

Hypotheses. A is a commutative Noetherian local ring with maximal ideal m; q is an ideal with radical q = m. M is a finite A-module; no field, DVR, equidimensionality, completeness, freeness or nonzero hypothesis unless explicitly stated.

Proof route.

1. The associated-graded bridge gap supplies gr_q(A), gr_q(M), Noetherianity, generation of the ring in degree one, finite generation of the graded module, and the coefficient lengths φ(n)=length(q^nM/q^(n+1)M). These are genuine missing module-to-series inputs, not supplied by Polynomial.hilbertPoly.

2. The graded numerical-polynomial theorem gap follows the inspected induction of Stacks 10.58.7: isolate the largest x-power-torsion submodule, terminate its nilpotent filtration, then use the degree-one multiplication exact sequence on the torsion-free quotient. Finite differences reconstruct the coefficient polynomial.

3. The cumulative-sum gap supplies H(n)=Σ_{i=0}^n φ(i) using the quotient filtration and length exactness. Apply the binomial antidifference of Stacks 10.58.5, retaining the constant contributed by the initial segment.

4. Uniqueness uses Polynomial.eq_of_infinite_eval_eq on the infinite tail of distinct rational natural-number casts. Finite-adic-quotient-length validates the conversion of every eventual length to ℚ.

Dependencies: `DeformationAndDerivedPatchingAlgebra:R03.3/finite-adic-quotient-length`, `mathlib:Polynomial.eq_of_infinite_eval_eq`, `mathlib:Polynomial.hilbertPoly`, `mathlib:Polynomial.coeff_mul_invOneSubPow_eq_hilbertPoly_eval`.

Acceptance: For O a DVR and q=m, P=T+1, not T and not the constant 1. For the embedded-prime example P=T+2 agrees only for n≥1; P(0)=2 is not the actual H(0)=1.

Sources: [STACKS-HS](https://stacks.math.columbia.edu/tag/00K4), Proposition 10.59.5; compare Definition 10.59.6. The cumulative n+1 convention is read from section 10.59; graded and cumulative polynomials are not identified. [STACKS-GRADED-HS](https://stacks.math.columbia.edu/tag/00K1), Proposition 10.58.7, complete proof. The proof is inspected but its graded-module hypotheses and induction interfaces still require the named gaps. [STACKS-ANTIDIFFERENCE](https://stacks.math.columbia.edu/tag/00JZ), Lemma 10.58.5, complete proof. The initial constant survives summation; this is not the assertion that the polynomial vanishes at zero.

### R03.3/hilbert-samuel-polynomial: Cumulative Hilbert–Samuel polynomial

Proposed declaration: `TauCeti.HilbertSamuel.polynomial`.

Construction. For a Noetherian local A, ideal q with radical q=m and finite M, define P(q,M) to be the unique polynomial of eventual-hilbert-samuel-polynomial. Its coefficient field is ℚ. It is chosen from the theorem on the actual quotient lengths, not accepted as extra data supplied by a caller.

Hypotheses. A is a commutative Noetherian local ring with maximal ideal m; q is an ideal with radical q = m. M is a finite A-module; no field, DVR, equidimensionality, completeness, freeness or nonzero hypothesis unless explicitly stated.

Proof route.

1. Choose the polynomial from eventual-hilbert-samuel-polynomial; uniqueness makes the choice independent of the threshold and of every existence witness.

2. The evaluation API is an eventual assertion with a threshold; it is not an equality for every n. Polynomial.degree returns −∞ for the zero polynomial and is retained in the zero-module case.

Dependencies: `DeformationAndDerivedPatchingAlgebra:R03.3/eventual-hilbert-samuel-polynomial`.

API.

- `TauCeti.HilbertSamuel.polynomial_eventually`: There is N with P(q,M).eval(n)=H(q,M,n).toNat for all n≥N.

- `TauCeti.HilbertSamuel.polynomial_unique`: Any Q∈ℚ[T] eventually evaluating to the same quotient lengths equals P(q,M).

- `TauCeti.HilbertSamuel.polynomial_zero`: For a zero module P(q,0)=0.

- `TauCeti.HilbertSamuel.polynomial_congr`: An A-linear equivalence M≃N gives P(q,M)=P(q,N), by the quotient comparison and uniqueness.

Unit tests.

- `HilbertSamuelTest.polynomial_field` (computation): For q=0 on a field and M=k^r, P=C(r).

- `HilbertSamuelTest.polynomial_dvr` (computation): For q=m^s on a DVR, s>0, P=C(s)(T+1).

- `HilbertSamuelTest.polynomial_embedded` (computation): For A=k[[x,y]]/(xy,y²), q=m, P=T+2 while H(0)=1; an all-n evaluation API fails.

- `HilbertSamuelTest.polynomial_zero` (degenerate): For a zero module P=0 and polynomial degree = −∞.

Acceptance: For finite length M the eventual polynomial is the constant length M. The zero polynomial has degree −∞, not the support dimension zero.

Sources: [STACKS-HS](https://stacks.math.columbia.edu/tag/00K4), Proposition 10.59.5 and cumulative function in the opening formulas. The cumulative n+1 convention is read from section 10.59; graded and cumulative polynomials are not identified.

### R03.3/hilbert-samuel-degree: Polynomial degree equals support dimension

Proposed declaration: `TauCeti.HilbertSamuel.polynomial_degree`.

Lemma. For a nonzero finite M and radical q=m, P(q,M)≠0 and the natural degree d of P satisfies Module.supportDim A M=d (in WithBot ℕ∞). For M=0, P=0 and both polynomial degree and support dimension are −∞; no artificial dimension-zero convention is imposed.

Hypotheses. A is a commutative Noetherian local ring with maximal ideal m; q is an ideal with radical q = m. M is a finite A-module; no field, DVR, equidimensionality, completeness, freeness or nonzero hypothesis unless explicitly stated.

Proof route.

1. For q=m the dimension bridge gap supplies the exact-sequence leading-degree comparison of Stacks 10.59.10 and the local-ring degree/dimension theorem 10.60.9. Apply the existing prime-filtration theorem, not a new filtration construction.

2. In a prime filtration, degree equals the maximum degree of its factors and support is the union of their closed supports. Stacks 10.62.6 identifies these maxima. Module.supportDim is the existing dimension carrier, and Module.supportDim_eq_ringKrullDim_quotient_annihilator pins its convention.

3. For another ideal of definition q, compare powers of q and m as in Stacks 10.59.4 and 10.59.7; polynomial growth in both directions gives the same degree. Nakayama prevents a nonzero finite M from giving a zero eventual polynomial.

4. Use Module.supportDim_eq_bot_iff_subsingleton for the zero branch, not natDegree(0)=0 as a dimension assertion.

Dependencies: `DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-polynomial`, `mathlib:IsNoetherianRing.exists_relSeries_isQuotientEquivQuotientPrime`, `mathlib:Module.supportDim`, `mathlib:Module.supportDim_eq_ringKrullDim_quotient_annihilator`, `mathlib:Module.supportDim_eq_bot_iff_subsingleton`.

Acceptance: For a DVR O and M=κ(O), degree is zero although dim O=1. For M=0 keep bottom support dimension.

Sources: [STACKS-SUPPORT-HS](https://stacks.math.columbia.edu/tag/00L8), Lemma 10.62.6, proof. This source is read; the named ring-dimension and exact-sequence inputs have not been decomposed or closed here. [STACKS-HS](https://stacks.math.columbia.edu/tag/00K4), Lemmas 10.59.4, 10.59.7 and Definition 10.59.8. The cumulative n+1 convention is read from section 10.59; graded and cumulative polynomials are not identified.

### R03.3/top-coefficient-finite-difference: Factorial top coefficient from finite differences

Proposed declaration: `TauCeti.HilbertSamuel.top_coefficient_finite_difference`.

Lemma. For P∈ℚ[T], d:ℕ with natDegree P≤d, and t∈ℚ, Σ_{i=0}^d (−1)^i binom(d,i)P(t−i)=d!·coeff(P,d). This includes P=0 and the case natDegree P<d.

Hypotheses. P is a rational polynomial, d a natural number bounding its natural degree, and t a rational number.

Proof route.

1. Induct on the number of backward differences ΔP(T)=P(T)−P(T−1); Pascal's identity gives the binomial expression.

2. For positive polynomial degree, Δ lowers degree by one and multiplies the leading coefficient by that degree, by binomial expansion. A constant has zero first difference; the zero polynomial remains zero.

3. After d steps obtain d! coeff(P,d). This proof is polynomial algebra only; it does not assume that module lengths themselves are exact-sequence additive at every adic level.

Dependencies: rational polynomial algebra only; no module theorem assumed.

Acceptance: For P=(T+1)(T+2)/2 and d=2 the difference equals 1, not 1/2. For P=T+1 and d=2 it equals 0.

Sources: [STACKS-MULT](https://stacks.math.columbia.edu/tag/0AZU), Lemma 43.15.4 and its complete finite-difference proof; explicit extension to degree ≤d. General local algebra, not a ring-only or curve-only special case. Section 43.15 uses n rather than n+1; translation preserves the top coefficient.

### key/hilbert-samuel-multiplicity: Intrinsic Hilbert–Samuel multiplicity

Proposed declaration: `TauCeti.HilbertSamuel.multiplicity`.

Definition. For a Noetherian local A, radical q=m and finite A-module M, define e(q;M)∈ℚ by natDegree(P(q,M))! times the leading coefficient of P(q,M). Set e(M)=e(m;M) and e(A)=e(m;A). This gives e(q;0)=0 without assigning the zero module dimension zero. For nonzero M, hilbert-samuel-degree identifies the factorial index with dim Supp M. A separate theorem proves this rational value is a positive integer.

Hypotheses. A is a commutative Noetherian local ring with maximal ideal m; q is an ideal with radical q = m. M is a finite A-module; no field, DVR, equidimensionality, completeness, freeness or nonzero hypothesis unless explicitly stated.

Proof route.

1. Use the actual cumulative polynomial and its top coefficient. The zero polynomial has zero leading coefficient, so the formula is zero even though its natural degree is zero.

2. Do not redefine a curve multiplicity or ambient-normalized module multiplicity here: curve applications specialize to M=A=O_C,x; ambient normalization uses multiplicityInDegree at dim A.

3. The definition is general in the ideal q and finite module M. Its existence theorem and support-degree comparison carry recorded gaps; merely giving the reserved id does not certify key-definition closure.

Dependencies: `DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-polynomial`, `DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-degree`.

API.

- `TauCeti.HilbertSamuel.multiplicity_zero`: e(q;0)=0.

- `TauCeti.HilbertSamuel.multiplicity_eq_factorial_leadingCoeff`: e(q;M)=natDegree(P(q,M))!·leadingCoeff(P(q,M)).

- `TauCeti.HilbertSamuel.multiplicity_congr`: A-linear equivalence M≃N preserves e(q;M).

- `TauCeti.HilbertSamuel.multiplicity_eq_inDegree`: If M≠0 and dim Supp M=d, then e(q;M)=e(q;M,d), the comparison node below.

- `TauCeti.HilbertSamuel.multiplicity_pos_integral`: For M≠0 there is a positive natural integer whose rational cast equals e(q;M), the positivity/integrality node below.

- `TauCeti.HilbertSamuel.multiplicity_pow`: For s>0, e(q^s;M)=s^dim(M) e(q;M) when M≠0, the power-ideal node below.

Unit tests.

- `HilbertSamuelTest.multiplicity_field` (computation): For a field k, q=0, M=k^r, e(q;M)=r, including r=0.

- `HilbertSamuelTest.multiplicity_dvr_power` (computation): For a DVR O, e(m^s;O)=s for every s>0.

- `HilbertSamuelTest.multiplicity_residue` (computation): For a DVR O, intrinsic e(m;κ(O))=1, not the ambient-normalized value 0.

- `HilbertSamuelTest.multiplicity_embedded` (non-example): A=k[[x,y]]/(xy,y²) has H(n)=n+2 for n≥1 and e(A)=1, but embedding dimension 2 and dimension 1. Its embedded prime forbids omitting unmixedness in Nagata's converse.

Acceptance: The intrinsic multiplicity of κ(O) over a DVR O is 1, while its ambient-normalized multiplicity is 0. The embedded-prime example has multiplicity 1 but is not regular.

Sources: [STACKS-MULT](https://stacks.math.columbia.edu/tag/0AZU), Definition 43.15.1. General local algebra, not a ring-only or curve-only special case. Section 43.15 uses n rather than n+1; translation preserves the top coefficient.

### R03.3/degree-indexed-multiplicity: Dimension-normalized multiplicity

Proposed declaration: `TauCeti.HilbertSamuel.multiplicityInDegree`.

Definition. Define e(q;M,d)=d!·coeff(P(q,M),d)∈ℚ for d:ℕ. Its multiplicity theorems require dim Supp M≤d (equivalently natDegree P≤d for nonzero M). If d=dim M it is intrinsic; if d>dim M it is zero. Ambient e_A(M) means d=dim A, not d=dim M. The raw coefficient extractor for smaller d is defined but is not a multiplicity and need not be nonnegative.

Hypotheses. A is a commutative Noetherian local ring with maximal ideal m; q is an ideal with radical q = m. M is a finite A-module; no field, DVR, equidimensionality, completeness, freeness or nonzero hypothesis unless explicitly stated.

Proof route.

1. Use the coefficient at the requested dimension, not the leading coefficient with a differently sized factorial.

2. Use the existing support-dimension bound to justify d=dim A for any finite M. All zero-module values vanish.

3. Do not convert coefficients to natural numbers before integrality and nonnegativity have been proved under the dimension bound.

Dependencies: `DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-polynomial`, `mathlib:Module.supportDim_le_ringKrullDim`.

API.

- `TauCeti.HilbertSamuel.multiplicityInDegree_zero`: For M=0, e(q;M,d)=0 for every d.

- `TauCeti.HilbertSamuel.multiplicityInDegree_eq_coeff`: e(q;M,d)=d! coeff(P(q,M),d).

- `TauCeti.HilbertSamuel.multiplicityInDegree_eq_zero_of_lt`: If natDegree P(q,M)<d, the indexed value is zero.

- `TauCeti.HilbertSamuel.multiplicityInDegree_additive`: For a finite short exact sequence and one d bounding the support dimension of its middle module, the indexed value is additive; see the standalone additivity node.

- `TauCeti.HilbertSamuel.multiplicityInDegree_associativity`: For dim M≤d, the finite sum over top-dimensional support primes gives the indexed value; see the standalone associativity node.

Unit tests.

- `HilbertSamuelTest.inDegree_residue` (computation): For a DVR O and M=κ(O), e(m;M,0)=1 and e(m;M,1)=0.

- `HilbertSamuelTest.inDegree_mixed` (non-example): For O⊕κ(O) over a DVR, P=T+2 and intrinsic e=1. The sum of the two intrinsic multiplicities is 2; at ambient d=1 the identity is 1=1+0.

- `HilbertSamuelTest.inDegree_zero` (degenerate): For a zero module the indexed multiplicity is zero in every dimension.

- `HilbertSamuelTest.inDegree_factorial` (computation): For A=k[[x,y]], P=(T+1)(T+2)/2 and the d=2 value is 1, not 1/2; the plane-polynomial computation is a required open example.

Acceptance: For M=κ(O) over a DVR, d=1 gives zero and d=0 gives one. Intrinsic additivity is not asserted across mixed dimensions.

Sources: [STACKS-MULT](https://stacks.math.columbia.edu/tag/0AZU), Definition 43.15.1 and Lemma 43.15.2. General local algebra, not a ring-only or curve-only special case. Section 43.15 uses n rather than n+1; translation preserves the top coefficient.

### R03.3/intrinsic-ambient-normalization: Intrinsic and ambient normalization comparison

Proposed declaration: `TauCeti.HilbertSamuel.multiplicity_eq_inDegree`.

Lemma. If M≠0 and Module.supportDim A M=d, then e(q;M,d)=e(q;M). If d< D, then e(q;M,D)=0. In particular ambient normalization at dim A vanishes for every lower-dimensional M; for M=0 both notions vanish.

Hypotheses. A is a commutative Noetherian local ring with maximal ideal m; q is an ideal with radical q = m. M is a finite A-module; no field, DVR, equidimensionality, completeness, freeness or nonzero hypothesis unless explicitly stated.

Proof route.

1. Use hilbert-samuel-degree to identify the natural degree of the nonzero cumulative polynomial with d.

2. At d, its coefficient is its leading coefficient. At a larger D the coefficient is zero. Multiply by the indicated factorial.

3. Treat the zero module by P=0, without coercing bottom support dimension to a natural number.

Dependencies: `DeformationAndDerivedPatchingAlgebra:key/hilbert-samuel-multiplicity`, `DeformationAndDerivedPatchingAlgebra:R03.3/degree-indexed-multiplicity`, `DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-degree`.

Acceptance: On κ(O) the two normalizations differ, despite its positive intrinsic multiplicity.

Sources: [STACKS-MULT](https://stacks.math.columbia.edu/tag/0AZU), Definition 43.15.1. General local algebra, not a ring-only or curve-only special case. Section 43.15 uses n rather than n+1; translation preserves the top coefficient.

### R03.3/multiplicity-positive-integer: Positivity and integrality of intrinsic multiplicity

Proposed declaration: `TauCeti.HilbertSamuel.multiplicity_pos_integral`.

Lemma. For any nonzero finite M under the common hypotheses, e(q;M) is a positive natural integer viewed in ℚ.

Hypotheses. A is a commutative Noetherian local ring with maximal ideal m; q is an ideal with radical q = m. M is a finite A-module; no field, DVR, equidimensionality, completeness, freeness or nonzero hypothesis unless explicitly stated.

Proof route.

1. Let d=natDegree P. For t a sufficiently large natural integer, all t−i (0≤i≤d) are above the eventual evaluation threshold. top-coefficient-finite-difference expresses e as an integer linear combination of genuine integer quotient lengths, proving integrality.

2. Positivity uses the polynomial-growth/sign gap together with nonnegative quotient lengths and Nakayama: the eventual polynomial is nonzero and nonnegative on a cofinal tail, hence has positive leading coefficient. Its factorial is positive.

3. Combine positive rational value and integrality to obtain a positive natural integer. No primality, reducedness or Cohen–Macaulay hypothesis is introduced.

Dependencies: `DeformationAndDerivedPatchingAlgebra:key/hilbert-samuel-multiplicity`, `DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-degree`, `DeformationAndDerivedPatchingAlgebra:R03.3/top-coefficient-finite-difference`, `DeformationAndDerivedPatchingAlgebra:R03.3/finite-adic-quotient-length`.

Acceptance: A nonzero finite-length module has e=length>0 in dimension zero. The zero module is excluded from the positive statement.

Sources: [STACKS-MULT](https://stacks.math.columbia.edu/tag/0AZU), Lemma 43.15.4; positivity is the explicit polynomial-tail argument. General local algebra, not a ring-only or curve-only special case. Section 43.15 uses n rather than n+1; translation preserves the top coefficient. [STACKS-HS](https://stacks.math.columbia.edu/tag/00K4), Definition 10.59.8 and Lemma 10.59.10 proof, nonnegative leading coefficients. The cumulative n+1 convention is read from section 10.59; graded and cumulative polynomials are not identified.

### R03.3/multiplicity-powers: Multiplicity for powers of an ideal of definition

Proposed declaration: `TauCeti.HilbertSamuel.multiplicity_pow`.

Lemma. For s>0 and nonzero finite M of support dimension d, e(q^s;M)=s^d e(q;M). For M=0 both sides vanish.

Hypotheses. A is a commutative Noetherian local ring with maximal ideal m; q is an ideal with radical q = m. M is a finite A-module; no field, DVR, equidimensionality, completeness, freeness or nonzero hypothesis unless explicitly stated.

Proof route.

1. The actual quotient functions satisfy H(q^s,M,n)=H(q,M,s(n+1)−1) for every n; the exponent identity is s(n+1).

2. For sufficiently large n, polynomial evaluation identifies P(q^s,M) with P(q,M) composed with sT+(s−1), by uniqueness.

3. The coefficient of degree d of this composition is s^d times the original top coefficient by the binomial theorem. Multiply by d!, using hilbert-samuel-degree and radical(q^s)=radical(q) for s>0.

Dependencies: `DeformationAndDerivedPatchingAlgebra:key/hilbert-samuel-multiplicity`, `DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-function`, `DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-polynomial`, `DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-degree`, `mathlib:Ideal.radical_pow`.

Acceptance: For a DVR, s=3 changes e from 1 to 3; declaring ideal-independence of multiplicity fails. For dimension zero, s^0=1 and multiplicity remains the module length.

Sources: [STACKS-HS](https://stacks.math.columbia.edu/tag/00K4), Definition 10.59.1 and quotient-length formula; explicit derivation, not a numbered source theorem. The cumulative n+1 convention is read from section 10.59; graded and cumulative polynomials are not identified.

### R03.3/dimension-normalized-additivity: Additivity at a common dimension

Proposed declaration: `TauCeti.HilbertSamuel.multiplicityInDegree_additive`.

Theorem. For a short exact sequence 0→M'→M→M''→0 of finite A-modules, q with radical q=m, and d:ℕ with Module.supportDim A M≤d, e(q;M,d)=e(q;M',d)+e(q;M'',d). Consequently intrinsic multiplicity is additive if all nonzero terms have the same dimension; it is not asserted additive for mixed dimensions.

Hypotheses. A is a commutative Noetherian local ring with maximal ideal m; q is an ideal with radical q = m. M is a finite A-module; no field, DVR, equidimensionality, completeness, freeness or nonzero hypothesis unless explicitly stated.

Proof route.

1. The Artin–Rees leading-coefficient gap supplies the correctly filtered quotient exact sequence: kernel M'/(M'∩q^(n+1)M), not generally M'/q^(n+1)M'.

2. Use Stacks 10.59.3 to replace the intersection filtration by a shifted q-adic filtration of a finite-colength submodule N⊆M'. The finite-colength comparison 10.59.9 preserves top coefficients in positive dimension.

3. Stacks 10.59.10 shows the discrepancy has strictly smaller degree; when M' has finite length, Artin–Rees makes its intersection with q^nM vanish eventually and the discrepancy becomes exactly length M'. Thus the dimension-zero case is genuine length additivity, not an omitted case.

4. Extract the coefficient of degree d of the eventual polynomials; terms of smaller dimension have zero dth coefficient by hilbert-samuel-degree. Multiply by d!.

Dependencies: `DeformationAndDerivedPatchingAlgebra:R03.3/degree-indexed-multiplicity`, `DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-degree`, `DeformationAndDerivedPatchingAlgebra:R03.3/finite-adic-quotient-length`, `mathlib:Module.length_eq_add_of_exact`.

Acceptance: The nonsplit sequence 0→O→O→κ(O)→0 induced by a uniformizer gives 1=1+0 at d=1; the adic quotient sequences are not exact without the induced filtration.

Sources: [STACKS-MULT](https://stacks.math.columbia.edu/tag/0AZU), Lemma 43.15.2. General local algebra, not a ring-only or curve-only special case. Section 43.15 uses n rather than n+1; translation preserves the top coefficient. [STACKS-HS](https://stacks.math.columbia.edu/tag/00K4), Lemmas 10.59.3, 10.59.9 and 10.59.10, all proofs. The cumulative n+1 convention is read from section 10.59; graded and cumulative polynomials are not identified.

### R03.3/multiplicity-associativity: Associativity of multiplicities

Proposed declaration: `TauCeti.HilbertSamuel.multiplicityInDegree_associativity`.

Theorem. For d≥dim Supp M, e(q;M,d)=Σ_p length_{A_p}(M_p) e(q_p;A/p,d), over primes p∈Supp M with dim(A/p)=d, where q_p is the image of q in A/p. The sum is finite; localized lengths are finite. At d=dim M≠−∞ this gives intrinsic associativity. Primes outside Supp M are not assigned ∞·0 terms.

Hypotheses. A is a commutative Noetherian local ring with maximal ideal m; q is an ideal with radical q = m. M is a finite A-module; no field, DVR, equidimensionality, completeness, freeness or nonzero hypothesis unless explicitly stated.

Proof route.

1. The finite top-dimensional support/localization gap identifies these primes with the relevant minimal support primes and proves the lengths of localized modules finite, as in Stacks 10.62.5.

2. Use the existing prime-filtration induction and dimension-normalized-additivity. Do not introduce a new generic filtration. The localized length is additive by the existing length exact-sequence theorem.

3. On a factor A/r, only p=r of dimension d contributes, with local length 1; if dim(A/r)<d both sides are zero. Transport q to the quotient coefficient ring and compare its lengths using Module.length_eq_of_surjective.

4. Sum along the finite filtration. The localization gap supplies exactness and the residue-field/zero dichotomy for every localized factor; no expression with infinite length is coerced to zero.

Dependencies: `DeformationAndDerivedPatchingAlgebra:R03.3/dimension-normalized-additivity`, `DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-degree`, `mathlib:IsNoetherianRing.induction_on_isQuotientEquivQuotientPrime`, `mathlib:Module.length_eq_of_surjective`, `mathlib:Module.length_eq_add_of_exact`.

Acceptance: The nodal special fiber k[[x,y]]/(xy) must count both one-dimensional branches and give 2; its formal-series comparison is a required remaining example.

Sources: [STACKS-MULT](https://stacks.math.columbia.edu/tag/0AZU), Lemma 43.15.3, complete prime-filtration proof. General local algebra, not a ring-only or curve-only special case. Section 43.15 uses n rather than n+1; translation preserves the top coefficient.

### Worked convention checks and hypothesis boundary

For a DVR O and M=O, the n+1 convention gives H(n)=n+1 and P=T+1.
For q=m^s it gives P=s(T+1), hence multiplicity s. This rejects both
the wrong shift and an incorrect ideal-independent multiplicity.
For its residue field κ, H=1 and P=1: intrinsic e=1, ambient e_O=0.

For O⊕κ the quotient function is n+2 and P=T+2. Its intrinsic multiplicity
is 1, while e(O)+e(κ)=2. At ambient dimension one, however, the equality is
1=1+0. The nonsplit uniformizer sequence 0→O→O→κ→0 is a second check:
its q-adic quotients are not a short exact sequence. The additivity proof
must use the intersection filtration and Artin–Rees; it cannot assume the
q-adic quotient functor exact.

In A=k[[x,y]]/(xy,y²), every series has a unique normal form f(x)+c y.
The surviving monomials in A/m^(n+1) for n≥1 are 1,x,…,x^n,y,
so H(n)=n+2. At n=0 only 1 survives: H(0)=1 whereas P(0)=2.
The degree-one polynomial gives e(A)=1. The nilpotent ideal (y) is the
unique minimal prime and A/(y)=k[[x]], so dimension is one; x and y
are independent in m/m², so embedding dimension is two and A is not regular.
Ann(y)=m is an embedded associated prime. This is a mathematical normal-form
argument; finite monomial checks are not a Lean proof for formal series.

This also distinguishes formal equidimensionality from unmixedness.
A is already complete and its unique minimal component has full dimension,
but its associated prime m does not. Thus the maintained key brief's
“formally equidimensional (unmixed)” cannot be interpreted as identifying
minimal-prime equidimensionality with unmixedness. The retained Nagata
converse requires every associated prime of the completion to have full
dimension, as in the [Huneke–Yao introduction, p. 2](https://math.gsu.edu/yyao/eprint/regular.pdf).
That author copy quotes Nagata; it does not supply a fresh reading of Nagata's
proof. This clarification concerns the out-of-scope key brief; that file is
unchanged and no published-source erratum is alleged.

The required remaining comparisons are e(A)=1 for regular local A;
Nagata's converse with formal unmixedness; formal plane-curve order and the
smooth/node/cusp/triple-point computations with characteristics and
reducedness explicit; the parameter-ideal bound and Cohen–Macaulay equality
criterion; and completion invariance on actual rings/modules. They are
not asserted established by the finite examples or by the rational coefficient
definition.

### Ownership, source receipts and remaining proof leaves

The maintainer's assign.json reserves the general definition here.
Caro–Pasten's curve application specializes it to the local ring of a curve.
Iyengar–Khare–Manning use multiplicity to eliminate a complementary maximal
Cohen–Macaulay summand in Theorem 9.2. The selected preprint passage only uses
full-dimensional modules and does not independently identify its convention
on lower-dimensional modules; the ambient convention is mandated by the key
brief and is explicitly available here. Breuil–Mézard consumers keep their
special-fiber types and cycle comparisons rather than defining a second
general multiplicity. No automorphic statement is an input to this strand.

RS-08 still imports ModularCurves 4D's local regularity/completion/flatness
interfaces; this strand does not reconstruct them. The previous
regular-local-domain gap is retained: the existence of a Hilbert–Samuel
polynomial alone does not prove gr_m(A) a polynomial ring or A a domain.
The touching atlas stage edges and link-map overlap were screened. No new
coarse-stage dependency is introduced, and the fine-grained prerequisite
graph imports no representability or patching theorem.

The packet retains eleven gap groups, seven new here. They locate the actual
associated-graded/module-to-series construction and cumulative sum,
graded numerical-polynomial induction and antidifference, degree/dimension
and Artin–Rees leading terms, positivity of an eventual nonnegative
polynomial, top-dimensional localized lengths, discriminating geometric
comparisons, and elaboration of the new signatures. Every other stage keeps
its previous coverage worklist, including all routed papers. None is closed.

Fresh source receipts, URLs, download SHA-256 hashes and precise selected
read sections are in the packet. Stacks 10.59 was read through its mathematical
proofs; 10.58.7, 10.52.8, 10.58.5, 10.62.6 and 43.15 were read at the stated
locators. The referenced ring-dimension proof 10.60.9 remains unread.
Iyengar–Khare–Manning is arXiv v3, not a publisher-edition collation; no
whole-paper coverage is claimed. The two near-area upstream documents read
in this session include ReductiveGroups and SemisimpleAlgebras; selected
LocalFieldsRamification contracts were also consulted.

The new suggested forms have not been compiled: this environment has no
existing build at both prescribed pins. The previous worker's compilation
receipt applies only to its earlier version. The file contains real module,
ideal, quotient and rational-polynomial signatures, with explicit missing
formal-series example comparisons, not a record postulating all desired
theorems.

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
