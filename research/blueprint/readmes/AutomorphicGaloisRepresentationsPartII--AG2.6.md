# Automorphic Galois Representations, Part II: stages AG2.6–AG2.7

## Purpose

This document plans part AG2.6 of `AutomorphicGaloisRepresentationsPartII`:

- **AG2.6:** the compatible systems attached to regular algebraic cuspidal automorphic representations of GL_n over CM fields, with what is known at the coefficient prime in the polarized and non-self-dual branches;
- **AG2.7:** the residual and Hecke-algebra exports.

It is the first checkpoint. It builds on part AG2.0 (the normalisation dictionary: weights, the Hecke polynomial P_v, the Hodge–Tate multiset, attachment at good places and the field of rationality). It also builds on PotentialModularityAndCompatibleSystems R24.5, which owns weakly compatible systems and their predicates.

Sources: BLGGT (arXiv v4) §2.1 and §5.1, and ACC+ (Annals 197) §§2.2–2.3 and 7.1, together with the reviewed decomposition.

## Scope and boundaries

- RS-12 is not accepted; the current structure is used.
- Weakly compatible systems, and the regular, pure and automorphic predicates, are imported from R24.5. The very and extremely weak variants of ACC+ are defined here as weakenings.
- Lattices and Brauer–Nesbitt are ArithmeticGaloisRepresentations R01.1. The unramified Hecke algebra is IHG.3.
- Hecke algebras on cohomology, and Scholze's torsion Galois representations, are TorsionCohomologyInfrastructure's.
- The Fontaine–Laffaille local–global compatibility of ACC+ Theorem 4.5.1 is PotentialAutomorphyInfrastructure PA.1.

## Conventions

As in part AG2.0:

- Frobenius is geometric and Art sends uniformisers to geometric Frobenius.
- HT(ε_l) = {−1}.
- P_v(X) = Σ(−1)^i q_v^{i(i−1)/2}T_{v,i}X^{n−i} (the last term is (−1)^n q_v^{n(n−1)/2}T_{v,n}; sourceIssue E3).
- The weight a lies in (ℤⁿ)_w. The purity weight of r_{l,ι}(π) is then w + n − 1, which is BLGGT's w.

## AG2.6 Coefficient-prime comparison and compatible systems

### Objects

#### Definition. Very weakly and extremely weakly compatible systems (ACC+ §7.1): the weakenings of BLGGT's weakly compatible systems

*Module* `TauCeti/AutomorphicGalois/CompatibleSystems.lean`. *Node* `AutomorphicGaloisRepresentationsPartII:AG2.6/extremely-weakly-compatible-system`.

Let F be a number field. A rank-n very weakly compatible system R of l-adic representations of G_F defined over M is a 5-tuple (M, S, {Q_v(X)}, {r_λ}, {H_τ}): M a number field; S a finite set of primes of F; for v ∉ S a monic degree-n Q_v(X) ∈ M[X]; for τ: F → M̄ a multiset H_τ of n integers; for each prime λ of M, of residue characteristic l, a continuous semisimple r_λ: G_F → GL_n(M̄_λ) such that (a) for v ∉ S with v ∤ l, r_λ is unramified at v and r_λ(Frob_v) has characteristic polynomial Q_v(X); (b) for l outside a set of rational primes of Dirichlet density 0, r_λ|_{G_{F_v}} is crystalline for all v | l and HT_τ(r_λ) = H_τ; (c) for all λ, HT_τ(det r_λ) = Σ_{h∈H_τ} h. R is extremely weakly compatible if (b) is dropped. The residual representation r̄_λ, the semisimplified reduction, is defined over O_M/λ.

*Hypotheses.*

- BLGGT's weakly compatible systems (PotentialModularityAndCompatibleSystems:R24.5/weakly-compatible-system-rank-n) are very weakly compatible. The difference is that de Rham and crystalline are required at every l there, but only for l in a density-one set here.
- An extremely weakly compatible system depends on the H_τ only through (c). By Henniart's theorem a compatible family of characters is de Rham, so (c) is meaningful.
- The predicates regular, irreducible (for l in a density-one set), strongly irreducible (after every finite base change), pure and automorphic are R24.5's, applied without change (ACC+ §7.1 'mutatis mutandis').
- r̄_λ is realised over O_M/λ, not only over its algebraic closure, because its traces lie in O_M/λ and finite fields have trivial Brauer group (Deligne–Serre Lemme 6.13).

*API.*

- `VeryWeaklyCompatibleSystem` (*structure*) — (M, S, Q_v, r_λ, H_τ) with (a), (b) for density-one l, and (c).
- `ExtremelyWeaklyCompatibleSystem` (*structure*) — (M, S, Q_v, r_λ, H_τ) with (a) and (c).
- `WeaklyCompatibleSystem.toVery` (*constructor*) — BLGGT's weakly compatible systems are very weakly compatible.
- `VeryWeaklyCompatibleSystem.toExtremely` (*constructor*) — Forget (b).
- `ExtremelyWeaklyCompatibleSystem.residual` (*constructor*) — r̄_λ: G_F → GL_n(O_M/λ), the semisimplified reduction.
- `ExtremelyWeaklyCompatibleSystem.hodgeTate_det` (*characterisation*) — HT_τ(det r_λ) = Σ_{h ∈ H_τ} h for all λ.

*Used by.*

- `AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-system-of-pi` — the class in which R_π lies unconditionally
- `AutomorphicGaloisRepresentationsPartII:AG2.6/very-weak-compatibility-under-dgi` — the upgrade under (DGI)
- `AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi` — the residual r̄_λ over O_M/λ

*Unit tests.* A wrong definition fails one of these.

- `extremelyWCS_characters` (degenerate) — Rank 1: every extremely weakly compatible system of characters is weakly compatible (Henniart).
- `veryWCS_of_weaklyCompatible` (compatibility) — The Tate module system {V_l(E)^∨} of an elliptic curve over ℚ is weakly compatible, hence very weakly compatible, with H = {1, 0} (BLGGT convention).
- `not_veryWCS_hodgeTate_everywhere` (non-example) — A system with r_λ de Rham only for l in a set of density 1/2 is not very weakly compatible: the exceptional set in (b) must have density 0.
- `extremelyWCS_hecke_character` (value) — {r_{l,ι}(ψ)} for an algebraic Hecke character ψ of weight (a_τ) is extremely weakly compatible with H_τ = {a_τ}, and in fact weakly compatible.

*Construction.*

1. Well-definedness: (a) is a condition at each unramified v; (b) and (c) are conditions at each λ; a density-0 exceptional set is a set-level condition.
2. Implications: weakly compatible ⇒ very weakly compatible ⇒ extremely weakly compatible, each by forgetting conditions. For (c) from (b), det r_λ is de Rham with HT_τ the sum of the HT_τ(r_λ).
3. Residual rationality: tr r̄_λ(σ) is the reduction of tr r_λ(σ), which lies in O_{M,λ} at Frobenius elements and hence, by continuity and Čebotarev, everywhere. Lemme 6.13 then realises the semisimplification over O_M/λ.

*Acceptance.*

- A weakly compatible system of characters (rank 1) is very weakly compatible.
- The system R_π of a regular algebraic cuspidal π over a CM field is extremely weakly compatible (node compatible-system-of-pi), and very weakly compatible under (DGI) (node very-weak-compatibility-under-dgi).

*Uses.* `PotentialModularityAndCompatibleSystems:R24.5/weakly-compatible-system-rank-n`, `PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates`, `ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent`.

*Sources.*

- Potential automorphy over CM fields, §7.1, pp. 1084–1085: “By a rank n very weakly compatible system R of l-adic represen- tations of GF deﬁned over M we shall mean a 5-tuple” The definition, with conditions (1)–(5) following.
- Potential automorphy over CM fields, §7.1, p. 1085: “If we further drop hypothesis (5b), then we say that R is an extremely weakly compatible system.” Extremely weakly compatible.

#### Construction. The compatible system R_π of a regular algebraic cuspidal automorphic representation over a CM field

*Module* `TauCeti/AutomorphicGalois/CompatibleSystems.lean`. *Node* `AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-system-of-pi`.

