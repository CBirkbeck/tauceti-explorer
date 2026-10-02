# Commutative algebra for deformation theory and patching — part P7

## Scope of this checkpoint

The part comprises P7–P9 and R03.1–R03.5. This partial blueprint retains the existing finite-prime-filtration input of R03.3, adds a five-node refinement of the R03.4 characteristic-zero-point argument, and adds four R03.3 nodes on catenarity and on freeness over a regular local base (Section 5a). Before the continuation in Section 5b, the packet had 46 baseline references and one object definition, the catenary predicate. Section 5b preserves those nine nodes and adds fourteen Hilbert–Samuel nodes; the combined packet has 62 baseline references. The field, quotient, integral-closure and local-field constructions are reused from their existing owners. The stage coverage records retain the remaining work explicitly.

The codex-rtOQ9t continuation in Section 9 adds four R03.3 positivity lemmas to the forty-node checkpoint. At that checkpoint the packet had 44 nodes (24 lemmas, 11 theorems, 7 definitions and 2 constructions), 44 API items, 35 definition/construction unit tests, 11 planets, 99 pinned baseline references, 14 gap groups and 2 supplier requests. Four further typed acceptance examples distinguish the polynomial-sign hypotheses. All eight scoped stages remain partial. The positivity deduction is written conditional on the existing eventual-polynomial construction, whose proof obligations remain open.

Source inspections and compilation reports in Sections 1–8 are inherited receipts from the named earlier workers. Section 9 records the positivity continuation's fresh reads and checks; Section 10 records the cumulative continuation. An earlier file elaborated; the changed file has not been compiled.

The current cumulative continuation in Section 10 adds eight R03.3 nodes and narrows the cumulative-identity and rational-antidifference obligations. The packet has 52 nodes (28 lemmas, 13 theorems, 8 definitions and 3 constructions), 57 API items, 43 definition/construction unit tests plus 4 inherited lemma acceptance tests, 12 planets, 119 baseline references, 14 gap groups and 2 supplier requests. The cumulative polynomial is constructed only conditional on a supplied graded polynomial tail; the associated-graded ring/module structure and graded polynomiality remain gaps. All eight stages remain open: P7, R03.3 and R03.4 are partial; P8, P9, R03.1, R03.2 and R03.5 retain not_read status. All implementations are unchecked.

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

1. The associated-graded ring/module gap supplies gr_q(A), gr_q(M), multiplication, Noetherianity, degree-one ring generation and finite graded-module generation. Its degree-n carrier is the native G_n in graded-hilbert-function; no increasing word-filtration carrier is substituted.

2. The remaining graded numerical-polynomial theorem follows the inspected induction of Stacks 10.58.7: stabilize the largest x-power-torsion submodule, terminate its nilpotent filtration, and prove the shifted degree-one multiplication exact sequences before induction on generators. This supplies Q∈ℚ[T] and N with Q(i)=φ(q,M,i).toNat for i≥N. These are still recorded gaps, not consequences of Polynomial.hilbertPoly.

3. Finite-graded-piece-length validates every coefficient conversion. Apply cumulative-polynomial-from-graded-tail to Q,N: P=S(Q)+Σ_{i<N}(φ(i).toNat−Q(i)) is the cumulative polynomial on n≥N. The new cumulative length and rational summation nodes account for this entire step; the finite initial constant is retained.

4. Uniqueness uses Polynomial.eq_of_infinite_eval_eq on the infinite tail of distinct rational natural-number casts. Finite-adic-quotient-length validates the cumulative values.

Dependencies: `DeformationAndDerivedPatchingAlgebra:R03.3/finite-adic-quotient-length`, `DeformationAndDerivedPatchingAlgebra:R03.3/finite-graded-piece-length`, `DeformationAndDerivedPatchingAlgebra:R03.3/cumulative-polynomial-from-graded-tail`, `mathlib:Polynomial.eq_of_infinite_eval_eq`.

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

3. For another ideal of definition q, compare powers of q and m as in Stacks10.59.4 and10.59.7; polynomial growth in both directions gives the same degree. The nonzero-hilbert-samuel-polynomial node independently rules out the zero polynomial, without using this degree comparison.

4. Use Module.supportDim_eq_bot_iff_subsingleton for the zero branch, not natDegree(0)=0 as a dimension assertion.

Dependencies: `DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-polynomial`, `mathlib:IsNoetherianRing.exists_relSeries_isQuotientEquivQuotientPrime`, `mathlib:Module.supportDim`, `mathlib:Module.supportDim_eq_ringKrullDim_quotient_annihilator`, `mathlib:Module.supportDim_eq_bot_iff_subsingleton`, `DeformationAndDerivedPatchingAlgebra:R03.3/nonzero-hilbert-samuel-polynomial`.

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

Hypotheses. A is a commutative Noetherian local ring with maximal ideal m; q is an ideal with radical q = m. M is a finite A-module; no field, DVR, equidimensionality, completeness, freeness or nonzero hypothesis unless explicitly stated. M is nonzero.

Proof route.

1. Let d=natDegree P. For t a sufficiently large natural integer, all t−i (0≤i≤d) are above the eventual evaluation threshold. top-coefficient-finite-difference expresses e as an integer linear combination of genuine integer quotient lengths, proving integrality.

2. The positive-hilbert-samuel-leading-coefficient node gives a strictly positive leading coefficient via finite positive quotient lengths, nonzero polynomial and the rational natural-tail sign lemma. Multiplication by the positive factorial makes intrinsic multiplicity positive, including the degree-zero case.

3. Combine positive rational value and integrality to obtain a positive natural integer. No primality, reducedness or Cohen–Macaulay hypothesis is introduced.

Dependencies: `DeformationAndDerivedPatchingAlgebra:key/hilbert-samuel-multiplicity`, `DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-degree`, `DeformationAndDerivedPatchingAlgebra:R03.3/top-coefficient-finite-difference`, `DeformationAndDerivedPatchingAlgebra:R03.3/finite-adic-quotient-length`, `DeformationAndDerivedPatchingAlgebra:R03.3/positive-hilbert-samuel-leading-coefficient`.

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

The current packet retains fourteen gap groups. The original seven Hilbert–Samuel proof groups now have six remaining: associated-graded/module-to-series construction and cumulative sum; graded numerical-polynomial induction and antidifference; degree/dimension and Artin–Rees leading terms; top-dimensional localized lengths; discriminating geometric comparisons; and implementation of the signatures. Section 9 supplies the positivity proof deduction conditional on eventual-polynomial existence. It does not close the associated-graded or existence prerequisites. Every other stage retains its worklist and routed papers; none is closed.

Fresh source receipts, URLs, download SHA-256 hashes and precise selected
read sections are in the packet. Stacks 10.59 was read through its mathematical
proofs; 10.58.7, 10.52.8, 10.58.5, 10.62.6 and 43.15 were read at the stated
locators. The referenced ring-dimension proof 10.60.9 remains unread.
Iyengar–Khare–Manning is arXiv v3, not a publisher-edition collation; no
whole-paper coverage is claimed. The two near-area upstream documents read
in this session include ReductiveGroups and SemisimpleAlgebras; selected
LocalFieldsRamification contracts were also consulted.

The Hilbert–Samuel continuation initially had no compilation receipt. The
subsequent P7 continuation elaborated its then-complete suggested file at the
Mathlib pin, with 0 errors and 112 placeholder-proof warnings. That receipt
belongs to SHA-256 `fc04c0a556f75d6164a6db08ff5fa3f86e0a3b651cb1dfd0b1dea8454b5557fc`
and does not cover the four new positivity lemmas or their acceptance examples. It supplies the
canonical local-ring instance on each prime quotient from the pinned
`IsLocalRing.of_surjective'` theorem and removes redundant DVR instances.
No Tau Ceti module is imported; its baseline statements remain source-checked. The file contains real module,
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


## 7. Local minimal complexes and residual detection

This continuation works over an arbitrary commutative local ring for the minimal-complex results. Neither Noetherianity nor completeness is needed for the finite-free algebra. Complete Noetherian coefficient rings used in patching are instances. All earlier multiplicity, catenarity and characteristic-zero-point nodes remain. The thirteen nodes below refine the integrated P7 minimal-model node; they do not close P7 or the other seven stages.

The audited K-projective and homotopy APIs are already present at the pin. Bounded above projective complexes are K-projective; the quotient-to-derived map is bijective on their homotopy classes, and their quasi-isomorphisms are homotopy equivalences. Ordinary coefficient change preserves an actual homotopy equivalence. It does not by itself construct a derived tensor functor. The latter comparison is the explicit missing interface for the derived-object forms below.

Use cohomological grading, d_i:C^i→C^{i+1}, and H^i(K[n])=H^{i+n}(K). Write κ=R/m. A disk D_i(R) has R in degrees i,i+1 and identity differential. In the prototype it uses the existing cone of the identity on the stalk at i+1.

### perfect-object: Perfect complexes

For a commutative ring R, K in the existing DerivedCategory (ModuleCat R) is perfect exactly when there are a cochain complex C, integers a,b, finite projective R-modules C^i in every degree, vanishing C^i outside [a,b], and an isomorphism Q(C) ≅ K in the derived category. No directed quasi-isomorphism from K to a projective representative is required.

Hypotheses. R arbitrary commutative; a localization choice HasDerivedCategory is explicit. No local, complete or Noetherian hypothesis.

1. Use the pinned DerivedCategory.Q and existentially quantify an actual cochain complex, its finite/projective predicates and its termwise interval bound.

Acceptance. A nonzero finite projective module in degree n is perfect. A contractible disk is perfect although its chosen representative has two nonzero terms.

The proposed API is:

