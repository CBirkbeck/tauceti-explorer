# Roadmap: higher local fields and higher class field theory

**Summary.** Build higher local fields from compatible towers of complete discrete
valuations, then construct their higher additive topologies, topological Milnor
groups, Kato cohomology and arithmetic reciprocity maps. The local end theorems
identify finite abelian extensions with norm quotients and characterize their
norm subgroups. The geometric continuation constructs all branch fields of a
Parshin chain, Beilinson adeles, Milnor idele class groups and reciprocity on
arithmetic schemes. Kato complexes connect these constructions to three precise
forms of cohomological Hasse injectivity. Explicit symbols and comparison diagrams
fix the normalizations needed by downstream arithmetic applications.

## Scope and ownership

This is the higher-dimensional continuation of
[ClassFieldTheory][CFT]. It owns compatible residue towers, higher rather than
outer valuation topology, the higher-field specialization of Milnor K-theory,
wild higher cohomological invariants, higher reciprocity, explicit higher symbols,
recursive adeles and higher arithmetic-scheme class groups. It also owns the
comparisons between these constructions and ordinary reciprocity on their common
carriers. A comparison is an equality of maps or a commuting diagram, with its
coefficient range and signs specified.

The following are prerequisites and boundaries, rather than additional targets.

- [LocalFieldsRamification][LFR], Layers 0 and 3, supplies one-local fields,
  finite extensions, normalized valuations, units, lower and upper ramification
  groups and the ordinary Herbrand function. The current Tau Ceti modules
  `NumberTheory/LocalField/FiniteExtension`, `RamificationGroup`, `Herbrand`,
  `UnitFiltration`, `Teichmuller` and `Norm` implement parts of this interface.
  The new ramification target here is Zhukov's constant/ferocious refinement for
  residue p-rank one, with its two-dimensional Milnor filtration.
- [ClassFieldTheory][CFT], Layers 5–8 and 10–12, owns ordinary local invariants,
  local Artin maps and existence, and ordinary number-field global reciprocity.
  [FunctionFieldArithmetic][FFA], Layers FA.2–FA.4, supplies the corresponding
  finite-field curve ideles and class field theory, including the
  equal-characteristic p-primary one-local existence and Schmid–Witt comparison.
  [GlobalNumberFields][GNF], Layer 6, supplies number-field ideles.
- [ProfiniteCohomology][PC], Layers 1 and 10–12, owns canonical continuous
  cohomology, transfer, Hochschild–Serre, cohomological dimension and graded cup
  products. [ProfiniteArithmetic][PA] owns generic profinite integers and
  abelianization; [LocalGaloisGroups][LGG] owns ordinary local Galois group
  structure. No second profinite or one-local Galois theory is needed here.
- [K2SymbolsBrauer][K2], Layers 5 and 9–11, owns graded Milnor K-theory, symbols,
  DVR residues, transfers, projection formulas and proper-curve Weil reciprocity.
  [KTheoryFiniteLocalFields][KLF], Layer 3, supplies ordinary one-local K₂
  computations. [MotivicEtaleKTheory][MEK], §6.6 and §§7.4–7.6, owns the
  invertible-coefficient norm-residue isomorphism, Bloch–Gabber–Kato and
  its logarithmic Witt extension, including imperfect fields.
- [CrystallineCohomology][CR], CR.4, supplies de Rham–Witt complexes.
  [SchemeAndStackFoundations][SF], SF.0, SF.2, SF.4 and SF.5, supplies schemes,
  quasi-coherent modules, henselian and Nisnevich infrastructure, resolution
  carriers and cycles. [EtaleDualityAndPerverseSheaves][EDC] supplies
  localization and smooth purity in its stated coefficient regimes. The
  additional étale homology, arithmetic niveau and wild purity contracts
  below require extensions. The degree-controlled alteration input is
  a further supplier contract;
  ordinary de Jong
  alterations do not supply the required degree prime to a chosen prime.
- Mathlib's `RestrictedProduct` and
  [Completed/RestrictedProducts][RP] supply ordinary restricted products, maps,
  reindexing and decompositions. Higher adelic restrictedness is recursive and
  is a separate construction. The coherent adelic resolution is separate from
  the étale homology complex used for Kato homology.
- Tau Ceti's `RingTheory/Huber/LaurentSeries` gives the outer adic
  Huber/Tate-ring structure. Its `Restricted/TwoSidedSeries` uses coefficient
  decay in both directions. Neither is the raw higher Laurent topology
  or `E{{T}}`, whose positive coefficients need not decay.

MEK's logarithmic symbol theorem has the full field scope
`K_i^M(E)/p^s ≃ H⁰_et(E,W_s Ω^i_log)` in characteristic p, including imperfect
fields. The higher-field trace and admissible-residue squares are §2.6 targets.
The imperfect-residue mixed-DVR comparison remains an additional supplier
requirement: KLF Layer 5's perfect-residue, generally odd-prime calculations
do not establish it. Neither a symbol isomorphism nor Witt-vector carriers
alone supply all these comparisons.

## Conventions

Write an n-local tower as `F = F_n, F_{n−1}, …, F_0`, with F_0 finite and,
for i > 0, F_i a complete discrete valuation field with residue field F_{i−1}.
The tower includes the valuations and residue identifications. The **first**
residue field of F is F_{n−1}; the **one-local bottom field** is F_1. These
coincide only in dimension two. Dimension zero means a finite field.

Parameters `(t_1,…,t_n)` are inner first and outer last. Rank coordinates lie
in `ℤ^n`, ordered by their last differing coordinate. The outer valuation ring
is written `O_outer(F)` and the recursively defined rank-n valuation ring is
`O_rank(F)`; they are different for n > 1. A positive outer valuation dominates
every negative inner valuation. Coordinate descriptions may depend on
parameters, even when the rank valuation ring does not.

Use additive notation for Milnor groups, with `K_0^M(E)=ℤ` and
`K_1^M(E)=E×`. A DVR boundary removes a uniformizer in the **last** symbol
entry. Thus `∂{u_1,…,u_{m−1},π}={ū_1,…,ū_{m−1}}` for integral units u_i.
In dimension two, `δ{u,t}=1` and `δ{t,u}=−1`. Anticommutativity is not an
assertion that repeated entries vanish: `{a,a}={a,−1}` can be nonzero.
For units u,v and integers r,s, this convention gives
`∂{uπ^r,vπ^s}=(−1)^(rs) ū^s v̄^(−r)`. Two units give 1, while
`∂{u,π}=ū` and `∂{π,π}=−1`; in residue characteristic two the last
value is 1. This fixes the sign in mixed as well as equal characteristic.
([Morrow], Proposition 5.5 and Remark 5.6, p. 33, with the valuation
exponents determined by multilinearity.)
Arithmetic Frobenius acts on a finite residue field by `x ↦ x^q` and is the
image of a positive parameter symbol in the unramified quotient.

For i ≥ 0 and n > 0, use the finite étale coefficient complex `ℤ/n(i)`.
If n is invertible this is the usual finite Tate twist. In characteristic p,
write n = m p^s with `(m,p)=1` and set

```text
ℤ/n(i) = ℤ/m(i) ⊕ W_s Ω^i_log[−i].
H^q(E, ℤ/p^s(i)) = H_et^(q−i)(E, W_s Ω^i_log).
H_Kato^q(E) = colim_n H^q(E, ℤ/n(q−1)),        q ≥ 1.
```

These conventions retain the shift. Ordinary Galois `cd_p(E) ≤ 1` in
characteristic p does not force logarithmic Kato groups in higher degree to
vanish. For finite-group higher local duality the prime condition is
`ℓ ≠ char(F_1)`, as in Milne I.2, Theorem 2.17, pp. 37–38; testing only the
first residue field in a longer tower gives the wrong range.

Keep four topologies distinct: the outer DVR topology, the raw higher additive
topology, sequentially saturated symbol topologies, and the categorical
finite-quotient criterion. The characteristic-zero multiplicative pullback
specified in §0.13 can be non-Hausdorff. `K_m^top` is a separated quotient of
the specified symbol topology; its profinite completion is another operation.
No global topological-field instance is attached to the raw higher topology.

Parshin chains are special point first. Beilinson chains are generic point
first, and an explicit reversal translates between them. Henselian branch
fields, completed branch fields and Milnor idele groups have separate carriers.
Every singular specialization retains all normalization branches and the
associated residue-field transfers.

## Exact supplier contracts

### From Mathlib and Tau Ceti