Let F be CM and π a regular algebraic cuspidal automorphic representation of GL_n(𝔸_F) of weight a. Put R_π = (M_π, S_π, {Q_{π,v}(X)}, {r_{π,λ}}, {H_{π,τ}}), with M_π the field of rationality of π, S_π the set of primes where π is ramified, Q_{π,v}(X) = P_v(π_v; X) (the characteristic polynomial of rec(π_v|det|_v^{(1−n)/2})(Frob_v)), H_{π,τ} = {a_{τ,1} + n − 1, …, a_{τ,n}}, and r_{π,λ} = r_{l,ι}(π) for any ι: Q̄_l ≅ ℂ inducing λ on M_π. Then R_π is an extremely weakly compatible system. r_{π,λ} does not depend on the choice of ι inducing λ, and it is the unique semisimple representation attached to π at the good places.

*Hypotheses.*

- The existence of r_{l,ι}(π), attached at the good places (AG2.0/galois-representation-attached-at-good-places), is HLTT's Theorem A (AG2.4/hltt-construction-of-nonselfdual-systems). ACC+ cite it together with Varma for the places in S_π.
- Only condition (c) is asserted at l: HT_τ(det r_{π,λ}) = Σ H_{π,τ}. De Rham at l in general is not known from these sources (AG2.6/coefficient-prime-branch-and-what-it-does-not-give).
- Q_{π,v} ∈ M_π[X] by AG2.0/field-of-rationality, so the system is defined over M_π.

*API.*

- `compatibleSystem` (*constructor*) — R_π := (M_π, S_π, P_v(π_v), r_{l,ι}(π), expectedHodgeTate a).
- `compatibleSystem_isExtremelyWeak` (*characterisation*) — R_π is extremely weakly compatible.
- `compatibleSystem_rep_indep` (*extensionality*) — r_{l,ι}(π) ≅ r_{l,ι′}(π) when ι, ι′ induce the same place λ of M_π.
- `compatibleSystem_coeff` (*projection*) — The coefficient field of R_π is M_π.
- `compatibleSystem_twist` (*functoriality*) — R_{π⊗ψ∘det} = R_π ⊗ R_ψ for algebraic ψ.

*Used by.*

- `AutomorphicGaloisRepresentationsPartII:AG2.6/very-weak-compatibility-under-dgi` — upgraded to very weakly compatible under (DGI)
- `AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-compatible-system-strictly-pure` — the polarized case is weakly compatible and strictly pure
- `AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi` — the residual members r̄_{π,λ}
- `PotentialModularityAndCompatibleSystems:R24.5` — automorphic systems in the sense of R24.5/compatible-system-predicates

*Unit tests.* A wrong definition fails one of these.

- `compatibleSystem_rank_one` (degenerate) — n = 1: R_ψ is the weakly compatible system of characters of ψ.
- `compatibleSystem_baseChange_newform` (value) — For the base change of a weight-k newform to an imaginary quadratic field, R_π has H = {k − 1, 0} and Q_v = P_v, with r_λ = ρ_{f,λ}^∨ restricted.
- `compatibleSystem_det_hodgeTate` (compatibility) — HT_τ(det r_{π,λ}) = Σ_i (a_{τ,i} + n − i) agrees with r_{l,ι} of the central character.
- `not_compatibleSystem_over_realisation_field` (non-example) — The coefficient field is M_π, not a field over which r_{π,λ} is realised: R_π need not have r_{π,λ} with values in GL_n(M_{π,λ}).

*Construction.*

1. Coefficients: P_v(π_v; X) ∈ M_π[X] (AG2.0/field-of-rationality).
2. Independence of ι: if ι, ι′ both induce λ on M_π, then ι′ = ι ∘ σ̃ for some σ̃ ∈ Aut(Q̄_l) fixing (M_π)_λ. The representations r_{l,ι}(π) and r_{l,ι′}(π) have the same characteristic polynomials at good Frobenius elements, namely ι^{−1}P_v = ι′^{−1}P_v, since P_v has coefficients in M_π. So they are isomorphic, by uniqueness in AG2.0/galois-representation-attached-at-good-places.
3. (a): HLTT Theorem A (attachment) for v ∉ S_π with v ∤ l; Varma for the remaining v ∤ l (semisimplified).
4. (c): det r_{π,λ} is attached to the central character ω_π, an algebraic Hecke character, so it is r_{l,ι}(ω_π ‖·‖^{n(n−1)/2}) up to the twist of AG2.0/frobenius-polynomial-and-conventions. Its τ-Hodge–Tate number is Σ_i (a_{τ,i} + n − i), by AG2.0/galois-character-of-an-algebraic-hecke-character.

*Acceptance.*

- n = 1: R_ψ = (ℚ(ψ), S_ψ, {X − ψ_v(ϖ_v)}, {r_{l,ι}(ψ)}, {a_τ}), a weakly compatible system of characters.
- n = 2, F imaginary quadratic, π the base change of a non-CM newform f of weight k: R_π = {ρ_{f,λ}^∨|_{G_F}} with H = {k − 1, 0} at both embeddings. It is weakly compatible because it is the restriction of a system over ℚ.
- (c) at n = 2, a = (k − 2, 0): HT(det) = (k − 1) + 0 = k − 1, and det ρ_f^∨ = ψ^{−1}ε_l^{k−1} has HT k − 1 in BLGGT's convention.

*Uses.* `AutomorphicGaloisRepresentationsPartII:AG2.6/extremely-weakly-compatible-system`, `AutomorphicGaloisRepresentationsPartII:AG2.0/field-of-rationality`, `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-representation-attached-at-good-places`, `AutomorphicGaloisRepresentationsPartII:AG2.0/expected-hodge-tate-multiset`, `AutomorphicGaloisRepresentationsPartII:AG2.0/galois-character-of-an-algebraic-hecke-character`, `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-construction-of-nonselfdual-systems`, `AutomorphicGaloisRepresentationsPartII:AG2.5/varma-semisimplified-comparison-and-monodromy-bound`.

*Planet:* Compatible system of π.

*Sources.*

- Potential automorphy over CM fields, §7.1, p. 1093: “From the main theorems of [HLTT16] and [Var14] we may associate to π an extremely weakly compatible system” The system R_π, with its four components listed after it.
- Potential automorphy over CM fields, §7.1, p. 1093: “Hπ,τ = {aτ,1 + n −1, . . . , aτ,n}.” The Hodge–Tate data H_{π,τ}, which agree with AG2.0/expected-hodge-tate-multiset.

### Theorems

#### Theorem. The polarized branch at the coefficient prime: de Rham with the expected Hodge–Tate numbers, and semistable or crystalline with Weil–Deligne compatibility at Iwahori-spherical places

*Node* `AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-branch-de-rham-and-crystalline`.

Let (π, χ) be a regular algebraic cuspidal polarized automorphic representation of GL_n(𝔸_F), F CM, of weight a ∈ (ℤⁿ)_w, and ι: Q̄_l ≅ ℂ. Then r_{l,ι}(π) is de Rham at every v | l with HT_τ(r_{l,ι}(π)) = {a_{ιτ,1} + n − 1, …, a_{ιτ,n}}, and HT_{τ∘c} = {w + n − 1 − h : h ∈ HT_τ}. If v | l and π_v has an Iwahori-fixed vector, then ι WD(r_{l,ι}(π)|_{G_{F_v}})^{F-ss} ≅ rec(π_v ⊗ |det|_v^{(1−n)/2}), so r_{l,ι}(π)|_{G_{F_v}} is semistable, and crystalline if π_v is unramified.

*Hypotheses.*

- Cuspidality, regular algebraicity and polarization are all needed. The non-self-dual branch has no such statement in the sources (AG2.6/coefficient-prime-branch-and-what-it-does-not-give).
- The Weil–Deligne statement at v | l is BLGGT Theorem 2.1.1(4), for π_v with an Iwahori-fixed vector. Caraiani's l = p paper removes the Iwahori restriction ('full local–global compatibility at l = p', decomposition node), but that general case depends on BLGGT itself, which is harmless only in the Iwahori case (BLGGT's remark).
- The crystalline Frobenius identity uses the smallest linear power of the crystalline Frobenius (Chenevier–Harris 3.2.3(c)).
- BLGGT's w in Theorem 2.1.1(3) is w + n − 1 in terms of the weight's w.

