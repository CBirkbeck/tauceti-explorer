# ASM-ArithmeticKTheory — assembly handoff

Agent: Codex, session codex-1SZM4P. Issue: #214. Submission: complete assembly.

## Delivered

[The combined roadmap](../readmes/ArithmeticKTheory.md) contains all 76 nodes in
N.1–N.8, with purpose, scope, supplier boundaries, unified conventions, source
register, layer overview, exact statements, proof obligations, APIs, tests,
source corrections and baseline declarations. All 11 recorded gaps remain
visible. [The combined suggested file](../suggested/ArithmeticKTheory.lean)
has one standard note, one deduplicated import block and consistent namespaces.
The originals of both part documents and suggested files are untouched.

The [N.1 packet](../packets/ArithmeticKTheory--N.1.json) is unchanged. Its
`accepted` verdict by independent-review-REV-FIX-RT-AREA-ktheory-1, dated
30 September 2026, remains its original scoped verdict; it does not certify
subsequent revisions or this assembly. The [N.7 packet](../packets/ArithmeticKTheory--N.7.json)
keeps its `needs_changes` verdict by
independent-review-REV-FIX-RT-BP-ArithmeticKTheory--N.7, dated 2 October 2026,
and all review history. Assembly does not accept either part afresh. Every
node's implementation status remains `unchecked`.

## Reviewed mathematics changed: schedule re-review

`ArithmeticKTheory:N.7/w-invariant` previously repeated N.4's definition and
identified the invariant with ordinary roots of unity in a cyclotomic field.
That identification is invalid for a Tate twist. It is now a theorem node,
“Bernoulli denominator comparison for N.4's invariant”, importing
`N.4/the-w-invariant`, `N.4/exponent-criterion`,
`N.4/finiteness-of-the-w-invariant` and
`N.4/w2-of-the-rationals-and-the-divisibility-tests` by full node id.
N.4 owns the only definition. Its fixed points use the cyclotomic i-th action;
ordinary roots of unity identify only weight one. In particular w₂(ℚ)=24,
although ℚ has only two roots of unity.

The N.7 comparison explicitly restricts the Bernoulli formula and prime
criterion to positive even weights, and states evenness for positive weights.
The weight-two acceptance check now reads B₂/4=(1/6)/4 with denominator 24,
replacing the erroneous B₁/8. The odd rational comparison is retained. The
planet names the comparison rather than a second invariant. The API imports
`TauCeti.wInvariant` and the combined suggested file removes the second opaque
`wInvariant` definition. These mathematical and ownership changes need
independent re-review; the existing verdicts were not changed.

`N.7/regular-prime-torsion-consequences` now names N.5's Harris–Segal summand
and odd torsion theorem, and N.6's even-group and mod-l theorems as explicit
prerequisites. `N.7/vandiver-separation` now names N.5's real table and N.6's
odd-prime and dyadic comparisons. The vague internal request to N.5 is removed.
These reference fixes do not change their mathematical conclusions.

The graded regular-prime consequence also needs finite-coefficient K-theory,
products and a Bott action. The integral N.5/N.6 nodes do not supply them.
A precise gap is added to the consuming N.7 packet, extending the existing
N.1 finite-coefficient gap. N.7's coverage is honestly `planned` with that
remaining obligation; its packet status remains `complete` in the protocol's
planning sense. The Bernoulli comparison's downstream Birch–Tate use points to
SpecialValuesBirchTate B.3, whose check consumes the independent N.8 certificate.

## Suggested-file integration and checks

The combined prototype uses `TauCeti.ArithmeticK` consistently for the arithmetic
sections. Available Bernoulli and regular-prime APIs and tests use their packet
names. The inherited N.6 `OrderCertificate` declarations are activated on
Mathlib's `Module.Relations` and `Module.Presentation`, with the corresponding
imports; the upper span bound and the independent finite quotient remain
separate fields. The certificate engine has one owner, N.6. Its arithmetic
instances still need the actual K-group interfaces.

The signature-defect comment is reconciled with the current N.1 statement:
the Selmer sign-map definition applies to all S, and its étale identification
requires 1/2 in O_S. The obsolete comment describing an earlier packet
contradiction is removed. No N.1 mathematics is changed. Missing higher
K-theory, cyclotomic class-group actions, Q-construction and comparison
interfaces remain exact supplier-labelled omissions. A name register does
not claim that a commented signature or test elaborates.

Checks performed:

- `python3 scripts/check_blueprint.py research/blueprint/packets/ArithmeticKTheory--N.1.json research/blueprint/packets/ArithmeticKTheory--N.7.json`:
  zero errors and zero warnings for both packets.
- Assembly inventory: all 76 node ids, statements, hypotheses, proof steps,
  acceptance checks, API entries and unit-test statements occur in the reader;
  all API and test names occur in the suggested file. All local node references
  resolve, their dependency graph is acyclic, and reader anchors are unique
  and resolve. The handoff contains all 34 supplier requests and 19 ownership
  proposals from the current part packets.
- `git diff --check`: clean. Only the four assembly deliverables change.
- Full suggested Lean file: **not compiled successfully**. `lean-check` stops
  during imports because the existing shared build has no prebuilt object for
  `TauCeti.Algebra.Category.ModuleCat.CartanMap`. Other needed Tau Ceti objects
  are also absent. Mathlib is at the required 082e2d3 pin; an alternative
  existing build has a different Mathlib pin and was not used. No library was
  built, updated or downloaded.
- Two isolated component checks with `lean-check` exited zero: the actual N.6
  certificate declarations and tests on their Mathlib carriers, and those
  declarations plus the N.7/N.8 arithmetic signatures and tests that require
  only Mathlib. Their only warnings mark `sorry` declarations. The latter
  excludes w-invariant comparisons, which require unavailable Tau Ceti
  imports. These component results do not establish full-file elaboration.

To reproduce the component checks, extract the active
`namespace TauCeti` certificate block and, for the second check, the final
`namespace TauCeti.ArithmeticK` block, excluding its w-invariant subsection.
Use the combined file's Mathlib imports and its noncomputable/universe setup.
No scratch file is needed to continue the mathematical work. Once a shared
build at both pinned commits supplies all imported Tau Ceti objects, run
`lean-check research/blueprint/suggested/ArithmeticKTheory.lean` and resolve any
new declaration-level errors before claiming full-file elaboration.

## Remaining work and ownership decisions

The N.8 Gaussian and real-quadratic upper-generation proofs added by the
preceding revision are included faithfully, without changing their conclusions.
Their independent review is still outstanding. The real-quadratic chain uses
K₂ of ℚ(ζ₅), whose construction of small residue generators depends on the
recorded Skalba generalised-Thue source gap. Review that input and both bounds
of each certificate. Do not replace an upper or lower bound by a Birch–Tate
order calculation. The Washington Kummer and original Herbrand–Ribet proof
sources remain recorded gaps in N.7.

Assign one owner for finite-coefficient products/Bott action, then decompose
K-book VI.10.6 against that interface. The other N.1 source and proof gaps
remain in its packet and the combined reader. None is silently closed by
assembly.

The 19 proposals below preserve the parts' text, including its historical
updates. For application, the final ownership direction takes precedence:

- T.5 supplies N.2's degree-two tame-kernel row; the earlier N.2 → T.5 direction
  is superseded. T.5 proves its sequence without N.2. N.5 owns Soulé's theorem,
  avoiding a N.2 → finite-generation → N.2 cycle.
- N.4 and N.3:ranks supply B.1; N.8 supplies B.3's real-quadratic certificate.
  The special-values roadmap supplies no certificate bound to N.8.
- N.6 owns the certificate engine; N.8 owns its Tate-method instances. Moving
  Tate's two method nodes to N.6 is a conditional future ownership proposal
  if another consumer appears, not an applied move in this assembly.
- The existing external K3BlochGroups V.2 / N.5 cycle note is retained for the
  maintainer. This run checked the combined local graph, not a fresh proof
  that every current atlas-plus-packet dependency is acyclic. Revalidate that
  external proposal against the current full graph before applying it.

