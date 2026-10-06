# REV-OverconvergentAutomorphicForms--O0: needs changes

Independent reviewer: **Codex — codex-9KQB8Y**, 6 October 2026. Refs #522.
This is a finished independent review, not a checkpoint. The input plan was
written by Codex session `codex-fFIzYb` in [PR #6737](https://github.com/CBirkbeck/tauceti-explorer/pull/6737),
merged at `61766febc2900adb90e65a43b90eda44585282c2`. The clone's reviewed
snapshot is `05c105bdee3284bfc9781aab07eabb1594ff8cb2`.

The [packet](../packets/OverconvergentAutomorphicForms--O0.json) records every
node's verdict. Sources, each locator/excerpt, hypotheses, proof dependencies,
API, tests and planets were checked across O0–O7. All 38 library declarations
were independently read at the exact pinned commits. The clear fixes are applied
in place. Three targets remain unverifiable: the full finite-character integral
AIP line/gluing and its integral comparison, and the actual analytic Igusa O+
completion comparison. Their missing inputs are recorded rather than assumed.
These are unresolved blueprint proof/interface steps; this review does not claim
that the published integral comparison theorem is false.

| Inventory | Before | After |
| --- | ---: | ---: |
| Nodes | 73 | 73 |
| Definitions / constructions | 5 / 30 | 5 / 30 |
| Lemmas / theorems / comparisons / applications | 4 / 20 / 12 / 2 | 4 / 20 / 12 / 2 |
| API items | 117 | 126 |
| Test contracts | 107 | 108 |
| Planets | 32 | 32 |
| Baseline citations | 38 | 38 |
| Supplier requests | 13 | 13 |
| Explicit gaps | 11 | 13 |
| Planned / closed stages | 8 / 0 | 8 / 0 |

There are 47 `verified`, 23 `corrected` and three `unverifiable` entries. Twenty-six
nodes were edited, including the three unverifiable targets. No node was added,
split or deleted, and no baseline citation was removed or replaced. Target-level
granularity remains appropriate. The `complete` status means this planning pass
is finished: the eight stage targets are realised, and their chains end in
baseline inputs, exact supplier nodes, stage requests or recorded gaps. It does
not mean that those external inputs are proved. All implementation statuses remain
`unchecked`; nothing is represented as formalised.

## Remaining mathematical inputs

**Full finite-character integral AIP comparison (O5).** In the public author
[AIP ADIC PDF](https://www.imo.universite-paris-saclay.fr/~vincent.pilloni/Hilbert_adicfinal.pdf),
Proposition 4.3 (pp16–17) and Proposition 4.7 (p18) concern the universal formal
character on W_F^0. The full-character construction in §6.4 (p29) tensors the
finite-character factor wχ: the text calls it coherent and states invertibility
on the ordinary locus and analytic fibre. It does not thereby identify its entire
integral analytic O+ lattice as an invertible line.
[BHW Proposition 7.10](https://aif.centre-mersenne.org/item/10.5802/aif.3560.pdf)
(p1762) suppresses this extra factor in the recalled construction. A revision must
supply the actual full-character integral local generator and chart transport,
or a coefficient-sensitive integral descent proof that settles them. Universal
formal freeness, rational freeness and ordinary-locus freeness alone do not prove
the requested integral statement on positive-radius domains.

Theorem 7.14's blueprint proof also assumed that both integral sheaves were
already lines, while O3 used this comparison to obtain integral local freeness.
The corrected sufficient argument pulls back an independently constructed AIP
generator to a unit f in the cover O+. Any equivariant g then has invariant
integral ratio g/f, which descends to base O+. The full finite-character unit
criterion remains unverified. `aip-line-and-gluing` and
`geometric-aip-comparison` therefore receive `unverifiable`, while the arithmetic,
Hecke and ordinary consequences are explicitly conditional on that input.
The P9/T5 requests and O5 gap identify the needed contract.

**Formal completion versus actual analytic Igusa O+ (O7).**
[Heuer Proposition 3.8 and proof](https://www.cambridge.org/core/services/aop-cambridge-core/content/view/E9F0B6B21BA1F345142C7301C2EDDA28/S205050942200072Xa.pdf/line-bundles-on-rigid-spaces-in-the-v-topology.pdf)
(p16) constructs a natural equivariant map from completed formal tower functions
to analytic O+. It does not assert a general isomorphism. The formal cocycle
hypothesis is c:G→O(𝔛∞)×, not an arbitrary analytic O+-unit cocycle.

Even a constant topologically finite-type formal tower need not identify its
structural ring with analytic power-bounded functions. For
R=O_K⟨pT,T²,T³⟩, the element T=(pT)/p belongs to the generic fibre, is integral
and power-bounded because T² is bounded, but T is absent from R (the linear
coefficient in R is divisible by p). Thus the natural completion map alone does
not prove surjectivity. This counterexample concerns arbitrary nonnormal models,
not the actual Igusa tower. P9/T5 must establish the exact normality/integral-closure,
completion and topology hypotheses for those actual models and prove the local
isomorphism. `igusa-completion-comparison` receives `unverifiable`. O7 now constructs
lim_m colim_i of formal reductions separately, sheafifies patchwise, and leaves
its analytic identification as the comparison target.

## Corrections applied

The following is the exhaustive node change log; stable node IDs and all existing
planets are retained. The `checked` register also records the other 47 nodes.

| Node | Correction or remaining verification |
| --- | --- |
| `O0/geometric-weight-characters` | Replaced an unsupported alleged discontinuous Q_p-valued hom with the same p-adic ring equipped with discrete topology; continuity is a real condition. |
| `O0/analytic-continuation-of-bounded-weights` | Existential analytic extension is used on actual AIP charts; corrected BP locator and retained the unresolved quantitative coordinate comparison, not the disproved E3 formula. |
| `O0/coefficient-tensor-dual` | Corrected BP locators; finite-projective dual and tensor laws follow by direct-summand arguments and the R0 completed-tensor contract. |
| `O0/analytic-induced-coefficients` | Restored BP closed M1/Iwahori and torus-normalizing hypotheses; separated ordinary Banach dual from projective open-polydisc distributions and added their API. |
| `O0/algebraic-induced-comparison` | Corrected §6.2.11 locator; finite twist is w0χ inverse, with its actual kernel/monoid conditions; the dual comparison is not claimed universally surjective. |
| `O0/unitary-completed-coefficients` | Completed coefficients retain lim_m colim_i, inverse algebraic action and s≥1 for the nonempty Ding application; strengthened tests with the continuous digit-tower example. |
| `O1/right-automorphy-cocycle` | Added reusable extensionality, trivial cocycle, membership, gauge equivalence and evaluation API; converted left K by inverse group and inverse coefficient, preserving noncommuting order. |
| `O1/equivariant-coefficient-sheaf` | Corrected BHW Definition 6.5/Proposition 6.6 page; actual equivariant analytic sections and coefficient-sensitive descent are retained. |
| `O1/coefficient-descent-functoriality` | Corrected §9 lemma locators; operations and base change retain the specified integral flatness/chart hypotheses rather than unconditional integral exactness. |
| `O1/analytic-line-effectivity` | Restored Heuer perfectoid extension of Q_p, line-specific dense-open criterion and formal-unit cocycle hypothesis; no arbitrary analytic O+ cocycle or completion isomorphism substituted. |
| `O2/admitted-hilbert-domain` | Corrected the reversed AL radius acceptance test: level n maps p^n ε to ε, and n=0 is defined via AL1. |
| `O2/hilbert-automorphy-factor` | Restored BHW left equivariance f(γx)=κ(cz+d) inverse f(x); vector frame conversion uses O1 explicitly. |
| `O2/hilbert-cocycle-law` | Corrected the left cz+d law; the p=3 lower-unipotent/diagonal example gives 7 versus the erroneous right-law value 4. |
| `O2/geometric-hilbert-sheaf` | Geometric line uses the left scalar source multiplier and its explicit right-cocycle adapter; integral freeness is deferred to O5. |
| `O2/hilbert-level-radius-maps` | Corrected Remark 6.7 page and retained level/radius transport rather than silently constant AL radii. |
| `O2/hilbert-algebraic-specialisation` | Corrected classical norm-weight/determinant test and Remark 6.7 locator; weight 1 is not the determinant bundle. |
| `O3/integral-hilbert-sheaf` | Removed circular local-freeness assumption: this node constructs an integral equalizer, with freeness a later comparison output. |
| `O4/polarisation-choice-independence` | Corrected Remark 10.6 to p1791; independence follows through the explicit polarisation transport and pairing laws. |
| `O5/aip-independent-coefficients` | Separated universal formal eigenfunctions from §6.4 full finite-character coherent factor; analytic O/O+ eigenfunctions are defined independently. |
| `O5/aip-line-and-gluing` | Universal formal invertibility is sourced by AIP 4.3/4.7, but full finite-character analytic O+ generator and integral chart gluing are not established by those citations. Recorded exact gap. |
| `O5/geometric-aip-comparison` | Replaced circular both-are-lines argument by the sufficient pulled-back-unit-generator criterion; its full finite-character integral proof remains unverified. |
| `O6/hilbert-koecher` | Corrected AIP Proposition 8.4 locator to pp36–37 and retained degree-g>1 Koecher hypothesis and the F=Q exception. |
| `O6/controlling-hilbert-operator` | Corrected Lemma 3.25 to p22 and retained Lemma 3.27 p24; controlling operator is the stated product with its normalization. |
| `O7/ordinary-completed-functions` | Constructed ordered formal completion separately from analytic O+; strengthened limit-order and non-quasicompact sheaf/global-level tests. |
| `O7/igusa-completion-comparison` | Heuer 3.8 supplies a natural map only. Isomorphism for actual Igusa analytic O+ needs exact normality/integral-closure and completion hypotheses, which remain unverified. |
| `O7/ordinary-coefficient-comparison` | Corrected AIP ordinary-discussion locator to p37; the comparison retains full finite-character and O7 structural inputs rather than claiming freeness from generic fibre alone. |

The Hilbert source uses a **left** action. Its factor satisfies
j(γδ,x)=j(γ,δx)j(δ,x), with f(γx)=κ(j(γ,x))⁻¹f(x).
For a general left coefficient cocycle K, the right-action adapter is
x·γ=γ⁻¹x and J(γ,x)=K(γ⁻¹,x)⁻¹. Both inversions are necessary for noncommuting
coefficients. At p=3, γ=[[1,0],[3,1]], δ=diag(2,1), z=1, the correct identity
has value 7 and the unconverted right formula has value 4. The suggested file
includes this typed matrix fixture.

The nine added API items are the BP distribution-module projection contract and
eight O1 items: extensionality, trivial cocycle, membership characterization,
gauge compatibility, gauge equivalence, its forward and inverse evaluation
formulas, and the left-to-right constructor. Existing equivariance and gauge
entries were clarified as constructors. The new gauge-identity test joins
strengthened induction, finite-twist, completed-coefficient, equalizer-lattice and
Igusa limit-order tests. Every definition/construction has at least three test
contracts. They test trivial and nontrivial coefficients, wrong inverses/orders,
nonflat/integral distinctions, and sheaf/global-limit distinctions rather than
merely restating structure fields. No additional planet is needed for these API
refinements; the 32 named planets remain central definitions/constructions/theorems.

Packet-wide edits update the AIP author PDF to 40 pages, record §6.4 and the BP
distribution sections as read, independently confirm baseline entries and E1–E5,
add the two exact integral gaps, refine existing P9/T4/T5/S5 requests and coverage
notes, and record the upstream reader scope. The suggested mathematical register
is regenerated once for all 73 nodes, API entries, tests and gaps. No reader or
campaign document is modified; the next revision/assembly must synchronize its
reader with these corrections.

## Baseline and ownership audit

Mathlib is pinned at `082e2d37e8b0463410cdb532e111cd43d5a66174` and Tau Ceti at
`f790474821cf4256814db967cb154e7af3d0c369`. Each declaration and its surrounding
hypotheses was read, rather than inferred from the name index. Every entry remains
usable for its stated input. In particular, norm/conjugate-product formulas need
the finite-free/separable embedding conditions; determinant and finite-projective
base change are algebraic inputs; module topology needs the given topological
scalar ring; `Representation` has no analytic condition; `SheafOfModules` supplies
no adic ringed site. The narrow-class declarations retain total positivity and
number-field finiteness. No adic, perfectoid or Jacquet enhancement is inferred
from these library names.

| Confirmed declaration | Pinned source module |
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

The reviewed `data/library-coverage.json`, roadmap scopes and ownership rules were
screened before interpreting missing inputs. Nearby upstream AdicSpaces and
GlobalNumberFields reader documents were read in full. Those roadmaps are
consumed without edits or replanning. Existing exact supplier statements,
hypotheses and proof sketches were read for the following 15 node interfaces:

- `AutomorphicBundles:B5/hecke-section-operator`
- `AutomorphicBundles:B5/hilbert-cusp-expansion`
- `AutomorphicBundles:B5/hilbert-expansion-principle`
- `AutomorphicBundles:B5/hilbert-cuspidal-boundary`
- `AutomorphicBundles:B5/hecke-expansion-compatibility`
- `AutomorphicBundles:B0/ineffective-fibre-descent`
- `AutomorphicBundles:B0/sections-equivariant`
- `AdicSpacesPartII:R0/completed-tensor-banach-module`
- `AdicSpacesPartII:R3/tate-acyclicity-finite-modules`
- `AdicSpacesPartII:R3/restriction-strictly-completely-continuous`
- `AdicSpacesPartII:R3/analytic-trace-finite-locally-free`
- `AdicSpacesPartII:R3/pull-identify-trace`
- `AdicSpacesPartII:R5/perfectoid-times-smooth-fibre-product`
- `LocallyAnalyticDistributions:L4/completely-continuous`
- `LocallyAnalyticDistributions:L4/projective-banach-modules`

Stage-level T4/T5, H1/H3/H4, S5, P9, L0/L0a, B4/B5, C6 and CC.8 requests remain
precise about their additional contracts. In particular R3 `pull-identify-trace`
accepts a linear coefficient map, so no extra coefficient-isomorphism gap was
invented. LocallyAnalyticDistributions owns complete continuity and projective
Banach modules; C6 supplies compactification geometry, not the formal fan/unit
cusp cohomology theorem; CC.8 and PadicFamilies L2a do not supply the Jacquet
functor or Ding's local regularity inputs.

## Public sources and source findings

All seven public PDFs were fetched and their SHA-256 fingerprints matched the
packet. The node passages and their surrounding hypotheses were read; this does
not claim that every page of every paper was read. The exact URLs, editions,
pagination, fingerprints and read ranges are retained in `sources` and
`sourceVersions`. The additional AIP finite-character and Heuer formal-completion
passages are identified above. Other sources checked are:

- [BHW-ARXIV-V4: Overconvergent Hilbert modular forms via perfectoid modular varieties (arXiv version)](https://arxiv.org/pdf/1902.03985v4): Definition 6.1, Proposition 6.3 and Definition 7.1 compared with the version of record; the sign, radius and subgroup-order findings remain.
- [AIP-CUSP-2016: On overconvergent Hilbert Modular cusp forms](https://www.imo.universite-paris-saclay.fr/~pilloni/AIP2.pdf): §2 analytic characters; §§3.6–3.7 including Remark 3.15, Theorems 3.16–3.17, Corollary 3.20, Proposition 3.22 and its Hattori footnote, Lemma 3.27; §4 arithmetic action, Theorem 4.4 and Lemma 4.5. Appendix §6.3–6.4 was read; the exact formal cusp-cohomology input remains an owner gap.
- [BP-HIGHER: Higher Coleman theory](https://www.imo.universite-paris-saclay.fr/~pilloni/HigherColeman.pdf): §§6.2–6.3 pp147–155, including genuine adic induction, finite twists, algebraic injection, §6.2.20 open-polydisc distribution modules and Proposition6.3.6 dual comparison
- [DING-2025: p-adic Hodge parameters in the crystabelline representations of GL_n](https://pmihes.centre-mersenne.org/item/10.1007/s10240-025-00156-2.pdf): §4.2.2 pp66–67, coefficient setup, point/classical criterion and Proposition4.14 with its proof. arXiv v2 pp71–73 was also compared; the final locators use the published pagination.

All five existing source findings were independently confirmed and now name this
review in their verdicts:

| Finding | Confirmed point |
| --- | --- |
| E1 | The dual weight map needs the inverse norm to give the displayed formula and (9.1). |
| E2 | A nontrivial Teichmüller character has all-unit supremum 1 despite being a bounded weight; a pro-p diagnostic is distinct from universal coordinates. |
| E3 | At p=3, κ(4)=ζ9 disproves the printed product radius even after replacing the all-unit supremum by the pro-p one. |
| E4 | An O_F/p^m module has p^(mg) elements, not p^m in general degree g. |
| E5 | Remark 6.9's projective cusp-Banach citation is to AIP CUSP [3], not AIP ADIC [2]. |

Relevant published/preprint formulas and page images were compared. Recorded
journal/author/arXiv and web correction searches found no located erratum as of
6 October 2026; no authors were contacted. The two new integral gaps are not added
as confirmed errors in the papers, because this review has not established such
an error.

## Validation and follow-up

- `research/blueprint/intake.py check-files` on the four deliverables: **0 problems**. `git diff --check`: clean.
- `python3 scripts/check_blueprint.py research/blueprint/packets/OverconvergentAutomorphicForms--O0.json --json`: **0 errors, 0 warnings**, including declaration-index validation. Independent source reading separately confirms the baseline statements.
- `lean-check research/blueprint/suggested/OverconvergentAutomorphicForms--O0.lean`: **exit 0, 69 warnings, all declaration uses sorry**. The existing build uses the exact Mathlib pin; the file imports only Mathlib. The two Tau Ceti baseline entries were source-checked at their exact pin, not compiled through a differently pinned Tau Ceti checkout.
- The typed prefix has 29 anonymous examples (24 weight, four algebraic cocycle and one concrete left-Hilbert identity fixture). Analytic contracts and tests in the comment register are explicit omissions, not elaborated declarations or proofs. No fake geometry, unknown Prop condition, axiom or claim of formalisation is introduced.

Questions for the orchestrator: route the full finite-character integral generator
and Igusa analytic-completion contracts to T5/P9, preserve their exact integral
content, and obtain the necessary source/proof statements. Existing follow-ups
remain PadicFamilies, Part II (Jacquet eigenvarieties) and
ShimuraCompactifications, Part II (Hilbert cusp cohomology). A revision should
synchronize the reader, settle the three unverifiable targets, then obtain a fresh
independent review. None of these gaps authorizes duplicate planning of the
supplier roadmaps or a claim that O0–O7 are closed.