*Proof outline.*

1. BLGGT Theorem 2.1.1(3)–(4), quoting Barnet-Lamb–Geraghty–Harris–Taylor Theorems 1.1–1.2 and Caraiani's two papers. The polarized construction is AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris.
2. The Hodge–Tate multiset is AG2.0/expected-hodge-tate-multiset applied to a, and the polarity HT_{τ∘c} follows from a ∈ (ℤⁿ)_w (AG2.0).
3. De Rham, semistable, crystalline and the functor WD are PadicHodgeTheory's (request).

*Acceptance.*

- n = 2, F imaginary quadratic, base change of a weight-k newform with π_v unramified at v | l: crystalline with HT {k − 1, 0}, and WD(ρ_f^∨|_{G_{F_v}}) unramified with Frobenius polynomial P_v.
- Weight 0 (the symmetric powers of ACC+ Corollary 7.2.4): HT_τ = {n − 1, …, 0} and HT_{τc} = {n − 1 − h}, since w = 0.

*Uses.* `AutomorphicGaloisRepresentationsPartII:AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris`, `AutomorphicGaloisRepresentationsPartII:AG2.0/expected-hodge-tate-multiset`, `AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-automorphic-representation`, `PadicHodgeTheory:R06.2`, `PadicHodgeTheory:R06.3`.

*Planet:* Polarized branch at the coefficient prime.

*Sources.*

- Potential automorphy and change of weight, Theorem 2.1.1(3), p. 33: “(3) rl,ı(π) is de Rham and if τ : F֒ →Ql then” De Rham and the Hodge–Tate multiset, with the polarity HT_{τ∘c} after it.
- Potential automorphy and change of weight, Theorem 2.1.1(4), p. 34: “In particular rl,ı(π) is semi-stable at v, and if πv is unramiﬁed then it is crystalline.” The Iwahori case of Weil–Deligne compatibility at v | l.

#### Theorem. The system of a polarized π is weakly compatible, totally odd polarized and strictly pure of weight w + n − 1

*Node* `AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-compatible-system-strictly-pure`.

Let F be CM and (π, χ) regular algebraic cuspidal polarized of weight a ∈ (ℤⁿ)_w, normalised to be totally odd (χ_v(−1) = (−1)^{n+w}, AG2.0/polarized-automorphic-representation). Then R_π is weakly compatible in BLGGT's sense. (R_π, {ε_l^{1−n} r_{l,ι}(χ)}) is a totally odd polarized weakly compatible system. R_π is strictly pure of weight w + n − 1: it is strictly compatible, each WD_v(R_π) is pure of weight w + n − 1, and H_{cτ} = {w + n − 1 − h}. {r_{l,ι}(χ)} is strictly pure of weight 2w.

*Hypotheses.*

- Totally odd needs the corrected normalisation of χ (sourceIssue AutomorphicGaloisRepresentationsPartII/E2). With BLGGT's printed χ_v(−1) = (−1)^n and w odd, the multiplier system is even.
- Strict compatibility at the places in S_π uses Caraiani's local–global compatibility with purity (AG2.5/caraiani-upgrade-away-from-p-and-temperedness) together with the l = p comparison.
- BLGGT write the weight of R_π as w and that of {r_{l,ι}(χ)} as 2(w + 1 − n), with their w; in this packet's w (a ∈ (ℤⁿ)_w) these are w + n − 1 and 2w.

*Proof outline.*

1. Weak compatibility: (a) from attachment at good places; de Rham and crystalline at every l from AG2.6/polarized-branch-de-rham-and-crystalline; H_τ from AG2.0/expected-hodge-tate-multiset.
2. Polarization: BLGGT Theorem 2.1.1(1), with the multiplier's sign from AG2.0/sign-of-the-polarization-multiplier.
3. Strict purity: BLGGT Theorem 2.1.1(2) gives ι WD(r|_{G_{F_v}})^{F-ss} ≅ rec(π_v ⊗ |det|^{(1−n)/2}), pure of weight w + n − 1, independent of l (Caraiani). H_{cτ} is AG2.0/expected-hodge-tate-multiset's polarity.
4. {r_{l,ι}(χ)}: a system of characters of the totally real F⁺ of weight wt(χ) = 2w (AG2.0/galois-character-of-an-algebraic-hecke-character).

*Acceptance.*

- n = 1, ψ of weight (a_τ, a_{cτ}), w = a_τ + a_{cτ}: R_ψ is strictly pure of weight w, as |ψ(𝔭)|² = N𝔭^w.
- n = 2, base change of a weight-k newform: weight (k − 2) + 1 = k − 1, the weight of ρ_f (Deligne).

*Uses.* `AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-system-of-pi`, `AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-branch-de-rham-and-crystalline`, `AutomorphicGaloisRepresentationsPartII:AG2.0/sign-of-the-polarization-multiplier`, `AutomorphicGaloisRepresentationsPartII:AG2.5/caraiani-upgrade-away-from-p-and-temperedness`, `PotentialModularityAndCompatibleSystems:R24.5/compatible-system-predicates`.

*Sources.*

- Potential automorphy and change of weight, §5.1, p. 65: “Moreover {rl,ı(π)} is a strictly pure compatible system of weight w.” Strict purity, preceded by the statement for {r_{l,ι}(χ)} of even weight 2(w + 1 − n) in BLGGT's w.
- Potential automorphy and change of weight, §5.1, p. 62: “then we will call (R, M) a polarized (resp. totally odd, polarized) weakly compatible system if for all primes λ of M the pair (rλ, µλ) is a polarized (resp. totally odd polarized) l-adic representation.” Polarized weakly compatible systems.

#### Theorem. Under decomposed genericity and absolute irreducibility, R_π is very weakly compatible (ACC+ Lemma 7.1.9); for n = 2 unconditionally (Lemma 7.1.10)

*Node* `AutomorphicGaloisRepresentationsPartII:AG2.6/very-weak-compatibility-under-dgi`.

Let F be CM and π regular algebraic cuspidal on GL_n(𝔸_F). Assume (DGI): for a set of rational primes l of Dirichlet density one, the residual r̄_{π,λ}: G_F → GL_n(O_M/λ) is decomposed generic and absolutely irreducible for all λ | l. Then R_π is very weakly compatible: for l in a density-one set, r_{π,λ} is crystalline at all v | l with HT_τ = H_{π,τ}. For n = 2, R_π is irreducible, (DGI) holds, and R_π is very weakly compatible.

*Hypotheses.*

- (DGI) is a hypothesis on residual representations, with decomposed genericity in the sense of AG2.7/the-residual-ratio-condition-for-taylor-wiles-primes.
- The proof uses ACC+'s local–global compatibility at l = p for torsion-derived Galois representations (their Theorem 4.5.1), the Fontaine–Laffaille degree-shifting input of PotentialAutomorphyInfrastructure PA.1 (request), not a construction planned here.
- The solvable base change used to meet the hypotheses of Theorem 4.5.1 is Arthur–Clozel (ET.7), and (DGI) is preserved by it (ACC+ Lemma 7.1.7).

*Proof outline.*

1. ACC+ Lemma 7.1.9: after a solvable base change disjoint from F^{ker r̄}(ζ_l), their Theorem 4.5.1 applies for l in a density-one set; the non-Eisenstein condition follows from (DGI).
2. ACC+ Lemma 7.1.10 (n = 2): irreducibility from cuspidality (Jacquet–Shalika); (DGI) by the trichotomy strongly irreducible / induced / Artin up to twist (Lemmas 7.1.2, 7.1.3, 7.1.5, 7.1.6).

*Acceptance.*

- n = 2, F imaginary quadratic, π not a base change: R_π is very weakly compatible, so r_{π,λ} is crystalline with HT {a_{τ,1} + 1, a_{τ,2}} for l in a density-one set.
- Without (DGI), for n ≥ 3 only extremely weak compatibility is available from these sources.