The new N.4 → N.7 and N.5/N.6 → N.7 node-level dependencies must be reflected
when atlas stage edges are next reconciled. No campaign document, atlas data,
neighbouring packet or existing Tau Ceti roadmap was edited in this job.

## Supplier requests from the parts

### N.1–N.6: 25 requests

#### 1. KTheoryLowDegrees:Z.4

(1) K₀(A) ≅ ℤ ⊕ Pic(A) by rank and determinant for a Dedekind domain A (KTheoryLowDegrees:Z.4/rank-pic-equivalence), used for A = S.integer F, with Pic compared to the class group (Mathlib's ClassGroup.equivPic) and Cl(O_{F,S}) ≅ Cl(𝓞_F)/⟨[𝔭] : 𝔭 ∈ S⟩ taken from Tau Ceti's IsDedekindDomain.integerClassGroupEquiv; this is N.1's target 'Import Z ... to obtain K₀(O_{F,S}) ≅ Z ⊕ Cl(O_{F,S})', and the former node N.1/K0-of-S-integers is deleted in its favour. (2) The restriction-of-scalars formula det_R(Res P) = Norm(det P)·det_R(R′)^{rank P} for the finite projective extension O_{F,S} ⊂ O_{F′,S′}. Z.4: 'Specialise to O_F and O_{F,S}, using the actual localised ring and the quotient of the class group by classes of primes in S. Compute the induced maps under localisation, extension of number fields and finite-flat restriction of scalars. The transfer of an ideal class requires the determinant/norm formula'. Z.4 is upstream of N.1, so its specialisation should be stated for Mathlib's Set.integer, which Tau Ceti already makes a Dedekind domain; the presentation of O_{F,S} as a localisation and its independence are N.1's ('Prove independence of a chosen presentation of O_{F,S} as a localisation') and must not be re-planned in Z.4's remaining item 'the number-field S-integer ring identification'. (3) The Steinitz classification P ≅ A^{n−1} ⊕ I, with P determined by rank and det P (Z.4/steinitz, Z.4/projective-classification), which counts the components of the strata of Quillen's rank filtration (N.3:finite-generation/rank-filtration) and the classes used in N.3:finite-generation/steinberg-homology-of-automorphism-groups.

Needed by: `ArithmeticKTheory:N.1/norms-transfers-and-pullbacks`; `ArithmeticKTheory:N.2/the-three-classical-rows`; `ArithmeticKTheory:N.2/even-degree-injectivity`; `ArithmeticKTheory:N.3:finite-generation/quillen-finiteness-criterion`; `ArithmeticKTheory:N.3:finite-generation/rank-filtration`; `ArithmeticKTheory:N.3:finite-generation/steinberg-homology-of-automorphism-groups`.

#### 2. KTheoryLowDegrees:U.4

SK₁(O_{F,S}) = 0 (Bass–Milnor–Serre), K₁(O_{F,S}) ≅ O_{F,S}^× by the determinant, O_{F,S}^× ≅ μ(F) ⊕ ℤ^{r₁+r₂+|S|−1}, and the comparison with the unit inclusion into K₁(F). U.4: 'Prove the Bass–Milnor–Serre result needed for SK₁(O_{F,S})=0, with F a number field and S finite ... Combine determinant with Dirichlet's S-unit theorem to identify K₁(O_{F,S}) ≅ O_{F,S}^×, O_{F,S}^× ≅ μ(F)⊕ℤ^{r₁+r₂+|S|−1} ... Compare finite-field and local-ring specialisations and the unit inclusion into K₁(F).' U.4 is upstream of N.1 through U.5, which the atlas lists. N.3:ranks cites U.4's Dirichlet S-unit theorem for the rank r₁ + r₂ + |S| − 1 of K₁(O_{F,S}), the degree-one exception to the period-four pattern (RT-AREA-ktheory-1/24 and /7); the checkpointed KTheoryLowDegrees U.1 packet plans it as U.4/s-unit-theorem, which this packet will cite by id once that packet is accepted.

Needed by: `ArithmeticKTheory:N.1/K1-of-S-integers-and-the-determinant`; `ArithmeticKTheory:N.5/soule-theorem`; `ArithmeticKTheory:N.1/transfer-and-norm-on-units`; `ArithmeticKTheory:N.2/even-degree-injectivity`; `ArithmeticKTheory:N.3:ranks/borel-rank-theorem`.

#### 3. BorelRegulators:R.1

The arithmetic-group input to Quillen's finite generation theorem, with R.1 as its single owner (RT-AREA-ktheory-1/1): (i) the Tits building T(V) of a finite-dimensional F-vector space V (the poset of proper non-zero subspaces, empty when dim V = 1), functorial in linear isomorphisms and GL(V)-equivariant; (ii) the Solomon–Tits theorem, T(V) ≃ a wedge of (dim V − 2)-spheres for dim V ≥ 2; (iii) the Steinberg module St(V) = H̃_{dim V−2}(T(V); ℤ), a free abelian group with its GL(V)-action (St(V) = ℤ for dim V = 1; reduced homology in dimension two); (iv) the correctly twisted arithmetic duality: for a number field F with r₁ real and r₂ complex places and a torsion-free subgroup G of finite index in GL_n(𝓞_F), H^{vcd−i}(G; M) ≅ H_i(G; M ⊗ D) with vcd = r₁·n(n+1)/2 + r₂·n² − n and integral coefficients, where D = St_n(F) ⊗ ℤ_χ^{⊗(n−1)} and χ = N_{F/ℚ} ∘ det : GL_n(𝓞_F) → {±1} (Putman–Studenmund, arXiv:1909.01217v4, Theorem C, p. 4, and the duality display, p. 2; the untwisted St_n(F) is wrong when n is even and 𝓞_F^× has an element of norm −1, their Example 1.4), or equivalently the untwisted duality for G ⊂ ker χ followed by descent; built on the Borel–Serre bordification from ArithmeticLocallySymmetricSpaces ALS.2 and its finite-level cohomology, with boundary ≃ T_n(F) and the orientation behaviour of their Proposition 2.1; (v) the finiteness consequence that N.3 imports: for every n ≥ 1 and every subgroup Γ ⊂ GL_n(F) commensurable with GL_n(𝓞_F), H_i(Γ; St_n(F)) is a finitely generated abelian group for every i ≥ 0 — integrally, not only after ⊗ ℚ — by (iv) for a torsion-free normal subgroup G ⊂ Γ ∩ GL_n(𝓞_F) of finite index (a finite K(G, 1) from the compact Borel–Serre quotient makes H^*(G; M) finitely generated for finitely generated M) and the Hochschild–Serre spectral sequence H_p(Γ/G; H_q(G; St)) ⇒ H_{p+q}(Γ; St) for the finite group Γ/G; n = 1 is the elementary case Γ ⊂ F^× commensurable with 𝓞_F^×. N.3 keeps the rank filtration, the commensurability of Aut_A(P) with GL_n(𝓞_F) for nonfree P, the low ranks and the assembly, and does not re-prove (i)–(v). R.1's text claims 'the finite-type homotopy consequences needed by K-theory'; what K-theory needs is exactly (v), and N.3's stage text should drop its clause 'Develop the arithmetic-group finiteness and finite-type homotopy input' (maintainer). Atlas edge R.1 → N.3:finite-generation exists; no cycle.

Needed by: `ArithmeticKTheory:N.3:finite-generation/layer-poset-is-the-suspended-building`; `ArithmeticKTheory:N.3:finite-generation/steinberg-homology-of-automorphism-groups`.

#### 4. BorelRegulators:R.3

Borel's rank theorem for orders, 𝓞_F included (K-book IV.1.17 and IV.1.18): for an order R in a finite-dimensional semisimple ℚ-algebra A, K_n(R) ⊗ ℚ ≅ K_n(A) ⊗ ℚ for n ≥ 2; for a number field F with r_1 real and r_2 complex places, dim_ℚ K_n(𝓞_F) ⊗ ℚ = dim_ℚ K_n(F) ⊗ ℚ = r_1 + r_2, r_2 or 0 for n ≥ 2 according as n ≡ 1 (mod 4), n ≡ 3 (mod 4) or n even. Used with A = F and R = 𝓞_F. The S-integer case is N.3:ranks's (RT-AREA-ktheory-1/7): 𝓞_{F,S} with S ≠ ∅ is not an order, and the passage uses N.2's localisation sequence and L.1, which are not R.3's ancestors; R.3's text should drop 'Include the commutative order and S-integer cases via the appropriate comparison/localisation results' for the S-integer part (maintainer; BorelRegulators' blueprint job). The higher regulator is not needed here; it is R.4's. Atlas edge R.3 → N.3:ranks exists; no cycle.

