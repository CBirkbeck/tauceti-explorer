# REV-OverconvergentAutomorphicForms--O0~2: needs changes

Independent reviewer: **Codex — codex-86jnSN**, 8 October 2026. Refs #7100.
This is a completed independent review of revision round 2, not a checkpoint.
The reviewer did neither input planning job. The earlier review remains in
`reviewHistory`; its five source-issue verdicts are also preserved historically.

The revised mathematical plan makes the O5 integral-equalizer comparison
independent of integral local freeness and supplies a valid conditional O7
norm-completion argument. Clear remaining errors have been corrected in the
[packet](../packets/OverconvergentAutomorphicForms--O0.json),
[reader](../readmes/OverconvergentAutomorphicForms--O0.md) and
[suggested file](../suggested/OverconvergentAutomorphicForms--O0.lean).
The outstanding acceptance failure is PROTOCOL §13: most required declarations,
API lemmas and examples occur in a block comment, rather than as Lean signatures.
The successful Lean run does not elaborate that register.

Open supplier contracts alone are not grounds for this verdict. Conditional
statements are assessed with those contracts as hypotheses, and all eight stages
remain honestly `planned`, with none `closed`. `complete` denotes the finished
planning pass. Nothing is represented as implemented; every implementation
status stays `unchecked`. The report distinguishes mathematical assessments
from missing prototypes so a follow-up can use the corrected arguments directly.

## Inventory and verdicts

| Inventory | Input revision | Reviewed packet |
| --- | ---: | ---: |
| Nodes | 73 | 74 |
| Definitions / constructions | 5 / 30 | 5 / 30 |
| Lemmas / theorems / comparisons / applications | 4 / 20 / 12 / 2 | 5 / 20 / 12 / 2 |
| API items, including comparison proof API | 129 | 129 |
| Test contracts | 109 | 109 |
| Planets | 32 | 32 |
| Baseline citations | 38 | 38 |
| Supplier requests / explicit gaps | 13 / 13 | 13 / 13 |
| Planned / closed stages | 8 / 0 | 8 / 0 |

The register has 12 `verified`, 13 `corrected`, 1 `added` and 48 `unverifiable` entries. An `unverifiable` entry here records a required prototype that is absent, with
the mathematical assessment stated separately in its note. A `corrected` or
`added` node may also retain an explicitly noted prototype omission. Thirteen
original nodes were corrected; one lemma was added. No original ID, planet,
baseline citation, request or gap was deleted. No baseline citation was replaced.

## Acceptance gap: typed signatures and tests

After removing nested block comments and line comments, the file contains 66
named definitions, abbreviations, structures and theorems, and 36 examples.
The count includes the three declarations carrying `@[simp]`, which the revision
handoff’s count of 63 omitted. Many of the 66 names are auxiliary scalar fixtures.
Across the packet there are 199 distinct proposed node/API names: 47 occur as
named typed declarations and 152 do not. This is a name-presence audit, not a
claim that all 47 present names implement the entire geometric contract.

| Stage | Nodes | Distinct node/API names | Typed name present | Absent | Test contracts |
| --- | ---: | ---: | ---: | ---: | ---: |
| O0 | 22 | 59 | 32 | 27 | 38 |
| O1 | 4 | 21 | 13 | 8 | 7 |
| O2 | 6 | 15 | 0 | 15 | 9 |
| O3 | 6 | 15 | 0 | 15 | 9 |
| O4 | 11 | 29 | 0 | 29 | 18 |
| O5 | 6 | 12 | 2 | 10 | 4 |
| O6 | 13 | 30 | 0 | 30 | 15 |
| O7 | 6 | 18 | 0 | 18 | 9 |

The O5 names `aip_independent_coefficients.translationUnits` and
`geometric_aip_comparison.bounded_iff` are normed-field scalar fixtures. They do
not state the sheaf or all-valuations versions. There are no typed node/API
names for O2–O4 or O6–O7. The five cocycle examples comprise four O1 algebraic
tests and one O2 scalar matrix counterexample. The other examples are 24 weight
fixtures, four O5 scalar fixtures and three O7 algebraic fixtures. They do not
provide the 109 actual test contracts; a polynomial seed is not a Tate algebra,
and an orbit of abstract sets is not the AIP frame torsor.

The mathematical register now matches every packet statement, hypothesis,
proof step, acceptance clause, API name/statement and test name/statement.
This fixes document lag, but cannot satisfy §13’s requirement for signatures and
examples. The follow-up must obtain the actual supplier carriers and type these
contracts, retaining honest omitted conditions where §13 allows them. It must
not insert Prop-valued stand-ins or artificial geometry to make the names compile.
The exhaustive absent-name list is below.

## Mathematical findings and corrections

**Rationalisation without an integral generator.** O3’s proof still invoked an
independently constructed integral AIP line and its local generator, despite O5
leaving full-character positive-radius freeness open. It now uses actual rational
equivariant functions on quasicompact inverse-image patches. The P9 local
O+[1/p]=O contract gives a finite open cover and hence one p-denominator. Clearing
that denominator preserves the eigencondition; inclusion gives the inverse
identification. Glue locally, with the arithmetic variant using O4’s integral-unit
transports. This proves the sheaf identity without an arbitrary interchange of
infinite invariants and localization, an integral generator, or a global claim on
a nonquasicompact base. The forward O5 comparison dependency was removed.

**Integral equalizer comparison versus freeness.** The revised O5 proof compares
rational lines first, then uses valuative lifting and frame torsor transitivity.
If y=b·s(x), the eigencondition makes h(y)=κ(b)⁻¹h(s(x)); both multipliers are
valuation units, including finite p-primary values. Thus pullback and its rational
inverse preserve integral bounds at every valuation. This conditional proof is
sound and does not use an integral eigenfunction generator. Its key translation
argument is promoted to the new lemma `O5/aip-translation-valuation-units`, marked
`addedBy: REV-OverconvergentAutomorphicForms--O0~2`, and referenced by the
comparison. AIP ADIC Lemma4.4 p16 supplies the admitted analytic congruence;
§6.4 p29 retains the finite-character factor. Finite order gives valuation one
because an ordered valuation group is torsion-free.

AIP ADIC Propositions4.3/4.7 pp16–18 give universal-character formal freeness.
The full finite-character factor in §6.4 p29 is coherent and invertible on the
ordinary locus and rational analytic fibre. Those statements do not establish
all positive-radius analytic O+ unit trivializations. This remains a separate
honest gap. The stale acceptance clause defining the full integral sheaf by
formal generic fibre was replaced by the independent analytic O/O+ equalizers.

The exact P9 `integral-coboundary-trivialises-integral-sheaf` supplier is for its
chosen completed lattice tensor. Its hypothesis explicitly distinguishes that
object from geometric O+ of a smooth weight product. The O5 unit-generator
criterion now requests geometric invariant-function descent on every open of
the actual analytic B_n frame torsor; B_n is not just a profinite deck group.
The cited P9 theorem is an algebraic model for the criterion, rather than an
already supplied theorem about this geometric sheaf. A unit generator and its
inverse would give a line by invariant ratios, but unit-valued character
multipliers do not construct that generator.