*Uses.* `AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-system-of-pi`, `AutomorphicGaloisRepresentationsPartII:AG2.6/extremely-weakly-compatible-system`, `AutomorphicGaloisRepresentationsPartII:AG2.7/the-residual-ratio-condition-for-taylor-wiles-primes`, `EndoscopicTransferAndUnitaryTraceComparison:ET.7`, `PotentialAutomorphyInfrastructure:PA.1`.

*Sources.*

- Potential automorphy over CM fields, Lemma 7.1.9, p. 1093: “Then Rπ is a very weakly compatible system.” The conclusion under (DGI).
- Potential automorphy over CM fields, Lemma 7.1.10, p. 1094: “Then the extremely weakly compatible system Rπ is irreducible. Moreover hypothesis (DGI) of Lemma 7.1.9 holds and Rπ is a very weakly compatible system.” The unconditional case n = 2.

#### Comparison. What is available at the coefficient prime in each branch, and the explicit non-availability in the non-self-dual case

*Node* `AutomorphicGaloisRepresentationsPartII:AG2.6/coefficient-prime-branch-and-what-it-does-not-give`.

Polarized branch: the construction gives de Rham at all places above p with Hodge-Tate numbers of multiplicity at most one determined by Pi_infinity by an explicit recipe, and crystalline with a Frobenius characteristic-polynomial identity at places where Pi_v has a maximal-compact-fixed vector. The Frobenius-semisimplified Weil-Deligne comparison at places above the coefficient prime is supplied by the l = p paper, which identifies the monodromy operator on the global side using a generalization of Mokrane's weight spectral sequence for log crystalline cohomology; the previously available results required Shin-regular weight (n odd, or n even with an additional regularity condition) and were otherwise only up to semisimplification. Non-self-dual branch: the basic construction's local-global compatibility is asserted only at rational primes q different from p at which pi is unramified, and the source itself says only that 'it may be possible to extend the local-global compatibility to other primes v'; Varma then extends it to all v not dividing p, in the semisimplified form plus a monodromy bound. Nothing in the sources read supplies de Rham, crystalline or full local-global compatibility at places above p in the non-self-dual branch.

*Hypotheses.*

- the polarized de Rham and crystalline statements require conjugate self-duality and cohomologicality
- the crystalline statement requires Pi_v to have a nonzero vector fixed by a maximal compact subgroup of GL(n, K_v)
- the l = p monodromy identification is proved for conjugate self-dual cohomological Pi; it does not apply to the non-self-dual construction
- the Hodge-Tate multiset is determined by the algebraic highest weight through an explicit recipe whose DUAL CONVENTION must be fixed; the sources read state the existence of the recipe but this reading did not transcribe it
- The Hodge–Tate recipe is now transcribed: HT_τ = {a_{ιτ,1} + n − 1, …, a_{ιτ,n}} in BLGGT's convention HT(ε_l) = {−1} (AG2.0/expected-hodge-tate-multiset, AG2.6/polarized-branch-de-rham-and-crystalline).

*Proof outline.*

1. Read off from the statements of the polarized construction (parts (b) and (c)), the l = p paper's Theorem 1.1, and the non-self-dual source's own remark about other primes.
2. The stage text's warning that 'the basic nonselfdual HLTT construction does not by itself supply de Rham/crystalline or full local-global compatibility at every coefficient-prime place' is confirmed by all three sources.

*Acceptance.*

- Check that the crystalline Frobenius polynomial identity is stated for the smallest LINEAR power of the crystalline Frobenius, not for the crystalline Frobenius itself
- Transcribe the Hodge-Tate recipe from Pi_infinity and check the dual convention against the labelled Hodge-Tate multiset the stage requires

*Uses.* `AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-branch-de-rham-and-crystalline`, `AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-system-of-pi`, `AutomorphicGaloisRepresentationsPartII:AG2.1a/polarized-construction-inputs-shin-and-chenevier-harris`, `AutomorphicGaloisRepresentationsPartII:AG2.4/hltt-construction-of-nonselfdual-systems`.

*Sources.*

- Construction of automorphic Galois representations, II, Theorem (3.2.3), part (c), p. 1: “Then ρv := ρι,Π |Γv is crystalline, and if ϕ denotes the smallest linear power of the crystalline Frobenius of Dcrys (ρv ) then det(T − ϕ | Dcris (ρv )) = det(T − L(Πv ⊗ | • |v 1−n 2 )(F robv )).” The crystalline statement with the precise 'smallest linear power' qualification.
- On the rigid cohomology of certain Shimura varieties, Introduction, after Theorem A, p. 1: “It may be possible to extend the local-global compatibility to other primes v. Ila Varma is considering this question.” The non-self-dual construction's own statement of the limits of its local-global compatibility.
- Monodromy and local-global compatibility for l = p, 1 Introduction, p. 1: “This theorem is proved in [BLGGT1, BLGGT2] in the case when Π has Shin-regular weight (either n is odd or if n is even then Π satisfies an additional regularity condition) and in general up to semisimplification.” The precise prior state of the coefficient-prime comparison, and the regularity condition that separates the cases.

### What is missing

- The p-adic Hodge comparison theorems applied to the geometric construction, and their passage through Chenevier–Harris's deformation and descent, are not read (Chenevier–Harris §§2–3; PadicHodgeTheory R06.5).
- The generalized log-crystalline weight spectral sequence of Caraiani's l = p paper (its §§2–5) is not read; only its main theorem is used.
- Coefficient-prime admissibility for the non-self-dual branch beyond (DGI), and the Fontaine–Laffaille/ordinary arithmetic comparisons, belong to PotentialAutomorphyInfrastructure and are not planned here.

## AG2.7 Integral, residual and reusable arithmetic exports

### Objects

#### Construction. The residual representation r̄_{l,ι}(π) over a finite field, its Frobenius polynomials and, for polarized π, its 𝒢_n-valued extension

*Module* `TauCeti/AutomorphicGalois/Residual.lean`. *Node* `AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi`.

Let π be regular algebraic cuspidal over a CM field F and ι: Q̄_l ≅ ℂ. r_{l,ι}(π) takes values in GL_n(E) for some finite E/ℚ_l, and preserves an O_E-lattice. r̄_{l,ι}(π) is the semisimplification of its reduction. It is independent of the lattice and of E, and it is realised over the finite field generated by the reductions of the coefficients of the P_v. For v ∉ S_π ∪ {v | l}, r̄_{l,ι}(π) is unramified at v with det(X − r̄(Frob_v)) = the reduction of ι^{−1}P_v(π_v; X). If (π, χ) is polarized and totally odd, r̄_{l,ι}(π) extends to r̃̄: G_{F⁺} → 𝒢_n(F̄_l) with multiplier ε̄_l^{1−n} r̄_{l,ι}(χ).

*Hypotheses.*

- The finite field of realisation of r_{l,ι}(π) is proved before a lattice is chosen, by compactness of G_F and a Baire category argument (ArithmeticGaloisRepresentations R01.1). This is the order the stage requires.
- Independence of the lattice is Brauer–Nesbitt (R01.1). There is no canonical lattice, and different lattices can give non-isomorphic non-semisimple reductions.
- The 𝒢_n-extension needs the totally odd normalisation (sourceIssue E2). For n = 1 and l > 2, r̃̄(c)² = 1 forces the multiplier to take c to −1, so no extension with an even multiplier exists.

*API.*

- `residualRep` (*constructor*) — r̄_{l,ι}(π): G_F → GL_n(k) for a finite field k.
- `residualRep_charpoly` (*characterisation*) — det(X − r̄(Frob_v)) = reduction of ι^{−1}P_v(π_v) for good v.
- `residualRep_indep_lattice` (*extensionality*) — Independent of the lattice (Brauer–Nesbitt).
- `exists_finite_field_of_realisation` (*characterisation*) — r_{l,ι}(π) is conjugate into GL_n(E), E/ℚ_l finite.
- `residualRep_extendGn` (*constructor*) — For totally odd polarized (π, χ): r̃̄: G_{F⁺} → 𝒢_n(F̄_l) with multiplier ε̄^{1−n}r̄(χ).
- `residualRep_dual` (*functoriality*) — r̄_{l,ι}(π^∨) ≅ r̄_{l,ι}(π)^∨ ⊗ ε̄_l^{1−n}.