- `TauCeti.LocalPerfect.IsPerfect.of_rep`: A bounded finite-projective C makes Q(C) perfect.
- `TauCeti.LocalPerfect.IsPerfect.of_iso`: Perfectness transports along K ≅ L.
- `TauCeti.LocalPerfect.IsPerfect.exists_rep`: A perfect object has a bounded finite-projective representative and an isomorphism Q(C) ≅ K.
- `TauCeti.LocalPerfect.IsPerfect.zero`: The zero derived object is perfect.
- `TauCeti.LocalPerfect.IsPerfect.shift`: All integer shifts preserve perfectness; [a,b] becomes [a−n,b−n] for K[n].

The discriminating tests are:

- `TauCeti.LocalPerfect.perfect_zero`: The zero derived object is perfect.
- `TauCeti.LocalPerfect.perfect_projective_rep`: Q(C) is perfect whenever C is bounded and termwise finite projective.
- `TauCeti.LocalPerfect.perfect_iso_transport`: If K ≅ L, IsPerfect K ↔ IsPerfect L.
- `TauCeti.LocalPerfect.perfect_field_stalk`: For any field k and k-vector space V, the degree-zero stalk V[0] is perfect iff Module.Finite k V. In particular an infinite-dimensional stalk is not perfect.

Sources: [P7-STACKS-0657](https://stacks.math.columbia.edu/tag/0657) — Stable tag 0657; online text read 2026-10-02 (current numbering differs from the January book).

### pseudo-coherent-object: Pseudo-coherent complexes

K in D(R) is pseudo-coherent iff K ≅ Q(F) for a bounded above cochain complex F of finite free R-modules. The terms need not be bounded below. This is affine pseudo-coherence, independent of Noetherianity; bounded coherent cohomology is not substituted as its definition.

Hypotheses. R commutative and a chosen HasDerivedCategory.

1. Quantify an integer upper bound, an actual cochain complex and termwise Module.Finite/Module.Free instances.

Acceptance. Over R=k[ε]/ε², k[0] is pseudo-coherent with the resolution ...→R --ε→ R --ε→R. It is not perfect.

The proposed API is:

- `TauCeti.LocalPerfect.IsPseudoCoherent.of_rep`: Q(F) is pseudo-coherent for bounded above finite free F.
- `TauCeti.LocalPerfect.IsPseudoCoherent.of_iso`: Transport through a derived isomorphism.
- `TauCeti.LocalPerfect.IsPseudoCoherent.exists_rep`: Extract a bounded above finite-free representative.
- `TauCeti.LocalPerfect.IsPseudoCoherent.zero`: The zero derived object is pseudo-coherent.
- `TauCeti.LocalPerfect.IsPseudoCoherent.shift`: Every integer shift preserves pseudo-coherence.

The discriminating tests are:

- `TauCeti.LocalPerfect.pseudo_zero`: The zero object is pseudo-coherent.
- `TauCeti.LocalPerfect.pseudo_free_rep`: Every bounded above finite-free F gives a pseudo-coherent Q(F).
- `TauCeti.LocalPerfect.pseudo_iso_transport`: K ≅ L implies IsPseudoCoherent K ↔ IsPseudoCoherent L.
- `TauCeti.LocalPerfect.pseudo_field_stalk`: Over a field k, V[0] is pseudo-coherent iff Module.Finite k V; boundedness of the stalk alone does not suffice.

Sources: [P7-STACKS-064N](https://stacks.math.columbia.edu/tag/064N) — Stable tag 064N; online text read 2026-10-02 (current numbering differs from the January book).

### minimal-complex: Minimal complexes over local rings

For a local commutative ring (R,m,κ), a cochain complex C is minimal if every differential has image contained in m C^{i+1}. The predicate itself asserts neither finiteness, freeness nor boundedness. On finite-free complexes this is equivalently zero differentials after tensoring with κ, and equivalently all matrix entries lie in m in any chosen bases.

Hypotheses. R local; m is IsLocalRing.maximalIdeal R. Use LinearMap.range and ideal action on the actual ModuleCat carriers.

1. Define IsMinimal C by range(d_i) ≤ m • top; linearity gives the condition at every integer degree.

Acceptance. [R --π→R] over a DVR is minimal, but [R --1→R] is not. The zero complex is minimal.

The proposed API is:

- `TauCeti.LocalPerfect.IsMinimal.iff_residue_d_zero`: Minimality iff the κ-linear base change of each d_i is zero.
- `TauCeti.LocalPerfect.IsMinimal.of_iso`: A strict isomorphism of complexes preserves minimality.
- `TauCeti.LocalPerfect.IsMinimal.zero`: The zero complex is minimal.
- `TauCeti.LocalPerfect.IsMinimal.shift`: Shifts preserve minimality, including the differential sign.
- `TauCeti.LocalPerfect.IsMinimal.iff_matrix`: In finite bases, minimality iff every differential coefficient belongs to m.

The discriminating tests are:

- `TauCeti.LocalPerfect.minimal_zero`: The zero cochain complex is minimal.
- `TauCeti.LocalPerfect.minimal_iff_residue`: IsMinimal C ↔ ∀ i, (d_i).lTensor κ = 0.
- `TauCeti.LocalPerfect.minimal_iso_transport`: C ≅ D as complexes implies IsMinimal C ↔ IsMinimal D.
- `TauCeti.LocalPerfect.minimal_identity_disk`: The cone of the identity on the nonzero stalk R[1] is not minimal (its two-degree differential is a unit). It is nevertheless contractible.

Sources: [P7-STACKS-0BCC](https://stacks.math.columbia.edu/tag/0BCC) — Stable tag 0BCC; online text read 2026-10-02 (current numbering differs from the January book).

### unit-pivot-cancellation: Cancel a unit in a differential

Given a complex of finite free R-modules with chosen finite bases, if an entry of d_i:C^i→C^{i+1} is a unit, there is a strict complex isomorphism C ≅ C′ ⊕ D_i(R), where D_i is the identity disk in degrees i,i+1. The ranks in those two degrees drop by one; all other degrees are unchanged. The disk has an explicit contracting homotopy.

Hypotheses. R any commutative ring; a unit coefficient is required, not merely a nonzero coefficient. No exactness assumption on C.

1. Permute the selected row/column and scale the unit to 1. Use elementary basis operations to eliminate the rest of its column and row.
2. In d_i=diag(1,d′), d_i d_{i−1}=0 forces the incoming component into the selected summand to vanish; d_{i+1} d_i=0 forces the outgoing component to vanish.
3. Restrict the remaining differentials to complements. The inverse elementary operations assemble a complex isomorphism. Contract D_i by the identity map from degree i+1 to i.

Acceptance. Over Z/4, diag(1,2) splits as an identity disk and [R --2→ R]. Multiplication by 2 over Z/4 cannot be canceled: it is nonzero but a nonunit.

Sources: [P7-STACKS-00MT](https://stacks.math.columbia.edu/tag/00MT) — Stable tag 00MT; online text read 2026-10-02 (current numbering differs from the January book).

### minimal-representative: Minimal representatives

For a bounded above finite-free complex C over a local ring there exist a bounded above finite-free minimal complex M and a HomotopyEquiv C M. More precisely C is isomorphic to M plus a locally finite direct sum of identity disks: only finitely many disk summands meet any fixed degree. If C is bounded in [a,b], M has the same termwise bound and the disk sum is finite. The construction is not canonical.

Hypotheses. R local, C termwise finite free and bounded above; no Noetherianity or completeness. Fix bases and cancellation choices; uniqueness of the output is a separate theorem.

1. Starting at the upper bound b, cancel all unit entries of d_{b−1}, then d_{b−2}, and continue downwards. At each step the finite rank of the relevant terms strictly decreases.
2. After a differential has no units, all its coefficients lie in m. Subsequent basis changes preserve this property. Splitting further disks does not introduce coefficients outside m.
3. For every fixed degree only finitely many steps affect it: stages above it are finite in number and stages below i−1 do not change degree i. Assemble the stabilized terms, maps and inverse maps degreewise; this is an algebraic degreewise construction, not an unproved topological inverse limit.
4. The canceled disk family is degreewise finite. Its componentwise identity contraction is a defined map in every degree. Projection and inclusion give HomotopyEquiv C M. In the bounded case the sum of all original ranks bounds the number of cancellations.

Acceptance. C=[R --1→R] has M=0. C=[R --π→R] over a DVR is already minimal; both ranks survive even though only H^0(C) is nonzero. Over k[ε]/ε², the infinite resolution of k stays bounded above and minimal but not bounded below.

The proposed API is:

- `TauCeti.LocalPerfect.minimalRepresentative.exists`: Choose M with termwise finite freeness, upper bound, minimality and a homotopy equivalence C M.
- `TauCeti.LocalPerfect.minimalRepresentative.bounded`: If C vanishes outside [a,b], the chosen M may also vanish outside that interval.
- `TauCeti.LocalPerfect.minimalRepresentative.disk_part`: The discarded part is a locally finite sum of identity disks, with a specified contraction.
- `TauCeti.LocalPerfect.minimalRepresentative.quasiIso`: Its homotopy equivalence is a quasi-isomorphism by the pinned API.
- `TauCeti.LocalPerfect.minimalRepresentative.unique`: Two outputs are strictly isomorphic by minimal-homotopy-equivalence-is-iso.

The discriminating tests are:

- `TauCeti.LocalPerfect.minimal_rep_exists`: A bounded above finite-free C admits a minimal finite-free M and Nonempty (HomotopyEquiv C M).
- `TauCeti.LocalPerfect.minimal_rep_bounded`: For C bounded in [a,b], M can be chosen with IsStrictlyGE a and IsStrictlyLE b.
- `TauCeti.LocalPerfect.minimal_rep_already_minimal`: When C is minimal the identity HomotopyEquiv C C is an admissible representative.

Sources: [P7-STACKS-00MT](https://stacks.math.columbia.edu/tag/00MT) — Stable tag 00MT; online text read 2026-10-02 (current numbering differs from the January book), [P7-STACKS-0BCC](https://stacks.math.columbia.edu/tag/0BCC) — Stable tag 0BCC; online text read 2026-10-02 (current numbering differs from the January book).

### homotopy-residue-equality: Homotopies on minimal complexes vanish residually

For minimal C,D over a local ring, homotopic cochain maps f,g:C→D induce equal κ-linear maps in every degree after residue-field tensoring. This is equality of the residual chain maps, not equality of f and g over R.

Hypotheses. R local; no boundedness or finiteness is used in this statement.

1. The pinned Homotopy equation expresses f_i−g_i as d_D h_i+h_{i+1}d_C. Tensor with κ using Functor.mapHomotopy or the linear tensor-map identities.
2. Every differential is zero residually by minimality, so the residual difference is zero.

Acceptance. On [Z/4 --2→Z/4], maps differing by 2 can be homotopic and unequal over R, although equal modulo 2.

Sources: [P7-STACKS-0BCC](https://stacks.math.columbia.edu/tag/0BCC) — Stable tag 0BCC; online text read 2026-10-02 (current numbering differs from the January book).

### minimal-homotopy-equivalence-is-iso: Uniqueness of minimal complexes

Any homotopy equivalence between termwise finite-free minimal complexes over a local ring has a forward map that is a strict isomorphism of cochain complexes. Consequently two bounded above finite-free minimal complexes representing the same derived object are strictly isomorphic. No uniqueness of the isomorphism is asserted.

Hypotheses. The first assertion needs no bound. The derived-object assertion needs bounded above termwise projective complexes, so the pinned K-projective comparison applies.

1. Apply homotopy-residue-equality to the composites fg and gf. Their residual component maps are mutually inverse in every degree.
2. Apply Module.IsLocalRing.linearCombination_bijective_of_flat in finite bases (or its split-injection form plus residual surjectivity) to each component. A finite-free local map invertible residually is invertible.
3. Assemble component inverses; f_i d_D=d_C f_{i+1} implies the inverse chain identities by multiplying with these inverses.
4. For a derived isomorphism between bounded above projective representatives, use isKProjective_of_projective and Qh_map_bijective, then quasiIso_iff, to obtain the required homotopy equivalence.

Acceptance. A homotopy equivalence 0→[R --1→R] is not a strict isomorphism; minimality is indispensable. The identity and multiplication by any unit congruent to 1 modulo m give distinct isomorphisms of a nonzero stalk complex.

Sources: [P7-STACKS-0BCC](https://stacks.math.columbia.edu/tag/0BCC) — Stable tag 0BCC; online text read 2026-10-02 (current numbering differs from the January book).

### minimal-residual-ranks: Minimal ranks from residual cohomology

For a termwise finite-free minimal complex M, H^i(M⊗_R κ) ≅ M^i⊗_R κ. Thus rank_R(M^i)=dim_κ H^i(M⊗κ). For bounded above C and its minimal representative M, homotopy invariance identifies the right-hand side with H^i(C⊗κ). In particular M^i=0 iff this residual cohomology is zero.

Hypotheses. R local; ordinary termwise tensor of the projective representatives is used. The interpretation as derived base change needs the K-flat comparison recorded separately.

1. Minimality makes both neighboring residual differentials zero; cycles are the whole term and boundaries are zero.
2. Choose a finite basis of M^i and tensor it to a κ-basis, giving equality of rank and dimension. A finite-dimensional vector space has dimension zero iff it is zero; Nakayama then gives M^i=0.
3. Base change a HomotopyEquiv by the pinned mapHomotopyEquiv to preserve residual cohomology.

Acceptance. For [O --π→O] in degrees −1,0 the residual ranks are 1 in both degrees although integral H^(−1)=0. An identity disk has residual cohomology zero and minimal representative zero, despite two nonzero chosen terms.

Sources: [P7-STACKS-0BCC](https://stacks.math.columbia.edu/tag/0BCC) — Stable tag 0BCC; online text read 2026-10-02 (current numbering differs from the January book).

### three-term-residual-splitting: Exactness from a residual three-term complex

For finite-free M⁰,M¹,M² over any local ring R, and maps d₀,d₁ with d₁d₀=0, if im(d₀⊗κ)=ker(d₁⊗κ), then im d₀=ker d₁. Moreover ker d₀ splits in M⁰, im d₀ splits in M¹, and im d₁ splits in M². Exactness here is only at M¹; no injectivity at M⁰ or surjectivity at M² is asserted.

Hypotheses. R arbitrary commutative local, all three modules finite free, and actual composition zero before reduction. No Noetherianity or completeness.

1. Choose a κ-basis of ker(d₁⊗κ), and lift preimages through d₀ to vectors x_j in M⁰. Extend d₀(x_j) to a residual basis of M¹.
2. The resulting finite-free map R^r⊕R^s→M¹ is an isomorphism by the pinned local basis-lifting theorem. Denote the first factor U. It lies in im d₀ and ker d₁.
3. The induced map M¹/U→M² is injective modulo m by residual exactness. Apply split_injective_iff_lTensor_residueField_injective to split it. Therefore ker d₁=U=im d₀ and im d₁ splits in M².
4. The chosen x_j define a section of M⁰→U, so its kernel splits in M⁰. U already splits in M¹ by the basis decomposition.

Acceptance. Over Z/4, d₀(x)=(x,0), d₁(x,y)=y gives the split exact middle and all three summands. The zero maps R→0→R satisfy the hypothesis without either endpoint exactness. Over Z localized at 3 the map multiplication by 2 is invertible; over Z itself, reduction mod 3 of Z --2→Z→0 is exact while the original is not. Locality matters.

Sources: [P7-BP-AUTHOR-2025](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf) — §2.6.5, Lemma 2.6.6 and complete proof, pp.21–22.

### perfect-is-pseudo-coherent: Perfect objects are pseudo-coherent

Every perfect K is pseudo-coherent over an arbitrary commutative ring. A finite-projective representative need not itself have finite-free terms; adding a bounded above locally finite family of contractible disks produces a finite-free representative.

Hypotheses. R commutative; no local hypothesis; the resulting free complex can be unbounded below.

1. Starting at the top, choose a finite-projective complement making the highest projective term finite free.
2. At each lower degree choose a finite-projective complement making C^i plus the complement from degree i+1 finite free. Put the incoming complement identity into the differential.
3. The added complements form contractible disks with only two adjacent terms. The projection to C is a homotopy equivalence degreewise. Use the original derived isomorphism and pseudo-coherent-object.

Acceptance. For a nonfree finite projective module over a nonlocal ring, replacing projective by free in the definition of perfectness without a comparison would lose the object.

Sources: [P7-STACKS-064N](https://stacks.math.columbia.edu/tag/064N) — Stable tag 064N; online text read 2026-10-02 (current numbering differs from the January book).

### residual-perfectness-criterion: Perfectness detected at the residue field

Let K be pseudo-coherent over a local commutative ring R. If K⊗ᴸκ has cohomology only in [a,b], then K is represented by a finite-free complex with terms zero outside [a,b]. In particular K is perfect. Conversely such a representative has residual cohomology only in [a,b].

Hypotheses. R local, K pseudo-coherent and a≤b. Here amplitude for the residue-field object is cohomological amplitude, equal to projective/Tor amplitude over a field. No conclusion from ordinary K cohomology alone.

1. Take a bounded above finite-free F representing K, using pseudo-coherent-object.
2. Choose its minimal representative M. Under the projective derived-base-change comparison, residual-perfectness bounds H^i(F⊗κ).
3. minimal-residual-ranks makes M^i zero for every i outside [a,b]. Finite-free terms and this bound give a perfect representative.
4. Conversely termwise tensor of that representative is zero outside the same interval.

Acceptance. Over k[ε]/ε² the module k is pseudo-coherent but its residue-derived cohomology extends to all negative degrees, so the premise fails. For [O --π→O], the necessary interval is [−1,0], not [0,0].

Sources: [P7-BP-AUTHOR-2025](https://www.imo.universite-paris-saclay.fr/~pilloni/higherhidaSiegel.pdf) — Lemma 2.6.7, p.22, full proof, [P7-STACKS-0BCC](https://stacks.math.columbia.edu/tag/0BCC) — Stable tag 0BCC; online text read 2026-10-02 (current numbering differs from the January book).

### pseudo-coherent-residual-nakayama: Residual Nakayama for pseudo-coherent objects

For a pseudo-coherent K over a local commutative ring, K⊗ᴸκ=0 iff K=0. For a morphism u between pseudo-coherent objects whose cone is pseudo-coherent, residual base change is an isomorphism iff u is an isomorphism. This theorem is not a statement about arbitrary complexes, and does not require derived completeness.

Hypotheses. R local. For the morphism form, explicitly establish pseudo-coherence of the cone; its general triangle closure is still an outstanding P7 proof, not silently assumed.

1. Choose a minimal bounded above finite-free representative. minimal-residual-ranks makes every term zero if every residual cohomology group is zero.
2. The zero representative gives K=0. The reverse implication is functoriality of base change.
3. Apply the object assertion to cone(u), using exactness of derived base change and the existing cone criterion for an isomorphism.

Acceptance. For a DVR O and K=Frac(O)[0], ordinary and derived residual tensor vanish but K is nonzero: the finite/pseudo-coherent hypothesis cannot be dropped. For perfect [O --π→O], rationalization vanishes but reduction modulo π does not; inversion and residue reduction are different tests.

Sources: [P7-STACKS-0BCC](https://stacks.math.columbia.edu/tag/0BCC) — Stable tag 0BCC; online text read 2026-10-02 (current numbering differs from the January book).

### bounded-residual-acyclic-contractible: Residual acyclicity gives a contraction

For a bounded finite-projective C over a local ring, if C⊗κ is acyclic then the identity map of C is homotopic to zero; hence C is acyclic. More generally a map between bounded finite-projective complexes whose residue map is a quasi-isomorphism is a homotopy equivalence.

Hypotheses. R local; finiteness in every degree and boundedness for the stated finite-complex version. Projective terms are finite free by the pinned local theorem.

1. Convert finite projective terms to finite free via Module.Flat.of_projective and free_of_flat_of_isLocalRing.
2. Minimal-representative and minimal-residual-ranks give a zero minimal part. The identity disk part has the explicit contraction already constructed.
3. For a map f, form cone(f), with finite-projective terms and a finite bound, and identify its residue cone with cone(residue f). Residual acyclicity contracts this cone. Use the pinned quasiIso_iff once acyclicity implies f is a quasi-isomorphism.

Acceptance. [R --1→R] contracts but its two terms are nonzero: residual acyclicity is not termwise vanishing. [Z/4 --2→Z/4] does not contract: its residual differential is zero.

Sources: [P7-STACKS-00MT](https://stacks.math.columbia.edu/tag/00MT) — Stable tag 00MT; online text read 2026-10-02 (current numbering differs from the January book), [P7-STACKS-0BCC](https://stacks.math.columbia.edu/tag/0BCC) — Stable tag 0BCC; online text read 2026-10-02 (current numbering differs from the January book).

### Scope and source-version boundaries

The suggested file gives concrete predicates on the pinned carriers, representative-level minimality and contraction signatures, the three-term exactness/splitting theorem, and their APIs and tests. It explicitly identifies signatures that still need generic derived tensor or locally finite disk machinery. No condition is replaced by an arbitrary proposition or a placeholder predicate. The complete suggested file elaborates at the Mathlib pin with 0 errors and 112 placeholder-proof warnings. This checks signatures only; every new mathematical implementation remains unchecked.

The Boxer–Pilloni author PDF is the 65-page November 2025 version, SHA-256 `af70d084612b1b75761694923ef2395752d23b41e0b8b458910d096df4c8c3c6`. The publisher PDF endpoint returned HTML; this is not a publisher-edition collation. Read scopes are p.17 and pp.21–22, including the proofs of Lemmas 2.6.6 and 2.6.7. The accepted paper review supplies E33 (the image summand belongs to M¹) and E26 (pseudo-coherence alone is not compactness). This continuation follows those findings without issuing another review verdict or claiming a newly discovered error.

For E26, the missing ring theorem must keep a single lower bound a for every target E_n: colim Hom(P,E_n)≅Hom(P,colim E_n) for pseudo-coherent P and E_n∈D^{≥a}. A finite perfect approximation Q→P with cone in D^{≤a−2} removes the negative tail for Hom in degree zero and its adjacent degree. Establish finite-perfect compactness and exact filtered-colimit/t-structure compatibility before applying that reduction. Without a common lower bound the infinite resolution of k over k[ε]/ε² and E_n=⊕_{i≤n}k[i] produce direct-sum versus product Hom groups. The affine theorem is decomposed into the four proof nodes below; its implementation and scheme globalization remain explicit obligations; the source’s geometric application stays with its six-functor owner.

Pilloni’s completed infinite-rank minimal complexes use completed free modules R^(I), not products R^I; no finite-free cancellation theorem here supplies that topological construction. The P7 Tor spectral sequence, duality, derived-completion comparison, finite-coefficient inverse limits with retained lim¹ and compatible chain actions remain on the worklist. Generic Milnor/ML comes from ArithmeticGaloisDuality:R02.1 as accepted RS-08 requires. R03.3 imports exactly ModularCurves 4D’s local regularity/completion statements, without interpreting that stage as a complete depth theory.


### The affine uniformly lower-bounded Hom comparison

The affine part of reviewed Boxer–Pilloni E26 can be decomposed without inventing a generic derived-colimit functor. Work with actual filtered diagrams of cochain complexes and their degreewise colimit. ModuleCat is AB5 at the pin, and Tau Ceti already has the R-linear Hom complex with its signed differential. The resulting comparison is on morphisms in the existing derived category.

#### finite-free-tail-approximation

Let F be a bounded above finite-free cochain complex over a commutative ring and let a be an integer. Its brutal truncation Q=σ_{≥a−1}F is bounded finite free. There is a chain map j:Q→F equal to the identity in degrees ≥a−1. Its quotient complex has terms zero in degrees >a−2. For any E with terms zero in degrees <a, precomposition gives a bijection Hom_D(R)(F,E)→Hom_D(R)(Q,E).

Use brutal truncation for the finite approximation, not the smart truncation: the latter has a cokernel term that need not be projective. F upper bounded; E termwise lower bounded.

1. Use the pinned stupidTrunc along embeddingUpIntGE(a−1). The inclusion natural transformation is a TODO in that file, so construct j in P7 by identity/zero components and prove its chain-map equation.
2. Finite free terms and the inherited upper bound make Q perfect. F/Q is strictly ≤a−2.
3. In the Hom cochain groups of degrees −1,0,1, the only possibly nonzero components F^i→E^{i+n} have i≥a−n. These all lie in Q. Precomposition therefore identifies the three groups and both differentials controlling H⁰.
4. Use the pinned HomComplex cohomology-to-homotopy comparison and K-projective-to-derived comparison for F and Q. Both are upper bounded projective complexes. This proves the Hom bijection without postulating a generic RHom functor.

Acceptance. Over dual numbers, truncate the infinite free resolution of k at a−1; it gives the same degree-zero derived Hom into any complex starting in degree a. At cutoff a, the degree-one Hom group can lose its i=a−1 component; the extra term is essential to control the cokernel/cocycle condition.

#### finite-perfect-hom-filtered-colimit

For a bounded finite-projective C and a small filtered diagram E_j of cochain complexes of R-modules, the canonical map colim_j Hom_D(R)(Q(C),Q(E_j))→Hom_D(R)(Q(C),Q(colim_j E_j)) is bijective. The target uses the degreewise complex colimit. No uniform bound on the E_j is needed for this finite source.

R commutative; C termwise finite projective and bounded on both sides; small filtered shape with the required colimits.

1. A finite-projective module P is a summand of R^r. Hom_R(P,−) is correspondingly a natural summand of the r-fold finite product of the target module, so it commutes with filtered colimits.
2. Each degree of the existing linear Hom complex from C is a finite product of those functors: C has a fixed finite interval of nonzero terms. The canonical comparison is an isomorphism of Hom complexes, with the signed differential unchanged.
3. Filtered colimits in ModuleCat are exact by the pinned AB5 instance; taking H⁰ therefore commutes. Use the existing linearHomComplex comparison to Mathlib and its cohomology classes.
4. Use the pinned K-projective comparison to interpret those classes as derived morphisms.

Acceptance. For C=R[0], this is ordinary cohomology commuting with a filtered colimit of module complexes. A bounded complex with an infinite-free term is not enough: Hom from ⊕_nR is an infinite product and can fail to commute with filtered colimits.

#### lower-bounded-target-replacement

For a filtered diagram E_j of module complexes with H^i(E_j)=0 for every i<a and one fixed a, the smart truncations τ_{≥a}E_j form a diagram of complexes strictly supported ≥a. The natural maps E_j→τ_{≥a}E_j are quasi-isomorphisms, as is the induced map on degreewise filtered colimits. The colimit itself has no cohomology below a.

One common a is required for the final strict-bound comparison. No target termwise finiteness or boundedness above. This is an application of existing smart truncation and exact filtered colimits, not a second truncation construction.

1. Use CochainComplex.truncGE, truncGEMap, and quasiIso_πTruncGE_iff. Their functoriality supplies the entire truncated diagram, not separately chosen isomorphic objects.
2. Use ModuleCat AB5 to commute kernels/cokernels and homology with filtered colimits. The colimit of the natural quasi-isomorphisms is a quasi-isomorphism.
3. The truncated diagram has all terms below a zero, so its degreewise colimit has the same strict lower bound.

Acceptance. A family whose lower bounds tend to −∞ does not yield a single strictly lower-bounded colimit. Smart truncation of [R --π→R] at zero has O/π as its boundary term, unlike its brutal truncation.

#### pseudo-coherent-hom-uniform-colimit

Let P be pseudo-coherent over any commutative ring R, and let E_j be a small filtered diagram of module complexes with H^i(E_j)=0 for all i<a, for one common a. Then the canonical map colim_j Hom_D(R)(P,Q(E_j))→Hom_D(R)(P,Q(colim_j E_j)) is bijective. It is natural in P, in the diagram and in compatible diagram maps. In particular every morphism P→Q(colim E_j) factors through some stage; equality of two stage representatives holds at a common later stage.

Pseudo-coherence of P; filteredness and a single uniform cohomological lower bound on every target. No Noetherianity or local hypothesis. The degreewise complex colimit is a model; no arbitrary colimit in a triangulated category is postulated.

1. Choose a bounded above finite-free F representing P, and transport the canonical comparison through that derived isomorphism.
2. Replace the target diagram functorially by smart truncations ≥a using lower-bounded-target-replacement. Its colimit remains quasi-isomorphic to the original one.
3. Apply finite-free-tail-approximation with cutoff a−1. This gives natural Hom bijections from F to its bounded finite-free Q for all truncated stages and their colimit.
4. Apply finite-perfect-hom-filtered-colimit to Q. Naturality identifies the composite with the canonical map for P.
5. Surjectivity is stage factorization; injectivity is eventual equality in a filtered set colimit. This is an equality of morphisms in D(R), not a canonical choice of factor or a strict compatible Hecke action.

Acceptance. Over k[ε]/ε², P=k[0] and E_n=⊕_{i=0}^n k[i] violate the common lower bound. The colimit Hom map is ⊕_i k→∏_i k and misses the all-ones sequence. When P is perfect, finite-perfect-hom-filtered-colimit removes the lower-bound hypothesis. Constant diagrams have their identity Hom comparison; the zero source has the unique zero factorization.

Read the complete proof of [Stacks 0G8W](https://stacks.math.columbia.edu/tag/0G8W), which treats module targets. The extension to complexes is justified above by finite products in the Hom complex and the common lower bound; it is not attributed to Stacks as a verbatim theorem. The general ring theorem is planned here as the issue directs. The scheme/six-functor and solid/discrete comparison remains a separate owner application. No strict coherent action is manufactured from a factorization of a derived morphism.


## 9. Positivity of the cumulative polynomial — codex-rtOQ9t

The common object remains the actual extended module length
`H(q,M,n) = Module.length A (M / q^(n+1)M)` and the previously planned rational cumulative polynomial. The exponent is positive even at n=0. The module may have dimension zero. The reserved general multiplicity definition and its intrinsic/ambient normalization are retained unchanged.

The proof chain separates a sign statement for rational polynomials from local finite-module nonvanishing. It does not assume a degree/dimension formula to prove the polynomial is nonzero. It does not turn positivity into integrality: that is still the separate finite-difference argument in Section 5b.

### R03.3/positive-leading-coefficient-on-natural-tail: Positive leading coefficient from a natural tail

Proposed declaration: `TauCeti.HilbertSamuel.leadingCoeff_pos_of_nat_tail_nonneg`.

Let P∈ℚ[T] be nonzero. If there is N∈ℕ such that P(n)≥0 for every natural n≥N, then leadingCoeff(P)>0. The hypothesis is only on the natural tail, not on every real or rational input; constants are included.

Hypotheses. P is a rational polynomial with P≠0; N is a natural number and all natural n≥N have P(n)≥0.

Proof route.

1. If natDegree P=0, use the pinned constant-polynomial theorem. Evaluation at N makes its constant nonnegative; nonzero leading coefficient makes it positive.

2. For positive natural degree, suppose the leading coefficient is nonpositive. The pinned polynomial theorem gives P(x)→−∞ as rational x→+∞.

3. Compose with the pinned natural-cast limit to get P(n)→−∞. Beyond some natural threshold P(n)<0, contradicting the nonnegative tail at the maximum of the two thresholds.

4. This proves a strict sign, not integrality or an exact evaluation formula. The zero polynomial cannot be admitted.

Dependencies: `mathlib:Polynomial.tendsto_atBot_of_leadingCoeff_nonpos`, `mathlib:tendsto_natCast_atTop_atTop`, `mathlib:Polynomial.eq_C_of_natDegree_eq_zero`, `mathlib:Polynomial.leadingCoeff_ne_zero`, `mathlib:Polynomial.natDegree_pos_iff_degree_pos`.

Acceptance requirements. Positive constants must pass without assuming positive degree. X²−100X is negative at1 but is nonnegative at every natural n≥100; an all-input condition would be too strong. A positive rational leading coefficient need not give integral multiplicity without integer-valued tail data.

- `HilbertSamuelPosTest.constant` (computation): P=C(3/2) has leading coefficient3/2>0; positive degree is unnecessary.
- `HilbertSamuelPosTest.delayed` (computation): P=X²−100X has leading coefficient1, P(1)=−99 and P(n)≥0 for all natural n≥100.
- `HilbertSamuelPosTest.zero` (non-example): The zero polynomial has leading coefficient0 and fails strict positivity despite its nonnegative values everywhere.
- `HilbertSamuelPosTest.rational` (non-example): P=(1/3)X+1 has positive leading coefficient1/3, which is not the rational cast of any integer. Positivity alone supplies no integrality.

These four cases have full native `example` forms in the suggested file. They are additional lemma acceptance examples; they do not change the checker's 35 definition/construction unit-test count.

Sources: [HS-POS-PIN](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Polynomial/Basic.lean), Polynomial/Basic.lean 81–83 and AtTopBot/Archimedean.lean 44–47; Degree/Operations.lean 486–487. An explicit deduction from the actual pinned sign limit and natural-cast limit, with the constant branch treated separately.

### R03.3/positive-finite-adic-length: Positive finite adic quotient lengths

Proposed declaration: `TauCeti.HilbertSamuel.function_toNat_pos`.

For a nonzero finite module M over a Noetherian local A and an ideal q with radical q=m, H(q,M,n).toNat>0 for every n∈ℕ. Both positivity of the actual quotient and its finite length are proved before converting the extended value.

Hypotheses. A is a commutative Noetherian local ring with maximal ideal m; q is an ideal with radical q = m. M is a finite A-module; no field, DVR, equidimensionality, completeness, freeness or nonzero hypothesis unless explicitly stated. M is nonzero.

Proof route.

1. For I=q^(n+1), positive powers satisfy I⊆q⊆m. If I·M=M, the native finite-submodule Nakayama theorem applies to top: I is inside the Jacobson radical of its annihilator by maximalIdeal_le_jacobson. It would make M zero, a contradiction.

2. The native quotient nontriviality criterion makes M/I·M nontrivial. Module.length_pos gives strictly positive extended length.

3. The existing finite-adic-quotient-length node excludes infinity. Only now use ENat.toNat_pos, keeping its two separate premises.

Dependencies: `DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-function`, `DeformationAndDerivedPatchingAlgebra:R03.3/finite-adic-quotient-length`, `mathlib:Ideal.pow_le_self`, `mathlib:Ideal.le_radical`, `mathlib:Submodule.eq_bot_of_eq_ideal_smul_of_le_jacobson_annihilator`, `mathlib:IsLocalRing.maximalIdeal_le_jacobson`, `mathlib:Submodule.Quotient.nontrivial_iff`, `mathlib:Module.length_pos`, `mathlib:ENat.toNat_pos`.

Acceptance requirements. The zero module is excluded; n=0 still gives M/qM, not M/M. Finiteness of M is essential: for a nonfield DVR A and fraction field K, mK=K although K≠0. Extended positive length can be infinity. The finite-length hypothesis is required before toNat.

Sources: [HS-POS-LOCAL](https://stacks.math.columbia.edu/tag/00K4), Opening quotient-length formulas; Definition10.59.8; leading-coefficient paragraph of Lemma10.59.10. The source observes leading-coefficient nonnegativity. The four-node continuation separates Nakayama, finite positive lengths, nonzero polynomial and the precise tail-sign deduction. [HS-POS-NAK](https://stacks.math.columbia.edu/tag/00DV), Lemma10.20.1(2), proof through(1). Apply the already-built local Nakayama theorem to the finite module; no second Nakayama theorem is planned.

### R03.3/nonzero-hilbert-samuel-polynomial: The nonzero cumulative polynomial

Proposed declaration: `TauCeti.HilbertSamuel.polynomial_ne_zero`.

For nonzero finite M under the local ideal-of-definition hypotheses, the chosen cumulative Hilbert–Samuel polynomial P(q,M) is nonzero. This conclusion does not use the degree/support-dimension theorem.

Hypotheses. A is a commutative Noetherian local ring with maximal ideal m; q is an ideal with radical q = m. M is a finite A-module; no field, DVR, equidimensionality, completeness, freeness or nonzero hypothesis unless explicitly stated. M is nonzero.

Proof route.

1. Take the eventual evaluation threshold supplied by hilbert-samuel-polynomial.

2. Evaluate at that natural threshold. positive-finite-adic-length makes the actual natural quotient length strictly positive; its rational cast is positive.

3. The zero polynomial would evaluate to zero there, a contradiction. No associated-graded or dimension theorem is used in this deduction, but the existing polynomial-existence prerequisite retains its open proof obligations.

Dependencies: `DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-polynomial`, `DeformationAndDerivedPatchingAlgebra:R03.3/positive-finite-adic-length`.

Acceptance requirements. A nonzero finite-length module has a nonzero constant polynomial, so positive degree is not imposed. The zero-module polynomial remains zero, with bottom degree/support dimension.

Sources: [HS-POS-LOCAL](https://stacks.math.columbia.edu/tag/00K4), Opening quotient-length formulas; Definition10.59.8; leading-coefficient paragraph of Lemma10.59.10. The source observes leading-coefficient nonnegativity. The four-node continuation separates Nakayama, finite positive lengths, nonzero polynomial and the precise tail-sign deduction.

### R03.3/positive-hilbert-samuel-leading-coefficient: Positive Hilbert–Samuel leading coefficient

Proposed declaration: `TauCeti.HilbertSamuel.polynomial_leadingCoeff_pos`.

For nonzero finite M under the local ideal-of-definition hypotheses, leadingCoeff(P(q,M))>0. This is the sign input to intrinsic multiplicity; it is not the degree comparison or the integrality theorem.

Hypotheses. A is a commutative Noetherian local ring with maximal ideal m; q is an ideal with radical q = m. M is a finite A-module; no field, DVR, equidimensionality, completeness, freeness or nonzero hypothesis unless explicitly stated. M is nonzero.

Proof route.

1. The nonzero-polynomial node supplies P≠0 without invoking its degree.

2. The eventual evaluation API makes P(n) a cast of a natural length on a common natural tail, hence nonnegative there.

3. Apply positive-leading-coefficient-on-natural-tail. Constants, including all nonzero finite-length modules, use its constant branch.

Dependencies: `DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-polynomial`, `DeformationAndDerivedPatchingAlgebra:R03.3/nonzero-hilbert-samuel-polynomial`, `DeformationAndDerivedPatchingAlgebra:R03.3/positive-leading-coefficient-on-natural-tail`.

Acceptance requirements. Dimension-zero modules are included. The ambient multiplicity of a lower-dimensional module may still be zero; this theorem concerns its intrinsic leading coefficient.

Sources: [HS-POS-LOCAL](https://stacks.math.columbia.edu/tag/00K4), Opening quotient-length formulas; Definition10.59.8; leading-coefficient paragraph of Lemma10.59.10. The source observes leading-coefficient nonnegativity. The four-node continuation separates Nakayama, finite positive lengths, nonzero polynomial and the precise tail-sign deduction. [HS-POS-PIN](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Analysis/Polynomial/Basic.lean), Polynomial/Basic.lean 81–83 and AtTopBot/Archimedean.lean 44–47; Degree/Operations.lean 486–487. An explicit deduction from the actual pinned sign limit and natural-cast limit, with the constant branch treated separately.

### Fresh inspection and verification boundary

All eight applicable AUDIT-17 layer entries and the relevant accepted RS-08 ownership decisions were read before this continuation. The complete GrothendieckEulerForms and Multiquadratic upstream documents were read in this continuing session. The actual roadmap extract, its touching stage edges, and the ModularCurves 7D/R03.1 overlap were screened. Generic multiplicity stays in R03.3; this proof imports no automorphic application or new coarse-stage dependency.

The twelve newly registered baseline declaration statements were read at Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, including their ambient parameters. Their precise modules and contracts are in the packet. The existing 87 references and prior P7 receipts are retained; they are not presented as a fresh inspection of all inherited results. [Stacks 00DV](https://stacks.math.columbia.edu/tag/00DV) was read in full; [Stacks 00K4](https://stacks.math.columbia.edu/tag/00K4) was read at the selected quotient-length, definition and leading-coefficient locators. Download hashes and read boundaries are in the three new source records.

The new forms use rational polynomials, actual ideals and module quotients, and `[Nontrivial M]` for nonzero modules. They remain unchecked. No existing combined build at both pinned commits was available, so the changed file was not compiled. No new Lake project, cache download, library build or language server was started. The handoff records the packet, intake, preservation, dependency and exact-arithmetic checks actually run. No formalization or stage closure is claimed.

The partial projection retains a source-registry dependency from `R03.3/free-of-maximal-depth-regular-local` to the integrated `R03.3/depth-auslander-buchsbaum-and-dimension-bounds` node. Normal layer replacement does not render that old input as a stage; the complete packet must carry forward and split it. The handoff distinguishes this inherited limitation from the four new nodes, whose prerequisites all resolve within this packet or the pinned baseline.

## 10. Graded quotient lengths and rational cumulative summation

### Conventions and ownership

The degree-n module is the already built subtype quotient F_n/(q·top_{F_n}), where F_n=q^nM. Its native inclusion into M/q^(n+1)M is injective. The range is the kernel of the native quotient transition to M/q^nM. These maps need not split. This gives the cumulative identity over arbitrary commutative rings, with extended-natural lengths, before any local Noetherian or finite-generation hypothesis is needed.

Use the existing quotient-ring module action. Its scalar formula and the explicit torsion-witness scalar tower justify restricting from A/q to A. The graded Hilbert function is a numerical adapter on these native modules, not a new associated-graded carrier. Tau Ceti's word-filtration associated graded is increasing and does not supply the decreasing adic ring. The entire ring/module structure on the direct sum remains a named obligation.

The rational summation polynomial uses Mathlib's existing Bernoulli polynomials and power-sum identity. It is an auxiliary adapter for Hilbert–Samuel existence, not a second Bernoulli theory or a claim to general abelian-group-valued numerical polynomials. The actual finite initial segment changes its constant. In particular an eventually zero graded polynomial can yield a nonzero constant cumulative polynomial.

### Graded Hilbert quotient-length function

DeformationAndDerivedPatchingAlgebra:R03.3/graded-hilbert-function — definition; unchecked.

Proposed declaration: `TauCeti.HilbertSamuel.gradedFunction`.

For F_n=q^n·top_M, use the native quotient G_n=F_n/(q·top_{F_n}). Define φ(q,M,n)=length_A(G_n) in ℕ∞. The subtype inclusion sends its denominator to q^(n+1)M, so this is the actual length of q^nM/q^(n+1)M. The already existing A/q-module structure on G_n is reused, not newly constructed.

Hypotheses:

- A is a commutative ring, M is an A-module, q is any ideal, and n is a natural number. No finiteness or local hypothesis is imposed unless stated.

Prerequisites:

- `mathlib:Module.length`
- `mathlib:Submodule.powSMulQuotInclusion`
- `mathlib:Module.isTorsionBySet_quotient_ideal_smul`
- `mathlib:Module.Quotient.mk_smul_mk`
- `mathlib:Module.length_eq_of_surjective`
- `mathlib:Module.IsTorsionBySet.isScalarTower`

Proof or construction:

1. Take the existing ideal action, subtype module, submodule quotient and Module.length. The native powSMulQuotInclusion with a=n, b=1, c=n+1 identifies G_n with the kernel of M/q^(n+1)M→M/q^nM; its scalar maps are the native ones.
2. Module.isTorsionBySet_quotient_ideal_smul and the existing quotient module instance supply the A/q action. Module.Quotient.mk_smul_mk checks compatibility with A. Module.length_eq_of_surjective identifies the two lengths when the quotient action is used.

Acceptance:

- Do not replace φ(n) by H(n). Over a DVR they are 1 and n+1 for q=m.
- Keep ∞ as ∞ until finite graded quotient length is established.

API:

- `TauCeti.HilbertSamuel.gradedFunction_eq_length` (characterisation): φ(q,M,n)=length_A(F_n/(q·top_{F_n})) with the native subtype and quotient.
- `TauCeti.HilbertSamuel.gradedFunction_zero` (simp): If M=0 then φ(q,M,n)=0 for every q and n.
- `TauCeti.HilbertSamuel.gradedFunction_zero_degree` (compatibility): φ(q,M,0)=H(q,M,0), via F_0=top_M and the induced quotient equivalence.
- `TauCeti.HilbertSamuel.gradedFunction_congr` (functoriality): An A-linear equivalence M≃N preserves φ(q,-,n) for the same ideal q and every n.
- `TauCeti.HilbertSamuel.gradedFunction_top` (simp): For q=A the raw graded function is identically zero.

Unit tests:

- `HilbertSamuelGradedTest.field_rank` (computation): For a field k, q=0 and M=k^r, φ(0,M,0)=r and φ(0,M,n+1)=0 for every n, including r=0.
- `HilbertSamuelGradedTest.dvr_power` (computation): For a DVR O and q=m^s with s>0, φ(q,O,n)=s for every n, not s(n+1).
- `HilbertSamuelGradedTest.zero` (degenerate): For the zero A-module, φ(q,0,n)=0 for any q and n.
- `HilbertSamuelGradedTest.infinite` (non-example): For A=ℤ, M=ℤ and q=0, φ(q,M,0)=∞ and φ(q,M,n+1)=0. Its cumulative extended length is still ∞; applying toNat before finiteness would destroy that information.

Uses:

- Stacks §10.59 opening and Proposition 10.59.5: Distinguish coefficient lengths from the cumulative function and supply the exact-sequence summation.
- R03.3/eventual-hilbert-samuel-polynomial: State the precise remaining graded polynomiality contract on actual quotient modules.

Sources:

- [STACKS-HS](https://stacks.math.columbia.edu/tag/00K4), §10.59 opening formulas, ideal-of-definition variant, and Proposition 10.59.5: “ideal of definition”. Use the actual graded quotient lengths and their cumulative sum; the graded and cumulative polynomials have different indexing.
- [HS-CUMUL-PIN](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Quotient/PowTransition.lean), PowTransition.lean, powSMulQuotInclusion and factorPowSucc; Length.lean, length_eq_add_of_exact: “The canonical inclusion”. Native inclusion and quotient-transition maps give a genuine exact sequence; no splitting or associated-graded direct-sum carrier is assumed.


### Length of one adic quotient transition

DeformationAndDerivedPatchingAlgebra:R03.3/adic-quotient-length-step — lemma; unchecked.

Proposed declaration: `TauCeti.HilbertSamuel.quotient_length_succ`.

Put L_n=length_A(M/q^nM), so L_0=0. For every n, L_(n+1)=φ(q,M,n)+L_n in ℕ∞, with no finite-length hypothesis. This comes from 0→G_n→M/q^(n+1)M→M/q^nM→0.

Hypotheses:

- A is a commutative ring, M is an A-module, q is any ideal, and n is a natural number. No finiteness or local hypothesis is imposed unless stated.

Prerequisites:

- `DeformationAndDerivedPatchingAlgebra:R03.3/graded-hilbert-function`
- `mathlib:Submodule.powSMulQuotInclusion_injective`
- `mathlib:Submodule.range_powSMulQuotInclusion`
- `mathlib:Submodule.powSMulQuotInclusion_mk`
- `mathlib:Submodule.factorPowSucc`
- `mathlib:Submodule.ker_mapQ`
- `mathlib:Submodule.factor_surjective`
- `mathlib:Module.length_eq_add_of_exact`

Proof or construction:

1. Set j_n=Submodule.powSMulQuotInclusion for a=n, b=1, c=n+1 and N=top; simplify q^1=q. Set π_n=Submodule.factorPowSucc q M n. The inclusion sends the class of x∈F_n to its class in M/q^(n+1)M.
2. The native inclusion theorem gives injectivity and range(j_n)=F_n.map(mkQ F_(n+1)). Submodule.ker_mapQ applied to the identity map gives this same submodule as ker(π_n). Submodule.factor_surjective gives surjectivity. Hence the range/kernel criterion gives Function.Exact j_n π_n.
3. Apply Module.length_eq_add_of_exact. No section, direct-sum decomposition or finite natural subtraction is used.

Acceptance:

- For M=ℤ/4 and q=(2), the n=1 transition has length 2=1+1 but is nonsplit as an ℤ-module sequence.
- At n=0 the right-hand quotient is M/M, and the equation is H(0)=φ(0)+0.

Sources:

- [STACKS-HS](https://stacks.math.columbia.edu/tag/00K4), §10.59 opening formulas, ideal-of-definition variant, and Proposition 10.59.5: “ideal of definition”. Use the actual graded quotient lengths and their cumulative sum; the graded and cumulative polynomials have different indexing.
- [HS-CUMUL-PIN](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Quotient/PowTransition.lean), PowTransition.lean, powSMulQuotInclusion and factorPowSucc; Length.lean, length_eq_add_of_exact: “The canonical inclusion”. Native inclusion and quotient-transition maps give a genuine exact sequence; no splitting or associated-graded direct-sum carrier is assumed.


### Cumulative length is the sum of graded lengths

DeformationAndDerivedPatchingAlgebra:R03.3/cumulative-graded-length — theorem; unchecked.

Proposed declaration: `TauCeti.HilbertSamuel.function_eq_sum_graded`.

For every commutative ring A, A-module M, ideal q and n≥0, H(q,M,n)=Σ_{i=0}^n φ(q,M,i) in ℕ∞. The finite sum includes i=0 and i=n.

Hypotheses:

- A is a commutative ring, M is an A-module, q is any ideal, and n is a natural number. No finiteness or local hypothesis is imposed unless stated.

Prerequisites:

- `DeformationAndDerivedPatchingAlgebra:R03.3/graded-hilbert-function`
- `DeformationAndDerivedPatchingAlgebra:R03.3/adic-quotient-length-step`
- `DeformationAndDerivedPatchingAlgebra:R03.3/hilbert-samuel-function`

Proof or construction:

1. Start at L_0=length(M/M)=0. Induct on n using adic-quotient-length-step and the finite-sum recursion.
2. Identify L_(n+1) with the existing H(q,M,n). Associativity and commutativity of extended-natural addition suffice even when a graded length is infinite.

Acceptance:

- For a field and q=0, only degree zero contributes, so the cumulative value is rank(M), not zero.
- For ℤ and q=0 the degree-zero ∞ survives every cumulative sum.

Sources:

- [STACKS-HS](https://stacks.math.columbia.edu/tag/00K4), §10.59 opening formulas, ideal-of-definition variant, and Proposition 10.59.5: “ideal of definition”. Use the actual graded quotient lengths and their cumulative sum; the graded and cumulative polynomials have different indexing.


### Finiteness of each graded quotient length

DeformationAndDerivedPatchingAlgebra:R03.3/finite-graded-piece-length — lemma; unchecked.

Proposed declaration: `TauCeti.HilbertSamuel.gradedFunction_ne_top`.

Under the local Noetherian finite-module hypotheses and radical(q)=m, φ(q,M,n)≠∞ for every n.

Hypotheses:

- A is a commutative Noetherian local ring with maximal ideal m, M is a finite A-module, and radical(q)=m.

Prerequisites:

- `DeformationAndDerivedPatchingAlgebra:R03.3/graded-hilbert-function`
- `DeformationAndDerivedPatchingAlgebra:R03.3/finite-adic-quotient-length`
- `mathlib:Submodule.powSMulQuotInclusion_injective`
- `mathlib:Module.length_le_of_injective`

Proof or construction:

1. The native inclusion j_n:G_n→M/q^(n+1)M is injective. Module.length_le_of_injective bounds φ(n) by H(n).
2. The existing finite-adic-quotient-length node proves H(n)≠∞. The order bound gives φ(n)≠∞. This argument does not require an associated-graded ring, Hilbert–Serre theorem, or polynomial-existence node.

Acceptance:

- The zero module is allowed.
- For ℤ with q=0 the local ideal-of-definition hypotheses fail; φ(0)=∞ is not coerced to zero.

Sources:

- [STACKS-HS](https://stacks.math.columbia.edu/tag/00K4), §10.59 opening formulas, ideal-of-definition variant, and Proposition 10.59.5: “ideal of definition”. Use the actual graded quotient lengths and their cumulative sum; the graded and cumulative polynomials have different indexing.
- [HS-CUMUL-PIN](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Quotient/PowTransition.lean), PowTransition.lean, powSMulQuotInclusion and factorPowSucc; Length.lean, length_eq_add_of_exact: “The canonical inclusion”. Native inclusion and quotient-transition maps give a genuine exact sequence; no splitting or associated-graded direct-sum carrier is assumed.


### Finite cumulative length conversion

DeformationAndDerivedPatchingAlgebra:R03.3/cumulative-natural-length — lemma; unchecked.

Proposed declaration: `TauCeti.HilbertSamuel.function_toNat_eq_sum_graded`.

If φ(q,M,i)≠∞ for every i, then H(q,M,n).toNat=Σ_{i=0}^n φ(q,M,i).toNat for every n. In particular this applies under the local Noetherian finite-module ideal-of-definition hypotheses, by finite-graded-piece-length.

Hypotheses:

- A is a commutative ring, M is an A-module, q is any ideal, and n is a natural number. No finiteness or local hypothesis is imposed unless stated.
- Every graded length is finite; the theorem also accepts this directly as a hypothesis outside the local regime.

Prerequisites:

- `DeformationAndDerivedPatchingAlgebra:R03.3/cumulative-graded-length`
- `mathlib:ENat.toNat_add`

Proof or construction:

1. Use cumulative-graded-length. Inductively each finite partial sum in ℕ∞ is finite.
2. Apply ENat.toNat_add only after proving both summands finite at that step. Iterate the identity; natural and rational cast sums are routine.

Acceptance:

- The excluded ℤ,q=0 example has an infinite degree-zero term, so toNat(∞)=0 is not a proof of this finite-length conversion.
- For a DVR with q=m^s, obtain H(n).toNat=(n+1)s.

Sources:

- [STACKS-HS](https://stacks.math.columbia.edu/tag/00K4), §10.59 opening formulas, ideal-of-definition variant, and Proposition 10.59.5: “ideal of definition”. Use the actual graded quotient lengths and their cumulative sum; the graded and cumulative polynomials have different indexing.


### Normalized rational summation polynomial

DeformationAndDerivedPatchingAlgebra:R03.3/summatory-polynomial — construction; unchecked.

Proposed declaration: `TauCeti.HilbertSamuel.summatoryPolynomial`.

For P∈ℚ[T], define S(P)=Σ_{j∈support(P)} (coeff_j(P)/(j+1))·(B_(j+1)(T+1)−B_(j+1)(0)), where B_j is the existing Mathlib Bernoulli polynomial. This normalization sums P(0),…,P(n), not P(1),…,P(n), and has S(P)(−1)=0.

Hypotheses:

- P is a rational polynomial. The positive denominator j+1 is inverted in ℚ, not in a general coefficient ring.

Prerequisites:

- `mathlib:Polynomial.bernoulli`
- `mathlib:Polynomial.bernoulli_eval_zero`
- `mathlib:Polynomial.bernoulli_comp_one_add_X`
- `mathlib:Polynomial.eq_of_infinite_eval_eq`

Proof or construction:

1. Use Polynomial.bernoulli, polynomial substitution, rational constants and a finite coefficient-support sum. No Bernoulli object or binomial-polynomial structure is newly planned.
2. The native bernoulli_eval_zero fixes the normalization. The native power-sum theorem and coefficient expansion supply the separately named evaluation lemma. The native bernoulli_comp_one_add_X verifies the forward difference.
3. For uniqueness among polynomials with the same forward difference and value at −1, compare evaluations recursively at 0,1,… and use the pinned infinite-evaluation equality theorem. This is an API characterization, not an assumption used to define S.

Acceptance:

- S(1)=T+1, S(T)=T(T+1)/2 and S(0)=0.
- S(P)(−1)=0 fixes the arbitrary constant before the actual filtration initial segment is restored.

API:

- `TauCeti.HilbertSamuel.summatoryPolynomial_eq` (characterisation): S(P) is the displayed finite sum of Bernoulli substitutions with coefficient_j(P)/(j+1).
- `TauCeti.HilbertSamuel.summatoryPolynomial_zero` (simp): S(0)=0.
- `TauCeti.HilbertSamuel.summatoryPolynomial_add` (functoriality): S(P+Q)=S(P)+S(Q) for rational polynomials P and Q.
- `TauCeti.HilbertSamuel.summatoryPolynomial_smul` (functoriality): For c∈ℚ and P∈ℚ[T], S(c·P)=c·S(P).
- `TauCeti.HilbertSamuel.summatoryPolynomial_C` (simp): For c∈ℚ, S(c)=c(T+1).
- `TauCeti.HilbertSamuel.summatoryPolynomial_eval_neg_one` (simp): S(P)(−1)=0 for every P.
- `TauCeti.HilbertSamuel.summatoryPolynomial_difference` (relation): S(P)(T+1)−S(P)(T)=P(T+1) as rational polynomials.
- `TauCeti.HilbertSamuel.summatoryPolynomial_unique` (characterisation): If R(−1)=0 and R(T+1)−R(T)=P(T+1), then R=S(P).

Unit tests:

- `HilbertSamuelSumTest.zero` (degenerate): S(0)=0, including evaluation at every natural number.
- `HilbertSamuelSumTest.one` (computation): S(1)=T+1 and S(1)(0)=1.
- `HilbertSamuelSumTest.linear` (computation): S(T)=T(T+1)/2; in particular S(T)(3)=6.
- `HilbertSamuelSumTest.normalization` (non-example): For P=1, the polynomial T has the same forward difference as S(P), but T(−1)=−1 and T(0)=0; it is not S(P).

Uses:

- Stacks Proposition 10.59.5 and Lemma 10.58.5: Convert eventual rational graded polynomiality into cumulative polynomiality while retaining the initial constant.
- Pinned sum_range_pow_eq_bernoulli_sub: Reuse the existing power-sum theorem for a finite coefficient expansion; do not re-plan Bernoulli arithmetic owned by other consumers.

Sources:

- [HS-SUM-PIN](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/BernoulliPolynomials.lean), BernoulliPolynomials.lean, bernoulli, bernoulli_eval_zero, sum_range_pow_eq_bernoulli_sub: “The Bernoulli polynomials are defined in terms of the negative Bernoulli numbers.”. The proposed rational summation adapter uses the pinned Bernoulli convention and the existing power-sum theorem, rather than planning Bernoulli polynomials again.
- [STACKS-ANTIDIFFERENCE](https://stacks.math.columbia.edu/tag/00JZ), Lemma 10.58.5, complete proof: “eventually constant”. Retain the constant contributed by the finite initial segment. The rational Bernoulli adapter supplies the polynomial summation needed here; this does not replace the general abelian-group-valued numerical-polynomial theory.


### Evaluation of the rational summation polynomial

DeformationAndDerivedPatchingAlgebra:R03.3/summatory-polynomial-evaluation — lemma; unchecked.

Proposed declaration: `TauCeti.HilbertSamuel.summatoryPolynomial_eval`.

For every P∈ℚ[T] and n≥0, S(P)(n)=Σ_{i=0}^n P(i) in ℚ.

Hypotheses:

- P is a rational polynomial and n a natural number.

Prerequisites:

- `DeformationAndDerivedPatchingAlgebra:R03.3/summatory-polynomial`
- `mathlib:Polynomial.as_sum_support_C_mul_X_pow`
- `mathlib:Polynomial.sum_range_pow_eq_bernoulli_sub`
- `mathlib:Polynomial.bernoulli_eval_zero`
- `mathlib:Polynomial.eval_comp`

Proof or construction:

1. Expand P as Σ_{j∈support(P)} coeff_j(P)T^j using Polynomial.as_sum_support_C_mul_X_pow, and evaluate the finite sum.
2. For each j apply Polynomial.sum_range_pow_eq_bernoulli_sub at n+1. Divide by the nonzero rational j+1 and identify the constant B_(j+1)(0) using bernoulli_eval_zero. Evaluate the substituted polynomial using eval_comp.
3. Interchange the two finite sums and factor the rational coefficients. Recombine the coefficient expansion at each i.

Acceptance:

- For P=1 the sum is n+1, including the i=0 term.
- For P=T and n=3 the value is 0+1+2+3=6.

Sources:

- [HS-SUM-PIN](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/BernoulliPolynomials.lean), BernoulliPolynomials.lean, bernoulli, bernoulli_eval_zero, sum_range_pow_eq_bernoulli_sub: “The Bernoulli polynomials are defined in terms of the negative Bernoulli numbers.”. The proposed rational summation adapter uses the pinned Bernoulli convention and the existing power-sum theorem, rather than planning Bernoulli polynomials again.


### Cumulative polynomial from a graded polynomial tail

DeformationAndDerivedPatchingAlgebra:R03.3/cumulative-polynomial-from-graded-tail — theorem; unchecked.

Proposed declaration: `TauCeti.HilbertSamuel.cumulativePolynomial_from_graded_tail`.

Assume every φ(q,M,i) is finite, and choose Q∈ℚ[T] and N≥0 such that Q(i)=φ(q,M,i).toNat for all i≥N. Set c_N=Σ_{i=0}^{N−1}(φ(q,M,i).toNat−Q(i)) in ℚ, with the sum empty when N=0. Then for every n≥N, (S(Q)+c_N)(n)=H(q,M,n).toNat. All subtractions in c_N take place after rational casts, never as truncated natural subtraction.

Hypotheses:

- A is a commutative ring, M is an A-module, q is any ideal, and n is a natural number. No finiteness or local hypothesis is imposed unless stated.
- All graded lengths are finite. Q is supplied with its eventual graded-value equality from N onwards; existence of such Q is not asserted by this theorem.

Prerequisites:

- `DeformationAndDerivedPatchingAlgebra:R03.3/graded-hilbert-function`
- `DeformationAndDerivedPatchingAlgebra:R03.3/cumulative-natural-length`
- `DeformationAndDerivedPatchingAlgebra:R03.3/summatory-polynomial-evaluation`

Proof or construction:

1. Use cumulative-natural-length and cast its sum to ℚ. Split the sum over 0,…,n into 0,…,N−1 and N,…,n.
2. On the latter interval replace φ(i).toNat by Q(i). The difference of the two full sums is exactly c_N, since n≥N. The finite-range splitting and regrouping are ordinary finite-sum algebra.
3. Apply summatory-polynomial-evaluation to the full sum of Q. Thus S(Q)+c_N has the required eventual cumulative evaluations. No assumption about gr_q(A), graded generation or Hilbert–Serre is hidden here.

Acceptance:

- If φ(0)=1, φ(1)=2 and φ(i)=1 for i≥2, take Q=1,N=2,c_N=1: the cumulative polynomial is T+2, not T+1. At n=0 its value 2 is not the actual cumulative length 1.
- For N=0 the correction is zero. For an eventually zero graded function the cumulative polynomial is a constant, not necessarily zero.
- For φ(0)=3 and φ(i)=1 for i≥1, Q=1,N=1 gives c_N=2 and the cumulative polynomial T+3.
- If φ(0)=1 and φ(i)=3 for i≥1, take Q=3,N=1,c_N=−2: the cumulative polynomial is 3T+1. Truncated natural subtraction would incorrectly set the correction to zero.

Sources:

- [STACKS-HS](https://stacks.math.columbia.edu/tag/00K4), §10.59 opening formulas, ideal-of-definition variant, and Proposition 10.59.5: “ideal of definition”. Use the actual graded quotient lengths and their cumulative sum; the graded and cumulative polynomials have different indexing.
- [STACKS-ANTIDIFFERENCE](https://stacks.math.columbia.edu/tag/00JZ), Lemma 10.58.5, complete proof: “eventually constant”. Retain the constant contributed by the finite initial segment. The rational Bernoulli adapter supplies the polynomial summation needed here; this does not replace the general abelian-group-valued numerical-polynomial theory.
- [HS-SUM-PIN](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/BernoulliPolynomials.lean), BernoulliPolynomials.lean, bernoulli, bernoulli_eval_zero, sum_range_pow_eq_bernoulli_sub: “The Bernoulli polynomials are defined in terms of the negative Bernoulli numbers.”. The proposed rational summation adapter uses the pinned Bernoulli convention and the existing power-sum theorem, rather than planning Bernoulli polynomials again.

### Current closure boundary and source receipts

The cumulative-existence node in Section 5b consumes finite graded lengths and the conditional graded-to-cumulative theorem. Its unchanged mathematical output still has open proof inputs: the associated-graded ring/module structure and graded numerical-polynomial induction. The two narrowed gap groups are:

- Associated-graded ring/module structure and graded finiteness: The native degree pieces, quotient scalar actions, transition maps, coefficient-length finiteness and cumulative identity are now accounted for by the new nodes and baselineCoverage. What remains is constructing the decreasing-adic direct-sum ring gr_q(A) and module gr_q(M), multiplication and action well-definedness, degree-zero identification, degree-one ring generation, Noetherianity and finite graded-module generation. Tau Ceti's increasing word-filtration AssociatedGraded is not a direct supplier. Inspect the pinned Rees algebra and graded-ring interfaces before adding carriers; neither a rational-series Hilbert polynomial nor the new summation adapter supplies this structure.

- Graded numerical-polynomial induction: The rational antidifference needed by the cumulative existence theorem is now supplied by summatory-polynomial and its evaluation lemma, with the finite initial constant restored by cumulative-polynomial-from-graded-tail. Remaining: decompose Stacks 10.58.7 into x-torsion stabilization, its nilpotent filtration, shifted degree-one multiplication exact sequences and induction on degree-one generators, with actual graded lengths. The new theorem assumes a graded polynomial tail; it does not prove one exists. No general abelian-group-valued numerical-polynomial API or K0 surrogate is claimed.

Fresh source inspection covers the pinned adic transition/inclusion file, the selected native quotient, length, torsion-action and finite-conversion statements, and the Bernoulli power-sum and polynomial-expansion statements listed in HS-CUMUL-PIN and HS-SUM-PIN. Stacks [00K4](https://stacks.math.columbia.edu/tag/00K4) and [00JZ](https://stacks.math.columbia.edu/tag/00JZ) were reread at the cited passages; downloaded HTML hashes are `e3d86d2fc7e6a9df48e73e4e8d12629cdb08f9e0fb9d15e35472d7bc21629932` and `9e111a9d48c6a3bb8ede444e6f7e92c4b4bd0ec28898427bea06b1da4e6dccf8`.

No fresh full rereading of all inherited deformation or P7 papers is claimed. Their sources, source issues, supplier requests and remaining stage targets are retained. The only inherited mathematical node refined is the cumulative-existence proof route. Forty-three inherited nodes are unchanged. The changed suggested file is not compiled: no existing pinned build was available, and no build, cache download or language server was started. Historical successful compilation receipts do not cover these forms.