Needed by: `ArithmeticKTheory:N.3:ranks/borel-rank-theorem`.

#### 5. GeneralAlgebraicKTheory:K.1

The K-groups K_n(C) = π_{n+1}(|NQ(C)|, 0) of an exact category, natural in exact functors, with π₁NQ(C) identified with ExactK0 and K_n(R) = K_n(P(R)) for a ring: used by N.2's localisation sequences and finite support, by Quillen's finiteness criterion (whose proof filters Q(P(R)) by rank) and by the e-invariant. K.1: 'Define K_n(C)=π_(n+1)(|NQ(C)|,0) for every natural number ... natural in exact functors ... Prove that π₁ NQ(C) is the existing ExactK0'. Two things the earlier request asked of K.1 are not in its text: Quillen's computation of K_*(𝔽_q) is KTheoryFiniteLocalFields L.1's, and compatibility with filtered colimits is GeneralAlgebraicKTheory K.7's. The rank filtration also uses the node K.1/exact-categories-and-Q-construction (morphisms of Q(A) as admissible layers, the isomorphisms of Q(A) as those of A, QCat.hom_zero) and K.1/K-groups-of-exact-categories (K_n = π_{n+1} BQ), cited by id.

Needed by: `ArithmeticKTheory:N.2/finite-support`; `ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers`; `ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain`; `ArithmeticKTheory:N.2/the-three-classical-rows`; `ArithmeticKTheory:N.2/localisation-sequence-and-finite-extensions`; `ArithmeticKTheory:N.3:finite-generation/quillen-finiteness-criterion`; `ArithmeticKTheory:N.5/e-invariant`; `ArithmeticKTheory:N.3:finite-generation/rank-filtration`; `ArithmeticKTheory:N.3:finite-generation/comma-category-is-the-layer-poset`; `ArithmeticKTheory:N.3:finite-generation/rank-spectral-sequence`.

#### 6. GeneralAlgebraicKTheory:K.3

Quillen localisation for the Serre subcategory M_s(R) ⊂ M(R) with quotient M(R[1/s]), dévissage for finite-length torsion modules, and the resolution theorem giving K = G for Dedekind domains and fields. K.3: 'Prove dévissage for an appropriate full abelian subcategory closed under subobjects and quotients, with a finite filtration of every object ... Prove the resolution theorem ... Prove Quillen localisation for a Serre subcategory of a small abelian category and its quotient.' The projection formula, which this request also asked of K.3, is not in K.3's text; it is KTheoryLowDegrees U.5's (against K₀) and GeneralAlgebraicKTheory K.7's ('compatibility with ... transfers').

Needed by: `ArithmeticKTheory:N.1/norms-transfers-and-pullbacks`; `ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain`; `ArithmeticKTheory:N.2/finite-support`; `ArithmeticKTheory:N.2/localisation-sequence-and-finite-extensions`; `ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers`.

#### 7. K2SymbolsBrauer:T.5

The tame kernel as a group and its exact sequences, which N.2 and N.6 import (RT-AREA-ktheory-1/9): T.5/unramified-subgroup (the tame kernel, defined by the vanishing of the tame symbols), T.5/tame-kernel-sequence (0 → K_2(O_F) → K_2(F) → ⊕_𝔭 k(𝔭)^× → 0, with injectivity from K_2(𝔽_q) = 0 and surjectivity from SK_1(O_F) = 0) T.5/s-integer-tame-kernel-sequence (0 → K_2(O_{F,S}) → K_2(F) → ⊕_{𝔭∉S} k(𝔭)^× → 0, residues at the primes outside S) and T.5/relative-s-integer-sequence (0 → K_2(O_F) → K_2(O_{F,S}) → ⊕_{𝔭∈S} k(𝔭)^× → 0, residues at the primes in S), stated separately. N.2/the-three-classical-rows identifies the degree-two segment of its localisation sequence with these sequences and does not re-prove them; the import is acyclic because T.5 derives them from K2SymbolsBrauer T.3/dedekind-localization-boundary and KTheoryLowDegrees U.4 (RT-AREA-ktheory-1/26) and lists no ArithmeticKTheory:N.2 prerequisite (the K2SymbolsBrauer packet revised for the same findings; its request to N.2 is withdrawn). The certificate format is no longer requested: it is N.6/order-certificate, and T.5 drops its competing certificate paragraph and T.5/certified-presentation (RT-AREA-ktheory-1/9).

Needed by: `ArithmeticKTheory:N.2/the-three-classical-rows`; `ArithmeticKTheory:N.2/even-degree-injectivity`; `ArithmeticKTheory:N.6/tame-and-wild-kernels`.

#### 8. K2SymbolsBrauer:T.7