Use Mathlib at `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti at
`f790474821cf4256814db967cb154e7af3d0c369` for the representative signatures.
`Valuation`, `ValuationSubring`, `Valued`, `Valued.integer`,
`IsDiscreteValuationRing`, `IsLocalRing.ResidueField` and `IsAdicComplete`
provide individual valued and completed ring carriers. An
`IsNonarchimedeanLocalField` bundles the valuative topology, local compactness
and a nontrivial valuation; its agreement with a chosen one-step tower is a
comparison theorem. `Padic` and `PadicInt` give the mixed-characteristic examples.

`LaurentSeries K` is the native Hahn-series carrier. Its `valued` instance and
`instLaurentSeriesComplete` concern the outer T-adic topology. The exact sign
bridge is `LaurentSeries.valuation_le_iff_coeff_lt_eq_zero`: valuation at most
`exp(−D)` means vanishing coefficients at every exponent below D.
`HahnSeries.single`, `coeff_single`, `coeff_zero`, `coeff_add`, `coeff_neg` and
`coeff_injective` provide the coefficient-box interface. `OpenAddSubgroup`,
`NonarchimedeanAddGroup`, `AddGroupFilterBasis`, the additive forms of
`groupFilterBasisOfComm`, `GroupFilterBasis.topology` and
`GroupFilterBasis.nhds_one_hasBasis`, and `Valued.hasBasis_nhds_zero` supply
the topology machinery. The higher topology is always an explicitly named value.

`WittVector` and `WittVector.frobenius` supply Witt rings, while `PerfectRing`
expresses the Frobenius condition. `PowerSeries`, `UniformSpace.Completion`,
`AlgebraicGeometry.Scheme` and `ProfiniteGrp` provide additional carriers.
`IsDedekindDomain.FiniteAdeleRing`, `NumberField.AdeleRing` and
`RestrictedProduct` are consumed at the dimension-one boundary. Mathlib's
abstract `CategoryTheory.GaloisCategory` does not by itself construct the
finite-étale fundamental group of an arithmetic scheme.

At the Tau Ceti pin, `TauCeti.unitFiltration` supplies the one-local unit
subgroups, and `TauCeti.Place.ramificationGroup` supplies lower ramification
at function-field places. Continuous cochain functoriality, including
`TauCeti.ContinuousCohomology.cochainsMap_zero`, is available, but all-degree
cohomology, trace, twists and duality are consumed through PC's stronger contract.

### Ordinary arithmetic and continuous cohomology

LFR Layer 0 supplies the one-local finite-extension and residue interface;
Layer 3 supplies the ordinary ramification normalization. CFT Layer 5 supplies
`Br(F)`, the local invariant, its restriction/corestriction formulas and local
Tate duality. Layers 6 and 7 supply finite and absolute local Artin maps on a
fixed Galois carrier, and Layer 8 supplies the ordinary mixed-characteristic
existence and norm correspondence. FFA FA.3 supplies Artin–Schreier–Witt
quotients, and FA.4's `local-abelian-existence` and
`schmid-witt-artin-comparison` supply the equal-characteristic wild boundary.

For global comparisons, use GNF Layer 6's finite ideles and their principal
diagonal, CFT Layers 10–12's Brauer sequence, global Artin map and norm/existence
theorem, and FFA FA.2/FA.4's curve ideles, degree map,
`global-artin-norm-isomorphism` and `profinite-reciprocity`. Archimedean factors
belong to the full number-field interface and are added explicitly when used.

PC Layer 1 supplies canonical continuous cohomology and functorial field maps.
Layer 10 supplies all-degree transfer, Hochschild–Serre and coefficient changes,
with `cor ∘ res = [L:E]`. Layer 11 supplies ordinary cohomological dimension and
the finitely generated extension inequality. Layer 12 supplies graded cups,
twists, projection formulas and trace. These contracts must use the same
absolute Galois carrier and separable-closure embeddings as CFT.

### Milnor, logarithmic and geometric interfaces

K2 Layer 5 supplies the full graded Milnor ring and its alternating-sign laws.
Layer 9 supplies higher DVR residues and finite support; Layer 11 supplies
the signed localization comparison. Layer 10, especially §§10.24–10.29,
supplies finite transfers, transitivity, the projection formula, complete
norm/residue compatibility and proper-curve reciprocity in every degree.
The name `complete-norm-residue` here refers to transfer commuting with DVR
residue, not to the Galois-cohomological norm-residue isomorphism. The latter
comes from MEK §6.6, in every degree and for every invertible n, with products
and transfers. MEK §§7.4–7.5 supply `blochGabberKato` and
`wittLogarithmicSymbol` for arbitrary characteristic-p fields and every
degree, with the genuine étale logarithmic Witt target. Its §7.6 supplies
prime-power passage and filtered-colimit comparisons. Purely inseparable
invariance of Milnor quotients is consumed only at moduli prime to p.

CR.4 supplies finite-length ordinary/relative de Rham–Witt complexes,
dlog, Cartier, restriction and Verschiebung. CR.4.8 supplies logarithmic
sheaves and their étale exact sequences on regular locally Noetherian
characteristic-p schemes, hence on imperfect fields as well. MEK §7.4 includes
the mod-p field norm/trace comparison. The additional finite-length DVR residue,
trace and purity comparisons in imperfect and mixed-wild regimes must be
supplied with their exact scope; they do not follow merely from étale exactness.
KLF Layer 5 is consumed within each target's actual hypotheses: §5.2a
constructs an absolute logarithmic Witt complex for arbitrary prelog
ℤ_(p)-algebras at odd p, whereas its explicit DVR calculations require
perfect residue fields. This does not supply the imperfect-residue
mixed-DVR comparison. KLF Layer 3 supplies ordinary one-local K₂ computations.

SF.0 supplies Noetherian quasi-coherent modules, localization, completion and
coherent-to-quasi-coherent filtered-colimit control. SF.2 supplies field
étale/Galois comparison and Nisnevich henselian stalks. The finite-étale-cover
Galois category, `π_1^ab(U)` and the regular-scheme purity needed here are
additional geometric requirements; SF.2's field comparison does not construct
them. SF.4 supplies
proper birational resolution and SNC compactification carriers; SF.5 supplies
cycles, supports and branchwise specialization. The relative Milnor sheaf and
punctured-spectrum comparison required in §5.7 must retain modulus data and
all branches; ordinary quasi-coherent localization is insufficient.

EDC's scheme six operations and smooth trace do not yet supply the arithmetic
étale homology, field-stalk description and niveau spectral sequence used in
§6.5. A geometric extension must construct that theory with localization,
the relevant purity hypotheses and identification of its first differential
with branchwise residue/corestriction. Logarithmic purity is a further
characteristic-p requirement. No unrestricted mixed-wild boundary is assumed.
The alteration contract requires a proper regular alteration of generic degree
prime to ℓ with the compactification and transfer descent used in Jannsen
Theorems 2.10–2.11, pp. 24–25. EDC, Part II's prime-to-ℓ local uniformization
gives regular SNC covering families; identifying those with this global
proper degree-controlled contract needs a separate argument.

**Supplier gaps.** The additional imperfect/mixed-wild differential comparisons,
scheme fundamental group and purity, arithmetic étale homology/niveau theory,
and global proper degree-controlled alteration theorem just specified have
no exact export identified here. Targets that use them retain these explicit
prerequisites. They cannot be discharged by the narrower field comparison,
smooth purity, Witt-carrier or local-covering statements.

## How to read the build

Layer 0 builds the fields and distinguishes their topologies. Layer 1 gives
the Milnor residue and topological quotient needed for local arithmetic.
Layer 2 fixes coefficients and invariants before Layer 3 constructs reciprocity
and proves finite norm and existence theorems. Layer 4 computes symbols and
ramification. Layers 5 and 6 pass from branch fields to adeles, class groups,
scheme reciprocity and Hasse principles. Layer 7 proves the comparison diagrams
that let consumers combine the higher and ordinary theories. `Suggested.lean`
records the light coefficient-box definitions and milestone signatures on
existing carriers; the remaining objects are specified mathematically here.

## Layer 0: residue towers, parameters and higher topology

### 0.1 Compatible towers

Define `HigherLocalField` as a chosen finite residue tower in the convention
above. Each positive step carries its complete discrete valuation and an
identified residue field; F_0 carries a finite-field structure. Define
`HigherLocalField.tower` as the projections, `HigherLocalField.residueTower`
as truncation at F_j, and `HigherLocalField.transport` along
valuation-compatible field isomorphisms. Prove
`HigherLocalField.oneLocal_iff`, comparing a one-step tower with the ordinary
local-field interface after the topology is identified. Existence of a tower
must not erase the chosen valuations. (Zhukov, [Invitation], I §1.1, p. 5;
[Morrow], Definition 2.12 and Examples 2.14–2.15, pp. 11–12.)

**Checks.**

- A finite field has dimension zero; an infinite field with no further data
  does not satisfy the terminal finite-field condition.
- `F_q((u))((t))` has successive residues `F_q((u)), F_q`, whereas
  `ℚ_p((t))` has residues `ℚ_p, F_p`.
- `ℚ_p{{t}}` has residues `F_p((t)), F_p`; assigning `ℚ_p` as its first
  residue field interchanges the two mixed-characteristic examples.

*Needs:* the individual valued-field and residue carriers, and the one-local
interface in the supplier contracts.

### 0.2 Local parameters

Define `LocalParameters(F)` recursively: t_n is an outer uniformizer and
t_1,…,t_{n−1} are outer units whose reductions form parameters of F_{n−1}.
The projections `LocalParameters.outer` and `LocalParameters.residue` expose
these conditions; `LocalParameters.exists` chooses lifts and a uniformizer at
each step. (Zhukov, [Invitation], I §1.1, p. 6; [Morrow], Definition 2.20,
Example 2.21 and Remark 2.22, p. 14.)

**Checks.**

- `(u,t)` is a parameter system for `F_q((u))((t))`; `(t,u)` is not, since
  u is an outer unit.
- For a finite extension E of `ℚ_p`, the standard orders are `(π_E,t)` in
  `E((t))` and `(t,π_E)` in `E{{t}}`.
- Replacing a parameter by a suitable unit multiple preserves a parameter
  system, but can change inner coordinate formulas. Coordinate independence
  is proved for the intrinsic objects, rather than assumed for every formula.

*Needs:* §0.1 and the residue/unit API at one DVR step.

### 0.3 The rank valuation ring

Define `HigherLocalField.rankRing` by the recursive preimage of the lower
rank ring under outer reduction, beginning with `O_rank(F_0)=F_0`. In
particular an element of positive outer valuation always belongs, and an
outer unit belongs exactly when its reduction belongs to the lower rank ring.
Parameters define `HigherLocalField.rankValuation` with values in reverse
lexicographic `ℤ^n`; prove `HigherLocalField.rankRing_mem` by this recursive
test. The canonical chain `HigherLocalField.rankPrimes` has exactly n nonzero primes and recovers the successive
outer valuation rings by localization. The ring is henselian with fraction
field F and residue F_0. ([Morrow], Definition 3.3 and Propositions 3.5,
3.7–3.8, pp. 18–20; Zhukov, [Invitation], I §1.2, pp. 7–8.)

For ranks r write `O^(0)=F`. The parameter localization formulas to prove are
`O^(n+1−i)[t_i⁻¹]=O^(n−i)` and
`(O^(n−i))× ≃ (O^(n+1−i))× × t_i^ℤ`, for 1 ≤ i ≤ n.
These are the rank-consistent forms of the localization and unit decomposition.

**Checks.**

- Rank zero is F itself and rank one is the outer DVR ring.
- In `F_q((u))((t))`, `v(u)=(1,0)` and `v(t)=(0,1)`.
  The rank value `(−100,1)` is positive: the outer coordinate is decisive.
  Using the first coordinate first would reject an element of the ring.
- In `F_q((u))((t))`, the ideal of positive outer valuation contains
  `t/u^j` for every j ≥ 0 and is not finitely generated over
  `F_q[[u]] + t F_q((u))[[t]]`. The rank-two ring is not a DVR or a
  Noetherian substitute for the outer ring. More precisely, `t/u^(j+1)`
  belongs to the threshold ideal at `(−j−1,1)` and not the one at
  `(−j,1)`; these thresholds form a strictly ascending ideal chain.

*Needs:* §0.1–§0.2 and valuation subrings.

### 0.4 Mixed series fields

For a complete discretely valued E define `MixedSeries E`, written `E{{T}}`,
as integer-indexed coefficient families satisfying
`inf_i v_E(a_i)>−∞` and `v_E(a_i)→+∞` as i→−∞. Addition is coefficientwise;
the convolution defining multiplication converges in E. Its valuation is
`min_i v_E(a_i)` for a nonzero series. Prove that it is a complete discrete
valuation field and identify its residue with `κ(E)((T))` by reducing integral
coefficients. The interface consists of `MixedSeries.coeff`,
`MixedSeries.valuation`, `MixedSeries.residue` and `MixedSeries.complete`.
([Morrow], Example 2.6, Remark 2.7 and Examples 2.8–2.9, pp. 9–11;
Zhukov, [Invitation], I §1.1, p. 6.)

**Checks.**

- `Σ_{i≥0} T^i` is permitted, while `Σ_{i<0} T^i` fails decay at negative
  infinity. The carrier is neither ordinary Laurent series nor all doubly
  infinite coefficient families.
- `Σ_{j≥0} π_E^j T^(−j)` is permitted. Coefficients whose valuations are
  unbounded below violate the other defining condition.
- In `ℚ_p{{T}}`, p reduces to zero and T reduces to the nonzero Laurent
  parameter. Thus p is an outer uniformizer and T is an outer unit.

*Needs:* §0.1, complete DVR coefficients, Laurent series and completion.

### 0.5 Classification and standardization

For n ≥ 1, prove that a characteristic-p n-local F is isomorphic, as a
residue tower, to `F_0((t_1))⋯((t_n))`. If `char(F_1)=0`, prove
`F ≃ E((t_2))⋯((t_n))` for a finite extension E of `ℚ_p`. If r is the
smallest positive index with `char(F_r)=0`, the intermediate pattern has a
finite standard subfield of shape

```text
E{{t_1}}⋯{{t_(r−1)}}((t_(r+1)))⋯((t_n)).
```

Prove also that F has a finite extension which is standard. The proof separates
the Cohen-type coefficient lifting from the finite standardization theorem;
the latter needs the appropriate elimination of wild ramification, including
imperfect residue fields. ([Morrow], Theorem 2.18 and Remark 2.19, pp. 13–14;
Zhukov, [Invitation], I §1.1, classification and proof, pp. 6–7.) When using
successive-residue superscripts, the mixed r-local field is `F^(n−r)` and the
finite extension is over the constructed standard field, not over itself.

The two-local outcomes are `F_q((u))((t))`, `E((t))` and finite extensions
of `E{{t}}`; the last need not themselves already be standard.

*Needs:* §0.1–§0.4, coefficient-field structure, Cohen lifting and the
standardization theorem in precisely this residue-field scope.

### 0.6 Recursive higher additive topology

On `E((T))` use translated coefficient boxes `Σ_i U_i T^i`, where every
U_i is a zero-neighborhood in E and `U_i=E` for all sufficiently large i.
On `E{{T}}` the two conditions are instead: one valuation ideal `m_E^c`
is contained in every U_i, and for each integer r, `m_E^r ⊆ U_i` for all
sufficiently large i. Eventual equality to E is not required in the latter
case. Construct `HigherTopology.additive`; `HigherTopology.coefficientBasis`
records the exact box conditions. §§0.7–0.9 specify the equal-series step on
the native Laurent carrier. ([Morrow], Lemmas 4.2 and 4.7, pp. 23–24;
Zhukov, [Invitation], I §1.3.1, pp. 9–10.)

Prove additive continuity, separatedness, convergence of Cauchy sequences,
the scalar homeomorphism `HigherTopology.scalarContinuous`, the continuous
open reduction map `HigherTopology.residueOpen`, and finite-extension
compatibility `HigherTopology.finiteExtension` with the coefficient-vector
topology. In finite first-residue characteristic the construction is independent
of the chosen standard subfield, parameters and vector-space basis. With
characteristic-zero first residue a coefficient-field section remains part of
the chosen structure; arbitrary changes of it need not preserve the topology.
([Morrow], Theorems 4.4, 4.8 and 4.10, Remark 4.6, pp. 23–26;
Zhukov, [Invitation], I §1.3.2–1.3.3, pp. 11–13.)

**Checks.**

- A single Laurent step with discrete finite coefficients has the ordinary
  local-field topology.
- In `F_q((u))((t))`, the constants u^j converge to zero in the higher
  topology although their outer t-valuations all equal zero.
- In `ℚ_p{{T}}`, `U_i=p^(−max(i,0))ℤ_p` is admissible although no U_i
  equals `ℚ_p`. The constant family `U_i=ℤ_p` fails eventual containment
  of `p⁻¹ℤ_p`. Reversing the common-ideal inclusion rejects the valid family.
- Joint multiplication fails in dimension two. For any two zero-neighborhood
  boxes in `F_q((u))((t))`, choose N with the second unrestricted at N and
  r with `u^r t^(−N)` in the first. Its product with `u^(−r)t^N` is 1.
  A zero-neighborhood excluding 1 disproves joint continuity at `(0,0)`.

*Needs:* §0.4–§0.5, the coefficient-box construction below, and the
parameter-invariance and finite-extension comparison proofs. Sequential
continuity of multiplication does not provide a raw topological-field structure.

### 0.7 Coefficient boxes on native Laurent series

For any field K with a specified topology and
`U : ℤ → OpenAddSubgroup K`, define `HigherLaurent.coefficientBox K U`
as the additive subgroup of `LaurentSeries K` consisting of f with
`f.coeff i ∈ U_i` for **every** integer i. There is no eventual condition in
this definition. Its real body uses the native coefficient operations.
`HigherLaurent.mem_coefficientBox` is this exact membership equivalence;
`HigherLaurent.single_mem_coefficientBox` says
`c T^j ∈ coefficientBox U ↔ c ∈ U_j`;
`HigherLaurent.coefficientBox_inf` identifies pointwise intersections with subgroup
intersections. If `U_i=K` for i ≥ N, prove `coefficientBox_tail`: every
Laurent series vanishing below N belongs to the box. These elementary
specifications implement the boxes in [Morrow], Lemma 4.2 and Remark 4.3,
p. 23, using `HahnSeries.coeff_single`, `coeff_add` and `coeff_neg`.

**Checks.**

- The everywhere-full family gives the entire Laurent-series additive group.
- For any negative exponent j and `c ∉ U_j`, the monomial `c T^j` fails
  membership. Checking only nonnegative coefficients accepts the wrong series.
- A series belongs to the intersection box exactly when every coefficient
  belongs to both corresponding subgroups. Intersecting only finitely many
  coefficient conditions changes the carrier.

*Needs:* the pinned Laurent/Hahn coefficient and open additive subgroup APIs.

### 0.8 Admissible families and the additive basis

Call a family U **admissible**, written `HigherLaurent.IsAdmissible U`, when
`∃ N : ℤ, ∀ i ≥ N, U_i=⊤`. Construct `HigherLaurent.coefficientBasis K`
as the `AddGroupFilterBasis` whose sets are exactly the coefficient boxes of
admissible families. `HigherLaurent.mem_coefficientBasis` states equality
with such a box, whereas `HigherLaurent.coefficientBox_mem_basis` is its introduction rule.
The full family gives nonemptiness; pointwise intersection with threshold
`max(N,M)` gives directedness; the additive subgroup laws give addition and
negation. ([Morrow], Lemma 4.2, p. 23; Mathlib's additive
`groupFilterBasisOfComm`.)

**Checks.**

- The full family is admissible and its box belongs to the basis.
- Restrictions at arbitrarily negative exponents are allowed; an eventual
  condition at negative infinity would remove valid basis sets.
- For a proper open additive subgroup V of K, the constant family U_i=V
  is not admissible. Its box cannot equal a box from a different admissible
  family: sufficiently large monomials distinguish the sets.

*Needs:* §0.7 and the native additive group filter-basis constructor.

### 0.9 The named higher topology and its comparison with the outer topology

Define `HigherLaurent.higherTopology K` as the topology generated by all
translates of the admissible boxes. Prove `HigherLaurent.higherTopology_eq_basis`, equating
it with `(coefficientBasis K).topology`. It is an explicitly named topology,
not a replacement Laurent-series instance. Prove
`HigherLaurent.higher_isTopologicalAddGroup` and the exact neighborhood rule
`HigherLaurent.mem_nhds_zero_iff`: a set is a zero-neighborhood if and only if
it **contains** an admissible box. Neighborhood membership does not require
the set itself to be a box. ([Morrow], Lemma 4.2, p. 23; Mathlib's additive
`GroupFilterBasis.nhds_one_hasBasis`.)

For `NonarchimedeanAddGroup K`, show that subgroup boxes are cofinal in the
boxes made from arbitrary open zero-neighborhoods of K. This identifies the
named topology with the source's higher topology, rather than merely a topology
having some of its open sets. Prove `HigherLaurent.continuous_coeff` at every
integer exponent and `HigherLaurent.induced_single`: the topology induced by
`c ↦ c T^j` is exactly the given topology of K. With `T2Space K`, prove
`HigherLaurent.higher_t2`. ([Morrow], Lemma 4.2, p. 23, and Theorem 4.10,
p. 25; Zhukov, [Invitation], I §1.3.1–1.3.2, pp. 9–11.)

Prove `HigherLaurent.outer_le_higherTopology`, with `outer` the native
Laurent-series topology. Mathlib orders topologies in the reverse direction
to inclusion of opens, so this says that the higher topology is coarser.
Prove `higherTopology_eq_outer_iff`: equality holds exactly when K is
discrete. Consequently `outer_lt_higherTopology` holds for nondiscrete K.
The decisive witnesses are the induced topology on constants and the native
outer valuation ball of series vanishing below degree one. ([Morrow],
Remark 4.3, p. 23, and the coefficient neighborhoods in Lemma 4.2.)

The named boundary theorems `higherTopology_discrete`,
`constant_sequence_higher_not_outer` and `outer_ball_not_higher_open`
record the discrete equality, the convergence distinction for any sequence
of nonzero constants tending to zero in K, and failure of higher openness
of `T K[[T]]` for nondiscrete K. Their assumptions match the coefficient
topology, not an implicit discrete topology on K.

**Checks.**

- Discrete coefficients give exactly the native outer topology.
- If `a_j ≠ 0` and `a_j→0` in K, the constant series a_j converge to zero
  in the higher topology and fail to do so in the outer topology.
- For nondiscrete K, `T K[[T]]` is outer-open and is not higher-open.
  Its intersection with constants is `{0}`, which is not open in K.

*Needs:* §0.7–§0.8, the nonarchimedean subgroup basis, coefficient separation,
and the native valued neighborhood basis. The statements about the named
topology make every topology argument explicit in `Suggested.lean`.

### 0.10 Finite extensions of towers

For a finite tower-compatible embedding `F→L`, construct the induced finite
residue extensions at every level, including their inseparable parts. If e_i
are the successive ramification indices and `f=[L_0:F_0]`, prove
`[L:F]=f ∏_i e_i`. With parameter coordinates the restriction of rank
valuation is triangular integral, with positive diagonal e_i. Continuity here
means compatibility with each valuation of the tower; higher additive
continuity alone is not its definition. ([Morrow], Proposition 2.15, p. 12,
§2.3, pp. 15–16, and Propositions 3.12–3.13, pp. 21–22;
Zhukov, [Invitation], I §1.2, pp. 7–8.)

*Needs:* §0.1–§0.3 and finite complete-DVR extension degree formulas.

### 0.11 Admissible parameter expansions

Fix a finite last residue field, parameters and representatives R in the rank
ring containing zero. Every element has a unique expansion
`Σ_(I∈Ω) θ_I t_1^i_1⋯t_n^i_n`, with θ_I in R and Ω admissible: after
fixing the later coordinates, each next coordinate has a lower bound. Prove
convergence in the higher topology and independence of the order of summation.
A single rectangular bound is not required. In characteristic zero the
Teichmüller representatives are multiplicative representatives, not an additive
coefficient subfield. ([Morrow], Theorem 4.10(v) and Example 4.11, pp. 25–26;
Zhukov, [Invitation], I §1.3.4, pp. 13–14.)

For two variables the outer exponents have a lower bound, while the lower
bound for the inner exponent may vary with the outer exponent. For
`ℚ_3`, the representatives `{0,1,−1}` are not closed under addition.
For a merely perfect end field, convergence requires a suitable section,
as specified in the variant below.

*Needs:* §0.2, §0.5–§0.6, Teichmüller lifting and admissible support.

### 0.12 Two-dimensional arithmetic examples

Compute explicitly the towers, parameters, outer/rank integer rings and
topologies of `F_q((u))((t))`, `E((t))` and `E{{t}}`. Include the ferocious
extension in characteristic p defined by `β^p−β=u/t^p`. Put `γ=tβ`;
then `γ^p−t^(p−1)γ=u`, its residue adjoins `u^(1/p)`, the residue degree
is p and the outer ramification index is one. The extension is separable
and cyclic although the residue extension is purely inseparable.
([Morrow], Examples 2.14, 2.17 and 2.21, pp. 12–14, and §3, pp. 18–19.)

*Needs:* §0.1–§0.4 and §0.10. The example rejects an extension interface
which silently assumes separable residue fields whenever the top field
extension is separable.

### 0.13 Multiplicative topology with its characteristic qualification

For n=0 use the finite discrete topology on `F_0×`. For n≥1 with
`char(F_{n−1})=p`, topologize F× by the parameter decomposition into
rank units and discrete `ℤ^n`, with the specified induced higher topology
on units. Its convergent sequences agree with those from the graph
`x ↦ (x,x⁻¹)` into the product of higher additive spaces. Define
`HigherMultiplicativeTopology.lambda` by sequential saturation and prove
`HigherMultiplicativeTopology.graphSequences` in this characteristic range. Sequential saturation preserves
sequences and limits, but may add open sets. (Zhukov, [Invitation],
I §1.4.1–1.4.2, pp. 14–16; Fesenko, I §6.2, p. 63;
[Morrow], §4.4.1 and §4.4.3, pp. 27–29.)

If the first residue has characteristic zero, use the recursive
Zhukov/Fesenko **pullback** from the lower mixed-characteristic unit group,
with discrete parameter coordinates, before saturation. It has a nontrivial
indistinguishability subgroup. Prove
`HigherMultiplicativeTopology.principalUnits_indistinguishable`: every
element of `1+m_F` lies in every neighborhood of 1 and has neutral image
in `K_1^top(F)`. This is not the Hausdorff graph convention. Prove
`HigherMultiplicativeTopology.parameterIndependent` within the specified
coefficient structure and `HigherMultiplicativeTopology.inversion` for the
saturated topology. (Zhukov, [Invitation],
I §1.4.2, pp. 14–16; Fesenko, I §6.3, p. 64.)

**Checks.**

- Powers of an outer uniformizer with exponents tending to infinity do not
  converge to an element of F×.
- A convergent multiplicative sequence has eventually constant rank valuation
  coordinates; additive convergence to zero does not imply a limit in F×.
- In `ℚ_p((t))`, `1+t` is indistinguishable from 1 for the recursive pullback
  and vanishes in `K_1^top`; the Hausdorff graph topology separates them.

*Needs:* §0.2–§0.3 and §0.6. Comparisons with categorical finite-index
openness require their own theorem for the exact subgroup class.

### 0.14 Perfect and quasi-finite terminal fields

Define the analogous chosen towers with perfect terminal field, and the
subclass with quasi-finite terminal field, a chosen isomorphism of its
absolute Galois group with ℤ̂ and the corresponding arithmetic Frobenius
generator. The perfect terminal field carries the discrete starting
topology for the recursive construction.
Keep the finite-terminal theory as a specialization. Prove only those
classification and topology comparisons for which the chosen terminal section
and Frobenius hypotheses suffice. An infinite algebraically closed perfect
field is not quasi-finite: its absolute Galois group is trivial, rather than
isomorphic to ℤ̂. (Zhukov, [Invitation], I §1.1 and §1.3.4,
pp. 5 and 13, §17.4, p. 148; Fesenko, I §10.2, pp. 97–98;
[Morrow], Theorem 4.4, p. 23.)

**Checks.**

- A finite field specializes to the original tower convention.
- An infinite perfect field is allowed by the perfect variant and is not
  thereby assigned finite-field arithmetic Frobenius or finite residue counts.
- An algebraically closed perfect terminal field fails the quasi-finite
  Galois condition; the extra Frobenius datum cannot be inferred from perfectness.

*Needs:* §0.1 and the canonical absolute Galois interface; the finite terminal
expansion theorem is extended only with an appropriate section.

### 0.15 Categorical higher fields and finite-index openness

Let `𝔉_0` be the category of finite sets and put
`𝔉_(j+1)=Ind(Pro(𝔉_j))`, with the standard full
embeddings, and work in their union `𝔉_∞`. Construct
`HigherFiniteObject.field(F)` as a ring object in `𝔉_n` whose global
points are F. Inductively lift each truncated ring `O_F/m_F^r` from
the lower field object: use Witt/formally étale lifting in positive
residue characteristic and the chosen coefficient-field section in
residue characteristic zero. Take the pro-object of these truncated
rings and then its ind-localization by powers of an outer uniformizer.
Construct the multiplicative group object by representing units; finite
limits give its inverse-graph representation. Field operations must be
morphisms. The abstract ring object may depend on characteristic-zero
sections even though the finite-quotient criterion below does not.
For a finite quotient of `K_m^M(F)`, define categorical openness by requiring
the quotient symbol map from the m-fold multiplicative higher object to be a
morphism to that finite discrete object. Prove
`CategoricallyOpen.symbolCriterion`, presentation invariance
`CategoricallyOpen.independent`, and the finite-character kernel criterion
`CategoricallyOpen.characterCriterion`. (Kato, [Invitation], existence paper,
§1, pp. 167–173, especially Lemma 2, p. 171.)

**Checks.**

- Dimension zero recovers the finite discrete field object, and every map
  from it to a finite quotient is a morphism.
- In dimension one the finite-index norm subgroups satisfy the ordinary
  openness criterion.
- Two choices of lifts or truncation presentations give the same finite
  quotient characters; the criterion cannot depend on a preferred coordinate
  expression for a character.

*Needs:* §0.1–§0.5, generic Milnor symbols and the ind/pro presentation
comparison. Identification with a raw or sequential topology is an additional
comparison, not part of the definition. [Morrow], Theorem 4.17, p. 30,
states a saturated comparison in finite first-residue characteristic but
does not supply its proof; that statement alone cannot identify all three
openness notions in every characteristic pattern.

### Examples

For `F=F_q((u))((t))`, `O_outer=F_q((u))[[t]]` and
`O_rank=F_q[[u]]+tF_q((u))[[t]]`. Constants u^j tend to zero only in the
higher topology. The ferocious degree-p example has `(e,f_outer)=(1,p)`
and demonstrates why the residue extension is recorded with its inseparable
degree. For mixed characteristic, `E((t))` and `E{{t}}` exchange the roles
of t and π_E as outer uniformizer; their residue towers remain different.

### Dependencies

Use the valued, residue, Laurent, completion and filter-basis contracts, the
one-local finite-extension interface, generic Milnor symbols for categorical
openness, and the Cohen/standardization and topology-invariance theorems in
their imperfect-residue scope. No joint continuity of higher multiplication
or universal equality of multiplicative conventions is assumed.

## Layer 1: Milnor residues and topological K-groups

### 1.1 Iterated residues

For an n-local tower and `m≥n`, compose the n DVR boundaries supplied by
[K2], Layer 9, to obtain
`δ_F : K_m^M(F) → K_{m−n}^M(F_0)`. Use the last-entry uniformizer
convention at every step. In particular
`δ_F{t_1,…,t_n}=1` in `K_0^M(F_0)=ℤ`, and
`δ_F{a,t_1,…,t_n}=ā` for a unit lifting `a∈F_0×` through the tower.

**API.** `HigherMilnor.iteratedResidue` constructs the composite;
`HigherMilnor.iteratedResidue_parameters` and
`HigherMilnor.iteratedResidue_unitParameters` compute these two symbols;
`HigherMilnor.iteratedResidue_permute` records the permutation sign in
Milnor K-theory. This uses skew commutativity, with its usual 2-torsion
qualification on repeated entries.

**Checks.**

- At n=0 the composite is the identity, including on `K_0=ℤ`.
- On `F_q((u))((t))`, `δ{u,t}=1` and `δ{t,u}=−1`.
- A symbol consisting entirely of outer units has zero outer boundary.
  Taking the inner residue before the outer residue would fail this test.

*Needs:* §0.1–§0.3 and the generic Milnor localization boundary, not a new
presentation of Milnor K-theory. Sources: Fesenko, [Invitation], I §6.4.1,
p. 65; [Morrow], Proposition 5.5 and Remark 5.6, pp. 33–34.

### 1.2 Norms through residue towers

Use [K2], Layer 10, for the Milnor transfer of every finite field extension,
including extensions whose residue fields are inseparable. For `L/F`,
the boundary–norm squares give
`δ_F N_{L/F}=N_{L_0/F_0}δ_L`. In degree n this reads
`δ_F N=fδ_L`, where `f=[L_0:F_0]`. Restriction has the different formula
`δ_L res_{L/F}=(∏_i e_i)res_{L_0/F_0}δ_F`. In degree n the
last-residue restriction is the identity on ℤ. Together with §0.10 these recover
`[L:F]=f∏_i e_i`.

Prove transitivity, the projection formula, sequential continuity, preservation
of the indistinguishability subgroup below, and descent to `K_m^top`.
Norm subgroups in the higher reciprocity degree are closed in the specified
sequential topology. For cyclic `L/F` with generator σ, establish exactness
at the middle term of
`K_n^top(L) —(1−σ)→ K_n^top(L) —N→ K_n^top(F)`.
This Hilbert 90 assertion does not assert surjectivity of N.

**Check.** A purely unramified extension of last-residue degree d multiplies
the norm valuation by d. For a totally ramified extension with `f=1`,
`δN=δ`, with no extra ramification factor. Include §0.12's
residue-inseparable example when testing the residue–norm square.

*Needs:* §1.1, §1.3 and the transfer contract; descent and Hilbert 90 require
the topological norm theorem. Sources: [Morrow], Proposition 5.4, p. 33;
Fesenko, [Invitation], I §6.8, pp. 72–73. The generic transfer is imported;
its higher topological descent and exactness are targets here.

### 1.3 Sequential Milnor groups

For m=0 use discrete `K_0^M(F)=ℤ`. For m≥1 give `K_m^M(F)` the finest sequential topology λ_m for which subtraction
and `(F×)^m → K_m^M(F)` are sequentially continuous, using §0.13's
specified multiplicative convention. Set
`Λ_m(F)=⋂ {V : V is a zero-neighborhood}` and
`K_m^top(F)=K_m^M(F)/Λ_m(F)`, with the quotient topology. Establish the
Hausdorff sequential group structure and its universal property for
Hausdorff sequentially continuous multilinear Steinberg symbols. Ordinary
joint continuity in a product topology is a separate assertion.

**API.** `TopMilnorK.ofMilnor` is the quotient homomorphism;
`TopMilnorK.symbol` is the descended symbol;
`TopMilnorK.lift` gives the unique factorization into a Hausdorff sequential
symbol target; `TopMilnorK.kernel` identifies its kernel with Λ_m and,
after §1.6, with the divisible kernel.

**Checks.**

- For `F_q((t))`, `K_1^top=F_q((t))×`; its valuation factor is ℤ.
- The parameter symbol survives the quotient, since its iterated valuation
  is 1.
- In dimension one, profinite completion replaces that ℤ by `ℤ̂` on the
  unramified side. The uncompleted topological group still has ℤ.

*Needs:* §0.13, generic Milnor symbols and quotients. Source: Fesenko,
[Invitation], I §§6.2–6.3, pp. 63–64; §6.6, Theorems 2–3, pp. 68–70.

### 1.4 Principal units and Parshin expansions

For `m≥1` and integer `r≥1`, define `U^rK_m^M(F)` to be the subgroup
generated by `{1+a,b_2,…,b_m}`, with `a∈m_outer^r` and **arbitrary**
`b_j∈F×`. Define `U^0` using outer units in the first entry. Separately put
`V_F=1+m_rank(F)` and define `VK_m` as the subgroup generated by
`{v,b_2,…,b_m}` with `v∈V_F` and `b_j∈F×`. Its quotient image is
`VK_m^top`; this uses rank principal units, rather than only
`1+m_outer(F)`. In `K_m^top`, define the outer-depth filtration by the
closure of the quotient image of `U^r`.
A rank multi-index filtration needs its own valuation bounds and sequential
closure; identifying it with ramification will be a theorem of Layer 4.

**API.** `MilnorUnitFiltration.subgroup` is the generated subgroup;
`MilnorUnitFiltration.antitone` states `U^r⊆U^s` for `r≥s`;
`MilnorUnitFiltration.topImage` specifies the closed image;
`MilnorUnitFiltration.one` identifies `U^rK_1` with `1+m_outer^r`;
`MilnorUnitFiltration.rankPrincipal` and `.rankPrincipal_top` give `VK_m`
and its quotient image; `.outer_one_le_rankPrincipal` states `U^1⊆VK_m`.

**Checks.**

- `{1+t^r,u}` in `F_q((u))((t))` belongs to `U^rK_2`, hence to every
  `U^s` with `1≤s≤r`.
- `{u,t}` has δ=1 and cannot lie in the principal-unit subgroup.
- In degree one, `1+t^r` has depth r, whereas `1+t^{r−1}` does not have
  depth r for `r>1`.
- In `F_q((u))((t))`, `{1+u,t}` belongs to `VK_2`, since `1+u∈V_F`.
  It does not belong to `U^1`: its t-boundary is the nontrivial
  degree-one class `{1+u}`, whereas the boundary vanishes on `U^1`.
- In dimension one the rank and outer valuation rings coincide, so
  `VK_1=U^1K_1`. This agreement fails for the preceding two-local example.

For `n≥1` and `F=F_q((t_1))⋯((t_n))` of characteristic p, establish Parshin's
decomposition
`K_n^top(F) ≃ ℤ ⊕ (ℤ/(q−1))^n ⊕ VK_n^top(F)`.
After fixing an `F_p`-basis θ of `F_q`, the principal part has a unique
convergent `ℤ_p` expansion in
`{1+θt^I,t_1,…,t̂_l,…,t_n}`. Require `I>0` in the last-differing-coordinate
order, `p∤gcd(I)`, and l the smallest inner-to-outer label with `p∤i_l`.
Coefficients and supports must satisfy the admissible convergence condition
from the higher topology; this is not an unrestricted product of all
`ℤ_p` coefficients. Prove absence of p-torsion. Converting Parshin's reversed
parameter symbol contributes `(-1)^{n(n−1)/2}`.

**Check.** In dimension two there are two tame factors `ℤ/(q−1)`, and no
p-torsion.

*Needs:* §0.11, §1.1, §1.3, generic symbol relations, and the differential
and Witt character comparisons of §2.6 and §4.5 for uniqueness. Sources:
Fesenko, [Invitation], I §6.3, p. 64, §§6.5–6.6, pp. 66–70; Parshin,
I §§7.1–7.3, pp. 75–77, especially §7.2, Theorem 1.

### 1.5 A residue–norm computation

On `F_q((u))((t))`, compute successively
`∂_t{u,t}={u}` and `∂_u{u}=1`. Reversing the parameters gives −1.
For `a∈F_q×`, `δ{a,u,t}=a`, while `δ{a,t,u}=a^{-1}`.
Check `δ_FN=fδ_L` for a finite constant extension and for the
residue-inseparable extension of §0.12. These distinguish the norm's
last-residue factor from restriction's ramification factors.

*Needs:* §1.1–§1.2. Source: [Invitation], I §§6.4.1–6.4.2, p. 65.

### 1.6 The divisible kernel and finite coefficients

For higher local fields, prove
`Λ_m=⋂_{a≥1} aK_m^M(F)` and prove that this subgroup is divisible.
Consequently the quotient induces
`K_m^M(F)/a ≃ K_m^top(F)/a` for every positive integer a. The theorem's
all-prime scope includes p=2; an odd-p explicit formula alone is insufficient
to supply it. For an ordinary local field and m=1, Λ_1 is zero. In other
degrees an algebraic group can have a large divisible subgroup, so finite
quotient agreement cannot prove injectivity of the algebraic quotient map.

**Check.** The valuation class 1 has nonzero image modulo every `a>1`.
Those compatible images do not make the original ℤ factor profinite.

*Needs:* §1.3, the divisibility theorem and finite-length symbol pairings.
Sources: [Invitation], I §6.1, pp. 61–62, §6.6, Theorems 2–3, pp. 68–70;
[Morrow], §4.4.2, p. 28.

### Examples

The calculation of §1.5 separates the three normalizations: the last-entry
boundary removes t, restriction multiplies by the ramification indices,
and norm multiplies the final valuation by the last-residue degree.
For `F_q((u))((t))`, §1.4 adds two tame cyclic factors to the integral
parameter direction and the convergent principal-unit part. When q=2
those tame factors are trivial, while the integral direction remains.

### Dependencies

The generic Milnor product, Steinberg relations, transfers, DVR localization
and curve reciprocity come from [K2], Layers 5 and 9–11. This layer supplies their
iteration along a higher field, the sequential quotient, principal-unit
filtrations, higher norm descent and the structure theorems. Structure and
reciprocity proofs can use the independent finite-length pairings below;
they must not assume the reciprocity isomorphism they are used to prove.

## Layer 2: Kato coefficients, residues and duality

### 2.1 Finite coefficient complexes

For a field E, `i≥0` and `n≥1`, define `ℤ/n(i)` on the imported étale
coefficient and derived carriers. If n is invertible in E, use
`μ_n^{⊗i}` in degree zero. In characteristic p write `n=mp^s`, `(m,p)=1`,
and use
`μ_m^{⊗i} ⊕ W_sΩ^i_{E,log}[−i]`.
Thus
`H^q(E,ℤ/p^s(i))=H^{q−i}_et(E,W_sΩ^i_log)`, with zero groups for `q<i`.
At i=0 the logarithmic sheaf is the constant `ℤ/p^s` sheaf.

**API.** `KatoCoefficients.complex` constructs the coefficient complex;
`KatoCoefficients.primeToChar` compares it with the ordinary Tate twist;
`KatoCoefficients.wildShift` gives the degree-shift identity;
`KatoCoefficients.coprimeSplit` gives the canonical coprime direct sum.

**Checks.**

- In characteristic p, `H^2(E,ℤ/p^s(1))` is `H^1` of log-Witt
  1-forms, not their `H^2`.
- At i=0, degree-one cohomology is Artin–Schreier–Witt character
  cohomology.
- For n=1 all groups vanish; when `p∤n` the Witt summand vanishes.

*Needs:* [PC], Layers 1 and 10, for continuous coefficients, [SF], SF.2's
field étale/Galois comparison and étale hypercohomology, and [CR], CR.4,
for the log-Witt sheaf. Sources: [DP], §2,
pp. 3–4; Kurihara, [Invitation], I §5.1, pp. 53–55.

### 2.2 Positive-degree Kato groups and transfers

For `q≥1`, set
`H_Kato^q(E)=colim_n H^q(E,ℤ/n(q−1))`, with the standard compatible
coefficient inclusions. In characteristic p its p-primary part is
`colim_s H^1_et(E,W_sΩ^{q−1}_log)`; away from p it is ordinary continuous
Galois cohomology with twist `q−1`. Prove the compatible primary
decomposition and that each class has finite order.

**API.** `KatoCohomology.finiteToTorsion` gives the coefficient-length
maps; `KatoCohomology.primary` identifies the primary summands;
`KatoCohomology.wild` identifies the logarithmic p-part;
`KatoCohomology.torsion` states elementwise torsion, without a uniform
bound on all orders.

**Checks.**

- For q=1 the wild p^s character group is `W_s(E)/(Frob−1)`, not
  `E×/(E×)^{p^s}`.
- For q=2 retain the wild Brauer classes.
- For a finite field, `H_Kato^1=ℚ/ℤ` and `H_Kato^q=0` for `q>1`.

For finite separable `L/E`, construct restriction and corestriction with
transitivity, the cup-product projection formula and
`cor∘res=[L:E]`. Restriction on 2-primary groups is therefore injective
when `[L:E]` is odd. Purely inseparable base change uses étale invariance
and a separately checked transfer normalization; it is not an application
of the separable extension construction.

Identify `H^1(E,ℤ/n(0))` with continuous `G_E` characters to `ℤ/n`, and
`H^2(E,ℤ/n(1))` with `Br(E)[n]`, including the wild case. On colimits
these become `Hom_cont(G_E,ℚ/ℤ)` and `Br(E)`.

**Checks.** A quadratic extension does not satisfy the odd-degree condition.
In dimension one the degree-two invariant is the Brauer invariant; it is
not the invariant of a degree-one character.

*Needs:* §2.1, finite étale transfers, the logarithmic coefficient transfer
contract and [CFT], Layer 5, for the one-local Brauer carrier. Sources:
[Invitation], I §5.1, pp. 53–55, Kato's existence paper, p. 166;
[DP], §2, pp. 3–4; [Jannsen], proof of Theorem 2.10, pp. 24–25.

### 2.3 Residues and higher invariants

For a henselian DVR E with residue k and `m` prime to `char k`, define
`∂:H^q(E,ℤ/m(i))→H^{q−1}(k,ℤ/m(i−1))` through tame inertia.
Normalize it by `∂(inf(a)∪(π))=a`. For Kato torsion coefficients the
unramified splitting, with summands `i_k^E` and `i_k^E(−)∪π`, is an
isomorphism away from p. At p it identifies the kernel of restriction to
the maximal unramified extension; it does not split all wild classes in
every degree.

For an n-local field, the top-degree specialization gives
`inv_F:H_Kato^{n+1}(F) ≃ ℚ/ℤ`, with
`inv_F cor_{L/F}=inv_L` and
`inv_L res_{L/F}=[L:F]inv_F`.
The all-prime assertion requires Kato's wild top-degree theorem, including
its p-rank and conductor arguments. Its proof uses finite conductor
filtrations, Cartier pairings on the associated differential quotients and
additive ind/pro duality; these are mathematical targets of this invariant
and character-duality construction, beyond the tame inertia computation. Tame inertia alone proves only the
admissible prime-to-residue-characteristic case.

**Checks.** At n=1 the map is `Br(F)≃ℚ/ℤ`. At n=2 it acts on
`H_Kato^3`, not on `H_Kato^2`. The parameter cup product in §2.8 has
positive invariant `1/m` under arithmetic Frobenius.

*Needs:* §2.2, [SF], Layers 2 and 5, the trace/duality and admissible
purity extensions specified under Exact supplier contracts, and the one-local invariant.
Sources: [Invitation], I §5.1, theorem and corollary, pp. 55–56, §5.2,
p. 56; [Milne], I §2, Theorem 2.17 and Lemma 2.18, pp. 38–39.

### 2.4 Dimensions and prime ranges

For `n≥1` and a prime `ℓ≠char F_1`, prove ordinary `cd_ℓ(F)=n+1` and
the trace `H^{n+1}(F,ℚ_ℓ/ℤ_ℓ(n))≃ℚ_ℓ/ℤ_ℓ` by residue induction.
Here `F_1` is the **bottom one-local field**. In characteristic p,
ordinary `cd_p(F)≤1`; nevertheless `H_Kato^{n+1}(F)` is nonzero and
`H_Kato^q(F)=0` for `q>n+1`. Prove that last vanishing with the
logarithmic coefficient and p-rank theorem, without equating the two
dimension notions.

**Check.** For `ℚ_p((t))` the bottom field is `ℚ_p`, so ℓ=p belongs to
the ordinary duality range. For `ℚ_p{{t}}`, the bottom field has
characteristic p; the tame induction does not cover ℓ=p.

Also let k be a number field and v a finite or complex place. At a finite
place use its henselian algebraic constant field k_v; at a complex place
use the algebraically closed constant field. For a finitely generated
`L/k_v` of transcendence degree r, prove `cd_2(L)≤r+2`; at a complex
place improve this to `≤r`. Consequently, if `E/k` has Kronecker
dimension d, its constant-place compositum has `cd_2≤d+1`. No real
place satisfies this nonreal estimate.

**Check.** For `E=ℚ(t)` and d=2 the finite-place compositum has
`cd_2≤3`. This does not give the same finite bound for the formally
real field E itself.

*Needs:* §2.1–§2.3, the field/cohomology and p-rank interfaces, and
§6.6's constant-place construction. Sources: [Milne], I §2,
Theorem 2.17, Lemma 2.18 and Corollary 2.19, pp. 38–40;
[Invitation], Kato existence, Theorem 2, p. 166; [DP], §2, pp. 3–5,
Proposition 3.2, p. 7, for the local-constant bound.

### 2.5 The logarithmic coefficient contract

Import [CR], Layer 4's ordinary and relative de Rham–Witt complexes,
restriction, Frobenius, Verschiebung and logarithmic dlog subgroups. The
needed field interface comprises the finite-length Cartier exact sequence,
traces, residues and their coefficient-change identities. For mixed
characteristic, require a logarithmic differential comparison for
imperfect residue fields as an extension of [KLF], Layer 5. That layer's
perfect-residue, odd-p calculations do not establish this larger scope.

**Check.** The outer residue of `F_p((u))((t))` is imperfect. Applying a
perfect-residue DVR calculation to it fails the field hypothesis.

*Needs:* [CR], Layer 4 and the additional field-level exactness/transfer
contract just stated; the mixed-characteristic extension of [KLF],
Layer 5. Sources: [Invitation], I §5.1, pp. 53–55, §6.4.3, p. 66,
Kato existence §5, pp. 191–194.

### 2.6 Imported symbol theorems and their comparison squares

For m invertible in E import
`K_i^M(E)/m ≃ H^i(E,μ_m^{⊗i})` from [MEK], §6.6. In
characteristic p the separate Bloch–Gabber–Kato theorem gives
`K_i^M(E)/p^s ≃ W_sΩ^i_{E,log}` by
`{a_1,…,a_i}↦dlog[a_1]∧⋯∧dlog[a_i]`.
The logarithmic differential carrier does not itself prove this theorem.
Import this full field theorem from [MEK], §§7.4–7.5, including imperfect
fields and all primes. The Witt target means `H⁰_et(E,W_sΩ^i_log)`;
it is independently constructed by [CR], CR.4.8, rather than defined
to be the symbol image. [KLF]'s explicit mixed-DVR calculations have
different hypotheses and are not used to prove this field theorem.

This layer adds the comparison squares through §1.6's separated topological
quotient and the chosen tower residues, with the higher invariant's
normalization. Products and finite transfers use the supplied generic maps.
Generic symbol isomorphisms retain their own owners. A wild residue square
needs logarithmic purity, not the prime-to-characteristic Kummer sequence.

**Check.** In degree one, dlog has kernel `(E×)^{p^s}`. Ordinary
`μ_{p^s}` as a Galois module in characteristic p would erase the wild
symbol groups.

*Needs:* [K2], Layers 5 and 9–11; [MEK], §6.6 and §§7.4–7.6;
§2.5 for the additional trace, residue and mixed-DVR comparisons. Source: Izhboldin,
[Invitation], I §2.4, Theorem 5 and the finite-length extension, p. 25;
I §5.1, p. 55.

### 2.7 Two distinct duality statements

For a finite ℓ-primary continuous `G_F`-module M, `n≥1` and
`ℓ≠char F_1`, put `M^∨=Hom(M,ℚ_ℓ/ℤ_ℓ)`. Cup product and the
higher trace give a perfect pairing of **finite** groups
`H^r(F,M^∨(n)) × H^{n+1−r}(F,M) → ℚ_ℓ/ℤ_ℓ`.
State the vanishing outside `0≤r≤n+1` and the functoriality of the
pairing under restriction/corestriction.

In all characteristics, separately prove Kato's identification of
`H_Kato^r(F)`, `1≤r≤n+1`, with the finite-order categorically continuous
characters of `K_{n+1−r}^M(F)`. Use §0.15's categorical notion of
continuity. This second statement does not make wild finite-exponent
cohomology groups finite or identify their topology with an unspecified
Pontryagin topology. For its proof construct the exact ind/pro additive
duality with surjective pro-transitions, injective ind-transitions and
bicartesian transition squares; identify differential conductor quotients
with the dual Milnor unit quotients by Cartier. Establish the order-p
character theorem first, then lift finite orders. In characteristic
unequal to p, Kato's Proposition 7 identifies p-divisibility of a
cohomology class with vanishing of its product with a chosen primitive
p-th root; prime-to-p cyclotomic descent transfers that lifting criterion.
In characteristic p use the p-divisibility of the torsion Kato groups.

**Check.** `H^1(F_p((u))((t)),ℤ/p)` is infinite, as witnessed by
Artin–Schreier classes with unbounded pole orders prime to p. An
unrestricted finite-group duality assertion would fail here.

*Needs:* §2.3–§2.6, §0.15, [PC], Layers 10 and 12's transfer and cup
formalism, and [CFT], Layer 5's ordinary local Tate duality.
Sources: [Milne], I §2, Theorem 2.17 and proof, pp. 38–39;
[Invitation], Kato existence, Theorem 2, p. 166, §2, pp. 172–173,
§5, pp. 191–194.

### 2.8 Trace and residue computation

Let `F=F_q((u))((t))`, `m` prime to p, and χ an unramified character
with `χ(Frob_q)=1/m`. Then
`inv_F(χ∪(u)∪(t))=1/m`.
For the order-p additive pairing use
`Tr_{F_q/F_p} res_u res_t(w du/u∧dt/t)`; a constant `w∈F_q` gives
`Tr(w)`. Swapping u and t negates the additive value and inverts a
multiplicative symbol. These are the sign calibrations for Layers 3–4.

*Needs:* §1.1, §2.3 and the residue/trace coefficient interface.
Sources: [Invitation], I §5.2, p. 56, §6.4.3, p. 66.

### Examples

For `F_q((u))((t))`, §2.8 computes the prime-to-p trace as `1/m` and
the length-one wild pairing as `Tr(w)`. Taking m=1 gives the zero
finite-coefficient class. Taking a length-one Artin–Schreier coboundary
gives zero trace, whereas pole classes show that the wild character
group need not be finite. The examples `ℚ_p((t))` and `ℚ_p{{t}}`
in §2.4 distinguish the bottom one-local characteristic condition.

### Dependencies

The new mathematics is the shifted finite coefficient assembly, the
higher invariant and duality, and the residue/transfer comparisons.
Derived categories, étale sites, log-Witt carriers, generic norm-residue
theorems and one-local Brauer invariants are supplied by the contracts
above. Wild top-degree and imperfect-residue theorems remain explicit
mathematical inputs; none follows merely from having named its carrier.

## Layer 3: Higher local reciprocity

### 3.1 The arithmetic Artin map

For a finite-end n-local F, construct
`Art_F:K_n^M(F)→G_F^ab` by requiring, for every finite-order continuous
character χ,
`χ(Art_F(x))=inv_F(χ∪h_n(x))`.
The symbol h_n uses ordinary or logarithmic coefficients as appropriate.
Construct the profinite target from all finite character evaluations and
prove that these evaluations determine the map. Norm on Milnor groups
corresponds to restriction on Galois groups; restriction on Milnor groups
corresponds to Galois transfer. The outer residue square commutes with
restriction to the unramified residue extension.

**API.** `HigherReciprocity.artin` is the homomorphism;
`HigherReciprocity.evaluate` gives its character formula;
`HigherReciprocity.norm` gives the norm/restriction square;
`HigherReciprocity.residue` gives the outer residue square. Also provide
the restriction/transfer square, with specified separable closures.

**Checks.**

- At n=0 the source is ℤ and `Art_{F_q}(1)=Frob_q`.
- On `F_q((u))((t))`, `{u,t}` acts as arithmetic Frobenius on final
  constant extensions; in dimension one an outer uniformizer does so.
- A principal-unit symbol has δ=0 and acts trivially on the purely
  unramified constant extension.

*Needs:* §1.1–§1.3, §2.2–§2.7, [PC]'s character/transfer interface and
[PA]'s profinite abelianization. The ordinary one-local map is imported
from [CFT], Layer 7 and [FFA], FA.4; equality with it is §7.1.
Sources: Kurihara, [Invitation], I §5.2, pp. 56–57; [Morrow],
Theorem 5.8, pp. 34–35.

### 3.2 Finite norm quotients

For a finite abelian `L/F` in the chosen separable closure, prove that Art
induces
`K_n^M(F)/N_{L/F}K_n^M(L) ≃ Gal(L/F)`.
After §1.2's norm descent the same statement holds with topological Milnor
groups. Thus the norm index is `[L:F]`. An arbitrary non-Galois extension
does not acquire a Galois group from this statement. Any extension to a
finite nonabelian Galois group must explicitly use its abelianization.

**Check.** A constant extension of final degree d gives `ℤ/d` on the
valuation factor.

*Needs:* §3.1 and Kato's higher local norm theorem, or an independent
explicit construction below together with its comparison. Sources:
[Invitation], I §5.2, isomorphism theorem, p. 57, §10.4, Theorem 2,
p. 99; [Morrow], Theorem 5.8(i), p. 34.

### 3.3 Equal-characteristic construction

In characteristic p construct the wild p^s component from
`K_n^top(F)/p^s × W_s(F)/(Frob−1) → ℤ/p^s`.
Glue its compatible finite-length characters with the prime-to-p tame
component and the integral valuation component. Prove agreement with
§3.1 by evaluating on all finite characters. The n=1 Schmid–Witt and
arithmetic Artin comparison is [FFA], FA.4's result; this target adds the
n-fold residue induction and its signs.

**Check.** The one-local specialization agrees with FA.4 on the
p-primary part as well as on unramified characters.

*Needs:* §1.4, §2.6, §4.1 and §4.5's independently constructed pairings.
Source: Parshin, [Invitation], I §§7.3–7.5, pp. 77–79.

### 3.4 Artin–Schreier trees and the inverse norm class

A finite Galois p-extension `L/F` is an **Artin–Schreier tree** if it has
a tower `F=E_0⊂⋯⊂E_r=L`, each `E_i/E_{i−1}` cyclic of degree p, with
`E_i=E_{i−1}(α_i)` and `α_i^p−α_i∈E_{i−1}`. It is **strong** when
every cyclic degree-p subextension `M/E` inside `L/F` has a presentation
`M=E(α)`, `α^p−α∈E`. This is meaningful in characteristic zero; there
it is a polynomial presentation condition, not the characteristic-p
Artin–Schreier exact sequence. No extra valuation bound belongs in the
definition.

For finite abelian `L/F` and `σ∈Gal(L/F)`, choose an admissible lift
`σ̃∈Gal(L^pur/F)` whose restriction to `F^pur` is a positive integral
power of arithmetic Frobenius. The fixed field Σ of the closed subgroup
generated by σ̃ is finite over F.
Construct the class
`N_{Σ/F}{t_1,…,t_n} mod N_{L/F}K_n^top(L)`,
using parameters of Σ. Prove that `LΣ/Σ` is purely unramified. Its norm
contains the kernel of the terminal degree map δ, so differences between
parameter symbols of Σ are norms from `LΣ`. Transitivity of norms sends
these differences into `N_{L/F}K_n^top(L)`. Show independence of the lift
and of those parameters **in the norm quotient**, then show that it is
inverse to Art.

The strong-tree proof uses the exact principal-unit sequence over the
purely unramified extension, the difference `σΠ−Π` of a prime element,
and a Frobenius difference to build the reverse homomorphism. For a
totally ramified finite Galois p-extension, reduce after a totally ramified
p-extension `Q/F` so that `LQ/Q` is strong and
`L^pur∩Q^pur=F^pur`. Prove descent and choice independence before
passing to a general abelian quotient. The cohomological route of §3.1–§3.2
can supply the all-prime theorem where a particular explicit formula does
not cover p=2.

**API.** `ASTree.tower` supplies the tower witnesses; `ASTree.strong`
expresses the universal degree-p condition;
`ASReciprocity.frobeniusLift` supplies the admissible lift;
`ASReciprocity.normClass` constructs the quotient class;
`ASReciprocity.independent` proves choice independence;
`ASReciprocity.inverse` states the inverse reciprocity theorem.

**Checks.**

- For `L=F` the quotient class is zero.
- In a purely unramified degree-d extension, Frobenius corresponds to
  the parameter symbol and its valuation class modulo d.
- Replacing a parameter of the auxiliary field Σ by its product with a
  rank principal unit leaves the displayed norm class unchanged, by the
  purely unramified norm theorem over Σ.
- This is not independence for arbitrary parameter symbols of F. For
  `F=F_p((t))` and `L=F(β)`, `β^p−β=t^(−1)`, the Artin–Schreier
  pairing of `1+t` with `t^(−1)` is
  `res(t^(−1)dt/(1+t))=1∈F_p`. Thus `1+t` is not a norm, and the
  classes of t and `t(1+t)` in `F×/N(L×)` differ.

*Needs:* §0.2, §1.2–§1.6, the strong-tree reduction theorem and the exact
principal-unit sequence. Sources: Fesenko, [Invitation], I §10.1, p. 96,
§§10.3–10.4, pp. 97–99, especially Proposition 1, Proposition 2 and
Theorem 2 on p. 99; [Morrow], Remark 5.11, pp. 36–37. The strong-tree
definition uses the extension `M/E` in that direction; reversing it would
make the generator condition meaningless.

### 3.5 Existence with the correct openness

Finite abelian subextensions of a fixed separable closure correspond to
finite-index **categorically open** subgroups of `K_n^M(F)` by
`L↦N_{L/F}K_n^M(L)`. Prove the reverse inclusion order, the degree/index
formula and the compositum/intersection rule. Use §0.15's exact
finite-quotient criterion. A formulation in terms of λ_n-open subgroups
of `K_n^top` additionally needs the categorical/sequential comparison.

**Check.** At n=1 this recovers both [CFT], Layer 8's ordinary existence
and [FFA], FA.4's full equal-characteristic p-primary norm correspondence.

*Needs:* §3.2, §0.15 and Kato's existence argument, including its wild
finite-order character theorem. Sources: Kato, [Invitation], existence
paper, Theorem 1, p. 165, proof §§3–5, pp. 174–194; Fesenko,
I §10.5, unnumbered Existence Theorem, p. 100. The numbered Theorem 3
there is the residue square, rather than the existence theorem.

### 3.6 Kernel, density and completion

Art has dense image and kernel equal to the intersection of all finite
abelian norm subgroups. Take the inverse limit over those finite norm
quotients, equivalently over categorically open finite-index quotients
after existence. Prove that this completion is canonically `G_F^ab`.
Do not replace the specified system by every abstract finite-index
subgroup. When the categorical/λ_n comparison and the divisible-kernel
theorem apply, identify the absolute algebraic kernel with Λ_n and obtain
an injective dense map `K_n^top(F)→G_F^ab`.

**API.** `HigherReciprocity.completion` specifies the inverse system;
`HigherReciprocity.completionEquiv` is its Galois equivalence;
`HigherReciprocity.kernel` identifies the absolute intersection;
`HigherReciprocity.dense` proves density.

**Checks.**

- On the purely unramified component this is `ℤ→ℤ̂`, already for n=0;
  density is not surjectivity.
- The kernel of projection to `Gal(L/F)` is its norm subgroup. It can
  be larger than the kernel of the absolute Artin map.
- A parameter symbol with δ=1 is nonzero in every constant quotient of
  degree greater than one, and is outside the absolute kernel.

*Needs:* §3.2, §3.5, §1.6 and the topology comparison in its stated
characteristic range. Sources: [Invitation], I §10.4, p. 99, §10.5,
Existence Theorem and Corollary 1, p. 100; [Morrow], Theorem 5.8 and
Remarks 5.10–5.11, pp. 34–37. The injective map's absolute target is
`Gal(F^ab/F)`; a finite target cannot receive it injectively in general.

### 3.7 Constant unramified extensions

For an extension unramified through the entire tower with final-residue
degree d, compute
`Art_F(x)|_L=Frob_q^{δ_F(x)}` and the quotient `ℤ/d`.
On `F_q((u))((t))`, `{u,t}` gives Frobenius and `{t,u}` its inverse.
A principal outer-unit symbol acts trivially on this extension. It need
not act trivially on every extension unramified only at the outer DVR:
the latter can retain lower ramification.

*Needs:* §1.5 and repeated §3.1 residue squares. Source: [Morrow],
Theorem 5.8(ii)–(iii), pp. 34–35.

### Examples

For a final constant extension of degree d of `F_q((u))((t))`,
the class of `{u,t}` maps to `1∈ℤ/d` and `{t,u}` to −1.
For d=1 the quotient is zero. Passing over all positive d produces
`ℤ→ℤ̂` on this direction; it does not turn the uncompleted Milnor
group into its profinite completion. These are §3.2, §3.6 and
§3.7's finite, absolute and completed cases on one common example.

### Dependencies

There are cohomological and explicit routes to the local theorem. Their
common output is the finite norm quotient and the arithmetic normalization.
Finite-length nondegenerate pairings may be proved independently and used
to construct reciprocity; comparison with Art is then an additional theorem.
The existence theorem uses categorical finite-quotient continuity until a
specific topology comparison has been proved.

## Layer 4: Explicit symbols and higher ramification

### 4.1 Tame and Hilbert symbols

The unreduced higher tame symbol is
`δ_F:K_{n+1}^M(F)→F_q×`.
For `m|(q−1)` define the arithmetic tame pairing on
`K_n^M(F)/m × F×/(F×)^m` by
`Teich(δ_F{a,x})^{(q−1)/m}`. The entry a is **prepended** to the n
entries of x. Teichmüller lift identifies the final residue roots with
`μ_m(F)`; the unreduced symbol itself has no division by m.

**API.** `HigherTame.symbol` is the unreduced boundary;
`HigherTame.arithmeticPairing` is the reduced pairing;
`HigherTame.parameters` computes it on a parameter symbol;
`HigherTame.normAdjunction` states the norm/restriction identity.

**Checks.**

- In dimension one, with `x={π}` and a unit a, the value is
  `ā^{(q−1)/m}` lifted to `μ_m`. Writing `{π,a}` instead inverts it.
- On a two-local field, `δ{a,u,t}=a` and `δ{a,t,u}=a^{-1}`.
- A defined Steinberg symbol `{b,1−b,…}` has tame value 1.

For any m invertible in F with `μ_m⊂F`, define the higher Hilbert symbol
`(x,a)_m=Art_F(x)(α)/α`, where `α^m=a`.
Prove independence of α, bilinearity, descent modulo m, coefficient
changes and norm/restriction compatibility. Identify its prime-to-p tame
formula with the pairing above. In characteristic p, p-power character
pairings are additive Witt pairings instead.

**API.** `HigherHilbert.pairing` constructs the pairing;
`HigherHilbert.rootIndependent` removes the root choice;
`HigherHilbert.norm` is norm adjunction;
`HigherHilbert.tameFormula` is the normalized tame formula.

**Checks.**

- If `a=b^m`, the value is 1 for every x.
- If x is an m-multiple, the value is 1 for every a.
- The parameter symbol acts by arithmetic Frobenius on a constant
  unramified extension. This fixes the inverse ambiguity; in dimension
  one the result equals the imported ordinary Hilbert symbol.

*Needs:* §1.1, §2.8, §3.1 and [KLF], Layer 3's ordinary Hilbert symbol.
Sources: [Invitation], I §6.4.2, p. 65, §8.2.1, p. 83, concluding
remark, p. 87. The one-local formulas of §8.1, p. 81 are not by
themselves a higher-dimensional construction.

### 4.2 Vostokov's mixed-characteristic formula

Let F have characteristic zero, first residue characteristic `p>2` and
`μ_{p^s}⊂F`. In a standard parameter presentation lift each a_j to a
permitted multiseries over `Frac W(F_q)`. Let Δ act by Witt Frobenius on
coefficients and `T_i↦T_i^p`, put
`l(a)=p^{-1}log(a^p/a^Δ)` and
`S=ζ̃_{p^s}^{p^s}−1`. Here S is a nonzero formal multiseries in
the lift ring, although its parameter evaluation in F is zero. Division
by S and its expansion occur in that lift ring, before residue and
trace; dividing by the evaluated zero in F is not defined. Form the n-form

```text
Φ(a_1,…,a_{n+1}) =
  Σ_{i=1}^{n+1} (-1)^{n−i+1} p^{−(n−i+1)} l(a_i)
    dlog a_1 ∧ … ∧ dlog a_{i−1}
    ∧ dlog a_{i+1}^Δ ∧ … ∧ dlog a_{n+1}^Δ.
