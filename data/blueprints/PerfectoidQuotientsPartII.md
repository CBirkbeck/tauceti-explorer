# Perfectoid quotients and their prismatic prerequisites, Part II: structure of integral perfectoid rings and the ind-syntomic André lemma

This roadmap extends PerfectoidQuotients. That roadmap's Layer 0 proves the decomposition of an integral perfectoid ring
`A` along its `ϖ`-power torsion, `p`-integral closure and the perfectoid completion of `p`-integral closures, the
completed root-polynomial algebras, tensor products, root-stable quotients, products and sharp-ideal completions, and the
completed étale and henselian extensions; its Layer 1 refines André's cover modulo `p`. This Part II starts there and
continues the parent's layer numbering with Q5–Q10.

It answers three questions. What does the tilt remember about an integral perfectoid ring with torsion? The ring modulo
`ϖ^p`, its `ϖ`-torsion as an `A_inf`-module, its completeness, whether it is a valuation ring and its value group, and
whether its fraction field is algebraically closed (Q5, Q6). How far can André's lemma be pushed without completions? To
a faithfully flat, ind-syntomic, `ϖ`-Henselian extension in which every monic polynomial acquires a root with compatible
`p`-power roots modulo a `ϖ`-divisible ideal (Q7–Q9, after Česnavičius–Scholze Theorem 2.3.4). What does this give for
complete regular local rings? Perfectoid faithfully flat covers, by explicit towers or by perfecting a prism, and the
almost vanishing of `Tor` along finite subextensions of the absolute integral closure that Bhatt and Scholze derive from
almost purity along an arbitrary ideal (Q10).

The final results are Česnavičius–Scholze's Proposition 2.1.4 (fibre products), Proposition 2.1.9 (relative tilting with
completeness and valuation rings), Proposition 2.1.12 (torsion-free presentations, with compatible roots), Lemmas
2.3.1–2.3.2 (approximation and nilpotence), Theorem 2.3.4 (the ind-syntomic André lemma), Corollary 2.3.7 (semiperfectoid
covers of `p`-Zariski rings) and Lemma 3.1.1 (towers), and Bhatt–Scholze's Remarks 3.11 and 10.13.

## Scope and boundaries

- **Imported from PerfectoidQuotients.** The decomposition `A ≅ Ā ×_{(Ā/ϖ)_red} (A/ϖ)_red` and reducedness (§0.4),
  `p`-integral closure, its injectivity criterion and the perfectoid completion of `p`-integral closures (§0.5),
  completed root polynomials, tensor products, root-stable quotients, products and sharp-ideal completions, and completed
  étale and henselian extensions (§0.6; Česnavičius–Scholze §§2.1.2–2.1.3, Corollary 2.1.6, §2.1.7, Propositions 2.1.8 and
  2.1.11). Their atlas node ids are cited under *Needs*.
- **Imported from PerfectoidSpaces.** The integral perfectoid predicate `IsIntegralPerfectoid` with the Frobenius
  bijections `A/ϖ → A/ϖ^p` and compatible roots of unit multiples of `ϖ` and `p` (P1.24), the comparison with perfectoid
  Tate rings (P1.25), the tilt of a perfectoid field and tilting of finite extensions with `K` algebraically closed iff
  `K^♭` is (P1, P3.7), André's `p`-completely faithfully flat cover (P4.15.4), and the regular towers of Česnavičius
  (P7.16a, P7.17).
- **Imported from PrismaticCohomology.** δ-rings, distinguished elements, prisms, their perfection and the equivalence of
  perfect prisms with integral perfectoid rings (PR.0; upstream PerfectoidSpaces P4.15.2), and, from PrismaticCohomology,
  Part I §§2.30–2.31, the perfectoidization of integral algebras over a perfectoid ring and almost purity along an
  arbitrary finitely generated ideal (Bhatt–Scholze Proposition 8.5, Corollaries 8.11–8.12, §10). None of these is planned
  again.
- **Imported from elsewhere.** Syntomic morphisms (Tau Ceti StableReduction Layer 1); henselizations of pairs and
  ind-étale algebras (SchemeAndStackFoundations §§0.12–0.13); Kunz's theorem that Frobenius of a regular noetherian
  `𝔽_p`-algebra is flat (EnhancedDerivedSheaves §E1.6); Bhatt's flatness criterion over a noetherian base
  (DerivedDeRhamCohomology DD.1); continuous points of valuation spectra, Wedhorn's description of them through an ideal
  of definition and his valuative criterion for integrality over an open subring (pinned Tau Ceti library).
- **Downstream.** PurityForFlatCohomology (Česnavičius–Scholze §§3, 6) uses the towers, the André lemma and the
  semiperfectoid covers; the Scheme-and-stack-foundations Part II (flat cohomology, pro-fppf sites) imports the ind-fppf
  and ind-syntomic maps of Q7; ArcTopologyAndDescent's tilting of complete arc covers may use the valuation-ring results
  of Q6. Arc covers and the algebraic tilting of étale cohomology (Česnavičius–Scholze §2.2) are ArcTopologyAndDescent.
  Purity for flat cohomology itself is not a target.

## Conventions

Fix a prime `p`. Rings are commutative and unital; the zero ring is allowed unless excluded. Completeness is classical:
`A → lim_n A/I^nA` is bijective. The tilt is `A^♭ = lim_{x ↦ x^p} A/pA`, Mathlib's `PreTilt A p`; for `p`-adically
complete `A` the multiplicative map `a ↦ a^♯` is Mathlib's `PreTilt.untilt`, `A_inf(A) = W(A^♭)` and `θ : A_inf(A) → A` is
Mathlib's `WittVector.fontaineTheta`. *Perfectoid* means integral perfectoid in the sense of BMS1 Definition 3.5, the
predicate of PerfectoidSpaces P1.24: there is `ϖ` with `ϖ^p | p` and `A` `ϖ`-adically complete, `θ` is surjective and its
kernel is principal. For such `A` and `ϖ`, `ϖ^♭ ∈ A^♭` denotes an element whose sharp is a unit multiple of `ϖ`; only the
ideal it generates is canonical. `ξ = (ξ_0, ξ_1, …)` denotes a generator of `ker θ` in Witt coordinates; `ξ_1` is a unit
and one may take `p^♭ = ξ_0`. For a module `M` and `a ∈ A`, `M[a]` is the `a`-torsion and `M[a^∞]` the `a`-power torsion
(Česnavičius–Scholze write `M⟨a⟩`, `M⟨a^∞⟩`).

A valuation on a ring `A` carrying the `ϖ`-adic topology, with `|A| ≤ 1`, is *continuous* when the powers of `|ϖ|` become
smaller than every element of its value group (Q8.1 compares this with Tau Ceti's continuity of points of `Spv A`).
*Monic* polynomials whose roots are asserted have positive degree. `A[T^{1/p^∞}]` is the polynomial algebra on compatible
`p`-power roots of `T`; an element of `B[T^{1/p^∞}]` is monic of degree `d ∈ ℤ[1/p]_{≥0}` if it is `T^d` plus lower
terms. `W(k)⟦x^{1/p^∞}⟧` is the colimit of the power-series rings in `x^{1/p^m}`, without a further completion. A regular
local ring is *unramified* if it has mixed characteristic `(0, p)` and `p ∉ 𝔪²`. `R⁺` is the integral closure of a
domain `R` in an algebraic closure of its fraction field.

Page numbers refer to the arXiv versions listed under References, whose page numbering is that of the PDF; the published
versions in the Annals of Mathematics were not read.

## How to read the build

Q5 and Q6 are commutative algebra of integral perfectoid rings; Q6's torsion-free presentations feed the reduction step
of the André lemma. Q7 and Q8 are independent of each other: Q7 is general commutative algebra, Q8 is about continuous
valuations. Q9 combines Q5–Q8 with PerfectoidQuotients Layer 0 into the André lemma and its corollary. Q10 uses
PerfectoidSpaces P7, the prism perfection of PrismaticCohomology PR.0 and the almost purity of PrismaticCohomology, Part I.

[Suggested.lean](../suggested/PerfectoidQuotientsPartII.lean) types the statements whose carriers exist at the pins:
the inverse-limit description of the tilt, the tilt of a complete valuation ring, completeness of its localizations, ind-fppf maps, the three
commutative-algebra inputs of Q7, the valuation construction for any classically `p`-complete ring with a continuous bounded valuation, the valuative criterion for topological
nilpotence in a Tate ring, and `p`-Zariski rings. Its closing comment distinguishes representative statements omitted from this short file from targets whose carriers need the integral
perfectoid predicate, syntomic morphisms, perfectoidization or almost mathematics.

## Layer Q5: Tilting identities, torsion transfer and fibre products

The tilt of a p-adically complete ring is, as a monoid, the set of p-power compatible sequences, so it commutes with limits and its sharp map is computable coordinatewise. For an integral perfectoid ring the tilt agrees with the ring modulo ϖ^p, and their ϖ-torsion and ϖ^♭-torsion are isomorphic A_inf-modules. These identities give the converse of the parent's decomposition: fibre products of perfectoid rings along a surjection are perfectoid.

<a id="q5-tilt-inverse-limit-monoid"></a>

### Q5.1 The tilt as an inverse limit along p-th powers

**Theorem (`tiltCoord_injective`).** Fix a prime p. Let A be a ring that is classically p-adically complete and separated; if A is nonzero then p is not a unit of A. (1) Reduction modulo p induces a bijection of multiplicative monoids lim_{x ↦ x^p} A → A^♭ = lim_{x ↦ x^p} A/pA (Mathlib's PreTilt A p). Its inverse sends a = (a_n)_n to the sequence whose n-th term is lim_m (ã_{n+m})^{p^m} for arbitrary lifts ã_k ∈ A of a_k; its zeroth coordinate is Mathlib's multiplicative untilt a ↦ a^♯, so that the n-th coordinate is (a^{1/p^n})^♯, where a^{1/p^n} is the image of a under the inverse of the n-th power of Frobenius of the perfect ring A^♭. (2) If ϖ ∈ A divides p and A is classically ϖ-adically complete, reduction gives a ring isomorphism lim_{x ↦ x^p} A/pA → lim_{x ↦ x^p} A/ϖA, so A^♭ may be computed with ϖ in place of p. (3) For A nonzero, Fontaine's map θ : W(A^♭) → A is the unique ring map with θ([a]) = a^♯ for every a ∈ A^♭.

*Hypotheses and conventions.* p prime; A commutative; classical completeness means A → lim_n A/p^nA is bijective. In (2) ϖ need not be a nonzerodivisor and need not have p-power roots. This is the statement for every p-adically complete ring; PerfectoidQuotients Q0 records the multiplicative isomorphism only for p-torsion-free integral perfectoid rings.

*Proof sketch.* For x ∈ A with x ≡ y mod p one has x^{p^m} ≡ y^{p^m} mod p^{m+1}; hence for a compatible system (a_n) in A/p the limits lim_m (ã_{n+m})^{p^m} exist, do not depend on the lifts, and form a p-power compatible sequence in A (completeness and separatedness). The two maps are mutually inverse and multiplicative; the zeroth coordinate of the inverse is PreTilt.untilt by Mathlib `PreTilt.mk_untilt_eq_coeff_zero` and Mathlib `PreTilt.untilt_iterate_frobeniusEquiv_symm_pow`. For (2), the same congruence modulo ϖ (ϖ | p) shows that lim_{x ↦ x^p} A → lim_{x ↦ x^p} A/ϖA is bijective; composing with (1) gives the ring isomorphism. For (3), θ([a]) = a^♯ is Mathlib `WittVector.fontaineTheta_teichmuller`; a ring map W(A^♭) → A is determined by its values on Teichmüller representatives, because both sides are p-adically complete and W(A^♭)/p^n is generated by Teichmüller lifts of p^n-th roots (Mathlib `WittVector.eq_of_apply_teichmuller_eq` applied to each A/p^n).

*Acceptance.* For A = Z_p the bijection identifies Z_p^♭ = F_p with the p-power compatible sequences in Z_p, which are the constant sequences of Teichmüller roots of unity and 0. For a perfect F_p-algebra A the map a ↦ a^♯ is the identity of A = A^♭. For A = O_C with C complete algebraically closed, the element ε = (1, ζ_p, ζ_{p^2}, …) of O_C^♭ has ε^♯ = 1 = 1^♯ with ε ≠ 1, so ♯ is not injective.

*Needs:* Mathlib `PreTilt`, Mathlib `PreTilt.untilt`, Mathlib `PreTilt.mk_untilt_eq_coeff_zero`, Mathlib `PreTilt.untilt_iterate_frobeniusEquiv_symm_pow`, Mathlib `WittVector.fontaineTheta`, Mathlib `WittVector.fontaineTheta_teichmuller`, Mathlib `WittVector.eq_of_apply_teichmuller_eq`, Mathlib `IsAdicComplete`.

*Sources:* [CS24](#source-cs24) §2.1.1, equations (2.1.1.2)–(2.1.1.3), p. 10 — States that for p-adically complete A reduction gives a multiplicative isomorphism from the p-power inverse limit of A to A^♭, defines ♯ as the projection, notes θ([a]) = a^♯ with a footnote proof, and that ϖ may replace p when ϖ | p and A is ϖ-adically complete. [BMS1](#source-bms1) Lemma 3.2(i), p. 19 — The canonical maps from the p-power inverse limit of S to S^♭ and on to the Frobenius inverse limit of S/πS are isomorphisms of monoids, respectively rings, for S π-adically complete with π | p.

<a id="q5-tilt-of-limits"></a>

### Q5.2 Tilts and A_inf of products and fibre products

**Theorem.** Fix a prime p. (1) For any family (A_i)_{i∈I} of classically p-adically complete rings, the product ∏_i A_i is p-adically complete and the projections induce ring isomorphisms (∏_i A_i)^♭ ≅ ∏_i A_i^♭ and A_inf(∏_i A_i) ≅ ∏_i A_inf(A_i), compatible with θ. (2) Let A → A' ← B be ring maps of classically p-adically complete rings and suppose A'[p^∞] = A'[p]. Then C = A ×_{A'} B is classically p-adically complete, p^{n+1}(A × B) ∩ C ⊆ p^n C for all n, and the induced maps C^♭ → A^♭ ×_{A'^♭} B^♭ and A_inf(C) → A_inf(A) ×_{A_inf(A')} A_inf(B) are ring isomorphisms compatible with θ.

*Hypotheses and conventions.* Tilts are Mathlib's PreTilt and A_inf(A) = W(A^♭) with Mathlib's Witt vectors. The bounded-torsion hypothesis on A' holds for every integral perfectoid A' (PerfectoidQuotients Q0, bounded p-torsion).

*Proof sketch.* (1): (∏A_i)/p = ∏(A_i/p), and inverse limits and Witt vectors commute with products. (2), completeness: if (a, b) = p^{n+1}(a_1, b_1) lies in C, the defect e = f(a_1) − g(b_1) is killed by p^{n+1}, hence by p, so (pa_1, pb_1) ∈ C and (a, b) ∈ p^nC. Thus the p-adic topology of C is the subspace topology from A × B; C is closed there because A' is separated, hence complete. (2), tilt: by [Q5.1](#q5-tilt-inverse-limit-monoid), C^♭ is the p-power inverse limit of C as a monoid; inverse limits commute with fibre products, so the ring map C^♭ → A^♭ ×_{A'^♭} B^♭ is bijective. W(−) commutes with all limits of rings, giving the A_inf statement; compatibility with θ follows from θ([a]) = a^♯.

*Acceptance.* For A' = 0 the fibre product is A × B and (2) reduces to (1) for two factors. For A → A' = B the identity of B, C = A and the statement is the identity. For A = B = O_C mapping to its residue field k̄, C = O_C ×_{k̄} O_C has tilt O_{C^♭} ×_{k̄} O_{C^♭}.