T.7/classical-local-symbols (the Hilbert symbols of local fields, with their normalisation) and T.7/twisted-roots-of-unity (the trivialisation of μ_ℓ^{⊗i} by a root of unity in F). Tate's comparison K_2/m ≅ H² and its S-integer extension are no longer requested from T.7: MotivicEtaleKTheory M.3 owns them (RT-AREA-ktheory-1/8; request to M.3). The twisted coefficient modules themselves are MotivicEtaleKTheory M.1's (reviewed T.7/twisted-roots-of-unity: 'The twists themselves are M.1's'), so N.4 imports them from M.1 (a separate request); no N.4 node depends on T.7.

Needed by: `ArithmeticKTheory:N.6/tame-and-wild-kernels`; `ArithmeticKTheory:N.6/l-rank-from-class-group-data`.

#### 9. MotivicEtaleKTheory:M.7

(a) For ℓ odd, or ℓ = 2 with F totally imaginary, and R = O_S[1/ℓ], i ≥ 1: K_{2i}(R; ℚ_ℓ/ℤ_ℓ) ≅ H^0(R; ℚ_ℓ/ℤ_ℓ(i)), K_{2i−1}(R; ℚ_ℓ/ℤ_ℓ) ≅ H^1(R; ℚ_ℓ/ℤ_ℓ(i)), K_{2i−1}(R; ℤ_ℓ) ≅ H^1(R; ℤ_ℓ(i)) and K_{2i}(R; ℤ_ℓ) ≅ H^2(R; ℤ_ℓ(i+1)), natural in R, with the vanishing and finiteness statements of the source's Exercises VI.8.1–8.3 (proof of VI.8.2). M.7's text: 'At odd ℓ and j≥2 the expected arithmetic outputs identify K_{2j−1} with H¹ of twist j and K_{2j−2} with H² of twist j after the stated ℓ-adic passage.' (b) At 2 with real places, Theorem VI.9.4: for O_S ⊇ O_F[1/2], α^1_S(4k) is onto for k > 0 and K_n(O_S; ℚ_2/ℤ_2) is given by the eight-row table, with the non-split extension in degree 8k+4 detected by comparison with ℝ and the undetermined extension in degree 8k+5, all induced by the natural morphism of descent spectral sequences to r_1 copies of that of ℝ (with Lemma VI.9.3 and the spectral sequences of ℝ, Theorem VI.9.1 and Variant VI.9.1.2); M.7's text: 'At 2 with real places, prove the corrected long exact sequences and extension data'. AUDIT-27 records M.7 as the owner of N.5's real two-primary calculation. (c) The bounds j(O_F[1/2]) ≤ ρ ≤ r_1 − 1 of Corollary VI.9.10 from the edge map of the mod-2 spectral sequence. M.7 owns the whole dyadic calculation (RT-AREA-ktheory-1/3): the real-place spectral sequences whose differentials are fixed by Suslin's theorem K_n(ℝ; ℤ/m) ≅ π_n(BO; ℤ/m) for n ≥ 1 (K-book VI.3.1, PDF p. 483; degree zero identified separately) and real topological K-theory, as used in VI.9.1–9.4; N.5 and N.6 import its output — the groups of Theorem VI.9.4, the real-place maps α^n_S(i) to ⊕_{real} H^n(ℝ; −) and to K_*(ℝ; ℚ_2/ℤ_2), and the extension data, with their naturality — and perform no second dyadic calculation.

Needed by: `ArithmeticKTheory:N.5/odd-torsion-at-a-prime-where-cd-is-two`; `ArithmeticKTheory:N.5/the-real-case-modulo-eight`; `ArithmeticKTheory:N.6/even-groups-at-odd-primes`; `ArithmeticKTheory:N.6/the-two-primary-corrections`; `ArithmeticKTheory:N.6/order-ratio-for-totally-real-fields`; `ArithmeticKTheory:N.6/divisible-subgroup-and-the-wild-kernel`; `ArithmeticKTheory:N.5/e-invariant`.

#### 10. MotivicEtaleKTheory:M.8

The étale Chern classes K_{2i−1}(O_S; ℤ_ℓ) → H^1(O_S[1/ℓ]; ℤ_ℓ(i)) and their agreement with M.7's comparison maps, compatible with the maps induced by O_S ⊂ O_{S'} and by finite extensions (M.8's text: 'Construct étale Chern classes ... Prove compatibility with the higher K-theory Chern character, residues, norms and products'). This is the naturality of the identifications that N.5's text requires ('the e-invariant/Chern maps, their kernels and the extension classes used to obtain them must be natural'); AUDIT-27 records M.8 as its owner. M.8 is not in N.5's atlas requirements; the edge M.8 → N.5 is acyclic in the atlas, but K3BlochGroups' packet imports N.5 into V.2, which with Polylogarithms P.2 → BorelRegulators R.7 → M.8 closes a cycle (see restructure).

Needed by: `ArithmeticKTheory:N.5/odd-torsion-at-a-prime-where-cd-is-two`.

#### 11. KTheoryLowDegrees:U.3

The determinant splitting K₁(A) = A^× ⊕ SK₁(A) for commutative A and SK₁ = 0 for fields, so that K₁(F) = F^× and K₁(k(𝔭)) = k(𝔭)^×. U.3: 'For commutative A construct the stable determinant and its section from Aˣ. Define SK₁(A) as its kernel and prove the split decomposition as abelian groups. Prove SK₁ vanishing for fields and commutative semilocal rings'. U.3 is upstream of N.1 (U.3 → U.4 → U.5 → N.1).

Needed by: `ArithmeticKTheory:N.1/K1-of-S-integers-and-the-determinant`; `ArithmeticKTheory:N.2/the-three-classical-rows`.

#### 12. KTheoryLowDegrees:U.5

Transfer by restriction of scalars for the finite projective extension O_{F,S} ⊂ O_{F′,S′}, its agreement with the field norm on units, the projection formula against K₀, and the valuation convention for the degree-one boundary. U.5: 'For a finite projective algebra extension construct transfer by restriction of scalars. Prove that, on a field's unit group, this agrees with the field norm. Prove the projection formula against K₀, and the boundary map from a discrete valuation field's units to K₀ of its residue field equals the valuation with the chosen convention.' The atlas lists U.5 as a prerequisite of N.1.

Needed by: `ArithmeticKTheory:N.1/norms-transfers-and-pullbacks`; `ArithmeticKTheory:N.1/transfer-and-norm-on-units`; `ArithmeticKTheory:N.2/the-three-classical-rows`.

#### 13. GeneralAlgebraicKTheory:K.7

Filtered-colimit compatibility of K-theory for rings (K_n(F) = colim_s K_n(R[1/s])), finite-product compatibility, and products compatible with localisation boundaries and transfers (the K_*(R)-module structure of (6.6) and the projection formula in all degrees). K.7: 'Prove Morita invariance, finite-product compatibility, filtered-colimit compatibility for rings ... Prove compatibility with relative groups, localisation boundaries and transfers.' The atlas lists K.7 as a prerequisite of N.1.

Needed by: `ArithmeticKTheory:N.2/finite-support`; `ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain`.

#### 14. KTheoryFiniteLocalFields:L.1

Quillen's finite-field calculation K₀(𝔽_q) = ℤ, K_{2j}(𝔽_q) = 0 and K_{2j−1}(𝔽_q) ≅ ℤ/(q^j − 1) for j ≥ 1 (K-book IV.1.13), with the determinant in degree one and the restriction and transfer maps for finite extensions. It gives the residue terms of the localisation sequences in N.2 and N.3 (at primes over ℓ they have no ℓ-torsion), the even-degree injectivity and Soulé's theorem, Corollary VI.1.5.2 in N.5, and the odd-prime computations of N.6. L.1: 'Prove, for every finite field with q elements and every j≥1, K₀(𝔽_q)=ℤ, K_{2j}(𝔽_q)=0, K_{2j−1}(𝔽_q)≅ℤ/(q^j−1) ... Construct the restriction and transfer maps for finite extensions and prove their formulas'. The atlas lists L.1 as a prerequisite of N.2; no cycle.

Needed by: `ArithmeticKTheory:N.2/even-degree-injectivity`; `ArithmeticKTheory:N.5/soule-theorem`; `ArithmeticKTheory:N.5/soule-mod-l-surjectivity`; `ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers`; `ArithmeticKTheory:N.3:ranks/borel-rank-theorem`; `ArithmeticKTheory:N.3:ranks/even-K-groups-of-the-field-are-infinite-torsion`; `ArithmeticKTheory:N.5/harris-segal-summand`; `ArithmeticKTheory:N.5/odd-torsion-at-a-prime-where-cd-is-two`; `ArithmeticKTheory:N.6/even-groups-at-odd-primes`; `ArithmeticKTheory:N.6/l-rank-from-class-group-data`.

#### 15. MotivicEtaleKTheory:M.1

The Tate twists ℚ/ℤ(j), j ∈ Z, of a field F as discrete G_F-modules: ℚ/ℤ(j) = ⊕_{ℓ ≠ char F} ℚ_ℓ/ℤ_ℓ(j), ℚ_ℓ/ℤ_ℓ(j) = colim_ν µ_{ℓ^ν}^{⊗j}, with g ∈ G_F acting through χ_ℓ(g)^j for Mathlib's cyclotomicCharacter; equivalently the K-book's µ(j) of Definition VI.1.7 (the group µ(F^s) with g acting by ζ ↦ g^j(ζ)); weight one is the colimit of Tau Ceti's KummerCoeff F ℓ^ν. M.1's text: 'Import finite/continuous Tate twists ... Q/Z(j) uses primewise compatible twists, not the ordinary tensor power of Q/Z.' Atlas: N.4 requires MotivicEtaleKTheory:M.1; no cycle. N.6 also needs, from the same stage, the finite and continuous twists μ_m^{⊗j}, ℤ_ℓ(j) and ℚ_ℓ/ℤ_ℓ(j) with the coefficient and Bockstein sequences for ℤ_ℓ(j) → ℤ_ℓ(j) → μ_ℓ^{⊗j}; the étale cohomology of O_S[1/ℓ] with these coefficients and the Kummer sequence are requested from MotivicEtaleKTheory M.2.

Needed by: `ArithmeticKTheory:N.4/the-w-invariant`; `ArithmeticKTheory:N.4/exponent-criterion`; `ArithmeticKTheory:N.6/even-groups-modulo-l`; `ArithmeticKTheory:N.6/l-rank-from-class-group-data`; `ArithmeticKTheory:N.6/signature-defect`; `ArithmeticKTheory:N.6/order-ratio-for-totally-real-fields`.

#### 16. StableHomotopyKTheory:H.2

Quillen's Theorems A and B and the long exact homotopy sequence of a homotopy fibre, and the homotopy theory of categories that the rank spectral sequence of N.3:finite-generation uses: (a) Theorem A for maps of posets, applied to the poset of layers J(V) and to the interval poset of the Tits building; (b) Thomason's theorem δN(D, F) ≃ N(D ∫ F) for a functor F : D → Cat and the resulting spectral sequence E²_{p,q} = H_p(D, H_q(T ↓ −)) ⇒ H_{p+q}(C) for a functor T : C → D (Kahn, arXiv:1108.2441v3, 1.4.3–1.4.6); (c) for a cellular functor T : C → D (fully faithful, no morphism from D − C to C) the homotopy cocartesian square and long exact sequence ⋯ → H_i(D − C, F̃_T) → H_i(C) → H_i(D) → H_{i−1}(D − C, F̃_T) → ⋯, and the spectral sequence of a sequence of cellular functors with Q = colim Q_n (Kahn 2.3.6, 2.3.7, 2.4.1). H.2's text: 'Prove Quillen's Theorem A from contractible comma categories. Prove Theorem B with its homotopy-fibre hypothesis on transition functors ... Develop the bisimplicial diagonal/iterated-realisation comparison and the levelwise-equivalence theorem'. Atlas edge H.2 → N.3:finite-generation exists; no cycle.

Needed by: `ArithmeticKTheory:N.3:finite-generation/layer-poset-is-the-suspended-building`; `ArithmeticKTheory:N.3:finite-generation/rank-spectral-sequence`.

#### 17. KTheoryFiniteLocalFields:L.2

The prime-to-p part of the K-theory of a p-adic local field E with residue field F_q: K_{2i−1}(E){ℓ} ≅ Z/w_i^{(ℓ)}(E) for ℓ ≠ p, detected by the e-invariant (K-book Example VI.2.3.1 and Exercise VI.1.3), used in the proof of the Harris–Segal theorem. L.2's text: 'Deduce the prime-to-residue-characteristic part of local-field K-theory.' L.2's upstream contains no ArithmeticKTheory stage; no cycle.

Needed by: `ArithmeticKTheory:N.5/harris-segal-summand`.

#### 18. KTheoryFiniteLocalFields:L.7

The maps K_{2i}(F) → K_{2i}(F_v) to the completions of a number field, their compatibility with the localisation boundary K_{2i}(F) → K_{2i−1}(k(v)) and with restriction along finite extensions (L.7's text: 'Prove compatibility of local restriction/transfer, arithmetic Chern classes, Hilbert symbols, and cyclotomic traces with completion of a number field at a finite place. This supplies N's local conditions'). N.6's atlas entry already requires L.7.

Needed by: `ArithmeticKTheory:N.6/tame-and-wild-kernels`; `ArithmeticKTheory:N.6/divisible-subgroup-and-the-wild-kernel`.

#### 19. KTheoryFiniteLocalFields:L.3

Moore's theorem for a nonarchimedean local field E: K_2(E) is μ(E) plus a uniquely divisible group, the projection being the Hilbert symbol (L.3's text: 'the uniquely divisible kernel and the finite roots-of-unity quotient'), so that the kernel of K_2(F) → K_2(F_v) is the kernel of the Hilbert symbol at v.