```

Prove that the exponent `Tr res(Φ/S)` is defined modulo p^s and that
`ζ_{p^s}^{Tr res(Φ/S)}` is independent of permitted lifts. It is a
multilinear Steinberg pairing, sequentially continuous and nondegenerate
on `K_n^top(F)/p^s × F×/(F×)^{p^s}`. Prove the finite-annihilator
statement: an open finite-index subgroup containing `p^sK_n^top` is the
orthogonal complement of a subgroup of `F×/(F×)^{p^s}`.

Comparison with §4.1's arithmetic Hilbert symbol requires an explicit
normalization theorem. The cited comparison only determines a sign.
Fix the root of unity, residue order and Frobenius convention and decide
whether the displayed expression or its inverse agrees with Art.
No p=2 expression is asserted by this formula; the all-prime cohomological
route remains available.

**Checks.**

- A p^s-th power in any entry gives value 1.
- A Steinberg pair `b,1−b` among the entries gives 1.
- For the source's Shafarevich generator `ω(a)=E(aS)` evaluated at
  the parameters, with the trace of a equal to 1 modulo p^s, the
  parameter symbol pairs with ω(a) to give `ζ_{p^s}`. This detects
  nondegeneracy and distinguishes the formula from its inverse.
  Comparing this generator test with arithmetic Art still requires
  the normalization theorem.

*Needs:* §0.4–§0.5, Witt Frobenius and mixed expansions, differential
residue/trace, §1.3 and an independent explicit-symbol proof. Source:
Vostokov, [Invitation], I §8.3, Theorems 1–2, pp. 85–87, and the
comparison remark on p. 87.

### 4.3 Constant and ferocious ramification

For a complete DVR with residue p-rank one, choose a constant subfield.
Separate inertia, the maximal almost-constant subextension and the
ferocious part. Use ordered labels `−1,0,(c,s),(i,r)`; in dimension two
adjoin pairs `(a,b)∈ℚ²`, `b>0`, ordered by the outer coordinate with
`(i,b)<(a,b)<(a',b)<(i,b')` for `a<a'`, `b<b'`.
Constant labels initially have integral indices and need a consistent
rational interpolation for the formulas below.

After constant extension makes the relevant field standard and its
remaining extension ferocious, define
`G_(i,r)={σ:v(σt−t)>r}` for a lift t of a non-pth-power residue.
For the rank-two refinement use
`v(t^{-1}σ(t)−1)>(a,b)`.
Prove independence of the auxiliary standardization. The constant part
of Φ is `(1/e(L/K))∫_0^s |Gal(L_c/K)_(c,t)|dt`; the ferocious part
is `∫_0^r |Gal(L/K)_(i,t)|dt`, with no ramification divisor. Extend
to the rank-two Herbrand function, prove monotonicity and bijectivity,
and define upper groups through `Ψ=Φ^{-1}`. Establish subgroup and
upper-quotient compatibility. In characteristic p this construction can
depend on the chosen constant field.

For characteristic-p two-local fields over a quasi-finite end field,
let `Q_α` be generated by `{π_k,u}` with `v(u−1)>α`, and set
`S_α=Cl ⋃_{r≥0}{x:p^r x∈Q_{p^rα}}`.
Here Cl is the intersection of open subgroups containing the subgroup.
Extend S to the other labels using constant symbols, norms from
standardizations and the specified closures. In each finite abelian
quotient, Art sends its α-term onto `G^α`. Prove the norm/index formulas
as well as choice independence; an ordinary outer-unit filtration is
not this refined filtration.

**API.** `HigherRamification.lower` gives the labeled lower groups;
`HigherRamification.herbrand` gives Φ, Ψ and their normalizations;
`HigherRamification.upperQuotient` gives upper quotient compatibility;
`HigherRamification.milnorImage` identifies the refined Milnor image.

**Checks.** On `F_p((u))((t))` with constant field `F_p((t))` and
positive i prime to p:

- `β^p−β=t^{-i}` has break `(c,i)`, whereas `t^{-pi}u` has `(i,i)`.
- The equations with `t^{-i}u` and `t^{-i}u^p` have breaks `(i,i/p)`
  and `(i,i/p²)` respectively.
- If `v(σt−t)=r_0>0`, σ is excluded at `(i,r_0)` and included for
  `0<r<r_0`. Replacing the strict inequality by `≥` fails this test.

*Needs:* [LFR], Layer 3, §0.5's Epp standardization, §1.4 and §3.2.
Source: Zhukov, [Invitation], I §§17.1–17.4, pp. 143–150, especially
the defining formulas on pp. 145–148 and Theorems 1–2 on p. 149.
This is a scoped two-dimensional refinement, not an all-dimensional
numerical ramification theorem. Rational interpolation and endpoint
conventions must be fixed before applying the integral formulas.

### 4.4 Kurihara exponentials

For a mixed-characteristic complete DVR field E, `q≥1` and
`ord_p(η)>2/(p−1)`, construct
`exp_η^q:Ω̂_{O_E}^{q−1}→K̂_q^M(E)`.
Hats mean p-adic completion. On logarithmic generators with `a∈O_E`
and `b_j∈O_E×`, send
`a dlog b_1∧⋯∧dlog b_{q−1}` to
`{exp(ηa),b_1,…,b_{q−1}}`.
The residue field can be imperfect. The extension to nonunit differential
generators needs its own justified formula. Do not assert a general
kernel computation.

For `E{{T}}`, prove that the completed differential T-residue and Kato's
completed Milnor T-residue commute with exp. The latter has
`∂{a,T}=a`; T is an outer unit, so this is not its outer DVR boundary.

**API.** `KuriharaExponential.map` is the homomorphism;
`KuriharaExponential.logGenerator` gives its value on logarithmic
generators; `KuriharaExponential.residue` gives the residue square;
`KuriharaExponential.continuous` gives p-adic continuity.

**Checks.**

- For q=1 the domain is `Ω̂^0=Ô_E`, and `a↦exp(ηa)` sends zero to
  the neutral unit; a nonzero sufficiently small a can have nontrivial
  image.
- For q=2 on `E{{T}}`, `a dlog T` gives `{exp(ηa),T}` and T-residue
  `exp(ηa)`.
- A proposed domain `Ω̂^q` fails the q=1 degree check. The theorem's
  strict η bound cannot be dropped.

*Needs:* completed absolute differentials, p-adic exponential and
completed Milnor groups from [KLF]'s one-local interface, extended to
the stated imperfect-residue scope. Source: Kurihara, [Invitation],
I §9.1, pp. 91–92, §9.2, p. 93. The domain is degree q−1, as the
generator formula and the residue diagram require.

### 4.5 Artin–Schreier–Witt computation

For a characteristic-p n-local F with final field `F_q` and `s≥1`,
construct the pairing by the lifted de Rham–Witt expression
`[x,w]_s=Tr_{W_s(F_q)/W_s(F_p)} res(w dlog x_1∧⋯∧dlog x_n)`.
Interpret both the product and residue in the lifted Witt complex, not
by naïve coefficientwise Witt-vector multiplication. Prove descent to
`K_n^top(F)/p^s × W_s(F)/(Frob−1)` and compatibility with
restriction/Verschiebung and norm/trace. At s=1 it is the ordinary
iterated differential residue followed by the finite-field trace.

**API.** `HigherWittPairing.pair` constructs it;
`HigherWittPairing.frobeniusQuotient` gives the descent;
`HigherWittPairing.coefficientChange` gives restriction/Verschiebung
compatibility; `HigherWittPairing.normTrace` gives norm adjunction.

**Checks.**

- At length one, `w=b^p−b` pairs to zero with every symbol.
- `[{u,t},c]_1=Tr(c)` on `F_q((u))((t))`; reversing u,t negates it.
  If `Tr(c)=1`, the value is 1.
- Over `F_p((u))((t))`, `w=t^{-1}` and `{u,1+t}` give residue 1
  from `t^{-1}(du/u)∧dt/(1+t)`. This wild class must be detected.

*Needs:* §1.3, §2.5–§2.6 and the lifted residue/trace construction.
Sources: [Invitation], I §6.4.3, p. 66, §7.3, p. 77.

### Examples

The length-one computation of §4.5 detects `t⁻¹` with `{u,1+t}`
and returns 1 over `F_p`. The characteristic-p ramification examples
of §4.3 distinguish constant from ferocious breaks and pin the strict
endpoint convention. In mixed characteristic, §4.4's q=1 exponential
acts on scalars, and its q=2 completed T-residue returns the scalar
exponential. None of these computations extends the odd-p Vostokov
formula to p=2.

### Dependencies

Use ordinary Hilbert symbols, differential and Witt carriers, and ordinary
ramification from their suppliers. The new targets are the n-fold
formulas, their arithmetic sign comparisons and Zhukov's refined
filtration. The odd-p Vostokov expression never substitutes for an
all-prime wild existence proof.

## Layer 5: Flags, adeles and Milnor idele class groups

### 5.1 Parshin chains and local products

Let X be excellent and integral, with a nonnegative dimension function d;
write `d_min=min_x d(x)`. A Parshin chain `P=(p_0,…,p_s)` satisfies
`p_i∈closure{p_{i+1}}` and `d(p_i)=d_min+i`. For `U=X\D`, a relative
chain has `p_i∈D` for `i<s` and `p_s∈U`. Begin with the henselization
of `O_{X,p_0}`. At the next point localize at **every** prime over p_1,
henselize each local ring, and continue. The residue product `k_h(P)`
retains all branches.

Separately construct completed factors by alternating completion and
semilocal localization. For a length-s complete flag on a reduced,
excellent, finite-dimensional scheme, the factors have s successive
complete discrete valuations and s-th residue a finite extension of
κ(p_0). If κ(p_0) is finite, these are s-local fields in our finite-end
convention. In particular this applies to complete flags ending at closed
points of schemes of finite type over ℤ. For schemes only essentially
of finite type, retain the finite κ(p_0) hypothesis explicitly.
Prove the regular-chain case first, then retain all radical equiheighted
branches under completion and localization. Henselian factors are not
identified as fields with their completions.

**API.** `ParshinChain.points` supplies the dimension-controlled tuple;
`ParshinChain.henselianFactors` gives the recursive residue product;
`ParshinChain.completedFactors` gives the completed product;
`ParshinChain.reverse` changes to the generic-first Beilinson convention.

**Checks.**

- A smooth surface flag `(x,y,η)` has dimensions `(0,1,2)` in this
  special-first convention.
- A node with two normalization branches contributes both factors.
  Choosing only one prime loses a component.
- On a curve, the henselian fraction field and the fraction field of
  the completed DVR are the two corresponding constructions.
- `Spec ℚ` is essentially of finite type over ℤ and its length-zero
  factor is ℚ, which is not a zero-local field. Essential finite type
  alone cannot replace the finite terminal-residue hypothesis.

*Needs:* [SF], Layers 0, 2 and 5, for excellence, normalization,
henselization, completions and specialization; §0.1 for the completed
towers. Sources: [Kerz], §3, Definitions 3.1–3.2, pp. 4–5;
[Morrow], §6, Theorem 6.7 and Corollary 6.8, pp. 37–43, §7.1,
Theorem 7.5, Corollary 7.6 and Remark 7.7, pp. 44–46.

### 5.2 Recursive higher adeles

For a Noetherian X, a quasi-coherent module M and a set T of
generic-first chains of length r, construct `A_X(T,M)` by recursion.
It commutes with filtered colimits in M. For coherent M and r=0 it is
`∏_{x∈T} M̂_x`. For coherent M and r>0 it is

```text
∏_{x∈X} lim_a A_X(_xT, (j_{a,x})_* (j_{a,x})^* M),
j_{a,x} : Spec(O_{X,x}/m_x^a) → X,
_xT = {ξ : (x,ξ)∈T}.
```

Set `A_X(∅,M)=0`. For noncoherent intermediate modules apply the
filtered-colimit rule through coherent submodules. Prove uniqueness and
exactness of the resulting functors, and the injection into
`∏_{ξ∈T}A_X({ξ},M)` whose image contains the direct sum. Its image is
the higher restricted product. Preserve the order of products, inverse
limits and coherent filtered colimits in this construction.

**API.** `HigherAdeles.functor` gives the exact recursive functor;
`HigherAdeles.singleton` identifies a singleton with its iterated
localization/completion factor; `HigherAdeles.productEmbedding` gives
the injective comparison; `HigherAdeles.filteredColimit` supplies the
colimit isomorphism; `HigherAdeles.face` supplies chain-deletion maps
and their identities. For `M=O_X`, include the induced ring structure
and the compatible tensor-product map for modules.

**Checks.**

- Empty T gives zero, rather than a product over every scheme point.
- For `X=Spec F`, the singleton factor of `M=F` is F.
- For a regular arithmetic curve, full-flag finite adeles are the
  ordinary restricted product relative to the integral rings. Add
  archimedean factors only through the number-field interface.
- On a surface, both the uniform divisor bound and the per-curve
  congruence restriction of §5.8 are necessary. A single cofinite-flag
  condition does not define this functor.

*Needs:* [SF], Layer 0's coherent/quasi-coherent and completion
interfaces, §5.1 and [RP] for the dimension-one comparison. Sources:
[Morrow], §8.1, rules A1–A4 and Remark 8.3, pp. 53–55, §8.2,
Lemma 8.4, Definition 8.5, Lemma 8.7, Proposition 8.9 and
Remark 8.11, pp. 55–58. The primary Beilinson/Huber exactness proof
is part of the construction's proof input.

### 5.3 The coherent adelic resolution

For a Noetherian scheme and quasi-coherent M, sheafify the reduced-chain
adelic functors on opens. Prove they are flasque and that the augmented
semi-cosimplicial sheaf resolves M. The differential is the alternating
sum of face maps, so its square vanishes through the face identities.
The resulting global adelic complex computes `H^r(X,M)`; for finite
dimension n it stops in degree n. Establish the stalk contracting
homotopy or the corresponding exactness argument, rather than deducing
resolution merely from flasqueness.

**Check.** On a curve the two-term complex
`A(0,M)⊕A(1,M)→A(01,M)` computes coherent cohomology. This is not
the étale Kato complex of Layer 6.

*Needs:* §5.2, [SF]'s sheaf cohomology and semi-cosimplicial formalism.
Source: [Morrow], Theorem 8.12 and Corollary 8.13, pp. 59–60,
with Beilinson's resolution and Huber's detailed proof as the primary
exactness input.

### 5.4 Flag residues and normalization sums

On each flag factor compose Milnor boundaries, and, in coefficient
ranges with the required purity theorem, cohomological boundaries.
At a singular specialization normalize the closure, take every branch
over the next point, and sum their residue/corestriction contributions.
The component from y to x is zero unless x specializes y with dimension
drop one. Prove finite support of the image of a given class. A map
from one branch field is not yet the reciprocity sum over branches.

**API.** `FlagResidue.milnor` gives the successive boundary;
`FlagResidue.normalization` expresses the branch sum with transfers;
`FlagResidue.finiteSupport` gives its direct-sum target;
`FlagResidue.symbolCompatibility` compares the Milnor and cohomological
boundaries in the admissible coefficient regimes.

**Checks.**

- A smooth `(u,t)` flag sends `{u,t}` to +1.
- Both preimages of a node contribute to the same residue-field
  target; neither is discarded.
- An unramified Milnor or cohomology class extending over an open has zero residue at each
  codimension-one point of that open.

*Needs:* §1.1–§1.2, §2.3, §5.1, [K2], Layers 9–11 and the arithmetic
niveau identification specified under Exact supplier contracts. Sources: [Kerz], §§3–5, pp. 4–7;
[Jannsen], §4, (4.3)–(4.4), pp. 41–42. Wild logarithmic residues
require their own purity comparison.

### 5.5 Milnor ideles and Q-chain relations

For a relative chain set on `U⊂X`, form
`I(U⊂X)=⊕_P K_{d(P)}^M(k_h(P))`.
Its neighborhoods are generated by direct sums over maximal chains
of canonical modulus subgroups. At such a chain they are generated by
`{1+a,u_2,…,u_d}`, with a in the prescribed outer ideal power and
every u_j an **integral unit**. Lower-dimensional summands are
discrete. This is a different convention from §1.4's arbitrary-field-unit
filtration. Comparing the two is a theorem, not a change in definition.

A Q-chain `(p_0,…,p_{s−2},p_s)` omits p_{s−1}. Its relation has two
types of components. Inserting a point of D gives the field inclusion
into the completed relative chain. Inserting a point of U gives a
Milnor residue into the shorter chain `(p_0,…,p_{s−1})`, lowering
degree by one. Define `C(U⊂X)=coker Q` with its quotient topology.
For effective D, define `I(X,D)` by first killing the maximal-chain
modulus subgroups, and `C(X,D)` by then imposing Q relations. Finally
set
`I(F;X)=lim_U I(U⊂X)` and `C(F;X)=lim_U C(U⊂X)` over nonempty
opens, with inverse-limit topologies. Prove that `I(F;X)→C(F;X)` has
dense image; surjectivity of this inverse-limit map is not assumed.

**API.** `HigherIdele.group` constructs the chain direct sum;
`HigherIdele.modulus` gives the canonical modulus subgroup and quotient;
`HigherClassGroup.quotient` gives the Q-chain cokernel;
`HigherClassGroup.functionField` gives the inverse-limit class group;
`HigherClassGroup.denseFromIdeles` proves the dense-image assertion.
Include the transition maps as U shrinks and D grows, and the
topological-quotient transition when U is regular.

**Checks.**

- On a regular curve the Q relations give principal ideles and the
  ordinary idele class group.
- An omitted point in U contributes by a residue of degree −1.
  Using inclusion for both types of inserted point has the wrong degree.
- The maximal-chain modulus requires integral-unit remaining entries.
  Replacing them with arbitrary field units changes the defining
  topology and cannot be done without a comparison.

*Needs:* §5.1, §5.4, generic Milnor groups of finite products and
relative rings, and the topological sum/quotient/limit interfaces.
Sources: [Kerz], Definition 4.2–4.3, p. 5, Definition 5.2, p. 6,
Definitions 6.1–6.3 and Lemma 6.4, pp. 7–8. These Milnor class
groups are not the units of the additive adele ring, and their canonical
modulus topology is not automatically λ_n.

### 5.6 Finite direct images

A finite morphism `f:X'→X` compatible with dimension functions and
carrying `U'` to U induces a continuous idele pushforward. When a
source chain is longer than the matching target prefix, apply the
necessary Milnor residues and then the finite norm. If chain points
do not match, the component is zero. For finite dominant f, prove that
the map respects Q relations, descends to class groups and is transitive.
State modulus pullback bounds for each map between modulus quotients.
The finite construction does not give pushforward for arbitrary
morphisms without further hypotheses.

