# Compatible systems and changing residual characteristic

This document specifies the common compatible-system language, its operations and
purity tools, the rank-two construction from a supplied potential-modularity
witness, and the residual-characteristic adapters. Its layers are
R24.5:operations, R24.5 and R24.6. The common language precedes eigenform and
potential-modularity existence: those theorems construct objects of this language.
The arithmetic theorem owners supply representations, local comparison and
modularity lifting; this document assembles their outputs into families.

The target identifiers below refer to the existing definitions and theorems in
[the R24.3 packet](../packets/PotentialModularityAndCompatibleSystems--R24.3.json).
They have a single owner. The [dedicated packet](../packets/PotentialModularityAndCompatibleSystems--R24.5.json)
records the import contracts for this document. Every definition and construction
has its usable API and tests stated here. The document is definitive; the
[suggested file](../suggested/PotentialModularityAndCompatibleSystems--R24.5.lean)
contains only statements expressible over the pinned libraries. No arithmetic
construction is claimed implemented.

## Conventions and imports

Let F be the base number field and M the coefficient number field. A finite place
λ of M has residue characteristic ℓ. A member is an actual continuous
semisimple representation on a finite-dimensional space over an algebraic
closure of M_λ, with every coefficient embedding included in the compatibility
quantifiers. Enlarge M finitely when a construction requires it. Recognition
identifies members up to isomorphism; it does not supply a basis or canonical
integral lattice. A residual member is the semisimplified reduction of a stable
lattice, with lattice independence supplied by R01.1.

The rank-n BLGGT convention uses geometric Frobenius. The cyclotomic character
ε has Hodge–Tate weight −1 and Q_p(X)=X−p⁻¹, so its pure weight is −2.
KW's arithmetic convention assigns ε weight +1. Use the R19.2 normalization
dictionary for the actual dual and twist, rather than changing one sign in
isolation. For a weight-k classical form the cohomological member M_f has
geometric polynomial X²−a_pX+ψ(p)p^(k−1), H={0,k−1} and weight k−1;
the arithmetic Deligne member is M_f∨. For general Hilbert forms the geometric
Hodge degrees in the R19 carrier are (w−k_τ+2)/2 and (w+k_τ)/2 and its weight
is w+1. Carayol's representation requires the supplier's character twist as
well as the Frobenius convention comparison.

A Frobenius-semisimple WD parameter retains its monodromy N. Full
semisimplification would erase information needed at a Steinberg place.
“Unramified WD” means trivial inertia **and N=0**. A de Rham representation is
crystalline precisely when its WD parameter has both properties; neither
trivial inertia alone nor a condition on traces suffices.

Purity means |ι(α)|²=q_v^w under every complex embedding for good roots, together
with the labeled Hodge symmetry H_(cτ)=w−H_τ. Strict purity additionally requires
local monodromy-weight purity, including ramified places. Geometric and
arithmetic weights are transported through duality and twists explicitly.

| Input | Exact owner and use |
| --- | --- |
| Continuous actions, coefficient extension and stable-lattice reduction | R01.1, especially refined-continuity-interface, refined-scalar-extension-interface and refined-induction-interface |
| Local WD and conductor | R01.2 and R01.3; Frobenius semisimplification retains N |
| Recognition and coefficient descent | R01.5; the general semisimple split-eigenvalue criterion of BLGGT Lemma A.1.5 remains requested |
| Labeled Hodge data and local descent | R06.2 and R06.3/plan/weil-deligne-parameter, R06.3/plan/weil-deligne-descent |
| Polarization, monodromy groups and Sen input | ArithmeticGaloisRepresentations G7, with R06.2 supplying the Hodge comparison |
| Finite reciprocity/Mackey/Brauer theory | Existing InductionRestriction Layers 2–3 and 6; arithmetic use does not reconstruct the finite theory |
| Algebraic character carriers | Existing GlobalNumberFields Layers 9–10 and ClassFieldTheory global reciprocity; the algebraic ℓ-adic realization/converse is the specified Class field theory Part II extension |
| Hilbert families and normalization | R19.2/all-cohomological-hilbert-representation, hilbert-normalisation-dictionary and hilbert-uniqueness-determinant-oddness-irreducibility; R19.3/fixed-eigenform-compatible-family |
| All-place Hilbert WD comparisons | R19.4/all-hilbert-local-global-compatibility and R19.5/skinner-full-hilbert-coefficient-prime |
| Solvable descent | R17.4/solvable-base-change, solvable-descent and tower-independence; R17.6 compatible-descent does not alone give the Brauer overlap Hom-character lemma |
| Purity | R34.6 geometric eigenform owner and the exact R19.3/monodromy-weight-purity-of-the-family general Hilbert input, with their respective hypotheses |
| Transfer | R24.4 imports classical KW lifting; R32.6 owns modern reducible/dyadic lifting |

The pinned baseline is Mathlib 082e2d37e8b0463410cdb532e111cd43d5a66174 and
Tau Ceti f790474821cf4256814db967cb154e7af3d0c369. Mathlib Representation is
algebraic, IsSemisimpleRepresentation means complemented subrepresentations,
and IsIrreducible means a simple subrepresentation order. ContRepresentation
alone makes each operator continuous; it does not assert continuity in the
group variable. The actual Krull-topological Field.absoluteGaloisGroup,
NumberField.FinitePlace and its completion embedding, LinearMap.charpoly,
algebraic induction/duality and the real/complex Gamma factors are reused.
The suggested examples use the actual Matrix.charpoly, Matrix.det and ZMod.

## R24.5:operations — common families before existence

The following definitions have no eigenform or potential-automorphy existence
hypothesis. Recognition, linear algebra, character realization and local Hodge
comparison are their imported interfaces. The coefficient-field extension is
finite; it is not an infinite collection of unrelated local coefficient fields.


### Rank-n weakly compatible systems of l-adic representations

**Target:** R24.5/weakly-compatible-system-rank-n. **Kind:** definition.

Fix number fields F and M and a rank n. The family data consist of a finite exceptional set S of finite places of F, monic degree-n polynomials Q_v in M[X] for v outside S, a continuous semisimple member r_λ : G_F → GL_n(M̄_λ) for each finite place λ of M, and an n-element multiset H_τ of integers for each embedding τ : F ↪ M̄. For λ of residue characteristic ℓ, every v outside S and not dividing ℓ is unramified for r_λ, and its geometric Frobenius characteristic polynomial is the image of Q_v under M ↪ M̄_λ. At each v dividing ℓ, the local member is de Rham and is crystalline when v is outside S. For every coefficient embedding M̄ ↪ M̄_λ extending λ, the labeled Hodge–Tate multiset at the induced embedding of F is H_τ. These comparisons, together with the actual members, define a weakly compatible system. Rank one gives character systems. Taylor's rank-d contract over ℚ (Documenta 2006, §6, p. 773) asks for Hodge–Tate members of fixed weights at every λ and crystallinity when ℓ is outside S; it does not separately require de Rham behavior at exceptional coefficient primes. The rank-two KW carrier stores local WD parameters at every finite place. Its comparison with this carrier requires the additional all-member de Rham/Hodge and outside-S crystalline conditions recorded in compatible-system-predicates.

**Hypotheses and scope.**

- M-rationality of Frobenius polynomials and independence of the Hodge–Tate multisets are part of the data, not theorems

**Construction or proof.**

- Assemble the five-tuple from actual continuous semisimple members supplied by R01.1. The defining axioms include common good-place characteristic polynomials and coefficient-place de Rham/crystalline and Hodge conditions.
- This carrier has no eigenform, potential-modularity or potential-automorphy prerequisite. The eigenform construction is an R19.3 instance importing this definition.

**Required contracts.** ArithmeticGaloisRepresentations:R01.1/refined-continuity-interface, ArithmeticGaloisRepresentations:R01.1/refined-scalar-extension-interface, ArithmeticGaloisRepresentations:R01.5, PadicHodgeTheory:R06.2, PadicHodgeTheory:R06.3/plan/weil-deligne-parameter, mathlib:Representation, mathlib:Field.absoluteGaloisGroup, mathlib:LinearMap.charpoly, mathlib:NumberField.FinitePlace, mathlib:NumberField.FinitePlace.embedding.

**Checks.**

- The early definition is independent of every eigenform and existence theorem. R19.3 constructs instances by importing it.
- Use geometric Frobenius and Hodge–Tate weight −1 for the cyclotomic character in the BLGGT carrier. The KW arithmetic carrier uses weight +1; the R19.2 normalization dictionary provides the dual/twist comparison.
- For the cohomological Δ realization Q₂=X²+24X+2048, H={0,11}, weight 11. Its arithmetic Deligne dual has that arithmetic polynomial; its geometric weight is −11.
- De Rham at every coefficient place and crystalline outside S are defining BLGGT conditions. Taylor’s exceptional coefficient primes require only Hodge–Tate members.

**API.**

- **TauCeti.CompatibleSystems.WeaklyCompatibleSystem** (structure): (M, S, Q_v, r_λ, H_τ) with the compatibility conditions.

- **TauCeti.CompatibleSystems.WeaklyCompatibleSystem.rank** (projection): The rank n.

- **TauCeti.CompatibleSystems.WeaklyCompatibleSystem.charpoly_frob** (characterisation): For v ∉ S, v ∤ l: r_λ unramified at v with charpoly r_λ(Frob_v) = Q_v.

- **TauCeti.CompatibleSystems.WeaklyCompatibleSystem.deRham** (characterisation): r_λ|_{G_{F_v}} de Rham for v | l, crystalline for v ∉ S.

- **TauCeti.CompatibleSystems.WeaklyCompatibleSystem.ofCompatibleSystem** (coercion): Convert a rank-two KW system only with additional hypotheses: every coefficient member is de Rham of the common weights at every place above ℓ and crystalline outside an enlarged fixed finite S. Plain or almost strict compatibility alone does not imply these.

- **TauCeti.CompatibleSystems.WeaklyCompatibleSystem.enlargeRamificationSet** (functoriality): For finite S⊆S′, keep every r_λ and H_τ, restrict Q_v to v∉S′, obtaining a weakly compatible system.


**Unit tests.**

- **wcs_cyclotomic** (computation): With geometric Frobenius and HT(ε_ℓ)=−1, ε has rank 1, S=∅, Q_p(X)=X−p⁻¹, H={−1} and weight −2. X−p would be the arithmetic-Frobenius polynomial.

- **wcs_newform_delta** (computation): Use the cohomological member of the Δ family in BLGGT convention: rank 2, H={0,11}, Q_p(X)=X²−τ(p)X+p¹¹; Q₂=X²+24X+2048. The KW arithmetic member is its contragredient, with their HT(ε)=+1 convention.

- **wcs_not_just_traces** (non-example): Two systems with the same Q_v are isomorphic member by member only up to conjugation; the carrier stores the r_λ themselves.

- **wcs_S_enlarge** (compatibility): Enlarging S preserves all actual representations and Hodge data and restricts Q to fewer good places. It gives the same memberwise family, not literal equality of the five-tuples with different S.


**Acceptance.**

- Frobenius-polynomial recognition (ArithmeticGaloisRepresentations R01.5) identifies each r_λ only up to isomorphism: it gives no canonical basis or lattice.
- Check the comparison with KW systems only when the additional de Rham/crystalline hypotheses hold; the strict systems constructed below satisfy them after enlarging S.

**Uses.** PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates: the predicates are properties of this carrier; PotentialModularityAndCompatibleSystems:R24.5/linear-algebra-operations-on-systems: the operations act on it; AutomorphicGaloisRepresentations:R19.3: the eigenform family instance; AutomorphicGaloisRepresentationsPartII:AG2.6: the higher-rank instances.

**Sources.** taylor-2006-meromorphic-continuation, §6, rank d weakly compatible systems over ℚ, p. 773 (PDF page 45): Taylor's version over ℚ with Hodge numbers; blggt-2014-v4, §5.1, pp.62–63 of arXiv v4; published pp.570–571: The rank-n family includes actual members and all coefficient-place de Rham conditions.


### Predicates on weakly compatible systems: regular, strictly compatible, pure, self-dual, irreducible, automorphic

**Target:** R24.5/compatible-system-predicates. **Kind:** definition.