**T5 radius scope.** The named `T5/hodge-tate-aip-lift` requires
ε_base≤p^(−(m+1)). For p≥5, the O2 bound 1/(2p^m) is weaker. The geometric
comparison now explicitly retains the T5 bound at the radius after u_n, while
the source of s∘u_n has radius p^n ε_base and must separately be O2-admitted.
Arithmetic comparison, naturality, cusp comparison and Hecke comparison inherit
these bounds on the required source and target domains. This restricts the
comparison contract to what the actual supplier proves; it is not a new
numerical formula for a weight.

**Hecke and Banach scope.** BHW Lemma10.3 and Definition10.4 pp1789–1790
supply an integral coefficient map for the wild correspondence. The statement
no longer implies an integral identification. The degree q_𝔭, normalizer
q_𝔭⁻¹, uniformizer independence and partial-radius improvement remain.
AIP CUSP Theorem4.4 p28 uses an admissible open affinoid of arithmetic weight
space, rather than every bounded affinoid mapping to weight space. The cusp
Banach and compact-restriction contracts now retain that hypothesis. Finite
wild level is transported by the scaled AL map with the boundary ideal; an
arbitrary affinoid pullback requires a further completed scalar-extension result.
Proposition3.22 p21’s cofinal global-Hasse affinoid refinement remains explicit.

**O7 conditional proof.** With R_i=A_i° at finite level, isometric transitions,
a power-multiplicative spectral norm and the actual analytic ring equal to the
separated completion of the finite-level union, an approximation within error
<1 of a unit-ball element is itself in a finite-level unit ball. Approximate to
|p|^m to identify the unit ball with lim_m colim_i R_i/p^m. The norm and p-adic
topologies agree on the integral union. The argument respects patch restrictions
and does not interchange the limits. These hypotheses make the revised argument
valid. The actual ordinary formal models and tower comparison remain precise
T5/P9 requests. Heuer Proposition3.8 p16 supplies a natural map and formal-unit
cocycle effectivity, not these additional contracts. The nonnormal model
O_K⟨pT,T²,T³⟩ is still a useful failure test for an arbitrary formal model.

The remaining small fixes remove the last quoted source clause from the
norm-factor acceptance test, correct its character domains to w=N^a and
t(y)=y^b, and remove the contradictory right-action hypothesis from the Hilbert
left automorphy factor. No other node statement or API/test contract changed.
Packet-wide edits update precise P9/T5 requests, the affected gap, reading
provenance, baseline confirmations and review/source-issue history; E6 adds the
displayed-pullback-direction correction above.

## Exhaustive change log

| Node | Applied correction |
| --- | --- |
| `O0/weight-comparison-norm-factor` | Removed the remaining quoted source clause and corrected the algebraic test: t is y↦y^b on Z_p×, while w=N^a on O_p×. |
| `O2/hilbert-automorphy-factor` | Removed the hypothesis contradicting the left source action; the right interface now explicitly inverts the group element and coefficient cocycle. |
| `O3/integral-rationalisation` | Replaced the circular integral AIP-generator proof with a finite bounded-denominator argument on quasicompact inverse-image patches, removing the O5 prerequisite. |
| `O5/aip-independent-coefficients` | Corrected the stale formal-generic-fibre acceptance clause: analytic O/O+ eigenfunctions, the universal formal line and the coherent finite-character factor are separate constructions. |
| `O5/aip-translation-valuation-units` | Promoted the translation-unit API argument to a named lemma. Integral formal-character units, the admitted small-character congruence and finite-order valuation values preserve both bounds at every valuation. |
| `O5/aip-line-and-gluing` | The full-character unit-generator criterion is conditional; corrected the P9 citation’s scope by separating its completed lattice tensor from the requested geometric O+ sheaf variant. |
| `O5/geometric-aip-comparison` | The valuative integral-equalizer proof is noncircular; added the exact T5 ε_base≤p^(−(m+1)) bound and scaled source admission, and the new valuation-unit lemma as an input. |
| `O5/arithmetic-aip-comparison` | Arithmetic twisted invariants transport the integral comparison without averaging; explicitly inherited the corrected geometric comparison radius and source-domain requirements. |
| `O5/aip-comparison-naturality` | Naturality follows from actual pullback/frame maps with weight and level transport; explicitly inherited the corrected T5 admission on the comparison diagrams. |
| `O6/hilbert-cusp-forms` | Boundary-ideal cusp forms remain independent of Koecher; explicitly inherited the frame-comparison radius where the AIP cusp comparison is used. |
| `O6/wild-hilbert-hecke` | Replaced an integral-identification claim by the integral coefficient map of Lemma10.3; uniformizer independence and partial-radius improvement remain valid. |
| `O6/aip-hecke-equivariance` | Hecke comparison is a torsor/isogeny diagram statement; source and target now explicitly inherit the corrected T5 frame-comparison admission. |
| `O6/fixed-cusp-banach-modules` | Restricted direct use of AIP Theorem4.4 to its admissible open arithmetic weight affinoid; finite wild level uses scaled AL transport and boundary compatibility. |
| `O6/compact-radius-restriction` | Compact restriction uses the refined global-Hasse affinoids and relative compact containment; inherited the source theorem’s admissible weight affinoid restriction. |

## Earlier review, closure, API, tests and planets

The earlier review’s 26 correction rows were checked against the revision:
weight continuity, existential extension, BP induction/dual and finite twist,
Ding coefficients, right cocycle/gauge conversion, Heuer effectivity, left Hilbert
factor/law, AL scaling, norm-weight determinant, integral equalizer definition,
polarisation independence, AIP independent construction, Koecher, controlling
operator and ordinary completion/coefficients retain their corrected conventions.
The three earlier unverifiable targets now have a noncircular conditional
integral-comparison proof, a separate conditional integral-freeness criterion,
and a conditional norm-completion proof. The full-character freeness and actual
ordinary-model inputs remain open explicitly; the report does not claim the
published comparison theorem false.

The local dependency graph is acyclic. Every target of each planned stage is
realised by the existing target-level nodes; external leaves terminate in the
38 cited baseline declarations, exact supplier nodes, the 13 precise requests
or 13 recorded gaps. The new lemma names a downstream-used API fact as §4
requires, rather than splitting target proofs into unnecessary lemma-level steps.
Ownership remains with the existing character, analytic-distribution, bundle,
Hilbert-moduli, canonical-subgroup, perfectoid and compactification roadmaps.
The existing Part II proposals are retained and no upstream file is changed.

The 35 definitions/constructions all have at least three discriminating test
contracts, 128 API items and recorded uses. The comparison has one additional
proof API. Tests detect wrong inverses/order, trivialized characters, determinant
versus norm weight, integral versus rational bounds, finite versus profinite
quotients, normalized trace, partial versus controlling operators, and limit
order or global finite-level errors. The register does not pretend these are
compiled examples. Target-level mathematical API coverage is appropriate; the
missing Lean signatures remain the acceptance problem.