**Check.** On a curve this is the ordinary idele norm; a constant-field
extension includes the residue-degree factor.

*Needs:* §1.2, §5.4–§5.5 and dimension/open-pair compatibility.
Source: [Kerz], §5, pp. 6–7, and §6, p. 7.

### 5.7 Nisnevich class-group comparison

Let X be integral, proper and flat over `O_K` for a number field K,
or over a finite field. Let D be an effective Cartier divisor and
`U=X\D` smooth over that base. Using the Nisnevich relative Milnor
sheaf, with modulus ideal I_D and `d=dim X`, prove
`H_Nis^d(X,K_d^M(O_X,I_D)) ≃ C(X,D)`.
Require compatibility with the maps from closed-point cycles. The
relative sheaf is the kernel of reduction to `O_X/I_D`, sheafified on
the Nisnevich site; ordinary quasi-coherent sheaf cohomology does not
supply it.

The proof first compares the punctured-spectrum local class groups
along lifted henselian chains, using the relative Milnor Gersten/purity
statement under the required smoothness conditions. Then compare the
two coniveau cokernels. Keep the modulus and the boundary branches
through both steps.

**Check.** For D=0, the closed-point cycle class agrees with the
unramified class-group map under the stated smoothness hypotheses.
There is no identification with `CH_0` without modulus in general.

