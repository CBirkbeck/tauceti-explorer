# Coleman power series — L0 arithmetic refinement

This document specifies the remaining arithmetic targets of **ColemanPowerSeries:L0 — Towers and genuine modules**. It extends the independently accepted [parent plan](../readmes/ColemanPowerSeries.md) and [packet](../packets/ColemanPowerSeries.json); it does not replace their base cyclotomic tower or their higher layers. The [follow-up packet](../packets/ColemanPowerSeries--L0.json) gives stable declaration identifiers, prerequisite edges and source versions. The [suggested file](../suggested/ColemanPowerSeries--L0.lean) tests native receiving types at the pinned libraries. All implementation statuses remain `unchecked`.

## Targets and conventions

The proof paragraphs derive the arithmetic specializations; source locators identify the underlying facts and discussions, without treating each bridge as a separately numbered source theorem. The targets are the canonical local-field comparisons, the cyclotomic tower over a finite unramified coefficient field, its actual norms and arithmetic actions, the Frobenius-twisted residue splitting, a Tate line valid at every prime, and the finite semilocal versions of these objects. Generic local fields, principal-unit filtrations, unramified Frobenius, pro-p scalar powers, completed group algebra modules and number-field completion tensors retain their existing owners.

Fix a prime p, a finite unramified extension E/ℚ_p of degree f≥1, and embeddings into one algebraic closure Ω. The accepted parent supplies primitive roots ρ_n of order p^(n+1) with ρ_(n+1)^p=ρ_n, for n≥0. Write d_n=p^n(p−1), K_n=ℚ_p(ρ_n), E_n=E(ρ_n), O=𝒪[E], O_n=𝒪[E_n], k=𝓀[E], and q=p^f. Thus at p=2 the zeroth level is E itself, with ρ_0=−1 and π_0=−2. At odd p the zeroth level already contains μ_p.

All integer rings, residues and topologies are the canonical local-field ones. The additive normalized valuation v_n satisfies v_n(π_n)=1 for π_n=ρ_n−1. The extended p-adic absolute value has ‖p‖=p⁻¹; the native residue-cardinality normalized absolute value is q^(−v_n). Consequently the two absolute values differ by the positive exponent f d_n. For the base field E=ℚ_p this exponent is d_n.

Coefficient Frobenius means arithmetic Frobenius φ_E of E/ℚ_p, with residue action r↦r^p, extended to E_n by fixing the chosen ρ_n. This choice makes its order f and its compatibility across levels literal. The cyclotomic group G=ℤ_pˣ fixes E and sends ρ_n to ρ_n raised to its unit residue modulo p^(n+1). The two actions commute. A residue field is identified with k through the scalar-induced residue isomorphism, never through an arbitrary finite-field identification.

For the semilocal targets, replace E by a finite nonempty family E_i/ℚ_p of finite unramified fields, with degrees f_i and residues k_i, in the same Ω and with the same ρ_n. Put A_n=∏_i𝒪[E_i(ρ_n)]. The topology is the finite product topology. A finite group H may act on I, with genuine coherent ℚ_p-algebra isomorphisms β_(h,i):E_i→E_(h·i). Coherence means identity and composition on the actual field maps. The extension to cyclotomic levels fixes ρ_n. Coefficient Frobenius acts componentwise and fixes the factors; H can permute them.

The unramified hypothesis is essential. For a ramified coefficient field the shifted cyclotomic polynomial need not be Eisenstein over its integers, and consecutive actual fields need not have degree p. For instance at p=2, with coefficients ℚ_2(i), the first two cyclotomic coefficient fields coincide. Their relative norm is the identity, so the signed root formula from the unramified tower cannot be carried across unchanged. The actual field norm remains the operator; none of this document’s uniform degree, residue or Tate formulas is asserted for that situation.

## Existing suppliers and the pinned prototype

The baseline is Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti `f790474821cf4256814db967cb154e7af3d0c369`. Each baseline declaration listed below was read at that revision. Current Tau Ceti was also read at `a91d3aafa8cd3e6bc33dfde0d7677ed0f1625039`, and TauCetiRoadmap at `3c18d9fbfceed0dc5c1edb1070a3927152d19e28`, including the complete LocalFieldsRamification and ProfiniteArithmetic reader documents. Current implementations are imports, even where the older pin lacks them.

| Supplier | Interface consumed |
| --- | --- |
| LocalFieldsRamification L0 | Canonical finite-extension and intermediate-field structures, integer-ring/integral-closure and topology comparisons, residue scalar maps, actual continuous norms, e/f tower formulas. |
| LocalFieldsRamification L1 | Native residue-one units versus `unitFiltration K 1`; compactness and the finite-level principal pro-p theorem. |
| LocalFieldsRamification L2–L3 | Unramified Frobenius and its functoriality; Eisenstein integral generation, integral power bases and total ramification. |
| ProfiniteProPGroups L3; current ProfiniteArithmetic §1.3 | Existing pro-p closure and scalar-power interfaces. The historical scalar reference to ProfiniteProPGroups L4 resolves to ProfiniteArithmetic and the current native implementation. |
| PadicMeasuresIwasawaAlgebras L1 | The precise continuous algebra comparison between the parent weak-measure algebra and the current genuine completed group algebra. |
| NumberFieldArithmetic L5 | Existing `semilocalEquiv` and `integralSemilocalEquiv` for actual completion tensors, with their projection and Galois transport formulas. |

The current native scalar construction is `TauCeti.IsProP.module` in `ProP.PadicPow`; the completed action is `TauCeti.IsProP.completedGroupAlgebraModule` in `ProP.CompletedGroupAlgebraModule`. Its group-element, scalar-tower and continuity theorems already provide the general action. The arithmetic comparisons below identify their action on the genuine principal norm-limit carriers. The full unit groups retain a finite prime-to-p residue factor and are not given ℤ_p-module structures.

The suggested file uses actual `IntermediateField`, `𝒪`, `𝓀`, `Algebra.norm`, `unitFiltration`, `frobeniusEquiv` and `IsProP` types. It takes the owner’s local-field structures and explicit inclusion/Frobenius compatibility equations as parameters; elaboration does not certify that all these structures have been installed canonically. Gap G1 records that audit. The native ramification predicates and current-only scalar/completed-module receiving signatures are omitted at this pin, rather than replaced by empty propositions or arbitrary assumed modules. The continuous additive Tate signatures and the finite arithmetic actions are included.

### Baseline declarations

- [mathlib:IntermediateField.adjoin](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/IntermediateField/Adjoin/Defs.lean): The native intermediate field generated by a set in an extension field; no extra field carrier is introduced.
- [mathlib:Algebra.norm](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Norm/Defs.lean): The determinant norm as a multiplicative map on an algebra; restrictions to units use Units.map.
- [mathlib:Algebra.norm_norm](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Norm/Transitivity.lean): Norm transitivity for a scalar tower, under the stated freeness hypotheses.
- [mathlib:Algebra.norm_eq_prod_automorphisms](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Norm/Transitivity.lean): In a finite Galois field extension, inclusion of the norm equals the product of all conjugates.
- [mathlib:frobeniusEquiv](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/Perfect.lean): The genuine ring automorphism on a perfect ring of exponent characteristic p; finite residue fields supply perfection.
- [mathlib:MulEquiv.piUnits](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Pi/Units.lean): The canonical multiplicative equivalence from units of the actual product ring to the product of its units.
- [mathlib:PadicInt.toZModPow](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Padics/RingHoms.lean): The actual residue ring homomorphism ℤ_p→ℤ/p^nℤ used by the exponent formulas.
- [tauceti:TauCeti.normalizedValuation_irreducible](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/LocalField/NormalizedValuation.lean): On a canonical local field, the integer-normalized valuation of a uniformizer unit in the field is Multiplicative.ofAdd 1.
- [tauceti:TauCeti.normalizedAbsoluteValue_apply_ne_zero](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/LocalField/NormalizedValuation.lean): The native normalized absolute value of x≠0 is q raised to minus its normalized additive valuation.
- [tauceti:TauCeti.eq_teichmuller](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/LocalField/Teichmuller.lean): A canonical integer unit with prescribed residue and (q−1)st power one equals the native Teichmüller lift.
- [tauceti:TauCeti.teichmuller_pow](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/LocalField/Teichmuller.lean): The native Teichmüller lift has (q−1)st power one.
- [tauceti:TauCeti.IsProP](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/Topology/Algebra/Group/Profinite/ProP/Basic.lean): Pro-p is the native property that every open-normal quotient is a p-group.
- [mathlib:Polynomial.IsEisensteinAt](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Polynomial/Eisenstein/Basic.lean): The native Eisenstein predicate: leading coefficient outside the ideal, lower coefficients in the ideal, and constant coefficient outside its square.
- [mathlib:IntermediateField.LinearDisjoint](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/LinearDisjoint.lean): Native linear disjointness for an actual intermediate field and a compatibly embedded field.
- [mathlib:IntermediateField.LinearDisjoint.of_finrank_sup](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/LinearDisjoint.lean): The finite-degree product criterion for linear disjointness of intermediate fields.
- [mathlib:IntermediateField.LinearDisjoint.inf_eq_bot](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/FieldTheory/LinearDisjoint.lean): Linearly disjoint intermediate fields have intersection equal to the base field.
- [mathlib:PowerSeries.HasEval](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/PowerSeries/Evaluation.lean): The native arithmetic evaluation condition is topological nilpotence of the target element.
- [mathlib:PowerSeries.eval₂Hom](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/PowerSeries/Evaluation.lean): For a continuous scalar ring map and a topologically nilpotent point, the existing evaluator is a ring homomorphism, with complete Hausdorff uniform and linear-topology target hypotheses.
- [mathlib:PowerSeries.eval₂_coe](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/PowerSeries/Evaluation.lean): The existing power-series evaluator agrees with polynomial evaluation on coerced polynomials.
- [mathlib:Algebra.PowerBasis.norm_gen_eq_coeff_zero_minpoly](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Norm/Basic.lean): The actual determinant norm of a power-basis generator is (−1)^dimension times the constant coefficient of its minimal polynomial.

## L0.I — Canonical comparisons with the accepted base tower

Apply the base comparisons with E=ℚ_p and f=1. The parent’s integral closure and spectral-norm topology already exist. This part identifies them with the actual canonical integer ring, residue map, unit filtration, normalized valuation and native Teichmüller section. It introduces no second local-field, valuation or finite-level Teichmüller construction.

### The canonical cyclotomic integer ring

**`baseIntegerEquiv`** (construction; id suffix `base-integer-equivalence`). For E=ℚ_p, identify the parent’s integralClosure ℤ_p K_n with 𝒪[K_n] by the unique ℤ_p-algebra equivalence whose field-valued map is the identity. It is a homeomorphism for the inherited spectral-norm and canonical valuative topologies.

API:

- `baseIntegerEquiv_coe`: Including baseIntegerEquiv(x) into K_n gives x.
- `baseIntegerEquiv_maximalIdeal`: The equivalence maps the parent ideal (π_n) onto 𝓂[K_n].
- `baseIntegerEquiv_residue`: The induced residue equivalence sends the canonical residue of baseIntegerEquiv(x) to the parent reduction red_n(x).

Unit tests:

1. **baseInteger_scalar** (compatibility): For a∈ℤ_p, the equivalence sends its scalar image to its scalar image.
2. **baseInteger_uniformizer** (computation): The integral element ρ_n−1 maps to the same uniformizer in 𝒪[K_n].
3. **baseInteger_nonunit** (non-example): The element p maps into the canonical maximal ideal and is not sent to a unit.

Construction or proof. Consume the canonical finite-intermediate-field structures and integerRing_eq_integralClosure from LocalFieldsRamification L0. Both carriers are the same integral elements in K_n. Corestrict the identity and its inverse; use the owner’s topology uniqueness, or the parent’s maximal-ideal neighbourhood basis, to prove continuity.

Acceptance. All subsequent residue, unit and valuation comparisons commute with the field inclusion.