*Used by.*

- `AutomorphicGaloisRepresentationsPartII:AG2.7/hecke-maximal-ideal-of-galois-type` — m_π is determined by r̄_{l,ι}(π)
- `AutomorphicGaloisRepresentationsPartII:AG2.7/the-residual-ratio-condition-for-taylor-wiles-primes` — decomposed genericity of r̄
- `PotentialAutomorphyInfrastructure:PA.5` — residual automorphy and the Taylor–Wiles hypotheses

*Unit tests.* A wrong definition fails one of these.

- `residualRep_eisenstein_11a1` (value) — Base change of 11a1 to ℚ(i), l = 5: r̄ ≅ (1 ⊕ ε̄_5^{−1})|_{G_{ℚ(i)}}.
- `residualRep_rank_one` (degenerate) — n = 1: r̄_{l,ι}(ψ) is the reduction of r_{l,ι}(ψ), a character to k^×.
- `not_residualRep_lattice_dependent_nonss` (non-example) — The unsemisimplified reduction depends on the lattice: the Tate modules of the three curves in the isogeny class of 11a1 are lattices in one V_5 with non-isomorphic reductions, all with semisimplification 1 ⊕ ε̄_5. Only the semisimplification is an invariant.
- `residualRep_charpoly_classical` (compatibility) — For the base change of a weight-k newform, the residual Frobenius polynomial is X² − ā_pX + ψ̄(p)p^{k−1} at split p.

*Construction.*

1. Realisation over a finite E: G_F is compact, r(G_F) ⊂ GL_n(Q̄_l) = ∪_E GL_n(E) is a countable union of closed subgroups, so by Baire one of them contains an open subgroup of the image. Finitely many coset representatives then lie in a larger finite E (R01.1 request).
2. A lattice is stable by compactness. Reduce and semisimplify; independence by Brauer–Nesbitt.
3. Frobenius polynomials: reduce ι^{−1}P_v, which is integral since r(Frob_v) preserves a lattice.
4. Field of definition: the traces lie in the residue field of E generated by the reduced coefficients, and Deligne–Serre Lemme 6.13 descends r̄ to it (R01.5).
5. 𝒢_n-extension: reduce the polarized pairing of AG2.0/polarized-galois-representation on a self-dual lattice, or apply BLGGT's remark directly.

*Acceptance.*

- n = 2, the base change of 11a1 to ℚ(i) at l = 5: r̄ is the restriction of 1 ⊕ ε̄_5^{−1}, the dual of 1 ⊕ ε̄_5, which is reducible.
- n = 2 at l = 3 for the same form: r̄ is the restriction of ρ̄_{11a1,3}^∨, whose irreducibility over ℚ is the AutomorphicGaloisRepresentations R19.6 example.

*Uses.* `AutomorphicGaloisRepresentationsPartII:AG2.6/compatible-system-of-pi`, `AutomorphicGaloisRepresentationsPartII:AG2.0/polarized-galois-representation`, `ArithmeticGaloisRepresentations:R01.1`, `ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent`, `GlobalGaloisDeformations:G7/polarized-deformation-problem`.

*Planet:* Residual representation of π.

*Sources.*

- Potential automorphy and change of weight, §2.1, after Theorem 2.1.1, p. 34: “We will let rl,ı(π) denote the semisimpliﬁcation of the reduction of rl,ı(π).” The residual representation.
- Potential automorphy and change of weight, §2.1, p. 34: “If F is imaginary CM then it extends to a continuous homomorphism” The 𝒢_n-valued extension with multiplier ε̄^{1−n} r̄(χ).
- Potential automorphy over CM fields, §7.1, p. 1085: “However, because its trace lies in OM/λ and because the Brauer groups of all ﬁnite ﬁelds are trivial, it is actually a representation” Realisation of r̄_λ over O_M/λ.

#### Definition. Maximal ideals of the unramified Hecke algebra of Galois type and non-Eisenstein, and the maximal ideal of π

*Module* `TauCeti/AutomorphicGalois/GaloisType.lean`. *Node* `AutomorphicGaloisRepresentationsPartII:AG2.7/hecke-maximal-ideal-of-galois-type`.

Let S be a finite set of places of F and 𝕋^S = ⊗′_{v∉S} H(GL_n(F_v), GL_n(O_{F_v})) ⊗ O, with O the ring of integers of a finite extension of ℚ_l with residue field k. A maximal ideal m ⊂ 𝕋^S is of Galois type if 𝕋^S/m is a finite extension of k and there is a continuous semisimple ρ̄_m: G_{F,S} → GL_n(𝕋^S/m) with det(X − ρ̄_m(Frob_v)) equal to the image of P_v(X) for all v ∉ S. It is non-Eisenstein if moreover ρ̄_m is absolutely irreducible. For π regular algebraic cuspidal, unramified outside S, m_π is the kernel of 𝕋^S → Ō → F̄_l given by ι^{−1} of π's Hecke eigenvalues. It is of Galois type with ρ̄_{m_π} ≅ r̄_{l,ι}(π), and m_π depends only on r̄_{l,ι}(π) together with the eigenvalues mod l.

*Hypotheses.*

- ρ̄_m is unique up to isomorphism (Čebotarev and Brauer–Nesbitt), so m ↦ ρ̄_m is well defined on maximal ideals of Galois type.
- 𝕋^S here is the abstract unramified Hecke algebra (IHG.3). The Hecke algebras acting on cohomology of locally symmetric spaces, and the theorem that their maximal ideals in the support of cohomology are of Galois type (Scholze; ACC+ Theorem 2.3.5), are TorsionCohomologyInfrastructure's.
- P_v here is written with the correct last term (−1)^n q_v^{n(n−1)/2}T_{v,n} (sourceIssue E3).

*API.*

- `IsGaloisType` (*data*) — m.IsGaloisType :⇔ finite residue field ∧ ∃ ρ̄ semisimple with Frobenius polynomials P_v mod m.
- `IsGaloisType.rho` (*constructor*) — ρ̄_m, unique up to isomorphism.
- `IsNonEisenstein` (*data*) — IsGaloisType ∧ ρ̄_m absolutely irreducible.
- `IsGaloisType.dual` (*functoriality*) — m^∨ is of Galois type, ρ̄_{m^∨} ≅ ρ̄_m^∨ ⊗ ε̄^{1−n}.
- `IsGaloisType.twist` (*functoriality*) — m(ψ) is of Galois type, ρ̄_{m(ψ)} ≅ ρ̄_m ⊗ ψ.
- `maxIdealOf` (*constructor*) — m_π := kernel of 𝕋^S → F̄_l from ι^{−1} of π's Hecke eigenvalues.
- `maxIdealOf_isGaloisType` (*characterisation*) — m_π is of Galois type with ρ̄_{m_π} ≅ r̄_{l,ι}(π).

*Used by.*

- `TorsionCohomologyInfrastructure:TC.4` — maximal ideals in the support of cohomology are of Galois type (Scholze)
- `PotentialAutomorphyInfrastructure:PA.5` — non-Eisenstein maximal ideals in automorphy lifting

*Unit tests.* A wrong definition fails one of these.

- `isGaloisType_rank_one` (degenerate) — n = 1: every maximal ideal with finite residue field is of Galois type.
- `isEisenstein_11a1_five` (value) — 11a1 at l = 5: m is of Galois type and not non-Eisenstein.
- `isNonEisenstein_11a1_three` (value) — 11a1 at l = 3: m is non-Eisenstein.
- `not_isGaloisType_arith_convention` (non-example) — Using the arithmetic-Frobenius reading of P_v gives ρ̄_m^∨ instead of ρ̄_m; the definition must fix the geometric convention (AG2.0/frobenius-polynomial-and-conventions).

*Construction.*