*Needs:* §5.5–§5.6, [SF], Layer 2's Nisnevich infrastructure and
Layer 5's cycles, the relative Milnor sheaf and its local Gersten
comparison. Source: [Kerz], Theorem 8.2, pp. 11–13, Definition 8.3
and Theorem 8.4, pp. 13–14.

### 5.8 Curve and surface calculations

On a normal arithmetic curve identify the additive finite adele ring
with the ordinary restricted product, and independently identify the
Milnor idele class group with the ordinary class group. The two
comparisons have different carriers.

For an integral Noetherian surface normal in codimension one, write
`O_x=Ō_{X,x}`, `F_x=O_x⊗_{O_{X,x}}F`,
`O_y=Ō_{X,y}`, `F_y=Frac(O_y)` and let `O_{x,y}` be the completed
semilocal branch ring. Its total fraction ring `F_{x,y}` is the
branch product under the excellent reduced arithmetic hypotheses.
`F_x` is a localization ring and need not be a field. Describe all
seven adelic pieces:

- `A_0=F`, `A_1=∏_y O_y`, `A_2=∏_x O_x`.
- `A_01` is the usual restricted product of `F_y` relative to `O_y`.
- `A_02` consists of families in `F_x` with one effective divisor D
  bounding all poles, through `O_x⊗O_X(D)_x`.
