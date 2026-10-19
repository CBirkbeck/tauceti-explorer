# K-theory of number fields and S-integers

This roadmap builds the arithmetic interfaces for algebraic K-theory: localization with its actual maps, finite generation and ranks, twisted roots of unity, integral odd groups, even-primary comparisons, and independently certified examples. Its number rings are the existing S-integer subalgebras. The additional hermitian milestone proves finite generation of both classical Grothendieck–Witt flavours over those rings. The Bott-inverted arithmetic tables fix every degree and Adams sign needed by the symplectic arithmetic continuation.

The mathematics below is a specification, not an implementation claim. All ten stages are planned at target level. The final proof-boundary register names the remaining exact supplier contracts and source-proof gaps. Proposed declaration names describe the library API even when their carriers cannot yet be expressed in the suggested Lean file.

## Conventions and ownership

Let F be a number field, O_F its ring of integers, and S a set of height-one primes of O_F. Write O_(F,S) for Mathlib’s subalgebra `Set.integer S F`: x belongs exactly when v_p(x)≤1 for every p outside S. S contains only finite places; real places are added explicitly in cohomology and completion products. Every finite-generation or finite-S rank assertion assumes S finite. Statements of localization and monotonicity that allow arbitrary S say so. K0 and K1 use the owners’ projective/Grothendieck and stable-linear models; higher K uses the connective spectrum supplied by GeneralAlgebraicKTheory and StableHomotopyKTheory. No new arithmetic model replaces those carriers.

Use additive notation for K-groups and cohomology. The divisor boundary has p-coordinate ord_p(x), and e_p maps to [p]^(−1) in the rank–Picard splitting of K0. Tau Ceti’s multiplicative valuation uses the negative of ord_p; translate the sign before comparing the S-unit class map. For E/F finite, pullback means extension of scalars and transfer means restriction of scalars; on K1 they are inclusion and the field norm. Ramified residue pullback has factor e(q/p).

Write Z/m(j) for the étale Tate twist, including the dual twist for negative j. Q/Z(j) is the direct sum of its primary Tate twists, not an untwisted group of roots of unity. N.4 alone defines W_j(F)=H0(F,Q/Z(j)); w_j is its order only under finiteness. For number fields the finite statements require j≠0; W0 is infinite. Finite coefficients mean the cofibre K/m, with its Bockstein sequence. A product at a safe prime-power modulus does not confer a ring structure on moduli 2,3,4,8. Completed groups and the primary subgroup of an integral group are different objects until the named finite-generation/comparison theorem relates them.

For the added Bott tables put q=p^r with p odd, r≥1, Z′=Z[1/p], O_q=Z[ζ_q], O′_q=O_q[1/p]. K^β has integer degrees and is M.7’s Bott-inverted spectrum. The superscripts + and − mean eigenspaces of dualization ψ^(−1) over Z/q. They do not mean cyclotomic complex conjugation. The native module eigenspace is `Module.End.eigenspace`.

| Owner | Export used here | Arithmetic work retained here |
| --- | --- | --- |
| KTheoryLowDegrees Z/U | K0 and determinant K1, projectives and Picard groups | S-integer specialization and norm/transfer comparisons |
| SchemeKTheoryOperations S.3; K2SymbolsBrauer T.5 | Dedekind sequence and normalized boundaries; tame-kernel rows and K2(Z), K2(Q) | Finite support, ramified functoriality, higher-degree arithmetic and certificates |
| BorelRegulators R.1/R.3 | Building, Steinberg, orientation-correct integral arithmetic homology; ranks for orders | Quillen filtration assembly; finite-S extension of the rank formula |
| MotivicEtaleKTheory M.7 | Descent, Adams operations, named Suslin-real and corrected real-place comparison | Arithmetic integral extensions, specialized Bott tables and comparisons |
| GN.6; HermitianKTheoryOfPoincareCategories HK.7/HK.8; GN Part II | Poincaré/GW/L foundations, comparison ranges, classical fibre sequences and Dedekind L tables | Number-ring L and GW finite generation |
| IntegralIwasawaTheory early finite layers; ClassFieldTheory Layer 5; ArithmeticGaloisDuality | Cyclotomic class arithmetic, local Brauer invariant, Kummer and global duality | Regular-prime K consequences and arithmetic certificate bounds |
| N.4 and N.3:ranks → SpecialValuesBirchTate B.1 | W2 and finite K2(O_F) | Single arithmetic owners; B.1 states the special-value formula |
| N.8 → SpecialValuesBirchTate B.3 | Independent real-quadratic tame-kernel certificate | B.3 retains the zeta/w2 comparison |
| N.5/N.8 → K3BlochGroups V.5 | Arithmetic K3 groups of Q and Q(i) | V.5 retains Milnor/decomposable versus indecomposable classes |

The stable rational rank theorem precedes regulator lattices: Quillen finite generation uses only R.1’s integral arithmetic input, and R.3’s orders-only rank formula is independent of N.5. The early M.7 torsion edge is distinct from the full M.8 Chern/regulator family. These boundaries are required to avoid the inherited Chern-family cycle recorded at the end.

## N.1 — S-integers, low degrees and arithmetic maps

The localization presentation is a theorem about the existing subalgebra, not its definition. A denominator submonoid M presents O_(F,S) exactly when its elements become units and each prime in S meets M. A torsion class group supplies such denominators even when individual prime ideals are not principal. Enlarging S, extending F and taking norms must commute with these presentations. The K0 splitting is Z⊕Cl(O_(F,S)); K1 is the S-unit group, while K1(F)=F^× need not be finitely generated. Test empty S, all primes, a nonprincipal ideal class and a genuinely ramified finite extension.

### When the ring of S-integers is a localisation, and independence of the presentation

**Target:** `ArithmeticKTheory:N.1/S-integers-as-a-localisation`.

Let R be a Dedekind domain with fraction field K, S any set of height-one primes of R, and O_S = S.integer K the ring of S-integers (Mathlib's Set.integer: the x ∈ K with v(x) ≤ 1 for every v ∉ S), an R-subalgebra of K. Let M_S ⊆ R be the submonoid of the r ∈ R whose image in O_S is a unit, equivalently r ≠ 0 and v(r) = 1 for every v ∉ S (the preimage of the units of O_S, Mathlib's Submonoid.comap of IsUnit.submonoid). For a submonoid M of R the following are equivalent: (i) O_S is the localisation of R at M (Mathlib's IsLocalization M O_S); (ii) M ⊆ M_S and every v ∈ S contains an element of M. Consequently a presentation of O_S as a localisation of R, when one exists, is any submonoid satisfying (ii), and every such presentation yields the same subring O_S of K: the ring does not depend on the presentation. No finiteness of S is needed. The carrier itself, its Dedekind property and its class group are already in the pinned libraries and are not re-planned.

**Hypotheses.** R is a Dedekind domain (Mathlib's IsDedekindDomain) with fraction field K; valuations are Mathlib's HeightOneSpectrum.valuation, written multiplicatively, so v(r) ≤ 1 for r ∈ R and v(r) < 1 iff r ∈ v. S is an arbitrary set of height-one primes; the stage's O_{F,S} is the case R = 𝓞_F, S finite. O_S is Mathlib's Set.integer S K; Tau Ceti already proves that it is a Dedekind domain (TauCeti/RingTheory/DedekindDomain/SInteger/Basic.lean:271, an anonymous instance) and computes its class group (IsDedekindDomain.integerClassGroupEquiv), so neither is planned here. Whether (ii) can be met is a class-group question: the next node shows M_S meets it when Cl(R) is torsion, and Tau Ceti's SInteger/Basic.lean docstring gives a Dedekind domain with Cl(R) ≅ ℤ where it cannot.

**Proof plan.**

1. (i) ⇒ (ii), first half: the elements of M become units of O_S, and a unit of O_S has valuation 1 at every v ∉ S (Set.unitEquivUnitsInteger, Set.mem_integer_iff), so M ⊆ M_S.
2. (i) ⇒ (ii), second half: if some v ∈ S met M in no element, then M ⊆ R ∖ v, so M⁻¹R ⊆ R_v and the extension of v to M⁻¹R is proper; but v·O_S = O_S (Tau Ceti's IsDedekindDomain.integer_map_asIdeal_eq_top), a contradiction.
3. (ii) ⇒ (i), units: M ⊆ M_S. Kernel: R → K is injective, so the kernel condition of IsLocalization is vacuous.
4. (ii) ⇒ (i), surjectivity: for x ∈ O_S the set of v with v(x) > 1 is finite (Mathlib's HeightOneSpectrum.Support.finite) and contained in S; for each such v choose m_v ∈ M ∩ v, so v(m_v) < 1 (valuation_lt_one_iff_mem) and w(m_v) ≤ 1 for all w; for k large, y = x·∏ m_v^k has w(y) ≤ 1 for every w, hence y ∈ R (mem_integers_of_valuation_le_one) and x = y/∏ m_v^k.
5. Independence: under (ii) the ring M⁻¹R is, as a subring of K, the fixed ring S.integer K, whatever M is.

**Dependencies.** `mathlib:Set.integer`, `mathlib:IsLocalization`, `mathlib:IsDedekindDomain.HeightOneSpectrum`, `mathlib:IsDedekindDomain.HeightOneSpectrum.Support.finite`, `mathlib:IsDedekindDomain.HeightOneSpectrum.mem_integers_of_valuation_le_one`, `mathlib:IsDedekindDomain.HeightOneSpectrum.valuation_lt_one_iff_mem`, `mathlib:Set.unitEquivUnitsInteger`, `tauceti:Set.mem_integer_iff`, `tauceti:IsDedekindDomain.integer_map_asIdeal_eq_top`, `mathlib:IsDedekindDomain.integer_empty`.

**Checks.**

- S = ∅: M = {1} satisfies (ii) vacuously and O_∅ = R, which is Mathlib's IsDedekindDomain.integer_empty.
- S = all height-one primes: M = R ∖ {0} satisfies (ii) and O_S = K, Mathlib's IsDedekindDomain.integer_univ.
- R = ℤ, S = {(p)}: M = {p^k} satisfies (ii), so O_S = ℤ[1/p]; M = {1} does not.
- R = 𝓞 of ℚ(√−5), S = {𝔭₂} with 𝔭₂ = (2, 1 + √−5) non-principal and 𝔭₂² = (2): M = {2^k} satisfies (ii) (2 ∈ 𝔭₂ and v(2) = 1 for v ≠ 𝔭₂), so O_S = 𝓞[1/2]; M = {1} does not.
- If Cl(R) ≅ ℤ is generated by the class of a prime v and S = {v} (Tau Ceti's docstring example), then M_S = R^× and no M satisfies (ii): O_S is not a localisation of R.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Ex. I.3.8, Relative Class groups (PDF p. 37; book p. 29). The K-book treats rings of S-integers as localisations S⁻¹R whose lost primes are those meeting the multiplicative set; condition (ii) is that property for a submonoid of R. The K-book states no theorem of this form: the node follows the library (Mathlib's Set.integer, and Tau Ceti's SInteger/Basic.lean docstring, which records that O_S need not be a localisation).

### K₁ of the S-integers inside K₁ of the field: the S-units, and a group that is not finitely generated

**Target:** `ArithmeticKTheory:N.1/K1-of-S-integers-and-the-determinant`.

For a number field F and S a finite set of finite primes, the determinant identifies K1(O_(F,S)) with O_(F,S)^×, compatibly with inclusion into F^× and with N.1’s transfer norm. Import the Bass–Milnor–Serre determinant theorem from KTheoryLowDegrees U.4/U.6; N.1 supplies the arithmetic S-integer specialization and comparisons. Finite generation of units requires finite S.

**Hypotheses.** F is a number field, S a finite set of nonzero primes of 𝓞_F; O_{F,S} = S.integer F. SK₁(O_{F,S}) = 0, the determinant identification and the S-unit rank are KTheoryLowDegrees U.4's; K₁ of a field is U.3's ('Prove SK₁ vanishing for fields'). Mathlib has Dirichlet's theorem only for S = ∅ (NumberField.Units.rank = r₁ + r₂ − 1); Tau Ceti's Set.unit_fg_of_units gives finite generation for finite S but no rank (TauCeti/RingTheory/DedekindDomain/SInteger/Unit.lean:195–207).

**Proof plan.**

1. Import the determinant and SK1=0 from U.4/U.6, then identify its codomain with the existing S-unit carrier. Finite generation is Tau Ceti’s unit_fg_of_units when S is finite. Use N.1’s explicit extension and relative norm comparisons for the two functorial maps.

**Dependencies.** `KTheoryLowDegrees:U.4`, `KTheoryLowDegrees:U.3`, `mathlib:Set.unit`, `mathlib:Set.unitEquivUnitsInteger`, `tauceti:Set.unit_fg_of_units`, `mathlib:NumberField.Units.rank`, `mathlib:NumberField.Units.torsion`, `mathlib:padicValRat`, `mathlib:Nat.exists_infinite_primes`, `KTheoryLowDegrees:U.6`, `ArithmeticKTheory:N.1/transfer-and-norm-on-units`.

**Checks.**

- F = ℚ, S = ∅: K₁(ℤ) = {±1} → K₁(ℚ) = ℚ^× is the inclusion of {±1} (III.1.3.5).
- F = ℚ, S = {p}: the image is {±1} × p^ℤ, of rank 1 = r₁ + r₂ + |S| − 1.
- F^× is not finitely generated, already for F = ℚ.
- The rank r₁ + r₂ + |S| − 1 is U.4's; Classical Data VI.8.1 misprints it as r₂ + |S| − 1 (known erratum; see sourceIssues).

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.1.3.5 (PDF p. 191; book p. 183). K₁ of the field is its multiplicative group. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.1.3.6 (PDF p. 191; book p. 183). Bass–Milnor–Serre: K₁ of the S-integers is their unit group; this is the part imported from U.4. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.1.3.6 (PDF p. 191; book p. 183). Finite generation and the rank s − 1 of K₁(O_{F,S}), with s = r₁ + r₂ + |S| the places at infinity for O_{F,S}; the finitely generated group this node contrasts with F^×.

### Extension of ideals and the relative norm against pullback and transfer on K₀ of S-integers

**Target:** `ArithmeticKTheory:N.1/norms-transfers-and-pullbacks`.

Let F′/F be an extension of number fields of degree d, S a finite set of nonzero primes of 𝓞_F, S′ the primes of 𝓞_{F′} over S, and i : O_{F,S} → O_{F′,S′} the inclusion, which makes O_{F′,S′} a finitely generated projective O_{F,S}-module of rank d (N.1/S-integers-in-a-finite-extension). Write K₀ ≅ ℤ ⊕ Cl via (rank, det) (KTheoryLowDegrees Z.4), Cl multiplicatively, and let 𝔰 = det_{O_{F,S}}(O_{F′,S′}) ∈ Cl(O_{F,S}) be the Steinitz class. Then the pullback i^* (base change) is (n, c) ↦ (n, ext(c)), with ext Mathlib's ClassGroup.extendedHom (extension of ideals), and the transfer i_* (restriction of scalars) is (n, c′) ↦ (d·n, N(c′)·𝔰^n), with N Tau Ceti's ClassGroup.relNorm (the relative norm), by Z.4's formula det(Res P) = Norm(det P)·𝔰^{rank P}. Consequently i_*∘i^* is multiplication by the class [O_{F′,S′}] = (d, 𝔰) ∈ K₀(O_{F,S}): (n, c) ↦ (d·n, c^d·𝔰^n). On the class-group summand it is c ↦ c^d (Tau Ceti's ClassGroup.relNorm_extendedHom), but on K₀ it is multiplication by the degree only when 𝔰 = 1.

**Hypotheses.** F′/F is a finite extension of number fields (hence separable) of degree d; S is finite and S′ is the set of primes of 𝓞_{F′} lying over a prime of S. K₀ ≅ ℤ ⊕ Pic by rank and determinant, the comparison of Pic with the class group, and the restriction-of-scalars determinant formula are KTheoryLowDegrees Z.4's ('The transfer of an ideal class requires the determinant/norm formula; it is not just multiplication by the extension degree on every summand'). The projection formula against K₀ is U.5's. The transfer exists because O_{F′,S′} is finitely generated projective over O_{F,S}; that is the lemma N.1/S-integers-in-a-finite-extension, not an assumption.

**Proof plan.**

1. Pullback: base change P ↦ P ⊗ O_{F′,S′} preserves rank and sends det P to its extension, which on classes is ClassGroup.extendedHom.
2. Transfer: restriction of scalars sends a projective of rank n to one of rank d·n with determinant Norm(det P)·𝔰^n (Z.4's formula); on the rank-zero part this is ClassGroup.relNorm.
3. Composite: i_*i^*(n, c) = (d·n, N(ext c)·𝔰^n) = (d·n, c^d·𝔰^n) by relNorm_extendedHom; equivalently i_*i^* is multiplication by i_*(1) = [O_{F′,S′}] (projection formula, U.5; Ex. II.2.2(b)).
4. Compare with the K₀ ring structure of Z.4, (m, a)(n, b) = (mn, a^n b^m): multiplication by (d, 𝔰) is the displayed map.

**Dependencies.** `ArithmeticKTheory:N.1/S-integers-in-a-finite-extension`, `KTheoryLowDegrees:Z.4/rank-pic-equivalence`, `KTheoryLowDegrees:Z.4`, `KTheoryLowDegrees:U.5`, `mathlib:ClassGroup.extendedHom`, `tauceti:ClassGroup.relNorm`, `tauceti:ClassGroup.relNorm_extendedHom`, `tauceti:IsDedekindDomain.integerClassGroupEquiv`.

**Checks.**

- F = ℚ, F′ = ℚ(i), S = {2}: O_{F,S} = ℤ[1/2], O_{F′,S′} = ℤ[i][1/2] is free with basis 1, i, so 𝔰 = 1 and i_*i^* is multiplication by 2 on K₀(ℤ[1/2]) ≅ ℤ.
- On the class-group summand i_*i^* is c ↦ c^d for every extension (ClassGroup.relNorm_extendedHom).
- i_*(1) = (d, 𝔰), not (d, 1) in general: a formalisation that makes i_*i^* multiplication by d on all of K₀ is wrong whenever the Steinitz class is non-trivial.
- i^* on Cl(O_{F,S}) is compatible with Tau Ceti's integerClassGroupEquiv for F and F′.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Ex. II.2.2, Projection Formula (PDF p. 86; book p. 78). The setting: A = O_{F′,S′} is finitely generated projective of rank d over R = O_{F,S}. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Ex. II.2.2(b) (PDF p. 86; book p. 78). The composite f_∗f^∗ is multiplication by the class [A], not by the rank: the source of the Steinitz-class correction. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.6.3 (PDF p. 418; book p. 410). Restriction of scalars along R ⊂ R′ defines the transfer; the node applies it to O_{F,S} ⊂ O_{F′,S′}.

### With a torsion class group, the S-integers are the localisation at M_S

**Target:** `ArithmeticKTheory:N.1/S-integers-localisation-of-torsion-class-group`.

Let R be a Dedekind domain with fraction field K whose class group is torsion — for instance finite, as for R = 𝓞_F with F a number field (Mathlib's NumberField.RingOfIntegers.instFintypeClassGroup). For every set S of height-one primes, the submonoid M_S of N.1/S-integers-as-a-localisation satisfies its condition (ii), so S.integer K is the localisation of R at M_S. Concretely, if h_v is the order of the class of v ∈ S and v^{h_v} = (a_v), any submonoid M with {a_v : v ∈ S} ⊆ M ⊆ M_S presents S.integer K; for finite S, S.integer K = R[1/∏_{v∈S} a_v].

**Hypotheses.** R is a Dedekind domain with torsion class group; S is any set of height-one primes. The a_v are not canonical; by the previous node nothing depends on them.

**Proof plan.**

1. For v ∈ S the class [v] has finite order h ≥ 1 (isOfFinOrder_of_finite for a finite class group), so v^h = (a) is principal (ClassGroup.mk0_eq_one_iff).
2. a ∈ v since h ≥ 1, and w(a) = 1 for every w ≠ v since (a) = v^h; hence a ∈ M_S ∩ v.
3. So M_S, and any submonoid between {a_v} and M_S, satisfies condition (ii); apply N.1/S-integers-as-a-localisation.
4. For finite S the submonoid generated by a = ∏ a_v gives R[1/a].

**Dependencies.** `ArithmeticKTheory:N.1/S-integers-as-a-localisation`, `mathlib:NumberField.RingOfIntegers.instFintypeClassGroup`, `mathlib:isOfFinOrder_of_finite`, `mathlib:ClassGroup.mk0_eq_one_iff`, `mathlib:ClassGroup`.

**Checks.**

- ℚ(√−5), S = {𝔭₂}: h = 2 and a = 2, so O_S = 𝓞[1/2], and Cl(O_S) = Cl(𝓞)/⟨[𝔭₂]⟩ = 1 by Tau Ceti's integerClassGroupEquiv, [𝔭₂] generating Cl(𝓞) ≅ ℤ/2.
- R = ℤ, S = {(p) : p ∈ P} for any set P of primes: O_S = ℤ[1/p : p ∈ P]; for P all primes this is ℚ, so S need not be finite.
- The hypothesis cannot be dropped: Tau Ceti's SInteger/Basic.lean docstring example (Cl(R) ≅ ℤ, S = {v}).

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), I.3, Dedekind domains (PDF p. 30; book p. 22). Finiteness of the class group of 𝓞_F, the hypothesis that makes a power of each prime principal. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.2, proof (PDF p. 521; book p. 513). The source uses the presentation O_S[1/ℓ] of a larger ring of S-integers as a localisation.

### Enlarging S: the rings grow and the presentations are compatible

**Target:** `ArithmeticKTheory:N.1/S-integers-monotone`.

Let R be a Dedekind domain with fraction field K and S ⊆ S′ sets of height-one primes. Then S.integer K ≤ S′.integer K as R-subalgebras of K. If the class group of R is torsion, S′.integer K is moreover the localisation of S.integer K at the image of M_{S′} (IsLocalization (M_{S′}.map (algebraMap R (S.integer K))) (S′.integer K)), so a presentation of O_{S′} is obtained from one of O_S by inverting further elements.

**Hypotheses.** S ⊆ S′; the second statement uses the torsion class group through the previous node.

**Proof plan.**

1. Monotonicity: the condition v(x) ≤ 1 for all v ∉ S′ is weaker than for all v ∉ S (as in Tau Ceti's Set.unit_mono for the units).
2. M_S ≤ M_{S′}, and R → S.integer K → S′.integer K is a scalar tower.
3. By the previous node R → S.integer K and R → S′.integer K are the localisations at M_S and M_{S′}; Mathlib's IsLocalization.isLocalization_of_submonoid_le gives the localisation of S.integer K at the image of M_{S′}.

**Dependencies.** `ArithmeticKTheory:N.1/S-integers-localisation-of-torsion-class-group`, `mathlib:Set.integer`, `tauceti:Set.mem_integer_iff`, `tauceti:Set.unit_mono`, `mathlib:IsLocalization.isLocalization_of_submonoid_le`.

**Checks.**

- S = ∅ ⊆ S′: 𝓞 ≤ O_{S′}, the inclusion of the ring of integers.
- R = ℤ, S = {2} ⊆ S′ = {2, 3}: ℤ[1/2] ≤ ℤ[1/6], and ℤ[1/6] is ℤ[1/2] with 3 inverted.
- The unit groups grow too (Tau Ceti's Set.unit_mono), compatibly with Set.unitEquivUnitsInteger.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.4 (PDF p. 527; book p. 519). The source compares rings of S-integers by inclusion (O_S ⊇ O_F[1/2]), which is this lemma. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.2, proof (PDF p. 521; book p. 513). Enlarging S by the primes over ℓ is inverting ℓ in O_S.

### The S-integers of a finite extension are finite projective over those of the base

**Target:** `ArithmeticKTheory:N.1/S-integers-in-a-finite-extension`.

Let F′/F be a finite extension of number fields, S a set of nonzero primes of 𝓞_F and S′ the primes of 𝓞_{F′} lying over a prime of S. Then S.integer F ⊆ S′.integer F′, and S′.integer F′ is the integral closure of S.integer F in F′ (Mathlib's IsIntegralClosure); it is a finitely generated projective S.integer F-module of rank [F′ : F].

**Hypotheses.** F′/F is finite, hence separable; S is any set of nonzero primes of 𝓞_F. Only the class group of 𝓞_F is used, through N.1/S-integers-localisation-of-torsion-class-group; the class group of 𝓞_{F′} is not needed.

**Proof plan.**

1. The image of M_S in 𝓞_{F′} lies in M_{S′}: an m ∈ 𝓞_F outside every v ∉ S lies in no w ∉ S′, since w ∩ 𝓞_F ∉ S; and each w ∈ S′ contains a_v for v = w ∩ 𝓞_F ∈ S. By N.1/S-integers-as-a-localisation (applied to 𝓞_{F′}), S′.integer F′ = M_S⁻¹𝓞_{F′}; in particular S.integer F = M_S⁻¹𝓞_F ⊆ S′.integer F′.
2. Integrality: 𝓞_{F′} is integral over 𝓞_F and the elements of M_S are units of S.integer F, so M_S⁻¹𝓞_{F′} is integral over S.integer F; conversely S′.integer F′ is integrally closed with fraction field F′ (Tau Ceti's instance), so it is the integral closure.
3. Finiteness: Mathlib's IsIntegralClosure.finite (S.integer F is integrally closed and noetherian).
4. Projectivity: finitely generated and torsion-free over a Dedekind domain, hence flat (IsDedekindDomain.flat_iff_torsion_eq_bot) and finitely presented, hence projective (Module.Flat.projective_of_finitePresentation).
5. Rank: F′ is the localisation of S′.integer F′ at the non-zero elements of S.integer F (IsIntegralClosure.isLocalization), so the rank is [F′ : F].

**Dependencies.** `ArithmeticKTheory:N.1/S-integers-as-a-localisation`, `ArithmeticKTheory:N.1/S-integers-localisation-of-torsion-class-group`, `mathlib:IsIntegralClosure`, `mathlib:IsIntegralClosure.finite`, `mathlib:IsIntegralClosure.isLocalization`, `mathlib:IsDedekindDomain.flat_iff_torsion_eq_bot`, `mathlib:Module.Flat.projective_of_finitePresentation`, `mathlib:NumberField.RingOfIntegers`.

**Checks.**

- F = ℚ, F′ = ℚ(i), S = {2}: S′ = {(1 + i)} and S′.integer F′ = ℤ[i][1/2], free over ℤ[1/2] with basis 1, i.
- S = ∅: 𝓞_{F′} is the integral closure of 𝓞_F in F′, as Mathlib has.
- The hypothesis of V.6.6.3 (R′ finitely generated as an R-module) holds for O_{F,S} ⊂ O_{F′,S′}.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.6.3 (PDF p. 418; book p. 410). The hypothesis the transfers of N.1 and N.2 need; this lemma supplies it for rings of S-integers. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), I.3, Dedekind domains (PDF p. 29; book p. 21). The projectivity step.

### Transfer and pullback on K₁ of S-integers are the norm and the inclusion of units

**Target:** `ArithmeticKTheory:N.1/transfer-and-norm-on-units`.

In the setting of N.1/norms-transfers-and-pullbacks (F′/F of degree d, S finite, S′ over S), under K₁ = units (KTheoryLowDegrees U.4) the pullback i^* : K₁(O_{F,S}) → K₁(O_{F′,S′}) is the inclusion O_{F,S}^× ⊂ O_{F′,S′}^×, and the transfer i_* is the field norm N_{F′/F} (Mathlib's Algebra.norm) restricted to S′-units, which takes values in O_{F,S}^×. Hence i_*i^*(u) = u^d, which is multiplication by [O_{F′,S′}] ∈ K₀(O_{F,S}) acting on K₁ (the Steinitz class acts trivially on units).

**Hypotheses.** U.5 owns the transfer by restriction of scalars and its agreement with the field norm on a field's unit group; U.4 owns K₁(O_{F,S}) = O_{F,S}^× and its injection into K₁(F). S finite; S′ the primes over S.

**Proof plan.**

1. Pullback: base change of an automorphism of O_{F,S} is its extension; on units the inclusion.
2. Transfer: restriction of scalars commutes with inverting the non-zero elements of O_{F,S} (O_{F′,S′} ⊗ F = F′), so i_* is compatible with the transfer K₁(F′) → K₁(F) through the injections K₁(O_{F,S}) ↪ K₁(F) and K₁(O_{F′,S′}) ↪ K₁(F′) (U.4); on F′^× the transfer is N_{F′/F} (U.5).
3. N_{F′/F} maps S′-units to S-units: v(N x) = Σ_{w|v} f_w·w(x) = 0 for v ∉ S.
4. i_*i^*(u) = N_{F′/F}(u) = u^d for u ∈ F^×.

**Dependencies.** `ArithmeticKTheory:N.1/S-integers-in-a-finite-extension`, `KTheoryLowDegrees:U.4`, `KTheoryLowDegrees:U.5`, `mathlib:Algebra.norm`, `mathlib:Set.unitEquivUnitsInteger`.

**Checks.**

- F = ℚ, F′ = ℚ(i), S = {2}: i_*(1 + i) = N(1 + i) = 2 ∈ ℤ[1/2]^×, and i_*i^*(2) = N(2) = 4 = 2².
- S = ∅: i_*(i) = N(i) = 1 and i_*i^*(−1) = (−1)² = 1 for ℚ(i)/ℚ.
- The composite is u ↦ u^d on K₁ even when the Steinitz class is non-trivial, unlike on K₀.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Ex. II.2.2(b) (PDF p. 86; book p. 78). The composite is multiplication by [A]; in degree one [A] acts through its rank. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.6.3 (PDF p. 418; book p. 410). The transfer along O_{F,S} ⊂ O_{F′,S′}.

## N.2 — Arithmetic localization and ramified restriction

Apply the S.3 sequence with residue terms outside S. Its degree-two row is imported from T.5. Arithmetic classes have finite support in the residue direct sum. Transfer is a sum of residue-field transfers; pullback is ramification weighted. In a ramified quadratic extension at p, the K0 residue coordinate is multiplied by 2, which rejects an unweighted square. The separate Soulé input gives injectivity of positive even integral K into the field and the odd isomorphism from degree three onward; exactness alone proves neither general conclusion.

### The localisation sequence for a Dedekind domain

**Target:** `ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain`.

**Planet:** Localization sequence for a Dedekind domain.

For a Dedekind domain R with fraction field F import S.3’s sequence …→⊕_p K_n(k(p))→K_n(R)→K_n(F)→⊕_p K_(n−1)(k(p))→…, terminating K_1(F)→⊕_p Z→K_0(R)→Z→0. The degree-one boundary is the divisor map and the class map sends e_p to (0,[p]^(−1)) under rank and determinant. In the arithmetic specialization R=O_(F,S), reindex residues by the finite primes outside S. N.2 adds arithmetic finite support, field-extension compatibility and degree-specific injectivity; it does not reconstruct the general sequence. If R is a field the residue sums vanish and the sequence is trivial.

**Hypotheses.** R is a Dedekind domain with compatible fraction field F; K is the connective Quillen K-theory of projectives. Import the regular K/G comparison and the general sequence from S.3. For R=O_(F,S), use the existing S-integer ring and its spectrum equivalence; S need not be finite for this specialization.

**Proof plan.**

1. Apply S.3’s exact sequence to the existing Dedekind S-integer ring. Identify its closed points with the primes outside S using the pinned spectrum equivalence. Import the divisor and tame-symbol boundary normalizations; prove arithmetic finite support in the separate N.2 target.

**Dependencies.** `SchemeKTheoryOperations:S.3/dedekind-localisation-sequence`, `ArithmeticKTheory:N.1/S-integers-as-a-localisation`.

**Checks.**

- R = ℤ, degrees ≤ 1: ⊕_p 𝔽_p^× → K₁(ℤ) = {±1} → ℚ^× → ⊕_p ℤ → K₀(ℤ) = ℤ → K₀(ℚ) = ℤ → 0, the first map zero (SK₁(ℤ) = 1 and {±1} ↪ ℚ^×), ℚ^× → ⊕_p ℤ the valuations with kernel {±1}, and ℤ → ℤ the identity.
- For R = O_{F,S} the sums run over 𝔭 ∉ S; the primes of S do not appear.
- It is a sequence of K_*(R)-modules: ∂(x·y) = ∂(x)·ȳ for y ∈ K_*(R), with the side fixed as in K2SymbolsBrauer T.3/localization-boundary.
- K₀(R) → K₀(F) = ℤ is the rank; its kernel is Pic(R), so the sequence does not make K₀(R) → K₀(F) injective (N.2/even-degree-injectivity).

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.6, Dedekind Domains (PDF p. 417; book p. 409). The sequence (6.6) for a Dedekind domain. 'R and F and regular' is the source's misprint for 'are regular' (sourceIssues). [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.6 (PDF p. 417; book p. 409). The primes and the transfer maps. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.1 (PDF p. 414; book p. 406). The Serre subcategory and quotient to which the localisation theorem is applied.

### Finite support: the boundary lands in the direct sum

**Target:** `ArithmeticKTheory:N.2/finite-support`.

Let R be a Dedekind domain with fraction field F. For 0 ≠ s ∈ R, the localisation sequence of R → R[1/s] (GeneralAlgebraicKTheory K.3, for the Serre subcategory M_s(R) of finitely generated modules killed by a power of s, with quotient M(R[1/s])) has fibre term K_n(M_s(R)) ≅ ⊕_{𝔭 ∋ s} K_n(R/𝔭), a finite sum, by dévissage; for s | s′ the sequences are compatible, the map of fibre terms being the inclusion of summands. Since K_{n+1}(F) = colim_s K_{n+1}(R[1/s]), every x ∈ K_{n+1}(F) comes from K_{n+1}(R[1/s]) for some s, and its boundary lies in ⊕_{𝔭 ∋ s} K_n(R/𝔭): the boundary ∂ : K_{n+1}(F) → ⊕_𝔭 K_n(R/𝔭) is defined into the direct sum, each class having non-zero components at only finitely many primes. In degree one ∂[f] = (ord_𝔭 f)_𝔭 (V.6.1.2).

**Hypotheses.** R is a Dedekind domain with fraction field F; the colimit is over s ∈ R ∖ {0} ordered by divisibility. Finite support is a property of each class, not a uniform bound on the group. The colimit is taken over rings (K.7: 'filtered-colimit compatibility for rings'); no colimit of exact categories is needed, because each M_s(R) has a finite semisimple dévissage.

**Proof plan.**

1. For s ≠ 0, M_s(R) is a Serre subcategory of M(R) with quotient M(R[1/s]) (V.6.1), so K.3's localisation theorem gives the sequence of R → R[1/s].
2. Every object of M_s(R) has finite length; its simple objects are the R/𝔭 with s ∈ 𝔭, finitely many; dévissage (K.3) and the finite-product compatibility (K.7) give K(M_s(R)) ≃ ⊕_{𝔭 ∋ s} K(R/𝔭) (V.4.3, V.4.4).
3. For s | s′ the inclusions M_s(R) ⊂ M_{s′}(R) and R[1/s] → R[1/s′] give a map of sequences, which on fibre terms is the inclusion of summands.
4. F is the filtered colimit of the R[1/s], so K_{n+1}(F) = colim_s K_{n+1}(R[1/s]) (K.7); the boundaries ∂_s assemble into ∂ with values in colim_s ⊕_{𝔭 ∋ s} K_n(R/𝔭) = ⊕_𝔭 K_n(R/𝔭).
5. Degree one: ∂[s] = [R/sR] (V.6.1.2), which by dévissage is Σ_𝔭 ord_𝔭(s)·[R/𝔭]; its finite support is Tau Ceti's IsDedekindDomain.HeightOneSpectrum.finite_setOfPred_valuation_ne_one.

**Dependencies.** `GeneralAlgebraicKTheory:K.3`, `GeneralAlgebraicKTheory:K.7`, `mathlib:IsDedekindDomain.HeightOneSpectrum`, `tauceti:IsDedekindDomain.HeightOneSpectrum.finite_setOfPred_valuation_ne_one`.

**Checks.**

- R = ℤ, x = [12] ∈ K₁(ℚ) = ℚ^×: ∂x = 2·[𝔽₂] + 1·[𝔽₃], supported on {2, 3}.
- A class coming from K_{n+1}(R[1/s]) has boundary supported on the primes containing s.
- The target is the direct sum: the next map ⊕_𝔭 K_n(R/𝔭) → K_n(R) is only defined on finitely supported families, so a formalisation with the product would not have the sequence.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.4.4, Application 4.4 (PDF p. 409; book p. 401). The torsion category is the filtered colimit of the categories supported at one element s. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.4.3, Application 4.3 (PDF p. 409; book p. 401). Dévissage to semisimple objects applies to finitely generated torsion modules over a Dedekind domain, giving the finite direct sum. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.1.2 (PDF p. 414; book p. 406). The degree-one boundary is the divisor.

### The low-degree end of the localisation sequence: divisors, Picard group and tame symbols

**Target:** `ArithmeticKTheory:N.2/the-three-classical-rows`.

The degree-zero and degree-one end is S.3’s divisor/Picard sequence. In degree two import T.5/s-integer-tame-kernel-sequence: 0→K2(O_(F,S))→K2(F)→⊕_(p∉S)k(p)^×→0. Comparing O_F to O_(F,S) instead gives the finite sum over p∈S. N.2 supplies arithmetic compatibility of these already-owned rows, not another tame-kernel theorem.

**Hypotheses.** R is a Dedekind domain with fraction field F; in (b), R = O_{F,S} with F a number field and S a finite set of finite places, which is the generality of T.5's sequence. The degree-two row is K2SymbolsBrauer T.5's (RT-AREA-ktheory-1/9): T.5 derives it from the comparison of tame residues with the localisation boundary (K2SymbolsBrauer T.3/dedekind-localization-boundary and T.3/localization-boundary, built on GeneralAlgebraicKTheory K.3) and from SK₁(O_{F,S}) = 0 (KTheoryLowDegrees U.4), not from N.2 (RT-AREA-ktheory-1/26). The import is acyclic because T.5's nodes do not list ArithmeticKTheory:N.2 as a prerequisite (checked against the K2SymbolsBrauer packet revised for the same findings). The sign in (a) is a convention the node fixes: with ∂ = div, the map to Pic is e_𝔭 ↦ [𝔭]⁻¹.

**Proof plan.**

1. Import the divisor/Picard end from S.3 and both complementary degree-two S-integer sequences from T.5. Use the finite-field K2 vanishing and Bass–Milnor–Serre only in the T.5 supplier proof; N.2 proves the arithmetic identifications commute with these maps.

**Dependencies.** `SchemeKTheoryOperations:S.3/dedekind-localisation-sequence`, `K2SymbolsBrauer:T.5/s-integer-tame-kernel-sequence`, `K2SymbolsBrauer:T.5/relative-s-integer-sequence`.

**Checks.**

- R = ℤ: (a) reads 1 → {±1} → ℚ^× → ⊕_p ℤ → ℤ → ℤ → 0, with Pic(ℤ) = 0.
- R = 𝓞 of ℚ(√−5): e_{𝔭₂} ↦ (0, [𝔭₂]⁻¹) = (0, [𝔭₂]), the non-trivial class (Tau Ceti's classNumber_eq_two_of_minpoly_eq_X_sq_add_five), so ⊕_𝔭 ℤ → K₀(R) is not zero.
- Sign: a formalisation with class map e_𝔭 ↦ [𝔭] must also replace div by −div.
- For F = ℚ, (b) is T.5's 1 → K₂(ℤ) → K₂(ℚ) → ⊕_p 𝔽_p^× → 1 (Application III.6.5.1), imported, not proved again: the degree-two segment of (6.6) for ℤ agrees with it.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.6 (PDF p. 417; book p. 409). The identification (a) of the end of (6.6). [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.6.1 (PDF p. 417; book p. 409). The segment (6.6.1) of (b), whose identification with the tame symbol and whose exactness (the tame-kernel sequence) are imported from K2SymbolsBrauer T.3 and T.5. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.1.2 (PDF p. 414; book p. 406). The degree-one boundary, ∂(s) = [R/sR].

### Compatibility of the localisation sequence with finite extensions

**Target:** `ArithmeticKTheory:N.2/localisation-sequence-and-finite-extensions`.

For a finite extension E/F of number fields and T the finite primes of E above S, transfer commutes with the localization sequences through residue norms. Restriction uses the ramification-weighted residue pullback: its p→q component is e(q/p) times the residue-field scalar extension. N.2/ramified-residue-pullback through N.2/s-integer-restriction-compatibility supplies the full restriction contract; an unweighted pullback is asserted only in the unramified case.

**Hypotheses.** E/F is a finite extension of number fields, S a finite set of finite primes of F, and T its full inverse image in E. The map O_(F,S)→O_(E,T) is finite projective. Transfer uses residue restriction of scalars; restriction uses e(q/p) times residue scalar extension. The five N.2 follow-up targets supply the latter argument, replacing the old ramification gap.

**Proof plan.**

1. For transfer, use restriction of scalars and residue-field transfer under dévissage. For pullback, use the five ramified follow-up targets: the pullback of a residue module has length e(q/p), so the q-coordinate is e(q/p) times residue scalar extension. The tensor filtrations and their additive K-theory maps give the commuting square.

**Dependencies.** `ArithmeticKTheory:N.2/finite-extension-restriction-compatibility`, `ArithmeticKTheory:N.2/s-integer-restriction-compatibility`, `ArithmeticKTheory:N.1/norms-transfers-and-pullbacks`.

**Checks.**

- Degree one, F′ = ℚ(i), F = ℚ, x = 1 + 2i: N x = 5; the only prime of ℤ[i] with ord ≠ 0 is (1 + 2i), over 5 with residue degree 1, and ord_5(N x) = 1 = f·ord_{(1+2i)}(x).
- In degree one N̄ on ⊕ K₀ is multiplication by the residue degrees f(𝔭′|𝔭).
- For R′ = R the morphism is the identity.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.6.3–6.6.4 (PDF p. 418; book p. 410). The morphism of localisation sequences induced by restriction of scalars.

### The S-unit valuation sequence and the class-group sequence from the localisation sequence

**Target:** `ArithmeticKTheory:N.2/S-unit-and-class-group-sequence`.

Let F be a number field, S a finite set of nonzero primes of 𝓞_F and O_{F,S} = S.integer F. The flat map 𝓞_F → O_{F,S} induces a morphism from the localisation sequence (6.6) of 𝓞_F to that of O_{F,S}, the identity on K_*(F) and, on residue terms, the projection ⊕_𝔭 K_n(k(𝔭)) → ⊕_{𝔭∉S} K_n(k(𝔭)). Applied to N.2/the-three-classical-rows (a) for both rings, the snake lemma gives the exact sequence 1 → 𝓞_F^× → O_{F,S}^× →(ord_𝔭)_{𝔭∈S} ⊕_{𝔭∈S} ℤ → Cl(𝓞_F) → Cl(O_{F,S}) → 0, whose last map is extension of ideal classes and whose middle map is e_𝔭 ↦ [𝔭]⁻¹: the S-unit valuation sequence and the ideal-class-group sequence, derived from the one construction. Exactness at O_{F,S}^× is Tau Ceti's Set.unitValuation_ker, exactness at Cl(𝓞_F) is IsDedekindDomain.ker_integer_extendedHom and surjectivity at the end is IsDedekindDomain.integer_extendedHom_surjective, all proved there without K-theory; exactness at ⊕_{𝔭∈S} ℤ is not pinned.

**Hypotheses.** F a number field, S finite; the class group is Mathlib's ClassGroup, compared with Pic by ClassGroup.equivPic. The sign of the middle map follows N.2/the-three-classical-rows; exactness does not depend on it. Tau Ceti's Set.unitValuation records −ord_v, not ord_v; in its coordinates the pinned class map e_𝔭 ↦ [𝔭]⁻¹ reads f ↦ ∏_v [v]^{f(v)}, with no inverse.

**Proof plan.**

1. Naturality: base change along the flat map 𝓞_F → O_{F,S} is exact and preserves torsion modules; k(𝔭) ⊗ O_{F,S} = k(𝔭) for 𝔭 ∉ S and 0 for 𝔭 ∈ S (𝔭·O_{F,S} = O_{F,S}, Tau Ceti's integer_map_asIdeal_eq_top).
2. In degrees ≤ 1 this is a map between the sequences 0 → F^×/R^× → ⊕ ℤ → Pic(R) → 0 for R = 𝓞_F and R = O_{F,S}, with vertical maps the quotient F^×/𝓞_F^× → F^×/O_{F,S}^× (kernel O_{F,S}^×/𝓞_F^×), the projection (kernel ⊕_{𝔭∈S} ℤ, onto) and extension of classes.
3. Snake lemma: 0 → O_{F,S}^×/𝓞_F^× → ⊕_{𝔭∈S} ℤ → Cl(𝓞_F) → Cl(O_{F,S}) → 0, the connecting cokernel being 0 because the first vertical map is onto; add 1 → 𝓞_F^× → O_{F,S}^×.
4. Compare with the pinned classical pieces named in the statement.

**Dependencies.** `ArithmeticKTheory:N.2/the-three-classical-rows`, `ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain`, `tauceti:Set.unitValuation_ker`, `tauceti:IsDedekindDomain.ker_integer_extendedHom`, `tauceti:IsDedekindDomain.integer_extendedHom_surjective`, `tauceti:IsDedekindDomain.integer_map_asIdeal_eq_top`, `mathlib:ClassGroup.extendedHom`, `mathlib:ClassGroup.equivPic`.

**Checks.**

- F = ℚ, S = {p}: 1 → {±1} → {±1} × p^ℤ → ℤ → 0 → 0 → 0, the valuation onto.
- F = ℚ(√−5), S = {𝔭₂}: O_{F,S}^× = {±1} × 2^ℤ and ord_{𝔭₂}(2) = 2, so the image of the valuation is 2ℤ and the cokernel ℤ/2 ≅ Cl(𝓞) maps to Cl(O_{F,S}) = 1: the middle exactness is where the class group enters.
- The composite ⊕_{𝔭∈S} ℤ → Cl(𝓞_F) → Cl(O_{F,S}) is trivial.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Ex. I.3.8(a) (PDF p. 37; book p. 29). The classical sequence for a localisation R_S = S⁻¹R, here with R = 𝓞_F and R_S = O_{F,S}. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.6 (PDF p. 417; book p. 409). The end of (6.6) whose naturality is used.

### Injectivity into the field in even degrees, and why exactness alone does not give it

**Target:** `ArithmeticKTheory:N.2/even-degree-injectivity`.

Let R be a Dedekind domain with fraction field F all of whose residue fields are finite (for instance R = O_{F,S}). Then K_n(R) → K_n(F) is injective for every even n ≥ 4, and for n = 2 when R = O_{F,S}. By exactness of (6.6) its kernel is the image of ⊕_𝔭 K_n(R/𝔭), and for n ≥ 4 this vanishes here only because K_n(𝔽_q) = 0 for even n ≥ 2 (Quillen; KTheoryFiniteLocalFields L.1). In degree two the injectivity is the left half of K2SymbolsBrauer T.5's tame-kernel sequence, imported through N.2/the-three-classical-rows (b) and not proved again. In the other degrees the kernel is not zero for formal reasons: in degree zero it is Pic(R); in degree one it is SK₁(R), which vanishes for O_{F,S} by the Bass–Milnor–Serre theorem (KTheoryLowDegrees U.4); in odd degrees n ≥ 3 its vanishing is Soulé's theorem (N.5/soule-theorem), whose proof uses finite generation.

**Hypotheses.** All residue fields R/𝔭 are finite. Degree two is imported from K2SymbolsBrauer T.5 (RT-AREA-ktheory-1/9), which proves it for rings of S-integers of number fields from K₂(𝔽_q) = 0; the argument for n ≥ 4 is the same shape, with Quillen's K_{2j}(𝔽_q) = 0. This is the injectivity N.2 can prove from its own inputs; the odd-degree isomorphism needs N.3:finite-generation, which the atlas places after N.2.

**Proof plan.**

1. Exactness of (6.6) at K_n(R): ker(K_n(R) → K_n(F)) = image of ⊕_𝔭 K_n(R/𝔭).
2. K_n(𝔽_q) = 0 for even n ≥ 2 (L.1); hence the kernel is zero for even n ≥ 4.
3. n = 2, R = O_{F,S}: the injectivity in T.5/tame-kernel-sequence (S = ∅) and T.5/s-integer-tame-kernel-sequence, matched with (6.6) by N.2/the-three-classical-rows (b).

**Dependencies.** `ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain`, `ArithmeticKTheory:N.2/the-three-classical-rows`, `K2SymbolsBrauer:T.5/tame-kernel-sequence`, `KTheoryFiniteLocalFields:L.1`, `KTheoryLowDegrees:U.4`, `KTheoryLowDegrees:Z.4/rank-pic-equivalence`.

**Checks.**

- n = 2, R = ℤ: K₂(ℤ) → K₂(ℚ) is injective, as in Application III.6.5.1 (T.5's sequence, imported).
- n = 4, R = ℤ[1/p]: K₄(ℤ[1/p]) → K₄(ℚ) is injective, since K₄(𝔽_ℓ) = 0 for every prime ℓ ≠ p.
- Degree zero: for R = 𝓞 of ℚ(√−5), ker(K₀(R) → K₀(F)) = Pic(R) ≅ ℤ/2, containing [R/𝔭₂] = [R] − [𝔭₂].
- Degree one without the arithmetic input fails: for the Dedekind domain ℝ[x, y]/(x² + y² − 1) (infinite residue fields), SK₁ ≠ 0 (Example III.1.5.4), so K₁(R) → K₁(F) is not injective.
- No statement of injectivity in odd degrees follows from this node.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.8, proof (PDF p. 420; book p. 412). The source's even-degree step, which uses only K_*(𝔽_q); the finite generation it cites is needed for the odd degrees only. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.6 (PDF p. 417; book p. 409). The case n = 2, which the source derives from K₂(R/𝔭) = 0; here it is imported from K2SymbolsBrauer T.5. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.1.5.4 (PDF p. 193; book p. 185). The degree-one non-example.

### Ramification-weighted pullback on residue direct sums

**Target:** `ArithmeticKTheory:N.2/ramified-residue-pullback` · **Declaration:** `ramifiedResiduePullback`.

**Planet:** Ramified residue pullback.

For the data above define ρ_n^{B/A}: ⊕_p K_n(k(p)) → ⊕_q K_n(k(q)) as the unique additive homomorphism sending ι_p(x) to Σ_{q|p} ι_q(e(q/p)·res_{k(q)/k(p)}x), with e(q/p)=q.ramificationIdx A. Integer multiples mean repeated addition in the abelian K-group; on K_1(k)=k× this is an e-th power. A prime of B has one contracted prime; each prime of A has finitely many primes above it. The same direct-sum assembly is planned for any family of additive groups and homomorphisms over finite fibres. Its full API and tests are specified here; it is not declared in the main suggested Lean file.

**Hypotheses.** A → B is an injective finite map of Dedekind domains; F and L are their compatible fraction fields. B is flat over A (equivalently here, finite projective). p and q mean nonzero prime ideals, indexed using IsDedekindDomain.HeightOneSpectrum; q lies over p. Residue fields are A/p and B/q, not a new prime carrier. n ≥ 0; K_n is the connective Quillen K-group of finitely generated projectives. On regular rings the imported K/G comparison identifies it with G_n.

**Proof plan.**

1. Take finite prime fibres using Algebra.QuasiFinite.finite_primesOver (the finite algebra is quasi-finite); use the existing direct-sum and prime carriers.
2. For each p sum its finitely many weighted coefficient homomorphisms followed by DirectSum.of. Extend these maps uniquely by DirectSum.toAddMonoid; DirectSum.addHom_ext proves uniqueness.
3. The output coordinate can only come from its contracted p. This proves the support bound and makes an unrestricted product unnecessary.
4. For identity and towers evaluate on a coordinate; the two weights multiply and residue-field extension of scalars composes. Use Ideal.ramificationIdx_tower under flatness. The all-degree residue K functor and scalar extension are imported from their exact K.1 and K.2:plus nodes, not defined here.

**Dependencies.** `mathlib:DirectSum.of`, `mathlib:DirectSum.toAddMonoid`, `mathlib:DirectSum.addHom_ext`, `mathlib:IsDedekindDomain.HeightOneSpectrum`, `mathlib:Algebra.QuasiFinite.finite_primesOver`, `mathlib:Ideal.ramificationIdx`, `mathlib:Ideal.ramificationIdx_tower`, `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`, `GeneralAlgebraicKTheory:K.2:plus/scalar-extension-and-functoriality`, `mathlib:Ideal.ramificationIdx_pos`.

**Uses.** ArithmeticKTheory:N.2/finite-extension-restriction-compatibility: Is the residue arrow of the contravariant morphism of full localisation sequences. ArithmeticKTheory:N.2/low-degree-ramified-restriction: Gives multiplication by e on residue ranks and e-th powers on residue units. ArithmeticKTheory:N.3:finite-generation and KU-finitegeneration: Ensures arithmetic localisation maps used by the consumers have finite support and coherent field-extension maps. Mathlib Ideal.ramificationIdx_tower: Provides the weights required for identity and tower functoriality.

**API.**

- `ramifiedResiduePullback_of` (simp): On the p-summand, ρ_n(ι_p x)=Σ_{q|p} ι_q(e(q/p)·res_{k(q)/k(p)}x).
- `ramifiedResiduePullback_apply` (projection): The q-coordinate of ρ_n(x) is e(q/p)·res(x_p), p=q∩A.
- `ramifiedResiduePullback_unique` (universal-property): ρ_n is the unique additive homomorphism with the displayed values on all summand generators, by DirectSum.addHom_ext.
- `ramifiedResiduePullback_support` (compatibility): If the q-coordinate of ρ_n(x) is nonzero then x_{q∩A} is nonzero. Thus support(ρ_n x) is contained in the inverse image of support(x), a finite union of finite prime fibres from Algebra.QuasiFinite.finite_primesOver.
- `ramifiedResiduePullback_zero` (simp): ρ_n(0)=0.
- `ramifiedResiduePullback_add` (simp): ρ_n(x+y)=ρ_n(x)+ρ_n(y).
- `ramifiedResiduePullback_id` (functoriality): For the identity extension every prime fibre is a singleton, its index is 1 and residue restriction is the identity. After reindexing (p,*) as p, ρ_n(x)_p=x_p.
- `ramifiedResiduePullback_tower_apply` (functoriality): For A ⊂ B ⊂ C, r|q|p, the r-coordinate of ρ_{B,C}ρ_{A,B}(x) is e(q/p)e(r/q)·res_{k(r)/k(p)}(x_p). Ideal.ramificationIdx_tower and composition of residue restriction identify this with ρ_{A,C}, after the canonical prime-fibre reindexing.

**Unit tests.**

- `ramifiedResiduePullback.test_zero`: For one source prime, one target prime, coefficient group ℤ, identity coefficient map and weight 2, the image of zero is zero.
- `ramifiedResiduePullback.test_identity`: For one prime, ℤ coefficients, identity coefficient map and weight 1, the image of x has coordinate x.
- `ramifiedResiduePullback.test_ramified`: For one prime, ℤ coefficients, identity coefficient map and weight 2, the image of 1 is 2. This is the residue K_0 model at (2) in ℤ ⊂ ℤ[i].
- `ramifiedResiduePullback.test_split`: For a fibre with two primes, ℤ coefficients, identity coefficient maps and both weights 1, x maps to (x,x), the K_0 model of a split prime.
- `ramifiedResiduePullback.test_inert`: For a singleton fibre, ℤ coefficients, identity coefficient map and weight 1, the image of 3 is 3, not 6. Residue degree 2 does not change this, as at (3) in ℤ ⊂ ℤ[i].
- `ramifiedResiduePullback.test_units`: For a singleton fibre with coefficient group (ℤ/5ℤ)×, identity coefficient map and weight 3, the unit 2 maps to 2³=3. Additive notation uses 3 times Additive.ofMul(2).

**Checks.**

- Six unit tests distinguish omission of e, use of residue degree f, discarding one split prime, and wrong multiplicative notation.
- Transport between primes of S.integer F and primes outside S must use Tau Ceti’s existing equivalence.

**Source.** [Mathlib.pinned](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib), DirectSum/Basic.lean, documentation of toAddMonoid. The dependent direct-sum universal property supplies the assembly; the weights and arithmetic instantiation are this packet’s construction. [Weibel.V.read](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf), V.4.3, printed p. 34. Motivates the residue-summand indexing; the weighted pullback formula is derived in the next node, not quoted as a theorem from this passage.

### Flat pullback computed through residue dévissage

**Target:** `ArithmeticKTheory:N.2/ramification-weighted-devissage` · **Declaration:** `ramificationWeightedDevissage`.

**Planet:** Ramification and dévissage.

Let Tor(A) and Tor(B) be the exact abelian categories of finitely generated torsion modules. Under the standard dévissage isomorphisms D_A: ⊕_p K_n(k(p)) ≅ K_n(Tor(A)) and D_B: ⊕_q K_n(k(q)) ≅ K_n(Tor(B)), one has D_B⁻¹ ∘ K_n(B ⊗_A −) ∘ D_A = ρ_n^{B/A} for every n ≥ 0. These are identifications via inclusions of residue vector spaces into torsion categories, not a claim about K_n of the nonregular ring B/q^e.

**Hypotheses.** A → B is an injective finite map of Dedekind domains; F and L are their compatible fraction fields. B is flat over A (equivalently here, finite projective). p and q mean nonzero prime ideals, indexed using IsDedekindDomain.HeightOneSpectrum; q lies over p. Residue fields are A/p and B/q, not a new prime carrier. n ≥ 0; K_n is the connective Quillen K-group of finitely generated projectives. On regular rings the imported K/G comparison identifies it with G_n.

**Proof plan.**

1. Restrict the exact tensor functor to finite-dimensional k(p)-vector spaces V. It sends V to V ⊗_{k(p)} B/pB, a finite-length B-module. The pullback functor is exact because B is flat; it preserves torsion because A → B is injective.
2. Since pB ≠ 0, use IsDedekindDomain.quotientEquivPiFactors and the ramification-index factor-count equality to decompose B/pB into the q-primary factors B/q^{e(q/p)} for q|p.
3. For a fixed q, filter the coefficient module B/q^e by the images of q^j for 0 ≤ j ≤ e. Reuse Ideal.quotientRangePowQuotSuccInclusionEquiv to identify each successive quotient with B/q, linearly over A/p. Its hypotheses are q nonzero prime, B Dedekind and a nonzero primed ramification index; Ideal.ramificationIdx_pos and ramificationIdx'_eq_ramificationIdx supply this and convert to e=q.ramificationIdx A. The equivalence is constructed by multiplying by an element of q^j outside q^{j+1}, so it also commutes with B and, since q kills both sides, with k(q). Thus each layer is one-dimensional over k(q). This is an existing library equivalence, not a new graded-layer definition. Localization at q and the DVR quotient-length theorem independently check that the filtration has exactly e layers.
4. Tensor these coefficient filtrations with V over the FIELD k(p). Every filtration functor and quotient functor on V is exact. Choosing a basis of each one-dimensional k(q)-line identifies its exact quotient functor with V ↦ k(q) ⊗_{k(p)} V followed by the residue inclusion into Tor(B). The choices change the functors by natural isomorphisms, so do not change induced K maps.
5. Apply K.3/additivity-for-exact-categories (V.1.8) to this admissible filtration of exact functors. The q-block contributes e copies of residue restriction on every K_n, hence e·res. Sum the finite blocks and use dévissage and direct-sum extensionality.
6. Do not apply V.1.8 to the functor M ↦ M/qM on arbitrary finite-length B-modules: it is not exact (V.4.2.1). Exactness here holds because the source is k(p)-vector spaces and the fixed coefficient modules are tensored over a field.

**Dependencies.** `ArithmeticKTheory:N.2/ramified-residue-pullback`, `GeneralAlgebraicKTheory:K.3/devissage-theorem`, `GeneralAlgebraicKTheory:K.3/additivity-for-exact-categories`, `mathlib:IsDedekindDomain.quotientEquivPiFactors`, `mathlib:Ideal.IsDedekindDomain.ramificationIdx_eq_normalizedFactors_count`, `mathlib:IsLocalization.AtPrime.isDiscreteValuationRing_of_dedekind_domain`, `mathlib:IsDiscreteValuationRing.length_quotient_pow_maximalIdeal`, `mathlib:Ideal.mem_primesOver_iff_mem_normalizedFactors`, `mathlib:Ideal.quotientRangePowQuotSuccInclusionEquiv`, `mathlib:Ideal.ramificationIdx'_eq_ramificationIdx`.

**Checks.**

- At ℤ ⊂ ℤ[i] above 2 the length is 2 and the K_0 residue arrow is multiplication by 2, although the residue field is unchanged.
- For an unramified inert prime of residue degree 2 the K_0 pullback sends [k(p)] to [k(q)], not 2[k(q)].
- Wild ramification is allowed; no invertibility of e or separability of a generic residue field is used.

**Source.** [Weibel.V.read](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf), V.1.8, printed p. 9, proof. This supplies the sum-of-quotient-functors step; the arithmetic coefficient filtration and its exactness are derived explicitly above. [Weibel.V.read](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf), V.4.2.1, printed p. 34. The source warns against using the nonexact quotient functor on arbitrary artinian modules. Our functors have a semisimple source and fixed coefficients, avoiding that error. [Weibel.V.read](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf), V.4.3, printed p. 34. Supplies the torsion-category dévissage into residue-field summands. [Mathlib.pinned](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib), Mathlib/NumberTheory/RamificationInertia/Basic.lean, quotientRangePowQuotSuccInclusionEquiv (line 425) and quotientToQuotientRangePowQuotSuccAux (line 329). The pinned coefficient-layer equivalence is over the base residue field. Its chosen-multiplication formula supplies B-linearity as well, which is necessary for the natural isomorphism of torsion-category quotient functors. The older primed index is explicitly converted; deprecation does not make the pinned declaration absent.

### Contravariant compatibility of the full localisation sequence

**Target:** `ArithmeticKTheory:N.2/finite-extension-restriction-compatibility` · **Declaration:** `finiteExtensionRestrictionCompatibility`.

**Planet:** Localisation and restriction.

For A ⊂ B as above and all n ≥ 0, the imported Dedekind localisation sequences form a morphism with vertical arrows res_{B/A}: K_n(A) → K_n(B), res_{L/F}: K_n(F) → K_n(L), and ρ_n^{B/A} on the residue direct sums. In particular for n ≥ 1, ∂_B ∘ res_{L/F} = ρ_{n−1}^{B/A} ∘ ∂_A, and for n ≥ 0, res_{B/A} ∘ i_{A,n} = i_{B,n} ∘ ρ_n^{B/A}, where i is the map from the residue terms to the integral term. The integral-to-field square also commutes, including the terminating K_0(F) → 0 row. Each boundary takes values in a direct sum by the imported finite-support theorem.

**Hypotheses.** A → B is an injective finite map of Dedekind domains; F and L are their compatible fraction fields. B is flat over A (equivalently here, finite projective). p and q mean nonzero prime ideals, indexed using IsDedekindDomain.HeightOneSpectrum; q lies over p. Residue fields are A/p and B/q, not a new prime carrier. n ≥ 0; K_n is the connective Quillen K-group of finitely generated projectives. On regular rings the imported K/G comparison identifies it with G_n.

**Proof plan.**

1. If A is a field, finite injective A → B with B a domain makes B a field; both torsion categories and residue sums are zero, and scalar-extension associativity proves the diagram. Otherwise import S.3/dedekind-localisation-sequence and N.2/finite-support. Before dévissage the sequence is K(Tor(A)) → G(A) → G(F); use the exact tensor functors to form the analogous diagram for B and L.
2. Tensoring a finitely generated module with finite B remains finitely generated; torsion is preserved; the quotient functor to fraction-field vector spaces commutes with scalar extension by the canonical tensor-associativity isomorphism. This is an exact functor of Serre pairs.
3. Use the functorial K.3/abelian-localization-theorem for that diagram. It yields compatible boundary maps before residue dévissage. S.3/cartan-localisation-comparison identifies the regular-ring K/G sequences and their boundaries. Naturality for flat tensor is the commuting square of the projective-to-module inclusions with B ⊗_A − (and analogously F → L); the tensor functors preserve finitely generated projectives. Thus the middle and generic arrows are the usual K-theory restrictions.
4. Replace the torsion arrow using ramification-weighted-devissage. This proves both residue-to-integral and field-boundary squares, not merely equality on K_0 or K_2 symbols.
5. No universal injectivity is inferred from this diagram. All injectivity claims remain those of the degree-specific nodes in the accepted N.1 packet and of T.5.

**Dependencies.** `ArithmeticKTheory:N.2/ramification-weighted-devissage`, `SchemeKTheoryOperations:S.3/dedekind-localisation-sequence`, `GeneralAlgebraicKTheory:K.3/abelian-localization-theorem`, `ArithmeticKTheory:N.2/finite-support`, `SchemeKTheoryOperations:S.3/cartan-localisation-comparison`.

**Checks.**

- At n=1 the square reads v_q(x)=e(q/p)v_p(x) for x ∈ F×.
- At n=2 it gives β_q(res z)=res(β_p z)^e with the imported sign convention.
- Both i and ∂ squares hold; a residue-degree multiplier would contradict the n=1 inert-prime test.

**Source.** [Weibel.V.read](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf), V.5.1, printed pp. 35–37. The functorial localisation theorem is imported from its exact node; the compatible tensor diagram and its ramified residue identification are our deduction. [Weibel.V.read](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf), V.6.6, printed p. 41. Identifies the imported Dedekind sequence. V.6.6.3–6.6.4 describe transfer in the opposite direction, and are not misquoted as stating this pullback theorem.

### Arithmetic rank, divisor and tame-boundary comparisons

**Target:** `ArithmeticKTheory:N.2/low-degree-ramified-restriction` · **Declaration:** `lowDegreeRamifiedRestriction`.

In the restriction morphism, identify K_0(k(p)) and K_0(k(q)) with ℤ by rank, and K_1 of each residue field with its unit group by determinant. Then ρ_0 has q-coordinate e(q/p)x_p and ρ_1 has q-coordinate res(u_p)^{e(q/p)}. Consequently normalized additive orders satisfy v_q(res x)=e(q/p)v_p(x), and the imported degree-two boundary β satisfies β_q(res z)=res(β_p z)^{e(q/p)}. Adopt the K-book right-linear boundary convention β_p{a,b}=(-1)^{v_p(a)v_p(b)} overline(b^{v_p(a)}/a^{v_p(b)}), so β_p{π,u}=ū; it is the inverse of T.3’s left-oriented tameSymbol(a,b). In either convention the e-th-power compatibility is identical. On the K_0 integral terms this commutes with extension of divisor ideals pB=∏_{q|p}q^e and the class-map sign [A/p]=[A]−[p]. Import the arithmetic degree-two exact sequence, including injectivity, from T.5; do not derive it here.

**Hypotheses.** A → B is an injective finite map of Dedekind domains; F and L are their compatible fraction fields. B is flat over A (equivalently here, finite projective). p and q mean nonzero prime ideals, indexed using IsDedekindDomain.HeightOneSpectrum; q lies over p. Residue fields are A/p and B/q, not a new prime carrier. n ≥ 0; K_n is the connective Quillen K-group of finitely generated projectives. On regular rings the imported K/G comparison identifies it with G_n. For the arithmetic tame-kernel row take A=O_{F,S}, B=O_{L,T} with finite S and T the full inverse image. This finiteness is used by the imported arithmetic K_1 vanishing theorem, not by the ramification calculation.

**Proof plan.**

1. Use field rank and determinant comparisons already supplied by N.1’s classical K_0/K_1 imports and N.2/the-three-classical-rows. Scalar extension preserves vector-space dimension and maps a unit to its residue-field image; multiplying a K_1 class e times is taking the e-th power.
2. Apply finite-extension-restriction-compatibility to the imported S.3 unit-valuation boundary and the T.3 comparison (through the existing S.3/N.2 boundary contracts). This gives the additive valuation and tame-boundary equations without constructing any boundary again.
3. Check the valuation equality against pinned HeightOneSpectrum.valuation_liesOver, converting its multiplicative power equation to normalized additive order and converting the primed two-ideal index using Ideal.ramificationIdx'_eq_ramificationIdx.
4. On symbols write a=π^r u, b=π^s v. The target orders are er and es. Reducing b^{er}/a^{es} gives the e-th power of the source quotient; the sign agrees because e²rs−ers is even. The extra unit in the image of π cancels. This directly checks the convention and is a test of the imported naturality result.
5. For the class map use [A/p]=[A]−[p] from the imported S.3 row. Its pullback becomes [B]−[pB]=Σ_{q|p}e(q/p)([B]−[q]) via the coefficient filtration, so the inverse-Picard convention is respected.
6. Use the existing T.5 tame-kernel, S-integer and relative S-integer exact-sequence nodes as imports; all three exact statements were read in the T.3 packet. That packet remains partial with a needs-changes review, so these are mathematical contracts rather than reviewed implementation claims. S.3/boundary-finite-pushforward-naturality supplies the transfer morphism, which goes B → A and uses residue transfers/norms without an e coefficient; this node goes A → B.

**Dependencies.** `ArithmeticKTheory:N.2/finite-extension-restriction-compatibility`, `ArithmeticKTheory:N.2/the-three-classical-rows`, `SchemeKTheoryOperations:S.3/boundary-finite-pushforward-naturality`, `SchemeKTheoryOperations:S.3/dvr-boundary-unit-valuation`, `K2SymbolsBrauer:T.3/localization-boundary`, `K2SymbolsBrauer:T.5/tame-kernel-sequence`, `K2SymbolsBrauer:T.5/s-integer-tame-kernel-sequence`, `K2SymbolsBrauer:T.5/relative-s-integer-sequence`, `mathlib:IsDedekindDomain.HeightOneSpectrum.valuation_liesOver`, `mathlib:Ideal.ramificationIdx'_eq_ramificationIdx`.

**Checks.**

- At ℤ ⊂ ℤ[i], p=2: v_{1+i}(2)=2 and the residue rank arrow is ×2; p=3: the residue extension is F₃ ⊂ F₉ but the rank arrow is the identity; p=5: its rank arrow is x ↦ (x,x).
- For β at p=5, β{5,2}=2 under the right-linear convention, while the left-oriented tame symbol is 3. An e=3, unchanged-residue extension sends the first value to 3 and the second to 2, consistent with taking cubes.
- The source sequence’s rank/Pic end, and its degree-two injectivity, are imported owner results, not consequences asserted from abstract exactness.

**Source.** [Weibel.V.read](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf), V.6.6.1, printed p. 41. Pins the right-linear boundary normalization, as in the imported T.3 comparison; the e-th-power identity is derived, not a new tame-symbol definition. [Weibel.V.read](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf), V.6.6.3–6.6.4, printed p. 42. Distinguishes the already supplied covariant transfer from our contravariant restriction. [Mathlib.pinned](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib), Mathlib/NumberTheory/RamificationInertia/Valuation.lean, HeightOneSpectrum.valuation_liesOver (line 57). The actual declaration is a multiplicative valuation-power identity under compatible fraction-field scalar towers and torsion-freeness. Taking normalized additive orders gives v_q=e v_p. [Mathlib.pinned](https://github.com/leanprover-community/mathlib4/tree/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib), Mathlib/RingTheory/RamificationInertia/Ramification.lean, Ideal.ramificationIdx'_eq_ramificationIdx (line 156). For nonzero p, q lying over p and torsion-free Dedekind B, this converts the exponent in the valuation declaration to the unprimed length convention used throughout this packet.

### Finite-extension restriction for S-integers, towers and enlargements

**Target:** `ArithmeticKTheory:N.2/s-integer-restriction-compatibility` · **Declaration:** `sIntegerRestrictionCompatibility`.

Let L/F be a finite extension of number fields, S a finite set of nonzero primes of O_F, and T={q of O_L : q∩O_F ∈ S}. Put A=O_{F,S} and B=O_{L,T} using S.integer and the existing arithmetic carriers. The full arithmetic localisation sequences admit the contravariant morphism above with residue q-coordinate e(q/p)res(x_p), indexed by p∉S and q∉T. These morphisms compose in finite towers with the full inverse-image sets and commute with enlargements S⊆S₁ (T⊆T₁ the corresponding inverse images); the residue enlargement map discards precisely the inverted-prime summands. If an upper set T₁ strictly contains the inverse image of S, factor the map through O_{L,T} → O_{L,T₁}, apply the same projection on residue terms and do not claim that O_{L,T₁} is finite over A.

**Hypotheses.** F and L are number fields with a compatible F-algebra structure on L; their integral ring maps are the standard ones. S is finite for this stage’s arithmetic theorem. T is exactly the inverse image of S for the finite-projective assertion; larger upper prime sets are handled only by the explicit localisation factorization. For a tower M/L/F all upper prime sets are full inverse images of the preceding one. No Galois, unramified or tame assumption is imposed.

**Proof plan.**

1. Import N.1/S-integers-in-a-finite-extension to obtain the injective finite-projective extension A → B and compatible fraction fields.
2. Use integerHeightOneSpectrumEquiv to index the primes by p∉S and q∉T. Localization preserves the residue fields and local rings at these primes, so their ramification indices are unchanged; valuation_integerHeightOneSpectrumEquiv checks the normalization.
3. Apply finite-extension-restriction-compatibility and low-degree-ramified-restriction to A → B.
4. For towers, evaluate the composite at r|q|p. Residue scalar extension composes and the pinned ramificationIdx_tower gives e(r/p)=e(q/p)e(r/q); uniqueness of contraction and the finite-fibre coordinate formula yield equality of the maps after reindexing.
5. For S⊆S₁ use the existing N.2/S-unit-and-class-group-sequence enlargement naturality. If p is inverted then all q over it are inverted; otherwise its residue coefficient and local ramification data are unchanged. The two orders of projection and weighted pullback agree coordinatewise.
6. For a larger upper set factor through the finite full-inverse-image ring, then project away the additional primes. This explains the permitted general ring map without falsely assigning finiteness or a transfer to it.

**Dependencies.** `ArithmeticKTheory:N.2/finite-extension-restriction-compatibility`, `ArithmeticKTheory:N.2/low-degree-ramified-restriction`, `ArithmeticKTheory:N.1/S-integers-in-a-finite-extension`, `ArithmeticKTheory:N.2/S-unit-and-class-group-sequence`, `mathlib:Ideal.ramificationIdx_tower`, `tauceti:IsDedekindDomain.integerHeightOneSpectrumEquiv`, `tauceti:IsDedekindDomain.valuation_integerHeightOneSpectrumEquiv`.

**Checks.**

- For F=ℚ, L=ℚ(i), S={2}, T={(1+i)}, the 2/(1+i) residue terms are both absent and all other residue arrows remain the computed ones.
- For S=∅ the statement is the ring-of-integers restriction theorem, including the dyadic ramified prime.
- If a prime q of L is inverted without inverting its contracted p in F, its coefficient is projected away; no finite-module assertion for the resulting upper ring is made.
- A two-step extension with indices 2 and 3 gives weight 6 at the corresponding final prime.

**Source.** [TauCeti.pinned](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/RingTheory/DedekindDomain/SInteger/Spectrum.lean), SInteger/Spectrum.lean, overview. Existing prime and valuation correspondences give the arithmetic indexing; this application imports them rather than defining another S-integer carrier. [Weibel.V.read](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.V.pdf), V.6.6.3, printed p. 42. Explains why the full-inverse-image S-integer theorem must provide finiteness; the contravariant compatibility is deduced here, while transfer is imported.

## N.3 — Finiteness, homology and rational localization

This stage collects the two independent arithmetic outputs. The subsequent refinement identifies finite-rank and stable Q-category homology, the actual rational S-integer equivalence, and its transfer compatibility. It shares the finite-generation substage’s generic proof instead of proving a second stabilization theorem. For finite S and n≥2, the map induced by O_F⊂O_(F,S) becomes an isomorphism over Q; its localization defects are finite. A connected H-space can have nonzero π1, so the requested homology-to-homotopy finite-type theorem must allow that case.

### Finite generation and the ranks together

**Target:** `ArithmeticKTheory:N.3/finiteness-and-ranks-combined`.

For a number field F, a finite set S of finite primes and n ≥ 2, K_n(𝓞_{F,S}) is a finitely generated abelian group of rank ρ(n), where ρ(n) = r_1 + r_2, r_2 or 0 according as n ≡ 1 (mod 4), n ≡ 3 (mod 4) or n is even. Hence K_n(𝓞_{F,S}) ≅ Z^{ρ(n)} ⊕ T_n with T_n = K_n(𝓞_{F,S})_tors finite; in particular every positive even K-group of 𝓞_{F,S} is finite, and every odd one in degree at least three is Z^{ρ(n)} plus a finite group. The torsion subgroup T_n is canonical; a complement to it is not.

**Hypotheses.** F a number field, S a finite set of finite primes, n ≥ 2. Degrees zero and one are K_0 = Z ⊕ Pic(𝓞_{F,S}) and K_1 = 𝓞_{F,S}^× ≅ µ(F) ⊕ Z^{r_1+r_2+|S|−1} (N.1, from KTheoryLowDegrees Z.4 and U.4's Dirichlet S-unit theorem) and are not covered by ρ. The decomposition is the structure theorem for finitely generated abelian groups and is not natural.

**Proof plan.**

1. K_n(𝓞_{F,S}) is finitely generated (N.3:finite-generation/finite-generation-of-K-of-S-integers) of rank ρ(n) (N.3:ranks/borel-rank-theorem).
2. Apply Mathlib's structure theorem (AddCommGroup.equiv_free_prod_directSum_zmod) to obtain Z^{ρ(n)} ⊕ T_n with T_n finite; for n even ρ(n) = 0 and the group is finite (N.3:ranks/even-K-groups-of-S-integers-are-finite).
3. Record that only T_n is canonical: no later statement may depend on a chosen splitting.

**Dependencies.** `ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers`, `ArithmeticKTheory:N.3:ranks/borel-rank-theorem`, `ArithmeticKTheory:N.3:ranks/even-K-groups-of-S-integers-are-finite`, `mathlib:AddCommGroup.equiv_free_prod_directSum_zmod`.

**Checks.**

- K_2(Z), K_4(Z) and K_6(Z) are finite; K_3(Z) is finite (ρ(3) = r_2 = 0) and K_5(Z) has rank 1.
- For n even T_n is all of K_n(𝓞_{F,S}), while K_n(F) is infinite (N.3:ranks/even-K-groups-of-the-field-are-infinite-torsion).
- The rank does not determine T_n or the extension data; N.4 to N.6 compute them (for instance K_n(F) ≅ Z^{r_2} ⊕ Z/2w_i(F) ⊕ (Z/2)^{r_1−1} for n ≡ 3 (mod 8) and r_1 > 0, Theorem VI.9.5).

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.1, Classical Data 8.1 (PDF p. 521; book p. 513). The combined statement, with a misprint: 'the groups K_n(F) are finite when n is even and nonzero' must read K_n(O_S) (K_2(Q) is infinite); see source issue. The odd half is right for F by Soulé's theorem and is stated here for O_S. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), IV.1.18, last sentence (PDF p. 279; book p. 271). The torsion of the even groups of an order, which with finite generation gives their finiteness.

### Finite generation of each rank-filtered Q homology group

**Target:** `ArithmeticKTheory:N.3/finite-rank-Q-homology` · **Declaration:** `ArithmeticKTheory.finite_rankQHomology`.

For a number field F, A = 𝓞_F, and every m,i ≥ 0, the integral homology H_i(BQ_m(P(A)); ℤ) is a finitely generated abelian group. Q_m is the rank ≤ m full subcategory of the Q-construction on finitely generated projectives, with base object 0. This is finite generation in each homological degree, not finiteness of a CW model.

**Hypotheses.** F is a number field; Q_m is the parent packet’s rank filtration on projectives, not on all finitely generated modules. All coefficients are integral; projectives of each positive rank are indexed by their Steinitz classes, including nonfree classes.

**Proof plan.**

1. Import ArithmeticKTheory:N.3:finite-generation/rank-filtration-homology-finite-type from the now-accepted sibling packet. Its single generic proof uses the integral relative rank calculation, noetherian subgroup/extension finiteness and rank stabilization; do not implement that induction again under this consumer ID.
2. Specialize to A = 𝓞_F. The pinned finite class-group instance, the class-group/Pic comparison and Z.4 Steinitz classification supply finite Pic and all positive-rank projective classes. The early Borel R.1 integral Steinberg finiteness node supplies the homology hypothesis for every projective lattice, including nonfree ones and the orientation/finite-quotient descent. This yields the displayed arithmetic finite-rank statement.
3. Retain this declaration as the arithmetic specialization interface. At rank zero use the zero-stage equivalence: H_0 is ℤ and positive homology vanishes. An implementation shares the sibling proof rather than creates a parallel generic theorem.

**Dependencies.** `ArithmeticKTheory:N.3:finite-generation/rank-filtration-homology-finite-type`, `ArithmeticKTheory:N.3:finite-generation/rank-filtration`, `ArithmeticKTheory:N.3:finite-generation/rank-spectral-sequence`, `ArithmeticKTheory:N.3:finite-generation/steinberg-homology-of-automorphism-groups`, `BorelRegulators:R.1/steinberg-duality-finiteness`, `KTheoryLowDegrees:Z.4/projective-classification`, `mathlib:NumberField.RingOfIntegers.instFintypeClassGroup`, `mathlib:ClassGroup.equivPic`, `mathlib:Submodule.fg_of_fg_map_of_fg_inf_ker`.

**Checks.**

- m = 0 gives ℤ in degree zero and zero in positive degrees.
- For F = ℚ each positive-rank stratum has one projective class; for F = ℚ(√−5) it has two, so a proof summing only over A^m must fail.
- No bound on the number of cells, or vanishing in all high degrees for fixed m, is asserted.

**Source.** [Quillen.1973](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/bass-seattle.pdf), §1, proof of Theorem 1, pp. 184–185, displayed (2) and (3) (scan PDF pp. 192–193). Quillen proves finite generation of the Steinberg group-homology sums and then of H_i Q_m by induction. The arithmetic input is imported, not reconstructed.

### Homology stability of the rank filtration

**Target:** `ArithmeticKTheory:N.3/rank-filtration-homology-stability` · **Declaration:** `ArithmeticKTheory.rankQHomology_stable`.

For any Dedekind domain A with fraction field F, every i,m ≥ 0, the inclusion induces H_i(BQ_m(P(A));ℤ) → H_i(BQ(P(A));ℤ). It is surjective when m ≥ i and bijective when m ≥ i+1. More precisely H_i(BQ_m) → H_i(BQ_{m+1}) has these same sufficient ranges. Neither arithmeticity nor finiteness of Pic(A) is required. These are Q-filtration maps, not the maps H_i(GL_m(A)) → H_i(GL_{m+1}(A)).

**Hypotheses.** Use the projective Q filtration of the parent packet and integral coefficients. The relative term at rank p is zero in homological degree j < p. This is integer grading: negative group homology is zero, not H_0 obtained by truncated natural-number subtraction.

**Proof plan.**

1. Reuse the accepted sibling declaration ArithmeticKTheory:N.3:finite-generation/rank-homology-stability. Preserve the present consumer ID/signature as its reexport, not a second implementation of generic rank stability.
2. The supplier proves the bounds using vanishing of signed negative-degree relative terms: in the rank m+1 step, vanishing in degree i gives surjectivity for m≥i; vanishing also in degree i+1 gives injectivity for m≥i+1. This rationale checks the reexport bounds, rather than introducing another proof plan.
3. Import StableHomotopyKTheory:H.1/filtered-colimit-homology, whose explicit acceptance case is this increasing Q-rank filtration, together with H.1/homology-of-small-categories. Their natural comparison carries the same bounds to BQ; the old broad H.1 request is redundant. These remain supplier planning nodes, not implemented library results.

**Dependencies.** `ArithmeticKTheory:N.3:finite-generation/rank-filtration`, `ArithmeticKTheory:N.3:finite-generation/rank-spectral-sequence`, `ArithmeticKTheory:N.3:finite-generation/rank-homology-stability`, `StableHomotopyKTheory:H.1/filtered-colimit-homology`, `StableHomotopyKTheory:H.1/homology-of-small-categories`.

**Checks.**

- In degree zero, Q_0 and Q are connected; the sufficient bounds hold, although this particular case is already an isomorphism at m = 0.
- At m = i the theorem promises surjectivity; it does not assert injectivity at that boundary.
- A contribution H_0(Aut(P);St) in relative degree m+1 can obstruct injectivity at i = m, explaining the strict inequality.

**Source.** [Quillen.1973](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/bass-seattle.pdf), §1, Corollary (Stability), p. 182 (scan PDF p. 190); Theorem 3, p. 181. The exact two bounds are verified against the rendered primary page. The passage to BQ uses filtered-union homology. [Kahn.2014](https://arxiv.org/pdf/1108.2441v3), §§4.3.3–4.3.4, p. 17 (Vogel proof continues on p. 18), with §2.4.1. Kahn identifies the E¹ terms and compares the relative exact sequences to Quillen’s. His notation is translated using zero in negative group-homology degrees.

### Finite-type integral homology of the arithmetic Q-space

**Target:** `ArithmeticKTheory:N.3/stable-Q-homology-finite-type` · **Declaration:** `ArithmeticKTheory.finite_QHomology`.

**Planet:** Finite-type arithmetic Q-space.

For every number field F and i ≥ 0, H_i(BQ(P(𝓞_F));ℤ) is a finitely generated abelian group. The inclusion from Q_{i+1} induces an isomorphism onto this group. This gives the integral homological finite-type input to the existing Quillen K-finiteness endpoint.

**Hypotheses.** F is a number field; the stable space is the actual classifying space of the projective Q-construction. “Finite type” means each homology group is finitely generated; it does not mean BQ is a finite CW complex or simply connected.

**Proof plan.**

1. Apply finite-rank-Q-homology at m = i+1.
2. Apply rank-filtration-homology-stability at that rank to identify its homology with H_i(BQ). Transport finite generation across the isomorphism.
3. The parent K-finiteness proof then uses the connected homotopy associative, homotopy commutative H-space structure induced by direct sum, and the requested generic finite-type H-space theorem, to pass to π_{n+1}BQ = K_n. That homotopy conclusion remains the parent endpoint; it is not a second theorem owned here.

**Dependencies.** `ArithmeticKTheory:N.3/finite-rank-Q-homology`, `ArithmeticKTheory:N.3/rank-filtration-homology-stability`, `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`, `StableHomotopyKTheory:H.1/filtered-colimit-homology`, `StableHomotopyKTheory:H.1/homology-of-small-categories`.

**Checks.**

- H_0(BQ) = ℤ. The base point is the zero projective.
- π_1(BQ) = K_0(𝓞_F) includes the ℤ rank summand, so a simply connected Hurewicz theorem is insufficient for the following parent proof.
- The claimed isomorphism uses rank i+1 rather than merely rank i.

**Source.** [Quillen.1973](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/bass-seattle.pdf), §1, conclusion of proof of Theorem 1, p. 185 (scan PDF p. 193). The primary proof first establishes stable integral homology finite generation, then invokes the H-space theorem for homotopy. This node supplies the former input.

### Finite kernel and cokernel of finite S-localization

**Target:** `ArithmeticKTheory:N.3/finite-S-localisation-defect` · **Declaration:** `ArithmeticKTheory.finite_localisation_defect`.

Let F be a number field, S ⊆ T finite sets of nonzero primes of 𝓞_F, and n ≥ 2. The map j_*:K_n(𝓞_{F,S}) → K_n(𝓞_{F,T}) induced by inclusion has finite kernel and finite cokernel. If n is positive even, it is injective. In particular this holds for 𝓞_F → 𝓞_{F,S} after the canonical empty-S ring identification. No vanishing of the odd-degree kernel is claimed.

**Hypotheses.** Both S and T are finite; the removed residue fields are k(𝔭) for 𝔭 ∈ T∖S. The cokernel is the group quotient by the image. In degree one the kernel remains zero but the cokernel need not be finite, so n ≥ 2 is essential.

**Proof plan.**

1. Use the parent number-field localization presentation and finite-support sequence for 𝓞_{F,S} → 𝓞_{F,T}. Dévissage identifies the fibre terms as ⊕_{𝔭∈T∖S}K_n(k(𝔭)) and ⊕_{𝔭∈T∖S}K_{n−1}(k(𝔭)).
2. Import L.1/quillen-k-groups: in positive degrees finite fields have finite K-groups; positive even groups are zero. The finite set of removed primes makes both sums finite when n ≥ 2.
3. Exactness makes ker(j_*) an image of the first finite sum and coker(j_*) a subgroup of the second finite sum. For even n the first sum is zero, proving injectivity. This does not require the source K-group to be finitely generated.

**Dependencies.** `ArithmeticKTheory:N.1/S-integers-as-a-localisation`, `ArithmeticKTheory:N.1/S-integers-monotone`, `ArithmeticKTheory:N.2/finite-support`, `KTheoryFiniteLocalFields:L.1/quillen-k-groups`.

**Checks.**

- S = T gives identity with zero kernel and cokernel.
- For F = ℚ, S = ∅ and T = {(p)}, n = 2, K_2(ℤ) injects into K_2(ℤ[1/p]); its cokernel embeds in 𝔽_p^×.
- The degree-one map K_1(ℤ) → K_1(ℤ[1/p]) has cokernel ℤ, so no all-degree finite-cokernel theorem is possible.
- An infinite set of removed primes gives a direct sum of finite groups which can be infinite; it cannot be used to deduce finite cokernel for passage to F.

**Source.** [Quillen.1973](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/bass-seattle.pdf), §1, Theorem 1, Remark (2), pp. 179–180 (scan PDF pp. 187–188). The source states the finite kernel/cokernel and even injectivity for 𝓞_F → 𝓞_{F,S}. The same localization proof, over 𝓞_{F,S}, gives S ⊆ T. [Weibel.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.1–6.1.1, book p. 406 (PDF p. 414), and IV.1.13, book p. 269 (PDF p. 277). The exact sequence and the positive-degree finite-field table give the stated refinement; degree-zero residue groups explain the n=1 exception.

### Canonical rational equivalence for S-integers

**Target:** `ArithmeticKTheory:N.3/canonical-rational-S-integer-equivalence` · **Declaration:** `ArithmeticKTheory.rationalSIntegerEquiv`.

**Planet:** Rational S-integer comparison.

For a number field F, finite S ⊆ HeightOneSpectrum(𝓞_F), and n ≥ 2, construct e_{F,S,n}: ℚ⊗_ℤK_n(𝓞_F) ≃_ℚ ℚ⊗_ℤK_n(𝓞_{F,S}) whose forward linear map is the rationalization of K_n of the canonical inclusion 𝓞_F → 𝓞_{F,S}. Use LinearEquiv.ofBijective on that map. This is an equivalence for the specified map, not a choice from equality of the Borel dimensions. The genuine K_n functor and scalar-extension maps are imported.

**Hypotheses.** S is finite and consists of finite primes; n ≥ 2. 𝓞_{F,S} is Mathlib’s Set.integer F, and the empty-S case uses the parent’s ring equivalence with 𝓞_F. Tensor products have their ℚ-module structures by the first factor; rationalized maps are ℚ-linear.

**Proof plan.**

1. Apply finite-S-localisation-defect with initial set ∅. Tensor the exact sequence with ℚ over ℤ; ℚ is flat by localization, and a torsion group tensors to zero (a pure tensor can be killed by moving a nonzero annihilating integer to the invertible ℚ factor). Hence the rationalized inclusion is bijective.
2. Apply the pinned LinearEquiv.ofBijective to this particular linear map. Its inverse is uniquely determined and its forward map is unchanged. Do not define a new K carrier, equivalence structure, or rank invariant.
3. Use exact-functor identity/composition and the pinned linear-equivalence API for evaluation, inverse, uniqueness and finite-S enlargement. Compatibility with the map to F is the composition law for the specified ring inclusions and their induced rational K-maps. Separately, the parent’s all-prime localization sequence proves rational bijectivity to F because its infinite residue direct sums are torsion in these degrees, although they need not be finite.

**Dependencies.** `ArithmeticKTheory:N.3/finite-S-localisation-defect`, `ArithmeticKTheory:N.1/S-integers-as-a-localisation`, `ArithmeticKTheory:N.1/S-integers-monotone`, `ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain`, `GeneralAlgebraicKTheory:K.2:plus/scalar-extension-and-functoriality`, `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`, `KTheoryFiniteLocalFields:L.1/quillen-k-groups`, `mathlib:Module.Flat.lTensor_exact`, `mathlib:IsLocalization.flat`, `mathlib:TensorProduct.AlgebraTensorModule.lTensor`, `mathlib:LinearEquiv.ofBijective`, `K2SymbolsBrauer:T.5/k2-of-the-integers`, `BorelRegulators:R.3/division-order-rank-period`, `ArithmeticKTheory:N.1/K1-of-S-integers-and-the-determinant`, `KTheoryLowDegrees:U.4/s-unit-theorem`.

**Uses.** ArithmeticKTheory:N.3:ranks/borel-rank-theorem: Replaces an abstract rank equality by the specified scalar-extension map, allowing the ring-of-integers Borel rank theorem to be transported to S-integers. BorelRegulators:R.4/borel-regulator and R.4/regulator-transfer: Identifies rational arithmetic K-groups through their inclusions and preserves extension/transfer squares; the genuine regulator is the supplier’s map. ArithmeticKTheory:N.5 and N.6: Keeps the rational free-rank input canonical while these stages supply integral torsion. The equivalence does not erase torsion at the integral level.

**API.**

- `ArithmeticKTheory.rationalSIntegerEquiv` (constructor): e_{F,S,n} is LinearEquiv.ofBijective applied to the rationalized inclusion, with n ≥ 2 and S finite.
- `ArithmeticKTheory.rationalSIntegerEquiv_apply` (simp): For x ∈ ℚ⊗K_n(𝓞_F), e_{F,S,n}(x) = j_*^ℚ(x).
- `ArithmeticKTheory.rationalSIntegerEquiv_symm_apply_apply` (simp): For x in the source, e_{F,S,n}^{−1}(e_{F,S,n}(x)) = x.
- `ArithmeticKTheory.rationalSIntegerEquiv_apply_symm_apply` (simp): For y in the target, e_{F,S,n}(e_{F,S,n}^{−1}(y)) = y.
- `ArithmeticKTheory.rationalSIntegerEquiv_unique` (extensionality): Any ℚ-linear equivalence with forward map j_*^ℚ is equal to e_{F,S,n}.
- `ArithmeticKTheory.rationalSIntegerEquiv_empty` (compatibility): For S = ∅, after transporting the target by the canonical empty-S ring equivalence, e_{F,∅,n} is LinearEquiv.refl.
- `ArithmeticKTheory.rationalSIntegerEquiv_enlarge` (functoriality): For finite S ⊆ T, the rationalized map j_{S,T}^ℚ composed with e_{F,S,n} equals e_{F,T,n} as linear maps.
- `ArithmeticKTheory.rationalSIntegerEquiv_toField` (compatibility): The rationalized map K_n(𝓞_{F,S}) → K_n(F), composed with e_{F,S,n}, equals the rationalized map K_n(𝓞_F) → K_n(F).

**Unit tests.**

- `ArithmeticKTheory.test_rationalSIntegerEquiv_empty`: For every F and n ≥ 2, transport e_{F,∅,n} through the empty-S ring equivalence; it is the identity on ℚ⊗K_n(𝓞_F).
- `ArithmeticKTheory.test_rationalSIntegerEquiv_enlarge`: For F = ℚ, distinct primes p,q and n = 5, j_{ {p},{p,q} }^ℚ ∘ e_{ℚ,{p},5} = e_{ℚ,{p,q},5}. These one-dimensional maps agree on every element, not just on their dimensions.
- `ArithmeticKTheory.test_rationalSIntegerEquiv_degree_one`: For prime p, the rationalized map K_1(ℤ) → K_1(ℤ[1/p]) has zero source and a one-dimensional target, so it is not bijective. The constructor must require n ≥ 2.
- `ArithmeticKTheory.test_rationalSIntegerEquiv_prescribed_map`: For F = ℚ and n = 5, composing e_{ℚ,∅,5} with multiplication by 2 gives another abstract linear equivalence but not e_{ℚ,∅,5}: its forward map is not the identity.
- `ArithmeticKTheory.test_rationalSIntegerEquiv_even`: For F = ℚ, any finite S and n = 2, source and target are zero ℚ-vector spaces. This does not assert K_2(ℤ) = 0: the integral group is ℤ/2 (import K2SymbolsBrauer:T.5/k2-of-the-integers).

**Checks.**

- The forward-map equality and both inverse identities hold, independently of any choice of a localization generator.
- For n ≥ 2 rational K-groups of 𝓞_{F,S} have exactly the parent period-four ranks.
- The same construction is unavailable at n = 1 when S is nonempty.

**Source.** [Quillen.1973](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/bass-seattle.pdf), §1, Theorem 1, Remark (2), pp. 179–180 (scan PDF pp. 187–188). The finite defects prove bijectivity of the actual rationalized inclusion. Packaging it as the native linear equivalence is a library refinement of this passage, not a new theorem attributed verbatim to Quillen. [Weibel.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), IV.1.17, book p. 271 (PDF p. 279); V.6.6, book p. 409 (PDF p. 417). The order comparison supplies the surrounding rank use. The all-prime localization sequence supplies rational bijectivity to the field; the toField map identity itself follows from functoriality. S-integers with nonempty S are not orders.

### The canonical equivalence retains the localization map

**Target:** `ArithmeticKTheory:N.3/canonical-rational-equivalence-map` · **Declaration:** `ArithmeticKTheory.rationalSIntegerEquiv_toLinearMap`.

For F, finite S and n ≥ 2, (e_{F,S,n}).toLinearMap = j_*^ℚ, where j is the canonical inclusion 𝓞_F → 𝓞_{F,S}. This is an equality of ℚ-linear maps on the actual tensor-product K-groups.

**Hypotheses.** Use the construction canonical-rational-S-integer-equivalence and its genuine K-theory maps.

**Proof plan.**

1. Unfold only the construction of e as LinearEquiv.ofBijective of j_*^ℚ, and apply the pinned ofBijective evaluation rule.
2. Use extensionality for linear maps. This API item is promoted because the following naturality theorem consumes it as a prerequisite.

**Dependencies.** `ArithmeticKTheory:N.3/canonical-rational-S-integer-equivalence`, `mathlib:LinearEquiv.ofBijective`.

**Checks.**

- On pure tensors q⊗x the forward map is q⊗j_*(x).
- Multiplying a one-dimensional equivalence by 2 would violate this equality.

**Source.** [Quillen.1973](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/bass-seattle.pdf), §1, Theorem 1, Remark (2), pp. 179–180 (scan PDF pp. 187–188). The refinement packages the actual localization map whose finite defects Quillen computes. Its defining map is retained by the native linear equivalence.

### Rational localization commutes with extension and transfer

**Target:** `ArithmeticKTheory:N.3/rational-localisation-extension-transfer` · **Declaration:** `ArithmeticKTheory.rationalSIntegerEquiv_extension_transfer`.

Let E/F be a finite extension of number fields, S a finite set of finite primes of 𝓞_F, and T exactly the primes of 𝓞_E above S. For n ≥ 2 let res_0 and tr_0 be extension and restriction of scalars on K_n(𝓞_F) and K_n(𝓞_E), and res_S and tr_S those for 𝓞_{F,S} → 𝓞_{E,T}. After rationalization, e_{E,T,n} ∘ res_0^ℚ = res_S^ℚ ∘ e_{F,S,n}, and e_{F,S,n} ∘ tr_0^ℚ = tr_S^ℚ ∘ e_{E,T,n}, as linear maps. Ramification is allowed. These squares identify the actual maps; no integral localization isomorphism or degree-multiplication formula is asserted.

**Hypotheses.** T is the complete set above S, not an arbitrary larger set: the imported finite-extension theorem makes 𝓞_{E,T} finite projective over 𝓞_{F,S}. The generic higher K transfer is the map induced by restriction of scalars, imported from K.3. A degree-zero ideal-class norm is insufficient.

**Proof plan.**

1. Import N.1/S-integers-in-a-finite-extension: finite projectivity and the base-change identification 𝓞_{E,T} ≅ 𝓞_E ⊗_{𝓞_F} 𝓞_{F,S}.
2. For extension of scalars, tensor associativity identifies the two exact-functor composites before passing to K. For transfer, localization commutes with the finite-projective restriction-of-scalars functor; the same natural isomorphism of exact functors gives the commuting square on K-groups. Use K.1’s functorial K construction and K.3’s genuine transfer, not determinant alone.
3. Tensor these equalities with ℚ, then replace each rationalized horizontal inclusion by the promoted rationalSIntegerEquiv_toLinearMap. Both displayed squares follow.

**Dependencies.** `ArithmeticKTheory:N.3/canonical-rational-equivalence-map`, `ArithmeticKTheory:N.1/S-integers-in-a-finite-extension`, `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`, `GeneralAlgebraicKTheory:K.2:plus/scalar-extension-and-functoriality`, `GeneralAlgebraicKTheory:K.3/transfer-maps-and-projection-formula`.

**Checks.**

- E = F and T = S gives identity squares.
- S = ∅ reduces both squares to the empty-S ring comparison.
- E = ℚ(i), F = ℚ and S = {(2)} is allowed; T is the ramified prime (1+i). A proof assuming the ring extension is étale would wrongly exclude this example.
- If a new prime is inverted upstairs without its downstairs prime, finite projectivity can fail; that situation is excluded by the exact condition on T.

**Source.** [Weibel.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.6.3–6.6.4, book p. 410 (PDF p. 418); IV.6.3–6.3.2, book p. 320 (PDF p. 328), natural-isomorphism invariance and projective-module transfer. V.6.6.3–6.6.4 constructs the localization transfer square from compatible exact functors. IV.6.3.2 supplies restriction-of-scalars transfer for finite-projective ring extensions; IV.6.3 says naturally isomorphic exact functors induce the same K-map. Apply these to the finite-S base-change square; extension uses tensor associativity. IV.6.3.3 alone is the coherent-module G-transfer, not the projective-module transfer needed here.

## N.3:finite-generation — Quillen finite generation and hermitian finiteness

Filter the Q-construction of projective modules by rank. Each positive-rank stratum is indexed by all Steinitz classes, not only free lattices. The proper-layer poset supplies the suspension of R.1’s building, and its homology supplies the Steinberg coefficient. Relative homology, stabilization, finite Picard group and the finite-type H-space theorem yield finite generation over O_F; finite-S localization supplies O_(F,S). The orientation character in the split case is (sign Norm(det g))^(m−1); an untwisted Borel–Serre dualizing module for every GL_m is incorrect. The new hermitian targets then use already-owned Witt/L/GW objects: periodic L finite generation, genuine Q^(≥m) finite generation in all integer degrees, and classical symmetric/quadratic GW finite generation for n≥0. The detailed proof includes both adjacent comparison ranges and the connective C2 homotopy-orbit spectral sequence.

### Finite generation of the K-groups of rings of S-integers

**Target:** `ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers`.

Let F be a number field and S a finite set of finite primes of 𝓞_F. Then K_n(𝓞_{F,S}) is a finitely generated abelian group for every n ≥ 0 (the stage asks for n ≥ 1; degree zero holds as well). It is deduced from Quillen's theorem for 𝓞_F through the localisation sequence of 𝓞_F ⊂ 𝓞_{F,S} = 𝓞_F[1/s], whose residue terms are the K-groups of the finitely many residue fields k(𝔭), 𝔭 ∈ S; these are finite in positive degrees and Z in degree zero by Quillen's finite-field calculation.

**Hypotheses.** F is a number field and S a finite set of finite primes; 𝓞_{F,S} = 𝓞_F[1/s] for an s ∈ 𝓞_F whose prime divisors are exactly the primes of S (N.1/S-integers-as-a-localisation, which uses the finiteness of the class group). S finite is used: for infinite S the residue term ⊕_{𝔭∈S} K_0(k(𝔭)) is free of infinite rank, and inverting every prime gives K_1 = F^×, which is not finitely generated. The source's Theorem IV.6.9 does not cover 𝓞_{F,S} directly when S ≠ ∅ (it is not finite over Z); the passage is the stage's own route: 'Obtain finite generation for S-integers using localisation and the finite-field calculation'. Finite generation is integral: K_n(𝓞_{F,S}) is a finitely generated abelian group, not merely of finite rank.

**Proof plan.**

1. Write 𝓞_{F,S} = 𝓞_F[1/s] (N.1/S-integers-as-a-localisation).
2. Apply the localisation sequence for the multiplicative set {s^n} (K-book V.6.1, (6.1.1)): … → G_n(𝓞_F/s) → K_n(𝓞_F) → K_n(𝓞_{F,S}) → G_{n−1}(𝓞_F/s) → …, where G = K for the regular rings 𝓞_F and 𝓞_{F,S} and, by dévissage, G_*(𝓞_F/s) ≅ ⊕_{𝔭∈S} K_*(k(𝔭)). This is the Dedekind-domain localisation of N.2/localisation-sequence-for-a-dedekind-domain for 𝓞_F → 𝓞_{F,S} instead of 𝓞_{F,S} → F; the general theorem (localisation, dévissage, resolution) is GeneralAlgebraicKTheory K.3's.
3. By Quillen's finite-field calculation (KTheoryFiniteLocalFields L.1; K-book IV.1.13) K_m(k(𝔭)) is finite for m ≥ 1 and is Z for m = 0; S being finite, ⊕_{𝔭∈S} K_{n−1}(k(𝔭)) is finitely generated.
4. K_n(𝓞_F) is finitely generated (quillen-finite-generation-theorem). In the exact segment K_n(𝓞_F) → K_n(𝓞_{F,S}) → ⊕_{𝔭∈S} K_{n−1}(k(𝔭)) the middle group is an extension of a subgroup of a finitely generated group by a quotient of a finitely generated group, hence finitely generated.
5. Cross-check degrees zero and one with the pinned libraries: Pic(𝓞_{F,S}) is finite (tauceti:IsDedekindDomain.finite_integer_classGroup, with Mathlib's finiteness of Cl(𝓞_F) as its hypothesis) and the S-unit group is finitely generated (tauceti:Set.unit_fg_of_units, with Mathlib's finite generation of (𝓞 F)ˣ as its hypothesis); with K_0 = Z ⊕ Pic and K_1 = units (N.1) these are the classical cases.

**Dependencies.** `ArithmeticKTheory:N.3:finite-generation/quillen-finite-generation-theorem`, `ArithmeticKTheory:N.1/S-integers-as-a-localisation`, `ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain`, `GeneralAlgebraicKTheory:K.3`, `KTheoryFiniteLocalFields:L.1`, `tauceti:IsDedekindDomain.finite_integer_classGroup`, `tauceti:Set.unit_fg_of_units`.

**Checks.**

- K_n(𝓞_{F,S}) is finitely generated for every n ≥ 0 and every finite S.
- For Z[1/p] the sequence K_n(Z) → K_n(Z[1/p]) → K_{n−1}(F_p) exhibits K_n(Z[1/p]) as finitely generated; in degree one it reads Z/2 = K_1(Z) ↪ K_1(Z[1/p]) = {±1} × p^Z → K_0(F_p) = Z, the p-adic valuation.
- For infinite S the conclusion fails already in degree one (the units of the ring obtained by inverting every prime are F^×, N.1).
- The K-groups of the FIELD are not finitely generated in positive even degrees: N.3:ranks/even-K-groups-of-the-field-are-infinite-torsion.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), IV.6.9 (PDF p. 333; book p. 325). Quillen's theorem; with 'finite over Z' it covers 𝓞_F, and this node derives the S-integer case from it. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.1, Application 6.1 and (6.1.1) (PDF p. 414; book p. 406). The localisation sequence for R → R[1/s] (cross-reference tags dropped, the elided sentence identifies G(R/sR) with the fibre), applied with R = 𝓞_F. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), IV.1.13 (PDF p. 277; book p. 269). Quillen's finite-field calculation, which makes the residue terms finite in positive degrees.

### Quillen's rank filtration of the Q-construction of a Dedekind domain

**Target:** `ArithmeticKTheory:N.3:finite-generation/rank-filtration`.

Let A be a Dedekind domain with fraction field F, P(A) the exact category of finitely generated projective A-modules and Q = Q(P(A)) its Q-construction (GeneralAlgebraicKTheory K.1: a morphism M → N is an admissible subobject N₂ ↣ N with an admissible epimorphism N₂ ↠ M, i.e. an isomorphism of M with an admissible subquotient N₂/N₁ of N). For P ∈ P(A) put rank P = dim_F(P ⊗_A F). For m ≥ 0 let Q_m ⊂ Q be the full subcategory on the modules of rank ≤ m. Then: (a) a morphism M → N of Q has rank M ≤ rank N, with equality only when it is an isomorphism; hence, for m ≥ 1, Q_{m−1} ⊂ Q_m is fully faithful and Q_m has no morphism from an object of rank m to an object of Q_{m−1} (the inclusion is cellular in the sense of Kahn, Definition 2.3.2); (b) for m ≥ 1 the full subcategory Q_m − Q_{m−1} of the objects of rank exactly m is a groupoid, equivalent to the disjoint union over the isomorphism classes [P] of rank-m projectives of the one-object groupoids Aut_A(P); (c) Q is the union of the Q_m, so the nerve of Q is the union of the nerves of the Q_m and H_*(BQ) = colim_m H_*(BQ_m); (d) every object of Q_0 is a zero module and there is exactly one morphism between any two, so Q_0 is equivalent to the terminal category and BQ_0 is contractible; (e) if Pic(A) is finite, each rank m ≥ 1 has exactly #Pic(A) isomorphism classes of projectives (Steinitz: P ≅ A^{m−1} ⊕ I, determined by rank and det P ∈ Pic(A)).

**Hypotheses.** A is a Dedekind domain with fraction field F; P(A) carries its split exact structure (all short exact sequences of projectives), imported as GeneralAlgebraicKTheory K.2's P(R) = finiteProjectiveModules. Rank is additive on short exact sequences of projectives and a finitely generated projective module of rank zero over a domain is zero; these two facts give (a). The filtration is taken on P(A), not on all finitely generated modules: in Q(M(A)) the rank-zero objects are the torsion modules and Q_0 is not a point (see the non-example test). Rank strata Q_m − Q_{m−1} and their cellular inclusions use m ≥ 1. Q_0 is equivalent to the terminal category; it is literally the one-object category only after choosing a skeleton with one zero object. Natural-number subtraction must not turn the m = 0 stratum into Q_0 − Q_0.

**Proof plan.**

1. Define Q_m as the full subcategory of GeneralAlgebraicKTheory:K.1/exact-categories-and-Q-construction on the objects of rank ≤ m.
2. (a) If M ≅ N₂/N₁ with N₁ ↣ N₂ ↣ N admissible, rank M = rank N₂ − rank N₁ ≤ rank N₂ ≤ rank N. Equality forces rank N₁ = 0 and rank N/N₂ = 0, so N₁ = 0 and N₂ = N (projectives of rank zero vanish), and the morphism is the image of an isomorphism M ≅ N of P(A), an isomorphism of Q (K.1: the isomorphisms of Q(A) are those of A).
3. Cellularity: Q_{m−1} ⊂ Q_m is full by definition, and a morphism from an object of rank m to one of rank < m would contradict (a).
4. (b) By (a) every morphism between objects of rank m is an isomorphism; choosing one object in each isomorphism class gives the equivalence with ⊔_{[P]} Aut_A(P).
5. (d) Every rank-zero projective over the domain A is a zero module; each admissible layer of a zero module is zero, giving a unique Q-morphism between any two such objects. Inclusion of a chosen zero object is therefore an equivalence from the terminal category to Q_0.
6. (d) A morphism 0 → 0 is an admissible subquotient of 0, so it is the identity.
7. (e) Steinitz's classification (KTheoryLowDegrees Z.4/steinitz and Z.4/projective-classification).

**Dependencies.** `GeneralAlgebraicKTheory:K.1/exact-categories-and-Q-construction`, `GeneralAlgebraicKTheory:K.2/functorial-K-theory-of-a-ring`, `KTheoryLowDegrees:Z.4/steinitz`, `KTheoryLowDegrees:Z.4/projective-classification`, `StableHomotopyKTheory:H.1`, `mathlib:ClassGroup`.

**Uses.** K-book IV.6.8–6.9 (PDF p. 333): 'Quillen used a filtration of the Q–construction' to prove finite generation Kahn, 'Around Quillen's theorem A', 4.1 and 2.4.1: the filtration by rank is a sequence of cellular functors, which gives the rank spectral sequence N.3:finite-generation/comma-category-is-the-layer-poset: the comma categories Q_{m−1} ↓ P of the cellular inclusions N.3:finite-generation/rank-spectral-sequence: the strata Q_m − Q_{m−1} give the E¹ terms N.3:finite-generation/quillen-finiteness-criterion: finitely many components per rank when Pic(A) is finite, and the exhaustion Q = ⋃ Q_m

**API.**

- `QCat.rankFiltration` (data): For a Dedekind domain A and m : ℕ, the full subcategory Q_m of QCat (P(A)) on the modules of rank ≤ m.
- `QCat.rankFiltration_mono` (structure): m ≤ m' → Q_m ⊆ Q_{m'}.
- `QCat.rank_le_of_hom` (characterisation): For a morphism M ⟶ N of QCat (P(A)), rank M ≤ rank N, and if rank M = rank N the morphism is an isomorphism.
- `QCat.rankFiltration_cellular` (other): For m ≥ 1: The inclusion Q_{m−1} ⥤ Q_m is fully faithful and there is no morphism from an object of rank m to an object of Q_{m−1}.
- `QCat.rankStratum` (data): For m ≥ 1: Q_m − Q_{m−1}, the full subcategory on the objects of rank exactly m, as a groupoid.
- `QCat.rankStratumEquiv` (equivalence): For m ≥ 1: Q_m − Q_{m−1} is equivalent to the disjoint union, over the isomorphism classes [P] of rank-m projectives, of the one-object groupoids of Aut_A(P).
- `QCat.iSup_rankFiltration` (characterisation): Q = ⋃_m Q_m; the nerve of Q is the union of the nerves of the Q_m.
- `QCat.rankFiltration_zero` (simp): Q_0 is equivalent to the terminal category (and its classifying space is contractible); no equality of all rank-zero objects is required.
- `QCat.finite_rankStratum_classes` (other): If Pic(A) is finite, for m ≥ 1 the rank-m stratum has exactly Nat.card (ClassGroup A) isomorphism classes.

**Unit tests.**

- `rankFiltration_zero_isPoint`: Q_0(P(A)) is equivalent to the terminal category for every Dedekind domain A, even when the chosen exact-category model contains distinct isomorphic zero objects.
- `rankStratum_int`: For A = ℤ and m ≥ 1 the stratum Q_m − Q_{m−1} is equivalent to the one-object groupoid of GL_m(ℤ): one isomorphism class, ℤ^m.
- `rankStratum_one_sqrt_neg_five`: For A = 𝓞 of ℚ(√−5) the rank-one stratum has two isomorphism classes (Pic(A) ≅ ℤ/2), each with automorphism group {±1}.
- `rankFiltration_allModules_not_cellular`: On Q(M(A)) for all finitely generated A-modules the rank-zero part contains every torsion module, e.g. A/𝔭, so it is not a point; the construction must be made on P(A) (equivalently on torsion-free modules, Kahn 4.2.7).
- `rank_le_of_hom_zero`: For every P, the morphisms 0 → P of Q(P(A)) are the admissible subobjects of P (K.1's QCat.hom_zero), and rank 0 ≤ rank P.

**Checks.**

- A = ℤ: Q_m − Q_{m−1} is equivalent to the one-object groupoid of GL_m(ℤ).
- A = 𝓞 of ℚ(√−5) (class number two): the rank-one stratum has two isomorphism classes, 𝓞 and 𝔭₂ = (2, 1 + √−5), each with automorphism group 𝓞^× = {±1}.
- BQ_0 is a point, while π₁ BQ(P(ℤ)) = K₀(ℤ) = ℤ (GeneralAlgebraicKTheory K.1/pi1-BQ-equals-K0): the filtration is not constant from rank one on.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), IV.6.8–6.9, the paragraph between Bass' Conjecture 6.8 and Theorem 6.9 (PDF p. 333; book p. 325). The filtration of the Q-construction that Quillen uses; the source does not give it. [Kahn.2014](https://arxiv.org/pdf/1108.2441), 4.1 (arXiv:1108.2441v3, p. 15). The filtration by rank, and the property (a) that makes the inclusions cellular; Kahn states it for locally free sheaves on a scheme, of which P(A) is the affine case. [Kahn.2014](https://arxiv.org/pdf/1108.2441), 4.1, after (4.1) is introduced (arXiv:1108.2441v3, p. 15). Property (b). [Kahn.2014](https://arxiv.org/pdf/1108.2441), 2.3.2, Definition (arXiv:1108.2441v3, p. 10). The notion of cellular functor used in (a).

### The poset of proper layers of a vector space

**Target:** `ArithmeticKTheory:N.3:finite-generation/layer-poset`.

Let V be a finite-dimensional vector space over a field F. The poset J(V) of proper layers of V has as elements the pairs (W₀, W₁) of subspaces with W₀ ⊆ W₁ ⊆ V and (W₀, W₁) ≠ (0, V), ordered by (W₀, W₁) ≤ (W₀', W₁') if and only if W₀' ⊆ W₀ ⊆ W₁ ⊆ W₁' (a layer is below the layers that contain it as a subquotient). GL(V) acts on J(V) by order automorphisms, and a linear isomorphism V ≅ V' induces an isomorphism J(V) ≅ J(V'). The subposets J₀(V) = {W₀ ≠ 0} and J₁(V) = {W₁ ≠ V} cover J(V), no chain of J(V) meets both J(V) ∖ J₀(V) and J(V) ∖ J₁(V), and J₀(V) ∩ J₁(V) = {0 ≠ W₀ ⊆ W₁ ≠ V}. For dim V = 1, J(V) = {(0, 0), (V, V)} is two incomparable points; for V = 0 it is empty.

**Hypotheses.** V is finite-dimensional over a field F; subspaces are Mathlib's Submodule F V. The excluded pair (0, V) is the largest element of the full poset of layers; including it makes the poset contractible, which is why it is excluded.

**Proof plan.**

1. Define J(V) as a subtype of Submodule F V × Submodule F V with the stated order; check reflexivity, transitivity and antisymmetry from those of ⊆.
2. The action of g ∈ GL(V) is (W₀, W₁) ↦ (gW₀, gW₁); functoriality in linear isomorphisms likewise.
3. Covering: (W₀, W₁) ∉ J₀ ∪ J₁ would mean W₀ = 0 and W₁ = V.
4. No chain meets both complements: (0, W₁) ≤ (W₀', V) forces W₀' = 0 and so (0, V); (W₀', V) ≤ (0, W₁) forces W₁ = V and so (0, V); both are excluded.
5. dim V = 1: the only subspaces are 0 and V.

**Dependencies.** `mathlib:Submodule`.

**Uses.** Kahn, 'Around Quillen's theorem A', 4.2.6 and 4.3.1: the comma categories of the rank filtration are equivalent to the posets of proper layers N.3:finite-generation/comma-category-is-the-layer-poset: target of the equivalence Q_{n−1} ↓ P ≃ J(P ⊗ F) N.3:finite-generation/layer-poset-is-the-suspended-building: J(V) ≃ ΣT(V)

**API.**

- `LayerPoset` (data): For a finite-dimensional F-vector space V, the poset of pairs (W₀, W₁) of subspaces with W₀ ≤ W₁ and (W₀, W₁) ≠ (⊥, ⊤).
- `LayerPoset.le_iff` (characterisation): (W₀, W₁) ≤ (W₀', W₁') ↔ W₀' ≤ W₀ ∧ W₁ ≤ W₁'.
- `LayerPoset.map` (functoriality): A linear equivalence e : V ≃ₗ[F] V' induces an order isomorphism LayerPoset V ≃o LayerPoset V'; map_refl and map_trans hold.
- `LayerPoset.glAction` (instance): The action of GL(V) = (V ≃ₗ[F] V) on LayerPoset V by order automorphisms, (W₀, W₁) ↦ (gW₀, gW₁).
- `LayerPoset.lowerPart` (data): J₀(V), the subposet of layers with W₀ ≠ ⊥.
- `LayerPoset.upperPart` (data): J₁(V), the subposet of layers with W₁ ≠ ⊤.
- `LayerPoset.lowerPart_sup_upperPart` (relation): J₀(V) ∪ J₁(V) = J(V), and no chain of J(V) meets both complements.
- `LayerPoset.of_finrank_eq_one` (simp): If finrank F V = 1, LayerPoset V is the two-element antichain {(⊥, ⊥), (⊤, ⊤)}.

**Unit tests.**

- `layerPoset_zero`: LayerPoset (0 : F-vector space) is empty: the only pair (⊥, ⊥) equals (⊥, ⊤).
- `layerPoset_dim_one`: For finrank F V = 1, LayerPoset V has two elements and they are incomparable.
- `layerPoset_dim_two_card`: For V = 𝔽₂², LayerPoset V has 2 + 3·3 = 11 elements (three lines, three layers through each).
- `layerPoset_with_top_contractible`: The poset of all layers, (⊥, ⊤) included, has a largest element, so its nerve is contractible; a definition that forgot to exclude (⊥, ⊤) would make every fibre of the rank filtration trivial.
- `layerPoset_map_gl`: For g ∈ GL(V), LayerPoset.map g sends (W₀, W₁) to (W₀.map g, W₁.map g) (Mathlib's Submodule.map).

**Checks.**

- dim V = 1: J(V) has exactly the two incomparable elements (0, 0) and (V, V).
- dim V = 2: the elements are (0, 0), (V, V), and for each line L the three layers (0, L), (L, L), (L, V), with (0, 0) ≤ (0, L) ≥ (L, L) ≤ (L, V) ≥ (V, V): one path from (0, 0) to (V, V) through each line, the suspension of the discrete set of lines.
- Adding (0, V) back gives a poset with a largest element, hence contractible.

**Source.** [Sun.2016](https://arxiv.org/pdf/1604.04700), p. 5 (arXiv:1604.04700v1). The definition of J(V) with its order. [Kahn.2014](https://arxiv.org/pdf/1108.2441), 4.3.2 (arXiv:1108.2441v3, p. 17). The dimension-one case.

### The comma categories of the rank filtration are posets of layers

**Target:** `ArithmeticKTheory:N.3:finite-generation/comma-category-is-the-layer-poset`.

Let A be a Dedekind domain with fraction field F, P a finitely generated projective A-module of rank n ≥ 1 and V = P ⊗_A F. The comma category Q_{n−1} ↓ P of the inclusion Q_{n−1} ⊂ Q(P(A)) (objects: morphisms M → P of Q with rank M ≤ n − 1) is equivalent, Aut_A(P)-equivariantly, to the poset J(V) of proper layers of V: a morphism M → P is an admissible layer P₁ ↣ P₂ ↣ P with P₂/P₁ ≅ M, it is sent to (P₁ ⊗ F, P₂ ⊗ F), and rank M ≤ n − 1 says exactly that (P₁ ⊗ F, P₂ ⊗ F) ≠ (0, V). The inverse sends a subspace W ⊆ V to the pure submodule W ∩ P, which is a direct summand of P.

**Hypotheses.** A is a Dedekind domain; P ∈ P(A) has rank n ≥ 1; Aut_A(P) acts on V = P ⊗ F and on both sides. The admissible monomorphisms of P(A) into P are the injections with projective cokernel, i.e. the pure submodules of P (a finitely generated torsion-free module over a Dedekind domain is projective).

**Proof plan.**

1. A morphism M → P of Q is an admissible layer P₁ ⊆ P₂ ⊆ P with an isomorphism P₂/P₁ ≅ M (GeneralAlgebraicKTheory:K.1/exact-categories-and-Q-construction); morphisms of the comma category are inclusions of layers, so Q_{n−1} ↓ P is equivalent to the poset of admissible layers with rank P₂/P₁ < n (Kahn 4.2.6, proof).
2. Pure submodules of P correspond to subspaces of V: W ↦ W ∩ P and N ↦ N ⊗ F are inverse (Kahn 4.2.4); P/(W ∩ P) embeds in V/W, so it is finitely generated and torsion-free, hence flat (mathlib:IsDedekindDomain.flat_iff_torsion_eq_bot) and finitely presented, hence projective (mathlib:Module.Flat.projective_of_finitePresentation), and W ∩ P is a direct summand (Putman–Studenmund §4.1).
3. A layer has rank P₂/P₁ = n exactly when P₁ = 0 and P₂ = P, i.e. when its image is (0, V).
4. Equivariance: g ∈ Aut_A(P) acts on layers and on J(V) through g ⊗ F, and the bijection commutes with it.

**Dependencies.** `ArithmeticKTheory:N.3:finite-generation/rank-filtration`, `ArithmeticKTheory:N.3:finite-generation/layer-poset`, `GeneralAlgebraicKTheory:K.1/exact-categories-and-Q-construction`, `mathlib:IsDedekindDomain.flat_iff_torsion_eq_bot`, `mathlib:Module.Flat.projective_of_finitePresentation`.

**Checks.**

- n = 1: Q_0 ↓ P has two objects, 0 ↣ P (the subobject 0) and P ↠ 0 (the quotient of P onto 0), matching J(V) = {(0, 0), (V, V)}.
- A = ℤ, P = ℤ²: the lines of ℚ² correspond to the rank-one direct summands of ℤ², i.e. to primitive vectors up to sign.
- A non-pure submodule such as 2ℤ ⊂ ℤ is not an admissible subobject of ℤ in P(ℤ): its cokernel ℤ/2 is not projective.

**Source.** [Kahn.2014](https://arxiv.org/pdf/1108.2441), 4.2.4, Proposition (arXiv:1108.2441v3, p. 16). Pure submodules of P ↔ subspaces of V (for X = Spec A); the text layer renders ↦ as '7→'. [Kahn.2014](https://arxiv.org/pdf/1108.2441), 4.2.6, Corollary, with its proof (arXiv:1108.2441v3, p. 16). The equivalence of the comma category with the poset of proper layers. [Kahn.2014](https://arxiv.org/pdf/1108.2441), 4.2.7, Example (arXiv:1108.2441v3, p. 17). For a Dedekind domain the torsion-free and the projective versions agree. [PutmanStudenmund.2021](https://arxiv.org/pdf/1909.01217v4), §4.1, 'Subspace stabilizers and projective modules' (arXiv:1909.01217v4, p. 17). W ∩ P is a direct summand, with the same one-line proof.

### The layer poset is the suspension of the Tits building

**Target:** `ArithmeticKTheory:N.3:finite-generation/layer-poset-is-the-suspended-building`.

For an m-dimensional F-vector space V, the proper-layer poset of N.3 has nerve homotopy equivalent to the unreduced suspension of the Tits building imported from R.1. Thus its only reduced integral homology is the imported Steinberg module in degree m−1; rank one uses the empty-building convention and reduced degree-zero homology. The arithmetic comparison of the layer poset with the imported building is the N.3 target; the building and Solomon–Tits theorem are R.1 targets.

**Hypotheses.** n = dim V ≥ 1. The building T(V), the Solomon–Tits theorem (T(V) is a wedge of (n − 2)-spheres for n ≥ 2) and the Steinberg module St(V) with its GL(V)-action are BorelRegulators R.1's (RT-AREA-ktheory-1/1); this node uses them and proves only the comparison with J(V). Homology is reduced homology: with unreduced H₀ the rank-two term would be wrong (Sun's remark on Ash–Rudolph).

**Proof plan.**

1. Identify the comma-category layer poset with N.3’s proper-layer poset. Apply the rank-filtration-specific suspension comparison of Kahn Proposition 4.3.1–4.3.2. Use the imported R.1 building and Solomon–Tits homology, retaining the rank-one empty-building convention.

**Dependencies.** `ArithmeticKTheory:N.3:finite-generation/layer-poset`, `BorelRegulators:R.1`, `StableHomotopyKTheory:H.1`, `StableHomotopyKTheory:H.2`.

**Checks.**

- n = 1: J(V) is two points, H̃₀ = ℤ = St(V).
- n = 2, F = ℚ: H̃₁(J(V)) ≅ St(V) = ker(ℤ[ℙ¹(ℚ)] → ℤ), a free abelian group of infinite rank.
- n = 3, F = 𝔽₂ (a finite field, as a check of the building side): T(V) is the incidence graph of the Fano plane, a wedge of 2³ = 8 circles, and J(V) ≃ a wedge of eight 2-spheres.

**Source.** [Kahn.2014](https://arxiv.org/pdf/1108.2441), 4.3.1 (arXiv:1108.2441v3, p. 17). The statement, with Quillen's proposition as Kahn cites it (Quillen's paper itself was not read; the proof steps are this packet's). [Sun.2016](https://arxiv.org/pdf/1604.04700), p. 6 (arXiv:1604.04700v1). Why the Steinberg module in rank two must be reduced homology. [PutmanStudenmund.2021](https://arxiv.org/pdf/1909.01217v4), §1, 'Special linear group and the Steinberg module' (arXiv:1909.01217v4, p. 3). Solomon–Tits and the definition of the Steinberg module ('eH' is the text layer's H̃), which R.1 supplies.

### Quillen's rank spectral sequence

**Target:** `ArithmeticKTheory:N.3:finite-generation/rank-spectral-sequence`.

**Planet:** Quillen's rank spectral sequence.

Let A be a Dedekind domain with fraction field F. There is a spectral sequence of homological type E¹_{p,q} = ⊕_{[P], rank P = p} H_q(Aut_A(P); St(P ⊗_A F)) ⇒ H_{p+q}(BQ(P(A)); ℤ) for p ≥ 1, with E¹_{0,q} = H_q(BQ_0) = ℤ for q = 0 and 0 otherwise, where [P] runs over the isomorphism classes of projectives of rank p and H_q is group homology (Mathlib's groupHomology of the ℤ-linear representation St(P ⊗ F)). Equivalently, for each n ≥ 1 there is a long exact sequence ⋯ → H_i(BQ_{n−1}) → H_i(BQ_n) → ⊕_{[P], rank P = n} H_{i−n}(Aut_A(P); St(P ⊗ F)) → H_{i−1}(BQ_{n−1}) → ⋯, which is Quillen's Theorem 3 (1973). The E¹ term vanishes for q < 0, and in total degree i only the columns 0 ≤ p ≤ i contribute.

**Hypotheses.** A is a Dedekind domain; the coefficients are integral. No finiteness of Pic(A) is needed for the spectral sequence itself. St(P ⊗ F) is the reduced Steinberg module of N.3:finite-generation/layer-poset-is-the-suspended-building, with St = ℤ in rank one; Aut_A(P) acts through Aut_A(P) ⊂ GL(P ⊗ F). The homotopy theory of categories used, Thomason's homotopy-colimit theorem and the cofibre sequence of a cellular functor, is requested from StableHomotopyKTheory H.2; the comparison of the homology of a one-object groupoid with local coefficients with group homology is H.1's.

**Proof plan.**

1. The inclusions Q_{n−1} ⊂ Q_n are cellular and Q = ⋃ Q_n (N.3:finite-generation/rank-filtration), so the cellular-filtration spectral sequence (Kahn, Theorem 2.4.1, from Corollary 2.3.7) gives E¹_{p,q} = H_{p+q−1}(Q_p − Q_{p−1}, F̃_p) ⇒ H_{p+q}(BQ), with F̃_p the reduced coefficient system P ↦ C_*(Q_{p−1} ↓ P) on the groupoid Q_p − Q_{p−1}.
2. Q_p − Q_{p−1} ≃ ⊔_{[P]} Aut_A(P) (rank-filtration (b)), so the homology with coefficients splits as a direct sum over [P] of the homology of the one-object groupoid Aut_A(P) with coefficients in the reduced chains of Q_{p−1} ↓ P (H.1).
3. Q_{p−1} ↓ P ≃ J(P ⊗ F) (N.3:finite-generation/comma-category-is-the-layer-poset), whose reduced homology is St(P ⊗ F) concentrated in degree p − 1 (N.3:finite-generation/layer-poset-is-the-suspended-building). The hyperhomology spectral sequence (Kahn, Lemma 1.3.5) collapses: H_{p+q−1}(Aut P, C̃_*(J)) ≅ H_q(Aut P; St).
4. The long exact sequences are the exact couple of the filtration; Kahn's Remark 4.3.4 (Vogel's argument) shows that they agree with Quillen's.

**Dependencies.** `ArithmeticKTheory:N.3:finite-generation/rank-filtration`, `ArithmeticKTheory:N.3:finite-generation/comma-category-is-the-layer-poset`, `ArithmeticKTheory:N.3:finite-generation/layer-poset-is-the-suspended-building`, `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`, `StableHomotopyKTheory:H.1`, `StableHomotopyKTheory:H.2`, `mathlib:groupHomology`.

**Checks.**

- A = ℤ, total degree one: E¹_{0,1} = 0 and E¹_{1,0} = H₀(GL₁(ℤ); ℤ) = ℤ, and H₁(BQ(P(ℤ))) = π₁(BQ)^{ab} = K₀(ℤ) = ℤ; so the differential d¹ : E¹_{2,0} → E¹_{1,0} vanishes.
- Rank two over ℤ, rationally: by virtual duality with Putman–Studenmund's dualizing module St₂(ℚ) ⊗ ℤ_det (Theorem C; vcd GL₂(ℤ) = 1), H_q(GL₂(ℤ); St₂(ℚ) ⊗ ℚ) ≅ H^{1−q}(GL₂(ℤ); ℚ_det), which vanishes for q = 0, 1 (H¹(SL₂(ℤ); ℚ) = 0 and det is non-trivial); with the untwisted module the identification would be wrong (their Example 1.4).
- In total degree i only p ≤ i contributes: H_i(BQ_n) → H_i(BQ) is onto for n ≥ i and bijective for n ≥ i + 1.

**Source.** [Kahn.2014](https://arxiv.org/pdf/1108.2441), 4.3.3, Theorem (arXiv:1108.2441v3, p. 17). The E¹ term; for X = Spec A with A Dedekind the torsion-free sheaves are the projectives (4.2.7). [Kahn.2014](https://arxiv.org/pdf/1108.2441), 2.4.1, Theorem (arXiv:1108.2441v3, p. 12). The spectral sequence of a cellular filtration (step 1). [Kahn.2014](https://arxiv.org/pdf/1108.2441), 4.3.4, Remark (arXiv:1108.2441v3, p. 17). Identification with Quillen's Theorem 3. [Kahn.2014](https://arxiv.org/pdf/1108.2441), Introduction (arXiv:1108.2441v3, p. 1). Quillen's exact sequences assemble into this spectral sequence.

### Quillen's finiteness criterion for a Dedekind domain

**Target:** `ArithmeticKTheory:N.3:finite-generation/quillen-finiteness-criterion`.

Let R be a Dedekind domain with fraction field F. Suppose that (1) Pic(R) is finite, and (2) for every finitely generated projective R-module P of positive rank and every q ≥ 0 the group H_q(Aut_R(P); St(P ⊗_R F)) is a finitely generated abelian group. Then H_i(BQ(P(R)); ℤ) is finitely generated for every i, and K_n(R) is a finitely generated abelian group for every n ≥ 0. This node is the assembly: it combines the rank spectral sequence with the two hypotheses and passes from homology to homotopy; hypothesis (2) for R = 𝓞_F is N.3:finite-generation/steinberg-homology-of-automorphism-groups.

**Hypotheses.** R is a Dedekind domain with fraction field F; K_n(R) = π_{n+1} BQ(P(R)) (GeneralAlgebraicKTheory K.1/K-groups-of-exact-categories). Pic(R) is finite (hypothesis (1) of the source). For every finitely generated projective P of positive rank and every q, H_q(Aut_R(P); St(P ⊗_R F)) is finitely generated (hypothesis (2), written st(P ⊗_R F) in the source), with integral coefficients. The passage from homology to homotopy is Serre's theorem for simple spaces, requested from StableHomotopyKTheory H.6; BQ(P(R)) is simple because direct sum makes it a connected H-space.

**Proof plan.**

1. Total degree i of the rank spectral sequence (N.3:finite-generation/rank-spectral-sequence): E¹_{p,q} with p + q = i, q ≥ 0 and p ≥ 0, so 0 ≤ p ≤ i — finitely many columns.
2. Each E¹_{p,q} is a finite direct sum (by (1), finitely many isomorphism classes of each rank, N.3:finite-generation/rank-filtration (e)) of groups that are finitely generated by (2); E¹_{0,q} is ℤ or 0.
3. The filtration of H_i(BQ) is finite and exhaustive (rank-filtration (c)), with subquotients subquotients of E¹ terms of total degree i; so H_i(BQ; ℤ) is finitely generated.
4. Direct sum ⊕ : P(R) × P(R) → P(R) is exact, so it induces Q(P(R)) × Q(P(R)) → Q(P(R)) and, since the nerve and realisation preserve finite products (StableHomotopyKTheory H.1), a multiplication BQ × BQ → BQ with unit 0 up to the homotopy given by the natural isomorphism 0 ⊕ M ≅ M; BQ is connected (π₀ is one point), so it is a connected H-space, hence simple.
5. Serre's theorem (StableHomotopyKTheory H.6, request): for a simple space with finitely generated integral homology in every degree, every homotopy group is finitely generated. Hence K_n(R) = π_{n+1} BQ is finitely generated.

**Dependencies.** `ArithmeticKTheory:N.3:finite-generation/rank-spectral-sequence`, `ArithmeticKTheory:N.3:finite-generation/rank-filtration`, `KTheoryLowDegrees:Z.4/projective-classification`, `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`, `StableHomotopyKTheory:H.1`, `StableHomotopyKTheory:H.6`.

**Checks.**

- For R = ℤ both hypotheses hold (Pic(ℤ) = 0; hypothesis (2) for GL_m(ℤ) by N.3:finite-generation/steinberg-homology-of-automorphism-groups), so K_n(ℤ) is finitely generated for every n.
- A finiteness hypothesis on Pic(R) cannot be dropped: K_0(R) = ℤ ⊕ Pic(R) (KTheoryLowDegrees Z.4), and for the coordinate ring R of an elliptic curve over ℂ with one point removed Pic(R) ≅ E(ℂ) is not finitely generated, so neither is K_0(R).
- Rational finiteness of (2) would give only finite-dimensionality of H_i(BQ) ⊗ ℚ and so of K_n(R) ⊗ ℚ; integral finite generation needs (2) integrally.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), IV.6.8–6.9, the paragraph between Bass' Conjecture 6.8 and Theorem 6.9 (PDF p. 333; book p. 325). The criterion with both hypotheses; the source gives no proof, which is decomposed here from Kahn's rank spectral sequence. [Kahn.2014](https://arxiv.org/pdf/1108.2441), Introduction (arXiv:1108.2441v3, p. 1). Quillen's proof runs through these exact sequences. [Sun.2016](https://arxiv.org/pdf/1604.04700), p. 7 (arXiv:1604.04700v1). The two hypotheses in the form used here.

### Finite generation of the Steinberg homology of Aut(P), nonfree P included

**Target:** `ArithmeticKTheory:N.3:finite-generation/steinberg-homology-of-automorphism-groups`.

For a projective O_F-lattice P of rank m≥1, H_i(Aut_(O_F)(P);St(P⊗F)) is finitely generated for every i≥0. This is the arithmetic specialization of BorelRegulators:R.1/steinberg-duality-finiteness, which includes nonfree P, the orientation character and finite-index descent. N.3 uses it in Quillen’s rank filtration and proves none of the building or duality foundation again.

**Hypotheses.** F a number field, A = 𝓞_F, n = rank P ≥ 1; the identification St(V) ≅ St_n(F) is induced by the chosen basis and is equivariant for Aut_A(P) → GL_n(F). Use R.1/steinberg-duality-finiteness with its integral orientation twist and finite-index descent. That supplier includes nonfree projective lattices and rank one; N.3 does not claim these steps as new arithmetic foundations.

**Proof plan.**

1. Specialize R.1/steinberg-duality-finiteness to the order O_F in F and the actual projective lattice P. That theorem supplies the orientation twist and finite-index descent, including the nonfree case. Use its finitely generated homology groups as the coefficients in Quillen’s rank spectral sequence.

**Dependencies.** `BorelRegulators:R.1/steinberg-duality-finiteness`.

**Checks.**

- A = ℤ, P = ℤⁿ: Aut(P) = GL_n(ℤ) itself.
- A = 𝓞 of ℚ(√−5), P = 𝓞 ⊕ 𝔭₂ (rank two, not free, since det P = [𝔭₂] is the non-trivial class): Aut(P) is an arithmetic group commensurable with GL₂(𝓞), containing the principal congruence subgroup of level N² of GL₂(𝓞) for N = 2 (since 2·𝓞² ⊆ P ⊆ 𝓞²).
- Rank one: H_i(𝓞_F^×; ℤ) is finitely generated for every i because 𝓞_F^× ≅ μ(F) × ℤ^{r_1+r_2−1}.
- The untwisted Steinberg module is not the dualizing module of GL₂(ℤ) (Putman–Studenmund, Example 1.4); the finiteness statement imported from R.1 is insensitive to the twist, but its proof must use the right module.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), IV.6.8–6.9, the paragraph between Bass' Conjecture 6.8 and Theorem 6.9 (PDF p. 333; book p. 325). Hypothesis (2), whose verification for rings of integers this node assembles from R.1. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), IV.6.8–6.9, the sentence before Theorem 6.9 (PDF p. 333; book p. 325). Quillen's verification of (2) for number fields, which the source does not reproduce. [Sun.2016](https://arxiv.org/pdf/1604.04700), p. 7 (arXiv:1604.04700v1). The statement for every projective d, and the descent through a normal subgroup of finite index that R.1's proof uses. [PutmanStudenmund.2021](https://arxiv.org/pdf/1909.01217v4), Theorem C (arXiv:1909.01217v4, p. 4). The correctly twisted dualizing module on which R.1's finiteness rests (RT-AREA-ktheory-1/1, verifier).

### Quillen's finite generation theorem for rings of integers

**Target:** `ArithmeticKTheory:N.3:finite-generation/quillen-finite-generation-theorem`.

**Planet:** Quillen's finite generation theorem.

Let R be an integrally closed subring of a number field F which is finite over Z. Then K_n(R) is a finitely generated abelian group for every n ≥ 0. Being integral over Z and integrally closed, such an R is the ring of integers of its fraction field, so this is the theorem for rings of integers 𝓞_F. The source's Theorem IV.6.9 also covers the coordinate ring of a smooth affine curve over a finite field; that half is outside this roadmap and is not planned here.

**Hypotheses.** R ⊂ F is integrally closed and finitely generated as a Z-module, as the source's 'finite over Z' says; hence R = 𝓞_{F'} with F' = Frac(R). A ring of S-integers with S non-empty is not finite over Z (Z[1/2] is not a finitely generated Z-module), so it is not covered by this theorem as printed; it is the next node, finite-generation-of-K-of-S-integers.

**Proof plan.**

1. Hypothesis (1) of quillen-finiteness-criterion: the class group of a ring of integers is finite (mathlib:NumberField.RingOfIntegers.instFintypeClassGroup).
2. Hypothesis (2): for every finitely generated projective 𝓞_F-module P of positive rank, H_q(Aut(P); St(P ⊗ F)) is finitely generated (N.3:finite-generation/steinberg-homology-of-automorphism-groups, which imports the arithmetic finiteness from BorelRegulators R.1; the source: 'He then verified (2) in [154] (number field case)').
3. Apply quillen-finiteness-criterion.

**Dependencies.** `ArithmeticKTheory:N.3:finite-generation/quillen-finiteness-criterion`, `ArithmeticKTheory:N.3:finite-generation/steinberg-homology-of-automorphism-groups`, `mathlib:NumberField.RingOfIntegers.instFintypeClassGroup`.

**Checks.**

- K_n(Z) is finitely generated for every n.
- Degree zero: K_0(𝓞_F) = Z ⊕ Cl(𝓞_F) is finitely generated because the class group is finite.
- Degree one: K_1(𝓞_F) = 𝓞_F^× (SK_1(𝓞_F) = 0, KTheoryLowDegrees U.4) is finitely generated, in agreement with Mathlib's Dirichlet unit theorem (the Monoid.FG instance for (𝓞 F)ˣ in NumberTheory/NumberField/Units/DirichletTheorem.lean).

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), IV.6.9 (PDF p. 333; book p. 325). The theorem; this node states its number-field half. 'Finite over Z' makes R a ring of integers. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), IV.6.8–6.9, the sentence before Theorem 6.9 (PDF p. 333). The verification of hypothesis (2) for rings of integers, assembled in N.3:finite-generation/steinberg-homology-of-automorphism-groups from BorelRegulators R.1.

### Relative homology of a rank layer

**Target:** `ArithmeticKTheory:N.3:finite-generation/relative-rank-homology-comparison`.

Let A be a Dedekind domain with fraction field F, and m ≥ 1. For every integer i ≥ 0 there is a natural integral comparison H_i(BQ_m(A), BQ_{m−1}(A); Z) ≅ ⊕_[P],rank(P)=m H_{i−m}(Aut_A(P); St(P⊗_A F)). Group homology in negative degrees is zero. Relative homology is that of the mapping cone of the inclusion on integral chains. The comparison intertwines the relative long exact sequence with Quillen’s Theorem 3; it is independent of chosen representatives up to the induced coefficient isomorphisms.

**Hypotheses.** Use the rank filtration and its comma-category/building identifications from the predecessor; do not construct a second Q-category or building. St(V)=Z with trivial action in rank one. For m≥2 it is reduced H_{m−2} of the ordinary building. Indices i−m are integers, not truncated subtraction of natural numbers.

**Proof plan.**

1. Apply Kahn 2.3.7 to the cellular inclusion Q_{m−1} → Q_m. Its complement is the groupoid of rank-m projectives (predecessor rank-filtration).
2. The augmented reduced chain complex of each comma category has homology concentrated in degree m−1, with coefficient St(P⊗F), by the predecessor suspended-building comparison. Its group hyperhomology collapses to H_{i−m}(Aut P;St). Include the extra mapping-cone shift [1]. The remaining H.1 request supplies derived group homology of this bounded-below coefficient complex and its concentration comparison; ordinary bar homology of a representation alone does not state that input.
3. Decompose groupoid homology over projective isomorphism classes. Use the functorial mapping-cone comparison in Kahn 4.3.4 for m≥2; for m=1 use 2.3.7 with the explicit augmented chains of two points, rather than its positive-sphere-dimension argument.

**Dependencies.** `ArithmeticKTheory:N.3:finite-generation/rank-filtration`, `ArithmeticKTheory:N.3:finite-generation/comma-category-is-the-layer-poset`, `ArithmeticKTheory:N.3:finite-generation/layer-poset-is-the-suspended-building`, `ArithmeticKTheory:N.3:finite-generation/rank-spectral-sequence`, `StableHomotopyKTheory:H.1/classifying-space-cw-structure`, `StableHomotopyKTheory:H.1/homology-of-small-categories`, `StableHomotopyKTheory:H.1/bar-complex-comparison`, `StableHomotopyKTheory:H.1/groupoid-nerve-one-type`, `StableHomotopyKTheory:H.1/natural-transformations-adjoints-contractibility`, `StableHomotopyKTheory:H.1`, `StableHomotopyKTheory:H.2`, `mathlib:groupHomology`, `mathlib:CategoryTheory.ObjectProperty.FullSubcategory`, `mathlib:CategoryTheory.ObjectProperty.ι`, `mathlib:CategoryTheory.ObjectProperty.ιOfLE`, `mathlib:CategoryTheory.isIsomorphicSetoid`, `mathlib:CategoryTheory.nerve`, `mathlib:CategoryTheory.nerveMap`, `mathlib:SSet.chainComplexMap`, `mathlib:HomologicalComplex.homotopyCofiber`, `mathlib:HomologicalComplex.homology`.

**Checks.**

- For i<m the right side and relative group are zero.
- For m=1 and i=1 the right side is a direct sum of copies of Z, one per Pic(A); the Aut action on St is trivial.
- For m=2 and i=2 the term is Steinberg coinvariants H_0, not ordinary H_0(Aut P;Z) or the free module on all lines.

**Source.** [Kahn.2014](https://arxiv.org/pdf/1108.2441v3), Corollary 2.3.7, p.12; §§4.3.1–4.3.4, pp.17–18. The reduced coefficient complex and mapping-cone shift identify relative homology, including rank one. The base-category augmentation uses D as required by §2.2.2, correcting the harmless C-for-D slip in §2.2.3 recorded as ArithmeticKTheory/E27. [Quillen.1973](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/bass-seattle.pdf), Theorem 3, printed p.181, PDF p.189. The exact sequence is the relative sequence with the stated shift.

### Homological stability of the Q rank filtration

**Target:** `ArithmeticKTheory:N.3:finite-generation/rank-homology-stability`.

**Planet:** Quillen rank stability.

For a Dedekind domain A and integers i,n ≥ 0, H_i(BQ_n(A);Z) → H_i(BQ_{n+1}(A);Z) is surjective for n≥i and an isomorphism for n≥i+1. The canonical map H_i(BQ_n(A);Z) → H_i(BQ(A);Z) has the same surjectivity bound and is an isomorphism for n≥i+1. These are rank-filtration bounds, not stable-range assertions for H_i(GL_n(A);Z).

**Hypotheses.** Integral coefficients; no finite-Pic or arithmetic hypothesis is required. The filtration is exhaustive on finite simplices, with homology commuting with its filtered union.

**Proof plan.**

1. At the step adding rank n+1, the relative groups in degrees i and i+1 vanish respectively for n≥i and n≥i+1 by relative-rank-homology-comparison. Apply the relative long exact sequence.
2. Every simplex uses finitely many projectives and lies in some Q_n; every finite chain and relation therefore lies at finite rank. Use H.1/filtered-colimit-homology’s filtered-union comparison to identify homology of the union with its filtered colimit.
3. All later transition maps are isomorphisms once n≥i+1. This proves stabilization to BQ without any general assertion that a colimit of finitely generated groups is finitely generated.

**Dependencies.** `ArithmeticKTheory:N.3:finite-generation/relative-rank-homology-comparison`, `ArithmeticKTheory:N.3:finite-generation/rank-filtration`, `StableHomotopyKTheory:H.1/filtered-colimit-homology`, `StableHomotopyKTheory:H.1/homology-of-small-categories`, `mathlib:SSet.homology`, `mathlib:SSet.homologyMap`.

**Checks.**

- At n=i only surjectivity is asserted; the relative term in degree i+1 may be nonzero.
- For i=0, Q_0 and BQ are connected and the map on H_0 is Z → Z.
- There is no claimed fixed-rank bound simultaneously for every homological degree.

**Source.** [Quillen.1973](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/bass-seattle.pdf), Corollary (Stability), printed p.182, PDF p.190. The printed bounds are n≥i for surjectivity and n≥i+1 for injectivity.

### Integral finite type of the rank-filtered Q-space

**Target:** `ArithmeticKTheory:N.3:finite-generation/rank-filtration-homology-finite-type`.

Let A be a Dedekind domain with fraction field F. Assume Pic(A) is finite and H_q(Aut_A(P);St(P⊗_A F)) is a finitely generated abelian group for every finite projective P of positive rank and every q≥0. Then all H_i(BQ_n(A);Z), for i,n≥0, and all H_i(BQ(A);Z) are finitely generated abelian groups. For A=O_F, both hypotheses are supplied by the baseline class-group theorem, the LowDegrees Pic comparison, and BorelRegulators:R.1/steinberg-duality-finiteness for all projective lattices, including nonfree ones.

**Hypotheses.** Steinberg homology is assumed integrally, in every degree, for every projective isomorphism class; ordinary arithmetic homology is insufficient. Positive-rank projective classes are parametrized by Pic(A); rank zero has one class.

**Proof plan.**

1. By the predecessor Steinitz/classification and rank-filtration nodes, each positive rank has finitely many projective isomorphism classes. Relative-rank-homology-comparison makes every relative group a finite direct sum of finitely generated abelian groups.
2. Start with Q_0 equivalent to the terminal category, so H_0=Z and higher homology vanishes. Induct on n using the relative long exact sequence. The middle absolute group is an extension of a quotient of the previous absolute group by a subgroup of the relative group. Subgroups of finitely generated abelian groups are finitely generated; use Z-module Noetherianity and the baseline exact-sequence finiteness lemma.
3. For fixed i choose n=i+1 and apply rank-homology-stability. This avoids the invalid passage from arbitrary finite-type stages to finite-type colimit.
4. For O_F identify Pic with ClassGroup by LowDegrees. Import the Borel node for the actual lattice P, not only GL_m(O_F). Its proof uses orientation-correct integral duality on a normal torsion-free subgroup and integral finite-quotient descent.

**Dependencies.** `ArithmeticKTheory:N.3:finite-generation/relative-rank-homology-comparison`, `ArithmeticKTheory:N.3:finite-generation/rank-homology-stability`, `ArithmeticKTheory:N.3:finite-generation/rank-filtration`, `KTheoryLowDegrees:Z.4/projective-classification`, `KTheoryLowDegrees:Z.4/class-group-pic-mk0`, `BorelRegulators:R.1/steinberg-duality-finiteness`, `mathlib:NumberField.RingOfIntegers.instFintypeClassGroup`, `mathlib:Module.Finite.of_exact`, `mathlib:Module.Finite.iff_addGroup_fg`.

**Checks.**

- For O_F with class number greater than one, all Steinitz classes contribute; keeping only free lattices fails the hypothesis.
- Finite rational dimension of the coefficient homology does not imply this integral statement.
- An infinite direct sum of copies of Z is not finitely generated; finite Pic is used before summing.

**Source.** [Quillen.1973](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/bass-seattle.pdf), Proof of Theorem 1, printed pp.184–185, PDF pp.192–193. Induction over finite rank and degreewise stabilization yield integral finite generation. [Weibel.IV](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.IV.pdf), IV.6.8–6.9, PDF p.59, book p.325. The criterion requires finite Pic and integral Steinberg-coefficient homology.

### From integral homology to finitely generated K-groups

**Target:** `ArithmeticKTheory:N.3:finite-generation/quillen-homotopy-finite-type`.

**Planet:** Quillen finite generation.

Under the two hypotheses of rank-filtration-homology-finite-type, K_n(A)=π_{n+1}(BQ(P(A)),0) is a finitely generated abelian group for every n≥0. In particular this holds for O_F for every number field F. Direct sum makes the connected CW-type space BQ(P(A)) a homotopy associative and commutative H-space, hence a simple space, so the integral Serre finite-type theorem applies. This supplies the proof interface of the retained quillen-finiteness-criterion and quillen-finite-generation-theorem; it does not replace the K-group carrier.

**Hypotheses.** CW type is furnished by nerve realization, with basepoint the zero projective. Simple means π_1 is abelian and its action on each higher homotopy group is trivial; simple does not mean simply connected. The general Serre theorem is a recorded requested extension of H.3, not a declaration found in the baseline or a theorem explicitly stated in H.3’s present atlas text.

**Proof plan.**

1. Use GeneralAlgebraicKTheory:K.1/elementary-properties-of-K-groups for exact direct sum, H.1/classifying-space-prod-compactly-generated for the realization/product comparison, and H.1/natural-transformations-adjoints-contractibility for the unit, associativity and symmetry homotopies. Work with compactly generated realizations and their CW models; for number rings a countable skeleton also gives the ordinary product comparison. H.1/classifying-space-cw-structure and H.1/homology-of-small-categories supply the CW and integral simplicial/singular homology inputs. Q(P(A)) is connected through its maps from zero.
2. The unit, associativity and symmetry isomorphisms give the H-space properties. The connected H-space simplicity theorem is part of the explicit H.3 extension request.
3. Apply Serre’s finite-type theorem as requested from the homotopy supplier. Concretely, π_1 X=H_1 X is finitely generated abelian; its classifying-space homology is finitely generated. IV.3 Proposition 3 trivializes its action on universal-cover homology. III.1 Proposition 1(b), interpreted on the covering fibration over Bπ_1, makes the simply connected universal cover have finite-type homology. V.2 Proposition 1 then gives finite generation of its higher homotopy groups. The singular-complex interpretation in V.1 footnote 6 removes the original ULC regularity restriction. Use K_n=π_{n+1} BQ.
4. Specialize to O_F using the arithmetic inputs in the previous node. Preserve the predecessor’s endpoint IDs for consumers.

**Dependencies.** `ArithmeticKTheory:N.3:finite-generation/rank-filtration-homology-finite-type`, `GeneralAlgebraicKTheory:K.1/elementary-properties-of-K-groups`, `GeneralAlgebraicKTheory:K.1/K-groups-of-exact-categories`, `StableHomotopyKTheory:H.1/classifying-space-cw-structure`, `StableHomotopyKTheory:H.1/classifying-space-prod-compactly-generated`, `StableHomotopyKTheory:H.1/natural-transformations-adjoints-contractibility`, `StableHomotopyKTheory:H.1/homology-of-small-categories`, `StableHomotopyKTheory:H.3`, `mathlib:NumberField.RingOfIntegers`, `mathlib:SSet.toTop`, `mathlib:HomotopyGroup.Pi`, `mathlib:HSpace`.

**Checks.**

- π_1 BQ(A)=K_0(A) generally contains Z, so replacing BQ by a simply connected space is incorrect.
- The homotopy shift is n+1, including K_0=π_1; positive plus-model degrees instead use π_n BGL(A)^+.
- For A=Z the result is finite generation in all degrees, not finiteness of all K-groups.

**Source.** [Quillen.1973](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/bass-seattle.pdf), End of proof of Theorem 1, printed p.185, PDF p.193. Quillen passes from finite integral homology to homotopy using the H-space structure. [Serre.1951](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/Serre-HSEF.pdf), III §1 Proposition 1 (pp.465–466); IV §3 Proposition 3 (p.479), IV §6 Proposition 9 (p.483); V §§1–2 Proposition 1 and Variantes (pp.489–491). The simple-space variant is stated after the proof; for the needed H-space case IV.3 supplies homotopically trivial deck transformations, so the cover/loop induction in V.1–2 extends to the first cover as well. Footnote 6 permits the singular-complex formulation.

### Finite kernel and cokernel for finite-S localization

**Target:** `ArithmeticKTheory:N.3:finite-generation/s-localization-finite-defect`.

**Planet:** Finite-S localization.

Let F be a number field, A=O_F, S a finite set of nonzero prime ideals of A, and B=O_{F,S}. For every n≥2, K_n(A) → K_n(B) has finite kernel and finite cokernel. It is injective for positive even n and surjective for odd n≥3. Consequently K_n(B) is finitely generated for n≥2; degree one is finitely generated via the retained K1 determinant/S-unit comparison and finite S, and degree zero via the retained K0/class-group comparison. This refines finite-generation-of-K-of-S-integers, whose ID remains the target endpoint.

**Hypotheses.** The maps are the functorial K maps under A→B, and finite defect concerns their actual kernels/cokernels. Use the predecessor presentation of S-integers as a localization; A itself is finite over Z, whereas B generally is not. Each residue field A/p is finite. Finite S is required in degrees ≥1.

**Proof plan.**

1. Use N.1/S-integers-localisation-of-torsion-class-group to choose nonzero s with B=A[1/s] and the primes containing s exactly S: take the product of generators of positive principal powers of the primes in S, and s=1 for S empty. Apply the finite localization sequence and dévissage in N.2/finite-support to obtain ⊕_{p∈S}K_n(A/p) → K_n(A) → K_n(B) → ⊕_{p∈S}K_{n−1}(A/p). This is the sequence for A → B, not a restriction of the fraction-field sequence. Use exactness to express the kernel as an image and the cokernel as a subgroup.
2. Quillen’s finite-field table (KTheoryFiniteLocalFields:L.1/quillen-k-groups) makes the two outer terms finite for n≥2. Its positive even groups vanish: the left term is zero for even n, and the right term is zero for odd n≥3.
3. An image of a finitely generated abelian group is finitely generated and a finite cokernel is finitely generated; the baseline exact-sequence lemma proves finite generation of the middle target using quillen-homotopy-finite-type.
4. For n=1 the right outer term is Z^S, not finite. Use the imported K1 identification with units and Tau Ceti’s finite-S unit theorem instead. K0 is Z plus a finite class group quotient; do not extrapolate the finite-defect assertion to degree one.

**Dependencies.** `ArithmeticKTheory:N.3:finite-generation/quillen-homotopy-finite-type`, `ArithmeticKTheory:N.1/S-integers-as-a-localisation`, `ArithmeticKTheory:N.1/K1-of-S-integers-and-the-determinant`, `ArithmeticKTheory:N.1/S-integers-localisation-of-torsion-class-group`, `ArithmeticKTheory:N.2/finite-support`, `KTheoryFiniteLocalFields:L.1/quillen-k-groups`, `KTheoryLowDegrees:Z.4/k0-s-integers`, `tauceti:IsDedekindDomain.finite_integer_classGroup`, `tauceti:Set.unit_fg_of_units`, `mathlib:Set.integer`, `mathlib:Module.Finite.of_exact`, `mathlib:Ring.HasFiniteQuotients`, `mathlib:HomotopyGroup.Pi`, `tauceti:HomotopyGroup.mapHom`, `mathlib:GenLoop`, `mathlib:GenLoop.boundary`.

**Checks.**

- For S empty the map is the identity, with zero kernel and cokernel.
- For B=Z[1/p], the degree-one cokernel on units is Z; it is finitely generated but infinite.
- If all rational primes are inverted, B=Q and K1(Q)=Q× is not finitely generated; no infinite-S conclusion is stated.
- For even n≥2 injectivity follows from vanishing K_n(residue), not from a torsion-free assertion about K_n(A).

**Source.** [Quillen.1973](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/bass-seattle.pdf), §1 Remark (2), printed pp.179–180, PDF pp.187–188. The finite-field localization calculation gives finite defects in n>1 and even-degree injectivity.

### Finite generation of number-ring L-groups

**Target:** `ArithmeticKTheory:N.3:finite-generation/number-ring-l-finite-generation` · **Declaration:** `ArithmeticKTheory.number_ring_l_finite_generation`.

For a number field F, finite set S of finite primes and O=O_(F,S), both periodic groups L^s_n(O;ε) and L^q_n(O;ε) are finitely generated abelian groups for every integer n and ε∈{+1,−1}. Here s is periodic symmetric L-theory and q is periodic quadratic L-theory, not a genuine connective flavour.

**Hypotheses.** S is finite; the ring involution is the identity and the coefficient line is O with sign ε. The fraction field has characteristic zero; the assertion includes dyadic primes without assuming 2 invertible.

**Proof plan.**

1. Use GN.6’s arithmetic Witt signature theorem: W^s(O) is an extension of a finite group by a free group of rank r1. Pic(O) is a quotient of the finite class group of O_F. This exact arithmetic signature contract is requested below, not inferred from a field Witt computation.
2. Import DA.0/integral-injectivity to embed W^q(O) in W^s(O). Thus the quadratic Witt group is finitely generated by the noetherian property of Z.
3. Use DA.1/global-symmetric and DA.3/number-field-quadratic: all other entries are finite residue Witt groups, Pic(O)/2 and the finite dyadic correction A(O). Subgroups and extensions of finitely generated abelian groups are finitely generated.
4. Apply the imported sign shift and four-periodicity. This is the arithmetic finiteness corollary; it does not construct L-theory or reprove the Dedekind tables.

**Dependencies.** `GeometryOfNumbersAndQuadraticArithmetic:GN.6`, `GeometryOfNumbersAndQuadraticArithmeticPartII:DA.0/integral-injectivity`, `GeometryOfNumbersAndQuadraticArithmeticPartII:DA.1/global-symmetric`, `GeometryOfNumbersAndQuadraticArithmeticPartII:DA.3/number-field-quadratic`, `GeometryOfNumbersAndQuadraticArithmeticPartII:DA.1/sign-shifts`.

**Checks.**

- For O=Z the symmetric residues mod 4 are Z,Z/2,0,0 and the quadratic residues Z,0,Z/2,0.
- Do not infer finite generation for an arbitrary Dedekind domain or infinite S from this statement.

**Source.** [CDH.III.v4](https://arxiv.org/pdf/2009.07225v4), Corollary 2.3.16 and proof, pp. 47–48 (PDF pages 47–48). Reduces all periodic L-group degrees to symmetric and quadratic Witt groups and Picard groups of a number ring.

### Finite generation in every genuine flavour

**Target:** `ArithmeticKTheory:N.3:finite-generation/genuine-l-finite-generation` · **Declaration:** `ArithmeticKTheory.genuine_l_finite_generation`.

For O=O_(F,S), F a number field and S finite, every integer m,n and ε=±1, L_n(O;Q_ε^(≥m)) is finitely generated. The coefficient and Poincaré structures are GN.6’s; the superscript is the genuine quadratic-to-symmetric filtration.

**Hypotheses.** m and n range over Z, and ε is the standard sign coefficient.

**Proof plan.**

1. The structure Q^(≥m) is m-quadratic and (2−m)-symmetric. Import the quadratic comparison range from HK.5 and the symmetric comparison range from HK.7.
2. For n≤2m−2 the map L^q_n→L_n(Q^(≥m)) is surjective; for n≥2m−1 the map L_n(Q^(≥m))→L^s_n is injective. These adjacent integer ranges exhaust all n.
3. Apply number-ring-l-finite-generation and closure of finitely generated Z-modules under quotients and subgroups. No periodicity of the genuine flavour is assumed.

**Dependencies.** `ArithmeticKTheory:N.3:finite-generation/number-ring-l-finite-generation`, `HermitianKTheoryOfPoincareCategories:HK.5/ring-spectrum-quadratic-comparison`, `HermitianKTheoryOfPoincareCategories:HK.7/symmetric-comparison-range`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6`.

**Checks.**

- Check n=2m−2 through surjectivity and n=2m−1 through injectivity.
- No equality of classical quadratic and symmetric forms at 2 is used.

**Source.** [CDH.III.v4](https://arxiv.org/pdf/2009.07225v4), Corollary 2.3.18, p. 48; Corollaries 1.2.12 and 1.3.9, pp. 18 and 31. The two comparison ranges give finite generation of each genuine L-group, including the boundary degrees.

### Hermitian finite generation over number rings

**Target:** `ArithmeticKTheory:N.3:finite-generation/classical-gw-finite-generation` · **Declaration:** `ArithmeticKTheory.classical_gw_finite_generation`.

**Planet:** Hermitian finite generation.

Let O=O_(F,S) for a number field F and a finite set S of finite primes. For ε=±1 and every n≥0, the classical ε-symmetric and ε-quadratic Grothendieck–Witt groups GW^s_(cl,n)(O;ε) and GW^q_(cl,n)(O;ε) are finitely generated abelian groups. No choice of quadratic refinement, inversion of 2, or vanishing of real places is assumed.

**Hypotheses.** Classical groups are nonnegative-degree groups. The genuine derived flavours used in the proof retain their integer indexing.

**Proof plan.**

1. Quillen finite generation supplies each π_b K(O) for b≥0. The connective homotopy-orbit spectral sequence H_a(C2;K_b(O))⇒π_(a+b)(K(O)_(hC2)) has only finitely many terms on each diagonal. Each is finitely generated: finite-group homology of a finitely generated abelian coefficient group has this property. The exact finite-type spectral-sequence contract is requested from H.6.
2. Use the fundamental fibre sequence K(O)_(hC2)→GW(O;Q^(≥m))→L(O;Q^(≥m)) and the preceding genuine-L theorem. The long exact sequence expresses each GW group as an extension of a quotient and a subgroup of finitely generated groups.
3. Import GN.6’s Hebestreit–Steimle classical comparison and HK.8’s symmetric/quadratic fibre sequences to obtain both classical flavours in every n≥0. This is Corollary 2.3.19, restated as introduction Corollary 8. The low quadratic degrees are covered by the supplied classical fibre sequence, not by extending a comparison valid only in degrees ≥4.

**Dependencies.** `ArithmeticKTheory:N.3:finite-generation/genuine-l-finite-generation`, `ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers`, `StableHomotopyKTheory:H.6`, `GeometryOfNumbersAndQuadraticArithmetic:GN.6`, `HermitianKTheoryOfPoincareCategories:HK.8/classical-gw-fibre-sequence`, `HermitianKTheoryOfPoincareCategories:HK.8/quadratic-gw-fibre-sequence`.

**Checks.**

- Apply to Z and Z[1/2], for both signs, including n=0,1,2,3.
- Keep finite generation separate from the explicit hermitian group tables of GN Part II.
- An infinite set S supplies no finite-generation conclusion by this proof.

**Source.** [CDH.III.v4](https://arxiv.org/pdf/2009.07225v4), Corollary 8, p. 5; Corollaries 2.3.18–2.3.19 and proofs, p. 48. Combines arithmetic K finiteness, homotopy orbits, genuine L comparison and the classical comparison to prove both classical GW finiteness assertions.

## N.3:ranks — The finite-S rank extension

R.3 supplies the Borel rank theorem for orders, including O_F. This layer owns the passage to finite S. For n≥2, rational localization gives rank r1+r2 for n≡1 mod4, r2 for n≡3 mod4 and zero for even n. Finite generation from the preceding substage then makes positive even groups of O_(F,S) finite. Degree one has S-unit rank r1+r2+|S|−1. The even field groups are torsion and generally infinite; the residue sums make the difference visible. The rational rank map and the abstract numerical rank are separate declarations.

### Ranks of the K-groups of S-integers: the passage from the ring of integers, and the degree-one exception

**Target:** `ArithmeticKTheory:N.3:ranks/borel-rank-theorem`.

**Planet:** Ranks of K-groups of S-integers.

For F a number field, S finite and n≥2, the natural map K_n(O_F)⊗Q→K_n(O_(F,S))⊗Q is an isomorphism. Consequently the rank is r1+r2 for n≡1 mod4, r2 for n≡3 mod4 and 0 for n even, using R.3’s rank formula for O_F. The S-integer extension is owned here: finite-S localization and finite-field positive K-groups give its proof. Degree one instead has rank r1+r2+|S|−1.

**Hypotheses.** n ≥ 2 in (a). The rank is dim_ℚ K_n ⊗ ℚ; since K_n(𝓞_{F,S}) is finitely generated (N.3:finite-generation) it is the rank of a finitely generated abelian group. 𝓞_{F,S} with S ≠ ∅ is not an order in the source's sense ('a subring of A which is finitely generated over Z and has R ⊗ Q = A'), so Borel's Theorem IV.1.17 does not apply to it; the passage from 𝓞_F is this node's (RT-AREA-ktheory-1/7), by the localisation sequence of 𝓞_F ⊂ 𝓞_{F,S} = 𝓞_F[1/s] with the finitely many residue fields k(𝔭), 𝔭 ∈ S. The finiteness of the positive even groups is for the ring, not for the field: K_{2i}(F) is infinite (N.3:ranks/even-K-groups-of-the-field-are-infinite-torsion), and the K-book's Classical Data VI.8.1 prints K_n(F) there by mistake (sourceIssues ArithmeticKTheory/E15).

**Proof plan.**

1. Apply the finite-S localization defect theorem to the actual map K_n(O_F)→K_n(O_(F,S)). For n≥2 the residue terms in positive degrees are finite by L.1, so rationalization makes this map an isomorphism. Import R.3’s orders-only rank formula. Degree one uses the S-unit sequence and never this formula.

**Dependencies.** `BorelRegulators:R.3/borel-rank-theorem`, `ArithmeticKTheory:N.3/finite-S-localisation-defect`, `KTheoryFiniteLocalFields:L.1/quillen-k-groups`.

**Checks.**

- K_3(ℤ), K_7(ℤ) and every K_{2j}(ℤ), j ≥ 1, have rank 0, while K_5(ℤ) and K_9(ℤ) have rank 1 (r_1 = 1, r_2 = 0); the same holds for ℤ[1/p], since K_n(ℤ) → K_n(ℤ[1/p]) is a rational isomorphism for n ≥ 2.
- For F = ℚ(√−1) (r_1 = 0, r_2 = 1) every K_n(ℤ[√−1]) with n odd and n ≥ 3 has rank 1.
- For a real quadratic field (r_1 = 2, r_2 = 0), rank K_5 = 2 and rank K_3 = 0; for an imaginary quadratic field rank K_3 = rank K_5 = 1.
- For n ≥ 2 the rank does not depend on S.
- Degree one is excluded, and must be excluded by the hypothesis n ≥ 2 rather than by a check of values: rank K_1(𝓞_{F,S}) = r_1 + r_2 + |S| − 1, which equals the n ≡ 1 value r_1 + r_2 exactly when |S| = 1. For ℤ it is 0 against 1, for ℤ[1/6] it is 2 against 1, and for ℤ[1/2] both are 1; K_1(ℤ) = {±1} → K_1(ℤ[1/2]) = {±1} × 2^ℤ has cokernel ℤ, of rank |S| = 1.
- The source's own degree-one warning: for the group ring ℤ[C_p] of a cyclic group of prime order p ≥ 3, r_1 + r_2 = (p + 1)/2 while K_1(ℤ[C_p]) has rank (p − 3)/2.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), IV.1.18 (PDF p. 279; book p. 271). Borel's theorem; imported from R.3 with A = F. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), IV.1.17 (PDF p. 279; book p. 271). Borel's comparison for orders, imported from R.3 for the order 𝓞_F; 𝓞_{F,S} with S ≠ ∅ is not an order, which is why this node passes from 𝓞_F to 𝓞_{F,S} itself. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Before IV.1.17 (PDF p. 279). The definition of an order, which excludes 𝓞_{F,S} for S ≠ ∅; hence the localisation step. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Before IV.1.18 (PDF p. 279). The degrees of the primitive generators, from which the period-four pattern is read off (numerical check of the rank formula). [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), IV.1.18.2, Example 1.18.2 (PDF p. 280; book p. 272). The source's warning that degree one does not follow the pattern.

### The positive even K-groups of rings of S-integers are finite

**Target:** `ArithmeticKTheory:N.3:ranks/even-K-groups-of-S-integers-are-finite`.

Let F be a number field and S a finite set of nonzero primes of 𝓞_F. For every i ≥ 1 the group K_{2i}(𝓞_{F,S}) is finite; in particular K_2(𝓞_F) is finite. The statement is about the ring: the corresponding groups K_{2i}(F) of the field are infinite torsion groups (N.3:ranks/even-K-groups-of-the-field-are-infinite-torsion), and the K-book's Classical Data VI.8.1, which prints the finiteness for K_n(F), is misprinted there (sourceIssues ArithmeticKTheory/E15).

**Hypotheses.** F a number field, S finite (S = ∅ allowed), i ≥ 1. This is the finiteness theorem for K_2(𝓞_F) that SpecialValuesBirchTate B.1 uses (RT-AREA-ktheory-1/10); it is exported from this stage, N.3:ranks.

**Proof plan.**

1. K_{2i}(𝓞_{F,S}) is finitely generated (N.3:finite-generation/finite-generation-of-K-of-S-integers).
2. Its rank is 0 (N.3:ranks/borel-rank-theorem (a), n = 2i even).
3. A finitely generated abelian group of rank 0 is finite (mathlib:AddCommGroup.equiv_free_prod_directSum_zmod).

**Dependencies.** `ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers`, `ArithmeticKTheory:N.3:ranks/borel-rank-theorem`, `mathlib:AddCommGroup.equiv_free_prod_directSum_zmod`.

**Checks.**

- K_2(ℤ) has order two (K2SymbolsBrauer T.5/k2-of-the-integers) and K_2(ℤ[1/p]) has order 2(p − 1) (T.5/s-integer-tame-kernel-sequence); both are finite, as they must be.
- K_4(ℤ) and K_6(ℤ) are finite.
- Non-example: K_2(ℚ) is infinite (T.5/k2-of-the-rationals); the theorem is false for the field.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), IV.1.18, last sentence (PDF p. 279; book p. 271). Torsion of the even groups of an order; with finite generation and the passage to 𝓞_{F,S} this gives finiteness. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.1, Classical Data 8.1 (PDF p. 521; book p. 513). The finiteness statement with the misprint K_n(F) for K_n(O_S) (sourceIssues ArithmeticKTheory/E15); this node states it for the ring.

### The positive even K-groups of a number field are infinite torsion groups

**Target:** `ArithmeticKTheory:N.3:ranks/even-K-groups-of-the-field-are-infinite-torsion`.

Let F be a number field and i ≥ 1. Then K_{2i}(F) is a torsion group, and it is infinite. Torsion: in the localisation sequence K_{2i}(𝓞_F) → K_{2i}(F) → ⊕_𝔭 K_{2i−1}(k(𝔭)) the left term is finite (N.3:ranks/even-K-groups-of-S-integers-are-finite) and the right term is torsion. Infinite: in the localisation sequence of 𝓞_F the boundary K_{2i}(F) → ⊕_𝔭 K_{2i−1}(k(𝔭)) ≅ ⊕_𝔭 Z/(N𝔭^i − 1) has infinite image, because the next map lands in the finitely generated group K_{2i−1}(𝓞_F). By contrast K_{2i}(𝓞_{F,S}) is finite for every finite S (N.3/finiteness-and-ranks-combined).

**Hypotheses.** F is a number field and i ≥ 1; the direct sum runs over all non-zero primes 𝔭 of 𝓞_F, and N𝔭 = #k(𝔭). The argument does not use Soulé's theorem, which would give the sharper exact sequence 0 → K_{2i}(𝓞_F) → K_{2i}(F) → ⊕_𝔭 K_{2i−1}(k(𝔭)) → 0; Soulé's proof itself uses finite generation (see restructure), so this node avoids it.

**Proof plan.**

1. Torsion: the localisation sequence of 𝓞_F (N.2) gives an exact segment K_{2i}(𝓞_F) → K_{2i}(F) → ⊕_𝔭 K_{2i−1}(k(𝔭)); K_{2i}(𝓞_F) is finite (N.3:ranks/even-K-groups-of-S-integers-are-finite) and the direct sum is torsion (KTheoryFiniteLocalFields L.1), so K_{2i}(F) is torsion.
2. The localisation sequence of 𝓞_F (N.2) gives an exact segment K_{2i}(F) → ⊕_𝔭 K_{2i−1}(k(𝔭)) → K_{2i−1}(𝓞_F).
3. Each K_{2i−1}(k(𝔭)) ≅ Z/(N𝔭^i − 1) (KTheoryFiniteLocalFields L.1) is non-zero as soon as N𝔭^i > 2, which excludes only the primes of norm 2 when i = 1; infinitely many 𝔭 remain, so the direct sum is an infinite torsion group.
4. Its image in the finitely generated group K_{2i−1}(𝓞_F) (N.3:finite-generation) is a finitely generated torsion group, hence finite; so the kernel, which is the image of the boundary, is infinite, and K_{2i}(F) is infinite.

**Dependencies.** `ArithmeticKTheory:N.3:ranks/even-K-groups-of-S-integers-are-finite`, `ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers`, `ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain`, `KTheoryFiniteLocalFields:L.1`.

**Checks.**

- K_2(Q) is infinite (its boundary maps onto ⊕_p F_p^×, the tame symbol of N.2), while K_2(Z) ≅ Z/2 is finite (K2SymbolsBrauer T.5).
- K_4(Q) is an infinite torsion group although K_4(Z) is finite.
- The contrast is special to even degrees: for odd n ≥ 3 the groups of the ring and of the field agree (Soulé) and are finitely generated.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.8, Theorem 6.8 (PDF p. 420; book p. 412). The even-degree sequences exhibit K_n(F) as an extension of the infinite group ⊕_p K_{n−1}(R/p) by K_n(R); this node proves the weaker statement it needs without Soulé's theorem. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), IV.1.18, last sentence (PDF p. 279). Torsion of the even groups, for orders and, through Theorem 1.18 with A = F, for the field.

## N.4 — Twisted roots of unity

Define W_j intrinsically as invariants of Q/Z(j), with its primary decomposition, restriction and corestriction. Compute its finite exponents through the image of the cyclotomic character: ℓ^a divides w_j exactly when the relevant cyclotomic Galois exponent divides j. Treat ℓ=2 separately using exceptional fields and the adjoining-i tower. Test w2(Q)=24 against |μ(Q)|=2, the odd-weight values, and w10(Q)=264. The printed value 1320 in the read K-book draft is corrected in the inherited finding. N.7 uses the Bernoulli denominator comparison but introduces no second W_j.

### The group W_i(F) = H⁰(F, ℚ/ℤ(i)) and its order w_i(F)

**Target:** `ArithmeticKTheory:N.4/the-w-invariant`.

**Planet:** The numbers w_i(F).

Let F be a field with separable closure F^s and absolute Galois group G_F = Gal(F^s/F), and i ∈ Z. Let µ(i) be the i-th Tate twist of µ = µ(F^s): the group µ with g ∈ G_F acting by ζ ↦ g^i(ζ), that is, on µ_{ℓ^ν} by ζ ↦ ζ^{χ_ℓ(g)^i} for the ℓ-adic cyclotomic character χ_ℓ (K-book Definition VI.1.7); it is ℚ/ℤ(i) (its prime-to-p part in characteristic p), imported from MotivicEtaleKTheory M.1. Define W_i(F) = H⁰(G_F, µ(i)) = µ(i)^{G_F} and, for a prime ℓ ≠ char F, W_i^{(ℓ)}(F) = (ℤ/ℓ^∞(i))^{G_F}, so that W_i(F) = ⊕_ℓ W_i^{(ℓ)}(F). When W_i(F) is finite it is cyclic, and w_i(F) = #W_i(F), w_i^{(ℓ)}(F) = #W_i^{(ℓ)}(F), with w_i(F) = ∏_ℓ w_i^{(ℓ)}(F); these numbers are written only under a finiteness hypothesis. For a finite separable extension E/F there are restriction W_i(F) → W_i(E) and transfer W_i(E) → W_i(F) with transfer ∘ restriction = [E : F]. No K-theory enters the definition; W_i(F) is the target of the e-invariant of N.5.

**Hypotheses.** F is a field and i ∈ Z; for the applications F is a number field and i ≥ 1, where W_i(F) is finite (N.4/finiteness-of-the-w-invariant). The twist is MotivicEtaleKTheory M.1's primewise-compatible ℚ/ℤ(i) ('Q/Z(j) uses primewise compatible twists, not the ordinary tensor power of Q/Z'); in weight one it is the colimit of Tau Ceti's KummerCoeff F ℓ^ν. K2SymbolsBrauer T.7 does not own it: its reviewed packet imports the twists from M.1. For i = 0 the action is trivial, W_0(F) = µ(F^s) is infinite and w_0 is not defined.

**Proof plan.**

1. Import µ(i) = ℚ/ℤ(i) as a discrete G_F-module from MotivicEtaleKTheory M.1, with g acting on µ_{ℓ^ν}(i) through χ_ℓ(g)^i, χ_ℓ being Mathlib's cyclotomicCharacter (its reduction modulo ℓ^ν is modularCyclotomicCharacter).
2. Define W_i(F) as Tau Ceti's ContCohomology.H0 of G_F (TauCeti.AbsoluteGaloisGroup) acting on µ(i), and W_i^{(ℓ)}(F) as its ℓ-primary component (Mathlib's primaryComponent).
3. Primary decomposition: µ(i) is torsion, so W_i(F) is the internal direct sum of the W_i^{(ℓ)}(F), ℓ ≠ char F.
4. Cyclicity: the underlying group of µ(i) is µ(F^s) ⊂ (F^s)^×, so a finite subgroup is cyclic (Mathlib's isCyclic_subgroup_units); each finite W_i^{(ℓ)}(F) is µ_{ℓ^m}(i) for a unique m.
5. Define w_i(F) and w_i^{(ℓ)}(F) as cardinalities under a finiteness hypothesis and prove w_i(F) = ∏_ℓ w_i^{(ℓ)}(F).
6. Restriction and transfer: for E/F finite separable, G_E is an open subgroup of index [E : F] in G_F; restriction is Tau Ceti's explicitRes0 (the inclusion of fixed points, injective), transfer is explicitCor0 (the norm over G_F/G_E), and explicitCor0_comp_res0 gives transfer ∘ restriction = [E : F]. Hence w_i(F) divides w_i(E) when both are finite.

**Dependencies.** `MotivicEtaleKTheory:M.1`, `mathlib:cyclotomicCharacter`, `mathlib:modularCyclotomicCharacter`, `mathlib:rootsOfUnity`, `mathlib:isCyclic_subgroup_units`, `mathlib:CommMonoid.primaryComponent`, `tauceti:TauCeti.KummerCoeff`, `tauceti:TauCeti.AbsoluteGaloisGroup`, `tauceti:TauCeti.ContCohomology.H0`, `tauceti:TauCeti.ContCohomology.explicitRes0`, `tauceti:TauCeti.ContCohomology.explicitCor0`, `tauceti:TauCeti.ContCohomology.explicitCor0_comp_res0`.

**Uses.** N.5, e-invariant and Harris-Segal summand: W_i(F) is the target of the e-invariant, and the Harris-Segal summand is cyclic of order w_i^{(ℓ)}(F). N.5, the odd tables (K-book VI.8.4, VI.9.5): the torsion of K_{2i−1}(𝓞_{F,S}) is Z/w_i(F), Z/2w_i(F) ⊕ (Z/2)^{r_1−1} or Z/(w_i(F)/2). N.6, even groups: the cohomological descriptions are stated at the same twists ℤ_ℓ(i + 1). SpecialValuesBirchTate B.1–B.3: B.1 imports W_2(F) = H⁰(F, ℚ/ℤ(2)) — the invariants of the twist ℚ/ℤ(2), not the roots of unity of F — from this node, with its finiteness and positivity from N.4/finiteness-of-the-w-invariant and the cyclotomic computation from N.4/computing-w-from-the-cyclotomic-character (RT-AREA-ktheory-1/10; atlas edge N.4 → B.1); the Birch-Tate formula ζ_F(−1) = (−1)^{[F:Q]} #K_2(𝓞_F)/w_2(F) uses w_2(F), and B.3 uses w_2(Q) = 24.

**API.**

- `TauCeti.WInvariant` (data): W_i(F) = H⁰(G_F, ℚ/ℤ(i)), the fixed points of G_F on M.1's twist ℚ/ℤ(i), as an additive subgroup.
- `TauCeti.WInvariant.primary` (data): For a prime ℓ ≠ char F, W_i^{(ℓ)}(F) = (ℤ/ℓ^∞(i))^{G_F}, the ℓ-primary component of W_i(F).
- `TauCeti.WInvariant.isInternal_primary` (structure): W_i(F) is the internal direct sum of the W_i^{(ℓ)}(F) over the primes ℓ ≠ char F.
- `TauCeti.WInvariant.isCyclic` (instance): If W_i(F) is finite it is cyclic (a finite subgroup of µ(F^s) ⊂ (F^s)^×).
- `TauCeti.wInvariant` (data): w_i(F) = #W_i(F); every statement about it carries the hypothesis that W_i(F) is finite, since the cardinality of an infinite group is not the source's w_i(F).
- `TauCeti.wInvariant_eq_prod_primary` (relation): If W_i(F) is finite, w_i(F) = ∏_ℓ w_i^{(ℓ)}(F), a finite product.
- `TauCeti.WInvariant.neg_eq` (characterisation): W_{−i}(F) = W_i(F) as subgroups of µ(F^s): χ(g)^i x = x if and only if x = χ(g)^{−i} x.
- `TauCeti.WInvariant.zero_eq_top` (example): W_0(F) is all of µ(F^s) (the action is trivial); it is infinite.
- `TauCeti.WInvariant.oneEquivRootsOfUnity` (compatibility): W_1(F) ≅ µ(F), the roots of unity of F; for a number field, W_1(F) ≅ Additive (NumberField.Units.torsion F).
- `TauCeti.WInvariant.res` (functoriality): For an intermediate field E of F^s/F, restriction W_i(F) →+ W_i(E), built on TauCeti.ContCohomology.explicitRes0; it is injective. For an abstract extension E the map depends on the embedding E → F^s when i ≠ 1: two embeddings differ by ζ ↦ ζ^{χ(σ)}, which is non-trivial on W_2(ℚ) = μ_24.
- `TauCeti.WInvariant.cor` (functoriality): For a finite intermediate field E of F^s/F, transfer W_i(E) →+ W_i(F), built on TauCeti.ContCohomology.explicitCor0 (the norm over G_F/G_E).
- `TauCeti.WInvariant.cor_comp_res` (relation): cor ∘ res = [E : F] • id on W_i(F) for a finite intermediate field E of F^s/F (from explicitCor0_comp_res0).
- `TauCeti.wInvariant_dvd_of_finite` (relation): For E/F finite separable with W_i(E) finite, W_i(F) is finite and w_i(F) divides w_i(E).

**Unit tests.**

- `TauCeti.wInvariant_finiteField`: For i ≥ 1, w_i(F_q) = q^i − 1: the Frobenius acts on µ(i) by ζ ↦ ζ^{q^i}, whose fixed points are µ_{q^i−1}. An untwisted action would give q − 1 for every i.
- `TauCeti.wInvariant_rat_of_odd`: For odd i, w_i(Q) = 2.
- `TauCeti.wInvariant_gaussian_of_odd`: For odd i, w_i(Q(√−1)) = 4.
- `TauCeti.wInvariant_one_eq_torsionOrder`: For a number field F, w_1(F) = NumberField.Units.torsionOrder F; for the n-th cyclotomic field this is n for n even and 2n for n odd (IsCyclotomicExtension.Rat.torsionOrder_eq).
- `TauCeti.WInvariant.zero_infinite`: W_0(F) is infinite for every field F, so w_0(F) is not defined.
- `TauCeti.wInvariant_two_rat_ne_torsionOrder`: w_2(Q) = 24 while NumberField.Units.torsionOrder ℚ = 2 (NumberField.Units.torsionOrder_eq_two_of_odd_finrank): a definition by the roots of unity of F fails.
- `TauCeti.WInvariant.not_tensorPower`: The ordinary tensor power ℚ/ℤ ⊗_ℤ ℚ/ℤ is zero, so defining ℚ/ℤ(2) as it would give W_2(Q) = 0 instead of a cyclic group of order 24.
- `TauCeti.WInvariant.neg_eq_rat`: W_{−2}(Q) = W_2(Q) as subgroups of µ(Q̄), of order 24.

**Checks.**

- W_1(F) = µ(F); for a number field w_1(F) is the order of the torsion of 𝓞_F^×.
- W_i(F_q) is cyclic of order q^i − 1 for i ≥ 1.
- w_i(Q) = 2 for odd i, and w_2(Q) = 24 (N.4/w2-of-the-rationals-and-the-divisibility-tests).
- W_i(F) is not the group of roots of unity of F: the two agree for i = 1 and differ already for Q and i = 2 (orders 24 and 2).

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.1.7, Definition 1.7 (PDF p. 476; book p. 468). The Tate twist µ(i); g^i(ζ) = ζ^{χ(g)^i}. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2, before Definition 2.1 (PDF p. 477; book p. 469). The primary decomposition of the invariants. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.1, Definition 2.1, second half (PDF p. 477). Cyclicity, the notation w_i(F) only for a finite group, and the product formula. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.1.1 (PDF p. 478; book p. 470). The finite-field value, used as a test; 'for all i' means i ≥ 1 (see source issue). [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.1.2 (PDF p. 478). The values over Q and Q(√−1), used as tests.

### Computing w_i^{(ℓ)}(F) at odd primes from the cyclotomic character (Proposition VI.2.2)

**Target:** `ArithmeticKTheory:N.4/computing-w-from-the-cyclotomic-character`.

Fix a prime ℓ ≠ 2 and a field F of characteristic ≠ ℓ. Let a ≤ ∞ be maximal such that F(ζ_ℓ) contains a primitive ℓ^a-th root of unity, and let r = [F(ζ_ℓ) : F], a divisor of ℓ − 1. Write i = cℓ^b with ℓ ∤ c (i ≠ 0). Then w_i^{(ℓ)}(F) = ℓ^{a+b} if r | i, and 1 otherwise: (a) if ζ_ℓ ∈ F then w_i^{(ℓ)} = ℓ^{a+b}; (b) if ζ_ℓ ∉ F and r | i then w_i^{(ℓ)} = ℓ^{a+b}; (c) if ζ_ℓ ∉ F and r ∤ i then w_i^{(ℓ)} = 1. When a = ∞ and r | i the ℓ-primary part is infinite.

**Hypotheses.** ℓ is odd; the prime 2 is N.4/two-primary-w-invariant and is genuinely different, since (ℤ/2^ν)^× is not cyclic for ν ≥ 3. char F ≠ ℓ, and a ≤ ∞ as in the source; a is finite for a number field. i ≠ 0, so that b = v_ℓ(i) is defined.

**Proof plan.**

1. For ν ≥ a (a finite), [F(ζ_{ℓ^ν}) : F(ζ_ℓ)] = ℓ^{ν−a}: the image of Gal(F(ζ_{ℓ^ν})/F(ζ_ℓ)) in the cyclic group 1 + ℓ^a ℤ/ℓ^ν of order ℓ^{ν−a} cannot lie in its maximal proper subgroup 1 + ℓ^{a+1} ℤ/ℓ^ν, which fixes ζ_{ℓ^{a+1}} ∉ F(ζ_ℓ).
2. So Gal(F(ζ_{ℓ^ν})/F) is a subgroup of the cyclic group (ℤ/ℓ^ν)^× (Mathlib's ZMod.isCyclic_units_of_prime_pow), hence cyclic, of order rℓ^{ν−a}, and its exponent is its order; for 1 ≤ ν ≤ a, F(ζ_{ℓ^ν}) = F(ζ_ℓ) and the group is Gal(F(ζ_ℓ)/F), cyclic of order r.
3. By the exponent criterion, ℓ^ν | w_i^{(ℓ)}(F) exactly when rℓ^{ν−a} | cℓ^b for ν ≥ a, that is r | i and ν ≤ a + b (r is prime to ℓ); and for 1 ≤ ν ≤ a exactly when r | i. This gives ℓ^{a+b} if r | i and 1 otherwise.
4. Derive the cyclotomic example (Example VI.2.2.2) and the value over Q (a = 1, r = ℓ − 1).

**Dependencies.** `ArithmeticKTheory:N.4/the-w-invariant`, `ArithmeticKTheory:N.4/exponent-criterion`, `mathlib:IsCyclotomicExtension`, `mathlib:ZMod.isCyclic_units_of_prime_pow`.

**Checks.**

- F = Q: a = 1 and r = ℓ − 1, so w_i^{(ℓ)}(Q) = ℓ^{1+v_ℓ(i)} when (ℓ − 1) | i and 1 otherwise; for example w_2^{(3)}(Q) = 3, w_6^{(3)}(Q) = 9, w_6^{(7)}(Q) = 7 and w_4^{(5)}(Q) = 5.
- F = Q(ζ_{p^a}), p odd: w_i^{(p)}(F) = p^{a+b} for i = cp^b, and for ℓ ≠ 2, p, w_i^{(ℓ)}(F) = w_i^{(ℓ)}(Q) (Example VI.2.2.2).
- F = Q(√−7), ℓ = 7: Q(√−7) ⊂ Q(ζ_7), so a = 1 and r = 3, and w_3^{(7)}(Q(√−7)) = 7 while w_3^{(7)}(Q) = 1.
- F = Q(ζ_3), ℓ = 3: ζ_3 ∈ F and a = 1, so w_3^{(3)}(F) = 9 and w_1^{(3)}(F) = 3.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.2, Proposition 2.2 (PDF pp. 478–479; book pp. 470–471). The proposition; the cases (a)–(c) follow on PDF p. 479. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.2, the proof (PDF p. 479). The first step of the proof. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.2.2, Example 2.2.2 (PDF p. 479). The cyclotomic example.

### Exceptional fields

**Target:** `ArithmeticKTheory:N.4/exceptional-fields-at-two`.

**Planet:** Exceptional fields.

A field F is exceptional if char F = 0 and the Galois groups Gal(F(ζ_{2^ν})/F) are not cyclic for all large ν; otherwise F is non-exceptional. For a number field F this holds exactly when F ∩ Q(ζ_{2^∞}), taken in an algebraic closure of F, is totally real, i.e. when the image of G_F under the 2-adic cyclotomic character contains −1. Every number field with a real place is exceptional, and so are some totally imaginary fields, such as Q(√−7) and Q(√−3); Q(√−1) and Q(√−2) are non-exceptional. The distinction is needed only at ℓ = 2, where (ℤ/2^ν)^× is not cyclic for ν ≥ 3.

**Hypotheses.** F is a field; exceptionality requires char F = 0. For a number field F, Gal(F(ζ_{2^ν})/F) ≅ Gal(Q(ζ_{2^ν})/F ∩ Q(ζ_{2^ν})), a subgroup H_ν of (ℤ/2^ν)^× ≅ {±1} × ⟨5⟩; for ν ≥ 3, H_ν is non-cyclic exactly when it contains −1 and has order at least 4, which gives the characterisation. The source also asserts that R is exceptional; under the definition as printed it is not (Gal(C/R) ≅ ℤ/2 is cyclic). Nothing in this roadmap uses R (source issue).

**Proof plan.**

1. Define IsExceptional F as in the source, with the Galois groups of the cyclotomic extensions F(ζ_{2^ν})/F.
2. For a number field, identify Gal(F(ζ_{2^ν})/F) with the subgroup H_ν of (ℤ/2^ν)^× fixing F ∩ Q(ζ_{2^ν}) (IsCyclotomicExtension.autEquivPow over Q), and prove that a subgroup of (ℤ/2^ν)^×, ν ≥ 3, is cyclic unless it contains −1 and has order at least 4 (an abelian 2-group with a unique involution is cyclic; ±(1 + 2^{ν−1}) are both in H once −1 and 1 + 2^{ν−1} are).
3. Real places: complex conjugation for a real embedding acts on µ_{2^∞} as −1, and |H_ν| → ∞, so every number field with a real place is exceptional.
4. √−1 ∈ F: H_ν ⊂ 1 + 4ℤ/2^ν = ⟨5⟩ is cyclic, so F is non-exceptional.
5. Subfields: if E/F is an extension and E is exceptional, then Gal(E(ζ_{2^ν})/E) embeds in Gal(F(ζ_{2^ν})/F), so F is exceptional.

**Dependencies.** `mathlib:IsCyclotomicExtension`, `mathlib:IsCyclotomicExtension.autEquivPow`, `mathlib:ZMod.isCyclic_units_two_pow_iff`, `mathlib:cyclotomicCharacter`, `mathlib:NumberField.InfinitePlace.nrRealPlaces`.

**Uses.** N.4/two-primary-w-invariant (K-book Proposition VI.2.3): cases (c) and (d) of the 2-primary formula differ by exceptionality. N.5/harris-segal-summand (K-book Theorem VI.2.5, Remark 2.5.1): the Harris-Segal theorem at ℓ = 2 is proved for non-exceptional fields only. N.5/the-real-case-modulo-eight and N.6: every real number field is exceptional, so the dyadic corrections are the general case there, not a corner case.

**API.**

- `TauCeti.IsExceptional` (data): F is exceptional: char F = 0 and Gal(F(ζ_{2^ν})/F) is not cyclic for all sufficiently large ν.
- `TauCeti.IsExceptional.charZero` (projection): An exceptional field has characteristic zero.
- `TauCeti.IsExceptional.iff_inf_cyclotomic_isTotallyReal` (characterisation): For a number field F: F is exceptional if and only if F ∩ Q(ζ_{2^∞}) is totally real, if and only if −1 lies in the image of G_F under the 2-adic cyclotomic character.
- `TauCeti.IsExceptional.of_nrRealPlaces_pos` (characterisation): A number field with nrRealPlaces F > 0 is exceptional.
- `TauCeti.IsExceptional.not_of_sqrt_neg_one_mem` (characterisation): If −1 is a square in F, F is non-exceptional.
- `TauCeti.IsExceptional.of_extension` (functoriality): If E/F is a field extension and E is exceptional, then F is exceptional.
- `TauCeti.IsExceptional.rat` (example): Q is exceptional.

**Unit tests.**

- `TauCeti.IsExceptional.rat`: Q is exceptional: Gal(Q(ζ_{2^ν})/Q) ≅ (ℤ/2^ν)^× (IsCyclotomicExtension.autEquivPow with Polynomial.cyclotomic.irreducible_rat), which is not cyclic for ν ≥ 3 (ZMod.isCyclic_units_two_pow_iff).
- `TauCeti.IsExceptional.not_gaussian`: Q(√−1) is non-exceptional: Gal(Q(ζ_{2^ν})/Q(√−1)) is the subgroup of classes ≡ 1 (mod 4), generated by 5.
- `TauCeti.IsExceptional.sqrt_neg_seven`: Q(√−7) is exceptional: 7 ramifies in Q(√−7) and not in Q(ζ_{2^ν}), so Q(√−7) ∩ Q(ζ_{2^ν}) = Q and Gal(Q(√−7, ζ_{2^ν})/Q(√−7)) ≅ (ℤ/2^ν)^×.
- `TauCeti.IsExceptional.not_sqrt_neg_two`: Q(√−2) is totally imaginary, does not contain √−1, and is non-exceptional: Q(√−2) ⊂ Q(ζ_8) and Gal(Q(ζ_{2^ν})/Q(√−2)) is the cyclic subgroup of classes ≡ 1, 3 (mod 8), generated by 3. So neither 'exceptional = √−1 ∉ F' nor 'exceptional = has a real place' is the definition (the latter fails on Q(√−7)).
- `TauCeti.IsExceptional.not_of_charP`: A field of positive characteristic, e.g. F_3, is non-exceptional; Gal(F_3(ζ_{2^ν})/F_3) is in any case cyclic, generated by the Frobenius.

**Checks.**

- Q and every real number field are exceptional.
- Q(√−7) is exceptional, as the source says, and so is Q(√−3).
- Q(√−1) and Q(√−2) are non-exceptional.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2, after Example 2.2.2 (PDF p. 479; book p. 471). The definition; 'two involutions' is a misprint for three (source issue). [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2, after Proposition 2.3 (PDF p. 479). Which fields are exceptional; correct for number fields and for Q_2 and its subfields, not for R (source issue).

### The numbers w_i(ℚ), and w₂(ℚ) = 24

**Target:** `ArithmeticKTheory:N.4/w2-of-the-rationals-and-the-divisibility-tests`.

w_i(Q) = 2 for odd i. For even i ≠ 0, w_i(Q) = 2^{2+v_2(i)} · ∏ ℓ^{1+v_ℓ(i)}, the product over the odd primes ℓ with (ℓ − 1) | i. In particular w_2(Q) = 2^3 · 3 = 24, with w_2^{(2)}(Q) = 8, w_2^{(3)}(Q) = 3 and w_2^{(ℓ)}(Q) = 1 for ℓ ≥ 5. The divisibility test by prime powers is N.4/exponent-criterion; for Q it reads ℓ^ν | w_i(Q) if and only if (ℤ/ℓ^ν)^× has exponent dividing i.

**Hypotheses.** The field is Q; i ∈ Z, i ≠ 0. Q is exceptional (N.4/exceptional-fields-at-two) and does not contain √−1, so the 2-part is case (b) or (c) of Proposition VI.2.3.

**Proof plan.**

1. Odd primes (N.4/computing-w-from-the-cyclotomic-character with F = Q): a = 1, since Q(ζ_ℓ) contains ζ_ℓ but not ζ_{ℓ^2}, and r = [Q(ζ_ℓ) : Q] = ℓ − 1 (IsCyclotomicExtension.Rat.finrank); so w_i^{(ℓ)}(Q) = ℓ^{1+v_ℓ(i)} if (ℓ − 1) | i and 1 otherwise. For i = 2 only ℓ = 3 qualifies, with v_3(2) = 0, giving 3.
2. The prime 2 (N.4/two-primary-w-invariant): a = 2, since Q(√−1) contains ζ_4 but not ζ_8; so w_i^{(2)}(Q) = 2 for odd i and 2^{2+v_2(i)} for even i, which is 8 for i = 2.
3. The product is finite (N.4/finiteness-of-the-w-invariant): w_2(Q) = 8 · 3 = 24.

**Dependencies.** `ArithmeticKTheory:N.4/computing-w-from-the-cyclotomic-character`, `ArithmeticKTheory:N.4/two-primary-w-invariant`, `ArithmeticKTheory:N.4/exceptional-fields-at-two`, `ArithmeticKTheory:N.4/finiteness-of-the-w-invariant`, `mathlib:IsCyclotomicExtension.Rat.finrank`.

**Checks.**

- w_2(Q) = 24, w_4(Q) = 240 = 2^4 · 3 · 5, w_6(Q) = 504 = 2^3 · 3^2 · 7, w_8(Q) = 480 = 2^5 · 3 · 5, w_10(Q) = 264 = 2^3 · 3 · 11, w_12(Q) = 65520 = 2^4 · 3^2 · 5 · 7 · 13.
- Cross-check with Lemma VI.2.4: for i = 2k these are the denominators of B_k/4k with the topologists' Bernoulli numbers B_1, …, B_6 = 1/6, 1/30, 1/42, 1/30, 5/66, 691/2730; in particular B_5/20 = 1/264. The source's Example VI.2.1.2 prints w_10 = 1320 = 2^3 · 3 · 5 · 11, contradicting Lemma VI.2.4 and its own rule (5 − 1 = 4 does not divide 10); see source issue.
- w_2(Q) = 24 is not the order 2 of the group of roots of unity of Q.
- SpecialValuesBirchTate B.3 consumes w_2(Q) = 24, with |K_2(Z)| = 2 and ζ_Q(−1) = −1/12 = (−1)^1 · 2/24; this node does not depend on B.3, which lies downstream of N.4.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.1.2, Example 2.1.2 (PDF p. 478; book p. 470). The values for even i; all are correct except w_10, which is 264 (source issue). [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.4, Lemma 2.4 (PDF p. 480; book p. 472). The Bernoulli description used as the cross-check. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2, before Lemma 2.4 (PDF p. 480). The Bernoulli convention and values used in the cross-check. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.6, after Birch-Tate Conjecture 8.6 (PDF p. 523; book p. 515). The value 24 in the Birch-Tate example.

### The exponent criterion for w_i^{(ℓ)}(F)

**Target:** `ArithmeticKTheory:N.4/exponent-criterion`.

Let F be a field, ℓ a prime different from char F, i ∈ Z and ν ≥ 0. Then µ_{ℓ^ν}(i) ⊆ W_i(F) (equivalently, ℓ^ν divides w_i^{(ℓ)}(F) when it is finite) if and only if the Galois group Gal(F(ζ_{ℓ^ν})/F) has exponent dividing i. Hence w_i^{(ℓ)}(F) = max{ℓ^ν : Gal(F(ζ_{ℓ^ν})/F) has exponent dividing i} (K-book Lemma VI.2.2.1). This is the stage's 'cyclotomic-subfield test for divisibility by prime powers': for F = Q it reads ℓ^ν | w_i(Q) if and only if (ℤ/ℓ^ν)^× has exponent dividing i.

**Hypotheses.** ℓ ≠ char F; the lemma holds for ℓ = 2 as well as for odd ℓ. F(ζ_{ℓ^ν}) is the cyclotomic extension of F generated by a primitive ℓ^ν-th root of unity in F^s.

**Proof plan.**

1. µ_{ℓ^ν}(i) is cyclic, generated by a primitive ℓ^ν-th root of unity ζ; it lies in W_i(F) if and only if g acts trivially on ζ for every g ∈ G_F, that is χ(g)^i ≡ 1 (mod ℓ^ν), where χ(g) mod ℓ^ν is modularCyclotomicCharacter(g).
2. G_F maps onto Gal(F(ζ_{ℓ^ν})/F), and Gal(F(ζ_{ℓ^ν})/F) → (ℤ/ℓ^ν)^× is injective (IsPrimitiveRoot.autToPow_injective, identified with the cyclotomic character by IsPrimitiveRoot.autToPow_eq_modularCyclotomicCharacter); so the condition says that every element of Gal(F(ζ_{ℓ^ν})/F) has order dividing i, i.e. its Monoid.exponent divides i.
3. W_i^{(ℓ)}(F) is a subgroup of the ℓ-primary cyclic group ℤ/ℓ^∞(i), hence equal to µ_{ℓ^m}(i) for the largest admissible m, or to all of ℤ/ℓ^∞(i); this is the max formula.
4. The source's proof ends 'has exponent i', which must read 'has exponent dividing i' (source issue).

**Dependencies.** `ArithmeticKTheory:N.4/the-w-invariant`, `mathlib:IsCyclotomicExtension`, `mathlib:modularCyclotomicCharacter`, `mathlib:IsPrimitiveRoot.autToPow_injective`, `mathlib:IsPrimitiveRoot.autToPow_eq_modularCyclotomicCharacter`, `mathlib:Monoid.exponent`.

**Checks.**

- F = Q, ℓ = 3, i = 2: (ℤ/3)^× has exponent 2, which divides 2, and (ℤ/9)^× has exponent 6, which does not; so w_2^{(3)}(Q) = 3.
- F = Q, ℓ = 2, i = 2: (ℤ/8)^× has exponent 2 and (ℤ/16)^× has exponent 4; so w_2^{(2)}(Q) = 8.
- F = Q, ℓ = 5, i = 2: (ℤ/5)^× has exponent 4, which does not divide 2; so 5 does not divide w_2(Q).
- F = F_q, ℓ ∤ q: Gal(F_q(ζ_{ℓ^ν})/F_q) is generated by the Frobenius, of order the order of q modulo ℓ^ν, and the criterion returns the ℓ-part of q^i − 1.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.2.1, Lemma 2.2.1 (PDF p. 479; book p. 471). The criterion. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.2.1, the proof (PDF p. 479). The proof; its last clause has a misprint ('exponent i' for 'exponent dividing i').

### Finiteness of W_i(F) for a number field

**Target:** `ArithmeticKTheory:N.4/finiteness-of-the-w-invariant`.

Let F be a number field and i ≠ 0. Then W_i(F) is finite. More precisely, every W_i^{(ℓ)}(F) is finite, and W_i^{(ℓ)}(F) = 0 whenever ℓ − 1 > |i|·[F : Q]; hence w_i(F) = ∏_{ℓ ≤ |i|[F:Q] + 1} w_i^{(ℓ)}(F) is a positive integer. This is the stage's 'prove finiteness for positive j', for all non-zero j. Positivity is part of the statement: w_i(F) ≥ 1 because W_i(F) is a finite group. SpecialValuesBirchTate B.1 imports this node for the finiteness and positivity of w_2(F) (RT-AREA-ktheory-1/10) and does not re-prove them.

**Hypotheses.** F is a number field (finite over Q) and i ≠ 0. For i = 0, or for F of infinite degree such as Q(µ_{ℓ^∞}), the statement fails.

**Proof plan.**

1. For each ℓ, F(ζ_ℓ) is a number field and so has finitely many roots of unity (Mathlib's finiteness of NumberField.Units.torsion); hence a < ∞, and w_i^{(ℓ)}(F) is finite by Proposition VI.2.2 for odd ℓ and Proposition VI.2.3 for ℓ = 2.
2. Let ℓ be a prime with ℓ − 1 > |i|·[F : Q]. Then [F(ζ_ℓ) : Q] ≥ [Q(ζ_ℓ) : Q] = ℓ − 1 (IsCyclotomicExtension.Rat.finrank) and the tower law (Module.finrank_mul_finrank) give r = [F(ζ_ℓ) : F] ≥ (ℓ − 1)/[F : Q] > |i|, so r does not divide i and ζ_ℓ ∉ F.
3. By the exponent criterion with ν = 1 (Gal(F(ζ_ℓ)/F) is cyclic of order r), ℓ does not divide w_i^{(ℓ)}(F), i.e. W_i^{(ℓ)}(F) = 0.
4. Only finitely many primes remain, each with a finite component, so W_i(F) is finite.

**Dependencies.** `ArithmeticKTheory:N.4/exponent-criterion`, `ArithmeticKTheory:N.4/computing-w-from-the-cyclotomic-character`, `ArithmeticKTheory:N.4/two-primary-w-invariant`, `mathlib:NumberField.Units.torsion`, `mathlib:IsCyclotomicExtension.Rat.finrank`, `mathlib:Module.finrank_mul_finrank`.

**Checks.**

- w_i(Q) involves only primes ℓ ≤ |i| + 1; for example w_12(Q) = 65520 = 2^4 · 3^2 · 5 · 7 · 13, and 13 = 12 + 1.
- W_0(F) = µ(F^s) is infinite.
- For F = Q(µ_{ℓ^∞}), which is not a number field, the ℓ-part of W_i(F) is infinite for every i with r | i.
- F_q is not a number field, but W_i(F_q) is finite of order q^i − 1 for i ≥ 1 (Example VI.2.1.1).

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2, Exercise 2.1 (PDF p. 482; book p. 474). The ℓ-primary finiteness; the vanishing for large ℓ, which the global statement needs, is derived from Proposition 2.2(c) in the proof steps. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.1, Definition 2.1, second half (PDF p. 477). The source writes w_i(F) only for a finite group; this node supplies finiteness for number fields.

### The 2-primary numbers w_i^{(2)}(F) (Proposition VI.2.3)

**Target:** `ArithmeticKTheory:N.4/two-primary-w-invariant`.

Let F be a field of characteristic ≠ 2, a maximal such that F(√−1) contains a primitive 2^a-th root of unity (so a ≥ 2), and i = c2^b with c odd. Then (a) if √−1 ∈ F, w_i^{(2)}(F) = 2^{a+b} for all i; (b) if √−1 ∉ F and i is odd, w_i^{(2)}(F) = 2; (c) if √−1 ∉ F, F is exceptional and i is even, w_i^{(2)}(F) = 2^{a+b}; (d) if √−1 ∉ F, F is non-exceptional and i is even, w_i^{(2)}(F) = 2^{a+b−1}. This is where the description by a single cyclic tower at odd primes stops covering the dyadic cases.

**Hypotheses.** char F ≠ 2; a ≤ ∞, and the values are infinite when a = ∞ (case (b) excepted). In case (c) F has characteristic zero (exceptional fields do).

**Proof plan.**

1. Let G ⊂ ℤ_2^× be the image of G_F under the 2-adic cyclotomic character and H the image of G_{F(√−1)}; as in Proposition VI.2.2, H = 1 + 2^a ℤ_2, and [G : H] = 1 or 2 according as √−1 ∈ F or not.
2. (a): G = 1 + 2^a ℤ_2 and v_2((1 + 2^a)^i − 1) = a + b for a ≥ 2; apply the exponent criterion.
3. (b): √−1 ∉ F gives g ∈ G with g ≡ 3 (mod 4), so g^i ≡ 3 (mod 4) for odd i and only µ_2 is fixed.
4. (c), the source's Exercise VI.2.2: an exceptional F has −1 ∈ G, so G = ±(1 + 2^a ℤ_2), and for even i the condition reduces to (1 + 2^a)^i ≡ 1 (mod 2^ν), i.e. ν ≤ a + b.
5. (d): a non-exceptional F with √−1 ∉ F has G topologically cyclic, generated by some g ≡ 3 (mod 4) with g^2 generating 1 + 2^a ℤ_2, so v_2(g^i − 1) = a + (b − 1) for even i.

**Dependencies.** `ArithmeticKTheory:N.4/the-w-invariant`, `ArithmeticKTheory:N.4/exponent-criterion`, `ArithmeticKTheory:N.4/exceptional-fields-at-two`, `mathlib:cyclotomicCharacter`.

**Checks.**

- Q: exceptional, √−1 ∉ Q and a = 2, so w_i^{(2)}(Q) = 2 for odd i and 2^{2+v_2(i)} for even i: 8 for i = 2, 16 for i = 4.
- Q(√−1): a = 2, so w_i^{(2)} = 4 for odd i and 8 for i = 2.
- Q(√−2): non-exceptional with a = 3 (Q(√−2, √−1) = Q(ζ_8)), so w_2^{(2)}(Q(√−2)) = 2^{3+1−1} = 8; case (c) would wrongly give 16.
- Q(√2): real, hence exceptional, with a = 3, so w_2^{(2)}(Q(√2)) = 16 and w_2(Q(√2)) = 48.
- F_3 (characteristic 3, non-exceptional): a = 3 because F_9 ⊃ µ_8, so w_2^{(2)}(F_3) = 8, the 2-part of 3^2 − 1.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.3, Proposition 2.3 (PDF p. 479; book p. 471). The proposition and case (a). [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.3, Proposition 2.3 (PDF p. 479). Cases (b)–(d). [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.3, after the proposition (PDF p. 479). The source's proof, which leaves (c) to an exercise. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2, Exercise 2.2 (PDF p. 483; book p. 475). The exercise proving (c), with its hint.

## N.5 — Odd groups, natural edges and integral extensions

For j≥2 the natural localization map K_(2j−1)(O_(F,S))→K_(2j−1)(F) is an isomorphism. Totally imaginary fields have abstract group Z^r2⊕Z/w_j(F). With real places, n modulo 8 gives respectively Z^(r1+r2)⊕Z/w_j in residue 1; Z^r2⊕Z/(2w_j)⊕(Z/2)^(r1−1) in residue 3; Z^(r1+r2)⊕Z/(w_j/2) in residue 5; and Z^r2⊕Z/w_j in residue 7. Prove w_j even where division by two occurs. These are abstract splittings. The e-invariant, Bockstein, Chern torsion edge and their kernels/cokernels keep their natural maps and extension classes. The subsequent six-node refinement supplies the diagonal extension normal form and edge normalization; M.7’s named Suslin-real computation fixes the dyadic differentials. Real KO/BO remains an exact supplier request.

### The odd K-groups of a totally imaginary field (Theorem VI.8.4, odd rows; Theorem VI.9.5(a))

**Target:** `ArithmeticKTheory:N.5/totally-imaginary-integral-structure`.

**Planet:** Odd K-groups of totally imaginary fields.

Let F be a totally imaginary number field (no real place) with r_2 complex places and O_S the ring of S-integers for a finite set S of finite places. For every n = 2i − 1 ≥ 3, K_n(O_S) ≅ K_n(F) ≅ ℤ^{r_2} ⊕ ℤ/w_i(F), where w_i(F) is the order of W_i(F) = H^0(F; ℚ/ℤ(i)) of N.4. The torsion subgroup is cyclic of order w_i(F), its ℓ-primary part being identified with W_i(F){ℓ} for every prime ℓ including ℓ = 2 (N.5/odd-torsion-at-a-prime-where-cd-is-two, available at 2 because F has no real place); the free summand is not canonical. The theorem covers exceptional totally imaginary fields such as ℚ(√−7). The other rows of Theorem VI.8.4 are owned elsewhere: n = 0 and n = 1 by N.1 (K_0 = ℤ ⊕ Pic(O_S), K_1 = O_S^× ≅ ℤ^{r_2+|S|−1} ⊕ μ(F) with μ(F) cyclic of order w_1(F)), and n = 2i ≥ 2 by N.6/even-groups-of-a-totally-imaginary-field, which N.5 cannot import because N.6 lies downstream of N.5.

**Hypotheses.** F is a number field with NumberField.IsTotallyComplex F, equivalently nrRealPlaces F = 0 (mathlib:NumberField.nrRealPlaces_eq_zero_iff); r_2 = nrComplexPlaces F. S is a finite set of finite places; for odd n ≥ 3 the group does not depend on S (N.5/soule-theorem). n = 2i − 1 ≥ 3, that is i ≥ 2.

**Proof plan.**

1. K_n(O_S) ≅ K_n(F) for odd n ≥ 3 (N.5/soule-theorem).
2. K_n(O_S) is finitely generated of rank r_2: for r_1 = 0 both classes n ≡ 1 and n ≡ 3 (mod 4) of N.3/finiteness-and-ranks-combined give r_2. By the structure theorem (mathlib:AddCommGroup.equiv_free_prod_directSum_zmod) K_n(O_S) ≅ ℤ^{r_2} ⊕ T with T finite.
3. T = ⊕_ℓ T{ℓ} and T{ℓ} ≅ ℤ/w_i^{(ℓ)}(F) for every prime ℓ by N.5/odd-torsion-at-a-prime-where-cd-is-two, whose hypothesis at ℓ = 2 holds because F is totally imaginary.
4. w_i(F) = ∏_ℓ w_i^{(ℓ)}(F) (N.4/the-w-invariant), so ⊕_ℓ ℤ/w_i^{(ℓ)}(F) ≅ ℤ/w_i(F) by the Chinese remainder theorem.

**Dependencies.** `ArithmeticKTheory:N.5/soule-theorem`, `ArithmeticKTheory:N.5/odd-torsion-at-a-prime-where-cd-is-two`, `ArithmeticKTheory:N.3/finiteness-and-ranks-combined`, `ArithmeticKTheory:N.4/the-w-invariant`, `mathlib:NumberField.IsTotallyComplex`, `mathlib:NumberField.nrRealPlaces_eq_zero_iff`, `mathlib:NumberField.InfinitePlace.nrComplexPlaces`, `mathlib:AddCommGroup.equiv_free_prod_directSum_zmod`.

**Checks.**

- K_3(ℤ[i]) ≅ ℤ ⊕ ℤ/24, K_7(ℤ[i]) ≅ ℤ ⊕ ℤ/240 and K_{4k+1}(ℤ[i]) ≅ ℤ ⊕ ℤ/4 for k > 0 (Exercise VI.8.5): r_2 = 1, w_2(ℚ(i)) = w_2(ℚ) = 24, w_4 = 240 and w_i(ℚ(i)) = 4 for odd i (Example VI.2.1.2).
- Exceptional totally imaginary fields such as ℚ(√−7) are covered; no non-exceptionality hypothesis is used.
- This is not the real-embedding table read at r_1 = 0: for ℚ(i) and n = 3 the torsion is ℤ/24 = ℤ/w_2, not ℤ/2w_2, and for n = 5 it is ℤ/4 = ℤ/w_3, not ℤ/(w_3/2).

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.4, Theorem 8.4 (PDF p. 522; book p. 514). Theorem 8.4; this node states its odd row n = 2i − 1 ≥ 3, the rows n = 0, 1 being N.1's and the row n = 2i ≥ 2 N.6's. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.4, proof (PDF p. 522; book p. 514). The proof: ranks from the classical data, torsion from Theorem 8.2 (proof steps 2 and 3). [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.4, the sentence before the theorem (PDF p. 522; book p. 514). The scope of the theorem, which includes exceptional totally imaginary fields. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.5, Theorem 9.5, opening and part (a) (PDF p. 527; book p. 519). The same row restated as Theorem 9.5(a), with K_n(O_S) ≅ K_n(F). [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI, Exercise 8.5 (PDF p. 524; book p. 516). The worked instances used in the acceptance.

### The odd K-groups of a number field with a real embedding (Theorem VI.9.5(b))

**Target:** `ArithmeticKTheory:N.5/the-real-case-modulo-eight`.

**Planet:** Odd K-groups of real number fields.

Let F be a number field with r_1 > 0 real embeddings and r_2 complex places, and O_S a ring of S-integers in F. For each odd n ≥ 3, with i = (n + 1)/2, K_n(O_S) ≅ K_n(F) and K_n(F) ≅ ℤ^{r_1+r_2} ⊕ ℤ/w_i(F) for n ≡ 1 (mod 8); ℤ^{r_2} ⊕ ℤ/2w_i(F) ⊕ (ℤ/2)^{r_1−1} for n ≡ 3 (mod 8); ℤ^{r_1+r_2} ⊕ ℤ/(w_i(F)/2) for n ≡ 5 (mod 8); ℤ^{r_2} ⊕ ℤ/w_i(F) for n ≡ 7 (mod 8). In the class n ≡ 5 (mod 8) the index i is odd, so w_i^{(2)}(F) = 2 and w_i(F)/2 is an odd integer: K_n(F) has no two-primary torsion. These groups are determined by r_1, r_2 and w_i(F). The direct-sum decompositions are of abstract groups and are not natural; what is natural is the identification of the ℓ-primary torsion through the comparison maps (N.5/odd-torsion-at-a-prime-where-cd-is-two for ℓ odd, and for ℓ = 2 the ℚ_2/ℤ_2-coefficient computation of MotivicEtaleKTheory M.7, Theorem VI.9.4, induced by the morphism to the real places), including the non-split extension that produces ℤ/2w_i(F) ⊕ (ℤ/2)^{r_1−1}.

**Hypotheses.** r_1 = nrRealPlaces F > 0. The hypothesis is essential: for a totally imaginary field the classes n ≡ 3 and n ≡ 5 (mod 8) have torsion ℤ/w_i(F) (N.5/totally-imaginary-integral-structure), and (ℤ/2)^{r_1−1} is undefined for r_1 = 0. O_S is any ring of S-integers; since n is odd, K_n(O_S) ≅ K_n(F) ≅ K_n(O_S[1/2]) (N.5/soule-theorem), so one may assume 1/2 ∈ O_S, which Theorem VI.9.4 requires. w_i(F) = ∏_ℓ w_i^{(ℓ)}(F). Every real number field is exceptional and does not contain √−1, so w_i^{(2)}(F) = 2 for odd i (Proposition VI.2.3(b), N.4/exceptional-fields-at-two). The dyadic calculation is MotivicEtaleKTheory M.7's and is imported, not repeated (RT-AREA-ktheory-1/3): Theorem VI.9.4 with Lemma VI.9.3, the spectral sequences of ℝ (Theorem VI.9.1, Variant VI.9.1.2), whose differentials M.7 fixes from Suslin's K_n(ℝ; ℤ/m) ≅ π_n(BO; ℤ/m) for n ≥ 1 (K-book VI.3.1) and real topological K-theory, and the real-place maps α^n_S(i) with the extension data they detect. This node uses only that output: the groups K_{n+1}(R; ℚ_2/ℤ_2), the maps to ⊕_{real} K_*(ℝ; ℚ_2/ℤ_2) and the extensions, and performs no second spectral-sequence computation.

**Proof plan.**

1. Use M.7’s named Suslin-real and real-place spectral-sequence comparisons to determine the dyadic differentials and extensions; its nontrivial extension produces 2w_j in residue three. Combine with the odd-primary calculation and finite generation/ranks. In residue five retain the factor w_j/2 and prove its divisibility; abstract splittings are not natural e-invariant maps. The N.5 follow-up supplies the extension normal form and edge comparison, with G-Coefficient and G-ChernBoundary explicitly open.

**Dependencies.** `ArithmeticKTheory:N.5/soule-theorem`, `ArithmeticKTheory:N.3:ranks/borel-rank-theorem`, `ArithmeticKTheory:N.4/the-w-invariant`, `MotivicEtaleKTheory:M.7/suslin-real-comparison`, `MotivicEtaleKTheory:M.7/real-place-correction`, `MotivicEtaleKTheory:M.7/dyadic-s-integer-extensions`.

**Checks.**

- K_3(ℤ) ≅ ℤ/48 = ℤ/2w_2(ℚ) (r_1 = 1, r_2 = 0, (ℤ/2)^0 = 0), the value of Lee and Szczarba quoted in Example VI.2.1.2.
- K_5(ℚ) ≅ ℤ since w_3(ℚ) = 2 (Example VI.9.5.1); K_7(ℤ) ≅ ℤ/240 = ℤ/w_4(ℚ); K_9(ℤ) ≅ ℤ ⊕ ℤ/2 since w_5(ℚ) = 2.
- F = ℚ(√2), r_1 = 2, r_2 = 0, n = 3: w_2(F) = 48 (two-primary part 2^{a+b} = 2^{3+1} = 16 by Proposition VI.2.3(c) with a = 3 because F(√−1) = ℚ(ζ_8), three-part 3 by Proposition VI.2.2, and no other prime), so K_3(ℤ[√2]) ≅ ℤ/96 ⊕ ℤ/2.
- The hypothesis r_1 > 0 cannot be dropped: for ℚ(i) the classes n = 3 and n = 5 give ℤ ⊕ ℤ/24 and ℤ ⊕ ℤ/4 (Exercise VI.8.5), not ℤ ⊕ ℤ/48 ⊕ (ℤ/2)^{−1} and ℤ ⊕ ℤ/2.
- Matching orders is not a proof: ℤ/2w_i ⊕ (ℤ/2)^{r_1−1} and ℤ/2^{r_1}w_i have the same order; the proof identifies the torsion through the comparison maps of N.5/odd-torsion-at-a-prime-where-cd-is-two and MotivicEtaleKTheory M.7.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.5, Theorem 9.5, opening and part (a) (PDF p. 527; book p. 519). The opening of Theorem 9.5, with K_n(O_S) ≅ K_n(F). [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.5, Theorem 9.5(b) (PDF p. 527; book p. 519). The four rows modulo eight, which this node states. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.5, the remark after the theorem (PDF p. 527; book p. 519). What the groups are determined by; the abstract groups, not the maps. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.5, proof (PDF p. 528; book p. 520). The proof: odd torsion from Theorem 8.2, two-primary torsion from Theorem 9.4 through universal coefficients (proof steps 3 and 4). [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.5.1, Example 9.5.1 (PDF p. 528; book p. 520). The divisibility in the class n ≡ 5 (mod 8): w_i(F)/2 is odd. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.3, Proposition 2.3(b) and the remark after it (PDF p. 479; book p. 471). w_i^{(2)}(F) = 2 for odd i when √−1 ∉ F, and every real number field is exceptional. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.1.2, Example 2.1.2, second paragraph (PDF p. 478; book p. 470). The value K_3(ℤ) ≅ ℤ/48 used in the acceptance.

### Soulé's theorem: the K-groups of the S-integers and of the field agree in odd degrees

**Target:** `ArithmeticKTheory:N.5/soule-theorem`.

**Planet:** Soulé's theorem.

Let F be a number field, S a finite set of nonzero primes of 𝓞_F and R = O_{F,S}. Then K_n(R) → K_n(F) is an isomorphism for every odd n ≥ 3, and for every even n ≥ 2 the localisation sequence breaks up into short exact sequences 0 → K_n(R) → K_n(F) → ⊕_{𝔭∉S} K_{n−1}(k(𝔭)) → 0; equivalently SK_n(R) := ker(K_n(R) → K_n(F)) = 0 for all n ≥ 1. This is an additional theorem, not a consequence of exactness. The source states it for every Dedekind domain whose fraction field is a global field; this node states the case of rings of S-integers of number fields, which is the roadmap's.

**Hypotheses.** F is a number field and S finite. The function-field case needs Bass–Milnor–Serre's Variant III.2.5.1 and Quillen's theorem for affine curves over finite fields, which KTheoryLowDegrees U.4 (number fields only) does not supply. For Dedekind domains not of finite type, such as ℤ_(p), the source's proof cites IV.6.9 outside its hypotheses (K₁(ℤ_(p)) = ℤ_(p)^× is not finitely generated); the statement follows there by a filtered colimit over rings of S-integers (sourceIssues). The node lives in N.5, whose text asks for it ('Prove K_{2j−1}(O_{F,S}) ≅ K_{2j−1}(F) for j≥2'): its proof uses N.3:finite-generation, and a proof in N.2 would close the stage cycle N.2 → N.3:finite-generation → N.2.

**Proof plan.**

1. Reduction: if SK_n(R) = 0 for all n ≥ 1, the maps ⊕ K_n(k(𝔭)) → K_n(R) vanish and (6.6) breaks into 0 → K_n(R) → K_n(F) → ⊕ K_{n−1}(k(𝔭)) → 0; for odd n ≥ 3 the right-hand term is 0 (n − 1 even, L.1), so K_n(R) ≅ K_n(F).
2. n = 1: SK₁(O_{F,S}) = 0, Bass–Milnor–Serre (U.4).
3. n even: N.2/even-degree-injectivity.
4. n = 2i − 1 ≥ 3: SK_n(R) is the image of the torsion group ⊕ K_n(k(𝔭)) and K_n(R) is finitely generated (N.3:finite-generation), so SK_n(R) is finite; choose ℓ annihilating the torsion of K_n(R), so that SK_n(R) injects into K_n(R)/ℓ ⊆ K_n(R; ℤ/ℓ).
5. K_n(R; ℤ/ℓ) → K_n(F; ℤ/ℓ) is injective for odd n: by the mod-ℓ localisation sequence this is the surjectivity of ∂ in N.5/soule-mod-l-surjectivity.
6. SK_n(R) maps to 0 in K_n(F), hence in K_n(F; ℤ/ℓ), so it is 0.

**Dependencies.** `ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain`, `ArithmeticKTheory:N.2/even-degree-injectivity`, `ArithmeticKTheory:N.3:finite-generation/finite-generation-of-K-of-S-integers`, `ArithmeticKTheory:N.5/soule-mod-l-surjectivity`, `KTheoryLowDegrees:U.4`, `KTheoryFiniteLocalFields:L.1`.

**Checks.**

- n = 2: 0 → K₂(O_{F,S}) → K₂(F) → ⊕_{𝔭∉S} k(𝔭)^× → 0, which K2SymbolsBrauer T.5 proves directly from K₂(𝔽_q) = 0 and SK₁ = 0; the two must agree.
- The corresponding statement in degree zero is false: ker(K₀(R) → K₀(F)) = Pic(R), ≅ ℤ/2 for 𝓞 of ℚ(√−5).
- Both O_F and O_{F,S} have the odd K-groups of F in degrees ≥ 3, so K_n(O_F) ≅ K_n(O_{F,S}) there.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.8 (PDF p. 420; book p. 412). The theorem, in the source's generality. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.8, proof (PDF p. 420; book p. 412). The reduction and the degree-one case. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.8, proof (PDF p. 420; book p. 412). The odd-degree argument.

### Soulé's surjectivity of the boundary with finite coefficients

**Target:** `ArithmeticKTheory:N.5/soule-mod-l-surjectivity`.

Let F be a number field, S a finite set of nonzero primes and R = O_{F,S} (the source: any Dedekind domain whose fraction field is a global field). For every ℓ ≥ 2 and every even n ≥ 2 the boundary ∂ : K_n(F; ℤ/ℓ) → ⊕_𝔭 K_{n−1}(R/𝔭; ℤ/ℓ) of the localisation sequence with ℤ/ℓ coefficients is onto; equivalently K_{n−1}(R; ℤ/ℓ) → K_{n−1}(F; ℤ/ℓ) is injective.

**Hypotheses.** Import L.1’s finite-coefficient objects, Bott elements and safe-modulus products, together with the coefficient localization and boundary projection formula requested from K.7 in R-K7-coefficients. No ring structure on the mod-3 Moore spectrum is assumed. The analogue for n = 1 fails exactly when Pic(R)/ℓ ≠ 0 (the source says it is false; sourceIssues).

**Proof plan.**

1. By the Chinese remainder decomposition reduce to a prime-power modulus m. Choose a higher prime power M divisible by m with the safe product supplied by L.1 (at 3 take M≥9, at 2 take M≥16). Prove surjectivity at M. In every residue field k, K_(2i−1)(k;Z/m)=K_(2i−1)(k)/m since the preceding positive even K-group vanishes, and K_0(k) is torsion-free when i=1. The quotient reduction from M to m is onto; naturality of the localization boundary descends surjectivity to m.
2. For n=2 the coefficient sequence, determinant K_1(R)=R× and K_0(R)=Z⊕Pic(R) identify K_1(R;Z/M) with the Kummer group of elements of F× having valuations divisible by M outside S, modulo M-th powers. This embeds in F×/M=K_1(F;Z/M); exactness gives boundary surjectivity. Use IV.2.3 and the low-degree localization maps, rather than asserting that R×/M is all of K_1(R;Z/M).
3. For n=2i after adjoining ζ_M, finite-field Bott periodicity makes multiplication by β^(i−1) onto the residue sum from its K_1/M row (residue characteristics dividing M contribute zero). Lift that row by n=2 and apply K.7’s boundary projection formula at the safe modulus M.
4. For general F use its cyclotomic extension F(ζ_M), the integral closure of R, and the natural transfer square of coefficient localization sequences. Each residue has a prime above it and the finite-field transfer in positive odd degree is onto. Descend the lifted finite-support class by transfer, then reduce from M to m as in the first step.

**Dependencies.** `ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain`, `ArithmeticKTheory:N.2/localisation-sequence-and-finite-extensions`, `KTheoryFiniteLocalFields:L.1`, `ArithmeticKTheory:N.1/S-integers-in-a-finite-extension`, `KTheoryFiniteLocalFields:L.1/k-theory-mod-m`, `KTheoryFiniteLocalFields:L.1/bott-element`, `GeneralAlgebraicKTheory:K.7`, `ArithmeticKTheory:N.1/K1-of-S-integers-and-the-determinant`.

**Checks.**

- n = 2, R = ℤ: ∂ : K₂(ℚ; ℤ/ℓ) → ⊕_p 𝔽_p^×/ℓ is onto.
- The statement is about coefficients: the integral boundary K_n(F) → ⊕ K_{n−1}(R/𝔭) is onto for even n by N.5/soule-theorem, whose proof uses this node.
- For n = 1 and R = 𝓞 of ℚ(√−5), ℓ = 2, the analogous map K₁(F; ℤ/2) → ⊕ ℤ/2 is not onto, its cokernel being Pic(R)/2 ≅ ℤ/2.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.8.1 (PDF p. 420; book p. 412). The proposition. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.8.1, proof (PDF p. 421; book p. 413). The first reduction. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.8.1, proof (PDF p. 421; book p. 413). The passage to F(ζ_ℓ).

### The e-invariant

**Target:** `ArithmeticKTheory:N.5/e-invariant`.

For a field F with separable closure F^s, G = Gal(F^s/F), and i ≥ 1, the e-invariant is the natural map e : K_{2i−1}(F)_tors → K_{2i−1}(F^s)^G_tors ≅ µ(i)^G = W_i(F) induced by F → F^s; it is defined because K_*(F) → K_*(F^s) is G-equivariant with G acting trivially on K_*(F), and the identification of K_{2i−1}(F^s)_tors with µ(i) as a G-module is Suslin's (K-book Proposition VI.1.7.1 and Exercise VI.1.1). Its ℓ-primary component is e^{(ℓ)} : K_{2i−1}(F){ℓ} → W_i^{(ℓ)}(F). For a ring of S-integers it is composed with K_{2i−1}(𝓞_{F,S}) → K_{2i−1}(F). The e-invariant is natural in F.

**Hypotheses.** F is a field and i ≥ 1; the arithmetic cases are number fields and their rings of S-integers. The G-isomorphism K_{2i−1}(F^s)_tors ≅ µ(i) is imported; see the gap on its owner. This node belongs to N.5, not N.4: N.4's stage text defines W_j(F) without K-theory, while N.5's text requires 'the e-invariant/Chern maps, their kernels and the extension classes used to obtain them' to be natural.

**Proof plan.**

1. Functoriality of K-theory along F → F^s and along the automorphisms of F^s (GeneralAlgebraicKTheory K.1) makes K_{2i−1}(F) → K_{2i−1}(F^s)^G well defined, and it preserves torsion.
2. Import the G-isomorphism K_{2i−1}(F^s)_tors ≅ µ(i) (Proposition VI.1.7.1, through the rigidity theorems of MotivicEtaleKTheory M.7).
3. Compose with µ(i)^G = W_i(F) (N.4/the-w-invariant).
4. Naturality: for E/F finite separable, e_E composed with K_{2i−1}(F) → K_{2i−1}(E) equals the restriction W_i(F) → W_i(E) composed with e_F.

**Dependencies.** `ArithmeticKTheory:N.4/the-w-invariant`, `MotivicEtaleKTheory:M.7`, `GeneralAlgebraicKTheory:K.1`.

**Uses.** N.5/harris-segal-summand (K-book Theorem VI.2.5): the Harris-Segal summand is the one on which e is an isomorphism. N.5/the-real-case-modulo-eight and N.6/the-two-primary-corrections: the stage text requires the e-invariant and the Chern maps to be natural; the natural identifications are imported from MotivicEtaleKTheory M.7 and M.8, and the tables are proved through them.

**API.**

- `TauCeti.eInvariant` (data): e : K_{2i−1}(F)_tors →+ W_i(F), for i ≥ 1.
- `TauCeti.eInvariant.primary` (projection): Its ℓ-primary component K_{2i−1}(F){ℓ} →+ W_i^{(ℓ)}(F).
- `TauCeti.eInvariant_natural` (functoriality): For E/F finite separable, e_E ∘ K_{2i−1}(F → E) = WInvariant.res ∘ e_F.
- `TauCeti.eInvariant_one` (compatibility): For i = 1, under K_1(F) = F^×, e is the identity of µ(F) = W_1(F).
- `TauCeti.eInvariant_finiteField_bijective` (example): For F_q, e : K_{2i−1}(F_q) → W_i(F_q) is a bijection.

**Unit tests.**

- `TauCeti.eInvariant_finiteField_bijective`: For F_q and i ≥ 1, e : K_{2i−1}(F_q) ≅ Z/(q^i − 1) → W_i(F_q) ≅ Z/(q^i − 1) is an isomorphism.
- `TauCeti.eInvariant_rat_three_not_injective`: For Q and i = 2, K_3(Q) ≅ Z/48 and W_2(Q) ≅ Z/24, so e is not injective; it kills the symbol {−1, −1, −1} (Remark VI.2.1.3).
- `TauCeti.eInvariant_sepClosed`: If F is separably closed, G is trivial and e is the identification K_{2i−1}(F)_tors ≅ µ(i).
- `TauCeti.eInvariant_one`: For i = 1, e : µ(F) = K_1(F)_tors → W_1(F) = µ(F) is the identity.

**Checks.**

- For F_q, e is an isomorphism K_{2i−1}(F_q) ≅ Z/(q^i − 1) (Example VI.2.1.1).
- For Q and i = 2, e : K_3(Q) ≅ Z/48 → W_2(Q) ≅ Z/24 is not injective (Example VI.2.1.2).

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.1, Definition 2.1, first half (PDF p. 477; book p. 469). The definition. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.1.7.1 (PDF p. 476; book p. 468). The identification the definition uses. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.1.2 (PDF p. 478). The non-injectivity for Q.

### The Harris–Segal summand

**Target:** `ArithmeticKTheory:N.5/harris-segal-summand`.

**Planet:** Harris–Segal summand.

Let F be a number field, ℓ a prime and i ≥ 1; if ℓ = 2 assume F non-exceptional. Put w = w_i^{(ℓ)}(F). Then K_{2i−1}(F) has a direct summand isomorphic to Z/w on which the e-invariant is an isomorphism onto W_i^{(ℓ)}(F), and so has K_{2i−1}(𝓞_{F,S}) for every finite S. For an exceptional F at ℓ = 2 only the weaker Remark VI.2.5.1 is available: a cyclic summand of order w_i(F), 2w_i(F) or w_i(F)/2; for real number fields Theorem VI.2.6 (extracted from Theorem VI.9.5, N.5/the-real-case-modulo-eight) says which.

**Hypotheses.** F is a number field. The source states the theorem for any field with 1/ℓ ∈ F and for integrally closed domains with fraction field F, but its proof reduces to subrings of cyclotomic fields and so covers characteristic zero only; this node is restricted to number fields and their rings of S-integers. At ℓ = 2, F is non-exceptional (N.4/exceptional-fields-at-two); every real number field is exceptional and is excluded.

**Proof plan.**

1. Case ζ_ℓ ∈ F (ζ_4 ∈ F if ℓ = 2): with m = ℓ^a the number of ℓ-primary roots of unity in F, w_i^{(ℓ)}(Q(ζ_m)) = w (Propositions VI.2.2 and VI.2.3), which reduces the claim to R = Z[ζ_m].
2. Choose a prime p ≢ 1 (mod ℓ^{a+1}) and 𝔭 over p; the residue field is F_q = F_p(ζ_m) with w_i^{(ℓ)}(F_q) = w, and for the local field E = Q_p(ζ_m) the e-invariant K_{2i−1}(E){ℓ} → Z/w is an isomorphism (Example VI.2.3.1 and Exercise VI.1.3; KTheoryFiniteLocalFields L.2).
3. By Corollary VI.1.5.2 (Harris and Segal's theorem, quoted as Theorem VI.1.5, together with Soulé's K_{2i−1}(Z[ζ_m]) ≅ K_{2i−1}(Q(ζ_m)), N.2), K_{2i−1}(R) has a cyclic summand A of order w mapping isomorphically onto the ℓ-part of K_{2i−1}(F_q) (KTheoryFiniteLocalFields L.1); hence A ≅ K_{2i−1}(E){ℓ} and e is an isomorphism on A.
4. Case ζ_ℓ ∉ F: reduce (Exercise VI.2.5) to F ⊂ Q(ζ_m) = F(ζ_ℓ) with r = [Q(ζ_m) : F] dividing i; for the transfer f_* along the Galois extension (N.1/norms-transfers-and-pullbacks), f^* f_* is multiplication by r on the Galois-fixed summand A, so f_*(A) is a summand of K_{2i−1}(R) on which e is an isomorphism.
5. Case ℓ = 2, F non-exceptional and √−1 ∉ F: F has index 2 in Q(ζ_m) = F(√−1), w_i^{(2)}(Q(ζ_m)) = 2w, and the image under f_* of the summand of order 2w is a summand of order w (the source's diagram).
6. Harris and Segal's theorem on K_*(B(µ_m ≀ Σ_∞)^+) is quoted by the source, not proved; see the gap.

**Dependencies.** `ArithmeticKTheory:N.5/e-invariant`, `ArithmeticKTheory:N.4/computing-w-from-the-cyclotomic-character`, `ArithmeticKTheory:N.4/two-primary-w-invariant`, `ArithmeticKTheory:N.4/exceptional-fields-at-two`, `ArithmeticKTheory:N.5/soule-theorem`, `ArithmeticKTheory:N.1/norms-transfers-and-pullbacks`, `KTheoryFiniteLocalFields:L.1`, `KTheoryFiniteLocalFields:L.2`.

**Checks.**

- For Q, ℓ = 3 and i = 2, K_3(Q) ≅ Z/48 has a summand Z/3 detected by e (w_2^{(3)}(Q) = 3).
- For Q(√−1) and i = 2 (non-exceptional, √−1 ∈ F), K_3(Q(√−1)) has summands Z/8 (ℓ = 2) and Z/3 (ℓ = 3), together Z/24 = Z/w_2(Q(√−1)), in agreement with K_3(Q(i)) ≅ Z ⊕ Z/24 in N.8.
- For Q at ℓ = 2 the theorem does not apply (Q is exceptional); there the Harris-Segal summand of K_3(Q) ≅ Z/48 is Z/2w_2(Q) (Theorem VI.2.6(2), i ≡ 2 (mod 4)).

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.5, Harris-Segal Theorem 2.5 (PDF p. 481; book p. 473). The theorem for the field. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.5, Harris-Segal Theorem 2.5, continued (PDF p. 481). The ring form. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.5, the proof (PDF p. 481). The first reduction of the proof. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.1.5.2 (PDF p. 475; book p. 467). The input from Harris and Segal's theorem. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.5.1, Remark 2.5.1 (PDF p. 482; book p. 474). The exceptional case. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.6, Theorem 2.6 (PDF p. 482). The orders for real number fields (display flattened, the 'i.e.' clauses elided).

### The odd K-groups at a prime where the cohomological dimension is two (Theorem VI.8.2, odd rows)

**Target:** `ArithmeticKTheory:N.5/odd-torsion-at-a-prime-where-cd-is-two`.

Let F be a number field with r_1 real and r_2 complex places, O_S a ring of S-integers in F, and ℓ a prime; if ℓ = 2 suppose F totally imaginary. For every n = 2i − 1 ≥ 3 the localisation of K_n(O_S) at ℓ is K_n(O_S)_(ℓ) ≅ ℤ_(ℓ)^{r_2} ⊕ ℤ/w_i^{(ℓ)}(F) when i is even and ℤ_(ℓ)^{r_1+r_2} ⊕ ℤ/w_i^{(ℓ)}(F) when i is odd. Equivalently the ℓ-primary torsion K_n(O_S){ℓ} is cyclic of order w_i^{(ℓ)}(F), and it is identified with H^0_et(O_S[1/ℓ]; ℚ_ℓ/ℤ_ℓ(i)) = W_i(F){ℓ} through K_{2i−1}(R){ℓ} ≅ K_{2i}(R; ℚ_ℓ/ℤ_ℓ) ≅ H^0(R; ℚ_ℓ/ℤ_ℓ(i)), R = O_S[1/ℓ]; these identifications are induced by the comparison maps of MotivicEtaleKTheory M.7 through its coefficient-compatible early descent edge and are natural for O_S ⊂ O_{S'}. The free summand is not canonical.

**Hypotheses.** ℓ is any prime; for ℓ = 2 the field is totally imaginary. This is exactly the case in which the étale ℓ-cohomological dimension of O_S[1/ℓ] is two: for ℓ odd it is two for every number field, for ℓ = 2 it is two unless F has a real embedding (source, proof of VI.8.2). n = 2i − 1 ≥ 3; the ranks are Borel's (N.3); degree one is N.1's S-unit group and is not covered. w_i^{(ℓ)}(F) is the order of W_i(F){ℓ} = H^0(F; ℚ_ℓ/ℤ_ℓ(i)), finite for i ≥ 1 (N.4/the-w-invariant).

**Proof plan.**

1. Set R = O_S[1/ℓ]. For each prime 𝔭 of O_S over ℓ the groups K_m(O_S/𝔭), m ≥ 1, are finite of order prime to ℓ (Quillen's computation, KTheoryFiniteLocalFields L.1: K_{2j}(𝔽_q) = 0 and K_{2j−1}(𝔽_q) ≅ ℤ/(q^j − 1) with q a power of ℓ), so the localisation sequence of N.2/localisation-sequence-for-a-dedekind-domain for O_S ⊂ R gives K_n(O_S)_(ℓ) ≅ K_n(R)_(ℓ). (The source writes K_{n−1}(R/𝔭); R/𝔭 = 0, and the residue field meant is O_S/𝔭.)
2. K_n(R) is finitely generated of the rank of N.3/finiteness-and-ranks-combined, and K_{n+1}(R) is finite; by the universal coefficient sequence for ℚ_ℓ/ℤ_ℓ coefficients (StableHomotopyKTheory H.6; the source's Ex. IV.2.6) K_n(R){ℓ} ≅ K_{n+1}(R; ℚ_ℓ/ℤ_ℓ).
3. Import from MotivicEtaleKTheory M.7: since the ℓ-cohomological dimension of R is two and H^2(R; ℚ_ℓ/ℤ_ℓ(i)) = 0 (source Ex. VI.8.1), the descent spectral sequence with ℚ_ℓ/ℤ_ℓ coefficients has one nonzero term in each total degree and K_{2i}(R; ℚ_ℓ/ℤ_ℓ) ≅ H^0(R; ℚ_ℓ/ℤ_ℓ(i)) for i ≥ 1, naturally in R.
4. H^0(R; ℚ_ℓ/ℤ_ℓ(i)) = H^0(F; ℚ_ℓ/ℤ_ℓ(i)) is cyclic of order w_i^{(ℓ)}(F) (N.4/the-w-invariant). Combine with the rank and the structure theorem for finitely generated abelian groups (mathlib:AddCommGroup.equiv_free_prod_directSum_zmod) after localising at ℓ.

**Dependencies.** `ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain`, `KTheoryFiniteLocalFields:L.1`, `ArithmeticKTheory:N.3/finiteness-and-ranks-combined`, `StableHomotopyKTheory:H.6`, `MotivicEtaleKTheory:M.7`, `ArithmeticKTheory:N.4/the-w-invariant`, `mathlib:AddCommGroup.equiv_free_prod_directSum_zmod`.

**Checks.**

- F = ℚ, ℓ odd, n = 3: K_3(ℤ){ℓ} ≅ ℤ/w_2^{(ℓ)}(ℚ), which is ℤ/3 for ℓ = 3 and 0 for ℓ ≥ 5, since w_2(ℚ) = 24 = 8 · 3 (Example VI.2.1.2); this is the odd part of K_3(ℤ) ≅ ℤ/48.
- F = ℚ(i), ℓ = 2, n = 3: K_3(ℤ[i]){2} ≅ ℤ/8, since w_2(ℚ(i)) = w_2(ℚ) = 24 (Example VI.2.1.2), in agreement with K_3(ℤ[i]) ≅ ℤ ⊕ ℤ/24 (Exercise VI.8.5).
- The hypothesis at ℓ = 2 cannot be dropped: K_3(ℤ){2} ≅ ℤ/16 (Corollary VI.9.8), while w_2^{(2)}(ℚ) = 8.
- The rank depends on the parity of i: for F = ℚ, K_5(ℤ) has rank one (i = 3 odd, r_1 + r_2 = 1) and K_3(ℤ), K_7(ℤ) have rank zero (r_2 = 0).

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.2, Theorem 8.2, the odd rows (PDF p. 521; book p. 513). The odd rows of Theorem 8.2 with its hypothesis at the prime two, which this node states. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.2, proof, first paragraph (PDF p. 521; book p. 513). The reduction from O_S to O_S[1/ℓ] through the localisation sequence and Quillen's finite-field computation (proof step 1; the printed R/p is the misprint recorded in sourceIssues). [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.2, proof, second paragraph (PDF p. 521; book p. 513). Why the hypothesis at two is the cohomological-dimension hypothesis. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.2, proof, end of second paragraph (PDF p. 521; book p. 513). The identification of the ℓ-primary torsion of K_{2i−1}(R) with H^0(R; ℚ_ℓ/ℤ_ℓ(i)) = ℤ/w_i^{(ℓ)}(F) (proof steps 2 to 4). [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.8, Corollary 9.8, the table (PDF p. 530; book p. 522). The non-example at ℓ = 2 for ℚ: the two-primary part of K_3(ℤ) is ℤ/16, not ℤ/w_2^{(2)}(ℚ) = ℤ/8.

### Primary torsion through coefficients and localisation

**Target:** `ArithmeticKTheory:N.5/primary-bockstein-localisation` · **Declaration:** `primaryBockstein_localisation`.

Let F be a number field, S a finite set of finite places, ℓ a prime, j ≥ 2, O = O_{F,S} and R = O[1/ℓ]. The coefficient Bockstein is a natural isomorphism β_R : K_{2j}(R; Q_ℓ/Z_ℓ) → K_{2j−1}(R){ℓ}. Localisation identifies K_{2j−1}(O){ℓ}, K_{2j−1}(R){ℓ} and K_{2j−1}(F){ℓ}; these identifications commute with coefficient maps, enlarging S and pullback along embeddings of number fields (using compatible sets of inverted places). The Bockstein here has degree −1; it is not a tensor-product definition of coefficient K-theory.

**Hypotheses.** S is finite; j ≥ 2; ℓ is prime. K_{2j}(R) is finite by the inherited finiteness-and-rank theorem.

**Proof plan.**

1. Use the Q_ℓ/Z_ℓ universal coefficient sequence 0 → K_{2j}(R) ⊗ Q_ℓ/Z_ℓ → K_{2j}(R; Q_ℓ/Z_ℓ) → K_{2j−1}(R){ℓ} → 0 from H.6. A finite group tensors to zero with a divisible group, so the Bockstein is an isomorphism. Finiteness is asserted for R, not for K_{2j}(F).
2. Transport along the inherited N.5/soule-theorem, applied to O and R, to identify the three odd-degree primary subgroups. Alternatively, localisation at the places over ℓ uses L.1/quillen-k-groups: both neighbouring positive-degree residue groups have order prime to ℓ.
3. Naturality of the coefficient cofiber and the localisation maps gives the commutative squares for S ⊆ S′ and for field embeddings. Use the baseline primary-component subgroup rather than inventing a torsion carrier.

**Dependencies.** `ArithmeticKTheory:N.5/soule-theorem`, `ArithmeticKTheory:N.3/finiteness-and-ranks-combined`, `KTheoryFiniteLocalFields:L.1/quillen-k-groups`, `KTheoryFiniteLocalFields:L.1/k-theory-mod-m`, `StableHomotopyKTheory:H.6/mod-l-homotopy-and-bockstein-sequence`, `StableHomotopyKTheory:H.6`, `mathlib:CommGroup.primaryComponent`.

**Checks.**

- For j = 2 this compares K_4(R; Q_ℓ/Z_ℓ) with the ℓ-primary subgroup of K_3(R), not with K_4(R) ⊗ Q_ℓ/Z_ℓ.
- The statement applies at ℓ = 2 even when F has real places: the real correction enters descent, not this Bockstein.
- It does not imply finiteness of any positive even K-group of F.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), IV.2.5 and Exercise IV.2.6, printed pp. 280, 284; VI.8.2 proof, printed p. 513 (combined PDF pp. 288, 292, 521). The coefficient exact sequence and its use on a ring of ℓ-integers; use the corrected residue ring recorded in ArithmeticKTheory/E17.

### The e-invariant is the descent edge

**Target:** `ArithmeticKTheory:N.5/e-invariant-descent-edge` · **Declaration:** `eInvariant_eq_descentEdge`.

With F,S,R,ℓ,j as in primary-bockstein-localisation, choose the same Bott-normalised, G_F-equivariant Suslin identification K_{2j−1}(F^s){ℓ} ≅ Q_ℓ/Z_ℓ(j) as in the inherited e-invariant. The degree-zero descent edge ε_R : K_{2j}(R; Q_ℓ/Z_ℓ) → H^0_et(R; Q_ℓ/Z_ℓ(j)) = W_j(F){ℓ} satisfies ε_R = e_{F,ℓ} ∘ loc ∘ β_R. At odd ℓ, and also at ℓ = 2 when F is totally imaginary, ε_R and hence e_{F,ℓ} are isomorphisms. This identifies the maps, not just the orders of their groups. At ℓ = 2 with real places the equality still holds, while the edge can have kernel or cokernel.

**Hypotheses.** j ≥ 2; R inverts ℓ. Use one coherent Suslin/Bott coefficient convention on the separable closure and on the descent edge. The assertion that the edge is an isomorphism is restricted to odd ℓ or totally imaginary F.

**Proof plan.**

1. Over F^s, Suslin gives K_{2j}(F^s; Q_ℓ/Z_ℓ) ≅ Q_ℓ/Z_ℓ(j), and its Bockstein identifies it with the primary torsion in K_{2j−1}(F^s); even integral K-groups of F^s are uniquely divisible.
2. The descent edge is restriction to the geometric point followed by G_F-invariants. The natural Bockstein square with R → F → F^s therefore identifies it with the inherited e-invariant composed with β_R. For ℓ = 2 this factorisation is explicitly stated after Rognes–Weibel Example 1.6.
3. In the cohomological-dimension-two cases, import from M.7 the Q_ℓ/Z_ℓ descent calculation, including H^2(R; Q_ℓ/Z_ℓ(j+1)) = 0 for j ≥ 2. Only H^0 remains in total degree 2j, so the edge is an isomorphism. Natural maps between descent spectral sequences give compatibility with S and field embeddings.

**Dependencies.** `ArithmeticKTheory:N.5/primary-bockstein-localisation`, `ArithmeticKTheory:N.5/e-invariant`, `ArithmeticKTheory:N.4/the-w-invariant`, `MotivicEtaleKTheory:M.7`.

**Checks.**

- For a totally imaginary exceptional field such as Q(√−7), the dyadic edge is still an isomorphism; exceptional cyclotomic image alone does not create a real-place kernel.
- For Q and j = 2, e_{Q,2} is surjective with nonzero kernel; replacing the equality of maps by an isomorphism without the cohomological-dimension hypothesis fails.
- Changing the Suslin trivialisation changes both sides coherently; no unrelated generator of W_j is declared canonical.

**Source.** [RognesWeibel.2000](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/RognesWeibel.pdf), §1, paragraph following Example 1.6, printed p. 8. Explicit factorisation through the Bockstein and restriction to an algebraic closure, at ℓ = 2. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.1.6–1.7.1, printed pp. 467–468; VI.8.2–8.3, printed pp. 513–514 (PDF pp. 475–476, 521–522). Suslin equivariance and the cohomological-dimension-two descent argument for each prime.

### Normal form of a diagonal elementary two-group extension

**Target:** `ArithmeticKTheory:N.5/diagonal-extension-normal-form` · **Declaration:** `diagonalExtension_normalForm`.

Let w,r be positive integers with 2 | w and r ≥ 1, and E an abelian group in a short exact sequence 0 → (Z/2)^r --ι→ E --p→ Z/w → 0. Suppose that a lift x of 1 ∈ Z/w satisfies w x = ι(1,…,1). Then x has order 2w, E ≅ Z/(2w) ⊕ (Z/2)^{r−1}, and p has no additive section. The lift relation is independent of the choice of x because w annihilates the kernel. The equivalence is an existence statement, depending on a basis of the kernel; it is not an equivalence of the sequence with a split extension.

**Hypotheses.** w > 0; r > 0; 2 divides w. ι is injective, p is surjective and ker p = im ι. p(x) = 1 and w x = ι of the nonzero diagonal vector.

**Proof plan.**

1. Fix a coordinate v₀ of (Z/2)^r, possible since r > 0, and write d = (1,…,1). The subgroup C of vectors whose v₀-coordinate is zero is a complement to the diagonal: a = a(v₀)d + (a − a(v₀)d). Reindex the remaining coordinates to identify C with (Z/2)^{r−1}; no finite-dimensional basis theorem is needed.
2. Surjectivity of p and exactness show that x and ι(C) generate E: subtract an integer multiple of x to enter ker p, then eliminate the diagonal component using w x = ι(d). If m x + ι(c) = 0 with c in C, applying p gives w | m. Write m = qw; injectivity of ι gives q d + c = 0. Its v₀-coordinate forces q even, and then c = 0. Thus precisely the relations 2w x = 0 and 2c = 0 remain.
3. This presentation gives E ≅ Z/(2w) ⊕ C and order(x) = 2w. For another lift y, exactness gives y − x in im ι; since w is even, w(y − x) = 0. Hence every lift has the same nonzero w-multiple, whereas a section would give a lift killed by w.

**Dependencies.** `mathlib:ZMod`, `mathlib:MonoidHom.ker`, `mathlib:MonoidHom.range`, `mathlib:ZMod.addOrderOf_one`, `mathlib:ZMod.castHom`.

**Checks.**

- w = 8, r = 1 gives a cyclic group of order 16 and no section to its quotient of order 8.
- w = 8, r = 2 gives Z/16 ⊕ Z/2; it is not Z/8 ⊕ (Z/2)^2, whose exponent is 8.
- Dropping r > 0 or the nonzero diagonal relation allows a split extension; these hypotheses must remain visible.

**Source.** [RognesWeibel.2000](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/RognesWeibel.pdf), Proof of Theorem 6.7, final paragraph, printed p. 33. The source observes the common abstract isomorphism type; the presented relation identifies the particular diagonal class detected at every real place.

### The real-place extension of the e-invariant

**Target:** `ArithmeticKTheory:N.5/real-e-invariant-extension` · **Declaration:** `real_eInvariant_diagonalExtension`.

**Planet:** Real-place torsion extension.

Let F be a number field with real-place set V, r_1 = |V| > 0, and n = 8k+3 ≥ 3, j = 4k+2. Write T = K_n(F)_tors and W = W_j(F), cyclic of even order w = w_j(F). There is a natural short exact sequence 0 → (Z/2)^V --ι→ T --e→ W → 0. Under the identification of each kernel coordinate with the unique nonzero element of Z/2, the pushout along the coordinate projection (Z/2)^V → Z/2 at any v ∈ V is the pullback, along W ↪ Q/Z(j) at v, of 0 → Z/2 → K_n(ℝ)_tors → Q/Z(j) → 0; its last map is multiplication by 2 in compatible Suslin trivialisations. Consequently, after choosing W ≅ Z/w and lifting 1 to x, one has w x = ι(1,…,1). The extension class is the diagonal vector in Ext^1_Z(Z/w,(Z/2)^V) ≅ (Z/2)^V. Thus T ≅ Z/(2w) ⊕ (Z/2)^{r_1−1}, with e surjective and no section. The sequence and its real-place coordinates are natural; the cyclic generator and abstract direct sum are not chosen naturally.

**Hypotheses.** F is a number field; n = 8k+3 with k ≥ 0; r_1 > 0. S-integer versions use the inherited odd-degree localisation isomorphism. The Ext coordinate description uses a chosen cyclic generator of W; all generator choices give the same mod-two vector.

**Proof plan.**

1. Use the Bockstein-localisation comparison and M.7’s real descent filtration in degree 8k+4. Its two associated graded groups are H^2(F; Q_2/Z_2(j+1)) ≅ (Z/2)^V and H^0(F; Q_2/Z_2(j)) = W{2}, with kernel identified by restriction to real places. The previous comparison identifies its quotient map with e_{F,2}.
2. Import Suslin’s real torsion map from M.7: in degree 8k+3 the map K_n(ℝ)_tors → K_n(ℂ)_tors is multiplication by 2 on Q/Z. The map of descent filtrations to every real place identifies the corresponding pushout with its pullback over W{2}. Each coordinate extension is nontrivial, so a lift of a cyclic generator has w_2-multiple equal to the diagonal kernel vector.
3. For each odd prime, the e-invariant is an isomorphism by e-invariant-descent-edge. Adjoin these cyclic odd-primary factors. Since w/w_2 is odd, the full extension has the same diagonal mod-two class and the same lift relation with w.
4. Apply diagonal-extension-normal-form to determine the group and nonsplitting. For F ↪ E, restriction takes a kernel coordinate at a real place of F to every real place of E above it; coordinates which become complex vanish. This follows from the natural real-place restriction square. For fixed F, enlargement of S leaves the sequence identified with the field sequence.

**Dependencies.** `ArithmeticKTheory:N.5/primary-bockstein-localisation`, `ArithmeticKTheory:N.5/e-invariant-descent-edge`, `ArithmeticKTheory:N.5/diagonal-extension-normal-form`, `ArithmeticKTheory:N.4/the-w-invariant`, `ArithmeticKTheory:N.4/finiteness-of-the-w-invariant`, `ArithmeticKTheory:N.4/two-primary-w-invariant`, `MotivicEtaleKTheory:M.7`.

**Checks.**

- For F = Q, j = 2 and the inherited w_2(Q) = 24 (weight subscript 2, full order), e has target Z/24, kernel Z/2 and domain Z/48; the certified K_3 example is owned by N.8.
- When r_1 = 2 and w = 8, the diagonal class gives Z/16 ⊕ Z/2; the split group of the same order has smaller exponent.
- Restriction to a totally imaginary extension kills the real-place kernel, consistently with the dyadic isomorphism there.

**Source.** [RognesWeibel.2000](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/RognesWeibel.pdf), Theorem 6.7, printed pp. 32–33 (final proof paragraph p. 33); Theorem 6.9, pp. 33–34. Real-place maps identify the extension, not merely its cardinality; the all-coordinate diagonal statement follows by applying the proof to every real embedding. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.3.1 and Table 3.1.1, printed p. 475; VI.9.4 proof, printed pp. 519–520 (PDF pp. 483, 527–528). Real-to-complex torsion map and the nontrivial extension detected at each real place.

### The kernel and cokernel of the odd e-invariant

**Target:** `ArithmeticKTheory:N.5/e-invariant-kernel-cokernel` · **Declaration:** `eInvariant_kernel_cokernel`.

**Planet:** Odd e-invariant kernel and cokernel.

For a number field F, j ≥ 2, n = 2j−1 and finite S, let e : K_n(O_{F,S})_tors → W_j(F) be the inherited map transported to F. If F is totally imaginary then e is an isomorphism. If F has r_1 > 0 real places, its kernel and cokernel are respectively (0,0) for n ≡ 1 mod 8; ((Z/2)^{r_1},0) for n ≡ 3 mod 8; (0,Z/2) for n ≡ 5 mod 8; and (0,0) for n ≡ 7 mod 8. In degree 3 mod 8 the sequence has the diagonal class of real-e-invariant-extension. In degree 5 mod 8, e is injective with image the odd-primary subgroup of W_j(F); here j is odd and |W_j(F){2}| = 2. These are assertions about the actual e-map, natural under enlargement of S and field embeddings, rather than chosen direct-sum isomorphisms.

**Hypotheses.** F number field; S finite; j ≥ 2. Use the residue class of n, not that of j, to index the four rows.

**Proof plan.**

1. At every odd prime, and at 2 for a totally imaginary field, use e-invariant-descent-edge; kernel and cokernel vanish primarywise.
2. For a real field use M.7’s even-degree Q_2/Z_2 coefficient filtration: degrees 8a, 8a+2, 8a+4, 8a+6 give W_{4a}{2}, W_{4a+1}{2} = Z/2, the real-place extension over W_{4a+2}{2}, and zero respectively. Index by n+1 = 2j, excluding degree zero.
3. Identify the edge with e via the comparison. Degree 8a+4 is real-e-invariant-extension; degree 8a+6 has zero source and target W_{4a+3}{2} = Z/2 by N.4. In the other two rows the edge is an isomorphism.
4. Reassemble primary components of the finite torsion groups. Combine this map-level table with the inherited finiteness/rank result to recover the inherited two integral structure theorems, without adding duplicate declarations or choosing natural free bases.

**Dependencies.** `ArithmeticKTheory:N.5/e-invariant-descent-edge`, `ArithmeticKTheory:N.5/real-e-invariant-extension`, `ArithmeticKTheory:N.4/finiteness-of-the-w-invariant`, `ArithmeticKTheory:N.4/two-primary-w-invariant`, `ArithmeticKTheory:N.3/finiteness-and-ranks-combined`, `MotivicEtaleKTheory:M.7`.

**Checks.**

- Real n = 3 has kernel (Z/2)^{r_1}; stating only that e is noninjective loses the required coordinates and extension class.
- Real n = 5 has no dyadic torsion although W_3(F){2} is nonzero: its cokernel is Z/2.
- The n ≡ 1 row begins at n = 9 in this scope; it makes no assertion about K_1 of S-integers.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.4–9.5, printed pp. 519–521 (PDF pp. 527–529); VI.2.6, printed p. 474 (PDF p. 482). Even coefficient rows and the integral mod-eight consequences, retaining the maps and correcting the two-primary w convention in ArithmeticKTheory/E20.

### The first étale edge Chern map on torsion

**Target:** `ArithmeticKTheory:N.5/edge-normalised-chern-torsion` · **Declaration:** `etaleEdge_eInvariant_torsion`.

Let F,S,R,ℓ,j be as in primary-bockstein-localisation. Let c_edge : K_{2j−1}(R)^∧_ℓ → H^1_et(R; Z_ℓ(j)) be the first étale Chern map normalised as the ordinary-to-étale K-theory comparison followed by its degree-one edge (the Dwyer–Friedlander normalisation). Let δ : H^0_et(R; Q_ℓ/Z_ℓ(j)) → H^1_et(R; Z_ℓ(j)) be the connecting map of 0 → Z_ℓ(j) → Q_ℓ(j) → Q_ℓ/Z_ℓ(j) → 0. Then δ identifies W_j(F){ℓ} with the finite torsion subgroup of H^1_et(R; Z_ℓ(j)), and on K_{2j−1}(R){ℓ} one has c_edge = δ ∘ e_{F,ℓ} ∘ loc. In particular c_edge has the same torsion kernel as e, and its cokernel into cohomological torsion agrees with the preceding kernel/cokernel table. This does not identify unnormalised higher Chern classes with e: their factorial/sign conventions require the separate M.8 comparison.

**Hypotheses.** j ≥ 2; R inverts ℓ; S finite. c_edge is edge-normalised and uses the same coefficient/Bockstein sign as e-invariant-descent-edge. Completion is the K-spectrum ℓ-adic passage; its odd group agrees with ordinary ℓ-adic completion here by finite generation and the H.6 Milnor/UCT interface.

**Proof plan.**

1. By N.4/finiteness-of-the-w-invariant, W_j(F){ℓ} is finite for j ≥ 2. A nonzero invariant vector in the one-dimensional Q_ℓ(j) would force the j-th cyclotomic character to be trivial, making all of Q_ℓ/Z_ℓ(j) invariant and contradicting that finiteness. Thus H^0(R; Q_ℓ(j)) = H^0(R; Z_ℓ(j)) = 0, also at ℓ = 2. The coefficient long exact sequence embeds W_j(F){ℓ} into H^1(R; Z_ℓ(j)) and identifies it with the kernel of passage to Q_ℓ cohomology. Finite generation and rationalisation of this H^1 are supplied by M.2; that kernel is its finite torsion subgroup.
2. Use the natural coefficient triangles on K-theory and étale cohomology and the comparison supplied by M.7. On the even Q_ℓ/Z_ℓ group, its H^0 edge is ε_R. The connecting square therefore gives c_edge ∘ β_R = δ ∘ ε_R. Apply e-invariant-descent-edge and invert β_R.
3. For completion, the finite coefficient inverse systems are finite (Mittag–Leffler), and the inverse limit of the bounded finite even-group torsion term with multiplication-by-ℓ transitions is zero. H.6 then identifies the odd completed homotopy group with the completion of the finitely generated odd group, preserving its ℓ-primary torsion.
4. Restrict the formula to torsion and use e-invariant-kernel-cokernel. Naturality of both triangles proves compatibility with S and pullback. The formula contains no assertion about injectivity of a rational or syntomic regulator.

**Dependencies.** `ArithmeticKTheory:N.5/primary-bockstein-localisation`, `ArithmeticKTheory:N.5/e-invariant-descent-edge`, `ArithmeticKTheory:N.5/e-invariant-kernel-cokernel`, `ArithmeticKTheory:N.4/finiteness-of-the-w-invariant`, `ArithmeticKTheory:N.3/finiteness-and-ranks-combined`, `StableHomotopyKTheory:H.6/l-adic-completion-milnor-sequence`, `KTheoryFiniteLocalFields:L.1/completed-k-theory`, `MotivicEtaleKTheory:M.2`, `MotivicEtaleKTheory:M.7`.

**Checks.**

- At ℓ = 2, for a real field and n ≡ 3 mod 8, the first edge Chern map has kernel (Z/2)^{r_1}; the real defect does not disappear by renaming the comparison.
- At ℓ = 2 and n ≡ 5 mod 8, its image on dyadic torsion is zero but H^1(R; Z_2(j))_tors ≅ Z/2.
- At odd ℓ the torsion restriction is an isomorphism onto cohomological torsion. An unqualified classical Chern class is not used as a replacement.

**Source.** [Weibel.HandbookI5.2005](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/KZsurvey-published.pdf), §5.4, printed pp. 153–154; §5.7, Theorem 73, printed pp. 167–169. The first étale Chern class is defined by the comparison followed by the étale spectral-sequence edge; coefficient compatibility is an explicit supplier interface. [RognesWeibel.2000](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/RognesWeibel.pdf), §1, paragraph after Example 1.6, printed p. 8. The degree-zero coefficient edge factors through torsion; the connecting-square formula is its coefficient-compatible degree-one consequence.

## N.6 — Even groups, wild kernels, certificates and Bott tables

At odd primes, and at two for a totally imaginary field, compare K_(2i)(O_(F,S)) primary parts to H²_et(O_(F,S)[1/ℓ],Z_ℓ(i+1)). With real places retain modified cohomology, signature cokernel and nonsplit filtration extensions. The subsequent 28 targets separate local finite symbols, cohomological wild kernels, global divisible elements and the raw completion kernel. Degree two uses Moore’s uniquely divisible local kernel; higher local Q_p/Z_p pieces prevent the same torsion argument. The certificate engine proves relations and surjectivity and supplies an independent order/kernel bound. Its input is never an order postulated from a zeta value. The added tables are periodic finite-coefficient statements in all integer degrees. Their edge splitting is canonical at odd q because the two even terms have opposite dualization signs. Ordinary comparison has the precise degree-one exception stated below.

| Total degree | Positive dualization piece | Negative dualization piece |
| --- | --- | --- |
| 4k−2 | H²(X,Z/q(2k)) | H⁰(X,Z/q(2k−1)) |
| 4k | H⁰(X,Z/q(2k)) | H²(X,Z/q(2k+1)) |

Here k ranges over Z and X is either Spec Z′ or Spec O′_q. In degree 2k−1 the entire group is H¹(X,Z/q(k)), with sign (−1)^k. Degree zero puts rank in + and Pic/q in −. At k=0 the degree −2 positive term has twist zero. These checks reject a sign reversal and a natural-number truncation of negative weights.

### The even K-groups at a prime where the cohomological dimension is two (Theorem VI.8.2, even row)

**Target:** `ArithmeticKTheory:N.6/even-groups-at-odd-primes`.

**Planet:** Even K-groups at primes where cd = 2.

Let F be a number field, O_S a ring of S-integers in F and ℓ a prime; if ℓ = 2 suppose F totally imaginary. For every i ≥ 1 the group K_{2i}(O_S) is finite and its ℓ-primary part K_{2i}(O_S){ℓ} = K_{2i}(O_S)_(ℓ) is isomorphic to H^2_et(O_S[1/ℓ]; ℤ_ℓ(i+1)). The isomorphism is the composite of K_{2i}(O_S){ℓ} ≅ K_{2i}(R){ℓ} = K_{2i}(R; ℤ_ℓ), R = O_S[1/ℓ], with MotivicEtaleKTheory M.7's comparison K_{2i}(R; ℤ_ℓ) ≅ H^2(R; ℤ_ℓ(i+1)), and is natural for O_S ⊂ O_{S'}. This is the cohomological description with its inverse-limit (ℤ_ℓ-coefficient) passage; at ℓ = 2 with a real embedding it is replaced by N.6/the-two-primary-corrections, and the odd rows of the same theorem are N.5/odd-torsion-at-a-prime-where-cd-is-two.

**Hypotheses.** ℓ is any prime; for ℓ = 2 the field is totally imaginary, which is exactly when the étale 2-cohomological dimension of O_S[1/2] is two. The coefficients are ℤ_ℓ(i+1) = lim_ν μ_{ℓ^ν}^{⊗(i+1)} on O_S[1/ℓ]; for i ≥ 1, H^n(R; ℤ_ℓ(i+1)) = 0 for n ≠ 1, 2 and H^2 is finite (source Ex. VI.8.1–8.2, imported with M.7). i ≥ 1; K_0 is N.1's.

**Proof plan.**

1. Replace O_S by R = O_S[1/ℓ]: K_{2i}(O_S)_(ℓ) ≅ K_{2i}(R)_(ℓ) by the localisation sequence (N.2/localisation-sequence-for-a-dedekind-domain), since K_m(O_S/𝔭) has no ℓ-torsion for m ≥ 1 and 𝔭 over ℓ (KTheoryFiniteLocalFields L.1).
2. K_{2i}(R) is finite (N.3/finiteness-and-ranks-combined), so K_{2i}(R){ℓ} = K_{2i}(R)_(ℓ) ≅ K_{2i}(R; ℤ_ℓ) (StableHomotopyKTheory H.6: the ℓ-adic completion of a finite group is its ℓ-part, and the lim^1 term vanishes).
3. Import from MotivicEtaleKTheory M.7: the ℤ_ℓ-coefficient descent spectral sequence degenerates because H^n(R; ℤ_ℓ(j)) = 0 for n ≠ 1, 2 and j > 0, giving K_{2i}(R; ℤ_ℓ) ≅ H^2(R; ℤ_ℓ(i+1)).

**Dependencies.** `ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain`, `KTheoryFiniteLocalFields:L.1`, `ArithmeticKTheory:N.3/finiteness-and-ranks-combined`, `StableHomotopyKTheory:H.6`, `MotivicEtaleKTheory:M.7`.

**Checks.**

- F = ℚ, ℓ odd, i = 1: H^2(ℤ[1/ℓ]; ℤ_ℓ(2)) ≅ K_2(ℤ){ℓ} = 0, since K_2(ℤ) ≅ ℤ/2 (K2SymbolsBrauer T.5).
- For an odd regular prime ℓ, K_{2i}(ℤ[ζ_ℓ]) has no ℓ-torsion for every i ≥ 1 (Example VI.8.3.2; see N.6/l-rank-from-class-group-data).
- The totally imaginary hypothesis at ℓ = 2 cannot be dropped: for F = ℚ and i = 3, K_6(ℤ){2} = 0 (Corollary VI.9.8) while H^2(ℤ[1/2]; ℤ_2(4)) has order 2, the two-primary part of K_6 being the kernel H̃^2 of the surjection α^2(4) onto (ℤ/2)^{r_1} = ℤ/2 (Theorem VI.9.11).

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.2, Theorem 8.2, the even row (PDF p. 521; book p. 513). The even row of Theorem 8.2 with its hypothesis at the prime two, which this node states. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.2, proof, first paragraph (PDF p. 521; book p. 513). The reduction from O_S to O_S[1/ℓ] (proof step 1). [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.2, proof, last paragraph (PDF p. 522; book p. 514). The ℤ_ℓ-coefficient argument that gives K_{2i}(R; ℤ_ℓ) ≅ H^2(R, ℤ_ℓ(i+1)) (proof steps 2 and 3). [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.2, proof, second paragraph (PDF p. 521; book p. 513). The cohomological-dimension hypothesis. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.3.2, Example 8.3.2 (PDF p. 522; book p. 514). The regular-prime instance used in the acceptance.

### The two-primary part of the K-groups of a number field with a real embedding (Theorem VI.9.11)

**Target:** `ArithmeticKTheory:N.6/the-two-primary-corrections`.

**Planet:** Two-primary K-groups of real number fields.

Let F be a number field with r_1 ≥ 1 real embeddings and R = O_S a ring of S-integers in F containing 1/2; let j = j(R) be its signature defect (N.6/signature-defect) and write w_m = w_m^{(2)}(F). There is an integer ρ with j ≤ ρ ≤ r_1 − 1 such that for all n ≥ 2 the two-primary subgroup K_n(O_S){2} is isomorphic to: H^2_et(R; ℤ_2(4k+1)) for n = 8k; ℤ/2 for n = 8k+1; H^2_et(R; ℤ_2(4k+2)) for n = 8k+2; (ℤ/2)^{r_1−1} ⊕ ℤ/2w_{4k+2} for n = 8k+3; an extension of H^2_et(R; ℤ_2(4k+3)) by (ℤ/2)^ρ for n = 8k+4; 0 for n = 8k+5; H̃^2_et(R; ℤ_2(4k+4)), the kernel of α^2(4k+4) : H^2_et(R; ℤ_2(4k+4)) → (ℤ/2)^{r_1}, for n = 8k+6; and ℤ/w_{4k+4} for n = 8k+7. The integer ρ is the rank of the image of K^M_4(F) ≅ (ℤ/2)^{r_1} in K_4(F) (Corollary VI.9.10); it depends on F and not on S, and it is not determined by r_1: it is 0 for ℚ(√2) and 1 for ℚ(√7), both with r_1 = 2. The row n = 8k+4 is an extension, not a direct sum, and the theorem does not decide it.

**Hypotheses.** r_1 ≥ 1 and 1/2 ∈ R. For F totally imaginary the two-primary part is given by N.6/even-groups-at-odd-primes and N.5/totally-imaginary-integral-structure. j = j(R) (Definition VI.9.6.1) and w_m = w_m^{(2)}(F). In the source's notation A ⋊ B is an abelian group extension of B by A; (ℤ/2)^ρ ⋊ H^2 is an extension 0 → (ℤ/2)^ρ → K → H^2 → 0. ρ satisfies j ≤ ρ ≤ r_1 − 1; the source asks whether ρ can be less than min(r_1 − 1, j + s + t − 1) (Question VI.9.10.2), so ρ is data of F and is not a function of r_1 and j.

**Proof plan.**

1. Odd n = 2i − 1: the two-primary part of N.5/the-real-case-modulo-eight, using w_i^{(2)}(F) = 2 for n ≡ 1 (mod 4) (Proposition VI.2.3(b), N.4/exceptional-fields-at-two).
2. n = 2: K_2(O_S){2} ≅ H^2(R; ℤ_2(2)) by Tate's theorem K_2(O_S)/2^ν ≅ H^2(R; μ_{2^ν}^{⊗2}) for rings of S-integers with 2 inverted, which MotivicEtaleKTheory M.3 owns (RT-AREA-ktheory-1/8; not K2SymbolsBrauer T.7), and finiteness of K_2(O_S). (The source cites III.6.9.3 here.)
3. Even n = 2m ≥ 4: K_{n+1}(O_S) has rank r = r_1 + r_2 or r_2 (N.3/finiteness-and-ranks-combined), and the universal coefficient sequence 0 → (ℚ_2/ℤ_2)^r → K_{n+1}(O_S; ℚ_2/ℤ_2) → K_n(O_S){2} → 0 (StableHomotopyKTheory H.6) identifies K_n(O_S){2} with the finite part of K_{n+1}(O_S; ℚ_2/ℤ_2).
4. Import Theorem VI.9.4 from MotivicEtaleKTheory M.7: K_{n+1}(O_S; ℚ_2/ℤ_2) is H^1(R; ℚ_2/ℤ_2(m+1)) for n + 1 ≡ 1, 3 (mod 8), its subgroup H̃^1 for n + 1 ≡ 7 (mod 8), and an extension of H^1(R; ℚ_2/ℤ_2(4k+3)) by (ℤ/2)^{r_1−1} for n + 1 = 8k + 5. The finite part of H^1(R; ℚ_2/ℤ_2(m+1)) is H^2(R; ℤ_2(m+1)); α^1 vanishes on the divisible part and induces α^2, so the finite part of H̃^1 is H̃^2 (MotivicEtaleKTheory M.2). (The source writes the twist as i although n = 2i + 2; the twist of the row n = 2m is m + 1.)
5. n = 8k + 4: by mod-2 periodicity the image of H^4(O_S; ℤ/2(4)) ≅ (ℤ/2)^{r_1} in Hom(ℤ/2, K_n(O_S)) has rank ρ, which gives the (ℤ/2)^ρ; the bounds j(O_S) ≤ ρ ≤ r_1 − 1 are Corollary VI.9.10, whose proof uses {−1, −1, −1, −1} = 0 in K_4(F) and the edge map of the motivic spectral sequence (imported with MotivicEtaleKTheory M.7).

**Dependencies.** `ArithmeticKTheory:N.6/signature-defect`, `ArithmeticKTheory:N.5/the-real-case-modulo-eight`, `ArithmeticKTheory:N.4/exceptional-fields-at-two`, `ArithmeticKTheory:N.3/finiteness-and-ranks-combined`, `MotivicEtaleKTheory:M.7`, `MotivicEtaleKTheory:M.2`, `MotivicEtaleKTheory:M.3`, `StableHomotopyKTheory:H.6`.

**Checks.**

- F = ℚ, R = ℤ[1/2] (r_1 = 1, j = ρ = 0): K_n(ℤ){2} for n ≥ 2 and n ≡ 1, …, 8 (mod 8) is ℤ/2, ℤ/2, ℤ/16, 0, 0, 0, ℤ/2^ν, 0, with 2^ν the two-primary part of 16k for n = 8k − 1 (Corollary VI.9.8); here w_{4k+2}^{(2)}(ℚ) = 8 (Proposition VI.2.3(c) with a = 2, b = 1).
- The row n = 8k+4 needs ρ: for F = ℚ(√7) and R = ℤ[√7, 1/2] (j = ρ = 1) the two-primary part of K_4(ℤ[√7]) is ℤ/2, generated by the image of {−1, −1, −1, √7} ∈ K^M_4(F) (Example VI.9.10.1), although H^2(R; ℤ_2(3)) = 0.
- For F = ℚ(√2) (j = 0, r_1 = 2), K_4(ℤ[√2]) has odd order and ρ = 0 (Example VI.9.9.2).
- K_n(O_S){2} = 0 for n ≡ 5 (mod 8), in agreement with Example VI.9.5.1.
- The odd rows agree with N.5/the-real-case-modulo-eight.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.11, Theorem 9.11, hypotheses (PDF p. 532; book p. 524). The hypotheses of Theorem 9.11 and the integer ρ with j ≤ ρ < r_1. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.11, Theorem 9.11, the eight rows (PDF p. 532; book p. 524). The eight rows, which this node states with the twists. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9, the sentence before Theorem 9.4 (PDF p. 526; book p. 518). The meaning of ⋊: an extension, not a product. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.11, proof (PDF p. 532; book p. 524). The proof: the case n = 2 and the universal coefficient sequence for even n (proof steps 2 and 3). [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.11, end of the proof (PDF p. 533; book p. 525). Where ρ comes from (proof step 5). [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.10, Corollary 9.10 and the definition of ρ (PDF p. 531; book p. 523). The definition of ρ and its bounds. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.10.1, Example 9.10.1, continued (PDF p. 532; book p. 524). The instance ρ = 1 for ℚ(√7) in the acceptance. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.9.2, Example 9.9.2, last paragraph (PDF p. 531; book p. 523). The instance ρ = 0 for ℚ(√2). [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.8, Corollary 9.8, the table (PDF p. 530; book p. 522). The table for ℤ used in the acceptance.

### The wild kernel, and its place inside the tame kernel

**Target:** `ArithmeticKTheory:N.6/tame-and-wild-kernels`.

**Planet:** Wild kernel.

Import the tame subgroup and its identification with K2(O_F) from T.5/unramified-subgroup and /tame-kernel-sequence. For i≥1 define the raw completion kernel WK^raw_(2i)(F)=ker(K_(2i)(F)→∏_v K_(2i)(F_v)), using every finite and real place. This is separate from N.6/symbol-wild-kernel and /cohomological-wild-kernel; their comparison is only the explicitly proved degree-two theorem, or a higher statement conditional on gap G-WildHigher. Infinite products here do not replace the finite-support direct sums of localization.

**Hypotheses.** F is a number field; v runs over all places, the real ones included, as the source's 'all valuations v on F' and Weibel 2006, Definition 0.2 (where the real places contribute (ℤ/2)^{r_1} for i ≡ 1 mod 4) require. The completions F_v and the maps K_{2i}(F) → K_{2i}(F_v), with their compatibility with the localisation boundary and with restriction, are KTheoryFiniteLocalFields L.7's. Weibel 2006 defines the higher wild kernel through the maps K_{2i}(F) → K_{2i}(F_v) → H^2(F_v; μ^{⊗(i+1)}) ≅ μ^{⊗i}(F_v); the two definitions agree for i = 1 by Moore's theorem, and their agreement for i ≥ 2 is part of the recorded gap.

**Proof plan.**

1. Use T.5’s subgroup and localization identification for the tame kernel. Define the raw kernel as the intersection of the actual completion-map kernels, including real places. The completion/localization square and Soulé’s injectivity place it inside the finite integral group. The separate N.6/raw-and-symbol-kernel-boundary theorem imports this definition and supplies the degree-two comparison using Moore; the higher comparison is conditional on G-WildHigher. The comparison theorem is not a prerequisite for defining the raw kernel.

**Dependencies.** `KTheoryFiniteLocalFields:L.7`, `KTheoryFiniteLocalFields:L.3`, `K2SymbolsBrauer:T.5/unramified-subgroup`, `K2SymbolsBrauer:T.5/tame-kernel-sequence`, `K2SymbolsBrauer:T.7/classical-local-symbols`, `ArithmeticKTheory:N.5/soule-theorem`, `ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain`, `ArithmeticKTheory:N.3/finiteness-and-ranks-combined`.

**Uses.** N.6's text: 'Develop tame and wild kernels as distinct objects, and compare localisation to completions' K2SymbolsBrauer T.5: the tame kernel (unramified subgroup) is imported, not redefined N.6/divisible-subgroup-and-the-wild-kernel: the divisible subgroup is compared with it N.8, the certified examples: a computation of an even group states which of the two kernels it bounds

**API.**

- `wildKernel` (data): For a number field F and i ≥ 1, ⨅ v, ker (K_{2i}(F) → K_{2i}(F_v)) as an AddSubgroup of K_{2i}(F).
- `mem_wildKernel_iff` (characterisation): x ∈ wildKernel F i ↔ ∀ v, the image of x in K_{2i}(F_v) is 0.
- `wildKernel_le_ker` (compatibility): wildKernel F i ≤ ker (K_{2i}(F) → K_{2i}(F_v)) for each place v.
- `wildKernel_le_range` (relation): wildKernel F i ≤ range (K_{2i}(O_F) → K_{2i}(F)); in particular it is finite.
- `wildKernel_two_le_unramifiedSubgroup` (relation): wildKernel F 1 ≤ K2SymbolsBrauer's unramifiedSubgroup of K_2(F) for the family of finite places (the tame kernel).
- `wildKernel_two_eq_ker_hilbert` (characterisation): wildKernel F 1 = ker (K_2(F) → ⨁_{v finite or real} μ(F_v)), the kernel of the Hilbert symbols.
- `wildKernel_restrict_le` (functoriality): For a finite extension E/F the restriction K_{2i}(F) → K_{2i}(E) maps wildKernel F i into wildKernel E i.

**Unit tests.**

- `wildKernel_two_rat`: wildKernel ℚ 1 = 0: it lies in K_2(ℤ) = {1, {−1, −1}}, and {−1, −1} maps to the nontrivial element of K_2(ℝ) under the real sign symbol (K2SymbolsBrauer T.5/real-sign-symbol).
- `wildKernel_ne_tameKernel_rat`: The tame kernel of ℚ contains {−1, −1} and the wild kernel does not: a definition using only the tame symbols (the residue maps at the finite places) instead of the whole maps to K_2(ℚ_p) and K_2(ℝ) would give K_2(ℤ) ≅ ℤ/2, missing that the Hilbert symbols (−1, −1)_2 and (−1, −1)_∞ are −1.
- `wildKernel_two_gaussian`: wildKernel ℚ(i) 1 = 0, since it lies in K_2(ℤ[i]) = 1 (Tate, quoted in Example III.5.2.2).
- `wildKernel_two_hilbert`: For every number field, wildKernel F 1 is the kernel of the Hilbert symbols of K2SymbolsBrauer T.7/classical-local-symbols at the finite places together with the real sign symbols, the classical wild kernel of the Moore sequence.
- `wildKernel_two_Q_sqrt_neg14`: For F = ℚ(√−14), {−1, −1} ∈ wildKernel F 1 and {−1, −1} ≠ 1 (Weibel 2006, Example 5.6).

**Checks.**

- WK_2(ℚ) = 0, while the tame kernel K_2(ℤ) ≅ ℤ/2 is generated by {−1, −1}, whose Hilbert symbols at 2 and at ∞ are −1.
- WK_{2i}(F) is a subgroup of the image of K_{2i}(O_F), hence finite.
- For F = ℚ(√−14), {−1, −1} is a nonzero element of WK_2(F) (Weibel 2006, Example 5.6, after Hutchinson), so the wild kernel can be nonzero.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.8.2, Wild Kernels 6.8.2 (PDF p. 421; book p. 413). The definition of the wild kernel as the intersection of the kernels of the maps to the completions; the identification with div K_{2i}(F) claimed in the same sentence is corrected in N.6/divisible-subgroup-and-the-wild-kernel.

### Order certificates: a finite presentation with independent upper and lower bounds

**Target:** `ArithmeticKTheory:N.6/order-certificate`.

For an abelian group A (a ℤ-module), an order certificate consists of: relations rel : Module.Relations ℤ with finitely many generators and relations and finite presented group rel.Quotient; a solution s : rel.Solution A whose values span A, so that s.fromQuotient : rel.Quotient → A is onto (the upper bound Nat.card A ≤ Nat.card rel.Quotient); and a lower bound, a surjective homomorphism φ : A → B onto a finite group B with Nat.card B = Nat.card rel.Quotient. Soundness: s is then a presentation (Mathlib's IsPresentation), A ≃ rel.Quotient and Nat.card A = Nat.card B. The two bounds are independent obligations: without the lower bound, or a complete kernel argument (IsPresentation itself), only the upper bound holds, and an upper bound with a surjective presentation is never reported as an isomorphism. This is the certificate engine of N.6's text ('supply a finite presentation, verify relations and surjectivity, and certify the kernel/order through cohomology or a second independently proved bound'); the lower bound may come from symbols (the real sign, tame or Hilbert symbols), from cohomology (N.6/certificate-driven-computation) or from another proved order statement, but never from a formula for which the certified group is to serve as the independent test (RT-AREA-ktheory-1/9, /11). The format moves here from K2SymbolsBrauer T.5/certified-presentation, whose competing certificate obligation T.5 drops.

**Hypotheses.** A is an abelian group; the intended instances are tame kernels K_2(O_F), the K_2 of rings of S-integers and the finite even K-groups K_{2i}(O_S). Generation (span) and the lower bound are separate fields carried with their proofs; neither may be inferred from the other or from a numerical coincidence.

**Proof plan.**

1. Define the certificate as a structure on top of Mathlib's Module.Relations and Module.Relations.Solution; do not introduce a second presentation type.
2. Upper bound: surjectivity of s.fromQuotient from the span condition (mathlib:Module.Relations.Solution.surjective_π_iff_span_eq_top and mathlib:Module.Relations.Solution.surjective_fromQuotient_iff_surjective_π).
3. Soundness: the composite rel.Quotient → A → B is a surjection between finite sets of equal cardinality, hence bijective (mathlib:Function.Surjective.bijective_of_nat_card_le), so s.fromQuotient is injective and s is a presentation.
4. Package a certificate as a Mathlib Module.Presentation ℤ A (mathlib:Module.Presentation.ofIsPresentation), and a complete kernel argument (IsPresentation with finite quotient) as a certificate with B = A and φ = id.

**Dependencies.** `mathlib:Module.Relations`, `mathlib:Module.Relations.Solution`, `mathlib:Module.Relations.Quotient`, `mathlib:Module.Relations.Solution.fromQuotient`, `mathlib:Module.Relations.Solution.surjective_fromQuotient_iff_surjective_π`, `mathlib:Module.Relations.Solution.surjective_π_iff_span_eq_top`, `mathlib:Module.Relations.Solution.IsPresentation`, `mathlib:Module.Presentation`, `mathlib:Module.Presentation.ofIsPresentation`, `mathlib:Function.Surjective.bijective_of_nat_card_le`.

**Uses.** N.6's text: 'Construct certificate-driven computations: supply a finite presentation, verify relations and surjectivity, and certify the kernel/order through cohomology or a second independently proved bound' N.6/certificate-driven-computation: the cohomological lower bound completes a certificate of this format ArithmeticKTheory N.8, the certified examples: K₂(ℤ[i]) = 0 and the real quadratic tame kernel are certificates of this format, exported to SpecialValuesBirchTate B.3 K2SymbolsBrauer T.5/k2-of-the-integers: its proof of K₂(ℤ) ≅ ℤ/2 (Milnor's bound and the sign symbol) is the model instance; T.5 is upstream of N.6 and does not import the format

**API.**

- `OrderCertificate` (structure): For an abelian group A: rel : Module.Relations ℤ with Finite rel.G and Finite rel.R, s : rel.Solution A with span_eq_top, a finite group B in the universe of A with a surjective φ : A →+ B, and card_quotient_eq : Nat.card B = Nat.card rel.Quotient with rel.Quotient finite.
- `OrderCertificate.fromQuotient_surjective` (projection): The upper bound: s.fromQuotient is surjective, so Nat.card A ≤ Nat.card rel.Quotient.
- `OrderCertificate.isPresentation` (characterisation): Soundness: s.IsPresentation.
- `OrderCertificate.toPresentation` (compatibility): The Mathlib Module.Presentation ℤ A with relations rel and solution s.
- `OrderCertificate.card_eq` (simp): Nat.card A = Nat.card B = Nat.card rel.Quotient.
- `OrderCertificate.linearEquiv` (equivalence): rel.Quotient ≃ₗ[ℤ] A, from IsPresentation.linearEquiv.
- `OrderCertificate.ofIsPresentation` (constructor): A complete kernel argument (s.IsPresentation with rel.Quotient finite) gives a certificate with B = A and φ = id.

**Unit tests.**

- `orderCertificate_k2_int`: For K_2(ℤ): one generator g ↦ {−1, −1}, one relation 2g = 0, span from Milnor's bound (K2SymbolsBrauer T.5's recorded gap), lower bound the real sign symbol onto ℤˣ; the certificate gives K_2(ℤ) ≃ ℤ/2.
- `orderCertificate_trivial`: No generators and no relations certify the trivial group: rel.Quotient = 0, span_eq_top forces A = 0 (for instance K_2(𝔽_q)), and B = 0.
- `upper_bound_not_iso`: One generator with the relation 4g = 0, sent to the generator of ℤ/2, spans and satisfies the relation, but ℤ/4 → ℤ/2 is not injective, and no surjection from ℤ/2 onto a group of order 4 exists: the certificate cannot be completed.
- `orderCertificate_isPresentation`: From any certificate, Mathlib's predicate s.IsPresentation holds, so A ≃ rel.Quotient.
- `orderCertificate_toPresentation`: toPresentation.toRelations = rel and toPresentation.toSolution = s.

**Checks.**

- A certificate without its lower bound gives Nat.card A ≤ Nat.card rel.Quotient and nothing more.
- K_2(ℤ): one generator {−1, −1}, the relation 2g = 0, span by Milnor's bound and lower bound the real sign symbol onto ℤˣ (both K2SymbolsBrauer T.5's) — the model instance, used by N.8.
- For a tame kernel with a claimed order the certificate carries both bounds, which is N.6's and N.8's acceptance condition.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.2.2, Example 5.2.2 (PDF p. 226; book p. 218). The model upper bound: the order-two statement comes from a computation in the Steinberg group, which the source cites. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.2.1, Example 6.2.1 (PDF p. 240; book p. 232). The model lower bound: a surjection onto a group of known order.

### The cohomological lower bound for order certificates of even K-groups, in every even degree

**Target:** `ArithmeticKTheory:N.6/certificate-driven-computation`.

Let F be a number field, O_S a ring of S-integers and i ≥ 1, so that A = K_{2i}(O_S) is finite. Given the upper half of an order certificate for A (a finite presentation with span, N.6/order-certificate), a finite set L of primes containing every prime factor of the order of the presented group, and for each ℓ ∈ L a certified value h_ℓ of #K_{2i}(O_S){ℓ} computed from cohomology — h_ℓ = #H²_et(O_S[1/ℓ]; ℤ_ℓ(i+1)) when ℓ is odd, or ℓ = 2 and F is totally imaginary (N.6/even-groups-at-odd-primes); and, for ℓ = 2 and r_1 > 0 with R = O_S[1/2], h_2 = #H²_et(R; ℤ_2(i+1)) for 2i ≡ 0, 2 (mod 8), #H̃²_et(R; ℤ_2(i+1)) for 2i ≡ 6 (mod 8), and 2^ρ · #H²_et(R; ℤ_2(4k+3)) for 2i = 8k + 4, with ρ a separately certified input, j(R) ≤ ρ ≤ r_1 − 1 (N.6/the-two-primary-corrections) — with ∏_{ℓ∈L} h_ℓ equal to that order, the projection φ : K_{2i}(O_S) → ⊕_{ℓ∈L} K_{2i}(O_S){ℓ} is onto a group of order ∏ h_ℓ and completes the certificate. So the cohomological order computation is available in every even degree; in degree 8k + 4 with real places it needs ρ, which neither r_1 nor j determines. A zeta value is never an input: Theorems VI.8.7 and VI.8.8 enter only through a proved theorem supplying the order, and a match of orders between an unproved formula and a presentation certifies nothing.

**Hypotheses.** F is a number field, O_S a ring of S-integers and i ≥ 1; K_{2i}(O_S) is finite (N.3:ranks/even-K-groups-of-S-integers-are-finite). The format, with its upper-bound half (presentation, relations, span), is N.6/order-certificate; this node supplies a lower bound from cohomology. The cohomology orders h_ℓ, and ρ in degree 8k + 4, are inputs to be certified (by the class-group and unit data of N.6/l-rank-from-class-group-data and the Brauer group, or otherwise); the construction does not compute them.

**Proof plan.**

1. Import OrderCertificate from N.6/order-certificate, with its soundness lemma and its packaging as mathlib:Module.Presentation.
2. For ℓ ∈ L the projection of the finite group K_{2i}(O_S) onto its ℓ-primary component is surjective; N.6/even-groups-at-odd-primes (or N.6/the-two-primary-corrections at ℓ = 2 with real places) gives its order h_ℓ: H² or H̃² in the rows 2i ≡ 0, 2, 6 (mod 8), and 2^ρ · #H²(R; ℤ_2(4k+3)) in the row 2i = 8k + 4, the extension of H² by (ℤ/2)^ρ having that order whatever its class.
3. The presented group surjects onto K_{2i}(O_S), which surjects onto B = ⊕_{ℓ∈L} K_{2i}(O_S){ℓ} of order ∏ h_ℓ; equality with the presented order fills the lower-bound field, and soundness makes both maps bijective.
4. Record why ρ is an input in degree 8k + 4: Theorem VI.9.11 determines only j ≤ ρ ≤ r_1 − 1, and ρ is 0 for ℚ(√2) and 1 for ℚ(√7) with the same r_1 = 2.

**Dependencies.** `ArithmeticKTheory:N.6/order-certificate`, `ArithmeticKTheory:N.6/even-groups-at-odd-primes`, `ArithmeticKTheory:N.6/the-two-primary-corrections`, `ArithmeticKTheory:N.6/signature-defect`, `ArithmeticKTheory:N.3:ranks/even-K-groups-of-S-integers-are-finite`, `mathlib:Module.Relations`, `mathlib:Module.Presentation`.

**Uses.** N.6's text: 'certify the kernel/order through cohomology or a second independently proved bound. This is a reusable calculation method, not an oracle defining the group order from a zeta value' N.6/order-certificate: the format, now owned by N.6 (RT-AREA-ktheory-1/9); K2SymbolsBrauer T.5 drops its competing certificate obligation N.8, the certified examples: its even-group and tame-kernel certificates are built with this lower bound or with symbol bounds, and exported to SpecialValuesBirchTate B.3 SpecialValuesBirchTate: a proved zeta-value theorem may supply a second lower bound in the same format

**API.**

- `OrderCertificate.ofCohomology` (constructor): For a presentation of K_{2i}(O_S) with span, a finite set L of primes containing the prime factors of its order, and certified orders h_ℓ of the ℓ-primary parts computed from cohomology with ∏_{ℓ∈L} h_ℓ equal to that order, the OrderCertificate (N.6/order-certificate) whose lower bound is the projection onto ⊕_{ℓ∈L} K_{2i}(O_S){ℓ}.
- `evenK_toPrimaryCohomology_surjective` (projection): K_{2i}(O_S) → ⊕_{ℓ∈L} K_{2i}(O_S){ℓ}, the ℓ-primary projections, is surjective, and for ℓ odd (or F totally imaginary) its ℓ-component is identified with H²_et(O_S[1/ℓ]; ℤ_ℓ(i+1)) by N.6/even-groups-at-odd-primes.
- `OrderCertificate.ofCohomology_card` (simp): Nat.card K_{2i}(O_S) = ∏_{ℓ∈L} h_ℓ.
- `OrderCertificate.ofCohomology_two_real` (constructor): For F with a real embedding and 2 ∈ L: the two-primary factor is h_2 = #H²_et(R; ℤ_2(i+1)) for 2i ≡ 0, 2 (mod 8), #H̃²_et(R; ℤ_2(i+1)) for 2i ≡ 6 (mod 8), and 2^ρ · #H²_et(R; ℤ_2(4k+3)) for 2i = 8k + 4 with ρ a certified input (N.6/the-two-primary-corrections).
- `OrderCertificate.ofCohomology_toPresentation` (compatibility): The Mathlib Module.Presentation of the resulting certificate has the given relations and solution (OrderCertificate.toPresentation of N.6/order-certificate).

**Unit tests.**

- `ofCohomology_K2_int`: For K_2(ℤ) the cohomological certificate (L = {2}, h_2 = 2) and the sign-symbol certificate (N.6/order-certificate's test orderCertificate_k2_int) give the same Nat.card = 2.
- `ofCohomology_trivial`: The empty presentation with L = ∅ (empty product 1) certifies K_{2i}(O_S) = 0.
- `ofCohomology_missing_prime`: For K_2(ℤ) with L = ∅ the product is 1 ≠ 2, the order of the presented group ⟨g | 2g⟩, so no certificate is produced: every prime factor of the presented order must be in L.
- `ofCohomology_two_row_four`: For F = ℚ(√7), R = ℤ[√7, 1/2] and 2i = 4, the two-primary part of K_4(ℤ[√7]) is ℤ/2 while H²(R; ℤ_2(3)) = 0 (Example VI.9.10.1, ρ = 1): ofCohomology_two_real with ρ = 1 gives h_2 = 2, while a variant using #H²(R; ℤ_2(3)) alone would give 1 and undercount by 2^ρ.
- `ofCohomology_isPresentation`: The certificate produced satisfies Mathlib's IsPresentation, so K_{2i}(O_S) is isomorphic to the presented group.

**Checks.**

- The certificate for K_2(ℤ) (one generator {−1, −1}, relation 2g = 0) is completed equally by the real sign symbol and by the cohomological bound with L = {2}, h_2 = #H²(ℤ[1/2]; ℤ_2(2)) = 2 (degree 2 ≡ 2 mod 8, Theorem VI.9.11); both give order 2.
- Without the lower bound only Nat.card K_{2i}(O_S) ≤ Nat.card of the presented group follows.
- For ℚ(√7), 2i = 4: h_2 = 2^ρ · #H²(ℤ[√7, 1/2]; ℤ_2(3)) = 2 · 1 with ρ = 1 (Example VI.9.10.1); taking h_2 = #H² alone would undercount by 2^ρ.
- A zeta value alone certifies nothing: ζ(−1) = −1/12 gives |K_2(ℤ)| = 2 only through the proved Theorem VI.8.8 for abelian fields (for ℚ, k = 1: −1/12 = −2 · |K_2(ℤ)|/|K_3(ℤ)| with |K_3(ℤ)| = 48).

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.2, Theorem 8.2, the even row (PDF p. 521; book p. 513). The isomorphism K_{2i}(O_S){ℓ} ≅ H^2_et(O_S[1/ℓ]; ℤ_ℓ(i+1)) that supplies the lower bound. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.11, Theorem 9.11, the eight rows (PDF p. 532; book p. 524). The two-primary rows usable at ℓ = 2 with real places, and the row n = 8k + 4 that is not. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.7, Theorem 8.7 (PDF p. 523; book p. 515). Wiles's theorem relating zeta values to orders of étale cohomology (denominator |H^1| elided), admissible only as a proved bound. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.8, Theorem 8.8 (PDF p. 523; book p. 515). Theorem 8.8 relating ζ_F(1 − 2k) to |K_{4k−2}(O_F)|/|K_{4k−1}(O_F)| for abelian F (denominator elided), admissible only as a proved bound.

### The even K-groups of a totally imaginary field (Theorem VI.8.4, even row)

**Target:** `ArithmeticKTheory:N.6/even-groups-of-a-totally-imaginary-field`.

Let F be a totally imaginary number field and O_S the ring of S-integers for a finite set S of finite places. For every i ≥ 1, K_{2i}(O_S) ≅ ⊕_ℓ H^2_et(O_S[1/ℓ]; ℤ_ℓ(i+1)), the sum over all primes ℓ, a finite group with only finitely many nonzero summands.

**Hypotheses.** F is totally imaginary, so N.6/even-groups-at-odd-primes applies at every prime including ℓ = 2. i ≥ 1.

**Proof plan.**

1. K_{2i}(O_S) is finite (N.3/finiteness-and-ranks-combined), hence the direct sum of its ℓ-primary parts, only finitely many of them nonzero.
2. For every ℓ the ℓ-primary part is H^2_et(O_S[1/ℓ]; ℤ_ℓ(i+1)) by N.6/even-groups-at-odd-primes.

**Dependencies.** `ArithmeticKTheory:N.6/even-groups-at-odd-primes`, `ArithmeticKTheory:N.3/finiteness-and-ranks-combined`, `mathlib:NumberField.IsTotallyComplex`.

**Checks.**

- F = ℚ(i): K_{2i}(ℤ[i]) has odd order for every i ≥ 1, since H^2(ℤ[1/2, i]; μ_4) = 0 forces H^2(ℤ[1/2, i]; ℤ_2(i+1)) = 0 (Exercise VI.8.4).
- The formula fails for fields with a real embedding at ℓ = 2 (N.6/the-two-primary-corrections).

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.4, Theorem 8.4 (PDF p. 522; book p. 514). Theorem 8.4; this node states its row n = 2i ≥ 2. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI, Exercise 8.4 (PDF p. 524; book p. 516). The instance for ℤ[i] used in the acceptance.

### The even K-groups modulo ℓ (Corollary VI.8.3)

**Target:** `ArithmeticKTheory:N.6/even-groups-modulo-l`.

Let F be a number field, O_S a ring of S-integers in F and i > 0. For every odd prime ℓ, K_{2i}(O_S)/ℓ ≅ H^2_et(O_S[1/ℓ]; μ_ℓ^{⊗(i+1)}); the same holds for ℓ = 2 when F is totally imaginary.

**Hypotheses.** ℓ odd, or ℓ = 2 and F totally imaginary; the cohomological dimension of O_S[1/ℓ] is then two. i > 0.

**Proof plan.**

1. K_{2i}(O_S) is finite, so K_{2i}(O_S)/ℓ = K_{2i}(O_S){ℓ}/ℓ ≅ H^2(R; ℤ_ℓ(i+1))/ℓ with R = O_S[1/ℓ] (N.6/even-groups-at-odd-primes).
2. The coefficient sequence 0 → ℤ_ℓ(i+1) → ℤ_ℓ(i+1) → μ_ℓ^{⊗(i+1)} → 0 (multiplication by ℓ; MotivicEtaleKTheory M.1) and H^3(R; ℤ_ℓ(i+1)) = 0 (cohomological dimension two; MotivicEtaleKTheory M.2) give H^2(R; ℤ_ℓ(i+1))/ℓ ≅ H^2(R; μ_ℓ^{⊗(i+1)}).

**Dependencies.** `ArithmeticKTheory:N.6/even-groups-at-odd-primes`, `MotivicEtaleKTheory:M.1`, `MotivicEtaleKTheory:M.2`.

**Checks.**

- The hypothesis at 2 cannot be dropped: for F = ℚ and i = 3, K_6(ℤ)/2 = 0 (Corollary VI.9.8), while H^2(ℤ[1/2]; μ_2) ≅ ℤ/2 (Pic(ℤ[1/2]) = 0 and the two-torsion of Br(ℤ[1/2]) ≅ ℤ/2, from (8.1.1) with S = {2}).
- F = ℚ(i), ℓ = 2: K_{2i}(ℤ[i])/2 = 0 corresponds to H^2(ℤ[1/2, i]; μ_2) = 0, the vanishing behind Exercise VI.8.4.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.3, Corollary 8.3 with its proof (PDF p. 522; book p. 514). Corollary 8.3 with its one-line proof, which this node states and expands. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.8, Corollary 9.8, the table (PDF p. 530; book p. 522). K_6(ℤ) has no two-primary torsion, used in the non-example. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.1, the sequence (8.1.1) (PDF p. 521; book p. 513). The Brauer group of O_S, used in the non-example with S = {2}.

### The ℓ-rank of the even K-groups from class-group data (Example VI.8.3.1)

**Target:** `ArithmeticKTheory:N.6/l-rank-from-class-group-data`.

Let ℓ be an odd prime, F a number field containing a primitive ℓ-th root of unity, S the set of primes of O_F over ℓ, and t the 𝔽_ℓ-rank of Pic(O_S)/ℓ. Then H^2_et(O_S; μ_ℓ) has 𝔽_ℓ-rank t + |S| − 1; hence for every i ≥ 1, K_{2i}(O_S)/ℓ has rank t + |S| − 1, and the ℓ-primary subgroup of the finite group K_{2i}(O_F) is a direct sum of exactly t + |S| − 1 nonzero cyclic groups.

**Hypotheses.** ℓ is odd and ζ_ℓ ∈ F, so F is totally imaginary (r_1 = 0). S is the set of primes over ℓ, which is non-empty, as (8.1.1) requires.

**Proof plan.**

1. Kummer sequence on O_S (1/ℓ ∈ O_S): 0 → Pic(O_S)/ℓ → H^2(O_S; μ_ℓ) → ℓBr(O_S) → 0 (MotivicEtaleKTheory M.1); Pic(O_S) is the class group of O_S (mathlib:ClassGroup, with tauceti:IsDedekindDomain.integerClassGroupEquiv).
2. By (8.1.1) with r_1 = 0 and S non-empty, ℓBr(O_S) ≅ ker((ℤ/ℓ)^{|S|} → ℤ/ℓ) has rank |S| − 1 (class field theory, MotivicEtaleKTheory M.2).
3. Since ζ_ℓ ∈ F, μ_ℓ^{⊗i} ≅ ℤ/ℓ as Galois modules over O_S (the trivialisation K2SymbolsBrauer T.7/twisted-roots-of-unity), so H^2(O_S; μ_ℓ^{⊗(i+1)}) ≅ H^2(O_S; μ_ℓ) ⊗ μ_ℓ^{⊗i} has the same rank; N.6/even-groups-modulo-l gives the rank of K_{2i}(O_S)/ℓ.
4. By N.5/soule-theorem, 0 → K_{2i}(O_F) → K_{2i}(O_S) → ⊕_{𝔭∈S} K_{2i−1}(k(𝔭)) → 0, and the right-hand term has order prime to ℓ (KTheoryFiniteLocalFields L.1), so the ℓ-primary parts of K_{2i}(O_F) and K_{2i}(O_S) agree; a finite ℓ-group whose quotient by ℓ has rank r is a sum of r nonzero cyclic groups.

**Dependencies.** `ArithmeticKTheory:N.6/even-groups-modulo-l`, `ArithmeticKTheory:N.5/soule-theorem`, `KTheoryFiniteLocalFields:L.1`, `MotivicEtaleKTheory:M.1`, `MotivicEtaleKTheory:M.2`, `K2SymbolsBrauer:T.7/twisted-roots-of-unity`, `mathlib:ClassGroup`, `tauceti:IsDedekindDomain.integerClassGroupEquiv`.

**Checks.**

- Regular primes (Example VI.8.3.2): F = ℚ(ζ_ℓ), S = {(1 − ζ_ℓ)}, t = 0, so K_{2i}(ℤ[ζ_ℓ]) has no ℓ-torsion for all i ≥ 1.
- ℓ = 37, which is irregular (Example VI.2.4.1): 37 divides the class number of ℚ(ζ_37) and (1 − ζ_37) is principal, so t ≥ 1 and |S| = 1, and K_{2i}(ℤ[ζ_37]) has nonzero 37-torsion for every i ≥ 1.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.3.1, Example 8.3.1 (PDF p. 522; book p. 514). The rank of H^2(O_S, μ_ℓ) from the class group and |S|. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.3.1, Example 8.3.1, conclusion (PDF p. 522; book p. 514). The consequence for K_{2i}(O_F). [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.1, the sequence (8.1.1) (PDF p. 521; book p. 513). The Brauer group sequence used in proof step 2 (valid here because S is non-empty; see sourceIssues). [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.3.2, Example 8.3.2 (PDF p. 522; book p. 514). The regular-prime instance.

### The signature defect of a ring of S-integers (Definition VI.9.6.1)

**Target:** `ArithmeticKTheory:N.6/signature-defect`.

**Planet:** Signature defect.

Let F be a number field with r_1 real places and R = O_S a ring of S-integers in F. The signature defect j(R) is r_1 − dim_{𝔽_2} sign(F⟮S, 2⟯), the codimension in (ℤ/2)^{r_1} of the signs of the Selmer group F⟮S, 2⟯ of classes x·F^{×2} with even valuation at every prime not in S (Mathlib's IsDedekindDomain.selmerGroup; the sign map is Tau Ceti's signHom on representatives). When 1/2 ∈ R, Kummer theory identifies F⟮S, 2⟯ with H^1_et(R; μ_2) = H^1_et(R; ℤ/2) and the sign map with the restriction α^1 : H^1_et(R; ℤ/2) → ⊕_{σ real} H^1(ℝ; ℤ/2) ≅ (ℤ/2)^{r_1}, so j(R) is the 𝔽_2-dimension of the cokernel of α^1: Definition VI.9.6.1, in the setting of Theorem VI.9.11. Without 1/2 ∈ R the étale form differs: for R = ℤ, H^1_et(ℤ; ℤ/2) = 0 and its cokernel has dimension 1 = r_1, while j(ℤ) = 0. Equivalently j(R) = u − t, where t and u are the 𝔽_2-dimensions of Pic(R)/2 and of the narrow Picard group Pic^+(R)/2.

**Hypotheses.** F is a number field; for r_1 = 0 the target is zero and j(R) = 0. R = O_S; the étale description of j(R) needs 1/2 ∈ R, which is the case Theorem VI.9.11 uses; the Selmer form defines j(R) for every S, and it is the form under which the API below holds.

**Proof plan.**

1. Define j(R) as finrank_{ZMod 2} of the cokernel of α^1, with H^1_et(R; ℤ/2) and the real-place maps imported from MotivicEtaleKTheory M.1 and M.2.
2. Bounds: the class of −1 maps to (1, …, 1) ≠ 0 when r_1 > 0, so the image is nonzero and 0 ≤ j(R) < r_1.
3. Monotonicity: for S ⊆ S' the Selmer group grows, so j(O_{S'}) ≤ j(O_S); and since the sign map F^× → (ℤ/2)^{r_1} is onto (tauceti:NumberField.fieldUnitSignature_surjective), j(O_S) = 0 for S large (the source's j(F) = 0).
4. Kummer description for 1/2 ∈ R: H^1_et(R; μ_2) ≅ F⟮S, 2⟯ and α^1 is the sign map (MotivicEtaleKTheory M.1; mathlib:IsDedekindDomain.selmerGroup; tauceti:TauCeti.GlobalNumberFields.signHom).
5. Narrow-Picard description: the exact sequence (9.6.2) 0 → H̃^1(R; ℤ/2) → H^1(R; ℤ/2) → (ℤ/2)^{r_1} → Pic^+(R)/2 → Pic(R)/2 → 0 (source Ex. VI.9.3) gives u = t + j(R); for R = O_F compare with Tau Ceti's narrow class group.

**Dependencies.** `MotivicEtaleKTheory:M.1`, `MotivicEtaleKTheory:M.2`, `mathlib:IsDedekindDomain.selmerGroup`, `mathlib:Set.integer`, `mathlib:NumberField.InfinitePlace.nrRealPlaces`, `tauceti:TauCeti.GlobalNumberFields.signHom`, `tauceti:NumberField.fieldUnitSignature_surjective`, `tauceti:NumberField.NarrowClassGroup.twoRank`, `tauceti:TauCeti.ClassGroup.twoRank`.

**Uses.** Theorem VI.9.11: j is the lower bound for the integer ρ of the two-primary table Corollary VI.9.9: the 2-ranks j + s + t − 1 of K_n(O_S) for n ≡ 4, 6 (mod 8) Corollary VI.9.10: j(O_F[1/2]) ≤ ρ ≤ r_1 − 1

**API.**

- `signatureDefect` (data): For R = O_S in a number field F, the 𝔽_2-dimension of the cokernel of the sign map F⟮S, 2⟯ → ({σ : real places} → ℤˣ).
- `signatureDefect_eq_sub_finrank_selmer` (characterisation): signatureDefect R = nrRealPlaces F − finrank (ZMod 2) (sign '' F⟮S, 2⟯); when 1/2 ∈ R this is the dimension of the cokernel of α^1 on H^1_et(R; ℤ/2), by Kummer theory (MotivicEtaleKTheory M.1).
- `signatureDefect_lt_nrRealPlaces` (relation): If 0 < nrRealPlaces F then signatureDefect R < nrRealPlaces F.
- `signatureDefect_antitone` (functoriality): S ⊆ S' → signatureDefect (O_{S'}) ≤ signatureDefect (O_S).
- `signatureDefect_eventually_eq_zero` (relation): There is a finite S₀ with signatureDefect (O_S) = 0 for every S ⊇ S₀.
- `add_signatureDefect_eq` (characterisation): dim (Pic(R)/2) + signatureDefect R = dim (Pic^+(R)/2).
- `signatureDefect_ringOfIntegers` (compatibility): signatureDefect (𝓞 F) = NumberField.NarrowClassGroup.twoRank F − TauCeti.ClassGroup.twoRank (𝓞 F).
- `signatureDefect_of_isTotallyComplex` (simp): If F is totally complex then signatureDefect R = 0.

**Unit tests.**

- `signatureDefect_int_half`: signatureDefect ℤ[1/2] = 0: the class of −1 has sign −1 at the unique real place.
- `signatureDefect_sqrt7_half`: For F = ℚ(√7) and R = ℤ[√7, 1/2] (class number one), F⟮S, 2⟯ is spanned by −1, the totally positive fundamental unit 8 + 3√7 and the totally positive generator 3 + √7 of the prime over 2; their sign patterns span a line in (ℤ/2)^2, so signatureDefect R = 1.
- `signatureDefect_sqrt7_fourteen`: For F = ℚ(√7) and R = ℤ[√7, 1/14], the element √7 has signs (+, −), so the signs span (ℤ/2)^2 and signatureDefect R = 0: the defect drops as S grows.
- `signatureDefect_ringOfIntegers_sqrt7`: For F = ℚ(√7): the class group is trivial and the narrow class group has order 2 (the fundamental unit has norm +1), so NarrowClassGroup.twoRank F − ClassGroup.twoRank (𝓞 F) = 1 − 0 = 1 = signatureDefect ℤ[√7], agreeing with j = 1 for O_F in Example VI.9.9.1 (p = 7).
- `signatureDefect_not_unit_sign_codim`: The defect is not r_1 minus the rank of the signs of the units: for F = ℚ(√34) and R = O_F[1/2] the units ±1, the totally positive fundamental unit 35 + 6√34 and the totally positive generator 6 + √34 of the prime over 2 have signs (−,−) or (+,+), but x = 5 + √34 (norm −9, (x) = 𝔭_3^2 with 𝔭_3 non-principal since a^2 − 34b^2 = ±3 has no solution modulo 17) lies in F⟮S, 2⟯ with signs (+,−); so signatureDefect R = 0 while the unit-only formula gives 1.
- `signatureDefect_totallyComplex`: For F = ℚ(i) the target of α^1 is zero and signatureDefect R = 0 for every S.

**Checks.**

- j(ℤ[1/2]) = 0 (proof of Corollary VI.9.8).
- F = ℚ(√7), R = ℤ[√7, 1/2]: j(R) = 1 (Example VI.9.10.1).
- 0 ≤ j(R) < r_1 when r_1 > 0.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.6.1, Definition 9.6.1 (PDF p. 528; book p. 520). The definition, its bounds and monotonicity. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.6, before (9.6) (PDF p. 528; book p. 520). The map α^1 whose cokernel is taken, on H^1_et(R, ℤ/2). [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.6.2, after (9.6.2) (PDF p. 529; book p. 521). The narrow-Picard characterisation u = t + j(R). [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.10.1, Example 9.10.1 (PDF p. 532; book p. 524). The value j = 1 for ℤ[√7][1/2] used in the tests. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.8, proof (PDF p. 530; book p. 522). The value j = 0 for ℤ[1/2].

### Orders of K-groups and of étale cohomology for a totally real field (Theorem VI.9.12)

**Target:** `ArithmeticKTheory:N.6/order-ratio-for-totally-real-fields`.

Let F be a totally real number field with r_1 real embeddings and O_S a ring of S-integers in F. For every even i > 0, 2^{r_1} · |K_{2i−2}(O_S)| / |K_{2i−1}(O_S)| = ∏_ℓ |H^2_et(O_S[1/ℓ]; ℤ_ℓ(i))| / ∏_ℓ |H^1_et(O_S[1/ℓ]; ℤ_ℓ(i))|, all groups being finite and only finitely many factors differing from 1.

**Hypotheses.** F totally real (r_2 = 0) and i even: 2i − 1 ≡ 3 (mod 4), so K_{2i−1}(O_S) has rank r_2 = 0 and every group in the formula is finite. i > 0 even; O_S any ring of S-integers.

**Proof plan.**

1. Finiteness from N.3/finiteness-and-ranks-combined and, for the cohomology, MotivicEtaleKTheory M.7 (source Ex. VI.8.2–8.3). Write h^{n,i}(ℓ) = |H^n_et(O_S[1/ℓ]; ℤ_ℓ(i))|.
2. h^{1,i}(ℓ) = w_i^{(ℓ)}(F): for ℓ odd this is the source's Exercise VI.8.3; for ℓ = 2 it follows from the Bockstein sequence of MotivicEtaleKTheory M.1, since H^0(O_S[1/2]; ℤ_2(i)) = 0 for i ≠ 0 and H^1 is finite, so H^1(ℤ_2(i)) ≅ H^0(ℚ_2/ℤ_2(i)) (the source cites Exercise VI.8.3, stated only for odd ℓ, in this case; recorded in sourceIssues).
3. The ℓ-primary part of K_{2i−1}(O_S) has order h^{1,i}(ℓ) for ℓ odd (N.5/odd-torsion-at-a-prime-where-cd-is-two) and for ℓ = 2 except that for 2i − 1 ≡ 3 (mod 8) it is 2^{r_1} h^{1,i}(2) (N.5/the-real-case-modulo-eight).
4. The ℓ-primary part of K_{2i−2}(O_S) has order h^{2,i}(ℓ) for ℓ odd (N.6/even-groups-at-odd-primes) and for ℓ = 2 (N.6/the-two-primary-corrections) except that for 2i − 2 ≡ 6 (mod 8) it is H̃^2, of order h^{2,i}(2)/2^{r_1} because α^2(i) is onto (the source prints h^{1,i}(2)/2^{r_1}, a misprint recorded in sourceIssues).
5. Multiply over ℓ: for i ≡ 2 (mod 4) the factor 2^{r_1} occurs in |K_{2i−1}|, for i ≡ 0 (mod 4) as the divisor of |K_{2i−2}{2}|, and in both cases 2^{r_1} · |K_{2i−2}| / |K_{2i−1}| = ∏ h^{2,i}(ℓ) / ∏ h^{1,i}(ℓ).

**Dependencies.** `ArithmeticKTheory:N.3/finiteness-and-ranks-combined`, `ArithmeticKTheory:N.5/odd-torsion-at-a-prime-where-cd-is-two`, `ArithmeticKTheory:N.5/the-real-case-modulo-eight`, `ArithmeticKTheory:N.6/even-groups-at-odd-primes`, `ArithmeticKTheory:N.6/the-two-primary-corrections`, `ArithmeticKTheory:N.4/the-w-invariant`, `MotivicEtaleKTheory:M.7`, `MotivicEtaleKTheory:M.1`.

**Checks.**

- F = ℚ, i = 2: 2 · |K_2(ℤ)| / |K_3(ℤ)| = 2 · 2 / 48 = 1/12, and the right side is |H^2(ℤ[1/2]; ℤ_2(2))| / w_2(ℚ) = 2/24, the odd H^2 vanishing because K_2(ℤ) has no odd torsion.
- F = ℚ, i = 4: K_7(ℤ) ≅ ℤ/240 = ℤ/w_4(ℚ) and K_6(ℤ){2} = 0 (Corollary VI.9.8), so |H^2(ℤ[1/2]; ℤ_2(4))| = 2^{r_1} · |K_6(ℤ){2}| = 2; the printed h^{1,4}(2)/2^{r_1} = 16/2 = 8 would give K_6(ℤ){2} of order 8.
- With Theorem VI.8.8 (proved for abelian F; owned by SpecialValuesBirchTate) the ratio is |ζ_F(1 − 2k)|: for F = ℚ and k = 1, ζ(−1) = −1/12 = −2 · 2/48.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.12, Theorem 9.12 (PDF p. 533; book p. 525). Theorem 9.12; the displayed fraction is printed as a quotient, rendered here with the numerator and denominator separated. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.12, proof (PDF p. 533; book p. 525). h^{1,i}(ℓ) = w_i^{(ℓ)}(F), cited to Exercise 8.3. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.12, proof, second paragraph (PDF p. 533; book p. 525). The order of the ℓ-primary part of K_{2i−2}, with the printed misprint h^{1,i}(2)/2^{r_1}. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI, Exercise 8.3 (PDF p. 524; book p. 516). Exercise 8.3, stated for odd ℓ only. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.8, Theorem 8.8 (PDF p. 523; book p. 515). The zeta-value theorem that this order formula feeds, owned by SpecialValuesBirchTate.

### The subgroup of divisible elements

**Target:** `ArithmeticKTheory:N.6/divisible-subgroup`.

For an abelian group A, the subgroup of divisible elements is div A = ⋂_{m ≥ 1} m·A, the elements that map to zero in every quotient A/mA. It contains every divisible subgroup of A, is functorial for homomorphisms, commutes with direct sums, and is zero for a finite group. For a field F and n ≥ 1 it is applied to A = K_n(F), giving the source's div K_n(F); Tate observed that div K_2(F) can be nonzero for a number field.

**Hypotheses.** A is any abelian group (an additive commutative group); Mathlib has the class DivisibleBy of divisible groups but no subgroup of divisible elements. div A need not itself be divisible, so it is in general larger than the maximal divisible subgroup.

**Proof plan.**

1. Define div A as the infimum over m ≥ 1 of the subgroups m·A (the range of multiplication by m).
2. Functoriality: f(m·A) ≤ m·B for f : A → B, so f(div A) ≤ div B.
3. Direct sums: an element of ⊕ A_i has finitely many nonzero components, so it is divisible by m exactly when each component is; hence div(⊕ A_i) = ⊕ div A_i.
4. Finite A: m = |A| gives m·A = 0.
5. Compatibility with mathlib:DivisibleBy: a subgroup D with DivisibleBy D ℤ lies in div A.

**Dependencies.** `mathlib:DivisibleBy`.

**Uses.** V.6.8.2: div K_n(F), the elements of K_n(F) mapping to zero in each K_n(F)/ℓ N.6/divisible-subgroup-and-the-wild-kernel: compared with the wild kernel Weibel 2006, Theorem A: div K_{2i}(F) ⊆ K^w_{2i}(F) with index at most two

**API.**

- `divisibleSubgroup` (data): For an abelian group A, ⨅ m ≥ 1, (m • ⊤ : AddSubgroup A).
- `mem_divisibleSubgroup_iff` (characterisation): x ∈ divisibleSubgroup A ↔ ∀ m ≥ 1, ∃ y, m • y = x.
- `divisibleSubgroup_map_le` (functoriality): For f : A →+ B, (divisibleSubgroup A).map f ≤ divisibleSubgroup B.
- `divisibleSubgroup_directSum` (relation): divisibleSubgroup (⨁ i, A i) is the direct sum of the divisibleSubgroup (A i).
- `divisibleSubgroup_eq_bot_of_finite` (simp): If A is finite then divisibleSubgroup A = ⊥.
- `le_divisibleSubgroup_of_divisibleBy` (compatibility): If D ≤ A carries DivisibleBy D ℤ then D ≤ divisibleSubgroup A.

**Unit tests.**

- `divisibleSubgroup_ratCircle`: divisibleSubgroup (ℚ ⧸ ℤ) = ⊤.
- `divisibleSubgroup_int`: divisibleSubgroup ℤ = ⊥, and divisibleSubgroup A = ⊥ for every finite A.
- `divisibleSubgroup_ne_maxDivisible`: For a prime p, the p-group A generated by a and b_1, b_2, … with p·a = 0 and p^k·b_k = a has divisibleSubgroup A = ⟨a⟩ ≅ ℤ/p, which is not divisible; so div A is not the maximal divisible subgroup (which is 0 here).
- `divisibleSubgroup_K2_rat`: divisibleSubgroup K_2(ℚ) = 0: K_2(ℚ) ≅ ℤ/2 ⊕ ⨁_p 𝔽_p^× (K2SymbolsBrauer T.5, Application III.6.5.1) is a direct sum of finite groups; in particular {−1, −1} is not divisible, since the real sign symbol K_2(ℚ) → {±1} kills 2·K_2(ℚ) and sends {−1, −1} to −1.
- `mem_divisibleSubgroup_iff_quotients`: x ∈ divisibleSubgroup A exactly when the image of x in A/mA is 0 for every m ≥ 1 (the source's formulation).

**Checks.**

- div(ℚ/ℤ) = ℚ/ℤ, div ℤ = 0 and div A = 0 for A finite.
- div K_2(ℚ) = 0 (test divisibleSubgroup_K2_rat).

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.8.2, Wild Kernels 6.8.2 (PDF p. 421; book p. 413). The definition of div K_n(F) as the elements vanishing in every K_n(F)/ℓ, and Tate's observation.

### The divisible subgroup inside the wild kernel, with the exception for special fields

**Target:** `ArithmeticKTheory:N.6/divisible-subgroup-and-the-wild-kernel`.

Let div K_(2i)(F)=∩_(m≥1)mK_(2i)(F), the subgroup of elements divisible by every positive integer. For the symbol wild kernel K^w_(2i)(F), the N.6 follow-up records div⊆K^w with index at most 2, equality for even i or a nonspecial field, and the special odd dyadic obstruction. The exceptional odd dyadic proof remains conditional on G-WildExceptional. For i=1 the symbol and raw completion kernels agree by Moore’s uniquely divisible local kernel. For i≥2 no raw-kernel equality follows without G-WildHigher. No largest-divisible-subgroup interpretation of div is used.

**Hypotheses.** F is a number field; WK_{2i}(F) is the wild kernel of N.6/tame-and-wild-kernels; div is N.6/divisible-subgroup. Special fields are among the exceptional ones; for quadratic fields ℚ(√d), F is special exactly when d ≡ −1 (mod 8) with d ≠ −1, or d ≡ ±2 (mod 16) with d ≠ ±2 (Weibel 2006, Example 5.3, after Hutchinson). The theorem is Weibel 2006, Theorem A (for i = 1, Tate and Hutchinson); it is not proved in the K-book, and it is stated with that paper's definition of the wild kernel, whose agreement with the K-book's is recorded in the gap.

**Proof plan.**

1. Use the N.6 follow-up’s finite-coefficient image, cohomological comparison and special dyadic obstruction targets for the symbol-kernel theorem. Its exceptional odd dyadic branch remains conditional on G-WildExceptional. For the raw kernel use only degree two, where the local Moore kernel is uniquely divisible. The higher Q_p/Z_p obstruction is G-WildHigher.

**Dependencies.** `ArithmeticKTheory:N.6/divisible-subgroup`, `ArithmeticKTheory:N.6/weibel-symbol-divisibility-theorem`, `ArithmeticKTheory:N.6/raw-and-symbol-kernel-boundary`.

**Checks.**

- F = ℚ: div K_2(ℚ) = WK_2(ℚ) = 0 (ℚ is exceptional but not special: μ_{2^∞}(ℚ_2(i)) = μ_4 ⊂ ℚ(i)).
- F = ℚ(√−14) (special, −14 ≡ 2 mod 16): {−1, −1} lies in WK_2(F) but not in div K_2(F), and WK_2(F) ≅ div K_2(F) ⊕ ℤ/2 (Weibel 2006, Example 5.6, after Hutchinson [Hu2, 3.1]); so the two groups are not isomorphic.
- For i even the two always agree, even for special F.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.8.2, Wild Kernels 6.8.2 (PDF p. 421; book p. 413). The source's claim that div K_{2i}(F) is isomorphic to the wild kernel, attributed to [225] = Weibel, 'Higher wild kernels and divisibility in the K-theory of number fields', J. Pure Appl. Algebra 206 (2006) 222–244, whose Theorem A proves the corrected statement of this node (see sourceIssues).

### Keune’s cyclotomic Picard injection, in the scope needed by CGZ

**Target:** `ArithmeticKTheory:N.6/keune-cyclotomic-picard-injection`.

Let F be a number field, p an odd prime unramified in F, n=p^m (m≥1), L=F(ζ_n), G=Gal(L/F), and χ the cyclotomic character. In the setting used by CGZ Lemma 3.5 there is an injection (Pic(O_L[1/p])/p^m)_{χ⁻¹} → K₂(O_F)/p^m. The subscript denotes the twisted coinvariant quotient. This is the requested Keune theorem; its original proof and the translation of its exact hypotheses remain to be inspected.

**Hypotheses.** p is odd and p∤disc(F); use the cyclotomic extension, twist and coinvariant convention of CGZ Lemma 3.5. The further hypothesis p∤#K₂(O_F) is needed for the vanishing corollary, not asserted as part of the injection itself.

**Proof plan.**

1. Import the Kummer exact sequence over O_L[1/p] from M.3, keeping Pic[p^m], Pic/p^m and the unit terms distinct.
2. Obtain and decompose Keune, On the structure of the K₂ of the ring of integers in a number field (1989), for the displayed injection; CGZ’s citation is presently the inspected evidence. This is an unresolved proof input.
3. For the HB.1 application, K₂(O_F)/p^m=0 forces the twisted Pic/p^m coinvariants to vanish. Use the finite p-primary module vanishing criterion to kill the corresponding twisted invariants of Pic[p^m]; do not replace coinvariants by a canonical invariants isomorphism.

**Dependencies.** `ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain`, `ArithmeticKTheory:N.3/finiteness-and-ranks-combined`, `MotivicEtaleKTheory:M.3`.

**Unit tests.**

- `keune_cyclotomic_picard_injection_1`: The p-unit class obtained from Kummer need not be an ordinary unit until the valuation obstruction at p is killed.
- `keune_cyclotomic_picard_injection_2`: For the finite p-primary Picard modules with this cyclotomic G-action and χ⁻¹ twist, prove the needed invariants/coinvariants vanishing criterion; no canonical isomorphism between the two is asserted.

**Checks.**

- The p-unit class obtained from Kummer need not be an ordinary unit until the valuation obstruction at p is killed.
- For the finite p-primary Picard modules with this cyclotomic G-action and χ⁻¹ twist, prove the needed invariants/coinvariants vanishing criterion; no canonical isomorphism between the two is asserted.

**Source.** [CGZ.1712.04887v3.fix](https://arxiv.org/pdf/1712.04887v3), Lemma 3.5 and proof, PDF p.20. Paraphrase of the inspected passage, not a quotation. The proof uses Keune’s injection on twisted Picard coinvariants, followed by Kummer and valuation arguments.

### Arithmetic mod-two cohomology dimensions

**Target:** `ArithmeticKTheory:N.6/arithmetic-mod-two-dimensions` · **Declaration:** `TauCeti.ArithmeticKTheory.N6.arithmeticModTwoDimensions`.

Let R=O_{F,S} contain 1/2 and let r₁>0, r₂, s=|S|, t=dim Pic(R)/2 and u=dim Pic⁺(R)/2. With j=u−t the imported Selmer signature defect, dim H¹_et(R,F₂)=r₁+r₂+s+t, dim H²_et(R,F₂)=r₁+s+t−1, the image of restriction α¹ to the r₁ real places has dimension r₁−j, and α² is surjective. Here S consists of the finite primes inverted in R, not the finite primes remaining in Spec R.

**Hypotheses.** F is a number field; i ≥ 1; S is finite whenever O_S occurs.

**Proof plan.**

1. Use the S-unit Kummer sequence, Dirichlet’s S-unit rank and the finite class-group equality |Pic[2]|=|Pic/2|. The existing unit two-rank theorem covers only S empty; the S-unit extension is supplied by the imported N.2 row.
2. Use the Kummer sequence in degree two and the Brauer invariant sum over S and the real places to get r₁+s−1 dimensions in Br(R)[2]. These Brauer and real-restriction maps are requested from M.2.
3. Use the sign restriction interpretation and j=u−t from the parent signature-defect node, rather than the defect of the signs of units alone.

**Dependencies.** `ArithmeticKTheory:N.6/signature-defect`, `ArithmeticGaloisDuality:R02.3/s-unit-kummer-sequence`, `MotivicEtaleKTheory:M.2`, `ArithmeticKTheory:N.2/S-unit-and-class-group-sequence`.

**Checks.**

- R=Z[1/2]: dimensions H¹=2, H²=1, j=0.
- The condition 1/2∈R is required; the étale description fails in this form over Z.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.6–9.6.2, book pp. 520–521, PDF pp. 528–529. The statement and the indicated proof, with conventions specified in this node.

### Modified mod-two cohomology dimensions

**Target:** `ArithmeticKTheory:N.6/modified-mod-two-dimensions` · **Declaration:** `TauCeti.ArithmeticKTheory.N6.modifiedModTwoDimensions`.

In the preceding setting define H̃¹ and H̃² using M.2’s real-restriction kernels and its exact sequence, as in VI.9.6.3. Then dim H̃¹_et(R,F₂)=r₂+s+u=r₂+s+t+j and dim H̃²_et(R,F₂)=s+t−1. These are modified groups, not totally positive Hⁿ₊ and not ordinary Hⁿ.

**Hypotheses.** F is a number field; i ≥ 1; S is finite whenever O_S occurs.

**Proof plan.**

1. Take kernel dimensions of α¹ and α² in the exact sequence of VI.9.6.2, using the preceding image and surjectivity statements.
2. Substitute u=t+j; preserve the real-place map so the modified groups remain functorial.

**Dependencies.** `ArithmeticKTheory:N.6/arithmetic-mod-two-dimensions`, `MotivicEtaleKTheory:M.2`.

**Checks.**

- Z[1/2] gives modified dimensions 1 and 0.
- The second expression is nonnegative since S contains a dyadic prime.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Lemma VI.9.6.3, book p. 521, PDF p. 529. The statement and the indicated proof, with conventions specified in this node.

### Orders in the mod-two coefficient table

**Target:** `ArithmeticKTheory:N.6/mod-two-coefficient-orders` · **Declaration:** `TauCeti.ArithmeticKTheory.N6.modTwoCoefficientOrders`.

For n>0, R as above, let a=r₁+r₂+s+t, b=r₁+s+t−1, c=r₂+s+t+j, d=s+t−1. The finite group K_n(R;Z/2) has order 2^e, with e=d+1,a,b+1,r₁−1+a,j+b,r₁−1+c,j+d,c in residues n≡0,1,2,3,4,5,6,7 modulo 8 respectively. Keep the filtrations and the stated splittings of VI.9.7 in the M.7 supplier. An extension of elementary 2-groups need not be elementary; e is a log₂ cardinality, not necessarily an F₂ dimension.

**Hypotheses.** F is a number field; i ≥ 1; S is finite whenever O_S occurs.

**Proof plan.**

1. Import the eight exact filtrations of VI.9.7 from the unique M.7 owner, including the extra Z/2 in residues 0 and 2.
2. Multiply finite-group orders in each short exact sequence, applying the two dimension nodes. Do not infer a splitting in residues 2,3,4,5.

**Dependencies.** `ArithmeticKTheory:N.6/arithmetic-mod-two-dimensions`, `ArithmeticKTheory:N.6/modified-mod-two-dimensions`, `MotivicEtaleKTheory:M.7`.

**Checks.**

- For Z[1/2] the exponents in residues 0 through 7 are 1,2,2,2,1,1,0,1.
- The prototype must not give K_n(;Z/2) a vector-space structure merely from its coefficient modulus.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Theorem VI.9.7, book pp. 521–522, PDF pp. 529–530. The statement and the indicated proof, with conventions specified in this node.

### The even two-rank table

**Target:** `ArithmeticKTheory:N.6/even-two-rank-function` · **Declaration:** `TauCeti.ArithmeticKTheory.N6.evenTwoRank`.

For nonnegative integers r,s,t,j,n define evenTwoRank(r,s,t,j,n) by r+s+t−1 if n≡2 mod 8, j+s+t−1 if n≡4 or 6 mod 8, and s+t−1 if n≡0 mod 8. It is a numerical function, with value zero on odd residues as a totalisation convention; no K-theoretic meaning is assigned at odd n or n=0. The arithmetic application requires n>0, n even, r=r₁>0, S containing the dyadic primes, t the ordinary class-group two-rank and j the Selmer signature defect.

**Hypotheses.** r,s,t,j,n are arbitrary nonnegative integers; subtraction is natural subtraction. The separate arithmetic theorem assumes n>0 even, r=r₁>0, S containing all dyadic primes and the specified class/signature invariants.

**Proof plan.**

1. Read the four branches of Corollary VI.9.9.
2. Define the function by n modulo 8; natural subtraction agrees with the integer expression on arithmetic inputs because s≥1.

**Dependencies.** `mathlib:ZMod`.

**Uses.** VI.9.9 and ArithmeticKTheory:N.8: Select the numerical rank expected from certified class-group and signature data. ArithmeticKTheory:N.7: Check the dyadic rank before constructing an order certificate.

**API.**

- `TauCeti.ArithmeticKTheory.N6.evenTwoRank_residue_two` (simp): If n mod 8=2, the value is r+s+t−1.
- `TauCeti.ArithmeticKTheory.N6.evenTwoRank_residue_four` (simp): If n mod 8=4, the value is j+s+t−1.
- `TauCeti.ArithmeticKTheory.N6.evenTwoRank_residue_six` (simp): If n mod 8=6, the value is j+s+t−1.
- `TauCeti.ArithmeticKTheory.N6.evenTwoRank_residue_zero` (simp): If n mod 8=0, the value is s+t−1.
- `TauCeti.ArithmeticKTheory.N6.evenTwoRank_periodic` (compatibility): evenTwoRank(r,s,t,j,n+8)=evenTwoRank(r,s,t,j,n).

**Unit tests.**

- `TauCeti.ArithmeticKTheory.N6.rankTable_rational`: For (r,s,t,j)=(1,1,0,0), the values at n=2,4,6,8 are 1,0,0,0.
- `TauCeti.ArithmeticKTheory.N6.rankTable_real_defect`: For (2,1,0,1), the values at n=2,4,6,8 are 2,1,1,0.
- `TauCeti.ArithmeticKTheory.N6.rankTable_extra_prime`: For s≥1 and even n, replacing s by s+1 increases the value by one.
- `TauCeti.ArithmeticKTheory.N6.rankTable_odd_totalisation`: The value at n=1 is zero by the totalisation convention, with no claim about K₁.

**Checks.**

- The numerical function alone is not evidence for the order or exponent of a K-group.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Corollary VI.9.9, book p. 522, PDF p. 530. The statement and the indicated proof, with conventions specified in this node.

### Even K-group two-ranks from arithmetic data

**Target:** `ArithmeticKTheory:N.6/even-two-ranks-from-arithmetic` · **Declaration:** `TauCeti.ArithmeticKTheory.N6.evenTwoRanks`.

For R=O_{F,S} containing 1/2, r₁>0 and every positive even n, dim_F₂ K_n(R)/2 = evenTwoRank(r₁,|S|,t,j,n). Thus the ranks are r₁+s+t−1, j+s+t−1, j+s+t−1, s+t−1 in residues 2,4,6,0 mod 8. This gives the number of dyadic cyclic factors, not their orders. The theorem is independent of the undetermined extension rank ρ in the integral 8k+4 row.

**Hypotheses.** F is a number field; i ≥ 1; S is finite whenever O_S occurs.

**Proof plan.**

1. Use the universal coefficient short exact sequence 0→K_n(R)/2→K_n(R;Z/2)→K_{n−1}(R)[2]→0 requested from H.6.
2. Subtract the log₂ order of the preceding odd-degree two-torsion from the coefficient-order table. For n=2, use the S-unit square classes, not the n≥2 odd table.
3. Use the parent odd integral table for n≥4 and cancel r₂. Do not substitute ρ for j.

**Dependencies.** `ArithmeticKTheory:N.6/even-two-rank-function`, `ArithmeticKTheory:N.6/mod-two-coefficient-orders`, `ArithmeticKTheory:N.5/the-real-case-modulo-eight`, `StableHomotopyKTheory:H.6`.

**Checks.**

- Z[1/2] has ranks 1,0,0,0 in degrees 2,4,6,8.
- The source examples Q(√2) and Q(√7) have (r₁,s,t,j)=(2,1,0,0) and (2,1,0,1), giving 2,0,0,0 and 2,1,1,0.
- Degree zero is excluded.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Corollary VI.9.9 and its proof, book pp. 522–523, PDF pp. 530–531. The statement and the indicated proof, with conventions specified in this node.

### Divisible elements and finite-coefficient localisation

**Target:** `ArithmeticKTheory:N.6/finite-coefficient-divisibility-kernel` · **Declaration:** `TauCeti.ArithmeticKTheory.N6.finiteCoefficientDivisibilityKernel`.

Let R=O_{F,S}, n>0 even, T=K_n(R) embedded in K_n(F) by Soulé, and m≥2 annihilate the finite group T. Under the universal coefficient injection T=T/m→K_n(R;Z/m), the kernel of K_n(R;Z/m)→K_n(F;Z/m) is exactly div K_n(F). In particular this kernel is contained in the integral subgroup T. The modulus m is an annihilator, not an arbitrary prime; the statement does not identify every finite-coefficient K-group with an integral quotient.

**Hypotheses.** F is a number field; i ≥ 1; S is finite whenever O_S occurs.

**Proof plan.**

1. In the universal coefficient diagram, integral Soulé injectivity in the preceding odd degree forces the coefficient kernel into T/m. Use the separately imported Soulé finite-coefficient boundary surjectivity for the coefficient-localisation argument.
2. An element divisible in K_n(F) maps to zero in each quotient K_n(F)/m and hence into the stated kernel.
3. For the converse use the finite-field boundary groups and multiplication diagram of V.6.8.2, with mT=0; retain the source’s annihilator hypothesis.

**Dependencies.** `ArithmeticKTheory:N.6/divisible-subgroup`, `ArithmeticKTheory:N.5/soule-theorem`, `ArithmeticKTheory:N.2/localisation-sequence-for-a-dedekind-domain`, `ArithmeticKTheory:N.3/finiteness-and-ranks-combined`, `StableHomotopyKTheory:H.6`, `KTheoryFiniteLocalFields:L.1/quillen-k-groups`, `ArithmeticKTheory:N.5/soule-mod-l-surjectivity`.

**Checks.**

- Removing mT=0 changes the domain from T to T/m and cannot give the stated subgroup identification.
- The result says div in the ambient field can be nonzero even though div T=0 for finite T.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.8.2, book pp. 412–413, PDF pp. 420–421. The statement and the indicated proof, with conventions specified in this node.

### Stabilisation of primary divisibility kernels

**Target:** `ArithmeticKTheory:N.6/stabilisation-of-primary-kernels` · **Declaration:** `TauCeti.ArithmeticKTheory.N6.primaryKernelsStabilise`.

For a prime ℓ, let T=K_{2i}(O_F){ℓ} embedded in K_{2i}(F). The subgroups N_ν=ker(T→K_{2i}(F)/ℓ^ν) decrease and eventually stabilise. Their intersection and stable value equal (div K_{2i}(F)){ℓ}. This gives a finite stopping statement, but not a computable bound for ν solely from |T|.

**Hypotheses.** F is a number field; i ≥ 1; S is finite whenever O_S occurs.

**Proof plan.**

1. Finite T has no infinite strictly descending chain.
2. Prime-to-ℓ multiplication is an automorphism on an ℓ-primary element, so divisibility by every ℓ power is equivalent to divisibility by every positive integer.
3. Use Soulé and the finite residue groups to put all divisible elements into K_{2i}(O_F).

**Dependencies.** `ArithmeticKTheory:N.6/divisible-subgroup`, `ArithmeticKTheory:N.5/soule-theorem`, `ArithmeticKTheory:N.3/finiteness-and-ranks-combined`, `ArithmeticKTheory:N.6/finite-coefficient-divisibility-kernel`.

**Checks.**

- A long plateau does not by itself certify that the stable value has been reached; an independent identification is required.

**Source.** [Weibel.Wild.2004](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/wildkernel.pdf), Corollary 4.6 and proof, preprint p. 13. The statement and the indicated proof, with conventions specified in this node.

### The positive even K-subgroup

**Target:** `ArithmeticKTheory:N.6/positive-even-k-subgroup` · **Declaration:** `TauCeti.ArithmeticKTheory.N6.positiveEvenK`.

Define K⁺_{2i}(F) as the kernel of the map to the finite real symbol groups (Z/2)^{r₁} when i≡1 mod 4, and as K_{2i}(F) otherwise. Define K⁺_{2i}(O_{F,S}) by inverse image under the field map. This is the paper’s positive K-group, not positive étale cohomology.

**Hypotheses.** F is a number field; i ≥ 1; S is finite whenever O_S occurs.

**Proof plan.**

1. Use the real comparison maps supplied by M.7, zero outside i≡1 mod 4.
2. Form their joint kernel and pull back along O_S→F.

**Dependencies.** `ArithmeticKTheory:N.5/the-real-case-modulo-eight`, `MotivicEtaleKTheory:M.7`, `K2SymbolsBrauer:T.5/real-sign-symbol`.

**Uses.** Weibel Lemma 0.3 and Corollary 0.4: Supply the middle group of the real-corrected Moore sequence. ArithmeticKTheory:N.8: Distinguish the real-sign obstruction from finite-place computations.

**API.**

- `TauCeti.ArithmeticKTheory.N6.positiveEvenK_mem` (characterisation): x∈K⁺ iff all real symbols of x vanish.
- `TauCeti.ArithmeticKTheory.N6.positiveEvenK_of_no_real_places` (simp): For a totally imaginary field K⁺=K.
- `TauCeti.ArithmeticKTheory.N6.positiveEvenK_ring_comap` (compatibility): The ring positive subgroup is the comap of the field positive subgroup.
- `TauCeti.ArithmeticKTheory.N6.positiveEvenK_of_other_residue` (simp): If i mod 4≠1, K⁺=K.

**Unit tests.**

- `TauCeti.ArithmeticKTheory.N6.positiveK_rational_symbol`: The class {−1,−1} in K₂(Q) is outside K₂⁺(Q).
- `TauCeti.ArithmeticKTheory.N6.positiveK_imaginary`: K₂⁺(Q(i))=K₂(Q(i)).
- `TauCeti.ArithmeticKTheory.N6.positiveK_degree_four`: K₄⁺(F)=K₄(F), including fields with real places.

**Checks.**

- Positive means the real symbol vanishes, rather than every element of F being positive.

**Source.** [Weibel.Wild.2004](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/wildkernel.pdf), Notation after Definition 0.2, preprint p. 2. The statement and the indicated proof, with conventions specified in this node.

### The finite local symbol family

**Target:** `ArithmeticKTheory:N.6/local-symbol-family` · **Declaration:** `TauCeti.ArithmeticKTheory.N6.localSymbolFamily`.

For each finite place v construct λ_{i,v}:K_{2i}(F)→K_{2i}(F_v)→D_i(F_v), where D_i(F_v)=⊕_ℓ H²(F_v,Z_ℓ(i+1)) is the finite local quotient. Its order is w_i(F_v); the paper writes it as μ^{⊗i}(F_v) after cyclic-group identifications. Add the real Z/2 symbols only for i≡1 mod 4. The joint map initially lands in a product over all places; on K⁺ its finite support is a theorem of the Moore sequence. Cohomological corestriction is not silently equated with the ordinary norm on a twisted root module.

**Hypotheses.** F is a number field; i ≥ 1; S is finite whenever O_S occurs.

**Proof plan.**

1. Compose completion with the finite-component comparison for every prime ℓ, including residue characteristic. Identify cyclic targets through local duality, not an unspecified canonical generator.
2. Combine the maps with the real comparison. The kernel definition uses the product so it does not assume finite support before proving it.

**Dependencies.** `KTheoryFiniteLocalFields:L.7/completion-map`, `KTheoryFiniteLocalFields:L.7/etale-chern-class-completion`, `KTheoryFiniteLocalFields:L.6/even-integral-k-groups`, `KTheoryFiniteLocalFields:L.6/even-completed-k-groups-are-h2`, `ArithmeticKTheory:N.4/the-w-invariant`, `MotivicEtaleKTheory:M.7`, `K2SymbolsBrauer:T.2/matsumoto`, `K2SymbolsBrauer:T.5/real-sign-symbol`.

**Uses.** Weibel Definition 0.2: Define the symbol wild kernel. Weibel Lemma 0.3: Construct the global Moore sequence with exact invariant maps. ArithmeticKTheory:N.8: Bind local calculations to the maps used by the certificate.

**API.**

- `TauCeti.ArithmeticKTheory.N6.localSymbolFamily_apply` (projection): The v-component is the completion map followed by the local finite quotient.
- `TauCeti.ArithmeticKTheory.N6.localSymbolFamily_restriction` (functoriality): Restriction to E/F commutes with each local component at w|v.
- `TauCeti.ArithmeticKTheory.N6.localSymbolFamily_transfer` (functoriality): The v-component of transfer equals the sum of the local corestrictions over w|v.
- `TauCeti.ArithmeticKTheory.N6.localSymbolFamily_degree_two` (compatibility): At i=1 this is the full Hilbert-symbol map after Matsumoto’s identification.
- `TauCeti.ArithmeticKTheory.N6.localSymbolFamily_map_zero` (simp): The joint additive symbol map sends zero to zero in the product of local targets.
- `TauCeti.ArithmeticKTheory.N6.localSymbolFamily_map_add` (simp): The joint symbol of x+y is the sum of the joint symbols of x and y.
- `TauCeti.ArithmeticKTheory.N6.localSymbolFamily_ext` (extensionality): Two joint symbol maps are equal exactly when all their component homomorphisms are equal.

**Unit tests.**

- `TauCeti.ArithmeticKTheory.N6.localSymbols_rational_minus_one`: At the real place and at 2 the symbol of {−1,−1} is nonzero.
- `TauCeti.ArithmeticKTheory.N6.localSymbols_no_real_term`: For i=2 the real finite symbol target is zero.
- `TauCeti.ArithmeticKTheory.N6.localSymbols_unramified_residue`: Away from ℓ, the ℓ-primary finite component is the Soulé boundary followed by the finite-field identification.
- `TauCeti.ArithmeticKTheory.N6.localSymbols_dyadic_degree_four`: For F_v=Q₂ and i=2, |D_i(F_v)|=24 and |D_i(F_v){2}|=8; for i=1 the full order is 2. A quotient keeping only the dyadic component fails this test.

**Checks.**

- For i=1 the map agrees with the full norm-residue symbol of L.7.
- Over Q₂ the degree-four full finite quotient has order 24: its dyadic primary part has order 8 and its odd part has order 3. The degree-two full quotient has order 2.

**Source.** [Weibel.Wild.2004](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/wildkernel.pdf), Dwyer–Friedlander maps preceding Definition 0.2, preprint p. 2. The statement and the indicated proof, with conventions specified in this node. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.3(c), Example VI.2.3.1 and Proposition VI.7.3, book pp. 471, 509, PDF pp. 479, 517. The full local quotient has order w_i(E), including its residue-field prime-to-p factor. For Q₂ and i=2 this is 3·8=24.

### The higher symbol wild kernel

**Target:** `ArithmeticKTheory:N.6/symbol-wild-kernel` · **Declaration:** `TauCeti.ArithmeticKTheory.N6.symbolWildKernel`.

Define WK^sym_{2i}(F)=ker λ_i, where λ_i is the product of the finite local symbols and the applicable real symbols. It is a subgroup of K⁺_{2i}(F). This is Weibel Definition 0.2. The parent tame-and-wild-kernels node defines WK^raw by vanishing in the full completion K-groups; keep both names until the comparison is proved.

**Hypotheses.** F is a number field; i ≥ 1; S is finite whenever O_S occurs.

**Proof plan.**

1. Take the additive-homomorphism kernel of the joint symbol map.
2. Expose membership as simultaneous vanishing; functoriality follows from the restriction and transfer formulas of the symbol family.

**Dependencies.** `ArithmeticKTheory:N.6/local-symbol-family`, `ArithmeticKTheory:N.6/positive-even-k-subgroup`, `K2SymbolsBrauer:T.5/k2-of-the-integers`, `K2SymbolsBrauer:T.5/k2-of-the-rationals`.

**Uses.** Weibel Theorem A: Its wild kernel is the symbol kernel. ArithmeticKTheory:N.8: Test generators against local and real maps. IntegralIwasawaTheory:I.10: Match the finite kernel with the chosen cohomological local conditions.

**API.**

- `TauCeti.ArithmeticKTheory.N6.symbolWildKernel_mem` (characterisation): x belongs iff every finite and real symbol vanishes.
- `TauCeti.ArithmeticKTheory.N6.symbolWildKernel_le_positive` (structure): WK^sym≤K⁺.
- `TauCeti.ArithmeticKTheory.N6.symbolWildKernel_restriction` (functoriality): Restriction carries WK^sym(F) into WK^sym(E).
- `TauCeti.ArithmeticKTheory.N6.symbolWildKernel_transfer` (functoriality): Transfer carries WK^sym(E) into WK^sym(F).
- `TauCeti.ArithmeticKTheory.N6.symbolWildKernel_degree_two` (compatibility): WK₂^sym(F)=WK₂^raw(F).
- `TauCeti.ArithmeticKTheory.N6.symbolWildKernel_lift` (universal-property): If f:C→K_{2i}(F) is an additive homomorphism and every local symbol of f(c) vanishes, f has a unique additive lift to WK^sym whose composite with the subgroup inclusion is f.
- `TauCeti.ArithmeticKTheory.N6.symbolWildKernel_lift_coe` (simp): The subgroup inclusion composed with symbolWildKernel_lift is the given f, elementwise.
- `TauCeti.ArithmeticKTheory.N6.symbolWildKernel_lift_unique` (universal-property): Any additive lift whose composite with the subgroup inclusion is f equals symbolWildKernel_lift.

**Unit tests.**

- `TauCeti.ArithmeticKTheory.N6.symbolWild_rational`: WK₂^sym(Q)=0.
- `TauCeti.ArithmeticKTheory.N6.symbolWild_tame_nonexample`: K₂(Z) has the nonzero class {−1,−1}, while WK₂^sym(Q) does not.
- `TauCeti.ArithmeticKTheory.N6.symbolWild_special_minus_fourteen`: For F=Q(√−14), {−1,−1} lies in WK₂^sym(F) and is outside div K₂(F).

**Checks.**

- In degree two it agrees with the parent raw kernel; in higher degree equality requires the separate comparison node.

**Source.** [Weibel.Wild.2004](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/wildkernel.pdf), Definition 0.2, preprint p. 2. The statement and the indicated proof, with conventions specified in this node.

### The higher global Moore sequence

**Target:** `ArithmeticKTheory:N.6/global-moore-sequence` · **Declaration:** `TauCeti.ArithmeticKTheory.N6.globalMooreSequence`.

For i≥1 there is an exact sequence 0→WK^sym_{2i}(F)→K⁺_{2i}(F)→⊕_{v finite}D_i(F_v)→D_i(F)→0. Here D_i(F)=H⁰(F,Q/Z(−i))^D, a finite cyclic group of order w_i(F), and the last map is the sum of local invariant/corestriction maps. K⁺ can be replaced by K when F is totally imaginary or i mod 4≠1. The finite local symbols of each element have finite support.

**Hypotheses.** F is a number field; i ≥ 1; S is finite whenever O_S occurs.

**Proof plan.**

1. Prime by prime pass the final Poitou–Tate terms to continuous coefficients and then to the union of finite S; justify the limit using finite cohomology and Mittag–Leffler.
2. Use M.7’s surjectivity onto H² for ℓ odd, and its modified/positive real-corrected map for ℓ=2.
3. Read finite support from the S-integer localisation diagram and collect the primary sequences; the final dual group is identified with the paper’s cyclic root target only after specifying the identifications.

**Dependencies.** `ArithmeticKTheory:N.6/symbol-wild-kernel`, `ArithmeticKTheory:N.6/positive-even-k-subgroup`, `ArithmeticKTheory:N.6/local-symbol-family`, `ArithmeticGaloisDuality:R02.4/poitou-tate`, `ArithmeticGaloisDuality:R02.1/tate-inverse-limit`, `MotivicEtaleKTheory:M.2`, `MotivicEtaleKTheory:M.7`.

**Checks.**

- The real symbols cannot be omitted when i≡1 mod 4.
- The right-hand map is surjective; it is not an arbitrary sum of identifications with Z/w.

**Source.** [Weibel.Wild.2004](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/wildkernel.pdf), Lemma 0.3 and proof, preprint pp. 2–3. The statement and the indicated proof, with conventions specified in this node.

### The primary S-integer Moore sequence

**Target:** `ArithmeticKTheory:N.6/primary-s-integer-moore-sequence` · **Declaration:** `TauCeti.ArithmeticKTheory.N6.primarySIntegerMooreSequence`.

Let ℓ be prime. There is an exact sequence 0→WK^sym_{2i}(F){ℓ}→K⁺_{2i}(O_F){ℓ}→⊕_{v|ℓ}D_i(F_v){ℓ}→D_i(F){ℓ}→0. Equivalently write K_{2i}(O_F){ℓ} in the middle and include the real symbol groups (only if ℓ=2 and i≡1 mod 4) among the local terms. Replacing O_F by O_{F,S}, with S consisting of the primes above ℓ, preserves its ℓ-primary even K-group. Enlarging S beyond those primes introduces extra residue terms and is not claimed to preserve it.

**Hypotheses.** F is a number field; i ≥ 1; S is finite whenever O_S occurs.

**Proof plan.**

1. Compare the Moore sequence with Soulé’s even localisation sequence.
2. Away from ℓ, the finite-field group K_{2i−1}(k(v)){ℓ} matches the local finite symbol target and its boundary; cancel these identical terms.
3. At v|ℓ the residue cardinality is a power of ℓ, so q_v^i−1 has no ℓ-primary part. Keep real terms using either of the two equivalent formulations.

**Dependencies.** `ArithmeticKTheory:N.6/global-moore-sequence`, `ArithmeticKTheory:N.5/soule-theorem`, `KTheoryFiniteLocalFields:L.7/boundary-completion-compatibility`, `KTheoryFiniteLocalFields:L.7/unramified-chern-class-reduction`, `KTheoryFiniteLocalFields:L.1/quillen-k-groups`.

**Checks.**

- For Q, i=1, ℓ=2, K₂(Z){2} maps nontrivially to the real and dyadic symbols and the kernel is zero.

**Source.** [Weibel.Wild.2004](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/wildkernel.pdf), Corollary 0.4 and proof, preprint pp. 2–3. The statement and the indicated proof, with conventions specified in this node.

### Orders of symbol wild kernels

**Target:** `ArithmeticKTheory:N.6/orders-of-symbol-wild-kernels` · **Declaration:** `TauCeti.ArithmeticKTheory.N6.symbolWildOrder`.

In the preceding sequence all groups are finite. The cardinality identity is |WK^sym{ℓ}|·∏_{v|ℓ}|D_i(F_v){ℓ}|=|K⁺_{2i}(O_F){ℓ}|·|D_i(F){ℓ}|. In the alternative formulation use K_{2i}(O_F){ℓ} and multiply the local product by 2^{r₁} exactly when ℓ=2 and i≡1 mod 4. Thus the order comes from an exact arithmetic diagram, not from imposing an analytic value.

**Hypotheses.** F is a number field; i ≥ 1; S is finite whenever O_S occurs.

**Proof plan.**

1. Multiply cardinalities of the two short exact sequences obtained from the Moore sequence.
2. Use N.4 root orders and the integral K-group order certificate as independent inputs; include the real term in the alternative formula.

**Dependencies.** `ArithmeticKTheory:N.6/primary-s-integer-moore-sequence`, `ArithmeticKTheory:N.3/finiteness-and-ranks-combined`, `ArithmeticKTheory:N.6/certificate-driven-computation`.

**Checks.**

- The positive and full-group versions give the same answer.
- Use multiplicative equality to avoid unchecked division of natural numbers.

**Source.** [Weibel.Wild.2004](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/wildkernel.pdf), Corollary 0.4; index formula in its proof, preprint p. 3. The statement and the indicated proof, with conventions specified in this node.

### The arithmetic cohomological wild kernel

**Target:** `ArithmeticKTheory:N.6/cohomological-wild-kernel` · **Declaration:** `TauCeti.ArithmeticKTheory.N6.cohomologicalWildKernel`.

For ℓ prime and S containing the places above ℓ, define Sha²_{i,ℓ}(F)=ker(H²_et(O_{F,S},Z_ℓ(i+1))→∏_{v∈S∪S∞}H²(F_v,Z_ℓ(i+1))). Define finite-level kernels with μ_{ℓ^ν}^{⊗(i+1)} separately. This is the specialisation of SelmerIwasawaCohomology L2’s kernel construction, with strict zero local conditions. It is independent of S after the unramified comparisons are proved. Passage from the finite kernels to the continuous kernel uses the supplied finite-cohomology inverse-limit theorem; ordinary, modified and positive H² are distinct carriers.

**Hypotheses.** F is a number field; i ≥ 1; S is finite whenever O_S occurs.

**Proof plan.**

1. Specialise the exact module-generic selmer-data and selmer-kernel nodes in degree two, with all local conditions zero and the actual cohomology restriction maps.
2. Apply R02.3/h1-finite and the local finite-cohomology hypotheses to remove the lim¹ terms in R02.1/tate-inverse-limit. The inverse limit preserves kernels; only then identify the continuous kernel. Use the unramified degree-two residue diagrams to compare S.

**Dependencies.** `SelmerIwasawaCohomology:L2/selmer-data`, `SelmerIwasawaCohomology:L2/selmer-kernel`, `SelmerIwasawaCohomology:L2/selmer-functoriality`, `ArithmeticGaloisDuality:R02.3/h1-finite`, `ArithmeticGaloisDuality:R02.1/tate-inverse-limit`, `ArithmeticGaloisDuality:R02.4/poitou-tate`, `MotivicEtaleKTheory:M.2`, `mathlib:Rep.of`, `mathlib:groupCohomology`, `mathlib:PadicInt`.

**Uses.** Weibel Proposition 8.1 and Theorem B: Compare symbol wild and divisible kernels with cohomological local conditions. IntegralIwasawaTheory:I.10: Export precise twists and real-place conventions for finite arithmetic specialisations.

**API.**

- `TauCeti.ArithmeticKTheory.N6.cohomologicalWildKernel_mem` (characterisation): A class belongs iff every specified localisation vanishes.
- `TauCeti.ArithmeticKTheory.N6.cohomologicalWildKernel_change_S` (equivalence): Enlarging S gives the canonical identification via unramified localisation.
- `TauCeti.ArithmeticKTheory.N6.cohomologicalWildKernel_inverse_limit` (compatibility): Sha² with continuous coefficients identifies with the inverse limit of the compatible finite-level kernels under the proved finiteness/limit hypotheses.
- `TauCeti.ArithmeticKTheory.N6.cohomologicalWildKernel_selmer` (compatibility): It is the L2 strict Selmer kernel in degree two for the twist Z_ℓ(i+1).
- `TauCeti.ArithmeticKTheory.N6.cohomologicalWildKernel_functoriality` (functoriality): A morphism of the global and local degree-two coefficient cohomology modules commuting with all localisation maps sends the strict kernel into the strict kernel; the induced maps respect identities and composition, by the imported selmer-functoriality node.

**Unit tests.**

- `TauCeti.ArithmeticKTheory.N6.cohomWild_no_real_odd_prime`: For ℓ odd, omitting the archimedean factors does not change the kernel.
- `TauCeti.ArithmeticKTheory.N6.cohomWild_real_odd_i`: For ℓ=2 and i odd, the ordinary real H² terms are Z/2 at each real place.
- `TauCeti.ArithmeticKTheory.N6.cohomWild_real_even_i`: For ℓ=2 and i even, the ordinary real H² terms with Z₂(i+1) are zero, even though finite-level real terms can occur.

**Checks.**

- The archimedean factor vanishes for ℓ odd; the dyadic real term depends on twist parity.

**Source.** [Weibel.Wild.2004](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/wildkernel.pdf), Equation (0.5), notation (0.6) and discussion, preprint p. 3. The statement and the indicated proof, with conventions specified in this node.

### Symbol and cohomological wild-kernel comparison

**Target:** `ArithmeticKTheory:N.6/symbol-cohomological-comparison` · **Declaration:** `TauCeti.ArithmeticKTheory.N6.symbolCohomologicalComparison`.

For every odd prime ℓ, and for ℓ=2 when F is totally imaginary or i mod 4≠2, the arithmetic comparison induces WK^sym_{2i}(F){ℓ}≅Sha²_{i,ℓ}(F). For ℓ=2, F real and i≡2 mod 4, it instead induces an exact sequence 0→C_{F,i}→WK^sym{2}→Sha²_{i,2}(F)→0, where C_{F,i} is the kernel of K_{2i}(O_S){2}→H²_et(O_S,Z₂(i+1)) and has order 2^ρ as in the parent integral table. The map and kernel must be retained. Here S contains all primes above 2.

**Hypotheses.** F is a number field; i ≥ 1; S is finite whenever O_S occurs. In each dyadic S-integer comparison, S contains every finite prime above 2, so 1/2 is a unit in O_{F,S}. The signature defect j is the cokernel dimension of real restriction; the author preprint already uses this convention after (8.2).

**Proof plan.**

1. Compare the primary Moore and continuous Poitou–Tate sequences using the same local comparison maps.
2. For odd i use the positive group to remove real signs; for i≡3 mod 4 identify the relevant modified H².
3. For i≡2 mod 4 keep the kernel C in (8.2), obtaining the exact sequence by a diagram chase rather than discarding it.

**Dependencies.** `ArithmeticKTheory:N.6/primary-s-integer-moore-sequence`, `ArithmeticKTheory:N.6/cohomological-wild-kernel`, `ArithmeticKTheory:N.6/even-groups-at-odd-primes`, `ArithmeticKTheory:N.6/the-two-primary-corrections`, `MotivicEtaleKTheory:M.2`, `MotivicEtaleKTheory:M.7`.

**Checks.**

- Degree four over a real field is an extension by C, not an unconditional isomorphism with Sha².

**Source.** [Weibel.Wild.2004](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/wildkernel.pdf), Proposition 8.1, equation (8.2), and final diagram, preprint pp. 20–21. The statement and the indicated proof, with conventions specified in this node.

### Special number fields

**Target:** `ArithmeticKTheory:N.6/special-number-fields` · **Declaration:** `TauCeti.ArithmeticKTheory.N6.SpecialAtTwo`.

A number field F is special if it is exceptional in the parent N.4 sense and for every dyadic prime v there is a 2-primary root of unity ζ, in compatible algebraic closures, with ζ+ζ⁻¹∈F_v but ζ+ζ⁻¹∉F. Equivalently the maximal dyadic roots of F_v(√−1) properly exceed those of F(√−1). The witnesses may depend on v. Exceptionality alone is insufficient.

**Hypotheses.** F is a number field. The definition has no degree parameter; the decomposition characterisation separately assumes odd i≥1 and sufficiently large dyadic m.

**Proof plan.**

1. Use the exceptional predicate and compatible cyclotomic/root embeddings from N.4 and I.1.
2. Express the extra local root condition at every dyadic place; prove equivalence of the real-root and adjoining-√−1 formulations using ζ²−(ζ+ζ⁻¹)ζ+1=0.

**Dependencies.** `ArithmeticKTheory:N.4/exceptional-fields-at-two`, `IntegralIwasawaTheory:I.1`, `mathlib:CyclotomicField`, `mathlib:AlgebraicClosure`, `mathlib:NumberField.FinitePlace.embedding`, `mathlib:ValuationSubring.decompositionSubgroup`.

**Uses.** Weibel Theorem 5.5 and Proposition 7.8: Choose equality or the index-two obstruction. ArithmeticKTheory:N.8: Select the correct expected wild-kernel order before issuing a certificate.

**API.**

- `TauCeti.ArithmeticKTheory.N6.specialAtTwo_exceptional` (projection): A special field is exceptional.
- `TauCeti.ArithmeticKTheory.N6.specialAtTwo_local_witness` (projection): At every dyadic prime a root witness exists.
- `TauCeti.ArithmeticKTheory.N6.specialAtTwo_iff_decomposition` (characterisation): Assume F is exceptional. For odd i and every sufficiently large 2-power m (so the splitting extension is nontrivial), F is special iff every dyadic decomposition subgroup is proper in Gal(F(μ_m^{⊗i})/F).
- `TauCeti.ArithmeticKTheory.N6.specialAtTwo_transport` (functoriality): The predicate is preserved and reflected by a number-field isomorphism.
- `TauCeti.ArithmeticKTheory.N6.specialAtTwo_iff` (constructor): F is special iff F is exceptional and, at each dyadic place, a compatible 2-primary root witness has ζ+ζ⁻¹ in the completion but outside F; witnesses are allowed to vary with the place.

**Unit tests.**

- `TauCeti.ArithmeticKTheory.N6.specialAtTwo_rational`: Q is exceptional but is not special.
- `TauCeti.ArithmeticKTheory.N6.specialAtTwo_gaussian`: Q(i) is nonexceptional and is not special.
- `TauCeti.ArithmeticKTheory.N6.specialAtTwo_minus_fourteen`: Q(√−14) is special.
- `TauCeti.ArithmeticKTheory.N6.specialAtTwo_quadratic`: For square-free d≠0,1, Q(√d) is special iff d≡−1 mod 8 with d≠−1, or d≡±2 mod 16 with d≠±2.

**Checks.**

- The property is invariant under isomorphisms of number fields and under the compatible closure choices.

**Source.** [Weibel.Wild.2004](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/wildkernel.pdf), Definition 5.2 and Remark 5.2.1, preprint p. 14. The statement and the indicated proof, with conventions specified in this node.

### The dyadic decomposition criterion

**Target:** `ArithmeticKTheory:N.6/special-dyadic-decomposition` · **Declaration:** `TauCeti.ArithmeticKTheory.N6.specialDyadicDecomposition`.

Let i be odd, F exceptional and m=2^ν sufficiently large so E=F(μ_m^{⊗i}) is nontrivial and contains √−1. Put G=Gal(E/F), M=μ_m^{⊗i}, and Z_v the decomposition group at v|2. F is special iff every Z_v is proper in G. In that case ρ₁:⊕_{v|2}H₁(Z_v,M)→H₁(G,M)≅Z/2 is zero. If F is not special, some Z_v=G and ρ₁ is a split surjection. This is the obstruction map in the symbol-kernel comparison.

**Hypotheses.** F is a number field; i ≥ 1; S is finite whenever O_S occurs.

**Proof plan.**

1. Read the cyclotomic decomposition groups using the local-root criterion.
2. Use the existing finite-group Tate/homology carriers and subgroup maps from ClassFieldTheory Layer 0 and Mathlib’s groupHomology.indIso for Shapiro. Evaluate the faithful cyclotomic-module calculations of §§3.2,3.6,3.7 in this arithmetic application.
3. Apply Shapiro to the semilocal sum; each proper subgroup gives zero on H₁, while an equal subgroup gives a split identity summand.

**Dependencies.** `ArithmeticKTheory:N.6/special-number-fields`, `IntegralIwasawaTheory:I.1`, `MotivicEtaleKTheory:M.2`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-0-audit-and-complete-the-cohomology-suppliers`, `mathlib:groupHomology.indIso`.

**Checks.**

- The real places do not enter the special-field definition; all dyadic places do.

**Source.** [Weibel.Wild.2004](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/wildkernel.pdf), Remark 5.2.1, Lemma 5.4, and Corollary 3.7, preprint pp. 10, 14. The statement and the indicated proof, with conventions specified in this node.

### The twisted residue norm test

**Target:** `ArithmeticKTheory:N.6/twisted-residue-norm-test` · **Declaration:** `TauCeti.ArithmeticKTheory.N6.twistedResidueNormTest`.

Let k=F_q, m=2^ν≥4 with q odd and i≥1, E=k(μ_m^{⊗i}), G cyclic generated by Frobenius acting on M=μ_m^{⊗i} as multiplication by q^i. The norm M_G→M^G is an isomorphism exactly when q^i≢−1 mod m; when q^i≡−1 it is zero and the invariant target has order two. For odd prime powers m the norm on this faithful cyclic module is always onto. This tests a norm on a root-twist module, not surjectivity of Eˣ→kˣ.

**Hypotheses.** k is a finite field of odd cardinality q; i≥1; m=2^ν≥4 in the dyadic test. For the odd-primary assertion m is an odd prime power coprime to q and the cyclic action is faithful on Z/m.

**Proof plan.**

1. Use the existing cyclic resolution/norm and periodicity interface of ClassFieldTheory Layer 0. Evaluate it on the faithful module Z/m with Frobenius action q^i, as in §3; no new finite-group cohomology theory is defined here.
2. When the action is inversion, 1+Frobenius=0 and the invariant group is Z/2. Otherwise the cyclic-module norm is an isomorphism, as in Lemma 3.2.
3. Compare with Mathlib’s full finite-field unit norm; its surjectivity does not imply surjectivity on the root-twist subgroup.

**Dependencies.** `mathlib:FiniteField.unitsMap_norm_surjective`, `mathlib:FiniteField.algebraMap_norm_eq_pow`, `MotivicEtaleKTheory:M.2`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-0-audit-and-complete-the-cohomology-suppliers`.

**Checks.**

- k=F₃, m=4, i=1: norm on μ₄(F₉) is zero, although the full unit norm F₉ˣ→F₃ˣ is onto.
- An even i excludes q^i≡−1 for m≥4.

**Source.** [Weibel.Wild.2004](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/wildkernel.pdf), Lemma 3.2, Lemma 3.4, and Remark 3.4.1, preprint p. 9. The statement and the indicated proof, with conventions specified in this node.

### Local norm tests for degree-two certificates

**Target:** `ArithmeticKTheory:N.6/hilbert-local-norm-certification` · **Declaration:** `TauCeti.ArithmeticKTheory.N6.hilbertLocalNormCertification`.

Let L=F_v be a finite completion and m≥2 with μ_m⊂L. For a,b∈Lˣ the Hilbert symbol (a,b)_{L,m}=1 iff b lies in N_{L(a^{1/m})/L}(L(a^{1/m})ˣ). Thus a proposed K₂ symbol class has trivial finite local m-component exactly when these local norm conditions hold. Norm membership uses the range of Units.map(Algebra.norm L), with uniformiser valuation and the unit filtration checked separately. Include the real sign test at real places. Higher K-groups use their twist-cohomology local conditions, rather than an unproved analogous Hilbert-symbol formula.

**Hypotheses.** F is a number field; i ≥ 1; S is finite whenever O_S occurs.

**Proof plan.**

1. Use local reciprocity’s norm-kernel criterion for the Kummer extension and the classical Hilbert-symbol convention from T.7.
2. Realise the norm subgroup through the existing determinant norm, not by defining a second norm. Compute unit membership against U(L,0), U(L,1), and deeper filtration steps supplied by LocalFieldsRamification.
3. For a finite presentation, test every supplied symbol relation and generator image through these same maps; real symbols remain part of the certificate.

**Dependencies.** `K2SymbolsBrauer:T.7/classical-local-symbols`, `KTheoryFiniteLocalFields:L.7/hilbert-symbol-completion`, `mathlib:Algebra.norm`, `tauceti:TauCeti.unitFiltration`, `tauceti:TauCeti.unitFiltration_zero`, `tauceti:TauCeti.unitFiltration_one`, `ArithmeticKTheory:N.6/local-symbol-family`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-6-the-local-class-formation-and-finite-local-reciprocity`.

**Checks.**

- For Q₂, (−1,−1) is nontrivial: −1 is not a norm from Q₂(i).
- For odd p, (−1,−1)_{Q_p,2}=1.
- For R, the quadratic norm subgroup from C consists of the positive elements.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Example III.6.2.3 and Theorem III.6.2.4, book pp. 232–233, PDF pp. 240–241. The statement and the indicated proof, with conventions specified in this node.

### Cyclotomic class-group descent diagrams

**Target:** `ArithmeticKTheory:N.6/cyclotomic-class-group-descent` · **Declaration:** `TauCeti.ArithmeticKTheory.N6.cyclotomicClassGroupDescent`.

Let m be a prime power, E=F(μ_m^{⊗i}), G=Gal(E/F), and S be finite containing the primes dividing m and ramified primes of E/F. Set T to the places of E above S (thus S=T/G). Over totally imaginary E, where the twist is trivial and m≠2, the Kummer/Brauer sequence is 0→Pic(O_{E,T})⊗μ_m^{⊗i}→H²(O_{E,T},μ_m^{⊗(i+1)})→M⁰→0, where M⁰ is the kernel of the sum of the local invariant targets to the global target. Its coinvariant long exact sequence has segment H₁(G,M⁰)→(Pic(O_{E,T})(i)/m)_G→H²(O_{F,S},μ_m^{⊗(i+1)})→M⁰_G→0 when the H² descent hypothesis holds. For real fields use Pic⁺ and totally positive H²₊ instead, as in §§6.8–6.9, and retain the comparison to ordinary H².

**Hypotheses.** F is a number field; i ≥ 1; S is finite whenever O_S occurs. Choose S as a finite set of finite places of F containing all primes dividing m and any ramified primes of E/F. Let T be exactly the set of places of E over S, so T is G-stable and S=T/G. For the totally positive dyadic variant take m=2^ν>2.

**Proof plan.**

1. Use M.2’s Kummer/Brauer and totally positive variants on actual twisted coefficient modules.
2. Use top-degree corestriction descent, with its cd≤2 or positive-cohomology hypothesis, and the long exact sequence for coinvariants.
3. Apply the imported finite-group homology interface and Mathlib’s groupHomology.indIso, then evaluate H₁(G,M⁰) with the faithful cyclotomic action and decomposition-group formulas. Do not replace coinvariants by invariants without the norm theorem.

**Dependencies.** `MotivicEtaleKTheory:M.2`, `IntegralIwasawaTheory:I.1`, `IntegralIwasawaTheory:I.2`, `ArithmeticGaloisDuality:R02.4/poitou-tate`, `ArithmeticKTheory:N.6/special-dyadic-decomposition`, `tauceti:TauCetiRoadmap/ClassFieldTheory#layer-0-audit-and-complete-the-cohomology-suppliers`, `mathlib:groupHomology.indIso`.

**Checks.**

- The ordinary H² coinvariant descent fails for real fields with odd i; positive H²₊ corrects it.
- The paper’s unit-sign defect in §6.6 is a separate invariant from the parent j=u−t used in VI.9.9.
- The coinvariant descent uses the matching rings O_{E,T} and O_{F,S}; an arbitrary T containing the primes above m is insufficient without T being the full inverse image of S.

**Source.** [Weibel.Wild.2004](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/wildkernel.pdf), Proposition 4.1, Application 4.2, Proposition 6.8, equation (6.9), preprint pp. 11, 16. The statement and the indicated proof, with conventions specified in this node.

### The cyclotomic class-group image of divisible elements

**Target:** `ArithmeticKTheory:N.6/cyclotomic-divisible-image` · **Declaration:** `TauCeti.ArithmeticKTheory.N6.cyclotomicDivisibleImage`.

For m=ℓ^ν sufficiently large, E=F(μ_m^{⊗i}), the image of the twisted Picard coinvariants (Pic(O_E[1/ℓ])(i)/m)_G in K_{2i}(O_F){ℓ} is (div K_{2i}(F)){ℓ} in the cohomological-dimension-two cases (ℓ odd, or ℓ=2 and F totally imaginary). For real dyadic fields its image in H²_M(F,Z_(2)(i+1)) is div of that motivic group, using the ordinary Picard localisation diagram. The exceptional odd dyadic case is conditional on the corrected cyclotomic localisation input recorded as gap G2; unrestricted Lemma 4.4 is not an admissible prerequisite.

**Hypotheses.** F is a number field; i ≥ 1; S is finite whenever O_S occurs.

**Proof plan.**

1. Compare ring-to-field finite-coefficient localisation in E and F, with corestriction, as in Theorems 4.5 and 6.11.
2. For odd ℓ, even i or nonexceptional F, the residue norms are onto and no prime-selection lemma is needed. In the remaining exceptional odd dyadic case use only prime-selection statements compatible with the cyclotomic and ideal-class conditions; the unrestricted source lemma has the explicit counterexample in E1. The required correction is G2.
3. Identify the finite-coefficient kernel with the class-group image, then use stabilisation. For real fields first use the motivic ring-to-field injection and finite cohomology supplied by M.7 (§7.4).

**Dependencies.** `ArithmeticKTheory:N.6/stabilisation-of-primary-kernels`, `ArithmeticKTheory:N.6/cyclotomic-class-group-descent`, `MotivicEtaleKTheory:M.2`, `MotivicEtaleKTheory:M.7`.

**Checks.**

- An effective exponent bound must be proved separately; “sufficiently large” is a theorem quantifier.
- No use of the false unrestricted prime-selection lemma is allowed.

**Source.** [Weibel.Wild.2004](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/wildkernel.pdf), Theorem 4.5, Corollary 4.6, Theorem 6.11 and Corollary 7.5, preprint pp. 12–13, 17–18. The statement and the indicated proof, with conventions specified in this node.

### The imaginary equality cases

**Target:** `ArithmeticKTheory:N.6/imaginary-nonexceptional-comparison` · **Declaration:** `TauCeti.ArithmeticKTheory.N6.imaginaryEqualityCases`.

If F is totally imaginary and either i is even or F is not special, div K_{2i}(F)=WK^sym_{2i}(F). At odd primes this equality holds for every number field. The odd-prime argument is the same finite cyclotomic class-group image argument; it does not require a separately assumed Schneider theorem.

**Hypotheses.** F is a number field; i ≥ 1; S is finite whenever O_S occurs.

**Proof plan.**

1. For even i or nonexceptional F the faithful cyclic norm calculation makes the coinvariant local sequence exact, identifying the wild kernel with the twisted Picard quotient.
2. For exceptional odd i use a dyadic full decomposition group when F is nonspecial; ρ₁ is split onto and the same exactness holds.
3. Identify that image with div using the preceding node. Repeat at odd primes with the cyclic odd-primary calculation.

**Dependencies.** `ArithmeticKTheory:N.6/cyclotomic-divisible-image`, `ArithmeticKTheory:N.6/cyclotomic-class-group-descent`, `ArithmeticKTheory:N.6/primary-s-integer-moore-sequence`, `ArithmeticKTheory:N.6/special-dyadic-decomposition`, `ArithmeticKTheory:N.6/twisted-residue-norm-test`.

**Checks.**

- Q(i) belongs to the nonexceptional case.
- Q(√−14) and odd i are excluded from the equality case.

**Source.** [Weibel.Wild.2004](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/wildkernel.pdf), Proposition 4.7, Theorem 5.5(1), Remarks 4.3.1 and 4.6.1, preprint pp. 11, 13–14. The statement and the indicated proof, with conventions specified in this node.

### The imaginary special-field obstruction

**Target:** `ArithmeticKTheory:N.6/imaginary-special-obstruction` · **Declaration:** `TauCeti.ArithmeticKTheory.N6.imaginarySpecialObstruction`.

If F is totally imaginary and special and i is odd, there is an exact sequence 0→div K_{2i}(F)→WK^sym_{2i}(F)→Z/2→0. The last map is the cyclotomic homology obstruction induced by ρ₁=0 and H₁(G,M)=Z/2; it is surjective. A splitting is not asserted in general.

**Hypotheses.** F is a number field; i ≥ 1; S is finite whenever O_S occurs.

**Proof plan.**

1. Compare the two coinvariant exact sequences (3.1.1) and (4.2) with the Moore sequence.
2. With every dyadic decomposition group proper, ρ₁ vanishes; the sole defect is H₁(G,M)≅Z/2.
3. The class-group image is div by the preceding localisation/stabilisation node, so the induced defect quotient is Z/2.

**Dependencies.** `ArithmeticKTheory:N.6/cyclotomic-divisible-image`, `ArithmeticKTheory:N.6/cyclotomic-class-group-descent`, `ArithmeticKTheory:N.6/special-dyadic-decomposition`, `ArithmeticKTheory:N.6/primary-s-integer-moore-sequence`.

**Checks.**

- For Q(√−14) and i=1, the class {−1,−1} maps to the nonzero defect and is outside div.

**Source.** [Weibel.Wild.2004](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/wildkernel.pdf), Lemma 5.4 and Theorem 5.5(2), preprint p. 14. The statement and the indicated proof, with conventions specified in this node.

### The real motivic divisibility obstruction

**Target:** `ArithmeticKTheory:N.6/real-motivic-obstruction` · **Declaration:** `TauCeti.ArithmeticKTheory.N6.realMotivicObstruction`.

Let F have real places and i≥1. In H²_M(F,Z_(2)(i+1)), the subgroup div is contained in Sha²_{i,2}(F), using the finite S-integer injection and the motivic/continuous comparison. The quotient is zero if i is even or F is nonspecial, and is Z/2 if i is odd and F is special. In the even case retain the exact real-corrected sequence of Proposition 7.6; in the odd case the quotient is the homology defect of (7.7).

**Hypotheses.** F is a number field; i ≥ 1; S is finite whenever O_S occurs.

**Proof plan.**

1. Import totally positive cohomology, its descent and Kummer sequences (§6), and the finite-motivic/étale comparison and localisation injection (§7.1–7.4).
2. Use the class-group image description of div from §7.5.
3. For even i the cyclic homology vanishes and gives exactness; for odd i the dyadic decomposition map gives zero or one-dimensional homology, exactly as in the imaginary case.

**Dependencies.** `ArithmeticKTheory:N.6/cohomological-wild-kernel`, `ArithmeticKTheory:N.6/cyclotomic-divisible-image`, `ArithmeticKTheory:N.6/cyclotomic-class-group-descent`, `ArithmeticKTheory:N.6/special-dyadic-decomposition`, `MotivicEtaleKTheory:M.2`, `MotivicEtaleKTheory:M.7`.

**Checks.**

- The positive-cohomology supplier uses a real-place mapping cone, not the kernel H̃² of ordinary restriction.
- The theorem does not assume all real fields are totally real.

**Source.** [Weibel.Wild.2004](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/wildkernel.pdf), Theorem B and Propositions 7.6, 7.8, preprint pp. 3, 19. The statement and the indicated proof, with conventions specified in this node.

### Hidden real K-classes are divisible

**Target:** `ArithmeticKTheory:N.6/hidden-real-k-classes-are-divisible` · **Declaration:** `TauCeti.ArithmeticKTheory.N6.hiddenRealClassesDivisible`.

For F with real places and i≡2 mod 4, the kernel C_{F,i} of K_{2i}(O_S){2}→H²_et(O_S,Z₂(i+1)), of order 2^ρ, lies in div K_{2i}(F). In particular the image of K⁽M⁾₄(F) in K₄(F) is divisible in the ambient field group. No claim is made that the finite subgroup C itself is a divisible group. Here S contains all primes above 2.

**Hypotheses.** F is a number field; i ≥ 1; S is finite whenever O_S occurs. In each dyadic S-integer comparison, S contains every finite prime above 2, so 1/2 is a unit in O_{F,S}. The signature defect j is the cokernel dimension of real restriction; the author preprint already uses this convention after (8.2).

**Proof plan.**

1. Use M.7’s motivic spectral edge sequence (8.3). After the cyclotomic extension E the relevant d₂ is onto, so the H⁴ edge classes vanish modulo each sufficiently large 2-power.
2. Use the induced real-embedding module comparison of Lemma 8.6 to lift each class in C to such an edge class over E.
3. Transfer its m-divisibility back to F, then intersect over all powers of two; odd divisibility is automatic on the two-primary subgroup.

**Dependencies.** `ArithmeticKTheory:N.6/the-two-primary-corrections`, `ArithmeticKTheory:N.6/stabilisation-of-primary-kernels`, `MotivicEtaleKTheory:M.7`, `IntegralIwasawaTheory:I.1`.

**Checks.**

- A finite nonzero subgroup may consist of elements divisible in a larger group.
- This input prevents the degree-four invisible kernel from being discarded when comparing wild groups.

**Source.** [Weibel.Wild.2004](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/wildkernel.pdf), Proposition 8.4, Lemmas 8.5–8.6, Theorem 8.7, preprint pp. 20–21. The statement and the indicated proof, with conventions specified in this node.

### Weibel’s symbol-kernel divisibility theorem

**Target:** `ArithmeticKTheory:N.6/weibel-symbol-divisibility-theorem` · **Declaration:** `TauCeti.ArithmeticKTheory.N6.weibelSymbolDivisibility`.

**Planet:** Weibel divisibility theorem.

For every number field F and i≥1, div K_{2i}(F)⊆WK^sym_{2i}(F) with quotient Z/2 if F is special and i is odd, and zero otherwise. This assembles Theorem A for the paper’s symbol kernel. Its proof depends on the corrected localisation input G2; the parent’s raw completion-kernel version further depends on G1.

**Hypotheses.** F is a number field; i ≥ 1; S is finite whenever O_S occurs.

**Proof plan.**

1. Separate odd primes and the totally imaginary dyadic case, using the two imaginary comparison nodes.
2. For real F and i mod 4≠2 compare the symbol kernel with Sha² and apply the real motivic defect theorem.
3. For i≡2 mod 4 use the final diagram on p.21: the same kernel C lies in div and in the symbol wild kernel; quotient comparisons and the five lemma give equality.
4. Collect the primary components of the finite wild kernel.

**Dependencies.** `ArithmeticKTheory:N.6/imaginary-nonexceptional-comparison`, `ArithmeticKTheory:N.6/imaginary-special-obstruction`, `ArithmeticKTheory:N.6/real-motivic-obstruction`, `ArithmeticKTheory:N.6/symbol-cohomological-comparison`, `ArithmeticKTheory:N.6/hidden-real-k-classes-are-divisible`.

**Checks.**

- Special and odd i gives index exactly two, not merely at most two.
- Equality for even i includes the real degree-four correction via C.

**Source.** [Weibel.Wild.2004](https://sites.math.rutgers.edu/~weibel/archive/papers-dir/wildkernel.pdf), Theorem A, preprint p. 1; proof §§4–8, pp. 11–21. The statement and the indicated proof, with conventions specified in this node.

### The completion-kernel comparison boundary

**Target:** `ArithmeticKTheory:N.6/raw-and-symbol-kernel-boundary` · **Declaration:** `TauCeti.ArithmeticKTheory.N6.rawSymbolKernelBoundary`.

Always WK^raw_{2i}(F)⊆WK^sym_{2i}(F), since symbols factor through completion. Equality holds at i=1, by torsion of K₂(F) and Moore’s uniquely divisible local kernel, including the real comparison. For higher i, equality follows if every global torsion class with zero local finite symbols has zero image in the divisible part of every completion, and the analogous real finite-part detection holds. The existing local structure allows divisible residue-characteristic torsion, so global torsion alone does not prove this hypothesis. The unqualified higher equality remains G1.

**Hypotheses.** F is a number field; i ≥ 1; S is finite whenever O_S occurs.

**Proof plan.**

1. Inclusion is functorial factorisation of the local symbols.
2. In degree two, the image is torsion and the finite-symbol kernel is uniquely divisible; their intersection is zero. Use the real finite-symbol detection separately.
3. In higher degree, retain D_i’s possible Q_p/Z_p summands. State the additional annihilation condition exactly and request its proof; do not turn a finite quotient theorem into injectivity on torsion.

**Dependencies.** `ArithmeticKTheory:N.6/tame-and-wild-kernels`, `ArithmeticKTheory:N.6/symbol-wild-kernel`, `KTheoryFiniteLocalFields:L.3/moore-theorem`, `KTheoryFiniteLocalFields:L.6/even-integral-k-groups`, `KTheoryFiniteLocalFields:L.7/hilbert-symbol-completion`, `MotivicEtaleKTheory:M.7`.

**Checks.**

- Any proposed proof using only “K_{2i}(F) is torsion” must fail the test D_i containing p-divisible torsion.
- The parent raw-kernel Theorem A is not certified by the symbol theorem until G1 is discharged.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.8.2, book p. 413, PDF p. 421; VI.7.3 and Warning VI.7.5, book pp. 509–510, PDF pp. 517–518. The higher local divisible part may have p-primary torsion (Warning VI.7.5); torsion of a global class does not by itself imply vanishing in that part. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Moore’s Theorem III.6.2.4, book p. 233, PDF p. 241. The separate degree-two torsion-free local kernel input.

### Arithmetic evidence for finite-order certificates

**Target:** `ArithmeticKTheory:N.6/arithmetic-evidence-for-certificates` · **Declaration:** `TauCeti.ArithmeticKTheory.N6.arithmeticCertificateEvidence`.

Instantiate the parent order-certificate and certificate-driven-computation nodes using the arithmetic cohomology tables, exact local maps and class-group data above. A finite presentation supplies a proved surjection P→K_{2i}(O_S), while the cohomological and local computations supply an independently proved lower bound. Their matching cardinalities certify an isomorphism. Two-rank data certify only the number of two-primary factors; full order requires the complete H² cardinality and, for real n≡4 mod 8, ρ. The extension determines the group structure, while exactness already gives its cardinality as 2^ρ·|H²|. A wild-kernel certificate uses the symbol maps and the Moore exact sequence; a higher raw-kernel certificate requires G1.

**Hypotheses.** F is a number field; i ≥ 1; S is finite whenever O_S occurs.

**Proof plan.**

1. Bind all presentation generators and relations to the actual K-group maps used by the parent certificate.
2. Use arithmetic computations through exact comparison theorems to obtain the lower bound; local norm calculations are used in degree two and local twist-cohomology calculations in higher degrees.
3. Require equality of independent bounds and retain extension data. Export the evidence to N.8 and I.10 without using a zeta value as an imposed group order.

**Dependencies.** `ArithmeticKTheory:N.6/order-certificate`, `ArithmeticKTheory:N.6/certificate-driven-computation`, `ArithmeticKTheory:N.6/even-two-ranks-from-arithmetic`, `ArithmeticKTheory:N.6/orders-of-symbol-wild-kernels`, `ArithmeticKTheory:N.6/hilbert-local-norm-certification`, `ArithmeticKTheory:N.6/raw-and-symbol-kernel-boundary`.

**Checks.**

- Z/2 and Z/4 both have two-rank one, so a rank alone cannot certify either order.
- The certificate engine is imported, not redefined.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.9.9–9.11, book pp. 522–525, PDF pp. 530–533. The statement and the indicated proof, with conventions specified in this node.

### Degree and twist convention for Adams pieces

**Target:** `ArithmeticKTheory:N.6/bott-cohomology-slot` · **Declaration:** `ArithmeticKTheory.bottCohomologySlot`.

For j∈Z and ε∈{+1,−1}, define the slot of the ε-piece of degree 2j to be (s,t)=(0,j) if ε=(−1)^j and (s,t)=(2,j+1) otherwise. Its interpretation is H^s_et(X,Z/q(t)). The slot stores indices only; it does not define a new K-group, twist, cohomology carrier or Adams eigenspace.

**Hypotheses.** q=p^r with p odd prime and r≥1 when the slot is interpreted in the arithmetic tables. Positive and negative refer to dualization ψ^(−1), not complex conjugation on the cyclotomic field.

**Proof plan.**

1. In M.7 descent E2^(s,2t)=H^s(X,Z/q(t)), the total degree is 2t−s. The only possible even-degree terms for a dimension-two arithmetic scheme have s=0 or 2.
2. Adams weights make the signs (−1)^j and (−1)^(j+1) opposite. The two explicit cases therefore determine the slot.

**Dependencies.** `MotivicEtaleKTheory:M.7/bott-etale-descent`, `MotivicEtaleKTheory:M.7/etale-adams-weights`.

**Uses.** N.6, the two all-degree Bott tables: selects the exact twist and cohomological degree without a natural-number truncation. ArithmeticKTheoryPartII:AK2.0: fixes all integer k, including k=0 and negative k, for the requested eigenspace contracts.

**API.**

- `bottCohomologySlot` (data): The pair (s,t) determined by the two cases above.
- `bottCohomologySlot_totalDegree` (characterisation): 2t−s=2j for either sign.
- `bottCohomologySlot_sign` (characterisation): The Adams sign (−1)^t equals ε.
- `bottCohomologySlot_period` (simp): Replacing j by j+2 keeps s and increases t by 2.
- `bottCohomologySlot_compat` (compatibility): Interpret the selected piece using the native Module.End.eigenspace of ψ^(−1) at scalar ±1, and M.7’s Z/q(t), with no duplicate eigenspace or Tate-twist carrier.

**Unit tests.**

- `zero_positive`: j=0, ε=+1 gives (0,0); its total degree is 0.
- `zero_negative`: j=0, ε=−1 gives (2,1), not (2,0).
- `negative_degree`: j=−1 gives (2,0) for + and (0,−1) for −; negative twists are preserved.
- `degree_two`: j=1 gives (2,2) for + and (0,1) for −.

**Checks.**

- At degree zero the positive slot is H0(0), the negative slot H2(1).
- At degree −2 the positive slot is H2(0), the negative slot H0(−1).

**Source.** [FGV.2022](https://link.springer.com/content/pdf/10.1007/s00222-022-01127-8.pdf), Lemmas 2.11 and 2.14, pp. 244 and 246; descent (2.6), pp. 241–242. The even-degree tables specify the cohomological degree and twist of each dualization eigenspace.

### Canonical arithmetic Adams edge splitting

**Target:** `ArithmeticKTheory:N.6/bott-adams-edge-splitting` · **Declaration:** `ArithmeticKTheory.bott_adams_edge_splitting`.

**Planet:** Arithmetic Adams splitting.

Let q=p^r with p odd and r≥1, X=Spec Z[1/p] or Spec Z[ζ_q,1/p]. For every j∈Z, the Bott/étale descent filtration gives 0→H²_et(X,Z/q(j+1))→K^β_(2j)(X;Z/q)→H⁰_et(X,Z/q(j))→0. The kernel has dualization sign (−1)^(j+1), the quotient sign (−1)^j. Since 2 is a unit modulo q, restriction to these eigenspaces canonically splits this exact sequence. In odd degree, the sole term gives K^β_(2j−1)(X;Z/q)≃H¹_et(X,Z/q(j)), with sign (−1)^j. The equivalences are the descent edge maps on the indicated eigenspaces.

**Hypotheses.** K^β is M.7’s Bott-inverted finite coefficient spectrum, indexed over all integers. The schemes have odd-p étale cohomological dimension ≤2; this exact global-arithmetic contract is requested below. No associative ring structure on a mod-3 Moore spectrum is assumed; Bott inversion and operations are supplied at spectrum level by M.7.

**Proof plan.**

1. Import the convergent descent sequence and cd≤2. Odd internal rows vanish. All d_r are zero: for r even their target internal row is odd, and for r odd≥3 they leave the cohomological strip. The filtration has a single odd term and two even terms.
2. Use M.7 Adams weights. On total degree 2j, the H² and H⁰ terms have opposite eigenvalues. For the involution T=ψ^(−1), the endomorphisms (1±T)/2 are complementary idempotents over Z/q.
3. The eigenpart of the quotient sign maps isomorphically to H⁰; the other eigenpart is exactly H². Inverting that restricted edge map gives the unique sign-compatible splitting. Maps of the descent filtration commuting with T preserve it.

**Dependencies.** `ArithmeticKTheory:N.6/bott-cohomology-slot`, `MotivicEtaleKTheory:M.7/bott-etale-descent`, `MotivicEtaleKTheory:M.7/etale-adams-weights`, `ArithmeticGaloisDuality:R02.3`, `mathlib:Module.End.eigenspace`.

**Uses.** N.6, cyclotomic and rational Bott tables: gives the canonical maps and resolves the even-degree extension. ArithmeticKTheoryPartII:AK2.0 and AK2.6: supplies eigenspaces without assuming a noncanonical abstract group splitting.

**API.**

- `bottEvenExact` (projection): The named H² inclusion and H⁰ quotient are the convergent descent edge maps in the displayed sequence.
- `bottAdamsPiece` (compatibility): Use Module.End.eigenspace ψ^(−1) ε over Z/q, rather than defining another eigenspace.
- `bottEvenEdgeEquiv` (equivalence): Restrict the edge maps to their signs to identify the two pieces with H²(j+1) and H⁰(j).
- `bottOddEdgeEquiv` (equivalence): The odd edge is K^β_(2j−1)≃H¹(j), with scalar Adams action (−1)^j.
- `bottEdge_natural` (functoriality): Any morphism of these descent filtrations commuting with ψ^(−1) commutes with the restricted edges, their inverses and the splitting; identity and composition laws follow.

**Unit tests.**

- `rank_picard_sign`: Degree zero puts the rank Z/q in + and Pic/q in −; switching these signs fails.
- `two_not_invertible`: On Z/2 with identity involution, the positive and negative eigenspaces coincide; the odd-modulus hypothesis cannot be omitted.
- `odd_weight`: Degree one has H¹(1) and negative dualization, while degree three has H¹(2) and positive dualization.
- `edge_compatibility`: The identity scheme map induces identity maps on every K and cohomology term, and the edge/splitting naturality squares commute. For a composite scheme map, the induced maps and their naturality squares compose.

**Checks.**

- At j=0 the rank class has sign + and the reduced Picard class sign −.
- No splitting by (1±T)/2 is asserted for even q.
- The odd-degree group has one sign only.

**Source.** [FGV.2022](https://link.springer.com/content/pdf/10.1007/s00222-022-01127-8.pdf), Proofs of Lemmas 2.11 and 2.14, pp. 244–247. Cohomological dimension collapses descent; the opposite dualization weights split the two even terms canonically at odd modulus.

### Cyclotomic Bott-inverted cohomology table

**Target:** `ArithmeticKTheory:N.6/cyclotomic-bott-cohomology` · **Declaration:** `ArithmeticKTheory.cyclotomic_bott_cohomology`.

For q=p^r, p an odd prime, r≥1, put X=Spec Z[ζ_q,1/p]. For every k∈Z, the canonical ψ^(−1) eigenspaces are K^β_(4k−2)(X;Z/q)^+≃H²_et(X,Z/q(2k)), K^β_(4k−2)^−≃H⁰_et(X,Z/q(2k−1)), K^β_(4k)^+≃H⁰_et(X,Z/q(2k)), and K^β_(4k)^−≃H²_et(X,Z/q(2k+1)). Also K^β_(2k−1)≃H¹_et(X,Z/q(k)), on which ψ^(−1) acts by (−1)^k. Negative twists and negative K^β degrees retain their integer meaning.

**Hypotheses.** The notation μ_q^⊗t means the étale Tate twist Z/q(t), including the dual twist for t<0. The signs are dualization eigenspaces over Z/q, with 2 invertible.

**Proof plan.**

1. Specialize bott-adams-edge-splitting to X.
2. In degree 4k−2 set j=2k−1; in degree 4k set j=2k. Substitute the two parity signs; retain the actual restricted edge equivalences.
3. Use the odd single-term edge with j=k. No bounded-below truncation is applied after Bott inversion.

**Dependencies.** `ArithmeticKTheory:N.6/bott-adams-edge-splitting`, `ArithmeticKTheory:N.6/bott-cohomology-slot`.

**Checks.**

- k=0 gives degree −2: + is H²(0) and − is H⁰(−1); degree 0: + is H⁰(0) and − is H²(1).
- k=1 gives degree 2: + is H²(2), − is H⁰(1).
- Odd degrees one and three have respectively negative and positive dualization.

**Source.** [FGV.2022](https://link.springer.com/content/pdf/10.1007/s00222-022-01127-8.pdf), Lemma 2.11 and proof, pp. 244–245. Provides the four even Adams pieces and the single odd cohomology group for every integer weight.

### Rational Bott-inverted cohomology table

**Target:** `ArithmeticKTheory:N.6/rational-bott-cohomology` · **Declaration:** `ArithmeticKTheory.rational_bott_cohomology`.

For q=p^r, p an odd prime, r≥1, put X=Spec Z[1/p]. For every k∈Z, the canonical ψ^(−1) eigenspaces are K^β_(4k−2)(X;Z/q)^+≃H²_et(X,Z/q(2k)), K^β_(4k−2)^−≃H⁰_et(X,Z/q(2k−1)), K^β_(4k)^+≃H⁰_et(X,Z/q(2k)), and K^β_(4k)^−≃H²_et(X,Z/q(2k+1)). Also K^β_(2k−1)≃H¹_et(X,Z/q(k)), on which ψ^(−1) acts by (−1)^k. Negative twists and negative K^β degrees retain their integer meaning.

**Hypotheses.** The notation μ_q^⊗t means the étale Tate twist Z/q(t), including the dual twist for t<0. The signs are dualization eigenspaces over Z/q, with 2 invertible.

**Proof plan.**

1. Specialize bott-adams-edge-splitting to X.
2. In degree 4k−2 set j=2k−1; in degree 4k set j=2k. Substitute the two parity signs; retain the actual restricted edge equivalences.
3. Use the odd single-term edge with j=k. No bounded-below truncation is applied after Bott inversion.

**Dependencies.** `ArithmeticKTheory:N.6/bott-adams-edge-splitting`, `ArithmeticKTheory:N.6/bott-cohomology-slot`.

**Checks.**

- k=0 gives degree −2: + is H²(0) and − is H⁰(−1); degree 0: + is H⁰(0) and − is H²(1).
- k=1 gives degree 2: + is H²(2), − is H⁰(1).
- Odd degrees one and three have respectively negative and positive dualization.

**Source.** [FGV.2022](https://link.springer.com/content/pdf/10.1007/s00222-022-01127-8.pdf), Lemma 2.14 and proof, pp. 246–247. Provides the four even Adams pieces and the single odd cohomology group for every integer weight.

### Ordinary-to-Bott comparison with its degree-one exception

**Target:** `ArithmeticKTheory:N.6/ordinary-to-bott-comparison-range` · **Declaration:** `ArithmeticKTheory.ordinary_to_bott_comparison_range`.

For q=p^r with p odd and r≥1, and R equal to Z or Z[ζ_q], let R′=R[1/p]. The canonical map K_i(R′;Z/q)→K^β_i(R′;Z/q) is an isomorphism for every i≥0. The map K_i(R;Z/q)→K^β_i(R;Z/q) is an isomorphism for i=0 or i≥2. In degree one localization gives K_1(R′;Z/q)≃K_1(R;Z/q)⊕Z/q; this abstract direct sum is not declared a natural splitting without a chosen prime generator. Bott-inverted localization K^β_*(R)→K^β_*(R′) is an isomorphism in all integer degrees.

**Hypotheses.** R is one of these two rings; the unique prime above p in the cyclotomic ring is principal and has residue F_p. No ordinary negative-degree comparison, and no ordinary degree-one comparison before inversion, is asserted.

**Proof plan.**

1. Use M.7/s-integer-comparison-range for i≥1 over R′, with finite coefficients; the degree-zero comparison is injective.
2. The degree-zero filtration has H⁰(X,Z/q)=Z/q and H²(X,μ_q)=Pic(R′)/q: the Brauer q-part vanishes because there is one finite place in S and odd coefficients have no real-place contribution. The Kummer exact sequence and global Brauer reciprocity provide this exact calculation, requested from ArithmeticGaloisDuality R02.3. Both K0(R′)/q and the target have order q·#(Pic(R′)/q), so the injection is onto.
3. Localization at the single p-prime has coefficient residue K(F_p;Z/q) concentrated in degree zero. Its map to K0(R;Z/q) vanishes because the prime is principal. The long exact sequence changes ordinary coefficients only in degree one. The abstract extra cyclic summand follows from the unit valuation at the chosen principal generator.
4. The residue spectrum becomes zero after Bott inversion, hence the inverted localization is an equivalence in all degrees. Combine with the two tables; no associative product at q=3 is introduced in this proof.

**Dependencies.** `ArithmeticKTheory:N.6/cyclotomic-bott-cohomology`, `ArithmeticKTheory:N.6/rational-bott-cohomology`, `MotivicEtaleKTheory:M.7/s-integer-comparison-range`, `KTheoryFiniteLocalFields:L.1/k-theory-mod-m`, `KTheoryFiniteLocalFields:L.1/quillen-k-groups`, `SchemeKTheoryOperations:S.3/dedekind-localisation-sequence`, `GeneralAlgebraicKTheory:K.7`, `ArithmeticGaloisDuality:R02.3`.

**Checks.**

- For R=Z, the new degree-one class is the valuation of p, with order q modulo q-th powers.
- For R=Z[ζ_q], use 1−ζ_q as a generator of the unique p-prime.
- k≤0 entries of the Bott tables do not become statements about ordinary negative algebraic K-groups.

**Source.** [FGV.2022](https://link.springer.com/content/pdf/10.1007/s00222-022-01127-8.pdf), Proposition 2.9 and Lemma 2.10, pp. 242–243; final assertions of Lemmas 2.11 and 2.14, pp. 244–247. The zero-degree order argument upgrades injectivity; the principal p-prime accounts for the sole ordinary localization exception.

## N.7 — Regular primes, Bernoulli numbers and character indices

Use Mathlib’s arithmetic Bernoulli numbers, with B1=−1/2. Weibel’s positive topologists’ B_k is (−1)^(k+1)B_(2k), not Mathlib’s primed convention. Regular means the prime does not divide the full cyclotomic class number. For odd p, character projectors on the mod-p class group divide by p−1, a unit modulo p; integer projectors without this inversion are not asserted. In Herbrand–Ribet the even index a corresponds to ω^(1−a), not ω^a. The unique p-prime of Q(ζ_p) has residue F_p, so inverting it adds no p-primary residue-unit term. Keep Vandiver’s real-subfield condition separate from regularity. The finite coefficient Bott-module conclusion has explicit generator degrees and an explicitly open proof input.

### The two Bernoulli conventions, and the conversion between them

**Target:** `ArithmeticKTheory:N.7/bernoulli-conventions`.

**Planet:** The arithmetic Bernoulli convention.

Fix the ARITHMETIC convention: Mathlib's bernoulli, defined by the generating series t/(e^t − 1), so B_1 = −1/2, B_2 = 1/6 and B_n = 0 for odd n > 1. Mathlib's bernoulli' (B_1 = +1/2) differs from it only at index one (bernoulli_eq_bernoulli'_of_ne_one). The SOURCE uses neither: Weibel's K-book uses the topologists' numbers B_k^top = (−1)^(k+1) B_{2k} = |B_{2k}| (k ≥ 1), all positive, with B_1^top = 1/6, B_5^top = 5/66 and B_6^top = 691/2730. Every formula quoted from the source is therefore re-indexed here by k ↦ 2k: the source's B_k is the arithmetic B_{2k} up to sign. The denominator facts are von Staudt–Clausen, which the pinned Mathlib proves: for k ≥ 1 the denominator of B_{2k} is the product of the primes p with (p − 1) | 2k, hence squarefree and divisible by 6 (Bernoulli.vonStaudt_clausen, dvd_den_bernoulli, not_sq_dvd_den_bernoulli). Separately, the source’s Kummer-congruence refinement says that if (p − 1) ∤ 2k then p does not divide the denominator of B_{2k}/k even when p | k. This refinement is an R-Iwasawa-cyclotomic/G-RegularProofs input, not a consequence already supplied by the cited pinned denominator declarations.

**Hypotheses.** k is a natural number; the numbers are rational. Mathlib supplies the arithmetic and primed conventions and their comparison. Only the light translation bernoulliTop k=(−1)^(k+1)bernoulli(2k) is introduced here; k≥1 is required for the positive-source convention. The denominator of B_(2k) uses pinned von Staudt–Clausen. Its divided-number refinement for B_(2k)/k needs the Kummer-congruence input requested in R-Iwasawa-cyclotomic. No closed formula for the numerator is asserted.

**Proof plan.**

1. Import the two pinned definitions and the conversion lemma, and fix the arithmetic convention as this roadmap's default.
2. Read the pinned von Staudt–Clausen declarations for the denominator and squarefreeness of B_(2k). Import the divided-number refinement separately from R-Iwasawa-cyclotomic; it remains in G-RegularProofs.
3. For p−1 not dividing 2k, the denominator of arithmetic B_{2k}/k is prime to p even if p divides k. At p=k=5, arithmetic B_10=5/66 has numerator divisible by5, while B_10/5=1/66 has neither numerator nor denominator divisible by5.
4. Keep arithmetic indices and the positive, reindexed source numbers distinct. The primed convention differs only at index one; it does not implement the source’s reindexing or alternating sign.

**Dependencies.** `mathlib:bernoulli`, `mathlib:bernoulli'`, `mathlib:bernoulli_eq_bernoulli'_of_ne_one`, `mathlib:bernoulli_one`, `mathlib:bernoulli'_one`, `mathlib:Polynomial.bernoulli`, `mathlib:Bernoulli.vonStaudt_clausen`, `mathlib:Bernoulli.dvd_den_bernoulli`, `mathlib:Bernoulli.not_sq_dvd_den_bernoulli`, `mathlib:bernoulli_eq_zero_of_odd`, `mathlib:bernoulli_two`, `IntegralIwasawaTheory:L3`.

**Uses.** N.7, the invariant w: w_{2k}(Q) is the denominator of B_{2k}/4k in the arithmetic convention (the source's B_k/4k), so the re-indexing must be fixed first. N.7, Kummer's criterion: The criterion concerns the numerators of B_2, B_4, …, B_{p−3} (the source's B_1, …, B_{(p−3)/2}). The Handbook comparison: Parts of the K-theory literature use the topologists' numbering; a translated statement says which one it is in.

**API.**

- `bernoulliArith` (data): The arithmetic Bernoulli numbers: Mathlib's bernoulli, used directly (no new definition).
- `bernoulliTop` (data): The source's topologists' numbers, bernoulliTop k := (−1)^(k+1) * bernoulli (2k), a named translation used only when quoting Weibel.
- `bernoulliTop_eq_abs` (characterisation): For k ≥ 1, bernoulliTop k = |bernoulli (2k)| > 0.
- `bernoulli_convert` (compatibility): bernoulli n = bernoulli' n for n ≠ 1 (Mathlib's bernoulli_eq_bernoulli'_of_ne_one); bernoulli' is NOT the source's convention.
- `bernoulli_one_arith` (simp): bernoulli 1 = −1/2 (Mathlib's bernoulli_one).
- `bernoulli_denominator` (compatibility): For k ≥ 1, (bernoulli (2k)).den = ∏_{p prime, (p−1) | 2k} p: von Staudt–Clausen with dvd_den_bernoulli and not_sq_dvd_den_bernoulli, all in the pinned Mathlib.
- `bernoulli_denominator_squarefree` (compatibility): For k ≥ 1, (bernoulli (2k)).den is squarefree and divisible by 6 (2 and 3 always qualify).

**Unit tests.**

- `b_one`: bernoulli 1 = −1/2 and bernoulli' 1 = +1/2.
- `b_twelve_denominator`: The denominator of bernoulli 12 = −691/2730 is 2730 = 2·3·5·7·13, the source's 'B_6 = 691/2730'; the arithmetic bernoulli 6 = 1/42. A statement that read the source's B_6 as bernoulli 6 fails.
- `agree_away_from_one`: For every index other than one, bernoulli and bernoulli' agree.
- `five_divides_top_b_five`: The source's B_5 = 5/66 is bernoulli 10: 5 divides it but not the numerator of bernoulli 10 / 5 = 1/66. The arithmetic bernoulli 5 is 0, so reading the source's example with the arithmetic index is vacuous.
- `top_not_primed`: bernoulliTop 1 = 1/6 while bernoulli' 1 = 1/2: the source's convention is not Mathlib's bernoulli'.

**Checks.**

- B_1 is minus one half in the arithmetic convention and plus one half in the other, and the two agree elsewhere.
- The denominator of arithmetic B_12 is2730=2·3·5·7·13; these are exactly the primes p with p−1 dividing12. Arithmetic B_6=1/42, whereas the source’s topologists’ B_6 is691/2730.
- The numerator has no analogous description, and a formalisation that treats it as computable by a closed formula is wrong.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2, the paragraph 'Bernoulli numbers' before Lemma 2.4, printed p. 472 (PDF p. 480). The source's convention and its first values; the node re-indexes them [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2, same paragraph, printed p. 472 (PDF p. 480). The denominator facts, in the source's indexing (its B_k = arithmetic B_{2k}) [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.4.1, printed p. 472 (PDF p. 480). The Kummer-congruence refinement and the example 5 | B_5 (arithmetic B_10 = 5/66)

### The Bernoulli denominator formula for w_i(ℚ)

**Target:** `ArithmeticKTheory:N.7/w-invariant`.

**Planet:** Bernoulli formula for w_i(ℚ).

For a number field F and a positive integer i, import N.4/the-w-invariant and N.4/finiteness-of-the-w-invariant: w_i(F) is the largest integer m such that the absolute Galois group acts trivially on the i-th Tate twist of the m-th roots of unity; equivalently, w_i(F)=#H⁰(F,ℚ/ℤ(i)), using N.4’s compatible system of finite Tate twists. Over the rationals it is 2 for odd i, and for i = 2k it is the DENOMINATOR of B_{2k}/4k in the arithmetic convention (the source's 'B_k/4k' with its topologists' B_k); so w_2(Q) = 24 and w_4(Q) = 240; a prime divides w_i(Q) exactly when it is one more than a divisor of i. The invariant is what the torsion of the odd K-groups of a ring of integers is measured by, so it is the arithmetic half of the connection between Bernoulli numbers and K-theory that this layer exists to make precise.

**Hypotheses.** F is a number field; i is a positive integer; the Bernoulli numbers are in the arithmetic convention of the previous node. The invariant and its finiteness are imported from ArithmeticKTheory N.4; the primewise-compatible Tate twists belong to MotivicEtaleKTheory M.1 (also imported by K2SymbolsBrauer T.7). N.7 owns the Bernoulli-denominator comparison and its numerical API, not a second definition of the invariant. The statement over the rationals is a theorem about the denominator, not a definition.

**Proof plan.**

1. Import W_i(F) = H⁰(F, ℚ/ℤ(i)), w_i(F) = #W_i(F), and finiteness for a number field and positive i from N.4/the-w-invariant and N.4/finiteness-of-the-w-invariant. Reuse their cyclotomic-character computation and largest-m characterisation; do not define or prove existence again.
2. Import N.4’s elementary divisibility and field-extension properties. The fixed element of order two gives evenness for positive i; this elementary corollary is the N.7 API wInvariant_even.
3. Prove the value 2 for odd i over the rationals, which is the source's earlier computation.
4. For i=2k with k≥1, compare the cyclotomic-character computation with von Staudt–Clausen and its denominator refinement to obtain w_{2k}(ℚ)=denominator(B_{2k}/(4k)) in the arithmetic convention. For every positive i, a prime l divides w_i(ℚ) exactly when l−1 divides i; for odd i only l=2 qualifies.
5. Discharge the existing Gaussian test using the same N.4 primewise inputs: for F = Q(i), N.4/two-primary-w-invariant case (a) has a = 2 and v_2(2) = 1, giving the factor 8. At an odd prime l, Q(i) is disjoint from the l-power cyclotomic tower over Q, so N.4/computing-w-from-the-cyclotomic-character has r = l-1 and a = 1. Only l = 3 contributes in weight two, with factor 3. Thus w_2(Q(i)) = 24, agreeing with K-book Example VI.2.1.2; this does not extend the rational odd-weight value 2 to Q(i), whose odd-weight value is 4.
6. Record the two places where the invariant is used: the order of the torsion of the odd K-groups, and the Birch-Tate formula of N.8.

**Dependencies.** `ArithmeticKTheory:N.7/bernoulli-conventions`, `ArithmeticKTheory:N.4/the-w-invariant`, `ArithmeticKTheory:N.4/finiteness-of-the-w-invariant`, `ArithmeticKTheory:N.4/computing-w-from-the-cyclotomic-character`, `mathlib:rootsOfUnity`, `mathlib:IsPrimitiveRoot`, `mathlib:NumberField`, `ArithmeticKTheory:N.4/two-primary-w-invariant`.

**Uses.** SpecialValuesBirchTate B.3: The Birch–Tate check consumes w_2 and N.8’s independently certified tame kernel; it does not provide either certificate bound. N.7, the torsion consequences: The Harris-Segal torsion of the odd K-groups has order this invariant. K3BlochGroups V.5: The third K-group of a number field has a cyclic summand of order this invariant at i = 2, which is the computation that packet carries.

**API.**

- `wInvariant` (data): Reuse TauCeti.wInvariant from N.4/the-w-invariant; no new data declaration.
- `wInvariant_even` (characterisation): For a number field F and positive weight i, 2 divides N.4’s w_i(F).
- `wInvariant_odd_rat` (example): Over the rationals it is two for odd i.
- `wInvariant_even_rat` (characterisation): Over the rationals, for k ≥ 1, w_{2k}(Q) = the denominator of bernoulli (2k) / 4k.
- `wInvariant_prime_divides` (characterisation): For every positive i and prime l, l divides w_i(ℚ) if and only if l−1 divides i.
- `wInvariant_two_rat` (example): Its value at i = 2 over the rationals is 24.

**Unit tests.**

- `w_two_rat`: w_2(Q) = 24 = denominator of (1/6)/4.
- `w_odd`: For odd i, w_i(Q) = 2.
- `w_gaussian`: w_2(Q(i)) = 24.
- `prime_divisibility`: 7 divides w_6(Q) = 504, since 6 is divisible by 6.
- `w_four_rat`: w_4(Q) = 240 = denominator of bernoulli 4 / 8 = −1/240; the unconverted formula with bernoulli 2 = 1/6 would give 48.

**Checks.**

- Over the rationals the invariant at i = 2 is 24, which is the denominator of bernoulli 2 / 4 in the arithmetic convention and is the number that appears in the Birch-Tate formula.
- For odd i over the rationals the invariant is 2, so the odd twists contribute only two-torsion.
- For the Gaussian rationals the invariant at i = 2 is again 24, which is what makes the third K-group of that field have a cyclic summand of order 24.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.4 (Lemma 2.4) and the recall of 2.1.2 before it, printed p. 472 (PDF p. 480). The value over the rationals, in the source's indexing [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.1.2 (Example 2.1.2), printed p. 470 (book PDF p. 478); author chapter VI PDF p. 7. The even-weight invariants of Q and Q(i) coincide, including w_2 = 24; odd weights have different values.

### Regular and irregular primes

**Target:** `ArithmeticKTheory:N.7/regular-prime`.

**Planet:** Regular prime.

A prime p is IRREGULAR when it divides the class number of the p-th cyclotomic field, that is the order of the Picard group of the ring of integers of the field obtained by adjoining a primitive p-th root of unity; otherwise p is REGULAR. Iwasawa's equivalent form concerns the whole cyclotomic tower: p is regular exactly when, for every ν ≥ 1, the Picard group of the ring of integers of Q(μ_{p^ν}) has no p-torsion. The 2013 source lists the smallest irregular primes are 37, 59, 67, 101, 103, 131 and 149, and reports that Siegel conjectured that asymptotically about 39 per cent of primes are irregular, a proportion its historical numerical evidence up to four million matches. The definition is about the class number and nothing else: no statement of this roadmap may fold Vandiver's conjecture, or any other class-group hypothesis, into the word regular.

**Hypotheses.** p is a prime; the cyclotomic field is the one obtained by adjoining a primitive p-th root of unity, and the Picard group is that of its ring of integers. Mathlib has the cyclotomic extension, the ring of integers and the class number, so the definition is a composition of pinned objects; what it does not have is the word, which neither library defines. Iwasawa's equivalent form is quoted from the source and is not proved here.

**Proof plan.**

1. Define irregularity as divisibility of the class number of the cyclotomic field by the prime, using the pinned class number.
2. Define regularity as its negation and record that it is decidable for a given prime once the class number is computed.
3. Record Iwasawa's equivalent form, that regularity is the absence of p-power torsion in the Picard group, as a quoted statement.
4. Record the list of the smallest irregular primes and the statistical expectation, both as data with the source named.
5. State the discipline the layer's text demands: regularity is this property and nothing more, and any theorem that needs Vandiver's conjecture or another class-group hypothesis states it separately.

**Dependencies.** `ArithmeticKTheory:N.7/bernoulli-conventions`, `mathlib:NumberField.classNumber`, `mathlib:IsCyclotomicExtension`, `mathlib:ClassGroup`, `mathlib:NumberField.RingOfIntegers`, `mathlib:Nat.Prime`, `mathlib:CyclotomicField`.

**Uses.** N.7, Kummer's criterion: The criterion is an equivalent condition on Bernoulli numerators for exactly this predicate. N.7, the tame kernel theorem: The vanishing theorem is stated for an odd regular prime. N.8: The certified examples are stated for explicit primes, and regularity is checked there.

**API.**

- `IsRegularPrime` (data): The predicate on a prime.
- `IsRegularPrime.iff_not_dvd_classNumber` (characterisation): The definition: the prime does not divide the class number of the cyclotomic field.
- `IsRegularPrime.iwasawa` (characterisation): p is regular iff for all ν ≥ 1, p does not divide the class number of Q(μ_{p^ν}).
- `IsRegularPrime.decidable` (instance): Decidability for a given prime, once the class number is known.
- `not_isRegularPrime_37` (example): The prime 37 is irregular.
- `isRegularPrime_of_lt_37` (example): Every prime below 37 is regular.

**Unit tests.**

- `thirty_seven_irregular`: The prime 37 is irregular, so the predicate fails there.
- `small_primes_regular`: Every prime below 37 is regular.
- `not_vandiver`: The predicate is about the full cyclotomic class number, not about the real subfield; a definition that used the real subfield would be Vandiver’s condition and is a different predicate.
- `decidable_instance`: For a given prime the predicate is decidable once the class number is computed.

**Checks.**

- The first irregular prime is 37, so every prime below it is regular; this is the smallest instance of the definition.
- Regularity is not the same as the absence of torsion in the class group of the real subfield, which is Vandiver's conjecture and is a separate statement.
- The definition is decidable for a given prime, which is what makes the certified examples of N.8 possible.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.4.1 (Example 2.4.1, Irregular Primes), printed p. 472 (PDF p. 480). The definition, Iwasawa's equivalent form and the list

### Kummer's criterion, and what the numerators can be

**Target:** `ArithmeticKTheory:N.7/kummer-criterion`.

**Planet:** Kummer's criterion.

An odd prime p is irregular exactly when it divides the numerator of one of the Bernoulli numbers B_2, B_4, …, B_{p−3} (arithmetic convention; the source's B_k with k ≤ (p−3)/2). Consequently, by Kummer's congruences, a regular prime divides the numerator of no B_{2k}/k: only irregular primes can. The criterion converts a class-number condition into a finite arithmetic check, which is what makes the regularity of a given prime decidable in practice and what ties this layer's two halves together.

**Hypotheses.** p is an odd prime; the Bernoulli numbers are in the arithmetic convention, where the criterion is insensitive to the convention because it concerns even indices only. The source states the criterion and attributes it to Kummer, referring to Washington's book for the proof; that book was not obtained and the criterion is not proved here. The bound on k is (p-3)/2 and is part of the statement, since it is what makes the check finite.

**Proof plan.**

1. State the criterion with its bound.
2. Record the direction that is used in practice: to certify that a prime is regular it suffices to check that it divides no numerator in the finite range.
3. Record the consequence through Kummer's congruences: a prime divides the numerator of B_k/k only if it is irregular, and the example that 5 divides the source's B_5 = B_10 = 5/66 but not the numerator of B_10/5.
4. Record the status: the criterion is quoted from the source, which cites Washington for the proof, and this packet does the same and records the gap.
5. Record the historical use the source records, Kummer's proof of the first case of Fermat's Last Theorem for regular exponents, as context and not as a target of this roadmap.

**Dependencies.** `ArithmeticKTheory:N.7/regular-prime`, `ArithmeticKTheory:N.7/bernoulli-conventions`.

**Checks.**

- For p = 37 the criterion is satisfied at B_32 (the source's k = 16), which is why 37 is the first irregular prime; the source records the same fact from the K-theoretic side.
- For a prime below 37 the finite check finds no numerator divisibility, which certifies regularity.
- The criterion is an equivalence, so it may be used in both directions, but the proof is imported in both.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.4.1, printed p. 472 (PDF p. 480). The criterion, in the source's indexing, with its reference for the proof [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.4.1, the sentence after the criterion, printed p. 472 (PDF p. 480). Its consequence through Kummer's congruences, with the source's reference [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.2.4.1, the historical remark, printed p. 472 (PDF p. 480). The context

### Character eigenspaces of the cyclotomic class group, and the Herbrand-Ribet theorem

**Target:** `ArithmeticKTheory:N.7/eigenspaces-and-herbrand-ribet`.

Let l be an odd prime, G the Galois group of the l-th cyclotomic field over the rationals, which is cyclic of order l-1, and P the Picard group of the ring of integers with the prime inverted, modulo l. Since l-1 is invertible modulo l, the group algebra of G over the field with l elements splits into the eigenspaces of the powers of the cyclotomic character, and P decomposes accordingly. The Herbrand-Ribet theorem identifies the eigenspaces that can be non-zero: for 1 ≤ k ≤ (l−3)/2, l divides the numerator of B_{2k} (arithmetic convention; the source's B_k) exactly when the eigenspace of index l−2k is non-zero. Among irregular primes below four thousand this happens for at most three values of k. The projectors are the usual idempotents of the group algebra, and their denominators are exactly the factor l-1, which is invertible; a statement that uses them must say so, since over the integers they do not exist.

**Hypotheses.** l is an odd prime; the base field is the l-th cyclotomic field; the coefficients are the field with l elements. The projectors require the inverse of l-1 and therefore do not exist integrally; every statement using them carries that restriction, which is the denominator restriction the layer's text demands. The Herbrand-Ribet theorem is quoted from the source, which cites the original papers; it is not proved here.

**Proof plan.**

1. Construct the idempotents of the group algebra attached to the powers of the cyclotomic character, and record the denominator l-1 and its invertibility modulo l.
2. Decompose the modulo-l Picard group into eigenspaces and prove that the decomposition is natural in the module.
3. State the Herbrand-Ribet theorem in the form the source gives: divisibility of the numerator of B_{2k} by l is equivalent to non-vanishing of the eigenspace of index l-2k.
4. Record the numerical statement: among irregular primes below four thousand at most three values of k occur.
5. Record how the eigenspace decomposition connects to the definition of regularity: the prime is regular exactly when every eigenspace vanishes, which is the class-number condition.

**Dependencies.** `ArithmeticKTheory:N.7/regular-prime`, `ArithmeticKTheory:N.7/kummer-criterion`, `mathlib:ZMod`, `mathlib:IsCyclotomicExtension`, `mathlib:ClassGroup`.

**Checks.**

- For a regular prime every eigenspace vanishes, which is the class-number condition of the definition.
- For l = 37 exactly one eigenspace is non-zero, at index 37 − 32 = 5, attached to B_32 (the source's k = 16), which the source records.
- The projectors are not available over the integers, so an integral statement that used them would be wrong; the restriction is part of the statement.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.10.8.1 (Remark 10.8.1), printed p. 532 (PDF p. 540). The theorem and the numerical remark, in the source's indexing [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.10.4.2 (Example 10.4.2), printed p. 530 (PDF p. 538). The eigenspace bookkeeping; the packet had cited it as 10.4.1

### The residue field above a cyclotomic prime has prime-to-l unit order

**Target:** `ArithmeticKTheory:N.7/residue-field-units-prime-to-l`.

Let l be a prime, F = Q(mu_l), and P a maximal ideal of its ring of integers lying over (l) in Z. Then the actual quotient field k(P) = O_F/P has l elements, its multiplicative unit group has l−1 elements, and l does not divide that order. No regularity or oddness is assumed.

**Hypotheses.** l is prime (including l=2); F is the l-th cyclotomic field over Q. P is maximal in O_F and lies over the ideal (l) of Z; the quotient is the genuine ideal quotient, with its field structure. The theorem is arithmetic and independent of tame-kernel or higher K-theory vanishing.

**Proof plan.**

1. Use the pinned uniqueness theorem to identify P with (zeta−1), for a primitive l-th root. The previously cited inertia degree is one.
2. Use IsCyclotomicExtension.Rat.absNorm_span_zeta_sub_one at k=0, rewriting l^1=l, to obtain absolute norm l. Ideal.absNorm_apply and Submodule.cardQuot_apply identify this norm with the natural-number cardinality of O_F/P.
3. Install Ideal.Quotient.field P locally and apply Nat.card_units to get unit order l−1.
4. Since l≥2, 0<l−1<l; elementary divisibility implies l does not divide l−1. No K-theoretic input is used.

**Dependencies.** `mathlib:CyclotomicField`, `mathlib:NumberField.RingOfIntegers`, `mathlib:Nat.Prime`, `mathlib:IsCyclotomicExtension.Rat.eq_span_zeta_sub_one_of_liesOver'`, `mathlib:IsCyclotomicExtension.Rat.inertiaDeg_span_zeta_sub_one'`, `mathlib:IsCyclotomicExtension.Rat.absNorm_span_zeta_sub_one`, `mathlib:Ideal.absNorm_apply`, `mathlib:Submodule.cardQuot_apply`, `mathlib:Ideal.Quotient.field`, `mathlib:Nat.card_units`.

**Checks.**

- For l=2, the quotient has two elements and the unit group has order one.
- For l=5, the quotient has five elements and the unit group has order four.
- Removing regularity does not change the result; a supposed proof importing regular-prime K-theory is circular for its intended use.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.3.2 (Example 8.3.2), printed p. 514 (PDF p. 522); cyclotomic prime arithmetic in the pinned Mathlib declarations listed as prerequisites. The book supplies the single-prime localisation used by the tame-kernel application. The elementary residue-field/unit-order lemma is derived from the pinned cyclotomic norm and quotient-cardinality declarations, not attributed as a separately stated theorem of the book.

### For an odd regular prime the l-primary tame kernel of the cyclotomic field vanishes

**Target:** `ArithmeticKTheory:N.7/tame-kernel-vanishing-at-a-regular-prime`.

**Planet:** Regular primes and the tame kernel.

Let l be an odd regular prime and F the l-th cyclotomic field. Then the l-primary part of the tame kernel of F, that is of the second K-group of its ring of integers, vanishes. The proof combines three inputs: Tate's comparison, which identifies the second K-group modulo l with a Galois cohomology group; the class-group input, which is that the Picard group of the ring of integers has no l-torsion, by definition of regularity; and the local Brauer calculation, which is the exact sequence computing the Brauer group of a ring of S-integers from the real places and the finite places in S. Moreover, inverting the unique prime above l introduces no l-primary residue-field-unit term: that prime is totally ramified with inertia degree one, so its residue field is the field with l elements, whose unit group has order l-1, which is prime to l.

**Hypotheses.** l is an odd regular prime; F is the l-th cyclotomic field; S is either empty or the singleton of the unique prime above l. Tate's comparison is imported from MotivicEtaleKTheory M.3 and the tame kernel and its exact sequence from K2SymbolsBrauer T.5; neither is reproved here. The ramification statement, that l has a unique prime above it with ramification index l-1 and inertia degree one, is pinned in Mathlib and is cited.

**Proof plan.**

1. State the tame-kernel sequence for F, importing it from K2SymbolsBrauer T.5, and localise it at l.
2. Apply Tate's comparison to identify the l-primary part of the second K-group modulo l with the Galois cohomology of the twice-twisted roots of unity.
3. Use regularity: the Picard group has no l-torsion, so the class-group contribution to that cohomology vanishes.
4. Use the local Brauer calculation of the source's Classical Data to control the remaining contribution from the finite places.
5. Conclude the vanishing of the l-primary part.
6. For the S-integer version, use residue-field-units-prime-to-l: the unique prime above l has residue-unit order l−1, which is prime to l. Localisation therefore adds no l-primary residue term. This named arithmetic input is proved without K-theory and no longer hidden inside the vanishing application.

**Dependencies.** `ArithmeticKTheory:N.7/regular-prime`, `ArithmeticKTheory:N.7/eigenspaces-and-herbrand-ribet`, `K2SymbolsBrauer:T.5`, `K2SymbolsBrauer:T.7`, `MotivicEtaleKTheory:M.3`, `mathlib:IsCyclotomicExtension`, `mathlib:IsCyclotomicExtension.Rat.ramificationIdx_span_zeta_sub_one'`, `mathlib:IsCyclotomicExtension.Rat.inertiaDeg_span_zeta_sub_one'`, `mathlib:IsCyclotomicExtension.Rat.eq_span_zeta_sub_one_of_liesOver'`, `ArithmeticKTheory:N.7/residue-field-units-prime-to-l`.

**Checks.**

- For l = 5 the statement says that the tame kernel of the fifth cyclotomic field has no 5-torsion.
- The residue-field remark is an elementary computation with the ramification data and does not need any K-theory; a proof that invoked a K-theoretic vanishing instead would be circular.
- For an irregular prime the argument breaks at the class-group step, which is exactly where the eigenspace analysis of the previous node takes over.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.3.2 (Example 8.3.2), printed p. 514 (PDF p. 522). The statement itself, for all K_{2i}, with the three inputs (Pic, |S| = 1, Br = 0); the packet did not cite it [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.1 (Classical Data), (8.1.1), printed p. 513 (PDF p. 521). The Brauer sequence the argument uses [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.10.5 (Proposition 10.5), printed p. 530 (PDF p. 538). The analogous statement over the integers

### Torsion in the K-groups at an odd regular prime

**Target:** `ArithmeticKTheory:N.7/regular-prime-torsion-consequences`.

Let l be an odd regular prime. Then the even K-groups of the integers have no l-torsion, and the only l-torsion in the K-groups of the integers is the l-primary part Z/w_i(Q)_(l) of the Harris-Segal summand of the odd group K_{2i-1}, present exactly when i is divisible by l-1. With finite coefficients the statement is cleaner still: the mod-l K-theory of the integers with l inverted is a free graded module over the polynomial ring on β^(l-1), the (l-1)-st power of the Bott element, in degree 2l-2, with (l+3)/2 generators, namely the unit in degree zero, a class in degree 2l-3 and classes in the degrees 4k+1 for k from zero to (l-3)/2. The degrees and the character indices are part of the statement and may not be compressed.

**Hypotheses.** l is an odd regular prime; the ring is the integers, or the integers with l inverted for the statement with finite coefficients. The identification of the torsion as Harris-Segal summands is imported from the earlier parts of this roadmap, which own the etale descent computation. The free-module statement is the source's Theorem 10.6, stated for l odd and regular.

**Proof plan.**

1. For R=Z[ζ_l,1/l], regularity kills Pic(R)/l. The Kummer sequence and the one-inverted-prime Brauer calculation give H²(R,Z/l(i+1))=0. The N.6 even comparison and finiteness imply K_(2i)(R){l}=0 for i≥1. Restriction to R followed by transfer has degree l−1, a unit at l, so the same vanishing holds for Z[1/l] and Z in positive even degrees.
2. Combine N.5 odd torsion and N.4 cyclotomic exponents: the remaining l-primary torsion of K_(2i−1)(Z) is cyclic of order w_i(Q){l}, nonzero exactly when l−1 divides i. Harris–Segal identifies the detected summand, with its separate G-HarrisSegal proof boundary.
3. Use the coefficient Bockstein sequence and the cyclotomic-unit character decomposition. The Galois invariants of β^a occur precisely when l−1 divides a. In odd degrees take the invariant classes v=[ζ]β^(l−2) and y_k=x_k β^(2k), 0≤k≤(l−3)/2, together with the unit. Descent gives the stated free module, conditional on the character and Bott-action arguments requested in G-RegularProofs. At l=3 this is a coherent module action; no ring structure on the mod-3 Moore spectrum is inferred.
4. Check l=5: the four generators have degrees 0,1,5,7 modulo8. For Z rather than Z[1/l], replace y_0 by y_0 β^(l−1); do not identify their degree-one groups.

**Dependencies.** `ArithmeticKTheory:N.7/tame-kernel-vanishing-at-a-regular-prime`, `ArithmeticKTheory:N.7/w-invariant`, `ArithmeticKTheory:N.5/harris-segal-summand`, `ArithmeticKTheory:N.5/odd-torsion-at-a-prime-where-cd-is-two`, `ArithmeticKTheory:N.6/even-groups-at-odd-primes`, `ArithmeticKTheory:N.6/even-groups-modulo-l`, `KTheoryFiniteLocalFields:L.1/k-theory-mod-m`, `KTheoryFiniteLocalFields:L.1/bott-element`, `GeneralAlgebraicKTheory:K.7`, `MotivicEtaleKTheory:M.7`.

**Checks.**

- For l = 5 the explicit periodic structure is the source's worked example, and the generator in degree five is attached to the golden ratio.
- The count of generators is (l+3)/2, which for l = 5 is four, matching the four classes named.
- At an irregular prime none of these statements is asserted.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.10.5 (Proposition 10.5), printed p. 530 (PDF p. 538). The first two statements [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.10.6 (Theorem 10.6), printed p. 531 (PDF p. 539). The module statement: the polynomial ring is on β^{ℓ−1} [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.10.6, the case ℓ = 5, printed p. 532 (PDF p. 540). The worked example

### Vandiver's conjecture, and keeping the conditional results apart

**Target:** `ArithmeticKTheory:N.7/vandiver-separation`.

Import Vandiver(l) from its single owner IntegralIwasawaTheory L3: for a prime l it is nondivisibility by l of the class number of Q(mu_l)^+, identified with the pinned maximal real subfield of CyclotomicField l Q. This node does not define a second predicate. Vandiver's conjecture asserts that for an irregular prime l the Picard group of the ring of integers of the maximal real subfield of the l-th cyclotomic field has no l-torsion; equivalently, that the representation of the Galois group on the modulo-l Picard group of the full cyclotomic field is a sum of odd twists of the roots of unity, which says that complex conjugation acts as minus one on the l-torsion. The 2013 source reports verification for all primes up to a hundred and sixty-three million and treats the global conjecture as open; this is historical source evidence, not a claim about the latest verification bound or current status. Under the global hypothesis Vandiver(l) for every odd prime l, put c_j=|num(B_(2j)/(4j))| in the arithmetic convention. For n≥2 the eight rows are: K_(8a+1)(Z)=Z⊕Z/2 (a≥1); K_(8a+2)(Z)=Z/(2c_(2a+1)); K_(8a+3)(Z)=Z/(2w_(4a+2)(Q)); K_(8a+4)(Z)=0; K_(8a+5)(Z)=Z; K_(8a+6)(Z)=Z/c_(2a+2); K_(8a+7)(Z)=Z/w_(4a+4)(Q); K_(8a+8)(Z)=0 (a≥0 for the last seven rows). These are abstract group isomorphisms, with no chosen generators. In particular the groups K_{4i}(Z) with 4i ≥ 8 vanish (K_4(Z) = 0 is a theorem, of Rognes); the 2013 source states unconditionally that those higher groups have order a product of irregular primes greater than ten to the eighth, and their joint vanishing for all i ≥ 2 is equivalent to the global Vandiver conjecture at every odd prime. Every statement of this roadmap that uses the conjecture says so in its hypotheses, and no definition of regularity contains it.

**Hypotheses.** For the predicate comparison l is an odd prime (regular primes satisfy Vandiver automatically). For the complete K-group table and joint vanishing assume Vandiver(l) for every odd prime l; a hypothesis at one irregular prime does not suffice. The equivalence between the two forms of the conjecture uses that complex conjugation is the unique element of order two in the Galois group, which the source records. The conditional table is the source's Theorem 10.2 and is quoted as conditional. The predicate and its transport to the intrinsic maximal-real-subfield model are supplied by IntegralIwasawaTheory L3; the equivalence and conditional K-theory consequences, not that definition, are owned here.

**Proof plan.**

1. Import IntegralIwasawaTheory L3's predicate, whose exact contract is l not dividing the class number of the maximal real subfield of Q(mu_l). Prove the comparison to the odd-character condition on the full cyclotomic class group; do not introduce a second definition.
2. Record the verification bound as historical to the 2013 source, without claiming it is the current bound, and the historical remark that the statement was discussed by Kummer and Kronecker long before Vandiver.
3. Combine N.5’s odd rows with N.6’s even 2-primary calculation and the special-value order formula for Z. Under global Vandiver, the cyclotomic reflection/cyclicity theorem makes the odd-primary K_(4j−2)(Z) cyclic of order c_j, while the even-character vanishing kills all K_(4j)(Z). The additional 2-part occurs in residue two, giving the explicit eight rows above. The reflection/cyclicity and order-formula proof imports remain G-RegularProofs and the SpecialValuesBirchTate:B.8/higher-values-real-abelian contract; do not present them as elementary consequences of regularity.
4. State the unconditional order restriction for K_{4i}(Z), i≥2, and the equivalence of their joint vanishing with the global Vandiver conjecture at every odd prime. A hypothesis at one irregular prime is not the global conjecture; K_4(Z)=0 is an unconditional imported result.
5. State the discipline: a theorem conditional on the conjecture is labelled conditional, and the definition of a regular prime does not mention it.

**Dependencies.** `ArithmeticKTheory:N.7/regular-prime`, `ArithmeticKTheory:N.7/eigenspaces-and-herbrand-ribet`, `ArithmeticKTheory:N.7/regular-prime-torsion-consequences`, `IntegralIwasawaTheory:L3`, `mathlib:NumberField.maximalRealSubfield`, `mathlib:NumberField.of_subfield`, `ArithmeticKTheory:N.5/the-real-case-modulo-eight`, `ArithmeticKTheory:N.6/even-groups-at-odd-primes`, `ArithmeticKTheory:N.6/the-two-primary-corrections`, `ArithmeticKTheory:N.7/w-invariant`, `SpecialValuesBirchTate:B.8/higher-values-real-abelian`.

**Checks.**

- The source treats the global conjecture as open. Every conditional theorem states the global hypothesis explicitly; the historical verification bound is not presented as a current bound.
- The equivalence of the two forms is a statement about the action of complex conjugation and is proved, not assumed.
- The unconditional statement about the groups in degrees divisible by four is weaker and is what may be used without the conjecture.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.10.8 (Vandiver's Conjecture 10.8), printed p. 532 (PDF p. 540). The conjecture and the equivalence [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.10.1, the paragraph before Table 10.1.1, printed p. 527 (PDF p. 535). The unconditional statement and the equivalence [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.10.8.2 (Historical Remark 10.8.2), printed p. 532 (PDF p. 540). The historical remark

## N.8 — Independently certified examples

Import the first three groups of Z from their low-degree owners, and obtain K3 from N.5. Thus the first four groups are Z, Z/2, Z/2, Z/48. The Gaussian Tate certificate gives K2(Z[i])=0 independently of K3(Q(i))=Z⊕Z/24. For Z[1/p], use localization in every degree, with units ±p^n in degree one; K2(Q) remains an infinite direct sum despite the finite integral tame kernel. The real quadratic example is Q(√5), ε=(1+√5)/2, ε²=ε+1. The two real signs give a lower bound of four for the tame kernel generated by {−1,−1} and {−1,ε}; Tate descent, a norm-33 cutoff and the eleven residue certificates below give the independent upper bound. The result supplies B.3’s special-value test, never the reverse.

### What a certified example is

**Target:** `ArithmeticKTheory:N.8/certified-example-format`.

**Planet:** Certified example.

A certified example of this roadmap consists of three things: the ARITHMETIC DATA of the field, namely its degree, its signature, its class number, its unit rank and the invariants w_i, each with a proof or with the pinned declaration that computes it; a TAME-KERNEL CERTIFICATE (or, for an even K-group, an order certificate) in the format of ArithmeticKTheory N.6/order-certificate, that is a finite presentation with a proof that its generators span (the upper bound) and an independent lower bound — a surjection onto a group of the presented order, from symbols (the real sign, tame or Hilbert symbols), from cohomology (N.6/certificate-driven-computation) or from a complete kernel argument — so that an upper bound and a surjection are never reported as an isomorphism; and an explicit LABELLING of every number that is deduced rather than computed. The last is the rule the layer's text insists on: an order obtained from the Birch-Tate formula is a valid corollary of that formula and is labelled as one, it may not then be used as the independent test of the formula, and it may not supply either bound of a certificate that SpecialValuesBirchTate B.3 uses as that test (RT-AREA-ktheory-1/11).

**Hypotheses.** F is a number field; the data are those of its ring of integers or of a ring of S-integers, as the example states. The certificate format is ArithmeticKTheory N.6's (RT-AREA-ktheory-1/9) and is not redefined here; the tame kernel and its exact sequences are K2SymbolsBrauer T.5's. The labelling rule is a condition on the example, not on the mathematics: the same equality may appear as a computation in one example and as a corollary in another, and the example says which.

**Proof plan.**

1. Define the record of arithmetic data with a field for each invariant and a proof obligation attached to it.
2. Import the order certificate of N.6/order-certificate and record which of its fields are present in a given example.
3. Define the labelling: each numerical claim carries a tag saying whether it is computed, imported or deduced, and from what.
4. State the circularity rule: a claim tagged as deduced from a formula may not be cited as evidence for that formula, and may not fill a bound of a certificate used to test it.
5. Record the minimum an example must contain to be admissible: the arithmetic data, at least an upper bound for the tame kernel, and the labelling; it is certified only with both bounds.

**Dependencies.** `ArithmeticKTheory:N.6/order-certificate`, `ArithmeticKTheory:N.4/the-w-invariant`, `ArithmeticKTheory:N.4/finiteness-of-the-w-invariant`, `K2SymbolsBrauer:T.5/unramified-subgroup`, `K2SymbolsBrauer:T.5/tame-kernel-sequence`, `mathlib:NumberField.classNumber`, `mathlib:NumberField.Units.rank`, `mathlib:NumberField.InfinitePlace.nrRealPlaces`, `mathlib:NumberField.InfinitePlace.nrComplexPlaces`.

**Uses.** N.8, every example: Each of the five required examples is an instance of this record. SpecialValuesBirchTate B.3: B.3 imports N.8's certified examples, the real-quadratic tame kernel among them, as the independent input of its Birch–Tate check (atlas edge N.8 → B.3); the labelling is what keeps that check independent. ArithmeticKTheory N.6/order-certificate: The certificate half is N.6's format, imported here; K2SymbolsBrauer T.5 supplies the tame kernel it is applied to.

**API.**

- `ArithmeticData` (structure): For a number field F: natural-number fields degree, realPlaceCount, complexPlaceCount, classNumber and unitRank, and a natural-number wValue(i) for each positive i. Each field has an equality proof to its actual Mathlib invariant or the imported N.4 w_i(F); require realPlaceCount+2·complexPlaceCount=degree and unitRank=realPlaceCount+complexPlaceCount−1.
- `CertifiedExample` (structure): A number field F, its ArithmeticData, N.6’s order certificate for its actual tame kernel, tags for every numerical claim, and a provenance graph naming the suppliers of both certificate bounds. The certificate contains a finite presentation, relations verified in K₂(O_F), a surjective generator map (span), and an independent finite quotient of the same order (lower bound).
- `CertifiedExample.tag` (projection): The tag of a numerical claim: computed, imported or deduced.
- `CertifiedExample.no_circularity` (characterisation): Neither certificate bound has a provenance path from the Birch–Tate formula. A claim tagged as deduced from that formula cannot be evidence for that formula.
- `CertifiedExample.admissible` (characterisation): The arithmetic data, explicit upper bound and numerical provenance make an example admissible as an upper-bound report; it is certified only when the independent lower bound has matching order.

**Unit tests.**

- `deduced_not_evidence`: An order deduced from Birch-Tate cannot be listed as a test of Birch-Tate.
- `upper_bound_only`: Without the lower bound (or a complete kernel argument) the example reports an upper bound, not an order.
- `rationals_admissible`: The rational example is admissible: its three numbers are known independently.
- `data_from_libraries`: Each arithmetic-data field must equal its named Mathlib or N.4 supplier; replacing the golden-field degree2 by degree3 fails its equality proof. Current NumberFieldArithmetic supplies that field’s completed arithmetic, rather than a new local development.
- `gaussian_certified`: The Gaussian example is certified: no generators, span by N.8/gaussian-tame-kernel-vanishes, lower bound onto the trivial group; its tame-kernel order 1 is tagged computed.
- `sqrt_five_certified`: The ℚ(√5) example is certified: generators {−1, −1}, {−1, ε} with relations 2g = 0, span by N.8/real-quadratic-upper-generation, lower bound the two sign symbols onto (ℤˣ)²; its order 4 is tagged computed, and the Birch–Tate identity 1/30 = 4/120 is tagged as B.3's test of it.

**Checks.**

- An example whose tame-kernel order is deduced from Birch-Tate is admissible and is labelled as a corollary; the same example may not then be listed as a test of Birch-Tate.
- An example with a surjective presentation and no completeness proof reports an upper bound, not an order.
- Use the existing NumberFieldArithmetic arithmetic of the small fields, including current Tau Ceti’s ℚ(√5) example, and N.4’s imported w-values. The frozen pins supply individual arithmetic carriers and invariants, not a completed certificate record or w-invariant.
- The required tame-kernel certificates carry both bounds: K₂(ℤ), with span and real sign from K2SymbolsBrauer T.5; K₂(ℤ[i])=0, with span from gaussian-tame-kernel-vanishes and trivial lower bound; K₂(O_{ℚ(√5)})≅(ℤ/2)², with span from real-quadratic-upper-generation and lower bound from the two real signs. The direct golden-field descent supplies its upper bound through the cutoff33 and eleven exact finite certificates.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.6, the worked case of the rationals, printed p. 515 (PDF p. 523). The shape of a certified example: three independently known numbers

### The first K-groups of the integers

**Target:** `ArithmeticKTheory:N.8/k-groups-of-the-integers`.

The required first four groups are K0(Z)≃Z (Z.6), K1(Z)≃Z/2 (U.6), K2(Z)≃Z/2 generated by {−1,−1} (T.5/k2-of-the-integers), and K3(Z)≃Z/48 (N.8/arithmetic-k3-examples, from N.5). This is a compilation of these interfaces and their consistency checks. V.5 consumes the K3 result. The old extra K4(Z)=0 item is outside the requested first-four-group target and is not used to prove any certificate.

**Hypotheses.** The ring is the integers; the groups are Quillen's K-groups. Each value is attributed; none is proved here. The fourth group vanishing is a theorem, unlike the groups in higher degrees divisible by four, whose vanishing is equivalent to Vandiver's conjecture.

**Proof plan.**

1. Import Z.6, U.6 and T.5 for degrees zero through two. Use N.8/arithmetic-k3-examples, obtained from N.5, for degree three. Compare the degree-two generator with the real sign and compare the degree-three order with 2w2(Q)=48.

**Dependencies.** `KTheoryLowDegrees:Z.6`, `KTheoryLowDegrees:U.6`, `K2SymbolsBrauer:T.5/k2-of-the-integers`, `ArithmeticKTheory:N.8/arithmetic-k3-examples`.

**Checks.**

- The four groups are Z, Z/2, Z/2 and Z/48.
- The K2 generator has nontrivial real sign; the K3 factor is 2w2(Q).
- The calculation supplies V.5 and uses no result from V.5.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.10.1.1 (Table 10.1.1) and its note, printed p. 528 (PDF p. 536). The first column of the table (transcribed) and its note

### Tate's filtration of K₂ by symbols of S_m-units

**Target:** `ArithmeticKTheory:N.8/tate-norm-filtration`.

Let F be a number field. List its finite places as v₁, v₂, … with N v_{m−1} ≤ N v_m, where N v = #k(v) is the absolute norm of the prime, and put S_m = {v₁, …, v_m}, S₀ = ∅. Let U_m be the group of S_m-units, the a ∈ F^× with v(a) = 0 at every finite place v ∉ S_m (so U₀ = 𝓞_F^×), and let K₂^{S_m}(F) be the subgroup of K₂(F) generated by the symbols {a, b} with a, b ∈ U_m. Then K₂^{S_0}(F) ⊆ K₂^{S_1}(F) ⊆ ⋯ exhausts K₂(F), the tame symbol ∂_{v_m} vanishes on K₂^{S_{m−1}}(F), and it induces the graded residue ∂_{v_m} : K₂^{S_m}(F)/K₂^{S_{m−1}}(F) → k(v_m)^×. When the prime of 𝓞_{S_{m−1}} at v_m is principal, generated by π, put U = U_{m−1}; then U_m = U × π^ℤ, and there are homomorphisms α : U → K₂^{S_m}(F)/K₂^{S_{m−1}}(F), u ↦ {u, π}, onto, and β : U → k(v_m)^×, u ↦ u mod v_m, with ∂_{v_m} ∘ α = β in the convention of K2SymbolsBrauer T.3/tame-symbol (∂_v{u, t} = ū). Finally U₁ ⊆ U is the subgroup generated by (1 + πU) ∩ U; it lies in ker β, and α kills it. This is Tate's unit-symbol filtration; the only data are the ordering of the places and, at a principal place, the generator π.

**Hypotheses.** F is a number field; places of equal norm are ordered arbitrarily, and every statement below holds for any such ordering. α, β and U₁ are used when the prime in the preceding S-integer ring is principal. In both examples here, ℚ(i) and ℚ(√5), the ring of integers is already principal. K₂(F) is described by Matsumoto's presentation (K2SymbolsBrauer T.2/matsumoto); the tame symbols are T.3's.

**Proof plan.**

1. Order the finite places by the absolute norm of their primes (mathlib:Ideal.absNorm); only finitely many places have a given norm, so the enumeration exists. Take U_m to be Mathlib's S-units (mathlib:Set.unit) for S = S_m.
2. Define K₂^{S_m}(F) as the subgroup generated by the symbols of U_m. It is monotone in m, and it exhausts K₂(F) because K₂(F) is generated by symbols (T.2/matsumoto) and each a ∈ F^× has non-zero valuation at only finitely many places (T.3/finite-support).
3. ∂_{v_m} vanishes on K₂^{S_{m−1}}(F): a symbol of two v_m-units has tame symbol 1 by T.3/tame-symbol. Hence the graded residue is defined on the quotient.
4. At a principal v_m with generator π, every element of U_m is uπ^r with u ∈ U. By bimultiplicativity {uπ^r, u′π^s} is a product of {u, u′}, powers of {u, π} and {u′, π}^{±1}, and {π, π}^{rs} = {π, −1}^{rs} (T.2/symbol-consequences); modulo K₂^{S_{m−1}}(F) this is a power product of values of α, so α is onto.
5. ∂_{v_m}{u, π} = ū for a v_m-unit u and the uniformiser π (T.3/tame-symbol), so ∂_{v_m} ∘ α = β.
6. U₁ ⊆ ker β because 1 + πx ≡ 1 mod π. α kills U₁: for x ∈ U with 1 + πx ∈ U, the Steinberg identity {1 + πx, −πx} = 1 (T.2/steinberg-identity, since −πx = 1 − (1 + πx)) gives {1 + πx, π} = {1 + πx, −x}^{−1}, a symbol of two elements of U, hence in K₂^{S_{m−1}}(F).
7. K₂^{S_0}(F) is generated by symbols of units of 𝓞_F and lies in the unramified subgroup of T.5/unramified-subgroup (symbol_mem_unramifiedSubgroup).

**Dependencies.** `K2SymbolsBrauer:T.2/matsumoto`, `K2SymbolsBrauer:T.2/steinberg-identity`, `K2SymbolsBrauer:T.2/symbol-consequences`, `K2SymbolsBrauer:T.3/tame-symbol`, `K2SymbolsBrauer:T.3/finite-support`, `K2SymbolsBrauer:T.5/unramified-subgroup`, `mathlib:Set.unit`, `mathlib:Ideal.absNorm`.

**Uses.** N.8/tate-criterion: Tate's criterion is a statement about the graded residue of one step, through α, β and U₁. N.8/gaussian-tame-kernel-vanishes and N.8/real-quadratic-upper-generation: The Gaussian argument and the direct golden-field argument prove bijectivity at every prime, giving generation by symbols of ordinary units. ArithmeticKTheory N.6/order-certificate: the span field of a tame-kernel certificate is discharged through this filtration in N.8's examples; N.6's format itself is not changed.

**API.**

- `tateFiltration` (data): For a number field F and an enumeration v : ℕ → finite places of F with nondecreasing absolute norm, m ↦ K₂^{S_m}(F), the subgroup of K₂(F) generated by the symbols of the S_m-units (Set.unit with S = {v₁, …, v_m}).
- `tateFiltration_mono` (relation): Monotone in m.
- `iSup_tateFiltration` (characterisation): ⨆ m, tateFiltration F v m = ⊤: every element of K₂(F) lies in some step.
- `tameSymbol_eq_one_of_mem_tateFiltration` (simp): ∂_{v_m} x = 1 for x in step m − 1.
- `tateGradedResidue` (constructor): The homomorphism step m ⧸ step (m − 1) → k(v_m)ˣ induced by ∂_{v_m}.
- `tateAlpha` (constructor): For a generator π of the prime at v_m: u ↦ {u, π} from the S_{m−1}-units to step m ⧸ step (m − 1); surjective.
- `tateGradedResidue_comp_tateAlpha` (compatibility): tateGradedResidue ∘ tateAlpha = β, reduction modulo v_m, in T.3's convention ∂_v{u, t} = ū.
- `tateUnitSubgroup` (data): U₁, the subgroup of the S_{m−1}-units generated by (1 + πU) ∩ U.
- `tateAlpha_tateUnitSubgroup` (relation): tateAlpha kills tateUnitSubgroup, and tateUnitSubgroup ≤ ker β.
- `tateFiltration_zero_le_unramified` (compatibility): Step 0, generated by symbols of units of 𝓞_F, lies in K2SymbolsBrauer's unramifiedSubgroup.

**Unit tests.**

- `tateFiltration_zero_rat`: For F = ℚ, step 0 is generated by the single unit symbol {−1, −1}.
- `tateUnitSubgroup_gaussian_one_add_i`: For F = ℚ(i) at v₁ = (1 + i): i = 1 + (1 + i)·i, so tateUnitSubgroup = ⟨i⟩ = U₀.
- `tateFiltration_units_not_integers`: Over ℚ, {−1, 3} is not in step 1 (S₁ = {2}), since ∂₃{−1, 3} = −1 ≠ 1 in 𝔽₃^×; a filtration generated by symbols of S_m-integers instead of S_m-units would put it in step 0, among the symbols of integers.
- `tateFiltration_zero_le_unramified_rat`: For F = ℚ, step 0 lies in the unramified subgroup of K2SymbolsBrauer T.5, which T.5/tame-kernel-sequence identifies with K₂(ℤ).
- `tateGradedResidue_surjective_rat_five`: For F = ℚ at v = (5): β(2) = 2 generates 𝔽₅^×, so the graded residue is onto, and {2, 5} maps to 2.

**Checks.**

- For F = ℚ(i) the first place is v₁ = (1 + i), of norm 2, followed by the two places of norm 5, (2 + i) and (2 − i), in either order; U₀ = ⟨i⟩ and U₁ = ⟨i⟩ × (1 + i)^ℤ.
- At v₁ = (1 + i) one has i = 1 + (1 + i)·i ∈ (1 + πU) ∩ U, so the subgroup U₁ of this node (not to be confused with the group of S₁-units) is all of U = ⟨i⟩.
- For F = ℚ the filtration step at the prime p is generated, modulo the previous step, by the symbols {u, p} with u ∈ ⟨−1⟩ × ∏_{q<p} q^ℤ, and β is reduction mod p.

**Source.** [BassTate.1973](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/SLN342.pdf), II §3, Theorem 3.1 and Lemma 3.2, article pp. 403–407 (internal pp. 56–60; volume PDF pp. 413–417); Appendix A2, p. 430 (PDF p. 440). The filtration, the surjective symbol map, and its Steinberg kernel. The appendix states the degree-two triangle explicitly. [Groenewegen.2004](https://www.ams.org/journals/mcom/2004-73-247/S0025-5718-03-01592-8/), §2, Lemma 7, pp. 1446, 1448–1449. A second proof of the surjectivity and kernel used here. The packet uses subgroups in K₂(F), not an assertion that every finite symbolic presentation is already K₂(F).

### Tate's criterion: when the graded tame symbol is bijective

**Target:** `ArithmeticKTheory:N.8/tate-criterion`.

**Planet:** Tate's criterion for the tame symbol.

In the notation of N.8/tate-norm-filtration, let v = v_m (m ≥ 1) be a place whose prime is principal in 𝓞_{S_{m−1}}, generated there by π, and put U = U_{m−1}, β : U → k(v)^× and U₁ = ⟨(1 + πU) ∩ U⟩. (a) Tate's Appendix Proposition 1. If W, C, G ⊆ U satisfy (1) W ⊆ C·U₁ and W generates U, (2) C·G ⊆ C·U₁ and β(G) generates k(v)^×, and (3) 1 ∈ C and C ∩ ker β ⊆ U₁, then the graded residue ∂_v : K₂^{S_m}(F)/K₂^{S_{m−1}}(F) → k(v)^× is bijective. (b) The norm-congruence lemma. If a, b ∈ 𝓞_F ∩ U, a ≡ b mod v and |N_{F/ℚ}(a − b)| < (N v)², then a/b ∈ U₁; for an imaginary quadratic F it suffices that |a| + |b| < N v. (c) Descent. If ∂_{v_j} is bijective for every j > m₀, then the tame kernel K₂(𝓞_F) is contained in K₂^{S_{m₀}}(F); if this holds with m₀ = 0, then K₂(𝓞_F) = K₂^{S_0}(F), the subgroup generated by the symbols of units of 𝓞_F.

**Hypotheses.** F is a number field with its finite places ordered by norm (N.8/tate-norm-filtration); v = v_m is principal in 𝓞_{S_{m−1}}, generated there by π. A global integral generator is not required. W, C and G are arbitrary subsets of U; in the applications they are finite and explicit. In (b) the elements a and b are integral, and N_{F/ℚ} is the field norm; in (c) the tame kernel is the unramified subgroup, identified with K₂(𝓞_F) by K2SymbolsBrauer T.5/tame-kernel-sequence.

**Proof plan.**

1. Reduction to β. By N.8/tate-norm-filtration, α : U → K₂^{S_m}(F)/K₂^{S_{m−1}}(F) is onto, ∂_v ∘ α = β, and α and β both kill U₁. So ∂_v ∘ ᾱ = β̄ on U/U₁ with ᾱ onto, and it suffices to prove ker β ⊆ U₁: then β̄ is injective, hence ᾱ is injective, hence bijective, and ∂_v = β̄ ∘ ᾱ^{−1} is injective. ∂_v is onto because β(G) generates the finite group k(v)^×.
2. β̄ is injective on the image C̄ of C. In the finite group k(v)^× every element is a positive word in β(G): replace the inverse of each β(g) by β(g)^{ord(β(g))−1}. This is necessary because (2) is assumed only for multiplication by G, not by G^{−1}. Given c, c′ ∈ C with β(c) = β(c′), choose g₁, …, g_r ∈ G with β(c·g₁⋯g_r) = 1. Applying (2) r times gives c·g₁⋯g_r ∈ c_r·U₁ with c_r ∈ C and β(c_r) = 1, so c_r ∈ U₁ by (3) and c·g₁⋯g_r ∈ U₁. The same word gives c′·g₁⋯g_r ∈ U₁, hence c/c′ ∈ U₁.
3. C̄ = U/U₁. C̄ is finite, since β̄ is injective on it. By (2), multiplication by ḡ (g ∈ G) maps C̄ into itself, injectively, hence bijectively; so C̄ is stable under the subgroup ⟨Ḡ⟩ and contains it, because 1 ∈ C. As β̄ is injective on C̄ and β̄(⟨Ḡ⟩) = k(v)^×, C̄ = ⟨Ḡ⟩ is a subgroup. By (1) it contains W̄, which generates U/U₁. Hence β̄ is injective on U/U₁, which is (a).
4. (b): the case a = b gives a/b = 1. Otherwise the ideal J = (a − b)·v^{−1} is integral, with absolute norm |N(a − b)|/N v < N v; all its prime factors have norm strictly below N v and precede v. Since π generates v in 𝓞_{S_{m−1}}, it has valuation 1 at v and 0 at every place outside S_{m−1} ∪ {v}. Therefore d = (a − b)/π has valuation 0 outside S_{m−1}, so d ∈ U, even when d is not integral in 𝓞_F. Now a/b = 1 + π·(d/b) with d/b ∈ U and a/b ∈ U, so a/b ∈ (1 + πU) ∩ U ⊆ U₁. For imaginary quadratic F, |N(a − b)| = |a − b|² ≤ (|a| + |b|)² < (N v)².
5. (c): every x ∈ K₂(F) lies in some K₂^{S_m}(F). If x is unramified and m > m₀, then ∂_{v_m}(x) = 1 and bijectivity put x in K₂^{S_{m−1}}(F); descend to m₀. With m₀ = 0, conversely K₂^{S_0}(F) ⊆ K₂(𝓞_F), since symbols of units are unramified (T.5/unramified-subgroup).

**Dependencies.** `ArithmeticKTheory:N.8/tate-norm-filtration`, `K2SymbolsBrauer:T.3/tame-symbol`, `K2SymbolsBrauer:T.5/unramified-subgroup`, `K2SymbolsBrauer:T.5/tame-kernel-sequence`.

**Checks.**

- For F = ℚ(i) and v = (1 + i): W = {i} and C = G = {1} satisfy (1)–(3), because i = 1 + (1 + i)·i lies in (1 + πU) ∩ U; so the graded residue at the place of norm 2 is bijective onto the trivial group 𝔽₂^×.
- For ℚ(i) the explicit rounding sets satisfy the criterion at every place. For ℚ(√5), the large-prime small-fraction construction and the eleven finite certificates instead prove U/U₁ ≅ k(v)× directly; the same triangle and descent apply.
- The strict bound |N(a−b)| < (Nv)² ensures earlier prime support even when several places have the same norm. Equality is not sufficient.

**Source.** [BassTate.1973](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/SLN342.pdf), Appendix, Proposition 1 and its proof, pp. 430–431 (A2–A3; PDF pp. 440–441). The three-set criterion, including the positive-word argument in the finite residue group. [BassTate.1973](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/SLN342.pdf), II §3, proof of Lemma 3.4, Claim 2, pp. 410–411 (internal pp. 63–64; PDF pp. 420–421). The ideal-norm proof for integral congruent units; the localized generator need not be globally integral. [BassTate.1973](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/SLN342.pdf), II §3, Theorem 3.1, p. 403, and Appendix A1, p. 429 (PDF pp. 413, 439). Finite prime support and descent of unramified elements.

### K₂ of the Gaussian integers vanishes, by Tate's method

**Target:** `ArithmeticKTheory:N.8/gaussian-tame-kernel-vanishes`.

**Planet:** K₂ of the Gaussian integers vanishes.

K₂(ℤ[i]) = 0. More precisely, for F = ℚ(i) with its places ordered by norm, the graded residue ∂_{v_m} : K₂^{S_m}(F)/K₂^{S_{m−1}}(F) → k(v_m)^× is bijective for every m ≥ 1, and K₂^{S_0}(F) is generated by {i, i}, which is trivial; so the tame kernel, which is K₂(ℤ[i]) (K2SymbolsBrauer T.5/tame-kernel-sequence), vanishes. At a place of norm at least 5 Tate's criterion applies with C = G = the non-zero Gaussian integers c with 2N(c) ≤ N v, and W = {i} together with generators of the earlier primes; at the place 1 + i of norm 2 it applies with W = {i} and C = G = {1}. This is the span obligation of the Gaussian certificate of N.8/gaussian-and-imaginary-quadratic: the empty presentation generates.

**Hypotheses.** F = ℚ(i), 𝓞_F = ℤ[i], a Euclidean domain (mathlib:GaussianInt.norm_mod_lt) and so a principal ideal domain, with unit group ⟨i⟩ of order 4; N(x) = |x|² = x·x̄. The places are the Gaussian primes up to units, of norms 2 (the prime 1 + i), p for p ≡ 1 mod 4 (two places) and p² for p ≡ 3 mod 4; every place other than 1 + i has norm at least 5. The vanishing is unconditional and uses no zeta value.

**Proof plan.**

1. Small representatives. For π ≠ 0 every residue class mod π contains an r with 2N(r) ≤ N(π): round x/π to the nearest Gaussian integer, with error at most 1/2 in each coordinate. This is the intermediate bound normSq ≤ normSq(1/2 + i/2) = 1/2 in the proof of mathlib:GaussianInt.normSq_div_sub_div_lt_one, whose stated conclusion is only < 1; this roadmap requires the stronger factor-two bound as a proof step, without claiming a declaration in the main suggested Lean file.
2. Places of norm at least 5. Let v = v_m = (π), U = U_{m−1} = ⟨i⟩ × ∏_{j<m} π_j^ℤ. Put C = G = {c ∈ ℤ[i] : c ≠ 0, 2N(c) ≤ N v} and W = {i, π₁, …, π_{m−1}}, which generates U. Each c ∈ C has N(c) < N v, so its prime factors precede v and C ⊆ U ∩ ℤ[i]; and β(C) = k(v)^× by step 1.
3. Check (1)–(3) of N.8/tate-criterion with its part (b) in the form |a| + |b| < N v. (3): 1 ∈ C, and for c ∈ C ∩ ker β, |c| + 1 ≤ √(N v/2) + 1 < N v. (2): for c, c′ ∈ C choose c″ ∈ C with β(c″) = β(cc′); then |cc′| + |c″| ≤ N v/2 + √(N v/2) < N v because N v > 2. (1): for w ∈ W choose c ∈ C with β(c) = β(w); then |c| + |w| ≤ (1 + 1/√2)·√(N v) < N v because N v ≥ 5 > (1 + 1/√2)² ≈ 2.91. So ∂_v is bijective.
4. The place 1 + i. Here N v = 2, U = ⟨i⟩ and k(v)^× = 1. Take W = {i} and C = G = {1}: i = 1 + (1 + i)·i lies in (1 + πU) ∩ U ⊆ U₁, so (1)–(3) hold and ∂_{v₁} is bijective, that is K₂^{S_1}(F) = K₂^{S_0}(F). Directly: the Steinberg identity {i, 1 − i} = 1, 1 − i = −i(1 + i) and {i, −i} = 1 give {i, 1 + i} = 1.
5. Step 0. K₂^{S_0}(F) is generated by {i, i}, and {i, i} = {i, −1} = {i, i²} = {i, i}² (K2SymbolsBrauer T.2/symbol-consequences), so {i, i} = 1 and K₂^{S_0}(F) = 1.
6. By N.8/tate-criterion (c) with m₀ = 0, K₂(ℤ[i]) = K₂^{S_0}(F) = 1.

**Dependencies.** `ArithmeticKTheory:N.8/tate-criterion`, `ArithmeticKTheory:N.8/tate-norm-filtration`, `K2SymbolsBrauer:T.2/symbol-consequences`, `K2SymbolsBrauer:T.2/steinberg-identity`, `K2SymbolsBrauer:T.2:symbols/symbol-negative-unit`, `K2SymbolsBrauer:T.5/tame-kernel-sequence`, `mathlib:GaussianInt.normSq_div_sub_div_lt_one`, `mathlib:GaussianInt.norm_mod_lt`.

**Checks.**

- {−1, −1} = {i², i²} = {i, i}⁴ = 1 in K₂(ℚ(i)), whereas {−1, −1} is the non-trivial element of K₂(ℤ) (K2SymbolsBrauer T.5/k2-of-the-integers): restriction to ℚ(i) kills it.
- At v = (2 + i), N v = 5: ℤ[i]/(2 + i) ≅ 𝔽₅ with i ↦ −2, the elements ±1, ±i already map onto 𝔽₅^× = {1, 4, 3, 2}, and C = {±1, ±i, ±1 ± i}.
- The bound N v ≥ 5 in step 3 is used: at the place of norm 2 the inequality |c| + |w| < N v fails for c = w = 1, and that place is treated by the explicit unit identity i = 1 + (1 + i)·i.
- With this theorem the Gaussian certificate is complete: empty presentation, span by this node, trivial lower bound; no zeta value and no Birch–Tate statement enters.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.2.2 (Example 5.2.2), printed p. 218 (PDF p. 226). The statement and its attribution to Tate. [BassTate.1973](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/SLN342.pdf), Appendix, Proposition 2 and Lemma 2, pp. 431–433; d = −4 calculation, p. 436 (PDF pp. 441–443, 446). Gaussian division has covering radius 1/√2. The packet spells out the norm-two step separately and applies Proposition 1 at all remaining places; it does not use Appendix Proposition 3 or an unproved two-primary input.

### The Gaussian tame kernel and K₃(ℚ(i)) ≅ ℤ ⊕ ℤ/24

**Target:** `ArithmeticKTheory:N.8/gaussian-and-imaginary-quadratic`.

For F=Q(i), the Tate norm-filtration certificate proves K2(Z[i])=0. Independently N.8/arithmetic-k3-examples gives K3(Z[i])≃K3(Q(i))≃Z⊕Z/24 from the N.5 odd structure theorem and w2(Q(i))=24. These statements use no Bloch-group calculation. The empty tame-kernel presentation has a separate spanning proof (N.8/gaussian-tame-kernel-vanishes), rather than an inferred upper bound from an empty list of generators.

**Hypotheses.** The field is the Gaussian rationals and the ring is the Gaussian integers; the field is totally imaginary with one complex place and no real place. The structure theorem for the third K-group is the source's Corollary 5.3, which K3BlochGroups V.5 owns and this layer imports; the case distinction between the totally imaginary case and the case with a real place is part of it. The value twenty-four for the invariant is computed by N.7's node and is the same as for the rationals.

**Proof plan.**

1. Apply the independent Gaussian Tate norm-filtration theorem for the empty K2 presentation and its spanning proof. Separately import N.8/arithmetic-k3-examples. The arithmetic inputs are signature (0,1) and w2(Q(i))=24. Export the K3 group to V.5.

**Dependencies.** `ArithmeticKTheory:N.8/gaussian-tame-kernel-vanishes`, `ArithmeticKTheory:N.8/certified-example-format`, `ArithmeticKTheory:N.6/order-certificate`, `ArithmeticKTheory:N.8/arithmetic-k3-examples`.

**Checks.**

- The tame kernel of the Gaussian integers vanishes, while that of the integers has order two; the difference is the absence of a real place.
- The third K-group of the Gaussian rationals has torsion of order twenty-four and that of the rationals of order forty-eight, and both are instances of the same formula.
- The vanishing is Tate's computation, proved in N.8/gaussian-tame-kernel-vanishes by Tate's criterion at every place; a formalisation may not derive it from the structure theorem, which does not give the tame kernel.
- The certificate is complete: the presented group and the lower-bound group are both trivial, so soundness gives K₂(ℤ[i]) = 0 with no appeal to a zeta value.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.5.3 (Corollary 5.3), printed p. 488 (PDF p. 496). The structure theorem in both cases [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.5.2.2 (Example 5.2.2), printed p. 218 (PDF p. 226). Tate's vanishing for Z[i] and the other rings

### The localisation sequence of the integers with one prime inverted, in every degree

**Target:** `ArithmeticKTheory:N.8/s-integer-sequence-for-one-inverted-prime`.

Let p be a prime. The localisation sequence of ℤ ⊂ ℤ[1/p], whose fibre term is K_*(𝔽_p) (N.2/finite-support with R = ℤ and s = p), breaks up into short exact sequences 0 → K_n(ℤ) → K_n(ℤ[1/p]) → K_{n−1}(𝔽_p) → 0 for every n ≥ 1, and K₀(ℤ) → K₀(ℤ[1/p]) is an isomorphism. Hence K_n(ℤ[1/p]) ≅ K_n(ℤ) for odd n ≥ 3; for n = 2i ≥ 2, K_{2i}(ℤ[1/p]) is an extension of ℤ/(p^i − 1) by K_{2i}(ℤ), of order #K_{2i}(ℤ)·(p^i − 1); and in degree one K₁(ℤ[1/p]) = ℤ[1/p]^× = {±1} × p^ℤ ≅ ℤ/2 ⊕ ℤ (KTheoryLowDegrees U.6). In degree two the sequence is K2SymbolsBrauer T.5's relative sequence 0 → K₂(ℤ) → K₂(ℤ[1/p]) → 𝔽_p^× → 0 (residue at p ∈ S), imported, and it splits: the retraction K₂(ℚ) → K₂(ℤ) given by the real sign symbol (T.5/k2-of-the-rationals) restricts to K₂(ℤ[1/p]). In the degrees 2i ≥ 4 the extension class is not determined here. The demonstration is what the layer's text asks for ('demonstrate the S-integer exact sequence for Z[1/p]'), and N.8 owns it in every degree (RT-AREA-ktheory-1/9).

**Hypotheses.** p is a prime; S = {p} (with the infinite place for the K-book's count of S-units); the ring is ℤ[1/p]. The localisation sequence is N.2's (the sequence of R → R[1/s] of N.2/finite-support); the injectivity of K_n(ℤ) → K_n(ℚ) for n ≥ 1 is Bass–Milnor–Serre in degree one (SK₁(ℤ) = 0), N.2/even-degree-injectivity in even degrees (T.5 in degree two) and Soulé's theorem (N.5/soule-theorem) in odd degrees n ≥ 3. The extension class in degrees 2i ≥ 4 is not claimed; in degree two the splitting comes from the real place.

**Proof plan.**

1. Take the localisation sequence of ℤ → ℤ[1/p] with fibre K_*(𝔽_p) (N.2/finite-support, dévissage for the p-torsion modules): ⋯ → K_n(𝔽_p) → K_n(ℤ) → K_n(ℤ[1/p]) → K_{n−1}(𝔽_p) → K_{n−1}(ℤ) → ⋯.
2. For n ≥ 1, K_n(ℤ) → K_n(ℚ) is injective (SK₁(ℤ) = 0, KTheoryLowDegrees U.6; N.2/even-degree-injectivity for even n; N.5/soule-theorem with S = ∅ for odd n ≥ 3); it factors through K_n(ℤ[1/p]), so K_n(ℤ) → K_n(ℤ[1/p]) is injective and every map K_n(𝔽_p) → K_n(ℤ), n ≥ 1, is zero.
3. Degree zero: K₀(𝔽_p) → K₀(ℤ) sends [𝔽_p] to [ℤ] − [pℤ] = 0 (N.2/the-three-classical-rows (a)), so 0 → K₁(ℤ) → K₁(ℤ[1/p]) → K₀(𝔽_p) = ℤ → 0 is exact and K₀(ℤ) ≅ K₀(ℤ[1/p]).
4. Insert Quillen's K_*(𝔽_p) (KTheoryFiniteLocalFields L.1): K_{2i}(𝔽_p) = 0 and K_{2i−1}(𝔽_p) ≅ ℤ/(p^i − 1) for i ≥ 1; this gives the odd-degree isomorphisms and the even-degree extensions.
5. Degree two: identify the sequence with T.5/relative-s-integer-sequence, and split it by restricting the retraction of T.5/k2-of-the-rationals.
6. Degree one: compare with K₁(ℤ[1/p]) = ℤ/2 ⊕ ℤ (KTheoryLowDegrees U.6), the map to K₀(𝔽_p) = ℤ being the p-adic valuation.

**Dependencies.** `ArithmeticKTheory:N.8/k-groups-of-the-integers`, `ArithmeticKTheory:N.2/finite-support`, `ArithmeticKTheory:N.2/the-three-classical-rows`, `ArithmeticKTheory:N.2/even-degree-injectivity`, `ArithmeticKTheory:N.5/soule-theorem`, `KTheoryFiniteLocalFields:L.1`, `KTheoryLowDegrees:U.6`, `K2SymbolsBrauer:T.5/relative-s-integer-sequence`, `K2SymbolsBrauer:T.5/k2-of-the-rationals`.

**Checks.**

- p = 2: K₂(ℤ[1/2]) ≅ K₂(ℤ) = ℤ/2, since 𝔽₂^× is trivial.
- p = 3: K₂(ℤ[1/3]) ≅ ℤ/2 ⊕ ℤ/2, split by the real sign symbol.
- K₃(ℤ[1/p]) ≅ K₃(ℤ) ≅ ℤ/48 for every p, and K₄(ℤ[1/p]) ≅ ℤ/(p² − 1) since K₄(ℤ) = 0 (the source's table); for p = 2 this is ℤ/3.
- Degree one: 0 → {±1} → {±1} × p^ℤ → ℤ → 0, the last map the p-adic valuation.
- A formalisation that asserted a splitting in degrees 2i ≥ 4 would be claiming more than the argument gives.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.1 (Classical Data), printed p. 513 (PDF p. 521). The degree-zero and degree-one formulas. The printed rank r2 + |S| − 1 is wrong for fields with real places (it gives rank 0 for Z[1/p]); the node uses the correct rank r1 + r2 + |S| − 1 = 1, recorded as ArithmeticKTheory/E1 [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.5.1 (Application 6.5.1), printed p. 236 (PDF p. 244). The sequence for the integers, which is one of the two compared [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), V.6.1, Application 6.1 and (6.1.1) (PDF p. 414; book p. 406). The localisation sequence for R → R[1/s], here with R = ℤ and s = p, whose fibre is G_*(ℤ/p) = K_*(𝔽_p).

### The rationals: an infinite second K-group over a tame kernel of order two

**Target:** `ArithmeticKTheory:N.8/the-rationals-infinite-against-finite`.

The explicit check the layer's text asks for: the second K-group of the rationals is infinite, being the direct sum of a cyclic group of order two and the direct sum over the primes of the multiplicative groups of the prime fields, while the tame kernel, that is the second K-group of the integers, has order two. The two statements are consistent because the tame-kernel sequence is exact and its right-hand term is the infinite direct sum; the splitting is given by the sign symbol at the real place. Both halves are K2SymbolsBrauer T.5's and are imported; what this node adds is the check itself and its record as a certified example.

**Hypotheses.** The field is the rationals and the ring the integers. Both computations are imported from K2SymbolsBrauer T.5 (T.5/k2-of-the-integers and T.5/k2-of-the-rationals); the sign symbol that splits the sequence is that layer's own contribution. The infinite direct sum is over all primes, and each summand is finite cyclic, so the sum is infinite but torsion.

**Proof plan.**

1. Record the two statements with their owner.
2. Record the exact sequence that relates them and the splitting by the sign symbol.
3. Perform the check: the finite group on the left and the infinite group in the middle are consistent exactly because the right-hand term is infinite.
4. Record the resulting certified example: three numbers, the order two, the infinitude, and the splitting, each tagged with its status.
5. Record the contrast with the Gaussian case, where the tame kernel vanishes and there is no real place to split the sequence.

**Dependencies.** `ArithmeticKTheory:N.8/certified-example-format`, `ArithmeticKTheory:N.8/s-integer-sequence-for-one-inverted-prime`, `K2SymbolsBrauer:T.5/k2-of-the-integers`, `K2SymbolsBrauer:T.5/k2-of-the-rationals`.

**Checks.**

- The second K-group of the rationals is infinite and torsion, which is not a contradiction.
- The tame kernel has order two and is a direct summand, by the sign symbol.
- The example is admissible in the sense of this layer's format: every number is tagged and none is deduced from Birch-Tate.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), III.6.5.1 (Application 6.5.1), printed p. 236 (PDF p. 244). The decomposition that makes the check

### Small congruent tuples in the golden embedding lattice

**Target:** `ArithmeticKTheory:N.8/golden-congruence-lattices`.

Let F = ℚ(√5), O = ℤ[ε], ε = (1+√5)/2, and σ₁,σ₂ its real embeddings. Put d = 2√5/π and B_t = {(z₁,z₂) ∈ ℝ² : (z₁²+z₂²)/2 ≤ t}. For a prime v of norm q, s ∈ {2,3}, and a₁,…,a_{s−1} ∈ k(v)×, define L(a) ⊆ O^s by x_j mod v = a_j (x_s mod v). Its real-embedding covolume is 5^(s/2) q^(s−1). If t > 0 and t^s ≥ d^s q^(s−1), then for every positive diagonal stretch ξ with determinant one there is a nonzero tuple of L(a) with all coordinates in ξB_t. If also t < q, every coordinate is nonzero and belongs to the preceding S-unit group U.

**Hypotheses.** The arithmetic presentation, discriminant 5, integral basis (1,ε), units ±ε^n, and splitting laws are imported from NumberFieldArithmetic Layers 3 and 7 and its ℚ(√5) example, not new arithmetic targets. S consists of all primes before v in a fixed nondecreasing-norm enumeration; ties have a fixed arbitrary order. The same stretch is applied to every coordinate of a tuple.

**Proof plan.**

1. The map O^s → k(v)^(s−1), (x₁,…,x_s) ↦ (x_j−a_j x_s)_j, is onto: choose x_s = 0 and lift the other coordinates. Its kernel has index q^(s−1). The real embedding matrix for (1,ε) has determinant −√5, so the lattice covolume is 5^(s/2) q^(s−1).
2. The disk B_t has area 2πt. Its s-fold product is compact, convex and centrally symmetric in dimension 2s, and has volume (2πt)^s. The displayed inequality is precisely (2πt)^s ≥ 2^(2s)5^(s/2)q^(s−1). A positive diagonal stretch of determinant one preserves this volume. Apply the pinned compact Minkowski theorem, including its non-strict volume inequality.
3. For a coordinate x, |N(x)| ≤ t by the arithmetic–geometric mean inequality; this remains true after the stretch. If any coordinate were zero, the congruences and the nonzero a_j would force all coordinates to vanish modulo v. Any nonzero coordinate would then have integral norm at least q, contradicting t < q. Thus all coordinates are nonzero. Every prime divisor of each coordinate has norm ≤ |N(x)| < q and therefore precedes v.

**Dependencies.** `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-7-subfields-integral-bases-monogenicity-and-explicit-units`, `mathlib:MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_le_measure`, `ArithmeticKTheory:N.8/tate-norm-filtration`.

**Uses.** N.8/golden-residue-section and golden-large-prime-cutoff: Constructs the small fractions and common-denominator triples; it supplies actual earlier units before taking any quotient.

**API.**

- `GoldenCongruenceLattice` (data): For s=2 or 3 and specified nonzero residues, the kernel L(a) of the displayed congruence map, embedded in (ℝ²)^s.
- `GoldenCongruenceLattice.covolume` (characterisation): covolume L(a) = 5^(s/2) q^(s−1).
- `GoldenCongruenceLattice.smallTuple` (constructor): For t>0, t^s ≥ d^s q^(s−1), and a positive determinant-one stretch, a nonzero tuple in the product of stretched B_t.
- `GoldenCongruenceLattice.oldUnits` (characterisation): When t<q every coordinate of the small tuple is a nonzero preceding S-unit.

**Unit tests.**

- `golden_lattice_two`: For s=2, covolume is 5q and the volume condition is t² ≥ d²q.
- `golden_lattice_three`: For s=3, covolume is 5√5 q² and the volume condition is t³ ≥ d³q²; replacing q² by q would fail the kernel-index calculation.
- `golden_lattice_stretch`: The stretch diag(2,1/2) preserves covolume and |z₁z₂|; smallTuple still gives |N(x_j)|≤t.
- `golden_lattice_boundary`: At v=(2), q=4, s=2 and t=q, the tuple (2,2) lies in L(1) and in B_4² but its coordinates have zero residue and are not preceding S-units. The strict inequality t<q is essential.

**Checks.**

- For s=2, t=d√q supplies a small fraction of each nonzero residue. For s=3, t=d q^(2/3) supplies two prescribed residues with a common denominator.
- No estimate larger than q is used to infer membership in U. The construction works for either ordering of two split primes of the same norm.

**Source.** [Groenewegen.2004](https://www.ams.org/journals/mcom/2004-73-247/S0025-5718-03-01592-8/), Lemma 6, pp. 1447–1448; Lemma 9, p. 1450; Lemma 12, p. 1453. Specialize the congruence-lattice proofs to degree two. Ordinary Minkowski suffices; no packing-density improvement or Hlawka theorem is imported.

### The small-fraction section of a golden residue group

**Target:** `ArithmeticKTheory:N.8/golden-residue-section`.

For a prime v of F=ℚ(√5) with q=Nv > 4d², let U be the preceding S-units, choose a global generator π_v of v, and put U₁=⟨(1+π_v U)∩U⟩. Reduction induces β̄:U/U₁→k(v)×. For a∈k(v)× choose integral x,y∈U with residue x/y=a and x,y∈B_t, t=d√q. Define γ(a)=[x/y]∈U/U₁. This is independent of the choice and remains the same if the same determinant-one stretch is applied to x and y. Moreover β̄γ=id. More generally small fractions in ξB_t and ξ′B_t′ of equal residue represent the same class whenever 4tt′<q².

**Hypotheses.** Use the actual groups U and U₁ from tate-norm-filtration and the imported PID structure. The small-fraction map is initially a set map; multiplicativity is proved in golden-large-prime-cutoff.

**Proof plan.**

1. If x,y∈ξB_t and x′,y′∈ξ′B_t′ then xy′ and x′y lie in the product stretch ξξ′ of the diamond D_(tt′)={z:|z₁|+|z₂|≤2√(tt′)}. This is Cauchy–Schwarz applied to the two embedding coordinates.
2. Hence |N(xy′−x′y)|≤4tt′<q². The products are integral old units and have the same nonzero residue. Apply tate-criterion(b); if the difference is zero their fractions agree outright. Otherwise (xy′)/(x′y) is in U₁. This proves the comparison including independently chosen determinant-one stretches.
3. For t=d√q the two-coordinate lattice construction applies and t<q. Since 4t²=4d²q<q², comparison gives independence of all choices and stretches. Reduction of x/y is the prescribed residue, so β̄γ=id.

**Dependencies.** `ArithmeticKTheory:N.8/golden-congruence-lattices`, `ArithmeticKTheory:N.8/tate-criterion`.

**Uses.** N.8/golden-large-prime-cutoff: The three-coordinate construction proves multiplicativity; comparison against all old-unit generators then proves that this section is a two-sided inverse.

**API.**

- `GoldenResidueSection` (constructor): The map a↦[x/y] defined by a small integral old-unit fraction in B_(d√q).
- `GoldenResidueSection.independent` (characterisation): Any two such choices, with arbitrary common determinant-one stretches on the two entries of each fraction, give the same class.
- `GoldenResidueSection.compare` (relation): Equal-residue fractions with parameters t,t′ and 4tt′<q² give the same class in U/U₁.
- `GoldenResidueSection.reduction` (compatibility): β̄∘γ=id on k(v)×.
- `GoldenResidueSection.one` (simp): γ(1)=1.

**Unit tests.**

- `golden_section_one`: For every q>4d², the witness x=y=1 gives γ(1)=1.
- `golden_section_zero_difference`: Comparing x/y with itself gives determinant xy−xy=0 and equality of classes without dividing by that zero difference.
- `golden_section_stretched`: For q>4d², the fractions obtained with ξ=diag(2,1/2) and ξ′=id for the same residue have equal classes.
- `golden_section_not_representative`: At v=(2), the integral old unit ε has residue of order 3; choosing its residue representative supplies neither the other residues nor multiplicativity. Those require smallTuple and the separate denominator-triple argument.

**Checks.**

- γ(1)=1, using x=y=1 (t>1) and comparison.
- The fraction construction supplies every nonzero residue using entries in U. Merely bounding an arbitrary integral representative by a multiple greater than q would not do this.

**Source.** [Groenewegen.2004](https://www.ams.org/journals/mcom/2004-73-247/S0025-5718-03-01592-8/), §3, Proposition 10 and definition of γ, pp. 1450–1451. The norm-difference comparison and choice-independent section, with n=2 and the ordinary density bound 1.

### A norm-thirty-three cutoff for the golden tame kernel

**Target:** `ArithmeticKTheory:N.8/golden-large-prime-cutoff`.

For every prime v of ℚ(√5) with q=Nv>33, β̄:U/U₁→k(v)× is an isomorphism, with inverse γ. Consequently the graded tame residue is an isomorphism at v, and every unramified element of K₂(F) lies in the symbol subgroup generated by S-units for primes of norm at most 33.

**Hypotheses.** All arithmetic of F, including O×=⟨−1,ε⟩ and the absence of prime ideals of norm below 4, is imported from NumberFieldArithmetic and its worked example. Primes of equal norm are separate steps in a fixed ordering. An earlier prime p′ can have norm q′=q. Set d=2√5/π, t=d√q and s=d q^(2/3).

**Proof plan.**

1. Numerical bounds. It suffices that q exceeds 16d², (20d)^(2/3), d³ and 2^(12/5)d^(12/5). From π>157/50 one has 16d²=320/π²<33. Also d<3/2, hence (20d)^(2/3)<10 and d³<27/8. Finally d<16 implies 2^(12/5)d^(12/5)<16d². These bounds also imply q>4d², s<q and 4st<q².
2. Multiplicativity. For a,b∈k(v)×, the three-coordinate lattice gives x,y,z∈B_s∩O∩U of residues x/z=a and y/z=ab. The two-coordinate lattice gives x′,z′∈B_t∩O∩U with residue x′/z′=b. Comparison, since 4st<q², identifies γ(a)=[x/z] and γ(ab)=[y/z]. The products xx′ and yz′ have the same residue and difference norm ≤4st<q², so their quotient lies in U₁. Thus γ(a)γ(b)=γ(ab). Together with γ(1)=1 this gives a group homomorphism.
3. All old prime generators. For each earlier prime p′ of norm q′≤q, apply compact Minkowski to the fractional ideal p′⁻¹, covolume √5/q′, in the square |z_i|≤(√5/q′)^(1/2). Its area is exactly four times that covolume. Obtain nonzero π′∈p′⁻¹. The integral ideal (π′)p′ has norm ≤√5<4. Since every nontrivial integral ideal has a prime divisor of norm ≥4, this ideal is O. Thus π′ is an inverse generator of p′ and each |σ_i(π′)|<1. Together with −1,ε these elements generate U.
4. Compare such π′ with its small fraction x/y∈B_t. The difference z=π′y−x lies in p′⁻¹ and in B_(4t), so J=(z)p′ is integral with norm ≤4tq′≤4d q^(3/2)<q²; z is zero or has residue zero at v. In the nonzero case J=vJ₀ with NJ₀<q. The ideal (z/π_v)=J₀/p′ therefore has only preceding support, even if q′=q, so z/π_v∈U and π′/(x/y)=1+π_v(z/(π_v x)) lies in U₁. The zero case is equality. Hence γβ(π′)=[π′].
5. The two ordinary units. For a=−1 or ε set H=∏_i max(1,|σ_i(a)|), equal to 1 or (1+√5)/2<5. Choose ξ_i=√H/max(1,|σ_i(a)|), whose product is 1, and represent β(a) by x/y with x,y∈ξB_t. Both x and ay lie in B_(tH), hence |N(ay−x)|≤4tH≤20d√q<q². The norm-congruence lemma gives [a]=[x/y]=γβ(a). Multiplicativity extends this equality from all the listed generators to U/U₁.
6. Thus γβ̄=id as well as β̄γ=id. By tate-norm-filtration, ᾱ is onto and ∂ᾱ=β̄, so ᾱ and the graded residue ∂ are isomorphisms. For an unramified element, finite prime support and injectivity strip one largest prime at a time until only primes of norm≤33 remain.

**Dependencies.** `ArithmeticKTheory:N.8/golden-residue-section`, `ArithmeticKTheory:N.8/golden-congruence-lattices`, `ArithmeticKTheory:N.8/tate-norm-filtration`, `ArithmeticKTheory:N.8/tate-criterion`, `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-7-subfields-integral-bases-monogenicity-and-explicit-units`, `mathlib:MeasureTheory.exists_ne_zero_mem_lattice_of_measure_mul_two_pow_le_measure`.

**Checks.**

- This is an upper-generation proof, independent of sign symbols, ζ_F(−1), w₂(F) and Birch–Tate.
- Equal-norm primes cause no unproved strict inequality q′<q: the proof explicitly uses q′≤q and divides by the earlier p′.
- Only ordinary Minkowski and the explicit imported unit basis are needed. The proof does not use the general small-unit theorem whose source imports Lenstra, nor a sharp packing constant.

**Source.** [Groenewegen.2004](https://www.ams.org/journals/mcom/2004-73-247/S0025-5718-03-01592-8/), §4, p. 1451; §6, pp. 1452–1453; Lemma 12 and Proposition 13, p. 1453; Theorems 14–15, pp. 1454–1455. The section, denominator trick, inverse on generators and descent are specialized with density bound 1. The explicit golden units replace the general §5 small-unit input. Every strict estimate used for cutoff 33 is supplied above.

### Eleven exact residue-step certificates below the cutoff

**Target:** `ArithmeticKTheory:N.8/golden-finite-prime-certificates`.

The certificateData of this node specifies the eleven primes of O=ℤ[ε] of norm≤33, in this order: (2) of norm4, (−1+2ε) of norm5, (3) of norm9; then (3+ε),(4−ε) of norm11, (4+ε),(5−ε) of norm19, (5+ε),(6−ε) of norm29 and (5+2ε),(7−2ε) of norm31. For each step its oldUnitGenerators are −1,ε and exactly the preceding listed prime generators. The data gives residues generating k(v)×, unit-kernel witnesses, selected maximal minors and their gcd q−1. They certify β̄:U/U₁≅k(v)× at each of these eleven steps.

**Hypotheses.** Coordinates [a,b] mean a+bε, with multiplication [a,b][c,e]=[ac+be,ae+bc+be], conjugation [a+b,−b] and norm a²+ab−b². Negative generator exponents are evaluated in F using this conjugation divided by the norm. The finite list fixes the order within every tied norm. A finite certificate for one such order is sufficient; the large-prime proof above works for any fixed order. Primality, splitting and generation of O× are imported from NumberFieldArithmetic.

**Proof plan.**

1. Completeness and primes. For rational primes≤33 the polynomial X²−X−1 is irreducible modulo 2,3,7,13,17,23 and ramified modulo5; it splits modulo11,19,29,31. The inert norms below the cutoff are only 2²=4 and 3²=9. The displayed generators have the listed norms; at a split prime the two values −a/b modulo q are distinct roots of X²−X−1. Thus they are distinct primes, and no prime of norm≤33 is omitted.
2. Each data item stores precedingPrimeGenerators, oldUnitGenerators, residueImages, latticeRelations, minors and gcdOfMinors. Verify the preceding list exactly. At q=4,9 reduce coordinate pairs modulo 2,3 and multiply using ε²=ε+1; at the other primes send ε to −a/b modulo q for primeGenerator=[a,b]. Check every old generator has nonzero residue, and close the residue images under multiplication to verify that the subgroup has q−1 elements.
3. For each unit-kernel row verify a and b by their aFactors and bFactors, and w=differenceOverPrime by quotientFactors, all as exact rational coordinate pairs. Check a−b=π_v w. All three are products of old generators, so a/b=1+π_v(w/b) lies in U₁; its relation vector is exactly aFactors−bFactors. A torsion row is checked by verifying its generator product equals 1. No bound on a,b,w and no norm comparison are needed in these finite steps.
4. Soundness of the index certificate. Let e:ℤ^n→U be the surjective exponent map and L the lattice spanned by the relation vectors. The checks give e(L)⊆U₁, hence surjections ℤ^n/L→U/U₁→k(v)×. Any listed nonzero maximal minor gives a full-rank sublattice M⊆L with [ℤ^n:M]=|det M| by the pinned index–determinant theorem. Therefore [ℤ^n:L] divides every selected nonzero determinant, and hence their gcd q−1. Residue surjectivity forces its order to be at least q−1, so both displayed surjections are isomorphisms. This proves ker β=U₁ and, by the triangle with α, bijectivity of the graded tame residue.

**Dependencies.** `ArithmeticKTheory:N.8/tate-norm-filtration`, `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-7-subfields-integral-bases-monogenicity-and-explicit-units`, `mathlib:AddSubgroup.index_eq_natAbs_det`.

**Uses.** N.8/real-quadratic-upper-generation: Eliminates all primes below the geometric cutoff, leaving only symbols of ordinary units.

**API.**

- `GoldenFinitePrimeCertificate` (data): At a named listed prime: its earlier generator list, residue images, relation vectors with exact factorizations a,b,(a−b)/π_v, and selected maximal minors.
- `GoldenFinitePrimeCertificate.verify` (characterisation): All exact factorization equalities, earlier support, residue generation, selected determinants and gcd=q−1 hold.
- `GoldenFinitePrimeCertificate.sound` (compatibility): A verified certificate gives U/U₁≅k(v)× and a bijective graded tame residue through α.
- `goldenFinitePrimeCertificates` (constructor): The eleven data items stored here, with the specified order and cutoff 33.

**Unit tests.**

- `golden_finite_four`: At (2), the residue of ε has order3; selected determinants 6 and −3 have gcd3=q−1, so the quotient has order3.
- `golden_finite_nine`: At (3), the residue polynomial is irreducible and the certified quotient has order8, not the rational-prime unit order2.
- `golden_finite_tie`: At the first norm11 prime, oldUnitGenerators contains no norm11 generator. At the second it contains exactly [3,1]. Supplying the second generator at the first step fails verify.
- `golden_finite_bad_minor`: Changing the first certificate’s selected determinant −3 to −6 fails exact determinant recomputation; a larger common divisor alone would not prove the required index3.

**Checks.**

- Every certificate is independently checkable from the stored integers; no search procedure or unrecorded table is an input.
- The two norm-eleven places occur consecutively, with (3+ε) available only at the second. Reversing their order requires recomputing those finite data.
- The selected determinants need not individually equal q−1. Their gcd, together with the surjective residue map, is the index argument.

**Source.** [BassTate.1973](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/SLN342.pdf), Appendix Proposition 1, pp. 430–431 (PDF pp. 440–441); II §3, Lemma 3.2, pp. 404–407. The unit quotient controls the graded tame symbol. The integer witnesses and index proof here are explicit calculations for this packet, not a table attributed to Bass–Tate. [Groenewegen.2004](https://www.ams.org/journals/mcom/2004-73-247/S0025-5718-03-01592-8/), §2, Lemma 7 and quotient triangle, pp. 1448–1449. A bijective reduction U/U₁→k(v)× suffices. The finite certificates use this criterion without a large-norm hypothesis.

### {−1, −1} and {−1, ε} generate K₂ of the integers of ℚ(√5)

**Target:** `ArithmeticKTheory:N.8/real-quadratic-upper-generation`.

**Planet:** Generators of the tame kernel of ℚ(√5).

For F=ℚ(√5) and ε=(1+√5)/2, the tame kernel K₂(O_F) is generated by {−1,−1} and {−1,ε}. Both generators have order dividing two, so its order is at most four. This follows from direct descent through every prime: the geometric cutoff for norm>33 and eleven exact finite unit-quotient certificates. No restriction to a cyclotomic extension, general two-torsion classification, ζ-value or Birch–Tate formula is used.

**Hypotheses.** The ring of integers, PID property, signature (2,0), units ±ε^n and splitting laws come from NumberFieldArithmetic and its ℚ(√5) worked example. The tame kernel is the unramified subgroup supplied by K2SymbolsBrauer T.5. Use the fixed finite prime order of golden-finite-prime-certificates through norm33, extended arbitrarily in nondecreasing norm.

**Proof plan.**

1. The large-prime theorem proves bijectivity of each graded residue above norm33. The finite certificates prove it at each of the eleven remaining primes, separately including tied norms. By finite-support descent in tate-criterion(c), the unramified subgroup equals step0, generated by symbols of O_F×.
2. Write both symbol entries as products of −1 and ε. Bimultiplicativity and skew-symmetry reduce the unit-symbol subgroup to {−1,−1}, {−1,ε} and {ε,ε}. The diagonal identity {ε,ε}={ε,−1}={−1,ε}^{−1} removes the third symbol.
3. Because the first entry −1 has square1, each remaining symbol has square1. Hence the map (ℤ/2)²→K₂(O_F) given by these symbols is onto. This is the span field required by N.6/order-certificate. The independent real signs are used only in the following node to prove the matching lower bound.

**Dependencies.** `ArithmeticKTheory:N.8/golden-large-prime-cutoff`, `ArithmeticKTheory:N.8/golden-finite-prime-certificates`, `ArithmeticKTheory:N.8/tate-criterion`, `K2SymbolsBrauer:T.2/matsumoto`, `K2SymbolsBrauer:T.2/symbol-consequences`, `K2SymbolsBrauer:T.5/unramified-subgroup`, `K2SymbolsBrauer:T.5/tame-kernel-sequence`, `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-7-subfields-integral-bases-monogenicity-and-explicit-units`.

**Checks.**

- The group has at most four elements before computing any real sign or special value.
- The proof accounts for the full tame kernel, including possible odd-order or order-four elements; it is not just a calculation of its subgroup of elements killed by two.
- The square relation {ε,ε}={ε,−1} is retained with its inverse under skew-symmetry before using the exponent-two conclusion.

**Source.** [BassTate.1973](https://www.sas.rochester.edu/mth/sites/doug-ravenel/otherpapers/SLN342.pdf), II §3, Lemma 3.2, pp. 404–407; Appendix A1–A3, pp. 429–431. Descent to symbols of ordinary units after all graded residue maps have been proved bijective. The final two-generator reduction uses the imported Steinberg-symbol identities. [Groenewegen.2004](https://www.ams.org/journals/mcom/2004-73-247/S0025-5718-03-01592-8/), Theorems 14–15, pp. 1454–1455. The geometric descent strategy, specialized and completed by the explicit small-prime data in this packet.

### An independent tame-kernel certificate for ℚ(√5), exported to SpecialValuesBirchTate B.3

**Target:** `ArithmeticKTheory:N.8/real-quadratic-example-and-birch-tate`.

The required real quadratic example is F = ℚ(√5), with 𝓞_F = ℤ[(1 + √5)/2] and fundamental unit ε = (1 + √5)/2 of norm −1. The arithmetic data to certify are degree 2, signature (2, 0), class number 1 and unit rank 1 with fundamental unit ε. The tame-kernel certificate in N.6's format is K₂(𝓞_F) ≅ (ℤ/2)², generated by {−1, −1} and {−1, ε}. Lower bound: the sign symbols at the two real places, σ₁(√5) > 0 and σ₂(√5) < 0, give a homomorphism K₂(𝓞_F) → K₂(F) → (ℤˣ)² sending {−1, −1} to (−1, −1) and {−1, ε} to (1, −1) (σ₁(ε) > 0 > σ₂(ε)), hence onto a group of order 4; both symbols are symbols of units and so lie in the tame kernel. Upper bound: the finite presentation with generators {−1, −1}, {−1, ε} and relations 2g = 0 for each, whose span obligation — that the two symbols generate K₂(𝓞_F) — is N.8/real-quadratic-upper-generation (the direct norm-thirty-three cutoff and eleven exact residue-step certificates). The certificate uses neither the Birch–Tate formula nor a zeta value: N.8 owns it and exports it to SpecialValuesBirchTate B.3, which combines it with its own computations of ζ_F(−1) = 1/30 and w₂(F) = 120 for the Birch–Tate check 1/30 = 4/120 (RT-AREA-ktheory-1/11); that check is B.3's and supplies neither bound here.

**Hypotheses.** F = ℚ(√5) is real quadratic, so totally real with two real places; the ring is its ring of integers. The format is N.6/order-certificate; the sign symbols are K2SymbolsBrauer T.5/real-sign-symbol at the two real embeddings, and the tame kernel is T.5's unramified subgroup, identified with K₂(𝓞_F) by T.5/tame-kernel-sequence. The upper bound is real-quadratic-upper-generation, by Tate unit-symbol descent in F itself. All arithmetic of F is imported from NumberFieldArithmetic. Although the Birch–Tate formula is a theorem for this abelian field (Wiles, with the two-primary part; SpecialValuesBirchTate), reading #K₂(𝓞_F) = 4 off it would be a corollary, labelled as such, and not a certificate.

**Proof plan.**

1. Import the arithmetic data from NumberFieldArithmetic and its ℚ(√5) example: degree2, signature(2,0), discriminant5, class number1, unit rank1 and fundamental unit ε. These are existing arithmetic results, not targets re-planned in this packet.
2. Lower bound: compute the two sign symbols of {−1, −1} and {−1, ε} (T.5/real-sign-symbol; K-book Ex. III.6.4 for the surjection K₂(F) → {±1}^{r_1}) and conclude that K₂(𝓞_F) → (ℤˣ)² is onto.
3. Upper bound: present K₂(𝓞_F) by the two generators with relations 2g = 0; the span obligation is N.8/real-quadratic-upper-generation.
4. Fill N.6/order-certificate: the presented group (ℤ/2)² and the lower-bound group (ℤˣ)² have order 4, so certificate soundness gives K₂(𝓞_F) ≅ (ℤ/2)², with the two symbols as a basis.
5. Export the certificate to SpecialValuesBirchTate B.3 as the independent input of its Birch–Tate check; its ζ-value and w₂(F) computations are B.3's and fill neither bound.

**Dependencies.** `ArithmeticKTheory:N.8/real-quadratic-upper-generation`, `ArithmeticKTheory:N.8/certified-example-format`, `ArithmeticKTheory:N.6/order-certificate`, `K2SymbolsBrauer:T.5/real-sign-symbol`, `K2SymbolsBrauer:T.5/unramified-subgroup`, `K2SymbolsBrauer:T.5/tame-kernel-sequence`, `mathlib:NumberField.classNumber`, `mathlib:NumberField.Units.rank`, `mathlib:NumberField.InfinitePlace.nrRealPlaces`, `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-7-subfields-integral-bases-monogenicity-and-explicit-units`.

**Checks.**

- The two sign symbols separate {−1, −1} and {−1, ε}: their images (−1, −1) and (1, −1) generate (ℤˣ)².
- Without the generation argument the example would report #K₂(𝓞_F) ≥ 4 only; with N.8/real-quadratic-upper-generation it reports the order 4 and the isomorphism K₂(𝓞_F) ≅ (ℤ/2)².
- The Birch–Tate identity 1/30 = (+1)·4/120 is SpecialValuesBirchTate B.3's check, which uses this certificate as its independent input; an order read off from the formula would be tagged as a corollary and could not fill either bound.
- Every number in the example is tagged: the degree, signature, class number and units are imported arithmetic; order4 is computed from the explicit presentation and independent sign lower bound. No certificate field is deduced from Birch–Tate.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Ex. III.6.4 (PDF p. 251; book p. 243). The two real sign symbols supply the lower bound. The sign computations here are explicit applications, not a source quotation. [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), VI.8.6 (Birch-Tate Conjecture 8.6), printed p. 515 (PDF p. 523). The formula whose independent test in SpecialValuesBirchTate B.3 this certificate feeds, and which may therefore not supply its bounds.

### The arithmetic K3 examples

**Target:** `ArithmeticKTheory:N.8/arithmetic-k3-examples` · **Declaration:** `ArithmeticKTheory.arithmetic_k3_examples`.

The odd structure theorem gives K3(Z)≃K3(Q)≃Z/48 and K3(Z[i])≃K3(Q(i))≃Z⊕Z/24. The ring-to-field isomorphisms are the natural localization maps; the displayed free-plus-torsion decompositions are abstract group isomorphisms and no canonical generator or splitting is claimed. The computations of K0(Z), K1(Z), K2(Z) and K2(Q) are imported from Z.6, U.6 and T.5, and K2(Z[i])=0 remains the independent Tate certificate.

**Hypotheses.** Use n=3, j=2 in N.5, with w2(Q)=w2(Q(i))=24 from N.4. The signatures are (1,0) for Q and (0,1) for Q(i).

**Proof plan.**

1. Import the real mod-eight N.5 theorem at n≡3, r1=1,r2=0: its torsion order is 2w2(Q)=48 and the residual (Z/2)^(r1−1) is trivial.
2. Import the totally imaginary N.5 theorem at j=2, r2=1 and w2(Q(i))=24. The ring-to-field maps are isomorphisms by N.2/Soulé.
3. Export these groups to K3BlochGroups V.5. That roadmap uses its Milnor/decomposable and indecomposable quotient machinery to classify the classes; it supplies none of the arithmetic group calculation here.

**Dependencies.** `ArithmeticKTheory:N.5/the-real-case-modulo-eight`, `ArithmeticKTheory:N.5/totally-imaginary-integral-structure`, `ArithmeticKTheory:N.5/soule-theorem`, `ArithmeticKTheory:N.4/w2-of-the-rationals-and-the-divisibility-tests`, `ArithmeticKTheory:N.7/w-invariant`.

**Checks.**

- The real factor is 48 rather than w2(Q)=24.
- The Gaussian example has a rank-one free part; the vanishing of its K2 tame kernel gives no argument for this free rank.
- No prerequsite path through K3BlochGroups V.5 is introduced.

**Source.** [Kbook.2013](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf), Theorem VI.9.5, book p. 519 (PDF p. 527); Example VI.2.1.2, book p. 470 (PDF p. 478). The general odd-group formula and the cyclotomic w2 calculation give both arithmetic K3 examples without a Bloch-group input.

## Exact arithmetic data for the real-quadratic certificate

These are integer witnesses for the N.8 construction, with its soundness theorem stated above. They are arithmetic data, not source quotations. Write a pair (a,b) for a+bε in Z[ε], ε²=ε+1, and multiply (a,b)(c,d)=(ac+bd,ad+bc+bd). The norm is a²+ab−b². At each prime π the ordered old-unit generators are −1, ε and the preceding prime generators. An exponent vector denotes their product in the field. Each row gives a relation vector u−v, witnesses A=generators^u and B=generators^v with A−B=πC, and the old-unit factorization C=generators^w. Their nonzero equal residues certify a unit-kernel relation. The residue generator images and the selected maximal minors certify surjectivity and that these relations span the entire residue-unit kernel. Read this together with the Tate-criterion soundness proof, not as an oracle determining K2.

### Prime [2, 0] of norm 4

Old generators: [[-1, 0], [0, 1]]. Residue images in that order: [[1, 0], [0, 1]].

| Relation vector | A; B | u; v | C | w |
| --- | --- | --- | --- | --- |
| [1, -3] | [-13, 8]; [-3, 2] | [1, -6]; [0, -3] | [-5, 3] | [1, -4] |
| [0, 3] | [-5, -8]; [-1, -2] | [1, 6]; [1, 3] | [-2, -3] | [1, 4] |
| [1, 3] | [-5, -8]; [1, 2] | [1, 6]; [0, 3] | [-3, -5] | [1, 5] |
| [-1, 3] | [1, 0]; [3, -2] | [0, 0]; [1, -3] | [-1, 1] | [0, -1] |

Selected maximal minors (zero-based column indices in the row order above): [0, 2] ↦ 6; [3, 1] ↦ -3. Their gcd is 3 = Nπ−1.

### Prime [-1, 2] of norm 5

Old generators: [[-1, 0], [0, 1], [2, 0]]. Residue images in that order: [4, 3, 2].

| Relation vector | A; B | u; v | C | w |
| --- | --- | --- | --- | --- |
| [1, 2, 0] | [-16, -16]; [16, 0] | [1, 2, 4]; [0, 0, 4] | [0, -16] | [1, 1, 4] |
| [0, 4, 0] | [-8, -12]; [-4, 0] | [1, 4, 2]; [1, 0, 2] | [-4, -4] | [1, 2, 2] |
| [-1, 3, 1] | [8, -4]; [16, -10] | [0, -2, 2]; [1, -5, 1] | [4, -2] | [0, -2, 1] |

Selected maximal minors (zero-based column indices in the row order above): [0, 1, 2] ↦ 4. Their gcd is 4 = Nπ−1.

### Prime [3, 0] of norm 9

Old generators: [[-1, 0], [0, 1], [2, 0], [-1, 2]]. Residue images in that order: [[2, 0], [0, 1], [2, 0], [2, 2]].

| Relation vector | A; B | u; v | C | w |
| --- | --- | --- | --- | --- |
| [0, 2, 0, 1] | [-15, 5]; [15, -10] | [1, -1, 0, 3]; [1, -3, 0, 2] | [-10, 5] | [1, -2, 0, 2] |
| [0, 2, 1, -1] | [-12, -16]; [0, -10] | [1, 3, 2, 1]; [1, 1, 1, 2] | [-4, -2] | [1, 1, 1, 1] |
| [1, 4, 2, 0] | [-12, -16]; [3, -1] | [1, 3, 2, 1]; [0, -1, 0, 1] | [-5, -5] | [1, 2, 0, 2] |
| [0, 0, -2, 0] | [0, 2]; [0, 8] | [0, 1, 1, 0]; [0, 1, 3, 0] | [0, -2] | [1, 1, 1, 0] |

Selected maximal minors (zero-based column indices in the row order above): [1, 0, 2, 3] ↦ 8. Their gcd is 8 = Nπ−1.

### Prime [3, 1] of norm 11

Old generators: [[-1, 0], [0, 1], [2, 0], [-1, 2], [3, 0]]. Residue images in that order: [10, 8, 2, 4, 3].

| Relation vector | A; B | u; v | C | w |
| --- | --- | --- | --- | --- |
| [0, 4, 0, 0, 1] | [-18, -18]; [-12, 6] | [1, 2, 1, 0, 2]; [1, -2, 1, 0, 1] | [0, -6] | [1, 1, 1, 0, 1] |
| [0, 2, -2, 0, 2] | [-18, -18]; [-8, 0] | [1, 2, 1, 0, 2]; [1, 0, 3, 0, 0] | [-2, -4] | [1, 3, 1, 0, 0] |
| [-1, 0, 1, 1, -1] | [-16, 12]; [-12, 6] | [0, -2, 2, 1, 0]; [1, -2, 1, 0, 1] | [-2, 2] | [0, -1, 1, 0, 0] |
| [-1, -6, 1, 1, 0] | [-16, 12]; [-4, -6] | [0, -2, 2, 1, 0]; [1, 4, 1, 0, 0] | [-6, 6] | [0, -1, 1, 0, 1] |
| [0, -1, -3, 3, 0] | [-15, 5]; [-8, 0] | [1, -1, 0, 3, 0]; [1, 0, 3, 0, 0] | [-3, 2] | [0, -3, 0, 0, 0] |
| [0, -2, 0, 3, 0] | [-15, 5]; [0, -1] | [1, -1, 0, 3, 0]; [1, 1, 0, 0, 0] | [-6, 3] | [1, -2, 0, 0, 1] |
| [1, 6, -1, -1, 0] | [-9, -15]; [18, -6] | [1, 5, 0, 0, 1]; [0, -1, 1, 1, 1] | [-9, 0] | [1, 0, 0, 0, 2] |
| [-1, -1, 0, 0, 1] | [-9, 18]; [-6, -3] | [0, 0, 0, 1, 2]; [1, 1, 0, 1, 1] | [-3, 6] | [0, 0, 0, 1, 1] |
| [0, -6, 0, -1, 0] | [-7, 4]; [-5, -10] | [1, -3, 0, 1, 0]; [1, 3, 0, 2, 0] | [-2, 4] | [0, 0, 1, 1, 0] |
| [1, 1, 0, 0, -1] | [-5, -10]; [15, 15] | [1, 3, 0, 2, 0]; [0, 2, 0, 2, 1] | [-5, -5] | [1, 2, 0, 2, 0] |
| [1, 8, 1, 0, 0] | [-4, -6]; [5, -3] | [1, 4, 1, 0, 0]; [0, -4, 0, 0, 0] | [-3, 0] | [1, 0, 0, 0, 1] |
| [0, 2, 0, 0, -2] | [0, -1]; [9, -9] | [1, 1, 0, 0, 0]; [1, -1, 0, 0, 2] | [-4, 3] | [0, -2, 0, 1, 0] |
| [0, -3, -3, 1, 0] | [10, -5]; [16, 8] | [0, -2, 0, 2, 0]; [0, 1, 3, 1, 0] | [-1, -3] | [1, 2, 0, 1, 0] |
| [0, -4, 4, -1, 0] | [-16, -16]; [-11, -18] | [1, 2, 4, 0, 0]; [1, 6, 0, 1, 0] | [-2, 1] | [1, -2, 0, 0, 0] |
| [-1, -9, 0, 1, 0] | [-15, 10]; [-11, -18] | [0, -3, 0, 2, 0]; [1, 6, 0, 1, 0] | [-4, 8] | [0, 0, 2, 1, 0] |

Selected maximal minors (zero-based column indices in the row order above): [4, 6, 1, 9, 5] ↦ 60; [11, 7, 10, 8, 12] ↦ -30; [2, 0, 3, 14, 13] ↦ -10. Their gcd is 10 = Nπ−1.

### Prime [4, -1] of norm 11

Old generators: [[-1, 0], [0, 1], [2, 0], [-1, 2], [3, 0], [3, 1]]. Residue images in that order: [10, 4, 2, 7, 3, 7].

| Relation vector | A; B | u; v | C | w |
| --- | --- | --- | --- | --- |
| [0, -2, 0, 2, 0, 0] | [-15, -5]; [-4, -5] | [1, 0, 0, 2, 0, 1]; [1, 2, 0, 0, 0, 1] | [-3, -1] | [1, 0, 0, 0, 0, 1] |
| [0, -3, -1, 0, 0, 1] | [-15, 6]; [0, -6] | [1, -2, 0, 0, 1, 1]; [1, 1, 1, 0, 1, 0] | [-3, 3] | [0, -1, 0, 0, 1, 0] |
| [0, 3, 1, -1, 0, 0] | [-6, -10]; [-1, -3] | [1, 5, 1, 0, 0, 0]; [1, 2, 0, 1, 0, 0] | [-2, -3] | [1, 4, 0, 0, 0, 0] |
| [-1, 1, 0, -1, 0, 0] | [-4, 6]; [18, -16] | [0, -1, 1, 0, 0, 1]; [1, -2, 1, 1, 0, 1] | [-4, 6] | [0, -1, 1, 0, 0, 1] |
| [1, 0, 0, -1, -1, 0] | [-1, -3]; [15, 15] | [1, 2, 0, 1, 0, 0]; [0, 2, 0, 2, 1, 0] | [-6, -8] | [1, 3, 1, 1, 0, 0] |
| [0, -6, 0, 0, -1, 0] | [2, -1]; [6, 9] | [0, -2, 0, 0, 0, 0]; [0, 4, 0, 0, 1, 0] | [-2, -4] | [1, 3, 1, 0, 0, 0] |
| [0, 3, 0, 3, 0, -1] | [5, -10]; [7, -5] | [1, 0, 0, 3, 0, 0]; [1, -3, 0, 0, 0, 1] | [-1, -2] | [1, 3, 0, 0, 0, 0] |
| [0, 4, 0, 1, -1, -1] | [8, 14]; [18, 6] | [0, 4, 1, 1, 0, 0]; [0, 0, 1, 0, 1, 1] | [-2, 2] | [0, -1, 1, 0, 0, 0] |
| [0, 0, -1, 0, 1, -1] | [9, 0]; [18, 6] | [0, 0, 0, 0, 2, 0]; [0, 0, 1, 0, 1, 1] | [-3, -3] | [1, 2, 0, 0, 1, 0] |
| [0, 7, 0, 0, 0, -2] | [3, 5]; [13, -3] | [0, 5, 0, 0, 0, 0]; [0, -2, 0, 0, 0, 2] | [-2, 2] | [0, -1, 1, 0, 0, 0] |
| [1, -1, 0, -1, 0, 2] | [-7, -17]; [1, 3] | [1, 1, 0, 0, 0, 2]; [0, 2, 0, 1, 0, 0] | [-4, -8] | [1, 3, 2, 0, 0, 0] |
| [1, 1, 4, -2, 0, -1] | [0, -16]; [15, 5] | [1, 1, 4, 0, 0, 0]; [0, 0, 0, 2, 0, 1] | [-6, -9] | [1, 4, 0, 0, 1, 0] |

Selected maximal minors (zero-based column indices in the row order above): [3, 6, 0, 11, 4, 8] ↦ 70; [10, 2, 9, 1, 5, 7] ↦ -20. Their gcd is 10 = Nπ−1.

### Prime [4, 1] of norm 19

Old generators: [[-1, 0], [0, 1], [2, 0], [-1, 2], [3, 0], [3, 1], [4, -1]]. Residue images in that order: [18, 15, 2, 10, 3, 18, 8].

| Relation vector | A; B | u; v | C | w |
| --- | --- | --- | --- | --- |
| [1, 1, 2, 1, 0, 0, -1] | [-16, -8]; [8, -2] | [1, 1, 3, 1, 0, 0, 0]; [0, 0, 1, 0, 0, 0, 1] | [-6, 0] | [1, 0, 1, 0, 1, 0, 0] |
| [0, 1, 2, -1, 1, -1, 0] | [-12, 12]; [-9, 8] | [0, -1, 2, 0, 1, 0, 0]; [0, -2, 0, 1, 0, 1, 0] | [-1, 1] | [0, -1, 0, 0, 0, 0, 0] |
| [0, 3, -1, 0, 1, -1, 0] | [-3, 0]; [14, -10] | [1, 0, 0, 0, 1, 0, 0]; [1, -3, 1, 0, 0, 1, 0] | [-5, 3] | [1, -4, 0, 0, 0, 0, 0] |
| [1, 1, 2, 0, -1, -1, 0] | [0, -4]; [9, 3] | [1, 1, 2, 0, 0, 0, 0]; [0, 0, 0, 0, 1, 1, 0] | [-2, -1] | [1, 1, 0, 1, 0, 0, 0] |
| [0, -2, -1, -1, 1, 1, 0] | [-12, 18]; [8, 4] | [0, -1, 1, 0, 1, 1, 0]; [0, 1, 2, 1, 0, 0, 0] | [-6, 4] | [0, -3, 1, 0, 0, 0, 0] |
| [1, 5, 0, -2, 0, 0, 2] | [-3, -13]; [10, -5] | [1, 3, 0, 0, 0, 0, 2]; [0, -2, 0, 2, 0, 0, 0] | [-3, -1] | [1, 0, 0, 0, 0, 1, 0] |
| [1, 7, 0, 1, -1, 0, 0] | [-7, -11]; [6, -3] | [1, 5, 0, 1, 0, 0, 0]; [0, -2, 0, 0, 1, 0, 0] | [-3, -1] | [1, 0, 0, 0, 0, 1, 0] |
| [0, -1, -1, 2, -1, 1, 0] | [-10, 15]; [6, 0] | [0, -1, 0, 2, 0, 1, 0]; [0, 0, 1, 0, 1, 0, 0] | [-5, 4] | [0, -1, 0, 0, 0, 0, 1] |
| [1, 2, 0, 1, 0, 1, -1] | [2, -14]; [18, -10] | [1, 0, 1, 1, 0, 1, 0]; [0, -2, 1, 0, 0, 0, 1] | [-4, 0] | [1, 0, 2, 0, 0, 0, 0] |
| [0, 1, -1, -2, 0, 0, 2] | [-7, 10]; [10, 0] | [0, 1, 0, 0, 0, 0, 2]; [0, 0, 1, 2, 0, 0, 0] | [-5, 3] | [1, -4, 0, 0, 0, 0, 0] |
| [-1, -2, -3, 2, 0, 0, 0] | [-5, 5]; [0, -8] | [0, -1, 0, 2, 0, 0, 0]; [1, 1, 3, 0, 0, 0, 0] | [-2, 3] | [0, -1, 0, 0, 0, 1, 0] |
| [0, 2, 2, 0, 0, 0, -2] | [-4, -8]; [7, -10] | [1, 3, 2, 0, 0, 0, 0]; [1, 1, 0, 0, 0, 0, 2] | [-3, 1] | [1, -1, 0, 1, 0, 0, 0] |
| [-1, -3, -1, 2, 0, -1, 0] | [-15, 10]; [-6, -2] | [0, -3, 0, 2, 0, 0, 0]; [1, 0, 1, 0, 0, 1, 0] | [-3, 3] | [0, -1, 0, 0, 1, 0, 0] |
| [-1, 3, 0, 0, 0, 1, 1] | [-11, 11]; [-5, 3] | [0, -1, 0, 0, 0, 1, 1]; [1, -4, 0, 0, 0, 0, 0] | [-2, 2] | [0, -1, 1, 0, 0, 0, 0] |

Selected maximal minors (zero-based column indices in the row order above): [8, 9, 2, 0, 10, 13, 7] ↦ -54; [11, 4, 12, 1, 6, 5, 3] ↦ -36. Their gcd is 18 = Nπ−1.

### Prime [5, -1] of norm 19

Old generators: [[-1, 0], [0, 1], [2, 0], [-1, 2], [3, 0], [3, 1], [4, -1], [4, 1]]. Residue images in that order: [18, 5, 2, 9, 3, 8, 18, 9].

| Relation vector | A; B | u; v | C | w |
| --- | --- | --- | --- | --- |
| [0, -1, 1, 0, 0, -1, 0, 0] | [-16, 12]; [16, -2] | [0, -2, 2, 1, 0, 0, 0, 0]; [0, -1, 1, 1, 0, 1, 0, 0] | [-6, 2] | [1, -1, 1, 1, 0, 0, 0, 0] |
| [0, 3, 0, 0, -1, 0, 1, -1] | [-3, -2]; [9, -12] | [1, 2, 0, 0, 0, 0, 1, 0]; [1, -1, 0, 0, 1, 0, 0, 1] | [-2, 2] | [0, -1, 1, 0, 0, 0, 0, 0] |
| [0, -1, 0, 0, -1, 1, 0, 1] | [-18, 5]; [3, -3] | [1, -2, 0, 0, 0, 1, 0, 1]; [1, -1, 0, 0, 1, 0, 0, 0] | [-4, 1] | [1, 0, 0, 0, 0, 0, 1, 0] |
| [-1, 1, 0, -1, 1, -1, 1, 0] | [-15, 12]; [9, -8] | [0, -1, 0, 0, 1, 0, 1, 0]; [1, -2, 0, 1, 0, 1, 0, 0] | [-4, 4] | [0, -1, 2, 0, 0, 0, 0, 0] |
| [0, 1, -1, 0, 1, 0, 0, 1] | [-3, -15]; [-2, 0] | [1, 1, 0, 0, 1, 0, 0, 1]; [1, 0, 1, 0, 0, 0, 0, 0] | [-1, -4] | [1, 1, 0, 0, 0, 1, 0, 0] |
| [0, -1, -2, 1, 0, 0, 0, -1] | [3, -1]; [16, 4] | [0, -1, 0, 1, 0, 0, 0, 0]; [0, 0, 2, 0, 0, 0, 0, 1] | [-3, -2] | [1, 2, 0, 0, 0, 0, 1, 0] |
| [-1, 2, 3, 0, 0, 0, 0, -1] | [-8, 8]; [10, -7] | [0, -1, 3, 0, 0, 0, 0, 0]; [1, -3, 0, 0, 0, 0, 0, 1] | [-3, 3] | [0, -1, 0, 0, 1, 0, 0, 0] |
| [-1, -1, 0, 2, 0, 0, 1, 0] | [-5, 15]; [-1, -1] | [0, 1, 0, 2, 0, 0, 1, 0]; [1, 2, 0, 0, 0, 0, 0, 0] | [0, 4] | [0, 1, 2, 0, 0, 0, 0, 0] |
| [0, 3, -2, 0, -1, 1, 0, 0] | [-4, -5]; [12, -12] | [1, 2, 0, 0, 0, 1, 0, 0]; [1, -1, 2, 0, 1, 0, 0, 0] | [-3, 1] | [1, -1, 0, 1, 0, 0, 0, 0] |
| [-1, -5, 0, 1, 0, 0, 1, 0] | [-12, 14]; [-6, -10] | [0, 0, 1, 1, 0, 0, 1, 0]; [1, 5, 1, 0, 0, 0, 0, 0] | [0, 6] | [0, 1, 1, 0, 1, 0, 0, 0] |
| [0, -3, 0, 2, -1, 0, -1, 0] | [-5, 5]; [9, 6] | [0, -1, 0, 2, 0, 0, 0, 0]; [0, 2, 0, 0, 1, 0, 1, 0] | [-3, -1] | [1, 0, 0, 0, 0, 1, 0, 0] |
| [-1, 1, 0, 1, 0, 1, 0, 0] | [-9, 8]; [3, -2] | [0, -2, 0, 1, 0, 1, 0, 0]; [1, -3, 0, 0, 0, 0, 0, 0] | [-2, 2] | [0, -1, 1, 0, 0, 0, 0, 0] |
| [-1, 3, 0, 1, 1, -2, 0, 0] | [-3, 6]; [16, -13] | [0, 0, 0, 1, 1, 0, 0, 0]; [1, -3, 0, 0, 0, 2, 0, 0] | [-3, 4] | [0, -1, 0, 0, 0, 0, 0, 1] |
| [-1, 3, 0, 0, 1, 0, 0, -2] | [3, 3]; [8, -17] | [0, 2, 0, 0, 1, 0, 0, 0]; [1, -1, 0, 0, 0, 0, 0, 2] | [0, 5] | [0, 1, 0, 2, 0, 0, 0, 0] |
| [-1, 3, -1, 1, -1, 1, 0, 0] | [-1, 7]; [18, -12] | [0, 0, 0, 1, 0, 1, 0, 0]; [1, -3, 1, 0, 1, 0, 0, 0] | [-3, 4] | [0, -1, 0, 0, 0, 0, 0, 1] |
| [-1, 2, 0, 0, 1, 0, -2, 0] | [3, 6]; [7, -10] | [0, 3, 0, 0, 1, 0, 0, 0]; [1, 1, 0, 0, 0, 0, 2, 0] | [0, 4] | [0, 1, 2, 0, 0, 0, 0, 0] |

Selected maximal minors (zero-based column indices in the row order above): [14, 10, 9, 6, 15, 4, 12, 3] ↦ 216; [2, 5, 1, 13, 11, 8, 0, 7] ↦ -18. Their gcd is 18 = Nπ−1.

### Prime [5, 1] of norm 29

Old generators: [[-1, 0], [0, 1], [2, 0], [-1, 2], [3, 0], [3, 1], [4, -1], [4, 1], [5, -1]]. Residue images in that order: [28, 24, 2, 18, 3, 27, 9, 28, 10].

| Relation vector | A; B | u; v | C | w |
| --- | --- | --- | --- | --- |
| [0, -9, 0, 1, 0, 0, 0, 0, -1] | [-18, 11]; [-7, -10] | [1, -5, 0, 1, 0, 0, 0, 0, 0]; [1, 4, 0, 0, 0, 0, 0, 0, 1] | [-3, 4] | [0, -1, 0, 0, 0, 0, 0, 1, 0] |
| [0, -5, -1, 0, 0, -1, 0, 0, 0] | [-18, 11]; [2, -14] | [1, -5, 0, 1, 0, 0, 0, 0, 0]; [1, 0, 1, 1, 0, 1, 0, 0, 0] | [-5, 5] | [0, -1, 0, 2, 0, 0, 0, 0, 0] |
| [1, -3, 1, 0, -1, 0, 0, 1, 0] | [-14, 6]; [0, 3] | [1, -2, 1, 0, 0, 0, 0, 1, 0]; [0, 1, 0, 0, 1, 0, 0, 0, 0] | [-3, 1] | [1, -1, 0, 1, 0, 0, 0, 0, 0] |
| [0, -1, -1, 0, -1, 0, 0, 1, 0] | [-14, 6]; [12, -12] | [1, -2, 1, 0, 0, 0, 0, 1, 0]; [1, -1, 2, 0, 1, 0, 0, 0, 0] | [-6, 4] | [0, -3, 1, 0, 0, 0, 0, 0, 0] |
| [0, 3, 0, 0, -1, 0, 0, -1, 1] | [-7, -10]; [-3, -15] | [1, 4, 0, 0, 0, 0, 0, 0, 1]; [1, 1, 0, 0, 1, 0, 0, 1, 0] | [-1, 1] | [0, -1, 0, 0, 0, 0, 0, 0, 0] |
| [0, -1, 2, 1, -1, 0, 0, 0, 0] | [-4, 8]; [0, 3] | [0, 0, 2, 1, 0, 0, 0, 0, 0]; [0, 1, 0, 0, 1, 0, 0, 0, 0] | [-1, 1] | [0, -1, 0, 0, 0, 0, 0, 0, 0] |
| [1, 1, 0, 1, -1, 0, 0, 0, 0] | [-1, -3]; [0, 3] | [1, 2, 0, 1, 0, 0, 0, 0, 0]; [0, 1, 0, 0, 1, 0, 0, 0, 0] | [0, -1] | [1, 1, 0, 0, 0, 0, 0, 0, 0] |
| [0, -4, -1, 0, 1, 0, 0, 0, 0] | [0, 3]; [6, 10] | [0, 1, 0, 0, 1, 0, 0, 0, 0]; [0, 5, 1, 0, 0, 0, 0, 0, 0] | [-1, -1] | [1, 2, 0, 0, 0, 0, 0, 0, 0] |
| [1, -1, 0, 0, 0, -1, 0, -1, 1] | [17, -11]; [18, -5] | [1, -3, 0, 0, 0, 0, 0, 0, 1]; [0, -2, 0, 0, 0, 1, 0, 1, 0] | [0, -1] | [1, 1, 0, 0, 0, 0, 0, 0, 0] |
| [1, 1, -4, 0, 0, 0, 1, 0, 0] | [-2, -5]; [16, 16] | [1, 3, 0, 0, 0, 0, 1, 0, 0]; [0, 2, 4, 0, 0, 0, 0, 0, 0] | [-3, -3] | [1, 2, 0, 0, 1, 0, 0, 0, 0] |
| [0, -2, 4, -1, -1, 0, 0, 0, 0] | [-16, 0]; [-3, -9] | [1, 0, 4, 0, 0, 0, 0, 0, 0]; [1, 2, 0, 1, 1, 0, 0, 0, 0] | [-3, 2] | [0, -3, 0, 0, 0, 0, 0, 0, 0] |
| [0, -3, 0, 0, 1, 1, -1, -1, 0] | [-15, 6]; [1, -14] | [1, -2, 0, 0, 1, 1, 0, 0, 0]; [1, 1, 0, 0, 0, 0, 1, 1, 0] | [-4, 4] | [0, -1, 2, 0, 0, 0, 0, 0, 0] |
| [1, 1, -3, 2, 0, 1, 0, 0, 0] | [10, -15]; [16, -8] | [1, -1, 0, 2, 0, 1, 0, 0, 0]; [0, -2, 3, 0, 0, 0, 0, 0, 0] | [-1, -1] | [1, 2, 0, 0, 0, 0, 0, 0, 0] |
| [1, 4, 0, 3, 0, 0, 0, 0, -1] | [-5, -15]; [11, -6] | [1, 2, 0, 3, 0, 0, 0, 0, 0]; [0, -2, 0, 0, 0, 0, 0, 0, 1] | [-3, -1] | [1, 0, 0, 0, 0, 1, 0, 0, 0] |
| [0, -1, 1, -1, -2, 0, 0, 0, 0] | [2, -2]; [9, -18] | [1, -1, 1, 0, 0, 0, 0, 0, 0]; [1, 0, 0, 1, 2, 0, 0, 0, 0] | [-2, 3] | [0, -1, 0, 0, 0, 1, 0, 0, 0] |
| [0, -1, 1, -1, 1, -1, 0, 0, 0] | [12, 0]; [14, 12] | [0, 0, 2, 0, 1, 0, 0, 0, 0]; [0, 1, 1, 1, 0, 1, 0, 0, 0] | [0, -2] | [1, 1, 1, 0, 0, 0, 0, 0, 0] |
| [0, -1, 1, 1, -1, 1, 0, -1, 0] | [14, 12]; [15, 18] | [0, 1, 1, 1, 0, 1, 0, 0, 0]; [0, 2, 0, 0, 1, 0, 0, 1, 0] | [0, -1] | [1, 1, 0, 0, 0, 0, 0, 0, 0] |
| [-1, 2, 0, 1, 0, 1, 0, 0, 0] | [-10, 15]; [-7, 4] | [0, -1, 0, 2, 0, 1, 0, 0, 0]; [1, -3, 0, 1, 0, 0, 0, 0, 0] | [-1, 2] | [0, 0, 0, 1, 0, 0, 0, 0, 0] |
| [1, 1, -1, -1, -1, 0, 0, 0, 1] | [-4, -3]; [12, 6] | [1, 2, 0, 0, 0, 0, 0, 0, 1]; [0, 1, 1, 1, 1, 0, 0, 0, 0] | [-3, -1] | [1, 0, 0, 0, 0, 1, 0, 0, 0] |
| [0, 2, -2, -1, 0, 1, 1, 0, 0] | [-11, -11]; [4, -8] | [1, 2, 0, 0, 0, 1, 1, 0, 0]; [1, 0, 2, 1, 0, 0, 0, 0, 0] | [-3, 0] | [1, 0, 0, 0, 1, 0, 0, 0, 0] |
| [0, 5, -2, 0, 1, -1, 0, 0, 0] | [-6, -9]; [8, -12] | [1, 4, 0, 0, 1, 0, 0, 0, 0]; [1, -1, 2, 0, 0, 1, 0, 0, 0] | [-3, 1] | [1, -1, 0, 1, 0, 0, 0, 0, 0] |
| [-1, 6, -2, 1, 0, -1, 0, 0, 0] | [7, 11]; [8, -12] | [0, 5, 0, 1, 0, 0, 0, 0, 0]; [1, -1, 2, 0, 0, 1, 0, 0, 0] | [-1, 4] | [0, 1, 0, 0, 0, 0, 0, 0, 1] |
| [1, 11, 0, 0, 0, 0, 1, 0, 0] | [-7, -12]; [13, -8] | [1, 5, 0, 0, 0, 0, 1, 0, 0]; [0, -6, 0, 0, 0, 0, 0, 0, 0] | [-4, 0] | [1, 0, 2, 0, 0, 0, 0, 0, 0] |
| [-1, 0, 0, 1, 0, -1, -1, 0, 0] | [3, -1]; [11, -11] | [0, -1, 0, 1, 0, 0, 0, 0, 0]; [1, -1, 0, 0, 0, 1, 1, 0, 0] | [-2, 2] | [0, -1, 1, 0, 0, 0, 0, 0, 0] |
| [0, -5, -2, 0, 0, 0, 0, -1, 0] | [-8, 5]; [16, 4] | [0, -5, 0, 0, 0, 0, 0, 0, 0]; [0, 0, 2, 0, 0, 0, 0, 1, 0] | [-5, 1] | [1, 0, 0, 0, 0, 0, 0, 0, 1] |
| [0, 3, -2, 0, 0, 0, 2, -1, 0] | [3, 13]; [16, 4] | [0, 3, 0, 0, 0, 0, 2, 0, 0]; [0, 0, 2, 0, 0, 0, 0, 1, 0] | [-3, 2] | [0, -3, 0, 0, 0, 0, 0, 0, 0] |
| [1, -3, 1, 0, 1, 0, -1, -1, 0] | [-12, 6]; [-1, 14] | [1, -2, 1, 0, 1, 0, 0, 0, 0]; [0, 1, 0, 0, 0, 0, 1, 1, 0] | [-2, -1] | [1, 1, 0, 1, 0, 0, 0, 0, 0] |

Selected maximal minors (zero-based column indices in the row order above): [22, 21, 7, 15, 24, 25, 13, 3, 1] ↦ -168; [11, 10, 4, 6, 17, 16, 20, 14, 19] ↦ -224; [23, 8, 5, 18, 9, 0, 12, 2, 26] ↦ 420. Their gcd is 28 = Nπ−1.

### Prime [6, -1] of norm 29

Old generators: [[-1, 0], [0, 1], [2, 0], [-1, 2], [3, 0], [3, 1], [4, -1], [4, 1], [5, -1], [5, 1]]. Residue images in that order: [28, 6, 2, 11, 3, 9, 27, 10, 28, 11].

| Relation vector | A; B | u; v | C | w |
| --- | --- | --- | --- | --- |
| [1, -2, 0, 0, 0, 0, 0, 1, 0, -1] | [-4, -1]; [6, 7] | [1, 0, 0, 0, 0, 0, 0, 1, 0, 0]; [0, 2, 0, 0, 0, 0, 0, 0, 0, 1] | [-2, -2] | [1, 2, 1, 0, 0, 0, 0, 0, 0, 0] |
| [1, -3, 1, 0, 0, -1, -1, 0, 0, 0] | [2, -2]; [11, 11] | [1, -1, 1, 0, 0, 0, 0, 0, 0, 0]; [0, 2, 0, 0, 0, 1, 1, 0, 0, 0] | [-2, -3] | [1, 4, 0, 0, 0, 0, 0, 0, 0, 0] |
| [1, 3, 1, 0, 0, 0, 0, 1, 0, 0] | [-18, -14]; [-4, 3] | [1, 1, 1, 1, 0, 0, 0, 1, 0, 0]; [0, -2, 0, 1, 0, 0, 0, 0, 0, 0] | [-3, -4] | [1, 3, 0, 1, 0, 0, 0, 0, 0, 0] |
| [0, 2, -1, 2, 1, -1, 0, 0, 0, 0] | [-15, 0]; [-10, 4] | [1, 0, 0, 2, 1, 0, 0, 0, 0, 0]; [1, -2, 1, 0, 0, 1, 0, 0, 0, 0] | [-1, -1] | [1, 2, 0, 0, 0, 0, 0, 0, 0, 0] |
| [0, 0, 2, 0, 0, 0, 0, 1, 0, -1] | [-12, 16]; [-4, 5] | [0, -1, 2, 0, 0, 0, 0, 1, 0, 0]; [0, -1, 0, 0, 0, 0, 0, 0, 0, 1] | [-1, 2] | [0, 0, 0, 1, 0, 0, 0, 0, 0, 0] |
| [-1, -1, 2, 0, -2, 0, 0, 0, 0, 0] | [16, -8]; [18, -18] | [0, -2, 3, 0, 0, 0, 0, 0, 0, 0]; [1, -1, 1, 0, 2, 0, 0, 0, 0, 0] | [0, 2] | [0, 1, 1, 0, 0, 0, 0, 0, 0, 0] |
| [1, -1, 0, 0, -1, 0, 0, 0, 0, 1] | [-9, 4]; [-3, 3] | [1, -2, 0, 0, 0, 0, 0, 0, 0, 1]; [0, -1, 0, 0, 1, 0, 0, 0, 0, 0] | [-1, 0] | [1, 0, 0, 0, 0, 0, 0, 0, 0, 0] |
| [0, 4, -1, 0, 0, 0, 0, -1, 0, 0] | [7, 11]; [18, 14] | [0, 5, 0, 1, 0, 0, 0, 0, 0, 0]; [0, 1, 1, 1, 0, 0, 0, 1, 0, 0] | [-2, -1] | [1, 1, 0, 1, 0, 0, 0, 0, 0, 0] |
| [0, -3, 0, -1, 0, 1, 0, -1, 0, 0] | [10, -4]; [18, 14] | [0, -2, 1, 0, 0, 1, 0, 0, 0, 0]; [0, 1, 1, 1, 0, 0, 0, 1, 0, 0] | [-2, -4] | [1, 3, 1, 0, 0, 0, 0, 0, 0, 0] |
| [1, -1, 0, 0, 2, 0, 0, -2, 0, 0] | [-18, 9]; [-8, 17] | [1, -2, 0, 0, 2, 0, 0, 0, 0, 0]; [0, -1, 0, 0, 0, 0, 0, 2, 0, 0] | [-2, -2] | [1, 2, 1, 0, 0, 0, 0, 0, 0, 0] |
| [0, -2, 1, -2, 0, -1, 1, 0, 0, 0] | [-18, 10]; [-15, -5] | [1, -2, 1, 0, 0, 0, 1, 0, 0, 0]; [1, 0, 0, 2, 0, 1, 0, 0, 0, 0] | [0, 3] | [0, 1, 0, 0, 1, 0, 0, 0, 0, 0] |
| [0, 3, 0, 0, 1, -2, 0, 0, 0, 1] | [-15, -3]; [16, -13] | [1, 0, 0, 0, 1, 0, 0, 0, 0, 1]; [1, -3, 0, 0, 0, 2, 0, 0, 0, 0] | [-5, 1] | [1, 0, 0, 0, 0, 0, 0, 0, 1, 0] |
| [0, -5, 0, -1, 0, 0, -1, 0, 1, 0] | [-11, 6]; [-8, -9] | [1, -2, 0, 0, 0, 0, 0, 0, 1, 0]; [1, 3, 0, 1, 0, 0, 1, 0, 0, 0] | [0, 3] | [0, 1, 0, 0, 1, 0, 0, 0, 0, 0] |
| [0, 6, 0, -1, 0, 0, 0, 0, 1, -1] | [10, 17]; [14, -3] | [0, 5, 0, 0, 0, 0, 0, 0, 1, 0]; [0, -1, 0, 1, 0, 0, 0, 0, 0, 1] | [0, 4] | [0, 1, 2, 0, 0, 0, 0, 0, 0, 0] |
| [-1, 5, -1, 0, -1, -1, 0, 0, 0, 0] | [2, 3]; [12, -18] | [0, 4, 0, 0, 0, 0, 0, 0, 0, 0]; [1, -1, 1, 0, 1, 1, 0, 0, 0, 0] | [-1, 4] | [0, 1, 0, 0, 0, 0, 0, 0, 1, 0] |
| [-1, -1, 1, -3, 0, 1, 0, 0, 0, 0] | [-4, 6]; [5, -10] | [0, -1, 1, 0, 0, 1, 0, 0, 0, 0]; [1, 0, 0, 3, 0, 0, 0, 0, 0, 0] | [-1, 3] | [0, 1, 0, 0, 0, 0, 1, 0, 0, 0] |
| [1, 2, 2, 0, -2, 1, 0, 0, 0, 0] | [-12, -4]; [18, -9] | [1, 0, 2, 0, 0, 1, 0, 0, 0, 0]; [0, -2, 0, 0, 2, 0, 0, 0, 0, 0] | [-5, 0] | [1, 0, 0, 2, 0, 0, 0, 0, 0, 0] |
| [-1, 4, -2, 0, 1, 0, 1, 0, 0, 0] | [-3, 9]; [12, -8] | [0, 1, 0, 0, 1, 0, 1, 0, 0, 0]; [1, -3, 2, 0, 0, 0, 0, 0, 0, 0] | [-2, 3] | [0, -1, 0, 0, 0, 1, 0, 0, 0, 0] |
| [-1, 0, 0, 0, 1, 1, -1, 0, -1, 0] | [3, 12]; [8, -13] | [0, 1, 0, 0, 1, 1, 0, 0, 0, 0]; [1, 1, 0, 0, 0, 0, 1, 0, 1, 0] | [0, 5] | [0, 1, 0, 2, 0, 0, 0, 0, 0, 0] |
| [0, 3, 2, 0, 0, -1, 1, 0, 0, -1] | [-12, -8]; [7, -16] | [1, 2, 2, 0, 0, 0, 1, 0, 0, 0]; [1, -1, 0, 0, 0, 1, 0, 0, 0, 1] | [-3, 1] | [1, -1, 0, 1, 0, 0, 0, 0, 0, 0] |

Selected maximal minors (zero-based column indices in the row order above): [18, 5, 8, 9, 3, 11, 19, 0, 12, 16] ↦ 56; [15, 4, 2, 14, 6, 13, 17, 1, 10, 7] ↦ 28. Their gcd is 28 = Nπ−1.

### Prime [5, 2] of norm 31

Old generators: [[-1, 0], [0, 1], [2, 0], [-1, 2], [3, 0], [3, 1], [4, -1], [4, 1], [5, -1], [5, 1], [6, -1]]. Residue images in that order: [30, 13, 2, 25, 3, 16, 22, 17, 23, 18, 24].

| Relation vector | A; B | u; v | C | w |
| --- | --- | --- | --- | --- |
| [0, -2, -2, 1, 0, 0, 0, 0, 0, 0, 0] | [-10, 10]; [16, 8] | [0, -1, 1, 2, 0, 0, 0, 0, 0, 0, 0]; [0, 1, 3, 1, 0, 0, 0, 0, 0, 0, 0] | [-6, 2] | [1, -1, 1, 1, 0, 0, 0, 0, 0, 0, 0] |
| [-1, -3, -2, 0, 0, 1, 0, 0, 0, 0, 0] | [-7, 5]; [-4, 0] | [0, -3, 0, 0, 0, 1, 0, 0, 0, 0, 0]; [1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0] | [-1, 1] | [0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0] |
| [0, -1, 2, 0, -1, -1, 0, 0, 0, 0, 0] | [-4, 0]; [-3, -12] | [1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0]; [1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0] | [-1, 2] | [0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0] |
| [1, 0, -3, -1, 1, 1, 0, 0, 0, 0, 0] | [-3, -12]; [16, 8] | [1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 0]; [0, 1, 3, 1, 0, 0, 0, 0, 0, 0, 0] | [-3, -2] | [1, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0] |
| [0, 0, -1, 0, 0, 0, 0, 1, 0, 0, -1] | [-1, -5]; [2, -10] | [1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0]; [1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1] | [-1, 1] | [0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0] |
| [1, -3, 0, 0, -1, 0, 0, -1, 0, 1, 0] | [-9, 4]; [3, 15] | [1, -2, 0, 0, 0, 0, 0, 0, 0, 1, 0]; [0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0] | [-2, -1] | [1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0] |
| [0, 2, 0, 0, 1, -1, -1, 0, 0, 0, 0] | [-3, -6]; [0, -11] | [1, 3, 0, 0, 1, 0, 0, 0, 0, 0, 0]; [1, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0] | [-1, 1] | [0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0] |
| [1, -5, 0, 0, 0, 0, 0, 1, -1, 0, 0] | [-17, 10]; [-1, 4] | [1, -4, 0, 0, 0, 0, 0, 1, 0, 0, 0]; [0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0] | [-4, 2] | [1, -2, 1, 0, 0, 0, 0, 0, 0, 0, 0] |
| [0, -1, 0, -1, 0, -1, 0, 0, 1, 0, 0] | [-1, 4]; [6, 13] | [0, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0]; [0, 2, 0, 1, 0, 1, 0, 0, 0, 0, 0] | [-1, -1] | [1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0] |
| [0, -1, 1, -2, 1, 1, 0, 0, 0, 0, 0] | [-18, -6]; [0, -5] | [1, 0, 1, 0, 1, 1, 0, 0, 0, 0, 0]; [1, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0] | [-4, 1] | [1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0] |
| [-1, 0, 1, 0, 0, 0, 1, 0, 0, -1, 0] | [-4, 12]; [-2, -12] | [0, 1, 2, 0, 0, 0, 1, 0, 0, 0, 0]; [1, 1, 1, 0, 0, 0, 0, 0, 0, 1, 0] | [-2, 4] | [0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0] |
| [0, 4, -1, 0, 0, 0, 1, -1, 0, 0, 0] | [-7, -12]; [-2, -10] | [1, 5, 0, 0, 0, 0, 1, 0, 0, 0, 0]; [1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0] | [-1, 0] | [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] |
| [1, -1, 1, 0, 2, 0, -1, 0, 0, 0, -1] | [-18, 0]; [-9, 16] | [1, 0, 1, 0, 2, 0, 0, 0, 0, 0, 0]; [0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1] | [-1, -2] | [1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0] |
| [1, -3, 0, 0, 0, 0, 0, 2, 0, -1, 0] | [-17, -9]; [7, 13] | [1, 0, 0, 0, 0, 0, 0, 2, 0, 0, 0]; [0, 3, 0, 0, 0, 0, 0, 0, 0, 1, 0] | [-4, -2] | [1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0] |
| [0, 0, -1, 0, 1, 0, 0, -1, 0, 0, 0] | [6, -6]; [12, -16] | [1, -1, 1, 0, 1, 0, 0, 0, 0, 0, 0]; [1, -1, 2, 0, 0, 0, 0, 1, 0, 0, 0] | [-2, 2] | [0, -1, 1, 0, 0, 0, 0, 0, 0, 0, 0] |
| [1, -3, 1, 1, 1, 0, -1, 0, 0, 0, 0] | [-18, 6]; [3, 2] | [1, -1, 1, 1, 1, 0, 0, 0, 0, 0, 0]; [0, 2, 0, 0, 0, 0, 1, 0, 0, 0, 0] | [-5, 2] | [1, -2, 0, 0, 0, 1, 0, 0, 0, 0, 0] |
| [-1, -1, -2, 0, 0, 0, 1, 0, 1, 0, 0] | [-8, 13]; [-4, -4] | [0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0]; [1, 2, 2, 0, 0, 0, 0, 0, 0, 0, 0] | [-2, 3] | [0, -1, 0, 0, 0, 1, 0, 0, 0, 0, 0] |
| [1, -1, 0, 0, 0, 0, -1, 0, 0, 1, -1] | [-1, -6]; [16, 7] | [1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0]; [0, 2, 0, 0, 0, 0, 1, 0, 0, 0, 1] | [-3, -1] | [1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0] |
| [0, -6, 0, 0, 0, 1, -1, 0, 0, 0, -1] | [12, -7]; [16, 7] | [0, -4, 0, 0, 0, 1, 0, 0, 0, 0, 0]; [0, 2, 0, 0, 0, 0, 1, 0, 0, 0, 1] | [0, -2] | [1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0] |
| [-1, -5, 0, 0, -1, -1, 1, 0, 0, 0, 0] | [-14, 9]; [-12, -15] | [0, -3, 0, 0, 0, 0, 1, 0, 0, 0, 0]; [1, 2, 0, 0, 1, 1, 0, 0, 0, 0, 0] | [-2, 4] | [0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0] |
| [-1, 3, 0, 1, -1, 0, 0, 0, -1, 0, 0] | [1, 3]; [18, -15] | [0, 2, 0, 1, 0, 0, 0, 0, 0, 0, 0]; [1, -1, 0, 0, 1, 0, 0, 0, 1, 0, 0] | [-5, 4] | [0, -1, 0, 0, 0, 0, 1, 0, 0, 0, 0] |
| [-1, 0, 2, 0, 0, 0, 0, 0, 1, 0, 0] | [-4, 16]; [0, -1] | [0, 1, 2, 0, 0, 0, 0, 0, 1, 0, 0]; [1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0] | [-2, 3] | [0, -1, 0, 0, 0, 1, 0, 0, 0, 0, 0] |

Selected maximal minors (zero-based column indices in the row order above): [14, 8, 13, 16, 18, 21, 3, 12, 4, 0, 9] ↦ 90; [19, 1, 20, 7, 6, 15, 5, 11, 10, 2, 17] ↦ 60. Their gcd is 30 = Nπ−1.

### Prime [7, -2] of norm 31

Old generators: [[-1, 0], [0, 1], [2, 0], [-1, 2], [3, 0], [3, 1], [4, -1], [4, 1], [5, -1], [5, 1], [6, -1], [5, 2]]. Residue images in that order: [30, 19, 2, 6, 3, 22, 16, 23, 17, 24, 18, 12].

| Relation vector | A; B | u; v | C | w |
| --- | --- | --- | --- | --- |
| [1, 2, 1, 0, 2, 0, 0, 0, 0, 0, 0, -1] | [-18, -18]; [5, 2] | [1, 2, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0]; [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1] | [-5, -6] | [1, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0] |
| [1, -4, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0] | [-3, -9]; [11, 18] | [1, 2, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0]; [0, 6, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0] | [-4, -7] | [1, 4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0] |
| [-1, -7, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0] | [-16, 12]; [-3, -5] | [0, -2, 2, 1, 0, 0, 0, 0, 0, 0, 0, 0]; [1, 5, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] | [-1, 3] | [0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0] |
| [0, 3, 3, 0, 0, -1, 0, 0, -1, 0, 0, 0] | [-8, -8]; [13, -14] | [1, 2, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0]; [1, -1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0] | [-3, 0] | [1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0] |
| [-1, 1, 0, -1, -1, 0, 0, 0, 1, 0, 0, 0] | [-2, 8]; [6, -12] | [0, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0]; [1, 0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0] | [0, 4] | [0, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0] |
| [0, 0, 0, -1, 1, 0, -1, 0, 0, 0, 0, 0] | [0, 3]; [7, 1] | [0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0]; [0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 0, 0] | [-1, 0] | [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] |
| [0, 4, 0, 0, 0, 0, 0, 1, 0, -1, 0, 0] | [5, 6]; [9, -4] | [0, 2, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0]; [0, -2, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0] | [0, 2] | [0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0] |
| [1, 4, 0, -1, 0, 1, 0, 0, 1, 0, 0, 0] | [13, -14]; [18, -11] | [1, -1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0]; [0, -5, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0] | [-1, -1] | [1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] |
| [0, -1, 0, 1, 2, -1, -1, 0, 0, 0, 0, 0] | [-18, -9]; [-11, -11] | [1, 1, 0, 1, 2, 0, 0, 0, 0, 0, 0, 0]; [1, 2, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0] | [-1, 0] | [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] |
| [-1, 3, 1, 0, 0, -1, 0, 0, 0, 0, 1, 0] | [-14, 12]; [-12, 7] | [0, -1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0]; [1, -4, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0] | [0, 1] | [0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] |
| [-1, 4, 3, 0, 0, 0, 0, 0, 0, -1, 0, 0] | [0, 8]; [13, -9] | [0, 1, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0]; [1, -3, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0] | [-1, 3] | [0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0] |
| [-1, 4, 0, 1, 0, 1, 0, 0, 0, -1, 0, 0] | [7, 6]; [13, -9] | [0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 0, 0]; [1, -3, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0] | [0, 3] | [0, 1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0] |
| [-1, 5, 0, 0, 1, 0, 0, 0, 1, -1, 0, 0] | [12, 9]; [13, -9] | [0, 2, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0]; [1, -3, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0] | [1, 4] | [0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0] |
| [0, 5, 2, -1, 0, 0, 0, 0, 0, -1, 0, 0] | [-4, -8]; [17, -14] | [1, 3, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0]; [1, -2, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0] | [-3, 0] | [1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0] |
| [0, -3, -1, 0, 0, 0, 0, 0, 0, -1, 0, 1] | [-3, 5]; [12, 14] | [0, -1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1]; [0, 2, 1, 0, 0, 0, 0, 0, 0, 1, 0, 0] | [-3, -3] | [1, 2, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0] |
| [-1, 4, -1, 0, 0, 0, 0, 0, -1, 0, 0, 0] | [4, 7]; [14, -18] | [0, 4, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0]; [1, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 0] | [0, 5] | [0, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0] |
| [0, 2, 0, 0, 0, 0, 1, -1, 0, 1, 0, 0] | [-17, -15]; [-4, -1] | [1, 2, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0]; [1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0] | [-3, -4] | [1, 3, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0] |
| [1, 5, -1, 2, -1, 0, 0, 0, 0, 0, 0, 0] | [-10, -15]; [-6, 6] | [1, 4, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0]; [0, -1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0] | [-2, -5] | [1, 3, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0] |
| [1, 3, 1, 1, 1, -1, 0, 0, 0, 0, 0, 0] | [-18, 6]; [12, -7] | [1, -1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0]; [0, -4, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0] | [-4, 1] | [1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0] |
| [0, -3, -1, 0, 0, 0, 0, 0, -1, 1, 0, 0] | [-13, 9]; [10, -2] | [0, -3, 0, 0, 0, 0, 0, 0, 0, 1, 0, 0]; [0, 0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0] | [-3, 1] | [1, -1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0] |
| [-1, 0, 2, 0, -1, 1, 0, 0, 0, 0, 0, -1] | [-8, 12]; [9, -15] | [0, -1, 2, 0, 0, 1, 0, 0, 0, 0, 0, 0]; [1, -1, 0, 0, 1, 0, 0, 0, 0, 0, 0, 1] | [-1, 5] | [0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0] |
| [0, 4, 0, 0, 0, 1, -1, -1, 0, 0, 0, 0] | [-5, -9]; [16, -15] | [1, 3, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0]; [1, -1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0] | [-3, 0] | [1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0] |
| [0, -5, -3, 0, 2, 0, 0, 0, 0, 0, 0, 0] | [-18, 9]; [-8, -16] | [1, -2, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0]; [1, 3, 3, 0, 0, 0, 0, 0, 0, 0, 0, 0] | [0, 5] | [0, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0] |
| [0, -3, 0, -2, 2, 0, 0, 0, 0, 0, 0, 0] | [-18, 9]; [0, -5] | [1, -2, 0, 0, 2, 0, 0, 0, 0, 0, 0, 0]; [1, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0] | [-2, 2] | [0, -1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0] |
| [0, 4, 1, 0, 0, 0, -1, 0, 0, 0, 1, 0] | [2, -10]; [14, -9] | [1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 1, 0]; [1, -3, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0] | [-2, -1] | [1, 1, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0] |
| [-1, 5, 0, 0, 1, 0, -1, 0, 0, 0, 0, 0] | [3, 3]; [14, -9] | [0, 2, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0]; [1, -3, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0] | [-1, 2] | [0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0] |
| [-1, -4, -2, 0, 0, 0, 0, 0, 0, 0, 0, 1] | [-11, 8]; [0, -4] | [0, -3, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1]; [1, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0] | [-1, 2] | [0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0] |
| [1, -3, -1, 0, -2, 1, 1, 0, 0, 0, 0, 0] | [11, -11]; [18, 18] | [1, -1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 0]; [0, 2, 1, 0, 2, 0, 0, 0, 0, 0, 0, 0] | [-3, -7] | [1, 3, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0] |
| [-1, -5, 0, 0, 0, 0, -1, 0, 1, 0, -1, 0] | [-17, 11]; [-16, -7] | [0, -3, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0]; [1, 2, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0] | [1, 4] | [0, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0] |
| [1, -4, 0, 0, 1, -1, 0, 0, 0, -1, 0, 0] | [-15, 9]; [16, 9] | [1, -4, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0]; [0, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0, 0] | [-5, -2] | [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1] |
| [-1, 3, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0] | [-16, 15]; [-5, 3] | [0, -1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0]; [1, -4, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0] | [-1, 2] | [0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0] |
| [-1, 5, 0, -1, 0, 1, 0, -1, 0, 0, 0, 0] | [5, 9]; [13, -11] | [0, 3, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0]; [1, -2, 0, 1, 0, 0, 0, 1, 0, 0, 0, 0] | [0, 4] | [0, 1, 2, 0, 0, 0, 0, 0, 0, 0, 0, 0] |
| [-1, 1, 1, -1, 0, 0, 0, 0, -1, 0, 0, 1] | [4, 14]; [7, -9] | [0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1]; [1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 0] | [1, 5] | [0, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0] |
| [0, -3, 4, 0, 0, -1, 0, 0, -1, 0, 0, 0] | [-16, 16]; [15, 16] | [0, -1, 4, 0, 0, 0, 0, 0, 0, 0, 0, 0]; [0, 2, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0] | [-5, -2] | [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1] |
| [0, 1, 0, 0, 0, -1, 1, 0, 0, 0, 1, -1] | [-9, 16]; [17, 13] | [0, 1, 0, 0, 0, 0, 1, 0, 0, 0, 1, 0]; [0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 1] | [-4, -1] | [1, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0] |
| [-1, 4, 0, -2, 0, 0, 1, 0, 0, 1, 0, 0] | [-2, 17]; [15, -10] | [0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 0, 0]; [1, -3, 0, 2, 0, 0, 0, 0, 0, 0, 0, 0] | [-1, 5] | [0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 1, 0] |

Selected maximal minors (zero-based column indices in the row order above): [19, 29, 8, 28, 27, 10, 32, 23, 11, 14, 31, 24] ↦ -180; [30, 0, 22, 3, 33, 35, 12, 21, 9, 2, 5, 1] ↦ -240; [4, 34, 18, 20, 15, 6, 17, 7, 26, 25, 16, 13] ↦ -90. Their gcd is 30 = Nπ−1.

**Arithmetic verification.** Exact rational arithmetic in the quadratic basis independently checks all 173 witness factorizations, differences, exponent differences, all 23 selected determinants and their gcds, and generation of each of the eleven finite residue multiplicative groups. These finite checks validate the data; the large-prime cutoff and the theorem that residue-step relations imply K2 generation remain the named mathematical targets.

## Proof boundaries and acceptance

The target pass is complete and every stage is planned. None is declared closed. A proof using a requested supplier must use its exact contract below; a request records work and is not a theorem. The inherited source and graph gaps remain visible.

### ArithmeticKTheory/G-Homotopy — Finite-type homotopy and rank-filtration suppliers

The later N.3 and finite-generation packets give the arithmetic relative-rank, stabilization and finite-defect targets. Their H.1 cellular category-homology comparisons and the connected (not necessarily simply connected) H-space finite-type theorem remain supplier contracts. R.1 now owns the orientation-correct Steinberg finiteness, so the original unassigned building/duality gap is not repeated.

Affected targets: `ArithmeticKTheory:N.3:finite-generation/quillen-homotopy-finite-type`, `ArithmeticKTheory:N.3/finite-rank-Q-homology`.

### ArithmeticKTheory/G-Hermitian — Arithmetic Witt and homotopy-orbit finite generation

The Corollary 8 argument is decomposed into LF, genuine-L and classical-GW targets. R-GN-Witt and R-H6-finite-type name the missing exact arithmetic signature and finite-type spectral-sequence exports. Classical low quadratic degrees must use the actual fibre sequence; an isomorphism only above degree four does not close them.

Affected targets: `ArithmeticKTheory:N.3:finite-generation/number-ring-l-finite-generation`, `ArithmeticKTheory:N.3:finite-generation/genuine-l-finite-generation`, `ArithmeticKTheory:N.3:finite-generation/classical-gw-finite-generation`.

### ArithmeticKTheory/G-Coefficient — Coefficient localization and arithmetic descent edges

Existing L.1 coefficient, Bott and safe-modulus product nodes replace the old unowned coefficient object. K.7 boundary/projection-formula compatibility, M.7 torsion-edge/colimit compatibility, the real KO supplier, and R02.3 degree-zero Brauer calculation remain the exact contracts R-K7-coefficients, R-M7-edges, R-RT4-real and R-R02-Brauer. No modulo-3 ring product or arbitrary Chern normalization is assumed.

Affected targets: `ArithmeticKTheory:N.6/ordinary-to-bott-comparison-range`, `ArithmeticKTheory:N.6/bott-adams-edge-splitting`, `ArithmeticKTheory:N.5/soule-mod-l-surjectivity`, `ArithmeticKTheory:N.5/edge-normalised-chern-torsion`, `ArithmeticKTheory:N.5/odd-torsion-at-a-prime-where-cd-is-two`.

### ArithmeticKTheory/G-HarrisSegal — Detected summand proof source

The K-book reports Harris–Segal Theorem 3.1, but its original §3 proof was not read. An explicit, functorial detected summand requires the finite-field/wreath-product supplier in R-L1-HarrisSegal. Do not close this by citing the abstract N.5 free-plus-torsion group table.

Affected targets: `ArithmeticKTheory:N.5/harris-segal-summand`.

### ArithmeticKTheory/G-WildHigher — Higher raw completion versus symbol wild kernel

For i≥2 the local even K-group can have Q_p/Z_p summands in the kernel of the local finite symbol quotient. Global torsion alone does not force zero image in them. Equality with the raw completion kernel requires a global-to-local vanishing theorem and real finite-part detection that the sources read do not supply. Degree two is covered by the uniquely divisible Moore kernel. Retain ArithmeticKTheory:N.6/G1 from the N.6 part.

Affected targets: `ArithmeticKTheory:N.6/raw-and-symbol-kernel-boundary`, `ArithmeticKTheory:N.6/divisible-subgroup-and-the-wild-kernel`.

### ArithmeticKTheory/G-WildExceptional — Exceptional odd dyadic prime-representative argument

Retain N.6/G2: Weibel’s author preprint Lemma 4.4 prescribes class and cyclotomic norm independently, which fails for Q(i), modulus 4, residue 3. Theorem 4.5 and its real adaptation 6.11 need a compatible simultaneous Chebotarev statement or an independent ring-to-field image proof. The publication was not collated; the allegation is about the read preprint. The odd-prime, even-twist and independently proved nonexceptional branches do not inherit this particular flaw.

Affected targets: `ArithmeticKTheory:N.6/cyclotomic-divisible-image`, `ArithmeticKTheory:N.6/imaginary-special-obstruction`, `ArithmeticKTheory:N.6/real-motivic-obstruction`, `ArithmeticKTheory:N.6/weibel-symbol-divisibility-theorem`.

### ArithmeticKTheory/G-RegularProofs — Cyclotomic proof and regular-prime coefficient module

N.7 states the finite Kummer and Herbrand–Ribet targets, but the original proof sources remain unread; Washington is not in the cleared library index. R-Iwasawa-cyclotomic is the exact supplier boundary. The L.1 finite-coefficient objects do not themselves prove the free Bott-module decomposition and its (p+3)/2 generator degrees. Preserve the N.7 proof gap until that argument is supplied. The Iwasawa tower equivalence, Vandiver reflection/cyclicity and the special-value order-formula input of the explicit conditional table are retained as proof imports, not inferred from regularity or character nonvanishing. The divided Bernoulli denominator refinement is also a Kummer-congruence input; pinned von Staudt–Clausen alone is not cited as its proof.

Affected targets: `ArithmeticKTheory:N.7/kummer-criterion`, `ArithmeticKTheory:N.7/eigenspaces-and-herbrand-ribet`, `ArithmeticKTheory:N.7/regular-prime-torsion-consequences`, `ArithmeticKTheory:N.7/regular-prime`, `ArithmeticKTheory:N.7/vandiver-separation`, `ArithmeticKTheory:N.7/bernoulli-conventions`.

### ArithmeticKTheory/G-Keune — Cyclotomic Picard injection source

The original Keune proof and its invariant/coinvariant normalization have not been obtained. The target remains conditional on that precise comparison, not on a guessed identification of the two finite module functors.

Affected targets: `ArithmeticKTheory:N.6/keune-cyclotomic-picard-injection`.

### ArithmeticKTheory/G-ChernBoundary — Inherited Chern-family dependency cycle

The earlier parts record N.5→M.8→R.7→Polylogarithms P.2→K3BlochGroups V.3→V.2→N.5. This pass imports M.7’s early edge rather than M.8 for the arithmetic table, and proposes that V.2’s rank input use N.3 finite generation plus Borel R.3. The other packets are outside the allowed edits. The full inherited world is not claimed globally acyclic until the maintainer applies the boundary change. REV-ArithmeticKTheory also removes the residual M.8 edge from the inherited odd-torsion contract and V.5 from regular-prime-torsion-consequences; outside packets still need the documented boundary changes.

Affected targets: `ArithmeticKTheory:N.5/edge-normalised-chern-torsion`, `ArithmeticKTheory:N.5/the-real-case-modulo-eight`.

### Exact supplier requests

**R-GN-Witt — `GeometryOfNumbersAndQuadraticArithmetic:GN.6`.** Export, or route to the existing global-forms owner, the number-ring signature theorem: for O=O_(F,S), F a number field and S finite, W^s(O) has finite signature kernel and signature image a rank-r1 sublattice of Z^r1. Include finite Pic(O) under localization and the characteristic-zero injection W^q(O)→W^s(O). Supply the fundamental genuine GW fibre sequence and the nonnegative classical symmetric/quadratic comparisons used in Corollary 2.3.19. Import DA.0/integral-injectivity where it already supplies the injection.

**R-H6-finite-type — `StableHomotopyKTheory:H.6`.** For a connective spectrum E with C2 action and every π_b(E) finitely generated, give the strongly convergent homotopy-orbit spectral sequence H_a(C2;π_bE)⇒π_(a+b)(E_hC2); each diagonal is finite and its abutment is finitely generated. Also retain the exact Q_l/Z_l coefficient-colimit, Bockstein and localization compatibilities needed by N.5. Existing H.6/qp-zp-coefficients supplies the object; the finite-type and edge compatibility statements are the requested additions.

**R-H3-finite-type — `StableHomotopyKTheory:H.3`.** For a connected CW H-space X, including nonzero π1, prove simplicity (π1 abelian acting trivially on higher homotopy) and that integral homology finitely generated in each degree implies every π_j(X) finitely generated. Give the Postnikov/Serre-class proof. This extends the plus/simple-space direction; a simply connected version alone does not suffice for BQ.

**R-K7-coefficients — `GeneralAlgebraicKTheory:K.7`.** Supply the actual finite-coefficient localization fibre sequence and boundary projection formula for the K.7 product action, with natural reduction/Bockstein maps. At unsafe moduli 2,3,4,8 state only the coherent spectrum/module operations that exist. For Soulé lift to a safe prime power M, use its product, then reduce to m; never infer a ring structure on K(R;Z/m) from this reduction. Include the finite-perfect localization comparison used to invert the principal p-prime in ordinary-to-bott-comparison-range.

**R-M7-edges — `MotivicEtaleKTheory:M.7`.** Use the existing named Suslin-real-comparison, real-place-correction and dyadic-s-integer-extensions before N.5. Export equivariance of the separably closed torsion identification, its coefficient colimit, and compatibility of the descent edge with connecting maps. The early edge-normalised torsion map must depend on M.7 and not on the full M.8 Chern/regulator family. For Bott tables retain the spectrum-level ψ^(−1) operation for every odd prime power, including q=3.

**R-RT4-real — `RefinedTraceMethods:RT.4:topological`.** In the early topological layer, supply real KO/BO, real Bott 8-periodicity, the coefficient comparisons and π_n(BO;Z/m) used by the existing M.7/suslin-real-comparison node. Complex KU/ku and Clifford-algebra periodicity alone do not compute these groups.

**R-R02-Brauer — `ArithmeticGaloisDuality:R02.3`.** Export cd_p≤2 for X=Spec O_(F,S)[1/p] at odd p, the Kummer exact sequence and the Brauer local-global exact sequence with arithmetic-Frobenius normalization. For X=Spec Z[1/p] or Z[ζ_(p^r),1/p], with exactly one finite prime inverted, deduce Br(X)[p^r]=0 and H²(X,μ_(p^r))≃Pic(X)/p^r. Keep real places and the sum-of-invariants condition: simply omitting the local term at p would be incorrect.

**R-L1-HarrisSegal — `KTheoryFiniteLocalFields:L.1`.** Provide the finite-field/wreath-product map and a detected Harris–Segal torsion summand, with its original proof (Harris–Segal Theorem 3.1) or a verified independent argument. The abstract odd group formula does not choose a natural summand. Reuse L.1/k-theory-mod-m, /bott-element and /mod-m-products for their actual, currently restricted statements. The regular-prime finite-coefficient module and its exact generator degrees need their own proof, not just these object definitions.

**R-Iwasawa-cyclotomic — `IntegralIwasawaTheory:L0`.** Export proved Kummer criterion/congruences and the finite cyclotomic Herbrand–Ribet character statement needed in N.7, with arithmetic Bernoulli indices: for even a, 2≤a≤p−3, p|num B_a iff the mod-p class-group eigenspace ω^(1−a) is nonzero. The denominator 1/(p−1) of the character projector is a unit modulo p; integral projectors without this inversion are not supplied. Washington is not a source obtained in this run; use a freely available original or a maintainer-cleared copy. Include the Iwasawa regularity equivalence at every p-power cyclotomic level and, under Vandiver, the reflection theorem proving cyclicity of the odd character components. These are required for N.7’s quoted tower equivalence and complete conditional K-group table, not supplied by the finite Herbrand–Ribet nonvanishing criterion alone. Include the divided Bernoulli denominator refinement: for k≥1 and p−1 not dividing 2k, p does not divide den(B_(2k)/k), including p dividing k. Route the finite-class-group and Vandiver comparisons through the existing L3 owner, reusing its vandiver-condition and vandiver-plus-part-tower targets; L0 supplies the cyclotomic foundations.

### Stage acceptance

- `ArithmeticKTheory:N.1` — planned. Integrate the imported low-degree determinant, norm/transfer and localization presentations; retain all arbitrary-S versus finite-S hypotheses.
- `ArithmeticKTheory:N.2` — planned. Integrate S.3/T.5 supplier maps and K.7 coefficient-boundary compatibility (G-Coefficient); the five ramified restriction targets replace the old pullback gap.
- `ArithmeticKTheory:N.3` — planned. G-Homotopy: connected H-space finite type and categorical homology comparisons remain assigned supplier work.
- `ArithmeticKTheory:N.3:finite-generation` — planned. G-Homotopy and G-Hermitian: supply the exact finite-type, Witt-signature and homotopy-orbit exports; do not reprove R.1.
- `ArithmeticKTheory:N.3:ranks` — planned. Integrate R.3’s orders-only formula with the finite-S rational localization map; finite generation is a separate N.3 input.
- `ArithmeticKTheory:N.4` — planned. Integrate the imported continuous Tate-twist and cyclotomic exponent interfaces; retain finiteness only for nonzero weights and the corrected w10(Q)=264.
- `ArithmeticKTheory:N.5` — planned. G-Coefficient, G-HarrisSegal and G-ChernBoundary: coefficient/edge maps, detected-summand proof, real KO supplier and inherited owner-cycle correction.
- `ArithmeticKTheory:N.6` — planned. G-WildHigher, G-WildExceptional and G-Keune remain source-proof gaps; G-Coefficient supplies exact Bott and boundary contracts.
- `ArithmeticKTheory:N.7` — planned. G-RegularProofs: obtain permitted proof sources and prove the coefficient Bott-module consequence; keep Vandiver separate.
- `ArithmeticKTheory:N.8` — planned. Integrate N.5 suppliers for K3; verify the retained Gaussian and golden-field certificate data against the eventual N.6 engine, without Birch–Tate as an upper bound.

Accept a complete implementation only after the named suppliers, natural maps, edge/extension comparisons, prototype tests and independent certificate bounds are proved. In particular a table of cardinalities is insufficient for the N.5 extension theorem, global torsion is insufficient for the higher raw wild-kernel comparison, and Birch–Tate is insufficient for the independent real-quadratic upper bound.

## Sources, baseline and retained identifiers

The following fresh readings use the versions and pages stated here. The detailed target cards also preserve the source/version identities of the seven earlier packets. An inherited proof-source gap is not promoted to a fresh reading by its appearance in this document. Washington’s book was not obtained or read; no uncleared copy was used. Source statements and matches throughout are in the roadmap authors’ own words.

**CDH.III.v4.** Calmès, Dotto, Harpaz, Hebestreit, Land, Moi, Nardin, Nikolaus and Steimle. [Hermitian K-theory for stable infinity-categories III: Grothendieck–Witt groups of rings](https://arxiv.org/pdf/2009.07225v4). arXiv:2009.07225v4, 28 April 2026, 63 pages. Published Annals of Mathematics 204 (2026), 119–220; locators here refer only to the read arXiv version, not an uncollated version of record. Read 2026-10-19. SHA-256 `1e4b6720055ebdce0012f5780bfc7cdb5b853e32f29b17224a1be0bc676f770c`. Introduction, Corollary 8, p. 5; §2.3, Corollaries 2.3.16–2.3.19 and proofs, pp. 47–48; comparison ranges in Corollaries 1.2.12 and 1.3.9, pp. 18 and 31.

**FGV.2022.** Tony Feng, Søren Galatius and Akshay Venkatesh. [The Galois action on symplectic K-theory](https://link.springer.com/content/pdf/10.1007/s00222-022-01127-8.pdf). Inventiones mathematicae 230 (2022), 225–319, DOI 10.1007/s00222-022-01127-8; published PDF, printed page = PDF page + 224. Read 2026-10-19. SHA-256 `5da9a2b28d13b2b22a262a81650188025020d92238ec2b47404d177ef91d7b4d`. §1.4, pp. 233–234 (q an odd prime power); §2.6, pp. 240–243 (descent, Proposition 2.9 and Lemma 2.10); §2.7, Lemmas 2.11 and 2.14 with proofs, pp. 244–247; Corollary 2.12 and Remark 2.13, pp. 245–246, for degree-zero normalization.

**Kbook.2013.** Charles A. Weibel. [The K-book: An introduction to algebraic K-theory](https://sites.math.rutgers.edu/~weibel/Kbook/Kbook.pdf). Author-hosted combined draft, 29 August 2013. Book page = PDF page − 8; not a collation with the printed AMS edition. Read 2026-10-19. SHA-256 `a04f53c9393b20672fab2a6818279b2f9996dbc7cf74735789ed13804b058845`. Fresh inspection of V.6.6–6.8.2, book pp. 409–413; VI.1.7–2.4, book pp. 468–473; VI.3.1, book p. 475; VI.8.1–8.8, book pp. 513–516; VI.9.1–9.12, book pp. 517–525; VI.10.1–10.10, book pp. 527–533. The inherited source records retain the other locators; this pass does not claim fresh full readings of their original proof sources.

**Source findings checked in this review.** All five findings below are confirmed against the exact versions linked above; none changes the corrected roadmap statements. The CDH and K-book findings are restricted to the arXiv/author copies, without a claim about their uncollated printed editions. No verified correction was located; the author’s linked K-book errata PDF returned 404.

- `ArithmeticKTheory/E-BP-FGV1` — Published PDF, proof of Corollary 2.12, p. 245 (PDF p. 21), first cohomology multiplication display. The target twist is 2k: 1+(2k−1)=2k. Tate-twist cup products add weights. The source group has weight 1 and the multiplier weight 2k−1; Lemma 2.11 on the preceding page requires H² of weight 2k in degree 4k−2. At k=0 the product must land in weight 0, not −1. The four table statements themselves have the correct indices.
- `ArithmeticKTheory/E-REV-CDH1` — Corollary 1.2.12 proof, arXiv v4 p.18, final sentence. The intended range is n≤2m−3, as in the corollary and the preceding injectivity argument. The proof assumes n≤2m−3 and explicitly computes its connectivity bound from m. For m=0 the corollary includes negative n≤−3, which the last printed inequality would exclude.
- `ArithmeticKTheory/E-REV-FGV2` — Remark 2.13, published p.246 (PDF p.22), displayed degree-zero coefficient group. Use Z/q⊕Pic(O′_q)/q for K0(O′_q;Z/q). The connective coefficient sequence identifies K0 with K0(O′_q)/q. Rank is reduced modulo q, and so is Pic. For q=3 the printed infinite rank summand already contradicts that sequence. The following finite-coefficient comparison argument is valid after this correction.
- `ArithmeticKTheory/E-REV-KBOOK1` — VI.10.1(6), author combined draft book p.527 (PDF p.535). The index is c_(2k+2), in the source convention c_j=|num(B_(2j)/(4j))|. The even degree 8k+6 is 4(2k+2)−2. Table10.1.1 on the next page and the conditional Table10.2.1 use the corrected index. At k=2, K22 has order691=c6, whereas the printed c5 is1.
- `ArithmeticKTheory/E-REV-KBOOK2` — Paragraph preceding VI.10.6, author combined draft book p.531 (PDF p.539). For odd i there is one trivial constituent. For even i it occurs only if i≡0 mod(l−1). VI.10.4.2 gives R×/l=μ_l⊕μ_l^0⊕μ_l^2⊕…⊕μ_l^(l−3). After twisting by i−1 the root term is invariant exactly if l−1 divides i; among the remaining terms exactly one is invariant when i is odd. For l=5, degrees3 and5 of Z[1/5] with these coefficients have ranks0 and1, respectively. Theorem10.6 has the right generator degrees.

**Retained findings.** The earlier packets preserve their independent source reviews, including the corrected S-unit rank, w10(Q), finite-S use in Soulé’s proof, and the distinction between raw and symbol wild kernels. The rejected allegation N.6/E-N6-2 about the signature defect is not adopted: the read preprint already defines the cokernel. Two old packets call different findings ArithmeticKTheory/E1, so the machine-readable main record identifies inherited findings by packet and locator as well as ID.

**Pins.** Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174`; Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Current library and upstream searches do not change these pins. The reviewed `data/library-coverage.json` entries and current upstream GlobalNumberFields and ProfiniteCohomology roadmaps provide the ownership/style audit. Existing S-integers, units, valuations, class groups, cohomology and eigenspaces are reused; their presence does not supply higher K or GW finiteness.

| Direct pinned reference | Module | Exact contribution |
| --- | --- | --- |
| `mathlib:Set.integer` | `Mathlib/RingTheory/DedekindDomain/SInteger.lean` | S-integer subalgebra: integrality at every height-one prime outside S. |
| `mathlib:Module.End.eigenspace` | `Mathlib/LinearAlgebra/Eigenspace/Basic.lean` | The native eigenspace submodule of a linear endomorphism, defined by f(x)=a•x. |
| `mathlib:bernoulli` | `Mathlib/NumberTheory/Bernoulli.lean` | Arithmetic Bernoulli convention with B1 = −1/2. |
| `mathlib:NumberField.classNumber` | `Mathlib/NumberTheory/NumberField/ClassNumber.lean` | Finite class-group cardinal for a number field. |
| `tauceti:Set.unit_fg_of_units` | `TauCeti/RingTheory/DedekindDomain/SInteger/Unit.lean` | Finite S and finitely generated R-units imply Group.FG (S.unit K); no rank formula is asserted. |

The source and baseline inventories of each earlier packet continue to justify its inherited references. The main packet does not pretend to reverify all of those inventories. It cites 130 earlier IDs through an explicit manifest, applies 22 contract revisions, and adds nine new targets. The three historical function-field/curve extensions are outside this number-field pass. Their IDs remain in the manifest and their original part, but they are not new arithmetic targets. An assembly must apply the contract revisions before constructing the prerequisite graph; blindly concatenating the old parts preserves the superseded V.5 back edge. Apply the planet override as well: the N.6 two-rank corollary remains a target but yields its planet position to the arithmetic Adams splitting. The combined reader selects 36 planets, at most six in every stage.

| Retained packet | Number of historical nodes |
| --- | --- |
| [ArithmeticKTheory--N.1.json](../packets/ArithmeticKTheory--N.1.json) | 56 |
| [ArithmeticKTheory--N.2.json](../packets/ArithmeticKTheory--N.2.json) | 5 |
| [ArithmeticKTheory--N.3-finite-generation.json](../packets/ArithmeticKTheory--N.3-finite-generation.json) | 5 |
| [ArithmeticKTheory--N.3.json](../packets/ArithmeticKTheory--N.3.json) | 7 |
| [ArithmeticKTheory--N.5.json](../packets/ArithmeticKTheory--N.5.json) | 6 |
| [ArithmeticKTheory--N.6.json](../packets/ArithmeticKTheory--N.6.json) | 28 |
| [ArithmeticKTheory--N.7.json](../packets/ArithmeticKTheory--N.7.json) | 23 |

The suggested file is deliberately small: it imports pinned modules and gives six light real-bodied definitions, layer statements that can be written on those carriers, and representative examples. The full API and tests above remain required even where higher carriers have no pinned Lean expression. It elaborates in 207 lines with nine intended theorem proof-placeholder warnings only. Every `example` has a proved body; the formerly admitted Bernoulli examples now reduce with pinned facts, while the regular-prime arithmetic claims remain named theorem boundaries. Elaboration is not mathematical proof closure.
