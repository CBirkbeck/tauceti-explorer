# Potential modularity and compatible systems: prescribed lifts and families

This part takes a prescribed global lift to a genuine family over one number field,
records its local and Hodge data, and supplies the reductions used to change residual
characteristic. The general system carriers and operations are available before any
eigenform, potential-modularity or potential-automorphy existence theorem. The latter
theorems consume these objects; they do not define them.

The scope is R24.3, R24.4, R24.5, the early R24.5 operations layer, and R24.6.
Every target in these five stages has a statement and a dependency/proof outline below.
The target-level pass is complete. Proof closure is open at the precise supplier and
source leaves listed at the end. No formal implementation is claimed.

## Conventions and the dependency boundary

Write G_F for the absolute Galois group of a number field F, λ for a finite
coefficient place, ℓ for its rational residue characteristic, and q_v for the
residue cardinality of a finite place v. Representations are continuous and
semisimple over completed algebraic coefficient fields. Equality between members
means representation isomorphism after a common coefficient extension, rather
than equality of matrices or a canonical lattice. Good Frobenius polynomials live
in one finite number field M and are compared through its embeddings.

There are two normalizations. In BLGGT and the cohomological examples, Frobenius
is geometric and the cyclotomic character ε has Hodge–Tate number −1,
Q_p(X)=X−p⁻¹, and pure weight −2. The cohomological Δ family has
H={0,11}, weight 11 and Q_p(X)=X²−τ(p)X+p¹¹. KW use the arithmetic
representation and assign ε Hodge–Tate number +1; its contragredient is the
cohomological family. Every use of a weight formula must transport both
Frobenius and Hodge conventions. A bare change of sign in H is insufficient.

The compatibility contracts are different:

| Contract | At places away from ℓ | At places above ℓ |
| --- | --- | --- |
| BLGGT weak | Unramified outside S, common Q_v | De Rham at every λ; crystalline outside S; common full labeled H |
| BLGGT strict, on a weak system | Common Frobenius-semisimple WD at every finite v, for λ away from v | Adds no WD comparison with the coefficient member |
| KW plain | Common local WD parameters away from ℓ | Crystalline with the fixed weights for sufficiently large ℓ |
| KW almost strict | All plain conditions, including common local WD away from ℓ | Retains large-ℓ crystallinity; adds full geometric/WD comparison for irreducible residual members, and crystallinity if ℓ≠2 and the fixed local WD parameter is unramified |
| KW strict | Common local WD parameters away from ℓ | Full comparison, potential semistability and common Hodge weights for every coefficient member |
| DP Definition 1.10 | Common good Frobenius polynomials and local WD comparison away from ℓ | Every member de Rham with fixed Hodge weights and crystalline outside S; WD comparison required if the residual member is irreducible, or if ℓ is odd and the local WD parameter is unramified |

A plain or almost-strict KW family does not automatically satisfy BLGGT's
all-member de Rham/Hodge requirement. Conversion requires that extra hypothesis.
The constructed motivic Hilbert/Brauer families do satisfy the stronger contract
using Skinner's complete coefficient-prime theorem, including reducible residual
members and ℓ=2. The historical KW almost-strict proof remains a separate variant.

R24.4 imports KW I Theorem 4.1 from GL2ModularityLifting R22.5/R22.6;
it does not supply a second proof. In KW II §10.2 the required lifts use the
previous lifting theorem and the Serre-weight inputs, independently of the
subsequent finiteness theorem. The chronological R24.3→R24.4 ordering must not
become a circular lift-existence dependency. General ramified-coefficient,
residually reducible de Rham transfer is imported from GL2ModularityLifting
R32.6. R24.6 checks local hypotheses and applies those interfaces.

## Pinned library inputs

The baseline is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. The reviewed library
audit has no dedicated entry for this roadmap; its G7 and R19.3/R19.5 supplier entries were rechecked. All 21 cited Mathlib statements were re-read at the exact Mathlib pin on 8 October 2026. The earlier pinned Tau Ceti search is retained, and this revision adds no Tau Ceti declaration citation. Existing
absolute Galois groups, prime indices, completions, representations, duality,
semisimplicity, algebraic induction, characteristic polynomials, regular
sequences, local rings, Krull dimension, flatness, and Deligne's Γ factors
are consumed. Their existence does not supply arithmetic inertia/Frobenius,
WD, Hodge, deformation-point, eigenform, density or reductive integral-model
interfaces. These missing interfaces are named in the supplier contracts.

The source of finite Brauer induction and Mackey/Frobenius reciprocity is
upstream InductionRestriction Layer 6, with arithmetic descent of Hom lines
requested from GL2AutomorphicRepresentationsAndTransfer R17.6. Hecke characters
and their algebraic infinity-type purity are upstream GlobalNumberFields
Layers 9–10. Global reciprocity is upstream ClassFieldTheory Layers 11–12;
the algebraic ℓ-adic realization/classification comparison is a requested
ClassFieldTheory, Part II interface. No second general character or
reciprocity construction is planned here.

## The early operations layer: common carriers, algebra and purity

<a id="weakly-compatible-system-rank-n"></a>
### Rank-n weakly compatible systems of l-adic representations

Fix number fields F and M and a rank n. The family data consist of a finite exceptional set S of finite places of F, monic degree-n polynomials Q_v in M[X] for v outside S, a continuous semisimple member r_λ : G_F → GL_n(M̄_λ) for each finite place λ of M, and an n-element multiset H_τ of integers for each embedding τ : F ↪ M̄. For λ of residue characteristic ℓ, every v outside S and not dividing ℓ is unramified for r_λ, and its geometric Frobenius characteristic polynomial is the image of Q_v under M ↪ M̄_λ. At each v dividing ℓ, the local member is de Rham and is crystalline when v is outside S. For every coefficient embedding M̄ ↪ M̄_λ extending λ, the labeled Hodge–Tate multiset at the induced embedding of F is H_τ. These comparisons, together with the actual members, define a weakly compatible system. Rank one gives character systems. Taylor's rank-d contract over ℚ (Documenta 2006, §6, p. 773) asks for Hodge–Tate members of fixed weights at every λ and crystallinity when ℓ is outside S; it does not separately require de Rham behavior at exceptional coefficient primes. The rank-two KW carrier stores local WD parameters at every finite place. Its comparison with this carrier requires the additional all-member de Rham/Hodge and outside-S crystalline conditions recorded in compatible-system-predicates.

The following qualifications are part of the contract:

- RS-12: this node is the common carrier; it contains representations at the coefficient places, not only common traces, and the weak, almost-strict and strict conditions stay separate predicates
- M-rationality of Frobenius polynomials and independence of the Hodge–Tate multisets are part of the data, not theorems

**Dependency and proof outline.**

1. Assemble the five-tuple from actual continuous semisimple members supplied by R01.1. The defining axioms include common good-place characteristic polynomials and coefficient-place de Rham/crystalline and Hodge conditions.
2. This carrier has no eigenform, potential-modularity or potential-automorphy prerequisite. The eigenform construction is an R19.3 instance importing this definition.

Inputs: `ArithmeticGaloisRepresentations:R01.1`; `ArithmeticGaloisRepresentations:R01.5`; `PadicHodgeTheory:R06.2`; `PadicHodgeTheory:R06.3/weil-deligne-parameter`; `mathlib:Representation`; `mathlib:Field.absoluteGaloisGroup`; `mathlib:LinearMap.charpoly`; `mathlib:NumberField.FinitePlace`; `mathlib:NumberField.FinitePlace.embedding`.

**Uses that determine the API.**