- `A_12` consists of integral `O_{x,y}` families with, for each y and
  `r≥0`, `f_{x,y}∈O_x+p_{x,y}^r` for all but finitely many x on y.
- `A_012` consists of `F_{x,y}` families with one uniform effective
  divisor bound and the same per-curve condition for every integer r.

Here the congruences use the images of `O_x` in the semilocal factors,
and negative powers are fractional ideals. The uniform divisor and
per-curve congruences are independent restrictions. Identify the face
inclusions and their alternating signs in the surface adelic complex.

For a smooth flag on `ℙ²_{F_q}` at `(u,t)=(0,0)` through `(t=0)`,
the complete field is `F_q((u))((t))`. On the arithmetic surface
`ℙ¹_ℤ`, at `(p,t)`, the horizontal `(t=0)` flag gives `ℚ_p((t))`,
whereas the vertical `(p=0)` flag gives `ℚ_p{{t}}`.

*Needs:* §5.1–§5.3, §0.4 and [RP]'s curve interface. Sources:
[Morrow], Example 6.10, pp. 41–42, Proposition 8.16, p. 62,
Proposition 8.19 and proof, pp. 63–65.

### Examples

The seven surface pieces and the three smooth-flag fields in §5.8
give explicit tests of the recursive construction. At a nodal curve
point, §5.1 and §5.4 retain two normalization factors and sum their
transferred residues. On a curve, the additive restricted product
and the multiplicative Milnor class group recover two distinct
ordinary constructions; the latter uses principal Q-chain relations.