For ℛ = (M, S, {Q_v}, {r_λ}, {H_τ}) of rank n over F: ℛ is regular if every H_τ has distinct elements; extremely regular if moreover some H_τ has no two distinct sub-multisets of equal size and equal sum; (n = 1, F totally real) totally odd if r_λ(c_v) = −1 for all infinite v; (F CM or totally real) (ℛ, ℳ) is essentially conjugate self-dual for a character system ℳ of G_{F⁺} if every (r_λ, μ_λ) is, and its totally odd version requires the actual polarization convention of polarized-system at every λ; irreducible if r_λ is irreducible for all λ above a set of rational primes of Dirichlet density 1; strictly compatible if for each finite v there is a Weil–Deligne representation WD_v(ℛ) over M̄ with ς WD_v(ℛ) ≅ WD(r_λ|_{G_{F_v}})^{F-ss} for λ not above the residue characteristic of v; pure of weight w if every root α of Q_v (v ∉ S) has |ια|² = (#k(v))^w and H_{cτ} = {w − h : h ∈ H_τ}; strictly pure if strictly compatible with each WD_v(ℛ) pure of weight w and H_{cτ} = {w − h : h ∈ H_τ}; automorphic if there is a regular algebraic cuspidal π of GL_n(𝔸_F) with rec(π_v|det|_v^{(1−n)/2})(Frob_v) of characteristic polynomial ι(Q_v) for v ∉ S. Over ℚ, Taylor's 'strongly compatible' is 'strictly compatible', and his rank-2 'regular' means distinct Hodge numbers and det ρ_λ(c) = −1. BLGGT strict compatibility here compares only λ away from the residue characteristic of v; it is weaker than KW all-place strictness. Strict purity includes local monodromy-weight purity at all v, not just good Frobenius absolute values. The totally-real pair convention is obtained from §2.1; the explicit §5.1 system definition is stated for CM F. Automorphic and irreducible predicates do not assert their preservation under every operation.

**Hypotheses and scope.**

- these are predicates with their own preservation hypotheses (R24.5/linear-algebra-operations-on-systems), not fields of the carrier
- the rank-2 'strict' and 'almost strict' of R24.5/compatible-system are Khare–Wintenberger's local predicates at 𝔮 | ℓ; BLGGT's 'strictly compatible' asks WD_v(ℛ) only at λ ∤ residue characteristic of v; keep all of them separate
- the partial and completed L-functions, ε-factors and Γ-factors of a system (BLGGT pp. 52–53) are planned separately in R24.5/system-l-functions

**Construction or proof.**

- Definitions; independence of choices: det r_λ(c_v) = ±1 is independent of λ, and by purity n odd with v real forces w even (BLGGT v4 p.63, published p.572).

**Required contracts.** PotentialModularityAndCompatibleSystems:R24.5/weakly-compatible-system-rank-n, PadicHodgeTheory:R06.3/plan/weil-deligne-parameter, ArithmeticGaloisRepresentations:G7, PotentialModularityAndCompatibleSystems:R24.5/polarized-system.

**Checks.**

- Extremely regular means regular plus uniqueness of subset sums at equal cardinality for at least one embedding. For {0,1,2,3}, the two pairs {0,3} and {1,2} show failure.
- Purity includes both all-embedding good Frobenius absolute values and H_{cτ}=w−H_τ. Strict purity adds full local monodromy weight; good absolute values alone do not replace it.
- BLGGT strictness compares away from the coefficient characteristic. It is not the all-place KW strict predicate.
- Essential conjugate self-duality is an isomorphism condition. Actual pairings and total oddness are specified by the polarized-system target and G7; do not manufacture total oddness from an unspecified self-duality witness.

**API.**

- **TauCeti.CompatibleSystems.WeaklyCompatibleSystem.IsRegular** (data): Distinct Hodge–Tate numbers for every τ.

- **TauCeti.CompatibleSystems.WeaklyCompatibleSystem.IsExtremelyRegular** (data): Regular, and some H_τ has no distinct equal-cardinality submultisets with the same sum.

- **TauCeti.CompatibleSystems.WeaklyCompatibleSystem.IsStrictlyCompatible** (data): A Weil–Deligne representation WD_v(ℛ) matching every r_λ at v, λ ∤ residue characteristic of v.

- **TauCeti.CompatibleSystems.WeaklyCompatibleSystem.IsPure** (data): Weight-w purity of the Q_v and the symmetry H_{cτ} = w − H_τ.

- **TauCeti.CompatibleSystems.WeaklyCompatibleSystem.IsEssentiallySelfDual** (data): Essential conjugate self-duality with a character system of G_{F⁺}, and its totally odd version.

- **TauCeti.CompatibleSystems.WeaklyCompatibleSystem.IsIrreducible** (data): Irreducible for λ above a density-one set of primes.

- **TauCeti.CompatibleSystems.WeaklyCompatibleSystem.IsAutomorphic** (data): Frobenius polynomials of a regular algebraic cuspidal π.


**Unit tests.**

- **pred_newform** (compatibility): The cohomological realization M_f of a weight-k newform, k≥2, is regular with geometric pure weight k−1. Its arithmetic Deligne dual has geometric weight 1−k; the common arithmetic polynomial must not be assigned weight k−1 in the geometric carrier.

- **pred_regular_fails** (non-example): ε ⊕ ε is not regular (H = {−1, −1}).

- **pred_odd_purity** (characterisation): For n odd and v real, purity forces w even (BLGGT v4 p.63, published p.572).

- **pred_strict_vs_almost_strict** (non-example): BLGGT strict compatibility compares only λ∤v. For a weakly compatible family, KW almost strictness supplies these comparisons but omits some comparisons at v|ℓ. Check the missing obligation without asserting the existence of an arithmetic family that violates all-place strictness.


**Acceptance.**

- Check that a newform of weight k gives a strictly pure, regular, irreducible (Ribet), automorphic rank-2 system of weight k − 1.
- Check that 'irreducible' is a density-one condition: for rank 2 over ℚ it is equivalent to irreducibility at one λ (R24.5/rank-two-reducibility-independent-of-lambda).

**Uses.** PotentialModularityAndCompatibleSystems:R24.5/linear-algebra-operations-on-systems: which predicates each operation preserves; PotentialModularityAndCompatibleSystems:R24.5/rank-two-reducibility-independent-of-lambda: the notion of an irreducible rank-2 system over ℚ; AutomorphicGaloisRepresentations:R19.3/strict-compatibility-and-the-monodromy-weight-purity: the requested carrier with its local predicates.

**Sources.** taylor-2006-meromorphic-continuation, §6, Taylor's remark on motives, p. 773 (PDF page 45): Strong compatibility and rank-2 regularity over ℚ; blggt-2014-v4, §5.1, pp.62–63 of arXiv v4; published pp.570–571: The predicates distinguish regularity, density-one irreducibility, away-coefficient strictness and both purity clauses.


### Very weak and extremely weak compatible data

**Target:** R24.5/weakened-compatible-data. **Kind:** definition.

Use the same number-field, finite ramification set, semisimple continuous members and common monic good Frobenius polynomials as a weakly compatible system. Extremely weak data retain only HT_τ(det r_λ)=Σ H_τ at every λ, with no full-member Hodge or de Rham condition. Very weak data additionally require the members to be crystalline at all places above ℓ and have H_τ for ℓ outside a Dirichlet-density-zero set. A weak system is very weak and a very weak system is extremely weak; the converse implications are not part of the definition. For rank one the determinant condition is the full Hodge condition and algebraic-character classification recovers weak compatibility. In higher rank extremely weak H is constrained only by its sum; induction and Artin-twist purity below therefore specify canonical Hodge metadata.

**Construction or proof.**

- Separate the determinant Hodge comparison from the full-member condition.
- The forgetful maps preserve actual members, Q, S and H; record their density and determinant obligations independently.

**Required contracts.** PotentialModularityAndCompatibleSystems:R24.5/weakly-compatible-system-rank-n, ArithmeticGaloisRepresentations:R01.1/refined-continuity-interface, ArithmeticGaloisRepresentations:R01.1/refined-scalar-extension-interface, PadicHodgeTheory:R06.2.

**Checks.**

- Extremely weak H metadata have only their sums fixed by the determinant. {0,2} and {1,1} have the same sum but different regularity.
- For a finite S₃ Artin family over ℚ(i), H_τ={−1,1} and H_{cτ}={0,0} have determinant sums zero but violate weight-zero Hodge symmetry. This is not the canonical Artin constructor.
- Weak implies very weak implies extremely weak. Rank-one classification recovers weak compatibility; no unrestricted converse is claimed in higher rank.

**API.**

- **TauCeti.CompatibleSystems.ExtremelyWeaklyCompatibleSystem** (structure): The common Q, members and H with determinant-Hodge condition only.

- **TauCeti.CompatibleSystems.VeryWeaklyCompatibleSystem** (structure): Extremely weak data with density-one crystallinity and full labeled Hodge comparisons.

- **TauCeti.CompatibleSystems.WeaklyCompatibleSystem.toVeryWeak** (functoriality): Forget the all-λ de Rham/full Hodge requirement to the density-one one.

- **TauCeti.CompatibleSystems.VeryWeaklyCompatibleSystem.toExtremelyWeak** (functoriality): Forget the density-one full-member condition, retaining determinant Hodge comparison.

- **TauCeti.CompatibleSystems.ExtremelyWeaklyCompatibleSystem.hodgeSum** (compatibility): At every λ, the determinant labeled Hodge number equals Σ H_τ.


**Unit tests.**

- **weakening_rank_one** (characterisation): A rank-one H_τ={a} is determined by its determinant Hodge sum a.

- **weakening_higher_rank_metadata** (non-example): Rank-two H={0,2} and H′={1,1} have the same determinant sum 2; the determinant condition distinguishes neither the Hodge multiset itself nor regularity.

- **weakening_hodge_purity_not_sum** (non-example): For a rank-two weight-zero Artin family, H_τ={−1,1}, H_cτ={0,0} have both determinant sums zero, but H_cτ≠−H_τ; arbitrary extremely weak metadata do not imply Hodge purity.

- **weakening_transitive** (compatibility): The composite weak→very weak→extremely weak map preserves each r_λ, Q_v and H_τ.


**Acceptance.**

- The distinction is an interface weakening, never a replacement of the BLGGT weak carrier.

**Uses.** ACC+ §7.1, Lemma 7.1.1 and Theorem 7.1.11: a reducible rank-two extremely weak system splits into weakly compatible character systems; the main potential automorphy theorem takes very weakly compatible systems with H_τ = {0, 1}; PotentialModularityAndCompatibleSystems:R24.5/rank-one-purity: rank-one extremely weak data are weakly compatible character systems; PotentialModularityAndCompatibleSystems:R24.5/artin-twist-purity: Artin-up-to-twist purity needs the canonical Hodge metadata (E4); PotentialModularityAndCompatibleSystems:R24.5/induced-character-purity: induced purity uses the transported character Hodge data.

**Sources.** acc-2023, §7.1, pp.1084–1085: Definitions of very weak and extremely weak systems, including the determinant condition and density-one full-member condition.


### Compatible systems: strict, almost strict, and plain

**Target:** R24.5/compatible-system. **Kind:** definition.

For number fields F and E, the two-dimensional E-rational family stores continuous semisimple members ρ_ι of G_F for every prime ℓ and embedding ι:E↪Q̄_ℓ, Frobenius-semisimple WD data r_q over E for every finite q (unramified for almost all q), and integers a≥b. Plain compatibility requires WD comparison at q∤ℓ and crystallinity with Hodge–Tate numbers (a,b) at coefficient places for sufficiently large ℓ. KW strict compatibility requires every member to be geometric of these Hodge–Tate numbers and WD(ρ_ι|D_q)^Fss≅ιr_q at every q, including q|ℓ via Fontaine. An almost strictly compatible system is a plain compatible system (so in particular crystalline of weights (a,b) at coefficient places for ℓ ≫ 0) that satisfies in addition, at q above the coefficient prime, only these clauses: if the semisimplified residual member is irreducible, it is geometric of weights (a,b) with full WD comparison; if ℓ≠2 and r_q is unramified, the local member is crystalline of these weights. Regularity is a≠b. No all-member de Rham condition is imposed on a plain or almost-strict carrier. Dieulefait–Pacetti Definition 1.10 uses a rank-two five-tuple; compare it after matching coefficient embeddings and both normalizations. Its almost strict systems also require every member to be de Rham at its coefficient prime (condition (4)), which KW's almost-strict definition does not.

**Hypotheses and scope.**

- the local predicates (strict, almost strict, plain) are kept separate; almost strictness gives no Weil–Deligne information at 𝔮 | ℓ when ρ̄_ι is reducible and r_𝔮 is ramified
- rank 2 here; the general rank-n and polarised versions are the operations sub-layer's generalisation

**Construction or proof.**

- Definitions only; the existence theorems are R24.5.

**Required contracts.** PadicHodgeTheory:R06.3/plan/weil-deligne-parameter, ArithmeticGaloisRepresentations:R01.2, ArithmeticGaloisRepresentations:R01.5, ArithmeticGaloisRepresentations:R01.1/refined-continuity-interface, ArithmeticGaloisRepresentations:R01.1/refined-scalar-extension-interface, mathlib:Representation, mathlib:Field.absoluteGaloisGroup.

**Checks.**

- Use isomorphism classes of actual members, with coefficient embeddings quantified universally. Common traces are not a family constructor.
- Unramified WD means trivial inertia and N=0. A parameter with trivial inertia and nonzero N is the semistable Steinberg case.
- KW plain/almost strict, DP almost strict, and BLGGT weak are distinct contracts. In particular no de Rham condition may be inferred at an omitted KW coefficient prime.

**API.**

- **TauCeti.CompatibleSystems.CompatibleSystem** (structure): E, the family ρ_ι, the Weil–Deligne data r_𝔮 and the weights (a, b)

- **TauCeti.CompatibleSystems.CompatibleSystem.IsStrict** (data): compatibility with r_𝔮 at every 𝔮, including 𝔮 above ℓ

- **TauCeti.CompatibleSystems.CompatibleSystem.IsAlmostStrict** (data): the two conditions at 𝔮 | ℓ (irreducible residual, or ℓ ≠ 2 and r_𝔮 unramified)

- **TauCeti.CompatibleSystems.CompatibleSystem.IsRegular** (data): a ≠ b

- **TauCeti.CompatibleSystems.CompatibleSystem.IsStrict.isAlmostStrict** (relation): strict ⇒ almost strict ⇒ compatible

- **TauCeti.CompatibleSystems.CompatibleSystem.enlargeCoefficients** (functoriality): Extend E to a finite number-field extension E′ and reindex embeddings; preserve the same members and local data after extension. Eigenform constructors are imported from R19.3 and are not defined here.


**Unit tests.**

- **newform_is_strict** (compatibility): Import the Δ eigenform family from R19.3: weights (11,0), regular and strict after the complete coefficient-prime theorem from R19.5.

- **weight_one_irregular** (degenerate): a weight-one newform gives an irregular system, a = b = 0

- **almost_strict_not_strict** (non-example): The almost-strict contract permits no WD conclusion at q=ℓ with reducible residual member and ramified r_q. This is a logical nonimplication of the contract, not a claim that the particular geometrically constructed systems fail strictness.

- **hodge_tate_weights_convention** (compatibility): weight a + 1 when b = 0: a newform of weight k gives (a, b) = (k − 1, 0)


**Acceptance.**

- Check that a newform of weight k ≥ 2 gives a strictly compatible system (Deligne, Carayol, Saito)
- Compare the definition obligations: almost strictness omits the q=ℓ WD comparison when the residual member is reducible and the parameter ramified. This does not exhibit an actual arithmetic family failing strictness.

**Uses.** PotentialModularityAndCompatibleSystems:R24.5/brauer-induction-system: the object constructed; PotentialModularityAndCompatibleSystems:R24.6/residual-members: change of residual characteristic; ClassicalSerreModularity:R33.1/paso-1-weight-two-system: the systems propagated in the modern route; ClassicalSerreModularity:R27.3/theorem-3-1-killing-ramification: the systems of KW I.

**Sources.** kw-serre-modularity-I, §5, p. 7 of the preprint: Strict compatibility; kw-serre-modularity-I, §5, p. 8 of the preprint: Almost strict compatibility; dieulefait-pacetti, Definition 1.10 and after, p. 7 of the arXiv version: DP's version.


### Linear-algebra operations on weakly compatible systems and what they preserve

**Target:** R24.5/linear-algebra-operations-on-systems. **Kind:** construction.

Construct direct sum, tensor, dual, symmetric and exterior powers of weakly compatible systems over a common coefficient field, with semisimplification of the algebraic output where needed. At good v, sums multiply Q polynomials; tensor roots are α_iβ_j; the dual polynomial is XⁿQ_v(0)⁻¹Q_v(X⁻¹); Sym^k and ∧^k roots are the appropriate repeated/distinct k-fold products. Hodge multisets follow the corresponding sums, negatives and k-fold sums. These operations, restriction and induction preserve weak compatibility and away-coefficient strict compatibility after the stated enlargement of S. Pure direct sums require equal weights; tensor weights add, dual weight negates, Sym^k/∧^k weight is kw; restrictions and induction preserve weight with their canonical Hodge data. Strict purity uses the local WD preservation results. Regularity survives duality/restriction; sums, tensors, symmetric powers of rank>2, exterior powers and induction can have Hodge collisions. Irreducibility survives duality, not arbitrary sums/tensors/restriction/induction. No unconditional cuspidal automorphy claim is made for any operation, including solvable base change when it becomes noncuspidal.

**Hypotheses and scope.**

- weak compatibility of each operation uses only that de Rham, crystalline and Hodge–Tate data are preserved by the corresponding operations on representations (PadicHodgeTheory R06.3) and that characteristic polynomials of ⊗, ∨, Sym, ∧ and induced representations are determined by those of the factors
- extends R24.5/system-operations (twists, restriction, induction at rank n) by the linear-algebra operations; automorphy statements are recorded only where a source theorem supplies them

**Construction or proof.**

- Apply the operation member by member; compute Frobenius polynomials from Q_v (resultant-type formulas for ⊗, Sym, ∧; X^nQ_v(0)^{−1}Q_v(X^{−1}) for the dual; roots raised to the residue degree for restriction).
- Strict compatibility: Weil–Deligne representations commute with each operation, and Frobenius-semisimplification with ⊗.
- Counterexamples to preservation: (1 ⊕ ε) ⊗ (1 ⊕ ε^{−1}) contains 1 ⊕ 1 and is not regular although both factors are; restriction of an irreducible system induced from K to G_K is reducible.

**Required contracts.** PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates, PotentialModularityAndCompatibleSystems:R24.5/system-operations, PadicHodgeTheory:R06.3/plan/weil-deligne-parameter, ArithmeticGaloisRepresentations:R01.5, ArithmeticGaloisRepresentations:G7, PotentialModularityAndCompatibleSystems:R24.5/weakly-compatible-system-rank-n, PadicHodgeTheory:R06.2.

**Checks.**

- The normalized dual polynomial is X^n Q(0)⁻¹Q(X⁻¹); for roots 2,3 it is X²−(5/6)X+1/6. GL-valued members ensure Q(0)≠0.
- With {0,1} and {0,−1} the tensor multiset is {0,−1,1,0}; each input is regular but the tensor is not.
- Symmetric powers of regular rank two are regular: their Hodge numbers are kh₁+j(h₂−h₁), 0≤j≤k, with nonzero increment. In larger rank collisions occur.
- Duality preserves irreducibility; restriction and induction need new irreducibility checks. Solvable base change can be noncuspidal, so no universal automorphy-preservation assertion is attached.

**API.**

- **TauCeti.CompatibleSystems.directSum** (constructor): Members r⊕s; Q_v=Q_r Q_s; H disjoint union; common pure weight required for purity.

- **TauCeti.CompatibleSystems.tensor** (constructor): Members (r⊗s)^ss; roots αβ; H all pairwise sums; pure weight w+w′.

- **TauCeti.CompatibleSystems.dual** (constructor): Members r∨; normalized reciprocal Q_v; H=−H; pure weight −w.

- **TauCeti.CompatibleSystems.symmetricPower** (constructor): Sym^k members and repeated k-fold weight sums; rank binomial(n+k−1,k).

- **TauCeti.CompatibleSystems.exteriorPower** (constructor): ∧^k members and distinct k-fold weight sums; rank binomial(n,k), zero if k>n.

- **TauCeti.CompatibleSystems.dual_charpoly** (compatibility): The normalized reciprocal polynomial is monic of rank n; for rank 2, X²−aX+b becomes X²−(a/b)X+1/b.

- **TauCeti.CompatibleSystems.directSum_pure** (relation): Pure systems of the same weight w have pure direct sum of weight w; differing weights invalidate the conclusion.


**Unit tests.**

- **dual_rank_two** (computation): X²−aX+b with b≠0 becomes X²−(a/b)X+1/b.

- **sym2_distinct** (computation): For h₁≠h₂, {2h₁,h₁+h₂,2h₂} is distinct, so Sym² of regular rank two stays regular.

- **tensor_collision** (non-example): H={0,1} and H′={0,−1} give tensor H={0,−1,1,0}, which is not regular.

- **direct_sum_mixed_weights** (non-example): 1⊕ε has geometric-Frobenius roots 1,p⁻¹ and weights 0,−2, so is not pure of one weight.

- **exterior_above_rank** (degenerate): ∧³ of a rank-two system is the rank-zero system with Q_v=1 and H empty.


**Acceptance.**

- Check the dual's Frobenius polynomial in rank 2: X² − aX + b ↦ X² − (a/b)X + 1/b.
- Check that H_τ(Sym² ℛ) = {2h₁, h₁ + h₂, 2h₂} and that regularity can fail for Sym² when h₁ + h₂ collides — it cannot for rank 2 with h₁ ≠ h₂.

**Uses.** PotentialAutomorphyInfrastructure:PA.5: Compute weights and check the input remains regular/polarized under the chosen tensor operation; PotentialModularityAndCompatibleSystems:R24.5/system-l-functions: Dual factors and product formulas.

**Sources.** blggt-2014-v4, §5.1, pp.62–63 of arXiv v4; published pp.570–571: Memberwise operations and the normalized dual polynomial; multiset formulas derive from the representation-level tensor/Hodge operations.


### Twisting, restriction and induction of compatible systems

**Target:** R24.5/system-operations. **Kind:** construction.

Given systems, construct character twists, finite base-field restrictions and finite-extension inductions by applying the arithmetic representation operations member by member and their WD/Hodge operations locally. Plain compatibility is preserved after enlarging S; all-place strict compatibility is preserved for de Rham systems, with Q and H transported accordingly. For induction include primes ramified in the extension in S and take at a local place the sum of local induced WD parameters. For almost-strict systems, the unconditional output is plain: to retain almost strictness one must check that every newly irreducible residual output member falls in a source coefficient-prime comparison case and that every required unramified coefficient output is crystalline of the transported weights. Twisting by a strict character preserves the rank-two residual irreducibility test; arbitrary induction/restriction may change it. The virtual Brauer combination is a class in the representation ring, not yet a representation.

**Hypotheses and scope.**

- strict compatibility at 𝔮 | ℓ is preserved by (i)–(iii) because Weil–Deligne parameters of de Rham representations commute with twisting, restriction and induction (PadicHodgeTheory R06.3)
- this layer takes a system as input and does not assume R24.5's two-dimensional existence theorem

**Construction or proof.**

- Local-global compatibility of each operation with Weil–Deligne parameters (ArithmeticGaloisRepresentations R01.2, PadicHodgeTheory R06.3).
- Recognition by Frobenius polynomials (ArithmeticGaloisRepresentations R01.5) for (iv).

**Required contracts.** PotentialModularityAndCompatibleSystems:R24.5/compatible-system, PadicHodgeTheory:R06.3/plan/weil-deligne-parameter, ArithmeticGaloisRepresentations:R01.2, ArithmeticGaloisRepresentations:R01.5, ArithmeticGaloisRepresentations:R01.1/refined-continuity-interface, ArithmeticGaloisRepresentations:R01.1/refined-scalar-extension-interface, ArithmeticGaloisRepresentations:G7, mathlib:Representation.ind, mathlib:Representation.dual.

**Checks.**

- Induction has rank [F′:F]n and H_τ is the multiset union over embeddings σ extending τ. Parallel KW weights are repeated [F′:F] times; general induction belongs to the rank-n carrier.
- Restriction or induction can change residual irreducibility. Almost strictness is retained only after checking the newly required coefficient-prime clauses.
- Continuous induction uses R01.1/refined-induction-interface. Algebraic Mathlib induction alone supplies no topology. Local WD induction still requires the R01.2 export.

**API.**

- **TauCeti.CompatibleSystems.twist** (constructor): Memberwise tensor with a strict character system; local WD tensor and Hodge shifts.

- **TauCeti.CompatibleSystems.restrict** (constructor): Restrict to G_F′; Q roots raised to residue degrees and H_τ pulled back.

- **TauCeti.CompatibleSystems.induce** (constructor): For finite F′/F induce each member, rank multiplied by [F′:F], enlarge S by ramified primes, local WD induction and Hodge multiset union.

- **TauCeti.CompatibleSystems.restrict_charpoly** (compatibility): At w|v outside S, roots of Q_w are α^[k(w):k(v)] for roots α of Q_v.

- **TauCeti.CompatibleSystems.induce_rank** (compatibility): Rank Ind_F′^F ℛ=[F′:F] rank ℛ; induction need not preserve regularity or irreducibility.


**Unit tests.**

- **twist_cyclotomic** (computation): Twisting by ε shifts each BLGGT Hodge number by −1 and pure weight by −2.

- **restrict_trivial_extension** (degenerate): For F′=F restriction returns the same members, Q and H.

- **induce_quadratic_trivial** (computation): Induce the trivial character across a quadratic extension: rank 2, H={0,0}, polynomial (X−1)² at split good primes and X²−1 at inert good primes.

- **induced_regular_nonexample** (non-example): The induced quadratic trivial character is a sum of trivial and quadratic characters and is not regular; generic induction is not an irreducibility theorem.


**Acceptance.**

- Check that Ind of a rank-2 system from a quadratic field has rank 4 and Hodge–Tate weights doubled in multiplicity
- Check that restriction of an irreducible system induced from K to G_K is reducible

**Uses.** PotentialModularityAndCompatibleSystems:R24.5/brauer-induction-system: Build the twist and induction summands in a virtual class; PotentialModularityAndCompatibleSystems:R24.5/induced-character-purity: Transport the canonical induced Hodge data and Frobenius roots.

**Sources.** kw-serre-modularity-II, §10.3.2, p. 93 of the preprint: The operations used: induction, twist, restriction.


### Polarized weakly compatible systems

**Target:** R24.5/polarized-system. **Kind:** definition.

Let F/F⁺ be CM and ℛ a rank-n weakly compatible system over M. Let ℳ be a rank-one weakly compatible character system of G_F⁺ over the same M (enlarge M if necessary), with ramification set lying below that of ℛ. A polarized system is the pair (ℛ,ℳ) together with a representation-level polarization witness for every λ, imported from ArithmeticGaloisRepresentations G7: a perfect pairing B_{λ,v} with B(x,y)=ε_v B(y,x), B(r_λ(g)x,r_λ(c_v g c_v)y)=μ_λ(g)B(x,y), and ε_v=−μ_λ(c_v). It is totally odd when ε_v=+1 at every real v. Forgetting the pairings only retains essential conjugate self-duality; a polarization is more data. The totally-real version uses BLGGT §2.1’s orthogonal/symplectic pairing convention, not the CM sign equation imposed without a quadratic extension.

**Construction or proof.**

- Apply the cited statement with the conventions and hypotheses displayed above.

**Required contracts.** PotentialModularityAndCompatibleSystems:R24.5/weakly-compatible-system-rank-n, ArithmeticGaloisRepresentations:G7.

**Checks.**

- Keep the perfect bilinear pairing and covariance data, not just r^c≅r∨⊗μ. In CM normalization its symmetry ε satisfies ε=−μ(c).
- Totally odd means ε=+1 at every real place, hence μ(c)=−1 in the CM case. For totally real fields use the orthogonal/symplectic definition in BLGGT §2.1.

**API.**

- **TauCeti.CompatibleSystems.PolarizedSystem** (structure): Pair ℛ,ℳ with an actual polarization witness at every λ.

- **TauCeti.CompatibleSystems.PolarizedSystem.multiplier** (projection): The rank-one character system ℳ of G_F⁺, including μ(c_v).

- **TauCeti.CompatibleSystems.PolarizedSystem.pairing** (projection): The perfect representation-level pairing from G7, for each λ and real place v.

- **TauCeti.CompatibleSystems.PolarizedSystem.IsTotallyOdd** (data): All pairing signs ε_v are +1; for CM this requires μ(c_v)=−1.

- **TauCeti.CompatibleSystems.PolarizedSystem.conjugateDual** (compatibility): Each r_λ^c is isomorphic to r_λ∨⊗μ_λ|G_F, with the specified pairing.


**Unit tests.**

- **polarized_cm_unit** (degenerate): The trivial rank-one system on G_F has a symmetric pairing and CM multiplier δ_F/F⁺, with μ(c_v)=−1; multiplier 1 has the wrong BLGGT sign.

- **polarized_rank_two** (computation): For H¹ of an elliptic curve over ℚ restricted to F=ℚ(i), let J be its alternating cup-product pairing and let c be complex conjugation on the representation extended to G_ℚ. The conjugate pairing B(x,y)=J(x,r(c)y) is symmetric and has CM multiplier μ=ε⁻¹ with μ(c)=−1; it is totally odd. This checks the actual pairing, not only its determinant on G_F.

- **polarized_multiplier_wrong** (non-example): Changing μ(c_v) while retaining the same pairing reverses the required CM equation ε_v=−μ(c_v).

- **polarized_forget_pairing** (compatibility): Forget the chosen G7 pairing to obtain r^c≅r∨⊗μ; the converse requires a correctly signed perfect pairing, not a Prop-valued token.


**Acceptance.**

- Verify the stated hypotheses and the supplier interfaces; no existence or automorphy endpoint is assumed.

**Uses.** PotentialAutomorphyInfrastructure:PA.5: Track the lifting input and multiplier after tensor operations; PotentialModularityAndCompatibleSystems:R24.5/constituents-essentially-self-dual: Restrict the actual pairing to the selected constituent.

**Sources.** blggt-2014-v4, §2.1, p.31; §5.1, p.62: Representation-level signs and the system pair (ℛ,ℳ).


### Operations on polarized systems

**Target:** R24.5/polarized-operations. **Kind:** construction.

For CM F/F⁺, put δ=δ_F/F⁺. Duality takes multiplier μ⁻¹ and the same sign; tensoring (ℛ,μ,ε) and (ℛ′,μ′,ε′) takes multiplier μμ′δ and sign εε′, so both totally odd inputs give a totally odd output. The quadratic correction changes no restriction to G_F but is necessary at c_v. For k≥1, ∧^k and Sym^k have inherited pairing sign ε^k and multiplier μ^kδ^(k−1), in characteristic zero (on nonzero representations). At k=0 the unit system has multiplier δ and sign +1; equivalently use the integer exponent k−1 in the formula. Direct sum requires a common multiplier and common signs; otherwise the block pairing is not a polarization of one pair. Twisting by a character χ of G_F uses μ times the norm character χχ^c extended to G_F⁺ with value +1 at c_v. Restriction is along a CM extension with matched real subfield; induction retains polarization only with a specified compatible extension of the multiplier and the induced perfect pairing/sign check. Regularity and irreducibility must be checked separately.

**Construction or proof.**

- Apply the cited statement with the conventions and hypotheses displayed above.

**Required contracts.** PotentialModularityAndCompatibleSystems:R24.5/polarized-system, PotentialModularityAndCompatibleSystems:R24.5/linear-algebra-operations-on-systems, ArithmeticGaloisRepresentations:G7.

**Checks.**

- Tensoring two normalized CM polarizations uses μμ′δ_{F/F⁺}. At c this changes the naïve +1 product to −1, while leaving the restriction to G_F unchanged.
- At symmetric/exterior degree k use μ^kδ^{k−1}; at k=0 the unit has μ=δ, symmetry +1. Only the characteristic-zero nonzero power carries the claimed perfect pairing.
- A direct sum requires common multiplier/sign; induction requires a specified multiplier extension and the induced pairing. Neither follows from weight bookkeeping.

**API.**

- **TauCeti.CompatibleSystems.PolarizedSystem.tensor** (constructor): Tensor pairings and multiplier μμ′δ; signs multiply.

- **TauCeti.CompatibleSystems.PolarizedSystem.dual** (constructor): Dual perfect pairings and inverse multiplier.

- **TauCeti.CompatibleSystems.PolarizedSystem.twist** (constructor): Twist by χ with norm-character multiplier correction.

- **TauCeti.CompatibleSystems.PolarizedSystem.power** (constructor): Symmetric/exterior k-th pairing with μ^kδ^(k−1) and ε^k.

- **TauCeti.CompatibleSystems.PolarizedSystem.tensor_isTotallyOdd** (relation): Two totally odd CM systems yield a totally odd normalized tensor system.


**Unit tests.**

- **polarized_tensor_sign** (computation): ε=ε′=+1, μ(c)=μ′(c)=−1: uncorrected product has μμ′(c)=+1; corrected μμ′δ(c)=−1.

- **polarized_dual_sign** (compatibility): Inverse of a −1 multiplier at c is −1, matching the unchanged +1 sign.

- **polarized_unit_tensor** (degenerate): The polarized CM unit has μ=δ; tensoring it with (ℛ,μ) gives μδδ=μ.

- **polarized_sum_mismatch** (non-example): A block sum of pairings with signs +1 and −1 is neither symmetric nor alternating; there is no common sign without changing the inputs.


**Acceptance.**

- Verify the stated hypotheses and the supplier interfaces; no existence or automorphy endpoint is assumed.

**Uses.** PotentialAutomorphyInfrastructure:PA.5: Validate the tensor trick’s multiplier and total oddness; PotentialModularityAndCompatibleSystems:R24.5/linear-algebra-operations-on-systems: Refine the generic operations with polarization witnesses.

**Sources.** blggt-2014-v4, §2.1, p.31; §5.1, p.62 of arXiv v4; operations derived from the pairing covariance and sign equation: Derived system-level pairing operations from §2.1 covariance and CM sign equation. Multiplication by δ corrects the extension of the multiplier at real conjugations; these explicit formulas are a derivation from the definition.


### Compatible systems of algebraic Hecke characters

**Target:** R24.5/character-system. **Kind:** construction.

For a type-A₀ algebraic Hecke character χ of a number field F, choose a number field M containing its algebraic finite values. Its ℓ-adic realizations give a rank-one weakly compatible system, de Rham at every coefficient place and crystalline away from a fixed finite conductor set. In BLGGT convention HT_τ={a_τ} when χ at connected infinity is ∏(τx)^−a_τ. Good geometric Frobenius polynomial is X−r_λ(Frob_v), transported from the common algebraic value by class field theory. Conversely, every finitely ramified algebraic/de Rham ℓ-adic character comes from such χ, up to the fixed reciprocity convention; Hecke characters and their algebraic infinity-type purity are imported from GlobalNumberFields Layers 9–10, reciprocity from ClassFieldTheory Layers 11–12, and the ℓ-adic realization/classification comparison is requested as ClassFieldTheory, Part II. These constructions are not duplicated here.

**Construction or proof.**

- Apply the cited statement with the conventions and hypotheses displayed above.

**Required contracts.** tauceti:TauCetiRoadmap/GlobalNumberFields#layer-9-hecke-and-ray-class-characters, tauceti:TauCetiRoadmap/GlobalNumberFields#layer-10-archimedean-characters-infinity-types-and-cyclotomic-arithmetic, PotentialModularityAndCompatibleSystems:R24.5/weakly-compatible-system-rank-n, ArithmeticGaloisRepresentations:R01.1/refined-continuity-interface, ArithmeticGaloisRepresentations:R01.1/refined-scalar-extension-interface, tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity.

**Checks.**

- Use the GlobalNumberFields Layers 9–10 type-A₀ Hecke carrier, with algebraicity on the connected archimedean component; finite real signs are allowed.
- The existing global reciprocity roadmap is insufficient by itself for the algebraic ℓ-adic realization and converse classification. That exact comparison is the Class field theory Part II request, using the local rank-one de Rham/crystalline classification.

**API.**

- **TauCeti.CompatibleSystems.characterSystem** (constructor): Assemble the common-field rank-one family from the owner’s algebraic Hecke character realizations.

- **TauCeti.CompatibleSystems.characterSystem_hodge** (compatibility): H_τ={a_τ} for connected-infinity exponent −a_τ.

- **TauCeti.CompatibleSystems.characterSystem_frob** (compatibility): The common linear polynomial matches the geometric Frobenius value with the chosen Artin convention.

- **TauCeti.CompatibleSystems.characterSystem_unique** (extensionality): Unique up to memberwise representation isomorphism from good Frobenius polynomials.


**Unit tests.**

- **character_trivial** (degenerate): χ=1 gives Q_v=X−1, H={0}, weight 0.

- **character_cyclotomic** (computation): The algebraic idele norm ||·||_F gives the cyclotomic family in the geometric Artin convention: H={−1}, Q_p=X−p⁻¹, pure weight −2.

- **character_finite_order** (computation): A finite-order Hecke character has H={0}, all good roots roots of unity, and weight 0.

- **character_non_algebraic** (non-example): An arbitrary continuous character with nonintegral infinity exponent has no type-A₀ algebraic realization theorem and is not accepted by this constructor.


**Acceptance.**

- Verify the stated hypotheses and the supplier interfaces; no existence or automorphy endpoint is assumed.

**Uses.** PotentialModularityAndCompatibleSystems:R24.5/rank-one-purity: The algebraic character’s infinity type determines its pure weight; PotentialModularityAndCompatibleSystems:R24.5/rank-two-reducibility-independent-of-lambda: Propagate the two Hodge–Tate character constituents.

**Sources.** blggt-2014-v4, Appendix A.2, p.87, before Lemma A.2.1: Algebraic character realizations, Hodge numbers, weight properties and pure WD parameters; acc-2023, §7.1, pp.1085,1092: Rank-one extremely weak systems are de Rham and pure; the character realization argument is imported.


### Purity of character systems

**Target:** R24.5/rank-one-purity. **Kind:** theorem.

Every rank-one weakly compatible system is pure of an integer weight w. More generally the same conclusion holds for rank-one extremely weak data of ACC+ §7.1: actual semisimple members with common linear good Frobenius polynomials and the determinant Hodge condition at every λ. Algebraic character classification gives one integer w with a_{cτ}+a_τ=w and |ιr(Frob_v)|²=q_v^w for every good v and complex embedding. The algebraic Hecke-character realization supplies pure local WD parameters as well. This does not assert purity for arbitrary continuous nonalgebraic character data.

**Construction or proof.**

- Import the de Rham/algebraic Hecke-character classification from the rank-one owner.
- Use the global infinity-type relation a_τ+a_cτ=w and the common geometric Frobenius values to prove both clauses of system purity.
- Use the owner’s pure WD character theorem for the stronger local assertion.

**Required contracts.** PotentialModularityAndCompatibleSystems:R24.5/character-system, PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates, PotentialModularityAndCompatibleSystems:R24.5/weakened-compatible-data, tauceti:TauCetiRoadmap/ClassFieldTheory#layer-11-the-global-class-formation-and-global-artin-reciprocity.

**Checks.**

- Rank one makes the determinant Hodge condition the full Hodge condition; algebraic character classification supplies de Rham realizations and a single weight with a_τ+a_{cτ}=w.
- This includes rank-one extremely weak data with actual members. It does not assign purity to arbitrary continuous nonalgebraic characters.


**Acceptance.**

- Verify the stated hypotheses and the supplier interfaces; no existence or automorphy endpoint is assumed.

**Sources.** blggt-2014-v4, Appendix A.2, p.87, items (1),(2),(8): Weights and pure local parameters of algebraic characters; acc-2023, §7.1, p.1092, purity paragraph: Rank-one purity before potential automorphy consequences.


### Purity of systems induced from characters

**Target:** R24.5/induced-character-purity. **Kind:** theorem.

For a finite extension F′/F and a pure rank-one character system ℭ/F′ of weight w, Ind_F′^F ℭ with canonical induced Hodge multiset H_τ=⊔_{σ|τ}H_σ is a pure system of weight w after adjoining ramified primes to S. This also applies to induction of rank-one extremely weak character data when H is the transported character Hodge data. At a good v the eigenvalues in each residue-degree-f block satisfy β^f=α_w with |ια_w|²=q_w^w=(q_v^f)^w, hence |ιβ|²=q_v^w. It is not a regularity or irreducibility theorem. No purity claim is made for arbitrary freely chosen higher-rank Hodge metadata with only the correct determinant sum.

**Construction or proof.**

- Construct local induction blocks; compute their good Frobenius roots via β^f=α_w.
- Apply character purity to the source roots and convert q_w=q_v^f.
- The conjugate Hodge relation survives the union over embeddings σ extending τ.

**Required contracts.** PotentialModularityAndCompatibleSystems:R24.5/rank-one-purity, PotentialModularityAndCompatibleSystems:R24.5/system-operations, PotentialModularityAndCompatibleSystems:R24.5/weakened-compatible-data.

**Checks.**

- At a residue-degree-f block β^f=α_u and q_u=q_v^f, so |β|²=q_v^w. Hodge data must be the canonical union over extending embeddings.
- The induced system may be reducible and nonregular. A correct determinant sum with arbitrarily chosen higher-rank Hodge multisets is insufficient for Hodge purity.


**Acceptance.**

- Verify the stated hypotheses and the supplier interfaces; no existence or automorphy endpoint is assumed.

**Sources.** acc-2023, §7.1, p.1092, purity paragraph: Purity for induction of an extremely weak character system with its induced data; blggt-2014-v4, §5.1, pp.62–63: Operations and the two clauses of purity.


### Compatible systems of Artin representations

**Target:** R24.5/artin-system. **Kind:** construction.

Let a finite quotient Γ of G_F and a characteristic-zero finite-dimensional representation a over a number field M be given. Use coefficient extension along every M↪M̄_λ to form a compatible Artin family. Choose S containing every prime ramified in the finite quotient. Members have finite image, hence de Rham/potentially unramified with H_τ consisting of n copies of 0, and are crystalline at coefficient places outside S. Good polynomials are the characteristic polynomials of a(Frob_v), their eigenvalues roots of unity. This construction uses the finite quotient representation and coefficient extension from R01.1, and has weight zero; finite-image does not imply irreducible or regular.

**Construction or proof.**

- Apply the cited statement with the conventions and hypotheses displayed above.

**Required contracts.** PotentialModularityAndCompatibleSystems:R24.5/weakly-compatible-system-rank-n, ArithmeticGaloisRepresentations:R01.1/refined-continuity-interface, ArithmeticGaloisRepresentations:R01.1/refined-scalar-extension-interface, ArithmeticGaloisRepresentations:G7, PadicHodgeTheory:R06.2, mathlib:Representation, mathlib:LinearMap.charpoly.

**Checks.**

- Start from an actual representation of a finite quotient over one number field. Its scalar extensions are continuous finite-image members; semisimplicity follows in characteristic zero.
- All labeled Hodge multisets consist of n zeros and good roots are roots of unity. Rank n>1 therefore fails regularity; finite image need not imply irreducibility.

**API.**

- **TauCeti.CompatibleSystems.artinSystem** (constructor): Extend the given finite-quotient number-field representation to every coefficient place.

- **TauCeti.CompatibleSystems.artinSystem_hodge** (compatibility): H_τ is n copies of zero.

- **TauCeti.CompatibleSystems.artinSystem_charpoly** (compatibility): Q_v is the characteristic polynomial of the finite quotient Frobenius element.

- **TauCeti.CompatibleSystems.artinSystem_pure** (relation): The Artin family is pure of weight 0 with finite-monodromy local WD data.


**Unit tests.**

- **artin_trivial** (degenerate): The trivial rank-one quotient gives Q_v=X−1 and H={0}.

- **artin_quadratic** (computation): For a quadratic character, good Q_v is X−1 at split primes, X+1 at inert primes.

- **artin_rank_two_irregular** (non-example): Any rank-two Artin family has H={0,0}, so it is not regular, even when its finite-group representation is irreducible.

- **artin_roots_unity** (characterisation): Finite-order matrices have eigenvalues roots of unity under every complex embedding; their absolute value is 1.


**Acceptance.**

- Verify the stated hypotheses and the supplier interfaces; no existence or automorphy endpoint is assumed.

**Uses.** PotentialModularityAndCompatibleSystems:R24.5/artin-twist-purity: Tensor finite-order Frobenius eigenvalues with the algebraic character family.

**Sources.** acc-2023, §7.1, pp.1086,1092: The Artin-up-to-twist purity observation; the finite-quotient family, zero Hodge weights and root-of-unity polynomials are the explicit untwisted construction used in that observation.


### Purity of Artin systems up to twist

**Target:** R24.5/artin-twist-purity. **Kind:** theorem.

If ℛ=𝒜⊗ℭ where 𝒜 is a rank-n Artin system and ℭ a rank-one algebraic character system of weight w, with H_τ the canonical n copies of the character Hodge number, then ℛ is pure of weight w. Every good eigenvalue is ζα with ζ a root of unity and α the character Frobenius value. For rank-two extremely weak systems that are Artin up to twist in the ACC+ sense, use the actual character twist and canonical Hodge data (or a very weak realization) to obtain this statement; merely choosing arbitrary higher-rank Hodge multisets of the same determinant sum does not imply Hodge purity.

**Construction or proof.**

- Use |ιζ|=1 and character purity to compute the good eigenvalue absolute values.
- Transport the character Hodge symmetry to its repeated multiset.
- No potential-automorphy theorem enters either step.

**Required contracts.** PotentialModularityAndCompatibleSystems:R24.5/artin-system, PotentialModularityAndCompatibleSystems:R24.5/rank-one-purity, PotentialModularityAndCompatibleSystems:R24.5/linear-algebra-operations-on-systems, PotentialModularityAndCompatibleSystems:R24.5/weakened-compatible-data.

**Checks.**

- If a canonical Artin family is twisted by a weight-w algebraic character, its good eigenvalues are ζα and its H_τ is n copies of the character’s Hodge number.
- For an extremely weak Artin-up-to-twist family the memberwise twist identity alone does not constrain all H metadata. Require canonical data or a very weak realization; the inherited E4 qualification is retained.


**Acceptance.**

- Verify the stated hypotheses and the supplier interfaces; no existence or automorphy endpoint is assumed.

**Sources.** acc-2023, §7.1, pp.1086,1092: Artin-up-to-twist definition and purity observation, with the canonical-Hodge qualification recorded in source issue E4.


### Reducibility of rank-2 systems over ℚ does not depend on λ

**Target:** R24.5/rank-two-reducibility-independent-of-lambda. **Kind:** theorem.

For a rank-two weakly compatible system over ℚ in Taylor’s §6 sense, absolute reducibility of one characteristic-zero member implies absolute reducibility of every member. The two Hodge–Tate characters at that member fit into algebraic Hecke-character systems by Serre; their direct sum has the same good Frobenius polynomials, so recognition identifies every other member. This is independence of characteristic-zero reducibility, not independence of residual reducibility.

**Hypotheses and scope.**

- Taylor derives Lemma 6.5 from the classification of one-dimensional Hodge–Tate representations of G_ℚ: each is a finite-order character times an integral cyclotomic power. Thus the two constituents extend to rank-one systems with shared good Frobenius polynomials.

**Construction or proof.**

- Each constituent is a Hodge–Tate character and hence belongs to an algebraic Hecke-character family (rank-one supplier).
- The two character families sum to the same common good Frobenius polynomials.
- Apply R01.5 recognition for every λ.

**Required contracts.** PotentialModularityAndCompatibleSystems:R24.5/weakly-compatible-system-rank-n, PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates, ArithmeticGaloisRepresentations:R01.5, PotentialModularityAndCompatibleSystems:R24.5/character-system, PotentialModularityAndCompatibleSystems:R24.5/weakened-compatible-data.

**Checks.**

- Use Taylor Lemma 6.5 for characteristic-zero absolute reducibility of rank two over ℚ. ACC+ Lemma 7.1.1 offers a broader setting, but the existing target is retained at its stated scope.
- A CM form is irreducible at every λ over ℚ but reducible upon restriction to its CM field. Residual reducibility can still vary with λ.


**Acceptance.**

- Check Lemma 6.5 on the system of a CM newform: irreducible at every λ, although it becomes reducible on restriction to the CM field.

**Sources.** taylor-2006-meromorphic-continuation, §6, before Lemma 6.5, p. 773 (PDF page 45): The proof indication for Lemma 6.5; taylor-2006-meromorphic-continuation, §6, after Lemma 6.5, p. 774 (PDF page 46): Reducible and irreducible rank-2 systems.


### L-functions, Γ-factors and ε-factors of a compatible system

**Target:** R24.5/system-l-functions. **Kind:** definition.

The partial L-function is L^S(ıℛ, s) = ∏_{v∉S} q_v^{ns}/ıQ_v(q_v^s); it converges to an analytic function on Re s > 1 + w/2 if ℛ is pure of weight w, and if every place above l lies in S it depends only on r_λ (λ | l). If ℛ is strictly compatible, L(ıℛ, s) = ∏_{v∤∞} L(ıWD_v(ℛ), s) differs from L^S by finitely many Euler factors. For ℛ strictly compatible, pure of weight w and regular, with Γ_ℝ(s) = π^{−s/2}Γ(s/2) and Γ_ℂ(s) = 2(2π)^{−s}Γ(s) = Γ_ℝ(s)Γ_ℝ(s + 1), and following BLGGT v4: for v complex, with τ, τ′ the two embeddings with ı∘τ, ı∘τ′ extending to F_v ≅ ℂ, L_v(ıℛ, s) = Γ_ℂ(s − w/2)^n ∏_{h∈H_τ, h<w/2}(Γ_ℂ(s − h)/Γ_ℂ(s − w/2)) ∏_{h∈H_{τ′}, h<w/2}(Γ_ℂ(s − h)/Γ_ℂ(s − w/2)) and ε_v = i^{Σ_{h∈H_τ}|h − w/2| + Σ_{h∈H_{τ′}}|h − w/2|}; for v real, with d± = n/2 (n even) or (n ± (−1)^{w/2}det ℛ(c_v))/2 (n odd, w even), L_v(ıℛ, s) = Γ_ℝ(s − w/2)^{d+}Γ_ℝ(s + 1 − w/2)^{d−} ∏_{h∈H_τ, h<w/2}(Γ_ℂ(s − h)/Γ_ℂ(s − w/2)) and ε_v = i^{d− + Σ_{h∈H_τ}|h − w/2|}. Then Λ(ıℛ, s) = L(ıℛ, s)∏_{v|∞}L_v(ıℛ, s) and ε(ıℛ, s) = ∏_{v∤∞}ε(ıWD_v(ℛ), ψ_v, s)∏_{v|∞}ε_v(ıℛ, ψ_v, s), for the standard additive character ψ of 𝔸_F/F. (BLGGT v1 instead used Γ_ℂ(s − w/2)^{n/2}-type factors and a separate Hodge factor L({H_τ}, s), which is undefined for odd w; see PotentialModularityAndCompatibleSystems/E2.)

**Hypotheses and scope.**

- ℛ = (M, S, {Q_v(X)}, {r_λ}, {H_τ}) a weakly compatible system of l-adic representations of G_F of rank n (R24.5/weakly-compatible-system-rank-n); ı : M ↪ ℂ.
- For the completed function: strictly compatible, pure of weight w and regular.

**Construction or proof.**

- det r_λ(c_v) = ±1 is independent of λ because {det r_λ} is a weakly compatible system of characters; purity forces w even when n is odd and v real, so d± are integers.
- Each quotient Γ_ℂ(s − h)/Γ_ℂ(s − w/2) with h < w/2 is a polynomial times a power of 2π when w − 2h is even, and a genuine Γ-quotient otherwise; the definition does not take roots.
- Convergence for pure ℛ from |ια|² = q_v^w.

**Required contracts.** PotentialModularityAndCompatibleSystems:R24.5/weakly-compatible-system-rank-n, PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates, PadicHodgeTheory:R06.3/plan/weil-deligne-parameter, EndoscopicTransferAndUnitaryTraceComparison:ET.6, mathlib:Complex.Gammaℝ, mathlib:Complex.Gammaℂ, mathlib:Complex.Gammaℝ_mul_Gammaℝ_add_one.

**Checks.**

- Use the v4/published archimedean factors, not the inherited v1 Hodge-factor expression. Gamma quotients are meromorphic factors with cancellation understood.
- For H¹ of an elliptic curve the real factor simplifies meromorphically to Γℂ(s) and the real epsilon is −1. A Lean identity involving pointwise division needs Γℂ(s−1/2)≠0 because Mathlib totalizes Gamma at its poles.
- For ε, Q_p=X−p⁻¹, H={−1}, w=−2, and L^S(s)=ζ^S(s+1), with Γℝ(s+1). For the trivial character use Γℝ(s)ζ(s).
- The functional equation is an existence consequence owned by ML.2, not an axiom or theorem of this L-function constructor.

**API.**

- **TauCeti.CompatibleSystems.partialLFunction** (constructor): L^S(ıℛ, s) as an Euler product.

- **TauCeti.CompatibleSystems.lFunction** (constructor): L(ıℛ, s) for strictly compatible ℛ.

- **TauCeti.CompatibleSystems.archimedeanGammaFactor** (constructor): L_v(ıℛ, s) at complex and real v in BLGGT v4's form, through Complex.Gammaℝ and Complex.Gammaℂ.

- **TauCeti.CompatibleSystems.archimedeanEpsilon** (constructor): ε_v(ıℛ, ψ_v, s) = i^{Σ|h − w/2|} (complex v) or i^{d− + Σ|h − w/2|} (real v).

- **TauCeti.CompatibleSystems.archimedeanD** (data): d± at a real place: n/2, or (n ± (−1)^{w/2}det ℛ(c_v))/2 for n odd.

- **TauCeti.CompatibleSystems.completedLFunction** (constructor): Λ(ıℛ, s) and ε(ıℛ, s).

- **TauCeti.CompatibleSystems.partialLFunction_converges** (characterisation): Convergence on Re s > 1 + w/2 for pure ℛ.

- **TauCeti.CompatibleSystems.partialLFunction_eq_of_lambda** (compatibility): L^S(ıℛ, s) = L^S(ı̃r_λ, s) when S contains the places above l.


**Unit tests.**

- **trivial_character** (compatibility): F = ℚ, n = 1, r_λ trivial: w = 0, d+ = 1, d− = 0, H = {0} has no h < 0, so L_∞ = Γ_ℝ(s) and ε_∞ = 1; Λ(ı1, s) = Γ_ℝ(s)ζ(s) is completedRiemannZeta, and Λ(1 − s) = Λ(s) is the functional equation with ε = 1.

- **gamma_duplication** (compatibility): Γ_ℂ(s) = Γ_ℝ(s)Γ_ℝ(s + 1) is Mathlib's Complex.Gammaℝ_mul_Gammaℝ_add_one.

- **cyclotomic_character** (compatibility): F = ℚ, r_λ = ε_l in BLGGT's conventions (Frob_v geometric, HT_τ(ε_l) = {−1}): Q_p(X) = X − p^{−1}, weight −2, L^S(ıε_l, s) = ζ^S(s + 1); d+ = (1 + (−1)(−1))/2 = 1, d− = 0, so L_∞ = Γ_ℝ(s + 1) and ε_∞ = i^{0 + |−1 + 1|} = 1.

- **elliptic_curve_gamma_factor** (compatibility): For H¹ of an elliptic curve over ℚ, n=2,w=1,H={0,1},d±=1. The real factor is Γℝ(s−1/2)Γℝ(s+1/2)Γℂ(s)/Γℂ(s−1/2), which simplifies meromorphically to Γℂ(s); the real epsilon is −1. As a pointwise identity in Mathlib, require Γℂ(s−1/2)≠0.


**Acceptance.**

- BLGGT note that these give the usual Λ and ε (Tate, Number theoretic background).
- The functional equation Λ(ıℛ, s) = ε(ıℛ, s)Λ(ıℛ^∨, 1 − s) is a consequence of potential automorphy (BLGGT v4 Corollary 5.4.3), which this stage does not assume; it is planned in ModularityAndLanglandsExtensions ML.2.

**Uses.** PotentialModularityAndCompatibleSystems:R24.5/galois-grothendieck-ring: L^S of virtual classes; ModularityAndLanglandsExtensions:ML.2: BLGGT v4 Corollary 5.4.3: after potential automorphy (Theorem 5.4.1), L^S(ıℛ, s) continues meromorphically and Λ(ıℛ, s) = ε(ıℛ, s)Λ(ıℛ^∨, 1 − s).

**Sources.** blggt-2014-v4, §5.1, pp. 63–64 (arXiv v4): The v4 archimedean factors, replacing v1's Hodge factor.


### The Grothendieck ring of semisimple ℓ-adic representations

**Target:** R24.5/galois-grothendieck-ring. **Kind:** construction.

For a number field F and prime l, 𝒢𝒢_{F,l} is the category of semisimple continuous representations of G_F on finite-dimensional ℚ̄_l-vector spaces unramified almost everywhere (with cancellation U ⊕ W ≅ V ⊕ W ⇒ U ≅ V by traces), and Rep_{F,l} is its Grothendieck group, a commutative ring under semisimplified ⊗. It carries: trace homomorphisms tr σ (continuous class functions, separating classes on a dense set); dim = tr 1 ∈ ℤ; the nondegenerate symmetric ℤ-valued Hom pairing ([U], [V]) = dim Hom_{G_F}(U, V), with (A, A) = Σn_i² for A = Σn_i[V_i], so that dim A > 0 and (A, A) = 1 force A = [V] irreducible; the product formula for tensor products along a Zariski-dense θ : G_F → G₁ × G₂; conjugation conj_σ; restriction res_{F′/F} (a ring map); induction ind_{F′/F} with its trace formula, dim ind = [F′ : F] dim, the projection formula, Frobenius reciprocity and Mackey's formula; Brauer induction A = Σ n_i ind_{F_i′/F}([ı^{−1}ψ_i] res A) with the resulting pairing formula; and, for A unramified outside S ⊇ {v | l}, L^S(ıA, s) = ∏ L^S(ıV_i, s)^{n_i}, additive in A and with L^S(ı ind A, s) = L^{S′}(ıA, s) (§5.5 (1)–(9)).

**Hypotheses and scope.**

- F a number field; l a prime; ı : ℚ̄_l ≅ ℂ for L-functions.

**Construction or proof.**

- Items (1)–(7) are formal from semisimplicity and characters; (5) uses Zariski density to identify Hom spaces with those of algebraic representations.
- (8): trace formula for induced characters, Frobenius reciprocity and Mackey's double-coset formula; (8f) is Brauer's induction theorem for Gal(F′/F), transported by ı^{−1} and multiplied by A.
- (9): independence of the decomposition, from the additivity of L^S on direct sums and inductivity of partial L-functions.

**Required contracts.** PotentialModularityAndCompatibleSystems:R24.5/system-l-functions, PotentialModularityAndCompatibleSystems:R24.5/system-operations, PotentialModularityAndCompatibleSystems:R24.5/linear-algebra-operations-on-systems, ArithmeticGaloisRepresentations:R01.5, ArithmeticGaloisRepresentations:R01.1/refined-continuity-interface, ArithmeticGaloisRepresentations:R01.1/refined-scalar-extension-interface, ArithmeticGaloisRepresentations:G7, mathlib:Rep.indResAdjunction, tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction.

**Checks.**

- Use semisimplified tensor as ring multiplication. An additive finite-support multiplicity representation is not a representation ring with pointwise multiplication.
- For a virtual class A=Σ n_i[V_i], the Hom norm is Σ n_i² and dimension is Σ n_i dim V_i. Positive dimension is essential to choose +[V], rather than −[V], at norm one.
- Finite Brauer induction, Mackey and Frobenius reciprocity are existing InductionRestriction targets. This arithmetic ring extends their use to continuous finitely ramified members; it does not replan the finite-group theory.

**API.**

- **TauCeti.CompatibleSystems.RepRing** (constructor): Rep_{F,l} with ⊗ as multiplication.

- **TauCeti.CompatibleSystems.RepRing.trace** (constructor): tr σ : Rep_{F,l} → ℚ̄_l, a ring homomorphism.

- **TauCeti.CompatibleSystems.RepRing.pairing** (constructor): (A, B) = dim Hom, extended bilinearly.

- **TauCeti.CompatibleSystems.RepRing.eq_irreducible_of_pairing_eq_one** (characterisation): Positive dimension and (A,A)=1 imply A is the class of one genuine irreducible; expand A in the irreducible basis and use Σn_i²=1.

- **TauCeti.CompatibleSystems.RepRing.res** (functoriality): Restriction, a ring homomorphism.

- **TauCeti.CompatibleSystems.RepRing.ind** (functoriality): Induction with trace formula, projection formula, Frobenius reciprocity and Mackey.

- **TauCeti.CompatibleSystems.RepRing.brauer** (relation): A = Σ n_i ind([ı^{−1}ψ_i] res A).

- **TauCeti.CompatibleSystems.RepRing.partialLFunction** (constructor): L^S(ıA, s) = ∏ L^S(ıV_i, s)^{n_i}, additive and inductive.


**Unit tests.**

- **pairing_norm** (computation): A = 2[V₁] − [V₂] with V₁ ≇ V₂ irreducible: (A, A) = 4 + 1 = 5, and dim A = 2 dim V₁ − dim V₂ may be negative.

- **trivial_class** (degenerate): [1] is the unit, with (1, 1) = 1 and dim 1 = 1.

- **induced_dimension** (computation): dim ind_{F′/F}[1] = [F′ : F], and (ind[1], [1]) = 1 by Frobenius reciprocity.

- **virtual_not_genuine** (non-example): For the virtual C₂ class A=3·1−ε, dim A=2 but (A,A)=10; rank two alone fails genuineness. Norm-one plus positive dimension is the criterion actually used.


**Acceptance.**

- This is the bookkeeping behind BLGGT v4 Theorems 5.5.1–5.5.2 (potential automorphy consequences, not planned in this stage).

**Uses.** ModularityAndLanglandsExtensions:ML.2: BLGGT v4 Theorems 5.5.1–5.5.3 (a representation as a member of a compatible system, irreducibility of r_{l,ı}(π) for density-one l, and splitting a system into irreducible systems), argued by Brauer induction in this ring; PotentialModularityAndCompatibleSystems:R24.5/brauer-induction-system: Norm-one pairing proves that the virtual combination is a genuine irreducible representation.

**Sources.** blggt-2014-v4, §5.5, items (1)–(9), pp.77–79 of arXiv v4; published pp.588–590: Arithmetic virtual classes, the Hom pairing, induction identities and partial Euler factors.


### The common component field of a compatible system

**Target:** R24.5/monodromy-component-field. **Kind:** theorem.

Let ℛ be a weakly compatible system of G_F. With G_λ the Zariski closure of r_λ(G_F), there is one finite Galois F¹/F inducing Gal(F¹/F)≅G_λ/G_λ⁰ for every λ. If ℛ is regular, every irreducible subrepresentation under any open subgroup has multiplicity one, and after a single finite coefficient-field extension every such subrepresentation is defined over M_λ with a stable O_{M,λ}-lattice. No canonical lattice is selected.

**Construction or proof.**

- Import Larsen–Pink Proposition 6.14/Serre for the common component field (recorded gap).
- Sen’s theorem gives distinct weights on a maximal torus of connected monodromy; hence regular constituents have multiplicity one.
- Choose good Frobenius elements with distinct eigenvalues and enlarge the coefficient field by their two splitting fields at different residue characteristics. Apply BLGGT Lemma A.1.5: a semisimple characteristic-zero representation with traces in M and one element having distinct M-rational eigenvalues is defined over M. Its trace-pairing/Wedderburn proof is supplied by R01.5, consuming upstream SemisimpleAlgebras Layers 1–2. Compactness then gives a stable lattice for each constituent, with no canonical choice.

**Required contracts.** PotentialModularityAndCompatibleSystems:R24.5/weakly-compatible-system-rank-n, ArithmeticGaloisRepresentations:G7, ArithmeticGaloisRepresentations:R01.5.

**Checks.**

- The common finite component field is independent of λ. Regularity makes constituents under open subgroups multiplicity free using the labeled Sen torus.
- One finite coefficient extension is obtained from good Frobenius splitting fields at two different residue characteristics. One splitting prime does not cover its own coefficient characteristic.
- BLGGT Lemma A.1.5 needs semisimplicity, traces in M, and one simple-spectrum M-split element. R01.5/split-image-realisation currently treats the absolutely irreducible full-span case; it does not supply this full semisimple statement.


**Acceptance.**

- Verify the stated hypotheses and the supplier interfaces; no existence or automorphy endpoint is assumed.

**Sources.** blggt-2014-v4, Lemma 5.3.1, pp.70–71: Common component field, multiplicity one, and uniform coefficient extension; v1 Lemma 5.2.1 only states the first part; blggt-2014-v4, Appendix A.1 Lemma A.1.5, p.85: The coefficient-descent criterion used in Lemma 5.3.1; its split-eigenvalue hypothesis removes the descent obstruction.


### The algebraic groups attached to a rational compatible system (BLGGT v4 §5.2)

**Target:** R24.5/larsen-rational-system-groups. **Kind:** construction.

For each l: G_l the Zariski closure of r_l(G_F) in GL_n/Q_l, G⁰_l its identity component (reductive), Γ_l = r_l(G_F) ⊆ G_l(Q_l) (open, by Bogomolov), Γ⁰_l = Γ_l ∩ G⁰_l(Q_l); F⁰/F finite Galois with Gal(F⁰/F) ≅ Γ_l/Γ⁰_l for all l (Larsen–Pink 6.14); Z_l and G^der_l the centre and derived group of G⁰_l, G^ad_l = G⁰_l/Z_l, C_l = G⁰_l/G^der_l, G^sc_l the simply connected cover of G^ad_l, H_l = G^sc_l × Z_l ↠ G⁰_l; a constant A(n) with #ker(G^sc_l → G^ad_l) | A(n); Γ^Z_l = Γ⁰_l ∩ Z_l(Q_l), Γ^C_l the image of Γ⁰_l in C_l(Q_l) (open), Γ⁰⁰_l = Γ⁰_l ∩ Im(H_l(Q_l)), Γ^H_l its preimage in H_l(Q_l); a maximal torus T_l (unramified when G⁰_l is), with X*(T^ad) ⊆ X*(T^der) ⊆ X*(T^sc) ⊆ (1/A(n))X*(T^ad); a constant B(n) bounding the coordinates of weights of G^sc_l on V_l; and Serre's θ_l : S_{F⁰,l} → C_l agreeing with (r_l mod G^der_l) ∘ Art_{F⁰} on an open subgroup of O_{F⁰,l}^×.

**Hypotheses and scope.**

- ℛ = (ℚ, S, {Q_v}, {r_l}, {H_τ}) a weakly compatible system with rational coefficients, r_l : G_F → GL_n(Q_l), V_l its space (BLGGT v4 §5.2); every construction below depends on ℛ.

**Construction or proof.**

- The kernels of Γ^H_l → Γ⁰_l and Γ^Z_l → Γ^C_l have order dividing A(n); their cokernels have order dividing A(n)³ and exponent dividing A(n) (H¹ of a finite central kernel, local Euler characteristic).
- A(n), B(n) depend only on n because dim G^ad_l and dim V_l are bounded by n.
- θ_l: Serre, Abelian l-adic representations III.1.2 and III.2.1, applied to r_l mod G^der_l (cited).

**Required contracts.** PotentialModularityAndCompatibleSystems:R24.5/weakly-compatible-system-rank-n, PotentialModularityAndCompatibleSystems:R24.5/monodromy-component-field, ArithmeticGaloisRepresentations:G7.

**Checks.**

- This construction is the ℚ-rational reduction used in the density proof. The number-field-coefficient argument first takes the direct sum over coefficient embeddings and restricts scalars, keeping regular weights and the decomposition data.
- The central quotient is C_ℓ=G⁰_ℓ/G^{der}_ℓ, not G⁰_ℓ/G⁰_ℓ. The connected-component extension and openness have their own G7 source leaves.

**API.**

- **TauCeti.CompatibleSystems.LarsenData.G** (data): G_l, the Zariski closure of the image, with G⁰_l, Z_l, G^der_l, G^ad_l, C_l, G^sc_l, H_l.

- **TauCeti.CompatibleSystems.LarsenData.componentField** (data): F⁰/F with Gal(F⁰/F) ≅ Γ_l/Γ⁰_l for every l.

- **TauCeti.CompatibleSystems.LarsenData.gammaH** (constructor): Γ^H_l ⊆ H_l(Q_l), the preimage of Γ⁰⁰_l.

- **TauCeti.CompatibleSystems.LarsenData.A** (other): A(n): #ker(G^sc_l → G^ad_l) | A(n), uniformly in ℛ and l.

- **TauCeti.CompatibleSystems.LarsenData.theta** (constructor): θ_l : S_{F⁰,l} → C_l.


**Unit tests.**

- **torus_case** (degenerate): CM-type systems: G⁰_l a torus, H_l = Z_l, and Γ^H_l = Γ^Z_l.

- **gl2_case** (computation): For a non-CM elliptic curve over ℚ: G⁰_ℓ=GL₂, G^sc_ℓ=SL₂, Z_ℓ=𝔾_m, C_ℓ=𝔾_m via det. The kernel of SL₂→PGL₂ has order 2, so 2 divides a uniform A(2); no universal choice A(2)=2 is asserted.

- **finite_image** (degenerate): An Artin representation: G⁰_l = 1, so F⁰ is the field cut out by r_l and all other groups are trivial.

- **theta_bound_depends_on_system** (non-example): A(n) and B(n) depend only on n, but C(ℛ) and D(ℛ) of Lemma 5.2.1 cannot be chosen independently of ℛ: for ℛ = ε^k over ℚ (n = 1), θ_l is x ↦ x^{±k}, so its exponent has absolute value |k|.


**Acceptance.**

- Check the torus case: if G⁰_l is a torus then G^der_l = 1, C_l = G⁰_l, H_l = Z_l, and θ_l is Serre's homomorphism for an abelian representation.

**Uses.** PotentialModularityAndCompatibleSystems:R24.5/serre-theta-uniform-bounds: the objects bounded; PotentialModularityAndCompatibleSystems:R24.5/larsen-good-primes: the objects with good integral models.

**Sources.** blggt-2014-v4, §5.2, pp. 65–66 (arXiv v4): The setup of §5.2 through the construction of θ_l.


### Serre's θ_l with bounds uniform in l (BLGGT v4 Lemma 5.2.1)

**Target:** R24.5/serre-theta-uniform-bounds. **Kind:** lemma.

(1) θ_l : S_{F⁰,l} → C_l is surjective. (2) If l ∉ S then θ_l = (r_l mod G^der_l) ∘ Art_{F⁰} on all of O_{F⁰,l}^×. (3) There is C(ℛ), independent of l, such that for every weight µ ∈ X*(Z_l) of Z_l on V_l, (A(n)µ) ∘ θ_l = Σ_σ m_{µ,σ}σ with |m_{µ,σ}| < C(ℛ). (4) There is D(ℛ) with #(X*(S_{F⁰,l})/θ_l*X*(C_l))_tor ≤ D(ℛ).

**Hypotheses and scope.**

- ℛ = (ℚ, S, {Q_v}, {r_l}, {H_τ}) a weakly compatible system with rational coefficients, r_l : G_F → GL_n(Q_l), V_l its space (BLGGT v4 §5.2); every construction below depends on ℛ.

**Construction or proof.**

- (1): on an open U ⊆ O^× where θ_l agrees with the Galois side, the image is open, hence of finite index in the Zariski-dense image of G_{F⁰}; C_l is connected.
- (2): for l ∉ S, r_l mod G^der_l is crystalline at l, and Conrad–Chai–Oort Proposition 6.3 extends the agreement to all of O^× (cited).
- (3): −m_{µ,σ} is a Hodge–Tate number of (A(n)µ) ∘ (r_l mod G^der_l) (printed "mod G⁰_l", see PotentialModularityAndCompatibleSystems/E3); Wintenberger's ν_{HT,v} gives Hodge–Tate numbers as pairings ⟨µ, ν_{HT,v}⟩, bounded because the Hodge–Tate numbers of ℛ do not depend on l and roots are differences of weights.
- (4) from (3).

**Required contracts.** PotentialModularityAndCompatibleSystems:R24.5/larsen-rational-system-groups.

**Checks.**

- The constants C(R) and D(R) are uniform in ℓ for the fixed system R, not universal across systems. Cyclotomic powers have arbitrarily large Hodge exponents.
- Published BLGGT p.576 cites Conrad–Chai–Oort 2013 Lemma 3.7.7 where v4 cites the 2009 Proposition 6.3. These original proofs remain supplier leaves; the edition change must be preserved.


**Acceptance.**

- Check (2) on the cyclotomic character: θ_l is the identity on 𝔾_m and agrees with ε_l ∘ Art on all of ℤ_l^× (ε_l crystalline).

**Sources.** blggt-2014-v4, §5.2, Lemma 5.2.1 and proof, pp. 66–67 (arXiv v4): Lemma 5.2.1 (1)–(4) and its proof.


### Density-one sets of good primes for a rational system (BLGGT v4 Proposition 5.2.2, after Larsen)

**Target:** R24.5/larsen-good-primes. **Kind:** theorem.

There is a set L of rational primes of Dirichlet density 1 such that for l ∈ L: (1) G⁰_l, hence Z_l, C_l, G^sc_l and H_l, are unramified (tori Z̃_l, C̃_l over ℤ_l); (2) there is a semisimple group scheme G̃^sc_l/ℤ_l with generic fibre G^sc_l and Γ^H_l = G̃^sc_l(ℤ_l) × Γ^Z_l (put H̃_l = G̃^sc_l × Z̃_l); (3) [Z̃_l(ℤ_l) : Γ^Z_l] is bounded independently of l; (4) the conjugation action of Γ_l on H_l extends uniquely to H̃_l, making V_l an H̃_l ⋊ Γ_l-module; (5) V_l contains an H̃_l ⋊ Γ_l-invariant ℤ_l-lattice; (6) there is an unramified M_λ/Q_l of bounded degree over which the G^sc_l-irreducible subquotients of V_l ⊗ Q̄_l are defined; for V_l ⊗ M_λ = ⊕V_{λ,i} (isotypic parts) and any H̃_l-invariant O_{M_λ}-lattice Λ, Λ = ⊕(Λ ∩ V_{λ,i}), and all irreducible G̃^sc_l(ℤ_l)-subquotients of Λ ∩ V_{λ,i} are absolutely irreducible, isomorphic to ρ̄_i, of dimension that of an irreducible constituent of V_{λ,i}, with ρ̄_i ≅ ρ̄_j only if i = j.

**Hypotheses and scope.**

- ℛ = (ℚ, S, {Q_v}, {r_l}, {H_τ}) a weakly compatible system with rational coefficients, r_l : G_F → GL_n(Q_l), V_l its space (BLGGT v4 §5.2); every construction below depends on ℛ.

**Construction or proof.**

- (1): Larsen–Pink Proposition 8.9 (cited); T_l splits over an unramified extension of bounded degree.
- (2): Larsen Theorem 3.17 (cited) gives G̃^sc_l with Γ^H_l ∩ G^sc_l(Q_l) = G̃^sc_l(ℤ_l), maximal compact, so Γ^H_l = G̃^sc_l(ℤ_l) × Γ^Z_l with Γ^Z_l open in Z̃_l(ℤ_l).
- (3): Γ^C_l ⊇ θ_l(S̃(ℤ_l)) for l crystalline and unramified in F⁰; serre-theta-uniform-bounds (4) and Lemma A.1.6 bound [C̃_l(ℤ_l) : Γ^C_l] by D(ℛ), so [Z̃_l(ℤ_l) : Γ^Z_l] ≤ A(n)⁴D(ℛ).
- (4): γG̃^sc_l and G̃^sc_l are the group schemes of special points of the Bruhat–Tits building with the same ℤ_l-points, hence equal (BT84 5.1.40, 5.2.8; cited).
- (5): Larsen §1.12: an H̃_l(ℤ_l^nr)-invariant lattice, summed over Γ_l-translates.
- (6): highest weights bounded in the fundamental-weight basis, so for large l they are restricted and the reductions ρ̄_{µ_i} are absolutely irreducible and distinct (Larsen §1.13); a simple-quotient argument splits Λ along the isotypic decomposition.

**Required contracts.** PotentialModularityAndCompatibleSystems:R24.5/larsen-rational-system-groups, PotentialModularityAndCompatibleSystems:R24.5/serre-theta-uniform-bounds.

**Checks.**

- The simply connected group’s integral model gives the full hyperspecial ℤ_ℓ points in the lifted image. An arbitrary Zariski-dense subgroup is not sufficient.
- The central index bound, conjugation extension, invariant lattice, bounded unramified coefficient degree and distinct irreducible residual types are all needed, not just unramifiedness of G⁰_ℓ.
- BLGGT’s proof is read; original Larsen/Larsen–Pink, Bogomolov, Serre, Conrad–Chai–Oort and Bruhat–Tits inputs are not claimed as independently proved.


**Acceptance.**

- Check the use downstream: (6) is what makes the constituents of r̄_λ restricted to G̃^sc_l(ℤ_l) irreducible and distinct in residual-irreducibility-density-one.
- Check that (3) is not used downstream (BLGGT's own remark) and is recorded for completeness.

**Sources.** blggt-2014-v4, §5.2, Proposition 5.2.2 and proof, pp. 68–70 (arXiv v4): Proposition 5.2.2 (1)–(6) and its proof.


### Residual irreducibility over F(ζ_l) for a density-one set of primes

**Target:** R24.5/residual-irreducibility-density-one. **Kind:** theorem.

Let ℛ be a regular weakly compatible system of l-adic representations of G_F defined over M (BLGGT v4 Proposition 5.3.2). For a subrepresentation s of r_λ write s̄ for the semisimplification of its reduction and l for the rational prime below λ. There is a set L of rational primes of Dirichlet density 1 such that if s is an irreducible subrepresentation of r_λ with λ above an element of L, then s̄|_{G_{F(ζ_l)}} is irreducible.

**Hypotheses and scope.**

- ℛ = (M, S, {Q_v(X)}, {r_λ}, {H_τ}) a weakly compatible system of l-adic representations of G_F of rank n (R24.5/weakly-compatible-system-rank-n); ı : M ↪ ℂ.
- ℛ regular.

**Construction or proof.**

- Use monodromy-component-field (v4 Lemma 5.3.1) to enlarge M once and obtain a common component field, multiplicity-free constituents under open subgroups and integral coefficient models. Form the rational-coefficient system by restriction of scalars and summing coefficient embeddings, adjoining the cyclotomic character.
- Apply larsen-good-primes (v4 Proposition 5.2.2) and serre-theta-uniform-bounds to obtain a density-one set with unramified component/coefficient fields, hyperspecial simply connected image and bounded central exponents. Remove the finite primes excluded by the fixed exponent bound.
- On the simply connected image the lattice constituents reduce irreducibly and remain distinct. If two central characters agree on the kernel of the residual cyclotomic character, the bounded digit calculation in v4 Proposition 5.3.2 shows they differ by a cyclotomic power.
- Apply Clifford induction from a connected-component constituent. A finite-order conjugation returning to that constituent forces the possible cyclotomic power to be zero in the bounded range; the remaining distinct conjugates give an irreducible induced reduction on G_{F(ζ_ℓ)}. This applies to every irreducible subrepresentation of every member above the chosen rational-prime set.

**Required contracts.** PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates, PotentialModularityAndCompatibleSystems:R24.5/weakly-compatible-system-rank-n, PotentialModularityAndCompatibleSystems:R24.5/monodromy-component-field, PotentialModularityAndCompatibleSystems:R24.5/larsen-good-primes.

**Checks.**

- The source at the checked edition is v4 Proposition 5.3.2 (published pp.581–584), not v4 Proposition 5.2.2, which is its integral monodromy input.
- Quantify over every irreducible subrepresentation s of every r_λ above the selected rational-prime set, and then restrict its semisimplified reduction to G_{F(ζ_ℓ)}. The conclusion is not cofinite.


**Acceptance.**

- Check the case n = 1: every s̄ is a character, so the conclusion holds with L the set of all primes.
- Check that the conclusion is the residual hypothesis of BLGGT v4 Theorem 5.5.1 (2), ¯r|_{G_{F(ζ_l)}} irreducible, for every irreducible constituent s and not only for r_λ, and that it is asserted only on a density-one set of l: this is the precise condition under which irreducibility passes to reductions that R24.5:operations records.
- Check the dependencies: Larsen 1995 (1.12–1.13, 2.6, 3.15, 3.17) and Larsen–Pink 6.14 are recorded as gaps, not proved here.

**Sources.** blggt-2014-v4, §5.3, Proposition 5.3.2, p. 71 (arXiv v4): v4 Proposition 5.3.2 (= v1 Proposition 5.2.2), whose proof now runs through v4 Proposition 5.2.2 (larsen-good-primes).


### Constituents of an essentially conjugate self-dual system

**Target:** R24.5/constituents-essentially-self-dual. **Kind:** lemma.

Let F be an imaginary CM field, (ℛ,ℳ) a pure, extremely regular polarized weakly compatible system, F′/F a finite extension and s an irreducible subrepresentation of r_λ|G_F′. There is a CM field F″ with F⊆F″⊆F′ such that s is invariant under G_F″ and (s, μ_λ|G_F″⁺) is a polarized representation; it is totally odd when (ℛ,ℳ) is. The field is a CM descent field, not an arbitrary totally-real intermediate field. Purity and extreme regularity force the selected Hodge subset to be stable under the polarized duality.

**Hypotheses and scope.**

- F imaginary CM (BLGGT v4 Lemma 5.4.5; v1 Lemma 5.2.3 allowed F CM or totally real); (ℛ, ℳ) polarized; ℛ pure and extremely regular; s irreducible, which the last step of the proof uses.

**Construction or proof.**

- Choose τ so that distinct equal-size subsets of H_τ have distinct sums (extreme regularity) and τ₁ on the normal closure F₁ of F′/F⁺; submodules of the same dimension are equal iff the Hodge–Tate numbers of their determinants agree, so constituents have multiplicity one.
- Purity gives h_σ + h_{σc} = w dim s, so s^{σcc′} = s^σ; the group generated by products cc′ of complex conjugations cuts out the maximal CM subfield F″ of F′, and s extends to G_{F″}.
- Comparing Hodge–Tate numbers, s^c ≅ μ_λ s^∨, realised by restricting the pairing matrix A_{λ,v}; this gives the parity statement.

**Required contracts.** PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates, PotentialModularityAndCompatibleSystems:R24.5/linear-algebra-operations-on-systems, PotentialModularityAndCompatibleSystems:R24.5/polarized-system.

**Checks.**

- The constituent is invariant as a subspace under the CM descent field’s Galois group, which gives its actual extension. Invariance of its isomorphism class alone could leave a descent obstruction.
- Use the maximal CM intermediate field of F′/F. Extreme regularity singles out the Hodge subset by determinant weight; the inherited pairing restricts perfectly and retains total oddness.


**Acceptance.**

- Check that extreme regularity, not only regularity, is what is used: it separates equal-dimensional submodules by the Hodge–Tate numbers of their determinants, which gives multiplicity one of the constituents of r_λ|_{G_{F₁}}.
- Check the output against R24.5/linear-algebra-operations-on-systems: restriction to G_{F′} may break irreducibility, and the lemma records what survives for polarized systems (each constituent descends to a CM field F″ ⊆ F′ and stays essentially conjugate self-dual with the same μ_λ, totally odd if (r_λ, μ_λ) is).

**Sources.** blggt-2014-v4, §5.4, Lemma 5.4.5 and proof, p. 76 (arXiv v4): Correct CM base, irreducible constituent, actual polarization and total-oddness hypotheses.


## R24.5 — families from potential modularity

The input is a supplied lift with a potential-modularity witness in R23.4's
precise scope, or another expressly cited theorem supplying that witness.
R24.3 owns the four prescribed KW lift constructions. Their existence is not
proved by operations on a compatible system. The following construction uses
continuous finite-index induction and the arithmetic Grothendieck ring, with
norm one as its genuineness certificate.


### The compatible system through a potentially modular lift, by Brauer induction

**Target:** R24.5/brauer-induction-system. **Kind:** construction.

Given a continuous odd rank-two lift over ℚ, a totally real finite Galois potential-modularity field F on which it is absolutely irreducible, compatible cuspidal Hilbert descents to the solvable intermediate fields, and the λ-independent overlap Hom-character contract requested from R17.6, choose a finite Brauer identity 1=Σ n_i Ind χ_i for Gal(F/ℚ). After one finite coefficient enlargement define A_λ=Σ n_i[Ind(χ_i⊗r_{i,λ})] in Rep_{ℚ,ℓ}. Mackey and Frobenius reciprocity identify its Hom norm with the fixed p-member’s norm, hence with one; its dimension is two. Thus A_λ is the class of a genuine absolutely irreducible rank-two continuous finitely ramified representation. Its restriction to each specified solvable subfield is the compatible Hilbert member, and good Frobenius polynomials are common and determine the output up to isomorphism independently of the Brauer choices. A virtual rank-two identity alone gives no genuineness conclusion.

**Hypotheses and scope.**

- Finite totally real Galois F/ℚ; the supplied lift remains absolutely irreducible over F, ensuring cuspidal solvable descent and the irreducible-overlap pairing computation.
- The automorphic families and finite-order characters have a common finite coefficient field after enlarging it; the output family is indexed by its places/embeddings, not unrelated fields at different ℓ.

**Construction or proof.**

- Import finite Brauer induction and solvable cuspidal descent. Choose a common number field containing all finitely many Hecke fields and character values.
- Form the virtual class A_ι=Σn_i Ind(χ_i⊗ρ_{π_i,ι}). Mackey and Frobenius reciprocity express (A_ι,A_ι) using overlap fields F_i·gF_j. The two overlap members restrict to the same irreducible family over F, so their Hom line carries the same finite descent character at every ι, identified from the original p-member by Frobenius recognition. Hence every pairing summand is independent of ι.
- At p the Brauer identity gives A_p=[ρ], so (A_ι,A_ι)=1 and dim A_ι=2 for all ι. The representation-ring criterion yields a genuine irreducible; degree two by itself cannot do so.
- Trace identities give the common Frobenius polynomials and independence of choices. Repeat the overlap comparison to identify restrictions to every solvable intermediate field. Local descent is then handled separately in the almost-strict and strict-compatibility theorems.

**Required contracts.** PotentialModularityAndCompatibleSystems:R24.5/compatible-system, PotentialModularityAndCompatibleSystems:R24.5/system-operations, GL2AutomorphicRepresentationsAndTransfer:R17.4/solvable-base-change, GL2AutomorphicRepresentationsAndTransfer:R17.4/solvable-descent, GL2AutomorphicRepresentationsAndTransfer:R17.4/tower-independence, PotentialModularityAndCompatibleSystems:R23.4, ArithmeticGaloisRepresentations:R01.5, PotentialModularityAndCompatibleSystems:R24.5/galois-grothendieck-ring, AutomorphicGaloisRepresentations:R19.3/fixed-eigenform-compatible-family, AutomorphicGaloisRepresentations:R19.2/hilbert-uniqueness-determinant-oddness-irreducibility, AutomorphicGaloisRepresentations:R19.4/all-hilbert-local-global-compatibility, GL2AutomorphicRepresentationsAndTransfer:R17.6, tauceti:TauCetiRoadmap/RepresentationTheory/InductionRestriction#layer-6-the-virtual-character-ring-artin-and-brauer-induction, AutomorphicGaloisRepresentations:R19.2/hilbert-normalisation-dictionary.

**Checks.**

- Choose the number field E once: it contains the finitely many Hilbert coefficient fields, the finite Brauer character values, and the normalization data. No compositum over all coefficient primes is taken.
- Write A_λ=Σ_i n_i[Ind(χ_i⊗r_{i,λ})] in the arithmetic Grothendieck ring. The existing R17.6 compatible-descent theorem fixes a character in a cyclic descent fibre; it does not by itself identify every Mackey overlap Hom line.
- Require the exact overlap identification: over each conjugated compositum F_i(σF_j), the Hom line between the relevant restrictions carries a finite descent character whose identification is independent of λ and agrees with the fixed p-member. This is the R17.6 request. Frobenius reciprocity and Mackey then give (A_λ,A_λ)=1.
- Dimension A_λ=2 and norm one force a positive irreducible class. Dimension two alone is insufficient: 3·1−ε for C₂ has norm ten.
- Absolute irreducibility on F and the compatible cuspidal descents are arithmetic hypotheses, not consequences of a virtual character identity.

**API.**

- **TauCeti.CompatibleSystems.brauerSystem** (constructor): ρ_ι = Σ n_i Ind(χ_i ⊗ ρ_{π_i,ι}) from the Brauer data and the base-changed π_i

- **TauCeti.CompatibleSystems.brauerSystem_isTrue** (characterisation): The virtual class has dimension 2 and norm-one pairing, hence is the class of a genuine absolutely irreducible member.

- **TauCeti.CompatibleSystems.brauerSystem_trace** (compatibility): After mapping the common algebraic trace into both coefficient fields, all good Frobenius characteristic polynomials agree with the given p-member; no direct equality between ℓ-adic and p-adic values is asserted.

- **TauCeti.CompatibleSystems.brauerSystem_unique** (extensionality): Uniqueness memberwise up to representation isomorphism after a common coefficient extension; no canonical basis, lattice or conjugating matrix is asserted.

- **TauCeti.CompatibleSystems.brauerSystem_restrict** (compatibility): restriction to G_{F′} with F/F′ solvable is automorphic


**Unit tests.**

- **brauer_trivial_F** (degenerate): F = ℚ: 1_G = Ind 1, and ρ_ι = ρ_{π,ι} is the system of π itself

- **brauer_quadratic_coefficients** (computation): G = ℤ/2: the regular character (2, 0) minus the sign character (1, −1) is the trivial character (1, 1), i.e. 1_G = Ind_1^G 1 − ε

- **brauer_virtual_nonexample** (non-example): the virtual character 3·1 − ε of ℤ/2 has degree 2 but value 4 at the generator, more than its degree, so it is not a character: degree 2 alone does not make a virtual representation true

- **brauer_trace_agreement** (compatibility): For the geometric/dual family of a non-CM elliptic curve E/ℚ with F=ℚ, the construction returns the given automorphic cohomological family (or its KW-normalized dual) memberwise up to isomorphism.


**Acceptance.**

- Check the degenerate case of solvable Gal(F/ℚ): Brauer's theorem is not needed, F_i = ℚ, and ρ_ι is the system of the form over ℚ obtained by solvable descent
- Check that the Hodge–Tate weights of ρ_ι are those of ρ

**Uses.** PotentialModularityAndCompatibleSystems:R24.5/almost-strict-compatibility: the system whose compatibility is proved; PotentialModularityAndCompatibleSystems:R24.5/kw-theorem-5-1-systems: the systems of KW I Theorem 5.1; PotentialModularityAndCompatibleSystems:R24.5/dieulefait-families: Dieulefait's families for a given lift.

**Sources.** kw-serre-modularity-II, §10.3.2, p. 93 of the preprint: The construction; kw-serre-modularity-II, §10.3.2, p. 93 of the preprint: True representations; khare-level-one, §3, proof of Proposition 3.1, pp. 16–17 of arXiv:math/0504080v1 (KW II cite it as the proof of Theorem 5.1 of the Duke version): Genuineness by inner-product computation; the norm-one step is expanded here.


### The Brauer system is almost strictly compatible

**Target:** R24.5/almost-strict-compatibility. **Kind:** theorem.

For the Brauer system with its stated input contracts, KW almost strictness gives the following fixed local parameter r_q. Away from the coefficient characteristic, WD comparison retains full monodromy. At q=ℓ≠2 with unramified r_q, the member is crystalline with the fixed weights. At q=ℓ with irreducible semisimplified residual member, potential semistability and WD comparison follow through the Kisin input, using a potential-modularity field disjoint from the residual kernel. These are the historical KW II §10.3.2 cases. No omitted ramified reducible or dyadic case follows from this contract. The separate strict-brauer-system theorem supplies all-place strictness by the full Skinner theorem.

**Hypotheses and scope.**

- (c) needs ρ̄_ι irreducible, because Kisin's theorem does; this is the whole difference between almost strict and strict
- the case q = ℓ = 2 with r_q unramified and ρ̄_ι reducible is not covered

**Construction or proof.**

- (a) Carayol and Taylor's local-global compatibility over F(q) (AutomorphicGaloisRepresentations R19.2, R19.4).
- (b) Breuil and Berger give the historical unramified coefficient-prime case. The modern route imports R19.5/skinner-full-hilbert-coefficient-prime and the R19.2 normalization dictionary, which cover the even-degree Hilbert fields without a finite discrete-series place as well as the restricted Saito cases.
- (c) Kisin, with F′ from potential modularity chosen linearly disjoint from ker ρ̄_ι (KW II Theorem 6.1(iii)(d), R23.5).

**Required contracts.** PotentialModularityAndCompatibleSystems:R24.5/brauer-induction-system, AutomorphicGaloisRepresentations:R19.5/potential-semistability-and-compatibility-at-the-coefficient-prime, PotentialModularityAndCompatibleSystems:R24.5/compatible-system, AutomorphicGaloisRepresentations:R19.3/fixed-eigenform-compatible-family, AutomorphicGaloisRepresentations:R19.2/hilbert-uniqueness-determinant-oddness-irreducibility, AutomorphicGaloisRepresentations:R19.4/all-hilbert-local-global-compatibility, PotentialModularityAndCompatibleSystems:R23.5, AutomorphicGaloisRepresentations:R19.5/skinner-full-hilbert-coefficient-prime, AutomorphicGaloisRepresentations:R19.2/hilbert-normalisation-dictionary.

**Checks.**

- Retain the three historical coefficient cases exactly. Residually reducible ramified odd members and the missing dyadic members are not covered by the KW contract.
- The all-place improvement uses a separate Skinner import; it is not a claim that Kisin’s historical residual guard disappears.


**Acceptance.**

- Check each case against R24.5/compatible-system's almost strict predicate
- Check that KW II's remark withdrawing strictness (Wintenberger, Documenta 2006) is reflected: only almost strictness is claimed

**Sources.** kw-serre-modularity-II, §10.3.2, p. 93: (a); kw-serre-modularity-II, §10.3.2, p. 94: (b); kw-serre-modularity-II, §10.3.2, p. 94: (c); kw-serre-modularity-II, §10.3.2, p. 93: The authors' correction of the earlier strictness claim.


### Strict compatibility of the Brauer system

**Target:** R24.5/strict-brauer-system. **Kind:** theorem.

For the rank-two Brauer system of R24.5/brauer-induction-system arising from holomorphic cuspidal Hilbert modular forms of motivic weights k_τ≥2, the members are geometric of the same Hodge–Tate weights and WD(ρ_ι|D_q)^Fss is the fixed r_q at every finite q, including q=ℓ and reducible residual members. Hence it is KW strictly compatible. For q=ℓ unramified r_q, every member is crystalline of the common weights (a de Rham representation is crystalline iff inertia acts trivially on its WD parameter and N = 0, PadicHodgeTheory R06.3). If the Hilbert modular families are pure of weight w in the geometric convention, the descended system is pure of weight w; local strict purity is transported through the same local comparison and local–global purity supplier.

**Construction or proof.**

- For a prime q choose F(q), the fixed field of its decomposition subgroup in Gal(F/ℚ). That subgroup is solvable, so the descended member over F(q) is supplied by solvable descent. The chosen completion F(q)_v is ℚ_q, allowing its local representation to be identified with the original D_q representation.
- Away from ℓ apply R19.4/all-hilbert-local-global-compatibility; at q=ℓ apply R19.5/skinner-full-hilbert-coefficient-prime to the descended motivic Hilbert form. Transport both through R19.2/hilbert-normalisation-dictionary to the KW arithmetic member. Skinner’s theorem has no residual condition; the supplier also corrects its printed Hodge-degree shift (AutomorphicGaloisRepresentations/E4).
- Potential semistability plus an unramified WD parameter (including N=0) gives crystallinity. The Hilbert eigenvalues/Hodge weights yield global purity; local monodromy purity is a separate R34.6/R19.4 supplier, not inferred merely from good primes.

**Required contracts.** PotentialModularityAndCompatibleSystems:R24.5/brauer-induction-system, AutomorphicGaloisRepresentations:R19.5/skinner-full-hilbert-coefficient-prime, AutomorphicGaloisRepresentations:R19.4/all-hilbert-local-global-compatibility, WeightsInEtaleCohomology:R34.6, PadicHodgeTheory:R06.3/plan/weil-deligne-descent, AutomorphicGaloisRepresentations:R19.2/hilbert-normalisation-dictionary, AutomorphicGaloisRepresentations:R19.3/monodromy-weight-purity-of-the-family.

**Checks.**

- For each q choose the decomposition field F(q) at a prime of F above q; its local completion is ℚ_q and F/F(q) has solvable local decomposition group. Identify the restriction with the relevant Hilbert member, then apply both all-place local exports.
- Full Skinner plus away-coefficient local-global compatibility supplies KW strictness, including reducible residual members and ℓ=2. Purity is an additional input, not a consequence of equal WD parameters.
- Use R19.3/monodromy-weight-purity-of-the-family for the general local Hilbert input. The R34.6/hilbert-local-monodromy-weight-export is Saito’s restricted geometric theorem, with its degree/discrete-series guards; it cannot be substituted wholesale. A general R34.6 purity export remains an exact request, consistent with its owner move.
- Transport geometric purity through the R19.2 dual/twist dictionary before quoting an arithmetic polynomial or weight. Unramified means N=0 as well as trivial inertia.


**Acceptance.**

- Verify the stated hypotheses and the supplier interfaces; no existence or automorphy endpoint is assumed.

**Sources.** kw-serre-modularity-II, §10.3.2, pp.93–94: The decomposition-field local descent argument in KW; the complete coefficient-prime input is supplied by Skinner separately; skinner-2009, Theorem 1 and conventions, pp.241–244; selected proof fragment pp.254–255; full proof imported from R19.5: Full coefficient-prime compatibility for motivic Hilbert forms, without residual irreducibility; blggt-2014-v4, §2.1 Theorem 2.1.1, pp.33–34; §5.1 pp.62–63: Automorphic WD/Hodge purity for polarized motivic Hilbert families. Combined with Skinner and decomposition-field descent; no all-place coefficient theorem is inferred just from BLGGT strictness.


### KW I Theorem 5.1: almost strictly compatible systems through prescribed lifts

**Target:** R24.5/kw-theorem-5-1-systems. **Kind:** theorem.

Let ρ̄ satisfy KW I Theorem 5.1's hypotheses. For each i ∈ {1, 2, 3, 4} (with the conditions of that type) there are a number field E and an E-rational almost strictly compatible, irreducible, odd system (ρ_ι) lifting ρ̄ whose p-adic member is a lift of required type (i). In case (3), if the residual representation ρ̄_q is irreducible it has Serre weight i + 2 or q + 1 − i up to twist; in case (4), if q is odd and ρ̄_q is irreducible, its weight is q + 1 − (i − j) or i − j when i > j + 1, and q when i = j + 1 (Savitt, Corollary 6.15 and Remark 6.17). With the imported Skinner theorem the same constructed system is strictly compatible; the almost-strict conclusion is the source-faithful KW variant. Good Frobenius polynomials lie in one finite coefficient field and the geometric normalized family is pure by strict-brauer-system.

**Hypotheses and scope.**

- the residual weight computations (3), (4) use almost strict compatibility at q and Savitt's computations of reductions of potentially Barsotti–Tate representations of tame type (requested)
- when the new residual characteristic q is 2 (KW I §9: case (4) with p = 3, q = 2 and characters of order 3) Savitt's paper does not apply, which is why the proof of KW I Theorem 9.1 gives an ad hoc argument that k(ρ̄′₂) = 2
- F. Diamond's list: the possible (i, j) are j = m(q + 1)/p^r − 1, i = q − 1 − j for 0 < m < p^r/2, so i = j + 1 does not occur

**Construction or proof.**

- The p-adic lift of type (i) (R24.3).
- Potential modularity of the lift over a Galois F, via Theorem 9.7 as in the proof of Theorem 10.1.
- The Brauer system and its almost strict compatibility.
- Residual weights at q from almost strict compatibility and Savitt (and Saito for (4)).

**Required contracts.** PotentialModularityAndCompatibleSystems:R24.3/theorem-5-1-part-1-minimal-crystalline, PotentialModularityAndCompatibleSystems:R24.3/theorem-5-1-part-2-weight-two, PotentialModularityAndCompatibleSystems:R24.3/theorem-5-1-part-3-level-one-type-at-q, PotentialModularityAndCompatibleSystems:R24.3/theorem-5-1-part-4-level-two-type-at-q, PotentialModularityAndCompatibleSystems:R24.5/brauer-induction-system, PotentialModularityAndCompatibleSystems:R24.5/almost-strict-compatibility, AlgebraicModularFormsAndSerreWeights:R15.4, PotentialModularityAndCompatibleSystems:R24.5/strict-brauer-system.

**Checks.**

- The four lift types are the existing R24.3 nodes, not new lift-existence targets. Each branch retains its original p, residual-image, q, determinant and inertial-type hypotheses.
- Savitt Corollary 6.15 and Remark 6.17 are checked at odd q. Their semisimplified tame nonscalar reduction survives removal of the local trivial-endomorphism hypothesis; a full nonsplit lattice classification needs stronger local input. Global irreducibility does not imply that local hypothesis.
- For the Diamond sublist set j=m(q+1)/p^r−1 and i=q−1−j with 0<m<p^r/2 and the specified integrality. Then i−j=q+1−2m(q+1)/p^r>0; equality to 1 would require p^r=(q+1)(p^r−2m), impossible when p^r | q+1 and (q+1)/p^r>1. Keep these actual divisibility conditions, rather than asserting a free inequality.
- The dyadic case uses KW I §9.1 p.19’s odd-ramification finite-flat argument. Savitt’s odd-prime formula is not applied at q=2.


**Acceptance.**

- Check Diamond's list on p = 3, q = 5: r = v₃(6) = 1, m = 1 gives j = 1, i = 3
- Check that the system is odd and irreducible (each member irreducible, Taylor)

**Sources.** kw-serre-modularity-I, Theorem 5.1, p. 9 of the preprint: The theorem; kw-serre-modularity-I, Remark after Theorem 5.1, p. 10: Savitt; kw-serre-modularity-II, §10.3.2, p. 94: Residual weights; kw-serre-modularity-I, Proof of Theorem 9.1, p. 19 of the preprint: No Savitt input in residual characteristic two; savitt-2005, Corollary 6.15 p.38; proof and Remark 6.17 p.39 of the arXiv/corrected author PDFs: Odd-prime tame nonscalar residual semisimplifications and the qualification concerning local endomorphisms; the Serre-weight adapter stays with R15.4.


### Dieulefait: a given lift lies in an almost strictly compatible system (DP Theorem 1.11)

**Target:** R24.5/dieulefait-families. **Kind:** theorem.

Dieulefait–Pacetti Theorem 1.11 states: let ρ : G_ℚ → GL₂(K_λ) be odd, irreducible, continuous, finitely ramified and de Rham at p with Hodge–Tate weights {0, k − 1}, k > 1, with ρ̄|_{G_{ℚ(ζ_p)}} absolutely irreducible (non-solvable image if p = 2); then ρ is part of a rank-2 almost strictly compatible system in the sense of DP Definition 1.10 (condition (6) relaxed only at residually reducible coefficient primes with ramified WD_p(ℛ), or p = 2; every member de Rham at its coefficient prime). This packet plans it for the lifts in the scope of R23.4: after a twist ρ̄ satisfies KW I Theorem 5.1's hypotheses, and ρ is of type (A), (B) or (C) at p (for p = 2: crystalline of weight 2, or semistable of weight 2 when ρ̄ is not finite at 2). These include the minimal crystalline lifts of DP Theorem 1.9(1)–(3) and the weight-two lifts of DP Theorem 1.9(4) that are crystalline or Steinberg at p, or of KW type (B). Proof: potential modularity of the given lift (R23.4) over a totally real Galois F, then the Brauer system and its almost strict compatibility (R24.5). In this scope strict-brauer-system upgrades the family to KW strict compatibility, which also gives DP's de Rham condition at every member. The rest of DP's statement is a recorded gap: weight-two lifts of DP Theorem 1.9(4) whose type at p is potentially Barsotti–Tate of another inertial type need potential modularity through a potentially Barsotti–Tate lifting theorem over totally real fields, and general de Rham lifts (k > p + 1, or potentially semistable of weight > 2) need potential modularity of arbitrary regular de Rham lifts. Neither is supplied by R23.4, and DP's citation [Die04, Theorem 1.1] does not cover them (source issue PotentialModularityAndCompatibleSystems/E5).

**Hypotheses and scope.**

- it is a statement about a given lift, not about the existence of one: the lift is supplied (by R24.3 or otherwise)
- Dieulefait 2004 (arXiv math/0304433v1, Theorem 1.1) assumes ρ crystalline at an odd q with Hodge–Tate weights {0, w}, w odd and q ≥ 2w + 1; the proof planned here is KW II's §10.3.2 argument applied to a given lift, not Dieulefait's
- DP's almost strict systems require every member to be de Rham at its coefficient prime; KW's almost-strict definition does not, so the planned conclusion is stated through the strict upgrade

**Construction or proof.**

- R23.4: ρ|_{G_F} modular for some totally real Galois F.
- R24.5/brauer-induction-system and R24.5/almost-strict-compatibility.

**Required contracts.** PotentialModularityAndCompatibleSystems:R23.4, PotentialModularityAndCompatibleSystems:R24.5/brauer-induction-system, PotentialModularityAndCompatibleSystems:R24.5/almost-strict-compatibility, PotentialModularityAndCompatibleSystems:R24.5/strict-brauer-system.

**Checks.**

- The checked construction has the R23.4 A/B/C input scope. The full arbitrary regular de Rham conclusion of DP Theorem 1.11 is an explicit request to R23.4, not established here.
- Dieulefait 2004 Theorem 1.1 assumes an odd coefficient prime q, crystallinity, an odd positive difference w, and q≥2w+1. It does not supply arbitrary regular de Rham potential modularity.
- For the covered scope, the strict Brauer theorem supplies DP’s all-member de Rham condition. A KW almost-strict conclusion alone would not supply it.


**Acceptance.**

- Check that de Rham with Hodge–Tate weights {0, k − 1} is what R23.4 needs
- Check the p = 2 hypothesis (non-solvable image) against R23.4
- Check that every application of DP Theorem 1.11 in DP §2 (the minimal crystalline lifts of Theorem 1.9(3) at the start of §2 and in Pasos 3 and 6, and the weight-two lifts of Theorem 1.9(4) in Pasos 1 and 6) is either in R23.4's scope or covered by the recorded gap.

**Sources.** dieulefait-pacetti, Theorem 1.11, p. 7 of the arXiv version: The statement; dieulefait-pacetti, Proof of Theorem 1.11, p. 7 of the arXiv version: Attribution to Dieulefait 2004, whose Theorem 1.1 is narrower (E5); dieulefait-pacetti, Definition 1.10(4), p. 7 of the arXiv version: DP's systems are de Rham at every member; dieulefait-2004, Theorem 1.1, pp. 1–2 of arXiv:math/0304433v1: The hypotheses of the theorem DP cite.


## R24.6 — changing residual characteristic

Changing λ changes the stable lattice and its reduction. Common good
polynomials identify characteristic-zero members, while residual conductor,
weight and image hypotheses must be rechecked at the new characteristic. The
local assertions below are the input adapters for the already owned lifting
theorems. A residual link alone is no modularity-lifting theorem.


### Residual members of a compatible system

**Target:** R24.6/residual-members. **Kind:** lemma.

Let (ρ_ι) be an E-rational almost strictly compatible, irreducible, odd two-dimensional system of G_ℚ with weights (a, b), and ρ̄_ι the semisimplified reductions. (i) det ρ̄_ι is the reduction of det ρ_ι, and ρ̄_ι is odd. (ii) ρ̄_ι is absolutely irreducible for every ι above all but finitely many primes ℓ (KW I, proof of Theorem 10.1, which uses that the conductor of ρ_ι is bounded independently of ι and that the Hodge–Tate weights are fixed; KW I §8.4 uses it). If moreover a ≠ b, then for all but finitely many ℓ also ρ̄_ι|_{G_{ℚ(ζ_ℓ)}} is absolutely irreducible: for ℓ outside the ramification set with ℓ > 2(a − b) + 1, (v) gives k(ρ̄_ι) = a − b + 1 up to twist, while KW I Lemma 6.2(ii) would force a − b + 1 ∈ {(ℓ + 1)/2, (ℓ + 3)/2} if the restriction were reducible. For regular weakly compatible systems of any rank over any number field, R24.5/residual-irreducibility-density-one gives the restriction statement for every irreducible constituent, but only on a Dirichlet-density-one set of ℓ. (iii) For q ≠ ℓ, the Artin conductor of ρ̄_ι at q divides that of r_q, so N(ρ̄_ι) divides the prime-to-ℓ conductor of the system; the prime divisors of N(ρ̄_ι) are among the ramified primes of the system other than ℓ. (iv) If ρ(I_q) is finite of order prime to ℓ (for instance a dihedral group of order 2t^a with ℓ∤2t), reduction is injective on it, so ρ̄_ι|_{I_q} has the same shape. (v) If ℓ is outside the ramification set and ℓ ≠ 2, then ρ_ι is crystalline at ℓ. If additionally ρ̄_ι is of S-type and 1≤a−b≤ℓ−2, its normalized Serre weight is a−b+1 after twisting (Fontaine–Laffaille). Equal weights are excluded from this formula: an odd absolutely irreducible Artin member unramified at ℓ has normalized residual Serre weight ℓ, rather than 1.

**Hypotheses and scope.**

- (ii) is the argument KW I give at the start of the proof of Theorem 10.1; its restriction clause uses KW I Lemma 6.2(ii) and (v), and is a statement about this rank-two setting. The BLGGT density-one theorem is the general-rank statement and is not needed for (ii)
- (iv) is the reduction step in the proof of KW I Lemma 6.3
- (v) requires a positive Hodge–Tate difference in the Fontaine–Laffaille range and an S-type residual representation for the Serre-weight assertion. The zero difference and endpoint cases require their separate local recipes.

**Construction or proof.**

- (i), (iii): reduction of a lattice; conductors only drop under reduction (ArithmeticGaloisRepresentations R01.3).
- (ii): for ℓ ≫ 0 the member at ℓ is crystalline with Hodge–Tate weights (a, b) in the Fontaine–Laffaille range (plain compatibility), so a reducible ρ̄_ι^ss is a sum of two characters whose restrictions to I_ℓ are the powers of the cyclotomic character attached to a and b and whose prime-to-ℓ conductors divide the fixed conductor of the system. Only finitely many pairs of Dirichlet characters occur, so if infinitely many ι were residually reducible, one pair would give a congruence of all good Frobenius traces modulo infinitely many λ, hence an equality of traces in E, and Brauer–Nesbitt with Chebotarev (ArithmeticGaloisRepresentations R01.5) would make ρ_ι reducible. The restriction to G_{ℚ(ζ_ℓ)} follows from (v) and KW I Lemma 6.2(ii).
- (iv): the kernel of GL₂(𝒪) → GL₂(𝔽) is pro-ℓ.
- (v): almost strict compatibility gives crystallinity outside the fixed ramification set for odd ℓ. The positive-difference Fontaine–Laffaille comparison is R15.4/fontaine-laffaille-weight-comparison; its extension-sensitive local input remains the R07 supplier obligation. For zero difference, use the unramified branch of Serre’s recipe, which assigns weight ℓ.

**Required contracts.** PotentialModularityAndCompatibleSystems:R24.5/compatible-system, ArithmeticGaloisRepresentations:R01.3, ArithmeticGaloisRepresentations:R01.4, PadicHodgeTheory:R06.4/fontaine-laffaille-rational-consequences, AlgebraicModularFormsAndSerreWeights:R15.4, PotentialModularityAndCompatibleSystems:R24.5/residual-irreducibility-density-one, PotentialModularityAndCompatibleSystems:R24.5/strict-brauer-system, ArithmeticGaloisRepresentations:R01.1/refined-continuity-interface, ArithmeticGaloisRepresentations:R01.1/refined-scalar-extension-interface, ArithmeticGaloisRepresentations:R01.5, AlgebraicModularFormsAndSerreWeights:R15.4/fontaine-laffaille-weight-comparison, AlgebraicModularFormsAndSerreWeights:R15.4/serre-weight-tame-cases.

**Checks.**

- The oddness clause is a characteristic-zero determinant statement reduced at odd ℓ; at ℓ=2 both signs coincide and one must keep the owner’s dyadic convention.
- Cofinite residual absolute irreducibility is the rank-two over ℚ theorem. Any-rank regular residual irreducibility is asserted only for a Dirichlet-density-one set of rational primes and for every λ above that set.
- For positive difference d=a−b, Fontaine–Laffaille needs 1≤d≤ℓ−2 and the ordered local extension/finite-flat comparison from R15.4 and R07.3. The displayed tame semisimplification alone is insufficient at the finite/peu boundary.
- For large ℓ>2d+1, the fixed k=d+1 is incompatible with either bad-dihedral weight (ℓ+1)/2 or (ℓ+3)/2. Equal weights use the unramified Artin weight-ℓ branch instead.
- Conductor divisibility does not mean equality after reduction. Reduction is injective only on finite inertia of order prime to ℓ.
- The Δ example has reducible exceptional primes 2,3,5,7,691; the dihedral exceptional prime 23 is irreducible over ℚ and splits on ℚ(√−23).


**Acceptance.**

- Check (iii) on a system with a Steinberg prime q whose reduction mod ℓ becomes unramified at q (level lowering)
- Check (iv) on a dihedral inertia image of order 2·7 reduced modulo 3
- For a dihedral group of even order at ℓ=2, prime-to-ℓ injectivity cannot be used; verify the separate dyadic local input.
- Check (ii) on the Δ family (a − b = 11): ρ̄_ℓ is reducible exactly for ℓ ∈ {2, 3, 5, 7, 691} (Serre, Swinnerton-Dyer), a finite set; ρ̄_23 is irreducible but induced from ℚ(√−23) ⊂ ℚ(ζ_23), so it is reducible on G_{ℚ(ζ_23)}: this is the boundary case ℓ = 2(a − b) + 1 of the restriction clause, with weight 12 = (ℓ + 1)/2 as in KW I Lemma 6.2(ii).
- Use the standard two-dimensional rational S₃ representation of the splitting field of X³−2 over ℚ: it is odd and has Hodge–Tate weights (0,0). For ℓ>3 its reduction is absolutely irreducible and unramified at ℓ, so the normalized Serre weight is ℓ. The positive-difference formula must not return 1.

**Sources.** kw-serre-modularity-I, Proof of Theorem 10.1, p. 20 of the preprint: (ii); kw-serre-modularity-I, §8.4, p. 17 of the preprint: (ii), the cofinite conclusion as KW use it; kw-serre-modularity-I, Lemma 6.2(ii), p. 11 of the preprint: (ii), the restriction to G_{ℚ(ζ_ℓ)}: reducibility there forces weight (ℓ+1)/2 or (ℓ+3)/2; swinnerton-dyer-1973, §2, Corollary 1, p. 15; §4, corollary to Theorem 4 and the weight-12 congruences, pp. 31–33: The Δ row distinguishes reducible image (type (i), primes 2, 3, 5, 7, 691) from irreducible dihedral image (type (ii), prime 23); the latter splits over ℚ(√−23); kw-serre-modularity-I, §1, p. 2 of the preprint; §10.1, p. 20: Serre weights are normalized to be at least 2; weight-one Artin members are an irregular characteristic-zero case, not residual Serre weight 1; dieulefait-pacetti, Lemma 1.14, proof, p. 9 of arXiv:2108.07577v2: The unramified residual-inertia case has Serre weight p.


### What an almost strict system says at its own coefficient prime

**Target:** R24.6/local-compatibility-at-the-coefficient-prime. **Kind:** theorem.

For an arbitrary KW almost-strict system and ι above ℓ, the definition gives full WD comparison at q=ℓ if the residual member is irreducible; if ℓ≠2 and r_ℓ is unramified it gives crystallinity and the prescribed Hodge weights. In the other cases its contract alone gives neither de Rham nor WD comparison. For the specific motivic Hilbert/Brauer systems constructed here, strict-brauer-system instead gives de Rham/potential semistability and full WD comparison at every coefficient prime, even for reducible residual members and ℓ=2; unramified r_ℓ then implies crystalline. These assertions are local input lemmas. Application of residually reducible de Rham modularity lifting belongs to GL2ModularityLifting R32.6 and is imported there.

**Hypotheses and scope.**

- For an arbitrary almost-strict system, use only the residual-irreducible coefficient-prime clause or the odd unramified-parameter clause. The excluded residual-reducible ramified case has no WD assertion from that contract.
- Full coefficient-prime comparison for the constructed Hilbert/Brauer families uses strict-brauer-system and Skinner’s theorem; it does not restore the withdrawn assertion to the historical KW proof.

**Construction or proof.**

- Read the two conditional clauses of KW’s almost-strict definition; do not infer a condition in the excluded cases.
- For the constructed system apply strict-brauer-system, with the full Skinner supplier.
- Pass this local hypothesis to the R32.6 consumer; no Pan or other modularity-lifting proof is constructed in R24.6.

**Required contracts.** PotentialModularityAndCompatibleSystems:R24.5/compatible-system, PotentialModularityAndCompatibleSystems:R24.5/almost-strict-compatibility, PotentialModularityAndCompatibleSystems:R24.5/strict-brauer-system, AutomorphicGaloisRepresentations:R19.5/skinner-full-hilbert-coefficient-prime, PadicHodgeTheory:R06.3/plan/weil-deligne-descent.

**Checks.**

- Apply R06.3/plan/weil-deligne-descent only after proving de Rham/potential semistability. Trivial WD inertia and N=0 then give crystallinity.
- The full Skinner theorem has neither a residual-irreducibility guard nor a degree/discrete-series guard. General ramified residually reducible transfer is the R32.6 theorem, not a local consequence of this lemma.


**Acceptance.**

- Check DP Paso 5 case (1): N ramified in the system and ρ̄_N reducible is case (c)
- Check KW I §8.4: the auxiliary prime p′ is outside the ramification set, so case (b) applies

**Sources.** kw-serre-modularity-I, §5, p. 8 of the preprint: The almost strict conditions; dieulefait-pacetti, Paso 5, p. 14 of the arXiv version: The modern route in case (c).


### Linked systems and modularity transfer

**Target:** R24.6/linked-systems-modularity-transfer. **Kind:** lemma.

If one member of a compatible rank-two family is the member attached to a newform f, all members are attached to f after common coefficient extension, by equality of good Frobenius characteristic polynomials and Chebotarev–Brauer–Nesbitt recognition. Two families are linked at λ when their chosen semisimplified residual members are isomorphic. Given this link to a modular family, the classical congruence transfer is the application of the imported KW I Theorem 4.1 interface when its local and residual-image hypotheses hold. Modern transfer, especially ramified coefficient-prime residually reducible de Rham transfer, is an import from GL2ModularityLifting R32.6, not a new theorem here.

**Hypotheses and scope.**

- (ii) needs the lifting theorem's residual hypotheses at λ (non-solvable image at 2, cyclotomic irreducibility at odd λ)
- the transfer is along a single residual representation; the conductor and weight of the two systems may differ

**Construction or proof.**

- Compare characteristic polynomials in a common finite coefficient extension.
- Apply recognition memberwise to the existing f-family.
- Apply the appropriate owner’s lifting export, retaining all its local/de Rham and residual-image conditions.

**Required contracts.** PotentialModularityAndCompatibleSystems:R24.5/compatible-system, ArithmeticGaloisRepresentations:R01.5, PotentialModularityAndCompatibleSystems:R24.4/kw-theorem-4-1, AutomorphicGaloisRepresentations:R19.3/fixed-eigenform-compatible-family, AutomorphicGaloisRepresentations:R19.2/hilbert-uniqueness-determinant-oddness-irreducibility, GL2ModularityLifting:R32.6/transfer-residually-reducible, GL2ModularityLifting:R32.6/transfer-dyadic, GL2ModularityLifting:R32.6/transfer-residually-irreducible-odd.

**Checks.**

- Recognition fixes each member up to isomorphism after one common coefficient enlargement; it chooses no canonical lattice.
- A link is an isomorphism of two semisimplified residual members. It does not force their characteristic-zero conductors, weights or inertial types to coincide.
- Use the R24.4 theorem only with all its classical KW guards. Modern R32.6 uses p≥5 for the general reducible branch; p=3 needs its stated ratio/ordinary branch and p=2 its separate nonsolvable theorem.


**Acceptance.**

- Check (ii) in KW I §8.2's inductive step: (ρ_ι) and (ρ′_ι) linked at ℓ
- Check that the lifting theorem used at each link has its residual hypotheses

**Sources.** kw-serre-modularity-I, §8.2, p. 15 of the preprint: Linked systems; dieulefait-pacetti, Remark 4, p. 7 of the arXiv version: (i).


## Worked contract checks

**A genuine class requires the Hom norm.** In the C₂ character ring let 1 and ε
be the distinct one-dimensional irreducibles. The virtual class 3·1−ε has
dimension 2 and norm 3²+(−1)²=10. It has the desired rank but a negative
multiplicity. Conversely, Σn_i²=1 leaves one coefficient ±1. Positive
Σn_i dim V_i, with each irreducible dimension positive, chooses +1. This is the
integer consequence behind the Brauer theorem; it does not prove that its
arithmetic overlaps have norm one.

**Reciprocal polynomials and Hodge collisions.** For a Frobenius with eigenvalues
2 and 3, Q=X²−5X+6 and the dual has roots 1/2 and 1/3, hence
Q∨=X²−(5/6)X+1/6. Reversing coefficients without dividing by Q(0) fails
monicity. Tensor Hodge data {0,1} and {0,−1} have the four entries
{0,−1,1,0}, so tensoring regular systems can lose regularity. In contrast
Sym^k of regular rank two has a strictly monotone arithmetic progression of
Hodge weights. Above the rank, an exterior power has rank zero, polynomial 1
and empty Hodge multiset.

**Oddness and its dyadic loss.** Complex conjugation on an odd rank-two
characteristic-zero member has eigenvalues 1 and −1 and determinant −1.
Reduction in characteristic two sends the matrix diag(1,−1) to the identity
and sends both determinant signs to 1. A dyadic reduction cannot certify
characteristic-zero oddness. For CM polarizations two totally odd inputs have
μ(c)=μ′(c)=−1; their naïve tensor multiplier has value +1. Multiplying by
δ_(F/F⁺)(c)=−1 supplies the correct normalized multiplier without changing
its restriction to G_F.

**Fixed weight excludes the exceptional quadratic case.** Let d>0 and
ℓ>2d+1. Then k=d+1 is smaller than both (ℓ+1)/2 and (ℓ+3)/2. After the
Fontaine–Laffaille comparison, KW Lemma 6.2(ii) therefore excludes reducibility
on G_(ℚ(ζ_ℓ)) for an absolutely irreducible residual member of that fixed
weight. This check is over ℚ and uses a cofinite residual theorem; it does not
promote the general BLGGT density-one conclusion to a cofinite conclusion.
For the level-two tame-type bookkeeping p=3,q=5,r=1,m=1 gives j=1 and i=3,
so i−j=2 and the two candidate weights are 4 and 2. The i=j+1 boundary
would instead give q; the stated Diamond divisibility constraints exclude it.

**Gamma cancellation.** The real factor of an elliptic cohomological family is
Γℝ(s−1/2)Γℝ(s+1/2)Γℂ(s)/Γℂ(s−1/2). The Mathlib duplication identity
simplifies it to Γℂ(s) wherever the denominator is nonzero, and the identity
extends as a meromorphic factor. Pointwise totalized division at a Gamma pole
is a different statement and is not used. The old finite Hodge-factor product
with a half-integer number of factors is not a definition.

## Proof leaves and signature coverage

All targets above have their statements and direct prerequisites specified.
The following obligations remain exact theorem/interface requests, rather than
implicit mathematical steps:

**Savitt-to-Serre-weight and ordered extension adapter.** Savitt Corollary 6.15 and Remark 6.17 are read and collated with the corrected author copy. R15.4 still needs the precise Serre-weight consequence with the nonscalar/odd-prime guards and the R07.3 ordered wild/finite-flat comparison. A tame semisimplification alone is not an unconditional full local lattice classification. Consumers: PotentialModularityAndCompatibleSystems:R24.5/kw-theorem-5-1-systems.

**Gee 2011 was not read; Dieulefait 2004 covers only small odd crystalline weights.** The DP Theorem 1.11 statement and the narrower Dieulefait 2004 Theorem 1.1 have been read. Gee 2011 is not independently read in this pass; the R23/R24.3 owners supply the potential-modularity and prescribed-lift inputs for the covered A/B/C range. This pass does not claim a proof of arbitrary prescribed-type or arbitrary regular de Rham existence. Snowden’s prescribed-lift inputs belong to those owners, not new targets here. Consumers: PotentialModularityAndCompatibleSystems:R24.5/dieulefait-families.

**The common-component and Sen monodromy inputs remain source leaves.** BLGGT v4 Lemma 5.3.1 pp.70–71 and the complete proof of Lemma A.1.5 p.85 are read, with the published coefficient-descent statement/proof pp.598–599 collated. The original Larsen–Pink Proposition 6.14/Serre component-field and Sen 1973 torus proofs remain unread. Their exact interfaces stay with G7 and R06.2. R01.5 must supply the general semisimple split-eigenvalue criterion, using existing SemisimpleAlgebras Layers 1–2; its absolutely irreducible full-span export alone is insufficient. Two different Frobenius residue characteristics are needed for one uniform coefficient extension. Consumers: PotentialModularityAndCompatibleSystems:R24.5/monodromy-component-field, PotentialModularityAndCompatibleSystems:R24.5/larsen-rational-system-groups, PotentialModularityAndCompatibleSystems:R24.5/residual-irreducibility-density-one.

**Larsen, Maximality of Galois actions for compatible systems (Duke 1995), is not read.** Read BLGGT v4 §5.2 pp.65–70 and §5.3 pp.70–74, including the complete proofs of Lemma 5.2.1, Proposition 5.2.2 and Proposition 5.3.2. Their original Larsen Theorem 3.17/§§1.12–1.13, Larsen–Pink Propositions 6.14/8.9, Bogomolov openness, Serre torus, Conrad–Chai–Oort and Bruhat–Tits 5.1.40/5.2.8 proofs remain unread supplier leaves. Published p.576 uses CCO 2013 Lemma 3.7.7 rather than v4’s CCO 2009 Proposition 6.3. No original book or paper proof is claimed closed. Consumers: PotentialModularityAndCompatibleSystems:R24.5/larsen-good-primes, PotentialModularityAndCompatibleSystems:R24.5/residual-irreducibility-density-one.

**Supplier signatures needed for complete arithmetic Lean forms.** The pinned libraries supply algebraic representations, completions, characteristic polynomials and Gamma factors. The full continuous arithmetic family, local WD/Hodge, automorphic realization, Dirichlet density, algebraic group/integral model, and character realization interfaces are roadmap targets. Every full target signature and its API/tests omitted from the compact Suggested file is listed in suggestedCoverage. No empty predicate or artificial carrier replaces them. Consumers: PotentialModularityAndCompatibleSystems:R24.5/compatible-system, PotentialModularityAndCompatibleSystems:R24.5/system-operations, PotentialModularityAndCompatibleSystems:R24.5/brauer-induction-system, PotentialModularityAndCompatibleSystems:R24.5/almost-strict-compatibility, PotentialModularityAndCompatibleSystems:R24.5/kw-theorem-5-1-systems, PotentialModularityAndCompatibleSystems:R24.5/dieulefait-families, PotentialModularityAndCompatibleSystems:R24.6/residual-members, PotentialModularityAndCompatibleSystems:R24.6/local-compatibility-at-the-coefficient-prime, PotentialModularityAndCompatibleSystems:R24.6/linked-systems-modularity-transfer, PotentialModularityAndCompatibleSystems:R24.5/weakly-compatible-system-rank-n, PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates, PotentialModularityAndCompatibleSystems:R24.5/linear-algebra-operations-on-systems, PotentialModularityAndCompatibleSystems:R24.5/rank-two-reducibility-independent-of-lambda, PotentialModularityAndCompatibleSystems:R24.5/system-l-functions, PotentialModularityAndCompatibleSystems:R24.5/galois-grothendieck-ring, PotentialModularityAndCompatibleSystems:R24.5/residual-irreducibility-density-one, PotentialModularityAndCompatibleSystems:R24.5/constituents-essentially-self-dual, PotentialModularityAndCompatibleSystems:R24.5/larsen-rational-system-groups, PotentialModularityAndCompatibleSystems:R24.5/serre-theta-uniform-bounds, PotentialModularityAndCompatibleSystems:R24.5/larsen-good-primes, PotentialModularityAndCompatibleSystems:R24.5/strict-brauer-system, PotentialModularityAndCompatibleSystems:R24.5/monodromy-component-field, PotentialModularityAndCompatibleSystems:R24.5/polarized-system, PotentialModularityAndCompatibleSystems:R24.5/polarized-operations, PotentialModularityAndCompatibleSystems:R24.5/character-system, PotentialModularityAndCompatibleSystems:R24.5/rank-one-purity, PotentialModularityAndCompatibleSystems:R24.5/induced-character-purity, PotentialModularityAndCompatibleSystems:R24.5/artin-system, PotentialModularityAndCompatibleSystems:R24.5/artin-twist-purity, PotentialModularityAndCompatibleSystems:R24.5/weakened-compatible-data.

**Brauer pairing overlap descent is a supplier proof leaf.** Khare, arXiv math/0504080v1, §3 Proposition 3.1 (inner-product step p. 17), explicitly uses the pairing computation; KW II refers to the Duke §5 version of that argument. The norm-one proof is now spelled out using Mackey, Frobenius reciprocity and overlap Hom characters; the exact λ-independent overlap-character lemma is requested from R17.6. Degree and true restrictions alone do not certify genuineness. Consumers: PotentialModularityAndCompatibleSystems:R24.5/brauer-induction-system.

**Potential modularity outside R23.4's lift types, for the full Dieulefait–Pacetti Theorem 1.11.** The full DP Theorem 1.11 requires potential modularity beyond the R23.4 A/B/C scope. This pass adds the exact request to R23.4 for other weight-two potentially Barsotti–Tate types and arbitrary regular de Rham lifts; naming the request does not prove it. The covered subrange uses strict Brauer families and meets DP’s all-member de Rham clause. Inherited source issue E5 is a citation-scope gap, not a counterexample to the family theorem. Consumers: PotentialModularityAndCompatibleSystems:R24.5/dieulefait-families.

**General Hilbert purity export exceeds the restricted geometric Saito contract.** R34.6/hilbert-local-monodromy-weight-export has its stated degree and finite-discrete-series guards. The unrestricted local automorphic input is already planned at R19.3/monodromy-weight-purity-of-the-family and is used here under that exact id. The request to R34.6 records the general purity owner alignment and realization; the restricted geometric source is not silently generalized. Consumers: PotentialModularityAndCompatibleSystems:R24.5/strict-brauer-system.


The compact suggested file introduces no heavy family, WD, Hodge, character or
monodromy carrier. All 30 full target signatures, the 80 API items and the 57
definition tests belong to the definitive specification above. The packet's
suggestedCoverage lists every omitted target, API name and test name. The file
states a positive-dimension/norm-one integer milestone and examples on actual
polynomials, matrices, lists, integers and Gamma factors. These are signature
and convention checks; they do not assert arithmetic existence, a lattice
classification, density one, or local compatibility.

The early definitions and operations stay in R24.5:operations. R19.3 supplies
eigenform instances and the exact general automorphic Hilbert purity import;
R34.6 is the geometric eigenform purity owner, with its restricted Saito export
retaining its source hypotheses. R24.6 consumes R32.6 for modern transfer.
The Class field theory Part II request extends global reciprocity only by the
algebraic ℓ-adic realization and converse comparison. Existing upstream
character, finite induction and semisimple-algebra targets are not reconstructed.

The inherited atlas planets are Weakly compatible systems, Galois
representation ring, Residual irreducibility, Common monodromy component field,
Polarized compatible systems and Purity of rank-one systems in the operations
layer; Compatible systems by Brauer induction, Prescribed compatible systems
and Strict compatible systems in R24.5; and Local compatibility at the
coefficient prime in R24.6. Their original node identifiers are retained.

## References and edition discipline

Locators above refer to the editions below. Source statements are given in our
own words. A source's use of a theorem from another paper does not imply its
original proof has been checked. Original monodromy/integral-model proof leaves
are identified explicitly above. The known source corrections E1–E5 remain
owned by the R24.3 packet; this document uses their qualified statements and
adds no duplicate errata record.

- **kw-serre-modularity-II**: Chandrashekhar Khare and Jean-Pierre Wintenberger, [Serre's modularity conjecture (II)](https://www.math.ucla.edu/~shekhar/papers/proofs.pdf). Author's preprint (proofs.pdf) of the paper published as Invent. Math. 178 (2009), 505–586. Locators give the preprint's page numbers (1–98), which are not the Inventiones pages. Read: §10.3.2, pp.93–94, all construction and local-comparison paragraphs; bibliography p.96.

- **kw-serre-modularity-I**: Chandrashekhar Khare and Jean-Pierre Wintenberger, [Serre's modularity conjecture (I)](https://www.math.ucla.edu/~shekhar/papers/results.pdf). Author's preprint (results.pdf) of the paper published as Invent. Math. 178 (2009), 485–504. Locators give the preprint's page numbers. Read: §5 pp.7–10, Theorem 5.1 and definitions; Lemma 6.2 p.11; §8.2 p.15; §8.4 p.17; §9.1 p.19; §10.1 p.20.

- **dieulefait-pacetti**: Luis Victor Dieulefait and Ariel Martín Pacetti, [A simplified proof of Serre's conjecture](https://arxiv.org/pdf/2108.07577v2). arXiv:2108.07577v2, 3 May 2022. Locators give the arXiv version's page numbers. Read: Definition 1.10 pp.6–7; Theorem 1.11 and Remark 4 p.7; Lemma 1.14 p.9; Paso 5 p.14, arXiv v2.

- **taylor-2006-meromorphic-continuation**: Richard Taylor, [On the meromorphic continuation of degree two L-functions](https://ems.press/content/book-chapter-files/27484). Documenta Mathematica, Extra Volume: John H. Coates' Sixtieth Birthday (2006), 729–779; EMS Press open-access chapter file. Locators give the printed Documenta pages (printed page = PDF page + 728).. Read: §6 pp.773–775: family definition, Lemma 6.5 and Theorem 6.6 with proof; potential-modularity existence is an owner import.

- **blggt-2014-v4**: Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, [Potential automorphy and change of weight](https://arxiv.org/pdf/1010.2561v4). arXiv:1010.2561v4 (9 December 2013), 93 pages, the last arXiv version before Ann. of Math. (2) 179 (2014), 501–609. Printed page = PDF page.. Read: §2.1 p.31 and Theorem 2.1.1 pp.33–34; §5.1 pp.62–65; §5.2 pp.65–70; §5.3 pp.70–74; Lemma 5.4.5 p.76; §5.5 pp.77–79; Lemma A.1.5 p.85; Appendix A.2 p.87. The cited original monodromy and integral-model proofs are not claimed as read.

- **skinner-2009**: Christopher Skinner, [A note on the p-adic Galois representations attached to Hilbert modular forms](https://ems.press/content/serial-article-files/26055?nt=1). Documenta Mathematica 14 (2009), 241–258. Read: Introduction, conventions and Theorem 1 pp.241–244; proof fragment pp.254–255. The complete proof is imported from R19.5, not independently verified here.

- **acc-2023**: Patrick Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor, Jack Thorne, [Potential automorphy over CM fields](https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf). Annals of Mathematics 197 (2023), 897–1113; published journal-layout copy hosted by Frank Calegari. Read: Published §7.1 pp.1084–1086 and p.1092: family variants, rank-one comparison, Artin-up-to-twist definition and purity observation.

- **khare-level-one**: Chandrashekhar Khare, [Serre’s modularity conjecture: the level one case](https://arxiv.org/pdf/math/0504080). Duke Math. J. 134 (2006), no. 3, 557–589; read as arXiv:math/0504080v1 (5 April 2005), where the Brauer construction is §3, Proposition 3.1. KW II cite it as Theorem 5.1 of the Duke version. Read: arXiv math/0504080 §3 Proposition 3.1 and proof pp.16–18; these are not the Duke §5 locators.

- **dieulefait-2004**: Luis V. Dieulefait, [Existence of families of Galois representations and new cases of the Fontaine-Mazur conjecture](https://arxiv.org/pdf/math/0304433). arXiv:math/0304433v1 (27 April 2003); published in J. reine angew. Math. 577 (2004), 147–151 (not obtained). Read: arXiv math/0304433 Theorem 1.1 and following remark pp.1–2; Crelle version not obtained.

- **swinnerton-dyer-1973**: H. P. F. Swinnerton-Dyer, [On ℓ-adic representations and congruences for coefficients of modular forms](http://gaetan.chenevier.perso.math.cnrs.fr/GT/swinnerton_dyer.pdf). Modular functions of one variable III, Lecture Notes in Mathematics 350 (1973), pp. 1–55; scan of the published chapter (printed page = PDF page). Read: §2 Corollary 1 p.15; §4 Theorem 4 and its corollary/weight-12 examples pp.31–33.

- **blggt-published**: Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor, [Potential automorphy and change of weight](https://annals.math.princeton.edu/wp-content/uploads/annals-v179-n2-p03-p.pdf). Annals of Mathematics 179 (2014), 501–609; printed page = PDF page + 500. Read: §5.1 pp.570–572; theta proof p.576; Lemma 5.4.5 continuation p.587; §5.5 pp.590–591; Lemma A.1.5 pp.598–599. Collated with v4 at these places only.

- **savitt-2005**: David Savitt, [On a conjecture of Conrad, Diamond, and Taylor](https://arxiv.org/pdf/math/0404327). arXiv math/0404327, current public PDF; Duke Math. J. 128 (2005), 141–197. Printed PDF pages 38–39 are used, not journal pages. Author corrected copy collated at Corollary 6.15 and Remark 6.17.. Read: Corollary 6.15 p.38, proof and Remark 6.17 p.39. Author corrected copy https://math.jhu.edu/~savitt/papers/pdfs/cdt_corrected.pdf opened through the browser at the same locators; no claim to have read the whole paper.


The exact public-file hashes, access dates and the corrected Savitt author-copy
comparison are recorded in the packet. The suggested file is checked against
the pins above; current-main overlap checks are recorded separately and are
not claims about the pinned library.