- [Predicates on weakly compatible systems: regular, strictly compatible, pure, self-dual, irreducible, automorphic](#compatible-system-predicates): the predicates are properties of this carrier.
- [Linear-algebra operations on weakly compatible systems and what they preserve](#linear-algebra-operations-on-systems): the operations act on it.
- `AutomorphicGaloisRepresentations:R19.3`: the eigenform family instance (RS-12).
- `AutomorphicGaloisRepresentationsPartII:AG2.6`: the higher-rank instances (RS-12).

**API determined by its uses.**

- `TauCeti.CompatibleSystems.WeaklyCompatibleSystem` (structure): (M, S, Q_v, r_λ, H_τ) with the compatibility conditions.
- `TauCeti.CompatibleSystems.WeaklyCompatibleSystem.rank` (projection): The rank n.
- `TauCeti.CompatibleSystems.WeaklyCompatibleSystem.charpoly_frob` (characterisation): For v ∉ S, v ∤ l: r_λ unramified at v with charpoly r_λ(Frob_v) = Q_v.
- `TauCeti.CompatibleSystems.WeaklyCompatibleSystem.deRham` (characterisation): r_λ|_{G_{F_v}} de Rham for v | l, crystalline for v ∉ S.
- `TauCeti.CompatibleSystems.WeaklyCompatibleSystem.ofCompatibleSystem` (coercion): Convert a rank-two KW system only with additional hypotheses: every coefficient member is de Rham of the common weights at every place above ℓ and crystalline outside an enlarged fixed finite S. Plain or almost strict compatibility alone does not imply these.
- `TauCeti.CompatibleSystems.WeaklyCompatibleSystem.enlargeRamificationSet` (functoriality): For finite S⊆S′, keep every r_λ and H_τ, restrict Q_v to v∉S′, obtaining a weakly compatible system.

**Discriminating tests.**

- `wcs_cyclotomic` (computation): With geometric Frobenius and HT(ε_ℓ)=−1, ε has rank 1, S=∅, Q_p(X)=X−p⁻¹, H={−1} and weight −2. X−p would be the arithmetic-Frobenius polynomial.
- `wcs_newform_delta` (computation): Use the cohomological member of the Δ family in BLGGT convention: rank 2, H={0,11}, Q_p(X)=X²−τ(p)X+p¹¹; Q₂=X²+24X+2048. The KW arithmetic member is its contragredient, with their HT(ε)=+1 convention.
- `wcs_not_just_traces` (non-example): Two systems with the same Q_v are isomorphic member by member only up to conjugation; the carrier stores the r_λ themselves.
- `wcs_S_enlarge` (compatibility): Enlarging S gives an equivalent system (fewer polynomials, same representations).

**Acceptance checks.**

- Frobenius-polynomial recognition (ArithmeticGaloisRepresentations R01.5) identifies each r_λ only up to isomorphism: it gives no canonical basis or lattice (RS-12 uniqueness contract).
- Check the comparison with KW systems only when the additional de Rham/crystalline hypotheses hold; the strict systems constructed below satisfy them after enlarging S.

Sources: [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor](<https://arxiv.org/pdf/1010.2561v1>), §5.1, definition of a weakly compatible system, p. 51 (arXiv v1; printed page = PDF page) (Actual semisimple coefficient-place members, common good-place polynomials, a finite exceptional set and labeled Hodge multisets, with the stated de Rham and crystalline conditions.); [Richard Taylor](<https://ems.press/content/book-chapter-files/27484>), §6, rank d weakly compatible systems over ℚ, p. 773 (PDF page 45) (Taylor's version over ℚ with Hodge numbers.).

<a id="weakened-compatible-data"></a>
### Very weak and extremely weak compatible data

Use the same number-field, finite ramification set, semisimple continuous members and common monic good Frobenius polynomials as a weakly compatible system. Extremely weak data retain only HT_τ(det r_λ)=Σ H_τ at every λ, with no full-member Hodge or de Rham condition. Very weak data additionally require the members to be crystalline at all places above ℓ and have H_τ for ℓ outside a Dirichlet-density-zero set. A weak system is very weak and a very weak system is extremely weak; the converse implications are not part of the definition. For rank one the determinant condition is the full Hodge condition and algebraic-character classification recovers weak compatibility. In higher rank extremely weak H is constrained only by its sum; induction and Artin-twist purity below therefore specify canonical Hodge metadata.

**Dependency and proof outline.**

1. Separate the determinant Hodge comparison from the full-member condition.
2. The forgetful maps preserve actual members, Q, S and H; record their density and determinant obligations independently.

Inputs: [Rank-n weakly compatible systems of l-adic representations](#weakly-compatible-system-rank-n); `ArithmeticGaloisRepresentations:R01.1`; `PadicHodgeTheory:R06.2`.

**Uses that determine the API.**

- `ACC+ §7.1, Lemma 7.1.1 and Theorem 7.1.11`: a reducible rank-two extremely weak system splits into weakly compatible character systems; the main potential automorphy theorem takes very weakly compatible systems with H_τ = {0, 1}
- [Purity of character systems](#rank-one-purity): rank-one extremely weak data are weakly compatible character systems
- [Purity of Artin systems up to twist](#artin-twist-purity): Artin-up-to-twist purity needs the canonical Hodge metadata (E4)
- [Purity of systems induced from characters](#induced-character-purity): induced purity uses the transported character Hodge data

**API determined by its uses.**

- `TauCeti.CompatibleSystems.ExtremelyWeaklyCompatibleSystem` (structure): The common Q, members and H with determinant-Hodge condition only.
- `TauCeti.CompatibleSystems.VeryWeaklyCompatibleSystem` (structure): Extremely weak data with density-one crystallinity and full labeled Hodge comparisons.
- `TauCeti.CompatibleSystems.WeaklyCompatibleSystem.toVeryWeak` (functoriality): Forget the all-λ de Rham/full Hodge requirement to the density-one one.
- `TauCeti.CompatibleSystems.VeryWeaklyCompatibleSystem.toExtremelyWeak` (functoriality): Forget the density-one full-member condition, retaining determinant Hodge comparison.
- `TauCeti.CompatibleSystems.ExtremelyWeaklyCompatibleSystem.hodgeSum` (compatibility): At every λ, the determinant labeled Hodge number equals Σ H_τ.

**Discriminating tests.**

- `weakening_rank_one` (characterisation): A rank-one H_τ={a} is determined by its determinant Hodge sum a.
- `weakening_higher_rank_metadata` (non-example): Rank-two H={0,2} and H′={1,1} have the same determinant sum 2; the determinant condition distinguishes neither the Hodge multiset itself nor regularity.
- `weakening_hodge_purity_not_sum` (non-example): For a rank-two weight-zero Artin family, H_τ={−1,1}, H_cτ={0,0} have both determinant sums zero, but H_cτ≠−H_τ; arbitrary extremely weak metadata do not imply Hodge purity.
- `weakening_transitive` (compatibility): The composite weak→very weak→extremely weak map preserves each r_λ, Q_v and H_τ.

**Acceptance checks.**

- The distinction is an interface weakening, never a replacement of the BLGGT weak carrier.

Sources: [Patrick Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor, Jack Thorne](<https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf>), §7.1, pp.1084–1085 (Definitions of very weak and extremely weak systems, including the determinant condition and density-one full-member condition.).

<a id="compatible-system"></a>
### Compatible systems: strict, almost strict, and plain

For number fields F and E, the two-dimensional E-rational family stores continuous semisimple members ρ_ι of G_F for every prime ℓ and embedding ι:E↪Q̄_ℓ, Frobenius-semisimple WD data r_q over E for every finite q (unramified for almost all q), and integers a≥b. Plain compatibility requires WD comparison at q∤ℓ and crystallinity with Hodge–Tate numbers (a,b) at coefficient places for sufficiently large ℓ. KW strict compatibility requires every member to be geometric of these Hodge–Tate numbers and WD(ρ_ι|D_q)^Fss≅ιr_q at every q, including q|ℓ via Fontaine. An almost strictly compatible system is a plain compatible system (so in particular crystalline of weights (a,b) at coefficient places for ℓ ≫ 0) that satisfies in addition, at q above the coefficient prime, only these clauses: if the semisimplified residual member is irreducible, it is geometric of weights (a,b) with full WD comparison; if ℓ≠2 and r_q is unramified, the local member is crystalline of these weights. Regularity is a≠b. No all-member de Rham condition is imposed on a plain or almost-strict carrier. Dieulefait–Pacetti Definition 1.10 uses a rank-two five-tuple; compare it after matching coefficient embeddings and both normalizations. Its almost strict systems also require every member to be de Rham at its coefficient prime (condition (4)), which KW's almost-strict definition does not.

The following qualifications are part of the contract:

- the local predicates (strict, almost strict, plain) are kept separate; almost strictness gives no Weil–Deligne information at 𝔮 | ℓ when ρ̄_ι is reducible and r_𝔮 is ramified
- rank 2 here; the general rank-n and polarised versions are the operations sub-layer's generalisation

**Dependency and proof outline.**

1. Definitions only; the existence theorems are R24.5.

Inputs: `PadicHodgeTheory:R06.3/weil-deligne-parameter`; `ArithmeticGaloisRepresentations:R01.2`; `ArithmeticGaloisRepresentations:R01.5`; `ArithmeticGaloisRepresentations:R01.1`; `mathlib:Representation`; `mathlib:Field.absoluteGaloisGroup`.

**Uses that determine the API.**

- [The compatible system through a potentially modular lift, by Brauer induction](#brauer-induction-system): the object constructed
- [Residual members of a compatible system](#residual-members): change of residual characteristic
- `ClassicalSerreModularity:R33.1/paso-1-weight-two-system`: the systems propagated in the modern route
- `ClassicalSerreModularity:R27.3/theorem-3-1-killing-ramification`: the systems of KW I

**API determined by its uses.**

- `TauCeti.CompatibleSystems.CompatibleSystem` (structure): E, the family ρ_ι, the Weil–Deligne data r_𝔮 and the weights (a, b)
- `TauCeti.CompatibleSystems.CompatibleSystem.IsStrict` (data): compatibility with r_𝔮 at every 𝔮, including 𝔮 above ℓ
- `TauCeti.CompatibleSystems.CompatibleSystem.IsAlmostStrict` (data): the two conditions at 𝔮 | ℓ (irreducible residual, or ℓ ≠ 2 and r_𝔮 unramified)
- `TauCeti.CompatibleSystems.CompatibleSystem.IsRegular` (data): a ≠ b
- `TauCeti.CompatibleSystems.CompatibleSystem.IsStrict.isAlmostStrict` (relation): strict ⇒ almost strict ⇒ compatible
- `TauCeti.CompatibleSystems.CompatibleSystem.enlargeCoefficients` (functoriality): Extend E to a finite number-field extension E′ and reindex embeddings; preserve the same members and local data after extension. Eigenform constructors are imported from R19.3 and are not defined here.

**Discriminating tests.**

- `newform_is_strict` (compatibility): Import the Δ eigenform family from R19.3: weights (11,0), regular and strict after the complete coefficient-prime theorem from R19.5.
- `weight_one_irregular` (degenerate): a weight-one newform gives an irregular system, a = b = 0
- `almost_strict_not_strict` (non-example): The almost-strict contract permits no WD conclusion at q=ℓ with reducible residual member and ramified r_q. This is a logical nonimplication of the contract, not a claim that the particular geometrically constructed systems fail strictness.
- `hodge_tate_weights_convention` (compatibility): weight a + 1 when b = 0: a newform of weight k gives (a, b) = (k − 1, 0)

**Acceptance checks.**

- Check that a newform of weight k ≥ 2 gives a strictly compatible system (Deligne, Carayol, Saito)
- Compare the definition obligations: almost strictness omits the q=ℓ WD comparison when the residual member is reducible and the parameter ramified. This does not exhibit an actual arithmetic family failing strictness.

Sources: [Chandrashekhar Khare and Jean-Pierre Wintenberger](<https://www.math.ucla.edu/~shekhar/papers/results.pdf>), §5, p. 7 of the preprint (Strict compatibility.); [Chandrashekhar Khare and Jean-Pierre Wintenberger](<https://www.math.ucla.edu/~shekhar/papers/results.pdf>), §5, p. 8 of the preprint (Almost strict compatibility.); [Luis Victor Dieulefait and Ariel Martín Pacetti](<https://arxiv.org/pdf/2108.07577v2>), Definition 1.10 and after, p. 7 of the arXiv version (DP's version.).

<a id="compatible-system-predicates"></a>
### Predicates on weakly compatible systems: regular, strictly compatible, pure, self-dual, irreducible, automorphic

For ℛ = (M, S, {Q_v}, {r_λ}, {H_τ}) of rank n over F: ℛ is regular if every H_τ has distinct elements; extremely regular if moreover some H_τ has no two distinct sub-multisets of equal size and equal sum; (n = 1, F totally real) totally odd if r_λ(c_v) = −1 for all infinite v; (F CM or totally real) (ℛ, ℳ) is essentially conjugate self-dual for a character system ℳ of G_{F⁺} if every (r_λ, μ_λ) is, and ℛ is totally odd essentially conjugate self-dual if such ℳ exists with every (r_λ, μ_λ) totally odd; irreducible if r_λ is irreducible for all λ above a set of rational primes of Dirichlet density 1; strictly compatible if for each finite v there is a Weil–Deligne representation WD_v(ℛ) over M̄ with ς WD_v(ℛ) ≅ WD(r_λ|_{G_{F_v}})^{F-ss} for λ not above the residue characteristic of v; pure of weight w if every root α of Q_v (v ∉ S) has |ια|² = (#k(v))^w and H_{cτ} = {w − h : h ∈ H_τ}; strictly pure if strictly compatible with each WD_v(ℛ) pure of weight w and H_{cτ} = {w − h : h ∈ H_τ}; automorphic if there is a regular algebraic cuspidal π of GL_n(𝔸_F) with rec(π_v|det|_v^{(1−n)/2})(Frob_v) of characteristic polynomial ι(Q_v) for v ∉ S. Over ℚ, Taylor's 'strongly compatible' is 'strictly compatible', and his rank-2 'regular' means distinct Hodge numbers and det ρ_λ(c) = −1. BLGGT strict compatibility here compares only λ away from the residue characteristic of v; it is weaker than KW all-place strictness. Strict purity includes local monodromy-weight purity at all v, not just good Frobenius absolute values. The totally-real pair convention is obtained from §2.1; the explicit §5.1 system definition is stated for CM F. Automorphic and irreducible predicates do not assert their preservation under every operation.

The following qualifications are part of the contract:

- these are predicates with their own preservation hypotheses (R24.5/linear-algebra-operations-on-systems), not fields of the carrier (RS-12)
- the rank-2 'strict' and 'almost strict' of R24.5/compatible-system are Khare–Wintenberger's local predicates at 𝔮 | ℓ; BLGGT's 'strictly compatible' asks WD_v(ℛ) only at λ ∤ residue characteristic of v; keep all of them separate
- the partial and completed L-functions, ε-factors and Γ-factors of a system (BLGGT pp. 52–53) are planned separately in R24.5/system-l-functions

**Dependency and proof outline.**

1. Definitions; independence of choices: det r_λ(c_v) = ±1 is independent of λ, and by purity n odd with v real forces w even (BLGGT p. 53).

Inputs: [Rank-n weakly compatible systems of l-adic representations](#weakly-compatible-system-rank-n); `PadicHodgeTheory:R06.3/weil-deligne-parameter`; `ArithmeticGaloisRepresentations:G7`; [Polarized weakly compatible systems](#polarized-system).

**Uses that determine the API.**

- [Linear-algebra operations on weakly compatible systems and what they preserve](#linear-algebra-operations-on-systems): which predicates each operation preserves.
- [Reducibility of rank-2 systems over ℚ does not depend on λ](#rank-two-reducibility-independent-of-lambda): the notion of an irreducible rank-2 system over ℚ.
- `AutomorphicGaloisRepresentations:R19.3/strict-compatibility-and-the-monodromy-weight-purity`: the requested carrier with its local predicates.

**API determined by its uses.**

- `TauCeti.CompatibleSystems.WeaklyCompatibleSystem.IsRegular` (data): Distinct Hodge–Tate numbers for every τ.
- `TauCeti.CompatibleSystems.WeaklyCompatibleSystem.IsExtremelyRegular` (data): Regular, and some H_τ has no distinct equal-cardinality submultisets with the same sum.
- `TauCeti.CompatibleSystems.WeaklyCompatibleSystem.IsStrictlyCompatible` (data): A Weil–Deligne representation WD_v(ℛ) matching every r_λ at v, λ ∤ residue characteristic of v.
- `TauCeti.CompatibleSystems.WeaklyCompatibleSystem.IsPure` (data): Weight-w purity of the Q_v and the symmetry H_{cτ} = w − H_τ.
- `TauCeti.CompatibleSystems.WeaklyCompatibleSystem.IsEssentiallySelfDual` (data): Essential conjugate self-duality with a character system of G_{F⁺}, and its totally odd version.
- `TauCeti.CompatibleSystems.WeaklyCompatibleSystem.IsIrreducible` (data): Irreducible for λ above a density-one set of primes.
- `TauCeti.CompatibleSystems.WeaklyCompatibleSystem.IsAutomorphic` (data): Frobenius polynomials of a regular algebraic cuspidal π.

**Discriminating tests.**

- `pred_newform` (compatibility): A newform of weight k ≥ 2 is regular, strictly pure of weight k − 1, irreducible and automorphic.
- `pred_regular_fails` (non-example): ε ⊕ ε is not regular (H = {−1, −1}).
- `pred_odd_purity` (characterisation): For n odd and v real, purity forces w even (BLGGT p. 53).
- `pred_strict_vs_almost_strict` (non-example): BLGGT strict compatibility compares only λ∤v. For a weakly compatible family, KW almost strictness supplies these comparisons but omits some comparisons at v|ℓ. Check the missing obligation without asserting the existence of an arithmetic family that violates all-place strictness.

**Acceptance checks.**

- Check that a newform of weight k gives a strictly pure, regular, irreducible (Ribet), automorphic rank-2 system of weight k − 1.
- Check that 'irreducible' is a density-one condition: for rank 2 over ℚ it is equivalent to irreducibility at one λ (R24.5/rank-two-reducibility-independent-of-lambda).

Sources: [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor](<https://arxiv.org/pdf/1010.2561v1>), §5.1, the subsidiary definitions, p. 51 (arXiv v1; printed page = PDF page) (Regular, extremely regular, totally odd, essentially conjugate self-dual, irreducible.); [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor](<https://arxiv.org/pdf/1010.2561v1>), §5.1, strict compatibility and purity, p. 52 (arXiv v1; printed page = PDF page) (Strictly compatible, pure, strictly pure.); [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor](<https://arxiv.org/pdf/1010.2561v1>), §5.1, automorphy, p. 53 (arXiv v1; printed page = PDF page) (Automorphic systems.); [Richard Taylor](<https://ems.press/content/book-chapter-files/27484>), §6, Taylor's remark on motives, p. 773 (PDF page 45) (Strong compatibility and rank-2 regularity over ℚ.).

<a id="linear-algebra-operations-on-systems"></a>
### Linear-algebra operations on weakly compatible systems and what they preserve

Construct direct sum, tensor, dual, symmetric and exterior powers of weakly compatible systems over a common coefficient field, with semisimplification of the algebraic output where needed. At good v, sums multiply Q polynomials; tensor roots are α_iβ_j; the dual polynomial is XⁿQ_v(0)⁻¹Q_v(X⁻¹); Sym^k and ∧^k roots are the appropriate repeated/distinct k-fold products. Hodge multisets follow the corresponding sums, negatives and k-fold sums. These operations, restriction and induction preserve weak compatibility and away-coefficient strict compatibility after the stated enlargement of S. Pure direct sums require equal weights; tensor weights add, dual weight negates, Sym^k/∧^k weight is kw; restrictions and induction preserve weight with their canonical Hodge data. Strict purity uses the local WD preservation results. Regularity survives duality/restriction; sums, tensors, symmetric powers of rank>2, exterior powers and induction can have Hodge collisions. Irreducibility survives duality, not arbitrary sums/tensors/restriction/induction. No unconditional cuspidal automorphy claim is made for any operation, including solvable base change when it becomes noncuspidal.

The following qualifications are part of the contract:

- weak compatibility of each operation uses only that de Rham, crystalline and Hodge–Tate data are preserved by the corresponding operations on representations (PadicHodgeTheory R06.3) and that characteristic polynomials of ⊗, ∨, Sym, ∧ and induced representations are determined by those of the factors
- extends R24.5/system-operations (twists, restriction, induction at rank n) by the linear-algebra operations; automorphy statements are recorded only where a source theorem supplies them

**Dependency and proof outline.**

1. Apply the operation member by member; compute Frobenius polynomials from Q_v (resultant-type formulas for ⊗, Sym, ∧; X^nQ_v(0)^{−1}Q_v(X^{−1}) for the dual; roots raised to the residue degree for restriction).
2. Strict compatibility: Weil–Deligne representations commute with each operation, and Frobenius-semisimplification with ⊗.
3. Counterexamples to preservation: (1 ⊕ ε) ⊗ (1 ⊕ ε^{−1}) contains 1 ⊕ 1 and is not regular although both factors are; restriction of an irreducible system induced from K to G_K is reducible.

Inputs: [Predicates on weakly compatible systems: regular, strictly compatible, pure, self-dual, irreducible, automorphic](#compatible-system-predicates); [Twisting, restriction and induction of compatible systems](#system-operations); `PadicHodgeTheory:R06.3/weil-deligne-parameter`; `ArithmeticGaloisRepresentations:R01.5`; `ArithmeticGaloisRepresentations:G7`; [Rank-n weakly compatible systems of l-adic representations](#weakly-compatible-system-rank-n); `PadicHodgeTheory:R06.2`.

**Uses that determine the API.**

- `PotentialAutomorphyInfrastructure:PA.5`: Compute weights and check the input remains regular/polarized under the chosen tensor operation.
- [L-functions, Γ-factors and ε-factors of a compatible system](#system-l-functions): Dual factors and product formulas.

**API determined by its uses.**

- `TauCeti.CompatibleSystems.directSum` (constructor): Members r⊕s; Q_v=Q_r Q_s; H disjoint union; common pure weight required for purity.
- `TauCeti.CompatibleSystems.tensor` (constructor): Members (r⊗s)^ss; roots αβ; H all pairwise sums; pure weight w+w′.
- `TauCeti.CompatibleSystems.dual` (constructor): Members r∨; normalized reciprocal Q_v; H=−H; pure weight −w.
- `TauCeti.CompatibleSystems.symmetricPower` (constructor): Sym^k members and repeated k-fold weight sums; rank binomial(n+k−1,k).
- `TauCeti.CompatibleSystems.exteriorPower` (constructor): ∧^k members and distinct k-fold weight sums; rank binomial(n,k), zero if k>n.
- `TauCeti.CompatibleSystems.dual_charpoly` (compatibility): The normalized reciprocal polynomial is monic of rank n; for rank 2, X²−aX+b becomes X²−(a/b)X+1/b.
- `TauCeti.CompatibleSystems.directSum_pure` (relation): Pure systems of the same weight w have pure direct sum of weight w; differing weights invalidate the conclusion.

**Discriminating tests.**

- `dual_rank_two` (computation): X²−aX+b with b≠0 becomes X²−(a/b)X+1/b.
- `sym2_distinct` (computation): For h₁≠h₂, {2h₁,h₁+h₂,2h₂} is distinct, so Sym² of regular rank two stays regular.
- `tensor_collision` (non-example): H={0,1} and H′={0,−1} give tensor H={0,−1,1,0}, which is not regular.
- `direct_sum_mixed_weights` (non-example): 1⊕ε has geometric-Frobenius roots 1,p⁻¹ and weights 0,−2, so is not pure of one weight.
- `exterior_above_rank` (degenerate): ∧³ of a rank-two system is the rank-zero system with Q_v=1 and H empty.

**Acceptance checks.**

- Check the dual's Frobenius polynomial in rank 2: X² − aX + b ↦ X² − (a/b)X + 1/b.
- Check that H_τ(Sym² ℛ) = {2h₁, h₁ + h₂, 2h₂} and that regularity can fail for Sym² when h₁ + h₂ collides — it cannot for rank 2 with h₁ ≠ h₂.

Sources: [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor](<https://arxiv.org/pdf/1010.2561v1>), §5.1, operations, p. 51 (arXiv v1; printed page = PDF page) (Operations member by member, with the dual as the example.); [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor](<https://arxiv.org/pdf/1010.2561v1>), §5.1, restriction, p. 53 (arXiv v1; printed page = PDF page) (ℛ|_{G_{F′}} with S^{(F′)}, H^{(F′)}_τ and Q^{(F′)}_v (continued on p. 54).).

<a id="system-operations"></a>
### Twisting, restriction and induction of compatible systems

Given systems, construct character twists, finite base-field restrictions and finite-extension inductions by applying the arithmetic representation operations member by member and their WD/Hodge operations locally. Plain compatibility is preserved after enlarging S; all-place strict compatibility is preserved for de Rham systems, with Q and H transported accordingly. For induction include primes ramified in the extension in S and take at a local place the sum of local induced WD parameters. For almost-strict systems, the unconditional output is plain: to retain almost strictness one must check that every newly irreducible residual output member falls in a source coefficient-prime comparison case and that every required unramified coefficient output is crystalline of the transported weights. Twisting by a strict character preserves the rank-two residual irreducibility test; arbitrary induction/restriction may change it. The virtual Brauer combination is a class in the representation ring, not yet a representation.

The following qualifications are part of the contract:

- strict compatibility at 𝔮 | ℓ is preserved by (i)–(iii) because Weil–Deligne parameters of de Rham representations commute with twisting, restriction and induction (PadicHodgeTheory R06.3)
- this layer takes a system as input and does not assume R24.5's two-dimensional existence theorem

**Dependency and proof outline.**

1. Local-global compatibility of each operation with Weil–Deligne parameters (ArithmeticGaloisRepresentations R01.2, PadicHodgeTheory R06.3).
2. Recognition by Frobenius polynomials (ArithmeticGaloisRepresentations R01.5) for (iv).

Inputs: [Compatible systems: strict, almost strict, and plain](#compatible-system); `PadicHodgeTheory:R06.3/weil-deligne-parameter`; `ArithmeticGaloisRepresentations:R01.2`; `ArithmeticGaloisRepresentations:R01.5`; `ArithmeticGaloisRepresentations:R01.1`; `ArithmeticGaloisRepresentations:G7`; `mathlib:Representation.ind`; `mathlib:Representation.dual`.

**Uses that determine the API.**

- [The compatible system through a potentially modular lift, by Brauer induction](#brauer-induction-system): Build the twist and induction summands in a virtual class.
- [Purity of systems induced from characters](#induced-character-purity): Transport the canonical induced Hodge data and Frobenius roots.

**API determined by its uses.**

- `TauCeti.CompatibleSystems.twist` (constructor): Memberwise tensor with a strict character system; local WD tensor and Hodge shifts.
- `TauCeti.CompatibleSystems.restrict` (constructor): Restrict to G_F′; Q roots raised to residue degrees and H_τ pulled back.
- `TauCeti.CompatibleSystems.induce` (constructor): For finite F′/F induce each member, rank multiplied by [F′:F], enlarge S by ramified primes, local WD induction and Hodge multiset union.
- `TauCeti.CompatibleSystems.restrict_charpoly` (compatibility): At w|v outside S, roots of Q_w are α^[k(w):k(v)] for roots α of Q_v.
- `TauCeti.CompatibleSystems.induce_rank` (compatibility): Rank Ind_F′^F ℛ=[F′:F] rank ℛ; induction need not preserve regularity or irreducibility.

**Discriminating tests.**

- `twist_cyclotomic` (computation): Twisting by ε shifts each BLGGT Hodge number by −1 and pure weight by −2.
- `restrict_trivial_extension` (degenerate): For F′=F restriction returns the same members, Q and H.
- `induce_quadratic_trivial` (computation): Induce the trivial character across a quadratic extension: rank 2, H={0,0}, polynomial (X−1)² at split good primes and X²−1 at inert good primes.
- `induced_regular_nonexample` (non-example): The induced quadratic trivial character is a sum of trivial and quadratic characters and is not regular; generic induction is not an irreducibility theorem.

**Acceptance checks.**

- Check that Ind of a rank-2 system from a quadratic field has rank 4 and Hodge–Tate weights doubled in multiplicity
- Check that restriction of an irreducible system induced from K to G_K is reducible

Sources: [Chandrashekhar Khare and Jean-Pierre Wintenberger](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>), §10.3.2, p. 93 of the preprint (The operations used: induction, twist, restriction.).

<a id="polarized-system"></a>
### Polarized weakly compatible systems

Let F/F⁺ be CM and ℛ a rank-n weakly compatible system over M. Let ℳ be a rank-one weakly compatible character system of G_F⁺ over the same M (enlarge M if necessary), with ramification set lying below that of ℛ. A polarized system is the pair (ℛ,ℳ) together with a representation-level polarization witness for every λ, imported from ArithmeticGaloisRepresentations G7: a perfect pairing B_{λ,v} with B(x,y)=ε_v B(y,x), B(r_λ(g)x,r_λ(c_v g c_v)y)=μ_λ(g)B(x,y), and ε_v=−μ_λ(c_v). It is totally odd when ε_v=+1 at every real v. Forgetting the pairings only retains essential conjugate self-duality; a polarization is more data. The totally-real version uses BLGGT §2.1’s orthogonal/symplectic pairing convention, not the CM sign equation imposed without a quadratic extension.

**Dependency and proof outline.**

1. Apply the cited statement with the conventions and hypotheses displayed above.

Inputs: [Rank-n weakly compatible systems of l-adic representations](#weakly-compatible-system-rank-n); `ArithmeticGaloisRepresentations:G7`.

**Uses that determine the API.**

- `PotentialAutomorphyInfrastructure:PA.5`: Track the lifting input and multiplier after tensor operations.
- [Constituents of an essentially conjugate self-dual system](#constituents-essentially-self-dual): Restrict the actual pairing to the selected constituent.

**API determined by its uses.**

- `TauCeti.CompatibleSystems.PolarizedSystem` (structure): Pair ℛ,ℳ with an actual polarization witness at every λ.
- `TauCeti.CompatibleSystems.PolarizedSystem.multiplier` (projection): The rank-one character system ℳ of G_F⁺, including μ(c_v).
- `TauCeti.CompatibleSystems.PolarizedSystem.pairing` (projection): The perfect representation-level pairing from G7, for each λ and real place v.
- `TauCeti.CompatibleSystems.PolarizedSystem.IsTotallyOdd` (data): All pairing signs ε_v are +1; for CM this requires μ(c_v)=−1.
- `TauCeti.CompatibleSystems.PolarizedSystem.conjugateDual` (compatibility): Each r_λ^c is isomorphic to r_λ∨⊗μ_λ|G_F, with the specified pairing.

**Discriminating tests.**

- `polarized_cm_unit` (degenerate): The trivial rank-one system on G_F has a symmetric pairing and CM multiplier δ_F/F⁺, with μ(c_v)=−1; multiplier 1 has the wrong BLGGT sign.
- `polarized_rank_two` (computation): For the cohomological elliptic family over a CM field, use the rank-two duality pairing with the properly normalized multiplier and its real-place sign; total oddness is tested on the actual conjugate pairing, not only det on G_F.
- `polarized_multiplier_wrong` (non-example): Changing μ(c_v) while retaining the same pairing reverses the required CM equation ε_v=−μ(c_v).
- `polarized_forget_pairing` (compatibility): Forget the chosen G7 pairing to obtain r^c≅r∨⊗μ; the converse requires a correctly signed perfect pairing, not a Prop-valued token.

**Acceptance checks.**

- Verify the stated hypotheses and the supplier interfaces; no existence or automorphy endpoint is assumed.

Sources: [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor](<https://arxiv.org/pdf/1010.2561v4>), §2.1, p.31; §5.1, p.62 (Representation-level signs and the system pair (ℛ,ℳ).).

<a id="polarized-operations"></a>
### Operations on polarized systems

For CM F/F⁺, put δ=δ_F/F⁺. Duality takes multiplier μ⁻¹ and the same sign; tensoring (ℛ,μ,ε) and (ℛ′,μ′,ε′) takes multiplier μμ′δ and sign εε′, so both totally odd inputs give a totally odd output. The quadratic correction changes no restriction to G_F but is necessary at c_v. For k≥1, ∧^k and Sym^k have inherited pairing sign ε^k and multiplier μ^kδ^(k−1), in characteristic zero (on nonzero representations). At k=0 the unit system has multiplier δ and sign +1; equivalently use the integer exponent k−1 in the formula. Direct sum requires a common multiplier and common signs; otherwise the block pairing is not a polarization of one pair. Twisting by a character χ of G_F uses μ times the norm character χχ^c extended to G_F⁺ with value +1 at c_v. Restriction is along a CM extension with matched real subfield; induction retains polarization only with a specified compatible extension of the multiplier and the induced perfect pairing/sign check. Regularity and irreducibility must be checked separately.

**Dependency and proof outline.**

1. Apply the cited statement with the conventions and hypotheses displayed above.

Inputs: [Polarized weakly compatible systems](#polarized-system); [Linear-algebra operations on weakly compatible systems and what they preserve](#linear-algebra-operations-on-systems); `ArithmeticGaloisRepresentations:G7`.

**Uses that determine the API.**

- `PotentialAutomorphyInfrastructure:PA.5`: Validate the tensor trick’s multiplier and total oddness.
- [Linear-algebra operations on weakly compatible systems and what they preserve](#linear-algebra-operations-on-systems): Refine the generic operations with polarization witnesses.

**API determined by its uses.**

- `TauCeti.CompatibleSystems.PolarizedSystem.tensor` (constructor): Tensor pairings and multiplier μμ′δ; signs multiply.
- `TauCeti.CompatibleSystems.PolarizedSystem.dual` (constructor): Dual perfect pairings and inverse multiplier.
- `TauCeti.CompatibleSystems.PolarizedSystem.twist` (constructor): Twist by χ with norm-character multiplier correction.
- `TauCeti.CompatibleSystems.PolarizedSystem.power` (constructor): Symmetric/exterior k-th pairing with μ^kδ^(k−1) and ε^k.
- `TauCeti.CompatibleSystems.PolarizedSystem.tensor_isTotallyOdd` (relation): Two totally odd CM systems yield a totally odd normalized tensor system.

**Discriminating tests.**

- `polarized_tensor_sign` (computation): ε=ε′=+1, μ(c)=μ′(c)=−1: uncorrected product has μμ′(c)=+1; corrected μμ′δ(c)=−1.
- `polarized_dual_sign` (compatibility): Inverse of a −1 multiplier at c is −1, matching the unchanged +1 sign.
- `polarized_unit_tensor` (degenerate): The polarized CM unit has μ=δ; tensoring it with (ℛ,μ) gives μδδ=μ.
- `polarized_sum_mismatch` (non-example): A block sum of pairings with signs +1 and −1 is neither symmetric nor alternating; there is no common sign without changing the inputs.

**Acceptance checks.**

- Verify the stated hypotheses and the supplier interfaces; no existence or automorphy endpoint is assumed.

Sources: [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor](<https://arxiv.org/pdf/1010.2561v4>), §2.1, p.31; §5.1, p.62; tensor-product use in §4.3 (Derived system-level pairing operations from §2.1 covariance and CM sign equation. Multiplication by δ corrects the extension of the multiplier at real conjugations; these explicit formulas are a derivation from the definition.).

<a id="character-system"></a>
### Compatible systems of algebraic Hecke characters

For a type-A₀ algebraic Hecke character χ of a number field F, choose a number field M containing its algebraic finite values. Its ℓ-adic realizations give a rank-one weakly compatible system, de Rham at every coefficient place and crystalline away from a fixed finite conductor set. In BLGGT convention HT_τ={a_τ} when χ at connected infinity is ∏(τx)^−a_τ. Good geometric Frobenius polynomial is X−r_λ(Frob_v), transported from the common algebraic value by class field theory. Conversely, every finitely ramified algebraic/de Rham ℓ-adic character comes from such χ, up to the fixed reciprocity convention; Hecke characters and their algebraic infinity-type purity are imported from GlobalNumberFields Layers 9–10, reciprocity from ClassFieldTheory Layers 11–12, and the ℓ-adic realization/classification comparison is requested as ClassFieldTheory, Part II. These constructions are not duplicated here.

**Dependency and proof outline.**

1. Apply the cited statement with the conventions and hypotheses displayed above.

Inputs: `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`; `tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`; [Rank-n weakly compatible systems of l-adic representations](#weakly-compatible-system-rank-n); `ArithmeticGaloisRepresentations:R01.1`; `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

**Uses that determine the API.**

- [Purity of character systems](#rank-one-purity): The algebraic character’s infinity type determines its pure weight.
- [Reducibility of rank-2 systems over ℚ does not depend on λ](#rank-two-reducibility-independent-of-lambda): Propagate the two Hodge–Tate character constituents.

**API determined by its uses.**

- `TauCeti.CompatibleSystems.characterSystem` (constructor): Assemble the common-field rank-one family from the owner’s algebraic Hecke character realizations.
- `TauCeti.CompatibleSystems.characterSystem_hodge` (compatibility): H_τ={a_τ} for connected-infinity exponent −a_τ.
- `TauCeti.CompatibleSystems.characterSystem_frob` (compatibility): The common linear polynomial matches the geometric Frobenius value with the chosen Artin convention.
- `TauCeti.CompatibleSystems.characterSystem_unique` (extensionality): Unique up to memberwise representation isomorphism from good Frobenius polynomials.

**Discriminating tests.**

- `character_trivial` (degenerate): χ=1 gives Q_v=X−1, H={0}, weight 0.
- `character_cyclotomic` (computation): The algebraic idele norm ||·||_F gives the cyclotomic family in the geometric Artin convention: H={−1}, Q_p=X−p⁻¹, pure weight −2.
- `character_finite_order` (computation): A finite-order Hecke character has H={0}, all good roots roots of unity, and weight 0.
- `character_non_algebraic` (non-example): An arbitrary continuous character with nonintegral infinity exponent has no type-A₀ algebraic realization theorem and is not accepted by this constructor.

**Acceptance checks.**

- Verify the stated hypotheses and the supplier interfaces; no existence or automorphy endpoint is assumed.

Sources: [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor](<https://arxiv.org/pdf/1010.2561v4>), Appendix A.2, p.87, before Lemma A.2.1 (Algebraic character realizations, Hodge numbers, weight properties and pure WD parameters.); [Patrick Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor, Jack Thorne](<https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf>), §7.1, pp.1085,1092 (Rank-one extremely weak systems are de Rham and pure; the character realization argument is imported.).

<a id="rank-one-purity"></a>
### Purity of character systems

Every rank-one weakly compatible system is pure of an integer weight w. More generally the same conclusion holds for rank-one extremely weak data of ACC+ §7.1: actual semisimple members with common linear good Frobenius polynomials and the determinant Hodge condition at every λ. Algebraic character classification gives one integer w with a_{cτ}+a_τ=w and |ιr(Frob_v)|²=q_v^w for every good v and complex embedding. The algebraic Hecke-character realization supplies pure local WD parameters as well. This does not assert purity for arbitrary continuous nonalgebraic character data.

**Dependency and proof outline.**

1. Import the de Rham/algebraic Hecke-character classification from the rank-one owner.
2. Use the global infinity-type relation a_τ+a_cτ=w and the common geometric Frobenius values to prove both clauses of system purity.
3. Use the owner’s pure WD character theorem for the stronger local assertion.

Inputs: [Compatible systems of algebraic Hecke characters](#character-system); [Predicates on weakly compatible systems: regular, strictly compatible, pure, self-dual, irreducible, automorphic](#compatible-system-predicates); [Very weak and extremely weak compatible data](#weakened-compatible-data); `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`.

**Acceptance checks.**

- Verify the stated hypotheses and the supplier interfaces; no existence or automorphy endpoint is assumed.

Sources: [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor](<https://arxiv.org/pdf/1010.2561v4>), Appendix A.2, p.87, items (1),(2),(8) (Weights and pure local parameters of algebraic characters.); [Patrick Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor, Jack Thorne](<https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf>), §7.1, p.1092, purity paragraph (Rank-one purity before potential automorphy consequences.).

<a id="artin-system"></a>
### Compatible systems of Artin representations

Let a finite quotient Γ of G_F and a characteristic-zero finite-dimensional representation a over a number field M be given. Use coefficient extension along every M↪M̄_λ to form a compatible Artin family. Choose S containing every prime ramified in the finite quotient. Members have finite image, hence de Rham/potentially unramified with H_τ consisting of n copies of 0, and are crystalline at coefficient places outside S. Good polynomials are the characteristic polynomials of a(Frob_v), their eigenvalues roots of unity. This construction uses the finite quotient representation and coefficient extension from R01.1, and has weight zero; finite-image does not imply irreducible or regular.

**Dependency and proof outline.**

1. Apply the cited statement with the conventions and hypotheses displayed above.

Inputs: [Rank-n weakly compatible systems of l-adic representations](#weakly-compatible-system-rank-n); `ArithmeticGaloisRepresentations:R01.1`; `ArithmeticGaloisRepresentations:G7`; `PadicHodgeTheory:R06.2`; `mathlib:Representation`; `mathlib:LinearMap.charpoly`.

**Uses that determine the API.**

- [Purity of Artin systems up to twist](#artin-twist-purity): Tensor finite-order Frobenius eigenvalues with the algebraic character family.

**API determined by its uses.**

- `TauCeti.CompatibleSystems.artinSystem` (constructor): Extend the given finite-quotient number-field representation to every coefficient place.
- `TauCeti.CompatibleSystems.artinSystem_hodge` (compatibility): H_τ is n copies of zero.
- `TauCeti.CompatibleSystems.artinSystem_charpoly` (compatibility): Q_v is the characteristic polynomial of the finite quotient Frobenius element.
- `TauCeti.CompatibleSystems.artinSystem_pure` (relation): The Artin family is pure of weight 0 with finite-monodromy local WD data.

**Discriminating tests.**

- `artin_trivial` (degenerate): The trivial rank-one quotient gives Q_v=X−1 and H={0}.
- `artin_quadratic` (computation): For a quadratic character, good Q_v is X−1 at split primes, X+1 at inert primes.
- `artin_rank_two_irregular` (non-example): Any rank-two Artin family has H={0,0}, so it is not regular, even when its finite-group representation is irreducible.
- `artin_roots_unity` (characterisation): Finite-order matrices have eigenvalues roots of unity under every complex embedding; their absolute value is 1.

**Acceptance checks.**

- Verify the stated hypotheses and the supplier interfaces; no existence or automorphy endpoint is assumed.

Sources: [Patrick Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor, Jack Thorne](<https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf>), §7.1, pp.1086,1092 (The Artin-up-to-twist purity observation; the finite-quotient family, zero Hodge weights and root-of-unity polynomials are the explicit untwisted construction used in that observation.).

<a id="induced-character-purity"></a>
### Purity of systems induced from characters

For a finite extension F′/F and a pure rank-one character system ℭ/F′ of weight w, Ind_F′^F ℭ with canonical induced Hodge multiset H_τ=⊔_{σ|τ}H_σ is a pure system of weight w after adjoining ramified primes to S. This also applies to induction of rank-one extremely weak character data when H is the transported character Hodge data. At a good v the eigenvalues in each residue-degree-f block satisfy β^f=α_w with |ια_w|²=q_w^w=(q_v^f)^w, hence |ιβ|²=q_v^w. It is not a regularity or irreducibility theorem. No purity claim is made for arbitrary freely chosen higher-rank Hodge metadata with only the correct determinant sum.

**Dependency and proof outline.**

1. Construct local induction blocks; compute their good Frobenius roots via β^f=α_w.
2. Apply character purity to the source roots and convert q_w=q_v^f.
3. The conjugate Hodge relation survives the union over embeddings σ extending τ.

Inputs: [Purity of character systems](#rank-one-purity); [Twisting, restriction and induction of compatible systems](#system-operations); [Very weak and extremely weak compatible data](#weakened-compatible-data).

**Acceptance checks.**

- Verify the stated hypotheses and the supplier interfaces; no existence or automorphy endpoint is assumed.

Sources: [Patrick Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor, Jack Thorne](<https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf>), §7.1, p.1092, purity paragraph (Purity for induction of an extremely weak character system with its induced data.); [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor](<https://arxiv.org/pdf/1010.2561v4>), §5.1, pp.62–63 (Operations and the two clauses of purity.).

<a id="artin-twist-purity"></a>
### Purity of Artin systems up to twist

If ℛ=𝒜⊗ℭ where 𝒜 is a rank-n Artin system and ℭ a rank-one algebraic character system of weight w, with H_τ the canonical n copies of the character Hodge number, then ℛ is pure of weight w. Every good eigenvalue is ζα with ζ a root of unity and α the character Frobenius value. For rank-two extremely weak systems that are Artin up to twist in the ACC+ sense, use the actual character twist and canonical Hodge data (or a very weak realization) to obtain this statement; merely choosing arbitrary higher-rank Hodge multisets of the same determinant sum does not imply Hodge purity.

**Dependency and proof outline.**

1. Use |ιζ|=1 and character purity to compute the good eigenvalue absolute values.
2. Transport the character Hodge symmetry to its repeated multiset.
3. No potential-automorphy theorem enters either step.

Inputs: [Compatible systems of Artin representations](#artin-system); [Purity of character systems](#rank-one-purity); [Linear-algebra operations on weakly compatible systems and what they preserve](#linear-algebra-operations-on-systems); [Very weak and extremely weak compatible data](#weakened-compatible-data).

**Acceptance checks.**

- Verify the stated hypotheses and the supplier interfaces; no existence or automorphy endpoint is assumed.

Sources: [Patrick Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor, Jack Thorne](<https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf>), §7.1, pp.1086,1092 (Artin-up-to-twist definition and purity observation, with the canonical-Hodge qualification recorded in source issue E4.).

<a id="system-l-functions"></a>
### L-functions, Γ-factors and ε-factors of a compatible system

The partial L-function is L^S(ıℛ, s) = ∏_{v∉S} q_v^{ns}/ıQ_v(q_v^s); it converges to an analytic function on Re s > 1 + w/2 if ℛ is pure of weight w, and if every place above l lies in S it depends only on r_λ (λ | l). If ℛ is strictly compatible, L(ıℛ, s) = ∏_{v∤∞} L(ıWD_v(ℛ), s) differs from L^S by finitely many Euler factors. For ℛ strictly compatible, pure of weight w and regular, with Γ_ℝ(s) = π^{−s/2}Γ(s/2) and Γ_ℂ(s) = 2(2π)^{−s}Γ(s) = Γ_ℝ(s)Γ_ℝ(s + 1), and following BLGGT v4: for v complex, with τ, τ′ the two embeddings with ı∘τ, ı∘τ′ extending to F_v ≅ ℂ, L_v(ıℛ, s) = Γ_ℂ(s − w/2)^n ∏_{h∈H_τ, h<w/2}(Γ_ℂ(s − h)/Γ_ℂ(s − w/2)) ∏_{h∈H_{τ′}, h<w/2}(Γ_ℂ(s − h)/Γ_ℂ(s − w/2)) and ε_v = i^{Σ_{h∈H_τ}|h − w/2| + Σ_{h∈H_{τ′}}|h − w/2|}; for v real, with d± = n/2 (n even) or (n ± (−1)^{w/2}det ℛ(c_v))/2 (n odd, w even), L_v(ıℛ, s) = Γ_ℝ(s − w/2)^{d+}Γ_ℝ(s + 1 − w/2)^{d−} ∏_{h∈H_τ, h<w/2}(Γ_ℂ(s − h)/Γ_ℂ(s − w/2)) and ε_v = i^{d− + Σ_{h∈H_τ}|h − w/2|}. Then Λ(ıℛ, s) = L(ıℛ, s)∏_{v|∞}L_v(ıℛ, s) and ε(ıℛ, s) = ∏_{v∤∞}ε(ıWD_v(ℛ), ψ_v, s)∏_{v|∞}ε_v(ıℛ, ψ_v, s), for the standard additive character ψ of 𝔸_F/F. (BLGGT v1 instead used Γ_ℂ(s − w/2)^{n/2}-type factors and a separate Hodge factor L({H_τ}, s), which is undefined for odd w; see PotentialModularityAndCompatibleSystems/E2.)

The following qualifications are part of the contract:

- ℛ = (M, S, {Q_v(X)}, {r_λ}, {H_τ}) a weakly compatible system of l-adic representations of G_F of rank n (R24.5/weakly-compatible-system-rank-n); ı : M ↪ ℂ.
- For the completed function: strictly compatible, pure of weight w and regular.

**Dependency and proof outline.**

1. det r_λ(c_v) = ±1 is independent of λ because {det r_λ} is a weakly compatible system of characters; purity forces w even when n is odd and v real, so d± are integers.
2. Each quotient Γ_ℂ(s − h)/Γ_ℂ(s − w/2) with h < w/2 is a polynomial times a power of 2π when w − 2h is even, and a genuine Γ-quotient otherwise; the definition does not take roots.
3. Convergence for pure ℛ from |ια|² = q_v^w.

Inputs: [Rank-n weakly compatible systems of l-adic representations](#weakly-compatible-system-rank-n); [Predicates on weakly compatible systems: regular, strictly compatible, pure, self-dual, irreducible, automorphic](#compatible-system-predicates); `PadicHodgeTheory:R06.3/weil-deligne-parameter`; `EndoscopicTransferAndUnitaryTraceComparison:ET.6`; `mathlib:Complex.Gammaℝ`; `mathlib:Complex.Gammaℂ`; `mathlib:Complex.Gammaℝ_mul_Gammaℝ_add_one`.

**Uses that determine the API.**

- [The Grothendieck ring of semisimple ℓ-adic representations](#galois-grothendieck-ring): L^S of virtual classes
- `ModularityAndLanglandsExtensions:ML.2`: BLGGT Corollary 5.3.2: after potential automorphy (Theorem 5.3.1), L^S(ıℛ, s) continues meromorphically and Λ(ıℛ, s) = ε(ıℛ, s)Λ(ıℛ^∨, 1 − s)

**API determined by its uses.**

- `TauCeti.CompatibleSystems.partialLFunction` (constructor): L^S(ıℛ, s) as an Euler product.
- `TauCeti.CompatibleSystems.lFunction` (constructor): L(ıℛ, s) for strictly compatible ℛ.
- `TauCeti.CompatibleSystems.archimedeanGammaFactor` (constructor): L_v(ıℛ, s) at complex and real v in BLGGT v4's form, through Complex.Gammaℝ and Complex.Gammaℂ.
- `TauCeti.CompatibleSystems.archimedeanEpsilon` (constructor): ε_v(ıℛ, ψ_v, s) = i^{Σ|h − w/2|} (complex v) or i^{d− + Σ|h − w/2|} (real v).
- `TauCeti.CompatibleSystems.archimedeanD` (data): d± at a real place: n/2, or (n ± (−1)^{w/2}det ℛ(c_v))/2 for n odd.
- `TauCeti.CompatibleSystems.completedLFunction` (constructor): Λ(ıℛ, s) and ε(ıℛ, s).
- `TauCeti.CompatibleSystems.partialLFunction_converges` (characterisation): Convergence on Re s > 1 + w/2 for pure ℛ.
- `TauCeti.CompatibleSystems.partialLFunction_eq_of_lambda` (compatibility): L^S(ıℛ, s) = L^S(ı̃r_λ, s) when S contains the places above l.

**Discriminating tests.**

- `trivial_character` (compatibility): F = ℚ, n = 1, r_λ trivial: w = 0, d+ = 1, d− = 0, H = {0} has no h < 0, so L_∞ = Γ_ℝ(s) and ε_∞ = 1; Λ(ı1, s) = Γ_ℝ(s)ζ(s) is completedRiemannZeta, and Λ(1 − s) = Λ(s) is the functional equation with ε = 1 (suggested file).
- `gamma_duplication` (compatibility): Γ_ℂ(s) = Γ_ℝ(s)Γ_ℝ(s + 1) is Mathlib's Complex.Gammaℝ_mul_Gammaℝ_add_one (suggested file).
- `cyclotomic_character` (compatibility): F = ℚ, r_λ = ε_l in BLGGT's conventions (Frob_v geometric, HT_τ(ε_l) = {−1}): Q_p(X) = X − p^{−1}, weight −2, L^S(ıε_l, s) = ζ^S(s + 1); d+ = (1 + (−1)(−1))/2 = 1, d− = 0, so L_∞ = Γ_ℝ(s + 1) and ε_∞ = i^{0 + |−1 + 1|} = 1 (suggested file).
- `elliptic_curve_gamma_factor` (compatibility): F = ℚ, ℛ = H¹ of an elliptic curve: n = 2, w = 1, H = {0, 1}, d± = 1, so L_∞ = Γ_ℝ(s − 1/2)Γ_ℝ(s + 1/2)·Γ_ℂ(s)/Γ_ℂ(s − 1/2) = Γ_ℂ(s) and ε_∞ = i^{1 + 1/2 + 1/2} = −1 (suggested file). v1's Hodge factor is undefined here (w odd).

**Acceptance checks.**

- BLGGT note that these give the usual Λ and ε (Tate, Number theoretic background).
- The functional equation Λ(ıℛ, s) = ε(ıℛ, s)Λ(ıℛ^∨, 1 − s) is a consequence of potential automorphy (BLGGT v4 Corollary 5.4.3), which this stage does not assume; it is planned in ModularityAndLanglandsExtensions ML.2.

Sources: [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor](<https://arxiv.org/pdf/1010.2561v1>), §5.1, pp. 52–53 (arXiv v1) (The definitions of L^S, L, the archimedean Γ- and ε-factors, the Hodge factors, Λ and ε in §5.1.); [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor](<https://arxiv.org/pdf/1010.2561v4>), §5.1, pp. 63–64 (arXiv v4) (The v4 archimedean factors, replacing v1's Hodge factor.).

<a id="galois-grothendieck-ring"></a>
### The Grothendieck ring of semisimple ℓ-adic representations

For a number field F and prime l, 𝒢𝒢_{F,l} is the category of semisimple continuous representations of G_F on finite-dimensional ℚ̄_l-vector spaces unramified almost everywhere (with cancellation U ⊕ W ≅ V ⊕ W ⇒ U ≅ V by traces), and Rep_{F,l} is its Grothendieck group, a commutative ring under semisimplified ⊗. It carries: trace homomorphisms tr σ (continuous class functions, separating classes on a dense set); dim = tr 1 ∈ ℤ; the nondegenerate symmetric ℤ-valued Hom pairing ([U], [V]) = dim Hom_{G_F}(U, V), with (A, A) = Σn_i² for A = Σn_i[V_i], so that dim A > 0 and (A, A) = 1 force A = [V] irreducible; the product formula for tensor products along a Zariski-dense θ : G_F → G₁ × G₂; conjugation conj_σ; restriction res_{F′/F} (a ring map); induction ind_{F′/F} with its trace formula, dim ind = [F′ : F] dim, the projection formula, Frobenius reciprocity and Mackey's formula; Brauer induction A = Σ n_i ind_{F_i′/F}([ı^{−1}ψ_i] res A) with the resulting pairing formula; and, for A unramified outside S ⊇ {v | l}, L^S(ıA, s) = ∏ L^S(ıV_i, s)^{n_i}, additive in A and with L^S(ı ind A, s) = L^{S′}(ıA, s) (§5.4 (1)–(9)).

The following qualifications are part of the contract:

- F a number field; l a prime; ı : ℚ̄_l ≅ ℂ for L-functions.

**Dependency and proof outline.**

1. Items (1)–(7) are formal from semisimplicity and characters; (5) uses Zariski density to identify Hom spaces with those of algebraic representations.
2. (8): trace formula for induced characters, Frobenius reciprocity and Mackey's double-coset formula; (8f) is Brauer's induction theorem for Gal(F′/F), transported by ı^{−1} and multiplied by A.
3. (9): independence of the decomposition, from the additivity of L^S on direct sums and inductivity of partial L-functions.

Inputs: [L-functions, Γ-factors and ε-factors of a compatible system](#system-l-functions); [Twisting, restriction and induction of compatible systems](#system-operations); [Linear-algebra operations on weakly compatible systems and what they preserve](#linear-algebra-operations-on-systems); `ArithmeticGaloisRepresentations:R01.5`; `ArithmeticGaloisRepresentations:R01.1`; `ArithmeticGaloisRepresentations:G7`; `mathlib:Rep.indResAdjunction`; `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction`.

**Uses that determine the API.**

- `ModularityAndLanglandsExtensions:ML.2`: BLGGT Theorems 5.4.1–5.4.3 (a representation as a member of a compatible system, irreducibility of r_{l,ı}(π) for density-one l, and splitting a system into irreducible systems), argued by Brauer induction in this ring
- [The compatible system through a potentially modular lift, by Brauer induction](#brauer-induction-system): Norm-one pairing proves that the virtual combination is a genuine irreducible representation.

**API determined by its uses.**

- `TauCeti.CompatibleSystems.RepRing` (constructor): Rep_{F,l} with ⊗ as multiplication.
- `TauCeti.CompatibleSystems.RepRing.trace` (constructor): tr σ : Rep_{F,l} → ℚ̄_l, a ring homomorphism.
- `TauCeti.CompatibleSystems.RepRing.pairing` (constructor): (A, B) = dim Hom, extended bilinearly.
- `TauCeti.CompatibleSystems.RepRing.eq_irreducible_of_pairing_eq_one` (characterisation): Positive dimension and (A,A)=1 imply A is the class of one genuine irreducible; expand A in the irreducible basis and use Σn_i²=1.
- `TauCeti.CompatibleSystems.RepRing.res` (functoriality): Restriction, a ring homomorphism.
- `TauCeti.CompatibleSystems.RepRing.ind` (functoriality): Induction with trace formula, projection formula, Frobenius reciprocity and Mackey.
- `TauCeti.CompatibleSystems.RepRing.brauer` (relation): A = Σ n_i ind([ı^{−1}ψ_i] res A).
- `TauCeti.CompatibleSystems.RepRing.partialLFunction` (constructor): L^S(ıA, s) = ∏ L^S(ıV_i, s)^{n_i}, additive and inductive.

**Discriminating tests.**

- `pairing_norm` (computation): A = 2[V₁] − [V₂] with V₁ ≇ V₂ irreducible: (A, A) = 4 + 1 = 5, and dim A = 2 dim V₁ − dim V₂ may be negative.
- `trivial_class` (degenerate): [1] is the unit, with (1, 1) = 1 and dim 1 = 1.
- `induced_dimension` (computation): dim ind_{F′/F}[1] = [F′ : F], and (ind[1], [1]) = 1 by Frobenius reciprocity.
- `virtual_not_genuine` (non-example): For the virtual C₂ class A=3·1−ε, dim A=2 but (A,A)=10; rank two alone fails genuineness. Norm-one plus positive dimension is the criterion actually used.

**Acceptance checks.**

- This is the bookkeeping behind BLGGT Theorems 5.4.1–5.4.2 (potential automorphy consequences, not planned in this stage).

Sources: [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor](<https://arxiv.org/pdf/1010.2561v1>), §5.4, items (1)–(9), pp. 61–63 (arXiv v1) (The group-theoretic preliminaries of §5.4, items (1)–(9).).

<a id="rank-two-reducibility-independent-of-lambda"></a>
### Reducibility of rank-2 systems over ℚ does not depend on λ

For a rank-two weakly compatible system over ℚ in Taylor’s §6 sense, absolute reducibility of one characteristic-zero member implies absolute reducibility of every member. The two Hodge–Tate characters at that member fit into algebraic Hecke-character systems by Serre; their direct sum has the same good Frobenius polynomials, so recognition identifies every other member. This is independence of characteristic-zero reducibility, not independence of residual reducibility.

The following qualifications are part of the contract:

- Taylor derives Lemma 6.5 from the classification of one-dimensional Hodge–Tate representations of G_ℚ: each is a finite-order character times an integral cyclotomic power. Thus the two constituents extend to rank-one systems with shared good Frobenius polynomials.

**Dependency and proof outline.**

1. Each constituent is a Hodge–Tate character and hence belongs to an algebraic Hecke-character family (rank-one supplier).
2. The two character families sum to the same common good Frobenius polynomials.
3. Apply R01.5 recognition for every λ.

Inputs: [Rank-n weakly compatible systems of l-adic representations](#weakly-compatible-system-rank-n); [Predicates on weakly compatible systems: regular, strictly compatible, pure, self-dual, irreducible, automorphic](#compatible-system-predicates); `ArithmeticGaloisRepresentations:R01.5`; [Compatible systems of algebraic Hecke characters](#character-system); [Very weak and extremely weak compatible data](#weakened-compatible-data).

**Acceptance checks.**

- Check Lemma 6.5 on the system of a CM newform: irreducible at every λ, although it becomes reducible on restriction to the CM field.

Sources: [Richard Taylor](<https://ems.press/content/book-chapter-files/27484>), §6, before Lemma 6.5, p. 773 (PDF page 45) (The proof indication for Lemma 6.5.); [Richard Taylor](<https://ems.press/content/book-chapter-files/27484>), §6, after Lemma 6.5, p. 774 (PDF page 46) (Reducible and irreducible rank-2 systems.).

<a id="monodromy-component-field"></a>
### The common component field of a compatible system

Let ℛ be a weakly compatible system of G_F. With G_λ the Zariski closure of r_λ(G_F), there is one finite Galois F¹/F inducing Gal(F¹/F)≅G_λ/G_λ⁰ for every λ. If ℛ is regular, every irreducible subrepresentation under any open subgroup has multiplicity one, and after a single finite coefficient-field extension every such subrepresentation is defined over M_λ with a stable O_{M,λ}-lattice. No canonical lattice is selected.

**Dependency and proof outline.**

1. Import Larsen–Pink Proposition 6.14/Serre for the common component field (recorded gap).
2. Sen’s theorem gives distinct weights on a maximal torus of connected monodromy; hence regular constituents have multiplicity one.
3. Choose good Frobenius elements with distinct eigenvalues and enlarge the coefficient field by their two splitting fields at different residue characteristics. Apply BLGGT Lemma A.1.5: a semisimple characteristic-zero representation with traces in M and one element having distinct M-rational eigenvalues is defined over M. Its trace-pairing/Wedderburn proof is supplied by R01.5, consuming upstream SemisimpleAlgebras Layers 1–2. Compactness then gives a stable lattice for each constituent, with no canonical choice.

Inputs: [Rank-n weakly compatible systems of l-adic representations](#weakly-compatible-system-rank-n); `ArithmeticGaloisRepresentations:G7`; `ArithmeticGaloisRepresentations:R01.5`.

**Acceptance checks.**

- Verify the stated hypotheses and the supplier interfaces; no existence or automorphy endpoint is assumed.

Sources: [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor](<https://arxiv.org/pdf/1010.2561v4>), Lemma 5.3.1, pp.70–71 (Common component field, multiplicity one, and uniform coefficient extension; v1 Lemma 5.2.1 only states the first part.); [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor](<https://arxiv.org/pdf/1010.2561v4>), Appendix A.1 Lemma A.1.5, p.85 (The coefficient-descent criterion used in Lemma 5.3.1; its split-eigenvalue hypothesis removes the descent obstruction.).

<a id="constituents-essentially-self-dual"></a>
### Constituents of an essentially conjugate self-dual system

Let F be an imaginary CM field, (ℛ,ℳ) a pure, extremely regular polarized weakly compatible system, F′/F a finite extension and s an irreducible subrepresentation of r_λ|G_F′. There is a CM field F″ with F⊆F″⊆F′ such that s is invariant under G_F″ and (s, μ_λ|G_F″⁺) is a polarized representation; it is totally odd when (ℛ,ℳ) is. The field is a CM descent field, not an arbitrary totally-real intermediate field. Purity and extreme regularity force the selected Hodge subset to be stable under the polarized duality.

The following qualifications are part of the contract:

- F imaginary CM (BLGGT v4 Lemma 5.4.5; v1 Lemma 5.2.3 allowed F CM or totally real); (ℛ, ℳ) polarized; ℛ pure and extremely regular; s irreducible, which the last step of the proof uses.

**Dependency and proof outline.**

1. Choose τ so that distinct equal-size subsets of H_τ have distinct sums (extreme regularity) and τ₁ on the normal closure F₁ of F′/F⁺; submodules of the same dimension are equal iff the Hodge–Tate numbers of their determinants agree, so constituents have multiplicity one.
2. Purity gives h_σ + h_{σc} = w dim s, so s^{σcc′} = s^σ; the group generated by products cc′ of complex conjugations cuts out the maximal CM subfield F″ of F′, and s extends to G_{F″}.
3. Comparing Hodge–Tate numbers, s^c ≅ μ_λ s^∨, realised by restricting the pairing matrix A_{λ,v}; this gives the parity statement.

Inputs: [Predicates on weakly compatible systems: regular, strictly compatible, pure, self-dual, irreducible, automorphic](#compatible-system-predicates); [Linear-algebra operations on weakly compatible systems and what they preserve](#linear-algebra-operations-on-systems); [Polarized weakly compatible systems](#polarized-system).

**Acceptance checks.**

- Check that extreme regularity, not only regularity, is what is used: it separates equal-dimensional submodules by the Hodge–Tate numbers of their determinants, which gives multiplicity one of the constituents of r_λ|_{G_{F₁}}.
- Check the output against R24.5/linear-algebra-operations-on-systems: restriction to G_{F′} may break irreducibility, and the lemma records what survives for polarized systems (each constituent descends to a CM field F″ ⊆ F′ and stays essentially conjugate self-dual with the same μ_λ, totally odd if (r_λ, μ_λ) is).

Sources: [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor](<https://arxiv.org/pdf/1010.2561v1>), §5.2, Lemma 5.2.3, pp. 58–59 (arXiv v1) (Lemma 5.2.3 and its proof.); [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor](<https://arxiv.org/pdf/1010.2561v4>), §5.4, Lemma 5.4.5 and proof, p. 76 (arXiv v4) (Correct CM base, irreducible constituent, actual polarization and total-oddness hypotheses.).

<a id="larsen-rational-system-groups"></a>
### The algebraic groups attached to a rational compatible system (BLGGT v4 §5.2)

For each l: G_l the Zariski closure of r_l(G_F) in GL_n/Q_l, G⁰_l its identity component (reductive), Γ_l = r_l(G_F) ⊆ G_l(Q_l) (open, by Bogomolov), Γ⁰_l = Γ_l ∩ G⁰_l(Q_l); F⁰/F finite Galois with Gal(F⁰/F) ≅ Γ_l/Γ⁰_l for all l (Larsen–Pink 6.14); Z_l and G^der_l the centre and derived group of G⁰_l, G^ad_l = G⁰_l/Z_l, C_l = G⁰_l/G^der_l, G^sc_l the simply connected cover of G^ad_l, H_l = G^sc_l × Z_l ↠ G⁰_l; a constant A(n) with #ker(G^sc_l → G^ad_l) | A(n); Γ^Z_l = Γ⁰_l ∩ Z_l(Q_l), Γ^C_l the image of Γ⁰_l in C_l(Q_l) (open), Γ⁰⁰_l = Γ⁰_l ∩ Im(H_l(Q_l)), Γ^H_l its preimage in H_l(Q_l); a maximal torus T_l (unramified when G⁰_l is), with X*(T^ad) ⊆ X*(T^der) ⊆ X*(T^sc) ⊆ (1/A(n))X*(T^ad); a constant B(n) bounding the coordinates of weights of G^sc_l on V_l; and Serre's θ_l : S_{F⁰,l} → C_l agreeing with (r_l mod G^der_l) ∘ Art_{F⁰} on an open subgroup of O_{F⁰,l}^×.

The following qualifications are part of the contract:

- ℛ = (ℚ, S, {Q_v}, {r_l}, {H_τ}) a weakly compatible system with rational coefficients, r_l : G_F → GL_n(Q_l), V_l its space (BLGGT v4 §5.2); every construction below depends on ℛ.

**Dependency and proof outline.**

1. The kernels of Γ^H_l → Γ⁰_l and Γ^Z_l → Γ^C_l have order dividing A(n); their cokernels have order dividing A(n)³ and exponent dividing A(n) (H¹ of a finite central kernel, local Euler characteristic).
2. A(n), B(n) depend only on n because dim G^ad_l and dim V_l are bounded by n.
3. θ_l: Serre, Abelian l-adic representations III.1.2 and III.2.1, applied to r_l mod G^der_l (cited).

Inputs: [Rank-n weakly compatible systems of l-adic representations](#weakly-compatible-system-rank-n); [The common component field of a compatible system](#monodromy-component-field); `ArithmeticGaloisRepresentations:G7`.

**Uses that determine the API.**

- [Serre's θ_l with bounds uniform in l (BLGGT v4 Lemma 5.2.1)](#serre-theta-uniform-bounds): the objects bounded
- [Density-one sets of good primes for a rational system (BLGGT v4 Proposition 5.2.2, after Larsen)](#larsen-good-primes): the objects with good integral models

**API determined by its uses.**

- `TauCeti.CompatibleSystems.LarsenData.G` (data): G_l, the Zariski closure of the image, with G⁰_l, Z_l, G^der_l, G^ad_l, C_l, G^sc_l, H_l.
- `TauCeti.CompatibleSystems.LarsenData.componentField` (data): F⁰/F with Gal(F⁰/F) ≅ Γ_l/Γ⁰_l for every l.
- `TauCeti.CompatibleSystems.LarsenData.gammaH` (constructor): Γ^H_l ⊆ H_l(Q_l), the preimage of Γ⁰⁰_l.
- `TauCeti.CompatibleSystems.LarsenData.A` (other): A(n): #ker(G^sc_l → G^ad_l) | A(n), uniformly in ℛ and l.
- `TauCeti.CompatibleSystems.LarsenData.theta` (constructor): θ_l : S_{F⁰,l} → C_l.

**Discriminating tests.**

- `torus_case` (degenerate): CM-type systems: G⁰_l a torus, H_l = Z_l, and Γ^H_l = Γ^Z_l.
- `gl2_case` (computation): For a non-CM elliptic curve over ℚ: G⁰_ℓ=GL₂, G^sc_ℓ=SL₂, Z_ℓ=𝔾_m, C_ℓ=𝔾_m via det. The kernel of SL₂→PGL₂ has order 2, so 2 divides a uniform A(2); no universal choice A(2)=2 is asserted.
- `finite_image` (degenerate): An Artin representation: G⁰_l = 1, so F⁰ is the field cut out by r_l and all other groups are trivial.
- `theta_bound_depends_on_system` (non-example): A(n) and B(n) depend only on n, but C(ℛ) and D(ℛ) of Lemma 5.2.1 cannot be chosen independently of ℛ: for ℛ = ε^k over ℚ (n = 1), θ_l is x ↦ x^{±k}, so its exponent has absolute value |k|.

**Acceptance checks.**

- Check the torus case: if G⁰_l is a torus then G^der_l = 1, C_l = G⁰_l, H_l = Z_l, and θ_l is Serre's homomorphism for an abelian representation.

Sources: [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor](<https://arxiv.org/pdf/1010.2561v4>), §5.2, pp. 65–66 (arXiv v4) (The setup of §5.2 through the construction of θ_l.).

<a id="serre-theta-uniform-bounds"></a>
### Serre's θ_l with bounds uniform in l (BLGGT v4 Lemma 5.2.1)

(1) θ_l : S_{F⁰,l} → C_l is surjective. (2) If l ∉ S then θ_l = (r_l mod G^der_l) ∘ Art_{F⁰} on all of O_{F⁰,l}^×. (3) There is C(ℛ), independent of l, such that for every weight µ ∈ X*(Z_l) of Z_l on V_l, (A(n)µ) ∘ θ_l = Σ_σ m_{µ,σ}σ with |m_{µ,σ}| < C(ℛ). (4) There is D(ℛ) with #(X*(S_{F⁰,l})/θ_l*X*(C_l))_tor ≤ D(ℛ).

The following qualifications are part of the contract:

- ℛ = (ℚ, S, {Q_v}, {r_l}, {H_τ}) a weakly compatible system with rational coefficients, r_l : G_F → GL_n(Q_l), V_l its space (BLGGT v4 §5.2); every construction below depends on ℛ.

**Dependency and proof outline.**

1. (1): on an open U ⊆ O^× where θ_l agrees with the Galois side, the image is open, hence of finite index in the Zariski-dense image of G_{F⁰}; C_l is connected.
2. (2): for l ∉ S, r_l mod G^der_l is crystalline at l, and Conrad–Chai–Oort Proposition 6.3 extends the agreement to all of O^× (cited).
3. (3): −m_{µ,σ} is a Hodge–Tate number of (A(n)µ) ∘ (r_l mod G^der_l) (printed "mod G⁰_l", see PotentialModularityAndCompatibleSystems/E3); Wintenberger's ν_{HT,v} gives Hodge–Tate numbers as pairings ⟨µ, ν_{HT,v}⟩, bounded because the Hodge–Tate numbers of ℛ do not depend on l and roots are differences of weights.
4. (4) from (3).

Inputs: [The algebraic groups attached to a rational compatible system (BLGGT v4 §5.2)](#larsen-rational-system-groups).

**Acceptance checks.**

- Check (2) on the cyclotomic character: θ_l is the identity on 𝔾_m and agrees with ε_l ∘ Art on all of ℤ_l^× (ε_l crystalline).

Sources: [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor](<https://arxiv.org/pdf/1010.2561v4>), §5.2, Lemma 5.2.1 and proof, pp. 66–67 (arXiv v4) (Lemma 5.2.1 (1)–(4) and its proof.).

<a id="larsen-good-primes"></a>
### Density-one sets of good primes for a rational system (BLGGT v4 Proposition 5.2.2, after Larsen)

There is a set L of rational primes of Dirichlet density 1 such that for l ∈ L: (1) G⁰_l, hence Z_l, C_l, G^sc_l and H_l, are unramified (tori Z̃_l, C̃_l over ℤ_l); (2) there is a semisimple group scheme G̃^sc_l/ℤ_l with generic fibre G^sc_l and Γ^H_l = G̃^sc_l(ℤ_l) × Γ^Z_l (put H̃_l = G̃^sc_l × Z̃_l); (3) [Z̃_l(ℤ_l) : Γ^Z_l] is bounded independently of l; (4) the conjugation action of Γ_l on H_l extends uniquely to H̃_l, making V_l an H̃_l ⋊ Γ_l-module; (5) V_l contains an H̃_l ⋊ Γ_l-invariant ℤ_l-lattice; (6) there is an unramified M_λ/Q_l of bounded degree over which the G^sc_l-irreducible subquotients of V_l ⊗ Q̄_l are defined; for V_l ⊗ M_λ = ⊕V_{λ,i} (isotypic parts) and any H̃_l-invariant O_{M_λ}-lattice Λ, Λ = ⊕(Λ ∩ V_{λ,i}), and all irreducible G̃^sc_l(ℤ_l)-subquotients of Λ ∩ V_{λ,i} are absolutely irreducible, isomorphic to ρ̄_i, of dimension that of an irreducible constituent of V_{λ,i}, with ρ̄_i ≅ ρ̄_j only if i = j.

The following qualifications are part of the contract:

- ℛ = (ℚ, S, {Q_v}, {r_l}, {H_τ}) a weakly compatible system with rational coefficients, r_l : G_F → GL_n(Q_l), V_l its space (BLGGT v4 §5.2); every construction below depends on ℛ.

**Dependency and proof outline.**

1. (1): Larsen–Pink Proposition 8.9 (cited); T_l splits over an unramified extension of bounded degree.
2. (2): Larsen Theorem 3.17 (cited) gives G̃^sc_l with Γ^H_l ∩ G^sc_l(Q_l) = G̃^sc_l(ℤ_l), maximal compact, so Γ^H_l = G̃^sc_l(ℤ_l) × Γ^Z_l with Γ^Z_l open in Z̃_l(ℤ_l).
3. (3): Γ^C_l ⊇ θ_l(S̃(ℤ_l)) for l crystalline and unramified in F⁰; serre-theta-uniform-bounds (4) and Lemma A.1.6 bound [C̃_l(ℤ_l) : Γ^C_l] by D(ℛ), so [Z̃_l(ℤ_l) : Γ^Z_l] ≤ A(n)⁴D(ℛ).
4. (4): γG̃^sc_l and G̃^sc_l are the group schemes of special points of the Bruhat–Tits building with the same ℤ_l-points, hence equal (BT84 5.1.40, 5.2.8; cited).
5. (5): Larsen §1.12: an H̃_l(ℤ_l^nr)-invariant lattice, summed over Γ_l-translates.
6. (6): highest weights bounded in the fundamental-weight basis, so for large l they are restricted and the reductions ρ̄_{µ_i} are absolutely irreducible and distinct (Larsen §1.13); a simple-quotient argument splits Λ along the isotypic decomposition.

Inputs: [The algebraic groups attached to a rational compatible system (BLGGT v4 §5.2)](#larsen-rational-system-groups); [Serre's θ_l with bounds uniform in l (BLGGT v4 Lemma 5.2.1)](#serre-theta-uniform-bounds).

**Acceptance checks.**

- Check the use downstream: (6) is what makes the constituents of r̄_λ restricted to G̃^sc_l(ℤ_l) irreducible and distinct in residual-irreducibility-density-one.
- Check that (3) is not used downstream (BLGGT's own remark) and is recorded for completeness.

Sources: [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor](<https://arxiv.org/pdf/1010.2561v4>), §5.2, Proposition 5.2.2 and proof, pp. 68–70 (arXiv v4) (Proposition 5.2.2 (1)–(6) and its proof.).

<a id="residual-irreducibility-density-one"></a>
### Residual irreducibility over F(ζ_l) for a density-one set of primes

Let ℛ be a regular weakly compatible system of l-adic representations of G_F defined over M (BLGGT Proposition 5.2.2). For a subrepresentation s of r_λ write s̄ for the semisimplification of its reduction and l for the rational prime below λ. There is a set L of rational primes of Dirichlet density 1 such that if s is an irreducible subrepresentation of r_λ with λ above an element of L, then s̄|_{G_{F(ζ_l)}} is irreducible.

The following qualifications are part of the contract:

- ℛ = (M, S, {Q_v(X)}, {r_λ}, {H_τ}) a weakly compatible system of l-adic representations of G_F of rank n (R24.5/weakly-compatible-system-rank-n); ı : M ↪ ℂ.
- ℛ regular.

**Dependency and proof outline.**

1. Take F¹ from BLGGT Lemma 5.2.1 (R24.5/monodromy-component-field). Regularity gives an element of G_λ⁰ with n distinct eigenvalues (Harris–Taylor VII.1.8, I.2.2); Frobenius elements at primes split in F¹ are Zariski dense in G_λ⁰; after enlarging M (Galois over ℚ) every r_λ is integral and the irreducible constituents of r_λ|_H, H open, are defined over M_λ with multiplicity one.
2. For r_l = ε_l ⊕ ⊕_{λ|l} r_λ: the Zariski closure G_l with open image Γ_l (Bogomolov), F⁰ independent of l, the connected centre Z_l, C_l = G_l⁰/G_l^der, the simply connected cover G_l^{SC} with central kernels of order dividing a uniform A, and Serre's θ_l : S_l → C_l, whose exponents m_{μ,σ} are bounded by a constant B independent of l.
3. Larsen's density-one set L: l unramified in M and F⁰ with ℛ unramified above l (so r_l crystalline), l ≥ 4B + 4, G_l⁰ unramified, a semisimple model G̃_l^{SC}/ℤ_l with G̃_l^{SC}(ℤ_l) the preimage of the image of G_{F⁰} and perfect, and standard reductions of the constituents.
4. Two constituents agreeing on G̃_l^{SC}(ℤ_l) × Γ_l^{Z,1} differ by a power ε_l^b: solve Σ_i (m_{1,Frob^i σ_v} − m_{2,Frob^i σ_v})l^i = b(l^{f_v} − 1)/(l − 1) digit by digit using the bound B.
5. Write s ≅ Ind_{Γ_l¹}^{Γ_l} s₀ with s₀ an irreducible Γ_l⁰-constituent; since l is unramified in F⁰, s̄|_{G_{F(ζ_l)}} ≅ Ind s̄₀ over ker ε_l, irreducible because a conjugate s̄₀^γ ≅ s̄₀ε_l^a forces a = 0 (γ has finite order).
6. In v4 the density-one set and the integral models come from larsen-good-primes (v4 Proposition 5.2.2) applied to the rational system obtained by restriction of scalars, rather than from Larsen directly.

Inputs: [Predicates on weakly compatible systems: regular, strictly compatible, pure, self-dual, irreducible, automorphic](#compatible-system-predicates); [Rank-n weakly compatible systems of l-adic representations](#weakly-compatible-system-rank-n); [The common component field of a compatible system](#monodromy-component-field); [Density-one sets of good primes for a rational system (BLGGT v4 Proposition 5.2.2, after Larsen)](#larsen-good-primes).

**Acceptance checks.**

- Check the case n = 1: every s̄ is a character, so the conclusion holds with L the set of all primes.
- Check that the conclusion is the residual hypothesis of BLGGT Theorem 5.4.1 (4), ¯r|_{G_{F(ζ_l)}} irreducible, for every irreducible constituent s and not only for r_λ, and that it is asserted only on a density-one set of l: this is the precise condition under which irreducibility passes to reductions that R24.5:operations records.
- Check the dependencies: Larsen 1995 (1.12–1.13, 2.6, 3.15, 3.17) and Larsen–Pink 6.14 are recorded as gaps, not proved here.

Sources: [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor](<https://arxiv.org/pdf/1010.2561v1>), §5.2, Lemma 5.2.1 and Proposition 5.2.2, pp. 54–58 (arXiv v1) (Lemma 5.2.1 and Proposition 5.2.2 with its proof.); [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor](<https://arxiv.org/pdf/1010.2561v4>), §5.3, Proposition 5.3.2, p. 71 (arXiv v4) (v4 Proposition 5.3.2 (= v1 Proposition 5.2.2), whose proof now runs through v4 Proposition 5.2.2 (larsen-good-primes).).

## R24.3: prescribed lifts and their deformation-ring inputs

<a id="bockle-presentation"></a>
### Böckle's presentation of a global deformation ring (Proposition 1 of the appendix)

Let ρ̄ : G_ℚ → GL₂(k) be odd and absolutely irreducible, X a set of local deformation conditions, unramified outside a finite set S, and d ∈ {0, 1}, Ad_X = Ad⁰ρ̄ if X fixes the determinant (d = 0) and Ad_X = Adρ̄ otherwise (d = 1). Suppose (a) for ℓ ∈ S ∖ {p, ∞} the local ring R_{X,ℓ} is a complete intersection, flat over ℤ_p, of relative dimension h⁰(G_ℓ, Ad_X) − Δ_ℓ, and (b) R_{X,p} is a complete intersection, flat over ℤ_p, of relative dimension h⁰(G_p, Ad_X) + 1 + d − Δ_p. Then with Δ = ΣΔ_ℓ, R_X ≅ 𝒪⟦x₁, …, x_{n+d}⟧/(f₁, …, f_{n+Δ}) for some n. In particular, when Δ ≤ 0 (for instance minimal conditions, where Δ_ℓ = 0) the ring has at most as many relations as variables (Böckle's Corollary 1; KW Annals Proposition 3.4: W⟦X₁, …, X_r⟧/(f₁, …, f_s) with r ≥ s).

The following qualifications are part of the contract:

- oddness of ρ̄ enters through the global Euler characteristic (Böckle's formula [1, Lemma 5.5(ii)])
- the local hypotheses are hypotheses: they are supplied by LocalGaloisDeformationRings (R08.6), not proved here
- this is a presentation, not a lift-existence theorem: finiteness over 𝒪 must be added (R24.1)

**Dependency and proof outline.**

1. Choose auxiliary primes S_aux (Böckle [1], Corollary 6.4) and local presentations R_{X,ℓ} = 𝒪⟦X_{ℓ,1}, …⟧/J_ℓ.
2. Böckle [1], Theorem 5.6: R_X ≅ 𝒪⟦x₁, …, x_{n+d}⟧/J with J generated by at most Σ j_ℓ elements.
3. Count n + d from the tangent space with the global Euler characteristic (oddness) to get n + Δ = Σ j_ℓ.

Inputs: `GlobalGaloisDeformations:R04.3/local-to-global-presentation`; `GlobalGaloisDeformations:R04.3/relative-tangent-space`; `LocalGaloisDeformationRings:R08.6/kw-local-conditions`.

**Acceptance checks.**

- Check the count on the minimal case: every Δ_ℓ = 0, so the number of relations is at most the number of variables
- Check the sign convention for d and Ad_X against GlobalGaloisDeformations R04.3's presentation

Sources: [Gebhard Böckle](<https://arith-geom.github.io/ag-comp-arith-geom/assets/img/fileadmin/groups/arithgeo/templates/data/Gebhard_Boeckle/KhareAppboeckleNew2.pdf>), Proposition 1, p. 2 (The statement begins.); [Gebhard Böckle](<https://arith-geom.github.io/ag-comp-arith-geom/assets/img/fileadmin/groups/arithgeo/templates/data/Gebhard_Boeckle/KhareAppboeckleNew2.pdf>), Proposition 1, p. 2 (The presentation.); [Gebhard Böckle](<https://arith-geom.github.io/ag-comp-arith-geom/assets/img/fileadmin/groups/arithgeo/templates/data/Gebhard_Boeckle/KhareAppboeckleNew2.pdf>), Proof of Proposition 1, p. 2 (Where oddness enters.); [Chandrashekhar Khare and Jean-Pierre Wintenberger](<https://annals.math.princeton.edu/wp-content/uploads/annals-v169-n1-p05.pdf>), Proposition 3.4, printed p. 240 (KW Annals' form of it for minimal lifts.).

<a id="finite-presentation-complete-intersection"></a>
### Finite plus few relations gives a finite flat complete intersection (Böckle's Lemma 2)

Let 𝒪 be a complete DVR, π a uniformizer, A=𝒪[[x₁,…,x_n]], and f₁,…,f_m∈m_A with m≤n. Let R=A/(f₁,…,f_m) be nonzero, complete noetherian local, with its residue field identified with that of 𝒪, and finite as an 𝒪-module. Then m=n, (π,f₁,…,f_n) is A-regular, R is finite flat and a complete intersection over 𝒪, and R[1/π]≠0. A characteristic-zero integral point over a finite coefficient extension is obtained by the R24.2 point interface. This is the imported algebra behind Böckle Lemma 2, not a consequence of merely naming regular sequences and flatness.

The following qualifications are part of the contract:

- finiteness over 𝒪 is essential: 𝒪⟦x⟧ (n = 1, m = 0) is a flat complete intersection over 𝒪 but is not finite, and the conclusion m = n fails
- this is the commutative-algebra core of "finiteness plus presentation gives lifts"; KW II use the same principle in the form of their Corollary 4.7 (R24.2)

**Dependency and proof outline.**

1. Import regularity/Cohen–Macaulayness of the complete DVR power-series ring and Krull’s height bound from R03.3.
2. The finite nonzero residue quotient makes π,f₁,…,f_m a system of parameters. Height forces m≥n; m≤n gives equality. Cohen–Macaulayness then makes this parameter sequence regular. Permute the sequence within m_A to put π last, proving π is a nonzerodivisor on R.
3. Finite torsion-free over a DVR is finite flat. Import the integral-point consequence from R24.2.

Inputs: `mathlib:RingTheory.Sequence.IsRegular`; `mathlib:IsLocalRing`; `mathlib:ringKrullDim`; `mathlib:Module.Flat`; `DeformationAndDerivedPatchingAlgebra:R03.3/regular-local-cohen-macaulay`; `PotentialModularityAndCompatibleSystems:R24.2`.

**Acceptance checks.**

- Check the height count on n = 1: 𝒪⟦x⟧/(x² − π) is finite free of rank 2 over 𝒪
- Check that m < n is impossible for finite R (the Krull height argument)

Sources: [Gebhard Böckle](<https://arith-geom.github.io/ag-comp-arith-geom/assets/img/fileadmin/groups/arithgeo/templates/data/Gebhard_Boeckle/KhareAppboeckleNew2.pdf>), Lemma 2, p. 5 (The lemma.).

<a id="bockle-minimal-r-equals-t"></a>
### Böckle's Theorem 1: an auxiliary R_Q ≅ T_Q gives the minimal R_∅ ≅ T_∅

In the setting of Khare's Inventiones 154 (2003) paper, suppose that for some auxiliary set of primes Q the map R_Q → T_Q is an isomorphism of finite flat W(k)-algebras. Then the canonical map R_∅ → T_∅ of minimal rings is an isomorphism. This is NOT an unconditional lift-existence theorem: the presentation comes from GlobalGaloisDeformations R04 and the auxiliary R_Q ≅ T_Q from GL2ModularityLifting R22.

The following qualifications are part of the contract:

- R_Q → R_∅ is surjective, so finiteness of R_Q gives finiteness of R_∅
- T_Q and T_∅ are reduced and finite flat; the comparison is made on geometric points of the generic fibre

**Dependency and proof outline.**

1. Corollary 1 and Lemma 2 (R24.3/finite-presentation-complete-intersection): R_∅ and R_Q are complete intersections, finite flat over 𝒪.
2. Compare the diagram R_Q ≅ T_Q → R_∅ → T_∅ after ⊗K: a point of R_∅ ⊗ K not in T_∅ ⊗ K would be a form f ∈ M_Q ∖ M_∅ whose ρ_f is unramified at Q, contradicting Carayol's conductor theorem.

Inputs: [Böckle's presentation of a global deformation ring (Proposition 1 of the appendix)](#bockle-presentation); [Finite plus few relations gives a finite flat complete intersection (Böckle's Lemma 2)](#finite-presentation-complete-intersection); `GL2ModularityLifting:R22.3/minimal-ring-finite`; `AutomorphicGaloisRepresentations:R19.4/hecke-versus-langlands-normalization-and-local-global-compatibility`.

**Acceptance checks.**

- Check the role of reducedness of T_Q (the choice of Q) in the generic-fibre comparison
- Check that the argument uses Carayol's local-global compatibility at the primes of Q

Sources: [Gebhard Böckle](<https://arith-geom.github.io/ag-comp-arith-geom/assets/img/fileadmin/groups/arithgeo/templates/data/Gebhard_Boeckle/KhareAppboeckleNew2.pdf>), Theorem 1, p. 1 (The theorem.).

<a id="kw-annals-minimal-lifts"></a>
### Minimally ramified lifts (Khare–Wintenberger, Annals, Theorem 3.3)

Let ρ̄ : G_ℚ → GL₂(𝔽) be of S-type with p > 2, ρ̄|_{ℚ(µ_p)} absolutely irreducible, 2 ≤ k(ρ̄) ≤ p + 1 and k(ρ̄) ≠ p. Then ρ̄ has a lift that is minimally ramified at every prime; when k(ρ̄) = p + 1 it may be chosen of crystalline type (Hodge–Tate weights (0, p)) or of semistable type (weight 2). Proof: the minimal deformation ring R^univ has a presentation with r ≥ s (Böckle, Proposition 3.4), is finite over W (Proposition 3.8: Lemma 3.6 reduces finiteness to finiteness of the universal mod-p image, which follows from Taylor's potential modularity and Fujiwara's R = T over a totally real F), hence is finite flat and a complete intersection (Theorem 3.7), so it has a point in characteristic zero. This is the method suggested in the Remark in §5.2 of Khare–Ramakrishna, Finiteness of Selmer groups and deformation rings (Invent. Math. 154 (2003) 179–198, KW Annals' [27]; not Khare's paper with Böckle's appendix, which is [26]), which the subsequent KW II Theorem 5.1 generalises.

The following qualifications are part of the contract:

- k(ρ̄) ≠ p: at weight p neither the Fontaine–Laffaille local condition used for k(ρ̄) < p nor the R = T inputs of Proposition 3.8 (Fujiwara's ordinary theorem and Taylor's supersingular theorem) is available; KW Annals p. 242 explicitly makes exclusion of weight p a condition for applying those inputs
- at k(ρ̄) = p + 1 the crystalline local ring R_{p,crys} is formally smooth of dimension 1 (Böckle; KW Annals Proposition 3.5)
- the rationality of the lifts is not controlled
- the roadmap's pin 'KW Annals §5.2' is the Remark in §5.2 of [27] cited in KW Annals' introduction; the lifting argument itself is KW Annals §3

**Dependency and proof outline.**

1. Local rings: flat complete intersections of the right dimension (Ramakrishna, Taylor; R_{p,crys} by Proposition 3.5).
2. Proposition 3.4 (R24.3/bockle-presentation) and Lemma 3.6 (finiteness criterion).
3. Proposition 3.8: finiteness via potential modularity (R23) and R = T over F (R22).
4. Theorem 3.7 by R24.3/finite-presentation-complete-intersection, then a point.

Inputs: [Böckle's presentation of a global deformation ring (Proposition 1 of the appendix)](#bockle-presentation); [Finite plus few relations gives a finite flat complete intersection (Böckle's Lemma 2)](#finite-presentation-complete-intersection); `LocalGaloisDeformationRings:R08.6/export-endpoint-weight`; `GL2ModularityLifting:R22.3/minimal-ring-finite`; `PotentialModularityAndCompatibleSystems:R24.1`.

**Acceptance checks.**

- Check that k(ρ̄) = p is really excluded and not merely unused
- Check the two types at k(ρ̄) = p + 1 against LocalGaloisDeformationRings R08.6/export-endpoint-weight

Sources: [Chandrashekhar Khare and Jean-Pierre Wintenberger](<https://annals.math.princeton.edu/wp-content/uploads/annals-v169-n1-p05.pdf>), Theorem 3.3, printed p. 239 (The theorem.); [Chandrashekhar Khare and Jean-Pierre Wintenberger](<https://annals.math.princeton.edu/wp-content/uploads/annals-v169-n1-p05.pdf>), Introduction, printed p. 231 (The method: finiteness then flatness.); [Chandrashekhar Khare and Jean-Pierre Wintenberger](<https://annals.math.princeton.edu/wp-content/uploads/annals-v169-n1-p05.pdf>), Introduction, printed p. 231 (The pinned earlier input: the Remark in §5.2 of [27] = Khare–Ramakrishna 2003 (checkpoint 2 corrects an earlier attribution to Khare's paper [26]).); [Chandrashekhar Khare and Jean-Pierre Wintenberger](<https://annals.math.princeton.edu/wp-content/uploads/annals-v169-n1-p05.pdf>), Lemma 3.6, printed p. 241 (The finiteness criterion.); [Chandrashekhar Khare and Jean-Pierre Wintenberger](<https://annals.math.princeton.edu/wp-content/uploads/annals-v169-n1-p05.pdf>), References, printed p. 252 (What "[27]" is.); [Chandrashekhar Khare and Jean-Pierre Wintenberger](<https://annals.math.princeton.edu/wp-content/uploads/annals-v169-n1-p05.pdf>), Proof of Proposition 3.8, printed p. 242 (Why k(ρ̄) = p is excluded.).

<a id="required-lift-types"></a>
### Lifts of required type (KW I Theorem 5.1 (1)–(4))

Let ρ̄ : G_ℚ → GL₂(𝔽) be of S-type with 2 ≤ k(ρ̄) ≤ p + 1 if p > 2, non-solvable image if p = 2, and ρ̄|_{ℚ(µ_p)} absolutely irreducible if p > 2. A lift ρ : G_ℚ → GL₂(𝒪′) of ρ̄ is of required type (i) if: (1) (k(ρ̄) = 2 when p = 2) ρ is minimally ramified at every ℓ ≠ p and crystalline of weight k(ρ̄) at p; (2) ρ has weight 2, is minimally ramified at ℓ ≠ p, and its inertial Weil–Deligne parameter at p is (ω_p^{k(ρ̄)−2} ⊕ 1, 0), or (id, N) with N ≠ 0 nilpotent when k(ρ̄) = p + 1 (k(ρ̄) = 4 if p = 2); (3) for an odd q ∥ N(ρ̄) with p | q − 1, ρ̄|_{I_q} = (χ ∗; 0 1): ρ is as in (2) at p and minimal at ℓ ≠ p, q, and ρ|_{I_q} ≅ (χ′ ∗; 0 1) for a character χ′ = ω_q^i (0 < i ≤ q − 2) lifting χ, with i even if p = 2; (4) for q ≠ p with ρ̄|_{D_q} ≅ (χ_p ∗; 0 1) up to unramified twist and p | q + 1: ρ is as in (2) at p and minimal at ℓ ≠ p, q, and ρ|_{I_q} ≅ χ′ ⊕ χ′^q for a level-2 character χ′ = ω_{q,2}^iω_{q,2}^{qj} of p-power order, with i + j even if p = 2. "Minimal" is in the sense of Diamond §3 (KW II §3.3.1 at p = 2). Lifts of required type are the 𝒪′-points of R̄^ψ_S for the corresponding local conditions (GlobalGaloisDeformations R04.6). In type (4), write 0≤j<i≤q−1, keep χ′ genuinely level two. KW display ρ|_{I_q} as (χ′ ∗; 0 χ′^q); since χ′ ≠ χ′^q the extension splits over I_q in characteristic zero, so the inertial type is χ′⊕χ′^q. The dyadic exceptional minimal case and automatic-minimality criterion at p∤q−1 are imported from R08.6.

The following qualifications are part of the contract:

- the parity conditions at p = 2 make the lift odd (Remark after KW I Theorem 5.1)
- in (4), characters χ′ of p-power order and level 2 exist unless p = 2 and v₂(q + 1) = 1
- if q ∥ N(ρ̄) and p ∤ q − 1, every geometric lift with q ∥ N(ρ) is minimal at q, so (3) needs p | q − 1
- the local condition at each place is one of LocalGaloisDeformationRings R08.6/kw-local-conditions

**Dependency and proof outline.**

1. Translate each type into local conditions: minimal (R08.6 inertia-rigid) away from p and q; (A), (B) or (C) at p; abelian with fixed inertial character (3) or non-abelian of level two (4) at q.
2. Identify the lifts with 𝒪′-points of R̄^ψ_S by R04.6/factorization-through-local-conditions.

Inputs: `LocalGaloisDeformationRings:R08.6/kw-local-conditions`; `GlobalGaloisDeformations:R04.6/kw-deformation-data`; `GlobalGaloisDeformations:R04.6/factorization-through-local-conditions`; `AlgebraicModularFormsAndSerreWeights:R15.6`; `ArithmeticGaloisRepresentations:R01.1`; `ArithmeticGaloisRepresentations:R01.2`.

**Uses that determine the API.**

- [KW I Theorem 5.1(1): minimal crystalline lifts](#theorem-5-1-part-1-minimal-crystalline): type (1): minimal crystalline lifts
- [KW I Theorem 5.1(2): minimal weight-two lifts](#theorem-5-1-part-2-weight-two): type (2): weight-two lifts
- [KW I Theorem 5.1(3): a prescribed level-one type at q](#theorem-5-1-part-3-level-one-type-at-q): type (3): the level-one character at q
- [KW I Theorem 5.1(4): a prescribed level-two type at q](#theorem-5-1-part-4-level-two-type-at-q): type (4): the level-two (good-dihedral) character at q
- `ClassicalSerreModularity:R27.1/good-dihedral-prime-insertion`: type (4) inserts a good dihedral prime
- `ClassicalSerreModularity:R27.2/theorem-3-2-weight-reduction`: types (2)–(4) in the weight recursion

**API determined by its uses.**

- `TauCeti.CompatibleSystems.RequiredLiftType` (structure): the case (1)–(4) with its auxiliary data (q, χ′) and the fixed character ψ
- `TauCeti.CompatibleSystems.RequiredLiftType.localCondition` (projection): the local condition X_v of LocalGaloisDeformationRings R08.6 at each v ∈ S
- `TauCeti.CompatibleSystems.RequiredLiftType.ring` (constructor): the ring R̄^ψ_S of GlobalGaloisDeformations R04.6 for these conditions
- `TauCeti.CompatibleSystems.RequiredLiftType.points_iff` (equivalence): 𝒪′-points of the ring ↔ lifts of the required type
- `TauCeti.CompatibleSystems.RequiredLiftType.det` (simp): every lift of the type has determinant ψχ_p

**Discriminating tests.**

- `type3_parity_p2` (non-example): p = 2, q = 5: χ′ = ω₅ has i = 1 odd and is excluded; ω₅² (i = 2) is allowed
- `type4_level_two_exists` (computation): p = 2: q = 7 has v₂(8) = 3 ≥ 2, so level-2 characters of 2-power order exist; q = 5 has v₂(6) = 1 and none exist
- `type2_steinberg` (degenerate): k(ρ̄) = p + 1: the inertial parameter is (id, N ≠ 0), a Steinberg type
- `type3_needs_p_divides` (non-example): p=3, q=5: 3∤4=q−1, so type (3) is unavailable. For a geometric regular lift with q∥N(ρ̄), the imported R08.6 automatic-minimality criterion applies at q when p∤q−1.

**Acceptance checks.**

- Check that the determinant of a lift of each type is ψχ_p for the character ψ fixed by the type
- Check the existence condition for level-2 characters of 2-power order: v₂(q + 1) ≥ 2

Sources: [Chandrashekhar Khare and Jean-Pierre Wintenberger](<https://www.math.ucla.edu/~shekhar/papers/results.pdf>), Theorem 5.1, p. 9 of the preprint (Type (1).); [Chandrashekhar Khare and Jean-Pierre Wintenberger](<https://www.math.ucla.edu/~shekhar/papers/results.pdf>), Theorem 5.1, p. 9 of the preprint (Type (3) begins.); [Chandrashekhar Khare and Jean-Pierre Wintenberger](<https://www.math.ucla.edu/~shekhar/papers/results.pdf>), Theorem 5.1(4), p. 10 of the preprint (Type (4) needs p | q + 1.); [Chandrashekhar Khare and Jean-Pierre Wintenberger](<https://www.math.ucla.edu/~shekhar/papers/results.pdf>), Remark after Theorem 5.1, p. 10 (Existence of level-2 characters.).

<a id="theorem-5-1-part-1-minimal-crystalline"></a>
### KW I Theorem 5.1(1): minimal crystalline lifts

Under KW I Theorem 5.1's hypotheses on ρ̄, and k(ρ̄) = 2 if p = 2, ρ̄ has a lift of required type (1): minimally ramified at every prime ≠ p and crystalline of weight k(ρ̄) at p.

The following qualifications are part of the contract:

- at p = 2 only k(ρ̄) = 2 is allowed: type (A) at p = 2 is crystalline of weight 2 only
- k(ρ̄) = p is allowed here, unlike KW Annals Theorem 3.3: KW II's local rings include it

**Dependency and proof outline.**

1. The local conditions of the type are nonempty (LocalGaloisDeformationRings R08.6/local-nonemptiness).
2. R̄^ψ_S is finite over 𝒪 (R24.1, KW II Theorem 10.1) and has dimension ≥ 1 (GlobalGaloisDeformations R04.3/global-dimension-lower-bound).
3. So it has an 𝒪′-point (R24.2, KW II Corollary 4.7), which is a lift of the required type (KW II §10.3.1).

Inputs: [Lifts of required type (KW I Theorem 5.1 (1)–(4))](#required-lift-types); `LocalGaloisDeformationRings:R08.6/local-nonemptiness`; `GlobalGaloisDeformations:R04.3/global-dimension-lower-bound`; `GlobalGaloisDeformations:R04.6/factorization-through-local-conditions`; `PotentialModularityAndCompatibleSystems:R24.1`; `PotentialModularityAndCompatibleSystems:R24.2`.

**Acceptance checks.**

- Check the local condition at p is type (A) of weight k(ρ̄)
- Check minimality at every ℓ ≠ p is inertia-rigid

Sources: [Chandrashekhar Khare and Jean-Pierre Wintenberger](<https://www.math.ucla.edu/~shekhar/papers/results.pdf>), Theorem 5.1(1), p. 9 of the preprint (The statement.); [Chandrashekhar Khare and Jean-Pierre Wintenberger](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>), §10.3.1, p. 92 of the preprint (The existence argument.).

<a id="theorem-5-1-part-2-weight-two"></a>
### KW I Theorem 5.1(2): minimal weight-two lifts

Under KW I Theorem 5.1's hypotheses, ρ̄ has a lift of required type (2): weight 2, minimally ramified at ℓ ≠ p, with inertial Weil–Deligne parameter (ω^{k(ρ̄)−2} ⊕ 1, 0) at p, or (id, N ≠ 0) when k(ρ̄) = p + 1 (k(ρ̄) = 4 at p = 2).

The following qualifications are part of the contract:

- at p = 2 with k(ρ̄) = 4 the local condition is type (C): semistable non-crystalline of weight 2

**Dependency and proof outline.**

1. The local conditions of the type are nonempty (LocalGaloisDeformationRings R08.6/local-nonemptiness).
2. R̄^ψ_S is finite over 𝒪 (R24.1, KW II Theorem 10.1) and has dimension ≥ 1 (GlobalGaloisDeformations R04.3/global-dimension-lower-bound).
3. So it has an 𝒪′-point (R24.2, KW II Corollary 4.7), which is a lift of the required type (KW II §10.3.1).

Inputs: [Lifts of required type (KW I Theorem 5.1 (1)–(4))](#required-lift-types); `LocalGaloisDeformationRings:R08.6/local-nonemptiness`; `GlobalGaloisDeformations:R04.3/global-dimension-lower-bound`; `GlobalGaloisDeformations:R04.6/factorization-through-local-conditions`; `PotentialModularityAndCompatibleSystems:R24.1`; `PotentialModularityAndCompatibleSystems:R24.2`.

**Acceptance checks.**

- Check the (B)/(C) local condition at p according to k(ρ̄)
- Check that the lift is odd at p = 2

Sources: [Chandrashekhar Khare and Jean-Pierre Wintenberger](<https://www.math.ucla.edu/~shekhar/papers/results.pdf>), Theorem 5.1(2), p. 9 of the preprint (The statement.); [Chandrashekhar Khare and Jean-Pierre Wintenberger](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>), §10.3.1, p. 92 of the preprint (The existence argument.).

<a id="theorem-5-1-part-3-level-one-type-at-q"></a>
### KW I Theorem 5.1(3): a prescribed level-one type at q

Under KW I Theorem 5.1's hypotheses, with q ∥ N(ρ̄) odd, p | q − 1 and χ′ = ω_q^i (i even if p = 2) lifting χ, ρ̄ has a lift of required type (3). If the residual representation ρ̄_q of the resulting system is irreducible, it has Serre weight i + 2 or q + 1 − i up to twist (R24.5/kw-theorem-5-1-systems).

The following qualifications are part of the contract:

- the local condition at q is abelian with fixed inertial character χ′ (LocalGaloisDeformationRings R08.6/export-away-from-p (b))

**Dependency and proof outline.**

1. The local conditions of the type are nonempty (LocalGaloisDeformationRings R08.6/local-nonemptiness).
2. R̄^ψ_S is finite over 𝒪 (R24.1, KW II Theorem 10.1) and has dimension ≥ 1 (GlobalGaloisDeformations R04.3/global-dimension-lower-bound).
3. So it has an 𝒪′-point (R24.2, KW II Corollary 4.7), which is a lift of the required type (KW II §10.3.1).

Inputs: [Lifts of required type (KW I Theorem 5.1 (1)–(4))](#required-lift-types); `LocalGaloisDeformationRings:R08.6/local-nonemptiness`; `GlobalGaloisDeformations:R04.3/global-dimension-lower-bound`; `GlobalGaloisDeformations:R04.6/factorization-through-local-conditions`; `PotentialModularityAndCompatibleSystems:R24.1`; `PotentialModularityAndCompatibleSystems:R24.2`; `LocalGaloisDeformationRings:R08.6/export-away-from-p`.

**Acceptance checks.**

- Check that χ′ reduces to χ
- Check the parity condition at p = 2

Sources: [Chandrashekhar Khare and Jean-Pierre Wintenberger](<https://www.math.ucla.edu/~shekhar/papers/results.pdf>), Theorem 5.1(3), p. 9 of the preprint (The statement.); [Chandrashekhar Khare and Jean-Pierre Wintenberger](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>), §10.3.1, p. 92 of the preprint (The existence argument.).

<a id="theorem-5-1-part-4-level-two-type-at-q"></a>
### KW I Theorem 5.1(4): a prescribed level-two type at q

Under KW I Theorem 5.1's hypotheses, with ρ̄|_{D_q} ≅ (χ_p ∗; 0 1) up to unramified twist and p | q + 1, and a level-2 character χ′ = ω_{q,2}^iω_{q,2}^{qj} of p-power order (i + j even if p = 2), ρ̄ has a lift of required type (4). This is the construction that inserts a good dihedral prime (ClassicalSerreModularity R27.1).

The following qualifications are part of the contract:

- the local condition at q is non-abelian of level two with F_v = ℚ_q (LocalGaloisDeformationRings R08.6/export-away-from-p (b))
- such χ′ exist unless p = 2 and v₂(q + 1) = 1

**Dependency and proof outline.**

1. The local conditions of the type are nonempty (LocalGaloisDeformationRings R08.6/local-nonemptiness).
2. R̄^ψ_S is finite over 𝒪 (R24.1, KW II Theorem 10.1) and has dimension ≥ 1 (GlobalGaloisDeformations R04.3/global-dimension-lower-bound).
3. So it has an 𝒪′-point (R24.2, KW II Corollary 4.7), which is a lift of the required type (KW II §10.3.1).

Inputs: [Lifts of required type (KW I Theorem 5.1 (1)–(4))](#required-lift-types); `LocalGaloisDeformationRings:R08.6/local-nonemptiness`; `GlobalGaloisDeformations:R04.3/global-dimension-lower-bound`; `GlobalGaloisDeformations:R04.6/factorization-through-local-conditions`; `PotentialModularityAndCompatibleSystems:R24.1`; `PotentialModularityAndCompatibleSystems:R24.2`; `LocalGaloisDeformationRings:R08.6/export-away-from-p`.

**Acceptance checks.**

- Check that the residual type at q is ρ̄|_{I_q}
- Check the parity condition at p = 2

Sources: [Chandrashekhar Khare and Jean-Pierre Wintenberger](<https://www.math.ucla.edu/~shekhar/papers/results.pdf>), Theorem 5.1(4), p. 10 of the preprint (The hypothesis p | q + 1.); [Chandrashekhar Khare and Jean-Pierre Wintenberger](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>), §10.3.1, p. 92 of the preprint (The existence argument.).

<a id="theorem-5-1-application-table"></a>
### Where the lifts of KW I Theorem 5.1 are used

The applications, with the type used: KW I §8.1 (Theorem 3.1, killing ramification): (1). §8.2 (Theorem 3.2): mod 3 — (2) then (4) with χ′ = ω_{3,2}²; mod 5 — (2) then (3) with χ′ = ω₅², and then, for the residual member ρ̄′₅, (2) if 3 | N(ρ̄′₅) and (1) otherwise; inductive step — (2) then (3) with χ′ = ω_P^i for the i of §7, and then, for ρ̄′_P, (2) if p | N(ρ̄′_P) and (1) otherwise. §8.3 (Corollary 8.1): (1). §8.4 (Theorem 3.4): (2) then (4) at the good dihedral prime q. §9 (Theorem 9.1): (2), and (4) with the order-3 type at 2. KW Annals Theorem 3.3 is the minimal case (1) for k(ρ̄) ≠ p. The modern route uses Dieulefait–Pacetti Theorem 1.9: its cases (1)–(3) are the dyadic and odd-prime instances of KW I Theorem 5.1 (1) and (2), and its case (4), weight-two lifts with prescribed inertial types away from p, is due to Gee and Snowden (R24.3/modern-prescribed-type-lifts).

The following qualifications are part of the contract:

- each application must check the hypotheses of its type before requesting a global point: the residual shape at q, p | q ± 1, and the parity at p = 2

**Dependency and proof outline.**

1. Tabulate from KW I §§8–9 and Dieulefait–Pacetti §§1–2.

Inputs: [KW I Theorem 5.1(1): minimal crystalline lifts](#theorem-5-1-part-1-minimal-crystalline); [KW I Theorem 5.1(2): minimal weight-two lifts](#theorem-5-1-part-2-weight-two); [KW I Theorem 5.1(3): a prescribed level-one type at q](#theorem-5-1-part-3-level-one-type-at-q); [KW I Theorem 5.1(4): a prescribed level-two type at q](#theorem-5-1-part-4-level-two-type-at-q); [Minimally ramified lifts (Khare–Wintenberger, Annals, Theorem 3.3)](#kw-annals-minimal-lifts).

**Acceptance checks.**

- Check each row's local hypotheses in the consuming node of ClassicalSerreModularity
- Check that no application needs a type not listed in R24.3/required-lift-types

Sources: [Luis Victor Dieulefait and Ariel Martín Pacetti](<https://arxiv.org/pdf/2108.07577v2>), Proof of Theorem 1.9, p. 6 of the arXiv version (The modern route's attribution.); [Chandrashekhar Khare and Jean-Pierre Wintenberger](<https://www.math.ucla.edu/~shekhar/papers/results.pdf>), §8.2, pp. 13–15 of the preprint (The sub-cases of the mod 5 and inductive steps use types (2) and (1).).

<a id="modern-prescribed-type-lifts"></a>
### Weight-two lifts with prescribed types (Snowden Theorem 7.2.1; Gee)

Let p be an odd prime (Snowden's standing convention, §1.4), F totally real and ρ̄ : G_F → GL₂(𝔽̄_p) odd with (A1) ρ̄|_{G_{F(ζ_p)}} absolutely irreducible and (A2) if p = 5 and the projective image is PGL₂(𝔽₅) then [F(ζ₅) : F] = 4. For a lifting problem P = (Σ, ψ, t, {τ_v}) — Σ containing the places where ρ̄ or ψ ramify and those above p, ψ of finite order with det ρ̄ = ψ̄χ̄_p, a definite type t(v) and an inertial type τ_v at each v ∈ Σ — there are finitely many solutions (weight-two lifts with these data), and a solution exists iff a local solution exists (Theorem 7.2.1). If t is a definite type function on Σ′ ⊆ Σ compatible with ρ̄, then ρ̄ has a weight-two lift unramified outside Σ with determinant ψχ_p and type t on Σ′ (Theorem 7.6.1). Over F = ℚ, (A2) is automatic. This supplies the global lifting step of Dieulefait–Pacetti Theorem 1.9(4) once actual local solutions for the prescribed inertial and definite types have been established; the asserted p-types are crystalline when k(ρ̄) = 2 and Steinberg when k(ρ̄) = p + 1. Compatibility of an inertial-type lattice with residual inertia alone is insufficient. This application belongs to the modern route.

The following qualifications are part of the contract:

- A local solution with the prescribed determinant, inertial type and definite type must be established before requesting a global point. For v ∤ p, Snowden Proposition 7.7.1 supplies a lift of some definite type with the same conductor; it does not supply every prescribed inertial type.
- "inertial type" forgets the monodromy operator; "type" records it (Snowden §7.1)
- the finiteness input is the analogue of R24.1 (potential modularity with R = T)
- Dieulefait–Pacetti call an inertial type τ_ℓ compatible with ρ̄ when some lattice of τ_ℓ reduces to ρ̄|_{I_ℓ}; Snowden's Theorem 7.2.1 needs a local solution, a lift of ρ̄|_{G_{F_v}} of inertial type τ_v and definite type. DP do not argue the passage from the first to the second; it belongs with the local nonemptiness requested from LocalGaloisDeformationRings R08.6 (Snowden Proposition 7.7.1 supplies some definite-type lift of the same conductor, not one of a prescribed inertial type)

**Dependency and proof outline.**

1. Snowden Theorem 6.1.1 (finiteness of the global ring with the chosen local rings) and the local rings of definite type (Propositions 7.3.1, 7.4.1).
2. A local solution makes the local rings nonzero; a global point of R† is a solution.

Inputs: `LocalGaloisDeformationRings:R08.6`; `PotentialModularityAndCompatibleSystems:R24.1`; `PotentialModularityAndCompatibleSystems:R24.2`; `LocalGaloisDeformationRings:R08.6/local-nonemptiness`.

**Acceptance checks.**

- Check (A2) over ℚ: [ℚ(ζ₅) : ℚ] = 4
- Distinguish DP Theorem 1.9(4)'s compatibility of an inertial-type lattice with residual inertia from Snowden's stronger local solution condition; require a proof of local nonemptiness for the prescribed type.

Sources: [Andrew Snowden](<https://arxiv.org/pdf/0905.4266v1>), Theorem 7.2.1, p. 21 of arXiv:0905.4266v1 (The theorem.); [Luis Victor Dieulefait and Ariel Martín Pacetti](<https://arxiv.org/pdf/2108.07577v2>), Theorem 1.9(4), p. 6 of the arXiv version (The form DP use.); [Andrew Snowden](<https://arxiv.org/pdf/0905.4266v1>), §1.4, notation, p. 3 of arXiv:0905.4266v1 (p is odd throughout.); [Andrew Snowden](<https://arxiv.org/pdf/0905.4266v1>), §3.1 (A1)–(A2), p. 6; §7.1–7.7, pp. 20–23, especially Propositions 7.3.1 and 7.4.1 and Theorem 7.6.1 (arXiv v1) (Residual-image conditions, the possibility of zero local rings, and the distinction between a prescribed local solution and compatibility with some definite type.).

## R24.4: the imported KW lifting interface

<a id="alpha-beta-from-residual-modularity"></a>
### From "ρ̄ modular" to the residual hypotheses (α) and (β)

Let ρ̄ : G_ℚ → GL₂(𝔽) be of S-type and modular, with KW I Theorem 4.1's image hypotheses. Then ρ̄ arises from S_{k(ρ̄)}(Γ₁(N)) for some N prime to p and from S₂(Γ₁(Np)) (weight part of Serre's conjecture: Gross's Theorem 13.10, Coleman–Voloch, and Gross's Propositions 8.13 and 8.18); so after an allowable base change F/ℚ (solvable, totally real, unramified or split at p as required), ρ̄|_{G_F} satisfies (α) and (β) for p > 2, and (α) when p = k(ρ̄) = 2 and (β) for p = 2.

The following qualifications are part of the contract:

- the hypothesis N > 4 of Gross may be assumed, since the level need not be optimal
- for k = p KW II do not need Gross (see the Remark in §10.2)
- these are exactly the residual inputs of GL2ModularityLifting R22.5/R22.6 (Theorem 9.7)

**Dependency and proof outline.**

1. Import R22.5/alpha-beta-from-modularity-over-q, including its separate α and β witnesses and allowable base-change hypotheses. R24.4 binds that export to the displayed residual input; it constructs no second weight or lifting proof.
2. The consumer passes a supplied lift to the owner’s theorem; no R24.1, R24.2 or R24.3 theorem is an input.

Inputs: `GL2ModularityLifting:R22.5/kw-residual-modularity`; `SerreWeightAndLevelOptimisation:R20.6`; `AlgebraicModularFormsAndSerreWeights:R15.4`; `GL2AutomorphicRepresentationsAndTransfer:R17.4`; `GL2ModularityLifting:R22.5/solvable-base-change-reduction`; `GL2ModularityLifting:R22.5/alpha-beta-from-modularity-over-q`; `GL2ModularityLifting:R22.5/kw-residual-modularity-beta`.

**Acceptance checks.**

- Check the p = 2 cases: (α) only when k(ρ̄) = 2, (β) for k(ρ̄) = 2 and 4
- Check that the base change keeps ρ̄|_{G_F(µ_p)} absolutely irreducible (resp. non-solvable at p = 2)

Sources: [Chandrashekhar Khare and Jean-Pierre Wintenberger](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>), §10.2, p. 92 of the preprint (The residual hypotheses from modularity.).

<a id="kw-theorem-4-1"></a>
### KW I Theorem 4.1: modularity lifting over ℚ

Let ρ̄ : G_ℚ → GL₂(𝔽) be modular, with non-solvable image if p = 2 and ρ̄|_{ℚ(µ_p)} absolutely irreducible if p > 2. (1) (p = 2) An odd, finitely ramified 2-adic lift ρ that is crystalline of weight 2 at 2, or semistable of weight 2 at 2 (only when k(ρ̄) = 4), is modular. (2) (p > 2) A finitely ramified p-adic lift that is (i) crystalline of weight k with 2 ≤ k ≤ p + 1, or (ii) potentially semistable of weight 2 at p, is modular. Import the full Theorem 4.1 exports from GL2ModularityLifting R22.5 and R22.6. Their proof combines residual weight witnesses, allowable base change, the cases of Theorem 9.7, the additional lifting results needed beyond those cases, and solvable descent. Theorem 9.7 alone does not cover the complete odd-prime statement.

The following qualifications are part of the contract:

- p = 2: non-solvable image, and the semistable case only in residual weight 4
- p > 2: cyclotomic absolute irreducibility, and the crystalline weight interval 2 ≤ k ≤ p + 1 or potentially semistable weight 2
- several cases were known before (Diamond–Flach–Guo for k ≤ p − 1; Kisin for k = p + 1 non-ordinary and for potentially Barsotti–Tate; Diamond, Wiles and Taylor–Wiles for semistable weight 2; Dickinson partially at p = 2); KW II need only 4.1(1) and 4.1(2)(i) at k = p

**Dependency and proof outline.**

1. Bind the full R22.5/kw-i-theorem-4-1-odd-prime and R22.6/kw-i-theorem-4-1-dyadic exports to KW I Theorem 4.1. Carry the odd-prime supplier’s non-ordinary endpoint proof gap; do not infer the full result from its narrower Theorem 9.7 node.
2. The consumer passes a supplied lift to the owner’s theorem; no R24.1, R24.2 or R24.3 theorem is an input.

Inputs: [From "ρ̄ modular" to the residual hypotheses (α) and (β)](#alpha-beta-from-residual-modularity); `GL2ModularityLifting:R22.5/kw-i-theorem-4-1-odd-prime`; `GL2ModularityLifting:R22.6/kw-i-theorem-4-1-dyadic`; `GL2ModularityLifting:R22.5/solvable-base-change-reduction`; `GL2AutomorphicRepresentationsAndTransfer:R17.4`.

**Acceptance checks.**

- Check that the potentially semistable weight-2 case at p > 2 is covered by (B) or (C) after base change
- Check that at p = 2 the semistable case requires ρ̄ not finite at 2
- Odd-prime crystalline endpoint k=p+1 with residual weight 2 and general potentially semistable weight-two input must be supplied by the full R22.5 interface, not inferred from the narrower existing Theorem 9.7 node.

Sources: [Chandrashekhar Khare and Jean-Pierre Wintenberger](<https://www.math.ucla.edu/~shekhar/papers/results.pdf>), Theorem 4.1, p. 7 of the preprint (The odd-prime and dyadic cases, with the lift oddness hypothesis explicit at p=2.); [Chandrashekhar Khare and Jean-Pierre Wintenberger](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>), §10.2, p. 92 of the preprint (The earlier cases.); [Chandrashekhar Khare and Jean-Pierre Wintenberger](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>), §10.2, p. 92 of the preprint (The derivation.).

## R24.5: genuine Brauer families and strict local compatibility

<a id="brauer-induction-system"></a>
### The compatible system through a potentially modular lift, by Brauer induction

Let ρ : G_ℚ → GL₂(𝒪) be a lift such that ρ|_{G_F} ≅ ρ_{π,ι_p} for a holomorphic cuspidal π over a totally real Galois F/ℚ (R23.4 or Theorem 9.7). By Brauer's theorem write 1_G = Σ n_i Ind_{G_i}^G χ_i with G = Gal(F/ℚ), G_i = Gal(F/F_i) solvable and χ_i characters. By Langlands' solvable base change there are π_i over F_i with ρ_{π_i,ι_p} = ρ|_{G_{F_i}}. For every ℓ and ι : ℚ̄ ↪ ℚ̄_ℓ put ρ_ι = Σ n_i Ind_{G_{F_i}}^{G_ℚ}(χ_i ⊗ ρ_{π_i,ι}). Assume the given lift is absolutely irreducible over F and each cuspidal Hilbert modular member over every solvable intermediate field is absolutely irreducible, with their overlaps identified by Frobenius recognition. Then ρ_ι is a true absolutely irreducible two-dimensional representation, its Frobenius traces agree with those of ρ at almost all primes, it does not depend on the choices, and for every F′ ⊆ F with F/F′ solvable, ρ_ι|_{G_{F′}} is the representation of the automorphic form attached to ρ|_{G_{F′}}.

The following qualifications are part of the contract:

- Finite totally real Galois F/ℚ; the supplied lift remains absolutely irreducible over F, ensuring cuspidal solvable descent and the irreducible-overlap pairing computation.
- The automorphic families and finite-order characters have a common finite coefficient field after enlarging it; the output family is indexed by its places/embeddings, not unrelated fields at different ℓ.

**Dependency and proof outline.**

1. Import finite Brauer induction and solvable cuspidal descent. Choose a common number field containing all finitely many Hecke fields and character values.
2. Form the virtual class A_ι=Σn_i Ind(χ_i⊗ρ_{π_i,ι}). Mackey and Frobenius reciprocity express (A_ι,A_ι) using overlap fields F_i·gF_j. The two overlap members restrict to the same irreducible family over F, so their Hom line carries the same finite descent character at every ι, identified from the original p-member by Frobenius recognition. Hence every pairing summand is independent of ι.
3. At p the Brauer identity gives A_p=[ρ], so (A_ι,A_ι)=1 and dim A_ι=2 for all ι. The representation-ring criterion yields a genuine irreducible; degree two by itself cannot do so.
4. Trace identities give the common Frobenius polynomials and independence of choices. Repeat the overlap comparison to identify restrictions to every solvable intermediate field. Local descent is then handled separately in the almost-strict and strict-compatibility theorems.

Inputs: [Compatible systems: strict, almost strict, and plain](#compatible-system); [Twisting, restriction and induction of compatible systems](#system-operations); `GL2AutomorphicRepresentationsAndTransfer:R17.4`; `PotentialModularityAndCompatibleSystems:R23.4`; `ArithmeticGaloisRepresentations:R01.5`; [The Grothendieck ring of semisimple ℓ-adic representations](#galois-grothendieck-ring); `AutomorphicGaloisRepresentations:R19.3`; `AutomorphicGaloisRepresentations:R19.4`; `GL2AutomorphicRepresentationsAndTransfer:R17.6`; `tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction`; `AutomorphicGaloisRepresentations:R19.3/fixed-eigenform-compatible-family`; `AutomorphicGaloisRepresentations:R19.2/hilbert-normalisation-dictionary`.

**Uses that determine the API.**

- [The Brauer system is almost strictly compatible](#almost-strict-compatibility): the system whose compatibility is proved
- [KW I Theorem 5.1: almost strictly compatible systems through prescribed lifts](#kw-theorem-5-1-systems): the systems of KW I Theorem 5.1
- [Dieulefait: a given lift lies in an almost strictly compatible system (DP Theorem 1.11)](#dieulefait-families): Dieulefait's families for a given lift

**API determined by its uses.**

- `TauCeti.CompatibleSystems.brauerSystem` (constructor): ρ_ι = Σ n_i Ind(χ_i ⊗ ρ_{π_i,ι}) from the Brauer data and the base-changed π_i
- `TauCeti.CompatibleSystems.brauerSystem_isTrue` (characterisation): The virtual class has dimension 2 and norm-one pairing, hence is the class of a genuine absolutely irreducible member.
- `TauCeti.CompatibleSystems.brauerSystem_trace` (compatibility): After mapping the common algebraic trace into both coefficient fields, all good Frobenius characteristic polynomials agree with the given p-member; no direct equality between ℓ-adic and p-adic values is asserted.
- `TauCeti.CompatibleSystems.brauerSystem_unique` (extensionality): Uniqueness memberwise up to representation isomorphism after a common coefficient extension; no canonical basis, lattice or conjugating matrix is asserted.
- `TauCeti.CompatibleSystems.brauerSystem_restrict` (compatibility): restriction to G_{F′} with F/F′ solvable is automorphic

**Discriminating tests.**

- `brauer_trivial_F` (degenerate): F = ℚ: 1_G = Ind 1, and ρ_ι = ρ_{π,ι} is the system of π itself
- `brauer_quadratic_coefficients` (computation): G = ℤ/2: the regular character (2, 0) minus the sign character (1, −1) is the trivial character (1, 1), i.e. 1_G = Ind_1^G 1 − ε
- `brauer_virtual_nonexample` (non-example): the virtual character 3·1 − ε of ℤ/2 has degree 2 but value 4 at the generator, more than its degree, so it is not a character: degree 2 alone does not make a virtual representation true
- `brauer_trace_agreement` (compatibility): For the geometric/dual family of a non-CM elliptic curve E/ℚ with F=ℚ, the construction returns the given automorphic cohomological family (or its KW-normalized dual) memberwise up to isomorphism.

**Acceptance checks.**

- Check the degenerate case of solvable Gal(F/ℚ): Brauer's theorem is not needed, F_i = ℚ, and ρ_ι is the system of the form over ℚ obtained by solvable descent
- Check that the Hodge–Tate weights of ρ_ι are those of ρ

Sources: [Chandrashekhar Khare and Jean-Pierre Wintenberger](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>), §10.3.2, p. 93 of the preprint (The construction.); [Chandrashekhar Khare and Jean-Pierre Wintenberger](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>), §10.3.2, p. 93 of the preprint (True representations.); [Chandrashekhar Khare](<https://arxiv.org/pdf/math/0504080>), §3, proof of Proposition 3.1, pp. 16–17 of arXiv:math/0504080v1 (KW II cite it as the proof of Theorem 5.1 of the Duke version) (Genuineness by inner-product computation; the norm-one step is expanded here.).

<a id="almost-strict-compatibility"></a>
### The Brauer system is almost strictly compatible

The system (ρ_ι) of R24.5/brauer-induction-system is almost strictly compatible. For a prime q, let F(q) ⊆ F be the decomposition field at a prime Q | q, π_q the local component at Q of the form attached to ρ|_{G_{F(q)}}, and r_q its Frobenius-semisimple Weil–Deligne parameter. (a) For q ≠ ℓ, the Weil–Deligne parameter of ρ_ι|_{D_q} is r_q (Carayol, Taylor). (b) For q = ℓ ≠ 2 with r_q unramified, it is r_q and ρ_ι|_{D_q} is crystalline (Breuil, Berger). (c) For q = ℓ with ρ̄_ι irreducible, it is r_q (Kisin's potentially semistable deformation rings, after moving to a field F′ linearly disjoint from the kernel of ρ̄_ι). Strict compatibility would follow from Kisin's result without the irreducibility hypothesis; KW II correct an earlier claim of strictness on this point. This records exactly the 2009 KW proof. Its residual-irreducibility restriction is not a present-day impossibility: the strict result below uses Skinner’s full theorem in place of that restricted coefficient-prime input.

The following qualifications are part of the contract:

- (c) needs ρ̄_ι irreducible, because Kisin's theorem does; this is the whole difference between almost strict and strict
- the case q = ℓ = 2 with r_q unramified and ρ̄_ι reducible is not covered

**Dependency and proof outline.**

1. (a) Carayol and Taylor's local-global compatibility over F(q) (AutomorphicGaloisRepresentations R19.2, R19.4).
2. (b) Breuil and Berger give the historical unramified coefficient-prime case. The modern route imports R19.5/skinner-full-hilbert-coefficient-prime and the R19.2 normalization dictionary, which cover the even-degree Hilbert fields without a finite discrete-series place as well as the restricted Saito cases.
3. (c) Kisin, with F′ from potential modularity chosen linearly disjoint from ker ρ̄_ι (KW II Theorem 6.1(iii)(d), R23.5).

Inputs: [The compatible system through a potentially modular lift, by Brauer induction](#brauer-induction-system); `AutomorphicGaloisRepresentations:R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime`; [Compatible systems: strict, almost strict, and plain](#compatible-system); `AutomorphicGaloisRepresentations:R19.3`; `AutomorphicGaloisRepresentations:R19.4`; `PotentialModularityAndCompatibleSystems:R23.5`; `AutomorphicGaloisRepresentations:R19.5`; `AutomorphicGaloisRepresentations:R19.5/skinner-full-hilbert-coefficient-prime`; `AutomorphicGaloisRepresentations:R19.4/all-hilbert-local-global-compatibility`; `AutomorphicGaloisRepresentations:R19.2/hilbert-normalisation-dictionary`.

**Acceptance checks.**

- Check each case against R24.5/compatible-system's almost strict predicate
- Check that KW II's remark withdrawing strictness (Wintenberger, Documenta 2006) is reflected: only almost strictness is claimed

Sources: [Chandrashekhar Khare and Jean-Pierre Wintenberger](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>), §10.3.2, p. 93 ((a).); [Chandrashekhar Khare and Jean-Pierre Wintenberger](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>), §10.3.2, p. 94 ((b).); [Chandrashekhar Khare and Jean-Pierre Wintenberger](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>), §10.3.2, p. 94 ((c).); [Chandrashekhar Khare and Jean-Pierre Wintenberger](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>), §10.3.2, p. 93 (The authors' correction of the earlier strictness claim.).

<a id="strict-brauer-system"></a>
### Strict compatibility of the Brauer system

For the rank-two Brauer system of R24.5/brauer-induction-system arising from holomorphic cuspidal Hilbert modular forms of motivic weights k_τ≥2, the members are geometric of the same Hodge–Tate weights and WD(ρ_ι|D_q)^Fss is the fixed r_q at every finite q, including q=ℓ and reducible residual members. Hence it is KW strictly compatible. For q=ℓ unramified r_q, every member is crystalline of the common weights (a de Rham representation is crystalline iff inertia acts trivially on its WD parameter and N = 0, PadicHodgeTheory R06.3). If the Hilbert modular families are pure of weight w in the geometric convention, the descended system is pure of weight w; local strict purity is transported through the same local comparison and local–global purity supplier.

**Dependency and proof outline.**

1. For a prime q choose F(q), the fixed field of its decomposition subgroup in Gal(F/ℚ). That subgroup is solvable, so the descended member over F(q) is supplied by solvable descent. The chosen completion F(q)_v is ℚ_q, allowing its local representation to be identified with the original D_q representation.
2. Away from ℓ apply R19.4/all-hilbert-local-global-compatibility; at q=ℓ apply R19.5/skinner-full-hilbert-coefficient-prime to the descended motivic Hilbert form. Transport both through R19.2/hilbert-normalisation-dictionary to the KW arithmetic member. Skinner’s theorem has no residual condition; the supplier also corrects its printed Hodge-degree shift (AutomorphicGaloisRepresentations/E4).
3. Potential semistability plus an unramified WD parameter (including N=0) gives crystallinity. The Hilbert eigenvalues/Hodge weights yield global purity; local monodromy purity is a separate R34.6/R19.4 supplier, not inferred merely from good primes.

Inputs: [The compatible system through a potentially modular lift, by Brauer induction](#brauer-induction-system); `AutomorphicGaloisRepresentations:R19.5`; `AutomorphicGaloisRepresentations:R19.4`; `WeightsInEtaleCohomology:R34.6`; `PadicHodgeTheory:R06.3/weil-deligne-descent`; `AutomorphicGaloisRepresentations:R19.5/skinner-full-hilbert-coefficient-prime`; `AutomorphicGaloisRepresentations:R19.4/all-hilbert-local-global-compatibility`; `AutomorphicGaloisRepresentations:R19.2/hilbert-normalisation-dictionary`.

**Acceptance checks.**

- Verify the stated hypotheses and the supplier interfaces; no existence or automorphy endpoint is assumed.

Sources: [Chandrashekhar Khare and Jean-Pierre Wintenberger](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>), §10.3.2, pp.93–94 (The decomposition-field local descent argument in KW; the complete coefficient-prime input is supplied by Skinner separately.); [Christopher Skinner](<https://ems.press/content/serial-article-files/26055?nt=1>), Theorem 1, pp.241–243; proof §2, pp.244–255 (Full coefficient-prime compatibility for motivic Hilbert forms, without residual irreducibility.); [Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor](<https://arxiv.org/pdf/1010.2561v4>), §2.1 Theorem 2.1.1, pp.33–34; §5.1 pp.62–63 (Automorphic WD/Hodge purity for polarized motivic Hilbert families. Combined with Skinner and decomposition-field descent; no all-place coefficient theorem is inferred just from BLGGT strictness.).

<a id="kw-theorem-5-1-systems"></a>
### KW I Theorem 5.1: almost strictly compatible systems through prescribed lifts

Let ρ̄ satisfy KW I Theorem 5.1's hypotheses. For each i ∈ {1, 2, 3, 4} (with the conditions of that type) there are a number field E and an E-rational almost strictly compatible, irreducible, odd system (ρ_ι) lifting ρ̄ whose p-adic member is a lift of required type (i). In case (3), if the residual representation ρ̄_q is irreducible it has Serre weight i + 2 or q + 1 − i up to twist; in case (4), if q is odd and ρ̄_q is irreducible, its weight is q + 1 − (i − j) or i − j when i > j + 1, and q when i = j + 1 (Savitt, Corollary 6.15 and Remark 6.17). With the imported Skinner theorem the same constructed system is strictly compatible; the almost-strict conclusion is the source-faithful KW variant. Good Frobenius polynomials lie in one finite coefficient field and the geometric normalized family is pure by strict-brauer-system.

The following qualifications are part of the contract:

- the residual weight computations (3), (4) use almost strict compatibility at q and Savitt's computations of reductions of potentially Barsotti–Tate representations of tame type (requested)
- when the new residual characteristic q is 2 (KW I §9: case (4) with p = 3, q = 2 and characters of order 3) Savitt's paper does not apply, which is why the proof of KW I Theorem 9.1 gives an ad hoc argument that k(ρ̄′₂) = 2
- F. Diamond's list: the possible (i, j) are j = m(q + 1)/p^r − 1, i = q − 1 − j for 0 < m < p^r/2, so i = j + 1 does not occur

**Dependency and proof outline.**

1. The p-adic lift of type (i) (R24.3).
2. Potential modularity of the lift over a Galois F, via Theorem 9.7 as in the proof of Theorem 10.1.
3. The Brauer system and its almost strict compatibility.
4. Residual weights at q from almost strict compatibility and Savitt (and Saito for (4)).

Inputs: [KW I Theorem 5.1(1): minimal crystalline lifts](#theorem-5-1-part-1-minimal-crystalline); [KW I Theorem 5.1(2): minimal weight-two lifts](#theorem-5-1-part-2-weight-two); [KW I Theorem 5.1(3): a prescribed level-one type at q](#theorem-5-1-part-3-level-one-type-at-q); [KW I Theorem 5.1(4): a prescribed level-two type at q](#theorem-5-1-part-4-level-two-type-at-q); [The compatible system through a potentially modular lift, by Brauer induction](#brauer-induction-system); [The Brauer system is almost strictly compatible](#almost-strict-compatibility); `AlgebraicModularFormsAndSerreWeights:R15.4`; [Strict compatibility of the Brauer system](#strict-brauer-system).

**Acceptance checks.**

- Check Diamond's list on p = 3, q = 5: r = v₃(6) = 1, m = 1 gives j = 1, i = 3
- Check that the system is odd and irreducible (each member irreducible, Taylor)

Sources: [Chandrashekhar Khare and Jean-Pierre Wintenberger](<https://www.math.ucla.edu/~shekhar/papers/results.pdf>), Theorem 5.1, p. 9 of the preprint (The theorem.); [Chandrashekhar Khare and Jean-Pierre Wintenberger](<https://www.math.ucla.edu/~shekhar/papers/results.pdf>), Remark after Theorem 5.1, p. 10 (Savitt.); [Chandrashekhar Khare and Jean-Pierre Wintenberger](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>), §10.3.2, p. 94 (Residual weights.); [Chandrashekhar Khare and Jean-Pierre Wintenberger](<https://www.math.ucla.edu/~shekhar/papers/results.pdf>), Proof of Theorem 9.1, p. 19 of the preprint (No Savitt input in residual characteristic two.).

<a id="dieulefait-families"></a>
### Dieulefait: a given lift lies in an almost strictly compatible system (DP Theorem 1.11)

Dieulefait–Pacetti Theorem 1.11 states: let ρ : G_ℚ → GL₂(K_λ) be odd, irreducible, continuous, finitely ramified and de Rham at p with Hodge–Tate weights {0, k − 1}, k > 1, with ρ̄|_{G_{ℚ(ζ_p)}} absolutely irreducible (non-solvable image if p = 2); then ρ is part of a rank-2 almost strictly compatible system in the sense of DP Definition 1.10 (condition (6) relaxed only at residually reducible coefficient primes with ramified WD_p(ℛ), or p = 2; every member de Rham at its coefficient prime). This packet plans it for the lifts in the scope of R23.4: after a twist ρ̄ satisfies KW I Theorem 5.1's hypotheses, and ρ is of type (A), (B) or (C) at p (for p = 2: crystalline of weight 2, or semistable of weight 2 when ρ̄ is not finite at 2). These include the minimal crystalline lifts of DP Theorem 1.9(1)–(3) and the weight-two lifts of DP Theorem 1.9(4) that are crystalline or Steinberg at p, or of KW type (B). Proof: potential modularity of the given lift (R23.4) over a totally real Galois F, then the Brauer system and its almost strict compatibility (R24.5). In this scope strict-brauer-system upgrades the family to KW strict compatibility, which also gives DP's de Rham condition at every member. The rest of DP's statement is a recorded gap: weight-two lifts of DP Theorem 1.9(4) whose type at p is potentially Barsotti–Tate of another inertial type need potential modularity through a potentially Barsotti–Tate lifting theorem over totally real fields, and general de Rham lifts (k > p + 1, or potentially semistable of weight > 2) need potential modularity of arbitrary regular de Rham lifts. Neither is supplied by R23.4, and DP's citation [Die04, Theorem 1.1] does not cover them (source issue PotentialModularityAndCompatibleSystems/E5).

The following qualifications are part of the contract:

- it is a statement about a given lift, not about the existence of one: the lift is supplied (by R24.3 or otherwise)
- Dieulefait 2004 (arXiv math/0304433v1, Theorem 1.1) assumes ρ crystalline at an odd q with Hodge–Tate weights {0, w}, w odd and q ≥ 2w + 1; the proof planned here is KW II's §10.3.2 argument applied to a given lift, not Dieulefait's
- DP's almost strict systems require every member to be de Rham at its coefficient prime; KW's almost-strict definition does not, so the planned conclusion is stated through the strict upgrade

**Dependency and proof outline.**

1. R23.4: ρ|_{G_F} modular for some totally real Galois F.
2. R24.5/brauer-induction-system and R24.5/almost-strict-compatibility.

Inputs: `PotentialModularityAndCompatibleSystems:R23.4`; [The compatible system through a potentially modular lift, by Brauer induction](#brauer-induction-system); [The Brauer system is almost strictly compatible](#almost-strict-compatibility); [Strict compatibility of the Brauer system](#strict-brauer-system).

**Acceptance checks.**

- Check that de Rham with Hodge–Tate weights {0, k − 1} is what R23.4 needs
- Check the p = 2 hypothesis (non-solvable image) against R23.4
- Check that every application of DP Theorem 1.11 in DP §2 (the minimal crystalline lifts of Theorem 1.9(3) at the start of §2 and in Pasos 3 and 6, and the weight-two lifts of Theorem 1.9(4) in Pasos 1 and 6) is either in R23.4's scope or covered by the recorded gap.

Sources: [Luis Victor Dieulefait and Ariel Martín Pacetti](<https://arxiv.org/pdf/2108.07577v2>), Theorem 1.11, p. 7 of the arXiv version (The statement.); [Luis Victor Dieulefait and Ariel Martín Pacetti](<https://arxiv.org/pdf/2108.07577v2>), Proof of Theorem 1.11, p. 7 of the arXiv version (Attribution to Dieulefait 2004, whose Theorem 1.1 is narrower (E5).); [Luis Victor Dieulefait and Ariel Martín Pacetti](<https://arxiv.org/pdf/2108.07577v2>), Definition 1.10(4), p. 7 of the arXiv version (DP's systems are de Rham at every member.); [Luis V. Dieulefait](<https://arxiv.org/pdf/math/0304433>), Theorem 1.1, pp. 1–2 of arXiv:math/0304433v1 (The hypotheses of the theorem DP cite.).

## R24.6: reduction and changes of residual characteristic

<a id="residual-members"></a>
### Residual members of a compatible system

Let (ρ_ι) be an E-rational almost strictly compatible, irreducible, odd two-dimensional system of G_ℚ with weights (a, b), and ρ̄_ι the semisimplified reductions. (i) det ρ̄_ι is the reduction of det ρ_ι, and ρ̄_ι is odd. (ii) ρ̄_ι is absolutely irreducible for every ι above all but finitely many primes ℓ (KW I, proof of Theorem 10.1, which uses that the conductor of ρ_ι is bounded independently of ι and that the Hodge–Tate weights are fixed; KW I §8.4 uses it). If moreover a ≠ b, then for all but finitely many ℓ also ρ̄_ι|_{G_{ℚ(ζ_ℓ)}} is absolutely irreducible: for ℓ outside the ramification set with ℓ > 2(a − b) + 1, (v) gives k(ρ̄_ι) = a − b + 1 up to twist, while KW I Lemma 6.2(ii) would force a − b + 1 ∈ {(ℓ + 1)/2, (ℓ + 3)/2} if the restriction were reducible. For regular weakly compatible systems of any rank over any number field, R24.5/residual-irreducibility-density-one gives the restriction statement for every irreducible constituent, but only on a Dirichlet-density-one set of ℓ. (iii) For q ≠ ℓ, the Artin conductor of ρ̄_ι at q divides that of r_q, so N(ρ̄_ι) divides the prime-to-ℓ conductor of the system; the prime divisors of N(ρ̄_ι) are among the ramified primes of the system other than ℓ. (iv) If ρ(I_q) is finite of order prime to ℓ (for instance a dihedral group of order 2t^a with ℓ∤2t), reduction is injective on it, so ρ̄_ι|_{I_q} has the same shape. (v) If ℓ is outside the ramification set and ℓ ≠ 2, then ρ_ι is crystalline at ℓ. If additionally ρ̄_ι is of S-type and 1≤a−b≤ℓ−2, its normalized Serre weight is a−b+1 after twisting (Fontaine–Laffaille). Equal weights are excluded from this formula: an odd absolutely irreducible Artin member unramified at ℓ has normalized residual Serre weight ℓ, rather than 1.

The following qualifications are part of the contract:

- (ii) is the argument KW I give at the start of the proof of Theorem 10.1; its restriction clause uses KW I Lemma 6.2(ii) and (v), and is a statement about this rank-two setting. The BLGGT density-one theorem is the general-rank statement and is not needed for (ii)
- (iv) is the reduction step in the proof of KW I Lemma 6.3
- (v) requires a positive Hodge–Tate difference in the Fontaine–Laffaille range and an S-type residual representation for the Serre-weight assertion. The zero difference and endpoint cases require their separate local recipes.

**Dependency and proof outline.**

1. (i), (iii): reduction of a lattice; conductors only drop under reduction (ArithmeticGaloisRepresentations R01.3).
2. (ii): for ℓ ≫ 0 the member at ℓ is crystalline with Hodge–Tate weights (a, b) in the Fontaine–Laffaille range (plain compatibility), so a reducible ρ̄_ι^ss is a sum of two characters whose restrictions to I_ℓ are the powers of the cyclotomic character attached to a and b and whose prime-to-ℓ conductors divide the fixed conductor of the system. Only finitely many pairs of Dirichlet characters occur, so if infinitely many ι were residually reducible, one pair would give a congruence of all good Frobenius traces modulo infinitely many λ, hence an equality of traces in E, and Brauer–Nesbitt with Chebotarev (ArithmeticGaloisRepresentations R01.5) would make ρ_ι reducible. The restriction to G_{ℚ(ζ_ℓ)} follows from (v) and KW I Lemma 6.2(ii).
3. (iv): the kernel of GL₂(𝒪) → GL₂(𝔽) is pro-ℓ.
4. (v): almost strict compatibility gives crystallinity outside the fixed ramification set for odd ℓ. The positive-difference Fontaine–Laffaille comparison is R15.4/fontaine-laffaille-weight-comparison; its extension-sensitive local input remains the R07 supplier obligation. For zero difference, use the unramified branch of Serre’s recipe, which assigns weight ℓ.

Inputs: [Compatible systems: strict, almost strict, and plain](#compatible-system); `ArithmeticGaloisRepresentations:R01.3`; `ArithmeticGaloisRepresentations:R01.4`; `PadicHodgeTheory:R06.4/fontaine-laffaille-rational-consequences`; `AlgebraicModularFormsAndSerreWeights:R15.4`; [Residual irreducibility over F(ζ_l) for a density-one set of primes](#residual-irreducibility-density-one); [Strict compatibility of the Brauer system](#strict-brauer-system); `ArithmeticGaloisRepresentations:R01.1`; `ArithmeticGaloisRepresentations:R01.5`; `AlgebraicModularFormsAndSerreWeights:R15.4/fontaine-laffaille-weight-comparison`; `AlgebraicModularFormsAndSerreWeights:R15.4/serre-weight-tame-cases`.

**Acceptance checks.**

- Check (iii) on a system with a Steinberg prime q whose reduction mod ℓ becomes unramified at q (level lowering)
- Check (iv) on a dihedral inertia image of order 2·7 reduced modulo 3
- For a dihedral group of even order at ℓ=2, prime-to-ℓ injectivity cannot be used; verify the separate dyadic local input.
- Check (ii) on the Δ family (a − b = 11): ρ̄_ℓ is reducible exactly for ℓ ∈ {2, 3, 5, 7, 691} (Serre, Swinnerton-Dyer), a finite set; ρ̄_23 is irreducible but induced from ℚ(√−23) ⊂ ℚ(ζ_23), so it is reducible on G_{ℚ(ζ_23)}: this is the boundary case ℓ = 2(a − b) + 1 of the restriction clause, with weight 12 = (ℓ + 1)/2 as in KW I Lemma 6.2(ii).

- Use the standard two-dimensional rational S₃ representation of the splitting field of X³−2 over ℚ: it is odd and has Hodge–Tate weights (0,0). For ℓ>3 its reduction is absolutely irreducible and unramified at ℓ, so the normalized Serre weight is ℓ. The positive-difference formula must not return 1.

Sources: [Chandrashekhar Khare and Jean-Pierre Wintenberger](<https://www.math.ucla.edu/~shekhar/papers/results.pdf>), Proof of Theorem 10.1, p. 20 of the preprint ((ii).); [Chandrashekhar Khare and Jean-Pierre Wintenberger](<https://www.math.ucla.edu/~shekhar/papers/results.pdf>), §8.4, p. 17 of the preprint ((ii), the cofinite conclusion as KW use it.); [Chandrashekhar Khare and Jean-Pierre Wintenberger](<https://www.math.ucla.edu/~shekhar/papers/results.pdf>), Lemma 6.2(ii), p. 11 of the preprint ((ii), the restriction to G_{ℚ(ζ_ℓ)}: reducibility there forces weight (ℓ+1)/2 or (ℓ+3)/2.); [H. P. F. Swinnerton-Dyer](<http://gaetan.chenevier.perso.math.cnrs.fr/GT/swinnerton_dyer.pdf>), §2, Corollary 1, p. 15; §4, corollary to Theorem 4 and the weight-12 congruences, pp. 31–33 (The Δ row distinguishes reducible image (type (i), primes 2, 3, 5, 7, 691) from irreducible dihedral image (type (ii), prime 23); the latter splits over ℚ(√−23).). [Chandrashekhar Khare and Jean-Pierre Wintenberger](<https://www.math.ucla.edu/~shekhar/papers/results.pdf>), §1 p.2 and §10.1 p.20. Serre weights are normalized to be at least 2; weight-one Artin members are an irregular characteristic-zero case, not residual Serre weight 1.; [Luis Victor Dieulefait and Ariel Martín Pacetti](<https://arxiv.org/pdf/2108.07577v2>), Lemma 1.14, proof p.9. The unramified residual-inertia case has Serre weight p.

<a id="local-compatibility-at-the-coefficient-prime"></a>
### What an almost strict system says at its own coefficient prime

For an arbitrary KW almost-strict system and ι above ℓ, the definition gives full WD comparison at q=ℓ if the residual member is irreducible; if ℓ≠2 and r_ℓ is unramified it gives crystallinity and the prescribed Hodge weights. In the other cases its contract alone gives neither de Rham nor WD comparison. For the specific motivic Hilbert/Brauer systems constructed here, strict-brauer-system instead gives de Rham/potential semistability and full WD comparison at every coefficient prime, even for reducible residual members and ℓ=2; unramified r_ℓ then implies crystalline. These assertions are local input lemmas. Application of residually reducible de Rham modularity lifting belongs to GL2ModularityLifting R32.6 and is imported there.

The following qualifications are part of the contract:

- For an arbitrary almost-strict system, use only the residual-irreducible coefficient-prime clause or the odd unramified-parameter clause. The excluded residual-reducible ramified case has no WD assertion from that contract.
- Full coefficient-prime comparison for the constructed Hilbert/Brauer families uses strict-brauer-system and Skinner’s theorem; it does not restore the withdrawn assertion to the historical KW proof.

**Dependency and proof outline.**

1. Read the two conditional clauses of KW’s almost-strict definition; do not infer a condition in the excluded cases.
2. For the constructed system apply strict-brauer-system, with the full Skinner supplier.
3. Pass this local hypothesis to the R32.6 consumer; no Pan or other modularity-lifting proof is constructed in R24.6.

Inputs: [Compatible systems: strict, almost strict, and plain](#compatible-system); [The Brauer system is almost strictly compatible](#almost-strict-compatibility); [Strict compatibility of the Brauer system](#strict-brauer-system); `AutomorphicGaloisRepresentations:R19.5`; `PadicHodgeTheory:R06.3/weil-deligne-descent`; `AutomorphicGaloisRepresentations:R19.5/skinner-full-hilbert-coefficient-prime`.

**Acceptance checks.**

- Check DP Paso 5 case (1): N ramified in the system and ρ̄_N reducible is case (c)
- Check KW I §8.4: the auxiliary prime p′ is outside the ramification set, so case (b) applies

Sources: [Chandrashekhar Khare and Jean-Pierre Wintenberger](<https://www.math.ucla.edu/~shekhar/papers/results.pdf>), §5, p. 8 of the preprint (The almost strict conditions.); [Luis Victor Dieulefait and Ariel Martín Pacetti](<https://arxiv.org/pdf/2108.07577v2>), Paso 5, p. 14 of the arXiv version (The modern route in case (c).).

<a id="linked-systems-modularity-transfer"></a>
### Linked systems and modularity transfer

If one member of a compatible rank-two family is the member attached to a newform f, all members are attached to f after common coefficient extension, by equality of good Frobenius characteristic polynomials and Chebotarev–Brauer–Nesbitt recognition. Two families are linked at λ when their chosen semisimplified residual members are isomorphic. Given this link to a modular family, the classical congruence transfer is the application of the imported KW I Theorem 4.1 interface when its local and residual-image hypotheses hold. Modern transfer, especially ramified coefficient-prime residually reducible de Rham transfer, is an import from GL2ModularityLifting R32.6, not a new theorem here.

The following qualifications are part of the contract:

- (ii) needs the lifting theorem's residual hypotheses at λ (non-solvable image at 2, cyclotomic irreducibility at odd λ)
- the transfer is along a single residual representation; the conductor and weight of the two systems may differ

**Dependency and proof outline.**

1. Compare characteristic polynomials in a common finite coefficient extension.
2. Apply recognition memberwise to the existing f-family.
3. Apply the appropriate owner’s lifting export, retaining all its local/de Rham and residual-image conditions.

Inputs: [Compatible systems: strict, almost strict, and plain](#compatible-system); `ArithmeticGaloisRepresentations:R01.5`; [KW I Theorem 4.1: modularity lifting over ℚ](#kw-theorem-4-1); `AutomorphicGaloisRepresentations:R19.3`; `GL2ModularityLifting:R32.6/transfer-residually-reducible`; `GL2ModularityLifting:R32.6/transfer-dyadic`; `GL2ModularityLifting:R32.6/transfer-residually-irreducible-odd`.

**Acceptance checks.**

- Check (ii) in KW I §8.2's inductive step: (ρ_ι) and (ρ′_ι) linked at ℓ
- Check that the lifting theorem used at each link has its residual hypotheses

Sources: [Chandrashekhar Khare and Jean-Pierre Wintenberger](<https://www.math.ucla.edu/~shekhar/papers/results.pdf>), §8.2, p. 15 of the preprint (Linked systems.); [Luis Victor Dieulefait and Ariel Martín Pacetti](<https://arxiv.org/pdf/2108.07577v2>), Remark 4, p. 7 of the arXiv version ((i).).

## Atlas landmarks and coverage

The packet retains 43 declarations, 85 API items, 61 discriminating tests and 12 planets. All five stages are planned at target level. Their remaining obligations are explicit; none is proof-closed.

| Stage | Status | Plan boundary |
| --- | --- | --- |
| `PotentialModularityAndCompatibleSystems:R24.3` | planned | Every prescribed-lift target and the earlier Böckle/Annals input is represented; local definitions and commutative algebra are imports, with exact requests where existing statements are too narrow. |
| `PotentialModularityAndCompatibleSystems:R24.4` | planned | Consumer/import layer only. R22.5/R22.6 own the proof. The R24.3→R24.4 chronological edge must not become a lift-existence/finiteness proof dependency (confirmed RT /12). |
| `PotentialModularityAndCompatibleSystems:R24.5` | planned | A genuine common-field family and its Frobenius/weight/purity/local contracts are planned. Strictness at reducible residual coefficient primes follows from the full Skinner input (RT /30), not an assumed upgrade of Kisin. |
| `PotentialModularityAndCompatibleSystems:R24.5:operations` | planned | Common carriers and operations precede eigenform/potential-modularity/potential-automorphy existence (RT /10). Rank-n operations, polarization with signs, character/induced/Artin purity and Larsen residual-density tools are all target-planned. BLGGT potential-automorphy endpoints remain imports to ML.2, not targets here. |
| `PotentialModularityAndCompatibleSystems:R24.6` | planned | Reduction and local-hypothesis lemmas plus memberwise recognition/classical KW application are planned; modern de Rham transfer remains with its owner. |

The remaining refinements by stage are:

- `PotentialModularityAndCompatibleSystems:R24.3`: Resolve the exact parameter-system algebra and auxiliary-to-minimal R=T supplier requests; verify the local minimality recognition export and Savitt weight inputs. Refine the omitted arithmetic lift-type suggested signatures when R01/R04/R08 carriers are available.
- `PotentialModularityAndCompatibleSystems:R24.4`: Realize the existing full KW I Theorem 4.1 exports from R22.5/R22.6 and discharge the R22.5 non-ordinary crystalline endpoint (k=p+1, residual weight 2) proof gap; residual Serre-weight supplier requests remain.
- `PotentialModularityAndCompatibleSystems:R24.5`: Realize the reviewed general Hilbert family, normalization and full Skinner coefficient-prime exports; supply the exact overlap/absolute-irreducibility pairing interfaces and eigenform purity from their owners. Verify Savitt’s exact residual weights; the historical almost-strict variant and the strict Brauer refinement are both planned. Potential modularity of weight-two lifts of other potentially Barsotti–Tate types and of general regular de Rham lifts, for the full scope of DP Theorem 1.11 (gap recorded by the review).
- `PotentialModularityAndCompatibleSystems:R24.5:operations`: Resolve arithmetic continuity, Hodge–Tate, perfect polarization, Hecke-character and monodromy supplier interfaces. Read and transcribe the Larsen–Pink/Larsen/Bogomolov/Serre/Conrad–Chai–Oort/Bruhat–Tits proof leaves named in gaps. Extend the suggested signatures for WD, density, algebraic monodromy, and local constants when the supplier types can be stated; current omissions are explicit.
- `PotentialModularityAndCompatibleSystems:R24.6`: Resolve the reduction/conductor/weight interfaces and retain the density-one versus cofinite distinction. Integrate local strictness from Skinner while importing modern ramified residually reducible transfer solely from R32.6 (RT /21).

The planets remain the key objects and named results:

- **Minimal lifts**: [Minimally ramified lifts (Khare–Wintenberger, Annals, Theorem 3.3)](#kw-annals-minimal-lifts), on `PotentialModularityAndCompatibleSystems:R24.3`.
- **Lifts of required type**: [Lifts of required type (KW I Theorem 5.1 (1)–(4))](#required-lift-types), on `PotentialModularityAndCompatibleSystems:R24.3`.
- **Compatible systems by Brauer induction**: [The compatible system through a potentially modular lift, by Brauer induction](#brauer-induction-system), on `PotentialModularityAndCompatibleSystems:R24.5`.
- **Prescribed compatible systems**: [KW I Theorem 5.1: almost strictly compatible systems through prescribed lifts](#kw-theorem-5-1-systems), on `PotentialModularityAndCompatibleSystems:R24.5`.
- **Local compatibility at the coefficient prime**: [What an almost strict system says at its own coefficient prime](#local-compatibility-at-the-coefficient-prime), on `PotentialModularityAndCompatibleSystems:R24.6`.
- **Weakly compatible systems**: [Rank-n weakly compatible systems of l-adic representations](#weakly-compatible-system-rank-n), on `PotentialModularityAndCompatibleSystems:R24.5:operations`.
- **Galois representation ring**: [The Grothendieck ring of semisimple ℓ-adic representations](#galois-grothendieck-ring), on `PotentialModularityAndCompatibleSystems:R24.5:operations`.
- **Residual irreducibility**: [Residual irreducibility over F(ζ_l) for a density-one set of primes](#residual-irreducibility-density-one), on `PotentialModularityAndCompatibleSystems:R24.5:operations`.
- **Strict compatible systems**: [Strict compatibility of the Brauer system](#strict-brauer-system), on `PotentialModularityAndCompatibleSystems:R24.5`.
- **Common monodromy component field**: [The common component field of a compatible system](#monodromy-component-field), on `PotentialModularityAndCompatibleSystems:R24.5:operations`.
- **Polarized compatible systems**: [Polarized weakly compatible systems](#polarized-system), on `PotentialModularityAndCompatibleSystems:R24.5:operations`.
- **Purity of rank-one systems**: [Purity of character systems](#rank-one-purity), on `PotentialModularityAndCompatibleSystems:R24.5:operations`.

## Supplier contracts

These 26 contracts name the owners of the imported mathematics. Existing upstream interfaces are consumed without a duplicate construction; open requests refine their supplier stages.

- **`LocalGaloisDeformationRings:R08.6`** (open): Export Snowden's fixed-determinant local deformation quotients of prescribed inertial and definite type (arXiv:0905.4266v1, Propositions 7.3.1 and 7.4.1, pp. 21–22): they are flat and reduced, with component dimensions 4 away from p and [F_v:ℚ_p]+4 above p, but may be zero. Establish local solutions, including the determinant and weight-two condition above p, for each prescribed type used by DP Theorem 1.9(4). Residual-inertia compatibility of an inertial-type lattice alone does not prove this. Proposition 7.7.1 (p. 23) gives a same-conductor lift of some definite type away from p; it does not guarantee a chosen inertial type. Used by [Weight-two lifts with prescribed types (Snowden Theorem 7.2.1; Gee)](#modern-prescribed-type-lifts).
- **`SerreWeightAndLevelOptimisation:R20.6`** (open): The weight part of Serre's conjecture for modular ρ̄ as KW II §10.2 uses it: ρ̄ arises from S_{k(ρ̄)}(Γ₁(N)) with p ∤ N and from S₂(Γ₁(Np)) (Gross, Theorem 13.10 and Propositions 8.13, 8.18; Coleman–Voloch). Used by [From "ρ̄ modular" to the residual hypotheses (α) and (β)](#alpha-beta-from-residual-modularity).
- **`AlgebraicModularFormsAndSerreWeights:R15.4`** (open): Serre weights of residual representations for the weight bookkeeping of KW I Theorem 5.1(3),(4), with Savitt's computation of the reductions of potentially Barsotti–Tate representations of tame type (Duke 128 (2005), Corollary 6.15 and Remark 6.17). For residual-members(v), also consume the positive-difference Fontaine–Laffaille comparison (1≤a−b≤ℓ−2), including the ordered wild-extension/finite-flat input requested from R07; for zero difference use the unramified Serre-weight-ℓ branch, not weight 1. Used by [From "ρ̄ modular" to the residual hypotheses (α) and (β)](#alpha-beta-from-residual-modularity), [KW I Theorem 5.1: almost strictly compatible systems through prescribed lifts](#kw-theorem-5-1-systems), [Residual members of a compatible system](#residual-members).
- **`AlgebraicModularFormsAndSerreWeights:R15.6`** (open): The definitions of S-type, k(ρ̄), N(ρ̄) and "modular" used in KW I Theorems 4.1 and 5.1. Used by [Lifts of required type (KW I Theorem 5.1 (1)–(4))](#required-lift-types).
- **`GL2AutomorphicRepresentationsAndTransfer:R17.4`** (open): Langlands' solvable base change and descent for Hilbert modular forms, as used in KW II §§9–10 (descent of modularity along allowable base changes; the π_i of the Brauer argument). Used by [From "ρ̄ modular" to the residual hypotheses (α) and (β)](#alpha-beta-from-residual-modularity), [KW I Theorem 4.1: modularity lifting over ℚ](#kw-theorem-4-1), [The compatible system through a potentially modular lift, by Brauer induction](#brauer-induction-system).
- **`ArithmeticGaloisRepresentations:R01.2`** (open): Weil–Deligne parameters of ℓ-adic representations and their compatibility with twist, restriction and induction. Used by [Compatible systems: strict, almost strict, and plain](#compatible-system), [Twisting, restriction and induction of compatible systems](#system-operations), [Lifts of required type (KW I Theorem 5.1 (1)–(4))](#required-lift-types).
- **`ArithmeticGaloisRepresentations:R01.3`** (open): Artin conductors and their behaviour under reduction. Used by [Residual members of a compatible system](#residual-members).
- **`ArithmeticGaloisRepresentations:R01.4`** (open): Residual images: absolute irreducibility and oddness of residual members. Used by [Residual members of a compatible system](#residual-members).
- **`ArithmeticGaloisRepresentations:R01.5`** (open): Recognition of semisimple representations by common good Frobenius polynomials (Brauer–Nesbitt with Chebotarev). Also export BLGGT v4 Lemma A.1.5: for a semisimple representation of an arbitrary group over an algebraically closed characteristic-zero field, traces in M and one element with distinct M-rational eigenvalues imply an M-model. Consume the trace pairing, Schur and algebra Wedderburn presentation from upstream SemisimpleAlgebras Layers 1–2; neither traces alone nor arbitrary residual traces remove a coefficient-descent obstruction. Used by [Compatible systems: strict, almost strict, and plain](#compatible-system), [Twisting, restriction and induction of compatible systems](#system-operations), [The compatible system through a potentially modular lift, by Brauer induction](#brauer-induction-system), [Linked systems and modularity transfer](#linked-systems-modularity-transfer), [The Grothendieck ring of semisimple ℓ-adic representations](#galois-grothendieck-ring), [The common component field of a compatible system](#monodromy-component-field), [Rank-n weakly compatible systems of l-adic representations](#weakly-compatible-system-rank-n), [Linear-algebra operations on weakly compatible systems and what they preserve](#linear-algebra-operations-on-systems), [Reducibility of rank-2 systems over ℚ does not depend on λ](#rank-two-reducibility-independent-of-lambda), [Residual members of a compatible system](#residual-members).
- **`EndoscopicTransferAndUnitaryTraceComparison:ET.6`** (open): The local L-factor L(WD, s) and the local constant ε(WD, ψ, s) of a Frobenius-semisimple Weil–Deligne representation of W_{F_v}, F_v/ℚ_p finite, with Deligne's normalisation: additivity, inductivity in degree zero, and the unramified case ε = 1 when WD and ψ are unramified. BLGGT §5.1 take ψ_v(x) = ψ_p(tr_{F_v/ℚ_p}(x)) with ψ_p|_{ℤ_p} = 1 and ψ_p(1/p) = e^{−2πi/p}, and form ε(ıℛ, s) as the product of ε(ıWD_v(ℛ), ψ_v, s) over finite v with the archimedean and Hodge factors. Used by [L-functions, Γ-factors and ε-factors of a compatible system](#system-l-functions).
- **`tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction`** (open): Brauer's induction theorem for a finite group G over ℂ: 1 = Σ n_i Ind_{H_i}^G ψ_i in the virtual character ring with n_i ∈ ℤ, H_i elementary (hence soluble) and ψ_i linear characters, together with the induced-character formula, Frobenius reciprocity and Mackey's formula of Layers 2–3. BLGGT §5.4 (8)(f) apply it to G = Gal(F′/F) and transport it to ℓ-adic Galois representations by ı^{−1}. Used by [The Grothendieck ring of semisimple ℓ-adic representations](#galois-grothendieck-ring), [The compatible system through a potentially modular lift, by Brauer induction](#brauer-induction-system).
- **`GL2ModularityLifting:R22.5`** (open): Consume the existing planned R22.5/kw-i-theorem-4-1-odd-prime export of the full odd-prime KW I Theorem 4.1(2), with cyclotomic absolute irreducibility, modular residual input, finite ramification, crystalline weights 2≤k≤p+1 or potentially semistable weight two. Its non-ordinary k=p+1 case with residual weight 2 remains an explicit Kisin Durham proof gap in the supplier; this request stays open for that leaf and signature realization. The narrower Theorem 9.7 export alone is insufficient. The proof uses no finiteness Theorem 10.1, potential modularity or lift-existence input. Used by [KW I Theorem 4.1: modularity lifting over ℚ](#kw-theorem-4-1).
- **`DeformationAndDerivedPatchingAlgebra:R03.3`** (open): For a complete DVR 𝒪, A=𝒪[[x₁,…,x_n]] is regular local of dimension n+1; a system of parameters in a Cohen–Macaulay local ring is regular, and its permutations in the maximal ideal remain regular; Krull height and finite torsion-free ⇒ flat over a DVR give Böckle Lemma 2. Existing regular-local-cohen-macaulay only covers minimal generators of the maximal ideal, not arbitrary parameter systems. Supply the exact parameter-system theorem and formal-power-series instances. Used by [Finite plus few relations gives a finite flat complete intersection (Böckle's Lemma 2)](#finite-presentation-complete-intersection).
- **`GL2ModularityLifting:R22.3`** (open): Supply Böckle Appendix 1 Theorem 1 in the 2003 Khare setting: an auxiliary R_Q≅T_Q of finite flat W(k)-algebras implies minimal R_∅≅T_∅. The current minimal-ring-finite conclusion alone is weaker than this integral isomorphism. Used by [Böckle's Theorem 1: an auxiliary R_Q ≅ T_Q gives the minimal R_∅ ≅ T_∅](#bockle-minimal-r-equals-t).
- **`LocalGaloisDeformationRings:R08.6`** (open): Export KW I §5’s minimal-lift definition in all inertia cases, including the exceptional dyadic induction from a ramified quadratic extension with the determinant-correcting quadratic character. Prove KW I p.10 Remark: for odd q∥N(ρ̄), p∤q−1, every geometric lift with q∥N(ρ) is minimal at q. Existing kw-local-conditions/export-away-from-p do not state this exact recognition criterion. Used by [Lifts of required type (KW I Theorem 5.1 (1)–(4))](#required-lift-types).
- **`AutomorphicGaloisRepresentations:R19.3`** (open): Consume R19.3/fixed-eigenform-compatible-family and R19.2/all-cohomological-hilbert-representation for the holomorphic cuspidal GL₂ forms used in KW II §10.3.2, including parallel weight two over even-degree totally real fields with no finite discrete-series place. Use R19.2/hilbert-normalisation-dictionary to obtain KW arithmetic members. Supply the exact absolute-irreducibility and overlap/base-change comparisons for Brauer descent; those proof interfaces and realization remain open. The family imports the early R24.5:operations carrier, avoiding a reverse definition dependency. Used by [The compatible system through a potentially modular lift, by Brauer induction](#brauer-induction-system), [The Brauer system is almost strictly compatible](#almost-strict-compatibility), [Linked systems and modularity transfer](#linked-systems-modularity-transfer).
- **`AutomorphicGaloisRepresentations:R19.4`** (open): Consume R19.4/all-hilbert-local-global-compatibility with full monodromy for the general R19.3 Hilbert families, including cases outside the historical Carayol parity scope. Transport its geometric coefficient representation to the KW arithmetic member via R19.2/hilbert-normalisation-dictionary. Keep the realization of this comparison and its overlap use explicit; importing good-place traces alone would lose monodromy. Used by [The compatible system through a potentially modular lift, by Brauer induction](#brauer-induction-system), [The Brauer system is almost strictly compatible](#almost-strict-compatibility), [Strict compatibility of the Brauer system](#strict-brauer-system).
- **`GL2AutomorphicRepresentationsAndTransfer:R17.6`** (open): Supply the overlap/descent identification used to compare Mackey pairing summands for two solvable subfields of a finite totally real Galois extension. For families restricting to the same absolutely irreducible family over F, Hom over overlap fields carries a finite character determined from the fixed p-member and independent of ℓ; this proves the Brauer class has norm one. Used by [The compatible system through a potentially modular lift, by Brauer induction](#brauer-induction-system).
- **`AutomorphicGaloisRepresentations:R19.5`** (open): Consume the reviewed planned R19.5/skinner-full-hilbert-coefficient-prime export of Skinner, Documenta Math. 14 (2009), Theorem 1, pp.241–243. Every motivic holomorphic cuspidal Hilbert form has potentially semistable coefficient-prime restrictions and the full WD comparison, without residual irreducibility, degree parity or a finite discrete-series place. Use R19.2/hilbert-normalisation-dictionary for the actual coefficient representation and KW arithmetic dual, including the Hodge-degree shift corrected in AutomorphicGaloisRepresentations/E4; do not identify the printed Skinner degrees with the supplier carrier without this conversion. The arithmetic signature realization remains open. Used by [Strict compatibility of the Brauer system](#strict-brauer-system), [What an almost strict system says at its own coefficient prime](#local-compatibility-at-the-coefficient-prime), [The Brauer system is almost strictly compatible](#almost-strict-compatibility).
- **`WeightsInEtaleCohomology:R34.6`** (open): Export Hilbert eigenform purity in geometric normalization: common good Frobenius roots of absolute square q_v^w, H_{cτ}=w−H_τ, and pure full WD parameters at all finite places for the motivic cuspidal Hilbert families used by KW. This owner supplies purity; the compatible-system carrier does not invoke an eigenform existence theorem. Used by [Strict compatibility of the Brauer system](#strict-brauer-system).
- **`ArithmeticGaloisRepresentations:R01.1`** (open): Provide actual continuous representation and integral-lattice/reduction/semisimplification APIs over finite completed coefficient fields, topology on the group action, finite ramification, and coefficient extension. Mathlib Representation is algebraic and ContRepresentation only makes each operator continuous on V. Used by [Compatible systems: strict, almost strict, and plain](#compatible-system), [Rank-n weakly compatible systems of l-adic representations](#weakly-compatible-system-rank-n), [Compatible systems of Artin representations](#artin-system), [Residual members of a compatible system](#residual-members), [Lifts of required type (KW I Theorem 5.1 (1)–(4))](#required-lift-types), [Twisting, restriction and induction of compatible systems](#system-operations), [The Grothendieck ring of semisimple ℓ-adic representations](#galois-grothendieck-ring), [Compatible systems of algebraic Hecke characters](#character-system), [Very weak and extremely weak compatible data](#weakened-compatible-data).
- **`ArithmeticGaloisRepresentations:G7`** (open): Export the actual perfect CM/TR polarization pairing and sign/multiplier convention of BLGGT §2.1, its normalized tensor and power operations (CM δ_F/F⁺ correction), plus dimension-general symmetric/exterior operations, continuous induction/restriction, Zariski closures and connected-component representation API. These representation-level definitions are owned by G7; this packet only assembles families. Used by [Polarized weakly compatible systems](#polarized-system), [Operations on polarized systems](#polarized-operations), [Linear-algebra operations on weakly compatible systems and what they preserve](#linear-algebra-operations-on-systems), [The common component field of a compatible system](#monodromy-component-field), [The algebraic groups attached to a rational compatible system (BLGGT v4 §5.2)](#larsen-rational-system-groups), [Twisting, restriction and induction of compatible systems](#system-operations), [Predicates on weakly compatible systems: regular, strictly compatible, pure, self-dual, irreducible, automorphic](#compatible-system-predicates), [The Grothendieck ring of semisimple ℓ-adic representations](#galois-grothendieck-ring), [Compatible systems of Artin representations](#artin-system).
- **`PadicHodgeTheory:R06.2`** (open): Provide actual labeled Hodge–Tate multisets and coefficient/base-field transport for continuous completed-field representations; direct sums, tensor products, duals, symmetric/exterior powers, restriction and induction have the stated multiset formulas. Rank-one finite-image representations are potentially unramified/de Rham with all weights zero. Used by [Rank-n weakly compatible systems of l-adic representations](#weakly-compatible-system-rank-n), [Linear-algebra operations on weakly compatible systems and what they preserve](#linear-algebra-operations-on-systems), [Compatible systems of Artin representations](#artin-system), [Very weak and extremely weak compatible data](#weakened-compatible-data).
- **`tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity`** (open): ClassFieldTheory, Part II: extend the existing global reciprocity interface to the ℓ-adic realization and converse classification of finitely ramified algebraic/de Rham one-dimensional characters as type-A₀ Hecke characters, with a common number field and geometric-Frobenius convention. Consume Hecke carriers and their infinity-type purity from GlobalNumberFields Layers 9–10, and request local de Rham/crystalline and WD purity comparisons from PadicHodgeTheory R06.2–R06.3. BLGGT Appendix A.2 and ACC+ p.197 identify the required character interface. Do not rebuild global reciprocity or general characters here. Used by [Compatible systems of algebraic Hecke characters](#character-system), [Purity of character systems](#rank-one-purity).
- **`tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters`** (provided-upstream): Consume the existing upstream Hecke-character carrier, conductor and algebraic infinity-type/purity interface. This is an existing-interface import: no new character definition, reciprocity theorem or eigenform construction is requested here. Used by [Compatible systems of algebraic Hecke characters](#character-system).
- **`tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic`** (provided-upstream): Consume the existing upstream Hecke-character carrier, conductor and algebraic infinity-type/purity interface. This is an existing-interface import: no new character definition, reciprocity theorem or eigenform construction is requested here. Used by [Compatible systems of algebraic Hecke characters](#character-system).

## Structure proposals and upstream note

The rank-one compatible-system constructor needs the algebraic ℓ-adic realization and converse classification beyond the existing upstream global Artin reciprocity roadmap. GlobalNumberFields Layers 9–10 already supply the general Hecke-character carrier and infinity-type purity.

Create Class field theory, Part II: algebraic ℓ-adic character realization and classification, with upstream ClassFieldTheory as its first prerequisite and GlobalNumberFields Layers 9–10 as imports. It supplies the geometric-Frobenius type-A₀ Hecke realization, common coefficient field, local Hodge/WD comparison and converse algebraic-character classification requested here. It does not reconstruct global reciprocity or general Hecke characters. The current R24.5:operations scope keeps only assembly of rank-one families and their elementary purity consequences.

Confirmed RT-AREA-langlands-2/12: R24.4 consumes the KW lifting theorem, whose proof in KW II §10.2 does not use R24.1–R24.3 lift existence or finiteness.

Keep R24.4 as an import/application interface with prerequisites GL2ModularityLifting R22.5/R22.6 and SerreWeightAndLevelOptimisation R20.3/R20.6. Remove the chronological R24.3→R24.4 dependency and give R24.5 its direct R24.3 lift input. R22 retains ownership of Theorem 4.1; the packet does not edit the campaign graph.

Confirmed RT-AREA-langlands-2/30 and /21: full Skinner coefficient-prime compatibility supplies strict Brauer families, while modern ramified residually reducible transfer is owned by R32.6.

Extend the proposed AutomorphicGaloisRepresentations R19.5 scope to Skinner 2009 Theorem 1, including the Blasius–Rogawski Hilbert families outside the Saito/Carayol parity restriction. R24.5 imports that theorem for strictness at every coefficient prime, including ℓ=2 and reducible residual members; retain KW almost strictness as its historical variant. R24.6 consumes strict local compatibility and retains reduction/local-hypothesis lemmas, importing the modern de Rham transfer solely from GL2ModularityLifting R32.6. These proposals change no upstream Tau Ceti roadmap.

The maintainer note for `tauceti:TauCetiRoadmap/GlobalNumberFields`, `tauceti:TauCetiRoadmap/ClassFieldTheory` is: GlobalNumberFields Layers 9–10 already own Hecke characters and algebraic infinity-type purity, and explicitly exclude reciprocity. Import ClassFieldTheory Layers 11–12 for Artin normalization; request the ℓ-adic algebraic-character realization/classification comparison as ClassFieldTheory, Part II rather than adding another general character carrier here.

## Proof and prototype boundaries

The suggested Lean file retains concrete fragments over the pinned Mathlib types. It does not replace missing arithmetic definitions by arbitrary proposition fields. Full local, Hodge, automorphic, monodromy and density signatures remain named omissions, with supplier routes. Compiling these fragments checks their syntax and baseline compatibility; it does not close the arithmetic plan.

**Savitt's residual weight computations are requested, not planned.** Verified: KW I and KW II attribute the residual weights of Theorem 5.1(3),(4) to Savitt, Duke 128 (2005), Corollary 6.15 and Remark 6.17 (and T. Saito for (4)). Not verified: Savitt's statements. No stage names Savitt; the request goes to AlgebraicModularFormsAndSerreWeights R15.4, which owns Serre weights.

Needed by: [KW I Theorem 5.1: almost strictly compatible systems through prescribed lifts](#kw-theorem-5-1-systems).

**Gee 2011 was not read; Dieulefait 2004 covers only small odd crystalline weights.** Verified: Dieulefait–Pacetti's statements of Theorems 1.9(4) and 1.11 and their attributions; Snowden's Theorems 7.2.1 and 7.6.1 (read). The review read Dieulefait, arXiv math/0304433v1 (the Crelle 577 (2004) text was not obtained): its Theorem 1.1 assumes a lift crystalline at an odd q with Hodge–Tate weights {0, w}, w odd and q ≥ 2w + 1. Not verified: Gee, Math. Ann. 350 (2011). The nodes give KW II's and Snowden's arguments, which suffice in the scope planned.

Needed by: [Dieulefait: a given lift lies in an almost strictly compatible system (DP Theorem 1.11)](#dieulefait-families), [Weight-two lifts with prescribed types (Snowden Theorem 7.2.1; Gee)](#modern-prescribed-type-lifts).

**The common-component and Sen monodromy inputs remain source leaves.** Verified: BLGGT v1 Lemma 5.2.1 (p.54), v4 Lemma 5.3.1 (pp.70–71), and the complete proof of its coefficient-descent Lemma A.1.5 (p.85). The component-field argument invokes Larsen–Pink Proposition 6.14/Serre, and the multiplicity-one argument invokes Sen 1973 for a torus with the labeled Hodge–Tate weights; these original proofs were not read. Import them through ArithmeticGaloisRepresentations G7 and PadicHodgeTheory R06.2. R01.5 must export the split-eigenvalue descent criterion, consuming the upstream semisimple-algebra API. The two distinct Frobenius splitting fields are needed for the uniform coefficient extension.

Needed by: [The common component field of a compatible system](#monodromy-component-field), [The algebraic groups attached to a rational compatible system (BLGGT v4 §5.2)](#larsen-rational-system-groups), [Residual irreducibility over F(ζ_l) for a density-one set of primes](#residual-irreducibility-density-one).

**Larsen, Maximality of Galois actions for compatible systems (Duke 1995), is not read.** Verified: BLGGT's proof of Proposition 5.2.2 (pp. 56–58) takes its density-one set of primes from [Lar95], citing (1.12)–(1.13) (standard reductions), Proposition 2.6 (perfectness), 3.15 (G_l⁰ unramified) and Theorem 3.17 (the integral simply connected model); it also cites Bogomolov 1980 for openness of the image and Serre's Abelian l-adic representations III.1–III.2 with Conrad–Chai–Oort Proposition 6.3 for θ_l. Not verified: Larsen's statements, which were not read. BLGGT v4 §5.2 now isolates exactly what is used (larsen-good-primes): Larsen Theorem 3.17 and §§1.12–1.13, Larsen–Pink Proposition 8.9, Bruhat–Tits 5.1.40 and 5.2.8, and Conrad–Chai–Oort Proposition 6.3; these remain unread.

Needed by: [Density-one sets of good primes for a rational system (BLGGT v4 Proposition 5.2.2, after Larsen)](#larsen-good-primes), [Residual irreducibility over F(ζ_l) for a density-one set of primes](#residual-irreducibility-density-one).

**Supplier signatures needed for complete arithmetic Lean forms.** Pinned Mathlib has algebraic representations, Krull-topological Galois groups and completions, but lacks the arithmetic local restriction/inertia/WD, labeled Hodge, deformation-point, automorphic-eigenform, density and reductive-model interfaces needed by full signatures. The suggested file supplies actual baseline-expressible carrier fragments and named arithmetic/pairing tests; omitted predicates and theorems are listed under their planned names, never replaced by arbitrary Prop fields. Supplier requests and coverage remaining lists identify the refinements.

Needed by: [Böckle's presentation of a global deformation ring (Proposition 1 of the appendix)](#bockle-presentation), [Finite plus few relations gives a finite flat complete intersection (Böckle's Lemma 2)](#finite-presentation-complete-intersection), [Böckle's Theorem 1: an auxiliary R_Q ≅ T_Q gives the minimal R_∅ ≅ T_∅](#bockle-minimal-r-equals-t), [Minimally ramified lifts (Khare–Wintenberger, Annals, Theorem 3.3)](#kw-annals-minimal-lifts), [Lifts of required type (KW I Theorem 5.1 (1)–(4))](#required-lift-types), [KW I Theorem 5.1(1): minimal crystalline lifts](#theorem-5-1-part-1-minimal-crystalline), [KW I Theorem 5.1(2): minimal weight-two lifts](#theorem-5-1-part-2-weight-two), [KW I Theorem 5.1(3): a prescribed level-one type at q](#theorem-5-1-part-3-level-one-type-at-q), [KW I Theorem 5.1(4): a prescribed level-two type at q](#theorem-5-1-part-4-level-two-type-at-q), [Where the lifts of KW I Theorem 5.1 are used](#theorem-5-1-application-table), [Weight-two lifts with prescribed types (Snowden Theorem 7.2.1; Gee)](#modern-prescribed-type-lifts), [From "ρ̄ modular" to the residual hypotheses (α) and (β)](#alpha-beta-from-residual-modularity), [KW I Theorem 4.1: modularity lifting over ℚ](#kw-theorem-4-1), [Compatible systems: strict, almost strict, and plain](#compatible-system), [Twisting, restriction and induction of compatible systems](#system-operations), [The compatible system through a potentially modular lift, by Brauer induction](#brauer-induction-system), [The Brauer system is almost strictly compatible](#almost-strict-compatibility), [KW I Theorem 5.1: almost strictly compatible systems through prescribed lifts](#kw-theorem-5-1-systems), [Dieulefait: a given lift lies in an almost strictly compatible system (DP Theorem 1.11)](#dieulefait-families), [Residual members of a compatible system](#residual-members), [What an almost strict system says at its own coefficient prime](#local-compatibility-at-the-coefficient-prime), [Linked systems and modularity transfer](#linked-systems-modularity-transfer), [Rank-n weakly compatible systems of l-adic representations](#weakly-compatible-system-rank-n), [Predicates on weakly compatible systems: regular, strictly compatible, pure, self-dual, irreducible, automorphic](#compatible-system-predicates), [Linear-algebra operations on weakly compatible systems and what they preserve](#linear-algebra-operations-on-systems), [Reducibility of rank-2 systems over ℚ does not depend on λ](#rank-two-reducibility-independent-of-lambda), [L-functions, Γ-factors and ε-factors of a compatible system](#system-l-functions), [The Grothendieck ring of semisimple ℓ-adic representations](#galois-grothendieck-ring), [Residual irreducibility over F(ζ_l) for a density-one set of primes](#residual-irreducibility-density-one), [Constituents of an essentially conjugate self-dual system](#constituents-essentially-self-dual), [The algebraic groups attached to a rational compatible system (BLGGT v4 §5.2)](#larsen-rational-system-groups), [Serre's θ_l with bounds uniform in l (BLGGT v4 Lemma 5.2.1)](#serre-theta-uniform-bounds), [Density-one sets of good primes for a rational system (BLGGT v4 Proposition 5.2.2, after Larsen)](#larsen-good-primes), [Strict compatibility of the Brauer system](#strict-brauer-system), [The common component field of a compatible system](#monodromy-component-field), [Polarized weakly compatible systems](#polarized-system), [Operations on polarized systems](#polarized-operations), [Compatible systems of algebraic Hecke characters](#character-system), [Purity of character systems](#rank-one-purity), [Purity of systems induced from characters](#induced-character-purity), [Compatible systems of Artin representations](#artin-system), [Purity of Artin systems up to twist](#artin-twist-purity), [Very weak and extremely weak compatible data](#weakened-compatible-data).

**Brauer pairing overlap descent is a supplier proof leaf.** Khare, arXiv math/0504080v1, §3 Proposition 3.1 (inner-product step p. 17), explicitly uses the pairing computation; KW II refers to the Duke §5 version of that argument. The norm-one proof is now spelled out using Mackey, Frobenius reciprocity and overlap Hom characters; the exact λ-independent overlap-character lemma is requested from R17.6. Degree and true restrictions alone do not certify genuineness.

Needed by: [The compatible system through a potentially modular lift, by Brauer induction](#brauer-induction-system).

**Potential modularity outside R23.4's lift types, for the full Dieulefait–Pacetti Theorem 1.11.** R23.4 proves potential modularity only for lifts of type (A), (B) or (C) at p (crystalline or semistable of weight 2 at p = 2). DP Theorem 1.11 also covers odd, irreducible, finitely ramified de Rham lifts of weights {0, k − 1}, k>1, under its residual cyclotomic absolute-irreducibility assumption (and nonsolvable residual image for p=2). Weight-two lifts of DP Theorem 1.9(4) whose type at p is potentially Barsotti–Tate of another inertial type need a potentially Barsotti–Tate modularity lifting theorem over totally real fields, and general de Rham lifts need potential modularity of arbitrary regular de Rham lifts. Neither is planned in R23 or requested here, and DP's citation [Die04, Theorem 1.1] does not supply them (E5). The modern route's consumer ClassicalSerreModularity R33 must use only lifts in the planned scope or obtain these inputs.

Needed by: [Dieulefait: a given lift lies in an almost strictly compatible system (DP Theorem 1.11)](#dieulefait-families).

## Freely readable sources and reading scope

The cited versions are fixed by URL and SHA-256 in the packet. The following locators identify the passages rechecked for this revision on 8 October 2026; the packet retains the earlier reading history. A cited external proof is not treated as read when it is listed among the proof leaves.

- **Chandrashekhar Khare and Jean-Pierre Wintenberger, [Serre's modularity conjecture (II)](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>)**. Author's preprint (proofs.pdf) of the paper published as Invent. Math. 178 (2009), 505–586. Locators give the preprint's page numbers (1–98), which are not the Inventiones pages. Rechecked: §8.1–8.2 pp. 69–72, §9.2–10 pp. 89–94, and bibliography p. 96; statements and the cited proof steps for lifting, finiteness and Brauer families.
- **Chandrashekhar Khare and Jean-Pierre Wintenberger, [Serre's modularity conjecture (I)](<https://www.math.ucla.edu/~shekhar/papers/results.pdf>)**. Author's preprint (results.pdf) of the paper published as Invent. Math. 178 (2009), 485–504. Locators give the preprint's page numbers. Rechecked: §§4–5 pp. 7–11, including the compatibility contracts and Theorems 4.1 and 5.1; §6 Lemma 6.2(ii) p. 11; §8.2 pp. 13–15, §8.4 p. 17, §9.1 p. 19 and §10.1 p. 20.
- **Chandrashekhar Khare and Jean-Pierre Wintenberger, [On Serre's conjecture for 2-dimensional mod p representations of Gal(Q̄/Q)](<https://annals.math.princeton.edu/wp-content/uploads/annals-v169-n1-p05.pdf>)**. Annals of Mathematics 169 (2009), 229–253, published version. Locators give printed pages. Rechecked: Introduction p. 231 and §3.1–3.2 pp. 239–242, including Theorem 3.3, Propositions 3.4–3.5, Lemma 3.6, Theorem 3.7 and the proof of Proposition 3.8.
- **Gebhard Böckle, [Appendix 1: On the isomorphism R_∅ → T_∅](<https://arith-geom.github.io/ag-comp-arith-geom/assets/img/fileadmin/groups/arithgeo/templates/data/Gebhard_Boeckle/KhareAppboeckleNew2.pdf>)**. Appendix to Chandrashekhar Khare, 'On isomorphisms between deformation rings and Hecke rings', Invent. Math. 154 (2003); the author's file. Locators give its own page numbers 1–6. Rechecked: p. 5, Lemma 2 and proof, Corollary 2 and the opening of the proof of Theorem 1; the finite-over-𝒪 hypothesis is checked explicitly.
- **Luis Victor Dieulefait and Ariel Martín Pacetti, [A simplified proof of Serre's conjecture](<https://arxiv.org/pdf/2108.07577v2>)**. arXiv:2108.07577v2, 3 May 2022. Locators give the arXiv version's page numbers. Rechecked: §1.3–1.4 pp. 5–7, and §2 Paso 1 p. 10 and Pasos 5–6 p. 14; actual local nonemptiness and the scope of the cited family theorem.
- **Andrew Snowden, [On two dimensional weight two odd representations of totally real fields](<https://arxiv.org/pdf/0905.4266v1>)**. arXiv:0905.4266v1 (2009). Locators give the arXiv page numbers. Rechecked: §1.4 p. 3, §3.1 (A1)–(A2) p. 6, and §7.1–7.7 pp. 20–23, including the local solution definition, Propositions 7.3.1/7.4.1, Theorems 7.2.1/7.6.1 and Proposition 7.7.1.
- **Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, [Potential automorphy and change of weight](<https://arxiv.org/pdf/1010.2561v1>)**. arXiv:1010.2561v1 (2010), 68 pages; published in Ann. of Math. (2) 179 (2014), 501–609. Page numbers are those of the arXiv v1 PDF (printed page = PDF page). Rechecked: §5.1 pp. 51–53 and Corollary 5.3.2 p. 60; weak-family predicates and the odd-weight Gamma-factor defect.
- **Richard Taylor, [On the meromorphic continuation of degree two L-functions](<https://ems.press/content/book-chapter-files/27484>)**. Documenta Mathematica, Extra Volume: John H. Coates' Sixtieth Birthday (2006), 729–779; EMS Press open-access chapter file. Locators give the printed Documenta pages (printed page = PDF page + 728). Rechecked: §6 pp. 773–774, the weak-family definition, Lemma 6.5 and the statement/opening proof of Theorem 6.6.
- **Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, [Potential automorphy and change of weight](<https://arxiv.org/pdf/1010.2561v4>)**. arXiv:1010.2561v4 (9 December 2013), 93 pages, the last arXiv version before Ann. of Math. (2) 179 (2014), 501–609. Printed page = PDF page. Rechecked: §2.1 p. 31 and Theorem 2.1.1 pp. 33–34; §§5.1–5.3 pp. 62–72; §5.4 Lemma 5.4.5 p. 76 and Proposition 5.4.6 pp. 76–77; §5.5 pp. 77–78; Lemma A.1.5 p. 85 and Appendix A.2 p. 87. External monodromy/density proofs remain the named unread leaves.
- **Christopher Skinner, [A note on the p-adic Galois representations attached to Hilbert modular forms](<https://ems.press/content/serial-article-files/26055?nt=1>)**. Documenta Mathematica 14 (2009), 241–258. Rechecked: Introduction, conventions and Theorem 1 with its proof synopsis, printed pp. 241–243. The complete proof is not claimed as independently verified.
- **Patrick Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor, Jack Thorne, [Potential automorphy over CM fields](<https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf>)**. Annals of Mathematics 197 (2023), 897–1113; published journal-layout copy hosted by Frank Calegari. Rechecked: Published §7.1 pp. 1084–1086 and 1092–1093, the weak variants, rank-one classification and Artin-twist purity observation.
- **Chandrashekhar Khare, [Serre’s modularity conjecture: the level one case](<https://arxiv.org/pdf/math/0504080>)**. Duke Math. J. 134 (2006), no. 3, 557–589; read as arXiv:math/0504080v1 (5 April 2005), where the Brauer construction is §3, Proposition 3.1. KW II cite it as Theorem 5.1 of the Duke version. Rechecked: §3, Proposition 3.1 and the inner-product argument, pp. 16–17 of arXiv math/0504080v1; these are the arXiv locators, not the Duke §5 numbering.
- **Luis V. Dieulefait, [Existence of families of Galois representations and new cases of the Fontaine-Mazur conjecture](<https://arxiv.org/pdf/math/0304433>)**. arXiv:math/0304433v1 (27 April 2003); published in J. reine angew. Math. 577 (2004), 147–151 (not obtained). Rechecked: Theorem 1.1 and the following remark, pp. 1–2 of arXiv math/0304433v1; the odd-prime, small odd crystalline-weight hypotheses. The Crelle version was not obtained.
- **H. P. F. Swinnerton-Dyer, [On ℓ-adic representations and congruences for coefficients of modular forms](<http://gaetan.chenevier.perso.math.cnrs.fr/GT/swinnerton_dyer.pdf>)**. Modular functions of one variable III, Lecture Notes in Mathematics 350 (1973), pp. 1–55; scan of the published chapter (printed page = PDF page). Rechecked: §2 pp. 10–12, 14–15 and §4 pp. 29–33, especially the corollary to Theorem 4 pp. 31–32.

## Version-sensitive source corrections

The five findings below are retained with their independent-review decisions. Assertions are restated in our own words. Their scope is the specific version read, including the limitations on obtaining the version of record.

### E1: misprint

Source: [Serre's modularity conjecture (II)](<https://www.math.ucla.edu/~shekhar/papers/proofs.pdf>), Bibliography, reference [33], p. 96 of the author's preprint proofs.pdf.

**Recorded assertion.** The bibliography places the work on Serre’s modularity conjecture for level one in Duke Math. J., volume 134 (3), year 2006, pages 534–567.

**Correction.** Duke Math. J. 134 (3) (2006), 557–589.

**Check.** Khare's level-one paper occupies pp. 557–589 of Duke Math. J. 134 (2006), no. 3; Dieulefait–Pacetti's bibliography ([Kha06]) gives 557–589, and KW I's own citation of the paper does not conflict with it.

**Correction status.** new: present in the author's preprint; the Inventiones version was not obtained

Correction search: The author's preprint proofs.pdf (the version read); Invent. Math. 178 (2009) 505–586: not obtained.

Additional version check: 2026-10-08: KW II preprint bibliography p.96 compared with the published DP reference 12 p.16; no KW II version-of-record claim.

Independent review: confirmed by `REV-PotentialModularityAndCompatibleSystems--R24.3~2`. Confirmed in KW II author preprint p.96. The published DP bibliography, reference 12 p.16, gives Duke 134(3), 557–589, agreeing with the correction. No claim is made about the unobtained Inventiones KW II text.

### E2: error

Source: [Potential automorphy and change of weight](<https://arxiv.org/pdf/1010.2561v1>), arXiv v1, §5.1, pp. 52–53, the archimedean Γ-factors and the Hodge factor L({H_τ}, s).

**Recorded assertion.** The source gives L({Hτ},s) = √2π^{Σ|h−w/2|} (∏τ ∏h (s − w/2)(s + 1 − w/2) … (s + |h − w/2| − 1 − w/2))^{1/2}. For real v and even n, it specifies L(R|GFv, w, s) = ΓC(s − w/2)^{n/2}.

**Correction.** Use v4's factors: L_v = Γ_ℝ(s − w/2)^{d+}Γ_ℝ(s + 1 − w/2)^{d−}∏_{h<w/2}Γ_ℂ(s − h)/Γ_ℂ(s − w/2) at real v (and the analogue at complex v), with no separate Hodge factor.

**Check.** The product (s − w/2)⋯(s + |h − w/2| − 1 − w/2) has |h − w/2| factors, which is not an integer when w is odd, although v1 states the definition for every pure regular strictly compatible ℛ. For an elliptic curve over ℚ (n = 2, w = 1, H = {0, 1}) v1's real factor is Γ_ℂ(s − 1/2) and no polynomial Hodge factor turns it into the standard Γ_ℂ(s); v4 gives Γ_ℝ(s − 1/2)Γ_ℝ(s + 1/2)Γ_ℂ(s)/Γ_ℂ(s − 1/2) = Γ_ℂ(s). So v1's Corollary 5.3.2(2) (the functional equation of Λ) is not defined for odd-weight systems.

**Correction status.** Corrected in arXiv v4 (9 December 2013), §5.1 pp.63–64, and in published Annals §5.1 p.572.

Correction search: 2026-09-29: arXiv versions v1 and v4 compared; the Annals version was not collated..

Additional version check: 2026-10-08: v1/v4 compared and published Annals DOI 10.4007/annals.2014.179.2.3 PDF p.572 collated.

Independent review: confirmed by `REV-PotentialModularityAndCompatibleSystems--R24.3~2`. Confirmed by comparing arXiv v1 pp.52–53 with v4 pp.63–64 and the published Annals p.572. For w=1 and H={0,1}, a product with |h−w/2| linear factors is undefined as a finite polynomial product; the later Gamma quotients give Γℂ(s) using Γℝ(s)Γℝ(s+1)=Γℂ(s). This checks the normalization without assuming a functional equation.

### E3: misprint

Source: [Potential automorphy and change of weight](<https://arxiv.org/pdf/1010.2561v4>), arXiv v4, §5.2, proofs of Lemma 5.2.1(3) (p. 67) and Proposition 5.2.2 (pp. 69–70); also published Annals §5.2 pp.576,578–580.

**Recorded assertion.** The source identifies −mµ,σ as the σ-Hodge–Tate number attached to (A(n)µ) ◦ (rl mod G0l(Q̄l)). It also gives (γG̃l)(Zl) = γ(G̃l(Zl)) = G̃l(Zl) and the intersection ⋂_{i≠j} ker(Λ′ → VΛ,i).

**Correction.** r_l mod G^der_l(Q̄_l) (the map to C_l = G⁰_l/G^der_l); G̃^sc_l in place of G̃_l; V_{λ,i} in place of V_{Λ,i}.

**Check.** A(n)µ is a character of C_l, which is the quotient by G^der_l (modding out by G⁰_l would leave the finite component group); the argument concerns the simply connected group scheme G̃^sc_l just introduced; V_{λ,i} are the isotypic parts of V_l ⊗ M_λ.

**Correction status.** new: all three slips persist in arXiv v4 and the published Annals text read on 2026-10-08

Correction search: 2026-09-29: arXiv listing for 1010.2561 (v1–v4); a web search for BLGGT errata found none..

Additional version check: 2026-10-08: published Annals PDF, pp.576,578–580; title/errata searches and Annals landing page found no matching correction.

Independent review: confirmed by `REV-PotentialModularityAndCompatibleSystems--R24.3~2`. Confirmed independently in arXiv v4 pp.67,69–70 and the published Annals pp.576,578–580. The character must be evaluated on the quotient by the derived group; the conjugated integral model is the simply connected model; the projection targets are the λ-isotypic spaces. All three are notation slips, not proof gaps.

### E4: error

Source: [Potential automorphy over CM fields](<https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf>), Published journal-layout text §7.1, p.1092, purity observation (Artin-up-to-twist definition p.1086 and extremely weak condition p.1085); also author copy pp.189–190,196–197.

**Recorded assertion.** The source says the assertion also holds when R becomes Artin after a twist.

**Correction.** For extremely weak systems, this implies purity of the good Frobenius eigenvalues. Full purity, including H_{cτ}={w−h:h∈H_τ}, requires the canonical Hodge multisets of the Artin tensor character family (or a very weak realization, which forces those multisets). The roadmap uses this qualified statement.

**Check.** Take F=ℚ(i), and the standard irreducible two-dimensional rational representation of Gal(LF/F)=S₃, where L is the splitting field of X³−2 over ℚ. Its finite-image family has good roots of unity, determinant Hodge weight zero at every λ, and is Artin up to twist with trivial character. Assign H_τ={−1,1} and H_{cτ}={0,0} at the two embeddings of F. Both sums are zero, so all extremely weak conditions hold. The good roots force w=0, but H_{cτ}≠−H_τ. The Artin-up-to-twist definition compares members only and imposes no H-multiset equality. This does not affect the canonical Artin constructor or the subsequent applications to very weak systems.

**Correction status.** new: independently confirmed in the published text; no matching correction located in the recorded searches

Correction search: 2026-10-06: Annals DOI landing page 10.4007/annals.2023.197.3.2; no correction listed there.; 2026-10-06: published journal-layout PDF on Frank Calegari’s research page, §7.1 pp.1085–1086,1092; the observation and definitions agree with the Scholze-hosted author copy.; 2026-10-06: arXiv:1812.09999 submission history (v1 December 2018, v2 June 2022; no subsequent version listed).; 2026-10-06: Calegari’s research listing and searches for the exact title with erratum, purity, and extremely weak Artin; no matching correction found..

Additional version check: 2026-10-08: published §7.1 definitions and purity observation compared; title/erratum/purity search returned no matching correction.

Independent review: confirmed by `REV-PotentialModularityAndCompatibleSystems--R24.3~2`. Confirmed in the published ACC §7.1 pp.1085–1086,1092. Extremely weak data constrain only the sums of the chosen Hodge multisets. The rational S₃ Artin family over ℚ(i) with multisets {−1,1} and {0,0} has those determinant sums and roots of unity but fails weight-zero multiset symmetry. Comparing members up to an Artin twist does not force the missing symmetry. Canonical Artin families and very weak systems retain the intended purity.

### E5: gap

Source: [A simplified proof of Serre's conjecture](<https://arxiv.org/pdf/2108.07577v2>), Theorem 1.11 and its proof, p.7 of arXiv:2108.07577v2; published RACSAM 117 (2023), article 153, p.7, reference 4 p.15.

**Recorded assertion.** Theorem 1.11 takes an odd, irreducible and continuous ρ : GalQ → GL2(Kλ), ramified at only finitely many places, de Rham at p, with Hodge-Tate weights {0, k − 1} and k > 1, with absolutely irreducible residual restriction to G_{ℚ(ζ_p)}; for p = 2 it also assumes nonsolvable residual image. It asserts that ρ belongs to a rank 2 system of Galois representations that is almost strictly compatible. The proof cites [Die04, Theorem 1.1].

**Correction.** The cited theorem does not prove the statement. [Die04, Theorem 1.1] (arXiv math/0304433v1) assumes ρ crystalline at an odd prime q with Hodge–Tate weights {0, w}, w odd, and q ≥ 2w + 1. Within the scope planned here, the family construction uses KW II §10.3.2 (potential modularity of lifts of KW types (A), (B), (C) and the Brauer construction) for the lifts of Theorem 1.9(1)–(3). For Theorem 1.9(4), Snowden supplies weight-two lift existence subject to actual local solutions, but embedding lifts of other potentially Barsotti–Tate types in a compatible family requires potential modularity beyond R23.4; that supplier gap is recorded separately. The general de Rham statement needs potential modularity of arbitrary regular de Rham lifts and should cite it, or be restricted to the lifts used.

**Check.** DP apply Theorem 1.11 in §2 to the minimal crystalline lifts of Theorem 1.9(3), whose weight k ≤ p + 1 can violate q ≥ 2w + 1 (p = 3, k = 4 gives w = 3) or have w = k − 1 even, and to the weight-two lifts of Paso 1, whose crystallinity at the coefficient prime is not guaranteed. Neither class is within [Die04, Theorem 1.1].

**Correction status.** new: citation gap persists in the published RACSAM text read on 2026-10-08

Correction search: 2026-10-06: arXiv:2108.07577 versions v1 (17 August 2021) and v2 (3 May 2022); the authors' copy at sweet.ua.pt/apacetti/papers/Serre.pdf (1 May 2022), which agrees with v2 here; 2026-10-06: the RACSAM landing page (doi 10.1007/s13398-023-01478-8); the publisher returned a client challenge, so the published text was not read; 2026-10-06: arXiv:math/0304433 (only v1 exists) for [Die04]; the Crelle 577 (2004) text was not obtained; 2026-10-06: web searches for an erratum or correction of the paper; none found.

Additional version check: 2026-10-08: publisher HTML/PDF and University of Barcelona repository version of record (doi 10.1007/s13398-023-01478-8), Theorem 1.11 p.7 and reference 4 p.15; theorem and citation are unchanged. Title/erratum search found no matching correction.

Independent review: confirmed by `REV-PotentialModularityAndCompatibleSystems--R24.3~2`. Confirmed in arXiv v2 p.7 and now in the published RACSAM 117:153 Theorem 1.11 and proof, p.7. The published proof still cites reference 4, Dieulefait 2004 Theorem 1.1. The arXiv version of that cited theorem, pp.1–2, assumes an odd coefficient prime, crystallinity, odd positive weight difference w and q≥2w+1, so it does not justify the stated arbitrary regular de Rham input. The Crelle text itself remains unread; this is a citation-scope gap, not a counterexample to the family theorem.

## Second independent review source receipts

Reviewed on 8 October 2026 by Codex `codex-OPHCdW`. The fourteen cited source files were fetched again and their hashes match the packet. The detailed passages read in this review are recorded in each source’s `readSections`; imported proof interiors and the seven recorded gaps remain explicit.

Two additional versions of record were collated:

- [BLGGT, published Annals PDF](<https://annals.math.princeton.edu/wp-content/uploads/annals-v179-n2-p03-p.pdf>): §5.1 p.572 and §5.2 pp.576,578–580, for E2 and E3; SHA-256 `c9d6c7107bcde7fb26f9388abea5209f28457076bae59d70ccb6c34bbe1d621b`.
- [Dieulefait–Pacetti, published RACSAM PDF](<https://diposit.ub.edu/bitstreams/2e30a20d-5dd2-48e5-a27e-28c3f5fc241e/download>): Theorem 1.11 p.7 and references 4/12 pp.15–16, for E1 and E5; SHA-256 `2a133808911a1819ea9480bea0bfc18846035f961e866ddec4d05d69b093e0f8`.

The residual-weight formula now requires a positive weight difference and an S-type residual member. Equal-weight unramified Artin members use the Serre-weight-ℓ branch. The R22 and R19 imports bind their currently available full planned exports and normalization dictionary. Two Lean examples that tested only artificial finite-slot logic are omitted under their planned names.