### Dependencies

Ordinary restricted products, generic Milnor residues/norms, scheme
local algebra and Nisnevich carriers are imported. This layer constructs
the recursive restriction conditions, all branch products and Q-chain
relations. Coherent adelic exactness and the Nisnevich relative Milnor
comparison are separate proof chains.

## Layer 6: Scheme reciprocity and cohomological Hasse principles

### 6.1 Local and global reciprocity relations

Prove the normalized branch-residue sum around a codimension-two point
is zero, with finite support and every normalization branch included.
Deduce that local Artin evaluations multiply to the identity on each
Q-chain relation. Check separately the boundary-insertion component and
the component obtained by residue into a shorter chain. For a proper
regular curve the Milnor relation is the imported Weil reciprocity law
`Σ_x N_{κ(x)/k}∂_x=0` from [K2], Layer 10.

The local codimension-two relation needs its own
normalization/localization reciprocity argument. Proper-curve
reciprocity alone is insufficient. Likewise, square zero for the
cohomological boundary is proved through its niveau identification in
§6.5, rather than inferred from the existence of individual residue maps.

**Check.** Omitting a branch at a singular point can destroy
cancellation. The complete normalization sum must occur in both the
Milnor relation and the Artin relation.

*Needs:* §3.1, §5.4–§5.5, [K2], Layer 10's proper-curve theorem and the
local codimension-two reciprocity theorem. Sources: [Kerz], §9,
p. 14, invoking Kato's residue reciprocity, Proposition 7;
[Jannsen], §4, pp. 41–43 for the distinction from a cohomological
complex differential.

### 6.2 Reciprocity on arithmetic schemes

Let X be integral and proper over ℤ, with function field F. In
characteristic zero assume F contains a totally imaginary number field.
Assemble all relative-chain local maps into a continuous dense
prereciprocity map `I(F;X)→G_F^ab`. By §6.1 it factors through
`ρ_X:C(F;X)→G_F^ab`. For finite Galois `L/F` extending to a finite
map `f:Y→X`, with Y integral and function field L, prove
`C(F;X)/f_*C(L;Y) ≃ Gal(L/F)^ab`.
For every effective boundary divisor D and positive m, prove that
`C(X,D)/m` is finite, and that
`lim_{D,m} C(X,D)/m ≃ G_F^ab` as profinite groups.
The modulus completion theorem includes positive characteristic.
The uncompleted class group has dense image; surjectivity is not
deduced from that assertion.

**API.** `SchemeReciprocity.prereciprocity` constructs the local
assembly; `SchemeReciprocity.map` gives its Q-chain factorization;
`SchemeReciprocity.normQuotient` gives the finite norm quotient;
`SchemeReciprocity.modulusCompletion` gives finite-modulus finiteness
and the inverse-limit equivalence; `SchemeReciprocity.pushforward`
states naturality under §5.6's finite direct images.

**Checks.**

- For `L=F` the finite norm quotient is zero, rather than `G_F^ab`.
- On a projective curve over `F_q`, the degree direction of the
  completed map is `ℤ̂→Gal(F̄_q/F_q)`. The original degree map has
  source ℤ.
- For `Spec O_K`, scheme-unramified reciprocity kills local unit
  inertia. The full number-field Artin map is compared only after
  imposing that quotient.

*Needs:* §5.5–§5.7, §6.1, higher local norm/existence, [SF], Layer 2's
finite-étale fundamental group, and the Kato–Saito global norm and
finite-modulus existence theorems. Sources: [Kerz], §5, p. 7,
Theorems 9.1–9.2, pp. 14–15. These statements supply a precise
global theorem; their cited primary existence proofs remain required
proof inputs.

### 6.3 Wiesend's class group

For regular U open in an integral X proper and flat over ℤ, in the
same totally imaginary scope, restrict the Parshin and Q-chain sums
to `d(P)≤1`. Give degree-one factors the ordinary local multiplicative
topology. Denote the resulting idele and class groups by `I_W(U)` and
`C_W(U)`. Prove that the quotient topology is independent of
compactification and that reciprocity gives the strict exact sequence
`0→C_W(U)^0→C_W(U)→π_1^ab(U)→0`, with the identity component as
kernel. Strictness identifies the quotient topology with the profinite
fundamental-group topology.

**API.** `WiesendClassGroup.ofChains` constructs the truncated quotient;
`WiesendClassGroup.compactificationIndependent` compares two choices;
`WiesendClassGroup.kernel` gives the connected kernel;
`WiesendClassGroup.strictQuotient` identifies the topological quotient.

**Checks.**

- On an arithmetic curve the truncation is the whole finite relative
  idele construction.
- For dimension at least two, continuity of `C_W→C` does not imply
  continuity of `I_W→I`; the latter can fail.
- The kernel is the identity component, not the abstract torsion
  subgroup.

*Needs:* §5.5, §6.2 and the characteristic-zero Wiesend connected-kernel
theorem. Source: [Kerz], Definition 7.1 and Proposition 7.2, p. 10,
Theorem 9.3, p. 15. This construction does not replace Milnor modulus
groups for wild finite-field class field theory.

### 6.4 Proper, open, tame and wild targets

For regular U open in a proper arithmetic X, use the finite-cover
definition of `π_1^ab(U)`, with a chosen geometric basepoint. Changing
basepoint acts by inner conjugation before abelianization. Regular
purity identifies unramifiedness in codimension one with the relevant
finite étale covers. Kill local inertia over U to obtain the
unramified scheme quotient; along `X\U` retain the specified modulus
restrictions on principal units.

For the tame target further divide by the closed normal subgroup
generated by wild inertia at boundary places on every normal curve
mapping to U, then abelianize. Match this quotient with the class-group
quotient by the closed subgroup of local wild-unit images. State the
proper unramified, open unrestricted-ramification and open tame maps
separately. A reduced divisor modulus is not a universal definition of
the tame quotient in higher dimension. In positive characteristic the
wild target uses Milnor modulus groups, not only `C_W`.

**API.** `SchemeReciprocity.unramifiedQuotient` gives the scheme
quotient; `SchemeReciprocity.tameQuotient` gives the curvewise tame
quotient; `SchemeReciprocity.modulusTransition` gives the boundary
transition maps; `SchemeReciprocity.properCase` describes the absence
of boundary terms and the remaining unramified quotient.

**Checks.**

- If U is proper there are no omitted boundary places, but its
  unramified group is still a quotient of `G_F^ab`.
- For `U=ℙ¹_{F_q}\{∞}`, wild Artin–Schreier covers at infinity survive
  in the unrestricted target and are killed in the tame quotient.
- At an omitted curve place, principal units give wild inertia, while
  residue units can still give prime-to-p tame inertia. The proper
  quotient kills all unit inertia there.

In dimension one compare §5.5 with ordinary finite ideles and the
resulting maps with [FFA], FA.4 for curves, and [GNF], Layer 6 and
[CFT], Layers 10–12 for number fields. The constant-field component is
controlled by degree. Add archimedean factors explicitly for the full
ordinary number-field map; they were not part of the finite Parshin
construction. For `Spec O_K` or an open subscheme compare only after
the appropriate local-unit inertia quotient. A wider real-place scope
would require its own conventions.

**Check.** An everywhere unramified abelian extension of a number field
is detected after killing `O_v×` at each finite place. The unrestricted
idele map has a larger Galois target before imposing these conditions.

*Needs:* §6.2–§6.3, [SF], Layer 2's fundamental group and purity,
[LFR]'s ordinary tame/wild inertia, and the curvewise quotient
comparison. Sources: [Kerz], Introduction, pp. 1–2, §2, pp. 2–4,
§4, p. 5, §9, pp. 14–15. The tame target here is the specified
curvewise quotient, not an unstated stronger modulus theorem.

### 6.5 Kato complexes and the actual differential

Begin in an admissible base/coefficient regime with n invertible on
the base. Define the homological term
`C_n^0(X)_a=⊕_{δ(x)=a}H^{a+1}(κ(x),ℤ/n(a))`.
For a finite-field variety use `δ(x)=dim closure{x}`; for an arithmetic
one-dimensional base use the source dimension function. The
differential lowers a by one. Its component is §5.4's residue sum
over normalization branches, followed by corestriction. Establish
finite support and identify these maps with the relevant `d_1` row
of the étale homology niveau spectral sequence. This proves `d²=0`.
Only then define Kato homology `KH_a`.

For a normal integral d-dimensional X the leading map is
`H^{d+1}(κ(X),ℤ/n(d))→⊕_{x∈X^(1)}H^d(κ(x),ℤ/n(d−1))`.
At `a=0` the term is characters `H^1`; at `a=1` it is the
degree-two Brauer group. Extend to logarithmic coefficients only with
the specified wild purity and niveau comparison. The individual maps
from §2.3 do not by themselves prove a mixed-wild complex exists.

**API.** `KatoComplex.term` gives the direct-sum term;
`KatoComplex.differential` gives its finite-support branch map;
`KatoComplex.niveauRow` identifies it with `d_1`;
`KatoComplex.squareZero` records the resulting complex law;
`KatoComplex.homology` gives `KH_a` and its induced proper/open maps.

**Checks.**

- On a smooth arithmetic curve the complex is
  `Br(F)[n]→⊕_x H^1(κ(x),ℤ/n)` in degrees `1→0`.
- Every normalization branch appears at a singular specialization.
- On `Spec F_7[u,t]_(u,t)`, choose a nonzero constant character
  `χ∈H¹(F_7,ℤ/3)`. The two nonzero codimension-two contributions of
  `χ∪(u)∪(t)` are `+χ` along t then u and `−χ` along u then t.
  Their sum is zero, and either summand alone is nonzero. This pins
  the sign and support; the general square-zero proof still uses
  the niveau differential.

*Needs:* the arithmetic étale homology, purity and niveau extension
specified under Exact supplier contracts, [SF]'s dimension and branch control,
§2.1 and §5.4. Sources: [KS], Definitions 1.1–1.2 and the niveau
construction, pp. 129–132, (8.1), pp. 169–170;
[Jannsen], (4.1)–(4.4), pp. 40–43; [DP], §2, pp. 4–5.

### 6.6 Constant-place fields

Let `K/k` be a primary finitely generated extension of a global field:
k is separably algebraically closed in K. Purely inseparable algebraic
constants are allowed. Put
`d=td(K/k)+1`. Fix compatible place embeddings and common algebraic
closures. For a finite place use the henselian algebraic constant
field k_v inside the completion k̂_v. At a real place use a real
closure; at a complex place use an algebraic closure. Form
`K_v=Kk_v⊂K̂_v=Frac(K⊗_k k̂_v)`.
The primary-extension domain and embedding statements justify these
carriers. Record the inclusions and induced cohomological restrictions.
These extend constants; they do not range over every divisorial
completion of K.

**API.** `ConstantPlaceField.field` gives the compositum;
`ConstantPlaceField.intoCompletedConstants` gives its embedding in
K̂_v; `ConstantPlaceField.restriction` gives the cohomology map;
`ConstantPlaceField.archimedean` records the real/complex cases.

**Checks.**

- For `K=k(t)`, `K_v=k_v(t)`, not `k_v((t))`.
- Real-closure constants can retain real Galois cohomology; complex
  constants are algebraically closed.
- Vanishing on K_v implies vanishing on K̂_v by restriction. This
  implication does not require all their cohomology groups to be
  isomorphic.
- For `k=F_p(s)` and `K=k(s^(1/p))(t)`, K/k is primary although k is
  not relatively algebraically closed in K. Requiring relative algebraic
  closure would wrongly exclude this case. No geometric reducedness
  assertion is inferred from primaryness.

*Needs:* primary field extensions, [PC]'s restriction and field-limit
interface, and ordinary place/henselization carriers. Sources:
[DP], §2, pp. 3–4; [Jannsen], Theorem 0.4 and finite-coefficient
reduction, pp. 2–3, Theorems 2.10–2.12, pp. 24–25.

### 6.7 The two-clause resolution hypothesis

Introduce a datum `ResolutionF2` with two independent fields:

1. Every proper integral `F_2`-variety admits a proper birational
   morphism from a smooth variety.
2. Every smooth affine `F_2`-variety embeds openly in a smooth
   projective variety with simple normal-crossings boundary.

This is an assumption passed to the high-dimensional theorem below,
not a theorem asserting general resolution in characteristic two.

**API.** `ResolutionF2.properResolution` extracts the first clause;
`ResolutionF2.sncCompactification` extracts the second;
`ResolutionF2.ofClauses` packages both with their witnesses.

**Checks.**

- Resolution of surfaces alone does not construct this all-dimensional
  datum.
- A generically finite cover of degree greater than one is not a
  birational resolution witness.
- A smooth projective compactification with a singular boundary fails
  the second clause.

*Needs:* [SF], Layer 4's proper/birational, smooth and SNC carriers.
Sources: [DP], §2, `Res(F_2)` and Fact 2.3, p. 5;
[Jannsen], Definition 4.18, p. 48. Deleting the boundary clause
does not supply the stated proof route.

### 6.8 Three Hasse injectivity theorems

**Global constants.** For `K/k` primary and finitely generated with
`r=td(K/k)`, k global and n invertible in k, prove that restriction