*Needs:* [Q5.1](#q5-tilt-inverse-limit-monoid), Mathlib `PreTilt`, Mathlib `WittVector`, Mathlib `IsAdicComplete`, PerfectoidQuotients:Q0:integral-algebra/perfectoid-bounded-p-torsion.

*Sources:* [CS24](#source-cs24) §2.1.1, p. 10; proof of Proposition 2.1.4, second paragraph, p. 12 — Notes that the tilt, W(−) and A_inf(−) commute with limits of rings, and in the proof of Proposition 2.1.4 that the fibre product C inherits p-adic completeness, so that its tilt and A_inf are the fibre products of those of the factors.

<a id="q5-sharp-quotient-isomorphisms"></a>

### Q5.3 The tilt and the ring agree modulo ϖ^p

**Theorem.** Let A be integral perfectoid (PerfectoidSpaces P1.24) and let ϖ ∈ A with ϖ^p | p be such that A is classically ϖ-adically complete. Choose ϖ^♭, p^♭ ∈ A^♭ with (ϖ^♭)^♯ and (p^♭)^♯ unit multiples of ϖ and p (they exist by PerfectoidSpaces P1.24). Then: (1) a ↦ a^♯ induces ring isomorphisms A^♭/(ϖ^♭)^pA^♭ ≅ A/ϖ^pA and A^♭/p^♭A^♭ ≅ A/pA; (2) consequently (ϖ^♭)^p divides p^♭ in A^♭, the ideals (ϖ^♭) and (p^♭) of A^♭ do not depend on the choices, and A^♭ is classically ϖ^♭-adically complete; (3) if A is nonzero, ker θ has a generator of the form ξ = p + [p^♭]x with θ(x) a unit of A, and p^♭ may be chosen so that p^♭ = ξ_0 is the zeroth Witt coordinate of this generator.

*Hypotheses and conventions.* The integral perfectoid predicate is the single predicate of PerfectoidSpaces P1.24 used throughout; the zero ring is allowed. Only ideals generated by ϖ^♭ and p^♭ are canonical; the elements are not.

*Proof sketch.* The map A^♭ → A/ϖ^p, a ↦ a^♯ mod ϖ^p is a ring map: modulo ϖ^p it is the projection of lim_{Frob} A/ϖ ([Q5.1](#q5-tilt-inverse-limit-monoid) (2)) to coordinate 1 (with coordinates numbered from 0) followed by the Frobenius A/ϖ → A/ϖ^p, which is bijective for integral perfectoid A (PerfectoidSpaces P1.24, BMS1 Lemma 3.10(i)). It is surjective because Frobenius of A/p is surjective; its kernel is generated by (ϖ^♭)^p, following the proof of BMS1 Lemma 3.10(i). The same argument with p gives A^♭/p^♭ ≅ A/p. (2) follows: p^♭ maps to 0 in A/ϖ^p, so it lies in ((ϖ^♭)^p); a ϖ^♭-adic Cauchy sequence stabilizes coordinatewise in lim_{Frob} A/ϖ, giving completeness. (3): write p + [p^♭]x ∈ ker θ (possible as θ(p) ∈ (p^♭)^♯A); its first Witt coordinate is a unit (PerfectoidQuotients Q0, generator criterion), and choosing θ(x) a unit allows replacing p^♭ by ξ_0 through [Q5.1](#q5-tilt-inverse-limit-monoid).

*Acceptance.* For A = O_C and ϖ = p^{1/p}: O_C^♭/((p^♭)^{1/p})^p ≅ O_C/p. For a perfect F_p-algebra A, p^♭ = 0 is allowed and A^♭/(ϖ^♭)^p = A/ϖ^p is the identity. For A the p-adic completion of Z_p[p^{1/p^∞}], ϖ = p^{1/p} and t = p^♭, A^♭ is the t-adic completion of F_p[t^{1/p^∞}] and A^♭/t ≅ A/p ≅ F_p[t^{1/p^∞}]/(t).

*Needs:* [Q5.1](#q5-tilt-inverse-limit-monoid), PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings, PerfectoidQuotients:Q0:integral-algebra/frobenius-surjectivity-equivalences, PerfectoidQuotients:Q0:integral-algebra/principal-theta-kernel-criterion, PerfectoidQuotients:Q0:integral-algebra/theta-generator-unit-coordinate, PerfectoidSpaces:P1, Mathlib `PreTilt.untilt`.

*Sources:* [CS24](#source-cs24) §2.1.2, paragraphs after Definition (i)–(ii) and equation (2.1.2.2), pp. 10–11 — Recalls from BMS that unit multiples of ϖ and p have compatible p-power roots, shows that ker θ has a generator p + [p^♭]x with p^♭ = ξ_0 after adjustment, and that a ↦ a^♯ gives the isomorphisms A^♭/(ϖ^♭)^p ≅ A/ϖ^p and A^♭/p^♭ ≅ A/p, whence (ϖ^♭)^p | p^♭ and ϖ^♭-adic completeness of A^♭. [BMS1](#source-bms1) Lemma 3.9 and proof of Lemma 3.10(i), pp. 22–23 — Unit multiples of π and p admit compatible p-power roots, and for perfectoid S the map induced by ♯ identifies S^♭ modulo the corresponding element with S modulo π^p.

<a id="q5-torsion-transfer"></a>

### Q5.4 Torsion of a perfectoid ring and of its tilt

**Theorem.** Let A be integral perfectoid, ξ a generator of ker(θ : A_inf(A) → A) and p^♭ = ξ_0 as in [Q5.3](#q5-sharp-quotient-isomorphisms). (1) The A_inf(A)-module M = {(x, y) ∈ A_inf(A)² : ξx = py} / {(pz, ξz) : z ∈ A_inf(A)} maps isomorphically onto A^♭[p^♭] by (x, y) ↦ x mod p and onto A[p] by (x, y) ↦ y mod ξ; so A^♭[p^♭] ≅ A[p] as A_inf(A)-modules. (2) For ϖ ∈ A with ϖ^p | p and A classically ϖ-adically complete, and ϖ^♭ with (ϖ^♭)^♯ a unit multiple of ϖ, there is an A_inf(A)-module isomorphism A^♭[ϖ^♭] ≅ A[ϖ]; in particular A^♭ is ϖ^♭-torsion-free if and only if A is ϖ-torsion-free. (3) If ϖ = (ϖ^♭)^♯ and ϖ^{1/p^n} = ((ϖ^♭)^{1/p^n})^♯, then A[ϖ] is killed by every ϖ^{1/p^n}, and A[ϖ^{1/p^n}] = A[ϖ] = A[ϖ^∞] for all n ≥ 0.

*Hypotheses and conventions.* p and ξ are nonzerodivisors of A_inf(A): p because A^♭ is perfect, ξ by PerfectoidQuotients Q0 (generator criterion). A[x] denotes the x-torsion submodule and A[x^∞] the x-power torsion.

*Proof sketch.* (1): M is Tor_1^{A_inf(A)}(A_inf(A)/p, A_inf(A)/ξ), computed from the two Koszul resolutions: it is (A_inf/ξ)[p] = A[p] and (A_inf/p)[ξ] = A^♭[ξ_0] because ξ ≡ [ξ_0] mod p. (2): the isomorphism of (1) is A_inf-linear; [ϖ^♭] acts on A[p] through θ([ϖ^♭]) = (ϖ^♭)^♯ and on A^♭[p^♭] through ϖ^♭. Since ϖ | p and (ϖ^♭)^p | p^♭ ([Q5.3](#q5-sharp-quotient-isomorphisms)), A[ϖ] ⊆ A[p] and A^♭[ϖ^♭] ⊆ A^♭[p^♭] are the kernels of [ϖ^♭] on the two sides, which therefore correspond. (3): apply (2) to ϖ^{1/p^n}, which also satisfies (ϖ^{1/p^n})^p | p, and use that in the perfect ring A^♭ the ϖ^♭-torsion and (ϖ^♭)^{1/p^n}-torsion and (ϖ^♭)-power torsion coincide; naturality of (2) identifies the inclusions.

*Acceptance.* For A = O_C both sides of (1) are zero. For A perfect of characteristic p, ξ = p, p^♭ = 0, and (1) says A[0] = A ≅ A[p] = A. For A = O_C × F̄_p and ϖ = (p^{1/p}, 0), A[ϖ] = 0 × F̄_p and A^♭[ϖ^♭] = 0 × F̄_p, matching (2).

*Needs:* [Q5.3](#q5-sharp-quotient-isomorphisms), PerfectoidQuotients:Q0:integral-algebra/theta-generator-unit-coordinate, PerfectoidQuotients:Q0:integral-algebra/perfectoid-rings-reduced, PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings.

*Sources:* [CS24](#source-cs24) §2.1.2, last paragraph, equation (2.1.2.5), p. 11 — Defines the A_inf-module of pairs (x, y) with ξx = py modulo (pz, ξz), identifies it with A^♭⟨p^♭⟩ and A⟨p⟩, deduces A^♭⟨ϖ^♭⟩ ≅ A⟨ϖ⟩ and the equalities A⟨ϖ^{1/p^∞}⟩ = A⟨ϖ⟩ = A⟨ϖ^∞⟩.

<a id="q5-ainf-of-perfectoid-surjections"></a>

### Q5.5 A_inf of a surjection of perfectoid rings

**Theorem.** Let f : A ↠ A' be a surjective map of integral perfectoid rings and ξ_A a generator of ker θ_A. Then A_inf(f) : A_inf(A) → A_inf(A') is surjective, ker(A_inf(f))/ξ_A·ker(A_inf(f)) ≅ ker f, A_inf(f) maps ker θ_A onto ker θ_{A'}, and the induced maps A_inf(A) → A_inf(A') ×_{A'} A and [p^♭]A_inf(A) → [p^♭]A_inf(A') ×_{pA'} pA are surjective.

*Hypotheses and conventions.* Both rings are p-adically complete by the integral perfectoid predicate. p^♭ is chosen for A as in [Q5.3](#q5-sharp-quotient-isomorphisms); its image serves for A'.

*Proof sketch.* Surjectivity of A_inf(f) may be checked modulo p and then modulo p^♭ by completeness; there it is the surjection A^♭/p^♭ ≅ A/p → A'/p ≅ A'^♭/p^♭ ([Q5.3](#q5-sharp-quotient-isomorphisms)). ξ_A maps to a generator of ker θ_{A'} (PerfectoidQuotients Q0); the snake lemma for multiplication by ξ_A on 0 → ker A_inf(f) → A_inf(A) → A_inf(A') → 0 gives ker(A_inf(f))/ξ_A ≅ ker f and surjectivity on kernels of θ. The first displayed surjection follows from surjectivity on kernels of θ and surjectivity of θ_A; the second follows by applying the first to the quotients by p-power torsion (PerfectoidQuotients Q0, torsion-free quotient).

*Acceptance.* For A = A' and f the identity, every assertion is trivial. For A = O_C and A' = O_C/(p^{1/p^∞}) = k̄, A_inf(O_C) = W(O_{C^♭}) → W(k̄) is surjective with kernel W(m_{C^♭}) and ker θ maps onto ker(θ_{k̄}) = (p).

*Needs:* [Q5.3](#q5-sharp-quotient-isomorphisms), [Q5.4](#q5-torsion-transfer), PerfectoidQuotients:Q0:integral-algebra/theta-generator-unit-coordinate, PerfectoidQuotients:Q0:integral-algebra/torsion-free-perfectoid-quotient, Mathlib `WittVector.map`, PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings.

*Sources:* [CS24](#source-cs24) Proposition 2.1.4, first part, equation (2.1.4.1), and its proof, first paragraph, pp. 12–13 — States and proves that A_inf of a surjection of perfectoid rings is surjective, surjective on kernels of θ, and induces the two displayed surjections onto fibre products.

<a id="q5-fibre-products-of-perfectoid-rings"></a>

### Q5.6 Fibre products of perfectoid rings

**Theorem.** Let f : A ↠ A' be a surjective map of integral perfectoid rings and g : B → A' any map from an integral perfectoid ring B. Then C = A ×_{A'} B is integral perfectoid, and the projections induce an isomorphism C^♭ ≅ A^♭ ×_{A'^♭} B^♭.

*Hypotheses and conventions.* Surjectivity of f is used to produce a common generator of the kernels of θ; no flatness or torsion-freeness is assumed.

*Proof sketch.* By [Q5.2](#q5-tilt-of-limits) (with A'[p^∞] = A'[p], PerfectoidQuotients Q0) C is p-adically complete, C^♭ is the fibre product of tilts and A_inf(C) = A_inf(A) ×_{A_inf(A')} A_inf(B). By [Q5.5](#q5-ainf-of-perfectoid-surjections) there is ξ = p + [p^♭]x ∈ A_inf(C) mapping to generators of ker θ for A, A' and B. The snake lemma gives A_inf(C)/(ξ) ≅ C; with ϖ the image of (p^♭)^{1/p} (up to a unit) this exhibits C as integral perfectoid (PerfectoidQuotients Q0, principal kernel criterion; PrismaticCohomology PR.0, perfect prisms and perfectoid rings).

*Acceptance.* For A' = 0 this recovers integral perfectoidness of A × B (PerfectoidQuotients Q0, products). O_C ×_{k̄} O_C, glued along the residue field, is integral perfectoid with tilt O_{C^♭} ×_{k̄} O_{C^♭}. The decomposition A ≅ Ā ×_{(Ā/ϖ)_red} (A/ϖ)_red of PerfectoidQuotients Q0 is an instance, with A replaced by Ā and B = (A/ϖ)_red.

*Needs:* [Q5.2](#q5-tilt-of-limits), [Q5.5](#q5-ainf-of-perfectoid-surjections), PerfectoidQuotients:Q0:integral-algebra/perfectoid-bounded-p-torsion, PerfectoidQuotients:Q0:integral-algebra/principal-theta-kernel-criterion, PrismaticCohomology:PR.0/perfect-prisms-perfectoid-rings, PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings.

*Sources:* [CS24](#source-cs24) Proposition 2.1.4, second part, and its proof, second paragraph, pp. 12–13 — States that A ×_{A'} B is perfectoid with tilt the fibre product of tilts for a surjection A ↠ A' and any map B → A' of perfectoids, proved by completeness of C, a common generator p + [p^♭]x and the snake lemma.

*Planet:* Fibre products of perfectoid rings.

<a id="q5-glueing-along-perfect-algebras"></a>

### Q5.7 Glueing a perfectoid ring with a perfect algebra

**Application.** Let A be integral perfectoid and ϖ ∈ A with ϖ | p such that A is classically ϖ-adically complete. For every perfect F_p-algebra B and every ring map B → (A/ϖA)_red, the ring A ×_{(A/ϖA)_red} B is integral perfectoid.

*Hypotheses and conventions.* The map goes from B to (A/ϖ)_red, not conversely. (A/ϖ)_red is a perfect F_p-algebra because A/p is semiperfect and ϖ | p.

*Proof sketch.* (A/ϖ)_red is perfect, hence integral perfectoid (PerfectoidQuotients Q0, characteristic-p criterion), and A → (A/ϖ)_red is surjective. Apply [Q5.6](#q5-fibre-products-of-perfectoid-rings) with A' = (A/ϖ)_red.

*Acceptance.* For A = O_C, ϖ = p and B = F_p → k̄, the subring {x ∈ O_C : x mod m ∈ F_p} is integral perfectoid. For B = (A/ϖ)_red with the identity the fibre product is A.

*Needs:* [Q5.6](#q5-fibre-products-of-perfectoid-rings), PerfectoidQuotients:Q0:integral-algebra/characteristic-p-perfectoid-criterion, PerfectoidQuotients:Q0:integral-algebra/torsion-free-perfectoid-quotient.

*Sources:* [CS24](#source-cs24) Example 2.1.5, p. 13 — Applies Proposition 2.1.4 to the surjection A ↠ (A/ϖ)_red and a perfect F_p-algebra mapping to it.

### Dependencies of Q5

*Needs:* PerfectoidQuotients:Q0:integral-algebra, PerfectoidSpaces:P1, PrismaticCohomology:PR.0.

## Layer Q6: The relative tilting equivalence, valuation rings and torsion-free presentations

Fixing a generator ξ of ker θ, tilting is an equivalence between perfectoid A-algebras and complete perfect A^♭-algebras, and it matches adic completeness on both sides. Valuation rings of any rank, their value groups and algebraic closedness of fraction fields correspond under it. The last target writes every perfectoid ring as a quotient of a torsion-free one, keeping compatible roots of ϖ.

<a id="q6-relative-tilting-equivalence"></a>

### Q6.1 The relative tilting equivalence over an integral perfectoid ring

**Theorem.** Let A be integral perfectoid and ξ = (ξ_0, ξ_1, …) ∈ W(A^♭) a generator of ker θ_A. The functors A' ↦ A'^♭ and B ↦ W(B)/(ξ) are mutually quasi-inverse equivalences between the category of integral perfectoid A-algebras and the category of perfect A^♭-algebras B that are classically ξ_0-adically complete. Under it θ_{A'} is the quotient map W(A'^♭) → W(A'^♭)/(ξ), and ξ generates ker θ_{A'} for every integral perfectoid A-algebra A'.

*Hypotheses and conventions.* Morphisms are ring maps under A, respectively under A^♭. ξ_1 is a unit of A^♭ and A^♭ is ξ_0-adically complete (PerfectoidQuotients Q0, generator criterion).

*Proof sketch.* For a perfect ξ_0-adically complete A^♭-algebra B, W(B) is (p, [ξ_0])-adically complete, hence (p, ξ)-complete, and ξ stays distinguished because ξ_1 maps to a unit; so (W(B), (ξ)) is a perfect prism (PrismaticCohomology PR.0, distinguished elements and perfect prisms). The equivalence between perfect prisms and integral perfectoid rings (PrismaticCohomology PR.0) gives that W(B)/(ξ) is integral perfectoid with tilt B; conversely for A' integral perfectoid over A, ξ maps to a generator of ker θ_{A'} (PerfectoidQuotients Q0) so A' = W(A'^♭)/(ξ). The image of ξ generates ker θ_{A'}, so its zeroth coordinate generates the ideal (p^♭) of A'^♭ by [Q5.3](#q5-sharp-quotient-isomorphisms). Completeness for that ideal is therefore exactly ξ_0-adic completeness.

*Acceptance.* For A an F_p-algebra (ξ = p, ξ_0 = 0) the equivalence is the identity on perfect A-algebras. For A = O_C, perfectoid O_C-algebras correspond to perfect ξ_0-adically complete O_{C^♭}-algebras; O_C ↦ O_{C^♭}, O_C/(p^{1/p^∞}) ↦ k_C (the residue field of O_C).

*Needs:* [Q5.3](#q5-sharp-quotient-isomorphisms), PerfectoidQuotients:Q0:integral-algebra/theta-generator-unit-coordinate, PrismaticCohomology:PR.0/perfect-prisms-perfectoid-rings, PrismaticCohomology:PR.0/distinguished-element, PrismaticCohomology:PR.0/ainf-prism, PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings, Mathlib `WittVector`, Mathlib `PerfectRing`.

*Sources:* [CS24](#source-cs24) Proposition 2.1.9, first assertion, and first sentence of its proof, p. 14; equation (2.1.2.1), p. 10 — States the equivalence between perfectoid A-algebras and ξ_0-adically complete perfect A^♭-algebras via A' ↦ A'^♭ and B ↦ W(B)/(ξ), derived from the characterisation of perfectoid rings as W(B)/(ξ) with B perfect ξ_0-complete and ξ_1 a unit (Lau, Remark 8.6; Bhatt–Scholze Theorem 3.10).

*Planet:* Relative tilting equivalence.

<a id="q6-tilting-completeness-transfer"></a>

### Q6.2 Adic completeness transfers along tilting

**Theorem.** In the setting of [Q6.1](#q6-relative-tilting-equivalence), let A' be an integral perfectoid A-algebra and ϖ^♭ ∈ A'^♭ an element dividing the image of ξ_0. Then A'^♭ is classically ϖ^♭-adically complete if and only if A' is classically ϖ-adically complete for ϖ = (ϖ^♭)^♯.

*Hypotheses and conventions.* No torsion-freeness is assumed; the case ϖ^♭ = 0 is allowed (then ϖ = 0 and both sides hold trivially). Completeness means classical completeness and separatedness.

*Proof sketch.* Suppose A' is ϖ-adically complete. Since ϖ^♭ divides ξ_0, its sharp ϖ divides p up to a unit. Put b = (ϖ^♭)^{1/p}; then (b^♯)^p = ϖ divides p, and the b^♯-adic and ϖ-adic topologies agree. Apply [Q5.3](#q5-sharp-quotient-isomorphisms) to b^♯ to obtain b-adic, hence ϖ^♭-adic, completeness of A'^♭. Conversely W(A'^♭) is [ϖ^♭]-adically complete; it suffices that ξW(A'^♭) is closed for this topology (Stacks 031A), i.e. ξW ∩ [ϖ^♭]^nW = ξ([ϖ^♭]^nW) for all n. Using the decomposition of the perfect ring A'^♭ along ϖ^♭ (PerfectoidQuotients Q0, torsion-free quotient) reduce to ϖ^♭ a nonzerodivisor and to n = 1. If ξw ∈ ([ϖ^♭]) with w = V^m(w_m, w_{m+1}, …) and w_m ∉ (ϖ^♭)^{p^m}, the Witt coordinates of ξw show (ϖ^♭)^{p^{m+1}} | w_m^p, hence (ϖ^♭)^{p^m} | w_m by perfectness, a contradiction.

*Acceptance.* For A' = O_C and ϖ^♭ = (p^♭)^{1/p}, both rings are complete. For a perfect F_p-algebra A' = A'^♭ the statement is a tautology. For A' = ∏_{n∈ℕ} O_C and ϖ^♭ the constant sequence (p^♭)^{1/p}, both A' and A'^♭ = ∏_n O_{C^♭} are complete, although neither is noetherian.

*Needs:* [Q6.1](#q6-relative-tilting-equivalence), [Q5.3](#q5-sharp-quotient-isomorphisms), [Q5.1](#q5-tilt-inverse-limit-monoid), PerfectoidQuotients:Q0:integral-algebra/torsion-free-perfectoid-quotient, Mathlib `WittVector.verschiebung`, Mathlib `IsAdicComplete`.

*Sources:* [CS24](#source-cs24) Proposition 2.1.9, completeness assertion, and its proof, first paragraph, pp. 14–15 — States that A'^♭ is ϖ^♭-adically complete for ϖ^♭ | ξ_0 iff A' is ϖ-adically complete, proved by showing ξW(A'^♭) is [ϖ^♭]-adically closed via a Witt-coordinate computation (Bourbaki, AC IX §1 no. 6, Lemma 4) and Stacks 031A. [Stacks](#source-stacks) Tag 031A (Lemma 10.96.10) — For an I-adically complete module M and a submodule K, M/K is I-adically complete exactly when K is closed, K = ∩(K + I^nM).

<a id="q6-tilt-of-complete-valuation-ring"></a>

### Q6.3 The tilt of a p-adically complete valuation ring

**Theorem (`valuationRing_preTilt`).** Let V be a valuation ring (a domain whose ideals are totally ordered) that is classically p-adically complete, with p a nonunit of V. Then V^♭ = PreTilt V p is a valuation ring; for x, y ∈ V^♭ one has x | y in V^♭ if and only if x^♯ | y^♯ in V; x^♯ = 0 only for x = 0; and x ↦ x^♯ induces an injective order-preserving homomorphism from the value group Frac(V^♭)^×/(V^♭)^× to Frac(V)^×/V^×.

*Hypotheses and conventions.* No perfectoid hypothesis: the statement uses only the multiplicative description of the tilt. If p = 0 in V, then V^♭ is the inverse-limit perfection lim_{Frob} V.

*Proof sketch.* By [Q5.1](#q5-tilt-inverse-limit-monoid), V^♭ is multiplicatively the monoid of p-power compatible sequences (x_n) in V, with x^♯ = x_0. If x^♯ = 0 then x_n^{p^n} = 0, so x = 0 since V is a domain; hence V^♭ is a nonzero ring without zero divisors. If x^♯ | y^♯ with x ≠ 0, the valuation of V gives v(x_n) ≤ v(y_n) for each n, so z_n = y_n/x_n ∈ V form a compatible sequence with xz = y. Totality of the order on values gives the valuation-ring property and the value-group map.

*Acceptance.* For V = O_C (C complete algebraically closed), V^♭ = O_{C^♭} is the valuation ring of the tilt, recovering Mathlib's PreTilt.isDomain in the rank-one valued-field case. For V = Z_p, V^♭ = F_p is a field, a valuation ring with trivial value group, and the value-group map is not surjective. For V a complete discrete valuation ring of characteristic p with residue field F_p, V^♭ = lim_{Frob} F_p⟦t⟧ = F_p is again a field: the tilt can lose the whole value group.

*Needs:* [Q5.1](#q5-tilt-inverse-limit-monoid), Mathlib `ValuationRing`, Mathlib `ValuationRing.ValueGroup`, Mathlib `PreTilt`, Mathlib `IsAdicComplete`.

*Sources:* [CS24](#source-cs24) proof of Proposition 2.1.9, second paragraph, first sentence, p. 15 — Shows that the tilt of a perfectoid valuation ring is a local domain in which of two elements one divides the other, using the multiplicative description (2.1.1.2); the argument given here needs only that description, not perfectoidness.

<a id="q6-tilting-valuation-rings"></a>

### Q6.4 Tilting of perfectoid valuation rings

**Theorem.** Let A' be an integral perfectoid ring. Then A' is a valuation ring if and only if A'^♭ is a valuation ring. In that case every a ∈ A' is u·b^♯ with u ∈ A'^× and b ∈ A'^♭, and x ↦ x^♯ induces an order-preserving isomorphism of value groups Frac(A'^♭)^×/(A'^♭)^× ≅ Frac(A')^×/A'^×.

*Hypotheses and conventions.* If pA' = 0 then A' = A'^♭ is perfect and the statement is trivial. No rank assumption.

*Proof sketch.* If A' is a valuation ring, A'^♭ is one by [Q6.3](#q6-tilt-of-complete-valuation-ring). If A'^♭ is a valuation ring, [Q5.3](#q5-sharp-quotient-isomorphisms) and [Q5.4](#q5-torsion-transfer) show A' is local, p-torsion-free unless pA' = 0, and reduced (PerfectoidQuotients Q0). Following Gabber–Ramero's argument: dividing by a power of (p^♭)^♯ one may assume a ∉ pA'; then a = b^♯ + (p^♭)^♯c with b ∉ (p^♭) by [Q5.3](#q5-sharp-quotient-isomorphisms), and b strictly divides p^♭, so a = b^♯(1 + (p^♭/b)^♯c) with the second factor a unit. This gives the valuation-ring property of A' and surjectivity of the value-group map, whose injectivity is [Q6.3](#q6-tilt-of-complete-valuation-ring).

*Acceptance.* O_C and O_{C^♭} correspond, with value groups both equal to |C^×| = |C^{♭×}|. A product of two perfectoid valuation rings is not a valuation ring, and neither is its tilt, the product of the tilts. The completion of Z_p[p^{1/p^∞}] is a valuation ring whose tilt is the t-adic completion of F_p[t^{1/p^∞}], value group Z[1/p] on both sides.

*Needs:* [Q6.3](#q6-tilt-of-complete-valuation-ring), [Q5.3](#q5-sharp-quotient-isomorphisms), [Q5.4](#q5-torsion-transfer), PerfectoidQuotients:Q0:integral-algebra/perfectoid-rings-reduced, PerfectoidQuotients:Q0:integral-algebra/torsion-free-perfectoid-quotient, PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings, Mathlib `ValuationRing`, Mathlib `ValuationRing.ValueGroup`.

*Sources:* [CS24](#source-cs24) Proposition 2.1.9, valuation-ring assertions, and proof, second paragraph, pp. 14–15 — States that A' is a valuation ring iff A'^♭ is, with value groups identified by ♯, and proves the converse by writing every element as a unit times a sharp, following Gabber–Ramero Proposition 16.5.50.

*Planet:* Tilting of perfectoid valuation rings.

<a id="q6-valuation-ring-localization-completeness"></a>

### Q6.5 Localizations of complete valuation rings are complete

**Lemma (`isAdicComplete_localization_of_valuationRing`).** Let V be a valuation ring, a ∈ V, and suppose V is classically a-adically complete. For every prime ideal 𝔮 ⊂ V containing a, the localization V_𝔮 is classically a-adically complete. Likewise, if V is complete for its valuation topology, so is V_𝔮 for every prime 𝔮.

*Hypotheses and conventions.* a may be zero; then the statement is trivial.

*Proof sketch.* Every element of V ∖ 𝔮 divides every element of 𝔮, so 𝔮 ≅ 𝔮V_𝔮 and 𝔮 kills V_𝔮/V. In the inverse system of exact sequences 0 → V_𝔮/V → V/a^n → V_𝔮/a^n → V_𝔮/V → 0 the transition maps on the left copy are multiplication by a, hence zero; passing to the limit and using the snake lemma, a-adic completeness of V gives that of V_𝔮. For the valuation topology, completeness of V is completeness of the nonunital ring 𝔮 with principal ideals open, which is unchanged by 𝔮 ≅ 𝔮V_𝔮.

*Acceptance.* For V = O_C and 𝔮 = m the localization is V itself. The prime 𝔮 = 0 is excluded when a ≠ 0: Frac(V) is not a-adically separated.

*Needs:* Mathlib `ValuationRing`, Mathlib `Localization.AtPrime`, Mathlib `IsAdicComplete`.

*Sources:* [CS24](#source-cs24) proof of Proposition 2.1.9, last paragraph and footnote, p. 15 — Proves that for an a-adically complete valuation ring V and a prime 𝔮 ∋ a, V_𝔮 is a-adically complete, using 𝔮 ≅ 𝔮V_𝔮 and the inverse system of exact sequences; the footnote treats completeness for the valuation topology.

<a id="q6-localizations-of-perfectoid-valuation-rings"></a>

### Q6.6 Localizations of perfectoid valuation rings

**Theorem.** Let V be an integral perfectoid valuation ring and 𝔮 ⊂ V a prime ideal, excluding 𝔮 = 0 when V has mixed characteristic (0, p). Then V_𝔮 is an integral perfectoid valuation ring. If V has mixed characteristic and dimension ≥ 1, its height-one prime 𝔭 = √(pV) satisfies (V_𝔭)^♭ ≅ (V^♭)_{𝔭^♭} with 𝔭^♭ = √(p^♭V^♭), and V_𝔭 is a rank-one perfectoid valuation ring, so V_𝔭[1/p] is a perfectoid field with ring of integers V_𝔭.

*Hypotheses and conventions.* The excluded case: for mixed characteristic V, V_0 = Frac(V) is not p-adically complete.

*Proof sketch.* On V and on V^♭ the p-adic, respectively p^♭-adic, topology is the valuation topology; [Q6.5](#q6-valuation-ring-localization-completeness) gives completeness of V_𝔮 and of (V^♭)_{𝔮^♭}. [Q5.3](#q5-sharp-quotient-isomorphisms) identifies V/p with V^♭/p^♭ compatibly with the localizations, so (V^♭)_{𝔮^♭} is a perfect complete valuation ring whose untilt by [Q6.1](#q6-relative-tilting-equivalence) is V_𝔮; [Q6.4](#q6-tilting-valuation-rings) identifies valuation rings on both sides. For the height-one prime, V_𝔭 has rank one; a rank-one p-adically complete integral perfectoid valuation ring is the ring of integers of the perfectoid field V_𝔭[1/p] (PerfectoidSpaces P1.25).

*Acceptance.* For V = O_C (rank one) the only allowed primes give V itself. For a rank-two perfectoid valuation ring V with height-one prime 𝔭, V_𝔭 is the rank-one valuation ring through which V's coarsening factors.

*Needs:* [Q6.5](#q6-valuation-ring-localization-completeness), [Q6.4](#q6-tilting-valuation-rings), [Q6.1](#q6-relative-tilting-equivalence), [Q5.3](#q5-sharp-quotient-isomorphisms), PerfectoidSpaces:P1/integral-perfectoid-comparison, PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings.

*Sources:* [CS24](#source-cs24) proof of Proposition 2.1.9, third paragraph, p. 15, and Remark 2.1.10, p. 15 — Shows that the localization of a perfectoid valuation ring at its height-one prime is perfectoid with tilt the localization of the tilt, and remarks that every localization other than the zero-dimensional one in mixed characteristic is a perfectoid valuation ring.

<a id="q6-tilting-algebraically-closed-valuation-rings"></a>

### Q6.7 Algebraically closed fraction fields under tilting

**Theorem.** Let A' be an integral perfectoid valuation ring. Then Frac(A') is algebraically closed if and only if Frac(A'^♭) is algebraically closed.

*Hypotheses and conventions.* Dimension zero: an integral perfectoid field is a perfect field of characteristic p, and then A' = A'^♭.

*Proof sketch.* If pA' = 0 then A' = A'^♭. Otherwise A' has mixed characteristic and dimension ≥ 1. Frac(A') = Frac(A'_𝔭) for the height-one prime 𝔭, and by [Q6.6](#q6-localizations-of-perfectoid-valuation-rings) A'_𝔭[1/p] is a perfectoid field K whose tilt is Frac((A'^♭)_{𝔭^♭}) = Frac(A'^♭). For a perfectoid field K, K is algebraically closed iff K^♭ is (PerfectoidSpaces P3.7(iii), Scholze Theorem 3.7(ii) and Proposition 3.8).

*Acceptance.* For A' = O_C the statement is that C is algebraically closed iff C^♭ is. For A' the completion of Z_p[p^{1/p^∞}], neither Frac(A') nor Frac(A'^♭) = F_p((t^{1/p^∞}))^ is algebraically closed.

*Needs:* [Q6.6](#q6-localizations-of-perfectoid-valuation-rings), [Q6.4](#q6-tilting-valuation-rings), PerfectoidSpaces:P3/finite-extensions-of-perfectoid-fields, PerfectoidSpaces:P3/untilt-of-algebraically-closed-field, Mathlib `IsAlgClosed`.

*Sources:* [CS24](#source-cs24) Proposition 2.1.9, parenthetical assertion, and proof, third paragraph, p. 15 — Asserts that A' has algebraically closed fraction field iff A'^♭ does, deduced for dimension ≤ 1 from Scholze, Perfectoid spaces, Theorem 3.7(ii) and in general by localizing at the height-one prime. [Sch12](#source-sch12) Theorem 3.7(ii) and Proposition 3.8, pp. 17–18 — Tilting is an equivalence between finite extensions of a perfectoid field and of its tilt; a perfectoid field is algebraically closed iff its tilt is.

<a id="q6-torsion-free-perfectoid-presentation"></a>

### Q6.8 Perfectoid rings are quotients of torsion-free ones

**Theorem.** Let A be integral perfectoid and ϖ ∈ A with ϖ^p | p such that A is classically ϖ-adically complete. (1) There are an integral perfectoid ring Ã, an element ϖ̃ ∈ Ã with ϖ̃^p | p such that Ã is ϖ̃-torsion-free and classically ϖ̃-adically complete, and a surjection Ã ↠ A carrying ϖ̃ to ϖ. (2) If ϖ has compatible p-power roots ϖ^{1/p^n} ∈ A, then Ã and ϖ̃ in (1) can be chosen so that ϖ̃ has compatible p-power roots ϖ̃^{1/p^n} ∈ Ã mapping to the ϖ^{1/p^n}. (3) Every integral perfectoid ring is a quotient of a p-torsion-free integral perfectoid ring.

*Hypotheses and conventions.* Part (2) is the form used in the reduction step of the ind-syntomic André lemma (Q9); the source states only (1) and (3).

*Proof sketch.* Write A = W(A^♭)/(ξ) with ξ_1 a unit and choose ϖ^♭ with ϖ = (ϖ^♭)^♯u, u ∈ A^× ([Q5.3](#q5-sharp-quotient-isomorphisms)). In case (2) take ϖ^♭ = (ϖ^{1/p^n})_n ∈ A^♭ by [Q5.1](#q5-tilt-inverse-limit-monoid), so u = 1. Let B_0 = F_p[X_a^{1/p^∞} : a ∈ A^♭] (perfection of a polynomial ring) with B_0 ↠ A^♭, X_a ↦ a; lift the ξ_i to ξ̃_i ∈ B_0 with X_{ϖ^♭}^p | ξ̃_0, and let B be the X_{ϖ^♭}-adic completion of B_0[1/ξ̃_1]: a perfect ξ̃_0-complete F_p-algebra surjecting onto A^♭. The perfect F_p-algebra B is ξ̃_0-adically complete and ξ̃_1 is a unit, so the general Witt-quotient/perfect-prism criterion (PrismaticCohomology PR.0) makes Ã' = W(B)/(ξ̃) integral perfectoid; W(B) → W(A^♭) induces its surjection onto A; with ϖ̃' = (X_{ϖ^♭})^♯ one has ϖ̃'^p | p, Ã' is ϖ̃'-complete ([Q6.2](#q6-tilting-completeness-transfer)) and ϖ̃'-torsion-free ([Q5.4](#q5-torsion-transfer), B being X_{ϖ^♭}-torsion-free). In general replace Ã' by the ϖ̃'-adic completion Ã of Ã'[1/ũ] for a lift ũ of u, integral perfectoid by PerfectoidQuotients Q0 (completed étale extensions and sharp-ideal completions), and put ϖ̃ = ϖ̃'ũ. In case (2), u = 1: take Ã = Ã' and ϖ̃ = ϖ̃', whose roots ((X_{ϖ^♭})^{1/p^n})^♯ lift ϖ^{1/p^n}. (3): take ξ̃_0 = X_{ξ_0}, replace X_{ϖ^♭} by X_{ξ_0}, and Ã = Ã'.

*Acceptance.* For A = k̄ (perfect, ϖ = 0), Ã = the p-adic completion of W(k̄)[p^{1/p^∞}] with ϖ̃ = p^{1/p} works. For A already ϖ-torsion-free, Ã = A works. For A = F_p (perfect, p = 0), (3) is realised by the completion of Z_p[p^{1/p^∞}] → F_p.

*Needs:* [Q5.1](#q5-tilt-inverse-limit-monoid), [Q5.3](#q5-sharp-quotient-isomorphisms), [Q5.4](#q5-torsion-transfer), [Q6.1](#q6-relative-tilting-equivalence), [Q6.2](#q6-tilting-completeness-transfer), PerfectoidQuotients:Q0:integral-algebra/completely-etale-and-henselian-perfectoid, PerfectoidQuotients:Q0:integral-algebra/completion-along-sharp-ideal, Mathlib `PerfectClosure`, Mathlib `MvPolynomial`, Mathlib `WittVector`, PrismaticCohomology:PR.0/perfect-prisms-perfectoid-rings.

*Sources:* [CS24](#source-cs24) Proposition 2.1.12 and its proof, pp. 17–18 — States that every perfectoid A, ϖ-adically complete with ϖ^p | p, is a quotient of a ϖ̃-torsion-free, ϖ̃-adically complete perfectoid Ã for a lift ϖ̃ with ϖ̃^p | p, and that every perfectoid ring is a quotient of a p-torsion-free one; the proof uses B_0 = F_p[X_a^{1/p^∞}], the completion B and W(B)/(ξ̃). [CS24](#source-cs24) proof of Theorem 2.3.4, first paragraph, p. 25 — Applies Proposition 2.1.12 to reduce case (i) of the theorem to case (ii), which needs compatible p-power roots of ϖ̃; part (2) here supplies them.

*Planet:* Torsion-free perfectoid presentations.

### Dependencies of Q6

*Needs:* PerfectoidQuotientsPartII:Q5, PerfectoidQuotients:Q0:integral-algebra, PerfectoidSpaces:P1, PerfectoidSpaces:P3, PrismaticCohomology:PR.0.

## Layer Q7: Ind-fppf and ind-syntomic ring maps

Česnavičius–Scholze's improvement of André's lemma replaces faithful flatness by ind-syntomicity. This layer defines ind-fppf and ind-syntomic maps with their factorization criteria and stability properties (nonempty finite products for ind-fppf), and proves the three commutative-algebra facts the proof of the André lemma uses: glueing of flatness along a nonzerodivisor, the presentation of the blowup algebra of a regular pair, and syntomicity of fibrewise nonzero hypersurfaces.

<a id="q7-ind-fppf-algebra"></a>

### Q7.1 Ind-fppf ring maps

**Definition (`IsIndFppf`).** A ring map A → A' is ind-fppf if A' is, as an A-algebra, a filtered colimit of faithfully flat A-algebras of finite presentation. Equivalently: A → A' is faithfully flat and every A-algebra map B → A' with B of finite presentation over A factors as B → S → A' with S a faithfully flat A-algebra of finite presentation.

*Hypotheses and conventions.* Colimits are taken in A-algebras; the index category is filtered and small. Faithfully flat of finite presentation is Mathlib's Module.FaithfullyFlat together with Algebra.FinitePresentation.

*Construction.* The factorization form is Stacks 07C3 applied to the class of faithfully flat finitely presented A-algebras; it is the definition used in the suggested Lean file.

The API:

- `IsIndFppf` (constructor): The predicate on an A-algebra A': faithful flatness together with the factorization of every finitely presented A-algebra map B → A' through a faithfully flat finitely presented A-algebra.
- `IsIndFppf.of_finitePresentation` (constructor): A faithfully flat A-algebra of finite presentation is ind-fppf.
- `IsIndFppf.faithfullyFlat` (projection): An ind-fppf A-algebra is faithfully flat.
- `IsIndFppf.iff_colimit` (characterisation): A' is ind-fppf iff it is isomorphic as an A-algebra to a filtered colimit of faithfully flat finitely presented A-algebras.
- `IsIndFppf.iff_faithfullyFlat_colimit_flat` (characterisation): A' is ind-fppf iff A → A' is faithfully flat and A' is a filtered colimit of flat finitely presented A-algebras.
- `IsIndFppf.comp` (functoriality): If A → A' and A' → A'' are ind-fppf then A → A'' is ind-fppf.
- `IsIndFppf.baseChange` (functoriality): If A' is ind-fppf over A then A' ⊗_A C is ind-fppf over C for every A-algebra C.
- `IsIndFppf.prod` (structure): A nonempty finite product of ind-fppf A-algebras, with the diagonal map from A, is ind-fppf.
- `IsIndFppf.colimit` (structure): A filtered colimit of ind-fppf A-algebras is ind-fppf.
- `IsIndFppf.of_equiv` (compatibility): Ind-fppf is invariant under A-algebra isomorphism.

**Checks.**

- `indFppf_self` (degenerate): A is ind-fppf over itself (the identity is faithfully flat of finite presentation).
- `indFppf_polynomial` (computation): A[X] is ind-fppf over A, and so is the polynomial ring A[X_i : i ∈ ℕ] in countably many variables; for A nonzero the latter is not of finite presentation.
- `not_indFppf_localization` (non-example): Z → Q is flat but not faithfully flat, hence not ind-fppf; Z → Z/pZ is not flat, hence not ind-fppf.
- `not_indFppf_completion` (non-example): For a noetherian local Q-algebra R with a nonreduced formal fibre (Ferrand–Raynaud), R → R̂ is faithfully flat but not ind-fppf (Gabber).
- `indFppf_prod` (computation): A → A × A is ind-fppf, being faithfully flat and of finite presentation (étale).
- `not_indFppf_empty_product` (degenerate): The empty product is the zero A-algebra. Over A = Z it is not faithfully flat and hence not ind-fppf; the finite-product assertion requires a nonempty index set.

*Acceptance.* Every faithfully flat finitely presented A-algebra is ind-fppf. A filtered colimit of ind-fppf A-algebras is ind-fppf.

*Uses.* ČS24 Theorem 2.3.4: the André extension A → A' is faithfully flat and ind-syntomic, hence ind-fppf; ČS24 §4.1.1, pro-fppf site: pro-ppf and pro-fppf scheme maps are defined locally by filtered colimits of flat finitely presented algebras, and their stability under base change and composition comes from §2.3.3; SchemeAndStackFoundations Part II (flat cohomology direction): the pro-fppf topology and flat cohomology of Česnavičius–Scholze §§4–5 import ind-fppf maps from here.

*Needs:* Mathlib `Module.FaithfullyFlat`, Mathlib `Algebra.FinitePresentation`, Mathlib `Module.Flat`.

*Sources:* [CS24](#source-cs24) §2.3.3 and footnote 12, p. 24 — Defines ind-fppf maps as filtered direct limits of faithfully flat finitely presented algebras, notes the equivalent factorization description via Stacks 07C3, and the example of a flat map R → R̂ that is not ind-fppf. [Stacks](#source-stacks) Tag 07C3 (Lemma 10.127.4) — For a set of finitely presented R-algebras, Λ is a filtered colimit of members exactly when every map from a finitely presented R-algebra to Λ factors through a member.

*Planet:* Ind-fppf maps.

<a id="q7-ind-syntomic-algebra"></a>

### Q7.2 Ind-syntomic ring maps

**Definition.** A ring map A → A' is ind-syntomic if A' is, as an A-algebra, a filtered colimit of syntomic A-algebras; syntomic means flat, of finite presentation, with local complete intersection fibres (Stacks 00SL), equivalently Zariski locally of the form A[x_1, …, x_n]/(f_1, …, f_c) with each A[x]/(f_1, …, f_i) flat and f_1, …, f_c regular at every prime containing them. Equivalently: every A-algebra map B → A' with B finitely presented factors through a syntomic A-algebra.

*Hypotheses and conventions.* Syntomic morphisms are those of Tau Ceti StableReduction Layer 1 (flat, locally finitely presented local complete intersections); the affine case is Stacks 00SL. Ind-syntomic does not include faithful flatness; a faithfully flat ind-syntomic map is ind-fppf.

*Construction.* The two descriptions of syntomic agree by Stacks 00SY and 00SV; the factorization form is Stacks 07C3.

The API:

- `IsIndSyntomic` (constructor): The predicate: every map from a finitely presented A-algebra to A' factors through a syntomic A-algebra.
- `IsIndSyntomic.of_syntomic` (constructor): A syntomic A-algebra is ind-syntomic.
- `IsIndSyntomic.flat` (projection): An ind-syntomic A-algebra is flat (filtered colimit of flat modules).
- `IsIndSyntomic.isIndFppf` (compatibility): A faithfully flat ind-syntomic A-algebra is ind-fppf.
- `IsIndSyntomic.comp` (functoriality): Composites of ind-syntomic maps are ind-syntomic.
- `IsIndSyntomic.baseChange` (functoriality): Base change of an ind-syntomic map is ind-syntomic.
- `IsIndSyntomic.prod` (structure): Finite products of ind-syntomic A-algebras are ind-syntomic.
- `IsIndSyntomic.colimit` (structure): Filtered colimits of ind-syntomic A-algebras are ind-syntomic.
- `IsIndSyntomic.iff_colimit` (characterisation): Ind-syntomic iff a filtered colimit of syntomic A-algebras (Stacks 07C3).
- `IsIndSyntomic.of_equiv` (compatibility): Ind-syntomic is invariant under A-algebra isomorphism.

**Checks.**

- `indSyntomic_rootPolynomial` (computation): A → A[T^{1/p^∞}] = colim_n A[T^{1/p^n}] is ind-syntomic, and it is faithfully flat, hence ind-fppf.
- `indSyntomic_hypersurface` (computation): For ϖ ∈ A and a monic q ∈ A[T], A[T, X]/(ϖX − q) is syntomic over A ([Q7.6](#q7-fibrewise-hypersurface-syntomic)).
- `not_indSyntomic_quotient` (non-example): Z → Z/pZ is not ind-syntomic: it is not flat.
- `indSyntomic_not_faithfullyFlat` (non-example): Z → Z[1/p] = Z[x]/(px − 1) is syntomic, hence ind-syntomic, but not faithfully flat, hence not ind-fppf.

*Acceptance.* A syntomic A-algebra is ind-syntomic. A → A[T^{1/p^∞}] is ind-syntomic, as the colimit of the polynomial algebras A[T^{1/p^n}].

*Uses.* ČS24 Theorem 2.3.4: its André extension is faithfully flat and ind-syntomic; ČS24 proof of Theorem 6.2.3, pp. 83–84 (purity for flat cohomology of complete intersections): the Čech spectral sequence along an ind-syntomic faithfully flat A' with perfectoid completion containing roots of the f_i; PerfectoidQuotients Layer 1, André extension modulo p: Bhatt–Scholze's mod-p refinement is ind-syntomic modulo p; the present notion is the ordinary one.

*Needs:* Tau Ceti StableReduction (Layer 1), [Q7.1](#q7-ind-fppf-algebra), Mathlib `Algebra.FinitePresentation`, Mathlib `Module.Flat`.

*Sources:* [CS24](#source-cs24) §2.3.3 and footnote 11, p. 24 — Defines ind-syntomic maps as filtered direct limits of syntomic algebras, with syntomic defined by local presentations whose partial quotients are flat and whose equations are regular at primes containing them, and notes agreement with Stacks 00SL. [Stacks](#source-stacks) Tag 00SL (Definition 10.136.1) — A ring map is syntomic if it is flat, of finite presentation, and all its fibre rings are local complete intersections.

*Planet:* Ind-syntomic maps.

<a id="q7-ind-maps-stability"></a>

### Q7.3 Stability of ind-fppf and ind-syntomic maps

**Theorem.** Ind-fppf maps and ind-syntomic maps are each stable under composition and base change. A nonempty finite product of ind-fppf A-algebras is ind-fppf; every finite product of ind-syntomic A-algebras is ind-syntomic, including the empty product. A filtered colimit of ind-fppf (resp. ind-syntomic) A-algebras is ind-fppf (resp. ind-syntomic). Moreover, A → A' is ind-fppf iff it is faithfully flat and A' is a filtered colimit of flat finitely presented A-algebras; a faithfully flat ind-syntomic map is ind-fppf.

*Hypotheses and conventions.* All rings commutative; colimits filtered.

*Proof sketch.* Factorization criteria (Stacks 07C3) reduce every assertion to finitely presented test algebras B → A'. Composition: for A → A' → A'' and a test map B → A'', factor the induced A'-algebra map A' ⊗_A B → A'' through an A'-algebra S of the relevant finite-presentation class. Express A' as a filtered colimit of A-algebras of that class and descend S and the factorization to a sufficiently late stage. In the ind-fppf case descend faithful flatness of S by the finite-presentation limit theorem (EGA IV 11.2.6.1), then use transitivity of faithful flatness. In the ind-syntomic case descend syntomicity by Stacks 0C33 and use transitivity of syntomic maps; no faithful flatness is assumed in this case. Base change, the finite products just specified and filtered colimits follow from the factorization criterion. Nonempty finite products preserve faithful flatness; the empty product is syntomic but is not faithfully flat over a nonzero base. Faithful flatness of the filtered colimits in question follows from flatness and nonvanishing fibres (Stacks 00HP). If A → A' is faithfully flat and A' = colim S_j with S_j flat of finite presentation, a test map B → A' factors through some S_i, and Spec S_i → Spec A is surjective because Spec A' → Spec A factors through it; so S_i is faithfully flat. Syntomic algebras are flat of finite presentation, so faithfully flat ind-syntomic maps are ind-fppf.

*Acceptance.* The composite A → A[T^{1/p^∞}] → A[T^{1/p^∞}, U^{1/p^∞}] is ind-syntomic and ind-fppf. Base change of the ind-fppf map Z → Z[X] along Z → F_p gives F_p → F_p[X].

*Needs:* [Q7.1](#q7-ind-fppf-algebra), [Q7.2](#q7-ind-syntomic-algebra), Tau Ceti StableReduction (Layer 1), Mathlib `Module.FaithfullyFlat`, Mathlib `Algebra.FinitePresentation`.

*Sources:* [CS24](#source-cs24) §2.3.3 and footnote 13, p. 24 — States the equivalent descriptions, stability under composition and base change, finite products and filtered direct limits, and that faithfully flat ind-syntomic maps are ind-fppf, with the composition argument in a footnote using EGA IV 11.2.6.1 and Stacks 0C33. The ind-fppf product assertion is interpreted for nonempty finite products; the empty-product convention is recorded in source issue E5. [Stacks](#source-stacks) Tag 0C33 (Lemma 10.168.9) — A syntomic map over a filtered colimit of rings descends to a syntomic map at a finite stage when the target is of finite presentation.

<a id="q7-flatness-glueing"></a>

### Q7.4 Glueing flatness along a nonzerodivisor

**Theorem (`Module.Flat.of_isSMulRegular_of_flat_localization_of_flat_quotient`).** Let A be a ring, f ∈ A and M an A-module. If f is a nonzerodivisor on A and on M, M[1/f] is flat over A[1/f], and M/fM is flat over A/fA, then M is flat over A. The same holds with flat replaced by faithfully flat.

*Hypotheses and conventions.* No noetherian or finiteness hypothesis.

*Proof sketch.* For an f-power-torsion A-module Q, Tor_i^A(M, Q) = 0 for i ≥ 1: for A/f-modules, M ⊗^L_A A/f = M/fM since f is regular on A and M, so Tor_i^A(M, Q) = Tor_i^{A/f}(M/fM, Q) = 0; extensions and filtered colimits give all f-power-torsion Q. For an f-torsion-free Q, the sequence 0 → Q → Q[1/f] → C → 0 with C f-power torsion and Tor_1^A(M, Q[1/f]) = Tor_1^{A[1/f]}(M[1/f], Q[1/f]) = 0 give Tor_1^A(M, Q) = 0. A general Q is an extension of Q/Q[f^∞] by Q[f^∞]. Faithful flatness: closed points of Spec A lie over V(f) or over D(f).

*Acceptance.* For A = Z, f = p and M = Z_p: Z_p[1/p] = Q_p is torsion-free, hence flat, over Z[1/p], and Z_p/p = F_p is flat over F_p, so Z_p is flat over Z. The hypothesis that f is a nonzerodivisor on M is needed: for M = Z/pZ over Z with f = p, M[1/p] = 0 and M/pM = F_p are flat, but M is not flat.

*Needs:* Mathlib `Module.Flat`, Mathlib `Module.FaithfullyFlat`, Mathlib `IsSMulRegular`, Mathlib `Localization.Away`.

*Sources:* [Stacks](#source-stacks) Tag 0H7N (Lemma 10.99.16) — If f is a nonzerodivisor on A and M, M_f is flat over A_f and M/fM is flat over A/fA, then M is flat over A; the same with faithfully flat. [CS24](#source-cs24) proof of Theorem 2.3.4 (§2.3.6), second paragraph, p. 26 — Deduces A-flatness of A'/I' from A/ϖ-flatness of its reduction and A[1/ϖ]-flatness of its localization by glueing of flatness (Raynaud–Gruson, Part II, Lemma 1.4.2.1).

<a id="q7-regular-blowup-algebra"></a>

### Q7.5 Affine blowup algebras along a regular pair

**Theorem (`ker_aeval_div_of_isRegular`).** Let R be a ring and a, g ∈ R such that a, g is an R-regular sequence (a is a nonzerodivisor on R and g is a nonzerodivisor on R/aR). Then the R-subalgebra R[g/a] of R[1/a] is isomorphic to R[X]/(aX − g), via X ↦ g/a.

*Hypotheses and conventions.* No noetherian hypothesis: Stacks proves the statement for H_1-regular sequences, which include regular sequences.

*Proof sketch.* The surjection R[X]/(aX − g) → R[g/a] exists since a·(g/a) = g. Injectivity: a is a nonzerodivisor on R[X]/(aX − g) because a, g is regular; hence R[X]/(aX − g) embeds in its localization at a, which is R[1/a].

*Acceptance.* For R = Z_p[T], a = p and g = T (regular), R[T/p] ≅ Z_p[T, X]/(pX − T) ≅ Z_p[X]. Regularity is needed: for R = Z, a = 2 and g = 2, R[g/a] = Z but R[X]/(2X − 2) has the 2-torsion class X − 1.

*Needs:* Mathlib `RingTheory.Sequence.IsRegular`, Mathlib `Localization.Away`, Mathlib `Algebra.adjoin`, Mathlib `Polynomial`.

*Sources:* [Stacks](#source-stacks) Tag 0BIQ (Lemma 15.32.2) — For an H_1-regular sequence a, a_2, …, a_r the affine blowup algebra R[I/a] is R[y_2, …, y_r]/(a y_i − a_i). [CS24](#source-cs24) proof of Theorem 2.3.4 (§2.3.6), equation (2.3.6.1), p. 26 — Uses that ϖ^m, P is a regular sequence on A_0 = A[T^{1/p^∞}] to describe A_0[P/ϖ^m] as A_0[X]/(ϖ^mX − P).

<a id="q7-fibrewise-hypersurface-syntomic"></a>

### Q7.6 Fibrewise nonzero hypersurfaces are syntomic

**Theorem (`flat_quotient_of_forall_map_ne_zero`).** Let A be a ring and g ∈ A[x_1, …, x_n]. If for every prime 𝔭 of A the image of g in κ(𝔭)[x_1, …, x_n] is nonzero, then A → A[x_1, …, x_n]/(g) is syntomic; in particular it is flat and of finite presentation.

*Hypotheses and conventions.* This is the case c = 1 of Stacks' relative global complete intersections; nonempty fibres then have dimension n − 1.

*Proof sketch.* Each fibre κ(𝔭)[x]/(ḡ) is empty (ḡ a unit) or a hypersurface of dimension n − 1, so A[x]/(g) is a relative global complete intersection. Stacks 00SW: relative global complete intersections are flat, hence syntomic.

*Acceptance.* For ϖ ∈ A and q ∈ A[T] monic, g = ϖX − q ∈ A[T, X] is nonzero in every fibre (it is linear in X with invertible coefficient where ϖ ≠ 0 and equals −q̄ ≠ 0 elsewhere), so A[T, X]/(ϖX − q) is syntomic. The hypothesis is needed: g = pX over Z vanishes in the fibre at p and Z[X]/(pX) is not flat.

*Needs:* Tau Ceti StableReduction (Layer 1), [Q7.2](#q7-ind-syntomic-algebra), Mathlib `MvPolynomial`, Mathlib `Ideal.ResidueField`, Mathlib `Module.Flat`.

*Sources:* [Stacks](#source-stacks) Tag 00SW (Lemma 10.136.13) — A relative global complete intersection is syntomic, in particular flat. [CS24](#source-cs24) proof of Theorem 2.3.4 (§2.3.6), last paragraph, p. 28 — Notes that ϖ^{m/p^j}X_j − q_j is regular and stays regular on every A-fibre of A[T^{1/p^n}][X_j], so the quotient is syntomic over A by Stacks 00SW.

### Dependencies of Q7

*Needs:* tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs.

## Layer Q8: Continuous valuations: tilting, approximation and topological nilpotence

Continuous valuations control the André construction. A continuous valuation on a perfectoid ring tilts to one on A^♭; every element of a perfectoid ring is approximated by a sharp up to |p|·max(|a'^♯|, |ϖ|^{pm}) for all such valuations at once; and topological nilpotence in A[1/ϖ] is detected by them.

<a id="q8-adic-continuity-criterion"></a>

### Q8.1 Continuous valuations for an element-adic topology

**Comparison.** Let A be a ring with the ϖ-adic topology for some ϖ ∈ A, and v a valuation on A with v(A) ≤ 1 and value group Γ_v. Then v is continuous (Tau Ceti's ValuationSpectrum.IsContinuous for the topological ring A) if and only if for every γ ∈ Γ_v there is n with v(ϖ)^n &lt; γ. If moreover ϖ is a nonzerodivisor and A[1/ϖ] carries the topology in which A is an open subring with the ϖ-adic topology, a valuation w on A[1/ϖ] with w(A) ≤ 1 is continuous iff its restriction to A is.

*Hypotheses and conventions.* Valuations are multiplicative with values in Γ ∪ {0}; v(ϖ) = 0 is allowed, and then v is continuous. This fixes the convention of Česnavičius–Scholze §2.3 (continuity means that the powers of ϖ become smaller than every element of the value group) inside the Tau Ceti carrier.

*Proof sketch.* If v(ϖ)^n &lt; γ, then ϖ^nA ⊆ {a : v(a) &lt; γ} because v(A) ≤ 1, so this additive subgroup is open; conversely openness of {v &lt; γ} forces ϖ^nA ⊆ {v &lt; γ} for some n. For A[1/ϖ], A is open and its topology is ϖ-adic, so the same subgroups test continuity; Tau Ceti's description of continuous points of a Huber ring through an ideal of definition (Wedhorn Theorem 7.10) gives the same set.

*Acceptance.* For A = Z_p and v the p-adic valuation, v is continuous. The trivial valuation on Z_p (v(a) = 1 for a ≠ 0) is not continuous: v(p)^n = 1 is never below 1. A valuation factoring through A/ϖ (so v(ϖ) = 0) is continuous.

*Needs:* Tau Ceti `TauCeti.ValuationSpectrum.IsContinuous`, Tau Ceti `TauCeti.ValuationSpectrum.cont_eq_spvOfIdeal_inter_setOfPred_forall_vlt_one`, Tau Ceti `TauCeti.Huber.IsTateRing`, Mathlib `Valuation`.

*Sources:* [CS24](#source-cs24) Lemma 2.3.1, sentence after the statement, p. 22 — Fixes that continuity of a valuation with |A| ≤ 1 means that |ϖ^n| becomes smaller than any element of the value group. [Wedhorn](#source-wedhorn) Definition 7.7, p. 58, and Theorem 7.10, p. 59 — Defines Cont(A) and describes the continuous valuations of an f-adic ring through an ideal of definition.

<a id="q8-tilted-valuation"></a>

### Q8.2 The tilt of a continuous valuation

**Construction (`tiltValuation`).** Let A be integral perfectoid, ϖ ∈ A with ϖ^p | p and A classically ϖ-adically complete, and ϖ^♭ ∈ A^♭ with (ϖ^♭)^♯ a unit multiple of ϖ. For a continuous valuation v on A (ϖ-adic topology) with v(A) ≤ 1, define v^♭ : A^♭ → Γ_v ∪ {0} by v^♭(x) = v(x^♯). Then v^♭ is a valuation on A^♭, continuous for the ϖ^♭-adic topology, with v^♭(A^♭) ≤ 1 and v^♭(ϖ^♭) = v(ϖ).

*Hypotheses and conventions.* Continuity of v ([Q8.1](#q8-adic-continuity-criterion)) is used for the ultrametric inequality, through a ϖ-adic limit.

*Construction.* Multiplicativity, v^♭(0) = 0 and v^♭(1) = 1 hold because ♯ is a multiplicative map with 0^♯ = 0 and 1^♯ = 1 ([Q5.1](#q5-tilt-inverse-limit-monoid)). Ultrametric inequality: (x + y)^♯ = lim_n ((x^{1/p^n})^♯ + (y^{1/p^n})^♯)^{p^n} in the ϖ-adic topology, because b^{p^{n−1}} mod p^n depends only on b mod p; each term has value ≤ max(v(x^♯), v(y^♯)), and continuity of v transfers the bound to the limit. Continuity and v^♭(ϖ^♭) = v(ϖ) follow from (ϖ^♭)^♯ = unit·ϖ.

The API:

- `tiltValuation` (constructor): For v a continuous valuation on A with v(A) ≤ 1, the valuation x ↦ v(x^♯) on A^♭.
- `tiltValuation_apply` (simp): tiltValuation v x = v (x^♯) for x ∈ A^♭.
- `tiltValuation_le_one` (other): tiltValuation v x ≤ 1 for every x ∈ A^♭.
- `tiltValuation_pseudoUniformizer` (simp): tiltValuation v ϖ^♭ = v ϖ when (ϖ^♭)^♯ is a unit multiple of ϖ.
- `tiltValuation_isContinuous` (structure): tiltValuation v is continuous for the ϖ^♭-adic topology of A^♭.
- `tiltValuation_map` (functoriality): For a map f : A → B of integral perfectoid rings and w continuous on B, tiltValuation (w ∘ f) = tiltValuation w ∘ f^♭.
- `tiltValuation_charP` (compatibility): If pA = 0 then A^♭ = A, ♯ is the identity and tiltValuation v = v.
- `tiltValuation_field` (compatibility): For A = K° with K a perfectoid field and v its valuation, tiltValuation v is the valuation of K^♭° of PerfectoidSpaces P1.

**Checks.**

- `tiltValuation_OC` (compatibility): For A = O_C and v the valuation of C, tiltValuation v (p^♭) = v(p) and tiltValuation v is the valuation of C^♭ restricted to O_{C^♭}.
- `tiltValuation_perfect` (degenerate): For A a perfect F_p-algebra and ϖ = ϖ^♭ = 0, tiltValuation v = v for every valuation v on A.
- `tiltValuation_kills_pseudoUniformizer` (degenerate): If v(ϖ) = 0 (v factors through A/ϖ), then tiltValuation v kills ϖ^♭ and factors through A^♭/ϖ^♭, which ♯ identifies with A/ϖ by reducing [Q5.3](#q5-sharp-quotient-isomorphisms) modulo ϖ.
- `tiltValuation_not_lift` (non-example): Valuing an arbitrary lift of the zeroth coordinate is not well defined: for A = O_C and x = p^♭, the zeroth coordinate is 0 ∈ O_C/p with lifts 0 and p of different values, while tiltValuation v (p^♭) = v(p).

*Acceptance.* For A = O_C and v its rank-one valuation, v^♭ is the valuation of O_{C^♭} defined by |x|_♭ = |x^♯| (PerfectoidSpaces P1, tilt of a perfectoid field).

*Uses.* ČS24 proof of Lemma 2.3.1: the coordinatewise Witt-vector bounds in the proof are measured using v^♭ on the Teichmüller coordinates; PerfectoidSpaces P1, continuous valuations under tilting: the field case: valuations of K and of K^♭ correspond through x ↦ |x^♯|; ArcTopologyAndDescent AT.12, tilting complete arc covers: maps to complete rank-one valuation rings are matched under tilting.

*Needs:* [Q5.1](#q5-tilt-inverse-limit-monoid), [Q5.3](#q5-sharp-quotient-isomorphisms), [Q8.1](#q8-adic-continuity-criterion), PerfectoidSpaces:P1/tilt-of-perfectoid-field, Mathlib `Valuation`, PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings.

*Sources:* [CS24](#source-cs24) proof of Lemma 2.3.1, second paragraph and footnote, p. 23 — Defines the ϖ^♭-adically continuous valuation x ↦ |x^♯| on A^♭ and proves the triangle inequality from the limit formula for (x + x')^♯.

<a id="q8-integral-approximation-lemma"></a>

### Q8.3 The integral approximation lemma

**Theorem.** Let A be integral perfectoid and ϖ ∈ A with ϖ^p | p such that A is classically ϖ-adically complete; let a ∈ A and m ≥ 0. There is a' ∈ A^♭ such that for every continuous valuation |·| on A with |A| ≤ 1, |a − a'^♯| ≤ |p|·max(|a'^♯|, |ϖ|^{pm}); in particular |a| ≤ |ϖ^{pm}| if and only if |a'^♯| ≤ |ϖ^{pm}|.

*Hypotheses and conventions.* One may replace ϖ by an element whose p-th power is a unit multiple of p; this only enlarges the set of valuations and does not increase |ϖ|^p.

*Proof sketch.* The second assertion follows from the first by the ultrametric inequality. First replace ϖ by ρ with ρ^p a unit multiple of p, using [Q5.3](#q5-sharp-quotient-isomorphisms) and a p-th root of p^♭ in the tilt. For each original continuous valuation, |ρ|^p = |p| ≤ |ϖ|^p, and it is also continuous for the ρ-adic topology. The bound proved with ρ therefore implies the requested bound with ϖ. In the remaining proof write ϖ for ρ. Choose a generator ξ of ker θ with (ξ − [ξ̄])/p a unit of W(A^♭), ξ̄ = ξ mod p ([Q5.3](#q5-sharp-quotient-isomorphisms)), a lift z_0 ∈ W(A^♭) of a, and define z_{n+1} = [z̄_n] − [ξ̄]((ξ − [ξ̄])/p)^{−1}((z_n − [z̄_n])/p); put a' = z̄_m. Each z_n lifts a. For the tilted valuation |·|_♭ of [Q8.2](#q8-tilted-valuation), use the notation |z|_sup ≤ γ for the family of inequalities |z_{(j)}|_♭ ≤ γ for every j in the Teichmüller expansion z = Σ [z_{(j)}]p^j. Witt addition and multiplication preserve the corresponding ultrametric and product bounds. No maximum or supremum in the value group is assumed to exist. Since ξ̄ is a unit multiple of (ϖ^♭)^p, |z_{n+1} − [z̄_n]|_sup ≤ |ϖ^♭|_♭^p|z_n|_sup; an induction on n, distinguishing whether |z̄_N|_♭ first exceeds |ϖ^♭|_♭^{p(N+1)} before or after m, gives |z_m − [z̄_m]|_sup ≤ max(|z̄_m|_♭, |ϖ^♭|_♭^{pm}), and θ(z_m − [z̄_m]) = a − a'^♯ gives the claim.

*Acceptance.* For a = a''^♯ already a sharp, a' = a'' works with |a − a'^♯| = 0. For m = 0 the bound is |a − a'^♯| ≤ |p| for every valuation, and a' = z̄_0 is any element of A^♭ whose sharp is congruent to a modulo p.

*Needs:* [Q5.3](#q5-sharp-quotient-isomorphisms), [Q5.1](#q5-tilt-inverse-limit-monoid), [Q8.2](#q8-tilted-valuation), PerfectoidQuotients:Q0:integral-algebra/theta-generator-unit-coordinate, Mathlib `WittVector.teichmuller`, PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings.

*Sources:* [CS24](#source-cs24) Lemma 2.3.1, equations (2.3.1.1)–(2.3.1.2), and its proof, pp. 22–23 — Proves the integral approximation lemma after normalizing ϖ^p to a unit multiple of p, using recursive Witt lifts and coordinatewise bounds abbreviated by sup notation. It is an integral variant of Scholze, Perfectoid spaces, Corollary 6.7(i).

*Planet:* Integral approximation lemma.

<a id="q8-topological-nilpotence-criterion"></a>

### Q8.4 Topological nilpotence detected by continuous valuations

**Theorem (`isTopologicallyNilpotent_iff_forall_vlt_one`).** Let A be a ring with the ϖ-adic topology for a nonzerodivisor ϖ ∈ A, and give A[1/ϖ] the topology for which A is an open subring with its ϖ-adic topology. An element a ∈ A[1/ϖ] is topologically nilpotent (a^n ∈ ϖA for all large n) if and only if |a| &lt; 1 for every continuous valuation |·| on A[1/ϖ] with |A| ≤ 1. More generally the same holds for a Tate ring R, a ring of definition B ⊆ R and a ∈ R.

*Hypotheses and conventions.* Ring of definition: open and bounded; the statement fails for open unbounded subrings (for R = Q_p and B = Q_p no continuous valuation is ≤ 1 on B).

*Proof sketch.* If a^n ∈ ϖA then |a|^n ≤ |ϖ| &lt; 1. Conversely |a| ≤ 1 for all such valuations makes a integral over A (Wedhorn Proposition 7.18(1), Tau Ceti isIntegral_of_forall_continuous_valuation_le_one), so {a^i} is bounded. If A^{∘∘}·A[1/a] = A[1/a] then a satisfies a^N + Σ a_i a^i = 0 with a_i topologically nilpotent, so a is topologically nilpotent. Otherwise choose a maximal ideal 𝔪 ⊇ A^{∘∘}A[1/a] of A[1/a], a minimal prime 𝔭 ⊆ 𝔪 extending to a minimal prime of A[1/ϖ][1/a] (Stacks 00E0, 00FK), a valuation ring V dominating (A[1/a]/𝔭)_𝔪 (Stacks 00IA), and V̄ = V/∩ϖ^nV: the induced valuation on A[1/ϖ] is continuous, ≤ 1 on A and has |1/a| ≤ 1, contradicting |a| &lt; 1.

*Acceptance.* For A = Z_p, a = p/1 is topologically nilpotent and |p| &lt; 1 for every continuous valuation. For A = Z_p, a = 1 has |1| = 1 and is not topologically nilpotent. For A = Z_p⟨T⟩ and a = T, the Gauss valuation has |T| = 1, so T is not topologically nilpotent.

*Needs:* [Q8.1](#q8-adic-continuity-criterion), Tau Ceti `TauCeti.Huber.isIntegral_of_forall_continuous_valuation_le_one`, Tau Ceti `TauCeti.ValuationSpectrum.IsContinuous`, Tau Ceti `TauCeti.Huber.IsTateRing`, Mathlib `IsTopologicallyNilpotent`, Mathlib `ValuationSubring`.

*Sources:* [CS24](#source-cs24) Lemma 2.3.2 and its proof, p. 24 — States that a ∈ A[1/ϖ] is topologically nilpotent iff |a| &lt; 1 for all continuous valuations with |A| ≤ 1, a special case of Gabber–Ramero Corollary 15.4.27(ii), proved via Huber's Lemma 3.3(i) and a dominating valuation ring. [Wedhorn](#source-wedhorn) Proposition 7.18(1), pp. 60–61 — For an f-adic ring, open integrally closed subrings correspond to sets of continuous valuations; in particular an element bounded by 1 by all continuous valuations bounded by 1 on an open subring is integral over it.

*Planet:* Topological nilpotence criterion.

### Dependencies of Q8

*Needs:* PerfectoidQuotientsPartII:Q5, PerfectoidQuotients:Q0:integral-algebra, PerfectoidSpaces:P1.

## Layer Q9: The ind-syntomic André lemma and semiperfectoid covers

The André lemma adjoins compatible p-power roots of a root of every monic polynomial and takes p-integral closures, which keeps the completion perfectoid; dividing by the ϖ-divisible ideal generated by the polynomials keeps faithful flatness. The technical heart describes the p-integral closure for one polynomial as an increasing union of syntomic blowup algebras, by approximating the polynomial by a sharp with compatible roots. The corollary gives faithfully flat semiperfectoid covers of all p-Zariski rings.

<a id="q9-andre-root-extension"></a>

### Q9.1 The root extension of a set of monic polynomials

**Construction.** Let A be a ring and ϖ ∈ A a nonzerodivisor with ϖ^p | p admitting compatible p-power roots ϖ^{1/p^n} ∈ A, and let 𝒫 be a set of monic polynomials of positive degree in A[T]. Put A_0 = A[T_P^{1/p^n} : P ∈ 𝒫, n ≥ 0], the polynomial algebra on compatible p-power roots of one variable T_P for each P; A_∞ = A_0[P(T_P)/ϖ^m : P ∈ 𝒫, m ≥ 0] ⊆ A_0[1/ϖ] and I_∞ ⊆ A_∞ the ideal generated by the P(T_P)/ϖ^m; A' = the p-integral closure of A_∞ in A_∞[1/ϖ] = A_0[1/ϖ] (PerfectoidQuotients Q0, p-integral closure), and I' ⊆ A' the ideal generated by the P(T_P)/ϖ^m. Then I_∞ and I' are ϖ-divisible, A_∞/I_∞ = A_0/(P(T_P) : P ∈ 𝒫) inside its localization at ϖ, A'/I' is ϖ-torsion-free and is the p-integral closure of A_∞/I_∞ in (A_∞/I_∞)[1/ϖ], A'/I' is integral over A, (A'/I')[1/ϖ] is a filtered colimit of finite free A[1/ϖ]-algebras, and the class α_P of T_P in A'/I' is a root of P with compatible p-power roots, the classes of T_P^{1/p^n}.

*Hypotheses and conventions.* Positive degree is essential: for P = 1 one gets 1/ϖ^m ∈ A_∞, so I' is the unit ideal and A'/I' = 0. No completeness and no perfectoid hypothesis is needed for the construction; [Q9.3](#q9-ind-syntomic-andre-lemma) adds them.

*Construction.* A_∞[1/ϖ] = A_0[1/ϖ] since the adjoined elements lie there; I_∞ is ϖ-divisible because P(T_P)/ϖ^m = ϖ·P(T_P)/ϖ^{m+1}. Each P is monic, so A_0/(P(T_P))_P embeds in its localization at ϖ (ϖ, P(T_P) is regular), and every element of that subring lifts to A_0; hence A_∞/I_∞ = A_0/(P(T_P))_P, which is integral over A with (A_∞/I_∞)[1/ϖ] ind-finite-free over A[1/ϖ]. ϖ-divisibility of I' and the injectivity criterion of PerfectoidQuotients Q0 (p-integral closedness through Frobenius modulo ϖ) identify A'/I' with the p-integral closure of A_∞/I_∞; p-integral closures are integral (PerfectoidQuotients Q0).

The API:

- `AndreRootExtension` (constructor): The A-algebra A' attached to (A, ϖ, its roots, 𝒫), as a subring of A_0[1/ϖ].
- `AndreRootExtension.ideal` (data): The ideal I' ⊆ A' generated by the P(T_P)/ϖ^m.
- `AndreRootExtension.root` (data): For P ∈ 𝒫 and n ≥ 0, the class of T_P^{1/p^n} in A'/I'.
- `AndreRootExtension.root_pow` (simp): root P (n+1) ^ p = root P n.
- `AndreRootExtension.aeval_root` (simp): P evaluated at root P 0 is zero in A'/I'.
- `AndreRootExtension.ideal_varpi_divisible` (other): Every element of I' is ϖ times an element of I'.
- `AndreRootExtension.quotient_isIntegral` (structure): A'/I' is integral over A.
- `AndreRootExtension.quotient_isPIntegralClosure` (characterisation): A'/I' is the p-integral closure of A_0/(P(T_P))_P in its localization at ϖ.
- `AndreRootExtension.map` (functoriality): A map of data (A, ϖ, 𝒫) → (B, f(ϖ), f(𝒫)) induces A' → B' carrying I' into I' and roots to roots.
- `AndreRootExtension.inclusion` (projection): The canonical injective A-algebra map A' → A_0[1/ϖ], agreeing with the inclusion on A_∞.
- `AndreRootExtension.minimal` (universal-property): Inside the fixed ambient ring A_0[1/ϖ], A' is the least subring containing A_∞ and closed under p-th roots that lie in that ambient ring. This is a relative closure property, not uniqueness of polynomial roots in an arbitrary target.
- `AndreRootExtension.hom_ext` (extensionality): Two A-algebra maps from A' to a ϖ-torsion-free A-algebra that agree on the image of A_0 are equal: clear a power of ϖ for each element of A'.
- `AndreRootExtension.map_id` (simp): The map induced by the identity of the input data is the identity on A', its quotient and the chosen roots.
- `AndreRootExtension.map_comp` (functoriality): Maps induced by composable maps of input data compose, on A' and on A'/I'.

**Checks.**

- `andreRootExtension_empty` (degenerate): For 𝒫 = ∅, A' is the p-integral closure of A in A[1/ϖ] and I' = 0; for A already p-integrally closed in A[1/ϖ] (e.g. A = O_C, ϖ = p^{1/p}), A' = A.
- `andreRootExtension_linear` (computation): For 𝒫 = {T − a} the root α_{T−a} is the class of a, and the classes of T^{1/p^n} are compatible p-power roots of a in A'/I'.
- `andreRootExtension_T` (computation): For A = O_C, ϖ = p^{1/p} and 𝒫 = {T}, the root α_T is 0, while the class of T^{1/p} in A'/I' is a nonzero nilpotent: after inverting ϖ the ideal is (T), which does not contain T^{1/p}. Also T^{1/p} = ϖ^{m/p}(T/ϖ^m)^{1/p} in A', so its class is divisible by every ϖ^{m/p} and vanishes in the completion.
- `andreRootExtension_degree_zero` (non-example): Including the monic polynomial 1 in 𝒫 forces 1/ϖ ∈ A_∞ and A'/I' = 0, which is not faithfully flat over a nonzero A; positive degree cannot be dropped.

*Acceptance.* For 𝒫 = ∅, A' is the p-integral closure of A in A[1/ϖ] and I' = 0.

*Uses.* ČS24 Theorem 2.3.4: the André extension A' with its ϖ-divisible ideal I' is this construction for 𝒫 the set of all monic polynomials, then iterated countably and ϖ-Henselized; ČS24 §2.3 introduction, p. 22: killing the compatible roots of equations cutting out R inside a perfectoid cover of a regular ring.

*Needs:* PerfectoidQuotients:Q0:integral-algebra/p-integral-closure, PerfectoidQuotients:Q0:integral-algebra/p-integral-closedness-criterion, [Q7.5](#q7-regular-blowup-algebra), Mathlib `Localization.Away`, Mathlib `Polynomial.Monic`, Mathlib `Algebra.IsIntegral`.

*Sources:* [CS24](#source-cs24) proof of Theorem 2.3.4 (§2.3.6), first and second paragraphs, pp. 25–26 — Defines A_∞, its ϖ-divisible ideal I_∞, the p-integral closure A' and I', shows that the class of T_P is a root with compatible roots, that A'/I' is integral over A, ind-finite-free after inverting ϖ, and the p-integral closure of A_∞/I_∞ = A[T_P^{1/p^n}]/(P(T_P)).

<a id="q9-single-polynomial-p-integral-closure"></a>

### Q9.2 The p-integral closure for one polynomial

**Theorem.** Let A be ϖ-Henselian, with ϖ ∈ A a nonzerodivisor, ϖ^p | p, admitting compatible p-power roots, and with integral perfectoid ϖ-adic completion. Let P ∈ A[T] be monic of positive degree, m &gt; 0, A_0 = A[T^{1/p^∞}] and A'_m the p-integral closure of A_0[P/ϖ^m] in A_0[1/ϖ]. Then there are t ≥ 0 and q_j ∈ A_0 (j ≥ 0) such that: ϖ^{m/p^j}, q_j is an A_0-regular sequence; q_{j+1}^p ≡ q_j mod ϖ^{mp}A_0; the image of q_j in (A/ϖ^{1/p^{j+t}})[T^{1/p^n}] is monic for large n; the subalgebras A_0[q_j/ϖ^{m/p^j}] ≅ A_0[X_j]/(ϖ^{m/p^j}X_j − q_j) increase with j; and A'_m is their union. Consequently A'_m is ind-syntomic over A.

*Hypotheses and conventions.* An element of B[T^{1/p^∞}] is monic of degree d ∈ Z[1/p]_{≥0} if it is T^d plus a B-linear combination of T^e with e &lt; d. ϖ^{m/p^j} denotes (ϖ^{1/p^j})^m.

*Proof sketch.* Â_0, the ϖ-adic completion of A_0, is integral perfectoid (PerfectoidQuotients Q0, completed root polynomials). By [Q8.3](#q8-integral-approximation-lemma) there is Q ∈ Â_0 with compatible roots Q^{1/p^j} and |P − Q| &lt; max(|Q|, |ϖ^m|) for every continuous valuation on Â_0[1/ϖ] with |Â_0| ≤ 1. Then {|P/ϖ^m| ≤ 1} = {|Q/ϖ^m| ≤ 1} in Spa(Â_0[1/ϖ], Â_0^+), the continuous valuations of Â_0[P/ϖ^m] and Â_0[Q/ϖ^m] coincide, and by [Q8.4](#q8-topological-nilpotence-criterion) a power of P/ϖ^m − Q/ϖ^m lies in ϖ times either algebra; also P − Q ∈ ϖ^{1/p^t}Â_0 for some t by the iterated Frobenius bijections modulo ϖ^{1/p^n} (PerfectoidSpaces P1.24). So Q^{1/p^j} is monic modulo ϖ^{1/p^{j+t}}, ϖ^{m/p^j}, Q^{1/p^j} is regular (Stacks 07DV), Â_0[Q^{1/p^j}/ϖ^{m/p^j}] ≅ Â_0[X^{1/p^j}]/(ϖ^{m/p^j}X^{1/p^j} − Q^{1/p^j}) ([Q7.5](#q7-regular-blowup-algebra)), and the union over j has perfectoid completion, hence is p-integrally closed; it is the p-integral closure of both Â_0[P/ϖ^m] and Â_0[Q/ϖ^m]. Descend to A_0: choose d with (P − Q)^{p^d} ∈ ϖ^{mp^d} in both completed algebras, q ≡ Q mod ϖ^{mp^d} in A_0 and q_j ≡ Q^{1/p^j} mod ϖ^{mp}; the completions of A_0[P/ϖ^m] and A_0[q/ϖ^m] agree, so their p-integral closures agree, and the union of the A_0[q_j/ϖ^{m/p^j}] is p-integrally closed because modulo ϖ it is the completed perfectoid one. Ind-syntomicity: each A[T^{1/p^n}][X_j]/(ϖ^{m/p^j}X_j − q_j) is syntomic over A by [Q7.6](#q7-fibrewise-hypersurface-syntomic) (the element is linear in X_j where ϖ is invertible and monic in T^{1/p^n} where it is not), and filtered colimits of ind-syntomic algebras are ind-syntomic ([Q7.3](#q7-ind-maps-stability)).

*Acceptance.* For P = T one may take Q = T, t = 0 and q_j = T^{1/p^j}: A'_m = ∪_j A_0[T^{1/p^j}/ϖ^{m/p^j}], each stage A_0[X_j]/(ϖ^{m/p^j}X_j − T^{1/p^j}) being syntomic over A. The union is needed: for P = T and m = 1, T^{1/p}/ϖ^{1/p} is p-integral over A_0[T/ϖ] (its p-th power is T/ϖ) but is not in A_0[T/ϖ], whose elements have integral T^{1/p}-coefficient.

*Needs:* [Q9.1](#q9-andre-root-extension), [Q8.3](#q8-integral-approximation-lemma), [Q8.4](#q8-topological-nilpotence-criterion), [Q7.5](#q7-regular-blowup-algebra), [Q7.6](#q7-fibrewise-hypersurface-syntomic), [Q7.3](#q7-ind-maps-stability), [Q7.2](#q7-ind-syntomic-algebra), PerfectoidQuotients:Q0:integral-algebra/completed-root-polynomial-algebras, PerfectoidQuotients:Q0:integral-algebra/p-integral-closedness-criterion, PerfectoidQuotients:Q0:integral-algebra/compatible-roots-and-iterated-frobenius, PerfectoidSpaces:P1, Mathlib `RingTheory.Sequence.IsRegular`.

*Sources:* [CS24](#source-cs24) proof of Theorem 2.3.4 (§2.3.6), third to last paragraphs, equations (2.3.6.1)–(2.3.6.10), pp. 26–28 — Reduces ind-syntomicity to one monic P and m &gt; 0, approximates P by Q with compatible roots via Lemma 2.3.1, compares rational subsets and uses Lemma 2.3.2, describes the p-integral closure as the union of A_0[q_j/ϖ^{m/p^j}] and concludes with Stacks 00SW.

<a id="q9-ind-syntomic-andre-lemma"></a>

### Q9.3 The ind-syntomic André lemma

**Theorem.** Let A be a ring and ϖ ∈ A with ϖ^p | p admitting compatible p-power roots ϖ^{1/p^n} ∈ A, and suppose either (i) A is integral perfectoid and classically ϖ-adically complete, or (ii) A is ϖ-Henselian, ϖ is a nonzerodivisor of A, and the ϖ-adic completion of A is integral perfectoid. Then there are a faithfully flat, ind-syntomic, ϖ-Henselian A-algebra A' whose ϖ-adic completion Â' is integral perfectoid, and a ϖ-divisible ideal I' ⊆ A' with A'/I' faithfully flat over A, such that every monic polynomial P ∈ A'[T] of positive degree has a root α_P ∈ A'/I' admitting compatible p-power roots α_P^{1/p^n} ∈ A'/I'; in particular these roots exist in Â' ≅ (A'/I')^.

*Hypotheses and conventions.* ϖ-Henselian means that (A, ϖA) is a henselian pair; Henselizations of pairs are those of SchemeAndStackFoundations §0.12. Monic means monic of positive degree: the constant 1 has no root in a nonzero ring (recorded as a source issue).

*Proof sketch.* Reduce (i) to (ii): by [Q6.8](#q6-torsion-free-perfectoid-presentation) (2), A is a quotient of a ϖ̃-torsion-free, ϖ̃-complete integral perfectoid Ã with ϖ̃ having compatible roots lifting those of ϖ; a solution (Ã', Ĩ') for Ã gives A' = Ã' ⊗_Ã A with the image of Ĩ' (completed tensor products, PerfectoidQuotients Q0). In case (ii) it suffices to treat monic P ∈ A[T]: iterating countably many times, A'_∞ = colim A'_n with I'_∞ = Σ I'_iA'_∞ works for all monic polynomials over A'_∞, since each A'_n/ΣI'_i is faithfully flat over the previous one. ϖ-Henselianity is restored at the end by ϖ-Henselization, which is ind-étale and faithfully flat because ϖ lies in every maximal ideal (SchemeAndStackFoundations §§0.12–0.13; Stacks 00HP). For 𝒫 the monic polynomials over A take A', I' of [Q9.1](#q9-andre-root-extension). Its ϖ-adic completion is integral perfectoid by PerfectoidQuotients Q0 (perfectoid completion of p-integral closures), as every element of A_∞/ϖ^p is a p-th power. A'/I' is integral over A and ϖ-torsion-free with ind-finite-free localization, so Spec(A'/I') → Spec A is surjective, and A'/I' is A-flat by [Q7.4](#q7-flatness-glueing) once (A'/I')/ϖ ≅ A'/ϖ is A/ϖ-flat. Ind-syntomicity of A' over A (hence flatness of A'/ϖ) reduces by filtered colimits to finitely many, then one, monic P and to the p-integral closures A'_m of [Q9.2](#q9-single-polynomial-p-integral-closure).

*Acceptance.* For A = O_C (C complete algebraically closed) and ϖ = p^{1/p}, A' = A and I' = 0 satisfy the conclusion: O_C is complete, absolutely integrally closed, and every element has compatible p-power roots. For p odd, A the p-adic completion of Z_p[p^{1/p^∞}] (residue field F_p), ϖ = p^{1/p} and P = T² − u with u ∈ Z_p^× not a square, P has no root in A, while A'/I' contains a root of P with compatible p-power roots.

*Needs:* [Q9.1](#q9-andre-root-extension), [Q9.2](#q9-single-polynomial-p-integral-closure), [Q6.8](#q6-torsion-free-perfectoid-presentation), [Q7.4](#q7-flatness-glueing), [Q7.2](#q7-ind-syntomic-algebra), [Q7.3](#q7-ind-maps-stability), PerfectoidQuotients:Q0:integral-algebra/completed-perfectoid-tensor-products, PerfectoidQuotients:Q0:integral-algebra/completed-p-integral-closure-perfectoid, PerfectoidQuotients:Q0:integral-algebra/completely-etale-and-henselian-perfectoid, SchemeAndStackFoundations:SF.0, PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings, Mathlib `Module.FaithfullyFlat`, Mathlib `HenselianRing`.

*Sources:* [CS24](#source-cs24) Theorem 2.3.4, p. 25, and its proof (§2.3.6), pp. 25–28 — States the ind-syntomic André lemma under hypotheses (i) or (ii) and proves it following Gabber–Ramero Theorem 16.9.17, reducing (i) to (ii) by Proposition 2.1.12, iterating countably, Henselizing, and verifying flatness by glueing and ind-syntomicity one polynomial at a time.

*Planet:* Ind-syntomic André lemma.

<a id="q9-andre-lemma-consequences"></a>

### Q9.4 Consequences of the ind-syntomic André lemma

**Theorem.** In the situation of [Q9.3](#q9-ind-syntomic-andre-lemma): the integral perfectoid ring Â' contains compatible p-power roots of every element of A, and Â'/ϖ is faithfully flat over A/ϖ. In particular A → Â' is a ϖ-completely faithfully flat map to an integral perfectoid ring in which every element of A has compatible p-power roots, which recovers André's lemma in the form of Bhatt, On the direct summand conjecture, Theorem 1.5, with faithful flatness in place of almost faithful flatness modulo ϖ.

*Hypotheses and conventions.* Â' ≅ (A'/I')^ because I' is ϖ-divisible.

*Proof sketch.* Apply [Q9.3](#q9-ind-syntomic-andre-lemma) to the polynomials T − a, a ∈ A; their roots and the compatible roots of those roots lie in A'/I', hence in Â'. Â'/ϖ = A'/ϖ = (A'/I')/ϖ is faithfully flat over A/ϖ, A'/I' being faithfully flat over A.

*Acceptance.* For A a perfect F_p-algebra and ϖ = 0, every element of A has unique compatible p-power roots, Â' = A' and the assertion is faithful flatness of A' over A.

*Needs:* [Q9.3](#q9-ind-syntomic-andre-lemma), PerfectoidSpaces:P4, PerfectoidQuotients:Q3/andre-flatness-lemma.

*Sources:* [CS24](#source-cs24) Remark 2.3.5, p. 25 — Notes that Â' contains compatible p-power roots of every a ∈ A and that Â'/(ϖ) is faithfully flat over A/(ϖ), so the theorem recovers André's lemma in Bhatt's form, where only almost faithful flatness was required. [CS24](#source-cs24) §2.3, introduction, p. 22, and footnote 25 to the proof of Theorem 6.2.3, p. 84 — Relates the theorem to Bhatt–Scholze Theorem 7.14 and Remark 7.15, whose cover is p-completely faithfully flat and ind-syntomic modulo powers of p; either version suffices for the purity theorem.

<a id="q9-p-zariski-ring"></a>

### Q9.5 p-Zariski rings and p-Zariskization

**Definition (`IsPZariski`).** A ring A is p-Zariski if 1 + pA ⊆ A^×, equivalently if p lies in the Jacobson radical of A (in every maximal ideal). The p-Zariskization of a ring B is the localization B_{1+pB} of B at the multiplicative set 1 + pB.

*Hypotheses and conventions.* p is a fixed prime; the zero ring is p-Zariski.

*Construction.* 1 + pB is multiplicatively closed: (1 + pb)(1 + pc) = 1 + p(b + c + pbc). The equivalence with the Jacobson radical is the characterisation of the Jacobson radical by units of 1 + xA.

The API:

- `IsPZariski` (constructor): The predicate ∀ a : A, IsUnit (1 + p \* a).
- `IsPZariski.iff_mem_jacobson` (characterisation): A is p-Zariski iff (p : A) ∈ Ideal.jacobson ⊥.
- `pZariskiSubmonoid` (constructor): The submonoid 1 + pB of B.
- `PZariskization` (constructor): The localization of B at pZariskiSubmonoid B.
- `PZariskization.isPZariski` (structure): The p-Zariskization of B is p-Zariski.
- `PZariskization.lift` (universal-property): For a p-Zariski ring C, every ring map f : B → C extends to a ring map from the p-Zariskization.
- `PZariskization.lift_comp` (universal-property): The extension composed with the localization map B → B_{1+pB} is f.
- `PZariskization.lift_unique` (universal-property): Any ring map from the p-Zariskization whose composite with the localization map is f equals the extension.
- `IsPZariski.of_isAdicComplete` (compatibility): A classically p-adically complete ring is p-Zariski.
- `IsPZariski.of_henselian` (compatibility): If (A, pA) is a henselian pair then A is p-Zariski.
- `IsPZariski.quotient` (functoriality): Quotients of p-Zariski rings are p-Zariski.

**Checks.**

- `pZariski_zmod_ppow` (computation): Z/p^nZ is p-Zariski, p being nilpotent.
- `pZariskization_int` (computation): The p-Zariskization of Z is Z_(p): every n prime to p has n^{p−1} ∈ 1 + pZ.
- `not_pZariski_rat` (non-example): Q is not p-Zariski: 1 + p·(−1/p) = 0 is not a unit.
- `not_pZariski_int` (non-example): Z is not p-Zariski: 1 + p is not a unit of Z.
- `pZariski_zero` (degenerate): The zero ring is p-Zariski.

*Acceptance.* A p-adically complete ring is p-Zariski.

*Uses.* ČS24 Corollary 2.3.7: the class of rings admitting faithfully flat semiperfectoid covers; ČS24 proof of Corollary 2.3.7: p-Zariskizations of root-adjoining iterations and of Z[p^{1/p^∞}][X_a^{1/p^∞}].

*Needs:* Mathlib `Ideal.jacobson`, Mathlib `Localization`, Mathlib `Submonoid`, Mathlib `IsUnit`.

*Sources:* [CS24](#source-cs24) Corollary 2.3.7 and first paragraph of its proof, p. 28 — Defines p-Zariski rings by 1 + pA ⊆ A^×, equivalently p in the Jacobson radical, and the p-Zariskization B_{1+pB}.

<a id="q9-semiperfectoid-covers"></a>

### Q9.6 Semiperfectoid covers of p-Zariski rings

**Theorem.** Every p-Zariski ring A admits a faithfully flat map A → A_∞ such that: the p-adic completion of the reduced ring A_∞^red is integral perfectoid; A_∞ is a quotient of a p-torsion-free, p-Henselian ring Ã_∞ whose p-adic completion is integral perfectoid; and every monic polynomial of positive degree over Ã_∞ has a root in Ã_∞, hence also over A_∞ and over A_∞^red.

*Hypotheses and conventions.* Monic polynomials of positive degree; A = 0 is allowed with A_∞ = 0.

*Proof sketch.* Replace A by the p-Zariskization of the countable iteration of A ↦ A[X_a^{1/p^∞} : a ∈ A]/(X_a − a : a ∈ A); this is faithfully flat (each step is free, and p-Zariskization preserves faithful flatness over p-Zariski rings), and now every a ∈ A has compatible p-power roots. Such A is a quotient of the p-torsion-free Z_(p)-algebra Ã, the p-Zariskization of Z[p^{1/p^∞}][X_a^{1/p^∞} : a ∈ A], whose p-adic completion is integral perfectoid (PerfectoidQuotients Q0, completed root polynomials). Apply [Q9.3](#q9-ind-syntomic-andre-lemma) (ii) to the p-Henselization Ã^h of Ã, with ϖ = p^{1/p}. Write its output as B with ideal J, and take Ã_∞ = C = B/J: it is C that has roots of all positive-degree monic polynomials, by lifting their coefficients to B. The map Ã^h → C is faithfully flat, so C is p-torsion-free; it is p-Henselian as a quotient of B, and J being ϖ-divisible gives the same p-adic completion as B, hence an integral perfectoid completion. The map Ã → Ã^h is faithfully flat because Ã is p-Zariski. Put A_∞ = C ⊗_Ã A; this is a quotient of C since A is a quotient of Ã. A_∞ is faithfully flat over A. Every element of the nilradical of A_∞ has a p-th root in it (the root of T^p − s lies in the radical ideal), so the p-adic completion of A_∞^red is integral perfectoid by PerfectoidQuotients Q0, completed root-stable quotients (Česnavičius–Scholze Proposition 2.1.11(c); the source cites part (d)).

*Acceptance.* For A = Z_(p), the integral closure Z̄_p of Z_p in an algebraic closure of Q_p is a valid A_∞ = Ã_∞: it is faithfully flat over Z_(p), p-torsion-free, henselian along p, absolutely integrally closed, and its p-adic completion O_{C_p} is integral perfectoid. For A = F_p, A_∞ = Z̄_p/p is a valid choice: faithfully flat over F_p, a quotient of Z̄_p as above, with A_∞^red = F̄_p.

*Needs:* [Q9.3](#q9-ind-syntomic-andre-lemma), [Q9.5](#q9-p-zariski-ring), PerfectoidQuotients:Q0:integral-algebra/completed-root-polynomial-algebras, PerfectoidQuotients:Q0:integral-algebra/completed-root-stable-quotients, SchemeAndStackFoundations:SF.0, Mathlib `Module.FaithfullyFlat`.

*Sources:* [CS24](#source-cs24) Corollary 2.3.7 and its proof, pp. 28–29 — States that every p-Zariski ring has a faithfully flat map to A_∞ with perfectoid completed reduction, a quotient of a p-torsion-free p-Henselian Ã_∞ with perfectoid completion in which monic polynomials have roots, proved by adjoining roots, p-Zariskizing, and applying Theorem 2.3.4.

*Planet:* Semiperfectoid covers of p-Zariski rings.

### Dependencies of Q9

*Needs:* PerfectoidQuotientsPartII:Q6, PerfectoidQuotientsPartII:Q7, PerfectoidQuotientsPartII:Q8, PerfectoidQuotients:Q0:integral-algebra, PerfectoidQuotients:Q3, PerfectoidSpaces:P1, PerfectoidSpaces:P4, SchemeAndStackFoundations:SF.0.

## Layer Q10: Complete regular local rings: towers, prismatic covers and the Heitmann–Ma application

For complete regular local rings the layer relates Česnavičius–Scholze's Lemma 3.1.1 to the towers of PerfectoidSpaces P7, constructs Bhatt–Scholze's perfectoid faithfully flat cover by perfecting a prism, and derives Bhatt–Scholze's almost vanishing of Tor along finite subextensions of R⁺ from almost purity along an arbitrary ideal. That derivation needs a perfectoid cover mapping into the completed absolute integral closure; it is constructed here for perfect residue fields, and recorded as a gap otherwise.

<a id="q10-regular-local-towers"></a>

### Q10.1 Towers over complete regular local rings

**Comparison.** Let (R, 𝔪) be a complete regular local ring with residue field k. (a) There is a filtered direct system (R_i, 𝔪_i)_{i∈I} of regular local finite flat R-algebras with 𝔪_i = 𝔪R_i, each unramified if R is unramified (mixed characteristic (0, p) with p ∉ 𝔪²), whose colimit (colim R_i, colim 𝔪_i) is a regular local ring with residue field an algebraic closure k̄ of k. (b) If R has mixed characteristic (0, p) and k is perfect, write R ≅ W(k)⟦x_1, …, x_d⟧/(p − f) with f = x_1 (R unramified) or f ∈ (p, x_1, …, x_d)² (R ramified). Then R_n = W(k)⟦x_1^{1/p^n}, …, x_d^{1/p^n}⟧/(p − f) are regular local finite flat R-algebras of p-power rank, R_∞ = colim_n R_n = W(k)⟦x^{1/p^∞}⟧/(p − f) (colimit, not completed), and the p-adic completion of R_∞ is integral perfectoid.

*Hypotheses and conventions.* Unramified is the convention of Česnavičius–Scholze §1.4: mixed characteristic (0, p) and p ∉ 𝔪². The bracket ⟦x^{1/p^∞}⟧ denotes the colimit of the power series rings in x^{1/p^m}, without a further (x)-adic completion.

*Proof sketch.* (a) is PerfectoidSpaces P7.16a (Česnavičius, Purity for the Brauer group, Lemma 5.1): its stages are W_i⟦x⟧ or W_i⟦x⟧/(p − f) with W_i complete discrete valuation rings with uniformizer p, so they are unramified exactly when R is. (b) is PerfectoidSpaces P7.17 (Česnavičius, Lemma 5.2) in a uniform presentation: for f = x_1, W(k)⟦x⟧/(p − x_1) ≅ W(k)⟦x_2, …, x_d⟧ and R_n ≅ W(k)[p^{1/p^n}]⟦x_2^{1/p^n}, …, x_d^{1/p^n}⟧, which is P7.17's unramified tower; for f ∈ (p, x)² the towers agree literally.

*Acceptance.* For R = Z_p (d = 1, f = x_1): R_n = Z_p[p^{1/p^n}] and the completion of R_∞ is that of Z_p[p^{1/p^∞}]. For R = Z_p⟦x⟧/(p − x²) = Z_p[√p] (ramified, p ∈ 𝔪²): R_n = Z_p⟦x^{1/p^n}⟧/(p − x²). For R = F_p⟦x⟧ in (a) the stages are F_{p^n}⟦x⟧ and the colimit is not complete.

*Needs:* PerfectoidSpaces:P7/regular-finite-flat-residue-tower, PerfectoidSpaces:P7/regular-finite-flat-perfectoid-tower, Mathlib `IsRegularLocalRing`.

*Sources:* [CS24](#source-cs24) Lemma 3.1.1 and its proof, p. 29; §1.4, unramified regular local rings and the notation ⟦x^{1/p^∞}⟧, p. 8 — States the filtered system of regular finite flat R-algebras with algebraically closed residue field of the colimit, unramified if R is, and for perfect k the tower W(k)⟦x^{1/p^n}⟧/(p − f) with perfectoid completed colimit, restating Česnavičius's Lemmas 5.1 and 5.2. [Ces19](#source-ces19) §5, Lemmas 5.1 and 5.2 and their proofs, pp. 11–12 — Constructs the residue-field tower over a complete regular local ring and, for perfect residue field, the p-power root tower whose p-adic completion is perfectoid.

<a id="q10-prismatic-cover-of-regular-local-ring"></a>

### Q10.2 Perfectoid covers of complete regular local rings via prisms

**Theorem.** Let R be a complete noetherian regular local ring of dimension d and mixed characteristic (0, p) with residue field k (not necessarily perfect). Choose a Cohen ring W for k with a Frobenius lift φ_W and write R = A/(f) with A = W⟦x_1, …, x_d⟧ and f ∈ 𝔪_A ∖ 𝔪_A² (Cohen structure theorem). Then A carries a δ-structure extending φ_W with φ(x_i) = x_i^p for which f is distinguished (after a change of variables when f ∈ (x_1, …, x_d) + 𝔪_A²), (A, (f)) is a prism, its perfection (A_∞, (f)) is a perfect prism, R_∞ = A_∞/(f) is integral perfectoid, and R → R_∞ is faithfully flat.

*Hypotheses and conventions.* The decomposition of f in 𝔪_A/𝔪_A² as a_0p + Σa_ix_i distinguishes the cases a_0 ≠ 0 and a_0 = 0; in the second, change variables to f = x_1 − p. Faithful flatness is ordinary faithful flatness, obtained from p-complete faithful flatness because R is noetherian.

*Proof sketch.* If a_0 ≠ 0, evaluation at x = 0 is a δ-map A → W with topologically nilpotent kernel carrying f to an element of p-adic valuation one, so f is distinguished (PrismaticCohomology PR.0, distinguished elements and rigidity); if a_0 = 0, after the change of variables f = x_1 − p and the same δ-structure, f is distinguished. A is p-torsion-free and A/p = k⟦x⟧ is regular, so φ_A is p-completely faithfully flat (Kunz, EnhancedDerivedSheaves §E1.6); the perfection of the prism is a p-completely faithfully flat map of prisms with perfect target (PrismaticCohomology PR.0, perfection of a prism). R_∞ = A_∞/(f) is integral perfectoid by the perfect-prism equivalence, and R → R_∞ is p-completely faithfully flat. Since p is a nonzerodivisor on R, derived p-complete flatness gives Tor_1^R(R_∞, R/p) = R_∞[p] = 0. Both rings are classically p-complete (for R use its noetherian maximal-ideal completeness and p ∈ 𝔪). The noetherian-base criterion of DerivedDeRhamCohomology DD.1 now gives ordinary flatness, and nonzero closed fibre gives faithful flatness.

*Acceptance.* For R = Z_p (d = 1): A = Z_p⟦x_1⟧ and f = p − x_1 has a_0 ≠ 0; the perfection is the completed Z_p⟦x_1^{1/p^∞}⟧ and R_∞ is the p-adic completion of Z_p[p^{1/p^∞}]. The presentation must use d = dim R variables: writing Z_p = W(F_p)/(p) instead would give the crystalline prism (Z_p, (p)), whose perfection has reduction F_p, which is not faithfully flat over Z_p. For R = W(k)⟦x⟧ with k perfect and f = x_1 − p, R_∞ is the p-adic completion of the tower of [Q10.1](#q10-regular-local-towers) (b).

*Needs:* PrismaticCohomology:PR.0/distinguished-element, PrismaticCohomology:PR.0/distinguished-factor-rigidity, PrismaticCohomology:PR.0/prism-perfection, PrismaticCohomology:PR.0/perfect-prisms-perfectoid-rings, PerfectoidSpaces:P7/regular-finite-flat-residue-tower, EnhancedDerivedSheaves:E1, DerivedDeRhamCohomology:DD.1/ordinary-flatness-from-complete-flatness, Mathlib `IsRegularLocalRing`, Mathlib `PowerSeries`.

*Sources:* [BS22](#source-bs22) Remark 3.11, pp. 32–33 — Constructs, for a complete regular local ring of residue characteristic p written as W⟦x⟧/(f) with f ∈ 𝔪 − 𝔪², a δ-structure making f distinguished, perfects the prism (A, (f)), and deduces a faithfully flat map R → R_∞ with R_∞ perfectoid, using Bhatt's Proposition 5.1 for faithful flatness.

<a id="q10-absolute-integral-closure-completion"></a>

### Q10.3 The completed absolute integral closure is perfectoid

**Lemma.** Let R be a domain whose fraction field K has characteristic 0, with p a nonunit of R, and let R⁺ be the integral closure of R in an algebraic closure of K. Then R⁺ is p-torsion-free and absolutely integrally closed, and its p-adic completion (R⁺)^∧ is integral perfectoid; every element of R⁺ has compatible p-power roots in R⁺.

*Hypotheses and conventions.* R need not be noetherian or complete. p is a nonunit of R⁺ because R → R⁺ is integral.

*Proof sketch.* R⁺ is a domain of characteristic 0, hence p-torsion-free; it is integrally closed in its fraction field, which is algebraically closed, so every monic polynomial of positive degree over R⁺ has a root in R⁺; in particular p^{1/p} ∈ R⁺, Frobenius of R⁺/p is surjective, and compatible p-power roots exist by choosing roots successively. With π = p^{1/p}, (π^p) = (p) and R⁺ is integrally closed in R⁺[1/p], so the p-adic completion is integral perfectoid by PerfectoidQuotients Q0 (p-integral closedness criterion, ordinary integral closedness form).

*Acceptance.* For R = Z_p, R⁺ = Z̄_p and (R⁺)^∧ = O_{C_p}. Characteristic 0 is needed for p^{1/p} to separate p-adic and characteristic-p behaviour: for R = F_p⟦t⟧, R⁺ is a perfect ring and p = 0, so (R⁺)^∧ = R⁺ is perfect.

*Needs:* PerfectoidQuotients:Q0:integral-algebra/p-integral-closedness-criterion, Mathlib `integralClosure`, Mathlib `AlgebraicClosure`, Mathlib `IsAlgClosed`.

*Sources:* [BS22](#source-bs22) Remark 10.13, p. 84 — Uses that the p-adic completion of R⁺ is perfectoid to obtain the map T_perfd → R⁺/p^n from the universal property of perfectoidization. [Ces19](#source-ces19) Lemma 4.7, p. 8 — For a p-torsion-free ring with (π^p) = (p), integral closedness in its p-inverted ring and surjective Frobenius modulo p make its p-adic completion perfectoid.

<a id="q10-perfectoid-cover-inside-plus-closure"></a>

### Q10.4 A perfectoid cover inside the completed absolute integral closure

**Theorem.** Let (R, 𝔪) be a complete regular local ring of mixed characteristic (0, p) with perfect residue field k, and R⁺ an absolute integral closure. The tower R_n of [Q10.1](#q10-regular-local-towers) (b) embeds R-linearly into R⁺ by choosing compatible roots of the x_i in R⁺; with R_∞ = colim R_n ⊆ R⁺, the map R → R̂_∞ to the p-adic completion is faithfully flat, R̂_∞ is integral perfectoid, and R̂_∞ → (R⁺)^∧ is an injective R-algebra map.

*Hypotheses and conventions.* Choices: compatible systems x_i^{1/p^n} ∈ R⁺ ([Q10.3](#q10-absolute-integral-closure-completion)); for f = x_1 the roots of x_1 are roots of p.

*Proof sketch.* Each R_n is a domain finite over R, so it embeds in R⁺ once the roots of the x_i are chosen compatibly; the embeddings are compatible in n. R → R_n is finite free (finite flat over a local ring), so R → R_∞ is faithfully flat and R/p → R_∞/p = R̂_∞/p is faithfully flat; R and R̂_∞ are p-torsion-free and p-complete, so R → R̂_∞ is faithfully flat (DerivedDeRhamCohomology DD.1, Bhatt's criterion). R_∞ is integrally closed (a filtered union of regular, hence normal, domains), so R_∞ ∩ pR⁺ = pR_∞ and the completed map is injective.

*Acceptance.* For R = Z_p: R_∞ = Z_p[p^{1/p^∞}] ⊆ Z̄_p and R̂_∞ ⊆ O_{C_p}. For imperfect k the explicit tower does not apply; [Q10.2](#q10-prismatic-cover-of-regular-local-ring) gives a faithfully flat perfectoid cover, but no map to (R⁺)^∧ is constructed here (recorded gap).

*Needs:* [Q10.1](#q10-regular-local-towers), [Q10.3](#q10-absolute-integral-closure-completion), DerivedDeRhamCohomology:DD.1/ordinary-flatness-from-complete-flatness, Mathlib `Module.FaithfullyFlat`, Mathlib `integralClosure`.

*Sources:* [BS22](#source-bs22) Remark 10.13, p. 84 — Chooses a faithfully flat extension R → R_∞ contained in the p-adic completion of R⁺ with R_∞ perfectoid, referring to Remark 3.11. [Ces19](#source-ces19) Lemma 5.2 and its proof, p. 12 — The tower of p-power roots over a complete regular local ring with perfect residue field and the perfectoidness of its completed colimit.

<a id="q10-almost-tor-vanishing-plus-closure"></a>

### Q10.5 Almost vanishing of Tor along finite subextensions of R⁺

**Theorem.** Let R be a complete regular local ring of mixed characteristic (0, p), R⁺ an absolute integral closure, S ⊆ R⁺ a finite R-subalgebra, n &gt; 0, and c ∈ pR nonzero with R[1/c] → S[1/c] finite étale. Suppose given a faithfully flat map R → R_∞ to an integral perfectoid ring together with an R-algebra map R_∞ → (R⁺)^∧. Then for every i &gt; 0 and every R/p^n-module N, the image of Tor_i^{R/p^n}(S/p^n, N) → Tor_i^{R/p^n}(R⁺/p^n, N) is annihilated by c^{1/p^k} for every k ≥ 0 (for any compatible system of p-power roots of c in R⁺). When the residue field of R is perfect, the hypothesis on R_∞ is satisfied by [Q10.4](#q10-perfectoid-cover-inside-plus-closure).

*Hypotheses and conventions.* Such c exists: S is generically étale over R since Frac(R) has characteristic 0, and multiplying a nonzero element by p keeps the étale locus. c-almost zero means annihilated by all c^{1/p^k}; it is the J_perfd-almost zero condition for J = (c) after mapping to R⁺, where c has compatible roots.

*Proof sketch.* T = S ⊗_R R_∞ is a finitely presented finite R_∞-algebra, finite étale after inverting c. By Bhatt–Scholze Theorem 10.9 (PrismaticCohomology Part I, integral perfectoidization and arbitrary-ideal almost purity), T_perfd is integral perfectoid and R_∞/p^n → T_perfd/p^n is almost finite projective for the almost setting attached to J = (c). As R/p^n → R_∞/p^n is flat, Tor_i^{R/p^n}(T_perfd/p^n, N) = Tor_i^{R_∞/p^n}(T_perfd/p^n, R_∞ ⊗_R N), which is c-almost zero for i &gt; 0; here c ∈ pR and the p-torsion of T_perfd, killed by all p^{1/p^k} ([Q5.4](#q5-torsion-transfer)), is c-almost zero. S/p^n → R⁺/p^n factors as S/p^n → T/p^n → T_perfd/p^n → R⁺/p^n, the last map by the universal property of T → T_perfd (Bhatt–Scholze Theorem 10.11) applied to T → (R⁺)^∧, which is integral perfectoid ([Q10.3](#q10-absolute-integral-closure-completion)). The middle Tor group being c-almost zero gives the claim.

*Acceptance.* If S = R the map is from Tor_i^{R/p^n}(R/p^n, N) = 0 for i &gt; 0, and the statement is empty. If R → S is finite étale, S/p^n is flat over R/p^n, the source Tor groups vanish for i &gt; 0, and any c ∈ pR works.

*Needs:* [Q10.4](#q10-perfectoid-cover-inside-plus-closure), [Q10.3](#q10-absolute-integral-closure-completion), [Q5.4](#q5-torsion-transfer), PrismaticCohomology:PR.2, PerfectoidSpaces:P0/almost-flat-projective-finiteness, PerfectoidSpaces:P0/root-ideal-basic-setup, Mathlib `CategoryTheory.Tor`, Mathlib `Module.Flat`, PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings.

*Sources:* [BS22](#source-bs22) Remark 10.13, pp. 83–84 — Explains how Theorem 10.9 yields the main theorems of Heitmann–Ma: for a finite extension R → S inside R⁺ and c ∈ pR with R[1/c] → S[1/c] finite étale, the maps Tor_i^{R/p^n}(S/p^n, −) → Tor_i^{R/p^n}(R⁺/p^n, −) are c-almost zero, via T = S ⊗ R_∞ and its perfectoidization. [HM17](#source-hm17) Theorem 1.3, p. 2 — States, for a complete regular local ring of mixed characteristic with F-finite residue field and a finite extension domain S, a nonzero c ∈ R such that c^ε kills the image of Tor_i^R(S, M)/p^N in Tor_i^R(S⁺, M)/p^N for all i ≥ 1, N, ε &gt; 0.

*Planet:* Almost Tor vanishing for R⁺.

### Dependencies of Q10

*Needs:* PerfectoidQuotientsPartII:Q5, DerivedDeRhamCohomology:DD.1, EnhancedDerivedSheaves:E1, PerfectoidQuotients:Q0:integral-algebra, PerfectoidSpaces:P0, PerfectoidSpaces:P7, PrismaticCohomology:PR.0, PrismaticCohomology:PR.2.

## Examples

- `O_C` and `O_{C^♭}` (for `C` complete and algebraically closed) are perfectoid valuation rings with the same value group;
  their tilting is the field case of Q6.4 and Q6.7, and the André lemma is trivial for `O_C` (Q9.3, acceptance).
- The completion of `ℤ_p[p^{1/p^∞}]` is a perfectoid valuation ring whose tilt is the `t`-adic completion of
  `𝔽_p[t^{1/p^∞}]`; neither fraction field is algebraically closed (Q6.7). It is the completed tower of Q10.1 for
  `R = ℤ_p` and the prismatic cover of Q10.2 for `R = ℤ_p`.
- A perfect `𝔽_p`-algebra is its own tilt with `♯` the identity (Q5.1), and the sharp quotient and product identities of Q5 specialize to the corresponding characteristic-p identities.
- `O_C/(p^{1/p^∞}) = k_C` (the residue field) and products of perfectoid valuation rings show that perfectoid rings may have `p`-torsion and need
  not be domains (Q5.4, Q6.4).
- `W(k)⟦x_1^{1/p^∞}, …, x_d^{1/p^∞}⟧/(p − f)` with `f = x_1` (unramified) or `f ∈ (p, x)²` (ramified) is the tower of
  Q10.1(b); its `p`-adic completion is perfectoid.

## Recorded gaps

- **A perfectoid cover inside (R⁺)^∧ for imperfect residue fields** (needed by [Q10.5](#q10-almost-tor-vanishing-plus-closure)). This plan has not supplied, for arbitrary imperfect residue field, the following input used in Bhatt–Scholze Remark 10.13 (pp. 83–84): a faithfully flat map R → R_∞ to an integral perfectoid ring together with an R-algebra map R_∞ → (R⁺)^∧. [Q10.2](#q10-prismatic-cover-of-regular-local-ring) supplies a faithfully flat perfectoid cover; the proof sketch here does not identify a compatible map from that cover to (R⁺)^∧. [Q10.4](#q10-perfectoid-cover-inside-plus-closure) supplies both maps for perfect residue fields. Consequently [Q10.5](#q10-almost-tor-vanishing-plus-closure) retains the cover and its map as explicit hypotheses in general and is unconditional for perfect residue fields. This is an unresolved input of this plan, not an independently established error in the paper.

## Source checks

Confirmed findings are E1, E3 and E5. E2 and E4 are retained with their rejected review verdicts so that they are not presented as established errors.

- **PerfectoidQuotientsPartII/E1 — confirmed** (misprint, [CS24](#source-cs24), Proof of Corollary 2.3.7, last sentence, p. 29, in arXiv v3). The proof invokes Proposition 2.1.11(d), the statement about products of perfectoid rings, to conclude that the p-adic completion of A_∞^red is perfectoid. Correction or clarification: Proposition 2.1.11(c): the completion of a quotient by an ideal whose elements have p-power roots in it. Review: Part (c) is the root-stable quotient assertion needed in the proof; part (d) is the product assertion. The wrong cross-reference is visible in arXiv v3, p. 29.

- **PerfectoidQuotientsPartII/E2 — rejected** (gap, [CS24](#source-cs24), Proof of Theorem 2.3.4 (§2.3.6), first paragraph, p. 25, in arXiv v3; Proposition 2.1.12 and its proof, pp. 17–18). The reduction of case (i) to case (ii) uses Proposition 2.1.12 and needs a torsion-free presentation whose lifted parameter has compatible p-power roots. The proposition states only existence of a lift. Correction or clarification: When ϖ has compatible p-power roots, take ϖ^♭ = (ϖ^{1/p^n})_n, so that the unit u is 1, take ũ = 1 and Ã = Ã'; then ϖ̃ = (X_{ϖ^♭})^♯ has the compatible roots ((X_{ϖ^♭})^{1/p^n})^♯ lifting ϖ^{1/p^n}. This strengthened Proposition 2.1.12 is [Q6.8](#q6-torsion-free-perfectoid-presentation) (2). Review: Not a demonstrated gap: the proof of Proposition 2.1.12 itself supplies the compatible lifts by setting u = ũ = 1 and using the chosen root variable. Q6.8(2) usefully makes this choice explicit.

- **PerfectoidQuotientsPartII/E3 — confirmed** (misprint, [CS24](#source-cs24), Theorem 2.3.4, p. 25, and its proof (§2.3.6), first paragraph, p. 25, in arXiv v3). Every monic P ∈ A'[T] is asserted to have a root in A'/I', and the proof takes 𝒫 to be the set of all monic polynomials in A[T]. Correction or clarification: Monic polynomials of positive degree. Review: Read literally, monic includes 1. Over any nonzero base 1 has no root, so positive degree must be the intended convention. The corrected nodes and reader impose it.

- **PerfectoidQuotientsPartII/E4 — rejected** (gap, [BS22](#source-bs22), Remark 10.13, pp. 83–84, in arXiv v4). The argument chooses a faithfully flat extension R → R_∞ contained inside the p-adic completion of R⁺ with R_∞ perfectoid, referring to Remark 3.11. Correction or clarification: For perfect residue field use the explicit tower of p-power roots chosen inside R⁺ (Česnavičius, Lemma 5.2), which is contained in (R⁺)^∧. For imperfect residue field an argument that the prismatic cover of Remark 3.11 maps to (R⁺)^∧ over R is needed; it is recorded as a gap of this plan. Review: The absence of a constructed map in this plan, and failure of one proposed lift, do not independently establish a source error. Retain the exact missing map as a plan gap and the general Tor theorem as conditional.

- **PerfectoidQuotientsPartII/E5 — confirmed** (misprint, [CS24](#source-cs24), §2.3.3, stability under finite products, p. 24, in arXiv v3). The stability assertion for ind-fppf and ind-syntomic algebras includes finite products without specifying a nonempty index set. Correction or clarification: For ind-fppf algebras require a nonempty finite product; ind-syntomic algebras allow the empty product as well. The empty product is the zero algebra, which is not faithfully flat over ℤ. Q7.1 and Q7.3 impose the nonempty condition for ind-fppf products and include a negative test.

## Inputs from other roadmaps

- **PerfectoidSpaces:P1** (for [Q5.3](#q5-sharp-quotient-isomorphisms), [Q9.2](#q9-single-polynomial-p-integral-closure)). Upstream PerfectoidSpaces (TauCetiRoadmap pull request #818) §P1.24: the integral perfectoid predicate IsIntegralPerfectoid (BMS1 Definition 3.5, zero ring allowed), bijectivity of Frobenius R/π → R/π^p for π^p | p and R π-adically complete without a nonzerodivisor hypothesis (BMS1 Lemma 3.10(i)), and compatible p-power roots of unit multiples of π and p (BMS1 Lemma 3.9); §P1.25 for the rank-one valuation ring case (ring of integers of a perfectoid field).
- **PerfectoidSpaces:P4** (for [Q9.4](#q9-andre-lemma-consequences)). Upstream PerfectoidSpaces §P4.15.4: André's p-completely faithfully flat, absolutely integrally closed integral perfectoid cover (Bhatt–Scholze Theorem 7.14), against which the ind-syntomic André lemma is compared.
- **PrismaticCohomology:PR.2** (for [Q10.5](#q10-almost-tor-vanishing-plus-closure)). Upstream PrismaticCohomology Part I (TauCetiRoadmap pull request #1057) §2.30 (Bhatt–Scholze Proposition 8.5, Corollaries 8.11–8.12: perfect-site description and base independence of the possibly derived S_perfd, arc excision) and §2.31 (Prismatic.Perfectoidization.integral_discrete, Bhatt–Scholze Theorem 10.11, and Prismatic.Perfectoidization.almostPurity, Theorem 10.9: for a finitely presented finite algebra over a perfectoid ring, finite étale away from V(J), R/p^n → S_perfd/p^n is almost finite projective and almost unramified for J_perfd). For p-completed integral S, §2.31 gives a discrete perfectoid ring with its universal mapping property. These are imported, not planned here.
- **tauceti:TauCetiRoadmap/StableReduction#layer-1-nodes-normalization-and-dual-graphs** (for [Q7.2](#q7-ind-syntomic-algebra), [Q7.3](#q7-ind-maps-stability), [Q7.6](#q7-fibrewise-hypersurface-syntomic)). Existing Tau Ceti StableReduction Layer 1: syntomic morphisms (flat, locally finitely presented local complete intersections); their affine case is Stacks 00SL. Imported as existing work, no extension requested.
- **SchemeAndStackFoundations:SF.0** (for [Q9.3](#q9-ind-syntomic-andre-lemma), [Q9.6](#q9-semiperfectoid-covers)). Merged SchemeAndStackFoundations §0.12 (Henselization.algebra I of a pair, its filtered étale-neighbourhood presentation and universal property) and §0.13 (ind-étale algebras and the properties of the henselization, including faithful flatness when I lies in the Jacobson radical).
- **EnhancedDerivedSheaves:E1** (for [Q10.2](#q10-prismatic-cover-of-regular-local-ring)). EnhancedDerivedSheaves §E1.6 frobenius_flat_of_isRegular (Kunz: absolute Frobenius of a regular noetherian F_p-algebra is flat; Stacks 0EC0), used for p-complete faithful flatness of the Frobenius lift on W⟦x_1, …, x_d⟧.

## Ownership notes

- The Bhatt–Scholze route of this design (Proposition 8.5, Corollaries 8.11–8.12, Definition 10.1–Lemma 10.5, Definition 10.6, Remark 10.7, Theorems 10.9 and 10.11, Lemma 10.12) is planned by TauCetiRoadmap's PrismaticCohomology, Part I (pull request #1057), §§2.30–2.31 (Prismatic.Perfection.perfectSite_equiv, Prismatic.Perfectoidization.arc_sections, arc_excision, integral_discrete, almostPurity, Prismatic.Integral.finiteStratification, Prismatic.Almost.ideal_tensor and connectivityCriterion). It is therefore imported, not planned. Accepted atlas packets still name this Part II as the owner: PerfectoidSpaces P8 (node P8/integral-extension-of-perfectoid-pair and its gap), PerfectoidShimuraVarieties S2 and S4 through P8, and PrismaticCohomology PR.0's PR.4 notes (étale comparison and cohomological dimension of perfectoid rings), together with the owners entries of the RT-AREA-padic-1 fixes. Point those consumers at PrismaticCohomology:PR.2 (upstream §2.31 for Theorems 10.9 and 10.11, §2.30 for Corollaries 8.11–8.12) and replace the owner recorded in the RT-AREA-padic-1 owners entries as a stage of PerfectoidQuotientsPartII by that layer. This Part II keeps only Bhatt–Scholze Remark 3.11 ([Q10.2](#q10-prismatic-cover-of-regular-local-ring)) and the Remark 10.13 application ([Q10.5](#q10-almost-tor-vanishing-plus-closure)), which PrismaticCohomology does not plan.
- Česnavičius–Scholze route items 010, 012, 013, 014, 017, 018 and 019 (§§2.1.3, 2.1.6–2.1.8, Proposition 2.1.11(a)–(e)) are planned by PerfectoidQuotients Layer 0 (TauCetiRoadmap pull request #1042, §§0.4–0.6), and item 037 (Lemma 3.1.1) by PerfectoidSpaces P7.16a and P7.17 (pull request #818), as RT-AREA-padic-1 finding /7 asked. Cite those layers. This Part II plans the remaining items: the tilting identities (2.1.1–2.1.2), fibre products (2.1.4–2.1.5), the relative tilting equivalence with completeness and valuation rings (2.1.9–2.1.10), torsion-free presentations (2.1.12), §2.3 entirely, and Lemma 3.1.1 only as a comparison with P7 adding the unramified clause and the uniform presentation.
- Ind-fppf and ind-syntomic ring maps (Česnavičius–Scholze §2.3.3, item 033) were routed to the Scheme-and-stack-foundations Part II, which has no design yet (DESIGN-SchemeAndStackFoundationsPartII, issue #3361). The ind-syntomic André lemma needs them, so they are planned here in Q7, on top of the syntomic morphisms of Tau Ceti StableReduction Layer 1 (as RT-PAPER-CESNAVICIUS-SCHOLZE-24 finding /10 asked). The Scheme-and-stack-foundations Part II design and DESIGN-PurityForFlatCohomology import [Q7.1](#q7-ind-fppf-algebra), [Q7.2](#q7-ind-syntomic-algebra) and [Q7.3](#q7-ind-maps-stability) (pro-fppf sites of Česnavičius–Scholze §4.1.1 and flat cohomology) instead of planning them.
- Bhatt–Scholze Remark 3.11 (perfectoid faithfully flat covers of complete regular local rings via prisms, item 20 of that paper) has no owner: PrismaticCohomology PR.0 does not state it, and PerfectoidSpaces P7.17 covers only the perfect-residue-field tower (RT-PAPER-BHATT-SCHOLZE-22 finding /7). [Q10.2](#q10-prismatic-cover-of-regular-local-ring) owns the general statement; PerfectoidSpaces P7.17 keeps the explicit perfect-residue-field tower, which Q10 cites.
- Česnavičius–Scholze Lemma 2.2.2 (tilting of complete arc covers, ArcTopologyAndDescent AT.12/tilting-complete-arc-covers) is proved from the valuation-ring part of Proposition 2.1.9 (RT-PAPER-CESNAVICIUS-SCHOLZE-24 finding /41). This Part II does not import ArcTopologyAndDescent, so an edge Q6 → AT.12 is acyclic. AT.12/tilting-complete-arc-covers may cite [Q6.4](#q6-tilting-valuation-rings) and [Q6.7](#q6-tilting-algebraically-closed-valuation-rings) for valuation rings of arbitrary rank; its present rank-one inputs (PerfectoidSpaces P1 and P3) remain valid for rank at most one.

## Paper items and where they are planned

| Item | Planned at |
| --- | --- |
| PAPER-CESNAVICIUS-SCHOLZE-24/009 | [Q5.1](#q5-tilt-inverse-limit-monoid), [Q5.3](#q5-sharp-quotient-isomorphisms), [Q5.4](#q5-torsion-transfer) |
| PAPER-CESNAVICIUS-SCHOLZE-24/010 | PerfectoidQuotients:Q0:integral-algebra/torsion-free-perfectoid-quotient, PerfectoidQuotients:Q0:integral-algebra/perfectoid-rings-reduced |
| PAPER-CESNAVICIUS-SCHOLZE-24/011 | [Q5.5](#q5-ainf-of-perfectoid-surjections), [Q5.6](#q5-fibre-products-of-perfectoid-rings), [Q5.7](#q5-glueing-along-perfect-algebras) |
| PAPER-CESNAVICIUS-SCHOLZE-24/012 | PerfectoidQuotients:Q0:integral-algebra/completely-etale-and-henselian-perfectoid |
| PAPER-CESNAVICIUS-SCHOLZE-24/013 | PerfectoidQuotients:Q0:integral-algebra/p-integral-closure, PerfectoidQuotients:Q0:integral-algebra/p-integral-closedness-criterion |
| PAPER-CESNAVICIUS-SCHOLZE-24/014 | PerfectoidQuotients:Q0:integral-algebra/completed-p-integral-closure-perfectoid |
| PAPER-CESNAVICIUS-SCHOLZE-24/015 | [Q6.1](#q6-relative-tilting-equivalence), [Q6.2](#q6-tilting-completeness-transfer) |
| PAPER-CESNAVICIUS-SCHOLZE-24/016 | [Q6.3](#q6-tilt-of-complete-valuation-ring), [Q6.4](#q6-tilting-valuation-rings), [Q6.5](#q6-valuation-ring-localization-completeness), [Q6.6](#q6-localizations-of-perfectoid-valuation-rings), [Q6.7](#q6-tilting-algebraically-closed-valuation-rings) |
| PAPER-CESNAVICIUS-SCHOLZE-24/017 | PerfectoidQuotients:Q0:integral-algebra/completed-root-polynomial-algebras, PerfectoidQuotients:Q0:integral-algebra/completed-perfectoid-tensor-products, PerfectoidQuotients:Q0:integral-algebra/products-of-perfectoid-rings |
| PAPER-CESNAVICIUS-SCHOLZE-24/018 | PerfectoidQuotients:Q0:integral-algebra/completed-root-stable-quotients |
| PAPER-CESNAVICIUS-SCHOLZE-24/019 | PerfectoidQuotients:Q0:integral-algebra/completion-along-sharp-ideal |
| PAPER-CESNAVICIUS-SCHOLZE-24/020 | [Q6.8](#q6-torsion-free-perfectoid-presentation) |
| PAPER-CESNAVICIUS-SCHOLZE-24/031 | [Q8.2](#q8-tilted-valuation), [Q8.3](#q8-integral-approximation-lemma) |
| PAPER-CESNAVICIUS-SCHOLZE-24/032 | [Q8.1](#q8-adic-continuity-criterion), [Q8.4](#q8-topological-nilpotence-criterion) |
| PAPER-CESNAVICIUS-SCHOLZE-24/033 | [Q7.1](#q7-ind-fppf-algebra), [Q7.2](#q7-ind-syntomic-algebra), [Q7.3](#q7-ind-maps-stability) |
| PAPER-CESNAVICIUS-SCHOLZE-24/034 | [Q9.1](#q9-andre-root-extension), [Q9.2](#q9-single-polynomial-p-integral-closure), [Q9.3](#q9-ind-syntomic-andre-lemma), [Q9.4](#q9-andre-lemma-consequences), [Q7.4](#q7-flatness-glueing), [Q7.5](#q7-regular-blowup-algebra), [Q7.6](#q7-fibrewise-hypersurface-syntomic) |
| PAPER-CESNAVICIUS-SCHOLZE-24/036 | [Q9.5](#q9-p-zariski-ring), [Q9.6](#q9-semiperfectoid-covers) |
| PAPER-CESNAVICIUS-SCHOLZE-24/037 | [Q10.1](#q10-regular-local-towers), PerfectoidSpaces:P7/regular-finite-flat-residue-tower, PerfectoidSpaces:P7/regular-finite-flat-perfectoid-tower |
| PAPER-BHATT-SCHOLZE-22/20 | [Q10.2](#q10-prismatic-cover-of-regular-local-ring) |
| PAPER-BHATT-SCHOLZE-22/47 | PrismaticCohomology:PR.2 |
| PAPER-BHATT-SCHOLZE-22/51 | PrismaticCohomology:PR.2 |
| PAPER-BHATT-SCHOLZE-22/52 | PrismaticCohomology:PR.2 |
| PAPER-BHATT-SCHOLZE-22/57 | PrismaticCohomology:PR.2 |
| PAPER-BHATT-SCHOLZE-22/58 | PrismaticCohomology:PR.2 |
| PAPER-BHATT-SCHOLZE-22/59 | PrismaticCohomology:PR.2 |
| PAPER-BHATT-SCHOLZE-22/60 | PrismaticCohomology:PR.2 |
| PAPER-BHATT-SCHOLZE-22/61 | PrismaticCohomology:PR.2 |
| PAPER-BHATT-SCHOLZE-22/62 | PrismaticCohomology:PR.2 |
| PAPER-BHATT-SCHOLZE-22/63 | [Q10.5](#q10-almost-tor-vanishing-plus-closure), [Q10.3](#q10-absolute-integral-closure-completion), [Q10.4](#q10-perfectoid-cover-inside-plus-closure) |
| PAPER-CESNAVICIUS-19/residue-tower | PerfectoidSpaces:P7/regular-finite-flat-residue-tower, [Q10.1](#q10-regular-local-towers) |
| PAPER-CESNAVICIUS-19/perfectoid-tower | PerfectoidSpaces:P7/regular-finite-flat-perfectoid-tower, [Q10.1](#q10-regular-local-towers) |

## References

<a id="source-cs24"></a>
- **CS24**: Kęstutis Česnavičius and Peter Scholze, *Purity for flat cohomology*, Annals of Mathematics 199 (2024), no. 1, 51–180; read in arXiv:1912.10932v3 (26 April 2023, final version); locators give arXiv v3 numbering and pages. <https://arxiv.org/pdf/1912.10932v3>. Read: §1.4 Notation and conventions, p. 8; §2.1 Structural properties of perfectoid rings, pp. 9–18; §2.3 The ind-syntomic generalization of André's lemma, pp. 22–29; §3.1, Lemma 3.1.1, p. 29; §6.2, Theorem 6.2.3 and its proof, pp. 83–84.
<a id="source-bs22"></a>
- **BS22**: Bhargav Bhatt and Peter Scholze, *Prisms and prismatic cohomology*, Annals of Mathematics 196 (2022), no. 3; read in arXiv:1905.08229v4 (12 January 2022). <https://arxiv.org/pdf/1905.08229v4>. Read: Remark 3.11, pp. 32–33; §8.1–8.2, pp. 63–69 (to confirm the imported statements); §10, pp. 78–84, including Remark 10.13.
<a id="source-bms1"></a>
- **BMS1**: Bhargav Bhatt, Matthew Morrow and Peter Scholze, *Integral p-adic Hodge theory*, Publ. Math. IHÉS 128 (2018); read in arXiv:1602.03148v3. <https://arxiv.org/pdf/1602.03148v3>. Read: §3.1, Lemma 3.2, pp. 19–20; §3.2, Lemmas 3.9–3.10, pp. 22–23.
<a id="source-wedhorn"></a>
- **Wedhorn**: Torsten Wedhorn, *Adic spaces*, arXiv:1910.05934v1 (lecture notes). <https://arxiv.org/pdf/1910.05934v1>. Read: §7, Definition 7.7, Theorem 7.10 and Proposition 7.18, pp. 58–61.
<a id="source-sch12"></a>
- **Sch12**: Peter Scholze, *Perfectoid spaces*, Publ. Math. IHÉS 116 (2012); read in arXiv:1111.4914 (current version). <https://arxiv.org/pdf/1111.4914>. Read: §3, Theorem 3.7 and Proposition 3.8, pp. 17–18.
<a id="source-ces19"></a>
- **Ces19**: Kęstutis Česnavičius, *Purity for the Brauer group*, Duke Math. J. 168 (2019); read in arXiv:1711.06456v4. <https://arxiv.org/pdf/1711.06456v4>. Read: Lemma 4.7, p. 8; §5, Lemmas 5.1 and 5.2, pp. 11–12.
<a id="source-hm17"></a>
- **HM17**: Raymond C. Heitmann and Linquan Ma, *Extended plus closure in complete local rings*, read in arXiv:1708.05761v3 (22 October 2018). <https://arxiv.org/pdf/1708.05761v3>. Read: §1, Theorem 1.3, p. 2.
<a id="source-stacks"></a>
- **Stacks**: The Stacks Project Authors, *The Stacks Project*, online, accessed 2026-10-19. <https://stacks.math.columbia.edu>. Read: Tag 0H7N (Lemma 10.99.16); Tag 0BIQ (Lemma 15.32.2); Tag 00SW (Lemma 10.136.13); Tag 00SL (Definition 10.136.1); Tag 07C3 (Lemma 10.127.4); Tag 0C33 (Lemma 10.168.9); Tag 031A (Lemma 10.96.10); Tag 00HP (Lemma 10.39.15); Tag 07DV (Lemma 10.68.9); Tags 00SY (Lemma 10.136.15) and 00SV (Lemma 10.136.12); Tag 090T (Lemma 10.96.8); Tags 00E0 (Lemma 10.17.2), 00FK (Lemma 10.30.5) and 00IA (Lemma 10.50.2).