1. Well-definedness: 'of Galois type' is an existence statement over 𝕋^S/m, and uniqueness of ρ̄_m is R01.5 recognition plus Lemme 6.13 for descent to 𝕋^S/m.
2. m_π: the eigenvalues of T_{v,i} on π_v^{GL_n(O_v)} are algebraic integers (AG2.0/field-of-rationality with integrality from AF.4), so ι^{−1} maps them to Ō. The kernel of the reduction map is maximal with finite residue field.
3. Galois type for m_π: r̄_{l,ι}(π) has Frobenius polynomials the reductions of P_v (AG2.7/residual-representation-of-pi), realised over 𝕋^S/m_π by Lemme 6.13.
4. Duals and twists (ACC+ after Definition 2.3.6): m^∨ is of Galois type with ρ̄_{m^∨} ≅ ρ̄_m^∨ ⊗ ε̄^{1−n}, and ρ̄_{m(ψ)} ≅ ρ̄_m ⊗ ψ.

*Acceptance.*

- n = 1: every maximal ideal of 𝕋^S of finite residue field is of Galois type, by class field theory. ρ̄_m is the character with Frob_v ↦ T_{v,1} mod m.
- n = 2, F = ℚ, 11a1: at l = 5, ρ̄_m ≅ 1 ⊕ ε̄_5^{−1} (the dual of ρ̄_{11a1,5}^{ss} = 1 ⊕ ε̄_5) is reducible, so m is of Galois type but not non-Eisenstein. At l = 3, ρ̄_m is irreducible and m is non-Eisenstein.

*Uses.* `AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi`, `AutomorphicGaloisRepresentationsPartII:AG2.0/frobenius-polynomial-and-conventions`, `IntegralHeckeAndGaloisDeterminants:IHG.3`, `ArithmeticGaloisRepresentations:R01.5/recognition-by-characteristic-polynomials-and-coefficient-descent`.

*Sources.*

- Potential automorphy over CM fields, Definition 2.3.6, p. 938: “We say that a maximal ideal m ⊂TS is of Galois type if its residue ﬁeld is a ﬁnite extension of k, and there exists a continuous, semi-simple representation ρm : GF,S →GLn(TS/m)” The definition.
- Potential automorphy over CM fields, After Definition 2.3.6, p. 938: “We say that a maximal ideal m ⊂TS is non-Eisenstein if it is of Galois type and ρm is absolutely irreducible.” Non-Eisenstein.

#### Definition. Decomposed genericity: the exact residual ratio condition, and the separate enormity condition

*Module* `TauCeti/AutomorphicGalois/DecomposedGeneric.lean`. *Node* `AutomorphicGaloisRepresentationsPartII:AG2.7/the-residual-ratio-condition-for-taylor-wiles-primes`.

Definition 4.3.1 of the potential-automorphy source, with k a finite field of characteristic p. (1) For l different from p and L/Q_l finite, a continuous r: G_L -> GL_n(k) is GENERIC if it is UNRAMIFIED and the eigenvalues alpha_1, ..., alpha_n in k of r(Frob_L), taken with multiplicity, satisfy alpha_i/alpha_j different from |O_L/m_L| for all i different from j. (2) For L a number field and r: G_L -> GL_n(k) continuous, a prime l different from p is DECOMPOSED GENERIC FOR r if l splits completely in L and r restricted to G_{L_v} is generic for every place v | l. (3) r is DECOMPOSED GENERIC if some prime l different from p is decomposed generic for r. The condition depends only on the projectivisation. Lemma 4.3.2: if r is decomposed generic then infinitely many primes are decomposed generic for r, by Chebotarev applied to the Galois closure of the extension of L(zeta_p) cut out by r. Two consequences matching the stage text: the condition is on the RATIO alpha_i/alpha_j being different from the residue cardinality, so repeated eigenvalues alpha_i = alpha_j are permitted exactly when the residue cardinality is different from 1 in k, i.e. when q is not congruent to 1 modulo p; and pairwise distinctness of the alpha_i neither implies nor is implied by it. Separately, the residual-image condition that the Taylor-Wiles construction consumes is ENORMITY of the image of rho restricted to G_{F(zeta_p)}: an absolutely irreducible H in GL_n(k) is enormous over k if (1) H has no nontrivial p-power order quotient, (2) H^0(H, ad^0) = H^1(H, ad^0) = 0, and (3) for any simple k[H]-submodule W of ad^0 there is a regular semisimple h in H with W^h nonzero; it depends only on the image in PGL_n(k), is invariant under algebraic extension of k, and is unsatisfiable when p divides n because ad^0 then contains the scalars. Decomposed genericity and enormity are different conditions appearing at different points; neither implies the other in the source read.

*Hypotheses.*

- genericity as defined BUNDLES unramifiedness with the ratio condition; the atlas stage text states the ratio condition and 'residual unramifiedness stated separately', which is the same content split differently - any transcription must keep both
- the ratio condition compares alpha_i/alpha_j with the residue cardinality |O_L/m_L| reduced into k, not with the rational integer
- decomposed genericity requires l to split COMPLETELY in L and genericity at EVERY place above l, not at one place
- enormity requires absolute irreducibility as part of its definition and fails identically when p divides n
- the source notes immediately before the definition that 'the roles of p and l are reversed' relative to the surrounding discussion; the naming of the two primes must be tracked

*API.*

- `IsGeneric` (*data*) — r: G_L → GL_n(k) (L/ℚ_l finite, l ≠ p) is unramified and α_i/α_j ≠ |O_L/m_L| for the eigenvalues α of r(Frob_L), with multiplicity, i ≠ j.
- `IsDecomposedGenericPrime` (*data*) — l ≠ p splits completely in L and r|_{G_{L_v}} is generic for every v | l.
- `IsDecomposedGeneric` (*data*) — Some prime l ≠ p is decomposed generic for r.
- `IsDecomposedGeneric.infinite` (*characterisation*) — Then infinitely many primes are decomposed generic (ACC+ Lemma 4.3.2).
- `IsDecomposedGeneric.of_not_zeta` (*characterisation*) — If the normal closure of L^{ker ad r} contains no primitive p-th root of unity, r is decomposed generic (ACC+ Lemma 7.1.5).
- `IsDecomposedGeneric.restrict` (*compatibility*) — Preserved by restriction to LE for E/ℚ Galois and linearly disjoint from the Galois closure of L^{ker r}(ζ_p) (ACC+ Lemma 7.1.7).
- `IsGeneric.projective` (*relation*) — Depends only on the projectivisation of r.

*Used by.*

- `AutomorphicGaloisRepresentationsPartII:AG2.6/very-weak-compatibility-under-dgi` — the hypothesis (DGI) on the residual members of R_π
- `PotentialAutomorphyInfrastructure:PA.4` — auxiliary primes in the Taylor–Wiles–Calegari–Geraghty method

*Unit tests.* A wrong definition fails one of these.

- `isGeneric_repeated_eigenvalue` (value) — n = 2, k = 𝔽₃, q = |O_L/m_L| ≡ 2 mod 3, α₁ = α₂ = 1: the ratio 1 ≠ 2, so r is generic with a repeated eigenvalue.
- `not_isGeneric_distinct_ratio_q` (non-example) — n = 2, k = 𝔽₅, q ≡ 2 mod 5, α₁ = 2, α₂ = 1: distinct eigenvalues but α₁/α₂ = q, so r is not generic. Pairwise distinctness is not the condition.
- `isGeneric_rank_one` (degenerate) — n = 1: every unramified character is generic (no pairs i ≠ j).
- `not_enormous_p_dvd_n` (non-example) — For p | n, ad⁰ contains the scalars, so enormity fails, while decomposed genericity can hold: the two conditions are independent.

*Construction.*

1. Definition 4.3.1 is read literally from the source.
2. Lemma 4.3.2's proof: let K' be the Galois closure of the extension of L(zeta_p) cut out by r; if l_0 is decomposed generic for r then so is any prime l unramified in K' whose Frobenius lies in the same conjugacy class of Gal(K'/Q), and there are infinitely many such by Chebotarev.
3. The enormity definition and its coefficient-extension invariance are read from the same source; Lemma 6.2.30's proof is reproduced in this job's ArithmeticGaloisRepresentations packet.

*Acceptance.*

- Exhibit a residual representation with a repeated eigenvalue that is nevertheless generic at a place with q not congruent to 1 mod p, confirming that the ratio condition is weaker than pairwise distinctness
- Exhibit pairwise distinct eigenvalues with alpha_i/alpha_j equal to q, confirming that distinctness does not imply genericity
- Check that enormity fails for p | n by exhibiting the scalars in ad^0

