# Perfectoid rings and spaces (part from P8)

Blueprint for the roadmap `PerfectoidSpaces`, job `BP-PerfectoidSpaces--P8` (issue #974), part 2 of 2: the layers
**P8, finite quotients and closed perfectoidization in towers**, and **P9, continuous torsor descent with coefficients**.
Packet: `research/blueprint/packets/PerfectoidSpaces--P8.json`. Suggested Lean file:
`research/blueprint/suggested/PerfectoidSpaces--P8.lean`. Handoff: `research/blueprint/handoff/BP-PerfectoidSpaces--P8.md`.
The first part, P0 to P7, is `research/blueprint/readmes/PerfectoidSpaces--P0.md`.

**Status: partial.** The packet has 62 nodes, 60 API items and
37 unit tests; it cites 51 declarations of the pinned
libraries, records 3 gaps, makes 12 requests to other roadmaps and records
34 mistakes found in its sources. Both layers are `partial` only because of those gaps and open
requests: every definition and theorem of the sources the layers are built on is a node.

Pinned baseline: Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`, Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`.

## Sources

Every source is freely available and was read in the version listed; the sections read are recorded in the packet.

- **`hj20`**: David Hansen, Christian Johansson, *Perfectoid Shimura varieties and the Calegari–Emerton conjectures*. arXiv:2011.03951v2 (printed page = PDF page)
  <https://arxiv.org/abs/2011.03951>, read 2026-09-24.
  SHA-256 `0054e56be6624b564e1d5a3058e1ef3bbfe5140ca9f06ca64bded18478419cd9`.
- **`han16`**: David Hansen, *Quotients of adic spaces by finite groups*. Author's PDF dated 28 August 2016 (published in Math. Res. Lett.); 10 pages, printed page = PDF page
  <http://davidrenshawhansen.net/adicgpquotient.pdf>, read 2026-09-24.
  SHA-256 `9a46750732fa213a179f929943c59acc42e29fa1e514a3a848d47821d3212473`.
- **`cgj19`**: Ana Caraiani, Daniel R. Gulotta, Christian Johansson, *Vanishing theorems for Shimura varieties at unipotent level*. arXiv:1910.09214v2, 5 July 2021
  <https://arxiv.org/abs/1910.09214>, read 2026-09-24.
  SHA-256 `aa3914470f17e6c768cd10173e14d9e52f4bffb5d91e196f0605567d9af87d98`.
- **`kl16`**: Kiran S. Kedlaya, Ruochuan Liu, *Relative p-adic Hodge theory, II: Imperfect period rings*. arXiv:1602.06899v3 (dated 21 October 2019)
  <https://arxiv.org/abs/1602.06899>, read 2026-09-24.
  SHA-256 `97383900492daf1c6778959c37e993f67dd5ad379ac03c31049b870382e5d42c`.
- **`kl15`**: Kiran S. Kedlaya, Ruochuan Liu, *Relative p-adic Hodge theory: Foundations*. arXiv:1301.0792v5 (published as Astérisque 371 (2015))
  <https://arxiv.org/abs/1301.0792>, read 2026-09-24.
  SHA-256 `a6a117423db62aec072442bb15b70e3175bcc3b631bdcd6d74f740e3c6cfd942`.
- **`sch15`**: Peter Scholze, *On torsion in the cohomology of locally symmetric varieties*. arXiv:1306.2070v2, 2 June 2015 (published in Ann. of Math. 182 (2015)); printed page = PDF page
  <https://arxiv.org/abs/1306.2070>, read 2026-09-24.
  SHA-256 `e15abf4e7ab3e400ecaae963e5ccd80b340919d8499ebfde5b55f2ceb83ab285`.
- **`ecd`**: Peter Scholze, *Étale cohomology of diamonds*. arXiv:1709.07343v4, 14 April 2026
  <https://arxiv.org/abs/1709.07343>, read 2026-09-24.
  SHA-256 `78ca42bba46f1d43c894b0dbfdfb41105efab4959ba5ba6e32e1e5cf7ef33efc`.
- **`bs22`**: Bhargav Bhatt, Peter Scholze, *Prisms and prismatic cohomology*. arXiv:1905.08229v4, 12 January 2022 (published in Ann. of Math. 196 (2022))
  <https://arxiv.org/abs/1905.08229>, read 2026-09-24.
  SHA-256 `1d91a6eb85828feb73f84ab3b27ced17514f0855d61c3bff71ab9d8287891e4a`.
- **`chj17`**: Przemysław Chojecki, David Hansen, Christian Johansson, *Overconvergent modular forms and perfectoid Shimura curves*. arXiv:1507.04875v2, 22 August 2016 (published in Doc. Math. 22 (2017)); printed page = PDF page
  <https://arxiv.org/abs/1507.04875>, read 2026-09-24.
  SHA-256 `b68d2bcb4d78f42a8cf010c42a30483712a34190409ee5d579168f9c02214e8f`.
- **`bhw21`**: Christopher Birkbeck, Ben Heuer, Chris Williams, *Overconvergent Hilbert modular forms via perfectoid modular varieties*. arXiv:1902.03985v4, 10 May 2021; printed page = PDF page
  <https://arxiv.org/abs/1902.03985>, read 2026-09-24.
  SHA-256 `8ee48970dc500f60a6409cca0e6d9feeb693071da00a8b37174776717b708dac`.
- **`sga1`**: A. Grothendieck, M. Raynaud, *Revêtements étales et groupe fondamental (SGA 1)*. arXiv:math/0206203v2 (Documents Mathématiques 3 reprint); PDF page numbers
  <https://arxiv.org/abs/math/0206203>, read 2026-09-24.
  SHA-256 `8e64218d356456c534eebf996940f0f957e43b54f1a080241debe12cbaf60d3c`.

## What this part plans, and what it rests on

The atlas assigns two layers to this part. **P8** is the owner of finite quotients of perfectoid spaces and of
closed-locus gluing in towers (RS-05, `owners`); Shimura varieties of Hodge and pre-abelian type
(PerfectoidShimuraVarieties S2 and S4) and the integral-sheaf layer TorsionCohomologyInfrastructure TC.0 import it.
**P9** owns descent along continuous profinite torsors of modules and of character sheaves, with coefficients in a weight
space (RS-05); HodgeTateAndCanonicalSubgroups T5 and OverconvergentAutomorphicForms O1 import it. RS-05 is accepted and
binding; it keeps both layers, narrows AdicSpacesPartII R5 to the sousperfectoid product theory P9 imports, and assigns the
general tilde-limit to ClassicalAdicEtaleCohomology H0.

The sources are Hansen–Johansson §5.1, Hansen's *Quotients of adic spaces by finite groups*, Caraiani–Gulotta–Johansson
§2.1, Kedlaya–Liu II Theorem 3.3.26 and Scholze's torsion paper §II.2 and Theorem IV.1.1 read with ECD 5.8 and Bhatt–Scholze
Remark 7.5 (for P8), and Chojecki–Hansen–Johansson §§2.6, 4.1–4.2 and the appendix, and Birkbeck–Heuer–Williams §§3–4 (for
P9). ECD §§8–15 and SGA 1 supply the diamond and descent statements the proofs quote.

**What the libraries have.** There is no reviewed library audit for these layers, so the boundary was drawn by reading the
declaration index and the Lean sources at the pinned commits. The algebra is largely there: Mathlib's
`FixedPoints.subring`, `Algebra.IsInvariant` with integrality, transitivity on primes and surjectivity onto residue
automorphisms, lying over, `T2Quotient`, Lucas' theorem, `Sylow`, projective modules, `IsGaloisGroup` and continuous group
cohomology; Tau Ceti's Huber rings and pairs, pseudouniformizers, the spaces `Spv`, `cont` and `spa` with `spaComap`,
spectrality, rational subsets and their preimages, `spa_integralClosure`, the completed rational localisations
`completionLocObj`, the flatness of rational localisation, the two halves of the continuity criterion, continuous
cohomology in degree zero, and Galois descent for vector spaces over fields. What is missing is geometric: adic spaces as
objects of Huber's category V, perfectoid spaces, v-sheaves and diamonds, pro-étale sites, completed tensor products, and
three general facts that no layer plans (conjugacy of extensions of valuations, Galois descent of modules over rings, and
t-orthogonal bases over non-discretely valued fields). The first group is imported from the owners named in the requests;
the conjugacy and descent statements are planned here in the generality the sources use; the third is a recorded gap.

**Two points the stage texts leave implicit.** The P8 text speaks of 'Hansen–Johansson §5's invariant affinoid-cover
hypothesis'. The hypothesis is Hansen's (his Theorems 1.1, 1.3(i), 1.4). Hansen–Johansson replace it by analytic
separation together with the condition that closures of rank-one points lie in affinoids, and show that an invariant
affinoid cover then exists (the quotient map is affinoid in the weak sense). This is how the part meets the completion
contract 'prove invariant-affinoid-cover existence in each geometric application before applying the quotient theorem'.
And the contract that P9's integral module descent 'requires its own effectivity proof' is met by an explicit criterion:
the integral twisted invariants are free of rank one where the cocycle is an integral coboundary; rational descent uses
the averaging idempotent of a finite level, which is not integral when p divides the order of the finite group.

## Conventions

- A finite or profinite group acts on rings on the **left** by ring automorphisms (Mathlib's `MulSemiringAction`) and on
  spaces on the **right**; for a right action x ↦ xγ, pullback of functions satisfies (γδ)^* = γ^*δ^*.
- A 1-cocycle c: G → (O(X_∞) ⊗̂ A)^× satisfies **c(γδ) = c(γ)·γ^*(c(δ))**; coboundaries are γ ↦ F/γ^*(F). The twisted
  sheaf ω_c consists of the f with γ^*f = c(γ)^{-1}f, and multiplication by F identifies ω_c with ω_{c·F/γ^*F}.
- Perfectoid Tate rings are those of ECD Definition 3.1 (P1); Huber pairs (A, A⁺) are complete, with A⁺ open, integrally
  closed and contained in A°; affinoid perfectoid spaces are Spa(A, A⁺) with A perfectoid.
- The **invariant pair** of a finite group G acting on (A, A⁺) is (A^G, A^{+G} = A⁺ ∩ A^G) with the subspace topology; the
  **categorical quotient** X/G is (|X|/G, (q_*O_X)^G, induced valuations) in Huber's category V.
- A **Zariski-closed embedding** of perfectoid spaces is one whose base change to every open affinoid perfectoid is the
  vanishing locus of an ideal; by ECD 5.8 such loci are strongly Zariski closed (R → S surjective, S⁺ the integral closure,
  R⁺ → S⁺ almost surjective). Closed immersions (injections with closed image) need not be Zariski closed.
- Quotients of v-sheaves by a group are formed as v-sheaves; for diamonds by finite groups this agrees with the pro-étale
  quotient.
- The **coefficient algebras** of P9 are Chojecki–Hansen–Johansson's weights: a small ℤ_p-algebra with the mixed completed
  tensor product V ⊗̂ M = (V° ⊗̂ M)[1/p], or a reduced affinoid algebra with ⊗̂ over the base field.
- Almost mathematics is over O_C (or the ring of integers of the perfectoid base) with its maximal ideal, as in P0.

## P8 Finite quotients and closed perfectoidization in towers

**Objects.** The invariant Huber pair (A^G, A^{+G}); the categorical quotient X/G; G-clean neighbourhoods; Zariski-closed
embeddings of perfectoid spaces and analytically separated perfectoid spaces; good towers.

**Theorems.** For a perfectoid Tate ring A and a finite group G of any order: A^G is perfectoid (Kedlaya–Liu, by a norm
estimate for p-groups and Sylow averaging); invariants commute with invariant rational localisation (in characteristic p
by the binomial coefficient C(|G|, p^m), prime to p; in general by tilting); hence Spa(A^G, A^{+G}) = Spa(A, A⁺)/G as
v-ringed spaces and as v-sheaves, with |Spa(A, A⁺)|/G ≅ |Spa(A^G, A^{+G})| for every Tate pair (Hansen). Globally: quotients
under a G-stable affinoid perfectoid cover (Hansen, CGJ); quotients of rigid spaces for any |G|; quotients of analytically
separated perfectoid spaces whose rank-one points have closures in affinoids and whose orbits are separated in the maximal
Hausdorff quotient (Hansen–Johansson, with the orbit hypothesis their proof needs), with the diamond of the quotient equal
to the quotient of the diamond; free actions are exactly those whose quotient map is a finite étale torsor. For towers:
towers finite over perfectoid towers are perfectoid (using the perfectoidization of integral algebras, a gap), good
towers are stable under finite maps and have perfectoid finite quotients with X/G = lim X_i/G, and compatible closed
subvarieties of a perfectoid tower have a Zariski-closed perfectoid limit, strongly Zariski closed, with the tilde-limit
comparison.

**Dependencies.** Inside the roadmap: P1 (perfectoid Tate rings, tilts, θ), P2 (rational localisation, tilting homeomorphism,
sheaf theorem, fibre products), P3 (strongly finite étale maps), P4 (affinoid Zariski-closed immersions), P5 (cofiltered
limits), P7 (tilde-limits). Other roadmaps: PerfectoidQuotients Q4 (ECD 5.8) and Q0; DiamondsAndVStacks D0, D2–D6;
AdicEtaleGeometry A0; AdicSpacesPartII R0, R1, R3; ClassicalAdicEtaleCohomology H0. The perfectoidization of integral
algebras (Bhatt–Scholze 1.17(1)/10.11) has no owner and is a gap.

**Acceptance tests.** A cyclic p-group quotient: Z/p permuting the coordinates of the perfectoid p-polydisc, over a
perfectoid field of characteristic p (where p = |G| is not invertible) and over an untilt; μ₂ on the perfectoid disc for p
odd, whose quotient map is not a torsor at the fixed point; the compatible-root closed locus of the perfectoid torus, and the
single equation T = 1 whose locus has ring C(ℤ_p, K), a quotient of the torus ring as ECD 5.8 asserts against Scholze's
Remark II.2.4; the Frobenius tower of ℙ¹ as a good tower, and the tower of affine lines, which satisfies conditions (2) and
(3) but not (1); two perfectoid discs glued along an annulus, a quasi-separated space with affinoid intersections that is not
analytically separated.

### Invariant pairs and the spectrum of the invariants

#### `invariant-huber-pair` — The invariant Huber pair (A^G, A^{+G}) of a finite group action

*Construction.* Let (A, A⁺) be a complete Tate–Huber pair and G a finite group acting on A on the left by continuous ring automorphisms with g(A⁺) = A⁺ for all g ∈ G. Put A^G = {a ∈ A : g·a = a for all g} with the subspace topology and A^{+G} = A⁺ ∩ A^G. Then: (i) A^G is a closed subring and a complete Tate ring: for every pseudouniformizer ϖ of A the norm N(ϖ) = ∏_{g∈G} g(ϖ) is a G-invariant pseudouniformizer of A and of A^G, G-stable rings of definition A₀ ⊆ A exist (the subring generated by the translates g(A₁) of any ring of definition A₁), and A₀^G is a ring of definition of A^G; (ii) (A^G)° = (A°)^G = A° ∩ A^G; (iii) A^{+G} is open and integrally closed in A^G and contained in (A^G)°, so (A^G, A^{+G}) is a complete Tate–Huber pair; (iv) A is integral over A^G, each a ∈ A being a root of the monic polynomial ∏_{g∈G}(T − g·a) ∈ A^G[T]; (v) A⁺ is the integral closure of A^{+G} in A. The construction is functorial in G-equivariant continuous maps of pairs, and for a subgroup H ≤ G it gives inclusions A^G ⊆ A^H, A^{+G} ⊆ A^{+H}.

Hypotheses and scope: (A, A⁺) complete Tate–Huber pair; G finite; G acts by continuous ring automorphisms preserving A⁺. No hypothesis on the order of G: p may divide |G|, and |G| need not be invertible in A.

Proof outline:
1. (i) A^G is the intersection of the equalizers of the continuous maps id and g, hence closed since A is Hausdorff; it is complete as a closed subset of a complete ring. Each g(ϖ) is a topologically nilpotent unit because g is a continuous automorphism, so N(ϖ) is a topologically nilpotent unit fixed by G.
2. The subring generated by finitely many bounded subrings g(A₁) is additively generated by the bounded set ∏_g g(A₁), hence bounded, and it is open because it contains A₁; it is G-stable by construction. Then A₀^G = A₀ ∩ A^G is open and bounded in the subspace topology; N(ϖ) is topologically nilpotent, so some power N(ϖ)^m lies in A₀, and N(ϖ)^m·A₀^G is an ideal of definition.
3. (ii) A subset of A^G is bounded in A^G if and only if it is bounded in A, because the topology is induced and N(ϖ)ⁿA₀^G = N(ϖ)ⁿA₀ ∩ A^G; so a ∈ A^G is power-bounded in A^G if and only if it is in A.
4. (iii) A^{+G} = A⁺ ∩ A^G is open in the subspace topology; an element of A^G integral over A^{+G} is integral over A⁺, hence lies in A⁺ ∩ A^G.
5. (iv) The coefficients of ∏_g (T − g·a) are symmetric functions of the translates g·a, hence G-invariant; this is the integrality statement of Algebra.IsInvariant for the fixed subring of a finite group.
6. (v) (Hansen, Theorem 3.1, Step 3.) A⁺ is integral over A^{+G} by (iv) applied to elements of A⁺ (the coefficients lie in A⁺ ∩ A^G), so A⁺ ⊆ (A^{+G})^{icl}; conversely A^{+G} ⊆ A⁺ and A⁺ is integrally closed in A.

API:
- `Huber.Pair.invariants` (data): The pair (A^G, A^{+G}) with the subspace topology, for a finite group acting by continuous automorphisms preserving A⁺.
- `Huber.Pair.invariants_toSubring` (compatibility): The underlying subring of A^G is Mathlib's FixedPoints.subring G A.
- `Huber.Pair.normPseudoUniformizer` (constructor): For a pseudouniformizer ϖ of A, ∏_{g∈G} g(ϖ) is a G-invariant pseudouniformizer of A and of A^G.
- `Huber.Pair.exists_stable_ringOfDefinition` (constructor): A G-stable ring of definition A₀ exists, and A₀^G is a ring of definition of A^G.
- `Huber.Pair.powerBounded_invariants` (characterisation): (A^G)° = (A°)^G.
- `Huber.Pair.isIntegral_invariants` (other): A is integral over A^G; Algebra.IsInvariant (A^G) A G holds.
- `Huber.Pair.plus_eq_integralClosure_invariants` (characterisation): A⁺ is the integral closure of A^{+G} in A.
- `Huber.Pair.invariants_map` (functoriality): A G-equivariant continuous map of pairs induces a map of invariant pairs, with map_id and map_comp.
- `Huber.Pair.invariants_mono` (relation): For H ≤ G, A^G ⊆ A^H and A^{+G} ⊆ A^{+H}.
- `Huber.Pair.isClosed_invariants` (instance): A^G is closed in A, hence complete.

Unit tests:
- `invariants_trivialGroup` (degenerate): For the trivial group, Huber.Pair.invariants returns (A, A⁺).
- `invariants_swap_prod` (computation): For A = K × K, A⁺ = K⁺ × K⁺ and Z/2 swapping the factors, A^G is the diagonal copy of K, A^{+G} the diagonal copy of K⁺, and the norm of (ϖ, ϖ) is (ϖ², ϖ²).
- `invariants_toSubring_eq_fixedPoints` (compatibility): The underlying subring of Huber.Pair.invariants G (A, A⁺) is FixedPoints.subring G A, and A is Algebra.IsInvariant over it.
- `trace_image_ne_invariants` (non-example): For the trivial action of G = Z/p on a Tate ring A of characteristic p, the trace a ↦ Σ_g g·a is zero while A^G = A: the invariant ring is not the image of a trace or averaging operator when p divides |G|.

Uses: Hansen 2016, Theorem 1.2 and §3: the quotient Spa(A,A⁺)/G is computed as Spa(A^G, A^{+G}); Hansen–Johansson, proofs of Theorems 5.3 and 5.8: V_x/H_x ≅ Spa(A^{H_x}, A^{+H_x}) for an H_x-stable affinoid V_x; Caraiani–Gulotta–Johansson, Proposition 2.1.1: X_G = Spd(A^G, A^{+G}) is the v-sheaf quotient; Kedlaya–Liu II, Theorem 3.3.26: A^G is perfectoid, with the norm pseudouniformizer; PerfectoidShimuraVarieties:S4: finite-group quotients of towers at infinite level are formed chartwise from invariant pairs.

Acceptance: For the swap action of Z/2 on K × K the pair is the diagonal (K, K⁺). For G = {1} the pair is (A, A⁺).

Prerequisites: `mathlib:FixedPoints.subring`, `mathlib:Algebra.IsInvariant`, `mathlib:Algebra.IsInvariant.isIntegral`, `mathlib:integralClosure`, `tauceti:TauCeti.Huber.IsTateRing`, `tauceti:TauCeti.Huber.IsPseudoUniformizer`, `tauceti:TauCeti.Huber.Pair`.

Sources: han16, Theorem 3.1, Step 3, p. 6 (PDF p. 6); kl16, Theorem 3.3.26, p. 68 (PDF p. 68); chj17, Proposition 2.22, p. 19 (PDF p. 19).

Planet: **Invariant Huber pair**.

#### `extensions-of-valuations-are-conjugate` — Extensions of a valuation along a normal algebraic extension exist and are conjugate

*Lemma.* Let L/K be a normal algebraic extension of fields with Aut(L/K) finite, and v a valuation on K (any rank). Then v extends to a valuation of L, the extension is unique along the purely inseparable subextension K ⊆ L^{Aut(L/K)}, and Aut(L/K) acts transitively on the equivalence classes of valuations of L extending v.

Hypotheses and scope: Arbitrary value groups; this is the classical statement for valuations, not for rank-one absolute values or places of function fields.

Proof outline:
1. Existence: the valuation ring O_v is a local subring of L, dominated by a valuation subring of L (Chevalley); for L/K algebraic its restriction to K is O_v.
2. Let B be the integral closure of O_v in L. The valuation rings of L extending O_v are the localisations B_𝔪 at the maximal ideals 𝔪 of B over 𝔪_v (valuation rings of L over O_v contain B, and are dominated by and dominate a localisation of B).
3. G = Aut(L/K) acts on B; B^G is the integral closure of O_v in the purely inseparable K′ = L^G, which is local (unique extension along purely inseparable extensions: x ↦ x^{p^n} lands in K), and B is integral over B^G with B^G = the fixed ring. Mathlib's transitivity of G on the primes of B over a prime of B^G gives transitivity on the maximal ideals over 𝔪_v, hence on the extensions.

Acceptance: K = ℚ_p, L = ℚ_p(i) (p ≡ 3 mod 4): one extension; K = ℚ, L = ℚ(i), v the 5-adic valuation: two extensions swapped by complex conjugation.

Prerequisites: `mathlib:LocalSubring.exists_le_valuationSubring`, `mathlib:ValuationSubring`, `mathlib:integralClosure`, `mathlib:Algebra.IsInvariant.exists_smul_of_under_eq`, `mathlib:Algebra.IsInvariant.isIntegral`.

Sources: han16, Theorem 3.1, Step 1, p. 4 (PDF p. 4) (continues on p. 5, PDF p. 5); chj17, Proposition 6.24, p. 54 (PDF p. 54).

#### `continuous-valuations-over-invariants` — Continuous valuations restrict surjectively to the invariants, with G-orbits as fibres

*Lemma.* With (A, A⁺) and G as in the invariant Huber pair, the restriction map φ: Cont(A) → Cont(A^G), v ↦ v|_{A^G}, is surjective, and two continuous valuations of A have the same restriction if and only if they lie in the same G-orbit for the action v ↦ v ∘ g.

Hypotheses and scope: A complete Tate ring with a continuous action of a finite group G; A^G with the subspace topology.

Proof outline:
1. Fix the G-invariant pseudouniformizer ϖ = N(ϖ₁). Continuity criterion: a valuation v of a Tate ring R with pseudouniformizer ϖ and ring of definition R₀ ∋ ϖ is continuous if and only if v(ϖ) is cofinal in the value group and v(ϖx) < 1 for every x ∈ R₀ (Huber 1993, Theorem 3.1, as quoted by Hansen).
2. Supports: Spec A → Spec A^G is surjective with fibres the G-orbits, because A is integral over A^G (lying over, and transitivity of G on the primes over a given prime). For v ∈ Cont(A^G) with support p choose q over p; L = Frac(A/q) is algebraic and quasi-Galois over K = Frac(A^G/p), and the decomposition group G_q surjects onto Aut(L/K).
3. Extension and continuity on A: let w be a valuation of L extending v (it exists by the extension lemma) and view it as a valuation of A through A → A/q ⊆ L. Γ_w/Γ_v is torsion (L/K algebraic), so w(ϖ) is cofinal. Let A₀ be a G-stable ring of definition containing the invariant ϖ, and a ∈ A₀. Then ϖa is a root of ∏_g (T − ϖ·g(a)) = T^N + Σ_{i≥1} ϖ^i e_i T^{N−i} with e_i ∈ A₀^G, and v(ϖ^i e_i) < 1 because ϖ^i e_i is topologically nilpotent in A^G and v is continuous. If w(ϖa) ≥ 1, the leading term would strictly dominate every other term, which is impossible for a root. So w(ϖa) < 1 on A₀, and w is continuous on A by the criterion. (The source proves continuity only on the field L; see sourceIssues.)
4. Fibres: G acts transitively on the supports over p, and G_q (through Aut(L/K)) acts transitively on the extensions of v to L (extensions of valuations along a normal extension are conjugate).
5. The continuity criterion is assembled from the library: continuity from a cofinal value dominating the ideal of definition, and cofinality and v(ϖx) < 1 from continuity at topologically nilpotent elements.

Acceptance: For the swap action on K × K the two points of Cont(K × K) over a point of Cont(K) form one orbit.

Prerequisites: [`invariant-huber-pair`](#invariant-huber-pair), [`extensions-of-valuations-are-conjugate`](#extensions-of-valuations-are-conjugate), `mathlib:Ideal.exists_ideal_over_prime_of_isIntegral`, `mathlib:Algebra.IsInvariant.exists_smul_of_under_eq`, `mathlib:Ideal.Quotient.stabilizerHom_surjective`, `mathlib:Valuation`, `tauceti:TauCeti.ValuationSpectrum.cont`, `tauceti:TauCeti.Huber.PairOfDefinition.isContinuous_of_forall_le_of_cofinalValue`, `tauceti:Valuation.IsContinuous.cofinalValue_of_isTopologicallyNilpotent`, `tauceti:Valuation.IsContinuous.lt_one_of_isTopologicallyNilpotent`.

Sources: han16, Theorem 3.1, Step 1, p. 4 (PDF p. 4) (continues on p. 5, PDF p. 5); chj17, Proposition 6.24, p. 54 (PDF p. 54).

#### `invariant-spectrum-homeomorphism` — |Spa(A, A⁺)|/G ≅ |Spa(A^G, A^{+G})|

*Theorem.* With (A, A⁺) and G as above, the continuous map q: |Spa(A, A⁺)| → |Spa(A^G, A^{+G})|, v ↦ v|_{A^G}, is surjective with fibres the G-orbits and induces a homeomorphism |Spa(A, A⁺)|/G ≅ |Spa(A^G, A^{+G})| for the quotient topology. Moreover Spa(A, A⁺) is the full preimage of Spa(A^G, A^{+G}) in Cont(A), and for every rational subset U = U(f₁, …, f_n / s) of Spa(A^G, A^{+G}) (f_i, s ∈ A^G generating an open ideal) the preimage q^{-1}(U) is the G-stable rational subset U(f₁, …, f_n / s) of Spa(A, A⁺).

Hypotheses and scope: (A, A⁺) complete Tate–Huber pair, G finite, acting continuously and preserving A⁺; no sheafiness is assumed.

Proof outline:
1. Cont(A)/G → Cont(A^G) is a continuous bijection by the fibre lemma; φ: Cont(A) → Cont(A^G) is a spectral map of spectral spaces (Cont of a Huber ring is spectral and comap along a continuous ring map is spectral).
2. φ is generalizing: the generalizations of a point of Cont of a Tate ring are its vertical generizations (coarsenings by convex subgroups); since Γ_w/Γ_v is torsion for w over v, convex subgroups of Γ_v and Γ_w correspond, so every generalization of v lifts to one of w. (The source asserts this without proof.)
3. A surjective generalizing spectral map of spectral spaces is a quotient map (Hansen, Lemma 3.2 = ECD Lemma 2.5); hence both Cont(A) → Cont(A^G) and the orbit map are quotient maps and Cont(A)/G ≅ Cont(A^G).
4. A valuation is ≤ 1 on A⁺ if and only if it is ≤ 1 on A^{+G}, since A⁺ is the integral closure of A^{+G} (invariant Huber pair (v)) and a valuation bounded by 1 on a ring is bounded by 1 on its integral closure; so Spa(A, A⁺) = φ^{-1}(Spa(A^G, A^{+G})). φ is open (the orbit map, open for a finite group, followed by a homeomorphism), so its restriction to the saturated subset Spa(A, A⁺) is an open surjection onto Spa(A^G, A^{+G}), hence a quotient map, and the homeomorphism restricts.
5. Rational subsets: the preimage of U(f/s) under the comap of A^G → A is U(f/s) ⊆ Spa(A, A⁺); the ideal generated by the f_i and s in A contains the image of an open ideal of A^G, hence a power of the invariant pseudouniformizer, so it is open. It is G-stable because f_i, s are invariant.

Acceptance: For G acting trivially, q is the identity. For Z/2 swapping K × K, |Spa(K × K)|/G is one copy of |Spa(K)|.

Prerequisites: [`continuous-valuations-over-invariants`](#continuous-valuations-over-invariants), [`invariant-huber-pair`](#invariant-huber-pair), `DiamondsAndVStacks:D0`, `tauceti:TauCeti.ValuationSpectrum.spaComap`, `tauceti:TauCeti.ValuationSpectrum.spaComap_preimage_rationalSubset`, `tauceti:TauCeti.ValuationSpectrum.spa_integralClosure`, `mathlib:GeneralizingMap`, `tauceti:TauCeti.ValuationSpectrum.spectralSpace_spa_of_pairOfDefinition`.

Sources: han16, Theorem 3.1, p. 4 (PDF p. 4); han16, Lemma 3.2, p. 6 (PDF p. 6); ecd, Lemma 2.5 with proof, p. 11 (PDF p. 11).

#### `invariant-quotient-v-sheaf-presentation` — Spd(A, A⁺) × G ⇉ Spd(A, A⁺) presents Spd(A^G, A^{+G}) as a v-sheaf

*Theorem.* Let A be a complete Tate ℤ_p-algebra with a continuous left action of a finite group G and A⁺ ⊆ A a G-stable open integrally closed subring; put X = Spd(A, A⁺) and X_G = Spd(A^G, A^{+G}). Then X → X_G and X × G → X ×_{X_G} X are surjections of v-sheaves on Perf. Hence X × G ⇉ X → X_G is a coequalizer of v-sheaves, X/G ≅ X_G for the quotient v-sheaf, and the same holds for the quotient computed as a pro-étale sheaf.

Hypotheses and scope: No perfectoidness and no condition on |G|; A is only a complete Tate ℤ_p-algebra.

Proof outline:
1. X, X_G, X × G and X ×_{X_G} X are spatial diamonds (fibre products of spatial diamonds are spatial, ECD Corollary 11.29), hence qcqs, so both maps are quasicompact.
2. A quasicompact map of v-sheaves is surjective if it is surjective on underlying topological spaces (ECD Lemma 12.11).
3. |X| → |X_G| is the map |Spa(A, A⁺)| → |Spa(A^G, A^{+G})| (|Spd(A, A⁺)| = |Spa(A, A⁺)|), surjective by the homeomorphism theorem.
4. Points of |X ×_{X_G} X| are represented by pairs φ₁, φ₂: (A, A⁺) → (K, K⁺) to a perfectoid field agreeing on (A^G, A^{+G}) (ECD Proposition 11.13). As Spec A × G → Spec A ×_{Spec A^G} Spec A is surjective (G is transitive on the fibres of Spec A → Spec A^G on geometric points), after enlarging K the two maps differ by some g ∈ G; then they already differ by g over K.
5. For the pro-étale quotient: X → X_G and X × G → X ×_{X_G} X are separated and quasi-pro-étale, which can be checked on fibres over Spa(C, O_C) (ECD Proposition 13.6), where they are maps of profinite sets; being also v-surjective, they are pro-étale surjections, so the coequalizer is the same computed as a pro-étale sheaf (the argument of the proof of Hansen–Johansson Theorem 5.3).

Acceptance: For G = {1} the statement is Spd(A, A⁺) = Spd(A, A⁺). For a finite étale Galois extension A → B with group G, Spd(B) × G ≅ Spd(B) ×_{Spd A} Spd(B).

Prerequisites: [`invariant-spectrum-homeomorphism`](#invariant-spectrum-homeomorphism), [`invariant-huber-pair`](#invariant-huber-pair), `DiamondsAndVStacks:D2`, `DiamondsAndVStacks:D5`, `DiamondsAndVStacks:D6`, `mathlib:Algebra.IsInvariant.exists_smul_of_under_eq`.

Sources: cgj19, Proposition 2.1.1, p. 4 (PDF p. 4); hj20, Theorem 5.3 (with the following paragraph on the auxiliary conditions), p. 28 (PDF p. 28).

### Invariants of perfectoid rings and rational localisation

#### `frobenius-on-invariants-of-p-group` — Frobenius is surjective modulo u^p on the invariants of a p-group

*Lemma.* Let A be a perfectoid Tate ring and G a finite p-group of order p^k acting continuously on A by ring automorphisms. Let ū be a G-invariant pseudouniformizer of the tilt A♭ (for instance the norm of one) and n large enough that u = (ū^{1/p^n})♯ satisfies u^{p^{k+1}} | p in (A^G)°. Then for every x ∈ (A^G)° there is z ∈ (A^G)° with x ≡ z^p modulo u^p (A^G)°.

Hypotheses and scope: No hypothesis on p and |G| beyond |G| = p^k; the argument divides by no integer.

Proof outline:
1. Choose ȳ ∈ A♭° with x ≡ ȳ♯ modulo u^{p^{k+1}}A° (A♭°/ϖ♭ ≅ A°/ϖ with ϖ = u^{p^{k+1}}, which divides p, and ϖ♭ = (ū^{1/p^n})^{p^{k+1}}). Since x is invariant and ♯ is G-equivariant, x ≡ (g ȳ)♯ modulo u^{p^{k+1}}A° for every g ∈ G.
2. Put z̄ = ∏_{g∈G} (g ȳ)^{1/p^{k+1}} ∈ (A♭°)^G and z = z̄♯ ∈ (A^G)°. By multiplicativity of ♯, z^{p^{k+1}} = ∏_g (g ȳ)♯ ≡ x^{p^k} modulo u^{p^{k+1}}A°.
3. With w = x − z^p ∈ A^G: w^{p^k} ≡ x^{p^k} − z^{p^{k+1}} modulo pA°, so w^{p^k} ∈ u^{p^{k+1}}A° because u^{p^{k+1}} | p.
4. Then (w u^{-p})^{p^k} ∈ A°, so w u^{-p} is power-bounded, i.e. w ∈ u^pA° ∩ A^G = u^p (A^G)°. (The source compresses the last two steps into 'so'.)

Acceptance: For G trivial the lemma is Frobenius surjectivity on A°/u^p, part of perfectoidness of A.

Prerequisites: [`invariant-huber-pair`](#invariant-huber-pair), `PerfectoidSpaces:P1/tilt-of-perfectoid-tate-ring`, `PerfectoidSpaces:P1/perfectoid-tate-rings-and-algebras`, `mathlib:sub_pow_char_pow`.

Sources: kl16, Theorem 3.3.26, p. 68 (PDF p. 68).

#### `invariants-of-perfectoid-tate-ring` — Invariants of a perfectoid Tate ring under a finite group are perfectoid

*Theorem.* Let A be a perfectoid Tate ring and G a finite group acting continuously on A by ring automorphisms. Then A^G, with the subspace topology, is a perfectoid Tate ring, and (A^G)♭ = (A♭)^G as subrings of A♭ with the same topology, compatibly with ♯. There is no hypothesis on |G|: p may divide the order of G. Over a perfectoid field K with a K-linear action this is Hansen's Theorem 3.5.

Hypotheses and scope: A perfectoid Tate ring (ECD 3.1), in any characteristic; G finite; action continuous.

Proof outline:
1. (A^G)♭ = lim_{x↦x^p} A^G = (lim_{x↦x^p} A)^G = (A♭)^G, since limits commute with invariants and Frobenius commutes with the action; (A♭)^G is perfect, uniform ((A♭)^{G°} = (A♭°)^G is bounded) and complete Tate with the norm pseudouniformizer, hence perfectoid of characteristic p.
2. A^G is complete and uniform: (A^G)° = (A°)^G is bounded (invariant Huber pair (ii)).
3. Let P be a p-Sylow subgroup and S a set of coset representatives of G/P. Take ū the G-norm of a pseudouniformizer of A♭, so that u is G-invariant. For x ∈ (A^G)° the p-group lemma for P (with this ū, which is P-invariant) gives y ∈ (A^P)° with x ≡ y^p modulo u^pA°, hence x ≡ (g y)^p for g ∈ S. Put z = [G:P]^{-1} Σ_{g∈S} g y, which is G-invariant and power-bounded as [G:P] is prime to p.
4. Then z^p ≡ [G:P]^{-p} Σ_{g∈S} (g y)^p ≡ [G:P]^{1-p} x ≡ x modulo u^p(A^G)°, using (a + b)^p ≡ a^p + b^p modulo p, [G:P]^{p-1} ≡ 1 modulo p and p ∈ u^pA°. (The source writes 'deduce' for this step.)
5. So Frobenius is surjective on (A^G)°/u^p with u^p | p, and A^G is perfectoid (perfectoid Tate ring definition; injectivity of Frobenius is automatic).

Acceptance: Cyclic p-group: over a perfectoid field K of characteristic p, Z/p permuting the variables of K⟨T₁^{1/p^∞}, …, T_p^{1/p^∞}⟩ has perfectoid invariants; so does its untilt over K♯. For G acting trivially, A^G = A.

Prerequisites: [`frobenius-on-invariants-of-p-group`](#frobenius-on-invariants-of-p-group), [`invariant-huber-pair`](#invariant-huber-pair), `PerfectoidSpaces:P1/perfectoid-tate-rings-and-algebras`, `PerfectoidSpaces:P1/tilt-of-perfectoid-tate-ring`, `mathlib:Sylow`, `mathlib:ZMod.pow_card_sub_one_eq_one`.

Sources: kl16, Theorem 3.3.26, p. 68 (PDF p. 68); han16, Theorem 3.5, p. 9 (PDF p. 9); han16, Theorem 3.6 (Kedlaya-Liu [KL16, Theorem 3.3.24]), p. 9 (PDF p. 9).

Planet: **Invariants of a perfectoid ring**.

#### `rational-invariants-order-invertible` — Invariants commute with rational localisation when |G| is invertible

*Lemma.* Let (A, A⁺) be a sheafy complete Tate–Huber pair (not necessarily perfectoid) with a finite group G acting as above and |G| ∈ A^×. Let X = Spa(A, A⁺), Y = Spa(A^G, A^{+G}) and q: X → Y. For every rational subset U = U(f₁, …, f_n / h) of Y the natural map A^G⟨f/h⟩ → A⟨f/h⟩^G is an isomorphism. Consequently O_Y = (q_* O_X)^G, O_Y is a sheaf, and Y is the quotient X/G in the category of v-ringed spaces.

Hypotheses and scope: |G| invertible in A; sheafiness of (A, A⁺).

Proof outline:
1. The averaging idempotent e_G = |G|^{-1} Σ_g g gives a continuous G-equivariant splitting of A^G-Banach modules A = A^G ⊕ M with M = (1 − e_G)A and M^G = 0.
2. Applying − ⊗̂_{A^G} A^G⟨f/h⟩ gives A⟨f/h⟩ = A^G⟨f/h⟩ ⊕ M ⊗̂_{A^G} A^G⟨f/h⟩, so it suffices that (M ⊗̂ A^G⟨f/h⟩)^G = 0.
3. Integral estimate: choose a G-stable ring of definition A₀ ∋ ϖ (invariant), replace f_i, h by ϖ^M f_i, ϖ^M h ∈ A₀^G, let M₀ be the image of A₀ in M and N with ϖ^N ∈ |G|A₀; then e_G maps ϖ^j(M₀ ⊗̂ A₀^G⟨f/h⟩) into ϖ^{j−N}(M₀ ⊗̂ A₀^G⟨f/h⟩).
4. Each m in the completed tensor product is m_{1,j} + m_{2,j} with m_{1,j} ∈ ϖ^j(M₀ ⊗̂ …) and m_{2,j} ∈ M ⊗ A^G[1/h]; for invariant m, m = e_G m = e_G m_{1,j} because (M ⊗ A^G[1/h])^G = M^G ⊗ A^G[1/h] = 0, so m lies in ∩_j ϖ^{j−N}(M₀ ⊗̂ …) = 0.
5. The presheaf identity on rational subsets gives O_Y = (q_*O_X)^G on the basis, and the latter is a sheaf because invariants are left exact; with the homeomorphism theorem, Y = X/G.

Acceptance: μ₂ acting on K⟨T⟩ by T ↦ −T with p odd: the rational subset {|T²| ≤ |ϖ|} of Spa(K⟨T²⟩) has K⟨T, T²/ϖ⟩^{μ₂} = K⟨T², T²/ϖ⟩, split off by the averaging idempotent.

Prerequisites: [`invariant-huber-pair`](#invariant-huber-pair), [`invariant-spectrum-homeomorphism`](#invariant-spectrum-homeomorphism), `tauceti:TauCeti.Huber.PairOfDefinition.completionLocObj`, `AdicEtaleGeometry:A0`.

Sources: han16, Theorem 3.3, p. 7 (PDF p. 7).

#### `rational-invariants-characteristic-p` — Invariants commute with invariant rational localisation in characteristic p, for any |G|

*Lemma.* Let (A, A⁺) be a perfectoid Tate–Huber pair of characteristic p with a continuous action of a finite group G of any order. For every rational subset U = U(T/s) of Spa(A^G, A^{+G}) (T ⊂ A^G finite, s ∈ A^G) the natural map A^G⟨T/s⟩ → A⟨T/s⟩^G is an isomorphism.

Hypotheses and scope: Characteristic p; p may divide |G|. Let p^m be the exact power of p dividing |G|.

Proof outline:
1. Both rings are perfectoid (rational localisations of perfectoid pairs are perfectoid; invariants of perfectoid rings are perfectoid), and the map induces a bijection Spa(A⟨T/s⟩^G) → Spa(A^G⟨T/s⟩), both being q^{-1}(U)/G = U by the homeomorphism theorem. A continuous map of uniform complete Tate rings bijective on adic spectra is injective and a homeomorphism onto its image, because the spectral seminorm is the supremum over the spectrum.
2. Let a ∈ A⟨T/s⟩^G and a_n → a with a_n ∈ A[1/s]. The p^m-th elementary symmetric polynomial e_{p^m} of the translates (g a_n)_{g∈G} lies in A^G[1/s] and converges to e_{p^m}(a, …, a) = C(|G|, p^m) a^{p^m}.
3. So C(|G|, p^m) a^{p^m} lies in the closure of A^G[1/s], which is A^G⟨T/s⟩. The binomial coefficient C(|G|, p^m) is prime to p (Lucas), hence a unit in the 𝔽_p-algebra, so a^{p^m} ∈ A^G⟨T/s⟩.
4. A^G⟨T/s⟩ is perfect and A⟨T/s⟩^G is reduced, so a ∈ A^G⟨T/s⟩.

Acceptance: For the trivial action of Z/p on a perfect ring the statement is A⟨T/s⟩ = A⟨T/s⟩, and the proof uses C(p, p) = 1, not division by p.

Prerequisites: [`invariant-spectrum-homeomorphism`](#invariant-spectrum-homeomorphism), [`invariants-of-perfectoid-tate-ring`](#invariants-of-perfectoid-tate-ring), `PerfectoidSpaces:P2/rational-localization-of-perfectoid-affinoids`, `AdicSpacesPartII:R3`, `mathlib:Choose.choose_pow_mul_pow_mul_modEq_choose_nat`, `mathlib:PerfectRing`.

Sources: cgj19, Remark 2.1.4, p. 5 (PDF p. 5).

#### `rational-invariants-perfectoid` — Invariants commute with invariant rational localisation for perfectoid pairs

*Theorem.* Let (A, A⁺) be a perfectoid Tate–Huber pair, of any characteristic, with a continuous action of a finite group G of any order, and q: X = Spa(A, A⁺) → Y = Spa(A^G, A^{+G}). For every rational subset U of Y, A^G⟨T/s⟩ → A⟨T/s⟩^G and A^{G+}⟨T/s⟩ → (A⁺⟨T/s⟩)^G are isomorphisms (plus rings: the integral closures of the images); hence O_Y = (q_*O_X)^G and O_Y⁺ = (q_*O_X⁺)^G.

Hypotheses and scope: No hypothesis on |G| and no linearity over a base field.

Proof outline:
1. By the tilting homeomorphism every rational subset of Y = Spa(A^G, A^{+G}) has the form U(T♯/s♯) for T, s in (A^G)♭ = (A♭)^G; its tilt is the rational subset U(T/s) of Spa((A♭)^G).
2. Both A^G⟨T♯/s♯⟩ and A⟨T♯/s♯⟩^G are perfectoid A^G-algebras (rational localisation; invariants of a perfectoid ring).
3. Their tilts are (A♭)^G⟨T/s⟩ and (A♭⟨T/s⟩)^G, by compatibility of tilting with rational localisation and with invariants; these agree by the characteristic-p lemma.
4. A map of perfectoid A^G-algebras whose tilt is an isomorphism is an isomorphism (tilting equivalence over the perfectoid Tate ring A^G). The plus-ring statement follows since plus rings are the integral closures of the images of A⁺, A^{+G}, and tilting preserves the correspondence of plus rings.
5. Alternative route (CGJ Proposition 2.1.3): by the v-sheaf presentation, Spa(A⟨T/s⟩^G) is the coequalizer of (X ×_Y U) × G ⇉ X ×_Y U, which is U because coequalizers commute with base change in a topos; the v-topology is subcanonical on perfectoid spaces.

Acceptance: For |G| invertible it agrees with the averaging lemma. Cyclic p-group: Z/p permuting the variables of K⟨T₁^{1/p^∞}, …, T_p^{1/p^∞}⟩, with the invariant rational subset {|T₁ + ⋯ + T_p| ≤ |ϖ|}.

Prerequisites: [`rational-invariants-characteristic-p`](#rational-invariants-characteristic-p), [`invariants-of-perfectoid-tate-ring`](#invariants-of-perfectoid-tate-ring), [`invariant-spectrum-homeomorphism`](#invariant-spectrum-homeomorphism), `PerfectoidSpaces:P1/tilting-equivalence-and-explicit-tilt`, `PerfectoidSpaces:P2/rational-localization-of-perfectoid-affinoids`, `PerfectoidSpaces:P2/tilting-homeomorphism-and-rational-subsets`.

Sources: cgj19, Proposition 2.1.3, p. 5 (PDF p. 5); cgj19, Remark 2.1.4, p. 5 (PDF p. 5); han16, Proof of Theorem 1.4 (case char K = p > 0, p | |G|), with footnote 3, p. 9 (PDF p. 9).

#### `invariants-of-affinoid-algebra` — Invariants of a classical affinoid algebra are affinoid, and A is finite over them

*Lemma.* Let K be a complete nonarchimedean field, A a K-affinoid algebra (a quotient of some K⟨X₁, …, X_n⟩) and G a finite group acting by K-algebra automorphisms. Then A^G is a K-affinoid algebra and A is a finite A^G-module.

Hypotheses and scope: Any characteristic and any |G|.

Proof outline:
1. Let a₁, …, a_n be topological generators of A over K. The coefficients of the polynomials ∏_{g}(T − g a_i) lie in A^G; they generate a K-affinoid subalgebra B ⊆ A^G (the image of a Tate algebra).
2. Choose the a_i power-bounded. A is a quotient of K⟨Y, X⟩ by Y ↦ (the coefficients c_{ij}), X_i ↦ a_i, and the monic polynomials P_i(X_i) = ∏_g (X_i − g a_i), with coefficients in the Y, lie in the kernel. By Weierstrass division, K⟨Y, X⟩/(P₁(X₁), …, P_n(X_n)) is finite free over K⟨Y⟩, so A is finite over the image B of K⟨Y⟩.
3. B is noetherian, so the B-submodule A^G ⊆ A is finite over B, hence A^G is K-affinoid, and A is finite over A^G.

Acceptance: For μ_n ⊂ K with char K ∤ n acting on K⟨T⟩ by T ↦ ζT, the invariants are K⟨T^n⟩ and K⟨T⟩ is free of rank n over them.

Prerequisites: [`invariant-huber-pair`](#invariant-huber-pair), `AdicSpacesPartII:R0`.

Sources: chj17, Corollary 6.25, p. 54 (PDF p. 54); proof p. 55 (PDF p. 55); han16, Theorem 3.4, p. 8 (PDF p. 8).

#### `rational-invariants-affinoid-algebra` — Rational localisation commutes with invariants for classical affinoid algebras, for any |G|

*Lemma.* Let A be a K-affinoid algebra with a K-linear action of a finite group G, X = Spa(A, A°) and Y = Spa(A^G, A^{G°}). For every rational subset U = U(f/h) of Y, A^G⟨f/h⟩ = A⟨f/h⟩^G. Consequently O_Y = (q_*O_X)^G, Y = X/G in the category of v-ringed spaces, and q: X → Y is finite.

Hypotheses and scope: Classical affinoid algebras over any complete nonarchimedean field; no condition on |G|.

Proof outline:
1. A is a finite A^G-module (previous lemma), so A⟨f/h⟩ = A ⊗̂_{A^G} A^G⟨f/h⟩ = A ⊗_{A^G} A^G⟨f/h⟩.
2. The sequence 0 → A^G → A → ∏_{g∈G} A, a ↦ (g a − a)_g, is an exact sequence of finite A^G-modules; A^G⟨f/h⟩ is flat over A^G, so tensoring keeps it exact, and the kernel of the last map on A⟨f/h⟩ is A⟨f/h⟩^G.
3. The sheaf statements follow as in the averaging lemma, and q is finite because A is finite over A^G.

Acceptance: char K = p and Z/p acting on K⟨T⟩ by T ↦ T + 1 (so p divides |G|): the invariants are K⟨T^p − T⟩, K⟨T⟩ is free of rank p over them, and the rational subset {|T^p − T| ≤ |ϖ|} has invariants K⟨T, (T^p − T)/ϖ⟩^G = K⟨T^p − T, (T^p − T)/ϖ⟩.

Prerequisites: [`invariants-of-affinoid-algebra`](#invariants-of-affinoid-algebra), [`invariant-spectrum-homeomorphism`](#invariant-spectrum-homeomorphism), `tauceti:TauCeti.Huber.PairOfDefinition.flat_toCompletionLoc`.

Sources: han16, Theorem 3.4, p. 8 (PDF p. 8); chj17, Corollary 6.25, p. 54 (PDF p. 54); proof p. 55 (PDF p. 55).

### Categorical quotients and quotients under invariant covers

#### `categorical-quotient` — The categorical quotient X/G of an adic space by a finite group

*Construction.* Let X = (|X|, O_X, (v_x)) be an adic space (more generally an object of Huber's category V of v-ringed spaces) with a right action of a finite group G. Define X/G = (|X|/G, (q_*O_X)^G, (v_y)) where |X|/G has the quotient topology, q: |X| → |X|/G is the orbit map, (q_*O_X)^G is the sheaf of G-invariant sections (a sheaf of complete topological rings), and v_y is the valuation on O_{X/G,y} induced by O_{X/G,y} → O_{X,x} → Γ_{v_x} ∪ {0} for any x over y (independent of x). Then X/G is an object of V with a G-invariant morphism q: X → X/G, and it is the categorical quotient in V: every G-invariant morphism X → Z in V factors uniquely through q.

Hypotheses and scope: No condition: the quotient always exists in V; whether it is an adic space (resp. perfectoid) is the content of the quotient theorems.

Proof outline:
1. (q_*O_X)^G is a sheaf because invariants are left exact; invariants preserve completeness and topological embeddings, so it is a sheaf of complete topological rings.
2. The valuations are independent of x ∈ q^{-1}(y) since the fibre is a G-orbit and g induces isomorphisms of stalks compatible with the valuations.
3. The stalks are local: if v_y(f) ≠ 0 for a germ f of (q_*O_X)^G at y, then f is invertible at each point of the orbit, hence on a G-stable neighbourhood of the orbit, with G-invariant inverse; so O_{X/G,y} is local and O_{X/G,y} → O_{X,x} is a local homomorphism compatible with the valuations.
4. Universal property: a G-invariant morphism f: X → Z factors on spaces through the quotient topology, and f^♭: O_Z → f_*O_X lands in G-invariant sections.

API:
- `VRingedSpace.quotient` (data): The object X/G of V.
- `VRingedSpace.quotient.π` (projection): The G-invariant morphism q: X → X/G.
- `VRingedSpace.quotient.isQuotientMap` (characterisation): |q| is the quotient map |X| → |X|/G; it is open.
- `VRingedSpace.quotient.sections` (characterisation): O_{X/G}(V) = O_X(q^{-1}V)^G for V ⊆ |X|/G open.
- `VRingedSpace.quotient.lift` (universal-property): A G-invariant morphism X → Z factors uniquely through q; lift ∘ q = f and uniqueness.
- `VRingedSpace.quotient.restrict` (functoriality): For a G-stable open U ⊆ X, U/G is the open q(U) of X/G.
- `VRingedSpace.quotient.map` (functoriality): A G-equivariant morphism X → X′ induces X/G → X′/G, with map_id and map_comp.
- `VRingedSpace.quotient.stalk` (simp): For x with a G-clean neighbourhood (for instance a rank-one point of a taut X), O_{X/G,q(x)} = (O_{X,x})^{H_x} for the stabilizer H_x. Without that hypothesis the formula fails: on the closed disc with μ_{p−1} acting by T ↦ ζT, the type-five point in direction 1 at the Gauss point has trivial stabilizer, but every G-stable neighbourhood of its orbit contains the Gauss point, and T − 1 is not an invariant germ.

Unit tests:
- `quotient_trivialAction` (degenerate): For the trivial action of G, q: X → X/G is an isomorphism.
- `quotient_prod_self` (computation): For X = Y × G (G acting on itself by right translation), X/G ≅ Y.
- `quotient_affinoid_perfectoid` (compatibility): For an affinoid perfectoid Spa(A, A⁺) with G, X/G is Spa(A^G, A^{+G}) (affinoid perfectoid quotient).
- `quotient_not_etale_at_fixed_point` (non-example): For p odd and μ₂ acting on the perfectoid disc by T^{1/p^n} ↦ −T^{1/p^n}, q is not étale at the fixed point T = 0: the categorical quotient is not a torsor quotient.

Uses: Hansen 2016, Theorems 1.1–1.4: the quotients whose existence as adic or perfectoid spaces is proved; Hansen–Johansson, Theorems 5.3 and 5.8: X/G = (|X|/G, (q_*O_X)^G, …) is shown to be rigid or perfectoid; Hansen–Johansson, Proposition 5.13(2): X/G ≅ lim X_i/G for good towers; PerfectoidShimuraVarieties:S4: quotients of Shimura towers by finite groups Δ.

Acceptance: For G acting trivially, X/G = X. For X = Y × G with G acting on the second factor, X/G = Y.

Prerequisites: `AdicEtaleGeometry:A0`, `mathlib:TopCat.Presheaf`, `mathlib:Topology.IsQuotientMap`.

Sources: han16, Definition 2.2, p. 3 (PDF p. 3); chj17, Lemma 6.23, p. 54 (PDF p. 54); cgj19, Theorem 2.1.2, p. 5 (PDF p. 5).

#### `affinoid-perfectoid-quotient` — The quotient of an affinoid perfectoid space by a finite group

*Theorem.* Let (A, A⁺) be a perfectoid Tate–Huber pair with a continuous action of a finite group G preserving A⁺ (any |G|). Then X_G = Spa(A^G, A^{+G}) is an affinoid perfectoid space and q: X = Spa(A, A⁺) → X_G is the categorical quotient X/G in V (so also in adic spaces); it is also the coequalizer of X × G ⇉ X in Kedlaya–Liu's locally v-ringed spaces (CGJ Proposition 2.1.3(2)); X × G ⇉ X → X_G is a coequalizer of v-sheaves on Perfd; for every rational U ⊆ X_G, q^{-1}(U) is a G-stable rational subset of X and q^{-1}(U)/G = U; and q is integral: A is integral over A^G.

Hypotheses and scope: No hypothesis on |G| and no base field.

Proof outline:
1. A^G is perfectoid (invariants theorem), so X_G is affinoid perfectoid; |X|/G ≅ |X_G| (homeomorphism theorem).
2. O_{X_G} = (q_*O_X)^G on rational subsets (rational-invariants theorem), so the structure sheaves agree and X_G = X/G in V; valuations agree by construction.
3. The v-sheaf coequalizer statement is the presentation theorem, using that the v-topology on Perfd is subcanonical.
4. The statement on rational subsets is part of the homeomorphism theorem together with the rational-invariants theorem.

Acceptance: Cyclic p-group quotient: over a perfectoid field K of characteristic p (so p = |G| is not invertible), Z/p permuting the coordinates of the perfectoid polydisc Spa(K⟨T₁^{1/p^∞}, …, T_p^{1/p^∞}⟩): the quotient is affinoid perfectoid, and the small diagonal T₁ = ⋯ = T_p is the locus of geometric points with stabilizer Z/p. The same example over an untilt K♯ of characteristic 0, where |G| is invertible.

Prerequisites: [`invariants-of-perfectoid-tate-ring`](#invariants-of-perfectoid-tate-ring), [`invariant-spectrum-homeomorphism`](#invariant-spectrum-homeomorphism), [`rational-invariants-perfectoid`](#rational-invariants-perfectoid), [`categorical-quotient`](#categorical-quotient), [`invariant-quotient-v-sheaf-presentation`](#invariant-quotient-v-sheaf-presentation), `DiamondsAndVStacks:D2`, `PerfectoidSpaces:P2/sheaf-theorem-and-almost-acyclicity`.

Sources: cgj19, Proposition 2.1.3, p. 5 (PDF p. 5); han16, Theorem 1.2, p. 2 (PDF p. 2); han16, Theorem 1.4, p. 2 (PDF p. 2); cgj19, Theorem 2.1.2, p. 5 (PDF p. 5).

Planet: **Quotient of an affinoid perfectoid space**.

#### `quotient-scalar-extension` — Finite quotients commute with orthonormalisable scalar extension

*Lemma.* Let K be a complete nonarchimedean field, (A, A⁺) a complete Tate–Huber pair over (K, K°) with a K-linear action of a finite group G, and L/K a complete extension such that L is orthonormalisable as a Banach K-space (for example L/K finite, or K discretely valued). Then A^G ⊗̂_K L → (A ⊗̂_K L)^G is an isomorphism, and Spa(A ⊗̂_K L)/G = Spa(A^G ⊗̂_K L) with the plus rings given by integral closure; the quotients of the affinoid perfectoid and of the affinoid rigid theorems commute with base change from K to L.

Hypotheses and scope: G acts K-linearly (trivially on L); L orthonormalisable over K.

Proof outline:
1. An orthonormal basis (e_i) of L identifies A ⊗̂_K L with the Banach space of sequences (a_i) in A tending to 0, G acting coordinatewise.
2. Invariant sequences are exactly the sequences in A^G tending to 0, i.e. A^G ⊗̂_K L.
3. Plus rings: both are the integral closures of the image of A^{+G} ⊗ L°; the quotient statements then follow from the affinoid quotient theorems applied over L.

Acceptance: K = ℚ_p and L = ℂ_p (orthonormalisable, Serre): for μ₂ acting on ℚ_p⟨T⟩ by T ↦ −T (p odd), (ℂ_p⟨T⟩)^{μ₂} = ℂ_p⟨T²⟩ = ℚ_p⟨T²⟩ ⊗̂ ℂ_p.

Prerequisites: [`invariant-huber-pair`](#invariant-huber-pair), [`affinoid-perfectoid-quotient`](#affinoid-perfectoid-quotient), [`rational-invariants-affinoid-algebra`](#rational-invariants-affinoid-algebra), `AdicEtaleGeometry:A0`.

Sources: chj17, Lemma 2.23, p. 19 (PDF p. 19); bhw21, Proposition 3.8, p. 10 (PDF p. 10); han16, Theorem 1.4, p. 2 (PDF p. 2).

#### `perfectoid-quotient-invariant-cover` — Perfectoid quotients under a G-stable affinoid perfectoid cover

*Theorem.* Let X be a perfectoid space with a right action of a finite group G, and suppose X has a covering by G-stable open subspaces U_i = Spa(A_i, A_i⁺) with A_i perfectoid Tate. Then X/G (the categorical quotient in V; equivalently the coequalizer of X × G ⇉ X in locally v-ringed spaces) is a perfectoid space covered by the affinoid perfectoid opens U_i/G = Spa(A_i^G, A_i^{+G}); |X/G| = |X|/G; the preimage under q of each U_i/G is U_i. There is no condition on |G|.

Hypotheses and scope: The covering by G-stable affinoid perfectoids is a hypothesis here (Hansen's invariant affinoid-cover hypothesis); Hansen–Johansson's theorem removes it under analytic separation.

Proof outline:
1. U_i = q^{-1}(q(U_i)) is G-stable and open, so q(U_i) = U_i/G is open in the quotient topology.
2. (X/G)|_{U_i/G} = U_i/G as objects of V (restriction of the categorical quotient), and U_i/G = Spa(A_i^G, A_i^{+G}) is affinoid perfectoid by the affinoid theorem, so X/G is a perfectoid space.

Acceptance: Hansen's Theorem 1.4 is the special case (i) |G| ∈ O_X(X)^× or (ii) a K-linear action over a perfectoid field.

Prerequisites: [`affinoid-perfectoid-quotient`](#affinoid-perfectoid-quotient), [`categorical-quotient`](#categorical-quotient).

Sources: cgj19, Theorem 2.1.2, p. 5 (PDF p. 5); han16, Theorem 1.4, p. 2 (PDF p. 2); han16, Theorem 1.1, p. 1 (PDF p. 1).

#### `adic-quotient-order-invertible` — Quotients of analytic adic spaces with a G-stable affinoid cover, |G| invertible

*Theorem.* Let X be an analytic adic space with an action of a finite group G, covered by G-stable open affinoid subspaces Spa(A_i, A_i⁺) with A_i a Tate ring, and assume |G| is invertible in O_X(X). Then X/G is an adic space with underlying space |X|/G, covered by the affinoid adic spaces Spa(A_i^G, A_i^{+G}).

Hypotheses and scope: |G| ∈ O_X(X)^×; the affinoid charts are sheafy (they are affinoid adic spaces). The charts must be Tate: the homeomorphism theorem needs a pseudouniformizer. The source asks only for G-stable affinoids in an analytic space (see sourceIssues).

Proof outline:
1. Each U_i/G = Spa(A_i^G, A_i^{+G}) in V by the averaging lemma and the homeomorphism theorem.
2. Glue as in the invariant-cover theorem: U_i/G are open in X/G and cover it.

Acceptance: Sousperfectoid and rigid charts with |G| invertible, e.g. μ_2 acting on a disc over ℚ_p.

Prerequisites: [`rational-invariants-order-invertible`](#rational-invariants-order-invertible), [`invariant-spectrum-homeomorphism`](#invariant-spectrum-homeomorphism), [`categorical-quotient`](#categorical-quotient).

Sources: han16, Theorem 1.1, p. 1 (PDF p. 1).

#### `rigid-quotient-invariant-cover` — Quotients of rigid spaces with a G-stable affinoid cover, for any |G|

*Theorem.* Let X be a rigid analytic space over a complete nonarchimedean field K with a K-linear action of a finite group G, and suppose X has an (admissible) covering by G-stable open affinoid subspaces. Then X/G is a rigid analytic space over K, q: X → X/G is finite, and X/G is affinoid if X is. Conversely, if X/G is rigid with q finite then such a covering exists.

Hypotheses and scope: No condition on |G|.

Proof outline:
1. Each affinoid chart U_i = Spa(A_i, A_i°) has U_i/G = Spa(A_i^G, A_i^{G°}) with A_i^G affinoid (affinoid invariants lemma and rational-invariants lemma for affinoid algebras).
2. Glue over the G-stable cover; q is finite chartwise.
3. Converse: preimages under the finite map q of an affinoid cover of X/G are G-stable affinoids.

Acceptance: Modular curves: X_{Γ(N)} with G = SL₂(ℤ/N) acting has a G-stable affinoid cover and quotient X(1).

Prerequisites: [`rational-invariants-affinoid-algebra`](#rational-invariants-affinoid-algebra), [`invariants-of-affinoid-algebra`](#invariants-of-affinoid-algebra), [`categorical-quotient`](#categorical-quotient).

Sources: han16, Theorem 1.3, p. 2 (PDF p. 2); chj17, Corollary 6.26, p. 55 (PDF p. 55).

#### `quotient-diamond-comparison` — The diamond of a finite quotient is the quotient of the diamond

*Theorem.* Let X be an analytic adic space over ℤ_p with an action of a finite group G, covered by G-stable affinoid opens Spa(A_i, A_i⁺) such that X/G is an adic space covered by the Spa(A_i^G, A_i^{+G}) (as in the three quotient theorems). Then the canonical map X^◇/G → (X/G)^◇ of pro-étale sheaves is an isomorphism.

Hypotheses and scope: The quotient on the left is taken as a pro-étale (equivalently v-) sheaf.

Proof outline:
1. The question is local on X/G, since (−)^◇ takes open covers to open covers and quotient sheaves are compatible with restriction to G-stable opens.
2. On a chart, Spd(A_i, A_i⁺)/G ≅ Spd(A_i^G, A_i^{+G}) by the v-sheaf presentation theorem.

Acceptance: For a finite étale Galois cover Y → X with group G of perfectoid spaces, Y^◇/G = X^◇.

Prerequisites: [`invariant-quotient-v-sheaf-presentation`](#invariant-quotient-v-sheaf-presentation), [`perfectoid-quotient-invariant-cover`](#perfectoid-quotient-invariant-cover), `DiamondsAndVStacks:D4`, `DiamondsAndVStacks:D6`.

Sources: hj20, Theorem 5.3 (with the following paragraph on the auxiliary conditions), p. 28 (PDF p. 28); hj20, Theorem 5.8, p. 30 (PDF p. 30).

#### `free-action-quotient-is-torsor` — Free actions give finite étale torsors; the universal quotient is not one in general

*Theorem.* Let X be a perfectoid space with an action of a finite group G such that X/G is a perfectoid space with (X/G)^◇ = X^◇/G (for instance under a G-stable affinoid perfectoid cover, or the hypotheses of Hansen–Johansson's theorem). The following are equivalent: (a) q: X → X/G is a finite étale G-torsor, i.e. finite étale with X × G ≅ X ×_{X/G} X via (x, g) ↦ (x, xg); (b) G acts freely on X^◇, i.e. X^◇ × G → X^◇ ×_{X^◇/G} X^◇ is injective; (c) every geometric point Spa(C, C⁺) → X has trivial stabilizer in G. Conversely, if Y → X is a surjective finite étale map of perfectoid spaces with a G-action over X such that Y × G ≅ Y ×_X Y (a G-torsor), then X = Y/G. The universal quotient of the other quotient theorems is a G-torsor only when these conditions hold.

Hypotheses and scope: G finite; the quotient exists and commutes with (−)^◇.

Proof outline:
1. (a) ⇒ (b), (c): immediate from X × G ≅ X ×_{X/G} X.
2. (c) ⇒ (b): for g ≠ 1 the fixed-point subsheaf X^g (the equalizer of id and g) has |X^g| = ∅ by (c), so X^g = ∅; this is the injectivity of X × G → X ×_{X/G} X.
3. (b) ⇒ (a): X^◇ → X^◇/G is an epimorphism of pro-étale sheaves, and freeness makes X × G → X ×_{X/G} X an isomorphism, so q^◇ is a G-torsor (trivialised by base change along itself). After the v-cover X → X/G it becomes the finite étale map X × G → X; finite étale maps descend along v-covers of perfectoid spaces, so q is finite étale.
4. Converse: Y → X is then a G-torsor, so Y^◇/G = X^◇; preimages of affinoid perfectoids of X are G-stable affinoid perfectoids (strongly finite étale maps are affinoid over affinoids), so Y/G exists and (Y/G)^◇ = Y^◇/G = X^◇, hence Y/G = X.
5. Scheme analogue for comparison: SGA 1, V.2.6, where finiteness, Y = X/G and trivial inertia characterise principal homogeneous bundles over a locally noetherian base; the perfectoid statement replaces inertia by stabilizers of geometric points and noetherian descent by v-descent.

Acceptance: μ₂ on the perfectoid disc (p odd) by T^{1/p^n} ↦ −T^{1/p^n}: free away from 0; near 0 q is not a torsor, its fibre over 0 being one geometric point rather than two. The Z/p-permutation action on the perfectoid p-polydisc is free exactly off the small diagonal T₁ = ⋯ = T_p (a group of prime order has stabilizers 1 or Z/p).

Prerequisites: [`quotient-diamond-comparison`](#quotient-diamond-comparison), [`perfectoid-quotient-invariant-cover`](#perfectoid-quotient-invariant-cover), `DiamondsAndVStacks:D3`, `DiamondsAndVStacks:D2`, `DiamondsAndVStacks:D5`, `PerfectoidSpaces:P3/strongly-finite-etale-maps-are-affinoid-over-affinoids`.

Sources: ecd, Definition 10.12, p. 53 (PDF p. 53); sga1, Exposé V, Proposition 2.6, PDF p. 111.

### Hansen–Johansson quotients: G-clean charts and analytic separation

#### `g-clean-neighbourhood` — G-clean neighbourhoods

*Definition.* Let X be a topological space with a continuous (right) action of a finite group G, x ∈ X a point and H_x ≤ G its stabilizer. An open neighbourhood U of x is G-clean if Uh = U for all h ∈ H_x and U ∩ Ug = ∅ for all g ∈ G ∖ H_x. For a G-clean U, the map U ×^{H_x} G → X, (u, g) ↦ ug, is an open embedding whose image is the disjoint union of the [G : H_x] translates of U; it is a G-stable open neighbourhood of the orbit xG.

Hypotheses and scope: G finite; no separation hypothesis in the definition.

Proof outline:
1. U ×^{H_x} G is the disjoint union of the translates U g_i over coset representatives g_i of H_x ∖ G; the translates are pairwise disjoint by cleanness, and each is open, so the map is an open embedding.

API:
- `MulAction.IsGClean` (data): The predicate: U open, x ∈ U, U·h = U for h ∈ stabilizer x, U ∩ U·g = ∅ for g ∉ stabilizer x.
- `MulAction.IsGClean.smul_eq` (projection): U·h = U for h in the stabilizer.
- `MulAction.IsGClean.disjoint_smul` (projection): U and U·g are disjoint for g outside the stabilizer.
- `MulAction.IsGClean.isOpenEmbedding_induced` (characterisation): U ×^{H_x} G → X is an open embedding onto ⋃_g U·g.
- `MulAction.IsGClean.inter` (relation): The intersection of a G-clean U with an H_x-stable open containing x is G-clean.
- `MulAction.IsGClean.preimage` (functoriality): The preimage of a G-clean neighbourhood of f(x) under a G-equivariant continuous f with the same stabilizer at x is G-clean.

Unit tests:
- `isGClean_trivialGroup` (degenerate): For the trivial group every open neighbourhood of x is G-clean.
- `isGClean_neg_real` (computation): For Z/2 acting on ℝ by x ↦ −x: (1/2, 3/2) is G-clean at 1 (trivial stabilizer), and (−1, 1) is G-clean at 0 (stabilizer G).
- `isGClean_iff_isOpenEmbedding` (characterisation): U is G-clean at x if and only if U is H_x-stable and U ×^{H_x} G → X is injective with open image.
- `not_isGClean_doubled_origin` (non-example): On the line with a doubled origin, with Z/2 swapping the two origins, no neighbourhood of one origin is G-clean: every neighbourhood meets its translate. The Hausdorff hypothesis of the existence lemma cannot be dropped.

Uses: Hansen–Johansson, proofs of Theorems 5.3 and 5.8: a G-clean neighbourhood of the closure of a rank-one point, intersected with an H_x-stable affinoid, is a chart of the quotient; PerfectoidSpaces:P8/finite-quotient-chart: the G-stable open W ×^{H} G whose quotient is W/H.

Acceptance: For G = {1}, every open neighbourhood is G-clean.

Prerequisites: `mathlib:MulAction.stabilizer`, `mathlib:IsOpen`.

Sources: hj20, Definition (G-clean neighbourhood), unnumbered, in the paragraph before Lemma 5.2, p. 27 (PDF p. 27).

#### `g-clean-neighbourhoods-exist` — G-clean neighbourhoods exist in Hausdorff spaces

*Lemma.* Let X be a Hausdorff space with a continuous action of a finite group G. Every point x ∈ X admits a G-clean open neighbourhood; the G-clean neighbourhoods of x form a neighbourhood basis of x.

Hypotheses and scope: X Hausdorff.

Proof outline:
1. Choose coset representatives G = ⊔ H g_i with g₁ = 1, so the orbit is {x g_i} with stabilizers g_i^{-1} H g_i; choose pairwise disjoint open neighbourhoods U_i′ of x g_i (Hausdorff).
2. U_i = ∩_{k ∈ g_i^{-1}Hg_i} U_i′ k is open, contains x g_i, is g_i^{-1}Hg_i-stable, and the U_i are pairwise disjoint.
3. V_i = U_i g_i^{-1} is an H-stable neighbourhood of x; W = ∩_i V_i is H-stable, and W g_i ⊆ U_i, so the translates W g_i are pairwise disjoint. Intersecting with any given neighbourhood first gives the basis statement.

Acceptance: The rotation action of μ_n on the unit circle: short arcs are G-clean.

Prerequisites: [`g-clean-neighbourhood`](#g-clean-neighbourhood), `mathlib:T2Space`, `mathlib:t2_separation`.

Sources: hj20, Lemma 5.2, p. 28 (PDF p. 28).

#### `finite-quotient-chart` — Charts of a finite quotient from a G-clean neighbourhood inside a stabilizer-stable affinoid

*Lemma.* Let X be a quasi-separated analytic adic space (a rigid space or a perfectoid space) with an action of a finite group G, π: |X| → |X|^h its maximal Hausdorff quotient, x ∈ X a rank-one point with stabilizer H, and V ⊆ X an H-stable open affinoid containing the closure of {x} for which the affinoid quotient V/H exists (rigid: V/H = Spa(A^H, A^{H°}); perfectoid: V/H = Spa(A^H, A^{+H})). Assume that π is injective on the orbit xG, i.e. the stabilizer of π(x) in G is H (this holds when |X| is taut, since π is then injective on rank-one points). Let U ⊆ |X|^h be a G-clean neighbourhood of π(x) and W = π^{-1}(U) ∩ V. Then W is a G-clean neighbourhood of the closure of {x}, W ×^H G ⊆ X is a G-stable open subspace, (W ×^H G)/G ≅ W/H is an open subspace of V/H in V, and the pullback of W ×^H G → (W ×^H G)/G is ⊔_i W g_i → W/H, (w g_i) ↦ [w].

Hypotheses and scope: x rank one; V an H-stable affinoid with an affinoid quotient; the maximal Hausdorff quotient carries the induced G-action. π injective on xG. Without it π^{-1}(U) is only stable under the stabilizer of π(x), which may be larger than H, and is then not G-clean at x (see sourceIssues).

Proof outline:
1. π is G-equivariant by functoriality of the maximal Hausdorff quotient; π is continuous to a Hausdorff space, so π(closure{x}) = {π(x)} and closure{x} ⊆ π^{-1}(π(x)).
2. Since the stabilizer of π(x) is H, U G-clean at π(x) implies π^{-1}(U) G-clean at x: (π^{-1}U)h = π^{-1}(Uh) = π^{-1}U for h ∈ H, and π^{-1}U ∩ (π^{-1}U)g = π^{-1}(U ∩ Ug) = ∅ for g ∉ H. It contains closure{x}; intersecting with the H-stable V keeps it G-clean.
3. W ×^H G = ⊔ W g_i is open and G-stable; its quotient by G is W/H (a disjoint union of translates, permuted simply transitively on the cosets), and |W|/H is open in |V|/H since W is H-stable and open in V.
4. The restriction of the categorical quotient to the G-stable open is its categorical quotient.

Acceptance: For G acting freely, H = {1} and the chart is W itself.

Prerequisites: [`g-clean-neighbourhoods-exist`](#g-clean-neighbourhoods-exist), [`categorical-quotient`](#categorical-quotient), `mathlib:T2Quotient`.

Sources: hj20, Theorem 5.3 (with the following paragraph on the auxiliary conditions), p. 28 (PDF p. 28).

#### `zariski-closed-embedding` — Zariski-closed embeddings of perfectoid spaces and Zariski-open subsets

*Definition.* A map of perfectoid spaces Z → X is a Zariski-closed embedding if for every open affinoid perfectoid U ⊆ X the base change Z ×_X U → U is a Zariski-closed embedding of affinoid perfectoid spaces, i.e. an injection onto the vanishing locus of an ideal I ⊆ O_X(U) (equivalently, by ECD 5.8, a strongly Zariski-closed immersion Spa(S, S⁺) → U with O_X(U) → S surjective and S⁺ the integral closure of O_X⁺(U)). An open subset U ⊆ X is Zariski open if X ∖ U → X, with its induced structure, is a Zariski-closed embedding.

Hypotheses and scope: The affinoid notion is the one of Scholze's torsion paper II.2 and ECD Definition 5.7, owned by P4 and Q4. Base change of an affinoid Zariski-closed immersion along any map of affinoid perfectoids is Zariski closed (Scholze, torsion paper, Lemma II.2.9(i)); what the source leaves open is whether the property can be checked on one affinoid cover, so the definition quantifies over all open affinoid perfectoids.

Proof outline:
1. Affinoid Zariski-closed subsets are affinoid perfectoid (Scholze, torsion paper, Lemma II.2.2) and, by ECD 5.8, strongly Zariski closed; so each Z ×_X U is affinoid perfectoid.

API:
- `PerfectoidSpace.IsZariskiClosedEmbedding` (data): The predicate on a map Z → X of perfectoid spaces, quantified over open affinoid perfectoids of X.
- `PerfectoidSpace.IsZariskiClosedEmbedding.of_affinoid` (constructor): An affinoid Zariski-closed immersion into an affinoid perfectoid is a Zariski-closed embedding.
- `PerfectoidSpace.IsZariskiClosedEmbedding.base_change_affinoid` (projection): For U ⊆ X open affinoid perfectoid, Z ×_X U → U is strongly Zariski closed.
- `PerfectoidSpace.IsZariskiClosedEmbedding.isClosedImmersion` (compatibility): A Zariski-closed embedding is a closed immersion (injection with closed image) in the sense of ECD 5.6.
- `PerfectoidSpace.IsZariskiClosedEmbedding.comp_open` (functoriality): Restriction to an open subspace of X preserves the property.
- `PerfectoidSpace.IsZariskiOpen` (data): An open U ⊆ X whose closed complement, with its induced structure, is a Zariski-closed embedding.

Unit tests:
- `isZariskiClosedEmbedding_id` (degenerate): The identity of X and the empty subspace are Zariski-closed embeddings.
- `isZariskiClosedEmbedding_point` (computation): For K perfectoid, the point T = 0 of Spa(K⟨T^{1/p^∞}⟩) is the Zariski-closed embedding cut out by the ideal (T^{1/p^n})_n, with ring K.
- `isZariskiClosedEmbedding_affinoid_iff` (compatibility): For X affinoid perfectoid, a map Z → X is a Zariski-closed embedding if and only if it is a (strongly) Zariski-closed immersion in the sense of ECD Definition 5.7.
- `not_isZariskiClosed_gauss_closure` (non-example): In the perfectoid closed disc over K, every function vanishing at the Gauss point is zero, so the closure of the Gauss point, a closed subset, is not the vanishing locus of an ideal: closed immersions of perfectoid spaces need not be Zariski closed.

Uses: Hansen–Johansson, Definition 5.4(2): analytic separation asks that the diagonal be a Zariski-closed embedding; Hansen–Johansson, Lemmas 5.6–5.7: closed subvarieties and diagonals pulled back to perfectoid towers; PerfectoidShimuraVarieties:S2: the Hodge-type tower is Zariski closed in the perfectoid Siegel tower; Hansen–Johansson, proof of Corollary 5.21: the boundary of the minimal compactification is (strongly) Zariski closed.

Acceptance: The diagonal of an affinoid perfectoid space over a perfectoid field is a Zariski-closed embedding.

Prerequisites: `PerfectoidQuotients:Q4/zariski-closed-subsets-are-strongly-zariski-closed`, `PerfectoidSpaces:P4`, `PerfectoidSpaces:P2/fibre-products-of-perfectoid-spaces`.

Sources: hj20, Definition 5.4 (1),(2) (with the caution paragraph after it), p. 29 (PDF p. 29); sch15, Definition II.2.1, p. 13 (PDF p. 13); ecd, Definition 5.7, p. 24 (PDF p. 24).

#### `analytically-separated` — Analytically separated perfectoid spaces

*Definition.* A perfectoid space X over a nonarchimedean field Spa(K, K⁺) is analytically separated if the diagonal X → X ×_{Spa(K, K⁺)} X is a Zariski-closed embedding. Here the fibre product of perfectoid spaces over Spa(K, K⁺) is perfectoid (for K not perfectoid, by the uniform completed tensor product of Kedlaya–Liu).

Hypotheses and scope: The notion is stronger than separatedness of X^◇ → Spd(K, K⁺) (ECD Definition 5.10), which the source finds too weak for quotients.

Proof outline:
1. The fibre product exists: affinoid-locally it is Spa of the uniform completion of A ⊗_K B with the integral closure of the image of A⁺ ⊗ B⁺. It is perfectoid by Kedlaya–Liu 3.6.18 when K has characteristic 0; in characteristic p the uniform completion of a tensor product of perfect uniform rings is perfect and uniform, hence perfectoid. That it represents the fibre product follows as in the perfectoid fibre-product construction (P2).

API:
- `PerfectoidSpace.IsAnalyticallySeparated` (data): The diagonal over Spa(K, K⁺) is a Zariski-closed embedding.
- `PerfectoidSpace.IsAnalyticallySeparated.inter_affinoid` (characterisation): Intersections of two open affinoid perfectoids are affinoid perfectoid.
- `PerfectoidSpace.IsAnalyticallySeparated.isSeparated` (compatibility): X^◇ → Spd(K, K⁺) is a separated map of v-sheaves (ECD Definition 10.7).
- `PerfectoidSpace.IsAnalyticallySeparated.of_affinoid` (constructor): Affinoid perfectoid spaces over a perfectoid field are analytically separated.
- `PerfectoidSpace.IsAnalyticallySeparated.of_open` (functoriality): Open subspaces of analytically separated spaces are analytically separated.

Unit tests:
- `isAnalyticallySeparated_affinoid` (degenerate): Spa(K, K°) and every affinoid perfectoid space over K are analytically separated.
- `isAnalyticallySeparated_projective_tower` (computation): The perfectoid projective line lim_{x ↦ x^p} ℙ¹ over ℂ_p is analytically separated (it is the limit of a tower of projective varieties).
- `isAnalyticallySeparated_isSeparated` (compatibility): Analytic separation implies that X^◇ → Spd(K, K⁺) is separated as a map of v-sheaves (ECD Definition 10.7; ECD 5.10 when K is perfectoid).
- `not_isAnalyticallySeparated_nonseparated_gluing` (non-example): Glue two copies of the perfectoid closed disc D = Spa(K⟨T^{1/p^∞}⟩) along the rational subset {|T| ≥ |ϖ|}. The result is quasi-separated and the two affinoid charts meet in an affinoid, so the intersection property of the next lemma holds; but it is not separated (the rank-two point just inside |T| = |ϖ| has two lifts), so it is not analytically separated. A definition asking only for affinoid intersections, or only that the diagonal be an injection, would accept it.

Uses: Hansen–Johansson, Theorem 5.8: the hypothesis under which finite quotients of perfectoid spaces exist without a given invariant affinoid cover; Hansen–Johansson, Proposition 5.13(2) and Proposition 5.14: limits of good towers, including minimally compactified Hodge-type towers, are analytically separated; PerfectoidShimuraVarieties:S4: the pre-abelian descent applies the quotient theorem to analytically separated towers.

Acceptance: An affinoid perfectoid space over a perfectoid field is analytically separated: its diagonal is strongly Zariski closed because A ⊗̂ A → A is surjective (ECD Proposition 5.9).

Prerequisites: [`zariski-closed-embedding`](#zariski-closed-embedding), `PerfectoidSpaces:P2/fibre-products-of-perfectoid-spaces`, `PerfectoidSpaces:P2`.

Sources: hj20, Definition 5.4 (1),(2) (with the caution paragraph after it), p. 29 (PDF p. 29); kl15, Corollary 3.6.18, p. 96 (PDF p. 96).

#### `analytically-separated-is-separated` — Analytically separated perfectoid spaces are separated

*Lemma.* If a perfectoid space X over Spa(K, K⁺) is analytically separated, then X^◇ → Spd(K, K⁺) is a separated map of v-sheaves in the sense of ECD Definition 10.7 (for K perfectoid, X → Spa(K, K⁺) is separated in the sense of ECD Definition 5.10) (ECD Definition 5.10).

Proof outline:
1. A Zariski-closed embedding is a closed immersion (injection with closed image) of perfectoid spaces: the base change to each open affinoid perfectoid is an injection onto a closed vanishing locus.
2. So the diagonal of X over Spa(K, K⁺) is a closed immersion of perfectoid spaces, hence X^◇ → X^◇ × X^◇ over Spd(K, K⁺) is a closed immersion of v-sheaves, which is separatedness (ECD 10.7; ECD 5.10 when K is perfectoid).

Acceptance: Holds for affinoid perfectoid X.

Prerequisites: [`analytically-separated`](#analytically-separated), [`zariski-closed-embedding`](#zariski-closed-embedding), `PerfectoidSpaces:P4`.

Sources: hj20, Lemma 5.5, p. 29 (PDF p. 29).

#### `analytically-separated-affinoid-intersections` — In an analytically separated space, intersections of affinoid perfectoids are affinoid perfectoid

*Lemma.* If X is analytically separated over Spa(K, K⁺), then for any two open affinoid perfectoid subsets U, V ⊆ X the intersection U ∩ V is affinoid perfectoid.

Proof outline:
1. U ∩ V = (U ×_{Spa(K, K⁺)} V) ×_{X × X, Δ} X.
2. U × V is an open affinoid perfectoid of X × X, so the pullback of the Zariski-closed diagonal to it is a Zariski-closed subset of an affinoid perfectoid, which is affinoid perfectoid.

Acceptance: For the perfectoid projective line over ℂ_p, the two standard affinoid perfectoid charts {|T| ≤ 1} and {|T| ≥ 1} meet in the affinoid perfectoid annulus {|T| = 1}; for the gluing of two discs along a non-quasicompact open the lemma fails, as it must.

Prerequisites: [`analytically-separated`](#analytically-separated), [`zariski-closed-embedding`](#zariski-closed-embedding), `PerfectoidSpaces:P2/fibre-products-of-perfectoid-spaces`.

Sources: hj20, Lemma 5.5, p. 29 (PDF p. 29).

#### `limit-of-zariski-closed-embeddings` — Cofiltered limits of Zariski-closed embeddings into a fixed affinoid perfectoid

*Lemma.* Let U = Spa(R, R⁺) be affinoid perfectoid and (W_i → U)_{i∈I} a cofiltered system of Zariski-closed embeddings, W_i cut out by ideals I_i ⊆ R with I_i ⊆ I_j for i ≤ j. Then lim_i W_i → U (limit of v-sheaves) is the Zariski-closed embedding cut out by the ideal ∑_i I_i, in particular an affinoid perfectoid space.

Proof outline:
1. A perfectoid T → U factors through every W_i if and only if every I_i maps to 0 in O(T), i.e. ∑ I_i does (universal property of Zariski-closed subsets, Scholze torsion II.2.2–II.2.3).
2. The vanishing locus of ∑ I_i is ∩ |W_i|, and it is represented by the affinoid perfectoid Zariski-closed subspace.

Acceptance: In the infinite perfectoid polydisc Spa(K⟨T_i^{1/p^∞} : i ≥ 1⟩), W_n = V(T₁, …, T_n); the limit is the origin, cut out by the ideal (T_i)_{i ≥ 1}.

Prerequisites: [`zariski-closed-embedding`](#zariski-closed-embedding), `PerfectoidQuotients:Q4/zariski-closed-subsets-are-strongly-zariski-closed`.

Sources: hj20, Lemma 5.6, p. 30 (PDF p. 30); sch15, Lemma II.2.2, p. 13 (PDF p. 13).

#### `closed-subvariety-pullback-is-zariski-closed` — Pullbacks of closed subvarieties to perfectoid spaces are Zariski closed

*Lemma.* Let Y → X be a closed immersion of quasi-projective varieties over a nonarchimedean field K and f: Z → X^an a map from a perfectoid space. Then the diamond W = Z ×_{X^an} Y^an is a perfectoid space and W → Z is a Zariski-closed embedding; for Z affinoid perfectoid, W is cut out by the ideal generated by the images of finitely many global sections of f^*ℰ for any vector bundle ℰ on X^an surjecting onto the ideal sheaf of Y^an.

Hypotheses and scope: Quasi-projectivity is used to find a vector bundle surjecting onto the ideal sheaf.

Proof outline:
1. Reduce to Z affinoid perfectoid. Replace X by its closure in a projective space and Y by its closure in X; this does not change Z ×_X Y, since Y is closed in X.
2. Let ℐ be the ideal sheaf of Y^an. For n ≫ 0, ℐ(n) is globally generated on the projective X, giving ℰ = O(−n)^m ↠ ℐ; analytify.
3. f^*ℰ is a vector bundle on Z, and the image of f^*ℰ → O_Z is the ideal sheaf generated by f^{-1}ℐ. On the affinoid perfectoid Z, vector bundles are finite projective O(Z)-modules and are generated by global sections; generators e₁, …, e_n give an ideal I ⊆ O(Z).
4. The Zariski-closed subset W ⊆ Z cut out by I represents the fibre product: a map T → Z factors through Y^an if and only if f^{-1}ℐ generates the zero ideal of O_T, i.e. I ↦ 0.

Acceptance: For Y a point of X = ℙ¹ and Z the perfectoid ℙ¹, W is the fibre of the Frobenius tower over that point.

Prerequisites: [`zariski-closed-embedding`](#zariski-closed-embedding), `AdicSpacesPartII:R3`, `AdicSpacesPartII:R1`, `PerfectoidQuotients:Q4/zariski-closed-subsets-are-strongly-zariski-closed`.

Sources: hj20, Lemma 5.7, p. 30 (PDF p. 30).

#### `projective-tower-limit-is-analytically-separated` — Limits of towers of opens in projective varieties are analytically separated

*Lemma.* Let (X_i)_{i∈I} be a cofiltered inverse system of separated rigid analytic spaces over Spa(K, K°), each an open subspace of the analytification of a projective variety over K, and suppose X_∞ = lim_i X_i^◇ is a perfectoid space. Then X_∞ is analytically separated.

Proof outline:
1. Choose open immersions X_i → V_i^an into projective varieties. For an open affinoid perfectoid U ⊆ X_∞ × X_∞ put W_i = U ×_{X_i × X_i, Δ} X_i ≅ U ×_{V_i^an × V_i^an, Δ} V_i^an.
2. The diagonal V_i → V_i × V_i is a closed immersion of projective varieties, so W_i → U is a Zariski-closed embedding with W_i affinoid perfectoid (closed-subvariety lemma).
3. U ×_{X_∞ × X_∞, Δ} X_∞ = lim_i W_i, a cofiltered limit of Zariski-closed embeddings into U, hence Zariski closed.

Acceptance: The perfectoid projective line over ℂ_p (tower of Frobenius twists of ℙ¹).

Prerequisites: [`closed-subvariety-pullback-is-zariski-closed`](#closed-subvariety-pullback-is-zariski-closed), [`limit-of-zariski-closed-embeddings`](#limit-of-zariski-closed-embeddings), [`analytically-separated`](#analytically-separated).

Sources: hj20, Lemma 5.6, p. 30 (PDF p. 30).

#### `rigid-finite-quotient` — Finite quotients of separated rigid spaces

*Theorem.* Let X be a separated rigid analytic space over a complete nonarchimedean field K with a K-linear action of a finite group G, such that for every rank-one point x ∈ X the closure of {x} lies in some open affinoid Spa(A, A°) ⊆ X, and such that distinct rank-one points of one G-orbit have distinct images in the maximal Hausdorff quotient |X|^h (automatic if |X| is taut, e.g. X affinoid, quasicompact or partially proper). Then the categorical quotient X/G = (|X|/G, (q_*O_X)^G, …) is a rigid analytic space, q: X → X/G is finite, and X^◇/G → (X/G)^◇ is an isomorphism. No G-stable affinoid cover is assumed; one exists a posteriori.

Hypotheses and scope: X separated; closures of rank-one points in affinoids; orbits of rank-one points injective in |X|^h; no condition on |G|. The orbit condition is not in the source's statement; its proof needs it (see sourceIssues). Hansen's Theorem 1.3(ii), whose hypothesis is that orbits lie in affinoids, needs no such condition. The closure condition holds trivially for X affinoid; the source remarks that it also holds for partially proper X, hence for analytifications of separated K-schemes of finite type.

Proof outline:
1. For a rank-one x with stabilizer H choose an affinoid V ⊇ closure{x}; by separatedness ∩_{h∈H} V h is affinoid and H-stable, and V/H = Spa(A^H, A^{H°}) is an affinoid rigid space (affinoid invariants lemma and the rational-invariants lemma for affinoid algebras).
2. The chart lemma gives W with W ×^H G ⊆ X G-stable open and (W ×^H G)/G ≅ W/H open in V/H; varying x these cover X/G by rigid spaces.
3. Finiteness: W → W/H is the pullback of the finite V → V/H, and over W/H the map q is ⊔_i W g_i → W/H.
4. Diamonds: the affinoid statement is the v-sheaf presentation theorem, glued over the charts.
5. A posteriori cover: q is finite, so the preimages of an affinoid cover of X/G are G-stable affinoids covering X.
6. Hansen's Theorem 1.3(ii) (separated, orbits of points contained in affinoids) is the variant where G-stable affinoids V_x = ∩_g U_x g cover X.

Acceptance: μ_n acting on the closed disc by rotation; a finite group acting on the analytification of a projective curve.

Prerequisites: [`finite-quotient-chart`](#finite-quotient-chart), [`rational-invariants-affinoid-algebra`](#rational-invariants-affinoid-algebra), [`invariants-of-affinoid-algebra`](#invariants-of-affinoid-algebra), [`rigid-quotient-invariant-cover`](#rigid-quotient-invariant-cover), [`quotient-diamond-comparison`](#quotient-diamond-comparison), `AdicSpacesPartII:R0`, `mathlib:T2Quotient`.

Sources: hj20, Theorem 5.3 (with the following paragraph on the auxiliary conditions), p. 28 (PDF p. 28); han16, Theorem 1.3, p. 2 (PDF p. 2).

#### `perfectoid-finite-quotient` — Finite quotients of analytically separated perfectoid spaces

*Theorem.* Let X be an analytically separated perfectoid space over a nonarchimedean field Spa(K, K⁺) with an action of a finite group G by automorphisms over Spa(K, K⁺), such that for every rank-one point x ∈ X the closure of {x} is contained in an open affinoid perfectoid subspace Spa(A, A⁺) ⊆ X, and distinct rank-one points of one G-orbit have distinct images in |X|^h (automatic for taut |X|, in particular for X quasicompact, as for limits of good towers). Then the categorical quotient X/G is a perfectoid space, covered by opens W_x/H_x of the affinoid perfectoids V_x/H_x = Spa(A^{H_x}, A^{+H_x}), and X^◇/G → (X/G)^◇ is an isomorphism. No hypothesis on |G| is needed. The source's proof cites Hansen's Theorem 1.4, whose hypotheses hold here because |G| is invertible in characteristic 0 and, in characteristic p, an action over Spa(K, K⁺) is linear over the completed perfection of K, a perfectoid field; the proof below uses instead the affinoid perfectoid quotient theorem, valid for every finite group and every action.

Hypotheses and scope: X analytically separated; closures of rank-one points contained in affinoid perfectoids; the G-action is over Spa(K, K⁺); orbits of rank-one points injective in |X|^h (not in the source's statement, needed by its proof).

Proof outline:
1. For a rank-one x with stabilizer H choose an affinoid perfectoid V ⊇ closure{x}; by analytic separation ∩_{h∈H} V h is affinoid perfectoid (intersection lemma), and it is H-stable.
2. V/H = Spa(A^H, A^{+H}) is affinoid perfectoid by the affinoid perfectoid quotient theorem, for any |H|.
3. The chart lemma gives G-stable opens W_x ×^{H_x} G with quotients W_x/H_x open in V_x/H_x; they cover X/G, which is therefore perfectoid.
4. Diamonds: the quotient-diamond comparison applied chartwise.

Acceptance: Good towers (Proposition 5.13(2)) and minimally compactified Hodge-type towers satisfy the hypotheses. An affinoid perfectoid X recovers the affinoid perfectoid quotient theorem.

Prerequisites: [`finite-quotient-chart`](#finite-quotient-chart), [`analytically-separated-affinoid-intersections`](#analytically-separated-affinoid-intersections), [`affinoid-perfectoid-quotient`](#affinoid-perfectoid-quotient), [`quotient-diamond-comparison`](#quotient-diamond-comparison), [`analytically-separated`](#analytically-separated).

Sources: hj20, Theorem 5.8, p. 30 (PDF p. 30); cgj19, Proposition 2.1.3, p. 5 (PDF p. 5).

Planet: **Finite quotient of a perfectoid space**.

#### `perfectoid-quotient-map-is-weakly-affinoid` — The quotient map of an analytically separated perfectoid space is affinoid in the weak sense

*Lemma.* In the situation of the perfectoid finite-quotient theorem, every point y ∈ X/G has a neighbourhood basis of open affinoid perfectoid subsets Y ⊆ X/G whose preimages q^{-1}(Y) ⊆ X are affinoid perfectoid. Consequently X has a covering by G-stable affinoid perfectoid opens.

Proof outline:
1. y lies in some W_x/H_x ⊆ V_x/H_x. The opens Y ⊆ W_x/H_x that are rational subsets of V_x/H_x form a neighbourhood basis of y.
2. q^{-1}(Y) is a disjoint union of [G : H_x] translates of the preimage of Y in V_x, which is a rational subset of V_x, hence affinoid perfectoid; a finite disjoint union of affinoid perfectoids is affinoid perfectoid.
3. The preimages q^{-1}(Y) are G-stable, giving the a posteriori invariant affinoid cover.

Acceptance: For free actions q is finite étale and preimages of affinoids are affinoid.

Prerequisites: [`perfectoid-finite-quotient`](#perfectoid-finite-quotient), [`invariant-spectrum-homeomorphism`](#invariant-spectrum-homeomorphism).

Sources: hj20, Theorem 5.8, p. 30 (PDF p. 30).

#### `perfectoid-from-perfectoid-components` — A spatial diamond with perfectoid components and finitely many orbits on π₀ is perfectoid

*Lemma.* Let X be a spatial diamond with an action of a profinite group G (through \underline{G}) such that G acts on π₀X with finitely many orbits and every connected component of X is a perfectoid space. Then X is a perfectoid space.

Proof outline:
1. Fix a component X₀ with image s ∈ π₀X and x ∈ X₀ with an affinoid perfectoid neighbourhood U ⊆ X₀. Writing X₀ = lim c^{-1}(S) over clopen S ∋ s, U spreads out to a small open spatial subdiamond Ũ ⊆ X with Ũ ∩ X₀ = U (ECD Proposition 11.23(iii)).
2. Let K ≤ G be the open stabilizer of Ũ; for k ∈ K, Ũ ∩ X₀k = Uk is affinoid perfectoid.
3. With finitely many orbits, X₀K is an open spatial subdiamond, and Ũ ∩ X₀K is an open spatial subdiamond containing x. Its connected components are connected components of the affinoid perfectoids Uk, and a connected component of an affinoid perfectoid space is affinoid perfectoid (a cofiltered intersection of clopen affinoid perfectoid subsets, hence a cofiltered limit of affinoid perfectoids). By ECD Lemma 11.27, Ũ ∩ X₀K is affinoid perfectoid. (The source checks only that the Uk are affinoid perfectoid; see sourceIssues.)

Acceptance: X = \underline{G} × Spa(C, O_C) for a profinite group G acting on itself by translation: one orbit on π₀X = G, components Spa(C, O_C), and X is affinoid perfectoid (Spa of continuous functions G → C).

Prerequisites: `DiamondsAndVStacks:D5`, `DiamondsAndVStacks:D4`, `PerfectoidSpaces:P5/cofiltered-limits-of-affinoid-perfectoid-spaces`.

Sources: hj20, Lemma 5.1, p. 27 (PDF p. 27).

### Towers: finite maps, good towers and closed loci

#### `integral-extension-of-perfectoid-pair` — Integral extensions of perfectoid Huber pairs have affinoid perfectoid diamonds

*Lemma.* Let (R, R⁺) → (S, S⁺) be a map of Tate–Huber pairs with R a perfectoid Tate ring and R⁺ → S⁺ integral. Then the diamond Spd(S, S⁺) is an affinoid perfectoid space: with ϖ a pseudouniformizer of R⁺, S⁺_perfd the universal integral perfectoid S⁺-algebra, T = ((S⁺_perfd)^∧_ϖ)[1/ϖ] (the ϖ-adic completion is needed: in characteristic p the perfectoidization is the uncompleted perfection) and T⁺ the integral closure of (S⁺_perfd)^∧_ϖ in T, (S, S⁺) → (T, T⁺) induces Hom((T, T⁺), (A, A⁺)) = Hom((S, S⁺), (A, A⁺)) for every perfectoid Tate–Huber pair (A, A⁺), so Spd(S, S⁺) ≅ Spa(T, T⁺).

Hypotheses and scope: Uses the perfectoidization of integral algebras over perfectoid rings (Bhatt–Scholze Theorem 1.17(1) = Theorem 10.11 in the published numbering; cited by the source as Theorem 1.16(1) of the 2019 preprint), which no atlas layer owns: recorded as a gap.

Proof outline:
1. S⁺ is integral over the integral perfectoid ring R⁺, so S⁺_perfd exists and is discrete and perfectoid with the universal property for maps to integral perfectoid rings.
2. T is a perfectoid Tate ring and T⁺ is open and integrally closed.
3. A map (S, S⁺) → (A, A⁺) to a perfectoid pair maps S⁺ into A⁺, an integral perfectoid ring, so factors uniquely through S⁺_perfd, and then through its ϖ-adic completion because A⁺ is ϖ-adically complete, hence through (T, T⁺); so the two pairs have the same maps to perfectoid pairs, i.e. the same Spd. (The source writes T = S⁺_perfd[1/ϖ]; see sourceIssues.)

Acceptance: S = R: T = R. S = R/I for an ideal: this recovers Q4's closed perfectoid quotient.

Prerequisites: `PerfectoidQuotients:Q0:integral-algebra/semiperfectoid-quasisyntomic-and-qrsp-rings`, `DiamondsAndVStacks:D6`.

Sources: hj20, Lemma 5.10, p. 32 (PDF p. 32); bs22, Theorem 1.17, p. 9 (PDF p. 9).

#### `finite-tower-over-perfectoid-tower` — A tower finite over a perfectoid tower is perfectoid

*Lemma.* Let (X_i)_{i∈I} → (Y_i)_{i∈I} be a morphism of cofiltered inverse systems of locally noetherian adic spaces in which the maps f_i and all transition maps are finite, and suppose Y_∞ = lim_i Y_i^◇ is perfectoid. Then X_∞ = lim_i X_i^◇ is perfectoid and f_∞: X_∞ → Y_∞ is quasicompact. If U ⊆ Y_∞ is an open affinoid perfectoid that is the preimage of an open affinoid U_i ⊆ Y_i, then f_∞^{-1}(U) is affinoid perfectoid; and f_∞ is affinoid in the weak sense.

Proof outline:
1. Assume an initial index 0; X_∞ ≅ lim_i X_i ×_{Y_i} Y_∞ by cofinality of the diagonal.
2. For an affinoid U₀ ⊆ Y₀ with preimages U_i, W_i, U_∞, W_∞ and an affinoid perfectoid V = Spa(R, R⁺) ⊆ U_∞: W_i ×_{U_i} V = Spd(S, S⁺) with S = R ⊗_{O(U_i)} O(W_i) and S⁺ the integral closure of the image of R⁺ ⊗ O⁺(W_i); R⁺ → S⁺ is integral since O⁺(U_i) → O⁺(W_i) is.
3. By the integral-extension lemma W_i ×_{U_i} V is affinoid perfectoid; passing to the limit over i (cofiltered limits of affinoid perfectoids are affinoid perfectoid) W_∞ ×_{U_∞} V is affinoid perfectoid; varying U₀, V, X_∞ is perfectoid.
4. The claims on f_∞^{-1}(U) follow the same way; weak affinoidness from the affinoid-basis lemma.

Acceptance: Hodge-type minimal compactifications finite over Siegel ones (Proposition 5.14).

Prerequisites: [`integral-extension-of-perfectoid-pair`](#integral-extension-of-perfectoid-pair), [`finite-level-affinoid-basis`](#finite-level-affinoid-basis), `PerfectoidSpaces:P5/cofiltered-limits-of-affinoid-perfectoid-spaces`, `AdicSpacesPartII:R0`.

Sources: hj20, Lemma 5.9 (with the remark after it), p. 31 (PDF p. 31).

#### `finite-level-affinoid-basis` — Affinoid perfectoids pulled back from finite level form a basis

*Lemma.* Let (X_i)_{i∈I} be a cofiltered inverse system of locally noetherian adic spaces with finite transition maps such that X = lim_i X_i^◇ is a perfectoid space. Then X has a neighbourhood basis of open affinoid perfectoid subsets W that are preimages of open affinoids W_i ⊆ X_i at variable finite levels i.

Proof outline:
1. Assume an initial index 0 and reduce to X₀ affinoid; then all X_i = Spa(B_i, B_i⁺) are affinoid (finite transition maps) and X ≅ Spd(B, B⁺) for the completed direct limit.
2. The rational subsets of X contained in some open affinoid perfectoid are affinoid perfectoid and form a basis.
3. Every rational subset of X is the preimage of a rational subset of some X_i (approximation of the defining functions by elements of lim→ B_i).

Acceptance: The perfectoid disc lim Spa(K⟨T^{1/p^n}⟩): rational subsets defined over some finite level.

Prerequisites: `PerfectoidSpaces:P5/cofiltered-limits-of-affinoid-perfectoid-spaces`, `PerfectoidSpaces:P7`, `tauceti:TauCeti.ValuationSpectrum.rationalSubset`.

Sources: hj20, Lemma 5.11, p. 32 (PDF p. 32).

#### `good-tower` — Good towers

*Definition.* Fix a nonarchimedean field K. A good tower is a cofiltered inverse system (X_i)_{i∈I} of locally noetherian adic spaces over Spa K such that (1) each X_i is the analytification of a projective variety over K and the transition maps are finite; (2) X = lim_i X_i^◇ is a perfectoid space; (3) there are two coverings of X by open affinoid perfectoid subsets U_j, V_j with the closure of U_j contained in V_j for all j, and U_j, V_j the preimages of open affinoids U_{j,i_j}, V_{j,i_j} ⊆ X_{i_j} for some i_j ∈ I.

Hypotheses and scope: Condition (3) is what makes the limit satisfy the closure hypothesis of the quotient theorem; it is not known to pass to the finite-level quotients X_i/G.

API:
- `PerfectoidSpace.GoodTower` (data): A structure on an inverse system (X_i) of rigid spaces over K: projective analytifications, finite transitions, perfectoid limit, and paired finite-level affinoid covers with closures.
- `PerfectoidSpace.GoodTower.limit` (projection): The perfectoid space X = lim X_i^◇.
- `PerfectoidSpace.GoodTower.isAnalyticallySeparated` (characterisation): The limit is analytically separated.
- `PerfectoidSpace.GoodTower.closure_rankOne_subset_affinoid` (characterisation): Every rank-one point has closure inside an open affinoid perfectoid (namely some V_j).
- `PerfectoidSpace.GoodTower.ofFinite` (functoriality): A tower with finite maps to a good tower is good.
- `PerfectoidSpace.GoodTower.reindex` (functoriality): Restricting to a cofinal subsystem gives a good tower with the same limit.

Unit tests:
- `goodTower_const_point` (degenerate): For K perfectoid, the constant tower X_i = Spa(K) is good, with U = V = Spa(K); the constant tower X_i = ℙ¹_K is not, because ℙ¹_K is not perfectoid, so condition (2) is not automatic.
- `goodTower_frobenius_P1` (computation): The tower ℙ¹_{ℂ_p} ← ℙ¹ ← ⋯ with transition maps T ↦ T^p is a good tower with limit the perfectoid projective line; the standard discs {|T| ≤ 1}, {|T| ≥ 1} and their slight enlargements give (3).
- `goodTower_isAnalyticallySeparated` (compatibility): The limit of a good tower is analytically separated, by the projective-tower lemma.
- `not_goodTower_affine_line` (non-example): The tower of affine lines 𝔸¹ ← 𝔸¹ ← ⋯ with T ↦ T^p satisfies (2) and (3), with U_n = {|T| ≤ |p|^{−n}} and V_n = {|T| ≤ |p|^{−n−1}} pulled back from level 0, but it is not good, because the X_i are not projective: condition (1) is a genuine restriction.

Uses: Hansen–Johansson, Proposition 5.13: good towers are stable under finite maps and have perfectoid finite quotients; Hansen–Johansson, Proposition 5.14 and Corollary 5.15: minimally compactified Hodge-type towers are good towers; Hansen–Johansson, Proposition 5.19: towers for adjoint groups are compared through good towers and a finite group Δ; PerfectoidShimuraVarieties:S2 and S4: the Hodge-type and pre-abelian representability arguments.

Acceptance: The tower of minimally compactified Siegel modular varieties over a cofinal system of levels at p (Proposition 5.14).

Prerequisites: [`analytically-separated`](#analytically-separated), [`finite-level-affinoid-basis`](#finite-level-affinoid-basis), `PerfectoidSpaces:P7`, `AdicSpacesPartII:R1`.

Sources: hj20, Definition 5.12, p. 32 (PDF p. 32).

Planet: **Good tower**.

#### `good-towers-under-finite-maps` — Towers finite over good towers are good

*Lemma.* Let (Y_i)_{i∈I} be a good tower and (X_i)_{i∈I} → (Y_i)_{i∈I} a map of cofiltered inverse systems with every f_i finite (and finite transition maps). Then (X_i) is a good tower.

Proof outline:
1. X_i → Y_i finite with Y_i projective: X_i is the analytification of a projective variety by rigid GAGA; condition (1).
2. Conditions (2) and (3) from the finite-tower lemma: f^{-1}(U_j), f^{-1}(V_j) are affinoid perfectoid and pulled back from finite level, and closure(f^{-1}U_j) ⊆ f^{-1}(closure U_j) ⊆ f^{-1}V_j.

Acceptance: Hodge-type towers finite over Siegel towers; towers with smaller tame level.

Prerequisites: [`good-tower`](#good-tower), [`finite-tower-over-perfectoid-tower`](#finite-tower-over-perfectoid-tower), `AdicSpacesPartII:R1`.

Sources: hj20, Proposition 5.13 (with the note after it), p. 33 (PDF p. 33).

#### `quotient-of-good-tower` — Finite quotients of good towers

*Theorem.* Let (X_i)_{i∈I} be a good tower with an action of a finite group G (compatible actions on the X_i). Then the categorical quotient X/G of X = lim X_i^◇ is a perfectoid space, and X/G ≅ lim_i X_i/G as diamonds, where X_i/G are the rigid quotients.

Hypotheses and scope: (X_i/G) need not be a good tower.

Proof outline:
1. X is analytically separated (projective-tower lemma), quasicompact (finitely many U_j suffice since the finite-level spaces are quasicompact), hence taut, and every rank-one x lies in some U_j with closure in V_j, so the perfectoid finite-quotient theorem applies: X/G is perfectoid. Each X_i/G is rigid by the rigid quotient theorem (X_i is projective, hence quasicompact and taut).
2. X/G → lim X_i/G is a map of spatial diamonds, hence qcqs, so it is an isomorphism if it is bijective on (C, C⁺)-points (ECD Lemma 11.11); these are computed naively: (X/G)(C, C⁺) = X(C, C⁺)/G because pro-étale covers of geometric points split.
3. Surjectivity: for a compatible system x_i ∈ X_i(C, C⁺)/G the preimages W_i ⊆ X(C, C⁺) are nonempty profinite sets (finite transition maps), and lim W_i ≠ ∅.
4. Injectivity: if x, y map to the same point, the sets G_i = {g : g x_i = y_i} are nonempty with injective transitions G_j → G_i, so lim G_i ≠ ∅ and some g has gx = y.

Acceptance: Proposition 5.19: the adjoint tower modulo Δ is recovered as lim of finite-level quotients.

Prerequisites: [`good-tower`](#good-tower), [`perfectoid-finite-quotient`](#perfectoid-finite-quotient), [`rigid-finite-quotient`](#rigid-finite-quotient), [`projective-tower-limit-is-analytically-separated`](#projective-tower-limit-is-analytically-separated), [`quotient-diamond-comparison`](#quotient-diamond-comparison), `DiamondsAndVStacks:D5`.

Sources: hj20, Proposition 5.13 (with the note after it), p. 33 (PDF p. 33).

#### `closed-loci-in-towers` — Zariski-closed loci of perfectoid towers and their tilde-limit comparison

*Theorem.* Let (Y_i)_{i∈I} be a cofiltered inverse system of analytifications of quasi-projective varieties over a nonarchimedean field K with finite transition maps and perfectoid limit Y = lim_i Y_i^◇, Y ~ lim Y_i; let X_i ⊆ Y_i be compatible closed subvarieties (X_j ⊆ X_i ×_{Y_i} Y_j for j ≥ i). Then X = lim_i X_i^◇ is a perfectoid space, X → Y is a Zariski-closed embedding, and X ~ lim X_i. Explicitly, for an open affinoid perfectoid V = Spa(R, R⁺) ⊆ Y pulled back from finite level, X ∩ V = Spa(S, S⁺) is strongly Zariski closed: R → S is surjective, S⁺ is the integral closure of the image of R⁺, R⁺ → S⁺ is almost surjective (for the ideal (ϖ^{1/p^∞})R⁺, ϖ a pseudouniformizer of R with compatible p-power roots), and the image of lim→ O(X_i ∩ V_i) is dense in S. This is a perfectoidization of the closed locus, not the statement that the algebraic quotient R/I is complete and perfectoid.

Hypotheses and scope: The closed immersions are algebraic (from quasi-projective varieties); Q4 supplies Zariski closed ⇒ strongly Zariski closed.

Proof outline:
1. For each i, X_i ×_{Y_i} V ⊆ V is Zariski closed (closed-subvariety lemma), cut out by an ideal I_i ⊆ R increasing in i.
2. X ∩ V = lim_i (X_i ×_{Y_i} V) is the Zariski-closed subset cut out by ∑ I_i (limit lemma), strongly Zariski closed by ECD 5.8 (Q4): R → S surjective, S⁺ the integral closure, R⁺ → S⁺ almost surjective. Varying V, X is perfectoid and X → Y is a Zariski-closed embedding.
3. Tilde-limit: |X| = lim |X_i| because |X| = |Y| ×_{lim|Y_i|} lim |X_i| (closed subsets, lim commutes with fibre products); the residue-field density follows from surjectivity of R → S and density of lim→ O(V_i) in R.
4. Density of lim→ O(X_i ∩ V_i) in S: its image contains the image of lim→ O(V_i) under the surjection R → S, and lim→ O(V_i) is dense in R for the tilde-limit V ~ lim V_i of affinoids. (Scholze's proof of torsion Theorem IV.1.1 uses these steps for the Hodge-type embedding into the Siegel tower, where the integral statement R_∞⁺ = (lim→ R_{K_p}⁺)^∧ is proved from the Siegel case.)

Acceptance: Compatible-root closed locus: over K ∋ μ_{p^∞}, take Y_n = 𝔾_m^an with transition maps T ↦ T^p and V = {|T| = 1} pulled back from level 0, so that the limit over V is the perfectoid torus Spa(K⟨T^{±1/p^∞}⟩). The compatible closed subvarieties X_n = {T_n = 1} (T_n the coordinate at level n) give the Zariski-closed point cut out by (T^{1/p^n} − 1)_n, with R → S = K surjective. The single equation T = 1 instead cuts out the profinite set of points T^{1/p^n} = ζ_{p^n}^a (a ∈ ℤ_p), whose ring of functions C(ℤ_p, K) is again a quotient of R, as ECD 5.8 asserts against Scholze's Remark II.2.4. The Hodge-type tower inside the perfectoid Siegel tower (PerfectoidShimuraVarieties:S2) is the downstream application.

Prerequisites: [`closed-subvariety-pullback-is-zariski-closed`](#closed-subvariety-pullback-is-zariski-closed), [`limit-of-zariski-closed-embeddings`](#limit-of-zariski-closed-embeddings), [`zariski-closed-embedding`](#zariski-closed-embedding), `PerfectoidQuotients:Q4/zariski-closed-subsets-are-strongly-zariski-closed`, `PerfectoidSpaces:P7/tilde-limits-and-etale-topos-comparison`, `PerfectoidSpaces:P7`, `ClassicalAdicEtaleCohomology:H0`.

Sources: sch15, Theorem IV.1.1, p. 67 (PDF p. 67); ecd, Theorem 5.8, p. 25 (PDF p. 25); hj20, Lemma 5.7, p. 30 (PDF p. 30).

Planet: **Zariski-closed loci in perfectoid towers**.

## P9 Continuous torsor descent with coefficients

**Objects.** Pro-étale Galois towers X_∞ ~ lim X_j → X with perfectoid limit and their Čech descent data; the twisted
character sheaves ω_c of a tower, a coefficient algebra and a 1-cocycle.

**Theorems.** Over a smooth rigid base over a discretely valued field with perfect residue field, O⁺_X(U) = O⁺(U_∞)^G and O_X(U) = O(U_∞)^G, as actual equalizers, obtained from étale
sheaves at finite level, Scholze's almost vanishing on affinoid perfectoids and ν_*Ô_X = O_X; over a perfectoid base the same
from v-descent; positive-degree comparisons are only almost. Invariants commute with completed tensor products with trivial
coefficients (profinite flat modules; Banach spaces of countable type), which extends descent to products with a smooth
weight space, integrally and rationally, on products of affinoids. Finite locally free modules descend fully faithfully but not essentially
surjectively. Galois descent of modules along finite étale Galois ring extensions. Character sheaves: units at infinite
level are finite-level units up to units close to 1; if the cocycle is a coboundary times a finite-level cocycle, the
character sheaf is identified with finite-level twisted invariants and is locally free of rank one; the integral sheaf is
free where the cocycle is an integral coboundary. Coefficient change: exact for a regular element over affinoids; derived,
with Tor terms, in general. Coefficient sheaves from profinite modules with continuous action, and vanishing of higher
inverse limits under the stated hypotheses.

**Dependencies.** Inside the roadmap: P0 (almost modules), P3, P5, P7, P8 (free quotients as finite étale torsors). Other
roadmaps: AdicEtaleGeometry A1 (the corrected pro-étale site, as decomposed) and A0; PadicHodgeTheory P8:local-rational
(Scholze's Lemmas 3.18, 4.2, 4.10, Corollaries 6.6 and 6.19, as decomposed); AdicSpacesPartII R3 and R5 (Kiehl for
coefficient sheaves, mixed completed tensor products, sousperfectoid products); DiamondsAndVStacks D2–D3. Kedlaya–Liu II
8.2.3 (seminormal bases) and t-orthogonal bases over non-discretely valued fields are gaps.

**Acceptance tests.** The trivial torsor; a finite étale torsor (a free finite quotient from P8); the ℤ_p(1)-tower on the
torus, with O(X_∞)^G = O(X) and the finite-order character sheaf T^{k/pⁿ}·O_X; the Tate twist over the cyclotomic tower, whose
twisted invariants vanish (so degree-zero descent does not classify modules); an explicit module where invariants do not
commute with p-adic completion; reduction modulo an ideal with a nonzero Tor term, on the Tate curve with the family of
degree-zero line bundles over ℚ_p⟨T⟩, where H⁰ of the reduction is Tor₁(H¹, A/T) = ℚ_p while H⁰/T = 0.

### Towers and their Čech data

#### `profinite-galois-tower` — Pro-étale Galois towers with perfectoid limit

*Definition.* Let X be either a locally noetherian adic space over Spa(ℚ_p, ℤ_p) (a rigid space over a complete discretely valued field in the source range) or a perfectoid space, and G a profinite group with a cofinal decreasing sequence of open normal subgroups G_j. A pro-étale G-tower over X is an inverse system (X_j)_j of finite étale G/G_j-Galois covers X_j → X, with compatible right actions, together with a perfectoid space X_∞ with a right G-action and compatible maps X_∞ → X_j such that X_∞ ~ lim_j X_j (tilde-limit; for X perfectoid the X_j are perfectoid and X_∞ = lim_j X_j). Viewed in X_proet (Scholze's pro-étale site for locally noetherian X, the pro-étale site of ECD for perfectoid X), X_∞ = lim_j X_j is a pro-étale G-torsor: X_∞ ×_X X_∞ ≅ X_∞ × \underline{G} via (x, g) ↦ (x, xg). For U ∈ X_proet (in particular U ⊆ X open), U_∞ := U ×_X X_∞ is a pro-étale G-tower over U, affinoid perfectoid when U is affinoid and X_∞ is affinoid perfectoid over it.

Hypotheses and scope: The 'prescribed tower type' of the stage: finite étale Galois finite levels, perfectoid limit, profinite group of the form lim G/G_j. Continuity of the action on functions is part of the data.

Proof outline:
1. The torsor isomorphism is computed levelwise: X_j ×_X X_j ≅ X_j × G/G_j for Galois covers, and passes to the limit.
2. Base change along U → X preserves each finite étale Galois level and the tilde-limit (P7 base change of tilde-limits).

API:
- `ProetaleGaloisTower` (data): The structure (G, G_j, X_j → X, X_∞, X_∞ ~ lim X_j, compatible right actions).
- `ProetaleGaloisTower.level` (projection): The finite-level map q_j: X_∞ → X_j, equivariant for G → G/G_j.
- `ProetaleGaloisTower.torsorIso` (characterisation): X_∞ ×_X X_∞ ≅ X_∞ × \underline{G}, (x, g) ↦ (x, xg).
- `ProetaleGaloisTower.restrict` (functoriality): For U → X in X_proet, the pulled-back tower U_∞ → U; compatible with composition.
- `ProetaleGaloisTower.subgroup` (functoriality): For H ≤ G open, X_∞ → X_H := X_∞/H is a pro-étale H-tower.
- `ProetaleGaloisTower.functionAction` (structure): The continuous left action of G on O_{X_∞}(U_∞) and O⁺_{X_∞}(U_∞) by pullback, γ ↦ γ^*.

Unit tests:
- `tower_trivial` (degenerate): For G = {1} and X perfectoid, X_∞ = X, and invariants are the identity.
- `tower_finite_etale` (computation): For G finite acting freely on a perfectoid Y with Y → X = Y/G finite étale (P8), the constant tower X_j = Y is a pro-étale G-tower and O(Y)^G = O(X).
- `tower_Zp_torus` (computation): Over K = ℂ_p, the torus X = Spa(K⟨T^{±1}⟩) with X_n = Spa(K⟨T^{±1/pⁿ}⟩) and G = ℤ_p(1) acting by T^{1/pⁿ} ↦ ζ_{pⁿ}^γ T^{1/pⁿ} is a pro-étale ℤ_p-tower with X_∞ the perfectoid torus, and O(X_∞)^G = O(X).
- `tower_torsorIso_compat` (compatibility): The torsor isomorphism agrees with Mathlib's/Tau Ceti's continuous cochain description: O⁺(U_∞ × \underline{G}) = C(G, O⁺(U_∞)) and the two maps are f ↦ (γ ↦ f) and f ↦ (γ ↦ γ^*f).
- `tower_not_cofinal` (non-example): A descending family of levels X_j that is not cofinal in G (e.g. G_j constant after some j while G is infinite) gives no pro-étale G-torsor: X_∞ ×_X X_∞ is not X_∞ × \underline{G}.

Uses: CHJ, Lemmas 2.24–2.26 and Theorem 2.28: the forgetful maps from the perfectoid Shimura curve at infinite level to finite level; BHW, Lemma 3.7 and Proposition 3.8: the Γ₀(pⁿ)-torsors of the anticanonical tower, extended by a weight space; HodgeTateAndCanonicalSubgroups:T5: the Igusa towers and their comparison with the full p-level tower; OverconvergentAutomorphicForms:O1: the torsor from which equivariant coefficient sheaves are built.

Acceptance: Trivial torsor: X perfectoid, G profinite, X_∞ = X × \underline{G}. The anticanonical tower over the ε-overconvergent locus of a modular or Shimura curve with G = Γ₀(p) (CHJ, BHW).

Prerequisites: `AdicEtaleGeometry:A1/pro-etale-site-corrected`, `PerfectoidSpaces:P7`, `PerfectoidSpaces:P3/strongly-etale-morphisms-and-base-change`, `DiamondsAndVStacks:D2`, `DiamondsAndVStacks:D3`, `mathlib:ProfiniteGrp`, `mathlib:OpenNormalSubgroup`.

Sources: chj17, unnumbered setup paragraph of §4.1 ('A handy lemma'), p. 28 (PDF p. 28); chj17, Lemma 2.24, p. 20 (PDF p. 20); bhw21, Lemma 3.7, p. 10 (PDF p. 10); ecd, Definition 10.12, p. 53 (PDF p. 53).

Planet: **Pro-étale Galois tower**.

#### `cech-descent-datum` — The Čech descent datum of a pro-étale Galois tower

*Construction.* For a pro-étale G-tower X_∞ → X and U ∈ X_proet with U_∞ affinoid perfectoid, the Čech nerve of U_∞ → U is identified with U_∞ × \underline{G}^n (n ≥ 0), and for F ∈ {Ô⁺_X, Ô_X}: F(U_∞ × \underline{G}^n) = C(G^n, F(U_∞)) (continuous maps, F(U_∞) with its p-adic topology). The descent datum is the continuous G-action on F(U_∞), and the Čech complex of U_∞ → U with coefficients in F is the continuous cochain complex C^•_cts(G, F(U_∞)). In degree 0 the equalizer of the two maps F(U_∞) ⇉ F(U_∞ × \underline{G}) is F(U_∞)^G.

Hypotheses and scope: F among the completed structure sheaves; for a profinite set S and affinoid perfectoid V, F(V × S) = Hom_cts(S, F(V)).

Proof outline:
1. The Čech nerve: U_∞ ×_U ⋯ ×_U U_∞ ≅ U_∞ × \underline{G}^n by the torsor isomorphism, iterated.
2. F(V × S) = Hom_cts(S, F(V)) for V affinoid perfectoid and S profinite (Scholze 2013, Corollary 6.6, as decomposed in PadicHodgeTheory P8).
3. Under these identifications the face maps are the standard ones of continuous cochains; the equalizer in degree 0 is {f : γ^*f = f for all γ}.

API:
- `ProetaleGaloisTower.cechNerveIso` (characterisation): The n-th term of the Čech nerve of U_∞ → U is U_∞ × \underline{G}^n.
- `ProetaleGaloisTower.sections_prod_profinite` (simp): F(U_∞ × \underline{G}^n) = C(G^n, F(U_∞)) for F = Ô⁺, Ô.
- `ProetaleGaloisTower.cechComplexIso` (equivalence): The Čech complex of U_∞ → U with coefficients F is the continuous cochain complex C^•_cts(G, F(U_∞)).
- `ProetaleGaloisTower.equalizer_eq_invariants` (characterisation): The degree-zero equalizer is F(U_∞)^G.
- `ProetaleGaloisTower.cechComplex_map` (functoriality): Natural in U ∈ X_proet and in maps of towers.

Unit tests:
- `cech_trivial_group` (degenerate): For G trivial, the Čech complex is F(U) in degree 0.
- `cech_finite_group` (computation): For G = Z/2 and U_∞ = U ⊔ U, C^0 = F(U)², and the equalizer is the diagonal F(U).
- `cech_equalizer_eq_contInvariants` (compatibility): The degree-zero cohomology is Mathlib's continuousCohomology H⁰(G, F(U_∞)), identified with invariants by ContinuousCohomology.zeroIso.
- `cech_not_discrete` (non-example): Treating F(U_∞ × \underline{G}) as the product ∏_{γ∈G} F(U_∞) instead of continuous maps gives the wrong degree-one term for infinite G: a family (f_γ)_{γ∈G} that is not continuous in γ is not a section.

Uses: CHJ, Remark 2.25 and Lemma 6.11: computing pro-étale cohomology of U by continuous group cohomology of the tower; BHW, Lemma 3.7: degree-zero descent of O⁺ along the torsor; OverconvergentAutomorphicForms:O1: equalizers of twisted descent data give the equivariant sheaves.

Acceptance: For G finite the complex is the usual Čech complex of the finite Galois cover.

Prerequisites: [`profinite-galois-tower`](#profinite-galois-tower), `PadicHodgeTheory:P8:local-rational/period-sheaves-on-affinoid-perfectoids`, `PadicHodgeTheory:P8:local-rational/proetale-structure-sheaves-and-valuations`, `mathlib:continuousCohomology`, `tauceti:TauCeti.ContinuousCohomology.zeroIsoNatIso`.

Sources: bhw21, Lemma 3.7, p. 10 (PDF p. 10); chj17, Remark 2.25, p. 20 (PDF p. 20).

#### `invariants-of-eventually-injective-colimits` — Invariants commute with the filtered colimits of a Galois tower

*Lemma.* Let G be a profinite group and (M_i)_{i∈I} a filtered system of G-modules (or G-sets) such that G acts on each M_i through a finite quotient G/G_{j(i)}. Then colim_i (M_i^G) → (colim_i M_i)^G is an isomorphism. For an arbitrary group G the same holds if the transition maps are eventually injective.

Hypotheses and scope: The finite-quotient hypothesis holds for the systems F(U_i ×_Y Y_j) of a Galois tower; the source instead uses eventual injectivity, which is not needed in that case.

Proof outline:
1. Invariants under a finite group are a finite limit, and filtered colimits of sets or modules commute with finite limits; for M_i with G acting through G/G_{j(i)}, (M_i)^G = (M_i)^{G/G_{j(i)}}, and an invariant element of the colimit, represented by m ∈ M_i, satisfies γm = m in the colimit for the finitely many classes γ ∈ G/G_{j(i)}, hence at a common subsequent stage, where its image is G-invariant.
2. Eventually injective case: γm = m holds at the stage past the injectivity threshold for every γ at once.

Acceptance: The systems (O⁺/p^m)(U_i ×_Y Y_j) of the étale-sheaf lemma, with G acting through G/G_j. For the constant system M_i = M the statement is M^G = M^G.

Prerequisites: `mathlib:CategoryTheory.Limits.filtered_colim_preservesFiniteLimits`, `mathlib:FixedPoints.subring`.

Sources: chj17, Lemma 2.24, p. 20 (PDF p. 20).

#### `etale-sheaf-sections-over-galois-tower` — Sections of étale sheaves over a Galois tower are the invariants

*Lemma.* Let Y be a rigid analytic variety, Y_∞ ∈ Y_proet a Galois G-cover (G profinite), U ∈ Y_proet quasicompact and quasi-separated and U_∞ = U ×_Y Y_∞. For every sheaf F on Y_proet pulled back from Y_et, F(U) = F(U_∞)^G.

Proof outline:
1. Choose presentations Y_∞ = lim_j Y_j (Galois G/G_j-covers) and U = lim_i U_i; then U_∞ = lim_{i,j} U_i ×_Y Y_j and U_∞ is qcqs.
2. F(U_∞) = colim_{i,j} F(U_i ×_Y Y_j) and F(U) = colim_i F(U_i) for sheaves pulled back from the étale site (Scholze 2013, Lemma 3.16, via A1).
3. F(U_i ×_Y Y_j)^G = F(U_i), since U_i ×_Y Y_j → U_i is a Galois G/G_j-cover and F is an étale sheaf.
4. G acts on F(U_i ×_Y Y_j) through G/G_j (and the transition maps are eventually injective, as U_{i′} ×_Y Y_{j′} → U_i ×_Y Y_j is an étale cover for large i′), so the colimit commutes with invariants.

Acceptance: F = O⁺/p^m: (O⁺/p^m)(U) = (O⁺/p^m)(U_∞)^G, the input to the descent of O⁺.

Prerequisites: [`invariants-of-eventually-injective-colimits`](#invariants-of-eventually-injective-colimits), [`profinite-galois-tower`](#profinite-galois-tower), `AdicEtaleGeometry:A1/pro-etale-site-corrected`.

Sources: chj17, Lemma 2.24, p. 20 (PDF p. 20).

### Descent of functions: actual equalizers and almost statements

#### `function-descent-along-tower` — Descent of O and O⁺ along a pro-étale Galois tower over a smooth rigid space

*Theorem.* Let X be a smooth rigid space over a complete discretely valued field k ⊇ ℚ_p with perfect residue field, and X_∞ → X a pro-étale G-tower. For every open (or qcqs étale) U ⊆ X with U_∞ = U ×_X X_∞: O⁺_X(U) = O⁺_{X_∞}(U_∞)^G and O_X(U) = O_{X_∞}(U_∞)^G. These are actual equalities of rings (the equalizer of the Čech datum in degree 0), obtained through almost statements at each finite level.

Hypotheses and scope: Smoothness over a discretely valued field with perfect residue field enters through Scholze's comparison ν_*Ô_X = O_{X_et} (Corollary 6.19, proved in that setting); for seminormal X, or over a non-discretely valued field, Kedlaya–Liu's Theorem 8.2.3 would replace it (recorded as a gap: no atlas layer owns it).

Proof outline:
1. Reduce to U affinoid (affinoids form a basis and both sides are sheaves), so that U_∞ is affinoid perfectoid.
2. U_∞ → U is a perfectoid Galois G-object of X_proet; by the étale-sheaf lemma, (O⁺/p^m)(U) = (O⁺/p^m)(U_∞)^G for all m.
3. Taking inverse limits (which commute with invariants), Ô⁺(U) = Ô⁺(U_∞)^G, and Ô⁺(U_∞) = O⁺_{X_∞}(U_∞) as U_∞ is affinoid perfectoid (Scholze 2013, Lemma 4.10).
4. Ô(U) = O(U) by Corollary 6.19 (ν_*Ô_X = O_{X_et} for smooth X); then Ô⁺(U) = O⁺(U) by Lemma 4.2(ii),(v) (O⁺ is the subring of elements with |f(x)| ≤ 1 everywhere, in both).
5. Inverting p gives the rational statement.

Acceptance: CHJ Lemma 2.26: O⁺_{X_{K_p}}(U) = O⁺_{X_∞}(U_∞)^{K_p} for Shimura curves over ℚ_p.

Prerequisites: [`etale-sheaf-sections-over-galois-tower`](#etale-sheaf-sections-over-galois-tower), [`cech-descent-datum`](#cech-descent-datum), `PadicHodgeTheory:P8:local-rational/completed-structure-sheaf-on-affinoid-perfectoids`, `PadicHodgeTheory:P8:local-rational/proetale-structure-sheaves-and-valuations`, `PadicHodgeTheory:P8:local-rational/cohomology-of-graded-structural-de-rham-sheaf`.

Sources: chj17, Lemma 2.26, p. 20 (PDF p. 20); bhw21, Lemma 3.7, p. 10 (PDF p. 10).

Planet: **Descent of functions along a perfectoid tower**.

#### `function-descent-over-perfectoid-base` — Descent of O and O⁺ along an affinoid perfectoid torsor over a perfectoid base

*Lemma.* Let Y be an affinoid perfectoid space and X → Y an affinoid perfectoid pro-étale \underline{Γ}-torsor, Γ profinite. Then O⁺_X(X)^Γ = O⁺_Y(Y) and O_X(X)^Γ = O_Y(Y).

Proof outline:
1. O and O⁺ are sheaves on the pro-étale (indeed v-) site of perfectoid spaces (ECD 8.7–8.8, DiamondsAndVStacks D2).
2. The Čech datum of X → Y is X × \underline{Γ}^n, with sections C(Γ^n, O⁺(X)); the sheaf condition in degree 0 is O⁺(Y) = O⁺(X)^Γ.

Acceptance: Y × \underline{Γ} → Y: C(Γ, O⁺(Y))^Γ = O⁺(Y), the constant functions.

Prerequisites: [`cech-descent-datum`](#cech-descent-datum), `DiamondsAndVStacks:D2`, `DiamondsAndVStacks:D3`.

Sources: bhw21, Lemma 3.7, p. 10 (PDF p. 10).

#### `almost-cohomology-of-tower` — Continuous group cohomology of the tower computes pro-étale cohomology almost

*Lemma.* Let U be affinoid in X and U_∞ → U an affinoid perfectoid pro-étale G-tower. For all m and q ≥ 0, H^q(U_proet, O⁺_X/p^m) is almost isomorphic to H^q_cts(G, (O⁺/p^m)(U_∞)), and H^q(U_proet, Ô⁺_X)^a ≅ lim_m H^q_cts(G, O⁺(U_∞)/p^m)^a. In degree 0 the comparison is an equality (function descent); in positive degrees only an almost isomorphism holds in general.

Hypotheses and scope: Almost mathematics over O_C with the ideal of topologically nilpotent elements; U_∞ affinoid perfectoid.

Proof outline:
1. The Čech-to-derived (Cartan–Leray) spectral sequence E₂^{pq} = H^p_cts(G, H^q(U_∞, O⁺/p^m)) ⇒ H^{p+q}(U, O⁺/p^m).
2. H^q(U_∞, O⁺/p^m) is almost zero for q ≥ 1 because U_∞ is affinoid perfectoid (Scholze 2013, Lemma 4.10).
3. So the spectral sequence almost degenerates; the inverse system in m has almost vanishing lim¹ on the basis of towers (Lemma 3.18, almost version).

Acceptance: For U étale over the torus with its toric tower, CHJ Lemma 6.11(1): H^i_cts(ℤ_p^n, O⁺_X(U)) → H^i(U_proét, Ô⁺_X) is injective with cokernel killed by p, and both sides are nonzero for 1 ≤ i ≤ n: in positive degrees there is no equality, only a comparison up to bounded torsion and almost zero modules.

Prerequisites: [`cech-descent-datum`](#cech-descent-datum), `PadicHodgeTheory:P8:local-rational/completed-structure-sheaf-on-affinoid-perfectoids`, `mathlib:continuousCohomology`, `PerfectoidSpaces:P0/almost-modules-over-perfectoid-base`.

Sources: chj17, Remark 2.25, p. 20 (PDF p. 20); chj17, Lemma 6.11 with proof, pp. 48–49 (PDF pp. 48–49).

#### `closed-invariant-subalgebra` — Invariants of a uniform Banach algebra under a profinite group

*Lemma.* Let A_∞ be a uniform ℚ_p-Banach algebra with an action of a profinite group G by continuous ring automorphisms, and A = A_∞^G. Then A is a closed subalgebra of A_∞, hence a uniform ℚ_p-Banach algebra with the induced norm, and A° = (A_∞°)^G.

Proof outline:
1. A is an intersection of kernels of the continuous maps γ − id, hence closed.
2. The induced norm is power-multiplicative on A, and a ∈ A is power-bounded in A iff in A_∞.

Acceptance: A_∞ = O(U_∞), A = O(U) in the function-descent theorem.

Prerequisites: [`invariant-huber-pair`](#invariant-huber-pair), `mathlib:FixedPoints.subring`.

Sources: chj17, Proposition 2.22, p. 19 (PDF p. 19).

### Coefficients: completed tensor products and weight spaces

#### `invariants-of-completed-tensor-with-profinite-module` — Invariants commute with completed tensor products with a profinite flat module carrying the trivial action

*Lemma.* Let A_∞ be a uniform ℚ_p-Banach algebra with a continuous action of a profinite group G, A = A_∞^G, and M a profinite flat ℤ_p-module (e.g. a small ℤ_p-algebra) with the trivial G-action. Then (A_∞ ⊗̂ M)^G = A ⊗̂ M, for the mixed completed tensor product (A_∞° ⊗̂ M)[1/p]; integrally, (A_∞° ⊗̂ M)^G = A° ⊗̂ M.

Proof outline:
1. Choose a pseudobasis (e_i)_{i∈I} of M, so M ≅ ∏_i ℤ_p e_i and X ⊗̂ M ≅ ∏_i X^ for p-adically complete X.
2. A° ⊗̂ M → A_∞° ⊗̂ M is the inclusion ∏_i A° e_i ⊆ ∏_i A_∞° e_i with G acting coordinatewise, so A ⊗̂ M → A_∞ ⊗̂ M is the inclusion of bounded I-sequences in A into bounded I-sequences in A_∞.
3. G-invariant bounded sequences are exactly bounded sequences in A_∞^G = A.

Acceptance: M = ℤ_p[[T]]: (A_∞⟨⟨T⟩⟩)^G = A⟨⟨T⟩⟩ coefficientwise. The trivial action on M is essential, and invariants are not computed pointwise through a completion: for the completed cyclotomic field A_∞ = ℚ_p^cycl^, G = ℤ_p^× and M = ℤ_p(1) with the cyclotomic action, (A_∞ ⊗̂ M)^G = 0 (Tate), while A ⊗̂ M = ℚ_p(1) ≠ 0. Invariants do not commute with an arbitrary completion: let M = ⊕_{n≥−1} ℤ_p e_n ⊕ ⊕_{n≥0} ℤ_p f_n with ℤ_p acting by γ ↦ 1 + γN, N(e_{−1}) = f₀, N(e_n) = p f_{n+1} − f_n, N(f_n) = 0 (so N² = 0). Then M^G = ⊕ ℤ_p f_n, while e_{−1} + Σ_{m≥0} p^m e_m is invariant in the p-adic completion and not in the closure of M^G. The lemma's coordinatewise argument needs the trivial action on the completed factor.

Prerequisites: [`closed-invariant-subalgebra`](#closed-invariant-subalgebra), `AdicSpacesPartII:R5`.

Sources: chj17, Lemma 2.23, p. 19 (PDF p. 19).

#### `invariants-of-completed-tensor-with-banach-space` — Invariants commute with completed tensor products with a Banach space carrying the trivial action

*Lemma.* Let L be a complete nonarchimedean field, A_∞ a uniform Banach L-algebra with a continuous L-linear action of a profinite group G, A = A_∞^G, and V a Banach L-space of countable type (e.g. an affinoid L-algebra) with the trivial G-action. Then (A_∞ ⊗̂_L V)^G = A ⊗̂_L V, and integrally (A_∞° ⊗̂_{L°} V°)^G = A° ⊗̂_{L°} V° for the unit balls. For L = ℚ_p (or any discretely valued L) V is orthonormalisable; in general V has, for each t < 1, a t-orthogonal basis.

Hypotheses and scope: The source states the case L = ℚ_p; the general L is needed for weights over a perfectoid field (BHW), where the source applies the ℚ_p statement without comment (see sourceIssues).

Proof outline:
1. Choose a t-orthogonal basis (e_i) of V (an orthonormal basis if L is discretely valued); then A_∞ ⊗̂_L V is the space of sequences in A_∞ tending to 0, with norm comparable to the sup norm within the factor t, and G acts coordinatewise.
2. Invariant null sequences are null sequences in A_∞^G = A, i.e. A ⊗̂_L V.

Acceptance: V = ℚ_p⟨T⟩: (A_∞⟨T⟩)^G = A⟨T⟩. V = O(𝒰) for an affinoid weight 𝒰 over a perfectoid field L.

Prerequisites: [`closed-invariant-subalgebra`](#closed-invariant-subalgebra), `AdicEtaleGeometry:A0`.

Sources: chj17, Lemma 2.23, p. 19 (PDF p. 19).

#### `weight-extension-of-function-descent` — Descent of O and O⁺ along a torsor after product with a smooth weight space

*Theorem.* Let L₀ ⊇ ℚ_p be a complete discretely valued field with perfect residue field and L ⊇ L₀ a complete extension. Let Y be an affinoid adic space over L₀ that is either a smooth rigid space or a perfectoid space, Γ a profinite group, X ∈ Y_proet an affinoid perfectoid pro-étale Γ-torsor with h: X → Y, and 𝒰 a smooth adic space over L. Put X_𝒰 = X ×_{L₀} 𝒰 and Y_𝒰 = Y ×_{L₀} 𝒰. Then for every affinoid V ⊆ Y, with affinoid perfectoid W = h^{-1}(V), and every affinoid 𝒰′ ⊆ 𝒰: O⁺(W × 𝒰′)^Γ = O⁺(V × 𝒰′) and O(W × 𝒰′)^Γ = O(V × 𝒰′). These product affinoids are not a basis of Y_𝒰; the statement is what the character sheaves need, which are sheaves on Y of O_Y ⊗̂ O(𝒰′)-modules.

Hypotheses and scope: The fibre products exist as sousperfectoid adic spaces (AdicSpacesPartII R5, BHW Corollary 3.4). The base Y lives over a discretely valued L₀ so that function descent (Scholze's Corollary 6.19) applies and O(𝒰′) has an orthonormal basis over L₀ (Serre); BHW Lemma 3.7 works over a perfectoid L and asserts the sheaf equality on all of Y_𝒰, reducing to product opens without comment (see sourceIssues).

Proof outline:
1. Fix affinoids V ⊆ Y, W = h^{-1}(V) and 𝒰′ ⊆ 𝒰.
2. Rational statement: Y is stably uniform, so O(V × 𝒰′) = O(V) ⊗̂_{L₀} O(𝒰′) and O(W × 𝒰′) = O(W) ⊗̂_{L₀} O(𝒰′). O(𝒰′) is a Banach L₀-space with an orthonormal basis (L₀ discretely valued), so the Banach-space lemma over L₀ gives O(W × 𝒰′)^Γ = O(W)^Γ ⊗̂_{L₀} O(𝒰′) = O(V) ⊗̂_{L₀} O(𝒰′) = O(V × 𝒰′), using function descent (smooth rigid Y over L₀) or descent over a perfectoid base (perfectoid Y).
3. Integral statement: f ∈ O⁺(W × 𝒰′)^Γ lies in O(V × 𝒰′) by the rational statement and satisfies |f(y)| ≤ 1 at every point y of W × 𝒰′; since |W × 𝒰′| → |V × 𝒰′| is surjective (a torsor), |f| ≤ 1 at every point of V × 𝒰′, so f ∈ O⁺(V × 𝒰′) (O⁺ is the ring of functions of absolute value ≤ 1 everywhere). The source instead applies CHJ Lemma 2.23(2), a rational statement over ℚ_p, directly to O⁺ and to ⊗̂_L (see sourceIssues).

Acceptance: BHW Proposition 3.8 over the non-cuspidal locus of the anticanonical tower; the cusps need the q-expansion argument of that proposition, which belongs to the Shimura application.

Prerequisites: [`function-descent-along-tower`](#function-descent-along-tower), [`function-descent-over-perfectoid-base`](#function-descent-over-perfectoid-base), [`invariants-of-completed-tensor-with-banach-space`](#invariants-of-completed-tensor-with-banach-space), `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`, `AdicSpacesPartII:R5/sousperfectoid-rings`, `AdicSpacesPartII:R5`.

Sources: bhw21, Lemma 3.7, p. 10 (PDF p. 10); bhw21, Proposition 3.8, p. 10 (PDF p. 10).

Planet: **Descent with weight-space coefficients**.

### Modules

#### `descent-of-finite-locally-free-modules` — Descent of finite locally free modules and their morphisms, and the limits of degree-zero descent

*Theorem.* Let X_∞ → X be a pro-étale G-tower as in the function-descent theorem, and E, F finite locally free O_X-modules (resp. O⁺_X-modules locally free of finite rank). For every affinoid U ⊆ X: E(U) = (E ⊗_{O_X} O_{X_∞})(U_∞)^G, and Hom_X(E, F) = Hom_{O_{X_∞}, G}(h^*E, h^*F) (G-equivariant homomorphisms). So pullback along h is fully faithful on finite locally free modules. It is not essentially surjective: a G-equivariant finite projective O(U_∞)-module need not descend, and degree-zero function descent alone does not classify finite locally free modules; effectivity needs a finite-level trivialisation (finite-level comparison theorem) or, integrally, an integral coboundary.

Hypotheses and scope: E(U) finite projective over O(U) for U affinoid (Kiehl, AdicSpacesPartII R3).

Proof outline:
1. E(U) is a direct summand of O(U)^n; invariants commute with finite direct sums and summands, and E ⊗ O_{X_∞} restricted to U_∞ is E(U) ⊗_{O(U)} O(U_∞), with G acting on the second factor; so its invariants are E(U) ⊗ O(U_∞)^G = E(U).
2. Hom_X(E, F) = (E^∨ ⊗ F)(X), and E^∨ ⊗ F is finite locally free; apply the first statement and glue over an affinoid cover.
3. Non-essential-surjectivity: over the cyclotomic tower of Spa(ℚ_p) with G = ℤ_p^×, the rank-one module ℚ_p^cycl^ with γ acting by χ_cyc(γ)^{-1}γ has invariants 0 (Tate), so it is not the pullback of any ℚ_p-module.

Acceptance: E = O_X: function descent. Tate twist non-example as in the last proof step.

Prerequisites: [`function-descent-along-tower`](#function-descent-along-tower), `AdicSpacesPartII:R3`, `mathlib:Module.Projective.iff_split`, `mathlib:Module.Finite.exists_comp_eq_id_of_projective`.

Sources: chj17, Proposition 2.19, p. 18 (PDF p. 18); chj17, Theorem 2.28, p. 22 (PDF p. 22).

#### `finite-galois-descent-of-modules` — Galois descent of modules along a finite étale Galois ring extension

*Lemma.* Let A → B be an injective map of commutative rings with an action of a finite group H on B over A such that B is finite étale over A and B ⊗_A B ≅ ∏_{h∈H} B, b ⊗ b′ ↦ (b·h(b′))_h (a Galois extension with group H). Then B is faithfully flat over A and B^H = A, and M ↦ B ⊗_A M is an equivalence from A-modules to B-modules with a semilinear H-action, with inverse N ↦ N^H: the unit M → (B ⊗_A M)^H, m ↦ 1 ⊗ m, and the counit B ⊗_A N^H → N, b ⊗ n ↦ bn, are isomorphisms. It preserves and reflects finite projectivity and rank. If |H| is invertible in A, N^H is the image of the idempotent e = |H|^{-1} Σ_h h.

Hypotheses and scope: B/A finite étale Galois and A → B injective. Injectivity is needed: for A = A₁ × A₂ and B = B₁ × 0 with B₁/A₁ Galois, the other hypotheses hold but B^H = A₁ ≠ A. For topological (Banach) algebras the same statement with completed tensor products equals the algebraic one because B is finite projective over A.

Proof outline:
1. B is flat and finite over A, and Spec B → Spec A is surjective because A → B is injective and integral (lying over); so B is faithfully flat. The descent data for A → B are exactly semilinear H-actions via B ⊗_A B ≅ ∏_H B.
2. Faithfully flat descent for modules gives the equivalence; the inverse is the equalizer, i.e. H-invariants.
3. Finite projectivity and rank descend along faithfully flat maps.
4. With |H| invertible, e is an idempotent projecting N onto N^H.

Acceptance: A = ℚ_p, B = ℚ_p(ζ_p), H = (ℤ/p)^×: N = B with the twisted action by a character χ of H gives N^H free of rank one over A.

Prerequisites: `mathlib:Module.FaithfullyFlat`, `mathlib:Algebra.Etale`, `mathlib:IsGaloisGroup`, `tauceti:TauCeti.GaloisDescent.span_invariants_eq_top`, `mathlib:Module.Projective`.

Sources: chj17, Theorem 2.28, p. 22 (PDF p. 22); sga1, Exposé VIII, Théorème 1.1, PDF p. 169.

### Character sheaves

#### `twisted-character-sheaf` — The twisted-invariant character sheaf of a pro-étale tower

*Construction.* Let X_∞ → X be a pro-étale G-tower, A a coefficient algebra (a small ℤ_p-algebra with the mixed completed tensor product, or a reduced affinoid ℚ_p-algebra with ⊗̂_{ℚ_p}), and c: G → (O(X_∞) ⊗̂ A)^× a continuous 1-cocycle for the pullback action, c(γδ) = c(γ)·γ^*(c(δ)) (right action on X_∞, so (γδ)^* = γ^*δ^* on functions). The sheaf ω_c on X is ω_c(U) = {f ∈ O(U_∞) ⊗̂ A : γ^*f = c(γ)^{-1} f for all γ ∈ G}, a sheaf of O_X ⊗̂ A-modules; ω_c⁺ is defined with O⁺ and c valued in (O⁺(X_∞) ⊗̂ A°)^×. Coboundaries are γ ↦ F/γ^*(F) for units F; for c′(γ) = c(γ)·F/γ^*(F), multiplication by F is an isomorphism ω_c ≅ ω_{c′}. The character sheaves of CHJ and BHW are the case c(γ) = χ(b𝔷 + d) for the Hodge–Tate coordinate 𝔷, formally the coboundary of χ(t)^{-1} for a unit t with γ^*t = (b𝔷 + d)t, which is not itself defined.

Hypotheses and scope: The cocycle law is pinned in this convention; O1 generalises the construction from characters to representations.

Proof outline:
1. ω_c is the equalizer of two maps of sheaves O_{X_∞} ⊗̂ A ⇉ C(G, O_{X_∞} ⊗̂ A) pushed forward to X, hence a sheaf; it is an O_X ⊗̂ A-submodule because O(U) ⊗̂ A consists of invariants (weight-space function descent).
2. Cocycle law: (γδ)^*f = γ^*(c(δ)^{-1}f) = γ^*(c(δ))^{-1}c(γ)^{-1}f, which is c(γδ)^{-1}f exactly when c(γδ) = c(γ)γ^*(c(δ)).
3. Change of cocycle: if γ^*f = c(γ)^{-1}f then γ^*(Ff) = (γ^*F/F)c(γ)^{-1}(Ff) = c′(γ)^{-1}(Ff); the inverse is multiplication by F^{-1}.

API:
- `TwistedCharacterSheaf` (data): The sheaf ω_c on X attached to (tower, coefficient algebra A, cocycle c).
- `TwistedCharacterSheaf.sections` (characterisation): ω_c(U) is the set of f ∈ O(U_∞) ⊗̂ A with γ^*f = c(γ)^{-1}f.
- `TwistedCharacterSheaf.module` (instance): ω_c is a sheaf of O_X ⊗̂ A-modules.
- `TwistedCharacterSheaf.integral` (data): The integral subsheaf ω_c⁺ for an integral cocycle, with ω_c⁺[1/p] ⊆ ω_c.
- `TwistedCharacterSheaf.congr_cocycle` (equivalence): ω_c ≅ ω_{c′} for cohomologous cocycles, via the coboundary.
- `TwistedCharacterSheaf.mul` (relation): ω_c ⊗ ω_{c′} → ω_{cc′} by multiplication.
- `TwistedCharacterSheaf.restrict` (functoriality): Compatible with restriction to U ⊆ X and pullback along maps of towers.
- `TwistedCharacterSheaf.baseChange` (functoriality): A map of coefficient algebras A → B induces ω_c(A) → ω_{c_B}(B).

Unit tests:
- `twisted_trivial_cocycle` (degenerate): For c = 1, ω_c = O_X ⊗̂ A (weight-space function descent).
- `twisted_finite_character` (computation): For the ℤ_p(1)-tower on the torus over ℂ_p, with γ^*T^{1/pⁿ} = ζ_{pⁿ}^γ T^{1/pⁿ}, and the finite-order character c(γ) = ζ_{pⁿ}^{−kγ}, ω_c = T^{k/pⁿ}·O_X is free of rank one.
- `twisted_coboundary` (compatibility): If c(γ) = F/γ^*(F) for a unit F of O(X_∞) ⊗̂ A, then ω_c = F·(O_X ⊗̂ A), matching congr_cocycle with the trivial cocycle.
- `twisted_tate_twist_zero` (non-example): For the cyclotomic tower of Spa(ℚ_p) with G = ℤ_p^× and c = χ_cyc^{-1} (valued in ℤ_p^× ⊂ O(X_∞)^×), ω_c = {f : γ^*f = χ_cyc(γ)f} = (ℚ_p^cycl^(−1))^{ℤ_p^×} = 0 by Tate: without a finite-level trivialisation the equalizer can vanish.

Uses: CHJ, Theorem 2.28: ω^†_{𝒰,w} is locally projective of rank one; BHW, Definitions 3.15 and 6.5, Theorem 4.8: overconvergent elliptic and Hilbert modular forms of weight κ and their integral lattices; OverconvergentAutomorphicForms:O1: the character case of the equivariant coefficient sheaves; O1 extends to nontrivial representations; HodgeTateAndCanonicalSubgroups:T5: the comparison with the Andreatta–Iovita–Pilloni torsor sheaf.

Acceptance: c = 1: ω_c = O_X ⊗̂ A by descent.

Prerequisites: [`profinite-galois-tower`](#profinite-galois-tower), [`cech-descent-datum`](#cech-descent-datum), [`weight-extension-of-function-descent`](#weight-extension-of-function-descent), [`invariants-of-completed-tensor-with-profinite-module`](#invariants-of-completed-tensor-with-profinite-module), [`invariants-of-completed-tensor-with-banach-space`](#invariants-of-completed-tensor-with-banach-space), `AdicSpacesPartII:R5`.

Sources: chj17, Definition 2.18, p. 17 (PDF p. 17); bhw21, Definition 3.15, p. 12 (PDF p. 12).

Planet: **Twisted character sheaf**.

#### `approximation-of-units-at-finite-level` — Units at infinite level are finite-level units up to a unit close to 1

*Lemma.* Let U ⊆ X be quasicompact, U_∞ → U a pro-étale G-tower with U_n = U_∞/G_n, and suppose O⁺(U_∞) is the p-adic completion of colim_n O⁺(U_n). For every unit t ∈ O(U_∞)^× and every m ≥ 1 there are n = n(m), s_n ∈ O(U_n)^× and t^{(n)} ∈ 1 + p^m O⁺(U_∞) with t = t^{(n)} s_n.

Proof outline:
1. By quasicompactness and invertibility of t choose M, N with |p^M| ≤ |p^N t| ≤ 1 on U_∞.
2. Approximate p^N t by s ∈ O⁺(U_n) with p^N t − s ∈ p^{M+m}O⁺(U_∞) (completion of the colimit).
3. Put s_n = p^{-N}s and t^{(n)} = t/s_n; then |t^{(n)} − 1| ≤ |p|^m, so t^{(n)} ∈ 1 + p^mO⁺(U_∞) and s_n is a unit.

Acceptance: For t = T^{1/p^k} on the perfectoid torus, n = k works with t^{(n)} = 1.

Prerequisites: [`profinite-galois-tower`](#profinite-galois-tower), `PerfectoidSpaces:P5/cofiltered-limits-of-affinoid-perfectoid-spaces`.

Sources: chj17, Proposition 2.27, p. 21 (PDF p. 21).

#### `finite-level-character-sheaf-comparison` — Finite-level identification and local freeness of rank one of character sheaves

*Theorem.* Let ω_c be a twisted character sheaf on X with A a small or affinoid coefficient algebra, and U ⊆ X an affinoid (rational or an affinoid subdomain). Let G_n ⊴ G be the open normal subgroup with U_n = U_∞/G_n and Γ_n = G/G_n the finite quotient. Suppose that c(γ) = (γ^*u/u)·c_n(γ) for a unit u ∈ (O(U_∞) ⊗̂ A)^× and a 1-cocycle c_n of Γ_n with values in (O(U_n) ⊗̂ A)^× (inflated to G). Then f ↦ f·u is an O(U) ⊗̂ A-isomorphism from ω_c(U) onto the c_n-twisted invariants (O(U_n) ⊗̂ A)^{Γ_n, c_n} = {f₀ : c_n(γ)γ^*f₀ = f₀}. This is a direct summand of O(U_n) ⊗̂ A (split by e_n = |Γ_n|^{-1} Σ_{γ∈Γ_n} c_n(γ)γ^*, an idempotent because γ ↦ c_n(γ)γ^* is an action by the cocycle law), it is the Galois descent of the free rank-one module with descent datum c_n, hence finite projective of rank one over O(U) ⊗̂ A, and the formation commutes with restriction to affinoid subdomains V ⊆ U. If X is affinoid and such decompositions exist on a finite affinoid cover, ω_c = Loc(ω_c(X)) is locally projective of rank one and trivial over the finite levels U_n.

Hypotheses and scope: O(U) → O(U_n) finite étale Galois with group Γ_n and O(U_n) finite projective over O(U) (noetherian affinoids). p is invertible in O(U_n) ⊗̂ A, so e_n exists; this is a rational statement. Kiehl's theorem for O_X ⊗̂ A-modules (CHJ Theorem 6.20, discretely valued base) for the global statement.

Proof outline:
1. For f ∈ ω_c(U), γ^*(fu) = c(γ)^{-1}f·γ^*u = (u/γ^*u)c_n(γ)^{-1}f·γ^*u = c_n(γ)^{-1}(fu), and c_n is trivial on G_n; so fu ∈ (O(U_∞) ⊗̂ A)^{G_n} = O(U_n) ⊗̂ A (weight-space descent for the tower U_∞ → U_n and the invariants lemmas).
2. For γ ∈ Γ_n the same identity gives the c_n-twisted invariance; conversely f₀ ↦ f₀u^{-1}.
3. e_n is an idempotent in the twisted group ring; its image is the twisted invariants, a direct summand of the finite projective O(U) ⊗̂ A-module O(U_n) ⊗̂ A.
4. O(U) ⊗̂ A → O(U_n) ⊗̂ A is Galois with group Γ_n (base change of a finite étale Galois map, CHJ Lemma 6.7), and the twisted action is a Galois descent datum on the free module of rank one; Galois descent gives rank one.
5. Restriction to an affinoid subdomain V ⊆ U: O(V) ⊗_{O(U)} O(U_n) = O(V_n) (finite étale base change) and CHJ Lemma 6.7 give O(V) ⊗̂ A ⊗_{O(U) ⊗̂ A} (O(U_n) ⊗̂ A) = O(V_n) ⊗̂ A, matching the idempotents; so ω_c is coherent and Kiehl's theorem gives Loc of global sections.

Acceptance: CHJ Theorem 2.28: ω^†_{𝒰,w} = Loc(ω^†_{𝒰,w}(X_w)), finite projective of rank one, étale locally free, with u = χ_𝒰(t_U^{(n)}) from the unit approximation and c_n = χ_𝒰(j_{U,n}).

Prerequisites: [`twisted-character-sheaf`](#twisted-character-sheaf), [`approximation-of-units-at-finite-level`](#approximation-of-units-at-finite-level), [`finite-galois-descent-of-modules`](#finite-galois-descent-of-modules), [`weight-extension-of-function-descent`](#weight-extension-of-function-descent), [`invariants-of-completed-tensor-with-profinite-module`](#invariants-of-completed-tensor-with-profinite-module), [`invariants-of-completed-tensor-with-banach-space`](#invariants-of-completed-tensor-with-banach-space), `AdicSpacesPartII:R5`, `AdicSpacesPartII:R3`.

Sources: chj17, unnumbered paragraph after Proposition 2.27 (cocycle j_{U,n}, idempotent e_n), p. 21 (PDF p. 21); j_{U,n} and e_n are displayed on p. 22 (PDF p. 22); chj17, Theorem 2.28, p. 22 (PDF p. 22); chj17, Theorem 6.20, p. 53 (PDF p. 53).

Planet: **Local freeness of character sheaves**.

#### `integral-coboundary-trivialises-integral-sheaf` — An integral unit eigenfunction trivialises the integral character sheaf

*Lemma.* In the situation of the twisted character sheaf with an integral cocycle c valued in (O⁺(X_∞) ⊗̂ A°)^×, suppose that on an open V ⊆ X there is F ∈ (O⁺(V_∞) ⊗̂ A°)^× with γ^*F = c(γ)^{-1}F for all γ ∈ G. Then ω_c⁺|_V = F·(O⁺_V ⊗̂ A°) is free of rank one. This is the effectivity statement for integral descent: without such an F, the integral twisted invariants need not be locally free, even when ω_c is (rational Galois descent uses e_n, which is not integral when p divides |G_n|).

Proof outline:
1. For f ∈ ω_c⁺(W), W ⊆ V, the quotient f/F ∈ O⁺(W_∞) ⊗̂ A° is G-invariant, so it lies in (O⁺(W_∞) ⊗̂ A°)^G = O⁺(W) ⊗̂ A°, by the integral forms of the invariants lemmas and integral function descent O⁺(W_∞)^G = O⁺(W).
2. Conversely F·g is a section of ω_c⁺ for g ∈ O⁺(W) ⊗̂ A°.

Acceptance: BHW Theorem 4.8: with F = s̃^*f for an invertible section f of the AIP sheaf, ω^{κ,+}_n|_V = s̃^*f·O⁺_V (the section F itself is produced by HodgeTateAndCanonicalSubgroups T5).

Prerequisites: [`twisted-character-sheaf`](#twisted-character-sheaf), [`weight-extension-of-function-descent`](#weight-extension-of-function-descent), [`invariants-of-completed-tensor-with-profinite-module`](#invariants-of-completed-tensor-with-profinite-module), [`invariants-of-completed-tensor-with-banach-space`](#invariants-of-completed-tensor-with-banach-space), [`function-descent-along-tower`](#function-descent-along-tower).

Sources: bhw21, Theorem 4.8, proof (sentence "It now follows from Prop. 3.8 …"), p. 18 (PDF p. 18).

### Coefficient change and inverse limits

#### `coefficient-change-by-regular-element` — Flat coefficient change: reduction modulo a regular element

*Lemma.* Let 𝒰 = (A_𝒰, χ_𝒰) be a coefficient algebra and i: A_𝒰 → A_𝒵 a surjection with kernel generated by a regular element x, 𝒵 = (A_𝒵, i ∘ χ_𝒰). With a character sheaf ω_{𝒰} admitting finite-level decompositions as in the comparison theorem over an affinoid X_w (K discretely valued), the sequence 0 → ω_𝒰 --·x--> ω_𝒰 → ω_𝒵 → 0 of sheaves is exact, and so is 0 → H⁰(X_w, ω_𝒰) --·x--> H⁰(X_w, ω_𝒰) → H⁰(X_w, ω_𝒵) → 0.

Hypotheses and scope: x regular in A_𝒰; A_𝒰 noetherian (small or affinoid); K discretely valued; X_w affinoid so H¹ vanishes.

Proof outline:
1. Flatness: O(U_n) has an orthonormal basis (e_i)_{i∈I} over the discretely valued base, so A_𝒰 ⊗̂ O(U_n) is c₀(I, A_𝒰), the p-adic completion of the free A_𝒰°-module on I with p inverted; the p-adic completion of a free module over a noetherian ring is flat, so A_𝒰 ⊗̂ O(U_n) is flat over A_𝒰. (The source cites a different lemma for this; see sourceIssues.)
2. Tensor 0 → A_𝒰 → A_𝒰 → A_𝒵 → 0 with the flat A_𝒰 ⊗̂ O(U_n), identify (A_𝒰 ⊗̂ O(U_n)) ⊗_{A_𝒰} A_𝒵 with A_𝒵 ⊗̂ O(U_n) (ideals of the noetherian ring are closed), and apply the idempotent e_n on a basis of small U.
3. Global sections: H¹(X_w, ω_𝒰) = 0 by the comparison theorem and Tate acyclicity for Loc of projective modules (CHJ Proposition 6.16).

Acceptance: Specialisation of a family of weights to a single weight κ ∈ 𝒰(ℚ_p) cut out by one equation.

Prerequisites: [`finite-level-character-sheaf-comparison`](#finite-level-character-sheaf-comparison), `AdicSpacesPartII:R5`, `AdicSpacesPartII:R3`.

Sources: chj17, Lemma 2.29, p. 22 (PDF p. 22); chj17, Lemma 6.13, p. 50 (PDF p. 50).

#### `derived-coefficient-change` — Derived coefficient change for a nonflat quotient, with the Tor correction

*Lemma.* In the situation of the regular-element lemma, let X be separated and quasicompact, with a finite affinoid cover 𝔘 (whose finite intersections are then affinoid) on which the character sheaf ω_𝒰 admits finite-level decompositions, K discretely valued, and I ⊆ A_𝒰 any ideal with A_𝒰/I again a coefficient algebra. Then the Čech complex C^•(𝔘, ω_𝒰) is a bounded complex of flat A_𝒰-modules, C^•(𝔘, ω_𝒰) ⊗_{A_𝒰} A_𝒰/I ≅ C^•(𝔘, ω_{𝒰/I}), and hence RΓ(X, ω_𝒰) ⊗^L_{A_𝒰} A_𝒰/I ≅ RΓ(X, ω_{𝒰/I}), with the Künneth spectral sequence E₂^{i,j} = Tor_{−i}^{A_𝒰}(H^j(X, ω_𝒰), A_𝒰/I) ⇒ H^{i+j}(X, ω_{𝒰/I}). If A_𝒰/I has projective dimension ≤ 1 over A_𝒰 (for example I = (x) with x regular) it reduces to 0 → H^q(X, ω_𝒰) ⊗ A_𝒰/I → H^q(X, ω_{𝒰/I}) → Tor_1^{A_𝒰}(H^{q+1}(X, ω_𝒰), A_𝒰/I) → 0; for I = (x) the Tor term is H^{q+1}(X, ω_𝒰)[x]. So H⁰(X, ω_𝒰)/I → H⁰(X, ω_{𝒰/I}) is not surjective in general when X is not affinoid.

Hypotheses and scope: Stated separately from the flat, affinoid case, as the stage requires. The source proves only the regular-element case over an affinoid; this node is the standard derived base change for Čech complexes of flat modules, applied to the inputs that proof establishes.

Proof outline:
1. Each term ω_𝒰(U_{i₀…i_q}) is a direct summand of O(U_{i₀…i_q,n}) ⊗̂ A_𝒰, which is flat over A_𝒰 (the flatness asserted in the proof of CHJ Lemma 2.29; see sourceIssues); so the Čech complex consists of flat modules and computes the derived tensor product.
2. Termwise, (O(V_n) ⊗̂ A_𝒰) ⊗_{A_𝒰} A_𝒰/I ≅ O(V_n) ⊗̂ A_𝒰/I (noetherianity, CHJ Lemma 6.13(1): ideals are closed), and the idempotent e_n is compatible, so ω_𝒰(V) ⊗ A_𝒰/I ≅ ω_{𝒰/I}(V).
3. Čech complexes of Loc of projective modules on finite affinoid covers compute cohomology (CHJ Proposition 6.16); the Künneth spectral sequence for a bounded complex of flat modules gives the rest.

Acceptance: Reduction modulo an ideal with a nonzero Tor term: on the Tate curve E = 𝔾_m^an/q^ℤ over ℚ_p with A = ℚ_p⟨T⟩, the family ℒ of degree-zero line bundles attached to the character n ↦ (1 + T)^n of ℤ (the same Čech computation, for the ℤ-cover 𝔾_m^an → E) has H⁰(E, ℒ) = 0 and H¹(E, ℒ) ≅ A/(T), so H⁰(E, ℒ/T) = ℚ_p = Tor₁^A(H¹(E, ℒ), A/T) while H⁰(E, ℒ)/T = 0. For X affinoid all higher H^q vanish and the regular-element lemma is recovered.

Prerequisites: [`coefficient-change-by-regular-element`](#coefficient-change-by-regular-element), [`finite-level-character-sheaf-comparison`](#finite-level-character-sheaf-comparison), `AdicSpacesPartII:R3`, `AdicSpacesPartII:R5`, `mathlib:Module.Flat`.

Sources: chj17, Lemma 2.29, p. 22 (PDF p. 22); chj17, Lemma 6.13, p. 50 (PDF p. 50).

#### `profinite-module-coefficient-sheaf` — Pro-étale coefficient sheaves from profinite modules with continuous action

*Lemma.* Let X_∞ → X be a pro-étale G-tower over a rigid space X over ℚ_p and M a profinite flat ℤ_p-module with a continuous left G-action and a presentation M = lim_i M/I_i by G-stable open submodules. The sheaf M ⊗̂ O_X on X_proet, V ↦ (M ⊗̂ Ô_X(V ×_X X_∞))^G for qcqs V (diagonal action g(m ⊗ f) = gm ⊗ g^*f), coincides with ℚ̂_p ⊗_{ℤ̂_p} lim_i (ν^*M̃_i ⊗_{ℤ_p} O⁺_X), where M̃_i is the locally constant sheaf on X_et attached to the finite G-module M_i = M/I_i.

Hypotheses and scope: M_i finite of p-power exponent; the comparison is an almost equality at each finite stage and becomes an equality after inverse limits and inverting p.

Proof outline:
1. Check on affinoid perfectoid V ∈ X_proet (a basis); V_∞ = V ×_X X_∞ is affinoid perfectoid.
2. M_i ⊗ Ô⁺_X(V_∞) =^a (ν^*M̃_i ⊗ O⁺_X)(V_∞) by Scholze 2013, Lemma 4.10 (M̃_i trivialises over V_∞).
3. Take G-invariants: since V_∞ → V is a G-cover, the étale-sheaf lemma gives (M_i ⊗ Ô⁺(V_∞))^G =^a (ν^*M̃_i ⊗ O⁺)(V).
4. Inverse limits commute with invariants; the kernels and cokernels of the comparison maps form 𝔪-torsion (almost zero) inverse systems, and lim and lim¹ of 𝔪-torsion systems are 𝔪-torsion; since p ∈ 𝔪, they vanish after inverting p.

Acceptance: M = ℤ_p with trivial action: the sheaf is Ô_X. M = D_𝒰^{s,°} (distributions): CHJ's sheaf O D_𝒰^s; the distribution modules themselves belong to the distribution owner.

Prerequisites: [`etale-sheaf-sections-over-galois-tower`](#etale-sheaf-sections-over-galois-tower), `PadicHodgeTheory:P8:local-rational/completed-structure-sheaf-on-affinoid-perfectoids`, [`cech-descent-datum`](#cech-descent-datum), [`invariants-of-completed-tensor-with-profinite-module`](#invariants-of-completed-tensor-with-profinite-module).

Sources: chj17, Lemma 4.1, p. 28 (PDF p. 28); chj17, Lemma 4.5, p. 30 (PDF p. 30).

#### `higher-inverse-limits-vanish-on-towers` — Vanishing of higher inverse limits for coefficient systems on towers

*Lemma.* Let (M_k)_k be an inverse system of finite G-modules of p-power exponent with surjective transition maps and X_∞ → X a pro-étale G-tower, and F_k = ν^*M̃_k ⊗ O⁺_X. Then R^i lim_k F_k is almost zero for i > 0 on X_proet, (lim_k F_k)(U) → lim_k F_k(U) is an almost isomorphism and H^j(U, lim F_k) is almost zero for j > 0 on the basis of affinoid perfectoid U = V ×_X X_∞; all three become exact statements after inverting p. If moreover the groups H^i(X_C, M_k) are finite (as for proper X_C), the systems H^i(X_C, M_k) ⊗ O_C are Mittag-Leffler, so cohomology commutes with the inverse limit.

Hypotheses and scope: The inverse-system hypotheses the stage asks to state: surjective transitions, finiteness at each stage, and a basis on which the terms are almost acyclic with almost vanishing lim¹ of sections; finiteness of H^i(X_C, M_k) is a hypothesis of the last clause, supplied for proper X_C by the finiteness theorem for proper rigid spaces.

Proof outline:
1. On the basis of affinoid perfectoid towers U, H^j(U, ν^*M̃_k ⊗ O⁺) is almost zero for j > 0 and the transition maps on sections are almost surjective; the almost version of Scholze 2013, Lemma 3.18 (as in PadicHodgeTheory P8) gives that R^i lim is almost zero. (The source states exact vanishing; see sourceIssues.)
2. Finite modules H^i(X_C, M_k) satisfy Mittag-Leffler, so lim^1 vanishes and cohomology commutes with lim.

Acceptance: M_k = ℤ/p^k: R lim (O⁺/p^k) = Ô⁺ on the tower basis. CHJ Proposition 4.3 and the proof of Proposition 4.4: the distribution quotients D_𝒰^{s,°}/Fil^k have finite cohomology groups, so the étale–singular comparison passes to the limit.

Prerequisites: `PadicHodgeTheory:P8:local-rational/completed-structure-sheaf-on-affinoid-perfectoids`, [`profinite-module-coefficient-sheaf`](#profinite-module-coefficient-sheaf), `mathlib:CategoryTheory.Limits.limit`.

Sources: chj17, Proposition 4.4 (proof), p. 29 (PDF p. 29) for the statement; the proof is on p. 30 (PDF p. 30); chj17, Proposition 4.3 with proof, p. 29 (PDF p. 29).
## Requests to other roadmaps

- **DiamondsAndVStacks:D0**: The quotient criterion for spectral spaces: a surjective generalizing spectral map of spectral spaces is a quotient map (ECD Lemma 2.5, stated as Hansen's Lemma 3.2), with the image lemma for pro-constructible sets it uses. Mathlib has only the Spec case. Needed by `invariant-spectrum-homeomorphism`.
- **DiamondsAndVStacks:D2**: The v-topology on Perfd is subcanonical and O, O⁺ are v-sheaves (ECD Theorem 8.7); quotients of v-sheaves by finite groups computed as v-sheaves; the pro-étale and v-sheaf quotients of a diamond by a finite group agree. Needed by `invariant-quotient-v-sheaf-presentation`, `affinoid-perfectoid-quotient`, `free-action-quotient-is-torsor`, `function-descent-over-perfectoid-base`.
- **DiamondsAndVStacks:D3**: G-torsors of v-stacks for locally profinite G and their representability and pro-étaleness over perfectoid bases (ECD Definition 10.12, Lemma 10.13), and effectivity of v-descent for finite étale maps over a perfectoid base. Needed by `free-action-quotient-is-torsor`, `profinite-galois-tower`, `function-descent-over-perfectoid-base`.
- **DiamondsAndVStacks:D4**: Diamonds as pro-étale sheaf quotients, open subdiamonds and their compatibility with quotients by finite groups acting on a diamond, so that X^◇/G is formed and restricts along G-stable opens. Needed by `quotient-diamond-comparison`, `perfectoid-from-perfectoid-components`.
- **DiamondsAndVStacks:D5**: ECD Lemma 11.11 (a qcqs map of diamonds bijective on (C, C⁺)-points is an isomorphism), Proposition 11.13 (points of a diamond through perfectoid fields), Proposition 11.23(iii), Lemma 11.27 (a spatial diamond whose connected components are affinoid perfectoid is affinoid perfectoid), Corollary 11.29 (fibre products of spatial diamonds are spatial), Lemma 12.11 (quasicompact maps of v-sheaves surjective on |·| are surjective) and Proposition 13.6 (a separated map is quasi-pro-étale if it is so on fibres over Spa(C, O_C)). Needed by `invariant-quotient-v-sheaf-presentation`, `perfectoid-from-perfectoid-components`, `quotient-of-good-tower`, `free-action-quotient-is-torsor`.
- **DiamondsAndVStacks:D6**: Spd(A, A⁺) of a Tate ℤ_p-pair with |Spd(A, A⁺)| = |Spa(A, A⁺)| (ECD 15.2–15.4), and X^◇ for analytic adic spaces, compatible with open immersions. Needed by `invariant-quotient-v-sheaf-presentation`, `quotient-diamond-comparison`, `integral-extension-of-perfectoid-pair`.
- **AdicEtaleGeometry:A0**: Adic spaces as objects of Huber's category V of v-ringed spaces with their structure sheaves, which the categorical quotient is formed in; completed tensor products of complete Huber pairs, with A⟨f/h⟩ = A ⊗̂_{B} B⟨f/h⟩ for a continuous B → A and B⟨f/h⟩ a rational localisation; and completed tensor products of Banach spaces over a nonarchimedean field. Needed by `categorical-quotient`, `rational-invariants-order-invertible`, `quotient-scalar-extension`, `invariants-of-completed-tensor-with-banach-space`.
- **AdicSpacesPartII:R0**: Classical affinoid algebras over a complete nonarchimedean field: noetherianity, finite modules are Banach and closed, a finite algebra over an affinoid algebra is affinoid (BGR 6.3.3/3 in the form cited by Hansen and CHJ); finite morphisms of rigid spaces and their base change. Needed by `invariants-of-affinoid-algebra`, `rigid-finite-quotient`, `finite-tower-over-perfectoid-tower`.
- **AdicSpacesPartII:R1**: Analytification of quasi-projective varieties with closed immersions and ideal sheaves; rigid GAGA for projective varieties, in particular that a rigid space finite over the analytification of a projective variety is the analytification of a projective variety. Needed by `closed-subvariety-pullback-is-zariski-closed`, `good-tower`, `good-towers-under-finite-maps`.
- **AdicSpacesPartII:R3**: Vector bundles on a sheafy (stably uniform, e.g. affinoid perfectoid) affinoid are finite projective modules and generated by global sections (Kiehl, Kedlaya–Liu); Loc of finite projective modules is acyclic on finite affinoid covers; and for uniform Banach rings the spectral seminorm is the supremum over the spectrum, so a map of uniform rings surjective on spectra is isometric (KL15 Theorem 2.3.10, Remark 2.8.3). Needed by `closed-subvariety-pullback-is-zariski-closed`, `rational-invariants-characteristic-p`, `descent-of-finite-locally-free-modules`, `finite-level-character-sheaf-comparison`, `coefficient-change-by-regular-element`, `derived-coefficient-change`.
- **AdicSpacesPartII:R5**: The coefficient algebras of families: the mixed completed tensor product V ⊗̂ M = (V° ⊗̂ M)[1/ϖ] for M a profinite flat O_K-module (CHJ Definitions 6.3, 6.6, Proposition 6.4, Corollary 6.5, Lemma 6.7), and the sheaf R = O_X ⊗̂ R on an affinoid rigid X over a discretely valued K with Tate acyclicity, Loc, flatness and Kiehl's theorem (CHJ Lemma 6.13, Propositions 6.15–6.16, Theorem 6.20), in addition to the sousperfectoid products its nodes already plan. Needed by `invariants-of-completed-tensor-with-profinite-module`, `twisted-character-sheaf`, `weight-extension-of-function-descent`, `finite-level-character-sheaf-comparison`, `coefficient-change-by-regular-element`, `derived-coefficient-change`.
- **ClassicalAdicEtaleCohomology:H0**: The general Huber tilde-limit (inverse-limit topology and affinoid density) with the density of lim→ O(V_i) in O(V) for a tilde-limit of affinoids, which RS-05 assigns to H0; the closed-loci theorem uses it for the tilde-limit comparison. Needed by `closed-loci-in-towers`.

## Gaps

- **Perfectoidization of integral algebras (Bhatt–Scholze Theorem 1.17(1) = 10.11) has no atlas owner.** Hansen–Johansson Lemma 5.10 needs, for a perfectoid R and an integral R⁺ → S⁺, the universal integral perfectoid S⁺-algebra S⁺_perfd (BS22 v4 Theorem 1.17(1), proved in Theorem 10.11 with the universal property from Corollary 8.14). PerfectoidQuotients Q4 owns only the semiperfectoid case (Theorem 7.4, Remark 7.5), which covers closed immersions but not finite maps. The paper extraction PAPER-BHATT-SCHOLZE-22 routes Theorem 10.11 to a Part II of PerfectoidQuotients (perfectoidization of integral algebras and almost purity along arbitrary ideals) that is not yet an atlas roadmap. When that roadmap exists, its node for Theorem 10.11 is the prerequisite of the integral-extension lemma. Needed by `integral-extension-of-perfectoid-pair`, `finite-tower-over-perfectoid-tower`, `good-towers-under-finite-maps`, `quotient-of-good-tower`.
- **Descent of functions along towers over seminormal (non-smooth) rigid bases.** Function descent is planned for smooth rigid bases over a complete discretely valued field with perfect residue field, where Scholze's ν_*Ô_X = O_{X_et} (Corollary 6.19, as decomposed in PadicHodgeTheory P8:local-rational) applies; the weight-space extension therefore takes its base over such a field. BHW Lemma 3.6 quotes Kedlaya–Liu II Theorem 8.2.3 (X seminormal if and only if O_X → ν_*Ô_X is an isomorphism) to allow seminormal bases, such as normal minimal compactifications; no atlas layer plans that theorem. The cusps of the anticanonical tower are handled in BHW Proposition 3.8 by q-expansions, which belongs to the Shimura application. Needed by `function-descent-along-tower`, `weight-extension-of-function-descent`.
- **t-orthogonal bases of Banach spaces of countable type over a non-discretely valued field.** The invariants lemma for (A_∞ ⊗̂_L V)^G over a perfectoid field L (needed for weights over L, BHW Lemma 3.7) uses that a Banach L-space of countable type has a t-orthogonal basis for every t < 1 (van Rooij, Non-Archimedean Functional Analysis; Schikhof). Over discretely valued L an orthonormal basis exists and the source's argument applies; the weight-space extension is planned over such a base, so only the general-L form of the lemma waits on this. Neither the libraries (Mathlib has only Schauder bases of normed spaces) nor an atlas layer provides the non-discrete case. Needed by `invariants-of-completed-tensor-with-banach-space`.

## Mistakes found in the sources

Each is recorded in the packet's `sourceIssues` with the quoted text, the correction and the reason; the nodes use the corrected statements. The most consequential are E1 (Hansen–Johansson's G-clean neighbourhoods need the orbit of a rank-one point to inject into the maximal Hausdorff quotient), E17 (Scholze's Remark II.2.4 is false, as ECD 5.8 and Bhatt–Scholze Remark 7.5 already say), E18 (Scholze's Definition II.2.6 needs the integral-closure condition that ECD Definition 5.7 adds) and E25 (Birkbeck–Heuer–Williams apply a rational ℚ_p statement integrally and over L).

| id | source | kind | locator | affects |
|---|---|---|---|---|
| PerfectoidSpaces/E1 | hj20 | gap | Proofs of Theorem 5.3 (p. 28) and Theorem 5.8 (p. 31), first paragraph, arXiv v2 | the proof |
| PerfectoidSpaces/E2 | hj20 | gap | Theorem 5.8, p. 30, and its proof, arXiv v2 | the proof |
| PerfectoidSpaces/E3 | hj20 | gap | Theorem 5.3, p. 28, arXiv v2 | a stated result |
| PerfectoidSpaces/E4 | hj20 | misprint | Theorem 5.8, second assertion, p. 30, arXiv v2 | nothing |
| PerfectoidSpaces/E5 | hj20 | misprint | Proof of Proposition 5.13(1), p. 33, arXiv v2 | nothing |
| PerfectoidSpaces/E6 | hj20 | misprint | Lemma 5.10, p. 32 (also p. 5), arXiv v2 | nothing |
| PerfectoidSpaces/E7 | hj20 | gap | Proof of Lemma 5.1, p. 27, arXiv v2 | the proof |
| PerfectoidSpaces/E8 | hj20 | gap | Paragraph before Definition 5.4, p. 29, arXiv v2 | the proof |
| PerfectoidSpaces/E9 | han16 | gap | Theorem 1.1, p. 1, and its proof in §2, p. 4, author's PDF of 28 August 2016 | a stated result |
| PerfectoidSpaces/E10 | han16 | misprint | Proof of Theorem 3.1, Step 1, p. 5 | nothing |
| PerfectoidSpaces/E11 | han16 | gap | Proof of Theorem 3.1, Step 1, pp. 4–5 | the proof |
| PerfectoidSpaces/E12 | han16 | gap | Proof of Theorem 3.1, Step 2, p. 5 | the proof |
| PerfectoidSpaces/E13 | han16 | misprint | Theorem 3.6, p. 9 | nothing |
| PerfectoidSpaces/E14 | han16 | gap | Beginning of §3, p. 4 | the proof |
| PerfectoidSpaces/E15 | kl16 | misprint | Theorem 3.3.26 and its proof, p. 68, arXiv v3 | the proof |
| PerfectoidSpaces/E16 | cgj19 | misprint | Proof of Proposition 2.1.3, p. 5 (also p. 20), arXiv v2 | nothing |
| PerfectoidSpaces/E17 | sch15 | error | Remark II.2.4, p. 14, arXiv v2 | a stated result |
| PerfectoidSpaces/E18 | sch15 | gap | Definition II.2.6 and the sentence after it, p. 15, arXiv v2 | a stated result |
| PerfectoidSpaces/E19 | ecd | gap | Paragraph after Definition 5.7, p. 24, arXiv v4 (also Scholze, torsion, Lemma II.2.8) | the proof |
| PerfectoidSpaces/E20 | ecd | misprint | Sentence after Theorem 5.8, p. 25, arXiv v4 | nothing |
| PerfectoidSpaces/E21 | ecd | misprint | Definition 10.12, p. 53, arXiv v4 | nothing |
| PerfectoidSpaces/E22 | sch15 | misprint | Proof of Theorem IV.1.1, p. 68, arXiv v2 | nothing |
| PerfectoidSpaces/E23 | sch15 | gap | Theorem IV.1.1(i) and its proof, pp. 67–69, arXiv v2 | the proof |
| PerfectoidSpaces/E24 | bhw21 | misprint | Proof of Lemma 3.7, p. 10, arXiv v4 | nothing |
| PerfectoidSpaces/E25 | bhw21 | gap | Proof of Lemma 3.7, p. 10, arXiv v4 | the proof |
| PerfectoidSpaces/E26 | bhw21 | gap | Lemma 3.6, p. 9, arXiv v4 | a stated result |
| PerfectoidSpaces/E27 | chj17 | misprint | Paragraph after Proposition 2.27, p. 22, arXiv v2 | nothing |
| PerfectoidSpaces/E28 | chj17 | gap | Proof of Lemma 2.29, p. 23, arXiv v2 | the proof |
| PerfectoidSpaces/E29 | chj17 | error | Lemma 6.21, p. 53, arXiv v2 | a stated result |
| PerfectoidSpaces/E30 | chj17 | gap | Proof of Proposition 4.4, pp. 29–30, arXiv v2 | the proof |
| PerfectoidSpaces/E31 | chj17 | gap | Lemma 4.1 and the setup of §4.1, p. 28, arXiv v2 | the proof |
| PerfectoidSpaces/E32 | hj20 | gap | Proof of Lemma 5.10, p. 32, arXiv v2 | the proof |
| PerfectoidSpaces/E33 | bs22 | gap | Remark 7.5, p. 56, arXiv v4 | the proof |
| PerfectoidSpaces/E34 | bhw21 | gap | Proof of Lemma 3.7, p. 10, arXiv v4 | a stated result |

## Coverage

- **PerfectoidSpaces:P8**: partial. Every definition and theorem of Hansen–Johansson §5.1, Hansen 2016, CGJ §2.1 and KL16 3.3.26 is a node, together with the closed-locus perfectoidization of Scholze's torsion II.2 and IV.1.1 in the form ECD 5.8 makes true. The stage text's 'Hansen–Johansson §5's invariant affinoid-cover hypothesis' is Hansen 2016's hypothesis; Hansen–Johansson replace it by analytic separation and prove that an invariant affinoid cover exists a posteriori, which is how this packet meets the completion contract to prove invariant-affinoid-cover existence before applying the quotient theorem. Groups of order divisible by p are included throughout: the invariants theorem (norm estimates and Sylow reduction) and the rational-localisation theorem (binomial coefficients prime to p and tilting) divide by no multiple of p.
  - Remaining: Integral-extension lemma (HJ 5.10) and its consumers wait on an owner for BS22 Theorem 1.17(1)/10.11 (gap).
  - Remaining: Requests to DiamondsAndVStacks D0, D2–D6, AdicEtaleGeometry A0, AdicSpacesPartII R0, R1, R3 and ClassicalAdicEtaleCohomology H0 are open; the nodes name exactly the statements they import.
- **PerfectoidSpaces:P9**: partial. Planned from CHJ §§2.6, 4.1–4.2 and the appendix, BHW §3.1 and §4, and Scholze's pro-étale lemmas as decomposed in PadicHodgeTheory P8:local-rational. The stage's items appear as: the Čech datum; descent of O and O⁺ as actual equalizers, with the almost comparison in positive degrees stated separately; full faithfulness on finite locally free modules and the counterexample to essential surjectivity; finite-level identification and rank-one local freeness of character sheaves; the integral effectivity criterion; flat, regular and derived nonflat coefficient change; lim¹ vanishing. The completed external product with a weight space and its sheaf property stay with AdicSpacesPartII R5 (RS-05); the general equivariant sheaves for representations stay with OverconvergentAutomorphicForms O1; distributions stay with LocallyAnalyticDistributions.
  - Remaining: Function descent beyond smooth rigid bases (seminormal bases, Kedlaya–Liu II 8.2.3) has no owner (gap).
  - Remaining: The general-L invariants lemma needs t-orthogonal bases over non-discretely valued fields (gap).
  - Remaining: Requests to AdicSpacesPartII R3, R5, DiamondsAndVStacks D2–D3 and AdicEtaleGeometry A0 are open.
  - Remaining: Integral effectivity is planned in rank one, given an integral eigenfunction (the form the sources use); descent of integral lattices of higher rank is not treated in the sources read.

## Structure

- **P8's stage text attributes the invariant affinoid-cover hypothesis to Hansen–Johansson §5.** The hypothesis is that of Hansen 2016 (Theorems 1.1, 1.3(i), 1.4). Hansen–Johansson §5.1 removes it: their Theorems 5.3 and 5.8 assume separation (resp. analytic separation) and that closures of rank-one points lie in affinoids, and show that the quotient then has an invariant affinoid cover. A future revision of the stage text could say 'Under Hansen's invariant affinoid-cover hypothesis, and under Hansen–Johansson's analytic separation hypothesis'. No change of structure is proposed.
- **Two general facts planned here for want of a foundational owner.** Conjugacy of the extensions of a valuation along a normal algebraic extension (P8/extensions-of-valuations-are-conjugate) and Galois descent of modules along a finite étale Galois extension of commutative rings (P9/finite-galois-descent-of-modules) are needed here, are not in Mathlib or Tau Ceti (Tau Ceti has the field case of descent and a function-field case of conjugacy), and no atlas layer plans them. They are planned in the generality the sources use. If a commutative-algebra roadmap acquires them, these nodes become imports.
- **Rigid finite quotients are planned in P8.** Finite quotients of rigid spaces (Hansen Theorems 1.3 and 3.4, CHJ §6.4, HJ Theorem 5.3) are used at finite level by the good-tower quotient theorem and have no other owner, so P8 plans them alongside the perfectoid quotients.