Prerequisites: `ColemanPowerSeries:L0/cyclotomic-integral-closure`, `ColemanPowerSeries:L0/cyclotomic-integral-iff-norm`, `ColemanPowerSeries:L0/cyclotomic-maximal-ideal-topology`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`.

Source: [Local fields and profinite arithmetic: current supplier specifications](https://github.com/TauCetiProject/TauCetiRoadmap/tree/3c18d9fbfceed0dc5c1edb1070a3927152d19e28), LocalFieldsRamification, L0.III, integer rings and topology uniqueness; Suggested.lean integerRing_eq_integralClosure and finiteIntermediateField*.

### Normalization at the cyclotomic uniformizer

**`baseValuation_pi`** (lemma; id suffix `base-normalized-uniformizer`). For E=ℚ_p, v_n(π_n)=1 in the canonical TauCeti.normalizedValuation normalization.

Construction or proof. Transport irreducibility through baseIntegerEquiv and apply normalizedValuation_irreducible.

Acceptance. For p=2 and n=0, π_0=−2 and its valuation is 1.

Prerequisites: `ColemanPowerSeries:L0/unramified-base-integer-equivalence`, `ColemanPowerSeries:L0/cyclotomic-difference-irreducible`, `tauceti:TauCeti.normalizedValuation_irreducible`.

Source: [Algebraic Number Theory](https://www.math.ucla.edu/~sharifi/algnum.pdf), §5.4, Corollary 5.4.8 p.106; §6.1, Definition 6.1.14 p.118.

### Principal units on the canonical carrier

**`basePrincipalEquiv`** (construction; id suffix `base-principal-equivalence`). For E=ℚ_p, the parent’s residue-one subgroup of integralClosure ℤ_p K_n units is continuously multiplicatively equivalent to TauCeti.unitFiltration K_n 1 in K_nˣ, via the field inclusion.

API:

- `basePrincipalEquiv_coe`: The field value of the equivalence is the field value of the given unit.
- `basePrincipalEquiv_residue`: Membership is red_n(u)=1 exactly when u−1 belongs to 𝓂[K_n].
- `basePrincipalEquiv_norm`: The actual consecutive norm maps commute with this equivalence, using Algebra.norm on the field. No equality of higher filtration depths is asserted.

Unit tests:

1. **basePrincipal_root** (computation): The root ρ_n is principal, and its image under the comparison has the same actual field value ρ_n; inversion would fail this test at a root of order greater than two.
2. **basePrincipal_odd_minus_one** (non-example): For odd p, −1 is not principal.
3. **basePrincipal_dyadic_minus_one** (computation): For p=2, −1 is principal.

Construction or proof. Map a residue-one unit through the integer-ring equivalence and the unit inclusion into K_n. Use the canonical description of U(K_n,1) as integer units whose difference from 1 belongs to 𝓂[K_n]. The inverse is the integer-ring corestriction. Both topologies are induced from K_n.

Acceptance. The finite principal-unit supplier theorem applies to the actual coordinates of the parent inverse limit.

Prerequisites: `ColemanPowerSeries:L0/unramified-base-integer-equivalence`, `ColemanPowerSeries:L0/cyclotomic-unit-reduction`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group`.

Source: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), §9 equations (9-2)–(9-3) pp.162–163; Lemma 12.2 p.178.

### The parent section agrees with the native lift

**`baseTeichmuller_eq`** (comparison; id suffix `base-teichmuller-comparison`). For E=ℚ_p, the parent’s stationary section at each level, transported through baseIntegerEquiv and the parent residue equivalence, is TauCeti.teichmuller K_n.

Construction or proof. The scalar lift has residue r and is killed by p−1. The native residue cardinality is p. Apply uniqueness of the native Teichmüller lift.

Acceptance. No second finite-level Teichmüller construction is introduced.

Prerequisites: `ColemanPowerSeries:L0/unramified-base-integer-equivalence`, `ColemanPowerSeries:L0/teichmuller-tower-section`, `tauceti:TauCeti.eq_teichmuller`.

Source: [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf), Lemma 12.2 p.178; §9 p.162.

### Valuation of p in the base tower

**`baseValuation_p`** (lemma; id suffix `base-normalized-prime`). For E=ℚ_p, v_n(p)=d_n; in particular this is not the extension-normalized p-adic valuation 1.

Construction or proof. Apply the additive valuation to π_n^d_n=p·u and use that a unit of the integer ring has valuation zero.

Acceptance. For p=3 and n=1, v_1(3)=6.

Prerequisites: `ColemanPowerSeries:L0/unramified-base-normalized-uniformizer`, `ColemanPowerSeries:L0/cyclotomic-difference-power-unit`.