The 32 planets are central objects/theorems with source-based short noun names.
Their per-stage counts are O0:6, O1:3, O2:3, O3:3, O4:5, O5:2, O6:6, O7:4.
No planet was added for the auxiliary valuation lemma. The reviewed library
audit for O0–O8 and the nearby upstream AdicSpaces and InductionRestriction
reader models were checked. No generic owner object is replanned here.

## Baseline verification

All 38 declarations and their surrounding hypotheses were independently read at
Mathlib `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti
`f790474821cf4256814db967cb154e7af3d0c369`. Their names exist and their
statements provide the claimed algebraic/topological inputs. No citation was
removed or fixed. The pinned module links and individual provided scopes are in
the reader’s [baseline table](../readmes/OverconvergentAutomorphicForms--O0.md#pinned-baseline).

In particular, determinant/norm formulas are used on finite-free modules;
the embedding product retains separability, finite dimension and the required
splitting target. Module-topology continuity does not supply adic geometry.
`Representation.dual` uses the inverse group action and `Representation` does
not supply analytic orbit maps. `SheafOfModules` does not construct the needed
adic ringed site. The narrow class group uses totally positive principal ideals,
and its finite instance retains the number-field hypothesis. None of these
baseline inputs is promoted to an analytic or perfectoid statement by name alone.

| Confirmed baseline | Pinned module |
| --- | --- |
| `mathlib:Algebra.TensorProduct.leftAlgebra` | [Mathlib/RingTheory/TensorProduct/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/TensorProduct/Basic.lean) |
| `mathlib:Algebra.norm` | [Mathlib/RingTheory/Norm/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Norm/Defs.lean) |
| `mathlib:Algebra.norm_apply` | [Mathlib/RingTheory/Norm/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Norm/Defs.lean) |
| `mathlib:Algebra.norm_eq_prod_embeddings` | [Mathlib/RingTheory/Norm/Transitivity.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Norm/Transitivity.lean) |
| `mathlib:ContinuousMonoidHom` | [Mathlib/Topology/Algebra/ContinuousMonoidHom.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/ContinuousMonoidHom.lean) |
| `mathlib:ContinuousMonoidHom.comp` | [Mathlib/Topology/Algebra/ContinuousMonoidHom.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/ContinuousMonoidHom.lean) |
| `mathlib:ContinuousMonoidHom.fst` | [Mathlib/Topology/Algebra/ContinuousMonoidHom.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/ContinuousMonoidHom.lean) |
| `mathlib:ContinuousMonoidHom.snd` | [Mathlib/Topology/Algebra/ContinuousMonoidHom.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/ContinuousMonoidHom.lean) |
| `mathlib:Ideal.span` | [Mathlib/RingTheory/Ideal/Span.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/Ideal/Span.lean) |
| `mathlib:IsModuleTopology` | [Mathlib/Topology/Algebra/Module/ModuleTopology.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Module/ModuleTopology.lean) |
| `mathlib:IsModuleTopology.continuous_of_linearMap` | [Mathlib/Topology/Algebra/Module/ModuleTopology.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Module/ModuleTopology.lean) |
| `mathlib:IsModuleTopology.isTopologicalRing` | [Mathlib/Topology/Algebra/Module/ModuleTopology.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Module/ModuleTopology.lean) |
| `mathlib:IsTopologicalRing` | [Mathlib/Topology/Algebra/Ring/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Ring/Basic.lean) |
| `mathlib:LinearMap.det` | [Mathlib/LinearAlgebra/Determinant.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Determinant.lean) |
| `mathlib:LinearMap.det_baseChange` | [Mathlib/LinearAlgebra/Charpoly/BaseChange.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Charpoly/BaseChange.lean) |
| `mathlib:Module.Finite.base_change` | [Mathlib/RingTheory/TensorProduct/Finite.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RingTheory/TensorProduct/Finite.lean) |
| `mathlib:Module.Free.tensor` | [Mathlib/LinearAlgebra/TensorProduct/Basis.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/TensorProduct/Basis.lean) |
| `mathlib:Module.finrank_baseChange` | [Mathlib/LinearAlgebra/Dimension/Constructions.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/Dimension/Constructions.lean) |
| `mathlib:NumberField.IsTotallyReal` | [Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/InfinitePlace/TotallyRealComplex.lean) |
| `mathlib:NumberField.RingOfIntegers` | [Mathlib/NumberTheory/NumberField/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/Basic.lean) |
| `mathlib:NumberField.RingOfIntegers.rank` | [Mathlib/NumberTheory/NumberField/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/Basic.lean) |
| `mathlib:NumberField.isUnit_iff_norm` | [Mathlib/NumberTheory/NumberField/Units/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/Units/Basic.lean) |
| `mathlib:PadicInt` | [Mathlib/NumberTheory/Padics/PadicIntegers.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Padics/PadicIntegers.lean) |
| `mathlib:PadicInt.compactSpace` | [Mathlib/NumberTheory/Padics/ProperSpace.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/Padics/ProperSpace.lean) |
| `mathlib:Rat.ringOfIntegersEquiv` | [Mathlib/NumberTheory/NumberField/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/NumberTheory/NumberField/Basic.lean) |
| `mathlib:Subgroup` | [Mathlib/Algebra/Group/Subgroup/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Subgroup/Defs.lean) |
| `mathlib:Subgroup.FiniteIndex` | [Mathlib/GroupTheory/Index.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/GroupTheory/Index.lean) |
| `mathlib:TensorProduct` | [Mathlib/LinearAlgebra/TensorProduct/Defs.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/LinearAlgebra/TensorProduct/Defs.lean) |
| `mathlib:Units.map` | [Mathlib/Algebra/Group/Units/Hom.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Group/Units/Hom.lean) |
| `mathlib:moduleTopology` | [Mathlib/Topology/Algebra/Module/ModuleTopology.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Module/ModuleTopology.lean) |
| `mathlib:Representation` | [Mathlib/RepresentationTheory/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Basic.lean) |
| `mathlib:Representation.tprod` | [Mathlib/RepresentationTheory/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Basic.lean) |
| `mathlib:Representation.dual` | [Mathlib/RepresentationTheory/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Basic.lean) |
| `mathlib:Representation.invariants` | [Mathlib/RepresentationTheory/Invariants.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/RepresentationTheory/Invariants.lean) |
| `mathlib:ContinuousLinearMap` | [Mathlib/Topology/Algebra/Module/ContinuousLinearMap/Basic.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Topology/Algebra/Module/ContinuousLinearMap/Basic.lean) |
| `mathlib:SheafOfModules` | [Mathlib/Algebra/Category/ModuleCat/Sheaf.lean](https://github.com/leanprover-community/mathlib4/blob/082e2d37e8b0463410cdb532e111cd43d5a66174/Mathlib/Algebra/Category/ModuleCat/Sheaf.lean) |
| `tauceti:NumberField.NarrowClassGroup` | [TauCeti/NumberTheory/NumberField/NarrowClassGroup/Basic.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/NumberField/NarrowClassGroup/Basic.lean) |
| `tauceti:NumberField.NarrowClassGroup.instFinite` | [TauCeti/NumberTheory/NumberField/NarrowClassGroup/Finite.lean](https://github.com/TauCetiProject/TauCeti/blob/f790474821cf4256814db967cb154e7af3d0c369/TauCeti/NumberTheory/NumberField/NarrowClassGroup/Finite.lean) |

## Public source evidence and source issues

All seven downloaded public PDFs have the packet’s recorded SHA-256 values.
The independent reading date is 2026-10-08. No private-library source was
needed. The principal passages checked are listed here as evidence for the
contracts above, rather than as summaries of each source section.

| Source/version | Locators used in this review |
| --- | --- |
| [Annales de l'Institut Fourier 73 (2023), no. 4, 1709–1794, DOI 10.5802/aif.3560; open-access journal PDF from Centre Mersenne (87 pages; printed page = PDF page + 1707)](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf) | BHW published §§6–7 pp1756–1765; §9 pp1780–1787; §10 pp1787–1792; supporting Definition4.5 p1736, §5 pp1749–1751/1755. |
| [arXiv:1902.03985v4, 10 May 2021, PDF](https://arxiv.org/pdf/1902.03985v4) | Corresponding Definitions6.1–6.2, Proposition6.3, Remark6.9 and §7.1/Theorem7.14, PDF pp27–31. |
| [Research in the Mathematical Sciences 3 (2016), 34; author PDF, 40 pages (author pagination used)](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/Hilbert_adicfinal.pdf) | Lemmas2.4/Proposition2.8 pp7–10; §§4.1–4.3 pp15–18; §6.4 p29; §7.1 p30; Proposition8.4 pp36–37. |
| [Astérisque 382 (2016), 163–192; author PDF, 35 pages (author pagination used)](https://www.imo.universite-paris-saclay.fr/~pilloni/AIP2.pdf) | §§3.3–3.6 pp14–24; §4 pp25–28; Appendix6.1–6.4 pp31–33, plus bibliography. |
| [Author version, 180 pages; §6.2–6.3 pagination](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf) | §6.2 setup and §§6.2.2–6.2.11 pp147–150; §6.2.20 pp152–153; §§6.3.5–6.3.8 pp154–155. |
| [Publications Mathématiques de l’IHÉS 142 (2025), 1–74; version of record](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf) | §4.2.2, pp66–67, particularly Proposition4.14 and its definite-unitary hypotheses. |
| [Forum of Mathematics, Sigma 10 (2022), e82; DOI10.1017/fms.2022.72, 36 pages](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/E9F0B6B21BA1F345142C7301C2EDDA28/S205050942200072Xa.pdf/line-bundles-on-rigid-spaces-in-the-v-topology.pdf) | Introduction/Corollary1.4 pp2–3; Definition3.7/Proposition3.8 and proof p16. |

All five input `sourceIssues` are independently **confirmed**, with this review’s
identity and date in the packet and the older verdicts preserved. E1 requires
the inverse norm in the dual map; E2’s Teichmuller example disproves the all-unit
strict supremum criterion; E3’s p=3 finite character κ(4)=ζ9 disproves the
printed radius even after the principal-unit correction; E4’s O_F/p^m model
has cardinality p^(mg); E5 directs the cusp Banach citation to AIP CUSP rather
than ADIC. For E3, the claimed ball contains 64 with character value ζ3, but
contains an accumulating sequence 4^(9·3^j) of kernel elements, so an analytic
extension on that one-dimensional ball would be forced to be constant.

Added source issue E6, independently **confirmed**: Theorem7.14 p1764 (arXiv v4 PDF p31) displays the frame pullback with the perfectoid sheaf as source and AIP sheaf as target, while evaluation along the actual frame and the first step of its proof give AIP-to-perfectoid pullback. The reverse arrow is the inverse isomorphism. This is a map-label/direction misprint and does not refute the isomorphism theorem. There are six current source issues.

The published and arXiv v4 formulas agree at the relevant locators. A dated web
search for the title and erratum/correction found no erratum in the returned
results; that limited search is not proof that none exists. No author was
contacted. The individual issue reasons and version fingerprints remain in the
packet; no source passage or excerpt was copied into these deliverables.

## Validation and next action

`python3 scripts/check_blueprint.py` reports zero errors and zero warnings.
The suggested file elaborated through `lean-check` at the pinned Mathlib with
zero errors and 83 warnings, all solely declarations using `sorry`. This checks
typing, not proofs. The later edits only update the mathematical comment register;
the compiled prefix is unchanged. Complete field-alignment, local-DAG, per-node
verdict and planet checks pass. `git diff --check` and allowed-deliverable checks
pass. No implementation status was changed.

The revision must provide the absent genuine signatures and examples from the
supplier contracts. The mathematical corrections above are already applied and
need not be repeated. For the orchestrator: if supplier-dependent comment
registers are intended to satisfy an exception to §13, that exception needs an
explicit protocol decision; the present protocol requires typed declarations.
This review has not inferred such an exception or asked the worker to invent
fake geometric carriers. The review is complete and is submitted with this
negative verdict, not as unfinished work.

## Per-node register

These are the packet’s exhaustive current verdicts. Mathematical findings and
prototype omissions are separated within each note.

| Node | Verdict | Assessment |
| --- | --- | --- |
| `O0/units-at-p` | verified | Finite-free left tensor algebra with the module topology; compactness uses the finite basis and the unit determinant locus, without a splitting assumption on p. |
| `O0/norm-at-p` | verified | The determinant norm is continuous in a finite basis and commutes with scalar extension; the cited norm is an algebraic input before restricting to units. |
| `O0/principal-units` | verified | The ideal p^r defines the principal-unit subgroup, including r=0; congruence quotients establish finite index and the pro-p assertion. |
| `O0/geometric-weight-characters` | verified | Continuous unit characters have the stated topology and multiplication; the discrete-codomain counterexample makes continuity a substantive condition. |
| `O0/arithmetic-weight-characters` | verified | The two arithmetic character coordinates have different source groups; the product character and its evaluation law retain both. |
| `O0/weight-dual-group-map` | verified | The inverse norm in the dual map produces the source’s later character convention; E1 is independently confirmed. |
| `O0/weight-comparison` | verified | Pullback along the corrected continuous group map gives the pointwise weight map; its rigid representing space is an explicit L0a supplier request. |
| `O0/weight-comparison-formula` | verified | Evaluation of the product character gives the square and inverse norm factor with the correct sign. |
| `O0/weight-comparison-norm-factor` | corrected | Removed the remaining quoted source clause and corrected the algebraic test: t is y↦y^b on Z_p×, while w=N^a on O_p×. |
| `O0/weight-comparison-totally-positive-units` | verified | A totally positive global unit has norm +1, so the remaining arithmetic character factor is trivial; no ordinary-class replacement is used. |
| `O0/weight-radius-parameter` | verified | The principal-unit supremum is a diagnostic, not an AIP universal coordinate; Teichmuller and power-character fixtures distinguish them. |
| `O0/continuous-character-bounded` | verified | Compact character image and the power-multiplicative norm give bounded values and inverses; the integral-character structure retains the stated coefficient assumptions. |
| `O0/analytic-continuation-of-bounded-weights` | unverifiable | Existential continuation on actual universal-coordinate charts is justified; the disproved scalar radius is excluded and the quantitative comparison is an explicit gap. Mathematical contract assessed as above, but 1 required node/API name(s) lack a typed declaration (§13). |
| `O0/bounded-weight-families` | unverifiable | Affinoid-image bounded families and their pullbacks depend on the requested rigid character space, rather than on the scalar supremum alone. Mathematical contract assessed as above, but 4 required node/API name(s) lack a typed declaration (§13). |
| `O0/finite-analytic-coefficients` | unverifiable | The baseline Representation supplies algebraic action only; finite projectivity, analytic orbit maps, canonical Banach topology and stable integral lattice remain separate data. Mathematical contract assessed as above, but 6 required node/API name(s) lack a typed declaration (§13). |
| `O0/coefficient-tensor-dual` | unverifiable | Finite-projective duals are contragredient; completed tensor operations use R0 with its specified lattices, without an arbitrary product O+ identification. Mathematical contract assessed as above, but 1 required node/API name(s) lack a typed declaration (§13). |
| `O0/analytic-induced-coefficients` | unverifiable | BP’s closed subgroup M_1, analytic Iwahori thickening and monoid hypotheses are retained; ordinary strong dual and projective distribution modules are distinct. Mathematical contract assessed as above, but 7 required node/API name(s) lack a typed declaration (§13). |
| `O0/algebraic-induced-comparison` | unverifiable | BP §6.2.11 retains the inverse Weyl-conjugated finite twist and kernel hypotheses; the algebraic subrepresentation is not asserted to fill analytic induction. Mathematical contract assessed as above, but 1 required node/API name(s) lack a typed declaration (§13). |
| `O0/unitary-completed-coefficients` | unverifiable | The definite-unitary completion keeps inverse limit in coefficient precision outside direct limit in level, other-p lattices and the inverse algebraic action. Mathematical contract assessed as above, but 4 required node/API name(s) lack a typed declaration (§13). |
| `O0/unitary-jacquet-eigenvariety` | unverifiable | The Jacquet eigenvariety uses the full noncompact torus character space and coherent strong dual, requested from its Part II owner rather than Buzzard’s compact engine. Mathematical contract assessed as above, but 1 required node/API name(s) lack a typed declaration (§13). |
| `O0/unitary-eigenvariety-geometry` | unverifiable | Ding Proposition4.14 supplies the dimension/regularity target; its definite-unitary admissibility and BHS inputs remain exact Part II proof requests. Mathematical contract assessed as above, but 1 required node/API name(s) lack a typed declaration (§13). |
| `O0/unitary-eigenvariety-reduced` | unverifiable | Reducedness uses the recorded classical-density and smooth-point inputs; it is not a consequence of a Banach representation or dimension formula alone. Mathematical contract assessed as above, but 1 required node/API name(s) lack a typed declaration (§13). |
| `O1/right-automorphy-cocycle` | verified | The right cocycle and inverse coefficient action preserve noncommuting order; the gauge maps and left-to-right adapter are typed algebraic cores with analytic conditions explicitly omitted. |
| `O1/equivariant-coefficient-sheaf` | unverifiable | The equalizer sheaf uses actual analytic functions, ringed sites and coefficient-sensitive torsor descent; arbitrary function sets are not substituted. Mathematical contract assessed as above, but 6 required node/API name(s) lack a typed declaration (§13). |
| `O1/coefficient-descent-functoriality` | unverifiable | Rational coefficient operations use effective descent; integral pullback retains flatness/chart-change assumptions rather than asserting exactness for all base changes. Mathematical contract assessed as above, but 1 required node/API name(s) lack a typed declaration (§13). |
| `O1/analytic-line-effectivity` | unverifiable | Heuer’s criterion is line-specific on a smooth rigid space over a perfectoid extension of Q_p; the formal-unit cocycle is not replaced by an arbitrary analytic O+ cocycle. Mathematical contract assessed as above, but 1 required node/API name(s) lack a typed declaration (§13). |
| `O2/admitted-hilbert-domain` | unverifiable | The character and canonical-domain intersection, ramification and AL radius scaling are retained; its carrier is a T4/T5/S5 request. Mathematical contract assessed as above, but 4 required node/API name(s) lack a typed declaration (§13). |
| `O2/hilbert-automorphy-factor` | corrected | Removed the hypothesis contradicting the left source action; the right interface now explicitly inverts the group element and coefficient cocycle. Mathematical contract assessed as above, but 4 required node/API name(s) lack a typed declaration (§13). |
| `O2/hilbert-cocycle-law` | unverifiable | The Hilbert cz+d identity is left ordered; the typed p=3 matrix fixture gives 7 for that law and 4 for the erroneous unconverted right law. Mathematical contract assessed as above, but 1 required node/API name(s) lack a typed declaration (§13). |
| `O2/geometric-hilbert-sheaf` | unverifiable | The rational equalizer becomes an analytic line through the stated effectivity contract; integral local freeness is not assumed here. Mathematical contract assessed as above, but 4 required node/API name(s) lack a typed declaration (§13). |
| `O2/hilbert-level-radius-maps` | unverifiable | AL_n transports p^n ε to ε, and n=0 uses AL_1; the radius is not silently held constant across levels. Mathematical contract assessed as above, but 1 required node/API name(s) lack a typed declaration (§13). |
| `O2/hilbert-algebraic-specialisation` | unverifiable | The algebraic weight comparison retains splitting coefficients and the actual modified differential lattice; the norm character gives the determinant line. Mathematical contract assessed as above, but 1 required node/API name(s) lack a typed declaration (§13). |
| `O3/integral-hilbert-sheaf` | unverifiable | The integral sheaf is defined by O+ eigenfunctions before freeness; rational comparison alone does not prove an integral line. Mathematical contract assessed as above, but 4 required node/API name(s) lack a typed declaration (§13). |
| `O3/integral-rationalisation` | corrected | Replaced the circular integral AIP-generator proof with a finite bounded-denominator argument on quasicompact inverse-image patches, removing the O5 prerequisite. Mathematical contract assessed as above, but 1 required node/API name(s) lack a typed declaration (§13). |
| `O3/hilbert-weight-pullback` | unverifiable | Sheaf pullback and weight specialization are distinct from arbitrary nonflat base change of integral global sections; the flat/formal-chart qualifications are retained. Mathematical contract assessed as above, but 1 required node/API name(s) lack a typed declaration (§13). |
| `O3/fixed-radius-hilbert-forms` | unverifiable | Fixed-radius forms are actual sections on each polarisation component and level, with their integral inclusion and specialization contracts. Mathematical contract assessed as above, but 4 required node/API name(s) lack a typed declaration (§13). |
| `O3/overconvergent-hilbert-forms` | unverifiable | The radius colimit has the prescribed restriction maps and cofinality; the zero-radius ordinary module is not substituted for overconvergent forms. Mathematical contract assessed as above, but 4 required node/API name(s) lack a typed declaration (§13). |
| `O3/ramified-modified-lattice` | unverifiable | At ramified non-Rapoport points the modified O_F-linear lattice is on the Igusa cover; descent to a base line is a further condition. Mathematical contract assessed as above, but 1 required node/API name(s) lack a typed declaration (§13). |
| `O4/presentation-geometric-small` | unverifiable | The small geometric presentation is defined independently with its actual level action and scalar multiplier. Mathematical contract assessed as above, but 4 required node/API name(s) lack a typed declaration (§13). |
| `O4/presentation-geometric-full` | unverifiable | The full geometric cover retains the central closure/effective quotient and its independent equivariance condition. Mathematical contract assessed as above, but 4 required node/API name(s) lack a typed declaration (§13). |
| `O4/presentation-arithmetic-intermediate` | unverifiable | The arithmetic intermediate presentation uses the twisted w action, with finite Δ distinct from the full profinite quotient. Mathematical contract assessed as above, but 4 required node/API name(s) lack a typed declaration (§13). |
| `O4/presentation-arithmetic-full` | unverifiable | The full arithmetic presentation retains actual Weil pairing, determinant and profinite equivariance, without identifying it by definition with the intermediate presentation. Mathematical contract assessed as above, but 4 required node/API name(s) lack a typed declaration (§13). |
| `O4/arithmetic-representatives` | unverifiable | Positive-unit and congruence relations make the representative rule well-defined; ineffective central units must act trivially on the fibre. Mathematical contract assessed as above, but 1 required node/API name(s) lack a typed declaration (§13). |
| `O4/geometric-full-cover-comparison` | unverifiable | The full/small geometric comparison uses the actual torsor maps and invariant-function descent, not equality of abstract dimensions. Mathematical contract assessed as above, but 1 required node/API name(s) lack a typed declaration (§13). |
| `O4/twisted-polarisation-action` | unverifiable | The polarisation action ε·_w f=w(ε)(ε⁻¹)*f retains its inverse and the totally-positive-unit cancellation. Mathematical contract assessed as above, but 4 required node/API name(s) lack a typed declaration (§13). |
| `O4/finite-polarisation-descent` | unverifiable | Finite twisted Δ descent is taken integrally without dividing by its order; rational projectors alone do not establish integral effectivity. Mathematical contract assessed as above, but 1 required node/API name(s) lack a typed declaration (§13). |
| `O4/weil-pairing-comparison` | unverifiable | Multiplication by w(eβ)⁻¹ gives the specified Weil-pairing comparison and both inverse signs are retained. Mathematical contract assessed as above, but 1 required node/API name(s) lack a typed declaration (§13). |
| `O4/polarisation-class-forms` | unverifiable | The narrow-class quotient combines the separate component modules using explicit transport, rather than choosing an ordinary-class quotient. Mathematical contract assessed as above, but 4 required node/API name(s) lack a typed declaration (§13). |
| `O4/polarisation-choice-independence` | unverifiable | Polarisation independence follows through the actual transport and pairing diagrams; geometric operators retain their specified conjugation. Mathematical contract assessed as above, but 1 required node/API name(s) lack a typed declaration (§13). |
| `O5/aip-independent-coefficients` | corrected | Corrected the stale formal-generic-fibre acceptance clause: analytic O/O+ eigenfunctions, the universal formal line and the coherent finite-character factor are separate constructions. Mathematical contract assessed as above, but 5 required node/API name(s) lack a typed declaration (§13). |
| `O5/aip-translation-valuation-units` | added | Promoted the translation-unit API argument to a named lemma. Integral formal-character units, the admitted small-character congruence and finite-order valuation values preserve both bounds at every valuation. Mathematical contract assessed as above, but 1 required node/API name(s) lack a typed declaration (§13). |
| `O5/aip-line-and-gluing` | corrected | The full-character unit-generator criterion is conditional; corrected the P9 citation’s scope by separating its completed lattice tensor from the requested geometric O+ sheaf variant. Mathematical contract assessed as above, but 1 required node/API name(s) lack a typed declaration (§13). |
| `O5/geometric-aip-comparison` | corrected | The valuative integral-equalizer proof is noncircular; added the exact T5 ε_base≤p^(−(m+1)) bound and scaled source admission, and the new valuation-unit lemma as an input. Mathematical contract assessed as above, but 1 required node/API name(s) lack a typed declaration (§13). |
| `O5/arithmetic-aip-comparison` | corrected | Arithmetic twisted invariants transport the integral comparison without averaging; explicitly inherited the corrected geometric comparison radius and source-domain requirements. Mathematical contract assessed as above, but 1 required node/API name(s) lack a typed declaration (§13). |
| `O5/aip-comparison-naturality` | corrected | Naturality follows from actual pullback/frame maps with weight and level transport; explicitly inherited the corrected T5 admission on the comparison diagrams. Mathematical contract assessed as above, but 1 required node/API name(s) lack a typed declaration (§13). |
| `O6/hilbert-cusp-forms` | corrected | Boundary-ideal cusp forms remain independent of Koecher; explicitly inherited the frame-comparison radius where the AIP cusp comparison is used. Mathematical contract assessed as above, but 4 required node/API name(s) lack a typed declaration (§13). |
| `O6/hilbert-koecher` | unverifiable | Koecher retains g>1, normality and boundary codimension; the elliptic case requires its separate cusp expansion calculation. Mathematical contract assessed as above, but 1 required node/API name(s) lack a typed declaration (§13). |
| `O6/tame-hilbert-hecke` | unverifiable | Tame trace has degree q+1 and normalizer 1/q; the coefficient orientation and prime-to-p compactified correspondence scope are retained. Mathematical contract assessed as above, but 5 required node/API name(s) lack a typed declaration (§13). |
| `O6/wild-hilbert-hecke` | corrected | Replaced an integral-identification claim by the integral coefficient map of Lemma10.3; uniformizer independence and partial-radius improvement remain valid. Mathematical contract assessed as above, but 5 required node/API name(s) lack a typed declaration (§13). |
| `O6/hilbert-diamond-operators` | unverifiable | The tame level automorphisms and arithmetic twists give the diamond operators; their boundary and composition laws are explicit. Mathematical contract assessed as above, but 4 required node/API name(s) lack a typed declaration (§13). |
| `O6/aip-hecke-equivariance` | corrected | Hecke comparison is a torsor/isogeny diagram statement; source and target now explicitly inherit the corrected T5 frame-comparison admission. Mathematical contract assessed as above, but 1 required node/API name(s) lack a typed declaration (§13). |
| `O6/hilbert-q-expansion-comparison` | unverifiable | B5 supplies classical expansions only; analytic bounded families and p-level expansion compatibility remain a precise extension request with the same trace normalization. Mathematical contract assessed as above, but 1 required node/API name(s) lack a typed declaration (§13). |
| `O6/fixed-cusp-banach-modules` | corrected | Restricted direct use of AIP Theorem4.4 to its admissible open arithmetic weight affinoid; finite wild level uses scaled AL transport and boundary compatibility. Mathematical contract assessed as above, but 1 required node/API name(s) lack a typed declaration (§13). |
| `O6/compact-radius-restriction` | corrected | Compact restriction uses the refined global-Hasse affinoids and relative compact containment; inherited the source theorem’s admissible weight affinoid restriction. Mathematical contract assessed as above, but 1 required node/API name(s) lack a typed declaration (§13). |
| `O6/controlling-hilbert-operator` | unverifiable | The product ∏U_𝔭^e_𝔭 improves every p-direction and has total normalizer p^(−g); one partial operator need not be controlling. Mathematical contract assessed as above, but 4 required node/API name(s) lack a typed declaration (§13). |
| `O6/controlling-complete-continuity` | unverifiable | Completely continuous restriction and radius-improving factorization give the controlling compact operator, with the stated (Pr) Banach source assumptions. Mathematical contract assessed as above, but 1 required node/API name(s) lack a typed declaration (§13). |
| `O6/hecke-lattice-renormalisation` | unverifiable | Multiplication by q_𝔭 or p^g removes the specified trace denominator; integral trace preservation is a separate contract, and no optimality is asserted. Mathematical contract assessed as above, but 1 required node/API name(s) lack a typed declaration (§13). |
| `O7/ordinary-completed-functions` | unverifiable | Formal affine ordered completion is constructed separately from analytic O+; patchwise sheafification prevents a false global finite-level assertion. Mathematical contract assessed as above, but 5 required node/API name(s) lack a typed declaration (§13). |
| `O7/ordinary-weighted-forms` | unverifiable | Weighted ordinary functions keep the inverse character and integral compatible reductions, with the separate coefficient-lattice completion contract. Mathematical contract assessed as above, but 5 required node/API name(s) lack a typed declaration (§13). |
| `O7/igusa-completion-comparison` | unverifiable | The unit-ball approximation proof is valid under finite-level good reduction, isometric maps and the actual analytic norm-completion contract. Those actual-model inputs remain requested; Heuer supplies only the natural map. Mathematical contract assessed as above, but 1 required node/API name(s) lack a typed declaration (§13). |
| `O7/ordinary-restriction` | unverifiable | Ordinary restriction uses actual compatible formal patches and remains bounded on the stated integral lattice; it does not identify all ordinary functions with overconvergent forms. Mathematical contract assessed as above, but 5 required node/API name(s) lack a typed declaration (§13). |
| `O7/ordinary-coefficient-comparison` | unverifiable | The ordinary coefficient comparison combines formal torsor descent and the conditional O7 structural comparison; it does not infer a Hida control theorem. Mathematical contract assessed as above, but 1 required node/API name(s) lack a typed declaration (§13). |
| `O7/ordinary-hecke-expansions` | unverifiable | Restriction, Hecke and expansion diagrams commute through the compatible reductions and ordered completion; the coefficient comparison alone is not a space-level Hida theorem. Mathematical contract assessed as above, but 1 required node/API name(s) lack a typed declaration (§13). |
| `O6/cuspidal-coefficient-vanishing` | unverifiable | The AIP formal fan/unit quotient vanishing and formal-functions adapter remain a compactification Part II input; the actual global-Hasse affinoid refinement is retained. Mathematical contract assessed as above, but 1 required node/API name(s) lack a typed declaration (§13). |

## Absent typed node/API names

The list excludes all comments and counts each proposed name once.

### OverconvergentAutomorphicForms:O0

```text
TauCeti.Overconvergent.algebraic_induced_comparison
TauCeti.Overconvergent.analytic_continuation_of_bounded_weights
TauCeti.Overconvergent.analytic_induced_coefficients
TauCeti.Overconvergent.analytic_induced_coefficients.continuousDual
TauCeti.Overconvergent.analytic_induced_coefficients.distributions
TauCeti.Overconvergent.analytic_induced_coefficients.equivariance
TauCeti.Overconvergent.analytic_induced_coefficients.leftAction
TauCeti.Overconvergent.analytic_induced_coefficients.restrictRadius
TauCeti.Overconvergent.analytic_induced_coefficients.unipotentChart
TauCeti.Overconvergent.bounded_weight_families
TauCeti.Overconvergent.bounded_weight_families.character
TauCeti.Overconvergent.bounded_weight_families.ext
TauCeti.Overconvergent.bounded_weight_families.pullback
TauCeti.Overconvergent.coefficient_tensor_dual
TauCeti.Overconvergent.finite_analytic_coefficients
TauCeti.Overconvergent.finite_analytic_coefficients.action
TauCeti.Overconvergent.finite_analytic_coefficients.algebraic
TauCeti.Overconvergent.finite_analytic_coefficients.changeScalars
TauCeti.Overconvergent.finite_analytic_coefficients.dual
TauCeti.Overconvergent.finite_analytic_coefficients.tensor
TauCeti.Overconvergent.unitary_completed_coefficients
TauCeti.Overconvergent.unitary_completed_coefficients.groupAction
TauCeti.Overconvergent.unitary_completed_coefficients.localRegular
TauCeti.Overconvergent.unitary_completed_coefficients.modPower
TauCeti.Overconvergent.unitary_eigenvariety_geometry
TauCeti.Overconvergent.unitary_eigenvariety_reduced
TauCeti.Overconvergent.unitary_jacquet_eigenvariety
```

### OverconvergentAutomorphicForms:O1

```text
TauCeti.Overconvergent.analytic_line_effectivity
TauCeti.Overconvergent.coefficient_descent_functoriality
TauCeti.Overconvergent.equivariant_coefficient_sheaf
TauCeti.Overconvergent.equivariant_coefficient_sheaf.coefficientMap
TauCeti.Overconvergent.equivariant_coefficient_sheaf.integralInclusion
TauCeti.Overconvergent.equivariant_coefficient_sheaf.pullback
TauCeti.Overconvergent.equivariant_coefficient_sheaf.sections
TauCeti.Overconvergent.equivariant_coefficient_sheaf.tensorMap
```

### OverconvergentAutomorphicForms:O2

```text
TauCeti.Overconvergent.admitted_hilbert_domain
TauCeti.Overconvergent.admitted_hilbert_domain.atkinLehner
TauCeti.Overconvergent.admitted_hilbert_domain.periodCoordinate
TauCeti.Overconvergent.admitted_hilbert_domain.restrict
TauCeti.Overconvergent.geometric_hilbert_sheaf
TauCeti.Overconvergent.geometric_hilbert_sheaf.localRank
TauCeti.Overconvergent.geometric_hilbert_sheaf.restriction
TauCeti.Overconvergent.geometric_hilbert_sheaf.sections
TauCeti.Overconvergent.hilbert_algebraic_specialisation
TauCeti.Overconvergent.hilbert_automorphy_factor
TauCeti.Overconvergent.hilbert_automorphy_factor.apply
TauCeti.Overconvergent.hilbert_automorphy_factor.unit
TauCeti.Overconvergent.hilbert_automorphy_factor.weightPullback
TauCeti.Overconvergent.hilbert_cocycle_law
TauCeti.Overconvergent.hilbert_level_radius_maps
```

### OverconvergentAutomorphicForms:O3

```text
TauCeti.Overconvergent.fixed_radius_hilbert_forms
TauCeti.Overconvergent.fixed_radius_hilbert_forms.evaluateWeight
TauCeti.Overconvergent.fixed_radius_hilbert_forms.integralInclusion
TauCeti.Overconvergent.fixed_radius_hilbert_forms.restrict
TauCeti.Overconvergent.hilbert_weight_pullback
TauCeti.Overconvergent.integral_hilbert_sheaf
TauCeti.Overconvergent.integral_hilbert_sheaf.inclusion
TauCeti.Overconvergent.integral_hilbert_sheaf.restrict
TauCeti.Overconvergent.integral_hilbert_sheaf.sections
TauCeti.Overconvergent.integral_rationalisation
TauCeti.Overconvergent.overconvergent_hilbert_forms
TauCeti.Overconvergent.overconvergent_hilbert_forms.cofinal
TauCeti.Overconvergent.overconvergent_hilbert_forms.lift
TauCeti.Overconvergent.overconvergent_hilbert_forms.ofRadius
TauCeti.Overconvergent.ramified_modified_lattice
```

### OverconvergentAutomorphicForms:O4

```text
TauCeti.Overconvergent.arithmetic_representatives
TauCeti.Overconvergent.finite_polarisation_descent
TauCeti.Overconvergent.geometric_full_cover_comparison
TauCeti.Overconvergent.polarisation_choice_independence
TauCeti.Overconvergent.polarisation_class_forms
TauCeti.Overconvergent.polarisation_class_forms.ofIdeal
TauCeti.Overconvergent.polarisation_class_forms.representatives
TauCeti.Overconvergent.polarisation_class_forms.transportRelation
TauCeti.Overconvergent.presentation_arithmetic_full
TauCeti.Overconvergent.presentation_arithmetic_full.integralInclusion
TauCeti.Overconvergent.presentation_arithmetic_full.pullback
TauCeti.Overconvergent.presentation_arithmetic_full.sections
TauCeti.Overconvergent.presentation_arithmetic_intermediate
TauCeti.Overconvergent.presentation_arithmetic_intermediate.integralInclusion
TauCeti.Overconvergent.presentation_arithmetic_intermediate.pullback
TauCeti.Overconvergent.presentation_arithmetic_intermediate.sections
TauCeti.Overconvergent.presentation_geometric_full
TauCeti.Overconvergent.presentation_geometric_full.integralInclusion
TauCeti.Overconvergent.presentation_geometric_full.pullback
TauCeti.Overconvergent.presentation_geometric_full.sections
TauCeti.Overconvergent.presentation_geometric_small
TauCeti.Overconvergent.presentation_geometric_small.integralInclusion
TauCeti.Overconvergent.presentation_geometric_small.pullback
TauCeti.Overconvergent.presentation_geometric_small.sections
TauCeti.Overconvergent.twisted_polarisation_action
TauCeti.Overconvergent.twisted_polarisation_action.apply
TauCeti.Overconvergent.twisted_polarisation_action.finiteAction
TauCeti.Overconvergent.twisted_polarisation_action.mul
TauCeti.Overconvergent.weil_pairing_comparison
```

### OverconvergentAutomorphicForms:O5

```text
TauCeti.Overconvergent.aip_comparison_naturality
TauCeti.Overconvergent.aip_independent_coefficients
TauCeti.Overconvergent.aip_independent_coefficients.eigencondition
TauCeti.Overconvergent.aip_independent_coefficients.finiteFactor
TauCeti.Overconvergent.aip_independent_coefficients.integralInclusion
TauCeti.Overconvergent.aip_independent_coefficients.restrictChart
TauCeti.Overconvergent.aip_line_and_gluing
TauCeti.Overconvergent.aip_translation_valuation_units
TauCeti.Overconvergent.arithmetic_aip_comparison
TauCeti.Overconvergent.geometric_aip_comparison
```

### OverconvergentAutomorphicForms:O6

```text
TauCeti.Overconvergent.aip_hecke_equivariance
TauCeti.Overconvergent.compact_radius_restriction
TauCeti.Overconvergent.controlling_complete_continuity
TauCeti.Overconvergent.controlling_hilbert_operator
TauCeti.Overconvergent.controlling_hilbert_operator.normalizer
TauCeti.Overconvergent.controlling_hilbert_operator.product
TauCeti.Overconvergent.controlling_hilbert_operator.radiusFactorisation
TauCeti.Overconvergent.cuspidal_coefficient_vanishing
TauCeti.Overconvergent.fixed_cusp_banach_modules
TauCeti.Overconvergent.hecke_lattice_renormalisation
TauCeti.Overconvergent.hilbert_cusp_forms
TauCeti.Overconvergent.hilbert_cusp_forms.boundaryKernel
TauCeti.Overconvergent.hilbert_cusp_forms.inclusion
TauCeti.Overconvergent.hilbert_cusp_forms.restrict
TauCeti.Overconvergent.hilbert_diamond_operators
TauCeti.Overconvergent.hilbert_diamond_operators.apply
TauCeti.Overconvergent.hilbert_diamond_operators.cusp
TauCeti.Overconvergent.hilbert_diamond_operators.mul
TauCeti.Overconvergent.hilbert_koecher
TauCeti.Overconvergent.hilbert_q_expansion_comparison
TauCeti.Overconvergent.tame_hilbert_hecke
TauCeti.Overconvergent.tame_hilbert_hecke.component
TauCeti.Overconvergent.tame_hilbert_hecke.cusp
TauCeti.Overconvergent.tame_hilbert_hecke.formula
TauCeti.Overconvergent.tame_hilbert_hecke.integral
TauCeti.Overconvergent.wild_hilbert_hecke
TauCeti.Overconvergent.wild_hilbert_hecke.cusp
TauCeti.Overconvergent.wild_hilbert_hecke.formula
TauCeti.Overconvergent.wild_hilbert_hecke.partialRadius
TauCeti.Overconvergent.wild_hilbert_hecke.uniformiserIndependent
```

### OverconvergentAutomorphicForms:O7

```text
TauCeti.Overconvergent.igusa_completion_comparison
TauCeti.Overconvergent.ordinary_coefficient_comparison
TauCeti.Overconvergent.ordinary_completed_functions
TauCeti.Overconvergent.ordinary_completed_functions.levelAction
TauCeti.Overconvergent.ordinary_completed_functions.modPower
TauCeti.Overconvergent.ordinary_completed_functions.rationalise
TauCeti.Overconvergent.ordinary_completed_functions.restriction
TauCeti.Overconvergent.ordinary_hecke_expansions
TauCeti.Overconvergent.ordinary_restriction
TauCeti.Overconvergent.ordinary_restriction.cusp
TauCeti.Overconvergent.ordinary_restriction.integral
TauCeti.Overconvergent.ordinary_restriction.levelWeight
TauCeti.Overconvergent.ordinary_restriction.ofRadius
TauCeti.Overconvergent.ordinary_weighted_forms
TauCeti.Overconvergent.ordinary_weighted_forms.arithmeticDescent
TauCeti.Overconvergent.ordinary_weighted_forms.integralInclusion
TauCeti.Overconvergent.ordinary_weighted_forms.weightPullback
TauCeti.Overconvergent.ordinary_weighted_forms.weightRelation
```