Needed by: `ArithmeticKTheory:N.6/tame-and-wild-kernels`.

#### 20. MotivicEtaleKTheory:M.2

Tate–Poitou duality and the real places for O_S[1/ℓ]: cd_ℓ = 2 unless ℓ = 2 and r_1 > 0; the maps α^n_S(i) to ⊕_{real} H^n(ℝ; −) and the modified groups H̃^n = ker α^n, with α^2(4k) onto (M.2's text: 'Keep ordinary, positive and modified cohomology separate'); and the Brauer group sequence (8.1.1) for S containing a finite place.

Needed by: `ArithmeticKTheory:N.6/even-groups-modulo-l`; `ArithmeticKTheory:N.6/l-rank-from-class-group-data`; `ArithmeticKTheory:N.6/signature-defect`; `ArithmeticKTheory:N.6/the-two-primary-corrections`.

#### 21. MotivicEtaleKTheory:M.3

The Galois symbol K_2(F)/m → H²(F; μ_m^{⊗2}) with its symbol formula, and Tate's theorems: the local and global cases and the S-integer form K_2(O_{F,S})/ℓ^r ≅ H²_et(O_{F,S}; μ_{ℓ^r}^{⊗2}) when ℓ is invertible in O_{F,S} (M.3's text), used at ℓ = 2 for the row n = 2 of Theorem VI.9.11. M.3 is the single owner (RT-AREA-ktheory-1/8); N.6 cites it and not K2SymbolsBrauer T.7 for this theorem.

Needed by: `ArithmeticKTheory:N.6/the-two-primary-corrections`.

#### 22. StableHomotopyKTheory:H.6

The universal coefficient sequence 0 → π_n(E)/m → π_n(E/m) → π_{n−1}(E)[m] → 0 and its ℚ_ℓ/ℤ_ℓ and ℤ_ℓ limits (H.6's text), applied to K(R): if K_{n+1}(R) is finite then K_n(R){ℓ} ≅ K_{n+1}(R; ℚ_ℓ/ℤ_ℓ), and if K_n(R) is finite then K_n(R){ℓ} ≅ K_n(R; ℤ_ℓ) (the source's Ex. IV.2.6 and IV.2.9). Also Serre's theorem for the class of finitely generated abelian groups: for a simple space X (in particular a connected H-space) the integral homology groups H_i(X; ℤ), i ≥ 1, are all finitely generated if and only if the homotopy groups π_i(X), i ≥ 1, are; used to pass from the finitely generated homology of BQ(P(R)) to K_n(R) = π_{n+1} BQ(P(R)) in N.3:finite-generation/quillen-finiteness-criterion (with the rational Hurewicz theory of the same owner, RT-AREA-ktheory-1/33). H.6 → N.3:finite-generation is a new atlas edge; it is acyclic.

Needed by: `ArithmeticKTheory:N.5/odd-torsion-at-a-prime-where-cd-is-two`; `ArithmeticKTheory:N.5/the-real-case-modulo-eight`; `ArithmeticKTheory:N.6/even-groups-at-odd-primes`; `ArithmeticKTheory:N.6/the-two-primary-corrections`; `ArithmeticKTheory:N.3:finite-generation/quillen-finiteness-criterion`.

#### 23. StableHomotopyKTheory:H.1