`H^{r+2}(K,ℤ/n(r+1)) → ⊕_v H^{r+2}(K̂_v,ℤ/n(r+1))`

is injective. The map has finite support and runs over **all** places,
with the source's archimedean convention. If `char K≠2` and d=r+1,
a class of `H^{d+1}(K,ℤ/2(d))` vanishing on every henselian
constant-place K_v is zero, since it vanishes on every K̂_v.

The proof uses weights and the open/compactification argument for
`ℚ_ℓ/ℤ_ℓ` coefficients, then prime-to-ℓ alterations and transfer
descent. The finite-coefficient step needs divisibility in the
preceding degree via the norm-residue theorem and the resulting
Bockstein injection. Neither arbitrary-degree alterations nor an
unsupported finite-coefficient limit supplies this step.

**Check.** At ℓ=2 over a number field, vanishing only at finite places
does not meet the theorem's hypotheses until the real-place terms
are also handled.

*Needs:* §6.6, §2.2, [PC]'s cohomological dimension and transfer,
the global proper degree-prime-to-ℓ alteration contract, [MEK]'s norm-residue
contract and the weight argument. Sources: [Jannsen], Theorem 0.4
and finite-coefficient reduction, pp. 2–3, Theorems 2.10–2.12 and
proof, pp. 24–25; [DP], Fact 2.1, p. 4.

**A good regular model.** Let R be a finite field of characteristic
different from two, or the valuation ring of a henselization of a
global field at a finite place whose **residue** characteristic is
different from two. Let X be proper, flat, regular and integral over
R, of absolute dimension `d>0`, with function field K. Prove

`H^{d+1}(K,ℤ/2(d)) → ∏_{x∈X^(1)} H^{d+1}(K_x,ℤ/2(d))`

is injective, where K_x is the henselian divisorial field. Use the
top-degree vanishing of §6.5's Kato homology: restriction-zero gives
zero residue at every codimension-one point, hence a class in the
zero top homology group.

**Check.** Characteristic-zero K with residue characteristic two does
not fall under this prime-to-residue-characteristic branch.

*Needs:* §6.5, henselian residue factorization, prime-to-residue-characteristic
Kato homology vanishing, and the regular proper model. Sources:
[KS], Theorem 8.1 and proof, pp. 169–171; [DP], Fact 2.2, p. 5.

**Characteristic two.** For finitely generated K of characteristic
two and Kronecker dimension `d>0`, take a smooth projective model X.
If `d>3`, assume `ResolutionF2`. Prove the same divisorial injectivity
statement with logarithmic `ℤ/2(d)` coefficients. For `d≤3`, retain
the separate unconditional model and Kato/Suwa homology arguments;
they are not consequences of a general resolution theorem.

**Check.** At d=4 the theorem has an explicit `ResolutionF2` argument.
Using ordinary `μ_2` Galois coefficients would erase the groups that
the theorem detects.

*Needs:* §2.1, §2.5–§2.6, the wild niveau comparison, §6.7 in the
conditional range, and the stated low-dimensional homology inputs.
Sources: [DP], Fact 2.3, p. 5; [Jannsen], Definition 4.18,
Theorem 4.19 and Lemma 4.20, pp. 48–50. The logarithmic purity,
finite-coefficient passage and compactification arguments must keep
their characteristic-p hypotheses.

### 6.9 Global and arithmetic Kato cones

Put `Λ=ℤ/ℓ^s`, `s≥1`. For a variety over a global field define
`C^1(X)_a=⊕_{dim closure{x}=a} H^{a+2}(κ(x),Λ(a+1))`.
For smooth proper connected X/k with `ℓ≠char k`, form
`Cone(C^1(X)→⊕_v C^1(X_{k_v}))`, using the source's henselian place
fields and all places. In a number field the real terms are retained
also at ℓ=2; at a real place k_v is a real closure, and at a complex
place it is algebraically closed. The terms displayed here have
cohomological degree at least two. Any passage through compact-support
duality retains the source's modified archimedean convention.
Prove homology Λ in degree zero and zero in positive degrees.

For a regular connected U of finite type over ℤ with global function
field k, let ℓ be invertible on U and X regular connected, proper and
flat over U, with smooth generic fibre. Instead use
`Cone(C^0(X)[1]→⊕_{v∉U} C^1(X_{k_v}))`.
It has the same homology. The missing places include the applicable
archimedean terms, and depend on U.

Fix the homological convention explicitly. For `f:C→D`,
`Cone(f)_a=D_a⊕C_{a−1}` with
`d(y,x)=(d_D y+f(x),−d_C x)`.
The shift printed `[1]` in this arithmetic formula has
`(C^0[1])_a=C^0_{a+1}` and differential `−d_C`.
Consequently the arithmetic cone's degree-a carrier is
`(⊕_{v∉U}C^1(X_{k_v})_a)⊕C^0(X)_a`.
Match the explicit restriction maps and signs to the source's complexes.

**Checks.**

- The finite-field theorem uses the ordinary `C^0` complex, rather
  than this global-place cone.
- Over a number field changing U changes the missing-place summands.
  In dimension one the arithmetic statement recovers the corresponding
  Brauer–Hasse–Noether sequence.
- For `X=Spec ℚ` and `Λ=ℤ/2`, the real-place degree-zero term is
  `H²(ℝ,ℤ/2(1))=ℤ/2`, while the complex-place term is zero. Dropping
  the real summand changes the Brauer sequence and is not permitted.
- For a chain map f and an element x, `d(0,x)=(f(x),−d_C x)`.
  Its next differential has first component `d_D f(x)−f(d_C x)=0`
  and second component `d_C²x=0`. This fixes the cone's minus sign.

*Needs:* §6.5, §6.8, finite-coefficient Bockstein and alteration
descent, and [EDC]'s trace/localization comparison. Sources:
[KS], Theorems 8.3–8.4 and proofs, pp. 171–174. The field cone,
arithmetic cone and finite-field row have different indexing data and
must not be substituted for each other.

### Examples

For `K=k(t)`, §6.6 extends constants to `k_v(t)` without completing t.
For `Spec O_K`, §6.2 and §6.4 compare the finite ideles only after
the local-unit inertia quotient. A regular arithmetic curve has the
degree `1→0` Brauer-to-character complex of §6.5. In characteristic
two, §6.8 at d=4 retains both clauses of `ResolutionF2`, whereas its
low-dimensional branch uses the separately stated unconditional inputs.

### Dependencies

The scheme reciprocity route uses local norm/existence, Q-chain
reciprocity and the relative Nisnevich comparison. The cohomological
route uses actual localization differentials, weights, purity and
degree-controlled alterations. Its characteristic-two branch additionally
uses the two-clause resolution datum only in the specified dimension
range. The three injectivity theorems give distinct constant-place,
good-model and characteristic-two interfaces to downstream applications.

## Layer 7: Comparisons on common carriers

### 7.1 The one-local Artin map

Identify `K_1^M(F)=F×` for a one-local field. Using the same separable
closure, Galois quotients and local invariant, prove equality of
§3.1's Art with [CFT], Layer 7's absolute local Artin homomorphism.
Check equality on every finite abelian restriction, not merely an
isomorphism between the targets. Use [CFT], Layer 8 and [FFA], FA.4
for the ordinary mixed- and equal-characteristic wild existence and
completion branches respectively.

**Check.** A uniformizer maps to arithmetic Frobenius in each
unramified quotient. Geometric Frobenius would invert the comparison.

*Needs:* §2.3, §3.1–§3.6 and the fixed-carrier ordinary contracts.
Sources: [Invitation], I §5.1–§5.2, pp. 53–57;
[Morrow], §5 introduction, pp. 30–31, Theorem 5.8, pp. 34–35.

### 7.2 Brauer residues and higher evaluations

At n=1 identify the Kato degree-two group, including its wild part,
with `Br(F)` and prove equality of its invariant with [CFT], Layer 5's
invariant. For a two-local field, a finite-order character χ and
`x∈K_2^M(F)`, compare `inv_F(χ∪h(x))` with the first-residue Brauer
calculation whenever the coefficient-order and residue/symbol
compatibility hypotheses hold. Thus the higher obstruction maps to
the actual ordinary residue Brauer class. Wild mixed-characteristic
steps require the full wild residue theorem; no tame splitting for
all wild classes is asserted.

**Check.** On `F_q((u))((t))`, an unramified character evaluated on
`{u,t}` gives its positive final Frobenius value.

*Needs:* §2.2–§2.3, §2.8, §3.1 and [CFT], Layer 5. Sources:
[Invitation], I §§5.1–5.2, pp. 54–57; [Morrow], Remark 5.10,
pp. 35–36.

### 7.3 Cup products and local duality

For finite ℓ-primary M with `ℓ≠char F_1`, identify the pairing of
§2.7 with the successive residue induction from [CFT], Layer 5's
local Tate pairing. Use the same trace and twist conventions and
`M^∨=Hom(M,ℚ_ℓ/ℤ_ℓ)`. Specify the graded sign if the two cup
factors are interchanged. At n=1 this is equality with the ordinary
pairing. For characteristic-p logarithmic coefficients use the
separate categorical finite-order character theorem; do not replace
it by finite-group perfectness.

**Check.** For `ℚ_p((t))` the bottom one-local characteristic is zero,
so all coefficient primes are permitted. For `ℚ_p{{t}}` the bottom
field has characteristic p, and p is outside this finite-group theorem.

*Needs:* §2.4, §2.7, §7.1 and the [PC]/[CFT] cup and trace contract.
Sources: [Milne], Theorem 2.17, Lemma 2.18 and Corollary 2.19,
pp. 38–40; [Invitation], Kato existence, Theorem 2, p. 166,
Lemma 2, p. 171.

### 7.4 Motivic and Milnor localization

For m invertible in the relevant fields, prove the square relating
the imported `K_i^M(F)/m ≃ H^i(F,ℤ/m(i))` to the Milnor and
cohomological residue maps. Use the same last-uniformizer orientation
and the required localization/purity comparison. Iterate over a flag,
including normalization branch transfers, to compare the Milnor idele
boundary with the cohomological boundary. The characteristic-p
logarithmic square is a separate extension using the full
Bloch–Gabber–Kato theorem and logarithmic purity.

**Check.** Applying the outer t-boundary to `{u,t}` gives `{u}` on
both sides. Reversing the symbol entries introduces the graded minus
sign. An ordinary `μ_p` square in characteristic p cannot replace
the logarithmic square.

*Needs:* [K2], Layers 9–11, [MEK], §6.6, §2.5–§2.6, §5.4 and the
arithmetic purity/niveau extension specified under Exact supplier contracts.
Sources: [Morrow], Proposition 5.5, p. 33, Remark 5.10,
pp. 35–36, §7.1, pp. 44–46; [KS], §1, pp. 129–132, §8,
pp. 169–171. The generic norm-residue and localization theorems
come from their named suppliers; these surveys motivate the higher
comparison rather than prove every supplier theorem.

### Examples

For `F_q((u))((t))`, the comparison diagrams send the parameter symbol
and an unramified character to its positive final Frobenius value.
For a one-local field, the higher invariant is the Brauer invariant
and the higher Artin map is the ordinary map on the same Galois carrier.
Swapping the two parameters changes the sign before either route
through the residue square, as computed in §1.5 and §2.8.

### Dependencies

Use the local constructions of Layers 1–4 and the branchwise maps of
Layers 5–6, together with the fixed-carrier [CFT], [PC], [K2], [MEK]
and [EDC] contracts. Every comparison retains its own coefficient range;
the wild logarithmic statements do not follow from the tame square.

## Downstream consumers

Consumers receive finite norm quotients, arithmetic character
evaluation, admissible higher invariants, branchwise residues and
their norm/trace compatibilities. Geometric consumers receive the
recursive adelic resolution and the distinct Milnor modulus class
groups. Hasse applications can request precisely one of §6.8's three
injectivity statements, with its field, model, coefficient and
resolution hypotheses. All comparisons use shared carriers and
commuting maps; an abstract isomorphism of groups is not a substitute.

[Logic and definability in number theory, Part II](../../readmes/LogicAndDefinabilityInNumberTheoryPartII.md)
uses the global-constant, good-model and characteristic-two injectivity
interfaces to detect cohomological symbols over finitely generated
fields. The hypotheses in §6.8 distinguish which interface it may use;
in particular the finite-place cohomological-dimension bound does not
bound the cohomology of a formally real global field. The motivating
applications are [DP], Facts 2.1–2.3, pp. 4–5 and Proposition 3.2,
p. 7. Higher arithmetic duality and cycle-class constructions use
§7.2–§7.4's invariant, cup-product and localization diagrams, retaining
the same branch sums and arithmetic normalization.

## References

Page numbers above are printed page numbers, except that [DP] uses
the cited author-version pagination. The [Invitation] PDF has twelve
front-matter pages before positive printed pagination.

- **[Invitation]** I. Fesenko and M. Kurihara, editors, *Invitation to
  higher local fields*, Geometry & Topology Monographs 3 (2000).
  Chapters cited above are by I. Zhukov, O. Izhboldin, M. Kurihara,
  I. Fesenko, A. Parshin, S. V. Vostokov and K. Kato.
  [Open publisher PDF](https://msp.org/gtm/2000/03/gtm-2000-03p.pdf).
- **[Morrow]** M. Morrow, *An introduction to higher dimensional local
  fields and adeles*, arXiv:1204.0586v2 (2012).
  [Versioned PDF](https://arxiv.org/pdf/1204.0586v2).
- **[Kerz]** M. Kerz, *Ideles in higher dimension*, arXiv:0907.5337v3
  (2011). [Versioned PDF](https://arxiv.org/pdf/0907.5337v3).
- **[KS]** M. Kerz and S. Saito, *Cohomological Hasse principle and
  motivic cohomology for arithmetic schemes*, Publications
  Mathématiques de l'IHÉS 115 (2012), pp. 123–183.
  [Published PDF](https://www.numdam.org/article/PMIHES_2012__115__123_0.pdf).
- **[Jannsen]** U. Jannsen, *Hasse principles for higher-dimensional
  fields*, Annals of Mathematics 183 (2016), pp. 1–71.
  [Published PDF](https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p01-p.pdf).
- **[Milne]** J. S. Milne, *Arithmetic Duality Theorems*, second
  edition (2006), I §2, pp. 37–40.
  [Author PDF](https://math.stanford.edu/~conrad/BSDseminar/refs/MilneADT.pdf).
- **[DP]** P. Dittmann and F. Pop, *Characterizing finitely generated
  fields by a single field axiom*, arXiv:2012.01307v2 (2023).
  [Versioned author PDF](https://arxiv.org/pdf/2012.01307v2).

The roadmap suppliers linked below are mathematical boundaries: their
planned interfaces are imported, rather than repeated here.

[CFT]: https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ClassFieldTheory
[LFR]: https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/LocalFieldsRamification
[GNF]: https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/GlobalNumberFields
[PC]: https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ProfiniteCohomology
[PA]: https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/ProfiniteArithmetic
[LGG]: https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/LocalGaloisGroups
[RP]: https://github.com/TauCetiProject/TauCetiRoadmap/tree/main/TauCetiRoadmap/Completed/RestrictedProducts
[FFA]: ../../../../content/campaign/FunctionFieldArithmetic/README.md
[K2]: ../../../../content/campaign/K2SymbolsBrauer/README.md
[KLF]: ../../../../content/campaign/KTheoryFiniteLocalFields/README.md
[MEK]: ../../../../content/campaign/MotivicEtaleKTheory/README.md
[CR]: ../../../../content/campaign/CrystallineCohomology/README.md
[SF]: ../../../../content/campaign/SchemeAndStackFoundations/README.md
[EDC]: ../../../../content/campaign/EtaleDualityAndPerverseSheaves/README.md
[Invitation]: https://msp.org/gtm/2000/03/gtm-2000-03p.pdf
[Morrow]: https://arxiv.org/pdf/1204.0586v2
[Kerz]: https://arxiv.org/pdf/0907.5337v3
[KS]: https://www.numdam.org/article/PMIHES_2012__115__123_0.pdf
[Jannsen]: https://annals.math.princeton.edu/wp-content/uploads/annals-v183-n1-p01-p.pdf
[Milne]: https://math.stanford.edu/~conrad/BSDseminar/refs/MilneADT.pdf
[DP]: https://arxiv.org/pdf/2012.01307v2