*Uses.* `AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi`.

*Planet:* Decomposed generic residual representation.

*Sources.*

- Potential automorphy over CM fields, Definition 4.3.1(1), printed p. 972: “We say that a continuous representation r : GL → GLn (k) is generic if it is unramified and the eigenvalues (with multiplicity) α1 , . . . , αn ∈ k of r(FrobL ) satisfy αi /αj 6= |OL /mL | for all i 6= j.” The exact ratio condition, with multiplicity allowed and unramifiedness bundled in. This confirms the atlas stage text's insistence that the condition is on the ratio and not on distinctness.
- Potential automorphy over CM fields, Definition 4.3.1(2), printed p. 972: “We say that a prime l 6= p is decomposed generic for r if l splits completely in L and for all places v|l of L, r|GLv is generic.” The completely-split hypothesis and the requirement at every place above l, both of which the atlas stage text records.
- Potential automorphy over CM fields, Definition 6.2.29(3), printed p. 1044: “(3) For any simple k[H]-submodule W ⊆ ad0 , there is a regular semisimple h ∈ H such that W h 6= 0.” The third clause of enormity, a separate condition from decomposed genericity.
- Potential automorphy over CM fields, Note after Definition 6.2.29, printed p. 1044: “If p divides n, then no subgroup of GLn (k) is enormous (because ad0 contains the scalar matrices).” Constrains which residual characteristics the export can serve.

### What is missing

- The typed export packages of the stage are interface packaging over the objects above and carry no separate mathematics; they are recorded, not planned.
- The 'stronger decomposed-generic API' that the stage mentions as a separate specialization is not identified in the sources read.
- Where decomposed genericity is consumed in ACC+ (Chapters 4–6) is not read; only its uses in §7.1 are.

## Required examples and checks

- n = 1: the system of an algebraic Hecke character is weakly compatible. Decomposed genericity always holds in rank 1.
- n = 2: the base change of a weight-k newform has H = {k − 1, 0}, purity weight k − 1 and HT(det) = k − 1.
- 11a1: the residual representation at l = 5 is Eisenstein (1 ⊕ ε̄_5^{−1}), and the lattices in its isogeny class have different reductions. At l = 3 it is non-Eisenstein.
- Decomposed genericity: the repeated eigenvalue (1, 1) over 𝔽₃ with q ≡ 2 is generic; the distinct pair (2, 1) over 𝔽₅ with q ≡ 2 is not.

## Requests

- **PadicHodgeTheory:R06.2** — De Rham, crystalline and semistable representations of G_K for K/ℚ_l finite, with labelled Hodge–Tate numbers HT_τ in the convention HT(ε_l) = {−1}. Needed by: `AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-branch-de-rham-and-crystalline`.
- **PadicHodgeTheory:R06.3** — The Weil–Deligne representation WD(ρ) of a potentially semistable ρ and its Frobenius semisimplification, for the comparison ι WD(r|_{G_{F_v}})^{F-ss} ≅ rec(π_v ⊗ |det|^{(1−n)/2}) at v | l. Needed by: `AutomorphicGaloisRepresentationsPartII:AG2.6/polarized-branch-de-rham-and-crystalline`.
- **ArithmeticGaloisRepresentations:R01.1** — A continuous representation G_F → GL_n(Q̄_l) is conjugate into GL_n(E) for a finite E/ℚ_l (Baire), and then preserves an O_E-lattice. The semisimplified reduction is independent of the lattice (Brauer–Nesbitt). Needed by: `AutomorphicGaloisRepresentationsPartII:AG2.7/residual-representation-of-pi`.
- **IntegralHeckeAndGaloisDeterminants:IHG.3** — The abstract unramified Hecke algebra 𝕋^S = ⊗′_{v∉S} H(GL_n(F_v), GL_n(O_{F_v})) ⊗ O with the Hecke polynomials P_v(X), for maximal ideals of Galois type. Needed by: `AutomorphicGaloisRepresentationsPartII:AG2.7/hecke-maximal-ideal-of-galois-type`.
- **EndoscopicTransferAndUnitaryTraceComparison:ET.7** — Arthur–Clozel solvable base change for GL_n, used to meet the hypotheses of ACC+ Theorem 4.5.1 in Lemma 7.1.9. Needed by: `AutomorphicGaloisRepresentationsPartII:AG2.6/very-weak-compatibility-under-dgi`.
- **PotentialAutomorphyInfrastructure:PA.1** — ACC+ Theorem 4.5.1: local–global compatibility at l = p in the Fontaine–Laffaille range for the Galois representations of torsion cohomology, which gives crystallinity and Hodge–Tate numbers of r_{π,λ} for density-one l under (DGI). Needed by: `AutomorphicGaloisRepresentationsPartII:AG2.6/very-weak-compatibility-under-dgi`.

## Coverage

- **AutomorphicGaloisRepresentationsPartII:AG2.6** (partial). Checkpoint 1 plans the compatible system R_π (extremely weakly compatible, ACC+ §7.1), the very/extremely weak notions as weakenings of R24.5's weakly compatible systems, the polarized branch at l (de Rham with the expected Hodge–Tate multiset, Iwahori-case Weil–Deligne compatibility), strict purity and total oddness of the polarized system (with the corrected sign of E2), and very weak compatibility under (DGI) (ACC+ Lemmas 7.1.9–7.1.10). The decomposition's comparison node is carried with its Hodge–Tate recipe now transcribed.
  - Remaining: The p-adic Hodge comparison theorems applied to the geometric construction, and their passage through Chenevier–Harris's deformation and descent, are not read (Chenevier–Harris §§2–3; PadicHodgeTheory R06.5).
  - Remaining: The generalized log-crystalline weight spectral sequence of Caraiani's l = p paper (its §§2–5) is not read; only its main theorem is used.
  - Remaining: Coefficient-prime admissibility for the non-self-dual branch beyond (DGI), and the Fontaine–Laffaille/ordinary arithmetic comparisons, belong to PotentialAutomorphyInfrastructure and are not planned here.
- **AutomorphicGaloisRepresentationsPartII:AG2.7** (partial). Checkpoint 1 plans the residual representation r̄_{l,ι}(π) with its finite field of realisation before the lattice, independence of the lattice, Frobenius polynomials and the 𝒢_n-extension; maximal ideals of Galois type and non-Eisenstein with m_π; and gives decomposed genericity (ACC+ 4.3.1) its API and unit tests.
  - Remaining: The typed export packages of the stage are interface packaging over the objects above and carry no separate mathematics; they are recorded, not planned.
  - Remaining: The 'stronger decomposed-generic API' that the stage mentions as a separate specialization is not identified in the sources read.
  - Remaining: Where decomposed genericity is consumed in ACC+ (Chapters 4–6) is not read; only its uses in §7.1 are.

## Gaps

- **Decomposed genericity is now verified; what remains is its relation to the other AG2.7 exports** (needed by `AutomorphicGaloisRepresentationsPartII:AG2.7`, `AutomorphicGaloisRepresentationsPartII:AG2.7/the-residual-ratio-condition-for-taylor-wiles-primes`). Correction to an earlier draft of this packet: the ratio condition IS in the supplied library. It is Definition 4.3.1 of the potential-automorphy source (references/text/accplus-potential-automorphy.txt, printed pp. 972-973), and it has now been read together with Lemma 4.3.2. It matches the atlas stage text, with one presentational difference: the source bundles unramifiedness into the definition of 'generic', whereas the stage text states the ratio condition and adds 'with residual unramifiedness stated separately'. NOT verified: where in the source's arguments decomposed genericity is used, and how it interacts with enormity - the stage text says 'Do not deduce global residual irreducibility or adequacy from local genericity', and nothing read here establishes or refutes such an implication. Also not verified: the 'stronger decomposed-generic API' the stage mentions as a separate specialization. Next source action: read the source's Theorem 4.3.3 and Section 4.3 in full, and the places listed by grep where 'rho_m is decomposed generic' appears as a hypothesis (printed pp. 950, 968, 1012, 1050 area), to record exactly what each use consumes.

## Source issues