Nerves of small categories and posets with their realisations, homotopies from comparable monotone maps, compatibility with finite products and with increasing unions of subcategories (homology commuting with the union), and the comparison of the homology of a one-object groupoid with local coefficients with group homology (H.1's text: 'Construct local coefficient systems and the comparison of bar homology with singular homology of BG'). Used by Quillen's rank filtration and its spectral sequence, and for the H-space structure on BQ(P(R)) given by direct sum. H.1 → N.3:finite-generation is a new atlas edge; it is acyclic.

Needed by: `ArithmeticKTheory:N.3:finite-generation/rank-filtration`; `ArithmeticKTheory:N.3:finite-generation/layer-poset-is-the-suspended-building`; `ArithmeticKTheory:N.3:finite-generation/rank-spectral-sequence`; `ArithmeticKTheory:N.3:finite-generation/quillen-finiteness-criterion`.

#### 24. SchemeKTheoryOperations:S.3

Regular-scheme localization with closed-point dévissage, finite/open support and naturality; N.2 supplies arithmetic residues, support, classical rows and extension compatibility.

Needed by: `ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain`; `ArithmeticKTheory:N.3:finite-generation/proper-curve-finite-generation`.

#### 25. MotivicEtaleKTheory:M.3

Kummer exact sequence for cyclotomic S-integers, functorial with Galois action and twist. Preserve unit classes, H¹ and Pic[p^m] as separate terms.

Needed by: `ArithmeticKTheory:N.6/keune-cyclotomic-picard-injection`.

### N.7–N.8: 9 requests

#### 1. K2SymbolsBrauer:T.5

The tame kernel and its exact sequences (T.5/unramified-subgroup, T.5/tame-kernel-sequence, T.5/relative-s-integer-sequence), the real sign symbol (T.5/real-sign-symbol), and the computations K₂(ℤ) ≅ ℤ/2 with generator {−1, −1} (T.5/k2-of-the-integers) and K₂(ℚ) ≅ K₂(ℤ) ⊕ ⊕_p 𝔽_p^×, infinite (T.5/k2-of-the-rationals), which N.8 imports and does not recompute (RT-AREA-ktheory-1/9). The certificate format is no longer requested from T.5: it is ArithmeticKTheory N.6/order-certificate, and T.5 drops its competing certificate paragraph. N.8's two generation proofs also use T.5/relative-s-integer-sequence for ℚ(ζ₅), the restriction clause of T.5/unramified-subgroup (unramifiedSubgroup_map_le) for ℚ(ζ₅)/ℚ(√5), and, from the same packet, T.4/restriction-transfer-degree and T.3/tame-symbol with its convention ∂_v{u, t} = ū.

The original request records its consumers in the contract text rather than a separate `neededBy` list.

#### 2. K2SymbolsBrauer:T.7

The twisted coefficient modules and the norm residue symbol. N.4’s invariant uses the twisted modules; N.7 imports that invariant by node id. Tate's comparison K₂/m ≅ H² is no longer requested from T.7: MotivicEtaleKTheory M.3 owns it (RT-AREA-ktheory-1/8), and N.7's tame-kernel vanishing theorem imports it from there (request to M.3).

The original request records its consumers in the contract text rather than a separate `neededBy` list.

#### 3. K3BlochGroups:V.5

The third K-group of the integers, of the rationals and of the Gaussian rationals. AUDIT-27 names V.5 as owning the order forty-eight and the Gaussian computation that N.8 records.

The original request records its consumers in the contract text rather than a separate `neededBy` list.

#### 4. MotivicEtaleKTheory:M.3

The Galois symbol and Tate's comparison K₂/m ≅ H²(μ_m^{⊗2}) for local and global fields and for rings of S-integers with the primes above m inverted, M.3 being its single owner (RT-AREA-ktheory-1/8): the first of the three inputs of N.7's tame-kernel vanishing theorem. N.8 also needs two consequences that Tate proves in §6 of 'Relations between K₂ and Galois cohomology' (Invent. Math. 36, 1976): Theorem (6.1), that for a global field F containing a primitive l-th root of unity z every element of order l of K₂F is {z, a} (used with l = 2, z = −1 for ℚ(√5)); and Theorem (6.2), the exact sequence 0 → μ_l ⊗ Pic O_S → K₂O_S/l → (∐_{v∈S−S_c} μ_l)_0 → 0 for S containing the archimedean places and those above l, with μ_l ⊆ F (used with l = 2 for ℚ(ζ₅) and ℚ(√5)). The general-field form of (6.1), K-book III.6.8 through Hilbert's Theorem 90 for K₂, has no owner (KTheoryFiniteLocalFields records the proposal of a K2SymbolsBrauer part for it); N.8 needs only the number-field case.

Needed by: `ArithmeticKTheory:N.7/tame-kernel-vanishing-at-a-regular-prime`; `ArithmeticKTheory:N.8/tame-kernel-of-q-zeta-five`; `ArithmeticKTheory:N.8/real-quadratic-upper-generation`.

#### 5. K2SymbolsBrauer:T.2

Matsumoto's presentation of the second K-group of a field by Steinberg symbols, the skew-symmetry and the relation between the symbol of an element with itself and with minus one, all used by the computations N.8 imports. Tate's method in N.8 (N.8/tate-norm-filtration, N.8/gaussian-tame-kernel-vanishes) uses the Steinberg identity (T.2/steinberg-identity), {a, a} = {a, −1} (T.2/symbol-consequences) and {r, −r} = 1 (T.2:symbols/symbol-negative-unit).

The original request records its consumers in the contract text rather than a separate `neededBy` list.

#### 6. KTheoryLowDegrees:U.6

K₁(ℤ) = {±1} by the determinant (SK₁(ℤ) = 0), and K₁(ℤ[1/p]) = ℤ[1/p]^× ≅ ℤ/2 ⊕ ℤ with the p-adic valuation as boundary, which N.8 imports for the first K-groups of the integers and the degree-one row of the ℤ[1/p] sequence (RT-AREA-ktheory-1/9). The checkpointed KTheoryLowDegrees U.1 packet plans them as U.6/K1-integers and U.6/K1-integers-away-from-p; N.8 will cite them by id once that packet is accepted. U.6 → N.8 is a new atlas edge; it is acyclic.

Needed by: `ArithmeticKTheory:N.8/k-groups-of-the-integers`; `ArithmeticKTheory:N.8/s-integer-sequence-for-one-inverted-prime`.

#### 7. KTheoryLowDegrees:Z.6

K₀(ℤ) = ℤ (with π₀ of the K-theory space), which N.8 imports for the first K-groups of the integers (RT-AREA-ktheory-1/9). The checkpointed KTheoryLowDegrees Z.3 packet plans it as Z.6/integers-test. Z.6 → N.8 is a new atlas edge; it is acyclic.

Needed by: `ArithmeticKTheory:N.8/k-groups-of-the-integers`.

#### 8. KTheoryFiniteLocalFields:L.1

Quillen's computation K₀(𝔽_q) = ℤ, K_{2i}(𝔽_q) = 0 and K_{2i−1}(𝔽_q) ≅ ℤ/(q^i − 1) for i ≥ 1 (K-book IV.1.13), which gives the residue terms of the localisation sequence of ℤ ⊂ ℤ[1/p] in N.8's example in every degree. The atlas already has L.1 upstream of ArithmeticKTheory (L.1 → N.2); no cycle.

Needed by: `ArithmeticKTheory:N.8/s-integer-sequence-for-one-inverted-prime`.

#### 9. IntegralIwasawaTheory:L3

Supply the single Vandiver(l) predicate for primes l, with its defining equivalence l not dividing the class number of Q(mu_l)^+, and transport along a rational cyclotomic-field isomorphism to NumberField.maximalRealSubfield (CyclotomicField l Q). Its Lean module/declaration is not yet published; N.7 records the import contract, not a second definition. The odd-character equivalence and conditional K-theory consequences remain in N.7.

Needed by: `ArithmeticKTheory:N.7/vandiver-separation`.

## Restructure proposals from the parts

### N.1–N.6: 15 proposals

#### 1. N.1's two computations are imports, and the stage text should name their owners

Kind: `note-duplicate-boundary`.

N.1's text says 'Import Z and U' for its two computations, and AUDIT-27 confirms that KTheoryLowDegrees Z.4 and U.4 own them. What N.1 owns is the carrier: the S-integers as a localisation of the ring of integers for a NUMBER FIELD, the independence of the presentation and the monotonicity in S, none of which is pinned; Tau Ceti's SInteger/Basic.lean says the S-integers are not in general a localisation of R. The stage text should name the two owners explicitly, as the other layers of this roadmap do, so that a reader does not plan the computations here. (Title corrected: N.1 is not a register; it owns the carrier theorems.)

#### 2. The totally imaginary hypothesis is a cohomological-dimension hypothesis and should be named as one

Kind: `note-hypothesis-boundary`.

N.5's odd-torsion node and N.6's even-groups node hold at the prime two only when the field is totally imaginary, because then the étale 2-cohomological dimension of O_S[1/2] is two; with a real embedding it is infinite (source: proof of VI.8.2, 'the étale ℓ-cohomological dimension of R (and of F) is 2, unless ℓ = 2 and r1 > 0', and the opening of VI.9). N.6's text speaks of 'real-place ... corrections' and N.5's text gives the r_1 > 0 table without the reason; both should say that the corrections are forced by the cohomological dimension, which is what explains the eight-fold tables.

#### 3. Soulé's odd isomorphism is proved in N.5, not N.2

Kind: `ownership`.

N.2's text ('In particular the odd-degree isomorphism for n≥3 is an additional theorem') and N.5's ('Prove K_{2j−1}(O_{F,S}) ≅ K_{2j−1}(F) for j≥2') both name it. Its proof (V.6.8, PDF p. 420: 'the fact that Kn(R) is finitely generated (IV.6.9)') needs N.3:finite-generation, which requires N.2 in the atlas, so a proof in N.2 closes the stage cycle N.2 → N.3:finite-generation → N.2. The theorem is planned as N.5/soule-theorem with its finite-coefficient input N.5/soule-mod-l-surjectivity; N.2 keeps the injectivity it can prove from its own inputs (N.2/even-degree-injectivity). N.2's text should point to N.5 for the odd-degree theorem. The N.3 nodes avoid Soulé's theorem for the same reason, and the former restatement N.5/odd-groups-of-ring-and-field-agree is removed in favour of N.5/soule-theorem.

#### 4. The tame-kernel sequence is K2SymbolsBrauer T.5's, and N.2 imports it

Kind: `ownership`.

N.2's text ('Derive the tame-kernel exact sequence ... from this one construction') and T.5's ('Prove 0 → K₂(O_F) → K₂(F) → ⊕ k(𝔭)^× → 0 ... For S-integers allow residues at S') both name it. RT-AREA-ktheory-1/9 (confirmed) makes T.5 the single owner of the degree-two tame-kernel sequences with their injectivity and surjectivity, and RT-AREA-ktheory-1/26 makes T.5 derive them from K2SymbolsBrauer T.3:localization-comparison and KTheoryLowDegrees U.4 rather than from N.2. N.2/the-three-classical-rows and N.2/even-degree-injectivity now import T.5/tame-kernel-sequence and T.5/s-integer-tame-kernel-sequence (edge T.5 → N.2). This reverses the earlier direction N.2 → T.5; it is acyclic because T.5's nodes no longer list ArithmeticKTheory:N.2 as a prerequisite (the K2SymbolsBrauer side of the same findings, which also adds T.3/dedekind-localization-boundary and T.5/relative-s-integer-sequence).

#### 5. The localisation presentation of O_{F,S} is N.1's; KTheoryLowDegrees Z.4 uses Set.integer

Kind: `ownership`.

KTheoryLowDegrees Z.4's coverage lists as remaining 'Decompose actual localization, its class-group quotient by inverted prime classes, the number-field S-integer ring identification, and extension of number fields'. N.1's text owns 'independence of a chosen presentation of O_{F,S} as a localisation and compatibility with enlarging S', and Z.4 is upstream of N.1, so Z.4 should specialise its K₀ theorem to Mathlib's Set.integer (a Dedekind domain by Tau Ceti) with the class-group quotient taken from Tau Ceti's integerClassGroupEquiv, and not re-plan the presentation.

#### 6. BorelRegulators R.3 and N.3:ranks both claim the S-integer rank formula

Kind: `note-duplicate-boundary`.

R.3's text: 'Include the commutative order and S-integer cases via the appropriate comparison/localisation results.' N.3:ranks's text: 'Apply R's independent stable cohomology theorem to deduce, for n≥2, rank K_n(O_{F,S}) = ...'. Confirmed as RT-AREA-ktheory-1/7: R.3 keeps Borel's rank theorem for orders, 𝓞_F included (K-book IV.1.17–1.18), and drops the S-integer case; N.3:ranks/borel-rank-theorem owns the passage from 𝓞_F to 𝓞_{F,S} through N.2's localisation sequence and L.1, with the degree-one S-unit exception (U.4). The localisation input is upstream of N.3:ranks and not among R.3's requirements, so no edge is added backwards into R.3.

#### 7. SpecialValuesBirchTate B.1 re-plans W_2(F) and its finiteness

Kind: `note-duplicate-boundary`.

B.1's text: 'define W_2(F)=H^0(F,Q/Z(2)), w_2(F)=#W_2(F). Use N's actual cyclotomic Galois module ... Prove finiteness and positivity of w₂. Use ... K₂(O_F) ... and its finiteness theorem.' Confirmed as RT-AREA-ktheory-1/10. The owners are N.4 (N.4/the-w-invariant, N.4/finiteness-of-the-w-invariant — finiteness and positivity —, N.4/computing-w-from-the-cyclotomic-character, N.4/two-primary-w-invariant) and N.3:ranks for the finiteness of K₂(𝓞_F) (N.3:ranks/even-K-groups-of-S-integers-are-finite). Proposal: add the atlas edges ArithmeticKTheory:N.4 → SpecialValuesBirchTate:B.1 and ArithmeticKTheory:N.3:ranks → B.1 (both acyclic) and have B.1 import those nodes instead of re-planning them. W₂ is the invariants of ℚ/ℤ(2), not the roots of unity of F.

#### 8. The e-invariant and the Harris–Segal summand belong to N.5

Kind: `note-move`.

The packet planned the e-invariant inside N.4/the-w-invariant and the Harris–Segal theorem inside N.4/exceptional-fields-at-two. Both are K-theory (they need K_{2i−1}(F) and Suslin's computation of the torsion of K_*(F^s)), N.4's only atlas requirement is MotivicEtaleKTheory M.1, and N.5's text is the one that names 'the e-invariant/Chern maps'. They are now N.5/e-invariant and N.5/harris-segal-summand, and N.4 contains no K-theory.

#### 9. Theorems VI.8.2 and VI.8.4 are split by degree between N.5 and N.6

Kind: `ownership`.

N.6 lies downstream of N.5 (N.6/the-two-primary-corrections imports N.5), but the proofs of N.5's tables use the odd rows of Theorem VI.8.2, which the packet had placed in N.6 without listing them as prerequisites. The odd rows are now N.5/odd-torsion-at-a-prime-where-cd-is-two and the even row stays in N.6/even-groups-at-odd-primes (the source proves them by two separate spectral-sequence arguments, with ℚ_ℓ/ℤ_ℓ and with ℤ_ℓ coefficients). Theorem VI.8.4 is split likewise: its odd row is N.5/totally-imaginary-integral-structure, its even row N.6/even-groups-of-a-totally-imaginary-field, and its rows n = 0, 1 are N.1's.

#### 10. The mod-2^∞ K-theory of real S-integers is MotivicEtaleKTheory M.7's

Kind: `ownership`.

Theorem VI.9.4 (with Lemma VI.9.3 and the spectral sequences of ℝ) is the 'corrected long exact sequences and extension data at 2 with real places' of M.7's text, and AUDIT-27 records M.7 as the owner of N.5's real two-primary calculation. N.5 and N.6 import it through the M.7 request, stated there in full, and do the passage to the integral groups (Theorems VI.9.5(b) and VI.9.11).

#### 11. The certificate engine is N.6's; K2SymbolsBrauer T.5 supplies the tame kernel it is applied to

Kind: `ownership`.

RT-AREA-ktheory-1/9 (confirmed, with the verifier's correction 'Keep the certificate engine and its independent upper/lower bounds in N.6, and remove the competing certificate-proof obligation from T.5') reverses the earlier arrangement, in which the format was T.5/certified-presentation and N.6 only added the cohomological lower bound. N.6 now owns the format (N.6/order-certificate, with the API and tests of the former T.5 node, on Mathlib's Module.Relations and Module.Presentation) and its cohomological lower bound in every even degree (N.6/certificate-driven-computation); T.5 → N.6 supplies the tame kernel group and sequence, not a second certificate engine; N.8 instantiates N.6's engine. T.5's paragraph 'Give certified finite presentations ...' and the node T.5/certified-presentation should be removed on the K2SymbolsBrauer side. Tau Ceti's ExactK0 presentation is not cited: it presents a Grothendieck group, not an arbitrary abelian group.

#### 12. The tame kernel is K2SymbolsBrauer T.5's; N.6 owns the wild kernel and the divisible subgroup

Kind: `ownership`.

N.6/tame-and-wild-kernels bundled the tame kernel, the wild kernel, the divisible subgroup and the comparison theorem in one definition node. The tame kernel is T.5/unramified-subgroup with T.5/tame-kernel-sequence and is imported; the node is re-scoped to the wild kernel (id kept), and the divisible subgroup (N.6/divisible-subgroup) and the comparison (N.6/divisible-subgroup-and-the-wild-kernel) are separate nodes. The subgroup of divisible elements of an abelian group is a general notion absent from Mathlib (which has only DivisibleBy); it is planned in its general form and could move to a foundational owner. RT-AREA-ktheory-1/9 confirms the split: N.6 keeps the wild kernel, the comparisons with divisible subgroups and Selmer/cohomological kernels, and the cohomological order computations in every even degree.

#### 13. Two stage cycles removed: N.2 ↔ K2SymbolsBrauer T.5, and N.4 ↔ SpecialValuesBirchTate B.2/B.3

Kind: `ownership`.

N.2/the-three-classical-rows listed K2SymbolsBrauer:T.5 as a prerequisite while the reviewed T.5 (PR #2893) imports N.2's localisation sequence (T.5/tame-kernel-sequence, T.5/s-integer-tame-kernel-sequence): the cycle N.2 → T.5 → N.2, which in the atlas-plus-packet graph also passed through N.3, N.5 and N.6. The prerequisite is dropped; the degree-two row is exported to T.5 (if the boundary–tame-symbol identification is wanted in N.2, K2SymbolsBrauer T.3/localization-boundary is upstream and acyclic). N.4/w2-of-the-rationals-and-the-divisibility-tests listed SpecialValuesBirchTate:B.3, but the atlas has N.4 → B.2 → B.3; the prerequisite and the B.3 request are dropped, and B.3 consumes N.4's w_2(ℚ) = 24. Update (fix of RT-AREA-ktheory-1/9 and /26): the N.2–T.5 pair is now resolved the other way, with T.5 → N.2 (see 'The tame-kernel sequence is K2SymbolsBrauer T.5's, and N.2 imports it'); T.5 no longer imports N.2, so it is acyclic. With the current node prerequisites of the K2SymbolsBrauer packet, T.3:localization-comparison → N.2 closes no cycle either: T.2/graded-map-degree-three no longer imports K3BlochGroups V.2.

#### 14. K3BlochGroups V.2 imports N.3 and N.5, which closes cycles with other packets

Kind: `note-external-cycle`.

K3BlochGroups:V.2/k3-rank-borel lists ArithmeticKTheory:N.5 (for K_3(O_F) ≅ K_3(F)), N.3:ranks and N.3:finite-generation as prerequisites, although the atlas has N.5 → K3BlochGroups V.6, not V.2. With all packets on main this closes two loops. (1) N.5 → MotivicEtaleKTheory M.8 (this packet's import for the natural Chern maps) → BorelRegulators R.7 → Polylogarithms P.2 → K3BlochGroups V.3 → V.2 → N.5. (2) Through K2SymbolsBrauer's T.1 packet, where T.2/graded-map-degree-three uses V.2: N.2 → K2SymbolsBrauer T.3:localization-comparison → T.2:graded-map → V.2 → N.3:finite-generation → N.2. This packet removed its edge of (2): N.2/the-three-classical-rows no longer imports T.3/localization-boundary. The rest lies in the K3BlochGroups packet. V.2 needs only the rank of K_3 of the field, which Borel's theorem for fields (K-book IV.1.18 with A = F; BorelRegulators R.3) gives without N.3 or N.5, so re-routing V.2/k3-rank-borel to R.3 breaks both loops. Update 2026-09-30: loop (2) no longer closes, since K2SymbolsBrauer T.2/graded-map-degree-three now imports only T.2/graded-map; loop (1) still does.

#### 15. The arithmetic-group input to Quillen's theorem is BorelRegulators R.1's

Kind: `ownership`.

RT-AREA-ktheory-1/1 (confirmed, with the verifier's essential correction): Quillen's proof needs the Tits building, the Solomon–Tits theorem, the Steinberg module and the integral finiteness of the Steinberg homology of arithmetic groups, which comes from Borel–Serre duality with the correctly twisted dualizing module St_n(F) ⊗ ℤ_χ^{⊗(n−1)}, χ = N_{F/ℚ} ∘ det (Putman–Studenmund, Theorem C), or from descent from a torsion-free subgroup in ker χ — not from a 'finite-type homotopy' of arithmetic groups, St_n(F) being free of infinite rank. R.1 is the single owner of that package (request); N.3:finite-generation keeps the rank filtration of Q(P(A)), its spectral sequence, the commensurability of Aut(P) with GL_n(𝓞_F) for nonfree P, the low ranks, the assembly and the finite-S localisation step. Proposal for the stage texts: delete N.3's clause 'Develop the arithmetic-group finiteness and finite-type homotopy input in Quillen's proof, with the relation to stable general linear groups' and let R.1's 'Prove the finite-type homotopy consequences needed by K-theory' read 'Prove the integral finiteness of the Steinberg homology of arithmetic subgroups of GL_n needed by K-theory'.

### N.7–N.8: 4 proposals

#### 1. N.8 owns its certified examples and imports the rest

Kind: `note-duplicate-boundary`.

RT-AREA-ktheory-1/9 and /11 (confirmed) settle the boundaries. N.8 imports K₀(ℤ) (KTheoryLowDegrees Z.6), K₁(ℤ) (U.6), K₂(ℤ) and K₂(ℚ) (K2SymbolsBrauer T.5) and K₃(ℤ), K₃(ℚ(i)) (K3BlochGroups V.5); it owns the format of a certified example on ArithmeticKTheory N.6's certificate engine, the certificate K₂(ℤ[i]) = 0, the certified tame kernel of the real quadratic field ℚ(√5), and the localisation sequence of ℤ ⊂ ℤ[1/p] in every degree. The Birch–Tate check is SpecialValuesBirchTate B.3's, which imports N.8's real-quadratic certificate. Proposal for the stage text: name those owners, say that N.8 owns the certificates and the ℤ[1/p] sequence, and replace 'before checking Birch–Tate' by 'for SpecialValuesBirchTate B.3 to check Birch–Tate against'.

#### 2. The word regular is missing from both libraries and is a cheap early target

Kind: `note-library-target`.

AUDIT-27 records that a grep for the phrase regular prime over both pinned trees returns nothing, and the same for Vandiver. Yet every ingredient is pinned: cyclotomic extensions, rings of integers, class numbers and the Bernoulli numbers in both conventions, with the conversion. The definition of a regular prime is therefore a composition of pinned objects and is one of the cheapest genuinely new definitions in this area, with the decidability instance for a given prime following from the pinned class number. Proposal: record it as an early library target of this roadmap, ahead of the theorems that use it, since it unblocks both the statement of N.7's main theorem and the certified examples of N.8.

#### 3. N.8's real-quadratic certificate feeds SpecialValuesBirchTate B.3

Kind: `ownership`.

RT-AREA-ktheory-1/11 (confirmed): N.8 and B.3 both planned the certified real-quadratic tame kernel, and no edge made N.8 available to B.3, while N.8 imported B.3. N.8/real-quadratic-example-and-birch-tate now owns the certificate for ℚ(√5) (with N.6's engine) and no longer imports B.3; N.8/birch-tate-status, which imported B.3, is deleted. Proposal: add the atlas edge ArithmeticKTheory:N.8 → SpecialValuesBirchTate:B.3 (acyclic once N.8's imports of B.3 are gone, checked against the current packets) and let B.3/sqrt-five-birch-tate-check import the N.8 node instead of requesting the certificate from K2SymbolsBrauer T.5. B.3 keeps the w₂ computation, the L-function factorisation and the check, and must not supply the order bound.

#### 4. Tate's method is planned in N.8, its only consumer

Kind: `ownership`.

No roadmap plans Tate's method for computing tame kernels: the filtration of K₂(F) by symbols of S_m-units, the graded tame symbol and Tate's criterion (Tate's Proposition 1 and Lemma 1, in Browkin's and Zhang–Xu's statements). A search of the packets for Tate's method, Bass–Tate and the filtration K₂^{S_m} finds only other Bass–Tate results — the Milnor ring of a global field (K2SymbolsBrauer T.2:symbols) and the exact sequence for a rational function field (T.4/bass-tate-sequence) — which are different statements. N.8 needs the method for the span proofs of its two certificates and plans it there (N.8/tate-norm-filtration, N.8/tate-criterion), in the generality of an arbitrary number field. Proposal: if another layer comes to need explicit tame kernels (for instance further fields for SpecialValuesBirchTate, or the imaginary quadratic tables of Browkin and of Belabas–Gangl), move the two nodes to ArithmeticKTheory N.6, beside the certificate engine whose span field they discharge, and let N.8 import them; their ids and statements need no change.