Source: [Algebraic Number Theory](https://www.math.ucla.edu/~sharifi/algnum.pdf), §6.1, Definitions 6.1.14–18, pp.118–119.

### The two base absolute-value conventions

**`baseAbsoluteValue`** (comparison; id suffix `base-absolute-value`). For E=ℚ_p and x∈K_n, the canonical normalized absolute value equals ‖x‖^d_n. The identity map identifies their topologies and their integer subrings.

Construction or proof. At zero both sides vanish. At nonzero x=uπ_n^a, the extended p-adic absolute value is p^(−a/d_n) and the residue-cardinality normalization is p^(−a). Raising the first to d_n gives the second. A positive power preserves the strict inequalities defining open balls.

Acceptance. At p=3,n=0 the canonical absolute value of p is 1/9, while ‖p‖=1/3.

Prerequisites: `ColemanPowerSeries:L0/unramified-base-normalized-prime`, `ColemanPowerSeries:L0/cyclotomic-norm-value-group`, `tauceti:TauCeti.normalizedAbsoluteValue_apply_ne_zero`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`.

Source: [Algebraic Number Theory](https://www.math.ucla.edu/~sharifi/algnum.pdf), §5.4, Remark 5.4.2 p.104 and Theorem 5.4.7 p.106.

## L0.II — Actual cyclotomic fields and norms over unramified coefficients

The mapped shifted cyclotomic polynomial is Eisenstein because p still generates the coefficient maximal ideal. This gives the integral power basis and scalar-pinned residue field. The actual relative degree p then determines the consecutive norms. In particular norm on the common residue field is pth power, which need not be the identity.

### Cyclotomic levels over unramified coefficients

**`coefficientLevel`** (definition; id suffix `coefficient-level`). Define E_n=IntermediateField.adjoin E {ρ_n} inside Ω, with the native intermediate-field carrier, E-algebra and distinguished root. It is the compositum E·K_n in Ω, with consecutive inclusions induced by ρ_(n+1)^p=ρ_n.

API:

- `coefficientLevel_eq_adjoin`: E_n is E(ρ_n) as an intermediate field of Ω.
- `coefficientLevel_le_succ`: E_n≤E_(n+1), and inclusion sends ρ_n to ρ_(n+1)^p.
- `coefficientLevel_base`: At E=ℚ_p these are precisely the parent’s K_n, with the same chosen roots.

Unit tests:

1. **coefficientLevel_base** (compatibility): Specializing E=ℚ_p reproduces K_n as a subfield of Ω.
2. **coefficientLevel_dyadic_zero** (degenerate): For p=2,n=0, E_0=E because ρ_0=−1.
3. **coefficientLevel_first_odd** (computation): For p=3,n=0 the field is E(ρ_0), and its degree over unramified E is 2.

Construction or proof. Use the existing intermediate-field adjoin, not a new field carrier. The root-power identity gives E_n≤E_(n+1). The universal property of adjoining one element identifies the field with the compositum.

Acceptance. Provides the actual unramified coefficient fields for norm maps and evaluations. The canonical scalar map and coefficientPi_hasEval feed the existing generic integral power-series evaluator; no second evaluator is introduced.

Prerequisites: `ColemanPowerSeries:L0/compatible-cyclotomic-roots`, `ColemanPowerSeries:L0/cyclotomic-root-compatibility`, `ColemanPowerSeries:L0/cyclotomic-root-primitivity`, `mathlib:IntermediateField.adjoin`.

Source: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146.

### The shifted polynomial over the coefficient integers

**`shiftedCyclotomic_eisenstein`** (lemma; id suffix `eisenstein-coefficients`). The parent shifted polynomial Φ_(p^(n+1))(X+1), mapped from ℤ_p to O, is Eisenstein at 𝓂[E]=(p).

Construction or proof. Unramifiedness says p generates 𝓂[E] and p∉𝓂[E]^2. The parent coefficient divisibilities persist under the scalar map, and the constant term remains p.

Acceptance. This fails for a ramified coefficient field where p has valuation greater than 1.

Prerequisites: `ColemanPowerSeries:L0/shifted-cyclotomic-eisenstein`, `ColemanPowerSeries:L0/unramified-coefficient-level`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`, `mathlib:Polynomial.IsEisensteinAt`.

Source: [Algebraic Number Theory](https://www.math.ucla.edu/~sharifi/algnum.pdf), §6.1, Definition 6.1.18 p.119; §5.4 Newton-polygon discussion pp.107–109.

### Degree of each coefficient level

**`coefficientDegree`** (lemma; id suffix `coefficient-degree`). [E_n:E]=d_n for every n≥0.

Construction or proof. Consume the owner’s Eisenstein irreducibility and generator theorem; ρ_n−1 has the mapped shifted cyclotomic polynomial of degree d_n as minimal polynomial.

Acceptance. At p=2,n=0 the degree is 1.

Prerequisites: `ColemanPowerSeries:L0/unramified-eisenstein-coefficients`, `ColemanPowerSeries:L0/unramified-coefficient-level`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`.

Source: [Algebraic Number Theory](https://www.math.ucla.edu/~sharifi/algnum.pdf), §5.4 Corollary 5.4.15 and proof p.108; §6.1 Definition 6.1.18 p.119.

### The unramified cyclotomic uniformizer

**`coefficientUniformizer`** (lemma; id suffix `coefficient-uniformizer`). π_n=ρ_n−1 is a uniformizer of the canonical O_n.

Construction or proof. Apply the supplier Eisenstein uniformizer and total-ramification theorem to the mapped shifted polynomial.

Acceptance. The normalization v_n(π_n)=1 uses the canonical local-field valuation.

Prerequisites: `ColemanPowerSeries:L0/unramified-coefficient-degree`, `ColemanPowerSeries:L0/unramified-eisenstein-coefficients`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`.

Source: [Algebraic Number Theory](https://www.math.ucla.edu/~sharifi/algnum.pdf), §5.4 Corollary 5.4.15 and proof p.108; §6.1 Definition 6.1.18 p.119.

### Consecutive degree over E

**`coefficientRelativeDegree`** (lemma; id suffix `coefficient-relative-degree`). [E_(n+1):E_n]=p.

Construction or proof. Apply the degree tower law to E⊂E_n⊂E_(n+1), using d_(n+1)=p d_n and d_n>0.

Acceptance. At p=2,n=0, E(i)/E has degree 2.

Prerequisites: `ColemanPowerSeries:L0/unramified-coefficient-degree`, `ColemanPowerSeries:L0/unramified-coefficient-level`.

Source: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146.

### Unramified coefficients and the cyclotomic field are disjoint

**`coefficientDisjoint`** (lemma; id suffix `coefficient-disjoint`). E and K_n are linearly disjoint over ℚ_p inside Ω.

Construction or proof. The Eisenstein calculation gives [E K_n:E]=[K_n:ℚ_p]. Apply the native finite-degree product criterion for linear disjointness. The existing intersection corollary then also gives E∩K_n=ℚ_p.

Acceptance. The coefficient Frobenius can be extended while fixing every cyclotomic root.

Prerequisites: `ColemanPowerSeries:L0/unramified-coefficient-degree`, `ColemanPowerSeries:L0/local-cyclotomic-degree`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`, `mathlib:IntermediateField.LinearDisjoint`, `mathlib:IntermediateField.LinearDisjoint.of_finrank_sup`, `mathlib:IntermediateField.LinearDisjoint.inf_eq_bot`.

Source: [Algebraic Number Theory](https://www.math.ucla.edu/~sharifi/algnum.pdf), §6.1 Definitions 6.1.14–18 pp.118–119; §6.4 Proposition 6.4.6 p.134.

### Total ramification over the coefficient field

**`coefficientTotallyRamified`** (lemma; id suffix `coefficient-total-ramification`). E_n/E is totally ramified in the canonical native local-field structures.

Construction or proof. Apply the owner’s total-ramification conclusion for an Eisenstein generator, after identifying the native integer ring and coefficient algebra.

Acceptance. The residue field remains k even when f>1.

Prerequisites: `ColemanPowerSeries:L0/unramified-eisenstein-coefficients`, `ColemanPowerSeries:L0/unramified-coefficient-degree`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`.

Source: [Algebraic Number Theory](https://www.math.ucla.edu/~sharifi/algnum.pdf), §5.4 Corollary 5.4.15 and proof p.108; §6.1 Definition 6.1.18 p.119.

### The integral cyclotomic power basis over O

**`coefficientIntegralBasis`** (construction; id suffix `coefficient-integral-basis`). Construct the O-power basis of O_n with generator π_n and dimension d_n. In particular O_n=O[π_n] inside E_n and is finite free over O.

API:

- `coefficientIntegralBasis_gen`: The power-basis generator is π_n.
- `coefficientIntegralBasis_dim`: Its dimension is d_n.
- `coefficientIntegralBasis_repr`: Every integer has unique O-coefficients in the indicated power basis.

Unit tests:

1. **coefficientIntegralBasis_one** (computation): The coefficient vector of 1 is (1,0,…,0).
2. **coefficientIntegralBasis_dyadic_zero** (degenerate): At p=2,n=0 the basis consists only of 1, since π_0=−2 is in O.
3. **coefficientIntegralBasis_relation** (non-example): The vector for π_n^d_n is reduced by the mapped shifted cyclotomic polynomial; it is not an extra independent coordinate.

Construction or proof. Consume integral generation by an Eisenstein uniformizer from the owner, with the comparison of 𝒪[E_n] to the integral closure of O. The monic minimal polynomial of degree d_n gives the basis 1,π_n,…,π_n^(d_n−1).

Acceptance. Allows integral norms, polynomial lifts and base change to actual coefficient rings.

Prerequisites: `ColemanPowerSeries:L0/unramified-coefficient-uniformizer`, `ColemanPowerSeries:L0/unramified-coefficient-degree`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`.

Source: [Local fields and profinite arithmetic: current supplier specifications](https://github.com/TauCetiProject/TauCetiRoadmap/tree/3c18d9fbfceed0dc5c1edb1070a3927152d19e28), LocalFieldsRamification Layer 3: Totally ramified is equivalent to Eisenstein; integral monogenicity and power-basis valuation orthogonality.

### Minimal polynomial between consecutive coefficient levels

**`coefficientRelativeMinpoly`** (lemma; id suffix `coefficient-relative-minpoly`). minpoly_(E_n)(ρ_(n+1))=X^p−ρ_n.

Construction or proof. The root-power identity supplies a monic annihilating polynomial of degree p. The relative degree of the simple extension is p, so the minimal polynomial equals that monic polynomial.

Acceptance. This is the actual field minimal polynomial, including p=2,n=0.

Prerequisites: `ColemanPowerSeries:L0/unramified-coefficient-relative-degree`, `ColemanPowerSeries:L0/unramified-coefficient-level`.

Source: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146.

### The actual point for integral series evaluation

**`coefficientPi_hasEval`** (lemma; id suffix `coefficient-series-point`). The canonical integer π_n=ρ_n−1 satisfies PowerSeries.HasEval: it is topologically nilpotent in O_n.

Construction or proof. The uniformizer has positive normalized valuation, so its powers tend to zero for the canonical topology. Convert this to the existing HasEval predicate. Consequently consume PowerSeries.eval₂Hom with the canonical continuous O→O_n scalar map and the owner’s complete Hausdorff uniform, topological-ring and linear-topology instances. Consume eval₂_coe for the polynomial comparison; no generic evaluator is planned again.

Acceptance. The unramified L1 evaluation point is ρ_n−1; the dyadic zeroth point is −2, not zero.

Prerequisites: `ColemanPowerSeries:L0/unramified-coefficient-uniformizer`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`, `mathlib:PowerSeries.HasEval`, `mathlib:PowerSeries.eval₂Hom`, `mathlib:PowerSeries.eval₂_coe`.

Source: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 Theorem 5.4.9 and proof pp.145–146, with the corrected index explained in E-L0-1.

### The residue field of a coefficient level

**`coefficientResidueEquiv`** (construction; id suffix `coefficient-residue`). The scalar-induced residue map k→𝓀[E_n] is an isomorphism. Define coefficientResidueEquiv(n):𝓀[E_n]≃+*k as its inverse; let r_n:O_n→+*k be its composite with canonical residue.

API:

- `coefficientResidueEquiv_scalar`: r_n(algebraMap O O_n a)=residue_O(a).
- `coefficientResidueEquiv_root`: r_n(ρ_n)=1 and r_n(π_n)=0.
- `coefficientResidueEquiv_inclusion`: Consecutive integer inclusions commute with r_n.

Unit tests:

1. **coefficientResidue_scalar** (compatibility): A coefficient residue a∈k is unchanged by embedding into E_n.
2. **coefficientResidue_dyadic_zero** (degenerate): At p=2,n=0 this is the canonical residue map of E.
3. **coefficientResidue_extension** (non-example): For f=2 the residue cardinality is p², so the target is not ℤ/pℤ.

Construction or proof. Total ramification makes the residue degree one. Alternatively reduce the integral basis modulo π_n: only its constant term survives and O/(p)=k. Use the inverse of the canonical scalar residue map; this pins the identification without choosing a finite-field isomorphism.

Acceptance. Pins residue identifications so norm and Frobenius formulas have literal equalities.

Prerequisites: `ColemanPowerSeries:L0/unramified-coefficient-uniformizer`, `ColemanPowerSeries:L0/unramified-coefficient-integral-basis`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`, `ColemanPowerSeries:L0/unramified-coefficient-total-ramification`.

Source: [Algebraic Number Theory](https://www.math.ucla.edu/~sharifi/algnum.pdf), §6.1 Definitions 6.1.14–18 and Lemma 6.1.17, pp.118–119.

### The actual consecutive norm on coefficient units

**`coefficientUnitNorm`** (construction; id suffix `coefficient-unit-norm`). Define N_n:O_(n+1)ˣ→ₜ*O_nˣ by corestricting Units.map (Algebra.norm E_n) on E_(n+1)ˣ through the canonical integer-unit inclusions. These are actual field norms, with the inherited topologies.

API:

- `coefficientUnitNorm_coe`: The field value of N_n(u) equals Algebra.norm E_n of the field value of u.
- `coefficientUnitNorm_scalar`: For c∈O_nˣ, N_n of its image in O_(n+1) is c^p.
- `coefficientUnitNorm_trans`: Composites of consecutive N_n equal the field norm between the indicated levels.

Unit tests:

1. **coefficientUnitNorm_one** (degenerate): N_n(1)=1.
2. **coefficientUnitNorm_root** (computation): N_n(ρ_(n+1))=(−1)^(p+1)ρ_n.
3. **coefficientUnitNorm_coefficient** (non-example): For a coefficient Teichmüller unit c with c^p≠c, N_n(c)=c^p≠c; the norm is not coefficientwise identity.

Construction or proof. Consume preservation of integer units and norm continuity from LocalFieldsRamification. Corestrict to O_nˣ, rather than using a formal transition map. Norm transitivity gives all longer transitions and identifies the determinant norm of the integral algebra with the field norm.

Acceptance. The unit inverse limit uses precisely these arithmetic transitions.

Prerequisites: `ColemanPowerSeries:L0/unramified-coefficient-relative-degree`, `ColemanPowerSeries:L0/unramified-coefficient-integral-basis`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`, `mathlib:Algebra.norm`, `mathlib:Algebra.norm_norm`.

Source: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146.

### The signed root norm with coefficients

**`coefficientRootNorm`** (lemma; id suffix `coefficient-root-norm`). N_(E_(n+1)/E_n)(ρ_(n+1))=(−1)^(p+1)ρ_n.

Construction or proof. Apply the norm/constant-coefficient identity to the native minimal polynomial X^p−ρ_n and its actual generator.

Acceptance. At p=2 the root norm is −ρ_n, while the norm of 1−ρ_(n+1) has no minus sign.

Prerequisites: `ColemanPowerSeries:L0/unramified-coefficient-relative-minpoly`, `mathlib:Algebra.norm`, `ColemanPowerSeries:L0/relative-cyclotomic-root-norm`, `mathlib:Algebra.PowerBasis.norm_gen_eq_coeff_zero_minpoly`.

Source: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146.

### The actual consecutive extension is Galois

**`coefficientRelative_isGalois`** (lemma; id suffix `coefficient-relative-galois`). IsGalois E_n E_(n+1) holds for the canonical consecutive field inclusion.

Construction or proof. Every root of X^p−ρ_n is ρ_(n+1) times a pth root of unity. E_n already contains μ_p, so this polynomial splits in E_(n+1), and E_(n+1) is generated by one root. The extension has characteristic zero, hence is separable. The splitting and generation give normality and thus the native Galois predicate.

Acceptance. Justifies use of the native conjugate-product norm formula on the actual fields.

Prerequisites: `ColemanPowerSeries:L0/unramified-coefficient-relative-minpoly`, `ColemanPowerSeries:L0/unramified-coefficient-level`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`.

Source: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening p.143, consecutive cyclotomic fields and unit norms; the splitting argument is derived here.

### Ramification in the coefficient tower

**`coefficientRamification`** (lemma; id suffix `coefficient-ramification`). e(E_n/E)=d_n.

Construction or proof. The coefficient extension is totally ramified of degree d_n. Apply the owner’s e·f degree identity with residue degree one.

Acceptance. For an unramified quadratic E/ℚ_3, E_1 has e=6 and residue cardinality 9.

Prerequisites: `ColemanPowerSeries:L0/unramified-coefficient-uniformizer`, `ColemanPowerSeries:L0/unramified-coefficient-residue`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`, `ColemanPowerSeries:L0/unramified-coefficient-total-ramification`.

Source: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146.

### The Frobenius transition on residues

**`coefficientNorm_residue`** (lemma; id suffix `coefficient-norm-residue`). For every u∈O_(n+1)ˣ, r_n(N_n u)=r_(n+1)(u)^p. In particular N_n preserves principal units.

Construction or proof. The extension E_(n+1)/E_n is totally ramified, Galois of degree p. Express the field norm as the product of its p conjugates. Each conjugate acts trivially on the residue field, hence every factor has the same residue. Use the scalar-pinned residue equivalences to obtain the stated equality in k; substituting residue 1 proves principal-unit preservation.

Acceptance. For k=𝔽_9 and r of order 8, the residue transition sends r to r³, which differs from r.

Prerequisites: `ColemanPowerSeries:L0/unramified-coefficient-unit-norm`, `ColemanPowerSeries:L0/unramified-coefficient-residue`, `ColemanPowerSeries:L0/unramified-coefficient-relative-degree`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`, `mathlib:Algebra.norm_eq_prod_automorphisms`, `mathlib:Algebra.norm_eq_prod_automorphisms`, `ColemanPowerSeries:L0/unramified-coefficient-relative-galois`.

Source: [Algebraic Number Theory](https://www.math.ucla.edu/~sharifi/algnum.pdf), §6.1 Proposition 6.1.25 p.120; §6.3 Lemma 6.3.5 p.130.

### Norm of the cyclotomic difference over coefficients

**`coefficientDifferenceNorm`** (lemma; id suffix `coefficient-difference-norm`). N_(E_(n+1)/E_n)(1−ρ_(n+1))=1−ρ_n.

Construction or proof. Evaluate the native generator’s monic minimal polynomial at 1; its conjugate-product expression is the actual field norm of 1−ρ_(n+1).

Acceptance. The sign is positive for every prime. These elements are not units of O_n, so this is a field-norm statement, not an application of the unit norm homomorphism.

Prerequisites: `ColemanPowerSeries:L0/unramified-coefficient-relative-minpoly`, `ColemanPowerSeries:L0/relative-cyclotomic-difference-norm`, `mathlib:Algebra.norm_eq_prod_automorphisms`, `ColemanPowerSeries:L0/unramified-coefficient-relative-galois`.

Source: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146.

### Residue degree with coefficients

**`coefficientResidueDegree`** (lemma; id suffix `coefficient-residue-degree`). f(E_n/ℚ_p)=f.

Construction or proof. Use the scalar-pinned residue equivalence and the residue degree tower formula.

Acceptance. The residue degree is the unramified coefficient degree.

Prerequisites: `ColemanPowerSeries:L0/unramified-coefficient-residue`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`.

Source: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146.

### Norm commutes with the cyclotomic action

**`coefficientNorm_cyclotomic_equivariant`** (lemma; id suffix `coefficient-norm-cyclotomic-equivariance`). N_n∘σ_(a,n+1)=σ_(a,n)∘N_n for every a∈ℤ_pˣ.

Construction or proof. Use field-norm naturality in the consecutive compatible cyclotomic automorphism square. Corestrict to canonical integer units.

Acceptance. The norm equalizers are stable under the genuine cyclotomic action.

Prerequisites: `ColemanPowerSeries:L0/unramified-coefficient-unit-norm`, `ColemanPowerSeries:L0/unramified-coefficient-galois-action`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`.

Source: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146.

### Norm of a Teichmüller lift

**`coefficientNorm_teichmuller`** (lemma; id suffix `coefficient-teich-norm`). Transport native Teichmüller sections to k. Then N_n(ω_(n+1)(r))=ω_n(r^p) for r∈kˣ.

Construction or proof. The norm is killed by q−1 and has residue r^p. Apply native Teichmüller uniqueness.

Acceptance. The identity N_nω(r)=ω(r) holds for r∈𝔽_pˣ, but fails for a general r∈kˣ with f>1.

Prerequisites: `ColemanPowerSeries:L0/unramified-coefficient-norm-residue`, `ColemanPowerSeries:L0/unramified-coefficient-residue`, `tauceti:TauCeti.eq_teichmuller`, `tauceti:TauCeti.teichmuller_pow`.

Source: [Algebraic Number Theory](https://www.math.ucla.edu/~sharifi/algnum.pdf), Lemma 6.3.3 and Proposition 6.3.4, p.130.

### Norm commutes with the arithmetic actions

**`coefficientNorm_equivariant`** (lemma; id suffix `coefficient-norm-equivariance`). N_n∘φ_(n+1)=φ_n∘N_n on the actual integer units.

Construction or proof. Use norm naturality under the compatible field automorphisms. The scalar-pinned integer-unit corestrictions inherit that identity.

Acceptance. Frobenius and cyclotomic actions preserve norm-compatible tuples.

Prerequisites: `ColemanPowerSeries:L0/unramified-coefficient-unit-norm`, `ColemanPowerSeries:L0/unramified-coefficient-frobenius-inclusion`, `ColemanPowerSeries:L0/unramified-coefficient-galois-action`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`.

Source: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146.

### Absolute cyclotomic ramification with coefficients

**`coefficientAbsoluteRamification`** (lemma; id suffix `coefficient-absolute-ramification`). e(E_n/ℚ_p)=d_n.

Construction or proof. Multiply ramification indices in the tower E_n/E/ℚ_p; E/ℚ_p has ramification index one.

Acceptance. The coefficient degree f does not multiply the ramification index.

Prerequisites: `ColemanPowerSeries:L0/unramified-coefficient-ramification`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`.

Source: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146.

### Size of the common coefficient residue field

**`coefficientResidueCard`** (lemma; id suffix `coefficient-residue-card`). |𝓀[E_n]|=p^f.

Construction or proof. The residue field of the unramified degree-f coefficient field has p^f elements; transport cardinality through coefficientResidueEquiv.

Acceptance. For f=2,p=3 the residue field has nine elements.

Prerequisites: `ColemanPowerSeries:L0/unramified-coefficient-residue-degree`, `ColemanPowerSeries:L0/unramified-coefficient-residue`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`.

Source: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146.

### Absolute values with nontrivial residue degree

**`coefficientAbsoluteValue`** (comparison; id suffix `coefficient-absolute-value`). For x∈E_n, the canonical normalized absolute value is ‖x‖^(f d_n), where ‖·‖ is the unique extension of the ℚ_p absolute value with ‖p‖=p⁻¹.

Construction or proof. The extended p-adic absolute value of a uniformizer is p^(−1/d_n); the canonical absolute value is q⁻¹=p^(−f). Apply the factorization into a unit times a uniformizer power; zero is immediate.

Acceptance. The exponent f d_n, rather than d_n, is necessary when f>1.

Prerequisites: `ColemanPowerSeries:L0/unramified-coefficient-ramification`, `ColemanPowerSeries:L0/unramified-coefficient-uniformizer`, `tauceti:TauCeti.normalizedAbsoluteValue_apply_ne_zero`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`, `ColemanPowerSeries:L0/unramified-coefficient-absolute-ramification`, `ColemanPowerSeries:L0/unramified-coefficient-residue-card`.

Source: [Algebraic Number Theory](https://www.math.ucla.edu/~sharifi/algnum.pdf), Remark 5.4.2 p.104; Theorem 5.4.7 p.106; Definitions 6.1.14–18 pp.118–119.

### Integer-normalized valuation of p over coefficients

**`coefficientValuation_p`** (lemma; id suffix `coefficient-prime-valuation`). v_n(p)=d_n in TauCeti.normalizedValuation.

Construction or proof. The owner’s absolute ramification-index characterization is the normalized valuation of p. Apply coefficientAbsoluteRamification.

Acceptance. At p=3,n=1 and f=2 the value is 6, not 12.

Prerequisites: `ColemanPowerSeries:L0/unramified-coefficient-absolute-ramification`, `ColemanPowerSeries:L0/unramified-coefficient-uniformizer`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`.

Source: [Algebraic Number Theory](https://www.math.ucla.edu/~sharifi/algnum.pdf), Remark 5.4.2 p.104; Theorem 5.4.7 p.106; Definitions 6.1.14–18 pp.118–119.

### Normalized absolute value of a coefficient

**`coefficientAbsoluteValue_scalar`** (lemma; id suffix `coefficient-scalar-absolute-value`). For a∈E, |algebraMap E E_n a|_(E_n)=|a|_E^d_n, using the canonical residue-cardinality normalization in both fields.

Construction or proof. Both normalized absolute values are powers of the extended ℚ_p absolute value: exponents f d_n and f respectively. Compare those formulas, including zero.

Acceptance. The comparison has exponent d_n, whereas comparison to the ℚ_p absolute value has exponent f d_n.

Prerequisites: `ColemanPowerSeries:L0/unramified-coefficient-absolute-value`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`.

Source: [Algebraic Number Theory](https://www.math.ucla.edu/~sharifi/algnum.pdf), Remark 5.4.2 p.104; Theorem 5.4.7 p.106; Definitions 6.1.14–18 pp.118–119.

## L0.III — Arithmetic actions and the residue splitting

The norm equations force r_n(u_n)=Frob_k^(−n)r_0(u_0). Thus the section has nth coordinate ω_n(Frob_k^(−n)r), using the existing native Teichmüller lift. Stationary Teichmüller coordinates work only when the residue is fixed by Frobenius; the degree-two residue example distinguishes the two choices.

### Cyclotomic Galois action with fixed coefficients

**`coefficientCyclotomicAction`** (construction; id suffix `coefficient-galois-action`). For a∈ℤ_pˣ, let σ_(a,n)∈Gal(E_n/E) fix E and send ρ_n to ρ_n raised to the unit residue of a modulo p^(n+1). These continuous finite-level actions form a jointly continuous action of G=ℤ_pˣ on the coefficient tower.

API:

- `coefficientCyclotomicAction_scalar`: σ_(a,n) fixes every scalar from E.
- `coefficientCyclotomicAction_root`: σ_(a,n)(ρ_n)=ρ_n^(a mod p^(n+1)).
- `coefficientCyclotomicAction_mul`: σ_(ab,n)=σ_(a,n)∘σ_(b,n).

Unit tests:

1. **coefficientAction_one** (degenerate): The unit 1 acts as the identity.
2. **coefficientAction_square** (computation): At p=5,n=0, a p-adic unit with residue 2 sends ρ_0 to ρ_0²; it does not use the inverse exponent 3.
3. **coefficientAction_kernel** (non-example): If a≡1 modulo p^(n+1), it acts trivially at level n even when a≠1 in ℤ_pˣ.

Construction or proof. Extend the parent cyclotomic automorphism by the identity on E, using linear disjointness. Each finite-level action factors through (ℤ/p^(n+1)ℤ)ˣ, hence continuity at a coordinate is supplied by the finite quotient. Tower compatibility follows on the chosen generators.

Acceptance. Provides the actual cyclotomic group action for completed group algebra modules.

Prerequisites: `ColemanPowerSeries:L0/unramified-coefficient-disjoint`, `ColemanPowerSeries:L0/unramified-coefficient-level`, `ColemanPowerSeries:L0/norm-tower-galois-action`, `ColemanPowerSeries:L0/finite-cyclotomic-galois-action`.

Source: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146.

### The pinned coefficient Frobenius

**`coefficientFrobenius`** (construction; id suffix `coefficient-frobenius`). Let φ_E∈Gal(E/ℚ_p) be the arithmetic Frobenius, whose residue action is r↦r^p. Construct its unique extension φ_n∈Gal(E_n/ℚ_p) that fixes ρ_n. It preserves O_n and is continuous. It is not defined by an unqualified Frobenius element of the ramified extension.

API:

- `coefficientFrobenius_scalar`: φ_n(algebraMap E E_n a)=algebraMap E E_n(φ_E a).
- `coefficientFrobenius_root`: φ_n(ρ_n)=ρ_n.
- `coefficientFrobenius_residue`: r_n(φ_n a)=r_n(a)^p for a∈O_n.

Unit tests:

1. **coefficientFrobenius_base** (degenerate): When E=ℚ_p, φ_n is the identity.
2. **coefficientFrobenius_residue** (computation): For p=2,f=3 and a coefficient residue r of order 7 in 𝔽_8, the image has residue r², which differs from the inverse-Frobenius value r⁴.
3. **coefficientFrobenius_root** (compatibility): For every n, φ_n fixes ρ_n, including ρ_1=i at p=2.

Construction or proof. Consume arithmetic Frobenius on the finite unramified field from LocalFieldsRamification L2. By linear disjointness extend φ_E and the identity on K_n to the compositum. Alternatively act on the O-coefficients of the integral power basis; its defining polynomial has ℤ_p coefficients. Uniqueness follows because E and ρ_n generate E_n. Continuity and preservation of integers follow from the canonical local-field structures.

Acceptance. Specifies the Frobenius twist used by the unramified Coleman interpolation interface.

Prerequisites: `ColemanPowerSeries:L0/unramified-coefficient-disjoint`, `ColemanPowerSeries:L0/unramified-coefficient-integral-basis`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`.

Source: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146.

Source: [Algebraic Number Theory](https://www.math.ucla.edu/~sharifi/algnum.pdf), §6.4 Definition 6.4.4 and Remark 6.4.5 p.133; Proposition 6.4.6 and proof p.134.

### Frobenius respects the tower

**`coefficientFrobenius_inclusion`** (lemma; id suffix `coefficient-frobenius-inclusion`). The consecutive inclusion E_n→E_(n+1) commutes with φ_n and φ_(n+1).

Construction or proof. Both maps act as φ_E on E and fix ρ_n; apply uniqueness on the generators.

Acceptance. All finite-level Frobenius actions induce one action on the arithmetic limit.

Prerequisites: `ColemanPowerSeries:L0/unramified-coefficient-frobenius`, `ColemanPowerSeries:L0/unramified-coefficient-level`.

Source: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146.

### Order of coefficient Frobenius

**`coefficientFrobenius_order`** (lemma; id suffix `coefficient-frobenius-order`). φ_n^f=1, and φ_n has order f; on the common residue field its action is the native frobeniusEquiv k p.

Construction or proof. Arithmetic Frobenius generates the unramified Galois group of degree f. The extension fixes K_n, so its order is at most f and restriction to E gives the reverse divisibility.

Acceptance. For f=2, φ_n²=1 without forcing φ_n=1.

Prerequisites: `ColemanPowerSeries:L0/unramified-coefficient-frobenius`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`, `mathlib:frobeniusEquiv`.

Source: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146.

Source: [Algebraic Number Theory](https://www.math.ucla.edu/~sharifi/algnum.pdf), §6.4 Definition 6.4.4 and Remark 6.4.5 p.133; Proposition 6.4.6 and proof p.134.

### Coefficient and cyclotomic actions commute

**`coefficientActions_commute`** (lemma; id suffix `coefficient-actions-commute`). φ_n∘σ_(a,n)=σ_(a,n)∘φ_n for every a∈ℤ_pˣ and n≥0.

Construction or proof. On E the cyclotomic action is the identity; on ρ_n the coefficient Frobenius is the identity. Apply uniqueness from generation by E and ρ_n.

Acceptance. A product action of Gal(E/ℚ_p)×ℤ_pˣ is well defined.

Prerequisites: `ColemanPowerSeries:L0/unramified-coefficient-frobenius`, `ColemanPowerSeries:L0/unramified-coefficient-galois-action`.

Source: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146.

### Norm-compatible coefficient units

**`coefficientUnitLimit`** (definition; id suffix `coefficient-unit-limit`). Define U∞(E) as the subgroup of ∏_(n≥0) O_nˣ cut out by N_n(u_(n+1))=u_n, with the subspace topology. Its coordinates are genuine integer units and its transitions are coefficientUnitNorm.

API:

- `coefficientUnitLimit_transition`: Every u satisfies N_n(u_(n+1))=u_n.
- `coefficientUnitLimit_ext`: Two elements are equal if all coordinates agree.
- `coefficientUnitLimit_base`: At E=ℚ_p, identify U∞(E) with the parent’s actual unit inverse limit via baseIntegerEquiv.

Unit tests:

1. **coefficientUnitLimit_one** (degenerate): The tuple of units 1 belongs to U∞(E).
2. **coefficientUnitLimit_teich_failure** (non-example): For k=𝔽_9 and r of order 8, the stationary tuple ω_n(r) does not belong to U∞(E).
3. **coefficientUnitLimit_actual_norms** (compatibility): A tuple of native integer units belongs exactly when every native field norm of its next coordinate equals its current field-valued coordinate.

Construction or proof. Specialize the parent inverse-limit subgroup construction to the actual coefficient fields and actual norms. The defining equalities are stable under multiplication and inversion.

Acceptance. The unramified Coleman interpolation target is this arithmetic inverse limit.

Prerequisites: `ColemanPowerSeries:L0/unramified-coefficient-unit-norm`, `ColemanPowerSeries:L0/norm-compatible-units`.

Source: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146.

### Compact topology on the coefficient limit

**`coefficientUnitLimit_compact`** (lemma; id suffix `coefficient-limit-compact`). U∞(E) is a compact Hausdorff totally disconnected topological group, as a closed subgroup of ∏ O_nˣ.

Construction or proof. Each O_n is compact Hausdorff and totally disconnected. Its unit group is a closed subspace because residue-nonzero is a finite union of closed residue fibres. Each transition equation is an equalizer of continuous maps into Hausdorff O_nˣ. Their intersection is closed; the product is compact and totally disconnected.

Acceptance. No surjectivity of coordinate norm maps is needed or asserted.

Prerequisites: `ColemanPowerSeries:L0/unramified-coefficient-unit-limit`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`, `ColemanPowerSeries:L0/unramified-coefficient-unit-norm`, `ColemanPowerSeries:L0/norm-compatible-units-compact`.

Source: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146.

### Residues at all levels are determined by level zero

**`coefficientUnitLimit_residue`** (lemma; id suffix `coefficient-residue-limit`). For u∈U∞(E), r_n(u_n)=Frob_k^(−n)(r_0(u_0)), where Frob_k=frobeniusEquiv k p.

Construction or proof. The norm equation gives r_n(u_n)=Frob_k(r_(n+1)(u_(n+1))). Invert the finite-field Frobenius and induct on n.

Acceptance. Residues are stationary precisely when the initial residue is in 𝔽_pˣ.

Prerequisites: `ColemanPowerSeries:L0/unramified-coefficient-unit-limit`, `ColemanPowerSeries:L0/unramified-coefficient-norm-residue`, `mathlib:frobeniusEquiv`.

Source: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146.

### Norm-compatible principal coefficient units

**`coefficientPrincipalLimit`** (definition; id suffix `coefficient-principal-limit`). Define U∞¹(E) as ker(r_0:U∞(E)→kˣ), with the subspace topology. Equivalently every coordinate has residue 1. This is the actual principal-unit subgroup, on which the ℤ_p module structure lives.

API:

- `coefficientPrincipalLimit_iff`: u belongs exactly when every r_n(u_n)=1.
- `coefficientPrincipalLimit_ext`: Equality is determined by all integer-unit coordinates.
- `coefficientPrincipalLimit_closed`: Its image in U∞(E) is closed and its inclusion is a continuous injective homomorphism.

Unit tests:

1. **coefficientPrincipal_native** (compatibility): A norm-compatible tuple belongs exactly when its nth integer unit minus 1 lies in the actual maximal ideal for every n; this agrees with the native finite-level principal condition.
2. **coefficientPrincipal_teich** (non-example): A split Teichmüller tower is principal exactly when its initial residue is 1.
3. **coefficientPrincipal_dyadic** (computation): At p=2 the signed root tuple (−ρ_n) is principal and has zeroth coordinate 1.

Construction or proof. Take the kernel of the continuous level-zero residue homomorphism. The residue formula gives the all-coordinates characterization and closedness.

Acceptance. Specifies the scalar-module carrier used by L1–L4; full units are not assigned a ℤ_p scalar structure.

Prerequisites: `ColemanPowerSeries:L0/unramified-coefficient-unit-limit`, `ColemanPowerSeries:L0/unramified-coefficient-residue-limit`, `ColemanPowerSeries:L0/unramified-coefficient-residue`.

Source: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146.

### The Frobenius-twisted Teichmüller tower

**`coefficientTeichSection`** (construction; id suffix `coefficient-teich-section`). Construct t:kˣ→ₜ*U∞(E) by t(r)_n=ω_n(Frob_k^(−n)(r)), using the native finite-level Teichmüller sections. The composite r_0∘t is the identity.

API:

- `coefficientTeichSection_apply`: The nth coordinate is exactly ω_n(Frob_k^(−n)r).
- `coefficientTeichSection_residue`: Its level-zero residue is r.
- `coefficientTeichSection_base`: At f=1 this is the parent stationary Teichmüller tower transported through the canonical integer-ring equivalence.

Unit tests:

1. **coefficientTeich_one** (degenerate): t(1)=1.
2. **coefficientTeich_quadratic** (computation): For k=𝔽_9, a residue r of order 8 gives residues r,r³,r,r³,….
3. **coefficientTeich_stationary_failure** (non-example): For that r, t(r)_1≠ω_1(r), so an untwisted section fails.

Construction or proof. The norm formula gives N_nω_(n+1)(Frob^(−n−1)r)=ω_n(Frob^(−n)r). Finite-level Teichmüller lifts are multiplicative, and finite discrete kˣ makes the resulting map continuous. The residue at level zero is r.

Acceptance. Gives the correct splitting for nontrivial unramified coefficients.

Prerequisites: `ColemanPowerSeries:L0/unramified-coefficient-teich-norm`, `ColemanPowerSeries:L0/unramified-coefficient-residue-limit`, `ColemanPowerSeries:L0/unramified-coefficient-unit-limit`, `mathlib:frobeniusEquiv`.

Source: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146.

### Topological splitting of coefficient units

**`coefficientUnitSplit`** (construction; id suffix `coefficient-unit-splitting`). Construct U∞(E)≃ₜ*kˣ×U∞¹(E), mapping u to (r_0(u_0),t(r_0(u_0))⁻¹u). Its inverse is (r,v)↦t(r)v.

API:

- `coefficientUnitSplit_fst`: The first projection is level-zero residue.
- `coefficientUnitSplit_snd`: The second projection has nth coordinate ω_n(Frob^(−n)r)⁻¹u_n.
- `coefficientUnitSplit_symm`: The inverse multiplies the twisted section by the principal tuple.

Unit tests:

1. **coefficientSplit_teich** (computation): A Teichmüller tower t(r) maps to (r,1).
2. **coefficientSplit_principal** (compatibility): A principal tuple v maps to (1,v).
3. **coefficientSplit_nontrivial** (non-example): For r≠1, t(r) does not map into the principal factor alone.

Construction or proof. The second component has residue one, and the two displayed maps are inverse multiplicative continuous maps.

Acceptance. Separates the finite prime-to-p residue group from the genuine scalar-module carrier.

Prerequisites: `ColemanPowerSeries:L0/unramified-coefficient-teich-section`, `ColemanPowerSeries:L0/unramified-coefficient-principal-limit`, `ColemanPowerSeries:L0/unramified-coefficient-limit-compact`.

Source: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146.

### The actual principal coefficient limit is pro-p

**`coefficientPrincipal_isProP`** (lemma; id suffix `coefficient-principal-prop`). TauCeti.IsProP p U∞¹(E) holds for the subgroup topology just specified.

Construction or proof. Each finite-level principal group is pro-p by the LocalFieldsRamification supplier. Identify U∞¹(E) with a closed subgroup of their countable product via its actual coordinates. Use the existing current TauCeti infinite-product IsProP theorem and subgroup theorem. The pinned finite-product theorem alone does not establish this step.

Acceptance. The theorem concerns the arithmetic principal carrier, including p=2.

Prerequisites: `ColemanPowerSeries:L0/unramified-coefficient-principal-limit`, `ColemanPowerSeries:L0/unramified-coefficient-limit-compact`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group`, `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-3-pro-p-groups-the-maximal-pro-p-quotient-frattini-theory-generation`, `tauceti:TauCeti.IsProP`.

Source: [Local fields and profinite arithmetic: current supplier specifications](https://github.com/TauCetiProject/TauCetiRoadmap/tree/3c18d9fbfceed0dc5c1edb1070a3927152d19e28), LocalFieldsRamification L1.II principal units; current TauCeti Profinite/ProP/Product and Subgroup.

### Arithmetic actions on coefficient unit limits

**`coefficientLimitActions`** (construction; id suffix `coefficient-limit-actions`). Construct the pair consisting of the monoid homomorphism G→MulAut U∞(E) and the automorphism of U∞(E) given by coefficient Frobenius, by applying the native finite-field automorphisms to each coordinate. The Frobenius component has order f and hence supplies the C_f action. Both preserve U∞¹(E), are jointly continuous, and commute.

API:

- `coefficientLimitActions_coordinate`: The nth coordinate of each action is its native finite-field automorphism applied to u_n.
- `coefficientLimitActions_teich`: Cyclotomic G fixes t(r); coefficient Frobenius sends t(r) to t(r^p).
- `coefficientLimitActions_commute`: The C_f and G actions commute on both unit limits.

Unit tests:

1. **coefficientLimitAction_square** (computation): At p=5, a cyclotomic unit with residue 2 sends the level-zero coordinate of ι(1) to ρ_0², excluding the trivial action and the inverse exponent.
2. **coefficientLimitAction_teich** (non-example): For k=𝔽_9 and r of order 8, coefficient Frobenius moves t(r), although G fixes it.
3. **coefficientLimitAction_principal** (compatibility): Each action preserves residue-one tuples.

Construction or proof. Norm equivariance restricts the coordinate actions to the limit. Principal units are stable because cyclotomic automorphisms have trivial residue action and coefficient Frobenius sends 1 to 1. Continuity is tested at each coordinate in the product topology; G acts through a finite quotient at each level and C_f is finite discrete.

Acceptance. Supplies precisely the continuous arithmetic group action required by the completed group algebra owner.

Prerequisites: `ColemanPowerSeries:L0/unramified-coefficient-norm-equivariance`, `ColemanPowerSeries:L0/unramified-coefficient-actions-commute`, `ColemanPowerSeries:L0/unramified-coefficient-principal-limit`, `ColemanPowerSeries:L0/unramified-coefficient-unit-splitting`, `ColemanPowerSeries:L0/unramified-coefficient-norm-cyclotomic-equivariance`.

Source: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146.

### Scalar action on the actual principal tower

**`coefficientPrincipalScalar_eq`** (comparison; id suffix `coefficient-scalar-comparison`). Install the existing TauCeti.IsProP.module on Additive U∞¹(E). For a∈ℤ_p and v∈U∞¹(E), its nth multiplicative coordinate is the native continuous ℤ_p power of v_n in the finite-level principal group. In particular m•v corresponds to v^m for every m∈ℕ.

Construction or proof. Import, rather than reconstruct, the current native pro-p scalar module. Its uniqueness comes from continuity and agreement with dense natural-number scalars. Each coordinate homomorphism is continuous and preserves natural powers, hence is ℤ_p-linear by the owner’s naturality theorem or density argument.

Acceptance. No O-module structure and no scalar structure on kˣ×U∞¹(E) is asserted.

Prerequisites: `ColemanPowerSeries:L0/unramified-coefficient-principal-prop`, `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group`, `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-4-free-pro-p-and-pro-c-groups-on-finite-sets`, `ColemanPowerSeries:L0/principal-tower-scalar-adapter`.

Source: [Local fields and profinite arithmetic: current supplier specifications](https://github.com/TauCetiProject/TauCetiRoadmap/tree/3c18d9fbfceed0dc5c1edb1070a3927152d19e28), ProfiniteArithmetic §1.3; current TauCeti Profinite/ProP/PadicPow, IsProP.module and its naturality API.

### Completed action on the genuine principal module

**`coefficientCompletedAction_eq`** (comparison; id suffix `coefficient-completed-action`). For Γ=G or C_f×G, install TauCeti.IsProP.completedGroupAlgebraModule on Additive U∞¹(E), over the existing completedGroupAlgebra ℤ_p Γ. Its Dirac element at γ acts as the arithmetic γ action; its ℤ_p scalar restriction is coefficientPrincipalScalar_eq, and the action is jointly continuous.

Construction or proof. Use the native current completed-group-algebra module, checking compactness, total disconnectedness, continuous group action, and separately continuous multiplication on Γ. All hold for the specified compact profinite Γ. Use completedGroupAlgebraModule_of_smul, isScalarTower_completedGroupAlgebraModule and continuousSMul_completedGroupAlgebraModule. The parent’s weak-measure algebra receives this module only after its owner supplies the precise continuous ring comparison; do not identify the two carriers by their informal names.

Acceptance. The generator γ, scalar 2 and identity all act correctly. The weak-measure comparison is an explicit supplier obligation.

Prerequisites: `ColemanPowerSeries:L0/unramified-coefficient-principal-prop`, `ColemanPowerSeries:L0/unramified-coefficient-scalar-comparison`, `ColemanPowerSeries:L0/unramified-coefficient-limit-actions`, `PadicMeasuresIwasawaAlgebras:L1`, `ColemanPowerSeries:L0/principal-completed-action-adapter`.

Source: [Local fields and profinite arithmetic: current supplier specifications](https://github.com/TauCetiProject/TauCetiRoadmap/tree/3c18d9fbfceed0dc5c1edb1070a3927152d19e28), Current TauCeti Profinite/CompletedGroupAlgebra/ProPModule; ProfiniteArithmetic §1.3; PadicMeasuresIwasawaAlgebras L1.

## L0.IV — The signed Tate line

At odd p use τ_n=ρ_n. At p=2 use τ_n=−ρ_n; its zeroth coordinate is 1. This system is compatible under actual field norms, not under squaring. The order of the higher coordinates detects every p-adic exponent, giving an injective Tate map also at p=2. Its cyclotomic character is χ(g)=g, and coefficient Frobenius fixes it.

### The signed norm-compatible Tate root

**`signedTateRoot`** (definition; id suffix `signed-tate-root`). Define τ_n=ρ_n if p is odd and τ_n=−ρ_n if p=2, as a principal integer unit of E_n. At p=2, τ_0=1 and τ_n has order 2^(n+1) for n≥1.

API:

- `signedTateRoot_odd`: For odd p, τ_n=ρ_n.
- `signedTateRoot_two`: For p=2, τ_n=−ρ_n and τ_0=1.
- `signedTateRoot_order`: For odd p, order(τ_n)=p^(n+1); for p=2,n≥1, order(τ_n)=2^(n+1).

Unit tests:

1. **signedTateRoot_zero** (degenerate): At p=2,n=0 the signed root is 1, not −1.
2. **signedTateRoot_one** (computation): At p=2,n=1 and ρ_1=i, the signed root is −i and has order 4.
3. **signedTateRoot_power_failure** (non-example): At p=2, τ_(n+1)^2=−τ_n; the signed system is not compatible under squaring.

Construction or proof. Roots have residue 1, and −1 has residue 1 at p=2. For n≥1 in the dyadic case, −ρ_n=ρ_n^(1+2^n), whose exponent is odd and therefore prime to 2^(n+1). At n=0 the root is −1 and the signed root is 1.

Acceptance. Corrects the dyadic Tate coordinates without claiming the unsiged root tuple is norm compatible.

Prerequisites: `ColemanPowerSeries:L0/unramified-coefficient-uniformizer`, `ColemanPowerSeries:L0/unramified-coefficient-residue`, `ColemanPowerSeries:L0/cyclotomic-root-primitivity`.

Source: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146.

### Signed roots obey the actual norm transitions

**`signedTateRoot_norm`** (lemma; id suffix `signed-tate-norm`). For every prime p and n≥0, N_n(τ_(n+1))=τ_n.

Construction or proof. For odd p the root norm has positive sign. At p=2, N_n(−1)=(−1)^2=1, while N_n(ρ_(n+1))=−ρ_n; their product is τ_n.

Acceptance. At p=2,n=0 the norm of −i is 1.

Prerequisites: `ColemanPowerSeries:L0/unramified-signed-tate-root`, `ColemanPowerSeries:L0/unramified-coefficient-root-norm`, `ColemanPowerSeries:L0/unramified-coefficient-relative-degree`.

Source: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146.

### The Tate line in the principal unit limit

**`signedTateTower`** (construction; id suffix `signed-tate-tower`). Construct a continuous injective ℤ_p-linear map ι:ℤ_p→Additive U∞¹(E), whose nth multiplicative coordinate is τ_n^(a mod p^(n+1)). Here ℤ_p(1) denotes this rank-one ℤ_p module with G action through the cyclotomic character and trivial C_f action.

API:

- `signedTateTower_coordinate`: The nth coordinate is τ_n raised to the p-adic residue exponent.
- `signedTateTower_injective`: The map is injective for every prime p, including 2.
- `signedTateTower_scalar`: ι(ab)=a•ι(b) in Additive U∞¹(E).

Unit tests:

1. **signedTateTower_zero** (degenerate): ι(0) is the identity tuple.
2. **signedTateTower_two** (computation): For every prime, the nth coordinate of ι(1) is the chosen signed root τ_n. At p=2 its zeroth coordinate is 1 and its first is −i when ρ_1=i.
3. **signedTateTower_detection** (non-example): At p=2 the zeroth coordinate alone cannot detect a; ι(1)≠ι(0) is detected at level 1.

Construction or proof. Finite residue exponents are well defined because τ_n^(p^(n+1))=1. The signed norm identity proves compatibility. Each coordinate factors through a finite residue quotient, proving continuity. For odd p, primitivity detects all congruences; for p=2, use every n≥1. Vanishing at those coordinates forces a to be divisible by arbitrarily large powers of p, hence a=0. The multiplicative homomorphism preserves natural powers; scalar linearity follows from the imported continuous scalar action and density.

Acceptance. Defines the same Tate twist convention at odd p and at p=2.

Prerequisites: `ColemanPowerSeries:L0/unramified-signed-tate-norm`, `ColemanPowerSeries:L0/unramified-coefficient-principal-limit`, `ColemanPowerSeries:L0/unramified-coefficient-scalar-comparison`, `mathlib:PadicInt.toZModPow`.

Source: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146.

### Cyclotomic character on the signed Tate line

**`signedTateTower_equivariant`** (lemma; id suffix `signed-tate-equivariance`). For g∈G with χ(g)=g∈ℤ_pˣ, g•ι(a)=ι(χ(g)a); coefficient Frobenius fixes ι(a).

Construction or proof. At odd p use σ_gρ_n=ρ_n^χ(g). At p=2, χ(g) is odd, so σ_g(−ρ_n)=−ρ_n^χ(g)=(−ρ_n)^χ(g). Coefficient Frobenius fixes −1 and every ρ_n. Check the equality at every coordinate and apply extensionality.

Acceptance. Dyadic sign is retained in the equivariance proof, including level zero.

Prerequisites: `ColemanPowerSeries:L0/unramified-signed-tate-tower`, `ColemanPowerSeries:L0/unramified-coefficient-limit-actions`, `ColemanPowerSeries:L0/unramified-coefficient-frobenius`.

Source: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §5.4 opening, p.143; Notation 5.4.10, p.146.

## L0.V — Finite semilocal products and transports

The semilocal carrier is a genuine finite product of the canonical integer rings. Units of that product are identified by the existing native product-units equivalence. Norm compatibility is checked componentwise, and the shuffle preserves every field-valued coordinate. Coherent coefficient transports supply actual Galois permutations; they are distinct from componentwise coefficient Frobenius.

### Extend a genuine coefficient transport

**`semilocalCoefficientTransport`** (construction; id suffix `semilocal-coefficient-transport`). For the coherent actual ℚ_p-algebra isomorphism β_(h,i):E_i≃ₐE_(h·i), construct its unique extension β_(h,i,n):E_i(ρ_n)≃ₐ[ℚ_p]E_(h·i)(ρ_n) fixing ρ_n.

H is finite and acts on I; β_(h,i) are genuine ℚ_p-algebra isomorphisms.

API:

- `semilocalCoefficientTransport_scalar`: It sends the image of a∈E_i to the image of β_(h,i)(a).
- `semilocalCoefficientTransport_root`: It sends the chosen ρ_n to the same chosen ρ_n.
- `semilocalCoefficientTransport_unique`: An actual ℚ_p-algebra isomorphism with those two restrictions equals β_(h,i,n).

Unit tests:

1. **semilocalCoefficientTransport_identity** (degenerate): Identity coefficient transport has identity extension.
2. **semilocalCoefficientTransport_root** (compatibility): Even a nonidentity coefficient transport fixes the common cyclotomic root.
3. **semilocalCoefficientTransport_coefficients** (non-example): A coefficient transport that changes a residue must change the corresponding scalar element at every level; it is not the coefficient-fixing cyclotomic action.

Construction or proof. Use the unramified/totally-ramified linear disjointness to extend β by the identity on K_n. The compositum universal property supplies the isomorphism and its inverse. Uniqueness follows since the source is generated by E_i and ρ_n. Restriction of this finite local-field isomorphism preserves the canonical integer rings and topologies.

Acceptance. Provides actual arithmetic component maps for semilocalPermutationAction, rather than an assumed action on unspecified groups.

Prerequisites: `ColemanPowerSeries:L0/unramified-coefficient-disjoint`, `ColemanPowerSeries:L0/unramified-coefficient-level`.

Source: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here.

### The finite semilocal coefficient tower

**`semilocalLevel`** (definition; id suffix `semilocal-level`). Define A_n=∏_(i∈I)𝒪[E_i(ρ_n)] with its native function-ring operations and finite product topology.

API:

- `semilocalLevel_projection`: Projection at i is the canonical integer ring O_(i,n).
- `semilocalLevel_idempotent`: The standard idempotent e_i is 1 in factor i and 0 in every other factor.
- `semilocalLevel_units`: The native MulEquiv.piUnits identifies A_nˣ with ∏_i O_(i,n)ˣ, by evaluating each unit component.

Unit tests:

1. **semilocalLevel_singleton** (degenerate): A singleton I recovers the one-field coefficient tower.
2. **semilocalLevel_two** (computation): For two factors, e_1e_2=0 and e_1+e_2=1.
3. **semilocalLevel_nonfield** (non-example): With two nonzero factors, A_n is not a field: e_1 is a nonzero nonunit idempotent.

Construction or proof. Use the native finite product ring and its canonical units-product equivalence. Each component transition is the actual field norm. When A comes from a number-field completion tensor, import NumberFieldArithmetic L5’s semilocal and integral semilocal equivalences to identify this product model; do not re-plan those generic equivalences.

Acceptance. Makes the semilocal evaluation and norm targets literal finite products of actual local fields.

Prerequisites: `ColemanPowerSeries:L0/unramified-coefficient-level`, `ColemanPowerSeries:L0/unramified-coefficient-unit-norm`, `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`, `mathlib:MulEquiv.piUnits`.

Source: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here.

### The actual componentwise semilocal norm

**`semilocalNorm`** (construction; id suffix `semilocal-norm`). Construct N_(A,n):A_(n+1)ˣ→ₜ*A_nˣ by transferring the product of the actual coefficientUnitNorm maps through MulEquiv.piUnits.

API:

- `semilocalLevel_norm`: The ith projection of N_(A,n)(u) is the actual N_(i,n)(u_i).
- `semilocalNorm_scalar`: On a scalar unit from A_n, embedded componentwise at level n+1, the norm is its pth power.
- `semilocalNorm_trans`: Consecutive componentwise norms compose to the actual longer field norm in each component.

Unit tests:

1. **semilocalNorm_one** (degenerate): The norm of the identity unit is the identity.
2. **semilocalNorm_independence** (compatibility): A unit that is identity outside one factor has norm identity outside that factor.
3. **semilocalNorm_dyadic** (computation): For p=2 the common cyclotomic root in each next-level factor has field norm −ρ_n in that factor, and the signed root has norm τ_n.

Construction or proof. Apply the native units-product equivalence at both levels and put the actual continuous field-unit norm in every coordinate. Finite products are continuous.

Acceptance. The semilocal equalizers use this arithmetic norm rather than an arbitrary transition homomorphism.

Prerequisites: `ColemanPowerSeries:L0/unramified-semilocal-level`, `ColemanPowerSeries:L0/unramified-coefficient-unit-norm`, `mathlib:MulEquiv.piUnits`.

Source: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here.

### The semilocal arithmetic unit limit

**`semilocalUnitLimit`** (definition; id suffix `semilocal-unit-limit`). Define S∞(A) as the subgroup of ∏_n A_nˣ cut out by the actual componentwise norm equations, with the induced product topology.

API:

- `semilocalUnitLimit_transition`: Every tuple satisfies the actual componentwise consecutive norm equation.
- `semilocalUnitLimit_ext`: Equality is determined by all (i,n) field-valued coordinates.
- `semilocalUnitLimit_closed`: The actual norm equalizer subgroup is closed in ∏_n A_nˣ.

Unit tests:

1. **semilocalUnitLimit_one** (degenerate): The all-identity tuple lies in S∞(A).
2. **semilocalUnitLimit_singleton** (compatibility): For singleton I this is the actual local unit norm limit, through the canonical product-units equivalence.
3. **semilocalUnitLimit_failed_norm** (non-example): A tuple with a failed actual norm equation in one component is excluded, even when all coordinates are units.

Construction or proof. Take the equalizers of the actual componentwise norm maps and coordinate projections. Products, inversion and the identity preserve the equations.

Acceptance. Gives the semilocal principal module carrier before applying any Coleman maps.

Prerequisites: `ColemanPowerSeries:L0/unramified-semilocal-level`, `ColemanPowerSeries:L0/unramified-coefficient-principal-limit`, `ColemanPowerSeries:L0/unramified-semilocal-norm`.

Source: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here.

### Principal semilocal norm-compatible units

**`semilocalPrincipalLimit`** (definition; id suffix `semilocal-principal-limit`). Define S∞¹(A) as the kernel of the level-zero product residue map S∞(A)→∏_i k_iˣ, with its subgroup topology.

API:

- `semilocalUnitLimit_principal`: A tuple is principal exactly when every (i,n) residue is 1.
- `semilocalPrincipalLimit_ext`: Two principal tuples with all the same actual unit coordinates agree.
- `semilocalPrincipalLimit_closed`: The principal kernel is closed in S∞(A).

Unit tests:

1. **semilocalPrincipalLimit_one** (degenerate): The identity is principal.
2. **semilocalPrincipalLimit_product** (compatibility): Under the shuffle it is exactly the product of the individual native principal unit limits.
3. **semilocalPrincipalLimit_bad_residue** (non-example): A tuple with nonidentity residue at level zero in one factor is excluded.

Construction or proof. The componentwise residue maps give a homomorphism at level zero. Take its actual kernel. Since Frobenius on each finite k_i is bijective, principal residue at level zero forces principal residue at every level.

Acceptance. Specifies the semilocal carrier to which the existing native scalar and completed actions apply.

Prerequisites: `ColemanPowerSeries:L0/unramified-semilocal-unit-limit`, `ColemanPowerSeries:L0/unramified-coefficient-norm-residue`.

Source: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here.

### Shuffle the actual semilocal limit

**`semilocalShuffle`** (construction; id suffix `semilocal-shuffle`). Construct the continuous multiplicative equivalence S∞(A)≃ₜ*∏_i U∞(E_i) by rearranging (n,i) coordinates.

API:

- `semilocalShuffle_apply`: The ith tower has nth coordinate equal to the (n,i) coordinate of the original unit.
- `semilocalShuffle_norm`: Each component has the original actual field norm transition.
- `semilocalShuffle_principal`: Membership in S∞¹(A) is equivalent to principality of every shuffled component; this determines the restriction to the principal subgroups.

Unit tests:

1. **semilocalShuffle_singleton** (degenerate): The singleton shuffle is the one-field identity through its canonical units equivalence.
2. **semilocalShuffle_two** (computation): For two factors the inverse sends towers u,v to the tuple with nth coordinate (u_n,v_n).
3. **semilocalShuffle_not_diagonal** (non-example): It permits independent towers in different factors; no diagonal equality is imposed.

Construction or proof. Use the canonical product-units equivalence and the product-coordinate shuffle. The norm equations are precisely the individual field equations, and the residue kernel is the product of the individual residue kernels. Both maps are continuous coordinate permutations for product and induced topologies; they are mutual inverses.

Acceptance. Transfers compactness and the genuine pro-p scalar module to the semilocal principal carrier.

Prerequisites: `ColemanPowerSeries:L0/unramified-semilocal-unit-limit`, `ColemanPowerSeries:L0/unramified-coefficient-unit-limit`, `ColemanPowerSeries:L0/unramified-coefficient-limit-compact`, `ColemanPowerSeries:L0/unramified-semilocal-principal-limit`.

Source: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here.

### Coefficient Frobenius on the semilocal tower

**`semilocalFrobenius`** (construction; id suffix `semilocal-frobenius`). Give A_n and S∞(A) componentwise arithmetic coefficient Frobenius. It fixes each standard idempotent e_i, acts by p-power on k_i, and has order lcm_(i∈I)f_i.

API:

- `semilocalFrobenius_component`: Its ith component is φ_(i,n).
- `semilocalFrobenius_idempotent`: Every e_i is fixed.
- `semilocalFrobenius_norm`: It commutes with every actual semilocal norm transition.

Unit tests:

1. **semilocalFrobenius_trivial** (degenerate): If every E_i=ℚ_p, coefficient Frobenius is the identity.
2. **semilocalFrobenius_residue** (computation): At p=2, in a degree-3 coefficient factor with residue r of order 7 in 𝔽_8, the image residue is r², not the inverse-Frobenius residue r⁴.
3. **semilocalFrobenius_no_permutation** (non-example): Even with two isomorphic factors it fixes e_1 and e_2 separately.

Construction or proof. Take the product of the pinned coefficient Frobenius automorphisms. Its order is the least common multiple of their orders. Norm compatibility follows componentwise.

Acceptance. Distinguishes coefficient Frobenius from a Galois permutation of primes.

Prerequisites: `ColemanPowerSeries:L0/unramified-semilocal-level`, `ColemanPowerSeries:L0/unramified-semilocal-shuffle`, `ColemanPowerSeries:L0/unramified-coefficient-frobenius-order`, `ColemanPowerSeries:L0/unramified-semilocal-norm`.

Source: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here.

### Twisted semilocal Teichmüller splitting

**`semilocalUnitSplit`** (construction; id suffix `semilocal-splitting`). Construct S∞(A)≃ₜ*(∏_i k_iˣ)×S∞¹(A) by taking the product of the one-field twisted coefficientUnitSplit equivalences and transferring it through semilocalShuffle.

API:

- `semilocalUnitSplit_residue`: The ith residue component is r_(i,0)(u_(i,0)).
- `semilocalUnitSplit_symm`: After shuffling, the inverse at (r,v) has ith tower t_i(r_i) times the ith tower of v.
- `semilocalUnitSplit_principal`: A principal tuple v maps to (1,v).

Unit tests:

1. **semilocalUnitSplit_section** (computation): A product of the twisted Teichmüller towers has trivial principal component.
2. **semilocalUnitSplit_principal** (degenerate): A principal tuple has all residue components equal to 1.
3. **semilocalUnitSplit_nonprincipal** (non-example): A product section with one nonidentity residue is excluded from S∞¹(A).

Construction or proof. Use the coordinate shuffle to obtain each local initial residue. Form the corresponding product of twisted Teichmüller towers; multiplying its inverse against the original tuple lies in the principal kernel. The inverse multiplies that product section by the principal tuple. Both maps and inverse are continuous and multiplicative.

Acceptance. The residue factor and the principal factor are specified separately, and only the principal factor is a scalar module.

Prerequisites: `ColemanPowerSeries:L0/unramified-semilocal-shuffle`, `ColemanPowerSeries:L0/unramified-semilocal-principal-limit`, `ColemanPowerSeries:L0/unramified-coefficient-unit-splitting`.

Source: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here.

### Galois permutations of the semilocal factors

**`semilocalPermutationAction`** (construction; id suffix `semilocal-permutation-action`). For a finite group H acting on I, suppose given ℚ_p-algebra isomorphisms β_(h,i):E_i≃ₐ[ℚ_p]E_(h·i) with β_(1,i)=1 and β_(gh,i)=β_(g,h·i)∘β_(h,i). Extend them uniquely to E_i(ρ_n)→E_(h·i)(ρ_n) fixing ρ_n. They give a continuous H action on A_n, S∞(A) and S∞¹(A), permuting idempotents and commuting with coefficient Frobenius and the cyclotomic G action.

H is finite, with the stated action and coherent actual field isomorphisms.

API:

- `semilocalPermutationAction_coordinate`: The coordinate at h·i is β_(h,i)(u_i).
- `semilocalPermutationAction_idempotent`: h(e_i)=e_(h·i).
- `semilocalPermutationAction_norm`: The actual componentwise norm maps are H-equivariant.

Unit tests:

1. **semilocalPermutationAction_one** (degenerate): The identity h fixes all coordinates.
2. **semilocalPermutationAction_swap** (computation): If h exchanges two coefficient factors i and j, its action sends the standard idempotent e_i to e_j.
3. **semilocalPermutationAction_not_frobenius** (non-example): That swap moves e_1, whereas semilocal coefficient Frobenius fixes it.

Construction or proof. Extend β by the identity on K_n using the unramified/totally-ramified compositum. The cocycle follows by uniqueness on generators. An ℚ_p isomorphism of unramified fields commutes with arithmetic Frobenius since both residue actions are canonical. Norm naturality gives the actual inverse-limit action. Use the finite discrete topology on H and coordinatewise continuity. Standard idempotents are sent to e_(h·i).

Acceptance. Provides semilocal equivariance when a number-field Galois group permutes primes above p.

Prerequisites: `ColemanPowerSeries:L0/unramified-coefficient-disjoint`, `ColemanPowerSeries:L0/unramified-semilocal-shuffle`, `ColemanPowerSeries:L0/unramified-semilocal-frobenius`, `ColemanPowerSeries:L0/unramified-coefficient-limit-actions`, `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`, `ColemanPowerSeries:L0/unramified-semilocal-coefficient-transport`, `ColemanPowerSeries:L0/unramified-semilocal-norm`.

Source: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here.

### Native scalar and completed actions on the semilocal principal carrier

**`semilocalPrincipalScalar_eq`** (comparison; id suffix `semilocal-native-modules`). Import the native ℤ_p module on Additive S∞¹(A), and for Γ=H×G the existing completedGroupAlgebra ℤ_p Γ module. The principal restriction of the actual shuffle is ℤ_p-linear and Γ-equivariant.

H and β are as in semilocalPermutationAction.

Construction or proof. The carrier is a finite product of compact abelian pro-p groups by the actual shuffle. Import IsProP.pi and the existing native scalar and completed-action modules. Each coordinate projection preserves continuous p-adic powers by natural-power compatibility and density. The genuine H action permutes components and the genuine G action acts cyclotomically, which proves the scalar and Dirac comparisons.

Acceptance. No module structure is claimed on full semilocal units, and no algebra isomorphism is inferred from an integral normal basis.

Prerequisites: `ColemanPowerSeries:L0/unramified-semilocal-shuffle`, `ColemanPowerSeries:L0/unramified-semilocal-principal-limit`, `ColemanPowerSeries:L0/unramified-coefficient-principal-prop`, `ColemanPowerSeries:L0/unramified-coefficient-scalar-comparison`, `ColemanPowerSeries:L0/unramified-coefficient-completed-action`, `ColemanPowerSeries:L0/unramified-semilocal-permutation-action`, `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-4-free-pro-p-and-pro-c-groups-on-finite-sets`, `PadicMeasuresIwasawaAlgebras:L1`.

Source: [Local fields and profinite arithmetic: current supplier specifications](https://github.com/TauCetiProject/TauCetiRoadmap/tree/3c18d9fbfceed0dc5c1edb1070a3927152d19e28), ProfiniteArithmetic §1.3; current TauCeti ProP/PadicPow.lean and ProP/CompletedGroupAlgebraModule.lean; Sharifi-IW §6.1 pp.157–158.

### The semilocal Tate submodule

**`semilocalTate_eq`** (comparison; id suffix `semilocal-tate`). The product of signedTateTower maps, transported through semilocalShuffle, embeds ∏_iℤ_p(1) continuously and ℤ_p-linearly into Additive S∞¹(A). H permutes its coordinates according to its action on I, G acts by χ on every coordinate, and coefficient Frobenius fixes the image.

H and β are as in semilocalPermutationAction.

Construction or proof. Take the product of the actual signed Tate embeddings. Because β fixes the chosen ρ_n and −1, the permutation action preserves their chosen generators. Apply coordinate extensionality for the action formulas.

Acceptance. For p=2, every factor retains the signed root normalization and the trivial zeroth coordinate.

Prerequisites: `ColemanPowerSeries:L0/unramified-signed-tate-equivariance`, `ColemanPowerSeries:L0/unramified-semilocal-shuffle`, `ColemanPowerSeries:L0/unramified-semilocal-permutation-action`, `ColemanPowerSeries:L0/unramified-semilocal-splitting`, `ColemanPowerSeries:L0/unramified-semilocal-native-modules`.

Source: [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf), §6.1 opening and semilocal unit decomposition, pp.157–158; the finite-family arithmetic specialization is derived here.

## Declaration identifiers, source corrections and planets

Every id in this refinement begins `ColemanPowerSeries:L0/unramified-`. The suffix displayed with each target identifies its packet node. Each named API item is additionally a lemma node with suffix `api-` followed by its name with underscores replaced by hyphens. This retains declaration-level granularity without repeating the API statements in a second reader catalogue. References to `ColemanPowerSeries:L0/` without `unramified-` are stable accepted-parent nodes. All prerequisite chains terminate in those accepted nodes, the listed libraries, an existing owner’s requested stage, or G1/G2.

The following source problems are stated in our own words. The packet records the retrieved source hashes and the author-copy/errata searches made on 10 October 2026. No published correction was located in the copies checked; this is a report about those copies, not a claim that no correction exists.

- **ColemanPowerSeries/E-L0-1**, Author PDF §5.4 opening p.143; Theorem 5.4.9 and proof pp.145–146; Definition 5.4.12 p.146: The fields are indexed by E_n=E(μ_(p^(n+1))), but the evaluation points in the interpolation theorem and its definition use ζ_(p^n)−1 with the same index n≥0. With that field indexing evaluate at the chosen ρ_n−1=ζ_(p^(n+1))−1. Retain the nth coefficient Frobenius twist. Apply the same shift to the proof’s finite-level evaluation points. At n=0 the printed evaluation is at zero and therefore lies in E; for odd p the norm-compatible root tower has u_0=ζ_p outside E. The shifted point lies in E_0 and generates its integer ring. Impact: a stated result.
- **ColemanPowerSeries/E-L0-2**, Author PDF §6.1 opening, p.157, semilocal normal-basis generator: The element supported at one place with value 1 is described as a generator of the semilocal integer module over the integral Galois group ring. For residue degree f>1 use an integral normal-basis element α in that local unramified field, supported at the chosen place, and the decomposition-group action on coefficients. A normal-basis equivalence is a module equivalence, with the transported action specified. The local decomposition group fixes 1, so its conjugates span only ℤ_p·1. The local integers have ℤ_p rank f. For m=5,p=3 the unramified local degree is 4, and value 1 cannot span it. Impact: the proof.
- **ColemanPowerSeries/E-L0-3**, Author PDF §6.1 opening, p.157, definition of Δ_p in the local integer normal-basis assertion: The decomposition group used for the integers of a completion of ℚ(μ_m) is declared as the decomposition group inside Gal(ℚ(μ_(mp))/ℚ). Use the decomposition group in Gal(ℚ(μ_m)/ℚ) for the unramified coefficient integers. The full group includes cyclotomic inertia and acts through this quotient on those integers. At m=5,p=3 there is a unique place above p: the coefficient integers have rank 4 over ℤ_3, while the full decomposition group for ℚ(μ_15) has order 8. Rank one over its full group ring would require rank 8. Impact: a stated result.
- **ColemanPowerSeries/E-L0-4**, Author PDF proof of Lemma 6.3.3 p.130 and proof of Proposition 6.4.6 p.134: The prime-to-residue-characteristic root-of-unity group used in the proof is counted with q elements. That group is μ_(q−1) and has q−1 elements; the finite residue field has q elements and its multiplicative group has q−1. Reduction identifies those roots with the nonzero residues. At q=2 the group has one element, not two. The lemma and proposition statements retain their intended mathematical content. Impact: nothing.

The assembled L0 has exactly six planets. Use this selection in place of the parent’s L0 selection, retaining all parent mathematics; adding the two selections would exceed the layer’s limit.

- **Unramified cyclotomic tower**: `ColemanPowerSeries:L0/unramified-coefficient-level`.
- **Residue field of the coefficient tower**: `ColemanPowerSeries:L0/unramified-coefficient-residue`.
- **Coefficient Frobenius**: `ColemanPowerSeries:L0/unramified-coefficient-frobenius`.
- **Principal coefficient units**: `ColemanPowerSeries:L0/unramified-coefficient-principal-limit`.
- **Teichmüller splitting**: `ColemanPowerSeries:L0/unramified-coefficient-teich-section`.
- **Tate twist**: `ColemanPowerSeries:L0/unramified-signed-tate-tower`.

## Coverage, acceptance and exact follow-up

The planning pass is complete, and coverage of ColemanPowerSeries:L0 is **planned**, with two recorded gaps and eight supplier requests. The targets, dependent constructions, named API, nonroutine arithmetic steps and discriminating tests have been decomposed. The stage is not closed: the receiver audit and weak-measure algebra comparison are necessary before claiming closure.

**ColemanPowerSeries:L0/G1 — Canonical arithmetic adapters and current-only interfaces at the pin.** The pin has genuine ValuativeRel local fields, unitFiltration, Teichmüller lifts and IsProP, but no canonical finite-intermediate-field instance supplier, native IsUnramified/arithmetic-Frobenius supplier, or native IsProP.module/completedGroupAlgebraModule construction. The prototype states the Frobenius extension, finite arithmetic actions and norm-limit actions against actual native field/isomorphism types with explicit arithmetic supplier parameters. It omits only the absent native ramification predicates and current-only scalar/completed receiving signatures. Close G1 by auditing the valuation/topology/algebra diamonds against the approved LocalFieldsRamification supplier and compiling the ramification and scalar/completed comparisons at the supplier-approved library revision. No free Prop or assumed arbitrary module is used.

**ColemanPowerSeries:L0/G2 — Weak-measure and native completed group algebra comparison.** The accepted parent names the weak-measure algebra as its completed ring; current TauCeti constructs the action on completedGroupAlgebra ℤ_p Γ. The exact continuous algebra equivalence between those genuine carriers is requested from PadicMeasuresIwasawaAlgebras L1. The action exists on the current native algebra, but its parent-algebra comparison is not asserted proved.

Supplier requests:

- `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-0-local-fields-and-their-finite-extensions`: Use the canonical finite-intermediate-field local-field, valued/normed/topological structures, their topology and algebra diamonds, integer-ring/integral-closure comparison, continuous actual field norm and its integral-unit corestriction; residue scalar inclusions and e/f tower formulas. The proof uses these declared owner interfaces; the pin does not already provide them automatically on E(ρ_n).
- `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-1-units-the-filtration-and-the-multiplicative-group`: Use the native equivalence of residue-one integer units with unitFiltration K 1, its compact profinite topology and IsProP theorem. This supplies the actual arithmetic coordinates, without a principal-unit type replacement.
- `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-2-unramified-extensions-and-frobenius`: Use unramifiedness as e=1, scalar residue maps, arithmetic Frobenius on E/ℚ_p with residue r↦r^p, its order f and functoriality under actual ℚ_p field isomorphisms. The tower-specific fixed-root extension is this packet’s construction.
- `tauceti:TauCetiRoadmap/LocalFieldsRamification#layer-3-ramification-the-tame-and-wild-cases-and-the-filtration`: Use the existing Eisenstein integral-generator, power-basis, uniformizer and total-ramification contracts and norm naturality on the actual finite fields. Supply any absent integral generation theorem in LocalFieldsRamification Part II, not as a duplicate generic theorem here.
- `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-3-pro-p-groups-the-maximal-pro-p-quotient-frattini-theory-generation`: Use the already implemented current TauCeti arbitrary-product and subgroup IsProP closure theorems, with compact Hausdorff hypotheses. The pinned IsProP.pi only covers finite index sets and cannot justify the countable tower by itself.
- `tauceti:TauCetiRoadmap/ProfiniteProPGroups#layer-4-free-pro-p-and-pro-c-groups-on-finite-sets`: Resolve the historical scalar supplier to current ProfiniteArithmetic §1.3 and TauCeti.IsProP.module in Topology/Algebra/Group/Profinite/ProP/PadicPow. Import its naturality and joint-continuity interface on Additive of the actual compact abelian principal pro-p group; do not construct a second scalar module.
- `PadicMeasuresIwasawaAlgebras:L1`: Identify the accepted weak-measure completed algebra with the current native completedGroupAlgebra ℤ_p Γ by a continuous ℤ_p-algebra isomorphism taking each Dirac measure to completedGroupAlgebra.of ℤ_p Γ. Transport the existing IsProP.completedGroupAlgebraModule across it and prove scalar, group-generator and continuity comparisons. No abstract module existence assumption replaces this arithmetic adapter.
- `tauceti:TauCetiRoadmap/NumberFieldArithmetic#layer-5-the-global-local-dictionary-at-finite-places`: Consume semilocalEquiv and integralSemilocalEquiv of the actual completion tensor and its integral model, including pure-tensor/projection formulas and the induced Galois factor isomorphisms. The finite product and norm limits in this packet are their cyclotomic specialization, not a second completion/tensor construction.

Acceptance requires the following checks together: the base integer-ring and residue diagrams commute; the integer-normalized valuation of p is d_n while the normalized absolute-value exponent is f d_n; the relative norm is the actual field norm, including the dyadic sign; residue norms are pth powers and the Teichmüller section has inverse Frobenius twists; the principal carrier alone receives native scalar and completed actions; the signed Tate map is injective and χ-equivariant at p=2 as well as odd p; and the semilocal shuffle preserves actual norm coordinates, coefficient Frobenius fixes idempotents, and Galois permutations move them according to H.

The L1 receiving convention is fixed: with E_n=E(μ_(p^(n+1))), the Coleman interpolation point is ρ_n−1 and the coefficient twist is the nth power of φ. No Coleman operator or interpolation theorem is replanned here; those are accepted-parent L1 targets that consume these arithmetic interfaces.

### Source versions read

- [Iwasawa Theory](https://www.math.ucla.edu/~sharifi/iwasawa.pdf) — Romyar Sharifi; Author-hosted lecture notes, PDF retrieved 10 October 2026; 191 PDF pages. Read: §5.4, opening and Theorem 5.4.9 through Corollary 5.4.13 with proofs, printed pp.143–147; §6.1 opening and Proposition 6.1.1, printed pp.157–158.
- [Algebraic Number Theory](https://www.math.ucla.edu/~sharifi/algnum.pdf) — Romyar Sharifi; Author-hosted lecture notes, PDF retrieved 10 October 2026. Read: §5.4, Proposition 5.4.3 and Corollary 5.4.6 through Corollary 5.4.8, pp.104–106; §6.1, Definitions 6.1.14–18 and Lemma 6.1.17, pp.118–119; §6.3, Lemma 6.3.3 through Lemma 6.3.6 and their proofs, pp.130–131; §6.4, Lemma 6.4.1 through Proposition 6.4.8 (including Definitions 6.4.2–4 and Remark 6.4.5) and their proofs, pp.133–134; §6.1, Proposition 6.1.25 and its preceding proof explanation, p.120; §5.4 Newton polygons and Eisenstein discussion pp.107–109; §5.4 Corollaries 5.4.14–16 and proofs, pp.108–109.
- [An introduction to p-adic L-functions](https://msp.org/ent/2025/4-1/ent-v4-n1-p03-s.pdf) — Joaquín Rodrigues Jacinto and Chris Williams; Essential Number Theory 4 (2025), published version. Read: §9 pp.161–163; Proposition 12.1 and Lemmas 12.2–12.3 pp.178–179; Proposition 12.5 and the finite-level Galois action p.179.
- [Local fields and profinite arithmetic: current supplier specifications](https://github.com/TauCetiProject/TauCetiRoadmap/tree/3c18d9fbfceed0dc5c1edb1070a3927152d19e28) — The Tau Ceti contributors; TauCetiRoadmap main at 3c18d9fbfceed0dc5c1edb1070a3927152d19e28. Read: LocalFieldsRamification/README.md, complete; Suggested.lean finite-intermediate-field, residue and pro-p contracts; ProfiniteArithmetic/README.md, complete; Suggested.lean §1.3 scalar-power signatures.

The original Coleman 1979 paper was not obtained as a freely readable full text in this run. The unramified L0 proof material is available in the Sharifi author notes cited above, with explicit derived arithmetic steps given here. Coates–Sujatha was not used; no uncleared book copy or source passage is reproduced.