- **AutomorphicGaloisRepresentationsPartII/E3** (misprint; Potential automorphy over CM fields, §2.2.5, (2.2.6), p. 922; checked on the page image; affects nothing; known: new: present in the journal-paginated copy (Annals 197 (2023)); no erratum found). Printed: “Pv(X) = Xn −Tv,1Xn−1 + · · · + (−1)iqi(i−1)/2 v Tv,iXn−i + · · · · · · + qn(n−1)/2 v Tv,n” Correction: The last term is (−1)^n q_v^{n(n−1)/2} T_{v,n}, the i = n case of the general term. Reason: For n = 1 the printed form gives X + T_{v,1} while the general term gives X − T_{v,1}, and the characteristic polynomial of the Frobenius on an unramified character χ is X − χ(ϖ_v). The proof of Theorem 2.3.5 (p. 938) prints the same polynomial with the last term (−1)^n q_v^{n(n−1)/2} T_{v,n}.
- **AutomorphicGaloisRepresentationsPartII/E4** (misprint; Potential automorphy over CM fields, §2.2.5, (2.2.7) and the definition of P̃_{v,σ}, p. 922; Lemma 2.2.13(2), p. 927; affects nothing; known: new: present in the journal-paginated copy; no erratum found). Printed: “(2.2.7) … + (−1)jqj(j−1)/2 v eTv,j + · · · ; ‹Pv,σ(X) = P2n i=0(−1)iev,i(σ)Xn−i ; (Lemma 2.2.13(2)) is equals P2n i=0(−1)iev,i(σ, eπv)Xn−i.” Correction: The general term of (2.2.7) is (−1)^j q_v^{j(j−1)/2} T̃_{v,j} X^{2n−j}, and both sums of degree 2n are Σ_{i=0}^{2n} (−1)^i e_{v,i} X^{2n−i}. Reason: P̃_v is monic of degree 2n (its leading term X^{2n} is printed), so the i-th term must carry X^{2n−i}; with X^{n−i} the sum has negative exponents for i > n.

## Sources

- **Potential automorphy and change of weight**, Thomas Barnet-Lamb, Toby Gee, David Geraghty and Richard Taylor. arXiv:1010.2561v4, 9 December 2013, the last arXiv version (published Annals of Math. 179 (2014), 501–609). Printed page = PDF page. R. Taylor's copy pa3.pdf has the same text in §2.1 https://arxiv.org/pdf/1010.2561v4 (SHA-256 c953df6229ba8d8b4ae25b1a00cf11592864c74692859d324ff10d3eef645d24). Read: Introduction: Theorems A–D, pp. 1–6; Notation: Artin normalisation, rec, HT_τ(ε_l) = {−1}, algebraic characters, pp. 8–10; §2.1 Terminology: polarized l-adic and mod l representations, totally odd, algebraic, polarized automorphic representations, (ℤⁿ)_w, extremely regular, Ξ_a, weight, ι-ordinary, Theorem 2.1.1 with its proof and remarks, pp. 31–34; §5.1 remark on the weights of r_{l,ι}(χ), p. 65; Theorem 5.5.1's proof and the remark before Theorem 5.5.2, p. 81; Appendix A.2: algebraic characters and their weights (1)–(8), Lemmas A.2.1–A.2.5, pp. 87–90; cc-fb70e5, 2026-09-29 (part AG2.6): §5.1 Compatible systems: definitions, pp. 62–65.
- **Potential automorphy over CM fields**, Patrick B. Allen, Frank Calegari, Ana Caraiani, Toby Gee, David Helm, Bao V. Le Hung, James Newton, Peter Scholze, Richard Taylor and Jack A. Thorne. Annals of Mathematics 197 (2023), 897–1113; the authors' copy Ramanujan.pdf, which carries the journal pagination (printed page = PDF page + 896) https://www.math.uchicago.edu/~fcale/papers/Ramanujan.pdf (SHA-256 c5429e4f384384045dbb48502d71547bb21699783c0f77cce27b24e742467f02). Read: Earlier decomposition: 4.3 Definition 4.3.1 and Lemma 4.3.2 (pp. 972–973); 6.2.28–6.2.31 (pp. 1044–1045); cc-fb70e5, 2026-09-29 (part AG2.0, checkpoint 1): §1 notation (Artin and rec normalisations, rec^T, algebraic characters, regular algebraic of weight ξ, totally odd), pp. 906–909; §2.2.5 with (2.2.6)–(2.2.7), pp. 921–922; Theorems 2.3.2–2.3.3, pp. 935–936; Definition 2.3.6 and the contragredient remark after it, p. 938; §7.1 up to Lemma 7.1.9, p. 1093; Corollary 7.2.4, p. 1100; cc-fb70e5, 2026-09-29 (part AG2.6): §§2.2.5–2.3 again, including (2.2.6)–(2.2.7), Lemma 2.2.13, Theorem 2.3.5 and Definition 2.3.6 (pp. 921–938); §7.1 with Lemmas 7.1.1–7.1.10 (pp. 1084–1094).
- **On the rigid cohomology of certain Shimura varieties**, Michael Harris, Kai-Wen Lan, Richard Taylor and Jack Thorne. Author's copy rigcoh.pdf (published in Res. Math. Sci. 3 (2016)); read from the supplied extracted text references/text/SS_HLTT.txt. Locators give the article's own page numbers and result numbers https://www.kwlan.org/articles/rigcoh.pdf (SHA-256 abecfd049d617654dd0bb60e4945bf6967d3953ed20f2126de0624f2bd0bdbc7). Read: Abstract and Introduction: Theorem A (quoted there as Corollary 7.14), the remark on extending local-global compatibility, the sketch of the argument including the group G_n, its maximal parabolic and Levi, the induced representation Pi(N), the realization in overconvergent p-adic cusp forms of finite slope, Katz's congruence argument, and the dagger-space set-up with the ordinary loci and the subcanonical sheaf, pp. 1-3; Reviewer (REVIEW-EXT-10-EXT-07): abstract and introduction pp. 1-3 (the displayed 2n-dimensional decomposition checked on the page image of p. 2), bibliography entries [CH], [Sh1], [Sh2].
- **Construction of automorphic Galois representations, II**, Gaetan Chenevier and Michael Harris. Author's copy ConstructionII.pdf (published in Camb. J. Math. 1 (2013), 53-73); read from the supplied extracted text references/text/SS_ChenevierHarris.txt. Locators give the article's own page and result numbers https://webusers.imj-prg.fr/~michael.harris/ConstructionII.pdf (SHA-256 9b5e76798f75273f53d1d4160f35815b1a3b656f04c965ad47fd4fa454840529). Read: Introduction: the setting (F totally real, K/F totally imaginary quadratic, G = Res_{K/Q} GL(n)), and the main theorem quoted there as Theorem 3.2.3 with its parts (a), (b), (c), p. 1; Reviewer (REVIEW-EXT-10-EXT-07): introduction pp. 1-2 and the paragraph before Theorem 2.3 describing the dominance relation (it implies s = s' and N in the Zariski closure of the conjugacy class of N'), bibliography entry [Ch] = Chenevier, Une application des varietes de Hecke des groupes unitaires; cc-fb70e5, 2026-09-29: §4, General Hypotheses 4.1 and Theorem 4.2 (totally real fields), p. 13.
- **Monodromy and local-global compatibility for l = p**, Ana Caraiani. arXiv:1202.4683v1, 21 February 2012 (published Algebra Number Theory 8 (2014)); read from references/text/SS_CaraianiMonodromyAtP.txt. Locators give the arXiv version's page numbers https://arxiv.org/pdf/1202.4683 (SHA-256 6ec698414d5d3ad03f3d1c98de178b39d69722699f4a08a059e8d14027df885e). Read: Abstract and 1 Introduction: Theorem 1.1, the statement of what was known from Barnet-Lamb-Gee-Geraghty-Taylor and what is new, and the announcement of a generalization of Mokrane's weight spectral sequence for log crystalline cohomology, p. 1; Reviewer (REVIEW-EXT-10-EXT-07): abstract and introduction pp. 1-2, including the use of Theorem 1.2 of [C] and of Lemma 1.4(4) of Taylor-Yoshida.
